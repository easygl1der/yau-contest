const { Plugin, MarkdownRenderer, renderMath, finishRenderMath } = require("obsidian");
const { Decoration, ViewPlugin, WidgetType } = require("@codemirror/view");

const INLINE_OPEN = "\\(";
const INLINE_CLOSE = "\\)";
const BLOCK_OPEN = "\\[";
const BLOCK_CLOSE = "\\]";

const IGNORED_SELECTOR = [
  "code",
  "pre",
  "script",
  "style",
  "textarea",
  "option",
  ".math",
  ".math-block",
  ".math-inline",
  ".katex",
  "mjx-container",
  ".latex-delimiter-compat"
].join(",");

function hasSupportedDelimiter(text) {
  return text.includes(INLINE_OPEN) || text.includes(BLOCK_OPEN);
}

function findNextOpening(text, start) {
  const inlineIndex = text.indexOf(INLINE_OPEN, start);
  const blockIndex = text.indexOf(BLOCK_OPEN, start);

  if (inlineIndex === -1 && blockIndex === -1) {
    return null;
  }

  if (inlineIndex !== -1 && (blockIndex === -1 || inlineIndex < blockIndex)) {
    return {
      index: inlineIndex,
      open: INLINE_OPEN,
      close: INLINE_CLOSE,
      display: false
    };
  }

  return {
    index: blockIndex,
    open: BLOCK_OPEN,
    close: BLOCK_CLOSE,
    display: true
  };
}

function splitMathText(text) {
  const parts = [];
  let cursor = 0;

  while (cursor < text.length) {
    const next = findNextOpening(text, cursor);
    if (!next) {
      parts.push({ type: "text", value: text.slice(cursor) });
      break;
    }

    if (next.index > cursor) {
      parts.push({ type: "text", value: text.slice(cursor, next.index) });
    }

    const contentStart = next.index + next.open.length;
    const closeIndex = text.indexOf(next.close, contentStart);

    if (closeIndex === -1) {
      parts.push({ type: "text", value: text.slice(next.index) });
      break;
    }

    parts.push({
      type: "math",
      value: text.slice(contentStart, closeIndex),
      raw: text.slice(next.index, closeIndex + next.close.length),
      display: next.display
    });
    cursor = closeIndex + next.close.length;
  }

  return parts;
}

function findLatexDelimiterRanges(text) {
  const ranges = [];
  let cursor = 0;
  let atLineStart = true;

  while (cursor < text.length) {
    if (atLineStart) {
      const lineEnd = getLineEnd(text, cursor);
      const line = text.slice(cursor, lineEnd);
      const fence = matchFence(line);

      if (fence) {
        cursor = lineEnd;
        atLineStart = true;

        while (cursor < text.length) {
          const nextLineEnd = getLineEnd(text, cursor);
          const nextLine = text.slice(cursor, nextLineEnd);
          cursor = nextLineEnd;
          atLineStart = true;

          if (isClosingFence(nextLine, fence)) {
            break;
          }
        }
        continue;
      }
    }

    if (text[cursor] === "`") {
      let tickCount = 1;
      while (text[cursor + tickCount] === "`") {
        tickCount += 1;
      }

      const ticks = "`".repeat(tickCount);
      const closingIndex = text.indexOf(ticks, cursor + tickCount);

      if (closingIndex !== -1) {
        const codeSpan = text.slice(cursor, closingIndex + tickCount);
        atLineStart = codeSpan.endsWith("\n");
        cursor = closingIndex + tickCount;
        continue;
      }
    }

    let open = null;
    if (text.startsWith(INLINE_OPEN, cursor)) {
      open = {
        open: INLINE_OPEN,
        close: INLINE_CLOSE,
        display: false
      };
    } else if (text.startsWith(BLOCK_OPEN, cursor)) {
      open = {
        open: BLOCK_OPEN,
        close: BLOCK_CLOSE,
        display: true
      };
    }

    if (open) {
      const contentStart = cursor + open.open.length;
      const closeIndex = text.indexOf(open.close, contentStart);

      if (closeIndex !== -1) {
        const end = closeIndex + open.close.length;
        ranges.push({
          from: cursor,
          to: end,
          value: text.slice(contentStart, closeIndex),
          display: open.display
        });
        atLineStart = text.slice(cursor, end).endsWith("\n");
        cursor = end;
        continue;
      }
    }

    const char = text[cursor];
    atLineStart = char === "\n";
    cursor += 1;
  }

  return ranges;
}

function normalizeMathSegment(text) {
  return splitMathText(text).map((part) => {
    if (part.type === "text") {
      return part.value;
    }

    if (part.display) {
      const body = part.value.trim();
      return `$$\n${body}\n$$`;
    }

    return `$${part.value}$`;
  }).join("");
}

function getLineEnd(text, start) {
  const newline = text.indexOf("\n", start);
  return newline === -1 ? text.length : newline + 1;
}

function matchFence(line) {
  const match = line.match(/^ {0,3}(`{3,}|~{3,})/);
  if (!match) {
    return null;
  }

  return {
    marker: match[1][0],
    length: match[1].length
  };
}

function isClosingFence(line, fence) {
  const pattern = new RegExp(`^ {0,3}\\${fence.marker}{${fence.length},}`);
  return pattern.test(line);
}

function normalizeLatexDelimiters(text) {
  let output = "";
  let buffer = "";
  let cursor = 0;
  let atLineStart = true;

  const flushBuffer = () => {
    if (buffer.length > 0) {
      output += normalizeMathSegment(buffer);
      buffer = "";
    }
  };

  while (cursor < text.length) {
    if (atLineStart) {
      const lineEnd = getLineEnd(text, cursor);
      const line = text.slice(cursor, lineEnd);
      const fence = matchFence(line);

      if (fence) {
        flushBuffer();
        output += line;
        cursor = lineEnd;
        atLineStart = true;

        while (cursor < text.length) {
          const nextLineEnd = getLineEnd(text, cursor);
          const nextLine = text.slice(cursor, nextLineEnd);
          output += nextLine;
          cursor = nextLineEnd;
          atLineStart = true;

          if (isClosingFence(nextLine, fence)) {
            break;
          }
        }
        continue;
      }
    }

    if (text[cursor] === "`") {
      let tickCount = 1;
      while (text[cursor + tickCount] === "`") {
        tickCount += 1;
      }

      const ticks = "`".repeat(tickCount);
      const closingIndex = text.indexOf(ticks, cursor + tickCount);

      if (closingIndex !== -1) {
        flushBuffer();
        const codeSpan = text.slice(cursor, closingIndex + tickCount);
        output += codeSpan;
        atLineStart = codeSpan.endsWith("\n");
        cursor = closingIndex + tickCount;
        continue;
      }
    }

    const char = text[cursor];
    buffer += char;
    atLineStart = char === "\n";
    cursor += 1;
  }

  flushBuffer();
  return output;
}

function shouldIgnoreTextNode(node) {
  const parent = node.parentElement;
  return !parent || parent.closest(IGNORED_SELECTOR) !== null;
}

function replaceTextNode(node) {
  const text = node.nodeValue || "";
  const parts = splitMathText(text);

  if (!parts.some((part) => part.type === "math")) {
    return false;
  }

  const fragment = document.createDocumentFragment();
  let renderedAny = false;

  for (const part of parts) {
    if (part.type === "text") {
      if (part.value.length > 0) {
        fragment.appendChild(document.createTextNode(part.value));
      }
      continue;
    }

    try {
      const mathEl = renderMath(part.value.trim(), part.display);
      mathEl.classList.add("latex-delimiter-compat");
      fragment.appendChild(mathEl);
      renderedAny = true;
    } catch (error) {
      fragment.appendChild(document.createTextNode(part.raw));
      console.warn("LaTeX Delimiter Compat: failed to render math", error);
    }
  }

  if (node.parentNode) {
    node.parentNode.replaceChild(fragment, node);
  }

  return renderedAny;
}

function processElement(root) {
  if (!root || typeof document === "undefined") {
    return;
  }

  const walker = document.createTreeWalker(
    root,
    NodeFilter.SHOW_TEXT,
    {
      acceptNode(node) {
        const text = node.nodeValue || "";
        if (!hasSupportedDelimiter(text) || shouldIgnoreTextNode(node)) {
          return NodeFilter.FILTER_REJECT;
        }
        return NodeFilter.FILTER_ACCEPT;
      }
    }
  );

  const nodes = [];
  let current = walker.nextNode();
  while (current) {
    nodes.push(current);
    current = walker.nextNode();
  }

  let renderedAny = false;
  for (const node of nodes) {
    renderedAny = replaceTextNode(node) || renderedAny;
  }

  if (renderedAny) {
    finishRenderMath();
  }
}

function rangeTouchesSelection(range, selection) {
  for (const selected of selection.ranges) {
    if (selected.from <= range.to && selected.to >= range.from) {
      return true;
    }
  }
  return false;
}

class MathPreviewWidget extends WidgetType {
  constructor(value, display) {
    super();
    this.value = value;
    this.display = display;
  }

  eq(other) {
    return other.value === this.value && other.display === this.display;
  }

  toDOM() {
    const container = document.createElement(this.display ? "div" : "span");
    container.className = this.display
      ? "latex-delimiter-compat-widget latex-delimiter-compat-widget-block"
      : "latex-delimiter-compat-widget latex-delimiter-compat-widget-inline";

    try {
      container.appendChild(renderMath(this.value.trim(), this.display));
      finishRenderMath();
    } catch (error) {
      container.textContent = this.display
        ? `\\[\n${this.value}\n\\]`
        : `\\(${this.value}\\)`;
      console.warn("LaTeX Delimiter Compat: failed to render editor math", error);
    }

    return container;
  }

  ignoreEvent() {
    return false;
  }
}

function buildEditorDecorations(view) {
  const text = view.state.doc.toString();
  const ranges = findLatexDelimiterRanges(text);
  const decorations = [];

  for (const range of ranges) {
    if (rangeTouchesSelection(range, view.state.selection)) {
      continue;
    }

    decorations.push(
      Decoration.replace({
        widget: new MathPreviewWidget(range.value, range.display),
        block: range.display,
        inclusiveStart: false,
        inclusiveEnd: false
      }).range(range.from, range.to)
    );
  }

  return Decoration.set(decorations, true);
}

const latexDelimiterEditorExtension = ViewPlugin.fromClass(class {
  constructor(view) {
    this.decorations = buildEditorDecorations(view);
  }

  update(update) {
    if (update.docChanged || update.viewportChanged || update.selectionSet) {
      this.decorations = buildEditorDecorations(update.view);
    }
  }
}, {
  decorations: (plugin) => plugin.decorations
});

async function renderMarkdownCompat(app, markdown, el, sourcePath, component) {
  if (typeof MarkdownRenderer.render === "function") {
    await MarkdownRenderer.render(app, markdown, el, sourcePath, component);
    return;
  }

  if (typeof MarkdownRenderer.renderMarkdown === "function") {
    await MarkdownRenderer.renderMarkdown(markdown, el, sourcePath, component);
  }
}

class LatexDelimiterCompatPlugin extends Plugin {
  async onload() {
    this.registerEditorExtension(latexDelimiterEditorExtension);

    this.registerMarkdownPostProcessor(async (el, ctx) => {
      const sectionInfo = ctx && typeof ctx.getSectionInfo === "function"
        ? ctx.getSectionInfo(el)
        : null;
      const source = sectionInfo && (sectionInfo.text || sectionInfo.source);

      if (source && hasSupportedDelimiter(source)) {
        const normalized = normalizeLatexDelimiters(source);
        if (normalized !== source) {
          el.replaceChildren();
          el.classList.add("latex-delimiter-compat-rendered");
          await renderMarkdownCompat(this.app, normalized, el, ctx.sourcePath, this);
          return;
        }
      }

      processElement(el);
    });

    this.addCommand({
      id: "normalize-latex-delimiters-in-selection",
      name: "Normalize \\(...\\) and \\[...\\] delimiters in selection",
      editorCallback: (editor) => {
        const selection = editor.getSelection();
        if (!selection) {
          return;
        }
        editor.replaceSelection(normalizeLatexDelimiters(selection));
      }
    });

    this.addCommand({
      id: "normalize-latex-delimiters-in-current-note",
      name: "Normalize \\(...\\) and \\[...\\] delimiters in current note",
      editorCallback: (editor) => {
        const cursor = editor.getCursor();
        editor.setValue(normalizeLatexDelimiters(editor.getValue()));
        editor.setCursor(cursor);
      }
    });
  }
}

module.exports = LatexDelimiterCompatPlugin;
module.exports.__test = {
  findLatexDelimiterRanges,
  splitMathText,
  normalizeLatexDelimiters
};

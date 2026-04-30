---
name: latex-sidenote-manager
description: Add sidenotes, marginnotes, or footnotes to LaTeX documents in the yau-contest project. Use when the user wants to annotate problems, answer questions in notes, or add explanations to the margin of the kaobook-based document.
---

# LaTeX Sidenote Manager

This skill helps you manage annotations in the `yau-contest` LaTeX project. The project uses the `kaobook` class, which supports rich margin content.

## Supported Commands

- `\sidenote{...}`: Standard sidenote with a numbered reference in the text.
- `\marginnote{...}`: Note in the margin without a reference number in the text.
- `\footnote{...}`: Standard LaTeX footnote at the bottom of the page.

## Workflow

1. **Locate the Target**: Find the exact file and the surrounding text where the note should be placed. Content is usually in `latex-project/content/`.
2. **Formulate the Answer**: If the note answers a question, ensure the LaTeX is well-formatted (e.g., use `$...$` for inline math).
3. **Insert the Note**: Use the `add_latex_note.py` script provided in this skill for precise insertion.

## Script Usage

```bash
python scripts/add_latex_note.py <file_path> "<search_string>" "<note_content>" --type [sidenote|marginnote|footnote]
```

- `<file_path>`: Relative path from the project root.
- `<search_string>`: A unique string in the file after which the note will be placed.
- `<note_content>`: The LaTeX content of the note.
- `--type`: Defaults to `sidenote`.

## Guidelines

- **Contextual Awareness**: Sidenotes are best for short explanations or answers that relate directly to a specific term or equation.
- **No Math Environments**: NEVER place \sidenote, \marginnote, or \footnote inside math environments, including inline math (`$...$`), display math (`$$...$$`), or block environments like `\[...\]`, `\begin{equation}`, or `\begin{align}`. Always place them in the surrounding plain text to avoid compilation errors.
- **Math Formatting**: Always wrap math in standard LaTeX delimiters.
- **Verification**: After adding a note, ideally verify the compilation of the LaTeX project if requested.

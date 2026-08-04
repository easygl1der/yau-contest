import fs from 'node:fs/promises';
import path from 'node:path';

const sourceDir = path.resolve('ai-qe-review/notes');
const destinationDir = path.resolve('ai-qe-review/notes-en');
const host = process.env.OLLAMA_HOST;
const apiKey = process.env.OLLAMA_API_KEY;
if (!host || !apiKey) throw new Error('The protected Ollama gateway environment is unavailable.');

const files = (await fs.readdir(sourceDir)).filter((file) => file.endsWith('.md')).sort();
const sources = new Map();
for (const file of files) sources.set(file, await fs.readFile(path.join(sourceDir, file), 'utf8'));

const han = /[\p{Script=Han}]/u;
const translationCache = new Map();

function extractJson(response) {
  const trimmed = response.trim().replace(/^```json\s*/i, '').replace(/\s*```$/, '');
  const start = trimmed.indexOf('{');
  const end = trimmed.lastIndexOf('}');
  if (start === -1 || end === -1 || end < start) throw new Error('Model response did not contain JSON.');
  return JSON.parse(trimmed.slice(start, end + 1));
}

async function translateBatch(items, kind) {
  const untranslated = [...new Set(items.filter((item) => han.test(item) && !translationCache.has(item)))];
  const batches = [];
  let current = [];
  let currentLength = 0;
  for (const item of untranslated) {
    if (item.length > 3200) throw new Error(`${kind} item is too long (${item.length} characters).`);
    if (current.length && (currentLength + item.length > 7000 || current.length >= 50)) {
      batches.push(current);
      current = [];
      currentLength = 0;
    }
    current.push(item);
    currentLength += item.length;
  }
  if (current.length) batches.push(current);

  async function requestTranslations(texts) {
    const prompt = [
      'You are translating material for a PhD qualifying examination in machine learning, deep learning, optimization, reinforcement learning, and natural language processing.',
      'Translate every input string from Chinese into polished, rigorous academic English. Use canonical technical terminology: empirical risk, population risk, realizable PAC, agnostic PAC, uniform convergence, VC dimension, growth function, Sauer\'s lemma, Rademacher complexity, subgradient, subdifferential, smoothness, strong convexity, proximal operator, nonexpansiveness, and policy gradient.',
      'Keep every non-Chinese token exactly as it appears. Do not add commentary, list markers, Markdown fences, or newline characters. Return only a JSON object with one key, "translations", whose value is an array of strings in exactly the same order and length as the input array.',
      `Input array: ${JSON.stringify(texts)}`,
    ].join('\n\n');
    const response = await fetch(`${host.replace(/\/$/, '')}/api/generate`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        model: 'gemma4:26b',
        prompt,
        format: 'json',
        think: false,
        stream: false,
        options: { temperature: 0.2, num_ctx: 32768, num_predict: 4096 },
      }),
    });
    if (!response.ok) throw new Error(`${kind} translation request failed: HTTP ${response.status}`);
    const payload = await response.json();
    const parsed = extractJson(payload.response ?? '');
    if (!Array.isArray(parsed.translations) || parsed.translations.length !== texts.length) {
      throw new Error(`${kind} translation returned an invalid array.`);
    }
    return parsed.translations;
  }

  async function requestWithFallback(texts) {
    try {
      return await requestTranslations(texts);
    } catch (error) {
      if (texts.length === 1) throw error;
      const midpoint = Math.ceil(texts.length / 2);
      process.stderr.write(`${kind}: retrying ${texts.length} entries as two smaller batches\n`);
      return [
        ...(await requestWithFallback(texts.slice(0, midpoint))),
        ...(await requestWithFallback(texts.slice(midpoint))),
      ];
    }
  }

  for (let index = 0; index < batches.length; index += 1) {
    const texts = batches[index];
    const translations = await requestWithFallback(texts);
    for (let i = 0; i < texts.length; i += 1) {
      let translation = String(translations[i]).replace(/[\r\n]+/g, ' ');
      // A bilingual heading occasionally repeats its Chinese gloss after an
      // already-present English term; the English edition keeps only the term.
      translation = translation.replace(/\s*\([^)]*[\p{Script=Han}][^)]*\)/gu, '');
      if (han.test(translation)) throw new Error(`${kind} translation retained Chinese text: ${translation}`);
      translationCache.set(texts[i], translation);
    }
    process.stderr.write(`${kind}: ${index + 1}/${batches.length}\n`);
  }
}

function translated(text) {
  return han.test(text) ? translationCache.get(text) : text;
}

function parseWikilink(content) {
  const pipe = content.indexOf('|');
  const target = pipe === -1 ? content : content.slice(0, pipe);
  const label = pipe === -1 ? null : content.slice(pipe + 1);
  const hash = target.indexOf('#');
  return {
    note: hash === -1 ? target : target.slice(0, hash),
    anchor: hash === -1 ? null : target.slice(hash + 1),
    label,
  };
}

const headings = [];
for (const source of sources.values()) {
  for (const match of source.matchAll(/^#{1,6}\s+(.+?)\s*$/gm)) headings.push(match[1]);
}
await translateBatch(headings, 'heading');
const headingMap = new Map([...new Set(headings)].map((heading) => [heading, translated(heading)]));

const linkTexts = [];
for (const source of sources.values()) {
  for (const match of source.matchAll(/!?\[\[([^\]]+)\]\]/g)) {
    const { anchor, label } = parseWikilink(match[1]);
    if (anchor && !headingMap.has(anchor)) linkTexts.push(anchor);
    if (label) linkTexts.push(label);
  }
  for (const match of source.matchAll(/(?<!!)\[([^\]\n]+)\]\([^)\n]+\)/g)) linkTexts.push(match[1]);
}
await translateBatch(linkTexts, 'link label');

function transformWikilink(raw) {
  const embed = raw.startsWith('!') ? '!' : '';
  const content = raw.slice(embed.length + 2, -2);
  const { note, anchor, label } = parseWikilink(content);
  const mappedAnchor = anchor === null ? null : (headingMap.get(anchor) ?? translated(anchor));
  const mappedLabel = label === null ? null : translated(label);
  return `${embed}[[${note}${mappedAnchor === null ? '' : `#${mappedAnchor}`}${mappedLabel === null ? '' : `|${mappedLabel}`}]]`;
}

function transformMarkdownLink(raw) {
  const match = raw.match(/^\[([^\]]+)\]\(([^)]+)\)$/);
  if (!match) return raw;
  return `[${translated(match[1])}](${match[2]})`;
}

const fragmentRecords = [];
function markFragment(text) {
  if (!han.test(text)) return text;
  const match = text.match(/^(\s*)([\s\S]*?)(\s*)$/);
  const leading = match[1];
  const core = match[2];
  const trailing = match[3];
  if (!han.test(core)) return text;
  const id = fragmentRecords.length;
  fragmentRecords.push(core);
  return `${leading}\uE000${id}\uE001${trailing}`;
}

function transformPlainLine(line) {
  const listPrefix = line.match(/^(\s*(?:[-+*]\s+|\d+\.\s+|>\s+))/);
  const prefix = listPrefix ? listPrefix[1] : '';
  const rest = line.slice(prefix.length);
  const token = /!?\[\[[^\]]+\]\]|(?<!!)\[[^\]\n]+\]\([^)\n]+\)|\[@[^\]]+\]|`[^`\n]*`|\$(?:\\.|[^$\n])*\$|https?:\/\/[^\s)]+|\*\*|__|~~|\|/g;
  let result = prefix;
  let offset = 0;
  for (const match of rest.matchAll(token)) {
    result += markFragment(rest.slice(offset, match.index));
    const raw = match[0];
    if (raw.startsWith('[[') || raw.startsWith('![[')) result += transformWikilink(raw);
    else if (raw.startsWith('[') && raw.includes('](')) result += transformMarkdownLink(raw);
    else result += raw;
    offset = match.index + raw.length;
  }
  result += markFragment(rest.slice(offset));
  return result;
}

function freezeOfficialPrompts(source) {
  return source.replace(
    /(\*\*Official English prompt\.\*\*[\s\S]*?)(\*\*中文翻译。?\*\*)/g,
    (_, officialPrompt) => `${officialPrompt}**Chinese translation.**`,
  );
}

function skeletonize(source) {
  const lines = freezeOfficialPrompts(source).split('\n');
  let inDisplayMath = false;
  let inCodeFence = false;
  return lines.map((originalLine) => {
    let line = originalLine;
    const heading = line.match(/^(#{1,6}\s+)(.+?)(\s*)$/);
    if (heading) line = `${heading[1]}${headingMap.get(heading[2]) ?? translated(heading[2])}${heading[3]}`;

    const trimmed = line.trim();
    if (trimmed.startsWith('```')) {
      inCodeFence = !inCodeFence;
      return line;
    }
    if (inCodeFence) return line;
    if (trimmed.startsWith('$$')) {
      inDisplayMath = !inDisplayMath;
      return line;
    }
    if (inDisplayMath) return line;
    return transformPlainLine(line);
  }).join('\n');
}

const skeletons = new Map();
for (const [file, source] of sources) skeletons.set(file, skeletonize(source));
await translateBatch(fragmentRecords, 'body');

await fs.mkdir(destinationDir, { recursive: true });
for (const [file, skeleton] of skeletons) {
  const translatedFile = skeleton.replace(/\uE000(\d+)\uE001/g, (_, index) => translated(fragmentRecords[Number(index)]));
  await fs.writeFile(path.join(destinationDir, file), translatedFile);
  process.stderr.write(`wrote ${file}\n`);
}

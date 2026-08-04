import fs from 'node:fs/promises';
import path from 'node:path';

const sourceDir = path.resolve('ai-qe-review/notes');
const destinationDir = path.resolve('ai-qe-review/notes-en');
const files = (await fs.readdir(sourceDir)).filter((file) => file.endsWith('.md')).sort();
const translationCache = new Map();

async function googleTranslate(text) {
  if (!text || !/[\p{Script=Han}]/u.test(text)) return text;
  if (translationCache.has(text)) return translationCache.get(text);

  const url = new URL('https://translate.googleapis.com/translate_a/single');
  url.searchParams.set('client', 'gtx');
  url.searchParams.set('sl', 'zh-CN');
  url.searchParams.set('tl', 'en');
  url.searchParams.set('dt', 't');
  url.searchParams.set('q', text);
  const response = await fetch(url);
  if (!response.ok) throw new Error(`Translation request failed: ${response.status}`);
  const data = await response.json();
  const translated = data[0].map((part) => part[0]).join('');
  translationCache.set(text, translated);
  return translated;
}

async function translateChunks(text) {
  const lineMarker = '⟪L⟫';
  const endsWithNewline = text.endsWith('\n');
  const lines = text.split('\n');
  const chunks = [];
  let current = '';
  for (const line of lines) {
    const encodedLine = `${line}${lineMarker}`;
    if (encodedLine.length > 1600) throw new Error(`Protected input line is unexpectedly long (${encodedLine.length})`);
    if (current.length + encodedLine.length > 1600 && current) {
      chunks.push(current);
      current = '';
    }
    current += encodedLine;
  }
  if (current) chunks.push(current);
  const translated = [];
  for (const chunk of chunks) translated.push(await googleTranslate(chunk));
  const restored = translated.join('').replace(/⟪\s*L\s*⟫/g, '\n');
  return endsWithNewline ? restored : restored.slice(0, -1);
}

function protect(text, pattern, replacement, protectedValues) {
  return text.replace(pattern, (...args) => {
    const token = `⟪P${protectedValues.length}⟫`;
    protectedValues.push(replacement(...args));
    return token;
  });
}

function restore(text, protectedValues) {
  return text.replace(/⟪\s*P\s*([\d\s]+)\s*⟫/g, (_, index) => {
    const normalizedIndex = index.replace(/\s/g, '');
    const value = protectedValues[Number(normalizedIndex)];
    if (value === undefined) throw new Error(`Missing protected value ${normalizedIndex}`);
    return value;
  });
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

const headings = new Set();
for (const file of files) {
  const text = await fs.readFile(path.join(sourceDir, file), 'utf8');
  for (const match of text.matchAll(/^#{1,6}\s+(.+?)\s*$/gm)) headings.add(match[1]);
}

const headingMap = new Map();
for (const heading of headings) headingMap.set(heading, await googleTranslate(heading));

async function translatedLabel(label) {
  return googleTranslate(label);
}

async function translateMarkdown(source) {
  const protectedValues = [];
  let working = source;

  // Replace headings first so fragment targets can use the identical mapped title.
  working = working.replace(/^(#{1,6}\s+)(.+?)(\s*)$/gm, (_, prefix, title, suffix) => {
    return `${prefix}${headingMap.get(title) ?? title}${suffix}`;
  });

  // Wikilinks require a synchronized conversion of both alias and heading fragment.
  const wikilinks = [...working.matchAll(/(!)?\[\[([^\]]+)\]\]/g)];
  for (const match of wikilinks) {
    const [raw, embed, content] = match;
    const { note, anchor, label } = parseWikilink(content);
    const mappedAnchor = anchor === null ? null : (headingMap.get(anchor) ?? await googleTranslate(anchor));
    const mappedLabel = label === null ? null : await translatedLabel(label);
    const rebuilt = `${embed ?? ''}[[${note}${mappedAnchor === null ? '' : `#${mappedAnchor}`}${mappedLabel === null ? '' : `|${mappedLabel}`}]]`;
    working = working.replace(raw, rebuilt);
  }

  // Official prompts are source authority. Preserve their English wording exactly,
  // while translating the adjacent Chinese explanation marker.
  working = protect(
    working,
    /(\*\*Official English prompt\.\*\*[\s\S]*?)(\*\*中文翻译。?\*\*)/g,
    (_, officialPrompt) => `${officialPrompt}**Chinese translation.**`,
    protectedValues,
  );

  // Keep code, citations, formulas, and URLs out of machine translation.
  // Markdown link labels remain exposed so that they are translated.
  working = protect(working, /```[\s\S]*?```/g, (match) => match, protectedValues);
  working = protect(working, /\$\$[\s\S]*?\$\$/g, (match) => match, protectedValues);
  working = protect(working, /`[^`\n]*`/g, (match) => match, protectedValues);
  working = protect(working, /\[@[^\]]+\]/g, (match) => match, protectedValues);
  working = protect(working, /\$(?:\\.|[^$\n])*\$/g, (match) => match, protectedValues);
  working = protect(working, /https?:\/\/[^\s)]+/g, (match) => match, protectedValues);

  working = await translateChunks(working);
  working = restore(working, protectedValues);

  return working
    .replace(/^(#{1,6})(?!\s|#)(.*)$/gm, '$1 $2')
    .replaceAll('test site map', 'topic map')
    .replaceAll('test sites', 'exam topics')
    .replaceAll('test points', 'exam topics')
    .replaceAll('Experienced risk', 'Empirical risk')
    .replaceAll('experienced risk', 'empirical risk')
    .replaceAll('experience/real risk', 'empirical/population risk')
    .replaceAll('Positive certainty', 'Positive definiteness')
    .replaceAll('positive certainty', 'positive definiteness')
    .replaceAll('representative theorem', 'representer theorem')
    .replaceAll('Secondary differentials', 'Subdifferentials')
    .replaceAll('secondary differentials', 'subdifferentials')
    .replaceAll('limited hypothesis class', 'finite hypothesis class')
    .replaceAll('limited class', 'finite class')
    .replaceAll('Achievable PAC', 'Realizable PAC')
    .replaceAll('achievable PAC', 'realizable PAC')
    .replaceAll('achievable/unrealizable', 'realizable/agnostic')
    .replaceAll('real question', 'past-exam question')
    .replaceAll('Real question', 'Past-exam question')
    .replaceAll('real question answers', 'past-exam solutions')
    .replaceAll('Real question answers', 'Past-exam solutions')
    .replaceAll('**answer. **', '**Solution.**')
    .replaceAll('**answer.**', '**Solution.**')
    .replaceAll('**Question: ', '**Question: ')
    .replaceAll('**Chinese translation. **', '**Chinese translation.**');
}

await fs.mkdir(destinationDir, { recursive: true });
for (const file of files) {
  const source = await fs.readFile(path.join(sourceDir, file), 'utf8');
  const translated = await translateMarkdown(source);
  await fs.writeFile(path.join(destinationDir, file), translated);
  process.stderr.write(`translated ${file}\n`);
}

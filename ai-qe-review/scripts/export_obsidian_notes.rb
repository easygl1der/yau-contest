#!/usr/bin/env ruby
# frozen_string_literal: true

# Export the LaTeX source of this review book into an Obsidian-friendly vault.
# Pandoc performs the LaTeX AST conversion; the small normalization layer keeps
# the project-specific commands and cross-note links meaningful in Obsidian.

require "fileutils"
require "open3"
require "pathname"
require "base64"

ROOT = Pathname.new(__dir__).join("..").realpath
NOTES = ROOT.join("notes")
CHAPTERS = ROOT.join("chapters")
PDF = ROOT.join("build/main.pdf")

NOTES_TO_EXPORT = [
  ["00-preface", ["00-preface.tex"]],
  ["01-syllabus", ["01-syllabus.tex", "01-textbooks.tex"]],
  ["01-textbooks", ["01-textbooks.tex"]],
  ["02-primer", ["02-primer.tex"]],
  ["03-2025-spring", ["03-2025-spring.tex"]],
  ["04-2025-fall", ["04-2025-fall.tex"]],
  ["05-2026-spring", ["05-2026-spring.tex"]],
  ["90-checklists", ["90-checklists.tex"]]
].freeze

CHAPTER_LINKS = {
  "ch:syllabus" => ["01-syllabus", "考试大纲与考点地图"],
  "ch:primer" => ["02-primer", "从零开始的理论预备"],
  "ch:2025spring" => ["03-2025-spring", "2025 春季 QE-AI 真题解答"],
  "ch:2025fall" => ["04-2025-fall", "2025 秋季 QE-AI 真题解答"],
  "ch:2026spring" => ["05-2026-spring", "2026 春季 QE-AI 真题解答"],
  "ch:checklists" => ["90-checklists", "考前 Checklist 与增量路线"]
}.freeze

PANDOC_PREAMBLE = <<~TEX
  \\newcommand{\\R}{\\mathbb{R}}
  \\newcommand{\\E}{\\mathbb{E}}
  \\newcommand{\\Pbb}{\\mathbb{P}}
  \\newcommand{\\N}{\\mathcal{N}}
  \\newcommand{\\Hcal}{\\mathcal{H}}
  \\newcommand{\\Dcal}{\\mathcal{D}}
  \\newcommand{\\Lcal}{\\mathcal{L}}
  \\newcommand{\\argmin}{\\operatorname*{arg\\,min}}
  \\newcommand{\\argmax}{\\operatorname*{arg\\,max}}
  \\newcommand{\\prox}{\\operatorname{prox}}
  \\newcommand{\\Var}{\\operatorname{Var}}
  \\newcommand{\\KL}{\\operatorname{KL}}
  \\newcommand{\\softmax}{\\operatorname{softmax}}
  \\newcommand{\\Dir}{\\operatorname{Dir}}
  \\newcommand{\\Cat}{\\operatorname{Cat}}
  \\newcommand{\\Bern}{\\operatorname{Bern}}
  \\newcommand{\\tr}{\\operatorname{tr}}
  \\newcommand{\\source}[1]{\\textbf{来源定位：} #1}
  \\newcommand{\\officialenglish}[1]{\\textbf{Official English prompt.} #1}
  \\newcommand{\\chinesetranslation}[1]{\\textbf{中文翻译。} #1}
TEX

def tex_heading(line)
  match = line.match(/^\\(chapter|section|subsection|subsubsection|paragraph)\{(.+)\}/)
  return unless match

  match[2].gsub(/\\\(.+?\\\)/, "\\1").gsub(/\\textbf\{(.+?)\}/, "\\1")
end

def concept_heading_map
  current_heading = nil
  mapping = {}

  File.foreach(CHAPTERS.join("02-primer.tex")) do |line|
    current_heading = tex_heading(line) || current_heading
    line.scan(/\\concepttarget\{([^}]+)\}/) do |target|
      mapping[target.first] = current_heading
    end
  end

  mapping
end

def table_inline_markdown(text)
  macros = {
    "\\R" => "\\mathbb{R}", "\\E" => "\\mathbb{E}",
    "\\Pbb" => "\\mathbb{P}", "\\N" => "\\mathcal{N}",
    "\\Hcal" => "\\mathcal{H}", "\\Dcal" => "\\mathcal{D}",
    "\\Lcal" => "\\mathcal{L}", "\\argmin" => "\\operatorname*{arg\\,min}",
    "\\argmax" => "\\operatorname*{arg\\,max}", "\\prox" => "\\operatorname{prox}"
  }
  macros.each { |from, to| text = text.gsub(from, to) }
  text = text.gsub(/\\(?:textcite|parencite|cite)\{([^}]+)\}/) { citation_markdown(Regexp.last_match(1)) }
  text.gsub("\\(", "$").gsub("\\)", "$")
end

def citation_markdown(keys)
  "[#{keys.split(",").map { |key| "@#{key.strip}" }.join("; ")}]"
end

def citation_token(keys)
  "OBCIT#{Base64.strict_encode64(citation_markdown(keys))}-"
end

def normalize_citations(content)
  content.gsub(/\\(?:textcite|parencite|cite)\{([^}]+)\}/) do
    citation_token(Regexp.last_match(1))
  end
end

def replace_longtables(content)
  column_spec = /\{(?:[^{}]|\{[^{}]*\})*\}/
  content.gsub(/\\begin\{longtable\}#{column_spec}\s*(.*?)\\end\{longtable\}/m) do
    rows = Regexp.last_match(1).lines.map do |line|
      next unless line.include?("&") && line.rstrip.end_with?("\\\\")

      line.sub(/\\\\\s*$/, "").split("&").map { |cell| table_inline_markdown(cell.strip) }
    end.compact.uniq
    next "" if rows.empty?

    markdown_table = [
      "| #{rows.first.join(" | ")} |",
      "| #{Array.new(rows.first.length, "---").join(" | ")} |",
      *rows.drop(1).map { |row| "| #{row.join(" | ")} |" }
    ].join("\n")
    "OBT#{Base64.strict_encode64(markdown_table)}-"
  end
end

TEXTBOOK_MACROS = %w[
  MLTextbooks
  DeepTextbooks
  OptimizationTextbooks
  NLPTextbooks
].freeze

def closing_brace_index(text, opening_index)
  depth = 0

  text.each_char.with_index do |char, index|
    next if index < opening_index

    depth += 1 if char == "{"
    depth -= 1 if char == "}"
    return index if depth.zero?
  end

  raise "Unclosed brace starting at byte #{opening_index}"
end

def expand_textbook_macros(content)
  definitions = {}
  ranges = []
  pattern = /\\newcommand\{\\(#{TEXTBOOK_MACROS.join("|")})\}\{/
  search_from = 0

  while (match = pattern.match(content, search_from))
    opening_index = match.end(0) - 1
    closing_index = closing_brace_index(content, opening_index)
    definitions[match[1]] = content[(opening_index + 1)...closing_index]
    ranges << (match.begin(0)..closing_index)
    search_from = closing_index + 1
  end

  ranges.reverse_each { |range| content.slice!(range) }
  definitions.each do |name, definition|
    content.gsub!(/\\#{Regexp.escape(name)}\b/) { definition }
  end
  content
end

def normalized_tex(content, concept_map)
  content = content.gsub(/\\input\{chapters\/01-textbooks\}/) { File.read(CHAPTERS.join("01-textbooks.tex")) }
  content = expand_textbook_macros(content)
  content = normalize_citations(content)
  content = content.gsub(/\\conceptref\{([^}]+)\}\{([^{}]*)\}/) do
    target, label = Regexp.last_match(1), Regexp.last_match(2)
    "OBC#{Base64.strict_encode64(target)}-#{Base64.strict_encode64(label)}-"
  end
  content = content.gsub(/\\ref\{([^}]+)\}/) do
    label = Regexp.last_match(1)
    CHAPTER_LINKS.key?(label) ? "OBSIDIAN_CHAPTER_#{label.gsub(/[^A-Za-z0-9]/, "_")}" : label
  end
  content = content.gsub(/\\(?:label|concepttarget)\{[^}]+\}/, "")
  content = content.gsub(/\\rm\b/) { "\\mathrm" }
  content = content.gsub("\\solution", "\\textbf{解答。}")
  content = content.gsub("\\teaching", "\\textbf{从零教学。}")
  content = content.gsub("\\examnote", "\\textbf{考试提醒。}")
  content = content.gsub("\\definitionlabel", "\\textbf{[定义]}")
  content = content.gsub("\\theoremlabel", "\\textbf{[定理]}")
  content = content.gsub("\\proofsketchlabel", "\\textbf{[证明骨架]}")
  content = content.gsub("\\heuristiclabel", "\\textbf{[启发式解释]}")
  content = content.gsub("\\engineeringlabel", "\\textbf{[工程惯例]}")
  content = content.gsub(/\\includegraphics(?:\[[^\]]*\])?\{([^}]+)\}/) { "OBSIDIAN_IMAGE_#{Regexp.last_match(1)}" }
  content = content.gsub(/\\begin\{examproblem\}(?:\[([^\]]+)\])?/) { "\\textbf{题#{Regexp.last_match(1) ? "：#{Regexp.last_match(1)}" : "。"}}" }
  content = content.gsub(/\\end\{examproblem\}/, "")
  content = content.gsub(/\\begin\{checkpoint\}(?:\[([^\]]+)\])?/) { "\\textbf{考点#{Regexp.last_match(1) ? "：#{Regexp.last_match(1)}" : "。"}}" }
  content = content.gsub(/\\end\{checkpoint\}/, "")
  content = replace_longtables(content)

  content.lines.map do |line|
    next if line.match?(/^\\(?:begingroup|endgroup|small|setlength|setcounter|setlist)\b/)
    next if line.match?(/^\\(?:toprule|midrule|bottomrule|endfirsthead|endhead)\s*$/)

    line
  end.compact.join
end

def run_pandoc(source, destination)
  temp = destination.sub_ext(".tex")
  temp.write(PANDOC_PREAMBLE + source)
  stdout, stderr, status = Open3.capture3(
    "pandoc", "--from=latex", "--to=markdown+tex_math_dollars+pipe_tables",
    "--wrap=none", temp.to_s, "--output=#{destination}"
  )
  temp.delete
  raise "Pandoc conversion failed: #{stderr}\n#{stdout}" unless status.success?
end

def restore_obsidian_links(markdown, concept_map)
  markdown = markdown.gsub(/OBT([A-Za-z0-9+\/=]+)-/) { Base64.strict_decode64(Regexp.last_match(1)).force_encoding(Encoding::UTF_8) }
  markdown = markdown.gsub(/OBCIT([A-Za-z0-9+\/=]+)-/) { Base64.strict_decode64(Regexp.last_match(1)).force_encoding(Encoding::UTF_8) }
  markdown = markdown.gsub(/OBC([A-Za-z0-9+\/=]+)-([A-Za-z0-9+\/=]+)-/) do
    target = Base64.strict_decode64(Regexp.last_match(1)).force_encoding(Encoding::UTF_8)
    label = Base64.strict_decode64(Regexp.last_match(2)).force_encoding(Encoding::UTF_8)
    heading = concept_map.fetch(target, target)
    "[[02-primer##{heading}|#{label}]]"
  end

  CHAPTER_LINKS.each do |label, (file, title)|
    token = "OBSIDIAN_CHAPTER_#{label.gsub(/[^A-Za-z0-9]/, "_")}"
    markdown = markdown.gsub(token, "[[#{file}|#{title}]]")
  end

  markdown = markdown.gsub(/OBSIDIAN_IMAGE_([^\s]+)/) { "![](../#{Regexp.last_match(1)})" }
  markdown = markdown.gsub(/\\\(([^\n)]*)\\\)/, '$\\1$')
  markdown.gsub(/\\\[([^\n\]]+)\\\]/, '[\\1]')
end

def normalize_display_math(markdown)
  markdown.gsub(/\$\$(.+?)\$\$/m) do
    "$$\n#{Regexp.last_match(1).strip}\n$$"
  end
end

def normalize_mathjax_syntax(markdown)
  markdown.gsub(/\\bar\s+\\mathcal\{([^{}]+)\}/) do
    "\\bar{\\mathcal{#{Regexp.last_match(1)}}}"
  end
end

def note_title(slug)
  path = NOTES.join("#{slug}.md")
  content = path.read
  content[/^#\s+(.+?)(?:\s+\{#.*\})?$/, 1] || content[/^title:\s+(.+)$/, 1]
end

def unwrap_outer_braces(text)
  return text unless text.start_with?("{") && closing_brace_index(text, 0) == text.length - 1

  text[1...-1]
end

def normalize_bibtex_text(text)
  return unless text

  text = unwrap_outer_braces(text.strip)
  {
    /\{\\`e\}/ => "è",
    /\{\\\"u\}/ => "ü",
    /\{\\\"a\}/ => "ä"
  }.each { |pattern, replacement| text = text.gsub(pattern, replacement) }
  text
end

def bibtex_field(entry, field)
  match = entry.match(/^\s*#{Regexp.escape(field)}\s*=\s*\{/)
  return unless match

  opening_index = match.end(0) - 1
  closing_index = closing_brace_index(entry, opening_index)
  normalize_bibtex_text(entry[(opening_index + 1)...closing_index])
end

def write_index
  items = NOTES_TO_EXPORT.map do |slug, sources|
    title = note_title(slug)
    "- [[#{slug}|#{title}]]  \n  Source: #{sources.map { |source| "`chapters/#{source}`" }.join(", ")}"
  end.join("\n")

  NOTES.join("README.md").write(<<~MD)
    # AI QE 复习资料 Obsidian 索引

    本目录由 `../main.tex` 与 `../chapters/*.tex` 自动导出；正文以 LaTeX 源码为准，`../build/main.pdf` 是对应的 104 页阅读版。

    ## 笔记

    #{items}

    ## 公式、链接与图片

    - 行内与展示公式均保留 LaTeX，适配 Obsidian MathJax。
    - LaTeX 的章节和概念交叉引用已转换为 Obsidian 内链；概念链接统一回到 `02-primer.md` 中的定义或讲解小节。
    - 当前纳入 `main.tex` 的章节没有 `\\includegraphics` 调用，故本次没有新增图片资产。导出器会将后续加入的 `\\includegraphics{path}` 转为相对于本目录的 Markdown 图片链接。
    - 文献引文统一写为 Pandoc/Obsidian Citation Plugin 可识别的 `[@citation-key]` 形式；对应书目见 [[references]]。

    ## 重新导出

    在 `ai-qe-review` 目录执行：

    ```bash
    ruby scripts/export_obsidian_notes.rb
    ```
  MD
end

def write_references
  entries = File.read(ROOT.join("refs.bib")).split(/(?=^@)/).map do |entry|
    key = entry[/^@\w+\{([^,]+)/, 1]
    next unless key

    title = bibtex_field(entry, "title") || key
    author = bibtex_field(entry, "author")
    year = bibtex_field(entry, "year")
    url = bibtex_field(entry, "url")
    line = "- [@#{key}] #{author ? "#{author}. " : ""}*#{title}*#{year ? " (#{year})" : ""}."
    line += " [Source](#{url})" if url
    line
  end.compact

  NOTES.join("references.md").write(<<~MD)
    # 参考文献与官方来源

    此索引从 `../refs.bib` 生成，正文中的引文键与此处一一对应。

    #{entries.join("\n")}
  MD
end

FileUtils.mkdir_p(NOTES)
concept_map = concept_heading_map

NOTES_TO_EXPORT.each do |slug, sources|
  primary = CHAPTERS.join(sources.first)
  output = NOTES.join("#{slug}.md")
  source = primary.read
  source += "\n\\MLTextbooks\n\\DeepTextbooks\n\\OptimizationTextbooks\n\\NLPTextbooks\n" if slug == "01-textbooks"
  run_pandoc(normalized_tex(source, concept_map), output)
  body = restore_obsidian_links(output.read, concept_map)
  body = normalize_mathjax_syntax(body)
  body = normalize_display_math(body)
  body = "# 指定教材章节导览\n\n#{body}" if slug == "01-textbooks"
  title = body[/^#\s+(.+?)(?:\s+\{#.*\})?$/, 1]
  title ||= "指定教材章节导览" if slug == "01-textbooks"
  title ||= slug
  output.write(body)
end

write_references
write_index
puts "Exported #{NOTES_TO_EXPORT.length} source notes plus index and references to #{NOTES}"

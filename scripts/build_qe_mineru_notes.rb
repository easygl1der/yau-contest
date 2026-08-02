#!/usr/bin/env ruby
# frozen_string_literal: true

# Build Obsidian notes directly from MinerU Markdown packages. The original PDF
# remains authoritative; this script deliberately never uses pdftotext output.

require "digest"

ROOT = File.expand_path("..", __dir__)

PROJECTS = {
  "applied-math-qe-review" => {
    title: "计算与应用数学",
    english: "Computational & Applied Mathematics",
    prefix: "qzc-qe-applied-math",
    syllabus: "qzc-qe-applied-math-syllabus-2026-06"
  },
  "probability-statistics-qe-review" => {
    title: "概率统计",
    english: "Probability & Statistics",
    prefix: "qzc-qe-probability-statistics",
    syllabus: "qzc-qe-probability-statistics-syllabus-2026-06"
  }
}.freeze

TERMS = [
  ["2023-fall", "2023 秋季", "https://qzc.tsinghua.edu.cn/info/1072/5467.htm"],
  ["2024-spring", "2024 春季", "https://qzc.tsinghua.edu.cn/info/1072/5468.htm"],
  ["2024-fall", "2024 秋季", "https://qzc.tsinghua.edu.cn/info/1072/6359.htm"],
  ["2025-spring", "2025 春季", "https://qzc.tsinghua.edu.cn/info/1072/6976.htm"],
  ["2025-fall", "2025 秋季", "https://qzc.tsinghua.edu.cn/info/1072/7558.htm"],
  ["2026-spring", "2026 春季", "https://qzc.tsinghua.edu.cn/info/1072/8041.htm"]
].freeze

def read_transcript(project_dir, stem)
  path = File.join(project_dir, "transcripts", "mineru", stem, "reading.md")
  raise "MinerU reading copy is missing: #{path}" unless File.file?(path)

  content = File.read(path, encoding: "UTF-8")
  content.sub!(/\A# .*?\n+/, "")
  # Images originated beside the raw Markdown under parts/images/.
  content.gsub!(/\]\(images\//, "](../transcripts/mineru/#{stem}/parts/images/")
  content
end

def question_headings(content)
  content.gsub(/^\s*(?:\((\d+)\)|(\d+)\.)\s+\((\d+)\s+points\)\s*/) do
    number = Regexp.last_match(1) || Regexp.last_match(2)
    "\n\n## 题 #{number}（#{Regexp.last_match(3)} 分）\n\n"
  end.gsub(/^\s*(\d+)\.\s+(?=[A-Z])/) do
    "\n\n## 题 #{Regexp.last_match(1)}\n\n"
  end
end

def note_header(display_name, config, page_url, stem, solution_file)
  <<~MARKDOWN
    # #{display_name} #{config[:title]}博资考真题

    > [!info] 来源与转录
    > - 官方发布页：[求真书院 #{display_name} 博资考试题](#{page_url})
    > - 官方原卷：[#{stem}.pdf](../sources/exams/#{stem}.pdf)
    > - MinerU 阅读包：[完整转录](../transcripts/mineru/#{stem}/reading.md)；原始 Markdown、JSON 和图像资产位于同一目录下的 `parts/`。
    > - 对应解答：[逐题参考解](../solutions/#{solution_file})。解答中的数学使用 Obsidian 的美元符号定界。
    > - 以下题干由 MinerU VLM 直接转录并保留 LaTeX 公式；遇到个别识别歧义时以官方 PDF 原卷为准。

  MARKDOWN
end

def write_exam_note(project_dir, config, term, display_name, page_url)
  index = TERMS.index { |entry| entry.first == term } + 3
  slug = "%02d-%s" % [index, term]
  stem = "#{config[:prefix]}-#{term}"
  solution_file = "#{slug}-solutions.md"
  body = note_header(display_name, config, page_url, stem, solution_file).dup
  body << question_headings(read_transcript(project_dir, stem))
  File.write(File.join(project_dir, "notes", "#{slug}.md"), body.rstrip + "\n", encoding: "UTF-8")
end

def write_syllabus_note(project_dir, config)
  stem = config[:syllabus]
  content = read_transcript(project_dir, stem)
  note = <<~MARKDOWN
    # #{config[:title]}考试大纲

    > [!info] 来源与转录
    > - 官方发布页：[博士生资格考试大纲（2026-06-30）](https://qzc.tsinghua.edu.cn/info/1072/8269.htm)
    > - 官方原卷：[#{stem}.pdf](../sources/syllabus/#{stem}.pdf)
    > - MinerU 阅读包：[完整转录](../transcripts/mineru/#{stem}/reading.md)。以下内容保留 MinerU 识别出的公式与列表结构。

    #{content.rstrip}
  MARKDOWN
  File.write(File.join(project_dir, "notes", "01-syllabus.md"), note, encoding: "UTF-8")
end

def write_package_readme(project_dir, config, stem, label, source_relative)
  package = File.join(project_dir, "transcripts", "mineru", stem)
  source = File.join(project_dir, source_relative)
  sha256 = Digest::SHA256.file(source).hexdigest
  content = <<~MARKDOWN
    # #{label}

    此目录是官方 PDF 的 MinerU VLM 转录包。原卷 PDF 保持为题目、版式和公式的权威版本；`reading.md` 是经过数学间距清理的阅读副本。

    ## 内容

    - `source.pdf`：与 `#{source_relative}` 对应的不可变硬链接。
    - `reading.md`：清理后的主阅读文件，图片路径已调整为在本目录可解析。
    - `parts/#{stem}.md`：MinerU 的清理后原始 Markdown。
    - `parts/#{stem}.json`：MinerU 的结构化输出。
    - `parts/images/`：MinerU 提取出的图像资产（若有）。

    ## 转录记录

    - 工具：`mineru-open-api extract`。
    - 模式：认证精度转录，`--model vlm --format md,json`；考试卷使用英文模型提示，大纲使用中文模型提示。
    - 数学清理：`clean_mineru_markdown.py --in-place`，只规范数学环境内的 OCR 式空格。
    - 原始 PDF SHA-256：`#{sha256}`。
  MARKDOWN
  File.write(File.join(package, "README.md"), content, encoding: "UTF-8")
end

PROJECTS.each do |project, config|
  project_dir = File.join(ROOT, project)
  TERMS.each do |term, display_name, page_url|
    stem = "#{config[:prefix]}-#{term}"
    write_exam_note(project_dir, config, term, display_name, page_url)
    write_package_readme(project_dir, config, stem, "#{display_name} #{config[:title]}博资考", "sources/exams/#{stem}.pdf")
  end
  write_syllabus_note(project_dir, config)
  stem = config[:syllabus]
  write_package_readme(project_dir, config, stem, "#{config[:title]}考试大纲（2026-06）", "sources/syllabus/#{stem}.pdf")
end

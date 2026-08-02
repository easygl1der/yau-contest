#!/usr/bin/env ruby
# frozen_string_literal: true

# Creates a reviewable solution-file entry point for every archived paper.
# Existing files are deliberately left untouched: completed solutions remain
# authoritative over this bootstrap scaffold.

PROJECTS = {
  "applied-math-qe-review" => {
    title: "计算与应用数学",
    source_prefix: "qzc-qe-applied-math",
    question_counts: [7, 7, 7, 6, 7, 7]
  },
  "probability-statistics-qe-review" => {
    title: "概率统计",
    source_prefix: "qzc-qe-probability-statistics",
    question_counts: [8, 11, 11, 11, 11, 11]
  }
}.freeze

PAPERS = [
  ["03-2023-fall", "2023 秋季", "2023-fall"],
  ["04-2024-spring", "2024 春季", "2024-spring"],
  ["05-2024-fall", "2024 秋季", "2024-fall"],
  ["06-2025-spring", "2025 春季", "2025-spring"],
  ["07-2025-fall", "2025 秋季", "2025-fall"],
  ["08-2026-spring", "2026 春季", "2026-spring"]
].freeze

ROOT = File.expand_path("..", __dir__)

PROJECTS.each do |project, config|
  solution_dir = File.join(ROOT, project, "solutions")
  Dir.mkdir(solution_dir) unless Dir.exist?(solution_dir)

  PAPERS.each_with_index do |(slug, display_term, source_term), index|
    path = File.join(solution_dir, "#{slug}-solutions.md")
    next if File.exist?(path)

    source_stem = "#{config[:source_prefix]}-#{source_term}"
    questions = (1..config[:question_counts][index]).map do |number|
      <<~MARKDOWN
        ## 题 #{number}

        > [!todo] 待完成
        > 需要先以官方 PDF 复核题面，然后写入可逐步检查的参考解。
      MARKDOWN
    end.join("\n")

    content = <<~MARKDOWN
      # #{display_term} #{config[:title]}博资考解答

      > [!info] 题源与答案性质
      > - 题面：[官方原卷](../sources/exams/#{source_stem}.pdf)；可检索版本见 [对应题面](../notes/#{slug}.md)。
      > - 本文件仅收录可审阅的教学性参考解。若官方评分答案另行公开，应在相应题目标题下明确注明来源；否则以“自撰参考解”标注。
      > - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

      ## 写作状态

      本卷已建立逐题解答入口；以下各题将按“动机、符号、完整关键推导、结论、考点、易错点、引用”增量完成。

      #{questions}
    MARKDOWN

    File.write(path, content, encoding: "UTF-8")
  end
end

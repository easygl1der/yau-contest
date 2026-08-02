#!/usr/bin/env ruby
# frozen_string_literal: true

PROJECTS = {
  "applied-math-qe-review" => "计算与应用数学",
  "probability-statistics-qe-review" => "概率统计"
}.freeze

PAPERS = [
  ["03-2023-fall", "2023 秋季"],
  ["04-2024-spring", "2024 春季"],
  ["05-2024-fall", "2024 秋季"],
  ["06-2025-spring", "2025 春季"],
  ["07-2025-fall", "2025 秋季"],
  ["08-2026-spring", "2026 春季"]
].freeze

ROOT = File.expand_path("..", __dir__)

PROJECTS.each do |project, _title|
  rows = PAPERS.map do |slug, term|
    filename = "#{slug}-solutions.md"
    path = File.join(ROOT, project, "solutions", filename)
    text = File.read(path, encoding: "UTF-8")
    total = text.scan(/^## 题 /).length
    pending = text.scan(/^> \[!todo\]/).length
    completed = total - pending
    state = if pending.zero?
              "#{completed}/#{total} 题已完成"
            elsif completed.zero?
              "待写（#{total} 题）"
            else
              "#{completed}/#{total} 题已完成"
            end
    "| #{term} | [#{slug}-solutions](#{filename}) | #{state} |"
  end

  content = <<~MARKDOWN
    # 解答完成状态

    每份题面均有一份对应的解答文件，并由题面顶部的“对应解答”链接直接跳转。此表由 `scripts/update_qe_solution_status.rb` 依据文件中待完成标记生成；“已完成”只统计已经写入逐题推导的内容。

    | 试卷 | 解答文件 | 当前状态 |
    | --- | --- | --- |
    #{rows.join("\n")}
  MARKDOWN

  File.write(File.join(ROOT, project, "solutions", "STATUS.md"), content, encoding: "UTF-8")
end

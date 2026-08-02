#!/usr/bin/env ruby
# frozen_string_literal: true

# Rebuilds readable Yau-contest indexes from actual source, MinerU, and
# solution-file state. It never infers completion merely from file creation.

require "json"

ROOT = File.expand_path("..", __dir__)
PROJECTS = {
  "applied-math-qe-review" => "计算与应用数学",
  "probability-statistics-qe-review" => "概率统计"
}.freeze

def state_for(project, record)
  reading = File.join(ROOT, project, "transcripts", "mineru", record.fetch("id"), "reading.md")
  solution = File.join(ROOT, project, "solutions", "yau", "#{record.fetch("id")}-solutions.md")
  solution_text = File.read(solution, encoding: "UTF-8")
  solution_state = if solution_text.include?("[!todo]")
                     "待写"
                   elsif solution_text.scan(/^## 题 /).any?
                     "已完成"
                   else
                     "待题目拆分"
                   end
  [File.file?(reading) ? "完成" : "待处理", solution_state]
end

PROJECTS.each do |project, title|
  project_dir = File.join(ROOT, project)
  manifest = JSON.parse(File.read(File.join(project_dir, "sources", "yau-contest", "manifest.json"), encoding: "UTF-8"))
  rows = manifest.fetch("records").sort_by { |record| [record.fetch("round"), record.fetch("year"), record.fetch("category"), record.fetch("id")] }.map do |record|
    mineru_state, solution_state = state_for(project, record)
    "| #{record.fetch("year")} | #{record.fetch("round")} | #{record.fetch("category")} | [[#{record.fetch("id")}|题面]] | [解答](../../solutions/yau/#{record.fetch("id")}-solutions.md) | #{record.fetch("extension")} | #{mineru_state} | #{solution_state} |"
  end
  completed_transcripts = rows.count { |row| row.include?("| 完成 |") }

  File.write(File.join(project_dir, "notes", "yau", "README.md"), <<~MARKDOWN, encoding: "UTF-8")
    # 丘成桐大学生数学竞赛资料

    本目录收录与 #{title} 备考相关的丘赛材料。半决赛笔试与总决赛面试是不同赛段，题面、转录与解答分别保存。

    - 半决赛笔试：来自本地历史题库；原始上游发布页仍待逐份补录。
    - 总决赛面试：来自 [官方相关下载页](https://yau-contest.com/lists-jxxg.html) 的 2012--2025 年归档 ZIP。
    - 2026 总决赛面试题未见于当前官方归档，不能用名单或公告替代题面。
    - 当前共有 #{manifest.fetch("records").length} 份材料，其中 #{completed_transcripts} 份已经具备 MinerU 阅读稿。

    ## 资料清单

    | 年份 | 赛段 | 类别 | 题面 | 解答 | 原始格式 | MinerU | 解答状态 |
    | --- | --- | --- | --- | --- | --- | --- |
    #{rows.join("\n")}
  MARKDOWN

  solution_rows = manifest.fetch("records").sort_by { |record| [record.fetch("round"), record.fetch("year"), record.fetch("category"), record.fetch("id")] }.map do |record|
    _mineru_state, solution_state = state_for(project, record)
    "| #{record.fetch("year")} | #{record.fetch("round")} | #{record.fetch("category")} | [#{record.fetch("id")}-solutions](#{record.fetch("id")}-solutions.md) | #{solution_state} |"
  end
  File.write(File.join(project_dir, "solutions", "yau", "STATUS.md"), <<~MARKDOWN, encoding: "UTF-8")
    # 丘赛解答状态

    “已完成”仅表示该解答文件已没有待办占位，并含有按题拆分的教学性推导；题面仍须以原始文件为准。

    | 年份 | 赛段 | 类别 | 解答文件 | 状态 |
    | --- | --- | --- | --- |
    #{solution_rows.join("\n")}
  MARKDOWN
end

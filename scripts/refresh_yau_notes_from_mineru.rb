#!/usr/bin/env ruby
# frozen_string_literal: true

# Turns completed Yau-contest MinerU reading copies into Obsidian problem notes
# and creates matching, bidirectional solution sections. Existing non-template
# teaching solutions are never overwritten.

require "json"
require "optparse"

ROOT = File.expand_path("..", __dir__)
options = { project: nil }
OptionParser.new do |parser|
  parser.banner = "Usage: ruby scripts/refresh_yau_notes_from_mineru.rb --project PROJECT"
  parser.on("--project PROJECT") { |value| options[:project] = value }
end.parse!
abort "--project is required" unless options[:project]

project_dir = File.join(ROOT, options[:project])
manifest_path = File.join(project_dir, "sources", "yau-contest", "manifest.json")
manifest = JSON.parse(File.read(manifest_path, encoding: "UTF-8"))

def questionize(text, record)
  numbers = []
  body = text.sub(/\A# .*?\n+/, "")
  body.gsub(/^\s*(?:(?:Problem|题)\s*)?(\d+)[.)]?\s+(?=[A-Z])/i) do
    number = Regexp.last_match(1)
    numbers << number unless numbers.include?(number)
    <<~MARKDOWN

      ## 题 #{number}

      ^#{record.fetch("id")}-q#{number}

      > 对应解答：[题 #{number} 参考解](../../solutions/yau/#{record.fetch("id")}-solutions.md#^#{record.fetch("id")}-s#{number})。

    MARKDOWN
  end.then { |converted| [converted, numbers] }
end

def note_header(record)
  <<~MARKDOWN
    # #{record.fetch("year")} 丘赛 #{record.fetch("round") == "final-interview" ? "总决赛面试" : "半决赛笔试"} #{record.fetch("category")}

    > [!info] 来源与转录
    > - 原始文件：[本地原件](../../#{record.fetch("local_path").sub(%r{\A[^/]+/}, "")})。
    > - 来源：#{record["official_url"] ? "[官方题库下载页](#{record.fetch("official_url")})" : "本地历史题库；上游发布页待补录"}。
    > - MinerU 阅读稿：[完整转录](../../transcripts/mineru/#{record.fetch("id")}/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
    > - 对应解答：[逐题参考解](../../solutions/yau/#{record.fetch("id")}-solutions.md)。
    > - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

  MARKDOWN
end

def solution_header(record)
  <<~MARKDOWN
    # #{record.fetch("year")} 丘赛 #{record.fetch("round") == "final-interview" ? "总决赛面试" : "半决赛笔试"} #{record.fetch("category")}参考解

    > [!info] 题源与答案性质
    > - 对应题面：[原题 Markdown](../../notes/yau/#{record.fetch("id")}.md)；原始文件：[本地原件](../../#{record.fetch("local_path").sub(%r{\A[^/]+/}, "")})。
    > - #{record["official_url"] ? "官方归档：[下载页](#{record.fetch("official_url")})。" : "本地历史题库来源待补录；不可将此文件误称为官方答案。"}
    > - 本文件是教学性参考解；除非有单独归档的官方答案，必须明确标注“自撰参考解”。
    > - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

  MARKDOWN
end

updated = []
manifest.fetch("records").each do |record|
  reading = File.join(project_dir, "transcripts", "mineru", record.fetch("id"), "reading.md")
  next unless File.file?(reading)

  transcript, numbers = questionize(File.read(reading, encoding: "UTF-8"), record)
  note_path = File.join(project_dir, "notes", "yau", "#{record.fetch("id")}.md")
  File.write(note_path, note_header(record) + transcript.rstrip + "\n", encoding: "UTF-8")

  solution_path = File.join(project_dir, "solutions", "yau", "#{record.fetch("id")}-solutions.md")
  existing = File.read(solution_path, encoding: "UTF-8")
  if existing.include?("## 写作状态") || existing.include?("## 解答准备") || (existing.include?("先核对原始 PDF 与 MinerU 转录") && !existing.include?("### 动机"))
    sections = if numbers.any?
                 numbers.map do |number|
                   <<~MARKDOWN
                     ## 题 #{number}

                     ^#{record.fetch("id")}-s#{number}

                     > 对应题面：[题 #{number} 原题](../../notes/yau/#{record.fetch("id")}.md#^#{record.fetch("id")}-q#{number})。

                     > [!todo] 待完成
                     > 先核对原始 PDF 与 MinerU 转录，再按动机、定义与符号、必要定理及证明、完整推导、结论、考点、易错点、引用写入。
                   MARKDOWN
                 end.join("\n")
               else
                 <<~MARKDOWN
                   ## 解答准备

                   > [!todo] 待完成
                   > 原题未能自动识别出稳定题号。先按原始文件的主题与追问分段，再写入教学性参考解。
                 MARKDOWN
               end
    File.write(solution_path, solution_header(record) + sections, encoding: "UTF-8")
  end

  record["mineru_status"] = "completed"
  record["question_sections"] = numbers.length
  updated << record.fetch("id")
end

File.write(manifest_path, JSON.pretty_generate(manifest) + "\n", encoding: "UTF-8")
puts "refreshed #{updated.length} MinerU-backed notes"

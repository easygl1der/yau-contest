#!/usr/bin/env ruby
# frozen_string_literal: true

# Packages two kinds of S.-T. Yau College Student Mathematics Contest material:
# locally collected semifinal written papers and the official final-interview
# archive. It never treats an OCR transcript as the canonical source.

require "digest"
require "fileutils"
require "json"
require "time"

ROOT = File.expand_path("..", __dir__)
FINAL_ARCHIVE_URL = "https://yau-contest.com/index/reldown?id=10"
FINAL_DOWNLOAD_PAGE = "https://yau-contest.com/lists-jxxg.html"
FINAL_ARCHIVE = File.join(ROOT, ".staging/yau-final/yau-final-interview-2012-2025.zip")
FINAL_UNPACKED = File.join(ROOT, ".staging/yau-final/unpacked")
ALLOWED_FINAL_EXTENSIONS = %w[.pdf .doc .docx .jpg].freeze

PROJECTS = {
  "applied-math-qe-review" => {
    title: "计算与应用数学",
    source_dir: "应用与计算数学",
    final_directory: "Applied Math and Computational Math"
  },
  "probability-statistics-qe-review" => {
    title: "概率统计",
    source_dir: "概率与统计",
    final_directory: "Probability and Statistics"
  }
}.freeze

def slug(value)
  value.downcase.gsub(/[^a-z0-9]+/, "-").sub(/\A-/, "").sub(/-\z/, "").gsub(/-+/, "-")
end

def role_from_name(name)
  lowered = name.downcase
  return "team" if lowered.include?("team")
  return "individual" if lowered.include?("individual")

  "written"
end

def final_category(path)
  return "individual" if path.include?("/Individual/")
  return "overall" if path.include?("/Overall/")
  return "team" if path.include?("/Team/")

  "unclassified"
end

def copy_source(source, destination)
  FileUtils.mkdir_p(File.dirname(destination))
  FileUtils.cp(source, destination) unless File.exist?(destination) && Digest::SHA256.file(source).hexdigest == Digest::SHA256.file(destination).hexdigest
end

def stable_destination(directory, base, extension, source)
  source_sha = Digest::SHA256.file(source).hexdigest
  candidate = File.join(directory, "#{base}#{extension}")
  return candidate unless File.exist?(candidate)
  return candidate if Digest::SHA256.file(candidate).hexdigest == source_sha

  index = 2
  loop do
    candidate = File.join(directory, "#{base}-#{index}#{extension}")
    return candidate unless File.exist?(candidate)
    return candidate if Digest::SHA256.file(candidate).hexdigest == source_sha

    index += 1
  end
end

def record_for(source:, destination:, year:, round:, category:, provenance:, official_url: nil)
  {
    id: File.basename(destination, File.extname(destination)),
    year: year,
    round: round,
    category: category,
    extension: File.extname(destination).delete_prefix("."),
    source_path: source.delete_prefix("#{ROOT}/"),
    local_path: destination.delete_prefix("#{ROOT}/"),
    sha256: Digest::SHA256.file(destination).hexdigest,
    official_url: official_url,
    provenance: provenance,
    mineru_status: "pending",
    transcription_review: "pending",
    solution_status: "pending"
  }
end

def source_link(relative_path)
  "../../#{relative_path.sub(%r{\A[^/]+/}, "")}"
end

def note_content(record, title)
  pdf_label = record[:extension].upcase
  <<~MARKDOWN
    # #{record[:year]} 丘赛 #{record[:round] == "final-interview" ? "总决赛面试" : "半决赛笔试"} #{record[:category]} #{title}

    > [!info] 来源与处理状态
    > - 原始 #{pdf_label}：[本地原件](#{source_link(record[:local_path])})。
    > - 来源：#{record[:official_url] ? "[官方题库下载页](#{record[:official_url]})" : "本地历史题库；上游发布页待补录"}。
    > - MinerU 转录：待处理。原始文件始终是题目、公式和版式的最终依据。
    > - 对应解答：[教学性参考解](../../solutions/yau/#{record[:id]}-solutions.md)。
    > - 文档赛段：`#{record[:round]}`；类别：`#{record[:category]}`。不要与博士资格考试原卷混写。

    ## 原题

    等待 MinerU 转录和逐页 PDF 复核后写入。该占位不等同于题面已完成。
  MARKDOWN
end

def solution_content(record, title)
  <<~MARKDOWN
    # #{record[:year]} 丘赛 #{record[:round] == "final-interview" ? "总决赛面试" : "半决赛笔试"} #{record[:category]} #{title}参考解

    > [!info] 题源与答案性质
    > - 对应题面：[原题 Markdown](../../notes/yau/#{record[:id]}.md)；原始文件：[本地原件](#{source_link(record[:local_path])})。
    > - #{record[:official_url] ? "官方归档：[下载页](#{record[:official_url]})。" : "本地历史题库来源待补录；不可将此文件误称为官方答案。"}
    > - 本文件将写入面向初学者的教学性参考解；除非确有官方评分答案，所有解答均需标明“自撰参考解”。
    > - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

    ## 写作状态

    待 MinerU 转录、PDF 题面核对和题目拆分完成后，逐题按“动机、定义与符号、必要引理或定理及证明、完整推导、结论、考点、易错点、引用”写入。该文件当前不是完成的解答。
  MARKDOWN
end

def write_indexes(project_dir, title, records)
  notes_dir = File.join(project_dir, "notes", "yau")
  solution_dir = File.join(project_dir, "solutions", "yau")
  FileUtils.mkdir_p(notes_dir)
  FileUtils.mkdir_p(solution_dir)

  rows = records.sort_by { |record| [record[:round], record[:year], record[:category], record[:id]] }.map do |record|
    "| #{record[:year]} | #{record[:round]} | #{record[:category]} | [[#{record[:id]}|题面]] | [解答](../../solutions/yau/#{record[:id]}-solutions.md) | #{record[:extension]} | #{record[:mineru_status]} |"
  end

  File.write(File.join(notes_dir, "README.md"), <<~MARKDOWN, encoding: "UTF-8")
    # 丘成桐大学生数学竞赛资料

    本目录收录与 #{title} 备考相关的丘赛材料。半决赛笔试与总决赛面试是两种不同赛段；分别归档、分别转录、分别解答。

    - 半决赛笔试：现有本地历史题库，原始上游链接待逐份补录。
    - 总决赛面试：来自 [官方相关下载页](#{FINAL_DOWNLOAD_PAGE}) 的 2012--2025 年归档 ZIP。
    - 2026 总决赛面试题目前未在该官方归档中公开；不得以名单或公告替代题面。

    ## 资料清单

    | 年份 | 赛段 | 类别 | 题面 | 解答 | 原始格式 | MinerU |
    | --- | --- | --- | --- | --- | --- | --- |
    #{rows.join("\n")}
  MARKDOWN

  solution_rows = records.sort_by { |record| [record[:round], record[:year], record[:category], record[:id]] }.map do |record|
    "| #{record[:year]} | #{record[:round]} | #{record[:category]} | [#{record[:id]}-solutions](#{record[:id]}-solutions.md) | pending |"
  end

  File.write(File.join(solution_dir, "STATUS.md"), <<~MARKDOWN, encoding: "UTF-8")
    # 丘赛解答状态

    本表只在题面经 MinerU 转录并与原件核对后，才会将解答状态标为完成。当前全部为结构化入口，不表示已有完整解答。

    | 年份 | 赛段 | 类别 | 解答文件 | 状态 |
    | --- | --- | --- | --- | --- |
    #{solution_rows.join("\n")}
  MARKDOWN
end

PROJECTS.each do |project, config|
  project_dir = File.join(ROOT, project)
  source_root = File.join(project_dir, "sources", "yau-contest")
  FileUtils.mkdir_p(File.join(project_dir, "notes", "yau"))
  FileUtils.mkdir_p(File.join(project_dir, "solutions", "yau"))
  records = []

  semifinal_dir = File.join(source_root, "semifinal-written")
  Dir[File.join(ROOT, config[:source_dir], "*.pdf")].sort.each do |source|
    basename = File.basename(source)
    next if basename.downcase.include?("soln")
    next unless (match = basename.match(/(20\d{2})/))

    year = match[1]
    category = role_from_name(basename)
    base = "yau-#{year}-semifinal-written-#{category}"
    destination = stable_destination(semifinal_dir, base, ".pdf", source)
    copy_source(source, destination)
    records << record_for(source: source, destination: destination, year: year, round: "semifinal-written", category: category, provenance: "local historical collection")
  end

  official_solutions = if project == "applied-math-qe-review"
                         [
                           "应用与计算数学/2020_Applied-soln.pdf",
                           "2021/Solution_21S/computational_and_applied_21s_soln.pdf",
                           "2022/Solution_2022/computational_and_applied_22s_soln.pdf"
                         ]
                       else
                         [
                           "概率与统计/2020_Probability-soln.pdf",
                           "2021/Solution_21S/probability_and_statistics_21s_soln.pdf",
                           "2022/Solution_2022/probability_and_statistics_22s_soln.pdf"
                         ]
                       end
  official_solution_dir = File.join(source_root, "official-solutions")
  official_solutions.each do |relative|
    source = File.join(ROOT, relative)
    next unless File.file?(source)

    copy_source(source, File.join(official_solution_dir, File.basename(source)))
  end

  if File.directory?(FINAL_UNPACKED)
    final_dir = File.join(source_root, "final-interview")
    pattern = File.join(FINAL_UNPACKED, "**", "*")
    Dir[pattern].sort.each do |source|
      next unless File.file?(source)
      next unless source.include?(config[:final_directory])
      next unless ALLOWED_FINAL_EXTENSIONS.include?(File.extname(source).downcase)
      next unless (match = File.basename(source).match(/(20\d{2})/))

      year = match[1]
      category = final_category(source)
      detail = slug(File.basename(source, File.extname(source))).sub(/\A#{year}-?/, "")
      base = "yau-#{year}-final-interview-#{category}-#{detail}"
      destination = stable_destination(final_dir, base, File.extname(source).downcase, source)
      copy_source(source, destination)
      records << record_for(source: source, destination: destination, year: year, round: "final-interview", category: category, provenance: "official final-interview archive", official_url: FINAL_DOWNLOAD_PAGE)
    end
  end

  archive_dir = File.join(source_root, "official-archives")
  copy_source(FINAL_ARCHIVE, File.join(archive_dir, File.basename(FINAL_ARCHIVE))) if File.file?(FINAL_ARCHIVE)

  records.each do |record|
    File.write(File.join(project_dir, "notes", "yau", "#{record[:id]}.md"), note_content(record, config[:title]), encoding: "UTF-8")
    File.write(File.join(project_dir, "solutions", "yau", "#{record[:id]}-solutions.md"), solution_content(record, config[:title]), encoding: "UTF-8")
  end

  manifest_path = File.join(source_root, "manifest.json")
  FileUtils.mkdir_p(File.dirname(manifest_path))
  File.write(manifest_path, JSON.pretty_generate({ generated_at: Time.now.iso8601, records: records }) + "\n", encoding: "UTF-8")
  write_indexes(project_dir, config[:title], records)

  audit_dir = File.join(project_dir, "author-runs", "2026-07-28-yau-contest-acquisition")
  FileUtils.mkdir_p(audit_dir)
  lines = records.map do |record|
    "| #{record[:id]} | #{record[:round]} | #{record[:category]} | `#{record[:local_path]}` | #{record[:official_url] || "local historical collection"} | #{record[:sha256]} | #{record[:mineru_status]} |"
  end
  File.write(File.join(audit_dir, "source-inventory.md"), <<~MARKDOWN, encoding: "UTF-8")
    # 丘赛来源清单

    总决赛面试材料来自 [官方相关下载页](#{FINAL_DOWNLOAD_PAGE}) 的 ZIP：`#{FINAL_ARCHIVE_URL}`。半决赛笔试材料来自既有本地历史题库，尚待逐份回填官方上游发布页。

    | ID | 赛段 | 类别 | 本地原件 | 来源 | SHA-256 | MinerU |
    | --- | --- | --- | --- | --- | --- |
    #{lines.join("\n")}
  MARKDOWN
end

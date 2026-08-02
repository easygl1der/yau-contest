#!/usr/bin/env ruby
# frozen_string_literal: true

# Incrementally extracts PDF records from a Yau-contest manifest into the same
# MinerU package contract used by the QE archives. It deliberately does not
# update notes or manifests, so disjoint year ranges can run in parallel.

require "fileutils"
require "json"
require "open3"
require "optparse"
require "tmpdir"

ROOT = File.expand_path("..", __dir__)
CLEANER = "/Users/yitwah/.codex/skills/mineru-document-extractor/scripts/clean_mineru_markdown.py"

options = { project: nil, years: nil, round: nil }
OptionParser.new do |parser|
  parser.banner = "Usage: ruby scripts/extract_yau_mineru.rb --project PROJECT [--years 2012-2018] [--round final-interview]"
  parser.on("--project PROJECT") { |value| options[:project] = value }
  parser.on("--years RANGE", "inclusive year range, e.g. 2012-2018") { |value| options[:years] = value }
  parser.on("--round ROUND", "semifinal-written or final-interview") { |value| options[:round] = value }
end.parse!

abort "--project is required" unless options[:project]
project_dir = File.join(ROOT, options[:project])
manifest_path = File.join(project_dir, "sources", "yau-contest", "manifest.json")
abort "manifest not found: #{manifest_path}" unless File.file?(manifest_path)

year_filter = if options[:years]
                match = options[:years].match(/\A(20\d{2})-(20\d{2})\z/)
                abort "invalid --years: #{options[:years]}" unless match
                (match[1].to_i..match[2].to_i)
              end

records = JSON.parse(File.read(manifest_path, encoding: "UTF-8")).fetch("records")
selected = records.select do |record|
  record["extension"] == "pdf" &&
    (!options[:round] || record["round"] == options[:round]) &&
    (!year_filter || year_filter.cover?(record["year"].to_i))
end

abort "no matching PDF records" if selected.empty?
FileUtils.mkdir_p("/tmp/codex-mineru")

statuses = []
selected.each do |record|
  source = File.join(ROOT, record.fetch("local_path"))
  target = File.join(project_dir, "transcripts", "mineru", record.fetch("id"))
  reading = File.join(target, "reading.md")

  if File.file?(reading)
    statuses << { id: record.fetch("id"), status: "already-present" }
    next
  end

  temp = Dir.mktmpdir("#{record.fetch("id")}-", "/tmp/codex-mineru")
  command = ["mineru-open-api", "extract", source, "--model", "vlm", "--format", "md,json", "--language", "en", "--output", temp, "--timeout", "900"]
  stdout, stderr, status = Open3.capture3(*command)
  unless status.success?
    statuses << { id: record.fetch("id"), status: "failed", detail: stderr.strip }
    warn "MinerU failed: #{record.fetch("id")}: #{stderr.strip}"
    next
  end

  raw_md = Dir[File.join(temp, "*.md")].first
  raw_json = Dir[File.join(temp, "*.json")].first
  unless raw_md && raw_json
    statuses << { id: record.fetch("id"), status: "failed", detail: "missing MinerU md/json output" }
    warn "MinerU incomplete: #{record.fetch("id")}"
    next
  end

  FileUtils.mkdir_p(File.join(target, "parts"))
  FileUtils.ln(source, File.join(target, "source.pdf"))
  FileUtils.cp(raw_md, File.join(target, "parts", "#{record.fetch("id")}.md"))
  FileUtils.cp(raw_json, File.join(target, "parts", "#{record.fetch("id")}.json"))
  images = File.join(temp, "images")
  FileUtils.cp_r(images, File.join(target, "parts", "images")) if Dir.exist?(images)
  FileUtils.cp(raw_md, reading)
  system("python3", CLEANER, "--in-place", reading, exception: true)
  text = File.read(reading, encoding: "UTF-8")
  text.gsub!("](images/", "](parts/images/")
  File.write(reading, text, encoding: "UTF-8")

  File.write(File.join(target, "README.md"), <<~MARKDOWN, encoding: "UTF-8")
    # #{record.fetch("id")}

    这是丘赛原始 PDF 的 MinerU VLM 转录包。`source.pdf` 是原件的硬链接；公式、图形或 OCR 歧义以原件为准。

    - `reading.md`：清理后的阅读稿。
    - `parts/#{record.fetch("id")}.md`：MinerU 原始 Markdown。
    - `parts/#{record.fetch("id")}.json`：MinerU 结构化输出。
    - `parts/images/`：提取的图像资产（如有）。
  MARKDOWN
  statuses << { id: record.fetch("id"), status: "completed", log: stdout.lines.last&.strip }
end

status_dir = File.join(project_dir, "author-runs", "2026-07-28-yau-contest-mineru")
FileUtils.mkdir_p(status_dir)
suffix = [options[:round], options[:years]].compact.join("-").gsub(/[^a-z0-9-]/i, "-")
File.write(File.join(status_dir, "extract-#{suffix.empty? ? "all" : suffix}-#{Process.pid}.json"), JSON.pretty_generate(statuses) + "\n", encoding: "UTF-8")
puts JSON.generate(statuses)

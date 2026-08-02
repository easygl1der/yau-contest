#!/usr/bin/env ruby
# frozen_string_literal: true

# Checks the Yau-contest source, note, and solution contract without treating
# Obsidian block identifiers as part of a local filesystem path.

require "json"

ROOT = File.expand_path("..", __dir__)
PROJECTS = %w[applied-math-qe-review probability-statistics-qe-review].freeze
failures = []

PROJECTS.each do |project|
  project_dir = File.join(ROOT, project)
  manifest = JSON.parse(File.read(File.join(project_dir, "sources", "yau-contest", "manifest.json"), encoding: "UTF-8"))
  manifest.fetch("records").each do |record|
    source = File.join(ROOT, record.fetch("local_path"))
    note = File.join(project_dir, "notes", "yau", "#{record.fetch("id")}.md")
    solution = File.join(project_dir, "solutions", "yau", "#{record.fetch("id")}-solutions.md")
    failures << "#{project}: missing source #{record.fetch("id")}" unless File.file?(source)
    failures << "#{project}: missing note #{record.fetch("id")}" unless File.file?(note)
    failures << "#{project}: missing solution #{record.fetch("id")}" unless File.file?(solution)

    next unless File.file?(note) && File.file?(solution)

    note_text = File.read(note, encoding: "UTF-8")
    solution_text = File.read(solution, encoding: "UTF-8")
    failures << "#{note}: missing solution link" unless note_text.include?("solutions/yau/#{record.fetch("id")}-solutions.md")
    failures << "#{solution}: missing note link" unless solution_text.include?("notes/yau/#{record.fetch("id")}.md")
    failures << "#{solution}: uses non-Obsidian math delimiter" if solution_text.match?(/\\[\(\)\[\]]/)

    reading = File.join(project_dir, "transcripts", "mineru", record.fetch("id"), "reading.md")
    if File.file?(reading)
      failures << "#{note}: missing MinerU link" unless note_text.include?("transcripts/mineru/#{record.fetch("id")}/reading.md")
      note_text.scan(/\]\([^)]*#\^([^)]*)\)/).flatten.each do |block_id|
        failures << "#{note}: missing solution block #{block_id}" unless solution_text.include?("^#{block_id}")
      end
    end
  end
end

if failures.empty?
  puts "yau contest package: valid"
else
  warn failures.join("\n")
  exit 1
end

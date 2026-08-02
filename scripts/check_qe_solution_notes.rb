#!/usr/bin/env ruby
# frozen_string_literal: true

# Validates the contract between the Obsidian exam notes and their teaching
# solution files. It intentionally checks only historical exam notes, not
# syllabus, preface, or checklist notes.

PROJECTS = {
  "applied-math-qe-review" => [7, 7, 7, 6, 7, 7],
  "probability-statistics-qe-review" => [8, 11, 11, 11, 11, 11]
}.freeze
EXAM_GLOB = "notes/{03,04,05,06,07,08}-*.md"
ROOT = File.expand_path("..", __dir__)
FAILURES = []

def report(message)
  FAILURES << message
end

PROJECTS.each do |project, expected_counts|
  project_dir = File.join(ROOT, project)
  note_paths = Dir[File.join(project_dir, EXAM_GLOB)].sort
  report("#{project}: expected six historical exam notes, found #{note_paths.length}") unless note_paths.length == 6

  note_paths.each_with_index do |note_path, index|
    note = File.read(note_path, encoding: "UTF-8")
    link = note.match(%r{\[逐题参考解\]\(\.\./solutions/([^\)]+)\)})
    unless link
      report("#{note_path}: missing solution link")
      next
    end

    solution_path = File.join(project_dir, "solutions", link[1])
    unless File.file?(solution_path)
      report("#{note_path}: linked solution does not exist: #{link[1]}")
      next
    end

    solution = File.read(solution_path, encoding: "UTF-8")
    report("#{solution_path}: not valid UTF-8") unless solution.valid_encoding?
    report("#{solution_path}: contains LaTeX backslash delimiters; use Obsidian dollar delimiters") if solution.match?(/\\[\(\)\[\]]/)
    report("#{solution_path}: missing source link") unless solution.include?("官方原卷")
    report("#{solution_path}: missing Obsidian delimiter policy") unless solution.include?("$...$")
    question_count = solution.scan(/^## 题 /).length
    report("#{solution_path}: expected #{expected_counts[index]} question sections, found #{question_count}") unless question_count == expected_counts[index]
    report("#{solution_path}: contains unfinished question placeholders") if solution.include?("[!todo]")
  end
end

if FAILURES.empty?
  puts "solution-note contract: valid"
else
  warn FAILURES.join("\n")
  exit 1
end

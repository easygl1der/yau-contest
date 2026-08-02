#!/usr/bin/env ruby
# frozen_string_literal: true

# Validates the generated book-reading layer without trusting generated output.

require "json"
require "pathname"

PRML_EXERCISE_MARKER = /^(\s*(?:#+\s*)?(?:\d+\.\d+\s+)?\()((?:[\u0001\u000C]\s*)+)(\))/.freeze
PDF_CONFIRMED_CONTROL_CODEPOINT_PATTERNS = {
  "computer-vision-algorithms-applications" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [454, 537, 684, 690]
    }
  },
  "deep-learning-foundations-concepts" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [235, 256, 495, 522, 571]
    }
  },
  "foundations-of-machine-learning-2e" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [32, 135, 294, 325, 374, 488]
    },
    0x0003 => {
      "replacement" => "$\\square$",
      "visual_confirmation_pdf_pages" => [99, 126, 209, 368]
    }
  },
  "lectures-modern-convex-optimization" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [34, 136, 319, 400, 433]
    },
    0x0017 => {
      "replacement" => "$\\succeq$",
      "visual_confirmation_pdf_pages" => [51, 178, 284, 552, 558]
    }
  },
  "lectures-convex-optimization" => {
    0x0003 => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [29, 156, 222, 306, 441]
    },
    0x000E => {
      "replacement" => "$\\square$",
      "visual_confirmation_pdf_pages" => [156, 260, 279]
    },
    0x000F => {
      "replacement" => "$\\sum$",
      "visual_confirmation_pdf_pages" => [165, 542]
    },
    0x0015 => {
      "replacement" => "$\\varkappa$",
      "visual_confirmation_pdf_pages" => [153, 257]
    },
    0x001D => {
      "replacement" => "$\\cap$",
      "visual_confirmation_pdf_pages" => [351]
    }
  },
  "pattern-recognition-machine-learning" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [716, 757]
    },
    0x000E => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [229, 263, 359, 459, 473]
    }
  },
  "speech-language-processing" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [29, 38, 44, 55, 58, 71]
    }
  },
  "understanding-machine-learning" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [47, 57, 68, 367, 385]
    },
    0x001C => {
      "replacement" => "$\\ll$",
      "visual_confirmation_pdf_pages" => [350]
    }
  }
}.freeze

def normalised_source_text(text)
  text.to_s.gsub(/[\u0000-\u001F]/, "").gsub(/\s+/, " ").strip
end

def markdown_list_line(text)
  text.to_s.gsub(/(?m)^([ \t]*)•[ \t]+/, "\\1- ")
end

def inline_dollar_markers(text)
  text.lines.sum do |line|
    next 0 if line.include?("<table")

    candidate = line.gsub(/\\tag\{\$\}/, "")
    markers = candidate.enum_for(:scan, /(?<!\\)\$/).map { Regexp.last_match.begin(0) }
    if markers.length == 1
      suffix = candidate[(markers.first + 1)..]
      next 0 if suffix&.match?(/\A(?:\d|_)/)
    end
    markers.length
  end
end

def render_risk_types(text)
  types = []
  types << "placeholder-token" if text.match?(/\(\?\s*\?\s*\?\)/)
  types << "replacement-character" if text.include?("�")
  types << "adjacent-html-superscripts" if text.match?(/<sup>[^<]*<\/sup>\s*<sup>/)
  types
end

def prml_exercise_marker_replacement(line)
  match = line.match(PRML_EXERCISE_MARKER)
  return nil unless match

  match[1] + ("★" * match[2].count("\u0001\u000C")) + match[3]
end

def confirmed_control_codepoint_pattern(slug, codepoint)
  PDF_CONFIRMED_CONTROL_CODEPOINT_PATTERNS.dig(slug, codepoint)
end

ROOT = Pathname.new(__dir__).join("..").realpath
BOOKS_ROOT = ENV["AI_QE_BOOKS_OUT"] ? Pathname.new(ENV.fetch("AI_QE_BOOKS_OUT")).expand_path : ROOT.join("books")
failures = []
review_risks = []
strict = ARGV.delete("--strict")

manifest_path = BOOKS_ROOT.join("library-manifest.json")
abort "missing library manifest: #{manifest_path}" unless manifest_path.file?
library = JSON.parse(manifest_path.read)

library.fetch("books").each do |book|
  book_dir = BOOKS_ROOT.join(book.fetch("slug"))
  book_manifest_path = book_dir.join("manifest.json")
  failures << "#{book.fetch("slug")}: missing README" unless book_dir.join("README.md").file?
  failures << "#{book.fetch("slug")}: missing review log" unless book_dir.join("review-log.md").file?
  failures << "#{book.fetch("slug")}: missing image caption audit" unless book_dir.join("image-caption-audit.json").file?
  failures << "#{book.fetch("slug")}: missing image review queue" unless book_dir.join("image-review-queue.json").file?
  failures << "#{book.fetch("slug")}: missing control-character review queue" unless book_dir.join("control-character-review-queue.json").file?
  failures << "#{book.fetch("slug")}: missing render-risk review queue" unless book_dir.join("render-risk-review-queue.json").file?
  failures << "#{book.fetch("slug")}: missing chapter boundary audit" unless book_dir.join("chapter-boundary-audit.json").file?
  unless book_manifest_path.file?
    failures << "#{book.fetch("slug")}: missing manifest"
    next
  end

  book_manifest = JSON.parse(book_manifest_path.read)
  chapters = book_manifest.fetch("chapters")
  failures << "#{book.fetch("slug")}: no chapter files" if chapters.empty?
  failures << "#{book.fetch("slug")}: manifest chapter count mismatch" unless chapters.length == book.fetch("chapter_count")

  previous_end = 0
  chapters.each do |chapter|
    path = book_dir.join("chapters", chapter.fetch("filename"))
    failures << "#{book.fetch("slug")}: missing #{chapter.fetch("filename")}" unless path.file?
    next if chapter["blocked"]
    failures << "#{book.fetch("slug")}: source lines overlap at chapter #{chapter.fetch("number")}" if chapter.fetch("source_line_start") <= previous_end
    failures << "#{book.fetch("slug")}: invalid source range at chapter #{chapter.fetch("number")}" if chapter.fetch("source_line_end") < chapter.fetch("source_line_start")
    previous_end = chapter.fetch("source_line_end")
    next unless path.file?

    text = path.read
    failures << "#{path}: missing frontmatter" unless text.start_with?("---\n")
    failures << "#{path}: missing cite callout" unless text.include?("> [!cite] 来源与可追溯性")
    has_image_review_label = text.include?("![原书图像；请以 source.pdf 为准](") || text.match?(/!\[(?:Figure|Fig\.|Table|Algorithm)\s+\d+/i)
    if has_image_review_label && !text.match?(/^review_status:\s*needs-manual-review\s*$/)
      failures << "#{path}: image labels lack needs-manual-review status"
    end
    failures << "#{path}: unbalanced display math" if text.lines.count { |line| line.strip == "$$" }.odd?
    failures << "#{path}: unbalanced inline math" if inline_dollar_markers(text).odd?
    failures << "#{path}: control characters remain" if text.each_codepoint.any? { |point| point < 32 && ![9, 10, 13].include?(point) }
    begins = text.scan(/\\begin\{([^}]+)\}/).flatten.each_with_object(Hash.new(0)) { |name, counts| counts[name] += 1 }
    ends = text.scan(/\\end\{([^}]+)\}/).flatten.each_with_object(Hash.new(0)) { |name, counts| counts[name] += 1 }
    if begins != ends
      review_risks << "#{path}: unmatched LaTeX environments"
      unless text.match?(/^review_status:\s*needs-manual-review\s*$/)
        failures << "#{path}: unmatched LaTeX environments lacks needs-manual-review status"
      end
      failures << "#{path}: unmatched LaTeX environments" if strict
    end
    text.scan(/!\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/).flatten.each do |relative|
      failures << "#{path}: missing image #{relative}" unless path.dirname.join(relative).file?
    end
    text.scan(/!\[\[([^\]#]+)(?:#page=\d+)?\]\]/).flatten.each do |relative|
      failures << "#{path}: missing embedded PDF #{relative}" unless path.dirname.join(relative).file?
    end
  end

  audit_path = book_dir.join("image-caption-audit.json")
  next unless audit_path.file?
  audit = JSON.parse(audit_path.read)
  expected_caption_count = chapters.reject { |chapter| chapter["blocked"] }.sum do |chapter|
    chapter.fetch("diagnostics", {}).fetch("caption_derived_image_alt", 0)
  end
  entries = audit.fetch("entries")
  failures << "#{book.fetch("slug")}: image caption audit count mismatch" unless entries.length == expected_caption_count
  transcript_path = ROOT.join(audit.fetch("source_transcript"))
  transcript_lines = transcript_path.file? ? transcript_path.readlines(chomp: true) : []
  failures << "#{book.fetch("slug")}: image caption audit transcript missing" unless transcript_path.file?
  entries.each do |entry|
    chapter_path = book_dir.join(entry.fetch("chapter_file"))
    image_path = chapter_path.dirname.join(entry.fetch("image_path"))
    failures << "#{book.fetch("slug")}: caption audit image missing #{entry.fetch("image_path")}" unless image_path.file?
    source_line = entry.fetch("caption_source_line")
    source_text = transcript_lines[source_line - 1]
    figure_id = Regexp.escape(entry.fetch("figure_id"))
    image_source_line = entry.fetch("image_source_line")
    image_source_text = transcript_lines[image_source_line - 1]
    unless image_source_text && image_source_text.include?(File.basename(entry.fetch("image_path")))
      failures << "#{book.fetch("slug")}: caption audit image-source mismatch at line #{image_source_line}"
    end
    unless source_text && source_text.strip == entry.fetch("caption_text") && source_text.match?(/^\s*Figure\s+#{figure_id}(?:\s|:|\.)/i)
      failures << "#{book.fetch("slug")}: caption audit source mismatch at line #{source_line}"
    end
    if entry["caption_body_source_relative_line"]
      body_line = entry.fetch("caption_body_source_line")
      body_text = transcript_lines[body_line - 1]
      unless body_text && body_text.strip == entry.fetch("caption_body_text")
        failures << "#{book.fetch("slug")}: caption audit body mismatch at line #{body_line}"
      end
    end
  end

  queue_path = book_dir.join("image-review-queue.json")
  next unless queue_path.file?
  queue_entries = JSON.parse(queue_path.read).fetch("entries")
  expected_image_count = chapters.reject { |chapter| chapter["blocked"] }.sum { |chapter| chapter.fetch("image_count", 0) }
  failures << "#{book.fetch("slug")}: image review queue count mismatch" unless queue_entries.length == expected_image_count
  queue_entries.each do |entry|
    chapter_path = book_dir.join(entry.fetch("chapter_file"))
    image_path = chapter_path.dirname.join(entry.fetch("image_path"))
    failures << "#{book.fetch("slug")}: review queue image missing #{entry.fetch("image_path")}" unless image_path.file?
    source_line = entry.fetch("source_image_line")
    source_text = transcript_lines[source_line - 1]
    unless source_text && source_text.include?(File.basename(entry.fetch("image_path")))
      failures << "#{book.fetch("slug")}: review queue source mismatch at line #{source_line}"
    end
  end

  control_queue_path = book_dir.join("control-character-review-queue.json")
  next unless control_queue_path.file?
  control_entries = JSON.parse(control_queue_path.read).fetch("entries")
  expected_control_count = chapters.reject { |chapter| chapter["blocked"] }.sum do |chapter|
    chapter.fetch("diagnostics", {}).fetch("source_control_characters", 0)
  end
  failures << "#{book.fetch("slug")}: control-character queue count mismatch" unless control_entries.length == expected_control_count
  control_entries.each do |entry|
    source_text = transcript_lines[entry.fetch("source_line") - 1]
    codepoint = entry.fetch("codepoint").sub("U+", "").to_i(16)
    unless source_text && source_text.codepoints.include?(codepoint)
      failures << "#{book.fetch("slug")}: control-character source mismatch at line #{entry.fetch("source_line")}" 
    end
    if entry.fetch("review_status") == "repaired-pattern-confirmed"
      replacement_line = prml_exercise_marker_replacement(source_text.to_s)
      chapter_path = book_dir.join(entry.fetch("chapter_file"))
      resolution = entry["resolution"]
      prml_valid = book.fetch("slug") == "pattern-recognition-machine-learning" && [0x0001, 0x000C].include?(codepoint) && replacement_line &&
        resolution && resolution.fetch("kind") == "prml-exercise-difficulty-marker" &&
        resolution.fetch("replacement") == ("★" * source_text.count("\u0001\u000C")) && resolution.fetch("visual_rule_confirmation_pdf_page") == 145 &&
        chapter_path.file? && chapter_path.read.include?(replacement_line)
      codepoint_pattern = confirmed_control_codepoint_pattern(book.fetch("slug"), codepoint)
      pattern_valid = codepoint_pattern && resolution && resolution.fetch("kind") == "book-specific-control-codepoint-pattern" &&
        resolution.fetch("replacement") == codepoint_pattern.fetch("replacement") &&
        resolution.fetch("visual_confirmation_pdf_pages") == codepoint_pattern.fetch("visual_confirmation_pdf_pages") &&
        chapter_path.file? && chapter_path.read.include?(codepoint_pattern.fetch("replacement"))
      unless prml_valid || pattern_valid
        failures << "#{book.fetch("slug")}: invalid pattern-confirmed control repair at line #{entry.fetch("source_line")}" 
      end
    elsif entry.fetch("review_status") == "repaired-pdf-confirmed"
      resolution = entry["resolution"]
      chapter_path = book_dir.join(entry.fetch("chapter_file"))
      unless resolution && resolution.fetch("kind") == "control-symbol-line" && resolution.fetch("pdf_page").positive? &&
          resolution.fetch("replacement_line").is_a?(String) && chapter_path.file? && chapter_path.read.include?(markdown_list_line(resolution.fetch("replacement_line")))
        failures << "#{book.fetch("slug")}: invalid PDF-confirmed control repair at line #{entry.fetch("source_line")}" 
      end
    elsif entry["resolution"]
      failures << "#{book.fetch("slug")}: unresolved control entry has a repair at line #{entry.fetch("source_line")}" 
    end
    next unless entry["json_evidence"]
    evidence = entry.fetch("json_evidence")
    failures << "#{book.fetch("slug")}: invalid control-character PDF page" unless evidence.fetch("pdf_page").positive?
    failures << "#{book.fetch("slug")}: invalid control-character page index" if evidence.fetch("page_idx").negative?
  end

  render_queue_path = book_dir.join("render-risk-review-queue.json")
  next unless render_queue_path.file?
  render_entries = JSON.parse(render_queue_path.read).fetch("entries")
  readable_chapters = chapters.reject { |chapter| chapter["blocked"] }
  expected_render_lines = transcript_lines.each_with_index.count do |line, index|
    source_line = index + 1
    readable_chapters.any? { |chapter| source_line.between?(chapter.fetch("source_line_start"), chapter.fetch("source_line_end")) } && !render_risk_types(line).empty?
  end
  failures << "#{book.fetch("slug")}: render-risk queue count mismatch" unless render_entries.length == expected_render_lines
  transcript_dir = ROOT.join(book_manifest.fetch("reading_markdown")).dirname
  render_entries.each do |entry|
    source_text = transcript_lines[entry.fetch("source_line") - 1]
    expected_types = render_risk_types(source_text)
    unless source_text && entry.fetch("context") == source_text.strip && entry.fetch("risk_types") == expected_types
      failures << "#{book.fetch("slug")}: render-risk source mismatch at line #{entry.fetch("source_line")}" 
    end
    if entry.fetch("review_status") == "repaired-pdf-confirmed"
      resolution = entry["resolution"]
      chapter_path = book_dir.join(entry.fetch("chapter_file"))
      exercise_marker_valid = if resolution&.fetch("kind") == "exercise-difficulty-marker"
        source_marker = resolution.fetch("exercise").start_with?("17.1 (number missing") ? "(? ? ?) We would like" : "#{resolution.fetch("exercise")} (? ? ?)"
        repaired_marker = resolution.fetch("exercise").start_with?("17.1 (number missing") ? "(#{resolution.fetch("replacement")}) We would like" : "#{resolution.fetch("exercise")} (#{resolution.fetch("replacement")})"
        resolution.fetch("pdf_page").positive? && source_text&.include?(source_marker) && chapter_path.file? && chapter_path.read.include?(repaired_marker)
      else
        false
      end
      control_line_valid = resolution&.fetch("kind") == "control-symbol-line" && resolution.fetch("pdf_page").positive? &&
        resolution.fetch("replacement_line").is_a?(String) && chapter_path.file? && chapter_path.read.include?(markdown_list_line(resolution.fetch("replacement_line")))
      unless exercise_marker_valid || control_line_valid
        failures << "#{book.fetch("slug")}: invalid repaired render-risk entry at line #{entry.fetch("source_line")}" 
      end
    elsif entry["resolution"]
      failures << "#{book.fetch("slug")}: unresolved render-risk entry has a repair at line #{entry.fetch("source_line")}" 
    end
    next unless entry["json_evidence"]
    evidence = entry.fetch("json_evidence")
    json_path = transcript_dir.join("parts", evidence.fetch("part"), "source.json")
    unless json_path.file? && evidence.fetch("pdf_page").positive? && !evidence.fetch("page_idx").negative?
      failures << "#{book.fetch("slug")}: invalid render-risk JSON evidence at line #{entry.fetch("source_line")}" 
      next
    end
    normalised_line = normalised_source_text(source_text)
    matched = JSON.parse(json_path.read).any? do |block|
      block_text = normalised_source_text(block.fetch("text", ""))
      block.fetch("page_idx", 0).to_i == evidence.fetch("page_idx") &&
        block["bbox"] == evidence["bbox"] &&
        block_text.include?(normalised_line)
    end
    failures << "#{book.fetch("slug")}: render-risk JSON evidence mismatch at line #{entry.fetch("source_line")}" unless matched
  end

  boundary_audit_path = book_dir.join("chapter-boundary-audit.json")
  next unless boundary_audit_path.file?
  boundary_entries = JSON.parse(boundary_audit_path.read).fetch("entries")
  readable_chapters = chapters.reject { |chapter| chapter["blocked"] }
  failures << "#{book.fetch("slug")}: chapter boundary audit count mismatch" unless boundary_entries.length == readable_chapters.length
  chapter_by_number = readable_chapters.each_with_object({}) { |chapter, index| index[chapter.fetch("number")] = chapter }
  transcript_dir = ROOT.join(book_manifest.fetch("reading_markdown")).dirname
  boundary_entries.each do |entry|
    chapter = chapter_by_number[entry.fetch("chapter_number")]
    unless chapter
      failures << "#{book.fetch("slug")}: boundary audit references unknown chapter #{entry.fetch("chapter_number")}" 
      next
    end
    %w[source_line_start source_line_end first_section_source_line].each do |field|
      unless entry.fetch(field) == chapter.fetch(field)
        failures << "#{book.fetch("slug")}: boundary audit #{field} mismatch for chapter #{chapter.fetch("number")}" 
      end
    end
    heading = transcript_lines[entry.fetch("source_line_start") - 1]&.strip&.sub(/^\#{1,6}\s+/, "")
    section_line = entry.fetch("first_section_source_line")
    section = section_line ? transcript_lines[section_line - 1]&.strip&.sub(/^\#{1,6}\s+/, "") : nil
    failures << "#{book.fetch("slug")}: boundary audit heading mismatch for chapter #{chapter.fetch("number")}" unless heading == entry.fetch("heading")
    failures << "#{book.fetch("slug")}: boundary audit section mismatch for chapter #{chapter.fetch("number")}" unless section == entry.fetch("section_anchor")
    status = entry.fetch("status")
    unless %w[exact-json-page ambiguous-json-page unresolved-json-page].include?(status)
      failures << "#{book.fetch("slug")}: invalid boundary audit status for chapter #{chapter.fetch("number")}" 
      next
    end
    if status == "exact-json-page"
      failures << "#{book.fetch("slug")}: exact boundary audit lacks one candidate for chapter #{chapter.fetch("number")}" unless entry.fetch("candidate_count") == 1
      evidence = entry["json_evidence"]
      unless evidence && evidence.fetch("pdf_page").positive? && !evidence.fetch("page_idx").negative?
        failures << "#{book.fetch("slug")}: invalid exact boundary evidence for chapter #{chapter.fetch("number")}" 
        next
      end
      json_path = transcript_dir.join("parts", evidence.fetch("part"), "source.json")
      unless json_path.file?
        failures << "#{book.fetch("slug")}: missing boundary evidence JSON for chapter #{chapter.fetch("number")}" 
        next
      end
      anchors = [normalised_source_text(entry.fetch("heading")), normalised_source_text(entry.fetch("section_anchor"))]
      matched = JSON.parse(json_path.read).any? do |block|
        block.fetch("page_idx", 0).to_i == evidence.fetch("page_idx") &&
          block["bbox"] == evidence["bbox"] &&
          anchors.any? { |anchor| !anchor.empty? && normalised_source_text(block["text"]).include?(anchor) }
      end
      failures << "#{book.fetch("slug")}: boundary evidence JSON mismatch for chapter #{chapter.fetch("number")}" unless matched
    else
      failures << "#{book.fetch("slug")}: non-exact boundary audit has page evidence for chapter #{chapter.fetch("number")}" if entry["json_evidence"]
    end
  end
end

if failures.empty?
  puts "AI QE book library structural check passed: #{library.fetch("books").length} books; #{review_risks.length} formula-risk chapter(s) remain in the review queue"
  warn review_risks.join("\n") unless review_risks.empty?
else
  warn failures.join("\n")
  exit 1
end

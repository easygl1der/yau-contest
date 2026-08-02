# Scope, Source Policy, and Incremental Workflow

## Scope

This collection contains the Computational and Applied Mathematics PhD Qualifying Examination papers publicly listed in Qiuzhen College's official examination-resources archive. It covers six terms from Fall 2023 through Spring 2026 and includes the examination syllabus published on 2026-06-30.

## Source Policy

Each examination has four traceable records: the official release page, the downloaded original PDF, the MinerU VLM `reading.md` reading edition, and `parts/`, which retains the original Markdown, JSON, and image assets. `notes-en/` directly links to MinerU's mathematical Markdown; the original examination PDF remains authoritative for problem statements, layout, and notation.

## Incremental Workflow

1. Place a newly released official PDF in `sources/exams/`, using the name `qzc-qe-...-YYYY-term.pdf`.
2. Run `mineru-open-api extract --model vlm --format md,json` to create `transcripts/mineru/<exam-name>/parts/`, and write the cleaned Markdown to `reading.md`.
3. Register the term and its official release page in `TERMS` in the repository-root script `scripts/build_qe_mineru_notes.rb`.
4. Run `ruby scripts/export_obsidian_notes.rb` from the project root, then manually verify each formula-dense problem page by page.

This directory layout intentionally follows `ai-qe-review/`: sources and reading notes are kept separate, and `chapters/`, `main.tex`, `refs.bib`, and complete solutions can be added later without disturbing the original examination archive.

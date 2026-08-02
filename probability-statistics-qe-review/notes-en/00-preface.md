# Scope, Source Policy, and Incremental Workflow

## Scope

This archive contains the Probability and Statistics PhD Qualifying Examination papers publicly listed in Qiuzhen College's official Examination Questions Resources. It covers six semesters, from Fall 2023 through Spring 2026, together with the syllabus released on 2026-06-30.

## Source Policy

Each paper has four traceability layers: the official publication page, the downloaded source PDF, MinerU VLM's `reading.md` version, and the `parts/` directory containing the original Markdown, JSON, and image assets. `notes/` links directly to MinerU's mathematical Markdown; the source PDF remains authoritative for question text, layout, and notation.

## Incremental Workflow

1. Place each newly released official PDF in `sources/exams/` and name it `qzc-qe-...-YYYY-term.pdf`.
2. Run `mineru-open-api extract --model vlm --format md,json` to create `transcripts/mineru/<exam-name>/parts/`, then write the cleaned Markdown to `reading.md`.
3. Register the semester and official publication page in the `TERMS` constant in the repository-root script `scripts/build_qe_mineru_notes.rb`.
4. Run `ruby scripts/export_obsidian_notes.rb` from the project root, then verify formula-intensive questions manually against the source PDF, page by page.

This directory structure deliberately follows `ai-qe-review/`: source materials and reading notes are separate. Future additions such as `chapters/`, `main.tex`, `refs.bib`, and full solutions can be made without altering the source-paper archive.

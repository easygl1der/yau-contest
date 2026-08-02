# AI QE Review Notes: English Obsidian Index

This directory is the English companion to `../notes/`, exported from `../main.tex` and `../chapters/*.tex`. The LaTeX source remains authoritative; `../build/main.pdf` is the corresponding 104-page reading edition.

## Notes

- [[00-preface|Purpose and Use]]  
  Source: `chapters/00-preface.tex`
- [[01-syllabus|Examination Syllabus and Topic Map]]  
  Source: `chapters/01-syllabus.tex`, `chapters/01-textbooks.tex`
- [[01-textbooks|Guide to the Designated Textbooks]]  
  Source: `chapters/01-textbooks.tex`
- [[02-primer|Theoretical Foundations]]  
  Source: `chapters/02-primer.tex`
- [[03-2025-spring|Spring 2025 QE-AI Past-Exam Solutions]]  
  Source: `chapters/03-2025-spring.tex`
- [[04-2025-fall|Fall 2025 QE-AI Past-Exam Solutions]]  
  Source: `chapters/04-2025-fall.tex`
- [[05-2026-spring|Spring 2026 QE-AI Past-Exam Solutions]]  
  Source: `chapters/05-2026-spring.tex`
- [[90-checklists|Pre-Exam Checklist and Incremental Study Plan]]  
  Source: `chapters/90-checklists.tex`

## Formulas, Links, and Images

- Inline and display mathematics retain LaTeX and render through Obsidian MathJax.
- LaTeX chapter and concept cross-references are represented as Obsidian wikilinks, primarily to definitions and explanatory sections in `02-primer.md`.
- The chapters currently included by `main.tex` contain no `\includegraphics` calls. The exporter converts future `\includegraphics{path}` calls into Markdown image links relative to this directory.
- Citations use the Pandoc/Obsidian Citation Plugin form `[@citation-key]`; see [[references]] for the bibliography.

## Re-exporting

Run the following command from `ai-qe-review`:

```bash
ruby scripts/export_obsidian_notes.rb
```

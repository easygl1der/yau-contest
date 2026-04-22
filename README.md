# 2010-2025 Past Exam Papers

Collection of past exam papers from the S.-T. Yau College Student Mathematics Contest.

## Quick Compile

```bash
cd latex-project && bash compile.sh
```

The compiled PDF will be at `latex-project/main.pdf` (460+ pages).

For a single-pass compile (faster for testing):

```bash
cd latex-project && pdflatex -interaction=nonstopmode main.tex
```

## Subject Categories

| Subject | Files | Year Range | Transcripts |
|---------|-------|------------|-------------|

## Statistics

- Total PDFs: 291
- Total Markdown transcripts: 146
- Last updated: 2026-04-22

## Folder Structure

- **latex-project/** — Full LaTeX book project with chapter structure
  - `main.tex` — Root document
  - `content/` — Individual year/chapter tex files (split_algebra, split_analysis, etc.)
  - `syllabi/` — Official contest syllabi (2010–2025)
  - `compile.sh` — Compilation script
- **Year folders (2010-2025)** — Exam papers organized by year
- **Subject folders** — Exam papers organized by subject category

## File Naming Convention

- `{Year}_{Subject}-individual.pdf` - Individual competition papers
- `{Year}_{Subject}-team.pdf` - Team competition papers
- `{Year}_{Subject}-soln.pdf` - Solutions

## Book Structure (latex-project)

```
main.tex
├── introduction.tex          — Contest overview, recurring themes
├── preparation_guide.tex     — Exam prep knowledge map (all 6 subjects)
├── split_algebra/           — 2010–2025 Algebra & Number Theory
├── split_analysis/          — 2010–2025 Analysis & Differential Equations
├── split_geometry/         — 2011–2025 Geometry & Topology
├── split_probability/       — 2010–2025 Probability & Statistics
├── split_applied/          — 2011–2025 Applied & Computational Math
└── split_physics/          — 2022–2025 Mathematical Physics
```

## Disclaimer

These papers are collected from public sources for educational and research purposes only.

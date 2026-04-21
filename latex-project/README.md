# YAU Contest Past Exam Papers — LaTeX Edition

A LaTeX compilation of the S.-T. Yau College Student Mathematics Contest papers (2010–2025), typeset with the [kaobook](https://github.com/fmarotta/kaobook) class.

## Compile

```bash
cd latex-project
./compile.sh
```

This runs `pdflatex` twice (for synctex and cross-references) and outputs `main.pdf`.

Alternatively, use `latexmk`:

```bash
latexmk -pdf main.tex
```

### VS Code (LaTeX Workshop)

If you use VS Code with the LaTeX Workshop extension, open `main.tex` and press **Build** (`Ctrl+Alt+B` / `Cmd+Alt+B`). The recipe is configured in `.vscode/settings.json`.

## Project Structure

```
latex-project/
├── main.tex              # Main entry point
├── config.tex            # Preamble: packages, theorem styles, macros
├── compile.sh            # Compilation script
├── main.pdf              # Output (generated after compilation)
├── content/
│   ├── introduction.tex   # Chapter 0: overview + knowledge map
│   ├── algebra.tex       # Algebra & Number Theory (loader)
│   ├── analysis.tex      # Analysis & Differential Equations (loader)
│   ├── geometry.tex      # Geometry & Topology (loader)
│   ├── probability.tex   # Probability & Statistics (loader)
│   ├── applied.tex       # Applied & Computational Mathematics (loader)
│   ├── physics.tex       # Mathematical Physics (loader)
│   ├── split_analysis/   # Year-wise analysis files
│   ├── split_algebra/    # Year-wise algebra files
│   ├── split_geometry/   # Year-wise geometry files
│   ├── split_probability/# Year-wise probability files
│   ├── split_applied/    # Year-wise applied math files
│   └── split_physics/    # Year-wise physics files
├── images/               # Figures referenced in the documents
├── listings/            # Code listing styles
└── scripts/             # Utility scripts (split/merge/processing)
```

## Dependencies

- **TeX Live 2026** (or later) with full packages
- **kaobook** class — installed at `~/Library/texmf/tex/latex/kaobook/`
- If `kaobook` is not installed locally, run:
  ```bash
  tlmgr install kaobook
  ```

## Key Features

- **Chapter 0** — Exam overview with topic-by-topic breakdown for every year and subject
- **Sidebar TOC** — Each chapter's first page shows a margin table of contents (kaobook `margintoc`)
- **Solutions** — Every exercise is followed by a detailed solution
- **Synctex** — Enabled for forward/reverse search with Skim or PDF viewers

## Notes

- Problems are organized into **6 tracks**: Algebra & Number Theory, Analysis & Differential Equations, Geometry & Topology, Probability & Statistics, Applied & Computational Mathematics, Mathematical Physics
- Mathematical Physics was first introduced in **2022**
- Between 2010–2016, some subjects had separate Individual and Team rounds (10–14 questions per year). From 2017 onward, each subject has 5–6 questions per year
- The `\solution` environment is defined in `config.tex` as an unnumbered theorem (`\newtheorem*{solution}{Solution}`), producing a clean "Solution:" heading without a counter

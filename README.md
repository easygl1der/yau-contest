# S.-T. Yau College Student Mathematics Contest
## Past Exam Papers (2010–2026)

> A comprehensive collection of past exam papers from the S.-T. Yau College Student Mathematics Contest, spanning 17 years and 6 mathematical disciplines. Each subject includes official syllabi, problem statements, and solutions.

[![Total PDFs](https://img.shields.io/badge/Total%20PDFs-124-blue?style=flat-square)](#)
[![Markdown Transcripts](https://img.shields.io/badge/Transcripts-295-green?style=flat-square)](#)
[![Coverage](https://img.shields.io/badge/Coverage-2010--2026-orange?style=flat-square)](#)

---

## Quick Start

### Compile the Book

```bash
cd latex-project && bash compile.sh
```

Output: `latex-project/main.pdf` (~460 pages)

> For faster single-pass compilation during editing:
> ```bash
> cd latex-project && pdflatex -interaction=nonstopmode main.tex
> ```

### Repository Structure

```
yau-contest/
├── latex-project/          # Full LaTeX book (main.tex + content/)
│   ├── main.tex            # Root document
│   ├── compile.sh           # Two-pass compile script
│   ├── content/             # Chapter files (by subject + year)
│   │   ├── introduction.tex          # Contest overview + recurring themes
│   │   ├── preparation_guide.tex    # Exam prep knowledge map
│   │   ├── split_algebra/          # 2010–2026 Algebra & Number Theory
│   │   ├── split_analysis/          # 2010–2026 Analysis & Differential Equations
│   │   ├── split_geometry/         # 2011–2026 Geometry & Topology
│   │   ├── split_probability/       # 2010–2026 Probability & Statistics
│   │   ├── split_applied/          # 2011–2026 Applied & Computational Math
│   │   └── split_physics/          # 2022–2026 Mathematical Physics
│   └── syllabi/            # Official contest syllabi (6 PDFs)
├── 2010–2026/              # Raw exam papers organized by year
├── 代数与数论/              # Raw exam papers organized by subject (Chinese)
├── 几何与拓扑/
├── 概率与统计/
├── 应用与计算数学/
├── 分析与微分方程/
└── 数学物理/
```

---

## Subject Coverage

| Subject | PDFs | Year Range | Transcripts |
|:---|---:|:---:|:---:|
| Algebra & Number Theory (代数与数论) | 25 | 2010-2026 (sparse) | 25 |
| Geometry & Topology (几何与拓扑) | 26 | 2010-2026 (sparse) | 17 |
| Probability & Statistics (概率与统计) | 22 | 2010-2026 (sparse) | 39 |
| Applied & Computational Math (应用与计算数学) | 22 | 2010-2026 (sparse) | 22 |
| Analysis & Differential Equations (分析与微分方程) | 24 | 2010-2026 (sparse) | 24 |
| Mathematical Physics (数学物理) | 5 | 2022-2026 | 5 |

---

## What's in the Book

The compiled PDF (`latex-project/main.pdf`) contains:

- **Introduction** — Contest structure, question counts per year, notable structural changes, verified recurring knowledge points
- **Exam Preparation Guide** — Topic-by-topic knowledge map for all 6 subjects, combining official syllabi with actual exam content
- **Problem Sets** (2010–2026) — Full problem statements and solutions for each subject

### Subject Descriptions

| Track | Years | Topics |
|:---|:---:|:---|
| Algebra & Number Theory | 2010–2026 | Group theory, Galois theory, representation theory, algebraic geometry, $p$-adic analysis |
| Analysis & Differential Equations | 2010–2026 | Complex analysis, measure theory, functional analysis, PDEs, Fourier analysis |
| Geometry & Topology | 2011–2026 | Algebraic topology, differential geometry, Riemannian geometry, Lie groups |
| Probability & Statistics | 2010–2026 | Stochastic processes, martingales, statistical estimation, random graphs |
| Applied & Computational Mathematics | 2011–2026 | Numerical analysis, finite difference/element methods, optimization, dynamical systems |
| Mathematical Physics | 2022–2026 | Quantum mechanics, classical mechanics, electromagnetism, QFT, general relativity |

---

## File Naming

| Pattern | Description |
|:---|:---|
| `{{Year}}_{{Subject}}-individual.pdf` | Individual competition paper |
| `{{Year}}_{{Subject}}-team.pdf` | Team competition paper |
| `{{Year}}_{{Subject}}-soln.pdf` | Official solutions |

---

## Contributing

This repository is maintained automatically. Statistical summaries and file counts are regenerated on every commit via a `post-commit` hook.

---

## Disclaimer

All materials are collected from public sources for educational and research purposes only.

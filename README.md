# S.-T. Yau College Student Mathematics Contest
## Past Exam Papers (2010--2025)

> A comprehensive collection of past exam papers spanning 6 mathematical disciplines across 16 years. Each subject includes official syllabi, problem statements, and solutions.

[![Total PDFs](https://img.shields.io/badge/Total%20PDFs-535-blue?style=flat-square)](#)
[![Markdown Transcripts](https://img.shields.io/badge/Transcripts-49-green?style=flat-square)](#)

---

## Quick Compile

```bash
cd latex-project && bash compile.sh
```

Output: `latex-project/main.pdf` (~460 pages). For single-pass compile:

```bash
cd latex-project && pdflatex -interaction=nonstopmode main.tex
```

---

## Subject Coverage

| Subject | PDFs | Years | Transcripts |
|:---|---:|:---:|:---:|
| Algebra & Number Theory | 48 | 2010-2025 | 0 |
| Geometry & Topology | 41 | 2010-2025 | 0 |
| Probability & Statistics | 59 | 2010-2025 | 17 |
| Applied & Computational Mathematics | 42 | 2010-2025 | 0 |
| Analysis & Differential Equations | 46 | 2010-2025 | 0 |
| Mathematical Physics | 8 | 2025-2025 | 0 |

---

## Repository Structure

```
yau-contest/
├── latex-project/          # LaTeX book
│   ├── main.tex           # Root document
│   ├── compile.sh         # Two-pass compile script
│   ├── content/           # Chapter files by subject + year
│   └── syllabi/           # Official syllabi (6 PDFs)
├── 2010--2025/           # Raw papers by year
└── [subject folders]/    # Raw papers by subject (Chinese)
```

---

## What's in the Book

The compiled PDF (`latex-project/main.pdf`) contains:

- **Introduction** -- Contest structure, recurring themes (verified from actual exam data)
- **Exam Preparation Guide** -- Topic-by-topic knowledge map for all 6 subjects
- **Problem Sets (2010--2025)** -- Full problem statements and solutions

### Subject Descriptions

| Track | Topics |
|:---|:---|
| Algebra & Number Theory | Group theory, Galois theory, representation theory, algebraic geometry, $p$-adic analysis |
| Analysis & Differential Equations | Complex analysis, measure theory, functional analysis, PDEs, Fourier analysis |
| Geometry & Topology | Algebraic topology, differential geometry, Riemannian geometry, Lie groups |
| Probability & Statistics | Stochastic processes, martingales, statistical estimation, random graphs |
| Applied & Computational Mathematics | Numerical analysis, finite difference/element methods, optimization, dynamical systems |
| Mathematical Physics (2022--) | Quantum mechanics, classical mechanics, electromagnetism, QFT, general relativity |

---

## File Naming

| Pattern | Description |
|:---|:---|
| `Year_Subject-individual.pdf` | Individual competition paper |
| `Year_Subject-team.pdf` | Team competition paper |
| `Year_Subject-soln.pdf` | Official solutions |

---

## Disclaimer

All materials are collected from public sources for educational and research purposes only.

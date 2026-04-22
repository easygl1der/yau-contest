#!/usr/bin/env python3
from pathlib import Path
import re

REPO = Path('/Volumes/SSK SSD/Projects/yau-contest')

# Total counts
total_pdfs = sum(1 for f in REPO.rglob('*.pdf') if 'latex-project' not in f.parts and '.git' not in f.parts)
total_mds = sum(1 for f in REPO.rglob('*.md') if 'latex-project' not in f.parts and '.git' not in f.parts and 'hybrid_ocr' not in f.parts)

subjects = [
    ('Algebra & Number Theory', '代数与数论'),
    ('Geometry & Topology', '几何与拓扑'),
    ('Probability & Statistics', '概率与统计'),
    ('Applied & Computational Mathematics', '应用与计算数学'),
    ('Analysis & Differential Equations', '分析与微分方程'),
    ('Mathematical Physics', '数学物理'),
]

patterns = {
    '代数与数论': re.compile(r'Algebra|NumberTheory', re.I),
    '几何与拓扑': re.compile(r'Geometry|Topology', re.I),
    '概率与统计': re.compile(r'Probability|Statistics', re.I),
    '应用与计算数学': re.compile(r'Applied|Computational', re.I),
    '分析与微分方程': re.compile(r'Analysis|differential', re.I),
    '数学物理': re.compile(r'MathematicalPhysics|^Physics(?!ics)', re.I),
}

year_dirs = [d for d in REPO.iterdir() if d.is_dir() and d.name.isdigit() and 2010 <= int(d.name) <= 2025]

rows = []
for en, cn in subjects:
    cn_dir = REPO / cn
    pdf_count = sum(1 for f in cn_dir.rglob('*.pdf')) if cn_dir.is_dir() else 0
    md_count = sum(1 for f in cn_dir.rglob('*.md') if 'hybrid_ocr' not in f.parts) if cn_dir.is_dir() else 0

    years = set()
    for y in year_dirs:
        for f in y.rglob('*.pdf'):
            if 'latex-project' not in f.parts and patterns[cn].search(f.name):
                years.add(int(y.name))
                break

    rng = f'{min(years)}-{max(years)}' if years else 'N/A'
    rows.append(f'| {en} | {pdf_count} | {rng} | {md_count} |')

table = '\n'.join(rows)

readme = f'''# S.-T. Yau College Student Mathematics Contest
## Past Exam Papers (2010--2025)

> A comprehensive collection of past exam papers spanning 6 mathematical disciplines across 16 years. Each subject includes official syllabi, problem statements, and solutions.

[![Total PDFs](https://img.shields.io/badge/Total%20PDFs-{total_pdfs}-blue?style=flat-square)](#)
[![Markdown Transcripts](https://img.shields.io/badge/Transcripts-{total_mds}-green?style=flat-square)](#)

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
{table}

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
'''

REPO.joinpath('README.md').write_text(readme)
print(f'README.md written: {total_pdfs} PDFs, {total_mds} transcripts')

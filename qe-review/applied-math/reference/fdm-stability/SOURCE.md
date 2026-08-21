# Provenance

Shelf created 2026-08-16 for QE CAM 2026 Spring Problems 4–5 (implicit advection stability; discrete maximum principle + backward Euler).

## What is here

This package is a **chapter map and reading contract**, not a pirate copy of SIAM/Wiley/Springer textbooks. The Qiuzhen syllabus already names the books. The exam notes in

`qe-review/applied-math/transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex`

are original teaching notes that cite those books at the knowledge points.

## Official syllabus books (PDE numerics)

| # | Book | Role for P4–P5 |
| ---: | --- | --- |
| 5 | B. Gustafsson, H.-O. Kreiss, J. Oliger, *Time Dependent Problems and Difference Methods*, Wiley, 1995/2013 | Canonical Fourier / von Neumann / GKS stability. |
| 8 | S. Brenner, R. Scott, *The Mathematical Theory of Finite Element Methods*, Springer, 2010 | Finite **elements**, not finite differences. Not the tool for 2026 P4–P5; keep for later FEM questions. |

## Standard companions (not on the printed syllabus, but they match the exam style)

| Book | Why |
| --- | --- |
| R. J. LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, SIAM, 2007 | Best first book for a weak FDM background: difference quotients, truncation error, ODE absolute stability (backward Euler), von Neumann, Lax equivalence. |
| J. C. Strikwerda, *Finite Difference Schemes and Partial Differential Equations*, SIAM, 2004 | Elliptic discrete maximum principle (Ch. 2) and hyperbolic Fourier analysis. Closest to 2024 Fall / 2026 Spring Problem 5. |

## Local PDF status (2026-08-16)

Searched this machine's `~/Projects` tree and the CAM QE archive. **No local PDF** of LeVeque, Strikwerda, Gustafsson–Kreiss–Oliger, or Brenner–Scott was found (unlike 清疏 / Hogg, which already live on the QE shelves).

If a licensed copy appears (Downloads, Mac Mini `aca-workflow/PDFs`, iCloud 数学), drop it here and slice **only** the chapters in [chapter-map.md](./chapter-map.md) with `pypdf`. Do not MinerU a 400-page SIAM book whole.

Suggested filenames if copying later:

```text
LeVeque-Finite-Difference-Methods-SIAM-2007.pdf
Strikwerda-Finite-Difference-Schemes-SIAM-2004.pdf
Gustafsson-Kreiss-Oliger-Time-Dependent-Problems.pdf
Brenner-Scott-Mathematical-Theory-of-FEM.pdf
```

## What was not copied

- Full copyrighted textbooks.
- Long verbatim extracts. Exam notes restate the definitions and work the Qiuzhen problems; they do not reproduce book chapters.

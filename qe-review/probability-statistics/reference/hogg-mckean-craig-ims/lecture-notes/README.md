# Lecture notes — 数理统计导论

aca-reader / aca-workflow notes generated from Hogg, McKean & Craig, *Introduction to Mathematical Statistics*, 8th ed. Source of this copy: Mac Mini `~/Projects/aca-workflow/notes/mathematical-statistics/`.

Compiled PDF: [mathematical-statistics-notes.pdf](./mathematical-statistics-notes.pdf)

Main file: [mathematical-statistics-notes.tex](./mathematical-statistics-notes.tex)

## Coverage

Chapters 0–9 of the lecture notes correspond to Hogg Ch. 1–9 (plus a Chinese introduction). Hogg Ch. 10 (nonparametric/robust) and Ch. 11 (Bayesian) were not rewritten here; use the [package map](../structure.md) and the MinerU files.

`chapters/chapter2_section2{2,3,4}_addition.tex` exist on disk but are **not** `\include`d by the main file.

## Compile

From this directory:

```bash
./compile.sh
```

This runs XeLaTeX three times with SyncTeX. The existing `compile.sh` does not run BibTeX; `references.bib` is small and already present.

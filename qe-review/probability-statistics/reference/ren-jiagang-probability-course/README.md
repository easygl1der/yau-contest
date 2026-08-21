# 任佳刚、刘继成《概率论教程》(2024)

[← Probability & Statistics references](../README.md) · [QE syllabus](../../syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md) · [Provenance](./SOURCE.md)

Qiuzhen undergraduate probability notes. Primary local copy of the course the user took; cite as `\citep{ren2024}` in the 2026-spring exam file.

## How to read for PDF calculations

| Topic | Notes locus | Local text |
| --- | --- | --- |
| CDF \(F\), and \(p=F'\) at continuity points | Def. 4.3.2, notes 1–4 | printed pp. 108–110 |
| Law of \(\phi(\xi)\): CDF method, monotone \(\phi\), piecewise | §4.7 | printed pp. 129–131 |
| Sums / convolution, Jacobian for maps \(\mathbb{R}^n\to\mathbb{R}^n\) | §4.8, Prop. 4.8.3, Thm. 4.8.2 | printed pp. 131–133 |
| Characteristic function, uniqueness | Ch. 8 | printed pp. 227–258 |
| Inversion: \(\int\|f\|<\infty\Rightarrow p(x)=\frac1{2\pi}\int e^{-itx}f(t)\,dt\); extra \(\|t\|^n\|f\|\) gives \(p^{(n)}\) | Thm. 8.4.4 | printed pp. 240–242 |
| Computing a law from the ch.f. (product formula, not inversion as a first move) | §9.1 | printed pp. 261–264 |

Derivatives of a characteristic function at \(0\) recover moments, not the density. The Fourier inversion in Thm. 8.4.4 is the actual ch.f.\(\leftrightarrow\)pdf link.

## Package layout

| Path | Role |
| --- | --- |
| [PDF](./source/probfinalforlecture.pdf) | Canonical 300-page notes |
| [pdftotext](./pdftotext/probfinalforlecture.txt) | Full native-TeX dump (prefer this for formulas) |
| [Merged MinerU](./mineru-md/probfinalforlecture.md) | Concatenated VLM markdown, image paths rewritten |
| [MinerU parts](./mineru-md/parts/) | Page-range extracts kept for traceability |

MinerU ranges, in source-page order: `1-50`, `51-95`, `96-135`, `136-190`, `191-226`, `227-271`, `272-300`. Native TeX PDF; `pdftotext` is the more reliable formula source. MinerU is the structured markdown copy.

No course PPT was found. `source/prob_work.pdf` is T.-Y. Li's QE exercise notes, not this course's solutions. `source/23级概率论期末真题.pdf` is 乐绎华's 2023 final, not this course.

---
title: "Hogg–McKean–Craig, Introduction to Mathematical Statistics (8th ed.)"
kind: "textbook-reference-map"
updated: 2026-08-15
---

# Hogg–McKean–Craig — Reference Package

[← Probability & Statistics references](../README.md) · [QE syllabus](../../syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md) · [Provenance](./SOURCE.md)

Canonical source: [Hogg, McKean, Craig, *Introduction to Mathematical Statistics*, 8th ed., Pearson 2019](./Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf) (762 pp.).

This package is the local QE copy of the Mac Mini `aca-workflow` statistics shelf: the PDF, a chapter-split MinerU transcript, the aca-reader lecture notes (Ch. 0–9), and the existing exam-prep checklist.

## How to read

1. Use this map to jump by QE topic or by textbook chapter.
2. Prefer the [lecture notes](./lecture-notes/mathematical-statistics-notes.pdf) when they exist (Ch. 1–9). They are already structured teaching notes, not OCR.
3. Use the [MinerU chapter files](./mineru-md/00-frontmatter.md) when you need the original wording, exercises, or a chapter the lecture notes do not cover (Ch. 10–11, appendices).
4. If a formula, table, or numbering disagrees, the PDF is authoritative.

## Package layout

| Path | Role |
| --- | --- |
| [PDF](./Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf) | Canonical 8th edition |
| [MinerU chapters](./mineru-md/00-frontmatter.md) | OCR transcript, split by chapter |
| [Lecture notes PDF](./lecture-notes/mathematical-statistics-notes.pdf) | aca-reader notes for Ch. 0–9 |
| [Lecture notes TeX](./lecture-notes/mathematical-statistics-notes.tex) | XeLaTeX source (`lecture-notes/compile.sh`) |
| [备考指南](./备考指南.md) | Personal exam checklist (Ch. 1–9) |
| [Unsplit OCR dump](./mineru-md/_full.md) | Full MinerU file, for search only |

## Textbook chapters

| Ch. | Title | MinerU | Lecture notes | 备考指南 |
| ---: | --- | --- | --- | --- |
| — | Front matter | [md](./mineru-md/00-frontmatter.md) | [引言](./lecture-notes/chapters/chapter0.tex) | — |
| 1 | Probability and Distributions | [md](./mineru-md/01-probability-and-distributions.md) | [tex](./lecture-notes/chapters/chapter1.tex) | [notes](./备考指南.md#第一章probability-and-distributions) |
| 2 | Multivariate Distributions | [md](./mineru-md/02-multivariate-distributions.md) | [tex](./lecture-notes/chapters/chapter2.tex) | [notes](./备考指南.md#第二章多元随机变量及其分布) |
| 3 | Some Special Distributions | [md](./mineru-md/03-some-special-distributions.md) | [tex](./lecture-notes/chapters/chapter3.tex) | [notes](./备考指南.md#第三章special-distributions) |
| 4 | Some Elementary Statistical Inferences | [md](./mineru-md/04-some-elementary-statistical-inferences.md) | [tex](./lecture-notes/chapters/chapter4.tex) | [notes](./备考指南.md#第四章some-elementary-statistical-inferences) |
| 5 | Consistency and Limiting Distributions | [md](./mineru-md/05-consistency-and-limiting-distributions.md) | [tex](./lecture-notes/chapters/chapter5.tex) | [notes](./备考指南.md#第五章asymptotic-theory) |
| 6 | Maximum Likelihood Methods | [md](./mineru-md/06-maximum-likelihood-methods.md) | [tex](./lecture-notes/chapters/chapter6.tex) | [notes](./备考指南.md#第六章maximum-likelihood-methods) |
| 7 | Sufficiency | [md](./mineru-md/07-sufficiency.md) | [tex](./lecture-notes/chapters/chapter7.tex) | [notes](./备考指南.md#第七章sufficiency-and-quality-of-estimators) |
| 8 | Optimal Tests of Hypotheses | [md](./mineru-md/08-optimal-tests-of-hypotheses.md) | [tex](./lecture-notes/chapters/chapter8.tex) | [notes](./备考指南.md#第八章optimal-statistical-tests) |
| 9 | Inferences About Normal Linear Models | [md](./mineru-md/09-inferences-about-normal-linear-models.md) | [tex](./lecture-notes/chapters/chapter9.tex) | [notes](./备考指南.md#第九章anova-and-regression) |
| 10 | Nonparametric and Robust Statistics | [md](./mineru-md/10-nonparametric-and-robust-statistics.md) | *not in lecture notes* | — |
| 11 | Bayesian Statistics | [md](./mineru-md/11-bayesian-statistics.md) | *not in lecture notes* | — |
| A | Mathematical Comments | [md](./mineru-md/a-mathematical-comments.md) | — | — |
| B | R Primer | [md](./mineru-md/b-r-primer.md) | — | — |
| C | Lists of Common Distributions | [md](./mineru-md/c-lists-of-common-distributions.md) | — | — |
| D | Tables of Distributions | [md](./mineru-md/d-tables-of-distributions.md) | — | — |
| E | References | [md](./mineru-md/e-references.md) | — | — |
| F | Answers to Selected Exercises | [md](./mineru-md/f-answers-to-selected-exercises.md) | — | — |
| — | Index | [md](./mineru-md/z-index.md) | — | — |

Lecture notes stop at Ch. 9. For QE Bayesian items, read Hogg Ch. 11 in the PDF or MinerU file; there is no aca-reader rewrite yet.

## Map onto the 2026-06 QE syllabus

Hogg is a mathematical-statistics text. It covers the **Statistics** half of the Qiuzhen syllabus densely, and only the elementary **Probability** half. Martingales, Markov chains, Poisson processes, Brownian motion, and random walks are not here — those stay with Durrett / Chung / Brzeźniak–Zastawniak.

### Probability (partial)

| Syllabus item | Hogg locus | Local reading |
| --- | --- | --- |
| Random variable, expectation, independence | 1.4–1.8, 2.4 | [Ch. 1](./mineru-md/01-probability-and-distributions.md), [Ch. 2](./mineru-md/02-multivariate-distributions.md) |
| Variance, covariance, correlation, moment | 1.9, 2.5, 2.8 | same |
| Various distribution functions | Ch. 3 | [Ch. 3](./mineru-md/03-some-special-distributions.md) |
| Multivariate distribution | Ch. 2, 3.5 | [Ch. 2](./mineru-md/02-multivariate-distributions.md), [3.5](./mineru-md/03-some-special-distributions.md) |
| Characteristic / generating functions | mgf in 1.9; not a ch.f. course | [1.9](./mineru-md/01-probability-and-distributions.md) |
| Modes of convergence | Ch. 5 | [Ch. 5](./mineru-md/05-consistency-and-limiting-distributions.md) |
| Bayes formula, conditional probability | 1.4, 2.3 | [Ch. 1](./mineru-md/01-probability-and-distributions.md), [Ch. 2](./mineru-md/02-multivariate-distributions.md) |
| Conditional expectation given a $\sigma$-algebra | elementary 2.3 only | use Durrett for the measure-theoretic version |
| LLN / CLT | 5.1–5.3 | [Ch. 5](./mineru-md/05-consistency-and-limiting-distributions.md) |

### Statistics (primary)

| Syllabus item | Hogg locus | Local reading |
| --- | --- | --- |
| Distribution theory (normal, $\chi^2$, $t$, $F$, gamma, beta; multinomial, Poisson, NB; exponential families; functions of r.v.) | Ch. 3, 7.5 | [Ch. 3](./mineru-md/03-some-special-distributions.md), [7.5](./mineru-md/07-sufficiency.md) |
| Random sample: order statistics, mean/variance/median/quantiles, delta method | 4.1–4.4, 5.2–5.3 | [Ch. 4](./mineru-md/04-some-elementary-statistical-inferences.md), [Ch. 5](./mineru-md/05-consistency-and-limiting-distributions.md) |
| Data reduction: sufficient / minimal sufficient / ancillary / complete; Basu | Ch. 7 | [Ch. 7](./mineru-md/07-sufficiency.md) · [lecture notes](./lecture-notes/chapters/chapter7.tex) |
| Estimation: MoM, MLE, evaluation, Fisher information, CI | Ch. 4, 6 | [Ch. 4](./mineru-md/04-some-elementary-statistical-inferences.md), [Ch. 6](./mineru-md/06-maximum-likelihood-methods.md) |
| Testing: type I/II, power, UMP, LRT, Neyman–Pearson, Karlin–Rubin, GLRT | Ch. 8, 6.3, 6.5 | [Ch. 8](./mineru-md/08-optimal-tests-of-hypotheses.md) · [lecture notes](./lecture-notes/chapters/chapter8.tex) |
| Bayesian: prior, posterior, conjugate, Bayes estimator | Ch. 11 | [Ch. 11](./mineru-md/11-bayesian-statistics.md) (no lecture notes) |
| Large-sample: consistency, asymptotic normality, $\chi^2$ LRT | Ch. 5, 6 | [Ch. 5](./mineru-md/05-consistency-and-limiting-distributions.md), [Ch. 6](./mineru-md/06-maximum-likelihood-methods.md) |
| Linear model theory (syllabus red item) | Ch. 9 (ANOVA / regression under normal errors) | [Ch. 9](./mineru-md/09-inferences-about-normal-linear-models.md) · [lecture notes](./lecture-notes/chapters/chapter9.tex). The official syllabus book is still 吴密霞、王松桂. |

## Personal exam checklist (from `aca-workflow`)

The [备考指南](./备考指南.md) marks Ch. 1 as trivial and then concentrates on:

- Ch. 2: joint distributions, transformation formula
- Ch. 3: Student's theorem
- Ch. 4: likelihood, MLE, CI, pooled variance, median, order statistics, hypothesis tests, chi-square tests
- Ch. 5: delta method, order statistics, convergence in probability / distribution
- Ch. 6: MLE invariance, efficiency, Cramér–Rao, LRT, Wald
- Ch. 7: sufficiency, MVUE, completeness, Rao–Blackwell, Lehmann–Scheffé, Basu
- Ch. 8: Neyman–Pearson, UMP, power, LRT
- Ch. 9: one-way / two-way ANOVA

It does not yet track Ch. 10–11. Bayesian is a QE syllabus item, so Ch. 11 should be added to that checklist when you next revise it.

## Status

- PDF, MinerU split, and lecture-note sources: copied 2026-08-15 from Mac Mini `aca-workflow`.
- Lecture notes: Ch. 0–9 present; Ch. 10–11 absent.
- MinerU is OCR. Do not treat it as a second authoritative edition.

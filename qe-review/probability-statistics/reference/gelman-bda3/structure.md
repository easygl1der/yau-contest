---
title: "Gelman et al., Bayesian Data Analysis (3rd ed.)"
kind: "textbook-reference-map"
updated: 2026-08-15
---

# Gelman–Carlin–Stern–Dunson–Vehtari–Rubin — Reference Package

[← Probability & Statistics references](../README.md) · [QE syllabus](../../syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md) · [Provenance](./SOURCE.md)

Canonical source: [Gelman et al., *Bayesian Data Analysis*, 3rd ed., CRC 2013](./Bayesian-Data-Analysis-3rd.pdf) (656 pp.).

This package is the local QE copy of the Mac Mini `aca-workflow` Bayesian shelf: the PDF, a chapter-split MinerU transcript, and the aca-reader lecture notes (Ch. 0–23).

BDA is an *applied* Bayesian book. For QE point-estimation under a named loss, and for frequentist properties of a Bayes rule (risk, minimax), read it together with Hogg Ch. 11 and Hogg's decision-theory remarks in Ch. 7. See [hogg-mckean-craig-ims](../hogg-mckean-craig-ims/structure.md).

## How to read

1. Use this map to jump by QE topic or by textbook chapter.
2. Prefer the [lecture notes](./lecture-notes/bayesian-analysis-notes.pdf) when you want structured teaching notes (not OCR).
3. Use the [MinerU chapter files](./mineru-md/00-frontmatter.md) for original wording, exercises, and figures.
4. If a formula, table, or numbering disagrees, the PDF is authoritative.

## Package layout

| Path | Role |
| --- | --- |
| [PDF](./Bayesian-Data-Analysis-3rd.pdf) | Canonical 3rd edition |
| [MinerU chapters](./mineru-md/00-frontmatter.md) | OCR transcript, split by chapter |
| [Lecture notes PDF](./lecture-notes/bayesian-analysis-notes.pdf) | aca-reader notes for Ch. 0–23 |
| [Lecture notes TeX](./lecture-notes/bayesian-analysis-notes.tex) | XeLaTeX source (`lecture-notes/compile.sh`) |
| [Unsplit OCR dump](./mineru-md/_full.md) | Full MinerU file, for search only |

## Textbook chapters

| Ch. | Title | MinerU | Lecture notes |
| ---: | --- | --- | --- |
| — | Front matter | [md](./mineru-md/00-frontmatter.md) | [引言](./lecture-notes/chapters/chapter0.tex) |
| 1 | Probability and inference | [md](./mineru-md/01-probability-and-inference.md) | [tex](./lecture-notes/chapters/chapter1.tex) |
| 2 | Single-parameter models | [md](./mineru-md/02-single-parameter-models.md) | [tex](./lecture-notes/chapters/chapter2.tex) |
| 3 | Multiparameter models | [md](./mineru-md/03-multiparameter-models.md) | [tex](./lecture-notes/chapters/chapter3.tex) |
| 4 | Asymptotics and non-Bayesian connections | [md](./mineru-md/04-asymptotics-and-nonbayesian.md) | [tex](./lecture-notes/chapters/chapter4.tex) |
| 5 | Hierarchical models | [md](./mineru-md/05-hierarchical-models.md) | [tex](./lecture-notes/chapters/chapter5.tex) |
| 6 | Model checking | [md](./mineru-md/06-model-checking.md) | [tex](./lecture-notes/chapters/chapter6.tex) |
| 7 | Evaluating, comparing, and expanding models | [md](./mineru-md/07-evaluating-comparing-expanding.md) | [tex](./lecture-notes/chapters/chapter7.tex) |
| 8 | Modeling accounting for data collection | [md](./mineru-md/08-modeling-data-collection.md) | [tex](./lecture-notes/chapters/chapter8.tex) |
| 9 | Decision analysis | [md](./mineru-md/09-decision-analysis.md) | [tex](./lecture-notes/chapters/chapter9.tex) |
| 10 | Introduction to Bayesian computation | [md](./mineru-md/10-introduction-to-bayesian-computation.md) | [tex](./lecture-notes/chapters/chapter10.tex) |
| 11 | Basics of Markov chain simulation | [md](./mineru-md/11-basics-of-markov-chain-simulation.md) | [tex](./lecture-notes/chapters/chapter11.tex) |
| 12 | Computationally efficient MCMC | [md](./mineru-md/12-efficient-markov-chain-simulation.md) | [tex](./lecture-notes/chapters/chapter12.tex) |
| 13 | Modal and distributional approximations | [md](./mineru-md/13-modal-and-distributional-approximations.md) | [tex](./lecture-notes/chapters/chapter13.tex) |
| 14 | Introduction to regression models | [md](./mineru-md/14-introduction-to-regression-models.md) | [tex](./lecture-notes/chapters/chapter14.tex) |
| 15 | Hierarchical linear models | [md](./mineru-md/15-hierarchical-linear-models.md) | [tex](./lecture-notes/chapters/chapter15.tex) |
| 16 | Generalized linear models | [md](./mineru-md/16-generalized-linear-models.md) | [tex](./lecture-notes/chapters/chapter16.tex) |
| 17 | Models for robust inference | [md](./mineru-md/17-models-for-robust-inference.md) | [tex](./lecture-notes/chapters/chapter17.tex) |
| 18 | Models for missing data | [md](./mineru-md/18-models-for-missing-data.md) | [tex](./lecture-notes/chapters/chapter18.tex) |
| 19 | Parametric nonlinear models | [md](./mineru-md/19-parametric-nonlinear-models.md) | [tex](./lecture-notes/chapters/chapter19.tex) |
| 20 | Basis function models | [md](./mineru-md/20-basis-function-models.md) | [tex](./lecture-notes/chapters/chapter20.tex) |
| 21 | Gaussian process models | [md](./mineru-md/21-gaussian-process-models.md) | [tex](./lecture-notes/chapters/chapter21.tex) |
| 22 | Finite mixture models | [md](./mineru-md/22-finite-mixture-models.md) | [tex](./lecture-notes/chapters/chapter22.tex) |
| 23 | Dirichlet process models | [md](./mineru-md/23-dirichlet-process-models.md) | [tex](./lecture-notes/chapters/chapter23.tex) |
| A | Standard probability distributions | [md](./mineru-md/a-standard-probability-distributions.md) | — |
| B | Outline of proofs from Chapter 4 | [md](./mineru-md/b-outline-of-proofs.md) | — |
| C | Computation in R and Stan | [md](./mineru-md/c-computation-in-r-and-stan.md) | — |
| — | References | [md](./mineru-md/z-references.md) | — |

## Map onto the 2026-06 QE syllabus

Syllabus item: **Bayesian Statistics: prior, posterior, conjugate priors, Bayesian estimator.**

| QE need | BDA locus | Local reading | Also |
| --- | --- | --- | --- |
| Bayes theorem, prior / posterior, posterior odds | 1.3 | [Ch. 1](./mineru-md/01-probability-and-inference.md), [notes](./lecture-notes/chapters/chapter1.tex) | Hogg 11.1.1, (11.1.5) |
| Conjugate single-parameter models | Ch. 2 | [Ch. 2](./mineru-md/02-single-parameter-models.md) | Hogg 11.1 Examples 11.1.1–11.1.2 |
| Normal mean (known variance) | 2.5 | [2.5](./mineru-md/02-single-parameter-models.md) | Hogg Exercise 11.1.3 |
| Point estimator under a loss | 9.1 (utility); applied examples 9.2–9.4 | [Ch. 9](./mineru-md/09-decision-analysis.md), [notes](./lecture-notes/chapters/chapter9.tex) | Hogg 11.1.2: \(L_2\) → posterior mean, \(L_1\) → posterior median |
| Frequentist risk / minimax of a Bayes rule | *not a BDA topic* | — | Hogg Ch. 7 (risk, minimax principle); constant-risk Bayes ⇒ minimax |

BDA Chapter 9 is expected-utility decision analysis. It does **not** develop the frequentist minimax lemma used in 2026 Spring Problem 9(b). For that problem, (a) is Hogg 11.1.2 + BDA 1.3; (b) is the constant-risk Bayes argument.

Hogg Chapter 11 opens with a two-point prior on a Poisson mean, which is the closest textbook cousin of Problem 9's two-point prior on a normal mean.

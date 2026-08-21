# Yau final-prep notes

[← Probability & Statistics references](../README.md) · [QE syllabus](../../syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md) · [Provenance](./SOURCE.md)

Personal 2025 Yau-final / Hogg-final review notes. For QE Bayesian items, start with `yau-stat.pdf` Chapter 5, then fill gaps from [Hogg Ch. 11](../hogg-mckean-craig-ims/mineru-md/11-bayesian-statistics.md).

## Package layout

| Path | Role |
| --- | --- |
| [yau-stat.pdf](./yau-stat.pdf) | Statistics-track theory review (55 pp.) |
| [yau-final.pdf](./yau-final.pdf) | Worked Yau finals 2012–2024 (44 pp.) |
| [stat-final.pdf](./stat-final.pdf) | Hogg Ch. 1–9 comprehensive guide (20 pp.) |
| [pdftotext](./pdftotext/) | Native-TeX dumps |
| [Ch. 5 extract](./pdftotext/yau-stat-ch5-bayesian.txt) | Bayesian pages only |

## What is where, for 2026 Spring Problem 9

| Need | In these notes? | Locus |
| --- | --- | --- |
| Bayes theorem, prior / posterior | yes | `yau-stat` Def. 5.1 |
| Conjugate table (Beta-Binomial, Gamma-Poisson, Normal-Normal) | yes | `yau-stat` Thm. 5.1–5.4 |
| Point estimators: mean / median / MAP | yes | `yau-stat` Def. 5.4 |
| \(L_2\to\) mean, \(L_1\to\) median, \(0\)–\(1\to\) mode | yes | `yau-stat` Thm. 5.5 |
| Two-point (non-conjugate) posterior | no worked example | Hogg Ch. 11 opening (Poisson \(\theta\in\{2,3\}\)) |
| Frequentist risk / minimax of a Bayes rule | **no** | Hogg §7.1; constant-risk Bayes lemma |

`stat-final.pdf` is the Hogg 1–9 cram sheet used for the course final. It has Bayes' theorem only as a probability identity (Thm. 1.2). It does not replace Hogg Chapter 11.

`yau-final.pdf` has one Bayesian-formula probability item (2012 oral, false-friend / base-rate). It does not have an \(L_1\) Bayes / minimax estimation problem of the QE type.

## Exam recipe (from `yau-stat` §8.1 item 5, expanded)

1. Write \(\pi(\theta\mid x)\propto f(x\mid\theta)\pi(\theta)\) (Def. 5.1). Discrete prior: posterior odds \(=\) prior odds \(\times\) likelihood ratio.
2. Identify the loss, then the estimator (Thm. 5.5). Do not default to the posterior mean.
3. If the prior is two-point, skip the conjugate table. Compute the posterior median directly.
4. Frequentist question (minimax, risk): leave Chapter 5. Compute \(R(\theta,\delta)\). A Bayes rule with constant risk is minimax.

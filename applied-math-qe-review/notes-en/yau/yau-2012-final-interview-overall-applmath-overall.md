# 2012 Yau Mathematical Contest Final Interview overall

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2012-final-interview-overall-applmath-overall.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2012-final-interview-overall-applmath-overall/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2012-final-interview-overall-applmath-overall-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## Applied and Computational Mathematics

## 1. Let

$$
V_{h} = \{v: v |_{I_{j}} \in P^{k}(I_{j}) \quad 1 \leq j \leq N\}
$$

where

$$
I_{j} =(x_{j - 1}, x_{j}), \quad 1 \leq j \leq N
$$

with

$$
x_{j} = jh, \qquad h = \frac{1}{N}.
$$

Here $P^{k}(I_{j})$ denotes the set of polynomials of degree at most k in the interval $I_{j}$ .

Recall the $L^{2}$ projection of a function $u(x)$ into the space $V_{h}$ is defined by the unique function $u_{h} \in V_{h}$ which satisfies

$$
\left| \left| u - u_{h} \right| \right| \leq \left| \left| u - v \right| \right| \quad \forall v \in V_{h}
$$

where the norm is the usual $L^{2}$ norm. We assume $u(x)$ has at least $k + 2$ continuous derivatives.

(1) Prove the error estimate

$$
| | u - u_{h} | | \leq Ch^{k + 1}
$$

Explain how the constant C depends on the derivatives of $u(x)$

(2) If another function $\varphi(x)$ also has at least $k{+ 2}$ continuous derivatives, prove

$$
\left| \int_{0}^{1}(u(x) - u_{h}(x)) \varphi(x) dx \right| \leq Ch^{2k + 2}
$$

Explain how the constant C depends on the derivatives of $u(x)$ and $\varphi(x)$

# 2023 Yau Mathematical Contest Final Interview overall

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2023-final-interview-overall-acm-overall.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2023-final-interview-overall-acm-overall/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

Consider the nonlinear Klein-Gordon equation

$$
\begin{array}{l} \varepsilon^{2} \partial_{tt} u(x, t) - \partial_{xx} u(x, t) + \frac{1}{\varepsilon^{2}} u(x, t) + f(u(x, t)) = 0, \quad 0 < x < 1, 0 < t < T, \\ u(x, 0) = g_{0}(x), \qquad \partial_{t} u(x, 0) = \frac{1}{\varepsilon^{2}} g_{1}(x), \qquad 0 \leq x \leq 1, \\ u(0, t) = u(1, t) = 0, \qquad 0 \leq t \leq T, \end{array}
$$

where $0 < \varepsilon \le 1$ is a given dimensionless constant, $f(u)$ is a function of u and $g_{0}(x)$ and $g_{1}(x)$ are given functions, which are all independent of ε.

## Problem 1

^yau-2023-final-interview-overall-acm-overall-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s1).

Define the Hamiltonian (or energy) as

$$
E(t) := \int_{0}^{1} \left[\varepsilon^{2} | \partial_{t} u |^{2} + | \partial_{x} u |^{2} + \frac{1}{\varepsilon^{2}} u^{2} + F(u) \right] dx, \qquad t \geq 0,
$$

where

$$
F(u) = 2 \int_{0}^{u} f(s) ds.
$$

Show that the Hamiltonian is conserved, i.e.

$$
E(t) \equiv E(0), \qquad t \geq 0.
$$

## Problem 2

^yau-2023-final-interview-overall-acm-overall-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s2).

Construct an explicit second-order (in space and time) finite diference (EXFD) method for the problem and find its linear stability.

## Problem 3

^yau-2023-final-interview-overall-acm-overall-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s3).

Construct a second-order (in space and time) finite diference method for the problem such that the the Hamiltonian (or energy) is conserved in the discretized level and prove it.

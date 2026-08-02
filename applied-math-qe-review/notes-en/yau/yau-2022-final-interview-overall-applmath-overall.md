# 2022 Yau Mathematical Contest Final Interview overall

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2022-final-interview-overall-applmath-overall.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2022-final-interview-overall-applmath-overall/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## Question I

Consider the ordinary diferential equation (ODE) for $y(t) \in \mathbb{R}$ as

$$
\varepsilon^{2} y^{\prime \prime}(t) + \left(\mu^{2} + \frac{1}{\varepsilon^{2}}\right) y(t) = f(t), \quad t > 0, y(0) = y_{0},
$$

where $\mu > 0$ is a constant, $f(t)$ is a given function, and $0 < \varepsilon \ll 1$ is a small parameter.

## Problem 1

^yau-2022-final-interview-overall-applmath-overall-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s1).

Use variation-of-constant formula to reformulate the ODE into an equivalent integral form.

## Problem 2

^yau-2022-final-interview-overall-applmath-overall-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s2).

Construct a second order numerical scheme for solving the ODE, whose accuracy is independent of ε.

## Problem 3

^yau-2022-final-interview-overall-applmath-overall-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s3).

Prove the convergence rates of the constructed numerical scheme above.

## Question II

Show that the finite diference method

$$
\frac{u_{j}^{n + 1} - u_{j}^{n}}{\Delta t} = \frac{u_{j - 1}^{n} - 2u_{j}^{n} + u_{j + 1}^{n}}{\Delta x^{2}} + u_{j}^{n}
$$

for the equation $\begin{array}{r}{\frac{\partial u}{\partial t} = \frac{\partial^{2} u}{\partial x^{2}} + u(- \infty < x < + \infty, t > 0)} \end{array}$ is stable if $\begin{array}{r}{\frac{\Delta t}{\Delta x^{2}} \leq \frac{1}{2}} \end{array}$

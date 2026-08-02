# 2015 Yau Mathematical Contest Final Interview individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2015-final-interview-individual-applmath-individual.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2015-final-interview-individual-applmath-individual/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2015-final-interview-individual-applmath-individual-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

Applied and Computational Mathematics 2015 ( Individual )

## Problem 1

^yau-2015-final-interview-individual-applmath-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2015-final-interview-individual-applmath-individual-solutions.md#^yau-2015-final-interview-individual-applmath-individual-s1).

Suppose an n by n matrix A is given by

$$
A = \left(\begin{array}{ccccccc} 1 & r & & & & \\ & 1 & r & & & \\ & & 1 & r & & \\ & & \ddots & \ddots & \ddots & \\ & & & & 1 & r \\ r & & & & & 1 \end{array} \right)_{n \times n}
$$

$A \mathbf{x} = \mathbf{b}$ , prove that

$$
\| \mathbf{x} \| \leq C \| \mathbf{b} \|,
$$

where the constant C is independent of the dimension $n.$

## Problem 2

^yau-2015-final-interview-individual-applmath-individual-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2015-final-interview-individual-applmath-individual-solutions.md#^yau-2015-final-interview-individual-applmath-individual-s2).

For an interval $[a, b]$ , we divide it into $N + 1$ equally spaced subintervals by using the nodal points:

$$
a = x_{0} < x_{1} < \dots < x_{N + 1} = b,
$$

with

$$
x_{i} = a + ih, \quad h =(b - a) /(N + 1).
$$

For any continuous function w on $[0, \pi]$ , we define $\Pi_{h} w$ to be the piecewise linear interpolation of $w,$ namely $\Pi_{h} w$ is linear on each subinterval $(x_{i}, x_{i + 1})$ for $i = 0, 1, \cdots, N$ , and it takes the same values as $w$ at all nodal points $x_{i},$ $i = 0, 1, \cdots, N + 1$ . For any function $w.$ , we define

$$
\| w \| = \left(\int_{0}^{\pi} w^{2}(x) dx\right)^{1 / 2}.
$$

Prove the following estimates for any function $u \in C^{2}[0, \pi]$

$$
\| u - \Pi_{h} u \| \leq \frac{1}{\pi^{2}} h^{2} \| u^{\prime \prime} \|, \quad \| u^{\prime} -(\Pi_{h} u)^{\prime} \| \leq \frac{1}{\pi} h \| u^{\prime \prime} \|.
$$

## Problem 3

^yau-2015-final-interview-individual-applmath-individual-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2015-final-interview-individual-applmath-individual-solutions.md#^yau-2015-final-interview-individual-applmath-individual-s3).

Newton iteration for computing the kth root $\left(k \geq 2 \right)$ of $C > 0$ is

$$
x_{n + 1} = x_{n} - \frac{x_{n}^{k} - C}{kx_{n}^{k - 1}}.
$$

Show that the iteration converges for any initial value $x_{0} > 0$

# 2020 Yau Mathematical Contest Semifinal Written Examination written

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2020-semifinal-written-written.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2020-semifinal-written-written/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

# Computational and Applied Mathematics

Solve every problem.

## Problem 1

^yau-2020-semifinal-written-written-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s1).

Let $f \in C^{k + 1}[- 1, 1]$ and $[- 1, 1]$ be partitioned into subintervals $I_{j} =[(j - 1) h, jh]$ of width $h.$ Assume $p$ is a polynomial of degree $k$ which approximates $f$ in $I_{j}$ with

$$
\max_{x \in I_{j}} \left| p_{j}(x) - f(x) \right| \leq C_{0} h^{k + 1},
$$

where $C_{0}$ is a constant independent of $j.$ Show that there exists an another constant $C,$ independent of ${\dot{J}},$ such that

$$
\max_{x \in I_{j \pm 1}} \left| p_{j}(x) - f(x) \right| \leq Ch^{k + 1}.
$$

(as long as $I_{j \pm 1} \subset[- 1, 1]$ , of course).

## Problem 2

^yau-2020-semifinal-written-written-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s2).

Consider the iteration

$$
x_{n + 1} = x_{n} - \left(\frac{x_{n} - x_{0}}{f(x_{n}) - f(x_{0})}\right) f(x_{n})
$$

for finding the roots of a two times continuous diferentiable function $f(x)$ . Assuming the method converges to a simple root $x^{*}$ , what is the rate of convergence? Justify your answer.

## Problem 3

^yau-2020-semifinal-written-written-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s3).

Suppose A is an $m \times m$ matrix with a complete set of orthonormal eigenvectors $\mathbf{q_{1},..., q_{m}}$ and corresponding eigenvalues $\lambda_{1}, \ldots, \lambda_{m}.$ . Assume that $\left| \lambda_{1} \right| > \left| \lambda_{2} \right| > \left| \lambda_{3} \right|$ and $\lambda_{j} \geq \lambda_{j + 1}$ <sup>,</sup>for $j = 3, \ldots, m$ Consider the power method $\mathbf{v}^{(k)} = \mathbf{A} \mathbf{v}^{(k - 1)} / \lambda_{1}$ <sup>λ</sup>, with $\mathbf{v}^{(0)} = \alpha_{1} \mathbf{q}_{1} + \cdot \cdot \cdot + \alpha_{m} \mathbf{q}_{m}$ where $\alpha_{1}$ , . . .<sub>and</sub> $\alpha_{2}$ are both nonzero. Show that the sequence $\{\mathbf{v}^{(k)}\}_{k = 0}^{\infty}$ converges linearly to $\alpha_{1} \mathbf{q}_{1}$ with asymptotic constant $C = | \lambda_{2} / \lambda_{1} |$

## Problem 4

^yau-2020-semifinal-written-written-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s4).

For the initial value problem $y^{\prime} = f(t, y), y(0) = y_{0}$ on the interval $[0, T],$ , consider the implicit two-step method

$$
y_{n + 1} = \frac{4}{3} y_{n} - \frac{1}{3} y_{n - 1} + \frac{2h}{3} f(t_{n + 1}, y_{n + 1}),
$$

$$
y_{1} = y_{0} + hf(t_{1}, y_{0}),
$$

where h is the step size and $t_{n} = nh$

(a) What is the order of the accuracy of the scheme?

(b) Check the stability of the scheme by analyzing the stability polynomial?

(c) Find the stability region of the scheme.

## Problem 5

^yau-2020-semifinal-written-written-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s5).

Suppose the diference scheme $u^{n + 1} = Bu^{n}$ is stable, and $C(\Delta t)$ is a bounded family of

operators. Show that the scheme

$$
u^{n + 1} =(B + \Delta tC(\Delta t)) u^{n}
$$

is stable.

## Problem 6

^yau-2020-semifinal-written-written-q6

> Corresponding solutions: [Problem 6 Reference Solution](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s6).

Let A be an $m \times m$ nonsingular matrix. Suppose $\begin{array}{r}{\operatorname{inf}_{p_{n} \in P^{n}} \left| | p_{n}(A) | \right| = | | p^{*}(A) | | > 0} \end{array}$ where $P^{n}$ denotes the set of all degree-n monic polynomials:

$$
P^{n} = \left\{p: p \text{is a polynomial of degree} n, p(z) = z^{n} + \dots \right\}.
$$

Prove that $p^{*}$ is unique.

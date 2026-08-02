# 2024 Yau Mathematical Contest Final Interview individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2024-final-interview-individual-acm-individual.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2024-final-interview-individual-acm-individual/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2024-final-interview-individual-acm-individual-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

June 8, 2024

## Problem 1

^yau-2024-final-interview-individual-acm-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2024-final-interview-individual-acm-individual-solutions.md#^yau-2024-final-interview-individual-acm-individual-s1).

Find an algorithm of $O(n^{2})$ operations for solving the following linear system

$$
(\boldsymbol{ST} - \lambda \boldsymbol{I}) \boldsymbol{x} = \boldsymbol{b},
$$

where S, $\pmb{T} \in \mathbb{R}^{n \times n}$ are given upper triangular matrices, $\lambda \in \mathbb{R}$ is given such that $ST - \lambda I$ is nonsingular, $\b{b} \in \mathbb{R}^{n}$ is given, and $\pmb{x} \in \mathbb{R}^{n}$ is the unknown vector.

## Problem 2

^yau-2024-final-interview-individual-acm-individual-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2024-final-interview-individual-acm-individual-solutions.md#^yau-2024-final-interview-individual-acm-individual-s2).

Let $d^{n}, g^{n}$ and $h^{n}$ be three non-negative series satisfying

$$
\frac{d^{n + 1} - d^{n}}{k} \leq g^{n} d^{n} + h^{n}, \forall n \geq n_{0},
$$

and

$$
\left\{\begin{array}{l} k \sum_{n = k_{0}}^{N + k_{0}} g^{n} \leq a_{1} \\ k \sum_{n = k_{0}}^{N + k_{0}} h^{n} \leq a_{2} \quad, \forall k_{0} \geq n_{0} \\ k \sum_{n = k_{0}}^{N + k_{0}} d^{n} \leq a_{3} \end{array} \right.
$$

with $kN = r$ . Show that

$$
d^{n} \leq(a_{2} + \frac{a_{3}}{r}) \exp(a_{1}), \forall n \geq n_{0} + N.
$$

## Problem 3

^yau-2024-final-interview-individual-acm-individual-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2024-final-interview-individual-acm-individual-solutions.md#^yau-2024-final-interview-individual-acm-individual-s3).

Consider the heat distribution in a rod of length $L > 0$ made of two materials with diferent heat conductivities, denoted as $a \in \mathbb{R}_{+}$ and $b \in$ $\mathbb{R}_{+},$ and distributed alternatively along the rod with a periodicity of $\varepsilon : =$ $L / N, N \in \mathbb{N}$ . The problem can be modelled by the following system

$$
\left\{\begin{array}{l} - \frac{d}{dx} \left(A_{\varepsilon}(x) \frac{d}{dx} u_{\varepsilon}(x)\right) = f(x), \quad x \in(0, L) \\ u_{\varepsilon}(0) = u_{\varepsilon}(L) = 0, \end{array} \right.\tag{1}
$$

where

$$
A_{\varepsilon}(x) = \left\{\begin{array}{ll} a & \text{if} x \in \left(0, \frac{\varepsilon}{2}\right) \cup \left(\varepsilon, \frac{3}{2} \varepsilon\right) \cup \ldots..\cup \left((N - 1) \varepsilon, \frac{2N - 1}{2} \varepsilon\right), \\ b & \text{otherwise}, \end{array} \right.
$$

and $f(x) \in L^{2}((0, L))$ signifies a source.

(1) Show that equation (1) has a unique weak solution in $H_{0}^{1}((0, L))$

(2) Show that there is a constant A such that $u_{\varepsilon} \to u$ weakly in $H_{0}^{1}((0, L))$ ), and u is the solution of the following system:

$$
\left\{\begin{array}{l} - \frac{d}{dx} \left(A \frac{d}{dx} u(x)\right) = f(x), \quad x \in(0, L), \\ u(0) = u(L) = 0.\end{array} \right.\tag{2}
$$

Find the value of A.

## Problem 4

^yau-2024-final-interview-individual-acm-individual-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2024-final-interview-individual-acm-individual-solutions.md#^yau-2024-final-interview-individual-acm-individual-s4).

Let u be the solution to the reaction-difusion equation

$$
u_{t} = \beta u_{xx} + f(u), \quad \mathrm{in}[0, L] \times(0, T]
$$

with the homogeneous Neumann boundary condition. We assume that

A1. The reaction function f satisfies that $f \in C^{2}(\mathbb{R})$ and $f(0) = 0$

A2. $\exists K > 0$ such that $| f^{\prime}(u) | \leq K_{\mathrm{\Lambda}}$ $\forall u \in \mathbb{R}$

We assume further that the problem is well-posed for a given initial condition $u(x, 0)$ .

(a) Consider the following standard forward-in-time and central-in-space discretization

$$
v_{j}^{n + 1} = v_{j}^{n} + \beta \frac{\Delta t}{(\Delta x)^{2}}(v_{j - 1}^{n} - 2v_{j}^{n} + v_{j + 1}^{n}) + \Delta tf(v_{j}^{n})
$$

on a uniform space-time mesh $t_{n} = n \Delta t$ and $x_{j} = j \Delta x$ . Assume that $K$ is small enough. Derive a suficient condition on $\Delta t,$ , assuming everything else is fixed, for the numerical stability, in an appropriate sense, of the scheme.

(b) Let $e_{j}^{n} : = u_{j}^{n} - v_{j}^{n}$ be the numerical error (where $u_{i}^{n} = u(x_{j}, t_{n}))$ Show that the scheme is convergent by showing that $\| e^{n} \| \to 0$ , in appropriate norm, as $\Delta t, \Delta x0$

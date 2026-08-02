# 2014 Yau Mathematical Contest Semifinal Written Examination team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2014-semifinal-written-team.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2014-semifinal-written-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2014-semifinal-written-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

Please solve as many problems as you can!

## 1. (15 pts)

Given a finite positive (Borel) measure $d \mu$ on [0, 1], define its sequence of moments as follows

$$
c_{j} = \int_{0}^{1} x^{j} d \mu(x), \quad j = 0, 1, \dots.
$$

Show that the sequence is completely monotone in the sense that that

$$
(I - S)^{k} c_{j} \geq 0 \quad \text{for all} j, k \geq 0,
$$

where S denotes the backshift operator given by $Sc_{j} = c_{j + 1}$ for $j \geq 0$

## 2. (20 pts)

We recall that a polynomial

$$
f(X) = a_{d} X^{d} + a_{d - 1} X^{d - 1} + \dots + a_{1} X + a_{0} \in \mathbb{Z}[X]
$$

is called an Eisenstein polynomial if for some prime p we have

(i) $p \mid a _ { i } f o r i = 0 , \ldots , d - 1 $

(ii) $p^{2} \nmid a_{0}$

(iii) $p \nmid a_{d}$

Eisenstein polynomials are well-know to be irreducible over $\mathbb{Z},$ so they can be used to construct explicit examples of irreducible polynomials.

Questions:

(i) Prove that a composition $f(g(X))$ of two Eisenstein polynomials $f$ and $g$ is an Eisenstein polynomial again.

(ii) Suggest a multivariate generalisation of the Eisenstein polynomials. That is, describe a class polynomials $F(X_{1}, \ldots, X_{m})$ in terms of the divisibility properties of their coeficients that are guaranteed to be irreducible.

3. (20 pts) For solving the following partial diferential equation

$$
u_{t} + f(u)_{x} = 0, \quad 0 \leq x \leq 1\tag{1}
$$

where $f^{\prime}(u) \geq 0$ , with periodic boundary condition, we can use the following semi-discrete discontinuous Galerkin method: Find $u_{h}(\cdot, t) \in$ $V_{h}$ such that, for all $v \in V_{h}$ and $j = 1, 2, \cdots, N$ ,

$$
\int_{I_{j}}(u_{h})_{t} vdx - \int_{I_{j}} f(u_{h}) v_{x} dx + f((u_{h})_{j + 1 / 2}^{-}) v_{j + 1 / 2}^{-} - f((u_{h})_{j - 1 / 2}^{-}) v_{j - 1 / 2}^{+} = 0,\tag{2}
$$

with periodic boundary condition

$$
(u_{h})_{1 / 2}^{-} =(u_{h})_{N + 1 / 2}^{-}; \quad(u_{h})_{N + 1 / 2}^{+} =(u_{h})_{1 / 2}^{+},\tag{3}
$$

where $I_{j} =(x_{j - 1 / 2}, x_{j + 1 / 2}), 0 = x_{1 / 2} < x_{3 / 2} < \cdots < x_{N + 1 / 2} = 1$ 2 $h = \mathrm{max}_{j}(x_{j + 1 / 2} - x_{j - 1 / 2}), v_{j + 1 / 2}^{\pm} = v(x_{j + 1 / 2}^{\pm}, t)$ , and

$V_{h} = \{v : v |_{I_{j}}$ is a polynomial of degree at most k for $1 \leq j \leq N\}$

Prove the following $L^{2}$ stability of the scheme

$$
\frac{d}{dt} E(t) \leq 0\tag{4}
$$

where $\begin{array}{r}{E(t) = \int_{0}^{1}(u_{h}(x, t))^{2} dx} \end{array}$

## Problem 4

^yau-2014-semifinal-written-team-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2014-semifinal-written-team-solutions.md#^yau-2014-semifinal-written-team-s4).

Consider the linear system $Ax = b$ . The GMRES method is a projection method which obtains a solution in the m-th Krylov subspace $K_{m}$ so that the residual is orthogonal to $AK_{m}$ . Let $r_{0}$ be the initial residual and let $v_{0} = r_{0}$ . The Arnoldi process is applied to build an orthonormal system $v_{1}, v_{2}, \cdots, v_{m -}$ with $v_{1} = Av_{0} / \| Av_{0} \|$ The approximate solution is obtained from the following space

$$
K_{m} = \operatorname{span} \left\{v_{0}, v_{1}, \dots, v_{m - 1} \right\}.
$$

(i) (5 points) Show that the approximate solution is obtained as the solution of a least-square problem, and that this problem is triangular.

(ii) (5 points) Prove that the residual $r_{k}$ is orthogonal to $\{v_{1}, v_{2}, \cdots, v_{k - 1}\}$

(iii) (5 points) Find a formula for the residual norm.

(iv) (5 points) Derive the complete algorithm.

5. (10 pts)

(i) Set $x_{0} = 0$ . Write the recurrence

$$
x_{k} = 2x_{k - 1} + b_{k}, \quad k = 1, 2, \dots, n,
$$

in a matrix form $A{\overrightarrow{x}} ={\overrightarrow{b}}.$ For $b_{1} = - 1 / 3, b_{k} =(- 1)^{k}, k =$ $2, 3, \cdots, n$ , verify that $x_{k} \ = \(- 1)^{k} / 3, k \ = \1, 2, \cdot \cdot \cdot, n$ is the exact solution.

(ii) Find $A^{- 1}$ and compute condition number of A in $L^{1}$ norm.

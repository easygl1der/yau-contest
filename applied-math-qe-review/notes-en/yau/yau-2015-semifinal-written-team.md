# 2015 Yau Mathematical Contest Semifinal Written Examination team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2015-semifinal-written-team.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2015-semifinal-written-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.


## Problem 1

^yau-2015-semifinal-written-team-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s1).

Consider the elliptic interface problem

$$
(a(x) u_{x})_{x} = f, x \in(0, 1)
$$

with the Dirichlet boundary condition

$$
u(0) = u(1) = 0.
$$

Here, f is a smooth function, the elliptic coeficient $a(x)$ is discontinuous across an interface point ξ, that is,

$$
a(x) = \left\{\begin{array}{ll} a_{0} & \text{for} 0 < x < \xi \\ a_{1} & \text{for} \xi < x < 1, \end{array} \right.
$$

$a_{0}, a_{1} \ > \0$ are positive constants, and $0 < \xi < 1$ is an interface point. Across the interface, we need to impose two jump conditions

$$
u(\xi -) = u(\xi +), a(\xi -) u_{x}(\xi -) = a(\xi +) u_{x}(\xi +).
$$

Question:

1. (25%) Design a numerical method to solve this problem. The method should be at least first order. It is better to be high order (if your method is first order, you get 20% points).

2. (75%) Prove your accuracy and convergence arguments (if your method is first order, you get 60% points).

## Problem 2

^yau-2015-semifinal-written-team-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s2).

Let G be graph of a social network, where for each pair of members there is either no connection, or a positive or a negative one.

An unbalanced cycle in G is a a cycle which have odd number of negative edges. Traversing along such a cycle with social rules such as friend of enemy are enemy would result in having a negative relation of one with himself!

A resigning in G at a vertex v of G is to switch the type (positive or negative) of all edges incident to v.

Question: Show that one can switch all edge of G into positive edges using a sequence resigning if and only if there is no unbalanced cycle in $G.$

## Problem 3

^yau-2015-semifinal-written-team-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s3).

We consider particles which are able to produce new particles of like kind. A single particle forms the original, or zero, generation. Every particle has probability $p_{k} \(k = 0, 1, 2,...)$ of creating exactly k new particles; the direct descendants of the nth generation form the $(n + 1) \mathrm{st}$ generation. The particles of each generation act independently of each other.

Assume $0 < p_{0} < 1$ . Let $\begin{array}{r}{P(x) = \sum_{k > 0} p_{k} x^{k}} \end{array}$ and $\begin{array}{r}{\mu = P^{\prime}(1) = \sum_{k > 0} kp_{k}} \end{array}$ be the expected number of direct descendants of one particle. Prove that if $\mu > 1$ , then the probability $x_{n}$ that the process terminates at or before the nth generation tends to the unique root $\sigma \in(0, 1)$ of equation $\sigma = P(\sigma)$

Problem 4. (Isopermetric inequality). Consider a closed plane curve described by a parametric equation $(x(t), y(t)), 0 \leq t \leq T$ with parameter t oriented counterclockwise and $(x(0), y(0)) =(x(T), y(T))$

(a): Show that the total length of the curve is given by

$$
L = \int_{0}^{T} \sqrt{(x^{\prime}(t))^{2} +(y^{\prime}(t))^{2})} dt
$$

(b): Show that the total area enclosed by the curve is given by

$$
A = \frac{1}{2} \int_{0}^{T}(x(t) y^{\prime}(t) - y(t) x^{\prime}(t)) dt
$$

(c): The classical iso-perimetric inequality states that for closed plane curves with a fixed length $L_{;}$ , circles have the largest enclosed area A. Formulate this question into a variational problem.

(d): Derive the Euler-Lagrange equation for the variational problem in (c).

(e): Show that there are two constants $x_{0}$ and $y_{0}$ such that

$$
(x(t) - x_{0})^{2} +(y(t) - y_{0})^{2} \equiv r^{2}
$$

where $r = L /(2 \pi)$ . Explain your result.

## Problem 5

^yau-2015-semifinal-written-team-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s5).

Let $A \in \mathbb{R}^{n \times m}$ with rank $r < \operatorname{min}(m, n)$ . Let $A = U \Sigma V^{T}$ be the SVD of A, with singular values $\sigma_{1} \geq \sigma_{2} \geq \cdot \cdot \cdot \geq \sigma_{r} > 0$

(a) Show that, for every $\epsilon > 0$ , there is a full rank matrix $A_{\epsilon} \in \mathbb{R}^{n \times m}$ such that $\lvert \lvert A - A_{\epsilon} \rvert \rvert_{2} = \epsilon.$

(b) Let $A_{k} \stackrel{\cdot \cdot}{=} U \Sigma_{k} V^{T}$ where $\Sigma_{k} = \operatorname{diag}(\sigma_{1}, \ldots, \sigma_{k}, 0, \ldots, 0)$ and $1 \leq k \leq r - 1$ Show that rank(A ) = k and

$$
\sigma_{k + 1} = | | A - A_{k} | |_{2} = \min \left\{\left| | A - B | |_{2} \quad \right| \quad \operatorname{rank}(B) \leq k \right\}
$$

(c) Assume that $r = \operatorname{min}(m, n)$ . Let $B \in \mathbb{R}^{n \times m}$ and assume that $| | A - B | |_{2} < \sigma_{r}$ Show that $\operatorname{rank}(B) = r$

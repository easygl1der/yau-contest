# 2014 Yau Mathematical Contest Final Interview team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2014-final-interview-team-applied-team.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2014-final-interview-team-applied-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2014-final-interview-team-applied-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## S.-T. Yau College Student Mathematics Contest

## Applied Mathematics, Team, 2014

For the interval $[0, \pi]$ , we divide it into $N + 1$ equally spaced subintervals by using the nodal points:

$$
0 = x_{0} < x_{1} < \dots < x_{N + 1} = \pi,
$$

with

$$
x_{i} = ih, \quad h = \pi /(N + 1).
$$

For any continuous function w on $[0, \pi]$ , we define $\Pi_{h} w$ to be the piecewise linear interpolation of $w.$ , namely $\Pi_{h} w$ is linear on each subinterval $(x_{i}, x_{i + 1})$ for $i = 0, 1, \cdots, N$ , and it takes the same values as w at all nodal points $x_{i}, \i \ =$ $0, 1, \cdots, N + 1$ . For any function w, we define

$$
\| w \| = \left(\int_{0}^{\pi} w^{2}(x) dx\right)^{1 / 2}.
$$

Prove the following estimates for any function $u \in C^{2}[0, \pi]$

$$
\| u - \Pi_{h} u \| \leq \frac{1}{\pi^{2}} h^{2} \| u^{\prime \prime} \|, \quad \| u^{\prime} -(\Pi_{h} u)^{\prime} \| \leq \frac{1}{\pi} h \| u^{\prime \prime} \|.
$$

## claw-free graphs

A graph $G(V, E)$ is claw-free if it has no induced subgraph isomophic to the bipartite complete graph $K_{1, 3},(\mathrm{i.e, ~} V = \{w, u_{1}, u_{2}, u_{3}\}, E = \{wu_{1}, wu_{2}, wu_{3}\})$

$$
\alpha \leq \frac{2n}{\delta + 2}.
$$

Let G be a claw-free graph of order n. Let δ be the minimum degree of G and α the size of a maximum independent set. Prove that

Over $\Omega =(0, 1)$ , consider the heat equation with a homogeneous Dirichelt boundary condition

$$
\partial_{t} u = u_{xx} + f, \quad \text{in} \Omega,\tag{1}
$$

$$
u(0, t) = u(1, t) = 0,\tag{2}
$$

in which $f(x, t)$ is a given force term, with $\| f(\cdot, t) \|_{L^{2}} \leq M$ , for any $t \geq 0$ . The following semidiscrete implicit scheme is given

$$
\frac{u^{n + 1} - u^{n}}{\Delta t} = u_{xx}^{n + 1} + f^{n + 1}, \quad \mathrm{in} \Omega,\tag{3}
$$

$$
u^{n + 1}(0) = u^{n + 1}(1) = 0,\tag{4}
$$

in which $u^{k}$ denotes the numerical solution at $t^{k}.$ , with $t^{k} = k \Delta t$ , ∆t being the time step size.

The final time is set as $T > 0$ and the initial data is given by $u^{0}(x)$ . Prove the following uniform in time $L^{2}$ bound for the numerical scheme (3)-(4):

$$
\left\| u^{k} \right\|_{L^{2}}^{2} \leq \tilde{C} := \left\| u^{0} \right\|_{L^{2}}^{2} + C_{2}^{4} M^{2}, \quad \text{for any} k \geq 0,\tag{5}
$$

in which $\tilde{C}$ is independent on the time step $t^{k}$ , and $C_{2}$ is given by the following Pincar´e inequality

$$
\left\| v \right\|_{L^{2}} \leq C_{2} \left\| v_{x} \right\|_{L^{2}}, \quad \text{if} v(0) = v(1) = 0.\tag{6}
$$

Hint. Take an $L^{2}$ inner product with $2u^{n + 1}$ , use Poincar´e inequality, and apply an induction in time to derive a uniform in time $L^{2}$ bound.

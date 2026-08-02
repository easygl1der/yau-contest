# 2018 丘赛 半决赛笔试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2018-semifinal-written-individual.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2018-semifinal-written-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2018-semifinal-written-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

# Applied Math. and Computational Math. Individual (5 problems)

## 题 1

^yau-2018-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2018-semifinal-written-individual-solutions.md#^yau-2018-semifinal-written-individual-s1)。

We consider the following convection-difusion equation

$$
u_{t} + au_{x} = bu_{xx}, \quad 0 \leq x < 1\tag{1}
$$

with an initial condition $u(x, 0) = f(x)$ and periodic boundary condition, where a and $b > 0$ are constants. The first order IMEX (implicit-explicit) time discretization and second order central spatial discretization are used to give the following scheme:

$$
\frac{u_{j}^{n + 1} - u_{j}^{n}}{\Delta t} + a \frac{u_{j + 1}^{n} - u_{j - 1}^{n}}{2 \Delta x} = b \frac{u_{j + 1}^{n + 1} - 2u_{j}^{n + 1} + u_{j - 1}^{n + 1}}{\Delta x^{2}}\tag{2}
$$

with a uniform mesh $x_{j} = j \Delta x$ with spatial mesh size $\Delta x$ and time step $\Delta t$ . Here $u_{j}^{n}$ is the numerical solution approximating the exact solution of (1) at $\boldsymbol{x} = \boldsymbol{x}_{j}$ and $t = n \Delta t$ Prove that the scheme is $L^{2}$ stable under the very mild time step restriction

$$
\Delta t \leq c\tag{3}
$$

with a constant c which is independent of $\Delta x$ . Can you determine the dependency of c on the two constants a and b in (1)?

## 2. Velocity-Verlet method.

(a) Recast the following Newtonian formula for the acceleration and potential force

$$
q^{\prime \prime}(t) = - \nabla V(q),
$$

into a Hamiltonian system and show that the corresponding map on the phase space is symplectic.

(b) Show that the velocity-Verlet (recovered many times: Delambre 1791, Størmer in 1907, Cowell & Crommelin 1909, Verlet 1960s) method

$$
p_{n + 1 / 2} = p_{n} - \frac{\Delta t}{2} \nabla V(q_{n});
$$

$$
q_{n + 1} = q_{n} + \Delta tp_{n + 1 / 2};
$$

$$
p_{n + 1} = p_{n + 1 / 2} - \frac{\Delta t}{2} \nabla V(q_{n + 1})
$$

is symplectic and is second order accurate.

Hint: Let $\boldsymbol{u}(t) =(p(t), q(t))$ be a solution of the Hamiltonian system with initial data $u_{0} =(p_{0}, q_{0})$ and we view the solution $u(t)$ as a map map on the phase space $\varphi _ { t } : $ $\mathbb{R}^{d} \times \mathbb{R}^{d} \to \mathbb{R}^{d} \times \mathbb{R}^{d} \ \varphi_{t}(u_{0}) = u(t)$ . We call the flow map is symplectic if its Jacobian

$$
\Phi_{t}(u_{0}) = \frac{\partial \varphi_{t}(u_{0})}{\partial u_{0}} = \left(\begin{array}{cc} \frac{\partial p(t)}{\partial p_{0}} & \frac{\partial p(t)}{\partial q_{0}} \\ \frac{\partial q(t)}{\partial p_{0}} & \frac{\partial q(t)}{\partial q_{0}} \end{array} \right)
$$

satisfies $\Phi_{t}(u_{0})^{\mathrm{T}} J \Phi_{t}(u_{0}) = J$ for any $u_{0} \in \mathbb{R}^{d} \times \mathbb{R}^{d}$ . Here $J = \left(\begin{array}{cc}{{0}} &{{I}} \\{{- I}} &{{0}} \end{array} \right)$

A scheme $\varphi_{n}(u_{0}), n = 1, 2 \ldots,$ , is symplectic if the map $\varphi_{n}(u_{0})$ is symplectic.

## 题 3

^yau-2018-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2018-semifinal-written-individual-solutions.md#^yau-2018-semifinal-written-individual-s3)。

We begin with some definitions.

(1) A graph G is a pair $G =(V, E)$ where V is a finite set, called the vertices of G, and E is a subset of $P_{2}(V) ~(i.e., \mathrm{~ a ~}$ set E of (unordered) two-element subsets of $V ~)$ called the edges of G. A simple graph G is a graph without loops (edge that connects a vertex to itself) or multiple edges between any pair of vertices. The order of the graph is |V |. We often put $V = \{v_{1}, v_{2}, \cdots, v_{n}\}$ and $E = \left\{v_{i} v_{j} \vert \v_{i} \right.$ and $v_{j}$ are adjacent}.

(2) Two vertices x and y are adjacent if $xy \in E$ . The neighborhood of a vertex $x,$ denoted by $N_{G}(x)$ or $N(x)$ , is the set of vertices that is adjacent to x. The degree of a vertex x, denoted by $d_{G}(x)$ or $d(x)$ , is $| N(x) |$ (i.e. the number of vertices that is adjacent to x).

(3) A path is a collection of distinct vertices $v_{i_{1}} v_{i_{2}} \cdots v_{i_{k}}$ such that $v_{i_{j}} v_{i_{j + 1}} \in E$ for all $j, \1 \leq \j < k.\v_{i_{1}}$ and $v_{i_{k}}$ are the ends of the path. A Hamiltonian path P is a path containing all vertices of the graph. A cycle is a closed path with $v_{i_{1}} = v_{i_{k}}.$ . A Hamiltonian cycle is a cycle containing all vertices of the graph. A graph is called Hamiltonian if it has a Hamiltonian cycle.

(4) A graph G is (Hamilton) connected, if for every pair of vertices there is a (Hamiltonian) path between them.

An example of a simple graph: $V = \{v_{1}, v_{2}, v_{3}, v_{4}\}$ and $E = \left\{v_{1} v_{2}, v_{2} v_{3}, v_{3} v_{4}, v_{2} v_{4} \right\}$ In this graph, the order of the graph is 4, $N(v_{1}) = \{v_{2}\}, N(v_{4}) = \{v_{2}, v_{3}\}, d(v_{3}) = 2$ $d(v_{2}) = 3$ and $v_{1} v_{2} v_{4} v_{3}$ is a Hamiltonian path with ends $v_{1}$ and v<sub>3</sub>.

Let G be a simple graph of order n. Suppose that the degree sum of any pair of nonadjacent vertices is at least $n{\mathrel{+{1}}}$ . Show that G is Hamilton-connected (i.e. between any pair of vertices x and y, there is a Hamiltonian path in which x and y are the ends).

## 题 4

^yau-2018-semifinal-written-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2018-semifinal-written-individual-solutions.md#^yau-2018-semifinal-written-individual-s4)。

Define the Hermite polynomials as

$$
H_{n}(x) =(- 1)^{n} \exp(\frac{x^{2}}{2}) \frac{d^{n}}{dx^{n}}[\exp(- \frac{x^{2}}{2})], \quad x \in(- \infty, + \infty), n = 0, 1, 2, \dots.\tag{4}
$$

(a) Prove the weighted orthogonality of the Hermite polynomials:

$$
\langle H_{n}(x), H_{m}(x) \rangle_{\rho} \triangleq \int_{- \infty}^{+ \infty} \rho(x) H_{n}(x) H_{m}(x) dx = n! \sqrt{2 \pi} \delta_{n, m},\tag{5}
$$

where $\textstyle \rho(x) = \exp(-{\frac{x^{2}}{2}})$

(b) Prove the three recurrence formula:

$$
H_{n + 1}(x) = xH_{n}(x) - nH_{n - 1}(x), \quad n \geq 1,\tag{6}
$$

and then show that for all $n \geq 1, H_{n}(x)$ and $H_{n - 1}(x)$ share no common roots.

(c) Use the recurrence formula and induction to prove the diferential relation:

$$
\frac{d}{dx} H_{n}(x) = nH_{n - 1}(x), \quad n \geq 1,\tag{7}
$$

and then prove that $H_{n}$ is an eigenfunction of the following eigenvalue problem

$$
xu^{\prime}(x) - u^{\prime \prime}(x) = \lambda u.\tag{8}
$$

You need to find the eigenvalue $\lambda_{n}$ corresponding to $H_{n}(x)$

## 题 5

^yau-2018-semifinal-written-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2018-semifinal-written-individual-solutions.md#^yau-2018-semifinal-written-individual-s5)。

Take $\sigma_{i}(A)$ to be the i-th singular value of the square matrix $A \in \mathbb{R}^{n \times n}$ . Define the nuclear norm of A to be

$$
\| A \|_{*} \equiv \sum_{i = 1}^{n} \sigma_{i}(A).
$$

(1) Show that $\| A \|_{*} = \mathrm{tr}(\sqrt{A^{T} A})$

(2) Show that $\| A \|_{*} = \operatorname{max}_{X^{T} \X = I} \operatorname{tr}(AX)$

(3) Show that $\| A + B \|_{*} \leq \| A \|_{*} + \| B \|.$ ∗

(4) Explain informally why minimizing $\| A - A_{0} \|_{\mathrm{F}}^{2} + \| A \|$ over A for a fixed $A_{0} \in$ $\mathbb{R}^{n \times n}$ might yield a low-rank approximation of $A_{0}$

Notation: The trace of a matrix $\operatorname{tr}(A)$ is the sum $\textstyle \sum_{i} a_{ii}$ of its diagonal elements. We define the square root of a symmetric positive semidefinite matrix M to be $\sqrt{M} \equiv$ $UD^{1 / 2} U^{T}$ , where $D^{1 / 2}$ is the diagonal matrix containing (nonnegative) square roots of the eigenvalues of M and U contains the eigenvectors of $\mathbf{\dot{M}} = UDU^{T}$

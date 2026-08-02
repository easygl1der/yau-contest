# 2024 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2024-final-interview-team-acm-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2024-final-interview-team-acm-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2024-final-interview-team-acm-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## June 9, 2024

## Question 1

Let $\varphi :(0, \infty) \to(0, \infty)$ be continuous and increasing, and let $M > 0$ . Given any $T_{*}$ such that $0 < T_{*} <$ $\textstyle \int_{M}^{\infty}{\dot{dz}} / \varphi(z)$ , show that there exists $C_{*} > 0$ independent of $\Delta t > 0$ with the following property. Suppose that quantities $z_{n}, w_{n} \ge 0$ satisfy

$$
z_{n} + \sum_{k = 0}^{n - 1} w_{k} \Delta t \leq y_{n} := M + \sum_{k = 0}^{n - 1} \varphi(z_{k}) \Delta t,
$$

for $n = 0, 1, \ldots, n_{*}$ , with $n_{*} \Delta t \le T_{*}$ . Then $y_{n_{*}} \leq C_{*}$ (independent of $\Delta t{\bf \theta})$

## Question 2

Let u be the solution to the transport equation

$$
u_{t} + u_{x} = 0,
$$

on the $0 \leq x \leq 2 \pi$ with periodic boundary conditions and the initial data $u(x, 0) = \exp(-(x - \pi)^{2})$ . Consider C the discrete approximation to the solution $v_{j} \approx u(x_{j}, t)$ on the grid $x_{j} = jh, h = \frac{\ref{eq : 1}}{N + 1}, j = 1, \cdots, N + 1$ We define three finite diference operators acting on a grid function $v_{j}{\mathrm{:}}$

$$
D_{-} v_{j} = \frac{v_{j} - v_{j - 1}}{h}, \quad D_{+} v_{j} = \frac{v_{j + 1} - v_{j}}{h}, \quad D_{0} v_{j} = \frac{v_{j + 1} - v_{j - 1}}{2h}.
$$

(a) Consider the following three semi-discretizations

$$
(i) \frac{dv_{j}}{dt} + D_{-} v_{j} = 0,(ii) \frac{dv_{j}}{dt} + D_{+} v_{j} = 0,(iii) \frac{dv_{j}}{dt} + D_{0} v_{j} = 0.
$$

It is known that two of the above $\mathrm{(i) -(iii)}$ are stable and produce the results in Figure 1 when evolved one period in time using the classic fourth-order Runge-Kutta method.

(a-i). Which of the three semi-discretizations is not stable and why?

(a-ii). For the two stable methods, what method goes with which plot in Figure 1 and why?

(b) Let D denote one of the diference operators above. We take a forward Euler scheme in time to have

$$
\frac{v_{j}^{n + 1} - v_{j}^{n}}{\Delta t} + D \Big(\frac{v_{j}^{n + 1} + v_{j}^{n}}{2} \Big) = 0
$$

![](parts/images/8c7e86f0fdb2b846b68f750489ce4baf1b983b1ecabff99698393e849091b794.jpg)  
(A)

![](parts/images/ffc5b1a30bd01d58d921bed8f597155b5e6d494dd25b1b11a80ccc8410b0fca9.jpg)  
(B)  
Figure 1: Solid lines represent the numerical solutions, and dashed lines represent the exact solutions

where the superscript n now denotes the time index. Show that with this time-stepping, the spatial discretization corresponding to Figure 1 (A) satisfies

$$
\| v^{n + 1} \|_{h}^{2} = \| v^{n} \|_{h}^{2},
$$

while the discretization corresponding to Figure 1 (B) satisfies

$$
\| v^{n + 1} \|_{h}^{2} \leq \| v^{n} \|_{h}^{2}.
$$

where the norm $\| v \|_{h}^{2} =(v, v)_{h}$ with the inner product $\begin{array}{r}{(v, w)_{h} = \sum_{j = 1}^{N + 1} hv_{j} w_{j}} \end{array}$ . Hint: For the derivation of the last inequality, it might be useful to first find $\alpha_{+}$ and/or α<sub>−</sub> such that $D_{\pm} v_{j} = D_{0} v_{j} + \alpha_{\pm} D_{+} D_{-} v_{j}$

## Question 3

Let u be a velocity field in $\mathbb{R}^{3}$ and let $\Gamma^{u}(t)$ be a surface which evolves under velocity filed u as time t increases, with a bounded closed initial surface $\Gamma^{u}(0) = \Gamma^{0}$ . Namely, the surface is the image of a flow map $X^{u}(., t) : \Gamma^{0} \to \mathbb{R}^{3}$ satisfying the following diferential equation:

$$
\begin{array}{cl} \frac{\partial}{\partial t} X^{u}(p, t) = u(X^{u}(p, t)) & \text{for} p \in \Gamma^{0} \\ X^{u}(p, 0) = p & \text{for} p \in \Gamma^{0}.\end{array}\tag{1}
$$

If one solves this ordinary diferential equation (ODE) for a set of points p on the initial surface $\Gamma^{0}$ , then one gets the location of these points at any time t. However, since the surface may have large deformation, the points obtained in this way may not form a good mesh for $\Gamma^{u}(t)$ , as shown in Figure 2 (b).

David Gu and Shing-Tung Yau considered the following problem of finding a “good” map between two surfaces $\Gamma^{0}$ and $\Gamma^{u}(t)$ to produce good mesh on $\Gamma^{u}(t)$ :

$$
\mathrm{Find} X(\cdot, t): \Gamma^{0} \to \Gamma^{u}(t) \mathrm{tominimize} \int_{\Gamma^{0}} | \nabla_{\Gamma^{0}} X |^{2} \S,\tag{2}
$$

where $\nabla_{\Gamma^{0}}$ denotes surface tangential gradient and $\mathrm{S}$ denotes the surface area element. This map $X(\cdot, t)$ : $\Gamma^{0} \to \Gamma^{u}(t)$ ) minimizes the deformation energy $\int_{\Gamma^{0}} | \nabla_{\Gamma^{0}} X |^{2} \mathrm{S}$ and therefore could produce a better mesh (with less deformation). An eficient method of computing a good flow map $X(\cdot, t) : \bar{\Gamma}^{0} \mathbb{R}^{3}$ satisfying (2) is to solve the following problem:

$$
\begin{array}{cc} v \cdot n = u \cdot n & \text{on} \Gamma(t) \\ - \Delta_{\Gamma^{0}} X = \kappa \left(n \circ X\right) & \text{on} \Gamma^{0}, \end{array}\tag{3}
$$

![](parts/images/b2e982c97a1dea32dbe7dbfb1c619c9f5a659d9888a22935f039eaca2306df16.jpg)  
(a) Mesh on initial surface Γ<sup>0</sup>

![](parts/images/e180a3cfe73a94e79dbe2a552d3ec3a79f465f66a056613d46e075ca23ed5ea3.jpg)  
(b) Surface at t = 4 by solving ODE (1)

![](parts/images/705aeef263d28a6f19b78358ce4cf9a99063092e7011886605afaa1938541efc.jpg)  
(c) Surface at t = 23 by solving PDE (3)  
Figure 2: Surface Γ(t) computed by diferent numerical methods

where n denotes the unit normal vector on surface Γ(t), where κ is an unknown scalar function to be solved The method in (3) is based on the following ideas: The shape of an evolving surface is only determined by its normal velocity, rather than its tangential velocity. However, solving PDE (3) significantly improves the mesh quality, as shown in Figure 2 (c).

Problem (3) can be solved by a finite element method as follows. Let $t_{m} = m \tau, m = 0, 1, 2, \ldots$ , with time stepsize τ , and suppose that $\Gamma_{h}^{m}$ is a given triangulated surface which well approximates the bounded smooth closed surface $\Gamma(t_{m})$ . Let $\ddot{X_{h}^{m}} : \Gamma_{h}^{0} \to \Gamma_{h}^{m}$ be the piecewise linear map which maps each triangle of $\Gamma_{h}^{0}$ to a triangle of $\Gamma_{h}^{m}$ (thus $X_{h}^{m}$ maps $\Gamma_{h}^{0}$ onto $\Gamma_{h}^{m})$ , and let $N_{h}^{m} = n_{h}^{m} \circ X_{h}^{m}$ with $n_{h}^{m}$ being the unit normal vector on $\Gamma_{h}^{m}$ (piecewise constant vector defined on each triangle). Let $S_{h}^{1}(\Gamma_{h}^{0})^{3}$ be the finite element space of 3-dimensional vector-valued piecewise linear functions on $\Gamma_{h}^{0},$ and let $S_{h}^{0}(\Gamma_{h}^{0})$ be the finite element space of scalar-valued piecewise constant functions on $\Gamma_{h}^{0}$ . Find $(X_{h}^{m + 1}, \kappa_{h}^{m + 1}) \in \mathring{S}_{h}^{1}(\Gamma_{h}^{0})^{3} \times S_{h}^{0}(\Gamma_{h}^{0})$ such that

$$
\begin{array}{ll} \int_{\Gamma_{h}^{0}} \frac{X_{h}^{m + 1} - X_{h}^{m}}{\tau} \cdot N_{h}^{m} \chi_{h} S = \int_{\Gamma_{h}^{0}}(u \circ X_{h}^{m}) \cdot N_{h}^{m} \chi_{h} S & \forall \chi_{h} \in S_{h}(\Gamma_{h}^{0}) \\ \int_{\Gamma_{h}^{0}} \nabla_{\Gamma_{h}^{0}} X_{h}^{m + 1} \cdot \nabla_{\Gamma_{h}^{0}} v_{h} S = \int_{\Gamma_{h}^{0}} \kappa_{h}^{m + 1} N_{h}^{m} \cdot v_{h} S & \forall v_{h} \in S_{h}(\Gamma_{h}^{0})^{3}.\end{array}\tag{4}
$$

(i) Show that the map X determined by (3) is a local minimizer of (2) with $\Gamma^{u}(t)$ determined by (1).

(ii) Show that the weak formulation in (4) has a unique solution $(X_{h}^{m + 1}, \kappa_{h}^{m + 1}) \in S_{h}^{1}(\Gamma_{h}^{0})^{3} \times S_{h}^{0}(\Gamma_{h}^{0})$

# 2020 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2020-final-interview-overall-applmath-overall-yau-acm20.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2020-final-interview-overall-applmath-overall-yau-acm20/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Question I

Consider the following gradient flow with discrete normalization (GFDN)

$$
\begin{array}{rl} &{\partial_{t} u(x, t) = \left[\partial_{xx} - V(x) - \beta | u |^{2} \right] u, \quad 0 < x < 1, \t_{n} \leq t < t_{n + 1}, \n \geq 0,} \\ &{u(x, t_{n + 1}) = u(x, t_{n + 1}^{+}) : = \frac{u(x, t_{n + 1}^{-})}{\| u(\cdot, t_{n + 1}^{-}) \|_{L^{2}}}, \qquad 0 \leq x \leq 1, \quad n \geq 0,} \\ &{u(x, 0) = g_{0}(x), \qquad 0 \leq x \leq 1,} \\ &{u(0, t) = u(1, t) = 0, \qquad t \geq 0,} \end{array}
$$

where $u \ : = \ : u(x, t)$ is a real-valued function, $V(x) \geq 0$ for $0 \leq x \leq 1$ is a given function, $\beta \geq 0$ is a given constant, $t_{n} = n \tau$ for $n = 0, 1, 2,...$ . with $\tau > 0$ being the time step, $\begin{array}{r}{u(x, t_{n}^{\pm}) : = \operatorname{lim}_{t \to t_{n}^{\pm}} u(x, t), \| u \|_{L^{2}}^{2} = \int_{0}^{1} | u(x) |^{2}} \end{array}$ dx and $g_{0}(x)$ is a given function satisfying $\| g_{0} \|_{L^{2}} = 1$ . Define the mass and energy as

$$
\begin{array}{l}{\displaystyle{M(t) : = M(u(\cdot, t)) = \int_{0}^{1} \left| u(x, t) \right|^{2} dx, \qquad t \geq 0,}} \\{\displaystyle{E(t) : = E(u(\cdot, t)) = \int_{0}^{1} \left[| \partial_{x} u(x, t) |^{2} + V(x) | u(x, t) |^{2} + \frac{\beta}{2} | u(x, t) |^{4} \right] dx.}} \end{array}
$$

## 题 1

^yau-2020-final-interview-overall-applmath-overall-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md#^yau-2020-final-interview-overall-applmath-overall-yau-acm20-s1)。

Show that the mass and energy are diminishing in each time interval $[t_{n}, t_{n + 1})$ 2 i.e.

$$
M(t_{2}) \leq M(t_{1}), \qquad E(t_{2}) \leq E(t_{1}), \qquad t_{n} \leq t_{1} \leq t_{2} < t_{n + 1}, \quad n \geq 0.
$$

## 题 2

^yau-2020-final-interview-overall-applmath-overall-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md#^yau-2020-final-interview-overall-applmath-overall-yau-acm20-s2)。

When $\beta = 0$ , show that

$$
E(g_{0}) = E(u(x, t_{0})) \geq E(u(x, t_{1})) \geq \cdots \geq E(u(x, t_{n})) \geq \cdots, \qquad n \geq 0,
$$

for any given time step $\tau > 0$ and initial data $g_{0}(x)$

## 题 3

^yau-2020-final-interview-overall-applmath-overall-yau-acm20-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md#^yau-2020-final-interview-overall-applmath-overall-yau-acm20-s3)。

Let $\tau \to 0^{+}$ in the problem GFDN, what partial diferential equations can you get? Show that the limiting equation is mass conservative and energy diminishing.

Question II

Define a dynamical system

$$
\frac{dy_{t}}{dt} = - A^{T}(Ax_{t} - b),\tag{1a}
$$

$$
y_{t} \in \partial{\psi}(x_{t}),\tag{1b}
$$

where $A \in \mathbb{R}^{n \times k}$ satisfies that $A^{T} A$ has smallest eigenvalue $\gamma > 0, b = Ax^{*}$ , and $\begin{array}{r}{\psi({x}) = \|{x} \|_{1} + \frac{\|{x} \|_{2}^{2}}{2 \alpha}} \end{array}$ has its subgradient set $\partial \psi(x)$ at $\boldsymbol{x} \in \mathbb{R}^{k}$ , where $\alpha > 0$ is a given constant. For a convex function $\psi : \mathbb{R}^{k} \mathbb{R}$ , define the Bregman divergence function associated with ψ, $D_{\psi} : \mathbb{R}^{k} \times \mathbb{R}^{k} \mathbb{R}$ , by

$$
D_{\psi}(x^{\prime}, x) : = \psi(x^{\prime}) - \psi(x) - \langle \partial \psi(x), x^{\prime} - x \rangle.\tag{2}
$$

## 题 1

^yau-2020-final-interview-overall-applmath-overall-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md#^yau-2020-final-interview-overall-applmath-overall-yau-acm20-s1)。

Show that (1) leads to the following ODE

$$
\frac{dD_{\psi}(x^{*}, x_{t})}{dt} = - \| A(x_{t} - x^{*}) \|_{2}^{2}.\tag{3}
$$

## 题 2

^yau-2020-final-interview-overall-applmath-overall-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-overall-applmath-overall-yau-acm20-solutions.md#^yau-2020-final-interview-overall-applmath-overall-yau-acm20-s2)。

For $x_{t}$ in (1), define

$$
\tau : = \operatorname{inf} \{t > 0 : \operatorname{sign}(x_{t}) = \operatorname{sign}(x^{*})\}.\tag{4}
$$

Denote by $x^{*}$ the smallest nonzero magnitude of $| x_{i} | \(i = 1, \ldots, k)$ . Find an upper bound of $\tau_{:}$ as tight as possible.

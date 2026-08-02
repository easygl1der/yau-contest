# 2020 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Question I

Let $A \in \mathbb{R}^{n \times n}$ be a symmetric matrix and let $q_{1} \in \mathbb{R}^{n}$ satisfy $\| q_{1} \|_{2} = 1$ . Consider the following iteration:

$$
\begin{array}{rl} &{r_{0} = q_{1}, \quad \beta_{0} = 1, \quad q_{0} = 0, \quad k : = 0} \\ &{\mathrm{while} \quad \beta_{k} \neq 0} \\ &{\quad q_{k + 1} : = r_{k} / \beta_{k}} \\ &{\quad k : = k + 1} \\ &{\quad \alpha_{k} : = q_{k}^{T} Aq_{k}} \\ &{\quad r_{k} : = \left(A - \alpha_{k} I \right) q_{k} - \beta_{k - 1} q_{k - 1}} \\ &{\quad \beta_{k} : = \| r_{k} \|_{2}} \\ &{\mathrm{end}} \end{array}
$$

Let $K_{k} = \operatorname{span} \{q_{1}, Aq_{1}, \cdot \cdot \cdot, A^{k - 1} q_{1}\}$ and $Q_{k} =[q_{1} \cdots q_{k}]$ be a matrix whose columns are $\{q_{i}\}_{i = 1}^{k}$ obtained from the above iteration.

## 题 1

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s1)。

Assume that the iteration does not terminate. Show that $Q_{k}$ has orthonormal columns, and that they span $K_{k}$

## 题 2

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s2)。

What is the purpose of this algorithm? Justify your answer.

## Question II

Consider the oscillatory second order ordinary diferential equation (ODE)

$$
y^{\prime \prime}(t) + \lambda^{2} y(t) + g(y(t)) = 0, \qquad 0 < t \leq T,
$$

with the initial data

$$
y(0) = \alpha, \qquad y^{\prime}(0) = \beta,
$$

where $\lambda > > 1$ , α and $\beta$ are given constants, and $g(y)$ is a given Lipschitz continuous function.

Choose a time step $\tau > 0$ and denote $t_{n} = n \tau$ for $n \geq 0$ . Let $y^{n}$ be the numerical approximation of $y(t_{n})$ for $n \geq 0$

## 题 1

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s1)。

Re-write the above ODE into its equivalent integral formulation near $t = t_{n}$ with $t = t_{n} + s$ for $s \in \mathbb{R}$ via the variation-of-constant formula.

## 题 2

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s2)。

Based on the integral formulation, design the following time integrator via proper numerical quadratures

$$
y^{n + 1} = 2 \cos(\lambda \tau) y^{n} - y^{n - 1} -{\frac{\sin(\lambda \tau)}{\lambda}} g(y^{n}), \qquad n \geq 1,
$$

with

$$
y^{0} = \alpha, \qquad y^{1} = \alpha \cos(\lambda \tau) +{\frac{\beta}{\lambda}} \sin(\lambda \tau) -{\frac{\sin(\lambda \tau)}{2 \lambda}} g(\alpha).
$$

Under proper stability assumption, prove the following error bound

$$
| y(t_{n}) - y^{n} | \leq C \tau^{2}, \qquad 0 \leq n \leq \frac{T}{\tau},
$$

where $C > 0$ is a constant independent of $\tau.$

## Question III

Consider an energy functional for $\rho \in{\mathcal{P}}(\mathbb{R})$ (probability distribution on the real line), given by

$$
F[\rho] = \int_{\mathbb{R} \times \mathbb{R}} \rho(x) K(x - y) \rho(y){d} x{d} y + \int_{\mathbb{R}} \rho(x)(1 - \rho(x)){d} x + \int_{\mathbb{R}} \rho(x) \ln \rho(x){d} x,
$$

where $K : \mathbb{R} \mathbb{R}_{+}$ is a given kernel.

## 题 1

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s1)。

Write down explicitly the Euler-Lagrange equation corresponding to $F$

## 题 2

^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set2-yau-acm20-s2)。

Consider the dynamics

$$
\frac{d}{d t} \rho(x, t) = \nabla \cdot \Big(\rho(x, t) \nabla \frac{\delta F}{\delta \rho} \big[\rho(x, t) \big] \Big).
$$

Show that $F[\rho(x, t)]$ is decreasing in $t.$

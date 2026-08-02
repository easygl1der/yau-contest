# 2022 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2022-final-interview-overall-applmath-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2022-final-interview-overall-applmath-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Question I

Consider the ordinary diferential equation (ODE) for $y(t) \in \mathbb{R}$ as

$$
\varepsilon^{2} y^{\prime \prime}(t) + \left(\mu^{2} + \frac{1}{\varepsilon^{2}}\right) y(t) = f(t), \quad t > 0, y(0) = y_{0},
$$

where $\mu > 0$ is a constant, $f(t)$ is a given function, and $0 < \varepsilon \ll 1$ is a small parameter.

## 题 1

^yau-2022-final-interview-overall-applmath-overall-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s1)。

Use variation-of-constant formula to reformulate the ODE into an equivalent integral form.

## 题 2

^yau-2022-final-interview-overall-applmath-overall-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s2)。

Construct a second order numerical scheme for solving the ODE, whose accuracy is independent of ε.

## 题 3

^yau-2022-final-interview-overall-applmath-overall-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2022-final-interview-overall-applmath-overall-solutions.md#^yau-2022-final-interview-overall-applmath-overall-s3)。

Prove the convergence rates of the constructed numerical scheme above.

## Question II

Show that the finite diference method

$$
\frac{u_{j}^{n + 1} - u_{j}^{n}}{\Delta t} = \frac{u_{j - 1}^{n} - 2u_{j}^{n} + u_{j + 1}^{n}}{\Delta x^{2}} + u_{j}^{n}
$$

for the equation $\begin{array}{r}{\frac{\partial u}{\partial t} = \frac{\partial^{2} u}{\partial x^{2}} + u(- \infty < x < + \infty, t > 0)} \end{array}$ is stable if $\begin{array}{r}{\frac{\Delta t}{\Delta x^{2}} \leq \frac{1}{2}} \end{array}$

# 2020 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Question I

Let A be an $m \times n$ matrix and its singular value decomposition (SVD) be

$$
V^{T} AU = F = \left[\begin{array}{cccccc} \mu_{1} & 0 & \dots & 0 & \dots & 0 \\ 0 & \mu_{2} & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & \mu_{r} & \dots & 0 \\ 0 & 0 & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & 0 & \dots & 0 \end{array} \right],
$$

where the matrices U and V are orthogonal, and the singular values $\mu_{i}$ satisfy

$$
\mu_{1} \geq \mu_{2} \geq \dots \geq \mu_{r} > 0.
$$

Define the $n \times m$ matrix

$$
F^{+} = \left[\begin{array}{cccccc} \mu_{1}^{- 1} & 0 & \dots & 0 & \dots & 0 \\ 0 & \mu_{2}^{- 1} & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & \mu_{r}^{- 1} & \dots & 0 \\ 0 & 0 & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & 0 & \dots & 0 \end{array} \right]
$$

and

$$
A^{+} = UF^{+} V^{T}.
$$

The matrix $A^{+}$ is called as the generalized inverse of A.

## 题 1

^yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-s1)。

Show that $x^{*} = A^{+} b$ is the least square solution of the linear system $A x = b $

## 题 2

^yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-solutions.md#^yau-2020-final-interview-individual-applmath-individual-set1-yau-acm20-s2)。

Show that

$$
\lim_{\alpha \to 0^{+}}(\alpha I + A^{T} A)^{- 1} A^{T} = A^{+},
$$

where $\alpha > 0$

Question II

Consider the following finite diference scheme

$$
\frac{v_{m}^{n + 1} - v_{m}^{n - 1}}{2 \tau} + a \left(1 + \frac{h^{2}}{6} \delta^{2}\right)^{- 1} \delta_{0} v_{m}^{n} = f_{m}^{n}
$$

for the transport equation $u_{t} + au_{x} = f$ , where a is a constant, $\tau > 0$ is the time step, $\delta_{0}$ denotes the standard second order central diference operator for $u_{x}.$ , and $\delta^{2}$ denotes the standard second order central diference operator for $u_{xx}$ . Assume that $\lambda = \tau / h$ is a constant with h being the spatial mesh size. Show that the scheme is stable if and only if

$$
| a \lambda | < \frac{1}{\sqrt{3}}.
$$

How do you modify the scheme when a is not a constant without afecting the accuracy of the scheme? Justify your answer.

## Question III

Show that the following system of ordinary diferential equations

$$
{\frac{dx}{dt}} = 0.5x + 2.5y - x(x^{2} + y^{2}),
$$

$$
{\frac{dy}{dt}} = - 0.5x + 1.5y - y(x^{2} + y^{2}).
$$

has at least one periodic solution.

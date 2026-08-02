# 2021 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2021-final-interview-individual-applmath-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2021-final-interview-individual-applmath-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Question I

Let A be an n×n matrix with real and positive eigenvalues and b be a given vector. Consider the solution of $Ax = b$ by the following Richardson’s iteration

$$
x^{(k + 1)} =(I - \omega A) x^{(k)} + \omega b
$$

where $\omega$ is a damping coeficient. Let $\lambda_{1}$ and $\lambda_{n}$ be the smallest and the largest eigenvalues of A. Let $G_{\omega} = I - \omega A$

## 题 1

^yau-2021-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s1)。

Prove that the Richardson’s iteration converges if and only if

$$
0 < \omega < \frac{2}{\lambda_{n}}.
$$

## 题 2

^yau-2021-final-interview-individual-applmath-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s2)。

Prove that the optimal choice of ω is given by

$$
\omega_{\mathrm{opt}} = \frac{2}{\lambda_{1} + \lambda_{n}}.
$$

Prove also that

$$
\rho(G_{\omega}) = \left\{\begin{array}{ll} 1 - \omega \lambda_{1}, & \omega \leq \omega_{\mathrm{opt}} \\(\lambda_{n} - \lambda_{1}) /(\lambda_{n} + \lambda_{1}), & \omega = \omega_{\mathrm{opt}} \\ \omega \lambda_{n} - 1, & \omega \geq \omega_{\mathrm{opt}} \end{array} \right.
$$

where $\rho(G_{\omega})$ is the spectral radius of $G_{\omega}$

## 题 3

^yau-2021-final-interview-individual-applmath-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s3)。

Prove that, if A is symmetric and positive definite, then

$$
\rho(G_{\omega_{\mathrm{opt}}}) = \frac{\kappa_{2}(A) - 1}{\kappa_{2}(A) + 1}
$$

where $\kappa_{2}(A)$ is the spectral condition number of A.

## Question II

Let the energy functional for $u(x) \in \mathbb{R} \(x \in[0, 1])$ be given as

$$
E[u] = \int_{0}^{1} \left[\frac{1}{2} | \partial_{x} u(x) |^{2} + \frac{1}{4 \varepsilon^{2}}(1 - | u |^{2})^{2} \right] dx, \quad 0 < \varepsilon \ll 1.
$$

Consider the dynamical equation (natural boundary condtions)

$$
\frac{d}{\mathrm{dt}} u(x, t) = - \frac{\delta E}{\delta u}[u(x, t)], \quad u(x, 0) = u_{0},
$$

where $u_{0}$ is a suficiently smooth function.

## 题 1

^yau-2021-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s1)。

Show that $E[u(x, t)]$ is decreasing in t.

## 题 2

^yau-2021-final-interview-individual-applmath-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s2)。

If initially $u_{0}(x) \in[- 1, 1]$ , show that $u(x, t) \in[- 1, 1]$ for all $t > 0$

## 题 3

^yau-2021-final-interview-individual-applmath-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s3)。

Design a semi-discrete-in-time scheme such that the energy functional is decreasing for the discrete scheme.

Question III

Let $a_{k}(t), b_{k}(t) \in \mathbb{R} \(k = 1, 2, \ldots, n)$ satisfy the diferential equations:

$$
\frac{d}{\mathrm{dt}} a_{k}(t) = 2 \left(b_{k}^{2} - b_{k - 1}^{2}\right), \quad \frac{d}{\mathrm{dt}} b_{k}(t) = b_{k} \left(a_{k + 1} - a_{k}\right), \quad k = 1, 2, \dots, n,
$$

where $b_{0}(t) = b_{n}(t) = 0$ . Consider the $n \times n$ tri-diagonal matrix $L(a, b)$

$$
L(a, b) = \left[\begin{array}{ccccc} a_{1} & b_{1} & & & \\ b_{1} & a_{2} & & & 0 \\ & & \ddots & & \\ & & & & b_{n - 1} \\ 0 & & & b_{n - 1} & a_{n} \end{array} \right],
$$

show that:

## 题 1

^yau-2021-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s1)。

The eigenvalues of $L(t) = L(a(t), b(t))$ ) are independent of t.

## 题 2

^yau-2021-final-interview-individual-applmath-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2021-final-interview-individual-applmath-individual-solutions.md#^yau-2021-final-interview-individual-applmath-individual-s2)。

lim $b_{k}(t) = 0, k = 1, 2, \cdot \cdot \cdot, n - 1$ t→∞

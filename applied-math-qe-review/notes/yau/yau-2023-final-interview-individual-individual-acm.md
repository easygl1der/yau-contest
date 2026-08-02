# 2023 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2023-final-interview-individual-individual-acm.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2023-final-interview-individual-individual-acm/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2023-final-interview-individual-individual-acm-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

June 10, 2023

## 题 1

^yau-2023-final-interview-individual-individual-acm-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2023-final-interview-individual-individual-acm-solutions.md#^yau-2023-final-interview-individual-individual-acm-s1)。

Let $U \in \mathbb{R}^{n \times n}$ be an orthogonal matrix satisfying det $(\pmb{U}) = 1$

(a) Prove that U can be written into the product of finitely many Givens rotation matrices. Recall that an $n \times n$ Givens rotation matrix is an orthogonal matrix $G(i, j, \theta)$ , for some given indices $i > j$ and some angle $\theta \in[0, 2 \pi]$ , whose entries are the same as the identity matrix except for

$$
\left\{\begin{array}{l} g_{ii} = g_{jj} = \cos \theta, \\ g_{ij} = - g_{ji} = \sin \theta.\end{array} \right.
$$

(b) Find an algorithm to compute the Givens decomposition in part $\mathrm{(a)}$

## 题 2

^yau-2023-final-interview-individual-individual-acm-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2023-final-interview-individual-individual-acm-solutions.md#^yau-2023-final-interview-individual-individual-acm-s2)。

Let $A \in \mathbb{C}^{n \times n}$ be a self-adjoint matrix wth k dominant eigenvalues, which are denoted by $\lambda_{j}, j = 1, 2, \cdots, n$ . In particular, we have

$$
\left| \lambda_{1} \right| \geq \left| \lambda_{2} \right| \geq \dots \geq \left| \lambda_{k} \right| > \left| \lambda_{k + 1} \right| \geq \dots \geq \left| \lambda_{n} \right|.
$$

We write

$$
A = QDQ^{*}
$$

where $Q \in \mathbb{C}^{n \times n}$ is unitary and $D = \operatorname{diag}(\lambda_{j}) \in \mathbb{C}^{n \times n}$ is diagonal. Consider the following iteration

$$
X^{(m + 1)} = AX^{(m)}.
$$

Assume that $X^{(0)} \in \mathbb{C}^{n \times k}$ is given. Define $\widehat{P} \in \mathbb{C}^{n \times n}$ by

$$
\widehat{P} = \left(\begin{array}{cc} I_{k} & 0 \\ 0 & 0 \end{array} \right)
$$

where $I_{k}$ is the $k \times k$ identity matrix, and $P = Q \widehat{P} Q^{\ast}$ <sup>∗</sup>. Assume that $PX^{(0)}$ has independent columns.

(a) Show that $PX^{(m)}$ also has independent columns.

(b) Hence, show that $X^{(m)}$ has independent columns.

(c) Show that, there is a matrix $\boldsymbol{\Lambda} \in \mathbb{C}^{k \times k}$ such that

$$
\frac{\|(AX^{(m)} - X^{(m)} \Lambda) y \|}{\| PX^{(m)} y \|} \leq \left(\frac{| \lambda_{k + 1} |}{| \lambda_{k} |}\right)^{m} \frac{\|(AX^{(0)} - X^{(0)} \Lambda) y \|}{\| PX^{(0)} y \|}
$$

for all non-zero $y \in \mathbb{C}^{k}$

## 题 3

^yau-2023-final-interview-individual-individual-acm-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2023-final-interview-individual-individual-acm-solutions.md#^yau-2023-final-interview-individual-individual-acm-s3)。

Consider a system of two ODEs of the form

$$
{\frac{dx}{dt}} = f(x, y), \quad{\frac{dy}{dt}} = g(x, y).
$$

Suppose that it is more computationally expensive to evaluate $g$ than to evaluate $f.$

(a) Prove that the multi-rate explicit Euler method defined by

$$
\begin{array}{c} x_{j + 1 / 2} = x_{j} + \frac{k}{2} f(x_{j}, y_{j}), \\ x_{j + 1} = x_{j + 1 / 2} + \frac{k}{2} f(x_{j + 1 / 2}, y_{j}), \\ y_{j + 1} = y_{j} + kg(x_{j}, y_{j}), \end{array}
$$

is locally second order, where k is the time step.

(b) Consider applying the method from (a) to the following linear problem:

$$
{\frac{dx}{dt}} = - x + y, \quad{\frac{dy}{dt}} = - y.
$$

Under what conditions on the time step k will the discrete solution remain stable, i.e., as $j \to \infty$ , both $x_{j} \to 0$ and $y_{j} \to 0$ for any initial conditions?

## 题 4

^yau-2023-final-interview-individual-individual-acm-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2023-final-interview-individual-individual-acm-solutions.md#^yau-2023-final-interview-individual-individual-acm-s4)。

For the advection equation $u_{t} + au_{x} = 0$ with $a > 0,$ , consider the five-point stencil:

$$
u_{j}^{n + 1} = \frac{1}{2}(u_{j - 1}^{n} + u_{j + 1}^{n}) + \frac{ak}{12h}(u_{j + 2}^{n} - 8u_{j + 1}^{n} + 8u_{j - 1}^{n} - u_{j - 2}^{n}).
$$

(a) Recall that the CFL condition for a scheme is when the numerical domain of dependence contains the analytic domain of dependence. It is a necessary condition for stability but not suficient. Write down the CFL condition for this scheme.

(b) Write down its amplification factor $g(\omega)$ . Recall that the von Neumann stability Condition for a scheme is the condition on $a, k, h$ such that $| g(\omega) | < 1 + Kk$ for all admissible ω, h, k. It is a necessary and suficient condition for stability. In this case, we see $| g(\omega) |$ depends on k through $\lambda = k / h$ , so the criterion reduced to $| g(\omega) | \le 1$ for all admissible $\omega, k, h$ . Find out the von Neumann condition for this scheme. How does that compare with the CFL condition?

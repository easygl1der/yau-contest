# 2019 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2019-final-interview-individual-applmath-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2019-final-interview-individual-applmath-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## PROBLEMS FOR PERSONAL CONTEST

## CHOOSE ANY 3 OUT OF 5

## 题 1

^yau-2019-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md#^yau-2019-final-interview-individual-applmath-individual-s1)。

Show that if

$$
C = \left[\begin{array}{ccccc} 0 & 0 & \dots & 0 & - c_{0} \\ 1 & 0 & \dots & 0 & - c_{1} \\ 0 & 1 & \dots & 0 & - c_{2} \\ \vdots & \vdots & \ddots & \ddots & \vdots \\ 0 & 0 & \dots & 1 & - c_{n - 1} \end{array} \right]
$$

is a companion matrix with distinct eigenvalues $\lambda_{1},..., \lambda_{n}$ , then

$$
VCV^{- 1} = \operatorname{diag}(\lambda_{1}, \dots, \lambda_{n})
$$

where

$$
V = \left[\begin{array}{cccc} 1 & \lambda_{1} & \dots & \lambda_{1}^{n - 1} \\ 1 & \lambda_{2} & \dots & \lambda_{2}^{n - 1} \\ \vdots & \vdots & \ddots & \vdots \\ 1 & \lambda_{n} & \dots & \lambda_{n}^{n - 1} \end{array} \right].
$$

## 题 2

^yau-2019-final-interview-individual-applmath-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md#^yau-2019-final-interview-individual-applmath-individual-s2)。

Prove the following error estimate for the Simpson’s rule:

$$
\int_{a}^{b} f(x) dx - \frac{b - a}{6} \left(f(a) + 4f \left(\frac{a + b}{2}\right) + f(b)\right) = - \left(\frac{b - a}{2}\right)^{5} \frac{f^{(4)}(\xi)}{90}
$$

where $a < \xi < b$

## 题 3

^yau-2019-final-interview-individual-applmath-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md#^yau-2019-final-interview-individual-applmath-individual-s3)。

Consider the fixed point iteration method to solve nonlinear equation $f(x) = 0$

$$
x_{n + 1} = g(x_{n}).\tag{1}
$$

a. State the necessary conditions for existence and uniqueness of a fixed-point $x = \alpha$ in (1), and derive the criteria that determines the order of convergence.

b. Consider instead the fixed-point iteration

$$
x_{n + 1} = G(x_{n}) = x_{n} - \frac{(g(x_{n}) - x_{n})^{2}}{g(g(x_{n})) - 2g(x_{n}) + x_{n}}.
$$

Show that if α is a fixed-point of $g(x)$ , then it is also a fixed point of $G(x)$

## 题 4

^yau-2019-final-interview-individual-applmath-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md#^yau-2019-final-interview-individual-applmath-individual-s4)。

Consider the following parabolic equation

$$
{\frac{\partial u}{\partial t}} = a{\frac{\partial^{2} u}{\partial x^{2}}}
$$

where $a \ > \0$ is a constant. Consider the following finite diference scheme

$$
\begin{array}{l} \frac{1}{12} \frac{v_{m + 1}^{n + 1} - v_{m + 1}^{n}}{k} + \frac{5}{6} \frac{v_{m}^{n + 1} - v_{m}^{n}}{k} + \frac{1}{12} \frac{v_{m - 1}^{n + 1} - v_{m - 1}^{n}}{k} \\ = a \frac{(\delta^{2} v)_{m}^{n + 1} +(\delta^{2} v)_{m}^{n}}{2} \end{array}
$$

where $\delta^{2}$ is the standard central diference operator in space, namely,

$$
(\delta^{2} v)_{m}^{n} = \frac{v_{m + 1}^{n} - 2v_{m}^{n} + v_{m - 1}^{n}}{h^{2}}
$$

and $k, h > 0$ are the time step size and the mesh size respectively. It is known that the scheme is second order in time and fourth order in space.

How to modify the above scheme for the equation

$$
\frac{\partial u}{\partial t} = \sigma(x) \frac{\partial^{2} u}{\partial x^{2}}
$$

where $\sigma(x) \geq \sigma_{0} > 0$ , so that the resulting scheme is still second order in time and fourth order in space?

## 题 5

^yau-2019-final-interview-individual-applmath-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2019-final-interview-individual-applmath-individual-solutions.md#^yau-2019-final-interview-individual-applmath-individual-s5)。

Let A and B be $n \times n$ matrices, A non-singular. Consider solving the linear system of equations

$$
\begin{array}{rcl} A \mathbf{x}_{1} + B \mathbf{x}_{2} & = & \mathbf{b}_{1} \\ B \mathbf{x}_{1} + A \mathbf{x}_{2} & = & \mathbf{b}_{2} \end{array}
$$

where $\mathbf{x}_{1}, \mathbf{x}_{2}, \mathbf{b}_{1}, \mathbf{b}_{2} \ \in \ \mathbb{R}^{n}$ . Find the necessary and suficient condition(s) for the convergence of the iterative method

$$
\begin{array}{rcl}{A \mathbf{x}_{1}^{k + 1}} & = &{\mathbf{b}_{1} - B \mathbf{x}_{2}^{k}} \\{A \mathbf{x}_{2}^{k + 1}} & = &{\mathbf{b}_{2} - B \mathbf{x}_{1}^{k}} \end{array}
$$

for some initial guess ${\bf x}_{1}^{0}$ and ${\bf x}_{2}^{0}$ .

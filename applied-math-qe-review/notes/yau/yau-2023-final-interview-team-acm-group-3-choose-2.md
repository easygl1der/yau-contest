# 2023 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2023-final-interview-team-acm-group-3-choose-2.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2023-final-interview-team-acm-group-3-choose-2/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2023-final-interview-team-acm-group-3-choose-2-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Problem 1: LU factorization

Let $A \in \mathbb{R}^{n}$ be a real tridiagonal matrix

$$
A = \left[\begin{array}{ccccc} \alpha_{1} & \gamma_{2} & & & \\ \beta_{1} & \alpha_{2} & \gamma_{3} & & \\ & \beta_{2} & \alpha_{3} & \ddots & \\ & & \ddots & \ddots & \gamma_{n} \\ & & & \beta_{n - 1} & \alpha_{n} \end{array} \right].
$$

Consider applying the LU factorization with partial pivoting to this A to get $LU = PA$ . The algorithm (“Algorithm 3”) proceeds as follows, where L and U are stored in the lower and upper parts of A respectively:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 3: LU decomposition with partial pivoting

## 题 1

^yau-2023-final-interview-team-acm-group-3-choose-2-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2023-final-interview-team-acm-group-3-choose-2-solutions.md#^yau-2023-final-interview-team-acm-group-3-choose-2-s1)。

for  $k = 1, \ldots, n - 1$  do

## 题 2

^yau-2023-final-interview-team-acm-group-3-choose-2-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2023-final-interview-team-acm-group-3-choose-2-solutions.md#^yau-2023-final-interview-team-acm-group-3-choose-2-s2)。

Find the smallest index L such that  $|A(l, k)| = \max_{k \leq i \leq n} |A(i, k)|$ ;

## 题 3

^yau-2023-final-interview-team-acm-group-3-choose-2-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2023-final-interview-team-acm-group-3-choose-2-solutions.md#^yau-2023-final-interview-team-acm-group-3-choose-2-s3)。

Swap  $A(k, 1 : n)$  and  $A(l, 1 : n)$  and record the pair  $(k, l)$ ;

## 题 4

^yau-2023-final-interview-team-acm-group-3-choose-2-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2023-final-interview-team-acm-group-3-choose-2-solutions.md#^yau-2023-final-interview-team-acm-group-3-choose-2-s4)。

for  $i = k + 1, \ldots, n$  do
5  $A(i, k) = A(i, k)/A(k, k)$ ;
6  $A(i, k + 1 : n) = A(i, k + 1 : n) - A(i, k) * A(k, k + 1 : n)$
</div>

(i). Let $a^{*} = \operatorname{max}_{i, j} | a_{ij} |$ . Show that $| u_{ii} | \le 2a^{*}$ , ∀i, and $| \boldsymbol{u}_{ij} | \le a^{*}, \ \forall j > i$ . Then conclude that the growth factor $\begin{array}{r}{\rho = \frac{\operatorname{max}_{i, j} | u_{ij} |}{\operatorname{max}_{i, j} | a_{ij} |} \leq 2} \end{array}$

(ii). Assume that $| \alpha_{1} | \geq | \beta_{1} |, | \alpha_{n} | \geq | \gamma_{n} |$ , and $| \alpha_{i} | \geq | \beta_{i} | + | \gamma_{i} |, i = 2, \cdots, n - 1$ , i.e., A is column diagonally dominant. Show that the LU factorization with or without partial pivoting are step-wise equivalent for A. In other words, for the algorithm with partial pivoting, no actual pivoting happens throughout the process.

## Problem 2: Deformation to Legendre transform

Given a strictly convex function $f : \mathbb{R}^{n} \mathbb{R}$ that is at least twice diferentiable, its Legendre transform $f^{*} : \mathbb{R}^{n} \mathbb{R}$ is defined as

$$
f^{*}(u) = \sup_{x} \left\{\langle x, u \rangle - f(x) \right\},
$$

where $x \in \mathbb{R}^{n}, u \in \mathbb{R}^{n}$ and $\langle x, u \rangle$ is the bilinear form. Recall that $\nabla f$ and $\nabla f^{*}$ are inverse functions of each other, and that Hessf and $Hessf^{*}$ are inverse matrices of each other. Here $\nabla f$ and Hessf denote, respectively, the first and second derivative of the function $f \colon$

$$
\nabla f =[\frac{\partial f}{\partial x^{1}}, \dots, \frac{\partial f}{\partial x^{n}}], Hess_{ij} f = \frac{\partial f}{\partial x^{i} \partial x^{j}}.
$$

(i) For any fixed real number λ in an open neighborhood of 0, the λ-deformed Legendre transform of $f$ is defined by

$$
f^{(\lambda)}(u) = \sup_{x} \left\{\frac{1}{\lambda} \log \left(1 + \lambda \langle x, u \rangle\right) - f(x) \right\},
$$

so that lim $_{\cdot \lambda \to 0} f^{(\lambda)}(u) = f^{*}(u)$ . Show that

$$
f(x) + f^{(\lambda)}(u^{(\lambda)}) = \frac{1}{\lambda} \log \left(1 + \lambda \langle x, u^{(\lambda)} \rangle\right),
$$

where

$$
u^{(\lambda)} = \frac{\nabla f(x)}{1 - \lambda \langle x, \nabla f(x) \rangle}.
$$

The righthand side of the above can be called the λ-gradient of $f$

(ii) Define $x^{(\lambda)} \equiv xe^{- \lambda f(x)}$ , and define the function $g^{(\lambda)}$ by

$$
g^{(\lambda)}(x^{(\lambda)}) = \frac{1}{\lambda} \left(1 - e^{- \lambda f(x)}\right).
$$

Show

$$
u^{(\lambda)} = \nabla g^{(\lambda)}(x^{(\lambda)})
$$

by explicitly evaluating the Jacobian of the transform $x \longleftrightarrow x^{(\lambda)}$

(iii) Calculate $(f^{(\lambda)})^{(\lambda)}$ and state whether $(f^{(\lambda)})^{(\lambda)} = f$ holds.

## Problem 3: Numerical PDE

Let $K$ and $\widehat{K}$ be two afine-equivalent bounded open subsets of $\mathbb{R}^{d}$ , that is, there is a bijiective afine mapping $F :{\widehat{K}} \to K$ defined by $F({\widehat{x}}) = B{\widehat{x}} + b,$ , where B is a nonsingular matrix and $b \in \mathbb{R}^{d}$

(i). Let $v(x) \in H^{m}(K)$ and $\widehat{v}(\widehat{x}) = v(F(\widehat{x})) \in H^{m}(\widehat{K})$ . Prove that

$$
| \widehat{v} |_{H^{m}(\widehat{K})} \leq C \| B \|^{m} | \det(B) |^{- \frac{1}{2}} | v |_{H^{m}(K)}
$$

and

$$
| v |_{H^{m}(K)} \leq C \| B^{- 1} \|^{m} | \det(B) |^{\frac{1}{2}} | \widehat{v} |_{H^{m}(\widehat{K})}
$$

where C depends on d and m only. Here $H^{m}(K)$ is the standard Sobolev space.

(ii). Let $h_{K}$ and $h_{\widehat{K}}$ be the diameters of K and $\widehat{K}$ respectively, and let $\rho_{K}$ and $\rho_{\widehat{K}}$ be the diameters of the largest circle inscribed in K and $\widehat{K}$ respectively. Show that

$$
\| B \| \leq \frac{h_{K}}{\rho_{\widehat{K}}}, \quad \| B^{- 1} \| \leq \frac{h_{\widehat{K}}}{\rho_{K}}.
$$

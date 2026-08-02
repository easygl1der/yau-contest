---
title: "Chapter 7 \u2014 Optimization in Relative Scale"
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 7
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 20496
source_line_end: 24285
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 7
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 7 — Optimization in Relative Scale

> [[../README|本书目录]] · [[06-chapter-6-the-primal-dual-model-of-an-objective-function|上一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 20496–24285。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 7。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Chapter 7 Optimization in Relative Scale

In many applications, it is difficult to relate the number of iterations in an optimization scheme with the desired accuracy of the solution since the corresponding inequality contains unknown parameters (Lipschitz constant, distance to the optimum). However, in many cases the required level of relative accuracy is quite understandable. To develop methods which compute solutions with relative accuracy, we need to employ internal structure of the problem. In this chapter, we start from problems of minimizing homogeneous objective functions over a convex set separated from the origin. The availability of the subdifferential of this function at zero provides us with a good metric, which can be used in optimization schemes and in the smoothing technique. If this subdifferential is polyhedral, then the metric can be computed by a cheap preliminary rounding process. We also present a barrier subgradient method, which computes an approximate maximum of a positive convex function with certain relative accuracy. We show how to apply this method to solve problems of fractional covering, maximal concurrent flow, semidefinite relaxation, online optimization, portfolio management, and others. Finally, we consider a class of strictly positive functions, for which a kind of quasi-Newton method is developed.

## 7.1 Homogeneous Models of an Objective Function

(The conic unconstrained minimization problem; The subgradient approximation scheme; Structural optimization; Application examples: Linear Programming, Minimization of the spectral radius; The truss topology design problem.)

## 7.1.1 The Conic Unconstrained Minimization Problem

Quite often, in the theoretical justification of convex optimization methods it is assumed that problems have bounded feasible sets. Besides its technical convenience, this assumption allows us to introduce a reasonable scale for measuring the absolute accuracy of an approximate solution. In the cases when the initial problem does not possess this property, some algorithms require an artificial bounding of the domain (the “big $M^{\prime \prime}$ approach). This approach is, perhaps, acceptable for polynomial-time methods, where the “big $\mathbf{M}^{\prime}$ enters the complexity estimates only inside a logarithm term (see Chap. 5). However, it is clear that for gradient-type methods, such a strategy cannot work.

In fact, this is almost a philosophical question: Do the problems with unbounded feasible sets really arise in practice? And if so, how they should be treated? Actually, there is at least one, very important class of such problems, namely, the problems obtained by Lagrangian relaxations of inequality constraints (see Sects. 1.3.3 and 3.1.7). If there were some reasonable bounds on the dual variables for these constraints, then it would be natural to incorporate them into the primal problem. Then, instead of constraints in the primal problem, we could have an additional term in the objective function.

Another difficulty is related to the way of bounding unbounded feasible sets. It is not always possible to find a reasonable localization set a priori, without collecting additional information on the topology of the problem by some auxiliary computations.

In this chapter, we suggest an alternative way of treating the convex minimization problems. Namely, we are going to compute their approximate solutions in relative scale. We will see that this idea works at least for a special class of conic unconstrained minimization problems.<sup>1</sup> These are the problems of minimizing a positively homogeneous convex function over a convex set, which is separated from the origin. In order to compute an approximate solution to this problem with a certain relative accuracy, we need to know a John ellipsoid for the subdifferential of the objective function evaluated at the origin. We will see that in many cases all necessary information about the objective function can be easily obtained by analyzing its structure.

In what follows, we say that the value $f({\bar{x}})$ approximates the optimal value $f^{*} >$ 0 with relative accuracy δ if

$$
f^{*} \leq f(\bar{x}) \leq(1 + \delta) f^{*}.
$$

In this chapter, it is convenient to use the following notation for the balls in <sup>E</sup> with respect to :

$$
B_{\| \cdot \|}(r) = \{x \in \mathbb{E} : \| x \| \leq r\}.
$$

The notation $\pi_{Q, \| \cdot \|}(x)$ is used for the projection of a point x onto the set $Q$ with respect to the norm $\| \cdot \|$ . For the sake of notation, if no ambiguity arises, the indication of the norm is omitted.

Finally, in the case $\mathbb{E} = \mathbb{R}^{n}, I_{n}$ denotes the unit matrix in $\mathbb{R}^{n}, e_{i}$ denotes the ith coordinate vector, and $\bar{e}_{n}$ stands for the vector of all ones. For an $n \times n$ matrix X we denote by $\lambda_{1}(X), \ldots, \lambda_{n}(X)$ its spectrum of eigenvalues numbered in decreasing order.

The most general form of the optimization problem considered in this section is as follows:

$$
{\mathrm{Find ~}} \quad f^{*} = \operatorname{min}_{x \in Q_{1}} \f(x),\tag{7.1.1}
$$

where f is a convex positively homogeneous function of degree one (see the end of Sect. 3.1.6), and $Q_{1} \subset \mathbb{E}$ is a closed convex set, which does not contain the origin. In many applications, the role of $Q_{1}$ is played by an affine subspace

$$
{\mathcal{L}} = \{x \in \mathbb{E} : Cx = b\},
$$

where $b \in \mathbb{E}_{1}, b \neq 0$ , and $C : \mathbb{E} \mathbb{E}_{1}$ . Without loss of generality, we can assume that C is non-degenerate.

Our main assumption on problem (7.1.1) is that

$$
\begin{array}{r}{\mathrm{dom} \f \equiv \mathbb{E}, \quad 0 \in \mathrm{int} \ \partial f(0).} \end{array}\tag{7.1.2}
$$

In other words, we assume that $f$ is a support function of a convex compact set containing the origin in its interior. Then $f^{*} > 0$ , and the problem of finding an approximate solution to (7.1.1) with a certain relative accuracy becomes well posed. In what follows, we call the setting (7.1.1), (7.1.2) the conic unconstrained minimization problem.

Note that any unconstrained minimization problem

$$
\operatorname{min}_{y \in \mathbb{E}} \phi(y),
$$

with convex objective $\phi(\cdot)$ , can be rewritten in the form (7.1.1) by simple homogenization:

$$
\begin{array}{r}{x =(y, \tau) \in \mathbb{E} \times \mathbb{R}_{+}, \quad f(x) = \tau \phi(y / \tau), \quad Cx \equiv \tau, \quad b = 1} \end{array}
$$

(see Example 3.1.2(6)). However, in general, we cannot guarantee that such a function satisfies assumption (7.1.2).

Let us look at the following examples.

Example 7.1.1 Let our initial problem consist in finding approximately an unconstrained minimum of the function

$$
\phi_{\infty}(y) = \operatorname{max}_{1 \leq i \leq m} | \langle a_{i}, y \rangle + c^{(i)} |, \quad y \in \mathbb{R}^{n - 1}.
$$

Let us introduce $x ={\binom{y}{\tau}}$ , and $\hat{a}_{i} = \left({a_{i} \atop c^{(i)}} \right), i = 1,..., m$ . Let

$$
A^{T} = \left(\widehat{a}_{1} \ldots, \widehat{a}_{m} \right), \quad F_{\infty}(v) = \operatorname{max}_{1 \leq i \leq m} | v^{(i)} |,
$$

$$
p = 1, \quad C =(\underbrace{0, \dots, 0}_{(n - 1) \mathrm{~ times}}, 1), \quad b = 1.
$$

Then for positive τ we can define

$$
f(x) = \tau \phi_{\infty}(y / \tau) \equiv F_{\infty}(Ax), \quad Q_{1} \ = \ \mathcal{L}.
$$

Thus, this description of $f(\cdot)$ can be extended onto the whole space.

In a similar way, for the function

$$
\phi_{1}(y) = \sum_{i = 1}^{m} | \langle a_{i}, y \rangle + c^{(i)} |, \quad y \in \mathbb{R}^{n - 1},
$$

we can get a representation (7.1.1), which satisfies (7.1.2). In this case, we use $f(x) = F_{1}(Ax)$ with

$$
F_{1}(v) = \sum_{i = 1}^{m} | v^{(i)} |.
$$

However, for the function

$$
\phi(y) = \operatorname{max}_{1 \leq i \leq m} \left\{\langle a_{i}, y \rangle + c^{(i)} \right\}, \quad y \in \mathbb{R}^{n - 1},
$$

the above lifting cannot guarantee (7.1.2).

Let us fix some norm $\| \cdot \|$ in $\mathbb{E},$ and define the dual norm in the standard way:

$$
\| g \|^{*} = \operatorname{max}_{\| x \| \leq 1} \langle s, x \rangle, \quad g \in \mathbb{E}^{*}.\tag{7.1.3}
$$

Then we can rewrite our main assumption (7.1.2) in a quantitative form. Let $\gamma_{0} \leq \gamma_{1}$ be some positive values satisfying the following asphericity condition:

$$
B_{\parallel \cdot \parallel^{*}}(\gamma_{0}) \subseteq \partial f(0) \subseteq B_{\parallel \cdot \parallel^{*}}(\gamma_{1}).\tag{7.1.4}
$$

Thus, by (7.1.2) we just assume that such values are well defined. Note that these values depend on the choice of the norm $\| \cdot \|$ . In the sequel, this choice will always be evident from the context.

Denote by

$$
\begin{array}{r}{\alpha = \frac{\gamma_{0}}{\gamma_{1}} < 1,} \end{array}
$$

the asphericity coefficient of the function $f.$ . As we will see later, this parameter is crucial for complexity bounds of finding approximate solutions to problem (7.1.1) with a certain relative accuracy.

Note that in many situations it is reasonable to choose $\| \cdot \|$ as an ellipsoidal norm. In view of John’s theorem, for a good variant of this norm we can guarantee that

$$
\textstyle \alpha \geq{\frac{1}{n}},\tag{7.1.5}
$$

where $n = \dim$ <sup>E</sup>. Moreover, if $\partial f(0)$ is symmetric:

$$
f(x) = f(- x) \quad \forall x \in \mathbb{E},
$$

then the lower bound for ellipsoidal norms is even better:

$$
\begin{array}{r}{\alpha \geq \frac{1}{\sqrt{n}}.} \end{array}\tag{7.1.6}
$$

(We will prove both variants of John’s Theorem in Sect. 7.2.) Of course, it may be difficult to find a norm which is good for a particular objective function $f$ . However, in this case we can try to employ our knowledge of its structure.

For example, it may happen that we know a self-concordant barrier $\psi(\cdot)$ for the convex set $\partial f(0)$ (see Sect. 5.3), and $\nabla \psi(0) = 0$ . Then we can use

$$
\| v \|^{*} = \langle v, \nabla^{2} \psi(0) v \rangle^{1 / 2}, \quad \| x \| = \langle[\nabla^{2} \psi(0)]^{- 1} x, x \rangle^{1 / 2}.
$$

In this case, it is possible to choose

$$
\gamma_{0} = 1, \quad \gamma_{1} = \nu + 2 \sqrt \nu,
$$

where ν is the parameter of the barrier $\psi(\cdot)$ (see Theorem 5.3.9).

For some important problems the subdifferential $\partial f(0)$ is a polyhedral set. Then the following result may be useful.

Lemma 7.1.1 Let $f(x) = \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle, x \in \mathbb{R}^{n}$ . Assume that the matrix

$$
A =(a_{1}, \ldots, a_{m})
$$

has full row rank and $\sum_{i = 1}^{m} a_{i} = 0(thus, m > n)$ . Then the norm

$$
\| x \| = \left[\sum_{i = 1}^{m} \langle a_{i}, x \rangle^{2} \right]^{1 / 2}
$$

is well defined . We can choose $\gamma_{1} = 1$ and $\begin{array}{r}{\gamma_{0} = \frac{1}{\sqrt{m(m - 1)}}} \end{array}$

Proof Note that the matrix $G = \sum_{i = 1}^{m} a_{i} a_{i}^{T}$ is non-degenerate. Then

$$
\| v \|^{*} = \langle v, G^{- 1} v \rangle^{1 / 2}
$$

(see Lemma 3.1.20), and therefore for any $i = 1, \ldots, m$ we have

$$
\begin{array}{rlr}{{(\| a_{i} \|^{*})^{2} = \langle a_{i}, G^{- 1} a_{i} \rangle = \underset{x \in \mathbb{R}^{n}}{\operatorname{max}} \{2 \langle a_{i}, x \rangle - \langle Gx, x \rangle\}}} \\ &{} & \\ &{} &{= \underset{x \in \mathbb{R}^{n}}{\operatorname{max}} \{2 \langle a_{i}, x \rangle - \underset{k = 1}{\overset{m}{\sum}} \langle a_{k}, x \rangle^{2}\}} \\ &{} & \\ &{} &{\leq \underset{x \in \mathbb{R}^{n}}{\operatorname{max}} \{2 \langle a_{i}, x \rangle - \langle a_{i}, x \rangle^{2}\} = 1.} \end{array}
$$

Since $\partial f(0) = \mathrm{Conv} \ \{a_{i}, \i = 1, \dots, m\}$ , we can take $\gamma_{1} = 1$

On the other hand, for any $x \in \mathbb{R}^{n}$ we have $\sum_{i = 1}^{m} \langle a_{i}, x \rangle = 0$ . Therefore,

$$
\begin{array}{l}{\displaystyle \langle Gx, x \rangle = \sum_{i = 1}^{m} \langle a_{i}, x \rangle^{2}} \\{\displaystyle \qquad \le \underset{s \in \mathbb{R}^{m}}{\operatorname{max}} \left\{\sum_{i = 1}^{m}(s^{(i)})^{2} \colon \sum_{i = 1}^{m} s^{(i)} = 0, \s^{(i)} \le f(x), \i = 1, \ldots, m \right\}.} \end{array}
$$

In view of Corollary 3.1.2, the extremum in the above maximization problem is attained, for example, at

$$
{\hat{s}} = f(x) \cdot({\bar{e}}_{m} - me_{1}).
$$

This means that $\langle Gx, x \rangle \leq m(m - 1) f^{2}(x)$ . Hence, $\begin{array}{r}{f(x) \ge \frac{\| x \|}{\sqrt{m(m - 1)}}} \end{array}$ . In view of representation (3.1.41), this justifies the choice $\begin{array}{r}{\gamma_{0} = \frac{1}{\sqrt{m(m - 1)}}} \end{array}$ □

The possibility of employing another structural representation of problem (7.1.1) is discussed in Sect. 7.1.3.

Let us conclude this section with a statement which supports our ability to solve problem (7.1.1) with a certain relative accuracy.

Denote by x the projection of the origin onto the set $Q_{1}$ with respect to the norm $\| \cdot \|^{2}$

$$
\| x_{0} \| = \operatorname{min}_{x \in Q_{1}} \ \| x \|.
$$

## Theorem 7.1.1

1. For any $x \in \mathbb{R}^{n}$ , we have

$$
\gamma_{0} \cdot \| x \| \leq f(x) \ \leq \ \gamma_{1} \cdot \| x \|.\tag{7.1.7}
$$

Therefore the function f is Lipschitz continuous on <sup>E</sup> in the norm $\| \cdot \|$ with Lipschitz constant γ . Moreover,

$$
\alpha f(x_{0}) \leq \gamma_{0} \cdot \| x_{0} \| \ \leq \f^{*} \ \leq \f(x_{0}) \ \leq \ \gamma_{1} \cdot \| x_{0} \|.\tag{7.1.8}
$$

2. For any optimal solution $x^{*} to \left(7.{l.{l}} \right)$ , we have

$$
\begin{array}{r}{\| x_{0} - x^{*} \| \leq \frac{2}{\gamma_{0}} f^{*} \leq \frac{2}{\gamma_{0}} f(x_{0}).} \end{array}\tag{7.1.9}
$$

If the norm $\| \cdot \|$ is Euclidean, then this inequality can be strengthened as follows:

$$
\begin{array}{r}{\| x_{0} - x^{*} \| \leq \frac{1}{\gamma_{0}} f^{*} \leq \frac{1}{\gamma_{0}} f(x_{0}).} \end{array}\tag{7.1.10}
$$

Proof For any $x \in \mathbb{E}$ , we have

$$
f(x) \overset{(3.\underline{{1}}.41)}{=} \operatorname{max}_{v} \{\langle v, x \rangle : v \in \partial f(0)\} \geq \operatorname{max}_{v} \{\langle v, x \rangle : v \in B_{\| \cdot \|^{*}}(\gamma_{0})\} = \gamma_{0} \| x \|,
$$

$$
f(x) \overset{(3.\underline{{1}}.41)}{=} \operatorname{max}_{v} \{\langle v, x \rangle : v \in \partial f(0)\} \ \leq \ \operatorname{max}_{v} \{\langle v, x \rangle : v \in B_{\| \cdot \|^{*}}(\gamma_{1})\} \ = \ \gamma_{1} \| x \|.
$$

Therefore, for any x and $h \in \mathbb{E}$ , we have

$$
f(x + h) \leq f(x) + f(h) \leq f(x) + \gamma_{1} \| h \|.
$$

Moreover,

$$
f^{*} = \underset{x \in Q_{1}}{\mathrm{min}} \f(x) \ \ge \ \underset{x \in Q_{1}}{\mathrm{min}} \ \gamma_{0} \| x \| \ = \ \gamma_{0} \| x_{0} \|.
$$

Hence, in view of (7.1.7) we have

$$
f^{*} \geq \gamma_{0} \| x_{0} \| \ \geq \ \alpha f(x_{0}),
$$

$$
f^{*} \leq f(x_{0}) \leq \gamma_{1} \| x_{0} \|.
$$

In order to prove the second statement, note that in view of the first item of the theorem we have

$$
\begin{array}{r}{\| x_{0} - x^{*} \| \leq \| x_{0} \| + \| x^{*} \| \leq \frac{2}{\gamma_{0}} \cdot f^{*}.} \end{array}
$$

For the Euclidean norm $\| x \| ~ = ~ \langle Gx, x \rangle^{1 / 2}$ with $G \ \succ \0$ , this bound can be strengthened. Indeed, in this case $\langle Gx_{0}, x^{*} - x_{0} \rangle \stackrel{(2.2.39)}{\geq} 0$ . Therefore,

$$
\| x_{0} - x^{*} \|^{2} = \| x_{0} \|^{2} - 2 \langle Gx_{0}, x^{*} \rangle + \| x^{*} \|^{2} \ \leq \ \| x^{*} \|^{2} - \| x_{0} \|^{2}
$$

$$
< \| x^{*} \|^{2}.
$$

## 7.1.2 The Subgradient Approximation Scheme

Let us discuss now different possibilities for finding an approximate solution to problem (7.1.1). For the sake of simplicity, we assume that the norm $\| \cdot \|$ is Euclidean.

The first of our schemes is based on the standard Subgradient Method for minimizing non-smooth convex functions. Denote by $g(x)$ an arbitrary subgradient of the function f at point x. Consider the simplest variant of the Subgradient Method as applied to problem (7.1.1).

## Subgradient Method $G_{N}(R)$

for $k : = 0$ to N do: Compute $f(x_{k})$ and $g(x_{k})$

$$
\begin{array}{r}{x_{k + 1} : = \pi_{Q_{1}} \left(x_{k} - \frac{R}{\sqrt{N + 1}} \cdot \frac{g(x_{k})}{\| g(x_{k}) \|^{*}} \right).} \end{array}\tag{7.1.11}
$$

$$
\mathrm{\bf Output :} \quad \bar{x} = \arg \operatorname{min}_{x} \{f(x) : x = x_{0}, \ldots, x_{N}\}.
$$

In what follows, the output of this process ${\bar{x}} \in \mathbb{E}$ is denoted by $G_{N}(R)$ . In view of Theorem 3.2.2, the rate of convergence of this method is as follows:

$$
\begin{array}{r}{f(G_{N}(R)) - f^{*} \le \frac{\gamma_{1}}{\sqrt{N + 1}} \cdot \frac{\| x_{0} - x^{*} \|^{2} + \mathbb{R}^{2}}{2R}.} \end{array}\tag{7.1.12}
$$

Thus, in order to be efficient, the Subgradient Method needs a good estimate for the distance between the starting point x and the solution $x^{*}$ :

$$
R \ \approx \ \| x_{0} - x^{*} \|.
$$

In our case, this estimate could be obtained from the first inequality in (7.1.10). However, since the value $f^{*}$ is not known in advance, we will use the second part of this inequality:

$$
{\hat{\rho}} \{\stackrel{\mathrm{def}}{=}} \{\frac{1}{\gamma_{0}}} f(x_{0}) \ \geq \ \| x_{0} - x^{*} \|.\tag{7.1.13}
$$

The performance of the corresponding scheme is given by the following statement.

Theorem 7.1.2 For a fixed δ from (0, 1), let us choose

$$
\begin{array}{r}{N = \left\lfloor \frac{1}{\alpha^{4} \delta^{2}} \right\rfloor.} \end{array}\tag{7.1.14}
$$

Then $f(G_{N}({\hat{\rho}})) \leq(1 + \delta) \cdot f^{*}.$

Proof In view of inequality (7.1.12), the choice (7.1.14) and inequalities (7.1.10), (7.1.8), we have

$$
\begin{array}{rlr}{f(G_{N}(\hat{\rho})) - f^{*} \le \alpha^{2} \delta \gamma_{1} \cdot \frac{\| x_{0} - x^{*} \|^{2} + \hat{\rho}^{2}}{2 \hat{\rho}} \le \alpha^{2} \delta \gamma_{1} \hat{\rho} = \alpha \delta f(x_{0})} & \\{\quad} &{} \\{\quad} &{\quad \le \delta \cdot f^{*}.} &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \end{array}
$$

Note that we pay a high price for the poor estimate of the initial distance. If we were be able to use the first part of inequality (7.1.10), then the corresponding complexity bound could be much better. Let us show that a better bound for the distance to the optimal solution can be derived from the trivial observation that $f^{*} \leq f(x)$ for any point x from $Q_{1}$

Denote by $\delta \in(0, 1)$ the desired relative accuracy. Let

$$
\begin{array}{r}{\hat{N} = \left\lfloor \frac{e}{\alpha^{2}} \cdot \left(1 + \frac{1}{\delta} \right)^{2} \right\rfloor,} \end{array}
$$

where e is the base of the exponent. Consider the following restarting strategy. Set $\hat{x}_{0} = x_{0}$ , and for $t \geq 1$ iterate

$$
\begin{array}{rl} &{\boxed{\begin{array}{rl} &{\hat{x}_{t} : = G_{\hat{N}} \left(\frac{1}{\gamma_{0}} f(\hat{x}_{t - 1}) \right);} \\ &{\mathbf{if} \f(\hat{x}_{t}) \geq \frac{1}{\sqrt{e}} f(\hat{x}_{t - 1}) \ \mathrm{then} \T : = t \mathbf{and \Stop}.} \end{array}}} \end{array}\tag{7.1.15}
$$

Theorem 7.1.3 The number of points generated by the process (7.1.15) is bounded:

$$
\begin{array}{r}{T \leq 1 + 2 \ln \frac{1}{\alpha}.} \end{array}\tag{7.1.16}
$$

The last generated point satisfies the inequality $f(\hat{x}_{T}) ~ \leq ~(1 + \delta) f^{*}$ . The total number of lower-level gradient steps in the process (7.1.15) does not exceed

$$
\begin{array}{r}{\frac{e}{\alpha^{2}} \cdot \Big(1 + \frac{1}{\delta} \Big)^{2} \cdot \Big(1 + 2 \ln \frac{1}{\alpha} \Big).} \end{array}\tag{7.1.17}
$$

Proof By simple induction, it is easy to prove that at the beginning of stage t in (7.1.15) the following inequality holds:

$$
\begin{array}{r}{\left(\frac{1}{\sqrt{e}} \right)^{t - 1} f(x_{0}) \geq f(\hat{x}_{t - 1}), \quad t \geq 1.} \end{array}
$$

Thus, in view of inequality (7.1.8), at the last stage T of the process we have

$$
\begin{array}{r}{\left(\frac{1}{\sqrt{e}} \right)^{T - 1} f(x_{0}) \geq f(\hat{x}_{T - 1}) \ \geq \f^{*} \ \geq \ \alpha f(x_{0}).} \end{array}
$$

This leads to inequality (7.1.16).

In view of (7.1.10), we have $\begin{array}{r}{| x_{0} - x^{*} \| \leq \frac{1}{\gamma_{0}} f^{*} \leq \frac{1}{\gamma_{0}} f(\hat{x}_{T - 1})} \end{array}$ . Therefore, at the last stage of the process, using (7.1.12) and the termination rule in (7.1.15), we get

$$
\begin{array}{rl} &{f(\hat{x}_{T}) - f^{*} \leq \frac{\gamma_{1}}{\sqrt{\hat{N} + 1}} \cdot \frac{1}{\gamma_{0}} \cdot f(\hat{x}_{T - 1}) \ \leq \ \frac{\sqrt{e}}{\alpha \sqrt{\hat{N} + 1}} \cdot f(\hat{x}_{T})} \\ &{} \\ &{\qquad \leq \frac{\delta}{1 + \delta} \cdot f(\hat{x}_{T}).\qquad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \end{array}
$$

## 7.1.3 Direct Use of the Problem Structure

In Sect. 7.1.2 we have shown that the outer and inner ellipsoidal approximations of the set $\partial f(0)$ are the key ingredients of minimization schemes for computing an approximate solution to problem (7.1.1) in relative scale. However, in order to find an ellipsoidal norm, which is good for our problem, we need to employ its structure somehow. In this section, we introduce a model of problem (7.1.1) which is suitable both for the explicit indication of such a norm and for applying the smoothing technique described in Sect. 6.1. We will see that the efficiency of the latter approach significantly dominates that of the Subgradient Method.

Since the objective function $f$ in problem (7.1.1) is positive homogeneous, the simplest possible structure of such an object could be as follows. Let us assume that the objective function $f$ is a composition of two objects, a linear operator $A(x)$ and a simple nonlinear convex homogeneous function $F$ . In other words, assume that $f(x) = F(A(x))$ ). Let us introduce this object in a formal way. In this section we switch to the notation of Sect. 6.1, choosing $\mathbb{E}_{1} = \mathbb{R}^{n}$ and $\mathbb{E}_{2} = \mathbb{R}^{m}$

Let $Q_{2}$ be a closed bounded convex set in $\mathbb{R}^{m}$ containing the origin in its interior. Define a convex homogeneous function $F$ as follows:

$$
F(v) = \operatorname{max}_{u \in \mathcal{Q}_{2}} \langle v, u \rangle_{\mathbb{R}^{m}}.\tag{7.1.18}
$$

Further, let A be an $m \times n \mathrm{- matrix}$ which has a full column rank (thus, $m \ \geq \n)$ Define the objective function

$$
f(x) = F(Ax), \quad x \in \mathbb{R}^{n}.\tag{7.1.19}
$$

Clearly, $f$ is a convex function with degree of homogeneity one. Our problem of interest is still (7.1.1), which we repeat for convenience here:

$$
{\mathrm{Find ~}} f^{*} = \operatorname{min}_{x \in{\mathcal{Q}}_{1}} \f(x).\tag{7.1.20}
$$

Since $\partial{\cal F}(0) \equiv Q_{2}$ , we have $\partial f(0) = A^{T} Q_{2}$ (see Lemma 3.1.11). Thus, problem (7.1.20) satisfies the main assumption (7.1.2).

Let $\| \cdot \|_{\mathbb{R}^{m}}$ denote the standard Euclidean norm in $\mathbb{R}^{m}$ :

$$
\| u \|_{\mathbb{R}^{m}} = \left[\sum_{i = 1}^{m} \left(u^{(i)} \right)^{2} \right]^{1 / 2}, \quad u \in \mathbb{R}^{m}.
$$

Let us introduce the following characteristics of the function $F \colon$

$$
\gamma_{0}(F) = \operatorname{max}_{r > 0} \{r : \B_{\parallel \cdot \parallel_{| \mathbb{R}^{m}}}(r) \subseteq \partial F(0)\},
$$

$$
\gamma_{1}(F) = \operatorname{min}_{r > 0} \{r : ~ B_{\parallel \cdot \parallel_{\mathbb{R}^{m}}}(r) \supseteq \partial F(0)\},
$$

$$
\begin{array}{r}{\alpha(F) = \frac{\gamma_{1}(F)}{\gamma_{0}(F)} \geq 1.} \end{array}
$$

For the sets from Example 7.1.1, these values are as follows:

$$
\begin{array}{r}{\gamma_{0}(F_{1}) = \frac{1}{\sqrt{m}}, \gamma_{1}(F_{1}) = 1, \alpha(F_{1}) = \sqrt{m},} \end{array}\tag{7.1.21}
$$

$$
\gamma_{0}(F_{\infty}) = 1, \gamma_{1}(F_{\infty}) = \sqrt{m}, \alpha(F_{\infty}) = \sqrt{m}.
$$

Let us define now the following Euclidean norm in the primal space:

$$
\| x \|_{\mathbb{R}^{n}} = \| Ax \|_{\mathbb{R}^{m}}^{*}, \quad x \in \mathbb{R}^{n}.\tag{7.1.22}
$$

Since A is non-degenerate, this norm is well defined. Defining $G = A^{T} A \succ 0$ , we get the following representations:

$$
\| x \|_{\mathbb{R}^{n}} = \langle Gx, x \rangle^{1 / 2} = \left[\sum_{i = 1}^{m} \langle a_{i}, x \rangle^{2} \right]^{1 / 2},\tag{7.1.23}
$$

$$
\| g \|_{\mathbb{R}^{n}}^{*} = \langle g, G^{- 1} g \rangle^{1 / 2},
$$

where $a_{i}, i = 1, \ldots, m$ , denote the columns of the matrix $A^{T}$

Lemma 7.1.2 For norm $\| \cdot \|_{\mathbb{R}^{n}}$ , condition (7.1.4) holds with

$$
\gamma_{0} = \gamma_{0}(F), \quad \gamma_{1} = \gamma_{1}(F).
$$

Thus, we can take $\begin{array}{r}{\alpha = \alpha(F) = \frac{\gamma_{0}(F)}{\gamma_{1}(F)}} \end{array}$

Proof Since $\partial f(0) = A^{T} Q_{2}$ , we have the following representation for the support function of this set:

$$
\xi(x) \overset{\mathrm{def}}{=} \operatorname{max}_{s \in \partial f(0)} \langle s, x \rangle_{\mathbb{R}^{n}} = \operatorname{max}_{u \in Q_{2}} \langle A^{T} u, x \rangle_{\mathbb{R}^{m}} = \operatorname{max}_{u \in Q_{2}} \langle Ax, u \rangle_{\mathbb{R}^{m}}.
$$

Thus,

$$
\xi(x) \leq \operatorname{max}_{\| u \|_{2} \leq \gamma_{1}(F)} \langle Ax, u \rangle_{{\mathbb{R}}^{m}} = \gamma_{1}(F) \| Ax \|_{{\mathbb{R}}^{m}}^{*} = \gamma_{1}(F) \| x \|_{{\mathbb{R}}^{n}},
$$

$$
\xi(x) \geq \operatorname{max}_{\| u \|_{\mathbb{R}^{m}} \leq \gamma_{0}(F)} \langle Ax, u \rangle_{\mathbb{R}^{m}} = \gamma_{0}(F) \| Ax \|_{\mathbb{R}^{m}}^{*} = \gamma_{0}(F) \| x \|_{\mathbb{R}^{n}}.
$$

Hence, in view of Corollary 3.1.5, $\begin{array}{rcl}{\partial f(0)} &{\subseteq} &{{\cal B}_{\| \cdot \|_{1}^{*}}(\gamma_{1}(F))} \end{array}$ , and $\partial f(0) \quad \supseteq$ $B_{\| \cdot \|_{1}^{*}}(\gamma_{0}(F))$ .

Note that for many simple sets $Q_{2}$ , parameters $\gamma_{1}(F)$ and $\gamma_{0}(F)$ are easily available (see, for example, (7.1.21)). Therefore, metric (7.1.23) can be used to find an approximate solution to the corresponding problems by the Subgradient

Method (7.1.15). However, the main advantage of representation (7.1.19) is related to the possibility of employing the smoothing technique of Sect. 6.1. Let us show how this can be done.

Problem (7.1.20) differs from problem (6.1.10) only in one aspect: it can have an unbounded primal feasible set. Thus, a straightforward application of the efficient smoothing technique to (7.1.20) is impossible. However, we can introduce an artificial bound on the size of the optimal solution using the information provided by inequality (7.1.10). Define

$$
\mathcal Q_{1}(\rho) = \{x \in Q_{1} : \| x - x_{0} \|_{\mathbb \mathbb{R}^{n}} \leq \rho\}.
$$

In view of (7.1.10), we have $x^{*} \in \Q_{1}({\hat{\rho}})$ for $\begin{array}{r}{\hat{\rho} ~ = ~ \frac{1}{\gamma_{0}(F)} f(x_{0})} \end{array}$ . Thus, problem (7.1.20) is equivalent to the following:

$$
\begin{array}{lll}{\mathrm{Find ~} f^{*}} &{=} &{\displaystyle \operatorname{min}_{x \in \mathbb{R}^{n}} \{f(x) : \x \in Q_{1}(\hat{\rho})\}} \\ &{=} &{\displaystyle \operatorname{min}_{x \in Q_{1}(\hat{\rho})} \operatorname{max}_{u \in Q_{2}} \langle Ax, u \rangle_{\mathbb{R}^{m}}} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad(6.\underbrace{1.34}_{u \in \mathbb{R}^{m}}) \operatorname{max} \{\phi_{\hat{\rho}}(u) : \u \in Q_{2}\},} \end{array}\tag{7.1.24}
$$

where $\phi_{\rho}(u) = \operatorname{min}_{x \in{\mathcal{Q}}_{1}(\rho)} \langle Ax, u \rangle_{\mathbb{R}^{m}}$ . Thus, we have managed to represent our problem in the form required by Sect. 6.1.

Let us introduce the objects necessary for applying the smoothing technique. In the primal space, we choose the prox-function $\begin{array}{r}{d_{1}(x) = \frac{1}{2} \| x - x_{0} \|_{\mathbb{R}^{n}}^{2}} \end{array}$ . This function has convexity parameter equal to one. Its maximum on the feasible set $Q_{1}(\hat{\rho})$ does not exceed $\begin{array}{r}{\dot{D}_{1} = \frac{1}{2} \hat{\rho}^{2}} \end{array}$

Similarly, for the dual feasible set, we choose $\begin{array}{r}{d_{2}(u) \ = \ \frac{1}{2} \| u \|_{\mathbb{R}^{m}}^{2}} \end{array}$ . Then its convexity parameter is one, and the maximum of this function on the dual feasible set $Q_{2}$ is smaller than $\begin{array}{r}{D_{2} = \frac 12 \gamma_{1}^{2}(F)} \end{array}$ . It remains to note that

$$
\begin{array}{rcl}{\| A \|_{1, 2}} &{=} &{\displaystyle \operatorname{max}_{x, u} \{\langle Ax, u \rangle_{\mathbb{R}^{m}} : \| x \|_{\mathbb{R}^{n}} \leq 1, \| u \|_{\mathbb{R}^{m}} \leq 1\}} \\ &{} & \\ &{=} &{\displaystyle \operatorname{max}_{x} \{\| Ax \|_{\mathbb{R}^{m}}^{*} : \| x \|_{\mathbb{R}^{n}} \leq 1\}} \\ &{} & \\ &{(\mathcal{T}_{\underline{{{\bf \Pi}}}, \underline{{{\bf 1}}}, 2^{2}}) \operatorname{max} \{\| x \|_{\mathbb{R}^{n}} : \ \| x \|_{\mathbb{R}^{n}} \leq 1\} = 1.} \end{array}\tag{7.1.25}
$$

For the reader’s convenience we present here the algorithm (6.1.19) adopted for our needs. This method is applied to a smooth approximation of the objective function $f \colon$

$$
f_{\mu}(x) = \operatorname{max}_{u \in Q_{2}} \{\langle Ax, u \rangle_{\mathbb{R}^{m}} - \mu d_{2}(u)\}, \quad x \in \mathbb{R}^{n}.\tag{7.1.26}
$$

In view of Theorem 6.1.1, this function has Lipschitz continuous gradient

$$
\nabla f_{\mu}(x) = A^{T} u_{\mu}(x),
$$

where $u_{\mu}(x)$ is a unique solution to the optimization problem in (7.1.26). In view of equality (7.1.25), the Lipschitz constant for the gradient is equal to $\textstyle{\frac{1}{\mu}}$

Method $S_{N}(R)$   
Set $\begin{array}{r}{\mu = \frac{2R}{\gamma_{1}(F) \cdot \sqrt{N(N + 1)}}} \end{array}$ and $v_{0} = x_{0}.$   
for $k : = 0$ to N 1 do   
$\begin{array}{r}{y_{k} = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k},} \end{array}$   
$\begin{array}{r}{u_{\mu}(y_{k}) = \mathop{\arg \operatorname{max}}_{u \in \mathcal{Q}_{2}} \{\langle Ay_{k}, u \rangle_{\mathbb{R}^{m}} - \frac{\mu}{2} \| u \|_{\mathbb{R}^{m}}^{2}\},} \end{array}$   
$v_{k + 1} = \arg \operatorname{min}_{x \in \mathcal{Q}_{1}(R)} \{\frac{1}{2 \mu} \| x - x_{0} \|_{\mathbb{R}^{n}}^{2} + \langle Ax, \sum_{i = 0}^{k} \frac{i + 1}{2} u_{\mu}(y_{i}) \rangle_{\mathbb{R}^{m}}\} \Re^{m}{~, ~}$   
$\begin{array}{r}{x_{k + 1} = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k + 1}.} \end{array}$   
Output: $\bar{x} : = x_{N}.$

(7.1.27)

In what follows, we denote the output $\bar{x} \in \mathbb{R}^{n}$ of this process by $S_{N}(R)$ . It is easy to check that all conditions of Theorem 6.1.3 are satisfied. Thus, if $\| x_{0} - x^{*} \|_{\mathbb{R}^{n}} \leq R$ then the output of this process satisfies inequality

$$
\begin{array}{r}{f(S_{N}(R)) - f^{*} \leq \frac{2 \gamma_{1}(F) R}{\sqrt{N(N + 1)}}.} \end{array}\tag{7.1.28}
$$

This observation has an important corollary.

Theorem 7.1.4 For $\delta \in(0, 1)$ , let

$$
\begin{array}{r}{N = \left\lfloor \frac{2}{\alpha^{2}(F) \delta} \right\rfloor.} \end{array}\tag{7.1.29}
$$

Then $\begin{array}{r}{f \left(S_{N} \left(\frac{1}{\gamma_{0}(F)} f(x_{0}) \right) \right) \leq(1 + \delta) f^{*}.} \end{array}$

Proof Since $\begin{array}{r}{\| x_{0} - x^{*} \|_{\mathbb{R}^{n}} \overset{(7.1.10)}{\leq} \frac{1}{\gamma_{0}(F)} f(x_{0})} \end{array}$ , and ${\cal N} + 1 \stackrel{(7.1.29)}{\geq} \frac{2}{\alpha^{2}({\cal F}) \delta}$ , from (7.1.28) and (7.1.8) we have

$$
f(S_{N}(R)) - f^{*} \le \delta \cdot \alpha(F) f(x_{0}) \le \delta \cdot f^{*}.\qquad \Pi
$$

Note that the complexity bound (7.1.29) of the scheme (7.1.27) is lower even than the bound of the Subgradient Method (7.1.15) with a recursively updated estimate for the distance to the optimum. Let us show that a similar updating strategy can also accelerate scheme (7.1.27).

Let $\delta \in(0, 1)$ be the desired relative accuracy. Let

$$
\begin{array}{r}{\tilde{N} = \left\lfloor \frac{2e}{\alpha(F)} \cdot \left(1 + \frac{1}{\delta} \right) \right\rfloor.} \end{array}
$$

Consider the following restarting strategy. Set $\hat{x}_{0} = x_{0}$ . For $t \geq 1$ iterate

$$
\begin{array}{rl} &{\widehat{x}_{t} : = S_{\tilde{N}} \left(\frac{1}{\gamma_{0}(F)} f(\widehat{x}_{t - 1}) \right);} \\ &{\mathbf{if} \f(\widehat{x}_{t}) \geq \frac{1}{e} f(\widehat{x}_{t - 1}) \mathbf{then} \T : = t \mathbf{and} \ \mathrm{Stop}.} \end{array}\tag{7.1.30}
$$

Theorem 7.1.5 The number of points T generated by scheme (7.1.30) is bounded as follows:

$$
\begin{array}{r}{T \leq 1 + \ln{\frac{1}{\alpha(F)}}.} \end{array}\tag{7.1.31}
$$

The last generated point satisfies inequality $f(\hat{x}_{T}) \leq(1 + \delta) f^{*}$ . The total number of lower-level steps in the process (7.1.30) does not exceed

$$
\begin{array}{r}{\frac{2e}{\alpha(F)} \cdot \left(1 + \frac{1}{\delta} \right) \cdot \left(1 + \ln \frac{1}{\alpha(F)} \right).} \end{array}\tag{7.1.32}
$$

Proof By simple induction it is easy to prove that at the beginning of stage t the following inequality holds:

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{t - 1} f(x_{0}) \geq f(\hat{x}_{t - 1}), \quad t \geq 1.} \end{array}
$$

Thus, in view of Item 1 of Theorem 7.1.1, at the last stage T of the process we have

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{T - 1} f(x_{0}) \geq f(\hat{x}_{T - 1}) \geq f^{*} \geq \alpha(F) f(x_{0}).} \end{array}
$$

This leads to inequality (7.1.31).

Note that $\begin{array}{r}{\| x_{0} - x^{*} \| \le \frac{1}{\gamma_{0}(F)} f^{*} \le \frac{1}{\gamma_{0}(F)} f(\hat{x}_{T - 1})} \end{array}$ . Therefore, at the last stage of the process in view of inequality (7.1.28) and the termination rule in (7.1.30) we have

$$
\begin{array}{rlr}{f(\hat{x}_{T}) - f^{*} \le \frac{2 \gamma_{1}(F)}{\tilde{N} + 1} \cdot \frac{1}{\gamma_{0}(F)} \cdot f(\hat{x}_{T - 1})} &{\le \ \frac{2e}{\alpha(F) \cdot(\tilde{N} + 1)} \cdot f(\hat{x}_{T})} & \\{\quad} &{\quad} \\{\quad} &{\quad \le \frac{\delta}{1 + \delta} \cdot f(\hat{x}_{T}).} &{\quad \quad \quad \quad \quad \quad \quad \Omega} \end{array}
$$

## 7.1.4 Application Examples

In this section, we discuss the complexity of implementation of the schemes presented in Sect. 7.1.3 as applied to different structural classes of optimization problems.

## 7.1.4.1 Linear Programming

Let $\hat{A}$ be an m (n 1)-matrix, $m \geq n$ , which has a full column rank. For a given vector $c \in \mathbb{R}^{m}$ , consider the following optimization problem:

$$
\mathrm{Find ~} f^{*} = \operatorname{max}_{u \in \mathbb{R}^{m}} \left\{\langle c, u \rangle : \ : \hat{A}^{T} u = 0, \ : \ : | u^{(i)} | \leq 1, \ : i = 1, \ldots, m \right\}.\tag{7.1.33}
$$

This problem is non-trivial only if the column rank of matrix $A =(\hat{A}, c)$ is equal to n, which we assume to be true.

Problem (7.1.33) can be rewritten in the adjoint form. Define

$$
\phi_{1}(y) = \operatorname{max}_{u \in \mathbb{R}^{m}} \left\{\langle c, u \rangle + \langle y, \hat{A}^{T} u \rangle : | u^{(i)} | \leq 1, \i = 1, \ldots, m \right\} = \sum_{i = 1}^{m} | \langle a_{i}, y \rangle + c_{i} |,
$$

where $a_{i}$ are the columns of the matrix $\hat{A}^{T}$ . Then

$$
f^{*} = \operatorname{min}_{y \in \mathbb{R}^{n - 1}} \phi_{1}(y).
$$

In Example 7.1.1 we have already seen that the latter minimization problem can be represented in the form (7.1.19)–(7.1.20) with $x =(y^{T}, \tau)^{T}$ , and $F_{1}(v) = \sum_{i = 1}^{m} | v^{(i)} |$ Thus,

$$
\mathcal{Q}_{2} = \{u \in \mathbb{R}^{m} : | u^{(i)} | \leq 1, i = 1, \ldots, m\}.
$$

Choosing $\| u \|_{(2)} = \left[\sum_{i = 1}^{m}(u^{(i)})^{2} \right]^{1 / 2},$ , we get

$$
\begin{array}{r}{\gamma_{0}(F_{\infty}) = 1, \quad \gamma_{1}(F_{\infty}) = \sqrt{m}, \quad \alpha(F_{\infty}) = \frac{1}{\sqrt{m}}.} \end{array}
$$

Therefore, in view of Theorem 7.1.5, in order to estimate $f^{*}$ with relative accuracy $\delta \in(0, 1)$ we need at most

$$
\begin{array}{r}{2e \cdot m^{1 / 2} \cdot \left(1 + \frac{1}{2} \ln m \right) \cdot \left(1 + \frac{1}{\delta} \right)} \end{array}
$$

iterations of the scheme $S_{N}(R)$

For this method, we need to compute and invert the matrix $G = A^{T} A$ . If A is dense, this takes $O(n^{2} m)$ operations. Further, each iteration of the scheme $S_{N}(R)$ requires $O(nm)$ operations:

- Multiplication of matrix A by $y_{k}$ takes $O(mn)$ operations.

- Since the set $Q_{2}$ and the norm $\| u \|_{\mathbb{R}^{m}}$ have separable structure, computation of $u_{\mu}(x_{k})$ needs $O(m)$ operations.

- Computation of $v_{k + 1}$ needs one multiplication of $A^{T}$ by a vector, and finding the projection onto a set with representation

$$
Q_{1}(R) = \{x \in \mathbb{R}^{n} : \Cx = 1, \ \| x \|_{\mathbb{R}^{n}} \leq R\}
$$

in the Euclidean metric $\| \cdot \|_{\mathbb{R}^{n}}$ . Since $C \in \mathbb{R}^{1 \times n}$ , such a projection can be found by a closed-form expression.

Thus, the total amount of computations in the scheme is of the order of

$$
O \left(n^{2} m +{\textstyle{\frac{1}{\delta}}} \cdot nm^{1.5} \ln m \right)\tag{7.1.34}
$$

operations. The first ingredient of this estimate is dominant when $\delta >{\frac{\sqrt{m}}{n}}$ ln $m$

Note that for problem (7.1.33) we can apply a standard short-step path-following scheme (5.3.25). Each iteration of this scheme needs $O(n^{2} m)$ operations. Therefore its worst-case efficiency estimate is as follows:

$$
\begin{array}{r}{O \left(n^{2} m^{1.5} \ln \frac{m}{\delta} \right).} \end{array}\tag{7.1.35}
$$

Another possibility is to solve this problem by the ellipsoid method (3.2.53). In this case, the total complexity of its solution is

$$
\begin{array}{r}{O \left(n^{3} m \ln{\frac{m}{\delta}} \right).} \end{array}\tag{7.1.36}
$$

Comparing the bounds (7.1.34), (7.1.35), and (7.1.36), we conclude that the scheme (7.1.30) is the best when δ is not too small, say

$$
\begin{array}{r}{\delta > O \left(\frac{1}{n} \operatorname{max} \left\{1, \frac{\sqrt{m}}{n} \right\} \right).} \end{array}
$$

## 7.1.4.2 Minimization of the Spectral Radius

Denote by $\mathbb{S}^{n}$ the space of symmetric $n \times n \cdot$ -matrices. For $X \in \mathbb{S}^{n}$ , we can define its spectral radius:

$$
\rho(X) = \operatorname{max}_{1 \leq i \leq n} | \lambda_{i}(X) |.
$$

Note that this function is convex on $\mathbb{S}^{n}$ . For a vector of decision variables $x \in \mathbb{R}^{p}$ let us introduce a linear operator $A(x)$

$$
A(x) = \sum_{i = 1}^{p} x^{(i)} A_{i} \in \mathbb{S}^{n}.
$$

Now we can define the following objective function in problem (7.1.20):

$$
f(x) = \rho(A(x)).\tag{7.1.37}
$$

Assume also that the constraints in problem (7.1.20), (7.1.37) are linear and very simple. For example, it could be $x^{(1)} = 1$

In order to treat the problem (7.1.20), (7.1.37) we need to represent the upperlevel function $\rho(X)$ in a special form (7.1.18). Let

$$
Q_{2} = \left\{X \in \mathbb{S}^{n} : \ \sum_{i = 1}^{n} | \lambda_{i}(X) | \leq 1 \right\}.
$$

Let us endow the space $\mathbb{S}^{n}$ with the standard Frobenius norm:

$$
\| X \|_{F} = \langle X, X \rangle_{F}^{1 / 2}, \quad \langle X, Y \rangle_{F} \ \stackrel{\mathrm{def}}{=} \ \sum_{i, j = 1}^{n} X^{(i, j)} Y^{(i, j)}, \quad X, Y \in \mathbb{S}^{n}.
$$

Lemma 7.1.3 Let $Q_{2}$ be a closed convex set such that

$$
\begin{array}{r}{B_{\parallel \cdot \parallel_{F}} \left(\frac{1}{\sqrt{n}} \right) \subset Q_{2} \subset B_{\parallel \cdot \parallel_{F}}(1).} \end{array}\tag{7.1.38}
$$

Moreover, $\rho(X) = \operatorname{max}_{U \in{\mathcal{Q}}_{2}} \langle X, U \rangle$

Proof For any $X \in S^{n}$ , we have:

$$
\begin{array}{l}{{\displaystyle \rho(X) = \operatorname{min}_{\tau \in \mathbb{R}} \{\tau : \tau I_{n} \geq X, \ \tau I_{n} \geq - X\}}} \\{{\\}} \\{{\mathrm{~} = \operatorname{min}_{\tau \in \mathbb{R}} \operatorname{max}_{Y_{1}, Y_{2} \geq 0}[\tau + \langle X - \tau I_{n}, Y_{1} \rangle_{F} - \langle X + \tau I_{n}, Y_{2} \rangle_{F}]}} \\{{\ \mathrm{~}}} \\{{\ \ = \operatorname{max}_{Y_{1}, Y_{2} \geq 0} \{\langle X, Y_{1} - Y_{2} \rangle_{F} : \langle I_{n}, Y_{1} + Y_{2} \rangle_{F} = 1\}.}} \end{array}
$$

Let $U = Y_{1} - Y_{2}$ and $V = Y_{1} + Y_{2}$ . Then

$$
\rho(\boldsymbol{X}) = \operatorname{max}_{U \in S^{n}} \{\langle \boldsymbol{X}, U \rangle_{F}, \U \in \hat{\mathcal{Q}}\},
$$

where $\hat{Q} = \{U : \exists V \succeq \pm U, \langle I_{n}, V \rangle_{F} = 1\}$ . It is clear that the set $\hat{Q}$ is closed, convex and bounded. Let us prove that $\hat{Q} = Q_{2}$

Indeed, we can always represent U by its orthogonal basis of eigenvectors:

$$
U = BAB^{T}, \quad BB^{T} = I_{n},
$$

where Λ is a diagonal matrix. Assume that $U \in Q_{2}$ . Define a diagonal matrix $\hat{A}$ with the following diagonal entries:

$$
\hat{\cal{A}}^{(i, i)} = |{\cal{A}}^{(i, i)} | /[\sum_{j = 1}^{n} |{\cal{A}}^{(j, j)} |], \quad i = 1, \ldots, n.
$$

Then $V = B \hat{A} B^{T} \succeq \pm U$ and $\langle I_{n}, V \rangle_{F} = 1$ . Thus $Q_{2} \subseteq{\hat{Q}}$

Conversely, if $U \in{\hat{Q}}$ , then there exists a $V ~ \in ~ S^{n}$ such that $B^{T} VB \succeq \pm A$ Therefore

$$
\langle Vb_{i}, b_{i} \rangle_{F} \geq | \varLambda^{(i, i)} |, \quad i = 1, \dots, n,
$$

where $b_{i}$ are the columns of the matrix B. Hence,

$$
1 = \langle I_{n}, V \rangle_{F} = \langle BB^{T}, V \rangle_{F} = \langle I_{n}, B^{T} VB \rangle_{F} = \sum_{i = 1}^{n} \langle Vb_{i}, b_{i} \rangle_{F} \geq \sum_{i = 1}^{n} | \lambda_{i}(U) |.
$$

Thus, $\hat{Q} \subseteq Q_{2}$ and we conclude that $\hat{Q} = Q_{2}$

It remains to prove inclusion (7.1.38). Indeed, if $\textstyle \| U \|_{F}^{2} \leq{\frac{1}{n}}$ , that is $\sum_{i = 1}^{n} \lambda_{i}^{2}(U) \leq$ $\frac{1}{n}$ , then

$$
\sum_{i = 1}^{n} | \lambda_{i}(U) | \leq \sqrt{n} \cdot \left[\sum_{i = 1}^{n} \lambda_{i}^{2}(U) \right]^{1 / 2} ~ \leq ~ 1.
$$

Conversely, if $\sum_{i = 1}^{n} | \lambda_{i}(U) | \leq 1, \operatorname{then} \sum_{i = 1}^{n} \lambda_{i}^{2}(U) \leq \left[\sum_{i = 1}^{n} | \lambda_{i}(U) | \right]^{2} \leq 1.\quad \sqcup$

Thus, in view of inclusion (7.1.38) we have

$$
\begin{array}{r}{\gamma_{0}(\rho) = \frac{1}{\sqrt{n}}, \quad \gamma_{1}(\rho) = 1, \quad \alpha(\rho) = \frac{1}{\sqrt{n}}.} \end{array}
$$

Hence, in view of Theorem 7.1.5, the total number of iterations of the method $S_{N}(R)$ does not exceed

$$
\begin{array}{r}{2e \sqrt{n} \left(1 + \frac{1}{2} \ln n \right) \cdot \left(1 + \frac{1}{\delta} \right).} \end{array}
$$

In order to apply this approach, we need to compute and invert the matrix $G.$ In our situation, $G$ is the matrix of the following quadratic form:

$$
\langle Gx, x \rangle = \langle A(x), A(x) \rangle_{F}.
$$

Thus, $G^{(i, j)} ~ = ~ \langle A_{i}, A_{j} \rangle_{F}, ~ i, j ~ = ~ 1, \ldots, p$ . If the matrices $A_{i}$ are dense, the computation of this matrix takes $O(p^{2} n^{2})$ arithmetic operations and the inversion takes $O(p^{3})$ operations. Since we assume $p \ < \ \frac{n(\bar{n} + 1)}{2}$ , the total cost of the preliminary computation is of the order of $O(p^{2} n^{2})$ operations.

Further, the most expensive operations at each step of the method $S_{N}(R)$ are as follows.

- Computation of the value of the bilinear form $\langle A(x), U \rangle_{F}$ and its gradients takes $O(pn^{2})$ operations.

- Finding a projection of point X onto the set $Q_{2}$ with respect to the standard Frobenius norm. The most expensive part of this operation consists in solving an eigenvalue problem for the matrix X. This can be done in $O(n^{3})$ operations.

- The total amount of operations in the space $\mathbb{R}^{p}$ does not exceed $O(p^{2})$ .

Thus, the complexity of each iteration of $S_{N}(R)$ is of the order of $O(n^{2}(n + p))$ operations. Hence, in total, the method (7.1.30) requires

$$
O \left(n^{2} p^{2} +{\textstyle{\frac{1}{\delta}}} \cdot n^{2.5}(p + n) \ln n \right)\tag{7.1.39}
$$

arithmetic operations.

Let us compare this estimate with the worst-case complexity of a short-step pathfollowing scheme as applied to the problem (7.1.20)–(7.1.37). For this method, the most expensive computations at each iteration are the computations of the elements of the Hessian of the barrier function. In accordance with Lemma 5.4.6, these are the values

$$
\langle X^{- 1} A_{i} X^{- 1}, A_{j} \rangle_{F}, \quad i, j = 1, \dots, p.
$$

Such a computation needs $O(pn^{2}(p + n))$ operations. Thus, the total complexity of the interior-point method is of the order of

$$
O \left(pn^{2.5}(p + n) \ln{\frac{n}{\delta}} \right)
$$

operations. Comparing this estimate with (7.1.39) we see that the gradient method is better if the required relative accuracy is not too small:

$$
\begin{array}{r}{\delta \ge O \left(\frac{1}{p} \right).} \end{array}
$$

## 7.1.4.3 The Truss Topology Design Problem

In this problem, we have a set of points

$$
x_{i} \in \mathbb{R}^{2}, \quad i = 1, \dots, n + p,
$$

connected by a set of arcs $(i_{k}, j_{k}), k = 1, \ldots, m$ . We always assume that $j_{k} > i_{k}$ Each arc has a nonnegative weight $t^{(k)}$ , and the sum of all weights is equal to one. The nodes $x_{n + 1}, \ldots, x_{n + p}$ are fixed. To all other nodes we can apply external forces

$$
f_{i} \in \mathbb{R}^{2}, \quad i = 1, \dots, n, \quad f \stackrel{\mathrm{def}}{=}(f_{1}, \dots, f_{n})^{T} \in \mathbb{R}^{2n}.
$$

The goal is to find an optimal design vector

$$
t \stackrel{\mathrm{def}}{=}(t^{(1)}, \ldots, t^{(m)})^{T} \in \varDelta_{m} \equiv \left\{t \in \mathbb{R}_{+}^{m} : \sum_{i = 1}^{m} t^{(i)} = 1 \right\}
$$

which minimizes the total stiffness $\psi(t)$ of the system.

To define the stiffness, we can always assume that $i_{k} ~ < ~ n, k ~ = ~ 1, \ldots, m$ allowing no arcs between fixed nodes. For each arc $k,$ define vectors

$$
\begin{array}{r}{d_{k} = \frac{x_{i_{k}} - x_{j_{k}}}{\| x_{i_{k}} - x_{j_{k}} \|^{2}} \in \mathbb{R}^{2}, \quad k = 1, \ldots, m,} \end{array}
$$

where $\| \cdot \|$ is the standard Euclidean norm in $\mathbb{R}^{2}$ . Now we can define the constraint vector $a_{k} =(a_{k, 1}, \ldots, a_{k, n})^{T} \in \mathbb{R}^{2n}$ , which is composed by the following twodimensional vectors:

$$
a_{k, q} = \left\{\begin{array}{ll}{\d_{k}, \ \mathrm{if} \q = i_{k},} \\{- d_{k}, \ \mathrm{if} \q = j_{k} \ \mathrm{and} \j_{k} \leq n,} \\{\0, \ \mathrm{otherwise}.} \end{array} \right.q = 1, \ldots, n.
$$

Let $B(t) = \sum_{k = 1}^{m} t^{(k)} a_{k} a_{k}^{T}$ . Then the truss topology design problem can be written as follows

$$
{\mathrm{Find ~}} \psi^{*} = \operatorname{inf}_{t} \{\langle[B(t)]^{- 1} f, f \rangle : \t \in \operatorname{rint} \varDelta_{m}\}.\tag{7.1.40}
$$

This problem is well defined if and only if the matrix $G \stackrel{\mathrm{def}}{=} B(\bar{e}_{m})$ is positive definite.

Let us show how this problem can be rewritten in the form (7.1.19)–(7.1.20).

$$
\begin{array}{rl}{\psi^{*} = \underset{t \in \mathrm{max}}{\operatorname{inf}} \quad \langle B(t) \rangle^{- 1} f, f \rangle} &{} \\ &{= \underset{t \in \mathrm{max}}{\operatorname{inf}} \quad \underset{x \in \mathbb{R}^{m}}{\operatorname{max}} \quad[2(f, x) - \langle B(t) x, x \rangle]} \\ &{= \underset{x \in \mathbb{R}^{m}}{\operatorname{max}} \quad \underset{t \in \mathrm{max}}{\operatorname{inf}} \quad \bigg[2(f, x) - \underset{k = 1}{\overset{m}{\operatorname{m}}} t^{(k)}(a_{k}, x)^{2} \bigg]} \\ &{= \underset{x \in \mathbb{R}^{m}}{\operatorname{max}} \quad \bigg[2(f, x) - \underset{1 \leq k \leq m}{\operatorname{max}} \left(a_{k}, x \right)^{2} \bigg]} \\ &{= \underset{x \in \mathbb{R}^{m}}{\operatorname{max}} \quad \bigg[2(f, x) - \underset{1 \leq k \leq m}{\operatorname{max}} \left(a_{k}, x \right)^{2} \bigg]} \\ &{= \underset{x \in \mathbb{R}^{m}}{\operatorname{max}} \ \frac{\{f, \{x\}^{2}\}}{\mathrm{max}^{\alpha} \langle a_{k}, x \rangle^{2}}} \end{array}
$$

(in the last step we perform a maximization of the objective function along direction x by multiplying it by a positive factor).

Thus, we can consider the problem

$$
\mathrm{Find ~} f^{*} = \operatorname{min}_{x \in \mathbb{R}^{2n}} \{f(x) \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{1 \leq k \leq m} | \langle a_{k}, x \rangle | : \ \langle f, x \rangle = 1\},\tag{7.1.41}
$$

which is exactly in the desired form (7.1.19)–(7.1.20). Let A be an $m \times(2n)$ -matrix with the rows $\overset{\cdot}{a}_{k}^{T}$ . Then, using the notation of Example 7.1.1 the objective function of this problem can be written as

$$
f(x) = F_{\infty}(Ax).
$$

In view of (7.1.21) we have $\alpha(F_{\infty}) = \frac{1}{\sqrt{m}}$ . Therefore, in order to find an approximate solution to (7.1.41) with relative accuracy $\delta,$ , the method (7.1.30) needs at most

$$
\begin{array}{r}{2e \sqrt{m} \left(1 + \frac{1}{2} \ln m \right) \cdot \left(1 + \frac{1}{\delta} \right)} \end{array}\tag{7.1.42}
$$

iterations of the scheme $S_{N}(R)$ . The most expensive operations of each iteration of the latter scheme are as follows.

- Computation of the value and the gradients of the bilinear form $\langle Ax, u \rangle$ needs $O(m)$ operations (recall that A is sparse).

- Euclidean projection on $Q_{2} \subset \mathbb{R}^{m}$ needs O(m ln m) operations.

- All steps in the primal space need $O(n^{2})$ operations.

Note that the preliminary computation of the matrix G needs $O(m \mathrm{~ + ~} n^{2})$ operations, but its inversion costs $O(n^{3})$ . Since $m \ \leq \{\frac{n(n + 1)}{2}}$ , we come to the following upper bound for the total computational effort of the method (7.1.30):

$$
O \left(n^{3} +{\frac{1}{\delta}} \cdot(n^{2} + m \ln m) \cdot \sqrt{m} \ln m \right)\tag{7.1.43}
$$

arithmetic operations. For a dense truss with $m = O(n^{2})$ this estimates becomes

$$
\begin{array}{r}{O \left(\frac{n^{3}}{\delta} \ln^{2} n \right)} \end{array}
$$

arithmetic operations.

## 7.2 Rounding of Convex Sets

(Computing rounding ellipsoids; John’s Theorem; Rounding by diagonal ellipsoids; Minimizing the maximal absolute value of linear functions; Bilinear matrix games with non-negative coefficients; Minimizing the spectral radius of symmetric matrices.)

## 7.2.1 Computing Rounding Ellipsoids

Among modern methods for solving problems of Linear Programming (LP-problems, for short), the Interior-Point Methods (IPM) are considered to be the most efficient. However, these methods are based on an expensive machinery. For an LPproblem with n variables and m inequality constraints, $(m > n)$ , in order to get an approximate solution with absolute accuracy $\epsilon$, these methods need to perform

$$
O(\sqrt{m} \ln \frac{m}{\epsilon})
$$

iterations of Newton’s Method (see Sect. 5.4). Recall that for problems with dense data, each iteration can take up to $O(n^{2} m)$ operations.

Clearly these bounds leave considerable room for competition with gradient-type methods, for which each iteration is much cheaper. However, the main drawback of the latter schemes is their relatively slow convergence. In general, the gradient schemes need $\begin{array}{rlr}{\mathrm{~}} &{{}} &{O \left(\frac{C_{0}}{\epsilon^{2}} \right)} \end{array}$ iterations in order to find an $\epsilon$-solution to the problem (see Sect. 3.2). In this estimate, a strong dependence on $\epsilon$ is coupled with the presence of a constant $C_{0}$ , which depends on the norm of the matrix of constraints, the size of the solution, etc, and which can be uncontrollably large. Consequently, the classical gradient-type schemes can compete with IPM only on very large problems.

However, in Chap. 6 we have shown that it is possible to use the special structure of LP-problems in order to get gradient-type schemes which converge in $\begin{array}{r}{O \left(\frac{C_{1}}{\epsilon} \right)} \end{array}$ iterations. Moreover, it was shown that, for some LP-problems, the constant $C_{1}$ can be found explicitly and that it is reasonably small. In Sect. 7.1 this result was extended to cover minimization schemes for finding an approximate solution with a certain relative accuracy. Namely, it was shown that for some classes of LPproblems it is possible to compute an approximate solution of relative accuracy δ with $\begin{array}{l}{\displaystyle{O(\frac{\sqrt{m}}{\delta})}} \end{array}$ iterations of a gradient-type scheme. Recall that for many applications the concept of relative accuracy is very attractive since it adapts automatically to any size of the solution. $\mathrm{So}.$ , there is no necessity to fight against big and unknown constants. For many problems in Economics and Engineering, the level of relative accuracy of the order 1.5–0.05% is completely acceptable.

The approach of Sect. 7.1 is applicable to special conic unconstrained minimization problems. They consist in minimization of a non-negative positively homogeneous convex function $f_{:}$ , dom $f = \mathbb{R}^{n}$ , on a closed convex set separated from zero. In order to compute a solution to this problem with some relative accuracy, we need to know a rounding ellipsoid for the subdifferential of $f$ at the origin. It was shown that for some LP-problems it is possible to use the structure of the objective function in order to compute such an ellipsoid with radius $O \left({\sqrt{m}} \right)$

It is well known that, for any centrally symmetric set in $\mathbb{R}^{n}$ , there exists a ${\sqrt{n}}.$ -rounding ellipsoid. Moreover, a good approximation to such an ellipsoid can be easily computed. It appears that this ellipsoid provides us with a good norm, allowing us to solve the corresponding minimization problem up to a certain relative accuracy. In this section, we analyze two non-trivial classes of LP-problems and show that for both classes the approximate solutions with relative accuracy $\delta$ can be computed in $O \left({\frac{\sqrt{n \ln m}}{\delta}} \ln n \right)$ iterations of a gradient-type method.

At the same time, the preliminary computation of the rounding ellipsoids in both situations is reasonably cheap: it takes $O(n^{2} m \ln m)$ operations at most. Up to a logarithmic factor, this estimate coincides with the complexity of finding a projection onto a linear subspace in $\mathbb{R}^{m}$ defined by n linear equations. However, we will see that the consequent optimization process is even cheaper.

Let us recall some notation. In this section, it is convenient to identify <sup>E</sup> and $\mathbb{E}^{*}$ with $\mathbb{R}^{n}$ . A symmetric $n \times n$ -matrix $G \succ 0$ defines a norm on $\mathbb{R}^{n}$ :

$$
\| x \|_{G} = \langle Gx, x \rangle^{1 / 2}, \quad x \in \mathbb{R}^{n}.
$$

The dual norm is defined in the usual way:

$$
\| s \|_{G}^{*} = \operatorname{sup}_{x} \{\langle s, x \rangle : \| x \|_{G} \leq 1\} = \langle s, G^{- 1} s \rangle^{1 / 2}, \quad s \in \mathbb{R}^{n}.
$$

For a closed convex bounded set $C \subset \mathbb{R}^{n}, \xi_{C}(x)$ denotes its support function:

$$
\xi_{C}(x) = \operatorname{max}_{s \in C} \langle s, x \rangle, \quad x \in \mathbb{R}^{n}.
$$

Thus $\partial \xi_{C}(0) = C.$

Finally, $D(a)$ denotes a diagonal $n \times n$ -matrix with vector $a \in \mathbb{R}^{n}$ at the diagonal. In this setting, $e_{k} \in \mathbb{R}^{n}$ denotes the kth coordinate vector, and $\bar{e}_{n} \in \mathbb{R}^{n}$ denotes the vector of all ones. Thus, ${\cal I}_{n} \equiv{\cal D}(\bar{e}_{n})$ . As before, the notation $\mathbb{R}_{+}^{n}$ is used for the positive orthant and $\Delta_{n} \equiv \{x \in \mathbb{R}_{+}^{n} : \langle \bar{e}_{n}, x \rangle = 1\}$ denotes the standard simplex in $\mathbb{R}^{n}$

In this section, we analyze efficient algorithms for constructing rounding ellipsoids for different types of convex sets. An ellipsoid $W_{r}(v, G) \subset \mathbb{R}^{n}$ is usually represented in the following form:

$$
W_{r}(v, G) = \{s \in \mathbb{R}^{n} : \ \| s - v \|_{G}^{*} \equiv \langle s - v, G^{- 1}(s - v) \rangle^{1 / 2} \leq r\},
$$

where $G \succ 0$ is a symmetric $n \times n{\mathrm{- matrix}}$ . If $v = 0$ , we often use the notation $W_{r}(G)$ . An ellipsoid $W_{1}(v, G)$ is called a β-rounding for a convex set $C \subset \mathbb{R}^{n}$ $\beta \geq 1$ , if

$$
W_{1}(v, G) \subseteq C \subseteq W_{\beta}(v, G).
$$

We call $\beta$ the radius of ellipsoidal rounding.

## 7.2.1.1 Convex Sets with Central Symmetry

Let $\begin{array}{rlr}{G} &{{} \succ} &{0} \end{array}$ . For an arbitrary $\begin{array}{rlr}{g} &{{} \in} &{\mathbb{R}^{n}} \end{array}$ , consider the set $\begin{array}{rl}{C_{\pm g}(G)} &{{} =} \end{array}$ Conv $\{W_{1}(G), \pm g\}$ . For $\alpha \in[0, 1]$ define

$$
G(\alpha) =(1 - \alpha) G + \alpha gg^{T}.
$$

Lemma 7.2.1 For any $\alpha \in[0, 1)$ , the following inclusion holds:

$$
{\cal W}_{1}(G(\alpha)) ~ \subset ~{\cal C}_{\pm g}(G).\tag{7.2.1}
$$

If the value $\sigma{\overset{\underset{\mathrm{def}}{}}{=}} ~{\frac{1}{n}}(\| g \|_{G}^{*})^{2} - 1$ is positive, then the function

$$
\begin{array}{r}{V(\alpha) \stackrel{\mathrm{def}}{=} \ln \frac{\operatorname{det} G(\alpha)}{\operatorname{det} G(0)} = \ln(1 + \alpha(n(1 + \sigma) - 1)) +(n - 1) \ln(1 - \alpha),} \end{array}
$$

attains its maximum at $\begin{array}{r}{\alpha^{*} = \frac{\sigma}{n(1 + \sigma) - 1}} \end{array}$ . Moreover,

$$
\begin{array}{rlr} &{} &{V(\alpha^{*}) = \ln(1 + \sigma) +(n - 1) \ln{\frac{(n - 1)(1 + \sigma)}{n(1 + \sigma) - 1}}} \\ &{} & \\ &{} &{\geq \ln(1 + \sigma) -{\frac{\sigma}{1 + \sigma}} \geq{\frac{\sigma^{2}}{(1 + \sigma)(2 + \sigma)}}.} \end{array}\tag{7.2.2}
$$

Proof For any $x \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{rl} &{\xi_{W_{1}(G(\alpha))}(x) = \langle G(\alpha) x, x \rangle^{1 / 2} =[(1 - \alpha) \langle Gx, x \rangle + \alpha \langle g, x \rangle^{2}]^{1 / 2}} \\ &{\qquad \quad \leq \operatorname{max} \{\langle Gx, x \rangle^{1 / 2}, | \langle g, x \rangle |\}} \\ &{\qquad = \operatorname{max} \{\xi_{W_{1}(G)}(x), \xi_{\mathrm{Conv} ~ \{\pm g\}}(x)\} = \xi_{C_{\pm g}(G)}(x).} \end{array}
$$

Hence, in view of Corollary 3.1.5, inclusion (7.2.1) is proved.

Furthermore,

$$
\begin{array}{l}{{V(\alpha) = \ln \operatorname{det}(G^{- 1 / 2} G(\alpha) G^{- 1 / 2})}} \\{{\ \qquad = \ln \operatorname{det} \big((1 - \alpha) I_{n} + \alpha G^{- 1 / 2} gg^{T} G^{- 1 / 2} \big)}} \\{{\ \qquad = \ln \big(1 - \alpha + \alpha(\| g \|_{G}^{*})^{2} \big) +(n - 1) \ln(1 - \alpha)}} \\{{\ \qquad = \ln(1 + \alpha(n(1 + \sigma) - 1)) +(n - 1) \ln(1 - \alpha).}} \end{array}
$$

Hence, in view of Theorem 2.1.1, the global optimality condition for the function $V(\cdot)$ is as follows:

$$
\begin{array}{r}{\frac{n - 1}{1 - \alpha} = \frac{n(1 + \sigma) - 1}{1 + \alpha(n(1 + \sigma) - 1)}.} \end{array}
$$

The only solution of this equation is $\begin{array}{r}{\alpha^{*} = \frac{\sigma}{n(1 + \sigma) - 1}} \end{array}$ . Note that

$$
\begin{array}{lll}{{V(\alpha^{*})}} &{{=}} &{{\ln(1 + \sigma) +(n - 1) \ln \frac{(n - 1)(1 + \sigma)}{n(1 + \sigma) - 1}}} \\{{}} &{{}} &{{}} \\{{}} &{{=}} &{{\ln(1 + \sigma) -(n - 1) \ln \left(1 + \frac{\sigma}{(n - 1)(1 + \sigma)} \right)}} \\{{}} &{{}} &{{}} \\{{}} &{{\geq}} &{{\ln(1 + \sigma) - \frac{\sigma}{1 + \sigma} = \frac{\sigma^{2}}{1 + \sigma} - \omega(\sigma)}} \\{{}} &{{}} &{{}} \\{{}} &{{\stackrel{(5.1.23)}{\geq} \frac{\sigma^{2}}{(1 + \sigma)(2 + \sigma)}.}} \end{array}
$$

In this section, we are interested in solving the following problem. Let C be a convex centrally symmetric body, i.e. int $C \neq \varnothing,$ , and $x \in C \Leftrightarrow - x \in C$ . For a given $\gamma > 1$ , we need to find an ellipsoidal rounding for C of radius $\gamma{\sqrt{n}}$ . An initial approximation to the solution of our problem is given by a matrix $G_{0} \succ 0$ such that $W_{1}(G_{0}) \subseteq C$ , and $C \subseteq W_{R}(G_{0})$ for a certain $R \geq 1$

Let us look at a particular variant of such a problem.

Example 7.2.1 Consider a set of vectors $a_{i} \in \mathbb{R}^{n}, i = 1, \dots, m$ , which span the whole space $\mathbb{R}^{n}$ . Let the set C be defined as follows:

$$
C = \mathrm{Conv} \ \{\pm a_{i}, \i = 1, \ldots, m\}.\tag{7.2.3}
$$

We choose $\begin{array}{r}{G_{0} \ = \ \frac{1}{m} \displaystyle \sum_{i = 1}^{m} a_{i} a_{i}^{T}} \end{array}$ . Note that for any $x \in \mathbb{R}^{n}$ , we have $\xi_{C}(x) \ =$ $\operatorname{max}_{1 \leq i \leq m} | \langle a_{i}, x \rangle |$ . Therefore,

$$
\xi_{W_{1}(G_{0})}(x) = \left[\frac{1}{m} \sum_{i = 1}^{m} \langle a_{i}, x \rangle^{2} \right]^{1 / 2} \ \leq \ \xi_{C}(x),
$$

$$
\xi_{W_{\sqrt{m}}(G_{0})}(x) = m^{1 / 2} \left[\frac{1}{m} \sum_{i = 1}^{m} \langle a_{i}, x \rangle^{2} \right]^{1 / 2} \ \ge \ \xi_{C}(x).
$$

Thus, in view of Corollary 3.1.5, $W_{1}(G_{0}) \subseteq C \subseteq W_{{\sqrt{m}}}(G_{0})$ □

Let us analyze the following algorithmic scheme.

For $k \geq 0$ iterate:

$$
\mathbf{1.Compute} \g_{k} \in C : \ \| g_{k} \|_{G_{k}}^{*} = r_{k} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{g} \{\| g \|_{G_{k}}^{*} : \g \in C\}.
$$

2. If $r_{k} \le \gamma n^{1 / 2}$ then Stop else

$$
\begin{array}{r}{\alpha_{k} = \frac{r_{k}^{2} - n}{n(r_{k}^{2} - 1)}, \quad G_{k + 1} =(1 - \alpha_{k}) G_{k} + \alpha_{k} g_{k} g_{k}^{T}.} \end{array}\tag{7.2.4}
$$

end.

The complexity bound for this scheme is given by the following statement.

Theorem 7.2.1 Let $R \ge 1$ and $W_{1}(G_{0}) \subseteq C \subseteq W_{R}(G_{0})$ . Then scheme (7.2.4) terminates after

$$
\begin{array}{r}{2n \frac{\gamma^{2}}{(\gamma - 1)^{2}} \ln R} \end{array}\tag{7.2.5}
$$

iterations at most.

Proof Note that the coefficient $\alpha_{k}$ in Step 2 of (7.2.4) is chosen in accordance with Lemma 7.2.1. Since the method runs as long as $\sigma_{k} \{\overset{\mathrm{def}}{=}} \{\frac{1}{n}} r_{k}^{2} - 1 \geq \gamma^{2} - 1$ , in view of inequality (7.2.2), at each step $k \geq 0$ we have

$$
\begin{array}{r}{\ln \operatorname{det} G_{k + 1} \geq \ln \operatorname{det} G_{k} + 2 \ln \gamma - \frac{\gamma^{2} - 1}{\gamma^{2}}.} \end{array}\tag{7.2.6}
$$

Note that

$$
\begin{array}{rl} &{2 \ln \gamma - \frac{\gamma^{2} - 1}{\gamma^{2}} = \frac{(\gamma^{2} - 1)^{2}}{\gamma^{2}} - \omega(\gamma^{2} - 1) \stackrel{(5.1.23)}{\geq} \frac{(\gamma^{2} - 1)^{2}}{\gamma^{2}} - \frac{(\gamma^{2} - 1)^{2}}{1 + \gamma^{2}}} \\ &{\qquad = \frac{(\gamma^{2} - 1)^{2}}{\gamma^{2}(1 + \gamma^{2})} \geq \frac{1}{\gamma^{2}}(\gamma - 1)^{2}.} \end{array}
$$

At the same time, for any $k \geq 0$ we get

$$
\begin{array}{l}{\mathrm{det}(G_{k})^{1 / 2} \cdot \mathsf{vol}_{n}(W_{1}(I_{n})) = \mathsf{vol}_{n}(W_{1}(G_{k})) \ \leq \ \mathsf{vol}_{n}(C) \ \leq \ \mathsf{vol}_{n}(W_{R}(G_{0}))} \\{\qquad = \mathbb{R}^{n} \cdot \mathrm{det}(G_{0})^{1 / 2} \cdot \mathsf{vol}_{n}(W_{1}(I_{n})).} \end{array}
$$

Hence, ln det $G_{k} \mathrm{~ - ~}$ ln det $G_{0} \leq 2n$ ln R, and we get bound (7.2.5) by summing up inequalities (7.2.6).

Let us estimate the total arithmetical complexity of the scheme (7.2.4) as applied to a particular symmetric convex set (7.2.3). In this situation, it is reasonable to recursively update the inverse matrices $H_{k} \{\stackrel{\mathrm{def}}{{} ={}}} \G_{k}^{- 1}$ , and the set of values

$$
\nu_{k}^{(i)} = \langle a_{i}, H_{k} a_{i} \rangle, \quad i = 1, \ldots, m,
$$

which we treat as a vector $\nu_{k} \in \mathbb{R}^{m}$ . A modified variant of the scheme (7.2.4) is as follows.

A. Compute $\begin{array}{r}{H_{0} = \left[\frac{1}{m} \displaystyle \sum_{i = 1}^{m} a_{i} a_{i}^{T} \right]^{- 1}} \end{array}$ and the vector $\nu_{0} \in \mathbb{R}^{m}$

## B. For $k \geq 0$ iterate:

1. Find $i_{k} : \nu_{k}^{(i_{k})} = \operatorname{max}_{1 \leq i \leq m} \nu_{k}^{(i)}.\mathrm{Set} r_{k} =[\nu^{(i_{k})}]^{1 / 2}.$

2. If $r_{k} \le \gamma n^{1 / 2}$ then Stop else

(7.2.7)

2.1. Set $\begin{array}{r}{\sigma_{k} = \frac{1}{n} r_{k}^{2} - 1, \alpha_{k} = \frac{\sigma_{k}}{r_{k}^{2} - 1}, x_{k} = H_{k} a_{i_{k}}.} \end{array}$

2.2. Update $\begin{array}{r}{{\cal H}_{k + 1} : = \frac{1}{1 - \alpha_{k}} \left[{\cal H}_{k} - \frac{\alpha_{k}}{1 + \sigma_{k}} \cdot x_{k} x_{k}^{T} \right]} \end{array}$

2.3. Update $\begin{array}{r}{\nu_{k + 1}^{(i)} : = \frac{1}{1 - \alpha_{k}} \left[\nu_{k}^{(i)} - \frac{\alpha_{k}}{1 + \sigma_{k}} \cdot \langle a_{i}, x_{k} \rangle^{2} \right]} \end{array}$ i 1, . . . , m.

end.

Let us estimate the arithmetical complexity of this scheme. For simplicity, we assume that the matrix $A = ( a _ { 1 } , \ldots , a _ { m } ) $ is dense. We write down only the leading polynomial terms in the complexity of the corresponding computations, where we count only multiplications.

- Phase A takes $\textstyle{\frac{mn^{2}}{2}}$ operations to compute the matrix $G_{0}$ , plus $\frac{n^{3}}{6}$ operations to compute its inverse, and $\textstyle{\frac{mn^{2}}{2}}$ operations to compute the vector $\nu_{0}$

- Step 2.1 takes $n^{2}$ operations.

- Step 2.2 takes $\frac{n^{2}}{2}$ operations.

- Step 2.3 takes mn operations.

Using now the estimate (7.2.5) with $R ={\sqrt{m}}$ (see Example 7.2.1), we conclude that for $\gamma > 1$ and the centrally symmetric set (7.2.3), the scheme (7.2.7) can find a $\gamma{\sqrt{n}}{\mathrm{- rounding}}$ in

$$
\begin{array}{r}{\frac{n^{2}}{6}(n + 6m) + \frac{\gamma^{2}}{(\gamma - 1)^{2}} n^{2}(2m + 3n) \ln{m}} \end{array}
$$

arithmetic operations. Note that for a sparse matrix A the complexity of Phase A and Step 2.3 will be much lower.

Remark 7.2.1 Note that the process (7.2.4) with eliminated stopping criterion can be used to prove a symmetric version of John’s theorem.

Indeed, all matrices generated by this process have the following form:

$$
G_{k} = \sum_{i = 1}^{m} \lambda_{k}^{(i)} a_{i} a_{i}^{T}, \quad \lambda_{k} \in \mathbb{R}_{+}^{m}, \quad \sum_{i = 1}^{m} \lambda_{k}^{(i)} = 1.
$$

Therefore, $I_{n} = \sum_{i = 1}^{m} \lambda_{k}^{(i)} G_{k}^{- 1 / 2} a_{i} a_{i}^{T} G_{k}^{- 1 / 2}$ . Taking the trace of both sides of this equality, we get

$$
n = \sum_{i = 1}^{m} \lambda_{k}^{(i)}(\| a_{i} \|_{G_{k}}^{*})^{2} \ \leq \r_{k}^{2}.
$$

On the other hand, we have seen that

$$
\begin{array}{r}{\ln \operatorname{det} G_{k + 1} \overset{(7.2.6)} \geq \ln \operatorname{det} G_{k} + \ln(1 + \sigma_{k}) - \frac{\sigma_{k}}{1 + \sigma_{k}} \overset{(5.1.23)} \geq \frac{1}{r_{k}^{2}}(r_{k} - \sqrt{n})^{2}.} \end{array}
$$

Therefore, by the same reasoning as in the proof of Theorem 7.2.1, after N iterations of the scheme we get

$$
\begin{array}{r}{\sum_{k = 0}^{N} \left(1 - \frac{\sqrt{n}}{r_{k}} \right)^{2} \leq 2n \ln R.} \end{array}
$$

Defining $r_{N}^{*} = \operatorname{min}_{0 \le k \le N} r_{k}$ , we have $\begin{array}{r}{\frac{\sqrt{n}}{r_{N}^{*}} \geq 1 - \biggl(\frac{2n}{N + 1} \ln R \biggr)^{1 / 2}} \end{array}$ . Thus, $r_{N}^{*} \to \sqrt{n}$ as $N \to \infty$ . Since the sequence of matrices $\{G_{k}\}$ is compact, we conclude that there exists a limiting matrix $G_{*}$ with rounding coefficient $\beta ={\sqrt{n}}$

Thus, we have proved a symmetric version of John’s Theorem for the set $\mathcal{C}$ defined by (7.2.3). Since the quality of our rounding does not depend on the number of points m, we can use the fact that any general symmetric convex set can be approximated by a convex combination of finite number of points with arbitrary accuracy. Thus, our statement is also valid for general sets.

Note that the process (7.2.4) always constructs a matrix with rounding coefficient $\beta ={\sqrt{n}}$ . Of course, there exist symmetric sets with much better rounding. It will be interesting to develop an efficient procedure which can adjust to the exact rounding coefficient for a particular convex set.

## 7.2.1.2 General Convex Sets

For an arbitrary g from $\mathbb{R}^{n}$ , consider the set $C_{g}(G) ={\mathrm{Conv ~}} \{W_{1}(G), g\}$ . In view of Lemma 3.1.3 support function of this set is as follows:

$$
\xi_{C_{g}(G)}(x) = \operatorname{max} \{\| x \|_{G}, \langle g, x \rangle\}, \quad x \in \mathbb{R}^{n}.
$$

Define $r = \| g \|_{G}^{*}$ , and

$$
\begin{array}{r}{G(\alpha) =(1 - \alpha) G + \bigg(\frac{\alpha}{r} + \bigg(\frac{r - 1}{2} \bigg)^{2} \cdot \left(\frac{\alpha}{r} \right)^{2} \bigg) \cdot gg^{T}, \quad \alpha \in[0, 1].} \end{array}
$$

Lemma 7.2.2 For all $\alpha \in[0, 1)$ , the ellipsoid

$$
\begin{array}{r}{E_{\alpha} = \{s \in \mathbb{R}^{n} : \| s - \frac{r - 1}{2r} \cdot \alpha g \|_{G(\alpha)}^{*} \leq 1\}} \end{array}
$$

belongs to the set $C_{g}(G).Ifr \geq n$ , then the function

$$
\begin{array}{r}{V(\alpha) \stackrel{\mathrm{def}}{=} \ln \frac{\operatorname{det} G(\alpha)}{\operatorname{det} G(0)} = 2 \ln \Big(1 + \alpha \cdot \frac{r - 1}{2} \Big) +(n - 1) \ln(1 - \alpha)} \end{array}
$$

attains its maximum at $\begin{array}{r}{\alpha^{*} = \frac{2}{n + 1} \cdot \frac{r - n}{r - 1}} \end{array}$ . Moreover,

$$
\begin{array}{rl} &{V(\alpha^{*}) = 2 \ln \frac{r - 1}{n + 1} +(n - 1) \ln \frac{(n - 1)(r + 1)}{(n + 1)(r - 1)}} \\ &{} \\ &{\qquad \geq 2 \left[\ln(1 + \sigma) - \frac{\sigma}{1 + \sigma} \right] \stackrel{(5.{\cal I}.23)}{\geq} \frac{2 \sigma^{2}}{(1 + \sigma)(2 + \sigma)},} \end{array}\tag{7.2.8}
$$

where $\textstyle \sigma ={\frac{r - n}{n + 1}}$

Proof In view of Corollary 3.1.5, we need to prove that for all $x \in \mathbb{E}$

$$
\begin{array}{r}{\xi_{E_{\alpha}}(x) \equiv \alpha \cdot \frac{r - 1}{2r} \cdot \langle g, x \rangle + \left[(1 - \alpha) \| x \|_{G}^{2} + \left(\frac{\alpha}{r} + \left(\frac{r - 1}{2} \right)^{2} \cdot \left(\frac{\alpha}{r} \right)^{2} \right) \langle g, x \rangle^{2} \right]^{1 / 2}} \end{array}
$$

$$
\leq \xi_{C_{g}(G)}(x) = \operatorname{max} \{\| x \|_{G}, \langle g, x \rangle\}.
$$

If $\| x \|_{G} \leq \langle g, x \rangle$ , then

$$
\begin{array}{r}{\xi_{E_{\alpha}}(x) \leq \alpha \cdot \frac{r - 1}{2r} \cdot \langle g, x \rangle + | 1 - \alpha \cdot \frac{r - 1}{2r} | \cdot \langle g, x \rangle = \langle g, x \rangle.} \end{array}
$$

Otherwise, we have $- r \| x \|_{G} \leq \langle g, x \rangle \leq \| x \|_{G}$ . Note that the value $\xi_{E_{\alpha}}(x)$ depends on $\langle g, x \rangle$ in a convex way. Therefore, in view of Corollary 3.1.2, its maximum is achieved at the end points of the feasible interval for $\langle g, x \rangle$ . For the end point

$\langle g, x \rangle = \| x \|_{G}$ , we have already proved that $\xi_{E_{\alpha}}(x) = \| x \|_{G}$ . Consider now the case $\langle g, x \rangle = - r \| x \|_{G}$ . Then,

$$
\begin{array}{rl} &{\xi_{E_{\alpha}}(x) = - \alpha \cdot \frac{r - 1}{2} \cdot \| x \|_{G} + \left[(1 - \alpha) \| x \|_{G}^{2} + \left(\frac{\alpha}{r} + \left(\frac{r - 1}{2} \right)^{2} \cdot \left(\frac{\alpha}{r} \right)^{2} \right) r^{2} \| x \|_{G}^{2} \right]^{1 / 2}} \\ &{\qquad = \| x \|_{G}.} \end{array}
$$

Thus, we have proved that $E_{\alpha} \subseteq C_{g}(G)$ for any $\alpha \in[0, 1)$ . Further,

$$
\begin{array}{rl} &{V(\alpha) = \ln \operatorname{det}(G^{- 1 / 2} G(\alpha) G^{- 1 / 2})} \\ &{\qquad = \ln \operatorname{det} \Bigg((1 - \alpha) I_{n} + \left(\frac{\alpha}{r} + \left(\frac{r - 1}{2} \right)^{2} \cdot \left(\frac{\alpha}{r} \right)^{2} \right) G^{- 1 / 2} gg^{*} G^{- 1 / 2} \Bigg)} \\ &{\qquad = \ln \Bigg(1 - \alpha + \left(\frac{\alpha}{r} + \left(\frac{r - 1}{2} \right)^{2} \cdot \left(\frac{\alpha}{r} \right)^{2} \right) \cdot r^{2} \Bigg) +(n - 1) \ln(1 - \alpha)} \\ &{\qquad = 2 \ln \left(1 + \alpha \cdot \frac{r - 1}{2} \right) +(n - 1) \ln(1 - \alpha).} \end{array}
$$

Hence, in view of Theorem 2.1.1, the optimality condition for the concave function $V(\cdot)$ is as follows:

$$
\begin{array}{r}{\frac{n - 1}{1 - \alpha} = \frac{r - 1}{1 + \alpha \cdot \frac{r - 1}{2}}.} \end{array}
$$

Thus, the maximum is attained at $\begin{array}{r}{\alpha^{*} = \frac{2}{n + 1} \cdot \frac{r - n}{r - 1}} \end{array}$ . Defining $\textstyle \sigma ={\frac{r - n}{n + 1}}$ , we get

$$
\begin{array}{rl} &{V(\alpha^{*}) = 2 \ln \left(1 + \alpha^{*} \cdot \frac{r - 1}{2} \right) +(n - 1) \ln(1 - \alpha^{*})} \\ &{\qquad = 2 \ln(1 + \sigma) -(n - 1) \ln \left(1 + \frac{2(r - n)}{(n - 1)(r + 1)} \right)} \\ &{\qquad \geq 2 \ln(1 + \sigma) - \frac{2(r - n)}{r + 1} = 2 \left[\ln(1 + \sigma) - \frac{\sigma}{1 + \sigma} \right].\qquad \Sigma} \end{array}
$$

In this section, we are interested in solving the following problem. Let $C \subset \mathbb{R}^{n}$ be a convex set with nonempty interior. For a given $\gamma > 1$ , we need to find a $\gamma n -$ rounding for C. An initial approximation to the solution of this problem is given by a point v and a matrix $G_{0} \succ 0$ such that $W_{1}(v_{0}, G_{0}) \subseteq Q \subseteq W_{R}(v_{0}, G_{0})$ for certain $R \geq 1$ . We assume that $n \geq 2$

## 7.2 Rounding of Convex Sets

Let us analyze the following algorithmic scheme.

For $k \geq 0$ iterate:

$$
g_{k} \in C : \ \| g_{k} - v_{k} \|_{G_{k}}^{*} = r_{k} \overset{\mathrm{def}}{=} \operatorname{max}_{g \in C} \ \| g - v_{k} \|_{G_{k}}^{*}.
$$

2. If $r_{k} \le \gamma n$ then Stop else

$$
\begin{array}{r}{\alpha_{k} = \frac{2}{n + 1} \cdot \frac{r_{k} - n}{r_{k} - 1}, \quad \beta_{k} = \frac{\alpha_{k}}{r_{k}} + \left(\frac{r_{k} - 1}{2} \right)^{2} \cdot \left(\frac{\alpha_{k}}{r_{k}} \right)^{2},} \end{array}\tag{7.2.9}
$$

$$
\begin{array}{r}{\boldsymbol{v}_{k + 1} = \boldsymbol{v}_{k} + \alpha_{k} \frac{\boldsymbol{r}_{k} - 1}{2 \boldsymbol{r}_{k}}(g_{k} - \boldsymbol{v}_{k}),} \end{array}
$$

$$
G_{k + 1} =(1 - \alpha_{k}) G_{k} + \beta_{k} \cdot(g_{k} - v_{k})(g_{k} - v_{k})^{T}.
$$

end.

The complexity bound for this scheme is given by the following statement.

Theorem 7.2.2 Let $W_{1}(v_{0}, G_{0}) \ \subseteq \C \ \subseteq \W_{R}(v_{0}, G_{0})$ for some $R ~ \geq ~ 1$ . Then scheme (7.2.9) terminates after

$$
\textstyle{\frac{(1 + 2 \gamma)(2 + \gamma)}{2(\gamma - 1)^{2}}} \cdot n \ln R\tag{7.2.10}
$$

iterations at most.

Proof Note that the coefficient $\alpha_{k}$ , vector $v_{k + 1}$ and matrix $G_{k + 1}$ in Step 2 of (7.2.9) are chosen in accordance with Lemma 7.2.2. Since the method runs as long as

$$
\begin{array}{r}{\sigma_{k} \overset{\mathrm{def}}{=} \frac{r_{k} - n}{n + 1} \geq \frac{n}{n + 1}(\gamma - 1) \geq \frac{2}{3}(\gamma - 1),} \end{array}
$$

in view of inequality (7.2.8), at each step $k \geq 0$ we have

ln det $\begin{array}{r}{G_{k + 1} \succeq \ln \operatorname{det} G_{k} + \frac{2 \sigma_{k}^{2}}{(1 + \sigma_{k})(2 + \sigma_{k})} \geq \ln \operatorname{det} G_{k} + \frac{4(\gamma - 1)^{2}}{(1 + 2 \gamma)(2 + \gamma)}.} \end{array}$

(7.2.11)

Note that for any $k \geq 0$ , we have

$$
\begin{array}{l}{\mathrm{det}(G_{k})^{1 / 2} \cdot \mathsf{vol}_{n}(W_{1}(I_{n})) = \mathsf{vol}_{n}(W_{1}(G_{k})) \ \leq \ \mathsf{vol}_{n}(C) \ \leq \ \mathsf{vol}_{n}(W_{R}(G_{0}))} \\{\qquad = \mathbb{R}^{n} \cdot \mathrm{det}(G_{0})^{1 / 2} \cdot \mathsf{vol}_{n}(W_{1}(I_{n})).} \end{array}
$$

Hence, ln det $G_{k} \mathrm{~ - ~}$ ln det $G_{0} \leq 2n$ ln R, and we get bound (7.2.10) by summing up the inequalities (7.2.11).

Note that in the case $C ={\mathrm{Conv ~}} \{a_{i}, \i = 1, \dots, m\}$ , scheme (7.2.9) can be implemented efficiently in the same style as (7.2.7). We leave the derivation of this modification and its complexity analysis as an exercise for the reader. The starting rounding ellipsoid for such a set C can be chosen as follows.

Lemma 7.2.3 Assume that the set $C = Con \nu \ \{a_{i}, \i = 1,..., m\}$ has nonempty interior. Define

$$
\hat{a} = \textstyle \frac{1}{m} \sum_{i = 1}^{m} a_{i}, \quad{\cal G} = \frac{1}{\mathbb{R}^{2}} \sum_{i = 1}^{m}(a_{i} - \hat{a})(a_{i} - \hat{a})^{T},
$$

where $R = \sqrt{m(m - 1)}$ . Then $W_{1}(\widehat{a}, G) \subset C \subset W_{R}(\widehat{a}, G)$

Proof For any $x \in \mathbb{R}^{n}$ and $r > 0$ , we have

$$
\xi_{W_{r}(\hat{a}, G)}(x) = \langle \hat{a}, x \rangle + r \| x \|_{G} = \langle \hat{a}, x \rangle + \frac{r}{R} \left[\sum_{i = 1}^{m} \langle a_{i} - \hat{a}, x \rangle^{2} \right]^{1 / 2}.
$$

Thus, we have $\xi_{W_{R}(\widehat{a}, G)}(x) \ \geq \ \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle = \xi_{C}(x)$ . Hence, $W_{R}(\hat{a}, G) ~ \supset ~ C$ Further, let

$$
\tau_{i} = \langle a_{i} -{\hat{a}}, x \rangle, \quad i = 1, \dots, m, \quad{\mathrm{and}}
$$

$$
\hat{\tau} = \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle - \langle \hat{a}, x \rangle \geq 0.
$$

Note that $\sum_{i = 1}^{m} \tau_{i} = 0$ and $\tau_{i} \leq \hat{\tau}$ for all i. Therefore,

$$
\begin{array}{rl} &{\xi_{W_{1}(\widehat{a}, G)}(x) - \langle \widehat{a}, x \rangle \le \displaystyle \frac{1}{R} \operatorname{max}_{\tau_{i}} \left\{\left[\displaystyle \sum_{i = 1}^{m} \tau_{i}^{2} \right]^{1 / 2} : \displaystyle \sum_{i = 1}^{m} \tau_{i} = 0, \tau_{i} \le \widehat{\tau}, \i = 1, \dots, m \right\}} \\ &{\quad \quad \quad \quad = \displaystyle \frac{\widehat{\tau}}{R} \sqrt{m(m - 1)} = \displaystyle \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle - \langle \widehat{a}, x \rangle} \\ &{\quad \quad \quad \quad = \xi_{C}(x) - \langle \widehat{a}, x \rangle.} \end{array}
$$

Thus, in view of Corollary 3.1.5, $W_{1}(\hat{a}, G) \subset C$ .

Remark 7.2.2 In the same way as it was done in Remark 7.2.1, we can use algorithm (7.2.9) to prove John’s Theorem for general convex sets. We leave this reasoning as an exercise for the reader.

## 7.2.1.3 Sign-Invariant Convex Sets

We call a set $C \subset \mathbb{R}^{n}$ sign-invariant if, for any point $g$ from $C,$ an arbitrary change of signs of its entries leaves the point inside C. In other words, for any $g \in C \cap \mathbb{R}_{+}^{n}$ , we have

$$
B(g) \equiv \{s \in \mathbb{R}^{n} : - g \leq s \leq g\} \subseteq C.
$$

Examples of such sets are given by unit balls of $\ell_{p}{\mathrm{- norms}}$ or by Euclidean norms generated by diagonal matrices.

Clearly, any sign-invariant set is centrally symmetric. Thus, in view of Lemma 7.2.1, for such a set there exists a ${\sqrt{n}} -$ -ellipsoidal rounding (this is John’s Theorem). We will see that an important additional feature of sign-invariant sets is that the matrix of the corresponding quadratic form can be diagonal.

Let $D \ \succ \0$ be a diagonal matrix. Let us choose an arbitrary vector $g \in \mathbb{R}_{+}^{n}$ Define

$$
C ={\mathrm{Conv ~}} \{W_{1}(D), B(g)\},
$$

$$
G(\alpha) =(1 - \alpha) D + \alpha D^{2}(g).
$$

Clearly C is a sign-invariant set. Consider the function

$$
V(\alpha) = \ln \frac{\operatorname{det} G(0)}{\operatorname{det} G(\alpha)} \ = \ - \sum_{i = 1}^{n} \ln \left(1 + \alpha(\tau_{i} - 1) \right), \quad \alpha \in[0, 1),
$$

where $\begin{array}{r}{\tau_{i} ~ = ~ \frac{(g^{(i)})^{2}}{D^{(i)}}, i ~ = ~ 1, \dots, n} \end{array}$ . Note that $V(\cdot)$ is a standard self-concordant function (see Sect. 5.1). For our analysis it is important that

$$
V^{\prime}(0) = n - \sum_{i = 1}^{n} \tau_{i} = n - \left(\| g \|_{D}^{*} \right)^{2}, \quad{\mathrm{and}}\tag{7.2.12}
$$

$$
V^{\prime \prime}(0) = \sum_{i = 1}^{n}(\tau_{i} - 1)^{2}.
$$

Lemma 7.2.4 For any $\alpha \in[0, 1], W_{1}(G(\alpha)) \subseteq C$ . Assuming that $(\| g \|_{D}^{*})^{2} > n$ define the step

$$
\begin{array}{r}{\alpha^{*} \overset{\mathrm{def}}{=} \frac{(\Vert g \Vert_{D}^{*})^{2} - n}{(2(\Vert g \Vert_{D}^{*})^{2} - n) \cdot(\Vert g \Vert_{D}^{*})^{2}}.} \end{array}
$$

Then, $\alpha^{*} \in(0,{\frac{1}{n}}],$ , and for any $\gamma \in \left(1, \frac{1}{\sqrt{n}} \| g \|_{D}^{*} \right]$ we have

$$
\begin{array}{r}{V(\alpha^{*}) \le \ln \left(1 + \frac{\gamma^{2} - 1}{\gamma^{2}} \right) - \frac{\gamma^{2} - 1}{\gamma^{2}} < 0.} \end{array}\tag{7.2.13}
$$

Proof For any $\alpha \in[0, 1]$ and $x \in \mathbb{R}^{n}$ , we get

$$
\begin{array}{rl} &{[\xi_{W_{1}(G(\alpha))}(x)]^{2} =(1 - \alpha) \langle Dx, x \rangle + \alpha \displaystyle \sum_{i = 1}^{n}(g^{(i)} x^{(i)})^{2}} \\ &{\qquad \le(1 - \alpha) \langle Dx, x \rangle + \alpha \left(\displaystyle \sum_{i = 1}^{n} g^{(i)} \cdot | x^{(i)} | \right)^{2}} \\ &{\qquad \le \left[\operatorname{max} \{\xi_{W_{1}(D)}(x), \xi_{B(g)}(x)\} \right]^{2} =[\xi_{C}(x)]^{2}.} \end{array}
$$

Further, let $S = \sum_{i = 1}^{n} \tau_{i} =(\| g \|_{D}^{*})^{2}$ . By assumption, $S > n$ . Therefore,

$$
\begin{array}{l}{{V^{\prime \prime}(0) \leq \operatorname{max} \left\{\displaystyle \sum_{\tau}^{n}(\tau_{i} - 1)^{2} : \ \sum_{i = 1}^{n} \tau_{i} = S, \ \tau_{i} \geq 0, \i = 1 \dots n \right\}}} \\{{\mathrm{}}} \\{{\mathrm{} =(S - 1)^{2} + n - 1 \ < \S^{2}.}} \end{array}
$$

Since $V(\cdot)$ is a standard self-concordant function, by inequality (5.1.16) we have:

$$
\begin{array}{clcr}{{V(\alpha) \leq V(0) + \alpha \cdot V^{\prime}(0) + \omega_{*}(\alpha \cdot(V^{\prime \prime}(0))^{1 / 2})}} \\{{}} &{{}} \\{{}} &{{\leq - \alpha \cdot(S - n) + \omega_{*}(\alpha \cdot S),}} \end{array}\tag{7.2.14}
$$

where $\omega_{*}(\tau) = - \tau - \ln(1 - \tau)$ . By Theorem 2.1.1, the minimum of the right-hand side of this inequality is attained at the solution of the equation

$$
\begin{array}{r}{S - n = \frac{\alpha_{*} S^{2}}{1 - \alpha_{*} S}.} \end{array}
$$

Thus, $\alpha_{*} = \frac{S - n}{S \cdot(2S - n)} \ < \ \frac{1}{n}$ . By Lemma 5.1.4, the decrease of the right-hand side in (7.2.14) is equal to

$$
\begin{array}{r}{\omega \left(1 - \frac{n}{S} \right) \geq \omega(1 - \gamma^{- 2}),} \end{array}
$$

where $\omega(t) = t - \ln(1 + t)$ .

Corollary 7.2.1 For any sign-symmetric set $C \subset \mathbb{R}^{n}$ with nonempty interior, there exists a diagonal matrix $D \succ 0$ such that

$$
W_{1}(D) \subseteq C \subseteq W_{\sqrt{n}}(D).
$$

Proof For R big enough, the set $\{D \ \subset \0 \ : \quad W_{1}(D) \ \subseteq \C \ \subseteq \W_{R}(D)\}$ is nonempty, closed, and bounded. Therefore, the existence of <sup>√</sup>n-rounding follows from inequality (7.2.13).

For us, Corollary 7.2.1 is important because of the following consequence.

Lemma 7.2.5 Let all vectors $a_{i} \in \mathbb{R}^{n}, i = 1, \dots, m$ , have nonnegative coefficients. Assume that there exists a diagonal matrix $D \succ 0$ such that

$$
W_{1}(D) \subseteq Con \nu \ \{B(a_{i}), \i = 1, \ldots, m\} \subseteq W_{\gamma{\sqrt{n}}}(D)
$$

for certain $\gamma \geq 1$ . Then the function $f(x) = \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle$ satisfies the inequalities

$$
\| x \|_{D} \leq f(x) \leq \gamma{\sqrt{n}} \cdot \| x \|_{D} \quad \forall x \in \mathbb{R}_{+}^{n}.\tag{7.2.15}
$$

Proof Consider the function: $\begin{array}{rlr}{\hat{f}(x)} &{{} =} &{\underset{1 \leq i \leq m}{\operatorname{max}} \sum_{j = 1}^{n} a_{i}^{(j)} | x^{(j)} |} \end{array}$ . In view of Lemma 3.1.13, its subdifferential can be expressed as follows:

$$
\partial \hat{f}(0) = \mathrm{Conv} \ \{B(a_{i}), \i = 1, \ldots, m\}.
$$

Thus, for any $x \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rl} &{\| x \|_{D} = \operatorname{max}_{s} \{\langle s, x \rangle : s \in W_{1}(D)\} \ \leq \ \operatorname{max}_{s} \{\langle s, x \rangle : s \in \partial \hat{f}(0)\} \equiv \hat{f}(x)} \\ &{\qquad \quad \leq \operatorname{max}_{s} \{\langle s, x \rangle : s \in W_{\gamma \sqrt{n}}(D)\} \ = \ \gamma \sqrt{n} \cdot \| x \|_{D}.} \end{array}
$$

It remains to note that ${\hat{f}}(x) \equiv f(x)$ for all $x \in \mathbb{R}_{+}^{n}$ .

Corollary 7.2.2 Let $a_{i} \in \mathbb{R}_{+}^{n}, i = 1, \dots, m$ . Consider the set

$$
\mathcal{F} = \{x \in \mathbb{R}_{+}^{n} : \ \langle a_{i}, x \rangle \leq b_{i}, \i = 1, \dots, m\}
$$

with $b_{i} > 0, i = 1,..., m$ . Then there exists a diagonal matrix $D \succ 0$ such that

$$
W_{1}(D) \bigcap \mathbb{R}_{+}^{n} \subset \mathcal{F} \subset W_{\sqrt{n}}(D) \bigcap \mathbb{R}_{+}^{n}.\tag{7.2.16}
$$

Proof Consider $\begin{array}{r}{f(x) = \underset{1 \leq i \leq m}{\operatorname{max}} \frac{1}{b_{i}} \langle a_{i}, x \rangle} \end{array}$ . In view of Corollary 7.2.1 the assumptions of Lemma 7.2.5 are satisfied with $\gamma = 1$ . Since $\mathcal{F} = \{x \in \mathbb{R}_{+}^{n} : \f(x) \leq 1\}$ , the inclusions (7.2.16) follow from inequalities (7.2.15).

In this section, we are interested in finding a diagonal ellipsoidal rounding for the following sign-symmetric set:

$$
C = \mathrm{Conv} \ \{B(a_{i}), \i = 1,..., m\},\tag{7.2.17}
$$

where $a_{i} \in \mathbb{R}_{+}^{n} \setminus \{0\}, i = 1, \dots, m$ . Our main assumption on the data is as follows:

$$
{\hat{a}} \{\stackrel{\mathrm{def}}{=}} \{\frac{1}{m}} \sum_{i = 1}^{m} a_{i} \ > \0.
$$

Let $\hat{D} = D^{2}(\hat{a})$

Lemma 7.2.6 $W_{1}(\hat{D}) \subset C \subset W_{m \sqrt{n}}(\hat{D}).$

Proof Since $\hat{a} \in C$ , we have $W_{1}(\hat{D}) \subset B(\hat{a}) \subseteq C$ . On the other hand,

$$
C \subseteq B(m{\hat{a}}) \subset \left\{x \in \mathbb{R}^{n} : \sum_{i = 1}^{n} \left({\frac{x^{(i)}}{m{\hat{a}}^{(i)}}} \right)^{2} \leq n \right\} \ = \W_{m{\sqrt{n}}}({\hat{D}}).
$$

For the sign-symmetric set $C \subset \mathbb{R}^{n}$ defined by (7.2.17), consider the following algorithmic scheme which finds a diagonal rounding of radius $\gamma \sqrt{n}$ with

$$
\begin{array}{r}{\gamma > \left[1 + \frac{1}{\sqrt{n}} \right]^{1 / 2}.} \end{array}
$$

Set $D_{0} = \hat{D}.$   
For $k \geq 0$ iterate:   
1. Compute $i_{k} : \| a_{i_{k}} \|_{D_{k}}^{*} = r_{k} \overset{\mathrm{def}}{=} \operatorname{max}_{1 \leq i \leq m} \| a_{i} \|_{D_{k}}^{*}$   
2. If $r_{k} \le \gamma \sqrt{n}$ then Stop else   
β<sub>k</sub> $\sum$ j 1 n ( <sub>i</sub> a<sup>(j)</sup>)<sup>2</sup> 1 2 <sup>α</sup>k := <sub>βk+(r2k −n)β1/2k</sub> , r<sup>2</sup><sub>k −</sub>n   
D<sub>k 1</sub> (1  α<sub>k</sub>)D<sub>k</sub> α<sub>k</sub>D<sup>2</sup>(a<sub>i</sub> ).   
end.

(7.2.18)

Note that this scheme applies the rules described in Lemma 7.2.4 using the notation $\beta_{k}$ for $V^{\prime \prime}(0)$ . Therefore, exactly as in Theorems 7.2.1 and 7.2.2, we can prove the following statement.

Theorem 7.2.3 For $\gamma \geq \left[1 +{\frac{1}{\sqrt{n}}} \right]^{1 / 2}$ , the scheme (7.2.18) terminates at most after

$$
\begin{array}{r}{\left[\frac{\gamma^{2} - 1}{\gamma^{2}} - \ln \left(1 + \frac{\gamma^{2} - 1}{\gamma^{2}} \right) \right]^{- 1} \cdot n(\ln n + 2 \ln m)} \end{array}
$$

iterations.

Note that the number of operations during each iteration of the scheme (7.2.18) is proportional to the number of nonzero elements in the matrix $A = ( a _ { 1 } , \ldots , a _ { m } ) $

## 7.2.2 Minimizing the Maximal Absolute Value of Linear Functions

Consider the following problem of Linear Programming:

$$
\operatorname{min}_{y \in \mathbb{R}^{n - 1}} \ \operatorname{max}_{1 \leq i \leq m} | \langle \bar{a}_{i}, y \rangle - c_{i} |.\tag{7.2.19}
$$

Defining $a_{i} =(\bar{a}_{i}^{T}, - c_{i})^{T}, i = 1, \dots, m, x = \left(\begin{array}{l}{y} \\{\tau} \end{array} \right) \in \mathbb{R}^{n}$ and $\boldsymbol{d} = \boldsymbol{e}_{n}$ , we can rewrite this problem in a conic form (see Sect. 7.1):

$$
\mathrm{Find ~} f^{*} = \operatorname{min}_{x} \left\{f(x) \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{1 \leq i \leq m} | \langle a_{i}, x \rangle | : \ \langle d, x \rangle = 1 \right\}.\tag{7.2.20}
$$

In Sect. 7.1, in order to construct an ellipsoidal rounding for $\partial f(0)$ , we used the composite structure of the function $f(\cdot)$ . However, the radius of this rounding was quite large, of the order $O({\sqrt{m}})$ . Now, by method (7.2.4) we can efficiently precompute a rounding ellipsoid for this set which radius is proportional to $O({\sqrt{n}})$ . Let us show that this leads to a much more efficient minimization scheme.

Let us fix some $\gamma > 1$ . Assume that using the process (7.2.4) we managed to construct an ellipsoidal rounding for the centrally symmetric set $\partial f(0)$ of radius $\gamma \sqrt{n}$ n:

$$
W_{1}(G) \ \subseteq \ \partial f(0) \ \equiv \ \mathrm{Conv} \ \{\pm a_{i}, \i = 1, \dots, m\} \ \subseteq \W_{\gamma \sqrt{n}}(G).
$$

The immediate consequences are as follows:

$$
\| x \|_{G} \ \leq \f(x) \equiv \operatorname{sup}_{s} \{\langle s, x \rangle : s \in \partial f(0)\} \leq \gamma{\sqrt{n}} \cdot \| x \|_{G},\tag{7.2.21}
$$

$$
\| a_{i} \|_{G}^{*} \ \leq \ \gamma \sqrt{n}, \quad i = 1, \ldots, m.\tag{7.2.22}
$$

Let us now fix a smoothing parameter $\mu > 0$ . Consider the following approximation of the function $f(\cdot)$ :

$$
f_{\mu}(x) = \mu \ln \left(\sum_{i = 1}^{m} \left[e^{\langle a_{i}, x \rangle / \mu} + e^{- \langle a_{i}, x \rangle / \mu} \right] \right).
$$

Clearly $f_{\mu}(\cdot)$ is convex and continuously differentiable infinitely many times on $\mathbb{R}^{n}$ Moreover,

$$
f(x) \leq f_{\mu}(x) \leq f(x) + \mu \ln(2m), \quad \forall x \in \mathbb{R}^{n}.\tag{7.2.23}
$$

Finally, note that for any point x and any direction h from $\mathbb{R}^{n}$ we have

$$
\langle \nabla f_{\mu}(x), h \rangle = \sum_{i = 1}^{m} \lambda_{\mu}^{(i)}(x) \cdot \langle a_{i}, h \rangle,
$$

$$
\begin{array}{r}{\lambda_{\mu}^{(i)}(x) = \frac{1}{\omega_{\mu}(x)} \cdot \left(e^{\langle a_{i}, x \rangle / \mu} - e^{- \langle a_{i}, x \rangle / \mu} \right), \quad i = 1, \hdots, m,} \end{array}
$$

$$
\omega_{\mu}(x) = \sum_{i = 1}^{m} \left(e^{\langle a_{i}, x \rangle / \mu} + e^{- \langle a_{i}, x \rangle / \mu} \right).
$$

Therefore, the expression for the Hessian is as follows:

$$
\begin{array}{r}{\langle \nabla^{2} f_{\mu}(x) h, h \rangle = \frac{1}{\mu} \displaystyle \sum_{i = 1}^{m} \frac{\langle a_{i}, h \rangle^{2}}{\omega_{\mu}(x)} \left(e^{\langle a_{i}, x \rangle / \mu} + e^{- \langle a_{i}, x \rangle / \mu} \right) - \frac{1}{\mu} \left(\displaystyle \sum_{i = 1}^{m} \lambda_{\mu}^{(i)}(x) \cdot \langle a_{i}, h \rangle \right)^{2}.} \end{array}
$$

In view of (7.2.22), we have

$$
\begin{array}{r}{\langle \nabla^{2} f_{\mu}(x) h, h \rangle \leq \frac{1}{\mu} \left(\displaystyle \operatorname{max}_{1 \leq i \leq m} \| a_{i} \|_{G}^{*} \right)^{2} \cdot \| h \|_{G}^{2} \leq \frac{\gamma^{2} n}{\mu} \cdot \| h \|_{G}^{2}.} \end{array}
$$

In view of Theorem 2.1.6, this implies that the gradient of the function $f_{\mu}(\cdot)$ is Lipschitz continuous in the metric $\| \cdot \|_{G}$ with Lipschitz constant $\begin{array}{r}{L_{\mu} = \frac{\gamma^{2} n}{\mu}} \end{array}$

$$
\| \nabla f_{\mu}(x) - \nabla f_{\mu}(y) \|_{G}^{*} \leq L_{\mu} \| x - y \|_{G} \quad \forall x, y \in \mathbb{E}.
$$

Our approach is very similar to that of Sect. 7.1. Consider the problem

$$
\operatorname{min}_{x} \{\phi(x); x \in Q\},\tag{7.2.24}
$$

where $Q$ is a closed convex set and the differentiable convex function $\phi(\cdot)$ has a gradient which is Lipschitz continuous in the Euclidean norm $\| \cdot \|_{G}$ with constant L. Let us write down here the optimal method (2.2.63) for solving the problem (7.2.24).

Method $S(\phi, L, Q, G, x_{0}, N)$   
Set $v_{0} = x_{0}$ . For $k = 0, \ldots, N - 1$ do   
1. Set $\begin{array}{r}{y_{k} = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k}.} \end{array}$   
2. Compute $\nabla \phi(y_{k})$   
3. $\begin{array}{r}{v_{k + 1} = \arg \operatorname{min}_{v \in Q} \left[\langle \sum_{i = 0}^{k} \frac{i + 1}{2} \nabla \phi(y_{i}), v - x_{0} \rangle + \frac{L}{2} \| v - x_{0} \|_{G}^{2} \right],} \end{array}$   
4. $\begin{array}{r}{x_{k + 1} : = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k + 1}.} \end{array}$   
Return: $S(\phi, L, Q, G, x_{0}, N) \equiv x_{N}.$

(7.2.25)

In accordance with Theorem 6.1.2, the output of this scheme $x_{N}$ satisfies the following inequality

$$
\begin{array}{r}{\phi(x_{N}) - \phi(x_{\phi}^{*}) \leq \frac{2L \| x_{0} - x_{\phi}^{*} \|_{G}^{2}}{N(N + 1)},} \end{array}\tag{7.2.26}
$$

where $x_{\phi}^{*}$ is an optimal solution to problem (7.2.24).

As in Sect. 7.1, we are going to use the scheme (7.2.25) in order to compute an approximate solution to (7.2.20) with a certain relative accuracy $\delta > 0$ . Define

$$
\mathcal{Q}(r) = \{x \in \mathbb{R}^{n} : \ \langle d, x \rangle = 1, \ \| x \|_{G} \leq r\},
$$

$$
\begin{array}{r}{x_{0} = \frac{G^{- 1} d}{\langle d, G^{- 1} d \rangle},} \end{array}
$$

$$
\begin{array}{r}{\tilde{N} = \left\lfloor 2e \gamma \sqrt{2n \ln(2m)} \left(1 + \frac{1}{\delta} \right) \right\rfloor.} \end{array}
$$

Consider the following method.

$$
\begin{array}{rl} &{\frac{\mathrm{Set} \hat{\lambda}_{0}}{\mathrm{Por} t \i} = \lambda_{0}.} \\ &{\frac{\mathrm{Set} \hat{\lambda}_{1}}{\mathrm{Por} t \i}} \\ &{\mu_{t} : = \frac{\hat{\lambda}_{0}^{t} \left(\hat{\lambda}_{- 1} \right)}{2 \pi(1 - \hat{\lambda}_{0}) \ln(2m)}; L_{\mu_{t}} : = \frac{\hat{\lambda}_{2}^{t} \alpha_{t}}{\mu_{t}}.} \\ &{\hat{\lambda}_{t} : = S \left(\int_{\hat{\mu}_{t}} L_{\mu_{t}}, Q(f(\hat{x}_{t - 1})), G, x_{0}, \tilde{N} \right);} \\ &{\mathrm{If} \(\hat{x}_{t}) \geq \frac{1}{\varepsilon} f(\hat{x}_{t - 1}) \mathrm{~ then ~} T : = \mathrm{~ r ~ and ~} \mathrm{Stop}.} \end{array}\tag{7.2.27}
$$

Theorem 7.2.4 The number of points generated by method (7.2.27) is bounded as follows:

$$
T \leq 1 + \ln(\gamma{\sqrt{n}}).\tag{7.2.28}
$$

The last point of the process satisfies inequality $f(\hat{x}_{T}) ~ \leq ~(1 + \delta) f^{*}$ . The total number of lower-level steps in the process (7.2.27) does not exceed

$$
\begin{array}{r}{2 \gamma e(1 + \ln(\gamma \sqrt{n})) \sqrt{2n \ln(2m)} \left(1 + \frac{1}{\delta} \right).} \end{array}\tag{7.2.29}
$$

Proof Let $x^{*}$ be an optimal solution to the problem (7.2.20). Note that all points $\hat{x}_{t}$ generated by (7.2.27) are feasible for (7.2.20). Therefore, in view of (7.2.21)

$$
f({\hat{x}}_{t}) \geq f^{*} \geq \| x^{*} \|_{G}.
$$

Thus, $x^{*} \in Q(f(\hat{x}_{t}))$ for any $t \geq 0$ . Let

$$
f_{t}^{*} = f_{\mu_{t}}(x_{t}^{*}) = \operatorname{min}_{x} \{f_{\mu_{t}}(x) : x \in Q(f(\hat{x}_{t - 1}))\}.
$$

Since $x^{*} \in Q(f(\hat{x}_{t}))$ , in view of (7.2.23) we have

$$
f_{t}^{*} \leq f_{\mu_{t}}(x^{*}) \leq f^{*} + \mu_{t} \ln(2m).
$$

By the first part of (7.2.23), $f(\hat{x}_{t}) \leq f_{\mu_{t}}(\hat{x}_{t})$ . Note that

$$
\| x_{0} - x_{t}^{*} \|_{G} ~ \leq ~ \| x_{t}^{*} \|_{G} ~ \leq ~ f(\hat{x}_{t - 1}), ~ t \geq 1.
$$

## 7.2 Rounding of Convex Sets

In view of (7.2.26), we have at the last iteration $T$

$$
\begin{array}{rl} &{f(\hat{x}_{T}) - f^{*} \leq f_{\mu_{T}}(\hat{x}_{T}) - f_{T}^{*} + \mu_{T} \ln(2m)} \\ &{\qquad \leq \frac{2L_{\mu_{T}} f^{2}(\hat{x}_{T - 1})}{\left(\tilde{N} + 1 \right)^{2}} + \mu_{T} \ln(2m) \ = \ \frac{2 \gamma^{2} nf^{2}(\hat{x}_{T - 1})}{\mu_{T} \left(\tilde{N} + 1 \right)^{2}} + \mu_{T} \ln(2m)} \\ &{\qquad \leq \frac{f^{2}(\hat{x}_{T - 1}) \delta^{2}}{4 \mu_{T} e^{2} \ln(2m)(1 + \delta)^{2}} + \mu_{T} \ln(2m) \ = \2 \mu_{T} \ln(2m).} \end{array}
$$

Further, in view of the choice of $\mu_{t}$ and the stopping criterion in (7.2.27), we have

$$
\begin{array}{r}{2 \mu_{T} \ln(2m) = \frac{\delta f(\hat{x}_{T - 1})}{e(1 + \delta)} \leq \frac{\delta f(\hat{x}_{T})}{1 + \delta}.} \end{array}
$$

Thus $f(\hat{x}_{T}) \leq(1 + \delta) f^{*}$

It remains to prove the estimate (7.2.28) for the number of steps in the upper-level of the process. Indeed, by a simple induction it is easy to prove that at the beginning of stage t the following inequality holds:

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{t - 1} f(x_{0}) \geq f(\hat{x}_{t - 1}), \quad t \geq 1.} \end{array}
$$

Note that $x_{0}$ is the projection of the origin on the hyperplane $\langle d, x \rangle = 1$ . Therefore, in view of inequalities (7.2.21), we have

$$
f^{*} \geq \| x^{*} \|_{G} \geq \| x_{0} \|_{G} \geq \frac{1}{\gamma \sqrt{n}} f(x_{0}).
$$

Thus, at the final step of the scheme we have

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{T - 1} f(x_{0}) \geq f(\hat{x}_{T - 1}) \geq f^{*} \geq \frac{1}{\gamma \sqrt{n}} f(x_{0}).} \end{array}
$$

This leads to the bound (7.2.28).

Recall that the preliminary stage of method (7.2.27), that is, the computation of $\gamma{\sqrt{n}}{\mathrm{- rounding}}$ for $\partial f(0)$ with relative accuracy $\gamma > 1$ , can be performed by procedure (7.2.4) in

$$
\begin{array}{r}{\frac{n^{2}}{6}(n + 6m) + \frac{\gamma^{2}}{(\gamma - 1)^{2}} n^{2}(2m + 3n) \ln m \ = \O(n^{2}(n + m) \ln m)} \end{array}
$$

arithmetic operations. Since each step of method (7.2.25) takes $O(mn)$ operations, the complexity of the preliminary stage is dominant if δ is not too small, say $\begin{array}{r}{\delta > \frac{1}{\sqrt{n}}} \end{array}$

## 7.2.3 Bilinear Matrix Games with Non-negative Coefficients

Let $A = ( a _ { 1 } , \ldots , a _ { m } ) $ be an n m-matrix with nonnegative coefficients. Consider the problem

$$
{\mathrm{Find ~}} f^{*} = \operatorname{min}_{x \in \varDelta_{n}} \left\{f(x){\stackrel{\mathrm{def}}{=}} \operatorname{max}_{1 \leq i \leq m} \langle a_{i}, x \rangle \right\}.\tag{7.2.30}
$$

Note that this format can be used for different standard problem settings. Consider, for example, the linear packing problem

$$
\mathrm{Find} \ \psi^{*} = \operatorname{max}_{y \in \mathbb{R}_{+}^{n}} \left\{\langle c, y \rangle : \ \langle a_{i}, y \rangle \leq b^{(i)}, \i = 1, \dots, m \right\},
$$

where all entries of vectors $a_{i}$ are non-negative, $b > 0 \in \mathbb{R}^{m}$ , and $c > 0 \in \mathbb{R}^{n}$ . Then

$$
\begin{array}{rl} &{\psi^{*} = \underset{y \in \mathbb{R}_{+}^{n}}{\operatorname{max}} \left.\langle c, y \rangle : \underset{1 \leq i \leq m}{\operatorname{max}} \frac{1}{b^{(i)}} \langle a_{i}, y \rangle \leq 1 \right.= \underset{y \in \mathbb{R}_{+}^{n}}{\operatorname{max}} \frac{\langle c, y \rangle}{\underset{1 \leq i \leq m}{\operatorname{max}} \frac{1}{b^{(i)}} \langle a_{i}, y \rangle}} \\ &{\quad = \Bigg[\underset{y \in \mathbb{R}_{+}^{n}}{\operatorname{min}} \left.\underset{1 \leq i \leq m}{\operatorname{max}} \frac{1}{b^{(i)}} \langle a_{i}, y \rangle : \langle c, y \rangle = 1 \right.\Bigg]^{- 1}} \\ &{\quad = \Bigg[\underset{x \in \Delta_{n}}{\operatorname{min}} \underset{1 \leq i \leq m}{\operatorname{max}} \frac{1}{b^{(i)}} \langle D^{- 1}(c) a_{i}, x \rangle \Bigg]^{- 1}.} \end{array}
$$

As usual, we can approximate the objective function $f(\cdot)$ in (7.2.30) by the following smooth function:

$$
f_{\mu}(x) = \mu \ln \left(\sum_{i = 1}^{m} e^{\langle a_{i}, x \rangle / \mu} \right).
$$

In this case, the following relations hold:

$$
f(x) \leq f_{\mu}(x) \leq f(x) + \mu \cdot \ln m, \quad \forall x \in \mathbb{R}^{n}.\tag{7.2.31}
$$

Define

$$
{\hat{f}}(x) = \operatorname{max}_{1 \leq i \leq m} \sum_{j = 1}^{n} a_{i}^{(j)} | x^{(j)} |.
$$

Note that the subdifferential of the homogeneous function ${\hat{f}}(\cdot)$ at the origin is as follows:

$$
\partial f(0) = \mathrm{Conv} \ \{B(a_{i}), \i = 1, \ldots, m\}.
$$

In Sect. 7.2.1.3, we have seen that it is possible to compute a diagonal matrix $D \succ 0$ such that

$$
W_{1}(D) \subseteq \partial \hat{f}(0) \ \subseteq \W_{2 \sqrt{n}}(D),
$$

(this corresponds to the choice $\gamma = 2$ in scheme (7.2.18)). In view of Lemma 7.2.5, using this matrix we can define a Euclidean norm $\| \cdot \|_{D}$ such that

$$
\| x \|_{D} \leq f(x) \ \leq \2{\sqrt{n}} \cdot \| x \|_{D}, \quad \forall x \in \mathbb{R}_{+}^{n}.\tag{7.2.32}
$$

Moreover, in this norm the sizes of all $a_{i}$ are bounded by $2{\sqrt{n}}.$

Now, using the same reasoning as in Sect. 7.2.2, we can show that for any x and $h$ from $\mathbb{R}^{n}$

$$
\begin{array}{r}{\langle \nabla^{2} f_{\mu}(x) h, h \rangle \leq \frac{4n}{\mu} \cdot \| h \|_{D}^{2}.} \end{array}
$$

Hence, the gradient of this function is Lipschitz continuous with respect to the norm $\| \cdot \|_{D}$ with constant $\frac{4n}{u}$ . This implies that the function $f_{\mu}(\cdot)$ can be minimized by the efficient method (6.1.19).

Let us fix some relative accuracy $\delta > 0$ . Define

$$
Q(r) = \{x \in \varDelta_{n} : \| x \|_{D} \leq r\},
$$

$$
\begin{array}{r}{x_{0} = \frac{D^{- 1} \bar{e}_{n}}{\langle \bar{e}_{n}, D^{- 1} \bar{e}_{n} \rangle},} \end{array}
$$

$$
\begin{array}{r}{\tilde{N} = \left\lfloor 4e \sqrt{2n \ln m} \left(1 + \frac{1}{\delta} \right) \right\rfloor.} \end{array}
$$

Consider the following method.

$$
\begin{array}{rl} &{\mathrm{set} \ \hat{x}_{0} = x_{0},} \\ &{\mathrm{For} t \succeq \mathrm{lierate :}} \\ &{\mu_{t} : = \frac{g_{f}(\hat{x}_{t - 1})}{2 \varepsilon(1 + \mathrm{binm :}}, \quad L_{\mu} : = \frac{4u_{t}}{\mu_{t}};} \\ &{\hat{x}_{t} : = S \left(f_{\mu_{t}}, L_{\mu_{t}}, Q(f(\hat{x}_{t - 1})), D, x_{0}, \tilde{N} \right);} \\ &{\mathrm{If} \(\hat{x}_{t}) \succeq \frac{1}{\varepsilon} f(\hat{x}_{t - 1}) \mathrm{then} T : = t \mathrm{and} \ \mathrm{Stop}.} \end{array}\tag{7.2.33}
$$

Justification of this scheme is very similar to that of (7.2.27).

Theorem 7.2.5 The number of points generated by method (7.2.27) is bounded as follows:

$$
T \leq 1 + \ln(2{\sqrt{n}}).\tag{7.2.34}
$$

The last point of the process satisfies the inequality $f(\hat{x}_{T}) \leq(1 + \delta) f^{*}$ . The total number of lower-level steps in the process (7.2.27) does not exceed

$$
\begin{array}{r}{4e(1 + \ln(2 \sqrt{n})) \sqrt{2n \ln m} \left(1 + \frac{1}{\delta} \right).} \end{array}\tag{7.2.35}
$$

Proof Let $x^{*}$ be an optimal solution to the problem (7.2.30). Note that all points $\hat{x}_{t}$ generated by (7.2.33) are feasible. Therefore, in view of (7.2.32),

$$
f({\hat{x}}_{t}) \geq f^{*} \geq \| x^{*} \|_{D}.
$$

Thus, $x^{*} \in Q(f(\hat{x}_{t}))$ for any $t \geq 0$ . Define

$$
f_{t}^{*} = f_{\mu_{t}}(x_{t}^{*}) = \operatorname{min}_{x} \{f_{\mu_{t}}(x) : x \in Q(f(\hat{x}_{t - 1}))\}.
$$

Since $x^{*} \in Q(f(\hat{x}_{t}))$ , in view of (7.2.31), we have

$$
f_{t}^{*} \leq f_{\mu_{t}}(x^{*}) \leq f^{*} + \mu_{t} \ln m.
$$

By the first part of (7.2.31) $f(\hat{x}_{t}) \leq f_{\mu_{t}}(\hat{x}_{t})$ . Note that

$$
\| x_{0} - x_{t}^{*} \|_{D} \leq \| x_{t}^{*} \|_{D} \leq f(\hat{x}_{t - 1})
$$

for all $t \geq 1$ . Thus, in view of (7.2.26), at the last iteration T , we have:

$$
\begin{array}{rl} &{f(\hat{x}_{T}) - f^{*} \leq f_{\mu_{T}}(\hat{x}_{T}) - f_{T}^{*} + \mu_{T} \ln m \ \leq \ \frac{2L_{\mu_{T}} f^{2}(\hat{x}_{T - 1})}{\big(\tilde{N} + 1 \big)^{2}} + \mu_{T} \ln m} \\ &{} \\ &{\qquad = \frac{8nf^{2}(\hat{x}_{T - 1})}{\mu_{T} \left(\tilde{N} + 1 \right)^{2}} + \mu_{T} \ln m \ \leq \ \frac{f^{2}(\hat{x}_{T - 1}) \delta^{2}}{4 \mu_{T} e^{2} \ln m(1 + \delta)^{2}} + \mu_{T} \ln m} \\ &{} \\ &{\qquad = 2 \mu_{T} \ln m.} \end{array}
$$

Further, in view of the choice of $\mu_{T}$ and the stopping criterion, we have

$$
\begin{array}{r}{2 \mu_{T} \ln m = \frac{\delta f(\hat{x}_{T - 1})}{e(1 + \delta)} \ \leq \ \frac{\delta f(\hat{x}_{T})}{1 + \delta}.} \end{array}
$$

Thus, $f(\hat{x}_{T}) \leq(1 + \delta) f^{*}$

It remains to prove the estimate (7.2.34) for the number of steps of the upperlevel process. Indeed, by simple induction it is easy to prove that at the beginning of stage t the following inequality holds:

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{t - 1} f(x_{0}) \geq f(\hat{x}_{t - 1}), \quad t \geq 1.} \end{array}
$$

Note that $x_{0}$ is the projection of the origin at the hyperplane $\langle \bar{e}_{n}, x \rangle = 1$ . Therefore, in view of inequalities (7.2.32), we have

$$
\begin{array}{r}{f^{*} \geq \| x^{*} \|_{D} \geq \| x_{0} \|_{D} \geq \frac{1}{2 \sqrt{n}} f(x_{0}).} \end{array}
$$

Thus, at the last step of the scheme we have

$$
\begin{array}{r}{\left(\frac{1}{e} \right)^{T - 1} f(x_{0}) \geq f(\hat{x}_{T - 1}) \ \geq \f^{*} \ \geq \ \frac{1}{2 \sqrt{n}} f(x_{0}).} \end{array}
$$

This leads to the bound (7.2.34).

Thus, we have seen that the scheme (7.2.33) needs $O \left({\frac{\sqrt{n \ln m}}{\delta}} \ln n \right)$ iterations of the gradient scheme (7.2.25). Since the matrix D is diagonal, each iteration of this scheme is very cheap. Its complexity is proportional to the number of nonzero elements in the matrix A. Note also that in Step 3 of scheme (7.2.25) it is necessary to compute projections onto the set $Q(r)$ , which is an intersection of the simplex and a diagonal ellipsoid. However, since D is a diagonal matrix, this can be done in O(n ln n) operations by relaxing the only equality constraint and arranging a onedimensional search in the corresponding Lagrange multiplier.

## 7.2.4 Minimizing the Spectral Radius of Symmetric Matrices

For a matrix $X \in \mathbb{S}_{n}$ , define its spectral radius:

$$
\begin{array}{l}{\rho(X) = \displaystyle \operatorname{max}_{1 \leq i \leq n} | \lambda^{(i)}(X) | ~ = ~ \operatorname{max} \{\lambda^{(1)}(X), - \lambda^{(n)}(X)\}} \\{~} \\{= \displaystyle \operatorname{min} \{\tau : ~ \tau I_{n} \succeq \pm X\}.} \end{array}
$$

In view of Theorem 3.1.7, $\rho(X)$ is a convex function on $\mathbb{S}_{n}$ . In this section, we consider the following optimization problem:

$$
\operatorname{Find} \phi_{*} = \operatorname{min}_{y \in Q} \{\phi(y) \stackrel{\mathrm{def}}{=} \rho(A(y))\},\tag{7.2.36}
$$

where $Q \subset \mathbb{R}^{m}$ is a closed convex set separated from the origin, and $A(\cdot)$ is a linear operator from $\mathbb{R}^{m}$ to $\mathbb{S}_{n}$ :

$$
A(y) = \sum_{i = 1}^{m} y^{(i)} A_{i} \ \in \ \mathbb{S}_{n}, \quad y \in \mathbb{R}^{m}.
$$

We assume that matrices $\{A_{i}\}_{i = 1}^{m}$ are linearly independent. Hence, the matrix $G \in$ $\mathbb{S}_{m}$ with elements

$$
G^{(i, j)} = \langle A_{i}, A_{j} \rangle_{M}, \quad i, j = 1, \dots, m,
$$

is positive definite. Denote by r the maximal rank of $A(y)$ :

$$
r = \operatorname{max}_{y \in \mathbb{R}^{m}} \operatorname{rank} A(y) \ \leq \ \operatorname{min} \left\{n, \sum_{i = 1}^{m} \operatorname{rank} A_{i} \right\}.
$$

We are going to solve (7.2.36) using a variant of the smoothing technique, which is applicable for solving structural convex optimization problems in relative scale. Note that in view of our assumptions $\phi^{*}$ is strictly positive.

First of all, we approximate a non-smooth objective function in (7.2.36) by a smooth one. For that, we use $F_{p}(X)$ defined by (6.3.6). Note that

$$
\begin{array}{rl} &{F_{p}(X) = \frac{1}{2} \langle X^{2p}, I_{n} \rangle_{M}^{1 / p} \ \geq \ \frac{1}{2} \rho^{2}(X),} \\ &{} \\ &{F_{p}(X) \leq \frac{1}{2} \rho^{2}(X) \cdot(\operatorname{rank} X)^{1 / p}.} \end{array}\tag{7.2.37}
$$

Consider the problem

$$
{\mathrm{Find ~}} f_{p}^{*} = \operatorname{min}_{y \in \mathbb{R}^{m}} \{f_{p}(y) \{\stackrel{\mathrm{def}}{=}} \F_{p}(A(y)) \colon y \in Q\}.\tag{7.2.38}
$$

From (7.2.37), we can see that

$$
\begin{array}{r}{\frac{1}{2} \phi_{*}^{2} \le f_{p}^{*} \le \frac{1}{2} \phi_{*}^{2} \cdot r^{1 / p}.} \end{array}\tag{7.2.39}
$$

Our goal is to find a point $\bar{y} \in Q$ which solves (7.2.36) with relative accuracy $\delta > 0 \mathrm{:}$

$$
\phi(\bar{y}) \ \leq \(1 + \delta) \phi_{*}.
$$

Let us choose an integer p which satisfies the following inequality

$$
\begin{array}{r}{p(\delta) \stackrel{\mathrm{def}}{=} \frac{1 + \delta}{\delta} \ln r \leq p \leq 2p(\delta).} \end{array}\tag{7.2.40}
$$

Assume that $\bar{y} \in \textit{Q}$ solves (7.2.38) with relative accuracy δ. Then, in view of (7.2.37) and (7.2.39), we have

$$
\begin{array}{l}{{\phi(\bar{y}) / \phi_{*} \leq r^{\frac{1}{2p}} \cdot \sqrt{f_{p}(\bar{y}) / f_{p}^{*}} \leq r^{\frac{1}{2p}} \cdot \sqrt{1 + \delta}}} \\{{\}} \\{{\leq e^{\frac{\delta}{2(1 + \delta)}} \cdot \sqrt{1 + \delta} \leq 1 + \delta.}} \end{array}
$$

Thus, we need to estimate the efficiency of method (6.1.19) as applied to the problem (7.2.38). Let us introduce the following norm

$$
\| h \|_{G} = \langle Gh, h \rangle^{1 / 2}, \quad h \in \mathbb{R}^{m}.
$$

Assuming that $p(\delta) \ge 1$ and using the estimate (6.3.8) and notation of Sect. 6.3.1, for any $y$ and h from $\mathbb{R}^{m}$ we get

$$
\begin{array}{rl} &{\langle \nabla^{2} f_{p}(y) h, h \rangle = \langle \nabla^{2} F_{p}(A(y)) A(h), A(h) \rangle_{M}} \\ &{\qquad \leq(2p - 1) \| A(h) \|_{(2p)}^{2} \leq(2p - 1) \| A(h) \|_{(2)}^{2}} \\ &{\qquad =(2p - 1) \langle A(h), A(h) \rangle_{M} =(2p - 1) \langle Gh, h \rangle} \\ &{\qquad =(2p - 1) \| h \|_{G}^{2}.} \end{array}
$$

Thus, in view of Theorem 2.1.6 function $f_{p}(y)$ has Lipschitz continuous gradient on $\mathbb{R}^{m}$ with respect to the norm $\| \cdot \|_{G}$ with Lipschitz constant

$$
L = 2p - 1 \leq 4p(\delta).\tag{7.2.41}
$$

On the other hand, for any $X \in \mathbb{S}_{n}$ with rank $X \le r$ , and $p \geq 1$ we have

$$
\begin{array}{r}{\frac 1r \| X \|_{(2)}^{2} \leq \| X \|_{(\infty)}^{2} \leq \| X \|_{(2p)}^{2}.} \end{array}
$$

Hence, $\begin{array}{r}{\frac{1}{2r} \| y \|_{G}^{2} \le f_{p}(y)} \end{array}$ for any $y \in \mathbb{R}^{m}$ . In particular,

$$
\begin{array}{r}{\frac{1}{2r} \| y_{p}^{*} \|_{G}^{2} \leq f_{p}^{*},} \end{array}\tag{7.2.42}
$$

where $y_{p}^{*}$ is an optimal solution to (7.2.38).

Let $x_{0} = \arg \operatorname{min}_{y \in \mathcal{Q}} \| y \|_{G}$ . Since the norm $\| \cdot \|_{G}$ is Euclidean, and $Q$ is convex, in view of inequality (2.2.49), we have

$$
\| y_{p}^{*} - x_{0} \|_{G}^{2} \leq \| y_{p}^{*} \|_{G}^{2} - \| x_{0} \|_{G}^{2} < \| y_{p}^{*} \|_{G}^{2}.
$$

Combining this inequality with estimate (7.2.42), we get

$$
\begin{array}{r}{\frac{1}{2} \| y_{p}^{*} - x_{0} \|_{G}^{2} \le \frac{1}{2} \| y_{p}^{*} \|_{G}^{2} \le rf_{p}^{*}.} \end{array}\tag{7.2.43}
$$

In order to apply method (2.2.63) to problem (7.2.38), let us choose the following prox-function:

$$
\begin{array}{r}{d(x) = \frac{1}{2} \| x - x_{0} \|_{G}^{2}.} \end{array}\tag{7.2.44}
$$

Note that the convexity parameter of this function is equal to one. Hence, in view of bounds (7.2.41), (7.2.42), and (6.1.21), method (6.1.19) launched from the starting point $x_{0}$ converges as follows:

$$
\begin{array}{r}{f_{p}(x_{k}) - f_{p}^{*} \leq \frac{16(1 + \delta) r \ln r}{\delta \cdot k(k + 1)} \cdot f_{p}^{*}.} \end{array}\tag{7.2.45}
$$

Hence, in order to solve problem (7.2.38) with relative accuracy $\delta$ (and, therefore, solve (7.2.36) with the same relative accuracy), method (6.1.19) needs at most

$$
\begin{array}{r}{\frac{4}{\delta} \sqrt{(1 + \delta) r \ln{r}}} \end{array}\tag{7.2.46}
$$

iterations. Note that this bound does not depend on the data size of the particular problem instance.

At each iteration of method (6.1.19) as applied to the problem (7.2.38) with $d(\cdot)$ defined by (7.2.44), it is necessary to compute a projection of a point onto the set Q with respect to the Euclidean metric $\| \cdot \|_{G}$ . This operation is easy in the following cases.

- The set $Q$ is an affine subspace in $\mathbb{R}^{m}$ . Then the projection can be computed by inverting the matrix G. An important example of such a problem is as follows:

$$
\operatorname{min}_{y \in \mathbb{R}^{m}} \left\{\rho \left(\sum_{i = 1}^{m} y^{(i)} A_{i} \right) : \y^{(1)} = 1 \right\}.
$$

- The matrix $G$ and the set $Q$ are both simple. For example, if $\langle A_{i}, A_{j} \rangle = 0$ for $i \neq j$ , then $G$ is a diagonal matrix. In this case, a projection onto a box, for example, is easy to compute. Such a situation occurs when the matrix $A(y)$ is parameterized directly by its entries.

Finally, note that the computation of the value and the gradient of the function $f_{p}(\cdot)$ can be done without eigenvalue decomposition of the matrix $A(y)$ . Indeed, let ${\dot{p}} = 2^{k}$ satisfy condition (7.2.40). Consider the following of sequence of matrices:

$$
X_{0} = A(y), Y_{0} = I_{n},\tag{7.2.47}
$$

$$
X_{i} = X_{i - 1}^{2}, \Y_{i} = Y_{i - 1} X_{i - 1}, i = 1, \dots, k.
$$

By induction, it is easy to see that $X_{k} ~ = ~ A^{p}(y)$ and $Y_{k} = A^{p - 1}(y)$ . Hence, in accordance with (6.3.3), (6.3.6), and the definition of the function $f_{p}(\cdot)$ in (7.2.38), we have:

$$
\begin{array}{r}{f_{p}(y) = \frac 12 \langle X_{k}, I_{n} \rangle_{M}^{2 / p},} \end{array}
$$

$$
\begin{array}{r}{\nabla f_{p}(y)^{(i)} = \frac{2f_{p}(y)}{\langle X_{k}, I_{n} \rangle_{M}} \cdot \langle Y_{k}, A_{i} \rangle_{M}, \quad i = 1, \dots, m.} \end{array}
$$

Note that the complexity of computing the matrix $A(y)$ is of the order of $O(n^{2} m)$ arithmetic operations. The auxiliary computation (7.2.47) takes

$$
O(n^{3} \ln p) = O \left(n^{3} \ln{\frac{\ln r}{\delta}} \right)
$$

operations. After that the vector $\nabla f_{p}(y)$ can be computed in $O(n^{2} m)$ arithmetic operations. Clearly, the complexity of the first and the last computation is much lower if the matrices $A_{i}$ are sparse.

Note also that the computation (7.2.47) can be performed more efficiently if the matrix $A(y)$ is represented in the form

$$
\boldsymbol{A}(\boldsymbol{y}) = \boldsymbol{U} \boldsymbol{T} \boldsymbol{U}^{T}, \quad \boldsymbol{U} \boldsymbol{U}^{T} = \boldsymbol{I}_{n},
$$

where $T$ is a tri-diagonal matrix. Computation of this representation needs $O(n^{3})$ arithmetic operations.

## 7.3 Barrier Subgradient Method

(Smoothing by a self-concordant barrier; The barrier subgradient scheme; Relative accuracy and maximization of positive concave functions; Applications: The fractional covering problem, the maximal concurrent flow problem, the minimax problem with nonnegative components, Semidefinite relaxation of the Boolean quadratic problem; Online Optimization as an alternative to Stochastic Programming.)

## 7.3.1 Smoothing by a Self-Concordant Barrier

In Nonlinear Optimization the performance of numerical methods strongly depends on our ability execute some auxiliary operations related to the convex sets involved in the problem’s formulation. Usually, the optimization methods assume the feasibility of one of the following actions:

L: Maximization of a linear function $\langle c, x \rangle$ over a convex set $Q$

S: Maximization of the function $\langle c, x \rangle - d(x)$ in $x \in Q$ , where d is a strongly convex prox-function of the set Q.

B: Computation of the value and first two derivatives of some self-concordant barrier at the interior points of the convex set $Q$

Note that in Structural Optimization we can always consider the optimization problem posed in a primal-dual setting. The most important example of such a representation is a bilinear saddle point formulation:

$$
\operatorname{min}_{x \in Q_{p}} \ \operatorname{max}_{w \in Q_{d}} \left\{\langle Ax, w \rangle + \langle c, x \rangle + \langle b, w \rangle \right\},\tag{7.3.1}
$$

where $Q_{p}$ and $Q_{d}$ are closed convex sets in corresponding spaces and A is a linear operator. Since the structure of the primal and dual sets may be of different complexity, we have six possible combinations of the above mentioned auxiliary operations. Let us present the known results on their complexity.

$\mathbf{L_{p}}{\otimes} \mathbf{L_{d}}$ . The complexity of this combination is still not clear.

$\bf S_{p} \otimes \bf S_{d}$ . This case is treated by the smoothing technique (see Chap. 6). An $\epsilon \mathrm{-}$ solution of the problem (7.3.1) can be obtained in

$$
O \left(\frac{1}{\epsilon} \cdot \| A \| \cdot[D_{1} D_{2}]^{1 / 2} \right)
$$

gradient steps, where $D_{1}$ and $D_{2}$ are the of the primal and dual sets, and the norm $\| A \|$ is defined by the norms of the primal and dual spaces.

$\mathbf{B_{p}} \otimes \mathbf{B_{d}}$ . In this situation, Interior-Point Methods provide an $\epsilon$-solution of the problem (7.3.1) in

$$
O \left(\sqrt{\nu} \cdot \ln \frac{\nu}{\epsilon} \right)
$$

Newton steps, where ν is the parameter of a self-concordant barrier for a primaldual feasible set $Q_{p} \times Q_{d}$ (see Chap. 5).

$\mathbf{S_{p}} \otimes \mathbf{L_{d}}$ . This case is similar to the standard Black-Box Nonsmooth Minimization. Primal-dual subgradient methods provide an $\epsilon$-solution to (7.3.1) in

$$
\begin{array}{r}{O \left(\frac{1}{\epsilon^{2}} \cdot \| A \|^{2} \cdot D_{1} \cdot D_{2} \right)} \end{array}
$$

gradient steps (see Sect. 3.2).

$\mathbf{B_{p}} \otimes \mathbf{S_{d}}$ . The complexity of this combination is not known yet.

$\mathbf{B_{p}} \otimes \mathbf{L_{d}}$ . The last variant is studied in this section. From the viewpoint of Black-Box Optimization, it corresponds to the problem of minimizing nonsmooth convex function over a feasible set endowed with a self-concordant barrier.

Let us recall our notation. For a linear operator $A : \mathbb{E} \mathbb{H}^{*}$ , we denote by $A^{*} : \mathbb{H} \mathbb{E}^{*}$ the adjoint operator:

$$
\langle Ax, y \rangle_{\mathbb{H}} = \langle A^{*} y, x \rangle_{\mathbb{E}}, \quad x \in \mathbb{E}, \y \in \mathbb{H}.
$$

If there is no ambiguity, the subscripts of scalar products are omitted. For a concave function $f_{:}$ , we denote by $\nabla f(x)$ one of its subgradients at x:

$$
f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle, \quad y, x \in \operatorname{dom} \f.
$$

For a function of two vector variables $\psi(u, x)$ , the notation $\nabla_{2} \psi(u, x)$ is used to denote its subgradient with respect to the second argument.

Let $Q \subset \mathbb{E}$ be a closed convex set containing no straight lines. We assume that $Q$ is endowed with a ν-self-concordant barrier $F$ (see Sect. 5.3). In view of Theorem 5.1.6, its Hessian is non-degenerate at all points of the domain.

Consider another closed convex set $\hat{P} \subseteq \mathbb{E}$ . We are mainly interested in the set

$$
P = \hat{P} \bigcap{Q},
$$

which we assume to be bounded. Denote by $x_{0}$ its constrained analytic center:

$$
x_{0} ~ = ~ \arg \operatorname{min}_{x \in P_{0}} F(x) ~ \in ~ P_{0} \stackrel{\mathrm{def}}{=} \hat{P} \bigcap \mathrm{int} ~{\cal Q} ~ \subseteq ~ P.\tag{7.3.2}
$$

Thus, $F(x) \geq F(x_{0})$ for all $x \in P$ . Since $Q$ contains no straight lines, $x_{0}$ is well defined (see Theorem 5.1.6).

For the set $P$ , we introduce the following smooth approximation of its support function:

$$
U_{\beta}(s) = \operatorname{max}_{u \in \hat{P}} \{\langle s, u - x_{0} \rangle - \beta[F(u) - F(x_{0})]\}, \quad s \in \mathbb{E}^{*},\tag{7.3.3}
$$

where $\beta > 0$ is a smoothing parameter. Denote by $u_{\beta}^{\star}(s)$ the unique solution of the maximization problem (7.3.3). Then, in view of relation (5.3.17) and Theorem 6.1.1, we have

$$
\nabla U_{\beta}(s) = u_{\beta}^{\star}(s) - x_{0}, \quad s \in \mathbb{E}^{*}.\tag{7.3.4}
$$

For any $x \in$ int $Q.$ , consider the following local norms:

$$
\| h \|_{x} = \langle \nabla^{2} F(x) h, h \rangle^{1 / 2}, \qquad h \in \mathbb{E},
$$

$$
\| s \|_{x}^{*} = \langle s,[\nabla^{2} F(x)]^{- 1} s \rangle^{1 / 2}, s \in \mathbb{E}^{*}.
$$

Then, we can guarantee the following level of smoothness of the function $U_{\beta}(\cdot)$

Lemma 7.3.1 Let $\beta ~ > ~ 0, ~ s ~ \in ~ \mathbb{E}^{*}$ and $x \ = \u_{\beta}^{\star}(s)$ . Then for any $g \in \mathbb{E}^{*}$ with $\| g \|_{x}^{*} < \beta$ we have

$$
\begin{array}{r}{U_{\beta}(s + g) \le U_{\beta}(s) + \langle g, \nabla U_{\beta}(s) \rangle + \beta \omega_{*}(\frac{1}{\beta} \| g \|_{x}^{*}),} \end{array}\tag{7.3.5}
$$

where $\begin{array}{r}{\omega_{*}(\tau) = - \tau - \ln(1 - \tau) \stackrel{(5.{l.2} 4)}{\leq}{\frac{\tau^{2}}{2(1 - \tau)}} for \tau \in[0, 1).} \end{array}$

Proof In view of definition (7.3.3) and Theorem 2.2.9, for any $y \in P_{0}$ we have

$$
\langle s - \beta \nabla F(x), y - x \rangle \leq 0.\tag{7.3.6}
$$

Moreover, since F is a standard self-concordant function, at any point $y \in$ int Q

$$
F(y) \geq F(x) + \langle \nabla F(x), y - x \rangle + \omega(\| y - x \|_{x}),\tag{7.3.7}
$$

where $\omega(t) = t - \ln(1 + t)$ (see inequality (5.1.14)). Hence,

$$
\begin{array}{rl} &{U_{\beta}(s + g) - U_{\beta}(s) -(\xi_{1}, \nabla U_{\beta}(s))} \\ &{\overset{(2, 4, 4)}{=} \underset{y \in \mathbb{R}}{\operatorname{max}} s + s, y - x_{0} - \beta[F(\mathbf{y}) - F(x_{0})] -(s + g, x - x_{0})} \\ &{} \\ &{\quad \quad + \beta[F(x) - F(x_{0})]]} \\ &{= \underset{y \in \mathbb{R}}{\operatorname{max}} s + g, y - x - \beta[F(y) - F(x)]} \\ &{\overset{(2, 3)}{=} \underset{y \in \mathbb{R}}{\operatorname{max}} s, g, y - x + \beta[\nabla F(x), y - x] - F(y) + F(x)]} \\ &{\overset{(3, 3)}{=} \underset{y \in \mathbb{R}}{\operatorname{max}} s, g, y - x - \beta \omega(| y - x |]_{x}) \leq \underset{x \in \mathbb{R}}{\operatorname{min}} \mathrm{Ig} \times \beta \omega(\tau).} \\ &{\overset{(3, 4)}{=} \underset{y \in \mathbb{R}}{\operatorname{max}} s, g, \mathbf{y} - x - \beta \omega(| y - x |]_{x}) \leq \underset{x \in \mathbb{R}}{\operatorname{min}} \mathrm{Ig} \times \beta \omega(\tau).} \end{array}
$$

If $\| g \|_{x}^{*} < \beta$ , then the supremum in the right-hand side is equal to $\beta \omega_{*}(\frac{1}{\beta} \| g \|_{x}^{*})$ (see Lemma 5.1.4).

Consider now an affine function $\ell(x), x \in P$ . For $\beta \geq 0$ define

$$
\ell^{\star}(\beta) ~ = ~ \operatorname{max}_{x \in{\cal P}_{0}} \{\ell(x) - \beta[F(x) - F(x_{0})]\} ~ \geq ~ \ell(x_{0}) ~ \stackrel{\mathrm{def}}{=} ~ \ell_{0}.\tag{7.3.8}
$$

Then $\ell^{\star}(0) = \operatorname{max}_{x \in P} \ell(x) \{\stackrel{\mathrm{def}}{=}} \ \ell^{\star}.$

Lemma 7.3.2 For any $\beta > 0$ we have

$$
\begin{array}{r}{\ell^{\star}(\beta) \leq \ell^{\star} \leq \ell^{\star}(\beta) + \beta \nu \left(1 + \left[\ln \frac{\ell^{\star} - \ell_{0}}{\beta \nu} \right]_{+} \right),} \end{array}\tag{7.3.9}
$$

where $[a]_{+} = \operatorname{max} \{a, 0\}$ . Moreover,

$$
\ell^{\star} - \ell_{0} \leq \left[\sqrt{\ell^{\star}(\beta) - \ell_{0}} + \sqrt{\beta \nu} \right]^{2}.\tag{7.3.10}
$$

Proof The first part of inequality (7.3.9) follows from definitions (7.3.2) and (7.3.8). Let us prove the second part. Consider an arbitrary $y^{\star} \in \operatorname{Argmax}_{x \in P} \ell(x)$ . Define

$$
y(\alpha) = x_{0} + \alpha(y^{\star} - x_{0}), \quad \alpha \in[0, 1].
$$

In view of inequality (5.3.14), we have

$$
F(y(\alpha)) \ \leq \F(x_{0}) - \nu \ln(1 - \alpha), \quad \alpha \in[0, 1).
$$

Since -( ) is linear, this relation implies that

$$
\begin{array}{rl} &{\ell^{\star}(\beta) \geq \underset{\alpha \in[0, 1]}{\operatorname{max}} \left.\ell(y(\alpha)) - \beta[F(y(\alpha)) - F(x_{0})] \right.} \\ &{} \\ &{\qquad \geq(1 - \alpha) \ell_{0} + \alpha \ell^{\star} + \beta \nu \ln(1 - \alpha), \quad \alpha \in[0, 1).} \end{array}\tag{7.3.11}
$$

The maximum in $\alpha$ of the latter expression is attained at $\begin{array}{r}{\alpha^{\star} = \left[1 - \frac{\beta \nu}{\ell^{\star} - \ell_{0}} \right]_{+}} \end{array}$ . Thus, if $\begin{array}{r}{\frac{\ell^{\star} - \ell_{0}}{\beta \nu} \leq 1} \end{array}$ (that is $\alpha^{\star} = 0)$ , then $\ell^{\star} \leq \ell_{0} + \beta \nu.$ and (7.3.9) follows from (7.3.8). If $\alpha^{\star} > 0$ , then we get (7.3.9) by direct substitution.

On the other hand, from (7.3.11) we have

$$
\begin{array}{r}{\ell^{\star} - \ell_{0} \leq \frac{1}{\alpha} \Big[\ell^{\star}(\beta) - \ell_{0} + \beta \nu \ln \Big(1 + \frac{\alpha}{1 - \alpha} \Big) \Big] \ \leq \ \frac{1}{\alpha}[\ell^{\star}(\beta) - \ell_{0}] + \frac{\beta \nu}{1 - \alpha}.} \end{array}
$$

Minimizing the latter expression in $\alpha,$ , we get (7.3.10).

Corollary 7.3.1 For any $\beta > 0$ we have

$$
\begin{array}{r}{\ell^{\star} \leq \ell^{\star}(\beta) + \beta \nu \left[1 + 2 \ln \left(1 + \sqrt{\frac{\ell^{\star}(\beta) - \ell_{0}}{\beta \nu}} \right) \right].} \end{array}\tag{7.3.12}
$$

## 7.3.2 The Barrier Subgradient Scheme

In this section, we consider convex optimization problems in the following form:

$$
{\mathrm{Find ~}} f_{\star} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{x} \{f(x) : x \in P\},\tag{7.3.13}
$$

where $f$ is a concave function and $P$ satisfies the structural assumptions specified at the beginning of Sect. 7.3.1. In the sequel, we assume $f$ to be subdifferentiable on $P_{0}$ and the set $P$ to be simple. The latter means that the auxiliary optimization problem (7.3.3) can be easily solved.

Consider now the generic scheme of the Barrier Subgradient Method (BSM).

Initialization: Set $s_{0} = 0 \in \mathbb{E}^{*}$   
Iteration $(k \geq 0)$   
1. Choose $\beta_{k} > 0$ and compute $x_{k} = u_{\beta_{k}}^{\star}(s_{k})$   
2. Choose $\lambda_{k} > 0$ and set $\boldsymbol{s}_{k + 1} = \boldsymbol{s}_{k} + \lambda_{k} \nabla f(\boldsymbol{x}_{k}).$

(7.3.14)

Recall that $u_{\beta}^{\star}(s)$ denotes the unique solution of the optimization problem (7.3.3).   
Thus, BSM is an affine-invariant scheme.

In order to analyze the performance of method (7.3.14), consider the following gap functions:

$$
\ell_{k}(y) = \sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{i}), y - x_{i} \rangle,
$$

$$
\ell_{k}^{\star} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{y \in P} \ \ell_{k}(y), \quad k \geq 0.
$$

Theorem 7.3.1 Assume that the parameters of scheme (7.3.14) satisfy the condition

$$
\begin{array}{r}{\lambda_{k} \| \nabla f(x_{k}) \|_{x_{k}}^{*} \ \le \ \beta_{k} \ \le \ \beta_{k + 1}, \quad k \ge 0.} \end{array}\tag{7.3.15}
$$

$LetS_{k} = \sum_{i = 0}^{k} \lambda_{i}$ , and $A_{k} = \sum_{i = 0}^{k} \beta_{i} \omega_{*} \left(\frac{\lambda_{i}}{\beta_{i}} \| \nabla f(x_{i}) \|_{x_{i}}^{*} \right)$ . Then, for any $k \geq 0$ we have

$$
\begin{array}{r}{\ell_{k}^{\star} \leq A_{k} + \beta_{k + 1} \nu \left[1 + 2 \ln \left(1 + \sqrt{\frac{A_{k}}{\beta_{k + 1} \nu} + 3 \frac{S_{k}}{\beta_{k + 1}} \| \nabla f(x_{0}) \|_{x_{0}}^{*}} \right) \right].} \end{array}\tag{7.3.16}
$$

Proof Note that for any $k \geq 0$ we have

$$
\begin{array}{rl} &{U_{\beta_{k + 1}}(s_{k + 1}) \stackrel{(7.3.15)}{\leq} U_{\beta_{k}}(s_{k + 1})} \\ &{\stackrel{(7.3.5)}{\leq} U_{\beta_{k}}(s_{k}) + \lambda_{k} \langle \nabla f(x_{k}), \boldsymbol{u}_{\beta_{k}}^{\star}(s_{k}) - \boldsymbol{x}_{0} \rangle + \beta_{k} \omega_{\ast} \left(\frac{\lambda_{k}}{\beta_{k}} \| \nabla f(x_{k}) \|_{x_{k}}^{\ast} \right).} \end{array}
$$

Since $U_{\beta_{0}}(0) = 0$ , we conclude that

$$
\begin{array}{rl} &{\langle s_{k + 1}, x_{k + 1} - x_{0} \rangle - \beta_{k + 1}[F(x_{k + 1}) - F(x_{0})] \ = \U_{\beta_{k + 1}}(s_{k + 1})} \\ &{} \\ &{\quad \le \ \displaystyle \sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{i}), x_{i} - x_{0} \rangle + \displaystyle \sum_{i = 0}^{k} \beta_{i} \omega_{*} \left(\frac{\lambda_{i}}{\beta_{i}} \| \nabla f(x_{i}) \|_{x_{i}}^{*} \right).} \end{array}\tag{7.3.17}
$$

In view of the first-order optimality condition for (7.3.3), for all $y \in P_{0}$ we have

$$
\langle s_{k + 1}, y - x_{k + 1} \rangle \ \leq \ \beta_{k + 1} \langle \nabla F(x_{k + 1}), y - x_{k + 1} \rangle.\tag{7.3.18}
$$

Note that $s_{k + 1} = \sum_{i = 0}^{k} \lambda_{i} \nabla f(x_{i})$ . Therefore, for any $y \in P_{0}$ we obtain

$$
\sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{i}), y - x_{i} \rangle \overset{(7.3.17)}{\leq} \langle s_{k + 1}, y - x_{k + 1} \rangle + \beta_{k + 1}[F(x_{k + 1}) - F(x_{0})] + A_{k}
$$

$$
\begin{array}{rl}{{\stackrel{(7.3.18)}{\leq} \beta_{k + 1}[F(x_{k + 1}) + \langle \nabla F(x_{k + 1}), y - x_{k + 1} \rangle - F(x_{0})]}} \\ &{} \\ &{+ A_{k}} \\ &{\leq \beta_{k + 1}[F(y) - F(x_{0})] + A_{k}.} \end{array}
$$

Hence, $\ell_{k}^{\star}(\beta_{k + 1}) \leq A_{k}$ . On the other hand, since $f$ is concave, we obtain

$$
\begin{array}{l}{l_{k}(x_{0}) = \displaystyle \sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{i}), x_{0} - x_{i} \rangle \ge \displaystyle \sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{0}), x_{0} - x_{i} \rangle} \\{\ge - \| \nabla f(x_{0}) \|_{x_{0}}^{*} \cdot \displaystyle \sum_{i = 0}^{k} \lambda_{i} \| x_{0} - x_{i} \|_{x_{0}}.} \end{array}
$$

In view of definition (7.3.2), we have $\langle \nabla F(x_{0}), x_{i} - x_{0} \rangle \geq 0$ . Hence, by Theorem 5.3.9, $\| x_{i} \ - \x_{0} \|_{x_{0}} \ \leq \ \nu + 2 \sqrt{\nu} \ \leq \3 \nu$ (recall that $\nu ~ \geq ~ 1$ by Lemma 5.4.1). Thus, we conclude that $\ell_{k}(x_{0}) \geq - 3 \nu S_{k} \| \nabla f(x_{0}) \|_{x_{0}}^{*}$ . Using our observations and inequality (7.3.12), we obtain (7.3.16).

Let us estimate now the rate of convergence of method (7.3.14) as applied to a specific problem class.

Definition 7.3.1 We say that $f \in \mathcal{B}_{M}(P) \mathrm{if} \| \nabla f(x) \|_{x}^{*} \ \leq \M$ for any $x \in P_{0}$

For a function $\begin{array}{r}{f \in \mathcal{B}_{M}(P)} \end{array}$ , we suggest the following values of parameters in (7.3.14):

$$
\begin{array}{r}{\lambda_{k} = 1, \k \ge 0, \qquad \beta_{0} = \beta_{1}, \quad \beta_{k} = M \cdot \left(1 + \sqrt{\frac{k}{\nu}} \right), \k \ge 1.} \end{array}\tag{7.3.19}
$$

Theorem 7.3.2 Let problem (7.3.13) with $\begin{array}{rlr}{f} &{{} \in} &{\mathcal{B}_{M}(P)} \end{array}$ be solved by method (7.3.14) with parameters given by (7.3.19). Then for any $k \geq 0$ we have

$$
\begin{array}{r}{\frac{1}{S_{k}} \ell_{k}^{\star} \leq 2M \cdot \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \cdot \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right).} \end{array}\tag{7.3.20}
$$

Proof Define $\begin{array}{r}{\tau_{k} = \frac{1}{M} \beta_{k} > 1} \end{array}$ . In view of the choice of parameters (7.3.19) and assumptions of the theorem, we have $S_{k} = k + 1$ , and

$$
\begin{array}{l}{{\displaystyle{\cal A}_{k} = \sum_{i = 0}^{k} \beta_{i} \omega_{*} \left(\frac{\lambda_{i}}{\beta_{i}} \| \nabla f(x_{i}) \|_{x_{i}}^{*} \right) \le M \sum_{i = 0}^{k} \tau_{i} \omega_{*} \left(\frac{1}{\tau_{i}} \right) \le \frac{1}{2} M \sum_{i = 0}^{k} \tau_{i} \frac{\tau_{i}^{- 2}}{1 - \tau_{i}^{- 1}}}} \\{{\displaystyle \quad = \frac{1}{2} M \sum_{i = 0}^{k} \frac{1}{\tau_{i} - 1} = \frac{\sqrt{\nu}}{2} M \left[1 + \sum_{i = 1}^{k} \frac{1}{\sqrt{i}} \right] \le \sqrt{\nu} M \left[\frac{1}{2} + \sqrt{k} \right]}.} \end{array}\tag{7.3.21}
$$

(The last inequality can be easily justified by induction.) Furthermore,

$$
\begin{array}{r}{\frac{S_{k}}{\beta_{k + 1}} \| \nabla f(x_{0}) \|_{x_{0}}^{*} \leq \frac{k + 1}{1 + \sqrt{\frac{k + 1}{\nu}}} \ \leq \ \sqrt{\nu(k + 1)},} \end{array}
$$

$$
\begin{array}{r}{\frac{A_{k}}{\beta_{k + 1} \nu} \leq \frac{\frac{1}{2} + \sqrt{k}}{\sqrt{\nu} + \sqrt{k + 1}} \leq 1.} \end{array}
$$

Thus, substituting the above estimates in inequality (7.3.16), we obtain

$$
\begin{array}{rl} &{\frac{\ell_{k}^{\star}}{S_{k}} \leq M \left[\frac{\sqrt{\nu}}{k + 1} \left(\frac{1}{2} + \sqrt{k} \right) + \frac{\nu + \sqrt{\nu(k + 1)}}{k + 1} \left(1 + 2 \ln \left(1 + \sqrt{1 + 3 \sqrt{\nu(k + 1)}} \right) \right) \right]} \\ &{\quad \leq 2M \cdot \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \cdot \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right).} \end{array}
$$

In the last inequality we use the bound $\begin{array}{r}{\frac{\sqrt{\nu}}{k + 1} \left(\frac{1}{2} + \sqrt{k} \right) \leq \sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1}} \end{array}$ .

With parameters chosen by (7.3.19), the scheme of method (7.3.14) can be written in the following form:

$$
x_{k + 1} = \arg \operatorname{max}_{x \in P_{0}} \left\{{\frac{1}{k + 1}} \sum_{i = 0}^{k} \langle \nabla f(x_{i}), x - x_{i} \rangle - M{\frac{{\sqrt{\nu}} +{\sqrt{k + 1}}}{{\sqrt{\nu}}(k + 1)}} \left[F(x) - F(x_{0}) \right] \right\}.\tag{7.3.22}
$$

Since f is a concave function,

$$
\begin{array}{rl} &{\frac{1}{S_{k}} \ell_{k}^{\star} = \frac{1}{S_{k}} \underset{y \in P}{\operatorname{max}} \underset{i = 0}{\overset{k}{\sum}} \lambda_{i} \langle \nabla f(x_{i}), y - x_{i} \rangle} \\ &{\qquad \quad \geq \frac{1}{S_{k}} \underset{y \in P}{\operatorname{max}} \underset{i = 0}{\overset{k}{\sum}} \lambda_{i}[f(y) - f(x_{i})] = f_{\star} - \frac{1}{S_{k}} \underset{i = 0}{\overset{k}{\sum}} \lambda_{i} f(x_{i}).} \end{array}
$$

Thus, the estimate (7.3.20) justifies the following rate of convergence for primal variables:

$$
\begin{array}{r}{f_{\star} - \displaystyle \sum_{i = 0}^{k} \frac{\lambda_{i}}{S_{k}} f(x_{i}) \le 2M \cdot \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \cdot \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right).} \end{array}\tag{7.3.23}
$$

Note that the value $\ell_{k}^{\star}$ is computable. Hence, it can be used for terminating the process.

Let us show now that method (7.3.22) can also generate approximate solutions to the dual problem. For that, we need to employ the internal structure of our problem. Let us assume that it can be represented in a saddle-point form:

$$
f(x) = \operatorname{min}_{w \in S} \psi(x, w) \quad \to \quad \operatorname{max}_{x \in P},\tag{7.3.24}
$$

where $S \subset \mathbb{E}_{1}$ is a closed convex set, and the function $\psi(x, w)$ is convex in $w \in S$ and concave and subdifferentiable in $x \in P$ . Then, the dual problem is defined as

$$
{\mathrm{Find ~}} f_{\star} = \operatorname{min}_{w \in S} \ \eta(w),\tag{7.3.25}
$$

$$
\eta(w) = \operatorname{max}_{y \in P} \varPsi(y, w).
$$

Since P is bounded, the above problem is well defined. Without loss of generality, it is always possible to choose

$$
\nabla f(x) = \nabla_{1} \psi(x, w(x))\tag{7.3.26}
$$

with some $w(x) \in \mathop{\mathrm{Arg}} \underset{w \in S}{\operatorname{min}} \psi(x, w) \subseteq S$ . Let us assume that $w(x)$ is computable for any $x \in P$

Lemma 7.3.3 Define $\begin{array}{r}{\bar{w}_{k} = \frac{1}{S_{k}} \displaystyle \sum_{i = 0}^{k} \lambda_{i} w(x_{i})} \end{array}$ , and $\begin{array}{r}{\bar{x}_{k} = \frac{1}{S_{k}} \displaystyle \sum_{i = 0}^{k} \lambda_{i} x_{i}} \end{array}$ . Then

$$
\begin{array}{r}{\eta(\bar{w}_{k}) - f(\bar{x}_{k}) \leq \frac{1}{S_{k}} \ell_{k}^{\star}.} \end{array}\tag{7.3.27}
$$

Proof Since Ψ is concave in the first argument, for any $y \in P$ we have

$$
\begin{array}{rl} &{\langle \nabla f(x_{i}), y - x_{i} \rangle = \langle \nabla_{1} \psi(x_{i}, w(x_{i})), y - x_{i} \rangle} \\ &{} \\ &{\qquad \geq \psi(y, w(x_{i})) - \psi(x_{i}, w(x_{i})) = \psi(y, w(x_{i})) - f(x_{i}).} \end{array}
$$

Hence,

$$
\begin{array}{rlr}{{\frac{1}{S_{k}} \ell_{k}^{\star} = \frac{1}{S_{k}} \operatorname{max}_{y \in P} \sum_{i = 0}^{k} \lambda_{i} \langle \nabla f(x_{i}), y - x_{i} \rangle \ \ge \ \frac{1}{S_{k}} \operatorname{max}_{y \in P} \sum_{i = 0}^{k} \lambda_{i}[\psi(y, w(x_{i})) - f(x_{i})]}} \\ &{} & \\ &{\ge \operatorname{max}_{y \in P} \psi(y, \bar{w}_{k}) - \frac{1}{S_{k}} \sum_{i = 0}^{k} \lambda_{i} f(x_{i}) \ = \ \eta(\bar{w}_{k}) - \frac{1}{S_{k}} \sum_{i = 0}^{k} \lambda_{i} f(x_{i})} \\ &{} & \\ &{\ge \eta(\bar{w}_{k}) - f(\bar{x}_{k}).} \end{array}
$$

Thus, the scheme (7.3.22) can generate approximate primal-dual solutions:

$$
\begin{array}{r}{\eta(\hat{w}_{k}) - f(\hat{x}_{k}) \le 2M \cdot \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \cdot \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right).} \end{array}\tag{7.3.28}
$$

## 7.3.3 Maximizing Positive Concave Functions

Consider now a convex optimization problem

$$
{\mathrm{Find ~}} \psi_{\star} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{x} \{\psi(x) : \x \in P\},\tag{7.3.29}
$$

where the set $P = \hat{P} \cap Q$ satisfies the assumptions introduced for problem (7.3.13). However, now we assume that the function ψ is concave and positive on int Q:

$$
\psi(x) ~ > ~ 0, ~ \forall x \in \mathrm{int} ~ Q.\tag{7.3.30}
$$

Lemma 7.3.4 Let ψ be concave and positive on int $Q.$ Then for any $x \in$ int $Q$ we have

$$
\begin{array}{r}{\| \nabla \psi(x) \|_{x}^{*} \leq \psi(x).} \end{array}\tag{7.3.31}
$$

Proof Let us choose an arbitrary $x \in$ int $Q$ and $r \in[0, 1)$ . Define

$$
\begin{array}{r}{y = x - \frac{r}{\| \nabla \psi(x) \|_{x}^{*}}[\nabla^{2} F(x)]^{- 1} \nabla \psi(x).} \end{array}
$$

In view of Item 1 of Theorem 5.1.5, $y \in$ int $Q$ . Therefore,

$$
0 \leq \psi(y) \leq \psi(x) + \langle \nabla \psi(x), y - x \rangle = \psi(x) - r \| \nabla \psi(x) \|_{x}^{*}.
$$

Since r is an arbitrary value from 0, 1), we get (7.3.31).

This result has an important corollary. Let us apply to the objective function of problem (7.3.29) a logarithmic transformation:

$$
f(x) \{\stackrel{\mathrm{def}}{=}} \ \ln \psi(x).\tag{7.3.32}
$$

Lemma 7.3.5 Let ψ be concave and positive in the sense of (7.3.30). Then $f \in$ ${\mathcal{B}}_{1}(Q)$ , and it is concave on $Q.$

Proof Indeed, it is well known that the logarithm of a concave function is a concave function too. It remains to note that $\begin{array}{r}{\nabla f(x) ~ = ~ \frac{1}{\psi(x)} \nabla \psi(x)} \end{array}$ and apply inequality (7.3.31).

Thus, in order to solve problem (7.3.29), we can apply method (7.3.14) to problem (7.3.13) with the objective function defined by (7.3.32). The resulting optimization scheme is as follows:

$$
x_{k + 1} = \arg \operatorname{max}_{x \in P_{0}} \left\{\frac{1}{k + 1} \sum_{i = 0}^{k} \langle \frac{\nabla \psi(x_{i})}{\psi(x_{i})}, x - x_{i} \rangle - \frac{\sqrt{\nu} + \sqrt{k + 1}}{\sqrt{\nu}(k + 1)} \left[F(x) - F(x_{0}) \right] \right\}.\tag{7.3.33}
$$

For scheme (7.3.33), we can guarantee a certain rate of convergence in relative scale.

Theorem 7.3.3 Let the sequence $\{x_{k}\}_{k = 0}^{\infty}$ be generated by method (7.3.33) for problem (7.3.29). Then for any $k \geq 0$ we have

$$
\begin{array}{rl} &{\quad \left[\displaystyle \prod_{i = 0}^{k} \psi(x_{i}) \right]^{\frac{1}{k + 1}}} \\ &{\ge \psi_{\star} \cdot \exp \left\{- 2 \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right) \right\}} \\ &{\ge \psi_{\star} \cdot \left[1 - 2 \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right) \right].} \end{array}\tag{7.3.34}
$$

Proof Indeed, we just apply method (7.3.22) to the function f defined by (7.3.32). Since $f \in{\mathcal{B}}_{1}(Q) \subseteq{\mathcal{B}}_{1}(P)$ , by (7.3.20) we conclude that

$$
f_{\star} - \frac{1}{k + 1} \sum_{i = 0}^{k} f(x_{i}) \le \delta_{k} \overset{\mathrm{def}}{=} 2 \left(\sqrt{\frac{\nu}{k + 1}} + \frac{\nu}{k + 1} \right) \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(k + 1)} \right) \right).
$$

Hence, $\left[\prod_{i = 0}^{k} \psi(x_{i}) \right]^{\frac{1}{k + 1}} \ge \psi_{\star} \cdot e^{- \delta_{k}} \ge \psi_{\star} \cdot(1 - \delta_{k})$ . This is exactly (7.3.34).

Let us show how we can treat a problem dual to (7.3.29). For simplicity, assume that

$$
\psi(x) = \operatorname{min}_{u \in \Omega} \psi_{0}(u, x),\tag{7.3.35}
$$

where $\varOmega \subset \mathbb{E}_{1}$ is a closed convex set. In this case, condition (7.3.30) can be written as

$$
\psi_{0}(u, x) \geq 0, \quad u \in \Omega, \x \in P.\tag{7.3.36}
$$

Note that

$$
\begin{array}{rcl}{\displaystyle \underset{x \in P}{\operatorname{max}} \ln \psi(x)} &{=} &{\displaystyle \operatorname{max}_{x \in P} \mathrm{~ min ~} \operatorname{min}_{u \in \varOmega} \left[\tau \varPsi_{0}(u, x) - \ln \tau - 1 \right]} \\ & &{} & \\ & &{=} &{\displaystyle \operatorname{max}_{x \in P} \displaystyle \operatorname{min}_{v \in \tau \leq 0, \atop v \in \mathscr{S}} \left[\tau \varPsi_{0} \left(\frac{1}{\tau} v, x \right) - \ln \tau - 1 \right]} \\ &{\displaystyle \underset{(1, 3, \epsilon)}{\operatorname{max}} \displaystyle \operatorname{min}_{v \in \tau \leq 0, \atop v \in \mathscr{S}} \left.\eta(w) \equiv \eta(v, \tau) \stackrel{\mathrm{def}}{=} - 1 - \ln \tau + \tau \psi^{\star} \left(\frac{1}{\tau} v \right) \right.,} \end{array}
$$

where $\psi^{\star}(u) = \operatorname{max}_{x \in P} \psi_{0}(u, x)$

Denote by $u(x)$ a solution of the minimization problem (7.3.35). Then $w(x)$ is clearly defined as follows

$$
\begin{array}{r}{w(x) =(v(x), \tau(x)), \quad v(x) = \tau(x) u(x), \quad \tau(x) = \frac{1}{\psi(x)}.} \end{array}
$$

In accordance with Lemma 7.3.3, we can form $\bar{w}_{k} =(\bar{v}_{k}, \bar{\tau}_{k})$ with

$$
\begin{array}{r}{\bar{v}_{k} = \frac{1}{k + 1} \displaystyle \sum_{i = 0}^{k} \frac{u(x_{i})}{\psi(x_{i})}, \quad \bar{\tau}_{k} = \frac{1}{k + 1} \displaystyle \sum_{i = 0}^{k} \frac{1}{\psi(x_{i})}.} \end{array}
$$

Let ${\bar{x}}_{k} = \frac{1}{k + 1} \sum_{i = 0}^{k} x_{i}, \mathrm{and} \ :{\bar{u}}_{k} = \frac{{\bar{v}}_{k}}{{\bar{\tau}}_{k}} = \sum_{i = 0}^{k} \frac{u(x_{i})}{\psi(x_{i})} \Big / \left[\sum_{i = 0}^{k} \frac{1}{\psi(x_{i})} \right] \in \Omega.$ Then, by (7.3.27) we get

$$
\begin{array}{rl} &{\frac{1}{S_{k}} \ell_{k}^{\star} \geq \eta(\bar{w}_{k}) - \ln \psi(\bar{x}_{k}) \ = \ - 1 - \ln \bar{\tau}_{k} + \bar{\tau}_{k} \psi^{\star} \left(\frac{1}{\bar{\tau}_{k}} \bar{v}_{k} \right) - \ln \psi(\bar{x}_{k})} \\ &{} \\ &{\qquad = - 1 - \ln \bar{\tau}_{k} + \bar{\tau}_{k} \psi^{\star} \left(\bar{u}_{k} \right) - \ln \psi(\bar{x}_{k}) \ \geq \ \ln \frac{\psi^{\star} \left(\bar{u}_{k} \right)}{\psi(\bar{x}_{k})}.} \end{array}
$$

Hence,

$$
\begin{array}{r}{\psi(\bar{x}_{k}) \geq \psi^{\star}(\bar{u}_{k}) \cdot \exp \left\{- \frac{1}{S_{k}} \ell_{k}^{\star} \right\}.} \end{array}\tag{7.3.37}
$$

Note that $\psi^{\star}(\bar{u}_{k}) \geq \psi_{\ast}$

## 7.3.4 Applications

In this section, we are going to consider examples of applications of method (7.3.33). It will be more convenient to use a slight modification of the usual notion of relative accuracy. We say that some value $\bar{\phi}$ is a δ-approximation of the optimal value $\phi_{\star} > 0$ in relative scale if

$$
\phi_{\star} \geq \bar{\phi} \geq \phi_{\star} \cdot e^{- \delta}, \quad \delta > 0.
$$

In the complexity estimates, the short notation ${\tilde{O}}(\cdot)$ is used to indicate that some logarithmic factors are omitted. Since the rate of convergence (7.3.34) does not depend on the problem’s data, our method is a so-called fully polynomial-time approximation scheme.

## 7.3.4.1 The Fractional Covering Problem

Consider the following fractional covering problem:

$$
{\mathrm{Find ~}} \phi_{\star} \stackrel{\mathrm{def}}{=} \operatorname{min}_{y} \{\langle b, y \rangle : \A^{T} y \geq c, \y \geq 0 \in \mathbb{R}^{m}\},\tag{7.3.38}
$$

where $A = ( a _ { 1 } , \ldots , a _ { n } ) $ is an $(m \times n)$ -matrix with non-negative coefficients, and vectors $b \in \mathbb{R}^{m}$ and $c \in \mathbb{R}^{n}$ have positive coefficients. Define

$$
\begin{array}{r}{\psi(y) = \underset{1 \leq i \leq n}{\operatorname{min}} \frac{1}{c(i)} \langle a_{i}, y \rangle.} \end{array}
$$

Note that $\psi$ is concave and positively homogeneous of degree one. Therefore,

$$
\begin{array}{rl} &{\phi_{\star} = \underset{y}{\mathrm{min}} \left\{\frac{\langle b, y \rangle}{\psi(y)} : ~ y \geq 0 \in \mathbb{R}^{m} \right\}} \\ &{\quad = \Bigg[\underset{y}{\mathrm{max}} \left\{\frac{\psi(y)}{\langle b, y \rangle} : ~ y \geq 0 \in \mathbb{R}^{m} \right\} \Bigg]^{- 1}} \\ &{\quad = \Bigg[\underset{y}{\mathrm{max}} \left\{\psi(y) : ~ \langle b, y \rangle = 1, ~ y \geq 0 \in \mathbb{R}^{m} \right\} \Bigg]^{- 1}.} \end{array}
$$

Thus, problem (7.3.38) can be written in the form (7.3.29) with $Q = \mathbb{R}_{+}^{m}$

$$
F(y) = - \sum_{j = 1}^{m} \ln y^{(j)}, \quad \nu = m,
$$

and $\hat{P} = \{y : \langle b, y \rangle = 1\}$ . Hence, in accordance with the estimate (7.3.34) a $\delta -$ approximation of $\phi_{\star} = \psi_{\star}^{- 1}$ in relative scale can be found in $\tilde{O}(\textstyle{\frac{m}{\delta^{2}}})$ iterations of method (7.3.33). Each iteration of the scheme needs $O(mn)$ operations to compute $\psi(y)$ and its subgradient, and essentially $O(m \ln m)$ operation to solve the auxiliary maximization problem in (7.3.33) (see Sect. A.2). Of course, this computational strategy is reasonable if $m \ < < \n$ . Otherwise, it is better to solve the dual form of problem (7.3.38) by the smoothing technique (see Chap. 6).

## 7.3.4.2 The Maximal Concurrent Flow Problem

Consider a network consisting of set of nodes ${\mathcal{N}}, |{\mathcal{N}} | = n$ , and set of directed arcs

$$
\mathcal{A} = \{\alpha =(i, j), \i, j \in \mathcal{N}\}, \quad | \mathcal{A} | = m.
$$

We assume that all arcs have bounded capacities. Formally, this means that the arc flow vector $f \in \mathbb{R}_{+}^{m}$ must satisfy the capacity constraint:

$$
f \leq{\bar{f}}.
$$

Let us introduce the set of origin-destination pairs

$$
\mathcal{OD} = \{(i, j), i, j \in \mathcal{N}\}.
$$

Each pair $(i, j) \in \mathcal{OD}$ generates for nodes i and j a directed flow $f_{i, j} \in \mathbb{R}_{+}^{m}$ of level $d_{i, j}$ . Formally, this means that the vectors $f_{i, j}$ must satisfy the system of linear equations

$$
Bf_{i, j} \ = \d_{i, j}(e_{i} - e_{j}), \quad(i, j) \in \mathcal{OD},
$$

where B is the balance matrix of the network and $e_{(\cdot)}$ is the corresponding coordinate vectors in $\mathbb{R}^{n}$

The maximal concurrent flow problem can be posed as follows:

$$
\begin{array}{rl} &{\mathrm{Find ~} \lambda_{\star} \stackrel{\mathrm{def}}{=} \operatorname{max}_{{\lambda}, f_{i, j}} \{{\lambda} : Bf_{i, j} ~ ={\lambda} \cdot d_{i, j}(e_{i} - e_{j}),} \\ &{~ f_{i, j} ~ \ge ~ 0, ~(i, j) \in{\mathcal O} \mathcal{D}, ~ \displaystyle \sum_{(i, j) \in{\mathcal O} \mathcal{D}} f_{i, j} \le \bar{f}\}.} \end{array}\tag{7.3.39}
$$

Dualizing the flow capacity constraints by a vector of Lagrange multipliers $t \in \mathbb{R}_{+}^{M}$ we get the following dual problem:

$$
\begin{array}{rl}{\psi_{\star}} &{\stackrel{\mathrm{def}}{=} \lambda_{\star}^{- 1} = \displaystyle \operatorname{max}_{t} \{\psi(t) : \langle \bar{f}, t \rangle = 1, \t \geq 0 \in \mathbb{R}^{m}\},} \\ &{\psi(t) = \displaystyle \sum_{(i, j) \in \mathcal{OD}} d_{i, j} \cdot SP_{i, j}(t),} \end{array}\tag{7.3.40}
$$

where the function $SP_{i, j}(t)$ is the shortest path distance between nodes i and j with respect to a non-negative arc travel time vector $t \in \mathbb{R}^{m}$

Clearly the function ψ in (7.3.40) satisfies all assumptions introduced for problem (7.3.29). Therefore (7.3.40) can be treated by method (7.3.33). In accordance with the estimate (7.3.34), a δ-approximation of $\psi_{\star}$ in relative scale can be found in $\tilde{O}(\textstyle{\frac{m}{\delta^{2}}})$ iterations. Each iteration of the scheme needs a computation of the shortest-path distances for all origin-destination pairs. The complexity of solving the auxiliary maximization problem in (7.3.33) is essentially O(m ln m) operations (see Sect. A.2). Note that we are also able to reconstruct the dual solutions (origindestination flows) using the technique described at the end of Sect. 7.3.3.

## 7.3.4.3 The Minimax Problem with Nonnegative Components

Consider the following minimax problem:

$$
{\mathrm{Find ~}} \psi_{\star} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{min}_{x \in S} \ \operatorname{max}_{1 \leq i \leq m} f_{i}(x),\tag{7.3.41}
$$

where S is a closed convex set and all functions $f_{i}(\cdot)$ are convex and non-negative on S. We assume that the function

$$
\psi(y) = \operatorname{min}_{x \in S} \ \sum_{i = 1}^{m} y^{(i)} f_{i}(x)
$$

is well defined for any $y \ge 0 \in \mathbb{R}^{m}$ . Moreover, let us assume that the values of this function and its subgradients are easily computable.

Then we can rewrite problem (7.3.41) in the dual form

$$
\psi_{\star} \ : = \ : \operatorname{max}_{y} \left\{\psi(y) : \langle \bar{e}_{m}, y \rangle = 1, \ : y \geq 0 \in \mathbb{R}^{m} \right\},\tag{7.3.42}
$$

where $\bar{e}_{m} \in \mathbb{R}^{m}$ is the vector of all ones.

Note that (7.3.42) satisfies all assumption of problem (7.3.29). Therefore, in accordance with the estimate (7.3.34), a δ-approximation of $\psi_{\star}$ in relative scale can be found by method (7.3.33) in $\begin{array}{r}{\tilde{O} \left(\frac{m}{\delta^{2}} \right)} \end{array}$ iterations. Each iteration of the scheme results in a minimization of a weighted sum of functions $f_{i}$ and the barrier function $F$

## 7.3.4.4 Semidefinite Relaxation of the Boolean Quadratic Problem

Consider the following maximization problem:

$$
{\mathrm{Find ~}} f_{\star} \stackrel{\mathrm{def}}{=} \operatorname{max}_{x} \{\langle Ax, x \rangle : \x^{(i)} = \pm 1, \i = 1, \ldots, n\},\tag{7.3.43}
$$

where A is a symmetric positive definite $(n \times n) – \mathrm{matrix}$ . It is well known that this problem is NP-hard. However, it appears that its optimal value can be approximated in polynomial time with a certain dimension-independent relative accuracy. Namely, define

$$
\psi_{\star} = \operatorname{min}_{y} \{\langle \bar{e}_{n}, y \rangle : D(y) \succeq A\},\tag{7.3.44}
$$

where $D(y)$ is a diagonal $(n \times n)$ -matrix with vector y on the diagonal. Then it can be proved that

$$
\begin{array}{r}{\frac{2}{\pi} \psi_{\star} \leq f_{\star} \leq \psi_{\star}.} \end{array}
$$

Usually the problem (7.3.44) is treated by Interior-Point Methods. However, note that quite often it is useless to compute an approximation to $\psi_{\star}$ with a high relative accuracy. Therefore it seems reasonable to solve it by a cheap gradient scheme.

Let us justify another representation for $\psi_{\star}$

Lemma 7.3.6 Let $A = L^{T} L$ . Then

$$
\psi_{\star} = \operatorname{max}_{X} \left\{\psi(X) \{\stackrel{\mathrm{def}}{=}} \ \left[\sum_{i = 1}^{n} \langle Xq_{i}, q_{i} \rangle^{1 / 2} \right]^{2} \colon \langle I_{n}, X \rangle_{F} = 1, \X \succeq 0 \right\},\tag{7.3.45}
$$

where $q_{i}$ are the columns of matrix L, $I_{n}$ is the identity matrix, and the scalar product in the space of symmetric matrices is defined in a natural way.

Proof Indeed, since $A \succ 0$ , we have

$$
\begin{array}{rl} &{\psi_{\star} = \displaystyle \operatorname{min}_{u} \left\{\sum_{i = 1}^{n} \frac{1}{u^{(i)}} : ~ A^{- 1} \geq D(u) \right\}} \\ &{~ = \displaystyle \operatorname{min}_{u} ~ \displaystyle \operatorname{max}_{Y \geq 0} ~ \left\{\sum_{i = 1}^{n} \frac{1}{u^{(i)}} + \langle Y, D(u) - A^{- 1} \rangle_{M} \right\}} \\ &{~ = \displaystyle \operatorname{max}_{Y \geq 0} ~ \operatorname{min}_{u} ~ \left\{\sum_{i = 1}^{n} \left(\frac{1}{u^{(i)}} + Y^{(i, i)} ~ u^{(i)} \right) - \langle Y, A^{- 1} \rangle_{M} \right\}.} \end{array}
$$

Thus, $\psi_{\star} = \operatorname{max}_{Y \succeq 0} \left\{2 \sum_{i = 1}^{n} \left[Y^{(i, i)} \right]^{1 / 2} - \langle Y, A^{- 1} \rangle_{\cal M} \right\}$ . Maximizing the objective function in this problem along a fixed direction $Y \succeq 0$ , we obtain

$$
\psi_{\star} = \operatorname{max}_{Y \succeq 0} \left\{\frac{1}{\langle Y, A^{- 1} \rangle_{M}} \left[\sum_{i = 1}^{n} \left[Y^{(i, i)} \right]^{1 / 2} \right]^{2} \right\}.
$$

Choosing in this problem new variables $X = L^{- T} YL^{- 1}$ , we obtain representation (7.3.45).

Note that the function $\psi$ in (7.3.45) is concave. Moreover, it is differentiable and positive at any $X \succ 0$ . In our case, $Q$ is the cone of positive-semidefinite matrices with

$$
F(X) = - \ln \operatorname{det} X, \quad \nu = n.
$$

Hence, (5.8) satisfies the conditions of the problem (7.3.29). Consequently, $\psi_{\star}$ can be approximated by (7.3.33) in $\begin{array}{r}{\tilde{O} \left(\frac{n}{\delta^{2}} \right)} \end{array}$ iterations, where δ is the desired relative accuracy. In our case, each iteration of the scheme (7.3.33) requires a representation of an $(n \times n) – \mathrm{matrix}$ in the form $UTU^{T}$ , where U is an orthogonal matrix, and the matrix $T$ is tri-diagonal. After that, we can apply the efficient search procedure described at the end of Sect. A.2.

## 7.3.5 Online Optimization as an Alternative to Stochastic Programming

## 7.3.5.1 A Decision-Making Process in an Uncertain Environment

Consider a repeatable decision-making process with uncertain income. Assume we have $N + 1$ periods of time, each of which corresponds to a full production cycle.

In the beginning of the kth period, we choose a production strategy

$$
x_{k} \in P, \quad k = 0, \ldots, N,
$$

where the structure of P satisfies the assumptions of Sect. 7.3.1. The results of different economic activities in this period are given by a production function

$$
\psi_{k}(x) \geq 0, \quad x \in P.
$$

The value $\psi_{k}(x)$ is equal to the rate of growth of the capital invested at the beginning of period k in accordance with production strategy $x \in \mathsf{\Gamma} P$ . The function $\psi_{k}(\cdot)$ becomes known only at the end of the period k. So, it can be used for choosing the production strategies of the next periods.

Assume for a moment that we know in advance all production functions

$$
\psi_{k}(x), \quad k = 0, \ldots, N.
$$

However, for certain reasons, we are obliged to apply in all these periods the same strategy $x \in P$ . In this case, of course, it is reasonable to use

$$
x_{N}^{\star} \{\stackrel{\mathrm{def}}{=}} \ \underset{x \in P}{\operatorname{argmax}} \ \prod_{k = 0}^{N} \psi_{k}(x).
$$

Then, the average efficiency of this static strategy is given by

$$
\psi_{N}^{\star} = \left[\prod_{k = 0}^{N} \psi_{k}(x^{\star}) \right]^{\frac{1}{N + 1}}.
$$

However, usually the future is unknown. Instead, often we have the freedom to choose for each period k a specific production strategy $x_{k} \in{\cal P}$ . Let us look at its possible efficiency.

Suppose we know a ν-self-concordant barrier $F(\cdot)$ for the set $Q.$ . Then, we could apply the following variant of method (7.3.33):

$$
x_{k + 1} = \arg \operatorname{max}_{x \in P} \left\{\frac{1}{k + 1} \sum_{i = 0}^{k} \langle \frac{\nabla \psi_{i}(x_{i})}{\psi_{i}(x_{i})}, x - x_{i} \rangle - \frac{\sqrt{\nu} + \sqrt{k + 1}}{\sqrt{\nu}(k + 1)} \left[F(x) - F(x_{0}) \right] \right\}.\tag{7.3.46}
$$

In this case, after $N + 1$ periods, the average rate of growth is given by

$$
\psi_{N} \{\stackrel{\mathrm{def}}{=}} \ \left[\prod_{k = 0}^{N} \psi_{k}(x_{k}) \right]^{\frac{1}{N + 1}}.
$$

Theorem 7.3.4 For any $N \geq 0$ we have $\psi_{N} \geq \psi_{N}^{\star} \cdot e^{- \delta_{N}}$ with

$$
\begin{array}{r}{\delta_{N} = 2 \left(\sqrt{\frac{\nu}{N + 1}} + \frac{\nu}{N + 1} \right) \cdot \left(1 + \ln \left(2 + \frac{3}{2} \sqrt{\nu(N + 1)} \right) \right) \ \to \0} \end{array}
$$

as $N \infty.$

Proof The proof is very similar to the proofs of Theorems 7.3.1 and 7.3.2. Define

$$
f_{k}(\boldsymbol{x}) = \ln \psi_{k}(\boldsymbol{x}), \quad f(\boldsymbol{x}) = \frac{1}{N + 1} \sum_{k = 0}^{N} f_{k}(\boldsymbol{x}), \quad s_{k} = \sum_{i = 0}^{k} \nabla f_{i}(x_{i}) = \sum_{i = 0}^{k} \frac{\nabla \psi_{i}(x_{i})}{\psi_{i}(x_{i})}.
$$

Note that method (7.3.46) can be seen as an application of scheme (7.3.14), (7.3.19) to a changing objective function.

For any $k \geq 0$ , we have

$$
\begin{array}{rcl}{U_{\beta_{k + 1}}(s_{k + 1})} &{\le} &{U_{\beta_{k}}(s_{k + 1})} \\ & &{\le} &{U_{\beta_{k}}(s_{k}) + \langle \nabla f_{k}(x_{k}), u_{\beta_{k}}^{\star}(s_{k}) - x_{0} \rangle + \beta_{k} \omega_{\ast} \left(\frac{1}{\beta_{k}} \| \nabla f_{k}(x_{k}) \|_{x_{k}}^{\ast} \right)} \\ & &{\overset{(7.3.31)}{\le} ~ U_{\beta_{k}}(s_{k}) + \langle \nabla f_{k}(x_{k}), u_{\beta_{k}}^{\star}(s_{k}) - x_{0} \rangle + \beta_{k} \omega_{\ast} \left(\frac{1}{\beta_{k}} \right).} \end{array}
$$

Since $U_{\beta_{0}}(0) = 0$ , we conclude that

$$
\begin{array}{rlr}{{\langle s_{N + 1}, x_{N + 1} - x_{0} \rangle - \beta_{N + 1}[F(x_{N + 1}) - F(x_{0})]}} \\ &{=} &{U_{\beta_{N + 1}}(s_{N + 1}) \ \le \ \displaystyle \sum_{i = 0}^{N} \langle \nabla f_{i}(x_{i}), x_{i} - x_{0} \rangle + \sum_{i = 0}^{N} \beta_{i} \omega_{*}(\frac{1}{\beta_{i}})} \\ &{} &{\(7.3.21) \ \sum_{i = 0}^{N} \langle \nabla f_{i}(x_{i}), x_{i} - x_{0} \rangle + \sqrt{\nu}[\frac{1}{2} + \sqrt{N}].} \end{array}\tag{7.3.47}
$$

In view of the first-order optimality condition for (7.3.3), for all $y \in P_{0}$ we have

$$
\langle s_{N + 1}, y - x_{N + 1} \rangle \ \leq \ \beta_{N + 1} \langle \nabla F(x_{N + 1}), y - x_{N + 1} \rangle.\tag{7.3.48}
$$

Therefore, using the concavity of all functions $f_{i}$ , for any $y \in P$ we get

$$
\begin{array}{rll}{\ell_{N}(y)} &{\stackrel{\mathrm{def}}{=}} &{\displaystyle \sum_{i = 0}^{N} \langle \nabla f_{i}(x_{i}), y - x_{i} \rangle} \\ &{(7.3.47)} \\ &{\stackrel{(7.3.47)}{\leq}} &{\displaystyle \langle s_{N + 1}, y - x_{N + 1} \rangle + \beta_{N + 1}[F(x_{N + 1}) - F(x_{0})] + \sqrt{\nu} \left[\frac{1}{2} + \sqrt{N} \right]} \end{array}
$$

$$
\begin{array}{rlr}{{(\overbrace{\boldsymbol{\mathcal{\Sigma}}^{\perp, \boldsymbol{\lambda}, \boldsymbol{\delta}}}^{(7, 3, 48)} \beta_{N + 1}[F(\boldsymbol{x}_{N + 1}) + \langle \nabla F(\boldsymbol{x}_{N + 1}), \boldsymbol{y} - \boldsymbol{x}_{N + 1} \rangle - F(\boldsymbol{x}_{0})]}} \\ &{\leq} &{\beta_{N + 1}[F(\boldsymbol{y}) - F(\boldsymbol{x}_{0})] + \sqrt{\nu}[\frac{1}{2} + \sqrt{N}]} \\ &{} &{+ \sqrt{\nu}[\frac{1}{2} + \sqrt{N}]} \\ &{} &{\qquad + \beta_{N + 1}[F(\boldsymbol{y}) - F(\boldsymbol{x}_{0})] + \sqrt{\nu}[\frac{1}{2} + \sqrt{N}].} \end{array}
$$

Hence, $\ell_{N}^{\star}(\beta_{N + 1}) ~ \leq ~ \sqrt{\nu} \left[\frac{1}{2} + \sqrt{N} \right]$ . On the other hand, applying the same arguments as in the end of the proof of Theorem 7.3.1, we obtain

$$
\begin{array}{l}{\ell_{N}(x_{0}) = \displaystyle \sum_{i = 0}^{N} \langle \nabla f_{i}(x_{i}), x_{0} - x_{i} \rangle ~ \ge ~ \sum_{i = 0}^{N} \langle \nabla f_{i}(x_{0}), x_{0} - x_{i} \rangle} \\{~} \\{\ge - 3 \nu \cdot(N + 1).} \end{array}
$$

Thus, $\begin{array}{r}{\ell_{N}^{\star}(\beta_{N + 1}) - \ell_{N}(x_{0}) \leq \sqrt{\nu} \left(\frac 12 + \sqrt{N} \right) + 3 \nu \cdot(N + 1)} \end{array}$ . Since $\beta_{N + 1} = 1 +$ $\sqrt{\frac{N + 1}{\nu}}$ , by (7.3.12) we have:

$$
\begin{array}{rl} &{\frac{\ell_{\star}^{\star}}{N + 1} \leq \frac{\sqrt{v}}{N + 1} \left(\frac{1}{2} + \sqrt{N} \right)} \\ &{\qquad + \frac{v + \sqrt{v(N + 1)}}{N + 1} \left[1 + 2 \ln \left(1 + \sqrt{\frac{\sqrt{v} \left(\frac{1}{2} + \sqrt{N} \right) + 3 \nu \cdot(N + 1)}{\nu + \sqrt{v(N + 1)}}} \right) \right]} \\ &{\qquad \leq \frac{\sqrt{v}}{N + 1} \left(\frac{1}{2} + \sqrt{N} \right) + \frac{\nu + \sqrt{v(N + 1)}}{N + 1} \left[1 + 2 \ln \left(1 + \sqrt{1 + 3 \sqrt{\nu(N + 1)}} \right) \right]} \\ &{\qquad \leq \delta_{N}} \end{array}
$$

(see the arguments used at the end of the proof of Theorem 7.3.2). On the other hand,

$$
\begin{array}{rlr}{\frac{1}{N + 1} \ell_{N}^{\star} = \frac{1}{N + 1} \underset{y \in P}{\operatorname{max}} \left\{\underset{i = 0}{\overset{N}{\sum}} \langle \nabla f_{i}(x_{i}), y - x_{i} \rangle \right\}} &{\geq} &{\frac{1}{N + 1} \underset{y \in P}{\operatorname{max}} \left\{\underset{i = 0}{\overset{N}{\sum}}[f_{i}(y) - f_{i}(x_{i})] \right\}} \\ &{} &{= \ln \psi_{N}^{\star} - \ln \psi_{N}.} \end{array}
$$

Let us now look at several applications of this theorem.

## 7.3.5.2 Portfolio Management

Let $x \ \in \ \varDelta_{n}$ be the structure of our portfolio. Denote by $c_{k}^{(i)} \geq 0, i = 1, \ldots, n$ the growth coefficient for the price of stock i during day $k \geq 0$ . Then the optimal portfolio with constant sharing is defined as

$$
x_{N}^{\star} = \arg \operatorname{max}_{x \in P} \prod_{k = 0}^{N} \langle c_{k}, x \rangle, \quad \psi_{N}^{\star} = \left[\prod_{k = 0}^{N} \langle c_{k}, x_{N}^{\star} \rangle \right]^{1 /(N + 1)}.
$$

For the set $Q = \mathbb{R}_{+}^{n}$ , we can apply the standard n-self-concordant barrier

$$
F(x) = - \sum_{i = 1}^{n} \ln x^{(i)}.
$$

Then, we can use the following variant of method (7.3.46):

$$
x_{k + 1} ={\arg \operatorname{max}_{x \in P}} \left\{\frac{1}{k + 1} \sum_{i = 0}^{k} \frac{\langle c_{i}, x - x_{i} \rangle}{\langle c_{i}, x_{i} \rangle} - \frac{\sqrt{\nu} + \sqrt{k + 1}}{\sqrt{\nu}(k + 1)} \left[F(x) - F(x_{0}) \right] \right\}, \quad k \geq 0.\tag{7.3.49}
$$

In this case, after $N + 1$ periods, the average rate of growth of our portfolio is given by

$$
\psi_{N} \{\stackrel{\mathrm{def}}{=}} \ \left[\prod_{k = 0}^{N} \langle c_{k}, x_{k} \rangle \right]^{\frac{1}{N + 1}}.
$$

In view of Theorem 7.3.4, we have $\psi_{N} \ \ge \ \psi_{N}^{\star} \cdot e^{- \delta_{N}}$ . Note that each step of the algorithm (7.3.49) is implementable in O(n ln n) arithmetic operations (see Sect. A.2).

## 7.3.5.3 Processes with Full Production Cycles

Assume that in our economy there are n elastic production processes. At the beginning of the kth period, we know the cost $a_{k}^{(i)} > 0$ of producing one unit of product i, $i = 1, \ldots, n$ . This cost is derived from the prices of raw materials, labor, equipment, etc. However, the price $b_{k}^{(i)} \geq 0$ of the unit of product i becomes known only at the end of period k, when we sell it. It may depend on competition in the market, uncertain preferences of the consumers, etc. Denoting by $x^{(i)}$ the fraction of the capital invested in the process $i,$ , we come to the following model:

$$
\psi_{k}(x) = \sum_{i = 1}^{n} \frac{b_{k}^{(i)}}{a_{k}^{(i)}} \cdot x^{(i)},
$$

$$
x =(x^{(1)}, \ldots, x^{(n)})^{T} \in Q \{\stackrel{\mathrm{def}}{=}} \ \mathbb{R}_{+}^{n},\tag{7.3.50}
$$

$$
{\hat{P}} = \varDelta_{n}.
$$

Then we can apply method (7.3.46) with

$$
F(x) = - \sum_{i = 1}^{n} \ln x^{(i)}, \quad \nu = n.
$$

In this situation, the complexity of solving the auxiliary maximization problem in (7.3.46) is again O(n ln n) arithmetic operations (see Sect. A.2).

## 7.3.5.4 Discussion

Theorem 7.3.4, being applied in an uncertain environment, delivers an absolute and risk-free guarantee for a certain level of efficiency of online optimization strategy (7.3.46). To obtain such a result, we do not need to introduce the standard machinery related to random events, risk measures, stochastic or robust optimization. Note that in Theorem 7.3.4 we compare the efficiency of a dynamic adjustment strategy with a static one. Hence, our arguments may not be too convincing. However, let us look at the standard one-stage stochastic programming problem

$$
x_{\star} = \arg \operatorname{max}_{x \in P} \mathcal{O}_{\zeta}[f(x, \zeta)],\tag{7.3.51}
$$

where $\mathcal{E}_{\zeta}^{\circ}[\cdot]$ denotes the expectation with respect to a random vector $\zeta$ . The optimal strategy x must be static by its origin (otherwise, maximization of expectation does not make sense). At the same time, the quality of the model $f(x, \xi)$ , constructed by an analysis of the past, can hardly be comparable with the quality of the static model based on exact knowledge of future. Thus, by transitivity, we can hope that our online adjustment strategy gives much better results than the standard Stochastic Programming approach. Of course, it can be applied only in the situations when the dynamic adjustments of the decision variables are implementable.

The main drawback of online optimization strategy (7.3.46) is its low rate of convergence. Therefore, it is efficient only for the processes where the average gain is big as compared to the number of iterations and the parameter of the barrier function. Interesting applications of this technique can be found most probably in long-run production planning and management than in stock market activity.

## 7.4 Optimization with Mixed Accuracy

(Strictly positive functions; The Quasi-Newton Method; Approximate solutions; Mixed accuracy.)

## 7.4.1 Strictly Positive Functions

In the previous chapters, we considered different approaches for finding approximate solutions of optimization problems with absolute and relative accuracy. In all cases, the type of desired accuracy was very important for the definition of the problem class, and consequently for the development of the corresponding numerical schemes. In this section, we proceed in a converse way. Firstly, we define a class of functions with favorable properties. Only after that will we try to understand what kind of theory can be developed for corresponding optimization problems.

Consider a closed convex function f with dom $f \subseteq \mathbb{R}^{n}$ . Let $Q \subseteq$ dom f be a closed convex set. We assume that $\partial f(x) \neq \varnothing$ for all $x \in Q$

Definition 7.4.1 A convex function $f$ is called strictly positive on Q if for any x, y from $Q$ and $g \in \partial f(x)$ we have

$$
f(y) + f(x) + \langle g, y - x \rangle \geq 0.\tag{7.4.1}
$$

Since $f$ is convex, this inequality can be written in a more appealing form:

$$
f(y) \geq | f(x) + \langle g, y - x \rangle |, \quad x, y \in Q, ~ g \in \partial f(x).\tag{7.4.2}
$$

Clearly, strong positivity is an affine-invariant property.

Lemma 7.4.1 Let f be strictly positive on $Q_{x} \subseteq \mathbb{R}^{n}$ and let $A \ \in \ \mathbb{R}^{n \times m}$ and $b \in \mathbb{R}^{n}$ . Then the function $\phi(y) = f(Ay + b)$ is strictly positive on the set

$$
\mathcal Q_{y} = \{y \in \mathbb \mathbb{R}^{m} : \Ay + b \in Q_{x}\}.
$$

Proof Indeed, in view of Lemma 3.1.11, for $x = Ay + b$ we have

$$
g_{y} = A^{T} g_{x} \in \partial \phi(y), \quad \forall g_{x} \in \partial f(x).
$$

For two arbitrary points $y_{1}, y_{2} \in Q_{y}$ let $x_{i} = Ay_{i} + b, i = 1, 2$ . Then

$$
{\begin{array}{rl} &{\phi(y_{2}) + \phi(y_{1}) + \langle g_{y_{1}}, y_{2} - y_{1} \rangle = f(x_{2}) + f(x_{1}) + \langle A^{T} g_{x_{1}}, y_{1} - y_{2} \rangle} \\ &{} \\{= f(x_{2}) + f(x_{1}) + \langle g_{x_{1}}, x_{1} - x_{2} \rangle{\begin{array}{l}{(7.4.1)} \\{\geq \0.} \end{array}}} \end{array}}
$$

Let us give some important examples of strictly positive functions and mention their main properties.

1. Any positive constant is a strictly positive function.

2. Let us look at convex homogeneous functions of degree one.

Lemma 7.4.2 Let $f(x) = \operatorname{max}_{x \in S} \langle s, x \rangle$ , where the set S is bounded, closed and centrally symmetric. Then the function f is strictly positive.

Proof For any $x \in \mathbb{R}^{n}$ and $g_{x} \in \partial f(x)$ , we have $f(x) \stackrel{(3.1.40)}{=} \langle g_{x}, x \rangle$ and $- g_{x} \in S$ Therefore,

$$
f(y) \stackrel{(3.1.23)}{\geq} \langle - g_{x}, y \rangle \stackrel{(3.1.40)}{=} - f(x) - \langle g_{x}, y - x \rangle.
$$

3. Thus, the simplest nontrivial examples of strictly positive functions are norms.

Let us look now at operations preserving strong positivity.

Lemma 7.4.3 The class of strictly positive functions is a convex cone: $iff_{1}$ and $f_{2}$ are strictly positive on $Q,$ , and $\alpha_{1}, \alpha_{2} \geq 0,$ , then $f(x) = \alpha_{1} f_{1}(x) + \alpha_{2} f_{2}(x)$ is strictly positive on $Q.$

Proof Indeed, the characteristic inequality (7.4.1) is convex in $f.\ \sqcap$

Lemma 7.4.4 Let the functions $f_{1}(\cdot)$ and $f_{2}(\cdot)$ be strictly positive on $Q.$ Then the function $f(x) = \operatorname{max} \{f_{1}(x), f_{2}(x)\}$ is also strictly positive.

Proof Let us fix an arbitrary $x \in Q$ . Assume that $f_{1}(x) > f_{2}(x)$ . Then, for $y \in Q$ and $g_{1} \in \partial f_{1}(x)$ we have

$$
f(y) \geq f_{1}(y) \geq - f_{1}(x) - \langle g_{1}, y - x \rangle = - f(x) - \langle \nabla f(x), y - x \rangle.
$$

The case $f_{1}(x) < f_{2}(x)$ and $f_{1}(x) = f_{2}(x)$ can be justified in a similar way (see Lemma 3.1.13).

Thus, the functions below are strictly positive on $\mathbb{R}^{n}$

$$
f_{1}(x) = \sum_{i = 1}^{m} \| A_{i} x - b_{i} \|, \quad f_{2}(x) = \operatorname{max}_{1 \leq i \leq m} \| A_{i} x - b_{i} \|,
$$

where $A_{i} \in \mathbb{R}^{m \times n}$ , and $b_{i} \in \mathbb{R}^{m}, i = 1 \dots n$

At the same time, the class of strictly positive functions contains functions with quite a general shape of epigraph. Let us fix a norm $\| \cdot \|$ for measuring distances in $\mathbb{R}^{n}$ , and define the corresponding dual norm $\| \cdot \|_{*}$ in the standard way (7.1.3).

Theorem 7.4.1 Let the function φ be convex on $Q$ and all its subgradients be uniformly bounded:

$$
\lVert g_{x} \rVert_{*} \leq L, \quad x \in Q, \g_{x} \in \partial f(x).\tag{7.4.3}
$$

Then the function $f(x) = \operatorname{max} \{\phi(x), L \| x \|\}$ is strictly positive on $Q.$

Proof Let us fix an arbitrary $x \in Q$ . Assume first, that $\phi(x) < L \| x \|$ . Let us choose $s \in \mathbb{R}^{n}$ with $\left\| s \right\|_{*} = 1$ , such that $\langle s, x \rangle = \| x \|$ . Note that any $g_{x} \in \partial f(x)$ coincides with one of the vectors Ls (see Lemma 3.1.15). Hence, for any $y \in E$ we have

$$
f(y) + f(x) + \langle g_{x}, y - x \rangle \geq L \| y \| + L \| x \| + \langle Ls, y - x \rangle = L \| y \| + L \langle s, y \rangle \geq 0.
$$

Further, if $\phi(x) > L \| x \|$ , then $\partial f(x) = \partial \phi(x)$ and therefore for any $g_{x} \in \partial f(x)$ we have

$$
f(y) + f(x) + \langle g_{x}, y - x \rangle \quad \geq \quad L \| y \| + L \| x \| + \langle g_{x}, y - x \rangle
$$

$$
{\stackrel{(7.4.3)}{\geq}} \L \| y \| + L \| x \| - L \| y - x \| \geq 0.
$$

Finally, for the case $\phi(x) = L \| x \|$ we can apply a convex combination of the above inequalities.

Using this result, we can endow a general minimization problem

$$
\operatorname{Find} \phi^{*} = \operatorname{min}_{x \in \mathcal{Q}} \phi(x)\tag{7.4.4}
$$

with a strictly positive objective function. Denote by $x^{*} \in Q$ its optimal solution.

Corollary 7.4.1 Let the function φ satisfy condition (7.4.3). Then for any $x_{0} \in{Q}$ the function

$$
f(x) = \operatorname{max} \{\phi(x) - \phi(x_{0}) + 2LR, L \| x - x_{0} \|\}
$$

is strictly positive on $Q.$ Moreover, for all x with $\| x - x_{0} \| \leq R$ we have

$$
f(x) = \phi(x) - \phi(x_{0}) + 2LR.\tag{7.4.5}
$$

$If \| x_{0} - x^{*} \| \leq R$ , then problem (7.4.4) is equivalent to the problem

$$
f^{*} = \operatorname{min}_{x \in Q} f(x),
$$

with optimal value satisfying the following bounds:

$$
LR \leq f^{*} \leq 2LR.\tag{7.4.6}
$$

Proof Indeed, $f$ is strictly positive on $Q$ in view of Theorem 7.4.1. If $\| x - x_{0} \| \leq R$ then

$$
\phi(x) - \phi(x_{0}) + 2LR \stackrel{(7.4.3)}{\geq} 2LR - L \| x - x_{0} \| \geq L \| x - x_{0} \|,
$$

and we obtain representation (7.4.5). Further, $f^{*} \leq f(x_{0}) = 2LR$ . Finally,

$$
f(x) \stackrel{(7.4.3)}{\geq} \operatorname{max} \{2LR - L \| x - x_{0} \|, L \| x - x_{0} \|\} \geq LR.
$$

## 7.4.2 The Quasi-Newton Method

Consider the following minimization problem:

$$
\operatorname{min}_{x \in Q} f(x),\tag{7.4.7}
$$

where $Q$ is a closed convex set in $\mathbb{R}^{n}$ , and the function $f$ is strictly positive on $Q$ Denote by $x^{*}$ the optimal solution of this problem. It will be convenient to work with another objective function:

$$
\begin{array}{rl} &{\hat{f}(x) = \frac{1}{2} f^{2}(x),} \\ &{} \\ &{\hat{g}(x) = f(x) \cdot g(x) \overset{\mathrm{Lm} \3.1.8}{\in} \partial \hat{f}(x), \quad g(x) \in \partial f(x).} \end{array}\tag{7.4.8}
$$

Since the function $f$ is nonnegative, problem (7.4.7) can be rewritten in the equivalent form

$$
\operatorname{min}_{x \in Q}{\hat{f}}(x).\tag{7.4.9}
$$

The most unusual feature of the function $\hat{f}$ is the existence of nonlinear lower support functions.

Lemma 7.4.5 Let the function f be strictly positive on $Q.$ . Then for any x and $y \in Q$ we have

$$
\begin{array}{r}{\hat{f}(y) \geq \hat{f}(x) + \langle \hat{g}(x), y - x \rangle + \frac{1}{2} \langle g(x), y - x \rangle^{2}.} \end{array}\tag{7.4.10}
$$

Proof Indeed,

$$
\begin{array}{r}{\hat{f}(y) \overset{(7.4.8)}{=} \frac{1}{2} f^{2}(y) \overset{(7.4.2)}{=} \frac{1}{2}[f(x) + \langle g(x), y - x \rangle]^{2}} \\{(7.4.8)} \\{\overset{(7.4.8)}{=} \hat{f}(x) + \langle \hat{g}(x), y - x \rangle + \frac{1}{2} \langle g(x), y - x \rangle^{2}.} \end{array}
$$

We will use inequality (7.4.10) in the framework of estimating sequences (see Sects. 2.2.1, 4.2.4, and 6.1.3). Let us fix a symmetric $n \times n{\mathrm{- matriz}}$ x $G_{0} \succ 0$ , and a starting point $x_{0} \in{Q}$ . Define the primal and dual norms:

$$
\| x \|_{G_{0}} = \langle G_{0} x, x \rangle^{1 / 2}, \quad \| g \|_{G_{0}}^{*} = \langle g, G_{0}^{- 1} g \rangle^{1 / 2}, \quad x, g \in \mathbb{R}^{n}.
$$

We assume that $\| x_{0} - x^{*} \|_{G_{0}} \leq R$ . Define the initial function for the estimating sequence as follows:

$$
\begin{array}{r}{\psi_{0}(x) = \frac{1}{2} \| x - x_{0} \|_{G_{0}}^{2}.} \end{array}
$$

Let us $\operatorname{fix}$ an accuracy parameter $\delta \in(0, 1)$ . Assuming that $g(x_{k}) \neq 0, k \geq 0$ define

$$
\begin{array}{r}{a_{k} = \frac{\delta}{1 - \delta} \cdot \frac{1}{(\lVert g(x_{k}) \rVert_{G_{k}}^{*})^{2}}, \quad A_{k} = \sum_{i = 0}^{k - 1} a_{i}, \quad k \geq 0.} \end{array}\tag{7.4.11}
$$

Thus, $A_{0} = 0$ . For $k \geq 0$ , consider the following process:

$$
x_{k} = \arg \operatorname{min}_{x \in \mathcal{Q}} \psi_{k}(x),
$$

$$
\begin{array}{r}{\psi_{k + 1}(x) = \psi_{k}(x) + a_{k} \cdot \Big[\hat{f}(x_{k}) + \langle \hat{g}(x_{k}), x - x_{k} \rangle + \frac{1}{2} \langle g(x_{k}), x - x_{k} \rangle^{2} \Big].} \end{array}\tag{7.4.12}
$$

Clearly, in view of inequality (7.4.10), we have

$$
\psi_{k}(x) \leq A_{k} \hat{f}(x) + \psi_{0}(x), \quad x \in{\cal Q}.\tag{7.4.13}
$$

On the other hand, $\psi_{k}(\cdot)$ is a quadratic function with Hessian $G_{k} \succ 0$ updated by the following rule

$$
\begin{array}{r}{G_{k + 1} = G_{k} + a_{k} \cdot g(x_{k}) g^{T}(x_{k}) \stackrel{(7.4.11)}{=} G_{k} + \frac{\delta}{1 - \delta} \cdot \frac{g(x_{k}) g^{T}(x_{k})}{(\| g(x_{k}) \|_{G_{k}}^{*})^{2}}, \quad k \geq 0.} \end{array}\tag{7.4.14}
$$

Therefore, by the Sherman–Morrison–Woodbury rule, we have

$$
\begin{array}{r}{G_{k + 1}^{- 1} = G_{k}^{- 1} - \delta \cdot \frac{G_{k}^{- 1} g(x_{k}) g^{T}(x_{k}) G_{k}^{- 1}}{(\left\| g(x_{k}) \right\|_{G_{k}}^{*})^{2}}.} \end{array}
$$

Thus, we conclude that

$$
\begin{array}{rcl}{{\frac{1}{2} a_{k}^{2}(\| \hat{g}(x_{k}) \|_{G_{k + 1}}^{*})^{2}}} &{{\stackrel{(7.4.8)}{=}}} &{{a_{k}^{2} \cdot \hat{f}(x_{k}) \cdot(\| g(x_{k}) \|_{G_{k + 1}}^{*})^{2}}} \\{{}} &{{}} &{{}} \\{{}} &{{=}} &{{a_{k}^{2} \cdot \hat{f}(x_{k}) \cdot(1 - \delta) \cdot(\| g(x_{k}) \|_{G_{k}}^{*})^{2}}} \\{{}} &{{}} &{{}} \\{{}} &{{(7.{\overset{4.11}{=}})_{\begin{array}{c}{{\delta \cdot a_{k} \cdot \hat{f}(x_{k}).}} \end{array}}}} \end{array}\tag{7.4.15}
$$

Lemma 7.4.6 For any $k \geq 0$ we have

$$
\psi_{k}^{*} \stackrel{\mathrm{def}}{=} \operatorname{min}_{x \in Q} \psi_{k}(x) \ \geq \(1 - \delta) \sum_{i = 0}^{k - 1} a_{i} \hat{f}(x_{i}).\tag{7.4.16}
$$

Proof Let us prove inequality (7.4.16) by induction. For $k = 0$ it is true. Let us assume that it is true for some $k \geq 0$ . Since $\psi_{k}(\cdot)$ is a quadratic function, it is strongly convex in the norm $\| \cdot \|_{G_{k}}$ with convexity parameter one. Thus, for any $x \in Q$ the first-order optimality condition implies

$$
\begin{array}{r}{\psi_{k}(x) = \psi_{k}^{*} + \langle \psi_{k}^{\prime}(x_{k}), x - x_{k} \rangle + \frac{1}{2} \| x - x_{k} \|_{G_{k}}^{2} \overset{(2.2.40)}{\geq} \psi_{k}^{*} + \frac{1}{2} \| x - x_{k} \|_{G_{k}}^{2}.} \end{array}
$$

Therefore,

$$
\begin{array}{rlrl}{\psi_{k + 1}^{*}} &{\geq} &{\psi_{k}^{*} + \underset{x \in \b{\mathbb{Z}}}{\operatorname{min}} \left.\frac{1}{2} \Vert x - x_{k} \Vert_{G_{k}}^{2} + a_{k}[\hat{f}(x_{k}) + \langle \hat{g}(x_{k}), x - x_{k} \rangle \right.} \\ &{} & &{\left.+ \frac{1}{2} \langle g(x_{k}), x - x_{k} \rangle^{2}] \right.} \\ &{} &{^{(7, 4, 14)} \psi_{k}^{*} + a_{k} \hat{f}(x_{k}) + \underset{x \in \b{\mathbb{Z}}}{\operatorname{min}} \left.\frac{1}{2} \Vert x - x_{k} \Vert_{G_{k + 1}}^{2} + a_{k} \langle \hat{g}(x_{k}), x - x_{k} \rangle \right.} \\ &{\geq} &{\psi_{k}^{*} + a_{k} \hat{f}(x_{k}) - \frac{1}{2} a_{k}^{2} \Vert \hat{g}(x_{k}) \Vert_{G_{k + 1}}^{2}} \\ &{} &{^{(7, 4, 15)} \psi_{k}^{*} +(1 - \delta) \cdot a_{k} \hat{f}(x_{k}).} \end{array}
$$

We can now estimate the rate of convergence of method (7.4.12). Define

$$
x_{k}^{*} = \arg \operatorname{min}_{x} \{f(x) : \x = x_{0}, \ldots, x_{k}\}, \quad \tilde{x}_{k} = \textstyle{\frac{1}{A_{k}}} \sum_{i = 0}^{k - 1} a_{i} x_{i}.
$$

Theorem 7.4.2 Let us assume that a strictly positive function f has uniformly bounded subgradients:

$$
\| g(x) \|_{G_{0}}^{*} \leq L, \quad x \in Q.\tag{7.4.17}
$$

Then, for any $k \geq 0$ we have

$$
(1 - \delta) \hat{f}(x_{k}^{*}) \le \hat{f}(x^{*}) + \frac{L^{2} \mathbb{R}^{2}}{2n \left[e^{\delta(k + 1) / n} - 1 \right]}.\tag{7.4.18}
$$

This estimate is also valid for the value $\hat{f}(\tilde{x}_{k + 1})$

Proof In view of inequalities (7.4.13) and (7.4.16),

$$
\begin{array}{r}{(1 - \delta) \hat{f}(x_{k}^{*}) \le \hat{f}(x^{*}) + \frac{1}{2A_{k + 1}} \| x_{0} - x^{*} \|_{G_{0}}^{2}.} \end{array}
$$

Let us estimate the rate of growth of the coefficients $A_{k}$ . Let $\bar{G}_{k} = G_{0}^{- 1 / 2} G_{k} G_{0}^{- 1 / 2}$ $k \geq 0$ . Since det $G_{k + 1} \stackrel{(7.4.14)}{=} \frac{1}{1 - \delta}$ det $G_{k}$ , we have

$$
\begin{array}{r}{\operatorname{det} \bar{G}_{k} = \frac{1}{(1 - \delta)^{k}}, \quad k \geq 0.} \end{array}\tag{7.4.19}
$$

It remains to note that

$$
A_{k} \overset{(7.4.11)}{=} \sum_{i = 0}^{k - 1} a_{i} \overset{(7.4.17)}{\geq} \frac{1}{L^{2}} \sum_{i = 0}^{k - 1} a_{i}(\| g(x_{i}) \|_{G_{0}}^{*})^{2} \overset{(7.4.11)}{=} \frac{1}{L^{2}} \left[\mathrm{Trace} \ \bar{G}_{k} - n \right]
$$

$$
\begin{array}{r}{\stackrel{(7.4.19)}{\geq} \frac{n}{L^{2}} \left[\frac{1}{(1 - \delta)^{k / n}} - 1 \right] \geq \frac{n}{L^{2}} \left[e^{\delta k / n} - 1 \right].} \end{array}
$$

## 7.4.3 Interpretation of Approximate Solutions

Note that the quality of point $x_{k}^{*}$ as an approximate solution to problem (7.4.9) is characterized by inequality (7.4.18) in a nonstandard way. Let us introduce a new definition.

Definition 7.4.2 We say that a point $\bar{x} \in \mathsf{\Gamma}.$ is an approximate solution to problem (7.4.9) with mixed ($\epsilon$, δ)-accuracy if

$$
(1 - \delta) \hat{f}(\bar{x}) \leq \hat{f}(x^{*}) + \epsilon.
$$

In this definition, $\epsilon > 0$ serves as an absolute accuracy, and $\delta \in(0, 1)$ represents the relative accuracy of the point $\bar{x}.$ . Thus, in view of (7.4.18), the mixed $(\epsilon, \delta)$ accuracy can be reached by the Quasi-Newton Method (7.4.12) in

$$
\begin{array}{r}{N_{n}(\epsilon, \delta) \stackrel{\mathrm{def}}{=} \frac{n}{\delta} \ln \left(1 + \frac{L^{2} \mathbb{R}^{2}}{2n \epsilon} \right)} \end{array}\tag{7.4.20}
$$

iterations.

Thus, it is not difficult to reach a high absolute accuracy. A high level of relative accuracy is much more expensive. Nevertheless, despite to the non-smoothness of the objective function in (7.4.9), the number of iterations of method (7.4.12) is proportional to $\frac{1}{\delta}$ . This is, of course, a consequence of the finite dimension of the space of variables. Note that we have the following uniform upper bound for our estimate of the number of iterations:

$$
N_{n}(\epsilon, \delta) < N_{\infty}(\epsilon, \delta) \stackrel{\mathrm{criptsize ~ def}}{=} \frac{L^{2} \mathbb{R}^{2}}{2 \epsilon \delta}.\tag{7.4.21}
$$

It is easy to see that the bound $N_{n}(\epsilon, \delta)$ is a monotonically increasing function of dimension n.

Let us discuss now the ability of method (7.4.12) to generate approximate solutions in the standard accuracy scales.

## 7.4.3.1 Relative Accuracy

Consider our initial problem (7.4.7). Assume that our goal is to generate an approximate solution ${\bar{x}} \in Q$ to this problem with relative accuracy $\delta \in(0, \frac{1}{2})$ :

$$
f(\bar{x}) \leq(1 + \delta) f^{*}.\tag{7.4.22}
$$

After k iterations of method (7.4.12), we have

$$
\begin{array}{r}{(1 - \delta)(f(x_{k}^{*}) - f^{*}) f^{*} \overset{(7.4.8)}{\leq}(1 - \delta)(\hat{f}(x_{k}^{*}) - \hat{f}(x^{*}))} \\{(7.4.18)} \\{\leq \delta \hat{f}(x^{*}) + \frac{L^{2} \mathbb{R}^{2}}{2n \left[e^{\delta(k + 1) / n} - 1 \right]}.} \end{array}\tag{7.4.23}
$$

In order to have the point $\bar{x} = x_{k}^{*}$ satisfying inequality (7.4.22), we need to ensure that the right-hand side of the latter inequality does not exceed $\delta(1 - \delta)(f^{*})^{2}$ . Thus, for $\delta \in(0, \frac{1}{2})$ we need

$$
\begin{array}{r}{k = R_{n}(\delta) \ \stackrel{\mathrm{def}}{=} \ \frac{n}{\delta} \ln \left(1 + \frac{L^{2} \mathbb{R}^{2}}{n \delta(1 - 2 \delta)(f^{*})^{2}} \right)} \end{array}\tag{7.4.24}
$$

iterations. Note that the main factor $\frac{n}{\delta}$ in this complexity bound does not depend on the data of the problem. Thus, for problem (7.4.7), we get a fully polynomial-time approximation scheme. Its dependence on n is the same as that of optimal methods for nonsmooth convex minimization in finite dimensions. However, each iteration of method (7.4.12) is very simple, of the same order as in the Ellipsoid Method. Note that for problem (7.4.7) the Ellipsoid Method has complexity bound $\begin{array}{r}{O(n^{2} \ln \frac{LR}{\delta f^{\ast}})} \end{array}$ iterations (see, Sect. 3.2.8). Thus, for a moderate relative accuracy, method (7.4.12) is faster. It is important that the right-hand side of inequality (7.4.24) is uniformly

## 7.4 Optimization with Mixed Accuracy

bounded as $n \to \infty$

$$
\begin{array}{r}{R_{n}(\delta) < R_{\infty}(\delta) \ \stackrel{\mathrm{def}}{=} \ \frac{L^{2} \mathbb{R}^{2}}{\delta^{2}(1 - 2 \delta)(f^{*})^{2}}.} \end{array}
$$

## 7.4.3.2 Absolute Accuracy

Consider now the general minimization problem (7.4.4), which we want to solve with absolute accuracy $\epsilon > 0$

$$
\phi(\bar{x}) \leq \phi^{*} + \epsilon, \quad \bar{x} \in Q.\tag{7.4.25}
$$

We assume that $\phi$ satisfies condition (7.4.3) and the constants $L$ and R are known. Moreover, for the sake of simplicity, we assume that

$$
\| x - x_{0} \| \leq R \quad \forall x \in Q.\tag{7.4.26}
$$

Defining now a new strictly positive objective function $f(\cdot)$ by equation (7.4.5), we get

$$
f(x) = \phi(x) - \phi(x_{0}) + 2LR \quad \forall x \in{\cal Q}.\tag{7.4.27}
$$

Let us choose some $\delta \in(0, 1)$ and apply method (7.4.12) to the corresponding problem (7.4.7) (by solving (7.4.9), of course). After k iterations of this scheme, we have

$$
\begin{array}{rl} &{\phi(x_{k}^{*}) - \phi^{*} \overset{(7.4.27)}{=} f(x_{k}^{*}) - f^{*} \overset{(7.4.23)}{\leq} \frac{\delta f^{*}}{2(1 - \delta)} + \frac{L^{2} \mathbb{R}^{2}}{2n \left[e^{\delta(k + 1) / n} - 1 \right] \cdot(1 - \delta) f^{*}}} \\ &{\overset{(7.4.6)}{\leq} LR \left[\frac{\delta}{1 - \delta} + \frac{1}{2n \left[e^{\delta(k + 1) / n} - 1 \right] \cdot(1 - \delta)} \right].} \end{array}
$$

Thus, to obtain accuracy $\epsilon > 0$ , we can find $\delta = \delta(\epsilon)$ from the equation

$$
\begin{array}{r}{\frac{\delta}{1 - \delta} = \frac{\epsilon}{2LR} \quad \Rightarrow \quad \delta(\epsilon) = \frac{\epsilon}{\epsilon + 2LR}.} \end{array}
$$

Then, we need at most

$$
\begin{array}{l}{{k = T_{n}(\epsilon) \{\stackrel{\mathrm{def}}{=}} \{\frac{n}{\delta(\epsilon)}} \ln \left(1 +{\frac{LR}{n \epsilon(1 - \delta(\epsilon))}} \right)}} \\{{\}} \\{{= \n \left(1 + 2{\frac{LR}{\epsilon}} \right) \cdot \ln \left(1 +{\frac{\epsilon + 2LR}{2n \epsilon}} \right)}} \end{array}\tag{7.4.28}
$$

iterations of method (7.4.12). Note that

$$
\begin{array}{r}{T_{n}(\epsilon) < T_{\infty}(\epsilon) \ = \ \frac{1}{2} \left(1 + 2 \frac{LR}{\epsilon} \right)^{2}.} \end{array}
$$

Thus, in finite dimensions the worst-case complexity bound of the Quasi-Newton Method (7.4.12) is always better than the bound of the standard subgradient scheme (see Sect. 3.2.3).

# Appendix A Solving Some Auxiliary Optimization Problems

## A.1 Newton’s Method for Univariate Minimization

Let us show that Newton’s Method is very efficient in finding the maximal root of increasing convex univariate functions. Consider a univariate function f such that

$$
f(\tau_{*}) = 0, f(\tau) > 0,{\mathrm{~ for ~}} \tau > \tau_{*},\tag{A.1.1}
$$

and it is convex for $\tau \geq \tau_{*}$ . Let us choose $\tau_{0} > \tau_{*}$ . Consider the following Newton process:

$$
\begin{array}{r}{\tau_{k + 1} = \tau_{k} - \frac{f(\tau_{k})}{g_{k}},} \end{array}\tag{A.1.2}
$$

where $g_{k} \in \partial f(\tau_{k})$ . Thus, we do not assume f to be differentiable for $\tau \geq \tau_{*}$

Theorem A.1.1 Method (A.1.2) is well defined. For any $k \geq 0$ we have

$$
\begin{array}{r}{f(\tau_{k + 1}) g_{k + 1} \leq \frac{1}{4} f(\tau_{k}) g_{k}.} \end{array}\tag{A.1.3}
$$

Thus, $\begin{array}{r}{f(x_{k}) \leq \left(\frac{1}{2} \right)^{k} g_{0}(\tau_{0} - \tau_{*}).} \end{array}$

Proof Let $f_{k} = f(\tau_{k})$ . Let us assume that $f_{k} > 0$ for all $k \geq 0$ . Since f is convex for $\tau \geq \tau_{*}, 0 = f(\tau_{*}) \geq f_{k} + g_{k}(\tau_{*} - \tau_{k})$ . Thus,

$$
g_{k}(\tau_{k} - \tau_{*}) \geq f_{k} > 0.\tag{A.1.4}
$$

This means that $g_{k} > 0$ and $\tau_{k + 1} \in[\tau_{*}, \tau_{k})$ . In particular, we conclude that

$$
\tau_{k} - \tau_{*} \leq \tau_{0} - \tau_{*}.\tag{A.1.5}
$$

Further, for any $k \geq 0$ we have:

$$
\begin{array}{r}{f_{k} \geq f_{k + 1} + g_{k + 1}(\tau_{k} - \tau_{k + 1}) \stackrel{\mathrm{(A.1.2)}}{=} f_{k + 1} + \frac{f_{k} g_{k + 1}}{g_{k}}.} \end{array}
$$

Thus, $\begin{array}{r}{1 \geq \frac{f_{k + 1}}{f_{k}} + \frac{g_{k + 1}}{g_{k}} \geq 2 \sqrt{\frac{f_{k + 1} g_{k + 1}}{f_{k} g_{k}}}} \end{array}$ , and this is (A.1.3). Finally, since f is convex for $\tau \geq \tau_{*}$ , we have

$$
\begin{array}{r}{g_{0} \overset{\mathrm{(A.1.4)}}{\geq} \sqrt{\frac{f_{0} g_{0}}{\tau_{0} - \tau_{*}}} \overset{\mathrm{(A.1.3)}}{\geq} 2^{k} \sqrt{\frac{f_{k} g_{k}}{\tau_{0} - \tau_{*}}} \overset{\mathrm{(A.1.4)}}{\geq} 2^{k} \sqrt{\frac{f_{k}^{2}}{(\tau_{0} - \tau_{*})(\tau_{k} - \tau_{*})}}} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(\mathrm{A.1.5})}{\geq} 2^{k} \frac{f_{k}}{\tau_{0} - \tau_{*}}.} \end{array}
$$

□

Thus, we have seen that method (A.1.2) has linear rate of convergence, which does not depend on the particular properties of the function f . Let us show that in a non-degenerate situation this method has local quadratic convergence.

Theorem A.1.2 Let a convex function f be twice differentiable. Assume that it satisfies the conditions (A.1.1) and its second derivative increases for $\tau \geq \tau_{*}$ . Then for any $k \geq 0$ we have

$$
\begin{array}{r}{f(\tau_{k + 1}) \leq \frac{f^{\prime \prime}(\tau_{k})}{2(f^{\prime}(\tau_{k}))^{2}} \cdot f^{2}(\tau_{k}).} \end{array}\tag{A.1.6}
$$

If the root $\tau_{*}$ is non-degenerate:

$$
f^{\prime}(\tau_{*}) > 0,\tag{A.1.7}
$$

then $\begin{array}{r}{f(\tau_{k + 1}) \leq \frac{f^{\prime \prime}(\tau_{0})}{2(f^{\prime}(\tau_{*}))^{2}} \cdot f^{2}(\tau_{k}).} \end{array}$

Proof In view of conditions of the theorem, $f^{\prime \prime}(\tau) \leq f^{\prime \prime}(\tau_{k})$ for all $\tau \in[\tau_{k + 1}, \tau_{k}]$ Therefore,

$$
\begin{array}{lll}{{f(\tau_{k + 1})}} &{{\le}} &{{f(\tau_{k}) + f^{\prime}(\tau_{k})(\tau_{k + 1} - \tau_{k}) + \frac{1}{2} f^{\prime \prime}(\tau_{k})(\tau_{k + 1} - \tau_{k})^{2}}} \\{{}} &{{}} &{{}} \\{{}} &{{\stackrel{\mathrm{(A.1.2)}}{=}}} &{{\frac{1}{2} f^{\prime \prime}(\tau_{k}) \frac{f^{2}(\tau_{k})}{(f^{\prime}(\tau_{k}))^{2}}.}} \end{array}
$$

To prove the last statement, it remains to note that $f^{\prime \prime}(\tau_{k}) \leq f^{\prime \prime}(\tau_{0})$ and $f^{\prime}(\tau_{k}) \geq$ $f^{\prime}(\tau_{*})$ .

## A.2 Barrier Projection onto a Simplex

In the case $K = \mathbb{R}_{+}^{n}$ , we can take

$$
F(x) = - \sum_{i = 1}^{n} \ln x^{(i)}, \quad \nu = n.
$$

Consider $\hat{P} = \{x \in \mathbb{R}_{+}^{n} : \langle \bar{e}_{n}, x \rangle = 1\}$ . Then, at each iteration of method (7.3.14) we need to solve the following problem:

$$
\phi^{*} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{x} \left\{\langle s, x \rangle + \sum_{i = 1}^{n} \ln x^{(i)} : \ \sum_{i = 1}^{n} x^{(i)} = 1 \right\}.\tag{A.2.1}
$$

Let us show that its complexity does not depend on the size of particular data (that is, the coefficients of the vector $s \in \mathbb{R}^{n})$

Consider the following Lagrangian:

$$
{\mathcal{L}}(x, \lambda) = \langle s, x \rangle + \sum_{i = 1}^{n} \ln x^{(i)} + \lambda \cdot \left[1 - \sum_{i = 1}^{n} x^{(i)} \right], \quad x \in \mathbb{R}^{n}, \ \lambda \in \mathbb{R}.
$$

The dual function

$$
\phi(\lambda) = \operatorname{max}_{x} \left\{{\mathcal{L}}(x, \lambda) : \sum_{i = 1}^{n} x^{(i)} = 1 \right\} \stackrel{\mathrm{def}}{=}{\mathcal{L}}(x(\lambda), \lambda)
$$

is defined by the vector $\begin{array}{r}{x(\lambda) : \x^{(i)}(\lambda) = \frac{1}{\lambda - s^{(i)}}, i = 1, \dots, n} \end{array}$ . Thus,

$$
\begin{array}{c}{{\phi(\lambda) = - n + \lambda - \displaystyle \sum_{i = 1}^{n} \ln \left(\lambda - s^{(i)} \right),}} \\{{\phi_{*} = \displaystyle \operatorname{min}_{\lambda} \left\{\phi(\lambda) : \lambda > \operatorname{max}_{1 \leq i \leq n} s^{(i)} \right\}.}} \end{array}\tag{A.2.2}
$$

Note that $\phi(\cdot)$ is a standard self-concordant function. Therefore we can apply to its minimization the intermediate Newton’s Method (5.2.1), Item C), which converges quadratically starting from any λ from the region

$$
\mathcal{Q}(s) = \{\lambda : 4(\phi^{\prime}(\lambda))^{2} \leq \phi^{\prime \prime}(\lambda)\}
$$

(see Theorem 5.2.2). Let us show that the complexity of finding a starting point from this set does not depend on the initial data.

Consider the function $\psi(\lambda) ~ = ~ - \phi^{\prime}(\lambda) ~ = ~ \sum_{i = 1}^{n} \frac{1}{\lambda - s^{(i)}} - 1$ . Clearly, the problem (A.2.2) is equivalent to finding the largest root $\lambda_{*}$ of the equation

$$
\psi(\lambda) = 0.\tag{A.2.3}
$$

Let $\lambda_{0} = 1 + \operatorname{max}_{1 \leq i \leq n} s^{(i)}$ . Then $\psi(\lambda_{0}) \ge 0$ and therefore $\lambda_{0} \leq \lambda_{*}$ . Consider the following process:

$$
\begin{array}{r}{\lambda_{k + 1} = \lambda_{k} - \frac{\psi(\lambda_{k})}{\psi^{\prime}(\lambda_{k})}, \quad k \ge 0.} \end{array}\tag{A.2.4}
$$

This is a standard Newton’s method for solving the Eq. (A.2.3), which can be also interpreted as a Newton’s method for the minimization problem (A.2.2).

Lemma A.2.1 For any $k \geq 0$ we have $\begin{array}{r}{(\phi^{\prime}(\lambda_{k}))^{2} \leq n^{7} \cdot \left(\frac{1}{16} \right)^{k} \phi^{\prime \prime}(\lambda_{k}).} \end{array}$

Proof Note that function $\psi$ is decreasing and strictly convex. Therefore, for any $k \geq 0$ we have

$$
\lambda_{k} ~ < ~ \lambda_{k + 1} ~ < \lambda_{*}, ~ \psi^{\prime}(\lambda_{k}) ~ < 0 ~, ~ \psi(\lambda_{k}) ~ > ~ 0.
$$

Since $\begin{array}{rlr}{\psi(\lambda_{k})} &{\geq} &{\psi(\lambda_{k + 1}) + \psi^{\prime}(\lambda_{k + 1})(\lambda_{k} - \lambda_{k + 1}) ~ = ~ \psi(\lambda_{k + 1}) + \frac{\psi^{\prime}(\lambda_{k + 1})}{\psi^{\prime}(\lambda_{k})} \psi(\lambda_{k}).} \end{array}$ we obtain<sup>1</sup>

$$
\begin{array}{r}{1 \ge \frac{\psi(\lambda_{k + 1})}{\psi(\lambda_{k})} + \frac{\psi^{\prime}(\lambda_{k + 1})}{\psi^{\prime}(\lambda_{k})} \ge 2 \sqrt{\frac{\psi(\lambda_{k + 1}) \psi^{\prime}(\lambda_{k + 1})}{\psi(\lambda_{k}) \psi^{\prime}(\lambda_{k})}}.} \end{array}
$$

Thus, for any $k \geq 0$ we get

$$
\begin{array}{r}{\phi^{\prime \prime}(\lambda_{k}) \cdot | \phi^{\prime}(\lambda_{k}) | \leq \left(\frac{1}{4} \right)^{k} \phi^{\prime \prime}(\lambda_{0}) \cdot | \phi^{\prime}(\lambda_{0}) |.} \end{array}\tag{A.2.5}
$$

Further, in view of the choice of $\lambda_{0}$ we have

$$
| \phi^{\prime}(\lambda_{0}) | = \psi(\lambda_{0}) = \sum_{i = 1}^{n} \frac{1}{\lambda_{0} - s^{(i)}} - 1 < n - 1,
$$

$$
\phi^{\prime \prime}(\lambda_{0}) = \sum_{i = 1}^{n} \frac{1}{(\lambda_{0} - s^{(i)})^{2}} \ \leq \n.
$$

Finally, since $0 \leq \psi(\lambda_{k}) = \sum_{i = 1}^{n}{\frac{1}{\lambda_{k - s}(i)}} - 1$ , we conclude that

$$
\phi^{\prime \prime}(\lambda_{k}) = \sum_{i = 1}^{n} \frac{1}{(\lambda_{k} - s^{(i)})^{2}} \ \geq \ \frac{1}{n}.
$$

Using these bounds in (A.2.5), we obtain

$$
\begin{array}{r}{\frac{1}{\phi^{\prime \prime}(\lambda_{k})}(\phi^{\prime}(\lambda_{k}))^{2} \leq \left(\frac{1}{16} \right)^{k} \frac{(\phi^{\prime \prime}(\lambda_{0}))^{2}(\phi^{\prime}(\lambda_{0}))^{2}}{(\phi^{\prime \prime}(\lambda_{k}))^{3}} \leq \left(\frac{1}{16} \right)^{k} \cdot n^{7}.\qquad \square} \end{array}
$$

Comparing the statement of Lemma A.2.1 with the definition of ${\mathcal{Q}}(s)$ , we conclude that the process (A.2.4) arrives at the region of quadratic convergence at most after

$$
\textstyle{\left\lceil{\frac{1}{4}}(2 + 7 \log_{2} n) \right\} rceil\tag{A.2.6}
$$

iterations. Each such iteration takes $O(n)$ arithmetic operations.

A similar technique can be used for finding the barrier projection in the cone of positive-semidefinite matrices:

$$
\operatorname{max}_{X} \{\langle S, X \rangle + \ln \operatorname{det} X : \ \langle I_{n}, X \rangle = 1\}.
$$

The most straightforward strategy consists in finding an eigenvalue decomposition of the matrix S and solving the problem (A.2.1) with s being the spectrum of the matrix. In a more efficient strategy, we transform S into tri-diagonal form by an orthogonal transformation, compute its maximal eigenvalue and apply the Newton’s method to the corresponding dual function.

## Bibliographical Comments

In the past few decades, numerical methods for Convex Optimization have become widely studied in the monographic literature. The reader interested in engineering applications can benefit from the introductory exposition by Polyak [55], excellent course by Boyd and Vandenberghe [6], and lecture notes by Ben-Tal and Nemirovski [5]. Mathematical aspects are described in detail in the older lectures by A. Nemirovski (see [33] for the Internet version) and in the original versions of the theory for Interior-Point Methods by Renegar [57], Roos et al. [59], and Ye [63]. Recent theoretical highlights can be found in the monographs by Beck [3] and Bubeck [7]. In our book, we have tried to be more balanced, combining the comprehensive mathematical theory with many examples of practical applications, sometimes supported by numerical experiments.

## Chapter 1: Nonlinear Optimization

Section 1.1 The complexity theory for black-box optimization schemes was developed in [34], where the reader can find different examples of resisting oracles and lower complexity bounds similar to that of Theorem 1.1.2.

Sections 1.2 and 1.3 There exist several classical monographs [11, 12, 30, 53] treating different aspects of Nonlinear Optimization. For understanding Sequential Unconstrained Minimization, the best source is still [14]. Some facts in Sect. 1.3, related to conditions for zero duality gap, are probably new.

## Chapter 2: Smooth Convex Optimization

Section 2.1 The original lower complexity bounds for smooth convex and strongly convex functions can be found in [34]. The proof used in this section was first published in [39].

Section 2.2 Gradient mapping was introduced in [34]. The first optimal method for smooth and strongly convex functions was proposed in [35]. The constrained variant of this scheme is taken from [37]. However, the framework of estimating sequences was suggested for the first time in [39]. A discussion of different approaches for generating points with small norm of the gradient can be found in [48].

Section 2.3 Optimal methods for discrete minimax problems were developed in [37]. The approach of Sect. 2.3.5 was first described in [39].

## Chapter 3: Nonsmooth Convex Optimization

Section 3.1 A comprehensive treatment of different topics of Convex Analysis can be found in [24]. However, the classical monograph [58] is still very useful.

Section 3.2 Lower complexity bounds for nonsmooth minimization problems can be found in [34]. The framework of Sect. 3.2.2 was suggested in [36]. For detailed bibliographical comments on the early history of Nonsmooth Minimization see [55, 56].

Section 3.3 The example of a difficult function for Kelley’s method is taken from [34]. The presentation of the Level Method in this section is close to [28].

## Chapter 4: Second-Order Methods

Section 4.1 Starting from the seminal papers of Bennet [4] and Kantorovich [26], Newton’s Method became an important tool for numerous applied problems. In the last 50 years, the number of different suggestions for improving the scheme is extremely large (see, for example, [11, 12, 15, 21, 29, 31]). The reader can consult an exhaustive bibliography in [11].

Most probably, the natural idea of using cubic regularization to improve the stability of the Newton scheme was first analyzed in [22]. However, the author was very sceptical about the complexity of solving the auxiliary minimization problem in the case of nonconvex quadratic approximation (and indeed, it can have an exponential number of local minima). As a result, this paper was never published. Twenty five years later, in an independent paper [52] this idea was checked again, and it was shown that this problem is solvable by standard techniques of Linear Algebra. The authors also developed global worst-case complexity bounds for different problem classes. This paper forms the basis of Sect. 4.1. The interested reader can also consult the complementary approach [8, 9], where cubic regularization is coupled with a line search along the gradient direction. However, note that this feature, though improving somewhat the numerical stability, forces the algorithm to stop at saddle points. A historical exposition of the development in this field with recent results, including lower complexity bounds for gradient norm minimization, can be found in [10].

Section 4.2 This section is based on the paper [45].

Section 4.3 This section is based on very recent and partially unpublished results. The first lower complexity bounds for second-order methods were obtained in [2]. At the same time, one of the second-order schemes in [32] achieves the rate of convergence $\begin{array}{r}{\tilde{O} \left(\frac{1}{k^{7 / 2}} \right)} \end{array}$ , which is optimal. However, each iteration of this method needs an expensive search procedure based on additional calls of oracle. So, its practical efficiency is questionable.

In our presentation, we use a simpler derivation of the lower complexity bounds and a simpler conceptual version of the “optimal” second-order scheme, based on iteration of the Cubic Newton Method.

Section 4.4 Methods for solving systems of nonlinear equations have attracted a lot of attention (see [11, 12, 53, 54]). However, we have not been able to find any global worst-case efficiency estimates for them in the literature. Our presentation follows the paper [43].

## Chapter 5: Polynomial-Time Interior-Point Methods

This chapter contains an adaptation of the main concepts from [51]. We added several useful inequalities and a slightly simplified presentation of the path-following scheme. We refer the reader to [5] for numerous applications of interior-point methods, and to [57, 59, 62] and [63] for a detailed treatment of different theoretical aspects.

Section 5.1 In this section, we introduce the definition of a self-concordant function and study its properties. As compared with Section 4.1 in [39], we add Fenchel duality and the Implicit Function Theorem. The main novelty is an explicit treatment of the constant of self-concordance. However, most of the material can be found in [51].

Section 5.2 In this new section, we analyze different methods for minimizing selfconcordant functions. We propose a new step-size rule for the Newton scheme (intermediate step), which gives better constants for the path-following approach. Complexity estimates for a path-following scheme, as applied to a self-concordant function, were obtained only recently [13].

Section 5.3 In this section we study the properties of a self-concordant barrier and give the complexity analysis for the path-following method. This is an adaptation of Section 4.2 in [39].

Section 5.4 In this section, we give examples of self-concordant barriers and related applications. This is an extension of Section 4.3 in [39] by the results of [49].

## Chapter 6: The Primal-Dual Model of an Objective Function

This is the first attempt at presenting in the monographic literature the fast primaldual gradient methods based on an explicit minimax model of the objective function. In the first three sections we present different aspects of the smoothing technique, following the papers [40, 41], and [42]. It seems that the Fast Gradient Method in the form of the Method of Similar Triangles (6.1.19) was published for the first time only recently (see [20]).

The last Sect. 6.4 is devoted to the new analysis of the old Conditional Gradient Method (or, the Frank–Wolfe algorithm [16, 18, 19, 23, 25]). Our presentation follows the paper [50], which is close in spirit to [17].

## Chapter 7: Optimization in Relative Scale

The presentation in this new chapter is based on the papers [44, 46], and [47]. Some examples of application were analyzed in [5], however, from the viewpoint of the applicability of Interior-Point Methods. Algorithms for computing the rounding ellipsoids are studied in [1, 27, 61], and in the recent book [60]. Constant quality of semidefinite relaxation for Boolean quadratic maximization with general matrix was proved in [38]. The material of Sect. 7.4 is new.

1. K.M. Anstreicher, Ellipsoidal approximations of convex sets based on the volumetric barrier. CORE Discussion Paper 9745, 1997

2. Y. Arjevani, O. Shamir, R. Shiff, Oracle complexity of second-order methods for smooth convex optimization. arXiv:1705.07260v2 (2017)

3. A. Beck, First-Order Methods in Optimization (SIAM, Philadelphia, 2017)

4. A.A. Bennet, Newton’s method in general analysis. Proc. Natl. Acad. Sci. U. S. A. 2(10), 592– 598 (1916)

5. A. Ben-Tal, A. Nemirovskii, Lectures on Modern Convex Optimization: Analysis, Algorithms, and Engineering Applications (SIAM, Philadelphia, 2001)

6. S. Boyd, L. Vandenberghe, Convex Optimization (Cambridge University Press, Cambridge, 2004)

7. S. Bubeck, Convex Optimization: Algorithms and Complexity (Now Publishers, LP Breda, 2015). arXiv:1405.4980

8. C. Cartis, N.I.M. Gould, P.L. Toint, Adaptive cubic regularisation methods for unconstrained optimization. Part I: motivation, convergence and numerical results. Math. Program. 127(2), 245–295 (2011)

9. C. Cartis, N.I.M. Gould, P.L. Toint, Adaptive cubic regularisation methods for unconstrained optimization. Part II: worst-case function- and derivative-evaluation complexity. Math. Program. 130(2), 295–319 (2011)

10. C. Cartis, N.I.M. Gould, P.L. Toint, How much patience do you have? a worst-case perspective on smooth nonconvex optimization. Optima 88, 1–10 (2012)

11. A.B. Conn, N.I.M. Gould, P.L. Toint. Trust Region Methods (SIAM, Philadelphia, 2000)

12. J.E. Dennis, R.B. Schnabel, Numerical Methods for Unconstrained Optimization and Nonlinear Equations, 2nd edn. (SIAM, Philadelphia, 1996)

13. P. Dvurechensky, Yu. Nesterov, Global performance guarantees of second-order methods for unconstrained convex minimization, CORE Discussion Paper, 2018

14. A.V. Fiacco, G.P. McCormick, Nonlinear Programming: Sequential Unconstrained Minimization Techniques (Wiley, New York, 1968)

15. R. Fletcher, Practical Methods of Optimization, Vol. 1, Unconstrained Minimization (Wiley, New York, 1980)

16. M. Frank, P. Wolfe, An algorithm for quadratic programming. Nav. Res. Logist. Q. 3, 149–154 (1956)

17. R.M. Freund, P. Grigas, New analysis and results for the Frank–Wolfe method. Math. Program. 155, 199–230 (2014). https://doi.org/10.1007/s10107-014-0841-6

18. D. Garber, E. Hazan, A linearly convergent conditional gradient algorithm with application to online and stochastic optimization. arXiv: 1301.4666v5 (2013)

19. D. Garber, E. Hazan, Faster rates for the Frank–Wolfe method over strongly convex sets. arXiv:1406.1305v2 (2015)

20. A. Gasnikov, Yu. Nesterov, Universal method for problems of stochastic composite minimization. Comput. Math. Math. Phys. 58(1), 48–64 (2018)

21. S. Goldfeld, R. Quandt, H. Trotter, Maximization by quadratic hill climbing. Econometrica 34, 541–551 (1966)

22. A. Griewank, The modification of Newton’s method for unconstrained optimization by bounding cubic terms, Technical Report NA/12 (1981), Department of Applied Mathematics and Theoretical Physics, University of Cambridge, United Kingdom, 1981

23. Z. Harchaoui, A. Juditsky, A. Nemirovski, Conditional gradient algorithms for normregularized smooth convex optimization. Math. Program. 152, 75–112 (2014). https://doi.org/ 10.1007/s10107-014-0778-9

24. J.-B. Hiriart-Urruty, C. Lemarechal, Convex Analysis and Minimization Algorithms. Part 1. A Series of Comprehensive Studies in Mathematics (Springer, Berlin, 1993)

25. M. Jaggi, Revisiting Frank–Wolfe: projection-free sparse convex optimization, in Proceedings of the 30th International Conference on Machine Learning, Atlanta, Georgia (2013)

26. L.V. Kantorovich, Functional analysis and applied mathematics. Uspehi Mat. Nauk 3(1), 89– 185 (1948) (in Russian). Translated as N.B.S. Report 1509, Washington D.C., 1952

27. L.G. Khachiyan, Rounding of polytopes in the real number model of computation. Math. Oper. Res. 21(2), 307–320 (1996)

28. C. Lemarechal, A. Nemirovskii, Yu. Nesterov, New variants of bundle methods. Math. Program. 69, 111–148 (1995)

29. K. Levenberg. A method for the solution of certain problems in least squares. Q. Appl. Math. 2, 164–168 (1944)

30. D.G. Luenberger, Linear and Nonlinear Programming, 2nd edn. (Addison Wesley, Boston, 1984)

31. D. Marquardt, An algorithm for least-squares estimation of nonlinear parameters. SIAM J. Appl. Math. 11, 431–441 (1963)

32. R. Monteiro, B. Svaiter, An accelerated hybrid proximal extragradient method for convex optimization and its implications to second-order methods. SIAM J. Optim. 23(2), 1092–1125 (2013)

33. A. Nemirovski, Interior-point polynomial-time methods in convex programming (1996), https://www2.isye.gatech.edu/\~nemirovs/LectIPM.pdf

34. A.S. Nemirovskij, D.B. Yudin, Problem Complexity and Method Efficiency in Optimization. Wiley-Interscience Series in Discrete Mathematics (A Wiley-Interscience Publication/Wiley, New York, 1983)

35. Yu. Nesterov, A method for unconstrained convex minimization problem with the rate of convergence $O(\textstyle{\frac{1}{k^{2}}})$ . Doklady AN SSSR 269, 543–547 (1983) (In Russian; translated as Soviet Math. Docl.)

36. Yu. Nesterov, Minimization methods for nonsmooth convex and quasiconvex functions. Ekonomika i Mat. Metody 11(3), 519–531 (1984) (In Russian; translated in MatEcon.)

37. Yu. Nesterov, Efficient Methods in Nonlinear Programming (Radio i Sviaz, Moscow, 1989) (In Russian.)

38. Yu. Nesterov, Semidefinite relaxation and nonconvex quadratic optimization. Optim. Methods Softw. 9, 141–160 (1998)

39. Yu. Nesterov, Introductory Lectures on Convex Optimization. A Basic Course (Kluwer, Boston, 2004)

40. Yu. Nesterov, Smooth minimization of non-smooth functions. Math. Program. (A) 103(1), 127– 152 (2005)

41. Yu. Nesterov, Excessive gap technique in non-smooth convex minimizarion. SIAM J. Optim. 16 (1), 235–249 (2005)

42. Yu. Nesterov, Smoothing technique and its applications in semidefinite optimization. Math. Program. 110(2), 245–259 (2007)

43. Yu. Nesterov, Modified Gauss–Newton scheme with worst-case guarantees for its global performance. Optim. Methods Softw. 22(3), 469–483 (2007)

44. Yu. Nesterov, Rounding of convex sets and efficient gradient methods for linear programming problems. Optim. Methods Softw. 23(1), 109–128 (2008)

45. Yu. Nesterov, Accelerating the cubic regularization of Newton’s method on convex problems. Math. Program. 112(1), 159–181 (2008)

46. Yu. Nesterov, Unconstrained convex minimization in relative scale. Math. Oper. Res. 34(1), 180–193 (2009)

47. Yu. Nesterov, Barrier subgradient method. Math. Program. 127(1), 31–56 (2011)

48. Yu. Nesterov, How to make the gradients small. Optima 88, 10–11 (2012)

49. Yu. Nesterov, Towards non-symmetric conic optimization. Optim. Methods Softw. 27(4–5), 893–918 (2012)

50. Yu. Nesterov, Complexity bounds for primal-dual methods minimizing the model of objective function. Math. Program. (2017). https://doi.org/10.1007/s10107-017-1188-6

51. Yu. Nesterov, A. Nemirovskii, Interior-Point Polynomial Algorithms in Convex Programming (SIAM, Philadelphia, 1994)

52. Yu. Nesterov, B. Polyak, Cubic regularization of Newton’s method and its global performance. Math. Program. 108(1), 177–205 (2006)

53. J. Nocedal, S.J. Wright, Numerical Optimization (Springer, New York, 1999)

54. J. Ortega, W. Rheinboldt, Iterative Solution of Nonlinear Equations in Several Variables (Academic Press, New York, 1970)

55. B.T. Polyak, Introduction to Optimization (Optimization Software, Publications Division, New York, 1987)

56. B.T. Polyak, History of mathematical programming in the USSR: analyzing the phenomenon. Math. Program. 91(3), 401–416 (2002)

57. J. Renegar, A Mathematical View of Interior-Point Methods in Convex Optimization. MPS-SIAM Series on Optimization (SIAM, Philadelphia, 2001)

58. R.T. Rockafellar, Convex Analysis (Princeton University Press, Princeton, 1970)

59. C. Roos, T. Terlaky, J.-Ph. Vial, Theory and Algorithms for Linear Optimization: An Interior Point Approach (Wiley, Chichester, 1997)

60. M. Todd, Minimum-Volume Ellipsoids: Theory and Algorithms. MOS-SIAM Series on Optimization (SIAM, philadelphia, 2016)

61. M.J. Todd, E.A.Yildirim, On Khachiyan’s algorithm for the computation of minimum volume enclosing ellipsoids, Technical Report, TR 1435, School of Operations Research and Industrial Engineering, Cornell University, 2005

62. S.J. Wright, Primal-Dual Interior Point Methods (SIAM, Philadelphia, 1996)

63. Y. Ye, Interior Point Algorithms: Theory and Analysis (Wiley, Hoboken, 1997)

## Index

Analytic center, 377   
Antigradient, 20   
Approximate centering condition, 359, 379   
Approximate solution, 13   
Approximation, 18 first-order, 19 global upper, 41 linear, 19 local, 18 in - -norms, 417 quadratic, 22 second-order, 22   
Asphericity coefficient, 493   
Barrier analytic, 224 self-concordant, 369 universal, 391 volumetric, 225   
Black box concept, 9   
Center analytic, 377 of gravity, 220   
Central path, 368 auxiliary, 383 dual interpretation, 363 equation, 368   
Cholesky factorization, 327   
Class of problems, 8   
Complexity analytical, 9 arithmetical, 9

lower bounds, 12 upper bounds, 12 Computational effort, 9 Computational stability for entropy function, 445 Condition number, 77 of variable degree, 278 Cone normal, 177 positive semidefinite matrices, 395 second-order, 393 tangent, 178 Conjugate directions, 47 Constant step scheme minimax problem, 125 monotone, 98 smooth convex functions, 93 smooth strongly convex functions, 94 unconstrained, 92 Constrained minimization schemes, 132 Contraction mapping, 33 Convex combination, 141 differentiable function, 61 function, 140 set, 61 asphericity, 377, 492 Cubic power function, 274 Cutting plane scheme, 218

Dikin ellipsoid, 337   
Directional derivative, 158   
Discrete approximation of integral, 470   
Distance function, 111   
Domain of function, 140   
Dual multipliers, 183

Epigraph, 101, 142 constrained, 143 facet, 166   
Estimating sequences composite objective, 431 for conditional gradients with contraction, 476 for conditional gradients with composite objective, 471 definition, 83 second-order methods, 281   
Euclidean projection, 109 triangle inequality, 110   
Excessive gap condition, 448 updating rule, 450, 456   
Fast gradient method, 431 relative accuracy, 502, 503   
Feasibility problem, 214   
Function barrier, 56, 335 β-compatible with self-concordant barrier, 403 closed and convex, 143 conjugate, 349, 424 convex, 140 nonlinear transformation, 259 smooth approximation, 425 strictly positive, 561 with degree of homogeneity one, 173, 499 Fenchel dual, 164, 349, 424 for entropy, 438 gradient dominated, 255 growth measure, 199 logarithmically homogeneous, 392 objective, 4 smooth approximation, 429 positively homogeneous, 173 self-concordant, 330 star-convex, 252 strongly convex, 74 growth property, 105 lower complexity bounds, 212 uniformly convex, 274 growth condition, 277   
Functional constraints, 4   
General iterative scheme, 8   
Global optimality certificate, 52   
Gradient, 19, 271 mapping, 112 reduced, 112   
Hessian, 22, 272   
Hölder condition gradient, 469, 479 Hessian, 469   
Hyperplane separating, 160 supporting, 160   
Inequality Cauchy–Schwarz, 20, 66, 273, 437 Jensen, 141 von Neumann, 463   
Infinity norm, 146   
Informational set, 8   
Inner product, 4 standard, 328

Kelley’s method, 226   
Krylov subspace, 46

Lagrange dual problem, 51 function, 51 multipliers, 183   
Lagrangian, 51, 107 dual problem, 108 relaxation, 50   
Level set, 19, 101, 143, 243   
Levenberg–Marquardt regularization, 242   
Linear operator adjoint, 271, 306 dual non-degeneracy, 306 norm, 273, 426, 437, 439, 467, 501 positive semidefinite, 272 primal non-degeneracy, 306 of rank one, 273 self-adjoint, 272   
Linear optimization oracle composite form, 468   
Lipschitz condition function, 10


<!-- MinerU source pages 601-603 -->

gradient, 24, 66, 430 of smooth approximation, 425, 429, 448 Hessian, 243, 268, 273, 328, 329, 364 cubic power function, 277 high-order derivative, 278 Jacobian, 308 Local decrease of Gauss–Newton model, 310 Localization set, 200 Local norm, 541 dual, 344 primal, 337 Logarithmic barrier for ellipsoid, 332 for level set of self-concordant function, 335 for ray, 331, 370 for second-order region, 370 standard, 392

Making decisions in uncertain environment, 555 Matrix positive definite, 21 positive semidefinite, 20 Maximal eigenvalue entropy smoothing, 465 of symmetric matrix, 466 Max-type function, 118 Measure of local optimality, 246 Method of analytic centers, 224 barrier functions, 57 centers of gravity, 220 conditional gradients with composite objective, 470 with contraction, 475 conjugate gradient, 46, 49 ellipsoids, 222 fast gradient, 88 Gauss–Newton modified, 309 standard, 306 gradient, 28, 80, 114 inscribed ellipsoids, 224 optimal, 14, 32, 88 path-following, 381 penalty functions, 55 primal-dual, 191, 479 quasi-Newton, 42 similar triangles, 431

trust regions, 242 composite form with contraction, 483 uniform grid, 10 variable metric, 42, 44 volumetric centers, 225 Minimax principle, 50 strategies for matrix games, 436 theorem, 156, 189 Minimax problem, 117 gradient method, 123 optimal method, 126 Minimum global, 5 local, 5 Minkowski function, 151 Mixed accuracy, 567 Model of convex function, 226 linear, 192 minimization problem, 7 barrier, 327, 378 functional, 10 objective function, 427

Newton’s method affine invariance. 329 cubic regularization, 247, 249, 299 accelerated, 284 backtracking strategy, 267 optimal conceptual version, 300 damped, 37,242,348, 353 intermediate, 353 standard, 36, 242, 328, 353 Newton system, 36 No-gap property, 193 Non-degenerate global minimum, 253 saddle point, 248 sum of squares, 256 Norm dual, 65, 273, 306, 492, 500, 513 Euclidean, 19 Frobenius, 395, 506 $\ell_{1}$ , 146 $\ell_{p},$ 146, 408, 461 $\ell_{p}.$ -matrix, 462 $\ell_{\infty}.$ , 10, 146 self-dual, 66 squared $\ell_{p}$ -matrix, 464

Optimality condition composite form, 176 constrained problem, 105 first-order, 20, 61 with equalities, 21 minimax problem, 118 nonsmooth convex problem, 167, 179 second-order, 22 Optimality measure first-order, 476 second-order, 484 Oracle first-order, 10 local black box, 9 resisting, 12, 13, 215 second-order, 10 zero-order, 10

Parameter of centering, 359, 379 self-concordant barrier, 369 smoothing, 429 uniform convexity, 274 Partial minimization of convex function, 187 Penalty function, 54 for set, 54 Performance on a problem, 7 on a problem class, 7 Piece-wise linear optimization, 443 Polar set, 390 Polynomial methods, 224 Portfolio management, 559 Positive orthant, 391 Problem adjoint form, 427 of approximation in - -norms, 417, 418 of composite optimization, 430 of conic unconstrained optimization, 491 constrained, 4 of continuous location, 439 feasible, 5 general, 4 of geometric optimization, 416 of integer optimization, 6 linearly constrained, 4 of linear optimization, 4, 391 nonsmooth, 4 NP-hard, 15 quadratically constrained quadratic, 4, 393 of quadratic optimization, 4 of semidefinite optimization, 396

of separable optimization, 415 smooth, 4 strictly feasible, 5 unconstrained, 4 unsolvable, 14 Production processes with full cycle, 559 Prox-function, 430, 447 definition, 429 entropy distance, 437 Euclidean distance, 436, 501

Quasi-Newton method Broyden–Fletcher–Goldfarb–Shanno, 45 Davidon–Fletcher–Powell, 45 rank-one correction, 45 for strictly positive functions, 564 rule1, 44

Rate of convergence, 31 gradient method, 35 linear, 40 Newton’s method, 39 quadratic, 40 sublinear, 39 Recession direction, 390 Region of quadratic convergence disance to optimum, 328 function value, 288 norm of the gradient, 288 Regularization technique, 292 Relative accuracy, 490, 568 for bilinear matrix games, 532 for fractional covering problem, 551 for linear optimization, 504 for maximal concurrent flow problem, 552 for maximizing positive concave function, 548 for minimax problems with nonnegative component, 553 for minimizing maximal absolute values, 527 for minimizing the spectral radius, 506, 535 for semidefinite relaxation of boolean quadratic problems, 554 for truss topology design, 509 Relaxation, 18 sequence, 18 Restarting strategy, 49

## Index

Rounding ellipsoids for centrally symmetric sets, 513 for general convex sets, 519 for sign-invariant sets, 523

Scalar product, 272 Frobenius, 461, 506 standard, 4, 328, 461 Self-concordant barrier for cone of positive semidefinite matrices, 397 definition, 369 for epigraph of entropy function, 408 for epigraph of p-norm, 408 for epigraph of self-concordant barrier, 372 for geometric mean, 412 for hypograph of exponent of self-concordant barrier, 413 for level set of self-concordant function, 372 logarithmically homogeneous, 392 for Lorentz cone, 393 for matrix epigraph of inverse matrix, 414 for power cone, 406 function barrier property, 335 definition, 330 local rate of convergence, 355 necessary and sufficient conditions, 342 non-degeneracy of Hessian, 338 standard, 330 Sequential quadratic optimization, 128 Sequential unconstrained minimization, 50 Set convex, 61 feasible, 4 basic, 4 sign-invariant, 523 Singular value minimal, 306 Slater condition, 5, 56, 182 linear equality constraints, 185

Solution approximate, 8, 69, 77, 195 global, 5 local, 5 Standard minimization problem, 367 simplex, 171 Stationary point, 21 Step-size strategy, 28 Armijo rule, 28 full relaxation, 28 Strong separation, 160 Structural constraints, 5 Subdifferential, 162 constrained, 162 Subgradient, 162 Subgradient method for finding Lagrange multipliers, 207 functional constraints, 205 for relative accuracy, 496 restarting strategy, 498 simple set, 202 Support function, 151 Supporting vector, 161

Theorem Euler, 173 on implicit self-concordant barrier, 374 John general convex sets, 522 for symmetric sets, 518 Karush–Kuhn–Tucker, 182 on recession direction, 348 von Neuman, 189 Third directional derivative, 329 Total variation of linear model, 476 Uniform dual non-degeneracy, 314 Unit ball, 146 Univariate convex function, 150, 153, 167, 345, 470, 571 Variational inequalities with linear operator, 440

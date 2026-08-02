---
title: "Chapter 3 \u2014 Nonsmooth Convex Optimization"
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 3
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 5865
source_line_end: 10223
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
  source_control_characters: 11
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 3 — Nonsmooth Convex Optimization

> [[../README|本书目录]] · [[02-chapter-2-smooth-convex-optimization|上一章]] · [[04-chapter-4-second-order-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 5865–10223。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.224) × 1；PDF-confirmed book-specific control-codepoint pattern × 7。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Chapter 3 Nonsmooth Convex Optimization

In this chapter, we consider the most general convex optimization problems, which are formed by non-differentiable convex functions. We start by studying the main properties of these functions and the definition of subgradients, which are the main directions used in the corresponding optimization schemes. We also prove the necessary facts from Convex Analysis, including different variants of Minimax Theorems. After that, we establish the lower complexity bounds and prove the convergence rate of the Subgradient Method for constrained and unconstrained optimization problems. This method appears to be optimal uniformly in the dimension of the space of variables. In the next section, we consider other optimization methods, which can work in spaces of moderate dimension (the Method of Centers of Gravity, the Ellipsoid Algorithm). The chapter concludes with a presentation of methods based on a complete piece-wise linear model of the objective function (Kelley’s method, the Level Method).

## 3.1 General Convex Functions

(Equivalent definitions; Closed functions; The discrete minimax theorem; Continuity of convex functions; Separation theorems; Subgradients; Computation rules; Optimality conditions; the Karush–Kuhn–Tucker Theorem; The exact penalty function; Minimax theorems; Basic elements of primal-dual methods.)

## 3.1.1 Motivation and Definitions

In this chapter, we consider methods for solving the most general convex minimization problem

$$
\operatorname{min}_{x \in Q} f_{0}(x),\tag{3.1.1}
$$

$$
{\mathrm{s.t.~}} f_{i}(x) \leq 0, i = 1 \ldots m,
$$

where $Q \subseteq \mathbb{R}^{n}$ is a closed convex set and $f_{i}(\cdot), i = 0 \dots m$ , are general convex functions. The term general means that these functions can be nondifferentiable. Clearly, such a problem is more difficult than a problem with differentiable components.

Note that nonsmooth minimization problems arise frequently in different applications. Quite often, some components of a model are composed of max-type functions:

$$
f(x) = \operatorname{max}_{1 \leq j \leq p} \f_{j}(x),
$$

where $f_{j}(\cdot)$ are convex and differentiable. In Sect. 2.3, we have seen that such a function can be minimized by methods based on Gradient Mapping. However, if the number of smooth components $p$ is very $big.$ , the computation of the Gradient Mapping becomes too expensive. Then, it is reasonable to treat this max-type function as a general convex function. Another source of nondifferentiable functions is the situation when some components of the problem (3.1.1) are given implicitly, as solutions of some auxiliary problems. Such functions are called the functions with implicit structure. Very often, these functions are nondifferentiable.

Let us start our considerations with the definition of a general convex function. In the sequel, the term “general” is often omitted.

Denote by

$$
\operatorname{dom} f = \{x \in \mathbb{R}^{n} : | \f(x) \ | < \infty\}
$$

the domain of function $f$ . We always assume that dom $f \neq \emptyset.$

Definition 3.1.1 A function $f(\cdot)$ is called convex if its domain is convex and for all x, $y \in$ dom $f$ and $\alpha \in[0, 1]$ the following inequality holds:

$$
f(\alpha x +(1 - \alpha) y) \leq \alpha f(x) +(1 - \alpha) f(y).\tag{3.1.2}
$$

If this inequality is strict, the function is called strictly convex. We call f concave if $- f$ is convex.

At this point, we are not yet ready to speak about any methods for solving problem (3.1.1). In Chap. 2, our optimization schemes were based on gradients of smooth functions. For nonsmooth functions, such objects do not exist and we have to find something to replace them. However, in order to do that, we should first study the properties of general convex functions and justify a possible definition of a computable generalized gradient. This route is quite long, but we have to follow it up to the end.

A straightforward consequence of Definition 3.1.1 is the following.

Lemma 3.1.1 (Jensen’s Inequality) For any $x_{1}, \ldots, x_{m} \in$ dom f and positive coefficients $\alpha_{1}, \ldots, \alpha_{m}$ such that

$$
\sum_{i = 1}^{m} \alpha_{i} = 1,\tag{3.1.3}
$$

we have

$$
f \left(\sum_{i = 1}^{m} \alpha_{i} x_{i} \right) \leq \sum_{i = 1}^{m} \alpha_{i} f(x_{i}).\tag{3.1.4}
$$

Proof Let us prove this statement by induction over m. Definition 3.1.1 justifies inequality (3.1.4) for $m = 2$ . Assume it is true for some $m \ge 2$ . For a set of $m + 1$ points we have

$$
\sum_{i = 1}^{m + 1} \alpha_{i} x_{i} = \alpha_{1} x_{1} +(1 - \alpha_{1}) \sum_{i = 1}^{m} \beta_{i} x_{i},
$$

where $\begin{array}{r}{\beta_{i} = \frac{\alpha_{i + 1}}{1 - \alpha_{1}}, i = 1, \ldots, m} \end{array}$ . Clearly,

$$
\sum_{i = 1}^{m} \beta_{i} = 1, \quad \beta_{i} > 0, i = 1 \ldots m.
$$

Therefore, using Definition 3.1.1 and our inductive assumption, we have

$$
f \left(\sum_{i = 1}^{m + 1} \alpha_{i} x_{i} \right) \ = \f \left(\alpha_{1} x_{1} +(1 - \alpha_{1}) \sum_{i = 1}^{m} \beta_{i} x_{i} \right)
$$

$$
\leq \alpha_{1} f(x_{1}) +(1 - \alpha_{1}) f \left(\sum_{i = 1}^{m} \beta_{i} x_{i} \right) \leq \sum_{i = 1}^{m + 1} \alpha_{i} f(x_{i}).
$$

A point $x = \sum_{i = 1}^{m} \alpha_{i} x_{i}$ with positive coefficients $\alpha_{i}$ satisfying the normalizing condition (3.1.3) is called a convex combination of points $\{x_{i}\}_{i = 1}^{m}$

Let us mention two important consequences of Jensen’s inequality.

Corollary 3.1.1 Let x be a convex combination of points $x_{1}, \ldots, x_{m}$ . Then

$$
f(x) \leq \operatorname{max}_{1 \leq i \leq m} f(x_{i}).
$$

Proof Indeed, by Jensen’s inequality and condition (3.1.3), we have

$$
f(x) = f \left(\sum_{i = 1}^{m} \alpha_{i} x_{i} \right) \ \leq \ \sum_{i = 1}^{m} \alpha_{i} f(x_{i}) \ \leq \ \operatorname{max}_{1 \leq i \leq m} f(x_{i}).
$$

Corollary 3.1.2 Let

$$
\varDelta = \mathrm{Conv} \left\{x_{1}, \dots, x_{m} \right\} \equiv \left\{x = \sum_{i = 1}^{m} \alpha_{i} x_{i} \mid \alpha_{i} \geq 0, \sum_{i = 1}^{m} \alpha_{i} = 1 \right\}.
$$

Then max $f(x) = \operatorname{max}_{1 \leq i \leq n} \f(x_{i})$ □ x Δ

There exist two other equivalent definitions of convex functions.

Theorem 3.1.1 A function f is convex if and only if for all $x, y \in$ dom f and $\beta \geq 0$ such that $y + \beta(y - x) \in$ dom f , we have

$$
f(y + \beta(y - x)) \geq f(y) + \beta(f(y) - f(x)).\tag{3.1.5}
$$

Proof Let f be convex. Define $\begin{array}{r}{\alpha = \frac{\beta}{1 + \beta}} \end{array}$ and $u = y + \beta(y - x)$ . Then

$$
\begin{array}{r}{y = \frac{1}{1 + \beta}(u + \beta x) \ = \(1 - \alpha) u + \alpha x.} \end{array}
$$

Therefore,

$$
\begin{array}{r}{f(y) \le(1 - \alpha) f(u) + \alpha f(x) = \frac{1}{1 + \beta} f(u) + \frac{\beta}{1 + \beta} f(x).} \end{array}
$$

Assume now that (3.1.5) holds. Let us fix $x, y \in$ dom f and $\alpha \in(0, 1]$ . Define $\begin{array}{r}{\beta = \frac{1 - \alpha}{\alpha}} \end{array}$ and $u = \alpha x +(1 - \alpha) y$ . Then

$$
\begin{array}{r}{x = \frac{1}{\alpha}(u -(1 - \alpha) y) \ = \u + \beta(u - y).} \end{array}
$$

Therefore, $\begin{array}{r}{f(x) \geq f(u) + \beta(f(u) - f(y)) = \frac{1}{\alpha} f(u) - \frac{1 - \alpha}{\alpha} f(y).\quad \boxed{m}} \end{array}$

Theorem 3.1.2 A function f is convex if and only if its epigraph

$$
\operatorname{epi} \left(f \right) = \{(x, t) \in \operatorname{dom} f \times \mathbb{R} \mid t \geq f(x)\}
$$

is a convex set.

Proof Indeed, if $(x_{1}, t_{1}) \in \mathrm{epi} \left(f \right)$ and $(x_{2}, t_{2}) \in \mathrm{epi} \left(f \right)$ , then for any $\alpha \in[0, 1]$ we have

$$
\alpha t_{1} +(1 - \alpha) t_{2} \geq \alpha f(x_{1}) +(1 - \alpha) f(x_{2}) \geq f(\alpha x_{1} +(1 - \alpha) x_{2}).
$$

Thus, $(\alpha x_{1} +(1 - \alpha) x_{2}, \alpha t_{1} +(1 - \alpha) t_{2}) \in \mathrm{epi} \left(f \right)$

Let epi $(f)$ be convex. Note that for x , x dom $f$ , the corresponding points of the graph of the function belong to the epigraph:

$$
(x_{1}, f(x_{1})) \in \mathrm{epi}(f), \quad(x_{1}, f(x_{2})) \in \mathrm{epi}(f).
$$

Therefore $(\alpha x_{1} +(1 - \alpha) x_{2}, \alpha f(x_{1}) +(1 - \alpha) f(x_{2})) \in \mathrm{epi} \left(f \right)$ . This means that

$$
f(\alpha x_{1} +(1 - \alpha) x_{2}) \leq \alpha f(x_{1}) +(1 - \alpha) f(x_{2}).\qquad \mathbb{O}
$$

We also need the following property of the level sets of convex functions.

Theorem 3.1.3 If a function f is convex, then all level sets

$$
{\mathcal{L}}_{f}(\beta) = \{x \in \operatorname{dom} f \mid f(x) \leq \beta\}, \quad \beta \in \mathbb{R},
$$

are either convex or empty.

Proof Indeed, if $x_{1} \in \mathcal{L}_{f}(\beta)$ and $x_{2} \in \mathcal{L}_{f}(\beta)$ , then for any $\alpha \in[0, 1]$ we have

$$
f(\alpha x_{1} +(1 - \alpha) x_{2}) \leq \alpha f(x_{1}) +(1 - \alpha) f(x_{2}) \leq \alpha \beta +(1 - \alpha) \beta = \beta.
$$

In Example 3.1.1(6) we will see that behavior of a general convex function on the boundary of its domain is sometimes out of any control. Therefore, we need to introduce one convenient notion, which will be very useful in our analysis.

Definition 3.1.2 A function f is called closed and convex on a convex set $Q \subseteq$ dom f if its constrained epigraph

$$
\operatorname{epi}_{Q}(f) = \{(x, t) \in Q \times \mathbb{R} : t \geq f(x)\}
$$

is a closed convex set. If $Q = \operatorname{dom} f$ , we call f a closed convex function.

Note that in this definition the set Q is not necessarily closed. Let us prove the following natural statement.

Lemma 3.1.2 Let a function f be closed and convex on Q. Then for any closed convex set $Q_{1} \subseteq Q$ , this function is closed and convex on $Q_{1}$

Proof Indeed, the set $\{(x, t) : \x \in Q_{1}\}$ is closed. Hence, the statement follows from Item 1 of Theorem 2.2.8.

Let us mention the most important topological properties of closed convex functions.

Theorem 3.1.4 Let a function f be closed and convex.

1. For any sequence $\{x_{k}\} \subset$ dom f convergent to a point $\bar{x} \in$ dom f we have

$$
\operatorname{lim}_{k \to \infty}{\mathrm{inf}} f(x_{k}) \geq f({\bar{x}}).\tag{3.1.6}
$$

(This means that f is lower semi-continuous.)

2. For any sequence $\{x_{k}\} \subset$ dom f convergent to some point x dom f we have

$$
\operatorname{lim}_{k \to \infty} f(x_{k}) = + \infty.\tag{3.1.7}
$$

3. All level sets of the function f are either empty or closed and convex.

4. Let f be closed and convex on a set Q and its constrained level sets be bounded. Then problem

$$
\operatorname{min}_{x \in Q} f(x)
$$

is solvable.

5. Let f be closed and convex on Q. If the optimal set $X^{*} = \operatorname{Argmin}_{x \in Q} f(x)$ is nonempty and bounded, then all level sets of the function f on $Q$ are either empty or bounded.

## Proof

1. Note that the sequence $\{(x_{k}, f(x_{k}))\}$ belongs to the closed set epi $(f)$ . If it has a subsequence convergent to $(\bar{x}, \bar{f}) \in \mathrm{epi} \left(f \right)$ , then ${\bar{x}} \in$ dom f and $\bar{f} \ge f(\bar{x})$ This is the inequality (3.1.6).

If there is no convergent subsequence in $\{f(x_{k})\}$ , we need to consider two cases. Assume that lim inf $f(x_{k}) ~ = ~ - \infty$ . Since $\bar{x} \in \mathsf{dom} f.$ , the sequence k→∞ $\{(x_{k}, f(\bar{x}) - 1)\}$ belongs to epi (f ) for k large enough, but it converges to the point $(\bar{x}, f(\bar{x}) - 1) \notin \mathrm{epi}(f)$ . This contradicts our assumption. Thus, the only possibility is lim $f(x_{k}) = + \infty$ . Hence, (3.1.6) is also satisfied.

2. Let $\bar{x} \notin$ dom f . If the sequence $\{f(x_{k})\}$ contains a bounded subsequence, then the corresponding points $(x_{k}, \tau)$ with τ big enough belong to the epigraph. However, their limit is not in this set. This contradiction proves (3.1.7).

3. By its definition, $(\mathcal{L}_{f}(\beta), \beta) = \mathrm{epi} \left(f \right) \bigcap \{(x, t) \mid t = \beta\}$ . Therefore, the level set ${\mathcal{L}}_{f}(\beta)$ is closed and convex as an intersection of two closed convex sets.

4. Consider a sequence $\{x_{k}\} \subset Q$ such that lim $f(x_{k}) = f_{*} \stackrel{\mathrm{def}}{=} \operatorname{inf}_{x \in Q} f(x)$ . Since k→∞ the level sets of the function f on Q are bounded, we can assume that it is a convergent sequence: $\operatorname{lim}_{k \to \infty} x_{k} = x^{*}$ . Assume that $f_{*} = - \infty$ . Consider the points $y_{k} =(1 - \alpha_{k}) x_{0} + \alpha_{k} x_{k} \in Q, k \geq 0$ , with slowly decreasing coefficients $\alpha_{k} \downarrow 0$ Note that we can always ensure

$$
f(y_{k}) \stackrel{(3.1.2)}{\leq} f(x_{0}) + \alpha_{k}(f(x_{k}) - f(x_{0})) - \infty,
$$

and this contradicts the closedness of the set epi $\varrho(f)$

Thus, $f_{*} > - \infty$ , and we can assume that the whole sequence $\{(x_{k}, f(x_{k}))\}$ converges to a certain point $(x^{*}, f_{*})$ from epi $\varrho(f)$ . However, by definition of this set, $x^{*} \in Q$ and $f(x^{*}) \leq f_{*}$

5. Assume that some set ${\mathcal{L}}_{f}(\beta)$ with $\beta \ > \f^{*} \ = \ \operatorname{min}_{x \in{\mathcal Q}} f(x)$ is unbounded. Let us fix a point $x^{*} \in X^{*}$ and choose $R \ > \ \operatorname{max}_{y \in X^{*}} \| y \ - x^{*} \|$ . Consider a sequence $\{x_{k}\} \subset \mathcal{L}_{f}(\beta)$ with $\rho_{k} \{\stackrel{\mathrm{def}}{=}} \ \| x_{k} - x^{*} \| \to \infty$ . Without loss of generality, we can assume that all $\rho_{k} \ge R$ . Define $\begin{array}{r}{y_{k} = x^{*} + \frac{1}{\rho_{k}} R(x_{k} - x^{*})} \end{array}$ . Clearly, $y_{k} \in{\mathfrak{Q}}$ and $\| y_{k} - x^{*} \| = R$ . However,

$$
\begin{array}{r}{f(y_{k}) \overset{(3.1.2)}{\leq} f^{*} + \frac{1}{\rho_{k}} R(f(x_{k}) - f^{*}) \to f^{*}, \quad k \to \infty.} \end{array}
$$

Since the sequence $\{y_{k}\}_{k \ge 0}$ is compact and the level set ${\mathcal{L}}_{f}(\beta)$ is closed (see Item 3), we can assume that the limit $\operatorname{lim}_{k \to \infty} y_{k} \{\stackrel{\mathrm{def}}{=}} \{\bar{y}} \in{\mathcal{L}}_{f}(\beta)$ exists. However, by (3.1.6) we have $f(\bar{y}) = f^{*}$ , and this contradicts the choice of R.

Note that, if f is convex and continuous and its domain dom f is closed, then f is a closed function. However, in general, a closed convex function is not necessarily continuous.

Let us look at some examples of closed convex functions.

## Example 3.1.1

1. A linear function is closed and convex.

2. $f(x) = \mid x \mid, x \in \mathbb{R}$ , is closed and convex since its epigraph is

$$
\{(x, t) \mid t \geq x, t \geq - x\},
$$

which is the intersection of two closed convex sets (see Theorem 3.1.2).

3. All continuous and convex functions on $\mathbb{R}^{n}$ belong to the class of general closed convex functions.

4. The function $\textstyle f(x) ={\frac{1}{x}}, x \ > \0$ , is convex and closed. However, its domain dom $f = \operatorname{int} \mathbb{R}_{+}$ is open.

5. The function $f(x) = \parallel x \parallel$ , where $\| \cdot \|$ is any norm, is closed and convex:

$$
f(\alpha x_{1} +(1 - \alpha) x_{2}) = \parallel \alpha x_{1} +(1 - \alpha) x_{2} \parallel \leq \parallel \alpha x_{1} \parallel + \parallel(1 - \alpha) x_{2} \parallel
$$

$$
= \alpha \parallel x_{1} \parallel +(1 - \alpha) \parallel x_{2} \parallel
$$

for any $x_{1}, x_{2} \ \in \ \mathbb{R}^{n}$ and $\alpha ~ \in ~[0, 1]$ . The most popular norms in Numerical Analysis are so-called $\ell_{p}{-} norms !$

$$
\parallel x \parallel_{(p)} = \left[\sum_{i = 1}^{n} \mid x^{(i)} \mid^{p} \right]^{1 / p}, \quad p \geq 1.
$$

Among them, there are three norms, which are commonly used:

- Euclidean norm $\parallel x \parallel_{(2)} =[\sum_{i = 1}^{n}(x^{(i)})^{2}]^{1 / 2}, p = 2.$ . Since it is used very often, usually we drop the subscript if no ambiguity arises.

n • -<sub>1</sub>-norm  x <sub>(1)</sub> <sup>$\sum$</sup> x<sup>(i)</sup> , p  1. i 1

$\ell_{\infty}{-} norm$ (Chebyshev norm, uniform norm, infinity norm)

$$
\parallel x \parallel_{(\infty)} = \underset{1 \leq i \leq n}{\operatorname{max}} \mid x^{(i)} \mid.
$$

Any norm defines a system of balls,

$$
B_{\parallel \cdot \parallel}(x_{0}, r) = \{x \in \mathbb{R}^{n} \mid \parallel x - x_{0} \parallel \leq r\}, \quad r \geq 0,
$$

where $r$ is the radius of the ball and $x_{0} ~ \in ~ \mathbb{R}^{n}$ is its center. We call the ball $B_{\parallel \cdot \parallel}(0, 1)$ the unit ball of the norm $\| \cdot \|$ . Clearly, these balls are convex sets (see Theorem 3.1.3). For $\ell_{p}{\mathrm{-}} \mathrm{balls}$ of radius r we also use the notation

$$
B_{p}(x_{0}, r) = \{x \in \mathbb{R}^{n} \mid \| x - x_{0} \|_{(p)} \leq r\}.
$$

For $\ell_{1}{\mathrm{- balls}}.$ , we often use the following representation:

$$
B_{1}(x_{0}, r) = \{x \in \mathbb{R}^{n} : \| x - x_{0} \|_{(1)} \leq r\} \ = \ \mathrm{Conv} \{x_{0} \pm re_{i}, \i = 1, \ldots, n\},\tag{3.1.8}
$$

where $e_{i}$ are coordinate vectors in $\mathbb{R}^{n}$

6. Up to now, none of our examples have demonstrated any pathological behavior. However, let us look at the following function of two variables:

$$
\begin{array}{r}{f(x, y) = \left\{\begin{array}{ll}{\0, \quad \mathrm{~ if ~} x^{2} + y^{2} < 1,} \\{\} \\{\phi(x, y), \mathrm{~ if ~} x^{2} + y^{2} = 1,} \end{array} \right.} \end{array}
$$

where $\phi(x, y)$ is an arbitrary nonnegative function defined on the boundary of a unit circle. The domain of this function is the unit Euclidean disk, which is closed and convex. Moreover, it is easy to see that $f$ is convex. However, it has no reasonable properties at the boundary of its domain. Definitely, we want to exclude such functions from our considerations. This was the main reason for introducing the notion of the closed function. It is clear that $f(\cdot, \cdot)$ is not closed unless $\phi(x, y) \equiv 0$

Another possibility would be to consider a smaller class of continuous convex functions. However, we will see that for closedness of a convex function there exist very natural sufficient conditions, and this is not the case for continuity.

## 3.1.2 Operations with Convex Functions

In the previous section, we have seen several examples of convex functions. Let us describe a set of invariant operations which allow us to create more complicated objects.

Theorem 3.1.5 Let functions f and $f_{2}$ be closed and convex on convex sets $Q_{1}$ and $Q_{2}$ , and $\beta \ \geq \0.$ . Then all functions below are closed and convex on the corresponding sets Q:

1. $f(x) = \beta f_{1}(x), Q = Q_{1}$

$$
f(x) = f_{1}(x) + f_{2}(x), Q = Q_{1} \bigcap Q_{2}.^{1}
$$

3. $f(x) = \mathrm{max} \{f_{1}(x), f_{2}(x)\}, Q = Q_{1} \bigcap Q_{2}.$

Proof

1. The first item is evident:

$$
f(\alpha x_{1} +(1 - \alpha) x_{2}) \leq \beta(\alpha f_{1}(x_{1}) +(1 - \alpha) f_{1}(x_{2})), \quad x_{1}, x_{2} \in Q_{1}.
$$

2. For all $x_{1}, x_{2} \in Q = Q_{1} \bigcap Q_{2}$ and $\alpha \in[0, 1]$ we have

$$
\begin{array}{rl} &{f_{1}(\alpha x_{1} +(1 - \alpha) x_{2}) + f_{2}(\alpha x_{1} +(1 - \alpha) x_{2})} \\ &{} \\ &{\leq \alpha f_{1}(x_{1}) +(1 - \alpha) f_{1}(x_{2}) + \alpha f_{2}(x_{1}) +(1 - \alpha) f_{2}(x_{2})} \\ &{} \\ &{= \alpha(f_{1}(x_{1}) + f_{2}(x_{1})) +(1 - \alpha)(f_{1}(x_{2}) + f_{2}(x_{2})).} \end{array}
$$

Thus, $f$ is convex on the set Q. Let us prove that it is also closed on $Q.$ . Consider a convergent sequence $\{(x_{k}, t_{k})\} \subset \mathrm{epi}_{Q}(f)$ :

$$
t_{k} \geq f_{1}(x_{k}) + f_{2}(x_{k}), \quad x_{k} \in Q, \quad \operatorname{lim}_{k \to \infty} x_{k} = \bar{x}, \quad \operatorname{lim}_{k \to \infty} t_{k} = \bar{t}.
$$

Since the functions $f_{1}$ and $f_{2}$ are closed on $Q_{1}$ and $Q_{2}$ respectively, we have

$$
\operatorname{liminf}_{k \to \infty} f_{1}(x_{k}) \stackrel{(3.1.6)}{\geq} f_{1}(\bar{x}), \quad \bar{x} \in \mathcal{Q}_{1}, \quad \operatorname{liminf}_{k \to \infty} f_{2}(x_{k}) \stackrel{(3.1.6)}{\geq} f_{2}(\bar{x}), \quad \bar{x} \in \mathcal{Q}_{2}.
$$

Therefore, $\bar{x} \in Q_{1} \bigcap Q_{2}$ , and

$$
\bar{t} = \operatorname{lim}_{k \to \infty} t_{k} \ \ge \ \operatorname{lim}_{k \to \infty} \operatorname{inf}_{} f_{1}(x_{k}) + \operatorname{lim}_{k \to \infty} \operatorname{inf}_{} f_{2}(x_{k}) \ \ge \f(\bar{x}).
$$

Thus, $(\bar{x}, \bar{t}) \in \mathrm{epi}_{Q}(f)$

3. The constrained epigraph of the function f can be represented as follows:

$$
\begin{array}{rl} &{\mathsf{epi}_{\mathscr{Q}}(f) = \{(x, t) \mid t \geq f_{1}(x), t \geq f_{2}(x), x \in Q_{1} \bigcap \mathscr{Q}_{2}\}} \\ &{} \\ &{\qquad \equiv \mathsf{epi}_{\mathscr{Q}_{1}}(f_{1}) \bigcap \mathsf{epi}_{\mathscr{Q}_{2}}(f_{2}).} \end{array}
$$

Thus, epi $\varrho(f)$ is closed and convex as an intersection of two closed convex sets. □

Let us prove that convexity is an affine-invariant property.

Theorem 3.1.6 Let a function φ be closed and convex on a bounded set $S \subseteq \mathbb{R}^{m}$ Consider a linear operator

$$
\mathcal{A}(x) = Ax + b : \quad \mathbb{R}^{n} \to \mathbb{R}^{m}.
$$

Then the function $f(x) = \phi({\mathcal{A}}(x))$ is closed and convex on the inverse image of the set S defined as follows:

$$
Q = \{x \in \mathbb{R}^{n} \mid{\mathcal{A}}(x) \in S\}.
$$

Proof For $x_{1}$ and $x_{2}$ in $Q,$ , define $y_{1} = \mathcal{A}(x_{1}), y_{2} = \mathcal{A}(x_{2})$ . Then for $\alpha \in[0, 1]$ we have

$$
\begin{array}{rl} &{f(\alpha x_{1} +(1 - \alpha) x_{2}) = \phi(\mathcal{A}(\alpha x_{1} +(1 - \alpha) x_{2})) \ = \ \phi(\alpha y_{1} +(1 - \alpha) y_{2})} \\ &{} \\ &{\qquad \leq \alpha \phi(y_{1}) +(1 - \alpha) \phi(y_{2}) \ = \ \alpha f(x_{1}) +(1 - \alpha) f(x_{2}).} \end{array}
$$

Thus, the function $f$ is convex. The closedness of its constrained epigraph follows from the continuity of the linear operator $\mathcal{A}(\cdot)$ □

The next two theorems are the main providers of closed convex functions with implicit structure.

Theorem 3.1.7 Let $Q$ be a convex set, and let the function φ be convex with dom $\phi \supseteq Q$ . Then the function

$$
f(x) = \operatorname{inf}_{y} \{\phi(x, y) : \(x, y) \in Q\}\tag{3.1.9}
$$

is convex on ${\hat{Q}} = \{x :$ ysuch that $(x, y) \in Q\}$

Proof Let us take arbitrary points $x_{1}, x_{2} \in{\hat{Q}}$ . Consider two sequences $\{y_{1, k}\}$ and $\{y_{2, k}\}$ such that $\{(x_{1}, y_{1, k})\} \subset Q, \{(x_{2}, y_{2, k})\} \subset Q$ , and

$$
\operatorname{lim}_{k \to \infty} \phi(x_{1}, y_{1, k}) = f(x_{1}), \quad \operatorname{lim}_{k \to \infty} \phi(x_{2}, y_{2, k}) = f(x_{2}).
$$

Since $\phi$ is jointly convex in $(x, y)$ , for any $\alpha \in[0, 1]$ we have

$$
\begin{array}{rl}{f(\alpha x_{1} +(1 - \alpha) x_{2}) \stackrel{(3.1.9)}{\leq} \phi(\alpha x_{1} +(1 - \alpha) x_{2}, \alpha y_{1, k} +(1 - \alpha) y_{2, k})} &{} \\ &{} \\{\leq} &{\alpha \phi(x_{1}, y_{1, k}) +(1 - \alpha) \phi(x_{2}, y_{2, k}).} \end{array}
$$

Taking the limit of the right-hand side of this inequality, we get the convexity condition (3.1.2) for the function $f$ .

Conditions for closedness of the function (3.1.9) will be presented later in Theorem 3.1.25 and Theorem 3.1.28.

Theorem 3.1.8 Let $\varDelta$ be an arbitrary set and

$$
f(x) = \operatorname{sup}_{y} \{\phi(x, y) \mid y \in \varDelta\}.
$$

Suppose that for any $y \in \varDelta$ functions $\phi(\cdot, y)$ are closed and convex on some set $Q.$ Then $f(\cdot)$ is a closed convex function on the set

$$
\hat{Q} = \left\{x \in Q \mid \operatorname{sup}_{y \in \Delta} \phi(x, y) < + \infty \right\}.\tag{3.1.10}
$$

Proof Indeed, if $x \in{\hat{Q}}$ , then $f(x) \ < \ + \infty$ and we conclude that $Q \subseteq \operatorname{dom} f.$ Further, it is clear that $(x, t) \in \mathrm{epi}_{Q}(f)$ if and only if for all $y \in \varDelta$ we have

$$
x \in Q, \quad t \geq \phi(x, y).
$$

This means that

$$
\operatorname{epi}_{Q}(f) = \bigcap_{y \in \varDelta} \operatorname{epi}_{Q}(\phi(\cdot, y)).
$$

Thus, epi $\varrho(f)$ is closed and convex since each set epi $\boldsymbol{\mathbf{\ell}}_{Q}(\phi(\cdot, y))$ is closed and convex.

Theorem 3.1.9 Let a function $\psi(\cdot)$ be convex and ϕ be a univariate convex function which is non-decreasing on the set

$$
\operatorname{Im} \psi = \{\tau = \psi(x), \x \in \operatorname{dom} \psi\}.
$$

Then the function $f(x) = \varphi(\psi(x)), x \in \mathrm{dom} \psi$ , is convex.

Proof Indeed, for any points x and y from dom $f,$ , and $\alpha \in[0, 1]$ , we have

$$
\begin{array}{rl}{f(\alpha x +(1 - \alpha y)) = \varphi(\psi(\alpha x +(1 - \alpha) y))} &{} \\ &{} \\ &{\qquad \leq \varphi(\alpha \psi(x) +(1 - \alpha) \psi(y))} \\ &{} \\ &{\qquad \leq \alpha \varphi(\psi(x)) +(1 - \alpha) \varphi(\psi(y))} \\ &{} \\ &{\qquad = \alpha f(x) +(1 - \alpha) f(y).\qquad \sqcap} \end{array}
$$

Now we are ready to look at more sophisticated examples of convex functions.

Example 3.1.2

1. The function $f(x) = \operatorname{max}_{1 \leq i \leq n} \{x^{(i)}\}$ is closed and convex. Another example of a closed convex function is

$$
\phi_{*}(s) = \operatorname{sup}_{x \in \mathrm{dom} \phi}[\langle s, x \rangle - \phi(x)],
$$

where $\phi$ is an arbitrary function on $\mathbb{R}^{n}$ . The function $\phi_{*}$ is called the Fenchel dual of φ.

2. Let $\lambda =(\lambda^{(1)}, \dots, \lambda^{(m)})$ , and let $\varDelta$ be a set in $\mathbb{R}_{+}^{m}$ . Consider the function

$$
f(x) = \operatorname{sup}_{\lambda \in \varDelta} \left\{\sum_{i = 1}^{m} \lambda^{(i)} f_{i}(x) \right\},
$$

where all $f_{i}$ are closed and convex. In view of Theorem 3.1.5, the epigraphs of the functions

$$
\phi_{\lambda}(x) = \sum_{i = 1}^{m} \lambda^{(i)} f_{i}(x)
$$

are convex and closed. Thus, $f(\cdot)$ is closed and convex in view of Theorem 3.1.8. Note that we have not assumed anything about the structure of the set $\varDelta.$

3. Let $Q$ be an arbitrary set. Consider the function

$$
\xi_{Q}(x) = \operatorname{sup} \{\langle g, x \rangle \mid g \in Q\}.
$$

The function $\xi_{Q}(\cdot)$ is called the support function of the set $Q.$ . Note that $\xi_{Q}(\cdot)$ is closed and convex in view of Theorem 3.1.8. This function is positively homogeneous of degree one:

$$
\xi_{Q}(\tau x) = \tau \xi_{Q}(x), ~ x \in \mathrm{dom} \Q, \ \tau \geq 0.
$$

If the set $Q$ is bounded then dom $\xi_{Q} = \mathbb{R}^{n}$

The support function is a very useful tool in Convex Analysis with many interesting properties. We will present them later in the appropriate places. Here we mention only one of them.

Lemma 3.1.3 For two sets $Q_{1}$ and $Q_{2}$ define $Q ={\mathrm{Conv}} \left\{Q_{1}, Q_{2} \right\}$ . Then

$$
\begin{array}{r}{\xi_{Q}(x) = \operatorname{max} \{\xi_{Q_{1}}(x), \xi_{Q_{2}}(x)\}, \quad x \in \mathbb{R}^{n}.} \end{array}
$$

Proof Indeed, since the sets $Q_{1}$ and $Q_{2}$ are subsets of $Q,$ for any $x \in \mathbb{R}^{n}$ we have

$$
\xi_{Q}(x) \geq \operatorname{max} \{\xi_{Q_{1}}(x), \xi_{Q_{2}}(x)\}.
$$

On the other hand,

$$
\begin{array}{rl} &{\xi_{Q}(x) = \underset{\alpha, g_{1}, g_{2}}{\operatorname{sup}} \{\langle \alpha g_{1} +(1 - \alpha) g_{2}, x \rangle : \g_{1} \in Q_{1}, \g_{2} \in Q_{2}, \ \alpha \in[0, 1]\}} \\ &{} \\ &{\qquad \leq \underset{\alpha \in[0, 1]}{\operatorname{sup}} \{\alpha \xi_{Q_{1}}(x) +(1 - \alpha) \xi_{Q_{2}}(x)\} = \operatorname{max} \{\xi_{Q_{1}}(x), \xi_{Q_{2}}(x)\}.} \end{array}
$$

4. Another important example of a convex homogeneous function related to a convex set is the Minkowski function. Let $Q$ be a bounded closed convex set, and $0 \in \operatorname{int} Q$ . Then we can define

$$
\psi_{Q}(x) = \operatorname{min}_{\tau \geq 0} \{\tau : \x \in \tau Q\}.
$$

Denote the unique solution of this problem by $\tau(x)$ . Then ${\frac{x}{\tau(x)}} \in \partial Q$ . It is easy to see that $\psi_{Q}$ is a positively homogeneous convex function with dom $\psi_{Q} = \mathbb{R}^{n}$ Indeed, for arbitrary $x_{1}, x_{2} \in \mathbb{R}^{n} \setminus \{0\}$ and $\alpha \in[0, 1]$ , we have

$$
\begin{array}{r}{\frac{\alpha x_{1} +(1 - \alpha) x_{2}}{\alpha \tau(x_{1}) +(1 - \alpha) \tau(x_{2})} = \frac{\alpha \tau(x_{1}) \frac{x_{1}}{\tau(x_{1})} +(1 - \alpha) \tau(x_{2}) \frac{x_{2}}{\tau(x_{2})}}{\alpha \tau(x_{1}) +(1 - \alpha) \tau(x_{2})} \ \in \ \mathrm{~ \mathbb{Q}}.} \end{array}
$$

Therefore, $\psi_{Q}(\alpha x_{1} +(1 - \alpha) x_{2}) \leq \alpha \tau(x_{1}) +(1 - \alpha) \tau(x_{2}).$

5. Let Q be a set in $\mathbb{R}^{n}$ . Consider the function $\psi(g, \gamma) = \operatorname{sup}_{y \in Q} \phi(y, g, \gamma)$ , where

$$
\begin{array}{r}{\phi(y, g, \gamma) = \langle g, y \rangle - \frac{\gamma}{2} \parallel y \parallel^{2}.} \end{array}
$$

The function $\psi(g, \gamma)$ is closed and convex in $(g, \gamma)$ in view of Theorem 3.1.8.   
Let us look at its properties.

If Q is bounded, then dom $\psi = \mathbb{R}^{n + 1}$ . Let us describe the domain of $\psi$ for the case $Q = \mathbb{R}^{n}.\mathrm{~ If ~} \gamma < 0 \mathrm{~}$ , then for any $g \neq 0$ we can set $y_{\alpha} = \alpha g$ . Clearly, along this line, $\phi ( y _ { \alpha } , g , \gamma ) $ as $\alpha \to \infty$ . Thus, dom ψ contains only points with $\gamma \geq 0$

If $\gamma = 0$ , the only possible value for g is zero since otherwise the function $\phi(y, g, 0)$ is unbounded. Finally, $\mathrm{if} \gamma > 0$ , then the point maximizing $\phi(y, g, \gamma)$ with respect to y is $\begin{array}{r}{y^{*}(g, \gamma) = \frac{1}{\gamma} g} \end{array}$ , and we get the following expression for $\psi :$

$$
\begin{array}{r}{\psi(g, \gamma) = \frac{\| g \|^{2}}{2 \gamma}.} \end{array}
$$

Thus,

$$
\psi(g, \gamma) = \left\{{\begin{array}{l}{{0, \quad \mathrm{if} \g = 0, \gamma = 0,}} \\{{}} \\{{{\frac{\| g \|^{2}}{2 \gamma}}, \ \mathrm{if} \ \gamma > 0,}} \end{array}} \right.
$$

with domain dom $\psi =(\mathbb{R}^{n} \times \{\gamma > 0\}) \bigcup(0, 0)$ . This is a convex set which is neither closed nor open. Nevertheless, ψ is a closed convex function. At the same time, this function is discontinuous at the origin:

$$
\begin{array}{r}{\psi(\sqrt{\gamma} g, \gamma) \equiv \frac{1}{2} \parallel g \parallel^{2}, \quad \gamma \neq 0.} \end{array}
$$

Considering the closed convex set $Q = \{(g, \gamma) : \ \gamma \geq \| g \|^{2}\}$ , we can see that $\psi$ is a closed convex function on Q (see Lemma 3.1.2), with bounded values. However, it is still discontinuous at the origin.

6. Similar constructions can be obtained by homogenization. Let $f$ be convex on $\mathbb{R}^{n}$ . Consider the function

$$
\begin{array}{r}{\hat{f}(\tau, x) = \tau f \left(\frac{x}{\tau} \right).} \end{array}
$$

This function is well defined for all $x \in \mathbb{R}^{n}$ and $\tau > 0$ . Note that $\hat{f}$ is a positively homogeneous function. Therefore, it is natural to define its value at the origin as follows:

$$
{\hat{f}}(0, 0) = 0.
$$

Let us prove that this function is convex. Consider $z_{1} ~ = ~(\tau_{1}, x_{1})$ and $z_{2} =$ $(\tau_{2}, x_{2})$ with $\tau_{1}, \tau_{2} > 0$ . Then, for any $\alpha \in[0, 1]$ we have:

$$
\begin{array}{rl} &{\hat{f}(\alpha z_{1} +(1 - \alpha) z_{2}) =(\alpha \tau_{1} +(1 - \alpha) \tau_{2}) f \left(\frac{\alpha x_{1} +(1 - \alpha) x_{2}}{\alpha \tau_{1} +(1 - \alpha) \tau_{2}} \right)} \\ &{\qquad =(\alpha \tau_{1} +(1 - \alpha) \tau_{2}) f \left(\frac{\alpha \tau_{1} \frac{x_{1}}{\tau_{1}} +(1 - \alpha) \tau_{2} \frac{x_{2}}{\tau_{2}}}{\alpha \tau_{1} +(1 - \alpha) \tau_{2}} \right)} \\ &{\qquad \leq \alpha \tau_{1} f \left(\frac{x_{1}}{\tau_{1}} \right) +(1 - \alpha) \tau_{2} f \left(\frac{x_{2}}{\tau_{2}} \right)} \\ &{\qquad = \alpha \hat{f}(z_{1}) +(1 - \alpha) \hat{f}(z_{2}).} \end{array}
$$

However, in general, ${\hat{f}}(\cdot)$ is not closed. In order to ensure closedness, it is enough to assume that

$$
\operatorname{lim}_{\tau \to \infty} \frac{1}{\tau} f(\tau x) = + \infty \quad \forall x \in \mathbb{R}^{n}.\tag{3.1.11}
$$

Note that the function ψ in Item 5 can be obtained from $\begin{array}{r}{f(x) = \frac{1}{2} \| x \|^{2}} \end{array}$ , which satisfies condition (3.1.11).

As we have seen in Example 3.1.2(5), a closed convex function can be discontinuous at some points of its domain. However, there exists one very exceptional case when this cannot happen.

## Lemma 3.1.4 Any univariate closed convex function is continuous on its domain.

Proof Let f be closed and convex and $\bar{x} \in$ dom $f \subseteq \mathbb{R}$ . We have proved in Item 1 of Theorem 3.1.4 that $f$ is lower-semicontinuous at x. On the other hand, if $x_{k} =$ $(1 - \alpha_{k}) \bar{x} + \alpha_{k} \bar{y}$ , for certain $\bar{y} \in$ dom f and $\alpha_{k} \in[0$ , 1 , then

$$
f(x_{k}) \overset{(3.1.2)}{\leq}(1 - \alpha_{k}) f(\bar{x}) + \alpha_{k} f(\bar{y}).
$$

Thus, if $x_{k} \to \bar{x}$ , then $\alpha_{k} 0$ and lim sup $f(x_{k}) \leq f({\bar{x}})$ . Hence, f is also upper-$k \to \infty$   
semicontinuous at x. Consequently, it is continuous at x.

Thus, it is not surprising that a restriction of the discontinuous function $\psi$ in Item 5 of Example 3.1.2 onto the ray $\{(\gamma g, \gamma), \gamma \ \geq \0\}$ is a continuous convex function.

As for any other exception, the statement of Lemma 3.1.4 is sometimes very useful.

Theorem 3.1.10 Let functions $f_{1}$ and $f_{2}$ be closed and convex on Q and their constrained level sets be bounded. Then there exists some $\lambda^{*} \in[0, 1]$ such that

$$
\operatorname{min}_{x \in Q} \Big(f(x) \ \stackrel{\mathrm{def}}{=} \ \operatorname{max} \{f_{1}(x), f_{2}(x)\} \Big) = \operatorname{min}_{x \in Q} \{\lambda^{*} f_{1}(x) +(1 - \lambda^{*}) f_{2}(x)\}.\tag{3.1.12}
$$

Proof Define $\phi(\lambda) = \operatorname{min}_{x \in O} \{\lambda f_{1}(x) +(1 - \lambda) f_{2}(x)\}$ . In view of Theorem 3.1.8, this function is closed and convex, and by Lemma 3.1.4 it is continuous for $\lambda \in[0, 1]$ Thus, its maximal value $\phi^{*}$ is well defined and

$$
\phi^{*} = \phi(\lambda^{*}) = \operatorname{max}_{\lambda \in[0, 1]} \phi(\lambda) \leq f^{*} = \operatorname{min}_{x \in Q} f(x).
$$

Our goal is to show that $\phi^{*} = f^{*}$

For each $\lambda \in[0, 1]$ , we fix an arbitrary point

$$
x(\lambda) \in \operatorname{Argmin}_{x \in Q} \{\lambda f_{1}(x) +(1 - \lambda) f_{2}(x)\}.
$$

Define $g(\lambda) = f_{1}(x(\lambda)) - f_{2}(x(\lambda))$ . Note that for arbitrary $\lambda_{1}, \lambda_{2} \in[0, 1]$ we have

$$
\phi(\lambda_{1}) \leq \lambda_{1} f_{1}(x(\lambda_{2})) +(1 - \lambda_{1}) f_{2}(x(\lambda_{2})) \ = \ \phi(\lambda_{2}) + g(\lambda_{2})(\lambda_{1} - \lambda_{2}).\tag{3.1.13}
$$

Adding two variants of this inequality with $\lambda_{1}$ and $\lambda_{2}$ interchanged, we get

$$
(g(\lambda_{2}) - g(\lambda_{1}))(\lambda_{1} - \lambda_{2}) \geq 0, \quad \lambda_{1}, \lambda_{2} \in[0, 1].
$$

Thus, $g(\cdot)$ is a non-increasing function on 0, 1 .

Define $f_{i}^{*} = \operatorname{min}_{x \in \mathcal{O}} f_{i}(x), i = 1, 2.\operatorname{If} \lambda^{*} = 1$ , then taking in $(3.1.13) \lambda_{1} = 1$ and $\lambda_{2} = \lambda \in(1, 0]$ , we get $g(\lambda) \geq 0$ . Therefore, in view of Lemma 3.1.4 we have

$$
\begin{array}{l}{\phi^{*} = \underset{\lambda 1}{\operatorname{lim}} \{\lambda f_{1}(x(\lambda)) +(1 - \lambda) f_{2}(x(\lambda))\}} \\{\displaystyle} \\{\geq \underset{\lambda 1}{\operatorname{lim}} \{\lambda f(x(\lambda)) +(1 - \lambda) f_{2}^{*}\} \geq \f^{*}.} \end{array}
$$

Thus, $\phi^{*} ~ = ~ f^{*}$ and in this case equality (3.1.12) is proved. By a symmetric reasoning, we can justify this equality for $\lambda^{*} = 0$

Consider now the case ${{\lambda}^{*}} \in \left(0, 1 \right)$ . Assume first that there exists a sequence $\{\lambda_{k}\}_{k \ge 0} \subset[0, 1]$ such that

$$
\lambda_{k} \to \lambda^{*}, \quad g(\lambda_{k}) \to 0,\tag{3.1.14}
$$

as $k \to \infty$ . Then, in view of Lemma 3.1.4,

$$
\begin{array}{l}{{\phi^{*} = \displaystyle \operatorname{lim}_{k \to \infty} \{\lambda_{k} f_{1}(x(\lambda_{k})) +(1 - \lambda_{k}) f_{2}(x(\lambda_{k}))\} = \operatorname{lim}_{k \to \infty} \{f_{2}(x(\lambda_{k})) + \lambda_{k} g(\lambda_{k})\}}} \\{{\mathrm{}}} \\{{\mathrm{} = \displaystyle \operatorname{lim}_{k \to \infty} f_{2}(x(\lambda_{k})).}} \end{array}
$$

Similarly, we can prove that $\phi^{*} = \operatorname{lim}_{k \to \infty} f_{1}(x(\lambda_{k}))$ . Since max $\{\cdot, \cdot\}$ is a continuous function, we conclude that

$$
\phi^{*} = \operatorname{lim}_{k \to \infty} f(x(\lambda_{k})) \ \geq \f^{*},
$$

which proves (3.1.12) under assumption (3.1.14).

Finally, let us assume that there is no sequence satisfying conditions (3.1.14). Consider two sequences:

$$
\{\alpha_{k}\}_{k \geq 0} : \alpha_{k} \uparrow \lambda^{*}, \{\beta_{k}\}_{k \geq 0} : \beta_{k} \downarrow \lambda^{*}.
$$

Since the condition (3.1.14) is not satisfied and the function g is monotone, there exist two positive values a and b such that

$$
\operatorname{lim}_{k \infty} g(\alpha_{k}) = a, \ : \ : \ : \ : \ : \operatorname{lim}_{k \infty} g(\beta_{k}) = - b.
$$

Let $\textstyle \gamma ={\frac{b}{a + b}}$ . Then, in view of Lemma 3.1.4, we have

$$
\begin{array}{l}{\displaystyle{\phi^{*} = \operatorname{lim}_{k \to \infty} \{\gamma \phi(\alpha_{k}) +(1 - \gamma) \phi(\beta_{k})\}}} \\{\displaystyle{= \operatorname{lim}_{k \to \infty} \Big \{\gamma[f_{2}(x(\alpha_{k})) + \alpha_{k} g(\alpha_{k})] +(1 - \gamma)[f_{2}(x(\beta_{k})) + \beta_{k} g(\beta_{k})] \Big\}}} \\{\displaystyle{= \operatorname{lim}_{k \to \infty} \Big \{\gamma f_{2}(x(\alpha_{k})) +(1 - \gamma) f_{2}(x(\beta_{k})) \Big\}}} \\{\displaystyle{\geq \operatorname{lim}_{k \to \infty} f_{2}(\gamma x(\alpha_{k}) +(1 - \gamma) x(\beta_{k})).}} \end{array}
$$

Similarly,

$$
\begin{array}{l}{\displaystyle \phi^{*} = \operatorname{lim}_{k \to \infty} \Big \{\gamma[f_{1}(x(\alpha_{k})) -(1 - \alpha_{k}) g(\alpha_{k})]} \\{\displaystyle \qquad +(1 - \gamma)[f_{1}(x(\beta_{k})) -(1 - \beta_{k}) g(\beta_{k})] \Big\}} \\{\displaystyle = \operatorname{lim}_{k \to \infty} \Big \{\gamma f_{1}(x(\alpha_{k})) +(1 - \gamma) f_{1}(x(\beta_{k})) \Big\}} \\{\displaystyle \qquad \geq \operatorname{lim}_{k \to \infty} f_{1}(\gamma x(\alpha_{k}) +(1 - \gamma) x(\beta_{k})).} \end{array}
$$

Choosing subsequences convergent in the function values, we can see that

$$
\phi^{*} \geq \operatorname{lim}_{k \to \infty} f(\gamma x(\alpha_{k}) +(1 - \gamma) x(\beta_{k})) \geq f^{*}.\quad \quad \boxed{\Omega}
$$

Corollary 3.1.3 Let functions $f_{i}, i = 1, \ldots, m$ , be closed and convex on $Q$ and their constrained level sets be bounded. Then there exists some $\lambda_{*} \in \varDelta_{m}$ such that

$$
\operatorname{min}_{x \in Q} \left(F(x) \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{1 \leq i \leq m} f_{i}(x) \right) = \operatorname{min}_{x \in Q} \left\{\sum_{i = 1}^{m} \lambda_{*}^{(i)} f_{i}(x) \right\}.\tag{3.1.15}
$$

Proof In view of the cumbersome notation, we do only the first two steps in our proof by induction. Let $F_{k}(x) = \operatorname{max}_{k \leq i \leq m} f_{i}(x)$ . Then

$$
F(x) = \operatorname{max} \{f_{1}(x), F_{2}(x)\}, \quad F_{k}(x) = \operatorname{max} \{f_{k}(x), F_{k + 1}((x)\}, k = 2, \ldots, m - 1.
$$

Therefore, by Theorem 3.1.10 there exists a $\lambda_{*}^{(1)} \in[0, 1]$ such that

$$
\begin{array}{l}{{\displaystyle{F^{*} \stackrel{\mathrm{def}}{=}} \operatorname{min}_{x \in Q} F(x) ~ = \operatorname{min}_{x \in Q} \left\{\psi_{1}(x) ~ \stackrel{\mathrm{def}}{=} ~ \lambda_{*}^{(1)} f_{1}(x) +(1 - \lambda_{*}^{(1)}) F_{2}(x) \right\}}} \\{{\displaystyle{}}} \\{{\displaystyle{=} \operatorname{min}_{x \in Q} \operatorname{max} \left\{\lambda_{*}^{(1)} f_{1}(x) +(1 - \lambda_{*}^{(1)}) f_{2}(x), \lambda_{*}^{(1)} f_{1}(x) +(1 - \lambda_{*}^{(1)}) F_{3}(x) \right\}.}} \end{array}
$$

Again, by Theorem 3.1.10, there exists $\mathrm{~ a ~} \xi^{*} \in[0, 1]$ such that $F^{*} = \operatorname{min}_{x \in \mathcal{Q}} \psi_{2}(x)$ where

$$
\begin{array}{rl} &{\psi_{2}(x) = \xi^{*}(\lambda_{*}^{(1)} f_{1}(x) +(1 - \lambda_{*}^{(1)}) f_{2}(x))} \\ &{\qquad +(1 - \xi^{*})(\lambda_{*}^{(1)} f_{1}(x) +(1 - \lambda_{*}^{(1)}) F_{3}(x))} \\ &{\qquad = \lambda_{*}^{(1)} f_{1}(x) + \xi^{*}(1 - \lambda_{*}^{(1)}) f_{2}(x) +(1 - \xi^{*})(1 - \lambda_{*}^{(1)}) F_{3}(x).} \end{array}
$$

Defining $\lambda_{*}^{(2)} = \xi^{*}(1 - \lambda_{*}^{(1)})$ , observe that

$$
\psi_{2}(x) = \lambda_{*}^{(1)} f_{1}(x) + \lambda_{*}^{(2)} f_{2}(x) +(1 - \lambda_{*}^{(1)} - \lambda_{*}^{(2)}) F_{3}(x).
$$

And we can continue.

Note that the functions $f_{i}, i = 1, \ldots, m$ , in Corollary 3.1.3 may be discontinuous.

## 3.1.3 Continuity and Differentiability

In the previous sections, we have seen that a behavior of convex function on the boundary of its domain can be unpredictable (see Examples 3.1.1(6) and 3.1.2(5)). Fortunately, this is the only bad thing which can happen. In this section, we will see that the local structure of a convex function in the interior of its domain is very simple.

Theorem 3.1.11 Let f be convex and $x_{0} \in \operatorname{int} \left(\operatorname{dom} f \right)$ . Then f is locally bounded and locally Lipschitz continuous at $x_{0}$

Proof Let us first prove that f is locally bounded. Let us choose some $\epsilon > 0$ such that $x_{0} \pm \epsilon e_{i} \in \mathrm{int}(\operatorname{dom} f), i = 1, \ldots, n$ . Define

$$
\varDelta = \mathrm{Conv} \left\{x_{0} \pm \epsilon e_{i}, \i = 1 \ldots n \right\} \stackrel{(3.1.8)}{=} B_{1}(x_{0}, \epsilon).
$$

Clearly, $\Delta \subseteq \operatorname{dom} f$ and, in view of Corollary 3.1.2, we have

$$
\operatorname{max}_{x \in \varDelta} f(x) = \operatorname{max}_{1 \leq i \leq n} f(x_{0} \pm \epsilon e_{i}) \{\stackrel{\mathrm{def}}{=}} \M.\tag{3.1.16}
$$

Consider now a point $y \in B_{1}(x_{0}, \epsilon), y \neq x_{0}$ . Let

$$
\begin{array}{r}{\alpha = \frac{1}{\epsilon} \parallel y - x_{0} \parallel_{(1)}, \quad z = x_{0} + \frac{1}{\alpha}(y - x_{0}).} \end{array}
$$

It is clear that $\parallel z - x_{0} \parallel_{(1)} ={\frac{1}{\alpha}} \parallel y - x_{0} \parallel_{(1)} = \epsilon$ . Therefore, $\alpha \leq 1$ and

$$
y = \alpha z +(1 - \alpha) x_{0}.
$$

Hence,

$$
\begin{array}{rl} &{f(y) \leq \alpha f(z) +(1 - \alpha) f(x_{0}) \stackrel{(3.1.16)}{\leq} f(x_{0}) + \alpha(M - f(x_{0}))} \\ &{} \\ &{\quad \quad = f(x_{0}) + \frac{M - f(x_{0})}{\epsilon} \parallel y - x_{0} \parallel_{(1)}.} \end{array}
$$

Further, let $\begin{array}{r}{u = x_{0} + \frac{1}{\alpha}(x_{0} - y)} \end{array}$ . Then $\parallel u - x_{0} \parallel_{(1)} = \epsilon{\mathrm{~ and ~}} y = x_{0} + \alpha(x_{0} - u)$ Therefore, in view of Theorem 3.1.1, we have

$$
\begin{array}{l}{f(y) \geq f(x_{0}) + \alpha(f(x_{0}) - f(u)) \stackrel{{\mathrm{\tiny ~(3.1.16)}}}{\geq} f(x_{0}) - \alpha(M - f(x_{0}))} \\{\quad \quad} \\{= f(x_{0}) - \frac{M - f(x_{0})}{\epsilon} \parallel y - x_{0} \parallel_{\mathrm{\tiny ~(1) ~}}.} \end{array}
$$

Thus, $\begin{array}{r}{\mid f(y) - f(x_{0}) \mid \leq \frac{M - f(x_{0})}{\epsilon} \parallel y - x_{0} \parallel_{(1)}.\perp} \end{array}$ 口

Let us show that all convex functions possess a property which is very close to differentiability.

Definition 3.1.3 Let $x \in$ dom f . We call f differentiable at the point x in direction $p \neq 0$ if the following limit exists:

$$
f^{\prime}(x; p) = \operatorname{lim}_{\alpha \downarrow 0}{\textstyle{\frac{1}{\alpha}}}[f(x + \alpha p) - f(x)].\tag{3.1.17}
$$

The value $f^{\prime}(x; p)$ is called the directional derivative of f at x.

Theorem 3.1.12 A convex function f is differentiable in any direction at any interior point of its domain.

Proof Let $x \in$ int (dom f ). Consider the function

$$
\begin{array}{r}{\phi(\alpha) = \frac{1}{\alpha}[f(x + \alpha p) - f(x)], \quad \alpha > 0.} \end{array}
$$

Let $\beta \in(0, 1]$ , and the value $\alpha \in(0, \epsilon]$ be small enough to have $x + \epsilon p \in \operatorname{dom} f.$ Then,

$$
f(x + \alpha \beta p) = f((1 - \beta) x + \beta(x + \alpha p)) \leq(1 - \beta) f(x) + \beta f(x + \alpha p).
$$

Therefore,

$$
\begin{array}{r}{\phi(\alpha \beta) = \frac 1{\alpha \beta}[f(x + \alpha \beta p) - f(x_{0})] \ \le \ \frac 1 \alpha[f(x + \alpha p) - f(x)] \ = \ \phi(\alpha).} \end{array}
$$

Thus, $\phi(\alpha)$ decreases as α 0. Let us choose $\gamma > 0$ small enough to have the point $x - \gamma p$ inside the domain. Then, $\begin{array}{r}{x + \alpha p = x + \frac{\alpha}{\gamma}(x -(x - \gamma p))} \end{array}$ . Therefore, in view of inequality (3.1.5), we have

$$
\begin{array}{r}{\phi(\alpha) \geq \frac{1}{\gamma}[f(x) - f(x - \gamma p)].} \end{array}
$$

Hence, the limit in the right-hand side of (3.1.17) exists.

Let us prove that the directional derivative provides us with a global lower support of the initial convex function.

Lemma 3.1.5 Let the function f be convex and $x \in$ int (dom $f)$ . Then $f^{\prime}(x; \cdot)$ is a convex function which is positively homogeneous of degree one. For any $y \in \operatorname{dom} f$ we have

$$
f(y) \geq f(x) + f^{\prime}(x; y - x).\tag{3.1.18}
$$

Proof Let us prove that the directional derivative is homogeneous. Indeed, for any $p \in \mathbb{R}^{n}$ and $\tau > 0$ , we have

$$
\begin{array}{l}{{f^{\prime}(x; \tau p) = \displaystyle \operatorname{lim}_{\alpha \downarrow 0} \frac{1}{\alpha}[f(x + \tau \alpha p) - f(x)]}} \\{{\displaystyle \qquad}} \\{{\qquad = \tau \operatorname{lim}_{\beta \downarrow 0} \frac{1}{\beta}[f(x + \beta p) - f(x)] = \tau f^{\prime}(x_{0}; p).}} \end{array}
$$

Further, for any $p_{1}, p_{2} \in \mathbb{R}^{n}$ and $\beta \in[0, 1]$ , we obtain

$$
\begin{array}{rl} &{f^{\prime}(x; \beta p_{1} +(1 - \beta) p_{2}) = \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{1}{\alpha}[f(x + \alpha(\beta p_{1} +(1 - \beta) p_{2})) - f(x)]} \\ &{} \\ &{\qquad \leq \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{1}{\alpha} \{\beta[f(x + \alpha p_{1}) - f(x)]} \\ &{} \\ &{\qquad +(1 - \beta)[f(x + \alpha p_{2}) - f(x)]\}} \\ &{} \\ &{\qquad = \beta f^{\prime}(x; p_{1}) +(1 - \beta) f^{\prime}(x; p_{2}).} \end{array}
$$

Thus, $f^{\prime}(x; p)$ is convex in $p.$ . Finally, let $\alpha \in(0, 1], y \in \operatorname{dom} f.$ , and $y_{\alpha} = x +$ $\alpha(y - x)$ . Then in view of Theorem 3.1.1, we have

$$
\begin{array}{r}{f(y) = f(y_{\alpha} + \frac{1}{\alpha}(1 - \alpha)(y_{\alpha} - x)) \geq \f(y_{\alpha}) + \frac{1}{\alpha}(1 - \alpha)[f(y_{\alpha}) - f(x)],} \end{array}
$$

and we get (3.1.18) taking the limit as $\alpha \downarrow 0$ □

## 3.1.4 Separation Theorems

Up to now, we have looked at the properties of convex functions in terms of function values. We have not yet introduce any directions, which could be used by minimization schemes. In Convex Analysis, such directions are defined by separation theorems, which are presented in this section.

Definition 3.1.4 Let $Q$ be a convex set. We say that the hyperplane

$$
{\mathcal{H}}(g, \gamma) = \{x \in \mathbb{R}^{n} \mid \langle g, x \rangle = \gamma\}, \quad g \neq 0,
$$

is supporting to $Q$ if any $x \in Q$ satisfies inequality $\langle g, x \rangle \leq \gamma$ . The hyperplane ${\mathcal{H}}(g, \gamma) \not \geq Q$ separates a point x from Q if

$$
\langle g, x \rangle \leq \gamma \leq \langle g, x_{0} \rangle\tag{3.1.19}
$$

for all $x \in Q$ . If one of the inequalities in (3.1.19) is strict, the we call the separation strong.

In a similar way, we define separability of convex sets. Two sets $Q_{1}$ and $Q_{2}$ are called separable if there exist $g \in \mathbb{R}^{n}, g \neq 0$ , and $\gamma \in \mathbb{R}$ such that

$$
\langle g, x \rangle \leq \gamma \leq \langle g, y \rangle \forall x \in Q_{1}, y \in Q_{2}.\tag{3.1.20}
$$

The separation is strict if one of the inequalities in (3.1.20) is strict. We call the separation strong if

$$
\operatorname{sup}_{x \in Q_{1}} \langle g, x \rangle < \gamma \ < \ \operatorname{inf}_{y \in Q_{2}} \langle g, y \rangle.\tag{3.1.21}
$$

All separation theorems in $\mathbb{R}^{n}$ can be derived from the properties of Euclidean projection. Let us first describe the possibilities for strong separation.

Theorem 3.1.13 Let $Q_{1}$ and $Q_{2}$ be closed convex sets in $\mathbb{R}^{n}$ such that $Q_{1} \cap Q_{2} =$ . These sets are strongly separable provided that one of them is bounded.

Proof Suppose that $Q_{1}$ is bounded. Consider the following minimization problem:

$$
\rho^{*} = \operatorname{min}_{x \in Q_{1}} \rho_{Q_{2}}(x).
$$

Note that the optimal value of this problem is positive and its optimal set $X^{*}$ is not empty. Moreover, for all $x^{*} \in X^{*}$ , we have

$$
\nabla \rho_{Q_{2}}(x^{*}) \stackrel{(2.2.41)}{=} g^{*}, \quad \langle g^{*}, x^{*} \rangle \stackrel{(2.2.41)}{=} \gamma^{*}.
$$

Therefore, for all $x_{1} \in Q_{1}$ we have

$$
\langle{\boldsymbol g}^{*}, \boldsymbol x_{1} \rangle - \gamma^{*} \overset{(2.2.41)}{=} \langle \nabla \rho_{Q}(\boldsymbol x^{*}), \boldsymbol x_{1} - \boldsymbol x^{*} \rangle \overset{(2.2.39)}{\geq} 0.
$$

On the other hand, for all $x_{2} \in Q_{2}$ we have

$$
\begin{array}{rlr}{\langle g^{*}, x_{2} \rangle -{\gamma^{*}}^{(2.2.41)} \langle x^{*} - \pi_{Q_{2}}(x^{*}), x_{2} - x^{*} \rangle \stackrel{(2.2.47)}{\leq} - \| x^{*} - \pi_{Q_{2}}(x^{*}) \|^{2}} & \\ &{} & \\{= -(\rho^{*})^{2}.} &{\sqsupset} \end{array}
$$

Remark 3.1.1 The assumption of boundedness of one of the sets in Theorem 3.1.13 cannot be omitted. To see why, consider the separation problem for sets $Q$ and $\mathbb{R}_{+}^{1, 2}$ in Example 2.2.1.

Corollary 3.1.4 Let Q be a closed convex set and $x \not \in \Q$ . Then x is strongly separable from $Q.$ .

Let us give an example of application of this important fact.

Corollary 3.1.5 Let $Q_{1}$ and $Q_{2}$ be two closed convex sets.

1. $Hf \xi_{Q_{1}}(g) \leq \xi_{Q_{2}}(g)$ for all $g \in$ dom $\psi_{Q_{2}}$ , then $Q_{1} \subseteq Q_{2}$

2. Let dom $\xi_{Q_{1}} = \mathrm{dom} \xi_{Q_{2}}$ , and for any $g \in \mathrm{dom} \xi_{Q_{1}}$ we have $\xi_{Q_{1}}(g) = \xi_{Q_{2}}(p)$ Then $Q_{1} \equiv Q_{2}$

Proof

1. Assume that there exists an $x_{0} \in Q_{1}$ which does not belong to $Q_{2}$ . Then, in view of Corollary 3.1.5, there exists a direction $g$ such that

$$
\langle g, x_{0} \rangle > \gamma \geq \langle g, x \rangle
$$

for all $x \in \mathrm{~ ~{~ Q ~} ~}_{2}$ . Hence, $g \in \mathrm{~ \dom} \xi_{Q_{2}}$ and $\xi_{Q_{1}}(g) > \xi_{Q_{2}}(g)$ . This is a contradiction.

2. In view of the first statement, $Q_{1} \subseteq Q_{2}$ and $Q_{2} \subseteq Q_{1}$ . Therefore, $Q_{1} \equiv Q_{2}$ □

The next separation theorem deals with boundary points of convex sets.

Theorem 3.1.14 Let Q be a closed convex set. If the point x belongs to the boundary of Q, then there exists a supporting to Q hyperplane ${\mathcal{H}}(g, \gamma)$ which contains x<sub>0</sub>.

(Such a vector g is called supporting to $Q$ at the point $x_{0}.)$

Proof Consider a sequence $\{y_{k}\}$ such that $y_{k} \notin Q$ and $y_{k} \to x_{0}$ . Let

$$
\begin{array}{r}{g_{k} = \frac{y_{k} - \pi_{Q}(y_{k})}{\| y_{k} - \pi_{Q}(y_{k}) \|}, \quad \gamma_{k} = \langle g_{k}, \pi_{Q}(y_{k}) \rangle.} \end{array}
$$

In view of Corollary 3.1.5, for all $x \in Q$ we have

$$
\langle g_{k}, x \rangle \leq \gamma_{k} \leq \langle g_{k}, y_{k} \rangle.\tag{3.1.22}
$$

However, $g_{k} \parallel = 1$ and, in view of Lemma 2.2.8, the sequence $\{\gamma_{k}\}$ is bounded:

$$
\begin{array}{rl} &{| \gamma_{k} | = | \langle g_{k}, \pi_{Q}(y_{k}) - x_{0} \rangle + \langle g_{k}, x_{0} \rangle | \leq \| \pi_{Q}(y_{k}) - x_{0} \| + \| x_{0} \|} \\ &{} \\ &{\quad \leq \| \y_{k} - x_{0} \| + \| x_{0} \|.} \end{array}
$$

Therefore, without loss of generality, we can assume that there exist $g^{*} = \operatorname{lim}_{k \to \infty} g_{k}$ and $\gamma^{*} = \operatorname{lim}_{k \to \infty} \gamma_{k}$ . It remains to take the limit in inequalities (3.1.22).

## 3.1.5 Subgradients

Now we are ready to introduce a generalization of the notion of the gradient.

Definition 3.1.5 A vector g is called a subgradient of the function f at the point $x_{0} \in \operatorname{dom} f$ if for any $y \in$ dom f we have

$$
f(y) \geq f(x_{0}) + \langle g, y - x_{0} \rangle.\tag{3.1.23}
$$

The set of all subgradients of $f$ at $x_{0}, \ \partial f(x_{0})$ , is called the subdifferential of the function $f$ at the point $x_{0}$

If inequality (3.1.23) is valid only for points $y \in Q$ , we use notation $g \in \partial_{Q} f(x_{0})$ The latter set is called constrained subdifferential. Clearly, $\partial f(x_{0}) \subseteq \partial_{Q} f(x_{0})$ for any convex set $Q \subseteq \operatorname{dom} f$

For concave functions, we define super-gradients and super-differentials by changing the sign in inequality (3.1.23). Note that $\partial f(x_{0})$ can be nonempty even for nonconvex $f.$

A simple consequence of Definition 3.1.5 is as follows:

$$
\langle g_{1} - g_{2}, x_{1} - x_{2} \rangle \geq 0 \quad \forall x_{1}, x_{2} \in \mathrm{dom} f, \g_{1} \in \partial f(x_{1}), \g_{2} \in \partial f(x_{2}).\tag{3.1.24}
$$

The necessity of introducing the notion of subdifferential is clear from the following example.

Example 3.1.3 Consider the function $f(x) =(x)_{+} \stackrel{\mathrm{def}}{=} \operatorname{max} \{x, 0\}, x \in \mathbb{R}$ . For all $y \in \mathbb R$ and $g \in[0, 1]$ , we have

$$
f(y) = \operatorname{max} \{y, 0\} \ \geq \g \cdot y \ = \f(0) + g \cdot(y - 0).
$$

Therefore subgradient of f at $x = 0$ is not uniquely defined. In our example, this is an arbitrary value from the interval 0, 1 .

The whole set of conditions (3.1.23) parameterized by $y \in Q$ can be seen as a set of linear inequality constraints for $g_{\i}$ , defining the set $\partial_{Q} f(x_{0})$ . Therefore, by definition, any subdifferential is a closed convex set.

Let us prove that subdifferentiability of function $f$ at all points of some convex set implies convexity and closedness of the function.

Lemma 3.1.6 Let Q be a convex set. Assume that, for any $x \in Q \subseteq \mathrm{dom} f,$ the constrained subdifferential $\partial_{Q} f(x)$ is nonempty. Then f is a closed convex function on $Q.$

Proof For any $x \in Q$ , define ${\hat{f}}(x) = \operatorname{sup}_{v} \{f(y) + \langle g(y), x - y \rangle : \y \in Q\} \geq f(x)$ J where $g(y)$ is an arbitrary subgradient from $\partial_{Q} f(y)$ . By Theorem 3.1.8, $\hat{f}$ is a closed convex function, and ${f(x)} \stackrel{(3.1.23)}{\geq}{\hat{f}(x)}$ for all $x \in Q$ .

On the other hand, we can prove a relaxed converse statement.

Theorem 3.1.15 Let the function f be convex. $Ifx_{0} \in \operatorname{int} \left(\operatorname{dom} f \right)$ , then $\partial f(x_{0})$ is a nonempty bounded set.

Proof Since the point $(f(x_{0}), x_{0})$ belongs to the boundary of epi $(f)$ , in view of Theorem 3.1.14, there exists a hyperplane supporting to epi $(f)$ at $(f(x_{0}), x_{0})$

$$
- \alpha \tau + \langle d, x \rangle \leq - \alpha f(x_{0}) + \langle d, x_{0} \rangle\tag{3.1.25}
$$

for all $(\tau, x) \in \mathrm{epi}(f)$ . Let us normalize the coefficients of hyperplane in order to satisfy the condition

$$
\parallel d \parallel^{2} + \alpha^{2} = 1,\tag{3.1.26}
$$

where the norm is standard Euclidean. Since the point $(\tau, x_{0})$ belongs to epi $(f)$ for all $\tau \geq f(x_{0})$ , we conclude that $\alpha \ge 0$

In view of Theorem 3.1.11 a convex function is locally Lipschitz continuous in the interior of its domain. This means that there exist some $\epsilon > 0$ and $M > 0$ such that $B_{2}(x_{0}, \epsilon) \subseteq \operatorname{dom} f$ and

$$
f(x) - f(x_{0}) \leq M \parallel x - x_{0} \parallel
$$

for all $x \in B_{2}(x_{0}, \epsilon).^{2}$ Therefore, in view of (3.1.25), for any x from this ball

$$
\langle d, x - x_{0} \rangle \leq \alpha(f(x) - f(x_{0})) \leq \alpha M \parallel x - x_{0} \parallel.
$$

Choosing $x = x_{0} + \epsilon d$ , we get $d \ \| ^ { 2 } \leq M \alpha \ \| \ d \ \| $ . Thus, in view of normalizing condition (3.1.26), we get $\alpha \ge[1 + M^{2}]^{- 1 / 2}$ . Hence, choosing $g = d / \alpha$ , we obtain

$$
f(x) \stackrel{(3.1.25)}{\geq} f(x_{0}) + \langle g, x - x_{0} \rangle
$$

for all $x \in$ dom $f.$

Finally, if $g \in \partial f(x_{0}), g \neq 0$ , then choosing $x = x_{0} + \epsilon g / \parallel g \parallel$ we obtain

$$
\epsilon \parallel g \parallel = \langle g, x - x_{0} \rangle \ \leq \f(x) - f(x_{0}) \ \leq \M \parallel x - x_{0} \parallel = \M \epsilon.
$$

Thus, $\partial f(x_{0})$ is bounded.

The next example shows that the statement of Theorem 3.1.15 cannot be strengthened.

Example 3.1.4 Consider function $f(x) = -{\sqrt{x}}$ with domain $\mathbb{R}_{+}$ . This function is convex and closed, but the subdifferential does not exist at $x = 0$ □

Sub-differentiability at $x \in$ dom f is an important characteristic of the local structure of the function f around this point. Let us prove the following fact.

Theorem 3.1.16 For the function $f,$ , define its Fenchel dual

$$
f_{*}(s) = \operatorname{sup}_{y \in \mathrm{dom} f}[\langle s, y \rangle - f(y)],\tag{3.1.27}
$$

and the dual of the Fenchel dual:

$$
f_{* *}(x) = \operatorname{sup}_{s \in \mathrm{dom} f_{*}}[\langle s, x \rangle - f_{*}(s)].
$$

Then $f(x) \ \geq \f_{* *}(x)$ for all $x \in$ dom f . Moreover, $if \partial f(x) \neq \emptyset$ for some $x \in$ dom f , then $\partial f(x) \subseteq$ dom $f_{*}$ and $f(x) = f_{* *}(x)$

Proof Indeed, for any $x \in$ dom f we have

$$
\begin{array}{rcl}{f_{* *}(x)} &{=} &{\displaystyle \operatorname{sup}_{s \in \mathrm{dom}}[\langle s, x \rangle - f_{*}(s)] \overset{(3.1.27)}{=} \displaystyle \operatorname{sup}_{s \in \mathrm{dom} \mathcal{I}_{*}} \operatorname{inf}_{y \in \mathrm{dom} \mathcal{I}}[\langle s, x \rangle - \langle s, y \rangle + f(y)]} \\ & &{\displaystyle(1.3.6)} \\ & &{\displaystyle \overset{()}{\leq} \displaystyle \operatorname{inf}_{y \in \mathrm{dom} \mathcal{f}_{s} \in \mathrm{dom} \mathcal{I}_{*}}[\langle s, x - y \rangle + f(y)] \overset{y = x}{\leq} f(x).} \end{array}
$$

Let us choose now an arbitrary $g \in \partial f(x)$ . Then for any $y \in$ dom f we have

$$
\langle g, y \rangle - f(y){\overset{(3.1.23)}{\leq}} \langle g, y \rangle - f(x) - \langle g, y - x \rangle = \langle g, x \rangle - f(x).
$$

Thus, $g \in$ dom $f_{*}$ . Therefore,

$$
\begin{array}{rl} &{f_{\ast \ast}(x) = \underset{s \in \mathrm{dom} f_{\ast}}{\operatorname{sup}} \underset{y \in \mathrm{dom} f}{\operatorname{inf}}[\langle s, x \rangle - \langle s, y \rangle + f(y)]} \\ &{} \\ &{\geq \underset{y \in \mathrm{dom} f}{\operatorname{inf}}[\langle g, x \rangle - \langle g, y \rangle + f(y)] \overset{(3.\underline{{1}}.23)}{=} f(x).\qquad \square} \end{array}
$$

Let us prove an important relation between subdifferential and directional derivatives of a convex function.

Theorem 3.1.17 Let the function f be convex, and $x_{0} \in \operatorname{int} \left(\operatorname{dom} f \right)$ . Then

$$
\partial_{2} f^{\prime}(x_{0}; 0) = \partial f(x_{0}),
$$

where the subdifferential $\partial_{2}$ corresponds to the second argument of the function $f(x_{0}; \cdot)$ . Moreover, for any $p \in \mathbb{R}^{n}$ , we have

$$
f^{\prime}(x_{0}; p) = \operatorname{max} \{\langle g, p \rangle \mid g \in \partial f(x_{0})\}.\tag{3.1.28}
$$

Proof Note that

$$
f^{\prime}(x_{0}; p) = \operatorname{lim}_{\alpha \downarrow 0} \frac{1}{\alpha}[f(x_{0} + \alpha p) - f(x_{0})] \geq \langle g, p \rangle,\tag{3.1.29}
$$

where $g$ is an arbitrary vector from $\partial f(x_{0})$ . Therefore, the subdifferential of the function $f^{\prime}(x_{0}; \cdot)$ at $p = 0$ is not empty and $\partial f(x_{0}) \subseteq \partial_{2} f^{\prime}(x_{0}; 0)$ . On the other hand, since $f^{\prime}(x_{0}; p)$ is convex in $p_{:}$ , in view of Lemma 3.1.5, for any $y \in \operatorname{dom} f$ we have

$$
f(y) \geq f(x_{0}) + f^{\prime}(x_{0}; y - x_{0}) \geq f(x_{0}) + \langle g, y - x_{0} \rangle,
$$

where $g \in \partial_{2} f^{\prime}(x_{0}; 0)$ . Thus, ∂<sub>2</sub> $f^{\prime}(x_{0}; 0) \subseteq \partial f(x_{0})$ and we see that these two sets coincide.

Consider $g \in \partial_{2} f^{\prime}(x_{0}; p)$ . Then, in view of inequality (3.1.18), for all $v \in \mathbb{R}^{n}$ and $\tau > 0$ we have

$$
\tau f^{\prime}(x_{0}; v) = f^{\prime}(x_{0}; \tau v) \ \geq \f^{\prime}(x_{0}; p) + \langle g, \tau v - p \rangle.
$$

Considering $\tau \to \infty$ we get

$$
f^{\prime}(x_{0}; v) \geq \langle g, v \rangle,\tag{3.1.30}
$$

and, considering $\tau 0$ , we obtain

$$
f^{\prime}(x_{0}; p) - \langle g, p \rangle \leq 0.\tag{3.1.31}
$$

However, inequality (3.1.30) implies that $g ~ \in ~ \partial_{2} f^{\prime}(x_{0}; 0)$ . Therefore, comparing (3.1.29) and (3.1.31), we conclude that $\langle g, p \rangle = f^{\prime}(x_{0}; p)$ □

Let us mention some properties of subgradients, which are of central importance for Convex Optimization. The next result forms the basis for the cutting plane optimization schemes.

Theorem 3.1.18 For any $x_{0} \in$ dom f , all vectors $g \in \partial f(x_{0})$ are supporting to the level set $\mathcal{L}_{f}(f(x_{0}))$

$$
\langle g, x_{0} - x \rangle \geq 0 \forall x \in \mathcal{L}_{f}(f(x_{0})) \ = \ \{x \in \mathrm{dom} f : \f(x) \leq f(x_{0})\}.
$$

Proof Indeed, if $f(x) \leq f(x_{0})$ and $g \in \partial f(x_{0})$ , then

$$
f(x_{0}) + \langle g, x - x_{0} \rangle \leq f(x) \leq f(x_{0}).\qquad \mathbb{U}
$$

Corollary 3.1.6 Let $Q \subseteq$ dom f be a closed convex set, $x_{0} \in Q$ , and

$$
x^{*} \in \mathop{\mathrm{Argmin}}_{x \in \mathcal{Q}} \f(x).
$$

Then for any $g \in \partial f(x_{0})$ , we have $\langle g, x_{0} - x^{\ast} \rangle \geq 0.$ □

In some situations, the following objects are very useful.

Definition 3.1.6 Let the set $X \subseteq$ dom f be closed and convex. The set

$$
{\widehat{\partial f}}(X) = \bigcap_{x \in X} \partial f(x)\tag{3.1.32}
$$

is called the epigraph facet of the set X.

This definition is motivated by the following statement.

Theorem 3.1.19 Let the set X be closed and convex, and ${\widehat{\partial f}}(X) \neq \varnothing.$ Then

$$
f((1 - \alpha) x_{0} + \alpha x_{1}) =(1 - \alpha) f(x_{0}) + \alpha f(x_{1}), \forall x_{0}, x_{1} \in X, \alpha \in[0, 1].\tag{3.1.33}
$$

Moreover, for any $g \in{\widehat{\partial f}}(X)$ and all $x_{0}, x_{1}$ from X, we have

$$
f(x_{1}) = f(x_{0}) + \langle g, x_{1} - x_{0} \rangle.\tag{3.1.34}
$$

Proof Indeed, let $g \in{\widehat{\partial f}}(X) \subseteq \partial f(x_{0}) \bigcap \partial f(x_{1})$ . Then,

$$
f(x_{0}) + \langle g, x_{1} - x_{0} \rangle \stackrel{(3.1.23)}{\leq} f(x_{1}) \stackrel{(3.1.23)}{\leq} f(x_{0}) + \langle g, x_{1} - x_{0} \rangle.
$$

Thus, (3.1.34) is proved. Consequently, for $x_{\alpha} =(1 - \alpha) x_{0} + \alpha x_{1}$ with $\alpha \in[0, 1]$ we have

$$
\begin{array}{rl} &{(1 - \alpha) f(x_{0}) + \alpha f(x_{1}) \overset{(3.1.2)}{\geq} f(x_{\alpha}) \overset{(3.1.23)}{\geq} f(x_{0}) + \langle g, x_{\alpha} - x_{0} \rangle} \\ &{} \\ &{= f(x_{0}) + \alpha \langle g, x_{1} - x_{0} \rangle \overset{(3.1.34)}{=}(1 - \alpha) f(x_{0}) + \alpha f(x_{1}).} \end{array}
$$

Thus, we have proved equality (3.1.33).

Let us show how the epigraph facets arise in optimality conditions for Unconstrained Optimization.

Theorem 3.1.20 Let $X^{*} = Arg \operatorname{min}_{x \in \mathrm{dom}_{f}} f(x)$ . Then a closed convex set $X_{*}$ is a subset of $X^{*}$ if and only if

$$
0 \in{\widehat{\partial f}}(X_{*}).
$$

Proof Indeed, if $0 \in{\widehat{\partial f}}(X_{*})$ , then for any $x^{*} \in X_{*}$ and all $x \in$ dom f we have

$$
f(x) \geq f(x^{*}) + \langle 0, x - x^{*} \rangle \ = \f(x^{*}).
$$

Thus, $x^{*} \in X^{*}$

On the other hand, if $f(x) \geq f(x^{*})$ for all $x \in$ dom f and $x^{*} \in X_{*}$ , then by Definition $3.1.5, 0 \in \bigcap_{x^{*} \in X_{*}} \partial f(x^{*})$ .

In what follows, for a set-valued mapping $\mathcal{S}(\cdot)$ and arbitrary set $X \subseteq \mathbb{R}^{n}$ , we use the notation ${\widehat{\mathcal{S}}}(X) \{\stackrel{\mathrm{def}}{=}} \ \bigcap_{x \in X}{\mathcal{S}}(x)$

## 3.1.6 Computing Subgradients

In the previous section, we introduced subgradients, the objects which we are going to use in minimization methods. However, in order to apply such methods for solving real-life problems, we need to be sure that subgradients are computable. In this section, we present the corresponding computational rules. Note that for the majority of minimization methods, it is enough to be able to compute a single subgradient from the set $\partial f(x)$

Let us first establish some relations between gradients and subgradients.

Lemma 3.1.7 Let a function f be convex. Assume that it is differentiable at a point $x \in$ int (dom f ). Then $\partial f(x) = \{\nabla f(x)\}$

Proof Indeed, for any direction $p \in \mathbb{R}^{n}$ , we have

$$
f^{\prime}(x; p) = \langle \nabla f(x), p \rangle.
$$

It remains to use Theorem 3.1.17 and Item 2 of Corollary 3.1.5.

Lemma 3.1.8 Let a function $\psi(\cdot)$ be convex and ϕ be a univariate convex function, which is non-decreasing on the set

$$
\operatorname{Im} \psi = \{\tau = \psi(x), \x \in \operatorname{dom} \psi\}.
$$

Then the function $f(\cdot) = \varphi(\psi(\cdot))$ is convex and for any x from int (dom ψ) we have

$$
\partial f(x) = \mathrm{Conv} \{\lambda \partial \psi(x), \lambda \in \partial \varphi(\psi(x))\}.
$$

Proof Indeed the function f is convex in view of Theorem 3.1.9. Let us fix an arbitrary $x \in$ int (dom ψ) and any direction h. Then, by the chain rule for directional derivatives, we have

$$
\begin{array}{l}{{f^{\prime}(x; p) = \varphi^{\prime}(\psi(x); \psi^{\prime}(x; p)) = \displaystyle \operatorname{max}_{\lambda} \{\lambda \psi^{\prime}(x; p) : \lambda \in \partial \varphi(\psi(x))\}}} \\{{\mathrm{}}} \\{{\displaystyle \ = \operatorname{max}_{\lambda, g} \{\langle g, p \rangle : \g \in \lambda \partial \psi(x), \ \lambda \in \partial \varphi(\psi(x))\}.}} \end{array}
$$

It remains to use Theorem 3.1.17 and Item 2 of Corollary 3.1.5.

Consider now a mixed situation when the function $f(x, y)$ depends on two variables $x \in \mathbb{R}^{n}$ and $y \in \mathbb{R}^{m}$

Lemma 3.1.9 Let a function f be convex, and

$$
\bar{z} =(\bar{x}, \bar{y}) \in \mathrm{int}(\mathrm{dom} f) \ \subseteq \ \mathbb{R}^{n} \times \mathbb{R}^{m}.
$$

Assume that f is differentiable in the first variable, and the corresponding partial gradient $\nabla_{1} f(\cdot, \cdot) \in \mathbb{R}^{n}$ is continuous at z along any direction in $\mathbb{R}^{n + m}$ . Then

$$
\partial f({\bar{z}}) =(\nabla_{1} f({\bar{x}},{\bar{y}}), \partial_{2} f({\bar{x}},{\bar{y}})),
$$

where $\partial_{2} f(x, y) \subset \mathbb{R}^{m}$ is the partial subdifferential of f with respect to the second variable, when the first variable is fixed.

Proof Let us fix an arbitrary direction $h =(h_{x}, h_{v}) \in \mathbb \mathbb{R}^{n} \times \mathbb \mathbb{R}^{m}$ . Then for $\alpha > 0$ small enough, we have

$$
\begin{array}{r}{\frac{1}{\alpha}(f(\bar{x} + \alpha h_{x}, \bar{y} + \alpha h_{y}) - f(\bar{x}, \bar{y})) = \frac{1}{\alpha}(f(\bar{x} + \alpha h_{x}, \bar{y} + \alpha h_{y}) - f(\bar{x}, \bar{y} + \alpha h_{y}))} \\{+ \frac{1}{\alpha}(f(\bar{x}, \bar{y} + \alpha h_{y}) - f(\bar{x}, \bar{y})).\qquad} \end{array}
$$

Since f is convex, we have

$$
\begin{array}{r}{\alpha \langle \nabla_{1} f(\bar{x}, \bar{y} + \alpha h_{y}), h_{x} \rangle \overset{(2.1.2)}{\leq} f(\bar{x} + \alpha h_{x}, \bar{y} + \alpha h_{y}) - f(\bar{x}, \bar{y} + \alpha h_{y})} \end{array}
$$

$$
\stackrel{(2.1.2)}{\leq} \alpha \langle \nabla_{1} f(\bar{x} + \alpha h_{x}, \bar{y} + \alpha h_{y}), h_{x} \rangle.
$$

Hence, in view of the directional continuity of $\nabla_{1} f$ , we have

$$
\begin{array}{ll}{{f^{\prime}(\bar{z}, h)}} &{{= \langle \nabla_{1}(f(\bar{x}, \bar{y}), h_{x} \rangle + f^{\prime}(\bar{z},(0, h_{y}))}} \\{{}} &{{}} \\{{\overset{(3.1.28)}{=} \langle \nabla_{1}(f(\bar{x}, \bar{y}), h_{x} \rangle + \displaystyle{\operatorname{max}_{g} \{\langle g, h_{y} \rangle : \g \in \partial_{2} f(\bar{x}, \bar{y})\}}.}} \end{array}
$$

It remains to use Corollary 3.1.5.

Finally, let us present a converse statement, which derives differentiability from a kind of continuous subdifferentiability.

Lemma 3.1.10 Let f be convex and $x_{0} \in$ int (dom f ). Assume that there exists a vector function $g(x) \in \partial f(x)$ which is continuous at x . Then f is differentiable at x and $\nabla f(x_{0}) = g(x_{0})$

Proof Indeed, for any direction $h \in \mathbb{R}^{n}$ and small enough positive α, we have

$$
\langle g(x_{0}), h \rangle \stackrel{(3.1.23)}{\leq} \frac{1}{\alpha}[f(x_{0} + \alpha h) - f(x_{0})] \stackrel{(3.1.23)}{\leq} \langle g(x_{0} + \alpha h), h \rangle.
$$

Thus, taking the limit as $\alpha \downarrow 0$ , we get $f^{\prime}(x_{0}; h) = \langle g(x_{0}), h \rangle$ for all $\textit{h} \in \mathbb{R}^{n}$ Hence, $g(x_{0}) = \nabla f(x_{0}).\quad \bot$

Let us provide all operations for convex functions, described in Sect. 3.1.2, with corresponding chain rules for updating subgradients.

Lemma 3.1.11 Let the function f be closed and convex on the bounded set $S \subseteq$ dom $f \subseteq \mathbb{R}^{m}$ . Consider a linear operator

$$
\mathcal{A}(x) = Ax + b : \quad \mathbb{R}^{n} \to \mathbb{R}^{m}.
$$

Then $\phi(x) = f({\mathcal{A}}(x))$ is a closed convex function on the set

$$
Q = \{x \mid{\mathcal{A}}(x) \in S\}.
$$

For any $x \in Q$ with nonempty $\partial f(\mathcal{A}(x))$ we have

$$
\partial \phi(x) = A^{T} \partial f({\mathcal{A}}(x)).
$$

Proof We have already proved the first part of this lemma in Theorem 3.1.6. Let us prove the relation for the subdifferential. Let $y_{0} = \mathcal{A}(x_{0})$ . Then for all $p \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{l}{{\phi^{\prime}(x_{0}, p) = f^{\prime}(y_{0}; Ap) = \operatorname{max} \{\langle g, Ap \rangle \mid g \in \partial f(y_{0})\}}} \\{{\}} \\{{= \operatorname{max} \{\langle \bar{g}, p \rangle \mid \bar{g} \in A^{T} \partial f(y_{0})\}.}} \end{array}
$$

Using Theorem 3.1.17 and Corollary 3.1.5, we get $\partial \phi(x_{0}) = A^{T} \partial f(\mathcal{A}(x_{0}))$ . □

Lemma 3.1.12 Let functions $f_{1}$ and $f_{2}$ be closed and convex, and α , $\alpha_{2} \geq 0.$ . Then the function $f(x) = \alpha_{1} f_{1}(x) + \alpha_{2} f_{2}(x)$ is also closed and convex and

$$
\partial f(x) = \alpha_{1} \partial f_{1}(x) + \alpha_{2} \partial f_{2}(x)\tag{3.1.35}
$$

for any x from int (dom $f) = \mathrm{int}(\mathrm{dom} f_{1}) \bigcap$ int (dom $f_{2})$

Proof In view of Theorem 3.1.5, we need to prove only the relation for the subdifferentials. Consider $x_{0} \in$ int (dom $f_{1}) \cap$ int (dom $f_{2})$ . In view of Theorem 3.1.15, at this point both subdifferentials are bounded. For any $p \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{rl} &{f^{\prime}(x_{0}; p) = \alpha_{1} f_{1}^{\prime}(x_{0}; p) + \alpha_{2} f_{2}^{\prime}(x_{0}; p)} \\ &{\qquad = \operatorname{max} \{\langle g_{1}, \alpha_{1} p \rangle \mid g_{1} \in \partial f_{1}(x_{0})\}} \\ &{\qquad + \operatorname{max} \{\langle g_{2}, \alpha_{2} p \rangle \mid g_{2} \in \partial f_{2}(x_{0})\}} \\ &{\qquad = \operatorname{max} \{\langle \alpha_{1} g_{1} + \alpha_{2} g_{2}, p \rangle \mid g_{1} \in \partial f_{1}(x_{0}), \g_{2} \in \partial f_{2}(x_{0})\}} \\ &{\qquad = \operatorname{max} \{\langle g, p \rangle \mid g \in \alpha_{1} \partial f_{1}(x_{0}) + \alpha_{2} \partial f_{2}(x_{0})\}.} \end{array}
$$

Hence, using Theorem 3.1.17 and Corollary 3.1.5, we get (3.1.35).

Lemma 3.1.13 Let functions $f_{i}, ~ i ~ = ~ 1 \ldots m$ , be closed and convex. Then the function $f(x) = \operatorname{max}_{1 \leq i \leq m} f_{i}(x)$ is closed and convex. For any $x \in \operatorname{int} \left(\operatorname{dom} f \right) =$ $\bigcap_{i = 1}^{m}$ int (dom $f_{i})$ , we have

$$
\partial f(x) = \mathrm{Conv} \{\partial f_{i}(x) \mid i \in I(x)\},\tag{3.1.36}
$$

where $I(x) = \{i : f_{i}(x) = f(x)\}$

Proof Again, in view of Theorem 3.1.5, we need to justify only the rules for subdifferentials. Consider $x \in \bigcap_{i = 1}^{m}$ int $(\operatorname{dom} f_{i})$ . In view of Theorem 3.1.15, at this point, subdifferentials of all functions $f_{i}$ are bounded.

For the sake of notation, assume that $I(x) = \{1, \ldots, k\}$ . Then for any $p \in \mathbb{R}^{n}$ we have

$$
f^{\prime}(x; p) = \operatorname{max}_{1 \leq i \leq k} \f_{i}^{\prime}(x; p) \ = \ \operatorname{max}_{1 \leq i \leq k} \ \operatorname{max} \{\langle g_{i}, p \rangle \mid g_{i} \in \partial f_{i}(x)\}.
$$

## 3.1 General Convex Functions

Note that for any set of values $a_{1}, \ldots, a_{k}$ we have

$$
\operatorname{max}_{1 \leq i \leq k} \a_{i} = \operatorname{max} \left\{\sum_{i = 1}^{k} \lambda_{i} a_{i} \mid \{\lambda_{i}\} \in \varDelta_{k} \right\},
$$

where $\varDelta_{k} = \{\lambda_{i} \geq 0, \sum_{i = 1}^{k} \lambda_{i} = 1\}$ is the standard k-dimensional simplex. Therefore,

$$
\begin{array}{l}{f^{\prime}(x; p) = \displaystyle \operatorname{max}_{\{k\} \in \Delta} \displaystyle \{\sum_{i = 1}^{k} \lambda_{i} \operatorname{max} \{\langle g_{i}, p \rangle | g_{i} \in \partial f_{i}(x)\}\}} \\{\displaystyle = \operatorname{max} \{\langle \sum_{i = 1}^{k} \lambda_{i} g_{i}, p \rangle | g_{i} \in \partial f_{i}(x), \{\hat{\lambda}_{i}\} \in \Delta_{k}\}} \\{\displaystyle = \operatorname{max} \{\langle g, p \rangle | g = \sum_{i = 1}^{k} \lambda_{i} g_{i}, g_{i} \in \partial f_{i}(x), \{\hat{\lambda}_{i}\} \in \varDelta_{k}\}} \\{\displaystyle = \operatorname{max} \{\langle g, p \rangle | g \in \operatorname{Cov} \{\partial f_{i}(x), i \in I(x)\}\}.} \end{array}
$$

The last rule can be useful for computing some elements from subdifferentials.

Lemma 3.1.14 Let Δ be an arbitrary set, and $f(x) = \operatorname{sup} \{\phi(x, y) \mid \operatorname{y} \in \varDelta\}$ Suppose that for any $y \in \varDelta$ the function $\phi(\cdot, y)$ is closed and convex on some convex set Q. Then f is closed convex on the set

$$
\hat{Q} = \left\{x \in Q \mid \operatorname{sup}_{y \in \Delta} \phi(x, y) < + \infty \right\}.
$$

Moreover, for any $x \in{\hat{Q}}$ we have

$$
\partial_{\hat{Q}} f(x) \supseteq \operatorname{Conv} \{\partial_{Q, x} \phi(x, y) \mid y \in I(x)\},
$$

where $I(x) = \{y \in \Delta \mid \phi(x, y) = f(x)\}$

Proof In view of Theorem 3.1.8, we have to prove only the inclusion. Indeed, for any $x \in{\hat{Q}}, y_{0} \in I(x_{0})$ , and $g_{0} \in \partial_{Q, x} \phi(x_{0}, y_{0})$ , we have

$$
f(x) \geq \phi(x, y_{0}) \geq \phi(x_{0}, y_{0}) + \langle g_{0}, x - x_{0} \rangle = f(x_{0}) + \langle g_{0}, x - x_{0} \rangle.
$$

Now we can look at some examples of subdifferentials.

## Example 3.1.5

1. Let $f(x) =(x)_{+}, x \in \mathbb{R}$ . Then $\partial f(0) =[0, 1]$ since $f(x) = \operatorname{max}_{g \in[0, 1]} gx$

2. Consider the function $f(x) = \sum_{i = 1}^{m} \mid \langle a_{i}, x \rangle \mid$ . Define

$$
I_{-}(x) = \{i : \langle a_{i}, x \rangle < 0\},
$$

$$
I_{+}(x) = \{i : \langle a_{i}, x \rangle > 0\},
$$

$$
I_{0}(x) = \{i : \langle a_{i}, x \rangle = 0\}.
$$

Then $\partial f(x) = \sum_{i \in I_{+}(x)} a_{i} - \sum_{i \in I_{-}(x)} a_{i} + \sum_{i \in I_{0}(x)}[- a_{i}, a_{i}].$

3. Consider the function $f(x) = \operatorname{max}_{1 \leq i \leq n} x^{(i)}$ . Define $I(x) = \{i : x^{(i)} = f(x)\}$ Then

$$
\partial f(x) = \mathrm{Conv} \{e_{i} \mid i \in I(x)\}.
$$

For $x = 0$ , we have $\partial f(0) = \mathrm{Conv} \{e_{i} \mid 1 \leq i \leq n\} \equiv \varDelta_{n}$

4. For the Euclidean norm $f(x) = \parallel{\boldsymbol{x}} \parallel$ , we have

$$
\partial f(0) = B_{2}(0, 1) = \{x \in \mathbb{R}^{n} \mid \| x \| \leq 1\},
$$

$$
\partial f(x) = \{x / \mid \mid x \mid \mid\}, \x \neq 0.
$$

5. For the $\ell_{1}{\mathrm{- norm}}$ $f(x) = \parallel x \parallel_{1} = \sum_{i = 1}^{n} \mid x^{(i)}$ , we have

$$
\partial f(0) = B_{\infty}(0, 1) = \{x \in \mathbb{R}^{n} \ | \ \operatorname{max}_{1 \leq i \leq n} \ | \x^{(i)} \ | \leq 1\},
$$

$$
\partial f(x) = \sum_{i \in I_{+}(x)} e_{i} - \sum_{i \in I_{-}(x)} e_{i} + \sum_{i \in I_{0}(x)}[- e_{i}, e_{i}], \x \neq 0,
$$

where $I_{+}(x) = \{i \mid x^{(i)} > 0\}, I_{-}(x) = \{i \mid x^{(i)} < 0\}$ and $I_{0}(x) = \{i ~ \mid ~ x^{(i)} =$ 0 .

6. In the case of the Minkowski function, we need to introduce a polar of the set $Q \mathrm{{:}}$

$$
{\mathcal{P}}_{Q} = \{g \in \mathbb{R}^{n} : \langle g, x \rangle \leq 1 \forall x \in Q\}.\tag{3.1.37}
$$

## 3.1 General Convex Functions

Then

$$
\partial \psi_{Q}(0) = \mathcal{P}_{Q}, \quad \partial \psi_{Q}(x) = \arg \operatorname{max}_{g \in \mathcal{P}_{Q}} \langle g, x \rangle.
$$

We leave the justification of these examples as an exercise for the reader.

Finally, let us describe subgradients of homogeneous functions.

Definition 3.1.7 A function f is called (positively) homogeneous of degree $p \geq 0$ if dom $f$ is a cone and

$$
f(\tau x) = \tau^{p} f(x) \quad \forall x \in \operatorname{dom} f, \forall \tau \geq 0.\tag{3.1.38}
$$

Note that all functions in Example 3.1.5 are homogeneous of degree one.

Theorem 3.1.21 (Euler’s Homogeneous Function Theorem) Let the function f be convex and subdifferentiable on its domain. If it is homogeneous of degree $p \geq 1$ then

$$
\langle g, x \rangle = pf(x) \quad \forall x \in \operatorname{dom} f, \forall g \in \partial f(x).\tag{3.1.39}
$$

Proof Indeed, let $x \in \operatorname{dom} f$ and $g \in \partial f(x)$ . Then for any $\tau \geq 0$ we have

$$
\tau^{p} f(x) \stackrel{(3.1.38)}{=} f(\tau x) \stackrel{(3.1.23)}{\geq} f(x) +(\tau - 1) \langle g, x \rangle.
$$

For $\tau > 1$ , this implies that $\textstyle{\frac{\tau^{p} - 1}{\tau - 1}} f(x) \geq \langle g, x \rangle$ . Therefore, taking the limit as $\tau \downarrow 1$ we get $pf(x) \geq \langle g, x \rangle$

For $\tau < 1$ , the above inequality implies $\textstyle{\frac{1 - \tau^{p}}{1 - \tau}} f(x) \leq \langle g, x \rangle$ . Hence, taking the limit as $\tau \uparrow 1$ , we get $pf(x) \leq \langle g, x \rangle$ .

In Convex Analysis, the most important homogeneous functions have degree of homogeneity one. For such functions,

$$
\langle g, x \rangle \overset{(3.1.39)}{=} f(x) \quad \forall x \in \operatorname{dom} f, \forall g \in \partial f(x).\tag{3.1.40}
$$

From now on, let us assume that dom $f = \mathbb{R}^{n}$ . Then, for all $x \in \mathbb{R}^{n}$ we have

$$
f(x) = f^{\prime}(0, x) \stackrel{\scriptscriptstyle(3.1.28)}{=} \operatorname{max}_{g} \{\langle g, x \rangle : g \in \partial f(0)\}.\tag{3.1.41}
$$

The simplest example of the homogeneous function is a linear function $f(x) =$ $\langle a, x \rangle$ . A more important case is a general norm. For $f(x) = \| x \|$ , we have

$$
\| x \| = \operatorname{max}_{g} \{\langle g, x \rangle : \| g \|_{*} \leq 1\},
$$

where $\| g \|_{*} = \operatorname{max}_{x} \{\langle g, x \rangle : \ \| x \| \leq 1\}$ is the dual norm. Thus,

$$
\partial \| x \|_{\L_{x = 0}} = \{g \in \mathbb{R}^{n} : \| g \|_{*} \leq 1\}.\tag{3.1.42}
$$

Lemma 3.1.15 Let a function f be convex and homogeneous of degree one with dom $f = \mathbb{R}^{n}$ . Then for all $x \in \mathbb{R}^{n}$ , we have

$$
\partial f(x) = \{g \in \partial f(0) : \langle g, x \rangle = f(x)\}.\tag{3.1.43}
$$

Proof Denote the right-hand side of equality (3.1.43) by $G(x)$ . If $g \in \partial f(x)$ , then for any $y \in \mathbb{R}^{m}$ we have

$$
f(y) \stackrel{(3.1.23)}{\geq} f(x) + \langle g, y - x \rangle \stackrel{(3.1.40)}{=} \langle g, y \rangle.
$$

Thus, $g \in \partial f(0)$ . Consequently, $g \stackrel{(3.1.40)}{\in} G(x)$ . On the other hand, if $g \in G(x)$ then for any $y \in \mathbb{R}^{n}$ we have

$$
f(y) \stackrel{(3.1.23)}{\geq} \langle g, y \rangle = f(x) + \langle g, y - x \rangle.
$$

Therefore, $g \in \partial f(x)$ .

Thus, in view of equality (3.1.41), $\partial f(x)$ is a facet of $\partial f(0)$

Let us give an example of application for the machinery developed so far.

Theorem 3.1.22 Let $Q_{1}$ and $Q_{2}$ be bounded closed convex sets with intersection $Q = Q_{1} \bigcap Q_{2}$ , which has nonempty interior. Then

$$
\xi_{Q}(x) = \operatorname{min}_{y \in \mathbb{R}^{n}} \left\{\xi_{Q_{1}}(x + y) + \xi_{Q_{2}}(- y) \right\}, \quad x \in \mathbb{R}^{n}.\tag{3.1.44}
$$

Proof Let us first prove that the optimization problem in (3.1.44) is solvable. If $g \in{\mathcal{Q}}_{1} \bigcap Q_{2}$ , then for any $\boldsymbol{y} \in \mathbb{R}^{n}$ we have

$$
\phi_{x}(y) \stackrel{\mathrm{def}}{=} \xi_{Q_{1}}(x + y) + \xi_{Q_{2}}(- y) \geq \langle g, x + y \rangle + \langle g, - y \rangle = \langle g, x \rangle.
$$

Thus the objective function in (3.1.44) is bounded below and for its infimum $\phi_{x}^{*}$ we have $\phi_{x}^{*} \ge \xi_{Q}(x)$ . Consider a sequence $\{y_{k}\}$ such that $\phi_{x}(y_{k}) \to \phi_{x}^{*}$ . If this sequence is bounded, then the infimum is attained. If not, then we can have $t_{k} \stackrel{\mathrm{def}}{=} \| y_{k} \| \infty$ Let $\begin{array}{r}{\bar{y}_{k} = \frac{1}{t_{k}} y_{k}} \end{array}$ . Then

$$
\operatorname{lim}_{k \infty} \phi_{x}(\bar{y}_{k}) = \operatorname{lim}_{k \infty}[\xi_{Q_{1}}(\textstyle{\frac{1}{t_{k}}} x + \bar{y}_{k}) + \xi_{Q_{2}}(- \bar{y}_{k})] = \operatorname{lim}_{k \infty} \frac{1}{t_{k}} \phi_{x}(y_{k}) = 0.
$$

Since the sequence $\{\bar{y}_{k}\}$ is bounded, we can assume that it is convergent to a point $\bar{y}$ with $\|{\bar{y}} \| = 1$ and $\phi_{x}({\bar{y}}) = 0$ . In this case, we have

$$
\langle g_{1}, \bar{y} \rangle \le \xi_{Q_{1}}(\bar{y}) \ \le \ - \xi_{Q_{2}}(- \bar{y}) \ = \ \langle g_{2}, \bar{y} \rangle, \quad \forall g_{1} \in Q_{1}, \ \forall g_{2} \in Q_{2}.
$$

Hence, $\langle g,{\bar{y}} \rangle = 0$ for all $g \in{\cal Q}$ , and we get a contradiction with the assumptions.

Denote by $y^{*}$ the solution of the optimization problem in (3.1.44). In view of Theorem 3.1.20, we have

$$
0 \in \partial \phi_{x}(y^{*}) \stackrel{(3.1.35)}{=} \partial \xi_{Q_{1}}(x + y^{*}) + \partial \xi_{- Q_{2}}(y^{*}).
$$

In view of Lemma 3.1.15 this means that there exists a vector g such that

$$
g \in Q_{1}, \quad \langle g, x + y^{*} \rangle = \xi_{Q_{1}}(x + y^{*}),
$$

$$
- g \in - Q_{2}, \langle - g, y^{\ast} \rangle = \xi_{- Q_{2}}(y^{\ast}).
$$

Thus, $\phi_{x}^{*} = \xi_{Q_{1}}(x + y^{*}) + \xi_{Q_{2}}(- y^{*}) = \xi_{Q_{1}}(x + y^{*}) + \xi_{- Q_{2}}(y^{*}) = \langle g, x \rangle$ . Since $g \in{\cal Q}$ , we conclude that $\phi_{x}^{*} \leq \xi_{Q}(x)$ .

Finally, let us describe subgradients of superpositions of convex functions and differentiable convex functions.

Lemma 3.1.16 Consider $\psi(g) = \operatorname{max}_{\lambda \in \varLambda} \langle \lambda, g \rangle$ , where $\boldsymbol{\mathscr{\Lambda}} \subset \mathbb{R}_{+}^{m}$ is a bounded convex set. Let the vector function $F(x) =(f_{1}(x), \ldots, f_{m}(x)), x \in \mathbb{R}^{n}$ , have differentiable convex components. Then the superposition $f(x) = \psi(F(x))$ is convex and

$$
\partial f(x) = \left\{\sum_{i = 1}^{m} \lambda^{(i)} \nabla f_{i}(x) : \lambda \in Arg \operatorname{max}_{\lambda \in \Lambda} \langle \lambda, F(x) \rangle \right\}.\tag{3.1.45}
$$

Proof Indeed the function $\psi(\cdot)$ is monotone: if $g_{1} ~ \le ~ g_{2}$ in the component-wise sense, then $\psi(g_{1}) \leq \psi(g_{2})$ . Therefore, for any x, y from $\mathbb{R}^{n}$ and $\alpha \in[0, 1]$ we have

$$
f(\alpha x +(1 - \alpha) y) \leq \psi(\alpha F(x) +(1 - \alpha) F(y)) \leq \alpha f(x) +(1 - \alpha) f(y).
$$

Relation (3.1.45) follows from the representation of directional derivatives. Define $F^{\prime}(x) =(\nabla f_{1}(x), \ldots, \nabla f_{m}(x)) \in \mathbb{R}^{n \times m}$ . Then for any direction $\textit{h} \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rlr}{f^{\prime}(x; h)} &{{} =} &{\psi^{\prime}(F(x);(F^{\prime}(x))^{T} h)} \end{array}
$$

$$
\stackrel{(3.\underline{{{1}}}.43)}{=} \operatorname{max} \{\langle \lambda,(F^{\prime}(x))^{T} h \rangle : \lambda \in \operatorname{Argmax} \langle \lambda, F(x) \rangle\}.
$$

Lemma 3.1.17 Let F be a differentiable convex and monotone function on $\mathbb{R}^{m}$ and suppose the functions $f_{i}$ are convex on a convex open set $Q.$ Then the function

$$
\phi(x) = F(f_{1}(x), \ldots, f_{m}(x))
$$

is convex on $Q$ and

$$
\partial \phi(x) = \sum_{i = 1}^{m} \nabla_{i} F(f(x)) \cdot \partial f_{i}(x), \quad x \in \mathcal{Q},\tag{3.1.46}
$$

where $f(x) =(f_{1}(x), \ldots, f_{m}(x))^{T} \in \mathbb{R}^{m}$

Proof Indeed, for x, $y \in Q$ and $\alpha \in[0, 1]$ we have

$$
\phi(\alpha x +(1 - \alpha) y) \leq F(\alpha f(x) +(1 - \alpha) f(y)) \leq \alpha \phi(x) +(1 - \alpha) \phi(y).
$$

Further, for any direction $p \in \mathbb{R}^{n}$

$$
\phi^{\prime}(x; p) = \sum_{i = 1}^{m} \nabla_{i} F(f(x)) f_{i}^{\prime}(x; p) \stackrel{(3.1.28)}{=} \sum_{i = 1}^{m} \nabla_{i} F(f(x)) \xi_{\partial f_{i}(x)}(p).
$$

It remains to use Corollary 3.1.5.

Corollary 3.1.7 If all $f_{i}, i = 1, \ldots, m$ , are convex, then the function

$$
\phi(x) = \ln{\left(\sum_{i = 1}^{m} e^{f_{i}(x)} \right)}\tag{3.1.47}
$$

is also convex.

Proof Indeed, we have seen in Example 2.1.1(4) that the function

$$
F(s) = \ln \left(\sum_{i = 1}^{n} e^{s} \right)
$$

is convex and monotone on $\mathbb{R}^{n}$ .

## 3.1.7 Optimality Conditions

Let us apply the developed technique to derive different optimality conditions. We start with a simple minimization problem, where the objective function has a composite form:

$$
\operatorname{min}_{x \in Q} \left\{\tilde{f}(x) \stackrel{\mathrm{def}}{=} f(x) + \varPsi(x) \right\},\tag{3.1.48}
$$

where $Q$ is a closed convex set, $f \in C^{1}(Q)$ is a continuously differentiable convex function and $\psi$ is a closed convex function defined on the set $Q$

Theorem 3.1.23 A point $x^{*}$ is a solution to problem (3.1.48) if and only if for every $x \in Q$ we have

$$
\langle \nabla f(x^{*}), x - x^{*} \rangle + \psi(x) \geq \psi(x^{*}).\tag{3.1.49}
$$

Proof Indeed, if condition (3.1.49) is satisfied, then

$$
\begin{array}{rcl}{{\tilde{f}(x)}} &{{=}} &{{f(x) + \psi(x) \stackrel{\scriptscriptstyle(2.1.2)}{\geq} f(x^{*}) + \langle \nabla f(x^{*}), x - x^{*} \rangle + \psi(x)}} \\{{}} &{{}} &{{}} \\{{}} &{{\stackrel{\scriptscriptstyle(3.1.49)}{\geq} f(x^{*}) + \psi(x^{*}) = \tilde{f}(x^{*}).}} \end{array}
$$

Assume now that $x^{*}$ is an optimal solution of the minimization problem (3.1.48). Suppose that there exists an $x \in Q$ such that

$$
\left.\nabla f(x^{*}), x - x^{*} \right.+ \psi(x) < \psi(x^{*}).
$$

Note that $\operatorname{lim}_{\alpha \downarrow 0}{\frac{1}{\alpha}}[f(\alpha x +(1 - \alpha) x^{*}) - f(x^{*})] = \langle \nabla f(x^{*}), x - x^{*} \rangle$ . Thus, for a positive α small enough we have

$$
\begin{array}{rcl}{f(\alpha x +(1 - \alpha) x^{*})} &{<} &{f(x^{*}) + \alpha[\varPsi(x^{*}) - \varPsi(x)]} \\ & &{} & \\ & &{=} &{\tilde{f}(x^{*}) + \alpha[\varPsi(x^{*}) - \varPsi(x)] - \varPsi(x^{*})} \\ & &{} & \\ & &{\stackrel{(3.1.2)}{\leq} \tilde{f}(x^{*}) - \varPsi(\alpha x +(1 - \alpha) x^{*}).} \end{array}
$$

Hence, $\tilde{f}(\alpha x +(1 - \alpha) x^{*}) < \tilde{f}(x^{*})$ and we get a contradiction.

In view of Definition 3.1.5, condition (3.1.49) is equivalent to the inclusion

$$
- \nabla f(x^{*}) \in \partial_{Q} \varPsi(x^{*}).
$$

Let us now look at optimization problems with general objective functions. Consider the problem

$$
\operatorname{min}_{x \in Q} f(x),\tag{3.1.50}
$$

where $Q \subseteq \mathbb{R}^{n}$ is a closed convex set and $f$ is a closed convex function, dom $f \supset$ $Q.$ For a point ${\bar{x}} \in Q$ , define the normal cone:

$$
\mathcal{N}(\bar{x}) = \{g \in \mathbb{R}^{n} | \langle g, x - \bar{x} \rangle \geq 0, \forall x \in Q\}.\tag{3.1.51}
$$

Since inclusion $g \in{\mathcal{N}}({\bar{x}})$ implies $\tau g \in \mathcal{N}(\bar{x})$ for any $\tau \geq 0$ , this is indeed a cone. It is closed and convex as an intersection of closed convex sets, the half-spaces

$$
\{g : \ \langle g, x -{\bar{x}} \rangle \geq 0\}, \quad x \in Q.
$$

Clearly, $\mathcal{N}(\bar{x}) = \{0_{n}\}$ for all $\bar{x} \in \mathrm{int} Q$ . Thus, this cone is nontrivial only at the boundary points $\bar{x} \in \partial Q$

For ${\bar{x}} \in Q$ , define the tangent cone

$$
\mathcal{T}(\bar{x}) = \{p \in \mathbb{R}^{n} | \langle g, p \rangle \geq 0, \forall g \in \mathcal{N}(\bar{x})\}.\tag{3.1.52}
$$

Thus, this is a standard dual cone to $\mathcal{N}(\bar{x})$ . Again, this cone is closed and convex as the intersection of the system of half-spaces. Clearly, for $\bar{x} \in$ int $Q$ we have $\mathcal{T}(\bar{x}) = \mathbb{R}^{n}$

The name of the cone $\mathcal{T}(\cdot)$ is justified by the following property.

Lemma 3.1.18 $Let \bar{x} \in \partial Q$ . Then $Q -{\bar{x}} \subset{\mathcal{T}}({\bar{x}})$ . Moreover,

$$
\mathcal{T}(\bar{x}) = \mathrm{cl} \left(\mathcal{H}(Q - \bar{x}) \right).\tag{3.1.53}
$$

Thus, $\mathcal{T}(\bar{x})$ is the closure of the conic hull of the set $Q -{\bar{x}}.$

Proof Indeed, in view of the definition of normal cone (3.1.51), we have

$$
\langle g, x - \bar{x} \rangle \geq 0, \quad \forall x \in \mathcal{Q}, \g \in \mathcal{N}(\bar{x}).
$$

Therefore, $Q - \bar{x} \overset{(3.1.52)}{\subset} \mathcal{T}(\bar{x})$ . Since $\mathcal{T}(\bar{x})$ is a closed cone, this means that

$$
\bar{\mathcal{H}} \overset{\mathrm{def}}{=} \mathrm{cl}(\mathcal{H}(\bar{x})) \subseteq \mathcal{T}(\bar{x}).
$$

Let us assume that there exists a point $\bar{p} \in \mathcal{T}(\bar{x})$ such that $\bar{p} \notin \bar{\mathcal{K}}$ . Then, by Corollary 3.1.4, there exists a direction $\bar{g}$ which strongly separates $\bar{p}$ from $\bar{\mathcal{H}}$ :

$$
\langle \bar{g}, \bar{p} \rangle < \gamma \leq \langle \bar{g}, \alpha(x - \bar{x}) \rangle, \forall x \in Q, \alpha \geq 0.
$$

Letting $\alpha + \infty$ in this inequality, we get $\langle{\bar{g}}, x -{\bar{x}} \rangle \geq 0$ for all $x \in Q$ . Thus,   
direction $\bar{g}$ belongs to the cone $\mathcal{N}(\bar{x})$ . On the other hand, taking $\alpha = 0$ , we get (3.1.52)   
$\gamma ~ \leq ~ 0$ . Thus, $\langle \bar{g}, \bar{p} \rangle ~ < ~ 0$ . This means that $\bar{p} \notin \mathcal{T}(\bar{x})$ . Hence, we get a   
contradiction.

Remark 3.1.2 For the special case $Q = \{x \in \mathbb{R}^{n} : ~ Ax = b\}$ , where A is an $(m \times n)$ matrix, standard arguments from Linear Algebra prove the following representation:

$$
{\mathcal{N}}({\bar{x}}) = \{g \in \mathbb{R}^{n} : ~ g = A^{T} y, ~ y \in \mathbb{R}^{m}\},\tag{3.1.54}
$$

$$
{\mathcal{T}}({\bar{x}}) = \{h \in \mathbb{R}^{n} : Ah = 0\},
$$

which is valid for all ${\bar{x}} \in Q$

The next statement gives us an optimality condition for a linearized version of problem (3.1.50).

Lemma 3.1.19 $Letx^{*}$ be an optimal solution to problem (3.1.50). Then

$$
f^{\prime}(x^{*}; p) \geq 0 \quad \forall p \in{\mathcal{T}}(x^{*}).\tag{3.1.55}
$$

Proof Assume that there exists a point $\bar{p} \in \mathcal{T}(x^{*})$ such that $f^{\prime}(x^{*},{\bar{p}}) < 0$ . In view of Lemma 3.1.18, there exist two sequences $\{\alpha_{k}\} \subset \mathbb{R}_{+}$ and $\{x_{k}\} \subset Q$ such that

$$
\bar{p} = \operatorname{lim}_{k \to \infty} \alpha_{k}(x_{k} - x^{*}).
$$

Since the function $f^{\prime}(x^{\ast}; \cdot)$ is continuous, in view of Lemma 3.1.5, we have

$$
\begin{array}{l}{0 > f^{\prime}(x^{*}; \bar{p}) \ = \ \underset{k \to \infty}{\operatorname{lim}} \alpha_{k} f^{\prime}(x^{*}; x_{k} - x^{*})} \\{\} \\{= \underset{k \to \infty}{\operatorname{lim}} \underset{\beta \downarrow 0}{\operatorname{lim}} \frac{\alpha_{k}}{\beta}[f(x^{*} + \beta(x_{k} - x^{*})) - f(x^{*})] \ \geq \0.} \end{array}
$$

Thus, we come to a contradiction.

Now we can justify an optimality condition for problem (3.1.50). Define

$$
X^{*} = \operatorname{Argmin}_{x \in Q} f(x).
$$

Theorem 3.1.24 A point $x^{*}$ from $Q$ belongs to $X^{*}$ if and only if there exists a $g^{*} \in \partial f(x^{*})$ such that

$$
\langle g^{*}, x - x^{*} \rangle \geq 0 \quad \forall x \in Q.\tag{3.1.56}
$$

In this case, $g^{*} \in \widehat{\partial f}(X^{*}) \bigcap \widehat{\mathcal{N}}(X^{*})$ (see Definition 3.1.6).

Proof Indeed, from the condition (3.1.56) and definition of $\partial f(x^{*})$ , we have

$$
f(x) \stackrel{(3.1.23)}{\geq} f(x^{*}) + \langle g^{*}, x - x^{*} \rangle \stackrel{(3.1.56)}{\geq} f(x^{*}) \quad \forall x \in{\cal Q}.
$$

Thus, $x^{*} \in X^{*}$

Let us prove the converse statement. Let $x^{*} \in X^{*}$ be an optimal solution of problem (3.1.50). Assume that there is no $g \in \partial f(x^{*})$ such that

$$
\langle g, x - x^{*} \rangle \geq 0 \quad \forall x \in Q.
$$

In view of definition (3.1.51), this means that $\partial f(x^{*}) \bigcap{\mathcal{N}}(x^{*}) = \varnothing$ . Consider the following auxiliary optimization problem:

$$
\operatorname{min}_{g_{1}, g_{2}} \left\{\phi(g_{1}, g_{2}) = \textstyle{\frac{1}{2}} \| g_{1} - g_{2} \|^{2} : \g_{1} \in \partial f(x^{*}), \g_{2} \in{\mathcal{N}}(x^{*}) \right\},
$$

where the norm is standard Euclidean. Since the set $\partial f(x^{*})$ is bounded, there exists its optimal solution $(g_{1}^{*}, g_{2}^{*})$ and the optimal value $\rho^{*} \stackrel{\mathrm{def}}{=} \phi(g_{1}^{*}, g_{2}^{*})$ is positive. Let us write down optimality conditions for this auxiliary problem. By Theorem 2.2.9, we obtain

$$
\langle \nabla_{g_{1}} \phi(g_{1}^{*}, g_{2}^{*}), g_{1} - g_{1}^{*} \rangle = \langle g_{1}^{*} - g_{2}^{*}, g_{1} - g_{1}^{*} \rangle \ \ge \0 \quad \forall g_{1} \in \partial f(x^{*}),\tag{3.1.57}
$$

$$
\langle \nabla_{g_{2}} \phi(g_{1}^{*}, g_{2}^{*}), g_{2} - g_{2}^{*} \rangle = \langle g_{2}^{*} - g_{1}^{*}, g_{2} - g_{2}^{*} \rangle \ \ge \0 \quad \forall g_{2} \in \mathcal{N}(x^{*}).\tag{3.1.58}
$$

Taking in (3.1.58) $g_{2} = 0$ and $g_{2} = \alpha g_{2}^{*}$ as $\alpha + \infty$ , we get

$$
\langle g_{2}^{*} - g_{1}^{*}, g_{2}^{*} \rangle \leq 0 \ \leq \ \langle g_{2}^{*} - g_{1}^{*}, g_{2}^{*} \rangle.
$$

Thus, for $p^{*} \stackrel{\mathrm{def}}{=} g_{2}^{*} - g_{1}^{*}$ we have $\langle g_{2}^{*}, p^{*} \rangle = 0$ . Therefore,

$$
\langle g_{2}, p^{*} \rangle \stackrel{(3.1.58)}{\geq} 0 \quad \forall g_{2} \in \mathcal{N}(x^{*}),
$$

which means $p^{*} \stackrel{(3.1.52)}{\in} \mathcal{T}(x^{*})$ . On the other hand, for all $g_{1} \in \partial f(x^{*})$ we have

$$
\langle g_{1}, p^{*} \rangle \stackrel{(3.1.57)}{\leq} \langle g_{1}^{*}, p^{*} \rangle = \langle g_{1}^{*} - g_{2}^{*}, p^{*} \rangle = - 2 \rho^{*}.
$$

This means that $f^{\prime}(x^{*}; p^{*}) \stackrel{(3.1.28)}{=} - 2 \rho^{*} < 0$ . Thus, we get a contradiction with Lemma 3.1.19 and prove the existence of a vector $g^{*} \in \partial f(x^{*})$ such that

$$
\langle g^{*}, x - x^{*} \rangle \geq 0 \quad \forall x \in Q.
$$

Note that for any other point $x_{1}^{*} \in X^{*}$ we have

$$
f(x^{*}) = f(x_{1}^{*}) \stackrel{(3.1.23)}{\geq} f(x^{*}) + \langle g^{*}, x_{1}^{*} - x^{*} \rangle \geq f(x^{*}).
$$

Hence, $\langle g^{*}, x_{1}^{*} - x^{*} \rangle = 0$ and we conclude that $g^{*} \in \partial f(x_{1}^{*})$ . Consequently, $g^{\ast} \in$ $\widehat{\partial f}(X_{*})$ . For the same reason, $g^{*}$ belongs both to $\mathcal{N}(x^{*})$ and $\mathcal{N}(x_{1}^{*})$ . □

Remark 3.1.3 For $x^{*} \in$ int $Q$ , condition (3.1.56) is equivalent to the inclusion of Theorem 3.1.20.

Remark 3.1.4 In the special case $Q = \{x \in \mathbb{R}^{n} : ~ Ax = b\}$ , where A is an $(m \times n) \cdot$ matrix, in view of representation (3.1.54), the statement of Theorem 3.1.24 can be specified in the following way:

A point $x^{*}$ belongs to $X^{*}$ if and only if there exists a

$g^{*} \in \partial f(x^{*})$ such that $g^{*} = A^{T} y^{*}$ for some $y^{*} \in \mathbb{R}^{m}$

(3.1.59)

(Compare with the statement of Corollary 1.2.1.)

Theorem 3.1.24 is one of the most powerful tools of Convex Analysis. Let us demonstrate this with several important examples.

First of all, consider the differentiation rules for a partial minimum of a convex function (3.1.9).

Theorem 3.1.25 Let φ be a closed convex function, and $Q_{1} \subseteq \mathbb{R}^{n}$ and $Q_{2} \subseteq \mathbb{R}^{m}$ be two closed convex sets such that $Q_{1} \times Q_{2} \subseteq$ dom $\phi.$ . Define

$$
f(x) = \operatorname{inf}_{y \in Q_{2}} \phi(x, y).
$$

Then f is convex on $Q_{1}$ . Moreover, $ifY(x) \stackrel{\mathrm{def}}{=} \mathrm{Arg} \operatorname{min}_{y \in Q_{2}} \phi(x, y) \neq \varnothing,$ , then

$$
\partial_{Q_{1}} f(x) \ \supseteq \ \{g_{x} \in \mathbb{R}^{n} : \exists g_{y}{\mathrm{~ such ~ that ~}}(g_{x}, g_{y}) \in \bigcap_{y \in Y(x)} \partial \phi(x, y),
$$

$$
\mathrm{and} \langle g_{y}, y - y_{x} \rangle \geq 0 \forall y \in Q_{2}, \forall y_{x} \in Y(x)\}.\tag{3.1.60}
$$

Proof The convexity of the function $f$ was already proved in Theorem 3.1.7. Let us fix a point $x \in Q_{1}$ with $Y(x) \neq \emptyset$ . In view of Theorem 3.1.24, the right-hand side of inclusion (3.1.60) is not empty. Consider an arbitrary element $(g_{x}, g_{y})$ from this set. Let $x_{1} \in Q_{1}$ and $\epsilon > 0$ . Choosing a point $y_{1} \in Q_{2}$ such that $\phi(x_{1}, y_{1}) \leq f(x_{1}) + \epsilon$ we get

$$
\begin{array}{rl} &{f(x_{1}) + \epsilon \geq \phi(x_{1}, y_{1}) \geq \phi(x, y_{x}) + \langle g_{x}, x_{1} - x \rangle + \langle g_{y}, y_{1} - y_{x} \rangle} \\ &{} \\ &{\qquad \geq \phi(x, y_{x}) + \langle g_{x}, x_{1} - x \rangle = f(x) + \langle g_{x}, x_{1} - x \rangle.} \end{array}
$$

Since we can choose $\epsilon$ arbitrarily small, inclusion $g_{x} \in \partial_{Q_{1}} f(x)$ is proved.


<!-- MinerU source pages 201-400 -->

Corollary 3.1.8 $IfY(x) \neq \emptyset$ for all $x \in$ dom $f,$ then f is a closed convex function on $Q_{1}$

Proof By inclusion $(3.1.60), \partial f(x) \neq \varnothing$ . Therefore, we can apply Lemma 3.1.6. □

Note that separability of the constraints $x \in Q_{1}$ and $y \in Q_{2}$ is essential for the validity of the rule (3.1.60). Simple examples show that in the general situation of Theorem 3.1.7, the set $\partial f(x)$ can be dependent also on the partial subgradients of function $\phi$ in $y.$ . Such a general case can be treated by Theorem 3.1.28.

Let us look now at optimality conditions for smooth minimization problem with functional constraints:

$$
\operatorname{min}_{x \in Q} \{f_{0}(x) | \f_{i}(x) \leq 0, i = 1, \ldots, m\},\tag{3.1.61}
$$

where $Q$ is a closed convex set.

Theorem 3.1.26 (Karush–Kuhn–Tucker) Let functions $f_{i}, \i \ = \0 \dots m$ , be convex and differentiable with int (dom $f_{i}) \supset Q$ . Suppose that there exists a point ${\bar{x}} \in Q$ such that

$$
f_{i}(\bar{x}) < 0, \quad i = 1, \dots, m.\quad \mathrm{(Slater ~ condition ~ for ~ inequalities)}\tag{3.1.62}
$$

A point $x^{*}$ is an optimal solution of problem (3.1.61) if and only if there exist nonnegative values $\lambda_{i}^{*}, i = 1 \ldots m_{}$ , satisfying the following conditions:

$$
\langle \nabla f_{0}(x^{*}) + \sum_{i = 1}^{m} \lambda_{i}^{*} \nabla f_{i}(x^{*}), x - x^{*} \rangle \ge 0, \quad \forall x \in{\cal Q},\tag{3.1.63}
$$

$$
\lambda_{i}^{*} f_{i}(x^{*}) = 0, \quad i = 1, \ldots, m.
$$

Proof In view of Lemma $2.3.4, x^{*}$ is an optimal solution to problem (3.1.61) if and only if it is a global minimizer of the function

$$
\phi(x) = \operatorname{max} \{f_{0}(x) - f^{*}; f_{i}(x), i = 1 \ldots m\}
$$

over the set $Q.$ . In view of Theorem 3.1.24, this is the case if and only if there exists a $g^{*} \in \partial \phi(x^{*})$ such that

$$
\langle g^{*}, x - x^{*} \rangle \geq 0 \quad \forall x \in Q.
$$

Further, in view of Lemma 3.1.13, inclusion $g^{*} ~ \in ~ \partial f(x^{*})$ is equivalent to the existence of nonnegative weights $\bar{\lambda_{i}}, i = 0, \ldots, m$ , such that

$$
\bar{\lambda}_{0} \nabla f_{0}(x^{*}) + \sum_{i \in I^{*}} \bar{\lambda_{i}} \nabla f_{i}(x^{*}) = g^{*},
$$

$$
\bar{\lambda}_{0} + \sum_{i \in I^{*}} \bar{\lambda_{i}} = 1,
$$

where $I^{*} = \{i \in \{1,..., m\} : \f_{i}(x^{*}) = 0\}$

Thus, we need to prove only that $\lambda_{0} > 0$ . Indeed, if $\bar{\lambda}_{0} = 0$ , then

$$
\sum_{i \in I^{*}} \bar{\lambda_{i}} f_{i}(\bar{x}) \geq \sum_{i \in I^{*}} \bar{\lambda_{i}}[f_{i}(x^{*}) + \langle \nabla f_{i}(x^{*}), \bar{x} - x^{*} \rangle] \geq 0.
$$

This contradicts the Slater condition. Therefore $\bar{\lambda}_{0} > 0$ and we can take ${\lambda}_{i}^{*} ={\bar{\lambda}}_{i} /{\bar{\lambda}}_{0}$ for all $i \in I^{*}$ and $\lambda_{i}^{*} = 0$ for $i \notin I^{*}$ □

Theorem 3.1.26 is very useful for solving simple optimization problems.

Lemma 3.1.20 Let $A \succ 0$ . Then

$$
\operatorname{max}_{x} \{\langle c, x \rangle : \langle Ax, x \rangle \leq 1\} = \langle c, A^{- 1} c \rangle^{1 / 2}.\tag{3.1.64}
$$

Proof Note that all conditions of Theorem 3.1.26 are satisfied and the solution $x^{*}$ of the above problem is attained at the boundary of the feasible set. Therefore, in accordance with Theorem 3.1.26, we have to solve the following equations:

$$
c = \lambda^{*} Ax^{*}, \quad \langle Ax^{*}, x^{*} \rangle = 1.
$$

Thus, $\lambda^{*} = \langle c, A^{- 1} c \rangle^{1 / 2}$ and $\begin{array}{r}{x^{*} = \frac{1}{\lambda^{*}} A^{- 1} c.} \end{array}$ □

The values $\lambda_{i}^{*} \geq 0, i = 1,..., m$ , are called optimal dual (Lagrange) multipliers for problem (3.1.61). We can get some upper bounds for these values from the depth of the Slater condition (3.1.62).

Lemma 3.1.21 Any point x, feasible for problem (3.1.61), generates the following upper bound on the magnitude of optimal dual multipliers:

$$
f_{0}(\bar{x}) - f_{0}(x^{*}) \geq \sum_{i = 1}^{m}(- f_{i}(\bar{x})) \lambda_{i}^{*}.\tag{3.1.65}
$$

Proof Indeed,

$$
\begin{array}{rlr}{{f_{0}(\bar{x}) + \sum_{i = 1}^{m} \lambda_{i}^{*} f_{i}(\bar{x})}} \\ &{} & \\{\overset{(2.1.2)}{\geq} \f_{0}(x^{*}) + \langle \nabla f_{0}(x^{*}), \bar{x} - x^{*} \rangle + \sum_{i = 1}^{m} \lambda_{i}^{*}[f_{i}(x^{*}) + \langle \nabla f_{i}(x^{*}), \bar{x} - x^{*} \rangle]} \\ &{} & \\ &{= \quad f_{0}(x^{*}) + \sum_{i = 1}^{m} \lambda_{i}^{*} f_{i}(x^{*}) + \langle \nabla f_{0}(x^{*}) + \sum_{i = 1}^{m} \lambda_{i}^{*} \nabla f_{i}(x^{*}), \bar{x} - x^{*} \rangle} \\ &{} & \\ &{\overset{(3.1.63)}{\geq} \f_{0}(x^{*}).} &{\quad \mathrm{~ f ~}} \end{array}
$$

The statement of Lemma 3.1.21 can be used to construct an exact penalty function for problem (3.1.61). Let the point ${\bar{x}} \in Q$ satisfy Slater condition (3.1.62). Assume that we know some upper bound D for the gap $f_{0}(\bar{x}) - f_{0}(x^{*})$ . For example, it can be found by the following optimization problem:

$$
D = \operatorname{max}_{x \in Q} \langle \nabla f_{0}(\bar{x}), \bar{x} - x \rangle.
$$

Consider the set $\Lambda ~ = ~ \{\lambda ~ \in ~ \mathbb{R}_{+}^{m} ~ : ~ \sum_{i = 1}^{m}(- f_{i}(\bar{x})) \lambda_{i} ~ \leq ~ D\}$ . In view of Lemma 3.1.21, we have $\lambda^{*} \in{\varLambda}$ . Define the following nonsmooth penalty function:

$$
\psi(g) = \operatorname{max}_{\lambda \in \Lambda} \langle \lambda, g \rangle \ = \D \left(\operatorname{max}_{1 \leq i \leq m} \frac{g^{(i)}}{- f_{i}(\bar{x})} \right)_{+}, \quad g \in \mathbb{R}^{m},\tag{3.1.66}
$$

where $(a)_{+} = \operatorname{max} \{0, a\}$

Consider the following minimization problem:

$$
\operatorname{min}_{x \in Q} \left\{\phi(x) \stackrel{\mathrm{def}}{=} f_{0}(x) + \psi(f(x)) \right\},\tag{3.1.67}
$$

where $f(x) =(f_{1}(x), \ldots, f_{m}(x))$ . Let us compute its subdifferential at the point $x^{*}$ , the solution of problem (3.1.61).

Note that $\operatorname{max}_{\lambda \in \Lambda} \langle \lambda, f(x^{*}) \rangle = 0$ . In accordance with the rules of Lemma 3.1.16, we can form the set

$$
\begin{array}{r}{A_{+} = \{\lambda \in A : \langle \lambda, f(x^{*}) \rangle = 0\} \ = \{\lambda \in A : \lambda_{i} = 0, i \notin I^{*}(x)\},} \end{array}
$$

where $I(x^{*}) = \{i : \f_{i}(x^{*}) = 0\}$ . Since $\lambda^{\ast} \in \varLambda_{+}$ , in view of Lemma 3.1.16 we have

$$
g^{*} = \nabla f_{0}(x^{*}) + \sum_{i \in I(x^{*})} \lambda_{i}^{*} \nabla f_{i}(x^{*}) \ \in \partial \phi(x^{*}).
$$

Hence, by Theorem 3.1.26 and Theorem 3.1.24, $x^{*} \in \mathsf{Arg} \operatorname{min}_{x \in \mathcal{Q}} \phi(x)$ . Thus, the optimal values of problems (3.1.67) and (3.1.61) coincide.

Let x be an arbitrary optimal solution to problem (3.1.67). Then, by Theorem 3.1.24 and Lemma 3.1.16, there exists a vector $\hat{\lambda} \in \mathrm{Arg} \operatorname{max}_{\lambda \in \Lambda} \langle \lambda, f(\bar{\hat{x}}) \rangle$ such that

$$
\langle \nabla f_{0}(\hat{x}) + \sum_{i = 1}^{m} \hat{\lambda}_{i} \nabla f_{i}(\hat{x}), x - \hat{x} \rangle \geq 0, \quad \forall x \in{\cal Q}.
$$

Let us assume that $\psi(f({\hat{x}})) > 0$ . Then the inequality constraint in the definition of the set Λ is active and we have $\langle \hat{\lambda}, - f(\bar{x}) \rangle = D$ . However,

$$
\begin{array}{rl} &{D \ge f_{0}(\bar{x}) - f_{0}(\hat{x}) \ge \langle \nabla f_{0}(\hat{x}), \bar{x} - \hat{x} \rangle \ge \displaystyle \sum_{i = 1}^{m} \hat{\lambda}_{i} \langle \nabla f_{i}(\hat{x}), \hat{x} - \bar{x} \rangle} \\ &{} \\{\ge \langle \hat{\lambda}, f(\hat{x}) - f(\bar{x}) \rangle = \psi(f(\hat{x})) + D.} \end{array}
$$

This contradiction proves that $\psi(f({\hat{x}})) = 0$ . Therefore, this point is feasible for problem (3.1.61) and it attains the optimal value of the objective function.

In some situations, the optimization methods based on the exact penalty may look more attractive than the two-level procedure described in Sect. 2.3.5. However, note that for these methods it is necessary to know the point x satisfying the Slater condition (3.1.62). If this condition is not “deep” enough, the resulting penalty function can have bad bounds on the derivatives. This slows down the minimization schemes.

The Slater condition in the form (3.1.62) cannot work for equality constraints. Let us show how it can be modified in order to justify the Karush–Kuhn–Tucker condition for a minimization problem of the following form:

$$
\operatorname{min}_{x \in Q} \{f(x) : Ax = b\},\tag{3.1.68}
$$

where $Q$ is a closed convex set and the matrix $A \in \mathbb{R}^{m \times n}$ has full row rank.

Theorem 3.1.27 Let a function f be convex on $Q \subset$ int (dom $f)$ and its level sets on $Q$ be bounded. Suppose that there exist a point x and $\epsilon > 0$ such that

$$
A \bar{x} = b, \quad B(\bar{x}, \epsilon) \subseteq Q.\quad \mathrm{(Slater ~ condition ~ for ~ equalities)}\tag{3.1.69}
$$

A point $x^{*} \in Q$ is an optimal solution for problem (3.1.68) if and only if $Ax^{*} = b$ and there exist $y^{*} \in \mathbb{R}^{m}$ and $g^{*} \in \partial f(x^{*})$ such that

$$
\langle g^{*} - A^{T} y^{*}, x - x^{*} \rangle \geq 0 \quad \forall x \in Q.\tag{3.1.70}
$$

The magnitude of the vector $y^{*}$ can be estimated as follows:

$$
\begin{array}{r}{\| A^{T} y^{*} \| \leq \frac{1}{\epsilon} \left(\underset{x \in B(\bar{x}, \epsilon)}{\operatorname{max}} f(x) - \underset{x \in Q}{\operatorname{min}} f(x) \right).} \end{array}\tag{3.1.71}
$$

Proof Indeed, if condition (3.1.70) is satisfied, then for any $x \in Q$ with $Ax = b$ we have

$$
f(x) - f(x^{*}) \stackrel{(3.1.23)}{\geq} \langle g^{*}, x - x^{*} \rangle \stackrel{(3.1.70)}{\geq} \langle y^{*}, A(x - x^{*}) \rangle = 0.
$$

To prove the converse statement, consider the function

$$
\phi(x) = f(x) + K \| b - Ax \|,
$$

where the norm is standard Euclidean and $K \ > \0$ is a constant, which will be specified later. In view of our assumptions, $\phi$ attains its minimum on Q at some point $x_{*}$ . Therefore, by Theorem 3.1.24, there exists a vector $g_{\phi}^{*} \in \partial \phi(x_{*})$ such that

$$
\langle g_{\phi}^{\ast}, x - x_{\ast} \rangle \geq 0, \quad \forall x \in Q.\tag{3.1.72}
$$

In view of Lemma 3.1.12, Lemma 3.1.11 and representation (3.1.42), there exist $g^{\ast} \in \partial f(x_{*})$ and $\bar{y} \in \mathbb{R}^{m}$ with $\| \bar{y} \| \leq 1$ such that

$$
g_{\phi}^{*} = g^{*} - KA^{T} \bar{y}.
$$

Moreover, in view of Lemma 3.1.15, $\langle \bar{y}, b - Ax_{*} \rangle = \| b - A \bar{x} \|$

On the other hand, for any $\delta \in B(0, \epsilon)$ , we have $x_{\delta} \{\stackrel{\mathrm{def}}{=}} \{\bar{x}} + \delta \{\stackrel{(3.1.70)}{\in}} \Q$ . Therefore,

$$
\begin{array}{rl}{\langle g^{*}, x_{\delta} - x_{*} \rangle \overset{(3.1.72)}{\geq} K \langle A^{T} \bar{y}, \bar{x} + \delta - x^{*} \rangle \ : = \ : K \langle \bar{y}, A \delta + b - Ax_{*} \rangle} &{} \\ &{} \\{= \ :} &{K \| b - Ax_{*} \| + K \langle A^{T} \bar{y}, \delta \rangle.} \end{array}\tag{3.1.73}
$$

In view of Theorem 3.1.11, $M = \operatorname{max}_{x} \left\{f(x) : x \in B(\bar{x}, \epsilon) \right\} < + \infty$ . Then

$$
\langle g^{*}, x_{\delta} - x_{*} \rangle \stackrel{(3.1.23)}{\leq} f(x_{\delta}) - f(x_{*}) \leq M - f_{*},
$$

where $f_{*} ~ = ~ \operatorname{min}_{x \in \mathcal{Q}} f(x)$ . Therefore, maximizing the right-hand side of inequality (3.1.73) in $\delta \in B(0, \epsilon)$ , we get

$$
M - f_{*} \geq K \epsilon \| A^{T} \bar{y} \| \geq K \epsilon \mu \| \bar{y} \|,
$$

where $\mu = \lambda_{\operatorname{min}}^{1 / 2}(AA^{T}) > 0$ . Defining $y^{*} = K{\bar{y}}$ , we get from the first inequality the bound (3.1.71). On the other hand, choosing $\begin{array}{r}{K > \frac{1}{\epsilon \mu}(M - f_{*})} \end{array}$ , from the second inequality we necessarily get $\|{\bar{y}} \| < 1$ . By Lemma 3.1.15, this implies that $Ax_{*} = b$ Conseque $\mathrm{\ntly}, x_{*}$ is an optimal solution for problem (3.1.68).

As we can see now, for K big enough, any solution $x^{*}$ of problem (3.1.68) is a global minimum of the function $\phi$ . Repeating the above reasoning, we can justify the condition (3.1.70).

In view of its simplicity, Theorem 3.1.27 has many interesting applications. Here we present only one of them, related to the rules for differentiating a partial minimization of a convex function. The new statement significantly extends a particular case of Theorem 3.1.25.

Theorem 3.1.28 Let a function f be convex and Q be a closed convex set belonging to int (dom f ). Assume that the level sets of f are bounded on Q.

Let a matrix $A \in \mathbb{R}^{m \times n}$ with $n > m$ have a full row rank. Consider the function

$$
\phi(u) = \operatorname{min}_{x \in Q} \{f(x) : Ax = u\}.
$$

Then $\phi$ is convex and for any $u \in \mathbb{R}^{m}$ such that $\{x \in \operatorname{int} \left(Q \right) : \Ax = u\} \neq \varnothing,$ , we have

$$
\{y^{*} : \ \exists x^{*} \in Q, \Ax^{*} = u, \and \g^{*} \in \partial f(x^{*})\tag{3.1.74}
$$

$$
\mathrm{such ~ that ~} \langle g^{*} - A^{T} y^{*}, x - x^{*} \rangle \geq 0 \forall x \in \mathcal{Q}\} \subseteq \partial \phi(u).
$$

Proof Let $Q(u) = \{x \in Q : Ax = u\}$ . Then dom $\phi = \{u \in \mathbb{R}^{m} : ~ Q(u) \neq \emptyset\}$ . In view of the conditions of the theorem, for any $u \in$ dom $\phi$ there exists at least one point $x(u)$ in the set $\mathrm{Arg}_{x \in Q(u)} f(x)$ . Let $u_{1}, u_{2} \in$ dom φ and $\alpha \in[0, 1]$ . Then

$$
x_{\alpha} \stackrel{\mathrm{def}}{=} \alpha x(u_{1}) +(1 - \alpha) x(u_{2}) \in Q(\alpha u_{1} +(1 - \alpha) u_{2}).
$$

Therefore,

$$
\begin{array}{rl} &{\phi(\alpha u_{1} +(1 - \alpha) u_{2}) \leq f(x_{\alpha}) \stackrel{{\scriptscriptstyle(3.1.2)}}{\leq} \alpha f(x(u_{1})) +(1 - \alpha) f(x(u_{2}))} \\ &{} \\ &{\qquad = \alpha \phi(u_{1}) +(1 - \alpha) \phi(u_{2}).} \end{array}
$$

Further, in view of Theorem 3.1.27, the set in the left-hand side of inclusion (3.1.74) is nonempty. Let the triple $(x^{*}, y^{*}, g^{*})$ be an element of this set for some $u = u_{1} \in$ dom $\phi$ . Then for another $u_{2} \in$ dom φ we have

$$
\begin{array}{l}{{\phi(u_{2}) = f(x(u_{2})) \stackrel{(3.1.23)}{\geq} f(x^{*}) + \langle g^{*}, x(u_{2}) - x^{*} \rangle \stackrel{(3.1.74)}{\geq} \langle A^{T} y^{*}, x(u_{2}) - x^{*} \rangle}} \\{{\}} \\{{\qquad = \phi(u_{1}) + \langle y^{*}, u_{2} - u_{1} \rangle.}} \end{array}
$$

Therefore, ${y^{*}}^{(3.1.23)} \partial \phi(u_{1})$ .

Thus, the rules for differentiating the function $\phi$ at a point u are very simple. We need to solve the corresponding minimization problem and extract from the solver the optimal Lagrange multipliers for equality constraints. This vector is an element of the subdifferential $\partial \phi(u)$

## 3.1.8 Minimax Theorems

Consider a function $\psi(\cdot, \cdot)$ defined on the direct product of two convex sets, $P \subseteq \mathbb{R}^{n}$ and $S \subseteq \mathbb{R}^{m}$ . We assume that the functions $\psi(\cdot, u)$ are closed and convex on $P \subseteq$ dom $\psi(\cdot, u)$ for all $u \in S$ . Similarly, all functions $\psi(x, \cdot)$ are closed and concave on $S \subseteq \operatorname{dom} \psi(x, \cdot)$ for all $x \in P$ . The main goal of this section is the justification of the sufficient conditions for the equality

$$
\operatorname{inf}_{x \in P} \operatorname{sup}_{u \in S} \psi(x, u) = \operatorname{sup}_{u \in S} \operatorname{inf}_{x \in P} \psi(x, u).\tag{3.1.75}
$$

Note that in general, we can guarantee only that the right-hand side of this relation does not exceed its left-hand side (see (1.3.6)).

Define $f(x) = \operatorname{sup}_{u \in S} \varPsi(x, u) \geq \phi(u) = \operatorname{inf}_{x \in P} \varPsi(x, u)$ . We will see that in many situations

$$
\operatorname{min}_{x \in P} f(x) = \operatorname{max}_{u \in S} \phi(u).
$$

Let us start from a simple observation.

Lemma 3.1.22 Assume that for any $u \in S,$ , the level sets of the function $\psi(\cdot, u)$ are bounded on P , and the function φ attains its maximum on S at some point $u^{*}$ . Then for any $u \in S$ we have

$$
\operatorname{min}_{x \in P} \operatorname{max} \{\psi(x, u), \psi(x, u^{*})\} = \phi(u^{*}).\tag{3.1.76}
$$

## 3.1 General Convex Functions

Proof Let us choose an arbitrary $u \in S$ . For $x \in P$ , consider the function

$$
f_{u}(x) = \operatorname{max} \{\psi(x, u), \psi(x, u^{*})\} \ \geq \ \operatorname{max} \{\phi(u), \phi(u^{*})\} \ = \ \phi(u^{*}).\tag{3.1.77}
$$

In view of Theorem 3.1.10, there exists a $\lambda^{*} \in[0, 1]$ such that

$$
\begin{array}{rl} &{\underset{x \in P}{\operatorname{min}} f_{u}(x) = \underset{x \in P}{\operatorname{min}} \left.\lambda^{*} \varPsi(x, u) +(1 - \lambda^{*}) \varPsi(x, u^{*}) \right.} \\ &{\qquad \leq \underset{x \in P}{\operatorname{min}} \varPsi(x, \lambda^{*} u +(1 - \lambda^{*}) u^{*})} \\ &{\qquad = \phi(\lambda^{*} u +(1 - \lambda^{*}) u^{*}).} \end{array}
$$

Hence, $\phi(u^{*}) \stackrel{(3.1.77)}{\leq} \operatorname{min}_{x \in P} f_{u}(x) \leq \phi(\lambda u +(1 - \lambda) u^{*}) \leq \phi(u^{*}).$ □

Now we can prove the first variant of the Minimax Theorem.

Theorem 3.1.29 Let each of the functions $\psi(\cdot, u)$ attain a unique minimum on $P,$ and let the function φ attain its maximum on S. Then

$$
\operatorname{min}_{x \in P} f(x) = \operatorname{max}_{u \in S} \phi(u).\tag{3.1.78}
$$

Proof Since the point $x(u) = \arg \operatorname{min}_{x \in P} \psi(x, u)$ is uniquely defined, the level sets of all functions $\psi(\cdot, u), u ~ \in ~ S$ are bounded (see Theorem 3.1.4(5)). Thus, by Lemma 3.1.22, relation (3.1.76) is valid for all $u \in S$

Since $\phi(u^{*}) = \varPsi(x(u^{*}), u^{*})$ , the minimum of problem (3.1.76) can be achieved only at the point $x(u^{*})$ . But then for any $u \in S$ we have

$$
\psi(x(u^{*}), u) \stackrel{(3.1.76)}{\leq} \psi(x(u^{*}), u^{*}) \leq \psi(x, u^{*}), \quad x \in P.
$$

Thus, $f(x(u^{*})) \leq \phi(u^{*})$ , and we get (3.1.78) by (1.3.6).

Relaxation of the uniqueness condition for the minimizers of the functions $\psi(\cdot, u), u \in S$ , gives us a variant of von Neuman’s Theorem.<sup>3</sup>

Theorem 3.1.30 Assume that both sets P and S are bounded. Then

$$
\operatorname{min}_{x \in P} f(x) = \operatorname{max}_{u \in S} \phi(u).\tag{3.1.79}
$$

Proof Let us fix some $\epsilon > 0$ . For the standard Euclidean norm $\| \cdot \|$ , consider the function

$$
\begin{array}{r}{\psi_{\epsilon}(x, u) = \varPsi(x, u) + \frac{1}{2} \epsilon \| x \|^{2}, \quad x \in P, u \in S.} \end{array}
$$

Since for each $u \in S$ the function $\psi_{\epsilon}(\cdot, u)$ is strongly convex, it attains a unique minimum on $P_{}$ . Therefore the function $\phi_{\epsilon}(u) = \operatorname{min}_{x \in P} \psi_{\epsilon}(x, u)$ is well defined, and in view of Theorem 3.1.8, it is concave and closed on S. Therefore, by Theorem 3.1.29, there exist points $u_{\epsilon}^{*} \in S$ and $x_{\epsilon}^{*} = \arg \operatorname{min}_{x \in P} \psi_{\epsilon}(x, u_{\epsilon}^{*})$ , such that

$$
\psi_{\epsilon}(x_{\epsilon}^{*}, u) \leq \psi_{\epsilon}(x_{\epsilon}^{*}, u_{\epsilon}^{*}) \leq \psi_{\epsilon}(x, u_{\epsilon}^{*}), \quad x \in P, \u \in S.
$$

The first inequality is $\psi(x_{\epsilon}^{*}, u) \leq \psi(x_{\epsilon}^{*}, u_{\epsilon}^{*})$ for all $u \in S$ . Thus,

$$
f(x_{\epsilon}^{*}) = \operatorname{sup}_{u \in S} \varPsi(x_{\epsilon}^{*}, u) \ \leq \ \varPsi(x_{\epsilon}^{*}, u_{\epsilon}^{*}).
$$

On the other hand, for all $x \in P$ we have

$$
\psi(x_{\epsilon}^{*}, u_{\epsilon}^{*}) \leq \varPsi_{\epsilon}(x_{\epsilon}^{*}, u_{\epsilon}^{*}) \leq \varPsi(x, u_{\epsilon}^{*}) + \frac{1}{2} \epsilon D^{2},
$$

where $D \geq \operatorname{sup}_{x \in P} \left\| x \right\|$ . Hence,

$$
\begin{array}{r}{f(x_{\epsilon}^{*}) \leq \phi(u_{\epsilon}^{*}) + \frac{1}{2} \epsilon D^{2}, \quad \epsilon > 0.} \end{array}
$$

In view of the boundedness of the sets P and S, letting $\epsilon 0$ in this inequality, we get the relation (3.1.79) (see Item 4 of Theorem 3.1.4).

Finally, let us show that sometimes it is possible to derive the no-gap property (3.1.78) from the local optimality conditions.

Theorem 3.1.31 Let a function f attain its minimum on P at the point $x^{*}$ . Suppose that for some $g_{*} \in \partial_{P} f(x^{*})$ , yielding the first-order optimality condition

$$
\langle g_{*}, x - x^{*} \rangle \stackrel{(3.1.56)}{\geq} 0, \quad x \in P,
$$

there exists a representation

$$
g_{*} = \sum_{i = 1}^{k} \lambda^{(i)} g_{i},\tag{3.1.80}
$$

for certain $k \geq 1, \lambda \in \varDelta_{k}$ , and some $g_{i}$ belonging to the sets $\partial_{P, x} \psi(x^{*}, u_{i})$ , where $u_{i} \in I(x^{*}), i = 1,..., k,$ , and $I(x^{*}) = \{u \in S : \psi(x^{*}, u) = f(x^{*})\}$ . Then the relation (3.1.78) is satisfied.

Proof Indeed, let ${\bar{u}} = \sum_{i = 1}^{k} u_{i}$ . Then, for any $x \in P$ , we have

$$
\begin{array}{rcl}{f(x^{*})} &{\leq} &{f(x^{*}) + \langle g_{*}, x - x^{*} \rangle \overset{(3.1.80)}{=} f(x^{*}) + \displaystyle \sum_{i = 1}^{k} \lambda^{(i)} \langle g_{i}, x - x^{*} \rangle} \\ & &{} & \\ & &{\overset{(3.1.23)}{\leq} f(x^{*}) + \displaystyle \sum_{i = 1}^{k} \lambda^{(i)}[\psi(x, u_{i}) - \psi(x^{*}, u_{i})] = \displaystyle \sum_{i = 1}^{k} \lambda^{(i)} \psi(x, u_{i})} \\ & &{} & \\ & &{\leq} &{\psi(x, \bar{u}).} \end{array}
$$

Thus, $f(x^{*}) \leq \phi({\bar{u}})$ , and by (1.3.6) we see that $\phi({\bar{u}}) = \operatorname{max}_{u \in S} \phi(u)$ .

Note that the right-hand side of representation (3.1.80) belongs to $\partial_{P} f(x^{*})$ (see Lemma 3.1.14). Therefore, a sufficient condition for the existence of this representation is

$$
\partial_{P} f(x^{*}) = \operatorname{Conv}{\{} \partial_{P, x} \psi(x^{*}, u) : \u \in I(x^{*}){\}}.\tag{3.1.81}
$$

## 3.1.9 Basic Elements of Primal-Dual Methods

Very often, the possibility of applying primal-dual optimization methods comes out from direct access to the internal structure of the objective function. Consider the problem

$$
f^{*} = \operatorname{min}_{x \in P} f(x),\tag{3.1.82}
$$

where the function $f$ is closed and convex on P . Suppose that the objective function $f$ has a max-representation:

$$
f(x) = \operatorname{max}_{u \in S} \psi(x, u),\tag{3.1.83}
$$

where the function $\psi$ satisfies all our assumptions made in the beginning of Sect. 3.1.8. From this representation, we derive the dual problem<sup>4</sup>

$$
\phi^{*} = \operatorname{max}_{u \in S} \phi(u), \quad \phi(u) \ \stackrel{\mathrm{def}}{=} \ \operatorname{min}_{x \in P} \psi(x, u).\tag{3.1.84}
$$

From the mathematical point of view, the pair of primal-dual problems (3.1.82) and (3.1.84) looks completely symmetric. However, this is not true for numerical methods. Indeed, our initial intention was to solve problem (3.1.82). Hence, it is implicitly assumed that the maximization problem in definition (3.1.83) is relatively easy. It should be possible to solve it either in a closed form, or by a simple numerical procedure (which defines the complexity of the oracle). At the same time, the complexity of computing the value of the objective function in problem (3.1.84) can be very high. It can easily reach the complexity of our initial problem (3.1.82). Therefore, it seems that the dual problem has a good chance of being much more difficult than the initial primal problem (3.1.82).

Fortunately this is not the case provided that we have an access to the internal structure of the oracle (3.1.83). Indeed, in order to compute the value $f(x)$ the oracle needs to compute a point

$$
u(x) \in \mathop{\mathrm{Arg}} \mathop{\operatorname{max}}_{u \in S} \psi(x, u).
$$

Let us assume that this point is used to compute the subgradient $g(x)$ (or, when $f$ is smooth, the gradient) of the objective function (see Lemma 3.1.14):

$$
g(x) \in \partial_{P, x} \psi(x, u(x)).
$$

Thus, we assume that the oracle returns three objects: $f(x), g(x)$ , and $u(x) \in S$ Let us show how this information can be used in numerical methods.

In Smooth Optimization, we often use the functional model of the objective function. Assume that some method accumulated the information from the oracle at points $\{y_{k}\}_{k = 0}^{N} \subset P$ . Then, for some scaling coefficients

$$
\alpha_{k} > 0, \quad k = 0, \ldots, N, \quad \sum_{k = 0}^{N} \alpha_{k} = 1,
$$

we can construct a linear model of the objective function:

$$
\ell_{N}(x) = \sum_{k = 0}^{N} \alpha_{k}[f(y_{k}) + \langle g(y_{k}), x - y_{k} \rangle] \stackrel{(3.1.23)}{\leq} f(x), \quad x \in P.
$$

In some methods (see, for example, (2.2.3), (2.2.4)), for points of minimizing sequence $\{x_{k}\}_{k \ge 0}$ , it is possible to ensure the following relation:

$$
f(x_{N}) \leq \operatorname{min}_{x \in P} \ \ell_{N}(x) + r_{N},\tag{3.1.85}
$$

where $r_{N} 0$ as $N \to \infty$ . In fact, this relation can be used not only for justifying the quality of point $x_{N}$ , but also for estimating the primal-dual gap with respect to the dual solution

$$
\hat{u}_{N} = \sum_{k = 0}^{N} \alpha_{k} u(y_{k}) \ \in \S.\tag{3.1.86}
$$

Lemma 3.1.23 Let the point $x_{N}$ satisfy (3.1.85). Then

$$
0 \le(f(x_{N}) - f^{*}) +(\phi^{*} - \phi(\hat{u}_{N})) \ \le \f(x_{N}) - \phi(\hat{u}_{N}) \ \le \r_{N}.
$$

Proof Indeed, $g(y_{k}) \in \partial_{P, x} \varPsi(y_{k}, u(y_{k}))$ . Therefore,

$$
\operatorname{min}_{x \in P} \ \ell_{N}(x) \quad = \quad \operatorname{min}_{x \in P} \sum_{k = 0}^{N} \alpha_{k}[\psi(y_{k}, u(y_{k})) + \langle g(y_{k}), x - y_{k} \rangle]
$$

$$
\stackrel{(3.1.23)}{\leq} \operatorname{min}_{x \in P} \sum_{k = 0}^{N} \alpha_{k} \psi(x, u(y_{k})) \ \leq \ \operatorname{min}_{x \in P} \psi(x, \hat{u}_{N}) \ = \ \phi(\hat{u}_{N}).
$$

It remains to use inequality (3.1.85).

Since we have ensured $r_{N} \ \to \0$ , for our problem we have managed to prove the no-gap property algorithmically. Note that our way of generating the good dual solution (3.1.86) does not require a single computation of the dual function.

In Nonsmooth Optimization, we use another certificate of optimality based on the gap function. It is defined by a sequence of test points $\{y_{k}\}_{k = 0}^{N}$ and scaling coefficients as follows:

$$
\delta_{N}(x) = \sum_{k = 0}^{N} \alpha_{k} \langle g(y_{k}), y_{k} - x \rangle.
$$

Define $\hat{f}_{N} = \sum_{k = 0}^{N} \alpha_{k} f(y_{k})$

Lemma 3.1.24 Assume that max $\delta_{N}(x) \leq r_{N} 0$ . Then x P

$$
0 \le(\hat{f}_{N} - f^{*}) +(\phi^{*} - \phi(\hat{u}_{N})) \le \hat{f}_{N} - \phi(\hat{u}_{N}) \le r_{N} \to 0.
$$

Proof Indeed

$$
\begin{array}{rcl}{\displaystyle \operatorname{max}_{x \in P} \delta_{N}(x)} &{=} &{\displaystyle \operatorname{max}_{x \in P} \displaystyle \sum_{k = 0}^{N} \alpha_{k} \langle g(y_{k}), y_{k} - x \rangle} \\ & &{} & \\{\displaystyle \overset{(3.1.23)}{\geq} \operatorname{min}_{x \in P} \displaystyle \sum_{k = 0}^{N} \alpha_{k}[\psi(y_{k}, u(y_{k})) - \psi(x, u(y_{k}))]} \\ & &{} & \\ & &{} & \\{\displaystyle \overset{(3.1.4)}{\geq} \hat{f}_{N} - \displaystyle \operatorname{min}_{x \in P} \psi(x, \hat{u}_{N}) \ = \ \hat{f}_{N} - \phi(\hat{u}_{N}).} &{\quad D} \end{array}
$$

Again, for nonsmooth problems, computation of the good dual solution $\hat{u}_{N}$ does not require significant computational resources.

## 3.2 Methods of Nonsmooth Minimization

(General lower complexity bounds; Main lemma; Localization sets; The subgradient method; Minimization with functional constraints; Approximation of optimal Lagrange multipliers; Strongly convex functions; Optimization in finite dimensions and lower complexity bounds; Cutting plane schemes; The center of gravity method; The ellipsoid method and others.)

## 3.2.1 General Lower Complexity Bounds

In Sect. 3.1, we introduced a class of general convex functions. These functions can be nonsmooth and therefore the corresponding minimization problem can be quite difficult. As for smooth problems, let us try to derive lower complexity bounds, which will help us to evaluate the performance of numerical methods.

In this section, we derive such bounds for the following unconstrained minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} f(x),\tag{3.2.1}
$$

where $f$ is a convex function. Denote by $x^{*} \in \mathbb{R}^{n}$ one of its optimal solutions. Thus, our problem class is as follows.

<table><tr><td rowspan=1 colspan=1>Model:</td><td rowspan=1 colspan=1>1. Unconstrained minimization.2. $f$ is convex on $\mathbb{R}^{n}$ 4and Lipschitzcontinuous on a bounded set.</td></tr><tr><td rowspan=1 colspan=1>Oracle:</td><td rowspan=1 colspan=1>First-order Black Box:at each point $\hat{x}$ , we can compute $f({\hat{x}}), \quad g({\hat{x}}) \in \partial f({\hat{x}})$  $g(\hat{x})$ is an arbitrary subgradient.</td></tr><tr><td rowspan=1 colspan=1>Approximatesolution:</td><td rowspan=1 colspan=1>Find $\bar{x} \in \mathbb{R}^{n} : f(\bar{x}) - f^{*} \leq \epsilon.$ </td></tr><tr><td rowspan=1 colspan=1>Methods:</td><td rowspan=1 colspan=1>Generate a sequence $\{x_{k}\}$  $x_{k} \in x_{0} + \operatorname{Lin} \{g(x_{0}), \ldots, g(x_{k - 1})\}.$ </td></tr></table>

(3.2.2)

As in Sect. 2.1.2, to derive lower complexity bounds for our problem class, we will study the behavior of numerical methods on some function, which appears to be very difficult for all schemes.

Let us fix some parameters $\mu > 0$ and $\gamma > 0$ . Consider the family of functions

$$
\begin{array}{r}{f_{k}(\boldsymbol{x}) = \gamma \displaystyle \operatorname{max}_{1 \leq i \leq k} \x^{(i)} + \frac{\mu}{2} \parallel \boldsymbol{x} \parallel^{2}, \quad k = 1 \ldots n,} \end{array}\tag{3.2.3}
$$

where the norm is standard Euclidean. Using the rules of subdifferential calculus, described in Sect. 3.1.6, we can write down a closed-form expression for the subdifferential of $f_{k}$ at x. This is

$$
\partial f_{k}(x) = \mu x + \gamma \mathrm{Conv} \{e_{i} \mid i \in I(x)\},
$$

$$
I(x) = \{j \mid 1 \leq j \leq k, x^{(j)} = \operatorname{max}_{1 \leq i \leq k} x^{(i)}\}.
$$

Let $x_{k}^{*}$ be the global minimum of the function $f_{k}$ . Then, for any x, $y \in B_{2}(x^{*}, \rho)$ $\rho > 0$ , and $g_{k}(y) \in \partial f_{k}(y)$ , we have

$$
\begin{array}{rl} &{f_{k}(y) - f_{k}(x) \leq \langle g_{k}(y), y - x \rangle \leq \parallel g_{k}(y) \parallel \cdot \parallel y - x \parallel} \\ &{} \\ &{\qquad \leq \left(\mu \parallel x_{k}^{*} \parallel + \mu \rho + \gamma \right) \parallel y - x \parallel.} \end{array}\tag{3.2.4}
$$

Thus, $f_{k}$ is Lipschitz continuous on $B_{2}(x_{k}^{*}, \rho)$ with Lipschitz constant

$$
M = \mu \| x_{k}^{*} \| + \mu \rho + \gamma.
$$

Further, by Theorem 3.1.20, it is easy to check that the optimal point $x_{k}^{*}$ has the following coordinates:

$$
\begin{array}{r}{(x_{k}^{*})^{(i)} = \left\{\begin{array}{ll}{- \frac{\gamma}{\mu k}, 1 \leq i \leq k,} \\{\qquad \quad 0, k + 1 \leq i \leq n.} \end{array} \right.} \end{array}
$$

Now we have all the important characteristics of our problem:

$$
\begin{array}{rl} &{R_{k} \stackrel{\mathrm{def}}{=} \| \x_{k}^{*} \| = \frac{\gamma}{\mu \sqrt{k}}, \quad f_{k}^{*} = - \frac{\gamma^{2}}{\mu k} + \frac \mu 2R_{k}^{2} = - \frac{\gamma^{2}}{2 \mu k},} \\ &{} \\ &{M = \mu \| x_{k}^{*} \| + \mu \rho + \gamma = \mu \rho + \gamma \frac{\sqrt{k} + 1}{\sqrt{k}}.} \end{array}\tag{3.2.5}
$$

Let us describe now a resisting oracle for the function $f_{k}(\cdot)$ . Since the analytical form of this function is fixed, the resistance of this oracle consists in providing us with the worst possible subgradient at each test point. The algorithmic scheme of this oracle is as follows.

<table><tr><td>Input:</td><td> $x \in \mathbb{R}^{n},$ </td></tr><tr><td>MainLoop:</td><td> $f : = - \infty; \quad i^{*} : = 0;$ </td></tr><tr><td></td><td> $\mathbf{for} \j : = 1$  to k do  $\textbf{if}_{\boldsymbol{x}}(j) > f$  then  $\{\f : = x^{(j)}; i^{*} : = j\};$   $\begin{array}{r}{f : = \gamma f + \frac{\mu}{2} \parallel x \parallel^{2}; g : = \gamma e_{i^{*}} + \mu x;} \end{array}$ </td></tr><tr><td>Output :</td><td> $f_{k}(x) : = f, \quad g_{k}(x) : = g \in \mathbb{R}^{n}.$ </td></tr></table>

(3.2.6)

At first glance, there is nothing special in this procedure. Its main loop is just a standard process for finding the maximal coordinate of a vector from $\mathbb{R}^{k}$ . However, the main feature of this loop is that we always form the subgradient of the nonsmooth part of the objective proportional to a coordinate vector. Moreover, the

active coordinate $i^{*}$ always corresponds to the first maximal component of vector x.   
Let us see what happens with a minimizing sequence based on such an oracle.

Let us choose the starting point $x_{0} = 0$ . Define

$$
\mathbb{R}^{p, n} = \{x \in \mathbb{R}^{n} \mid x^{(i)} = 0, \p + 1 \leq i \leq n\}.
$$

Since $x_{0} = 0$ , the answer of the oracle is $f_{k}(x_{0}) = 0$ and $g_{k}(x_{0}) = e_{1}$ . Therefore, the next point of the sequence, $x_{1}$ , necessarily belongs to $\mathbb{R}^{1, n}$ . Assume now that the current test point of the sequence, $x_{i}$ , belongs to $\mathbb{R}^{p, n}, 1 \le p \le k$ . Then the oracle returns a subgradient

$$
g = \mu x_{i} + \gamma e_{i^{*}},
$$

where $i^{*} \leq p + 1$ . Therefore, the next test point $x_{i + 1}$ belongs to $\mathbb{R}^{p + 1, n}$

This simple reasoning proves that for all $i, 1 \le i \le k$ , we have $x_{i} ~ \in ~ \mathbb{R}^{i, n}$ Consequently, for $i \colon 1 \leq i \leq k - 1$ , we cannot improve the starting value of the objective function:

$$
f_{k}(x_{i}) \geq \gamma \operatorname{max}_{1 \leq j \leq k} x_{i}^{(j)} = 0.
$$

Let us convert this observation into a lower complexity bound. Let us $\operatorname{fix}$ some parameters of our problem class $\mathcal{P}(x_{0}, R, M)$ , that is, $R \ > \0$ and $M \ > \0$ . In addition to (3.2.2) we assume the following.

- The point $x_{0}$ is close enough to the solution of problem (3.2.1):

$$
\| x_{0} - x^{*} \| \leq R.\tag{3.2.7}
$$

- The function f is Lipschitz continuous on $B_{2}(x^{*}, R)$ with constant $M > 0$

Theorem 3.2.1 For any class $\mathcal{P}(x_{0}, R, M)$ and any k, $0 \leq k \leq n - 1$ , there exists a function $f \in{\mathcal{P}}(x_{0}, R, M)$ such that

$$
\begin{array}{r}{f(x_{k}) - f^{*} \ge \frac{MR}{2(2 + \sqrt{k + 1})}} \end{array}
$$

$for$ any optimization scheme, which generates a sequence $\{x_{k}\}$ satisfying the condition

$$
x_{k} \in x_{0} + \operatorname{Lin}{\{g(x_{0}), \ldots, g(x_{k - 1})\}}.
$$

Proof Without loss of generality, we can assume that $x_{0} = 0$ . Let us choose $f(x) =$ $f_{k + 1}(x)$ with the following values of parameters:

$$
\begin{array}{r}{\gamma = \frac{\sqrt{k + 1} M}{2 + \sqrt{k + 1}}, \quad \mu = \frac{M}{(2 + \sqrt{k + 1}) R}.} \end{array}
$$

Then

$$
\begin{array}{r}{f^{*} = f_{k + 1}^{*} \stackrel{(3.2.5)}{=} - \frac{\gamma^{2}}{2 \mu(k + 1)} = - \frac{MR}{2(2 + \sqrt{k + 1})},} \end{array}
$$

$$
\| ~ x_{0} - x^{*} ~ \| = R_{k + 1} \stackrel{(3.2.5)}{=} ~ \frac{\gamma}{\mu \sqrt{k + 1}} ~ = ~ R.
$$

Moreover, f is Lipschitz continuous on $B_{2}(x^{*}, R)$ with constant $\begin{array}{r}{\mu R + \gamma \frac{\sqrt{k + 1} + 1}{\sqrt{k + 1}} =} \end{array}$ M. Note that $x_{k} \in \mathbb{R}^{k, n}$ . Hence, $f(x_{k}) - f^{*} \geq - f^{*}$ .

The lower complexity bound presented in Theorem 3.2.1 does not depend on the dimension of the space of variables. As for the lower bound of Theorem 2.1.7, it can be applied to problems with very large dimension, or to the efficiency analysis of starting iterations of a minimization scheme $(k \leq n - 1)$

We will see that our lower estimate is exact: There exist minimization methods which have a rate of convergence proportional to this lower bound. Comparing this bound with the lower bound for smooth minimization problems, we can see that now the possible convergence rate is much slower. However, we should remember that we are working with one of the most general classes of convex problems.

## 3.2.2 Estimating Quality of Approximate Solutions

We are now interested in the following optimization problem:

$$
\operatorname{min}_{x \in Q} f(x),\tag{3.2.8}
$$

where $Q$ is a closed convex set, and the function $f$ is convex on $\mathbb{R}^{n}$ . We are going to study numerical methods for solving (3.2.8), which employ subgradients $g(x)$ of the objective function, computed at $x \in Q$ . As compared with the smooth problem, our goal is more challenging. Indeed, even in the simplest situation, when $Q \equiv$ $\mathbb{R}^{n}$ , the subgradient seems to be a poor replacement for the gradient of a smooth function. For example, we cannot be sure that the value of the objective function is decreasing in the direction $- g(x)$ . We cannot expect that $g(x) 0$ as x approaches the solution of our problem, etc.

Fortunately, there is one property of subgradients which makes our goals reachable. We have justified this property in Corollary 3.1.6:

At any $x \in Q$ , the following inequality holds:   
g(x), x  x∗ 0.

(3.2.9)

This simple inequality leads to two important consequences, which form the basis for the majority of nonsmooth minimization methods. Namely:

- The distance between x and $x^{*}$ decreases along the direction $- g(x)$

- Inequality (3.2.9) cuts $\mathbb{R}^{n}$ in two half-spaces, and it is known which of them contains the optimal point $x^{*}$

Nonsmooth minimization methods cannot employ the idea of relaxation or approximation. There is another concept underlying all these schemes. This is the concept of localization. However, to go forward with this concept, we have to develop a special technique which allows us to estimate the quality of an approximate solution to problem (3.2.8). This is the main goal of this section.

Let us fix some ${\bar{x}} \in \mathbb{R}^{n}$ . For $x \in \mathbb{R}^{n}$ with $g(x) \neq 0$ define

$$
\begin{array}{r}{v_{f}(\bar{x}, x) = \frac{1}{\| g(x) \|} \langle g(x), x - \bar{x} \rangle.} \end{array}\tag{3.2.10}
$$

If $g(x) = 0$ , then define $v_{f}(\bar{x}; x) = 0$ . Clearly, by the Cauchy-Schwarz inequality,

$$
v_{f}(\bar{x}, x) \leq \parallel x - \bar{x} \parallel.
$$

The values $v_{f}(\bar{x}, x)$ have a natural geometric interpretation. Consider a point x such that $g(x) \neq 0$ and $\langle g(x), x -{\bar{x}} \rangle \geq 0$ . Let us look at the point

$$
\begin{array}{r}{\bar{y} = \bar{x} + v_{f}(\bar{x}, x) \frac{g(x)}{\| g(x) \|}.} \end{array}
$$

Then

$$
\langle g(x), x -{\bar{y}} \rangle = \langle g(x), x -{\bar{x}} \rangle - v_{f}({\bar{x}}, x) \parallel g(x) \parallel \overset{(3.2.10)}{=} 0,
$$

and $\parallel \bar{y} - \bar{x} \parallel = v_{f}(\bar{x}, x)$ . Thus, $v_{f}(\bar{x}, x)$ is a distance from point $\bar{x}$ to the hyperplane $\{y : \ \langle g(x), x - y \rangle = 0\}$

Let us introduce a function which measures the growth of the function $f$ around the point x. For $t \geq 0$ , define

$$
\omega_{f}(\bar{x}; t) = \operatorname{max}_{x} \{f(x) - f(\bar{x}) : \| \x - \bar{x} \ \| \leq t\}.
$$

If $t < 0$ , we set $\omega_{f}(\bar{x}; t) = 0$

Clearly function $\omega_{f}$ possesses the following properties.

$\omega_{f}(\bar{x}; t) = 0$ for all $t \leq 0$

$\omega_{f}(\bar{x}; t)$ is a nondecreasing function of $t \in \mathbb{R}$

$f(x) - f({\bar{x}}) \leq \omega_{f}({\bar{x}}; \parallel x -{\bar{x}} \parallel).$

It is important that under a convexity assumption the last inequality can be significantly strengthened.

Lemma 3.2.1 For any $x \in \mathbb{R}^{n}$ we have

$$
f(x) - f(\bar{x}) \leq \omega_{f}(\bar{x}; v_{f}(\bar{x}; x)).\tag{3.2.11}
$$

If f ( ) is Lipschitz continuous on $B_{2}({\bar{x}}, R)$ with constant M, then

$$
f(x) - f({\bar{x}}) \leq M(v_{f}({\bar{x}}; x))_{+}\tag{3.2.12}
$$

for all $x \in \mathbb{R}^{n}$ with $v_{f}(\bar{x}; x) \le R.$

Proof If $\langle g(x), x -{\bar{x}} \rangle < 0.$ , then $f({\bar{x}}) \geq f(x) + \langle g(x),{\bar{x}} - x \rangle \geq f(x)$ . Since $v_{f}(\bar{x}; x)$ is negative, we have $\omega_{f}(\bar{x}; v_{f}(\bar{x}; x)) = 0$ and (3.2.11) holds.

Let $\langle g(x), x -{\bar{x}} \rangle \geq 0$ . For

$$
\begin{array}{r}{\bar{y} = \bar{x} + v_{f}(\bar{x}; x) \frac{g(x)}{\| g(x) \|},} \end{array}
$$

we have $\langle g(x),{\bar{y}} - x \rangle = 0$ and $\bar{y} - \bar{x} \parallel = v_{f}(\bar{x}; x)$ . Therefore,

$$
f({\bar{y}}) \geq f(x) + \langle g(x),{\bar{y}} - x \rangle = f(x),
$$

and

$$
f(x) - f(\bar{x}) \leq f(\bar{y}) - f(\bar{x}) \leq \omega_{f}(\bar{x}; \parallel \bar{y} - \bar{x} \parallel) = \omega_{f}(\bar{x}; v_{f}(\bar{x}; x)).
$$

If f is Lipschitz continuous on $B_{2}({\bar{x}}, R)$ and $0 \leq v_{f}(\bar{x}; x) \leq R$ , then $\bar{y} \in B_{2}(\bar{x}, R)$ Hence,

$$
f(x) - f({\bar{x}}) \leq f({\bar{y}}) - f({\bar{x}}) \leq M \parallel{\bar{y}} -{\bar{x}} \parallel = Mv_{f}({\bar{x}}; x).
$$

Let us $\operatorname{fix}$ some optimal solution $x^{*}$ of problem (3.2.8). The values $v_{f}(x^{*}; x)$ allow us to estimate the quality of so-called localization sets.

Definition 3.2.1 Let $\{x_{i}\}_{i = 0}^{\infty}$ be a sequence in $Q.$ Define

$$
S_{k} = \{x \in Q \mid \langle g(x_{i}), x_{i} - x \rangle \geq 0, i = 0...k\}.
$$

We call $S_{k}$ the localization set of problem (3.2.8) generated by the sequence $\{x_{i}\}_{i = 0}^{\infty}$

In view of inequality (3.2.9), for all $k \geq 0$ , we have $x^{*} \in S_{k}$

$$
v_{i} = v_{f}(x^{*}; x_{i})(\geq 0), \quad v_{k}^{*} = \operatorname{min}_{0 \leq i \leq k} \v_{i}.
$$

Thus,

$$
v_{k}^{*} = \operatorname{max} \{r : \langle g(x_{i}), x_{i} - x \rangle \geq 0, i = 0 \ldots k, \forall x \in B_{2}(x^{*}, r)\}.
$$

This is the radius of the maximal ball centered at $x^{*}$ , which is contained in the localization set $S_{k}$

Lemma 3.2.2 Let $f_{k}^{*} = \operatorname{min}_{0 \leq i \leq k} \f(x_{i})$ . Then

$$
f_{k}^{*} - f^{*} \leq \omega_{f}(x^{*}; v_{k}^{*}).
$$

Proof Using Lemma 3.2.1, we have

$$
\omega_{f}(x^{*}; v_{k}^{*}) = \operatorname{min}_{0 \leq i \leq k} \omega_{f}(x^{*}; v_{i}) \ \geq \ \operatorname{min}_{0 \leq i \leq k}[f(x_{i}) - f^{*}] \ = \f_{k}^{*} - f^{*}.
$$

## 3.2.3 The Subgradient Method

Now we are ready to analyze the behavior of some minimization methods. Consider the problem

$$
\operatorname{min}_{x \in Q} f(x),\tag{3.2.13}
$$

where the function $f$ is convex on $\mathbb{R}^{n}$ , and $Q$ is a simple closed convex set. The term “simple” means that we can solve explicitly some simple minimization problems over $Q$ . In this section, we need to find in a reasonably cheap way the Euclidean projection of any point onto the set Q.

We assume that problem (3.2.13) is equipped with a first-order oracle, which at any test point x provides us with the value of the objective function $f({\bar{x}})$ and one of its subgradients $g({\bar{x}})$

As usual, we first try a version of the Gradient Method. Note that for nonsmooth problems the norm of the subgradient, $g(x)$ , is not very informative. Therefore, in the subgradient scheme we use a normalized direction $\frac{g(\bar{x})}{\| g(\bar{x}) \|}$

Subgradient Method for Simple Sets   
0. Choose $x_{0} \in{Q}$ and a sequence $\{h_{k}\}_{k = 0}^{\infty} \mathrm{.}$   
$h_{k} > 0, \quad h_{k} \to 0, \quad \sum_{k = 0}^{\infty} h_{k} = \infty.$   
1. kth iteration $(k \geq 0)$   
Compute f (x<sub>k</sub>), g(x<sub>k</sub>) and set x<sub>k 1</sub>   
$\begin{array}{r}{\pi_{\mathcal{Q}} \left(x_{k} - h_{k} \frac{g(x_{k})}{\left\| g(x_{k}) \right\|} \right)} \end{array}$

(3.2.14)

Let us estimate the rate of convergence of this scheme.

Theorem 3.2.2 Let a function f be Lipschitz continuous on $B_{2}(x^{*}, R)$ with constant M, where $R \geq \| x_{0} - x^{*} \|$ . Then

$$
f_{k}^{*} - f^{*} \leq M \frac{\mathbb{R}^{2}{+}{\sum_{i = 0}^{k} h_{i}^{2}}}{2 \sum_{i = 0}^{k} h_{i}}.\tag{3.2.15}
$$

Proof Let $r_{i} = \parallel x_{i} - x^{*} \parallel$ . Then, in view of Lemma 2.2.8, we have

$$
\begin{array}{rl} &{r_{i + 1}^{2} = \left\| \pi_{Q} \left(x_{i} - h_{i} \frac{g(x_{i})}{\| g(x_{i}) \|} \right) - x^{*} \right\|^{2}} \\ &{\qquad \leq \left\| x_{i} - h_{i} \frac{g(x_{i})}{\| g(x_{i}) \|} - x^{*} \right\|^{2} = r_{i}^{2} - 2h_{i} v_{i} + h_{i}^{2}.} \end{array}
$$

Summing up these inequalities for $i = 0 \dots k$ , we get

$$
r_{0}^{2} + \sum_{i = 0}^{k} h_{i}^{2} \geq 2 \sum_{i = 0}^{k} h_{i} v_{i} + r_{k + 1}^{2} \geq 2v_{k}^{*} \sum_{i = 0}^{k} h_{i}.
$$

Thus,

$$
\begin{array}{r}{v_{k}^{*} \leq \frac{\mathbb{R}^{2} + \displaystyle \sum_{i = 0}^{k} h_{i}^{2}}{2 \displaystyle \sum_{i = 0}^{k} h_{i}}.} \end{array}
$$

Since $v_{k}^{*} \leq v_{0} \leq \| x_{0} - x^{*} \| \leq R$ , we can use Lemma 3.2.2.

Thus, by Theorem 3.2.2, the rate of convergence of the Subgradient Method (3.2.14) depends on the values

$$
\begin{array}{r}{\varDelta_{k} = \frac{\displaystyle \mathbb{R}^{2} + \sum_{i = 0}^{k} h_{i}^{2}}{\displaystyle 2 \sum_{i = 0}^{k} h_{i}}.} \end{array}
$$

We can easily see that $\varDelta_{k} 0$ if the series $\sum_{i = 0}^{\infty} h_{i}$ diverges. However, let us try to choose $h_{k}$ in an optimal way.

Let us assume that we have to perform a fixed number of steps, say $N \geq 1$ , of the Subgradient Method. Then, minimizing $\varDelta_{k}$ as a function of $\{h_{k}\}_{k = 0}^{N}$ , we can see that the optimal strategy is as follows<sup>5</sup>:

$$
\begin{array}{r}{h_{i} = \frac{R}{\sqrt{N + 1}}, \quad i = 0 \dots N.} \end{array}\tag{3.2.16}
$$

In this case, $\begin{array}{r}{\varDelta_{N} = \frac{R}{\sqrt{N + 1}}} \end{array}$ and we obtain the following rate of convergence:

$$
\begin{array}{r}{f_{N}^{*} - f^{*} \le \frac{MR}{\sqrt{N + 1}}.} \end{array}\tag{3.2.17}
$$

Another possibility for defining the step sizes in the Subgradient Method (3.2.14) consists in using the final accuracy $\epsilon > 0$ as a parameter of the algorithm. Indeed, let us find N from the equation

$$
\begin{array}{r}{\frac{MR}{\sqrt{N + 1}} \stackrel{(3.2.17)}{=} \epsilon \Rightarrow \quad N + 1 = \frac{M^{2} \mathbb{R}^{2}}{\epsilon^{2}}.} \end{array}\tag{3.2.18}
$$

Then, in accordance with (3.2.16), we have

$$
\begin{array}{r}{h_{i} = \frac{\epsilon}{M}, \quad i \ge 0.} \end{array}\tag{3.2.19}
$$

In view of the upper bound (3.2.15), in this case we have

$$
\begin{array}{r}{f_{N}^{*} - f^{*} \le \frac{MR^{2}}{2 \epsilon N} + \frac{1}{2} \epsilon.} \end{array}\tag{3.2.20}
$$

Thus, we get an $\epsilon$-solution of the problem (3.2.1) as far as

$$
\begin{array}{r}{N \ge \frac{M^{2} \mathbb{R}^{2}}{\epsilon^{2}}.} \end{array}\tag{3.2.21}
$$

The main advantage of the step size rule (3.2.19) consists in its independence of the parameters R and N, which usually are not known in advance. Parameter M is an upper bound on the norm of subgradients of the objective function, which are easily observable during the minimization process.

Comparing inequality (3.2.17) with the lower bound of Theorem 3.2.1, we come to the following conclusion.

Subgradient Method (3.2.14), (3.2.16) is optimal for the problem (3.2.13) uniformly in the number of variables n.

If we are not going to fix the number of iterations in advance, we can choose

$$
\begin{array}{r}{h_{i} = \frac{r}{\sqrt{i + 1}}, \quad i = 0,....} \end{array}
$$

Then it is easy to see that $\varDelta_{k}$ is proportional to

$$
\begin{array}{r}{\frac{\mathbb{R}^{2} + r^{2} \ln(k + 1)}{4r \sqrt{k + 1}},} \end{array}
$$

and we can classify this rate of convergence as sub-optimal.

Thus, the simplest method for solving problem (3.2.8) appears to be optimal. Usually, this indicates that the problems from our class cannot be solved very efficiently. However, we should remember that our conclusion is valid uniformly in the dimension of the problem. We will see later that a moderate dimension of the problem, taken into account in a proper way, helps in developing much faster schemes.

## 3.2.4 Minimization with Functional Constraints

Let us show how we can use the Subgradient Method to solve minimization problems with functional constraints. Consider the problem

$$
\operatorname{min}_{x \in Q} \{f(x) : \f_{j}(x) \leq 0, \j = 1, \ldots, m\},\tag{3.2.22}
$$

with closed and convex functions $f$ and $f_{j}$ , and a simple closed convex set $Q$

Let us form an aggregate constraint ${\bar{f}}(x) = \operatorname{max}_{1 \leq j \leq m} \f_{j}(x)$ . Then our problem can be written in the following way:

$$
\operatorname{min}_{x \in{\cal Q}} \{f(x) :{\bar{f}}(x) \leq 0\}.\tag{3.2.23}
$$

Note that we can easily compute a subgradient ${\bar{g}}(x)$ of the function ${\bar{f}},$ provided that we can do so for the functions $f_{j}$ (see Lemma 3.1.13).

Let us fix some $x^{*}$ , an optimal solution to problem (3.2.22). Let $\epsilon > 0$ be the desired accuracy of the approximate solution of problem (3.2.22). Consider the following method.

## Subgradient Method with Functional Constraints

```latex
0. Choose a starting point $x_{0} \in Q.$
1. kth iteration $(k \geq 0)$
(a) Compute $f(x_{k})$ with $g(x_{k}) \in \partial f(x_{k})$ , and $\bar{f}(\boldsymbol{x}_{k})$ with
$\bar{g}(x_{k}) \in \partial \bar{f}(x_{k})$
(b) If $\bar{f}(x_{k}) \leq \epsilon$ , then set
$x_{k+1} = \pi_Q\left(x_k - \frac{\epsilon}{\lVert g(x_k) \rVert_2^2} g(x_k)\right).$ (Case A)
Else, set $\begin{array}{r}{x_{k + 1} = \pi_{Q} \left(x_{k} - \frac{\bar{f}(x_{k})}{\| \bar{g}(x_{k}) \|^{2}} \bar{g}(x_{k}) \right).\quad \mathrm{(Case ~ B)}} \end{array}$
```

(3.2.24)

For method (3.2.24), denote by $\mathcal{I}_{A}(N)$ the set of iterations of type A, and by $\mathcal{I}_{B}(N)$ the set of iterations of type B, which occurred during the first N steps of this scheme. Clearly,

$$
\bar{f}(x_{k}) \le \epsilon, \quad \forall k \in \mathcal{S}_{A}(N).\tag{3.2.25}
$$

Theorem 3.2.3 Let functions f and $f_{j}, ~ j ~ = ~ 1, \ldots, m$ , be Lipschitz continuous on the ball $B_{2}(x^{*}, \| x_{0} - x^{*} \|)$ with constant M. If the number of steps N in method (3.2.24) is big enough,

$$
\begin{array}{r}{N \ge \frac{M^{2}}{\epsilon^{2}} \| x_{0} - x^{*} \|^{2},} \end{array}\tag{3.2.26}
$$

then $\mathcal{F}_{A}(N) \neq \emptyset$ and

$$
f_{N}^{*} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{min}_{k} \{f(x_{k}) : k \in{\mathcal{S}}_{A}(N)\} \leq f(x^{*}) + \epsilon.\tag{3.2.27}
$$

Proof Define $r_{k} = \| x_{k} - x^{*} \|$ . Let us assume that N satisfies (3.2.26), but

$$
f(x_{k}) - f^{*} \geq \epsilon, \quad \forall k \in \mathcal{S}_{A}(N).\tag{3.2.28}
$$

If $k \in \mathcal{I}_{A}(N)$ , then

$$
\begin{array}{rl}{r_{k + 1}^{2} \stackrel{(2.2.49)}{\leq} \left\| x_{k} - \frac{\epsilon}{\| g(x_{k}) \|^{2}} g(x_{k}) \right\|^{2} = r_{k}^{2} - \frac{2 \epsilon}{\| g(x_{k}) \|^{2}} \langle g(x_{k}), x_{k} - x^{*} \rangle + \frac{\epsilon^{2}}{\| g(x_{k}) \|^{2}}} \end{array}
$$

$$
\begin{array}{rlr}{{\stackrel{(3.1.23)}{\leq} r_{k}^{2} - \frac{2 \epsilon}{\| g(x_{k}) \|^{2}}(f(x_{k}) - f^{*}) + \frac{\epsilon^{2}}{\| g(x_{k}) \|^{2}} \stackrel{(3.2.28)}{\leq} r_{k}^{2} - \frac{\epsilon^{2}}{\| g(x_{k}) \|^{2}}.}} \end{array}
$$

In Case B, we have

$$
\begin{array}{r}{r_{k + 1}^{2} \overset{(2.2.49)}{\leq} \left.x_{k} - \frac{\bar{f}(x_{k})}{\| \bar{g}(x_{k}) \|^{2}} \bar{g}(x_{k}) \right.^{2} = r_{k}^{2} - \frac{2 \bar{f}(x_{k})}{\| \bar{g}(x_{k}) \|^{2}} \langle \bar{g}(x_{k}), x_{k} - x^{*} \rangle + \frac{\bar{f}(x_{k})^{2}}{\| \bar{g}(x_{k}) \|^{2}}} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(3.1.23)}{\leq} r_{k}^{2} - \frac{\bar{f}(x_{k})^{2}}{\| \bar{g}(x_{k}) \|^{2}} \stackrel{(3.2.28)}{\leq} r_{k}^{2} - \frac{\epsilon^{2}}{\| \bar{g}(x_{k}) \|^{2}}.} \end{array}
$$

Thus, in both cases, $r_{k + 1} < r_{k} \le \| x_{0} - x^{*} \|$ . Hence,

$$
\| g(x_{k}) \| \leq M, k \in \mathcal I_{A}(N), \quad \| \bar{g}(x_{k}) \| \leq M, k \in \mathcal I_{B}(N).
$$

Therefore, $\begin{array}{r}{r_{k + 1}^{2} \le r_{k}^{2} - \frac{\epsilon^{2}}{M^{2}}} \end{array}$ for any $k = 0, \ldots, N$ . Summing up these inequalities, we get the inequality

$$
\begin{array}{r}{0 \le r_{N + 1}^{2} \le r_{0}^{2} - \frac{\epsilon^{2}}{M^{2}}(N + 1),} \end{array}
$$

which contradicts our assumption (3.2.26).

Comparing the bound (3.2.26) with the result of Theorem 3.2.1, we see that the scheme (3.2.24) has an optimal worst-case performance guarantee. Recall, that the same lower complexity bound was obtained for an unconstrained minimization problem. Thus, we can see that, from the viewpoint of analytical complexity, Convex Unconstrained Minimization is not easier than Constrained Minimization.

## 3.2.5 Approximating the Optimal Lagrange Multipliers

Let us show now that a simple subgradient switching strategy can be used for approximating the optimal Lagrange multipliers of problem (3.2.22) (see Theorem 3.1.26).

For $\epsilon > 0$ , denote by

$$
\mathcal{F}(\epsilon) = \{x \in Q : \f_{j}(x) \leq \epsilon, \j = 1, \ldots, m\}
$$

the extended feasible set of problem (3.2.22). Defining the Lagrangian

$$
{\mathcal{L}}(x, \lambda) = f(x) + \sum_{j = 1}^{m} \lambda^{(j)} f_{j}(x), \quad x \in{\mathcal{Q}}, \quad \lambda =(\lambda^{(1)}, \ldots, \lambda^{(m)}) \in{\mathbb R}_{+}^{m},
$$

we can introduce the Lagrangian dual problem

$$
\phi^{*} \stackrel{\mathrm{def}}{=} \operatorname{sup}_{\lambda \in \mathbb{R}_{+}^{m}} \phi(\lambda),\tag{3.2.29}
$$

where $\phi(\lambda) \stackrel{\mathrm{def}}{=} \operatorname{min}_{x \in \mathcal{Q}} \mathcal{L}(x, \lambda)$ . Clearly, $f^{*} \stackrel{(1.3.6)}{\geq} \phi^{*}$

In order to approach an optimal solution of problems (3.2.22), (3.2.29), we apply the following switching strategy. It has only one input parameter, the step size $h > 0$ In what follows, we use the notation $\| \cdot \|$ for the standard Euclidean norm, $g(\cdot)$ denotes the subgradient of the objective function, and $g_{j}(\cdot)$ denotes the subgradient of the corresponding constraints.

## Subgradient Method for Lagrange Multipliers

```latex
0. Choose a starting point $x_{0} \in Q.$
1. kth iteration $(k \geq 0)$
(a) Define $\begin{array}{r}{\mathcal{S}_{k} = \{j : f_{j}(x_{k}) > h \| g_{j}(x_{k}) \|\}.} \end{array}$
(b) If ${\mathcal{I}}_{k} = \emptyset.$ , then compute $\begin{array}{r}{x_{k + 1} = \pi_{Q} \left(x_{k} - \frac{hg(x_{k})}{\| g(x_{k}) \|} \right)} \end{array}$
(c) If ${\mathcal{I}}_{k} \neq \emptyset,$ , then choose arbitrary $j_{k} \in \mathcal{S}_{k}$ and define
$\begin{array}{r}{h_{k} = \frac{f_{j_{k}}(x_{k})}{\| g_{j_{k}}(x_{k}) \|^{2}}} \end{array}$ . Compute x<sub>k 1</sub> π<sub>Q</sub>(x<sub>k</sub> h<sub>k</sub>g<sub>j</sub> (x<sub>k</sub>)).
```

(3.2.30)

After $t \geq 0$ iterations, define $\mathcal{A}_{0}(t) = \{k \in \{0, \dots, t\} : \ \mathcal{I}_{k} = \emptyset\}$ and let

$$
\mathcal{A}_{j}(t) = \{k \in \{0, \ldots, t\} : \j_{k} = j\}, \quad 1 \leq j \leq m.
$$

Let $N(t) = | \mathcal{A}_{0}(t) |$ . It is possible that $N(t) = 0$ . However, if $N(t) > 0$ , then we can define the approximate dual multipliers as follows:

$$
\begin{array}{r}{\sigma_{t} = h \displaystyle \sum_{k \in \mathcal{A}_{0}(t)} \frac{1}{\| g(x_{k}) \|}, \quad \lambda_{t}^{(j)} = \frac{1}{\sigma_{t}} \displaystyle \sum_{k \in \mathcal{A}_{j}(t)} h_{k}, \quad j = 1, \dots, m.} \end{array}\tag{3.2.31}
$$

Let $S_{t} = \sum_{k \in \mathcal{A}_{0}(t)} \frac{1}{\| g(x_{k}) \|}.\operatorname{If} \mathcal{A}_{0}(t) = \varnothing.$ , then we define $S_{t} = 0$ . Thus, $\sigma_{t} = hS_{t}$

For proving convergence of the switching strategy (3.2.30), we are going to find an upper bound for the gap

$$
\begin{array}{r}{\delta_{t} = \frac{1}{S_{t}} \displaystyle \sum_{k \in \mathcal{A}_{0}(t)} \frac{f(x_{k})}{\| g(x_{k}) \|} - \phi(\lambda_{t}),} \end{array}
$$

assuming that $N(t) > 0$ . Here and in the sequel $\lambda_{t}$ denotes $(\lambda_{t}^{(1)}, \dots, \lambda_{t}^{(m)})$

Theorem 3.2.4 Let the set Q be bounded: $\| x - x_{0} \| \leq R$ for all $x \in Q$ . If the number of iterations t of method (3.2.30) is big enough,

$$
\begin{array}{r}{t > \frac{\mathbb{R}^{2}}{h^{2}},} \end{array}\tag{3.2.32}
$$

then $N(t) > 0.$ . Moreover, in this case

$$
\operatorname{max}_{1 \leq j \leq m} f_{j}(x_{k}) \leq Mh, \quad k \in \mathcal{A}_{0}(t),\tag{3.2.33}
$$

$$
\delta_{t} \leq Mh,
$$

where $M = \operatorname{max}_{0 \leq k \leq t} \operatorname{max}_{0 \leq j \leq m} \| g_{j}(x_{k}) \|$

Proof Note that

$$
\begin{array}{rl} &{\quad_{\sigma_{t} \setminus \delta_{t}} \quad \stackrel{(3, 2, 3, 1)}{=} \displaystyle \operatorname{max}{\left\{\sum_{k \in \mathcal{O}_{0}} \frac{hf(x_{k})}{\| g(x_{k}) \|} - \sigma_{t} f(x) - \sum_{j = 1}^{m} \sum_{k \in \mathcal{A}_{j}(t)} h_{k} f_{j}(x) \right\}}} \\ &{= \displaystyle \operatorname{max}_{x \in \mathcal{Q}} \left\{\sum_{k \in \mathcal{O}_{0}(t)} \frac{h(f(x_{k}) - f(x))}{\| g(x_{k}) \|} - \sum_{k \notin \mathcal{O}_{0}(t)} h_{k} f_{j_{k}}(x) \right\}} \\ &{\leq \displaystyle \operatorname{max}_{x \in \mathcal{Q}} \left\{\sum_{k \in \mathcal{O}_{0}(t)} \frac{h \langle g(x_{k}), x_{k} - x \rangle}{\| g(x_{k}) \|_{\infty}} + \sum_{k \notin \mathcal{O}_{0}(t)} h_{k}[\langle g_{j_{k}}(x_{k}), x_{k} - x \rangle - f_{j_{k}}(x_{k})] \right\}.} \end{array}\tag{3.2.34}
$$

Let us estimate from above the right-hand side of this inequality. For arbitrary $x \in Q$ , let $r_{k}(x) = \| x - x_{k} \|$ . Assume that $k \in \mathcal{A}_{0}(t)$ . Then

$$
\begin{array}{rl}{r_{k + 1}^{2}(x) \stackrel{(2.2.48)}{\leq} \Big \| x_{k} - x - \frac{hg(x_{k})}{\| g(x_{k}) \|} \Big \|^{2}} &{} \\{=} &{r_{k}^{2}(x) - \frac{2h}{\| g(x_{k}) \|} \langle g(x_{k}), x_{k} - x \rangle + h^{2}.} \end{array}\tag{3.2.35}
$$

If $k \notin \mathcal{A}_{0}(t)$ , then

$$
\begin{array}{rlr}{r_{k + 1}^{2}(x) \stackrel{(2.2.48)}{\leq} \| x_{k} - x - h_{k} g_{j_{k}}(x_{k}) \|^{2}} &{} & \\{=} &{r_{k}^{2}(x) - 2h_{k} \langle g_{j_{k}}(x_{k}), x_{k} - x \rangle + h_{k}^{2} \| g_{j_{k}}(x_{k}) \|^{2}.} &{} & \end{array}
$$

Hence,

$$
\begin{array}{rl} &{2h_{k}[\langle g_{j_{k}}(x_{k}), x_{k} - x \rangle - f_{j_{k}}(x_{k})] \leq r_{k}^{2}(x) - r_{k + 1}^{2}(x) - \frac{f_{j_{k}}^{2}(x_{k})}{\| g_{j_{k}}(x_{k}) \|^{2}}} \\ &{\qquad \leq r_{k}^{2}(x) - r_{k + 1}^{2}(x) - h^{2}.} \end{array}
$$

Summing up these inequalities and inequalities (3.2.35) for $k = 0, \ldots, t.$ , and taking into account that $r_{t + 1}(x) \geq 0$ , we get

$$
\begin{array}{rl}{\sigma_{t} \delta_{t}} &{\overset{(3.2.34)}{\leq} \frac{1}{2} r_{0}^{2}(x) + \frac{1}{2} N(t) h^{2} - \frac{1}{2}(t - N(t)) h^{2}} \\ &{} \\{=} &{\frac{1}{2} r_{0}^{2}(x) - \frac{1}{2} th^{2} + N(t) h^{2} \leq \frac{1}{2} \mathbb{R}^{2} - \frac{1}{2} th^{2} + N(t) h^{2}.} \end{array}\tag{3.2.36}
$$

Assume now that t satisfies the condition (3.2.32). In this case we cannot have $N(t) = 0$ since then $\sigma_{t} ~ = ~ 0$ and inequality (3.2.36) is violated. Thus, the first inequality in (3.2.33) follows from the conditions of Step (b) in method (3.2.30). Finally, $\sigma_{t} \overset{(3.2.31)}{\geq} \frac{h}{M} N(t)$ . Therefore, if $N(t) > 0$ and the iteration counter t satisfies inequality (3.2.32), then $\delta_{t} \stackrel{(3.2.36)}{\leq} \frac{N(t) h^{2}}{\sigma_{t}} \leq Mh$ □

## 3.2.6 Strongly Convex Functions

In Sect. 2.1.3, we introduced the notion of strong convexity for differentiable convex functions. We have seen that this additional assumption significantly accelerates optimization methods. Let us study the effect of this assumption on the class of nondifferentiable convex functions. For the sake of simplicity, we work in this section with standard Euclidean norm.

Definition 3.2.2 A function $f$ is called strongly convex on a convex set $Q$ if there exists a constant $\mu > 0$ such that for all $x, y \in Q$ and $\alpha \in[0, 1]$ we have

$$
\begin{array}{r}{f(\alpha x +(1 - \alpha) y) \leq \alpha f(x) +(1 - \alpha) f(y) - \frac{1}{2} \mu \alpha(1 - \alpha) \| x - y \|^{2}.} \end{array}\tag{3.2.37}
$$

For such functions, we use the notation $f \in \mathcal{S}_{\mu}^{0}(\mathcal{Q})$ . If in this inequality $\mu = 0$ , we get definition (3.1.2) of the usual convex function.

Note that for smooth convex functions we proved this inequality as one of the equivalent definitions (2.1.23).

Let us present the most important properties of strongly convex functions.

Lemma 3.2.3 Let $f \in \mathcal{S}_{\mu}^{0}(\mathcal{Q})$ . Then for any $x \in$ int Q and $y \in W$ , we have

$$
\begin{array}{r}{f(y) \geq f(x) + f^{\prime}(x; y - x) + \frac{1}{2} \mu \| x - y \|^{2}.} \end{array}\tag{3.2.38}
$$

Proof Indeed,

$$
\begin{array}{rl}{f(y) \overset{(3.2.37)}{\geq} \frac{1}{\alpha} \Big[f((1 - \alpha) x + \alpha y) -(1 - \alpha) f(x) + \frac{1}{2} \mu \alpha(1 - \alpha) \| x - y \|^{2} \Big]} &{} \\{\quad} &{} \\{= \quad f(x) + \frac{1}{\alpha}[f(x + \alpha(y - x)) - f(x)] + \frac{1}{2} \mu(1 - \alpha) \| y - x \|^{2}.} \end{array}
$$

Taking in this inequality the limit as $\alpha \downarrow 0.$ , we get inequality (3.2.38). The limit exists in view of Theorem 3.1.12.

Corollary 3.2.1 Let $f \in \mathcal{S}_{\mu}^{0}(Q)$ . For any $g \in \partial f(x)$ , we have

$$
\begin{array}{r}{f(y) \geq f(x) + \langle g, y - x \rangle + \frac{1}{2} \mu \| y - x \|^{2}.} \end{array}\tag{3.2.39}
$$

Proof Indeed, in view of Theorem 3.1.17, for any $g \in \partial f(x)$ we have

$$
f^{\prime}(x; y - x) \geq \langle g, y - x \rangle.\qquad \sqcap
$$

Corollary 3.2.2 If in problem (3.2.13) the objective function belongs to the class $\mathcal{S}_{\mu}^{0}(Q)$ , then its level sets are bounded. Hence, its optimal solution exists.

Corollary 3.2.3 Let $x^{*} \in$ int dom f be an optimal solution of problem (3.2.13) with $f \in \mathcal{S}_{\mu}^{0}.$ . Then for all $x \in Q$ , we have

$$
f(x) \geq f^{*} +{\textstyle{\frac{1}{2}} \mu} \| x - x^{*} \|^{2}.\tag{3.2.40}
$$

Hence, the solution of this problem is unique.

Proof Indeed, in view of Theorem 3.1.24, there exists a $g^{*} \in \partial f(x^{*})$ such that

$$
\langle g^{*}, y - x^{*} \rangle \geq 0.
$$

Thus, (3.2.40) follows from (3.2.39).

Let us describe the results of some operations with strongly convex functions.

1. Addition. If $f_{1} \in \mathcal{S}_{\mu_{1}}^{0}(Q)$ and $f_{2} \in \mathcal{S}_{\mu_{2}}^{0}(Q)$ , then for any $\alpha_{1}, \alpha_{2} \geq 0$ we have

$$
\alpha_{1} f_{1} + \alpha_{2} f_{2} \in \mathcal{S}_{\alpha_{1} \mu_{1} + \alpha_{2} \mu_{2}}^{0}(Q).
$$

(The proof follows directly from definition (3.2.37).) In particular, if we add a convex function and a strongly convex function with parameter $\mu$ , then we get a strongly convex function with the same value of parameter.

2. Maximum. If $f_{1} \in \mathcal{S}_{\mu_{1}}^{0}(Q)$ and $f_{2} \in \mathcal{S}_{\mu_{2}}^{0}(Q)$ , then

$$
f(x) = \operatorname{max} \{f_{1}(x), f_{2}(x)\} \ \in \{\mathcal{S}}_{\mu}^{0}(Q)
$$

with $\mu = \operatorname{min} \{\mu_{1}, \mu_{2}\}$ . Indeed, for any $x_{1}, x_{2} \in Q$ and $\alpha \in[0, 1]$ , we have

$$
\begin{array}{l}{f(\alpha x_{1} +(1 - \alpha) x_{2}) \le \operatorname{max} \{\alpha f_{1}(x_{1}) +(1 - \alpha) f_{1}(x_{2}) \qquad} \\{\qquad - \displaystyle \frac 12 \mu_{1} \alpha(1 - \alpha) \| x_{1} - x_{2} \|^{2}, \alpha f_{2}(x_{1}) +(1 - \alpha) f_{2}(x_{2})} \\{\qquad - \displaystyle \frac 12 \mu_{2} \alpha(1 - \alpha) \| x_{1} - x_{2} \|^{2}\}} \\{\qquad \le \alpha f(x_{1}) +(1 - \alpha) f(x_{2}) - \displaystyle \frac 12 \mu \alpha(1 - \alpha) \| x_{1} - x_{2} \|^{2}.} \end{array}
$$

3. Subtraction. If $f \in \mathcal{S}_{\mu}^{0}(Q)$ , then the function ${\hat{f}}(x) = f(x) -{\textstyle \frac{1}{2}} \mu \| x \|^{2}$ is convex. This fact follows from definition (3.2.37) and the Euclidean identity

$$
\begin{array}{r}{\frac{1}{2} \| \alpha x +(1 - \alpha) y \|^{2} \equiv \frac{1}{2} \alpha \| x \|^{2} + \frac{1}{2}(1 - \alpha) \| y \|^{2} - \frac{1}{2} \alpha(1 - \alpha) \| x - y \|^{2},} \end{array}\tag{3.2.41}
$$

which is valid for all x, $y \in \mathbb{R}^{n}$ and $\alpha \in[0, 1]$

Note also that any differentiable strongly convex function in the sense of (2.1.20) belongs to the class $\mathcal{S}_{\mu}^{0}(Q)$ (see Theorem 2.1.9).

Let us now derive the lower complexity bounds for problem (3.2.13) with a strongly convex objective function. For that, we are going to use the function $f_{k}(\cdot)$ defined by (3.2.3). We add to assumptions (3.2.2) on the problem class the following specification (compare with (3.2.7)).

- The function f is Lipschitz continuous on $B_{2}(x^{*}, \| x_{0} - x^{*} \|)$ with constant $M > 0.$

$$
\begin{array}{r}{\bullet \quad f \in \mathcal{S}_{\mu}^{0}(B_{2}(x^{*}, \| x_{0} - x^{*} \|)) \mathrm{~ with ~} \mu > 0.} \end{array}\tag{3.2.42}
$$

In what follows, we denote the class of problems satisfying assumptions (3.2.2), (3.2.42) by $\mathcal{P}_{s}(x_{0}, \mu, M)$

Theorem 3.2.5 For any class $\mathcal{P}_{s}(x_{0}, \mu, M)$ and any k, $0 \leq k \leq n - 1$ , there exists a function $f \in \mathcal{P}_{s}(x_{0}, \mu, M)$ such that

$$
\begin{array}{r}{f(x_{k}) - f^{*} \ge \frac{M^{2}}{2 \mu(2 + \sqrt{k + 1})^{2}}} \end{array}\tag{3.2.43}
$$

for any optimization scheme generating a sequence $\{x_{k}\}$ , which satisfies the condition

$$
x_{k} \in x_{0} + \operatorname{Lin}{\{g(x_{0}), \ldots, g(x_{k - 1})\}}.
$$

Proof In this proof, we use functions (3.2.3) with the resisting oracle (3.2.6).

Without loss of generality, we can take $x_{0} = 0$ . Let us choose $f(x) = f_{k + 1}(x)$ with parameter

$$
\begin{array}{r}{\gamma = \frac{M \sqrt{k + 1}}{2 + \sqrt{k + 1}}.} \end{array}\tag{3.2.44}
$$

In view of identity (3.2.41) function $f_{k}$ belongs to the class $\mathcal{S}_{\mu}^{0}(\mathbb{R}^{n})$ . At the same time,

$$
\begin{array}{r}{R_{k} \stackrel{\mathrm{def}}{=} \| x_{0} - x_{k}^{*} \| \stackrel{(3.2.5)}{=} \frac{\gamma}{\mu \sqrt{k + 1}} \stackrel{(3.2.44)}{=} \frac{M}{\mu(2 + \sqrt{k + 1})}.} \end{array}
$$

In view of (3.2.4), the Lipschitz constant of the function $f_{k}$ on the ball $B_{2}(x_{k}^{*}, R_{k})$ is bounded by

$$
\begin{array}{r}{2 \mu R_{k} + \gamma \stackrel{(3.2.44)}{=} \frac{2M}{2 + \sqrt{k + 1}} + \frac{M \sqrt{k + 1}}{2 + \sqrt{k + 1}} = M.} \end{array}
$$

Thus, optimization problem (3.2.13) with $\ * f = \ * f_{k + 1}$ belongs to the problem class $\mathcal{P}_{s}(x_{0}, \mu, M)$ . At the same time, in view of the condition of the theorem,

$$
\begin{array}{r}{f(x_{k}) - f^{*} \ge - f_{k + 1}^{*} \overset{(3.2.5)}{=} \frac{\gamma^{2}}{2 \mu(k + 1)} = \frac{M^{2}}{2 \mu(2 + \sqrt{k + 1})^{2}}.} \end{array}
$$

It appears that for our problem class the simplest subgradient method is suboptimal.

Theorem 3.2.6 Assume that the objective function f in problem (3.2.13) satisfies assumptions (3.2.42). Let $\epsilon > 0$ be the desired accuracy in the optimal value of this problem. Consider a sequence of points $\{x_{k}\} \subset Q$ generated by the following rule:

$$
\begin{array}{r}{x_{k + 1} = \pi_{\mathcal{Q}} \left(x_{k} - \frac{2 \epsilon g(x_{k})}{\| g(x_{k}) \|^{2}} \right), \quad k \ge 0,} \end{array}\tag{3.2.45}
$$

where $g(x_{k}) \in \partial f(x_{k})$ . Then, if the number of steps N of this scheme is big enough,

$$
\begin{array}{r}{N \ge \frac{M^{2}}{\mu \epsilon} \ln \frac{M \| x_{0} - x^{*} \|}{\epsilon},} \end{array}\tag{3.2.46}
$$

we have $f_{N}^{*} \stackrel{\mathrm{def}}{=} \operatorname{min}_{0 \leq k \leq N} f(x_{k}) \leq f^{*} + \epsilon.$

Proof Let $r_{k} = \| x_{k} - x^{*} \|$ and $\begin{array}{r}{h_{k} = \frac{2 \epsilon}{\| g(x_{k}) \|^{2}}} \end{array}$ . Assume that N satisfies the lower bound (3.2.46) and

$$
f(x_{k}) - f^{*} > \epsilon, \quad k = 0, \tiny{..., N}.\tag{3.2.47}
$$

Then

$$
\begin{array}{rl}{r_{k + 1}^{2} \stackrel{(2.2.49)}{\leq} \| x_{k} - h_{k} g(x_{k}) \|^{2} = r_{k}^{2} - 2h_{k} \langle g(x_{k}), x_{k} - x^{*} \rangle + \frac{4 \epsilon^{2}}{\| g(x_{k}) \|^{2}}} \end{array}
$$

$$
\begin{array}{rlr}{{\stackrel{(3.2.39)}{\leq} r_{k}^{2} - \frac{4 \epsilon}{\| g(x_{k}) \|^{2}}[f(x_{k}) - f^{*} + \frac{1}{2} \mu r_{k}^{2}] + \frac{4 \epsilon^{2}}{\| g(x_{k}) \|^{2}}}} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(3.2.47)}{\leq} \left(1 - \frac{2 \mu \epsilon}{\| g(x_{k}) \|^{2}} \right) r_{k}^{2}.} \end{array}
$$

Thus, all $x_{k} \in B(x^{*}, r_{0})$ and therefore $\| g(x_{k}) \| \leq M$ . This implies that

$$
\begin{array}{r}{\epsilon^{(3.2.47)} f(x_{N}) - f^{*} \ \leq Mr_{N} \ \leq \M \left(1 - \frac{2 \mu \epsilon}{M^{2}} \right)^{N / 2} r_{0} \ \leq \M \exp \left\{- \frac{\mu \epsilon N}{M^{2}} \right\} r_{0}.} \end{array}
$$

This contradicts the lower bound (3.2.46).

In view of our assumptions,

$$
\begin{array}{r}{\frac 12 \mu \| x_{0} - x^{*} \|^{2} \stackrel{(3.2.40)}{\leq} f(x_{0}) - f^{*} \leq M \| x_{0} - x^{*} \|.} \end{array}
$$

Therefore, $\| x_{0} - x^{*} \| ~ \leq ~ \frac{2M} \mu$ . Thus, the lower bound on the number of iterations (3.2.46) can be rewritten in terms of the class parameters in the following way:

$$
\begin{array}{r}{N \ge \frac{M^{2}}{\mu \epsilon} \ln \frac{2M^{2}}{\mu \epsilon}.} \end{array}\tag{3.2.48}
$$

Comparing it with the lower complexity bound (3.2.43), we can see that the Subgradient Method (3.2.45) is suboptimal. Its main advantage is independence on the exact values of the class parameters $\mu$ and M.

Note that the step sizes of method (3.2.45) are twice as big as those of method (3.2.24). If we divide the step sizes in (3.2.45) by two, then, for strongly convex functions, this method will be twice as slow. At the same time, this new

version will be identical to (3.2.24) with $m = 0$ , which is able to minimize Lipschitz continuous functions with simple set constraints (see Theorem 3.2.3).

## 3.2.7 Complexity Bounds in Finite Dimension

Let us look at the problems of Unconstrained Minimization again, assuming that their dimension is relatively small. This means that our computational resources allow us to perform a number of iterations of minimization schemes proportional to the dimension of the space of variables. What will be the lower complexity bounds in this case?

In this section, we obtain a finite-dimensional lower complexity bound for a problem which is closely related to minimization problems. This is the feasibility problem:

$$
\boxed{\begin{array}{rl} &{} \\{\mathrm{Find} x^{*} \in S,} \end{array}}\tag{3.2.49}
$$

where S is a closed convex set. We assume that this problem is endowed with a separation oracle, which answers our request at a point $\bar{x} \in \mathbb{R}^{n}$ in the following way.

- Either it reports that ${\bar{x}} \in S$

$\mathrm{Or},$ it returns a vector $\bar{g}$ , separating x from S:

$$
\langle{\bar{g}},{\bar{x}} - x \rangle \geq 0 \quad \forall x \in S.
$$

In order to measure the complexity of this problem, we introduce the following assumption.

Assumption 3.2.1 There exists a point $x^{*} \in S$ such that for some $\epsilon > 0$ the ball $B_{2}(x^{*}, \epsilon)$ belongs to $s$ .

For example, if we know an optimal value $f^{*}$ for problem (3.2.8), we can treat this problem as a feasibility problem with

$$
S = \{(t, x) \in \mathbb{R}^{n + 1} \mid t \geq f(x), t \leq f^{*} +{\bar{\epsilon}}, x \in Q\}.
$$

The relation between accuracy parameters $\bar{\epsilon}$ and $\epsilon$ in (3.2.2) can be easily obtained, using the assumption that $f$ is Lipschitz continuous. We leave the corresponding reasoning as an exercise for the reader.

Let us describe now a resisting oracle for problem (3.2.49). Taking into account the requests of the numerical method, this oracle forms a sequence of boxes $\{B_{k}\}_{k = 0}^{\infty}$ $B_{k + 1} \subset B_{k}$ , defined by their lower and upper bounds:

$$
B_{k} = \{x \in \mathbb{R}^{n} \mid a_{k} \leq x \leq b_{k}\}.
$$

For each box $B_{k}, k \geq 0$ , denote by $\begin{array}{r}{c_{k} = \frac{1}{2}(a_{k} + b_{k})} \end{array}$ its center. For each box $B_{k}$ $k \geq 1$ , the oracle creates an individual separating vector $g_{k}.\ \mathrm{Up}$ to the choice of sign, this is always a coordinate vector.

In the scheme below, we use two dynamic counters:

- m is the number of generated boxes.

- i is the active coordinate.

Denote by $\bar{e}_{n} \in \mathbb{R}^{n}$ the vector of all ones. The oracle starts from the following settings:

$$
a_{0} : = - R \bar{e}_{n}, \quad b_{0} : = R \bar{e}_{n}, \quad m : = 0, \quad i : = 1.
$$

Its input is an arbitrary test point $x \in \mathbb{R}^{n}$

```powershell
Resisting oracle for feasibility problem
If x $\notin \boldsymbol{B}_{0}$ then return a separator of x from $B_{0}$ else
1. Find the maximal $k \in[0, \ldots, m] : x \in B_{k}$
2. $\mathbf{H} k < m$ then return $g_{k}$ else Create a new box :
If $\boldsymbol{x}^{(i)} \ge c_{m}^{(i)}$ then $a_{m + 1} : = a_{m}$
$b_{m + 1} : = b_{m} +(c_{m}^{(i)} - b_{m}^{(i)}) e_{i}, \quad g_{m} : = e_{i}.$
else $a_{m + 1} : = a_{m} +(c_{m}^{(i)} - a_{m}^{(i)}) e_{i}.$
b<sub>m 1</sub> b<sub>m</sub>, g<sub>m</sub> e<sub>i</sub>.
m m 1 i i 1 If i > n then $i : = 1$
Return $g_{m}.$
```

This oracle implements a very simple strategy. Note that the next box $B_{m + 1}$ is always half of the last box $B_{m}$ . The last generated box $B_{m}$ is divided into two equal parts by a hyperplane, defined by the coordinate vector $e_{i}$ , which passes through $c_{m}$ the center of $B_{m}$ . Depending on the part of the box $B_{m}$ containing the point x, we choose the sign of the separation vector: $g_{m + 1} = \pm e_{i}$ . The new box $B_{m + 1}$ is always the half of the box $B_{m}$ which does not contain the test point x.

After creating a new box $B_{m + 1}$ , the index i is increased by 1. If its value exceeds n, we set again $i = 1$ . Thus, the sequence of boxes $\{B_{k}\}$ possesses two important properties:

$\begin{array}{r}{\operatorname{vol}_{n} B_{k + 1} = \frac{1}{2} \operatorname{vol}_{n} B_{k}.} \end{array}$

- For any $k \geq 0$ we have $\begin{array}{r}{b_{k + n} - a_{k + n} = \frac{1}{2}(b_{k} - a_{k})} \end{array}$

Note also that the number of generated boxes does not exceed the number of calls of the oracle.

Lemma 3.2.4 For all $k \geq 0$ we have the inclusion

$$
\begin{array}{r}{B_{2}(c_{k}, r_{k}) \subset B_{k}, \quad with \quad r_{k} = \frac{R}{2} \left(\frac{1}{2} \right)^{\frac{k}{n}}.} \end{array}\tag{3.2.50}
$$

Proof Indeed, for all $k \in[0, \ldots, n - 1]$ we have

$$
B_{k} \supset B_{n} = \{x \mid c_{n} -{\frac{1}{2}} R{\bar{e}}_{n} \leq x \leq c_{n} +{\frac{1}{2}} R{\bar{e}}_{n}\} \supset B_{2}(c_{n},{\frac{1}{2}} R).
$$

Therefore, for such k we have $B_{k} \supset B_{2}(c_{k},{\textstyle \frac{1}{2}} R)$ and (3.2.50) holds. Further, let $k = nl + p$ for some $p \in[0, \ldots, n - 1]$ . Since

$$
b_{k} - a_{k} = \left(\frac{1}{2} \right)^{l}(b_{p} - a_{p}),
$$

we conclude that

$$
B_{k} \supset B_{2} \left(c_{k},{\frac{1}{2}} R \left({\frac{1}{2}} \right)^{l} \right).
$$

It remains to note that $\begin{array}{r}{r_{k} \le \frac{1}{2} R \left(\frac{1}{2} \right)^{l}} \end{array}$ .

Lemma 3.2.4 immediately leads to the following complexity result.

Theorem 3.2.7 Consider a class of feasibility problems (3.2.49), which satisfy Assumption 3.2.1, and for which the feasible sets S are subsets of $B_{\infty}(0, R)$ . The lower analytical complexity bound for this class is

$$
n \ln{\frac{R}{2 \epsilon}}
$$

calls of the separation oracle.

Proof Indeed, we have seen that the number of generated boxes does not exceed the number of calls of the oracle. Moreover, in view of Lemma 3.2.4, after k iterations the last box contains the ball $B_{2}(c_{m_{k}}, r_{k})$ □

The lower complexity bound for minimization problem (3.2.8) can be obtained in a similar way. However, the corresponding reasoning is more complicated. Therefore we present here only the final result.

Theorem 3.2.8 A lower bound for the analytical complexity of the problem class formed by minimization problem (3.2.8) with $\begin{array}{rlr}{Q} &{{} \subseteq} &{B_{\infty}(0, R)} \end{array}$ and $f \in \dot{\mathcal{F}}_{M}^{0, 0}(B_{\infty}(0, R))$ , is n ln $\frac{MR}{8 \epsilon}$ calls of the oracle.

## 3.2.8 Cutting Plane Schemes

Let us look now at the following minimization problem with set constraint:

$$
\operatorname{min} \{f(x) \mid x \in Q\},\tag{3.2.51}
$$

where the function $f$ is convex on $\mathbb{R}^{n}$ , and $Q$ is a bounded closed convex set such that

$$
\operatorname{int} Q \neq \varnothing, \quad \operatorname{diam} Q = D < \infty.
$$

We assume that $Q$ is not simple and that our problem is equipped with a separation oracle. At any test point ${\bar{x}} \in \mathbb{R}^{n}$ , this oracle returns a vector $g(x)$ , which is either:

- a subgradient of $f$ at x, if $x \in Q$

- a separator of x from $Q, \operatorname{if} x \notin Q$

An important example of such a problem is a constrained minimization problem with functional constraints (3.2.22). We have seen that this problem can be rewritten as a problem with a single functional constraint (see (3.2.23)) defining the feasible set

$$
Q = \{x \in \mathbb{R}^{n} \mid{\bar{f}}(x) \leq 0\}.
$$

In this case, for $x \notin Q$ the oracle has to provide us with any subgradient ${\bar{g}} \in \partial{\bar{f}}(x)$ Clearly, $\bar{g}$ separates x from $Q$ (see Theorem 3.1.18).

Let us present the main property of finite-dimensional localization sets.

Consider a sequence $X ~ \equiv ~ \{x_{i}\}_{i = 0}^{\infty}$ belonging to the set $Q$ . Recall that the localization sets generated by this sequence are defined as follows:

$$
S_{0}(X) = Q,
$$

$$
S_{k + 1}(X) = \{x \in S_{k}(X) \mid \langle g(x_{k}), x_{k} - x \rangle \geq 0\}.
$$

Clearly, for any $k \geq 0$ we have $x^{*} \in S_{k}$ . Define

$$
v_{i} = v_{f}(x^{*}; x_{i})(\geq 0), \quad v_{k}^{*} = \operatorname{min}_{0 \leq i \leq k} \v_{i}.
$$

Denote by $\operatorname{vol}_{n} S$ the n-dimensional volume of the set $S \subset \mathbb{R}^{n}$

Theorem 3.2.9 For any $k \geq 0$ we have

$$
\begin{array}{r}{v_{k}^{*} \leq D \left[\frac{\operatorname{vol}_{n} S_{k}(X)}{\operatorname{vol}_{n} Q} \right]^{\frac{1}{n}}.} \end{array}
$$

Proof Let $\alpha = v_{k}^{*} / D \left(\leq 1 \right)$ . Since $Q \subseteq B_{2}(x^{*}, D)$ we have the following inclusion:

$$
(1 - \alpha) x^{*} + \alpha Q \subseteq(1 - \alpha) x^{*} + \alpha B_{2}(x^{*}, D) \ = \B_{2}(x^{*}, v_{k}^{*}).
$$

Since $Q$ is convex, we conclude that

$$
(1 - \alpha) x^{*} + \alpha Q \equiv[(1 - \alpha) x^{*} + \alpha Q] \bigcap Q \ \subseteq \B_{2}(x^{*}, v_{k}^{*}) \bigcap Q \subseteq S_{k}(X).
$$

$$
\mathrm{Therefore ~ vol}_{n} S_{k}(X) \ge \mathrm{vol}_{n}[(1 - \alpha) x^{*} + \alpha Q] = \alpha^{n} \mathrm{vol}_{n} Q.\quad \boxed{\Omega}
$$

Quite often, the set $Q$ is very complicated and it is difficult to work directly with the sets $S_{k}(X)$ . Instead, we can update some simple upper approximations of these sets. The process of generating such approximations is described by the following cutting plane scheme.

## General cutting plane scheme

0. Choose a bounded set $E_{0} \supseteq Q$

1. kth iteration $(k \geq 0)$

(a) Choose $y_{k} \in E_{k}$

(b) If $y_{k} \in{\cal Q}$ then compute $f(y_{k}), g(y_{k})$ . If $y_{k} \notin{\cal Q}$ , then compute $\bar{g}(y_{k})$ , which separates $y_{k}$ from $Q.$

(c) Set

$$
g_{k} = \left\{{\begin{array}{ll}{g(y_{k}),{\mathrm{if ~}} y_{k} \in Q,} \\{\qquad} \\{{\bar{g}}(y_{k}),{\mathrm{if ~}} y_{k} \notin Q.} \end{array}} \right.\tag{3.2.52}
$$

$$
{\mathrm{(d) ~ Choose ~}} E_{k + 1} \supseteq \{x \in E_{k} \mid \langle g_{k}, y_{k} - x \rangle \geq 0\}.
$$

Let us estimate the performance of this process. Consider the sequence $Y =$ $\{y_{k}\}_{k = 0}^{\infty}$ , involved in this scheme. Denote by X a subsequence of feasible points in the sequence $Y \colon X = Y \bigcap Q$ . Let us introduce the counter

i(k) number of points $y_{j}, 0 \leq j < k$ , such that $y_{j} \in Q$

Thus, if $i(k) > 0$ , then $X \neq \varnothing.$

Lemma 3.2.5 For any $k \geq 0,$ , we have $S_{i(k)} \subseteq E_{k}$

Proof Indeed, if $i(0) = 0$ , then $S_{0} = Q \subseteq E_{0}$ . Let us assume that $S_{i(k)} \subseteq E_{k}$ for some $k \geq 0$ . Then, at the next iteration there are two possibilities.

(a) $i(k + 1) = i(k)$ . This happens if and only if $y_{k} \notin Q$ . Then

$$
E_{k + 1} \supseteq \{x \in E_{k} \mid \langle \bar{g}(y_{k}), y_{k} - x \rangle \geq 0\}
$$

$$
\supseteq \{x \in S_{i(k + 1)} \mid \langle \bar{g}(y_{k}), y_{k} - x \rangle \geq 0\} \ : = \ : S_{i(k + 1)}
$$

since $Si(k{+} 1) \subseteq Q$ and $\bar{g}(y_{k})$ separates $y_{k}$ from $Q$

(b) $i(k + 1) = i(k) + 1$ . In this case $y_{k} \in{\cal Q}$ . Then

$$
E_{k + 1} \supseteq \{x \in E_{k} \mid \langle g(y_{k}), y_{k} - x \rangle \geq 0\}
$$

$$
\supseteq \{x \in S_{i(k)} \mid \langle g(y_{k}), y_{k} - x \rangle \geq 0\} \ : = \ : S_{i(k) + 1}
$$

since $y_{k} = x_{i(k)}$ $\square$

The above results immediately lead to the following important conclusion.

## Corollary 3.2.4

1. For any k such that $i(k) > 0,$ , we have

$$
\begin{array}{r}{v_{i(k)}^{*}(X) \leq D \left[\frac{\mathrm{vol}_{n} S_{i(k)}(X)}{\mathrm{vol}_{n} Q} \right]^{\frac{1}{n}} \leq D \left[\frac{\mathrm{vol}_{n} E_{k}}{\mathrm{vol}_{n} Q} \right]^{\frac{1}{n}}.} \end{array}
$$

2. If vol<sub>n</sub> $E_{k} < \mathbf{vol}_{n}$ Q, then $i(k) > 0$

Proof We have already proved the first statement. The second one follows from the inclusion $Q = S_{0} = S_{i(k)} \subseteq E_{k}$ , which is valid for all k such that $i(k) = 0$ □

Thus, if we manage to ensure $\mathrm{vol}_{n} E_{k} \ \to \0$ , then we obtain a convergent scheme. Moreover, the rate of decrease of the volume automatically defines the rate of convergence of the corresponding method. Clearly, we should try to decrease $\operatorname{vol}_{n} E_{k}$ as quickly as possible.

Historically, the first nonsmooth minimization method, implementing the idea of cutting planes, was the Center of Gravity Method. It is based on the following geometric idea.

Consider a bounded convex set $S \subset \mathbb{R}^{n}$ , int $S \neq \emptyset.$ Define the center of gravity of this set as

$$
\begin{array}{r}{cg(S) = \frac{1}{\mathrm{vol}_{n} S} \int \dxdx.} \end{array}
$$

It appears that any cutting plane passing through the center of gravity divides the set into two almost proportional pieces.

Lemma 3.2.6 Let g be a direction in $\mathbb{R}^{n}$ . Define

$$
S_{+} = \{x \in S \mid \langle g, cg(S) - x \rangle \geq 0\}.
$$

Then

$$
\begin{array}{r}{\frac{\operatorname{vol}_{n} S_{+}}{\operatorname{vol}_{n} S} \leq 1 - \frac{1}{e}.} \end{array}
$$

(We accept this result without proof.)

This observation naturally leads to the following minimization scheme.

Method of Centers of Gravity   
0. Set $S_{0} = Q.$   
1. kth iteration $(k \geq 0)$   
(a) Choose $x_{k} = cg(S_{k})$ and compute $f(x_{k}), g(x_{k})$   
(b) Set $S_{k + 1} = \{x \in S_{k} \mid \langle g(x_{k}), x_{k} - x \rangle \geq 0\}.$

Let us estimate the rate of convergence of this method. Define

$$
f_{k}^{*} = \operatorname{min}_{0 \leq j \leq k} f(x_{j}).
$$

Theorem 3.2.10 If f is Lipschitz continuous on $B_{2}(x^{*}, D)$ with constant M, then for any $k \geq 0$ we have

$$
\begin{array}{r}{f_{k}^{*} - f^{*} \leq MD \left(1 - \frac{1}{e} \right)^{\frac{k}{n}}.} \end{array}
$$

Proof The statement follows from Lemma 3.2.2, Theorem 3.2.9 and Lemma 3.2.6.

Comparing this result with the lower complexity bound of Theorem 3.2.8, we see that the method of centers of gravity is optimal in finite dimensions. Its rate of convergence does not depend on any individual characteristics of our problem like the condition number, etc. However, we should accept that this method is absolutely impractical, since the computation of the center of gravity in a high-dimensional space is a more difficult problem than the problem of Convex Optimization.

Let us look at another method, which uses the possibility of approximating the localization sets. This method is based on the following geometrical observation.

Let H be a positive definite symmetric $n \times n$ matrix. Consider the ellipsoid

$$
E(H,{\bar{x}}) = \{x \in \mathbb{R}^{n} \mid \langle H^{- 1}(x -{\bar{x}}), x -{\bar{x}} \rangle \leq 1\}.
$$

Let us choose a direction $g \in \mathbb{R}^{n}$ , and consider a half of the above ellipsoid, defined by the corresponding hyperplane:

$$
{\cal E}_{+} = \{x \in{\cal E}(H, \bar{x}) \mid \langle g, \bar{x} - x \rangle \geq 0\}.
$$

It turns out that this set belongs to another ellipsoid, whose volume is strictly smaller than the volume of $E(H,{\bar{x}})$

## Lemma 3.2.7 Define

$$
\begin{array}{r}{\bar{x}_{+} = \bar{x} - \frac{1}{n + 1} \cdot \frac{Hg}{\langle Hg, g \rangle^{1 / 2}},} \end{array}
$$

$$
\begin{array}{r}{H_{+} = \frac{n^{2}}{n^{2} - 1} \left(H - \frac{2}{n + 1} \cdot \frac{Hgg^{T} H}{\langle Hg, g \rangle} \right).} \end{array}
$$

Then $E_{+} \subset E(H_{+}, \bar{x}_{+})$ and

$$
\begin{array}{r}{\operatorname{vol}_{n} E(H_{+}, \bar{x}_{+}) \leq \left(1 - \frac{1}{(n + 1)^{2}} \right)^{\frac{n}{2}} \operatorname{vol}_{n} E(H, \bar{x}).} \end{array}
$$

Proof Let $G = H^{- 1}$ and $G_{+} = H_{+}^{- 1}$ . It is clear that

$$
\begin{array}{r}{G_{+} = \frac{n^{2} - 1}{n^{2}} \left(G + \frac{2}{n - 1} \cdot \frac{gg^{T}}{\langle Hg, g \rangle} \right).} \end{array}
$$

Without loss of generality we can assume that $\bar{x} = 0$ and $\langle Hg, g \rangle = 1$ . Suppose $x \in E_{+}$ . Note that $\begin{array}{r}{\bar{x}_{+} = - \frac{1}{n + 1} Hg} \end{array}$ . Therefore,

$$
\begin{array}{r}{\parallel x - \bar{x}_{+} \parallel_{G_{+}}^{2} = \frac{n^{2} - 1}{n^{2}} \left(\parallel x - \bar{x}_{+} \parallel_{G}^{2} + \frac{2}{n - 1} \langle g, x - \bar{x}_{+} \rangle^{2} \right),} \end{array}
$$

$$
\begin{array}{r}{\parallel{\boldsymbol{x}} - \bar{\boldsymbol{x}}_{+} \parallel_{G}^{2} = \parallel{\boldsymbol{x}} \parallel_{G}^{2} + \frac{2}{n + 1} \langle \boldsymbol{g},{\boldsymbol{x}} \rangle + \frac{1}{(n + 1)^{2}},} \end{array}
$$

$$
\begin{array}{r}{\langle g, x - \bar{x}_{+} \rangle^{2} = \langle g, x \rangle^{2} + \frac{2}{n + 1} \langle g, x \rangle + \frac{1}{(n + 1)^{2}}.} \end{array}
$$

Putting all the terms together, we obtain

$$
\begin{array}{r}{\parallel{x} - \bar{x}_{+} \parallel_{G_{+}}^{2} = \frac{n^{2} - 1}{n^{2}} \left(\parallel{x} \parallel_{G}^{2} + \frac{2}{n - 1} \langle g,{x} \rangle^{2} + \frac{2}{n - 1} \langle g,{x} \rangle + \frac{1}{n^{2} - 1} \right).} \end{array}
$$

Note that $\langle g, x \rangle \leq 0$ and $\|{x} \|_{G} \leq 1$ . Therefore

$$
\langle g, x \rangle^{2} + \langle g, x \rangle = \langle g, x \rangle(1 + \langle g, x \rangle) \leq 0.
$$

Hence,

$$
\begin{array}{r}{\parallel x - \bar{x}_{+} \parallel_{G_{+}}^{2} \leq \frac{n^{2} - 1}{n^{2}} \left(\parallel x \parallel_{G}^{2} + \frac{1}{n^{2} - 1} \right) \leq 1.} \end{array}
$$

Thus, we have proved that $E_{+} \subset E(H_{+}, \bar{x}_{+})$

Let us estimate the volume of $E(H_{+}, \bar{x}_{+})$

$$
\begin{array}{l}{\frac{\displaystyle \mathrm{vol}_{n} E(H_{+}, \bar{x}_{+})}{\displaystyle \mathrm{vol}_{n} E(H, \bar{x})} = \left[\frac{\operatorname{det} H_{+}}{\operatorname{det} H} \right]^{1 / 2} = \left[\left(\frac{n^{2}}{n^{2} - 1} \right)^{n} \frac{n - 1}{n + 1} \right]^{1 / 2}} \\{~ = \left[\frac{n^{2}}{n^{2} - 1} \left(1 - \frac{2}{n + 1} \right)^{\frac{n}{n}} \right]^{\frac{n}{2}} \le \left[\frac{n^{2}}{n^{2} - 1} \left(1 - \frac{2}{n(n + 1)} \right) \right]^{\frac{n}{2}}} \\{~ = \left[\frac{n^{2}(n^{2} + n - 2)}{n(n - 1)(n + 1)^{2}} \right]^{\frac{n}{2}} = \left[1 - \frac{1}{(n + 1)^{2}} \right]^{\frac{n}{2}}.~} \end{array}
$$

It turns out that the ellipsoid $E(H_{+}, \bar{x}_{+})$ is the ellipsoid of minimal volume containing half of the initial ellipsoid $E_{+}$

Our observations can be implemented in the following algorithmic scheme of the famous Ellipsoid Method.

## Ellipsoid Method

0. Choose $y_{0} \in \mathbb{R}^{n}$ and $R > 0$ such that $B_{2}(y_{0}, R) \supseteq Q$ . Set $H_{0} = \mathbb{R}^{2} \cdot I_{n}$

1. kth iteration $(k \geq 0)$

$$
g_{k} = \left\{{\begin{array}{ll}{g(y_{k}),{\mathrm{if ~}} y_{k} \in Q,} \\{\qquad} \\{{\bar{g}}(y_{k}),{\mathrm{if ~}} y_{k} \notin Q,} \end{array}} \right.\tag{3.2.53}
$$

$$
\begin{array}{r}{y_{k + 1} = y_{k} - \frac{1}{n + 1} \cdot \frac{H_{k} g_{k}}{\langle H_{k} g_{k}, g_{k} \rangle^{1 / 2}},} \end{array}
$$

$$
\begin{array}{r}{H_{k + 1} = \frac{n^{2}}{n^{2} - 1} \left(H_{k} - \frac{2}{n + 1} \cdot \frac{H_{k} g_{k} g_{k}^{T} H_{k}}{\langle H_{k} g_{k}, g_{k} \rangle} \right).} \end{array}
$$

This method can be seen as a particular implementation of the general cutting plane scheme (3.2.52) by choosing

$$
E_{k} = \{x \in \mathbb{R}^{n} \mid \langle H_{k}^{- 1}(x - y_{k}), x - y_{k} \rangle \leq 1\}
$$

with $y_{k}$ being the center of the ellipsoid.

Let us present an efficiency estimate for the Ellipsoid Method. Let $Y = \{y_{k}\}_{k = 0}^{\infty}$ and let X be a feasible subsequence of sequence $Y$

$$
X = Y \bigcap Q.
$$

Define $f_{k}^{*} = \operatorname{min}_{0 \le j \le k} f(x_{j})$

Theorem 3.2.11 Let the function f be Lipschitz continuous on $B_{2}(x^{*}, R)$ with some constant M. Then for $i(k) > 0$ , we have

$$
\begin{array}{r}{f_{i(k)}^{*} - f^{*} \leq MR \left(1 - \frac{1}{(n + 1)^{2}} \right)^{\frac{k}{2}} \cdot \left[\frac{\operatorname{vol}_{n} B_{2}(x_{0}, R)}{\operatorname{vol}_{n} Q} \right]^{\frac{1}{n}}.} \end{array}
$$

Proof The proof follows from Lemma 3.2.2, Corollary 3.2.4 and Lemma 3.2.7.

We need additional assumptions to guarantee $X \neq \emptyset$ . Assume that there exists some $\rho > 0$ and ${\bar{x}} \in Q$ such that

$$
B_{2}({\bar{x}}, \rho) \subseteq Q.\tag{3.2.54}
$$

Then

$$
\begin{array}{r}{\left[\frac{\mathrm{vol}_{n} E_{k}}{\mathrm{vol}_{n} \Q} \right]^{\frac{1}{n}} \le \left(1 - \frac{1}{(n + 1)^{2}} \right)^{\frac{k}{2}} \left[\frac{\mathrm{vol}_{n} B_{2}(x_{0}, R)}{\mathrm{vol}_{n} \Q} \right]^{\frac{1}{n}} \le \frac{1}{\rho} e^{- \frac{k}{2(n + 1)^{2}}} R.} \end{array}
$$

In view of Corollary 3.2.4, this implies that $i(k) > 0$ for all

$$
\begin{array}{r}{k > 2(n + 1)^{2} \ln{\frac{R}{\rho}}.} \end{array}
$$

If $i(k) > 0,$ , then

$$
\begin{array}{r}{f_{i(k)}^{*} - f^{*} \leq \frac{1}{\rho} MR^{2} \cdot e^{- \frac{k}{2(n + 1)^{2}}}.} \end{array}
$$

In order to ensure that (3.2.54) holds for a constrained minimization problem with functional constraints, it is enough to assume that all constraints are Lipschitz continuous and there is a feasible point at which all functional constraints are strictly negative (the Slater condition). We leave the details of the corresponding justification as an exercise for the reader.

Let us discuss now the total complexity of the Ellipsoid Method (3.2.53). Each iteration of this scheme is relatively cheap: it takes $O(n^{2})$ arithmetic operations. On the other hand, in order to generate an $\epsilon$-solution of problem (3.2.51), satisfying assumption (3.2.54), this method needs

$$
\begin{array}{r}{2(n + 1)^{2} \ln{\frac{MR^{2}}{\rho \epsilon}}} \end{array}
$$

calls of the oracle. This efficiency estimate is not optimal (see Theorem 3.2.8), but it has linear dependence on ln $\frac{1}{\epsilon}$ , and polynomial dependence on the dimension and the logarithms of the class parameters M, R and $\rho.$ . For problem classes, whose oracle also has a polynomial complexity, such algorithms are called (weakly) polynomial.

To conclude this section, note that there are several methods which work with localization sets in the form of the polytope:

$$
E_{k} = \{x \in \mathbb{R}^{n} \mid \langle a_{j}, x \rangle \leq b_{j}, \j = 1 \ldots m_{k}\}.
$$

Let us mention the most important methods of this type:

- Inscribed Ellipsoid Method. The point $y_{k}$ in this scheme is chosen as follows:

$$
y_{k} ={\mathrm{Center ~ of ~ the ~ maximal ~ ellipsoid ~}} W_{k} : \W_{k} \subset E_{k}.
$$

- Analytic Center Method. In this method, the point $y_{k}$ is chosen as the minimum of the analytic barrier

$$
F_{k}(x) = - \sum_{j = 1}^{m_{k}} \ln(b_{j} - \langle a_{j}, x \rangle).
$$

- . This is also a barrier-type scheme. The point $y_{k}$ is chosen as the minimum of the volumetric barrier

$$
V_{k}(x) = \ln \operatorname{det} \nabla^{2} F_{k}(x),
$$

where $F_{k}(\cdot)$ is the analytic barrier for the set $E_{k}$

All these methods are polynomial with complexity bound

$$
n \left(\ln \frac{1}{\epsilon} \right)^{p},
$$

where $p$ is either 1 or 2. However, the complexity of each iteration in these methods is much larger $(n^{3} - n^{4}$ arithmetic operations). In Chap. 5, we will see that the test points $y_{k}$ for these schemes can be efficiently computed by Interior-Point Methods.

## 3.3 Methods with Complete Data

(Nonsmooth models of objective function; Kelley’s method; The Level Method; Unconstrained minimization; Efficiency estimates; Problems with functional constraints.)

## 3.3.1 Nonsmooth Models of the Objective Function

In the previous section, we looked at several methods for solving the following problem:

$$
\operatorname{min}_{x \in Q} f(x),\tag{3.3.1}
$$

where $f$ is a Lipschitz continuous convex function and Q is a closed convex set. We have seen that the optimal method for problem (3.3.1) is the Subgradient Method (3.2.14), (3.2.16). Note that this conclusion is valid for the whole class of Lipschitz continuous functions. However, if we are going to minimize a particular function from this class, we can expect that it will not be as bad as in the worst case. We usually can hope that the actual performance of the minimization methods can be much better than the worst-case theoretical bound. Unfortunately, as far as the Subgradient Method is concerned, these expectations are too optimistic. The scheme of the Subgradient Method is very strict and in general it cannot converge faster than in theory. It can also be shown that the Ellipsoid Method (3.2.53) inherits this drawback of subgradient schemes. In practice it works more or less in accordance with its theoretical bound even when it is applied to a very simple function like $\parallel x \parallel^{2}$

In this section, we will discuss algorithmic schemes which are more flexible than the Subgradient Method and Ellipsoid Method. These schemes are based on the notion of a nonsmooth model of a convex objective function.

Definition 3.3.1 Let $X = \{x_{k}\}_{k = 0}^{\infty}$ be a sequence of points in Q. Define

$$
{\hat{f}}_{k}(X; x) = \operatorname{max}_{0 \leq i \leq k}{[f(x_{i}) + \langle g(x_{i}), x - x_{i} \rangle]},
$$

where $g(x_{i})$ are some subgradients of $f$ at $x_{i}$ . The function ${\hat{f}}_{k}(X; \cdot)$ is called a nonsmooth model of the convex function $f$

Note that $f_{k}(X; \cdot)$ is a piece-wise linear function. In view of inequality (3.1.23), we always have

$$
f(x) \ \geq \{\hat{f}}_{k}(X; x)
$$

for all $x \in \mathbb{R}^{n}$ . However, at all test points $x_{i}, 0 \leq i \leq k$ , we have

$$
f(x_{i}) ={\hat{f}}_{k}(X; x_{i}), \quad g(x_{i}) \in \partial{\hat{f}}_{k}(X; x_{i}).
$$

Moreover, the next model is always better than the previous one:

$$
{\hat{f}}_{k + 1}(X; x) \ \geq \{\hat{f}}_{k}(X; x)
$$

for all $x \in \mathbb{R}^{n}$

## 3.3.2 Kelley’s Method

The model ${\hat{f}}_{k}(X; \cdot)$ represents complete information on the function f accumulated after k calls of the oracle. Therefore, it seems natural to develop a minimization scheme, based on this object. Perhaps, the most natural method of this type is as follows.

## Kelley’s Method

0. Choose $x_{0} \in{Q}$

(3.3.2)

1. kth iteration (k 0).

$$
x_{k + 1} \in \mathop{\mathrm{Arg}} \operatorname{min}_{x \in Q} \ \hat{f}_{k}(X; x).
$$

Intuitively, this scheme looks very attractive. Even the presence of a complicated auxiliary problem is not too disturbing, since for polyhedral Q it can be solved by linear optimization methods in finite time. However, it turns out that this method cannot be recommended for practical applications. The main reason for this is its instability. Note that the solution of the auxiliary problem in method (3.3.2) may be not unique. Moreover, the whole set Arg min ${\hat{f}}_{k}(X; x)$ can be unstable with respect x Q to an arbitrary small variation of data $\{f(x_{i}), g(x_{i})\}$ . This feature results in unstable practical behavior of the scheme. At the same time, it can be used to construct an example of a problem for which method (3.3.2) has a very disappointing lower complexity bound.

Example 3.3.1 Consider the problem (3.3.1) with

$$
f(y, x) = \operatorname{max} \{\mid y \mid, \parallel x \parallel^{2}\}, \quad y \in \mathbb{R}, \x \in \mathbb{R}^{n},
$$

$$
Q = \{z =(y, x) : \y^{2} + \| \x \ \|^{2} \leq 1\},
$$

where the norm is standard Euclidean. Thus, the solution of this problem is $z^{*} =$ $(y^{*}, x^{*}) =(0, 0)$ , and the optimal value $f^{*} = 0$ . Denote by $Z_{k}^{*} = \bar{\mathrm{Arg}} \operatorname{min}_{z \in \mathcal{Q}} \hat{f}_{k}(Z; z)$ the optimal set of model $\hat{f}_{k}(Z; z)$ and let $\hat{f}_{k}^{*} = \hat{f}_{k}(Z_{k}^{*})$ be the optimal value of the model.

Let us choose $z_{0} =(1, 0)$ . Then the initial model of the function f is $\hat{f}_{0}(Z; z) =$ $y.$ Therefore, the first point, generated by Kelley’s method, is $z_{1} =(- 1, 0)$ . Hence, the next model of the function f is as follows:

$$
\hat{f}_{1}(Z; z) = \operatorname{max} \{y, - y\} = \mid y \mid.
$$

Clearly, $\hat{f}_{1}^{*} = 0$ . Note that $\hat{f}_{k + 1}^{*} \ge \hat{f}_{k}^{*}$ . On the other hand,

$$
\hat{f}_{k}^{*} \le f(z^{*}) = 0.
$$

Thus, for all consequent models with $k \geq 1$ , we will have $\hat{f}_{k}^{*} = 0$ and $Z_{k}^{*} =(0, X_{k}^{*})$ , where

$$
X_{k}^{*} = \{x \in B_{2}(0, 1) : \parallel x_{i} \parallel^{2} + \langle 2x_{i}, x - x_{i} \rangle \leq 0, i = 0 \ldots k\}.
$$

Let us estimate the efficiency of the cuts for the set $X_{k}^{*}$ . Since $x_{k + 1}$ can be an arbitrary point from $X_{k}^{*}$ , at the first stage of the method we can choose $x_{i}$ with the unit norms: $\parallel x_{i} \parallel = 1$ . Then the set $X_{k}^{*}$ is defined as follows:

$$
X_{k}^{*} = \{x \in B_{2}(0, 1) \mid \langle x_{i}, x \rangle \leq{\frac{1}{2}}, i = 0 \ldots k\}.
$$

We can do this if

$$
S_{2}(0, 1) \equiv \{x \in \mathbb{R}^{n} \mid \mid x \mid \mid x = 1\} \bigcap X_{k}^{*} \neq \emptyset.
$$

As far as this is possible, we can have

$$
f(z_{i}) \equiv f(0, x_{i}) = 1.
$$

Let us estimate the possible length of this stage using the following fact.

Let d be a direction in $\mathbb{R}^{n}, \parallel d \parallel = 1$ . Consider a surface   
1   
, 1 .   
n 1   
Then v(α)  vol<sub>n 1</sub>(S(α))  v(0) 1  α<sup>2</sup>! <sup>−2</sup> .

At the first stage, each step cuts from the sphere $S_{2}(0, 1)$ one of the segments $S_{d}({{\frac{1}{2}}})$ , at most. Therefore, we can continue the process for all $\begin{array}{r}{k \leq \left[\frac{2}{\sqrt{3}} \right]^{n - 1}} \end{array}$ . During these iterations we still have $f(z_{i}) = 1$

Since at the first stage of the process the cuts are $\begin{array}{r}{\left.x_{i}, x \right.\leq \frac{1}{2}} \end{array}$ , for all $k, 0 \leq k \leq$ $\begin{array}{r}{N \equiv \Big[\frac{2}{\sqrt{3}} \Big]^{n - 1}} \end{array}$ , we have

$$
B_{2}(0, \frac{1}{2}) \subset X_{k}^{*}.
$$

This means that after N iterations we can repeat our process with the ball $B_{2}(0, \frac{1}{2})$ etc. Note that $\begin{array}{r}{f(0, x) = \frac{1}{4}} \end{array}$ for all x from $B_{2}(0, \frac{1}{2})$

Thus, we prove the following lower bound for the Kelley’s method (3.3.2):

$$
f(x_{k}) - f^{*} \geq \left({\textstyle{\frac{1}{4}}} \right)^{k \left[{\frac{{\sqrt{3}}}{2}} \right]^{n - 1}}.
$$

This means that we cannot get an $\epsilon$-solution of our problem in fewer than

$$
{\frac{1}{2 \ln 2}} \left[{\frac{2}{\sqrt{3}}} \right]^{n - 1} \ln{\frac{1}{\epsilon}}
$$

calls of the oracle. It remains to compare this lower bound with the upper complexity bounds of other methods:

<table><tr><td rowspan=1 colspan=1>Ellipsoid method:</td><td rowspan=1 colspan=1> $O \left(n^{2} \ln \frac{1}{\epsilon} \right)$ </td></tr><tr><td rowspan=1 colspan=1>Optimal methods:</td><td rowspan=1 colspan=1> $\begin{array}{r}{O \left(n \ln{\frac{1}{\epsilon}} \right)} \end{array}$ </td></tr><tr><td rowspan=1 colspan=1>Gradient method:</td><td rowspan=1 colspan=1> $\begin{array}{rlr}{\mathrm{~}} &{{}} &{O \left(\frac{1}{\epsilon^{2}} \right)} \end{array}$ </td></tr></table>

## 3.3.3 The Level Method

Let us show that it is possible to work with a nonsmooth model of the objective function in a stable way. Define

$$
{\hat{f}}_{k}^{*} = \operatorname{min}_{x \in Q}{\hat{f}}_{k}(X; x), \quad f_{k}^{*} = \operatorname{min}_{0 \leq i \leq k} f(x_{i}).
$$

The first of these values is called the minimal value of the model, and the second one is the record value of the model. Clearly $\hat{f}_{k}^{*} \le f^{*} \le f_{k}^{*}$

Let us choose some $\alpha \in(0, 1)$ . Define

$$
\ell_{k}(\alpha) =(1 - \alpha) \hat{f}_{k}^{*} + \alpha f_{k}^{*}.
$$

Consider the level set

$$
{\mathcal{L}}_{k}(\alpha) = \{x \in Q \ | \{\hat{f}}_{k}(X; x) \leq \ell_{k}(\alpha)\}.
$$

Clearly, $\mathcal{L}_{k}(\boldsymbol{\alpha})$ is a closed convex set.

Note that the set $\mathcal{L}_{k}(\boldsymbol{\alpha})$ is certainly interesting for optimization schemes. Firstly, inside this set there is clearly no test point of the current model. Secondly, this set is stable with respect to a small perturbation of the data. Let us present a minimization method which deals directly with this level set.

```perl
Level Method
0. Choose a point x $\in \Q.$ , accuracy $\epsilon \ > \0.$ , and level
coefficient $\alpha \in(0, 1)$
1. kth iteration $(k \geq 0)$
(a) Compute $\hat{f}_{k}^{*}$ and $f_{k}^{*}$
(b) If $f_{k}^{*} - \hat{f}_{k}^{*} \le \epsilon$ , then STOP.
(c) Set $\boldsymbol{x}_{k + 1} = \pi_{\mathcal{L}_{k}(\boldsymbol{\alpha})}(\boldsymbol{x}_{k}).$
```

(3.3.3)

In this scheme, there are two potentially expensive operations. We need to compute an optimal value $\hat{f}_{k}^{*}$ of the current model. If Q is a polytope, then this value can be obtained from the following linear programming problem:

$$
\begin{array}{rl} &{\operatorname{min} \quad t,} \\ &{\mathrm{s.t.} ~ f(x_{i}) + \langle g(x_{i}), x - x_{i} \rangle \leq t, ~ i = 0 \dots k,} \\ &{\qquad \quad \quad x \in Q.} \end{array}
$$

We also need to compute the Euclidean projection $\pi_{\mathcal{L}_{k}(\boldsymbol{\alpha})}(\boldsymbol{x}_{k})$ . If $Q$ is a polytope, then this is a quadratic programming problem:

$$
\begin{array}{rl} &{\operatorname{min} \quad \parallel x - x_{k} \parallel^{2},} \\ &{\mathrm{s.t.} \f(x_{i}) + \langle g(x_{i}), x - x_{i} \rangle \leq \ell_{k}(\alpha), \i = 0 \ldots k,} \\ &{\qquad x \in Q.} \end{array}
$$

Both problems are solvable either by a standard simplex-type method, or by Interior-Point Methods (see Chap. 5).

Let us look at some properties of the Level Method. Recall that the optimal values of the model increase, and the record values decrease:

$$
\hat{f}_{k}^{*} \le \hat{f}_{k + 1}^{*} \le f^{*} \le f_{k + 1}^{*} \le f_{k}^{*}.
$$

Let $\varDelta_{k} =[\hat{f}_{k}^{*}, f_{k}^{*}]$ and $\delta_{k} = f_{k}^{*} - \hat{f}_{k}^{*}$ . We call $\delta_{k}$ the gap of the model ${\hat{f}}_{k}(X; x)$ Then

$$
\begin{array}{r}{\Delta_{k + 1} \subseteq \Delta_{k}, \quad \delta_{k + 1} \leq \delta_{k}.} \end{array}
$$

The next result is crucial for the analysis of the Level Method.

Lemma 3.3.1 Assume that for some $p \geq k$ the gap is still big enough:

$$
\delta_{p} \geq(1 - \alpha) \delta_{k}.
$$

Then for all i, $k \leq i \leq p,$ , we have $\ell_{i}(\alpha) \geq \hat{f}_{p}^{*}$

Proof Note that for all such i, we have $\delta_{\cal P} \geq(1 - \alpha) \delta_{k} \geq(1 - \alpha) \delta_{i}$ . Therefore,

$$
\ell_{i}(\alpha) = f_{i}^{*} -(1 - \alpha) \delta_{i} \geq f_{p}^{*} -(1 - \alpha) \delta_{i} = \hat{f}_{p}^{*} + \delta_{p} -(1 - \alpha) \delta_{i} \geq \hat{f}_{p}^{*}.
$$

Let us show that the steps of Level Method are large enough. Define

$$
M_{f} = \operatorname{max} \{\parallel \g \parallel | g \in \partial f(x), x \in Q\}.
$$

Lemma 3.3.2 For the sequence of points $\{x_{k}\}$ generated by the Level Method, we have

$$
\begin{array}{r}{\parallel \boldsymbol{x}_{k + 1} - \boldsymbol{x}_{k} \parallel \geq \frac{(1 - \alpha) \delta_{k}}{M_{f}}.} \end{array}
$$

Proof Indeed,

$$
\begin{array}{rl} &{f(x_{k}) -(1 - \alpha) \delta_{k} \geq f_{k}^{*} -(1 - \alpha) \delta_{k} = \ell_{k}(\alpha)} \\ &{} \\ &{\qquad \geq \hat{f}_{k}(x_{k + 1}) \geq f(x_{k}) + \langle g(x_{k}), x_{k + 1} - x_{k} \rangle} \\ &{} \\ &{\qquad \geq f(x_{k}) - M_{f} \parallel x_{k + 1} - x_{k} \parallel.} \end{array}
$$

□

Finally, we need to show that the gap of the model is decreasing.

Lemma 3.3.3 Let the set Q in problem (3.3.1) be bounded: diam $Q \le D$ . If for some $p \geq k$ we have $\delta_{p} \geq(1 - \alpha) \delta_{k}$ , then

$$
\begin{array}{r}{p + 1 - k \le \frac{M_{f}^{2} D^{2}}{(1 - \alpha)^{2} \delta_{p}^{2}}.} \end{array}
$$

Proof Let $x_{p}^{*} \in \mathrm{Arg}$ min $\hat{f}_{p}(X; x)$ . In view of Lemma 3.3.1, we have x Q

$$
\hat{f}_{i}(X; x_{p}^{*}) \leq \hat{f}_{p}(X; x_{p}^{*}) = \hat{f}_{p}^{*} \leq \ell_{i}(\alpha)
$$

for all i, $k \leq i \leq p$ . Therefore, in view of Lemma 2.2.8 and Lemma 3.3.2, we get

$$
\begin{array}{r}{\parallel{} x_{i + 1} - x_{p}^{*} \parallel^{2} \leq \parallel{} x_{i} - x_{p}^{*} \parallel^{2} - \parallel{} x_{i + 1} - x_{i} \parallel^{2} \leq \parallel{} x_{i} - x_{p}^{*} \parallel^{2} - \frac{(1 - \alpha)^{2} \delta_{i}^{2}}{M_{f}^{2}}} \end{array}
$$

$$
\leq \Vert \x_{i} - x_{p}^{*} \Vert^{2} - \frac{(1 - \alpha)^{2} \delta_{p}^{2}}{M_{f}^{2}}.
$$

Summing up these inequalities in $i = k \ldots p.$ , we get

$$
\begin{array}{r}{(p + 1 - k) \frac{(1 - \alpha)^{2} \delta_{p}^{2}}{M_{f}^{2}} \le \parallel x_{k} - x_{p}^{*} \parallel^{2} \le D^{2}.\qquad \perp} \end{array}
$$

Note that the number of indices in the segment $[k, p]$ is equal to $p + 1 - k$ . Now we can prove the efficiency estimate of the Level Method.

Theorem 3.3.1 Let diam $Q = D$ . Then Level Method terminates after

$$
\begin{array}{r}{N = \left\lfloor \frac{M_{f}^{2} D^{2}}{\epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)} \right\rfloor + 1} \end{array}
$$

iterations at most. The termination criterion of the method guarantees $f_{k}^{*} - f^{*} \leq \epsilon$

Proof Assume that $\delta_{k} \geq \epsilon, 0 \leq k \leq N$ . Let us represent the whole set of indices in decreasing order as a union of $m + 1$ groups,

$$
\{N, \ldots, 0\} = I(0) \bigcup I(1) \bigcup \cdots \bigcup I(m),
$$

such that

$$
I(j) =[p(j), k(j)], \quad p(j) \geq k(j), \quad j = 0 \ldots m,
$$

$$
p(0) = N, \quad p(j + 1) = k(j) - 1, \quad k(m) = 0,
$$

$$
\begin{array}{r}{\delta_{k(j)} \le \frac{1}{1 - \alpha} \delta_{p(j)} < \delta_{k(j) + 1} \equiv \delta_{p(j + 1)}.} \end{array}
$$

Clearly, for $j \geq 0$ we have

$$
\begin{array}{r}{\delta_{p(j + 1)} \geq \frac{\delta_{p(j)}}{1 - \alpha} \geq \frac{\delta_{p(0)}}{(1 - \alpha)^{j + 1}} \geq \frac{\epsilon}{(1 - \alpha)^{j + 1}}.} \end{array}
$$

In view of Lemma 3.3.3, $n(j) = p(j) + 1 - k(j)$ is bounded:

$$
\begin{array}{r}{n(j) \le \frac{M_{f}^{2} D^{2}}{(1 - \alpha)^{2} \delta_{p(j)}^{2}} \le \frac{M_{f}^{2} D^{2}}{\epsilon^{2}(1 - \alpha)^{2}}(1 - \alpha)^{2j}.} \end{array}
$$

Therefore,

$$
\begin{array}{r}{N = \displaystyle \sum_{j = 0}^{m} n(j) \le \frac{M_{f}^{2} D^{2}}{\epsilon^{2}(1 - \alpha)^{2}} \displaystyle \sum_{j = 0}^{m}(1 - \alpha)^{2j} \le \frac{M_{f}^{2} D^{2}}{\epsilon^{2}(1 - \alpha)^{2}(1 -(1 - \alpha)^{2})}.} \end{array}
$$

Let us discuss the above efficiency estimate. Note that we can obtain the optimal value of the level parameter α from the following maximization problem:

$$
(1 - \alpha)^{2}(1 -(1 - \alpha)^{2}) ~ \to ~ \operatorname{max}_{\alpha \in[0, 1]}.
$$

Its solution is $\begin{array}{r}{\alpha^{*} = \frac{1}{2 + \sqrt{2}} \approx 0.2929} \end{array}$ . Under this choice, we have the following <sup>+</sup>efficiency bound of the Level Method:

$$
\begin{array}{r}{N \le \frac{4}{\epsilon^{2}} M_{f}^{2} D^{2}.} \end{array}
$$

Comparing this result with Theorem 3.2.1, we see that Level Method is optimal uniformly in the dimension of the space of variables. Note that the analytical complexity bound of this method in finite dimensions is not known.

One of the advantages of this method is that the gap $\delta_{k} = f_{k}^{*} - \hat{f}_{k}^{*}$ provides us with an exact estimate of the current accuracy. Usually, this gap converges to zero much faster than in the worst case situation. For the majority of real-life optimization problems, the accuracy $\epsilon = 10^{- 4} - 10^{- 5}$ is obtained by the method after 3n to 4n iterations.

## 3.3.4 Constrained Minimization

Let us show how to use piece-wise linear models to solve constrained minimization problems. Consider the problem

$$
\begin{array}{c}{\displaystyle{\operatorname{min}_{x \in Q} f(x),}} \\{\displaystyle{}} \\{\mathrm{s.t.~} f_{j}(x) \leq 0, \j = 1 \ldots m,} \end{array}\tag{3.3.4}
$$

where $Q$ is a bounded closed convex set, and functions $f(\cdot), f_{j}(\cdot)$ are Lipschitz continuous on $Q$

Let us rewrite this problem as a problem with a single functional constraint. Define ${\bar{f}}(x) = \operatorname{max}_{1 \leq j \leq m} \f_{j}(x)$ . Then we obtain the equivalent problem

$$
\begin{array}{rl} &{\underset{x \in Q}{\operatorname{min}} \quad f(x),} \\ &{} \\ &{\mathrm{s.t.} ~ \bar{f}(x) \leq 0.} \end{array}\tag{3.3.5}
$$

Note that the functions $f(\cdot)$ and $\bar{f}(\cdot)$ are convex and Lipschitz continuous. In this section, we will try to solve (3.3.5) using the models for both of them.

Let us define the corresponding models. Consider a sequence $\begin{array}{r}{X \ = \ \{x_{k}\}_{k = 0}^{\infty}.} \end{array}$ Define

$$
{\hat{f}}_{k}(X; x) = \operatorname{max}_{0 \leq j \leq k}{[f(x_{j}) + \langle g(x_{j}), x - x_{j} \rangle]} \leq f(x),
$$

$$
\check{f}_{k}(X; x) = \operatorname{max}_{0 \leq j \leq k} \[\bar{f}(x_{j}) + \langle \bar{g}(x_{j}), x - x_{j} \rangle] \leq \bar{f}(x),
$$

where $g(x_{j}) \in \partial f(x_{j})$ and $\bar{g}(x_{j}) \in \partial \bar{f}(x_{j})$

As in Sect. 2.3.4, our scheme is based on the parametric function

$$
f(t; x) = \operatorname{max} \{f(x) - t,{\bar{f}}(x)\},
$$

$$
f^{*}(t) = \operatorname{min}_{x \in Q} f(t; x).
$$

Recall that $f^{*}(t)$ is nonincreasing in t. Let $x^{*}$ be a solution to (3.3.5). Let $t^{*} =$ $f(x^{*})$ . Then $t^{*}$ is the smallest root of thte function $f^{*}(t)$

Using the models for the objective function and the constraint, we can introduce a model for the parametric function. Define

$$
f_{k}(X; t, x) = \operatorname{max} \{\hat{f}_{k}(X; x) - t, \check{f}_{k}(X; x)\} \leq f(t; x),
$$

$$
{\hat{f}}_{k}^{*}(X; t) = \operatorname{min}_{x \in Q} f_{k}(X; t, x) \leq f^{*}(t).
$$

Again, $\hat{f}_{k}^{*}(X; t)$ is nonincreasing in t . It is clear that its smallest root $t_{k}^{*}(X)$ does not exceed $t^{*}$

We will need the following characterization of the root $t_{k}^{*}(X)$

Lemma 3.3.4

$$
t_{k}^{*}(X) = \operatorname{min}_{x \in Q} \{\hat{f}_{k}(X; x) \mid \check{f}_{k}(X; x) \le 0\}.
$$

Proof Denote by $\hat{x}_{k}^{*}$ the solution of the minimization problem in the above equation and let $\hat{t}_{k}^{*} = \hat{f}_{k}(X; \hat{x}_{k}^{*})$ be its optimal value. Then

$$
\hat{f}_{k}^{*}(X; \hat{t}_{k}^{*}) \leq \operatorname{max} \{\hat{f}_{k}(X; \hat{x}_{k}^{*}) - \hat{t}_{k}^{*}, \check{f}_{k}(X; \hat{x}_{k}^{*})\} \leq 0.
$$

Thus, we always have $\widehat{t}_{k}^{*} \geq t_{k}^{*}(X)$

Assume that $\hat{t}_{k}^{*} > t_{k}^{*}(X)$ . Then there exists a point y such that

$$
\hat{f}_{k}(X; y) - t_{k}^{*}(X) \leq 0, \quad \check{f}_{k}(X; y) \leq 0.
$$

However, in this case $\widehat{t}_{k}^{*} \ = \ \widehat{f}_{k}(X; \widehat{x}_{k}^{*}) \ \le \ \widehat{f}_{k}(X; y) \ \le \t_{k}^{*}(X) \ < \ \widehat{t}_{k}^{*}$ . This is a contradiction.

In our analysis, we will also need the function

$$
f_{k}^{*}(X; t) = \operatorname{min}_{0 \leq j \leq k} f_{k}(X; t, x_{j}),
$$

the record value of our parametric model.

Lemma 3.3.5 Let $t_{0} < t_{1} \le t^{*}$ . Assume that $\hat{f}_{k}^{*}(X; t_{1}) > 0.$ . Then $t_{k}^{*}(X) > t_{1}$ and

$$
\begin{array}{r}{\hat{f}_{k}^{*}(X; t_{0}) \geq \hat{f}_{k}^{*}(X; t_{1}) + \frac{t_{1} - t_{0}}{t_{k}^{*}(X) - t_{1}} \hat{f}_{k}^{*}(X; t_{1}).} \end{array}\tag{3.3.6}
$$

Proof Let $x_{k}^{*}(t) \in \mathrm{Arg}$ min $\begin{array}{r}{f_{k}(X; t, x), t_{2} = t_{k}^{*}(X), \alpha = \frac{t_{1} - t_{0}}{t_{2} - t_{0}} \in[0, 1] \mathrm{~}} \end{array}$ . Then

$$
t_{1} =(1 - \alpha) t_{0} + \alpha t_{2}
$$

and inequality (3.3.6) is equivalent to the following:

$$
\hat{f}_{k}^{*}(X; t_{1}) \leq(1 - \alpha) \hat{f}_{k}^{*}(X; t_{0}) + \alpha \hat{f}_{k}^{*}(X; t_{2})\tag{3.3.7}
$$

(note that $\hat{f}_{k}^{*}(X; t_{2}) = 0).\operatorname{Let} x_{\alpha} =(1 - \alpha) x_{k}^{*}(t_{0}) + \alpha x_{k}^{*}(t_{2})$ . Then we have

$$
\begin{array}{rl} &{\qquad \hat{f}_{k}^{*}(X; t_{1}) \leq \operatorname{max} \{\hat{f}_{k}(X; x_{\alpha}) - t_{1}\} \ddot{\mathcal{f}}_{k}(X; x_{\alpha})\}} \\ &{\leq \operatorname{max} \{(1 - \alpha)(\hat{f}_{k}(X; x_{k}^{*}(t_{0})) - t_{0}) + \alpha(\hat{f}_{k}(X; x_{k}^{*}(t_{2})) - t_{2})\}} \\ &{\qquad(1 - \alpha) \check{f}_{k}(X; x_{k}^{*}(t_{0})) + \alpha \check{f}_{k}(X; x_{k}^{*}(t_{2}))\}} \\ &{\leq(1 - \alpha) \operatorname{max} \{\hat{f}_{k}(X; x_{k}^{*}(t_{0})) - t_{0}\} \ddot{\mathcal{f}}_{k}(X; x_{k}^{*}(t_{0}))\}} \\ &{\qquad + \alpha \operatorname{max} \{\hat{f}_{k}(X; x_{k}^{*}(t_{2})) - t_{2}\} \ddot{\mathcal{f}}_{k}(X; x_{k}^{*}(t_{2}))\}} \\ &{\qquad =(1 - \alpha) \hat{f}_{k}^{*}(X; t_{0}) + \alpha \hat{f}_{k}^{*}(X; t_{2}),} \end{array}
$$

and we get (3.3.7).

We also need the following statement (compare with Lemma 2.3.5).

Lemma 3.3.6 For any $\varDelta \geq 0,$ , we have

$$
f^{*}(t) - \varDelta \leq f^{*}(t + \varDelta),
$$

$$
\hat{f}_{k}^{*}(X; t) - \varDelta \leq \hat{f}_{k}^{*}(X; t + \varDelta).
$$

Proof Indeed, for $f^{*}(t)$ we have

$$
\begin{array}{l}{f^{*}(t + \varDelta) = \underset{x \in Q}{\operatorname{min}} \left[\operatorname{max} \{f(x) - t; \bar{f}(x) + \varDelta\} - \varDelta \right]} \\{\quad} \\{\quad \geq \underset{x \in \mathcal{Q}}{\operatorname{min}} \left[\operatorname{max} \{f(x) - t; \bar{f}(x)\} - \varDelta \right] = f^{*}(t) - \varDelta.} \end{array}
$$

The proof of the second inequality is similar.

Now we are ready to present a constrained minimization scheme (compare with the constrained minimization scheme of Sect. 2.3.5).

## Constrained Level Method

0. Choose $x_{0} \in Q, t_{0} < t^{*}, \varkappa \in(0, \frac{1}{2})$ , and accuracy $\epsilon > 0$

1. kth iteration $(k \geq 0)$

(a) Keep generating the sequence $X = \{x_{j}\}_{j = 0}^{\infty}$ by the Level Method as applied to the function $\dot{\boldsymbol{f}}(t_{k}; \boldsymbol{x})$ . If the internal termination criterion

$$
\hat{f}_{j}^{*}(X; t_{k}) \ge(1 - \varkappa) f_{j}^{*}(X; t_{k})\tag{3.3.8}
$$

holds, then stop the internal process and set $j(k) = j.$ Global stop: $f_{i}^{*}(X; t_{k}) \leq \epsilon$

(b) Set $t_{k + 1} = t_{j(k)}^{*} \ '(X)$

We are interested in the analytical complexity of this method. Therefore, the complexity of the computation of the root $t_{j}^{*}(X)$ and of the value $\hat{f}_{j}^{*}(X; t)$ is not important for us now. We need to estimate the rate of convergence of the master process and the complexity of Step 1(a).

Let us start from the master process.

Lemma 3.3.7 For all $k \geq 0$ , we have

$$
\begin{array}{r}{f_{j(k)}^{*}(X; t_{k}) \leq \frac{t_{0} - t^{*}}{1 - \varkappa} \left[\frac{1}{2(1 - \varkappa)} \right]^{k}.} \end{array}
$$

Proof Define

$$
\begin{array}{r}{\sigma_{k} = \frac{f_{j(k)}^{*}(X; t_{k})}{\sqrt{t_{k + 1} - t_{k}}}, \quad \beta = \frac{1}{2(1 - \varkappa)} \quad(< 1).} \end{array}
$$

Since $t_{k + 1} = t_{j(k)}^{*}(X)$ , in view of Lemma 3.3.5, for all $k \geq 1$ , we have

$$
\begin{array}{rlr} &{} &{\sigma_{k - 1} = \frac{1}{\sqrt{t_{k} - t_{k - 1}}} f_{j(k - 1)}^{*}(X; t_{k - 1}) \geq \frac{1}{\sqrt{t_{k} - t_{k - 1}}} \hat{f}_{j(k)}^{*}(X; t_{k - 1})} \\ &{} &{\qquad \geq \frac{2}{\sqrt{t_{k + 1} - t_{k}}} \hat{f}_{j(k)}^{*}(X; t_{k}) \geq \frac{2(1 - x)}{\sqrt{t_{k + 1} - t_{k}}} f_{j(k)}^{*}(X; t_{k}) = \frac{\sigma_{k}}{\beta}.} \end{array}
$$

Thus, $\sigma_{k} \le \beta \sigma_{k - 1}$ and we obtain

$$
\begin{array}{rl} &{f_{j(k)}^{*}(X; t_{k}) = \sigma_{k} \sqrt{t_{k + 1} - t_{k}} \leq \beta^{k} \sigma_{0} \sqrt{t_{k + 1} - t_{k}}} \\ &{} \\ &{\qquad = \beta^{k} f_{j(0)}^{*}(X; t_{0}) \sqrt{\frac{t_{k + 1} - t_{k}}{t_{1} - t_{0}}}.} \end{array}
$$

Further, in view of Lemma 3.3.6, $t_{1} - t_{0} \geq \hat{f}_{j(0)}^{*}(X; t_{0})$ . Therefore,

$$
\begin{array}{rl} &{f_{j(k)}^{*}(X; t_{k}) \leq \beta^{k} f_{j(0)}^{*}(X; t_{0}) \sqrt{\frac{t_{k + 1} - t_{k}}{\widehat f_{j(0)}^{*}(X; t_{0})}} \ \leq \ \frac{\beta^{k}}{1 - x} \sqrt{\widehat f_{j(0)}^{*}(X; t_{0})(t_{k + 1} - t_{k})}} \\ &{} \\ &{\qquad \leq \frac{\beta^{k}}{1 - x} \sqrt{f^{*}(t_{0})(t_{0} - t^{*})}.} \end{array}
$$

It remains to note that $f^{*}(t_{0}) \leq t_{0} - t^{*}$ (see Lemma 3.3.6).

Let the Global Stop condition in (3.3.8) be satisfied: $f_{j}^{*}(X; t_{k}) \leq \epsilon$ . Then there exists a $j^{*}$ such that

$$
f(t_{k}; x_{j^{*}}) = f_{j}^{*}(X; t_{k}) \le \epsilon.
$$

Therefore, we have

$$
f(t_{k}; x_{j^{*}}) = \operatorname{max} \{f(x_{j^{*}}) - t_{k};{\bar{f}}(x_{j^{*}})\} \leq \epsilon.
$$

Since $t_{k} \leq t^{*}$ , we conclude that

$$
\begin{array}{l}{{f(x_{j^{*}}) \leq t^{*} + \epsilon,}} \\{{\}} \\{{\bar{f}(x_{j^{*}}) \leq \epsilon.}} \end{array}\tag{3.3.9}
$$

In view of Lemma 3.3.7, we can get (3.3.9) at most in

$$
\begin{array}{r}{N(\epsilon) = \frac{1}{\ln[2(1 - \epsilon)]} \ln \frac{t_{0} - t^{*}}{(1 - \epsilon) \epsilon}} \end{array}
$$

full iterations of the master process. (The last iteration of the process is terminated by the Global Stop rule.) Note that in the above expression, $\varkappa$ is an absolute constant (for example, we can take $\begin{array}{r}{\varkappa = \frac{1}{4})} \end{array}$

Let us estimate the complexity of the internal process. Define

$$
M_{f} = \operatorname{max} \{\| \g \ \| \ \g \in \partial f(x) \bigcup \partial \bar{f}(x), \x \in Q\}.
$$

We need to analyze two cases.

1. Full step. At this step, the internal process is terminated by the rule

$$
\hat{f}_{j(k)}^{*}(X; t_{k}) \geq(1 - \varkappa) f_{j(k)}^{*}(X; t_{k}).
$$

The corresponding inequality for the gap is as follows:

$$
f_{j(k)}^{*}(X; t_{k}) - \hat{f}_{j(k)}^{*}(X; t_{k}) \leq \varkappa f_{j(k)}^{*}(X; t_{k}).
$$

In view of Theorem 3.3.1, this happens at most after

$$
\frac{M_{f}^{2} D^{2}}{\varkappa^{2}(f_{j(k)}^{*}(X; t_{k}))^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)}
$$

iterations of the internal process. Since at the full step $f_{j(k)}^{*}(X; t_{k})) ~ \ge ~ \epsilon$ , we conclude that

$$
\begin{array}{r}{j(k) - j(k - 1) \le \frac{M_{f}^{2} D^{2}}{\varkappa^{2} \epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)}} \end{array}
$$

for any full iteration of the master process.

2. Last step. The internal process of this step was terminated by the Global Stop rule:

$$
f_{j}^{*}(X; t_{k}) \leq \epsilon.
$$

Since the normal stopping criterion did not work, we conclude that

$$
f_{j - 1}^{*}(X; t_{k}) - \hat{f}_{j - 1}^{*}(X; t_{k}) \geq \varkappa f_{j - 1}^{*}(X; t_{k}) \geq \varkappa \epsilon.
$$

Therefore, in view of Theorem 3.3.1, the number of iterations at the last step does not exceed

$$
\frac{M_{f}^{2} D^{2}}{\varkappa^{2} \epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)}.
$$

Thus, we come to the following estimate of total complexity of the Constrained Level Method:

$$
\begin{array}{rl} &{(N(\epsilon) + 1) \frac{M_{f}^{2} D^{2}}{x^{2} \epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)}} \\ &{= \frac{M_{f}^{2} D^{2}}{x^{2} \epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha)} \left[1 + \frac{1}{\ln[2(1 - x)]} \ln \frac{t_{0} - t^{*}}{(1 - x) \epsilon} \right]} \\ &{= \frac{M_{f}^{2} D^{2} \ln \frac{2(t_{0} - t^{*})}{\epsilon}}{\epsilon^{2} \alpha(1 - \alpha)^{2}(2 - \alpha) x^{2} \ln[2(1 - x)]}.} \end{array}
$$

A reasonable choice for the parameters of this scheme is $\textstyle \alpha = \varkappa = \frac{1}{2 + \sqrt{2}}$

The principal term in the above complexity bound is of the order $O(\textstyle{\frac{1}{\epsilon^{2}}}$ ln $\frac{2(t_{0} - t^{*})}{\epsilon})$ . Thus, the Constrained Level Method is suboptimal (see Theorem 3.2.1).

In this method, at each iteration of the master process we need to find the root $t_{j(k)}^{*}(X)$ . In view of Lemma 3.3.4, this is equivalent to the following problem:

$$
\operatorname{min}_{x \in Q} \{\hat{f}_{k}(X; x) \mid \check{f}_{k}(X; x) \leq 0\}.
$$

In other words, we need to solve the problem

$$
\begin{array}{c}{\displaystyle{\operatorname{min}_{x \in Q} t,}} \\{\displaystyle{}} \\{\mathrm{s.t.} ~ f(x_{j}) + \langle g(x_{j}), x - x_{j} \rangle \leq t, ~ j = 0 \ldots k,} \\{\displaystyle{}} \\{\bar{f}(x_{j}) + \langle \bar{g}(x_{j}), x - x_{j} \rangle \leq 0, ~ j = 0 \ldots k.} \end{array}
$$

If $Q$ is a polytope, this problem can be solved by finite linear programming methods (simplex method). If $Q$ is more complicated, we can use Interior-Point Schemes (Chap. 5).

To conclude this section, let us note that we can use a better model for the functional constraints. Since

$$
\bar{f}(x) = \operatorname{max}_{1 \leq i \leq m} f_{i}(x),
$$

it is possible to work with

$$
\check{f}_{k}(X; x) = \operatorname{max}_{0 \leq j \leq k} \ \operatorname{max}_{1 \leq i \leq m}[f_{i}(x_{j}) + \langle g_{i}(x_{j}), x - x_{j} \rangle],
$$

where $g_{i}(x_{j}) \in \partial f_{i}(x_{j})$ . In practice, this complete model significantly accelerates the convergence of the process. However, clearly each iteration becomes much more expensive.

As far as the practical behavior of this scheme is concerned, we note that usually the process is very fast. There are some technical problems related to the accumulation of many linear pieces in the model. However, in all practical implementations of the Level Method there exist some strategies for dropping the old inactive elements of the model.

In this chapter, we study Black-Box second-order methods. In the first two sections, these methods are based on cubic regularization of the second-order model of the objective function. With an appropriate proximal coefficient, this model becomes a global upper approximation of the objective function. At the same time, the global minimum of this approximation is computable in polynomial time even if the Hessian of the objective is not positive semidefinite. We study global and local convergence of the Cubic Newton Method in convex and non-convex cases. In the next section, we derive the lower complexity bounds and show that this method can be accelerated using the estimating sequences technique. In the last section, we consider a modification of the standard Gauss–Newton method for solving systems of nonlinear equations. This modification is also based on an overestimating principle as applied to the norm of the residual of the system. Both global and local convergence results are justified.


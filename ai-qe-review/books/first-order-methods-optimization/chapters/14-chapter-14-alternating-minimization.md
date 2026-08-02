---
title: "Chapter 14 \u2014 Alternating Minimization"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 14
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 17396
source_line_end: 18103
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 0
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 14 — Alternating Minimization

> [[../README|本书目录]] · [[13-chapter-13-the-generalized-conditional-gradient-method|上一章]] · [[15-chapter-15-admm|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 17396–18103。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 3；sufficient × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Alternating Minimization

Underlying Spaces: In this chapter, all the underlying spaces are Euclidean.

## 14.1 The Method

Consider the problem

$$
\min_{\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \ldots, \mathbf{x}_{p} \in \mathbb{E}_{p}} F(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{p}),\tag{14.1}
$$

where $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{p}$ are Euclidean spaces whose product space is denoted by $\mathbb{E} =$ $\mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p}$ . We use our convention (see Section 1.9) that the product space is also Euclidean with endowed norm

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{p}) \|_{\mathbb{E}} = \sqrt{\sum_{i = 1}^{p} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}}.
$$

We will omit the subscripts of the norms indicating the underlying vector space whose identity will be clear from the context. At this point we only assume that $F : \mathbb{E}(- \infty, \infty]$ is proper, but obviously to assure some kind of convergence, additional assumptions will be imposed.

For any $i \in \{1, 2, \ldots, p\}$ we define $\mathcal{U}_{i} : \mathbb{E}_{i} \mathbb{E}$ to be the linear transformation given by

$$
\mathcal{U}_{i}(\mathbf{d}) =(\mathbf{0}, \ldots, \mathbf{0}, \underbrace{\mathbf{d}}_{ithblock}, \mathbf{0}, \ldots, \mathbf{0}), \quad \mathbf{d} \in \mathbb{E}_{i}.
$$

We also use throughout this chapter the notation that a vector $\mathbf{x} \in \mathbb{E}$ can be written as

$$
\mathbf{x} =(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}),
$$

and this relation will also be written as $\mathbf{x} =(\mathbf{x}_{i})_{i = 1}^{p}$

In this chapter we consider the alternating minimization method in which we successively pick a block in a cyclic manner and set the new value of the chosen block to be a minimizer of the objective w.r.t. the chosen block. The kth iterate is denoted by $\mathbf{x}^{k} =(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}, \ldots, \mathbf{x}_{p}^{k})$ . Each iteration of the alternating minimization method involves $p$ “subiterations” and the by-products of these sub-iterations will be denoted by the following auxiliary subsequences:

$$
\begin{array}{rl} \mathbf{x}^{k, 0} & = \mathbf{x}^{k} =(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}, \ldots, \mathbf{x}_{p}^{k}), \\ \mathbf{x}^{k, 1} & =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k}, \ldots, \mathbf{x}_{p}^{k}), \\ \mathbf{x}^{k, 2} & =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k + 1}, \mathbf{x}_{3}^{k}, \ldots, \mathbf{x}_{p}^{k}), \\ & \vdots \\ \mathbf{x}^{k, p} & = \mathbf{x}^{k + 1} =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k + 1}, \ldots, \mathbf{x}_{p}^{k + 1}).\end{array}\tag{14.2}
$$

The alternating minimization method for minimizing F is described below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Alternating Minimization Method
Initialization: pick  $\mathbf{x}^{0} =(\mathbf{x}_{1}^{0}, \mathbf{x}_{2}^{0}, \ldots, \mathbf{x}_{p}^{0}) \in \text{dom}(F)$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following step:
- for  $i = 1, 2, \ldots, p$ , compute
 $x_{i}^{k+1} \in \arg\min_{x_{i} \in E_{i}} F(x_{1}^{k+1}, \ldots, x_{i-1}^{k+1}, x_{i}, x_{i+1}^{k}, \ldots, x_{p}^{k})$ .
</div>

(14.3)

In our notation, we can alternatively rewrite the general step of the alternating minimization method as follows:

- set $\mathbf{x}^{k, 0} = \mathbf{x}^{k}$ ;

- for $i = 1, 2, \dotsc, p,$ compute $\mathbf{x}^{k, i} = \mathbf{x}^{k, i - 1} + \mathcal{U}_{i}(\tilde{\mathbf{y}} - \mathbf{x}_{i}^{k})$ , where

$$
\tilde{\mathbf{y}} \in \operatorname{argmin}_{\mathbf{y} \in \mathbb{E}_{i}} F(\mathbf{x}^{k, i - 1} + \mathcal{U}_{i}(\mathbf{y} - \mathbf{x}_{i}^{k}));\tag{14.4}
$$

- set $\mathbf{x}^{k + 1} = \mathbf{x}^{k, p}.$

The following simple lemma states that if F is proper and closed and has bounded level sets, then problem (14.1) has a minimizer and the alternating minimization method is well defined in the sense that the minimization problems (14.3) (or in their alternative form (14.4)) possess minimizers. In the sequel, we will impose additional assumptions on the structure of $F$ that will enable us to establish convergence results.

Lemma 14.1 (alternating minimization is well defined). Suppose that $F$ : $\mathbb{E}(- \infty, \infty] \(\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p})$ is a proper and closed function. Assume further that F has bounded level sets; that is, Lev $(F, \alpha) = \{\mathbf{x} \in \mathbb{E} : F(\mathbf{x}) \leq \alpha\}$ is bounded for any $\alpha \in \mathbb{R}$ . Then the function F has at least one minimizer, and for any $\bar{\bf x} \in \mathbf{\Xi}$ dom(F ) and $i \in \{1, 2, \ldots, p\}$ the problem

$$
\min_{\mathbf{y} \in \mathbb{E}_{i}} F(\bar{\mathbf{x}} + \mathcal{U}_{i}(\mathbf{y} - \bar{\mathbf{x}}_{i}))\tag{14.5}
$$

possesses a minimizer.

Proof. Take $\tilde{\mathbf{x}} \in \mathrm{dom}(F)$ . Then

$$
\operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} F(\mathbf{x}) = \operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}): \mathbf{x} \in \operatorname{Lev}(F, F(\tilde{\mathbf{x}}))\}.
$$

Since F is closed with bounded level sets, it follows that $\mathrm{Lev}(F, F(\tilde{{\bf x}}))$ is compact. Hence, by the Weierstrass theorem for closed functions (Theorem 2.12), it follows that the problem of minimizing the proper and closed function F over $\operatorname{Lev}(F, F({\tilde{\mathbf{x}}}))$ ), and hence also the problem of minimizing F over the entire space, possesses a minimizer. Since the function $\mathbf{y} \mapsto F({\bar{\mathbf{x}}} + \mathcal{U}_{i}(\mathbf{y} -{\bar{\mathbf{x}}}_{i}))$ is proper and closed with bounded level sets, the same argument shows that problem (14.5) also possesses a minimizer.

## 14.2 Coordinate-wise Minima

By the definition of the method, it is clear that convergence will most likely be proved (if at all possible) to coordinate-wise minimum points.

Definition 14.2. A vector $\mathbf{x}^{*} \in \mathbb{E}$ is a coordinate-wise minimum of a function $F : \mathbb{E}_{1} \times \mathbb{E}_{2} \times \dots \times \mathbb{E}_{p} \to(- \infty, \infty] \if \ \mathbf{x}^{*} \in \mathrm{dom}(F)$ and

$$
F(\mathbf{x}^{*}) \leq F(\mathbf{x}^{*} + \mathcal{U}_{i}(\mathbf{y})) foralli = 1, 2, \dots, p, \mathbf{y} \in \mathbb{E}_{i}.
$$

The next theorem is a rather standard result showing that under properness and closedness of the objective function, as well as an assumption on the uniqueness of the minimizers of the class of subproblems solved at each iteration, the limit points of the sequence generated by the alternating minimization method are coordinatewise minima.

Theorem 14.3 (convergence of alternating minimization to coordinatewise minima).<sup>77</sup> Suppose that $F : \mathbb{E}(- \infty, \infty] \(\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p})$ is a proper closed function that is continuous over its domain. Assume that

(A) for each $\bar{\mathbf{x}} \in \mathrm{dom}(F)$ and $i \in \{1, 2, \ldots, p\}$ the problem $\begin{array}{r}{\operatorname{min}_{\mathbf{y} \in \mathbb{E}_{i}} F(\bar{\mathbf{x}} + \mathcal{U}_{i}(\mathbf{y} -} \end{array}$ $\bar{\bf x}_{i}))$ has a unique minimizer;

(B) the level sets of F are bounded, meaning that for any $\alpha \in \mathbb{R}$ , the set $\operatorname{Lev}(F, \alpha) =$ $\{\mathbf{x} \in \mathbb{E} : F(\mathbf{x}) \leq \alpha\}$ is bounded.

Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the alternating minimization method for minimizing F . Then $\{\mathbf{x}^{k}\}_{k \geq 0}$ is bounded, and any limit point of the sequence is a coordinate-wise minimum.

Proof. To prove that the sequence is bounded, note that by the definition of the method, the sequence of function values $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ is nonincreasing, which in particular implies that $\{\mathbf{x}^{k}\}_{k \geq 0} \subseteq \operatorname{Lev}(F, F(\mathbf{\tilde{x}}^{0}))$ ; therefore, by condition (B), it follows that the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ is bounded, which along with the closedness of $F$ implies that $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ is bounded below. We can thus conclude that $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ converges to some real number ${\bar{F}}.$ . Since $F(\mathbf{x}^{k}) \geq F(\mathbf{x}^{k, 1}) \geq F(\mathbf{x}^{k + 1})$ , it follows that $\{F(\mathbf{x}^{k, 1})\}_{k \geq 0}$ also converges to ${\bar{F}}_{\cdot}$ , meaning that the sequences $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ and $\{F(\mathbf{x}^{k, 1})\}_{k \geq 0}$ converge to the same value.

Now, suppose that x¯ is a limit point of $\{\mathbf{x}^{k}\}_{k \geq 0}$ . Then there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \geq 0}$ converging to x¯. Since the sequence $\mathrm{\bar{\{x}}^{k_{j}, 1}\}_{j \geq 0}$ is bounded (follows directly from the boundedness of $\{\mathbf{x}^{k}\}_{k \geq 0})$ , by potentially passing to a subsequence, we can assume that $\{\mathbf{x}^{k_{j}, 1}\}_{j \geq 0}$ converges to some vector $(\mathbf{v}, \bar{\mathbf{x}}_{2}, \ldots, \bar{\mathbf{x}}_{p}) \(\mathbf{v} \in \mathbb{E}_{1})$ By definition of the method,

$$
F \left(\mathbf{x}_{1}^{k_{j} + 1}, \mathbf{x}_{2}^{k_{j}}, \dots, \mathbf{x}_{p}^{k_{j}}\right) \leq F \left(\mathbf{x}_{1}, \mathbf{x}_{2}^{k_{j}}, \dots, \mathbf{x}_{p}^{k_{j}}\right) \text{for any} \mathbf{x}_{1} \in \mathbb{E}_{1}.
$$

Taking the limit $j \to \infty$ and using the closedness of $F.$ , as well as the continuity of $F$ over its domain, we obtain that

$$
F(\mathbf{v}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}) \leq F(\mathbf{x}_{1}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}) \text{for any} \mathbf{x}_{1} \in \mathbb{E}_{1}.
$$

Since $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ and $\{F(\mathbf{x}^{k, 1})\}_{k \geq 0}$ converge to the same value, we have

$$
F(\mathbf{v}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}) = F(\bar{\mathbf{x}}_{1}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}),
$$

which by the uniqueness of the minimizer w.r.t. the first block (condition (A)) implies that $\mathbf{v} ={\bar{\mathbf{x}}}_{1}$ . Therefore,

$$
F(\bar{\mathbf{x}}_{1}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}) \leq F(\mathbf{x}_{1}, \bar{\mathbf{x}}_{2}, \dots, \bar{\mathbf{x}}_{p}) \text{for any} \mathbf{x}_{1} \in \mathbb{E}_{1},
$$

which is the first condition for coordinate-wise minimality. We have shown that $\mathbf{x}^{k_{j}, 1} \bar{\mathbf{x}}$ as $j \infty$ . This means that we can repeat the arguments when $\mathbf{x}^{k_{j}, 1}$ replaces $\mathbf{x}^{k_{j}}$ and concentrate on the second coordinate to obtain that

$$
F(\bar{\mathbf{x}}_{1}, \bar{\mathbf{x}}_{2}, \ldots, \bar{\mathbf{x}}_{p}) \leq F(\bar{\mathbf{x}}_{1}, \mathbf{x}_{2}, \bar{\mathbf{x}}_{3}, \ldots, \bar{\mathbf{x}}_{p}) \mathrm{forany} \mathbf{x}_{2} \in \mathbb{E}_{2},
$$

which is the second condition for coordinate-wise minimality. The above argument can be repeated until we show that x¯ satisfies all the conditions for coordinate-wise minimality.

The following famous example of Powell describes a situation in which the alternating minimization method produces a sequence whose limit points are not coordinate-wise minima points.

Example 14.4 (Powell’s example—failure of alternating minimization I).<sup>78</sup> Let

$$
\varphi(x, y, z) = - xy - yz - zx +[x - 1]_{+}^{2} +[- x - 1]_{+}^{2} +[y - 1]_{+}^{2} +[- y - 1]_{+}^{2} +[z - 1]_{+}^{2} +[- z - 1]_{+}^{2}.
$$

Note that $\varphi$ is diferentiable. Fixing y and z, it is easy to show that

$$
\operatorname{argmin}_{x} \varphi(x, y, z) = \left\{\begin{array}{ll} \operatorname{sgn}(y + z)(1 + \frac{1}{2} | y + z |), & y + z \neq 0, \\[- 1, 1], & y + z = 0, \end{array} \right.\tag{14.6}
$$

and similarly (by the symmetry of $\varphi)$

$$
\operatorname{argmin}_{y} \varphi(x, y, z) = \left\{\begin{array}{ll} \operatorname{sgn}(x + z)(1 + \frac{1}{2} | x + z |), & x + z \neq 0, \\[- 1, 1], & x + z = 0, \end{array} \right.\tag{14.7}
$$

$$
\operatorname{argmin}_{z} \varphi(x, y, z) = \left\{\begin{array}{ll} \operatorname{sgn}(x + y)(1 + \frac{1}{2} | x + y |), & x + y \neq 0, \\[- 1, 1], & x + y = 0.\end{array} \right.\tag{14.8}
$$

Suppose that $\varepsilon > 0$ and that we initialize the alternating minimization method with the point $\begin{array}{r}{\left(- 1 - \varepsilon, 1 + \frac{1}{2} \varepsilon, - 1 - \frac{1}{4} \varepsilon \right)} \end{array}$ . Then the first six iterations are

$$
\begin{array}{rl} &{\left(1 + \frac{1}{8} \varepsilon, 1 + \frac{1}{2} \varepsilon, - 1 - \frac{1}{4} \varepsilon\right),} \\ &{\left(1 + \frac{1}{8} \varepsilon, - 1 - \frac{1}{16} \varepsilon, - 1 - \frac{1}{4} \varepsilon\right),} \\ &{\left(1 + \frac{1}{8} \varepsilon, - 1 - \frac{1}{16} \varepsilon, 1 + \frac{1}{32} \varepsilon\right),} \\ &{\left(- 1 - \frac{1}{64} \varepsilon, - 1 - \frac{1}{16} \varepsilon, 1 + \frac{1}{32} \varepsilon\right),} \\ &{\left(- 1 - \frac{1}{64} \varepsilon, 1 + \frac{1}{128} \varepsilon, 1 + \frac{1}{32} \varepsilon\right),} \\ &{\left(- 1 - \frac{1}{64} \varepsilon, 1 + \frac{1}{128} \varepsilon, - 1 - \frac{1}{256} \varepsilon\right)} \end{array}
$$

We are essentially back to the first point, but with $\textstyle{\frac{1}{64}} \varepsilon$ replacing ε. The process continues by cycling around the six points

$$
(1, 1, - 1),(1, - 1, - 1),(1, - 1, 1),(- 1, - 1, 1),(- 1, 1, 1),(- 1, 1, - 1).
$$

None of these points is a stationary point of $\varphi.$ . Indeed,

$$
\nabla \varphi(1, 1, - 1) =(0, 0, - 2), \quad \nabla \varphi(- 1, 1, 1) =(- 2, 0, 0), \quad \nabla \varphi(1, - 1, 1) =(0, - 2, 0),
$$

$$
\nabla \varphi(- 1, - 1, 1) =(0, 0, 2), \quad \nabla \varphi(1, - 1, - 1) =(2, 0, 0), \quad \nabla \varphi(- 1, 1, - 1) =(0, 2, 0).
$$

Since the limit points are not stationary points of $\varphi,$ they are also not coordinatewise minima<sup>79</sup> points. The fact that the limit points of the sequence generated by the alternating minimization method are not coordinate-wise minima is not a contradiction to Theorem 14.3 since two assumptions are not met: the subproblems solved at each iteration do not necessarily possess unique minimizers, and the level sets of $\varphi$ are not bounded since for any $x > 1$

$$
\varphi(x, x, x) = - 3x^{2} + 3(x - 1)^{2} = - 6x + 3
$$

goes to $- \infty \operatorname{as} x \infty$ . A close inspection of the proof of Theorem 14.3 reveals that the assumption on the boundedness of the level sets in Theorem 14.3 is only required in order to assure the boundedness of the sequence generated by the method. Since the sequence in this example is in any case bounded, it follows that the failure to converge to a coordinate-wise minimum is actually due to the nonuniqueness of the optimal solutions of the subproblems (14.6),(14.7) and (14.8).

Note that if the alternating minimization method reaches a coordinate-wise minimum, then it might get stuck there since the point is optimal w.r.t. each block.<sup>80</sup> The natural question is of course whether coordinate-wise minima are necessarily stationary points of the problem, meaning that they satisfy the most basic optimality condition of the problem. The answer is unfortunately no even when the objective function is convex, as the following example illustrates.

Example 14.5 (failure of alternating minimization II). Consider the convex function

$$
F(x_{1}, x_{2}) = | 3x_{1} + 4x_{2} | + | x_{1} - 2x_{2} |.
$$

The function satisfies all the assumptions of Theorem 14.3: it is proper, closed, and continuous with bounded level sets and has a unique minimizer w.r.t. each variable. Therefore, Theorem 14.3 guarantees that the limit point points of the alternating minimization method are coordinate-wise minima points. We will see that for the specific problem under consideration, this result is of very little importance.

The unique minimizer of the function is $(x_{1}, x_{2}) =(0, 0)$ . However, for any $\alpha \in \mathbb{R}$ the point $(- 4 \alpha, 3 \alpha)$ is a coordinate-wise minimum of $f.$ To show this, assume first that $\alpha > 0$ . Note that

$$
F(- 4 \alpha, t) = | 4t - 12 \alpha | + | 2t + 4 \alpha | = \left\{\begin{array}{ll} - 6t + 8 \alpha, & t < - 2 \alpha, \\ - 2t + 16 \alpha, & - 2 \alpha \leq t \leq 3 \alpha, \\ 6t - 8 \alpha, & t > 3 \alpha, \end{array} \right.
$$

and obviously $t = 3 \alpha$ is the minimizer of $F(- 4 \alpha, t)$ . Similarly, the optimal solution of

$$
F(t, 3 \alpha) = | 3t + 12 \alpha | + | t - 6 \alpha | = \left\{\begin{array}{ll} - 4t - 6 \alpha, & t < - 4 \alpha, \\ 2t + 18 \alpha, & - 4 \alpha \leq t \leq 6 \alpha, \\ 4t + 6 \alpha, & t > 6 \alpha, \end{array} \right.
$$

is $t = - 4 \alpha$ . A similar argument also shows that $(- 4 \alpha, 3 \alpha)$ is a coordinate-wise minimum also for $\alpha < 0$ . We conclude that $(- 4 \alpha, 3 \alpha)$ is a coordinate-wise minimum for any $\alpha \in \mathbb{R}$ where only the value $\alpha = 0$ corresponds to the actual minimum of $F;$ all other values correspond to nonoptimal/nonstationary<sup>81</sup> points of $F.$ The severity of the situation is made clear when noting that after only one iteration of alternating minimization, the method gets stuck at a coordinate-wise minimum, which, unless the initial vector contains at least one zero element, is a nonoptimal point (easy to show). The contour lines of F , as well as the line comprising the continuum of coordinate-wise minima points is described in Figure 14.1.

![Figure 14.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p401-476/images/90534ce7ab21d5f15f0d5fbc994d522b5c5a6aca3aa110626929f18502616d4f.jpg)  
Figure 14.1. Contour lines of the function $f(x_{1}, x_{2}) = | 3x_{1} + 4x_{2} | + | x_{1} -$ $2x_{2} |$ . All the points on the emphasized line $\{(- 4 \alpha, 3 \alpha) : \alpha \in \mathbb{R}\}$ are coordinate-wise minima, and only (0, 0) is a global minimum.

Example 14.5 shows that even if convexity is assumed, coordinate-wise minima points are not necessarily stationary points of the objective function; in particular, this means that the alternating minimization method will not be guaranteed to converge to stationary points (which are global minima points in the convex case). One possible reason for this phenomena is that the stationarity condition $\mathbf{0} \in \partial F(\mathbf{x})$ does not decompose into separate conditions on each block. This is why, in the next section, we present a specific model for the function F for which we will be able to prove that coordinate-wise minima points are necessarily stationary points.

## 14.3 The Composite Model

The model that we will analyze from now on is the composite model, which was discussed in Sections 11.2 and 13.4 in the contexts of the block proximal gradient and block conditional gradient methods. Thus, our main model is

$$
\min_{\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \dots, \mathbf{x}_{p} \in \mathbb{E}_{p}} \left\{F(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) = f(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) + \sum_{j = 1}^{p} g_{j}(\mathbf{x}_{j}) \right\}.\tag{14.9}
$$

The function $g : \mathbb{E}(- \infty, \infty]$ is defined by

$$
g(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) \equiv \sum_{i = 1}^{p} g_{i}(\mathbf{x}_{i}).
$$

The gradient w.r.t. the ith block $(i \in \{1, 2, \ldots, p\})$ is denoted by $\nabla_{i} f$ , and the following is satisfied:

$$
\nabla f(\mathbf{x}) =(\nabla_{1} f(\mathbf{x}), \nabla_{2} f(\mathbf{x}), \dots, \nabla_{p} f(\mathbf{x})).
$$

Note that in our notation the main model (14.9) can be simply written as

$$
\min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) = f(\mathbf{x}) + g(\mathbf{x})\}.
$$

The basic assumptions on the model are summarized below.

## Assumption 14.6.

(A) $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex for any $i \in \{1, 2, \ldots, p\}$ . In addition, g<sub>i</sub> is continuous over its domain.

(B) $f : \mathbb{E} \to(- \infty, \infty]$ is a closed function; dom $(f)$ is convex; f is diferentiable over int $\left(\operatorname{dom}(f) \right)$ and dom $(g) \subseteq \operatorname{int}(\operatorname{dom}(f))$

Under the above structure of the function $F_{\mathrm{{;}}}$ , the general step of the alternating minimization method (14.3) can be compactly written as

$$
\mathbf{x}_{i}^{k + 1} \in \operatorname{argmin}_{\mathbf{x}_{i} \in \mathbb{E}_{i}} \{f(\mathbf{x}_{1}^{k + 1}, \ldots, \mathbf{x}_{i - 1}^{k + 1}, \mathbf{x}_{i}, \mathbf{x}_{i + 1}^{k}, \ldots, \mathbf{x}_{p}^{k}) + g_{i}(\mathbf{x}_{i})\},
$$

where we omitted from the above the constant terms related to the functions $g_{j}$ $j \neq i$

Recall that a point $\mathbf{x}^{*} \in \mathrm{dom}(g)$ is a stationary point of problem (14.9) if it satisfies $- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*})$ (Definition 3.73) and that by Theorem $11.6(a)$ , this condition can be written equivalently as $- \nabla_{i} f(\mathbf{x}^{*}) \in \partial g_{i}(\mathbf{x}^{*}), i = 1, 2, \ldots, p.$ . The latter fact will enable us to show that coordinate-wise minima points of $F$ are stationary points of problem (14.9).

Lemma 14.7 (coordinate-wise minimality ⇒ stationarity). Suppose that Assumption 14.6 holds and that $\mathbf{x}^{*} \in \mathrm{dom}(g) isa$ coordinate-wise minimum of $F = f + g$ . Then $\mathbf{x}^{*}$ is a stationary point of problem (14.9).

Proof. Since $\mathbf{x}^{*}$ is a coordinate-wise minimum of F , it follows that for all $i \in$ $\{1, 2, \ldots, p\}$ 2

$$
\mathbf{x}_{i}^{*} \in \operatorname{argmin}_{\mathbf{y} \in \mathbb{E}_{i}} \{\tilde{f}_{i}(\mathbf{y}) + g_{i}(\mathbf{y})\},
$$

where

$$
\tilde{f}_{i}(\mathbf{y}) \equiv f(\mathbf{x}^{*} + \mathcal{U}_{i}(\mathbf{y} - \mathbf{x}_{i}^{*})) = f(\mathbf{x}_{1}^{*}, \ldots, \mathbf{x}_{i - 1}^{*}, \mathbf{y}, \mathbf{x}_{i + 1}^{*}, \ldots, \mathbf{x}_{p}^{*}).
$$

Therefore, by Theorem $3.72(a), - \nabla \tilde{f}_{i}(\mathbf{x}_{i}^{*}) \in \partial g_{i}(\mathbf{x}^{*})$ . Since $\nabla \tilde{f}_{i}({\bf x}_{i}^{*}) = \nabla_{i} f({\bf x}^{*})$ , we conclude that for any $i, - \nabla_{i} f(\mathbf{x}^{*}) \in \partial g_{i}(\mathbf{x}^{*})$ . Thus, invoking Theorem $11.6(a)$ , we obtain that $- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*})$ , namely, that $\mathbf{x}^{*}$ is a stationary point of problem (14.9).

Recall that Theorem 14.3 showed under appropriate assumptions that limit points of the sequence generated by the alternating minimization method are coordinate-wise minima points. Combining this result with Lemma 14.7 we obtain the following corollary.

Corollary 14.8. Suppose that Assumption 14.6 holds, and assume further that $F = f + g$ satisfies the following:

- for each $\bar{\mathbf{x}} \in \mathrm{dom}(F)$ and $i \in \{1, 2, \ldots, p\}$ the problem min<sub>y∈</sub>E<sub>i</sub> $F({\bar{\mathbf{x}}} + \mathcal{U}_{i}(\mathbf{y} - \mathbf{\partial}$ $\bar{\bf x}_{i}))$ has a unique minimizer;

- the level sets of F are bounded, meaning that for any $\alpha \in \mathbb{R}$ , the set $\{\mathbf{x} \in \mathbb{E}$ $F(\mathbf{x}) \leq \alpha\}$ is bounded.

Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the alternating minimization method for solving (14.9). Then $\{\mathbf{x}^{k}\}_{k \geq 0}$ is bounded, and any limit point of the sequence is a stationary point of problem (14.9).

## 14.4 Convergence in the Convex Case

The convergence results previously established require a rather strong assumption on the uniqueness of the optimal solution to the class of subproblems that are solved at each sub-iteration of the alternating minimization method. We will show how this assumption can be removed if we assume convexity of the objective function.

Theorem 14.9.<sup>82</sup> Suppose that Assumption 14.6 holds and that in addition

- f is convex;

- f is continuously diferentiable<sup>83</sup> over int(dom(f ));

- the function $F = f + g$ satisfies that the level sets of F are bounded, meaning that for any $\alpha \in \mathbb{R}$ , the set Lev $(F, \alpha) = \{\mathbf{x} \in \mathbb{E} : F(\mathbf{x}) \leq \alpha\}$ is bounded.

Then the sequence generated by the alternating minimization method for solving problem (14.9) is bounded, and any limit point of the sequence is an optimal solution of the problem.

Proof. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the alternating minimization method, and let $\{\overline{{\mathbf{x}}}^{k, i}\}_{k \geq 0} ~(i ~ = ~ 0, 1, \ldots, p)$ be the auxiliary sequences given in (14.2). We begin by showing that $\{{\bf x}^{k}\}_{k \ge 0}$ is bounded. Indeed, by the definition of the method, the sequence of function values is nonincreasing, and hence $\{\mathbf{x}^{k}\}_{k \geq 0} \subseteq$ $\mathrm{Lev}(F, F({\bf x}^{0}))$ . Since $\mathrm{Lev}(F, F({\bf x}^{0}))$ is bounded by the premise of the theorem, it follows that $\{\mathbf{x}^{k}\}_{k \geq 0}$ is bounded.

Let $\bar{\mathbf{x}} \in \mathrm{dom}(g)$ be a limit point of $\{\mathbf{x}^{k}\}_{k \geq 0}$ . We will show that x¯ is an optimal solution of problem (14.9). Since x¯ is a limit point of the sequence, there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \ge 0}$ for which $\mathbf{x}^{k_{j}} \to \bar{\mathbf{x}}$ . By potentially passing to a subsequence, the sequences $\{\mathbf{x}^{k_{j}, \bar{i}}\}_{j \ge 0} ~(i = 1, 2, \ldots, p)$ can also be assumed to be convergent and $\mathbf{x}^{k_{j}, i} \bar{\mathbf{x}}^{i} \in$ dom(g) as $j \to \infty$ for all $i \in \{0, 1, 2, \ldots, p\}$ . Obviously, the following three properties hold:

- [P1] x¯ = x¯<sup>0</sup>.

- [P2] for any $i, \bar{\bf x}^{i}$ is different from $\bar{\mathbf{x}}^{i - 1}$ only at the ith block (if at all different).

- [P3] $F(\bar{\bf x}) = F(\bar{\bf x}^{i})$ for all $i \in \{0, 1, 2, \ldots, p\}$ (easily shown by taking the limit $j \infty$ in the inequality $F(\mathbf{\bar{x}}^{k_{j}}) \geq F(\mathbf{x}^{k_{j}, i}) \geq F(\mathbf{x}^{k_{j} + 1})$ and using the closedness $F,$ as well as the continuity of $F$ over its domain).

By the definition of the sequence we have for all $j \geq 0$ and $i \in \{1, 2, \ldots, p\}$

$$
\mathbf{x}_{i}^{k_{j}, i} \in \operatorname{argmin}_{\mathbf{x}_{i} \in \mathbb{E}_{i}} F(\mathbf{x}_{1}^{k_{j} + 1}, \ldots, \mathbf{x}_{i - 1}^{k_{j} + 1}, \mathbf{x}_{i}, \mathbf{x}_{i + 1}^{k_{j}}, \ldots, \mathbf{x}_{p}^{k_{j}}).
$$

Therefore, since $\mathbf{x}_{i}^{k_{j}, i}$ is a stationary point of the above minimization problem (see Theorem 3.72(a)),

$$
- \nabla_{i} f(\mathbf{x}^{k_{j}, i}) \in \partial g_{i}(\mathbf{x}_{i}^{k_{j}, i}).
$$

Taking the $\operatorname{limit}^{84}{j} \infty$ and using the continuity of $\nabla f.$ , we obtain that

$$
- \nabla_{i} f(\bar{\mathbf{x}}^{i}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{i}).\tag{14.10}
$$

Note that for any $\mathbf{x}_{i + 1} \in \mathop{\mathrm{dom}}(g_{i + 1})$ 2

$$
F(\mathbf{x}^{k_{j}, i + 1}) \leq F(\mathbf{x}_{1}^{k_{j} + 1}, \ldots, \mathbf{x}_{i}^{k_{j} + 1}, \mathbf{x}_{i + 1}, \mathbf{x}_{i + 2}^{k_{j}}, \ldots, \mathbf{x}_{p}^{k_{j}}).
$$

Taking the limit $j \to \infty$ and using [P3], we conclude that for any $\mathbf{x}_{i + 1} \in \mathop{\mathrm{dom}}(g_{i + 1})$

$$
F(\bar{\mathbf{x}}^{i}) = F(\bar{\mathbf{x}}^{i + 1}) \leq F(\bar{\mathbf{x}}_{1}^{i}, \ldots, \bar{\mathbf{x}}_{i}^{i}, \mathbf{x}_{i + 1}, \bar{\mathbf{x}}_{i + 2}^{i}, \ldots, \bar{\mathbf{x}}_{p}^{i}),
$$

from which we obtain, using Theorem 3.72(a) again, that for any $i \in \{0, 1, \ldots, p{-} 1\}$

$$
- \nabla_{i + 1} f(\bar{\mathbf{x}}^{i}) \in \partial g_{i + 1}(\bar{\mathbf{x}}_{i + 1}^{i}).\tag{14.11}
$$

We need to show that the following implication holds for any $i \in \{2, 3, \ldots, p\}, l \in$ $\{1, 2, \ldots, p - 1\}$ such that $l < i \colon$

$$
- \nabla_{i} f(\bar{\mathbf{x}}^{l}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{l}) \Rightarrow - \nabla_{i} f(\bar{\mathbf{x}}^{l - 1}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{l - 1}).\tag{14.12}
$$

To prove the above implication, assume that $- \nabla_{i} f(\bar{\mathbf{x}}^{l}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{l})$ and let $\pmb{\eta} \in \mathbb{E}_{i}$ Then

$$
\begin{array}{rcl} \langle \nabla f(\bar{\mathbf{x}}^{l}), \bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta}) - \bar{\mathbf{x}}^{l} \rangle & \stackrel{{(*)}}{{=}} & \langle \nabla_{l} f(\bar{\mathbf{x}}^{l}), \bar{\mathbf{x}}_{l}^{l - 1} - \bar{\mathbf{x}}_{l}^{l} \rangle + \langle \nabla_{i} f(\bar{\mathbf{x}}^{l}), \boldsymbol{\eta} \rangle \\ & \stackrel{{(* *)}}{{\geq}} & g_{l}(\bar{\mathbf{x}}_{l}^{l}) - g_{l}(\bar{\mathbf{x}}_{l}^{l - 1}) + \langle \nabla_{i} f(\bar{\mathbf{x}}^{l}), \boldsymbol{\eta} \rangle \\ & \stackrel{{(* * *)}}{{=}} & g_{l}(\bar{\mathbf{x}}_{l}^{l}) - g_{l}(\bar{\mathbf{x}}_{l}^{l - 1}) + \langle \nabla_{i} f(\bar{\mathbf{x}}^{l}),(\bar{\mathbf{x}}_{i}^{l - 1} + \boldsymbol{\eta}) - \bar{\mathbf{x}}_{i}^{l} \rangle \\ & \stackrel{{(* * * *)}}{{\geq}} & g_{l}(\bar{\mathbf{x}}_{l}^{l}) - g_{l}(\bar{\mathbf{x}}_{l}^{l - 1}) + g_{i}(\bar{\mathbf{x}}_{i}^{l}) - g_{i}(\bar{\mathbf{x}}_{i}^{l - 1} + \boldsymbol{\eta}) \\ & = & g(\bar{\mathbf{x}}^{l}) - g(\bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta})), \end{array} \tag{14.13}
$$

where (∗) follows by [P2], (∗∗) is a consequence of the relation (14.10) with $i = l,$ (∗∗∗) follows by the fact that for any $l \ : \dot{<} \ : i, \ : \bar{\bf x}_{i}^{l} = \bar{\bf x}_{i}^{l - 1}$ , and (∗∗∗∗) is due to our underlying assumption that $- \nabla_{i} f(\bar{\mathbf{x}}^{l}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{l})$ . Using inequality (14.13) and the gradient inequality on the function f (utilizing its convexity), we obtain

$$
\begin{array}{rcl} F(\bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta})) & = & f(\bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta})) + g(\bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta})) \\ & \geq & f(\bar{\mathbf{x}}^{l}) + \langle \nabla f(\bar{\mathbf{x}}^{l}), \bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta}) - \bar{\mathbf{x}}^{l} \rangle + g(\bar{\mathbf{x}}^{l - 1} + \mathcal{U}_{i}(\boldsymbol{\eta})) \\ & \geq & F(\bar{\mathbf{x}}^{l}) \\ & \stackrel{[P3]}{=} & F(\bar{\mathbf{x}}^{l - 1}).\end{array}
$$

We thus obtain that

$$
\bar{\mathbf{x}}_{i}^{l - 1} \in \operatorname{argmin}_{\mathbf{x}_{i} \in \mathbb{E}_{i}} F(\bar{\mathbf{x}}_{1}^{l - 1}, \ldots, \bar{\mathbf{x}}_{i - 1}^{l - 1}, \mathbf{x}_{i}, \bar{\mathbf{x}}_{i + 1}^{l - 1}, \ldots, \bar{\mathbf{x}}_{p}^{l - 1}),
$$

which implies that $- \nabla_{i} f(\bar{\mathbf{x}}^{l - 1}) \in \partial g_{i}(\bar{\mathbf{x}}_{i}^{l - 1})$ , establishing the implication (14.12). We are now ready to prove that $\bar{\mathbf{x}} = \bar{\mathbf{x}}^{0}$ is an optimal solution of problem (14.9). For that, we will show that for any $m \in \{1, 2,..., p\}$ it holds that

$$
- \nabla_{m} f(\bar{\mathbf{x}}) \in \partial g_{m}(\bar{\mathbf{x}}_{m}).\tag{14.14}
$$

By Theorem 11.6 these relations are equivalent to stationarity of $\bar{\mathbf{x}},$ and using Theorem 3.72(b) and the convexity of $f_{:}$ we can deduce that x¯ is an optimal solution of problem (14.9). For $m = 1$ the relation (14.14) follows by substituting $i = 0$ in (14.11) and using the fact that $\bar{\mathbf{x}} = \bar{\mathbf{x}}^{0}$ (property [P1]). Let $m > 1$ . Then by (14.11) we have that $- \nabla_{m} f \big(\bar{\mathbf{x}}^{m - 1} \big) \ \in \ \partial g_{m} \big(\bar{\mathbf{x}}_{m}^{m - 1} \big)$ . We can now utilize the implication (14.12) several times and obtain

$$
\begin{array}{c} - \nabla_{m} f(\bar{\mathbf{x}}^{m - 1}) \in \partial g_{m}(\bar{\mathbf{x}}_{m}^{m - 1}) \\ \Downarrow \\ - \nabla_{m} f(\bar{\mathbf{x}}^{m - 2}) \in \partial g_{m}(\bar{\mathbf{x}}_{m}^{m - 2}) \\ \Downarrow \\ \vdots \\ \Downarrow \\ - \nabla_{m} f(\bar{\mathbf{x}}^{0}) \in \partial g_{m}(\bar{\mathbf{x}}_{m}^{0}), \end{array}
$$

and thus, since $\bar{\mathbf{x}} = \bar{\mathbf{x}}^{0}$ (property [P1]), we conclude that $- \nabla_{m} f(\bar{\mathbf{x}}) \in \partial g_{m} \mathopen{} \mathclose \bgroup \left(\bar{\mathbf{x}}_{m} \aftergroup \egroup \right)$ for any m, implying that x¯ is an optimal solution of problem (14.9).

## 14.5 Rate of Convergence in the Convex Case

In this section we will prove some rates of convergence results of the alternating minimization method in the convex setting. We begin by showing a general result that holds for any number of blocks, and we will then establish an improved result for the case $p = 2$

## 14.5.1 General p

We will consider the model (14.9) that was studied in the previous two sections. The basic assumptions on the model are gathered in the following.

## Assumption 14.10.

(A) $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex for any $i \in \{1, 2, \ldots, p\}$

(B) $f : \mathbb{E} \to \mathbb{R}$ is convex and $L_{f}{-} smooth$

(C) For any $\alpha > 0$ , there exists $R_{\alpha} > 0$ such that

$$
\max_{\mathbf{x}, \mathbf{x}^{*} \in \mathbb{E}} \left\{\| \mathbf{x} - \mathbf{x}^{*} \|: F(\mathbf{x}) \leq \alpha, \mathbf{x}^{*} \in X^{*} \right\} \leq R_{\alpha}.
$$

(D) The optimal set of problem (14.9) is nonempty and denoted by $X^{*}$ . The optimal value is denoted by $F_{\mathrm{opt}}$ 85

Theorem 14.11 $(O(1 / k)$ rate of convergence of alternating minimization).<sup>86</sup> Suppose that Assumption 14.10 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the alternating minimization method for solving problem (14.9). Then for all $k \geq 2$ 2

$$
F(\mathbf{x}^{k}) - F_{\mathrm{opt}} \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2}(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}), \frac{8L_{f} p^{2} \mathbb{R}^{2}}{k - 1} \right\},\tag{14.15}
$$

where $R = R_{F({\bf x}^{0})}$

Proof. Let $\mathbf{x}^{*} \in X^{*}$ . Since the sequence of function values $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ generated by the method is nonincreasing, it follows that $\{\mathbf{x}^{k}\}_{k \geq 0} \subseteq \operatorname{Lev}(F, F(\bar{\mathbf{x}_{0}}){\overline{{)}}}$ , and hence, by Assumption 14.10(C),

$$
\left\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \right\| \leq R,\tag{14.16}
$$

where $R = R_{F({\bf x}^{0})}$ . Let $\{\mathbf{x}^{k, j}\}_{k \geq 0} ~(j = 0, 1, \ldots, p)$ be the auxiliary sequences given in (14.2). Then for any $k \geq 0$ and $j \in \{0, 1, 2, \ldots, p - 1\}$ ,

$$
\begin{array}{l} F \left(\mathbf{x}^{k, j}\right) - F \left(\mathbf{x}^{k, j + 1}\right) \\ = f \left(\mathbf{x}^{k, j}\right) - f \left(\mathbf{x}^{k, j + 1}\right) + g \left(\mathbf{x}^{k, j}\right) - g \left(\mathbf{x}^{k, j + 1}\right) \\ \geq \langle \nabla f \left(\mathbf{x}^{k, j + 1}\right), \mathbf{x}^{k, j} - \mathbf{x}^{k, j + 1} \rangle + \frac{1}{2L_{f}} \| \nabla f \left(\mathbf{x}^{k, j}\right) - \nabla f \left(\mathbf{x}^{k, j + 1}\right) \|^{2} + g \left(\mathbf{x}^{k, j}\right) - g \left(\mathbf{x}^{k, j + 1}\right) \\ = \langle \nabla_{j + 1} f \left(\mathbf{x}^{k, j + 1}\right), \mathbf{x}_{j + 1}^{k} - \mathbf{x}_{j + 1}^{k + 1} \rangle + \frac{1}{2L_{f}} \| \nabla f \left(\mathbf{x}^{k, j}\right) - \nabla f \left(\mathbf{x}^{k, j + 1}\right) \|^{2} \\ + g_{j + 1} \left(\mathbf{x}_{j + 1}^{k}\right) - g_{j + 1} \left(\mathbf{x}_{j + 1}^{k + 1}\right), \end{array} \tag{14.17}
$$

where the inequality follows by the convexity and $L_{f}$ -smoothness of f along with Theorem 5.8 (equivalence between (i) and (iii)). Since

$$
\mathbf{x}_{j + 1}^{k + 1} \in \operatorname{argmin}_{\mathbf{x}_{j + 1}} F(\mathbf{x}_{1}^{k + 1}, \ldots, \mathbf{x}_{j}^{k + 1}, \mathbf{x}_{j + 1}, \mathbf{x}_{j + 2}^{k}, \ldots, \mathbf{x}_{p}^{k}),
$$

it follows that

$$
- \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}) \in \partial g_{j + 1}(\mathbf{x}_{j + 1}^{k + 1}),\tag{14.18}
$$

and hence, by the subgradient inequality,

$$
g_{j + 1}(\mathbf{x}_{j + 1}^{k}) \geq g_{j + 1}(\mathbf{x}_{j + 1}^{k + 1}) - \langle \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}), \mathbf{x}_{j + 1}^{k} - \mathbf{x}_{j + 1}^{k + 1} \rangle,
$$

which, combined with (14.17), yields

$$
F(\mathbf{x}^{k, j}) - F(\mathbf{x}^{k, j + 1}) \geq \frac{1}{2L_{f}} \| \nabla f(\mathbf{x}^{k, j}) - \nabla f(\mathbf{x}^{k, j + 1}) \|^{2}.
$$

Summing the above inequality over $j = 0, 1, \ldots, p - 1$ , we obtain that

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2L_{f}} \sum_{j = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, j}) - \nabla f(\mathbf{x}^{k, j + 1}) \|^{2}.\tag{14.19}
$$

On the other hand, for any $k \geq 0$ 8

$$
\begin{array}{l} F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) = f(\mathbf{x}^{k + 1}) - f(\mathbf{x}^{*}) + g(\mathbf{x}^{k + 1}) - g(\mathbf{x}^{*}) \\ \leq \langle \nabla f(\mathbf{x}^{k + 1}), \mathbf{x}^{k + 1} - \mathbf{x}^{*} \rangle + g(\mathbf{x}^{k + 1}) - g(\mathbf{x}^{*}) \\ = \sum_{j = 0}^{p - 1} \left[\langle \nabla_{j + 1} f(\mathbf{x}^{k + 1}), \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \rangle +(g_{j + 1}(\mathbf{x}_{j + 1}^{k + 1}) - g_{j + 1}(\mathbf{x}_{j + 1}^{*})) \right] \\ = \sum_{j = 0}^{p - 1} \left[\langle \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}), \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \rangle +(g_{j + 1}(\mathbf{x}_{j + 1}^{k + 1}) - g_{j + 1}(\mathbf{x}_{j + 1}^{*})) \right].\\ + \sum_{j = 0}^{p - 1} \langle \nabla_{j + 1} f(\mathbf{x}^{k + 1}) - \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}), \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \rangle \\ \leq \sum_{j = 0}^{p - 1} \langle \nabla_{j + 1} f(\mathbf{x}^{k + 1}) - \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}), \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{{j + 1}}^{*} \rangle, \end{array}\tag{14.20}
$$

where the first inequality follows by the gradient inequality employed on the function $f,$ and the second inequality follows by the relation (14.18). Using the Cauchy– Schwarz and triangle inequalities, we can continue (14.20) and obtain that

$$
F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) \leq \sum_{j = 0}^{p - 1} \| \nabla_{j + 1} f(\mathbf{x}^{k + 1}) - \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}) \| \cdot \| \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \|.\tag{14.21}
$$

Note that

$$
\begin{array}{l} \| \nabla_{j + 1} f(\mathbf{x}^{k + 1}) - \nabla_{j + 1} f(\mathbf{x}^{k, j + 1}) \| \leq \| \nabla f(\mathbf{x}^{k + 1}) - \nabla f(\mathbf{x}^{k, j + 1}) \| \\ \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \leq \sum_{t = j + 1}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \| \\ \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \leq \sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|, \end{array}
$$

which, combined with (14.21), yields the inequality

$$
F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) \leq \left(\sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|\right) \left(\sum_{j = 0}^{p - 1} \| \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \|\right).
$$

Taking the square of both sides and using (14.16), we obtain

$$
\begin{array}{l}(F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}))^{2} \leq \left(\sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|\right)^{2} \left(\sum_{j = 0}^{p - 1} \| \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \|\right)^{2} \\ \leq p^{2} \left(\sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|^{2}\right) \left(\sum_{j = 0}^{p - 1} \| \mathbf{x}_{j + 1}^{k + 1} - \mathbf{x}_{j + 1}^{*} \|^{2}\right) \\ = p^{2} \left(\sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|^{2}\right) \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \\ \leq p^{2} \mathbb{R}^{2} \sum_{t = 0}^{p - 1} \| \nabla f(\mathbf{x}^{k, t}) - \nabla f(\mathbf{x}^{k, t + 1}) \|^{2}.\end{array} \tag{14.22}
$$

We can thus conclude by (14.19) and (14.22) that for any $k \geq 0$ 2

$$
(F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}})^{2} \leq 2L_{f} p^{2} \mathbb{R}^{2}(F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1})).
$$

Denoting $a_{k} = F(\mathbf{x}^{k}) - F_{\mathrm{opt}}$ , the last inequality can be rewritten as

$$
a_{k} - a_{k + 1} \geq \frac{1}{\gamma} a_{k + 1}^{2},
$$

where $\gamma = 2L_{f} p^{2} \mathbb{R}^{2}$ . Invoking Lemma 11.17, we obtain that for all $k \geq 2$

$$
a_{k} \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2} a_{0}, \frac{8L_{f} p^{2} \mathbb{R}^{2}}{k - 1} \right\},
$$

which is the desired result (14.15).

## 14.5.2 p <sup>=</sup> <sup>2</sup>

The dependency of the eficiency estimate (14.15) on the global Lipschitz constant $L_{f}$ is problematic since it might be a very large number. We will now develop a different line of analysis in the case where there are only two blocks $(p = 2)$ . The new analysis will produce an improved eficiency estimate that depends on the smallest block Lipschitz constant rather than on $L_{f}$ . The general model (14.9) in the case $p = 2$ amounts to

$$
\min_{\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}} \{F(\mathbf{x}_{1}, \mathbf{x}_{2}) \equiv f(\mathbf{x}_{1}, \mathbf{x}_{2}) + g_{1}(\mathbf{x}_{1}) + g_{2}(\mathbf{x}_{2})\}.\tag{14.23}
$$

As usual, we use the notation $\mathbf{x} =(\mathbf{x}_{1}, \mathbf{x}_{2})$ and $g(\mathbf{x}) = g_{1}(\mathbf{x}_{1}) + g_{2}(\mathbf{x}_{2})$ . We gather below the required assumptions.

## Assumption 14.12.

(A) For $i \in \{1, 2\}$ , the function $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex.

(B) $f : \mathbb{E} \to \mathbb{R}$ is convex. In addition, f is diferentiable over an open set containing dom(g).

(C) For any $i \in \{1, 2\}$ the gradient of f is Lipschitz continuous $w.r.t.\textbf{x}_{i}$ over dom(g ) with constant $L_{i} \in(0, \infty)$ , meaning that

$$
\left\| \nabla_{1} f \left(\mathbf{x}_{1} + \mathbf{d}_{1}, \mathbf{x}_{2}\right) - \nabla_{1} f \left(\mathbf{x}_{1}, \mathbf{x}_{2}\right) \right\| \leq L_{1} \| \mathbf{d}_{1} \|,
$$

$$
\| \nabla_{2} f(\mathbf{x}_{1}, \mathbf{x}_{2} + \mathbf{d}_{2}) - \nabla_{2} f(\mathbf{x}_{1}, \mathbf{x}_{2}) \| \leq L_{2} \| \mathbf{d}_{2} \|
$$

for any $\mathbf{x}_{1} \in$ dom $(g_{1}), \mathbf{x}_{2} \in \mathrm{dom}(g_{2})$ , and $\mathbf{d}_{1} \in \mathbb{E}_{1}, \mathbf{d}_{2} \in \mathbb{E}_{2}$ such that $\mathbf{x} + \mathbf{d}_{1} \in$ dom $(g_{1}), \mathbf{x}_{2} + \mathbf{d}_{2} \in \mathrm{dom}(g_{2})$

(D) The optimal set of (14.23), denoted by $X^{\ast}$ , is nonempty, and the corresponding optimal value is denoted by $F_{\mathrm{opt}}$

(E) For any $\alpha > 0$ , there exists $R_{\alpha} > 0$ such that

$$
\max_{\mathbf{x}, \mathbf{x}^{*} \in \mathbb{E}} \{\| \mathbf{x} - \mathbf{x}^{*} \|: F(\mathbf{x}) \leq \alpha, \mathbf{x}^{*} \in X^{*}\} \leq R_{\alpha}.
$$

The alternating minimization method for solving problem (14.23) is described below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Alternating Minimization Method
Initialization:  $\mathbf{x}_{1}^{0}\in\mathrm{dom}(g_{1}),\mathbf{x}_{2}^{0}\in\mathrm{dom}(g_{2})$  such that
 $\mathbf{x}_{2}^{0}\in\operatorname{argmin}_{\mathbf{x}_{2}\in\mathbb{E}_{2}}f(\mathbf{x}_{1}^{0},\mathbf{x}_{2})+g_{2}(\mathbf{x}_{2}).$ 
General step ( $k=0,1,\ldots$ ):
 $\mathbf{x}_{1}^{k+1}\in\operatorname{argmin}_{\mathbf{x}_{1}\in\mathbb{E}_{1}}f(\mathbf{x}_{1},\mathbf{x}_{2}^{k})+g_{1}(\mathbf{x}_{1}),$  (14.24)
 $\mathbf{x}_{2}^{k+1}\in\operatorname{argmin}_{\mathbf{x}_{2}\in\mathbb{E}_{2}}f(\mathbf{x}_{1}^{k+1},\mathbf{x}_{2})+g_{2}(\mathbf{x}_{2}).$  (14.25)
</div>

Note that, as opposed to the description of the method so far, we assume that $\mathrm{\hat{\Omega} half \Omega}^{66}$ an iteration was performed prior to the first iteration (that is, $\mathbf{x}_{2}^{0} \in$ $\operatorname{argmin}_{\mathbf{x}_{2} \in \mathbb{E}_{2}} f(\mathbf{x}_{1}^{0}, \mathbf{x}_{2}) + g_{2}(\mathbf{x}_{2}))$ . We will also utilize the auxiliary sequence $\{\mathbf{x}^{k, 1}\}_{k \geq 0}$ <sup>2 2</sup>as defined in (14.2) but use the following simpler notation:

$$
\mathbf{x}^{k + \frac{1}{2}} =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k}).
$$

We will adopt the notation used in Section 11.3.1 and consider for any $M > 0$ the partial prox-grad mappings

$$
T_{M}^{i}(\mathbf{x}) = \operatorname{prox}_{\frac{1}{M} g_{i}} \left(\mathbf{x}_{i} - \frac{1}{M} \nabla_{i} f(\mathbf{x})\right), \quad i = 1, 2,
$$

as well as the partial gradient mappings

$$
G_{M}^{i}(\mathbf{x}) = M \left(\mathbf{x}_{i} - T_{M}^{i}(\mathbf{x})\right), \quad i = 1, 2.
$$

Obviously, for any $M > 0$

$$
T_{M}(\mathbf{x}) =(T_{M}^{1}(\mathbf{x}), T_{M}^{2}(\mathbf{x})), G_{M}(\mathbf{x}) =(G_{M}^{1}(\mathbf{x}), G_{M}^{2}(\mathbf{x})),
$$

and from the definition of the alternating minimization method we have for all $k \geq 0$ 2

$$
G_{M}^{1}(\mathbf{x}^{k + \frac{1}{2}}) = \mathbf{0}, G_{M}^{2}(\mathbf{x}^{k}) = \mathbf{0}.\tag{14.26}
$$

We begin by proving the following sufficient decrease-type result.

Lemma 14.13. Suppose that Assumption 14.12 holds. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the alternating minimization method for solving problem (14.23). Then for any $k \geq 0$ the following inequalities hold:

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + \frac{1}{2}}) \geq \frac{1}{2L_{1}} \| G_{L_{1}}^{1}(\mathbf{x}^{k}) \|^{2},\tag{14.27}
$$

$$
F(\mathbf{x}^{k + \frac{1}{2}}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2L_{2}} \| G_{L_{2}}^{2}(\mathbf{x}^{k + \frac{1}{2}}) \|^{2}.\tag{14.28}
$$

Proof. Invoking the block sufficient decrease lemma (Lemma 11.9) with $\mathbf{x} = \mathbf{x}^{k}$ and $i = 1$ , we obtain

$$
F(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}) - F(T_{L_{1}}^{1}(\mathbf{x}^{k}), \mathbf{x}_{2}^{k}) \geq \frac{1}{2L_{1}} \| G_{L_{1}}^{1}(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}) \|^{2}.
$$

The inequality (14.27) now follows from the inequality $F(\mathbf{x}^{k + \frac{1}{2}}) \leq F(T_{L_{1}}^{1}(\mathbf{x}^{k})), \mathbf{x}_{2}^{k})$ <sup>1</sup>The inequality (14.28) follows by invoking the block sufficient decrease lemma with $\mathbf{x} = \mathbf{x}^{k + \frac{1}{2}}, i = 2$ , and using the inequality $F(\mathbf{x}^{k + 1}) \leq F(\mathbf{x}_{1}^{k + 1}, T_{L_{2}}^{2}(\mathbf{x}^{k + \frac{1}{2}}))$ □

The next lemma establishes an upper bound on the distance in function values of the iterates of the method.

Lemma 14.14. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the alternating minimization method for solving problem (14.23). Then for any $\mathbf{x}^{*} \in X^{*}$ and $k \geq 0$ 2

$$
F(\mathbf{x}^{k + \frac{1}{2}}) - F(\mathbf{x}^{*}) \leq \| G_{L_{1}}^{1}(\mathbf{x}^{k}) \| \cdot \| \mathbf{x}^{k} - \mathbf{x}^{*} \|,\tag{14.29}
$$

$$
F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) \leq \| G_{L_{2}}^{2}(\mathbf{x}^{k + \frac{1}{2}}) \| \cdot \| \mathbf{x}^{k + \frac{1}{2}} - \mathbf{x}^{*} \|.\tag{14.30}
$$

Proof. Note that

$$
T_{L_{1}}(\mathbf{x}^{k}) =(T_{L_{1}}^{1}(\mathbf{x}^{k}), T_{L_{1}}^{2}(\mathbf{x}^{k})) = \left(T_{L_{1}}^{1}(\mathbf{x}^{k}), \mathbf{x}_{2}^{k} - \frac{1}{L_{1}} G_{L_{1}}^{2}(\mathbf{x}^{k})\right) =(T_{L_{1}}^{1}(\mathbf{x}^{k}), \mathbf{x}_{2}^{k}),
$$

where in the last equality we used (14.26). Combining this with the block descent lemma (Lemma 11.8), we obtain that

$$
\begin{array}{c} f(T_{L_{1}}(\mathbf{x}^{k})) - f(\mathbf{x}^{*}) \leq f(\mathbf{x}^{k}) + \langle \nabla_{1} f(\mathbf{x}^{k}), T_{L_{1}}^{1}(\mathbf{x}^{k}) - \mathbf{x}_{1}^{k} \rangle \\ \qquad + \frac{L_{1}}{2} \| T_{L_{1}}^{1}(\mathbf{x}^{k}) - \mathbf{x}_{1}^{k} \|^{2} - f(\mathbf{x}^{*}) \\ = f(\mathbf{x}^{k}) + \langle \nabla f(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{k} \rangle \\ \qquad + \frac{L_{1}}{2} \| T_{L_{1}}^{1}(\mathbf{x}^{k}) - \mathbf{x}_{1}^{k} \|^{2} - f(\mathbf{x}^{*}).\end{array}\tag{14.31}
$$

Since f is convex, it follows that $f(\mathbf{x}^{k}) - f(\mathbf{x}^{*}) \leq \langle \nabla f(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle$ , which, combined with (14.31), yields

$$
f(T_{L_{1}}(\mathbf{x}^{k})) - f(\mathbf{x}^{*}) \leq \langle \nabla f(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{*} \rangle + \frac{L_{1}}{2} \| T_{L_{1}}^{1}(\mathbf{x}^{k}) - \mathbf{x}_{1}^{k} \|^{2}.\tag{14.32}
$$

Since $\begin{array}{r}{T_{L_{1}}(\mathbf{x}^{k}) = \mathrm{prox}_{\frac{1}{L \cdot 1} g} \big(\mathbf{x}^{k} - \frac{1}{L_{1}} \nabla f(\mathbf{x}^{k}) \big)} \end{array}$ , then by invoking the second prox theorem (Theorem 6.39) with $\begin{array}{r}{f = \frac{1}{L_{1}} g, \mathbf x = \mathbf x^{k} - \frac{1}{L_{1}} \nabla f(\mathbf x^{k})} \end{array}$ , and $\mathbf{y} = \mathbf{x}^{*}$ , we have

$$
g(T_{L_{1}}(\mathbf{x}^{k})) - g(\mathbf{x}^{*}) \leq L_{1} \left\langle \mathbf{x}^{k} - \frac{1}{L_{1}} \nabla f(\mathbf{x}^{k}) - T_{L_{1}}(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{*} \right\rangle.\tag{14.33}
$$

Combining inequalities (14.32) and (14.33), along with the fact that $F(\mathbf{x}^{k + \frac{1}{2}}) \leq$ $F(T_{L_{1}}^{1}({\bf x}^{k}),{\bf x}_{2}^{k}) \stackrel{\sim}{=} F({\cal \hat{T}}_{L_{1}}({\bf x}^{k}))$ , we finally have

$$
\begin{array}{l} F(\mathbf{x}^{k + \frac{1}{2}}) - F(\mathbf{x}^{*}) \leq F(T_{L_{1}}(\mathbf{x}^{k})) - F(\mathbf{x}^{*}) \\ \quad = f(T_{L_{1}}(\mathbf{x}^{k})) + g(T_{L_{1}}(\mathbf{x}^{k})) - f(\mathbf{x}^{*}) - g(\mathbf{x}^{*}) \\ \quad \leq L_{1} \langle \mathbf{x}^{k} - T_{L_{1}}(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{*} \rangle + \frac{L_{1}}{2} \| T_{L_{1}}^{1}(\mathbf{x}^{k}) - \mathbf{x}_{1}^{k} \|^{2} \\ \quad = \langle G_{L_{1}}(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{*} \rangle + \frac{1}{2L_{1}} \| G_{L_{1}}(\mathbf{x}^{k}) \|^{2} \\ \quad = \langle G_{L_{1}}(\mathbf{x}^{k}), T_{L_{1}}(\mathbf{x}^{k}) - \mathbf{x}^{k} \rangle + \langle G_{L_{1}}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle + \frac{1}{2L_{1}} \| G_{L_{1}}(\mathbf{x}^{k}) \|^{2} \\ \quad = - \frac{1}{L_{1}} \| G_{L_{1}}(\mathbf{x}^{k}) \|^{2} + \langle G_{L_{1}}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle + \frac{1}{2L_{1}} \| G_{L_{1}}(\mathbf{x}^{k}) \|^{2} \\ \quad \leq \langle G_{L_{1}}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle \\ \quad \leq \| G_{L_{1}}(\mathbf{x}^{k}) \| \cdot \| \mathbf{x}^{k} - \mathbf{x}^{*} \| \\ \quad = \| G_{L_{1}}^{1}(\mathbf{x}^{k}) \| \cdot \| \mathbf{x}^{k} - \mathbf{x}^{*} \|, \end{array}
$$

establishing (14.29). The inequality (14.30) follows by using the same argument but on the sequence generated by the alternating minimization method with starting point $(\mathbf{x}_{1}^{1}, \mathbf{x}_{2}^{0})$ and assuming that the first index to be updated is $i = 2$ 口

With the help of Lemmas 14.13 and 14.14, we can prove a sublinear rate of convergence of the alternating minimization method with an improved constant.

Theorem 14.15 $(O(1 / k)$ rate of alternating minimization—improved result). Suppose that Assumption 14.12 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the alternating minimization method for solving problem (14.23). Then

for all $k \geq 2$

$$
F(\mathbf{x}^{k}) - F_{\mathrm{opt}} \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2}(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}), \frac{8 \min \{L_{1}, L_{2}\} \mathbb{R}^{2}}{k - 1} \right\},\tag{14.34}
$$

where $R = R_{F(\mathbf{x}^{0})}$

Proof. By Lemma 14.14 and Assumption 14.12(E),

$$
F(\mathbf{x}^{k + \frac{1}{2}}) - F_{\mathrm{opt}} \leq \| G_{L_{1}}^{1}(\mathbf{x}^{k}) \| R,
$$

where $R = R_{F({\bf x}^{0})}$ . Now, by Lemma 14.13,

$$
\begin{array}{rl} & F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + \frac{1}{2}}) \geq \frac{1}{2L_{1}} \| G_{L_{1}}^{1}(\mathbf{x}^{k}) \|^{2} \\ & \quad \geq \frac{(F(\mathbf{x}^{k + \frac{1}{2}}) - F_{\mathrm{opt}})^{2}}{2L_{1} \mathbb{R}^{2}} \\ & \quad \geq \frac{1}{2L_{1} \mathbb{R}^{2}}(F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}})^{2}.\end{array}\tag{14.35}
$$

Similarly, by Lemma 14.14 and Assumption 14.12(E),

$$
F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}} \leq \| G_{L_{2}}^{2}(\mathbf{x}^{k + \frac{1}{2}}) \| R.
$$

Thus, utilizing Lemma 14.13 we obtain

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq F(\mathbf{x}^{k + \frac{1}{2}}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2L_{2}} \| G_{L_{2}}^{2}(\mathbf{x}^{k + \frac{1}{2}}) \|^{2} \geq \frac{(F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}})^{2}}{2L_{2} \mathbb{R}^{2}},
$$

which, combined with (14.35), yields the inequality

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2 \min \{L_{1}, L_{2}\} \mathbb{R}^{2}}(F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}})^{2}.\tag{14.36}
$$

Denoting $a_{k} = F(\mathbf{x}^{k}) - F_{\mathrm{opt}}$ and $\gamma = 2 \operatorname{min} \{L_{1}, L_{2}\} \mathbb{R}^{2}$ , we obtain that for all $k \geq 0$

$$
a_{k} - a_{k + 1} \geq \frac{1}{\gamma} a_{k + 1}^{2},
$$

and thus, by Lemma 11.17, it holds that for all $k \geq 2$

$$
a_{k} \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2} a_{0}, \frac{8 \min \{L_{1}, L_{2}\} \mathbb{R}^{2}}{k - 1} \right\},
$$

which is the desired result (14.34).

Remark 14.16. Note that the constant in the eficiency estimate (14.34) depends on min $\{L_{1}, L_{2}\}$ . This means that the rate of convergence of the alternating minimization method in the case of two blocks is dictated by the smallest block Lipschitz constant, meaning by the smoother part of the function. This is not the case for the eficiency estimate obtained in Theorem 14.11 for the convergence of alternating minimization with an arbitrary number of blocks, which depends on the global Lipschitz constant $L_{f}$ and is thus dictated by the “worst” block w.r.t. the level of smoothness.


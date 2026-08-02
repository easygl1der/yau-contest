---
title: "Chapter 3 \u2014 Subgradients"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 3
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 1695
source_line_end: 4179
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 0
caption_derived_image_alt: 3
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 0
  latex_environment_mismatches: 1
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 3 — Subgradients

> [[../README|本书目录]] · [[02-chapter-2-extended-real-valued-functions|上一章]] · [[04-chapter-4-conjugate-functions|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 1695–4179。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：Affine × 17；different × 3；Differentiability × 10；sufficient × 8；PDF-confirmed FOMO p.95 table repair × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 3 Subgradients

## 3.1 Definitions and First Examples

Definition 3.1 (subgradient). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper function and let $\mathbf{x} \in \operatorname{dom}(f)$ . A vector $\mathbf{g} \in \mathbb{E}^{*}$ is called a subgradient of f at $\textbf{x} if$

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle forall \mathbf{y} \in \mathbb{E}.\tag{3.1}
$$

Recall (see Section 1.11) that we use in this book the convention that the elements of $\mathbb{E}^{*}$ are exactly the elements of <sup>E</sup>, whereas the asterisk just marks the fact that the endowed norm on $\mathbb{E}^{*}$ is the dual norm $\| \cdot \|,$ rather than the endowed norm $\| \cdot \|$ on <sup>E</sup>.

The inequality (3.1) is also called the subgradient inequality. It actually says that each subgradient is associated with an underestimate Affine function, which is tangent to the surface of the function at x. Since the subgradient inequality (3.1) is trivial for ${\textbf{y}}{\notin}$ dom(f ), it is frequently restricted to points in dom(f ) and is thus written as

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle \text{for all} \mathbf{y} \in \operatorname{dom}(f).
$$

Given a point $\mathbf{x} \in \operatorname{dom}(f)$ , there might be more than one subgradient of f at x, and the set of all subgradients is called the subdiferential.

Definition 3.2 (subdiferential). The set of all subgradients of f at $\mathbf{x}$ is called the subdiferential of f at x and is denoted by $\partial f(\mathbf{x})$

$$
\partial f(\mathbf{x}) \equiv \left\{\mathbf{g} \in \mathbb{E}^{*}: f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle \text{for all} \mathbf{y} \in \mathbb{E} \right\}.
$$

When $\mathbf{x} \not \in \operatorname{dom}(f)$ , we define $\partial f(\mathbf{x}) = \varnothing$ . Actually, for proper functions, this is a direct consequence of the definition of the subdiferential set since the subgradient inequality (3.1) does not hold for ${\textbf{x}}{\notin}$ domf and $\textbf{y} \in$ domf.

Example 3.3 (subdiferential of norms at 0). Let $f : \mathbb{E} \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{x} \|$ , where $\| \cdot \|$ is the endowed norm on <sup>E</sup>. We will show that the subdiferential of $f$ at $\mathbf{x} = \mathbf{0}$ is the dual norm unit ball:

$$
\partial f(\mathbf{0}) = B_{\| \cdot \|_{*}}[\mathbf{0}, 1] = \{\mathbf{g} \in \mathbb{E}^{*}: \| \mathbf{g} \|_{*} \leq 1\}.\tag{3.2}
$$

To show (3.2), note that $\mathbf{g} \in \partial f(\mathbf{0})$ if and only if

$$
f(\mathbf{y}) \geq f(\mathbf{0}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{0} \rangle \text{for all} \mathbf{y} \in \mathbb{E},
$$

which is the same as

$$
\| \mathbf{y} \| \geq \langle \mathbf{g}, \mathbf{y} \rangle \text{for all} \mathbf{y} \in \mathbb{E}.\tag{3.3}
$$

We will prove that the latter holds true if and only if $\| \mathbf{g} \|_{*} \leq 1$ . Indeed, if $\| \mathbf{g} \|_{*} \leq 1$ then by the generalized Cauchy–Schwarz inequality (Lemma 1.4),

$$
\langle \mathbf{g}, \mathbf{y} \rangle \leq \| \mathbf{g} \|_{*} \| \mathbf{y} \| \leq \| \mathbf{y} \| \text{for any} \mathbf{y} \in \mathbb{E},
$$

implying (3.3). In the reverse direction, assume that (3.3) holds. Taking the maximum of both sides of (3.3) over all y satisfying $\| \mathbf{y} \| \leq 1$ , we get

$$
\| \mathbf{g} \|_{*} = \max_{\mathbf{y}: \| \mathbf{y} \| \leq 1} \langle \mathbf{g}, \mathbf{y} \rangle \leq \max_{\mathbf{y}: \| \mathbf{y} \| \leq 1} \| \mathbf{y} \| = 1.
$$

We have thus established the equivalence between (3.3) and the inequality $\| \mathbf{g} \|_{*} \leq 1$ which is the same as the result (3.2).

Example 3.4 (subdiferential of the $l_{1}{\bf - norm}$ at $\mathbf{0})$ . Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be given by $f(\mathbf{x}) = \| \mathbf{x} \|_{1}$ . Then, since this is a special case of Example 3.3 with $\| \cdot \| = \| \cdot \|_{1}$ and since the $l_{\infty} \mathrm{- norm}$ is the dual of the $l_{1}{\mathrm{- norm}}.$ , it follows that

$$
\partial f(0) = B_{\| \cdot \|_{\infty}}[\mathbf{0}, 1] =[- 1, 1]^{n}.
$$

In particular, when $n = 1$ , then $f(x) = \left| x \right|$ , and we have

$$
\partial f(0) =[- 1, 1].
$$

The linear underestimators that correspond to $- 0.8, - 0.3$ , and $0.7 \in \partial f(0)$ , meaning $- 0.8x, - 0.3x$ , and 0.7x, are described in Figure 3.1.

For the next example, we need the definition of the normal cone. Given a set $S \subseteq \mathbb{E}$ and a point $\mathbf{x} \in S$ , the normal cone of $S$ at x is defined as

$$
N_{S}(\mathbf{x}) = \{\mathbf{y} \in \mathbb{E}^{*}: \langle \mathbf{y}, \mathbf{z} - \mathbf{x} \rangle \leq 0 \text{for any} \mathbf{z} \in S\}.
$$

The normal cone, in addition to being a cone, is closed and convex as an intersection of half-spaces. When $\mathbf{x} \not \in S$ , we define $N_{S}({\bf x}) = \emptyset$

Example 3.5 (subdiferential of indicator functions). Suppose that $S \subseteq \mathbb{E}$ is nonempty and consider the indicator function $\delta_{S}$ . Then for any $\mathbf{x} \in S$ , we have that $\mathbf{y} \in \partial \delta_{S}(\mathbf{x})$ if and only if

$$
\delta_{S}(\mathbf{z}) \geq \delta_{S}(\mathbf{x}) + \langle \mathbf{y}, \mathbf{z} - \mathbf{x} \rangle \mathrm{forall} \mathbf{z} \in S,
$$

which is the same as

$$
\langle \mathbf{y}, \mathbf{z} - \mathbf{x} \rangle \leq 0 \text{for all} \mathbf{z} \in S.
$$

Therefore, we have that

![Figure 3.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/63bfb523aa30aacd995291fe157aa9802bd5753dab9a6759d299a0770f31f30b.jpg)  
Figure 3.1. The linear underestimators $of \left| x \right|$ corresponding to $- 0.8, - 0.3$ $0.7 \in \partial f(0)$ ; see Example 3.4.

$$
\partial \delta_{S}(\mathbf{x}) = N_{S}(\mathbf{x}) \text{for all} \mathbf{x} \in S.\tag{3.4}
$$

For ${\bf x} \notin S, \partial \delta_{S}({\bf x}) = N_{S}({\bf x}) = \emptyset$ by convention, so we obtain that (3.4) holds also for $\mathbf{x} \not \in S$

Example 3.6 (subdiferential of the indicator function of the unit ball). As a special case of Example 3.5, let

$$
S = B[\mathbf{0}, 1] = \{\mathbf{x} \in \mathbb{E}: \| \mathbf{x} \| \leq 1\}.
$$

Then $\partial \delta_{S}({\bf x}) = N_{S}({\bf x})$ , where $N_{S}({\bf x})$ is given by

$$
N_{S}(\mathbf{x}) = \left\{\mathbf{y} \in \mathbb{E}^{*}: \langle \mathbf{y}, \mathbf{z} - \mathbf{x} \rangle \leq 0 \text{for all} \mathbf{z} \in S \right\}.
$$

We will find a more explicit representation for $N_{S}({\bf x}).\mathrm{~ If ~}{\bf x} \notin S$ , then $N_{S}({\bf x}) = \emptyset$ Suppose that $\| \mathbf{x} \| \leq 1$ . A vector $\mathbf{y} \in \mathbb{E}^{*}$ satisfies $\mathbf{y} \in N_{S}(\mathbf{x})$ if and only if

$$
\langle \mathbf{y}, \mathbf{z} - \mathbf{x} \rangle \leq 0 \text{for any} \mathbf{z} \text{satisfying} \| \mathbf{z} \| \leq 1,
$$

which is the same as the inequality,

$$
\max_{\mathbf{z}: \| \mathbf{z} \| \leq 1} \langle \mathbf{y}, \mathbf{z} \rangle \leq \langle \mathbf{y}, \mathbf{x} \rangle.
$$

Using the definition of the dual norm, we obtain that the latter can be rewritten as

$$
\left\| \mathbf{y} \right\|_{*} \leq \langle \mathbf{y}, \mathbf{x} \rangle.
$$

Therefore,

$$
\partial \delta_{B[\mathbf{0}, 1]}(\mathbf{x}) = N_{B[\mathbf{0}, 1]}(\mathbf{x}) = \left\{\begin{array}{ll} \{\mathbf{y} \in \mathbb{E}^{*}: \| \mathbf{y} \|_{*} \leq \langle \mathbf{y}, \mathbf{x} \rangle\}, & \| \mathbf{x} \| \leq 1, \\ \emptyset, & \| \mathbf{x} \| > 1.\end{array} \right.
$$

Example 3.7 (subgradient of the dual function). Consider the minimization problem

$$
\min \{f(\mathbf{x}): \mathbf{g}(\mathbf{x}) \leq \mathbf{0}, \mathbf{x} \in X\},\tag{3.5}
$$

where $\varnothing \neq X \subseteq \mathbb{E}, f : \mathbb{E} \to \mathbb{R}$ and $\mathbf{g} : \mathbb{E} \mathbb{R}^{m}$ is a vector-valued function. The Lagrangian dual objective function is given by

$$
q(\pmb{\lambda}) = \min_{\mathbf{x} \in X} \left\{L(\mathbf{x}; \pmb{\lambda}) \equiv f(\mathbf{x}) + \pmb{\lambda}^{T} \mathbf{g}(\mathbf{x}) \right\}.
$$

The dual problem consists of maximizing q on its efective domain, which is given by

$$
\operatorname{dom}(- q) = \{\boldsymbol{\lambda} \in \mathbb{R}_{+}^{m}: q(\boldsymbol{\lambda}) > - \infty\}.
$$

No matter whether the primal problem (3.5) is convex or not, the dual problem

$$
\max_{\boldsymbol{\lambda} \in \mathbb{R}^{m}} \left\{q(\boldsymbol{\lambda}): \boldsymbol{\lambda} \in \operatorname{dom}(- q) \right\}
$$

is always convex, meaning that $q$ is a concave function and $\mathrm{dom}(- q)$ is a convex set. Let $\lambda_{0} \in \operatorname{dom}(- q)$ and assume that the minimum in the minimization problem defining $q(\lambda_{0})$ ，

$$
q(\boldsymbol{\lambda}_{0}) = \min_{\mathbf{x} \in X} \left\{f(\mathbf{x}) + \boldsymbol{\lambda}_{0}^{T} \mathbf{g}(\mathbf{x}) \right\},
$$

is attained at $\mathbf{x}_{0} \in X$ , that is,

$$
L(\mathbf{x}_{0}; \pmb{\lambda}_{0}) = f(\mathbf{x}_{0}) + \pmb{\lambda}_{0}^{T} \mathbf{g}(\mathbf{x}_{0}) = q(\pmb{\lambda}_{0}).
$$

We seek to find a subgradient of the convex function $- q$ at $\lambda_{0}$ . For that, note that for any $\lambda \in \operatorname{dom}(- q)$ ，

$$
\begin{array}{l} q(\boldsymbol{\lambda}) = \min_{\mathbf{x} \in X} \Big \{f(\mathbf{x}) + \boldsymbol{\lambda}^{T} \mathbf{g}(\mathbf{x}) \Big\} \\ \leq f(\mathbf{x}_{0}) + \boldsymbol{\lambda}^{T} \mathbf{g}(\mathbf{x}_{0}) \\ = f(\mathbf{x}_{0}) + \boldsymbol{\lambda}_{0}^{T} \mathbf{g}(\mathbf{x}_{0}) +(\boldsymbol{\lambda} - \boldsymbol{\lambda}_{0})^{T} \mathbf{g}(\mathbf{x}_{0}) \\ = q(\boldsymbol{\lambda}_{0}) + \mathbf{g}(\mathbf{x}_{0})^{T}(\boldsymbol{\lambda} - \boldsymbol{\lambda}_{0}).\end{array}
$$

Thus,

$$
- q(\boldsymbol{\lambda}) \geq - q \left(\boldsymbol{\lambda}_{0}\right) + \left(- \mathbf{g} \left(\mathbf{x}_{0}\right)\right)^{T} \left(\boldsymbol{\lambda} - \boldsymbol{\lambda}_{0}\right) \text{for any} \boldsymbol{\lambda} \in \operatorname{dom}(- q),
$$

concluding that

$$
- \mathbf{g}(\mathbf{x}_{0}) \in \partial(- q)(\boldsymbol{\lambda}_{0}).
$$

Example 3.8 (subgradient of the maximum eigenvalue function). Consider the function $f : \mathbb{S}^{n} \mathbb{R}$ given by $f(\mathbf{X}) = \lambda_{\operatorname{max}}(\mathbf{X})$ (recall that $\mathbb{S}^{n}$ is the set of all $n \times n$ symmetric matrices). Let $\mathbf{X} \in \mathbb{S}^{n}$ and let v be a normalized eigenvector of $\mathbf{X} \left(\| \mathbf{v} \|_{2} = 1 \right)$ associated with the maximum eigenvalue of X. We will establish the relation

$$
\mathbf{vv}^{T} \in \partial f(\mathbf{X}).\tag{3.6}
$$

To show this, note that for any $\mathbf{Y} \in \mathbb{S}^{n}$

$$
\begin{array}{l} \lambda_{\max}(\mathbf{Y}) = \underset{\mathbf{u}}{\max} \{\mathbf{u}^{T} \mathbf{Y} \mathbf{u}: \| \mathbf{u} \|_{2} = 1\} \\ \qquad \geq \mathbf{v}^{T} \mathbf{Y} \mathbf{v} \\ \qquad = \mathbf{v}^{T} \mathbf{X} \mathbf{v} + \mathbf{v}^{T}(\mathbf{Y} - \mathbf{X}) \mathbf{v} \\ \qquad = \lambda_{\max}(\mathbf{X}) \| \mathbf{v} \|_{2}^{2} + \operatorname{Tr}(\mathbf{v}^{T}(\mathbf{Y} - \mathbf{X}) \mathbf{v}) \\ \qquad = \lambda_{\max}(\mathbf{X}) + \operatorname{Tr}(\mathbf{vv}^{T}(\mathbf{Y} - \mathbf{X})) \\ \qquad = \lambda_{\max}(\mathbf{X}) + \langle \mathbf{vv}^{T}, \mathbf{Y} - \mathbf{X} \rangle, \end{array}
$$

establishing (3.6).

There is an intrinsic diference between the results in Examples 3.7 and 3.8 and the results in Examples 3.3, 3.4, 3.5, and 3.6. Only one subgradient is computed in Examples 3.7 and 3.8; such results are referred to as weak results. On the other hand, in Examples 3.3, 3.4, 3.5, and 3.6 the entire subdiferential set is characterized—such results are called strong results.

## 3.2 Properties of the Subdiferential Set

Note that the subdiferential sets computed in the previous section are all closed and convex. This is not a coincidence. Subdiferential sets are always closed and convex.

Theorem 3.9 (closedness and convexity of the subdiferential set). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper function. Then the set $\partial f(\mathbf{x})$ is closed and convex for any $\mathbf{x} \in \mathbb{E}$

Proof. For any $\mathbf{x} \in \mathbb{E}$ , the subdiferential set can be represented as

$$
\partial f(\mathbf{x}) = \bigcap_{\mathbf{y} \in \mathbb{E}} H_{\mathbf{y}},
$$

where $H_{\mathbf{y}} = \{\mathbf{g} \in \mathbb{E}^{*} : f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle\}$ . Since the sets $H_{\mathbf{y}}$ are half-spaces and, in particular, closed and convex, it follows that $\partial f(\mathbf{x})$ is closed and convex.

The subdiferential set $\partial f(\mathbf{x})$ may be empty. When it is nonempty at a given $\mathbf{x} \in \mathbb{E}$ , the function $f$ is called subdiferentiable at x.

Definition 3.10 (subdiferentiability). A proper function $f : \mathbb{E} \to(- \infty, \infty]$ is called subdiferentiable at $\mathbf{x} \in \operatorname{dom}(f)$ if $\partial f(\mathbf{x}) \neq \emptyset$

The collection of points of subdiferentiability is denoted by dom $(\partial f)$ :

$$
\operatorname{dom}(\partial f) = \left\{\mathbf{x} \in \mathbb{E}: \partial f(\mathbf{x}) \neq \emptyset \right\}.
$$

We will now show that if a function is subdiferentiable at any point in its domain, which is assumed to be convex, then it is necessarily convex.

Lemma 3.11 (nonemptiness of subdiferential sets $\mathbf{\tau} \Rightarrow \mathbf{convexity})$ . Let $f$ : $\mathbb{E}(- \infty, \infty]$ be a proper function and assume that dom $(f)$ is convex. Suppose that for any $\mathbf{x} \in \operatorname{dom}(f)$ , the set $\partial f(\mathbf{x})$ is nonempty. Then f is convex.

Proof. Let $\mathbf{c}, \mathbf{y} \in \mathrm{dom}(f)$ and $\alpha \in[0, 1]$ . Define ${\bf z}_{\alpha} =(1 - \alpha){\bf x} + \alpha{\bf y}$ . By the convexity of dom $(f), \mathbf{z}_{\alpha} \in \mathrm{dom}(f)$ , and hence there exists $\mathbf{g} \in \partial f(\mathbf{z}_{\alpha})$ , which in particular implies the following two inequalities:

$$
\begin{array}{l} f(\mathbf{y}) \geq f(\mathbf{z}_{\alpha}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{z}_{\alpha} \rangle = f(\mathbf{z}_{\alpha}) +(1 - \alpha) \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle, \\ f(\mathbf{x}) \geq f(\mathbf{z}_{\alpha}) + \langle \mathbf{g}, \mathbf{x} - \mathbf{z}_{\alpha} \rangle = f(\mathbf{z}_{\alpha}) - \alpha \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle.\end{array}
$$

Multiplying the first inequality by $\alpha,$ the second by $1 - \alpha$ , and summing them yields

$$
f((1 - \alpha) \mathbf{x} + \alpha \mathbf{y}) = f(\mathbf{z}_{\alpha}) \leq(1 - \alpha) f(\mathbf{x}) + \alpha f(\mathbf{y}).
$$

Since the latter holds for any $\mathbf{x}, \mathbf{y} \in \operatorname{dom}(f)$ with $\operatorname{dom}(f)$ being convex, it follows that the function f is convex. 口

We have thus shown that if a function is subdiferentiable at any point in its (assumed to be) convex domain, then it is convex. However, this does not mean that the reverse direction is correct. The next example describes a convex function, which is not subdiferentiable at one of the points in its domain.

Example 3.12. Consider the convex function $f : \mathbb{R} \to(- \infty, \infty]$ defined by

$$
f(x) = \left\{\begin{array}{ll} - \sqrt{x}, & x \geq 0, \\ \infty, & \text{else}.\end{array} \right.
$$

The function is plotted in Figure 3.2. It is not subdiferentiable at $x = 0$ . To show this, suppose by contradiction that there exists $g \in \mathbb{R}$ such that $g \in \partial f(0)$ . Then

$$
f(y) \geq f(0) + g(y - 0) \mathrm{forany} y \geq 0,
$$

which is the same as

$$
- \sqrt{y} \geq gy \text{for any} y \geq 0.\tag{3.7}
$$

The above is impossible since substituting $y = 1$ , we obtain that $g \le - 1$ (and in particular $g < 0)$ , while substituting $\begin{array}{r}{y = \frac{1}{2g^{2}}} \end{array}$ in (3.7) yields the inequality

$$
- \sqrt{1 /(2g^{2})} \geq 1 /(2g),
$$

$$
\frac{1}{2g^{2}} \leq \frac{1}{4g^{2}}.\quad ⅰ
$$

which is equivalent to the impossible inequality (utilizing the fact that $g < 0)$

![Figure 3.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/08d6282c6c5561a7ee056c298c09070ff28a430f5b5cd4ee0930ed09e84ea857.jpg)  
Figure 3.2. The function $f(x) = -{\sqrt{x}}$ with dom $(f) = \mathbb{R}_{+}$ . The function is not subdiferentiable at $x = 0$

Although, as demonstrated in Example 3.12, convex functions are not necessarily subdiferentiable at any point in their domain, they must be subdiferentiable at any point in the interior of their domain. This is stated in Theorem 3.14 below, which also shows the boundedness of the subdiferential set in this setting. The proof of the theorem strongly relies on the supporting hyperplane theorem stated explicitly below.

Theorem 3.13 (supporting hyperplane theorem [29, Proposition $\mathbf{2.4.1}]$ . Let $\varnothing \neq C \subseteq \mathbb{E}$ be a convex set, and let y ∈/ int(C). Then there exists $\mathbf{0} \neq \mathbf{p} \in \mathbb{E}^{*}$ such that

$$
\langle \mathbf{p}, \mathbf{x} \rangle \leq \langle \mathbf{p}, \mathbf{y} \rangle forany \mathbf{x} \in C.
$$

Theorem 3.14 (nonemptiness and boundedness of the subdiferential set at interior points of the domain). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper convex function, and assume that $\tilde{\mathbf{x}} \in \operatorname{int}(\operatorname{dom}(f))$ . Then $\partial f({\widetilde{\mathbf{x}}})$ is nonempty and bounded.

Proof. Recall that the inner product in the product space $\mathbb{E} \times \mathbb{R}$ is defined as (see Section 1.9)

$$
\langle(\mathbf{y}_{1}, \beta_{1}),(\mathbf{y}_{2}, \beta_{2}) \rangle \equiv \langle \mathbf{y}_{1}, \mathbf{y}_{2} \rangle + \beta_{1} \beta_{2}, \quad(\mathbf{y}_{1}, \beta_{1}),(\mathbf{y}_{2}, \beta_{2}) \in \mathbb{E} \times \mathbb{R}.
$$

Since $(\tilde{\mathbf{x}}, f(\tilde{\mathbf{x}}))$ is on the boundary of $\operatorname{epi}(f) \subseteq \mathbb{E} \times \mathbb{R}$ , it follows by the supporting hyperplane theorem (Theorem 3.13) that there exists a separating hyperplane between $(\tilde{\mathbf{x}}, f(\tilde{\mathbf{x}}))$ ) and $\operatorname{epi}(f)$ , meaning that there exists a nonzero vector $(\mathbf{p}, - \alpha) \in \mathbb{E}^{*} \times \mathbb{R}$ for which

$$
\langle \mathbf{p}, \tilde{\mathbf{x}} \rangle - \alpha f(\tilde{\mathbf{x}}) \geq \langle \mathbf{p}, \mathbf{x} \rangle - \alpha t \text{for any}(\mathbf{x}, t) \in \operatorname{epi}(f).\tag{3.8}
$$

Note that $\alpha \geq 0$ since $(\tilde{\mathbf{x}}, f(\tilde{\mathbf{x}}) + 1) \in \mathrm{epi}(f)$ , and hence plugging $\textbf{x} = \tilde{\textbf{x}}$ and $t = f(\tilde{\mathbf{x}}) + 1$ into (3.8) yields

$$
\langle \mathbf{p}, \tilde{\mathbf{x}} \rangle - \alpha f(\tilde{\mathbf{x}}) \geq \langle \mathbf{p}, \tilde{\mathbf{x}} \rangle - \alpha(f(\tilde{\mathbf{x}}) + 1),
$$

implying that $\alpha \geq 0$ . Since $\tilde{\mathbf{x}} \in \mathrm{int}(\mathrm{dom}(f))$ , it follows by the local Lipschitz continuity property of convex functions (Theorem 2.21) that there exist $\varepsilon > 0$ and $L > 0$ such that $B_{\| \cdot \|}[\tilde{\mathbf{x}}, \varepsilon] \subseteq \mathrm{dom}(f)$ and

$$
| f(\mathbf{x}) - f(\tilde{\mathbf{x}}) | \leq L \| \mathbf{x} - \tilde{\mathbf{x}} \| \text{for any} \mathbf{x} \in B_{\|.\|}[\tilde{\mathbf{x}}, \varepsilon].\tag{3.9}
$$

Since $B_{\| \cdot \|}[\tilde{\mathbf{x}}, \varepsilon] \subseteq \mathrm{dom}(f)$ , it follows that $(\mathbf{x}, f(\mathbf{x})) \in \mathrm{epi}(f)$ for any $\mathbf{x} \in B_{\parallel \cdot \parallel}[\tilde{\mathbf{x}}, \varepsilon]$ Therefore, plugging $t = f(\mathbf{x})$ into (3.8), yields that

$$
\langle \mathbf{p}, \mathbf{x} - \tilde{\mathbf{x}} \rangle \leq \alpha(f(\mathbf{x}) - f(\tilde{\mathbf{x}})) \text{for any} \mathbf{x} \in B_{\| \cdot \|}[\tilde{\mathbf{x}}, \varepsilon].\tag{3.10}
$$

Combining (3.9) and (3.10), we obtain that for any $\mathbf{x} \in B_{\parallel \cdot \parallel}[\tilde{\mathbf{x}}, \varepsilon]$ ，

$$
\langle \mathbf{p}, \mathbf{x} - \tilde{\mathbf{x}} \rangle \leq \alpha(f(\mathbf{x}) - f(\tilde{\mathbf{x}})) \leq \alpha L \| \mathbf{x} - \tilde{\mathbf{x}} \|.\tag{3.11}
$$

Take $\mathbf{p}^{\dagger} \in \mathbb{E}$ satisfying $\langle \mathbf{p}, \mathbf{p}^{\dagger} \rangle = \| \mathbf{p} \|$ <sub>∗</sub> and $\| \mathbf{p}^{\dagger} \| = 1$ . Since $\tilde{\mathbf{x}} + \varepsilon \mathbf{p}^{\dagger} \in B_{\parallel \cdot \parallel}[\tilde{\mathbf{x}}, \varepsilon]$ , we can plug $\mathbf{x} = \tilde{\mathbf{x}} + \varepsilon \mathbf{p}^{\dagger}$ into (3.11) and obtain that

$$
\varepsilon \| \mathbf{p} \|_{*} = \varepsilon \langle \mathbf{p}, \mathbf{p}^{\dagger} \rangle \leq \alpha L \varepsilon \| \mathbf{p}^{\dagger} \| = \alpha L \varepsilon.
$$

Therefore, $\alpha > 0$ , since otherwise we would have $\alpha = 0$ and $\mathrm{~ \bf ~ p ~} = \mathrm{~ \bf ~ 0 ~}$ , which is impossible by the fact that the vector $(\mathbf{p}, \alpha)$ is not the zeros vector. Taking $t = f(\mathbf{x})$ in (3.8) and dividing by α yields

$$
f(\mathbf{x}) \geq f(\tilde{\mathbf{x}}) + \langle \mathbf{g}, \mathbf{x} - \tilde{\mathbf{x}} \rangle \mathrm{forall} \mathbf{x} \in \mathrm{dom}(f),\tag{3.12}
$$

where $\mathbf{g} = \mathbf{p} / \alpha$ . Thus, $\mathbf{g} \in \partial f({\widetilde{\mathbf{x}}})$ , establishing the nonemptiness of $\partial f({\widetilde{\mathbf{x}}})$ . To show the boundedness of $\partial f({\widetilde{\mathbf{x}}})$ , let $\mathbf{g} \in \partial f(\tilde{\mathbf{x}})$ , meaning that (3.12) holds. Take $\mathbf{g}^{\dagger} \in \mathbb{E}$ for which $\| \mathbf{g} \|_{*} = \langle \mathbf{g}, \mathbf{g}^{\dag} \rangle$ and $\| \mathbf{g}^{\dagger} \| = 1$ . Then plugging $\mathbf{x} = \tilde{\mathbf{x}} + \varepsilon \mathbf{g}^{\dagger}$ in (3.12) yields

$$
\varepsilon \| \mathbf{g} \|_{*} = \varepsilon \langle \mathbf{g}, \mathbf{g}^{\dagger} \rangle = \langle \mathbf{g}, \mathbf{x} - \tilde{\mathbf{x}} \rangle \leq f(\mathbf{x}) - f(\tilde{\mathbf{x}}) \stackrel{(3.9)}{\leq} L \| \mathbf{x} - \tilde{\mathbf{x}} \| = L \varepsilon,
$$

showing that $\partial f(\tilde{\mathbf{x}}) ~ \subseteq ~ B_{\| \cdot \|_{*}}[\mathbf{0}, L]$ , and hence establishing the boundedness of $\partial f({\widetilde{\mathbf{x}}})$

The result of Theorem 3.14 can be stated as the following inclusion relation:

$$
\operatorname{int}(\operatorname{dom}(f)) \subseteq \operatorname{dom}(\partial f).
$$

A direct consequence of Theorem 3.14 is that real-valued convex functions (namely, convex functions $f$ with dom $(f) = \mathbb{E})$ are subdiferentiable at any point.

Corollary 3.15 (subdiferentiability of real-valued convex functions). Let $f : \mathbb{E} \to \mathbb{R}$ be a convex function. Then f is subdiferentiable over <sup>E</sup>.

We can extend the boundedness result of Theorem 3.14 and show that subgradients of points in a given compact set contained in the interior of the domain are always bounded.

Theorem 3.16 (boundedness of subgradients over compact sets). Let f : $\mathbb{E}(- \infty, \infty]$ be a proper convex function, and assume that $X \subseteq \operatorname{int}(\operatorname{dom}(f))$ is nonempty and compact. Then $\textstyle Y = \bigcup_{\mathbf{x} \in X} \partial f(\mathbf{x})$ is nonempty and bounded.

Proof. The set Y is nonempty, since by Theorem 3.14 $\partial f(\mathbf{x}) \neq \emptyset$ for any $\mathbf{x} \in X$ To prove the boundedness, assume by contradiction that there exists a sequence $\{\mathbf{x}_{k}\}_{k \geq 1} \subseteq X$ and $\mathbf{g}_{k} \in \partial f(\mathbf{x}_{k})$ such that $\left\| \mathbf{g}_{k} \right\|_{*} \to \infty$ as $k \infty$ . For any $k,$ let $\mathbf{g}_{k}^{\dagger}$ be a vector satisfying $\begin{array}{r}{\langle \mathbf{g}_{k}, \mathbf{g}_{k}^{\dagger} \rangle = \| \mathbf{g}_{k} \|,} \end{array}$ and $\| \mathbf{g}_{k}^{\dagger} \| = 1$ . Since X is compact, (int(dom $(f))^{c}$ (the complement of int(dom(f ))) is closed, and $X \cap(\operatorname{int}(\operatorname{dom}(f)))^{c} =$ ∅, it follows that the distance between the two sets is nonempty, meaning in particular that there exists an $\varepsilon > 0$ for $\mathrm{which}^{10}$

$$
\| \mathbf{x} - \mathbf{y} \| \geq \varepsilon \text{for any} \mathbf{x} \in X, \mathbf{y} \notin \operatorname{int}(\operatorname{dom}(f)).\tag{3.13}
$$

The relation $\mathbf{g}_{k} \in \partial f(\mathbf{x}_{k})$ implies in particular that

$$
f \left(\mathbf{x}_{k} + \frac{\varepsilon}{2} \mathbf{g}_{k}^{\dagger}\right) - f(\mathbf{x}_{k}) \geq \frac{\varepsilon}{2} \langle \mathbf{g}_{k}, \mathbf{g}_{k}^{\dagger} \rangle = \frac{\varepsilon}{2} \| \mathbf{g}_{k} \|_{*},\tag{3.14}
$$

where we used the fact that by (3.13), $\begin{array}{r}{\mathbf{x}_{k} + \frac{\varepsilon}{2} \mathbf{g}_{k}^{\dagger} \in \mathrm{int}(\mathrm{dom}(f))} \end{array}$ . We will show that the left-hand side of (3.14) is bounded. Suppose by contradiction that it is not bounded. Then there exist subsequences $\{\mathbf{x}_{k}\}_{k \in T}, \{\mathbf{g}_{k}^{\dag}\}_{k \in T} \(T$ being the set of indices of the subsequences) for which

$$
f \left(\mathbf{x}_{k} + \frac{\varepsilon}{2} \mathbf{g}_{k}^{\dagger}\right) - f(\mathbf{x}_{k}) \rightarrow \infty \text{as} k \stackrel{T}{\longrightarrow} \infty.\tag{3.15}
$$

Since both $\{{\bf{x}}_{k}\}_{k \in T}$ and $\{\mathbf{g}_{k}^{\dagger}\}_{k \in T}$ are bounded, it follows that there exist convergent subsequences $\{\mathbf{x}_{k}\}_{k \in S}, \{\mathbf{g}_{k}^{\dag}\}_{k \in S} \left(S \subseteq T \right)$ whose limits will be denoted by x¯ and $\bar{\bf g}.$ Consequently, $\begin{array}{r}{\mathbf{x}_{k} + \frac{\varepsilon}{2} \mathbf{g}_{k}^{\dagger} \bar{\mathbf{x}} + \frac{\varepsilon}{2} \bar{\mathbf{g}}} \end{array}$ as $k{\stackrel{S}{\to}} \infty$ . Since $\begin{array}{r}{{\bf x}_{k},{\bf x}_{k} + \frac{\varepsilon}{2}{\bf g}_{k}^{\dagger}, \bar{\bf x} + \frac{\varepsilon}{2} \bar{\bf g}} \end{array}$ are $\mathrm{all}^{11}$ in int $\left(\operatorname{dom}(f) \right)$ , it follows by the continuity of $f$ over int(dom(f )) (Theorem 2.21) that

$$
f \left(\mathbf{x}_{k} + \frac{\varepsilon}{2} \mathbf{g}_{k}^{\dagger}\right) - f(\mathbf{x}_{k}) \rightarrow f \left(\bar{\mathbf{x}} + \frac{\varepsilon}{2} \bar{\mathbf{g}}^{\dagger}\right) - f(\bar{\mathbf{x}}) \text{as} k \stackrel{{S}}{{\to}} \infty,
$$

which is a contradiction of (3.15). We can thus conclude that the left-hand side of (3.14) is bounded and hence that the right-hand side of (3.14) is also bounded, in contradiction to our assumption that $\| \mathbf{g}_{k} \|$ <sub>∗</sub> goes to $\infty$ as $k \to \infty$

Subdiferentiability can be guaranteed for points that are not necessarily in the interior of the domain but are in the interior of the domain w.r.t. its Affine hull. This is the notion of relative interior that we now recall:

$$
\operatorname{ri}(S) = \{\mathbf{x} \in \operatorname{aff}(S): B[\mathbf{x}, \varepsilon] \cap \operatorname{aff}(S) \subseteq S \text{for some} \varepsilon > 0\}.
$$

One key property of the relative interior is that it is nonempty for convex sets.

Theorem 3.17 (nonemptiness of the relative interior [108, Theorem 6.2]). Let $C \subseteq \mathbb{E}$ be a nonempty convex set. Then $\operatorname{ri}(C)$ is nonempty.

The proof of $_{(3.13)}$ is simple. Suppose by contradiction that there exist sequences $\{\mathbf{x}_{k}\}_{k \geq 1} \subseteq$ $X$ and $\{\mathbf{y}_{k}\}_{k \geq 1} \subseteq(\mathrm{int}(\mathrm{dom}(f)))^{c}$ satisfying $\| \mathbf{x}_{k} - \mathbf{y}_{k} \| \to 0$ as $k \to \infty$ . Since $\{\mathbf{x}_{k}\}_{k \ge 1}$ <sup>x 1</sup>is bounded, <sup>y</sup>there exists $\bar{M} > 0$ for which $\lvert \lvert \mathbf{x}_{k} \rvert \rvert \leq \dot{M}$ <sup>x y</sup>for all k. Therefore, $\| \mathbf{y}_{k} \| \leq \| \mathbf{x}_{k} - \mathbf{y}_{k} \| + \| \mathbf{x}_{k} \| \leq \| \mathbf{x}_{k}$ $\mathbf{y}_{k} \| + M$ <sup>x</sup>, and we can conclude by the boundedness of $\{\| \mathbf{x}_{k} - \mathbf{y}_{k} \|\}_{k \geq 1}$ <sup>x</sup>that $\{\mathbf{y}_{k}\}_{k \ge 1}$ <sup>x</sup>is bounded. <sup>1</sup>By the Bolzano–Weierstrass theorem, there exist convergent subsequences $\mathbf{x}_{k_{j}} \bar{\mathbf{x}}, \mathbf{y}_{k_{j}} \bar{\mathbf{y}}$ , and by the closedness of X and $(\operatorname{int}(\operatorname{dom}(f)))^{c}$ , we have that $\bar{\mathbf{x}} \in X, \bar{\mathbf{y}} \in(\mathrm{int}(\mathrm{dom}(f)))^{c}.$ . The limit $\| \mathbf{x}_{k_{j}} - \mathbf{y}_{k_{j}} \| \to 0{\mathrm{~ as ~}} j \to \infty$ <sup>x y</sup>now brings us to the impossible equality $\bar{\mathbf{x}} = \bar{\mathbf{y}}$

A well-known result is that a proper convex function is always subdiferentiable at relative interior points of its domain. We state this result without a proof.

Theorem 3.18 (nonemptiness of the subdiferential set at relative interior points [108, Theorem 23.4]). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper convex function, and let $\tilde{\mathbf{x}} \in \mathrm{ri}(\mathrm{dom}(f))$ . Then $\partial f({\widetilde{\mathbf{x}}})$ is nonempty.

The result stated in Theorem 3.18 can be written as the inclusion

$$
\operatorname{ri}(\operatorname{dom}(f)) \subseteq \operatorname{dom}(\partial f).
$$

Since the relative interior of $\operatorname{dom}(f)$ is always nonempty (Theorem 3.17), we can conclude that there always exists a point in the domain for which the subdiferential set is nonempty.

Corollary 3.19. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper convex function. Then there exists $\mathbf{x} \in \operatorname{dom}(f)$ for which $\partial f(\mathbf{x})$ is nonempty.

One instance in which the subdiferential set $\partial f(\mathbf{x})$ is guaranteed to be unbounded is when the dimension of the domain of the function is strictly smaller than the dimension of the underlying space <sup>E</sup>.

Theorem 3.20 (unboundedness of the subdiferential set when dim $\left(\mathbf{dom}(f) \right)$ $< \dim(\mathbb{E}))$ . Let $f : \mathbb{E}(- \infty, \infty]$ be a proper convex function. Suppose that $\dim(\operatorname{dom}(f)) \ < \ \dim(\mathbb{E})$ and let $\mathbf{x} \in \mathop{\mathrm{dom}}(f)$ . If $\partial f(\mathbf{x}) \neq \emptyset.$ , then $\partial f(\mathbf{x})$ is unbounded.

Proof. Let $\eta$ be an arbitrary vector in $\partial f(\mathbf{x})$ . The $\sec^{12} \bigvee \equiv \operatorname{aff}(\operatorname{dom}(f)) - \{\mathbf{x}\}$ is a vector space. The dimension condition translates to $\dim(\mathbb{V}) < \dim(\mathbb{E})$ , which in particular implies that there exists a nonzero vector $\mathbf{v} \in \mathbb{E}$ such that $\langle \mathbf{v}, \mathbf{w} \rangle = 0$ for any $\mathbf{w} \in \mathbb{V}$ . Take any $\beta \in \mathbb{R}$ . For any $\mathbf{y} \in \operatorname{dom}(f)$ 2

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \boldsymbol{\eta}, \mathbf{y} - \mathbf{x} \rangle = f(\mathbf{x}) + \langle \boldsymbol{\eta} + \beta \mathbf{v}, \mathbf{y} - \mathbf{x} \rangle,
$$

where the equality is due to the fact that $\mathbf{y} - \mathbf{x} \in \mathbb{V}.$ . We thus obtained that $\eta + \beta \mathbf{v} \in \partial f(\mathbf{x})$ for any $\beta_{;}$ , implying the unboundedness of $\partial f(\mathbf{x})$ □

## 3.3 Directional Derivatives

## 3.3.1 Definition and Basic Properties

Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper function and let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ . The directional derivative of $f$ at x in a given direction d $\in \mathbb{E}$ , if it exists, is defined by

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) \equiv \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x})}{\alpha}.
$$

A well-known result states that convex functions have directional derivatives in all directions at points in the interior of their domains.

Theorem 3.21 ([108, Theorem $\mathbf{23.1}]^{13})$ . Let $f : \mathbb{E}(- \infty, \infty]$ be a proper convex function and let ${\textbf{x}} \in$ int $\left(\operatorname{dom}(f) \right)$ . Then $for$ any d $\in \mathbb{E}$ , the directional derivative $f^{\prime}(\mathbf{x}; \mathbf{d})$ exists.

It is important to establish some basic properties of the function d $\mapsto f^{\prime}(\mathbf{x}; \mathbf{d})$ The next theorem shows that it is convex and homogeneous of degree 1.

Lemma 3.22 (convexity and homogeneity of d $\mapsto \f^{\prime}({\bf x};{\bf d}))$ . Let $f : \mathbb { E } $ $(- \infty, \infty]$ be a proper convex function and let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ . Then

(a) the function d $\mapsto f^{\prime}(\mathbf{x}; \mathbf{d})$ is convex;

(b) for any $\lambda \geq 0$ and $\mathbf{d} \in \mathbb{E},$ it holds that $f^{\prime}(\mathbf{x}; \lambda \mathbf{d}) = \lambda f^{\prime}(\mathbf{x}; \mathbf{d})$

Proof. (a) To show that the function $g(\mathbf{d}) \equiv f^{\prime}(\mathbf{x}; \mathbf{d})$ is convex, take $\mathbf{d}_{1}, \mathbf{d}_{2} \in \mathbb{E}$ and $\lambda \in[0, 1]$ . Then

$$
\begin{array}{l} f^{\prime}(\mathbf{x}; \lambda \mathbf{d}_{1} +(1 - \lambda) \mathbf{d}_{2}) \\ = \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha[\lambda \mathbf{d}_{1} +(1 - \lambda) \mathbf{d}_{2}]) - f(\mathbf{x})}{\alpha} \\ = \lim_{\alpha \to 0^{+}} \frac{f(\lambda(\mathbf{x} + \alpha \mathbf{d}_{1}) +(1 - \lambda)(\mathbf{x} + \alpha \mathbf{d}_{2})) - f(\mathbf{x})}{\alpha} \\ \leq \lim_{\alpha \to 0^{+}} \frac{\lambda f(\mathbf{x} + \alpha \mathbf{d}_{1}) +(1 - \lambda) f(\mathbf{x} + \alpha \mathbf{d}_{2}) - f(\mathbf{x})}{\alpha} \\ = \lambda \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \mathbf{d}_{1}) - f(\mathbf{x})}{\alpha} +(1 - \lambda) \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \mathbf{d}_{2}) - f(\mathbf{x})}{\alpha} \\ = \lambda f^{\prime}(\mathbf{x}; \mathbf{d}_{1}) +(1 - \lambda) f^{\prime}(\mathbf{x}; \mathbf{d}_{2}), \end{array}
$$

where the inequality follows from Jensen’s inequality for convex functions.

(b) If $\lambda = 0$ , the claim is trivial. Take $\lambda > 0$ . Then

$$
f^{\prime}(\mathbf{x}; \lambda \mathbf{d}) = \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \lambda \mathbf{d}) - f(\mathbf{x})}{\alpha} = \lambda \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \lambda \mathbf{d}) - f(\mathbf{x})}{\alpha \lambda} = \lambda f^{\prime}(\mathbf{x}; \mathbf{d}).
$$

The next result highlights a connection between function values and directional derivatives under a convexity assumption.

Lemma 3.23. Let $f : \mathbb{E}(- \infty, \infty]$ be a proper convex function, and let ${\textbf{x}} \in$ int $\left(\operatorname{dom}(f) \right)$ ). Then

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + f^{\prime}(\mathbf{x}; \mathbf{y} - \mathbf{x}) \text{for all} \mathbf{y} \in \operatorname{dom}(f).
$$

Proof. By the definition of the directional derivative,

$$
\begin{array}{l} f^{\prime}(\mathbf{x}; \mathbf{y} - \mathbf{x}) = \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha(\mathbf{y} - \mathbf{x})) - f(\mathbf{x})}{\alpha} \\ \qquad = \lim_{\alpha \to 0^{+}} \frac{f((1 - \alpha) \mathbf{x} + \alpha \mathbf{y}) - f(\mathbf{x})}{\alpha} \\ \qquad \leq \lim_{\alpha \to 0^{+}} \frac{- \alpha f(\mathbf{x}) + \alpha f(\mathbf{y})}{\alpha} \\ \qquad = f(\mathbf{y}) - f(\mathbf{x}), \end{array}
$$

where the inequality follows by Jensen’s inequality.

A useful “calculus” rule for directional derivatives shows how to compute the directional derivative of maximum of a finite collection of functions without any convexity assumptions.

Theorem 3.24 (directional derivative of maximum of functions). Suppose that $f(\mathbf{x}) = \operatorname{max} \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \ldots, f_{m}(\mathbf{x})\}$ , where $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ are proper functions. Let $\mathbf{x} \in \bigcap_{i = 1}^{m}$ int(dom(f<sub>i</sub>)) and $\mathbf{d} \in \mathbb{E}$ . Assume that $f_{i}^{\prime}(\mathbf{x}; \mathbf{d})$ exist for any $i \in \{1, 2,..., m\}$ . Then

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i \in I(\mathbf{x})} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}),
$$

where $I(\mathbf{x}) = \{i : f_{i}(\mathbf{x}) = f(\mathbf{x})\}$

Proof. For any $i \in \{1, 2,..., m\}$

$$
\lim_{t \rightarrow 0^{+}} f_{i}(\mathbf{x} + t \mathbf{d}) = \lim_{t \rightarrow 0^{+}} \left[t \frac{f_{i}(\mathbf{x} + t \mathbf{d}) - f_{i}(\mathbf{x})}{t} + f_{i}(\mathbf{x}) \right] = 0 \cdot f_{i}^{\prime}(\mathbf{x}; \mathbf{d}) + f_{i}(\mathbf{x}) = f_{i}(\mathbf{x}).\tag{3.16}
$$

By the definition of $I({\bf x}), f_{i}({\bf x}) > f_{j}({\bf x})$ for any $i \in I(\mathbf{x}), j \notin I(\mathbf{x})$ . Utilizing (3.16), it follows that there exists an $\varepsilon > 0$ such that $f_{i}(\mathbf{x} + t \mathbf{d}) > f_{j}(\mathbf{x} + t \mathbf{d})$ for any $i \in I(\mathbf{x}), j \notin I(\mathbf{x})$ and $t \in(0, \varepsilon]$ . Therefore, for any $t \in(0, \varepsilon]$

$$
f(\mathbf{x} + t \mathbf{d}) = \max_{i = 1, 2, \dots, m} f_{i}(\mathbf{x} + t \mathbf{d}) = \max_{i \in I(\mathbf{x})} f_{i}(\mathbf{x} + t \mathbf{d}).
$$

Consequently, for any $t \in(0, \varepsilon]$

$$
\frac{f(\mathbf{x} + t \mathbf{d}) - f(\mathbf{x})}{t} = \frac{\max_{i \in I(\mathbf{x})} f_{i}(\mathbf{x} + t \mathbf{d}) - f(\mathbf{x})}{t} = \max_{i \in I(\mathbf{x})} \frac{f_{i}(\mathbf{x} + t \mathbf{d}) - f_{i}(\mathbf{x})}{t},
$$

where the last equality follows from the fact that $f(\mathbf{x}) = f_{i}(\mathbf{x})$ for any $i \in I(\mathbf{x})$ Finally, taking $t \to 0^{+}$ , we obtain that

$$
\begin{array}{l} f^{\prime}(\mathbf{x}; \mathbf{d}) = \lim_{t \to 0^{+}} \frac{f(\mathbf{x} + t \mathbf{d}) - f(\mathbf{x})}{t} \\ \qquad = \lim_{t \to 0^{+}} \max_{i \in I(\mathbf{x})} \frac{f_{i}(\mathbf{x} + t \mathbf{d}) - f_{i}(\mathbf{x})}{t} \\ \qquad = \max_{i \in I(\mathbf{x})} \lim_{t \to 0^{+}} \frac{f_{i}(\mathbf{x} + t \mathbf{d}) - f_{i}(\mathbf{x})}{t} \\ \qquad = \max_{i \in I(\mathbf{x})} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}).\quad \square \end{array}
$$

Note that an assumption of Theorem 3.24 is that the directional derivatives $f_{i}^{\prime}(\mathbf{x}; \mathbf{d})$ exist. This assumption is automatically satisfied when the functions $f_{1}, f_{2}, \ldots, f_{m}$ are convex. We can thus write the next corollary that replaces the condition on the existence of the directional derivatives by a convexity assumption.

Corollary 3.25 (directional derivative of maximum of functions—convex case). Suppose that $f(\mathbf{x}) = \operatorname{max} \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \ldots, f_{m}(\mathbf{x})\}$ , where $f _ { 1 } , f _ { 2 } , \ldots , f _ { m } \ $ $\mathbb{E} \to(- \infty, \infty]$ are proper convex functions. Let $\mathbf{x} \in \cap_{i = 1}^{m}$ int $\left(\operatorname{dom}(f_{i}) \right)$ and d $\in \mathbb{E}$ Then

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i \in I(\mathbf{x})} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}),
$$

where $I(\mathbf{x}) = \{i : f_{i}(\mathbf{x}) = f(\mathbf{x})\}$

## 3.3.2 The Max Formula

We will now prove an extremely important and useful result, known as the max formula, that connects subgradients and directional derivatives.

Theorem 3.26 (max formula). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper convex function. Then for any $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and d $\in \mathbb{E}$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max \left\{\langle \mathbf{g}, \mathbf{d} \rangle : \mathbf{g} \in \partial f(\mathbf{x}) \right\}.\tag{3.17}
$$

Proof. Let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and $\mathbf{d} \in \mathbb{E}$ . By the subgradient inequality, we have that for any $\mathbf{g} \in \partial f(\mathbf{x})$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \lim_{\alpha \to 0^{+}} \frac{1}{\alpha}(f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x})) \geq \lim_{\alpha \to 0^{+}} \langle \mathbf{g}, \mathbf{d} \rangle = \langle \mathbf{g}, \mathbf{d} \rangle\tag{3.18}
$$

and, consequently,

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) \geq \max \{\langle \mathbf{g}, \mathbf{d} \rangle : \mathbf{g} \in \partial f(\mathbf{x})\}.\tag{3.19}
$$

All that is left is to show the reverse direction of the above inequality. For that, define the function $h(\mathbf{w}) \equiv f^{\prime}(\mathbf{x}; \mathbf{w})$ . Then by Lemma $3.22(a)$ , h is a real-valued convex function and is thus subdiferentiable over <sup>E</sup> (Corollary 3.15). Let $\tilde{\mathbf{g}} \in \partial h(\mathbf{d})$ Then for any $\mathbf{v} \in \mathbb{E}$ and $\alpha \geq 0$ , using the homogeneity of h (Lemma 3.22(b)),

$$
\alpha f^{\prime}(\mathbf{x}; \mathbf{v}) = f^{\prime}(\mathbf{x}; \alpha \mathbf{v}) = h(\alpha \mathbf{v}) \geq h(\mathbf{d}) + \langle \tilde{\mathbf{g}}, \alpha \mathbf{v} - \mathbf{d} \rangle = f^{\prime}(\mathbf{x}; \mathbf{d}) + \langle \tilde{\mathbf{g}}, \alpha \mathbf{v} - \mathbf{d} \rangle.
$$

Therefore,

$$
\alpha(f^{\prime}(\mathbf{x}; \mathbf{v}) - \langle \tilde{\mathbf{g}}, \mathbf{v} \rangle) \geq f^{\prime}(\mathbf{x}; \mathbf{d}) - \langle \tilde{\mathbf{g}}, \mathbf{d} \rangle.\tag{3.20}
$$

Since the above inequality holds for any $\alpha \geq 0$ , it follows that the coeficient of α in the left-hand side expression is nonnegative (otherwise, inequality (3.20) would be violated for large enough α), meaning that

$$
f^{\prime}(\mathbf{x}; \mathbf{v}) \geq \langle \tilde{\mathbf{g}}, \mathbf{v} \rangle.
$$

Thus, by Lemma 3.23, for any $\mathbf{y} \in \operatorname{dom}(f)$

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + f^{\prime}(\mathbf{x}; \mathbf{y} - \mathbf{x}) \geq f(\mathbf{x}) + \langle \tilde{\mathbf{g}}, \mathbf{y} - \mathbf{x} \rangle,
$$

showing that $\tilde{\mathbf{g}} \in \partial f(\mathbf{x})$ . Taking $\alpha = 0$ in (3.20), we have that $f^{\prime}(\mathbf{x}; \mathbf{d}) \leq \langle \tilde{\mathbf{g}}, \mathbf{d} \rangle$ , so that

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) \leq \langle \tilde{\mathbf{g}}, \mathbf{d} \rangle \leq \max \{\langle \mathbf{g}, \mathbf{d} \rangle : \mathbf{g} \in \partial f(\mathbf{x})\},
$$

establishing the desired result.

Remark 3.27. The max formula (3.17) can also be rewritten using the support function notation as follows:

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \sigma_{\partial f(\mathbf{x})}(\mathbf{d}).
$$

## 3.3.3 Differentiability

Definition 3.28 (Differentiability). Let $f : \mathbb{E} \to(- \infty, \infty]$ and $\mathbf{x} \in \operatorname{int}(\operatorname{dom} f)$ The function f is said to be diferentiable at x if there exists $\mathbf{g} \in \mathbb{E}^{*}$ such that

$$
\lim_{\mathbf{h} \to \mathbf{0}} \frac{f(\mathbf{x} + \mathbf{h}) - f(\mathbf{x}) - \langle \mathbf{g}, \mathbf{h} \rangle}{\| \mathbf{h} \|} = 0.\tag{3.21}
$$

The $unique^{14}$ vector g satisfying (3.21) is called the gradient of f at x and is denoted by $\nabla f(\mathbf{x})$

The above is actually a definition of Fr´echet Differentiability, which is the one used in this book.

If f is diferentiable at $\mathbf{x} \in \operatorname{int}(\operatorname{dom} f)$ , then the directional derivative has a simple formula.

Theorem 3.29 (directional derivatives at points of Differentiability). Let $f : \mathbb{E} \to(- \infty, \infty]$ be proper, and suppose that f is diferentiable at ${\textbf{x}} \in$ int(domf ). Then for any $\mathbf{d} \in \mathbb{E}$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \langle \nabla f(\mathbf{x}), \mathbf{d} \rangle.\tag{3.22}
$$

Proof. The formula is obviously correct for $\mathbf{d} = \mathbf{0}$ . Suppose that d $\neq \mathbf{0}$ . The Differentiability of f implies that

$$
\begin{array}{l} 0 = \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \alpha \mathbf{d} \rangle}{\| \alpha \mathbf{d} \|} \\ = \lim_{\alpha \to 0^{+}} \left[\frac{f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x})}{\alpha \| \mathbf{d} \|} - \frac{\langle \nabla f(\mathbf{x}), \mathbf{d} \rangle}{\| \mathbf{d} \|} \right].\end{array}
$$

Therefore,

$$
\begin{array}{l} f^{\prime}(\mathbf{x}; \mathbf{d}) = \lim_{\alpha \to 0^{+}} \frac{f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x})}{\alpha} \\ \qquad = \lim_{\alpha \to 0^{+}} \left\{\| \mathbf{d} \| \left[\frac{f(\mathbf{x} + \alpha \mathbf{d}) - f(\mathbf{x})}{\alpha \| \mathbf{d} \|} - \frac{\langle \nabla f(\mathbf{x}), \mathbf{d} \rangle}{\| \mathbf{d} \|} \right] + \langle \nabla f(\mathbf{x}), \mathbf{d} \rangle \right\} \\ \qquad = \langle \nabla f(\mathbf{x}), \mathbf{d} \rangle.\quad \square \end{array}
$$

Example 3.30 (directional derivative of maximum of diferentiable functions). Consider the function $f(\mathbf{x}) = \mathrm{max}_{i = 1, 2,..., m} f_{i}(\mathbf{x})$ , where $f_{i} : \mathbb{E}(- \infty, \infty]$ are proper functions. Assume that $f_{1}, f_{2}, \ldots, f_{m}$ are diferentiable at a given point $\mathbf{x} \in \cap_{i = 1}^{m}$ int(dom(f<sub>i</sub>). Then by Theorem 3.29, for any d $\in \mathbb{E}, f_{i}^{\prime}(\mathbf{x}; \mathbf{d}) = \langle \nabla f_{i}(\mathbf{x}), \mathbf{d} \rangle$ Therefore, invoking Theorem 3.24,

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i \in I(\mathbf{x})} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i \in I(\mathbf{x})} \langle \nabla f_{i}(\mathbf{x}), \mathbf{d} \rangle,
$$

where $I(\mathbf{x}) = \{i : f_{i}(\mathbf{x}) = f(\mathbf{x})\}$

Example 3.31 (gradient of $\textstyle{\frac{1}{2}} d_{C}^{2}(\cdot))$ .<sup>15</sup> Suppose that <sup>E</sup> is a Euclidean space, and let $C \subseteq \mathbb{E}$ be nonempty closed and convex set. Consider the function $\varphi _ { C } : \mathbb { E } $ <sup>R</sup> given by $\varphi_{C}({\bf x}) \equiv{\textstyle \frac{1}{2}} d_{C}^{2}({\bf x}) ={\textstyle \frac{1}{2}} \|{\bf x} - P_{C}({\bf x}) \|^{2}$ , where $P_{C}$ is the so-called orthogonal projection mapping defined by

$$
P_{C}(\mathbf{x}) \equiv \operatorname{argmin}_{\mathbf{y} \in C} \| \mathbf{y} - \mathbf{x} \|.
$$

It is well known that $P_{C}$ is well defined (exists and unique) when the underlying set $C$ is nonempty, closed, and convex.<sup>16</sup> We will show that for any $\mathbf{x} \in \mathbb{E}$ 4

$$
\nabla \varphi_{C}(\mathbf{x}) = \mathbf{x} - P_{C}(\mathbf{x}).\tag{3.23}
$$

For that, fix $\mathbf{x} \in \mathbb{E}$ and define the function $g_{\mathbf x}$ by

$$
g_{\mathbf{x}}(\mathbf{d}) \equiv \varphi_{C}(\mathbf{x} + \mathbf{d}) - \varphi_{C}(\mathbf{x}) - \langle \mathbf{d}, \mathbf{z}_{\mathbf{x}} \rangle,
$$

where ${\bf z}_{\bf x} ={\bf x} - P_{C}({\bf x})$ . By the definition of the gradient, to show (3.23), it is enough to establish that

$$
\frac{g_{\mathbf{x}}(\mathbf{d})}{\| \mathbf{d} \|} \rightarrow \mathbf{0} \text{as} \mathbf{d} \rightarrow \mathbf{0}.\tag{3.24}
$$

To prove (3.24), note that by the definition of the orthogonal projection, we have for any $\mathbf{d} \in \mathbb{E}$

$$
\left\| \mathbf{x} + \mathbf{d} - P_{C}(\mathbf{x} + \mathbf{d}) \right\|^{2} \leq \left\| \mathbf{x} + \mathbf{d} - P_{C}(\mathbf{x}) \right\|^{2},
$$

which implies that for any $\mathbf{d} \in \mathbb{E}$

$$
\begin{array}{l} g_{\mathbf{x}}(\mathbf{d}) = \frac{1}{2} \| \mathbf{x} + \mathbf{d} - P_{C}(\mathbf{x} + \mathbf{d}) \|^{2} - \frac{1}{2} \| \mathbf{x} - P_{C}(\mathbf{x}) \|^{2} - \langle \mathbf{d}, \mathbf{z}_{\mathbf{x}} \rangle \\ \leq \frac{1}{2} \| \mathbf{x} + \mathbf{d} - P_{C}(\mathbf{x}) \|^{2} - \frac{1}{2} \| \mathbf{x} - P_{C}(\mathbf{x}) \|^{2} - \langle \mathbf{d}, \mathbf{z}_{\mathbf{x}} \rangle \\ = \frac{1}{2} \| \mathbf{x} - P_{C}(\mathbf{x}) \|^{2} + \langle \mathbf{d}, \mathbf{x} - P_{C}(\mathbf{x}) \rangle + \frac{1}{2} \| \mathbf{d} \|^{2} - \frac{1}{2} \| \mathbf{x} - P_{C}(\mathbf{x}) \|^{2} - \langle \mathbf{d}, \mathbf{z}_{\mathbf{x}} \rangle \\ = \frac{1}{2} \| \mathbf{d} \|^{2}.\end{array} \tag{3.2}\tag{3.25}
$$

In particular, we also have

$$
g_{\mathbf{x}}(- \mathbf{d}) \leq \frac{1}{2} \| \mathbf{d} \|^{2}.\tag{3.26}
$$

Since $\varphi_{C}$ is convex, so is $g_{\mathbf x}$ . Therefore, by Jensen’s inequality, and noting that $g_{\mathbf{x}}(\mathbf{0}) = 0$ 2

$$
0 = g_{\mathbf{x}}(\mathbf{0}) = g_{\mathbf{x}} \left(\frac{\mathbf{d} +(- \mathbf{d})}{2}\right) \leq \frac{1}{2}(g_{\mathbf{x}}(\mathbf{d}) + g_{\mathbf{x}}(- \mathbf{d})).\tag{3.27}
$$

Combining (3.26) and (3.27), we get

$$
g_{\mathbf{x}}(\mathbf{d}) \geq - g_{\mathbf{x}}(- \mathbf{d}) \geq - \frac{1}{2} \| \mathbf{d} \|^{2}.\tag{3.28}
$$

Finally, by (3.25) and (3.28), it follows that $\begin{array}{r}{| g_{\mathbf{x}}(\mathbf{d}) | \leq \frac{1}{2} \| \mathbf{d} \|^{2}} \end{array}$ , from which the limit (3.24) follows and hence also the desired result (3.23).

Remark 3.32 (what is the gradient?). We will now illustrate the fact that the gradient depends on the choice of the inner product in the underlying space. Let $\mathbb{E} = \mathbb{R}^{n}$ be endowed with the dot product. By Theorem 3.29 we know that when f is diferentiable at x, then

$$
(\nabla f(\mathbf{x}))_{i} = \langle \nabla f(\mathbf{x}), \mathbf{e}_{i} \rangle = f^{\prime}(\mathbf{x}; \mathbf{e}_{i});
$$

that $is,$ in this case, the ith component of $\nabla f(\mathbf{x})$ is equal to $\textstyle{\frac{\partial f}{\partial x_{i}}}(\mathbf{x}) = f^{\prime}(\mathbf{x}; \mathbf{e}_{i})$ —the ith partial derivative of f at x—so that $\nabla f(\mathbf{x}) = D_{f}(\mathbf{x})$ , where

$$
D_{f}(\mathbf{x}) \equiv \left(\begin{array}{c} \frac{\partial f}{\partial x_{1}}(\mathbf{x}) \\ \frac{\partial f}{\partial x_{2}}(\mathbf{x}) \\ \vdots \\ \frac{\partial f}{\partial x_{n}}(\mathbf{x}) \end{array} \right).\tag{3.29}
$$

Note that the definition of the directional derivative does not depend on the choice of the inner product in the underlying space, so we can arbitrarily choose the inner product in the formula (3.22) as the dot product and obtain (recalling that in this case $\nabla f(\mathbf{x}) = D_{f}(\mathbf{x}))$ 1

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = D_{f}(\mathbf{x})^{T} \mathbf{d} = \sum_{i = 1}^{n} \frac{\partial f}{\partial x_{i}}(\mathbf{x}) d_{i}.\tag{3.30}
$$

Formula (3.30) holds for any choice of inner product in the space. However, $\nabla f(\mathbf{x})$ is not necessarily equal to $D_{f}(\mathbf{x})$ when the endowed inner product is not the dot product. For example, suppose that the inner product is given by

$$
\left\langle \mathbf{x}, \mathbf{y} \right\rangle = \mathbf{x}^{T} \mathbf{H} \mathbf{y},\tag{3.31}
$$

where H is a given $n \times n$ positive definite matrix. In this case,

$$
(\nabla f(\mathbf{x}))_{i} = \nabla f(\mathbf{x})^{T} \mathbf{e}_{i} = \nabla f(\mathbf{x})^{T} \mathbf{H} \left(\mathbf{H}^{- 1} \mathbf{e}_{i}\right)
$$

$$
= \langle \nabla f(\mathbf{x}), \mathbf{H}^{- 1} \mathbf{e}_{i} \rangle\tag{[by(3.31)]}
$$

$$
= f^{\prime}(\mathbf{x}; \mathbf{H}^{- 1} \mathbf{e}_{i})\tag{[by(3.22)]}
$$

$$
= D_{f}(\mathbf{x})^{T} \mathbf{H}^{- 1} \mathbf{e}_{i}.\tag{[by(3.30)]}
$$

Hence, we obtain that with respect to the inner product (3.31), the gradient is actually a “scaled”/“weighted” gradient:

$$
\nabla f(\mathbf{x}) = \mathbf{H}^{- 1} D_{f}(\mathbf{x}).
$$

Now consider the space $\mathbb{E} = \mathbb{R}^{m \times n}$ of all $m \times n$ real-valued matrices with the dot product as the endowed inner product:

$$
\langle \mathbf{x}, \mathbf{y} \rangle = \operatorname{Tr} \left(\mathbf{x}^{T} \mathbf{y}\right) forany \mathbf{x}, \mathbf{y} \in \mathbb{R}^{m \times n}.
$$

Given a proper function $f : \mathbb{R}^{m \times n}(- \infty, \infty]$ and $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ , the gradient, if it exists, is given by $\nabla f(\mathbf{x}) = D_{f}(\mathbf{x})$ , where $D_{f}(\mathbf{x})$ is the $m \times n$ matrix

$$
D_{f}(\mathbf{x}) = \left(\frac{\partial f}{\partial x_{ij}}(\mathbf{x})\right)_{i, j}.
$$

If the inner product is replaced by

$$
\langle \mathbf{x}, \mathbf{y} \rangle = \mathrm{Tr}(\mathbf{x}^{T} \mathbf{H} \mathbf{y}),
$$

where H is a given m × m positive definite matrix, then a similar argument to the one given previously shows that

$$
\nabla f(\mathbf{x}) = \mathbf{H}^{- 1} D_{f}(\mathbf{x}).
$$

We will now show that when a convex function is diferentiable at a point in the interior of its domain, then the subdiferential set is the singleton (i.e., a set containing a single vector) consisting of the gradient at the point. The reverse is also correct in the sense that if the subdiferential set is a singleton $\{\mathbf{g}\}$ , then the function is diferentiable at the given point with g being its gradient.

Theorem 3.33 (the subdiferential at points of Differentiability). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper convex function, and let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ . If f is diferentiable at x, then $\partial f(\mathbf{x}) = \{\nabla f(\mathbf{x})\}$ . Conversely, if f has a unique subgradient at x, then it is diferentiable at x and $\partial f(\mathbf{x}) = \{\nabla f(\mathbf{x})\}$

Proof. Let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and assume that f is diferentiable at x. Then by Theorem 3.29 it follows that for any $\mathbf{d} \in \mathbb{E}$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \langle \nabla f(\mathbf{x}), \mathbf{d} \rangle.\tag{3.32}
$$

Let $\mathbf{g} \in \partial f(\mathbf{x})$ . We will show that ${\bf g} = \nabla f({\bf x})$ . Combining (3.32) with the max formula (Theorem 3.26) we have

$$
\langle \nabla f(\mathbf{x}), \mathbf{d} \rangle = f^{\prime}(\mathbf{x}; \mathbf{d}) \geq \langle \mathbf{g}, \mathbf{d} \rangle,
$$

so that

$$
\langle \mathbf{g} - \nabla f(\mathbf{x}), \mathbf{d} \rangle \leq 0.
$$

Taking the maximum over all d satisfying $\| \mathbf{d} \| \leq 1$ , we obtain that $\| \mathbf{g} - \nabla f(\mathbf{x}) \|_{*} \leq 0$ and consequently that $\nabla f(\mathbf{x}) = \mathbf{g}{\big.}$ . We have thus shown that the only possible subgradient in $\partial f(\mathbf{x})$ is $\nabla f(\mathbf{x})$ . Combining this with the fact that the subdiferential set is nonempty (Theorem 3.14) yields the desired result $\partial f(\mathbf{x}) = \{\nabla f(\mathbf{x})\}$

For the reverse direction, suppose that f has a unique subgradient g at ${\textbf{x}} \in$ int $\left(\operatorname{dom}(f) \right)$ . Consider the convex function

$$
h(\mathbf{u}) \equiv f(\mathbf{x} + \mathbf{u}) - f(\mathbf{x}) - \langle \mathbf{g}, \mathbf{u} \rangle.
$$

We will show that

$$
\lim_{\mathbf{u} \to \mathbf{0}} \frac{h(\mathbf{u})}{\| \mathbf{u} \|} = 0.
$$

This will establish (by definition) that ${\bf g} = \nabla f({\bf x})$ . Obviously, 0 is the unique subgradient of h at 0 and $\mathbf{0} \in \operatorname{int}(\operatorname{dom}(h))$ , and hence by the max formula (Theorem 3.26), for any $\mathbf{d} \in \mathbb{E}$ 2

$$
h^{\prime}(\mathbf{0}; \mathbf{d}) = \sigma_{\partial h(\mathbf{0})}(\mathbf{d}) = 0.
$$

We can thus conclude that for any d $\in \mathbb{E}$ ,

$$
0 = h^{\prime}(\mathbf{0}; \mathbf{d}) = \lim_{\alpha \to 0^{+}} \frac{h(\alpha \mathbf{d}) - h(\mathbf{0})}{\alpha} = \lim_{\alpha \to 0^{+}} \frac{h(\alpha \mathbf{d})}{\alpha}.\tag{3.33}
$$

Let $\{\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{k}\}$ be an orthonormal basis of <sup>E</sup>. Since $\mathbf{0} \in \operatorname{int}(\operatorname{dom}(h))$ , there exists $\varepsilon \in(0, 1)$ such that $\varepsilon \mathbf{v}_{i}, - \varepsilon \mathbf{v}_{i} \in \mathrm{dom}(h)$ for any $i = 1, 2, \ldots, k.$ Therefore, since dom(h) is convex, the set

$$
D = \operatorname{conv} \left(\{\pm \varepsilon \mathbf{v}_{i}\}_{i = 1}^{k}\right)
$$

satisfies $D \subseteq \operatorname{dom}(h)$ . Let $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle}$ be the Euclidean norm corresponding to the endowed inner product on <sup>E</sup>. Note that $B_{\| \cdot \|}[0, \gamma] \subseteq D$ , where $\begin{array}{r}{\gamma = \frac{\varepsilon}{k}} \end{array}$ . Indeed, let $\mathbf{w} \in B_{\lVert \cdot \rVert}[\mathbf{0}, \gamma]$ . Then since $\{\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{k}\}$ } is an orthonormal basis of <sup>E</sup>, we have

$$
\mathbf{w} = \sum_{i = 1}^{k} \langle \mathbf{w}, \mathbf{v}_{i} \rangle \mathbf{v}_{i}
$$

as well as

$$
\left\| \mathbf{w} \right\|^{2} = \sum_{i = 1}^{k} \left\langle \mathbf{w}, \mathbf{v}_{i} \right\rangle^{2}.\tag{3.34}
$$

Since $\| \mathbf{w} \|^{2} \leq \gamma^{2}$ , it follows by (3.34) that $| \langle \mathbf{w}, \mathbf{v}_{i} \rangle | \leq \gamma$ , and hence

$$
\mathbf{w} = \sum_{i = 1}^{k} \langle \mathbf{w}, \mathbf{v}_{i} \rangle \mathbf{v}_{i} = \sum_{i = 1}^{k} \frac{| \langle \mathbf{w}, \mathbf{v}_{i} \rangle |}{\varepsilon}[\operatorname{sgn}(\langle \mathbf{w}, \mathbf{v}_{i} \rangle) \varepsilon \mathbf{v}_{i}] + \left(1 - \sum_{i = 1}^{k} \frac{| \langle \mathbf{w}, \mathbf{v}_{i} \rangle |}{\varepsilon}\right) \cdot \mathbf{0} \in D,
$$

where the membership in D follows by the fact that $\mathbf{0}, \pm \varepsilon \mathbf{v}_{i} \in D$ and $\begin{array}{r}{\sum_{i = 1}^{k} \frac{| \langle \mathbf w, \mathbf v_{i} \rangle |}{\varepsilon} \leq} \end{array}$ $\begin{array}{r}{\frac{k \gamma}{\varepsilon} = 1} \end{array}$ . We have therefore established the inclusion $B_{\| \cdot \|}[0, \gamma] \subseteq D$ . Denote the 2k vectors $\{\pm \varepsilon{\mathbf{v}}_{i}\}_{i = 1}^{k}$ by $\mathbf{z}_{1}, \mathbf{z}_{2}, \ldots, \mathbf{z}_{2k}$ . Take $\mathbf{0} \neq \mathbf{u} \in B_{\| \cdot \|}[\mathbf{0}, \gamma^{2}]$ . We have that $\gamma \frac{\mathbf{u}}{\lVert \mathbf{u} \rVert} \in B_{\lVert \cdot \rVert} \mathbf{\bar{[0, \gamma]}} \stackrel{\mathbf{\bar{\mathbf{C}}}}{=} \bar{D}$ , and hence there exists $\lambda \in \Delta_{2k}$ such that

$$
\gamma \frac{\mathbf{u}}{\| \mathbf{u} \|} = \sum_{i = 1}^{2k} \lambda_{i} \mathbf{z}_{i}.
$$

Therefore,

$$
\begin{array}{l} \frac{h(\mathbf{u})}{\| \mathbf{u} \|} = \frac{h \left(\frac{\| \mathbf{u} \|}{\gamma} \gamma \frac{\mathbf{u}}{\| \mathbf{u} \|}\right)}{\| \mathbf{u} \|} = \frac{h \left(\sum_{i = 1}^{2k} \lambda_{i} \frac{\| \mathbf{u} \|}{\gamma} \mathbf{z}_{i}\right)}{\| \mathbf{u} \|} \\ \leq \sum_{i = 1}^{2k} \lambda_{i} \frac{h \left(\| \mathbf{u} \| \frac{\mathbf{z}_{i}}{\gamma}\right)}{\| \mathbf{u} \|} \\ \leq \max_{i = 1, 2, \ldots, 2k} \left\{\frac{h \left(\| \mathbf{u} \| \frac{\mathbf{z}_{i}}{\gamma}\right)}{\| \mathbf{u} \|} \right\}, \end{array}\tag{3.35}
$$

where the first inequality follows by the convexity of h and by the fact that $\| \mathbf{u} \|_{\gamma}^{\mathbf{\underline{{z}}}_{i}} \in$ $B_{\| \cdot \|}[0, \gamma] \subseteq D \subseteq$ dom(h). By (3.33),

$$
\lim_{\mathbf{u} \to \mathbf{0}} \frac{h \left(\| \mathbf{u} \| \frac{\mathbf{z}_{i}}{\gamma}\right)}{\| \mathbf{u} \|} = \lim_{\| \mathbf{u} \| \to \mathbf{0}} \frac{h \left(\| \mathbf{u} \| \frac{\mathbf{z}_{i}}{\gamma}\right)}{\| \mathbf{u} \|} = \lim_{\alpha \to 0^{+}} \frac{h \left(\alpha \frac{\mathbf{z}_{i}}{\gamma}\right)}{\alpha} = 0,
$$

which, combined with (3.35), implies that $\frac{h(\mathbf{u})}{\| \mathbf{u} \|} 0$ as $\mathbf u \to \mathbf 0$ , proving the desired result.

Example 3.34 (subdiferential of the $l_{2}{\bf - norm})$ . Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{x} \|_{2}$ . Then the subdiferential set of $f$ at $\mathbf{x} = \mathbf{0}$ was already computed in Example 3.3. When $\mathbf{x} \neq \mathbf{0}$ , the function is diferentiable with gradient $\frac{\mathbf{x}}{\| \mathbf{x} \|_{2}}$ . Thus, using Theorem 3.33, we can summarize and write the subdiferential set as

$$
\partial f(\mathbf{x}) = \left\{\begin{array}{ll} \left\{\frac{\mathbf{x}}{\| \mathbf{x} \|_{2}} \right\}, & \mathbf{x} \neq \mathbf{0}, \\ B_{\| \cdot \|_{2}}[\mathbf{0}, 1], & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

In particular, when considering the case $n = 1$ , we obtain that for the one-dimensional function $g(x) = \vert x \vert$ , we have

$$
\partial g(x) = \left\{\begin{array}{ll} \{\operatorname{sgn}(x)\}, & x \neq 0, \\[- 1, 1], & x = 0.\end{array} \right.
$$

## 3.4 Computing Subgradients

This section establishes several useful calculus rules for subgradients and subdiferentials. Some of the results are “weak results” (rules for computing some of the subgradients in the subdiferential set), and some are “strong” (full characterization of the subdiferential set).

## 3.4.1 Multiplication by a Positive Scalar

Theorem 3.35. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper function and let $\alpha > 0$ . Then for any $\mathbf{x} \in \operatorname{dom}(f)$

$$
\partial(\alpha f)(\mathbf{x}) = \alpha \partial f(\mathbf{x}).
$$

Proof. We have that $\mathbf{g} \in \partial f(\mathbf{x})$ if and only if

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle \text{for any} \mathbf{y} \in \operatorname{dom}(f).
$$

Multiplying the inequality by $\alpha > 0$ , we can conclude that the above inequality holds if and only if

$$
\alpha f(\mathbf{y}) \geq \alpha f(\mathbf{x}) + \langle \alpha \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle \text{for any} \mathbf{y} \in \operatorname{dom}(\alpha f),\tag{3.36}
$$

where we used the obvious fact that dom $(\alpha f) = \mathrm{dom}(f)$ . The statement (3.36) is equivalent to the relation αg $\in \partial(\alpha f)(\mathbf{x})$ □

## 3.4.2 Summation

The following result contains both weak and strong results on the subdiferential set of a sum of functions. The weak result is also “weak” in the sense that its proof only requires the definition of the subgradient. The strong result utilizes the max formula.

Theorem 3.36. Let $f_{1}, f_{2} : \mathbb{E}(- \infty, \infty]$ be proper convex functions, and let $\mathbf{x} \in \operatorname{dom}(f_{1}) \cap \operatorname{dom}(f_{2})$

(a) The following inclusion holds:

$$
\partial f_{1}(\mathbf{x}) + \partial f_{2}(\mathbf{x}) \subseteq \partial(f_{1} + f_{2})(\mathbf{x}).
$$

(b) If x ∈ int(dom(f<sub>1</sub>)) ∩ int(dom(f<sub>2</sub>)), then

$$
\partial(f_{1} + f_{2})(\mathbf{x}) = \partial f_{1}(\mathbf{x}) + \partial f_{2}(\mathbf{x}).
$$

Proof. (a) Let $\mathbf{g} \in \partial f_{1}(\mathbf{x}) + \partial f_{2}(\mathbf{x})$ . Then there exist ${\bf g}_{1} \in \partial f_{1}({\bf x})$ and $\mathbf{g}_{2} \in \partial f_{2}(\mathbf{x})$ such that $\mathbf{g} = \mathbf{g}_{1} + \mathbf{g}_{2}$ . By the definition of $\mathbf{g}_{1}$ and $\mathbf{g}_{2}$ , it follows that for any $\mathbf{y} \in \operatorname{dom}(f_{1}) \cap \operatorname{dom}(f_{2})$

$$
\begin{array}{l} f_{1}(\mathbf{y}) \geq f_{1}(\mathbf{x}) + \langle \mathbf{g}_{1}, \mathbf{y} - \mathbf{x} \rangle, \\ f_{2}(\mathbf{y}) \geq f_{2}(\mathbf{x}) + \langle \mathbf{g}_{2}, \mathbf{y} - \mathbf{x} \rangle.\end{array}
$$

Summing the two inequalities, we obtain that for any $\mathbf{y} \in \operatorname{dom}(f_{1}) \cap \operatorname{dom}(f_{2})$

$$
f_{1}(\mathbf{y}) + f_{2}(\mathbf{y}) \geq f_{1}(\mathbf{x}) + f_{2}(\mathbf{x}) + \langle \mathbf{g}_{1} + \mathbf{g}_{2}, \mathbf{y} - \mathbf{x} \rangle,
$$

that is, ${\bf g} ={\bf g}_{1} +{\bf g}_{2} \in \partial(f_{1} + f_{2})({\bf x})$

(b) Let $\textbf{d} \in \ \mathbb{E}$ and define $f \equiv f_{1} + f_{2}$ . Then since $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f)) \ =$ int $(\mathrm{dom}(f_{1})) \cap \mathrm{int}(\mathrm{dom}(f_{2}))$ , it follows by the max formula (Theorem 3.26) that

$$
\sigma_{\partial f(\mathbf{x})}(\mathbf{d}) = \max \left\{\langle \mathbf{g}, \mathbf{d} \rangle : \mathbf{g} \in \partial f(\mathbf{x}) \right\} = f^{\prime}(\mathbf{x}; \mathbf{d}).
$$

Using the additivity of the directional derivative and the max formula (again), we also obtain

$$
\begin{array}{l} \sigma_{\partial f(\mathbf{x})}(\mathbf{d}) = f^{\prime}(\mathbf{x}; \mathbf{d}) \\ \qquad = f_{1}^{\prime}(\mathbf{x}; \mathbf{d}) + f_{2}^{\prime}(\mathbf{x}; \mathbf{d}) \\ \qquad = \max \left\{\langle \mathbf{g}_{1}, \mathbf{d} \rangle : \mathbf{g}_{1} \in \partial f_{1}(\mathbf{x}) \right\} + \max \left\{\langle \mathbf{g}_{2}, \mathbf{d} \rangle : \mathbf{g}_{2} \in \partial f_{2}(\mathbf{x}) \right\} \\ \qquad = \max \left\{\langle \mathbf{g}_{1} + \mathbf{g}_{2}, \mathbf{d} \rangle : \mathbf{g}_{1} \in \partial f_{1}(\mathbf{x}), \mathbf{g}_{2} \in \partial f_{2}(\mathbf{x}) \right\} \\ \qquad = \sigma_{\partial f_{1}(\mathbf{x}) + \partial f_{2}(\mathbf{x})}(\mathbf{d}).\end{array}
$$

By Theorems 3.9 and 3.14, $\partial f(\mathbf{x}), \partial f_{1}(\mathbf{x})$ , and $\partial f_{2}(\mathbf{x})$ are nonempty compact convex sets, which also implies (simple exercise) that $\partial f_{1}(\mathbf{x}) + \partial f_{2}(\mathbf{x})$ is nonempty compact and convex. Finally, invoking Lemma 2.34, it follows that $\partial f(\mathbf{x}) = \partial f_{1}(\mathbf{x}) +$ $\partial f_{2}(\mathbf{x})$

Remark 3.37. Note that the proof of part (a) of Theorem 3.36 does not require a convexity assumption on $f_{1}$ and $f_{2}$ .

A simple induction argument can be used to generalize the last result to an arbitrary number of functions.

Corollary 3.38. Let $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ be proper convex functions, and let $\mathbf{x} \in \cap_{i = 1}^{m} \mathrm{dom}(f_{i})$

(a) (weak sum rule of subdiferential calculus) The following inclusion holds:

$$
\sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}) \subseteq \partial \left(\sum_{i = 1}^{m} f_{i}\right)(\mathbf{x}).
$$

(b) If $\mathbf{x} \in \cap_{i = 1}^{m}$ int(dom(f<sub>i</sub>)), then

$$
\partial \left(\sum_{i = 1}^{m} f_{i}\right)(\mathbf{x}) = \sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}).\tag{3.37}
$$

Another direct consequence is that if $f_{1}, f_{2}, \ldots, f_{m}$ are real-valued, meaning that their domain is the entire space $\mathbb{E},$ then the sum formula (3.37) holds.

Corollary 3.39. Let $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to \mathbb{R}$ be real-valued convex functions. Then for any $\mathbf{x} \in \mathbb{E}$

$$
\partial \left(\sum_{i = 1}^{m} f_{i}\right)(\mathbf{x}) = \sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}).
$$

A result with a less restrictive assumption than the one in Corollary 3.38(b) states that if the intersection $\cap_{i = 1}^{m} \operatorname{ri}(\operatorname{dom}(f_{i}))$ is nonempty, then the sum formula is correct at any point. We state this result without a proof.

Theorem 3.40 (sum rule of subdiferential calculus [108, Theorem 23.8]). Let $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ be proper convex functions, and assume that $\bigcap_{i = 1}^{m} \operatorname{ri}(\operatorname{dom}(f_{i})) \neq \emptyset$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\partial \left(\sum_{i = 1}^{m} f_{i}\right)(\mathbf{x}) = \sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}).
$$

Example 3.41 (subdiferential set of the l<sub>1</sub>-norm function—strong result). Consider the function $f : \mathbb { R } ^ { n } $ <sup>R</sup> given by $f(\mathbf{x}) = \| \mathbf{x} \|_{1} = \textstyle \sum_{i = 1}^{n} | x_{i} |$ . Then $\textstyle f = \sum_{i = 1}^{n} f_{i}.$ , where $f_{i}(\mathbf{x}) \equiv | x_{i} |$ . We have (see also Example 3.34)

$$
\partial f_{i}(\mathbf{x}) = \left\{\begin{array}{ll} \{\operatorname{sgn}(x_{i}) \mathbf{e}_{i}\}, & x_{i} \neq 0, \\[- \mathbf{e}_{i}, \mathbf{e}_{i}], & x_{i} = 0.\end{array} \right.
$$

Thus, by Corollary 3.39,

$$
\partial f(\mathbf{x}) = \sum_{i = 1}^{n} \partial f_{i}(\mathbf{x}) = \sum_{i \in I_{\neq}(\mathbf{x})} \operatorname{sgn}(x_{i}) \mathbf{e}_{i} + \sum_{i \in I_{0}(\mathbf{x})}[- \mathbf{e}_{i}, \mathbf{e}_{i}],
$$

where

$$
I_{\neq}(\mathbf{x}) = \{i: x_{i} \neq 0\}, I_{0}(\mathbf{x}) = \{i: x_{i} = 0\},
$$

and hence

$$
\partial f(\mathbf{x}) = \left\{\mathbf{z} \in \mathbb{R}^{n}: z_{i} = \operatorname{sgn}(x_{i}), i \in I_{\neq}(\mathbf{x}), | z_{j} | \leq 1, j \in I_{0}(\mathbf{x}) \right\}.
$$

Example 3.42 (a subgradient of the $l_{1}{\bf - norm}$ function—weak result). Using the formula for the subdiferential set described in Example 3.41, we can readily conclude that

$$
\operatorname{sgn}(\mathbf{x}) \in \partial f(\mathbf{x}).
$$

## 3.4.3 Affine Transformation

The following theorem states strong and weak results on the subdiferential set of a composition of a convex function with an Affine transformation.

Theorem 3.43. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper convex function and $\mathcal{A} : \mathbb{V} \to \mathbb{E}$ be a linear transformation. Let $h(\mathbf{x}) = f(A(\mathbf{x}) + \mathbf{b})$ with $\mathbf{b} \in \mathbb{E}$ . Assume that h is proper, meaning that

$$
\operatorname{dom}(h) = \left\{\mathbf{x} \in \mathbb{V}: \mathcal{A}(\mathbf{x}) + \mathbf{b} \in \operatorname{dom}(f) \right\} \neq \emptyset.
$$

(a) (weak Affine transformation rule of subdiferential calculus) For any $\mathbf{x} \in \mathrm{dom}(h)$ 2

$$
\mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})) \subseteq \partial h(\mathbf{x}).
$$

(b) (Affine transformation rule of subdiferential calculus) $If \mathbf{x} \in \operatorname{int}(\operatorname{dom}(h))$ and $\mathcal{A}(\mathbf{x}) + \mathbf{b} \in \mathrm{int}(\mathrm{dom}(f))$ , then

$$
\partial h(\mathbf{x}) = \mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})).
$$

Proof. (a) Let $\mathbf{x} \in \mathrm{dom}(h)$ and assume that $\mathbf{g} \in \mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}))$ . Then there exists d $\in \mathbb{E}^{*}$ for which $\mathbf{g} = \mathcal{A}^{T}(\mathbf{d})$ , where

$$
\mathbf{d} \in \partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}).\tag{3.38}
$$

For any $\mathbf{y} \in \mathrm{dom}(h)$ , we have $\mathcal{A}(\mathbf{y}) + \mathbf{b} \in \mathrm{dom}(f)$ , and hence, by (3.38),

$$
f(\mathcal{A}(\mathbf{y}) + \mathbf{b}) \geq f(\mathcal{A}(\mathbf{x}) + \mathbf{b}) + \langle \mathbf{d}, \mathcal{A}(\mathbf{y}) + \mathbf{b} - \mathcal{A}(\mathbf{x}) - \mathbf{b} \rangle,
$$

and therefore

$$
h(\mathbf{y}) \geq h(\mathbf{x}) + \langle \mathcal{A}^{T}(\mathbf{d}), \mathbf{y} - \mathbf{x} \rangle \text{for all} \mathbf{y} \in \mathrm{dom}(h).
$$

Hence, $\mathbf{g} = \mathcal{A}^{T}(\mathbf{d}) \in \partial h(\mathbf{x})$ , proving that $\mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})) \subseteq \partial h(\mathbf{x})$

(b) Since $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(h))$ , then for any d $\in \mathbb{V}$ , by the max formula (Theorem 3.26),

$$
h^{\prime}(\mathbf{x}; \mathbf{d}) = \sigma_{\partial h(\mathbf{x})}(\mathbf{d}).\tag{3.39}
$$

In addition, by the definition of the directional derivative, we have

$$
\begin{array}{l} h^{\prime}(\mathbf{x}; \mathbf{d}) = \lim_{\alpha \to 0^{+}} \frac{h(\mathbf{x} + \alpha \mathbf{d}) - h(\mathbf{x})}{\alpha} \\ \quad = \lim_{\alpha \to 0^{+}} \frac{f(\mathcal{A}(\mathbf{x}) + \mathbf{b} + \alpha \mathcal{A}(\mathbf{d})) - f(\mathcal{A}(\mathbf{x}) + \mathbf{b})}{\alpha} \\ \quad = f^{\prime}(\mathcal{A}(\mathbf{x}) + \mathbf{b}; \mathcal{A}(\mathbf{d})), \end{array}
$$

which, combined with (3.39), yields

$$
\sigma_{\partial h(\mathbf{x})}(\mathbf{d}) = f^{\prime}(\mathcal{A}(\mathbf{x}) + \mathbf{b}; \mathcal{A}(\mathbf{d})).
$$

Therefore, using the max formula again and the assumption that $\mathcal{A}(\mathbf{x}) + \mathbf{b} \ \in$ $\operatorname{int}(\operatorname{dom}(f))$ ), we obtain that

$$
\begin{array}{l} \sigma_{\partial h(\mathbf{x})}(\mathbf{d}) = f^{\prime}(\mathcal{A}(\mathbf{x}) + \mathbf{b}; \mathcal{A}(\mathbf{d})) \\ \qquad = \underset{\mathbf{g}}{\max} \left\{\langle \mathbf{g}, \mathcal{A}(\mathbf{d}) \rangle : \mathbf{g} \in \partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}) \right\} \\ \qquad = \underset{\mathbf{g}}{\max} \left\{\langle \mathcal{A}^{T}(\mathbf{g}), \mathbf{d} \rangle : \mathbf{g} \in \partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}) \right\} \\ \qquad = \underset{\mathbf{g}}{\max} \left\{\langle \tilde{\mathbf{g}}, \mathbf{d} \rangle : \tilde{\mathbf{g}} \in \mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})) \right\} \\ \qquad = \sigma_{\mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}))}(\mathbf{d}).\end{array}
$$

Since $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(h))$ , it follows by Theorems 3.9 and 3.14 that $\partial h({\bf x})$ is nonempty compact and convex. Similarly, since $\pmb{\mathcal{A}}(\mathbf{x}) + \mathbf{b} \in \mathrm{int}(\mathrm{dom}(f))$ , the set $\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})$ is nonempty, compact, and convex, which implies that $\mathcal{A}^{\acute{T}}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}))$ is also nonempty, compact, and convex. Finally, invoking Lemma 2.34, we obtain that $\partial h(\mathbf{x}) = \mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b}))$

Example 3.44 (subdiferential of $\| \mathbf{Ax} + \mathbf{b} \|_{1})$ . Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be the function given by $f(\mathbf{x}) = \| \mathbf{Ax} + \mathbf{b} \|_{1}$ , where $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^{m}$ . Then $f(\mathbf{x}) = g(\mathbf{Ax} + \mathbf{b})$ with $g : \mathbb{R}^{m} \mathbb{R}$ given by $g(\mathbf{y}) \mathbf{\Psi} = \mathbf{\Psi} \| \mathbf{y} \|_{1}$ . By the Affine transformation rule of subdiferential calculus (Theorem $3.43(b))$ , we have that

$$
\partial f(\mathbf{x}) = \mathbf{A}^{T} \partial g(\mathbf{Ax} + \mathbf{b}).\tag{3.40}
$$

Denote the ith row of A by $\mathbf{a}_{i}^{T}$ and define

$$
\begin{array}{r} I_{\neq}(\mathbf{x}) = \{i: \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} \neq 0\}, \\ I_{0}(\mathbf{x}) = \{i: \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} = 0\}.\end{array}
$$

In this terminology, by Example 3.41,

$$
\partial g(\mathbf{A} \mathbf{x} + \mathbf{b}) = \sum_{i \in I_{\neq}(\mathbf{x})} \operatorname{sgn}(\mathbf{a}_{i}^{T} \mathbf{x} + b_{i}) \mathbf{e}_{i} + \sum_{i \in I_{0}(\mathbf{x})}[- \mathbf{e}_{i}, \mathbf{e}_{i}].
$$

Thus, by (3.40),

$$
\begin{array}{l} \partial f(\mathbf{x}) = \mathbf{A}^{T} \partial g(\mathbf{Ax} + \mathbf{b}) \\ \qquad = \sum_{i \in I_{\neq}(\mathbf{x})} \operatorname{sgn}(\mathbf{a}_{i}^{T} \mathbf{x} + b_{i}) \mathbf{A}^{T} \mathbf{e}_{i} + \sum_{i \in I_{0}(\mathbf{x})}[- \mathbf{A}^{T} \mathbf{e}_{i}, \mathbf{A}^{T} \mathbf{e}_{i}].\end{array}
$$

Using the relation ${\mathbf{A}}^{T}{\mathbf{e}}_{i} ={\mathbf{a}}_{i}$ , we finally conclude that

$$
\partial f(\mathbf{x}) = \sum_{i \in I_{\neq}(\mathbf{x})} \operatorname{sgn} \left(\mathbf{a}_{i}^{T} \mathbf{x} + b_{i}\right) \mathbf{a}_{i} + \sum_{i \in I_{0}(\mathbf{x})} \left[- \mathbf{a}_{i}, \mathbf{a}_{i} \right].
$$

The above is a strong result characterizing the entire subdiferential set. A weak result indicating one possible subgradient is

$$
\mathbf{A}^{T} \mathrm{sgn}(\mathbf{Ax} + \mathbf{b}) \in \partial f(\mathbf{x}).
$$

Example 3.45 (subdiferential of $\| \mathbf{Ax} + \mathbf{b} \|_{2})$ . Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be the function $f(\mathbf{x}) = \| \mathbf{Ax} + \mathbf{b} \|_{2}$ , where $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^{m}$ . Then $f(\mathbf{x}) = g(\mathbf{Ax} + \mathbf{b})$ with $g : \mathbb{R}^{m} \mathbb{R}$ given by $g(\mathbf{y}) = \| \mathbf{y} \|_{2}$ . By Example 3.34,

$$
\partial g(\mathbf{Ax} + \mathbf{b}) = \left\{\begin{array}{ll} \frac{\mathbf{Ax} + \mathbf{b}}{\| \mathbf{Ax} + \mathbf{b} \|_{2}}, & \mathbf{Ax} + \mathbf{b} \neq \mathbf{0}, \\ B_{\| \cdot \|_{2}}[\mathbf{0}, 1], & \mathbf{Ax} + \mathbf{b} = \mathbf{0}.\end{array} \right.
$$

Thus, by the Affine transformation rule of subdiferential calculus (Theorem 3.43(b)),

$$
\partial f(\mathbf{x}) = \mathbf{A}^{T} \partial g(\mathbf{Ax} + \mathbf{b}) = \left\{\begin{array}{ll} \frac{\mathbf{A}^{T}(\mathbf{Ax} + \mathbf{b})}{\| \mathbf{Ax} + \mathbf{b} \|_{2}}, & \mathbf{Ax} + \mathbf{b} \neq \mathbf{0}, \\ \mathbf{A}^{T} B_{\| \cdot \|_{2}}[\mathbf{0}, 1], & \mathbf{Ax} + \mathbf{b} = \mathbf{0}.\end{array} \right.
$$

Note that at a vector x satisfying $\mathbf{A} \mathbf{x} + \mathbf{b} = \mathbf{0}$ , the subdiferential set can be explicitly written as

$$
\partial f(\mathbf{x}) = \mathbf{A}^{T} B_{\| \cdot \|_{2}}[\mathbf{0}, 1] = \left\{\mathbf{A}^{T} \mathbf{y}: \| \mathbf{y} \|_{2} \leq 1 \right\}.
$$

If a weak result is required, then since $\mathbf{0} \in B_{\parallel \cdot \parallel_{2}}[\mathbf{0}, 1]$ , we can write $\mathbf{0} = \mathbf{A}^{T} \mathbf{0} \in$ $\partial f(\mathbf{x})$ for any x satisfying $\mathbf{Ax} + \mathbf{b} = \mathbf{0}$

## 3.4.4 Composition

The derivative of a composition of diferentiable functions can be computed by using the well-known chain rule. We recall here the classical result on the derivative of the composition of two one-dimensional functions. The result is a small variation of the result from [112, Theorem 5.5].

Theorem 3.46. Suppose that f is continuous on $[a, b] \(a < b)$ and that $f_{+}^{\prime}(a)$ exists. Let g be a function defined on an open interval I which contains the range $off$ , and assume that g is diferentiable at $f(a)$ . Then the function

$$
h(t) = g(f(t)) \quad(a \leq t \leq b)
$$

is right diferentiable at $t = a$ and

$$
h_{+}^{\prime}(a) = g^{\prime}(f(a)) f_{+}^{\prime}(a).
$$

Proof.

$$
\begin{array}{l} h_{+}^{\prime}(a) = \lim_{t \to a^{+}} \frac{g(f(t)) - g(f(a))}{t - a} \\ = \lim_{t \to a^{+}} \frac{g(f(t)) - g(f(a))}{f(t) - f(a)} \cdot \frac{f(t) - f(a)}{t - a} = g^{\prime}(f(a)) f_{+}^{\prime}(a).\end{array}
$$

We will now show how the one-dimensional chain rule can be used with the help of the max formula (Theorem 3.26) to show a multidimensional version of the chain rule.

Theorem 3.47 (chain rule of subdiferential calculus). Let $f : \mathbb{E} \to \mathbb{R}$ be a convex function and $g : \mathbb{R} \mathbb{R}$ be a nondecreasing convex function. Let $\mathbf{x} \in \mathbb{E}$ , and suppose that g is diferentiable at the point $f(\mathbf{x})$ . Let $h = g \circ f$ . Then

$$
\partial h(\mathbf{x}) = g^{\prime}(f(\mathbf{x})) \partial f(\mathbf{x}).
$$

Proof. For any $\mathbf{d} \in \mathbb{E}$ , define the following one-dimensional functions:

$$
\begin{array}{ll} f_{\mathbf{x}, \mathbf{d}}(t) = f(\mathbf{x} + t \mathbf{d}), & t \in \mathbb{R}, \\ h_{\mathbf{x}, \mathbf{d}}(t) = h(\mathbf{x} + t \mathbf{d}), & t \in \mathbb{R}.\end{array}
$$

We have the following simple relation between $f_{\mathbf{x}, \mathbf{d}}$ and $h_{\mathbf{x}, \mathbf{d}}$ :

$$
h_{\mathbf{x}, \mathbf{d}}(t) = h(\mathbf{x} + t \mathbf{d}) = g(f(\mathbf{x} + t \mathbf{d})) = g(f_{\mathbf{x}, \mathbf{d}}(t)), \quad t \in \mathbb{R}.\tag{3.41}
$$

The function $f$ is convex by the premise of the theorem, and h is convex since it is a composition of a nondecreasing convex function with a convex function. Therefore, the directional derivatives of $f$ and $h$ exist in every direction (Theorem 3.21), and we have by the definition of the directional derivative that

$$
(f_{\mathbf{x}, \mathbf{d}})_{+}^{\prime}(0) = f^{\prime}(\mathbf{x}; \mathbf{d}),\tag{3.42}
$$

$$
(h_{\mathbf{x}, \mathbf{d}})_{+}^{\prime}(0) = h^{\prime}(\mathbf{x}; \mathbf{d}).\tag{3.43}
$$

Since $h_{\mathbf{x}, \mathbf{d}} = g \circ f_{\mathbf{x}, \mathbf{d}} ~(\mathrm{by ~(3.41)})$ $f_{\mathbf{x}, \mathbf{d}}$ is right diferentiable at $0,$ and $g$ is diferentiable at $f_{\mathbf{x}, \mathbf{d}}(0) = f(\mathbf{x})$ , it follows by the chain rule for one-dimensional functions (Theorem 3.46) that

$$
(h_{\mathbf{x}, \mathbf{d}})_{+}^{\prime}(0) = g^{\prime}(f(\mathbf{x}))(f_{\mathbf{x}; \mathbf{d}})_{+}^{\prime}(0).
$$

Plugging (3.42) and (3.43) into the latter equality, we obtain

$$
h^{\prime}(\mathbf{x}; \mathbf{d}) = g^{\prime}(f(\mathbf{x})) f^{\prime}(\mathbf{x}; \mathbf{d}).
$$

By the max formula (Theorem 3.26), since f and h are convex and $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f)) =$ int $(\mathrm{dom}(h)) = \mathbb{E}$ 2

$$
h^{\prime}(\mathbf{x}; \mathbf{d}) = \sigma_{\partial h(\mathbf{x})}(\mathbf{d}), f^{\prime}(\mathbf{x}; \mathbf{d}) = \sigma_{\partial f(\mathbf{x})}(\mathbf{d}),
$$

and hence

$$
\sigma_{\partial h(\mathbf{x})}(\mathbf{d}) = h^{\prime}(\mathbf{x}; \mathbf{d}) = g^{\prime}(f(\mathbf{x})) f^{\prime}(\mathbf{x}; \mathbf{d}) = g^{\prime}(f(\mathbf{x})) \sigma_{\partial f(\mathbf{x})}(\mathbf{d}) = \sigma_{g^{\prime}(f(\mathbf{x})) \partial f(\mathbf{x})}(\mathbf{d}),
$$

where the last equality is due to Lemma $2.24(c)$ and the fact that $g^{\prime}(f(\mathbf{x})) \geq 0$ Finally, by Theorems 3.9 and 3.14 the sets $\partial h(\mathbf{x}), \partial f(\mathbf{x})$ are nonempty, closed, and convex, and thus by Lemma 2.34

$$
\partial h(\mathbf{x}) = g^{\prime}(f(\mathbf{x})) \partial f(\mathbf{x}).\quad \square
$$

Example 3.48 (subdiferential of $\| \cdot \|_{1}^{2})$ . Consider the function $h : \mathbb { R } ^ { n } $ R given by $h(\mathbf{x}) = \| \mathbf{x} \|_{1}^{2}$ , which can be written as the composition $h = g \circ f;$ , where $f(\mathbf{x}) = \| \mathbf{x} \|_{1}$ and $g(t) =[t]_{+}^{2} = \operatorname{max} \{t, 0\}^{2}$ . Both $f$ and $g$ are real-valued convex functions, and $g$ is nondecreasing and diferentiable over <sup>R</sup> with derivative $g^{\prime}(t) =$ $2[t]_{+}$ . Therefore, by the chain rule of subdiferential calculus (Theorem 3.47), for any $\mathbf{x} \in \mathbb{R}^{n}$ •

$$
\partial h(\mathbf{x}) = g^{\prime}(f(\mathbf{x})) \partial f(\mathbf{x}) = 2 \left[\| \mathbf{x} \|_{1} \right]_{+} \partial f(\mathbf{x}) = 2 \| \mathbf{x} \|_{1} \partial f(\mathbf{x}).
$$

Using the general form of $\partial f(\mathbf{x})$ as derived in Example 3.41, we can write $\partial h({\bf x})$ explicitly as follows:

$$
\begin{array}{c} \partial h(\mathbf{x}) = 2 \| \mathbf{x} \|_{1} \left\{\mathbf{z} \in \mathbb{R}^{n}: z_{i} = \mathrm{sgn}(x_{i}), i \in I_{\neq}(\mathbf{x}), | z_{j} | \leq 1, j \in I_{0}(\mathbf{x}) \right\}, \\ \text{where} I_{\neq}(\mathbf{x}) = \{i: x_{i} \neq 0\}, I_{0}(\mathbf{x}) = \{i: x_{i} = 0\}.\end{array}
$$

Plugging $\mathbf{x} = \mathbf{0}$ into the above formula, we obtain that

$$
\partial h(\mathbf{0}) = \{\mathbf{0}\}.
$$

Since h has a unique subgradient at $\mathbf{x} = \mathbf{0}$ , it follows by Theorem 3.33 that h is diferentiable at $\mathbf{x} = \mathbf{0}$ and $\nabla h(\mathbf{0}) = \mathbf{0}$ . Note that the function is obviously not diferentiable over $\mathbb{R}^{n}$ . For example, when $n = 2$ , the nondiferentiability points are $\{(x_{1}, 0)^{T} : x_{1} \neq 0\} \cup \{(0, x_{2})^{T} : \bar{x}_{2} \neq 0\}$ , as illustrated in Figure 3.3.

![Figure 3.3](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/34500173a1b48aa907efbfd62ed0bf084af3a06c2b73cdd33e7fc78d44e0eb13.jpg)  
Figure 3.3. Surface plot of the function $f(x_{1}, x_{2}) =(| x_{1} | + | x_{2} |)^{2}$

Example 3.49 (subdiferential of $d_{C}(\cdot))$ . Suppose that <sup>E</sup> is a Euclidean space, and let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set (see Example 2.20). The distance function $d_{C}$ is convex. We will show that

$$
\partial d_{C}(\mathbf{x}) = \left\{\begin{array}{ll} \left\{\frac{\mathbf{x} - P_{C}(\mathbf{x})}{d_{C}(\mathbf{x})} \right\}, & \mathbf{x} \notin C, \\ N_{C}(\mathbf{x}) \cap B[\mathbf{0}, 1], & \mathbf{x} \in C.\end{array} \right.
$$

By Example 3.31, we know that the function $\begin{array}{r}{\varphi_{C}(\mathbf{x}) = \frac{1}{2} d_{C}^{2}(\mathbf{x})} \end{array}$ is diferentiable and

$$
\partial \varphi_{C}(\mathbf{x}) = \{\mathbf{x} - P_{C}(\mathbf{x})\}\tag{3.44}
$$

for any $\textbf{x} \in \ \mathbb{E}$ . Note that $\varphi_{C} = g \circ d_{C}$ , where $\begin{array}{r}{g(t) \ = \ \frac{1}{2}[t]_{+}^{2}} \end{array}$ is a nonincreasing real-valued convex diferentiable function. Then by the chain rule of subdiferential calculus (Theorem 3.47),

$$
\partial \varphi_{C}(\mathbf{x}) = g^{\prime}(d_{C}(\mathbf{x})) \partial d_{C}(\mathbf{x}) =[d_{C}(\mathbf{x})]_{+} \partial d_{C}(\mathbf{x}) = d_{C}(\mathbf{x}) \partial d_{C}(\mathbf{x}).\tag{3.45}
$$

$\operatorname{If} \mathbf{x} \not \in C$ , then $d_{C}(\mathbf{x}) \neq 0$ , and thus by (3.44) and (3.45),

$$
\partial d_{C}(\mathbf{x}) = \left\{\frac{\mathbf{x} - P_{C}(\mathbf{x})}{d_{C}(\mathbf{x})} \right\} \text{for any} \mathbf{x} \notin C.
$$

Since $\partial d_{C}({\bf x})$ is a singleton for any $\mathbf{x} \notin C,$ , it follows in particular, by Theorem 3.33, that $d_{C}$ is diferentiable at points outside $C.$

Now assume that $\mathbf{x} \in C$ . We will show that

$$
\partial d_{C}(\mathbf{x}) = N_{C}(\mathbf{x}) \cap B[\mathbf{0}, 1].
$$

Indeed, if $\mathbf{d} \in \partial d_{C}(\mathbf{x})$ , then

$$
d_{C}(\mathbf{y}) \geq \langle \mathbf{d}, \mathbf{y} - \mathbf{x} \rangle \text{for any} \mathbf{y} \in \mathbb{E}.\tag{3.46}
$$

This means in particular that for any $\mathbf{y} \in C$

$$
\langle \mathbf{d}, \mathbf{y} - \mathbf{x} \rangle \leq 0,
$$

that is, $\mathbf{d} \in N_{C}(\mathbf{x})$ . In addition, taking $\mathbf{y} = \mathbf{x} + \mathbf{d}$ in (3.46), we get

$$
\left\| \mathbf{d} \right\|^{2} = \langle \mathbf{d}, \mathbf{x} + \mathbf{d} - \mathbf{x} \rangle \leq d_{C}(\mathbf{x} + \mathbf{d}) \leq \left\| \mathbf{x} + \mathbf{d} - \mathbf{x} \right\| = \| \mathbf{d} \|,
$$

which readily implies that $\| \mathbf{d} \| \leq 1$ . We conclude that $\partial d_{C}(\mathbf{x}) \subseteq N_{C}(\mathbf{x}) \cap B[\mathbf{0}, 1]$ To show the reverse direction, take $\mathbf{d} \in N_{C}(\mathbf{x}) \cap B[\mathbf{0}, 1]$ . Then for any $\mathbf{y} \in \mathbb{E}$ 2

$$
\langle \mathbf{d}, \mathbf{y} - \mathbf{x} \rangle = \langle \mathbf{d}, \mathbf{y} - P_{C}(\mathbf{y}) \rangle + \langle \mathbf{d}, P_{C}(\mathbf{y}) - \mathbf{x} \rangle.\tag{3.47}
$$

Since $\mathbf{d} \in N_{C}(\mathbf{x})$ and $P_{C}(\mathbf{y}) \in C$ , it follows by the definition of the normal cone that $\langle \mathbf{d}, P_{C}(\mathbf{y}) - \mathbf{x} \rangle \leq 0$ , which, combined with (3.47), the Cauchy–Schwarz inequality, and the assertion that $\| \mathbf{d} \| \leq 1$ , implies that for any $\mathbf{y} \in \mathbb{E}$

$$
\langle \mathbf{d}, \mathbf{y} - \mathbf{x} \rangle \leq \langle \mathbf{d}, \mathbf{y} - P_{C}(\mathbf{y}) \rangle \leq \| \mathbf{d} \| \cdot \| \mathbf{y} - P_{C}(\mathbf{y}) \| \leq \| \mathbf{y} - P_{C}(\mathbf{y}) \| = d_{C}(\mathbf{y}),
$$

and hence d $\in \partial d_{C}({\bf x})$ ■

## 3.4.5 Maximization

The following result shows how to compute the subdiferential set of a maximum of a finite collection of convex functions.

Theorem 3.50 (max rule of subdiferential calculus). Let $f_{1}, f_{2}, \ldots, f_{m}$ $\mathbb{E} \to(- \infty, \infty]$ be proper convex functions, and define

$$
f(\mathbf{x}) = \max \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \dots, f_{m}(\mathbf{x})\}.
$$

Let $\mathbf{x} \in \cap_{i = 1}^{m}$ int(dom(f<sub>i</sub>)). Then

$$
\partial f(\mathbf{x}) = \mathrm{conv} \left(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})\right),
$$

where $I(\mathbf{x}) = \{i \in \{1, 2, \dots, m\} : f_{i}(\mathbf{x}) = f(\mathbf{x})\}$

Proof. First note that $f,$ as a maximum of convex functions, is convex (see Theorem 2.16(c)) and that by Corollary 3.25 for any $\mathbf{d} \in \mathbb{E}$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i \in I(\mathbf{x})} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}).
$$

For the sake of simplicity of notation, we will assume that $I(\mathbf{x}) = \{1, 2, \ldots, k\}$ for some $k \in \{1, 2, \ldots, m\}$ . Now, using the max formula (Theorem 3.26), we obtain

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i = 1, 2, \dots, k} f_{i}^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{i = 1, 2, \dots, k} \max_{\mathbf{g}_{i} \in \partial f_{i}(\mathbf{x})} \langle \mathbf{g}_{i}, \mathbf{d} \rangle.\tag{3.48}
$$

Using the fact that for any $a_{1}, a_{2}, \ldots, a_{k} \in \mathbb{R}$ the identity

$$
\max \{a_{1}, a_{2}, \dots, a_{k}\} = \max_{\boldsymbol{\lambda} \in \Delta_{k}} \sum_{i = 1}^{k} \lambda_{i} a_{i}
$$

holds, we can continue (3.48) and write

$$
\begin{array}{l} f^{\prime}(\mathbf{x}; \mathbf{d}) = \max_{\boldsymbol{\lambda} \in \Delta_{k}} \left\{\sum_{i = 1}^{k} \lambda_{i} \max \{\langle \mathbf{g}_{i}, \mathbf{d} \rangle : \mathbf{g}_{i} \in \partial f_{i}(\mathbf{x})\} \right\} \\ = \max \left\{\left\langle \sum_{i = 1}^{k} \lambda_{i} \mathbf{g}_{i}, \mathbf{d} \right\rangle : \mathbf{g}_{i} \in \partial f_{i}(\mathbf{x}), \boldsymbol{\lambda} \in \Delta_{k} \right\} \\ = \max \left\{\langle \mathbf{g}, \mathbf{d} \rangle : \mathbf{g} \in \operatorname{conv} \left(\cup_{i = 1}^{k} \partial f_{i}(\mathbf{x})\right) \right\} \\ = \sigma_{A}(\mathbf{d}), \end{array}
$$

where $A = \mathrm{conv} \left(\cup_{i = 1}^{k} \partial f_{i}(\mathbf{x}) \right)$ . By the max formula (Theorem 3.26), since ${\textbf{x}} \in$ int $\left(\operatorname{dom}(f) \right)$

$$
f^{\prime}(\mathbf{x}; \mathbf{d}) = \sigma_{\partial f(\mathbf{x})}(\mathbf{d}),
$$

and hence

$$
\sigma_{A}(\mathbf{d}) = \sigma_{\partial f(\mathbf{x})}(\mathbf{d}) \text{for any} \mathbf{d} \in \mathbb{E}.\tag{3.49}
$$

The set $\partial f(\mathbf{x})$ is closed and convex by Theorem 3.9, and since $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ , it is also nonempty and bounded by Theorem 3.14. Similarly, $\begin{array}{r}{\partial f_{i}(\mathbf{x}), i = 1, 2, \ldots, k.} \end{array}$ are nonempty and compact sets, and hence also is $\cup_{i = 1}^{k} \partial f_{i}(\mathbf{x})$ . We can conclude that the set $A = \mathrm{conv}(\cup_{i = 1}^{k} \partial f_{i}(\mathbf{x}))$ , as a convex hull of a nonempty compact set, is also nonempty and compact.<sup>17</sup> In addition, by the definition of the convex hull, A is convex.

To conclude, both A and $\partial f(\mathbf{x})$ are nonempty closed and convex, and thus (3.49) implies by Lemma 2.34 that

$$
\partial f(\mathbf{x}) = A,
$$

which is the desired result.

Example 3.51 (subdiferential of the max function). Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be given by $f(\mathbf{x}) = \operatorname{max} \{x_{1}, x_{2},..., x_{n}\}$ . Obviously, $f(\mathbf{x}) = \operatorname{max} \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \ldots, f_{n}(\mathbf{x})\}$ , where $f_{i}(\mathbf{x}) = x_{i}$ , and hence $\partial f_{i}(\mathbf{x}) = \{\mathbf{e}_{i}\}$ for any $i = 1, 2, \ldots, n$ . Denote

$$
I(\mathbf{x}) = \{i: f(\mathbf{x}) = x_{i}\}.
$$

Then by the max rule of subdiferential calculus (Theorem 3.50),

$$
\partial f(\mathbf{x}) = \mathrm{conv}(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})) = \mathrm{conv}(\cup_{i \in I(\mathbf{x})} \{\mathbf{e}_{i}\}),
$$

and hence

$$
\partial f(\mathbf{x}) = \left\{\sum_{i \in I(\mathbf{x})} \lambda_{i} \mathbf{e}_{i}: \sum_{i \in I(\mathbf{x})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{x}) \right\}.
$$

In particular,

$$
\partial f(\alpha \mathbf{e}) = \Delta_{n} \text{for any} \alpha \in \mathbb{R}.
$$

Example 3.52 (subdiferential of the $l_{\infty} \mathbf{- norm})$ . Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{x} \|_{\infty}$ . There are two options. $\mathrm{If} \ \mathbf{x} = \mathbf{0}$ , then by Example $3.3 \ \partial f(\mathbf{0})$ is the dual-norm unit ball, and in this case,

$$
\partial f(\mathbf{0}) = B_{\| \cdot \|_{1}}[\mathbf{0}, 1] = \{\mathbf{x} \in \mathbb{R}^{n}: \| \mathbf{x} \|_{1} \leq 1\}.
$$

Suppose that $\mathbf{x} \neq \mathbf{0}$ . Note that $f(\mathbf{x}) = \operatorname{max} \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \ldots, f_{n}(\mathbf{x})\}$ with $f_{i}(\mathbf{x}) =$ $\left| x_{i} \right|$ and set

$$
I(\mathbf{x}) = \{i: | x_{i} | = \| \mathbf{x} \|_{\infty}\}.
$$

For any $i \in I(\mathbf{x})$ we have $x_{i} \neq 0$ , and hence for any such $i, \partial f_{i}(\mathbf{x}) = \{\mathrm{sgn}(x_{i}) \mathbf{e}_{i}\}$ Thus, by the max rule of subdiferential calculus (Theorem 3.50),

$$
\begin{array}{l} \partial f(\mathbf{x}) = \operatorname{conv} \left(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})\right) \\ \qquad = \operatorname{conv} \left(\cup_{i \in I(\mathbf{x})} \{\operatorname{sgn}(x_{i}) \mathbf{e}_{i}\}\right) \\ \qquad = \left\{\sum_{i \in I(\mathbf{x})} \lambda_{i} \operatorname{sgn}(x_{i}) \mathbf{e}_{i}: \sum_{i \in I(\mathbf{x})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{x}) \right\}.\end{array}
$$

To conclude,

$$
\partial f(\mathbf{x}) = \left\{\begin{array}{ll} B_{\| \cdot \|_{1}}[\mathbf{0}, 1], & \mathbf{x} = \mathbf{0}, \\ \left\{\sum_{i \in I(\mathbf{x})} \lambda_{i} \mathrm{sgn}(x_{i}) \mathbf{e}_{i}: \sum_{i \in I(\mathbf{x})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{x}) \right\}, & \mathbf{x} \neq \mathbf{0}.\end{array} \right.
$$

Example 3.53 (subdiferential of piecewise linear functions). Consider the piecewise linear function $f : \mathbb{R}^{n} \mathbb{R}$ given by

$$
f(\mathbf{x}) = \max_{i = 1, 2, \dots, m} \{\mathbf{a}_{i}^{T} \mathbf{x} + b_{i}\},
$$

where $\mathbf{a}_{i} \in \mathbb{R}^{n}, b_{i} \in \mathbb{R}, i = 1, 2, \dots, m$ . The function $f$ can be written as $f(\mathbf{x}) =$ max $\{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \hdots, f_{m}(\mathbf{x})\}$ , where $f_{i}(\mathbf{x}) = \mathbf{a}_{i}^{T} \mathbf{x} + b_{i}, i = 1, 2, \ldots, m$ . Obviously, $\partial f_{i}(\mathbf{x}) = \{\mathbf{a}_{i}\}$ . Thus, by the max rule of subdiferential calculus (Theorem 3.50),

$$
\begin{array}{c} \partial f(\mathbf{x}) = \left\{\sum_{i \in I(\mathbf{x})} \lambda_{i} \mathbf{a}_{i}: \sum_{i \in I(\mathbf{x})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{x}) \right\}, \\ \text{where} I(\mathbf{x}) = \{i: f(\mathbf{x}) = \mathbf{a}_{i}^{T} \mathbf{x} + b_{i}\}.\end{array}
$$

Example 3.54 (subdiferential of $\| \mathbf{Ax} + \mathbf{b} \|_{\infty})$ . Consider the function $f ~ :$ : $\mathbb{R}^{n} \to \mathbb{R}$ given by $f(\mathbf{x}) = \| \mathbf{A} \mathbf{x} + \mathbf{b} \|_{\infty}$ , where ${\textbf{A}} \in$ <sup>Rm×n</sup> and b $\in \mathbb{R}^{m}$ . Then $f(\mathbf{x}) = g(\mathbf{Ax} + \mathbf{b})$ , where $g : \mathbb{R}^{m} \mathbb{R}$ is given by $g(\mathbf{y}) = \| \mathbf{y} \|_{\infty}$ . By Example 3.52, we have, for any $\mathbf{y} \in \mathbb{R}^{m}$

$$
\partial g(\mathbf{y}) = \left\{\begin{array}{ll} B_{\| \cdot \|_{1}}[\mathbf{0}, 1], & \mathbf{y} = \mathbf{0}, \\ \left\{\sum_{i \in I(\mathbf{y})} \lambda_{i} \mathrm{sgn}(y_{i}) \mathbf{e}_{i}: \sum_{i \in I(\mathbf{y})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{y}) \right\}, & \mathbf{y} \neq \mathbf{0}, \end{array} \right.
$$

where

$$
I(\mathbf{y}) = \{i \in \{1, 2, \dots, m\}: | y_{i} | = \| \mathbf{y} \|_{\infty}\}.
$$

We can thus use the Affine transformation rule of subdiferential calculus (Theorem $3.43(b))$ to conclude that $\partial f(\mathbf{x}) = \mathbf{A}^{T} \partial g(\mathbf{Ax} + \mathbf{b})$ is given by

$$
\partial f(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{A}^{T} B_{\| \cdot \|_{1}}[\mathbf{0}, 1], & \mathbf{Ax} + \mathbf{b} = \mathbf{0}, \\ \left\{\sum_{i \in I_{\mathbf{x}}} \lambda_{i} \mathrm{sgn}(\mathbf{a}_{i}^{T} \mathbf{x} + b_{i}) \mathbf{a}_{i}: \sum_{i \in I_{\mathbf{x}}} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I_{\mathbf{x}} \right\}, & \mathbf{Ax} + \mathbf{b} \neq \mathbf{0}, \end{array} \right.
$$

where $\mathbf{a}_{1}^{T}, \mathbf{a}_{2}^{T}, \ldots, \mathbf{a}_{m}^{T}$ are the rows of A and $I_{\mathbf{x}} = I(\mathbf{Ax} + \mathbf{b})$

When the index set is arbitrary (for example, infinite), it is still possible to prove a weak subdiferential calculus rule.

Theorem 3.55 (weak maximum rule of subdiferential calculus). Let I be an arbitrary set, and suppose that any $i \in I$ is associated with a proper convex function $f_{i} : \mathbb{E}(- \infty, \infty]$ . Let

$$
f(\mathbf{x}) = \max_{i \in I} f_{i}(\mathbf{x}).\tag{3.50}
$$

Then for any $\mathbf{x} \in \operatorname{dom}(f)$

$$
\operatorname{conv} \left(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})\right) \subseteq \partial f(\mathbf{x}),\tag{3.51}
$$

where $I(\mathbf{x}) = \{i \in I : f(\mathbf{x}) = f_{i}(\mathbf{x})\}$

Proof. Let $\mathbf{x} \in \operatorname{dom}(f)$ . Then for any $\mathbf{z} \in \mathrm{dom}(f), i \in I(\mathbf{x})$ and $\mathbf{g} \in \partial f_{i}(\mathbf{x})$ ，

$$
f(\mathbf{z}) \geq f_{i}(\mathbf{z}) \geq f_{i}(\mathbf{x}) + \langle \mathbf{g}, \mathbf{z} - \mathbf{x} \rangle = f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{z} - \mathbf{x} \rangle,\tag{3.52}
$$

where the first inequality follows from (3.50), the second inequality is the subgradient inequality, and the equality is due to the assertion that $i \in I(\mathbf{x})$ . Since (3.52) holds for any $\mathbf{z} \in \operatorname{dom}(f)$ , we can conclude that $\mathbf{g} \in \partial f(\mathbf{x})$ . Thus, $\partial f_{i}(\mathbf{x}) \subseteq \partial f(\mathbf{x})$ Finally, by the convexity of $\partial f(\mathbf{x})$ (Theorem 3.9), the result (3.51) follows.

Example 3.56 (subgradient of $\begin{array}{r}{\lambda_{\operatorname{max}}(\mathbf{A_{0}} + \sum_{i = 1}^{m} x_{i} \mathbf{A}_{i}))} \end{array}$ . Let $\mathbf{A}_{0}, \mathbf{A}_{1}, \dots, \mathbf{A}_{m}$ $\in \mathbb{S}^{n}$ . Let $\mathcal{A} : \mathbb{R}^{\dot{m}} \mathbb{S}^{n}$ be the Affine transformation given by

$$
\mathcal{A}(\mathbf{x}) = \mathbf{A}_{0} + \sum_{i = 1}^{m} x_{i} \mathbf{A}_{i} \text{for any} \mathbf{x} \in \mathbb{R}^{m}.
$$

Consider the function $f : \mathbb{R}^{m} \mathbb{R}$ given by $f(\mathbf{x}) = \lambda_{\mathrm{max}}(\mathcal{A}(\mathbf{x}))$ . Since for any $\mathbf{x} \in \mathbb{R}^{m}$ ，

$$
f(\mathbf{x}) = \max_{\mathbf{y} \in \mathbb{R}^{n}: \| \mathbf{y} \|_{2} = 1} \mathbf{y}^{T} \mathcal{A}(\mathbf{x}) \mathbf{y},\tag{3.53}
$$

and since the function

$$
f_{\mathbf{y}}(\mathbf{x}) \equiv \mathbf{y}^{T} \mathcal{A}(\mathbf{x}) \mathbf{y} = \mathbf{y}^{T} \mathbf{A}_{0} \mathbf{y} + \sum_{i = 1}^{m}(\mathbf{y}^{T} \mathbf{A}_{i} \mathbf{y}) x_{i}
$$

is Affine in $\mathbf{x},$ and in particular convex in $\mathbf{x},$ it follows by Theorem $2.16(c)$ that $f$ is convex. For a given $\mathbf{x} \in \mathbb{R}^{n}$ , the maximum in (3.53) is attained at normalized eigenvectors which correspond to the maximum eigenvalue of $\mathcal{A}(\mathbf{x})$ . Let $\tilde{\mathbf{y}}$ be such a normalized eigenvector. Then it follows by the weak maximum rule of subdiferential calculus (Theorem 3.55) that a subgradient of the Affine function $f_{\tilde{\mathbf{y}}}$ at x is a subgradient of $f$ at x, that is,

$$
(\tilde{\mathbf{y}}^{T} \mathbf{A}_{1} \tilde{\mathbf{y}}, \tilde{\mathbf{y}}^{T} \mathbf{A}_{2} \tilde{\mathbf{y}}, \dots, \tilde{\mathbf{y}}^{T} \mathbf{A}_{m} \tilde{\mathbf{y}})^{T} \in \partial f(\mathbf{x}),\tag{3.54}
$$

where $\tilde{\mathbf{y}}$ is a normalized eigenvector of $\mathcal{A}(\mathbf{x})$ corresponding to the maximum eigenvalue.

It is interesting to note that the result (3.54) can also be deduced by the Affine transformation rule of subdiferential calculus (Theorem $3.43(b))$ . Indeed, let $\tilde{\mathbf{y}}$ be as defined above. The function $f$ can be written as $f(\mathbf{x}) = g(\mathcal{B}(\mathbf{x}) + \mathbf{A}_{0})$ , where $\begin{array}{r}{B(\mathbf{x}) \equiv \sum_{i = 1}^{m} x_{i} \mathbf{A}_{i}} \end{array}$ and $g(\mathbf{X}) \equiv \lambda_{\operatorname{max}}(\mathbf{X})$ . Then by the Affine transformation rule of subdiferential calculus,

$$
\partial f(\mathbf{x}) = \mathcal{B}^{T}(\partial g(\mathcal{B}(\mathbf{x}) + \mathbf{A}_{0})).\tag{3.55}
$$

By Example 3.8, we know that $\tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T} \in \partial g(\mathcal{B}(\mathbf{x}) + \mathbf{A}_{0})$ , and hence, by (3.55),

$$
\mathcal{B}^{T}(\tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T}) \in \partial f(\mathbf{x}).
$$

The result now follows by noting that

$$
\begin{array}{c} \mathcal{B}^{T}(\tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T}) =(\operatorname{Tr}(\mathbf{A}_{1} \tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T}), \operatorname{Tr}(\mathbf{A}_{2} \tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T}), \ldots, \operatorname{Tr}(\mathbf{A}_{m} \tilde{\mathbf{y}} \tilde{\mathbf{y}}^{T}))^{T} \\ =(\tilde{\mathbf{y}}^{T} \mathbf{A}_{1} \tilde{\mathbf{y}}, \tilde{\mathbf{y}}^{T} \mathbf{A}_{2} \tilde{\mathbf{y}}, \ldots, \tilde{\mathbf{y}}^{T} \mathbf{A}_{m} \tilde{\mathbf{y}})^{T}.\end{array}
$$

## 3.5 The Value Function1

Consider the minimization problem

$$
f_{\text{opt}} = \min_{\mathbf{x} \in X} \{f(\mathbf{x}): g_{i}(\mathbf{x}) \leq 0, i = 1, 2, \dots, m, \mathbf{Ax} + \mathbf{b} = \mathbf{0}\},\tag{3.56}
$$

where $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to(- \infty, \infty]$ are extended real-valued functions, $X \subseteq \mathbb{E}$ a nonempty set, $\mathbf{A} \in \mathbb{R}^{p \times n}$ , and b $\in \mathbb{R}^{p}$ . We will define the vector-valued function $\mathbf{g} : \mathbb{E} \mathbb{R}^{m}$ as

$$
\mathbf{g}(\mathbf{x}) \equiv(g_{1}(\mathbf{x}), g_{2}(\mathbf{x}), \dots, g_{m}(\mathbf{x}))^{T},
$$

so that problem (3.56) can be rewritten more compactly as

$$
\min_{\mathbf{x} \in X} \{f(\mathbf{x}): \mathbf{g}(\mathbf{x}) \leq \mathbf{0}, \mathbf{Ax} + \mathbf{b} = \mathbf{0}\}.
$$

The value function associated with problem (3.56) is the function $v : \mathbb{R}^{m} \times$ $\mathbb{R}^{p} \to[- \infty, \infty]$ given by

$$
v(\mathbf{u}, \mathbf{t}) = \min_{\mathbf{x} \in X} \left\{f(\mathbf{x}): g(\mathbf{x}) \leq \mathbf{u}, \mathbf{Ax} + \mathbf{b} = \mathbf{t} \right\}.\tag{3.57}
$$

The feasible set of the minimization problem in (3.57) will be denoted by

$$
C(\mathbf{u}, \mathbf{t}) = \left\{\mathbf{x} \in X: g(\mathbf{x}) \leq \mathbf{u}, \mathbf{Ax} + \mathbf{b} = \mathbf{t} \right\},
$$

so that the value function can also be rewritten as $v(\mathbf{u}, \mathbf{t}) = \operatorname{min} \{f(\mathbf{x}) : \mathbf{x} \in C(\mathbf{u}, \mathbf{t})\}$ By convention $v(\mathbf{u, t}) = \infty \mathrm{~ if ~} C(\mathbf{u, t})$ is empty. A simple property of the value function $v(\cdot, \cdot)$ is that it is monotone $\mathrm{w.r.t}$ . its first argument.

Lemma 3.57 (monotonicity of the value function). Let $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to$ $(- \infty, \infty]$ be extended real-valued functions, $X \subseteq \mathbb{E}$ a nonempty set, $\mathbf{A} \in \mathbb{R}^{p \times n}$ , and b $\in \mathbb{R}^{p}$ . Let v be the value function given in (3.57). Then

$$
v(\mathbf{u}, \mathbf{t}) \geq v(\mathbf{w}, \mathbf{t}) forany \mathbf{u}, \mathbf{w} \in \mathbb{R}^{m}, \mathbf{t} \in \mathbb{R}^{p} satisfying \mathbf{u} \leq \mathbf{w}.
$$

Proof. Follows by the obvious fact that $C(\mathbf{u}, \mathbf{t}) \subseteq C(\mathbf{w}, \mathbf{t})$ whenever $\mathbf{u} \leq \mathbf{w}$ □

From now on we will also assume in addition that $f, g_{1}, g_{2}, \ldots, g_{m}$ , and X are convex. With these additional assumptions, we now show that the value function is convex as long as it is proper.

Lemma 3.58 (convexity of the value function). Let $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to$ $(- \infty, \infty]$ be convex functions, $X \subseteq \mathbb{E}$ a nonempty convex set, $\textbf{A} \in \mathbb{R}^{p \times n}$ , and $\mathbf{b} \in \mathbb{R}^{p}$ . Suppose that the value function v given in (3.57) is proper. Then v is convex over $\mathbb{R}^{m} \times \mathbb{R}^{p}$

Proof. Let $(\mathbf{u}, \mathbf{t}),(\mathbf{w}, \mathbf{s}) \in \mathrm{dom}(v)$ and $\lambda \in[0, 1]$ . Since v is proper, to prove the convexity, we need to show that

$$
v(\lambda \mathbf{u} +(1 - \lambda) \mathbf{w}, \lambda \mathbf{t} +(1 - \lambda) \mathbf{s}) \leq \lambda v(\mathbf{u}, \mathbf{t}) +(1 - \lambda) v(\mathbf{w}, \mathbf{s}).
$$

By the definition of the value function v, there exist sequences $\{\mathbf{x}_{k}\}_{k \geq 1}, \{\mathbf{y}_{k}\}_{k \geq 1}$ satisfying

$$
\mathbf{x}_{k} \in C(\mathbf{u}, \mathbf{t}), \mathbf{y}_{k} \in C(\mathbf{w}, \mathbf{s}), f(\mathbf{x}_{k}) \rightarrow v(\mathbf{u}, \mathbf{t}), f(\mathbf{y}_{k}) \rightarrow v(\mathbf{w}, \mathbf{s}) \text{as} k \rightarrow \infty.
$$

Since $\mathbf{x}_{k} \in C(\mathbf{u}, \mathbf{t})$ and $\mathbf{y}_{k} \in C(\mathbf{w}, \mathbf{s})$ , we have $\mathbf{g}(\mathbf{x}_{k}) \leq \mathbf{u}, \mathbf{g}(\mathbf{y}_{k}) \leq \mathbf{w}$ . Therefore, by the convexity of the components of $\mathbf{g}_{\mathrm{:}}$ ,

$$
\mathbf{g} \left(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}\right) \leq \lambda \mathbf{g} \left(\mathbf{x}_{k}\right) +(1 - \lambda) \mathbf{g} \left(\mathbf{y}_{k}\right) \leq \lambda \mathbf{u} +(1 - \lambda) \mathbf{w}.\tag{3.58}
$$

Moreover,

$$
\mathbf{A} \left(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}\right) + \mathbf{b} = \lambda \left(\mathbf{Ax}_{k} + \mathbf{b}\right) +(1 - \lambda) \left(\mathbf{Ay}_{k} + \mathbf{b}\right) = \lambda \mathbf{s} +(1 - \lambda) \mathbf{t}.\tag{3.59}
$$

Combining (3.58) and (3.59), we conclude that

$$
\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k} \in C(\lambda \mathbf{u} +(1 - \lambda) \mathbf{w}, \lambda \mathbf{s} +(1 - \lambda) \mathbf{t}).\tag{3.60}
$$

By the convexity of $f_{;}$ 9

$$
f(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}) \leq \lambda f(\mathbf{x}_{k}) +(1 - \lambda) f(\mathbf{y}_{k}).\tag{3.61}
$$

Since $\lambda f(\mathbf{x}_{k}) +(1 - \lambda) f(\mathbf{y}_{k}) \to \lambda v(\mathbf{u}, \mathbf{t}) +(1 - \lambda) v(\mathbf{w}, \mathbf{s}){\mathrm{~ as ~}} k \to \infty$ , by (3.61) we have

$$
\liminf_{k \to \infty} f(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}) \leq \lambda v(\mathbf{u}, \mathbf{t}) +(1 - \lambda) v(\mathbf{w}, \mathbf{s}).\tag{3.62}
$$

Finally, since (3.60) holds, by the definition of v, for all $k.$

$$
v(\lambda \mathbf{u} +(1 - \lambda) \mathbf{w}, \lambda \mathbf{t} +(1 - \lambda) \mathbf{s}) \leq f(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}),
$$

and hence

$$
v(\lambda \mathbf{u} +(1 - \lambda) \mathbf{w}, \lambda \mathbf{t} +(1 - \lambda) \mathbf{s}) \leq \operatorname{liminf}_{k \to \infty} f(\lambda \mathbf{x}_{k} +(1 - \lambda) \mathbf{y}_{k}),
$$

which, combined with (3.62), yields the inequality

$$
v(\lambda \mathbf{u} +(1 - \lambda) \mathbf{w}, \lambda \mathbf{t} +(1 - \lambda) \mathbf{s}) \leq \lambda v(\mathbf{u}, \mathbf{t}) +(1 - \lambda) v(\mathbf{w}, \mathbf{s}),
$$

establishing the convexity of v.

The dual objective function $q : \mathbb{R}_{+}^{m} \times \mathbb{R}^{q} \to[- \infty, \infty)$ of problem (3.56) is

$$
q(\mathbf{y}, \mathbf{z}) = \min_{\mathbf{x} \in X} \left\{L(\mathbf{x}; \mathbf{y}, \mathbf{z}) = f(\mathbf{x}) + \mathbf{y}^{T} \mathbf{g}(\mathbf{x}) + \mathbf{z}^{T}(\mathbf{Ax} + \mathbf{b}) \right\}, \mathbf{y} \in \mathbb{R}_{+}^{m}, \mathbf{z} \in \mathbb{R}^{p}.
$$

The dual problem consists of maximizing q on its efective domain given by

$$
\operatorname{dom}(- q) = \left\{\left(\mathbf{y}, \mathbf{z}\right) \in \mathbb{R}_{+}^{m} \times \mathbb{R}^{p}: q(\mathbf{y}, \mathbf{z}) > - \infty \right\}.
$$

The dual problem

$$
q_{\text{opt}} = \max_{\mathbf{y} \in \mathbb{R}_{+}^{m}, \mathbf{z} \in \mathbb{R}^{p}} \left\{q(\mathbf{y}, \mathbf{z}):(\mathbf{y}, \mathbf{z}) \in \operatorname{dom}(- q) \right\}\tag{3.63}
$$

is convex in the sense that it consists of maximizing the concave function q over the convex feasible set dom $(- q)$ . We are now ready to show the main result of this section, which is a relation between the subdiferential set of the value function at the zeros vector and the set of optimal solutions of the dual problem. The result is established under the assumption that strong duality holds, meaning under the assumptions that the optimal values of the primal and dual problems are finite and equal $(f_{\mathrm{opt}} = q_{\mathrm{opt}})$ and the optimal set of the dual problem is nonempty. By the strong duality theorem stated as Theorem A.1 in the appendix, it follows that these assumptions are met if the optimal value of problem (3.56) is finite, and if there exists a feasible solution x¯ satisfying ${\bf g}(\bar{\bf x}) <{\bf 0}$ and a vector $\hat{\mathbf{x}} \in \operatorname{ri}(X)$ satisfying $\mathbf{A}{\hat{\mathbf{x}}} + \mathbf{b} = \mathbf{0}$

Theorem 3.59 (characterization of the subdiferential of the value function at 0). Let $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to(- \infty, \infty]$ be convex functions, $X \subseteq \mathbb{E}$ a nonempty convex set, $\mathbf{A} \in \mathbb{R}^{p \times n}$ , and b $\in \mathbb{R}^{p}$ . Let v be the value function given by (3.57). Suppose that $f_{\mathrm{opt}} = q_{\mathrm{opt}} \in(- \infty, \infty)$ and that the optimal set of the dual problem is nonempty. Then

(a) v is proper and convex;

(b) $(\mathbf{y}, \mathbf{z})$ is an optimal solution of problem (3.63) if and only $if -(\mathbf{y}, \mathbf{z}) \in \partial v(\mathbf{0}, \mathbf{0})$

Proof. Let $(\mathbf{y}, \mathbf{z}) \in \mathrm{dom}(- q)$ be an optimal solution of the dual problem. Then (recalling that $v(\mathbf{0}, \mathbf{0}) = f_{\mathrm{opt}})$

$$
L(\mathbf{x}; \mathbf{y}, \mathbf{z}) \geq \min_{\mathbf{w} \in X} L(\mathbf{w}; \mathbf{y}, \mathbf{z}) = q(\mathbf{y}, \mathbf{z}) = q_{\text{opt}} = f_{\text{opt}} = v(\mathbf{0}, \mathbf{0}) \text{for all} \mathbf{x} \in X.
$$

Therefore, for any $\mathbf{x} \in C(\mathbf{u}, \mathbf{t})$

$$
\begin{array}{l} v(\mathbf{0}, \mathbf{0}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t} \leq L(\mathbf{x}; \mathbf{y}, \mathbf{z}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t} \\ \qquad = f(\mathbf{x}) + \mathbf{y}^{T} \mathbf{g}(\mathbf{x}) + \mathbf{z}^{T}(\mathbf{Ax} + \mathbf{b}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t} \\ \qquad = f(\mathbf{x}) + \mathbf{y}^{T}(\mathbf{g}(\mathbf{x}) - \mathbf{u}) + \mathbf{z}^{T}(\mathbf{Ax} + \mathbf{b} - \mathbf{t}) \\ \qquad \leq f(\mathbf{x}), \end{array}
$$

where the last inequality follows from the facts that $\mathbf{g}(\mathbf{x}) \leq \mathbf{u}, \mathbf{y} \geq \mathbf{0}$ , and $\mathbf{A} \mathbf{x} + \mathbf{b} =$ t. We thus obtained the bound

$$
f(\mathbf{x}) \geq v(\mathbf{0}, \mathbf{0}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t} \text{for any} \mathbf{x} \in C(\mathbf{u}, \mathbf{t}).
$$

Minimizing the left-hand side w.r.t. $\mathbf{x} \in C(\mathbf{u}, \mathbf{t})$ yields

$$
v(\mathbf{u}, \mathbf{t}) \geq v(\mathbf{0}, \mathbf{0}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t},\tag{3.64}
$$

which is equivalent to saying that $-(\mathbf{y}, \mathbf{z}) \ \in \ \partial v(\mathbf{0}, \mathbf{0})$ . We actually showed one direction of claim (b), as well as the properness of v since by (3.64), $v({\bf u},{\bf t}) > - \infty$ for any $(\mathbf{u}, \mathbf{t}) \in \mathbb{R}^{m} \times \mathbb{R}^{p}$ , and by the premise of the theorem, $v(\mathbf{0}, \mathbf{0}) = f_{\mathrm{opt}} < \infty$ Invoking Lemma 3.58, it follows that v is convex, establishing claim (a).

All that is left is to show the reverse direction of claim (b). Assume that $-(\mathbf{y}, \mathbf{z}) \in \partial v(\mathbf{0}, \mathbf{0})$ , meaning that

$$
v(\mathbf{u}, \mathbf{t}) \geq v(\mathbf{0}, \mathbf{0}) - \mathbf{y}^{T} \mathbf{u} - \mathbf{z}^{T} \mathbf{t} \text{for any}(\mathbf{u}, \mathbf{t}) \in \mathbb{R}^{m} \times \mathbb{R}^{p}.\tag{3.65}
$$

Let $\mathbf{x} \in X$ . Then

$$
f(\mathbf{x}) \geq v(\mathbf{g}(\mathbf{x}), \mathbf{Ax} + \mathbf{b}) \stackrel{(3.65)}{\geq} v(\mathbf{0}, \mathbf{0}) - \mathbf{y}^{T} \mathbf{g}(\mathbf{x}) - \mathbf{z}^{T}(\mathbf{Ax} + \mathbf{b}).
$$

Therefore,

$$
v(\mathbf{0}, \mathbf{0}) \leq f(\mathbf{x}) + \mathbf{y}^{T} \mathbf{g}(\mathbf{x}) + \mathbf{z}^{T}(\mathbf{Ax} + \mathbf{b}) = L(\mathbf{x}; \mathbf{y}, \mathbf{z}) \text{for any} \mathbf{x} \in X.
$$

Minimizing the right-hand side w.r.t. $\mathbf{x} \in X$ yields

$$
v(\mathbf{0}, \mathbf{0}) \leq \min_{\mathbf{x} \in X} L(\mathbf{x}; \mathbf{y}, \mathbf{z}) = q(\mathbf{y}, \mathbf{z}).\tag{3.66}
$$

Let $j \in \{1, 2, \dots, m\}$ . Plugging $\mathbf{u} = \mathbf{e}_{j}, \mathbf{t} = \mathbf{0}$ into (3.65), we obtain

$$
y_{j} \geq v(\mathbf{0}, \mathbf{0}) - v(\mathbf{e}_{j}, \mathbf{0}) \geq 0,
$$

where the second inequality follows from the monotonicity property of the value function stated in Lemma 3.57. We thus obtained that $\mathbf{y} \geq \mathbf{0}$ , and we can consequently write using (3.66)

$$
q_{\mathrm{opt}} = f_{\mathrm{opt}} = v(\mathbf{0}, \mathbf{0}) \leq q(\mathbf{y}, \mathbf{z}) \leq q_{\mathrm{opt}},
$$

showing that $q(\mathbf{y}, \mathbf{z}) = q_{\mathrm{opt}}$ , meaning that $(\mathbf{y}, \mathbf{z})$ is an optimal solution of the dual problem.

Theorem 3.59 can be used to prove a result concerning an optimality measure of problem (3.56). Consider the following expression:

$$
D(\mathbf{x}) \equiv f(\mathbf{x}) - f_{\mathrm{opt}} + \rho_{1} \|[\mathbf{g}(\mathbf{x})]_{+} \|_{2} + \rho_{2} \| \mathbf{Ax} + \mathbf{b} \|_{2}.
$$

Now assume that

$$
D(\tilde{\mathbf{x}}) \leq \delta\tag{3.67}
$$

for some $\tilde{\mathbf{x}} \in X$ and a small $\delta > 0$ . The question that now arises is whether (3.67) implies that the expressions $f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}}$ as well as ${\|[\mathbf{g(\tilde{x})}]_{+} \|_{2}}$ and $\| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \|_{2}$ are also “small” in the sense that they are smaller than a constant times δ. In general, the answer is no. The vector $\tilde{\bf x}$ is not guaranteed to be feasible, and therefore, in principle, $f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}}$ might be very small (and negative), and $| |[\mathbf{g}(\tilde{\mathbf{x}})]_{+} | |_{2}$ and $\| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \|_{2}$ can be very large. However, we will show in the next theorem that if $\rho_{1}$ and $\rho_{2}$ are chosen to be large enough, then under the setting of Theorem 3.59, such a conclusion can be drawn.

Theorem 3.60.<sup>19</sup> Let $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to(- \infty, \infty]$ be convex functions, $X \subseteq \mathbb{E}$ a nonempty convex set, $\mathbf{A} \in \mathbb{R}^{p \times n}$ , and b $\in \mathbb{R}^{p}$ . Let $f_{\mathrm{opt}}$ and $q_{\mathrm{opt}}$ be the optimal values of the primal and dual problems (3.56) and (3.63), respectively. Suppose that $f_{\mathrm{opt}} = q_{\mathrm{opt}} \in(- \infty, \infty)$ and that the optimal set of the dual problem is nonempty. Let $\left(\mathbf{y}^{*}, \mathbf{z}^{*} \right)$ be an optimal solution of the dual problem. Assume that ${\tilde{\mathbf{x}}} \in X$ satisfies

$$
f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}} + \rho_{1} \|[\mathbf{g}(\tilde{\mathbf{x}})]_{+} \|_{2} + \rho_{2} \| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \|_{2} \leq \delta,\tag{3.68}
$$

where $\delta > 0$ and $\rho_{1}, \rho_{2}$ are constants satisfying $\rho_{1} \geq 2 \| \mathbf{y}^{*} \|_{2}, \rho_{2} \geq 2 \| \mathbf{z}^{*} \|_{2}$ . Then

$$
f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}} \leq \delta,
$$

$$
\|[\mathbf{g}(\tilde{\mathbf{x}})]_{+} \|_{2} \leq \frac{2}{\rho_{1}} \delta,
$$

$$
\left\| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \right\|_{2} \leq \frac{2}{\rho_{2}} \delta.
$$

Proof. The inequality $f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}} \leq \delta$ trivially follows from (3.68) and the fact that the expressions $\rho_{1} \|[\mathbf{g}(\tilde{\mathbf{x}})]_{+} \|_{2}$ and $\rho_{2} \| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \|_{2}$ are nonnegative.

Define the function

$$
v(\mathbf{u}, \mathbf{t}) = \min_{\mathbf{x} \in X} \{f(\mathbf{x}): \mathbf{g}(\mathbf{x}) \leq \mathbf{u}, \mathbf{Ax} + \mathbf{b} = \mathbf{t}\}.
$$

Since $\left(\mathbf{y}^{*}, \mathbf{z}^{*} \right)$ is an optimal solution of the dual problem, it follows by Theorem 3.59 that $(- \mathbf{y}^{*}, - \mathbf{z}^{*}) \in \partial v(\mathbf{0}, \mathbf{0})$ . Therefore, for any $(\mathbf{u}, \mathbf{t}) \in \mathrm{dom}(v)$

$$
v(\mathbf{u}, \mathbf{t}) - v(\mathbf{0}, \mathbf{0}) \geq \langle - \mathbf{y}^{*}, \mathbf{u} \rangle + \langle - \mathbf{z}^{*}, \mathbf{t} \rangle.\tag{3.69}
$$

Plugging $\mathbf{u} = \tilde{\mathbf{u}} \equiv[\mathbf{g}(\tilde{\mathbf{x}})] -$ <sub>+</sub> and $\mathbf{t} = \tilde{\mathbf{t}} \equiv \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b}$ into (3.69), while using the inequality $v(\tilde{\mathbf{u}}, \tilde{\mathbf{t}}) \leq f(\tilde{\mathbf{x}})$ and the equality $v({\bf 0},{\bf 0}) = f_{\mathrm{opt}}.$ , we obtain

$$
\begin{array}{l}(\rho_{1} - \| \mathbf{y}^{*} \|_{2}) \| \tilde{\mathbf{u}} \|_{2} +(\rho_{2} - \| \mathbf{z}^{*} \|_{2}) \| \tilde{\mathbf{t}} \|_{2} = - \| \mathbf{y}^{*} \|_{2} \| \tilde{\mathbf{u}} \|_{2} - \| \mathbf{z}^{*} \|_{2} \| \tilde{\mathbf{t}} \|_{2} + \rho_{1} \| \tilde{\mathbf{u}} \|_{2} + \rho_{2} \| \tilde{\mathbf{t}} \|_{2} \\ \qquad \qquad \qquad \leq \langle - \mathbf{y}^{*}, \tilde{\mathbf{u}} \rangle + \langle - \mathbf{z}^{*}, \tilde{\mathbf{t}} \rangle + \rho_{1} \| \tilde{\mathbf{u}} \|_{2} + \rho_{2} \| \tilde{\mathbf{t}} \|_{2} \\ \qquad \qquad \qquad \leq v(\tilde{\mathbf{u}}, \tilde{\mathbf{t}}) - v(\mathbf{0}, \mathbf{0}) + \rho_{1} \| \tilde{\mathbf{u}} \|_{2} + \rho_{2} \| \tilde{\mathbf{t}} \|_{2} \\ \qquad \qquad \qquad \leq f(\tilde{\mathbf{x}}) - f_{\mathrm{opt}} + \rho_{1} \| \tilde{\mathbf{u}} \|_{2} + \rho_{2} \| \tilde{\mathbf{t}} \|_{2} \\ \qquad \qquad \qquad \leq \delta.\end{array}
$$

Therefore, since both expressions $(\rho_{1} - \| \mathbf{y}^{*} \|_{2}) \| \tilde{\mathbf{u}} \|_{2}$ and $(\rho_{2} - \| \mathbf{z}^{*} \|_{2}) \| \tilde{\mathbf{t}} \|_{2}$ are nonnegative, it follows that

$$
\begin{array}{c}(\rho_{1} - \| \mathbf{y}^{*} \|_{2}) \| \tilde{\mathbf{u}} \|_{2} \leq \delta, \\(\rho_{2} - \| \mathbf{z}^{*} \|_{2}) \| \tilde{\mathbf{t}} \|_{2} \leq \delta, \end{array}
$$

and hence, using the assumptions that $\rho_{1} \geq 2 \| \mathbf{y}^{*} \|_{2}$ and $\rho_{2} \geq 2 \| \mathbf{t}^{*} \|_{2}$ ,

$$
\|[\mathbf{g}(\tilde{\mathbf{x}})]_{+} \|_{2} = \| \tilde{\mathbf{u}} \|_{2} \leq \frac{\delta}{\rho_{1} - \| \mathbf{y}^{*} \|_{2}} \leq \frac{2}{\rho_{1}} \delta,
$$

$$
\| \mathbf{A} \tilde{\mathbf{x}} + \mathbf{b} \|_{2} = \| \tilde{\mathbf{t}} \|_{2} \leq \frac{\delta}{\rho_{2} - \| \mathbf{z}^{*} \|_{2}} \leq \frac{2}{\rho_{2}} \delta.
$$

## 3.6 Lipschitz Continuity and Boundedness of Subgradients

This section considers an important relation between Lipschitz continuity of a convex function and boundedness of its subgradients.

Theorem 3.61 (Lipschitz continuity and boundedness of the subdiferential sets). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper and convex function. Suppose that $X \subseteq \operatorname{int}(\operatorname{dom} f)$ . Consider the following two claims:

(i) $| f(\mathbf{x}) - f(\mathbf{y}) | \leq L \| \mathbf{x} - \mathbf{y} \| \for \any \ \mathbf{x}, \mathbf{y} \in X$

(ii) $\| \mathbf{g} \|_{*} \leq L$ for any $\mathbf{g} \in \partial f(\mathbf{x}), \mathbf{x} \in X$

Then

(a) the implication $\mathrm{(ii)} \Rightarrow \mathrm{(i)}$ holds;

(b) if X is open, then (i) holds if and only if (ii) holds.

Proof. (a) Suppose that (ii) is satisfied and let $\mathbf{x}, \mathbf{y} \in X$ . Let $\mathbf{g_{x}} \in \partial f(\mathbf{x})$ and $\mathbf{g}_{\mathbf{y}} \in \partial f(\mathbf{y})$ . The existence of these subgradients is guaranteed by Theorem 3.14. Then by the definitions of $\mathbf{g}_{\mathbf{x}}, \mathbf{g}_{\mathbf{y}}$ and the generalized Cauchy–Schwarz inequality (Lemma 1.4),

$$
f(\mathbf{x}) - f(\mathbf{y}) \leq \left\langle \mathbf{g}_{\mathbf{x}}, \mathbf{x} - \mathbf{y} \right\rangle \leq \| \mathbf{g}_{\mathbf{x}} \|_{*} \| \mathbf{x} - \mathbf{y} \| \leq L \| \mathbf{x} - \mathbf{y} \|,
$$

$$
f(\mathbf{y}) - f(\mathbf{x}) \leq \left\langle \mathbf{g}_{\mathbf{y}}, \mathbf{y} - \mathbf{x} \right\rangle \leq \| \mathbf{g}_{\mathbf{y}} \|_{*} \| \mathbf{x} - \mathbf{y} \| \leq L \| \mathbf{x} - \mathbf{y} \|,
$$

showing the validity of (i).

(b) The implication $\mathrm{(ii)} \Rightarrow \mathrm{(i)}$ was already shown. Now assume that (i) is satisfied. Take $\mathbf{x} \in X$ and $\mathbf{g} \in \partial f(\mathbf{x})$ . We will show that $\| \mathbf{g} \|_{*} \leq L$ . Define $\mathbf{g}^{\dagger} \in \mathbb{E}$ as a vector that satisfies $\| \mathbf{g}^{\dag} \| = 1, \langle \mathbf{g}^{\dag}, \mathbf{g} \rangle = \| \mathbf{g} \|_{*}$ (the existence of such a vector is warranted by the definition of the dual norm). Take $\varepsilon > 0$ small enough such that $\mathbf{x} + \varepsilon \mathbf{g}^{\dagger} \in X$ . By the subgradient inequality we have

$$
f(\mathbf{x} + \varepsilon \mathbf{g}^{\dagger}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \varepsilon \mathbf{g}^{\dagger} \rangle.
$$

Thus,

$$
\varepsilon \| \mathbf{g} \|_{*} = \langle \mathbf{g}, \varepsilon \mathbf{g}^{\dagger} \rangle \leq f(\mathbf{x} + \varepsilon \mathbf{g}^{\dagger}) - f(\mathbf{x}) \leq L \| \mathbf{x} + \varepsilon \mathbf{g}^{\dagger} - \mathbf{x} \| = L \varepsilon,
$$

showing that $\| \mathbf{g} \|_{*} \leq L$

Recall that by Theorem 3.16, the subgradients of a given convex function $f$ are bounded over compact sets contained in int $\left(\operatorname{dom}(f) \right)$ . Combining this with Theorem 3.61, we can conclude that convex functions are always Lipschitz continuous over compact sets contained in the interior of their domain.

Corollary 3.62 (Lipschitz continuity of convex functions over compact domains). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper and convex function. Suppose that $X \subseteq \operatorname{int}(\operatorname{dom}(f))$ is compact. Then there exists $L > 0$ for which

$$
| f(\mathbf{x}) - f(\mathbf{y}) | \leq L \| \mathbf{x} - \mathbf{y} \| \text{for any} \mathbf{x}, \mathbf{y} \in X.
$$

## 3.7 Optimality Conditions

## 3.7.1 Fermat’s Optimality Condition

Subdiferential sets are extremely useful in characterizing minima points. Perhaps the most basic optimality condition states that a point is a global minimum of a proper extended real-valued convex function if and only if 0 belongs to the subdiferential set at the point. In a sense, this is a generalization of Fermat’s optimality condition at points of Differentiability $(^{*} \nabla f(\mathbf{x}^{*}) = \mathbf{0}^{*})$ ). We will refer to this condition as Fermat’s optimality condition.

Theorem 3.63 (Fermat’s optimality condition). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper convex function. Then

$$
\mathbf{x}^{*} \in \operatorname{argmin} \{f(\mathbf{x}): \mathbf{x} \in \mathbb{E}\}\tag{3.70}
$$

if and only if $\mathbf{0} \in \partial f(\mathbf{x}^{*})$

Proof. Follows by the definition of the subgradient. Indeed, (3.70) is satisfied if and only if

$$
f(\mathbf{x}) \geq f \left(\mathbf{x}^{*}\right) + \langle \mathbf{0}, \mathbf{x} - \mathbf{x}^{*} \rangle \text{for any} \mathbf{x} \in \operatorname{dom}(f),
$$

which is the same as the inclusion $\mathbf{0} \in \partial f(\mathbf{x}^{*})$

Example 3.64 (minimizing piecewise linear functions). Consider the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left[f(\mathbf{x}) \equiv \max_{i = 1, 2, \ldots, m} \left\{\mathbf{a}_{i}^{T} \mathbf{x} + b_{i} \right\} \right],\tag{3.71}
$$

where $\mathbf{a}_{i} \in \mathbb{R}^{n}, b_{i} \in \mathbb{R}, i = 1, 2, \dots, m$ . Denote

$$
I(\mathbf{x}) = \left\{i: f(\mathbf{x}) = \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} \right\}.
$$

Then, by Example 3.53,

$$
\partial f(\mathbf{x}) = \left\{\sum_{i \in I(\mathbf{x})} \lambda_{i} \mathbf{a}_{i}: \sum_{i \in I(\mathbf{x})} \lambda_{i} = 1, \lambda_{j} \geq 0, j \in I(\mathbf{x}) \right\}.
$$

Therefore, since by Fermat’s optimality condition $\mathbf{x}^{*}$ is an optimal solution of (3.71) if and only if $\mathbf{0} \in \partial f(\mathbf{x}^{*})$ , it follows that $\mathbf{x}^{*}$ is an optimal solution of problem (3.71) if and only if there exists $\lambda \in \Delta_{m}$ such that

$$
\mathbf{0} = \sum_{i = 1}^{m} \lambda_{i} \mathbf{a}_{i} \text{and} \lambda_{j} = 0 \text{for any} j \notin I(\mathbf{x}^{*}).\tag{3.72}
$$

We can rewrite this condition in a more compact way by denoting $\mathbf{A} \in \mathbb{R}^{m \times n}$ to be the matrix whose rows are $\mathbf{a}_{1}^{T}, \mathbf{a}_{2}^{T}, \ldots, \mathbf{a}_{m}^{T}$ . Then the optimality condition (3.72) can be written as

$$
\exists \pmb{\lambda} \in \Delta_{m} \mathrm{s.t.} \mathbf{A}^{T} \pmb{\lambda} = \mathbf{0} \mathrm{and} \lambda_{j}(\mathbf{a}_{j}^{T} \mathbf{x}^{*} + b_{j} - f(\mathbf{x}^{*})) = 0, j = 1, 2, \ldots, m.
$$

Example 3.65 (medians). Suppose that we are given n different<sup>20</sup> and ordered numbers $a_{1} < a_{2} < \cdots < a_{n}$ . Denote $A = \left\{a_{1}, a_{2}, \dotsc, a_{n} \right\} \subseteq \mathbb{R}$ . The median of A is a number $\beta$ that satisfies

$$
\# \{i: a_{i} \leq \beta\} \geq \frac{n}{2} \text{and} \# \{i: a_{i} \geq \beta\} \geq \frac{n}{2}.
$$

That is, a median of A is a number that satisfies that at least half of the numbers in A are smaller or equal to it and that at least half are larger or equal. It is not dificult to see that if A has an odd number of elements, then the median is the middlemost number. For example, the median of {5, 8, 11, 60, 100} is 11. If the number of elements in A is even, then there is no unique median. The set of medians comprises all numbers between the two middle values. For example, if $A = \{5, 8, 11, 20, 60, 100\}$ , then the set of medians of A is the interval [11, 20]. In general,

$$
\operatorname{median}(A) = \left\{\begin{array}{ll} a_{\frac{n + 1}{2}}, & n \text{odd}, \\[a_{\frac{n}{2}}, a_{\frac{n}{2} + 1}], & n \text{even}.\end{array} \right.
$$

From an optimization perspective, the set of possible medians is the optimal solution set of the problem

$$
\min \left\{f(x) \equiv \sum_{i = 1}^{n} | x - a_{i} | \right\}.\tag{3.73}
$$

To show this, denote $f_{i}(x) \equiv | x - a_{i} |$ , so that $f(x) = f_{1}(x) + f_{2}(x) + \cdot \cdot \cdot + f_{n}(x)$ 2 and note that for any $i \in \{1, 2, \ldots, n\}$ ,

$$
\partial f_{i}(x) = \left\{\begin{array}{ll} 1, & x > a_{i}, \\ - 1, & x < a_{i}, \\[- 1, 1], & x = a_{i}.\end{array} \right.
$$

By the sum rule of subdiferential calculus (Theorem 3.40),

$$
\begin{array}{l} \partial f(x) = \partial f_{1}(x) + \partial f_{2}(x) + \dots + \partial f_{n}(x) \\ = \left\{\begin{array}{ll} \# \{i: a_{i} < x\} - \# \{i: a_{i} > x\}, & x \notin A, \\ \# \{i: a_{i} < x\} - \# \{i: a_{i} > x\} +[- 1, 1], & x \in A.\end{array} \right.\end{array}
$$

We can further elaborate and write

$$
\partial f(x) = \left\{\begin{array}{ll} 2i - n, & x \in(a_{i}, a_{i + 1}), \\ 2i - 1 - n +[- 1, 1], & x = a_{i}, \\ - n, & x < a_{1}, \\ n, & x > a_{n}.\end{array} \right.\tag{3.74}
$$

Let $i \in \{1, 2,..., n\}.\mathrm{~ By ~}(3.74), 0 \in \partial f(a_{i})$ if and only $\mathrm{if ~} | 2i - 1 - n | \leq 1$ , which is equivalent to $\begin{array}{r}{\frac{n}{2} \leq i \leq \frac{n}{2} + 1} \end{array}$ and $0 \in \partial f(x)$ for some $x \in \left(a_{i}, a_{i + 1} \right)$ if and only if $\begin{array}{r}{i = \frac{n}{2}} \end{array}$ . We can thus conclude that if n is odd, then the only optimal point is $a_{\frac{n + 1}{2}}$ and when n is even, the optimal set is the interval $[a_{\frac{n}{2}}, a_{\frac{n}{2} + 1}]$ <sup>2</sup>, establishing the fact <sup>2 2</sup>that the optimal set of (3.73) is exactly the set of medians.

Example 3.66 (Fermat–Weber problem). Given m different points in $\mathbb{R}^{d}, A =$ $\{\mathbf{a}_{1}, \mathbf{a}_{2}, \dots, \mathbf{a}_{m}\}$ , and m positive weights $\omega_{1}, \omega_{2}, \ldots, \omega_{m}$ , the Fermat–Weber problem is given by

$$
\text{(FW)} \quad \min_{\mathbf{x} \in \mathbb{R}^{d}} \left\{f(\mathbf{x}) \equiv \sum_{i = 1}^{m} \omega_{i} \| \mathbf{x} - \mathbf{a}_{i} \|_{2} \right\}.
$$

The Fermat–Weber problem is actually a weighted multidimensional version of the median problem (3.73) discussed in the previous example and is therefore also referred to in the literature as the geometric median problem. Let us write explicitly the optimality conditions for problem (FW). Denote $f_{i}({\bf x}) = \omega_{i} g_{i}({\bf x})$ , where $g_{i}(\mathbf{x}) \equiv \| \mathbf{x} - \mathbf{a}_{i} \|_{2}$ . Then for any $i \in \{1, 2, \dots, m\}$

$$
\partial f_{i}(\mathbf{x}) = \left\{\begin{array}{ll} \omega_{i} \frac{\mathbf{x} - \mathbf{a}_{i}}{\| \mathbf{x} - \mathbf{a}_{i} \|_{2}}, & \mathbf{x} \neq \mathbf{a}_{i}, \\ B_{\| \cdot \|_{2}}[\mathbf{0}, \omega_{i}], & \mathbf{x} = \mathbf{a}_{i}, \end{array} \right.
$$

where here we used Theorems 3.35 (“multiplication by a positive scalar”), the Affine transformation rule of subdiferential calculus (Theorem 3.43(b)), and Example 3.34, in which the subdiferential set of the $l_{2}{\mathrm{- norm}}$ was computed. Obviously, $\textstyle f = \sum_{i = 1}^{m} f_{i}$ , and hence, by the sum rule of subdiferential calculus (Theorem $3.40^{21})$ , we obtain that

$$
\partial f(\mathbf{x}) = \sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{m} \omega_{i} \frac{\mathbf{x} - \mathbf{a}_{i}}{\| \mathbf{x} - \mathbf{a}_{i} \|_{2}}, & \mathbf{x} \notin \mathcal{A}, \\ \sum_{i = 1, i \neq j}^{m} \omega_{i} \frac{\mathbf{x} - \mathbf{a}_{i}}{\| \mathbf{x} - \mathbf{a}_{i} \|_{2}} + B[\mathbf{0}, \omega_{j}], & \mathbf{x} = \mathbf{a}_{j}(j = 1, 2, \ldots, m).\end{array} \right.
$$

Using Fermat’s optimality condition (Theorem 3.63), we can conclude that $\mathbf{x}^{*} \in \mathbb{R}^{d}$ is an optimal solution of problem (FW) if and only if either

$$
\mathbf{x}^{*} \notin \mathcal{A} \mathrm{and} \sum_{i = 1}^{m} \omega_{i} \frac{\mathbf{x}^{*} - \mathbf{a}_{i}}{\| \mathbf{x}^{*} - \mathbf{a}_{i} \|_{2}} = \mathbf{0}
$$

or for some $j \in \{1, 2, \dots, m\}$

$$
\mathbf{x}^{*} = \mathbf{a}_{j} \text{and} \left\| \sum_{i = 1, i \neq j}^{m} \omega_{i} \frac{\mathbf{x}^{*} - \mathbf{a}_{i}}{\| \mathbf{x}^{*} - \mathbf{a}_{i} \|_{2}} \right\|_{2} \leq \omega_{j}.\quad \blacksquare
$$

## 3.7.2 Convex Constrained Optimization

Consider the constrained optimization problem

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\},\tag{3.75}
$$

where $f$ is an extended real-valued convex function and $C \subseteq \mathbb{E}$ is a convex set. Using Fermat’s optimality condition (Theorem 3.63) and the convexity assumptions, it is easy to write a necessary and sufficient optimality condition for problem (3.75) in terms of the subdiferential set of f and the normal cone of C.

Theorem 3.67 (necessary and sufficient optimality conditions for convex constrained optimization). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper and convex function, and let $C \subseteq \mathbb{E}$ be a convex set for which $\operatorname{ri}(\operatorname{dom}(f)) \cap \operatorname{ri}(C) \neq \emptyset$ . Then $\mathbf{x}^{\ast} \in C$ is an optimal solution of (3.75) if and only if

$$
\text{there exists} \mathbf{g} \in \partial f(\mathbf{x}^{*}) \text{for which} - \mathbf{g} \in N_{C}(\mathbf{x}^{*}).\tag{3.76}
$$

Proof. Problem (3.75) can be rewritten as

$$
\min_{\mathbf{x} \in \mathbb{E}} f(\mathbf{x}) + \delta_{C}(\mathbf{x}).
$$

Since $\operatorname{ri}(\operatorname{dom}(f)) \cap \operatorname{ri}(C) \neq \emptyset$ , it follows by the sum rule of subdiferential calculus (Theorem 3.40) that for any $\mathbf{x} \in C$ ,

$$
\partial(f + \delta_{C})(\mathbf{x}) = \partial f(\mathbf{x}) + \partial \delta_{C}(\mathbf{x}).
$$

By Example 3.5, $\partial \delta_{C}({\bf x}) = N_{C}({\bf x})$ , and consequently for any $\mathbf{x} \in C$

$$
\partial(f + \delta_{C})(\mathbf{x}) = \partial f(\mathbf{x}) + N_{C}(\mathbf{x}).
$$

Therefore, invoking Fermat’s optimality condition (Theorem 3.63), $\mathbf{x}^{\ast} \in C$ is an optimal solution of (3.75) if and only if ${\mathbf 0} \in \partial f({\mathbf x}^{*}) + N_{C}({\mathbf x}^{*})$ , that is, if and only if

$$
(- \partial f(\mathbf{x}^{*})) \cap N_{C}(\mathbf{x}^{*}) \neq \emptyset,
$$

which is the same as condition (3.76).

Using the definition of the normal cone, we can write the optimality condition in a slightly more explicit manner.

Corollary 3.68 (necessary and sufficient optimality conditions for convex constrained optimization—second version). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper and convex function, and let C be a convex set satisfying $\operatorname{ri}(\operatorname{dom}(f)) \cap \operatorname{ri}(C) \neq \emptyset$ Then $\mathbf{x}^{\ast} \in C$ is an optimal solution of (3.75) if and only if

$$
\text{there exists} \mathbf{g} \in \partial f(\mathbf{x}^{*}) \text{for which} \langle \mathbf{g}, \mathbf{x} - \mathbf{x}^{*} \rangle \geq 0 \text{for any} \mathbf{x} \in C.\tag{3.77}
$$

Condition (3.77) is not particularly explicit. We will show in the next example how to write it in an explicit way for the case where $C = \Delta_{n}$

Example 3.69 (optimality conditions over the unit simplex). Suppose that the assumptions in Corollary 3.68 hold and that $C = \Delta_{n}, \mathbb{E} = \mathbb{R}^{n}$ . Given $\mathbf{x}^{*} \in \Delta_{n}$ we will show that the condition

$$
\left(\mathrm{I}\right) \mathbf{g}^{T}(\mathbf{x} - \mathbf{x}^{*}) \geq 0 \text{for all} \mathbf{x} \in \Delta_{n}
$$

is satisfied if and only if the following condition is satisfied:

$$
\text{(II) there exist} \mu \in \mathbb{R} \text{such that} g_{i} \left\{\begin{array}{ll} = \mu, & x_{i}^{*} > 0, \\ \geq \mu, & x_{i}^{*} = 0.\end{array} \right.
$$

Assume first that (II) is satisfied. Then for any $\mathbf{x} \in \Delta_{n}$ 2

$$
\begin{array}{l} \mathbf{g}^{T}(\mathbf{x} - \mathbf{x}^{*}) = \sum_{i = 1}^{n} g_{i}(x_{i} - x_{i}^{*}) \\ \qquad = \sum_{i: x_{i}^{*} > 0} g_{i}(x_{i} - x_{i}^{*}) + \sum_{i: x_{i}^{*} = 0} g_{i} x_{i} \\ \qquad \geq \sum_{i: x_{i}^{*} > 0} \mu(x_{i} - x_{i}^{*}) + \mu \sum_{i: x_{i}^{*} = 0} x_{i} \\ \qquad = \mu \sum_{i = 1}^{n} x_{i} - \mu \sum_{i: x_{i}^{*} > 0} x_{i}^{*} = \mu - \mu = 0, \end{array}
$$

proving that condition (I) is satisfied. To show the reverse direction, assume that (I) is satisfied. Let i and $j$ be two different indices for which $x_{i}^{*} > 0$ . Define the vector $\mathbf{x} \in \Delta_{n}$ as

$$
x_{k} = \left\{\begin{array}{ll} x_{k}^{*}, & k \notin \{i, j\}, \\ x_{i}^{*} - \frac{x_{i}^{*}}{2}, & k = i, \\ x_{j}^{*} + \frac{x_{i}^{*}}{2}, & k = j.\end{array} \right.
$$

The inequality $\mathbf{g}^{T}(\mathbf{x} - \mathbf{x}^{*}) \geq 0$ then amounts to

$$
- \frac{x_{i}^{*}}{2} g_{i} + \frac{x_{i}^{*}}{2} g_{j} \geq 0,
$$

which by the fact that $x_{i}^{*} > 0$ implies that

$$
g_{i} \leq g_{j}.\tag{3.78}
$$

In particular, for any two indices $i \neq j$ for which $x_{i}^{*}, x_{j}^{*} > 0$ , the two inequalities $g_{i} \ \leq \g_{j}$ and $g_{j} \ \leq \g_{i}$ hold, and hence $g_{i} ~ = ~ g_{j}$ . Therefore, all the components of g corresponding to positive components of $\mathbf{x}^{*}$ have the same value, which we will denote by $\mu.$ Let i be any index for which $x_{i}^{*} > 0$ . Then for any index $j$ for which $x_{j}^{*} = 0$ , the inequality (3.78) holds. Therefore, $g_{j} \geq \mu$ , and condition (II) is thus established.

We summarize the discussion in Example 3.69 with the following corollary.

Corollary 3.70 (necessary and sufficient optimality conditions for convex problems over the unit simplex). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper and convex function. Suppose that $\operatorname{ri}(\Delta_{n}) \cap \operatorname{ri}(\operatorname{dom}(f)) \neq \emptyset$ . Then $\mathbf{x}^{*} \in \Delta_{n}$ is an optimal solution of

$$
\min \{f(\mathbf{x}): \mathbf{x} \in \Delta_{n}\}
$$

if and only if there exists $\mathbf{g} \in \partial f(\mathbf{x}^{*})$ and $\mu \in \mathbb{R}$ for which

$$
g_{i} \left\{\begin{array}{ll} = \mu, & x_{i}^{*} > 0, \\ \geq \mu, & x_{i}^{*} = 0.\end{array} \right.
$$

The following example illustrates one instance in which the optimal solution of a convex problem over the unit simplex can be found using Corollary 3.70.

Example 3.71. Consider the problem

$$
\min_{\mathbf{x}} \left\{\sum_{i = 1}^{n} x_{i} \log x_{i} - \sum_{i = 1}^{n} y_{i} x_{i}: \mathbf{x} \in \Delta_{n} \right\},\tag{3.79}
$$

where $\mathbf{y} \in \mathbb{R}^{n}$ is a given vector. Problem (3.79) can be written as

$$
\min \{f(\mathbf{x}): \mathbf{x} \in \Delta_{n}\},
$$

where $f : \mathbb{R}^{n}(- \infty, \infty]$ is given by

$$
f(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} x_{i} \log x_{i} - \sum_{i = 1}^{n} y_{i} x_{i}, & \mathbf{x} \geq \mathbf{0}, \\ \infty & \text{else}.\end{array} \right.
$$

Let us assume that there exists an optimal solution<sup>22</sup> x<sup>∗</sup> satisfying $\mathbf{x^{*}} > \mathbf{0}$ . Then under this assumption, by Corollary 3.70 and the fact that $f$ is diferentiable at any positive vector, it follows that there exists $\mu \in \mathbb{R}$ such that for any i, $\begin{array}{r}{\frac{\partial f}{\partial x_{i}}(\mathbf{x}^{*}) = \grave{\mu}_{:}} \end{array}$ which is the same as log $x_{i}^{*} + 1 - y_{i} = \mu.$ . Therefore, for any $i,$ ,

$$
x_{i}^{*} = e^{\mu - 1 + y_{i}} = \alpha e^{y_{i}}, \quad i = 1, 2, \dots, n
$$

where $\alpha = e^{\mu - 1}$ . Since $\textstyle \sum_{i = 1}^{n} x_{i}^{*} = 1$ , it follows that $\begin{array}{r}{\alpha = \frac{1}{\sum_{j = 1}^{n} e^{y_{j}}}} \end{array}$ . Therefore,

$$
x_{i}^{*} = \frac{e^{y_{i}}}{\sum_{j = 1}^{n} e^{y_{j}}}, \quad i = 1, 2, \ldots, n.
$$

This is indeed an optimal solution of problem (3.79) since it satisfies the conditions of Corollary 3.70, which are (also) sufficient conditions for optimality.

## 3.7.3 The Nonconvex Composite Model

It is also possible to write a necessary optimality condition for nonconvex problems in terms of subgradients. We will write such a condition for problems consisting of minimizing a composite function $f + g.$ , where $f$ possesses some Differentiability properties but is not assumed to be convex while $g$ is convex but not assumed to have any special Differentiability properties.

Theorem 3.72 (optimality conditions for the composite problem). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper function, and let $g : \mathbb{E}(- \infty, \infty]$ be a proper convex function such that dom $(g) \subseteq \operatorname{int}(\operatorname{dom}(f))$ . Consider the problem

$$
\text{(P)} \quad \min_{\mathbf{x} \in \mathbb{E}} f(\mathbf{x}) + g(\mathbf{x}).
$$

(a) (necessary condition) $If \mathbf{x}^{*} \in \mathrm{dom}(g)$ is a local optimal solution of (P) and f is diferentiable at $\mathbf{x}^{*}$ , then

$$
- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*}).\tag{3.80}
$$

(b) (necessary and sufficient condition for convex problems) Suppose that f is convex. $Iff$ is diferentiable at $\mathbf{x}^{*} \in \mathrm{dom}(g)$ , then $\mathbf{x}^{*}$ is a global optimal solution of (P) if and only if (3.80) is satisfied.

Proof. (a) Let $\mathbf{y} \in \operatorname{dom}(g)$ . Then by the convexity of dom $(g)$ , for any $\lambda \in(0, 1)$ the point $\mathbf{x}_{\lambda} =(1 - \lambda) \mathbf{x}^{*} + \lambda \mathbf{y}$ is in dom $(g)$ , and by the local optimality of $\mathbf{x}^{*}$ , it follows that, for small enough λ,

$$
f(\mathbf{x}_{\lambda}) + g(\mathbf{x}_{\lambda}) \geq f(\mathbf{x}^{*}) + g(\mathbf{x}^{*}).
$$

That is,

$$
f((1 - \lambda) \mathbf{x}^{*} + \lambda \mathbf{y}) + g((1 - \lambda) \mathbf{x}^{*} + \lambda \mathbf{y}) \geq f(\mathbf{x}^{*}) + g(\mathbf{x}^{*}).
$$

Using the convexity of $g,$ , it follows that

$$
f((1 - \lambda) \mathbf{x}^{*} + \lambda \mathbf{y}) +(1 - \lambda) g(\mathbf{x}^{*}) + \lambda g(\mathbf{y}) \geq f(\mathbf{x}^{*}) + g(\mathbf{x}^{*}),
$$

which is the same as

$$
\frac{f((1 - \lambda) \mathbf{x}^{*} + \lambda \mathbf{y}) - f(\mathbf{x}^{*})}{\lambda} \geq g(\mathbf{x}^{*}) - g(\mathbf{y}).
$$

Taking $\lambda \to 0^{+}$ in the last inequality yields

$$
f^{\prime}(\mathbf{x}^{*}; \mathbf{y} - \mathbf{x}^{*}) \geq g(\mathbf{x}^{*}) - g(\mathbf{y}),
$$

where we used the fact that since $f$ is diferentiable at $\mathbf{x}^{*}$ , its directional derivatives exist. In fact, by Theorem 3.29, we have $f^{\prime}(\mathbf{x}^{*}; \mathbf{y} - \mathbf{x}^{*}) = \langle \nabla f(\mathbf{x}^{*}), \mathbf{y} - \mathbf{x}^{*} \rangle$ , and hence for any $\mathbf{y} \in \operatorname{dom}(g)$

$$
g(\mathbf{y}) \geq g \left(\mathbf{x}^{*}\right) + \langle - \nabla f \left(\mathbf{x}^{*}\right), \mathbf{y} - \mathbf{x}^{*} \rangle,
$$

showing that indeed $- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*})$

(b) Suppose in addition that $f$ is convex. If $\mathbf{x}^{*}$ is an optimal solution of $(\mathbb{P})$ then we already proved in part (a) that (3.80) is satisfied. Suppose now that (3.80) is satisfied. Then for any $\mathbf{y} \in \operatorname{dom}(g)$ 2

$$
g(\mathbf{y}) \geq g \left(\mathbf{x}^{*}\right) + \langle - \nabla f \left(\mathbf{x}^{*}\right), \mathbf{y} - \mathbf{x}^{*} \rangle.\tag{3.81}
$$

By the convexity of $f_{;}$ for any $\mathbf{y} \in \operatorname{dom}(g)$

$$
f(\mathbf{y}) \geq f \left(\mathbf{x}^{*}\right) + \langle \nabla f \left(\mathbf{x}^{*}\right), \mathbf{y} - \mathbf{x}^{*} \rangle.\tag{3.82}
$$

Adding (3.81) and (3.82), we obtain that

$$
f(\mathbf{y}) + g(\mathbf{y}) \geq f(\mathbf{x}^{*}) + g(\mathbf{x}^{*})
$$

for any $\mathbf{y} \in \operatorname{dom}(g)$ , meaning that $\mathbf{x}^{*}$ is an optimal solution of (P).

The condition (3.80) is an important optimality condition, and we will refer to it as the “stationarity” condition.

Definition 3.73 (stationarity). Let $f : \mathbb{E} \to(- \infty, \infty]$ be proper and let $g : \mathbb { E } $ $(- \infty, \infty]$ be a proper convex function such that dom $\operatorname{\rho}(g) \subseteq \operatorname{int}(\operatorname{dom}(f))$ . Consider the problem

$$
\text{(P)} \quad \min_{\mathbf{x} \in \mathbb{E}} f(\mathbf{x}) + g(\mathbf{x}).
$$

A point $\mathbf{x}^{*}$ in which f is diferentiable is called a stationary point $of \left(\mathbb{P} \right)$ if

$$
- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*}).
$$

Under the setting of Definition 3.73, $\mathbf{x}^{*}$ is also called a stationary point of the function $f + g$

We have shown in Theorem 3.72 that stationarity is a necessary local optimality condition for problem (P), and that if $f$ is convex, then stationarity is a necessary and sufficient global optimality condition. The case $g = \delta_{C}$ deserves a separate discussion.

Example 3.74 (convex constrained nonconvex programming). When $g =$ $\delta_{C}$ for a nonempty convex set $C \subseteq \mathbb{E}$ , problem (P) becomes

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\},
$$

which is a problem consisting of minimizing a (possibly) nonconvex function over a convex set. A point $\mathbf{x^{\ast}} \in C$ in which f is diferentiable is a stationary point of (P) if and only if

$$
- \nabla f(\mathbf{x}^{*}) \in \partial \delta_{C}(\mathbf{x}^{*}) = N_{C}(\mathbf{x}^{*}),\tag{3.83}
$$

where the equality is due to Example 3.5. By the definition of the normal cone, condition (3.83) can be rewritten as

$$
\langle - \nabla f(\mathbf{x}^{*}), \mathbf{x} - \mathbf{x}^{*} \rangle \leq 0 \text{for any} \mathbf{x} \in C,
$$

which is the same as

$$
\langle \nabla f(\mathbf{x}^{*}), \mathbf{x} - \mathbf{x}^{*} \rangle \geq 0 \mathrm{forany} \mathbf{x} \in C.
$$

Example 3.75. Consider the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} f(\mathbf{x}) + \lambda \| \mathbf{x} \|_{1},\tag{3.84}
$$

where $f : \mathbb{R}^{n}(- \infty, \infty]$ is an extended real-valued function. A point $\mathbf{x}^{*} \in$ int(dom(f )) in which f is diferentiable is a stationary point of (3.84) if

$$
- \nabla f(\mathbf{x}^{*}) \in \lambda \partial g(\mathbf{x}^{*}),
$$

where $g(\cdot) = \| \cdot \|_{1}$ . Using the expression for the subdiferential set of the $l_{1}$ -norm given in Example 3.41, we obtain that $\mathbf{x}^{*}$ is a stationary point of problem (3.84) if

and only if

$$
\frac{\partial f(\mathbf{x}^{*})}{\partial x_{i}} \left\{\begin{array}{ll} = - \lambda, & x_{i}^{*} > 0, \\ = \lambda, & x_{i}^{*} < 0, \\ \in[- \lambda, \lambda], & x_{i}^{*} = 0.\end{array} \right.\tag{3.85}
$$

By Theorem 3.72, condition (3.85) is a necessary condition for $\mathbf{x}^{*}$ to be a local minimum of problem (3.84). If f is also convex, then condition (3.85) is a necessary and sufficient condition for $\mathbf{x}^{*}$ to be a global optimal solution of problem (3.84).

## 3.7.4 The KKT Conditions

In this section we will show that the KKT conditions for constrained convex problems can be directly deduced by Fermat’s optimality condition. For that, we begin by establishing an equivalent reformulation of general inequality constrained problems.

Lemma 3.76. Let $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to \mathbb{R}$ be real-valued functions. Consider the problem

$$
\begin{array}{ll} \min & f(\mathbf{x}) \\ s.t.& g_{i}(\mathbf{x}) \leq 0, i = 1, 2, \ldots, m.\end{array}\tag{3.86}
$$

Assume that the minimum value of problem (3.86) is finite and equal to ${\bar{f}}.$ Define the function

$$
F(\mathbf{x}) \equiv \max \{f(\mathbf{x}) - \bar{f}, g_{1}(\mathbf{x}), g_{2}(\mathbf{x}), \ldots, g_{m}(\mathbf{x})\}.\tag{3.87}
$$

Then the optimal set of problem (3.86) is the same as the set of minimizers of $F$ .

Proof. Let $X^{*}$ be the optimal set of problem (3.86). To establish the result, we will show that $F$ satisfies the following two properties:

$$
\text{(i)} F(\mathbf{x}) > 0 \text{for any} \mathbf{x} \notin X^{*}.
$$

$$
\text{(ii)} F(\mathbf{x}) = 0 \text{for any} \mathbf{x} \in X^{*}.
$$

To prove property (i), let ${\textbf{x}} \notin X^{*}$ . There are two options. Either x is not feasible, meaning that $g_{i}(\mathbf{x}) > 0$ for some i, and hence by its definition $F(\mathbf{x}) > 0$ . If x is feasible but not optimal, then $g_{i}(\mathbf{x}) \leq 0$ for all $i = 1, 2, \dots, m$ and $f \left(\mathbf{x} \right) > \bar{f}$ , which also implies that $F(\mathbf{x}) > 0$ . To prove (ii), suppose that $\mathbf{x} \in X^{*}$ . Then $g_{i}(\mathbf{x}) \leq 0$ for all $i = 1, 2, \dots, m$ and $f(\mathbf{x}) ={\bar{f}}$ , implying that $F(\mathbf{x}) = 0$ 口

Using Lemma 3.76, we can conclude that problem (3.86) reduces to

$$
\min_{\mathbf{x} \in \mathbb{E}} F(\mathbf{x})\tag{3.88}
$$

in the sense that the optimal sets of the two problems are the same. Using this equivalence, we can now establish under additional convexity assumptions the wellknown Fritz-John optimality conditions for problem (3.86).

Theorem 3.77 (Fritz-John necessary optimality conditions). Consider the minimization problem

$$
\begin{array}{ll} \min & f(\mathbf{x}) \\ s.t.& g_{i}(\mathbf{x}) \leq 0, \quad i = 1, 2, \ldots, m, \end{array}\tag{3.89}
$$

where $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to \mathbb{R}$ are real-valued convex functions. Let $\mathbf{x}^{*}$ be an optimal solution of (3.89). Then there exist $\lambda_{0}, \lambda_{1}, \ldots, \lambda_{m} \geq 0$ , not all zeros, $for$ which

$$
\mathbf{0} \in \lambda_{0} \partial f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \lambda_{i} \partial g_{i}(\mathbf{x}^{*})\tag{3.90}
$$

$$
\lambda_{i} g_{i}(\mathbf{x}^{*}) = 0, \quad i = 1, 2, \ldots, m.\tag{3.91}
$$

Proof. Let $\mathbf{x}^{*}$ be an optimal solution of problem (3.89). Denote the optimal value of problem (3.89) by $\bar{f} = f(\mathbf{x}^{*})$ . Using Lemma 3.76, it follows that $\mathbf{x}^{*}$ is an optimal solution of the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) \equiv \max \{g_{0}(\mathbf{x}), g_{1}(\mathbf{x}), \ldots, g_{m}(\mathbf{x})\},
$$

where $g_{0}({\bf x}) \equiv f({\bf x}) - \bar{f}.$ . Obviously, $F(\mathbf{x}^{*}) = 0$ . Since $F$ is a maximum of convex functions, it is convex, and hence, using Fermat’s optimality condition (Theorem 3.63),

$$
\mathbf{0} \in \partial F(\mathbf{x}^{*}).\tag{3.92}
$$

By the max rule of subdiferential calculus (Theorem 3.50),

$$
\partial F(\mathbf{x}^{*}) = \mathrm{conv} \left(\left(\cup_{i \in I(\mathbf{x}^{*})} \partial g_{i}(\mathbf{x}^{*})\right), \right.\tag{3.93}
$$

where $I(\mathbf{x}^{*}) = \{i \in \{0, 1, \ldots, m\} : g_{i}(\mathbf{x}^{*}) = 0\}$ . Combining (3.92) and (3.93), we can deduce that there exists $\lambda_{i} \geq 0, i \in I(\mathbf{x}^{*})$ , such that $\begin{array}{r}{\sum_{i \in I({\bf x}^{*})} \lambda_{i} = 1} \end{array}$ for which

$$
\mathbf{0} \in \sum_{i \in I(\mathbf{x}^{*})} \lambda_{i} \partial g_{i}(\mathbf{x}^{*}).\tag{3.94}
$$

Since $g_{0}(\mathbf{x}^{*}) = f(\mathbf{x}^{*}) - \bar{f} = 0$ , it follows that $0 \in I(\mathbf{x}^{*})$ , and hence (3.94) can be rewritten as

$$
\mathbf{0} \in \lambda_{0} \partial f(\mathbf{x}^{*}) + \sum_{i \in I(\mathbf{x}^{*}) \setminus \{0\}} \lambda_{i} \partial g_{i}(\mathbf{x}^{*}).
$$

Defining $\lambda_{i} = 0$ for any $i \in \{1, 2,..., m\} \backslash I(\mathbf{x}^{*})$ , we conclude that conditions (3.90) and (3.91) are satisfied. Finally, not all the $\lambda_{i}^{\prime}$ s are zeros since $\begin{array}{r}{\sum_{i \in I({\bf x}^{*})} \lambda_{i} = 1} \end{array}$ □

We will now establish the KKT conditions, which are the same as the Fritz-John conditions, but with $\lambda_{0} = 1$ . The necessity of these conditions requires the following additional condition, which we refer to as Slater’s condition:

$$
\text{there exists} \bar{\mathbf{x}} \in \mathbb{E} \text{for which} g_{i}(\bar{\mathbf{x}}) < 0, \quad i = 1, 2, \ldots, m.\tag{3.95}
$$

The suficiency of the KKT conditions does not require any additional assumptions (besides convexity) and is actually easily derived without using the result on the Fritz-John conditions.

Theorem 3.78 (KKT conditions). Consider the minimization problem

$$
\begin{array}{ll} \min & f(\mathbf{x}) \\ s.t.& g_{i}(\mathbf{x}) \leq 0, \quad i = 1, 2, \ldots, m, \end{array}\tag{3.96}
$$

where $f, g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to \mathbb{R}$ are real-valued convex functions.

(a) Let $\mathbf{x}^{*}$ be an optimal solution of (3.96), and assume that Slater’s condition (3.95) is satisfied. Then there exist $\lambda_{1}, \ldots, \lambda_{m} \geq 0$ for which

$$
\mathbf{0} \in \partial f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \lambda_{i} \partial g_{i}(\mathbf{x}^{*})\tag{3.97}
$$

$$
\lambda_{i} g_{i}(\mathbf{x}^{*}) = 0, \quad i = 1, 2, \ldots, m.\tag{3.98}
$$

(b) If $\mathbf{x}^{*} \in \mathbb{E}$ satisfies conditions (3.97) and (3.98) for some $\lambda_{1}, \lambda_{2}, \ldots, \lambda_{m} \geq 0$ then it is an optimal solution of problem (3.96).

Proof. (a) By the Fritz-John conditions (Theorem 3.77) there exist $\tilde{\lambda}_{0}, \tilde{\lambda}_{1}, \ldots, \tilde{\lambda}_{m} \geq$ 0, not all zeros, for which

$$
\mathbf{0} \in \tilde{\lambda}_{0} \partial f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \tilde{\lambda}_{i} \partial g_{i}(\mathbf{x}^{*}),\tag{3.99}
$$

$$
\tilde{\lambda}_{i} g_{i}(\mathbf{x}^{*}) = 0, \quad i = 1, 2, \ldots, m.\tag{3.100}
$$

We will show that $\tilde{\lambda}_{0} \neq 0$ . Assume by contradiction that $\tilde{\lambda}_{0} = 0$ . Then, by (3.99),

$$
\mathbf{0} \in \sum_{i = 1}^{m} \tilde{\lambda}_{i} \partial g_{i}(\mathbf{x}^{*});
$$

that is, there exist $\pmb{\xi}_{i} \in \partial g_{i}(\mathbf{x}^{*}), i = 1, 2,..., m$ , such that

$$
\sum_{i = 1}^{m} \tilde{\lambda}_{i} \boldsymbol{\xi}_{i} = \mathbf{0}.\tag{3.101}
$$

Let $\bar{\bf x}$ be a point satisfying Slater’s condition (3.95). By the subgradient inequality employed on the pair of points $\bar{\mathbf{x}}, \mathbf{x}^{*}$ w.r.t. the functions $g_{i}, i = 1, 2, \ldots, m$ , we have

$$
g_{i}(\mathbf{x}^{*}) + \langle \pmb{\xi}_{i}, \bar{\mathbf{x}} - \mathbf{x}^{*} \rangle \leq g_{i}(\bar{\mathbf{x}}), \quad i = 1, 2, \dots, m.
$$

Multiplying the ith inequality by $\tilde{\lambda}_{i} \geq 0$ and summing over $i = 1, 2, \dots, m$ yields

$$
\sum_{i = 1}^{m} \tilde{\lambda}_{i} g_{i}(\mathbf{x}^{*}) + \left\langle \sum_{i = 1}^{m} \tilde{\lambda}_{i} \boldsymbol{\xi}_{i}, \bar{\mathbf{x}} - \mathbf{x}^{*} \right\rangle \leq \sum_{i = 1}^{m} \tilde{\lambda}_{i} g_{i}(\bar{\mathbf{x}}), \quad i = 1, 2, \dots, m.
$$

Using (3.100) and (3.101), we obtain the inequality $\begin{array}{r}{\sum_{i = 1}^{m} \tilde{\lambda}_{i} g_{i}(\bar{\bf x}) \ge 0} \end{array}$ , which is impossible since $\tilde{\lambda}_{i} \geq 0$ and $g_{i}(\bar{\bf x}) < 0$ for any $i,$ and not all the $\ddot{\lambda}_{i} \mathrm{' s}$ are zeros. Therefore, $\tilde{\lambda}_{0} > 0$ , and we can thus divide both the relation (3.99) and the equalities (3.100) by $\tilde{\lambda}_{0}$ to obtain that (3.97) and (3.98) are satisfied with $\begin{array}{r}{\lambda_{i} ~ = ~ \frac{\tilde{\lambda}_{i}}{\tilde{\lambda}_{0}}, i =} \end{array}$ $1, 2, \ldots, m$

(b) Suppose then that $\mathbf{x}^{*}$ satisfies (3.97) and (3.98) for some nonnegative numbers $\lambda_{1}, \lambda_{2}, \ldots, \lambda_{m}$ . Let $\hat{\textbf{x}} \in \ \mathbb{E}$ be a feasible point of (3.96), meaning that $g_{i}(\hat{\mathbf{x}}) \leq 0, i = 1, 2, \ldots, m$ . We will show that $f(\hat{\mathbf{x}}) \geq f(\mathbf{x}^{*})$ . Define the function

$$
h(\mathbf{x}) = f(\mathbf{x}) + \sum_{i = 1}^{m} \lambda_{i} g_{i}(\mathbf{x}).
$$

The function $h$ is convex, and the condition (3.97) along with the sum rule of subdiferential calculus (Theorem 3.40) yields the relation

$$
\mathbf{0} \in \partial h(\mathbf{x}^{*}),
$$

which by Fermat’s optimality condition (Theorem 3.63) implies that $\mathbf{x}^{*}$ is a minimizer of h over <sup>E</sup>. Combining this fact with (3.98) implies that

$$
f(\mathbf{x}^{*}) = f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \lambda_{i} g_{i}(\mathbf{x}^{*}) = h(\mathbf{x}^{*}) \leq h(\hat{\mathbf{x}}) = f(\hat{\mathbf{x}}) + \sum_{i = 1}^{m} \lambda_{i} g_{i}(\hat{\mathbf{x}}) \leq f(\hat{\mathbf{x}}),
$$

where the last inequality follows from the facts that $\lambda_{i} \geq 0$ and $g_{i}(\hat{\mathbf{x}}) ~ \leq ~ 0$ for $i = 1, 2, \dots, m$ . We have thus proven that $\mathbf{x}^{*}$ is an optimal solution of (3.96).

## 3.8 Summary of Weak and Strong Subgradient Calculus Results

This section contains a summary of most of the rules and results concerning the computation of subdiferential sets (strong results), as well as rules for computing specific subgradients in the subdiferential sets (weak results). Before that, we begin by summarizing the rules of subdiferential calculus.

- Multiplication by a positive scalar

$$
\partial(\alpha f)(\mathbf{x}) = \alpha \partial f(\mathbf{x}).
$$

Assumptions: $f : \mathbb{E} \to(- \infty, \infty]$ proper, $\alpha > 0, \mathbf{x} \in \operatorname{dom}(f)$ . [Theorem 3.35]

- Differentiability

f is diferentiable at x if and only if $\partial f(\mathbf{x})$ is a singleton, and in that case

$$
\partial f(\mathbf{x}) = \{\nabla f(\mathbf{x})\}.
$$

Assumptions: $f : \mathbb{E} \to(- \infty, \infty]$ proper convex, $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ . [Theorem 3.33]

- Weak sum rule of subdiferential calculus

$$
\sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}) \subseteq \partial(\sum_{i = 1}^{m} f_{i})(\mathbf{x}).
$$

Assumptions: $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ proper convex. [Corollary 3.38(a)]

- Sum rule of subdiferential calculus

$$
\partial(\sum_{i = 1}^{m} f_{i})(\mathbf{x}) = \sum_{i = 1}^{m} \partial f_{i}(\mathbf{x}).
$$

Assumptions: $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ proper convex, $\cap_{i = 1}^{m} \operatorname{ri}(\operatorname{dom}(f_{i})) \neq \emptyset$ . [Theorem 3.40]

- Weak Affine transformation rule of subdiferential calculus

$$
\mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})) \subseteq \partial h(\mathbf{x}) \quad(h(\mathbf{x}) \equiv f(\mathcal{A}(\mathbf{x}) + \mathbf{b})).
$$

Assumptions: $f, h : \mathbb{E}(- \infty, \infty]$ proper convex, $\mathbf{x} \in \mathrm{dom}(h)$ . [Theorem 3.43(a)]

- Affine transformation rule of subdiferential calculus

$$
\partial h(\mathbf{x}) = \mathcal{A}^{T}(\partial f(\mathcal{A}(\mathbf{x}) + \mathbf{b})) \quad(h(\mathbf{x}) \equiv f(\mathcal{A}(\mathbf{x}) + \mathbf{b})).
$$

Assumptions: $f, h : \mathbb{E}(- \infty, \infty]$ proper convex, $\mathbf{x} \in \mathrm{int}(\mathrm{dom}(h)), A(\mathbf{x}) + \mathbf{b} \in \mathrm{int}(\mathrm{dom}(f))$ [Theorem 3.43(b)]

- Chain rule of subdiferential calculus

$$
\partial h(\mathbf{x}) = g^{\prime}(f(\mathbf{x})) \partial f(\mathbf{x}) \quad(h = g \circ f).
$$

Assumptions: $f : \mathbb{E} \to \mathbb{R}$ convex, $g : \mathbb { R } $ <sup>R</sup> nondecreasing, diferentiable and convex. [Theorem 3.47]

- Max rule of subdiferential calculus

$$
\partial(\max(f_{1}, f_{2}, \dots, f_{m}))(\mathbf{x}) = \operatorname{conv} \left(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})\right),
$$

where

$$
I(\mathbf{x}) = \{i: f_{i}(\mathbf{x}) = \max \{f_{1}(\mathbf{x}), f_{2}(\mathbf{x}), \dots, f_{m}(\mathbf{x})\}\}.
$$

Assumptions: $f_{1}, f_{2}, \ldots, f_{m}$ proper, convex, $\mathbf{x} \in \cap_{i = 1}^{m} \operatorname{int}(\operatorname{dom}(f_{i}))$ . [Theorem 3.50]

<sup>=1</sup>• Weak max rule of subdiferential calculus

$$
\operatorname{conv} \left(\cup_{i \in I(\mathbf{x})} \partial f_{i}(\mathbf{x})\right) \subseteq \partial(\max_{i \in I} f_{i})(\mathbf{x}),
$$

where

$$
I(\mathbf{x}) = \{i \in I: f_{i}(\mathbf{x}) = \max_{i \in I} f_{i}(\mathbf{x})\}.
$$

Assumptions: $I = \mathrm{arbitrary}$ index set. $f_{i} ~ : ~ \mathbb{E} \ \to \(- \infty, \infty] \(i ~ \in ~ I)$ proper, convex, $\textbf{x} \in$ $\cap_{i \in I}{\mathrm{do}{\bar{\operatorname{m}}}}(f_{i})$ . [Theorem 3.55]

The table below contains the main examples from the chapter related to weak results of subgradients computations.

<table><tr><td>Function</td><td>Weak result</td><td>Setting</td><td>Reference</td></tr><tr><td>-q = negative dual function</td><td> $-\mathbf{g}(\mathbf{x}_0) \in \partial(-q)(\boldsymbol{\lambda}_0)$ </td><td> $q(\boldsymbol{\lambda}) = \min_{\mathbf{x} \in X} f(\mathbf{x}) + \boldsymbol{\lambda}^T \mathbf{g}(\mathbf{x}), f: \mathbb{E} \to \mathbb{R}, \mathbf{g}: \mathbb{E} \to \mathbb{R}^m, \mathbf{x}_0 = \text{a minimizer of} f(\mathbf{x}) + \boldsymbol{\lambda}_0^T \mathbf{g}(\mathbf{x}) \text{over} X$ </td><td>Example 3.7</td></tr><tr><td> $f(\mathbf{X}) = \lambda_{\max}(\mathbf{X})$ </td><td> $\mathbf{v}\mathbf{v}^T \in \partial f(\mathbf{X})$ </td><td> $f: \mathbb{S}^n \to \mathbb{R}, \mathbf{v} = \text{normalized maximum eigenvector of} X \in \mathbb{S}^n$ </td><td>Example 3.8</td></tr><tr><td> $f(\mathbf{x}) = \| \mathbf{x} \|_1$ </td><td> $\text{sgn}(\mathbf{x}) \in \partial f(\mathbf{x})$ </td><td> $\mathbb{E} = \mathbb{R}^n$ </td><td>Example 3.42</td></tr><tr><td> $f(\mathbf{x}) = \lambda_{\max}(\mathbf{A}_0 + \sum_{i=1}^mx_i \mathbf{A}_i)$ </td><td> $(\tilde{\mathbf{y}}^T \mathbf{A}_i \tilde{\mathbf{y}})^m_{i=1} \in \partial f(\mathbf{x})$ </td><td> $\tilde{\mathbf{y}} = \text{normalized maximum eigenvector of} \mathbf{A}_0 + \sum_{i=1}^mx_i \mathbf{A}_i$ </td><td>Example 3.56</td></tr></table>

The following table contains the main strong results of subdiferential sets computations derived in this chapter.

<table><tr><td>f(x)</td><td>∂f(x)</td><td>Assumptions</td><td>Reference</td></tr><tr><td>||x||</td><td> $B_{\parallel \cdot \|_{*}}[0,1]$ </td><td>x = 0</td><td>Example 3.3</td></tr><tr><td>||x||1</td><td> $\left\{\sum_{i\in I_{\neq}(\mathbf{x})}\text{sgn}(x_i)\mathbf{e}_i + \sum_{i\in I_0(\mathbf{x})}[-\mathbf{e}_i,\mathbf{e}_i]\right\}$ </td><td> $\mathbb{E} = \mathbb{R}^n, I_{\neq}(\mathbf{x}) = \{i : x_i \neq 0\}, I_0(\mathbf{x}) = \{i : x_i = 0\}.$ </td><td>Example 3.41</td></tr><tr><td>||x||2</td><td> $\left\{\frac{\mathbf{x}}{\|\mathbf{x}\|_2}, \quad \mathbf{x} \neq \mathbf{0}, B_{\parallel \cdot \|_2}[0,1], \quad \mathbf{x} = \mathbf{0}.\right.$ </td><td> $\mathbb{E} = \mathbb{R}^n$ </td><td>Example 3.34</td></tr><tr><td>||x||∞</td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_i\text{sgn}(x_i)\mathbf{e}_i: \sum_{i\in I(\mathbf{x})} \lambda_i=1 \atop \lambda_i \geq 0\right\}$ </td><td> $\mathbb{E} = \mathbb{R}^n, I(\mathbf{x}) = \{i : \| \mathbf{x}\|_\infty = |x_i|\}, \mathbf{x} \neq \mathbf{0}$ </td><td>Example 3.52</td></tr><tr><td>max(x)</td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_i\mathbf{e}_i: \sum_{i\in I(\mathbf{x})} \lambda_i=1, \lambda_i \geq 0\right\}$ </td><td> $\mathbb{E} = \mathbb{R}^n, I(\mathbf{x}) = \{i : \max(\mathbf{x}) = x_i\}$ </td><td>Example 3.51</td></tr><tr><td>max(x)</td><td> $\Delta_n$ </td><td> $\mathbb{E} = \mathbb{R}^n, \mathbf{x} = \alpha \mathbf{e}$  for some  $\alpha \in \mathbb{R}$ </td><td>Example 3.51</td></tr><tr><td> $\delta_S(\mathbf{x})$ </td><td> $N_S(\mathbf{x})$ </td><td> $\emptyset \neq S \subseteq \mathbb{E}$ </td><td>Example 3.5</td></tr><tr><td> $\delta_B[\mathbf{0},1](\mathbf{x})$ </td><td> $\left\{\begin{array}{ll}\{\mathbf{y} \in \mathbb{E}^{*}: \| \mathbf{y}\|_{*} \leq \langle \mathbf{y}, \mathbf{x} \rangle\}, & \| \mathbf{x}\| \leq 1, \\ \emptyset, & \| \mathbf{x}\| > 1.\end{array}\right.$ </td><td></td><td>Example 3.6</td></tr><tr><td>||Ax+b||1</td><td> $\sum_{i\in I_{\neq}(\mathbf{x})}\text{sgn}(\mathbf{a}_i^T\mathbf{x}+b_i)\mathbf{a}_i + \sum_{i\in I_0(\mathbf{x})}[-\mathbf{a}_i,\mathbf{a}_i]$ </td><td> $\mathbb{E} = \mathbb{R}^n, \mathbf{A} \in \mathbb{R}^{m\times n}, \mathbf{b} \in \mathbb{R}^m, I_{\neq}(\mathbf{x}) = \{i : \mathbf{a}_i^T\mathbf{x} + b_i \neq 0\}, I_0(\mathbf{x}) = \{i : \mathbf{a}_i^T\mathbf{x} + b_i = 0\}$ </td><td>Example 3.44</td></tr><tr><td>||Ax+b||2</td><td> $\left\{\begin{array}{ll}\frac{\mathbf{A}^T(\mathbf{A}\mathbf{x}+\mathbf{b})}{\|\mathbf{A}\mathbf{x}+\mathbf{b}\|_2}, & \mathbf{A}\mathbf{x}+\mathbf{b} \neq \mathbf{0}, \\ \mathbf{A}^TB_{\parallel \cdot \|_2}[0,1], & \mathbf{A}\mathbf{x}+\mathbf{b} = \mathbf{0}.\end{array}\right.$ </td><td> $\mathbb{E} = \mathbb{R}^n, \mathbf{A} \in \mathbb{R}^{m\times n}, \mathbf{b} \in \mathbb{R}^m$ </td><td>Example 3.45</td></tr><tr><td>||Ax+b||∞</td><td> $\left\{\sum_{i\in I_{\mathbf{x}}}\lambda_i\text{sgn}(\mathbf{a}_i^T\mathbf{x}+b_i)\mathbf{a}_i: \sum_{i\in I_{\mathbf{x}}}\lambda_i=1 \atop \lambda_i \geq 0\right\}$ </td><td> $\mathbb{E} = \mathbb{R}^n, \mathbf{A} \in \mathbb{R}^{m\times n}, \mathbf{b} \in \mathbb{R}^m, I_{\mathbf{x}} = \{i : \| \mathbf{A}\mathbf{x} + \mathbf{b}\|_\infty = |\mathbf{a}_i^T\mathbf{x} + b_i|\}, \mathbf{A}\mathbf{x}+\mathbf{b} \neq \mathbf{0}$ </td><td>Example 3.54</td></tr><tr><td>||Ax+b||∞</td><td> $\mathbf{A}^TB_{\parallel \cdot \|_1}[0,1]$ </td><td>same as above but with  $\mathbf{A}\mathbf{x}+\mathbf{b} = \mathbf{0}$ </td><td>Example 3.54</td></tr><tr><td> $\max_i\{\mathbf{a}_i^Tx+\mathbf{b}\}$ </td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_i\mathbf{a}_i: \sum_{i\in I(\mathbf{x})}\lambda_i=1, \lambda_i \geq 0\right\}$ </td><td> $\mathbb{E} = \mathbb{R}^n, \mathbf{a}_i \in \mathbb{R}^n, b_i \in \mathbb{R}, I(\mathbf{x}) = \{i : f(\mathbf{x}) = \mathbf{a}_i^Tx + b_i\}$ </td><td>Example 3.53</td></tr><tr><td> $\frac{1}{2}d_C^2(\mathbf{x})$ </td><td> $\{\mathbf{x}-P_C(\mathbf{x})\}$ </td><td>C = nonempty closed and convex, E = Euclidean</td><td>Example 3.31</td></tr><tr><td> $d_C(\mathbf{x})$ </td><td> $\left\{\begin{array}{l}\frac{\mathbf{x}-P_C(\mathbf{x})}{d_C(\mathbf{x})}, \quad \mathbf{x} \notin C, \\N_C(\mathbf{x}) \cap B[\mathbf{0},1] \quad \mathbf{x} \in C.\end{array}\right.$ </td><td>C = nonempty closed and convex, E = Euclidean</td><td>Example 3.49</td></tr></table>


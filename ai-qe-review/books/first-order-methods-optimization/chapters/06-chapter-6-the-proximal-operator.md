---
title: "Chapter 6 \u2014 The Proximal Operator"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 6
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 5962
source_line_end: 8108
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 5
source_empty_image_alt: 5
non_semantic_image_alt: 1
caption_derived_image_alt: 4
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 6 — The Proximal Operator

> [[../README|本书目录]] · [[05-chapter-5-smoothness-and-strong-convexity|上一章]] · [[07-chapter-7-spectral-functions|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 5962–8108。
> - 本章保留 5 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：Affine × 4；Differentiability × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 6 The Proximal Operator

Underlying Space: In this chapter <sup>E</sup> is a Euclidean space, meaning a finite dimensional space endowed with an inner product $\langle \cdot, \cdot \rangle$ and the Euclidean norm $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle}$

This chapter is devoted to the study of the proximal mapping, which will be fundamental in many of the algorithms that will be explored later in the book. The operator and its properties were first studied by Moreau, and hence it is also referred to as “Moreau’s proximal mapping.”

## 6.1 Definition, Existence, and Uniqueness

Definition 6.1 (proximal mapping). Given a function $f : \mathbb{E} \to(- \infty, \infty]$ , the proximal mapping of f is the operator given by

$$
\operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} forany \mathbf{x} \in \mathbb{E}.
$$

We will often use the term “prox” instead of “proximal.” The mapping prox<sub>f</sub> takes a vector $\textbf{x} \in \ \mathbb{E}$ and maps it into a subset of <sup>E</sup>, which might be empty, a singleton, or a set with multiple vectors as the following example illustrates.

Example 6.2. Consider the following three functions from <sup>R</sup> to <sup>R</sup>:

$$
\begin{array}{l} g_{1}(x) \equiv 0, \\ g_{2}(x) = \left\{\begin{array}{ll} 0, & x \neq 0, \\ - \lambda, & x = 0, \end{array} \right.\end{array}
$$

$$
g_{3}(x) = \left\{\begin{array}{ll} 0, & x \neq 0, \\ \lambda, & x = 0, \end{array} \right.
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/918ddea2de07fa94582fa557ab3e26f8869e8937d798e979464456849dbdb22e.jpg)

![Figure 6.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/15275952d27bc7946eeed96609a0a991f6c68cded42aa33c15ba5b8e8fafde39.jpg)  
Figure 6.1. The left and right images are the plots of the functions $g_{2}$ and $g_{3},$ respectively, with $\lambda = 0.5$ from Example 6.2.

where $\lambda > 0$ is a given constant. The plots of the noncontinuous functions $g_{2}$ and g<sub>3</sub> are given in Figure 6.1. The prox of $g_{1}$ can computed as follows:

$$
\operatorname{prox}_{g_{1}}(x) = \operatorname{argmin}_{u \in \mathbb{R}} \left\{g_{1}(u) + \frac{1}{2}(u - x)^{2} \right\} = \operatorname{argmin}_{u \in \mathbb{R}} \left\{\frac{1}{2}(u - x)^{2} \right\} = \{x\}.
$$

To compute the prox of $g_{2}$ , note that $\begin{array}{r}{\operatorname{prox}_{g_{2}}(x) = \operatorname{argmin}_{u \in \mathbb{R}} \tilde{g}_{2}(u, x)} \end{array}$ , where

$$
\tilde{g}_{2}(u, x) \equiv g_{2}(u) + \frac{1}{2}(u - x)^{2} = \left\{\begin{array}{ll} - \lambda + \frac{x^{2}}{2}, & u = 0, \\ \frac{1}{2}(u - x)^{2}, & u \neq 0.\end{array} \right.
$$

For $x \neq 0$ , the minimum of ${\scriptstyle{\frac{1}{2}}}(u - x)^{2}$ over $\mathbb{R} \backslash \{0\}$ is attained at $u = x(\neq 0)$ with a minimal value of 0. Therefore, in this case, if $\textstyle 0 > - \lambda +{\frac{x^{2}}{2}}$ , then the unique minimizer of $\tilde{g}_{2}(\cdot, x)$ is $u = 0$ , and if $\textstyle 0 < - \lambda +{\frac{x^{2}}{2}}$ , then $u \ = \x$ is the unique minimizer of $\tilde{g}_{2}(\cdot, x)$ ; finally, if $\textstyle{0 = - \lambda +{\frac{x^{2}}{2}}}$ , then 0 and x are the two minimizers $\tilde{g}_{2}(\cdot, x)$ . When $x = 0$ , the minimizer of $\tilde{g}_{2}(\bar{\cdot,} 0)$ is $u = 0$ . To conclude,

$$
\operatorname{prox}_{g_{2}}(x) = \left\{\begin{array}{ll} \{0\}, & | x | < \sqrt{2 \lambda}, \\ \{x\}, & | x | > \sqrt{2 \lambda}, \\ \{0, x\}, & | x | = \sqrt{2 \lambda}.\end{array} \right.
$$

Similar arguments show that

$$
\operatorname{prox}_{g_{3}}(x) = \left\{\begin{array}{ll} \{x\}, & x \neq 0, \\ \emptyset, & x = 0.\end{array} \right.
$$

The next theorem, called the first prox theorem, states that if $f$ is proper closed and convex, then $\mathrm{prox}_{f}(\mathbf{x})$ is always a singleton, meaning that the prox exists and is unique. This is the reason why in the last example only $g_{1}$ , which was proper closed and convex, had a unique prox at any point.

Theorem 6.3 (first prox theorem). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function. Then $\mathrm{prox}_{f}(\mathbf{x})$ is a singleton for any $\mathbf{x} \in \mathbb{E}$

Proof. For any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \tilde{f}(\mathbf{u}, \mathbf{x}),\tag{6.1}
$$

where $\begin{array}{r}{\widetilde{f}(\mathbf{u}, \mathbf{x}) \equiv f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2}} \end{array}$ . The function $\tilde{f}(\cdot, \mathbf{x})$ is a closed and strongly convex function as a sum of the closed and strongly convex function $\textstyle{\frac{1}{2}} \| \cdot - \mathbf{x} \|^{2}$ and the closed and convex function $f$ (see Lemma 5.20 and Theorem $2.7 \mathrm{\tilde{(b))}}$ . The properness of $\tilde{f}(\cdot, \mathbf{x})$ immediately follows from the properness of $f.$ Therefore, by Theorem 5.25(a), there exists a unique minimizer to the problem in (6.1).

When $f$ is proper closed and convex, the last result shows that prox ${\bf \nabla}_{f}({\bf x})$ is a singleton for any $\mathbf{x} \in \mathbb{E}$ . In these cases, which will constitute the vast majority of cases that will be discussed in this chapter, we will treat prox as a singlevalued mapping from $\mathbb{E}$ to $\mathbb{E}$ , meaning that we will write prox $ \mathbf { \sigma } _ { f } ( \mathbf { x } ) \mathbf { \bar { \sigma } } = \mathbf { y }$ and not $\mathrm{prox}_{f}(\mathbf{x}) = \{\mathbf{y}\}$

If we relax the assumptions in the first prox theorem and only require closedness of the function, then it is possible to show under some coerciveness assumptions that $\mathrm{prox}_{f}(\mathbf{x})$ is never an empty set.

Theorem 6.4 (nonemptiness of the prox under closedness and coerciveness). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper closed function, and assume that the following condition is satisfied:

$$
\text{the function} \mathbf{u} \mapsto f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \text{is coercive for any} \mathbf{x} \in \mathbb{E}.\tag{6.2}
$$

Then $\mathrm{prox}_{f}(\mathbf{x})$ is nonempty for any $\mathbf{x} \in \mathbb{E}$

Proof. For any $\mathbf{x} \in \mathbb{E}$ , the proper function $\begin{array}{r}{h(\mathbf{u}) \equiv f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2}} \end{array}$ is closed as a sum of two closed functions. Since by the premise of the theorem it is also coercive, it follows by Theorem 2.14 (with $S = \mathbb{E})$ that $\mathrm{prox}_{f}(\mathbf{x})$ , which consists of the minimizers of $h,$ , is nonempty.

Example 6.2 actually gave an illustration of Theorem 6.4 since although both $g_{2}$ and $g_{3}$ satisfy the coercivity assumption (6.2), only $g_{2}$ was closed, and thus the fact that $\operatorname{prox}_{g_{3}}(x)$ was empty for a certain value of $x,$ as opposed to $\operatorname{prox}_{g_{2}}(x)$ <sup>3</sup>which was never empty, is not surprising.

## 6.2 First Set of Examples of Proximal Mappings

Equipped just with the definition of the proximal mapping, we will now compute the proximal mapping of several proper closed and convex functions.

## 6.2.1 Constant

If $f \equiv c$ for some $c \in \mathbb{R}$ , then

$$
\operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{c + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} = \mathbf{x}.
$$

Therefore,

$$
\operatorname{prox}_{f}(\mathbf{x}) = \mathbf{x}
$$

is the identity mapping.

## 6.2.2 Affine

Let $f(\mathbf{x}) = \left.\mathbf{a}, \mathbf{x} \right.+ b.$ , where $\mathbf{a} \in \mathbb{E}$ and $b \in \mathbb{R}$ . Then

$$
\begin{array}{rl} &{\mathrm{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{\langle \mathbf{a}, \mathbf{u} \rangle + b + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}} \\ &{\qquad = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{\langle \mathbf{a}, \mathbf{x} \rangle + b - \frac{1}{2} \| \mathbf{a} \|^{2} + \frac{1}{2} \| \mathbf{u} -(\mathbf{x} - \mathbf{a}) \|^{2} \right\}} \\ &{\qquad = \mathbf{x} - \mathbf{a}.} \end{array}
$$

Therefore,

$$
\operatorname{prox}_{f}(\mathbf{x}) = \mathbf{x} - \mathbf{a}
$$

is a translation mapping.

## 6.2.3 Convex Quadratic

Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $\begin{array}{r}{f(\mathbf{x}) = \frac{1}{2} \mathbf{x}^{T} \mathbf{A} \mathbf{x} + \mathbf{b}^{T} \mathbf{x} + c.} \end{array}$ , where $\mathbf{A} \in \mathbb{S}_{+}^{n}, \mathbf{b} \in \mathbb{R}^{n}$ , and $c \in \mathbb{R}$ . The vector prox ${\bf \nabla}_{f}({\bf x})$ is the minimizer of the problem

$$
\min_{\mathbf{u} \in \mathbb{E}} \left\{\frac{1}{2} \mathbf{u}^{T} \mathbf{Au} + \mathbf{b}^{T} \mathbf{u} + c + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.
$$

The optimal solution of the last problem is attained when the gradient of the objective function vanishes:

$$
\mathbf{A} \mathbf{u} + \mathbf{b} + \mathbf{u} - \mathbf{x} = \mathbf{0},
$$

that is, when

$$
(\mathbf{A} + \mathbf{I}) \mathbf{u} = \mathbf{x} - \mathbf{b},
$$

and hence

$$
\operatorname{prox}_{f}(\mathbf{x}) =(\mathbf{A} + \mathbf{I})^{- 1}(\mathbf{x} - \mathbf{b}).
$$

## 6.2.4 One-Dimensional Examples

The following lemma contains several prox computations of one-dimensional functions.

Lemma 6.5. The following are pairs of proper closed and convex functions and their prox mappings:

$$
\begin{array}{ll} g_{1}(x) = \left\{\begin{array}{ll} \mu x, & x \geq 0, \\ \infty, & x < 0, \end{array} \right.& \operatorname{prox}_{g_{1}}(x) =[x - \mu]_{+}, \\ g_{2}(x) = \lambda | x |, & \operatorname{prox}_{g_{2}}(x) =[| x | - \lambda]_{+} \mathrm{sgn}(x), \\ g_{3}(x) = \left\{\begin{array}{ll} \lambda x^{3}, & x \geq 0, \\ \infty, & x < 0, \end{array} \right.& \operatorname{prox}_{g_{3}}(x) = \frac{- 1 + \sqrt{1 + 12 \lambda[x]_{+}}}{6 \lambda}, \\ g_{4}(x) = \left\{\begin{array}{ll} - \lambda \log x, & x > 0, \\ \infty, & x \leq 0, \end{array} \right.& \operatorname{prox}_{g_{4}}(x) = \frac{x + \sqrt{x^{2} + 4 \lambda}}{2}, \\ g_{5}(x) = \delta_{[0, \eta] \cap \mathbb{R}}(x), & \operatorname{prox}_{g_{5}}(x) = \min \{\max \{x, 0\}, \eta\}, \end{array}
$$

where $\lambda \in \mathbb{R}_{+}, \eta \in[0, \infty]$ , and $\mu \in \mathbb{R}$

Proof. The proofs repeatedly use the following trivial arguments: (i) if $f^{\prime}(u) = 0$ for a convex function $f_{;}$ then u must be one of its minimizers; (ii) if a minimizer of a convex function exists and is not attained at any point of Differentiability, then it must be attained at a point of nondiferentiability.

[prox of $g_{1} \big]$ By definition, prox<sub>g</sub> (x) is the minimizer of the function

$$
f(u) = \left\{\begin{array}{ll} \infty, & u < 0, \\ f_{1}(u), & u \geq 0, \end{array} \right.
$$

where $\begin{array}{r}{f_{1}(u) = \mu u + \frac{1}{2}(u - x)^{2}} \end{array}$ . First note that $f_{1}^{\prime}(u) = 0$ if and only if $u = x - \mu$ . If $x > \mu,$ , then $f^{\prime}(x - \mu) \bar{} = f_{1}^{\prime}(x - \mu) = 0$ , implying that in this case $\mathrm{prox}_{q_{1}}(x) = x - \mu$ Otherwise, if $x \leq \mu$ , the minimizer of $f$ <sup>1</sup>is not attained at a point of Differentiability, meaning that it has to be attained at 0, which is the only point of nondiferentiability in the domain of $f,$ so that $\mathrm{prox}_{g_{1}}(x) = 0$

[prox of g<sub>2</sub>] $\operatorname{prox}_{g_{2}}(x)$ <sup>1</sup> is the minimizer of the function

$$
h(u) = \left\{\begin{array}{ll} h_{1}(u) \equiv \lambda u + \frac{1}{2}(u - x)^{2}, & u > 0, \\ h_{2}(u) \equiv - \lambda u + \frac{1}{2}(u - x)^{2}, & u \leq 0.\end{array} \right.
$$

If the minimizer is attained at $u > 0$ , then $0 = h_{1}^{\prime}(u) = \lambda + u - x$ , meaning that $u = x - \lambda$ . Therefore, if $x > \lambda.$ , then pro $\mathfrak{c}_{q_{2}}(x) = x - \lambda$ . The same argument shows that if $x < - \lambda$ , then $\mathrm{prox}_{g_{2}}(x) = x + \lambda$ . If $| x | \le \lambda$ , then $\operatorname{prox}_{g_{2}}(x)$ must be the only <sup>2</sup>point of nondiferentiability of $h.$ , namely, 0.

[prox of $g_{3}] \ \mathrm{prox}_{g_{3}}(x)$ is the minimizer of the function

$$
s(u) = \left\{\begin{array}{ll} \lambda u^{3} + \frac{1}{2}(u - x)^{2}, & u \geq 0, \\ \infty, & u < 0.\end{array} \right.
$$

If the minimizer is positive, then $\tilde{u} = \mathrm{prox}_{g_{3}}(x)$ satisfies $s^{\prime}(\tilde{u}) = 0$ , that is,

$$
3 \lambda \tilde{u}^{2} + \tilde{u} - x = 0.
$$

The above equation has a positive root if and only i $\mathrm{~ r ~} > 0$ , and in this case the (unique) positive root is pro $\begin{array}{r}{\mathfrak{c}_{g_{3}}(x) = \tilde{u} = \frac{- 1 + \sqrt{1 + 12 \lambda x}}{6 \lambda}} \end{array}$ . If $x \leq 0$ , the minimizer of s <sup>3</sup>is attained at the only point of nondiferentiability of s in its domain, that is, at 0.

[prox of $g_{4}] \ \tilde{u} = \mathrm{prox}_{g_{4}}(x)$ is a minimizer over $\mathbb{R}_{+ +}$ of

$$
t(u) = - \lambda \log u + \frac{1}{2}(u - x)^{2},
$$

which is determined by the condition that the derivative vanishes:

$$
- \frac{\lambda}{\tilde{u}} +(\tilde{u} - x) = 0,
$$

that is,

$$
\tilde{u}^{2} - \tilde{u} x - \lambda = 0.
$$

Therefore (taking the positive root),

$$
\mathrm{prox}_{g_{4}}(x) = \tilde{u} = \frac{x + \sqrt{x^{2} + 4 \lambda}}{2}.
$$

[prox of $g_{5}]$ We will first assume that $\eta < \infty$ . Note that $\tilde{u} = \mathrm{prox}_{g_{5}}(x)$ is the minimizer of

$$
w(u) = \frac{1}{2}(u - x)^{2}
$$

over $[0, \eta]$ . The minimizer of w over $\mathbb{R}$ is $u = x.$ Therefore, if $0 \leq x \leq \eta,$ then $\tilde{u} = x$ . If $x < 0$ , then $w$ is increasing over $[0, \eta]$ , and hence $\tilde{u} = 0$ . Finally, if $x > \eta$ 2 then w is decreasing over $[0, \eta]$ , and thus $\tilde{u} = \eta$ . To conclude,

$$
\operatorname{prox}_{g_{5}}(x) = \tilde{u} = \left\{\begin{array}{ll} x, & 0 \leq x \leq \eta, \\ 0, & x < 0, \\ \eta, & x > \eta, \end{array} \right.= \min \{\max \{x, 0\}, \eta\}.
$$

For $\eta = \infty, g_{5}(x) = \delta_{[0, \infty)}(x)$ , and in this case, $g_{5}$ is identical to $g_{1}$ with $\mu = 0$ implying that $\mathrm{prox}_{g_{5}}(x) =[x]_{+}$ , which can also be written as

$$
\operatorname{prox}_{g_{5}}(x) = \min \{\max \{x, 0\}, \infty\}.\quad \square
$$

## 6.3 Prox Calculus Rules

In this section we gather several important results on the calculus of proximal mappings. Note that some of the results do not require any convexity/closedness assumptions.

Theorem 6.6 (prox of separable functions). Suppose that $f : \mathbb{E}_{1} \times \mathbb{E}_{2} \times \dots \times$ $\mathbb{E}_{m} \to(- \infty, \infty]$ is given by

$$
f \left(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{m}\right) = \sum_{i = 1}^{m} f_{i} \left(\mathbf{x}_{i}\right) \text{for any} \mathbf{x}_{i} \in \mathbb{E}_{i}, \quad i = 1, 2, \dots, m.
$$

Then for any $\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \ldots, \mathbf{x}_{m} \in \mathbb{E}_{m}$

$$
\operatorname{prox}_{f}(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{m}) = \operatorname{prox}_{f_{1}}(\mathbf{x}_{1}) \times \operatorname{prox}_{f_{2}}(\mathbf{x}_{2}) \times \dots \times \operatorname{prox}_{f_{m}}(\mathbf{x}_{m}).\tag{6.3}
$$

Proof. Formula (6.3) is a result of the following chain of equalities:

$$
\begin{array}{l} \operatorname{prox}_{f}(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m}) = \operatorname{argmin}_{\mathbf{y}_{1}, \mathbf{y}_{2}, \ldots, \mathbf{y}_{m}} \sum_{i = 1}^{m} \left[\frac{1}{2} \| \mathbf{y}_{i} - \mathbf{x}_{i} \|^{2} + f_{i}(\mathbf{y}_{i}) \right] \\ = \prod_{i = 1}^{m} \operatorname{argmin}_{\mathbf{y}_{i}} \left[\frac{1}{2} \| \mathbf{y}_{i} - \mathbf{x}_{i} \|^{2} + f_{i}(\mathbf{y}_{i}) \right] \\ = \prod_{i = 1}^{m} \operatorname{prox}_{f_{i}}(\mathbf{x}_{i}).\quad \square \end{array}
$$

Remark 6.7. If $f : \mathbb{R}^{n} \mathbb{R}$ is proper closed convex and separable,

$$
f(\mathbf{x}) = \sum_{i = 1}^{n} f_{i}(x_{i}),
$$

with $f_{i}$ being proper closed and convex univariate functions, then the result of Theorem 6.6 can be rewritten as

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left(\operatorname{prox}_{f_{i}}(x_{i})\right)_{i = 1}^{n}.
$$

Example 6.8 $\left(l_{1}{\mathbf{- norm}} \right)$ . Suppose that $g : \mathbb{R}^{n} \mathbb{R}$ is given by $g(\mathbf{x}) = \lambda \| \mathbf{x} \|_{1}$ where $\lambda > 0$ . Then

$$
g(\mathbf{x}) = \sum_{i = 1}^{n} \varphi(x_{i}),\tag{6.4}
$$

where $\varphi(t) = \lambda | t |$ . By Lemma 6.5 (computation of $\mathrm{prox}_{g_{2}}), \mathrm{prox}_{\varphi}(s) = \mathcal{T}_{\lambda}(s)$ , where $\mathcal{T}_{\lambda}$ is defined as

$$
\mathcal{T}_{\lambda}(y) =[| y | - \lambda]_{+} \mathrm{sgn}(y) = \left\{\begin{array}{ll} y - \lambda, & y \geq \lambda, \\ 0, & | y | < \lambda, \\ y + \lambda, & y \leq - \lambda.\end{array} \right.
$$

![Figure 6.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/d2fd078bc124ca90156bb09183d57dbf3938f01613cc7ed199cd8810009a97b8.jpg)  
Figure 6.2. The soft thresholding function $\mathcal{T}_{1}$

The function $\mathcal{T}_{\lambda}$ is called the soft thresholding function, and its description is given in Figure 6.2.

By Theorem 6.6,

$$
\operatorname{prox}_{g}(\mathbf{x}) = \left(\mathcal{T}_{\lambda}(x_{j})\right)_{j = 1}^{n}.
$$

We will expand the definition of the soft thresholding function for vectors by applying it componentwise, that is, for any $\mathbf{x} \in \mathbb{R}^{n}$ ，

$$
\mathcal{T}_{\lambda}(\mathbf{x}) \equiv(\mathcal{T}_{\lambda}(x_{j}))_{j = 1}^{n} =[| \mathbf{x} | - \lambda \mathbf{e}]_{+} \odot \operatorname{sgn}(\mathbf{x}).
$$

In this notation,

$$
\operatorname{prox}_{g}(\mathbf{x}) = \mathcal{T}_{\lambda}(\mathbf{x}).
$$

Example 6.9 (negative sum of logs). Let $g : \mathbb{R}^{n}(- \infty, \infty]$ be given by

$$
g(\mathbf{x}) = \left\{\begin{array}{ll} - \lambda \sum_{j = 1}^{n} \log x_{j}, & \mathbf{x} > \mathbf{0}, \\ \infty & \text{else}, \end{array} \right.
$$

where $\lambda > 0$ . Then $\begin{array}{r}{g(\mathbf{x}) = \sum_{i = 1}^{n} \varphi(x_{i})} \end{array}$ , where

$$
\varphi(t) = \left\{\begin{array}{ll} - \lambda \log t, & t > 0, \\ \infty, & t < 0.\end{array} \right.
$$

By Lemma 6.5 (computation of $\mathrm{prox}_{g_{4}})$

$$
\mathrm{prox}_{\varphi}(s) = \frac{s + \sqrt{s^{2} + 4 \lambda}}{2}.
$$

Thus, by Theorem 6.6,

$$
\operatorname{prox}_{g}(\mathbf{x}) =(\operatorname{prox}_{\varphi}(x_{j}))_{j = 1}^{n} = \left(\frac{x_{j} + \sqrt{x_{j}^{2} + 4 \lambda}}{2}\right)_{j = 1}^{n}.
$$

Example 6.10 $\left(l_{0}{\bf - norm} \right)$ . Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = \lambda \| \mathbf{x} \|_{0},$ where $\lambda > 0$ and $\| \mathbf{x} \|_{0} = \# \{i : x_{i} \neq 0\}$ is the $l_{0}{\mathrm{- norm}}$ discussed in Example 2.11. For any $\mathbf{x} \in \mathbb{R}^{n}$ 2

$$
f(\mathbf{x}) = \sum_{i = 1}^{n} I(x_{i}),
$$

where

$$
I(t) = \left\{\begin{array}{ll} \lambda, & t \neq 0, \\ 0, & t = 0.\end{array} \right.
$$

Note that $I(\cdot) = J(\cdot) + \lambda$ , where

$$
J(t) = \left\{\begin{array}{ll} 0, & t \neq 0, \\ - \lambda, & t = 0, \end{array} \right.
$$

and that by Example 6.2,

$$
\operatorname{prox}_{J}(s) = \left\{\begin{array}{ll} \{0\}, & | s | < \sqrt{2 \lambda}, \\ \{s\}, & | s | > \sqrt{2 \lambda}, \\ \{0, s\}, & | s | = \sqrt{2 \lambda}.\end{array} \right.\tag{6.5}
$$

We can write the above as pro $\mathfrak{c}_{J}(s) = \mathcal{H}_{\sqrt{2 \lambda}}(s)$ , where ${\mathcal{H}}_{\alpha}$ is the so-called hard thresholding operator defined by

$$
\mathcal{H}_{\alpha}(s) \equiv \left\{\begin{array}{ll} \{0\}, & | s | < \alpha, \\ \{s\}, & | s | > \alpha, \\ \{0, s\}, & | s | = \alpha.\end{array} \right.
$$

The operators $\mathrm{prox}_{J}$ and $\mathrm{prox}_{I}$ are the same since for any $s \in \mathbb{R}$

$$
\begin{array}{rl} &{\mathrm{prox}_{I}(s) = \operatorname{argmin}_{t} \left\{I(t) + \frac{1}{2}(t - s)^{2} \right\}} \\ &{\qquad = \operatorname{argmin}_{t} \left\{J(t) + \lambda + \frac{1}{2}(t - s)^{2} \right\}} \\ &{\qquad = \operatorname{argmin}_{t} \left\{J(t) + \frac{1}{2}(t - s)^{2} \right\}} \\ &{\qquad = \mathrm{prox}_{J}(s).} \end{array}
$$

Thus, invoking Theorem 6.6, it follows that<sup>27</sup>

$$
\mathrm{prox}_{g}(\mathbf{x}) = \mathcal{H}_{\sqrt{2 \lambda}}(x_{1}) \times \mathcal{H}_{\sqrt{2 \lambda}}(x_{2}) \times \dots \times \mathcal{H}_{\sqrt{2 \lambda}}(x_{n}).
$$

Theorem 6.11 (scaling and translation). Let $g : \mathbb{E}(- \infty, \infty]$ be a proper function. Let $\lambda \neq 0$ and $\mathbf{a} \in \mathbb{E}$ . Define $f(\mathbf{x}) = g(\lambda \mathbf{x} + \mathbf{a})$ . Then

$$
\operatorname{prox}_{f}(\mathbf{x}) = \frac{1}{\lambda} \left[\operatorname{prox}_{\lambda^{2} g}(\lambda \mathbf{x} + \mathbf{a}) - \mathbf{a} \right].\tag{6.6}
$$

Proof. By definition of the prox,

$$
\begin{array}{c} \operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} \\ = \operatorname{argmin}_{\mathbf{u}} \left\{g(\lambda \mathbf{u} + \mathbf{a}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.\end{array}\tag{6.7}
$$

Making the change of variables

$$
\mathbf{z} = \lambda \mathbf{u} + \mathbf{a},\tag{6.8}
$$

the objective function in the minimization problem (6.7) becomes

$$
g(\mathbf{z}) + \frac{1}{2} \left\| \frac{1}{\lambda}(\mathbf{z} - \mathbf{a}) - \mathbf{x} \right\|^{2} = \frac{1}{\lambda^{2}} \left[\lambda^{2} g(\mathbf{z}) + \frac{1}{2} \left\| \mathbf{z} -(\lambda \mathbf{x} + \mathbf{a}) \right\|^{2} \right].\tag{6.9}
$$

The minimizer of (6.9) is $\mathbf{z} = \mathrm{prox}_{\lambda^{2} g}(\lambda \mathbf{x} + \mathbf{a})$ , and hence by (6.8), it follows that (6.6) holds.

Theorem 6.12 (prox of $\lambda g(\cdot / \lambda))$ . Let $g : \mathbb{E}(- \infty, \infty]$ be proper, and let $\lambda \neq 0$ Define $f(\mathbf{x}) = \lambda g(\mathbf{x} / \lambda)$ . Then

$$
\operatorname{prox}_{f}(\mathbf{x}) = \lambda \operatorname{prox}_{g / \lambda}(\mathbf{x} / \lambda).
$$

Proof. Note that

$$
\operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} = \operatorname{argmin}_{\mathbf{u}} \left\{\lambda g \left(\frac{\mathbf{u}}{\lambda}\right) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.
$$

Making the change of variables $\begin{array}{r}{{\bf z} = \frac{{\bf u}}{\lambda}} \end{array}$ , we can continue to write

$$
\begin{array}{rl} &{\mathrm{prox}_{f}(\mathbf{x}) = \lambda \operatorname{argmin}_{\mathbf{z}} \left\{\lambda g(\mathbf{z}) + \frac{1}{2} \| \lambda \mathbf{z} - \mathbf{x} \|^{2} \right\}} \\ &{\qquad = \lambda \operatorname{argmin}_{\mathbf{z}} \left\{\lambda^{2} \left[\frac{g(\mathbf{z})}{\lambda} + \frac{1}{2} \left\| \mathbf{z} - \frac{\mathbf{x}}{\lambda} \right\|^{2} \right] \right\}} \\ &{\qquad = \lambda \operatorname{argmin}_{\mathbf{z}} \left\{\frac{g(\mathbf{z})}{\lambda} + \frac{1}{2} \left\| \mathbf{z} - \frac{\mathbf{x}}{\lambda} \right\|^{2} \right\}} \\ &{\qquad = \lambda \mathrm{prox}_{g / \lambda}(\mathbf{x} / \lambda).\quad \square} \end{array}
$$

Theorem 6.13 (quadratic perturbation). Let $g : \mathbb{E}(- \infty, \infty]$ be proper, and let $\begin{array}{r}{f(\mathbf{x}) = g(\mathbf{x}) + \frac{c}{2} \| \mathbf{x} \|^{2} + \langle \mathbf{a}, \mathbf{x} \rangle + \gamma} \end{array}$ , where $c > 0, \mathbf{a} \in \mathbb{E}$ , and $\gamma \in \mathbb{R}$ . Then

$$
\operatorname{prox}_{f}(\mathbf{x}) = \operatorname{prox}_{\frac{1}{c + 1} g} \left(\frac{\mathbf{x} - \mathbf{a}}{c + 1}\right).
$$

Proof. Follows by the following simple computation:

$$
\begin{array}{l} \operatorname{prox}_{f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} \\ \qquad = \operatorname{argmin}_{\mathbf{u}} \left\{g(\mathbf{u}) + \frac{c}{2} \| \mathbf{u} \|^{2} + \langle \mathbf{a}, \mathbf{u} \rangle + \gamma + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} \\ \qquad = \operatorname{argmin}_{\mathbf{u}} \left\{g(\mathbf{u}) + \frac{c + 1}{2} \left\| \mathbf{u} - \left(\frac{\mathbf{x} - \mathbf{a}}{c + 1}\right) \right\|^{2} \right\} \\ \qquad = \operatorname{prox}_{\frac{1}{c + 1} g} \left(\frac{\mathbf{x} - \mathbf{a}}{c + 1}\right).\quad \square \end{array}
$$

Example 6.14. Consider the function $f : \mathbb{R} \to(- \infty, \infty]$ given for any $x \in \mathbb{R}$ by

$$
f(x) = \left\{\begin{array}{ll} \mu x, & 0 \leq x \leq \alpha, \\ \infty & \text{else}, \end{array} \right.
$$

where $\mu \in \mathbb{R}$ and $\alpha \in[0, \infty]$ . To compute the prox of $f,$ note first that $f$ can be represented as

$$
f(x) = \delta_{[0, \alpha] \cap \mathbb{R}}(x) + \mu x.
$$

By Lemma 6.5 (computation of ${\mathrm{prox}}_{g_{5}}),{\mathrm{prox}}_{\delta_{[0, \alpha] \cap \mathbb{R}}}(x) ={\mathrm{min}} \{{\mathrm{max}} \{x, 0\}, \alpha\}$ . Therefore, using Theorem 6.13 with $c = 0, \mathbf{a} = \mu, \dot{\gamma} = \mathbf{\dot{0}}.$ , we obtain that for any $x \in \mathbb{R}$ 2

$$
\operatorname{prox}_{f}(x) = \operatorname{prox}_{g}(x - \mu) = \min \{\max \{x - \mu, 0\}, \alpha\}.
$$

Unfortunately, there is no useful calculus rule for computing the prox mapping of a composition of a function with a general Affine mapping. However, if the associated linear transformation satisfies a certain orthogonality condition, such a rule exists.

Theorem 6.15 (composition with an Affine mapping). Let $g : \mathbb { R } ^ { m } $ $(- \infty, \infty]$ be a proper closed convex function, and let $f(\mathbf{x}) = g(\mathcal{A}(\mathbf{x}) + \mathbf{b})$ , where $\mathbf{b} \in \mathbb{R}^{m}$ and $\mathcal{A} : \mathbb{V} \to \mathbb{R}^{m}$ is a linear transformation satisfying<sup>28</sup> A ◦ A<sup>T</sup> = αI for some constant $\alpha > 0$ . Then for any $\mathbf{x} \in \mathbb{V}$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \mathbf{x} + \frac{1}{\alpha} \mathcal{A}^{T}(\operatorname{prox}_{\alpha g}(\mathcal{A}(\mathbf{x}) + \mathbf{b}) - \mathcal{A}(\mathbf{x}) - \mathbf{b}).
$$

Proof. By definition, $\mathrm{prox}_{f}(\mathbf{x})$ is the optimal solution of

$$
\min_{\mathbf{u} \in \mathbb{V}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\},
$$

which can be rewritten as

$$
\min_{\mathbf{u} \in \mathbb{V}} \left\{g(\mathcal{A}(\mathbf{u}) + \mathbf{b}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.
$$

The above problem can be formulated as the following constrained problem:

$$
\begin{array}{ll} \min_{\mathbf{u} \in \mathbb{V}, \mathbf{z} \in \mathbb{R}^{m}} & g(\mathbf{z}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \\ \text{s.t.} & \mathbf{z} = \mathcal{A}(\mathbf{u}) + \mathbf{b}.\end{array}\tag{6.10}
$$

Denote the optimal solution of (6.10) by (˜z, u˜) (the existence and uniqueness of ˜z and u˜ follow by the underlying assumption that g is proper closed and convex). Note that $\tilde{\mathbf{u}} = \mathrm{prox}_{f}(\mathbf{x})$ . Fixing $\mathbf{z} = \tilde{\mathbf{z}}$ , we obtain that u˜ is the optimal solution of

$$
\begin{array}{ll} \min_{\mathbf{u} \in \mathbb{V}} & \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \\ \text{s.t.} & \mathcal{A}(\mathbf{u}) = \tilde{\mathbf{z}} - \mathbf{b}.\end{array}\tag{6.11}
$$

Since strong duality holds for problem (6.11) (see Theorem A.1), by Theorem A.2, it follows that there exists $\mathbf{y} \in \mathbb{R}^{m}$ for which

$$
\tilde{\mathbf{u}} \in \operatorname{argmin}_{\mathbf{u} \in \mathbb{V}} \left\{\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} + \langle \mathbf{y}, \mathcal{A}(\mathbf{u}) - \tilde{\mathbf{z}} + \mathbf{b} \rangle \right\}\tag{6.12}
$$

$$
\mathcal{A}(\tilde{\mathbf{u}}) = \tilde{\mathbf{z}} - \mathbf{b}.\tag{6.13}
$$

By (6.12),

$$
\tilde{\mathbf{u}} = \mathbf{x} - \mathcal{A}^{T}(\mathbf{y}).\tag{6.14}
$$

Substituting this expression of u˜ into (6.13), we obtain

$$
\mathcal{A}(\mathbf{x} - \mathcal{A}^{T}(\mathbf{y})) = \tilde{\mathbf{z}} - \mathbf{b},
$$

and hence, using the assumption that $\mathcal{A} \circ \mathcal{A}^{T} = \alpha \mathcal{Z}.$

$$
\alpha \mathbf{y} = \mathcal{A}(\mathbf{x}) + \mathbf{b} - \tilde{\mathbf{z}},
$$

which, combined with (6.14), yields an explicit expression for $\tilde{\mathbf{u}} = \mathrm{prox}_{f}(\mathbf{x})$ in terms of $\tilde{\mathbf{z}} \mathrm{:}$

$$
\mathrm{prox}_{f}(\mathbf{x}) = \tilde{\mathbf{u}} = \mathbf{x} + \frac{1}{\alpha} \mathcal{A}^{T}(\tilde{\mathbf{z}} - \mathcal{A}(\mathbf{x}) - \mathbf{b}).\tag{6.15}
$$

Substituting $\mathbf{u} = \tilde{\mathbf{u}}$ in the minimization problem (6.10), we obtain that $\tilde{\mathbf{z}}$ is given by

$$
\begin{array}{l} \tilde{\mathbf{z}} = \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{m}} \left\{g(\mathbf{z}) + \frac{1}{2} \left\| \mathbf{x} + \frac{1}{\alpha} \mathcal{A}^{T}(\mathbf{z} - \mathcal{A}(\mathbf{x}) - \mathbf{b}) - \mathbf{x} \right\|^{2} \right\} \\ = \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{m}} \left\{g(\mathbf{z}) + \frac{1}{2 \alpha^{2}} \| \mathcal{A}^{T}(\mathbf{z} - \mathcal{A}(\mathbf{x}) - \mathbf{b}) \|^{2} \right\} \\ \stackrel{{(*)}}{{=}} \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{m}} \left\{\alpha g(\mathbf{z}) + \frac{1}{2} \| \mathbf{z} - \mathcal{A}(\mathbf{x}) - \mathbf{b} \|^{2} \right\} \\ = \operatorname{prox}_{\alpha g}(\mathcal{A}(\mathbf{x}) + \mathbf{b}), \end{array}
$$

where the equality (∗) uses the assumption that $\mathcal{A} \circ \mathcal{A}^{T} = \alpha \mathcal{T}$ . Plugging the expression for z˜ into (6.15) produces the desired result.

Example 6.16. Let $g : \mathbb{E}(- \infty, \infty]$ be proper closed and convex where $\mathbb{E} = \mathbb{R}^{d}$ and let $f : \mathbb{E}^{m}(- \infty, \infty]$ be defined as

$$
f(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{m}) = g(\mathbf{x}_{1} + \mathbf{x}_{2} + \dots + \mathbf{x}_{m}).
$$

The above can be written as $f(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m}) = g({\cal A}(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m}))$ , where $\mathcal{A}$ : $\mathbb{E}^{m} \to \mathbb{E}$ is the linear transformation

$$
\mathcal{A}(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m}) = \mathbf{x}_{1} + \mathbf{x}_{2} + \dots + \mathbf{x}_{m}.
$$

Obviously, the adjoint operator $\mathcal{A}^{T} : \mathbb{E} \mathbb{E}^{m}$ is given by

$$
\mathcal{A}^{T}(\mathbf{x}) =(\mathbf{x}, \mathbf{x}, \dots, \mathbf{x}),
$$

and for any $\mathbf{x} \in \mathbb{E}$

$$
\mathcal{A}(\mathcal{A}^{T}(\mathbf{x})) = m \mathbf{x}.
$$

Thus, the conditions of Theorem 6.15 are satisfied with $\alpha = m$ and $\mathbf b = 0$ , and consequently, for any $\left(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m} \right) \in \mathbb{E}^{m}$ ，

$$
\boxed{\operatorname{prox}_{f}(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m})_{j} = \mathbf{x}_{j} + \frac{1}{m} \left(\operatorname{prox}_{mg} \left(\sum_{i = 1}^{m} \mathbf{x}_{i}\right) - \sum_{i = 1}^{m} \mathbf{x}_{i}\right), \quad j = 1, 2, \ldots, m.}
$$

Example 6.17. Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = | \mathbf{a}^{T} \mathbf{x} |$ , where $\mathbf{a} \in \mathbb{R}^{n} \setminus \{\mathbf{0}\}$ We can write f as $f(\mathbf{x}) = g(\mathbf{a}^{T} \mathbf{x})$ , where $g(t) = | t |$ . By Lemma $6.5 \ \left(\mathrm{prox}_{g_{2}} \right.$ computation), $\mathrm{prox}_{\lambda g} = \mathcal{T}_{\lambda}$ , with $\mathcal{T}_{\lambda}(x) =[| x | - \lambda]_{+} \mathrm{sgn}(x)$ <sup>2</sup> being the soft thresholding operator defined in Example 6.8. Invoking Theorem 6.15 with $\alpha = \| \mathbf{a} \|^{2}$ , b = 0, and $\mathcal{A}$ defined as the transformation ${\mathbf{x}} \mapsto{\mathbf{a}}^{T}{\mathbf{x}}.$ we obtain that

$$
\operatorname{prox}_{f}(\mathbf{x}) = \mathbf{x} + \frac{1}{\| \mathbf{a} \|^{2}} \left(\mathcal{T}_{\| \mathbf{a} \|^{2}} \left(\mathbf{a}^{T} \mathbf{x}\right) - \mathbf{a}^{T} \mathbf{x}\right) \mathbf{a}.
$$

Theorem 6.18 (norm composition). Let $f : \mathbb{E} \to \mathbb{R}$ be given by $f(\mathbf{x}) = g(\| \mathbf{x} \|)$ where $g : \mathbb{R}(- \infty, \infty]$ is a proper closed and convex function satisfying dom $(g) \subseteq$ $[0, \infty)$ . Then

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{prox}_{g}(\| \mathbf{x} \|) \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \{\mathbf{u} \in \mathbb{E}: \| \mathbf{u} \| = \operatorname{prox}_{g}(0)\}, & \mathbf{x} = \mathbf{0}.\end{array} \right.\tag{6.16}
$$

Proof. By definition, $\mathrm{prox}_{f}(\mathbf{0})$ is the set of minimizers of the problem

$$
\min_{\mathbf{u} \in \mathbb{E}} \left\{f(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} \|^{2} \right\} = \min_{\mathbf{u} \in \mathbb{E}} \left\{g(\| \mathbf{u} \|) + \frac{1}{2} \| \mathbf{u} \|^{2} \right\}.
$$

Making the change of variables $w = \left\| \mathbf{u} \right\|$ , the problem reduces to (recalling that dom $(g) \subseteq[0, \infty))$ 1

$$
\min_{w \in \mathbb{R}} \left\{g(w) + \frac{1}{2} w^{2} \right\}.
$$

The optimal set of the above problem is $\operatorname{prox}_{g}(0)$ , and hence $\mathrm{prox}_{f}(\mathbf{0})$ is the set of vectors u satisfying $\|{\mathbf{u}} \| = \operatorname{prox}_{g}(0)$ . We will now compute $\mathrm{prox}_{f}(\mathbf{x})$ for $\mathbf{x} \neq \mathbf{0}$ The optimization problem associated with the prox computation can be rewritten as the following double minimization problem:

$$
\begin{array}{c} \min_{\mathbf{u} \in \mathbb{E}} \left\{g(\| \mathbf{u} \|) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} = \min_{\mathbf{u} \in \mathbb{E}} \left\{g(\| \mathbf{u} \|) + \frac{1}{2} \| \mathbf{u} \|^{2} - \langle \mathbf{u}, \mathbf{x} \rangle + \frac{1}{2} \| \mathbf{x} \|^{2} \right\} \\ = \min_{\alpha \in \mathbb{R}_{+}} \min_{\mathbf{u} \in \mathbb{E}: \| \mathbf{u} \| = \alpha} \left\{g(\alpha) + \frac{1}{2} \alpha^{2} - \langle \mathbf{u}, \mathbf{x} \rangle + \frac{1}{2} \| \mathbf{x} \|^{2} \right\}.\end{array}
$$

Using the Cauchy–Schwarz inequality, it is easy to see that the minimizer of the inner minimization problem is

$$
\mathbf{u} = \alpha \frac{\mathbf{x}}{\| \mathbf{x} \|},\tag{6.17}
$$

and the corresponding optimal value is

$$
g(\alpha) + \frac{1}{2} \alpha^{2} - \alpha \| \mathbf{x} \| + \frac{1}{2} \| \mathbf{x} \|^{2} = g(\alpha) + \frac{1}{2}(\alpha - \| \mathbf{x} \|)^{2}.
$$

Therefore, prox ${\bf \nabla}_{f}({\bf x})$ is given by u in (6.17) with α given by

$$
\begin{array}{l} \alpha = \operatorname{argmin}_{\alpha \in \mathbb{R}_{+}} \bigg \{g(\alpha) + \frac{1}{2}(\alpha - \| \mathbf{x} \|)^{2} \bigg\} \\ \qquad = \operatorname{argmin}_{\alpha \in \mathbb{R}} \bigg \{g(\alpha) + \frac{1}{2}(\alpha - \| \mathbf{x} \|)^{2} \bigg\} \\ \qquad = \operatorname{prox}_{g}(\| \mathbf{x} \|), \end{array}
$$

where the second equality is due to the assumption that dom $(g) \subseteq[0, \infty)$ . Thus, $\begin{array}{r}{\mathrm{prox}_{f}(\mathbf{x}) = \mathrm{prox}_{g}(\| \mathbf{x} \|) \frac{\mathbf{x}}{\| \mathbf{x} \|}} \end{array}$

Example 6.19 (prox of Euclidean norm). Let $f : \mathbb { E } $ <sup>R</sup> be given by $f(\mathbf{x}) =$ $\lambda \| \mathbf{x} \|$ , where $\lambda > 0$ and $\| \cdot \|$ is the underlying Euclidean norm (recall that in this section we assume that the underlying space is Euclidean). Then $f(\mathbf{x}) = g(\| \mathbf{x} \|)$ where

$$
g(t) = \left\{\begin{array}{ll} \lambda t, & t \geq 0, \\ \infty, & t < 0.\end{array} \right.
$$

Then by Theorem 6.18, for any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{prox}_{g}(\| \mathbf{x} \|) \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \{\mathbf{u} \in \mathbb{E}: \| \mathbf{u} \| = \operatorname{prox}_{g}(0)\}, & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

By Lemma 6.5 (computation of $\mathrm{prox}_{g_{1}})$ $\operatorname{prox}_{g}(t) =[t - \lambda]_{+}$ . Thus, $\mathrm{prox}_{g}(0) = 0$ and $\operatorname{prox}_{g}(\| \mathbf{x} \|) =[\| \mathbf{x} \| - \lambda]_{+}$ <sup>1</sup>, and therefore

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll}[\| \mathbf{x} \| - \lambda]_{+} \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \mathbf{0}, & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

Finally, we can write the above formula in the following compact form:

$$
\operatorname{prox}_{\lambda \| \cdot \|}(\mathbf{x}) = \left(1 - \frac{\lambda}{\max \{\| \mathbf{x} \|, \lambda\}}\right) \mathbf{x}.
$$

Example 6.20 (prox of cubic Euclidean norm). Let $f(\mathbf{x}) = \lambda \| \mathbf{x} \|^{3}$ , where $\lambda > 0$ . Then $f(\mathbf{x}) = \lambda g(\| \mathbf{x} \|)$ , where

$$
g(t) = \left\{\begin{array}{ll} t^{3}, & t \geq 0, \\ \infty, & t < 0.\end{array} \right.
$$

Then by Theorem 6.18, for any $\mathbf{x} \in \mathbb{R}$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{prox}_{g}(\| \mathbf{x} \|) \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \{\mathbf{u} \in \mathbb{E}: \| \mathbf{u} \| = \operatorname{prox}_{g}(0)\}, & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

By Lemma 6.5 (computation of $\operatorname{prox}_{g_{3}})$ $\begin{array}{r}{\operatorname{prox}_{g}(t) \ = \ \frac{- 1 + \sqrt{1 + 12 \lambda[t]} +}{6 \lambda}} \end{array}$ . Therefore, $\mathrm{prox}_{g}(0) = 0$ and

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \frac{- 1 + \sqrt{1 + 12 \lambda \| \mathbf{x} \|}}{6 \lambda} \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \mathbf{0}, & \mathbf{x} = \mathbf{0}, \end{array} \right.
$$

and thus

$$
\operatorname{prox}_{\lambda \| \cdot \|^{3}}(\mathbf{x}) = \frac{2}{1 + \sqrt{1 + 12 \lambda \| \mathbf{x} \|}} \mathbf{x}.
$$

Example 6.21 (prox of negative Euclidean norm). Let $f : \mathbb{E} \to \mathbb{R}$ be given by $f(\mathbf{x}) = - \lambda \| \mathbf{x} \|$ , where $\lambda > 0$ . Since $f$ is not convex, we do not expect the prox to be a single-valued mapping. However, since $f$ is closed, and since the function $\begin{array}{r}{\mathbf{u} \mapsto f(\mathbf{u}) + \frac{1}{2} \Vert \mathbf{u} - \mathbf{x} \Vert^{2}} \end{array}$ is coercive for any $\mathbf{x} \in \mathbb{E}$ , it follows by Theorem 6.4 that the set $\mathrm{prox}_{f}(\mathbf{x})$ is always nonempty. To compute the prox, note that $f(\mathbf{x}) = g(\| \mathbf{x} \|)$ ， where

$$
g(t) = \left\{\begin{array}{ll} - \lambda t, & t \geq 0, \\ \infty, & t < 0.\end{array} \right.
$$

By Theorem 6.18, for any $\mathbf{x} \in \mathbb{R}$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{prox}_{g}(\| \mathbf{x} \|) \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \mathbf{x} \neq \mathbf{0}, \\ \{\mathbf{u} \in \mathbb{E}: \| \mathbf{u} \| = \operatorname{prox}_{g}(0)\}, & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

By Lemma 6.5 (computation of $\mathrm{prox}_{g_{1}})$ 2 $\mathrm{prox}_{g}(t) =[t + \lambda]_{+}$ . Therefore, $\mathrm{prox}_{g}(0) = \lambda$ and

$$
\operatorname{prox}_{- \lambda \| \cdot \|}(\mathbf{x}) = \left\{\begin{array}{ll} \Big(1 + \frac{\lambda}{\| \mathbf{x} \|} \Big) \mathbf{x}, & \mathbf{x} \neq \mathbf{0}, \\ \{\mathbf{u}: \| \mathbf{u} \| = \lambda\}, & \mathbf{x} = \mathbf{0}.\end{array} \right.
$$

Example 6.22 (prox of absolute value over symmetric intervals). Consider the function $f : \mathbb{R} \to(- \infty, \infty]$ given by

$$
f(x) = \left\{\begin{array}{ll} \lambda | x |, & | x | \leq \alpha, \\ \infty & \text{else}, \end{array} \right.
$$

where $\lambda \in[0, \infty)$ and $\alpha \in[0, \infty]$ . Then $f(x) = g(| x |)$ , where

$$
g(x) = \left\{\begin{array}{ll} \lambda x, & 0 \leq x \leq \alpha, \\ \infty & \text{else}.\end{array} \right.
$$

Thus, by Theorem 6.18, for any $x,$

$$
\operatorname{prox}_{f}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{prox}_{g}(| x |) \frac{x}{| x |}, & x \neq 0, \\ \{u \in \mathbb{R}: | u | = \operatorname{prox}_{g}(0)\}, & x = 0.\end{array} \right.\tag{6.18}
$$

By Example 6.14, $\operatorname{prox}_{q}(x) = \operatorname{min} \{\operatorname{max} \{x - \lambda, 0\}, \alpha\}$ , which, combined with (6.18) and the fact that $\begin{array}{r}{\frac{x}{| x |} = \mathrm{sgn}(x)} \end{array}$ for any $x \neq 0,$ yields the formula

$$
\operatorname{prox}_{\lambda | \cdot | + \delta_{[- \alpha, \alpha]}}(x) = \min \{\max \{| x | - \lambda, 0\}, \alpha\} \mathrm{sgn}(x).
$$

Using the previous example, we can compute the prox of weighted $l_{1}{\mathrm{- norms}}$ over boxes.

Example 6.23 (prox of weighted $\boldsymbol{l}_{1}$ over a box). Consider the function $f$ : $\mathbb{R}^{n} \to \mathbb{R}$ given by

$$
f(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} \omega_{i} | x_{i} |, & - \boldsymbol{\alpha} \leq \mathbf{x} \leq \boldsymbol{\alpha}, \\ \infty, & \text{else}, \end{array} \right.
$$

for any $\mathbf{x} \in \mathbb{R}^{n}$ , where $\boldsymbol \omega \in \mathbb{R}_{+}^{n}$ and $\alpha \in[0, \infty]^{n}$ . Then $\textstyle f = \sum_{i = 1}^{n} f_{i}$ , where

$$
f_{i}(x) = \left\{\begin{array}{ll} w_{i} | x |, & - \alpha_{i} \leq x \leq \alpha_{i}, \\ \infty, & \text{else}.\end{array} \right.
$$

Using Example 6.22 and invoking Theorem 6.6, we finally obtain that

<table><tr><td>$ \text{prox}_f(\mathbf{x}) = (\min\{\max\{|x_i| - \omega_i, 0\}, \alpha_i\}\text{sgn}(x_i))_{i=1}^n $.</td></tr></table>

The table below summarizes the main prox calculus rules discussed in this section.

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{prox}_{f}(\mathbf{x})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\sum_{i=1}^{m} f_{i}(\mathbf{x}_{i})$ </td><td> $\text{prox}_{f_{1}}(\mathbf{x}_{1}) \times \cdots \times \text{prox}_{f_{m}}(\mathbf{x}_{m})$ </td><td></td><td>Theorem 6.6</td></tr><tr><td> $g(\lambda\mathbf{x} + \mathbf{a})$ </td><td> $\frac{1}{\lambda} \left[\text{prox}_{\lambda^{2}g}(\lambda\mathbf{x} + \mathbf{a}) - \mathbf{a} \right]$ </td><td> $\lambda \neq 0, \mathbf{a} \in \mathbb{E}, g \text{proper}$ </td><td>Theorem 6.11</td></tr><tr><td> $\lambda g(\mathbf{x}/\lambda)$ </td><td> $\lambda \text{prox}_{g/\lambda}(\mathbf{x}/\lambda)$ </td><td> $\lambda \neq 0, g \text{proper}$ </td><td>Theorem 6.12</td></tr><tr><td> $g(\mathbf{x}) + \frac{c}{2} \| \mathbf{x} \|^{2} + \langle \mathbf{a}, \mathbf{x} \rangle + \gamma$ </td><td> $\text{prox}_{\frac{1}{c+1}g}(\frac{\mathbf{x}-\mathbf{a}}{c+1})$ </td><td> $\mathbf{a} \in \mathbb{E}, c > 0, \gamma \in \mathbb{R}, g \text{proper}$ </td><td>Theorem 6.13</td></tr><tr><td> $g(\mathcal{A}(\mathbf{x}) + \mathbf{b})$ </td><td> $\mathbf{x} + \frac{1}{\alpha} \mathcal{A}^{T}(\text{prox}_{\alpha g}(\mathcal{A}(\mathbf{x}) + \mathbf{b}) - \mathcal{A}(\mathbf{x}) - \mathbf{b})$ </td><td> $\mathbf{b} \in \mathbb{R}^{m}, \mathcal{A}: \mathbb{V} \to \mathbb{R}^{m}, g \text{proper closed convex,} \mathcal{A} \circ \mathcal{A}^{T} = \alpha I, \alpha > 0$ </td><td>Theorem 6.15</td></tr><tr><td> $g(\| \mathbf{x}\|)$ </td><td> $\text{prox}_{g}(\| \mathbf{x}\|) \frac{\mathbf{x}}{\|\mathbf{x}\|}, \quad \mathbf{x} \neq \mathbf{0}$  $\{\mathbf{u} : \| \mathbf{u}\| = \text{prox}_{g}(0)\}, \quad \mathbf{x} = \mathbf{0}$ </td><td> $g \text{proper closed convex, dom}(g) \subseteq[0,\infty)$ </td><td>Theorem 6.18</td></tr></table>

## 6.4 Prox of Indicators—Orthogonal Projections

## 6.4.1 The First Projection Theorem

Let $g : \mathbb{E}(- \infty, \infty]$ be given by $g(\mathbf{x}) = \delta_{C}(\mathbf{x})$ , where C is a nonempty set. Then

$$
\operatorname{prox}_{g}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{\delta_{C}(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} = \operatorname{argmin}_{\mathbf{u} \in C} \| \mathbf{u} - \mathbf{x} \|^{2} = P_{C}(\mathbf{x}).
$$

Thus, the proximal mapping of the indicator function of a given set is the orthogonal projection<sup>29</sup> operator onto the same set.

Theorem 6.24. Let $C \subseteq \mathbb{E}$ be nonempty. Then $\mathrm{prox}_{\delta_{C}}(\mathbf{x}) = P_{C}(\mathbf{x})$ for any $\mathbf{x} \in \mathbb{E}$

If C is closed and convex, in addition to being nonempty, the indicator function $\delta_{C}$ is proper closed and convex, and hence by the first prox theorem (Theorem 6.3), the orthogonal projection mapping (which coincides with the proximal mapping) exists and is unique. This is the first projection theorem.

Theorem 6.25 (first projection theorem). Let $C \subseteq \mathbb{E}$ be a nonempty closed convex set. Then $P_{C}(\mathbf{x})$ is a singleton for any $\mathbf{x} \in \mathbb{E}$

## 6.4.2 First Examples in $\mathbb{R}^{n}$

We begin by $\mathrm{recalling^{30}}$ several known expressions for the orthogonal projection onto some basic subsets of $\mathbb{R}^{n}$ . Since the assumption made throughout the book is that (unless otherwise stated) $\mathbb{R}^{n}$ is endowed with the dot product, and since the standing assumption in this chapter is that the underlying space is Euclidean, it follows that the endowed norm is the $l_{2}{\mathrm{- norm}}$

Lemma 6.26 (projection onto subsets of $\mathbb{R}^{n})$ . Following are pairs of nonempty closed and convex sets and their corresponding orthogonal projections:

$$
\text{nonnegative orthant} C_{1} = \mathbb{R}_{+}^{n},[\mathbf{x}]_{+},
$$

box

$$
C_{2} = \operatorname{Box}[\boldsymbol{\ell}, \mathbf{u}], \quad(\min \{\max \{x_{i}, \ell_{i}\}, u_{i}\})_{i = 1}^{n},
$$

Affine set

$$
C_{3} = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Ax} = \mathbf{b}\}, \quad \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T})^{- 1}(\mathbf{Ax} - \mathbf{b}),
$$

$l_{2}$ ball

$$
C_{4} = B_{\| \cdot \|_{2}}[\mathbf{c}, r], \quad \mathbf{c} + \frac{r}{\max \{\| \mathbf{x} - \mathbf{c} \|_{2}, r\}}(\mathbf{x} - \mathbf{c}),
$$

half-space

$$
C_{5} = \{\mathbf{x}: \mathbf{a}^{T} \mathbf{x} \leq \alpha\}, \quad \mathbf{x} - \frac{[\mathbf{a}^{T} \mathbf{x} - \alpha]_{+}}{\| \mathbf{a} \|^{2}} \mathbf{a},
$$

where $\ell \in[- \infty, \infty)^{n}, \mathbf{u} \in(- \infty, \infty]^{n}$ are such that $\ell \leq \mathbf{u}, \mathbf{A} \in \mathbb{R}^{m \times n}$ has full row rank, $\mathbf{b} \in \mathbb{R}^{m}, \mathbf{c} \in \mathbb{R}^{n}, r > 0, \mathbf{a} \in \mathbb{R}^{n} \ \backslash \ \{\mathbf{0}\}$ , and $\alpha \in \mathbb{R}$

Note that we extended the definition of box sets given in Section 1.7.1 to include unbounded intervals, meaning that $\operatorname{Box}[\ell, \mathbf{u}]$ is also defined when the components of - might also take the value $- \infty$ , and the components of u might take the value $\infty$ . However, boxes are always subsets of $\mathbb{R}^{n}$ , and the formula

$$
\operatorname{Box}[\boldsymbol{\ell}, \mathbf{u}] = \left\{\mathbf{x} \in \mathbb{R}^{n}: \boldsymbol{\ell} \leq \mathbf{x} \leq \mathbf{u} \right\}
$$

still holds. For example, $\mathrm{Box}[\mathbf{0}, \infty \mathbf{e}] = \mathbb{R}_{+}^{n}$

## 6.4.3 Projection onto the Intersection of a Hyperplane and a Box

The next result develops an expression for the orthogonal projection onto another subset of $\mathbb{R}^{n}$ —the intersection of an hyperplane and a box.

Theorem 6.27 (projection onto the intersection of a hyperplane and a box). Let $C \subseteq \mathbb{R}^{n}$ be given by

$$
C = H_{\mathbf{a}, b} \cap \operatorname{Box}[\boldsymbol{\ell}, \mathbf{u}] = \left\{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{a}^{T} \mathbf{x} = b, \boldsymbol{\ell} \leq \mathbf{x} \leq \mathbf{u} \right\},
$$

where $\mathbf{a} \in \mathbb{R}^{n} \backslash \{\mathbf{0}\}, b \in \mathbb{R}, \ell \in[- \infty, \infty)^{n}, \mathbf{u} \in(- \infty, \infty]^{n}$ . Assume that $C \neq \emptyset$ . Then

$$
P_{C}(\mathbf{x}) = P_{\mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}]}(\mathbf{x} - \boldsymbol{\mu}^{*} \mathbf{a}),
$$

where $\operatorname{Box}[\ell, \mathbf{u}] = \{\mathbf{y} \in \mathbb{R}^{n} : \ell_{i} \leq y_{i} \leq u_{i}, i = 1, 2, \ldots, n\}$ and $\mu^{*}$ is a solution of the equation

$$
\mathbf{a}^{T} P_{\mathrm{Box}[\ell, \mathbf{u}]}(\mathbf{x} - \mu \mathbf{a}) = b.\tag{6.19}
$$

Proof. The orthogonal projection of x onto C is the unique optimal solution of

$$
\min_{\mathbf{y}} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|_{2}^{2}: \mathbf{a}^{T} \mathbf{y} = b, \ell \leq \mathbf{y} \leq \mathbf{u} \right\}.\tag{6.20}
$$

A Lagrangian of the problem is

$$
L(\mathbf{y}; \mu) = \frac{1}{2} \| \mathbf{y} - \mathbf{x} \|_{2}^{2} + \mu(\mathbf{a}^{T} \mathbf{y} - b) = \frac{1}{2} \| \mathbf{y} -(\mathbf{x} - \mu \mathbf{a}) \|_{2}^{2} - \frac{\mu^{2}}{2} \| \mathbf{a} \|_{2}^{2} + \mu(\mathbf{a}^{T} \mathbf{x} - b).\tag{6.21}
$$

Since strong duality holds for problem (6.20) (see Theorem A.1), it follows by Theorem $\mathrm{A.2}$ that $\mathbf{y}^{*}$ is an optimal solution of problem (6.20) if and only if there exists $\mu^{*} \in \mathbb{R}$ (which will actually be an optimal solution of the dual problem) for which

$$
\mathbf{y}^{*} \in \operatorname{argmin}_{\ell \leq \mathbf{y} \leq \mathbf{u}} L(\mathbf{y}; \mu^{*}),
$$

$$
\mathbf{a}^{T} \mathbf{y}^{*} = b.\tag{6.22}
$$

(6.23)

Using the expression of the Lagrangian given in (6.21), the relation (6.22) can be equivalently written as

$$
\mathbf{y}^{*} = P_{\mathrm{Box}[\ell, \mathbf{u}]}(\mathbf{x} - \mu^{*} \mathbf{a}).
$$

The feasibility condition (6.23) can then be rewritten as

$$
\mathbf{a}^{T} P_{\mathrm{Box}[\ell, \mathbf{u}]}(\mathbf{x} - \boldsymbol{\mu}^{*} \mathbf{a}) = b.\quad \square
$$

Remark 6.28. The projection onto the box Box[-, u] is extremely simple and is done component-wise as described in Lemma 6.26. Note also that (6.19) actually consists in finding a root of the nonincreasing function $\varphi ( \mu ) = { \mathbf a } ^ { T } P _ { \mathrm { B o x } } ( { \mathbf x } - \mu { \mathbf a } ) - b $ which is $a$ task that can be performed eficiently even by simple procedures such as bisection. The fact that $\varphi$ is nonincreasing follows from the observation that $\varphi(\mu) =$ $\textstyle \sum_{i = 1}^{n} a_{i}$ min $\{\operatorname{max} \{x_{i} - \mu a_{i}, \ell_{i}\}, u_{i}\} - b$ and the fact that $\mu \mapsto a_{i}$ min $\{\operatorname{max} \{x_{i} -$ $\mu a_{i}, \ell_{i}\}, u_{i}\}$ is a nonincreasing function for any i.

A direct consequence of Theorem 6.27 is an expression for the orthogonal projection onto the unit simplex.

Corollary 6.29 (orthogonal projection onto the unit simplex). For any $\mathbf{x} \in \mathbb{R}^{n}$ ，

$$
P_{\Delta_{n}}(\mathbf{x}) =[\mathbf{x} - \mu^{*} \mathbf{e}]_{+},
$$

where $\mu^{*}$ is a root of the equation

$$
\mathbf{e}^{T}[\mathbf{x} - \boldsymbol{\mu}^{*} \mathbf{e}]_{+} - 1 = 0.
$$

Proof. Invoking Theorem 6.27 with $\mathbf{a} = \mathbf{e}, b = 1, \ell_{i} = 0, u_{i} = \infty, i = 1, 2, \ldots, n$ and noting that in this case $P_{\mathrm{Box}[\ell,{\bf u}]}({\bf x}) =[{\bf x}]_{+}$ , the result follows.

In order to expend the variety of sets on which we will be able to find simple expressions for the orthogonal projection mapping, in the next two subsections, we will discuss how to project onto level sets and epigraphs.

## 6.4.4 Projection onto Level Sets

Theorem 6.30 (orthogonal projection onto level sets). Let $C = Lev(f, \alpha) =$ $\{\mathbf{x} \in \mathbb{E} : f(\mathbf{x}) \leq \alpha\}$ , where $f : \mathbb{E}(- \infty, \infty]$ is proper closed and convex, and $\alpha \in \mathbb{R}$ . Assume that there exists $\hat{\mathbf{x}} \in \mathbb{E}$ for which $f(\hat{\mathbf{x}}) < \alpha$ . Then

$$
P_{C}(\mathbf{x}) = \left\{\begin{array}{ll} P_{\mathrm{dom}(f)}(\mathbf{x}), & f(P_{\mathrm{dom}(f)}(\mathbf{x})) \leq \alpha, \\ \operatorname{prox}_{\lambda^{*} f}(\mathbf{x}) & else, \end{array} \right.\tag{6.24}
$$

where $\lambda^{*}$ is any positive root of the equation

$$
\varphi(\lambda) \equiv f(\operatorname{prox}_{\lambda f}(\mathbf{x})) - \alpha = 0.
$$

In addition, the function $\varphi$ is nonincreasing.

Proof. The orthogonal projection of x onto $C$ is an optimal solution of the problem

$$
\min_{\mathbf{y} \in \mathbb{E}} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2}: f(\mathbf{y}) \leq \alpha, \mathbf{y} \in X \right\},
$$

where $X = \operatorname{dom}(f)$ . A Lagrangian of the problem is $(\lambda \geq 0)$

$$
L(\mathbf{y}; \lambda) = \frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2} + \lambda f(\mathbf{y}) - \alpha \lambda.\tag{6.25}
$$

Since the problem is convex and satisfies Slater’s condition, strong duality holds (see Theorem $\mathrm{A.1})$ , and therefore it follows by the optimality conditions in Theorem A.2 that $\mathbf{y}^{*}$ is an optimal solution of problem (6.25) if and only if there exists $\lambda^{\ast} \in \mathbb{R}_{+}$ for which

$$
\mathbf{y}^{*} \in \operatorname{argmin}_{\mathbf{y} \in X} L(\mathbf{y}; \lambda^{*}),\tag{6.26}
$$

$$
f(\mathbf{y}^{*}) \leq \alpha,\tag{6.27}
$$

$$
\lambda^{*}(f(\mathbf{y}^{*}) - \alpha) = 0.\tag{6.28}
$$

There are two cases. If $P_{X}(\mathbf{x})$ exists and $f(P_{X} \mathbf{(x)}) \leq \alpha.$ , then $\mathbf{y}^{*} = P_{X}(\mathbf{x})$ , and $\lambda^{*} = 0$ is a solution to the system (6.26), (6.27), (6.28). Otherwise, if $P_{X}(\mathbf{x})$ does not exist or $f(P_{X}(\mathbf{x})) > \alpha$ , then $\lambda^{*} > 0$ , and in this case the system (6.26), (6.27), (6.28) reduces to $\mathbf{y}^{*} = \mathrm{prox}_{\lambda^{*} f}(\mathbf{x})$ and $f(\mathrm{prox}_{\lambda^{*} f}(\mathbf{x})) = \alpha$ , which yields the formula (6.24).

To prove that $\varphi$ is nonincreasing, recall that

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{y} \in X} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2} + \lambda(f(\mathbf{y}) - \alpha) \right\}.
$$

Take $0 \leq \lambda_{1} < \lambda_{2}$ . Then denoting $\mathbf{v}_{1} = \mathrm{prox}_{\lambda_{1} f}(\mathbf{x})$ and $\mathbf{v}_{2} = \mathrm{prox}_{\lambda_{2} f}(\mathbf{x})$ , we have

$$
\begin{array}{l} \frac{1}{2} \| \mathbf{v}_{2} - \mathbf{x} \|^{2} + \lambda_{2}(f(\mathbf{v}_{2}) - \alpha) \\ = \frac{1}{2} \| \mathbf{v}_{2} - \mathbf{x} \|^{2} + \lambda_{1}(f(\mathbf{v}_{2}) - \alpha) +(\lambda_{2} - \lambda_{1})(f(\mathbf{v}_{2}) - \alpha) \\ \geq \frac{1}{2} \| \mathbf{v}_{1} - \mathbf{x} \|^{2} + \lambda_{1}(f(\mathbf{v}_{1}) - \alpha) +(\lambda_{2} - \lambda_{1})(f(\mathbf{v}_{2}) - \alpha) \\ = \frac{1}{2} \| \mathbf{v}_{1} - \mathbf{x} \|^{2} + \lambda_{2}(f(\mathbf{v}_{1}) - \alpha) +(\lambda_{2} - \lambda_{1})(f(\mathbf{v}_{2}) - f(\mathbf{v}_{1})) \\ \geq \frac{1}{2} \| \mathbf{v}_{2} - \mathbf{x} \|^{2} + \lambda_{2}(f(\mathbf{v}_{2}) - \alpha) +(\lambda_{2} - \lambda_{1})(f(\mathbf{v}_{2}) - f(\mathbf{v}_{1})).\end{array}
$$

Therefore, $(\lambda_{2} - \lambda_{1})(f(\mathbf{v}_{2}) - f(\mathbf{v}_{1})) \leq 0$ . Since $\lambda_{1} ~ < ~ \lambda_{2}$ , we can conclude that $f(\mathbf{v}_{2}) \leq f(\mathbf{v}_{1})$ . Finally,

$$
\varphi(\lambda_{2}) = f(\mathbf{v}_{2}) - \alpha \leq f(\mathbf{v}_{1}) - \alpha = \varphi(\lambda_{1}),
$$

establishing the monotonicity of $\varphi.$

Remark 6.31. Note that in Theorem 6.30 f is assumed to be closed, but this does not necessarily imply that dom(f) is closed. In cases where dom $(f)$ is not closed, it might happen that $P_{\mathrm{dom}(f)}(\mathbf{x})$ does not exist and formula (6.24) amounts to $P_{C}(\mathbf{x}) = \mathrm{prox}_{\lambda^{*} f}(\mathbf{x})$

Example 6.32 (projection onto the intersection of a half-space and a box). Consider the set

$$
C = H_{\mathbf{a}, b}^{-} \cap \mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}] = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{a}^{T} \mathbf{x} \leq b, \boldsymbol{\ell} \leq \mathbf{x} \leq \mathbf{u}\},
$$

where $\mathbf{a} \in \mathbb{R}^{n} \setminus \{\mathbf{0}\}, b \in \mathbb{R}, \ell \in[- \infty, \infty)^{n}$ and $\mathbf{u} \in(- \infty, \infty]^{n}$ . Assume that $C \neq \emptyset$ Then $C = \operatorname{Lev}(f, b)$ , where $f(\mathbf{x}) = \mathbf{a}^{T} \mathbf{x} + \delta_{\mathrm{Box}[\ell, \mathbf{u}]}(\mathbf{x})$ . For any $\lambda > 0$ 2

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \operatorname{prox}_{\lambda \mathbf{a}^{T}(\cdot) + \delta_{\operatorname{Box}[\ell, \mathbf{u}]}(\cdot)}(\mathbf{x}) \stackrel{(*)}{=} \operatorname{prox}_{\delta_{\operatorname{Box}[\ell, \mathbf{u}]}}(\mathbf{x} - \lambda \mathbf{a}) = P_{\operatorname{Box}[\ell, \mathbf{u}]}(\mathbf{x} - \lambda \mathbf{a}),
$$

where in the equality (∗) we used Theorem 6.13. Invoking Theorem 6.30, we obtain the following formula for the projection on C:

$$
P_{C}(\mathbf{x}) = \left\{\begin{array}{ll} P_{\mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}]}(\mathbf{x}), & \mathbf{a}^{T} P_{\mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}]}(\mathbf{x}) \leq b, \\ P_{\mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}]}(\mathbf{x} - \lambda^{*} \mathbf{a}), & \mathbf{a}^{T} P_{\mathrm{Box}[\boldsymbol{\ell}, \mathbf{u}]}(\mathbf{x}) > b, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\varphi(\lambda) = \mathbf{a}^{T} P_{\mathrm{Box}[\ell, \mathbf{u}]}(\mathbf{x} - \lambda \mathbf{a}) - b.
$$

Example 6.33 (projection onto the $\boldsymbol{l}_{1}$ ball). Let $C = B_{\parallel.\parallel_{1}}[\mathbf{0}, \alpha] = \{\mathbf{x} \in \mathbb{R}^{n}$ $\| \mathbf{x} \|_{1} \leq \alpha\}$ , where $\alpha > 0$ . Then $C = \operatorname{Lev}(f, \alpha)$ with $f(\mathbf{x}) = \| \mathbf{x} \|_{1}$ . The prox of $\lambda f = \lambda \| \cdot \|$ <sub>1</sub> for any $\lambda > 0$ was computed in Example 6.8, where it was shown that

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathcal{T}_{\lambda}(\mathbf{x}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}
$$

with $\mathcal{T}_{\lambda}$ being the soft thresholding operator given by $\mathcal{T}_{\lambda}(\mathbf{x}) =[\mathbf{x} - \lambda \mathbf{e}]_{+} \odot \mathrm{sgn}(\mathbf{x})$ Invoking Theorem 6.30, we obtain that

$$
P_{B_{\| \cdot \|_{1}}[\mathbf{0}, \alpha]}(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{x}, & \| \mathbf{x} \|_{1} \leq \alpha, \\ \mathcal{T}_{\lambda^{*}}(\mathbf{x}), & \| \mathbf{x} \|_{1} > \alpha, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\varphi(\lambda) = \left\| \mathcal{T}_{\lambda}(\mathbf{x}) \right\|_{1} - \alpha.
$$

The next example uses a generalization of the soft thresholding mapping, which will be called the two-sided soft thresholding operator, and is defined for any a, $\mathbf{b} \in(- \infty, \infty]^{n}$ as

$$
\mathcal{S}_{\mathbf{a}, \mathbf{b}}(\mathbf{x}) =(\min \{\max \{| x_{i} | - a_{i}, 0\}, b_{i}\} \mathrm{sgn}(x_{i}))_{i = 1}^{n}, \quad \mathbf{x} \in \mathbb{R}^{n}.
$$

Obviously,

$$
\mathcal{S}_{\lambda \mathbf{e}, \infty \mathbf{e}} = \mathcal{T}_{\lambda}.
$$

Here ∞e is the n-dimensional column vector whose elements are all $\infty$ . A plot of the function $t \mapsto S_{1, 2}(t)$ is given in Figure 6.3.

![Figure 6.3](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/2b3d5cda1b881537b814a3f16c933ef122b06db6560a478f67450df76e436ab1.jpg)

Figure 6.3. The two-sided soft thresholding function $t \ \mapsto \S_{1, 2}(t) \ =$ min $\{\operatorname{max} \{| t | - 1, 0\}, 2\} \mathrm{sgn}(t)$

Example 6.34 (projection onto the intersection of weighted $\boldsymbol{l}_{1}$ ball and a box). Let $C \subseteq \mathbb{R}^{n}$ be given by

$$
C = \left\{\mathbf{x} \in \mathbb{R}^{n}: \sum_{i = 1}^{n} \omega_{i} | x_{i} | \leq \beta, - \boldsymbol{\alpha} \leq \mathbf{x} \leq \boldsymbol{\alpha} \right\},
$$

where $\omega \in \mathbb{R}_{+}^{n}, \alpha \in[0, \infty]^{n}$ , and $\beta \in \mathbb{R}_{+ +}$ . Then obviously $C = \mathrm{Lev}(f, \beta)$ , where

$$
f(\mathbf{x}) = \boldsymbol{\omega}^{T} | \mathbf{x} | + \delta_{\mathrm{Box}[- \boldsymbol{\alpha}, \boldsymbol{\alpha}]}(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} \omega_{i} | x_{i} |, & - \boldsymbol{\alpha} \leq \mathbf{x} \leq \boldsymbol{\alpha}, \\ \infty & \text{else} \end{array} \right.
$$

for any $\mathbf{x} \in \mathbb{R}^{n}$ . By Example 6.23, for any $\lambda > 0$ and $\mathbf{x} \in \mathbb{R}^{n}$ ，

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \left(\min \{\max \{| x_{i} | - \lambda \omega_{i}, 0\}, \alpha_{i}\} \operatorname{sgn}(x_{i})\right)_{i = 1}^{n} = \mathcal{S}_{\lambda \boldsymbol{\omega}, \boldsymbol{\alpha}}(\mathbf{x}).
$$

Therefore, invoking Theorem 6.30, we obtain that

$$
P_{C}(\mathbf{x}) = \left\{\begin{array}{ll} P_{\mathrm{Box}[- \boldsymbol{\alpha}, \boldsymbol{\alpha}]}(\mathbf{x}), & \boldsymbol{\omega}^{T} | P_{\mathrm{Box}[- \boldsymbol{\alpha}, \boldsymbol{\alpha}]}(\mathbf{x}) | \leq \beta, \\ \mathcal{S}_{\lambda^{*} \boldsymbol{\omega}, \boldsymbol{\alpha}}(\mathbf{x}), & \boldsymbol{\omega}^{T} | P_{\mathrm{Box}[- \boldsymbol{\alpha}, \boldsymbol{\alpha}]}(\mathbf{x}) | > \beta, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\varphi(\lambda) = \pmb{\omega}^{T} | \mathcal{S}_{\lambda \pmb{\omega}, \pmb{\alpha}}(\mathbf{x}) | - \beta.
$$

As a final illustration of Theorem 6.30, we give an example in which the domain of f is not closed.

Example 6.35. Let

$$
C = \left\{\mathbf{x} \in \mathbb{R}_{+ +}^{n}: \Pi_{i = 1}^{n} x_{i} \geq \alpha \right\},
$$

where $\alpha > 0$ . The key property that will allow us to compute the orthogonal projection onto C is the fact that it can be rewritten as

$$
C = \left\{\mathbf{x} \in \mathbb{R}_{+ +}^{n}: - \sum_{i = 1}^{n} \log x_{i} \leq - \log \alpha \right\}.
$$

Thus, $C = \operatorname{Lev}(f, - \log \alpha)$ , where $f : \mathbb{R}^{n}(- \infty, \infty]$ is the negative sum of logs function:

$$
f(\mathbf{x}) = \left\{\begin{array}{ll} - \sum_{i = 1}^{n} \log x_{i}, & \mathbf{x} \in \mathbb{R}_{+ +}^{n}, \\ \infty & \text{else}.\end{array} \right.
$$

In Example 6.9 it was shown that for any $\mathbf{x} \in \mathbb{R}^{n}$

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \left(\frac{x_{j} + \sqrt{x_{j}^{2} + 4 \lambda}}{2}\right)_{j = 1}^{n}.
$$

We can now invoke Theorem 6.30 to obtain a formula (up to a single parameter that can be found by a one-dimensional search) for the projection onto $C,$ but there is one issue that needs to be treated delicately. If $\mathbf{x} \notin \mathbb{R}_{+ +}^{n}$ , meaning that it has at least one nonpositive element, then $P_{\mathbb{R}_{+ +}^{n}}(\mathbf{x})$ does not exist. In this case only the <sup>++</sup>second part of (6.24) is relevant, meaning that $P_{C}(\mathbf{x}) = \mathrm{prox}_{\lambda^{*} f}(\mathbf{x})$ . To conclude,

$$
P_{C}(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{x}, & \mathbf{x} \in C, \\ \left(\frac{x_{j} + \sqrt{x_{j}^{2} + 4 \lambda^{*}}}{2}\right)_{j = 1}^{n}, & \mathbf{x} \notin C, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\varphi(\lambda) = - \sum_{j = 1}^{n} \log \left(\frac{x_{j} + \sqrt{x_{j}^{2} + 4 \lambda}}{2}\right) + \log \alpha.
$$

## 6.4.5 Projection onto Epigraphs

We can use Theorem 6.30 to prove a theorem on the projection onto epigraphs of convex functions.

Theorem 6.36 (orthogonal projection onto epigraphs). Let

$$
C = \operatorname{epi}(g) = \left\{\left(\mathbf{x}, t\right) \in \mathbb{E} \times \mathbb{R}: g(\mathbf{x}) \leq t \right\},
$$

where $g : \mathbb{E} \mathbb{R}$ is convex. Then

$$
P_{C}((\mathbf{x}, s)) = \left\{\begin{array}{ll}(\mathbf{x}, s), & g(\mathbf{x}) \leq s, \\(\operatorname{prox}_{\lambda^{*} g}(\mathbf{x}), s + \lambda^{*}), & g(\mathbf{x}) > s, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the function

$$
\psi(\lambda) = g(\mathrm{prox}_{\lambda g}(\mathbf{x})) - \lambda - s.
$$

In addition, $\psi$ is nonincreasing.

Proof. Define $f : \mathbb{E} \times \mathbb{R} \to \mathbb{R}$ as $f(\mathbf{x}, t) \equiv g(\mathbf{x}) - t$ . By definition of the prox,

$$
\begin{array}{rl} &{\mathrm{prox}_{\lambda f}(\mathbf{x}, s) = \operatorname{argmin}_{\mathbf{y}, t} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2} + \frac{1}{2}(t - s)^{2} + \lambda f(\mathbf{y}, t) \right\}} \\ &{\qquad = \operatorname{argmin}_{\mathbf{y}, t} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2} + \frac{1}{2}(t - s)^{2} + \lambda g(\mathbf{y}) - \lambda t \right\}.} \end{array}
$$

The above problem is separable in y and $\mathbf{t},$ and thus

$$
\begin{array}{rl} &{\mathrm{prox}_{\lambda f}(\mathbf{x}, s) = \left(\operatorname{argmin}_{\mathbf{y}} \left\{\frac{1}{2} \| \mathbf{y} - \mathbf{x} \|^{2} + \lambda g(\mathbf{y}) \right\}, \operatorname{argmin}_{t} \left\{\frac{1}{2}(t - s)^{2} - \lambda t \right\}\right)} \\ &{\qquad = \left(\mathrm{prox}_{\lambda g}(\mathbf{x}), \mathrm{prox}_{\lambda h}(s)\right),} \end{array}
$$

where $h(t) \equiv - t$ . Since λh is linear, then by Section 6.2.2, $\mathrm{prox}_{\lambda h}(z) = z + \lambda$ for $\mathrm{any} \z \in \mathbb{R}$ . Thus,

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}, s) = \left(\operatorname{prox}_{\lambda g}(\mathbf{x}), s + \lambda\right).
$$

Since $\operatorname{epi}(g) = \operatorname{Lev}(f, 0)$ , we can invoke Theorem 6.30 (noting that dom $(f) = \mathbb{E})$ and obtain that

$$
P_{C}((\mathbf{x}, s)) = \left\{\begin{array}{ll}(\mathbf{x}, s), & g(\mathbf{x}) \leq s, \\(\operatorname{prox}_{\lambda^{*} g}(\mathbf{x}), s + \lambda), & g(\mathbf{x}) > s, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the function

$$
\psi(\lambda) = g(\mathrm{prox}_{\lambda g}(\mathbf{x})) - \lambda - s,
$$

which by Theorem 6.30 is nonincreasing.

Example 6.37 (projection onto the Lorentz cone). Consider the Lorentz cone, which is given by $L^{n} = \{(\mathbf{x}, t) \in \mathbb{R}^{n} \times \mathbb{R} : \| \mathbf{x} \|_{2} \leq t\}$ . We will show that for any $(\mathbf{x}, s) \in \mathbb{R}^{n} \times \mathbb{R}$

$$
P_{L^{n}}(\mathbf{x}, s) = \left\{\begin{array}{ll} \left(\frac{\| \mathbf{x} \|_{2} + s}{2 \| \mathbf{x} \|_{2}} \mathbf{x}, \frac{\| \mathbf{x} \|_{2} + s}{2}\right), & \| \mathbf{x} \|_{2} \geq | s |, \\(\mathbf{0}, 0), & s < \| \mathbf{x} \|_{2} < - s, \\(\mathbf{x}, s), & \| \mathbf{x} \|_{2} \leq s.\end{array} \right.
$$

To show the above,<sup>31</sup> we invoke Theorem 6.36 to obtain the formula

$$
P_{L^{n}}((\mathbf{x}, s)) = \left\{\begin{array}{ll}(\mathbf{x}, s), & \| \mathbf{x} \|_{2} \leq s, \\(\operatorname{prox}_{\lambda^{*} \| \cdot \|_{2}}(\mathbf{x}), s + \lambda^{*}), & \| \mathbf{x} \|_{2} > s, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\psi(\lambda) = \| \mathrm{prox}_{\lambda \| \cdot \|_{2}}(\mathbf{x}) \|_{2} - \lambda - s.\tag{6.29}
$$

Let $(\mathbf{x}, s) \in \mathbb{R}^{n} \times \mathbb{R}$ be such that $\| \mathbf{x} \|_{2} > s$ . Recall that by Example 6.19,

$$
\operatorname{prox}_{\lambda \| \cdot \|_{2}}(\mathbf{x}) = \left[1 - \frac{\lambda}{\max \{\| \mathbf{x} \|_{2}, \lambda\}} \right]_{+} \mathbf{x}.
$$

Plugging the above into the expression of $\psi$ in (6.29) yields

$$
\psi(\lambda) = \left\{\begin{array}{ll} \| \mathbf{x} \|_{2} - 2 \lambda - s, & \lambda \leq \| \mathbf{x} \|_{2}, \\ - \lambda - s, & \lambda \geq \| \mathbf{x} \|_{2}.\end{array} \right.
$$

The unique positive root $\lambda^{*}$ of the piecewise linear function $\psi$ is

$$
\lambda^{*} = \left\{\begin{array}{ll} \frac{\| \mathbf{x} \|_{2} - s}{2}, & \| \mathbf{x} \|_{2} \geq - s, \\ - s, & \| \mathbf{x} \|_{2} < - s.\end{array} \right.
$$

Thus, in the case $\| \mathbf{x} \|_{2} > s$ (noting that $\| \mathbf{x} \|_{2} \geq - s$ corresponds to the case where $\| \mathbf{x} \|_{2} \geq \lambda^{*}$ and $\| \mathbf{x} \|_{2} < - s$ corresponds to $\| \mathbf{x} \|_{2} \leq \lambda^{*})$ ,

$$
\begin{array}{l}(\operatorname{prox}_{\lambda^{*} \| \cdot \|_{2}}(\mathbf{x}), s + \lambda^{*}) = \left(\left[1 - \frac{\lambda^{*}}{\max \{\| \mathbf{x} \|_{2}, \lambda^{*}\}} \right]_{+} \mathbf{x}, s + \lambda^{*}\right), \\ = \left\{\begin{array}{ll} \left(\left[1 - \frac{\| \mathbf{x} \|_{2} - s}{2 \| \mathbf{x} \|_{2}} \right]_{+} \mathbf{x}, \frac{\| \mathbf{x} \|_{2} + s}{2}\right), & \| \mathbf{x} \|_{2} \geq - s, \\(\mathbf{0}, 0), & \| \mathbf{x} \|_{2} < - s.\end{array} \right.\\ = \left\{\begin{array}{ll} \left(\frac{\| \mathbf{x} \|_{2} + s}{2 \| \mathbf{x} \|_{2}} \mathbf{x}, \frac{\| \mathbf{x} \|_{2} + s}{2}\right), & \| \mathbf{x} \|_{2} \geq - s, \\(\mathbf{0}, 0), & \| \mathbf{x} \|_{2} < - s.\end{array} \right.\end{array}
$$

Recalling that $\| \mathbf{x} \|_{2} > s$ , we have thus established that $P_{L^{n}}(\mathbf{x}, s) =(\mathbf{0}, 0)$ when $s < \| \mathbf{x} \|_{2} < - s$ and that whenever $(\mathbf{x}, s)$ satisfies $\| \mathbf{x} \|_{2} > s$ and $\| \mathbf{x} \|_{2} ~ \ge ~ - s$ , the formula

$$
P_{L^{n}}(\mathbf{x}, s) = \left(\frac{\| \mathbf{x} \|_{2} + s}{2 \| \mathbf{x} \|_{2}} \mathbf{x}, \frac{\| \mathbf{x} \|_{2} + s}{2}\right)\tag{6.30}
$$

holds. The result now follows by noting that

$$
\left\{\left(\mathbf{x}, s\right): \| \mathbf{x} \|_{2} \geq | s | \right\} = \left\{\left(\mathbf{x}, s\right): \| \mathbf{x} \|_{2} > s, \| \mathbf{x} \|_{2} \geq - s \right\} \cup \left\{\left(\mathbf{x}, s\right): \| \mathbf{x} \|_{2} = s \right\},
$$

and that formula (6.30) is trivial for the case $\| \mathbf{x} \|_{2} = s$ (amounts to $P_{L^{n}}(\mathbf{x}, s) =$ $\mathbf{\rho}(\mathbf{x}, s))$

Example 6.38 (projection onto the epigraph of the $l_{1}{\bf - norm)}$ . Let

$$
C = \left\{\left(\mathbf{y}, t\right) \in \mathbb{R}^{n} \times \mathbb{R}: \| \mathbf{y} \|_{1} \leq t \right\}.
$$

Invoking Theorem 6.36 and recalling that for any $\lambda > 0, \mathrm{prox}_{\lambda \| \cdot \|_{1}} = \mathcal{T}_{\lambda}$ , where $\mathcal{T}_{\lambda}$ <sup>1</sup>is the soft thresholding operator (see Example 6.8), it follows that

$$
P_{C}((\mathbf{x}, s)) = \left\{\begin{array}{ll}(\mathbf{x}, s), & \| \mathbf{x} \|_{1} \leq s, \\(\mathcal{T}_{\lambda^{*}}(\mathbf{x}), s + \lambda^{*}), & \| \mathbf{x} \|_{1} > s, \end{array} \right.
$$

where $\lambda^{*}$ is any positive root of the nonincreasing function

$$
\varphi(\lambda) = \left\| \mathcal{T}_{\lambda}(\mathbf{x}) \right\|_{1} - \lambda - s.
$$

## 6.4.6 Summary of Orthogonal Projection Computations

Table 6.1 describes all the examples of orthogonal projection computations onto subsets of $\mathbb{R}^{n}$ and $\mathbb{R}^{n} \times \mathbb{R}$ that were discussed so far.

Table 6.1. The following notation is used in the table. [x]<sub>+</sub> is the nonnegative part of x, $\mathcal{T}_{\lambda}(\mathbf{y}) =([| y_{i} | - \lambda]_{+} \mathrm{sgn}(y_{i}))_{i = 1}^{n}$ , and $S _ { \mathbf { a } , \mathbf { b } } ( \mathbf { x } ) = ( \operatorname* { m i n } \{ \operatorname* { m a x } \{ | x _ { i } | - $ $a_{i}, 0\}, b_{i}\} \mathrm{sgn}(x_{i}))_{i = 1}^{n}$

<table><tr><td>set (C)</td><td> $P_C(\mathbf{x})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\mathbb{R}_+^n$ </td><td> $[\mathbf{x}]_+$ </td><td>-</td><td>Lemma 6.26</td></tr><tr><td>Box $[\ell,\mathbf{u}]$ </td><td> $P_C(\mathbf{x})_i = \min\{\max\{x_i,\ell_i\},u_i\}$ </td><td> $\ell_i \leq u_i$ </td><td>Lemma 6.26</td></tr><tr><td> $B_{\|\cdot\|_2}[\mathbf{c},r]$ </td><td> $\mathbf{c} + \frac{r}{\max\{\| \mathbf{x}-\mathbf{c}\|_2,r\}}(\mathbf{x}-\mathbf{c})$ </td><td> $\mathbf{c} \in \mathbb{R}^n, r > 0$ </td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{x} : \mathbf{A}\mathbf{x} = \mathbf{b}\}$ </td><td> $\mathbf{x} - \mathbf{A}^T(\mathbf{A}\mathbf{A}^T)^{-1}(\mathbf{A}\mathbf{x} - \mathbf{b})$ </td><td> $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^m, \mathbf{A} \text{full row rank}$ </td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{x} : \mathbf{a}^T \mathbf{x} \leq b\}$ </td><td> $\mathbf{x} - \frac{[\mathbf{a}^T \mathbf{x}-b]_+}{\|\mathbf{a}\|^2} \mathbf{a}$ </td><td> $\mathbf{0} \neq \mathbf{a} \in \mathbb{R}^n, b \in \mathbb{R}$ </td><td>Lemma 6.26</td></tr><tr><td> $\Delta_n$ </td><td> $[\mathbf{x} - \mu^*\mathbf{e}]_+ \text{where} \mu^* \in \mathbb{R} \text{satisfies} \mathbf{e}^T[\mathbf{x} - \mu^*\mathbf{e}]_+ = 1$ </td><td></td><td>Corollary 6.29</td></tr><tr><td> $H_{\mathbf{a},b} \cap \text{Box}[\ell,\mathbf{u}]$ </td><td> $P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \mu^*\mathbf{a}) \text{where} \mu^* \in \mathbb{R} \text{satisfies} \mathbf{a}^TP_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \mu^*\mathbf{a}) = b$ </td><td> $\mathbf{a} \in \mathbb{R}^n \setminus \{\mathbf{0}\}, b \in \mathbb{R}$ </td><td>Theorem 6.27</td></tr><tr><td> $H_{\mathbf{a},b}^{-} \cap \text{Box}[\ell,\mathbf{u}]$ </td><td> $\begin{cases} P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x}), & \mathbf{a}^T \mathbf{v}_{\mathbf{x}} \leq b, \\ P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \lambda^*\mathbf{a}), & \mathbf{a}^T \mathbf{v}_{\mathbf{x}} > b, \\ \mathbf{v}_{\mathbf{x}} = P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x}), & \mathbf{a}^TP_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \lambda^*\mathbf{a}) = b, \lambda^* > 0 \end{cases}$ </td><td> $\mathbf{a} \in \mathbb{R}^n \setminus \{\mathbf{0}\}, b \in \mathbb{R}$ </td><td>Example 6.32</td></tr><tr><td> $B_{\|\cdot\|_1}[\mathbf{0},\alpha]$ </td><td> $\begin{cases} \mathbf{x}, & \| \mathbf{x}\|_1 \leq \alpha, \\ \mathcal{T}_{\lambda^*}(\mathbf{x}), & \| \mathbf{x}\|_1 > \alpha, \\ \| \mathcal{T}_{\lambda^*}(\mathbf{x})\|_1 = \alpha, & \lambda^* > 0 \end{cases}$ </td><td> $\alpha > 0$ </td><td>Example 6.33</td></tr><tr><td> $\{\mathbf{x} : \boldsymbol{\omega}^T |\mathbf{x}| \leq \beta, -\boldsymbol{\alpha} \leq \mathbf{x} \leq \boldsymbol{\alpha}\}$ </td><td> $\begin{cases} \mathbf{v}_{\mathbf{x}}, & \boldsymbol{\omega}^T |\mathbf{v}_{\mathbf{x}}| \leq \beta, \\ \mathcal{S}_{\lambda^*\boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x}), & \boldsymbol{\omega}^T |\mathbf{v}_{\mathbf{x}}| > \beta, \\ \mathbf{v}_{\mathbf{x}} = P_{\text{Box}[-\boldsymbol{\alpha},\boldsymbol{\alpha}]}(\mathbf{x}), & \boldsymbol{\omega}^T |\mathcal{S}_{\lambda^*\boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x})| = \beta, \lambda^* > 0 \end{cases}$ </td><td> $\boldsymbol{\omega} \in \mathbb{R}_+^n, \boldsymbol{\alpha} \in[0,\infty]^n, \beta \in \mathbb{R}_{++}$ </td><td>Example 6.34</td></tr><tr><td> $\{\mathbf{x} > \mathbf{0} : \Pi x_i \geq \alpha\}$ </td><td> $\begin{cases} \mathbf{x}, & \mathbf{x} \in C, \\ \left(\frac{x_j + \sqrt{x_j^2 + 4\lambda^*}}{2} \right)^n, & \mathbf{x} \notin C, \\ \Pi_{j=1}^n \left((x_j + \sqrt{x_j^2 + 4\lambda^*})/2 \right) = \alpha, & \lambda^* > 0 \end{cases}$ </td><td> $\alpha > 0$ </td><td>Example 6.35</td></tr><tr><td> $\{(\mathbf{x},s) : \| \mathbf{x}\|_2 \leq s\}$ </td><td> $\left(\frac{\|\mathbf{x}\|_2 + s}{2\|\mathbf{x}\|_2} \mathbf{x}, \frac{\|\mathbf{x}\|_2 + s}{2} \right) \text{if} \| \mathbf{x}\|_2 \geq |s|(0,0) \text{if} s < \| \mathbf{x}\|_2 < -s, \\(\mathbf{x},s) \text{if} \| \mathbf{x}\|_2 \leq s.$ </td><td></td><td>Example 6.37</td></tr><tr><td> $\{(\mathbf{x},s) : \| \mathbf{x}\|_1 \leq s\}$ </td><td> $\begin{cases}(\mathbf{x},s), & \| \mathbf{x}\|_1 \leq s, \\(\mathcal{T}_{\lambda^*}(\mathbf{x}), s + \lambda^*), & \| \mathbf{x}\|_1 > s, \\ \| \mathcal{T}_{\lambda^*}(\mathbf{x})\|_1 - \lambda^* - s = 0, & \lambda^* > 0 \end{cases}$ </td><td></td><td>Example 6.38</td></tr></table>

## 6.5 The Second Prox Theorem

We can use Fermat’s optimality condition (Theorem 3.63) in order to prove the second prox theorem.

Theorem 6.39 (second prox theorem). Let $f : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function. Then for any x, u ∈ <sup>E</sup>, the following three claims are equivalent:

(i) $\mathbf{u} = \mathrm{prox}_{f}(\mathbf{x})$

(ii) $\mathbf{x} - \mathbf{u} \in \partial f(\mathbf{u})$

(iii) $\langle \mathbf{x} - \mathbf{u}, \mathbf{y} - \mathbf{u} \rangle \leq f(\mathbf{y}) - f(\mathbf{u}) ~ for ~ any ~ \mathbf{y} \in \mathbb{E}.$

Proof. By definition, $\mathbf{u} = \mathrm{prox}_{f}(\mathbf{x})$ if and only if u is the minimizer of the problem

$$
\min_{\mathbf{v}} \left\{f(\mathbf{v}) + \frac{1}{2} \| \mathbf{v} - \mathbf{x} \|^{2} \right\},
$$

which, by Fermat’s optimality condition (Theorem 3.63) and the sum rule of subdiferential calculus (Theorem 3.40), is equivalent to the relation

$$
\mathbf{0} \in \partial f(\mathbf{u}) + \mathbf{u} - \mathbf{x}.\tag{6.31}
$$

We have thus shown the equivalence between claims (i) and (ii). Finally, by the definition of the subgradient, the membership relation of claim (ii) is equivalent to (iii).

A direct consequence of the second prox theorem is that for a proper closed and convex function, ${\bf x} = \mathrm{prox}_{f}({\bf x})$ if and only x is a minimizer of $f.$

Corollary 6.40. Let f be a proper closed and convex function. Then x is a minimizer of f if and only if $\mathbf{x} = \mathrm{prox}_{f}(\mathbf{x})$

Proof. x is a minimizer of f if and only if $\mathbf{0} ~ \in \partial f(\mathbf{x})$ , that is, if and only if $\mathbf{x} - \mathbf{x} \in \partial f(\mathbf{x})$ , which by the second prox theorem (equivalence between (i) and (ii)) is the same as ${\bf x} = \mathrm{prox}_{f}({\bf x})$ 口

When $f = \delta_{C}$ , with C being a nonempty closed and convex set, the equivalence between claims (i) and (iii) in the second prox theorem amounts to the second projection theorem.

Theorem 6.41 (second projection theorem). Let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set. Let $\mathbf{u} \in C$ . Then $\mathbf{u} = P_{C}(\mathbf{x})$ if and only if

$$
\left\langle \mathbf{x} - \mathbf{u}, \mathbf{y} - \mathbf{u} \right\rangle \leq 0forany \mathbf{y} \in C.
$$

Another rather direct result of the second prox theorem is the firm nonexpansivity of the prox operator.

Theorem 6.42 (firm nonexpansivity of the prox operator). Let f be a proper closed and convex function. Then for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ 2

(a) (firm nonexpansivity)

$$
\langle \mathbf{x} - \mathbf{y}, \operatorname{prox}_{f}(\mathbf{x}) - \operatorname{prox}_{f}(\mathbf{y}) \rangle \geq \| \operatorname{prox}_{f}(\mathbf{x}) - \operatorname{prox}_{f}(\mathbf{y}) \|^{2}.
$$

(b) (nonexpansivity)

$$
\left\| \operatorname{prox}_{f}(\mathbf{x}) - \operatorname{prox}_{f}(\mathbf{y}) \right\| \leq \left\| \mathbf{x} - \mathbf{y} \right\|.
$$

Proof. (a) Denoting $\mathbf{u} = \mathrm{prox}_{f}(\mathbf{x}), \mathbf{v} = \mathrm{prox}_{f}(\mathbf{y})$ , by the equivalence of (i) and (ii) in the second prox theorem (Theorem 6.39), it follows that

$$
\mathbf{x} - \mathbf{u} \in \partial f(\mathbf{u}), \mathbf{y} - \mathbf{v} \in \partial f(\mathbf{v}).
$$

Thus, by the subgradient inequality,

$$
\begin{array}{l} f(\mathbf{v}) \geq f(\mathbf{u}) + \langle \mathbf{x} - \mathbf{u}, \mathbf{v} - \mathbf{u} \rangle, \\ f(\mathbf{u}) \geq f(\mathbf{v}) + \langle \mathbf{y} - \mathbf{v}, \mathbf{u} - \mathbf{v} \rangle.\end{array}
$$

Summing the above two inequalities, we obtain

$$
0 \geq \langle \mathbf{y} - \mathbf{x} + \mathbf{u} - \mathbf{v}, \mathbf{u} - \mathbf{v} \rangle,
$$

which is the same as

$$
\left\langle \mathbf{x} - \mathbf{y}, \mathbf{u} - \mathbf{v} \right\rangle \geq \left\| \mathbf{u} - \mathbf{v} \right\|^{2},
$$

that is,

$$
\langle \mathbf{x} - \mathbf{y}, \operatorname{prox}_{f}(\mathbf{x}) - \operatorname{prox}_{f}(\mathbf{y}) \rangle \geq \| \operatorname{prox}_{f}(\mathbf{x}) - \operatorname{prox}_{f}(\mathbf{y}) \|^{2}.
$$

(b) If prox ${\bf \Gamma}_{f}({\bf x}) = \mathrm{prox}_{f}({\bf y})$ , then the inequality is obvious. Assume that prox $_f(\mathbf{x}) \neq \mathrm{prox}_{f}(\mathbf{y})$ . Using (a) and the Cauchy–Schwarz inequality, it follows that

$$
\begin{array}{rl} &{\| \mathrm{prox}_{f}(\mathbf{x}) - \mathrm{prox}_{f}(\mathbf{y}) \|^{2} \leq \langle \mathrm{prox}_{h}(\mathbf{x}) - \mathrm{prox}_{h}(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle} \\ &{\qquad \leq \| \mathrm{prox}_{h}(\mathbf{x}) - \mathrm{prox}_{h}(\mathbf{y}) \| \cdot \| \mathbf{x} - \mathbf{y} \|.} \end{array}
$$

Dividing by $\| \mathrm{prox}_{h}({\bf x}) - \mathrm{prox}_{h}({\bf y}) \|$ , the desired result is established.

The following result shows how to compute the prox of the distance function to a nonempty closed and convex set. The proof is heavily based on the second prox theorem.

Lemma 6.43 (prox of the distance function). Let $C \subseteq \mathbb{E}$ be a nonempty, closed, and convex set. Let $\lambda > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{\lambda d_{C}}(\mathbf{x}) = \left\{\begin{array}{ll}(1 - \theta) \mathbf{x} + \theta P_{C}(\mathbf{x}), & d_{C}(\mathbf{x}) > \lambda, \\ P_{C}(\mathbf{x}), & d_{C}(\mathbf{x}) \leq \lambda, \end{array} \right.\tag{6.32}
$$

where<sup>32</sup>

$$
\theta = \frac{\lambda}{d_{C}(\mathbf{x})}.\tag{6.33}
$$

Proof. Let $\mathbf{u} = \mathrm{prox}_{\lambda d_{C}}(\mathbf{x})$ . By the second prox theorem (Theorem 6.39),

$$
\mathbf{x} - \mathbf{u} \in \lambda \partial d_{C}(\mathbf{u}).\tag{6.34}
$$

We will split the analysis into two cases.

Case I. u $\notin C.$ . By Example 3.49, (6.34) is the same as

$$
\mathbf{x} - \mathbf{u} = \lambda \frac{\mathbf{u} - P_{C}(\mathbf{u})}{d_{C}(\mathbf{u})}.
$$

Denoting $\begin{array}{r}{\alpha = \frac{\lambda}{d_{C}(\mathbf{u})}} \end{array}$ , the last equality can be rewritten as

$$
\mathbf{u} = \frac{1}{\alpha + 1} \mathbf{x} + \frac{\alpha}{\alpha + 1} P_{C}(\mathbf{u})\tag{6.35}
$$

or as

$$
\mathbf{x} - P_{C}(\mathbf{u}) =(\alpha + 1)(\mathbf{u} - P_{C}(\mathbf{u})).\tag{6.36}
$$

By the second projection theorem (Theorem 6.41), in order to show that $P_{C}(\mathbf{u}) =$ $P_{C}(\mathbf{x})$ , it is enough to show that

$$
\langle \mathbf{x} - P_{C}(\mathbf{u}), \mathbf{y} - P_{C}(\mathbf{u}) \rangle \leq 0 \text{for any} \mathbf{y} \in C.\tag{6.37}
$$

Using (6.36), we can deduce that (6.37) is equivalent to

$$
(\alpha + 1) \langle \mathbf{u} - P_{C}(\mathbf{u}), \mathbf{y} - P_{C}(\mathbf{u}) \rangle \leq 0 \text{for any} \mathbf{y} \in C,
$$

which is a valid inequality by the second projection theorem, and hence $P_{C}(\mathbf{u}) =$ $P_{C}(\mathbf{x})$ . Using this fact and taking the norm in both sides of (6.36), we obtain that

$$
d_{C}(\mathbf{x}) =(\alpha + 1) d_{C}(\mathbf{u}) = d_{C}(\mathbf{u}) + \lambda,
$$

which also shows that in this case $d_{C}(\mathbf{x}) > \lambda$ (since $d_{C}(\mathbf{u}) > 0)$ and that

$$
{\frac{1}{\alpha + 1}} ={\frac{d_{C}(\mathbf{u})}{\lambda + d_{C}(\mathbf{u})}} ={\frac{d_{C}(\mathbf{x}) - \lambda}{d_{C}(\mathbf{x})}} = 1 - \theta,
$$

where θ is given in (6.33). Therefore, (6.35) can also be written as (recalling also that $P_{C}(\mathbf{u}) = P_{C}(\mathbf{x}))$

$$
\mathrm{prox}_{\lambda d_{C}}(\mathbf{x}) =(1 - \theta) \mathbf{x} + \theta P_{C}(\mathbf{x}).\tag{6.38}
$$

Case II. If $\mathbf{u} \in C.$ , then $\mathbf{u} = P_{C}(\mathbf{x})$ . To show this, let $\mathbf{v} \in C$ . Since $\mathbf{u} = \mathrm{prox}_{\lambda d_{C}}(\mathbf{x})$ 2 it follows in particular that

$$
\lambda d_{C}(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \leq \lambda d_{C}(\mathbf{v}) + \frac{1}{2} \| \mathbf{v} - \mathbf{x} \|^{2},
$$

and hence, since $d_{C}(\mathbf{u}) = d_{C}(\mathbf{v}) = 0$

$$
\left\| \mathbf{u} - \mathbf{x} \right\| \leq \left\| \mathbf{v} - \mathbf{x} \right\|.
$$

Therefore,

$$
\mathbf{u} = \operatorname{argmin}_{\mathbf{v} \in C} \| \mathbf{v} - \mathbf{x} \| = P_{C}(\mathbf{x}).
$$

By Example 3.49, the optimality condition (6.34) becomes

$$
\frac{\mathbf{x} - P_{C}(\mathbf{x})}{\lambda} \in N_{C}(\mathbf{u}) \cap B[\mathbf{0}, 1],
$$

which in particular implies that

$$
\left\| \frac{\mathbf{x} - P_{C}(\mathbf{x})}{\lambda} \right\| \leq 1,
$$

that is,

$$
d_{C}(\mathbf{x}) = \left\| P_{C}(\mathbf{x}) - \mathbf{x} \right\| \leq \lambda.
$$

Since the first case in which (6.38) holds corresponds to vectors satisfying $d_{C}(\mathbf{x}) > \lambda,$ while the second case in which $\mathrm{prox}_{\lambda d_{C}}({\bf x}) = P_{C}({\bf x})$ corresponds to vectors satisfying $d_{C}(\mathbf{x}) \leq \lambda$ , the desired result (6.32) is established.

## 6.6 Moreau Decomposition

A key property of the prox operator is the so-called Moreau decomposition theorem, which connects the prox operator of proper closed convex functions and their conjugates.

Theorem 6.44 (Moreau decomposition). Let $f : \mathbb{E}(- \infty, \infty]$ be proper closed and convex. Then for any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{f}(\mathbf{x}) + \operatorname{prox}_{f *}(\mathbf{x}) = \mathbf{x}.
$$

Proof. Let $\mathbf{x} \in \mathbb{E}$ and denote $\mathbf{u} = \mathrm{prox}_{f}(\mathbf{x})$ . Then by the equivalence between claims (i) and (ii) in the second prox theorem (Theorem 6.39), it follows that ${\bf x} -{\bf u} \in$ $\partial f(\mathbf{u})$ , which by the conjugate subgradient theorem (Theorem 4.20) is equivalent to $\mathbf{u} \in \partial f^{*}(\mathbf{x} - \mathbf{u})$ . Using the second prox theorem again, we conclude that ${\bf x} -{\bf u} =$ prox<sub>f∗</sub> (x). Therefore,

$$
\operatorname{prox}_{f}(\mathbf{x}) + \operatorname{prox}_{f *}(\mathbf{x}) = \mathbf{u} +(\mathbf{x} - \mathbf{u}) = \mathbf{x}.\quad \square
$$

The next result is a useful extension of the Moreau decomposition theorem.

Theorem 6.45 (extended Moreau decomposition). Let $f : \mathbb{E} \to(- \infty, \infty]$ be proper closed and convex, and let $\lambda > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$ 8

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) + \lambda \operatorname{prox}_{\lambda^{- 1} f^{*}}(\mathbf{x} / \lambda) = \mathbf{x}.\tag{6.39}
$$

Proof. Using Moreau decomposition, for any $\mathbf{x} \in \mathbb{E}$

$$
\mathrm{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \mathrm{prox}_{(\lambda f)^{*}}(\mathbf{x}) = \mathbf{x} - \mathrm{prox}_{\lambda f^{*}(./ \lambda)}(\mathbf{x}),\tag{6.40}
$$

where the second equality follows by Theorem $4.14(a)$ . By Theorem 6.12,

$$
\operatorname{prox}_{\lambda f^{*}(\cdot / \lambda)}(\mathbf{x}) = \lambda \operatorname{prox}_{\lambda^{- 1} f^{*}}(\mathbf{x} / \lambda),
$$

which, combined with (6.40), yields (6.39).

## 6.6.1 Support Functions

Using Moreau decomposition, we can develop a formula for computing the prox of a support function of a given nonempty closed and convex set in terms of the orthogonal projection operator.

Theorem 6.46 (prox of support functions). Let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set, and let $\lambda > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\mathrm{prox}_{\lambda \sigma_{C}}(\mathbf{x}) = \mathbf{x} - \lambda P_{C}(\mathbf{x} / \lambda).\tag{6.41}
$$

Proof. A direct consequence of the extended Moreau decomposition formula (Theorem 6.45) along with the fact that $(\sigma_{C})^{*} = \delta_{C}$ (Example 4.9).

Following are several examples of prox computations using formula (6.41).

Example 6.47 (prox of norms). Let $f : \mathbb{E} \mathbb{R}$ be given by $f(\mathbf{x}) = \lambda \| \mathbf{x} \|_{\alpha},$ where $\lambda > 0$ and $\| \cdot \|_{\alpha}$ is any norm on <sup>E</sup>. Note that $\| \cdot \|_{\alpha}$ is not necessarily the endowed norm on <sup>E</sup>, which is denoted by $\| \cdot \|$ and in this chapter is always assumed to be the Euclidean norm. We know by Example 2.31 that

$$
\left\| \mathbf{x} \right\|_{\alpha} = \sigma_{C}(\mathbf{x}),
$$

where

$$
C = B_{\| \cdot \|_{\alpha, *}}[\mathbf{0}, 1] = \left\{\mathbf{x} \in \mathbb{E}: \| \mathbf{x} \|_{\alpha, *} \leq 1 \right\}
$$

with $\| \cdot \|_{\alpha, *}$ being the dual norm of $\| \cdot \|_{\alpha}$ . Invoking Theorem 6.46, we obtain

$$
\operatorname{prox}_{\lambda \| \cdot \|_{\alpha}}(\mathbf{x}) = \mathbf{x} - \lambda P_{B_{\| \cdot \|_{\alpha, *}}[\mathbf{0}, 1]}(\mathbf{x} / \lambda).
$$

Example 6.48 (prox of $\scriptstyle l_{\infty} \to \mathbf{norm})$ . By Example 6.47 we have for all $\lambda > 0$ and $\mathbf{x} \in \mathbb{R}^{n}$

$$
\operatorname{prox}_{\lambda \| \cdot \|_{\infty}}(\mathbf{x}) = \mathbf{x} - \lambda P_{B_{\| \cdot \|_{1}}[\mathbf{0}, 1]}(\mathbf{x} / \lambda).
$$

The projection onto the $l_{1}$ unit ball can be easily computed by finding a root of a nonincreasing one-dimensional function; see Example 6.33.

Example 6.49 (prox of the max function). Consider the max function $g :$ $\mathbb{R}^{n} \to$ <sup>R</sup> given by $g(\mathbf{x}) = \operatorname{max}(\mathbf{x}) \equiv \operatorname{max} \{x_{1}, x_{2}, \ldots, x_{n}\}$ . It is easy to see that the max function is actually the support function of the unit simplex:

$$
\max(\mathbf{x}) = \sigma_{\Delta_{n}}(\mathbf{x}).
$$

Therefore, by Theorem 6.46, for any $\lambda > 0$ and $\mathbf{x} \in \mathbb{R}^{n}$ 2

$$
\operatorname{prox}_{\lambda \max(\cdot)}(\mathbf{x}) = \mathbf{x} - \lambda P_{\Delta_{n}}(\mathbf{x} / \lambda).
$$

The projection onto the unit simplex can be eficiently computed by finding a root of a nonincreasing one-dimensional function; see Corollary 6.29.

Example 6.50 (prox of the sum-of-k-largest-values function). Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be given by

$$
f(\mathbf{x}) = x_{[1]} + x_{[2]} + \dots + x_{[k]},
$$

where $k \in \{1, 2, \dots, n\}$ and for any $i, x_{[i]}$ denotes ith largest value in the vector x. It is not dificult to show that $f = \sigma_{C}$ , where

$$
C = \{\mathbf{y} \in \mathbb{R}^{n}: \mathbf{e}^{T} \mathbf{y} = k, \mathbf{0} \leq \mathbf{y} \leq \mathbf{e}\}.
$$

Therefore, by Theorem 6.46,

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \lambda P_{C}(\mathbf{x} / \lambda).
$$

That is, for any $\mathbf{x} \in \mathbb{R}^{n}$ 2

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \lambda P_{\{\mathbf{y}: \mathbf{e}^{T} \mathbf{y} = k, \mathbf{0} \leq \mathbf{y} \leq \mathbf{e}\}}(\mathbf{x} / \lambda).
$$

As in the previous examples, computing the projection onto $C$ amounts to finding a root of a monotone one-dimensional function; see Theorem 6.27.

Example 6.51 (prox of the sum-of-k-largest-absolute-values function). Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by

$$
f(\mathbf{x}) = \sum_{i = 1}^{k} | x_{\langle i \rangle} |,
$$

where $k \in \{1, 2, \ldots, n\}$ and $x_{\langle i \rangle}$ is the component of x with the ith largest absolute value, meaning in particular that $| x_{\langle 1 \rangle} | \geq | x_{\langle 2 \rangle} | \geq \cdot \cdot \cdot \geq | x_{\langle n \rangle} |$ . Then

$$
f(\mathbf{x}) = \max \left\{\sum_{i = 1}^{n} z_{i} x_{i}: \| \mathbf{z} \|_{1} \leq k, - \mathbf{e} \leq \mathbf{z} \leq \mathbf{e} \right\}.
$$

Therefore, $f = \sigma_{C}$ , where

$$
C = \left\{\mathbf{z} \in \mathbb{R}^{n}: \| \mathbf{z} \|_{1} \leq k, - \mathbf{e} \leq \mathbf{z} \leq \mathbf{e} \right\},
$$

and consequently, by Theorem 6.46,

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \lambda P_{C}(\mathbf{x} / \lambda).
$$

That is, for any $\mathbf{x} \in \mathbb{R}^{n}$ ，

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \lambda P_{\{\mathbf{y}: \| \mathbf{y} \|_{1} \leq k, - \mathbf{e} \leq \mathbf{y} \leq \mathbf{e}\}}(\mathbf{x} / \lambda).
$$

The orthogonal projection in the above formula amounts to finding a root of a nonincreasing one-dimensional function; see Example 6.34.

## 6.7 The Moreau Envelope

## 6.7.1 Definition and Basic Properties

Definition 6.52 (Moreau envelope). Given a proper closed convex function $f : \mathbb{E} \to(- \infty, \infty]$ and $\mu > 0$ , the Moreau envelope of f is the function

$$
M_{f}^{\mu}(\mathbf{x}) = \min_{\mathbf{u} \in \mathbb{E}} \left\{f(\mathbf{u}) + \frac{1}{2 \mu} \| \mathbf{x} - \mathbf{u} \|^{2} \right\}.\tag{6.42}
$$

The parameter $\mu$ is called the smoothing parameter. The explanation for this terminology will be given in Section 6.7.2. By the first prox theorem (Theorem 6.3), the minimization problem in (6.42) has a unique solution, given by $\operatorname{prox}_{\mu f}(\mathbf{x})$ Therefore, ${\cal M}_{f}^{\mu}({\bf x})$ is always a real number and

$$
M_{f}^{\mu}(\mathbf{x}) = f(\mathrm{prox}_{\mu f}(\mathbf{x})) + \frac{1}{2 \mu} \| \mathbf{x} - \mathrm{prox}_{\mu f}(\mathbf{x}) \|^{2}.
$$

Example 6.53 (Moreau envelope of indicators). Let $f = \delta_{C}$ , where $C \subseteq \mathbb{E}$ is a nonempty closed and convex set. By Theorem 6.24, $\mathrm{prox}_{\mu f}({\bf x}) = P_{C}({\bf x})$ . Thus, for any $\mathbf{x} \in \mathbb{E}$

$$
M_{f}^{\mu}(\mathbf{x}) = \delta_{C}(P_{C}(\mathbf{x})) + \frac{1}{2 \mu} \| \mathbf{x} - P_{C}(\mathbf{x})) \|^{2},
$$

and hence

$$
M_{\delta_{C}}^{\mu} = \frac{1}{2 \mu} d_{C}^{2}.
$$

The next example will show that the Moreau envelope of the (Euclidean) norm is the so-called Huber function defined as

$$
H_{\mu}(\mathbf{x}) = \left\{\begin{array}{ll} \frac{1}{2 \mu} \| \mathbf{x} \|^{2}, & \| \mathbf{x} \| \leq \mu, \\ \| \mathbf{x} \| - \frac{\mu}{2}, & \| \mathbf{x} \| > \mu.\end{array} \right.\tag{6.43}
$$

The one-dimensional Huber function is plotted in Figure 6.4, where it is illustrated that the function becomes smoother as $\mu$ becomes larger.

![Figure 6.4](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/c151de4cda20f16a407c51191cd5cec17f33e27a7a9cc8979d8f5c5b17bd71ae.jpg)  
Figure 6.4. The Huber function with parameters $\mu = 0.1, 1, 4$ . The function becomes smoother as $\mu$ gets larger.

Example 6.54 (Huber function). Let $f : \mathbb{E} \to \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{x} \|$ . Then by Example 6.19, for any $\mathbf{x} \in \mathbb{E}$ and $\mu > 0$

$$
\mathrm{prox}_{\mu f}(\mathbf{x}) = \left(1 - \frac{\mu}{\max \{\| \mathbf{x} \|, \mu\}}\right) \mathbf{x}.
$$

Therefore,

$$
M_{f}^{\mu}(\mathbf{x}) = \| \mathrm{prox}_{\mu f}(\mathbf{x}) \| + \frac{1}{2 \mu} \| \mathbf{x} - \mathrm{prox}_{\mu f}(\mathbf{x}) \|^{2} = \left\{\begin{array}{ll} \frac{1}{2 \mu} \| \mathbf{x} \|^{2}, & \| \mathbf{x} \| \leq \mu, \\ \| \mathbf{x} \| - \frac{\mu}{2}, & \| \mathbf{x} \| > \mu.\end{array} \right.
$$

Thus, for any $\mu > 0$

$$
M_{\| \cdot \|}^{\mu} = H_{\mu}.
$$

Note that the Moreau envelope function is actually a result of an infimal convolution operation between the function $f$ and the function

$$
\omega_{\mu}(\mathbf{x}) = \frac{1}{2 \mu} \| \mathbf{x} \|^{2}.\tag{6.44}
$$

That is,

$$
M_{f}^{\mu} = f \Box \omega_{\mu}.
$$

One consequence of this observation is that by Theorem 2.19, if $f$ is a proper closed<sup>33</sup> and convex function, then $M_{f}^{\mu}$ is convex. We summarize the above discussion in the following theorem.

Theorem 6.55. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function, and let $\omega_{\mu}$ be given in (6.44), where $\mu > 0$ . Then

(a) ${\cal M}_{f}^{\mu} = f \sqcup \omega_{\mu}$

(b) $M_{f}^{\mu} : \mathbb{E} \mathbb{R}$ is real-valued and convex.

We can immediately conclude from Theorem $6.55(a)$ along with the formula for the conjugate of the infimal convolution (Theorem 4.16) an expression for the conjugate of the Moreau envelope.

Corollary 6.56. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function and let $\omega_{\mu}$ be given in (6.44), where $\mu > 0$ . Then

$$
(M_{f}^{\mu})^{*} = f^{*} + \omega_{\frac{1}{\mu}}.
$$

Another useful algebraic property of the Moreau envelope is described in the following result.

Lemma 6.57. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function, and let $\lambda, \mu > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\lambda M_{f}^{\mu}(\mathbf{x}) = M_{\lambda f}^{\mu / \lambda}(\mathbf{x}).\tag{6.45}
$$

Proof. For any $\mathbf{x} \in \mathbb{E}$

$$
\begin{array}{l} \lambda M_{f}^{\mu}(\mathbf{x}) = \lambda \min_{\mathbf{u}} \left\{f(\mathbf{u}) + \frac{1}{2 \mu} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} \\ = \min_{\mathbf{u}} \left\{\lambda f(\mathbf{u}) + \frac{1}{2 \mu / \lambda} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} \\ = M_{\lambda f}^{\mu / \lambda}(\mathbf{x}).\quad \square \end{array}
$$

A simple calculus rule states that the Moreau envelope of a separable sum of functions is the sum of the corresponding Moreau envelopes.

Theorem 6.58 (Moreau envelope of separable functions). Suppose that $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ , and let $f : \mathbb{E} \to(- \infty, \infty]$ be given by

$$
f \left(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{m}\right) = \sum_{i = 1}^{m} f_{i} \left(\mathbf{x}_{i}\right), \quad \mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \dots, \mathbf{x}_{m} \in \mathbb{E}_{m},
$$

with $f_{i} : \mathbb{E}_{i}(- \infty, \infty]$ being a proper closed and convex function for any $i.$ . Then given $\mu > 0$ , for any $\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \ldots, \mathbf{x}_{m} \in \mathbb{E}_{m}$

$$
M_{f}^{\mu}(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{m}) = \sum_{i = 1}^{m} M_{f_{i}}^{\mu}(\mathbf{x}_{i}).
$$

Proof. For any $\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \ldots, \mathbf{x}_{m} \in \mathbb{E}_{m}$ , denoting $\mathbf{x} = \left(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{m} \right)$ , we have

$$
\begin{array}{l} M_{f}^{\mu}(\mathbf{x}) = \min_{\mathbf{u}_{i} \in \mathbb{E}_{i}, i = 1, 2, \dots, m} \left\{f(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}) + \frac{1}{2 \mu} \|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}) - \mathbf{x} \|^{2} \right\} \\ = \min_{\mathbf{u}_{i} \in \mathbb{E}_{i}, i = 1, 2, \dots, m} \left\{\sum_{i = 1}^{m} f_{i}(\mathbf{u}_{i}) + \frac{1}{2 \mu} \sum_{i = 1}^{m} \| \mathbf{u}_{i} - \mathbf{x}_{i} \|^{2} \right\} \\ = \sum_{i = 1}^{m} \min_{\mathbf{u}_{i} \in \mathbb{E}_{i}} \left\{f_{i}(\mathbf{u}_{i}) + \frac{1}{2 \mu} \| \mathbf{u}_{i} - \mathbf{x}_{i} \|^{2} \right\} \\ = \sum_{i = 1}^{m} M_{f_{i}}^{\mu}(\mathbf{x}_{i}).\quad \square \end{array}
$$

Example 6.59 (Moreau envelope of the $l_{1}{\bf - norm)}$ . Consider the function $f$ : $\mathbb{R}^{n} \to \mathbb{R}$ given by $f(\mathbf{x}) = \| \mathbf{x} \|_{1}$ . Note that

$$
f(\mathbf{x}) = \| \mathbf{x} \|_{1} = \sum_{i = 1}^{n} g(x_{i}),
$$

where $g(t) = | t |$ . By Example 6.54, ${\cal M}_{g}^{\mu} ={\cal H}_{\mu}$ . Thus, invoking Theorem 6.58, we obtain that for any $\mathbf{x} \in \mathbb{R}^{n}$

$$
M_{f}^{\mu}(\mathbf{x}) = \sum_{i = 1}^{n} M_{g}^{\mu}(x_{i}) = \sum_{i = 1}^{n} H_{\mu}(x_{i}).
$$

## 6.7.2 Differentiability of the Moreau Envelope

The main Differentiability properties of the Moreau envelope function are stated in the next result.

Theorem 6.60 (smoothness of the Moreau envelope). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function. Let $\mu > 0$ . Then $\dot{M}_{f}^{\mu}$ is $\frac{1}{\mu} - smooth$ over $\mathbb{E}_{:}$ and for any $\mathbf{x} \in \mathbb{E}$ ,

$$
\nabla M_{f}^{\mu}(\mathbf{x}) = \frac{1}{\mu} \left(\mathbf{x} - \mathrm{prox}_{\mu f}(\mathbf{x})\right).
$$

Proof. By Theorem $6.55(a), M_{f}^{\mu} = f \sqcup \omega_{\mu}.$ where $\begin{array}{r}{\omega_{\mu} = \frac{1}{2 \mu} \| \cdot \|^{2}} \end{array}$ . We can therefore invoke Theorem 5.30, whose assumptions are satisfied (taking $\omega = \omega_{\mu}$ and $\begin{array}{r}{L = \frac{1}{\mu})} \end{array}$ and conclude that $M_{f}^{\mu}$ is $\textstyle{\frac{1}{\mu}}$ -smooth. In addition, since

$$
\operatorname{prox}_{\mu f}(\mathbf{x}) = \operatorname{argmin}_{\mathbf{u} \in \mathbb{E}} \left\{f(\mathbf{u}) + \frac{1}{2 \mu} \| \mathbf{u} - \mathbf{x} \|^{2} \right\},
$$

$$
\mathbf{u}(\mathbf{x})
$$

$$
\operatorname{prox}_{\mu f}(\mathbf{x})
$$

$$
\nabla M_{f}^{\mu}(\mathbf{x}) = \nabla \omega_{\mu}(\mathbf{x} - \mathbf{u}(\mathbf{x})) = \frac{1}{\mu}(\mathbf{x} - \mathrm{prox}_{\mu f}(\mathbf{x})).
$$

Example 6.61 (1-smoothness of $\scriptstyle{\frac{1}{2}} d_{C}^{2})$ . Let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set. Recall that by Example 6.53, $\begin{array}{r}{\frac{1}{2} d_{C}^{2} = M_{\delta_{C}}^{1}} \end{array}$ . Then by Theorem 6.60, $\textstyle{\frac{1}{2}} d_{C}^{2}$ is 1-smooth and

$$
\nabla \left(\frac{1}{2} d_{C}^{2}\right)(\mathbf{x}) = \mathbf{x} - \mathrm{prox}_{\delta_{C}}(\mathbf{x}) = \mathbf{x} - P_{C}(\mathbf{x}).
$$

Note that the above expression for the gradient was already derived in Example 3.31 and that the 1-smoothness of $\textstyle{\frac{1}{2}} d_{C}^{2}$ was already established twice in Examples 5.5 and 5.31.

Example 6.62 (smoothness of the Huber function). Recall that the Huber function is given by

$$
H_{\mu}(\mathbf{x}) = \left\{\begin{array}{ll} \frac{1}{2 \mu} \| \mathbf{x} \|^{2}, & \| \mathbf{x} \| \leq \mu, \\ \| \mathbf{x} \| - \frac{\mu}{2}, & \| \mathbf{x} \| > \mu.\end{array} \right.
$$

By Example 6.54, $H_{\mu} = M_{f}^{\mu}$ , where $f(\mathbf{x}) = \| \mathbf{x} \|$ . Then, by Theorem 6.60, $H_{\mu}$ is $\textstyle{\frac{1}{\mu}}$ -smooth and

$$
\begin{array}{l} \nabla H_{\mu}(\mathbf{x}) = \frac{1}{\mu} \left(\mathbf{x} - \operatorname{prox}_{\mu f}(\mathbf{x})\right) \\ \stackrel{{(*)}}{{=}} \frac{1}{\mu} \left(\mathbf{x} - \left(1 - \frac{\mu}{\max \{\| \mathbf{x} \|, \mu\}}\right) \mathbf{x}\right) \\ = \left\{\begin{array}{ll} \frac{1}{\mu} \mathbf{x}, & \| \mathbf{x} \| \leq \mu, \\ \frac{\mathbf{x}}{\| \mathbf{x} \|}, & \| \mathbf{x} \| > \mu, \end{array} \right.\end{array}
$$

where the equality (∗) uses the expression for $\operatorname{prox}_{\mu f}$ developed in Example 6.19. ■

## 6.7.3 Prox of the Moreau Envelope

An interesting and important result states that if we can compute the prox of a proper closed and convex function $f_{:}$ then we can also compute the prox of its Moreau envelope.

Theorem 6.63 (prox of Moreau envelope). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function, and let $\mu > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{M_{f}^{\mu}}(\mathbf{x}) = \mathbf{x} + \frac{1}{\mu + 1} \left(\operatorname{prox}_{(\mu + 1) f}(\mathbf{x}) - \mathbf{x}\right).
$$

Proof. First note that

$$
\min_{\mathbf{u}} \left\{M_{f}^{\mu}(\mathbf{u}) + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\} = \min_{\mathbf{u}} \min_{\mathbf{y}} \left\{f(\mathbf{y}) + \frac{1}{2 \mu} \| \mathbf{u} - \mathbf{y} \|^{2} + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.\tag{6.46}
$$

Exchanging the order of minimizations, we obtain the following problem:

$$
\min_{\mathbf{y}} \min_{\mathbf{u}} \left\{f(\mathbf{y}) + \frac{1}{2 \mu} \| \mathbf{u} - \mathbf{y} \|^{2} + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|^{2} \right\}.\tag{6.47}
$$

The optimal solution of the inner minimization problem in u is attained when the gradient w.r.t. u vanishes:

$$
\frac{1}{\mu}(\mathbf{u} - \mathbf{y}) +(\mathbf{u} - \mathbf{x}) = \mathbf{0},
$$

that is, when

$$
\mathbf{u} = \mathbf{u}_{\mu} \equiv \frac{\mu \mathbf{x} + \mathbf{y}}{\mu + 1}.\tag{6.48}
$$

Therefore, the optimal value of the inner minimization problem in (6.47) is

$$
\begin{array}{c} f(\mathbf{y}) + \frac{1}{2 \mu} \| \mathbf{u}_{\mu} - \mathbf{y} \|^{2} + \frac{1}{2} \| \mathbf{u}_{\mu} - \mathbf{x} \|^{2} = f(\mathbf{y}) + \frac{1}{2 \mu} \left\| \frac{\mu \mathbf{x} - \mu \mathbf{y}}{\mu + 1} \right\|^{2} + \frac{1}{2} \left\| \frac{\mathbf{y} - \mathbf{x}}{\mu + 1} \right\|^{2} \\ = f(\mathbf{y}) + \frac{1}{2(\mu + 1)} \| \mathbf{x} - \mathbf{y} \|^{2}.\end{array}
$$

Therefore, the optimal solution of (6.46) is given by (6.48), where y is the solution of

$$
\min_{\mathbf{y}} \left\{f(\mathbf{y}) + \frac{1}{2(\mu + 1)} \| \mathbf{x} - \mathbf{y} \|^{2} \right\},
$$

that is, $\mathbf{y} = \operatorname{prox}_{(\mu + 1) f}(\mathbf{x})$ . To summarize,

$$
\operatorname{prox}_{M_{f}^{\mu}}(\mathbf{x}) = \frac{1}{\mu + 1} \left(\mu \mathbf{x} + \operatorname{prox}_{(\mu + 1) f}(\mathbf{x})\right).\quad \square
$$

Combining Theorem 6.63 with Lemma 6.57 leads to the following corollary.

Corollary 6.64. Let $f : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function, and let $\lambda, \mu > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
\operatorname{prox}_{\lambda M_{f}^{\mu}}(\mathbf{x}) = \mathbf{x} + \frac{\lambda}{\mu + \lambda} \left(\operatorname{prox}_{(\mu + \lambda) f}(\mathbf{x}) - \mathbf{x}\right).
$$

$$
\text{Proof.} \operatorname{prox}_{\lambda M_{f}^{\mu}}(\mathbf{x}) = \operatorname{prox}_{M_{\lambda f}^{\mu / \lambda}}(\mathbf{x}) = \mathbf{x} + \frac{\lambda}{\mu + \lambda} \left(\operatorname{prox}_{(\mu + \lambda) f}(\mathbf{x}) - \mathbf{x}\right).\quad \square
$$

Example 6.65 (prox of $\scriptstyle{\frac{\lambda}{2}} d_{C}^{2})$ . Let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set, and let $\lambda > 0$ . Consider the function $\begin{array}{r}{f = \frac{1}{2} d_{C}^{2}} \end{array}$ . Then, by Example 6.53, $f = M_{g}^{1}$ where $g = \delta_{C}$ . Recall that $\mathrm{prox}_{g} = P_{C}$ . Therefore, invoking Corollary 6.64, we obtain that for any $\mathbf{x} \in \mathbb{E}$ 44

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \operatorname{prox}_{\lambda M_{g}^{1}}(\mathbf{x}) = \mathbf{x} + \frac{\lambda}{\lambda + 1} \left(\operatorname{prox}_{(\lambda + 1) g}(\mathbf{x}) - \mathbf{x}\right) = \mathbf{x} + \frac{\lambda}{\lambda + 1} \left(P_{C}(\mathbf{x}) - \mathbf{x}\right).
$$

To conclude,

$$
\mathrm{prox}_{\frac{\lambda}{2} d_{C}^{2}}(\mathbf{x}) = \frac{\lambda}{\lambda + 1} P_{C}(\mathbf{x}) + \frac{1}{\lambda + 1} \mathbf{x}.
$$

Example 6.66 (prox of the Huber function). Consider the function

$$
f(\mathbf{x}) = \lambda H_{\mu}(\mathbf{x}),
$$

where $H_{\mu}$ is the Huber function with a smoothing parameter $\mu > 0$ given in (6.43). By Example 6.54, $H_{\mu} = M_{q}^{\mu}$ , where $g(\mathbf{x}) = \| \mathbf{x} \|$ . Therefore, by Corollary 6.64, it follows that for any $\lambda > 0$ and $\mathbf{x} \in \mathbb{E}$ (recalling the expression for the prox of the Euclidean norm derived in Example 6.19),

$$
\begin{array}{r} \mathrm{prox}_{\lambda H_{\mu}}(\mathbf{x}) = \mathrm{prox}_{\lambda M_{g}^{\mu}}(\mathbf{x}) = \mathbf{x} + \frac{\lambda}{\mu + \lambda} \left(\mathrm{prox}_{(\mu + \lambda) g}(\mathbf{x}) - \mathbf{x}\right) \\ = \mathbf{x} + \frac{\lambda}{\mu + \lambda} \left(\left(1 - \frac{\mu + \lambda}{\max \{\| \mathbf{x} \|, \mu + \lambda\}}\right) \mathbf{x} - \mathbf{x}\right), \end{array}
$$

which, after some algebraic cancellations, reduces to

$$
\operatorname{prox}_{\lambda H_{\mu}}(\mathbf{x}) = \left(1 - \frac{\lambda}{\max \{\| \mathbf{x} \|, \mu + \lambda\}}\right) \mathbf{x}.
$$

Similarly to the Moreau decomposition formula for the prox operator (Theorem 6.45), we can obtain a decomposition formula for the Moreau envelope function.

Theorem 6.67 (Moreau envelope decomposition). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function, and let $\mu > 0$ . Then for any $\mathbf{x} \in \mathbb{E}$

$$
M_{f}^{\mu}(\mathbf{x}) + M_{f^{*}}^{1 / \mu}(\mathbf{x} / \mu) = \frac{1}{2 \mu} \| \mathbf{x} \|^{2}.
$$

Proof. Recall that for any $\mathbf{x} \in \mathbb{E}$

$$
M_{f}^{\mu}(\mathbf{x}) = \min_{\mathbf{u} \in \mathbb{E}} \left\{f(\mathbf{u}) + \psi(\mathbf{u}) \right\},
$$

where $\begin{array}{r}{\psi(\mathbf{u}) \equiv \frac{1}{2 \mu} \| \mathbf{u} - \mathbf{x} \|^{2}} \end{array}$ . By Fenchel’s duality theorem (Theorem 4.15), we have

$$
M_{f}^{\mu}(\mathbf{x}) = \max_{\mathbf{v} \in \mathbb{E}} \left\{- f^{*}(\mathbf{v}) - \psi^{*}(- \mathbf{v}) \right\} = - \min_{\mathbf{v} \in \mathbb{E}} \left\{f^{*}(\mathbf{v}) + \psi^{*}(- \mathbf{v}) \right\}.
$$

Denote $\begin{array}{r}{\phi(\cdot) = \frac{1}{2} \| \cdot - \mathbf{x} \|^{2}} \end{array}$ . Then

$$
\phi^{*}(\mathbf{v}) = \frac{1}{2} \| \mathbf{v} \|^{2} + \langle \mathbf{x}, \mathbf{v} \rangle.
$$

Since $\begin{array}{r}{\psi = \frac{1}{\mu} \phi} \end{array}$ , it follows by Theorem 4.14 that

$$
\psi^{*}(\mathbf{v}) = \frac{1}{\mu} \phi^{*}(\mu \mathbf{v}) = \frac{\mu}{2} \| \mathbf{v} \|^{2} + \langle \mathbf{x}, \mathbf{v} \rangle.
$$

Therefore,

$$
M_{f}^{\mu}(\mathbf{x}) = - \min_{\mathbf{v} \in \mathbb{E}} \left\{f^{*}(\mathbf{v}) + \frac{\mu}{2} \| \mathbf{v} \|^{2} - \langle \mathbf{x}, \mathbf{v} \rangle \right\},
$$

and hence

$$
M_{f}^{\mu}(\mathbf{x}) = - \min_{\mathbf{v} \in \mathbb{E}} \left\{f^{*}(\mathbf{v}) + \frac{\mu}{2} \| \mathbf{v} - \mathbf{x} / \mu \|^{2} - \frac{1}{2 \mu} \| \mathbf{x} \|^{2} \right\} = \frac{1}{2 \mu} \| \mathbf{x} \|^{2} - M_{f^{*}}^{1 / \mu}(\mathbf{x} / \mu),
$$

establishing the desired result.

## 6.8 Miscellaneous Prox Computations

In this section we gather several examples of prox computations that are not linked to any specific result established in this chapter.

## 6.8.1 Norm of a Linear Transformation over $\mathbb{R}^{n}$

Lemma 6.68. Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{Ax} \|_{2}$ , where $\mathbf{A} \in \mathbb{R}^{m \times n}$ is with full row rank, and $let \lambda > 0$ . Then

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T})^{- 1} \mathbf{Ax}, & \|(\mathbf{AA}^{T})^{- 1} \mathbf{Ax} \|_{2} \leq \lambda, \\ \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T} + \alpha^{*} \mathbf{I})^{- 1} \mathbf{Ax}, & \|(\mathbf{AA}^{T})^{- 1} \mathbf{Ax} \|_{2} > \lambda, \end{array} \right.
$$

where $\alpha^{*}$ is the unique positive root of the decreasing function

$$
g(\alpha) = \|(\mathbf{A} \mathbf{A}^{T} + \alpha \mathbf{I})^{- 1} \mathbf{Ax} \|_{2}^{2} - \lambda^{2}.
$$

Proof. The vector $\mathrm{prox}_{\lambda f}(\mathbf{x})$ is the unique optimal solution to

$$
\min_{\mathbf{u} \in \mathbb{R}^{n}} \left\{\lambda \| \mathbf{Au} \|_{2} + \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} \right\},
$$

which can also be rewritten as

$$
\min_{\mathbf{u} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{m}} \left\{\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} + \lambda \| \mathbf{z} \|_{2}: \mathbf{z} = \mathbf{Au} \right\}.\tag{6.49}
$$

To construct a Lagrangian dual problem, we first form the Lagrangian:

$$
\begin{array}{c} L(\mathbf{u}, \mathbf{z}; \mathbf{y}) = \frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} + \lambda \| \mathbf{z} \|_{2} + \mathbf{y}^{T}(\mathbf{z} - \mathbf{Au}) \\ = \left[\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} -(\mathbf{A}^{T} \mathbf{y})^{T} \mathbf{u} \right] + \left[\lambda \| \mathbf{z} \|_{2} + \mathbf{y}^{T} \mathbf{z} \right].\end{array}
$$

Since the Lagrangian is separable w.r.t. u and $\mathbf{z},$ the dual objective function can be rewritten as

$$
\min_{\mathbf{u}, \mathbf{z}} L(\mathbf{u}, \mathbf{z}; \mathbf{y}) = \min_{\mathbf{u}} \left[\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} -(\mathbf{A}^{T} \mathbf{y})^{T} \mathbf{u} \right] + \min_{\mathbf{z}} \left[\lambda \| \mathbf{z} \|_{2} + \mathbf{y}^{T} \mathbf{z} \right].\tag{6.50}
$$

The minimizer of the minimization problem in u is $\tilde{\mathbf{u}} = \mathbf{x} + \mathbf{A}^{T} \mathbf{y}$ with a corresponding optimal value of

$$
\begin{array}{c} \min_{\mathbf{u}} \left[\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} -(\mathbf{A}^{T} \mathbf{y})^{T} \mathbf{u} \right] = \frac{1}{2} \| \tilde{\mathbf{u}} - \mathbf{x} \|_{2}^{2} -(\mathbf{A}^{T} \mathbf{y})^{T} \tilde{\mathbf{u}} \\ = - \frac{1}{2} \mathbf{y}^{T} \mathbf{A} \mathbf{A}^{T} \mathbf{y} -(\mathbf{Ax})^{T} \mathbf{y}.\end{array}\tag{6.51}
$$

As for the second minimization problem, note that

$$
\min_{\mathbf{z}} \left[\lambda \| \mathbf{z} \|_{2} + \mathbf{y}^{T} \mathbf{z} \right] = - \max_{\mathbf{z}}[(- \mathbf{y})^{T} \mathbf{z} - \lambda \| \mathbf{z} \|_{2}] = - g^{*}(- \mathbf{y}),
$$

where $g(\cdot) = \lambda \| \cdot \|_{2}$ . Since $g^{*}(\mathbf{w}) = \lambda \delta_{B_{\| \cdot \|_{2}}[\mathbf{0}, 1]}(\mathbf{w} / \lambda) = \delta_{B_{\| \cdot \|_{2}}[\mathbf{0}, \lambda]}$ (see Section <sup>2</sup>4.4.12 and Theorem 4.14), we can conclude that

$$
\min_{\mathbf{z}} \left[\lambda \| \mathbf{z} \|_{2} + \mathbf{y}^{T} \mathbf{z} \right] = \left\{\begin{array}{ll} 0, & \| \mathbf{y} \|_{2} \leq \lambda, \\ - \infty, & \| \mathbf{y} \|_{2} > \lambda.\end{array} \right.
$$

Combining this with (6.51), we obtain the following dual problem:

$$
\max_{\mathbf{y} \in \mathbb{R}^{m}} \left\{- \frac{1}{2} \mathbf{y}^{T} \mathbf{A} \mathbf{A}^{T} \mathbf{y} -(\mathbf{Ax})^{T} \mathbf{y}: \| \mathbf{y} \|_{2} \leq \lambda \right\}.\tag{6.52}
$$

Note that strong duality holds for the primal-dual pair of problems (6.49) and (6.52) (see Theorem A.1). To solve problem (6.52), we will first rewrite it as a minimization problem:

$$
\min_{\mathbf{y} \in \mathbb{R}^{m}} \left\{\frac{1}{2} \mathbf{y}^{T} \mathbf{A} \mathbf{A}^{T} \mathbf{y} +(\mathbf{Ax})^{T} \mathbf{y}: \| \mathbf{y} \|_{2}^{2} \leq \lambda^{2} \right\}.\tag{6.53}
$$

So far we have shown that

$$
\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} + \mathbf{A}^{T} \mathbf{y},\tag{6.54}
$$

where $\mathbf{y}$ is an optimal solution of problem (6.53). Since problem (6.53) is convex and satisfies Slater’s condition, it follows by the KKT conditions that y is an optimal solution of (6.53) if and only if there exists $\alpha^{*}$ (optimal dual variable) for which

$$
(\mathbf{A} \mathbf{A}^{T} + \alpha^{*} \mathbf{I}) \mathbf{y} + \mathbf{Ax} = \mathbf{0},\tag{6.55}
$$

$$
\alpha^{*}(\| \mathbf{y} \|_{2}^{2} - \lambda^{2}) = 0,\tag{6.56}
$$

$$
\| \mathbf{y} \|_{2}^{2} \leq \lambda^{2},\tag{6.57}
$$

$$
\alpha^{*} \geq 0.\tag{6.58}
$$

There are two options. In the first, $\alpha^{*} = 0$ , and then by (6.55),

$$
\mathbf{y} = - \left(\mathbf{AA}^{T}\right)^{- 1} \mathbf{Ax}.\tag{6.59}
$$

Since (6.56) and (6.58) are automatically satisfied for $\alpha^{*} = 0$ , we can conclude that y given in (6.59) is the optimal solution of (6.53) if and only if (6.57) is satisfied, meaning if and only if $\|(\mathbf{A} \mathbf{A}^{T})^{- 1} \mathbf{A} \mathbf{x} \|_{2} \leq \lambda$ In this case, by (6.54), $\operatorname{prox}_{\lambda f}(\mathbf{x}) = \mathbf{x} - \mathbf{A}^{T}(\mathbf{A} \mathbf{A}^{T})^{- 1} \mathbf{A} \mathbf{x}.$

On the other hand, if $\|(\mathbf{A} \mathbf{A}^{T})^{- 1} \mathbf{A} \mathbf{x} \|_{2} > \lambda$ then $\alpha^{*} > 0$ , and hence by the complementary slackness condition (6.56),

$$
\| \mathbf{y} \|_{2}^{2} = \lambda^{2}.\tag{6.60}
$$

By (6.55),

$$
\mathbf{y} = -(\mathbf{AA}^{T} + \alpha^{*} \mathbf{I})^{- 1} \mathbf{Ax}.
$$

Using (6.60), we can conclude that $\alpha^{*}$ can be uniquely determined as the positive root of the function

$$
g(\alpha) = \|(\mathbf{A} \mathbf{A}^{T} + \alpha \mathbf{I})^{- 1} \mathbf{Ax} \|_{2}^{2} - \lambda^{2}.
$$

It is easy to see that $g$ is strictly decreasing for $\alpha \geq 0$ , and therefore $g$ has a unique root.

## 6.8.2 Squared $l_{1} \mathbf{- Norm}$

The prox of the $l_{1}{\mathrm{- norm}}$ has a simple formula. In this section we will show how to compute the prox of the squared $l_{1}{\mathrm{- norm}}{\mathrm{- a}}$ task that will prove itself to be much more complicated. We will require the following lemma that expresses $\| \mathbf{x} \|_{1}^{2}$ as the optimal value of an optimization problem written in terms of the function

$$
\varphi(s, t) = \left\{\begin{array}{ll} \frac{s^{2}}{t}, & t > 0, \\ 0, & s = 0, t = 0, \\ \infty & \text{else}.\end{array} \right.\tag{6.61}
$$

By Example 2.32, $\varphi$ is closed and convex (even though it is not continuous at $(s, t) =(0, 0))$ .

Lemma 6.69 (variational representation of $\| \cdot \|_{1}^{2})$ . For any $\mathbf{x} \in \mathbb{R}^{n}$ the following holds:

$$
\min_{\boldsymbol{\lambda} \in \Delta_{n}} \sum_{j = 1}^{n} \varphi(x_{j}, \lambda_{j}) = \| \mathbf{x} \|_{1}^{2},\tag{6.62}
$$

where $\varphi$ is defined in (6.61). An optimal solution of the minimization problem in (6.62) is given by

$$
\tilde{\lambda}_{j} = \left\{\begin{array}{ll} \frac{| x_{j} |}{\| \mathbf{x} \|_{1}}, & \mathbf{x} \neq \mathbf{0}, \\ \frac{1}{n}, & \mathbf{x} = \mathbf{0}, \end{array} \right.\quad j = 1, 2, \ldots, n.\tag{6.63}
$$

Proof. Since problem (6.62) consists of minimizing a closed and convex function (by Example 2.32) over a compact set, then by the Weierstrass theorem for closed functions (Theorem 2.12), it possesses an optimal solution, which we denote by $\boldsymbol{\lambda}^{*} \in \Delta_{n}$ . Define

$$
\begin{array}{l}{I_{0} = \{i \in \{1, 2, \ldots, n\}: \lambda_{i}^{*} = 0\},} \\{I_{1} = \{i \in \{1, 2, \ldots, n\}: \lambda_{i}^{*} > 0\}.} \end{array}
$$

By the definitions of $I_{0}$ and $I_{1}$ , we have

$$
\sum_{i \in I_{1}} \lambda_{j}^{*} = \sum_{i = 1}^{n} \lambda_{j}^{*} = 1.\tag{6.64}
$$

It holds that $x_{i} = 0$ for any $i \in I_{0}$ , since otherwise we will have that $\varphi(x_{i}, \lambda_{i}^{*}) = \infty.$ which is a clear contradiction to the optimality of $\lambda^{*}$ . Therefore, using the Cauchy– Schwarz inequality,

$$
\sum_{j = 1}^{n} | x_{j} | = \sum_{j \in I_{1}} | x_{j} | = \sum_{j \in I_{1}} \frac{| x_{j} |}{\sqrt{\lambda_{j}^{*}}} \sqrt{\lambda_{j}^{*}} \leq \sqrt{\sum_{j \in I_{1}} \frac{x_{j}^{2}}{\lambda_{j}^{*}}} \cdot \sqrt{\sum_{j \in I_{1}} \lambda_{j}^{*}} \stackrel{(6.64)}{=} \sqrt{\sum_{j \in I_{1}} \frac{x_{j}^{2}}{\lambda_{j}^{*}}}.
$$

We can thus conclude that

$$
\sum_{j = 1}^{n} \varphi(x_{j}, \lambda_{j}^{*}) = \sum_{j \in I_{1}} \varphi(x_{j}, \lambda_{j}^{*}) = \sum_{j \in I_{1}} \frac{x_{j}^{2}}{\lambda_{j}^{*}} \geq \| \mathbf{x} \|_{1}^{2}.\tag{6.65}
$$

On the other hand, since $\lambda^{*}$ is an optimal solution of the problem in (6.62),

$$
\sum_{j = 1}^{n} \varphi(x_{j}, \lambda_{j}^{*}) \leq \sum_{j = 1}^{n} \varphi(x_{j}, \tilde{\lambda}_{j}) = \| \mathbf{x} \|_{1}^{2},\tag{6.66}
$$

where $\tilde{\lambda}$ is $\mathrm{gi}$ ven by (6.63). Combining (6.65) and (6.66), we finally conclude that the optimal value of the minimization problem in (6.62) is $\| \mathbf{x} \|_{1}^{2}$ and that $\tilde{\lambda}$ is an optimal solution.

Lemma 6.70 (prox of $\| \cdot \|_{1}^{2}).^{34}$ Let $f : \mathbb{R}^{n} \mathbb{R}$ be given by $f(\mathbf{x}) = \| \mathbf{x} \|_{1}^{2}$ , and let $\rho > 0$ . Then

$$
\operatorname{prox}_{\rho f}(\mathbf{x}) = \left\{\begin{array}{ll} \left(\frac{\lambda_{i} x_{i}}{\lambda_{i} + 2 \rho}\right)_{i = 1}^{n}, & \mathbf{x} \neq \mathbf{0}, \\ \mathbf{0}, & \mathbf{x} = \mathbf{0}, \end{array} \right.
$$

where $\begin{array}{r}{\lambda_{i} ~ = ~ \left[\frac{\sqrt{\rho} | x_{i} |}{\sqrt{\mu^{*}}} - 2 \rho \right]_{+}} \end{array}$ with $\mu^{*}$ being any positive root of the nonincreasing function

$$
\psi(\mu) = \sum_{i = 1}^{n} \left[\frac{\sqrt{\rho} | x_{i} |}{\sqrt{\mu}} - 2 \rho \right]_{+} - 1.
$$

Proof. $\mathrm{If} \ \mathbf{x} = \ \mathbf{0}$ , then obviously pro ${\mathrm{~ \bar{\s} ~}}_{\rho f}({\bf{x}}) \ = \ \operatorname{argmin}_{\bf{u}} \left\{\frac{1}{2} \|{\bf{u}} \|_{2}^{2} + \rho \|{\bf{u}} \|_{1}^{2} \right\} \ = \{\bf{0}}$ Assume that $\mathbf{x} \neq \mathbf{0}$ . By Lemma 6.69, $\mathbf{u} \overset{\cdot}{=} \operatorname{prox}_{\rho f}(\mathbf{x})$ if and only if it is the u-part of the optimal solution of

$$
\min_{\mathbf{u} \in \mathbb{R}^{n}, \boldsymbol{\lambda} \in \Delta_{n}} \left\{\frac{1}{2} \| \mathbf{u} - \mathbf{x} \|_{2}^{2} + \rho \sum_{i = 1}^{n} \varphi(u_{i}, \lambda_{i}) \right\},
$$

where $\varphi$ is defined in (6.61). Minimizing first with respect to u, we obtain that $\begin{array}{r}{u_{i} = \frac{\lambda_{i} x_{i}}{\lambda_{i} + 2 \rho}} \end{array}$ , and the problem thus reduces to

$$
\begin{array}{ll} \min_{\boldsymbol{\lambda}} & \sum_{i = 1}^{n} \frac{\rho x_{i}^{2}}{\lambda_{i} + 2 \rho} \\ \text{s.t.} & \mathbf{e}^{T} \boldsymbol{\lambda} = 1, \\ & \boldsymbol{\lambda} \geq \mathbf{0}.\end{array}\tag{6.67}
$$

By Theorem $\mathrm{A.1}$ , strong duality holds for problem (6.67) (taking the underlying set as $X = \mathbb{R}_{+}^{n})$ . Associating a Lagrange multiplier $\mu$ to the equality constraint, the Lagrangian is

$$
L(\pmb{\lambda}; \mu) = \sum_{i = 1}^{n} \left(\frac{\rho x_{i}^{2}}{\lambda_{i} + 2 \rho} + \lambda_{i} \mu\right) - \mu.
$$

By Theorem A.2, $\lambda^{*}$ is an optimal solution of (6.67) if and only if there exists $\mu^{*}$ for which

$$
\boldsymbol{\lambda}^{*} \in \operatorname{argmin}_{\boldsymbol{\lambda} \geq \mathbf{0}} L(\boldsymbol{\lambda}; \mu^{*}),\tag{6.68}
$$

$$
\mathbf{e}^{T} \pmb{\lambda}^{*} = 1.\tag{6.69}
$$

Since the minimum in (6.68) is finite and attained, and since $\mathbf{x} \neq \mathbf{0},$ , it follows that $\mu^{*} > 0$ (otherwise, if $\mu^{*} = 0$ , the minimum in (6.68) would not be attained). Exploiting the separability of the Lagrangian, it follows that (6.68) is the same as

$$
\lambda_{i}^{*} = \left[\frac{\sqrt{\rho} | x_{i} |}{\sqrt{\mu}} - 2 \rho \right]_{+}.
$$

The dual optimal variable $\mu^{*}$ is chosen to satisfy (6.69):

$$
\sum_{i = 1}^{n} \left[\frac{\sqrt{\rho} | x_{i} |}{\sqrt{\mu}} - 2 \rho \right]_{+} = 1.\quad \square
$$

## 6.8.3 Projection onto the Set of s-Sparse Vectors

Let $s \in \{1, 2, \ldots, n\}$ and consider the set

$$
C_{s} = \left\{\mathbf{x} \in \mathbb{R}^{n}: \| \mathbf{x} \|_{0} \leq s \right\}.
$$

The set $C_{s}$ comprises all s-sparse vectors, meaning all vectors with at most s nonzero elements. Obviously $C_{s}$ is not convex; for example, for $n = 2,(0, 1)^{T},(1, 0)^{T} \in C_{1}$ but $(0.5, 0.5)^{T} = 0.5(0, 1)^{T} + 0.5(1, 0)^{T} \notin C_{1}$ . The set $C_{s}$ is closed as a level set of the closed function $\| \cdot \|_{0}$ (see Example 2.11). Therefore, by Theorem 6.4, $P_{C_{s}} = \mathrm{prox}_{\delta_{C}}$ is nonempty; however, the nonconvexity of $C_{s}$ implies that $P_{C_{s}}(\mathbf{x})$ is not necessarily a singleton.

The set $P_{C_{s}}(\mathbf{x})$ is described in Lemma 6.71 below. The description requires some additional notation. For a vector $\mathbf{x} \in \mathbb{R}^{n}$ and a set of indices $S \subseteq \{1, 2, \ldots, n\}$ ， the vector $\mathbf{x}_{S}$ is the subvector of x that corresponds to the indices in S. For example, for $n = 4, \mathrm{if} \ \mathbf{x} =(4, 3, 5, - 1)^{T}$ , then $\mathbf{x}_{\{1, 4\}} =(4, - 1)^{T}, \mathbf{x}_{\{2, 3\}} =(3, 5)^{T}$ . For a given indices set $S \subseteq \{1, 2, \dots, n\}$ , the matrix $\mathbf{U}_{S}$ is the submatrix of the identity matrix ${\mathbf I}_{n}$ comprising the columns corresponding to the indices in S. For example, for $n = 3$ ，

$$
\mathbf{U}_{\{1, 3\}} = \left(\begin{array}{cc} 1 & 0 \\ 0 & 0 \\ 0 & 1 \end{array} \right), \qquad \mathbf{U}_{\{2\}} = \left(\begin{array}{c} 0 \\ 1 \\ 0 \end{array} \right).
$$

For a given indices set $S \subseteq \{1, 2, \ldots, n\}$ , the complement set $S^{c}$ is given by $S^{c} =$ $\{1, 2, \ldots, n\} \setminus S$

Finally, we recall our notation (that was also used in Example 6.51) that for a given $\mathbf{x} \in \mathbb{R}^{n}, x_{\langle i \rangle}$ is the ith largest value among $\vert x_{1} \vert, \vert x_{2} \vert, \dots, \vert x_{n} \vert$ . Therefore, in particular, $| x_{\langle 1 \rangle} | \geq | x_{\langle 2 \rangle} | \geq \cdot \cdot \cdot \geq | x_{\langle n \rangle} |$ . Lemma 6.71 shows that $P_{C_{s}}(\mathbf{x})$ comprises all vectors consisting of the s components of x with the largest absolute values and with zeros elsewhere. There may be several choices for the s components with largest absolute values, and this is why $P_{C_{s}}(\mathbf{x})$ might consist of several vectors. Note that in the statement of the lemma, we characterize the property of an index set $S$ to “comprise s indices corresponding to the s largest absolute values in $\mathbf{x}^{\mathfrak{N}}$ by the relation

$$
S \subseteq \{1, 2, \dots, n\}, \quad | S | = s, \quad \sum_{i \in S} | x_{i} | = \sum_{i = 1}^{s} | x_{\langle i \rangle} |.
$$

Lemma 6.71 (projection onto $C_{s})$ . Let $s \in \{1, 2, \ldots, n\}$ and $\mathbf{x} \in \mathbb{R}^{n}$ . Then

$$
P_{C_{s}}(\mathbf{x}) = \left\{\mathbf{U}_{S} \mathbf{x}_{S}: | S | = s, S \subseteq \{1, 2, \dots, n\}, \sum_{i \in S} | x_{i} | = \sum_{i = 1}^{s} | x_{\langle i \rangle} | \right\}.
$$

Proof. Since $C_{s}$ consists of all s-sparse vectors, it can be represented as the following union:

$$
C_{s} = \bigcup_{S \subseteq \{1, 2, \dots, n\}, | S | = s} A_{S},
$$

where $A_{S} = \left\{\mathbf{x} \in \mathbb{R}^{n} : \mathbf{x}_{S^{c}} = \mathbf{0} \right\}$ . Therefore,<sup>35</sup>

$$
P_{C_{s}}(\mathbf{x}) \subseteq \bigcup_{S \subseteq \{1, 2, \dots, n\}, | S | = s} \left\{P_{A_{S}}(\mathbf{x}) \right\}.\tag{6.70}
$$

The vectors in $P_{C_{s}}(\mathbf{x})$ will be the vectors $P_{A_{S}}(\mathbf{x})$ with the smallest possible value of $\| P_{A_{S}}(\mathbf{x}) - \mathbf{x} \|^{2}$ . The vector $P_{A_{S}}(\mathbf{x})$ is the optimal solution of the problem

$$
\min_{\mathbf{y} \in \mathbb{R}^{n}} \left\{\| \mathbf{y} - \mathbf{x} \|_{2}^{2}: \mathbf{y}_{S^{c}} = \mathbf{0} \right\},
$$

which can be rewritten as

$$
\min_{\mathbf{y} \in \mathbb{R}^{n}} \left\{\| \mathbf{y}_{S} - \mathbf{x}_{S} \|_{2}^{2} + \| \mathbf{x}_{S^{c}} \|_{2}^{2}: \mathbf{y}_{S^{c}} = \mathbf{0} \right\}.
$$

The optimal solution of the above problem is obviously given by $\mathbf{y}_{S} = \mathbf{x}_{S}, \mathbf{y}_{S^{c}} = \mathbf{0}$ 9 that is, $\mathbf{y} = \mathbf{U}_{S} \mathbf{x}_{S}$ , and the optimal value is $\| \mathbf{x}_{S^{c}} \|_{2}^{2}$ . The vectors in $P_{C_{s}}(\mathbf{x})$ will therefore be of the form $\mathbf{U}_{S} \mathbf{x}_{S}$ , with indices sets S with cardinality s and with minimal value $\| \mathbf{x}_{S^{c}} \|_{2}^{2}$ , which is equivalent to the condition that S consists of s indices corresponding to the s largest absolute values in x.

Example 6.72. Suppose that $n = 4$ . Then

$$
P_{C_{2}}[(2, 3, - 2, 1)^{T}] = \{(2, 3, 0, 0)^{T},(0, 3, - 2, 0)^{T}\}.
$$

6.9 Summary of Prox Computations

<table><tr><td>f(x)</td><td>dom(f)</td><td>prox $_{f}$ (x)</td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x}+\mathbf{b}^{T}\mathbf{x}+c$ </td><td> $\mathbb{R}^{n}$ </td><td> $(\mathbf{A}+\mathbf{I})^{-1}(\mathbf{x}-\mathbf{b})$ </td><td> $\mathbf{A}\in\mathbb{S}_{+}^{n},\mathbf{b}\in\mathbb{R}^{n},c\in\mathbb{R}$ </td><td>Section 6.2.3</td></tr><tr><td> $\lambda x^{3}$ </td><td> $\mathbb{R}_{+}$ </td><td> $\frac{-1+\sqrt{1+12\lambda[x]_{+}}}{6\lambda}$ </td><td> $\lambda>0$ </td><td>Lemma 6.5</td></tr><tr><td> $\mu x$ </td><td> $[0,\alpha]\cap\mathbb{R}$ </td><td> $\min\{\max\{x-\mu,0\},\alpha\}$ </td><td> $\mu\in\mathbb{R},\alpha\in[0,\infty]$ </td><td>Example 6.14</td></tr><tr><td> $\lambda\|\mathbf{x}\|$ </td><td> $\mathbb{E}$ </td><td> $\left(1-\frac{\lambda}{\max\{\|\mathbf{x}\|,\lambda\}}\right)\mathbf{x}$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0$ </td><td>Example 6.19</td></tr><tr><td> $-\lambda\|\mathbf{x}\|$ </td><td> $\mathbb{E}$ </td><td> $\left(1+\frac{\lambda}{\|\mathbf{x}\|}\right)\mathbf{x},\quad\mathbf{x}\neq\mathbf{0},\quad\{\mathbf{u}:\|\mathbf{u}\|=\lambda\},\quad\mathbf{x}=\mathbf{0}.$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0$ </td><td>Example 6.21</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{1}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathcal{T}_{\lambda}(\mathbf{x})=[|\mathbf{x}|-\lambda\mathbf{e}]_{+}\odot\operatorname{sgn}(\mathbf{x})$ </td><td> $\lambda>0$ </td><td>Example 6.8</td></tr><tr><td> $\|\boldsymbol{\omega}\odot\mathbf{x}\|_{1}$ </td><td> $\text{Box}[-\boldsymbol{\alpha},\boldsymbol{\alpha}]$ </td><td> $\mathcal{S}_{\boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x})$ </td><td> $\boldsymbol{\alpha}\in[0,\infty]^{n},\boldsymbol{\omega}\in\mathbb{R}_{+}^{n}$ </td><td>Example 6.23</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{\infty}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{B_{\|\cdot\|_{1}}[\mathbf{0},1]}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0$ </td><td>Example 6.48</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{a}$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}-\lambda P_{B_{\|\cdot\|_{a},*}}[\mathbf{0},1](\mathbf{x}/\lambda)$ </td><td> $\|\mathbf{x}\|_{a}—arbitrarynorm,\lambda>0$ </td><td>Example 6.47</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{0}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathcal{H}_{\sqrt{2\lambda}}(x_{1})\times\cdots\times\mathcal{H}_{\sqrt{2\lambda}}(x_{n})$ </td><td> $\lambda>0$ </td><td>Example 6.10</td></tr><tr><td> $\lambda\|\mathbf{x}\|^{3}$ </td><td> $\mathbb{E}$ </td><td> $\frac{2}{1+\sqrt{1+12\lambda\|\mathbf{x}\|}}\mathbf{x}$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0,$ </td><td>Example 6.20</td></tr><tr><td> $-\lambda\sum_{j=1}^{n}\log x_{j}$ </td><td> $\mathbb{R}_{++}^{n}$ </td><td> $\left(\frac{x_{j}+\sqrt{x_{j}^{2}+4\lambda}}{2}\right)_{j=1}^{n}$ </td><td> $\lambda>0$ </td><td>Example 6.9</td></tr><tr><td> $\delta_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $P_{C}(\mathbf{x})$ </td><td> $\emptyset\neq C\subseteq\mathbb{E}$ </td><td>Theorem 6.24</td></tr><tr><td> $\lambda\sigma_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0,C\neq\emptyset$ closed convex</td><td>Theorem 6.46</td></tr><tr><td> $\lambda\max\{x_{i}\}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{\Delta n}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0$ </td><td>Example 6.49</td></tr><tr><td> $\lambda\sum_{i=1}^{k}x_{[i]}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda),\quad C=H_{\mathbf{e},k}\cap\text{Box}[\mathbf{0},\mathbf{e}]$ </td><td> $\lambda>0$ </td><td>Example 6.50</td></tr><tr><td> $\lambda\sum_{i=1}^{k}|x_{\langle i\rangle}|$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda),\quad C=B_{\|\cdot\|_{1}}[\mathbf{0},k]\cap\text{Box}[-\mathbf{e},\mathbf{e}]$ </td><td> $\lambda>0$ </td><td>Example 6.51</td></tr><tr><td> $\lambda M_{f}^{\mu}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}+\frac{\lambda}{\mu+\lambda}\left(\text{prox}_{(\mu+\lambda)f}(\mathbf{x})-\mathbf{x}\right)$ </td><td> $\lambda,\mu>0,f$ proper closed convex</td><td>Corollary 6.64</td></tr><tr><td> $\lambda d_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}+\min\left\{\frac{\lambda}{d_{C}(\mathbf{x})},1\right\}(P_{C}(\mathbf{x})-\mathbf{x})$ </td><td> $\emptyset\neq C$ closed convex,  $\lambda>0$ </td><td>Lemma 6.43</td></tr><tr><td> $\frac{\lambda}{2}d_{C}^{2}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\frac{\lambda}{\lambda+1}P_{C}(\mathbf{x})+\frac{1}{\lambda+1}\mathbf{x}$ </td><td> $\emptyset\neq C$ closed convex,  $\lambda>0$ </td><td>Example 6.65</td></tr><tr><td> $\lambda H_{\mu}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\left(1-\frac{\lambda}{\max\{\|\mathbf{x}\|,\mu+\lambda\}}\right)\mathbf{x}$ </td><td> $\lambda,\mu>0$ </td><td>Example 6.66</td></tr><tr><td> $\rho\|\mathbf{x}\|_{1}^{2}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\left(\frac{v_{i}x_{i}}{v_{i}+2\rho}\right)_{i=1}^{n},\mathbf{v}=\left[\sqrt{\frac{\nu}{\mu}}|\mathbf{x}|-2\rho\right]_{+},\mathbf{e}^{T}\mathbf{v}=1(0when \mathbf{x}=0)$ </td><td> $\rho>0$ </td><td>Lemma 6.70</td></tr><tr><td> $\lambda\|\mathbf{A}\mathbf{x}\|_{2}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\mathbf{A}^{T}(\mathbf{A}\mathbf{A}^{T}+\alpha^{*}\mathbf{I})^{-1}\mathbf{A}\mathbf{x},\alpha^{*}=0 \text{if}\|\mathbf{v}_{0}\|_{2}\leq\lambda;\text{otherwise},\|\mathbf{v}_{\alpha^{*}}\|_{2}=\lambda;\mathbf{v}_{\alpha}\equiv(\mathbf{A}\mathbf{A}^{T}+\alpha\mathbf{I})^{-1}\mathbf{A}\mathbf{x}$ </td><td> $\mathbf{A}\in\mathbb{R}^{m\times n}$ with full row rank,  $\lambda>0$ </td><td>Lemma 6.68</td></tr></table>


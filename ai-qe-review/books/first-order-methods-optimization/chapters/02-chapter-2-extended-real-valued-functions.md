---
title: "Chapter 2 \u2014 Extended Real-Valued Functions"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 2
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 762
source_line_end: 1694
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
  source_control_characters: 4
  latex_environment_mismatches: 1
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 2 — Extended Real-Valued Functions

> [[../README|本书目录]] · [[01-chapter-1-vector-spaces|上一章]] · [[03-chapter-3-subgradients|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 762–1694。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.23) × 1；Affine × 4；different × 1；PDF-confirmed FOMO PDF p.33 convexity-proof equation repair × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Extended Real-Valued Functions

Underlying Space: Recall that in this book, the underlying spaces (denoted usually by <sup>E</sup> or <sup>V</sup>) are finite-dimensional inner product vector spaces with inner product $\langle \cdot, \cdot \rangle$ and norm $\lVert \cdot \rVert$.

## 2.1 Extended Real-Valued Functions and Closedness

An extended real-valued function is a function defined over the entire underlying space that can take any real value, as well as the infinite values −∞ and ∞. Since infinite values are allowed, we also define the appropriate arithmetic operations with −∞ and ∞ as follows:

$$
a + \infty = \infty + a = \infty(- \infty < a < \infty),
$$

$$
a - \infty = - \infty + a = - \infty(- \infty < a < \infty),
$$

$$
a \cdot \infty = \infty \cdot a = \infty(0 < a < \infty),
$$

$$
a \cdot(- \infty) =(- \infty) \cdot a = - \infty(0 < a < \infty),
$$

$$
a \cdot \infty = \infty \cdot a = - \infty(- \infty < a < 0),
$$

$$
a \cdot(- \infty) =(- \infty) \cdot a = \infty \quad(- \infty < a < 0),
$$

$$
0 \cdot \infty = \infty \cdot 0 = 0 \cdot(- \infty) =(- \infty) \cdot 0 = 0.
$$

In a sense, the only “unnatural” rule is the last one, since the expression $^{6} 0 \cdot \infty^{\prime \}$ is considered to be undefined in some branches of mathematics, but in the context of extended real-valued functions, defining it as zero is the “correct” choice in the sense of consistency. We will also use the following natural order between finite and infinite numbers:

$$
\begin{array}{rl} \infty > a &(- \infty \leq a < \infty), \\ - \infty < a &(- \infty < a \leq \infty).\end{array}
$$

For an extended real-valued function $f : \mathbb{E} \to[- \infty, \infty]$ , the efective domain or just the domain is the set

$$
\operatorname{dom}(f) = \{\mathbf{x} \in \mathbb{E}: f(\mathbf{x}) < \infty\}.
$$

The notation ${}^{*} f : \mathbb{E} \to[- \infty, \infty]^{*}$ means that $f$ is (potentially) extended real-valued (even if not explicitly stated). The notation ${}^{*} f : \mathbb{E} \to(- \infty, \infty]^{*}$ means that $f$ is extended real-valued and does not attain the value $- \infty$

The simplest examples of extended real-valued functions are indicators.

Example 2.1 (indicator functions). For any subset $C \subseteq \mathbb{E}$ , the indicator function of $C$ is defined to be the extended real-valued function given by

$$
\delta_{C}(\mathbf{x}) = \left\{\begin{array}{ll} 0, & \mathbf{x} \in C, \\ \infty, & \mathbf{x} \notin C.\end{array} \right.\quad \blacksquare
$$

We obviously have

$$
\mathrm{dom}(\delta_{C}) = C.
$$

The epigraph of an extended real-valued function $f : \mathbb{E} \to[- \infty, \infty]$ is defined by

$$
\operatorname{epi}(f) = \left\{\left(\mathbf{x}, y\right): f(\mathbf{x}) \leq y, \mathbf{x} \in \mathbb{E}, y \in \mathbb{R} \right\}.
$$

The epigraph is a subset of $\mathbb{E} \times \mathbb{R}$ . Note that if $(\mathbf{x}, y) \in \mathrm{epi}(f)$ , then obviously $\mathbf{x} \in \operatorname{dom}(f)$ . A function $f : \mathbb{E} \to[- \infty, \infty]$ is called proper if it does not attain the value $- \infty$ and there exists at least one $\mathbf{x} \in \mathbb{E}$ such that $f(\mathbf{x}) < \infty$ , meaning that dom $(f)$ is nonempty. The notion of closedness will play an important role in much of the analysis in this book.

Definition 2.2 (closed functions). A function $f : \mathbb{E} \to[- \infty, \infty]$ is closed $if$ its epigraph is closed.

The indicator function $\delta_{C}$ is closed if and only if its underlying set $C$ is closed.

Proposition 2.3 (closedness of indicators of closed sets). The indicator function $\delta_{C}$ is closed if and only if $C$ is a closed set.

Proof. The epigraph of $\delta_{C}$ is given by

$$
\operatorname{epi}(\delta_{C}) = \left\{(\mathbf{x}, y) \in \mathbb{E} \times \mathbb{R}: \delta_{C}(\mathbf{x}) \leq y \right\} = C \times \mathbb{R}_{+},
$$

which is evidently closed if and only if C is closed.

We thus obtained in particular that the domain of a closed indicator function is necessarily a closed set. However, in general, we note that the domain of a closed function might not be closed. A classical example for this observation is given below.

Example 2.4. Consider the function $f : \mathbb{R} \to[- \infty, \infty]$ given by

$$
f(x) = \left\{\begin{array}{ll} \frac{1}{x}, & x > 0, \\ \infty, & \text{else}.\end{array} \right.
$$

The domain of the function, which is the open interval $(0, \infty)$ , is obviously not closed, but the function is closed since its epigraph

$$
\operatorname{epi}(f) = \{(x, y): xy \geq 1, x > 0\}
$$

is a closed set; see Figure 2.1.

![Figure 2.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/cca98074679e459f232698552730c13f25250c151bee178955286cf478874a90.jpg)  
Figure 2.1. The epigraph of the function $\textstyle f(x) ={\frac{1}{x}}$ for $x > 0$ and ∞ otherwise.

A property that will be later shown to be equivalent to closedness is lower semicontinuity.

Definition 2.5 (lower semicontinuity). A function $f : \mathbb{E} \to[- \infty, \infty]$ is called lower semicontinuous at $\mathbf x \in{\mathbb{E}} \if$

$$
f(\mathbf{x}) \leq \liminf_{n \to \infty} f(\mathbf{x}_{n})
$$

for any sequence $\{\mathbf{x}_{n}\}_{n \geq 1} \subseteq \mathbb{E}$ for which ${\bf x}_{n}{\bf x} \as \n \infty$ . A function $f : \mathbb { E } $ $[- \infty, \infty]$ is called lower semicontinuous if it is lower semicontinuous at each point in <sup>E</sup>.

For any $\alpha \in \mathbb{R}$ , the α-level set of a function $f : \mathbb{E} \to[- \infty, \infty]$ is the set

$$
\operatorname{Lev}(f, \alpha) = \{\mathbf{x} \in \mathbb{E}: f(\mathbf{x}) \leq \alpha\}.
$$

The following theorem shows that closedness and lower semicontinuity are equivalent properties, and they are both equivalent to the property that all the level sets of the function are closed.

Theorem 2.6 (equivalence of closedness, lower semicontinuity, and closedness of level sets). Let $f : \mathbb{E} \to[- \infty, \infty]$ . Then the following three claims are equivalent:

(i) f is lower semicontinuous.

(ii) f is closed.

(iii) For any $\alpha \in \mathbb{R}$ , the level set

$$
\operatorname{Lev}(f, \alpha) = \{\mathbf{x} \in \mathbb{E}: f(\mathbf{x}) \leq \alpha\}
$$

is closed.

Proof. $(i \Rightarrow \mathrm{ii})$ Suppose that f is lower semicontinuous. We will show that $\operatorname{epi}(f)$ is closed. For that, take $\{(\mathbf{x}_{n}, y_{n})\}_{n \geq 1} \subseteq \mathrm{epi}(f)$ such that $({\bf x}_{n}, y_{n})({\bf x}^{*}, y^{*})$ as $n \to \infty$ . Then for any $n \geq 1$ ，

$$
f(\mathbf{x}_{n}) \leq y_{n}.
$$

Therefore, by the lower semicontinuity of $f$ at $\mathbf{x}^{*}$ , we have

$$
f(\mathbf{x}^{*}) \leq \operatorname{liminf}_{n \to \infty} f(\mathbf{x}_{n}) \leq \operatorname{liminf}_{n \to \infty} y_{n} = y^{*},
$$

showing that $(\mathbf{x}^{*}, y^{*}) \in \mathrm{epi}(f)$ and hence that f is closed.

$(\mathrm{ii} \Rightarrow \mathrm{iii})$ Suppose that f is closed, namely, that $\operatorname{epi}(f)$ is closed. Let $\alpha \in \mathbb{R}$ We will show that $\operatorname{Lev}(f, \alpha)$ is closed. If $\operatorname{Lev}(f, \alpha) = \varnothing$ , we are done. Otherwise, take a sequence $\{\mathbf{x}_{n}\}_{n \geq 1} \subseteq \operatorname{Lev}(f, \alpha)$ that converges to x¯. Obviously $(\mathbf{x}_{n}, \alpha) \in \mathrm{epi}(f)$ for any n and $({\bf x}_{n}, \alpha)(\bar{\bf x}, \alpha)$ as $n \infty$ . By the closedness of $\operatorname{epi}(f)$ , it follows that $(\bar{\mathbf{x}}, \alpha) \in \mathrm{epi}(f)$ , establishing the fact that $\bar{\mathbf{x}} \in \mathrm{Lev}(f, \alpha)$

(iii ⇒ i) Suppose that all the level sets of $f$ are closed. We will show that it is lower semicontinuous. Assume by contradiction that f is not lower semicontinuous, meaning that there exists $\mathbf{x}^{*} \in \mathbb{E}$ and $\{\mathbf{x}_{n}\}_{n \geq 1} \subseteq \mathbb{E}$ such that ${\bf x}_{n}{\bf x}^{*}$ and lim in $\dot{\mathbf{\zeta}}_{n \infty} f(\mathbf{x}_{n}) < f(\mathbf{x}^{*})$ . Take α that satisfies

$$
\liminf_{n \to \infty} f(\mathbf{x}_{n}) < \alpha < f(\mathbf{x}^{*}).\tag{2.1}
$$

Then there exists a subsequence $\{\mathbf{x}_{n_{k}}\}_{k \ge 1}$ such that $f(\mathbf{x}_{n_{k}}) \leq \alpha$ for all $k \geq 1$ . By the closedness of the level set $\operatorname{Lev}(f, \alpha)$ and the fact that $\mathbf{x}_{n_{k}} \to \mathbf{x}^{*}$ as $k \infty$ , it follows that $f(\mathbf{x}^{*}) \leq \alpha,$ , which is a contradiction to (2.1), showing that (iii) implies (i).

The next result shows that closedness of functions is preserved under Affine change of variables, summation, multiplication by a nonnegative number, and maximization. Before stating the theorem, we note that in this book we will not use the $\mathrm{inf / sup}$ notation but rather use only the min/max notation, where the usage of this notation does not imply that the maximum or minimum is actually attained.

## Theorem 2.7 (operations preserving closedness).

(a) Let $\mathcal{A} : \mathbb{E} \mathbb{V}$ be a linear transformation from <sup>E</sup> to <sup>V</sup> and b $\in \mathbb{V}$ and let $f : \mathbb{V} \to[- \infty, \infty]$ be an extended real-valued closed function. Then the function $g : \mathbb{E}[- \infty, \infty]$ given by

$$
g(\mathbf{x}) = f(\mathcal{A}(\mathbf{x}) + \mathbf{b})
$$

is closed.

(b) Let $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ be extended real-valued closed functions and let $\alpha_{1}, \alpha_{2}, \ldots, \alpha_{m} \in \mathbb{R}_{+}$ . Then the function $\begin{array}{r}{f = \sum_{i = 1}^{m} \alpha_{i} f_{i}} \end{array}$ is closed.

(c) Let $f_{i} : \mathbb{E} \to(- \infty, \infty], i \in I$ be extended real-valued closed functions, where I is a given index set. Then the function

$$
f(\mathbf{x}) = \max_{i \in I} f_{i}(\mathbf{x})
$$

is closed.

Proof. (a) To show that $g$ is closed, take a sequence $\{(\mathbf{x}_{n}, y_{n})\}_{n \geq 1} \subseteq \mathrm{epi}(g)$ such that $({\bf x}_{n}, y_{n})({\bf x}^{*}, y^{*})$ as $n \infty$ , where $\mathbf{x}^{\ast} \in \mathbb{E}$ and $y^{\ast} \in \mathbb{R}$ . The relation $\{(\mathbf{x}_{n}, y_{n})\}_{n \geq 1} \subseteq \mathrm{epi}(g)$ can be written equivalently as

$$
f(\mathcal{A}(\mathbf{x}_{n}) + \mathbf{b}) \leq y_{n} \text{for all} n \geq 1.
$$

Therefore, $(A(\mathbf{x}_{n}) + \mathbf{b}, y_{n}) \in \mathrm{epi}(f)$ . Hence, since f is closed and $\boldsymbol { \mathcal { A } } ( \mathbf { x } _ { n } ) + \mathbf { b } $ $\boldsymbol{\mathcal{A}}(\mathbf{x}^{*}) + \mathbf{b}, y_{n} \to y^{*}$ as $n \infty ~(\mathrm{by}$ the continuity of linear transformations), it follows that $(A(\mathbf{x}^{*}) + \mathbf{b}, y^{*}) \in \mathrm{epi}(f)$ , meaning that

$$
f(\mathcal{A}(\mathbf{x}^{*}) + \mathbf{b}) \leq y^{*},
$$

which is the same as the relation $(\mathbf{x}^{*}, y^{*}) \in \mathrm{epi}(g)$ . We have shown that $\operatorname{epi}(g)$ is closed or, equivalently, that $g$ is closed.

(b) We will prove that f is lower semicontinuous, which by Theorem 2.6 is equivalent to the closedness of f . Let $\{{\bf x}_{n}\}_{n \ge 1}$ be a sequence converging to $\mathbf{x}^{*}$ Then by the lower semicontinuity of $f_{i}$ , for any $i = 1, 2, \dots, m$

$$
f_{i}(\mathbf{x}^{*}) \leq \liminf_{n \to \infty} f_{i}(\mathbf{x}_{n}).
$$

Multiplying the above inequality by $\alpha_{i}$ and summing for $i = 1, 2, \dots, m$ gives

$$
\left(\sum_{i = 1}^{m} \alpha_{i} f_{i}\right)(\mathbf{x}^{*}) \leq \sum_{i = 1}^{m} \operatorname{liminf}_{n \to \infty} \alpha_{i} f_{i}(\mathbf{x}_{n}) \leq \operatorname{liminf}_{n \to \infty} \left(\sum_{i = 1}^{m} \alpha_{i} f_{i}\right)(\mathbf{x}_{n}),
$$

where in the last inequality we used the fact that for any two sequences of real numbers $\{a_{n}\}_{n \geq 1}$ and $\{b_{n}\}_{n \geq 1}$ , it holds that

$$
\liminf_{n \to \infty} a_{n} + \liminf_{n \to \infty} b_{n} \leq \liminf_{n \to \infty}(a_{n} + b_{n}).
$$

A simple induction argument shows that this property holds for an arbitrary number of sequences. We have thus established the lower semicontinuity and hence closedness of $\textstyle \sum_{i = 1}^{m} \alpha_{i} f_{i}$

(c) Since f<sub>i</sub> is closed for any $i \in I,$ , it follows that $\operatorname{epi}(f_{i})$ is closed for any $i,$ and hence ep $\begin{array}{r}{(f) = \bigcap_{i \in I} \operatorname{epi}(f_{i})} \end{array}$ is closed as an intersection of closed sets, implying that f is closed.

## 2.2 Closedness versus Continuity

A relation between continuity and closedness is described in the following theorem stating that if an extended real-valued function is continuous over its domain,<sup>2</sup> which is assumed to be closed, then it is closed.

Theorem 2.8. Let $f : \mathbb{E}(- \infty, \infty]$ be an extended real-valued function that is continuous over its domain and suppose that dom(f) is closed. Then f is closed.

Proof. To show that epi(f ) is closed (which is the same as saying that f is closed), take a sequence $\{(\mathbf{x}_{n}, y_{n})\}_{n \geq 1} \subseteq \mathrm{epi}(f)$ for which $({\bf x}_{n}, y_{n})({\bf x}^{*}, y^{*})$ as $n \infty$ for some $\mathbf{x}^{*} \in \mathbb{E}$ and $y \in \mathbb{R}$ . Since $\{\mathbf{x}_{n}\}_{n \geq 1} \subseteq \operatorname{dom}(f), \mathbf{x}_{n} \to \mathbf{x}^{*}$ and dom(f) is closed, it follows that $\mathbf{x}^{*} \in$ dom(f ). By the definition of the epigraph, we have for all $n \geq 1$ 2

$$
f(\mathbf{x}_{n}) \leq y_{n}.\tag{2.2}
$$

Since f is continuous over dom $(f)$ , and in particular at $\mathbf{x}^{*}$ , it follows by taking n to $\infty$ in (2.2) that

$$
f(\mathbf{x}^{*}) \leq y^{*},
$$

showing that $(\mathbf{x}^{*}, y^{*}) \in \mathrm{epi}(f)$ , thus establishing the closedness of $\operatorname{epi}(f)$ □

In particular, any real-valued continuous function over <sup>E</sup> is closed.

Corollary 2.9. Let $f : \mathbb{E} \to \mathbb{R}$ be continuous. Then f is closed.

The above results demonstrate that there is a connection between continuity and closedness. However, these two notions are different, as the following example illustrates.

Example 2.10. Consider the function $f_{\alpha} : \mathbb{R}(- \infty, \infty]$ given by

$$
f_{\alpha}(x) = \left\{\begin{array}{ll} \alpha, & x = 0, \\ x, & 0 < x \leq 1, \\ \infty, & \text{else}.\end{array} \right.
$$

![Figure 2.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/90dd451ba522e5cdfa9e6158efabe22941a42a4e3cb9cbe96b22fb2c41d35a38.jpg)  
Figure 2.2. An example of a closed function, which is not continuous over its domain.

This function is closed if and only if $\alpha \leq 0$ , and it is continuous over its domain if and only if $\alpha = 0$ . Thus, the function $f_{- 0.1}$ , plotted in Figure 2.2, is closed but not continuous over its domain.

Example 2.11 $\left(l_{0}{\bf - norm} \right)$ . Consider the $l_{0} \mathrm{- norm}$ function $f : \mathbb{R}^{n} \mathbb{R}$ given by

$$
f(\mathbf{x}) = \| \mathbf{x} \|_{0} \equiv \# \{i: x_{i} \neq 0\}.
$$

That is, $\| \mathbf{x} \|_{0}$ is the number of nonzero elements in x. Note the $l_{0} \mathrm{- norm}$ is actually not a norm. It does not satisfy the homogeneity property. Nevertheless, this terminology is widely used in the literature, and we will therefore adopt it. Although f is obviously not continuous, it is closed. To show this, note that

$$
f(\mathbf{x}) = \sum_{i = 1}^{n} I(x_{i}),
$$

where $I : \mathbb{R} \{0, 1\}$ is given by

$$
I(y) = \left\{\begin{array}{ll} 0, & y = 0, \\ 1, & y \neq 0.\end{array} \right.
$$

The function I is closed since its level sets, which are given by

$$
\operatorname{Lev}(I, \alpha) = \left\{\begin{array}{ll} \emptyset, & \alpha < 0, \\ \{0\}, & \alpha \in[0, 1), \\ \mathbb{R}, & \alpha \geq 1, \end{array} \right.
$$

are closed sets. Therefore, $f,$ as a sum of closed functions, is closed (Theorem $2.7(b))$ .

It is well known that a continuous function over a nonempty compact<sup>3</sup> set attains a minimum. This is the well-known Weierstrass theorem. We will now show that this property also holds for closed functions.

Theorem 2.12 (Weierstrass theorem for closed functions). Let $f : \mathbb { E } $ $(- \infty, \infty]$ be a proper closed function and assume that $C$ is a compact set satisfying C ∩ dom $(f) \neq \emptyset$ . Then

(a) f is bounded below over $C.$

(b) f attains its minimal value over $C.$

Proof. (a) Suppose by contradiction that f is not bounded below over C. Then there exists a sequence $\{\mathbf{x}_{n}\}_{n \geq 1} \subseteq C$ such that

$$
\lim_{n \to \infty} f(\mathbf{x}_{n}) = - \infty.\tag{2.3}
$$

By the Bolzano–Weierstrass theorem, since C is compact, there exists a subsequence $\{\mathbf{x}_{n_{k}}\}_{k \ge 1}$ that converges to a point $\bar{\bf x} \in C$ . By Theorem 2.6, $f$ is lower semicontinuous, and hence

$$
f(\bar{\mathbf{x}}) \leq \liminf_{k \to \infty} f(\mathbf{x}_{n_{k}}),
$$

which is a contradiction to (2.3).

(b) Denote by $f_{\mathrm{opt}}$ the minimal value of f over C. Then there exists a sequence $\{{\bf x}_{n}\}_{n \ge 1}$ for which $f({\mathbf{x}}_{n}) \to f_{\mathrm{opt}}$ as n → ∞. As before, take a subsequence $\{\mathbf{x}_{n_{k}}\}_{k \ge 1}$ that converges to some point $\bar{\bf x} \in C$ . By the lower semicontinuity of $f,$ it follows that

$$
f(\bar{\mathbf{x}}) \leq \lim_{k \to \infty} f(\mathbf{x}_{n_{k}}) = f_{\mathrm{opt}},
$$

showing that x¯ is a minimizer of f over $C.\ \mathsf{\Pi} \circ$

When the set C in the premise of Theorem 2.12 is not compact, the Weierstrass theorem does not guarantee the attainment of a minimizer, but attainment of a minimizer can be shown when the compactness of C is replaced by closedness if the function has a property called coerciveness.

Definition 2.13 (coerciveness). A proper function $f : \mathbb{E}(- \infty, \infty]$ is called coercive if

$$
\lim_{\| \mathbf{x} \| \to \infty} f(\mathbf{x}) = \infty.
$$

An important property of closed coercive functions is that they possess a minimizer on any closed set that has a nonempty intersection with the domain of the function.

Theorem 2.14 (attainment under coerciveness). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and coercive function and let $S \subseteq \mathbb{E}$ be a nonempty closed set satisfying $S \cap$ dom $(f) \neq \emptyset$ . Then $f$ attains its minimal value over $S$

Proof. Let $\mathbf{x}_{\mathrm{0}}$ be an arbitrary point in S ∩ dom $(f)$ . By the coerciveness of $f,$ there exists an $M > 0$ such that

$$
f(\mathbf{x}) > f \left(\mathbf{x}_{0}\right) \text{for any} \mathbf{x} \text{satisfying} \| \mathbf{x} \| > M.\tag{2.4}
$$

Since any minimizer $\mathbf{x}^{*}$ of $f$ over $S$ satisfies $f(\mathbf{x}^{*}) \leq f(\mathbf{x}_{0})$ , it follows from (2.4) that the set of minimizers of $f$ over $S$ is the same as the set of minimizers of $f$ over $S \cap B_{\parallel \cdot \parallel}[\mathbf{0}, M]$ , which is compact (both sets are closed, and $B_{\parallel \cdot \parallel}[\mathbf{0}, M]$ is bounded) and nonempty (as it contains $\mathbf{x}_{\mathrm{0}})$ . Therefore, by the Weierstrass theorem for closed functions (Theorem 2.12), there exists a minimizer of $f$ over $S \cap B[\mathbf{0}, M]$ and hence also over $S_{☉}$ .

## 2.3 Convex Functions

## 2.3.1 Definition and Basic Properties

Like closedness, the definition of convexity for extended real-valued functions can be written in terms of the epigraph.

Definition 2.15 (convex functions). An extended real-valued function $f : \mathbb { E } $ $[- \infty, \infty]$ is called convex $if \operatorname{epi}(f)$ is a convex set.

It is not dificult to show that a proper extended real-valued function $f : \mathbb { E } $ $(- \infty, \infty]$ is convex if and only if dom(f ) is convex and the restriction of $f$ to dom(f) is convex over dom $(f)$ in the sense of convexity of real-valued functions over convex domains. Using this observation, we conclude that a proper extended real-valued function $f$ is convex if and only if

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) \text{for all} \mathbf{x}, \mathbf{y} \in \mathbb{E}, \lambda \in[0, 1],\tag{2.5}
$$

or, equivalently, if and only if dom(f ) is convex and (2.5) is satisfied for any $\mathbf{x}, \mathbf{y} \in$ dom $(f)$ and $\lambda \in[0, 1]$ . Inequality (2.5) is a special case of Jensen’s inequality, stating that for any $\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{k} \in \mathbb{E}$ and $\lambda \in \Delta_{k}$ , the following inequality holds:

$$
f \left(\sum_{i = 1}^{k} \lambda_{i} \mathbf{x}_{i}\right) \leq \sum_{i = 1}^{k} \lambda_{i} f(\mathbf{x}_{i}).
$$

There are several operations that preserve convexity of extended real-valued convex functions. Some of them are summarized in Theorem 2.16 below. The proof can be easily deduced by combining two facts: (i) the same properties are known to hold for real-valued convex functions defined on a given convex domain, and (ii) the observation that a proper extended real-valued function is convex if and only if its domain is convex and its restriction to its domain is a real-valued convex function.

Theorem 2.16 (operations preserving convexity).

(a) Let $\mathcal{A} : \mathbb{E} \mathbb{V}$ be a linear transformation from <sup>E</sup> to $\mathbb{V}$ (two underlying vector spaces) and b $\in \mathbb{V}$ , and let $f : \mathbb{V} \to(- \infty, \infty]$ be an extended real-valued convex function. Then the extended real-valued function $g : \mathbb{E}(- \infty, \infty]$ given by

$$
g(\mathbf{x}) = f(\mathcal{A}(\mathbf{x}) + \mathbf{b})
$$

is convex.

(b) Let $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ be extended real-valued convex functions, and let $\alpha_{1}, \alpha_{2}, \ldots, \alpha_{m} \in \mathbb{R}_{+}$ . Then the function $\textstyle \sum_{i = 1}^{m} \alpha_{i} f_{i}$ is convex.

(c) Let $f_{i} : \mathbb{E} \to(- \infty, \infty], i \in I,$ be extended real-valued convex functions, where I is a given index set. Then the function

$$
f(\mathbf{x}) = \max_{i \in I} f_{i}(\mathbf{x})
$$

is convex.

Given a nonempty set $C \subseteq \mathbb{E}.$ , the distance function to C is defined by

$$
d_{C}(\mathbf{x}) = \min_{\mathbf{y} \in C} \| \mathbf{x} - \mathbf{y} \|.
$$

The next example shows that for Euclidean spaces, the function $\begin{array}{r}{\frac{1}{2} \left(\| \mathbf{x} \|^{2} - d_{C}^{2}(\mathbf{x}) \right)} \end{array}$ is always convex, regardless of whether C is convex or not.

Example $\mathbf{2.17.^{4}}$ Suppose that the underlying space <sup>E</sup> is Euclidean (meaning that $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle})$ . Let $C \subseteq \mathbb{E}$ be a nonempty set, and consider the function

$$
\varphi_{C}(\mathbf{x}) = \frac{1}{2} \left(\| \mathbf{x} \|^{2} - d_{C}^{2}(\mathbf{x})\right).
$$

To show that $\varphi_{C}$ is convex, note that

$$
d_{C}^{2}(\mathbf{x}) = \min_{\mathbf{y} \in C} \| \mathbf{x} - \mathbf{y} \|^{2} = \| \mathbf{x} \|^{2} - \max_{\mathbf{y} \in C}[2 \langle \mathbf{y}, \mathbf{x} \rangle - \| \mathbf{y} \|^{2}].
$$

Hence,

$$
\varphi_{C}(\mathbf{x}) = \max_{\mathbf{y} \in C} \left[\langle \mathbf{y}, \mathbf{x} \rangle - \frac{1}{2} \| \mathbf{y} \|^{2} \right].\tag{2.6}
$$

Therefore, since ϕ<sub>C</sub> is a maximization of Affine—and hence convex—functions, by Theorem 2.16(c), it is necessarily convex.

Another operation that preserves convexity is partial minimization of jointly convex functions.

Theorem 2.18 (convexity under partial minimization). Let $f : \mathbb { E } \times \mathbb { V } $ $(- \infty, \infty]$ be a convex function satisfying the following property:

$$
\text{for any} \mathbf{x} \in \mathbb{E} \text{there exists} \mathbf{y} \in \mathbb{V} \text{for which} f(\mathbf{x}, \mathbf{y}) < \infty.\tag{2.7}
$$

$Let^{5} ~ g : \mathbb{E} \to[- \infty, \infty)$ be defined by

$$
g(\mathbf{x}) \equiv \min_{\mathbf{y} \in \mathbb{E}} f(\mathbf{x}, \mathbf{y}).
$$

Then $g$ is convex.

Proof. Let $\mathbf{x}_{1}, \mathbf{x}_{2} \in \mathbb{E}$ and $\lambda \in[0, 1]$ . To show the convexity of $^{g,}$ we will prove that

$$
g \left(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}\right) \leq \lambda g \left(\mathbf{x}_{1}\right) +(1 - \lambda) g \left(\mathbf{x}_{2}\right).\tag{2.8}
$$

The inequality is obvious if $\lambda = 0 \ \mathrm{or} \1$ . We will therefore assume that $\lambda \in(0, 1)$ The proof is split into two cases.

Case I: Here we assume that $g(\mathbf{x}_{1}), g(\mathbf{x}_{2}) > - \infty$ . Take $\varepsilon > 0$ . Then there exist $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathbb{V}$ such that

$$
f(\mathbf{x}_{1}, \mathbf{y}_{1}) \leq g(\mathbf{x}_{1}) + \varepsilon,\tag{2.9}
$$

$$
f(\mathbf{x}_{2}, \mathbf{y}_{2}) \leq g(\mathbf{x}_{2}) + \varepsilon.\tag{2.10}
$$

By the convexity of $f,$ we have

$$
\begin{array}{rcl} f(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}, \lambda \mathbf{y}_{1} +(1 - \lambda) \mathbf{y}_{2}) & \leq & \lambda f(\mathbf{x}_{1}, \mathbf{y}_{1}) +(1 - \lambda) f(\mathbf{x}_{2}, \mathbf{y}_{2}) \\ & \stackrel{(2.9),(2.10)}{\leq} & \lambda(g(\mathbf{x}_{1}) + \varepsilon) +(1 - \lambda)(g(\mathbf{x}_{2}) + \varepsilon) \\ & = & \lambda g(\mathbf{x}_{1}) +(1 - \lambda) g(\mathbf{x}_{2}) + \varepsilon.\end{array}
$$

Therefore, by the definition of $^{g,}$ we can conclude that

$$
g \left(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}\right) \leq \lambda g \left(\mathbf{x}_{1}\right) +(1 - \lambda) g \left(\mathbf{x}_{2}\right) + \varepsilon.
$$

Since the above inequality holds for any $\varepsilon > 0$ , it follows that (2.8) holds.

Case II: Assume that at least one of the values $g(\mathbf{x}_{1}), g(\mathbf{x}_{2})$ is equal −∞. We will assume without loss of generality that $g(\mathbf{x}_{1}) = - \infty$ . In this case, (2.8) is equivalent to saying that $g(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}) = - \infty$ . Take any $M \in \mathbb{R}$ . Then since $g(\mathbf{x}_{1}) = - \infty$ 2 it follows that there exists $\mathbf{y}_{1} \in \mathbb{V}$ for which

$$
f(\mathbf{x}_{1}, \mathbf{y}_{1}) \leq M.
$$

By property (2.7), there exists $\mathbf{y}_{2} \in \mathbb{V}$ for which $f(\mathbf{x}_{2}, \mathbf{y}_{2}) < \infty$ . Using the convexity of $f_{;}$ we obtain that

$$
\begin{array}{rcl}
f(\lambda \mathbf{x}_{1} + (1 - \lambda) \mathbf{x}_{2}, \lambda \mathbf{y}_{1} + (1 - \lambda) \mathbf{y}_{2}) &\leq& \lambda f(\mathbf{x}_{1}, \mathbf{y}_{1}) + (1 - \lambda) f(\mathbf{x}_{2}, \mathbf{y}_{2}) \\
&\stackrel{(2.9),(2.10)}{\leq}& \lambda(g(\mathbf{x}_{1}) + \varepsilon) + (1 - \lambda)(g(\mathbf{x}_{2}) + \varepsilon) \\
&=& \lambda g(\mathbf{x}_{1}) + (1 - \lambda)g(\mathbf{x}_{2}) + \varepsilon.
\end{array}
$$

which by the definition of $g$ implies the inequality

$$
g(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}) \leq \lambda M +(1 - \lambda) f(\mathbf{x}_{2}, \mathbf{y}_{2}).
$$

Since the latter inequality holds for any $M \in \mathbb{R}$ and since $f(\mathbf{x}_{2}, \mathbf{y}_{2}) < \infty$ , it follows that $g(\lambda \mathbf{x}_{1} +(1 - \lambda) \mathbf{x}_{2}) = - \infty$ , proving the result for the second case.

## 2.3.2 The Infimal Convolution

Let $h_{1}, h_{2} : \mathbb{E}(- \infty, \infty]$ be two proper functions. The infimal convolution of $h_{1}, h_{2}$ is defined by the following formula:

$$
(h_{1} \square h_{2})(\mathbf{x}) \equiv \min_{\mathbf{u} \in \mathbb{E}} \{h_{1}(\mathbf{u}) + h_{2}(\mathbf{x} - \mathbf{u})\}.
$$

A direct consequence of Theorem 2.18 is the following result stating that the infimal convolution of a proper convex function and a real-valued convex function is always convex.

Theorem 2.19 (convexity of the infimal convolution). Let $h_{1} : \mathbb{E}(- \infty, \infty]$ be a proper convex function and let $h_{2} : \mathbb{E} \mathbb{R}$ be a real-valued convex function. Then $h_{1} \boxed\} h_{2}$ is convex.

Proof. Define $f({\bf x},{\bf y}) \equiv h_{1}({\bf y}) + h_{2}({\bf x} -{\bf y})$ . The convexity of $h_{1}$ and $h_{2}$ implies that $f$ is convex. In addition, property (2.7) holds since for any $\mathbf{x} \in \mathbb{E}$ , we can pick any $\mathbf{y} \in \mathrm{dom}(h_{1})$ and obtain that $f(\mathbf{x}, \mathbf{y}) = h_{1}(\mathbf{y}) + h_{2}(\mathbf{x} - \mathbf{y}) < \infty$ . Thus, by Theorem 2.18, the function $h_{1} \sqcup h_{2}$ , as a partial minimization function of $f(\cdot, \cdot)$ w.r.t. the second argument is a convex function.

Example 2.20 (convexity of the distance function). Let $C \subseteq \mathbb{E}$ be a nonempty convex set. The distance function can be written as the following infimal convolution:

$$
d_{C}(\mathbf{x}) = \min_{\mathbf{y}} \{\| \mathbf{x} - \mathbf{y} \|: \mathbf{y} \in C\} = \min_{\mathbf{y} \in \mathbb{E}} \{\delta_{C}(\mathbf{y}) + \| \mathbf{x} - \mathbf{y} \|\} =(\delta_{C} \square h_{1})(\mathbf{x}),
$$

where $h_{1}(\cdot) = \| \cdot \|$ . Since $\delta_{C}$ is proper and convex and $h_{1}$ is real-valued convex, it follows by Theorem 2.19 that $d_{C}$ is convex.

## 2.3.3 Continuity of Convex Functions

It is well known that convex functions are continuous at points in the interior of their domain. This is explicitly recalled in the next result, which actually states a stronger property of convex functions—local Lipschitz continuity.

Theorem 2.21 (local Lipschitz continuity of convex functions [10, Theorem 7.36]). Let $f : \mathbb{E} \to(- \infty, \infty]$ be convex. Let ${\bf x}_{0} \in{}$ int(dom(f ))). Then there exist $\varepsilon > 0$ and $L > 0$ such that $B[{\bf x}_{0}, \varepsilon] \subseteq C$ and

$$
| f(\mathbf{x}) - f(\mathbf{x}_{0}) | \leq L \| \mathbf{x} - \mathbf{x}_{0} \|\tag{2.11}
$$

for all $\mathbf{x} \in B[\mathbf{x}_{0}, \varepsilon]$

Convex functions are not necessarily continuous at boundary points. Continuity is not guaranteed even when the function at hand is closed and convex (cf. Example 2.32). However, for univariate functions we will now show that closed and convex functions are continuous.

Theorem 2.22 (continuity of closed convex univariate functions). Let $f : \mathbb{R}(- \infty, \infty]$ be a proper closed and convex function. Then f is continuous over dom(f).

Proof. Since f is convex, its domain is some interval $I = \operatorname{dom}(f)$ . If int $(I) = \emptyset$ then I is a singleton, and consequently the continuity of f over I is obvious. Assume then that int $(I) \neq \emptyset$ . The fact that $f$ is continuous over int(I) follows from Theorem 2.21. We only need to show the continuity of $f$ at the endpoints of I (if it exists). For that, we can assume without loss of generality that the interval I has a left endpoint $^{a,}$ and we will prove the right continuity of $f$ at $a.$ We begin by showing that lim $\cdot t \to a^{+} ~ f(t)$ exists. Let $c > a$ be an arbitrary scalar in I and define the function

$$
g(t) \equiv \frac{f(c - t) - f(c)}{t}.
$$

Obviously, $g$ is defined on $(0, c - a]$ . We will show that g is nondecreasing and upper bounded over $(0, c - a]$ . For that, take $0 < t \leq s \leq c - a$ . Then

$$
c - t = \left(1 - \frac{t}{s}\right) c + \frac{t}{s}(c - s),
$$

and hence, by the convexity of $f,$

$$
f(c - t) \leq \left(1 - \frac{t}{s}\right) f(c) + \frac{t}{s} f(c - s),
$$

which after some rearrangement of terms can be seen to be equivalent to

$$
\frac{f(c - t) - f(c)}{t} \leq \frac{f(c - s) - f(c)}{s}.
$$

Thus,

$$
g(t) \leq g(s) \mathrm{forany} 0 < t \leq s \leq c - a.\tag{2.12}
$$

Namely, $g$ is nondecreasing over $(0, c - a]$ . To show the upper boundedness, just plug $s = c - a$ into (2.12) and obtain that

$$
g(t) \leq g(c - a) \text{for any} t \in(0, c - a].\tag{2.13}
$$

We can thus conclude that $\begin{array}{r}{\operatorname{lim}_{t \to(c - a)^{-}} g(t)} \end{array}$ exists and is equal to some real number . Hence,

$$
f(c - t) = f(c) + tg(t) \rightarrow f(c) +(c - a) \ell,
$$

as $t \to(c - a)^{-}$ , and consequently $\scriptstyle \operatorname{lim}_{t \to a^{+}} f(t)$ exists and is equal to $f(c) +(c - a) \ell.$ Using (2.13), we obtain that for any $t \in(0, c - a]$ ，

$$
f(c - t) = f(c) + tg(t) \leq f(c) +(c - a) g(c - a) = f(c) +(c - a) \frac{f(a) - f(c)}{c - a} = f(a),
$$

implying the inequality $\begin{array}{r}{\operatorname{lim}_{t \to a^{+}} f(t) \le f(a)} \end{array}$ . On the other hand, since $f$ is closed, it is also lower semicontinuous (Theorem 2.6), and thus $\begin{array}{r}{\operatorname{lim}_{t \to a^{+}} f(t) \geq f(a)} \end{array}$ . Consequently, lim $\mathfrak{l}_{t \to a^{+}} f(t) = f(a)$ , proving the right continuity of $f$ at $a.\quad \sqcup$

## 2.4 Support Functions

Let $C \subseteq \mathbb{E}$ be a nonempty set. Then the support function of C is the function $\sigma_{C} : \mathbb{E}^{*}(- \infty, \infty]$ given by

$$
\sigma_{C}(\mathbf{y}) = \max_{\mathbf{x} \in C} \langle \mathbf{y}, \mathbf{x} \rangle.
$$

For a fixed x, the linear function $\mathbf{y} \mapsto \langle \mathbf{y}, \mathbf{x} \rangle$ is obviously closed and convex. Therefore, by Theorems $2.7(c)$ and $2.16(c)$ , the support function, as a maximum of closed and convex functions, is always closed and convex, regardless of whether C is closed and/or convex. We summarize this property in the next lemma.

Lemma 2.23 (closedness and convexity of support functions). Let $C \subseteq \mathbb{E}$ be a nonempty set. Then $\sigma_{C}$ is a closed and convex function.

In most of our discussions on support functions in this chapter, the fact that $\sigma_{C}$ operates on the dual space $\mathbb{E}^{*}$ instead of <sup>E</sup> will have no importance—recall that we use the convention that the elements of $\mathbb{E}^{*}$ and <sup>E</sup> are the same. However, when norms will be involved, naturally, the dual norm will have to be used (cf. Example 2.31).

Additional properties of support functions that follow directly by definition are given in Lemma 2.24 below. Note that for two sets A, B that reside in the same space, the sum $A + B$ stands for the Minkowski sum given by

$$
A + B = \{\mathbf{a} + \mathbf{b}: \mathbf{a} \in A, \mathbf{b} \in B\}.
$$

Also, for a scalar $\alpha \in \mathbb{R}$ and a set $A \subseteq \mathbb{E}$ , the set αA is

$$
\alpha A = \{\alpha \mathbf{a}: \mathbf{a} \in A\}.
$$

Lemma 2.24.

(a) (positive homogeneity) For any nonempty set $C \subseteq \mathbb{E}, \mathbf{y} \in \mathbb{E}^{*}$ and $\alpha \geq 0$

$$
\sigma_{C}(\alpha \mathbf{y}) = \alpha \sigma_{C}(\mathbf{y}).
$$

(b) (subadditivity) For any nonempty set $C \subseteq \mathbb{E}$ and $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathbb{E}^{*}$

$$
\sigma_{C}(\mathbf{y}_{1} + \mathbf{y}_{2}) \leq \sigma_{C}(\mathbf{y}_{1}) + \sigma_{C}(\mathbf{y}_{2}).
$$

(c) For any nonempty set $C \subseteq \mathbb{E}, \mathbf{y} \in \mathbb{E}^{*}$ and $\alpha \geq 0$

$$
\sigma_{\alpha C}(\mathbf{y}) = \alpha \sigma_{C}(\mathbf{y}).
$$

(d) For any two nonempty sets $A, B \subseteq \mathbb{E}$ and $\mathbf{y} \in \mathbb{E}^{*}$ ，

$$
\sigma_{A + B}(\mathbf{y}) = \sigma_{A}(\mathbf{y}) + \sigma_{B}(\mathbf{y}).
$$

Proof. (a) $\begin{array}{r}{\sigma_{C}(\alpha \mathbf{y}) = \operatorname{max}_{\mathbf{x} \in C} \langle \alpha \mathbf{y}, \mathbf{x} \rangle = \alpha \operatorname{max}_{\mathbf{x} \in C} \langle \mathbf{y}, \mathbf{x} \rangle = \alpha \sigma_{C}(\mathbf{y}).} \end{array}$ (b)

$$
\begin{array}{l} \sigma_{C}(\mathbf{y}_{1} + \mathbf{y}_{2}) = \underset{\mathbf{x} \in C}{\max} \langle \mathbf{y}_{1} + \mathbf{y}_{2}, \mathbf{x} \rangle = \underset{\mathbf{x} \in C}{\max}[\langle \mathbf{y}_{1}, \mathbf{x} \rangle + \langle \mathbf{y}_{2}, \mathbf{x} \rangle] \\ \qquad \leq \underset{\mathbf{x} \in C}{\max} \langle \mathbf{y}_{1}, \mathbf{x} \rangle + \underset{\mathbf{x} \in C}{\max} \langle \mathbf{y}_{2}, \mathbf{x} \rangle = \sigma_{C}(\mathbf{y}_{1}) + \sigma_{C}(\mathbf{y}_{2}).\end{array}
$$

(c)

$$
\sigma_{\alpha C}(\mathbf{y}) = \max_{\mathbf{x} \in \alpha C} \langle \mathbf{y}, \mathbf{x} \rangle = \max_{\mathbf{x}_{1} \in C} \langle \mathbf{y}, \alpha \mathbf{x}_{1} \rangle = \alpha \max_{\mathbf{x}_{1} \in C} \langle \mathbf{y}, \mathbf{x}_{1} \rangle = \alpha \sigma_{C}(\mathbf{y}).\tag{d}
$$

$$
\begin{array}{l} \sigma_{A + B}(\mathbf{y}) = \max_{\mathbf{x} \in A + B} \langle \mathbf{y}, \mathbf{x} \rangle = \max_{\mathbf{x}_{1} \in A, \mathbf{x}_{2} \in B} \langle \mathbf{y}, \mathbf{x}_{1} + \mathbf{x}_{2} \rangle \\ = \max_{\mathbf{x}_{1} \in A, \mathbf{x}_{2} \in B}[\langle \mathbf{y}, \mathbf{x}_{1} \rangle + \langle \mathbf{y}, \mathbf{x}_{2} \rangle] = \max_{\mathbf{x}_{1} \in A} \langle \mathbf{y}, \mathbf{x}_{1} \rangle + \max_{\mathbf{x}_{2} \in B} \langle \mathbf{y}, \mathbf{x}_{2} \rangle \\ = \sigma_{A}(\mathbf{y}) + \sigma_{B}(\mathbf{y}).\quad \square \end{array}
$$

Following are some basic examples of support functions.

Example 2.25 (support functions of finite sets). Suppose that

$$
C = \{\mathbf{b}_{1}, \mathbf{b}_{2}, \dots, \mathbf{b}_{m}\},
$$

where $\mathbf{b}_{1}, \mathbf{b}_{2}, \ldots, \mathbf{b}_{m} \in \mathbb{E}$ . Then

$$
\sigma_{C}(\mathbf{y}) = \max \{\langle \mathbf{b}_{1}, \mathbf{y} \rangle, \langle \mathbf{b}_{2}, \mathbf{y} \rangle, \dots, \langle \mathbf{b}_{m}, \mathbf{y} \rangle\}.
$$

Recall that $S \subseteq \mathbb{E}$ is called a cone if it satisfies the following property: for any $\mathbf{x} \in S$ and $\lambda \geq 0$ , the inclusion $\lambda \mathbf{x} \in S$ holds.

Example 2.26 (support functions of cones). Let $K \subseteq \mathbb{E}$ be a cone. Define the polar cone of K as

$$
K^{\circ} = \left\{\mathbf{y} \in \mathbb{E}^{*}: \langle \mathbf{y}, \mathbf{x} \rangle \leq 0 \text{for all} \mathbf{x} \in K \right\}.
$$

We will show that

$$
\sigma_{K}(\mathbf{y}) = \delta_{K^{\circ}}(\mathbf{y}).\tag{2.14}
$$

Indeed, if $\mathbf{y} ~ \in ~ K^{\circ}$ , then $\langle \mathbf{y}, \mathbf{x} \rangle ~ \leq ~ 0$ for all $\textbf{x} \in \K$ and for $\mathbf{x} = \mathbf{0}, \langle \mathbf{y}, \mathbf{x} \rangle = 0$ Therefore,

$$
\sigma_{K}(\mathbf{y}) = \max_{\mathbf{x} \in K} \langle \mathbf{y}, \mathbf{x} \rangle = 0.
$$

If $\textbf{y} \notin \K^{\circ}$ , then there exists $\tilde{\textbf{x}} \in \K$ such that $\langle \mathbf{y}, \tilde{\mathbf{x}} \rangle > 0$ . Since $\lambda \tilde{\mathbf{x}} \in K$ for all $\lambda \geq 0$ , it follows that

$$
\sigma_{K}(\mathbf{y}) \geq \langle \mathbf{y}, \lambda \tilde{\mathbf{x}} \rangle = \lambda \langle \mathbf{y}, \tilde{\mathbf{x}} \rangle \text{for all} \lambda \geq 0.
$$

Taking $\lambda \to \infty$ , we obtain that $\sigma_{K}({\bf y}) = \infty \mathrm{~ for ~}{\bf y} \notin K^{\circ}$ , and hence formula (2.14) is proven. ■

Example 2.27 (support function of the nonnegative orthant). Consider the space $\mathbb{E} = \mathbb{R}^{n}$ . As a special case of Example 2.26, since $(\mathbb{R}_{+}^{n})^{\circ} = \bar{\mathbb{R}}_{-}^{n}$ , it follows that

$$
\sigma_{\mathbb{R}_{+}^{n}}(\mathbf{y}) = \delta_{\mathbb{R}_{-}^{n}}(\mathbf{y}).
$$

The next example uses Farkas’s lemma,<sup>6</sup> which we now recall.

Lemma 2.28 (Farkas’s lemma—second formulation). Let $\mathbf{c} \in \mathbb{R}^{n}$ and $\mathbf{A \in}$ $\mathbb{R}^{m \times n}$ . Then the following two claims are equivalent:

A. The implication $\mathbf{A} \mathbf{x} \leq \mathbf{0} \Rightarrow \mathbf{c}^{T} \mathbf{x} \leq 0$ holds true.

B. There exists $\mathbf{y} \in \mathbb{R}_{+}^{m}$ such that $\mathbf{A}^{T} \mathbf{y} = \mathbf{c}.$

Example 2.29 (support functions of convex polyhedral cones). Let the underlying space be $\mathbb{E} = \mathbb{R}^{n}$ and let $\mathbf{A} \in \mathbb{R}^{m \times n}$ . Define the set

$$
S = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Ax} \leq \mathbf{0}\}.
$$

Since $S$ is a cone, we can use Example 2.26 to conclude that

$$
\sigma_{S}(\mathbf{y}) = \delta_{S^{\circ}}(\mathbf{y}).
$$

Note that $\mathbf{y} \in S^{\circ}$ if and only if

$$
\langle \mathbf{y}, \mathbf{x} \rangle \leq 0 \mathrm{foranyxsatisfying} \mathbf{Ax} \leq \mathbf{0}.\tag{2.15}
$$

By Farkas’s lemma (Lemma 2.28), (2.15) is equivalent to the statement

there exists $\pmb{\lambda} \in \mathbb{R}_{+}^{m}$ such that $\mathbf{A}^{T} \lambda = \mathbf{y}$

Hence,

$$
S^{\circ} = \left\{\mathbf{A}^{T} \boldsymbol{\lambda}: \boldsymbol{\lambda} \in \mathbb{R}_{+}^{m} \right\}.
$$

To conclude,

$$
\sigma_{S}(\mathbf{y}) = \delta_{\{\mathbf{A}^{T} \boldsymbol{\lambda}: \boldsymbol{\lambda} \in \mathbb{R}_{+}^{m}\}}(\mathbf{y}).
$$

Example 2.30 (support functions of Affine sets). Let the underlying space be $\mathbb{E} = \mathbb{R}^{n}$ and let $\dot{\mathbf{B}} \in \mathbb{R}^{m \times n}$ ， $\mathbf{b} \in \mathbb{R}^{m}$ . Define the Affine set

$$
C = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Bx} = \mathbf{b}\}.
$$

We assume that C is nonempty, namely, that there exists $\mathbf{x}_{0} \in \mathbb{R}^{n}$ for which $\mathbf{Bx}_{\mathrm{0}} =$ b. The support function is obviously given by

$$
\sigma_{C}(\mathbf{y}) = \max_{\mathbf{x}} \left\{\langle \mathbf{y}, \mathbf{x} \rangle : \mathbf{Bx} = \mathbf{b} \right\}.
$$

Making the change of variables ${\bf x} ={\bf z} +{\bf x}_{0}$ , we obtain that the support function can be rewritten as

$$
\begin{array}{rl} \sigma_{C}(\mathbf{y}) & = \max_{\mathbf{z}} \{\langle \mathbf{y}, \mathbf{z} \rangle + \langle \mathbf{y}, \mathbf{x}_{0} \rangle : \mathbf{Bz} = \mathbf{0}\} \\ & = \langle \mathbf{y}, \mathbf{x}_{0} \rangle + \max_{\mathbf{z}} \{\langle \mathbf{y}, \mathbf{z} \rangle : \mathbf{Bz} = \mathbf{0}\} \\ & = \langle \mathbf{y}, \mathbf{x}_{0} \rangle + \sigma_{\tilde{C}}(\mathbf{y}), \end{array}\tag{2.16}
$$

where $\tilde{C} = \{\mathbf{x} \in \mathbb{R}^{n} : \mathbf{Bx} = \mathbf{0}\}$ . The set $\tilde{C}$ is a convex polyhedral cone that can be written as

$$
\tilde{C} = \left\{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Ax} \leq \mathbf{0} \right\},
$$

where $\mathbf{A} = \left(\begin{array}{c}{\mathbf{B}} \\{- \mathbf{B}} \end{array} \right)$ . By Example 2.29, it follows that

$$
\sigma_{\tilde{C}} = \delta_{\tilde{C}^{\circ}},\tag{2.17}
$$

where $\tilde{C}^{\circ}$ is the polar cone of ${\tilde{C}}_{;}$ , which is given by

$$
\tilde{C}^{\circ} = \left\{\mathbf{B}^{T} \boldsymbol{\lambda}_{1} - \mathbf{B}^{T} \boldsymbol{\lambda}_{2}: \boldsymbol{\lambda}_{1}, \boldsymbol{\lambda}_{2} \in \mathbb{R}_{+}^{m} \right\}.
$$

We will show that

$$
\tilde{C}^{\circ} = \operatorname{Range}(\mathbf{B}^{T}).\tag{2.18}
$$

Indeed, if $\mathbf{v} \in \tilde{C}^{\circ}$ , then there exists $\lambda_{1}, \lambda_{2} \in \mathbb{R}_{+}^{m}$ for which $\mathbf{v} = \mathbf{B}^{T} \lambda_{1} - \mathbf{B}^{T} \lambda_{2} =$ $\mathbf{B}^{T}(\lambda_{1} - \lambda_{2}) \in$ Range(B<sup>T</sup> ). In the other direction, if $\mathbf{v} \in \mathrm{Range}(\mathbf{B}^{T})$ , then there exists $\boldsymbol{\lambda} \in \mathbb{R}^{m}$ for which $\dot{\mathbf{v}} = \mathbf{B}^{T} \boldsymbol{\lambda}$ . Defining $\lambda_{1} =[\lambda]_{+}, \lambda_{2} =[- \lambda]_{+}$ , we obtain that $\lambda = \lambda_{1} - \lambda_{2}$ with $\lambda_{1}, \lambda_{2} \in \mathbb{R}_{+}^{m}$ , and hence

$$
\mathbf{v} = \mathbf{B}^{T} \boldsymbol{\lambda} = \mathbf{B}^{T}(\boldsymbol{\lambda}_{1} - \boldsymbol{\lambda}_{2}) = \mathbf{B}^{T} \boldsymbol{\lambda}_{1} - \mathbf{B}^{T} \boldsymbol{\lambda}_{2} \in \tilde{C}^{\circ}.
$$

Combining (2.16), (2.17), and (2.18), we finally conclude that

$$
\sigma_{C}(\mathbf{y}) = \langle \mathbf{y}, \mathbf{x}_{0} \rangle + \delta_{\mathrm{Range}(\mathbf{B}^{T})}(\mathbf{y}).
$$

Example 2.31 (support functions of unit balls). Suppose that <sup>E</sup> is the underlying space endowed with a norm $\| \cdot \|$ . Consider the unit ball given by

$$
B_{\| \cdot \|}[\mathbf{0}, 1] = \{\mathbf{x} \in \mathbb{E}: \| \mathbf{x} \| \leq 1\}.
$$

By the definition of the dual norm, we have for any $\mathbf{y} \in \mathbb{E}^{*}$

$$
\sigma_{B_{\| \cdot \|}[\mathbf{0}, 1]}(\mathbf{y}) = \max_{\| \mathbf{x} \| \leq 1} \left\langle \mathbf{y}, \mathbf{x} \right\rangle = \| \mathbf{y} \|_{*}.
$$

Thus, for example, for the space $\mathbb{R}^{n}$ we have

$$
\begin{array}{l} \sigma_{B_{\| \cdot \|_{p}}[\mathbf{0}, 1]}(\mathbf{y}) = \| \mathbf{y} \|_{q} \quad \left(1 \leq p \leq \infty, \frac{1}{p} + \frac{1}{q} = 1\right), \\ \sigma_{B_{\| \cdot \|_{\mathbf{Q}}}[\mathbf{0}, 1]}(\mathbf{y}) = \| \mathbf{y} \|_{\mathbf{Q}^{- 1}} \quad(\mathbf{Q} \in \mathbb{S}_{+ +}^{n}).\end{array}
$$

In the first formula we use the convention that $p = 1 / \infty$ corresponds to $q = \infty / 1$

The next example is also an example of a closed and convex function that is not continuous (recall that such an example does not exist for one-dimensional functions; see Theorem 2.22).

Example 2.32.<sup>7</sup> Consider the following set in $\mathbb{R}^{2}$ :

$$
C = \left\{\left(x_{1}, x_{2}\right)^{T}: x_{1} + \frac{x_{2}^{2}}{2} \leq 0 \right\}.
$$

Then the support function of $C$ is given by

$$
\sigma_{C}(\mathbf{y}) = \max_{x_{1}, x_{2}} \left\{y_{1} x_{1} + y_{2} x_{2}: x_{1} + \frac{x_{2}^{2}}{2} \leq 0 \right\}.\tag{2.19}
$$

Obviously, $\sigma_{C}(\mathbf{0}) = 0$ . We will compute the support function at $\mathbf y \neq \mathbf 0$ . In this case, it is easy to see that the maximum of problem (2.19) is attained at the boundary of $C.^{8}$ Therefore,

$$
\sigma_{C}(\mathbf{y}) = \max_{x_{1}, x_{2}} \left\{y_{1} x_{1} + y_{2} x_{2}: x_{1} + \frac{x_{2}^{2}}{2} = 0 \right\} = \max_{x_{2}} \left\{- \frac{y_{1}}{2} x_{2}^{2} + y_{2} x_{2} \right\}.
$$

If $y_{1} < 0$ , then the maximal value is $\infty$ . If $y_{1} = 0$ and $y_{2} \neq 0$ , then the maximal value is also $\infty$ . If $y_{1} > 0$ , the maximum is attained at $\begin{array}{r}{x_{2} = \frac{y_{2}}{y_{1}}} \end{array}$ , and the corresponding maximal value is $\frac{y_{2}^{2}}{2y_{1}}$ . Thus, the support function is given by

$$
\sigma_{C}(\mathbf{y}) = \left\{\begin{array}{ll} \frac{y_{2}^{2}}{2y_{1}}, & y_{1} > 0, \\ 0, & y_{1} = y_{2} = 0, \\ \infty & \text{else}.\end{array} \right.
$$

By Lemma 2.23, $\sigma_{C}$ is closed and convex. However, it is not continuous at $(y_{1}, y_{2}) =(0, 0)$ . Indeed, taking for any $\alpha > 0$ the path $\begin{array}{r}{y_{1}(t) = \frac{t^{2}}{2 \alpha}, y_{2}(t) = t(t > 0)} \end{array}$ we obtain that

$$
\sigma_{C}(y_{1}(t), y_{2}(t)) = \alpha,
$$

and hence the limit of $\sigma_{C}(y_{1}(t), y_{2}(t))$ as $t \to 0^{+}$ is $\alpha_{\mathrm{{;}}}$ , which combined with the fact that $\sigma_{C}(0, 0) = 0$ implies the discontinuity of f at (0, 0). The contour lines of $\sigma_{C}$ are plotted in Figure 2.3.

![Figure 2.3](../../../transcripts/mineru/first-order-methods-optimization/parts/p001-200/images/0324062134cbffdcbdfa9a8141b37550e7dfc991d694b68538f6d2bf098e1f5b.jpg)  
Figure 2.3. Contour lines of the closed, convex, and noncontinuous function from Example 2.32.

An important property of support functions is that they are completely determined by their underlying sets as long as these sets are closed and convex. The proof of this result requires the strict separation theorem,<sup>9</sup> which is now recalled.

Theorem 2.33 (strict separation theorem). Let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set, and let ${\bf y} \notin C$ . Then there exist $\mathbf{p} \in \mathbb{E}^{*} \backslash \{\mathbf{0}\}$ and $\alpha \in \mathbb{R}$ such that

$$
\langle \mathbf{p}, \mathbf{y} \rangle > \alpha
$$

and

$$
\langle \mathbf{p}, \mathbf{x} \rangle \leq \alpha forall \mathbf{x} \in C.
$$

Lemma 2.34. Let $A, B \subseteq \mathbb{E}$ be nonempty closed and convex sets. Then $A = B$ if and only if $\sigma_{A} = \sigma_{B}$

Proof. If $A = B$ , then obviously $\sigma_{A} = \sigma_{B}$ . Suppose now that $\sigma_{A} = \sigma_{B}$ . We will prove that $A = B$ . Assume by contradiction that this is not the case, and without loss of generality suppose that there exists $\mathbf{y} \in A$ such that $\mathbf{y} \notin B$ . Since $\mathbf{y} \notin B$ and B is nonempty closed and convex, by the strict separation theorem, there exists a hyperplane separating y from B, meaning that there exists $\mathbf{p} \in \mathbb{E}^{*} \backslash \{\mathbf{0}\}$ and $\alpha > 0$ such that

$$
\langle \mathbf{p}, \mathbf{x} \rangle \leq \alpha < \langle \mathbf{p}, \mathbf{y} \rangle \text{for any} \mathbf{x} \in B.
$$

Taking the maximum over $\mathbf x \in B$ , we conclude that $\sigma_{B}(\mathbf{p}) \leq \alpha < \langle \mathbf{p}, \mathbf{y} \rangle \leq \sigma_{A}(\mathbf{y})$ a contradiction to the assertion that the support functions are the same.

A related result states that the support function stays the same under the operations of closure and convex hull of the underlying set.

## Lemma 2.35. Let $A \subseteq \mathbb{E}$ be nonempty. Then

(a) $\sigma_{A} = \sigma_{\mathrm{cl}(A)};$

(b) $\sigma_{A} = \sigma_{\mathrm{conv}(A)}.$

Proof. (a) Since $A \subseteq \operatorname{cl}(A)$

$$
\sigma_{A}(\mathbf{y}) \leq \sigma_{\operatorname{cl}(A)}(\mathbf{y}) \text{for any} \mathbf{y} \in \mathbb{E}^{*}.\tag{2.20}
$$

We will show the reverse inequality. Let $\textbf{y} \in \mathbb{E}^{*}$ . Then by the definition of the support function, there exists a sequence $\{\mathbf{x}^{k}\}_{k \geq 1} \subseteq \operatorname{cl}(A)$ such that

$$
\langle \mathbf{y}, \mathbf{x}^{k} \rangle \rightarrow \sigma_{\mathrm{cl}(A)}(\mathbf{y}) \mathrm{as} k \rightarrow \infty.\tag{2.21}
$$

By the definition of the closure, it follows that there exists a sequence $\{\mathbf{z}^{k}\}_{k \geq 1} \subseteq A$ such that $\begin{array}{r}{\| \mathbf{z}^{k} - \mathbf{x}^{k} \| \leq \frac{1}{k}} \end{array}$ for all k, and hence

$$
\mathbf{z}^{k} - \mathbf{x}^{k} \rightarrow 0 \mathrm{as} k \rightarrow \infty.\tag{2.22}
$$

Now, since $\mathbf{z}^{k} \in A$

$$
\sigma_{A}(\mathbf{y}) \geq \langle \mathbf{y}, \mathbf{z}^{k} \rangle = \langle \mathbf{y}, \mathbf{x}^{k} \rangle + \langle \mathbf{y}, \mathbf{z}^{k} - \mathbf{x}^{k} \rangle.
$$

Taking $k \to \infty$ and using (2.21), (2.22), we obtain that

$$
\sigma_{A}(\mathbf{y}) \geq \sigma_{\mathrm{cl}(A)}(\mathbf{y}) + 0 = \sigma_{\mathrm{cl}(A)}(\mathbf{y}),
$$

which combined with (2.20) yields the desired result $\sigma_{A} = \sigma_{\mathrm{cl}(A)}$

(b) Since $A \subseteq \mathrm{conv}(A)$ , we have that $\sigma_{A}(\mathbf{y}) \leq \sigma_{\mathrm{conv}(A)}(\mathbf{y})$ for any $\mathbf{y} \in \mathbb{E}^{*}$ . We will show the reverse inequality. Let $\mathbf{y} \in \mathbb{E}^{*}$ . Then by the definition of the support function, there exists a sequence $\{\mathbf{x}^{k}\}_{k \geq 1} \subseteq \mathrm{conv}(A)$ such that

$$
\langle \mathbf{y}, \mathbf{x}^{k} \rangle \rightarrow \sigma_{\mathrm{conv}(A)}(\mathbf{y}) \text{as} k \rightarrow \infty.\tag{2.23}
$$

By the definition of the convex hull, it follows that for any k, there exist vectors $\mathbf{z}_{1}^{k}, \mathbf{z}_{2}^{k}, \ldots, \mathbf{z}_{n_{k}}^{k} \in A(n_{k}$ is a positive integer) and $\lambda^{k} \in \Delta_{n_{k}}$ such that

$$
\mathbf{x}^{k} = \sum_{i = 1}^{n_{k}} \lambda_{i}^{k} \mathbf{z}_{i}^{k}.
$$

Now,

$$
\langle \mathbf{y}, \mathbf{x}^{k} \rangle = \left\langle \mathbf{y}, \sum_{i = 1}^{n_{k}} \lambda_{i}^{k} \mathbf{z}_{i}^{k} \right\rangle = \sum_{i = 1}^{n_{k}} \lambda_{i}^{k} \langle \mathbf{y}, \mathbf{z}_{i}^{k} \rangle \leq \sum_{i = 1}^{n_{k}} \lambda_{i}^{k} \sigma_{A}(\mathbf{y}) = \sigma_{A}(\mathbf{y}),
$$

where the inequality follows by the fact that $\mathbf{z}_{i}^{k} \in A$ . Taking the limit as $k \infty$ and using (2.23), we obtain that $\sigma_{\mathrm{conv}(A)}(\mathbf{y}) \leq \sigma_{A}(\mathbf{y})$

Example 2.36 (support of the unit simplex). Suppose that the underlying space is $\mathbb{R}^{n}$ and consider the unit simplex set $\Delta_{n} = \{\mathbf{x} \in \mathbb{R}^{n} : \mathbf{e}^{T} \mathbf{x} = 1, \mathbf{x} \geq \mathbf{0}\}$ Since the unit simplex can be written as the convex hull of the standard basis of $\mathbb{R}^{n}$ ，

$$
\Delta_{n} = \mathrm{conv} \{\mathbf{e}_{1}, \mathbf{e}_{2}, \ldots, \mathbf{e}_{n}\},
$$

it follows by Lemma 2.35(b) that

$$
\sigma_{\Delta_{n}}(\mathbf{y}) = \sigma_{\{\mathbf{e}_{1}, \dots, \mathbf{e}_{n}\}}(\mathbf{y}) = \max \left\{\langle \mathbf{e}_{1}, \mathbf{y} \rangle, \langle \mathbf{e}_{2}, \mathbf{y} \rangle, \dots, \langle \mathbf{e}_{n}, \mathbf{y} \rangle \right\}.
$$

Since we always assume (unless otherwise stated) that $\mathbb{R}^{n}$ is endowed with the dot product, the support function is

$$
\sigma_{\Delta_{n}}(\mathbf{y}) = \max \{y_{1}, y_{2}, \dots, y_{n}\}.
$$

The table below summarizes the main support function computations that were considered in this section.

<table><tr><td>C</td><td> $\sigma_C(\mathbf{y})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\{\mathbf{b}_1,\mathbf{b}_2,\dots,\mathbf{b}_n\}$ </td><td> $\max_{i=1,2,\dots,n}\langle\mathbf{b}_i,\mathbf{y}\rangle$ </td><td> $\mathbf{b}_i\in\mathbb{E}$ </td><td>Example 2.25</td></tr><tr><td>K</td><td> $\delta_{K^o}(\mathbf{y})$ </td><td>K—cone</td><td>Example 2.26</td></tr><tr><td> $\mathbb{R}_+^n$ </td><td> $\delta_{\mathbb{R}_-^n}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^n$ </td><td>Example 2.27</td></tr><tr><td> $\Delta_n$ </td><td> $\max\{y_1,y_2,\dots,y_n\}$ </td><td> $\mathbb{E}=\mathbb{R}^n$ </td><td>Example 2.36</td></tr><tr><td> $\{\mathbf{x}\in\mathbb{R}^n:\mathbf{A}\mathbf{x}\leq\mathbf{0}\}$ </td><td> $\delta_{\{\mathbf{A}^T\boldsymbol{\lambda}:\boldsymbol{\lambda}\in\mathbb{R}_+^m\}}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{A}\in\mathbb{R}^{m\times n}$ </td><td>Example 2.29</td></tr><tr><td> $\{\mathbf{x}\in\mathbb{R}^n:\mathbf{B}\mathbf{x}=\mathbf{b}\}$ </td><td> $\langle\mathbf{y},\mathbf{x}_0\rangle+\delta_{\text{Range}(\mathbf{B}^T)}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{B}\in\mathbb{R}^{m\times n},\mathbf{b}\in\mathbb{R}^m,\mathbf{B}\mathbf{x}_0=\mathbf{b}$ </td><td>Example 2.30</td></tr><tr><td> $B_{\|\cdot\|}[0,1]$ </td><td> $\| \mathbf{y}\|_*$ </td><td>-</td><td>Example 2.31</td></tr></table>


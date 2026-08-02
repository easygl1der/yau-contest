---
title: "Chapter 11 \u2014 The Block Proximal Gradient Method"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 11
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 14369
source_line_end: 15310
source_pdf_page_range: null
review_status: machine-verified
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
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

# Chapter 11 — The Block Proximal Gradient Method

> [[../README|本书目录]] · [[10-chapter-10-the-proximal-gradient-method|上一章]] · [[12-chapter-12-dual-based-proximal-gradient-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 14369–15310。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 1；sufficient × 12。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 11 The Block Proximal Gradient Method

Underlying Spaces: In this chapter, all the underlying spaces are Euclidean (see the details in Section 11.2).

## 11.1 Decomposition Methods

Many of the methods discussed in this book are decomposition methods, which, loosely speaking, are methods that utilize at each step only a certain portion of the problem’s data or resort to solving a smaller-dimension problem at each step. One class of decomposition methods is the class of functional decomposition methods, in which the data of the problem comprise several functions, and at each iteration only a few of them (perhaps only one) are processed. Examples of functional decomposition methods were studied in the context of the model

$$
\min_{\mathbf{x}} \left\{\sum_{i = 1}^{m} f_{i}(\mathbf{x}): \mathbf{x} \in C \right\}.
$$

In Example 8.36 it was shown that an implementation of the stochastic projected subgradient method amounts to a method of the form

$$
\mathbf{x}^{k + 1} = P_{C}(\mathbf{x}^{k} - t_{k} f_{i_{k}}^{\prime}(\mathbf{x}^{k})),
$$

where the index $i_{k}$ is picked randomly by a uniform distribution. A deterministic version of this method is the incremental projected subgradient method, which was studied in Section 8.4, in which $i_{k}$ is picked by a cyclic order. In both methods, each step exploits only one of the m functions that constitute the data of the problem. The proximal gradient method is actually another example of a functional decomposition method, where the relevant model (see Chapter 10) is

$$
\min_{\mathbf{x} \in \mathbb{E}} f(\mathbf{x}) + g(\mathbf{x}).
$$

The general step of the proximal gradient method is of the form

$$
\mathbf{x}^{k + 1} = \operatorname{prox}_{t_{k} g}(\mathbf{x}^{k} - t_{k} \nabla f(\mathbf{x}^{k})).
$$

The functions $f$ and $g$ are treated separately in the above update formula. First, a gradient step w.r.t. f is taken, and then a prox operator w.r.t. g is computed.

Another class of decomposition methods is the class of variables decomposition methods, in which at each iteration only a subset of the decision variables is altered while all the other variables remain fixed. One example for such a method was given in Example 10.73, where the problem of minimizing a diferentiable function over $\mathbb{R}^{n}$ was considered. The method described in Example 10.73 (non-Euclidean gradient method under the $l_{1}{\mathrm{- norm}})$ picks one variable at each iteration by a certain greedy rule and performs a gradient step w.r.t. the chosen variable while keeping all the other variables fixed.

In this chapter we will consider additional variables decomposition methods; these methods pick at each iteration one block of variables and perform a proximal gradient step w.r.t. the chosen block.

## 11.2 Model and Assumptions

In this chapter we will consider methods for solving the composite model $f + g$ in the case where $g$ has a block separable structure. More specifically, the main model of this chapter is

$$
\min_{\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \dots, \mathbf{x}_{p} \in \mathbb{E}_{p}} \left\{F(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) = f(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) + \sum_{j = 1}^{p} g_{j}(\mathbf{x}_{j}) \right\},\tag{11.1}
$$

where $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{p}$ are Euclidean spaces. We will denote the product space by $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p}$ and use our convention (see Section 1.9) that the product space is also Euclidean with endowed norm

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{p}) \|_{\mathbb{E}} = \sqrt{\sum_{i = 1}^{p} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}}.
$$

In most cases we will omit the subscript of the norm indicating the underlying vector space (whose identity will be clear from the context). The function $g : \mathbb{E}(- \infty, \infty]$ is defined by

$$
g(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) \equiv \sum_{i = 1}^{p} g_{i}(\mathbf{x}_{i}).
$$

The gradient w.r.t. the ith block $(i \in \{1, 2,..., p\})$ is denoted by $\nabla_{i} f$ , and whenever the function is diferentiable it holds tha

$$
\nabla f(\mathbf{x}) = \left(\nabla_{1} f(\mathbf{x}), \nabla_{2} f(\mathbf{x}), \dots, \nabla_{p} f(\mathbf{x})\right).
$$

For any $i \in \{1, 2, \ldots, p\}$ we define $\mathcal{U}_{i} : \mathbb{E}_{i} \mathbb{E}$ to be the linear transformation given by

$$
\mathcal{U}_{i}(\mathbf{d}) =(\mathbf{0}, \ldots, \mathbf{0}, \underbrace{\mathbf{d}}_{ithblock}, \mathbf{0}, \ldots, \mathbf{0}), \quad \mathbf{d} \in \mathbb{E}_{i}.
$$

We also use throughout this chapter the notation that a vector $\mathbf{x} \in \mathbb{E}$ can be written as

$$
\mathbf{x} =(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}),
$$

and this relation will also be written as $\mathbf{x} =(\mathbf{x}_{i})_{i = 1}^{p}$ . Thus, in our notation, the main model (11.1) can be simply written as

$$
\min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) = f(\mathbf{x}) + g(\mathbf{x})\}.
$$

The basic assumptions on the model are summarized below.

## Assumption 11.1.

(A) $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex for any $i \in \{1, 2, \ldots, p\}$

(B) $f : \mathbb{E}(- \infty, \infty]$ is proper and closed, and dom(f) is convex; dom $(g) \subseteq$ int $\left(\operatorname{dom}(f) \right)$ , and f is diferentiable over int $\left(\operatorname{dom}(f) \right)$

(C) f is L<sub>f</sub> -smooth over int $(\mathrm{dom}(f)) \(L_{f} > 0)$

(D) There exist $L_{1}, L_{2}, \dots, L_{p} > 0$ such that for any $i \in \{1, 2, \ldots, p\}$ it holds that

$$
\left\| \nabla_{i} f(\mathbf{x}) - \nabla_{i} f \left(\mathbf{x} + \mathcal{U}_{i}(\mathbf{d})\right) \right\| \leq L_{i} \| \mathbf{d} \|\tag{11.2}
$$

for all $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and d $\in \mathbb{E}_{i}$ for which $\mathbf{x} +{\mathcal{U}}_{i}(\mathbf{d}) \in \operatorname{int}(\operatorname{dom}(f))$

(E) The optimal set of problem (11.1) is nonempty and denoted by $X^{*}$ . The optimal value is denoted by $F_{\mathrm{opt}}$

Remark 11.2 (block/global Lipschitz constants). The constant $L_{f}$ will be called the “global Lipschitz constant,” while the constants $L_{1}, L_{2}, \ldots, L_{p}$ are the “block Lipschitz constants.” Obviously, we can choose $L_{i} = L_{f}$ for all i since by the definition of $L_{f}$ , (11.2) holds for $L_{i} = L_{f}$ . However, the block Lipschitz constants can be significantly smaller than the global Lipschitz constant—a fact that might have significant influence on the performance of the derived algorithms, as well as their convergence rate.

## 11.3 The Toolbox

## 11.3.1 The Partial Gradient Mapping

Recall that the gradient mapping associated with the functions $f, g$ and a constant $L > 0$ , as defined in Section 10.3.2, is a mapping from int $\left(\operatorname{dom}(f) \right)$ to <sup>E</sup> given by

$$
G_{L}^{f, g}(\mathbf{x}) = L \left(\mathbf{x} - T_{L}^{f, g}(\mathbf{x})\right),
$$

where $T_{L}^{f, g}$ : int $(\operatorname{dom}(f)) \to{\mathbb{E}}$ is the prox-grad mapping given by

$$
T_{L}^{f, g}(\mathbf{x}) = \mathrm{prox}_{\frac{1}{L} g} \left(\mathbf{x} - \frac{1}{L} \nabla f(\mathbf{x})\right).
$$

From now on we will always omit the superscripts and write $T_{L}$ and $G_{L}$ instead of $T_{L}^{f, g}$ and $G_{L}^{f, g}$ . In the context of block variables decomposition methods, it is also important to consider the notions of partial prox-grad mappings and partial gradient mappings.

Definition 11.3 (partial prox-grad mapping). Suppose that f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties (A) and (B) of Assumption 11.1, $L > 0$ , and let $i \in \{1, 2, \ldots, p\}$ Then the ith partial prox-grad mapping is the operator $T_{L}^{i}$ : int $(\operatorname{dom}(f)) \to{\mathbb{E}}_{i}$ defined $by$

$$
T_{L}^{i}(\mathbf{x}) = \mathrm{prox}_{\frac{1}{L} g_{i}} \left(\mathbf{x}_{i} - \frac{1}{L} \nabla_{i} f(\mathbf{x})\right).
$$

Definition 11.4 (partial gradient mapping). Suppose that f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties (A) and (B) of Assumption 11.1, $L > 0$ , and let $i \in \{1, 2, \ldots, p\}$ Then the ith partial gradient mapping is the operator $G_{L}^{i}$ : int $(\operatorname{dom}(f)) \to{\mathbb{E}}_{i}$ defined by

$$
G_{L}^{i}(\mathbf{x}) = L \left(\mathbf{x}_{i} - T_{L}^{i}(\mathbf{x})\right).
$$

The ith partial prox-grad and gradient mappings depend on $f$ and $g_{i}.$ , but this dependence is not indicated in our notation. If $g_{i} \equiv 0$ for some $i \in \{1, 2,..., p\}$ then $G_{L}^{i}({\bf x}) = \nabla_{i} f({\bf x})$ ; that is, in this case the partial gradient mapping coincides with the mapping $\mathbf{x} \mapsto \nabla_{i} f(\mathbf{x})$ . Some basic properties of the partial prox-grad and gradient mappings are summarized in the following lemma.

Lemma 11.5. Suppose that f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties (A) and (B) of Assumption 11.1, $L > 0$ , and let $i \in \{1, 2, \ldots, p\}$ . Then for any $\mathbf{x \in}$ int(dom(f )),

$$
\begin{array}{l} T_{L}(\mathbf{x}) =(T_{L}^{1}(\mathbf{x}), T_{L}^{2}(\mathbf{x}), \ldots, T_{L}^{p}(\mathbf{x})), \\ G_{L}(\mathbf{x}) =(G_{L}^{1}(\mathbf{x}), G_{L}^{2}(\mathbf{x}), \ldots, G_{L}^{p}(\mathbf{x})).\end{array}\tag{11.3}
$$

Proof. By Theorem 6.6, we have that for any $\mathbf{y} \in \operatorname{dom}(f)$

$$
\mathrm{prox}_{\frac{1}{L} g}(\mathbf{y}) =(\mathrm{prox}_{\frac{1}{L} g_{i}}(\mathbf{y}_{i}))_{i = 1}^{p}.
$$

Thus, for any $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ ,

$$
\begin{array}{l} T_{L}(\mathbf{x}) = \mathrm{prox}_{\frac{1}{L} g} \left(\mathbf{x} - \frac{1}{L} \nabla f(\mathbf{x})\right) = \left(\mathrm{prox}_{\frac{1}{L} g_{i}} \left(\left[\mathbf{x} - \frac{1}{L} \nabla f(\mathbf{x}) \right]_{i}\right)\right)_{i = 1}^{p} \\ \qquad = \left(\mathrm{prox}_{\frac{1}{L} g_{i}} \left(\mathbf{x}_{i} - \frac{1}{L} \nabla_{i} f(\mathbf{x})\right)\right)_{i = 1}^{p} \\ \qquad =(T_{L}^{i}(\mathbf{x}))_{i = 1}^{p}.\end{array}
$$

The second identity follows immediately:

$$
\begin{array}{rl} & G_{L}(\mathbf{x}) = L(\mathbf{x} - T_{L}(\mathbf{x})) = L \left((\mathbf{x}_{i})_{i = 1}^{p} -(T_{L}^{i}(\mathbf{x}))_{i = 1}^{p}\right) \\ & \qquad = \left(L(\mathbf{x}_{i} - T_{L}^{i}(\mathbf{x}))\right)_{i = 1}^{p} \\ & \qquad = \left(G_{L}^{i}(\mathbf{x})\right)_{i = 1}^{p}.\quad \square \end{array}
$$

A point $\mathbf{x}^{*} \in \mathrm{dom}(g)$ is a stationary point of problem (11.1) if $- \nabla f(\mathbf{x}^{*}) \in$ $\partial g(\mathbf{x}^{*})$ (see Definition 3.73). The following simple theorem shows that the stationarity condition for problem (11.1) can be decomposed into $p$ conditions expressed in terms of the partial gradient mappings.

Theorem 11.6. Suppose that f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties (A) and (B) of Assumption 11.1. Then

(a) $\mathbf{x}^{*} \in \mathrm{dom}(g)$ is a stationary point of problem (11.1) if and only if

$$
- \nabla_{i} f(\mathbf{x}^{*}) \in \partial g_{i}(\mathbf{x}_{i}^{*}), i = 1, 2, \ldots, p;\tag{11.4}
$$

(b) for any p positive numbers $M_{1}, M_{2}, \ldots, M_{p} > 0,{\bf x}^{*} \in$ dom(g) is a stationary point of problem (11.1) if and only if

$$
G_{M_{i}}^{i}(\mathbf{x}^{*}) = \mathbf{0}, i = 1, 2, \ldots, p.
$$

Proof. (a) By definition, $\mathbf{x}^{*} \in \mathrm{dom}(g)$ is a stationary point of problem (11.1) if and only if

$$
- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*}).\tag{11.5}
$$

By the block separable structure of $g,$ it is easy to show that

$$
\partial g(\mathbf{x}^{*}) = \partial g_{1}(\mathbf{x}_{1}^{*}) \times \partial g_{2}(\mathbf{x}_{2}^{*}) \times \dots \times \partial g_{p}(\mathbf{x}_{p}^{*}),
$$

which, combined with the fact that $\nabla f(\mathbf{x}^{*}) =(\nabla_{1} f(\mathbf{x}^{*}), \nabla_{2} f(\mathbf{x}^{*}), \ldots, \nabla_{p} f(\mathbf{x}^{*}))$ ， implies that the relation (11.5) is equivalent to

$$
- \left(\nabla_{1} f \left(\mathbf{x}^{*}\right), \nabla_{2} f \left(\mathbf{x}^{*}\right), \dots, \nabla_{p} f \left(\mathbf{x}^{*}\right)\right) \in \partial g_{1} \left(\mathbf{x}_{1}^{*}\right) \times \partial g_{2} \left(\mathbf{x}_{2}^{*}\right) \times \dots \times \partial g_{p} \left(\mathbf{x}_{p}^{*}\right),
$$

that is, to (11.4).

(b) By the definition of the partial gradient mapping, $G_{M_{i}}^{i}(\mathbf{x}^{*}) = \mathbf{0}$ if and only $\begin{array}{r}{\mathrm{if} \ \mathbf{x}_{i}^{*} = \mathrm{prox}_{\frac{1}{M_{i}} g_{i}} \left(\mathbf{x}_{i}^{*} - \frac{1}{M_{i}} \nabla_{i} f(\mathbf{x}^{*}) \right)} \end{array}$ , which, by the second prox theorem (Theorem 6.39), is equivalent to

$$
\left(\mathbf{x}_{i}^{*} - \frac{1}{M_{i}} \nabla_{i} f(\mathbf{x}^{*})\right) - \mathbf{x}_{i}^{*} \in \frac{1}{M_{i}} \partial g_{i}(\mathbf{x}_{i}^{*}),
$$

that is, to

$$
- \nabla_{i} f(\mathbf{x}^{*}) \in \partial g_{i}(\mathbf{x}_{i}^{*}).
$$

To summarize, $G_{M_{i}}^{i}(\mathbf{x}^{*}) = \mathbf{0}$ for all i if and only if $- \nabla_{i} f(\mathbf{x}^{*}) \in \partial g_{i}(\mathbf{x}_{i}^{*})$ for all i, which, by part (a), is equivalent to saying that $\mathbf{x}^{*}$ is a stationary point of problem (11.1).

The next results shows some monotonicity properties of the partial gradient mapping w.r.t. its parameter. The result is presented without its proof, which is an almost verbatim repetition of the arguments in Theorem 10.9.

Theorem 11.7 (monotonicity of the partial gradient mapping). Suppose that f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties (A) and (B) of Assumption 11.1, and let $i \in \{1, 2, \ldots, p\}$ . Suppose that $L_{1} \ge L_{2} > 0$ . Then

$$
\| G_{L_{1}}^{i}(\mathbf{x}) \| \geq \| G_{L_{2}}^{i}(\mathbf{x}) \|
$$

and

$$
\frac{\| G_{L_{1}}^{i}(\mathbf{x}) \|}{L_{1}} \leq \frac{\| G_{L_{2}}^{i}(\mathbf{x}) \|}{L_{2}}
$$

for any x ∈ int(dom(f )).

## 11.3.2 The Block Descent Lemma

The block descent lemma is a variant of the descent lemma (Lemma 5.7), and its proof is almost identical.

Lemma 11.8 (block descent lemma). Let $f : \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p} \to(- \infty, \infty]$ be a proper function whose domain dom(f) is convex. Assume that f is diferentiable over int $\left(\operatorname{dom}(f) \right)$ . Let $i \in \{1, 2, \ldots, p\}$ . Suppose that there exists $L_{i} > 0$ for which

$$
\left\| \nabla_{i} f(\mathbf{y}) - \nabla_{i} f(\mathbf{y} + \mathcal{U}_{i}(\mathbf{d})) \right\| \leq L_{i} \| \mathbf{d} \|
$$

for any $\mathbf{y} \in \operatorname{int}(\operatorname{dom}(f))$ and $\mathbf{d} \in \mathbb{E}_{i}$ for which $\mathbf{y} + \mathcal{U}_{i}(\mathbf{d}) \in \mathrm{int}(\mathrm{dom}(f))$ . Then

$$
f(\mathbf{x} + \mathcal{U}_{i}(\mathbf{d})) \leq f(\mathbf{x}) + \langle \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle + \frac{L_{i}}{2} \| \mathbf{d} \|^{2}
$$

for any $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and d $\in \mathbb{E}_{i}$ for which $\mathbf{x} +{\mathcal{U}}_{i}(\mathbf{d}) \in \operatorname{int}(\operatorname{dom}(f))$

Proof. Let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and $\mathbf{d} \in \mathbb{E}_{i}$ such that $\mathbf{x} +{\mathcal{U}}_{i}(\mathbf{d}) \in \operatorname{int}(\operatorname{dom}(f))$ . Denote $\mathbf{x}^{(t)} = \mathbf{x} + t \mathcal{U}_{i}(\mathbf{d})$ and define $g(t) = f(\mathbf{x}^{(t)})$ . By the fundamental theorem of calculus,

$$
\begin{array}{rl} & f(\mathbf{x}^{(1)}) - f(\mathbf{x}) = g(1) - g(0) = \int_{0}^{1} g^{\prime}(t) dt \\ & \qquad = \int_{0}^{1} \langle \nabla f(\mathbf{x}^{(t)}), \mathcal{U}_{i}(\mathbf{d}) \rangle dt = \int_{0}^{1} \langle \nabla_{i} f(\mathbf{x}^{(t)}), \mathbf{d} \rangle dt \\ & \qquad = \langle \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle + \int_{0}^{1} \langle \nabla_{i} f(\mathbf{x}^{(t)}) - \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle dt.\end{array}
$$

Thus,

$$
\begin{array}{l} | f(\mathbf{x}^{(1)}) - f(\mathbf{x}) - \langle \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle | = \left| \int_{0}^{1} \langle \nabla_{i} f(\mathbf{x}^{(t)}) - \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle dt \right| \\ \leq \int_{0}^{1} | \langle \nabla_{i} f(\mathbf{x}^{(t)}) - \nabla_{i} f(\mathbf{x}), \mathbf{d} \rangle | dt \\ \stackrel{{(*)}}{{\leq}} \int_{0}^{1} \| \nabla_{i} f(\mathbf{x}^{(t)}) - \nabla_{i} f(\mathbf{x}) \| \cdot \| \mathbf{d} \| dt \\ \leq \int_{0}^{1} tL_{i} \| \mathbf{d} \|^{2} dt \\ = \frac{L_{i}}{2} \| \mathbf{d} \|^{2}, \end{array}
$$

where the Cauchy–Schwarz inequality was used in (∗).

## 11.3.3 sufficient Decrease

The basic step that will be employed by all the methods discussed in this chapter is a proximal gradient step w.r.t. a given block. Specifically, for a given $\mathbf{x} \in \mathbb{E}$ and $i \in \{1, 2, \ldots, p\}$ , the next updated vector $\mathbf{x}^{+}$ will have the form

$$
\mathbf{x}_{j}^{+} = \left\{\begin{array}{ll} \mathbf{x}_{j}, & j \neq i, \\ T_{L_{i}}^{i}(\mathbf{x}), & j = i.\end{array} \right.
$$

The above update formula can be compactly written as

$$
\mathbf{x}^{+} = \mathbf{x} + \mathcal{U}_{i}(T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i}).
$$

We will now prove a variant of the sufficient decrease lemma (Lemma 10.4), in which only Lipschitz continuity w.r.t. a certain block of the gradient of the function is assumed.

Lemma 11.9 (block sufficient decrease lemma). Suppose that f and $g_{1}, g_{2}$ $\cdot \cdot \cdot g_{p}$ satisfy properties (A) and (B) of Assumption 11.1. Let $i \in \{1, 2,..., p\}$ Suppose that there exists $L_{i} > 0$ for which

$$
\left\| \nabla_{i} f(\mathbf{y}) - \nabla_{i} f(\mathbf{y} + \mathcal{U}_{i}(\mathbf{d})) \right\| \leq L_{i} \| \mathbf{d} \|
$$

for any $\mathbf{y} \in \operatorname{int}(\operatorname{dom}(f))$ and d $\in \mathbb{E}_{i}$ for which $\mathbf{y} + \mathcal{U}_{i}(\mathbf{d}) \in \mathrm{int}(\mathrm{dom}(f))$ . Then

$$
F(\mathbf{x}) - F(\mathbf{x} + \mathcal{U}_{i}(T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i})) \geq \frac{1}{2L_{i}} \| G_{L_{i}}^{i}(\mathbf{x}) \|^{2}\tag{11.6}
$$

for all $\mathbf{x \in}$ int(dom(f )).

Proof. For the sake of simplicity, we use the shorthand notation $\mathbf{x}^{+} ~ = ~ \mathbf{x} ~ +$ $\mathcal{U}_{i}(T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i})$ . By the block descent lemma (Lemma 11.8), we have that

$$
f(\mathbf{x}^{+}) \leq f(\mathbf{x}) + \left\langle \nabla_{i} f(\mathbf{x}), T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \right\rangle + \frac{L_{i}}{2} \| T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \|^{2}.\tag{11.7}
$$

By the second prox theorem (Theorem 6.39), since $T_{L_{i}}^{i}({\bf x}) ~ = ~ \mathrm{prox}_{\frac{1}{L_{i}} g_{i}} \left({\bf x}_{i} ~ - ~ \right.$ $\textstyle{\frac{1}{L_{i}}} \nabla_{i} f(\mathbf{x}))$ , we have

$$
\left\langle \mathbf{x}_{i} - \frac{1}{L_{i}} \nabla_{i} f(\mathbf{x}) - T_{L_{i}}^{i}(\mathbf{x}), \mathbf{x}_{i} - T_{L_{i}}^{i}(\mathbf{x}) \right\rangle \leq \frac{1}{L_{i}} g_{i}(\mathbf{x}_{i}) - \frac{1}{L_{i}} g_{i}(T_{L_{i}}^{i}(\mathbf{x})),
$$

and hence

$$
\left\langle \nabla_{i} f(\mathbf{x}), T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \right\rangle \leq - L_{i} \left\| T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \right\|^{2} + g_{i}(\mathbf{x}_{i}) - g_{i}(\mathbf{x}_{i}^{+}),
$$

which, combined with (11.7), yields

$$
f(\mathbf{x}^{+}) + g_{i}(\mathbf{x}_{i}^{+}) \leq f(\mathbf{x}) + g_{i}(\mathbf{x}_{i}) - \frac{L_{i}}{2} \left\| T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \right\|^{2}.
$$

Adding the identity $\begin{array}{r}{\sum_{j \neq i} g_{j}(\mathbf{x}_{j}^{+}) = \sum_{j \neq i} g_{j}(\mathbf{x}_{j})} \end{array}$ to the last inequality yields

$$
F(\mathbf{x}^{+}) \leq F(\mathbf{x}) - \frac{L_{i}}{2} \left\| T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i} \right\|^{2},
$$

which, by the definition of the partial gradient mapping, is equivalent to the desired result (11.6).

Remark 11.10. Under the setting of Lemma 11.9, if we denote $\mathbf{x}^{+} ~ = ~ \mathbf{x} ~ +$ $\mathcal{U}_{i}(T_{L_{i}}^{i}(\mathbf{x}) - \mathbf{x}_{i})$ , then the sufficient decrease condition (11.6) can be written in the following form:

$$
F(\mathbf{x}) - F(\mathbf{x}^{+}) \geq \frac{L_{i}}{2} \| \mathbf{x} - \mathbf{x}^{+} \|^{2}.
$$

## 11.4 The Cyclic Block Proximal Gradient Method

In the cyclic block proximal gradient (CBPG) method we successively pick a block in a cyclic manner and perform a prox-grad step w.r.t. the chosen block. The kth iterate is denoted by $\mathbf{x}^{k} \hat{=}(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}, \cdot \cdot \cdot, \mathbf{x}_{p}^{k})$ . Each iteration of the CBPG method involves $p$ “subiterations,” and the by-products of these subiterations will be denoted by the following auxiliary subsequences:

$$
\begin{array}{rl} &{\mathbf{x}^{k, 0} = \mathbf{x}^{k} =(\mathbf{x}_{1}^{k}, \mathbf{x}_{2}^{k}, \ldots, \mathbf{x}_{p}^{k}),} \\ &{\mathbf{x}^{k, 1} =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k}, \ldots, \mathbf{x}_{p}^{k}),} \\ &{\mathbf{x}^{k, 2} =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k + 1}, \mathbf{x}_{3}^{k}, \ldots, \mathbf{x}_{p}^{k}),} \\ &{\quad \vdots} \\ &{\mathbf{x}^{k, p} = \mathbf{x}^{k + 1} =(\mathbf{x}_{1}^{k + 1}, \mathbf{x}_{2}^{k + 1}, \ldots, \mathbf{x}_{p}^{k + 1}).} \end{array}
$$

We can also write the following formula for the kth member of the ith auxiliary sequence:

$$
\mathbf{x}^{k, i} = \sum_{j = 1}^{i} \mathcal{U}_{j}(\mathbf{x}_{j}^{k + 1}) + \sum_{j = i + 1}^{p} \mathcal{U}_{j}(\mathbf{x}_{j}^{k}).\tag{11.8}
$$

We are now ready to present the method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Cyclic Block Proximal Gradient (CBPG) Method
Initialization: pick  $\mathbf{x}^{0} =(\mathbf{x}_{1}^{0}, \mathbf{x}_{2}^{0}, \ldots, \mathbf{x}_{p}^{0}) \in \text{int}(\text{dom}(f))$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
- set  $x^{k,0} = x^{k}$ ;
- for  $i = 1, 2, \ldots, p$ , compute
 $x^{k,i} = x^{k,i-1} + \mathcal{U}_i(T_{L_i}^i(x^{k,i-1}) - x_i^{k,i-1})$ ;
- set  $x^{k+1} = x^{k,p}$ .
</div>

## 11.4.1 Convergence Analysis of the CBPG Method—The Nonconvex Case

The convergence analysis of the CBPG method relies on the following technical lemma, which is a direct consequence of the sufficient decrease property of Lemma 11.9.

Lemma 11.11 (sufficient decrease of the CBPG method—version I). Suppose that Assumption 11.1 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the CBPG method for solving problem (11.1) with the auxiliary sequences defined in (11.8). Then

(a) for all $k \geq 0$ and $j \in \{0, 1, \ldots, p - 1\}$ it holds that

$$
F(\mathbf{x}^{k, j}) - F(\mathbf{x}^{k, j + 1}) \geq \frac{1}{2L_{j + 1}} \| G_{L_{j + 1}}^{j + 1}(\mathbf{x}^{k, j}) \|^{2},\tag{11.9}
$$

or equivalently,

$$
F(\mathbf{x}^{k, j}) - F(\mathbf{x}^{k, j + 1}) \geq \frac{L_{j + 1}}{2} \| \mathbf{x}^{k, j} - \mathbf{x}^{k, j + 1} \|^{2};\tag{11.10}
$$

(b) for all $k \geq 0$

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{L_{\mathrm{min}}}{2} \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \|^{2},\tag{11.11}
$$

where $\begin{array}{r}{L_{\operatorname{min}} = \operatorname{min}_{i = 1, 2,..., p} L_{i}} \end{array}$

Proof. (a) Inequality (11.9) follows by invoking Lemma 11.9 with $\mathbf{x} = \mathbf{x}^{k, j}$ and $i = j + 1$ . The result (11.10) now follows by the identity $\| \mathbf{x}^{k, j} - \mathbf{x}^{k, j + 1} \|^{2} =$ $\begin{array}{r}{\| T_{L_{j + 1}}^{j + \frac{\check{\jmath}}{1}}(\mathbf{x}^{k, j}) - \mathbf{x}_{j + 1}^{k} \|^{2} = \frac{\setminus}{L_{j + 1}^{2}} \| \mathring{G}_{L_{j + 1}}^{j + 1}(\mathbf{x}^{k, j}) \|^{2}} \end{array}$

(b) Summing the inequality (11.10) over $j = 0, 1, \ldots, p - 1$ , we obtain

$$
\begin{array}{l} F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) = \sum_{j = 0}^{p - 1}(F(\mathbf{x}^{k, j}) - F(\mathbf{x}^{k, j + 1})) \geq \sum_{j = 0}^{p - 1} \frac{L_{j + 1}}{2} \| \mathbf{x}^{k, j} - \mathbf{x}^{k, j + 1} \|^{2} \\ = \sum_{j = 0}^{p - 1} \frac{L_{j + 1}}{2} \| \mathbf{x}_{j + 1}^{k} - \mathbf{x}_{j + 1}^{k + 1} \|^{2} \geq \frac{L_{\min}}{2} \sum_{j = 0}^{p - 1} \| \mathbf{x}_{j + 1}^{k} - \mathbf{x}_{j + 1}^{k + 1} \|^{2} \\ = \frac{L_{\min}}{2} \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \|^{2}.\quad \square \end{array}
$$

A direct result of the last lemma is the monotonicity in function values of the sequence generated by the CBPG method.

Corollary 11.12 (monotonicity of the sequence generated by the CBPG method). Under the setting of Lemma 11.11, for any $k \geq 0, F(\mathbf{x}^{k + 1}) \leq F(\mathbf{x}^{k})$ and equality holds if and only if $\mathbf{\Delta x}^{k} = \mathbf{x}^{k + 1}$

We can now prove a sufficient decrease property of the CBPG method in terms of the (nonpartial) gradient mapping.

Lemma 11.13 (sufficient decrease of the CBPG method—version II). Suppose that Assumption 11.1 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the CBPG method for solving problem (11.1). Then for any $k \geq 0$

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{C}{p} \| G_{L_{\mathrm{min}}}(\mathbf{x}^{k}) \|^{2},\tag{11.12}
$$

where

$$
C = \frac{L_{\mathrm{min}}}{2(L_{f} + 2L_{\mathrm{max}} + \sqrt{L_{\mathrm{min}} L_{\mathrm{max}}})^{2}}\tag{11.13}
$$

and

$$
L_{\mathrm{min}} = \min_{i = 1, 2, \dots, p} L_{i}, L_{\mathrm{max}} = \max_{i = 1, 2, \dots, p} L_{i}.
$$

Proof. Let $i \in \{0, 1, \ldots, p - 1\}$ }. By (11.9),

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq F(\mathbf{x}^{k, i}) - F(\mathbf{x}^{k, i + 1}) \geq \frac{1}{2L_{i + 1}} \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \|^{2}.\tag{11.14}
$$

We can bound $\| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) \|$ as follows:

$$
\begin{array}{ll} \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) \| \leq \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) - G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \| + \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \| &[\text{triangle inequality}] \\ \leq \| G_{L_{i + 1}}(\mathbf{x}^{k}) - G_{L_{i + 1}}(\mathbf{x}^{k, i}) \| + \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \| &[(11.3)] \\ \leq(2L_{i + 1} + L_{f}) \| \mathbf{x}^{k} - \mathbf{x}^{k, i} \| + \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \| &[\text{Lemma 10.10(a)}] \\ \leq(2L_{i + 1} + L_{f}) \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \| + \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \|, \end{array}
$$

where the last inequality follows by the following argument:

$$
\| \mathbf{x}^{k} - \mathbf{x}^{k, i} \| = \sqrt{\sum_{j = 1}^{i} \| \mathbf{x}_{j}^{k} - \mathbf{x}_{j}^{k + 1} \|^{2}} \leq \sqrt{\sum_{j = 1}^{p} \| \mathbf{x}_{j}^{k} - \mathbf{x}_{j}^{k + 1} \|^{2}} = \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \|.
$$

Using the inequalities (11.11) and (11.14), it follows that we can continue to bound $\| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) \|$ as follows:

$$
\begin{array}{rcl} \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) \| & \leq &(2L_{i + 1} + L_{f}) \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \| + \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k, i}) \| \\ & \leq & \left[\frac{\sqrt{2}(2L_{i + 1} + L_{f})}{\sqrt{L_{\min}}} + \sqrt{2L_{i + 1}} \right] \sqrt{F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1})} \\ & \overset{L_{i + 1} \leq L_{\max}}{\leq} & \sqrt{\frac{2}{L_{\min}}}(L_{f} + 2L_{\max} + \sqrt{L_{\min} L_{\max}}) \sqrt{F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1})}.\end{array}
$$

By the monotonicity of the partial gradient mapping (Theorem 11.7), it follows that $\| G_{L_{\operatorname{min}}}^{i + 1}(\mathbf{x}^{k}) \| \leq \| G_{L_{i + 1}}^{i + 1}(\mathbf{x}^{k}) \|$ , and hence, for any $i \in \{0, 1, \ldots, p - 1\}$ ,

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq C \| G_{L_{\mathrm{min}}}^{i + 1}(\mathbf{x}^{k}) \|^{2},
$$

where C is given in (11.13). We can thus conclude that

$$
\| G_{L_{\min}}(\mathbf{x}^{k}) \|^{2} = \sum_{i = 0}^{p - 1} \| G_{L_{\min}}^{i + 1}(\mathbf{x}^{k}) \|^{2} \leq \sum_{i = 0}^{p - 1} \frac{F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1})}{C} = \frac{p}{C}(F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1})),
$$

which is the same as (11.12).

Equipped with Lemma 11.13, it is easy to show some standard convergence properties of the CBPG method.

Theorem 11.14 (convergence of the CBPG method—nonconvex case). Suppose that Assumption 11.1 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the CBPG method for solving problem (11.1). Denote

$$
L_{\min} = \min_{i = 1, 2, \dots, p} L_{i}, L_{\max} = \max_{i = 1, 2, \dots, p} L_{i},
$$

and let C be given in (11.13). Then

(a) $G_{L_{\operatorname{min}}}(\mathbf{x}^{k}) \to \mathbf{0}$ as $k \infty;$

$$
\text{(b)} \min_{n = 0, 1, \dots, k} \| G_{L_{\min}}(\mathbf{x}^{n}) \| \leq \frac{\sqrt{p(F(\mathbf{x}^{0}) - F_{\mathrm{opt}})}}{\sqrt{C(k + 1)}};
$$

(c) all limit points of the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ are stationary points of problem (11.1).

Proof. (a) Since the sequence $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ is nonincreasing (Corollary 11.12) and bounded below (by Assumption 11.1(E)), it converges. Thus, in particular $F(\mathbf{x}^{k}) -$ $F(\mathbf{x}^{k + 1}) 0$ as $k \to \infty$ , which, combined with (11.12), implies that $\| G _ { L _ { \operatorname* { m i n } } } ( \mathbf { x } ^ { k } ) \| $ 0 as $k \to \infty$

(b) By Lemma 11.13, for any $n \geq 0$ 2

$$
F(\mathbf{x}^{n}) - F(\mathbf{x}^{n + 1}) \geq \frac{C}{p} \| G_{L_{\min}}(\mathbf{x}^{n}) \|^{2}.\tag{11.15}
$$

Summing the above inequality over $n = 0, 1, \ldots, k$ , we obtain

$$
F(\mathbf{x}^{0}) - F(\mathbf{x}^{k + 1}) \geq \frac{C}{p} \sum_{n = 0}^{k} \| G_{L_{\min}}(\mathbf{x}^{n}) \|^{2} \geq \frac{C(k + 1)}{p} \min_{n = 0, 1, \dots, k} \| G_{L_{\min}}(\mathbf{x}^{n}) \|^{2}.
$$

Using the fact that $F(\mathbf{x}^{k + 1}) \geq F_{\mathrm{opt}}$ , the result follows.

(c) Let x¯ be a limit point of $\{{\bf x}^{k}\}_{k \ge 0}$ . Then there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \ge 0}$ converging to x¯. For any $j \geq 0$ 2

$$
\begin{array}{rl} &{\| G_{L_{\min}}(\bar{\mathbf{x}}) \| \leq \| G_{L_{\min}}(\mathbf{x}^{k_{j}}) - G_{L_{\min}}(\bar{\mathbf{x}}) \| + \| G_{L_{\min}}(\mathbf{x}^{k_{j}}) \|} \\ &{\qquad \leq(2L_{\min} + L_{f}) \| \mathbf{x}^{k_{j}} - \bar{\mathbf{x}} \| + \| G_{L_{\min}}(\mathbf{x}^{k_{j}}) \|,} \end{array}\tag{11.16}
$$

where Lemma 10.10(a) was used in the last inequality. Since the expression in (11.16) goes to 0 as $j \infty$ , it follows that $G_{L_{\mathrm{min}}}(\bar{\bf x}) ={\bf 0}$ , which, by Theorem 10.7(b), implies that x¯ is a stationary point of problem (11.1).

## 11.4.2 Convergence Analysis of the CBPG Method—The 64 Convex Case

We will now show a rate of convergence in function values of the CBPG method in the case where f is assumed to be convex and a certain boundedness property of the level sets of F holds.

Assumption 11.15.

(A) f is convex.

(B) For any $\alpha > 0$ , there exists $R_{\alpha} > 0$ such that

$$
\max_{\mathbf{x}, \mathbf{x}^{*} \in \mathbb{E}} \left\{\| \mathbf{x} - \mathbf{x}^{*} \|: F(\mathbf{x}) \leq \alpha, \mathbf{x}^{*} \in X^{*} \right\} \leq R_{\alpha}.
$$

The analysis in the convex case is based on the following key lemma describing a recursive inequality relation of the sequence of function values.

Lemma 11.16. Suppose that Assumptions 11.1 and 11.15 hold. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the CBPG method for solving problem (11.1). Then for any $k \geq 0$

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{L_{\mathrm{min}}}{2p(L_{f} + L_{\mathrm{max}})^{2} \mathbb{R}^{2}}(F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}})^{2},
$$

where $\begin{array}{r}{R = R_{F(\mathbf{x}^{0})}, L_{\operatorname{max}} = \operatorname{max}_{j = 1, 2, \dots, p} L_{j}, andL_{\operatorname{min}} = \operatorname{min}_{j = 1, 2, \dots, p} L_{j}.} \end{array}$

Proof. Let $\mathbf{x}^{*} \in X^{*}$ . By the definition of the CBPG method, for any $k \geq 0$ and $j \in \{1, 2,..., p\}$

$$
\mathbf{x}_{j}^{k, j} = \operatorname{prox}_{\frac{1}{L_{j}} g_{j}} \left(\mathbf{x}_{j}^{k, j - 1} - \frac{1}{L_{j}} \nabla_{j} f(\mathbf{x}^{k, j - 1})\right).
$$

Thus, invoking the second prox theorem (Theorem 6.39), for any $\mathbf{y} \in \mathbb{E}_{j}$

$$
g_{j}(\mathbf{y}) \geq g_{j}(\mathbf{x}_{j}^{k, j}) + L_{j} \left\langle \mathbf{x}_{j}^{k, j - 1} - \frac{1}{L_{j}} \nabla_{j} f(\mathbf{x}^{k, j - 1}) - \mathbf{x}_{j}^{k, j}, \mathbf{y} - \mathbf{x}_{j}^{k, j} \right\rangle.
$$

By the definition of the auxiliary sequences given in (11.8), $\mathbf{x}_{j}^{k, j - 1} = \mathbf{x}_{j}^{k}, \mathbf{x}_{j}^{k, j} =$ $\mathbf{x}_{j}^{k + 1}$ , and therefore

$$
g_{j}(\mathbf{y}) \geq g_{j} \left(\mathbf{x}_{j}^{k + 1}\right) + L_{j} \left\langle \mathbf{x}_{j}^{k} - \frac{1}{L_{j}} \nabla_{j} f \left(\mathbf{x}^{k, j - 1}\right) - \mathbf{x}_{j}^{k + 1}, \mathbf{y} - \mathbf{x}_{j}^{k + 1} \right\rangle.
$$

Thus, in particular, if we substitute $\mathbf{y} = \mathbf{x}_{j}^{*}$

$$
g_{j}(\mathbf{x}_{j}^{*}) \geq g_{j}(\mathbf{x}_{j}^{k + 1}) + L_{j} \left\langle \mathbf{x}_{j}^{k} - \frac{1}{L_{j}} \nabla_{j} f(\mathbf{x}^{k, j - 1}) - \mathbf{x}_{j}^{k + 1}, \mathbf{x}_{j}^{*} - \mathbf{x}_{j}^{k + 1} \right\rangle.
$$

Summing the above inequality over $j = 1, 2, \dotsc, p$ yields the inequality

$$
g \left(\mathbf{x}^{*}\right) \geq g \left(\mathbf{x}^{k + 1}\right) + \sum_{j = 1}^{p} L_{j} \left\langle \mathbf{x}_{j}^{k} - \frac{1}{L_{j}} \nabla_{j} f \left(\mathbf{x}^{k, j - 1}\right) - \mathbf{x}_{j}^{k + 1}, \mathbf{x}_{j}^{*} - \mathbf{x}_{j}^{k + 1} \right\rangle.\tag{11.17}
$$

We can now utilize the convexity of $f$ and write

$$
\begin{array}{l} F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) = f(\mathbf{x}^{k + 1}) - f(\mathbf{x}^{*}) + g(\mathbf{x}^{k + 1}) - g(\mathbf{x}^{*}) \\ \qquad \leq \langle \nabla f(\mathbf{x}^{k + 1}), \mathbf{x}^{k + 1} - \mathbf{x}^{*} \rangle + g(\mathbf{x}^{k + 1}) - g(\mathbf{x}^{*}) \\ \qquad = \sum_{j = 1}^{p} \big \langle \nabla_{j} f(\mathbf{x}^{k + 1}), \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \big \rangle + g(\mathbf{x}^{k + 1}) - g(\mathbf{x}^{*}), \end{array}
$$

which, combined with (11.17), implies

$$
\begin{array}{l} F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) \leq \sum_{j = 1}^{p} \left\langle \nabla_{j} f(\mathbf{x}^{k + 1}), \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \right\rangle \\ \qquad + \sum_{j = 1}^{p} L_{j} \left\langle \mathbf{x}_{j}^{k} - \frac{1}{L_{j}} \nabla_{j} f(\mathbf{x}^{k, j - 1}) - \mathbf{x}_{j}^{k + 1}, \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \right\rangle \\ \qquad = \sum_{j = 1}^{p} \left\langle \nabla_{j} f(\mathbf{x}^{k + 1}) - \nabla_{j} f(\mathbf{x}^{k, j - 1}) + L_{j}(\mathbf{x}_{j}^{k} - \mathbf{x}_{j}^{k + 1}), \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \right\rangle.\end{array}
$$

Using the Cauchy–Schwarz and triangle inequalities, we can conclude that

$$
\begin{array}{l} F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}) \leq \sum_{j = 1}^{p} \left(\| \nabla_{j} f(\mathbf{x}^{k + 1}) - \nabla_{j} f(\mathbf{x}^{k, j - 1}) \| + L_{j} \| \mathbf{x}_{j}^{k} - \mathbf{x}_{j}^{k + 1} \|\right) \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \| \\ \leq \sum_{j = 1}^{p} \left(\| \nabla f(\mathbf{x}^{k + 1}) - \nabla f(\mathbf{x}^{k, j - 1}) \| + L_{j} \| \mathbf{x}_{j}^{k} - \mathbf{x}_{j}^{k + 1} \|\right) \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \| \\ \leq \sum_{\substack{j = 1}}^{p} \left(L_{f} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k, j - 1} \| + L_{\max} \| \mathbf{x}^{k} - \mathbf{x}^{k + 1} \|\right) \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \| \\ \leq(L_{f} + L_{\max}) \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \| \sum_{j = 1}^{p} \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \|.\end{array}
$$

Hence,

$$
\begin{array}{l}(F(\mathbf{x}_{k + 1}) - F(\mathbf{x}^{*}))^{2} \leq(L_{f} + L_{\max})^{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} \left(\sum_{j = 1}^{p} \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \|\right)^{2} \\ \leq p(L_{f} + L_{\max})^{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} \sum_{j = 1}^{p} \| \mathbf{x}_{j}^{k + 1} - \mathbf{x}_{j}^{*} \|^{2} \\ = p(L_{f} + L_{\max})^{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} \cdot \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \\ \leq p(L_{f} + L_{\max})^{2} R_{F(\mathbf{x}^{0})}^{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2}, \end{array}\tag{11.18}
$$

where the last inequality follows by the monotonicity of the sequence of function values (Corollary 11.12) and Assumption 11.15(B). Combining (11.18) with (11.11), we obtain that

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{L_{\mathrm{min}}}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} \geq \frac{L_{\mathrm{min}}}{2p(L_{f} + L_{\mathrm{max}})^{2} \mathbb{R}^{2}}(F(\mathbf{x}^{k + 1}) - F(\mathbf{x}^{*}))^{2},
$$

where $R = R_{F({\bf x}^{0})}$ □

To derive the rate of convergence in function values, we will use the following lemma on the convergence of nonnegative scalar sequences satisfying a certain recursive inequality relation. The result resembles the one derived in Lemma 10.70, but the recursive inequality is different.

Lemma 11.17. Let $\{a_{k}\}_{k \ge 0}$ be a nonnegative sequence of real numbers satisfying

$$
a_{k} - a_{k + 1} \geq \frac{1}{\gamma} a_{k + 1}^{2}, \quad k = 0, 1, \ldots,\tag{11.19}
$$

for some $\gamma > 0$ . Then for any $n \geq 2$

$$
a_{n} \leq \max \left\{\left(\frac{1}{2}\right)^{(n - 1) / 2} a_{0}, \frac{4 \gamma}{n - 1} \right\}.\tag{11.20}
$$

In addition, for any $\varepsilon > 0$ , if $n \geq 2$ satisfies

$$
n \geq \max \left\{\frac{2}{\log(2)}(\log(a_{0}) + \log(1 / \varepsilon)), \frac{4 \gamma}{\varepsilon} \right\} + 1,
$$

then $a_{n} \leq \varepsilon$

Proof. Let $n \geq 2$ . If $a_{n} = 0$ , then (11.20) is trivial. We can thus assume that $a_{n} > 0$ , from which it follows that $a_{1}, a_{2}, \dotsc, a_{n - 1} > 0$ . For any $k \in \{0, 1,..., n{-} 1\}$

$$
{\frac{1}{a_{k + 1}}} -{\frac{1}{a_{k}}} ={\frac{a_{k} - a_{k + 1}}{a_{k} a_{k + 1}}} \geq{\frac{1}{\gamma}}{\frac{a_{k + 1}}{a_{k}}}.\tag{11.21}
$$

For each $k,$ , there are two options:

(i) $\begin{array}{r}{\frac{a_{k + 1}}{a_{k}} \leq \frac{1}{2}} \end{array}$

(ii) $\begin{array}{r}{\frac{a_{k + 1}}{a_{k}} > \frac{1}{2}} \end{array}$

By (11.21), under option (ii) we have

$$
\frac{1}{a_{k + 1}} - \frac{1}{a_{k}} \geq \frac{1}{2 \gamma}.
$$

Suppose that n is a positive even integer. If there are at least $\textstyle{\frac{n}{2}}$ indices (out of $k = 0, 1, \ldots, n - 1)$ for which option (ii) occurs, then

$$
\frac{1}{a_{n}} \geq \frac{n}{4 \gamma},
$$

and hence

$$
a_{n} \leq \frac{4 \gamma}{n}.
$$

On the other hand, if this is not the case, then there are at least $\frac{n}{2}$ indices for which option (i) occurs, and consequently

$$
a_{n} \leq \left(\frac{1}{2}\right)^{n / 2} a_{0}.
$$

We therefore obtain that in any case, for an even n,

$$
a_{n} \leq \max \left\{\left(\frac{1}{2}\right)^{n / 2} a_{0}, \frac{4 \gamma}{n} \right\}.\tag{11.22}
$$

If $n \geq 3$ is a positive odd integer, then

$$
a_{n} \leq a_{n - 1} \leq \max \left\{\left(\frac{1}{2}\right)^{(n - 1) / 2} a_{0}, \frac{4 \gamma}{n - 1} \right\}.\tag{11.23}
$$

Since the right-hand side of (11.23) is larger than the right-hand side of (11.22), the result (11.20) follows. Let $n \geq 2$ . To guarantee that the inequality $a_{n} \leq \varepsilon$ holds, it is sufficient that the inequality

$$
\max \left\{\left(\frac{1}{2}\right)^{(n - 1) / 2} a_{0}, \frac{4 \gamma}{n - 1} \right\} \leq \varepsilon
$$

will hold, meaning that the following two inequalities will be satisfied:

$$
\left(\frac{1}{2}\right)^{(n - 1) / 2} a_{0} \leq \varepsilon, \frac{4 \gamma}{n - 1} \leq \varepsilon.
$$

These inequalities are obviously equivalent to

$$
n \geq \frac{2}{\log(2)}(\log(a_{0}) + \log(1 / \varepsilon)) + 1, n \geq \frac{4 \gamma}{\varepsilon} + 1.
$$

Therefore, if

$$
n \geq \max \left\{\frac{2}{\log(2)}(\log(a_{0}) + \log(1 / \varepsilon)), \frac{4 \gamma}{\varepsilon} \right\} + 1,
$$

then the inequality $a_{n} \leq \varepsilon$ is guaranteed.

Combining Lemmas 11.16 and 11.17, we can establish an $O(1 / k)$ rate of convergence in function values of the sequence generated by the CBPG method, as well as a complexity result.

Theorem 11.18 $(O(1 / k)$ rate of convergence of CBPG). Suppose that Assumptions 11.1 and 11.15 hold. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the CBPG method for solving problem (11.1). For any $k \geq 2$ 2

$$
F(\mathbf{x}^{k}) - F_{\mathrm{opt}} \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2}(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}), \frac{8p(L_{f} + L_{\max})^{2} \mathbb{R}^{2}}{L_{\min}(k - 1)} \right\},\tag{11.24}
$$

where $L_{\mathrm{min}} = \mathrm{min}_{i = 1, 2,..., p} L_{i}, L_{\mathrm{max}} = \mathrm{max}_{i = 1, 2,..., p} L_{i}$ , and $R = R_{F({\bf x}^{0})}$ . In addition, if $n \geq 2$ satisfies

$$
n \geq \max \left\{\frac{2}{\log(2)}(\log(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}) + \log(1 / \varepsilon)), \frac{8p(L_{f} + L_{\max})^{2} \mathbb{R}^{2}}{L_{\min} \varepsilon} \right\} + 1,
$$

then $F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \leq \varepsilon.$

Proof. Denote $a_{k} = F(\mathbf{x}^{k}) - F_{\mathrm{opt}}$ . Then by Lemma 11.16,

$$
a_{k} - a_{k + 1} \geq \frac{1}{D} a_{k + 1}^{2},
$$

where $\begin{array}{r}{D = \frac{2p(L_{f} + L_{\mathrm{max}})^{2} \mathbb{R}^{2}}{L_{\mathrm{min}}}} \end{array}$ . The result now follows by invoking Lemma 11.17 with $\gamma = D$ 0

Remark 11.19 (index order). The analysis of the CBPG method was done under the assumption that the index selection strategy is cyclic. However, it is easy to see that the same analysis, and consequently the main results (Theorems 11.14 and 11.18), hold for any index selection strategy in which each block is updated exactly once between consecutive iterations. One example of such an index selection strategy is the “cyclic shufle” order in which the order of blocks is picked at the beginning of each iteration by a random permutation; in a sense, this is a “quasi-randomized” strategy. In the next section we will study a fully randomized approach.

We end this section by showing that for convex diferentiable functions (over the entire space) block Lipschitz continuity (Assumption 11.1(D)) implies that the function is L-smooth (Assumption 11.1(C)) with L being the sum of the block Lipschitz constants. This means that in this situation we can actually drop Assumption 11.1(C).

Theorem 11.20.<sup>65</sup> Let $\phi : \mathbb{E} \mathbb{R} \(\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p})$ be a convex function satisfying the following assumptions:

(A) $\phi$ is diferentiable over $\mathbb{E},$

(B) there exist $L_{1}, L_{2}, \dots, L_{p} > 0$ such that for any $i \in \{1, 2, \ldots, p\}$ it holds that

$$
\left\| \nabla_{i} \phi(\mathbf{x}) - \nabla_{i} \phi(\mathbf{x} + \mathcal{U}_{i}(\mathbf{d})) \right\| \leq L_{i} \| \mathbf{d} \|
$$

for all $\mathbf{x} \in \mathbb{E}$ and d $\in \mathbb{E}_{i}$

Then $\phi$ is L-smooth with $L = L_{1} + L_{2} + \cdot \cdot \cdot + L_{p}$

Proof. Let $\mathbf{y} \in \mathbb{E}$ . Define the function

$$
f(\mathbf{x}) = \phi(\mathbf{x}) - \phi(\mathbf{y}) - \langle \nabla \phi(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle.\tag{11.25}
$$

Then it is immediate to show that $f$ also satisfies properties (A) and (B). In addition, the convexity of $\phi$ implies the convexity of $f$ as well as the fact that f is nonnegative.

Invoking Lemma 11.9 with $g_{1} = g_{2} = \cdot \cdot \cdot = g_{p} \equiv 0$ , we obtain that for all $i \in$ $\{1, 2, \ldots, p\}$ and $\mathbf{x} \in \mathbb{E}$ 2

$$
f(\mathbf{x}) - f \left(\mathbf{x} - \frac{1}{L_{i}} \mathcal{U}_{i}(\nabla_{i} f(\mathbf{x}))\right) \geq \frac{1}{2L_{i}} \| \nabla_{i} f(\mathbf{x}) \|^{2},
$$

which, along with the nonnegativity of $f_{:}$ , implies that

$$
f(\mathbf{x}) \geq \frac{1}{2L_{i}} \| \nabla_{i} f(\mathbf{x}) \|^{2}.
$$

Since the last inequality holds for any $i \in \{1, 2, \ldots, p\}$ , it follows that

$$
\begin{array}{rl} & f(\mathbf{x}) \geq \max_{i = 1, 2, \ldots, p} \left\{\frac{1}{2L_{i}} \| \nabla_{i} f(\mathbf{x}) \|^{2} \right\} \geq \sum_{i = 1}^{p} \frac{L_{i}}{\sum_{j = 1}^{p} L_{j}} \frac{1}{2L_{i}} \| \nabla_{i} f(\mathbf{x}) \|^{2} \\ & \quad = \frac{1}{2(\sum_{j = 1}^{p} L_{j})} \| \nabla f(\mathbf{x}) \|^{2}.\end{array}
$$

Plugging the expression (11.25) for f into the above inequality, we obtain

$$
\phi(\mathbf{x}) \geq \phi(\mathbf{y}) + \langle \nabla \phi(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle + \frac{1}{2(\sum_{j = 1}^{p} L_{j})} \| \nabla \phi(\mathbf{x}) - \nabla \phi(\mathbf{y}) \|^{2}.
$$

Since the above inequality holds for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ , it follows by Theorem 5.8 (equivalence between (i) and (iii)) that $\phi$ is $(L_{1} + L_{2} + \cdots + L_{p})$ -smooth.

## 11.5 The Randomized Block Proximal Gradient Method66

In this section we will analyze a version of the block proximal gradient method in which at each iteration a prox-grad step is performed at a randomly chosen block. The analysis is made under Assumption 11.21 given below. Note that at this point we do not assume that $f$ is convex, but the main convergence result, Theorem 11.25, will require the convexity of $f.$ .

Assumption 11.21.

(A) $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex for any $i \in \{1, 2, \ldots, p\}$

(B) $f : \mathbb{E} \to(- \infty, \infty]$ is proper closed and convex, dom $(g) \subseteq \operatorname{int}(\operatorname{dom}(f))$ , and f is diferentiable over int(dom(f )).

(C) There exist $L_{1}, L_{2}, \dots, L_{p} > 0$ such that for any $i \in \{1, 2, \ldots, p\}$ it holds that

$$
\left\| \nabla_{i} f(\mathbf{x}) - \nabla_{i} f(\mathbf{x} + \mathcal{U}_{i}(\mathbf{d})) \right\| \leq L_{i} \| \mathbf{d} \|
$$

for all $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ and d $\in \mathbb{E}_{i}$ for which $\mathbf{x} +{\mathcal{U}}_{i}(\mathbf{d}) \in \operatorname{int}(\operatorname{dom}(f))$

(D) The optimal set of problem (11.1) is nonempty and denoted by $X^{*}$ . The optimal value is denoted by $F_{\mathrm{opt}}$

Initialization: pick $\mathbf{x}^{0} =(\mathbf{x}_{1}^{0}, \mathbf{x}_{2}^{0}, \ldots, \mathbf{x}_{p}^{0}) \in$ int(dom(f )). General step: for any $k = 0, 1, 2,...$ . execute the following steps:

(a) pick $i_{k} \in \{1, 2,..., p\}$ randomly via a uniform distribution;

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} + \mathcal{U}_{i_{k}}(T_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) - \mathbf{x}_{i_{k}}^{k}).\tag{b}
$$

Remark 11.22. Step (b) of the algorithm can also be written as

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - \frac{1}{L_{i_{k}}} \mathcal{U}_{i_{k}}(G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k})).
$$

From the point of view of computational complexity, loosely speaking, each p iterations of the RBPG method are comparable to one iteration of the CBPG method.

Using the block sufficient decrease lemma (Lemma 11.9), it is easy to show a sufficient decrease property of the RBPG method.

Theorem 11.23 (sufficient decrease of the RBPG method). Suppose that Assumption 11.21 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the RBPG method. Then for any $k \geq 0$ 2

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2L_{i_{k}}} \| G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \|^{2}.
$$

Proof. Invoke Lemma 11.9 with $\mathbf{x} = \mathbf{x}^{k}$ and $i = i_{k}$ □

Remark 11.24. A direct consequence of Theorem 11.23 is that the sequence of function values $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ generated by the RBPG method is nonincreasing. As a result, it is also correct that the sequence of expected function values

$$
\left\{\mathbb{E}_{i_{0}, \dots, i_{k - 1}} \left(F \left(\mathbf{x}^{k}\right)\right) \right\}_{k \geq 0}
$$

is nonincreasing.

In our analysis the following notation is used:

$\xi_{k - 1} \equiv \left\{i_{0}, i_{1}, \dots, i_{k - 1} \right\}$ is a multivariate random variable.

- In addition to the underlying Euclidean norm of the space $\mathbb{E},$ , we define the following weighted norm:

$$
\| \mathbf{x} \|_{L} \equiv \sqrt{\sum_{i = 1}^{p} L_{i} \| \mathbf{x}_{i} \|^{2}}
$$

and its dual norm

$$
\| \mathbf{x} \|_{L, *} = \sqrt{\sum_{i = 1}^{p} \frac{1}{L_{i}} \| \mathbf{x}_{i} \|^{2}}.
$$

- We will consider the following variation of the gradient mapping:

$$
\widetilde{G}(\mathbf{x}) =(G_{L_{1}}^{1}(\mathbf{x}^{k}), G_{L_{2}}^{2}(\mathbf{x}^{k}), \ldots, G_{L_{p}}^{p}(\mathbf{x}^{k})).\tag{11.26}
$$

Obviously, if $L_{1} = L_{2} = \cdot \cdot \cdot = L_{p} = L$ , then $\widetilde{G}(\mathbf{x}) = G_{L}(\mathbf{x})$

The main convergence result will now be stated and proved.

Theorem 11.25 $(O(1 / k)$ rate of convergence of the RBPG method). Suppose that Assumption 11.21 holds and that f is convex. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the RBPG method for solving problem (11.1). Let $\mathbf{x}^{*} \in X^{*}$ . Then for any $k \geq 0$

$$
\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) - F_{\mathrm{opt}} \leq \frac{p}{p + k + 1} \left(\frac{1}{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|_{L}^{2} + F(\mathbf{x}^{0}) - F_{\mathrm{opt}}\right).\tag{11.27}
$$

Proof. Let $\mathbf{x}^{*} \in X^{*}$ . We denote for any $n \geq 0, r_{n} \equiv \left\| \mathbf{x}^{n} - \mathbf{x}^{*} \right\|_{L}$ . Then for any $k \geq 0$

$$
\begin{array}{rl} &{r_{k + 1}^{2} = \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|_{L}^{2}} \\ &{\quad = \left\| \mathbf{x}^{k} - \frac{1}{L_{i_{k}}} \mathcal{U}_{i_{k}} \left(G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k})\right) - \mathbf{x}^{*} \right\|_{L}^{2}} \\ &{\quad = \| \mathbf{x}^{k} - \mathbf{x}^{*} \|_{L}^{2} - \frac{2}{L_{i_{k}}} L_{i_{k}} \langle G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{*} \rangle + \frac{L_{i_{k}}}{L_{i_{k}}^{2}} \| G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \|^{2}} \\ &{\quad = \| \mathbf{x}^{k} - \mathbf{x}^{*} \|_{L}^{2} - 2 \langle G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{*} \rangle + \frac{1}{L_{i_{k}}} \| G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \|^{2}} \\ &{\quad = r_{k}^{2} - 2 \langle G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{*} \rangle + \frac{1}{L_{i_{k}}} \| G_{L_{i_{k}}}(\mathbf{x}^{k}) \|^{2}.} \end{array}
$$

Taking expectation w.r.t. $i_{k}$ , we obtain (using the notation (11.26))

$$
\begin{array}{l} \mathbb{E}_{i_{k}} \left(\frac{1}{2} r_{k + 1}^{2}\right) = \frac{1}{2} r_{k}^{2} - \frac{1}{p} \sum_{i = 1}^{p} \langle G_{L_{i}}^{i}(\mathbf{x}_{k}), \mathbf{x}_{i}^{k} - \mathbf{x}_{i}^{*} \rangle + \frac{1}{2p} \sum_{i = 1}^{p} \frac{1}{L_{i}} \| G_{L_{i}}^{i}(\mathbf{x}^{k}) \|^{2} \\ = \frac{1}{2} r_{k}^{2} - \frac{1}{p} \langle \widetilde{G}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle + \frac{1}{2p} \| \widetilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2}.\end{array} \tag{1}\tag{11.28}
$$

By the block descent lemma (Lemma 11.8),

$$
\begin{array}{rl} & f(\mathbf{x}^{k + 1}) = f \left(\mathbf{x}^{k} - \frac{1}{L_{i_{k}}} \mathcal{U}_{i_{k}}(G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}))\right) \\ & \qquad \leq f(\mathbf{x}^{k}) - \frac{1}{L_{i_{k}}} \langle \nabla_{i_{k}} f(\mathbf{x}^{k}), G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \rangle + \frac{1}{2L_{i_{k}}} \| G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \|^{2}.\end{array}
$$

Hence,

$$
F(\mathbf{x}^{k + 1}) \leq f(\mathbf{x}^{k}) - \frac{1}{L_{i_{k}}} \langle \nabla_{i_{k}} f(\mathbf{x}^{k}), G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \rangle + \frac{1}{2L_{i_{k}}} \| G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \|^{2} + g(\mathbf{x}^{k + 1}).
$$

Taking expectation of both sides of the last inequality w.r.t. $i_{k}$ , we obtain

$$
\mathbb{E}_{i_{k}}(F(\mathbf{x}^{k + 1})) \leq f(\mathbf{x}^{k}) - \frac{1}{p} \sum_{i = 1}^{p} \frac{1}{L_{i}} \langle \nabla_{i} f(\mathbf{x}^{k}), G_{L_{i}}^{i}(\mathbf{x}^{k}) \rangle + \frac{1}{2p} \| \widetilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2} + \mathbb{E}_{i_{k}}(g(\mathbf{x}^{k + 1})).\tag{11.29}
$$

Since $\begin{array}{r}{\mathbf{x}_{i_{k}}^{k + 1} = \mathbf{x}_{i_{k}}^{k} - \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) = \mathrm{prox}_{\frac{1}{L_{i_{k}}} g_{i_{k}}} \left(\mathbf{x}_{i_{k}}^{k} - \frac{1}{L_{i_{k}}} \nabla_{i_{k}} f(\mathbf{x}^{k}) \right)} \end{array}$ , it follows by the second prox theorem (Theorem 6.39) that

$$
\begin{array}{rl} & g_{i_{k}}(\mathbf{x}_{i_{k}}^{*}) \geq g_{i_{k}} \left(\mathbf{x}_{i_{k}}^{k} - \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k})\right) \\ & \qquad + L_{i_{k}} \left\langle \mathbf{x}_{i_{k}}^{k} - \frac{1}{L_{i_{k}}} \nabla_{i_{k}} f(\mathbf{x}^{k}) - \mathbf{x}_{i_{k}}^{k} + \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{*} - \mathbf{x}_{i_{k}}^{k} + \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \right\rangle.\end{array}
$$

That is,

$$
\begin{array}{rl} & g_{i_{k}}(\mathbf{x}_{i_{k}}^{*}) \geq g_{i_{k}} \left(\mathbf{x}_{i_{k}}^{k} - \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k})\right) \\ & \qquad + \left\langle - \nabla_{i_{k}} f(\mathbf{x}^{k}) + G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{*} - \mathbf{x}_{i_{k}}^{k} + \frac{1}{L_{i_{k}}} G_{L_{i_{k}}}^{i_{k}}(\mathbf{x}^{k}) \right\rangle.\end{array}\tag{11.30}
$$

Note that

$$
\mathbb{E}_{i_{k}}(g_{i_{k}}(\mathbf{x}_{i_{k}}^{*})) = \frac{1}{p} g(\mathbf{x}^{*}),\tag{11.31}
$$

$$
\mathbb{E}_{i_{k}}(g(\mathbf{x}^{k + 1})) = \frac{p - 1}{p} g(\mathbf{x}^{k}) + \frac{1}{p} \sum_{i = 1}^{p} g_{i} \left(\mathbf{x}_{i}^{k} - \frac{1}{L_{i}} G_{L_{i}}^{i}(\mathbf{x}^{k})\right).\tag{11.32}
$$

Taking expectation w.r.t. $i_{k}$ in (11.30) and plugging in the relations (11.31) and (11.32) leads to the following inequality:

$$
\begin{array}{l} \frac{1}{p} g(\mathbf{x}^{*}) \geq \mathbb{E}_{i_{k}}(g(\mathbf{x}^{k + 1})) - \frac{p - 1}{p} g(\mathbf{x}^{k}) + \frac{1}{p} \langle - \nabla f(\mathbf{x}^{k}) + \widetilde{G}(\mathbf{x}^{k}), \mathbf{x}^{*} - \mathbf{x}^{k} \rangle \\ \qquad - \frac{1}{p} \sum_{i = 1}^{p} \frac{1}{L_{i}} \langle \nabla_{i} f(\mathbf{x}^{k}), G_{L_{i}}^{i}(\mathbf{x}^{k}) \rangle + \frac{1}{p} \| \widetilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2}.\end{array}
$$

The last inequality can be equivalently written as

$$
\begin{array}{l} \mathbb{E}_{i_{k}}(g(\mathbf{x}^{k + 1})) - \frac{1}{p} \sum_{i = 1}^{p} \frac{1}{L_{i}} \langle \nabla_{i} f(\mathbf{x}^{k}), G_{L_{i}}^{i}(\mathbf{x}^{k}) \rangle \\ \leq \frac{1}{p} g(\mathbf{x}^{*}) + \frac{p - 1}{p} g(\mathbf{x}^{k}) + \frac{1}{p} \langle \nabla f(\mathbf{x}^{k}) - \widetilde{G}(\mathbf{x}^{k}), \mathbf{x}^{*} - \mathbf{x}^{k} \rangle - \frac{1}{p} \| \widetilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2}.\end{array}
$$

Plugging the last inequality into (11.29) we obtain that

$$
\begin{array}{l} \mathbb{E}_{i_{k}}(F(\mathbf{x}^{k + 1})) \leq f(\mathbf{x}^{k}) - \frac{1}{2p} \| \tilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2} + \frac{1}{p} g(\mathbf{x}^{*}) + \frac{1}{p} \langle \nabla f(\mathbf{x}^{k}) - \widetilde{G}(\mathbf{x}^{k}), \mathbf{x}^{*} - \mathbf{x}^{k} \rangle \\ \qquad + \frac{p - 1}{p} g(\mathbf{x}^{k}), \end{array}
$$

which, along with the gradient inequality $\langle \nabla f({\mathbf{x}}^{k}),{\mathbf{x}}^{*} -{\mathbf{x}}^{k} \rangle \leq f({\mathbf{x}}^{*}) - f({\mathbf{x}}^{k})$ , implies

$$
\mathbb{E}_{i_{k}}(F(\mathbf{x}^{k + 1})) \leq \frac{p - 1}{p} F(\mathbf{x}^{k}) + \frac{1}{p} F(\mathbf{x}^{*}) - \frac{1}{2p} \| \widetilde{G}(\mathbf{x}^{k}) \|_{L, *}^{2} - \frac{1}{p} \langle \widetilde{G}(\mathbf{x}^{k}), \mathbf{x}^{*} - \mathbf{x}^{k} \rangle.
$$

The last inequality, combined with (11.28), yields the relation

$$
\mathbb{E}_{i_{k}} \left(\frac{1}{2} r_{k + 1}^{2}\right) \leq \frac{1}{2} r_{k}^{2} + \frac{p - 1}{p} F(\mathbf{x}^{k}) + \frac{1}{p} F(\mathbf{x}^{*}) - \mathbb{E}_{i_{k}}(F(\mathbf{x}^{k + 1})),
$$

which can be rearranged as

$$
\mathbb{E}_{i_{k}} \left(\frac{1}{2} r_{k + 1}^{2} + F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}}\right) \leq \left(\frac{1}{2} r_{k}^{2} + F(\mathbf{x}^{k}) - F_{\mathrm{opt}}\right) - \frac{1}{p}(F(\mathbf{x}^{k}) - F_{\mathrm{opt}}).
$$

Taking expectation over $\xi_{k - 1}$ of both sides we obtain (where we make the convention that the expression $\mathbb{E}_{\xi_{- 1}}(F(\mathbf{x}^{0}))$ means $F(\mathbf{x}^{0}))$

$$
\begin{array}{c} \mathbb{E}_{\xi_{k}} \left(\frac{1}{2} r_{k + 1}^{2} + F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}}\right) \leq \mathbb{E}_{\xi_{k - 1}} \left(\frac{1}{2} r_{k}^{2} + F(\mathbf{x}^{k}) - F_{\mathrm{opt}}\right) \\ - \frac{1}{p}(\mathbb{E}_{\xi_{k - 1}}(F(\mathbf{x}^{k})) - F_{\mathrm{opt}}).\end{array}
$$

We can thus conclude that

$$
\begin{array}{rl} &{\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) - F_{\mathrm{opt}} \leq \mathbb{E}_{\xi_{k}} \left(\frac{1}{2} r_{k + 1}^{2} + F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}}\right)} \\ &{\qquad \leq \frac{1}{2} r_{0}^{2} + F(\mathbf{x}^{0}) - F_{\mathrm{opt}} - \frac{1}{p} \sum_{j = 0}^{k} \left(\mathbb{E}_{\xi_{j - 1}}(F(\mathbf{x}^{j})) - F_{\mathrm{opt}}\right),} \end{array}
$$

which, together with the monotonicity of the sequence of expected values $\{\mathbb{E}_{\xi_{k - 1}}(F(\mathbf{x}^{k}))\}_{k \geq 0}$ (see Remark 11.24), implies that

$$
\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) - F_{\mathrm{opt}} \leq \frac{1}{2} r_{0}^{2} + F(\mathbf{x}^{0}) - F_{\mathrm{opt}} - \frac{k + 1}{p} \left(\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) - F_{\mathrm{opt}}\right).\tag{11.33}
$$

The desired result (11.27) follows immediately from (11.33).

Chapter 12


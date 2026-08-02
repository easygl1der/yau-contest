---
title: "Chapter 12 \u2014 Dual-Based Proximal Gradient Methods"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 12
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 15311
source_line_end: 16314
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 8
source_empty_image_alt: 8
non_semantic_image_alt: 3
caption_derived_image_alt: 5
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 2
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 12 — Dual-Based Proximal Gradient Methods

> [[../README|本书目录]] · [[11-chapter-11-the-block-proximal-gradient-method|上一章]] · [[13-chapter-13-the-generalized-conditional-gradient-method|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 15311–16314。
> - 本章保留 8 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.363) × 1；different × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Dual-Based Proximal Gradient Methods

Underlying Spaces: In this chapter, all the underlying spaces are Euclidean.

## 12.1 The Primal and Dual Models

The main model discussed in this chapter is

$$
f_{\mathrm{opt}} = \min_{\mathbf{x} \in \mathbb{E}} \left\{f(\mathbf{x}) + g(\mathcal{A}(\mathbf{x})) \right\},\tag{12.1}
$$

where the following assumptions are made.

Assumption 12.1.

(A) $f : \mathbb{E} \to(- \infty, + \infty]$ is proper closed and σ-strongly convex $(\sigma > 0)$

(B) $g : \mathbb{V} \to(- \infty, + \infty]$ is proper closed and convex.

(C) $\mathcal{A} : \mathbb{E} \mathbb{V}$ is a linear transformation.

(D) There exists ${\hat{\mathbf{x}}} \in \operatorname{ri}(\operatorname{dom}(f))$ and $\hat{\mathbf{z}} \in \operatorname{ri}(\operatorname{dom}(g))$ such that $\boldsymbol{\mathcal{A}}(\hat{\mathbf{x}}) = \hat{\mathbf{z}}$

Under Assumption 12.1 the function $\mathbf{x} \mapsto f(\mathbf{x}) + g(\mathcal{A}(\mathbf{x}))$ is proper closed and σ-strongly convex, and hence, by Theorem $5.25(a)$ , problem (12.1) has a unique optimal solution, which we denote throughout this chapter by $\mathbf{x}^{*}$

To construct a dual problem to (12.1), we first rewrite it in the form

$$
\begin{array}{ll} \min_{\mathbf{x}, \mathbf{z}} & f(\mathbf{x}) + g(\mathbf{z}) \\ \text{s.t.} & \mathcal{A}(\mathbf{x}) - \mathbf{z} = \mathbf{0}.\end{array}\tag{12.2}
$$

Associating a Lagrange dual vector $\mathbf{y} \in \mathbb{V}$ to the equality constraints in (12.2), the Lagrangian can be written as

$$
L(\mathbf{x}, \mathbf{z}; \mathbf{y}) = f(\mathbf{x}) + g(\mathbf{z}) - \langle \mathbf{y}, \mathcal{A}(\mathbf{x}) - \mathbf{z} \rangle = f(\mathbf{x}) + g(\mathbf{z}) - \langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{x} \rangle + \langle \mathbf{y}, \mathbf{z} \rangle.\tag{12.3}
$$

Minimizing the Lagrangian w.r.t. x and z, the obtained dual problem is

$$
q_{\text{opt}} = \max_{\mathbf{y} \in \mathbb{V}} \left\{q(\mathbf{y}) \equiv - f^{*}(\mathcal{A}^{T}(\mathbf{y})) - g^{*}(- \mathbf{y}) \right\}.\tag{12.4}
$$

By the strong duality theorem for convex problems (see Theorem A.1), it follows that strong duality holds for the pair of problems (12.1) and (12.4).

Theorem 12.2 (strong duality for the pair of problems (12.1) and (12.4)). Suppose that Assumption 12.1 holds, and let $f_{\mathrm{opt}}, q_{\mathrm{opt}}$ be the optimal values of the primal and dual problems (12.1) and (12.4), respectively. Then $f_{\mathrm{opt}} = q_{\mathrm{opt}}$ , and the dual problem (12.4) possesses an optimal solution.

We will consider the dual problem in its minimization form:

$$
\min_{\mathbf{y} \in \mathbb{V}} \{F(\mathbf{y}) + G(\mathbf{y})\},\tag{12.5}
$$

where

$$
F(\mathbf{y}) \equiv f^{*}(\mathcal{A}^{T}(\mathbf{y})),
$$

$$
G(\mathbf{y}) \equiv g^{*}(- \mathbf{y}).\tag{12.6}
$$

(12.7)

The basic properties of F and G are gathered in the following lemma.

Lemma 12.3 (properties of F and G). Suppose that Assumption 12.1 holds, and let F and G be defined by (12.6) and (12.7), respectively. Then

(a) $F : \mathbb{V} \mathbb{R}$ is convex and L -smooth with $\begin{array}{r}{L_{F} = \frac{\| \b{\mathcal{A}} \|^{2}}{\sigma}} \end{array}$

(b) $G : \mathbb{V} \to(- \infty, \infty]$ is proper closed and convex.

Proof. (a) Since f is proper closed and σ-strongly convex, then by the conjugate correspondence theorem (Theorem 5.26(b)), $f^{*}$ is $\scriptstyle{\frac{1}{\sigma}}.$ -smooth. Therefore, for any $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathbb{V}$ 2

$$
\begin{array}{l} \| \nabla F(\mathbf{y}_{1}) - \nabla F(\mathbf{y}_{2}) \| = \| \mathcal{A}(\nabla f^{*}(\mathcal{A}^{T}(\mathbf{y}_{1}))) - \mathcal{A}(\nabla f^{*}(\mathcal{A}^{T}(\mathbf{y}_{2}))) \| \\ \qquad \leq \| \mathcal{A} \| \cdot \| \nabla f^{*}(\mathcal{A}^{T}(\mathbf{y}_{1})) - \nabla f^{*}(\mathcal{A}^{T}(\mathbf{y}_{2})) \| \\ \qquad \leq \frac{1}{\sigma} \| \mathcal{A} \| \cdot \| \mathcal{A}^{T}(\mathbf{y}_{1}) - \mathcal{A}^{T}(\mathbf{y}_{2}) \| \\ \qquad \leq \frac{\| \mathcal{A} \| \cdot \| \mathcal{A}^{T} \|}{\sigma} \| \mathbf{y}_{1} - \mathbf{y}_{2} \| = \frac{\| \mathcal{A} \|^{2}}{\sigma} \| \mathbf{y}_{1} - \mathbf{y}_{2} \|, \end{array}
$$

where we used in the last equality the fact that $\| \mathcal{A} \| = \| \mathcal{A}^{T} \|$ (see Section 1.14). To show the convexity of $F$ , note that $f^{*}$ is convex as a conjugate function (Theorem 4.3), and hence, by Theorem 2.16, F , as a composition of a convex function and a linear mapping, is convex.

(b) Since g is proper closed and convex, so is $g^{*}$ (Theorems 4.3 and 4.5). Thus, $G(\mathbf{y}) \equiv g^{*}(- \mathbf{y})$ is also proper closed and convex.

## 12.2 The Dual Proximal Gradient Method67

Problem (12.5) consists of minimizing the sum of a convex L-smooth function and a proper closed and convex function. It is therefore possible to employ in this setting the proximal gradient method on problem (12.5), which is equivalent to the dual problem of (12.1). Naturally we will refer to this algorithm as the “dual proximal gradient” (DPG) method. The dual representation of the method is given below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Dual Proximal Gradient—dual representation
- Initialization: pick $\mathbf{y}^0 \in \mathbb{V}$ and $L \geq L_F = \frac{\|\mathcal{A}\|^2}{\sigma}$.
- General step ($k \geq 0$):
$\mathbf{y}^{k+1} = \text{prox}_{\frac{1}{L} G} \left(\mathbf{y}^k - \frac{1}{L} \nabla F(\mathbf{y}^k) \right)$. (12.8)
</div>

Since $F$ is convex and L<sub>F</sub> -smooth and G is proper closed and convex, we can invoke Theorem 10.21 to obtain an $O(1 / k)$ rate of convergence in terms of the dual objective function values.

Theorem 12.4. Suppose that Assumption 12.1 holds, and let $\{\mathbf{y}^{k}\}_{k \geq 0}$ be the sequence generated by the DPG method with $\begin{array}{r}{L \geq L_{F} = \frac{\Vert \mathcal{A} \Vert^{2}}{\sigma}} \end{array}$ . Then for any optimal solution $\mathbf{y}^{*}$ of the dual problem (12.4) and $k \geq 1$

$$
q_{\mathrm{opt}} - q(\mathbf{y}^{k}) \leq \frac{L \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2}}{2k}.
$$

Our goal now will be to find a primal representation of the method, which will be written in a more explicit way in terms of the data of the problem, meaning $(f, g, A)$ . To achieve this goal, we will require the following technical lemma.

Lemma 12.5. Let $F(\mathbf{y}) = f^{*}(A^{T}(\mathbf{y}) + \mathbf{b}), G(\mathbf{y}) = g^{*}(- \mathbf{y})$ , where $f, g,$ and A satisfy properties $(\mathrm{A}), \(\mathrm{B})$ , and (C) of Assumption 12.1 and b $\in \mathbb{E}$ . Then for any $\mathbf{y}, \mathbf{v} \in \mathbb{V}$ and $L > 0$ the relation

$$
\mathbf{y} = \operatorname{prox}_{\frac{1}{L} G} \left(\mathbf{v} - \frac{1}{L} \nabla F(\mathbf{v})\right)\tag{12.9}
$$

holds if and only if

$$
\mathbf{y} = \mathbf{v} - \frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}}) + \frac{1}{L} \mathrm{prox}_{Lg}(\mathcal{A}(\tilde{\mathbf{x}}) - L \mathbf{v}),
$$

where

$$
\tilde{\mathbf{x}} = \operatorname{argmax}_{\mathbf{x}} \left\{\langle \mathbf{x}, \mathcal{A}^{T}(\mathbf{v}) + \mathbf{b} \rangle - f(\mathbf{x}) \right\}.
$$

Proof. By the conjugate subgradient theorem (Corollary 4.21), since $f$ is proper closed and convex,

$$
\nabla f^{*}(\mathcal{A}^{T}(\mathbf{v}) + \mathbf{b}) = \tilde{\mathbf{x}} \in \mathbb{E} \equiv \operatorname{argmax}_{\mathbf{x}} \left\{\langle \mathbf{x}, \mathcal{A}^{T}(\mathbf{v}) + \mathbf{b} \rangle - f(\mathbf{x}) \right\}.
$$

Therefore, since $\nabla F(\mathbf{v}) ={\mathcal{A}(\nabla f^{\ast}({\mathcal{A}}^{T}(\mathbf{v}) + \mathbf{b}))} ={\mathcal{A}(\tilde{\mathbf{x}})}.$

$$
\mathbf{y} = \mathrm{prox}_{\frac{1}{L} G} \left(\mathbf{v} - \frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}})\right).\tag{12.10}
$$

Invoking Theorem 6.15 with $g \gets \frac{1}{L} g^{*}, \boldsymbol{\mathcal{A}} = - \boldsymbol{\mathcal{T}}, \mathbf{b} = \mathbf{0}$ , we obtain that for any $\mathbf{z} \in \mathbb{V}$ ，

$$
\operatorname{prox}_{\frac{1}{L} G}(\mathbf{z}) = - \operatorname{prox}_{\frac{1}{L} g^{*}}(- \mathbf{z}).\tag{12.11}
$$

Combining (12.10) and (12.11) and using the extended Moreau decomposition formula (Theorem 6.45), we finally obtain that

$$
\begin{array}{rl} &{\mathbf{y} = \mathrm{prox}_{\frac{1}{L} G} \left(\mathbf{v} - \frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}})\right) = - \mathrm{prox}_{\frac{1}{L} g^{*}} \left(\frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}}) - \mathbf{v}\right)} \\ &{\quad = - \left[\frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}}) - \mathbf{v} - \frac{1}{L} \mathrm{prox}_{Lg}(\mathcal{A}(\tilde{\mathbf{x}}) - L \mathbf{v}) \right]} \\ &{\quad = \mathbf{v} - \frac{1}{L} \mathcal{A}(\tilde{\mathbf{x}}) + \frac{1}{L} \mathrm{prox}_{Lg}(\mathcal{A}(\tilde{\mathbf{x}}) - L \mathbf{v}).\quad \square} \end{array}
$$

Equipped with Lemma 12.5, we can write a primal representation of the DPG method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Dual Proximal Gradient (DPG) Method—primal representation
Initialization: pick  $y^{0} \in V$ , and  $L \geq \frac{\|\mathcal{A}\|^{2}}{\sigma}$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) set  $x^{k} = \arg\max_{x} \left\{\langle x, A^{T}(y^{k}) \rangle - f(x) \right\}$ ;
(b) set  $y^{k+1} = y^{k} - \frac{1}{L} A(x^{k}) + \frac{1}{L} \text{prox}_{Lg}(A(x^{k}) - Ly^{k})$ .
</div>

Remark 12.6 (the primal sequence). The sequence $\{{\bf x}^{k}\}_{k \ge 0}$ generated by the method will be called “the primal sequence.” The elements of the sequence are actually not necessarily feasible w.r.t. the primal problem (12.1) since they are not guaranteed to belong to dom $(g)$ ; nevertheless, we will show that the primal sequence does converge to the optimal solution $\mathbf{x}^{*}$

To prove a convergence result in terms of the primal sequence, we will require the following fundamental primal-dual relation.

Lemma 12.7 (primal-dual relation). Suppose that Assumption 12.1 holds. Let $\bar{\mathbf{y}} \in \mathrm{dom}(G)$ , where G is given in (12.7), and let

$$
\bar{\mathbf{x}} = \operatorname{argmax}_{\mathbf{x} \in \mathbb{E}} \left\{\langle \mathbf{x}, \mathcal{A}^{T}(\bar{\mathbf{y}}) \rangle - f(\mathbf{x}) \right\}.\tag{12.12}
$$

Then

$$
\| \bar{\mathbf{x}} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma}(q_{\mathrm{opt}} - q(\bar{\mathbf{y}})).\tag{12.13}
$$

Proof. Recall that the primal problem (12.1) can be equivalently written as the problem

$$
\min_{\mathbf{x} \in \mathbb{E}, \mathbf{z} \in \mathbb{V}} \{f(\mathbf{x}) + g(\mathbf{z}): \mathcal{A}(\mathbf{x}) - \mathbf{z} = \mathbf{0}\},
$$

whose Lagrangian is (see also (12.3))

$$
L(\mathbf{x}, \mathbf{z}; \mathbf{y}) = f(\mathbf{x}) - \langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{x} \rangle + g(\mathbf{z}) + \langle \mathbf{y}, \mathbf{z} \rangle.
$$

In particular,

$$
L(\mathbf{x}, \mathbf{z}; \bar{\mathbf{y}}) = h(\mathbf{x}) + s(\mathbf{z}),\tag{12.14}
$$

where

$$
\begin{array}{rl} & h(\mathbf{x}) = f(\mathbf{x}) - \langle \mathcal{A}^{T}(\bar{\mathbf{y}}), \mathbf{x} \rangle, \\ & s(\mathbf{z}) = g(\mathbf{z}) + \langle \bar{\mathbf{y}}, \mathbf{z} \rangle.\end{array}
$$

Since $h$ is σ-strongly convex and x¯ is its minimizer (see relation (12.12)), it follows by Theorem 5.25(b) that

$$
h(\mathbf{x}) - h(\bar{\mathbf{x}}) \geq \frac{\sigma}{2} \| \mathbf{x} - \bar{\mathbf{x}} \|^{2}.\tag{12.15}
$$

Since the relation $\bar{\mathbf{y}} \in \mathrm{dom}(G)$ is equivalent to $-{\bar{\mathbf{y}}} \in \operatorname{dom}(g^{*})$ , it follows that

$$
\min_{\mathbf{z} \in \mathbb{V}} \{g(\mathbf{z}) + \langle \bar{\mathbf{y}}, \mathbf{z} \rangle\} = \min_{\mathbf{z} \in \mathbb{V}} s(\mathbf{z}) > - \infty.
$$

Let $\varepsilon > 0$ . Then there exists $\bar{\mathbf{z}}_{\varepsilon}$ for which

$$
s(\bar{\mathbf{z}}_{\varepsilon}) \leq \min_{\mathbf{z} \in \mathbb{V}} s(\mathbf{z}) + \varepsilon.\tag{12.16}
$$

Combining (12.14), (12.15), and (12.16), we obtain that for all $\mathbf{x} \in \operatorname{dom}(f)$ and $\mathbf{z} \in \operatorname{dom}(g)$ 2

$$
L(\mathbf{x}, \mathbf{z}; \bar{\mathbf{y}}) - L(\bar{\mathbf{x}}, \bar{\mathbf{z}}_{\varepsilon}; \bar{\mathbf{y}}) = h(\mathbf{x}) - h(\bar{\mathbf{x}}) + s(\mathbf{z}) - s(\bar{\mathbf{z}}_{\varepsilon}) \geq \frac{\sigma}{2} \| \mathbf{x} - \bar{\mathbf{x}} \|^{2} - \varepsilon.
$$

In particular, substituting $\mathbf{x} = \mathbf{x}^{*}, \mathbf{z} = \mathbf{z}^{*} \equiv \mathcal{A}(\mathbf{x}^{*})$ , then $L(\mathbf{x}^{*}, \mathbf{z}^{*}; \bar{\mathbf{y}}) = f(\mathbf{x}^{*}) +$ $g(\mathcal{A}(\mathbf{x}^{*})) = f_{\mathrm{opt}} = q_{\mathrm{opt}}$ (by Theorem 12.2), and we obtain

$$
q_{\mathrm{opt}} - L(\bar{\mathbf{x}}, \bar{\mathbf{z}}_{\varepsilon}; \bar{\mathbf{y}}) \geq \frac{\sigma}{2} \| \mathbf{x}^{*} - \bar{\mathbf{x}} \|^{2} - \varepsilon.\tag{12.17}
$$

In addition, by the definition of the dual objective function value,

$$
L(\bar{\mathbf{x}}, \bar{\mathbf{z}}_{\varepsilon}; \bar{\mathbf{y}}) \geq \min_{\mathbf{x} \in \mathbb{E}, \mathbf{z} \in \mathbb{V}} L(\mathbf{x}, \mathbf{z}; \bar{\mathbf{y}}) = q(\bar{\mathbf{y}}),
$$

which, combined with (12.17), results in the inequality

$$
\| \bar{\mathbf{x}} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma}(q_{\mathrm{opt}} - q(\bar{\mathbf{y}})) + \frac{2}{\sigma} \varepsilon.
$$

Since the above inequality holds for any $\varepsilon > 0$ , the desired result (inequality (12.13)) follows.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Fast Dual Proximal Gradient (FDPG) Method—dual representation
- Initialization: $L \geq L_F = \frac{\|\mathcal{A}\|^2}{\sigma}$, $\mathbf{w}^0 = \mathbf{y}^0 \in \mathbb{E}$, $t_0 = 1$.
- General step ($k \geq 0$):
(a) $\mathbf{y}^{k+1} = \text{prox}_{\frac{1}{L} G} \left(\mathbf{w}^k - \frac{1}{L} \nabla F(\mathbf{w}^k) \right)$;
(b) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}$;
(c) $\mathbf{w}^{k+1} = \mathbf{y}^{k+1} + \left(\frac{t_k - 1}{t_{k+1}} \right)(\mathbf{y}^{k+1} - \mathbf{y}^k)$.
</div>

Combining the primal-dual relation of Lemma 12.7 with the rate of convergence of the sequence of dual objective function values stated in Theorem 12.4, we can deduce a rate of convergence result for the primal sequence to the unique optimal solution.

Theorem 12.8 $(O(1 / k)$ rate of convergence of the primal sequence of the DPG method). Suppose that Assumption 12.1 holds, and let $\{\mathbf{x}^{k}\}_{k \geq 0}$ and $\{\mathbf{y}^{k}\}_{k \geq 0}$ be the primal and dual sequences generated by the DPG method with $L \geq$ $\begin{array}{r}{L_{F} = \frac{\| \b{\mathcal{A}} \|^{2}}{\sigma}} \end{array}$ . Then for any optimal solution $\mathbf{y}^{*}$ of the dual problem (12.4) and $k \geq 1$ ，

$$
\| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} \leq \frac{L \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2}}{\sigma k}.\tag{12.18}
$$

Proof. Invoking Lemma 12.7 with $\bar{\mathbf{y}} = \mathbf{y}^{k}$ , we obtain by the definition of $\bar{\bf x}$ (equation (12.12)) that $\bar{\mathbf{x}} = \mathbf{x}^{k}$ , and hence (12.13) reads as

$$
\| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma}(q_{\mathrm{opt}} - q(\mathbf{y}^{k})),
$$

which, combined with Theorem 12.4, yields the desired result.

## 12.3 Fast Dual Proximal Gradient

The DPG method employs the proximal gradient method on the dual problem. Alternatively, we can also employ FISTA (see Section 10.7) on the dual problem (12.4). The dual representation of the method is given below.

Since this is exactly FISTA employed on the dual problem, we can invoke Theorem 10.34 and obtain a convergence result in terms of dual objective function values.

Theorem 12.9. Suppose that Assumption 12.1 holds and that $\{\mathbf{y}^{k}\}_{k \geq 0}$ is the sequence generated by the FDPG method with $\begin{array}{r}{L \ge L_{F} = \frac{\| \mathcal{A} \|^{2}}{\sigma}} \end{array}$ . Then for any optimal solution $\mathbf{y}^{*}$ of problem (12.4) and $k \geq 1$ ，

$$
q_{\mathrm{opt}} - q(\mathbf{y}^{k}) \leq \frac{2L \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2}}{(k + 1)^{2}}.
$$

Using Lemma 12.5 with $\mathbf v = \mathbf w^{k}, \mathbf y = \mathbf y^{k + 1}$ , and $\mathbf b = \mathbf 0$ , we obtain that step (a) of the FDPG method, namely,

$$
\mathbf{y}^{k + 1} = \mathrm{prox}_{\frac{1}{L} G} \left(\mathbf{w}^{k} - \frac{1}{L} \nabla F(\mathbf{w}^{k})\right),
$$

can be equivalently written as

$$
\begin{array}{c} \mathbf{u}^{k} = \operatorname{argmax}_{\mathbf{u}} \left\{\langle \mathbf{u}, \mathcal{A}^{T}(\mathbf{w}^{k}) \rangle - f(\mathbf{u}) \right\}, \\ \mathbf{y}^{k + 1} = \mathbf{w}^{k} - \frac{1}{L} \mathcal{A}(\mathbf{u}^{k}) + \frac{1}{L} \mathrm{prox}_{Lg}(\mathcal{A}(\mathbf{u}^{k}) - L \mathbf{w}^{k}).\end{array}
$$

We can thus formulate a primal representation of the method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Fast Dual Proximal Gradient (FDPG) Method—primal representation

Initialization:  $L \geq L_{F} = \frac{\|\mathcal{A}\|^{2}}{\sigma}$ ,  $w^{0} = y^{0} \in V$ ,  $t_{0} = 1$ .

General step ( $k \geq 0$ ):
(a)  $u^{k} = \arg\max_{u} \left\{\langle u, \mathcal{A}^{T}(w^{k}) \rangle - f(u) \right\}$ ;
(b)  $y^{k+1} = w^{k} - \frac{1}{L} A(u^{k}) + \frac{1}{L} \text{prox}_{Lg}(A(u^{k}) - Lw^{k})$ ;
(c)  $t_{k+1} = \frac{1 + \sqrt{1 + 4t_{k}^{2}}}{2}$ ;
(d)  $w^{k+1} = y^{k+1} + \left(\frac{t_{k}-1}{t_{k+1}}\right)(y^{k+1} - y^{k})$ .
</div>

The primal sequence that we will be interested in is actually not computed during the steps of the FDPG method. The definition of the primal sequence on which a convergence result will be proved is

$$
\mathbf{x}^{k} = \operatorname{argmax}_{\mathbf{x} \in \mathbb{E}} \left\{\langle \mathbf{x}, \mathcal{A}^{T}(\mathbf{y}^{k}) \rangle - f(\mathbf{x}) \right\}.\tag{12.19}
$$

The convergence result on the primal sequence is given below, and its proof is almost a verbatim repetition of the proof of Theorem 12.8.

Theorem 12.10 $(O(1 / k^{2})$ convergence of the primal sequence of the FDPG method). Suppose that Assumption 12.1 holds, and let $\{\mathbf{y}^{k}\}_{k \geq 0}$ be the sequence generated by the FDPG method with $\begin{array}{r}{L \geq L_{F} = \frac{\Vert \mathcal{A} \Vert^{2}}{\sigma}} \end{array}$ . Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence defined by (12.19). Then for any optimal solution $\mathbf{y}^{*}$ of the dual problem (12.4) and $k \geq 1$ ，

$$
\| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} \leq \frac{4L \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2}}{\sigma(k + 1)^{2}}.
$$

Proof. Invoking Lemma 12.7 with $\bar{\mathbf{y}} = \mathbf{y}^{k}$ , we obtain by the definition of $\bar{\bf x}$ (equation (12.12)) that $\bar{\mathbf{x}} = \mathbf{x}^{k}$ , and hence the result (12.13) reads as

$$
\| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma}(q_{\mathrm{opt}} - q(\mathbf{y}^{k})),
$$

which, combined with Theorem 12.9, yields the desired result.

## 12.4 Examples I

## 12.4.1 Orthogonal Projection onto a Polyhedral Set

$$
S = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Ax} \leq \mathbf{b}\},
$$

where $\mathbf{A} \in \mathbb{R}^{p \times n}$ , b $\in ~ \mathbb{R}^{p}$ . We assume that $S$ is nonempty. Let $\mathbf{d} \in \mathbb{R}^{n}$ . The orthogonal projection of d onto $S$ is the unique optimal solution of the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2}: \mathbf{Ax} \leq \mathbf{b} \right\}.\tag{12.20}
$$

Problem (12.20) fits model (12.1) with $\begin{array}{r}{\mathbb{E} = \mathbb{R}^{n}, \mathbb{V} = \mathbb{R}^{p}, f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2}.} \end{array}$

$$
g(\mathbf{z}) = \delta_{\operatorname{Box}[- \infty \mathbf{e}, \mathbf{b}]}(\mathbf{z}) = \left\{\begin{array}{ll} \mathbf{0}, & \mathbf{z} \leq \mathbf{b}, \\ \infty & \text{else}, \end{array} \right.
$$

and $\mathcal{A}(\mathbf{x}) \equiv \mathbf{A} \mathbf{x}$ . We have

$\operatorname{argmax}_{\mathbf{x}} \{\langle \mathbf{v}, \mathbf{x} \rangle - f(\mathbf{x})\} = \mathbf{v} + \mathbf{d}{\mathrm{~ for ~ any ~}} \mathbf{v} \in \mathbb{R}^{n};$

$\| \mathcal{A} \| = \| \mathbf{A} \|_{2, 2};$

$\sigma = 1$

$\mathcal{A}^{T}(\mathbf{y}) = \mathbf{A}^{T} \mathbf{y}$ for any $\mathbf { y } \in \mathbb { R } ^ { p } $ ;

$\begin{array}{rcl}{{\mathrm{prox}_{Lg}(\mathbf{z}) ~{=} ~{\cal P}_{\mathrm{Box}[- \infty \mathbf{e}, \mathbf{b}]}(\mathbf{z}) ~{=} ~{\mathrm{min}} \{\mathbf{z}, \mathbf{b}\}}} \\{{({\mathrm{min}} \{z_{i}, b_{i}\})_{i = 1}^{p}.}} \end{array}$ , where $\operatorname{min} \{\mathbf{z}, \mathbf{b}\}$ is the vector

Using these facts, the DPG and FDPG methods for solving problem (12.20) can be explicitly written.

Algorithm 1 [DPG for solving (12.20)]

- Initialization: $L \geq \| \mathbf{A} \|_{2, 2}^{2}, \mathbf{y}^{0} \in \mathbb{R}^{p}$

- General step $(k \geq 0)$ :

(a) $\mathbf{x}^{k} = \mathbf{A}^{T} \mathbf{y}^{k} + \mathbf{d};$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} - \frac{1}{L} \mathbf{Ax}^{k} + \frac{1}{L} \min \{\mathbf{Ax}^{k} - L \mathbf{y}^{k}, \mathbf{b}\}.\tag{b}
$$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 2 [FDPG for solving (12.20)]
- Initialization: $L \geq \| \mathbf{A} \|_{2,2}^2$, $\mathbf{w}^0 = \mathbf{y}^0 \in \mathbb{R}^p$, $t_0 = 1$.
- General step ($k \geq 0$):
(a) $\mathbf{u}^k = \mathbf{A}^T \mathbf{w}^k + \mathbf{d}$;
(b) $\mathbf{y}^{k+1} = \mathbf{w}^k - \frac{1}{L} \mathbf{A} \mathbf{u}^k + \frac{1}{L} \min\{\mathbf{A} \mathbf{u}^k - L \mathbf{w}^k, \mathbf{b}\}$;
(c) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}$;
(d) $\mathbf{w}^{k+1} = \mathbf{y}^{k+1} + \left(\frac{t_k - 1}{t_{k+1}}\right)(\mathbf{y}^{k+1} - \mathbf{y}^k)$.
</div>

The primal sequence for the FDPG method is given by $\mathbf{x}^{k} = \mathbf{A}^{T} \mathbf{y}^{k} + \mathbf{d}$

## 12.4.2 Orthogonal Projection onto the Intersection of Closed Convex Sets

Given p closed and convex sets $C_{1}, C_{2}, \ldots, C_{p} \subseteq \mathbb{E}$ and a point d $\in \mathbb{E}$ , the orthogonal projection of d onto the intersection $\cap_{i = 1}^{p} C_{i}$ is the optimal solution of the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2}: \mathbf{x} \in \cap_{i = 1}^{p} C_{i} \right\}.\tag{12.21}
$$

We will assume that the intersection $\cap_{i = 1}^{p} C_{i}$ is nonempty and that projecting onto each set $C_{i}$ is an easy task. Our purpose will be to devise a method for solving problem (12.21) that only requires computing at each iteration—in addition to elementary linear algebra operations—orthogonal projections onto the sets $C_{i}$ . Problem $\left(12.21 \right)$ fits model (12.1) with $\begin{array}{r}{\mathbb{V} = \mathbb{E}^{\tilde{p}}, f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2}, g(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{p}) =} \end{array}$ $\textstyle \sum_{i = 1}^{p} \delta_{C_{i}}(\mathbf{x}_{i})$ , and $\mathcal{A} : \mathbb{E} \mathbb{V}$ given by

$$
\mathcal{A}(\mathbf{z}) =(\underbrace{\mathbf{z}, \mathbf{z}, \ldots, \mathbf{z}}_{p \text{times}}) \text{for any} \mathbf{z} \in \mathbb{E}.
$$

We have

- argmax ${\bf \underline{{\boldsymbol{\cdot}}}} \{\langle{\bf v},{\bf x} \rangle - f({\bf x})\} ={\bf v} +{\bf d} \mathrm{~ for ~ any ~}{\bf v} \in \mathbb{E};$

$\| A \|^{2} = p;$

$\sigma = 1$

$\begin{array}{r}{\mathcal{A}^{T}(\mathbf{y}) = \sum_{i = 1}^{p} y_{i}} \end{array}$ for any $\mathbf{y} \in \mathbb{E}^{p}$ ;

$\operatorname{prox}_{Lg}(\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{p}) = \left(P_{C_{1}}(\mathbf{v}_{1}), P_{C_{2}}(\mathbf{v}_{2}), \ldots, P_{C_{p}}(\mathbf{v}_{p}) \right)$ for any $\mathbf{v} \in \mathbb{E}^{p}$

Using these facts, the DPG and FDPG methods for solving problem (12.21) can be explicitly written.

Algorithm 3 [DPG for solving (12.21)]

- Initialization: $L \geq p, \mathbf{y}^{0} \in \mathbb{E}^{p}.$

- General step $(k \geq 0)$

(a) $\begin{array}{r}{\mathbf{x}^{k} = \sum_{i = 1}^{p} \mathbf{y}_{i}^{k} + \mathbf{d};} \end{array}$

$$
\mathbf{\Phi}_{i}^{k + 1} = \mathbf{y}_{i}^{k} - \frac{1}{L} \mathbf{x}^{k} + \frac{1}{L} P_{C_{i}}(\mathbf{x}^{k} - L \mathbf{y}_{i}^{k}), i = 1, 2, \ldots, p.
$$

Algorithm 4 [FDPG for solving (12.21)]

- Initialization: $L \geq p, \mathbf{w}^{0} = \mathbf{y}^{0} \in \mathbb{E}^{p}, t_{0} = 1.$

- General step $(k \geq 0)$

(a) $\begin{array}{r}{\mathbf{u}^{k} = \sum_{i = 1}^{p} \mathbf{w}_{i}^{k} + \mathbf{d};} \end{array}$

(b) $\begin{array}{r}{{\bf y}_{i}^{k + 1} ={\bf w}_{i}^{k} - \frac{1}{L}{\bf u}^{k} + \frac{1}{L} P_{C_{i}}({\bf u}^{k} - L{\bf w}_{i}^{k}), i = 1, 2, \ldots, p;} \end{array}$

(c) $\begin{array}{r}{t_{k + 1} = \frac{1 + \sqrt{1 + 4t_{k}^{2}}}{2};} \end{array}$

$$
\mathbf{w}^{k + 1} = \mathbf{y}^{k + 1} + \left(\frac{t_{k} - 1}{t_{k + 1}}\right)(\mathbf{y}^{k + 1} - \mathbf{y}^{k}).\tag{d}
$$

To actually guarantee convergence of the method, Assumption 12.1 needs to be satisfied, meaning that we assume that $\cap_{i = 1}^{p} \operatorname{ri}(C_{i}) \neq \emptyset$

The primal sequence for the FDPG method is given by $\begin{array}{r}{\mathbf{x}^{k} = \sum_{i = 1}^{p} \mathbf{y}_{i}^{k} + \mathbf{d}} \end{array}$

Example 12.11 (orthogonal projection onto a polyhedral set revisited). Note that Algorithm 4 can also be used to find an orthogonal projection of a point $\mathbf{d} \in \mathbb{R}^{n}$ onto the polyhedral set $C = \{\mathbf{x} \in \mathbb{R}^{n} : \mathbf{Ax} \leq \mathbf{b}\}$ , where $\mathbf{A} \in \mathbb{R}^{p \times n}, \mathbf{b} \in \mathbb{R}^{p}$ Indeed, $C$ can be written as the following intersection of half-spaces:

$$
C = \cap_{i = 1}^{p} C_{i},
$$

where

$$
C_{i} = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{a}_{i}^{T} \mathbf{x} \leq b_{i}\},\tag{12.22}
$$

with $\mathbf{a}_{1}^{T}, \mathbf{a}_{2}^{T}, \ldots, \mathbf{a}_{p}^{T}$ being the rows of A. The projections on the half-spaces are simple and given by (see Lemma 6.26) $\begin{array}{r}{P_{C_{i}}(\mathbf{x}) = \mathbf{x} - \frac{[\mathbf{a}_{i}^{T} \mathbf{x} - b_{i}]_{+}}{\Vert \mathbf{a}_{i} \Vert^{2}} \mathbf{a}_{i}} \end{array}$ . To summarize, the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2}: \mathbf{Ax} \leq \mathbf{b} \right\}
$$

can be solved by two different FDPG methods. The first one is Algorithm $^{2,}$ and the second one is the following algorithm, which is Algorithm 4 specified to the case where $C_{i}$ is given by (12.22) for any $i \in \{1, 2, \ldots, p\}$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 5 [second version of FDPG for solving (12.20)]
- Initialization: $L \geq p, \mathbf{w}^0 = \mathbf{y}^0 \in \mathbb{E}^p, t_0 = 1$.
- General step ($k \geq 0$):
(a) $\mathbf{u}^k = \sum_{i=1}^{p} \mathbf{w}_i^k + \mathbf{d}$;
(b) $\mathbf{y}_i^{k+1} = -\frac{1}{L \| \mathbf{a}_i \|^2}[\mathbf{a}_i^T(\mathbf{u}^k - L \mathbf{w}_i^k) - b_i] + \mathbf{a}_i, i = 1, 2, \ldots, p;$
(c) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2};$
(d) $\mathbf{w}^{k+1} = \mathbf{y}^{k+1} + \left(\frac{t_k - 1}{t_{k+1}}\right)(\mathbf{y}^{k+1} - \mathbf{y}^k).$
</div>

Example 12.12 (comparison between DPG and FDPG). The $O(1 / k^{2})$ rate of convergence obtained for the FDPG method (Theorem 12.10) is better than the $O(1 / k)$ result obtained for the DPG method (Theorem 12.8). To illustrate that this theoretical advantage is also reflected in practice, we consider the problem of projecting the point $(0.5, 1.9)^{T}$ onto a dodecagon—a regular polygon with 12 edges, which is represented as the intersection of 12 half-spaces. The first 10 iterations of the DPG and FDPG methods with $L = p = 12$ can be seen in Figure 12.1, where the DPG and FDPG methods that were used are those described by Algorithms 3 and 4 for the intersection of closed convex sets (which are taken as the 12 half-spaces in this example) and not Algorithms 1 and 2. Evidently, the FDPG method was able to find a good approximation of the projection after 10 iterations, while the DPG method was rather far from the required solution. ■

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/fc14f4cb0c1d845f29fd44378339006356147c1a91682ad364c338b04e065ae4.jpg)

![Figure 12.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/25ce09d2d8e95e201fab925bdb22342ebeb0ec60c33a96af3fae5adcf8a4f5ed.jpg)  
Figure 12.1. First 10 iterations of the DPG method (Algorithm 3) and the FDPG method (Algorithm $4 / 5)$ . The initial value of the dual vector y was the zeros vector in both methods.

## 12.4.3 One-Dimensional Total Variation Denoising

In the denoising problem we are given a signal $\mathbf{d} \in \mathbb{E}$ , which is contaminated by noise, and we seek to find another vector $\mathbf{x} \in \mathbb{E}$ , which, on the one hand, is close to d in the sense that the norm $\| \mathbf{x} - \mathbf{d} \|$ is small and, on the other hand, yields a small regularization term $R(\mathcal{A}(\mathbf{x}))$ , where here $\mathcal{A} : \mathbb{E} \mathbb{V}$ is a linear transformation that in many applications accounts for the smoothness of the signal and $R : \mathbb{V} \to \mathbb{R}_{+}$ is a given convex function that measures the magnitude of its argument in some sense. The denoising problem is then defined to be

$$
\min_{\mathbf{x} \in \mathbb{E}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2} + R(\mathcal{A}(\mathbf{x})) \right\}.\tag{12.23}
$$

In the one-dimensional total variation denoising problem, we are interested in the case where $\mathbb{E} = \mathbb{R}^{n}, \mathbb{V} = \mathbb{R}^{n - 1}, \mathcal{A}(\mathbf{x}) = \mathbf{D} \mathbf{x}$ , and $R(\mathbf{z}) = \lambda \| \mathbf{z} \|_{1}$ with $\lambda > 0$ being a “regularization parameter” and D being the matrix satisfying $\mathbf{Dx} =(x_{1} - x_{2}, x_{2} -$ $x_{3},..., x_{n - 1} - x_{n} \big)^{T}$ for all $\mathbf{x} \in \mathbb{R}^{n}$ . Thus, problem (12.23) takes the form<sup>68</sup>

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2} + \lambda \| \mathbf{Dx} \|_{1} \right\}\tag{12.24}
$$

or, more explicitly,

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2} + \lambda \sum_{i = 1}^{n - 1} | x_{i} - x_{i + 1} | \right\}.
$$

The function $\mathbf{x} \mapsto \| \mathbf{Dx} \|_{1}$ is known as a one-dimensional total variation function and is actually only one instance of many variants of total variation functions. Problem (12.24) fits model (12.1) with $\begin{array}{r}{\mathbb{E} = \mathbb{R}^{n}, \mathbb{V} = \mathbb{R}^{n - 1}, f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2}, g(\mathbf{y}) = \lambda \| \mathbf{y} \|_{1}} \end{array}$ 2 and $\mathcal{A}(\mathbf{x}) \equiv \mathbf{D} \mathbf{x}$ . In order to explicitly write the DPG and FDPG methods, we note that

- $\operatorname*{argmax}\{\langle v, x \rangle - f(x)\}$ = v + d for any $\mathbf{v} \in \mathbb{E};$

$\| \mathcal{A} \|^{2} = \| \mathbf{D} \|_{2, 2}^{2} \leq 4;$

$\sigma = 1$

$\mathcal{A}^{T}(\mathbf{y}) = \mathbf{D}^{T} \mathbf{y}$ for any $\mathbf{y} \in \mathbb{R}^{n - 1}$ ;

$\mathrm{prox}_{Lg}(\mathbf{y}) = \mathcal{T}_{\lambda L}(\mathbf{y})$

The bound on $\| \mathbf{D} \|_{2, 2}$ was achieved by the following argument:

$$
\| \mathbf{Dx} \|_{2}^{2} = \sum_{i = 1}^{n - 1}(x_{i} - x_{i + 1})^{2} \leq 2 \sum_{i = 1}^{n - 1}(x_{i}^{2} + x_{i + 1}^{2}) \leq 4 \| \mathbf{x} \|^{2}.
$$

The DPG and FDPG methods with $L = 4$ are explicitly written below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 7 [FDPG for solving (12.24)]
- Initialization: $\mathbf{w}^0 = \mathbf{y}^0 \in \mathbb{R}^{n-1}, t_0 = 1$.
- General step ($k \geq 0$):
(a) $\mathbf{u}^k = \mathbf{D}^T \mathbf{w}^k + \mathbf{d}$;
(b) $\mathbf{y}^{k+1} = \mathbf{w}^k - \frac{1}{4} \mathbf{D} \mathbf{u}^k + \frac{1}{4} \mathcal{T}_{4\lambda}(\mathbf{D} \mathbf{u}^k - 4 \mathbf{w}^k)$;
(c) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}$;
(d) $\mathbf{w}^{k+1} = \mathbf{y}^{k+1} + \left(\frac{t_k - 1}{t_{k+1}}\right)(\mathbf{y}^{k+1} - \mathbf{y}^k)$.
</div>

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 6 [DPG for solving (12.24)]
- Initialization: $\mathbf{y}^0 \in \mathbb{R}^{n-1}$.
- General step ($k \geq 0$):
(a) $\mathbf{x}^k = \mathbf{D}^T \mathbf{y}^k + \mathbf{d}$;
(b) $\mathbf{y}^{k+1} = \mathbf{y}^k - \frac{1}{4} \mathbf{D} \mathbf{x}^k + \frac{1}{4} \mathcal{T}_{4\lambda}(\mathbf{D} \mathbf{x}^k - 4 \mathbf{y}^k)$.
</div>

Example 12.13. Consider the case where $n = 1000$ and the “clean” (actually unknown) signal is the vector $\mathbf{d}^{\mathrm{true}}$ , which is a discretization of a step function:

$$
d_{i}^{\text{true}} = \left\{\begin{array}{ll} 1, & 1 \leq i \leq 250, \\ 3, & 251 \leq i \leq 500, \\ 0, & 501 \leq i \leq 750, \\ 2, & 751 \leq i \leq 1000.\end{array} \right.
$$

The observed vector d was constructed by adding independently to each component of $\mathbf{d}^{\mathrm{true}}$ a normally distributed noise with zero mean and standard deviation 0.05. The true and noisy signals can be seen in Figure 12.2. We ran 100 iterations of Algorithms $6 ~(\mathrm{DPG})$ and $7 ~ \mathrm{(FDPG)}$ initialized with $\mathbf{y}^{0} = \mathbf{0}$ , and the resulting signals can be seen in Figure 12.3. Clearly, the FDPG method produces a much better quality reconstruction of the original step function than the DPG method. This is reflected in the objective function values of the vectors produced by each of the methods. The objective function values of the vectors generated by the DPG and FDPG methods after 100 iterations are 9.1667 and 8.4621, respectively, where the optimal value is 8.3031. 厂

## 12.4.4 Two-Dimensional Total Variation Denoising

In the two-dimensional total variation denoising problem, we are given an observed noisy matrix d $\in \mathbb{R}^{m \times n}$ , and we seek to solve the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{m \times n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{F}^{2} + \lambda \mathrm{TV}(\mathbf{x}) \right\}.\tag{12.25}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/d722825d905f2384e33907a8330bf58b3d37b610937332dccd6c4e2969756d2a.jpg)

![Figure 12.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/36d449669361f15deb83259b84d2e77e1430fe74a2547723dca89457865888ef.jpg)  
Figure 12.2. True signal (left) and noisy signal (right).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/0d9e8dfab79bb3edf44d59b330a39d609bb1879e0c7449fe4efd143accfc168e.jpg)

![Figure 12.3](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/1405427d424084730f2cf3358528af93f509f42606feacb029e3e0db431ac21c.jpg)  
Figure 12.3. Results of the DPG and FDPG methods.

There are many possible choices for the two-dimensional total variation function $\mathrm{TV}(\cdot)$ . Two popular choices are the isotropic TV defined for any $\mathbf{x} \in \mathbb{R}^{m \times n}$ by

$$
\begin{array}{l} \mathrm{TV}_{I}(\mathbf{x}) = \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n - 1} \sqrt{(x_{i, j} - x_{i, j + 1})^{2} +(x_{i, j} - x_{i + 1, j})^{2}} \\ \qquad + \sum_{j = 1}^{n - 1} | x_{m, j} - x_{m, j + 1} | + \sum_{i = 1}^{m - 1} | x_{i, n} - x_{i + 1, n} | \end{array}\tag{12.26}
$$

and the $l_{\mathrm{1}}{\mathrm{- based}}$ , anisotropic TV defined by

$$
\begin{array}{rl} \mathbf{x} \in \mathbb{R}^{m \times n}, & \mathrm{TV}_{l_{1}}(\mathbf{x}) = \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n - 1} \{| x_{i, j} - x_{i, j + 1} | + | x_{i, j} - x_{i + 1, j} |\} \\ & \qquad + \sum_{j = 1}^{n - 1} | x_{m, j} - x_{m, j + 1} | + \sum_{i = 1}^{m - 1} | x_{i, n} - x_{i + 1, n} |.\end{array}
$$

Problem (12.25) fits the main model (12.1) with $\mathbb{E} = \mathbb{R}^{m \times n}, \mathbb{V} = \mathbb{R}^{m \times(n - 1)} \times$ $\begin{array}{r}{\mathbb{R}^{(m - 1) \times n}, f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{F}^{2}} \end{array}$ , and $\mathcal{A}(\mathbf{x}) = \left(\mathbf{p}^{\mathbf{x}}, \mathbf{q}^{\mathbf{x}} \right)$ , where $\mathbf{p^{x}} \in \mathbb{R}^{m \times(n - 1)}$ and $\mathbf{q}^{\mathbf{x}} \in \mathbb{R}^{(m - 1) \times n}$ are given by

$$
p_{i, j}^{\mathbf{x}} = x_{i, j} - x_{i, j + 1}, \quad i = 1, 2, \ldots, m, j = 1, 2, \ldots, n - 1,
$$

$$
q_{i, j}^{\mathbf{x}} = x_{i, j} - x_{i + 1, j}, \quad i = 1, 2, \dots, m - 1, j = 1, 2, \dots, n.
$$

The function $g : \mathbb{V} \to \mathbb{R}$ is given in the isotropic case by

$$
g(\mathbf{p}, \mathbf{q}) = g_{\mathrm{I}}(\mathbf{p}, \mathbf{q}) \equiv \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n - 1} \sqrt{p_{i, j}^{2} + q_{i, j}^{2}} + \sum_{j = 1}^{n - 1} | p_{m, j} | + \sum_{i = 1}^{m - 1} | q_{i, n} |
$$

and in the anisotropic case by

$$
g(\mathbf{p}, \mathbf{q}) = g_{l_{1}}(\mathbf{p}, \mathbf{q}) \equiv \sum_{i = 1}^{m} \sum_{j = 1}^{n - 1} | p_{i, j} | + \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n} | q_{i, j} |.
$$

Since $g_{\mathrm{I}}$ and $g_{l_{1}}$ are a separable sum of either absolute values or $l_{2}$ norms, it is easy to compute their prox mappings using Theorem 6.6 (prox of separable functions), Example 6.8 (prox of the $l_{1}{\mathrm{- norm}})$ , and Example 6.19 (prox of Euclidean norms) and obtain that for any $\mathbf{p} \in \mathbb{R}^{m \times(n - 1)}$ and $\mathbf{q} \in \mathbb{R}^{(m - 1) \times n}$

$$
\mathrm{prox}_{\lambda g_{\mathrm{I}}}(\mathbf{p}, \mathbf{q}) =(\bar{\mathbf{p}}, \bar{\mathbf{q}}),
$$

where

$$
\bar{p}_{i, j} = \left(1 - \lambda / \max \left\{\sqrt{p_{i, j}^{2} + q_{i, j}^{2}}, \lambda \right\}\right) p_{i, j}, \quad i = 1, 2, \dots, m - 1, j = 1, 2, \dots n - 1,
$$

$$
\bar{p}_{m, j} = \mathcal{T}_{\lambda}(p_{m, j}), \quad j = 1, 2, \ldots, n - 1,
$$

$$
\bar{q}_{i, j} = \left(1 - \lambda / \max \left\{\sqrt{p_{i, j}^{2} + q_{i, j}^{2}}, \lambda \right\}\right) q_{i, j}, \quad i = 1, 2, \dots, m - 1, j = 1, 2, \dots n - 1,
$$

$$
\bar{q}_{i, n} = \mathcal{T}_{\lambda}(q_{i, n}), \quad i = 1, 2, \ldots, m - 1,
$$

and

$$
\operatorname{prox}_{\lambda g_{l_{1}}}(\mathbf{p}, \mathbf{q}) =(\tilde{\mathbf{p}}, \tilde{\mathbf{q}}),
$$

where

$$
\tilde{p}_{i, j} = \mathcal{T}_{\lambda}(p_{i, j}), \quad i = 1, 2, \ldots, m, j = 1, 2, \ldots n - 1,
$$

$$
\tilde{q}_{i, j} = \mathcal{T}_{\lambda}(q_{i, j}), \quad i = 1, 2, \ldots, m - 1, j = 1, 2, \ldots, n.
$$

The last detail that is missing in order to explicitly write the DPG or FDPG methods for solving problem (12.25) is the computation of $\mathcal { A } ^ { T } : \mathbb { V } $ <sup>E</sup> at points in $\mathbb{V}.$ . For that, note that for any $\mathbf{x} \in \mathbb{E}$ and $(\mathbf{p}, \mathbf{q}) \in \mathbb{V}$ 2

$$
\begin{array}{l} \langle \mathcal{A}(\mathbf{x}),(\mathbf{p}, \mathbf{q}) \rangle = \sum_{i = 1}^{m} \sum_{j = 1}^{n - 1}(x_{i, j} - x_{i, j + 1}) p_{i, j} + \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n}(x_{i, j} - x_{i + 1, j}) q_{i, j} \\ \qquad = \sum_{i = 1}^{m} \sum_{j = 1}^{n} x_{i, j}(p_{i, j} + q_{i, j} - p_{i, j - 1} - q_{i - 1, j}) \\ \qquad = \langle \mathbf{x}, \mathcal{A}^{T}(\mathbf{p}, \mathbf{q}) \rangle, \end{array}
$$

where we use a convention that

$$
p_{i, 0} = p_{i, n} = q_{0, j} = q_{m, j} = 0 \quad \mathrm{forany} i = 1, 2, \ldots, m, j = 1, 2, \ldots, n.
$$

Therefore, with the above convention in mind, for any $(\mathbf{p}, \mathbf{q}) \in \mathbb{V}$ 2

$$
\mathcal{A}^{T}(\mathbf{p}, \mathbf{q})_{i, j} = p_{i, j} + q_{i, j} - p_{i, j - 1} - q_{i - 1, j}, \quad i = 1, 2, \ldots, m, j = 1, 2, \ldots, n.
$$

We also want to compute an upper bound on $\|{\mathcal{A}} \|^{2}$ . This can be done using the same technique as in the one-dimensional case; note that for any $\mathbf{x} \in \mathbb{R}^{m \times n}$ 2

$$
\begin{array}{l} \| \mathcal{A}(\mathbf{x}) \|^{2} = \sum_{i = 1}^{m} \sum_{j = 1}^{n - 1}(x_{i, j} - x_{i, j + 1})^{2} + \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n}(x_{i, j} - x_{i + 1, j})^{2} \\ \qquad \leq 2 \sum_{i = 1}^{m} \sum_{j = 1}^{n - 1}(x_{i, j}^{2} + x_{i, j + 1}^{2}) + 2 \sum_{i = 1}^{m - 1} \sum_{j = 1}^{n}(x_{i, j}^{2} + x_{i + 1, j}^{2}) \\ \qquad \leq 8 \sum_{i = 1}^{n} \sum_{j = 1}^{m} x_{i, j}^{2}.\end{array}
$$

Therefore, $\| \mathcal{A} \|^{2} \leq 8$ . We will now explicitly write the FDPG method for solving the two-dimensional anisotropic total variation problem, meaning problem (12.25) with $g = g_{l_{1}}$ . For the stepsize, we use $L = 8$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 8 [FDPG for solving (12.25) with $g = \lambda \mathrm{TV}_{l_1}$]
- Initialization: $\tilde{\mathbf{p}}^0 = \mathbf{p}^0 \in \mathbb{R}^{m \times(n-1)}, \tilde{\mathbf{q}}^0 = \mathbf{q}^0 \in \mathbb{R}^{(m-1) \times n}, t_0 = 1$.
- General step ($k \geq 0$):
(a) compute $\mathbf{u}^k \in \mathbb{R}^{m \times n}$ by setting for $i = 1, 2, \ldots, m$, $j = 1, 2, \ldots, n$,
$u_{i,j}^k = \tilde{p}_{i,j}^k + \tilde{q}_{i,j}^k - \tilde{p}_{i,j-1}^k - \tilde{q}_{i-1,j}^k + d_{i,j}$;
(b) set ($\mathbf{p}^{k+1}, \mathbf{q}^{k+1}$) as
$p_{i,j}^{k+1} = \tilde{p}_{i,j}^k - \frac{1}{8}(u_{i,j}^k - u_{i,j+1}^k) + \frac{1}{8}\mathcal{T}_{8\lambda}(u_{i,j}^k - u_{i,j+1}^k - 8\tilde{p}_{i,j}^k)$,
$q_{i,j}^{k+1} = \tilde{q}_{i,j}^k - \frac{1}{8}(u_{i,j}^k - u_{i+1,j}^k) + \frac{1}{8}\mathcal{T}_{8\lambda}(u_{i,j}^k - u_{i+1,j}^k - 8\tilde{q}_{i,j}^k)$;
(c) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}$;
(d) ($\tilde{\mathbf{p}}^{k+1}, \tilde{\mathbf{q}}^{k+1}$) = ($\mathbf{p}^{k+1}, \mathbf{q}^{k+1}$) + ($\frac{t_k - 1}{t_{k+1}}$) ($\mathbf{p}^{k+1} - \mathbf{p}^k, \mathbf{q}^{k+1} - \mathbf{q}^k$).
</div>

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 9 [FDPG for solving (12.27)]

- Initialization: $\mathbf{w}^0 = \mathbf{y}^0 \in \mathbb{E}^p$, $t_0 = 1$.
- General step ($k \geq 0$):
(a) $\mathbf{u}^k = \operatorname{argmax}_{\mathbf{u} \in \mathbb{E}} \left\{\langle \mathbf{u}, \sum_{i=1}^{p} \mathbf{w}_i^k \rangle - f(\mathbf{u}) \right\}$;
(b) $\mathbf{y}_i^{k+1} = \mathbf{w}_i^k - \frac{\sigma}{p} \mathbf{u}^k + \frac{\sigma}{p} \text{prox}_{\frac{p}{\sigma} g_i}(\mathbf{u}^k - \frac{p}{\sigma} \mathbf{w}_i^k)$, $i = 1, 2, \ldots, p$;
(c) $t_{k+1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}$;
(d) $\mathbf{w}^{k+1} = \mathbf{y}^{k+1} + \left(\frac{t_k - 1}{t_{k+1}} \right)(\mathbf{y}^{k+1} - \mathbf{y}^k)$.
</div>

## 12.5 The Dual Block Proximal Gradient Method

## 12.5.1 Preliminaries

In this section we will consider the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \left\{f(\mathbf{x}) + \sum_{i = 1}^{p} g_{i}(\mathbf{x}) \right\},\tag{12.27}
$$

where the following assumptions are made.

Assumption 12.14.

(A) $f : \mathbb{E} \to(- \infty, + \infty]$ is proper closed and σ-strongly convex $(\sigma > 0)$

(B) $g_{i} : \mathbb{E}(- \infty, + \infty]$ is proper closed and convex for any $i \in \{1, 2, \ldots, p\}$

(C) $\operatorname{ri}(\operatorname{dom}(f)) \cap(\cap_{i = 1}^{p} \operatorname{ri}(\operatorname{dom}(g_{i}))) \neq \emptyset.$

Problem (12.27) is actually a generalization of the projection problem discussed in Section 12.4.2, and we can use a similar observation to the one made there and note that problem (12.27) fits model (12.1) with $\mathbb{V} = \mathbb{E}^{p}, g(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{p}) =$ $\textstyle \sum_{i = 1}^{p} g_{i}(\mathbf{x}_{i})$ , and $\mathcal{A} : \mathbb{E} \mathbb{V}$ given by

$$
\mathcal{A}(\mathbf{z}) =(\underbrace{\mathbf{z}, \mathbf{z}, \dots, \mathbf{z}}) \text{for any} \mathbf{z} \in \mathbb{E}.
$$

AB<sub>p</sub> <sub>times</sub>

Noting that

$\| A \|^{2} = p;$

$\begin{array}{r}{\mathcal{A}^{T}(\mathbf{y}) = \sum_{i = 1}^{p} y_{i}} \end{array}$ for any $\mathbf{y} \in \mathbb{E}^{p}$

$\mathrm{prox}_{Lg}({\bf v}_{1},{\bf v}_{2}, \ldots,{\bf v}_{p}) =(\mathrm{prox}_{Lg_{1}}({\bf v}_{1}), \mathrm{prox}_{Lg_{2}}({\bf v}_{2}), \ldots, \mathrm{prox}_{Lg_{p}}({\bf v}_{p}))$ for any $\mathbf{v}_{i} \in \mathbb{E}, i = 1, 2, \dots, p,$

we can explicitly write the FDPG method with $\begin{array}{r}{L = \frac{\| \mathcal{A} \|^{2}}{\sigma} = \frac{p}{\sigma}} \end{array}$

The primal sequence is given by

$$
\mathbf{x}^{k} = \operatorname{argmax}_{\mathbf{x} \in \mathbb{E}} \left\{\left\langle \mathbf{x}, \sum_{i = 1}^{p} \mathbf{y}_{i}^{k} \right\rangle - f(\mathbf{x}) \right\}.
$$

## 12.5.2 The Dual Block Proximal Gradient Method

Note that the stepsize taken at each iteration of Algorithm 9 is $\textstyle{\frac{\sigma}{p}}$ , which might be extremely small when the number of blocks $(p)$ is large. The natural question is therefore whether it is possible to define a dual-based method whose stepsize is independent of the dimension. For that, let us consider the dual of problem (12.27), meaning problem (12.4). Keeping in mind that $\begin{array}{r}{\mathcal{A}^{T}(\mathbf{y}) = \sum_{i = 1}^{p} \mathbf{y}_{i}} \end{array}$ and the fact that $\begin{array}{r}{g^{*}(\mathbf{y}) = \sum_{i = 1}^{p} g_{i}^{*}(\mathbf{y}_{i})} \end{array}$ (see Theorem 4.12), we obtain the following form of the dual problem:

$$
q_{\mathrm{opt}} = \max_{\mathbf{y} \in \mathbb{E}^{p}} \left\{- f^{*} \left(\sum_{i = 1}^{p} \mathbf{y}_{i}\right) - \sum_{i = 1}^{p} \underbrace{g_{i}^{*}(- \mathbf{y}_{i})}_{G_{i}(\mathbf{y}_{i})} \right\}.\tag{12.28}
$$

Since the nonsmooth part in (12.28) is block separable, we can employ a block proximal gradient method (see Chapter 11) on the dual problem (in its minimization form). Suppose that the current point is $\mathbf{\widetilde{y}}^{k} =(\mathbf{y}_{1}^{k}, \mathbf{y}_{2}^{k}, \ldots, \mathbf{y}_{p}^{k})$ . At each iteration of a block proximal gradient method we pick an index i according to some rule and perform a proximal gradient step only on the ith block which is thus updated by the formula

$$
\mathbf{y}_{i}^{k + 1} = \operatorname{prox}_{\sigma G_{i}} \left(\mathbf{y}_{i}^{k} - \sigma \nabla f^{*} \left(\sum_{j = 1}^{p} \mathbf{y}_{j}^{k}\right)\right).
$$

The stepsize was chosen to be $\sigma$ since f is proper closed and σ-strongly convex, and thus, by the conjugate correspondence theorem (Theorem 5.26), $f^{*}$ is <sup>1</sup> -smooth, from which it follows that the block Lipschitz constants of the function $(\mathbf{y}_{1}, \mathbf{y}_{2}, \ldots, \mathbf{y}_{p}) \mapsto f^{*}(\sum_{i = 1}^{p} \mathbf{y}_{i})$ are $\textstyle{\frac{1}{\sigma}}$ . Thus, the constant stepsize can be taken as $\sigma.$ We can now write a dual representation of the dual block proximal gradient (DBPG) method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Dual Block Proximal Gradient (DBPG) Method—dual representation
- Initialization: pick $\mathbf{y}^0 =(\mathbf{y}_1^0, \mathbf{y}_2^0, \ldots, \mathbf{y}_p^0) \in \mathbb{E}^p$.
- General step ($k \geq 0$):
    - pick an index $i_k \in \{1, 2, \ldots, p\}$;
    - compute $\mathbf{y}_j^{k+1} = \begin{cases} \text{prox}_{\sigma G_{i_k}} \left(\mathbf{y}_{i_k}^k - \sigma \nabla f^*(\sum_{j=1}^p \mathbf{y}_j^k) \right), &amp; j = i_k, \\ \mathbf{y}_j^k, &amp; j \neq i_k.\end{cases}$
</div>

We can utilize Lemma 12.5 to obtain a primal representation of the general step of the DBPG method.

Lemma 12.15. Let f and $g_{1}, g_{2}, \ldots, g_{p}$ satisfy properties $\mathrm{(A)}$ and (B) of Assumption 12.14. Let $i \in \{1, 2,..., p\}$ and $G_{i}(\mathbf{y}_{i}) \equiv g_{i}^{*}(- \mathbf{y}_{i})$ . Let $L > 0$ . Then $\mathbf{y}_{i} \in \mathbb{E}$ and $\mathbf{v} \in \mathbb{E}^{p}$ satisfy the relation

$$
\mathbf{y}_{i} = \operatorname{prox}_{\frac{1}{L} G_{i}} \left(\mathbf{v}_{i} - \frac{1}{L} \nabla f^{*} \left(\sum_{j = 1}^{p} \mathbf{v}_{j}\right)\right)
$$

$if$ and only if

$$
\mathbf{y}_{i} = \mathbf{v}_{i} - \frac{1}{L} \tilde{\mathbf{x}} + \frac{1}{L} \mathrm{prox}_{Lg_{i}} \left(\tilde{\mathbf{x}} - L \mathbf{v}_{i}\right),
$$

where

$$
\tilde{\mathbf{x}} = \operatorname{argmax}_{\mathbf{x} \in \mathbb{E}} \left\{\left\langle \mathbf{x}, \sum_{j = 1}^{p} \mathbf{v}_{j} \right\rangle - f(\mathbf{x}) \right\}.
$$

Proof. Follows by invoking Lemma 12.5 with $\begin{array}{r}{\mathbb{V} = \mathbb{E}, \boldsymbol{\mathcal{A}} = \boldsymbol{\mathcal{T}}, \mathbf{b} = \sum_{j \neq i} \mathbf{v}_{j}, g = g_{i}} \end{array}$ $\mathbf{y} = \mathbf{y}_{i}$ , and $\mathbf{v} = \mathbf{v}_{i}$ 口

Using Lemma 12.15, we can now write a primal representation of the DBPG method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Dual Block Proximal Gradient (DBPG) Method—primal representation

Initialization: pick  $\mathbf{y}^{0} =(\mathbf{y}_{1}^{0}, \mathbf{y}_{2}^{0}, \ldots, \mathbf{y}_{p}^{0}) \in \mathbb{E}$ .

General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:

(a) pick  $i_{k} \in \{1, 2, \ldots, p\}$ ;

(b) set  $x^{k} = \arg\max_{x \in E} \left\{\langle x, \sum_{j=1}^{p} y_{j}^{k} \rangle - f(x) \right\}$ ;

(c) set  $y_{j}^{k+1} = \begin{cases} y_{i_{k}}^{k} - \sigma x^{k} + \sigma \text{prox}_{g_{i}/\sigma}(x^{k} - y_{i_{k}}^{k}/\sigma), &amp; j = i_{k}, \\ y_{j}^{k}, &amp; j \neq i_{k}.\end{cases}$
</div>

Note that the derived DBPG method is a functional decomposition method, as it utilizes only one of the functions $g_{1}, g_{2}, \ldots, g_{p}$ at each iteration, and in addition the computation involving the function $f(\mathrm{step ~(b)})$ does not involve any other function. Thus, we obtained that in this case a variables decomposition method in the dual space gives rise to a functional decomposition method in the primal space.

What is missing from the above description of the DBPG method is the index selection strategy, meaning the rule for choosing $i_{k}$ at each iteration. We will consider two variations.

- Cyclic. $i_{k} =(k \mod p) + 1$

- Randomized. $i_{k}$ is randomly picked from $\{1, 2, \ldots, p\}$ by a uniform distribution.

## 12.5.3 Convergence Analysis

The rate of convergence of the DBPG method is a simple consequence of the rates of convergence already established for the block proximal gradient method in Chapter 11 combined with the primal-dual relation presented in Lemma 12.7.

## Cyclic Block Order

Recall that since the model (12.27) is a special case of the general model (12.1) (with $\begin{array}{r}{\mathbb{V} = \mathbb{E}^{p}, \boldsymbol{\mathcal{A}} : \mathbf{z} \mapsto(\mathbf{z}, \mathbf{z}, \ldots, \mathbf{z}), g(\mathbf{x}) = \sum_{i = 1}^{p} g_{i}(\mathbf{x}_{i}))} \end{array}$ , then under Assumption 12.14 the strong duality theorem (Theorem 12.2) holds, and thus the dual problem (12.28) has a nonempty optimal set. We will denote the set of dual optimal solutions by $\Lambda^{*}$ . The following assumption is required to present a convergence result for the DBPG method with a cyclic index selection strategy.

Assumption 12.16. For any $\alpha > 0$ , there exists $R_{\alpha} > 0$ such that

$$
\max_{\mathbf{y}, \mathbf{y}^{*} \in \mathbb{E}^{p}} \left\{\| \mathbf{y} - \mathbf{y}^{*} \|: q(\mathbf{y}) \geq \alpha, \mathbf{y}^{*} \in \Lambda^{*} \right\} \leq R_{\alpha},
$$

where $\begin{array}{r}{q(\mathbf{y}) \equiv - f^{*}(\sum_{i = 1}^{p} \mathbf{y}_{i}) - \sum_{i = 1}^{p} g_{i}^{*}(- \mathbf{y}_{i}).} \end{array}$

Theorem 12.17 $(O(1 / k)$ rate of convergence of DBPG with cyclic order). Suppose that Assumptions 12.14 and 12.16 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ and $\{\mathbf{y}^{k}\}_{k \geq 0}$ be the primal and dual sequences generated by the DBPG method with cyclic index selection strategy for solving problem (12.27). Then for any $k \geq 2$ 2

$$
\text{(a)} q_{\mathrm{opt}} - q(\mathbf{y}^{pk}) \leq \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2}(q_{\mathrm{opt}} - q(\mathbf{y}^{0})), \frac{8p(p + 1)^{2} \mathbb{R}^{2}}{\sigma(k - 1)} \right\};
$$

$$
\text{(b)} \| \mathbf{x}^{pk} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma} \max \left\{\left(\frac{1}{2}\right)^{(k - 1) / 2}(q_{\mathrm{opt}} - q(\mathbf{y}^{0})), \frac{8p(p + 1)^{2} \mathbb{R}^{2}}{\sigma(k - 1)} \right\}.
$$

In the above two formulas $R = R_{q(\mathbf{y}^{0})}$

Proof. (a) The proof follows by invoking Theorem 11.18 while taking into account that in this case the constants in (11.24) are given by $\begin{array}{r}{L_{\operatorname{max}} = L_{\operatorname{min}} = \frac{1}{\sigma}, L_{f} = \frac{p}{\sigma}} \end{array}$

(b) By the primal-dual relation, Lemma 12.7, $\begin{array}{r}{\| \mathbf{x}^{pk} - \mathbf{x}^{*} \|^{2} \leq \frac{2}{\sigma}(q_{\mathrm{opt}} - \mathbf{\bar{q}}(\mathbf{y}^{p \check{k}}))} \end{array}$ which, combined with part (a), yields the inequality of part (b).

## Randomized Block Order

A direct result of the $O(1 / k)$ rate of convergence of the RBPG method presented in Theorem 11.25 along with the primal-dual relation (Lemma 12.7) yields the following result on the convergence of the DBPG method with random index selection strategy. As in Section 11.5, we will use the notation of the random variable ${\xi}_{k} \equiv \left\{i_{0}, i_{1}, \ldots, i_{k} \right\}$ . Note that in the randomized setting we do not require $\mathrm{As}_{-}$ sumption 12.16 to hold.

Theorem 12.18 $(O(1 / k)$ rate of convergence of DBPG with randomized order). Suppose that Assumption 12.14 holds. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ and $\{\mathbf{y}^{k}\}_{k \geq 0}$ be primal and dual sequences generated by the DBPG method with randomized index selection strategy. Then for any $k \geq 0$ 4

$$
\text{(a)} q_{\mathrm{opt}} - \mathbb{E}_{\xi_{k}}(q(\mathbf{y}^{k + 1})) \leq \frac{p}{p + k + 1} \left(\frac{1}{2 \sigma} \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2} + q_{\mathrm{opt}} - q(\mathbf{y}^{0})\right);
$$

$$
\text{(b)} \mathbb{E}_{\xi_{k}} \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \frac{2p}{\sigma(p + k + 1)} \left(\frac{1}{2 \sigma} \| \mathbf{y}^{0} - \mathbf{y}^{*} \|^{2} + q_{\mathrm{opt}} - q(\mathbf{y}^{0})\right).
$$

## 12.5.4 Acceleration in the Two-Block Case69

Both the deterministic and the randomized DBPG methods are not accelerated methods, and consequently it was only possible to show that they exhibit an $O(1 / k)$ rate of convergence. In the case where $p = 2$ , we will show that it is actually possible to derive an accelerated dual block proximal gradient method by using a simple trick. For that, note that when $p = 2$ , the model amounts to

$$
f_{\text{opt}} = \min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) \equiv f(\mathbf{x}) + g_{1}(\mathbf{x}) + g_{2}(\mathbf{x})\}.\tag{12.29}
$$

We can rewrite the problem as

$$
\min_{\mathbf{x} \in \mathbb{E}} \{\tilde{f}(\mathbf{x}) + g_{2}(\mathbf{x})\},\tag{12.30}
$$

where $\tilde{f} = f + g_{1}$ . If Assumption 12.14 holds with $p = 2.$ , then $\tilde{f}$ is proper closed and σ-strongly convex, $g_{2}$ is proper closed and convex, and the regularity condition $\operatorname{ri}(\operatorname{dom}({\tilde{f}})) \cap \operatorname{ri}(\operatorname{dom}(g_{2})) \neq \varnothing$ is satisfied. This means that Assumption 12.1 holds for $f = f, g = g_{2}$ , and $\mathcal A = \mathcal T$ . We can now define the accelerated dual block proximal gradient (ADBPG), which is the FDPG method with stepsize $\sigma$ employed on the model (12.1) with $f = \tilde{f}, g = g_{2}$ , and $\mathcal A = \mathcal T$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The ADBPG Method
Initialization:  $w^{0} = y^{0} \in E, t_{0} = 1$ .
General step ( $k \geq 0$ ):
(a)  $u^{k} = \arg\max_{u} \left\{\langle u, w^{k} \rangle - f(u) - g_{1}(u) \right\}$ ;
(b)  $y^{k+1} = w^{k} - \sigma u^{k} + \sigma \text{prox}_{g_{2}/\sigma}(u^{k} - w^{k}/\sigma)$ ;
(c)  $t_{k+1} = \frac{1 + \sqrt{1 + 4t_{k}^{2}}}{2}$ ;
(d)  $w^{k+1} = y^{k+1} + \left(\frac{t_{k}-1}{t_{k+1}}\right)(y^{k+1} - y^{k})$ .
</div>

A direct consequence of Theorem 12.10 is the following result on the rate of convergence of the ADBPG method.

Theorem 12.19 $(O(1 / k^{2})$ rate of convergence of ADBPG). Suppose that Assumption 12.14 holds with $p = 2$ , and let $\{\mathbf{y}^{k}\}_{k \geq 0}$ be the sequence generated by the ADBPG method. Then for any optimal solution $\mathbf{y}^{*}$ of the dual problem

$$
\min_{\mathbf{y} \in \mathbb{E}} \{(\tilde{f})^{*}(\mathbf{y}) + g_{2}^{*}(- \mathbf{y})\}
$$

and $k \geq 1$ , it holds that

$$
\left\| \mathbf{x}^{k} - \mathbf{x}^{*} \right\|^{2} \leq \frac{4 \left\| \mathbf{y}^{0} - \mathbf{y}^{*} \right\|^{2}}{\sigma^{2}(k + 1)^{2}},
$$

where $\mathbf{x}^{k} = \operatorname{argmax}_{\mathbf{x}} \left\{\langle \mathbf{x}, \mathbf{y}^{k} \rangle - f(\mathbf{x}) - g_{1}(\mathbf{x}) \right\}$

Remark 12.20. When $\begin{array}{r}{f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|^{2}} \end{array}$ for some d $\in \mathbb{E}$ , step (a) of the ADBPG can be written as a prox computation:

$$
\mathbf{u}^{k} = \mathrm{prox}_{g_{1}}(\mathbf{d} + \mathbf{w}^{k}).
$$

Remark 12.21. Note that the ADBPG is not a full functional decomposition method since step (a) is a computation involving both f and $g_{1}$ , but it still separates between $g_{1}$ and $g_{2}$ . The method has two main features. First, it is an accelerated method. Second, the stepsize taken in the method is $\sigma_{i}$ , in contrast to the stepsize of $\textstyle{\frac{\sigma}{2}}$ that is used in Algorithm $9_{i}$ which is another type of an FDPG method.

## 12.6 Examples II

Example 12.22 (one-dimensional total variation denoising). In this example we will compare the performance of the ADBPG method and Algorithm 9 (with $p = 2)$ —both are FDPG methods, although quite different. We will consider the one-dimensional total variation problem (see also Section 12.4.3)

$$
f_{\text{opt}} = \min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{F(\mathbf{x}) \equiv \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2} + \lambda \sum_{i = 1}^{n - 1} | x_{i - 1} - x_{i} | \right\},\tag{12.31}
$$

where d $\in \mathbb{R}^{n}$ and $\lambda > 0$ . The above problem can be written as

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \{f(\mathbf{x}) + g_{1}(\mathbf{x}) + g_{2}(\mathbf{x})\},
$$

where

$$
f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{2}^{2},
$$

$$
g_{1}(\mathbf{x}) = \lambda \sum_{i = 1}^{\lfloor \frac{n}{2} \rfloor} | x_{2i - 1} - x_{2i} |,
$$

$$
g_{2}(\mathbf{x}) = \lambda \sum_{i = 1}^{\lfloor \frac{n - 1}{2} \rfloor} | x_{2i} - x_{2i + 1} |.
$$

![Figure 12.4](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/4ad4f2b99891232485275ef6a573277391f332f59652b34f726524193bbd2759.jpg)  
Figure 12.4. Comparison of the ADBPG method and Algorithm 9 employed on the one-dimensional total variation denoising problem.

By Example 6.17 we have that the prox of λ times the two-dimensional function $h(y, z) = | y - z |$ is given by

$$
\begin{array}{c} \operatorname{prox}_{\lambda h}(y, z) =(y, z) + \frac{1}{2 \lambda^{2}}(\mathcal{T}_{2 \lambda^{2}}(\lambda y - \lambda z) - \lambda y + \lambda z)(\lambda, - \lambda) \\ =(y, z) + \frac{1}{2}([| y - z | - 2 \lambda]_{+} \mathrm{sgn}(y - z) - y + z)(1, - 1).\end{array}
$$

Therefore, using the separability of $g_{1}$ w.r.t. the pairs of variables $\{x_{1}, x_{2}\}$ $\{x_{3}, x_{4}\}, \ldots,$ it follows that

$$
\operatorname{prox}_{g_{1}}(\mathbf{x}) = \mathbf{x} + \frac{1}{2} \sum_{i = 1}^{\lfloor \frac{n}{2} \rfloor}([| x_{2i - 1} - x_{2i} | - 2 \lambda]_{+} \operatorname{sgn}(x_{2i - 1} - x_{2i}) - x_{2i - 1} + x_{2i})(\mathbf{e}_{2i - 1} - \mathbf{e}_{2i}),
$$

and similarly

$$
\mathrm{prox}_{g_{2}}(\mathbf{x}) = \mathbf{x} + \frac{1}{2} \sum_{i = 1}^{\lfloor \frac{n - 1}{2} \rfloor}([| x_{2i} - x_{2i + 1} | - 2 \lambda]_{+} \mathrm{sgn}(x_{2i} - x_{2i + 1}) - x_{2i} + x_{2i + 1})(\mathbf{e}_{2i} - \mathbf{e}_{2i + 1}).
$$

Equipped with the above expressions for $\operatorname{prox}_{g_{1}}$ and $\operatorname{prox}_{g_{2}}$ (recalling that step (a) only requires a single computation of $\operatorname{prox}_{g_{1}};$ ; see Remark 12.20), we can employ <sup>1</sup>the ADBPG method and Algorithm 9 on problem (12.31). The computational efort per iteration in both methods is almost identical and is dominated by single evaluations of the prox mappings of $g_{1}$ and $g_{2}$ . We ran 1000 iterations of both algorithms starting with a dual vector which is all zeros. In Figure 12.4 we plot the distance in function values<sup>70</sup> $F(\mathbf{x}^{k}) - f_{\mathrm{opt}}$ as a function of the iteration index k. Evidently, the ADBPG method exhibits the superior performance. Most likely, the reason is the fact that the ADBPG method uses a larger stepsize (σ) than the one used by Algorithm 9 ( <sup>σ</sup> ).

Example 12.23 (two-dimensional total variation denoising). Consider the isotropic two-dimensional total variation problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{m \times n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{F}^{2} + \lambda \mathrm{TV}_{I}(\mathbf{x}) \right\},
$$

where d $\in \mathbb{R}^{m \times n}, ~ \lambda > 0$ , and $\mathrm{TV}_{I}$ is given in (12.26). It does not seem possible to decompose $\mathrm{TV}_{I}$ into two functions whose prox can be directly computed as in the one-dimensional case. However, a decomposition into three separable functions (w.r.t. triplets of variables) is possible. To describe the decomposition, we introduce the following notation. Let $D_{k}$ denote the set of indices that correspond to the elements of the kth diagonal of an $m \times n$ matrix, where $D_{0}$ represents the indices set of the main diagonal, and $D_{k}$ for $k > 0$ and $k < 0$ stand for the diagonals above and below the main diagonal, respectively. In addition, consider the partition of the diagonal indices set, $\{-(m - 1), \ldots, n - 1\}$ , into three sets

$$
K_{i} \equiv \bigl \{k \in \{-(m - 1), \ldots, n - 1\}:(k + 1 - i) \mod 3 = 0 \bigr\}, \qquad i = 1, 2, 3.
$$

With the above notation, we are now ready to write the function $\mathrm{TV}_{I}$ as

$$
\begin{array}{l} \mathrm{TV}_{I}(\mathbf{x}) = \sum_{i = 1}^{m} \sum_{j = 1}^{n} \sqrt{(x_{i, j} - x_{i, j + 1})^{2} +(x_{i, j} - x_{i + 1, j})^{2}} \\ \qquad = \sum_{k \in K_{1}} \sum_{(i, j) \in D_{k}} \sqrt{(x_{i, j} - x_{i, j + 1})^{2} +(x_{i, j} - x_{i + 1, j})^{2}} \\ \qquad + \sum_{k \in K_{2}} \sum_{(i, j) \in D_{k}} \sqrt{(x_{i, j} - x_{i, j + 1})^{2} +(x_{i, j} - x_{i + 1, j})^{2}} \\ \qquad + \sum_{k \in K_{3}} \sum_{(i, j) \in D_{k}} \sqrt{(x_{i, j} - x_{i, j + 1})^{2} +(x_{i, j} - x_{i + 1, j})^{2}} \\ \qquad = \psi_{1}(\mathbf{x}) + \psi_{2}(\mathbf{x}) + \psi_{3}(\mathbf{x}), \end{array}
$$

where we assume in the above expressions that $x_{i, n + 1} = x_{i, n}$ and $x_{m + 1, j} = x_{m, j}$ The fact that each of the functions $\psi_{i}$ is separable w.r.t. triplets of variables $\{x_{i, j}$ $x_{i + 1, j}, x_{i, j + 1}\}$ is evident from the illustration in Figure 12.5.

The denoising problem can thus be rewritten as

$$
\min_{\mathbf{x} \in \mathbb{R}^{m \times n}} \left\{\frac{1}{2} \| \mathbf{x} - \mathbf{d} \|_{F}^{2} + \lambda \psi_{1}(\mathbf{x}) + \lambda \psi_{2}(\mathbf{x}) + \lambda \psi_{3}(\mathbf{x}) \right\}.
$$

It is not possible to employ the ADBPG method since the nonsmooth part is decomposed into three functions. However, it is possible to employ the DBPG method, which has no restriction on the number of functions. The algorithm requires evaluating a prox mapping of one of the functions $\lambda \psi_{i}$ at each iteration. By the separability of these functions, it follows that each prox computation involves several prox computations of three-dimensional functions of the form $\lambda h$ , where

$$
h(x, y, z) = \sqrt{(x - y)^{2} +(x - z)^{2}}.
$$

![Figure 12.5](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/c27ad8f577f0a45bd1c18991bef322cbbf16ab8c87e2801b0f3ee3a04064e6e2.jpg)

Figure 12.5. The decomposition of a $16 \times 12$ pixels Mario image according to the isotropic TV into three separable functions. The images are partitioned into blocks of three pixels positioned in an r-shaped structure. Each block encompasses the three pixels that form the term $\sqrt{(x_{i, j} - x_{i + 1, j})^{2} +(x_{i, j} - x_{i, j + 1})^{2}}$ . Summing over all the terms represented by the blocks of any of the above images yields the appropriate separable function. Reprinted with permission from Elsevier. [23]

The prox of λh can be computed using Lemma 6.68 and is given by

$$
\operatorname{prox}_{\lambda h}(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T})^{- 1} \mathbf{Ax}, & \|(\mathbf{AA}^{T})^{- 1} \mathbf{Ax} \|_{2} \leq \lambda, \\ \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T} + \alpha^{*} \mathbf{I})^{- 1} \mathbf{Ax}, & \|(\mathbf{AA}^{T})^{- 1} \mathbf{Ax} \|_{2} > \lambda, \end{array} \right.
$$

where $\alpha^{*}$ is the unique root of the decreasing function

$$
g(\alpha) = \|(\mathbf{AA}^{T} + \alpha^{*} \mathbf{I})^{- 1} \mathbf{Ax} \|_{2}^{2} - \lambda^{2}
$$

and A is the matrix

$$
\mathbf{A} = \left(\begin{array}{ccc} 1 & - 1 & 0 \\ 1 & 0 & - 1 \end{array} \right).\quad \blacksquare
$$


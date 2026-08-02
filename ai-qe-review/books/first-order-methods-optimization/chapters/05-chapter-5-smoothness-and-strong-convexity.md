---
title: "Chapter 5 \u2014 Smoothness and Strong Convexity"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 5
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 5068
source_line_end: 5961
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

# Chapter 5 — Smoothness and Strong Convexity

> [[../README|本书目录]] · [[04-chapter-4-conjugate-functions|上一章]] · [[06-chapter-6-the-proximal-operator|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 5068–5961。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：Affine × 2；different × 3；Differentiability × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Smoothness and Strong Convexity

## 5.1 L-Smooth Functions

We begin with the definition of L-smoothness.

Definition 5.1 (L-smoothness). Let $L \geq 0$ . A function $f : \mathbb{E}(- \infty, \infty]$ is said to be L-smooth over a set $D \subseteq \mathbb{E}$ if it is diferentiable over D and satisfies

$$
\left\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \right\|_{*} \leq L \| \mathbf{x} - \mathbf{y} \| \text{for all} \mathbf{x}, \mathbf{y} \in D.
$$

The constant L is called the smoothness parameter.

Obviously, by the definition of Differentiability, if f is L-smooth over a set $D \subseteq \mathbb{E}$ , this means in particular that $D \subseteq \operatorname{int}(\operatorname{dom} f)$ . If a function is L-smooth over <sup>E</sup>, then we will just refer to it as L-smooth (without mentioning the entire space). Another frequent terminology in the literature refers to an L-smooth function over D as $^{66} a$ function with Lipschitz gradient with constant $L.^{\dprime}$ The class of L-smooth functions is denoted by $\bar{C}_{L}^{1, 1}(D)$ . When $D = \mathbb{E}$ , the class is often denoted by ${C}_{L}^{1, 1}$ instead of $C_{L}^{1, 1}(\mathbb{E})$ . The class of functions which are L-smooth for some $L \geq 0$ is denoted by $C^{1, 1}$

By the definition of L-smoothness, it is clear that if a function is $L_{\mathrm{1} \mathrm{-} \mathrm{smooth}}$ 8 then it is also L<sub>2</sub>-smooth for any $L_{2} \ge L_{1}$ . It is therefore sometimes interesting to discuss the value of the smallest possible smoothness parameter of a given function.

Example 5.2 (smoothness of quadratic functions). Consider the function $f : \mathbb{R}^{n} \mathbb{R}$ given by $\begin{array}{r}{f(\mathbf{x}) = \frac{1}{2} \mathbf{x}^{T} \mathbf{A} \mathbf{x} + \mathbf{b}^{T} \mathbf{x} + c,} \end{array}$ , where $\mathbf{A} \in \mathbb{S}^{n}, \mathbf{b} \in \mathbb{R}^{n}$ , and $c \in \mathbb{R}$ We assume that $\mathbb{R}^{n}$ is endowed with the l<sub>p</sub>-norm $(1 \leq p \leq \infty)$ . Then, for any $\mathbf{c}, \mathbf{y} \in \mathbb{R}^{n}$

$$
\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{q} = \| \mathbf{Ax} - \mathbf{Ay} \|_{q} \leq \| \mathbf{A} \|_{p, q} \| \mathbf{x} - \mathbf{y} \|_{p},
$$

where $\| \cdot \|_{p, q}$ is the induced norm given by (see also Section 1.8.2)

$$
\left\| \mathbf{A} \right\|_{p, q} = \max \{\left\| \mathbf{Ax} \right\|_{q}: \left\| \mathbf{x} \right\|_{p} \leq 1\},
$$

with $q \in[1, \infty]$ satisfying $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$ . We can thus conclude that f is $\| \mathbf{A} \|_{p, q}$ -smooth. We will show that $\| \mathbf{A} \|_{p, q}$ is the smallest smoothness parameter. For that, assume that $f$ is L-smooth. Take a vector $\tilde{\mathbf{x}}$ satisfying $\| \tilde{\mathbf{x}} \|_{p} = 1$ and $\| \mathbf{A} \tilde{\mathbf{x}} \|_{q} = \| \mathbf{A} \|_{p, q}$ . The existence of such a vector is guaranteed by the definition the induced matrix norm. Then

$$
\| \mathbf{A} \|_{p, q} = \| \mathbf{A} \tilde{\mathbf{x}} \|_{q} = \| \nabla f(\tilde{\mathbf{x}}) - \nabla f(\mathbf{0}) \|_{q} \leq L \| \tilde{\mathbf{x}} - \mathbf{0} \|_{p} = L.
$$

We thus showed that if $f$ is L-smooth, then $L \geq \| \mathbf{A} \|_{p, q},$ proving that $\| \mathbf{A} \|_{p, q}$ is indeed the smallest possible smoothness parameter.

Example 5.3 (0-smoothness of Affine functions). Let $f : \mathbb{E} \to \mathbb{R}$ be given by $f(\mathbf{x}) = \left.\mathbf{b}, \mathbf{x} \right.+ c$ , where b $\in \mathbb{E}^{*}$ and $c \in \mathbb{R}$ . For any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$

$$
\left\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \right\|_{*} = \left\| \mathbf{b} - \mathbf{b} \right\|_{*} = 0 \leq 0 \| \mathbf{x} - \mathbf{y} \|,
$$

showing that Affine functions are 0-smooth.

The next example will utilize a well-known result on the orthogonal projection operator, which was introduced in Example 3.31. A more general result will be shown later on in Theorem 6.42.

Theorem 5.4 (see [10, Theorem 9.9]). Let <sup>E</sup> be a Euclidean space, and let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set. Then

(a) (firm nonexpansiveness) For any v, $\mathbf{w} \in \mathbb{E}$

$$
\langle P_{C}(\mathbf{v}) - P_{C}(\mathbf{w}), \mathbf{v} - \mathbf{w} \rangle \geq \| P_{C}(\mathbf{v}) - P_{C}(\mathbf{w}) \|^{2}.\tag{5.1}
$$

(b) (nonexpansiveness) For any $\mathbf{v}, \mathbf{w} \in \mathbb{E}$ 2

$$
\left\| P_{C}(\mathbf{v}) - P_{C}(\mathbf{w}) \right\| \leq \left\| \mathbf{v} - \mathbf{w} \right\|.\tag{5.2}
$$

Example 5.5 (1-smoothness of $\scriptstyle{\frac{1}{2}} d_{C}^{2})$ . Suppose that <sup>E</sup> is a Euclidean space, and let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set. Consider the function $\varphi_{C}(\mathbf{x}) =$ $\textstyle{\frac{1}{2}} d_{C}^{2}(\mathbf{x})$ . By Example 3.31, $\varphi_{C}$ is diferentiable over <sup>E</sup> and $\nabla \varphi_{C}(\mathbf{x}) = \mathbf{x} - P_{C}(\mathbf{x})$ We will show that $\varphi_{C}$ is 1-smooth. Indeed, for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$

$$
\begin{array}{rl} \| \nabla \varphi_{C}(\mathbf{x}) - \nabla \varphi_{C}(\mathbf{y}) \|^{2} & = \| \mathbf{x} - \mathbf{y} - P_{C}(\mathbf{x}) + P_{C}(\mathbf{y}) \|^{2} \\ & = \| \mathbf{x} - \mathbf{y} \|^{2} - 2 \langle P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle + \| P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}) \|^{2} \\ & \overset{(*)}{\leq} \| \mathbf{x} - \mathbf{y} \|^{2} - 2 \| P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}) \|^{2} + \| P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}) \|^{2} \\ & = \| \mathbf{x} - \mathbf{y} \|^{2} - \| P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}) \|^{2} \\ & \leq \| \mathbf{x} - \mathbf{y} \|^{2}, \end{array}
$$

where the inequality (∗) follows by the firm nonexpansivity of the orthogonal projection operator (Theorem $5.4(a))$ ).

Example 5.6 (1-smoothness of $\begin{array}{r}{\frac{1}{2} | | \cdot | |^{2} - \frac{1}{2} d_{C}^{2})} \end{array}$ . Suppose that <sup>E</sup> is a Euclidean space, and let $C \subseteq \mathbb{E}$ be a nonempty closed convex set. Consider the function $\begin{array}{r}{\psi_{C}(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|^{2} - \frac{1}{2} d_{C}^{2}(\mathbf{x})} \end{array}$ . By Example 2.17, ψ<sub>C</sub> is convex.<sup>23</sup> We will now show that it is 1-smooth. By Example 3.31, $\textstyle{\frac{1}{2}} d_{C}^{2}(\mathbf{x})$ is diferentiable over $\mathbb{E},$ and its gradient is given by ${\bf x} - P_{C}({\bf x})$ . Therefore,

$$
\nabla \psi_{C}(\mathbf{x}) = \mathbf{x} -(\mathbf{x} - P_{C}(\mathbf{x})) = P_{C}(\mathbf{x}).
$$

The 1-smoothness of $\psi_{C}$ now follows by the nonexpansivity of the projection operator (Theorem 5.4(b))—for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ 2

$$
\| \nabla \psi_{C}(\mathbf{x}) - \nabla \psi_{C}(\mathbf{y}) \| = \| P_{C}(\mathbf{x}) - P_{C}(\mathbf{y}) \| \leq \| \mathbf{x} - \mathbf{y} \|.
$$

## 5.1.1 The Descent Lemma

An extremely useful result on L-smooth functions is the descent lemma, which states that they can be upper bounded by a certain quadratic function.

Lemma 5.7 (descent lemma). Let $f : \mathbb{E} \to(- \infty, \infty]$ be an L-smooth function $(L \geq 0)$ over a given convex set $D$ . Then for any $\mathbf{x}, \mathbf{y} \in D$ 2

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \frac{L}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{5.3}
$$

Proof. By the fundamental theorem of calculus,

$$
f(\mathbf{y}) - f(\mathbf{x}) = \int_{0}^{1} \langle \nabla f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})), \mathbf{y} - \mathbf{x} \rangle dt.
$$

Therefore,

$$
f(\mathbf{y}) - f(\mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \int_{0}^{1} \langle \nabla f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) - \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle dt.
$$

Thus,

$$
\begin{array}{l} | f(\mathbf{y}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle | = \left| \int_{0}^{1} \langle \nabla f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) - \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle dt \right| \\ \leq \int_{0}^{1} | \langle \nabla f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) - \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle | dt \\ \stackrel{{(*)}}{{\leq}} \int_{0}^{1} \| \nabla f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) - \nabla f(\mathbf{x}) \|_{*} \cdot \| \mathbf{y} - \mathbf{x} \| dt \\ \leq \int_{0}^{1} tL \| \mathbf{y} - \mathbf{x} \|^{2} dt \\ = \frac{L}{2} \| \mathbf{y} - \mathbf{x} \|^{2}, \end{array}
$$

where in (∗) we used the generalized Cauchy–Schwarz inequality (Lemma 1.4).

## 5.1.2 Characterizations of L-Smooth Functions

When f is convex, the next result gives several different and equivalent characterizations of the L-smoothness property of $f$ over the entire space. Note that property (5.3) from the descent lemma is one of the mentioned equivalent properties.

Theorem 5.8 (characterizations of L-smoothness). Let $f : \mathbb{E} \mathbb{R}$ be a convex function, diferentiable over $\mathbb{E}$ , and let $L > 0$ . Then the following claims are equivalent:

(i) f is L-smooth.

(ii) $\begin{array}{r}{f(\mathbf{y}) \leq f(\mathbf{x}) + \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \frac{L}{2} \| \mathbf{x} - \mathbf{y} \|^{2}} \end{array}$ for all x, $\mathbf{y} \in \mathbb{E}$

(iii) $\begin{array}{r}{f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \frac{1}{2L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2} for ~ all ~ \mathbf{x}, \mathbf{y} \in \mathbb{E}.} \end{array}$

(iv) $\begin{array}{r}{\langle \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle \geq \frac{1}{L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2} ~ for ~ all ~ \mathbf{x}, \mathbf{y} \in \mathbb{E}.} \end{array}$

(v) $f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \geq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) -{\frac{L}{2}} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}$ for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ and $\lambda \in[0, 1]$

Proof. $(i) \Rightarrow(\mathrm{ii})$ . The fact that (i) implies (ii) is just the descent lemma (Lemma 5.7).

$(\mathrm{ii}) \Rightarrow(\mathrm{iii})$ . Suppose that (ii) is satisfied. We can assume that $\nabla f(\mathbf{x}) \neq \nabla f(\mathbf{y})$ since otherwise the inequality (iii) is trivial by the convexity of $f.$ . For a fixed $\mathbf{x} \in \mathbb{E}$ consider the function

$$
g_{\mathbf{x}}(\mathbf{y}) = f(\mathbf{y}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle, \quad \mathbf{y} \in \mathbb{E}.
$$

The function $g_{\mathbf{x}}$ also satisfies property (ii). Indeed, for any $\mathbf{y}, \mathbf{z} \in \mathbb{E},$

$$
\begin{array}{l} g_{\mathbf{x}}(\mathbf{z}) = f(\mathbf{z}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{z} - \mathbf{x} \rangle \\ \leq f(\mathbf{y}) + \langle \nabla f(\mathbf{y}), \mathbf{z} - \mathbf{y} \rangle + \frac{L}{2} \| \mathbf{z} - \mathbf{y} \|^{2} - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{z} - \mathbf{x} \rangle \\ = f(\mathbf{y}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \langle \nabla f(\mathbf{y}) - \nabla f(\mathbf{x}), \mathbf{z} - \mathbf{y} \rangle + \frac{L}{2} \| \mathbf{z} - \mathbf{y} \|^{2} \\ = g_{\mathbf{x}}(\mathbf{y}) + \langle \nabla g_{\mathbf{x}}(\mathbf{y}), \mathbf{z} - \mathbf{y} \rangle + \frac{L}{2} \| \mathbf{z} - \mathbf{y} \|^{2}, \end{array} \tag{5.}\tag{5.4}
$$

where we used in the last equality the fact that $\nabla g_{\mathbf{x}}(\mathbf{y}) = \nabla f(\mathbf{y}) - \nabla f(\mathbf{x})$ for any $\mathbf{y} \in \mathbb{E}$ . In particular, $\nabla g_{\mathbf{x}}(\mathbf{x}) = \mathbf{0}$ , which by the convexity of $g_{\mathbf{x}}$ implies that x is a global minimizer of $g$ , meaning that

$$
g_{\mathbf{x}}(\mathbf{x}) \leq g_{\mathbf{x}}(\mathbf{z}) \text{for all} \mathbf{z} \in \mathbb{E}.\tag{5.5}
$$

Let $\textbf{y} \in \ \mathbb{E}$ , and let ${\textbf{v}} \in \ \mathbb{E}$ be a vector satisfying $\| \mathbf{v} \| = 1$ and $\left.\nabla g_{\mathbf{x}}(\mathbf{y}), \mathbf{v} \right.=$ $\| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*}$ . Substituting

$$
\mathbf{z} = \mathbf{y} - \frac{\| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*}}{L} \mathbf{v}\tag{5.6}
$$

into (5.5) yields

$$
0 = g_{\mathbf{x}}(\mathbf{x}) \leq g_{\mathbf{x}} \left(\mathbf{y} - \frac{\| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*} \mathbf{v}}{L} \mathbf{v}\right).
$$

Combining the last inequality with (5.4) (using the specific choice of z given in (5.6)), we obtain

$$
\begin{array}{rl} & 0 = g_{\mathbf{x}}(\mathbf{x}) \\ & \leq g_{\mathbf{x}}(\mathbf{y}) - \frac{\| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*}}{L} \langle \nabla g_{\mathbf{x}}(\mathbf{y}), \mathbf{v} \rangle + \frac{1}{2L} \| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*}^{2} \cdot \| \mathbf{v} \|^{2} \\ & = g_{\mathbf{x}}(\mathbf{y}) - \frac{1}{2L} \| \nabla g_{\mathbf{x}}(\mathbf{y}) \|_{*}^{2} \\ & = f(\mathbf{y}) - f(\mathbf{x}) - \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle - \frac{1}{2L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2}, \end{array}
$$

which is claim (iii).

(iii) ⇒ (iv). Writing the inequality (iii) for the two pairs $(\mathbf{x}, \mathbf{y}),(\mathbf{y}, \mathbf{x})$ yields

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle + \frac{1}{2L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2},
$$

$$
f(\mathbf{x}) \geq f(\mathbf{y}) + \langle \nabla f(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle + \frac{1}{2L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2}.
$$

Adding the two inequalities and rearranging terms results in (iv).

$\mathrm{(iv) \Rightarrow(i)}$ . The Lipschitz condition

$$
\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*} \leq L \| \mathbf{x} - \mathbf{y} \|
$$

is trivial when $\nabla f(\mathbf{x}) = \nabla f(\mathbf{y})$ . We will therefore assume that $\nabla f(\mathbf{x}) \neq \nabla f(\mathbf{y})$ By (iv) and the generalized Cauchy–Schwarz inequality (Lemma 1.4) we have for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ 2

$$
\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*} \cdot \| \mathbf{x} - \mathbf{y} \| \geq \langle \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle \geq \frac{1}{L} \| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|_{*}^{2}.
$$

Dividing by $\| \nabla f(\mathbf{x}) - \nabla f(\mathbf{y}) \|$ and multiplying by $L,(i)$ is obtained.

We have just shown the equivalence between (i), (ii), (iii), and (iv). To prove that (v) is also equivalent to each of these four claims, we will establish the equivalence $(\operatorname{ii}) \Leftrightarrow(\operatorname{v})$

$(\mathrm{ii}) \Rightarrow(v)$ . Let $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ and $\lambda \in[0, 1]$ . Denote $\mathbf{x}_{\lambda} = \lambda \mathbf{x} +(1 - \lambda) \mathbf{y}$ . Then by (ii),

$$
f(\mathbf{x}) \leq f(\mathbf{x}_{\lambda}) + \langle \nabla f(\mathbf{x}_{\lambda}), \mathbf{x} - \mathbf{x}_{\lambda} \rangle + \frac{L}{2} \| \mathbf{x} - \mathbf{x}_{\lambda} \|^{2},
$$

$$
f(\mathbf{y}) \leq f(\mathbf{x}_{\lambda}) + \langle \nabla f(\mathbf{x}_{\lambda}), \mathbf{y} - \mathbf{x}_{\lambda} \rangle + \frac{L}{2} \| \mathbf{y} - \mathbf{x}_{\lambda} \|^{2},
$$

which is the same as

$$
f(\mathbf{x}) \leq f(\mathbf{x}_{\lambda}) +(1 - \lambda) \langle \nabla f(\mathbf{x}_{\lambda}), \mathbf{x} - \mathbf{y} \rangle + \frac{L(1 - \lambda)^{2}}{2} \| \mathbf{x} - \mathbf{y} \|^{2}
$$

$$
f(\mathbf{y}) \leq f(\mathbf{x}_{\lambda}) + \lambda \langle \nabla f(\mathbf{x}_{\lambda}), \mathbf{y} - \mathbf{x} \rangle + \frac{L \lambda^{2}}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

Multiplying the first inequality by λ and the second by $1 - \lambda$ and adding them yields the inequality (iv).

${\bf{\Psi}}({\bf{v}}) \Rightarrow(\mathrm{{ii}})$ . Rearranging terms in the inequality (v), we obtain that it is equivalent to

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + \frac{f(\mathbf{x} +(1 - \lambda)(\mathbf{y} - \mathbf{x})) - f(\mathbf{x})}{1 - \lambda} + \frac{L}{2} \lambda \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

Taking $\lambda \to 1^{-}$ , the last inequality becomes

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + f^{\prime}(\mathbf{x}; \mathbf{y} - \mathbf{x}) + \frac{L}{2} \| \mathbf{x} - \mathbf{y} \|^{2},
$$

which, by the fact that $f^{\prime}(\mathbf{x}; \mathbf{y} - \mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle$ (see Theorem 3.29), implies (ii).

Remark 5.9 (necessity of convexity in Theorem 5.8). The convexity assumption in Theorem 5.8 is essential. Consider, for example, the function $f : \mathbb { R } ^ { n } $ R given by $\begin{array}{r}{f(\mathbf{x}) = - \frac{1}{2} \| \mathbf{x} \|_{2}^{2}} \end{array}$ , which is 1-smooth w.r.t. the l<sub>2</sub>-norm but is not L-smooth for $L < 1$ (see Example 5.2). However, $f$ is concave, and hence

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + \langle \nabla f(\mathbf{x}), \mathbf{y} - \mathbf{x} \rangle,
$$

which implies that property (ii) of Theorem 5.8 is satisfied with $L = 0$ , although the function is obviously not 0-smooth.

The next example will require the linear approximation theorem, which we now recall.

Theorem 5.10 (linear approximation theorem, [10, Theorem 1.24], [101, Fact 3.3.10]). Let $f : U \to \mathbb{R}$ be a twice continuously diferentiable function<sup>24</sup> over an open set $U \subseteq \mathbb{R}^{n}$ , and let $\mathbf{x} \in U, r > 0$ satisfy $B(\mathbf{x}, r) \subseteq U$ . Then for any $\mathbf{y} \in B(\mathbf{x}, r)$ there exists $\pmb{\xi} \in[\mathbf{x}, \mathbf{y}]$ such that

$$
f(\mathbf{y}) = f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y} - \mathbf{x}) + \frac{1}{2}(\mathbf{y} - \mathbf{x})^{T} \nabla^{2} f(\boldsymbol{\xi})(\mathbf{y} - \mathbf{x}).
$$

Example 5.11 $\left(\left(p \textrm{--} \mathbf{1} \right) \right.$ -smoothness of the half-squared ${l}_{p}.$ -norm function) $\cdot^{25}$ Consider the convex function $f : \mathbb{R}^{n} \mathbb{R}$ given by

$$
f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|_{p}^{2} = \frac{1}{2} \left(\sum_{i = 1}^{n} | x_{i} |^{p}\right)^{\frac{2}{p}},
$$

where $p \in[2, \infty)$ . We assume that $\mathbb{R}^{n}$ is endowed with the $l_{p}{\mathrm{- norm}}$ and show that $f$ is $(p - 1)$ )-smooth w.r.t. the $l_{p}{\mathrm{- norm}}$ . The result was already established for the case $p = 2$ in Example 5.2, and we will henceforth assume that $p > 2$ . We begin by computing the partial derivatives:

$$
\frac{\partial f}{\partial x_{i}}(\mathbf{x}) = \left\{\begin{array}{ll} \operatorname{sgn}(x_{i}) \frac{| x_{i} |^{p - 1}}{\| \mathbf{x} \|_{p}^{p - 2}}, & \mathbf{x} \neq \mathbf{0}, \\ 0, & \mathbf{x} = \mathbf{0}, \end{array} \right.
$$

The partial derivatives are continuous over $\mathbb{R}^{n}$ , and hence $f$ is diferentiable over $\mathbb{R}^{n}$ (in the sense of Definition 3.28).<sup>26</sup> The second-order partial derivatives exist for any $\mathbf{x} \neq \mathbf{0}$ and are given by

$$
\frac{\partial^{2} f}{\partial x_{i} \partial x_{j}}(\mathbf{x}) = \left\{\begin{array}{ll}(2 - p) \mathrm{sgn}(x_{i}) \mathrm{sgn}(x_{j}) \frac{| x_{i} |^{p - 1} | x_{j} |^{p - 1}}{\| \mathbf{x} \|_{p}^{2p - 2}}, & i \neq j, \\(p - 1) \frac{| x_{i} |^{p - 2}}{\| \mathbf{x} \|_{p}^{p - 2}} +(2 - p) \frac{| x_{i} |^{2p - 2}}{\| \mathbf{x} \|_{p}^{2p - 2}}, & i = j.\end{array} \right.
$$

It is easy to see that the second-order partial derivatives are continuous for any $\mathbf{x} \neq \mathbf{0}$ . We will show that property (ii) of Theorem 5.8 is satisfied with $L = p - 1$ Let $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{n}$ be such that $\mathbf{0} \not \in[\mathbf{x}, \mathbf{y}]$ . Then by the linear approximation theorem (Theorem 5.10)—taking U to be some open set containing $\left[\mathbf{x}, \mathbf{y} \right]$ but not containing 0—there exists $\pmb{\xi} \in[\mathbf{x}, \mathbf{y}]$ for which

$$
f(\mathbf{y}) = f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y} - \mathbf{x}) + \frac{1}{2}(\mathbf{y} - \mathbf{x})^{T} \nabla^{2} f(\boldsymbol{\xi})(\mathbf{y} - \mathbf{x}).\tag{5.7}
$$

We will show that $\mathbf{d}^{T} \nabla^{2} f(\boldsymbol{\xi}) \mathbf{d} \mathbf{\xi} \leq(p - 1) \| \mathbf{d} \|_{p}^{2}$ for any d $\in \mathbb{R}^{n}$ . Since $\nabla^{2} f(t \pmb{\xi}) =$ $\nabla^{2} f(\pmb{\xi})$ for any $t \in \mathbb{R}$ , we can assume without loss of generality that $\| \pmb{\xi} \|_{p} = 1$ Now, for any d $\in \mathbb{R}^{n}$

$$
\begin{array}{l} \mathbf{d}^{T} \nabla^{2} f(\boldsymbol{\xi}) \mathbf{d} =(2 - p) \| \boldsymbol{\xi} \|_{p}^{2 - 2p} \left(\sum_{i = 1}^{n} | \xi_{i} |^{p - 1} \mathrm{sgn}(\xi_{i}) d_{i}\right)^{2} +(p - 1) \| \boldsymbol{\xi} \|_{p}^{2 - p} \sum_{i = 1}^{n} | \xi_{i} |^{p - 2} d_{i}^{2} \\ \leq(p - 1) \| \boldsymbol{\xi} \|_{p}^{2 - p} \sum_{i = 1}^{n} | \xi_{i} |^{p - 2} d_{i}^{2}, \end{array} \tag{5.8}
$$

where the last inequality follows by the fact that $p > 2$ . Using the generalized Cauchy–Schwarz inequality (Lemma 1.4) with $\begin{array}{r}{\| \cdot \| = \| \cdot \|_{\frac{p}{p - 2}}} \end{array}$ , we have

$$
\begin{array}{rl} &{\sum_{i = 1}^{n} | \xi_{i} |^{p - 2} d_{i}^{2} \leq \left(\sum_{i = 1}^{n}(| \xi_{i} |^{p - 2})^{\frac{p}{p - 2}}\right)^{\frac{p - 2}{p}} \left(\sum_{i = 1}^{n}(d_{i}^{2})^{\frac{p}{2}}\right)^{\frac{2}{p}}} \\ &{\qquad = \left(\sum_{i = 1}^{n} | \xi_{i} |^{p}\right)^{\frac{p - 2}{p}} \left(\sum_{i = 1}^{n} | d_{i} |^{p}\right)^{\frac{2}{p}}} \\ &{\qquad = \| \mathbf{d} \|_{p}^{2}.} \end{array}\tag{5.9}
$$

Combining (5.8) and (5.9), we obtain that for any $\mathbf{d} \in \mathbb{R}^{n}$ ，

$$
\mathbf{d}^{T} \nabla^{2} f(\boldsymbol{\xi}) \mathbf{d} \leq(p - 1) \| \mathbf{d} \|_{p}^{2},
$$

and specifically, for $\mathbf{d} = \mathbf{x} - \mathbf{y}$ 7

$$
(\mathbf{y} - \mathbf{x})^{T} \nabla^{2} f(\boldsymbol{\xi})(\mathbf{y} - \mathbf{x}) \leq(p - 1) \| \mathbf{x} - \mathbf{y} \|_{p}^{2}.
$$

Plugging the above inequality into (5.7) implies the inequality

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y} - \mathbf{x}) + \frac{p - 1}{2} \| \mathbf{x} - \mathbf{y} \|_{p}^{2}.
$$

(5.10)

The inequality (5.10) was proven for any x, $\mathbf{y} \in \mathbb{R}^{n}$ that satisfy $\mathbf{0} \not \in[\mathbf{x}, \mathbf{y}]$ . We can show that it holds for any $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{n}$ using a continuity argument. Indeed, assume that $\mathbf{0} \in[\mathbf{x}, \mathbf{y}]$ . Then we can find a sequence $\{\mathbf{y}_{k}\}_{k \ge 0}$ converging to $\mathbf{y}$ for which 0 $\notin[\mathbf{x}, \mathbf{y}_{k}]$ . Thus, by what was already proven, for any $k \geq 0$

$$
f(\mathbf{y}_{k}) \leq f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y}_{k} - \mathbf{x}) + \frac{p - 1}{2} \| \mathbf{x} - \mathbf{y}_{k} \|_{p}^{2}.
$$

Taking $k \infty$ in the last inequality and using the continuity of $f,$ , we obtain that (5.10) holds. To conclude, we established that (5.10) holds for any $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{n}$ , and thus by Theorem 5.8 (equivalence between properties (i) and (ii)) and the convexity of $f,$ it follows that $f$ is $(p - 1)$ -smooth w.r.t. the $l_{p}{\mathrm{- norm}}$

## 5.1.3 Second-Order Characterization

We will now consider the space $\mathbb{E} = \mathbb{R}^{n}$ endowed with the $l_{p}{\mathrm{- norm ~}}(p \geq 1)$ . For twice continuously diferentiable functions, it is possible to fully characterize the property of L-smoothness via the norm of the Hessian matrix.

Theorem 5.12 (L-smoothness and boundedness of the Hessian). Let $f$ : $\mathbb{R}^{n} \to \mathbb{R}$ be a twice continuously diferentiable function over $\mathbb{R}^{n}$ . Then for a given $L \geq 0$ , the following two claims are equivalent:

(i) f is L-smooth w.r.t. the l<sub>p</sub>-norm $(p \in[1, \infty])$

(ii) $\| \nabla^{2} f(\mathbf{x}) \|_{p, q} \leq L$ for any $\mathbf{x} \in \mathbb{R}^{n}$ , where $q \in[1, \infty]$ satisfies $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$

Proof. $\mathrm{(ii)} \Rightarrow \mathrm{(i)}$ . Suppose that $\| \nabla^{2} f(\mathbf{x}) \|_{p, q} \leq L$ for any $\mathbf{x} \in \mathbb{R}^{n}$ . Then by the fundamental theorem of calculus, for all $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{n}$

$$
\begin{array}{l} \nabla f(\mathbf{y}) = \nabla f(\mathbf{x}) + \int_{0}^{1} \nabla^{2} f(\mathbf{x} + t(\mathbf{y} - \mathbf{x}))(\mathbf{y} - \mathbf{x}) dt \\ \qquad = \nabla f(\mathbf{x}) + \left(\int_{0}^{1} \nabla^{2} f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) dt\right) \cdot(\mathbf{y} - \mathbf{x}).\end{array}
$$

Then

$$
\begin{array}{l} \| \nabla f(\mathbf{y}) - \nabla f(\mathbf{x}) \|_{q} = \left\| \left(\int_{0}^{1} \nabla^{2} f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) dt\right) \cdot(\mathbf{y} - \mathbf{x}) \right\|_{q} \\ \leq \left\| \int_{0}^{1} \nabla^{2} f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) dt \right\|_{p, q} \| \mathbf{y} - \mathbf{x} \|_{p} \\ \leq \left(\int_{0}^{1} \| \nabla^{2} f(\mathbf{x} + t(\mathbf{y} - \mathbf{x})) \|_{p, q} dt\right) \| \mathbf{y} - \mathbf{x} \|_{p} \\ \leq L \| \mathbf{y} - \mathbf{x} \|_{p}, \end{array}
$$

establishing (i).

$(i) \Rightarrow(\mathrm{ii})$ . Suppose now that $f$ is L-smooth w.r.t. the $l_{p}{\mathrm{- norm}}$ . Then by the fundamental theorem of calculus, for any d $\in \mathbb{R}^{n}$ and $\alpha > 0$ 2

$$
\nabla f(\mathbf{x} + \alpha \mathbf{d}) - \nabla f(\mathbf{x}) = \int_{0}^{\alpha} \nabla^{2} f(\mathbf{x} + t \mathbf{d}) \mathbf{d} dt.
$$

Thus,

$$
\left\| \left(\int_{0}^{\alpha} \nabla^{2} f(\mathbf{x} + t \mathbf{d}) dt\right) \mathbf{d} \right\|_{q} = \| \nabla f(\mathbf{x} + \alpha \mathbf{d}) - \nabla f(\mathbf{x}) \|_{q} \leq \alpha L \| \mathbf{d} \|_{p}.
$$

Dividing by α and taking the limit $\alpha \to 0^{+}$ , we obtain

$$
\left\| \nabla^{2} f(\mathbf{x}) \mathbf{d} \right\|_{q} \leq L \| \mathbf{d} \|_{p} \text{for any} \mathbf{d} \in \mathbb{R}^{n},
$$

implying that $\| \nabla^{2} f(\mathbf{x}) \|_{p, q} \leq L$

A direct consequence is that for twice continuously diferentiable convex functions, L-smoothness w.r.t. the $l_{2}{\mathrm{- norm}}$ is equivalent to the property that the maximum eigenvalue of the Hessian matrix is smaller than or equal to L.

Corollary 5.13. Let $f : \mathbb{R}^{n} \mathbb{R}$ be a twice continuously diferentiable convex function over <sup>Rn</sup>. Then f is L-smooth w.r.t. the $l_{2}{-} norm$ if and only if $\lambda_{\operatorname{max}}(\nabla^{2} f(\mathbf{x})) \leq$ L for any $\mathbf{x} \in \mathbb{R}^{n}$

Proof. Since f is convex, it follows that $\nabla^{2} f(\mathbf{x}) \succeq \mathbf{0}$ for any $\mathbf{x} \in \mathbb{R}^{n}$ . Therefore, in this case,

$$
\| \nabla^{2} f(\mathbf{x}) \|_{2, 2} = \sqrt{\lambda_{\max}((\nabla^{2} f(\mathbf{x}))^{2})} = \lambda_{\max}(\nabla^{2} f(\mathbf{x})),
$$

which, combined with Theorem 5.12, establishes the desired result.

Example 5.14 (1-smoothness of $\sqrt{{\bf 1} +{\bf \|} \cdot{\bf \|}_{2}^{2}}$ w.r.t. the $l_{2}{\bf - norm})$ . Let $f$ : $\mathbb{R}^{n} \to \mathbb{R}$ be the convex function given by

$$
f(\mathbf{x}) = \sqrt{1 + \| \mathbf{x} \|_{2}^{2}}.
$$

We will show that $f$ is 1-smooth w.r.t. the $l_{2}{\mathrm{- norm}}$ . For any $\mathbf{x} \in \mathbb{R}^{n}$ ，

$$
\nabla f(\mathbf{x}) = \frac{\mathbf{x}}{\sqrt{\| \mathbf{x} \|_{2}^{2} + 1}}
$$

and

$$
\nabla^{2} f(\mathbf{x}) = \frac{1}{\sqrt{\| \mathbf{x} \|_{2}^{2} + 1}} \mathbf{I} - \frac{\mathbf{xx}^{T}}{(\| \mathbf{x} \|_{2}^{2} + 1)^{3 / 2}} \preceq \frac{1}{\sqrt{\| \mathbf{x} \|_{2}^{2} + 1}} \mathbf{I} \preceq \mathbf{I}.
$$

Therefore, $\lambda_{\operatorname{max}}(\nabla^{2} f(\mathbf{x})) \leq 1$ for all $\mathbf{x} \in \mathbb{R}^{n}$ , and hence by Corollary 5.13 it follows that f is 1-smooth w.r.t. the $l_{2}{\mathrm{- norm}}$ ■

Example 5.15 (1-smoothness of the log-sum-exp function w.r.t. the ${\mathbf{}} l_{2},{\mathbf{}} l_{\infty}$ norms). Consider the log-sum-exp function $f : \mathbb{R}^{n} \mathbb{R}$ given by

$$
f(\mathbf{x}) = \log \left(e^{x_{1}} + e^{x_{2}} + \dots + e^{x_{n}}\right).
$$

We will first show that it is 1-smooth w.r.t. the $l_{2} \mathrm{- norm}$ . The partial derivatives of $f$ are

$$
\frac{\partial f}{\partial x_{i}}(\mathbf{x}) = \frac{e^{x_{i}}}{\sum_{k = 1}^{n} e^{x_{k}}}, i = 1, 2, \ldots, n,
$$

and the second-order partial derivatives are

$$
\frac{\partial^{2} f}{\partial x_{i} \partial x_{j}}(\mathbf{x}) = \left\{\begin{array}{ll} - \frac{e^{x_{i}} e^{x_{j}}}{(\sum_{k = 1}^{n} e^{x_{k}})^{2}}, & i \neq j, \\ - \frac{e^{x_{i}} e^{x_{i}}}{(\sum_{k = 1}^{n} e^{x_{k}})^{2}} + \frac{e^{x_{i}}}{\sum_{k = 1}^{n} e^{x_{k}}}, & i = j.\end{array} \right.
$$

We can thus write the Hessian matrix as

$$
\nabla^{2} f(\mathbf{x}) = \operatorname{diag}(\mathbf{w}) - \mathbf{ww}^{T},
$$

where $\begin{array}{r}{w_{i} = \frac{e^{x_{i}}}{\sum_{k = 1}^{n} e^{x_{k}}}} \end{array}$ . To show that f is 1-smooth w.r.t. the $l_{2}{\mathrm{- norm}}$ , note that for any $\mathbf{x} \in \mathbb{R}^{n}$

$$
\nabla^{2} f(\mathbf{x}) = \operatorname{diag}(\mathbf{w}) - \mathbf{ww}^{T} \preceq \operatorname{diag}(\mathbf{w}) \preceq \mathbf{I},
$$

and hence $\lambda_{\operatorname{max}}(\nabla^{2} f(\mathbf{x})) \leq 1$ for any $\mathbf{x} \in \mathbb{R}^{n}$ . Noting that the log-sum-exp function is convex, we can invoke Corollary 5.13 and conclude that f is 1-smooth w.r.t. the $l_{2}{\mathrm{- norm}}$

We will show that f is 1-smooth also w.r.t. the $l_{\infty} \mathrm{- norm}$ . For that, we begin by proving that for any $\mathbf{d} \in \mathbb{R}^{n}$ ，

$$
\mathbf{d}^{T} \nabla^{2} f(\mathbf{x}) \mathbf{d} \leq \| \mathbf{d} \|_{\infty}^{2}.\tag{5.11}
$$

Indeed,

$$
\begin{array}{l} \mathbf{d}^{T} \nabla^{2} f(\mathbf{x}) \mathbf{d} = \mathbf{d}^{T}(\operatorname{diag}(\mathbf{w}) - \mathbf{ww}^{T}) \mathbf{d} = \mathbf{d}^{T} \operatorname{diag}(\mathbf{w}) \mathbf{d} -(\mathbf{w}^{T} \mathbf{d})^{2} \\ \qquad \leq \mathbf{d}^{T} \operatorname{diag}(\mathbf{w}) \mathbf{d} \\ \qquad = \sum_{i = 1}^{n} w_{i} d_{i}^{2} \\ \qquad \leq \| \mathbf{d} \|_{\infty}^{2} \sum_{i = 1}^{n} w_{i} \\ \qquad = \| \mathbf{d} \|_{\infty}^{2}.\end{array}
$$

Now, since $f$ is twice continuously diferentiable over $\mathbb{R}^{n}$ , it follows by the linear approximation theorem (Theorem 5.10) that for any $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{n}$ there exists $\pmb{\xi} \in[\mathbf{x}, \mathbf{y}]$ for which

$$
f(\mathbf{y}) = f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y} - \mathbf{x}) + \frac{1}{2}(\mathbf{y} - \mathbf{x})^{T} \nabla^{2} f(\boldsymbol{\xi})(\mathbf{y} - \mathbf{x}).\tag{5.12}
$$

Combining (5.12) (taking $\mathbf{d} = \mathbf{y} - \mathbf{x})$ and (5.11), we obtain the inequality

$$
f(\mathbf{y}) \leq f(\mathbf{x}) + \nabla f(\mathbf{x})^{T}(\mathbf{y} - \mathbf{x}) + \frac{1}{2} \| \mathbf{y} - \mathbf{x} \|_{\infty}^{2},
$$

which by Theorem 5.8 (equivalence between properties (i) and (ii)) implies the 1-smoothness of f w.r.t. the $l_{\infty} \mathrm{- norm}$ ■

## 5.1.4 Summary of Smoothness Parameter Computations

The table below summarizes the smoothness parameters of the functions discussed in this section. The last function will only be discussed later on in Example 6.62.

<table><tr><td> $f(\mathbf{x})$ </td><td>dom(f)</td><td>Parameter</td><td>Norm</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x}+\mathbf{b}^{T}\mathbf{x}+c$  $(\mathbf{A}\in\mathbb{S}^{n},\mathbf{b}\in\mathbb{R}^{n},c\in\mathbb{R})$ </td><td> $\mathbb{R}^{n}$ </td><td> $\| \mathbf{A}\|_{p,q}$ </td><td> $l_{p}$ </td><td>Example 5.2</td></tr><tr><td> $\langle\mathbf{b},\mathbf{x}\rangle+c$  $(\mathbf{b}\in\mathbb{E}^{*},c\in\mathbb{R})$ </td><td> $\mathbb{E}$ </td><td>0</td><td>any norm</td><td>Example 5.3</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_{p}^{2},\p\in[2,\infty)$ </td><td> $\mathbb{R}^{n}$ </td><td> $p-1$ </td><td> $l_{p}$ </td><td>Example 5.11</td></tr><tr><td> $\sqrt{1+\|\mathbf{x}\|_{2}^{2}}$ </td><td> $\mathbb{R}^{n}$ </td><td>1</td><td> $l_{2}$ </td><td>Example 5.14</td></tr><tr><td> $\log(\sum_{i=1}^{n}e^{x_{i}})$ </td><td> $\mathbb{R}^{n}$ </td><td>1</td><td> $l_{2},l_{\infty}$ </td><td>Example 5.15</td></tr><tr><td> $\frac{1}{2}d_{C}^{2}(\mathbf{x})$  $(\emptyset\neq C\subseteq\mathbb{E}\text{closed convex})$ </td><td> $\mathbb{E}$ </td><td>1</td><td>Euclidean</td><td>Example 5.5</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^{2}-\frac{1}{2}d_{C}^{2}(\mathbf{x})$  $(\emptyset\neq C\subseteq\mathbb{E}\text{closed convex})$ </td><td> $\mathbb{E}$ </td><td>1</td><td>Euclidean</td><td>Example 5.6</td></tr><tr><td> $H_{\mu}(\mathbf{x}) \(\mu >0)$ </td><td> $\mathbb{E}$ </td><td> $\frac{1}{\mu}$ </td><td>Euclidean</td><td>Example 6.62</td></tr></table>

## 5.2 Strong Convexity

Definition 5.16 (strong convexity). A function $f : \mathbb{E}(- \infty, \infty]$ is called σ-strongly convex for a given $\sigma > 0$ if dom(f) is convex and the following inequality holds for any x, $\mathbf{y} \in \operatorname{dom}(f)$ and $\lambda \in[0, 1]$

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{5.13}
$$

We will sometimes use the terminology “strongly convex with parameter $\sigma^{\mathfrak{N}}$ instead of “σ-strongly convex.” It is important to note that the strong convexity parameter σ depends on the underlying norm, and we will therefore sometimes refer to it as the “strong convexity parameter w.r.t. $\| \cdot \|.^{\mathfrak{s}}$ Obviously, strongly convex functions are necessarily also convex since their domain is assumed to be convex and inequality (5.13) implies that for any $\mathbf{x}, \mathbf{y} \in \operatorname{dom}(f)$ and $\lambda \in[0, 1]$ , Jensen’s inequality is satisfied:

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}).
$$

When the underlying set <sup>E</sup> is Euclidean, meaning that $\| \mathbf{x} \| ={\sqrt{\langle \mathbf{x}, \mathbf{x} \rangle}}$ for any $\mathbf{x} \in \mathbb{E}$ we can write a different and simple property that is equivalent to strong convexity.

Theorem 5.17. Let <sup>E</sup> be a Euclidean space. Then $f : \mathbb{E} \to(- \infty, \infty]$ is a σ-strongly convex function $(\sigma > 0)$ if and only if the function $f(\cdot) - \frac{\sigma}{2} \| \cdot \|^{2}$ is convex.

Proof. The function $\begin{array}{r}{g(\mathbf{x}) \equiv f(\mathbf{x}) - \frac{\sigma}{2} \| \mathbf{x} \|^{2}} \end{array}$ is convex if and only if its domain dom $(g) = \operatorname{dom}(f)$ is convex and for any $\mathbf{\bar{x}}, \mathbf{y} \in \operatorname{dom}(f)$ and $\lambda \in[0, 1]$

$$
g(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda g(\mathbf{x}) +(1 - \lambda) g(\mathbf{y}).
$$

The latter inequality is the same as

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) + \frac{\sigma}{2} \left[\| \lambda \mathbf{x} +(1 - \lambda) \mathbf{y} \|^{2} - \lambda \| \mathbf{x} \|^{2} -(1 - \lambda) \| \mathbf{y} \|^{2} \right].\tag{5.14}
$$

Now, using the identity (which holds since the norm is assumed to be Euclidean)

$$
\| \lambda \mathbf{x} +(1 - \lambda) \mathbf{y} \|^{2} - \lambda \| \mathbf{x} \|^{2} -(1 - \lambda) \| \mathbf{y} \|^{2} = - \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2},
$$

combined with (5.14), we can conclude that the convexity of $g$ is equivalent to the convexity of dom(f ) and the validity of the inequality

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}
$$

for any $\mathbf{x}, \mathbf{y} \in \operatorname{dom}(f)$ and $\lambda \in[0, 1]$ , namely, to the σ-strong convexity of $f.\quad \sqcup$

Remark 5.18. The assumption that the underlying space is Euclidean is essential in Theorem 5.17. As an example, consider the negative entropy function over the unit simplex

$$
f(\mathbf{x}) \equiv \left\{\begin{array}{ll} \sum_{i = 1}^{n} x_{i} \log x_{i}, & \mathbf{x} \in \Delta_{n}, \\ \infty & else.\end{array} \right.
$$

We will later show (in Example 5.27) that f is a 1-strongly convex function with respect to the $l_{1}{-} norm$ . Regardless of this fact, note that the function

$$
g(\mathbf{x}) = f(\mathbf{x}) - \alpha \| \mathbf{x} \|_{1}^{2}
$$

is convex for any $\alpha > 0$ since over the domain of f, we have that $\| \mathbf{x} \|_{1} = 1$ Obviously, it is impossible that a function will be α-strongly convex for any $\alpha > 0$ Therefore, the characterization of strong convexity in Theorem 5.17 is not correct for any norm.

Note that if a function f is $\sigma_{\mathrm{{1}^{- strongly}}}$ convex $\left(\sigma_{1} > 0 \right)$ , then it is necessarily also σ<sub>2</sub>-strongly convex for any $\sigma_{2} \in(0, \sigma_{1})$ . An interesting problem is to find the largest possible strong convexity parameter of a given function.

Example 5.19 (strong convexity of quadratic functions). Suppose that $\mathbb{E} =$ $\mathbb{R}^{n}$ is endowed with the $l_{2}{\mathrm{- norm}}$ , and consider the quadratic function $f : \mathbb { R } ^ { n } $ R given by

$$
f(\mathbf{x}) = \frac{1}{2} \mathbf{x}^{T} \mathbf{Ax} + \mathbf{b}^{T} \mathbf{x} + c,
$$

where $\mathbf{A} \in \mathbb{S}^{n}$ , b $\in \mathbb{R}^{n}$ , and $c \in \mathbb{R}$ . Then by Theorem 5.17, f is strongly convex with parameter $\sigma > 0$ if and only if the function ${\textstyle{\frac{1}{2}}} \mathbf{x}^{T} \left(\mathbf{A} - \sigma \mathbf{I} \right) \mathbf{x} + \mathbf{b}^{T} \mathbf{x} + c$ is convex, which is equivalent to the matrix inequality $\mathbf{A} \bar{-} \sigma \mathbf{I} \succeq \mathbf{0}$ , namely, to the inequality $\lambda_{\operatorname{min}}(\mathbf{A}) \geq \sigma$ . Thus, f is strongly convex if and only if A is positive definite, and in that case, $\lambda_{\mathrm{min}}(\mathbf{A})$ is its largest possible strong convexity parameter.

A simple result is that the sum of a strongly convex function and a convex function is always a strongly convex function.

Lemma 5.20. Let $f : \mathbb{E} \to(- \infty, \infty]$ be a σ-strongly convex function $(\sigma > 0)$ , and let $g : \mathbb{E}(- \infty, \infty]$ be convex. Then $f + g$ is σ-strongly convex.

Proof. Follows directly from the definitions of strong convexity and convexity. Since f and $g$ are convex, both $\operatorname{dom}(f)$ and dom(g) are convex sets, and hence also dom $(f + g) = \operatorname{dom}(f) \cap \operatorname{dom}(g)$ is a convex set. Let $\mathbf{x}, \mathbf{y} \in \operatorname{dom}(f) \cap \operatorname{dom}(g)$ and $\lambda \in[0, 1]$ . Then by the σ-strong convexity of $f,$ ,

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

Since g is convex,

$$
g(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda g(\mathbf{x}) +(1 - \lambda) g(\mathbf{y}).
$$

Adding the two inequalities, we obtain

$$
(f + g)(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda(f + g)(\mathbf{x}) +(1 - \lambda)(f + g)(\mathbf{y}) - \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2},
$$

showing that $f + g$ is σ-strongly convex.

Example 5.21 (strong convexity of $\frac{1}{2} \lVert \cdot \rVert^{2} + \delta_{C})$ . Suppose that <sup>E</sup> is a Euclidean space, and let $C \subseteq \mathbb{E}$ be a nonempty convex set. The function $\scriptstyle{\frac{1}{2}} \left\| \mathbf{x} \right\|^{2}$ is 1-strongly convex (Example 5.19), and by the convexity of $C, \delta_{C}$ is convex. Therefore, by Lemma 5.20, the function $\begin{array}{r}{\frac{1}{2} \| \mathbf{x} \|^{2} + \delta_{C}(\mathbf{x})} \end{array}$ is 1-strongly convex.

Theorem 5.24 below describes two properties that are equivalent to σ-strong convexity. The two properties are of a first-order nature in the sense that they are written in terms of the function and its subgradients. The proof uses the following version of the mean-value theorem for one-dimensional functions.

Lemma 5.22 (see $\left[{\bf 67, 9.26} \right])$ . Let $f : \mathbb{R} \to(- \infty, \infty]$ be a closed convex function, and let $[a, b] \subseteq \mathrm{dom}(f)(a < b)$ . Then

$$
f(b) - f(a) = \int_{a}^{b} h(t) dt,
$$

where $h :(a, b) \mathbb{R}$ satisfies $h(t) \in \partial f(t)$ for any $t \in(a, b)$

Another technical lemma that is being used in the proof is the so-called line segment principle.

Lemma 5.23 (line segment principle [108, Theorem 6.1]). Let C be a convex set. Suppose that $\mathbf{x} \in \operatorname{ri}(C), \mathbf{y} \in \operatorname{cl}(C)$ , and let $\lambda \in(0, 1]$ . Then $\lambda \mathbf{x} +(1 - \lambda) \mathbf{y} \in \mathrm{ri}(C)$

Theorem 5.24 (first-order characterizations of strong convexity). Let $f$ : $\mathbb{E} \to(- \infty, \infty]$ be a proper closed and convex function. Then for a given $\sigma > 0$ , the following three claims are equivalent:

(i) f is σ-strongly convex.

(ii)

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle + \frac{\sigma}{2} \| \mathbf{y} - \mathbf{x} \|^{2}
$$

for any $\mathbf{x} \in \mathrm{dom}(\partial f), \mathbf{y} \in \mathrm{dom}(f) \and \ \mathbf{g} \in \partial f(\mathbf{x})$

(iii)

$$
\left\langle \mathbf{g}_{\mathbf{x}} - \mathbf{g}_{\mathbf{y}}, \mathbf{x} - \mathbf{y} \right\rangle \geq \sigma \| \mathbf{x} - \mathbf{y} \|^{2}\tag{5.15}
$$

for any x, y ∈ dom(∂f), and $\mathbf{g_{x}} \in \partial f(\mathbf{x}), \mathbf{g_{y}} \in \partial f(\mathbf{y})$

Proof. $\mathrm{(ii)} \Rightarrow \mathrm{(i)}$ . Assume that (ii) is satisfied. To show (i), take $\mathbf{x}, \mathbf{y} \in \operatorname{dom}(f)$ and $\lambda \in \mathsf{\Gamma}(0, 1)$ . Take some $\mathbf{z} \in \operatorname{ri}(\operatorname{dom}(f))$ . Then for any $\alpha \in(0, 1]$ , by the line segment principle (Lemma 5.23), the vector $\tilde{\mathbf{x}} =(1 - \alpha) \mathbf{x} + \alpha \mathbf{z}$ is in $\operatorname{ri}(\operatorname{dom}(f))$ At this point we fix $\alpha.$ Using the notation ${\bf x}_{\lambda} = \lambda \tilde{\bf x} +(1 - \lambda){\bf y},$ , we obtain that $\mathbf{x}_{\lambda} \in \operatorname{ri}(\operatorname{dom}(f))$ for any $\lambda \in \mathsf{\Gamma}(0, 1)$ , and hence, by Theorem 3.18, $\partial f(\mathbf{x}_{\lambda}) \neq \varnothing$ , meaning that $\mathbf{x}_{\lambda} \in \mathrm{dom}(\partial f)$ . Take $\mathbf{g} \in \partial f(\mathbf{x}_{\lambda})$ . Then by (ii),

$$
f(\tilde{\mathbf{x}}) \geq f(\mathbf{x}_{\lambda}) + \langle \mathbf{g}, \tilde{\mathbf{x}} - \mathbf{x}_{\lambda} \rangle + \frac{\sigma}{2} \| \tilde{\mathbf{x}} - \mathbf{x}_{\lambda} \|^{2},
$$

which is the same as

$$
f(\tilde{\mathbf{x}}) \geq f(\mathbf{x}_{\lambda}) +(1 - \lambda) \langle \mathbf{g}, \tilde{\mathbf{x}} - \mathbf{y} \rangle + \frac{\sigma(1 - \lambda)^{2}}{2} \| \mathbf{y} - \tilde{\mathbf{x}} \|^{2}.\tag{5.16}
$$

Similarly,

$$
f(\mathbf{y}) \geq f(\mathbf{x}_{\lambda}) + \lambda \langle \mathbf{g}, \mathbf{y} - \tilde{\mathbf{x}} \rangle + \frac{\sigma \lambda^{2}}{2} \| \mathbf{y} - \tilde{\mathbf{x}} \|^{2}.\tag{5.17}
$$

Multiplying (5.16) by λ and (5.17) by $1 - \lambda$ and adding the two resulting inequalities, we obtain that

$$
f(\lambda \tilde{\mathbf{x}} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\tilde{\mathbf{x}}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma \lambda(1 - \lambda)}{2} \| \tilde{\mathbf{x}} - \mathbf{y} \|^{2}.
$$

Plugging the expression for $\tilde{\mathbf{x}}$ in the above inequality, we obtain that

$$
g_{1}(\alpha) \leq \lambda g_{2}(\alpha) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma \lambda(1 - \lambda)}{2} \|(1 - \alpha) \mathbf{x} + \alpha \mathbf{z} - \mathbf{y} \|^{2},\tag{5.18}
$$

where $g_{1}(\alpha) \equiv f(\lambda(1 - \alpha) \mathbf{x} +(1 - \lambda) \mathbf{y} + \lambda \alpha \mathbf{z})$ and $g_{2}(\alpha) \equiv f((1 - \alpha) \mathbf{x} + \alpha \mathbf{z})$ . The functions $g_{1}$ and $g_{2}$ are one-dimensional proper closed and convex functions, and consequently, by Theorem 2.22, they are also continuous over their domain. Thus, taking $\alpha \to 0^{+}$ in (5.18), it follows that

$$
g_{1}(0) \leq \lambda g_{2}(0) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma \lambda(1 - \lambda)}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

Finally, since $g_{1}(0) = f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y})$ and $g_{2}(0) = f(\mathbf{x})$ , we obtain the inequality

$$
f(\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma \lambda(1 - \lambda)}{2} \| \mathbf{x} - \mathbf{y} \|^{2},
$$

establishing the σ-strong convexity of $f.$

$(i) \ \Rightarrow \ \mathrm{(iii)}$ . Assume that (i) is satisfied. Let $\mathbf{x}, \mathbf{y} \in \mathsf{dom}(\partial f)$ and $\mathbf{g}_{\mathbf{x}} \in$ $\partial f(\mathbf{x}), \mathbf{g}_{\mathbf{y}} \in \partial f(\mathbf{y})$ . We will show that inequality (5.15) is satisfied. Let $\lambda \in[0, 1)$ and denote $\mathbf{x}_{\lambda} = \lambda \mathbf{x} +(1 - \lambda) \mathbf{y}$ . By condition (i),

$$
f(\mathbf{x}_{\lambda}) \leq \lambda f(\mathbf{x}) +(1 - \lambda) f(\mathbf{y}) - \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2},
$$

which is the same as

$$
\frac{f(\mathbf{x}_{\lambda}) - f(\mathbf{x})}{1 - \lambda} \leq f(\mathbf{y}) - f(\mathbf{x}) - \frac{\sigma}{2} \lambda \| \mathbf{x} - \mathbf{y} \|^{2},\tag{5.19}
$$

Since $\mathbf{g}_{\mathbf{x}} \in \partial f(\mathbf{x})$

$$
\frac{f(\mathbf{x}_{\lambda}) - f(\mathbf{x})}{1 - \lambda} \geq \frac{\langle \mathbf{g}_{\mathbf{x}}, \mathbf{x}_{\lambda} - \mathbf{x} \rangle}{1 - \lambda} = \langle \mathbf{g}_{\mathbf{x}}, \mathbf{y} - \mathbf{x} \rangle,
$$

which, combined with (5.19), yields the inequality

$$
\langle \mathbf{g}_{\mathbf{x}}, \mathbf{y} - \mathbf{x} \rangle \leq f(\mathbf{y}) - f(\mathbf{x}) - \frac{\sigma \lambda}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{5.20}
$$

Inequality (5.20) holds for any $\lambda \in[0, 1)$ . Taking the limit $\lambda 1^{-}$ , we conclude that

$$
\left\langle \mathbf{g}_{\mathbf{x}}, \mathbf{y} - \mathbf{x} \right\rangle \leq f(\mathbf{y}) - f(\mathbf{x}) - \frac{\sigma}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{5.21}
$$

Changing the roles of x and y yields the inequality

$$
\langle \mathbf{g}_{\mathbf{y}}, \mathbf{x} - \mathbf{y} \rangle \leq f(\mathbf{x}) - f(\mathbf{y}) - \frac{\sigma}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{5.22}
$$

Adding inequalities (5.21) and (5.22), we can finally conclude that

$$
\left\langle \mathbf{g}_{\mathbf{x}} - \mathbf{g}_{\mathbf{y}}, \mathbf{x} - \mathbf{y} \right\rangle \geq \sigma \| \mathbf{x} - \mathbf{y} \|^{2},
$$

which is the desired inequality.

(iii) ⇒ (ii) Suppose that (iii) is satisfied, and let $\mathbf{x} \in \mathrm{dom}(\partial f), \mathbf{y} \in \mathrm{dom}(f)$ and $\mathbf{g} \in \partial f(\mathbf{x})$ . Let z be any vector in $\operatorname{ri}(\operatorname{dom}(f))$ , and define $\tilde{\mathbf{y}} =(1 - \alpha) \mathbf{y} + \alpha \mathbf{z}$ for some $\alpha \in(0, 1)$ , which at this point we fix. By the line segment principle (Lemma 5.23), $\tilde{\mathbf{y}} \in \operatorname{ri}(\operatorname{dom}(f))$ . Consider now the one-dimensional function

$$
\varphi(\lambda) = f(\mathbf{x}_{\lambda}), \quad \lambda \in[0, 1],
$$

where $\mathbf{x}_{\lambda} =(1 - \lambda) \mathbf{x} + \lambda \tilde{\mathbf{y}}$ . For any $\lambda \in(0, 1)$ , let $\mathbf{g}_{\lambda} \in \partial f(\mathbf{x}_{\lambda})$ (whose existence is guaranteed since $\mathbf{x}_{\lambda} \in \operatorname{ri}(\operatorname{dom}(f))$ by the line segment principle). Then $\left.\mathbf{g}_{\lambda}, \tilde{\mathbf{y}} - \mathbf{x} \right.\in$ $\partial \varphi(\lambda)$ , and hence by the mean-value theorem (Lemma 5.22),

$$
f(\tilde{\mathbf{y}}) - f(\mathbf{x}) = \varphi(1) - \varphi(0) = \int_{0}^{1} \langle \mathbf{g}_{\lambda}, \tilde{\mathbf{y}} - \mathbf{x} \rangle d \lambda.\tag{5.23}
$$

Since $\mathbf{g} \in \partial f(\mathbf{x})$ and $\mathbf{g}_{\lambda} \in \partial f(\mathbf{x}_{\lambda})$ , by property (iii),

$$
\left\langle \mathbf{g}_{\lambda} - \mathbf{g}, \mathbf{x}_{\lambda} - \mathbf{x} \right\rangle \geq \sigma \| \mathbf{x}_{\lambda} - \mathbf{x} \|^{2},
$$

which is equivalent to

$$
\left\langle \mathbf{g}_{\lambda}, \tilde{\mathbf{y}} - \mathbf{x} \right\rangle \geq \left\langle \mathbf{g}, \tilde{\mathbf{y}} - \mathbf{x} \right\rangle + \sigma \lambda \| \tilde{\mathbf{y}} - \mathbf{x} \|^{2}.
$$

Plugging the last inequality into (5.23), we obtain that

$$
\begin{array}{c} f(\tilde{\mathbf{y}}) - f(\mathbf{x}) \geq \int_{0}^{1} \left[\langle \mathbf{g}, \tilde{\mathbf{y}} - \mathbf{x} \rangle + \sigma \lambda \| \tilde{\mathbf{y}} - \mathbf{x} \|^{2} \right] d \lambda \\ = \langle \mathbf{g}, \tilde{\mathbf{y}} - \mathbf{x} \rangle + \frac{\sigma}{2} \| \tilde{\mathbf{y}} - \mathbf{x} \|^{2}.\end{array}
$$

Recalling the definition of $\tilde{\mathbf{y}}.$ we obtain that for any $\alpha \in(0, 1)$ ，

$$
f((1 - \alpha) \mathbf{y} + \alpha \mathbf{z}) \geq f(\mathbf{x}) + \langle \mathbf{g},(1 - \alpha) \mathbf{y} + \alpha \mathbf{z} - \mathbf{x} \rangle + \frac{\sigma}{2} \|(1 - \alpha) \mathbf{y} + \alpha \mathbf{z} - \mathbf{x} \|^{2}.
$$

Taking $\alpha 0^{+}$ and using the continuity of the one-dimensional function $\alpha \mapsto$ $f((1 - \alpha) \mathbf{y} + \alpha \mathbf{z})$ over [0, 1] (follows by invoking Theorem 2.22 and recalling that the one-dimensional function is closed and convex), we obtain the desired result

$$
f(\mathbf{y}) \geq f(\mathbf{x}) + \langle \mathbf{g}, \mathbf{y} - \mathbf{x} \rangle + \frac{\sigma}{2} \| \mathbf{y} - \mathbf{x} \|^{2}.\quad \square
$$

The next theorem states that a proper closed and strongly convex function has a unique minimizer and that it satisfies a certain growth property around the minimizer.

Theorem 5.25 (existence and uniqueness of a minimizer of closed strongly convex functions). Let $f : \mathbb{E} \to(- \infty, \infty]$ be a proper closed and σ-strongly convex function $(\sigma > 0)$ . Then

(a) f has a unique minimizer;

(b) $\begin{array}{r}{f(\mathbf{x}) - f(\mathbf{x}^{*}) \geq \frac{\sigma}{2} \Vert \mathbf{x} - \mathbf{x}^{*} \Vert^{2}} \end{array}$ for all $\mathbf{x} \in \operatorname{dom}(f)$ , where $\mathbf{x}^{*}$ is the unique minimizer of f .

Proof. (a) Since $\operatorname{dom}(f)$ is nonempty and convex, it follows that there exists $\mathbf{x}_{0} \in \operatorname{ri}(\operatorname{dom}(f))$ (Theorem 3.17), and consequently, by Theorem 3.18, $\partial f(\mathbf{x}_{0}) \neq \emptyset$ Let $\mathbf{g} \in \partial f(\mathbf{x}_{0})$ . Then by the equivalence between σ-strong convexity and property (ii) of Theorem 5.24, it follows that

$$
f(\mathbf{x}) \geq f \left(\mathbf{x}_{0}\right) + \langle \mathbf{g}, \mathbf{x} - \mathbf{x}_{0} \rangle + \frac{\sigma}{2} \| \mathbf{x} - \mathbf{x}_{0} \|^{2} \text{for all} \mathbf{x} \in \mathbb{E}.
$$

Since all norms in finite dimensional spaces are equivalent, there exists a constant $C > 0$ such that

$$
\| \mathbf{y} \| \geq \sqrt{C} \| \mathbf{y} \|_{a},
$$

where $\| \cdot \|_{a} \equiv \sqrt{\langle \cdot, \cdot \rangle}$ denotes the Euclidean norm associated with the inner product of the space <sup>E</sup> (which might be different than the endowed norm $\| \cdot \|)$ . Therefore,

$$
f(\mathbf{x}) \geq f(\mathbf{x}_{0}) + \langle \mathbf{g}, \mathbf{x} - \mathbf{x}_{0} \rangle + \frac{C \sigma}{2} \| \mathbf{x} - \mathbf{x}_{0} \|_{a}^{2} \text{for any} \mathbf{x} \in \mathbb{E},
$$

which is the same as

$$
f(\mathbf{x}) \geq f(\mathbf{x}_{0}) - \frac{1}{2C \sigma} \| \mathbf{g} \|_{a}^{2} + \frac{C \sigma}{2} \left\| \mathbf{x} - \left(\mathbf{x}_{0} - \frac{1}{C \sigma} \mathbf{g}\right) \right\|_{a}^{2} \text{for any} \mathbf{x} \in \mathbb{E}.
$$

In particular, it follows that

$$
\operatorname{Lev}(f, f(\mathbf{x}_{0})) \subseteq B_{\| \cdot \|_{a}} \left[\mathbf{x}_{0} - \frac{1}{C \sigma} \mathbf{g}, \frac{1}{C \sigma} \| \mathbf{g} \|_{a} \right].
$$

Since $f$ is closed, the above level set is closed (Theorem 2.6), and since it is contained in a ball, it is also bounded. Therefore, $\operatorname{Lev}(f, f(\mathbf{x}_{0}))$ is compact. We can thus deduce that the optimal set of the problem of minimizing f over dom(f ) is the same as the optimal set of the problem of minimizing f over the nonempty compact set $\operatorname{Lev}(f, f(\mathbf{x}_{0}))$ . Invoking Weierstrass theorem for closed functions (Theorem 2.12), it follows that a minimizer exists. To show the uniqueness, assume that $\tilde{\mathbf{x}}$ and xˆ are minimizers of $f$ . Then $f(\tilde{\mathbf{x}}) = f(\hat{\mathbf{x}}) = f_{\mathrm{opt}}$ , where $f_{\mathrm{opt}}$ is the minimal value of $f.$ . Then by the definition of σ-strong convexity of $f$ ,

$$
f_{\mathrm{opt}} \leq f \left(\frac{1}{2} \tilde{\mathbf{x}} + \frac{1}{2} \hat{\mathbf{x}}\right) \leq \frac{1}{2} f(\tilde{\mathbf{x}}) + \frac{1}{2} f(\hat{\mathbf{x}}) - \frac{\sigma}{8} \| \tilde{\mathbf{x}} - \hat{\mathbf{x}} \|^{2} = f_{\mathrm{opt}} - \frac{\sigma}{8} \| \tilde{\mathbf{x}} - \hat{\mathbf{x}} \|^{2},
$$

implying that $\tilde{\mathbf{x}} = \hat{\mathbf{x}}$ and hence establishing the uniqueness of the minimizer of $f.$ (b) Let $\mathbf{x}^{*}$ be the unique minimizer of $f.$ Then by Fermat’s optimality condition (Theorem 3.63), $\mathbf{0} \in \partial f(\mathbf{x}^{*})$ and hence by using the equivalence between σ-strong convexity and property (ii) of Theorem 5.24, it follows that

$$
f(\mathbf{x}) - f \left(\mathbf{x}^{*}\right) \geq \langle \mathbf{0}, \mathbf{x} - \mathbf{x}^{*} \rangle + \frac{\sigma}{2} \| \mathbf{x} - \mathbf{x}^{*} \|^{2} = \frac{\sigma}{2} \| \mathbf{x} - \mathbf{x}^{*} \|^{2}\tag{5.24}
$$

for any $\mathbf{x} \in \mathbb{E}$ , establishing claim (b).

## 5.3 Smoothness and Strong Convexity Correspondence

## 5.3.1 The Conjugate Correspondence Theorem

An extremely useful connection between smoothness and strong convexity is given in the conjugate correspondence theorem that, loosely speaking, states that $f$ is σ-strongly convex if and only if $f^{*}$ is $\scriptstyle{\frac{1}{\sigma}} \to \operatorname{smooth}$

Theorem 5.26 (conjugate correspondence theorem). Let $\sigma > 0$ . Then

(a) If $f : \mathbb{E} \mathbb{R}$ is $a ~{\frac{1}{\sigma}} - smooth$ convex function, then $f^{*}$ is σ-strongly convex w.r.t. the dual norm $\Vert \cdot \Vert_{*}$

(b) $If \f : \mathbb{E} \to(- \infty, \infty]$ is a proper closed σ-strongly convex function, then $f^{*}$ : $\mathbb{E}^{*} \to \mathbb{R} \is \ \frac{1}{\sigma}{- smooth}$

Proof. (a) Suppose that $f : \mathbb{E} \mathbb{R}$ is a $\scriptstyle{\frac{1}{\sigma}} \to \operatorname{smooth}$ convex function. To prove that $f^{*}$ is σ-strongly convex, take $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathrm{dom}(\partial f^{*})$ and ${\bf v}_{1} \in \partial f^{*}({\bf y}_{1}),{\bf v}_{2} \in$ $\partial f^{*}(\mathbf{y}_{2})$ . Then by the conjugate subgradient theorem (Theorem 4.20), using also the properness closedness and convexity of $f,$ it follows that $\mathbf{y}_{1} ~ \in ~ \partial f(\mathbf{v}_{1})$ and ${\bf y}_{2} \in \partial f({\bf v}_{2})$ , which, by the Differentiability of $f,$ implies that ${\bf y}_{1} = \nabla f({\bf v}_{1})$ and ${\bf y}_{2} = \nabla f({\bf v}_{2})$ (see Theorem 3.33). By the equivalence between properties (i) and (iv) in Theorem 5.8, we can write

$$
\left\langle \mathbf{y}_{1} - \mathbf{y}_{2}, \mathbf{v}_{1} - \mathbf{v}_{2} \right\rangle \geq \sigma \| \mathbf{y}_{1} - \mathbf{y}_{2} \|_{*}^{2}.
$$

Since the last inequality holds for any $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathrm{dom}(\partial f^{*})$ and ${\bf v}_{1} \in \partial f^{*}({\bf y}_{1}),{\bf v}_{2} \in$ $\partial f^{*}(\mathbf{y}_{2})$ , it follows by the equivalence between σ-strong convexity and property (iii) of Theorem 5.24 that $f^{*}$ is a σ-strongly convex function.

(b) Suppose that $f$ is a proper closed σ-strongly convex function. By the conjugate subgradient theorem (Corollary 4.21),

$$
\partial f^{*}(\mathbf{y}) = \operatorname{argmax}_{\mathbf{x} \in \mathbb{E}} \{\langle \mathbf{x}, \mathbf{y} \rangle - f(\mathbf{x})\} \text{for any} \mathbf{y} \in \mathbb{E}^{*}.
$$

Thus, by the strong convexity and closedness of $f,$ , along with Theorem $5.25(a)$ , it follows that $\partial f^{*}(\mathbf{y})$ is a singleton for any $\mathbf{y} \in \mathbb{E}^{*}$ . Therefore, by Theorem 3.33, $f^{*}$ is diferentiable over the entire dual space $\mathbb{E}^{*}$ . To show the $\begin{array}{r}{\frac{1}{\sigma}} \end{array}$ -smoothness of $f^{*}$ take $\mathbf{y}_{1}, \mathbf{y}_{2} \in \mathbb{E}^{*}$ and denote $\mathbf{v}_{1} = \nabla f^{*}(\mathbf{y}_{1}), \mathbf{v}_{2} = \nabla f^{*}(\mathbf{y}_{2})$ . These relations, by the conjugate subgradient theorem (Theorem 4.20), are equivalent to $\mathbf{y}_{1} \in \partial f(\mathbf{v}_{1}), \mathbf{y}_{2} \in$ $\partial f(\mathbf{v}_{2})$ . Therefore, by Theorem 5.24 (equivalence between properties (i) and (iii)),

$$
\left\langle \mathbf{y}_{1} - \mathbf{y}_{2}, \mathbf{v}_{1} - \mathbf{v}_{2} \right\rangle \geq \sigma \| \mathbf{v}_{1} - \mathbf{v}_{2} \|^{2},
$$

that is,

$$
\left\langle \mathbf{y}_{1} - \mathbf{y}_{2}, \nabla f^{*}(\mathbf{y}_{1}) - \nabla f^{*}(\mathbf{y}_{2}) \right\rangle \geq \sigma \| \nabla f^{*}(\mathbf{y}_{1}) - \nabla f^{*}(\mathbf{y}_{2}) \|^{2},
$$

which, combined with the generalized Cauchy–Schwarz inequality (Lemma 1.4), implies the inequality

$$
\left\| \nabla f^{*}(\mathbf{y}_{1}) - \nabla f^{*}(\mathbf{y}_{2}) \right\| \leq \frac{1}{\sigma} \left\| \mathbf{y}_{1} - \mathbf{y}_{2} \right\|_{*},
$$

proving the <sup>1</sup> -smoothness of $f^{*}.\sqsubseteq$

## 5.3.2 Examples of Strongly Convex Functions

We can use the conjugate correspondence theorem (Theorem 5.26) to conclude several results on the strong convexity of several important functions.

Example 5.27 (negative entropy over the unit simplex). Consider the function $f : \mathbb{R}^{n}(- \infty, \infty]$ given by

$$
f(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} x_{i} \log x_{i}, & \mathbf{x} \in \Delta_{n}, \\ \infty & \text{else}.\end{array} \right.
$$

Then, by Section 4.4.10, the conjugate of this function is the log-sum-exp function $\begin{array}{r}{f^{*}(\mathbf{y}) = \log \left(\sum_{i = 1}^{n} e^{y_{i}} \right)} \end{array}$ , which, by Example 5.15, is a 1-smooth function w.r.t. both the $l_{\infty} -$ and $l_{2}{\mathrm{- norms}}$ . Consequently, by the conjugate correspondence theorem, f is 1-strongly convex w.r.t. both the $l_{1} \cdot$ and $l_{2}.$ -norms.

Example 5.28 (squared p-norm for $\pmb{\mathnormal{p}} \in \left(\mathbf{1}, \mathbf{2} \right])$ . Consider the function $f$ : $\mathbb{R}^{n} \to \mathbb{R}$ given by $\begin{array}{r}{f(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|_{p}^{2} ~(p \in(1, 2])} \end{array}$ . Then, by Section 4.4.15, $f^{*}(\mathbf{y}) =$ $\begin{array}{r}{\frac{1}{2} \| \mathbf{y} \|_{q}^{2},} \end{array}$ , where $q \geq 2$ is determined by the relation $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$ . By Example 5.11, $f^{*}$ is a $\left(q - 1 \right)$ -smooth function w.r.t. the $l_{q}{\mathrm{- norm}}$ , which, by the conjugate correspondence theorem, implies that the function $f \ \mathrm{is} \ \frac{1}{q - 1}$ -strongly convex w.r.t. the $l_{p}{\mathrm{- norm}}$ . Since $\textstyle{\frac{1}{q - 1}} = p - 1$ , we conclude that f is $(p - 1)$ -strongly convex w.r.t. the $l_{p}{\mathrm{- norm}}$ ■

Example 5.29 $(l_{2}$ ball-pen function). Consider the ball-pen function $f : \mathbb { R } ^ { n } $ $(- \infty, \infty]$ given by

$$
f(\mathbf{x}) = \left\{\begin{array}{ll} - \sqrt{1 - \| \mathbf{x} \|_{2}^{2}}, & \| \mathbf{x} \|_{2} \leq 1, \\ \infty & \text{else}.\end{array} \right.
$$

By Section 4.4.13, the conjugate of $f$ is

$$
f^{*}(\mathbf{y}) = \sqrt{\| \mathbf{y} \|_{2}^{2} + 1},
$$

which, by Example 5.14, is known to be 1-smooth w.r.t. the $l_{2} \mathrm{- norm}$ , and hence, by the conjugate correspondence theorem, f is 1-strongly convex w.r.t. the $l_{2^{-}}$ norm.

The table below contains all the strongly convex functions described in this chapter.

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td>Strong convexity parameter</td><td>Norm</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x} + 2\mathbf{b}^{T}\mathbf{x} + c$  $(\mathbf{A} \in \mathbb{S}_{++}^{n}, \mathbf{b} \in \mathbb{R}^{n}, c \in \mathbb{R})$ </td><td> $\mathbb{R}^{n}$ </td><td> $\lambda_{\min}(\mathbf{A})$ </td><td> $l_{2}$ </td><td>Example 5.19</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^{2} + \delta_{C}(\mathbf{x})$  $(\emptyset \neq C \subseteq \mathbb{E} \text{convex})$ </td><td> $C$ </td><td>1</td><td>Euclidean</td><td>Example 5.21</td></tr><tr><td> $-\sqrt{1 - \|\mathbf{x}\|_{2}^{2}}$ </td><td> $B_{\|\cdot\|_{2}}[\mathbf{0}, 1]$ </td><td>1</td><td> $l_{2}$ </td><td>Example 5.29</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_{p}^{2}(p \in(1,2])$ </td><td> $\mathbb{R}^{n}$ </td><td> $p - 1$ </td><td> $l_{p}$ </td><td>Example 5.28</td></tr><tr><td> $\sum_{i=1}^{n} x_{i} \log x_{i}$ </td><td> $\Delta_{n}$ </td><td>1</td><td> $l_{2} \text{or} l_{1}$ </td><td>Example 5.27</td></tr></table>

## 5.3.3 Smoothness and Differentiability of the Infimal Convolution

We will now show that under appropriate conditions, the infimal convolution of a convex function and an L-smooth convex function is also L-smooth; in addition, we will derive an expression for the gradient. The proof of the result is based on the conjugate correspondence theorem.

Theorem 5.30 (smoothness of the infimal convolution). Let $f : \mathbb { E } $ $(- \infty, \infty]$ be a proper closed and convex function, and let $\omega : \mathbb { E } $ <sup>R</sup> be an L-smooth convex function. Assume that f-ω is real-valued. Then the following hold:

(a) $f \boxed{\begin{array}{rl} \end{array}}$ is L-smooth.

(b) Let $\mathbf{x} \in \mathbb{E}$ , and assume that $\mathbf{u}(\mathbf{x})$ is a minimizer of

$$
\min_{\mathbf{u}} \left\{f(\mathbf{u}) + \omega(\mathbf{x} - \mathbf{u}) \right\}.\tag{5.25}
$$

$$
\text{Then} \nabla(f \square \omega)(\mathbf{x}) = \nabla \omega(\mathbf{x} - \mathbf{u}(\mathbf{x})).
$$

Proof. (a) By Theorem 4.19,

$$
f \square \omega =(f^{*} + \omega^{*})^{*}.
$$

Since f and $\omega$ are proper closed and convex, then so are $f^{*}, \omega^{*}$ (Theorems $4.3,$ 4.5). In addition, by the conjugate correspondence theorem (Theorem 5.26), $\omega^{*}$ is $\scriptstyle{\frac{1}{L}} \to \operatorname{strongly}$ convex. Therefore, by Lemma 5.20, $f^{*} + \omega^{*}$ is $\scriptstyle{\frac{1}{L}} \to \operatorname{strongly}$ convex, and it is also closed as a sum of closed functions; we will prove that it is also proper. Indeed, by Theorem 4.16,

$$
(f \square \omega)^{*} = f^{*} + \omega^{*}.
$$

Since $f \boxed{\begin{array}{rl} \end{array}}$ is convex (by Theorem 2.19) and proper, it follows that $f^{*} + \omega^{*}$ is proper as a conjugate of a proper and convex function (Theorem 4.5). Thus, since $f^{*} + \omega^{*}$ is proper closed and $\scriptstyle{\frac{1}{L}} \to \operatorname{strongly}$ convex function, by the conjugate correspondence theorem, it follows that $f \sqcup \omega =(f^{*} + \omega^{*})^{*}$ is L-smooth.

(b) Let $\mathbf{x} \in \mathbb{E}$ be such that $\mathbf{u}(\mathbf{x})$ is a minimizer of (5.25), namely,

$$
(f \square \omega)(\mathbf{x}) = f(\mathbf{u}(\mathbf{x})) + \omega(\mathbf{x} - \mathbf{u}(\mathbf{x})).\tag{5.26}
$$

For convenience, define ${\bf z} \equiv \nabla \omega({\bf x} -{\bf u}({\bf x}))$ . Our objective is to show that $\nabla(f \boxed{\mathbf{\xi}} \omega)(\mathbf{x})$ $\l = \textbf{z}$ . This means that we have to show that for any $\pmb{\xi} \in \mathbb{E}, \operatorname{lim}_{\| \pmb{\xi} \| 0} | \phi(\pmb{\xi}) | / \| \pmb{\xi} \| = 0$ where $\phi(\pmb{\xi}) \equiv(f \sqcup \omega)(\mathbf{x} + \pmb{\xi}) -(f \sqcup \omega)(\mathbf{x}) - \langle \pmb{\xi}, \mathbf{z} \rangle$ . By the definition of the infimal convolution,

$$
(f \square \omega)(\mathbf{x} + \boldsymbol{\xi}) \leq f(\mathbf{u}(\mathbf{x})) + \omega(\mathbf{x} + \boldsymbol{\xi} - \mathbf{u}(\mathbf{x})),\tag{5.27}
$$

which, combined with (5.26), yields

$$
\begin{array}{ll} \phi(\boldsymbol{\xi}) =(f \square \omega)(\mathbf{x} + \boldsymbol{\xi}) -(f \square \omega)(\mathbf{x}) - \langle \boldsymbol{\xi}, \mathbf{z} \rangle \\ \leq \omega(\mathbf{x} + \boldsymbol{\xi} - \mathbf{u}(\mathbf{x})) - \omega(\mathbf{x} - \mathbf{u}(\mathbf{x})) - \langle \boldsymbol{\xi}, \mathbf{z} \rangle &[(5.26),(5.27)] \\ \leq \langle \boldsymbol{\xi}, \nabla \omega(\mathbf{x} + \boldsymbol{\xi} - \mathbf{u}(\mathbf{x})) \rangle - \langle \boldsymbol{\xi}, \mathbf{z} \rangle, &[\text{gradient inequality for} \omega] \\ = \langle \boldsymbol{\xi}, \nabla \omega(\mathbf{x} + \boldsymbol{\xi} - \mathbf{u}(\mathbf{x})) - \nabla \omega(\mathbf{x} - \mathbf{u}(\mathbf{x})) \rangle &[\text{substitution of} \mathbf{z}] \\ \leq \| \boldsymbol{\xi} \| \cdot \| \nabla \omega(\mathbf{x} + \boldsymbol{\xi} - \mathbf{u}(\mathbf{x})) - \nabla \omega(\mathbf{x} - \mathbf{u}(\mathbf{x})) \|_{*} &[\text{generalized Cauchy - Schwarz}] \\ \leq L \| \boldsymbol{\xi} \|^{2}.&[L \text{-smoothness of} \omega] \end{array}
$$

To complete the proof, it is enough to show that we also have $\phi(\pmb{\xi}) \geq - L \| \pmb{\xi} \|^{2}$ Since $f \boxed{\begin{array}{rl} \end{array}}$ is convex, so is $\phi,$ which, along the fact that $\phi(\mathbf{0}) = 0$ , implies that $\phi(\pmb{\xi}) \geq - \phi(- \pmb{\xi})$ , and hence the desired result follows.

Example 5.31 (revisiting the 1-smoothness of $\scriptstyle{\frac{1}{2}} d_{C}^{2})$ . Suppose that <sup>E</sup> is a Euclidean space and let $C \subseteq \mathbb{E}$ be a nonempty closed and convex set. Consider the function $\begin{array}{r}{\varphi_{C}(\mathbf{x}) = \frac{1}{2} d_{C}^{2}(\mathbf{x})} \end{array}$ . We have already shown in Example 5.5 that it is 1-smooth. We will provide here a second proof for this result, which is based on Theorem 5.30. Note that $\varphi_{C} = \delta_{C} \bigtriangledown h$ , where $\begin{array}{r}{h(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|^{2}} \end{array}$ . Since $h$ is a real-valued 1-smooth convex function, and since $\delta_{C}$ is proper closed and convex, it follows by Theorem 5.30 that $\varphi_{C}$ is 1-smooth.


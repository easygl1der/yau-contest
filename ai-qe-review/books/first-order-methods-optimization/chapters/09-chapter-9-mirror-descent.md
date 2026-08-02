---
title: "Chapter 9 \u2014 Mirror Descent"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 9
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 10780
source_line_end: 11684
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 1
caption_derived_image_alt: 2
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

# Chapter 9 — Mirror Descent

> [[../README|本书目录]] · [[08-chapter-8-primal-and-dual-projected-subgradient-methods|上一章]] · [[10-chapter-10-the-proximal-gradient-method|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 10780–11684。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 3；Differentiability × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 9 Mirror Descent

This chapter is devoted to the study of the mirror descent method and some of its variations. The method is essentially a generalization of the projected subgradient method to the non-Euclidean setting. Therefore, naturally, we will not assume in the chapter that the underlying space is Euclidean.

## 9.1 From Projected Subgradient to Mirror Descent

Consider the optimization problem

$$
\text{(P)} \quad \min \{f(\mathbf{x}): \mathbf{x} \in C\},\tag{9.1}
$$

where we assume the following.<sup>49</sup>

Assumption 9.1.

(A) $f : \mathbb{E} \to(- \infty, \infty]$ is proper closed and convex.

(B) $C \subseteq \mathbb{E}$ is nonempty closed and convex.

(C) $C \subseteq$ int(dom(f )).

(D) The optimal set of (P) is nonempty and denoted by $X^{*}$ . The optimal value of the problem is denoted by $f_{\mathrm{opt}}$

The projected subgradient method for solving problem (P) was studied in Chapter 8. One of the basic assumptions made in Chapter 8, which was used throughout the analysis, is that the underlying space is Euclidean, meaning that $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle}$ . Recall that the general update step of the projected subgradient method has the form

$$
\mathbf{x}^{k + 1} = P_{C}(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})), \quad f^{\prime}(\mathbf{x}^{k}) \in \partial f(\mathbf{x}^{k}),\tag{9.2}
$$

for an appropriately chosen stepsize $t_{k}$ . When the space is non-Euclidean, there is actually a “philosophical” problem with the update rule (9.2)—the vectors $\mathbf{x}^{k}$ and $f^{\prime}(\mathbf{x}^{k})$ are in different spaces; one is in <sup>E</sup>, while the other in $\mathbb{E}^{*}$ . This issue is of course not really problematic since we can use our convention that the vectors in <sup>E</sup> and $\mathbb{E}^{*}$ are the same, and the only diference is in the norm associated with each of the spaces. Nonetheless, this issue is one of the motivations for seeking generalizations of the projected subgradient method better suited to the non-Euclidean setting.

To understand the role of the Euclidean norm in the definition of the projected subgradient method, we will consider the following reformulation of the update step (9.2):

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{f(\mathbf{x}^{k}) + \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} - \mathbf{x}^{k} \rangle + \frac{1}{2t_{k}} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} \right\},\tag{9.3}
$$

which actually shows that $\mathbf{x}^{k + 1}$ is constructed by minimizing a linearization of the objective function plus a quadratic proximity term. The equivalence between the two forms (9.2) and (9.3) in the Euclidean case is evident by the following identity:

$$
f(\mathbf{x}^{k}) + \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} - \mathbf{x}^{k} \rangle + \frac{1}{2t_{k}} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} = \frac{1}{2t_{k}} \left\| \mathbf{x} - \left[\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k}) \right] \right\|^{2} + D,
$$

where D is a constant $({\mathrm{i.e.}}$ , does not depend on $\mathbf{x})$ .

Coming back to the non-Euclidean case, the idea will be to replace the Euclidean “distance” function $\begin{array}{r}{{\frac{1}{2}} \| \mathbf x - \mathbf y \|^{2}} \end{array}$ in (9.3) by a different distance, which is not based on the Euclidean norm. The non-Euclidean distances that we will use are Bregman distances.

Definition 9.2 (Bregman distance). Let $\omega : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function that is diferentiable over dom $(\partial \omega)$ . The Bregman distance associated with $\omega$ is the function $B_{\omega} : \mathrm{dom}(\omega) \times \mathrm{dom}(\partial \omega) \mathbb{R}$ given by

$$
B_{\omega}(\mathbf{x}, \mathbf{y}) = \omega(\mathbf{x}) - \omega(\mathbf{y}) - \langle \nabla \omega(\mathbf{y}), \mathbf{x} - \mathbf{y} \rangle.
$$

The assumptions on ω (given a set $C)$ are gathered in the following.

Assumption 9.3 (properties of ω).

- ω is proper closed and convex.

- ω is diferentiable over dom $(\partial \omega)$ .

$C \subseteq \operatorname{dom}(\omega)$

$\omega + \delta_{C}$ is σ-strongly convex $(\sigma > 0)$

A Bregman distance is actually not necessarily a distance. It is nonnegative and equal to zero if and only if its two arguments coincide, but other than that, in general it is not symmetric and does not satisfy the triangle inequality. The properties of Bregman distances that do hold are summarized in the following lemma.

Lemma 9.4 (basic properties of Bregman distances). Suppose that $C \subseteq \mathbb{E}$ is nonempty closed and convex and that ω satisfies the properties in Assumption 9.3. Let $B_{\omega}$ be the Bregman distance associated with $\omega$ . Then

$$
B_{\omega}(\mathbf{x}, \mathbf{y}) \geq \frac{\sigma}{2} \| \mathbf{x} - \mathbf{y} \|^{2}
$$

$$
\mathbf{x} \in C, \mathbf{y} \in C \cap \operatorname{dom}(\partial \omega)
$$

$$
\mathbf{x} \in C
$$

$$
\mathbf{y} \in C \cap
$$

Proof. Part (a) follows by the first-order characterization of strongly convex functions described in Theorem 5.24(ii). Part (b) is a direct consequence of part (a).

Assume that $\mathbf{x}^{k} \in C \cap$ dom $(\partial \omega)$ . Replacing the term $\scriptstyle{\frac{1}{2}} \| \mathbf{x} - \mathbf{x}^{k} \|^{2}$ in formula (9.3) by a Bregman distance $B_{\omega}(\mathbf{x}, \mathbf{x}^{k})$ leads to the following update step:

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{f(\mathbf{x}^{k}) + \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} - \mathbf{x}^{k} \rangle + \frac{1}{t_{k}} B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\}.\tag{9.4}
$$

Omitting constant terms, (9.4) becomes

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{\langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + \frac{1}{t_{k}} B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\}.\tag{9.5}
$$

Further simplification of the update formula can be achieved by noting the following simple identity:

$$
\begin{array}{l} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + \frac{1}{t_{k}} B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \\ = \frac{1}{t_{k}} \left[\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k}), \mathbf{x} \rangle + \omega(\mathbf{x}) \right] \underbrace{- \frac{1}{t_{k}} \omega(\mathbf{x}^{k}) + \frac{1}{t_{k}} \langle \nabla \omega(\mathbf{x}^{k}), \mathbf{x}^{k} \rangle}_{\text{constant}}.\end{array}
$$

Therefore, the update formula in its most simplified form reads as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k}), \mathbf{x} \rangle + \omega(\mathbf{x}) \right\}.
$$

We are now ready to define the mirror descent method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Mirror Descent Method
Initialization: pick  $x^{0} \in C \cap \text{dom}(\partial\omega)$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) pick a stepsize  $t_{k} &gt; 0$  and a subgradient  $f'(\mathbf{x}^{k}) \in \partial f(\mathbf{x}^{k})$ ;
(b) set
 $\mathbf{x}^{k+1} = \arg\min_{\mathbf{x} \in C} \left\{\langle t_{k} f'(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k}), \mathbf{x} \rangle + \omega(\mathbf{x}) \right\}$ .
</div>

(9.6)

Remark 9.5. Although (9.6) is the most simplified form of the update step of the mirror descent method, the formula (9.5), which can also be written as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\},\tag{9.7}
$$

will also prove itself to be useful.

Remark 9.6. Defining $\tilde{\omega} = \omega + \delta_{C}$ , we can write the step (9.6) as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k}), \mathbf{x} \rangle + \tilde{\omega}(\mathbf{x}) \right\}.\tag{9.8}
$$

Since $\nabla \omega(\mathbf{x}^{k}) \in \partial \tilde{\omega}(\mathbf{x}^{k})$ , we can write it as $\tilde{\omega}^{\prime}(\mathbf{x}^{k})$ , so (9.8) becomes

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \tilde{\omega}^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + \tilde{\omega}(\mathbf{x}) \right\}.\tag{9.9}
$$

Finally, by the conjugate correspondence theorem (Theorem 5.26), whose assumptions hold (properness, closedness, and strong convexity $of \tilde{\omega}), \tilde{\omega}^{*}$ is diferentiable, which, combined with the conjugate subgradient theorem (Corollary 4.21), yields that (9.9) is equivalent to the following known formula for the mirror descent method:

$$
\mathbf{x}^{k + 1} = \nabla \tilde{\omega}^{*}(\tilde{\omega}^{\prime}(\mathbf{x}^{k}) - t_{k} f^{\prime}(\mathbf{x}^{k})).
$$

The basic step of the mirror descent method (9.6) is of the form

$$
\min_{\mathbf{x} \in C} \left\{\langle \mathbf{a}, \mathbf{x} \rangle + \omega(\mathbf{x}) \right\}\tag{9.10}
$$

for some $\mathbf{a_{\lambda}} \in \mathbb{E}^{*}$ . To show that the method is well defined, Theorem 9.8 below establishes the fact that the minimum of problem (9.10) is uniquely attained at a point in $C \cap \mathrm{dom}(\partial \omega)$ . The reason why it is important to show that the minimizer is in $\mathrm{dom}(\partial \omega)$ is that the method requires computing the gradient of ω at the new iterate vector (recall that ω is assumed to be diferentiable over dom(∂ω)). We will prove a more general lemma that will also be useful in other contexts.

Lemma 9.7. Assume the following:

$\omega : \mathbb{E}(- \infty, \infty]$ is a proper closed and convex function diferentiable over dom(∂ω).

$\psi : \mathbb{E}(- \infty, \infty]$ is a proper closed and convex function satisfying dom $(\psi) \subseteq$ dom(ω).

$\omega + \delta_{\mathrm{dom}(\psi)}$ is σ-strongly convex $(\sigma > 0)$

Then the minimizer of the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \left\{\psi(\mathbf{x}) + \omega(\mathbf{x}) \right\}\tag{9.11}
$$

is uniquely attained at a point in dom(ψ) ∩ dom(∂ω).

Proof. Problem (9.11) is the same as

$$
\min_{\mathbf{x} \in \mathbb{E}} \varphi(\mathbf{x}),\tag{9.12}
$$

where $\varphi = \psi + \omega$ . The function $\varphi$ is closed since both ψ and $\omega$ are closed; it is proper by the fact that dom $(\varphi) = \mathrm{dom}(\psi) \neq \emptyset$ . Since $\omega + \delta_{\mathrm{dom}(\psi)}$ is σ-strongly convex and $\psi$ is convex, their sum $\psi + \omega + \delta_{\mathrm{dom}(\psi)} = \psi + \omega = \varphi$ is σ-strongly convex. To conclude, $\varphi$ is proper closed and σ-strongly convex, and hence, by Theorem $5.25(a)$ , problem (9.12) has a unique minimizer $\mathbf{x}^{*}$ in dom $(\varphi) = \operatorname{dom}(\psi)$ . To show that $\mathbf{x}^{*} \in \mathrm{dom}(\partial \omega)$ , note that by Fermat’s optimality condition (Theorem 3.63), $\mathbf{0} \in \partial \varphi(\mathbf{x}^{*})$ , and in particular $\partial \varphi(\mathbf{x}^{*}) \neq \emptyset$ . Therefore, since by the sum rule of subdiferential calculus (Theorem 3.40), $\partial \varphi(\mathbf{x}^{*}) = \partial \psi(\mathbf{x}^{*}) + \partial \omega(\mathbf{x}^{*})$ , it follows in particular that $\partial \omega(\mathbf{x}^{*}) \neq \emptyset$ , meaning that $\mathbf{x}^{*} \in$ dom(∂ω).

The fact that the mirror descent method is well defined can now be easily deduced.

Theorem 9.8 (mirror descent is well defined). Suppose that Assumptions 9.1 and 9.3 hold. Let $\mathbf{a} \in \mathbb{E}^{*}$ . Then the problem

$$
\min_{\mathbf{x} \in C} \{\langle \mathbf{a}, \mathbf{x} \rangle + \omega(\mathbf{x})\}
$$

has a unique minimizer in $C \cap \mathrm{dom}(\partial \omega)$

Proof. The proof follows by invoking Lemma 9.7 with $\psi(\mathbf{x}) \equiv \langle \mathbf{a}, \mathbf{x} \rangle + \delta_{C}(\mathbf{x})$ □

Two very common choices of strongly convex functions are described below.

Example 9.9 (squared Euclidean norm). Suppose that Assumption 9.1 holds and that <sup>E</sup> is Euclidean, meaning that its norm satisfies $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle}$ . Define

$$
\omega(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|^{2}.
$$

Then $\omega$ obviously satisfies the properties listed in Assumption 9.3—it is proper closed and 1-strongly convex. Since $\nabla \omega(\mathbf{x}) = \mathbf{x}$ , then the general update step of the mirror descent method reads as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \mathbf{x}^{k}, \mathbf{x} \rangle + \frac{1}{2} \| \mathbf{x} \|^{2} \right\},
$$

which is the same as the projected subgradient update step: $\mathbf{x}^{k + 1} = P_{C}(\mathbf{x}^{k} -$ $t_{k} f^{\prime} \bigl(\mathbf{x}^{k} \bigr) \bigr)$ . This is of course not a surprise since the method was constructed as a generalization of the projected subgradient method.

Example 9.10 (negative entropy over the unit simplex). Suppose that Assumption 9.1 holds with $\mathbb{E} = \mathbb{R}^{n}$ endowed with the $l_{1}{\mathrm{- norm}}$ and $C = \Delta_{n}$ . We will take $\omega$ to be the negative entropy over the nonnegative orthant:

$$
\omega(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} x_{i} \log x_{i}, & \mathbf{x} \in \mathbb{R}_{+}^{n}, \\ \infty & \text{else}.\end{array} \right.
$$

As usual, we use the convention that 0 log $0 = 0$ . By Example 5.27, $\omega + \delta_{\Delta.}$ is 1-strongly convex w.r.t. the $l_{1}{\mathrm{- norm}}$ . In this case,

$$
\mathrm{dom}(\partial \omega) = \mathbb{R}_{+ +}^{n},
$$

on which $\omega$ is indeed diferentiable. Thus, all the properties of Assumption 9.3 hold. The associated Bregman distance is given for any $\mathbf{x} \in \Delta_{n}$ and $\mathbf{y} \in \Delta_{n}^{+} \equiv$ $\{\mathbf{x} \in \mathbb{R}_{+ +}^{n} : \mathbf{e}^{T} \mathbf{x} = 1\}$ by

$$
\begin{array}{l} B_{\omega}(\mathbf{x}, \mathbf{y}) = \sum_{i = 1}^{n} x_{i} \log x_{i} - \sum_{i = 1}^{n} y_{i} \log y_{i} - \sum_{i = 1}^{n}(\log(y_{i}) + 1)(x_{i} - y_{i}) \\ \qquad = \sum_{i = 1}^{n} x_{i} \log(x_{i} / y_{i}) + \sum_{i = 1}^{n} y_{i} - \sum_{i = 1}^{n} x_{i} \\ \qquad = \sum_{i = 1}^{n} x_{i} \log(x_{i} / y_{i}), \end{array}\tag{9.13}
$$

which is the so-called Kullback-Leibler divergence distance measure. The general update step of the mirror descent method has the form $(f_{i}^{\prime}(\mathbf{x}^{k})$ is the ith component of $f^{\prime}(\mathbf{x}^{k}))$ ,

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \Delta_{n}} \left\{\sum_{i = 1}^{n}(t_{k} f_{i}^{\prime}(\mathbf{x}^{k}) - 1 - \log(x_{i}^{k})) x_{i} + \sum_{i = 1}^{n} x_{i} \log x_{i} \right\}.\tag{9.14}
$$

By Example 3.71, the optimal solution of problem (9.14) is

$$
x_{i}^{k + 1} = \frac{e^{\log(x_{i}^{k}) + 1 - t_{k} f_{i}^{\prime}(\mathbf{x}^{k})}}{\sum_{j = 1}^{n} e^{\log(x_{j}^{k}) + 1 - t_{k} f_{j}^{\prime}(\mathbf{x}^{k})}}, i = 1, 2, \ldots, n,
$$

which can be simplified into the following:

$$
x_{i}^{k + 1} = \frac{x_{i}^{k} e^{- t_{k} f_{i}^{\prime}(\mathbf{x}^{k})}}{\sum_{j = 1}^{n} x_{j}^{k} e^{- t_{k} f_{j}^{\prime}(\mathbf{x}^{k})}}, \quad i = 1, 2, \ldots, n.\qquad \blacksquare
$$

The natural question that arises is how to choose the stepsizes. The convergence analysis that will be developed in the next section will reveal some possible answers to this question.

## 9.2 Convergence Analysis

## 9.2.1 The Toolbox

The following identity, also known as the three-points lemma, is essential in the analysis of the mirror descent lemma.

Lemma 9.11 (three-points lemma).<sup>50</sup> Suppose that $\omega : \mathbb{E}(- \infty, \infty]$ is proper closed and convex. Suppose in addition that ω is diferentiable over dom(∂ω). Assume that $\mathbf{a}, \mathbf{b} \in \mathrm{dom}(\partial \omega)$ and $\mathbf{c} \in \mathrm{dom}(\omega)$ . Then the following equality holds:

$$
\langle \nabla \omega(\mathbf{b}) - \nabla \omega(\mathbf{a}), \mathbf{c} - \mathbf{a} \rangle = B_{\omega}(\mathbf{c}, \mathbf{a}) + B_{\omega}(\mathbf{a}, \mathbf{b}) - B_{\omega}(\mathbf{c}, \mathbf{b}).
$$

Proof. By definition of $B_{\omega}$

$$
B_{\omega}(\mathbf{c}, \mathbf{a}) = \omega(\mathbf{c}) - \omega(\mathbf{a}) - \langle \nabla \omega(\mathbf{a}), \mathbf{c} - \mathbf{a} \rangle,
$$

$$
B_{\omega}(\mathbf{a}, \mathbf{b}) = \omega(\mathbf{a}) - \omega(\mathbf{b}) - \langle \nabla \omega(\mathbf{b}), \mathbf{a} - \mathbf{b} \rangle,
$$

$$
B_{\omega}(\mathbf{c}, \mathbf{b}) = \omega(\mathbf{c}) - \omega(\mathbf{b}) - \langle \nabla \omega(\mathbf{b}), \mathbf{c} - \mathbf{b} \rangle.
$$

Hence,

$$
\begin{array}{c} B_{\omega}(\mathbf{c}, \mathbf{a}) + B_{\omega}(\mathbf{a}, \mathbf{b}) - B_{\omega}(\mathbf{c}, \mathbf{b}) = - \langle \nabla \omega(\mathbf{a}), \mathbf{c} - \mathbf{a} \rangle - \langle \nabla \omega(\mathbf{b}), \mathbf{a} - \mathbf{b} \rangle + \langle \nabla \omega(\mathbf{b}), \mathbf{c} - \mathbf{b} \rangle \\ = \langle \nabla \omega(\mathbf{b}) - \nabla \omega(\mathbf{a}), \mathbf{c} - \mathbf{a} \rangle.\quad \square \end{array}
$$

Another key lemma is an extension of the second prox theorem (Theorem 6.39) to the case of non-Euclidean distances.

Theorem 9.12 (non-Euclidean second prox theorem). Let

$\omega : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function diferentiable over $\mathrm{dom}(\partial \omega)$

$\psi : \mathbb{E}(- \infty, \infty]$ be a proper closed and convex function satisfying dom $(\psi) \subseteq$ dom(ω);

$\omega + \delta_{\mathrm{dom}(\psi)}$ be σ-strongly convex $(\sigma > 0)$

Assume that b $\in \mathrm{dom}(\partial \omega)$ , and let a be defined by

$$
\mathbf{a} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} \left\{\psi(\mathbf{x}) + B_{\omega}(\mathbf{x}, \mathbf{b}) \right\}.\tag{9.15}
$$

Then $\mathbf{a} \in \mathrm{dom}(\partial \omega)$ and for all $\mathbf{u} \in \mathrm{dom}(\psi)$

$$
\langle \nabla \omega(\mathbf{b}) - \nabla \omega(\mathbf{a}), \mathbf{u} - \mathbf{a} \rangle \leq \psi(\mathbf{u}) - \psi(\mathbf{a}).\tag{9.16}
$$

Proof. Using the definition of $B_{\omega}$ , (9.15) can be rewritten as

$$
\mathbf{a} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{E}} \left\{\psi(\mathbf{x}) - \langle \nabla \omega(\mathbf{b}), \mathbf{x} \rangle + \omega(\mathbf{x}) \right\}.\tag{9.17}
$$

The fact that $\mathbf{a} \in \mathrm{dom}(\partial \omega)$ follows by invoking Lemma 9.7 with $\psi(\mathbf{x}) - \langle \nabla \omega(\mathbf{b}), \mathbf{x} \rangle$ taking the role of $\psi(\mathbf{x})$ Using Fermat’s optimality condition (Theorem 3.63), it follows by (9.17) that there exists $\psi^{\prime}(\mathbf{a}) \in \partial \psi(\mathbf{a})$ for which

$$
\psi^{\prime}(\mathbf{a}) + \nabla \omega(\mathbf{a}) - \nabla \omega(\mathbf{b}) = \mathbf{0}.
$$

Hence, by the subgradient inequality, for any $\mathbf{u} \in \mathrm{dom}(\psi)$ 2

$$
\langle \nabla \omega(\mathbf{b}) - \nabla \omega(\mathbf{a}), \mathbf{u} - \mathbf{a} \rangle = \langle \psi^{\prime}(\mathbf{a}), \mathbf{u} - \mathbf{a} \rangle \leq \psi(\mathbf{u}) - \psi(\mathbf{a}),
$$

proving the desired result.

Using the non-Euclidean second prox theorem and the three-points lemma, we can now establish a fundamental inequality satisfied by the sequence generated by the mirror descent method. The inequality can be seen as a generalization of Lemma 8.11.

Lemma 9.13 (fundamental inequality for mirror descent). Suppose that Assumptions 9.1 and 9.3 hold. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror descent method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ . Then for any $\mathbf{x}^{*} \in X^{*}$ and $k \geq 0$

$$
t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) + \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2}.
$$

Proof. By the update formula (9.7) for $\mathbf{x}^{k + 1}$ and the non-Euclidean second prox theorem (Theorem 9.12) invoked with b ${\boldsymbol{\mathbf{\mu}}} = \mathbf{x}^{k}$ and $\psi({\bf x}) \equiv t_{k} \langle f^{\prime}({\bf x}^{k}),{\bf x} \rangle + \delta_{C}({\bf x})$ (and hence $\mathbf{a} = \mathbf{x}^{k + 1})$ , we have for any $\mathbf{u} \in C$

$$
\langle \nabla \omega(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k + 1}), \mathbf{u} - \mathbf{x}^{k + 1} \rangle \leq t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{u} - \mathbf{x}^{k + 1} \rangle.\tag{9.18}
$$

By the three-points lemma (with $\mathbf{a} = \mathbf{x}^{k + 1}, \mathbf{b} = \mathbf{x}^{k}$ , and $\mathbf{c} = \mathbf{u})$ ，

$$
\langle \nabla \omega(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k + 1}), \mathbf{u} - \mathbf{x}^{k + 1} \rangle = B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) + B_{\omega}(\mathbf{x}^{k + 1}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k}),
$$

which, combined with (9.18), gives

$$
B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) + B_{\omega}(\mathbf{x}^{k + 1}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) \leq t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{u} - \mathbf{x}^{k + 1} \rangle.
$$

Therefore,

$$
\begin{array}{rl} & t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{u} \rangle \\ & \leq B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) - B_{\omega}(\mathbf{x}^{k + 1}, \mathbf{x}^{k}) + t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{k + 1} \rangle \\ & \overset{(*)}{\leq} B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} + t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{k + 1} \rangle \\ & = B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} + \left\langle \frac{t_{k}}{\sqrt{\sigma}} f^{\prime}(\mathbf{x}^{k}), \sqrt{\sigma}(\mathbf{x}^{k} - \mathbf{x}^{k + 1}) \right\rangle \\ & \overset{(* *)}{\leq} B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} + \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2} + \frac{\sigma}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{k} \|^{2} \\ & = B_{\omega}(\mathbf{u}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{k + 1}) + \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2}, \end{array}
$$

where the inequality (∗) follows by Lemma $9.4(a)$ and (∗∗) by Fenchel’s inequality (Theorem 4.6) employed on the function $\scriptstyle{\frac{1}{2}} \left\| \mathbf{x} \right\|^{2}$ (whose conjugate is $\frac{1}{2} \| \mathbf{y} \|_{*}^{2}$ —see Section 4.4.15). Plugging in $\mathbf{u} = \mathbf{x}^{*}$ and using the subgradient inequality, we obtain

$$
t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) + \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2}.
$$

Under a boundedness assumption on $B_{\omega}(\mathbf{x}, \mathbf{x}^{0})$ over $C_{i}$ , we can deduce a useful bound on the sequence of best achieved function values defined by

$$
f_{\mathrm{best}}^{k} \equiv \min_{n = 0, 1, \dots, k} f(\mathbf{x}^{n}).\tag{9.19}
$$

Lemma 9.14. Suppose that Assumptions 9.1 and 9.3 hold and that $\| f^{\prime}(\mathbf{x}) \|_{*} \leq L_{f}$ for $all \textbf{x} \in \boldsymbol{C}$ , where $L_{f} > 0$ . Suppose that $B_{\omega}(\mathbf{x}, \mathbf{x}^{0})$ is bounded over $C_{i}$ and let $\Theta(\mathbf{x}^{0})$ satisfy

$$
\Theta(\mathbf{x}^{0}) \geq \max_{\mathbf{x} \in C} B_{\omega}(\mathbf{x}, \mathbf{x}^{0}).
$$

Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror descent method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ . Then for any $N \geq 0$ ,

$$
f_{\mathrm{best}}^{N} - f_{\mathrm{opt}} \leq \frac{\Theta(\mathbf{x}^{0}) + \frac{L_{f}^{2}}{2 \sigma} \sum_{k = 0}^{N} t_{k}^{2}}{\sum_{k = 0}^{N} t_{k}},\tag{9.20}
$$

where $f_{\mathrm{best}}^{N}$ is defined in (9.19).

Proof. Let $\mathbf{x}^{*} \in X^{*}$ . By Lemma 9.13 it follows that for any $k \geq 0$

$$
t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) + \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2}.\tag{9.21}
$$

Summing (9.21) over $k = 0, 1, \ldots, N$ , we obtain

$$
\begin{array}{c} \sum_{k = 0}^{N} t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{N + 1}) + \sum_{k = 0}^{N} \frac{t_{k}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{k}) \|_{*}^{2} \\ = \Theta(\mathbf{x}^{0}) + \frac{L_{f}^{2}}{2 \sigma} \sum_{k = 0}^{N} t_{k}^{2}, \end{array}
$$

which, combined with the inequality $\begin{array}{r}{(\sum_{k = 0}^{n} t_{k})(f_{\mathrm{best}}^{N} - f_{\mathrm{opt}}) \le \sum_{k = 0}^{N} t_{k}(f(\mathbf{x}^{k}) -} \end{array}$ $f_{\mathrm{opt}})$ , yields the result (9.20).

## 9.2.2 Fixed Number of Iterations

Let us begin by fixing the number of iterations N and deduce what the “optimal” stepsizes are in the sense that they bring the right-hand side of (9.20) to a minimum. For that, we will prove the following technical lemma.

Lemma 9.15. The optimal solution of the problem

$$
\min_{t_{1}, \ldots, t_{m} > 0} \frac{\alpha + \beta \sum_{k = 1}^{m} t_{k}^{2}}{\sum_{k = 1}^{m} t_{k}},\tag{9.22}
$$

where $\alpha, \beta > 0$ , is given by $\begin{array}{r}{t_{k} = \sqrt{\frac{\alpha}{\beta m}}, k = 1, 2, \ldots, m} \end{array}$ . The optimal value is $2{\sqrt{\frac{\alpha \beta}{m}}}$

Proof. Denote the objective function of (9.22) by

$$
\phi(\mathbf{t}) \equiv \frac{\alpha + \beta \sum_{k = 1}^{m} t_{k}^{2}}{\sum_{k = 1}^{m} t_{k}}.
$$

Note that $\phi$ is a permutation symmetric function, meaning that $\phi(\mathbf{t}) = \phi(\mathbf{Pt})$ for any permutation matrix $\mathbb{P} \in \Lambda_{m}$ . A consequence of this observation is that if problem (9.22) has an optimal solution, then it necessarily has an optimal solution in which all the variables are the same. To show this, take an arbitrary optimal solution $\mathbf{t}^{*}$ and a permutation matrix $\mathbb{P} \in \Lambda_{m}$ . Since $\phi(\mathbf{Pt^{*}}) = \phi(\mathbf{t^{*}})$ , it follows that $\mathbf{Pt^{*}}$ is also an optimal solution of (9.22). Therefore, since $\phi$ is convex over the positive orthant,<sup>51</sup> it follows that

$$
\frac{1}{m !} \sum_{\mathbb{P} \in \Lambda_{m}} \mathbf{Pt}^{*} = \frac{1}{m} \left(\begin{array}{c} \mathbf{e}^{T} \mathbf{t} \\ \vdots \\ \mathbf{e}^{T} \mathbf{t} \end{array} \right)
$$

is also an optimal solution, showing that there always exists an optimal solution with equal components. Problem (9.22) therefore reduces to (after substituting $t_{1} = t_{2} = \cdot \cdot \cdot = t_{m} = t)$

$$
\min_{t > 0} \frac{\alpha + \beta mt^{2}}{mt},
$$

whose optimal solution is $\begin{array}{r}{t = \sqrt{\frac{\alpha}{\beta m}}} \end{array}$ , and thus an optimal solution of problem (9.22) is given by $\begin{array}{r}{t_{k} = \sqrt{\frac{\alpha}{\beta m}}, k = 1, 2,..., m} \end{array}$ . Substituting this value into $\phi.$ we obtain that the optimal value is $2{\sqrt{\frac{\alpha \beta}{m}}}$

Using Lemma 9.15 with $\begin{array}{r}{\alpha = \Theta(\mathbf{x}^{0}), \beta = \frac{L_{f}^{2}}{2 \sigma}} \end{array}$ and $m = N + 1$ , we conclude that the minimum of the right-hand side of (9.20) is attained at $\begin{array}{r}{t_{k} = \frac{\sqrt{2 \Theta(\mathbf{x}^{0}) \sigma}}{L_{f} \sqrt{N + 1}}} \end{array}$ . The $O(1 / \sqrt{N})$ rate of convergence follows immediately.

Theorem 9.16 $(O(1 /{\sqrt{N}})$ rate of convergence of mirror descent with fixed amount of iterations). Suppose that Assumptions 9.1 and 9.3 hold and that $\| f^{\prime}(\mathbf{x}) \|_{*} \le L_{f}$ for all $\textbf{x} \in \mathbf{\Sigma} C$ for some $L_{f} ~ > ~ 0$ . Assume that $B_{\omega}(\mathbf{x}, \mathbf{x}^{0})$ is bounded over $C,$ , and let $\Theta(\mathbf{x}^{0})$ satisfy

$$
\Theta(\mathbf{x}^{0}) \geq \max_{\mathbf{x} \in C} B_{\omega}(\mathbf{x}, \mathbf{x}^{0}).
$$

Let N be a positive integer, and let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror descent method with

$$
t_{k} = \frac{\sqrt{2 \Theta(\mathbf{x}^{0}) \sigma}}{L_{f} \sqrt{N + 1}}, k = 0, 1, \ldots, N.\tag{9.23}
$$

Then

$$
f_{\mathrm{best}}^{N} - f_{\mathrm{opt}} \leq \frac{\sqrt{2 \Theta(\mathbf{x}^{0})} L_{f}}{\sqrt{\sigma} \sqrt{N + 1}},
$$

where $f_{\mathrm{best}}^{N}$ is defined in (9.19).

Proof. By Lemma 9.14,

$$
f_{\mathrm{best}}^{N} - f_{\mathrm{opt}} \leq \frac{\Theta(\mathbf{x}^{0}) + \frac{L_{f}^{2}}{2 \sigma} \sum_{k = 0}^{N} t_{k}^{2}}{\sum_{k = 0}^{N} t_{k}}.
$$

Plugging the expression (9.23) for the stepsizes into the above inequality, the result follows.

Example 9.17 (optimization over the unit simplex). Consider the problem

$$
\min \{f(\mathbf{x}): \mathbf{x} \in \Delta_{n}\},
$$

where $f : \mathbb{R}^{n}(- \infty, \infty]$ is proper closed convex and satisfies $\Delta_{n} \subseteq \operatorname{int}(\operatorname{dom}(f))$ Consider two possible algorithms.

- Euclidean setting. We assume that the underlying norm on $\mathbb{R}^{n}$ is the $l_{2^{-}}$ norm and $\begin{array}{r}{\omega(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|_{2}^{2}} \end{array}$ , which is 1-strongly convex w.r.t. the $l_{2}{\mathrm{- norm}}$ . In this case, the mirror descent algorithm is the same as the projected subgradient method:

$$
\mathbf{x}^{k + 1} = P_{\Delta_{n}}(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})).
$$

We will assume that the method starts with the vector $\textstyle \mathbf{x}^{0} ={\frac{1}{n}} \mathbf{e}$ . For this choice,

$$
\max_{\mathbf{x} \in \Delta_{n}} B_{\omega}(\mathbf{x}, \mathbf{x}^{0}) = \max_{\mathbf{x} \in \Delta_{n}} \frac{1}{2} \left\| \mathbf{x} - \frac{1}{n} \mathbf{e} \right\|_{2}^{2} = \frac{1}{2} \left(1 - \frac{1}{n}\right),
$$

and we will take $\Theta(\mathbf{x}^{0}) = 1$ . By Theorem 9.16, we have that given a positive integer N , by appropriately choosing the stepsizes, we obtain that

$$
f_{\mathrm{best}}^{N} - f_{\mathrm{opt}} \leq \underbrace{\frac{\sqrt{2} L_{f, 2}}{\sqrt{N + 1}}}_{C_{e}^{f}},\tag{9.24}
$$

where $L_{f, 2} = \operatorname{max}_{\mathbf{x} \in \Delta_{n}} \| f^{\prime}(\mathbf{x}) \|_{2}$

- Non-Euclidean setting. Here we assume that the underlying norm on $\mathbb{R}^{n}$ is the $l_{1}{\mathrm{- norm}}$ and that the convex function ω is chosen as the negative entropy function

$$
\omega(\mathbf{x}) = \left\{\begin{array}{ll} \sum_{i = 1}^{n} x_{i} \log(x_{i}), & \mathbf{x} \in \mathbb{R}_{+ +}^{n}, \\ \infty & \text{else}.\end{array} \right.\tag{9.25}
$$

By Example 5.27, $\omega + \delta_{\Delta_{r}}$ is 1-strongly convex w.r.t. the $l_{1}{\mathrm{- norm}}$ . By Example 9.10, the mirror descent method takes the form

$$
x_{i}^{k + 1} = \frac{x_{i}^{k} e^{- t_{k} f_{i}^{\prime}(\mathbf{x}^{k})}}{\sum_{j = 1}^{n} x_{j}^{k} e^{- t_{k} f_{j}^{\prime}(\mathbf{x}^{k})}}, i = 1, 2, \ldots, n.
$$

As in the Euclidean setting, we will also initialize the method with $\textstyle \mathbf{x}^{0} ={\frac{1}{n}} \mathbf{e}$ For this choice, using the fact that the Bregman distance coincides with the Kullback–Leibler divergence (see (9.13)), we obtain

$$
\begin{array}{c} \max_{\mathbf{x} \in \Delta_{n}} B_{\omega} \left(\mathbf{x}, \frac{1}{n} \mathbf{e}\right) = \max_{\mathbf{x} \in \Delta_{n}} \sum_{i = 1}^{n} x_{i} \log(nx_{i}) = \log(n) + \max_{\mathbf{x} \in \Delta_{n}} \sum_{i = 1}^{n} x_{i} \log x_{i} \\ = \log(n).\end{array}
$$

We will thus take $\Theta({\mathbf{x}}^{0}) = \log(n)$ . By Theorem 9.16, we have that given a positive integer N , by appropriately choosing the stepsizes, we obtain that

$$
f_{\mathrm{best}}^{N} - f_{\mathrm{opt}} \leq \underbrace{\frac{\sqrt{2 \log(n)} L_{f, \infty}}{\sqrt{N + 1}}}_{C_{\mathrm{ne}}^{f}},\tag{9.26}
$$

where $\begin{array}{r}{L_{f, \infty} = \operatorname{max}_{\mathbf{x} \in \Delta_{n}} \| f^{\prime}(\mathbf{x}) \|_{\infty},} \end{array}$

The ratio of the two upper bounds in (9.24) and (9.26) is given by

$$
\rho^{f} = \frac{C_{\mathrm{ne}}^{f}}{C_{e}^{f}} = \sqrt{\log(n)} \frac{L_{f, \infty}}{L_{f, 2}}.
$$

Whether or not $\rho^{f}$ is greater than 1 (superiority of the Euclidean setting) or smaller than 1 (superiority of the non-Euclidean setting) depends on the properties of the function $f.$ In any case, since $\| \mathbf{y} \|_{\infty} \leq \| \mathbf{y} \|_{2} \leq{\sqrt{n}} \| \mathbf{y} \|_{\infty}$ for all $\mathbf{y} \in \mathbb{R}^{n}$ , it follows that

$$
\frac{1}{\sqrt{n}} \leq \frac{L_{f, \infty}}{L_{f, 2}} \leq 1,
$$

and hence that

$$
\frac{\sqrt{\log(n)}}{\sqrt{n}} \leq \rho^{f} \leq \sqrt{\log(n)}.
$$

Therefore, the ratio between the eficiency estimates ranges between $\frac{\sqrt{\log(n)}}{\sqrt{n}}$ (superiority of the non-Euclidean setting) and $\sqrt{\log(n)}$ (slight superiority of the Euclidean setting).

## 9.2.3 Dynamic Stepsize Rule

The constant stepsize rule is relatively easy to analyze but has the disadvantage of requiring the a priori knowledge of the total number of iterations employed by the method. In practical situations, the number of iterations is not fixed a priori, and a stopping criteria different than merely fixing the total number of iterations is usually imposed. This is why dynamic (namely, nonconstant) stepsize rules are important. Similarly to the analysis in Chapter 8 for the projected subgradient method, it is possible to use the fundamental inequality for the mirror descent method (Lemma 9.13) to establish convergence results under dynamic stepsize rules.

Theorem 9.18 (convergence of mirror descent with dynamic stepsizes). Suppose that Assumptions 9.1 and 9.3 hold and that $\| f^{\prime}(\mathbf{x}) \|_{*} \leq L_{f}$ for any $\mathbf{x} \in C$ for some $L_{f} ~ > ~ 0$ . Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the mirror descent method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ , and let $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ be the sequence of best achieved values defined in (9.19).

(a) $\begin{array}{r}{If{\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}} \to 0} \end{array}$ as $k \to \infty$ , then $f_{\mathrm{best}}^{k} f_{\mathrm{opt}}$ as $k \to \infty$

(b) $Ift_{k}$ is chosen as either (predefined diminishing stepsize)

$$
t_{k} = \frac{\sqrt{2 \sigma}}{L_{f} \sqrt{k + 1}}
$$

or (adaptive stepsize)

$$
t_{k} = \left\{\begin{array}{ll} \frac{\sqrt{2 \sigma}}{\| f^{\prime}(\mathbf{x}^{k}) \|_{*} \sqrt{k + 1}}, & f^{\prime}(\mathbf{x}^{k}) \neq \mathbf{0}, \\ \frac{\sqrt{2 \sigma}}{L_{f} \sqrt{k + 1}}, & f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}, \end{array} \right.
$$

then for all $k \geq 1$

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{L_{f}}{\sqrt{2 \sigma}} \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + 1 + \log(k + 1)}{\sqrt{k + 1}}.
$$

Proof. By the fundamental inequality for mirror descent (Lemma 9.13), we have, for all $n \geq 0$ 2

$$
t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{n + 1}) + \frac{t_{n}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.
$$

Summing the above inequality over $n = 0, 1, \ldots, k$ gives

$$
\sum_{n = 0}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.
$$

Using the inequalities $B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) \ge 0$ and $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}(n \leq k)$ , we obtain

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}}{\sum_{n = 0}^{k} t_{n}}.\tag{9.27}
$$

Since $\| f^{\prime}(\mathbf{x}^{n}) \|_{*} \leq L_{f}$ , we can deduce that

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{L_{f}^{2}}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}.
$$

Therefore, if $\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}} 0.$ , then $f_{\mathrm{best}}^{k} f_{\mathrm{opt}}$ as $k \to \infty$ , proving claim (a).

<sup>=0</sup>To show the validity of claim (b), note that for both stepsize rules we have $\begin{array}{r}{t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2} \leq \frac{2 \sigma}{n + 1}} \end{array}$ and $\begin{array}{r}{t_{n} \ge \frac{\sqrt{2 \sigma}}{L_{f} \sqrt{n + 1}}} \end{array}$ . Hence, by (9.27),

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{L_{f}}{\sqrt{2 \sigma}} \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}},
$$

which, combined with Lemma 8.27(a), yields the desired result.

Example 9.19 (mirror descent vs. projected subgradient—numerical example). Consider the problem

$$
\min \left\{\| \mathbf{Ax} - \mathbf{b} \|_{1}: \mathbf{x} \in \Delta_{n} \right\},\tag{9.28}
$$

where $\mathbf{A} \in \mathbb{R}^{n \times n}$ and b $\in \mathbb{R}^{n}$ . Following Example 9.17, we consider two methods. The first is the projected subgradient method where $\mathbb{R}^{n}$ is assumed to be endowed with the Euclidean $l_{2}{\mathrm{- norm}}$ . The update formula is given by

$$
\mathbf{x}^{k + 1} = P_{\Delta_{n}}(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})),
$$

with $f^{\prime}(\mathbf{x}^{k})$ taken as $\mathbf{A}^{T} \mathrm{sgn}(\mathbf{Ax}^{k} - \mathbf{b})$ and the stepsize $t_{k}$ chosen by the adaptive stepsize rule (in practice, $f^{\prime}(\mathbf{x}^{k})$ is never the zeros vector):

$$
t_{k} = \frac{\sqrt{2}}{\| f^{\prime}(\mathbf{x}^{k}) \|_{2} \sqrt{k + 1}}.
$$

The second method is mirror descent in which the underlying norm on $\mathbb{R}^{n}$ is the $l_{1}{\mathrm{- norm}}$ and $\omega$ is chosen to be the negative entropy function given in (9.25). In this case, the method has the form (see Example 9.17)

$$
x_{i}^{k + 1} = \frac{x_{i}^{k} e^{- t_{k} f_{i}^{\prime}(\mathbf{x}^{k})}}{\sum_{j = 1}^{n} x_{j}^{k} e^{- t_{k} f_{j}^{\prime}(\mathbf{x}^{k})}}, \quad i = 1, 2, \ldots, n,
$$

where here we take

$$
t_{k} = \frac{\sqrt{2}}{\| f^{\prime}(\mathbf{x}^{k}) \|_{\infty} \sqrt{k + 1}}.
$$

Note that the strong convexity parameter is $\sigma = 1$ in both settings. We created an instance of problem (9.28) with $n = 100$ by generating the components of A and b independently via a standard normal distribution. The values of $f(\mathbf{x}^{k}) -$ $f_{\mathrm{opt}}$ and $f_{\mathrm{best}}^{k} - f_{\mathrm{opt}}$ for both methods are described in Figure 9.1. Evidently, the non-Euclidean method, referred to as md, is superior to the Euclidean projected subgradient method (ps).

## 9.3 Mirror Descent for the Composite Model52

In this section we will consider a more general model than model (9.1), which was discussed in Sections 9.1 and 9.2. Consider the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) \equiv f(\mathbf{x}) + g(\mathbf{x})\},\tag{9.29}
$$

where the following set of assumptions is made on $f$ and $g$

Assumption 9.20 (properties of f and $^{g)}$ .

(A) $f, g : \mathbb{E}(- \infty, \infty]$ are proper closed and convex.

(B) dom $(g) \subseteq \operatorname{int}(\operatorname{dom}(f))$ .

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/142352ef8b015ddcb90cc6d3d4f1a091916b335924b100c1b403ca1fbe560398.jpg)

![Figure 9.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/70a730cfe4c48070503ef35ce0b736e6b4be660ad98bc6e675d2b2bbcf9ff285.jpg)

Figure 9.1. The values $f(\mathbf{x}^{k}) - f_{\mathrm{opt}}$ and $f_{\mathrm{best}}^{k} \mathrm{~ - ~} f_{\mathrm{opt}}$ generated by the mirror descent and projected subgradient methods.

(C) $\| f^{\prime}(\mathbf{x}) \|_{*} \leq L_{f}$ for any $\mathbf{x} \in \mathrm{dom}(g){\mathsf{\}}(L_{f} > 0).$ 53

(D) The optimal set of (9.29) is nonempty and denoted by $X^{\ast}$ . The optimal value of the problem is denoted by $F_{\mathrm{opt}}$

We will also assume, as usual, that we have at our disposal a convex function ω that satisfies the following properties, which are a slight adjustment of the properties in Assumption 9.3.

Assumption 9.21 (properties of $\omega)$ .

- $\omega$ is proper closed and convex.

- $\omega$ is diferentiable over dom $(\partial \omega)$ .

- dom $(g) \subseteq \mathrm{dom}(\omega)$

$\omega + \delta_{\mathrm{dom}(g)}$ is σ-strongly convex $(\sigma > 0)$

We can obviously ignore the composite structure of problem (9.29) and just try to employ the mirror descent method on the function $F = f + g$ with dom(g) taking the role of C:

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in C} \left\{\langle f^{\prime}(\mathbf{x}^{k}) + g^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + \frac{1}{t_{k}} B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\}.\tag{9.30}
$$

However, employing the above scheme might be problematic. First, we did not assume that $C = \operatorname{dom}(g)$ is closed, and thus the argmin in (9.30) might be empty. Second, even if the update step is well defined, we did not assume that $g$ is Lipschitz over $C$ like we did on $f$ in Assumption 9.20(C); this is a key element in the convergence analysis of the mirror descent method. Final ${\mathrm{ly}},$ even if $g$ is Lipschitz over $C,$ it might be that the Lipschitz constant of the sum function $F = f + g$ is much larger than the Lipschitz constant of $f,$ , and our objective will be to define a method whose eficiency estimate will depend only on the Lipschitz constant of $f$ over dom $(g)$

Instead of linearizing both $f$ and $^{g,}$ as is done in (9.30), we will linearize $f$ and keep $g$ as it is. This leads to the following scheme:

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{\langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + g(\mathbf{x}) + \frac{1}{t_{k}} B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\},\tag{9.31}
$$

which can also be written as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}) - \nabla \omega(\mathbf{x}^{k}), \mathbf{x} \rangle + t_{k} g(\mathbf{x}) + \omega(\mathbf{x}) \right\}.
$$

The algorithm that performs the above update step will be called the mirror- $C$ method.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Mirror-C Method
Initialization: pick  $\mathbf{x}^{0}\in\mathrm{dom}(g)\cap\mathrm{dom}(\partial\omega)$ .
General step: for any  $k=0,1,2,\ldots$  execute the following steps:
(a) pick a stepsize  $t_{k}&gt;0$  and a subgradient  $f'(\mathbf{x}^{k})\in\partial f(\mathbf{x}^{k})$ ;
(b) set
 $\mathbf{x}^{k+1}=\operatorname{argmin}_{\mathbf{x}}\left\{\langle t_{k}f^{\prime}(\mathbf{x}^{k})-\nabla\omega(\mathbf{x}^{k}),\mathbf{x}\rangle+t_{k}g(\mathbf{x})+\omega(\mathbf{x})\right\}$
</div>

(9.32)

Remark 9.22. The update formula (9.32) can also be rewritten as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + t_{k} g(\mathbf{x}) + B_{\omega}(\mathbf{x}, \mathbf{x}^{k}) \right\}.\tag{9.33}
$$

Remark 9.23 (Euclidean setting—proximal subgradient method). When the underlying space $\mathbb{E}$ is Euclidean and $\begin{array}{r}{\omega(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|^{2}} \end{array}$ , then the update formula (9.33) reduces to

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{\langle t_{k} f^{\prime}(\mathbf{x}^{k}), \mathbf{x} \rangle + t_{k} g(\mathbf{x}) + \frac{1}{2} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} \right\},
$$

which, after some rearrangement of terms and removal of constant terms, takes the form

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{t_{k} g(\mathbf{x}) + \frac{1}{2} \left\| \mathbf{x} -[\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})] \right\|^{2} \right\}.
$$

By the definition of the prox operator (see Chapter 6), the last equation can be rewritten as

$$
\mathbf{x}^{k + 1} = \mathrm{prox}_{t_{k} g}(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})).
$$

Thus, at each iteration the method takes a step toward minus of the subgradient followed by a prox step. The resulting method is called the proximal subgradient method. The method will be discussed extensively in Chapter 10 in the case where $f$ possesses some Differentiability properties.

Of course, the mirror-C method coincides with the mirror descent method when taking $g = \delta_{C}$ with C being a nonempty closed and convex set. We begin by showing that the mirror-C method is well defined, meaning that the minimum in (9.32) is uniquely attained at dom(g) ∩ dom(∂ω).

Theorem 9.24 (mirror-C is well defined). Suppose that Assumptions 9.20 and 9.21 hold. Let $\mathbf{a} \in \mathbb{E}^{*}$ . Then the problem

$$
\min_{\mathbf{x} \in \mathbb{E}} \{\langle \mathbf{a}, \mathbf{x} \rangle + g(\mathbf{x}) + \omega(\mathbf{x})\}
$$

has a unique minimizer in dom(g) ∩ dom(∂ω).

Proof. The proof follows by invoking Lemma 9.7 with $\psi(\mathbf{x}) \equiv \langle \mathbf{a}, \mathbf{x} \rangle + g(\mathbf{x})$ 0

The analysis of the mirror-C method is based on arguments similar to those used in Section 9.2 to analyze the mirror descent method. We begin by proving a technical lemma establishing an inequality similar to the one derived in Lemma 9.14. Note that in addition to our basic assumptions, we assume that $g$ is a nonnegative function and that the stepsizes are nonincreasing.

Lemma 9.25. Suppose that Assumptions 9.20 and 9.21 hold and that g is a nonnegative function. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror-C method with positive nonincreasing stepsizes $\{t_{k}\}_{k \geq 0}$ . Then for any $\mathbf{x}^{*} \in X^{*}$ and $k \geq 0$

$$
\min_{n = 0, 1, \ldots, k} F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \leq \frac{t_{0} g(\mathbf{x}^{0}) + B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}}{\sum_{n = 0}^{k} t_{n}}.\tag{9.34}
$$

Proof. By the update formula (9.33) and the non-Euclidean second prox theorem (Theorem 9.12) invoked with b ${\bf \Pi} ={\bf x}^{n},{\bf a} ={\bf x}^{n + 1}$ , and $\psi(\mathbf{x}) \equiv t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x} \rangle + t_{n} g(\mathbf{x})$ ， we have

$$
\langle \nabla \omega(\mathbf{x}^{n}) - \nabla \omega(\mathbf{x}^{n + 1}), \mathbf{u} - \mathbf{x}^{n + 1} \rangle \leq t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{u} - \mathbf{x}^{n + 1} \rangle + t_{n} g(\mathbf{u}) - t_{n} g(\mathbf{x}^{n + 1}).\tag{9.35}
$$

Invoking the three-points lemma (Lemma 9.11) with $\mathbf{a} = \mathbf{x}^{n + 1}, \mathbf{b} = \mathbf{x}^{n}$ , and $\mathbf c = \mathbf u$ yields

$$
\langle \nabla \omega(\mathbf{x}^{n}) - \nabla \omega(\mathbf{x}^{n + 1}), \mathbf{u} - \mathbf{x}^{n + 1} \rangle = B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) + B_{\omega}(\mathbf{x}^{n + 1}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n}),
$$

which, combined with (9.35), gives

$$
B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) + B_{\omega}(\mathbf{x}^{n + 1}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) \leq t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{u} - \mathbf{x}^{n + 1} \rangle + t_{n} g(\mathbf{u}) - t_{n} g(\mathbf{x}^{n + 1}).
$$

Therefore,

$$
\begin{array}{rl} & t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{u} \rangle + t_{n} g(\mathbf{x}^{n + 1}) - t_{n} g(\mathbf{u}) \\ & \leq B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) - B_{\omega}(\mathbf{x}^{n + 1}, \mathbf{x}^{n}) + t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{n + 1} \rangle \\ & \leq B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{n} \|^{2} + t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{n + 1} \rangle \\ & = B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{n} \|^{2} + \left\langle \frac{t_{n}}{\sqrt{\sigma}} f^{\prime}(\mathbf{x}^{n}), \sqrt{\sigma}(\mathbf{x}^{n} - \mathbf{x}^{n + 1}) \right\rangle \\ & \leq B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) - \frac{\sigma}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{n} \|^{2} + \frac{t_{n}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2} + \frac{\sigma}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{n} \|^{2} \\ & = B_{\omega}(\mathbf{u}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{u}, \mathbf{x}^{n + 1}) + \frac{t_{n}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.\end{array}
$$

Plugging in $\mathbf{u} = \mathbf{x}^{*}$ and using the subgradient inequality, we obtain

$$
t_{n} \left[f(\mathbf{x}^{n}) + g(\mathbf{x}^{n + 1}) - F_{\mathrm{opt}} \right] \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{n}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{n + 1}) + \frac{t_{n}^{2}}{2 \sigma} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.
$$

Summing the above over $n = 0, 1, \ldots, k$ 2

$$
\sum_{n = 0}^{k} t_{n} \left[f(\mathbf{x}^{n}) + g(\mathbf{x}^{n + 1}) - F_{\mathrm{opt}} \right] \leq B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) - B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{k + 1}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.
$$

Adding the term $t_{0} g(\mathbf{x}^{0}) - t_{k} g(\mathbf{x}^{k + 1})$ to both sides and using the nonnegativity of the Bregman distance, we get

$$
t_{0}(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}) + \sum_{n = 1}^{k}[t_{n} f(\mathbf{x}^{n}) + t_{n - 1} g(\mathbf{x}^{n}) - t_{n} F_{\mathrm{opt}}]
$$

$$
\leq t_{0} g(\mathbf{x}^{0}) - t_{k} g(\mathbf{x}^{k + 1}) + B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}.
$$

Using the fact that $t_{n} \leq t_{n - 1}$ and the nonnegativity of $g(\mathbf{x}^{k + 1})$ , we conclude that

$$
\sum_{n = 0}^{k} t_{n} \left[F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \right] \leq t_{0} g(\mathbf{x}^{0}) + B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2},
$$

which, combined with the fact that

$$
\left(\sum_{n = 0}^{k} t_{n}\right) \left(\min_{n = 0, 1, \dots, k} F(\mathbf{x}^{n}) - F_{\mathrm{opt}}\right) \leq \sum_{n = 0}^{k} t_{n} \left[F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \right],
$$

implies the inequality (9.34).

Using Lemma 9.25, it is now easy to derive a convergence result under the assumption that the number of iterations is fixed.

Theorem 9.26 $(O(1 /{\sqrt{N}})$ rate of convergence of mirror-C with fixed amount of iterations). Suppose that Assumptions 9.20 and 9.21 hold and that $g$ is nonnegative. Assume that $B_{\omega}(\mathbf{x}, \mathbf{x}^{0})$ is bounded above over dom(g), and let $\Theta(\mathbf{x}^{0})$ satisfy

$$
\Theta(\mathbf{x}^{0}) \geq \max_{\mathbf{x} \in \operatorname{dom}(g)} B(\mathbf{x}, \mathbf{x}^{0}).
$$

Suppose that $g(\mathbf{x}^{0}) = 0$ . Let N be a positive integer, and let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror-C method with constant stepsize

$$
t_{k} = \frac{\sqrt{2 \Theta(\mathbf{x}^{0}) \sigma}}{L_{f} \sqrt{N}}.\tag{9.36}
$$

Then

$$
\min_{n = 0, 1, \dots, N - 1} F(\mathbf{x}^{n}) - F_{\text{opt}} \leq \frac{\sqrt{2 \Theta(\mathbf{x}^{0})} L_{f}}{\sqrt{\sigma} \sqrt{N}}.
$$

Proof. By Lemma 9.25, using the fact that $g({\bf x}^{0}) ~ = ~ 0$ and the inequalities $\| f^{\prime}(\mathbf{x}^{n}) \|_{*} \leq L_{f}$ and $B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) \leq \Theta(\mathbf{x}^{0})$ , we have

$$
\min_{n = 0, 1, \dots, N - 1} F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \leq \frac{\Theta(\mathbf{x}^{0}) + \frac{L_{f}^{2}}{2 \sigma} \sum_{n = 0}^{N - 1} t_{n}^{2}}{\sum_{n = 0}^{N - 1} t_{n}}.
$$

Plugging the expression (9.36) for the stepsizes into the above inequality, the result follows.

We can also establish a rate of convergence of the mirror-C method with a dynamic stepsize rule.

Theorem 9.27 (O(log $k /{\sqrt{k}})$ rate of convergence of mirror-C with dynamic stepsizes). Suppose that Assumptions 9.20 and 9.21 hold and that $g$ is nonnegative. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the mirror-C method with stepsizes $\{t_{k}\}_{k \geq 0}$ chosen as

$$
t_{k} = \frac{\sqrt{2 \sigma}}{L_{f} \sqrt{k + 1}}.
$$

Then for all $k \geq 1$

$$
\min_{n = 0, 1, \ldots, k} F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \leq \frac{L_{f}}{\sqrt{2 \sigma}} \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{\sqrt{2 \sigma}}{L_{f}} g(\mathbf{x}^{0}) + 1 + \log(k + 1)}{\sqrt{k + 1}}.\tag{9.37}
$$

Proof. By Lemma 9.25, taking into account the fact that $\begin{array}{r}{t_{0} = \frac{\sqrt{2 \sigma}}{L_{f}}} \end{array}$ 2

$$
\min_{n = 0, 1, \ldots, k} F(\mathbf{x}^{n}) - F_{\mathrm{opt}} \leq \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{\sqrt{2 \sigma}}{L_{f}} g(\mathbf{x}^{0}) + \frac{1}{2 \sigma} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2}}{\sum_{n = 0}^{k} t_{n}},\tag{9.38}
$$

which, along with the relations $\begin{array}{r}{t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|_{*}^{2} \leq \frac{2 \sigma}{n + 1}} \end{array}$ and $\begin{array}{r}{t_{n} = \frac{\sqrt{2 \sigma}}{L_{f} \sqrt{n + 1}}} \end{array}$ , yields the inequality

$$
\min_{n = 0, 1, \ldots, k} F(\mathbf{x}^{n}) - f_{\text{opt}} \leq \frac{L_{f}}{\sqrt{2 \sigma}} \frac{B_{\omega}(\mathbf{x}^{*}, \mathbf{x}^{0}) + \frac{\sqrt{2 \sigma}}{L_{f}} g(\mathbf{x}^{0}) + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}}.
$$

The result (9.37) now follows by invoking Lemma 8.27(a).

Example 9.28. Suppose that the underlying space is $\mathbb{R}^{n}$ endowed with the Euclidean $l_{2} \mathrm{- norm}$ . Let $f : \mathbb { R } ^ { n } $ <sup>R</sup> be a convex function, which is Lipschitz over $\mathbb{R}^{n}$ implying that there exists $L_{f} > 0$ for which $\| f^{\prime}(\mathbf{x}) \|_{2} \leq L_{f}$ for all $\mathbf{x} \in \mathbb{R}^{n}$ . Now consider the problem

$$
\min_{\mathbf{x} \in \mathbb{R}_{+ +}^{n}} \left\{F(\mathbf{x}) \equiv f(\mathbf{x}) + \sum_{i = 1}^{n} \frac{1}{x_{i}} \right\}
$$

with $\omega$ chosen as $\begin{array}{r}{\omega(\mathbf{x}) = \frac{1}{2} \| \mathbf{x} \|_{2}^{2}} \end{array}$ . In this case, the mirror descent and mirror-C methods coincide with the projected subgradient and proximal subgradient methods, respectively. It is not possible to employ the projected subgradient method on the problem—it is not even clear what is the feasible set $C.$ . If we take it as the open set $\mathbb{R}_{+ +}^{n}$ , then projections onto $C$ will in general not be in $C.$ . In any case, since $F$ is obviously not Lipschitz, no convergence is guaranteed. On the other hand, employing the proximal subgradient method is definitely possible by taking $\begin{array}{r}{g(\mathbf{x}) \equiv \sum_{i = 1}^{n} \frac{1}{x_{i}} + \delta_{\mathbb{R}_{+ +}^{n}}} \end{array}$ . Both Assumptions 9.20 and 9.21 hold for $f, g$ and $\begin{array}{r}{\omega(\mathbf{x}) = \frac{1}{2} \Vert \mathbf{x} \Vert^{2}} \end{array}$ , and in addition $g$ is nonnegative. The resulting method is

$$
\mathbf{x}^{k + 1} = \mathrm{prox}_{t_{k} g} \left(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})\right).
$$

The computation of $\mathrm{prox}_{t_{k} g}$ amounts to solving n cubic scalar equations.

Example 9.29 (projected subgradient vs. proximal subgradient). Suppose that the underlying space is $\mathbb{R}^{n}$ endowed with the Euclidean $l_{2}{\mathrm{- norm}}$ and consider the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{F(\mathbf{x}) \equiv \| \mathbf{Ax} - \mathbf{b} \|_{1} + \lambda \| \mathbf{x} \|_{1} \right\},\tag{9.39}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^{m}$ , and $\lambda > 0$ . We will consider two possible methods to solve the problem:

- projected subgradient employed on problem (9.39), where here $C = \mathbb{R}^{n}$ The method takes the form (when making the choice of the subgradient of $\| \mathbf{y} \|_{1}$ as $\operatorname{sgn}(\mathbf{y}))$

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - t_{k}(\mathbf{A}^{T} \operatorname{sgn}(\mathbf{Ax}^{k} - \mathbf{b}) + \lambda \operatorname{sgn}(\mathbf{x})).
$$

The stepsize is chosen according to Theorem 8.28 as $\begin{array}{r}{t_{k} = \frac{1}{\| F^{\prime}(\mathbf{x}^{k}) \|_{2} \sqrt{k + 1}}} \end{array}$

- proximal subgradient, where we take $f(\mathbf{x}) = \| \mathbf{Ax} - \mathbf{b} \|_{1}$ and $g(\mathbf{x}) = \lambda \| \mathbf{x} \|_{1}$ so that $F = f + g$ . The method then takes the form

$$
\mathbf{x}^{k + 1} = \operatorname{prox}_{s_{k} g}(\mathbf{x}^{k} - s_{k} \mathbf{A}^{T} \operatorname{sgn}(\mathbf{Ax}^{k} - \mathbf{b})).
$$

Since $g(\mathbf{x}) = \lambda \| \mathbf{x} \|_{1}$ , it follows that prox $\zeta_{s_{k} g}$ is a soft thresholding operator. Specifically, by Example 6.8, $\mathrm{prox}_{s_{k} g} = \mathcal{T}_{\lambda s_{k}}^{-},$ , and hence the general update rule becomes

$$
\mathbf{x}^{k + 1} = \mathcal{T}_{\lambda s_{k}}(\mathbf{x}^{k} - s_{k} \mathbf{A}^{T} \mathrm{sgn}(\mathbf{Ax}^{k} - \mathbf{b})).
$$

The stepsize is chosen as $\begin{array}{r}{s_{k} = \frac{1}{\| f^{\prime}(\mathbf{x}^{k}) \|_{2} \sqrt{k + 1}}} \end{array}$

A priori it seems that the proximal subgradient method should have an advantage over the projected subgradient method since the eficiency estimate bound of the proximal subgradient method depends on $L_{f},$ while the corresponding constant for the projected subgradient method depends on the larger constant $L_{F}$ . This observation is also quite apparent in practice. We created an instance of problem (9.39) with $m = 10, n = 15$ by generating the components of A and b independently via a standard normal distribution. The values of $F(\mathbf{x}^{k}){-} F_{\mathrm{opt}}$ for both methods are described in Figure 9.2. Evidently, in this case, the proximal subgradient method is better by orders of magnitude than the projected subgradient method.

![Figure 9.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/b3936c93b80388dacbbf938a9b0ff0ea690a4d56b6239b16fae2f44564e9b103.jpg)  
Figure 9.2. First 1000 iterations of the projected and proximal subgradient methods employed on problem (9.39). The y-axis describes (in log scale) the quantity $F(\mathbf{x}^{k}) - F_{\mathrm{opt}}$


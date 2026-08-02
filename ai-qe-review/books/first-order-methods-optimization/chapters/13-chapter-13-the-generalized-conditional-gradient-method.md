---
title: "Chapter 13 \u2014 The Generalized Conditional Gradient Method"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 13
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 16315
source_line_end: 17395
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 0
caption_derived_image_alt: 1
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

# Chapter 13 — The Generalized Conditional Gradient Method

> [[../README|本书目录]] · [[12-chapter-12-dual-based-proximal-gradient-methods|上一章]] · [[14-chapter-14-alternating-minimization|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 16315–17395。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 3；sufficient × 7。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 13 The Generalized Conditional Gradient Method

Underlying Spaces: In this chapter, all the underlying spaces are Euclidean.

## 13.1 The Frank–Wolfe/Conditional Gradient Method

Consider the problem

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\},\tag{13.1}
$$

where $C \subseteq \mathbb{E}$ is a nonempty convex and compact set and $f : \mathbb{E}(- \infty, \infty]$ is a convex function satisfying $C \subseteq \operatorname{dom}(f)$ . We further assume that dom(f) is open and that $f$ is diferentiable over dom(f ). One method that can be employed in order to solve the problem is the projected gradient method (see Section 10.2) whose update step is

$$
\mathbf{x}^{k + 1} = P_{C}(\mathbf{x}^{k} - t_{k} \nabla f(\mathbf{x}^{k})),
$$

with $t_{k}$ being an appropriately chosen stepsize. In this chapter we will consider an alternative approach that does not require the evaluation of the orthogonal projection operator at each iteration. Instead, the approach, known as the conditional gradient method or $Frank – Wolfe$ algorithm, computes the next step as a convex combination of the current iterate and a minimizer of a linearized version of the objective function over C.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Conditional Gradient Method
Initialization: pick  $x^{0} \in C$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) compute  $p^{k} \in \arg\min_{p \in C} \langle p, \nabla f(x^{k}) \rangle$ ;
(b) choose  $t_{k} \in[0, 1]$  and set  $x^{k+1} = x^{k} + t_{k}(p^{k} - x^{k})$ .
</div>

The conditional gradient approach is potentially beneficial in cases where computation of a linear oracle over the feasible set (that is, computation of a minimizer of a linear function over $C)$ is a simpler task than evaluating the orthogonal projection onto C. We will actually analyze an extension of the method that tackles the problem of minimizing a composite function $f + g,$ where the case $g = \delta_{C}$ brings us back to the model (13.1).

## 13.2 The Generalized Conditional Gradient Method

## 13.2.1 Model and Method

Consider the composite problem

$$
\min \left\{F(\mathbf{x}) \equiv f(\mathbf{x}) + g(\mathbf{x}) \right\},\tag{13.2}
$$

where we assume the following set of properties.

Assumption 13.1.

(A) $g : \mathbb{E}(- \infty, \infty]$ is proper closed and convex and dom $(g)$ is compact.

(B) $f : \mathbb{E} \to(- \infty, \infty]$ is $L_{f}$ -smooth over dom $(f) \(L_{f} > 0)$ , which is assumed to be an open and convex set satisfying dom $(g) \subseteq \operatorname{dom}(f)$

(C) The optimal set of problem (13.2) is nonempty and denoted by $X^{*}$ . The optimal value of the problem is denoted by $F_{\mathrm{opt}}$

It is not dificult to deduce that property (C) is implied by properties $\mathrm{(A)}$ and (B). The generalized conditional gradient method for solving the composite model (13.2) is similar to the conditional gradient method, but instead of linearizing the entire objective function, the algorithm computes a minimizer of the sum of the linearized smooth part $f$ around the current iterate and leaves $g$ unchanged.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Generalized Conditional Gradient Method
Initialization: pick  $\mathbf{x}^{0}\in\mathrm{dom}(g)$ .
General step: for any  $k=0,1,2,\ldots$  execute the following steps:
(a) compute  $p^{k}\in\operatorname{argmin}_{p\in E}\left\{\langle\mathbf{p},\nabla f(\mathbf{x}^{k})\rangle+g(\mathbf{p})\right\}$ ;
(b) choose  $t_{k}\in[0,1]$  and set  $x^{k+1}=x^{k}+t_{k}(p^{k}-x^{k})$ .
</div>

## 13.2.2 The Conditional Gradient Norm

Throughout this chapter we will use the following notation:

$$
\mathbf{p}(\mathbf{x}) \in \operatorname{argmin}_{\mathbf{p}} \left\{\langle \mathbf{p}, \nabla f(\mathbf{x}) \rangle + g(\mathbf{p}) \right\}.\tag{13.3}
$$

Of course, $\mathbf{p}(\mathbf{x})$ is not uniquely defined in the sense that the above minimization problem might have multiple optimal solutions. We assume that there exists some rule for choosing an optimal solution whenever the optimal set of (13.3) is not a singleton and that the vector $\mathbf{p}^{k}$ computed by the generalized conditional gradient method is chosen by the same rule, meaning that $\mathbf{\bar{p}}^{k} = \mathbf{p}(\mathbf{x}^{k})$ . We can write the update step of the generalized conditional gradient method as

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} + t_{k}(\mathbf{p}(\mathbf{x}^{k}) - \mathbf{x}^{k}).
$$

A natural optimality measure in the context of proximal gradient methods is the gradient mapping (see Section 10.3.2). However, the analysis of the conditional gradient method relies on a different optimality measure, which we will refer to as the conditional gradient norm.

Definition 13.2 (conditional gradient norm). Suppose that f and g satisfy properties (A) and (B) of Assumption 13.1. Then the conditional gradient norm is the function S : dom(f) → <sup>R</sup> defined by

$$
S(\mathbf{x}) \equiv \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}(\mathbf{x}) \rangle + g(\mathbf{x}) - g(\mathbf{p}(\mathbf{x})).
$$

Remark 13.3. The conditional gradient norm obviously depends on f and $^{g,}$ , so a more precise notation would be $S^{f, g}(\mathbf{x})$ . However, since the identities of f and g will be clear from the context, we will keep the notation $S(\mathbf{x})$

Remark 13.4. By the definition of $\mathbf{p}(\mathbf{x})$ (equation (13.3)), we can also write $S(\mathbf{x})$ as

$$
S(\mathbf{x}) = \max_{\mathbf{p} \in \mathbb{E}} \left\{\langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p} \rangle + g(\mathbf{x}) - g(\mathbf{p}) \right\}.\tag{13.4}
$$

The following lemma shows how to write the conditional gradient norm in terms of the conjugate of $g.$ .

Lemma 13.5. Suppose that f and g satisfy properties (A) and (B) of Assumption 13.1. Then for any $\mathbf{x} \in \operatorname{dom}(f)$ ，

$$
S(\mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + g(\mathbf{x}) + g^{*}(- \nabla f(\mathbf{x})).\tag{13.5}
$$

Proof. Follows by the definition of the conjugate function:

$$
\begin{array}{l} S(\mathbf{x}) = \max_{\mathbf{p} \in \mathbb{E}} \{\langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p} \rangle + g(\mathbf{x}) - g(\mathbf{p})\} \\ \qquad = \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + g(\mathbf{x}) + \max_{\mathbf{p} \in \mathbb{E}} \{\langle - \nabla f(\mathbf{x}), \mathbf{p} \rangle - g(\mathbf{p})\} \\ \qquad = \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + g(\mathbf{x}) + g^{*}(- \nabla f(\mathbf{x})).\quad \square \end{array}
$$

A direct consequence of Lemma 13.5 is that $S(\cdot)$ is an optimality measure in the sense that it is always nonnegative and is equal to zero only at stationary points of problem (13.2).

Theorem 13.6 (conditional gradient norm as an optimality measure). Suppose that f and g satisfy properties (A) and (B) of Assumption 13.1. Then

(a) $S(\mathbf{x}) \geq 0$ for any $\mathbf{x} \in \operatorname{dom}(f)$

(b) $S(\mathbf{x}^{*}) = 0$ if and only $if - \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*})$ , that is, if and only if $\mathbf{x}^{*}$ is a stationary point of problem (13.2).

Proof. (a) Follows by the expression (13.5) for the conditional gradient norm and Fenchel’s inequality (Theorem 4.6).

(b) By part (a), it follows that $S(\mathbf{x}^{*}) = 0$ if and only if $S(\mathbf{x}^{*}) \leq 0$ , which is the same as the relation (using the expression (13.4) for $S(\mathbf{x}^{*}))$ )

$$
\langle \nabla f(\mathbf{x}^{*}), \mathbf{x}^{*} - \mathbf{p} \rangle + g(\mathbf{x}^{*}) - g(\mathbf{p}) \leq 0 \text{for all} \mathbf{p} \in \mathbb{E}.
$$

After some rearrangement of terms, the above can be rewritten as

$$
g(\mathbf{p}) \geq g \left(\mathbf{x}^{*}\right) + \langle - \nabla f \left(\mathbf{x}^{*}\right), \mathbf{p} - \mathbf{x}^{*} \rangle,
$$

which is equivalent to the relation $- \nabla f(\mathbf{x}^{*}) \in \partial g(\mathbf{x}^{*})$ , namely, to stationarity (see Definition 3.73).

The basic inequality that will be used in the analysis of the generalized conditional gradient method is the following recursive inequality.

Lemma 13.7 (fundamental inequality for generalized conditional gradient). Suppose that f and g satisfy properties $of \left(\mathrm{A} \right)$ and (B) of Assumption 13.1. $Let \mathbf{x} \in \mathrm{dom}(g)$ and $t \in[0, 1]$ . Then

$$
F(\mathbf{x} + t(\mathbf{p}(\mathbf{x}) - \mathbf{x})) \leq F(\mathbf{x}) - tS(\mathbf{x}) + \frac{t^{2} L_{f}}{2} \| \mathbf{p}(\mathbf{x}) - \mathbf{x} \|^{2}.\tag{13.6}
$$

Proof. Using the descent lemma (Lemma 5.7), the convexity of $^{g,}$ and the notation $\mathbf{p}^{+} = \mathbf{p}(\mathbf{x})$ , we can write the following:

$$
\begin{array}{rl} & F(\mathbf{x} + t(\mathbf{p}^{+} - \mathbf{x})) = f(\mathbf{x} + t(\mathbf{p}^{+} - \mathbf{x})) + g(\mathbf{x} + t(\mathbf{p}^{+} - \mathbf{x})) \\ & \quad \leq f(\mathbf{x}) - t \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}^{+} \rangle + \frac{t^{2} L_{f}}{2} \| \mathbf{p}^{+} - \mathbf{x} \|^{2} + g((1 - t) \mathbf{x} + t \mathbf{p}^{+}) \\ & \quad \leq f(\mathbf{x}) - t \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}^{+} \rangle + \frac{t^{2} L_{f}}{2} \| \mathbf{p}^{+} - \mathbf{x} \|^{2} +(1 - t) g(\mathbf{x}) + tg(\mathbf{p}^{+}) \\ & \quad = F(\mathbf{x}) - t(\langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}^{+} \rangle + g(\mathbf{x}) - g(\mathbf{p}^{+})) + \frac{t^{2} L_{f}}{2} \| \mathbf{p}^{+} - \mathbf{x} \|^{2} \\ & \quad = F(\mathbf{x}) - tS(\mathbf{x}) + \frac{t^{2} L_{f}}{2} \| \mathbf{p}^{+} - \mathbf{x} \|^{2}.\quad \square \end{array}
$$

## 13.2.3 Convergence Analysis in the Nonconvex Case

Note that we do not assume at this point that $f$ is convex, and therefore convergence (if any) will be proven to stationary points. Before we delve into the convergence analysis, we mention the different options of stepsize strategies that will be considered.

- Predefined diminishing stepsize. $\begin{array}{r}{t_{k} = \frac{2}{k + 2}} \end{array}$

- Adaptive stepsize. $\begin{array}{r}{t_{k} = \operatorname{min} \left\{1, \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}} \right\}} \end{array}$

- Exact line search. $\begin{array}{r}{t_{k} \in \operatorname{argmin}_{t \in[0, 1]} F(\mathbf{x}^{k} + t(\mathbf{p}^{k} - \mathbf{x}^{k})).} \end{array}$

The motivation for considering the adaptive stepsize comes from the fundamental inequality (13.6)—it is easy to verify that $t_{k} =$ min $\begin{array}{r}{\left\{1, \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}} \right\}} \end{array}$ is the minimizer of the right-hand side of (13.6) w.r.t. $t \in[0, 1]$ when $\mathbf{x} = \mathbf{x}^{k}$ . Much like the analysis of the proximal gradient method, the convergence of the generalized conditional gradient method is based on a sufficient decrease property.

Lemma 13.8 (sufficient decrease for the generalized conditional gradient method). Suppose that f and g satisfy properties $\mathrm{(A)}$ and (B) of Assumption 13.1, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the generalized conditional gradient method for solving problem (13.2) with stepsizes chosen by either the adaptive or exact line search strategies. Then for any $k \geq 0$

$$
F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2} \min \left\{S(\mathbf{x}^{k}), \frac{S^{2}(\mathbf{x}^{k})}{L_{f} \Omega^{2}} \right\},\tag{13.7}
$$

where Ω be an upper bound on the diameter of dom(g):

$$
\Omega \geq \max_{\mathbf{x}, \mathbf{y} \in \operatorname{dom}(g)} \| \mathbf{x} - \mathbf{y} \|.
$$

Proof. Let $k \geq 0$ and let $\tilde{\mathbf{x}}^{k} = \mathbf{x}^{k} + s_{k} \big(\mathbf{p}^{k} - \mathbf{x}^{k} \big)$ , where

$$
s_{k} = \min \left\{1, \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}} \right\}.
$$

By the fundamental inequality (13.6) invoked with $\mathbf{x} = \mathbf{x}^{k}$ and $t = s_{k}$ , we have

$$
F(\mathbf{x}^{k}) - F(\tilde{\mathbf{x}}^{k}) \geq s_{k} S(\mathbf{x}^{k}) - \frac{s_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}.\tag{13.8}
$$

There are two options: Either $\begin{array}{r}{\frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}} \leq 1} \end{array}$ , and in this case $\begin{array}{r}{s_{k} = \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}}} \end{array}$ and hence, by (13.8),

$$
F(\mathbf{x}^{k}) - F(\tilde{\mathbf{x}}^{k}) \geq \frac{S^{2}(\mathbf{x}^{k})}{2L_{f} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}} \geq \frac{S^{2}(\mathbf{x}^{k})}{2L_{f} \Omega^{2}}.
$$

${\mathrm{Or}},$ on the other hand, if

$$
\frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}} \geq 1,\tag{13.9}
$$

then $s_{k} = 1$ , and by (13.8),

$$
F(\mathbf{x}^{k}) - F(\tilde{\mathbf{x}}^{k}) \geq S(\mathbf{x}^{k}) - \frac{L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2} \stackrel{(13.9)}{\geq} \frac{1}{2} S(\mathbf{x}^{k}).
$$

Combining the two cases, we obtain

$$
F(\mathbf{x}^{k}) - F(\tilde{\mathbf{x}}^{k}) \geq \frac{1}{2} \min \left\{S(\mathbf{x}^{k}), \frac{S^{2}(\mathbf{x}^{k})}{L_{f} \Omega^{2}} \right\}.\tag{13.10}
$$

If the adaptive stepsize strategy is used, then $\tilde{\mathbf{x}}^{k} = \mathbf{x}^{k + 1}$ and (13.10) is the same as (13.7). If an exact line search strategy is employed, then

$$
F(\mathbf{x}^{k + 1}) = \min_{t \in[0, 1]} F(\mathbf{x}^{k} + t(\mathbf{p}^{k} - \mathbf{x}^{k})) \leq F(\mathbf{x}^{k} + s_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) = F(\tilde{\mathbf{x}}^{k}),
$$

which, combined with (13.10), implies that also in this case (13.7) holds.

Using Lemma 13.8 we can establish the main convergence result for the generalized conditional gradient method with stepsizes chosen by either the adaptive or exact line search strategies.

Theorem 13.9 (convergence of the generalized conditional gradient). Suppose that Assumption 13.1 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the generalized conditional gradient method for solving problem (13.2) with stepsizes chosen by either the adaptive or exact line search strategies. Then

(a) for any $k \geq 0, F(\mathbf{x}^{k}) \geq F(\mathbf{x}^{k + 1})$ and $F(\mathbf{x}^{k}) > F(\mathbf{x}^{k + 1}) \if \ \mathbf{x}^{k}$ is not a stationary point of problem (13.2);

(b) $S(\mathbf{x}^{k}) 0$ as $k \infty;$

(c) for any $k \geq 0$

$$
\min_{n = 0, 1, \dots, k} S(\mathbf{x}^{n}) \leq \max \left\{\frac{2(F(\mathbf{x}^{0}) - F_{\text{opt}})}{k + 1}, \frac{\sqrt{2L_{f} \Omega^{2}(F(\mathbf{x}^{0}) - F_{\text{opt}})}}{\sqrt{k + 1}} \right\},\tag{13.11}
$$

where Ω is an upper bound on the diameter of dom(g);

(d) all limit points of the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ are stationary points of problem (13.2).

Proof. (a) The monotonicity of $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ is a direct result of the sufficient decrease inequality (13.7) and the nonnegativity of $S(\mathbf{x}^{k})$ (Theorem $\mathrm{13.6(a)})$ . As for the second claim, if $\mathbf{x}^{k}$ is not a stationary point of problem (13.2), then $S(\mathbf{x}^{k}) > 0$ (see Theorem 13.6(b)), and hence, by the sufficient decrease inequality, $F(\mathbf{x}^{k}) >$ $\dot{F}(\mathbf{x}^{k + 1})$

(b) Since $\{F(\mathbf{x}^{k})\}_{k \geq 0}$ is nonincreasing and bounded below (by $F_{\mathrm{opt}})$ , it follows that it is convergent, and in particular, $F(\mathbf{x}^{k}) - F(\mathbf{x}^{k + 1}) \to 0{\mathrm{~ as ~}} k \to \infty$ . Therefore, by the sufficient decrease inequality (13.7), it follows that min $\begin{array}{r}{\{S(\mathbf{x}^{k}), \frac{S^{2}(\mathbf{x}^{k})}{L_{f} \Omega^{2}}\} 0} \end{array}$ as $k \to \infty$ , implying that $S(\mathbf{x}^{k}) \to 0{\mathrm{~ as ~}} k \to \infty$

(c) By the sufficient decrease inequality (13.7), for all $n \geq 0$ ，

$$
F(\mathbf{x}^{n}) - F(\mathbf{x}^{n + 1}) \geq \frac{1}{2} \min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\}.\tag{13.12}
$$

Summing the above inequality over $n = 0, 1, \ldots, k$ 2

$$
F(\mathbf{x}^{0}) - F(\mathbf{x}^{k + 1}) \geq \frac{1}{2} \sum_{n = 0}^{k} \min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\}.\tag{13.13}
$$

Using the facts that $F(\mathbf{x}^{k + 1}) \geq F_{\mathrm{opt}}$ and

$$
\sum_{n = 0}^{k} \min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\} \geq(k + 1) \min_{n = 0, 1, \dots, k} \left[\min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\} \right],
$$

we obtain that

$$
\min_{n = 0, 1, \ldots, k} \left[\min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\} \right] \leq \frac{2(F(\mathbf{x}^{0}) - F_{\mathrm{opt}})}{k + 1},
$$

which implies in particular that there exists an $n \in \{0, 1, \ldots, k\}$ for which

$$
\min \left\{S(\mathbf{x}^{n}), \frac{S^{2}(\mathbf{x}^{n})}{L_{f} \Omega^{2}} \right\} \leq \frac{2(F(\mathbf{x}^{0}) - F_{\mathrm{opt}})}{k + 1},
$$

that is,

$$
S(\mathbf{x}^{n}) \leq \max \left\{\frac{2(F(\mathbf{x}^{0}) - F_{\mathrm{opt}})}{k + 1}, \frac{\sqrt{2L_{f} \Omega^{2}(F(\mathbf{x}^{0}) - F_{\mathrm{opt}})}}{\sqrt{k + 1}} \right\}.
$$

Since there exists $n \in \{0, 1, \ldots, k\}$ for which the above inequality holds, the result (13.11) immediately follows.

(d) Suppose that x¯ is a limit point of $\{{\bf x}^{k}\}_{k \ge 0}$ . Then there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \geq 0}$ that converges to x¯. By the definition of the conditional gradient norm $S(\cdot)$ , it follows that for any $\mathbf{v} \in \mathbb{E}$ 2

$$
S \left(\mathbf{x}^{k_{j}}\right) \geq \left\langle \nabla f \left(\mathbf{x}^{k_{j}}\right), \mathbf{x}^{k_{j}} - \mathbf{v} \right\rangle + g \left(\mathbf{x}^{k_{j}}\right) - g(\mathbf{v}).
$$

Passing to the limit $j \to \infty$ and using the fact that $S(\mathbf{x}^{k_{j}}) 0$ as $j \to \infty$ , as well as the continuity of $\nabla f$ and the lower semicontinuity of $g.$ , we obtain that

$$
0 \geq \langle \nabla f(\bar{\mathbf{x}}), \bar{\mathbf{x}} - \mathbf{v} \rangle + g(\bar{\mathbf{x}}) - g(\mathbf{v}) \text{for any} \mathbf{v} \in \mathbb{E},
$$

which is the same as the relation $- \nabla f({\bar{\mathbf{x}}}) \in \partial g({\bar{\mathbf{x}}})$ , that is, the same as stationarity.

Example 13.10 (optimization over the unit ball). Consider the problem

$$
\min \{f(\mathbf{x}): \| \mathbf{x} \| \leq 1\},\tag{13.14}
$$

where $f : \mathbb{E} \to \mathbb{R}$ is $L_{f}{\mathrm{- smooth}}$ . Problem (13.14) fits the general model (13.2) with $g = \delta_{B_{\parallel}.\parallel}[\mathbf{0}, 1]$ . Obviously, in this case the generalized conditional gradient method amounts to the conditional gradient method with feasible set $C = B_{\parallel \cdot \parallel}[0, 1]$ . Take $\mathbf{x} \in B_{\| \cdot \|}[\mathbf{0}, 1]$ . In order to find an expression for the conditional gradient norm $S(\mathbf{x})$ , we first note that

$$
\mathbf{p}(\mathbf{x}) \in \operatorname{argmin}_{\mathbf{p}: \| \mathbf{p} \| \leq 1} \langle \mathbf{p}, \nabla f(\mathbf{x}) \rangle
$$

is given by $\begin{array}{r}{\mathbf{p}(\mathbf{x}) ~ = ~ -{\frac{\nabla f(\mathbf{x})}{\left\| \nabla f(\mathbf{x}) \right\|}} ~ \mathrm{if} ~ \nabla f(\mathbf{x}) ~ \neq ~ 0} \end{array}$ and can be chosen as $\mathbf{p}(\mathbf{x}) = \mathbf{0}$ if $\nabla f(\mathbf{x}) = \mathbf{0}$ . Thus, in both cases, we obtain that for any $\mathbf{x} \in B_{\Vert \cdot \Vert}[\mathbf{0}, 1]$ ，

$$
S(\mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}(\mathbf{x}) \rangle = \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + \| \nabla f(\mathbf{x}) \|.\tag{13.15}
$$

By its definition, $S(\mathbf{x}) = \infty$ for any $\mathbf{x} \notin B_{\| \cdot \|}[\mathbf{0}, 1]$ . By Theorem 13.6 the above expression (13.15) is nonnegative and is equal to zero if and only if x is a stationary point of (13.14), which in this case means that either $\nabla f(\mathbf{x}) = \mathbf{0}{\mathrm{~ or ~}} \nabla f(\mathbf{x}) = \lambda \mathbf{x}$ for some $\lambda \leq 0$ (see [10, Example 9.6]).

Assuming that $S(\mathbf{x}^{k}) \neq 0,$ the general update formula of the conditional gradient method for solving (13.14) is

$$
\mathbf{x}^{k + 1} =(1 - t_{k}) \mathbf{x}^{k} - t_{k} \frac{\nabla f(\mathbf{x}^{k})}{\| \nabla f(\mathbf{x}^{k}) \|},
$$

where $t_{k} \in[0, 1]$ is an appropriately chosen stepsize. By Theorem 13.9 if the stepsize is chosen by either an adaptive or exact line search strategies, convergence of $S(\mathbf{x}^{k})$ to zero is guaranteed. ■

Example 13.11 (the power method).<sup>71</sup> Continuing Example 13.10, let us consider the problem

$$
\max_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \mathbf{x}^{T} \mathbf{Ax}: \| \mathbf{x} \|_{2} \leq 1 \right\},\tag{13.16}
$$

where $\mathbf{A} \in \mathbb{S}_{+}^{n}$ . Problem (13.16) fits the model (13.14) with $f : \mathbb{R}^{n} \mathbb{R}$ given by $\begin{array}{r}{f({\bf x}) = - \frac{1}{2}{\bf \dot{x}}^{T}{\bf A}{\bf x}} \end{array}$ . Consider the conditional gradient method for solving (13.16) and assume that $\mathbf{x}^{k}$ is not a stationary point of problem (13.2). Then

$$
\mathbf{x}^{k + 1} =(1 - t_{k}) \mathbf{x}^{k} + t_{k} \underbrace{\frac{\mathbf{Ax}^{k}}{\| \mathbf{Ax}^{k} \|_{2}}}_{\mathbf{p}^{k}}.\tag{13.17}
$$

If the stepsizes are chosen by an exact line search strategy, then

$$
t_{k} \in \operatorname{argmin}_{t \in[0, 1]} f(\mathbf{x}^{k} + t(\mathbf{p}^{k} - \mathbf{x}^{k})).\tag{13.18}
$$

Since $f$ is concave, it follows that either 0 or 1 is an optimal solution of (13.18), and by the fact that $\mathbf{x}^{k}$ is not a stationary point of problem (13.2), we can conclude by Theorem $13.9(a)$ that $t_{k} \neq 0$ . We can thus choose $t_{k} = 1$ , and the method (13.17) becomes

$$
\mathbf{x}^{k + 1} = \frac{\mathbf{Ax}^{k}}{\| \mathbf{Ax}^{k} \|_{2}},
$$

which is the well-known power method for finding the eigenvector of A corresponding to the maximal eigenvalue. Theorem 13.9 guarantees that limit points of the method are stationary points of problem (13.16), meaning eigenvectors A corresponding to nonnegative eigenvalues.

## 13.2.4 Convergence Analysis in the Convex Case

We will now further assume that f is convex. In this case, obviously all stationary points of problem (13.2) are also optimal points (Theorem $3.72(b))$ , so that Theorem 13.9 guarantees that all limit points of the sequence generated by the generalized conditional gradient method with either adaptive or exact line search stepsize strategies are optimal points. We also showed in Theorem 13.9 an $O(1 / \sqrt{k})$ rate of convergence of the conditional gradient norm. Our objectives will be to show an $O(1 / k)$ rate of convergence of function values to the optimal value, as well as of the conditional gradient norm to zero.

We begin by showing that when f is convex, the conditional gradient norm is lower bounded by the distance to optimality in terms of function values.

Lemma 13.12. Suppose that Assumption 13.1 holds and that $f$ is convex. Then for any $\mathbf{x} \in \operatorname{dom}(g)$

$$
S(\mathbf{x}) \geq F(\mathbf{x}) - F_{\mathrm{opt}}.
$$

Proof. Let $\mathbf{x}^{*} \in X^{*}$ . Then for any $\mathbf{x} \in \operatorname{dom}(g)$ ,

$$
\begin{array}{rlr} S(\mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}(\mathbf{x}) \rangle + g(\mathbf{x}) - g(\mathbf{p}(\mathbf{x})) &[\text{definition of} S] \\ = \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + g(\mathbf{x}) -(\langle \nabla f(\mathbf{x}), \mathbf{p}(\mathbf{x}) \rangle + g(\mathbf{p}(\mathbf{x}))) \\ \geq \langle \nabla f(\mathbf{x}), \mathbf{x} \rangle + g(\mathbf{x}) -(\langle \nabla f(\mathbf{x}), \mathbf{x}^{*} \rangle + g(\mathbf{x}^{*})) &[\text{definition of} \mathbf{p}(\cdot) \\ = \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{x}^{*} \rangle + g(\mathbf{x}) - g(\mathbf{x}^{*}) \\ \geq f(\mathbf{x}) - f(\mathbf{x}^{*}) + g(\mathbf{x}) - g(\mathbf{x}^{*}) &[\text{convexity of} f] \\ = F(\mathbf{x}) - F_{\mathrm{opt}}.& \square \end{array}\tag{13.3)]}
$$

The convergence analysis relies on the following technical lemma on sequences of scalars.

Lemma 13.13.<sup>72</sup> Let p be a positive integer, and let $\{a_{k}\}_{k \ge 0}$ and $\{b_{k}\}_{k \ge 0}$ be nonnegative sequences satisfying for any $k \geq 0$

$$
a_{k + 1} \leq a_{k} - \gamma_{k} b_{k} + \frac{A}{2} \gamma_{k}^{2},\tag{13.19}
$$

where $\begin{array}{r}{\gamma_{k} = \frac{2}{k + 2p}} \end{array}$ and A is a positive number. Suppose that $a_{k} \le b_{k}$ for all k. Then

(a) $\begin{array}{r}{a_{k} \leq \frac{2 \operatorname{max} \{A,(p - 1) a_{0}\}}{k + 2p - 2}} \end{array}$ for any $k \geq 1$

(b) for any $k \geq 3$

$$
\min_{n = \lfloor k / 2 \rfloor + 2, \dots, k} b_{n} \leq \frac{8 \max \{A,(p - 1) a_{0}\}}{k - 2}.
$$

Proof. (a) By (13.19) and the fact that $a_{k} \le b_{k}$ , it follows that

$$
a_{k + 1} \leq(1 - \gamma_{k}) a_{k} + \frac{A}{2} \gamma_{k}^{2}.
$$

Therefore,

$$
\begin{array}{l} a_{1} \leq(1 - \gamma_{0}) a_{0} + \frac{A}{2} \gamma_{0}^{2}, \\ a_{2} \leq(1 - \gamma_{1}) a_{1} + \frac{A}{2} \gamma_{1}^{2} =(1 - \gamma_{1})(1 - \gamma_{0}) a_{0} + \frac{A}{2}(1 - \gamma_{1}) \gamma_{0}^{2} + \frac{A}{2} \gamma_{1}^{2}, \\ a_{3} \leq(1 - \gamma_{2}) a_{2} + \frac{A}{2} \gamma_{2}^{2} =(1 - \gamma_{2})(1 - \gamma_{1})(1 - \gamma_{0}) a_{0} \\ \quad + \frac{A}{2} \left[(1 - \gamma_{2})(1 - \gamma_{1}) \gamma_{0}^{2} +(1 - \gamma_{2}) \gamma_{1}^{2} + \gamma_{2}^{2} \right].\end{array}
$$

In general,<sup>73</sup>

$$
a_{k} \leq a_{0} \prod_{s = 0}^{k - 1}(1 - \gamma_{s}) + \frac{A}{2} \sum_{u = 0}^{k - 1} \left[\prod_{s = u + 1}^{k - 1}(1 - \gamma_{s}) \right] \gamma_{u}^{2}.\tag{13.20}
$$

Since $\begin{array}{r}{\gamma_{k} = \frac{2}{k + 2p}} \end{array}$ , it follows that

$$
\begin{array}{l} \frac{A}{2} \sum_{u = 0}^{k - 1} \left[\prod_{s = u + 1}^{k - 1}(1 - \gamma_{s}) \gamma_{u}^{2} \right] = \frac{A}{2} \sum_{u = 0}^{k - 1} \left[\prod_{s = u + 1}^{k - 1} \frac{s + 2p - 2}{s + 2p} \gamma_{u}^{2} \right] \\ = \frac{A}{2} \sum_{u = 0}^{k - 1} \frac{(u + 2p - 1)(u + 2p)}{(k + 2p - 2)(k + 2p - 1)} \cdot \frac{4}{(u + 2p)^{2}} \\ = \frac{A}{2} \sum_{u = 0}^{k - 1} \frac{u + 2p - 1}{(k + 2p - 2)(k + 2p - 1)} \cdot \frac{4}{u + 2p} \\ \leq \frac{2Ak}{(k + 2p - 2)(k + 2p - 1)}.\end{array}\tag{13.21}
$$

In addition,

$$
a_{0} \prod_{s = 0}^{k - 1}(1 - \gamma_{s}) = a_{0} \prod_{s = 0}^{k - 1} \frac{s + 2p - 2}{s + 2p} = a_{0} \frac{(2p - 2)(2p - 1)}{(k + 2p - 2)(k + 2p - 1)}.\tag{13.22}
$$

Therefore, combining (13.20), (13.21), and (13.22),

$$
\begin{array}{l} a_{k} \leq \frac{2Ak}{(k + 2p - 2)(k + 2p - 1)} + \frac{a_{0}(2p - 2)(2p - 1)}{(k + 2p - 2)(k + 2p - 1)} \\ \leq \frac{2 \max \{A,(p - 1) a_{0}\}(k + 2p - 1)}{(k + 2p - 2)(k + 2p - 1)} \\ = \frac{2 \max \{A,(p - 1) a_{0}\}}{k + 2p - 2}.\end{array}
$$

(b) Replacing the index k with n in (13.19), we have

$$
a_{n + 1} \leq a_{n} - \gamma_{n} b_{n} + \frac{A}{2} \gamma_{n}^{2}.
$$

Summing the above inequality over $n = j, j + 1, \dotsc, k$ , we obtain that

$$
a_{k + 1} \leq a_{j} - \sum_{n = j}^{k} \gamma_{n} b_{n} + \frac{A}{2} \sum_{n = j}^{k} \gamma_{n}^{2}.
$$

Thus, using the result of part (a) (assuming that $j \geq 1)$ ,

$$
\begin{array}{l} \left(\sum_{n = j}^{k} \gamma_{n}\right) \min_{n = j, \dots, k} b_{n} \leq a_{j} + \frac{A}{2} \sum_{n = j}^{k} \gamma_{n}^{2} \\ \leq \frac{2 \max \{A,(p - 1) a_{0}\}}{j + 2p - 2} + 2A \sum_{n = j}^{k} \frac{1}{(n + 2p)^{2}} \\ \leq \frac{2 \max \{A,(p - 1) a_{0}\}}{j + 2p - 2} + 2A \sum_{n = j}^{k} \frac{1}{(n + 2p - 1)(n + 2p)} \\ = \frac{2 \max \{A,(p - 1) a_{0}\}}{j + 2p - 2} + 2A \sum_{n = j}^{k} \left[\frac{1}{n + 2p - 1} - \frac{1}{n + 2p} \right] \\ = \frac{2 \max \{A,(p - 1) a_{0}\}}{j + 2p - 2} + 2A \left[\frac{1}{j + 2p - 1} - \frac{1}{k + 2p} \right] \\ \leq \frac{4 \max \{A,(p - 1) a_{0}\}}{j + 2p - 2}.\end{array} \tag{13.}\tag{13.23}
$$

On the other hand,

$$
\sum_{n = j}^{k} \gamma_{n} = 2 \sum_{n = j}^{k} \frac{1}{n + 2p} \geq 2 \frac{k - j + 1}{k + 2p},
$$

which, combined with (13.23), yields

$$
\min_{n = j, \dots, k} b_{n} \leq \frac{2 \max \{A,(p - 1) a_{0}\}(k + 2p)}{(j + 2p - 2)(k - j + 1)}.
$$

Taking $j = \lfloor k / 2 \rfloor + 2$ , we conclude that for any $k \geq 3$ 2

$$
\min_{n = \lfloor k / 2 \rfloor + 2, \dots, k} b_{n} \leq \frac{2 \max \{A,(p - 1) a_{0}\}(k + 2p)}{(\lfloor k / 2 \rfloor + 2p)(k - \lfloor k / 2 \rfloor - 1)}.\tag{13.24}
$$

Now,

$$
\begin{array}{l} \frac{k + 2p}{(\lfloor k / 2 \rfloor + 2p)(k - \lfloor k / 2 \rfloor - 1)} \leq \frac{k + 2p}{(k / 2 + 2p - 0.5)(k - \lfloor k / 2 \rfloor - 1)} \\ = 2 \frac{k + 2p}{k + 4p - 1} \cdot \frac{1}{k - \lfloor k / 2 \rfloor - 1} \\ \leq \frac{2}{k - \lfloor k / 2 \rfloor - 1} \\ \leq \frac{2}{k / 2 - 1}, \end{array}
$$

which, combined with (13.24), yields

$$
\min_{n = \lfloor k / 2 \rfloor + 2, \dots, k} b_{n} \leq \frac{8 \max \{A,(p - 1) a_{0}\}}{k - 2}.\quad \square
$$

Equipped with Lemma 13.13, we will now establish a sublinear rate of convergence of the generalized conditional gradient method under the three stepsize strategies described at the beginning of Section 13.2.3: predefined, adaptive, and exact line search.

Theorem 13.14. Suppose that Assumption 13.1 holds and that f is convex. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the generalized conditional gradient method for solving problem (13.2) with either a predefined stepsize $\begin{array}{r}{t_{k} = \alpha_{k} \equiv \frac{2}{k + 2}} \end{array}$ , adaptive stepsize, or exact line search. Let Ω be an upper bound on the diameter of dom(g):

$$
\Omega \geq \max_{\mathbf{x}, \mathbf{y} \in \operatorname{dom}(g)} \| \mathbf{x} - \mathbf{y} \|.
$$

Then

$$
\mathrm{(a)} F(\mathbf{x}^{k}) - F_{\mathrm{opt}} \leq \frac{2L_{f} \Omega^{2}}{k} foranyk \geq 1;
$$

$$
\mathrm{(b)} \min_{n = \lfloor k / 2 \rfloor + 2, \dots, k} S(\mathbf{x}^{n}) \leq \frac{8L_{f} \Omega^{2}}{k - 2} foranyk \geq 3.
$$

Proof. By the fundamental inequality (13.6) invoked with $\mathbf{x} = \mathbf{x}^{k}$ and $t = t_{k}$ , it follows that for any $k \geq 0$ 2

$$
F(\mathbf{x}^{k} + t_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - t_{k} S(\mathbf{x}^{k}) + \frac{t_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2},\tag{13.25}
$$

where $\mathbf{p}^{k} \mathbf{\Psi} = \mathbf{\Psi} \mathbf{p}(\mathbf{x}^{k})$ . Specifically, if a predefined stepsize is used, meaning that $\begin{array}{r}{t_{k} = \alpha_{k} \equiv \frac{2}{k + 2}} \end{array}$ , then

$$
F(\mathbf{x}^{k} + \alpha_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - \alpha_{k} S(\mathbf{x}^{k}) + \frac{\alpha_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}.\tag{13.26}
$$

If an exact line search is used, meaning that $t_{k} = u_{k} \in \operatorname{argmin}_{t \in[0, 1]} F(\mathbf{x}^{k} + t(\mathbf{p}^{k} -$ $\mathbf{x}^{k}))$ , then

$$
F(\mathbf{x}^{k} + u_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k} + \alpha_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) - F_{\mathrm{opt}}\tag{13.27}
$$

$$
\leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - \alpha_{k} S(\mathbf{x}^{k}) + \frac{\alpha_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2},
$$

where the first inequality follows by the definition of $u_{k}$ and the second is the inequality (13.26). Finally, in the adaptive stepsize strategy, $\begin{array}{r}{t_{k} = v_{k} \equiv \operatorname{min} \bigg \{1, \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}} \bigg\}} \end{array}$ Note that $v_{k}$ satisfies

$$
v_{k} = \operatorname{argmin}_{t \in[0, 1]} \left\{- tS(\mathbf{x}^{k}) + \frac{t^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2} \right\}.\tag{13.28}
$$

Thus,

$$
\begin{array}{rlr} & &{F(\mathbf{x}^{k} + v_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - v_{k} S(\mathbf{x}^{k}) + \frac{v_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}} \\ & &{\leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - \alpha_{k} S(\mathbf{x}^{k}) + \frac{\alpha_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2},} \end{array}
$$

where the first inequality is the inequality (13.25) with $t_{k} = v_{k}$ and the second is due to (13.28). Combining the last inequality with (13.26) and (13.27), we conclude that for the three stepsize strategies, the following inequality holds:

$$
F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - \alpha_{k} S(\mathbf{x}^{k}) + \frac{\alpha_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2},
$$

which, combined with the inequality $\| \mathbf{p}^{k} - \mathbf{x}^{k} \| \leq \Omega$ , implies that

$$
F(\mathbf{x}^{k + 1}) - F_{\mathrm{opt}} \leq F(\mathbf{x}^{k}) - F_{\mathrm{opt}} - \alpha_{k} S(\mathbf{x}^{k}) + \frac{\alpha_{k}^{2} L_{f} \Omega^{2}}{2}.
$$

Invoking Lemma 13.13 with $a_{k} = F(\mathbf{x}^{k}) - F_{\mathrm{opt}}, b_{k} = S(\mathbf{x}^{k}), A = L_{f} \Omega^{2}$ , and $p = 1$ and noting that $a_{k} \le b_{k}$ by Lemma 13.12, both parts (a) and (b) follow.

## 13.3 The Strongly Convex Case

We will focus on the case where the nonsmooth part is an indicator of a compact and convex set $C,$ meaning that $g = \delta_{C}$ , so that problem (13.2) becomes

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\},
$$

and the method under consideration is the conditional gradient method. In Section 10.6 we showed that the proximal gradient method enjoys an improved linear convergence when the smooth part (in the composite model) is strongly convex. Unfortunately, as we will see in Section 13.3.1, in general, the conditional gradient method does not converge in a linear rate even if an additional strong convexity assumption is made on the objective function. Later on, in Section 13.3.2 we will show how, under a strong convexity assumption on the feasible set (and not on the objective function), linear rate can be established.

## 13.3.1 The Negative Result of Canon and Cullum

The arguments go back to Canon and Cullum [37], and we follow them. We begin with some technical lemmas.

Lemma 13.15. Let $\{a_{n}\}_{n \ge 0}$ be a sequence of real numbers such that $\textstyle \sum_{n = 0}^{\infty} \left| a_{n} \right|$ diverges. Then for every $\begin{array}{r}{\varepsilon > 0, \sum_{n = k}^{\infty} \bar{a}_{n}^{2} \ge \frac{1}{k^{1 + \varepsilon}}} \end{array}$ for infinitely many $k ' s$

Proof. Suppose by contradiction that there is $\varepsilon > 0$ and a positive integer K such that for al $k \geq K$

$$
\sum_{n = k}^{\infty} a_{n}^{2} < \frac{1}{k^{1 + 2 \varepsilon}}.\tag{13.29}
$$

We will show that $\textstyle \sum_{n = 1}^{\infty} \left| a_{n} \right|$ converges. Note that by the Cauchy–Schwarz inequality,

$$
\sum_{n = 1}^{\infty} \left| a_{n} \right| = \sum_{n = 1}^{\infty} \left| a_{n} \right| n^{(1 + \varepsilon) / 2} n^{-(1 + \varepsilon) / 2} \leq \sqrt{\sum_{n = 1}^{\infty} n^{1 + \varepsilon} a_{n}^{2}} \sqrt{\sum_{n = 1}^{\infty} n^{-(1 + \varepsilon)}}.\tag{13.30}
$$

Since $\scriptstyle \sum_{n = 1}^{\infty} n^{-(1 + \varepsilon)}$ converges, it is enough to show that $\textstyle \sum_{n = 1}^{\infty} n^{1 + \varepsilon} a_{n}^{2}$ converges. For that, note that by (13.29), for any $m \geq K$ 2

$$
\sum_{k = K}^{m} \left[k^{\varepsilon} \sum_{n = k}^{m} a_{n}^{2} \right] \leq \sum_{k = K}^{m} \left[k^{\varepsilon} \sum_{n = k}^{\infty} a_{n}^{2} \right] \leq \sum_{k = K}^{m} \frac{1}{k^{1 + \varepsilon}}.\tag{13.31}
$$

On the other hand,

$$
\sum_{k = K}^{m} \left[k^{\varepsilon} \sum_{n = k}^{m} a_{n}^{2} \right] = \sum_{n = K}^{m} \left[a_{n}^{2} \sum_{k = K}^{n} k^{\varepsilon} \right],
$$

which, combined with the inequality

$$
\sum_{k = K}^{n} k^{\varepsilon} \geq \int_{K}^{n} x^{\varepsilon} dx = \frac{1}{1 + \varepsilon}(n^{1 + \varepsilon} - K^{1 + \varepsilon})
$$

and (13.31), implies that (taking $m \infty)$ )

$$
\frac{1}{1 + \varepsilon} \sum_{n = K}^{\infty}(n^{1 + \varepsilon} - K^{1 + \varepsilon}) a_{n}^{2} \leq \sum_{k = K}^{\infty} \frac{1}{k^{1 + \varepsilon}}.
$$

Since both $\scriptstyle \sum_{k = K}^{\infty}{\frac{1}{k^{1 + \varepsilon}}}$ and $\textstyle \sum_{n = K}^{\infty} a_{n}^{2}$ converge, it follows that $\scriptstyle \sum_{n = K}^{\infty} n^{1 + \varepsilon} a_{n}^{2}$ converges and hence, by (13.30), that $\textstyle \sum_{n = 1}^{\infty} \left| a_{n} \right|$ converges, which is a contradiction to our underlying assumptions.

We will also use the following well-known lemma.

Lemma 13.16 (see [75, Chapter VII, Theorem 4]). Let $\{b_{n}\}_{n \geq 0}$ be a sequence satisfying $0 \leq b_{n} < 1$ for any n. Then $\textstyle \prod_{n = 0}^{m}(1 - b_{n}) \to 0$ as $m \infty$ if and only if $\textstyle \sum_{n = 0}^{\infty} b_{n}$ diverges.

Our main goal will be to describe an example of a minimization problem of a strongly convex function over a nonempty compact convex set for which the conditional gradient method does not exhibit a linear rate of convergence. For that, let us consider the following quadratic problem over $\mathbb{R}^{n}$ :

$$
f_{\text{opt}} \equiv \min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{f_{q}(\mathbf{x}) \equiv \frac{1}{2} \mathbf{x}^{T} \mathbf{Q} \mathbf{x} + \mathbf{b}^{T} \mathbf{x}: \mathbf{x} \in \Omega \right\},\tag{13.32}
$$

where $\mathbf{Q} \in \mathbb{S}_{+ +}^{n}, \mathbf{b} \in \mathbb{R}^{n}$ , and $\Omega = \mathrm{conv} \{\mathbf{a}_{1}, \mathbf{a}_{2}, \ldots, \mathbf{a}_{l}\}$ , where $\mathbf{a}_{1}, \mathbf{a}_{2}, \dots, \mathbf{a}_{l} \in \mathbb{R}^{n}$ We will make the following assumption on problem (13.32).

Assumption 13.17. int $(\Omega) \ \ne \ \emptyset$ and the optimal solution of problem (13.32), denoted by $\mathbf{x}^{*}$ , is on the boundary of Ω and is not an extreme point of Ω.

Denoting $\mathbf{A} \in \mathbb{R}^{n \times l}$ as the matrix whose columns are $\mathbf{a}_{1}, \ldots, \mathbf{a}_{l}$ , we can also write problem (13.32) as

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}, \mathbf{v} \in \mathbb{R}^{l}} \left\{\frac{1}{2} \mathbf{x}^{T} \mathbf{Q} \mathbf{x} + \mathbf{b}^{T} \mathbf{x}: \mathbf{x} = \mathbf{A} \mathbf{v}, \mathbf{v} \in \Delta_{l} \right\}.
$$

The conditional gradient method with exact line search strategy for solving (13.32) reads as follows. Given the kth iterate $\mathbf{x}^{k}$ , the next point $\mathbf{x}^{k + 1}$ is computed as follows:

- Choose

$$
i_{k} \in \operatorname{argmin}_{i = 1, 2, \dots, l} \langle \mathbf{a}_{i}, \nabla f_{q}(\mathbf{x}^{k}) \rangle.
$$

- Define

$$
\mathbf{d}^{k} = \mathbf{a}_{i_{k}} - \mathbf{x}^{k}.\tag{13.33}
$$

If $\langle \mathbf{d}^{k}, \nabla f_{q}(\mathbf{x}^{k}) \rangle \geq 0$ , then $\mathbf{x}^{k}$ is the optimal solution of problem (13.32). Otherwise, set

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} + t_{k} \mathbf{d}^{k},
$$

where

$$
t_{k} = \operatorname{argmin}_{t \in[0, 1]} f_{q}(\mathbf{x}^{k} + t \mathbf{d}^{k}) = \min \left\{\lambda_{k}, 1 \right\},
$$

with $\lambda_{k}$ defined as

$$
\lambda_{k} = - \frac{\langle \mathbf{d}^{k}, \nabla f_{q}(\mathbf{x}^{k}) \rangle}{(\mathbf{d}^{k})^{T} \mathbf{Qd}^{k}}.\tag{13.34}
$$

We will make the following assumption on the starting point of the conditional gradient method.

Assumption 13.18. $f_{q}({\bf x}^{0}) < \mathrm{min}_{i = 1, 2,..., l} f_{q}({\bf a}_{i})$ and $\mathbf{x}^{0} = \mathbf{A} \mathbf{v}^{0} \in \Omega$ , where $\mathbf{v}^{0} \in \Delta_{l} \cap \mathbb{R}_{+ +}^{n}$ . In particular, $\mathbf{x}^{0} \in \mathrm{int}(\Omega)$

A vector $\mathbf{x}^{0}$ satisfying Assumption 13.18 can be easily obtained by the following procedure.

- Pick $p \in \operatorname{argmin}_{i = 1, 2,..., l} f_{q}(\mathbf{a}_{i})$

- Employ one step of the conditional gradient method starting from $\mathbf{a}_{p}$ and obtain a point $\tilde{\mathbf{x}}^{0} \in \Omega$ for which $f_{q}(\tilde{\mathbf{x}}^{0}) < f_{q}(\mathbf{a}^{p})$ (the latter is satisfied since $\mathbf{a}^{p}$ is not an optimal solution—see Theorem 13.9(a)).

- Find $\tilde{\mathbf{v}}^{0} \in \Delta_{l}$ for which $\tilde{\mathbf{x}}^{0} = \mathbf{A} \tilde{\mathbf{v}}^{0}$

- If $\tilde{\mathbf{v}}^{0} \in \mathbb{R}_{+ +}^{l}.$ define $\mathbf{v}^{0} = \tilde{\mathbf{v}}^{0}$ and $\mathbf{x}^{0} = \tilde{\mathbf{x}}^{0}$ . If $\tilde{\mathbf{v}}^{0} \notin \mathbb{R}_{+ +}^{l}$ , then take a point $\mathbf{v}^{0} \in \dot{\Delta}_{l} \cap \mathbb{R}_{+ +}^{l}$ close enough to $\tilde{\mathbf{v}}^{0}$ such that $\mathbf{x}^{0} \equiv \mathbf{\dot{A}} \mathbf{\dot{v}}^{0}$ will satisfy $f_{q}(\mathbf{x}^{0}) < f_{q}(\mathbf{a}^{p})$

The following lemma gathers several technical results that will be key to establishing the slow rate of the conditional gradient method.

Lemma 13.19. Suppose that Assumption 13.17 holds and that $\{\mathbf{x}^{k}\}$ is the sequence generated by the conditional gradient method with exact line search employed on problem (13.32) with a starting point $\mathbf{x}^{0}$ satisfying Assumption 13.18. Let $\mathbf{d}^{k}$ and $\lambda_{k}$ be given by (13.33) and (13.34), respectively. Then

(a) $\mathbf{x}^{k} \in \operatorname{int}(\Omega)$ and $t_{k} = \lambda_{k} < 1$ for any $k \geq 0,$

(b) $\begin{array}{r}{f_{q}(\mathbf{x}^{k + 1}) = f_{q}(\mathbf{x}^{k}) - \frac{1}{2}((\mathbf{d}^{k})^{T} \mathbf{Q} \mathbf{d}^{k}) \lambda_{k}^{2} ~ for ~ any ~ k \ge 0,} \end{array}$

(c) $\begin{array}{r}{\sum_{k = 0}^{\infty} \lambda_{k} = \infty;} \end{array}$

(d) there exists $\beta > 0$ such that $(\mathbf{d}^{k})^{T} \mathbf{Q} \mathbf{d}^{k} \geq \beta$ for all $k \geq 0$

Proof. (a) The stepsizes must satisfy $t_{k} = \lambda_{k} < 1$ , since otherwise, if $t_{k} = 1$ for some $k.$ , then this means that $\mathbf{x}^{k + 1} = \mathbf{a}_{i_{k}}$ . But $f_{q}(\mathbf{x}^{k + 1}) = f_{q}(\mathbf{a}_{i_{k}}) > f_{q}(\mathbf{x}^{0})$ , which is a contradiction to the monotonicity of the sequence of function values generated by the conditional gradient method (Theorem $\mathrm{13.9(a)})$ ). The proof that $\mathbf{x}^{k} \in \operatorname{int}(\Omega)$ is by induction on $k.$ . For $k = 0$ , by Assumption 13.18, $\mathbf{x}^{0} \in \mathrm{int}(\Omega)$ . Now suppose that $\mathbf{x}^{k} \in \operatorname{int}(\Omega)$ . To prove that the same holds for $k + 1$ , note that since $t_{k} < 1$ , it follows by the line segment principle (Lemma 5.23) that $\mathbf{x}^{k + 1} =(1 - t_{k}) \mathbf{x}^{k} + t_{k} \mathbf{a}_{i_{k}}$ is also in int(Ω).

(b) Since $t_{k} = \lambda_{k}$ , it follows that

$$
\begin{array}{l} f_{q}(\mathbf{x}^{k + 1}) = f_{q} \left(\mathbf{x}^{k} + \lambda_{k} \mathbf{d}^{k}\right) \\ \qquad = \frac{1}{2}(\mathbf{x}^{k} + \lambda_{k} \mathbf{d}^{k})^{T} \mathbf{Q}(\mathbf{x}^{k} + \lambda_{k} \mathbf{d}^{k}) + \mathbf{b}^{T}(\mathbf{x}^{k} + \lambda_{k} \mathbf{d}^{k}) \\ \qquad = f_{q}(\mathbf{x}^{k}) + \lambda_{k}(\mathbf{d}^{k})^{T}(\mathbf{Qx}^{k} + \mathbf{b}) + \frac{\lambda_{k}^{2}}{2}(\mathbf{d}^{k})^{T} \mathbf{Qd}^{k} \\ \qquad = f_{q}(\mathbf{x}^{k}) +((\mathbf{d}^{k})^{T} \mathbf{Qd}^{k}) \left(- \lambda_{k}^{2} + \frac{\lambda_{k}^{2}}{2}\right) \\ \qquad = f_{q}(\mathbf{x}^{k}) - \frac{1}{2}((\mathbf{d}^{k})^{T} \mathbf{Qd}^{k}) \lambda_{k}^{2}.\end{array}
$$

(c) Suppose by contradiction that $\textstyle \sum_{k = 0}^{\infty} \lambda_{k} < \infty$ , then by Lemma 13.16, it follows that $\begin{array}{r}{\prod_{k = 0}^{\infty}(1 - \lambda_{k}) = \delta} \end{array}$ for some $\delta > 0$ . Note that by the definition of the method, for any $\bar{k} \geq 0, \mathbf{x}^{k} = \mathbf{A} \mathbf{v}^{k}$ , where $\{\mathbf{v}^{k}\}_{k \geq 0}$ satisfies

$$
\mathbf{v}^{k + 1} =(1 - \lambda_{k}) \mathbf{v}^{k} + \lambda_{k} \mathbf{e}_{i_{k}}.
$$

Hence,

$$
\mathbf{v}^{k + 1} \geq(1 - \lambda_{k}) \mathbf{v}^{k},
$$

implying that

$$
\mathbf{v}^{k} \geq \delta \mathbf{v}^{0}.\tag{13.35}
$$

By Theorem 13.9(d), the limit points of $\{{\bf x}^{k}\}_{k \ge 0}$ are stationary points of problem (13.32). Let $\mathbf{x}^{*}$ be the unique optimal solution of problem (13.32). Since $\mathbf{x}^{*}$ is the only stationary point of problem (13.32), we can conclude that $\mathbf{x}^{k} \to \mathbf{x}^{*}$ . The sequence $\{\mathbf{v}^{k}\}_{k \geq 0}$ is bounded and hence has a convergent subsequence $\{\mathbf{v}^{k_{j}}\}_{j \geq 0}$ Denoting the limit of the subsequence by $\mathbf{v}^{*} \in \Delta_{l}$ , we note that by (13.35) it follows that $\mathbf{v}^{*} \geq \delta \mathbf{v}^{0}$ , and hence $\mathbf{v}^{*} \in \bar{\Delta}_{l} \cap \mathbb{R}_{+ +}^{l}$ . Taking j to ∞ in the identity $\mathbf{x}^{i_{j}} = \mathbf{A} \mathbf{v}^{k_{j}}$ ， we obtain that $\mathbf{x}^{*} = \mathbf{A} \mathbf{v}^{*}$ , where $\mathbf{v}^{*} \in \Delta_{l} \cap \mathbb{R}_{+ +}^{l}$ , implying that the $\mathbf{x}^{*} \in$ int(Ω), in contradiction to Assumption 13.17.

(d) Since

$$
(\mathbf{d}^{k})^{T} \mathbf{Q} \mathbf{d}^{k} \geq \gamma \| \mathbf{d}^{k} \|_{2}^{2}\tag{13.36}
$$

with $\gamma = \lambda_{\mathrm{min}}(\mathbf{Q}) > 0$ , it follows that we need to show that $\| \mathbf{d}^{k} \|_{2}$ is bounded below by a positive number. Note that by Assumption $13.17, \mathbf{x}^{*} \notin \{\mathbf{a}_{1}, \mathbf{a}_{2}, \ldots, \mathbf{a}_{l}\}$ , and therefore there exists a positive integer K and $\beta_{1} > 0$ such that $\| \mathbf{a}_{i} - \mathbf{x}^{k} \| \geq \beta_{1}$ for all $k > K$ and $i \in \{1, 2, \ldots, l\}$ . Since $\mathbf{x}^{k} \in \mathrm{int}(\Omega)$ for all $k,$ it follows that for $\beta_{2}$ defined as

$$
\beta_{2} \equiv \min \{\beta_{1}, \| \mathbf{a}_{i_{0}} - \mathbf{x}^{0} \|_{2}, \| \mathbf{a}_{i_{1}} - \mathbf{x}^{1} \|_{2}, \ldots, \| \mathbf{a}_{i_{K}} - \mathbf{x}^{K} \|_{2}\} > 0,
$$

it holds that $\| \mathbf{d}^{k} \|_{2} = \| \mathbf{a}_{i_{k}} - \mathbf{x}^{k} \| \geq \beta_{2}$ for all $k \geq 0$ , and we can finally conclude by (13.36) that for $\beta = \gamma \beta_{2}^{2},({\bf d}^{k})^{T}{\bf Q}{\bf d}^{k} \geq \beta$ for all $k \geq 0$ □

The main negative result showing that the rate of convergence of the method cannot be linear is stated in Theorem 13.20 below.

Theorem 13.20 (Canon and Cullum’s negative result). Suppose that Assumption 13.17 holds and that $\{\mathbf{x}^{k}\}$ is the sequence generated by the conditional gradient method with exact line search for solving problem (13.32) with a starting point $\mathbf{x}^{0}$ satisfying Assumption 13.18. Then for every $\varepsilon > 0$ we have that $\begin{array}{r}{f_{q}(\mathbf{x}^{k}) - f_{\mathrm{opt}} \geq \frac{1}{k^{1 + \varepsilon}}} \end{array}$ for infinitely many $k ' s.$

Proof. Let $\mathbf{d}^{k}$ and $\lambda_{k}$ be given by (13.33) and (13.34), respectively. By Lemma 13.19(b), we have for any two positive integers satisfying $K \geq k$

$$
f_{q}(\mathbf{x}^{K}) - f_{\mathrm{opt}} = f_{q}(\mathbf{x}^{k}) - f_{\mathrm{opt}} - \frac{1}{2} \sum_{n = k}^{K - 1}((\mathbf{d}^{n})^{T} \mathbf{Q} \mathbf{d}^{n}) \lambda_{n}^{2}.
$$

Taking $K \infty$ and using the fact that $f_{q}({\bf x}^{K}) f_{\mathrm{opt}}$ and Lemma 13.19(d), we obtain that

$$
f_{q}(\mathbf{x}^{k}) - f_{\mathrm{opt}} = \frac{1}{2} \sum_{n = k}^{\infty}((\mathbf{d}^{n}) \mathbf{Q}(\mathbf{d}^{n})) \lambda_{n}^{2} \geq \frac{\beta}{2} \sum_{n = k}^{\infty} \lambda_{n}^{2}.\tag{13.37}
$$

By Lemma $13.19(c), \sum_{k = 0}^{\infty} \lambda_{k} = \infty$ , and hence by Lemma 13.15 and (13.37), we conclude that $\begin{array}{r}{f_{q}(\mathbf{x}^{k}) - \ddot{f}_{\mathrm{opt}} \geq \frac{1}{k^{1 + \varepsilon}}} \end{array}$ for infinitely many $k \mathrm{{s}}$ .口

Example 13.21. Consider the problem

$$
\min \{f_{q}(x_{1}, x_{2}) \equiv x_{1}^{2} + x_{2}^{2}:(x_{1}, x_{2}) \in \operatorname{conv} \{(- 1, 0),(1, 0),(0, 1)\}\}.\tag{13.38}
$$

Assumption 13.17 is satisfied since the feasible set of problem (13.38) has a nonempty interior and the optimal solution, $(x_{1}^{*}, x_{2}^{*}) =(0, 0)$ , is on the boundary of the feasible set but is not an extreme point. The starting point $\mathbf{x}^{0} =(0, \textstyle{\frac{1}{2}})$ satisfies Assumption 13.18 since

$$
f_{q}(\mathbf{x}^{0}) = \frac{1}{4} < 1 = \min \{f_{q}(- 1, 0), f_{q}(1, 0), f_{q}(0, 1)\}
$$

and $\begin{array}{r}{\mathbf{x}^{0} = \frac{1}{4}(- 1, 0) + \frac{1}{4}(1, 0) + \frac{1}{2}(0, 1)} \end{array}$ . The first 100 iterations produced by the conditional gradient method are plotted in Figure 13.1.

![Figure 13.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/5942f15269a202df43a889943173f60408a23e0a927d1b318933ff1587b8d0ce.jpg)  
Figure 13.1. First 100 iterations of the conditional gradient method employed on the problem from Example 13.21.

## 13.3.2 Linear Rate under Strong Convexity of the Feasible Set

Canon and Cullum’s negative result shows that different assumptions than strong convexity of the objective are required in order to establish a linear rate of convergence of the conditional gradient method. One example of such an assumption is strong convexity of the feasible set.

Definition 13.22 (strongly convex set). A nonempty set $C \subseteq \mathbb{E}$ is called $\sigma \mathrm{-}$ strongly convex $(\sigma > 0)$ if for any $\mathbf{x}, \mathbf{y} \in C$ and $\lambda \in[0, 1]$ the inclusion

$$
B \left[\lambda \mathbf{x} +(1 - \lambda) \mathbf{y}, \frac{\sigma}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2} \right] \subseteq C
$$

holds.

A set is called strongly convex if it is σ-strongly convex for some $\sigma > 0$ Obviously, any strongly convex set is also convex. The next result states that level sets of nonnegative strongly convex and smooth functions are strongly convex sets.

Theorem 13.23 (strong convexity of level sets of strongly convex and smooth functions).<sup>74</sup> Suppose that $g : \mathbb{E} \to \mathbb{R}_{+}$ is nonnegative, $L_{g} – smooth_{\scriptscriptstyle 3}$ , and $\sigma_{g} - strongly$ convex. Let $\alpha > 0$ . Then the set

$$
C_{\alpha} = \{\mathbf{x} \in \mathbb{E}: g(\mathbf{x}) \leq \alpha\}
$$

is $\frac{\sigma_{g}}{\sqrt{2 \alpha L_{g}}}$ -strongly convex.

Proof. Let x, $\textbf{y} \in \C_{\alpha}$ and $\lambda ~ \in ~[0, 1]$ . Define $\mathbf{x}_{\lambda} = \lambda \mathbf{x} +(1 - \lambda) \mathbf{y}$ . By the nonnegativity of g and the sufficient decrease lemma (Lemma 10.4), we have

$$
g(\mathbf{x}_{\lambda}) \geq g(\mathbf{x}_{\lambda}) - g \left(\mathbf{x}_{\lambda} - \frac{1}{L_{g}} \nabla g(\mathbf{x}_{\lambda})\right) \geq \frac{1}{2L_{g}} \| \nabla g(\mathbf{x}_{\lambda}) \|^{2}.
$$

Thus,

$$
\| \nabla g(\mathbf{x}_{\lambda}) \| \leq \sqrt{2L_{g} g(\mathbf{x}_{\lambda})}.\tag{13.39}
$$

By the $\sigma_{g} \mathrm{- strong}$ convexity of $g$ and the inequalities $g(\mathbf{x}), g(\mathbf{y}) \leq \alpha$

$$
g(\mathbf{x}_{\lambda}) \leq \lambda g(\mathbf{x}) +(1 - \lambda) g(\mathbf{y}) - \frac{\sigma_{g}}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2} \leq \alpha - \beta,\tag{13.40}
$$

where $\begin{array}{r}{\beta \equiv \frac{\sigma_{g}}{2} \lambda(1 - \lambda) \lVert \mathbf{x} - \mathbf{y} \rVert^{2}} \end{array}$

Denote $\begin{array}{r}{\tilde{\sigma} = \frac{\sigma_{g}}{\sqrt{2 \alpha L_{g}}}} \end{array}$ . In order to show that $C_{\alpha}$ is ˜σ-strongly convex, we will take $\mathbf{u} \in B[\mathbf{0}, 1]$ and show that $\mathbf{x}_{\lambda} + \gamma \mathbf{u} \in C_{\alpha}$ , where $\begin{array}{r}{\gamma = \frac{\tilde{\sigma}}{2} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}} \end{array}$ Indeed,

$$
\begin{array}{ll} g(\mathbf{x}_{\lambda} + \gamma \mathbf{u}) \leq g(\mathbf{x}_{\lambda}) + \gamma \langle \nabla g(\mathbf{x}_{\lambda}), \mathbf{u} \rangle + \frac{\gamma^{2} L_{g}}{2} \| \mathbf{u} \|^{2} &[\text{descent lemma}] \\ \leq g(\mathbf{x}_{\lambda}) + \gamma \| \nabla g(\mathbf{x}_{\lambda}) \| \cdot \| \mathbf{u} \| + \frac{\gamma^{2} L_{g}}{2} \| \mathbf{u} \|^{2} &[\text{Cauchy - Schwarz}] \\ \leq g(\mathbf{x}_{\lambda}) + \gamma \sqrt{2L_{g} g(\mathbf{x}_{\lambda})} \| \mathbf{u} \| + \frac{\gamma^{2} L_{g}}{2} \| \mathbf{u} \|^{2} &[(13.39)] \\ = \left(\sqrt{g(\mathbf{x}_{\lambda})} + \gamma \sqrt{\frac{L_{g}}{2}} \| \mathbf{u} \|\right)^{2}, \end{array}
$$

which, combined with (13.40) and the fact that $\| \mathbf{u} \| \leq 1$ , implies that

$$
g(\mathbf{x}_{\lambda} + \gamma \mathbf{u}) \leq \left(\sqrt{\alpha - \beta} + \gamma \sqrt{\frac{L_{g}}{2}}\right)^{2}.\tag{13.41}
$$

By the concavity of the square root function $\varphi(t) = \sqrt{t}$ , we have

$$
\begin{array}{rl} &{\sqrt{\alpha - \beta} = \varphi(\alpha - \beta) \leq \varphi(\alpha) - \varphi^{\prime}(\alpha) \beta = \sqrt{\alpha} - \frac{\beta}{2 \sqrt{\alpha}}} \\ &{\qquad = \sqrt{\alpha} - \frac{\sigma_{g} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}}{4 \sqrt{\alpha}}} \\ &{\qquad = \sqrt{\alpha} - \frac{\sqrt{2 \alpha L_{g}} \tilde{\sigma} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}}{4 \sqrt{\alpha}}} \\ &{\qquad = \sqrt{\alpha} - \sqrt{\frac{L_{g}}{2}} \frac{\tilde{\sigma} \lambda(1 - \lambda) \| \mathbf{x} - \mathbf{y} \|^{2}}{2}} \\ &{\qquad = \sqrt{\alpha} - \gamma \sqrt{\frac{L_{g}}{2}},} \end{array}
$$

which, along with (13.41), leads to the inequality $g(\mathbf{x}_{\lambda} + \gamma \mathbf{u}) \leq \alpha$

Example 13.24 (strong convexity of Euclidean balls). Consider the $\mathrm{set}^{75}$ $C = B[\mathbf{c}, r] \subseteq \mathbb{E}$ , where $\mathbf{c} \in \mathbb{E}$ and $r \ > \0$ . Note that $\dot{C} = \mathrm{Lev}(g, r^{2})$ , where $g(\mathbf{x}) \ = \ \| \mathbf{x} - \mathbf{c} \|^{2}$ . Since here $L_{q} = \sigma_{q} = 2, \alpha = r^{2}$ , it follows that the strong convexity parameter of the set is $\begin{array}{r}{\dot{\overline{{2 \cdot 2 \cdot r^{2}}}} = \frac{1}{r}} \end{array}$

We will consider the problem

$$
\min_{\mathbf{x} \in C} f(\mathbf{x}),\tag{13.42}
$$

where we assume the following set of properties.

Assumption 13.25.

(A) $C$ is nonempty, compact, and σ-strongly convex.

(B) $f : \mathbb{E} \to(- \infty, \infty]$ is convex $L_{f}{-} smooth$ over dom $(f)$ , which is assumed to be an open and convex set satisfying $C \subseteq \operatorname{dom}(f)$

(C) There exists $\delta > 0$ such that $\| \nabla f(\mathbf{x}) \| \geq \delta$ for any $\mathbf{x} \in C$

(D) The optimal set of problem (13.42) is nonempty and denoted by $X^{\ast}$ . The optimal value of the problem is denoted by $f_{\mathrm{opt}}$

As usual, for any $\mathbf{x} \in C.$ we use the notation

$$
\mathbf{p}(\mathbf{x}) \in \operatorname{argmin}_{\mathbf{p} \in C} \langle \nabla f(\mathbf{x}), \mathbf{p} \rangle, S(\mathbf{x}) = \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}(\mathbf{x}) \rangle.
$$

We begin by establishing the following result connecting $S(\mathbf{x})$ and the distance between x and $\mathbf{p}(\mathbf{x})$

Lemma 13.26. Suppose that Assumption 13.25 holds. Then for any $\mathbf{x} \in C$

$$
S(\mathbf{x}) \geq \frac{\sigma \delta}{4} \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2}.\tag{13.43}
$$

Proof. Let $\mathbf{x} \in C$ . Define

$$
\mathbf{z} = \frac{\mathbf{x} + \mathbf{p}(\mathbf{x})}{2} - \frac{\sigma}{8} \frac{\nabla f(\mathbf{x})}{\| \nabla f(\mathbf{x}) \|} \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2}.
$$

Then obviously $\mathbf{z} \in B \big[\frac{\mathbf{x} + \mathbf{p}(\mathbf{x})}{2}, \frac{\sigma}{8} \big \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \big \|^{2} \big]$ , and hence, by the σ-strong convexity of $C, \mathbf{z} \in C$ . In particular,

$$
\langle \nabla f(\mathbf{x}), \mathbf{z} \rangle \geq \langle \nabla f(\mathbf{x}), \mathbf{p}(\mathbf{x}) \rangle.\tag{13.44}
$$

The result (13.43) follows by the following arguments:

$$
\begin{array}{rcl} \langle \nabla f(\mathbf{x}), \mathbf{x} - \mathbf{p}(\mathbf{x}) \rangle & = & 2 \left\langle \nabla f(\mathbf{x}), \frac{\mathbf{x} + \mathbf{p}(\mathbf{x})}{2} - \mathbf{p}(\mathbf{x}) \right\rangle \\ & = & 2 \langle \nabla f(\mathbf{x}), \mathbf{z} - \mathbf{p}(\mathbf{x}) \rangle + 2 \left\langle \nabla f(\mathbf{x}), \frac{\sigma}{8} \frac{\nabla f(\mathbf{x})}{\| \nabla f(\mathbf{x}) \|} \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2} \right\rangle \\ & \overset{(13.44)}{\geq} & 2 \left\langle \nabla f(\mathbf{x}), \frac{\sigma}{8} \frac{\nabla f(\mathbf{x})}{\| \nabla f(\mathbf{x}) \|} \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2} \right\rangle \\ & = & \frac{\sigma}{4} \| \nabla f(\mathbf{x}) \| \cdot \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2} \\ & \geq & \frac{\sigma \delta}{4} \| \mathbf{x} - \mathbf{p}(\mathbf{x}) \|^{2}.\quad \square \end{array}
$$

We will now establish the main result of this section stating that under Assumption 13.25, the conditional gradient method with either an adaptive or exact line search stepsize strategies enjoys a linear rate of convergence in function values.

Theorem 13.27. Suppose that Assumption 13.25 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the conditional gradient method for solving problem (13.42) with stepsizes chosen by either the adaptive or exact line search strategies. Then for any $k \geq 0$ 2

(a) $f(\mathbf{x}^{k + 1}) - f_{\mathrm{opt}} \leq(1 - \lambda)(f(\mathbf{x}^{k}) - f_{\mathrm{opt}})$ , where

$$
\lambda = \min \left\{\frac{\sigma \delta}{8L_{f}}, \frac{1}{2} \right\};\tag{13.45}
$$

$$
\text{(b)} f(\mathbf{x}^{k}) - f_{\mathrm{opt}} \leq(1 - \lambda)^{k}(f(\mathbf{x}^{0}) - f_{\mathrm{opt}}).
$$

Proof. Let $k \geq 0$ and let $\tilde{\mathbf{x}}^{k} = \mathbf{x}^{k} + s_{k}(\mathbf{p}^{k} - \mathbf{x}^{k})$ , where $\mathbf{p}^{k} = \mathbf{p}(\mathbf{x}^{k})$ and $s_{k}$ is the stepsize chosen by the adaptive strategy:

$$
s_{k} = \min \left\{1, \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}} \right\}.
$$

By Lemma 13.7 (invoked with $\mathbf{x} = \mathbf{x}^{k}$ and $t = s_{k})$ ,

$$
f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq s_{k} S(\mathbf{x}^{k}) - \frac{s_{k}^{2} L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2}.\tag{13.46}
$$

There are two options: Either $s_{k} = 1$ , and in this case $S(\mathbf{x}^{k}) \geq L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}$ , and thus T

$$
f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq S(\mathbf{x}^{k}) - \frac{L_{f}}{2} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|^{2} \geq \frac{1}{2} S(\mathbf{x}^{k}),\tag{13.47}
$$

or, on the other hand, $\begin{array}{r}{s_{k} = \frac{S(\mathbf{x}^{k})}{L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}}} \end{array}$ , and then (13.46) amounts to

$$
f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq \frac{S^{2}(\mathbf{x}^{k})}{2L_{f} \| \mathbf{x}^{k} - \mathbf{p}^{k} \|^{2}},
$$

which, combined with (13.43) (with $\mathbf{x} = \mathbf{x}^{k})$ , implies the inequality

$$
f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq \frac{\sigma \delta}{8L_{f}} S(\mathbf{x}^{k}).\tag{13.48}
$$

Combining the inequalities (13.47) and (13.48) arising from the two possible cases, we obtain that

$$
f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq \lambda S(\mathbf{x}^{k}),
$$

where λ is given in (13.45). If the method is employed with an adaptive stepsize strategy, then $\tilde{\mathbf{x}}^{k} = \mathbf{x}^{k + 1}$ , and hence $f(\tilde{\mathbf{x}}^{k}) = f(\mathbf{x}^{k + \mathrm{1}})$ ). If the method is employed with an exact line search strategy, then $f(\mathbf{x}^{k + 1}) ~ \leq ~ f(\tilde{\mathbf{x}}^{k})$ . Therefore, in both stepsize regimes, we get

$$
f(\mathbf{x}^{k}) - f(\mathbf{x}^{k + 1}) \geq f(\mathbf{x}^{k}) - f(\tilde{\mathbf{x}}^{k}) \geq \lambda S(\mathbf{x}^{k}).\tag{13.49}
$$

On the other hand, by Lemma 13.12,

$$
f(\mathbf{x}^{k}) - f_{\mathrm{opt}} \leq S(\mathbf{x}^{k}).\tag{13.50}
$$

Combining (13.49) and (13.50), we obtain that

$$
\lambda(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) \leq(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) -(f(\mathbf{x}^{k + 1}) - f_{\mathrm{opt}}),
$$

from which it readily follows that

$$
f(\mathbf{x}^{k + 1}) - f_{\mathrm{opt}} \leq(1 - \lambda)(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}).
$$

Part (b) is an immediate consequence of (a).

## 13.4 The Randomized Generalized Block Conditional Gradient Method76

In this section we will consider a block version of the generalized conditional gradient method. The model and underlying assumptions are similar to those made w.r.t.

the block proximal gradient method in Section 11.2. We will consider the problem

$$
\min_{\mathbf{x}_{1} \in \mathbb{E}_{1}, \mathbf{x}_{2} \in \mathbb{E}_{2}, \ldots, \mathbf{x}_{p} \in \mathbb{E}_{p}} \left\{F(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{p}) \equiv f(\mathbf{x}_{1}, \mathbf{x}_{2}, \ldots, \mathbf{x}_{p}) + \sum_{j = 1}^{p} g_{j}(\mathbf{x}_{j}) \right\},\tag{13.51}
$$

where $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{p}$ are Euclidean spaces. We will denote the product space by $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{p}$ and use our convention (see Section 1.9) that the product space is also Euclidean with endowed norm

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{p}) \|_{\mathbb{E}} = \sqrt{\sum_{i = 1}^{p} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}}.
$$

We will omit the subscripts of the norms indicating the underlying vector space (whose identity will be clear from the context). The function $g : \mathbb{E}(- \infty, \infty]$ is defined by

$$
g(\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{p}) \equiv \sum_{i = 1}^{p} g_{i}(\mathbf{x}_{i}),
$$

and in particular $\operatorname{dom}(g) = \operatorname{dom}(g_{1}) \times \operatorname{dom}(g_{2}) \times \cdot \cdot \cdot \times \operatorname{dom}(g_{p})$ . The gradient w.r.t. the ith block $(i \in \{1, 2,..., p\})$ is denoted by $\nabla_{i} f$ and is actually a mapping from dom $(f)$ to $\mathbb{E}_{i}$ . The following is satisfied:

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

and this relation will also be written as $\mathbf{x} =(\mathbf{x}_{i})_{i = 1}^{p}$ . Thus, in our notation, the main model (13.51) can be simply written as

$$
\min_{\mathbf{x} \in \mathbb{E}} \{F(\mathbf{x}) = f(\mathbf{x}) + g(\mathbf{x})\}.
$$

The basic assumptions on the model are summarized below.

## Assumption 13.28.

(A) $g_{i} : \mathbb{E}_{i}(- \infty, \infty]$ is proper closed and convex with compact dom $(g_{i})$ for any $i \in \{1, 2, \ldots, p\}$

(B) $f : \mathbb{E} \to(- \infty, \infty]$ is convex and diferentiable over dom(f), which is assumed to be an open and convex set satisfying dom $(g) \subseteq \operatorname{dom}(f)$

(C) There exist $L_{1}, L_{2}, \dots, L_{p} > 0$ such that for any $i \in \{1, 2, \ldots, p\}$ it holds that

$$
\left\| \nabla_{i} f(\mathbf{x}) - \nabla_{i} f \left(\mathbf{x} + \mathcal{U}_{i}(\mathbf{d})\right) \right\| \leq L_{i} \| \mathbf{d} \|
$$

for all $\mathbf{x} \in \operatorname{dom}(f)$ and $\mathbf{d} \in \mathbb{E}_{i}$ for which $\mathbf{x} +{\mathcal{U}}_{i}(\mathbf{d}) \in \mathrm{dom}(f)$

(D) The optimal set of problem (13.51) is nonempty and denoted by $X^{\ast}$ . The optimal value is denoted by $F_{\mathrm{opt}}$

For any $i \in \{1, 2, \ldots, p\}$ , we denote

$$
\mathbf{p}_{i}(\mathbf{x}) \in \operatorname{argmin}_{\mathbf{v} \in \mathbb{E}_{i}} \{\langle \mathbf{v}, \nabla_{i} f(\mathbf{x}) \rangle + g_{i}(\mathbf{v})\}\tag{13.52}
$$

and define the ith partial conditional gradient norm as

$$
S_{i}(\mathbf{x}) = \max_{\mathbf{v} \in \mathbb{E}_{i}} \{\langle \nabla_{i} f(\mathbf{x}), \mathbf{x}_{i} - \mathbf{v} \rangle + g_{i}(\mathbf{x}_{i}) - g_{i}(\mathbf{v})\} = \langle \nabla_{i} f(\mathbf{x}), \mathbf{x}_{i} - \mathbf{p}_{i}(\mathbf{x}) \rangle + g_{i}(\mathbf{x}_{i}) - g_{i}(\mathbf{p}_{i}(\mathbf{x})).
$$

Obviously, we have

$$
S(\mathbf{x}) = \sum_{i = 1}^{p} S_{i}(\mathbf{x}).
$$

There might be multiple optimal solutions for problem (13.52) and also for problem (13.3) defining $\mathbf{p}(\mathbf{x})$ . Our only assumption is that $\mathbf{p}(\mathbf{x})$ is chosen as

$$
\mathbf{p}(\mathbf{x}) = \left(\mathbf{p}_{1}(\mathbf{x}), \mathbf{p}_{2}(\mathbf{x}), \dots, \mathbf{p}_{p}(\mathbf{x})\right).\tag{13.53}
$$

The latter is not a restricting assumption since the vector in the right-hand side of (13.53) is indeed a minimizer of problem (13.3). The randomized generalized block conditional gradient method is described below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Randomized Generalized Block Conditional Gradient (RGBCG) Method
Initialization: pick  $\mathbf{x}^{0} =(\mathbf{x}_{1}^{0}, \mathbf{x}_{2}^{0}, \ldots, \mathbf{x}_{p}^{0}) \in \text{dom}(g)$ .
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) pick  $i_{k} \in \{1, 2, \ldots, p\}$  randomly via a uniform distribution and  $t_{k} \in[0, 1]$ ;
(b) set  $\mathbf{x}^{k+1} = \mathbf{x}^{k} + t_{k}\mathcal{U}_{i_{k}}(\mathbf{p}_{i_{k}}(\mathbf{x}^{k}) - \mathbf{x}_{i_{k}}^{k})$ .
</div>

In our analysis the following notation is used:

$\xi_{k - 1} \equiv \left\{i_{0}, i_{1}, \dots, i_{k - 1} \right\}$ is a multivariate random variable.

- We will consider, in addition to the underlying Euclidean norm of the space <sup>E</sup>, the following weighted norm:

$$
\| \mathbf{x} \|_{L} \equiv \sqrt{\sum_{i = 1}^{p} L_{i} \| \mathbf{x}_{i} \|^{2}}.
$$

The rate of convergence of the RGBCG method with a specific choice of diminishing stepsizes is established in the following result.

Theorem 13.29. Suppose that Assumption 13.28 holds, and let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the RGBCG method for solving problem (13.51) with stepsizes $\begin{array}{r}{t_{k} = \frac{2p}{k + 2p}} \end{array}$ . Let Ω satisfy

$$
\Omega \geq \max_{\mathbf{x}, \mathbf{y} \in \operatorname{dom}(g)} \| \mathbf{x} - \mathbf{y} \|_{L}.\tag{13.54}
$$

Then

(a) for any $k \geq 1$

$$
\mathbb{E}_{\xi_{k - 1}}(F(\mathbf{x}^{k})) - F_{\mathrm{opt}} \leq \frac{2 \max \{(p - 1)(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}), p \Omega^{2}\}}{k + 2p - 2};\tag{13.55}
$$

(b) for any $k \geq 3$

$$
\min_{n = \lfloor k / 2 \rfloor + 2, \dots, k} \mathbb{E}_{\xi_{n - 1}}(S(\mathbf{x}^{n})) \leq \frac{8 \max \{(p - 1)(F(\mathbf{x}^{0}) - F_{\mathrm{opt}}), p \Omega^{2}\}}{k - 2}.\tag{13.56}
$$

Proof. We will use the shorthand notation $\mathbf{p}^{k} = \mathbf{p}(\mathbf{x}^{k})$ , and by the relation (13.53) it follows that $\mathbf{p}_{i}^{k} = \mathbf{p}_{i}(\mathbf{x}^{k})$ . Using the block descent lemma (Lemma 11.8) and the convexity of $g_{i_{k}}$ , we can write the following:

$$
\begin{array}{rl} & F(\mathbf{x}^{k + 1}) = f(\mathbf{x}^{k + 1}) + g(\mathbf{x}^{k + 1}) \\ & \quad = f(\mathbf{x}^{k} + t_{k} \mathcal{U}_{i_{k}}(\mathbf{p}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{k})) + g(\mathbf{x}^{k} + t_{k} \mathcal{U}_{i_{k}}(\mathbf{p}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{k})) \\ & \quad \leq f(\mathbf{x}^{k}) - t_{k} \langle \nabla_{i_{k}} f(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{p}_{i_{k}}^{k} \rangle + \frac{t_{k}^{2} L_{i_{k}}}{2} \| \mathbf{p}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{k} \|^{2} + \sum_{j = 1, j \neq i_{k}}^{p} g_{j}(\mathbf{x}^{k}) \\ & \quad \quad + g_{i_{k}}((1 - t_{k}) \mathbf{x}_{i_{k}}^{k} + t_{k} \mathbf{p}_{i_{k}}^{k}) \\ & \quad = f(\mathbf{x}^{k}) - t_{k} \langle \nabla_{i_{k}} f(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{p}_{i_{k}}^{k} \rangle + \frac{t_{k}^{2} L_{i_{k}} L_{\mathrm{的}}}{2} \| \mathbf{p}_{i_{k}}^{k} - \mathbf{x}_{i_{k}}^{k} \|^{2} + g(\mathbf{x}^{k}) \\ & \quad \quad - g_{i_{k}}(\mathbf{x}_{i_{k}}^{k}) + g_{i_{k}}((1 - t_{k}) \mathbf{x}_{i_{k}}^{k} + t_{k} \mathbf{p}_{i_{k}}^{k}) \\ & \quad \leq f(\mathbf{x}^{k}) - t_{k} \langle \nabla_{i_{k}} f(\mathbf{x}^{k}), \mathbf{x}_{i_{k}}^{k} - \mathbf{p}_{i_{k}}^{k} \rangle + \frac{t_{k}^{2} LI_{\mathrm{间}}}{2} \| \mathbf{p}_{\mathrm{间}}^{\mathrm{和}} - \mathbf{\mathrm{式}}_{\mathrm{间}}^{\mathrm{和}} \|^{2} + g(\mathbf{\mathrm{次}}^{\mathrm{次}}) \\ & \quad \quad - g_{\mathrm{间}}(\mathbf{\mathrm{次}}_{\mathrm{间}}^{\mathrm{次}}) +(1 - t_{\mathrm{间}}) g_{\mathrm{间}}(\mathbf{\mathrm{次}}_{\mathrm{间}}^{\mathrm{次}}) + t_{\mathrm{间}} g_{\mathrm{间}}(\mathbf{\mathrm{次}}_{\mathrm{间}}^{\mathrm{次}}) \\ & = F(\mathbf{\mathrm{次}}^{\mathrm{次}}) - t_{\mathrm{次}} S_{\mathrm{间}}(\mathbf{\mathrm{次}}^{\mathrm{次}}) + \frac{{t_{\mathrm{次}}}^{\mathrm{次}} LI_{\mathrm{间}}}{{2}} \| \mathbf{\mathrm{次}}_{\mathrm{间}}^{\mathrm{次}} - \mathbf{\mathrm{次}}_{\mathrm{间}}^{\mathrm{次}} \|^{2}.\end{array}
$$

Taking expectation w.r.t. the random variable $i_{k}$ , we obtain

$$
\begin{array}{c} \mathbb{E}_{i_{k}}(F(\mathbf{x}^{k + 1})) \leq F(\mathbf{x}^{k}) - \frac{t_{k}}{p} \sum_{i = 1}^{p} S_{i}(\mathbf{x}^{k}) + \frac{t_{k}^{2}}{2p} \sum_{i = 1}^{p} L_{i} \| \mathbf{p}_{i}^{k} - \mathbf{x}_{i}^{k} \|^{2} \\ = F(\mathbf{x}^{k}) - \frac{t_{k}}{p} S(\mathbf{x}^{k}) + \frac{t_{k}^{2}}{2p} \| \mathbf{p}^{k} - \mathbf{x}^{k} \|_{L}^{2}.\end{array}
$$

Taking expectation w.r.t. $\xi_{k - 1}$ and using the bound (13.54) results with the following inequality:

$$
\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) \leq \mathbb{E}_{\xi_{k - 1}}(F(\mathbf{x}^{k})) - \frac{t_{k}}{p} \mathbb{E}_{\xi_{k - 1}}(S(\mathbf{x}^{k})) + \frac{t_{k}^{2}}{2p} \Omega^{2}.
$$

Defining $\begin{array}{r}{\alpha_{k} = \frac{t_{k}}{p} = \frac{2}{k + 2p}} \end{array}$ and subtracting $F_{\mathrm{opt}}$ from both sides, we obtain

$$
\mathbb{E}_{\xi_{k}}(F(\mathbf{x}^{k + 1})) - F_{\mathrm{opt}} \leq \mathbb{E}_{\xi_{k - 1}}(F(\mathbf{x}^{k})) - F_{\mathrm{opt}} - \alpha_{k} \mathbb{E}_{\xi_{k - 1}}(S(\mathbf{x}^{k})) + \frac{p \alpha_{k}^{2}}{2} \Omega^{2}.
$$

Invoking Lemma 13.13 with $a_{k} = \mathsf E_{\xi_{k - 1}}(F(\mathbf x^{k})) - F_{\mathrm{opt}}, b_{k} = \mathsf E_{\xi_{k - 1}}(S(\mathbf x^{k}))$ , and $A = p \Omega^{\bar{2}}$ , noting that by Lemma 13.12 $a_{k} \le b_{k}$ , the inequalities (13.55) and (13.56) follow.

Chapter 14


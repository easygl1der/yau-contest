---
title: "Chapter 8 \u2014 Primal and Dual Projected Subgradient Methods"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 8
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 8671
source_line_end: 10779
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

# Chapter 8 — Primal and Dual Projected Subgradient Methods

> [[../README|本书目录]] · [[07-chapter-7-spectral-functions|上一章]] · [[09-chapter-9-mirror-descent|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 8671–10779。
> - 本章保留 5 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：Affine × 1；different × 1；sufficient × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Primal and Dual Projected Subgradient Methods

Underlying Space: In this chapter <sup>E</sup> is a Euclidean space, meaning a finite dimensional space endowed with an inner product $\langle \cdot, \cdot \rangle$ and the Euclidean norm $\| \cdot \| = \sqrt{\langle \cdot, \cdot \rangle}$

## 8.1 From Gradient Descent to Subgradient Descent

## 8.1.1 Descent Directions?

Consider the unconstrained problem

$$
\text{(P)} \quad \min \{f(\mathbf{x}): \mathbf{x} \in \mathbb{E}\}.
$$

If f is diferentiable over <sup>E</sup>, then a well-known method for solving problem (P) is the gradient method, also known as steepest descent, which takes the form

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - t_{k} \nabla f(\mathbf{x}^{k}),\tag{8.1}
$$

where $t_{k}$ is an appropriately chosen stepsize. A key property of the direction of the negative of the gradient is that it is a descent direction, a notion that is now recalled.

Definition 8.1 (descent direction). Let $f : \mathbb{E} \to(- \infty, \infty]$ be an extended realvalued function, and let $\mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ . A vector $\mathbf{0} \neq \mathbf{d} \in \mathbb{E}$ is called a descent direction of f at x if the directional derivative $f^{\prime}(\mathbf{x}; \mathbf{d})$ exists and is negative.

An important property of descent directions, which can be directly deduced from their definition, is that taking small enough steps along these directions leads to a decrease in function value.

Lemma 8.2 (descent property of descent directions [10, Lemma 4.2]). Let $f : \mathbb{E}(- \infty, \infty]$ be an extended real-valued function. $Let \mathbf{x} \in \operatorname{int}(\operatorname{dom}(f))$ , and assume that $\mathbf{0} \neq \mathbf{d} \in \mathbb{E}$ is a descent direction of f at x. Then there exists $\varepsilon > 0$ such that $\mathbf{x} + t \mathbf{d} \in \operatorname{dom}(f)$ and

$$
f(\mathbf{x} + t \mathbf{d}) < f(\mathbf{x})
$$

for any $t \in(0, \varepsilon]$

Coming back to the gradient method, we note that the directional derivative of f at $\mathbf{x}^{k}$ in the direction of $- \nabla f(\mathbf{x}^{k})$ is negative as long as $\nabla f(\mathbf{x}^{k}) \neq \mathbf{0}$ :

$$
f^{\prime}(\mathbf{x}^{k}; - \nabla f(\mathbf{x}^{k})) = \langle \nabla f(\mathbf{x}^{k}), - \nabla f(\mathbf{x}^{k}) \rangle = - \| \nabla f(\mathbf{x}^{k}) \|^{2} < 0,\tag{8.2}
$$

where Theorem 3.29 was used in the first equality. We have thus shown that $- \nabla f(\mathbf{x}^{k})$ is a descent direction of $f$ at $\mathbf{x}^{k}$ , which by Lemma 8.2 implies that there exists $\varepsilon > 0$ such that $f({\mathbf{x}}^{k} - t \nabla f({\mathbf{x}}^{k})) < f({\mathbf{x}}^{k})$ for any $t \in(0, \varepsilon]$ . In particular, this means that $t_{k}$ can always be chosen in a way that guarantees a decrease in the function value from one iteration to the next. For example, one choice of stepsize that guarantees descent is the exact line search strategy in which $t_{k}$ is chosen as

$$
t_{k} \in \operatorname{argmin}_{t \geq 0} f(\mathbf{x}^{k} - t \nabla f(\mathbf{x}^{k})).
$$

If f is not diferentiable, then scheme (8.1) is not well defined. Under our convexity assumption, a natural generalization to the nonsmooth case will consist in replacing the gradient by a subgradient (assuming that it exists):

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - t_{k} \mathbf{g}^{k}, \quad \mathbf{g}^{k} \in \partial f(\mathbf{x}^{k}),\tag{8.3}
$$

where we assume that the choice of the subgradient from $\partial f(\mathbf{x}^{k})$ is arbitrary. The scheme (8.3) is called the subgradient method. One substantial diference between the gradient and subgradient methods is that the direction of minus the subgradient is not necessarily a descent direction. This means that $t_{k}$ cannot be chosen in a way that will guarantee a descent property in function values of the scheme (8.3).

Example 8.3 (non-descent subgradient direction).<sup>40</sup> Consider the function $f : \mathbb{R} \times \mathbb{R} \to \mathbb{R}$ given by $f(x_{1}, x_{2}) = | x_{1} | + 2 | x_{2} |$ . Then

$$
\partial f(1, 0) = \{(1, x): | x | \leq 2\}.
$$

In particular, $(1, 2) \in \partial f(1, 0)$ . However, the direction $-(1, 2)$ is not a descent direction. To show this, note that for any $t > 0$ 2

$$
g(t) \equiv f((1, 0) - t(1, 2)) = f(1 - t, - 2t) = | 1 - t | + 4t = \left\{\begin{array}{ll} 1 + 3t, & t \in(0, 1], \\ 5t - 1, & t \geq 1.\end{array} \right.\tag{8.4}
$$

In particular,

$$
f^{\prime}((1, 0); -(1, 2)) = g_{+}^{\prime}(0) = 3 > 0,
$$

showing that $-(1, 2)$ is not a descent direction. It is also interesting to note that by (8.4), it holds that

$$
f((1, 0) - t(1, 2)) \geq 1 = f(1, 0) \mathrm{forany} t > 0,
$$

which actually shows that there is no point in the ray $\{(1, 0) - t(1, 2) : t > 0\}$ with a smaller function value than (1, 0).

## 8.1.2 Wolfe’s Example

To better understand the efect of nonsmoothness, we recall a famous example of Wolfe. The example deals with the gradient method employed on a nonsmooth convex function with stepsizes chosen by exact line search. The function is differentiable at all the iterate vectors generated by the method, which in particular means that all the directions picked by the method are descent directions, and the sequence of function values strictly decreases. However, although it seems that the nonsmoothness is “bypassed,” this is hardly the case. The sequence generated by the method converges to a nonoptimal point.

Let $\gamma > 1$ , and consider the function $f : \mathbb{R} \times \mathbb{R} \to \mathbb{R}$ given by

$$
f(x_{1}, x_{2}) = \left\{\begin{array}{ll} \sqrt{x_{1}^{2} + \gamma x_{2}^{2}}, & | x_{2} | \leq x_{1}, \\ \frac{x_{1} + \gamma | x_{2} |}{\sqrt{1 + \gamma}} & \text{else}.\end{array} \right.\tag{8.5}
$$

We begin by showing in Lemma 8.5 below that the function $f$ is closed and convex and describe its subdiferential set at any point in $\mathbb{R} \times \mathbb{R}$ . For that, we will prove that $f$ is actually a support function of a closed and convex set.<sup>41</sup> The proof of Lemma 8.5 uses the following simple technical lemma, whose trivial proof is omitted.

Lemma 8.4. Consider the problem

$$
\text{(P)} \quad \max \{g(\mathbf{y}): f_{1}(\mathbf{y}) \leq 0, f_{2}(\mathbf{y}) \leq 0\},
$$

where $g : \mathbb{E} \mathbb{R}$ is concave and $f_{1}, f_{2} : \mathbb{E} \mathbb{R}$ are convex. Assume that the problem max $\{g(\mathbf{y}) : f_{1}(\mathbf{y}) \leq 0\}$ has a unique solution $\tilde{\mathbf{y}}$ . Let $Y^{*}$ be the optimal set of problem (P). Then exactly one of the following two options holds:

(i) $f_{2}(\tilde{\mathbf{y}}) \leq 0_{;}$ , and in this case $Y^{*} = \{\tilde{\mathbf{y}}\}$

(ii) $f_{2}(\tilde{\mathbf{y}}) > 0$ , and in this case $Y^{*} = \operatorname{argmax} \{g(\mathbf{y}) : f_{1}(\mathbf{y}) \leq 0, f_{2}(\mathbf{y}) = 0\}$

Lemma 8.5. Let f be given by (8.5). Then

(a) $f = \sigma_{C}$ , where

$$
C = \left\{(y_{1}, y_{2}) \in \mathbb{R} \times \mathbb{R}: y_{1}^{2} + \frac{y_{2}^{2}}{\gamma} \leq 1, y_{1} \geq \frac{1}{\sqrt{1 + \gamma}} \right\};
$$

(b) $f$ is closed and convex;

$$
\partial f(x_{1}, x_{2}) = \left\{\begin{array}{ll} C, & x_{1} = x_{2} = 0, \\ \frac{(x_{1}, \gamma x_{2})}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}}, & | x_{2} | \leq x_{1}, x_{1} \neq 0, \\ \left(\frac{1}{\sqrt{1 + \gamma}}, \frac{\gamma \mathrm{sgn}(x_{2})}{\sqrt{1 + \gamma}}\right), & | x_{2} | > x_{1}, x_{2} \neq 0, \\ \left\{\frac{1}{\sqrt{\gamma + 1}} \right\} \times \left[- \frac{\gamma}{\sqrt{1 + \gamma}}, \frac{\gamma}{\sqrt{1 + \gamma}} \right], & x_{2} = 0, x_{1} < 0.\end{array} \right.\tag{c}
$$

Proof. By the definition of support functions,

$$
\sigma_{C}(x_{1}, x_{2}) = \max_{y_{1}, y_{2}} \left\{x_{1} y_{1} + x_{2} y_{2}: y_{1}^{2} + \frac{y_{2}^{2}}{\gamma} \leq 1, y_{1} \geq \frac{1}{\sqrt{1 + \gamma}} \right\}.\tag{8.6}
$$

Note that if $(x_{1}, x_{2}) =(0, 0)$ , then $\sigma_{C}(x_{1}, x_{2}) = 0$ and

$$
\operatorname{argmax}_{y_{1}, y_{2}} \left\{x_{1} y_{1} + x_{2} y_{2}: y_{1}^{2} + \frac{y_{2}^{2}}{\gamma} \leq 1, y_{1} \geq \frac{1}{\sqrt{1 + \gamma}} \right\} = C.
$$

Assume that $(x_{1}, x_{2}) \neq(0, 0)$ . Denoting $g(y_{1}, y_{2}) = x_{1} y_{1} + x_{2} y_{2}, \f_{1}(y_{1}, y_{2}) =$ $\begin{array}{r}{y_{1}^{2} + \frac{y_{2}^{2}}{\gamma} - 1} \end{array}$ and $\begin{array}{r}{f_{2}(y_{1}, y_{2}) = - y_{1} + \frac{1}{\sqrt{1 + \gamma}}} \end{array}$ , problem (8.6) becomes

$$
\max_{y_{1}, y_{2}} \{g(y_{1}, y_{2}): f_{1}(y_{1}, y_{2}) \leq 0, f_{2}(y_{1}, y_{2}) \leq 0\}.
$$

The assumptions made in Lemma 8.4 are all met: g is concave, $f_{1}, f_{2}$ are convex, and the optimal solution of

$$
\max_{y_{1}, y_{2}} \{g(y_{1}, y_{2}): f_{1}(y_{1}, y_{2}) \leq 0\}
$$

is unique and equal to $\begin{array}{r}{(\tilde{y}_{1}, \tilde{y}_{2}) = \frac{(x_{1}, \gamma x_{2})}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}}} \end{array}$ . Thus, by Lemma 8.4, there are two options:

Case I: $f_{2}(\tilde{y}_{1}, \tilde{y}_{2}) \leq 0$ , meaning that $\begin{array}{r}{\frac{x_{1}}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}} \geq \frac{1}{\sqrt{1 + \gamma}}} \end{array}$ . It can be easily seen that <sup>1 2</sup>the last inequality is equivalent to the condition $| x_{2} | \le x_{1}$ . Under this condition, by Lemma 8.4, $\begin{array}{r}{(\tilde{y}_{1}, \tilde{y}_{2}) = \frac{(x_{1}, \gamma x_{2})}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}}} \end{array}$ is the unique optimal solution of problem (8.6) with a corresponding function value of $\sigma_{C}(x_{1}, x_{2}) = \sqrt{x_{1}^{2} + \gamma x_{2}^{2}}.$

Case II: $f_{2}(\tilde{y}_{1}, \tilde{y}_{2}) > 0$ , which is the same as $x_{1} < | x_{2} |$ . In this case, by Lemma 8.4, all the optimal solutions of problem (8.6) satisfy $\begin{array}{r}{y_{1} = \frac{1}{\sqrt{1 + \gamma}}} \end{array}$ , and the problem thus amounts to

$$
\max_{y_{2}} \left\{\frac{1}{\sqrt{1 + \gamma}} x_{1} + x_{2} y_{2}: y_{2}^{2} \leq \frac{\gamma^{2}}{1 + \gamma} \right\}.
$$

The set of maximizers of the above problem is either $\textstyle \left\{{\frac{\gamma \mathrm{sgn}(x_{2})}{\sqrt{1 + \gamma}}} \right\}$ if $x_{2} ~ \neq ~ 0$ or $\begin{array}{r}{\left[- \frac{\gamma}{\sqrt{1 + \gamma}}, \frac{\gamma}{\sqrt{1 + \gamma}} \right] \mathrm{if} \x_{2} = 0} \end{array}$ . In both options, $\begin{array}{r}{\sigma_{C}(x_{1}, x_{2}) = \frac{x_{1} + \gamma | x_{2} |}{\sqrt{1 + \gamma}}} \end{array}$

To summarize, we have shown that

$$
\sigma_{C}(x_{1}, x_{2}) = \left\{\begin{array}{ll} \sqrt{x_{1}^{2} + \gamma x_{2}^{2}}, & | x_{2} | \leq x_{1}, \\ \frac{x_{1} + \gamma | x_{2} |}{\sqrt{1 + \gamma}} & \text{else}, \end{array} \right.
$$

establishing part (a), meaning that $f = \sigma_{C}$ . Therefore, $f,$ as a support function, is a closed and convex function, and we have thus established part (b) as well. To prove part (c), note that we also showed that

$$
\begin{array}{l} \operatorname{argmax}_{y_{1}, y_{2}} \{x_{1} y_{1} + x_{2} y_{2}:(y_{1}, y_{2}) \in C\} \\ = \left\{\begin{array}{ll} C, & x_{1} = x_{2} = 0, \\ \frac{(x_{1}, \gamma x_{2})}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}}, & | x_{2} | \leq x_{1}, x_{1} \neq 0, \\ \left(\frac{1}{\sqrt{1 + \gamma}}, \frac{\gamma \mathrm{sgn}(x_{2})}{\sqrt{1 + \gamma}}\right), & | x_{2} | > x_{1}, x_{2} \neq 0, \\ \left\{\frac{1}{\sqrt{\gamma + 1}} \right\} \times \left[- \frac{\gamma}{\sqrt{1 + \gamma}}, \frac{\gamma}{\sqrt{1 + \gamma}} \right], & x_{2} = 0, x_{1} < 0.\end{array} \right.\end{array}
$$

Combining this with the conjugate subgradient theorem (Corollary 4.21), as well as Example 4.9 and the closedness and convexity of C, implies

$$
\begin{array}{l} \partial f(x_{1}, x_{2}) = \partial \sigma_{C}(x_{1}, x_{2}) \\ \qquad = \operatorname{argmax}_{y_{1}, y_{2}} \{x_{1} y_{1} + x_{2} y_{2} - \sigma_{C}^{*}(y_{1}, y_{2})\} \\ \qquad = \operatorname{argmax}_{y_{1}, y_{2}} \{x_{1} y_{1} + x_{2} y_{2} - \delta_{C}(y_{1}, y_{2})\} \\ \qquad = \operatorname{argmax}_{y_{1}, y_{2}} \{x_{1} y_{1} + x_{2} y_{2}:(y_{1}, y_{2}) \in C\} \\ = \left\{\begin{array}{ll} C, & x_{1} = x_{2} = 0, \\ \frac{(x_{1}, \gamma x_{2})}{\sqrt{x_{1}^{2} + \gamma x_{2}^{2}}}, & | x_{2} | \leq x_{1}, x_{1} \neq 0, \\ \left(\frac{1}{\sqrt{1 + \gamma}}, \frac{\gamma \mathrm{sgn}(x_{2})}{\sqrt{1 + \gamma}}\right), & | x_{2} | > x_{1}, x_{2} \neq 0, \\ \left\{\frac{1}{\sqrt{\gamma + 1}} \right\} \times \left[- \frac{\gamma}{\sqrt{1 + \gamma}}, \frac{\gamma}{\sqrt{1 + \gamma}} \right], & x_{2} = 0, x_{1} < 0.\end{array} \right.\square.\end{array}
$$

Note that a direct result of part (c) of Lemma 8.5 and Theorem 3.33 is that f is not diferentiable only at the nonpositive part of the $x_{1}$ axis.

In the next result we will show that the gradient method with exact line search employed on f with a certain initialization converges to the nonoptimal point (0, 0) even though all the points generated by the gradient method are points in which f is diferentiable.

Lemma 8.6. Let $\{(x_{1}^{(k)}, x_{2}^{(k)})\}_{k \geq 0}$ be the sequence generated by the gradient method with exact line search employed on f with initial point $(x_{1}^{0}, x_{2}^{0}) =(\gamma, 1)$ , where $\gamma > 1$ Then for any $k \geq 0$

(a) f is diferentiable at $(x_{1}^{(k)}, x_{2}^{(k)})$ ;

(b) $| x_{2}^{(k)} | \leq x_{1}^{(k)}$ and $x_{1}^{(k)} \neq 0$ ;

$$
\text{(c)} \left(x_{1}^{(k)}, x_{2}^{(k)}\right) = \left(\gamma \left(\frac{\gamma - 1}{\gamma + 1}\right)^{k}, \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{k}\right).
$$

Proof. We only need to show part (c) since part (b) follows directly from the expression of $(x_{1}^{(k)}, x_{2}^{(k)})$ ) given in (c), and part (a) is then a consequence of Lemma 8.5(c).

We will prove part (c) by induction. The claim is obviously correct for $k = 0$ by the choice of initial point. Assume that the claim is correct for k, that is,

$$
(x_{1}^{(k)}, x_{2}^{(k)}) = \left(\gamma \left(\frac{\gamma - 1}{\gamma + 1}\right)^{k}, \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{k}\right).
$$

We will prove that it is correct for $k + 1$ , meaning that

$$
(x_{1}^{(k + 1)}, x_{2}^{(k + 1)}) =(\beta_{k}, \gamma_{k}),\tag{8.7}
$$

where

$$
\beta_{k} = \gamma \left(\frac{\gamma - 1}{\gamma + 1}\right)^{k + 1}, \gamma_{k} = \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{k + 1}.
$$

Since $| x_{2}^{(k)} | \leq x_{1}^{(k)}$ and $x_{1}^{(k)} \neq 0$ , we have $f(x_{1}^{(k)}, x_{2}^{(k)}) = \sqrt{(x_{1}^{(k)})^{2} + \gamma(x_{2}^{(k)})^{2}}$ , and by Lemma $8.5(c), f$ is diferentiable at $(x_{1}^{(k)}, x_{2}^{(k)})$ with

$$
\nabla f(x_{1}^{(k)}, x_{2}^{(k)}) = \frac{1}{\sqrt{(x_{1}^{(k)})^{2} + \gamma(x_{2}^{(k)})^{2}}}(x_{1}^{(k)}, \gamma x_{2}^{(k)}).
$$

What is important in the above formula is that $\nabla f(x_{1}^{(k)}, x_{2}^{(k)})$ can be written in the form

$$
\nabla f(x_{1}^{(k)}, x_{2}^{(k)}) = \alpha_{k}(x_{1}^{(k)}, \gamma x_{2}^{(k)})\tag{8.8}
$$

for some positive constant $\alpha_{k}$ . To show the validity of (8.7), we will define $g(t) \equiv$ $f((x_{1}^{(k)}, x_{2}^{(k)}) - t(x_{1}^{(k)}, \gamma x_{2}^{(k)}))$ and prove the following two statements:

$$
\mathrm{(A)}(\beta_{k}, \gamma_{k}) =(x_{1}^{(k)}, x_{2}^{(k)}) - \frac{2}{\gamma + 1}(x_{1}^{(k)}, \gamma x_{2}^{(k)}).
$$

$$
\text{(B)} g^{\prime} \left(\frac{2}{\gamma + 1}\right) = 0.
$$

(A) and (B) are enough to show (8.7) since $g$ is strictly convex. The proof of $\mathrm{(A)}$ follows by the computations below:

$$
x_{1}^{(k)} - \frac{2}{\gamma + 1} x_{1}^{(k)} = \frac{\gamma - 1}{\gamma + 1} x_{1}^{(k)} = \frac{\gamma - 1}{\gamma + 1} \gamma \left(\frac{\gamma - 1}{\gamma + 1}\right)^{k} = \gamma \left(\frac{\gamma - 1}{\gamma + 1}\right)^{k + 1} = \beta_{k},
$$

$$
x_{2}^{(k)} - \frac{2 \gamma}{\gamma + 1} x_{2}^{(k)} = \frac{- \gamma + 1}{\gamma + 1} x_{2}^{(k)} = \frac{- \gamma + 1}{\gamma + 1} \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{k} = \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{k + 1} = \gamma_{k}.
$$

To prove (B), note that

$$
\begin{array}{l} g(t) = f \left((x_{1}^{(k)}, x_{2}^{(k)}) - t(x_{1}^{(k)}, \gamma x_{2}^{(k)})\right) = f((1 - t) x_{1}^{(k)},(1 - \gamma t) x_{2}^{(k)}) \\ = \sqrt{(1 - t)^{2}(x_{1}^{(k)})^{2} + \gamma(1 - \gamma t)^{2}(x_{2}^{(k)})^{2}}.\end{array}
$$

Therefore,

$$
g^{\prime}(t) = \frac{(t - 1)(x_{1}^{(k)})^{2} + \gamma^{2}(\gamma t - 1)(x_{2}^{(k)})^{2}}{\sqrt{(1 - t)^{2}(x_{1}^{(k)})^{2} + \gamma(1 - \gamma t)^{2}(x_{2}^{(k)})^{2}}}.\tag{8.9}
$$

To prove that $\begin{array}{r}{g^{\prime} \big(\frac{2}{\gamma + 1} \big) = 0} \end{array}$ , it is enough to show that the nominator in the last expression is equal to zero at $\textstyle t ={\frac{2}{\gamma + 1}}$ . Indeed,

$$
\begin{array}{l} \left(\frac{2}{\gamma + 1} - 1\right)(x_{1}^{(k)})^{2} + \gamma^{2} \left(\gamma \cdot \frac{2}{\gamma + 1} - 1\right)(x_{2}^{(k)})^{2} \\ = \left(- \frac{\gamma - 1}{\gamma + 1}\right) \gamma^{2} \left(\frac{\gamma - 1}{\gamma + 1}\right)^{2k} + \gamma^{2} \left(\frac{\gamma - 1}{\gamma + 1}\right) \left(- \frac{\gamma - 1}{\gamma + 1}\right)^{2k} \\ = 0.\quad \square \end{array}
$$

Obviously, by Lemma 8.6, the sequence generated by the gradient method with exact line search and initial point $(\gamma, 1)$ converges to $(0, 0)$ , which is not a minimizer of f since f is not bounded below (take $x_{2} = 0$ and $x_{1} \to - \infty)$ . Actually, $(- 1, 0)$ is a descent direction of f at (0, 0). The contour lines of the function along with the iterates of the gradient method are described in Figure 8.1.

![Figure 8.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/28c75321ed802d3bcbb2f8c79ad393154e4ca2c26c0ce598899802b9e672d846.jpg)  
Figure 8.1. Contour lines of Wolfe’s function with $\begin{array}{r}{\gamma = \frac{16}{9}} \end{array}$ along with the iterates of the gradient method with exact line search.

## 8.2 The Projected Subgradient Method

The main model that will be discussed in this section is

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\},\tag{8.10}
$$

where the following assumption will be made throughout this section.

## Assumption 8.7.

(A) $f : \mathbb{E} \to(- \infty, \infty]$ is proper closed and convex.

(B) $C \subseteq \mathbb{E}$ is nonempty closed and convex.

(C) $C \subseteq$ int(dom(f )).

(D) The optimal set of (8.10) is nonempty and denoted by $X^{\ast}$ . The optimal value of the problem is denoted by $f_{\mathrm{opt}}$

Remark 8.8 (subdiferentiability of f and closedness of $X^{*})$ . Since f is convex and $C \subseteq$ int(dom(f)), it follows by Theorem 3.14 that $f$ is subdiferentiable over C. Also, since f is closed,

$$
X^{*} = C \cap \operatorname{Lev}(f, f_{\mathrm{opt}})
$$

is closed. This means in particular that for any ${\textbf{x}} \notin X^{*}$ the distance $d_{X^{*}}(\mathbf{x})$ is positive.

From now on, we will use the following notation: $f^{\prime}(\mathbf{x})$ will denote a certain subgradient of f at x, meaning a member in $\partial f(\mathbf{x})$ . Thus, $f^{\prime}$ is actually a function from $C$ to $\mathbb{E}^{*}$ . The rule for choosing $f^{\prime}(\mathbf{x})$ out of the members of $\partial f(\mathbf{x})$ can be arbitrary but has to be deterministic, meaning that if $f^{\prime}(\mathbf{x})$ is evaluated twice, the results have to be the same.

Equipped with the observations of the previous section, we can speculate that a method which utilizes subgradients rather than gradients will not necessarily be a descent method and will not have to be based on a line search procedure for choosing its stepsizes. We will see that this is indeed the case for the projected subgradient method.

## 8.2.1 The Method

Each iteration of the projected subgradient method consists of a step taken toward the negative of the chosen subgradient followed by an orthogonal projection onto the underlying set C.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Projected Subgradient Method
Initialization: pick  $x^{0} \in C$  arbitrarily.
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) pick a stepsize  $t_{k} &gt; 0$  and a subgradient  $f'(\mathbf{x}^{k}) \in \partial f(\mathbf{x}^{k})$ ;
(b) set  $\mathbf{x}^{k+1} = P_{C}(\mathbf{x}^{k} - t_{k}f'(\mathbf{x}^{k}))$ .
</div>

The sequence generated by the projected subgradient method is $\{\mathbf{x}^{k}\}_{k \geq 0}.$ 2 while the sequence of function values generated by the method is $\{f(\mathbf{x}^{k})\}_{k \geq 0}$ . As was already discussed, the sequence of function values is not necessarily monotone, and we will be also interested in the sequence of best achieved function values, which is defined by

$$
f_{\mathrm{best}}^{k} \equiv \min_{n = 0, 1, \dots, k} f(\mathbf{x}^{n}).\tag{8.11}
$$

Obviously, the sequence $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ is nonincreasing.

Remark 8.9 (stopping criterion for the projected subgradient method). In actual implementations of the projected subgradient method, a stopping criterion has to be incorporated, but as a rule, we will not deal in this book with stopping criteria but rather concentrate on issues of convergence.

Remark 8.10 (zero subgradients). In the unlikely case where $f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}$ for some k, then by Fermat’s optimality condition (Theorem 3.63), $\mathbf{x}^{k}$ is a minimizer of f over <sup>E</sup>, and since $\mathbf{x}^{k} \in C$ , it is also a minimizer of f over C. In this situation, the method is “stuck” at the optimal solution $\mathbf{x}^{k}$ from iteration k onward, meaning that $\mathbf{x}^{n} = \mathbf{x}^{k}$ for all $n \geq k$

The analysis of the projected subgradient method relies on the following simple technical lemma.

Lemma 8.11 (fundamental inequality for projected subgradient). Suppose that Assumption 8.7 holds. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method. Then for any $\mathbf{x}^{*} \in X^{*}$ and $k \geq 0$ ,

$$
\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + t_{k}^{2} \| f^{\prime}(\mathbf{x}^{k}) \|^{2}.\tag{8.12}
$$

Proof.

$$
\begin{array}{rl} \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} = & \| P_{C}(\mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k})) - P_{C}(\mathbf{x}^{*}) \|^{2} \\ \overset{(*)}{\leq} & \| \mathbf{x}^{k} - t_{k} f^{\prime}(\mathbf{x}^{k}) - \mathbf{x}^{*} \|^{2} \\ = & \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k} \langle f^{\prime}(\mathbf{x}^{k}), \mathbf{x}^{k} - \mathbf{x}^{*} \rangle + t_{k}^{2} \| f^{\prime}(\mathbf{x}^{k}) \|^{2} \\ \overset{(* *)}{\leq} & \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + t_{k}^{2} \| f^{\prime}(\mathbf{x}^{k}) \|^{2}, \end{array}
$$

where the inequality (∗) is due to the nonexpansiveness of the orthogonal projection operator (Theorem 6.42), and (∗∗) follows by the subgradient inequality.

## 8.2.2 Convergence under Polyak’s Stepsize Rule

We will require an assumption in addition to Assumption 8.7 in order to prove convergence of the sequence of function values generated by the projected subgradient method.

Assumption 8.12. There exists a constant $L_{f} > 0$ for which $\| \mathbf{g} \| \leq L_{f}$ for all $\mathbf{g} \in \partial f(\mathbf{x}), \mathbf{x} \in C$

Since $C \subseteq \operatorname{int}(\operatorname{dom}(f))$ (Assumption $8.7(\mathrm{C}))$ , it follows by Theorem 3.61 that Assumption 8.12 implies that f is Lipschitz continuous over $C$ with constant $L_{f} \mathbf{:}$ :

$$
| f(\mathbf{x}) - f(\mathbf{y}) | \leq L_{f} \| \mathbf{x} - \mathbf{y} \| \text{for all} \mathbf{x}, \mathbf{y} \in C.
$$

In addition, since (again) $C \subseteq \operatorname{int}(\operatorname{dom}(f))$ , it follows by Theorem 3.16 that $\mathrm{As} -$ sumption 8.12 holds if C is assumed to be compact.

One natural way to choose the stepsize $t_{k}$ is by taking it as the minimizer of the right-hand side of (8.12) over $t_{k} \geq 0$

$$
t_{k} = \frac{f(\mathbf{x}^{k}) - f_{\mathrm{opt}}}{\| f^{\prime}(\mathbf{x}^{k}) \|^{2}}.
$$

When $f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}$ , the above formula is not defined, and by Remark 8.10, $\mathbf{x}^{k}$ is an optimal solution of (8.10). We will artificially define $t_{k} = 1$ (any other positive number could also have been chosen). The complete formula is therefore

$$
t_{k} = \left\{\begin{array}{ll} \frac{f(\mathbf{x}^{k}) - f_{\mathrm{opt}}}{\| f^{\prime}(\mathbf{x}^{k}) \|^{2}}, & f^{\prime}(\mathbf{x}^{k}) \neq \mathbf{0}, \\ 1, & f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}.\end{array} \right.\tag{8.13}
$$

We will refer to this stepsize rule as Polyak’s stepsize $rule.^{42}$

The main convergence result of the projected subgradient method with Polyak’s stepsize rule is given in the next theorem.

Theorem 8.13 (convergence of projected subgradient with Polyak’s stepsize). Suppose that Assumptions 8.7 and 8.12 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with Polyak’s stepsize rule (8.13). Then

$$
\left(a\right) \left\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \right\|^{2} \leq \left\| \mathbf{x}^{k} - \mathbf{x}^{*} \right\|^{2} foranyk \geq 0and \mathbf{x}^{*} \in X^{*};
$$

(b) $f(\mathbf{x}^{k}) \to f_{\mathrm{opt}} \as \k \to \infty;$

(c) $\begin{array}{r}{f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{L_{f} d_{X^{*}}(\mathbf{x}^{0})}{\sqrt{k + 1}}} \end{array}$ for any $k \geq 0$

Proof. Let n be a nonnegative integer and $\mathbf{x}^{*} \in X^{*}$ . By Lemma 8.11,

$$
\left\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \right\|^{2} \leq \left\| \mathbf{x}^{n} - \mathbf{x}^{*} \right\|^{2} - 2t_{n}(f(\mathbf{x}^{n}) - f_{\text{opt}}) + t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.\tag{8.14}
$$

If $f^{\prime}(\mathbf{x}^{n}) \neq \mathbf{0}$ , then by substituting $\begin{array}{r}{t_{n} = \frac{f(\mathbf{x}^{n}) - f_{\mathrm{opt}}}{\Vert f^{\prime}(\mathbf{x}^{n}) \Vert^{2}}} \end{array}$ into (8.14), it follows that

$$
\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2}}{\| f^{\prime}(\mathbf{x}^{n}) \|^{2}}.
$$

Using the bound $\| f^{\prime}(\mathbf{x}^{n}) \| \leq L_{f}$ , we thus obtain

$$
\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2}}{L_{f}^{2}}.\tag{8.15}
$$

Inequality (8.15) also holds when $f^{\prime}(\mathbf{x}^{n}) = \mathbf{0}$ , since in this case $f(\mathbf{x}^{n}) = f_{\mathrm{opt}}$ and $\mathbf{x}^{n + \bar{1}} = \bar{\mathbf{x}}^{n}$ . A direct result of (8.15) is that

$$
\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2},
$$

and part (a) is thus proved (by plugging $n = k)$ . Summing inequality (8.15) over $n = 0, 1, \ldots, k$ , we obtain that

$$
\frac{1}{L_{f}^{2}} \sum_{n = 0}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2} \leq \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} - \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2},
$$

and thus

$$
\sum_{n = 0}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2} \leq L_{f}^{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2}.
$$

Since the above inequality holds for any $\mathbf{x}^{*} \in X^{*}$ , it follows that

$$
\sum_{n = 0}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2} \leq L_{f}^{2} d_{X^{*}}^{2}(\mathbf{x}^{0}),\tag{8.16}
$$

which in particular implies that $f(\mathbf{x}^{n}){-} f_{\mathrm{opt}} \to 0$ as $n \to \infty$ , and the validity of (b) is established. To prove part (c), note that since $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}$ for any $n = 0, 1, \ldots, k$ 2 it follows that

$$
\sum_{n = 0}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}})^{2} \geq(k + 1)(f_{\mathrm{best}}^{k} - f_{\mathrm{opt}})^{2},
$$

which, combined with (8.16), yields

$$
(k + 1)(f_{\text{best}}^{k} - f_{\text{opt}})^{2} \leq L_{f}^{2} d_{X^{*}}^{2}(\mathbf{x}^{0}),
$$

and hence

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{L_{f} d_{X^{*}}(\mathbf{x}^{0})}{\sqrt{k + 1}}.\quad \square
$$

Remark 8.14. Note that in the convergence result of Theorem 8.13 we can replace the constant $L_{f}$ with $\operatorname{max}_{n = 0, 1, \ldots, k} \| f^{\prime}(\mathbf{x}^{n}) \|$

The property of the sequence generated by the projected subgradient method described in part (a) of Theorem 8.13 is known as Fej´er monotonicity.

Definition 8.15 (Fej´er monotonicity). A sequence $\{\mathbf{x}^{k}\}_{k \geq 0} \subseteq \mathbb{E}$ is called Fej´er monotone w.r.t. a set $S \subseteq \mathbb{E}$ if

$$
\left\| \mathbf{x}^{k + 1} - \mathbf{y} \right\| \leq \left\| \mathbf{x}^{k} - \mathbf{y} \right\| forallk \geq 0and \mathbf{y} \in S.
$$

Since Fej´er monotonicity w.r.t. a set $S$ implies that for all $k \geq 0$ and any $\mathbf{y} \in S, \| \mathbf{x}^{k} - \mathbf{y} \| \leq \| \mathbf{x}^{0} - \mathbf{y} \|$ , it follows that Fej´er monotone sequences are always bounded. We will now prove that sequences which are Fej´er monotone w.r.t. sets containing their limit points are convergent.

Theorem 8.16 (convergence under Fej´er monotonicity). Let $\{\mathbf{x}^{k}\}_{k \geq 0} \subseteq \mathbb{E}$ be a sequence, and let S be a set satisfying $D \subseteq S$ , where D is the set comprising all the limit points of $\{{\bf x}^{k}\}_{k \ge 0}$ . If $\{{\bf x}^{k}\}_{k \ge 0}$ is Fej´er monotone w.r.t. S, then it converges to a point in D.

Proof. Since $\{{\bf x}^{k}\}_{k \ge 0}$ is Fej´er monotone, it is also bounded and hence has limit points. Let x˜ be a limit point of the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ , meaning that there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \geq 0}$ such that $\mathbf{x}^{k_{j}} \tilde{\mathbf{x}}$ . Since $\tilde{\mathbf{x}} \in D \subseteq S$ , it follows by the Fej´er monotonicity w.r.t. S that for any $k \geq 0$ 2

$$
\left\| \mathbf{x}^{k + 1} - \tilde{\mathbf{x}} \right\| \leq \left\| \mathbf{x}^{k} - \tilde{\mathbf{x}} \right\|.
$$

Thus, $\{\| \mathbf{x}^{k} - \tilde{\mathbf{x}} \|\}_{k \geq 0}$ is a nonincreasing sequence which is bounded below (by zero) and hence convergent. Since $\| \mathbf{x}^{k_{j}} - \tilde{\mathbf{x}} \| 0$ as $j \to \infty$ , it follows that the whole sequence $\{\| \mathbf{x}^{k} - \tilde{\mathbf{x}} \|\}_{k \geq 0}$ converges to zero, and consequently $\mathbf{x}^{k} \to \tilde{\mathbf{x}}$ as $k \to \infty$ □

Equipped with the last theorem, we can now prove convergence of the sequence generated by the projected subgradient method with Polyak’s stepsize rule.

Theorem 8.17 (convergence of the sequence generated by projected subgradient with Polyak’s stepsize rule). Suppose that Assumptions 8.7 and 8.12 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with Polyak’s stepsize rule (8.13). Then $\{{\bf x}^{k}\}_{k \ge 0}$ converges to a point in $X^{*}$

Proof. By Theorem $8.13(a)$ , the sequence is Fej´er monotone w.r.t. $X^{*}$ . Therefore, by Theorem 8.16, to show convergence to a point in $X^{*}$ , it is enough to show that any limit point of the sequence is necessarily in $X^{*}$ (that is, an optimal solution of the problem). Let then $\tilde{\mathbf{x}}$ be a limit point of the sequence. Then there exists a subsequence $\{\mathbf{x}^{k_{j}}\}_{j \geq 0}$ converging to $\tilde{\mathbf{x}}.$ . By the closedness of $C,{\tilde{\mathbf{x}}} \in C$ . By Theorem 8.13(b),

$$
f(\mathbf{x}^{k_{j}}) \rightarrow f_{\mathrm{opt}} \mathrm{as} j \rightarrow \infty.\tag{8.17}
$$

Since $\tilde{\mathbf{x}} \in C \subseteq \operatorname{int}(\operatorname{dom}(f))$ , it follows by Theorem 2.21 that f is continuous at $\tilde{\mathbf{x}}.$ which, combined with (8.17), implies that $f(\tilde{\mathbf{x}}) = f_{\mathrm{opt}}$ , meaning that $\tilde{\mathbf{x}} \in X^{*}$ □

Part (c) of Theorem 8.13 provides an upper bound on the rate of convergence in which the sequence $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ converges to $f_{\mathrm{opt}}$ . Specifically, the result shows that the distance of $f_{\mathrm{best}}^{k}$ to $f_{\mathrm{opt}}$ is bounded above by a constant factor of $\scriptstyle{\frac{1}{\sqrt{k + 1}}}$ with k being the iteration index. We will sometimes refer to it as an $^{6} O(1 /{\sqrt{k}})$ rate of convergence result” with a slight abuse of the “big $\mathrm{O^{\mathfrak{s}}}$ notation (which actually refers to asymptotic results). We can also write the rate of convergence result as a complexity result. For that, we first introduce the concept of an ε-optimal solution. A vector $\mathbf{x} \in C$ is called an ε-optimal solution of problem (8.10) if $f(\mathbf{x}) - f_{\mathrm{opt}} \leq \varepsilon.$ In complexity analysis, the following question is asked: how many iterations are required to obtain an ε-optimal solution $\mathscr{l}$ That is, how many iterations are required to obtain the condition

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \varepsilon ?\tag{8.18}
$$

Using Theorem $8.13(\mathrm{c)}$ , it follows that a sufficient condition for (8.18) to hold is the following inequality: C

$$
\frac{L_{f} d_{X^{*}}(\mathbf{x}^{0})}{\sqrt{k + 1}} \leq \varepsilon,\tag{8.19}
$$

which is the same as

$$
k \geq \frac{L_{f}^{2} d_{X *}^{2}(\mathbf{x}^{0})}{\varepsilon^{2}} - 1.
$$

Therefore, an order of $\textstyle{\frac{1}{\varepsilon^{2}}}$ iterations is required to obtain an ε-optimal solution. We summarize the discussion in the following theorem.

Theorem 8.18 (complexity of projected subgradient with Polyak’s stepsize). Suppose that Assumptions 8.7 and 8.12 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with Polyak’s stepsize rule (8.13). Then for any nonnegative integer k satisfying

$$
k \geq \frac{L_{f}^{2} d_{X^{*}}^{2}(\mathbf{x}^{0})}{\varepsilon^{2}} - 1,
$$

it holds that

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \varepsilon.
$$

Example 8.19. Consider the problem

$$
\min_{x_{1}, x_{2}} \left\{f(x_{1}, x_{2}) = | x_{1} + 2x_{2} | + | 3x_{1} + 4x_{2} | \right\}.
$$

Since in this chapter the underlying spaces are Euclidean, it follows that the underlying space in this example is ${\dot{\mathbb{R}}}^{2}$ endowed with the dot product and the $l_{2}{\mathrm{- norm}}.$ The optimal solution of the problem is $(x_{1}, x_{2}) =(0, 0)$ , and the optimal value is $f_{\mathrm{opt}} = 0$ . Clearly, both Assumptions 8.7 and 8.12 hold. Since $f(\mathbf{x}) = \| \mathbf{Ax} \|_{1}$ , where $\mathbf{A} ={\bigl(}{\begin{array}{ll}{1} &{2} \\{3} &{4} \end{array}}{\bigr)}$ , it follows that for any $\mathbf{x} \in \mathbb{R}^{2}$ 2

$$
\partial f(\mathbf{x}) = \mathbf{A}^{T} \partial h(\mathbf{Ax}),
$$

where $h(\mathbf{x}) = \| \mathbf{x} \|_{1}$ . By Example 3.41, for any $\mathbf{w} \in \mathbb{R}^{2}$

$$
\partial h(\mathbf{w}) = \left\{\mathbf{z} \in \mathbb{R}^{2}: z_{i} = \mathrm{sgn}(w_{i}), i \in I_{\neq}(\mathbf{w}), | z_{j} | \leq 1, j \in I_{0}(\mathbf{w}) \right\},
$$

where

$$
I_{0}(\mathbf{w}) = \{i: w_{i} = 0\}, I_{\neq}(\mathbf{w}) = \{i: w_{i} \neq 0\}.
$$

Hence, if $\pmb{\eta} \in \partial h(\mathbf{Ax})$ , then $\pmb{\eta} \in[- 1, 1] \times[- 1, 1]$ , and, in particular, $\| \pmb{\eta} \|_{2} \le \sqrt{2}$ Therefore, since any $\mathbf{g} \in \partial f(\mathbf{x})$ can be written as $\mathbf{g} = \mathbf{A}^{T} \boldsymbol{\eta}$ for some $\pmb{\eta} \in \partial h(\mathbf{Ax})$ ， we have

$$
\| \mathbf{g} \|_{2} = \| \mathbf{A}^{T} \boldsymbol{\eta} \|_{2} \leq \| \mathbf{A}^{T} \|_{2, 2} \| \boldsymbol{\eta} \|_{2} \leq \| \mathbf{A}^{T} \|_{2, 2} \cdot \sqrt{2} = 7.7287.
$$

We can thus choose $L_{f} = 7.7287$

The subgradient method update step takes the form

$$
\binom{x_{1}^{k + 1}}{x_{2}^{k + 1}} = \binom{x_{1}^{k}}{x_{2}^{k}} - \frac{| x_{1}^{k} + 2x_{2}^{k} | + | 3x_{1}^{k} + 4x_{2}^{k} |}{\| \mathbf{v}(x_{1}^{k}, x_{2}^{k}) \|_{2}^{2}} \mathbf{v}(x_{1}^{k}, x_{2}^{k}),
$$

where we choose

$$
\mathbf{v}(x_{1}, x_{2}) = \binom{\operatorname{sgn}(x_{1} + 2x_{2}) + 3 \operatorname{sgn}(3x_{1} + 4x_{2})}{2 \operatorname{sgn}(x_{1} + 2x_{2}) + 4 \operatorname{sgn}(3x_{1} + 4x_{2})} \in \partial f(x_{1}, x_{2}).
$$

Note that in the terminology of this book $\operatorname{sgn}(0) = 1$ (see Section 1.7.2), which dictates the choice of the subgradient among the vectors in the subdiferential set in cases where $f$ is not diferentiable at the given point. We can immediately see that there are actually only four possible choices of directions $\mathbf{v}(x_{1}, x_{2})$ depending on the two possible values of sgn $(x_{1} + 2x_{2})$ and the two possible choices of $\mathrm{sgn}(3x_{1} + 4x_{2})$ . The four possible directions are

$$
\mathbf{u}_{1} = \binom{- 4}{- 6}, \quad \mathbf{u}_{2} = \binom{2}{2}, \quad \mathbf{u}_{3} = \binom{- 2}{- 2}, \quad \mathbf{u}_{4} = \binom{4}{6}.
$$

By Remark 8.14, the constant $L_{f}$ can be chosen as m $\operatorname{ax}_{i} \{\| \mathbf{u}_{i} \|_{2}\} = 7.2111$ , which is a slightly better bound than 7.7287. The first 100 iterations of the method with a starting point $(1, 2)^{T}$ are described in Figure 8.2. Note that the sequence of function values is indeed not monotone (although convergence to $f_{\mathrm{opt}}$ is quite apparent) and that actually only two directions are being used by the method: $(- 2, - 2)^{T}$ ， $(4, 6)^{T}$

## 8.2.3 The Convex Feasibility Problem

Let $S_{1}, S_{2}, \ldots, S_{m} \subseteq \mathbb{E}$ be closed and convex sets. Assume that

$$
S \equiv \bigcap_{i = 1}^{m} S_{i} \neq \emptyset.\tag{8.20}
$$

The convex feasibility problem is the problem of finding a point x in the intersection $\cap_{i = 1}^{m} S_{i}$ . We can formulate the problem as the following minimization problem:

$$
\min_{\mathbf{x}} \left\{f(\mathbf{x}) \equiv \max_{i = 1, 2, \dots, m} d_{S_{i}}(\mathbf{x}) \right\}.\tag{8.21}
$$

Since we assume that the intersection is nonempty, we have that $f_{\mathrm{opt}} = 0$ and that the optimal set is S. Another property of $f$ is that it is Lipschitz continuous with constant 1.

Lemma 8.20. Let $S_{1}, S_{2}, \ldots, S_{m}$ be nonempty closed and convex sets. Then the function $f$ given in (8.21) is Lipschitz continuous with constant 1.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/f5c50d8a12209ae7aa3495d760544c8ecf2f78869dc46a348cf923e2f8afa877.jpg)

![Figure 8.2](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/57f9b9597f5e3801e7a746ed3f55aec00f1463d8212dc94094b176213508d0d8.jpg)

Figure 8.2. First 100 iterations of the subgradient method applied to the function $f(x_{1}, x_{2}) = | x_{1} + 2x_{2} | + | 3x_{1} + 4x_{2} |$ with Polyak’s stepsize rule and starting point $(1, 2)^{T}$ . The $left$ image describes the function values at each iteration, and the right image shows the contour lines along with the iterations.

Proof. Let $i \in \{1, 2, \dots, m\}$ , and let $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ . Then

$$
\begin{array}{ll} d_{S_{i}}(\mathbf{x}) = \| \mathbf{x} - P_{S_{i}}(\mathbf{x}) \| \\ \leq \| \mathbf{x} - P_{S_{i}}(\mathbf{y}) \| & \left[\| \mathbf{x} - P_{S_{i}}(\mathbf{x}) \| = \operatorname{argmin}_{\mathbf{v} \in S_{i}} \| \mathbf{x} - \mathbf{v} \| \right] \\ \leq \| \mathbf{x} - \mathbf{y} \| + \| \mathbf{y} - P_{S_{i}}(\mathbf{y}) \| & \text{[triangle inequality]} \\ = \| \mathbf{x} - \mathbf{y} \| + d_{S_{i}}(\mathbf{y}).& \left[d_{S_{i}}(\mathbf{y}) = \| \mathbf{y} - P_{S_{i}}(\mathbf{y}) \| \right] \end{array}
$$

Thus,

$$
d_{S_{i}}(\mathbf{x}) - d_{S_{i}}(\mathbf{y}) \leq \| \mathbf{x} - \mathbf{y} \|.\tag{8.22}
$$

Replacing the roles of x and y, we obtain that

$$
d_{S_{i}}(\mathbf{y}) - d_{S_{i}}(\mathbf{x}) \leq \| \mathbf{x} - \mathbf{y} \|,
$$

which, combined with (8.22), yields the inequality

$$
\left| d_{S_{i}}(\mathbf{x}) - d_{S_{i}}(\mathbf{y}) \right| \leq \| \mathbf{x} - \mathbf{y} \|.\tag{8.23}
$$

Finally, for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$

$$
| f(\mathbf{x}) - f(\mathbf{y}) | = \left| \max_{i = 1, 2, \dots, m} d_{S_{i}}(\mathbf{x}) - \max_{i = 1, 2, \dots, m} d_{S_{i}}(\mathbf{y}) \right| = | | \left\| \mathbf{v}_{\mathbf{x}} \right\|_{\infty} - \left\| \mathbf{v}_{\mathbf{y}} \right\|_{\infty} |,\tag{8.24}
$$

where $\mathbf{v_{x}} =(d_{S_{i}}(\mathbf{x}))_{i = 1}^{m} \in \mathbb{R}^{m}$ and $\mathbf{v}_{\mathbf{y}} =(d_{S_{i}}(\mathbf{y}))_{i = 1}^{m} \in \mathbb{R}^{m}$ . Using the triangle inequality for norms, we can continue (8.24) and obtain

$$
\begin{array}{rcl} | f(\mathbf{x}) - f(\mathbf{y}) | & \leq & \| \left| \mathbf{v}_{\mathbf{x}} \right| \|_{\infty} - \| \left| \mathbf{v}_{\mathbf{y}} \right| \|_{\infty} | \\ & \leq & \| \mathbf{v}_{\mathbf{x}} - \mathbf{v}_{\mathbf{y}} \|_{\infty} \\ & = & \max_{i = 1, 2, \ldots, m} | d_{S_{i}}(\mathbf{x}) - d_{S_{i}}(\mathbf{y}) | \\ & \overset{(8.23)}{\leq} & \| \mathbf{x} - \mathbf{y} \|.\quad \square \end{array}
$$

Let us write explicitly the projected subgradient method with Polyak’s stepsize rule as applied to problem (8.21). The method starts with an arbitrary $\mathbf{x}^{0} \in \mathbb{E}$ . If the kth iteration satisfies $\mathbf{x}^{k} \in S.$ , then we can pick $f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}$ and hence $\mathbf{x}^{k + 1} = \mathbf{x}^{k}$ Otherwise, we take a step toward minus of the subgradient with Polyak’s stepsize. By Theorem 3.50, to compute a subgradient of the objective function at the kth iterate, we can use the following procedure:

(i) compute $i_{k} \in \operatorname{argmax}_{i = 1, 2, \dots, m} d_{S_{i}}(\mathbf{x}^{k})$

(ii) take any $\mathbf{g}^{k} \in \partial d_{S_{i_{k}}}(\mathbf{x}^{k})$

By Example 3.49, we can (and actually must) choose the subgradient in $\partial d_{S_{i_{k}}}(\mathbf{x}^{k})$ as $\begin{array}{r}{\mathbf{g}^{k} = \frac{\mathbf{x}^{k} - P_{S_{i}}(\mathbf{x}^{k})}{d_{S_{i}}(\mathbf{x}^{k})}} \end{array}$ , and in this case the update step becomes

$$
\begin{array}{rl} &{\mathbf{x}^{k + 1} = \mathbf{x}^{k} - \frac{d_{S_{i_{k}}}(\mathbf{x}^{k}) - f_{\mathrm{opt}}}{\| \mathbf{g}^{k} \|^{2}} \cdot \frac{\mathbf{x}^{k} - P_{S_{i_{k}}}(\mathbf{x}^{k})}{d_{S_{i_{k}}}(\mathbf{x}^{k})}} \\ &{\qquad = \mathbf{x}^{k} - d_{S_{i_{k}}}(\mathbf{x}^{k}) \frac{\mathbf{x}^{k} - P_{S_{i_{k}}}(\mathbf{x}^{k})}{d_{S_{i_{k}}}(\mathbf{x}^{k})}} \\ &{\qquad = P_{S_{i_{k}}}(\mathbf{x}^{k}),} \end{array}
$$

where we used in the above the facts that $f_{\mathrm{opt}} = 0$ and $\| \mathbf{g}^{k} \| = 1$ . What we actually obtained is the greedy projection algorithm, which at each iteration projects the current iterate $\mathbf{x}^{k}$ onto the farthest set among $S_{1}, S_{2}, \ldots, S_{m}$ . The algorithm is summarized below.

## Greedy Projection Algorithm

Input: m nonempty closed and convex sets $S_{1}, S_{2}, \ldots, S_{m}$

Initialization: pick $\mathbf{x}^{0} \in \mathbb{E}$

General step: for any $k = 0, 1, 2, \ldots$ , execute the step

$$
\mathbf{x}^{k + 1} = P_{S_{i_{k}}}(\mathbf{x}^{k}),
$$

where $i_{k} \in \operatorname{argmax}_{i = 1, 2, \dots, m} d_{S_{i}}(\mathbf{x}^{k})$ .

We can invoke Theorems 8.13 and 8.17 to obtain the following convergence result of the algorithm.

Theorem 8.21 (convergence of the greedy projection algorithm). Let $S_{1}, S_{2}, \ldots, S_{m} \subseteq \mathbb{E}$ be closed and convex sets such that $\begin{array}{r}{S \equiv \bigcap_{i = 1}^{m} S_{i} \neq \emptyset} \end{array}$ . Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the greedy projection algorithm.

(a) For any $k \geq 0$

$$
\min_{n = 0, 1, 2, \dots, k} \left\{\max_{i = 1, 2, \dots, m} d(\mathbf{x}^{n}, S_{i}) \right\} \leq \frac{d_{S}(\mathbf{x}^{0})}{\sqrt{k + 1}}.\tag{8.25}
$$

(b) There exists ${\mathbf{x}}^{*} \in S$ such that $\mathbf{x}^{k} \to \mathbf{x}^{*}$ as $k \to \infty$

Proof. To prove part (a), define $f(\mathbf{x}) \equiv \mathrm{max}_{i = 1, 2, \ldots, m} d(\mathbf{x}, S_{i})$ and $C = \mathbb{E}$ . Then the optimal set of the problem

$$
\min \{f(\mathbf{x}): \mathbf{x} \in C\}
$$

is $X^{*} = S$ . Assumption 8.7 is satisfied since f is proper closed and convex and $C = \mathbb{E}$ is obviously nonempty closed and convex and contained in int $(\operatorname{dom}(f)) = \mathbb{E}$ The optimal set $X^{*} = S$ is nonempty by the assumption in the premise of the theorem. Assumption 8.12 is satisfied with $L_{f} = 1$ by Lemma 8.20 and Theorem 3.61. Therefore, all the assumptions of Theorem 8.13 are satisfied, and hence, since the greedy projection algorithm is the same as the projected subgradient method with Polyak’s stepsize rule, the result (8.25) holds, as it is exactly part (c) of Theorem 8.13. Part (b) follows by invoking Theorem 8.17.

When $m = 2.$ , the algorithm amounts to the alternating projection method, which is described below.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Alternating Projection Method
Input: two nonempty closed and convex sets  $S_{1}, S_{2}$ .
Initialization: pick  $x^{0} \in S_{2}$  arbitrarily.
General step: for any  $k = 0, 1, 2, \ldots$ , execute the following step:
 $\mathbf{x}^{k+1} = P_{S_{2}}(P_{S_{1}}(\mathbf{x}^{k}))$ .
</div>

If $S_{1} \cap S_{2} \neq \emptyset$ , by Theorem 8.21, the sequence generated by the alternating projection method converges to a point in $S_{1} \cap S_{2}$

Corollary 8.22 (convergence of alternating projection). Let $S_{1}, S_{2}$ be closed and convex sets such that $S \equiv S_{1} \cap S_{2} \neq \emptyset$ . Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the alternating projection method with initial point $\bar{\mathbf{x}}^{0} \in S_{2}$ . Then

(a) for any $k \geq 0$

$$
\min_{n = 0, 1, 2, \dots, k} d(\mathbf{x}^{n}, S_{1}) \leq \frac{d_{S}(\mathbf{x}^{0})}{\sqrt{k + 1}};
$$

(b) there exists ${\mathbf{x}}^{*} \in S$ such that $\mathbf{x}^{k} \to \mathbf{x}^{*}$ as $k \to \infty$

Example 8.23 (solution of linear feasibility problems). Consider the following system of linear equalities and inequalities:

$$
\mathbf{A} \mathbf{x} = \mathbf{b}, \mathbf{x} \geq \mathbf{0},\tag{8.26}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}$ has full row rank and b $\in \mathbb{R}^{m}$ . The system (8.26) is one of the standard forms of feasible sets of linear programming problems. One way to solve the problem of finding a solution to (8.26) is by employing the alternating projection method. Define

$$
S_{1} = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{Ax} = \mathbf{b}\}, \quad S_{2} = \mathbb{R}_{+}^{n}.
$$

The projections on $S_{1}$ and $S_{2}$ have analytic expressions (see Lemma 6.26):

$$
P_{S_{1}}(\mathbf{x}) = \mathbf{x} - \mathbf{A}^{T}(\mathbf{AA}^{T})^{- 1}(\mathbf{Ax} - \mathbf{b}), \quad P_{S_{2}}(\mathbf{x}) =[\mathbf{x}]_{+}.
$$

The alternating projection method for finding a solution to (8.26) takes the following form:

$$
\begin{array}{l} \text{Algorithm 1} \\ \bullet \text{Initialization: pick} \mathbf{x}^{0} \in \mathbb{R}_{+}^{n}.\\ \bullet \text{General step}(k \geq 0) \colon \mathbf{x}^{k + 1} = \left[\mathbf{x}^{k} - \mathbf{A}^{T}(\mathbf{AA}^{T})^{- 1}(\mathbf{Ax}^{k} - \mathbf{b}) \right]_{+}.\end{array}
$$

The general step of the above scheme involves the computation of the expression $(\mathbf{A} \mathbf{A}^{\bar{T}})^{- 1}(\mathbf{A} \mathbf{x}^{k} - \mathbf{b})$ , which requires the computation of the matrix $\mathbf{AA}^{T}$ , as well as the solution of the linear system $(\mathbf{A} \mathbf{A}^{T}) \hat{\mathbf{z}} = \mathbf{A} \mathbf{x}^{k} - \mathbf{b}$ . In cases when these computations are too demanding $(\mathrm{e.g.}$ , when the dimension is large), we can employ a different projection algorithm that avoids the necessity of solving a linear system. Specifically, denoting the ith row of A by $\mathbf{a}_{i}^{T}$ and defining

$$
T_{i} = \{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{a}_{i}^{T} \mathbf{x} = b_{i}\}, i = 1, 2, \ldots, m, T_{m + 1} = \mathbb{R}_{+}^{n},
$$

we obtain that finding a solution to (8.26) is the same as finding a point in the intersection $\cap_{i = 1}^{m + 1} T_{i}$ . Note that (see Lemma 6.26)

$$
P_{T_{i}}(\mathbf{x}) = \mathbf{x} - \frac{\mathbf{a}_{i}^{T} \mathbf{x} - b_{i}}{\| \mathbf{a}_{i} \|_{2}^{2}} \mathbf{a}_{i}, i = 1, 2, \ldots, m.
$$

Hence,

$$
d_{T_{i}}(\mathbf{x}) = \| \mathbf{x} - P_{T_{i}}(\mathbf{x}) \| = \frac{| \mathbf{a}_{i}^{T} \mathbf{x} - b_{i} |}{\| \mathbf{a}_{i} \|_{2}}.
$$

We can now invoke the greedy projection method that has the following form:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 2
- Initialization: pick $\mathbf{x}^0\in \mathbb{E}$.
- General step ($k = 0,1,\ldots$):
    - compute $i_k\in \operatorname{argmax}_{i = 1,2,\dots,m}\frac{|\mathbf{a}_i^T\mathbf{x}^k - b_i|}{\|\mathbf{a}_i\|_2}$.
    - if $\frac{|\mathbf{a}_{i_k}^T\mathbf{x}^k - b_{i_k}|}{\|\mathbf{a}_{i_k}\|_2} &gt;\|\mathbf{x}^k -[\mathbf{x}^k]_+\|_2$, then
    $\mathbf{x}^{k + 1} = \mathbf{x}^k -\frac{\mathbf{a}_{i_k}^T\mathbf{x}^k - b_{i_k}}{\|\mathbf{a}_{i_k}\|_2^2}\mathbf{a}_{i_k}$.
    else,
    $\mathbf{x}^{k + 1} =[\mathbf{x}^k]_+$.
</div>

Algorithm 2 is simpler than Algorithm 1 in the sense that it requires much less operations per iteration. However, simplicity has its cost. Consider, for example, the instance

$$
\mathbf{A} = \left(\begin{array}{cccc} 0 & 6 & - 7 & 1 \\ - 1 & 2 & 10 & - 1 \end{array} \right), \quad \mathbf{b} = \binom{0}{10}.
$$

Figure 8.3 shows the constraint violation of the two sequences generated by the two algorithms initialized with the zeros vector in the first 20 iterations. Obviously, in this case, Algorithm 1 (alternating projection) reached substantially better accuracies than Algorithm 2 (greedy projection).

![Figure 8.3](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/349ed3704ec9e05494c70ccf17f15f594e6d54703ab2a9039d97ebc677484139.jpg)  
Figure 8.3. Constraints violation of alternating and greedy projection methods. Here $\begin{array}{r}{f({\bf x}){\bf \phi} ={\bf \phi} \operatorname{max} \left\{\frac{|{\bf a}_{1}^{T}{\bf x} - b_{1} |}{| |{\bf a}_{1} | |_{2}}, \frac{|{\bf a}_{2}^{T}{\bf x} - b_{2} |}{| |{\bf a}_{2} | |_{2}}, | |{\bf x} -[{\bf x}]_{+} | |_{2} \right\}} \end{array}$ , where ${\bf a}_{1}^{T}{\bf \Psi} ={\bf \Psi}$ $(0, 6, - 7, 1), \mathbf{a}_{2}^{T} =(- 1, 2, 10, - 1)$ , and ${\bf b} =(0, 10)^{T}$

## 8.2.4 Projected Subgradient with Dynamic Stepsizes

Polyak’s stepsize is optimal in the sense that it minimizes the upper bound given in the fundamental inequality (8.12). However, a major disadvantage of this rule is that usually the optimal value $f_{\mathrm{opt}}$ is unknown, and in these (frequent) cases, the stepsize is incomputable. In this section we will show how to find computable stepsize rules that still maintain the $O(1 / \sqrt{k})$ rate of convergence result of the projected subgradient method. Theorem 8.25 below describes a simple condition on the stepsizes under which convergence of $f_{\mathrm{best}}^{k}$ to $f_{\mathrm{opt}}$ is guaranteed. The result uses the following technical lemma.

Lemma 8.24. Suppose that Assumption 8.7 holds. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ . Then for any $\mathbf{x}^{*} \in X^{*}$ and nonnegative integer k,

$$
\sum_{n = 0}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{1}{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \frac{1}{2} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.\tag{8.27}
$$

Proof. By Lemma 8.11, for any $n \geq 0$ and $\mathbf{x}^{*} \in X^{*}$ 2

$$
\frac{1}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \frac{1}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + \frac{t_{n}^{2}}{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.
$$

Summing the above inequality over $n = 0, 1, \ldots, k$ and arranging terms yields the following inequality:

$$
\sum_{n = 0}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{1}{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} - \frac{1}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} + \sum_{n = 0}^{k} \frac{t_{n}^{2}}{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}
$$

$$
\leq \frac{1}{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \frac{1}{2} \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.\quad \square
$$

Theorem 8.25 (stepsize conditions warranting convergence of projected subgradient). Suppose that Assumptions 8.7 and 8.12 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ If

$$
\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}} \rightarrow 0ask \rightarrow \infty,\tag{8.28}
$$

then

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \rightarrow 0ask \rightarrow \infty,\tag{8.29}
$$

where $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ is the sequence of best achieved values defined in (8.11).

Proof. Let $L_{f}$ be a constant for which $\| \mathbf{g} \| \leq L_{f}$ for any $\mathbf{g} \in \partial f(\mathbf{x}), \mathbf{x} \in C$ whose existence is warranted by Assumption 8.12. Employing Lemma 8.24 and using the inequalities $\| f^{\prime}(\mathbf{x}^{n}) \| \leq L_{f}$ and $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}$ for $n \leq k$ , we obtain

$$
\left(\sum_{n = 0}^{k} t_{n}\right) \left(f_{\text{best}}^{k} - f_{\text{opt}}\right) \leq \frac{1}{2} \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \frac{L_{f}^{2}}{2} \sum_{n = 0}^{k} t_{n}^{2}.
$$

Therefore,

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{1}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2}}{\sum_{n = 0}^{k} t_{n}} + \frac{L_{f}^{2}}{2} \frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}.
$$

The result (8.29) now follows by (8.28), and the fact that (8.28) implies the limit $\textstyle \sum_{n = 0}^{k} t_{n} \to \infty{\mathrm{~ as ~}} k \to \infty$ □

By Theorem 8.25, we can pick, for example, the stepsizes as $\begin{array}{r}{t_{k} = \frac{1}{\sqrt{k + 1}}} \end{array}$ , and convergence of function values to $f_{\mathrm{opt}}$ will be guaranteed since $\scriptstyle \sum_{n = 0}^{k}{\frac{1}{\sqrt{n + 1}}}$ is of the order of $\sqrt{k}$ and $\scriptstyle \sum_{n = 0}^{k}{\frac{1}{n + 1}}$ is of the order of $\log(k)$ . We will analyze the convergence rate of the projected subgradient method when the stepsizes are chosen as $\begin{array}{r}{t_{k} = \frac{1}{\| f^{\prime}(\mathbf{x}^{k}) \| \sqrt{k + 1}}} \end{array}$ in Theorem 8.28 below. Note that in addition to proving the limit $f_{\mathrm{best}}^{k} f_{\mathrm{opt}}$ , we will further show that the function values of a certain sequence of averages also converges to the optimal value. Such a result is called an ergodic convergence result.

To prove the result, we will be need to upper and lower bound sums of sequences of real numbers. For that, we will use the following technical lemma from calculus.

Lemma 8.26. Let $f :[a - 1, b + 1] \to \mathbb{R}$ be a continuous nonincreasing function over $[a - 1, b + 1]$ , where a and b are integer numbers satisfying $a \leq b$ . Then

$$
\int_{a}^{b + 1} f(t) dt \leq f(a) + f(a + 1) + \dots + f(b) \leq \int_{a - 1}^{b} f(t) dt.
$$

Using Lemma 8.26, we can prove the following lemma that will be useful in proving Theorem 8.28, as well as additional results in what follows.

Lemma 8.27. Let $D \in \mathbb{R}$ . Then

(a) for any $k \geq 1$

$$
\frac{D + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}} \leq \frac{D + 1 + \log(k + 1)}{\sqrt{k + 1}};\tag{8.30}
$$

(b) for any $k \geq 2$

$$
\frac{D + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}} \leq \frac{4(D + \log(3))}{\sqrt{k + 2}}.\tag{8.31}
$$

Proof. (a) Using Lemma 8.26, we obtain the following inequalities:

$$
\sum_{n = 0}^{k} \frac{1}{n + 1} = 1 + \sum_{n = 1}^{k} \frac{1}{n + 1} \leq 1 + \int_{0}^{k} \frac{1}{x + 1} dx = 1 + \log(k + 1),\tag{8.32}
$$

$$
\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}} \geq \int_{0}^{k + 1} \frac{1}{\sqrt{x + 1}} dx = 2 \sqrt{k + 2} - 2 \geq \sqrt{k + 1},\tag{8.33}
$$

where the last inequality holds for all $k \geq 1$ . The result (8.30) now follows immediately from (8.32) and (8.33).

(b) Using Lemma 8.26, we obtain the following inequalities for any $k \geq 2 \colon$

$$
\begin{array}{l} \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1} \leq \int_{\lceil k / 2 \rceil - 1}^{k} \frac{dt}{t + 1} = \log(k + 1) - \log(\lceil k / 2 \rceil) \\ \qquad = \log \left(\frac{k + 1}{\lceil 0.5k \rceil}\right) \leq \log \left(\frac{k + 1}{0.5k}\right) = \log \left(2 + \frac{2}{k}\right) \\ \qquad \leq \log(3) \end{array}\tag{8.34}
$$

and

$$
\begin{array}{l} \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}} \geq \int_{\lceil k / 2 \rceil}^{k + 1} \frac{dt}{\sqrt{t + 1}} = 2 \sqrt{k + 2} - 2 \sqrt{\lceil k / 2 \rceil + 1} \\ \qquad \qquad \qquad \qquad \qquad \qquad \geq 2 \sqrt{k + 2} - 2 \sqrt{k / 2 + 2} = \frac{4(k + 2) - 4(0.5k + 2)}{2 \sqrt{k + 2} + 2 \sqrt{0.5k + 2}} \\ \qquad \qquad \qquad \qquad = \frac{k}{\sqrt{k + 2} + \sqrt{0.5k + 2}} \geq \frac{k}{2 \sqrt{k + 2}} \\ \qquad \qquad \qquad \qquad \geq \frac{1}{4} \sqrt{k + 2}, \end{array}\tag{8.35}
$$

where the last inequality holds since $k \geq 2$ . The result (8.31) now follows by combining (8.34) and (8.35).

We are now ready to prove the convergence result.

Theorem 8.28 $(O(\log(k) / \sqrt{k})$ rate of convergence of projected subgradient). Suppose that Assumptions 8.7 and 8.12 hold. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the projected subgradient method with stepsizes $\begin{array}{r}{t_{k} = \frac{1}{\| f^{\prime}(\mathbf{x}^{k}) \| \sqrt{k + 1}}} \end{array}$ if $f^{\prime}(\mathbf{x}^{k}) \neq 0$ and $\begin{array}{r}{t_{k} = \frac{1}{L_{f}}} \end{array}$ otherwise. Then

(a) for any $k \geq 1$

$$
f_{\text{best}}^{k} - f_{\text{opt}} \leq \frac{L_{f}}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},
$$

where $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ is the sequence of best achieved values defined in (8.11);

(b) for any $k \geq 1$

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} \leq \frac{L_{f}}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},
$$

where

$$
\mathbf{x}^{(k)} = \frac{1}{\sum_{n = 0}^{k} t_{n}} \sum_{n = 0}^{k} t_{n} \mathbf{x}^{n}.
$$

Proof. Using (8.27) along with the inequality $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}$ for any $n = 0, 1, 2, \ldots, k.$ 2 we obtain

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{1}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}}{\sum_{n = 0}^{k} t_{n}}.\tag{8.36}
$$

Alternatively, by Jensen’s inequality

$$
f(\mathbf{x}^{(k)}) \leq \frac{1}{\sum_{n = 0}^{k} t_{n}} \sum_{n = 0}^{k} t_{n} f(\mathbf{x}^{n}),
$$

which, along with (8.27), yields

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} \leq \frac{1}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}}{\sum_{n = 0}^{k} t_{n}}.\tag{8.37}
$$

Therefore, combining (8.36) and (8.37), we have

$$
\max \{f_{\mathrm{best}}^{k} - f_{\mathrm{opt}}, f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}}\} \leq \frac{1}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \sum_{n = 0}^{k} t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}}{\sum_{n = 0}^{k} t_{n}}.
$$

By the definition of $\begin{array}{r}{t_{n}, t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2} \leq \frac{1}{n + 1}} \end{array}$ (satisfied as equality when $f^{\prime}(\mathbf{x}^{n}) \neq \mathbf{0}$ and as a strict inequality when $f^{\prime}(\mathbf{x}^{n}) \stackrel{\cdots}{=} \bar{\mathbf{0}})$ ; in addition, since $\| f^{\prime}(\mathbf{x}^{n}) \| \leq L_{f}$ , we have $\begin{array}{r}{t_{n} \geq \frac{1}{L_{f} \sqrt{n + 1}}} \end{array}$ . Therefore,

$$
\max \{f_{\mathrm{best}}^{k} - f_{\mathrm{opt}}, f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}}\} \leq \frac{L_{f}}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}}.\tag{8.38}
$$

Invoking Lemma 8.27(a) with $D = \| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2}$ implies the inequality

$$
\max \left\{f_{\text{best}}^{k} - f_{\text{opt}}, f(\mathbf{x}^{(k)}) - f_{\text{opt}} \right\} \leq \frac{L_{f}}{2} \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},
$$

which is equivalent to the validity of the two claims (a) and (b).

Remark 8.29. The sequence of averages $\mathbf{x}^{(k)}$ as defined in Theorem 8.28 can be computed in an adaptive way by noting that the following simple recursion relation holds:

$$
\mathbf{x}^{(k + 1)} = \frac{T_{k}}{T_{k + 1}} \mathbf{x}^{(k)} + \frac{t_{k + 1}}{T_{k + 1}} \mathbf{x}^{k + 1},
$$

where $\begin{array}{r}{T_{k} \equiv \sum_{n = 0}^{k} t_{n}} \end{array}$ can be computed by the obvious recursion relation $T_{k + 1} =$ $T_{k} + t_{k + 1}$

The $O(\log(k) / \sqrt{k})$ rate of convergence proven in Theorem 8.28 is worse than the $O(1 / \sqrt{k})$ rate established in Theorem 8.13 for the version of the projected subgradient method with Polyak’s stepsize. It is possible to prove an $O(1 / \sqrt{k})$ rate of convergence if we assume in addition that the feasible set C is compact. Note that by Theorem 3.16, the compactness of C implies the validity of Assumption 8.12, but we will nonetheless explicitly state it in the following result.

Theorem 8.30 $(O(1 /{\sqrt{k}})$ rate of convergence of projected subgradient). Suppose that Assumptions 8.7 and 8.12 hold and assume that C is compact. Let Θ be an upper bound on the half-squared diameter of C:

$$
\Theta \geq \max_{\mathbf{x}, \mathbf{y} \in C} \frac{1}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with stepsizes chosen as either

$$
t_{k} = \frac{\sqrt{2 \Theta}}{L_{f} \sqrt{k + 1}}\tag{8.39}
$$

or

$$
t_{k} = \left\{\begin{array}{ll} \frac{\sqrt{2 \Theta}}{\| f^{\prime}(\mathbf{x}^{k}) \| \sqrt{k + 1}}, & f^{\prime}(\mathbf{x}^{k}) \neq \mathbf{0}, \\ \frac{\sqrt{2 \Theta}}{L_{f} \sqrt{k + 1}}, & f^{\prime}(\mathbf{x}^{k}) = \mathbf{0}.\end{array} \right.\tag{8.40}
$$

Then for all $k \geq 2$

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{\delta L_{f} \sqrt{2 \Theta}}{\sqrt{k + 2}},
$$

where $\delta = 2(1 + \log(3))$ and $f_{\mathrm{best}}^{k}$ is the sequence of best achieved values defined in (8.11).

Proof. By Lemma 8.11, for any $n \geq 0$

$$
\frac{1}{2} \| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \frac{1}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + \frac{t_{n}^{2}}{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.
$$

Summing the above inequality over $n = \lceil k / 2 \rceil, \lceil k / 2 \rceil + 1,..., k$ , we obtain

$$
\sum_{n = \lceil k / 2 \rceil}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{1}{2} \| \mathbf{x}^{\lceil k / 2 \rceil} - \mathbf{x}^{*} \|^{2} - \frac{1}{2} \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{t_{n}^{2}}{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}
$$

$$
\leq \Theta + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{t_{n}^{2}}{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}
$$

$$
\leq \Theta + \Theta \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1},\tag{8.41}
$$

where the last inequality is due to the fact that in either of the definitions of the stepsizes (8.39), (8.40), $\begin{array}{r}{\dot{t}_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2} \leq \frac{2 \Theta}{n + 1}} \end{array}$

Since $\begin{array}{r}{t_{n} \ge \frac{\sqrt{2 \Theta}}{L_{f} \sqrt{n + 1}}} \end{array}$ and $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}$ for all $n \leq k$ , it follows that

$$
\sum_{n = \lceil k / 2 \rceil}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \geq \left(\sum_{n = \lceil k / 2 \rceil}^{k} \frac{\sqrt{2 \Theta}}{L_{f} \sqrt{n + 1}}\right)(f_{\mathrm{best}}^{k} - f_{\mathrm{opt}}).\tag{8.42}
$$

Therefore, combining (8.41) and (8.42) yields

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{L_{f} \sqrt{\Theta}}{\sqrt{2}} \frac{1 + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}},\tag{8.43}
$$

which, combined with Lemma 8.27(b), yields the desired result.

## 8.2.5 The Strongly Convex Case43

We will now show that if f is in addition strongly convex, then the $O(1 / \sqrt{k})$ rate of convergence result can be improved to a rate of $O(1 / k)$ . The stepsizes used in order to achieve this improved rate diminish at an order of $1 / k.$ . We will also use the growth property of strongly convex functions described in Theorem 5.25(b) in order to show a result on the rate of convergence of the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ to an optimal solution.

Theorem 8.31 $(O(1 / k)$ rate of convergence of projected subgradient for strongly convex functions). Suppose that Assumptions 8.7 and 8.12 hold. Assume in addition that f is σ-strongly convex for some $\sigma > 0$ , and let $\mathbf{x}^{*}$ be its unique minimizer. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the projected subgradient method with stepsize $\begin{array}{r}{t_{k} = \frac{2}{\sigma(k + 1)}} \end{array}$

(a) Let $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ be the sequence of best achieved values defined in (8.11). Then for any $k \geq 0$ 2

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{2L_{f}^{2}}{\sigma(k + 1)}.\tag{8.44}
$$

In addition,

$$
\| \mathbf{x}^{i_{k}} - \mathbf{x}^{*} \| \leq \frac{2L_{f}}{\sigma \sqrt{k + 1}},\tag{8.45}
$$

where $i_{k} \in \operatorname{argmin}_{i = 0, 1, \dots, k} f(\mathbf{x}^{i})$

(b) Define the sequence of averages:

$$
\mathbf{x}^{(k)} = \sum_{n = 0}^{k} \alpha_{n}^{k} \mathbf{x}^{n},
$$

where $\begin{array}{r}{\alpha_{n}^{k} \equiv \frac{2n}{k(k + 1)}} \end{array}$ . Then for all $k \geq 0$

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} \leq \frac{2L_{f}^{2}}{\sigma(k + 1)}.\tag{8.46}
$$

In addition,

$$
\| \mathbf{x}^{(k)} - \mathbf{x}^{*} \| \leq \frac{2L_{f}}{\sigma \sqrt{k + 1}}.\tag{8.47}
$$

Proof. (a) Repeating the arguments in the proof of Lemma 8.11, we can write for any $n \geq 0$

$$
\begin{array}{rl} &{\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} = \| P_{C}(\mathbf{x}^{n} - t_{n} f^{\prime}(\mathbf{x}^{n})) - P_{C}(\mathbf{x}^{*}) \|^{2}} \\ &{\qquad \leq \| \mathbf{x}^{n} - t_{n} f^{\prime}(\mathbf{x}^{n}) - \mathbf{x}^{*} \|^{2}} \\ &{\qquad = \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n} \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle + t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.} \end{array}\tag{8.48}
$$

Since $f$ is σ-strongly convex, it follows by Theorem 5.24 that

$$
f(\mathbf{x}^{*}) \geq f(\mathbf{x}^{n}) + \langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{*} - \mathbf{x}^{n} \rangle + \frac{\sigma}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}.
$$

That is,

$$
\langle f^{\prime}(\mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle \geq f(\mathbf{x}^{n}) - f_{\mathrm{opt}} + \frac{\sigma}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}.
$$

Plugging the above into (8.48), we obtain that

$$
\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq(1 - \sigma t_{n}) \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + t_{n}^{2} \| f^{\prime}(\mathbf{x}^{n}) \|^{2}.
$$

Rearranging terms, dividing by $2t_{n}$ , and using the bound $\| f^{\prime}(\mathbf{x}^{n}) \| \leq L_{f}$ leads to the following inequality:

$$
f(\mathbf{x}^{n}) - f_{\mathrm{opt}} \leq \frac{1}{2}(t_{n}^{- 1} - \sigma) \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{1}{2} t_{n}^{- 1} \| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} + \frac{t_{n}}{2} L_{f}^{2}.
$$

Plugging $\begin{array}{r}{t_{n} = \frac{2}{\sigma(n + 1)}} \end{array}$ into the latter inequality, we obtain

$$
f(\mathbf{x}^{n}) - f_{\mathrm{opt}} \leq \frac{\sigma(n - 1)}{4} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{\sigma(n + 1)}{4} \| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} + \frac{1}{\sigma(n + 1)} L_{f}^{2}.
$$

Multiplying the above by n yields the following inequality:

$$
n(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{\sigma n(n - 1)}{4} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{\sigma(n + 1) n}{4} \| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} + \frac{n}{\sigma(n + 1)} L_{f}^{2}.
$$

Summing over $n = 0, 1, \ldots, k$ , we conclude that

$$
\sum_{n = 0}^{k} n(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq 0 - \frac{\sigma}{4} k(k + 1) \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} + \frac{L_{f}^{2}}{\sigma} \sum_{n = 0}^{k} \frac{n}{n + 1} \leq \frac{L_{f}^{2} k}{\sigma}.\tag{8.49}
$$

Therefore, using the inequality $f(\mathbf{x}^{n}) \geq f_{\mathrm{best}}^{k}$ for all $n = 0, 1, \ldots, k$ , it follows that

$$
\left(\sum_{n = 0}^{k} n\right) \left(f_{\text{best}}^{k} - f_{\text{opt}}\right) \leq \frac{L_{f}^{2} k}{\sigma},
$$

which by the known identity $\textstyle \sum_{n = 0}^{k} n ={\frac{k(k + 1)}{2}}$ shows that

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{2L_{f}^{2}}{\sigma(k + 1)},\tag{8.50}
$$

meaning that (8.44) holds. To prove (8.45), note that $f_{\mathrm{best}}^{k} = f(\mathbf{x}^{i_{k}})$ , and hence by Theorem 5.25(b) employed on the σ-strongly convex function $f + \delta_{C}$ and (8.50),

$$
\frac{\sigma}{2} \| \mathbf{x}^{i_{k}} - \mathbf{x}^{*} \|^{2} \leq f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{2L_{f}^{2}}{\sigma(k + 1)},
$$

which is the same as

$$
\left\| \mathbf{x}^{i_{k}} - \mathbf{x}^{*} \right\| \leq \frac{2L_{f}}{\sigma \sqrt{k + 1}}.
$$

(b) To establish the ergodic convergence, we begin by dividing (8.49) by $\textstyle{\frac{k(k + 1)}{2}}$ to obtain

$$
\sum_{n = 0}^{k} \alpha_{n}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{2L_{f}^{2}}{\sigma(k + 1)}.
$$

By Jensen’s inequality (utilizing the fact that $(\alpha_{n}^{k})_{n = 0}^{k} \in \Delta_{k + 1})$ 2

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} = f \left(\sum_{n = 0}^{k} \alpha_{n}^{k} \mathbf{x}^{n}\right) - f_{\mathrm{opt}} \leq \sum_{n = 0}^{k} \alpha_{n}^{k}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \frac{2L_{f}^{2}}{\sigma(k + 1)},
$$

meaning that (8.46) holds. The result (8.47) now follows by the same arguments used to prove (8.45) in part (a).

Remark 8.32. The sequence of averages $\mathbf{x}^{(k)}$ as defined in Theorem 8.31 can be computed in an adaptive way by noting that the following simple recursion relation holds:

$$
\mathbf{x}^{(k + 1)} = \frac{k}{k + 2} \mathbf{x}^{(k)} + \frac{2}{k + 2} \mathbf{x}^{k + 1}.
$$

The $O(1 / k)$ rate of convergence of the sequence of function values naturally leads to the observation that to obtain an ε-optimal solution, an order of $1 / \varepsilon$ iterations is required. The proof is trivial and follows the argument of the proof of Theorem 8.18.

Theorem 8.33 (complexity of projected subgradient for strongly convex functions). Under the setting and assumptions of Theorem 8.31, for any nonnegative integer k satisfying

$$
k \geq \frac{2L_{f}^{2}}{\sigma \varepsilon} - 1,
$$

it holds that

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \varepsilon
$$

and

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} \leq \varepsilon.
$$

## 8.3 The Stochastic Projected Subgradient Method

## 8.3.1 Setting and Method

In this section we still study the model (8.10) under Assumption 8.7. The main diference will be that at each iteration we do not necessarily utilize a subgradient at the current iterate $\mathbf{x}^{k}$ as the update direction vector, but rather a random estimator $\mathbf{g}^{k}$ of a subgradient of f at $\mathbf{x}^{k}$ (a precise characterization will be given in Assumption 8.34). The method is therefore given as follows.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Stochastic Projected Subgradient Method
Initialization: pick  $x^{0} \in C$  arbitrarily.
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(A) pick a stepsize  $t_{k} &gt; 0$  and a random vector  $g^{k} \in E$ ;
(B) set  $x^{k+1} = P_{C}(x^{k} - t_{k}g^{k})$ .
</div>

Obviously, since the vectors $\mathbf{g}^{k}$ are random vectors, so are the iterate vectors $\mathbf{x}^{k}$ . The exact assumptions on the random vectors $\mathbf{g}^{k}$ are given below.

## Assumption 8.34.

(A) (unbiasedness) For any $k \geq 0, \mathbb{E}(\mathbf{g}^{k} | \mathbf{x}^{k}) \in \partial f(\mathbf{x}^{k})$

(B) (boundedness) There exists a constant $\tilde{L}_{f} > 0$ such that for any $k \geq 0$ $\begin{array}{r}{\dot{\mathbb{E}}(\| \mathbf{g}^{k} \|^{2} | \mathbf{x}^{k}) \leq \dot{\tilde{L}}_{f}^{2}} \end{array}$

Part $\mathrm{(A)}$ of the assumption says that $\mathbf{g}^{k}$ is an unbiased estimator of a subgradient at $\mathbf{x}^{k}$ . This assumption can also be written as

$$
f(\mathbf{z}) \geq f \left(\mathbf{x}^{k}\right) + \langle \mathbb{E} \left(\mathbf{g}^{k} \mid \mathbf{x}^{k}\right), \mathbf{z} - \mathbf{x}^{k} \rangle \text{for all} \mathbf{z} \in \operatorname{dom}(f).
$$

The constant ${\tilde{L}}_{f}$ from part (B) of Assumption 8.34 is not necessarily a Lipschitz constant of f as in the deterministic case.

## 8.3.2 Analysis

The analysis of the stochastic projected subgradient is almost identical to the analysis of the deterministic method. We gather the main results in the following theorem.

Theorem 8.35 (convergence of stochastic projected gradient). Suppose that Assumptions 8.7 and 8.34 hold. Let $\{{\bf x}^{k}\}_{k \ge 0}$ be the sequence generated by the stochastic projected subgradient method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ , and let $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ be the sequence of best achieved values defined in (8.11).

(a) $\begin{array}{r}{If{\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}} \to 0} \end{array}$ as k → ∞, then $\mathbb{E}(f_{\mathrm{best}}^{k}) \to f_{\mathrm{opt}}$ as $k \to \infty$

(b) Assume that C is compact. Let ${\tilde{L}}_{f}$ be the positive constant defined in $As_{-}$ sumption 8.34, and let $\Theta$ be an upper bound on the half-squared diameter of C:

$$
\Theta \geq \max_{\mathbf{x}, \mathbf{y} \in C} \frac{1}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.\tag{8.51}
$$

If $\begin{array}{r}{t_{k} = \frac{\sqrt{2 \Theta}}{\tilde{L}_{f} \sqrt{k + 1}}} \end{array}$ , then for all $k \geq 2$

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\delta \tilde{L}_{f} \sqrt{2 \Theta}}{\sqrt{k + 2}},
$$

where $\delta = 2(1 + \log(3))$ .

Proof. We have for any $n \geq 0$

$$
\begin{array}{rcl} \mathbb{E} \left(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}\right) & = & \mathbb{E} \left(\| P_{C}(\mathbf{x}^{n} - t_{n} \mathbf{g}^{n}) - P_{C}(\mathbf{x}^{*}) \|^{2} | \mathbf{x}^{n}\right) \\ & \overset{(*)}{\leq} & \mathbb{E} \left(\| \mathbf{x}^{n} - t_{n} \mathbf{g}^{n} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}\right) \\ & = & \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n} \mathbb{E} \left(\langle \mathbf{g}^{n}, \mathbf{x}^{n} - \mathbf{x}^{*} \rangle | \mathbf{x}^{n}\right) + t_{n}^{2} \mathbb{E} \left(\| \mathbf{g}^{n} \|^{2} | \mathbf{x}^{n}\right) \\ & = & \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n} \langle \mathbb{E}(\mathbf{g}^{n} | \mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle + t_{n}^{2} \mathbb{E} \left(\| \mathbf{g}^{n} \|^{2} | \mathbf{x}^{n}\right) \\ & \overset{(* *)}{\leq} & \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n} \langle \mathbb{E}(\mathbf{g}^{n} | \mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle + t_{n}^{2} \tilde{L}_{f}^{2} \\ & \overset{(*) *}{\leq} & \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + t_{n}^{2} \tilde{L}_{f}^{2}, \end{array}
$$

where $(*)$ follows by the nonexpansiveness property of the orthogonal projection operator (Theorem 6.42), and (∗∗) and (∗∗∗) follow by Assumption 8.34.

Taking expectation $\mathrm{w.r.t.~} \mathbf{x}^{n}$ , we obtain

$$
\mathbb{E} \left(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2}\right) \leq \mathbb{E} \left(\| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}\right) - 2t_{n}(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) + t_{n}^{2} \tilde{L}_{f}^{2}.
$$

Summing over $n = m, m + 1, \ldots, k$ (where m is an integer satisfying $m \leq k)$

$$
\mathbb{E} \left(\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2}\right) \leq \mathbb{E} \left(\| \mathbf{x}^{m} - \mathbf{x}^{*} \|^{2}\right) - 2 \sum_{n = m}^{k} t_{n}(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) + \tilde{L}_{f}^{2} \sum_{n = m}^{k} t_{n}^{2}.
$$

Therefore,

$$
\sum_{n = m}^{k} t_{n}(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) \leq \frac{1}{2} \left[\mathbb{E} \left(\| \mathbf{x}^{m} - \mathbf{x}^{*} \|^{2}\right) + \tilde{L}_{f}^{2} \sum_{n = m}^{k} t_{n}^{2} \right],
$$

which implies

$$
\left(\sum_{n = m}^{k} t_{n}\right) \left(\min_{n = m, m + 1, \dots, k} \mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}\right) \leq \frac{1}{2} \left[\mathbb{E} \left(\| \mathbf{x}^{m} - \mathbf{x}^{*} \|^{2}\right) + \tilde{L}_{f}^{2} \sum_{n = m}^{k} t_{n}^{2} \right].
$$

Using the inequality<sup>44</sup>

$$
\mathbb{E}(f_{\text{best}}^{k}) \leq \mathbb{E} \left(\min_{n = m, m + 1, \dots, k} f(\mathbf{x}^{n})\right) \leq \min_{n = m, m + 1, \dots, k} \mathbb{E}(f(\mathbf{x}^{n})),
$$

we can conclude that

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\mathbb{E}(\| \mathbf{x}^{m} - \mathbf{x}^{*} \|^{2}) + \tilde{L}_{f}^{2} \sum_{n = m}^{k} t_{n}^{2}}{2 \sum_{n = m}^{k} t_{n}}.\tag{8.52}
$$

Plugging $m = 0$ in (8.52), we obtain

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + \tilde{L}_{f}^{2} \sum_{n = 0}^{k} t_{n}^{2}}{2 \sum_{n = 0}^{k} t_{n}}.
$$

Therefore, if $\scriptstyle{\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}} \to 0$ , then $\mathbb{E}(f_{\mathrm{best}}^{k}) \to f_{\mathrm{opt}}$ as $k \infty$ , proving claim (a). To <sup>=0</sup>show the validity of claim (b), use (8.52) with $m = \lceil k / 2 \rceil$ and the bound (8.51) to obtain τ 2

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\Theta + \frac{\tilde{L}_{f}^{2}}{2} \sum_{n = \lceil k / 2 \rceil}^{k} t_{n}^{2}}{\sum_{n = \lceil k / 2 \rceil}^{k} t_{n}}.
$$

Taking $\begin{array}{r}{t_{n} = \frac{\sqrt{2 \Theta}}{\tilde{L}_{f} \sqrt{n + 1}}} \end{array}$ , we get

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\tilde{L}_{f} \sqrt{2 \Theta}}{2} \frac{1 + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}},
$$

which, combined with Lemma 8.27(b), yields the desired result.

Example 8.36 (minimization of sum of convex functions). Consider the optimization model

$$
\text{(P)} \quad \min \left\{f(\mathbf{x}) \equiv \sum_{i = 1}^{m} f_{i}(\mathbf{x}): \mathbf{x} \in C \right\},
$$

where $f_{1}, f_{2}, \ldots, f_{m} : \mathbb{E} \to(- \infty, \infty]$ are proper closed and convex functions. Suppose that Assumption 8.7 holds and that C is compact, which in particular implies the validity of Assumption 8.12 with some constant $L_{f}$ . By Theorem 3.61 $L_{f}$ is a Lipschitz constant of f over C. Let Θ be some upper bound on the half-squared diameter of C:

$$
\frac{1}{2} \max_{\mathbf{x}, \mathbf{y} \in C} \| \mathbf{x} - \mathbf{y} \|^{2} \leq \Theta.
$$

In addition, we will assume that for any $i = 1, 2, \dots, m$ , there exists a constant $\boldsymbol{L}_{f_{i}}$ for which

$$
\| \mathbf{g} \| \leq L_{f_{i}} \text{for all} \mathbf{g} \in \partial f_{i}(\mathbf{x}), \mathbf{x} \in C.
$$

By Theorem 3.61, $\boldsymbol{L}_{f_{i}}$ is a Lipschitz constant of $f_{i}$ over C. We can consider two options for solving the main problem (P). The first is to employ the projected subgradient method (we assume that $f^{\prime}(\mathbf{x}^{k}) \neq \mathbf{0})$

## Algorithm 1

- Initialization: pick $\mathbf{x}^{0} \in C.$

- General step $\mathbf{\mu}(k \geq \mathbf{0})$ : choose $f_{i}^{\prime}(\mathbf{x}^{k}) \in \partial f_{i}(\mathbf{x}^{k}), i = 1, 2, \ldots, m$ , and compute

$$
\mathbf{x}^{k + 1} = P_{C} \left(\mathbf{x}^{k} - \frac{\sqrt{2 \Theta}}{\| \sum_{i = 1}^{m} f_{i}^{\prime}(\mathbf{x}^{k}) \| \sqrt{k + 1}} \left(\sum_{i = 1}^{m} f_{i}^{\prime}(\mathbf{x}^{k})\right)\right)
$$

By Theorem 8.30, the following eficiency estimate holds for any $k \geq 2 \colon$

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{\delta L_{f} \sqrt{2 \Theta}}{\sqrt{k + 2}},\tag{8.53}
$$

where $\delta = 2(1 \mathrm{{+} log(3)})$ . A direct consequence is that in order to obtain an ε-optimal solution,

$$
N_{1} = \max \left\{\frac{2 \delta^{2} L_{f}^{2} \Theta}{\varepsilon^{2}} - 2, 2 \right\}
$$

iterations are sufficient. Since the computation of the subgradient of $f$ at $\mathbf{x}^{k}$ by the formula $\scriptstyle \sum_{i = 1}^{m} f_{i}^{\prime}(\mathbf{x}^{k})$ might be too expensive in cases where m is large, we can alternatively employ the stochastic projected subgradient method where at iteration $k,$ we define the unbiased estimate of $f^{\prime}(\mathbf{x}^{k})$ as

$$
\mathbf{g}^{k} = mf_{i_{k}}^{\prime}(\mathbf{x}^{k}),
$$

where $i_{k}$ is randomly picked from $\{1, 2, \ldots, m\}$ via a uniform distribution. Obviously,

$$
\mathbb{E}(\mathbf{g}^{k} | \mathbf{x}^{k}) = \sum_{i = 1}^{m} \frac{1}{m} mf_{i}^{\prime}(\mathbf{x}^{k}) = \sum_{i = 1}^{m} f_{i}^{\prime}(\mathbf{x}^{k}) \in \partial f(\mathbf{x}^{k}),
$$

where the inclusion in $\partial f(\mathbf{x}^{k})$ follows by the sum rule of subdiferential calculus (Corollary 3.38). Also,

$$
\mathbb{E}(\| \mathbf{g}^{k} \|^{2} | \mathbf{x}^{k}) = \frac{1}{m} \sum_{i = 1}^{m} m^{2} \| f_{i}^{\prime}(\mathbf{x}^{k}) \|^{2} \leq m \sum_{i = 1}^{m} L_{f_{i}}^{2} \equiv \tilde{L}_{f}^{2}.
$$

The stochastic projected subgradient method employed on problem (P) therefore takes the following form:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 2
- Initialization: pick $\mathbf{x}^0 \in C$.
- General step ($k \geq 0$):
    - pick $i_k \in \{1, 2, \ldots, m\}$ randomly via a uniform distribution and $f_{i_k}'(\mathbf{x}^k) \in \partial f_{i_k}(\mathbf{x}^k)$;
- compute
    $\mathbf{x}^{k+1} = P_C\left(\mathbf{x}^k - \frac{\sqrt{2\Theta}m}{\tilde{L}_f\sqrt{k+1}} f_{i_k}'(\mathbf{x}^k)\right)$, where $\tilde{L}_f = \sqrt{m}\sqrt{\sum_{i=1}^mL_{f_i}^2}$.
</div>

Invoking Theorem 8.35, we obtain that

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{\delta \sqrt{m} \sqrt{\sum_{i = 1}^{m} L_{f_{i}}^{2}} \sqrt{2 \Theta}}{\sqrt{k + 2}}.\tag{8.54}
$$

In particular,

$$
N_{2} = \max \left\{\frac{2 \delta^{2} m \Theta \sum_{i = 1}^{m} L_{f_{i}}^{2}}{\varepsilon^{2}} - 2, 2 \right\}
$$

iterations are sufficient in order to ensure that an ε-optimal solution in expectation is reached. The natural question that arises is, is it possible to compare between the two algorithms? The answer is actually not clear. We can compare the two quantities $N_{2}$ and $N_{1}$ , but there are two major flaws in such a comparison. First, in a sense this is like comparing apples and oranges since $N_{1}$ considers a sequence of function values, while $N_{2}$ refers to a sequence of expected function values. In addition, recall that $N_{2}$ and $N_{1}$ only provide upper bounds on the amount of iterations required to obtain an ε-optimal solution (deterministically or in expectation). Comparison of upper bounds might be influenced dramatically by the tightness of the upper bounds. Disregarding these drawbacks, estimating the ratio between $N_{2}$ and $N_{1}$ ， while neglecting the constant terms, which do not depend on ε, we get

$$
\frac{N_{2}}{N_{1}} \approx \frac{\frac{2 \delta^{2} m \Theta \sum_{i = 1}^{m} L_{f_{i}}^{2}}{\varepsilon^{2}}}{\frac{2 \delta^{2} L_{f}^{2} \Theta}{\varepsilon^{2}}} = \frac{m \sum_{i = 1}^{m} L_{f_{i}}^{2}}{L_{f}^{2}} \equiv \beta.
$$

The value of $\beta$ obviously depends on the specific problem at hand. Let us, for example, consider the instance in which $f_{i}(\mathbf{x}) = \vert \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} \vert, i = 1, 2, \ldots, m$ , where $\mathbf{a}_{i} \in \mathbb{R}^{n}, b_{i} \in \mathbb{R}$ , and $C = B_{\parallel \cdot \parallel_{2}}[\mathbf{0}, 1]$ . In this case,

$$
f(\mathbf{x}) = \left\| \mathbf{A} \mathbf{x} + \mathbf{b} \right\|_{1},
$$

where A is the $m \times n$ matrix whose rows are $\mathbf{a}_{i}^{T}$ and $\mathbf{b} =(b_{i})_{i = 1}^{m}$ . Since

$$
\partial f_{i}(\mathbf{x}) = \left\{\begin{array}{ll} \mathbf{a}_{i}, & \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} > 0, \\ - \mathbf{a}_{i}, & \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} < 0, \\ \{\xi \mathbf{a}_{i}: \xi \in[- 1, 1]\}, & \mathbf{a}_{i}^{T} \mathbf{x} + b_{i} = 0, \end{array} \right.
$$

it follows that we can choose $L_{f_{i}} = \| \mathbf{a}_{i} \|_{2}$ . To estimate $L_{f}$ , note that by Example 3.44, any $\mathbf{g} \in \partial f(\mathbf{x})$ has the form $\mathbf{g} = \mathbf{A}^{T} \boldsymbol{\eta}$ for some $\eta \in[- 1, 1]^{m}$ , which in particular implies that $\| \pmb{\eta} \|_{2} \le \sqrt{m}$ . Thus,

$$
\| \mathbf{g} \|_{2} = \| \mathbf{A}^{T} \boldsymbol{\eta} \|_{2} \leq \| \mathbf{A}^{T} \|_{2, 2} \| \boldsymbol{\eta} \|_{2} \leq \sqrt{m} \| \mathbf{A}^{T} \|_{2, 2},
$$

where $\| \cdot \|_{2, 2}$ is the spectral norm. We can therefore choose $L_{f} ={\sqrt{m}} \| \mathbf{A}^{T} \|_{2, 2}$ Thus,

$$
\beta = \frac{m \sum_{i = 1}^{m} \| \mathbf{a}_{i} \|_{2}^{2}}{m \| \mathbf{A}^{T} \|_{2, 2}^{2}} = \frac{\| \mathbf{A}^{T} \|_{F}^{2}}{\| \mathbf{A}^{T} \|_{2, 2}^{2}} = \frac{\sum_{i = 1}^{n} \lambda_{i}(\mathbf{AA}^{T})}{\max_{i = 1, 2, \ldots, n} \lambda_{i}(\mathbf{AA}^{T})},
$$

where $\lambda_{1}(\mathbf{AA}^{T}) \geq \lambda_{2}(\mathbf{AA}^{T}) \geq \cdots \geq \lambda_{n}(\mathbf{AA}^{T})$ are the eigenvalues of $\mathbf{AA}^{T}$ ordered nonincreasingly. Using the fact that for any nonnegative numbers $\alpha_{1}, \alpha_{2}, \ldots, \alpha_{m}$ the inequalities

$$
\max_{i = 1, 2, \ldots, m} \alpha_{i} \leq \sum_{i = 1}^{m} \alpha_{i} \leq m \max_{i = 1, 2, \ldots, m} \alpha_{i}
$$

hold, we obtain that $1 \le \beta \le m$ . The extreme case $\beta = m$ is actually quite logical in the sense that the number of subgradient computations per iteration in Algorithm 1 is m times larger than what is required in Algorithm 2, and it is thus not surprising that the amount of iterations of Algorithm 2 might be m times larger than what is required by Algorithm 1 to obtain the same level of accuracy. What is much less intuitive is the case when $\beta$ is close 1. In these instances, the two algorithms require (modulo the faults of this comparison) the same order of iterations to obtain the same order of accuracy. For example, when A “close” to be of rank one, then $\beta$ will be close to 1. In these cases, the two algorithms should perform similarly, although Algorithm 2 is much less computationally demanding. We can explain this result by the fact that in this instance the vectors ${\bf a}_{i}$ are “almost” proportional to each other, and thus all the subgradient directions $f_{i}^{\prime}(\mathbf{x}^{k})$ are similar.

## 8.3.3 Stochastic Projected Subgradient—The Strongly Convex Case

The analysis of the stochastic projected subgradient method is almost identical to the one presented for the deterministic case in Theorem 8.31, but for the sake of completeness we present the result and its complete proof.

Theorem 8.37 (convergence of stochastic projected subgradient for strongly convex functions). Suppose that Assumptions 8.7 and 8.34 hold. Let ${\tilde{L}}_{f}$ be the positive constant defined in Assumption 8.34. Assume in addition that $f$ is σ-strongly convex for some $\sigma > 0$ . Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the stochastic projected subgradient method with stepsizes $\begin{array}{r}{t_{k} = \frac{2}{\sigma(k + 1)}} \end{array}$

(a) Let $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ be the sequence of best achieved values defined in (8.11). Then for any $k \geq 0$ 2

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{2 \tilde{L}_{f}^{2}}{\sigma(k + 1)}.
$$

(b) Define the sequence of averages

$$
\mathbf{x}^{(k)} = \sum_{n = 0}^{k} \alpha_{n}^{k} \mathbf{x}^{n},
$$

where $\begin{array}{r}{\alpha_{n}^{k} \equiv \frac{2n}{k(k + 1)}} \end{array}$ . Then

$$
\mathbb{E}(f(\mathbf{x}^{(k)})) - f_{\mathrm{opt}} \leq \frac{2 \tilde{L}_{f}^{2}}{\sigma(k + 1)}.
$$

Proof. (a) For any $\mathbf{x}^{*} \in X^{*}$ and $n \geq 0$

$$
\begin{array}{rl} &{\mathbb{E} \left(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}\right) = \mathbb{E} \left(\| P_{C}(\mathbf{x}^{n} - t_{n} \mathbf{g}^{n}) - P_{C}(\mathbf{x}^{*}) \|^{2} | \mathbf{x}^{n}\right)} \\ &{\qquad \leq \mathbb{E} \left(\| \mathbf{x}^{n} - t_{n} \mathbf{g}^{n} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}\right)} \\ &{\qquad = \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n} \langle \mathbb{E}(\mathbf{g}^{n} | \mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle} \\ &{\qquad + t_{n}^{2} \mathbb{E}(\| \mathbf{g}^{n} \|^{2} | \mathbf{x}^{n}).} \end{array}\tag{8.55}
$$

Since $f$ is σ-strongly convex and $\mathbb{E}(\mathbf{g}^{n} | \mathbf{x}^{n}) \in \partial f(\mathbf{x}^{n})$ , it follows by Theorem 5.24(ii) that σ

$$
f(\mathbf{x}^{*}) \geq f(\mathbf{x}^{n}) + \langle E(\mathbf{g}^{n} | \mathbf{x}^{n}), \mathbf{x}^{*} - \mathbf{x}^{n} \rangle + \frac{\sigma}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}.
$$

That is,

$$
\langle \mathbb{E}(\mathbf{g}^{n} | \mathbf{x}^{n}), \mathbf{x}^{n} - \mathbf{x}^{*} \rangle \geq f(\mathbf{x}^{n}) - f_{\mathrm{opt}} + \frac{\sigma}{2} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}.
$$

Plugging the above into (8.55), we obtain that

$$
\mathbb{E} \left(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}\right) \leq(1 - \sigma t_{n}) \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + t_{n}^{2} \mathbb{E}(\| \mathbf{g}^{n} \|^{2} | \mathbf{x}^{n}).
$$

Rearranging terms, dividing by $2t_{n}$ , and using the bound $\mathbb{E}(\| \mathbf{g}^{n} \|^{2} | \mathbf{x}^{n}) \leq \tilde{L}_{f}^{2}$ leads to the following inequality:

$$
f(\mathbf{x}^{n}) - f_{\mathrm{opt}} \leq \frac{1}{2}(t_{n}^{- 1} - \sigma) \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{1}{2} t_{n}^{- 1} \mathbb{E}(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}) + \frac{t_{n}}{2} \tilde{L}_{f}^{2}.
$$

Plugging $\begin{array}{r}{t_{n} = \frac{2}{\sigma(n + 1)}} \end{array}$ into the last inequality, we obtain

$$
f(\mathbf{x}^{n}) - f_{\mathrm{opt}} \leq \frac{\sigma(n - 1)}{4} \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - \frac{\sigma(n + 1)}{4} \mathbb{E}(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} | \mathbf{x}^{n}) + \frac{1}{\sigma(n + 1)} \tilde{L}_{f}^{2}.
$$

Multiplying the above by n and taking expectation w.r.t. $\mathbf{x}^{n}$ yields the following inequality:

$$
\begin{array}{l} n(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) \leq \frac{\sigma n(n - 1)}{4} \mathbb{E}(\| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2}) - \frac{\sigma(n + 1) n}{4} \mathbb{E}(\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2}) \\ \qquad + \frac{n}{\sigma(n + 1)} \tilde{L}_{f}^{2}.\end{array}
$$

Summing over $n = 0, 1, \ldots, k$ 2

$$
\sum_{n = 0}^{k} n(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) \leq 0 - \frac{\sigma}{4} k(k + 1) \mathbb{E}(\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2}) + \frac{\tilde{L}_{f}^{2}}{\sigma} \sum_{n = 0}^{k} \frac{n}{n + 1} \leq \frac{\tilde{L}_{f}^{2} k}{\sigma}.\tag{8.56}
$$

Therefore, using the inequality $\mathsf E(f(\mathbf x^{n})) \ge \mathsf E(f_{\mathrm{best}}^{k})$ for all $n = 0, 1, \ldots, k.$ , it follows that

$$
\left(\sum_{n = 0}^{k} n\right) \left(\mathbb{E}(f_{\text{best}}^{k}) - f_{\text{opt}}\right) \leq \frac{\tilde{L}_{f}^{2} k}{\sigma},
$$

which, by the identity $\textstyle \sum_{n = 0}^{k} n ={\frac{k(k + 1)}{2}}$ , implies that

$$
\mathbb{E}(f_{\mathrm{best}}^{k}) - f_{\mathrm{opt}} \leq \frac{2 \tilde{L}_{f}^{2}}{\sigma(k + 1)}.
$$

(b) Divide (8.56) by $\textstyle{\frac{k(k + 1)}{2}}$ to obtain

$$
\sum_{n = 0}^{k} \alpha_{n}^{k}(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\mathrm{opt}}) \leq \frac{2L_{f}^{2}}{\sigma(k + 1)}.
$$

By Jensen’s inequality (utilizing the fact that $(\alpha_{n}^{k})_{n = 0}^{k} \in \Delta_{k + 1})$ , we finally obtain

$$
\begin{array}{l} \mathbb{E}(f(\mathbf{x}^{(k)})) - f_{\text{opt}} = \mathbb{E} \left(f \left(\sum_{n = 0}^{k} \alpha_{n}^{k} \mathbf{x}^{n}\right)\right) - f_{\text{opt}} \leq \sum_{n = 0}^{k} \alpha_{n}^{k}(\mathbb{E}(f(\mathbf{x}^{n})) - f_{\text{opt}}) \\ \leq \frac{2 \tilde{L}_{f}^{2}}{\sigma(k + 1)}.\quad \square \end{array}
$$

## 8.4 The Incremental Projected Subgradient Method

Consider the main model (8.10), where f has the form $\begin{array}{r}{f(\mathbf{x}) = \sum_{i = 1}^{m} f_{i}(\mathbf{x})} \end{array}$ . That is, we consider the problem

$$
\min \left\{f(\mathbf{x}) = \sum_{i = 1}^{m} f_{i}(\mathbf{x}): \mathbf{x} \in C \right\}.\tag{8.57}
$$

In addition to Assumption 8.7, we make the following assumption.

Assumption 8.38.

(a) $f_{i}$ is proper closed and convex for any $i = 1, 2, \dots, m$

(b) There exists $L > 0$ for which $\left\| \mathbf{g} \right\| \leq L$ for any $\mathbf{g} \in \partial f_{i}(\mathbf{x}), i = 1, 2, \ldots, m$ $\mathbf{x} \in C.$

In Example 8.36 the same model was also considered, and a projected subgradient method that takes a step toward a direction of the form $- f_{i_{k}}^{\prime}(\mathbf{x}^{k})$ was analyzed. The index $i_{k}$ was chosen in Example 8.36 randomly by a uniform distribution over the indices $\{1, 2, \ldots, m\}$ , and the natural question that arises is whether we can obtain similar convergence results when $i_{k}$ is chosen in a deterministic manner. We will consider the variant in which the indices are chosen in a deterministic cyclic order. The resulting method is called the incremental projected subgradient method. We will show that although the analysis is much more involved, it is still possible to obtain similar rates of convergence (albeit with worse constants).

An iteration of the incremental projected subgradient method is divided into subiterations. Let $\mathbf{x}^{k}$ be the kth iterate vector. Then we define $\mathbf{x}^{k, 0} = \mathbf{x}^{k}$ and produce m subiterations $\mathbf{x}^{k, 1}, \mathbf{x}^{k, 2}, \ldots, \mathbf{x}^{k, m}$ by the rule that $\mathbf{x}^{k, i + 1} = P_{C}(\mathbf{x}^{k, i} - t_{k} \mathbf{g}^{\bar{k}, i})$ where $\mathbf{g}^{k, i} \in \partial f_{i + 1}(\mathbf{x}^{k, i})$ and $t_{k} > 0$ is a positive stepsize. Finally, the next iterate is defined by $\mathbf{x}^{k + 1} = \mathbf{x}^{k, m}$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Incremental Projected Subgradient Method
Initialization: pick  $x^{0} \in C$  arbitrarily.
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) set  $x^{k,0} = x^{k}$  and pick a stepsize  $t_{k} &gt; 0$ ;
(b) for any  $i = 0, 1, \ldots, m - 1$  compute
 $\mathbf{x}^{k,i+1} = P_{C}(\mathbf{x}^{k,i} - t_{k}\mathbf{g}^{k,i})$ ,
where  $g^{k,i} \in \partial f_{i+1}(x^{k,i})$ ;
(c) set  $x^{k+1} = x^{k,m}$ .
</div>

The fundamental inequality from which convergence results can be deduced is proven in the following lemma. The result is similar to the result in Lemma 8.11, but the proof is considerably more complicated.

Lemma 8.39 (fundamental inequality for the incremental projected subgradient method).<sup>45</sup> Suppose that Assumptions 8.7 and 8.38 hold, and let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the incremental projected subgradient method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ . Then for any $k \geq 0$

$$
\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + t_{k}^{2} m^{2} L^{2}.\tag{8.58}
$$

Proof. For any $\mathbf{x}^{*} \in X^{*}, k \geq 0$ and $i \in \{0, 1, \ldots, m - 1\}$

$$
\begin{array}{rcl} \| \mathbf{x}^{k, i + 1} - \mathbf{x}^{*} \|^{2} & = & \| P_{C}(\mathbf{x}^{k, i} - t_{k} \mathbf{g}^{k, i}) - \mathbf{x}^{*} \|^{2} \\ & = & \| P_{C}(\mathbf{x}^{k, i} - t_{k} \mathbf{g}^{k, i}) - P_{C}(\mathbf{x}^{*}) \|^{2} \\ & \overset{(*)}{\leq} & \| \mathbf{x}^{k, i} - t_{k} \mathbf{g}^{k, i} - \mathbf{x}^{*} \|^{2} \\ & \overset{(* *)}{\leq} & \| \mathbf{x}^{k, i} - \mathbf{x}^{*} \|^{2} - 2t_{k} \langle \mathbf{g}^{k, i}, \mathbf{x}^{k, i} - \mathbf{x}^{*} \rangle + t_{k}^{2} L^{2} \\ & \overset{(* * *)}{\leq} & \| \mathbf{x}^{k, i} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f_{i + 1}(\mathbf{x}^{k, i}) - f_{i + 1}(\mathbf{x}^{*})) + t_{k}^{2} L^{2}, \end{array}
$$

where (∗) follows by the nonexpansivity property of the orthogonal projection operator (Theorem 6.42(b)), (∗∗) by Assumption $8.38(b)$ , and (∗∗∗) by the subgradient inequality. Summing the inequality over $i = 0, 1, \ldots, m - 1$ and using the identities $\mathbf{x}^{k, 0^{\star}} = \mathbf{x}^{\tilde{k}}, \mathbf{x}^{k, m} = \mathbf{x}^{\Breve{k} + 1}$ , we obtain that for any $\mathbf{x}^{*} \in X^{*}$

$$
\begin{array}{l} \| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k} \sum_{i = 0}^{m - 1} \left(f_{i + 1}(\mathbf{x}^{k, i}) - f_{i + 1}(\mathbf{x}^{*})\right) + t_{k}^{2} mL^{2} \\ = \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k} \left(f(\mathbf{x}^{k}) - f_{\text{opt}} + \sum_{i = 0}^{m - 1}(f_{i + 1}(\mathbf{x}^{k, i}) - f_{i + 1}(\mathbf{x}^{k}))\right) + t_{k}^{2} mL^{2} \end{array}
$$

$$
\leq \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + 2t_{k} \sum_{i = 0}^{m - 1} L \| \mathbf{x}^{k, i} - \mathbf{x}^{k} \| + t_{k}^{2} mL^{2},\tag{8.59}
$$

where in the last inequality we used the fact that by Assumptions 8.7 and 8.38, $C \subseteq \operatorname{int}(\operatorname{dom}(f)) \subseteq \operatorname{int}(\operatorname{dom}(f_{i + 1}))$ and $\| \mathbf{g} \| \leq L$ for all $\mathbf{g} \in \partial f_{i + 1}(\mathbf{x}), \mathbf{x} \in C$ , and thus, by Theorem $3.61, f_{i + 1}$ is Lipschitz with constant $L$ over $C.$

Now, using the nonexpansivity of the orthogonal projection operator,

$$
\left\| \mathbf{x}^{k, 1} - \mathbf{x}^{k} \right\| = \left\| P_{C} \left(\mathbf{x}^{k, 0} - t_{k} \mathbf{g}^{k, 0}\right) - P_{C} \left(\mathbf{x}^{k}\right) \right\| \leq t_{k} \| \mathbf{g}^{k, 0} \| \leq t_{k} L.
$$

Similarly,

$$
\| \mathbf{x}^{k, 2} - \mathbf{x}^{k} \| = \| P_{C}(\mathbf{x}^{k, 1} - t_{k} \mathbf{g}^{k, 1}) - P_{C}(\mathbf{x}^{k}) \| \leq \| \mathbf{x}^{k, 1} - \mathbf{x}^{k} \| + t_{k} \| \mathbf{g}^{k, 1} \| \leq 2t_{k} L.
$$

In general, for any $i = 0, 1, 2, \ldots, m - 1$ ，

$$
\| \mathbf{x}^{k, i} - \mathbf{x}^{k} \| \leq t_{k} iL,
$$

and we can thus continue (8.59) and deduce that

$$
\begin{array}{rl} &{\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + 2t_{k}^{2} \sum_{i = 0}^{m - 1} iL^{2} + t_{k}^{2} mL^{2}} \\ &{\qquad = \| \mathbf{x}^{k} - \mathbf{x}^{*} \|^{2} - 2t_{k}(f(\mathbf{x}^{k}) - f_{\mathrm{opt}}) + t_{k}^{2} m^{2} L^{2}.\quad \square} \end{array}
$$

From this point, equipped with Lemma 8.39, we can use the same techniques used in the proofs of Theorems 8.25 and 8.30, for example, and establish the following result, whose proof is detailed here for the sake of completeness.

Theorem 8.40 (convergence of incremental projected subgradient). Suppose that Assumptions 8.7 and 8.38 hold. Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ be the sequence generated by the incremental stochastic projected subgradient method with positive stepsizes $\{t_{k}\}_{k \geq 0}$ , and let $\{f_{\mathrm{best}}^{k}\}_{k \geq 0}$ be the sequence of best achieved values defined in (8.11).

(a) $\begin{array}{r}{If{\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}}} \to 0} \end{array}$ as $k \to \infty$ , then $f_{\mathrm{best}}^{k} f_{\mathrm{opt}}$ as $k \to \infty$

(b) Assume that C is compact. Let Θ be an upper bound on the half-squared diameter of C:

$$
\Theta \geq \max_{\mathbf{x}, \mathbf{y} \in C} \frac{1}{2} \| \mathbf{x} - \mathbf{y} \|^{2}.
$$

$\begin{array}{r}{Ift_{k} = \frac{\sqrt{\Theta}}{Lm \sqrt{k + 1}}} \end{array}$ , then for all $k \geq 2$

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{\delta mL \sqrt{\Theta}}{\sqrt{k + 2}},
$$

where $\delta = 2(2 + \log(3))$ .

Proof. By Lemma 8.39, for any $n \geq 0$

$$
\| \mathbf{x}^{n + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{n} - \mathbf{x}^{*} \|^{2} - 2t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + L^{2} m^{2} t_{n}^{2}.\tag{8.60}
$$

Summing (8.60) over $n = p, p + 1, \dotsc, k$ , we obtain

$$
\| \mathbf{x}^{k + 1} - \mathbf{x}^{*} \|^{2} \leq \| \mathbf{x}^{p} - \mathbf{x}^{*} \|^{2} - 2 \sum_{n = p}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) + L^{2} m^{2} \sum_{n = p}^{k} t_{n}^{2}.
$$

Therefore,

$$
2 \sum_{n = p}^{k} t_{n}(f(\mathbf{x}^{n}) - f_{\mathrm{opt}}) \leq \| \mathbf{x}^{p} - \mathbf{x}^{*} \|^{2} + L^{2} m^{2} \sum_{n = p}^{k} t_{n}^{2},
$$

and hence

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{\| \mathbf{x}^{p} - \mathbf{x}^{*} \|^{2} + L^{2} m^{2} \sum_{n = p}^{k} t_{n}^{2}}{2 \sum_{n = p}^{k} t_{n}}.\tag{8.61}
$$

Plugging $p = 0$ into (8.61), we obtain

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{\| \mathbf{x}^{0} - \mathbf{x}^{*} \|^{2} + L^{2} m^{2} \sum_{n = 0}^{k} t_{n}^{2}}{2 \sum_{n = 0}^{k} t_{n}}.
$$

Therefore, if $\frac{\sum_{n = 0}^{k} t_{n}^{2}}{\sum_{n = 0}^{k} t_{n}} 0$ as $k \infty$ , then $f_{\mathrm{best}}^{k} f_{\mathrm{opt}}$ as $k \infty$ , proving claim <sup>=0</sup>(a). To show the validity of claim (b), use (8.61) with $p = \lceil k / 2 \rceil$ to obtain

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{2 \Theta + L^{2} m^{2} \sum_{n = \lceil k / 2 \rceil}^{k} t_{n}^{2}}{2 \sum_{n = \lceil k / 2 \rceil}^{k} t_{n}}.
$$

Take $\begin{array}{r}{t_{n} = \frac{\sqrt{\Theta}}{Lm \sqrt{n + 1}}} \end{array}$ . Then we get

$$
f_{\mathrm{best}}^{k} - f_{\mathrm{opt}} \leq \frac{Lm \sqrt{\Theta}}{2} \frac{2 + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}},
$$

which, combined with Lemma 8.27(b) (with $D = 2)$ , yields the desired result.

## 8.5 The Dual Projected Subgradient Method

## 8.5.1 The Dual Problem

Consider the problem

$$
\begin{array}{rl}{f_{\mathrm{opt}} =} &{\min f(\mathbf{x})} \\ &{\mathrm{s.t.} \mathbf{g}(\mathbf{x}) \leq \mathbf{0},} \\ &{\mathbf{x} \in X,} \end{array}\tag{8.62}
$$

where the following assumptions are made.

Assumption 8.41.

(A) $X \subseteq \mathbb{E}$ is convex.

(B) $f : \mathbb{E} \to \mathbb{R}$ is convex.

(C) $\mathbf{g}(\cdot) =(g_{1}(\cdot), g_{2}(\cdot), \ldots, g_{m}(\cdot))^{T}$ , where $g_{1}, g_{2}, \ldots, g_{m} : \mathbb{E} \to \mathbb{R}$ are convex.

(D) The problem has a finite optimal value denoted by $f_{\mathrm{opt}}$ , and the optimal set, denoted by $X^{\ast}$ , is nonempty.

(E) There exists $\bar{\bf x} \in X$ for which ${\bf g}(\bar{\bf x}) <{\bf 0}$

(F) For any $\lambda \in \mathbb{R}_{+}^{m}$ , the problem mi $\mathbf{l}_{\mathbf{x} \in X} \{f(\mathbf{x}) + \lambda^{T} \mathbf{g}(\mathbf{x})\}$ has an optimal solution.

The Lagrangian dual objective function of problem (8.62) is given by

$$
q(\pmb{\lambda}) = \min_{\mathbf{x} \in X} \left\{L(\mathbf{x}; \pmb{\lambda}) \equiv f(\mathbf{x}) + \pmb{\lambda}^{T} \mathbf{g}(\mathbf{x}) \right\}.\tag{8.63}
$$

By Assumption 8.41(F), the minimization problem in (8.63) possesses a solution, and thus, in particular, $q(\lambda)$ is finite for any $\lambda \in \mathbb{R}_{+}^{m}$ . Recall that q is concave over $\mathbb{R}_{+}^{m}$ (as a minimum of Affine and, in particular, concave functions), and hence the dual problem, which is given by

$$
q_{\mathrm{opt}} = \max \{q(\pmb{\lambda}): \pmb{\lambda} \in \mathbb{R}_{+}^{m}\},\tag{8.64}
$$

is a convex problem, as it consists of maximizing a concave function over a convex set. We note that the dual problem is defined in the space $\mathbb{R}^{m}$ , which we assume in this context to be endowed with the dot product and the $l_{2} \mathrm{- norm}$

By Theorem A.1 and Assumption 8.41, it follows that strong duality holds for the primal-dual pair of problems (8.62) and (8.64), namely,

$$
f_{\mathrm{opt}} = q_{\mathrm{opt}}
$$

and the optimal solution of the dual problem is attained. We will denote the optimal set of the dual problem as $\Lambda^{*}$

An interesting property of the dual problem under the Slater-type assumption (part (E) of Assumption 8.41) is that its superlevel sets are bounded.

Theorem 8.42 (boundedness of superlevel sets of the dual objective function).<sup>46</sup> Suppose that Assumption 8.41 holds. $Let \bar{\bf x} \in X$ be a point satisfying ${\bf g}(\bar{\bf x}) <$ 0 whose existence is warranted by Assumption 8.41(E). Let $\mu \in \mathbb{R}$ . Then for any $\lambda \in S_{\mu} \equiv \{\lambda \in \mathbb{R}_{+}^{m} : q(\lambda) \geq \mu\}$ 2

$$
\| \pmb{\lambda} \|_{2} \leq \frac{f(\bar{\mathbf{x}}) - \mu}{\min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\mathbf{x}})\}}.
$$

Proof. Since $\lambda \in S_{\mu}$ , we have

$$
\mu \leq q(\boldsymbol{\lambda}) \leq f(\bar{\mathbf{x}}) + \boldsymbol{\lambda}^{T} \mathbf{g}(\bar{\mathbf{x}}) = f(\bar{\mathbf{x}}) + \sum_{j = 1}^{m} \lambda_{j} g_{j}(\bar{\mathbf{x}}).
$$

Therefore,

$$
- \sum_{j = 1}^{m} \lambda_{j} g_{j}(\bar{\mathbf{x}}) \leq f(\bar{\mathbf{x}}) - \mu,
$$

which, by the facts that $\lambda_{j} \geq 0$ and $g_{j}(\bar{\bf x}) < 0$ for all $j,$ implies that

$$
\sum_{j = 1}^{m} \lambda_{j} \leq \frac{f(\bar{\mathbf{x}}) - \mu}{\min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\mathbf{x}})\}}.
$$

Finally, since $\lambda \geq 0$ , we have that $\begin{array}{r}{\| \pmb{\lambda} \|_{2} \le \sum_{j = 1}^{m} \lambda_{j}} \end{array}$ , and the desired result is established.

Taking $\mu = f_{\mathrm{opt}} = q_{\mathrm{opt}}$ , we have $S_{\mu} = \Lambda^{*}$ , and Theorem 8.42 amounts to the following corollary describing a bound on the dual optimal set.

Corollary 8.43 (boundedness of the optimal dual set). Suppose that Assumption 8.41 holds, and let $\Lambda^{*}$ be the optimal set of the dual problem (8.64). Let $\bar{\bf x} \in X$ be a point satisfying ${\bf g}(\bar{\bf x}) < 0$ whose existence is warranted by Assumption 8.41(E). Then for any $\lambda \in \Lambda^{*}$

$$
\| \pmb{\lambda} \|_{2} \leq \frac{f(\bar{\mathbf{x}}) - f_{\mathrm{opt}}}{\min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\mathbf{x}})\}}.
$$

## 8.5.2 The Dual Projected Subgradient Method

We begin by recalling how to compute a subgradient of minus of the dual objective function. By Example 3.7, if for a given $\lambda \in \mathbb{R}_{+}^{m}$ the minimum of the problem defining $q(\lambda)$ is attained at $\mathbf{x}_{\lambda} \in X$ , meaning if $q(\pmb{\lambda}) = f(\mathbf{x}_{\pmb{\lambda}}) + \pmb{\lambda}^{T} \mathbf{g}(\mathbf{x}_{\pmb{\lambda}})$ , then $- \mathbf{g}(\mathbf{x}_{\lambda}) \in \partial(- q)(\lambda)$

Using the above expression for the subgradient of $- q.$ , we can define the projected subgradient method employed on the dual problem.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
The Dual Projected Subgradient Method
Initialization: pick  $\lambda^{0} \in R_{+}^{m}$  arbitrarily.
General step: for any  $k = 0, 1, 2, \ldots$  execute the following steps:
(a) pick a positive number  $\gamma_{k}$ ;
(b) compute  $x^{k} \in \arg\min_{x \in X} \left\{f(x) +(\lambda^{k})^{T} g(x) \right\}$ ;
(c) if  $g(x^{k}) = 0$ , then terminate with an output  $x^{k}$ ; otherwise,
 $\lambda^{k+1} = \left[\lambda^{k} + \gamma_{k} \frac{g(x^{k})}{\|g(x^{k})\|_{2}}\right]_{+}$ .
</div>

The stepsize $\frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}}$ is similar in form to the normalized stepsizes considered in Section 8.2.4. The fact that the condition $\mathbf{g}(\mathbf{x}^{k}) = \mathbf{0}$ guarantees that $\mathbf{x}^{k}$ is an optimal solution of problem (8.62) is established in the following lemma.

Lemma 8.44. Suppose that Assumption 8.41 holds. Let $\bar{\lambda} \in \mathbb R_{+}^{m}$ , and let $\bar{\bf x} \in X$ be such that

$$
\bar{\mathbf{x}} \in \operatorname{argmin}_{\mathbf{x} \in X} \left\{f(\mathbf{x}) + \bar{\boldsymbol{\lambda}}^{T} \mathbf{g}(\mathbf{x}) \right\}\tag{8.65}
$$

and ${\bf g}(\bar{\bf x}) ={\bf 0}$ . Then x¯ is an optimal solution of problem (8.62).

Proof. Let $\mathbf{x}$ be a feasible point of problem (8.62), meaning that $\textbf{x} \in \X$ and $\mathbf{g}(\mathbf{x}) \leq \mathbf{0}$ . Then

$$
\begin{array}{ll} f(\mathbf{x}) \geq f(\mathbf{x}) + \bar{\boldsymbol{\lambda}}^{T} \mathbf{g}(\mathbf{x}) &[\mathbf{g}(\mathbf{x}) \leq \mathbf{0}, \bar{\boldsymbol{\lambda}} \geq \mathbf{0}] \\ \geq f(\bar{\mathbf{x}}) + \bar{\boldsymbol{\lambda}}^{T} \mathbf{g}(\bar{\mathbf{x}}) &[(8.65)] \\ = f(\bar{\mathbf{x}}), &[g(\bar{\mathbf{x}}) = \mathbf{0}] \end{array}
$$

establishing the optimality of x¯.

## 8.5.3 Convergence Analysis

Proving convergence of the dual objective function sequence $\{q(\lambda^{k})\}_{k \geq 0}$ under various choices of the parameters $\{\gamma_{k}\}_{k \ge 0}$ is an easy task since such results were already proven in the previous sections. The more interesting question is whether we can prove convergence in some sense of a primal sequence. The answer is yes, but perhaps quite surprisingly the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ is not the “correct” primal sequence. We will consider the following two possible definitions of the primal sequence that involve averaging of the sequence $\{\mathbf{x}^{k}\}_{k \geq 0}$

- Full averaging sequence. In this option, we perform averaging of the entire history of iterates:

$$
\mathbf{x}^{(k)} = \sum_{n = 0}^{k} \mu_{n}^{k} \mathbf{x}^{n}\tag{8.66}
$$

with $\mu_{n}^{k}$ defined by

$$
\mu_{n}^{k} = \frac{\gamma_{n} / \| \mathbf{g}(\mathbf{x}^{n}) \|_{2}}{\sum_{j = 0}^{k} \frac{\gamma_{j}}{\| \mathbf{g}(\mathbf{x}^{j}) \|_{2}}}, \quad n = 0, 1, \ldots, k.\tag{8.67}
$$

- Partial averaging sequence. Here, at iteration $k,$ we only perform averaging of iterations $\lceil k / 2 \rceil, \lceil k / 2 \rceil + 1,..., k \colon$

$$
\mathbf{x}^{\langle k \rangle} = \sum_{n = \lceil k / 2 \rceil}^{k} \eta_{n}^{k} \mathbf{x}^{n}\tag{8.68}
$$

with $\eta_{n}^{k}$ defined by

$$
\eta_{n}^{k} = \frac{\gamma_{n} / \| \mathbf{g}(\mathbf{x}^{n}) \|_{2}}{\sum_{j = \lceil k / 2 \rceil}^{k} \frac{\gamma_{j}}{\| \mathbf{g}(\mathbf{x}^{j}) \|_{2}}}, \quad n = \lceil k / 2 \rceil, \ldots, k.\tag{8.69}
$$

Our underlying assumption will be that the method did not terminate, meaning that $\mathbf{g}(\mathbf{x}^{k}) \neq \mathbf{0}$ for any k.

Lemma 8.45. Suppose that Assumption 8.41 holds, and assume further that there exists $L > 0$ such that $\| \mathbf{g}(\mathbf{x}) \|_{2} \leq L$ for any $\mathbf{x} \in X$ . Let $\rho > 0$ be some positive number, and let $\{{\bf x}^{k}\}_{k \ge 0}$ and $\{\lambda^{k}\}_{k \ge 0}$ be the sequences generated by the dual projected subgradient method. Then for any $k \geq 2$

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} + \rho \|[\mathbf{g}(\mathbf{x}^{(k)})]_{+} \|_{2} \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{0} \|_{2} + \rho)^{2} + \sum_{n = 0}^{k} \gamma_{n}^{2}}{\sum_{n = 0}^{k} \gamma_{n}}\tag{8.70}
$$

and

$$
f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}} + \rho \|[\mathbf{g}(\mathbf{x}^{\langle k \rangle})]_{+} \|_{2} \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{\lceil k / 2 \rceil} \|_{2} + \rho)^{2} + \sum_{n = \lceil k / 2 \rceil}^{k} \gamma_{n}^{2}}{\sum_{n = \lceil k / 2 \rceil}^{k} \gamma_{n}},\tag{8.71}
$$

where $\mathbf{x}^{(k)}$ and $\mathbf{x}^{\langle k \rangle}$ are given in (8.66) and (8.68), respectively.

Proof. Let $\bar{\lambda} \in \mathbb{R}_{+}^{m}$ . Then for every $n \geq 0$

$$
\begin{array}{rl} &{\| \pmb{\lambda}^{n + 1} - \bar{\pmb{\lambda}} \|_{2}^{2} = \left\| \left[\pmb{\lambda}^{n} + \gamma_{n} \frac{\mathbf{g}(\mathbf{x}^{n})}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}} \right]_{+} -[\bar{\pmb{\lambda}}]_{+} \right\|_{2}^{2}} \\ &{\qquad \leq \left\| \pmb{\lambda}^{n} + \gamma_{n} \frac{\mathbf{g}(\mathbf{x}^{n})}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}} - \bar{\pmb{\lambda}} \right\|_{2}^{2}} \\ &{\qquad = \| \pmb{\lambda}^{n} - \bar{\pmb{\lambda}} \|_{2}^{2} + \gamma_{n}^{2} + \frac{2 \gamma_{n}}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}} \mathbf{g}(\mathbf{x}^{n})^{T}(\pmb{\lambda}^{n} - \bar{\pmb{\lambda}}),} \end{array}
$$

where the inequality follows by the nonexpansivity of the orthogonal projection operator (Theorem $6.42(b))$ . Let $p \in \{0, 1, 2, \ldots, k\}$ . Summing the above inequality for $n = p, p + 1, \dotsc, k$ , we obtain that

$$
\| \pmb{\lambda}^{k + 1} - \bar{\pmb{\lambda}} \|_{2}^{2} \leq \| \pmb{\lambda}^{p} - \bar{\pmb{\lambda}} \|_{2}^{2} + \sum_{n = p}^{k} \gamma_{n}^{2} + 2 \sum_{n = p}^{k} \frac{\gamma_{n}}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}} \mathbf{g}(\mathbf{x}^{n})^{T}(\pmb{\lambda}^{n} - \bar{\pmb{\lambda}}).
$$

Therefore,

$$
2 \sum_{n = p}^{k} \frac{\gamma_{n}}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}} \mathbf{g}(\mathbf{x}^{n})^{T}(\bar{\boldsymbol{\lambda}} - \boldsymbol{\lambda}^{n}) \leq \| \boldsymbol{\lambda}^{p} - \bar{\boldsymbol{\lambda}} \|_{2}^{2} + \sum_{n = p}^{k} \gamma_{n}^{2}.\tag{8.72}
$$

To facilitate the proof of the lemma, we will define for any $p \in \{0, 1, \ldots, k\}$

$$
\mathbf{x}^{k, p} \equiv \sum_{n = p}^{k} \alpha_{n}^{k, p} \mathbf{x}^{n},\tag{8.73}
$$

where

$$
\alpha_{n}^{k, p} = \frac{\frac{\gamma_{n}}{\| \mathbf{g}(\mathbf{x}^{n}) \|_{2}}}{\sum_{j = p}^{k} \frac{\gamma_{j}}{\| \mathbf{g}(\mathbf{x}^{j}) \|_{2}}}.
$$

In particular, the sequences $\{\mathbf{x}^{k, 0}\}_{k \geq 0}, \{\mathbf{x}^{k, \lceil k / 2 \rceil}\}_{k \geq 0}$ are the same as the sequences $\{\mathbf{x}^{(k)}\}_{k \geq 0}$ and $\{{\bf x}^{\langle k \rangle}\}_{k \ge 0}$ , respectively. Using the above definition of $\alpha_{n}^{k, p}$ and the fact that $\| \mathbf{g}(\mathbf{x}^{n}) \|_{2} \leq L$ , we conclude that (8.72) implies the following inequality:

$$
\sum_{n = p}^{k} \alpha_{n}^{k, p} \mathbf{g}(\mathbf{x}^{n})^{T}(\bar{\boldsymbol{\lambda}} - \boldsymbol{\lambda}^{n}) \leq \frac{L}{2} \frac{\| \boldsymbol{\lambda}^{p} - \bar{\boldsymbol{\lambda}} \|_{2}^{2} + \sum_{n = p}^{k} \gamma_{n}^{2}}{\sum_{n = p}^{k} \gamma_{n}}.\tag{8.74}
$$

By the definition of $\mathbf{x}^{n}$ , we have for any $\mathbf{x}^{*} \in X^{*}$ 2

$$
\begin{array}{rl} f(\mathbf{x}^{*}) \geq f(\mathbf{x}^{*}) +(\boldsymbol{\lambda}^{n})^{T} \mathbf{g}(\mathbf{x}^{*}) &[\boldsymbol{\lambda}^{n} \geq \mathbf{0}, \mathbf{g}(\mathbf{x}^{*}) \leq \mathbf{0}] \\ \geq f(\mathbf{x}^{n}) +(\boldsymbol{\lambda}^{n})^{T} \mathbf{g}(\mathbf{x}^{n}).&[\mathbf{x}^{n} \in \operatorname{argmin}_{\mathbf{x} \in X} \{f(\mathbf{x}) +(\boldsymbol{\lambda}^{n})^{T} \mathbf{g}(\mathbf{x})\}] \end{array}
$$

Thus,

$$
-(\boldsymbol{\lambda}^{n})^{T} \mathbf{g}(\mathbf{x}^{n}) \geq f(\mathbf{x}^{n}) - f_{\mathrm{opt}},
$$

and hence

$$
\begin{array}{l} \sum_{n = p}^{k} \alpha_{n}^{k, p} \mathbf{g}(\mathbf{x}^{n})^{T}(\bar{\boldsymbol{\lambda}} - \boldsymbol{\lambda}^{n}) \geq \sum_{n = p}^{k} \alpha_{n}^{k, p} \mathbf{g}(\mathbf{x}^{n})^{T} \bar{\boldsymbol{\lambda}} + \sum_{n = p}^{k} \alpha_{n}^{k, p} f(\mathbf{x}^{n}) - \sum_{n = p}^{k} \alpha_{n}^{k, p} f_{\text{opt}} \\ \geq \bar{\boldsymbol{\lambda}}^{T} \mathbf{g}(\mathbf{x}^{k, p}) + f(\mathbf{x}^{k, p}) - f_{\text{opt}}, \end{array} \tag{8}\tag{8.75}
$$

where the last inequality follows by Jensen’s inequality (recalling that $f$ and the components of g are convex) and the definition (8.73) of $\mathbf{x}^{k, p}$ . Combining (8.74) and (8.75), while using the obvious inequality $\| \lambda^{p} - \bar{\lambda} \|_{2} \leq \| \lambda^{p} \|_{2} + \| \bar{\lambda} \|_{2}$ , we obtain

$$
f(\mathbf{x}^{k, p}) - f_{\mathrm{opt}} + \bar{\boldsymbol{\lambda}}^{T} \mathbf{g}(\mathbf{x}^{k, p}) \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{p} \|_{2} + \| \bar{\boldsymbol{\lambda}} \|_{2})^{2} + \sum_{n = p}^{k} \gamma_{n}^{2}}{\sum_{n = p}^{k} \gamma_{n}}.\tag{8.76}
$$

Plugging

$$
\bar{\boldsymbol{\lambda}} = \left\{\begin{array}{ll} \rho \frac{[\mathbf{g}(\mathbf{x}^{k, p})]_{+}}{\|[\mathbf{g}(\mathbf{x}^{k, p})]_{+} \|_{2}}, &[\mathbf{g}(\mathbf{x}^{k, p})]_{+} \neq \mathbf{0}, \\ \mathbf{0}, &[\mathbf{g}(\mathbf{x}^{k, p})]_{+} = \mathbf{0} \end{array} \right.
$$

into (8.76), we obtain the inequality

$$
f(\mathbf{x}^{k, p}) - f_{\mathrm{opt}} + \rho \|[\mathbf{g}(\mathbf{x}^{k, p})]_{+} \|_{2} \leq \frac{L}{2} \frac{(\| \pmb{\lambda}^{p} \|_{2} + \rho)^{2} + \sum_{n = p}^{k} \gamma_{n}^{2}}{\sum_{n = p}^{k} \gamma_{n}}.\tag{8.77}
$$

Substituting $p = 0$ and $p = \lceil k / 2 \rceil$ in (8.77) yields the inequalities (8.70) and (8.71), respectively.

## Analysis of the Full Averaging Scheme

We begin by developing a convergence rate related to the sequence $\{\mathbf{x}^{(k)}\}_{k \geq 0}$ given by (8.66). Similarly to the analysis for the primal projected subgradient, choosing $\begin{array}{r}{\gamma_{k} ~ = ~ \frac{1}{\sqrt{k + 1}}} \end{array}$ will imply that the right-hand side of (8.70) will converge to zero. In principle, the fact that the left-hand side of (8.70) converges to zero does not necessarily imply that both the expression for the distance to optimality in function values $f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}}$ and the expression for the constraints violation $\big \|[\mathbf{g}(\mathbf{x}^{(k)})]_{+} \big \|_{2}$ converge to zero. However, using Theorem 3.60, we can show the convergence of these terms as long as $\rho$ is chosen appropriately.

Theorem 8.46 $(O(\log(k) / \sqrt{k})$ rate of convergence of the full averaging sequence). Suppose that Assumption 8.41 holds, and assume further that there exists $L > 0$ for which $\| \mathbf{g}(\mathbf{x}) \|_{2} \leq L$ for any $\mathbf{x} \in X$ . Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ , and let $\{\lambda^{k}\}_{k \geq 0}$ be the sequences generated by the dual projected subgradient method with $\textstyle \gamma_{k} ={\frac{1}{\sqrt{k + 1}}}$ Then for any $k \geq 1$

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha)^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},\tag{8.78}
$$

$$
\|[\mathbf{g}(\mathbf{x}^{(k)})]_{+} \|_{2} \leq \frac{L}{2 \alpha} \frac{\left(\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha\right)^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},\tag{8.79}
$$

where $\{\mathbf{x}^{(k)}\}_{k \geq 0}$ is given in (8.66) and

$$
\alpha = \frac{f(\bar{\bf x}) - f_{\mathrm{opt}}}{\min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\bf x})\}},
$$

with x¯ being a Slater point whose existence is guaranteed by Assumption 8.41(E).

Proof. Employing Lemma 8.45 with $\rho = 2 \alpha$ , and substituting $\textstyle \gamma_{n} ={\frac{1}{\sqrt{n + 1}}}$ , we have

$$
f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}} + 2 \alpha \|[\mathbf{g}(\mathbf{x}^{(k)})]_{+} \|_{2} \leq \frac{L}{2} \frac{(\| \pmb{\lambda}^{0} \|_{2} + 2 \alpha)^{2} + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}}.\tag{8.80}
$$

Using Lemma 8.27(a), we have

$$
\frac{(\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha)^{2} + \sum_{n = 0}^{k} \frac{1}{n + 1}}{\sum_{n = 0}^{k} \frac{1}{\sqrt{n + 1}}} \leq \frac{(\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha)^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}},
$$

which, combined with (8.80), yields the inequality

$$
f(\mathbf{x}^{(k)}) - f_{\text{opt}} + 2 \alpha \|[\mathbf{g}(\mathbf{x}^{(k)})]_{+} \|_{2} \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha)^{2} + 1 + \log(k + 1)}{\sqrt{k + 1}}.\tag{8.81}
$$

Since by Corollary 8.43 2α is an upper bound on twice the $l_{2}{\mathrm{- norm}}$ of any dual optimal solution, it follows by Theorem 3.60 that the inequality (8.81) implies the two inequalities (8.78) and (8.79).

## Analysis of the Partial Averaging Scheme

We will now show an $O(1 / \sqrt{k})$ rate of convergence in terms of function values as well as constraint violation of the partial averaging sequence given in (8.68). The proof is similar to the proof of Theorem 8.46 and utilizes inequality (8.71) but in addition utilizes the boundedness of the sequence of dual variables—a fact established in the next lemma.

Lemma $\mathbf{8.47.^{47}}$ Suppose that Assumption 8.41 holds and assume further that there exists $L > 0$ for which $\| \mathbf{g}(\mathbf{x}) \|_{2} \leq L$ for any $\mathbf{x} \in X$ . Let $\{{\bf x}^{k}\}_{k \ge 0}$ and $\{\lambda^{k}\}_{k \geq 0}$ be the sequences generated by the dual projected subgradient method with positive stepsizes $\gamma_{k}$ satisfying $\gamma_{k} \le \gamma_{0}$ for all $k \geq 0$ . Then

$$
\| \boldsymbol{\lambda}^{k} \|_{2} \leq M,\tag{8.82}
$$

where<sup>48</sup>

$$
M = \left\{\| \pmb{\lambda}^{0} \|_{2} + 2 \alpha, \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + 2 \alpha + \gamma_{0} \right\},\tag{8.83}
$$

with

$$
\alpha = \frac{f(\bar{\mathbf{x}}) - f_{\mathrm{opt}}}{\min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\mathbf{x}})\}}, \qquad \beta = \min_{j = 1, 2, \ldots, m} \{- g_{j}(\bar{\mathbf{x}})\},
$$

where x¯ is a Slater point of problem (8.62) whose existence is guaranteed by $As_{-}$ sumption 8.41(E).

Proof. Let $\lambda^{*}$ be an optimal solution of the dual problem (8.64). We begin by showing by induction on $k$ that for any $k \geq 0$

$$
\| \boldsymbol{\lambda}^{k} - \boldsymbol{\lambda}^{*} \|_{2} \leq \max \left\{\| \boldsymbol{\lambda}^{0} - \boldsymbol{\lambda}^{*} \|_{2}, \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{0} \right\}.\tag{8.84}
$$

The inequality holds trivially for $k = 0$ . Assume that it holds for $k,$ and we will show that it holds for $k + 1$ . We will consider two cases.

Case I. Assume that $\begin{array}{r}{q(\boldsymbol{\lambda}^{k}) \ge q_{\mathrm{opt}} - \frac{\gamma_{k} L}{2}} \end{array}$ . Then, by Theorem 8.42,

$$
\| \boldsymbol{\lambda}^{k} \|_{2} \leq \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}} + \frac{\gamma_{k} L}{2}}{\beta},
$$

where $\begin{array}{r}{\beta = \operatorname{min}_{i = 1, 2,..., m} \{- g_{i}(\bar{\bf x})\}} \end{array}$ . Therefore,

$$
\begin{array}{l} \| \boldsymbol{\lambda}^{k + 1} - \boldsymbol{\lambda}^{*} \|_{2} \leq \left\| \boldsymbol{\lambda}^{k} + \frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}} \mathbf{g}(\mathbf{x}^{k}) - \boldsymbol{\lambda}^{*} \right\|_{2} \\ \quad \leq \| \boldsymbol{\lambda}^{k} \|_{2} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{k} \\ \quad \leq \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{k} L}{2 \beta} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{k} \\ \quad \leq \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{0}.\end{array}
$$

Case II. Now assume that $\begin{array}{r}{q(\lambda^{k}) < q_{\mathrm{opt}} - \frac{\gamma_{k} L}{2}} \end{array}$ . In this case we can write

$$
\begin{array}{l} \| \boldsymbol{\lambda}^{k + 1} - \boldsymbol{\lambda}^{*} \|_{2}^{2} = \left\| \left[\boldsymbol{\lambda}^{k} + \frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}} \mathbf{g}(\mathbf{x}^{k}) \right]_{+} - \boldsymbol{\lambda}^{*} \right\|_{2}^{2} \\ \leq \left\| \boldsymbol{\lambda}^{k} - \boldsymbol{\lambda}^{*} + \frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}} \mathbf{g}(\mathbf{x}^{k}) \right\|_{2}^{2} \\ = \| \boldsymbol{\lambda}^{k} - \boldsymbol{\lambda}^{*} \|_{2}^{2} + 2 \frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}}(\boldsymbol{\lambda}^{k} - \boldsymbol{\lambda}^{*})^{T} \mathbf{g}(\mathbf{x}^{k}) + \gamma_{k}^{2}.\end{array}\tag{8.85}
$$

Since $- \mathbf{g}(\mathbf{x}^{k}) \in \partial(- q)(\lambda^{k})$ (Example 3.7), it follows by the subgradient inequality that

$$
- q_{\mathrm{opt}} \geq - q(\pmb{\lambda}^{k}) - \mathbf{g}(\mathbf{x}^{k})^{T}(\pmb{\lambda}^{*} - \pmb{\lambda}^{k}).
$$

Therefore, continuing (8.85),

$$
\begin{array}{rl} &{\| \pmb{\lambda}^{k + 1} - \pmb{\lambda}^{*} \|^{2} \leq \| \pmb{\lambda}^{k} - \pmb{\lambda}^{*} \|_{2}^{2} + 2 \frac{\gamma_{k}}{\| \mathbf{g}(\mathbf{x}^{k}) \|_{2}}(q(\pmb{\lambda}^{k}) - q_{\mathrm{opt}}) + \gamma_{k}^{2}} \\ &{\qquad \leq \| \pmb{\lambda}^{k} - \pmb{\lambda}^{*} \|_{2}^{2} + 2 \frac{\gamma_{k}}{L}(q(\pmb{\lambda}^{k}) - q_{\mathrm{opt}}) + \gamma_{k}^{2}} \\ &{\qquad = \| \pmb{\lambda}^{k} - \pmb{\lambda}^{*} \|_{2}^{2} + 2 \frac{\gamma_{k}}{L} \left(q(\pmb{\lambda}^{k}) - q_{\mathrm{opt}} + \frac{\gamma_{k} L}{2}\right)} \\ &{\qquad < \| \pmb{\lambda}^{k} - \pmb{\lambda}^{*} \|_{2}^{2},} \end{array}
$$

where in the last inequality we used our assumption that $\begin{array}{r}{q(\Delta^{k}) < q_{\mathrm{opt}} - \frac{\gamma_{k} L}{2}} \end{array}$ . We can now use the induction hypothesis and conclude that

$$
\| \boldsymbol{\lambda}^{k + 1} - \boldsymbol{\lambda}^{*} \|_{2} \leq \max \left\{\| \boldsymbol{\lambda}^{0} - \boldsymbol{\lambda}^{*} \|_{2}, \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{0} \right\}.
$$

We have thus established the validity of (8.84) for all $k \geq 0$ . The result (8.82) now follows by recalling that by Corollary 8.43, $\| \boldsymbol{\lambda}^{*} \|_{2} \leq \alpha$ , and hence

$$
\begin{array}{l} \| \boldsymbol{\lambda}^{k} \|_{2} \leq \| \boldsymbol{\lambda}^{k} - \boldsymbol{\lambda}^{*} \|_{2} + \| \boldsymbol{\lambda}^{*} \|_{2} \\ \quad \leq \max \left\{\| \boldsymbol{\lambda}^{0} - \boldsymbol{\lambda}^{*} \|_{2}, \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + \| \boldsymbol{\lambda}^{*} \|_{2} + \gamma_{0} \right\} + \| \boldsymbol{\lambda}^{*} \|_{2} \\ \quad \leq \max \left\{\| \boldsymbol{\lambda}^{0} \|_{2} + 2 \alpha, \frac{f(\bar{\mathbf{x}}) - q_{\mathrm{opt}}}{\beta} + \frac{\gamma_{0} L}{2 \beta} + 2 \alpha + \gamma_{0} \right\}.\quad \square \end{array}
$$

Equipped with the upper bound on the sequence of dual variables, we can prove, using a similar argument to the one used in the proof of Theorem 8.46, an $O(1 / \sqrt{k})$ rate of convergence related to the partial averaging sequence generated by the dual projected subgradient method.

Theorem 8.48 $(O(1 /{\sqrt{k}})$ rate of convergence of the partial averaging sequence). Suppose that Assumption 8.41 holds, and assume further that there exists $L > 0$ for which $\| \mathbf{g}(\mathbf{x}) \|_{2} \leq L$ for any $\mathbf{x} \in X$ . Let $\{\mathbf{x}^{k}\}_{k \geq 0}$ , and let $\{\lambda^{k}\}_{k \geq 0}$ be the sequences generated by the dual projected subgradient method with $\textstyle \gamma_{k} ={\frac{1}{\sqrt{k + 1}}}$ Then for any $k \geq 2$

$$
f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}} \leq \frac{2L((M + 2 \alpha)^{2} + \log(3))}{\sqrt{k + 2}},\tag{8.86}
$$

$$
\|[\mathbf{g}(\mathbf{x}^{\langle k \rangle})]_{+} \|_{2} \leq \frac{2L((M + 2 \alpha)^{2} + \log(3))}{\alpha \sqrt{k + 2}},\tag{8.87}
$$

where $\{\mathbf{x}^{(k)}\}_{k \geq 0}$ is given in (8.68), M in (8.83), and

$$
\alpha = \frac{f(\bar{\mathbf{x}}) - f_{\mathrm{opt}}}{\min_{j = 1, 2, \dots, m} \{- g_{j}(\bar{\mathbf{x}})\}}
$$

with x¯ being a Slater point whose existence is guaranteed by Assumption 8.41(E).

Proof. Employing Lemma 8.45 with $\rho = 2 \alpha$ , and substituting $\textstyle \gamma_{n} ={\frac{1}{\sqrt{n + 1}}}$ , we have

$$
\begin{array}{rl} f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}} + 2 \alpha \|[\mathbf{g}(\mathbf{x}^{\langle k \rangle})]_{+} \|_{2} & \leq \frac{L}{2} \frac{(\| \boldsymbol{\lambda}^{\lceil k / 2 \rceil} \|_{2} + 2 \alpha)^{2} + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}} \\ & \leq \frac{L}{2} \frac{(M + 2 \alpha)^{2} + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}}, \end{array}\tag{8.88}
$$

where in the last inequality we used the bound on the dual iterates given in Lemma 8.47. Now, using Lemma 8.27(b), we have

$$
\frac{(M + 2 \alpha)^{2} + \sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{n + 1}}{\sum_{n = \lceil k / 2 \rceil}^{k} \frac{1}{\sqrt{n + 1}}} \leq \frac{4((M + 2 \alpha)^{2} + \log(3))}{\sqrt{k + 2}},
$$

which, combined with (8.88), yields the inequality

$$
f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}} + 2 \alpha \|[\mathbf{g}(\mathbf{x}^{\langle k \rangle})]_{+} \|_{2} \leq \frac{2L((M + 2 \alpha)^{2} + \log(3))}{\sqrt{k + 2}}.\tag{8.89}
$$

Since, by Corollary 8.43, 2α is an upper bound on twice the $l_{2}{\mathrm{- norm}}$ of any dual optimal solution, it follows by Theorem 3.60 that the inequality (8.89) implies the two inequalities (8.86) and (8.87).

To derive a complexity result for the dual projected subgradient method, we should first note that the primal sequence is not feasible, as it does not necessarily satisfy the inequality constraints $\mathbf{g}(\mathbf{x}) \leq \mathbf{0}$ . Therefore, there is no point in asking how many iterations are required to obtain an ε-optimal solution. Instead, we will consider the related concept of an ε-optimal and feasible solution. A vector $\mathbf{x} \in X$ is called an ε-optimal and feasible solution of problem (8.62) if $f(\mathbf{x}) - f_{\mathrm{opt}} \leq \varepsilon$ and $\|[\mathbf{g(x)}]_{+} \|_{2} \leq \varepsilon$ . Theorem 8.48 immediately implies a complexity result stating that an order of $\textstyle{\frac{1}{\varepsilon^{2}}}$ iterations are required to obtain an ε-optimal and feasible solution.

Corollary 8.49 $(O(1 / \varepsilon^{2})$ complexity result for the dual projected subgradient method). Under the setting of Theorem 8.48, $ifk \geq 2$ satisfies

$$
k \geq \frac{4L^{2}((M + 2 \alpha)^{2} + \log(3))^{2}}{\min \{\alpha^{2}, 1\} \varepsilon^{2}} - 2,
$$

then

$$
\begin{array}{rl} & f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}} \leq \varepsilon, \\ & \|[\mathbf{g}(\mathbf{x}^{\langle k \rangle})]_{+} \|_{2} \leq \varepsilon.\end{array}
$$

Example 8.50 (linear programming example). Consider the linear programming problem

$$
\begin{array}{ll} \min & \mathbf{ccc}^{T} \mathbf{x} \\ \text{s.t.} & \mathbf{Ax} \leq \mathbf{b}, \\ & \mathbf{x} \in \Delta_{n}, \end{array}\tag{LP}
$$

where $\mathbf{c} \in \mathbb{R}^{n}, \mathbf{A} \in \mathbb{R}^{m \times n}$ , and b $\in \mathbb{R}^{m}$ . We will consider the dual projected subgradient method when the underlying set X is $\Delta_{n}$ and $\mathbf{g}(\mathbf{x}) \equiv \mathbf{A} \mathbf{x} - \mathbf{b}$ . The vector $\mathbf{x}^{k}$ is calculated by the update rule $\begin{array}{r}{\mathbf{x}^{k} \in \mathop{\operatorname{argmin}}_{\mathbf{x} \in \Delta_{n}}(\mathbf{\bar{c}} + \mathbf{A}^{T} \pmb{\lambda}^{k})^{T} \mathbf{x}} \end{array}$ . It is easy to see that an optimal solution of this subproblem is given by e<sub>i</sub>, where i is an index for which $(\mathbf{c} + \bar{\mathbf{A}}^{T} \lambda^{k})$ <sub>i</sub> is minimal. Therefore, the algorithm (with $\begin{array}{r}{\gamma_{k} = \frac{1}{\sqrt{k + 1}})} \end{array}$ takes the following form:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Dual Projected Subgradient for solving (LP)  
- Initialization: pick $\lambda^0\in \mathbb{R}_+^m$  
- General step ($k\geq 0$):  
    $i_k\in \operatorname{argmin}_{i = 1,2,\dots,n}v_i;\mathbf{v} = \mathbf{c} + \mathbf{A}^T\pmb{\lambda}^k,$ $\mathbf{x}^k = \mathbf{e}_{i_k},$ $\pmb{\lambda}^{k + 1} = \left[\pmb{\lambda}^k +\frac{1}{\sqrt{k + 1}}\frac{\mathbf{A}\mathbf{x}^k - \mathbf{b}}{\|\mathbf{A}\mathbf{x}^k - \mathbf{b}\|_2}\right]_{+}$.
</div>

Note that we make the implicit assumption that $\mathbf{A} \mathbf{x}^{k} \neq \mathbf{b}$ . The above description of the dual projected subgradient method illustrates the fact that the sequence $\{{\bf x}^{k}\}_{k \ge 0}$ is not the “correct” primal sequence. Indeed, in this case, the vectors $\mathbf{x}^{k}$ are always unit vectors, and there is no particular reason why the solution of (LP) should be attained at a unit vector. As a specific example, consider the problem

$$
\begin{array}{rl} \min & x_{1} + 3x_{2} + 2x_{3} \\ \text{s.t.} & 3x_{1} + 2x_{2} - x_{3} \leq 1, \\ & - 2x_{3} \leq 2, \\ & x_{1} + x_{2} + x_{3} = 1, \\ & x_{1}, x_{2}, x_{3} \geq 0, \end{array}\tag{8.90}
$$

which fits problem (LP) with

$$
\mathbf{A} = \left(\begin{array}{ccc} 3 & 2 & - 1 \\ 0 & 0 & - 2 \end{array} \right), \quad \mathbf{b} = \binom{1}{2}, \quad \mathbf{c} = \left(\begin{array}{c} 1 \\ 3 \\ 2 \end{array} \right).
$$

The optimal solution of problem (8.90) is $\textstyle{\left({\frac{1}{2}}, 0,{\frac{1}{2}} \right)}$ . We employed the dual projected subgradient method as described above with $\mathbf{\nabla} \lambda^{0} = \mathbf{0}$ and compared the behavior of the full and partial averaging schemes during the first 100 iterations. The results are described in Figure 8.4. Obviously, the partial averaging scheme exhibits superior behavior compared to the full averaging scheme.

![Figure 8.4](../../../transcripts/mineru/first-order-methods-optimization/parts/p201-400/images/b2f807253a9cb4575f225f7ec4234d1e4941506c391b9dc9f38eab2c9ede4623.jpg)  
Figure 8.4. First 100 iterations of the dual projected subgradient method employed on problem (8.90). The y-axis describes (in log scale) the quantities max $\{f(\mathbf{x}^{(k)}) - f_{\mathrm{opt}}, \|[\mathbf{Ax}^{(k)} - \mathbf{b}]_{+} \|_{2}\}$ and max $\{f(\mathbf{x}^{\langle k \rangle}) - f_{\mathrm{opt}}, \|[\mathbf{A} \mathbf{x}^{\langle k \rangle} - \mathbf{b}]_{+} \|_{2}\}$

## 8.5.4 Example—Network Utility Maximization

Consider a network that consists of a set $\boldsymbol{S} = \{1, 2, \ldots, S\}$ of sources and a set $\mathcal{L} = \{1, 2, \dots, L\}$ of links, where a link has a capacity $c_{\ell}$ . For each source $s \in{\mathcal{S}}$ we denote by ${\mathcal{L}}(s) \subseteq{\mathcal{L}}$ the set of all links used by source s. Similarly, for a given link $\ell \in{\mathcal{L}}$ , the set $S(\ell) \subseteq S$ comprises all sources that use link . In particular, for a pair $\ell \in \mathcal L$ and $s \in S$ , the relation $s \in S(\ell)$ holds if and only if $\ell \in \mathcal{L}(s)$ . Each source $s \in S$ is associated with a concave utility function $u_{s} : \mathbb{R} \mathbb{R}$ , meaning that if source s sends data at a rate $x_{s}$ , it gains a utility $u_{s}(x_{s})$ . We also assume that the rate of source s is constrained to be in the interval $I_{s} =[0, M_{s}]$ , where $M_{s} \in \mathbb{R}_{+ +}$ The goal of the network utility maximization problem (abbreviated NUM) is to allocate the source rates as the optimal solution of the following convex problem:

$$
\begin{array}{ll} \max & \sum_{s \in \mathcal{S}} u_{s}(x_{s}) \\ \text{s.t.} & \sum_{s \in \mathcal{S}(\ell)} x_{s} \leq c_{\ell}, \quad \ell \in \mathcal{L}, \\ & x_{s} \in I_{s}, \quad s \in \mathcal{S}.\end{array}\tag{8.91}
$$

Problem (8.91) in its minimization form is a convex problem and fits the main model (8.62) with

$$
\begin{array}{c} \mathbf{g}(\mathbf{x}) = \left(\sum_{s \in \mathcal{S}(\ell)} x_{s} - c_{\ell}\right)_{\ell = 1, 2, \ldots, L}, \\ X = I_{1} \times I_{2} \times \dots \times I_{S}, \\ f(\mathbf{x}) = - \sum_{s = 1}^{S} u_{s}(x_{s}).\end{array}
$$

At iteration $k,$ the vector $\mathbf{x}^{k}$ is picked as an optimal solution of the problem $\begin{array}{r}{\operatorname{min}_{\mathbf{x} \in X} \{f(\mathbf{x}) +(\lambda^{k})^{T} \mathbf{g}(\mathbf{x})\}} \end{array}$ , meaning

$$
\begin{array}{l} \mathbf{x}^{k} \in \operatorname{argmin}_{\mathbf{x} \in X} \left\{f(\mathbf{x}) +(\boldsymbol{\lambda}^{k})^{T} \mathbf{g}(\mathbf{x}) \right\} \\ = \operatorname{argmin}_{\mathbf{x} \in X} \left\{- \sum_{s = 1}^{S} u_{s}(x_{s}) + \sum_{\ell = 1}^{L} \lambda_{\ell}^{k} \left[\sum_{s \in \mathcal{S}(\ell)} x_{s} - c_{\ell} \right] \right\} \\ = \operatorname{argmin}_{\mathbf{x} \in X} \left\{- \sum_{s = 1}^{S} u_{s}(x_{s}) + \sum_{\ell = 1}^{L} \sum_{s \in \mathcal{S}(\ell)} \lambda_{\ell}^{k} x_{s} \right\} \\ = \operatorname{argmin}_{\mathbf{x} \in X} \left\{- \sum_{s = 1}^{S} u_{s}(x_{s}) + \sum_{s = 1}^{S} \left[\sum_{\ell \in \mathcal{L}(s)} \lambda_{\ell}^{k} \right] x_{s} \right\}.\end{array}
$$

The above minimization problem is separable w.r.t. the decision variables $x_{1}, x_{2}, \ldots,$ $x_{S}$ . Therefore, the sth element of $\mathbf{x}^{k}$ can be chosen via the update rule (returning to the max form),

$$
x_{s}^{k} \in \operatorname{argmax}_{x_{s} \in I_{s}} \left\{u_{s}(x_{s}) - \left[\sum_{\ell \in \mathcal{L}(s)} \lambda_{\ell}^{k} \right] x_{s} \right\}.
$$

The dual projected subgradient method employed on problem (8.91) with stepsizes $\alpha_{k}$ and initialization $\boldsymbol{\lambda}^{0} = \mathbf{0}$ therefore takes the form below. Note that we do not consider here a normalized stepsize (actually, in many practical scenarios, a constant stepsize is used).

Dual Projected Subgradient Method for Solving the NUM Problem (8.91)

Initialization: define $\lambda_{\ell}^{0} = 0$ for all $\ell \in{\mathcal{L}}$

(A) Source-rate update:

$$
x_{s}^{k} = \operatorname{argmax}_{x_{s} \in I_{s}} \left\{u_{s}(x_{s}) - \left[\sum_{\ell \in \mathcal{L}(s)} \lambda_{\ell}^{k} \right] x_{s} \right\},
$$

$$
s \in \mathcal{S}.\tag{8.92}
$$

(B) Link-price update:

$$
\lambda_{\ell}^{k + 1} = \left[\lambda_{\ell}^{k} + \alpha_{k} \left(\sum_{s \in \mathcal{S}(\ell)} x_{s}^{k} - c_{\ell}\right) \right]_{+}, \qquad \ell \in \mathcal{L}.
$$

The multipliers $\lambda_{\ell}^{k}$ can actually be seen as prices that are associated with the links. The algorithm above can be implemented in a distributed manner in the following sense:

(a) Each source s needs to solve the optimization problem (8.92) involving only its own utility function $u_{s}$ and the multipliers (i.e., prices) associated with the links that it uses, meaning $\lambda_{\ell}^{k}, \ell \in \mathcal L(s)$

(b) The price (i.e., multiplier) at each link  is updated according to the rates of the sources that use the link , meaning $x_{s}, s \in S(\ell)$

Therefore, the algorithm only requires local communication between sources and links and can be implemented in a decentralized manner by letting both the sources and the links cooperatively seek an optimal solution of the problem by following the source-rate/price-link update scheme described above. This is one example of a distributed optimization method.


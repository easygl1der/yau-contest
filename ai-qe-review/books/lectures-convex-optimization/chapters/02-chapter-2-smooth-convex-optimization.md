---
title: "Chapter 2 \u2014 Smooth Convex Optimization"
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 2
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 2538
source_line_end: 5864
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 4
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 2 — Smooth Convex Optimization

> [[../README|本书目录]] · [[01-chapter-1-nonlinear-optimization|上一章]] · [[03-chapter-3-nonsmooth-convex-optimization|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 2538–5864。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 2 Smooth Convex Optimization

In this chapter, we study the complexity of solving optimization problems formed by differentiable convex components. We start by establishing the main properties of such functions and deriving the lower complexity bounds, which are valid for all natural optimization methods. After that, we prove the worst-case performance guarantees for the Gradient Method. Since these bounds are quite far from the lower complexity bounds, we develop a special technique, based on the notion of estimating sequences, which allows us to justify the Fast Gradient Methods. These methods appear to be optimal for smooth convex problems. We also obtain performance guarantees for these methods targeting on generating points with small norm of the gradient. In order to treat problems with set constraints, we introduce the notion of a Gradient Mapping. This allows an automatic extension of methods for unconstrained minimization to the constrained case. In the last section, we consider methods for solving smooth optimization problems, defined by several functional components.

## 2.1 Minimization of Smooth Functions

(Smooth convex functions; Lower complexity bounds for $\mathcal{F}_{L}^{\infty, 1}(\mathbb{R}^{n})$ ; Strongly convex functions; Lower complexity bounds for $\mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{n})$ ; The Gradient Method.)

## 2.1.1 Smooth Convex Functions

In this section, we consider the unconstrained minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} f(x),\tag{2.1.1}
$$

where the objective function $f(\cdot)$ is smooth enough. Recall that in the previous chapter we were trying to solve this problem under very weak assumptions on the function $f.$ We have seen that in this general situation we cannot do too much: It is impossible to guarantee convergence even to a local minimum and it is impossible to get acceptable bounds on the global performance of minimization schemes, etc. Let us try to introduce some reasonable assumptions on the function $f$ in order to make our problem more tractable. For that, let us try to specify the desired properties of a hypothetical class of differentiable functions $\mathcal{F}$ we want to work with.

From the results of the previous chapter, we could come to the conclusion that the main reason for our troubles is the weakness of the first-order optimality condition (Theorem 1.2.1). Indeed, we have seen that, in general, the Gradient Method converges only to a stationary point of the function $f$ (see inequality (1.2.22) and Example 1.2.2). Therefore, the first additional property we definitely need is as follows.

Assumption 2.1.1 For any $f \in \mathcal F$ , the first-order optimality condition is sufficient for a point to be a global solution to $(2.l.l)$

Further, the main feature of any tractable functional class $\mathcal{F}$ is the possibility to verify the inclusion $f \in \mathcal F$ in a simple way. Usually, this is ensured by a set of basic elements of the class, endowed with a list of possible operations with elements of $\mathcal{F}$ which keep the result in the class (such operations are called invariant). An excellent example of such a construction is the class of differentiable functions. In order to check whether a function is differentiable or not, we just need to look at its analytical representation.

We do not want to restrict our class too much. Therefore, let us introduce only one invariant operation for the hypothetical class $\mathcal{F}$

Assumption 2.1.2 $Iff_{1}, f_{2} \in \mathcal{F}$ and α, $\beta \geq 0,$ , then α $f_{1} + \beta f_{2} \in \mathcal{F}$

The reason for the restriction on the sign of coefficients in this assumption is evident: We would like to see $x^{2}$ in our class, but the function $- x^{2}$ is not suitable for our goals.

Finally, let us add to $\mathcal{F}$ some basic elements.

Assumption 2.1.3 Any linear function $\ell(x) = \alpha + \langle a, x \rangle$ belongs to ${\mathcal F}.$

Note that the linear function $\ell(\cdot)$ perfectly fits Assumption 2.1.1. Indeed, $\nabla \ell(x) = 0$ implies that this function is constant, and any point in $\mathbb{R}^{n}$ is its global minimum.

It turns out that we have already introduced enough assumptions to specify our functional class. Consider $\textbf{\textit{f}} \in \textbf{\textit{F}}$ . Let us fix some $x_{0} ~ \in ~ \mathbb{R}^{n}$ and consider the function

$$
\phi(y) = f(y) - \langle \nabla f(x_{0}), y \rangle.
$$

Then $\phi \in \mathcal F$ in view of Assumptions 2.1.2 and 2.1.3. Note that

$$
\nabla \phi(y) \mid_{y = x_{0}} = \nabla f(x_{0}) - \nabla f(x_{0}) = 0.
$$

Therefore, in view of Assumption 2.1.1, x is the global minimum of function $\phi$ and for any $\boldsymbol{y} \in \mathbb{R}^{n}$ we have

$$
\phi(y) \geq \phi(x_{0}) = f(x_{0}) - \langle \nabla f(x_{0}), x_{0} \rangle.
$$

Hence, $f(y) \geq f(x_{0}) + \langle \nabla f(x_{0}), y - x_{0} \rangle$

This inequality is very well known in Optimization Theory. It defines the class of differentiable convex functions. Such functions may have a restricted domain. However, this domain must always be convex.

Definition 2.1.1 A set $Q \subseteq \mathbb{R}^{n}$ is called convex if for any x, $y \in Q$ and $\alpha$ from 0, 1 we have

$$
\alpha x +(1 - \alpha) y \in Q.
$$

Thus, a convex set contains the whole segment $[x, y]$ provided that the end points x and y belong to the set.

Definition 2.1.2 A continuously differentiable function $f(\cdot)$ is called convex on a convex set $Q$ (notation $f \in{\mathcal{F}}^{1}(Q))$ if for any $x, y \in Q$ we have

$$
f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle.\tag{2.1.2}
$$

$\operatorname{If} - f(\cdot)$ is convex, we call $f(\cdot)$ concave.

In what follows we also consider the classes of convex functions $\mathcal{F}_{L}^{k, l}(Q)$ where the indices have the same meaning as for the classes $C_{L}^{k, l}(Q)$

Let us check our assumptions, which now become the properties of the functional class.

Theorem 2.1.1 If $f \in{\mathcal{F}}^{1}(\mathbb{R}^{n})$ and $\nabla f(x^{*}) = 0$ then $x^{*}$ is the global minimum of $f(\cdot) on \mathbb{R}^{n}$

Proof In view of inequality (2.1.2), for any $x \in \mathbb{R}^{n}$ we have

$$
f(x) \geq f(x^{*}) + \langle \nabla f(x^{*}), x - x^{*} \rangle = f(x^{*}).\quad \Pi
$$

Thus, we get what we want in Assumption 2.1.1. Let us check Assumption 2.1.2. Lemma 2.1.1 If $f_{1}$ and $f_{2}$ belong to ${\mathcal{F}}^{1}(Q)$ and α, $\beta \geq 0,$ , then the function $f =$ $\alpha f_{1} + \beta f_{2}$ also belongs to ${\mathcal{F}}^{1}(Q)$

Proof For any x, $y \in Q$ , we have

$$
f_{1}(y) \geq f_{1}(x) + \langle \nabla f_{1}(x), y - x \rangle,
$$

$$
f_{2}(y) \geq f_{2}(x) + \langle \nabla f_{2}(x), y - x \rangle.
$$

It remains to multiply the first equation by α, the second one by $\beta,$ and add the results.

Thus, for differentiable functions our hypothetical class coincides with the class of convex functions. Let us present their main properties.

The next statement significantly increases our possibilities in constructing the convex functions.

Lemma 2.1.2 If $f \in \mathcal{F}^{1}(Q), b \in \mathbb{R}^{m}$ and $A : \mathbb{R}^{n} \mathbb{R}^{m}$ then

$$
\phi(x) = f(Ax + b) \in{\mathcal{F}}^{1}({\hat{Q}}), \quad{\hat{Q}} = \{x \in \mathbb{R}^{n} : Ax + b \in Q\}.
$$

Proof Indeed, let $x, y \in Q$ . Define ${\bar{x}} = Ax + b,{\bar{y}} = Ay + b$ . Since

$$
\nabla \phi(x) = A^{T} \nabla f(Ax + b),
$$

we have

$$
\begin{array}{rcl}{\phi(y) = f(\bar{y}) \geq f(\bar{x}) + \langle \nabla f(\bar{x}), \bar{y} - \bar{x} \rangle} \\ & &{} \\{= \phi(x) + \langle \nabla f(\bar{x}), A(y - x) \rangle} \\ & &{} \\{= \phi(x) + \langle A^{T} \nabla f(\bar{x}), y - x \rangle} \\ & &{} \\{} &{= \phi(x) + \langle \nabla \phi(x), y - x \rangle.} \end{array}
$$

In order to make the verification of the inclusion $f ~ \in{\mathcal{F}}^{1}(Q)$ easier, let us provide several equivalent definitions of this class.

Theorem 2.1.2 A continuously differentiable function f belongs to the class ${\mathcal{F}}^{1}(Q)$ if and only if for any x, $y \in Q$ and $\alpha \in[0, 1]$ we $ha \nu e^{2}$

$$
f(\alpha x +(1 - \alpha) y) \leq \alpha f(x) +(1 - \alpha) f(y).\tag{2.1.3}
$$

Proof Define $x_{\alpha} = \alpha x +(1 - \alpha) y$ . Let $f \in{\mathcal{F}}^{1}(Q)$ . Then

$$
f(x_{\alpha}) \leq f(y) - \langle \nabla f(x_{\alpha}), y - x_{\alpha} \rangle = f(y) - \alpha \langle \nabla f(x_{\alpha}), y - x \rangle,
$$

$$
f(x_{\alpha}) \leq f(x) - \langle \nabla f(x_{\alpha}), x - x_{\alpha} \rangle = f(x) +(1 - \alpha) \langle \nabla f(x_{\alpha}), y - x \rangle.
$$

Multiplying the first inequality by $(1 - \alpha)$ , the second one by α, and adding the results, we get (2.1.3).

Let (2.1.3) be true for all $x, y \in Q$ and $\alpha \in[0, 1]$ . Let us choose some $\alpha \in[0, 1)$ . Then

$$
\begin{array}{l}{f(y) \geq \frac{1}{1 - \alpha}[f(x_{\alpha}) - \alpha f(x)] = f(x) + \frac{1}{1 - \alpha}[f(x_{\alpha}) - f(x)]} \\{\qquad = f(x) + \frac{1}{1 - \alpha}[f(x +(1 - \alpha)(y - x)) - f(x)].} \end{array}
$$

Letting α tend to 1, we get (2.1.2).

Theorem 2.1.3 A continuously differentiable function f belongs to the class ${\mathcal{F}}^{1}(Q)$ if and only if for any $x, y \in Q$ we have

$$
\langle \nabla f(x) - \nabla f(y), x - y \rangle \geq 0.\tag{2.1.4}
$$

Proof Let f be a convex continuously differentiable function. Then

$$
f(x) \geq f(y) + \langle \nabla f(y), x - y \rangle, \quad f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle.
$$

Adding these inequalities, we get (2.1.4).

Let (2.1.4) hold for all $x, y \in Q$ . Define $x_{\tau} = x + \tau(y - x) \in \mathcal{Q}$ . Then

$$
\begin{array}{c}{f(y) = f(x) + \displaystyle \int_{0}^{1} \langle \nabla f(x + \tau(y - x)), y - x \rangle d \tau} \\{\displaystyle} \\{\mathrm{~}} \\{= f(x) + \langle \nabla f(x), y - x \rangle + \displaystyle \int_{0}^{1} \langle \nabla f(x_{\tau}) - \nabla f(x), y - x \rangle d \tau} \\{\displaystyle} \\{\displaystyle} \\{= f(x) + \langle \nabla f(x), y - x \rangle + \displaystyle \int_{0}^{1} \frac{1}{\tau} \langle \nabla f(x_{\tau}) - \nabla f(x), x_{\tau} - x \rangle d \tau} \\{\displaystyle} \\{\displaystyle \geq f(x) + \langle \nabla f(x), y - x \rangle.} \end{array}
$$

Sometimes it is more convenient to work with functions from a smaller class $\mathcal{F}^{2}(Q) \subset \mathcal{F}^{1}(Q)$

Theorem 2.1.4 Let Q be an open set. A twice continuously differentiable function f belongs to the class ${\mathcal{F}}^{2}(Q)$ if and only if for any $x \in Q$ we have

$$
\nabla^{2} f(x) \succeq 0.\tag{2.1.5}
$$

Proof Let a function f from $C^{2}(Q)$ be convex and $s \in \mathbb{R}^{n}$ . Let $x_{\tau} = x + \tau s \in Q$ for $\tau > 0$ small enough. Then, in view of (2.1.4), we have

$$
\begin{array}{rl} &{0 \leq \frac{1}{\tau^{2}} \langle \nabla f(x_{\tau}) - \nabla f(x), x_{\tau} - x \rangle = \frac{1}{\tau} \langle \nabla f(x_{\tau}) - \nabla f(x), s \rangle} \\ &{} \\ &{\quad = \frac{1}{\tau} \int \langle \nabla^{2} f(x + \lambda s) s, s \rangle d \lambda,} \\ &{\quad \quad 0} \end{array}
$$

and we get (2.1.5) by letting τ tend to zero.

Let (2.1.5) hold for all $x \in Q$ . Then for $y \in Q$ we have

$$
\begin{array}{rl} &{f(y) = f(x) + \langle \nabla f(x), y - x \rangle + \displaystyle \int_{0}^{1}{\int_{}^{}} \langle \nabla^{2} f(x + \lambda(y - x))(y - x), y - x \rangle d \lambda d \tau} \\ &{\qquad \quad} \\ &{\qquad \geq f(x) + \langle \nabla f(x), y - x \rangle.} \end{array}
$$

Let us look at some examples of differentiable convex functions on $\mathbb{R}^{n}$

## Example 2.1.1

1. Every linear function $f(x) = \alpha + \langle a, x \rangle$ is convex.

2. Let matrix A be symmetric and positive semidefinite. Then the quadratic function

$$
f(x) = \alpha + \langle a, x \rangle +{\frac{1}{2}} \langle Ax, x \rangle
$$

is convex (since $\nabla^{2} f(x) = A \succeq 0)$

3. The following functions of one variable belong to ${\mathcal{F}}^{1}(\mathbb{R})$

$$
f(x) = e^{x},
$$

$$
f(x) = \mid x \mid^{p}, \quad p > 1,
$$

$$
\begin{array}{r}{f(x) = \frac{x^{2}}{1 - | x |},} \end{array}
$$

$$
f(x) = \mid x \mid - \ln(1 + \mid x \mid).
$$

We can check this using Theorem 2.1.4. Therefore, functions arising in Geometric Optimization (see Sect. 5.4.8), like

$$
f(x) = \sum_{i = 1}^{m} e^{\alpha_{i} + \langle a_{i}, x \rangle},
$$

are convex (see Lemma 2.1.2). Similarly, functions arising in $\ell_{p}{-} norm$ approximation problems, like

$$
f(x) = \sum_{i = 1}^{m} \mid \langle a_{i}, x \rangle - b_{i} \mid^{p},
$$

are convex too.

4. Consider the function $f(x) = \ln{\left(\sum_{i = 1}^{n} e^{x^{(i)}} \right)}, x \in \mathbb{R}^{n}$ . Define $\varkappa(x) = \sum_{i = 1}^{n} e^{x^{(i)}}$ For an arbitrary $h \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{\langle \nabla f(x), h \rangle = \frac{1}{\varkappa(x)} \sum_{i = 1}^{n} e^{x^{(i)}} h^{(i)},} \end{array}
$$

$$
\begin{array}{l}{{\langle \nabla^{2} f(x) h, h \rangle = \frac{1}{x(x)} \displaystyle \sum_{i = 1}^{n} e^{x^{(i)}} \left(h^{(i)} \right)^{2} - \frac{1}{x^{2}(x)} \left(\displaystyle \sum_{i = 1}^{n} e^{x^{(i)}} h^{(i)} \right)^{2}}} \\{{= \frac{1}{x(x)} \langle \left(D(x) - \frac{1}{x(x)} d(x) d^{T}(x) \right) h, h \rangle,}} \end{array}
$$

where $D(x)$ is a diagonal matrix with diagonal entries $e^{x^{(i)}}, i = 1, \ldots, n$ , and the vector $d(x) \in \mathbb{R}^{n}$ has the same entries. Since $\varkappa(x) = \langle d(x), \bar{e}_{n} \rangle$ , it is easy to see that $\begin{array}{r}{D(x) \geq \frac{1}{\varkappa(x)} d(x) d^{T}(x)} \end{array}$ . Thus, by Theorem 2.1.4 the function f is convex on $\mathbb{R}^{n}$ . □

Note that for general convex functions, differentiability itself cannot ensure any favorable growth properties. Therefore, we need to consider the problem classes with some bounds on the derivatives. The most important functions of that type are convex functions whose gradient is Lipschitz continuous in the standard Euclidean norm. However, for future use in this book, let us explicitly state the necessary and sufficient conditions for Lipschitz continuity of the gradient with respect to an arbitrary norm $\| \cdot \|$ in $\mathbb{R}^{n}$ . In this case, the size of linear functions on $\mathbb{R}^{n}$ (e.g. the gradients) must be measured in the dual norm

$$
\| g \|_{*} = \operatorname{max}_{x \in \mathbb{R}^{n}} \{\langle g, x \rangle : \ \| x \| \leq 1\}.
$$

This definition is necessary and sufficient for the justification of the Cauchy-Schwarz inequality:

$$
\left.g, x \right.\leq \| g \|_{*} \cdot \| x \|, \quad x, g \in \mathbb{R}^{n}.\tag{2.1.6}
$$

Thus, for functions with Lipschitz continuous gradient with respect to the norm $\| \cdot \|$ we introduce a new notation: $f \in \mathcal{F}_{L}^{1, 1}(Q, \parallel \cdot \parallel)$ means that $Q \subseteq \operatorname{dom} f$ and

$$
\| \nabla f(x) - \nabla f(y) \|_{*} \leq L \| x - y \|, \quad \forall x, y \in Q.\tag{2.1.7}
$$

If in this notation the norm is missing, then we are working with the standard Euclidean norm $(\mathbf{e.g.} \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n}))$ . Let us prove that this norm is self-dual.

Lemma 2.1.3 For any x and s in $\mathbb{R}^{n}$ we have

$$
\operatorname{max}_{x \in \mathbb{R}^{N}} \left\{\langle s, x \rangle : \sum_{i = 1}^{n}(x^{(i)})^{2} \leq 1 \right\} = \left[\sum_{i = 1}^{n}(s^{(i)})^{2} \right]^{1 / 2}.
$$

Proof Let $\| \cdot \|$ be the standard Euclidean norm. By simple coordinate maximization, it is easy to check that

$$
\operatorname{max}_{x \in \mathbb{R}^{n}} \{2 \langle s, x \rangle - \| x \|^{2}\} = \operatorname{max}_{x \in \mathbb{R}^{n}} \left\{\sum_{i = 1}^{n} \left[2s^{(i)} x^{(i)} -(x^{(i)})^{2} \right] \right\} = \| s \|^{2}.
$$

On the other hand,

$$
\begin{array}{ll}{\displaystyle \operatorname{max}_{x \in \mathbb{R}^{n}} \{2 \langle s, x \rangle - \| x \|^{2}\} = \displaystyle \operatorname{max}_{x \in \mathbb{R}^{n}, \tau \in \mathbb{R}} \{2 \tau \langle s, x \rangle - \tau^{2} \| x \|^{2}\} = \displaystyle \operatorname{max}_{x \in \mathbb{R}^{n} \setminus \{0\}} \frac{\langle s, x \rangle^{2}}{\| x \|^{2}}} \\{\displaystyle \qquad = \operatorname{max}_{\| x \| \leq 1} \langle s, x \rangle^{2}.} \end{array}
$$

□

Thus, the standard Euclidean norm can be used both for measuring sizes of points and gradients. Before we proceed, let us prove a simple property of general norms.

Lemma 2.1.4 For all x, $\boldsymbol{y} \in \mathbb{R}^{n}$ and $\alpha \in[0, 1]$ we have

$$
\alpha \| x \|^{2} +(1 - \alpha) \| y \|^{2} \geq \alpha(1 - \alpha)(\| x \| + \| y \|)^{2} \geq \alpha(1 - \alpha) \| x - y \|^{2}.\tag{2.1.8}
$$

Proof Using the inequality $a^{2} + b^{2} \geq 2ab$ with $a = \alpha \| x \|$ and $b =(1 - \alpha) \| y \|$ we get the first inequality. The second one follows from the triangle inequality for norms.

Theorem 2.1.5 All conditions below, holding for all x, $y \in \mathbb{R}^{n}$ and α from 0, 1 , are equivalent to the inclusion $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n}, \parallel \cdot \parallel).$

$$
\begin{array}{r}{0 \ \le \f(y) - f(x) - \langle \nabla f(x), y - x \rangle \ \le \ \frac{L}{2} \ \| \x - y \ \|^{2},} \end{array}\tag{2.1.9}
$$

$$
\begin{array}{r}{f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2L} \parallel \nabla f(x) - \nabla f(y) \parallel_{*}^{2} \leq \f(y),} \end{array}\tag{2.1.10}
$$

$$
{\begin{array}{rl}{{\frac{1}{L}} \parallel \nabla f(x) - \nabla f(y) \parallel_{*}^{2} \leq \langle \nabla f(x) - \nabla f(y), x - y \rangle,} \end{array}}\tag{2.1.11}
$$

$$
0 \ \leq \ \langle \nabla f(x) - \nabla f(y), x - y \rangle \ \leq \L \ \| \x - y \|^{2},\tag{2.1.12}
$$

$$
\begin{array}{rl} &{\alpha f(x) +(1 - \alpha) f(y) \geq f(\alpha x +(1 - \alpha) y)} \\ &{} \\ &{\qquad + \frac{\alpha(1 - \alpha)}{2L} \parallel \nabla f(x) - \nabla f(y) \parallel_{*}^{2},} \end{array}\tag{2.1.13}
$$

$$
\begin{array}{r}{0 \ \leq \ \alpha f(x) +(1 - \alpha) f(y) - f(\alpha x +(1 - \alpha) y) \qquad} \\{\qquad \quad \leq \alpha(1 - \alpha) \frac{L}{2} \parallel x - y \parallel^{2}.} \end{array}\tag{2.1.14}
$$

Moreover, if $f \in \mathcal{F}_{L}^{1, 1}(Q)$ , then inequalities (2.1.9), (2.1.12), and (2.1.14) are valid for all x, $y \in Q$

Proof Indeed, the first inequality in (2.1.9) follows from the definition of convex functions. To prove the second one, note that

$$
\begin{array}{rlr}{f(y) - f(x) - \langle \nabla f(x), y - x \rangle} &{{} \quad = \quad} &{\int \langle \nabla f(x + \tau(y - x))} \\{\quad} &{{} \quad} &{0} \\{\quad} &{{} \quad} &{- \nabla f(x), y - x \rangle d \tau} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(2.1.6),(2.1.7)}{\leq} \int L \tau \| y - x \|^{2} d \tau \ = \ \frac{L}{2} \| y - x \|^{2}.} \end{array}
$$

Further, let us fix $x_{0} \in \mathbb{R}^{n}$ . Consider the function $\phi(y) = f(y) - \langle \nabla f(x_{0}), y \rangle$ Note that $\phi \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n}, \parallel \cdot \parallel)$ and its optimal point is $y^{*} = x_{0}$ . Therefore, in view of (2.1.9), we have

$$
\begin{array}{rlr}{\phi(y^{*})} &{=} &{\underset{x \in \mathbb{R}^{n}}{\operatorname{min}} \phi(x) \overset{(2.1.9)}{\leq} \underset{x \in \mathbb{R}^{n}}{\operatorname{min}} \left.\phi(y) + \langle \nabla \phi(y), x - y \rangle + \frac{L}{2} \| x - y \|^{2} \right.} \\ &{} & \\ &{\overset{(2.1.6)}{=} \underset{r \geq 0}{\operatorname{min}} \left.\phi(y) - r \| \nabla \phi(y) \|_{*} + \frac{L}{2} r^{2} \right.= \phi(y) - \frac{1}{2L} \| \nabla \phi(y) \|_{*}^{2},} \end{array}
$$

and we get (2.1.10) since $\nabla \phi(y) = \nabla f(y) - \nabla f(x_{0})$

We obtain (2.1.11) from inequality (2.1.10) by adding two copies of it with x and y interchanged. Applying the Cauchy–Schwarz inequality to (2.1.11), we get $\parallel \nabla f(x) - \nabla f(y) \parallel_{*} \leq L \parallel x - y \parallel$

In the same way, we can obtain (2.1.12) from (2.1.9). In order to get (2.1.9) from (2.1.12), we apply integration:

$$
\begin{array}{rl} &{f(y) - f(x) - \langle \nabla f(x), y - x \rangle = \overset{1}{\underset{0}{\int}} \langle \nabla f(x + \tau(y - x)) - \nabla f(x), y - x \rangle d \tau} \\ &{\qquad \leq \frac{1}{2} L \| y - x \|^{2}.} \end{array}
$$

Let us now prove two last inequalities. Define $x_{\alpha} = \alpha x +(1 - \alpha) y$ . Then, using (2.1.10), we get

$$
\begin{array}{r}{f(x) \geq f(x_{\alpha}) + \langle \nabla f(x_{\alpha}),(1 - \alpha)(x - y) \rangle + \frac{1}{2L} \parallel \nabla f(x) - \nabla f(x_{\alpha}) \parallel_{*}^{2},} \end{array}
$$

$$
\begin{array}{r}{f(y) \geq f(x_{\alpha}) + \langle \nabla f(x_{\alpha}), \alpha(y - x) \rangle + \frac{1}{2L} \parallel \nabla f(y) - \nabla f(x_{\alpha}) \parallel_{*}^{2}.} \end{array}
$$

Adding these inequalities multiplied by α and $(1 - \alpha)$ respectively, and using inequality (2.1.8), we get (2.1.13). It is easy to check that we get (2.1.10) from (2.1.13) by letting $\alpha \to 1$

Similarly, from (2.1.9) we get

$$
\begin{array}{r}{f(x) \leq f(x_{\alpha}) + \langle \nabla f(x_{\alpha}),(1 - \alpha)(x - y) \rangle + \frac{L}{2} \parallel(1 - \alpha)(x - y) \parallel^{2},} \end{array}
$$

$$
\begin{array}{r}{f(y) \leq f(x_{\alpha}) + \langle \nabla f(x_{\alpha}), \alpha(y - x) \rangle + \frac{L}{2} \parallel \alpha(y - x) \parallel^{2}.} \end{array}
$$

Adding these inequalities multiplied by α and $(1 ~ - ~ \alpha)$ respectively, we obtain (2.1.14), and we get back to (2.1.9) as $\alpha \to 1$

Finally, let us characterize the class $\mathcal{F}_{L}^{2, 1}(\mathbb{R}^{n}, \| \cdot \|)$

Theorem 2.1.6 A twice continuously differentiable function f belongs to the class $\mathcal{F}_{L}^{2, 1}(\mathbb{R}^{n}, \| \cdot \|)$ if and only if for any $x, h \in \mathbb{R}^{n}$ we have

$$
0 \leq \langle \nabla^{2} f(x) h, h \rangle \leq L \| h \|^{2}.\tag{2.1.15}
$$

Proof The first condition characterizes the convexity of the function $f(\cdot)$ and it was proved in Theorem 2.1.4. The second inequality is a limiting case of (2.1.12).

Note that for the class $\mathcal{F}_{L}^{2, 1}(\mathbb{R}^{n})$ , condition (2.1.15) can be written in the form of a matrix inequality:

$$
0 \preceq \nabla^{2} f(x) \ \preceq \LI_{n}, \quad x \in \mathbb{R}^{n}.\tag{2.1.16}
$$

## 2.1.2 Lower Complexity Bounds for $\mathcal{F}_{L}^{\infty, \mathbf{1}}(\mathbb{R}^{n})$

Let us check our potential ability to minimize smooth convex functions. In this section, we obtain the lower complexity bounds for optimization problems with objective functions from $\mathcal{F}_{L}^{\infty, 1}(\mathbb{R}^{n})$ (and, consequently, $\mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n}))$ .

Recall that our problem class is as follows.

<table><tr><td rowspan=1 colspan=1>Model:</td><td rowspan=1 colspan=1> $\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x), \quad f \in{\mathcal{F}}_{L}^{\infty, 1}(\mathbb{R}^{n})$ </td></tr><tr><td rowspan=1 colspan=1>Oracle:</td><td rowspan=1 colspan=1>First-order local Black Box.</td></tr><tr><td rowspan=1 colspan=1>Approximate solution:</td><td rowspan=1 colspan=1> $\bar{x} \in \mathbb{R}^{n}, \f(\bar{x}) - f^{*} \leq \epsilon.$ </td></tr></table>

In order to make our considerations simpler, let us introduce the following assumption on iterative processes.

Assumption 2.1.4 An iterative method <sup>M</sup> generates a sequence of test points $\{x_{k}\}$ such that

$$
x_{k} \in x_{0} + \mathrm{Lin} \{\nabla f(x_{0}), \ldots, \nabla f(x_{k - 1})\}, \quad k \geq 1.
$$

This assumption is not absolutely necessary and it can be avoided using more sophisticated reasoning. However, it holds for the majority of practical methods.

We can prove the lower complexity bounds for our problem class without developing a resisting oracle. Instead, we just point out the “worst function in the world” belonging to the class $\mathcal{F}_{L}^{\infty, 1}(\mathbb{R}^{n})$ . This function appears to be difficult for all iterative schemes satisfying Assumption 2.1.4.

Let us fix some constant $L \ > \0$ . Consider the following family of quadratic functions

$$
f_{k}(x) ={\textstyle{\frac{L}{4}}} \left\{{\frac{1}{2}} \left[(x^{(1)})^{2} + \sum_{i = 1}^{k - 1}(x^{(i)} - x^{(i + 1)})^{2} +(x^{(k)})^{2} \right] - x^{(1)} \right\}
$$

for $k = 1 \ldots n$ . Note that for all $h \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{\langle \nabla^{2} f_{k}(x) h, h \rangle = \frac{L}{4} \left[(h^{(1)})^{2} + \displaystyle \sum_{i = 1}^{k - 1}(h^{(i)} - h^{(i + 1)})^{2} +(h^{(k)})^{2} \right] \ge 0,} \end{array}
$$

and

$$
\begin{array}{l}{\langle \nabla^{2} f_{k}(x) h, h \rangle \le \frac{L}{4} \left[(h^{(1)})^{2} + \displaystyle \sum_{i = 1}^{k - 1} 2((h^{(i)})^{2} +(h^{(i + 1)})^{2}) +(h^{(k)})^{2} \right]} \\{\qquad \le L \displaystyle \sum_{i = 1}^{n}(h^{(i)})^{2}.} \end{array}
$$

Thus, $0 \preceq \nabla^{2} f_{k}(x) \preceq LI_{n}$ . Therefore, $f_{k}(\cdot) \in \mathcal{F}_{L}^{\infty, 1}(\mathbb{R}^{n}), 1 \leq k \leq n$

Let us compute the minimal value of the function $f_{k}$ . Note that $\begin{array}{r}{\nabla^{2} f_{k}(x) = \frac{L}{4} A_{k}} \end{array}$ with

$$
A_{k} = \left(\begin{array}{cccccc}{{2 - 1}} &{{0}} &{{}} &{{}} &{{}} &{{}} \\{{- 1}} &{{2 - 1}} &{{0}} &{{}} &{{}} &{{}} \\{{0}} &{{- 1}} &{{2}} &{{}} &{{}} &{{}} \\{{}} &{{}} &{{}} &{{}} &{{}} &{{}} \\{{}} &{{}} &{{\cdots}} &{{}} &{{\cdots}} &{{}} \\{{}} &{{}} &{{}} &{{- 1}} &{{2 - 1}} \\{{}} &{{0}} &{{0}} &{{- 1}} &{{2}} \\{{}} &{{}} &{{}} &{{}} &{{}} &{{}} \\{{0_{n - k, k}}} &{{}} &{{}} &{{}} &{{0_{n - k, n - k}}} \end{array} \right)
$$

where $0_{k, p}$ is a $(k \times p)$ zero matrix. Therefore, the equation

$$
\nabla f_{k}(x) = A_{k} x - e_{1} = 0
$$

has the following unique solution:

$$
\bar{x}_{k}^{(i)} = \left\{\begin{array}{ll}{{1 - \frac{i}{k + 1}, i = 1 \ldots k,}} \\{{\qquad \quad}} \\{{\0, \quad k + 1 \leq i \leq n.}} \end{array} \right.
$$

Hence, the optimal value of the function $f_{k}$ is

$$
\begin{array}{r}{f_{k}^{*} = \frac{L}{4} \left[\frac{1}{2} \langle A_{k} \bar{x}_{k}, \bar{x}_{k} \rangle - \langle e_{1}, \bar{x}_{k} \rangle \right] = - \frac{L}{8} \langle e_{1}, \bar{x}_{k} \rangle \ = \ \frac{L}{8} \left(- 1 + \frac{1}{k + 1} \right).} \end{array}\tag{2.1.17}
$$

Note also that

$$
\begin{array}{r}{\sum_{i = 1}^{k} i^{2} = \frac{k(k + 1)(2k + 1)}{6} \leq \frac{(k + 1)^{3}}{3}.} \end{array}\tag{2.1.18}
$$

Therefore,

$$
\begin{array}{rlr}{{\Vert \bar{x}_{k} \Vert^{2} = \sum_{i = 1}^{n}(\bar{x}_{k}^{(i)})^{2} = \sum_{i = 1}^{k}(1 - \frac{i}{k + 1})^{2}}} \\ &{} & \\ &{} &{= k - \frac{2}{k + 1} \displaystyle \sum_{i = 1}^{k} i + \frac{1}{(k + 1)^{2}} \displaystyle \sum_{i = 1}^{k} i^{2}} \\ &{} & \\ &{} &{\leq k - \frac{2}{k + 1} \cdot \frac{k(k + 1)}{2} + \frac{1}{(k + 1)^{2}} \cdot \frac{(k + 1)^{3}}{3} = \frac{1}{3}(k + 1).} \end{array}\tag{2.1.19}
$$

Let $\mathbb{R}^{k, n} = \{x \in \mathbb{R}^{n} \mid x^{(i)} = 0, k + 1 \leq i \leq n\}$ . This is the subspace of $\mathbb{R}^{n}$ in which only the first k components of the point can differ from zero. From the analytical form of the functions $\{f_{k}\}$ , it is easy to see that for all $x \in \mathbb{R}^{k, n}$ we have

$$
f_{p}(x) \equiv f_{k}(x), \quad p = k, \ldots, n.
$$

Let us fix some $p, 1 \leq p \leq n$

Lemma 2.1.5 Let $x_{0} = 0.$ . Then for any sequence $\{x_{k}\}_{k = 0}^{p}$ satisfying the condition

$$
\begin{array}{r}{\boldsymbol{x}_{k} \in \mathcal{L}_{k} \stackrel{\mathrm{def}}{=} \mathrm{Lin} \{\nabla f_{p}(\boldsymbol{x}_{0}), \ldots, \nabla f_{p}(\boldsymbol{x}_{k - 1})\},} \end{array}
$$

we have $\mathcal{L}_{k} \subseteq \mathbb{R}^{k, n}$

Proof Since $x_{0} = 0$ , we have $\begin{array}{r}{\nabla f_{p}(x_{0}) = - \frac{L}{4} e_{1} \in \mathbb{R}^{1, n}} \end{array}$ . Thus $\mathcal{L}_{1} \equiv \mathbb{R}^{1, n}$

Let $\mathcal{L}_{k} \subseteq \mathbb{R}^{k, n}$ for some $k \ < \p.$ . Since the matrix $A_{p}$ is tri-diagonal, for any $\boldsymbol{x} ~ \in \mathbb{R}^{k, n}$ we have $\nabla f_{p}(x) \ \in \ \mathbb{R}^{k + 1, n}$ . Therefore $\mathcal{L}_{k + 1} \mathbf{\bar{\Omega}} \subseteq \mathbb{R}^{k + 1, n}$ , and we can complete the proof by induction.

Corollary 2.1.1 For any sequence $\{\boldsymbol{x}_{k}\}_{k = 0}^{p}$ with $x_{0} = 0$ and $x_{k} \in \mathcal L_{k}$ , we have

$$
f_{p}(x_{k}) \geq f_{k}^{*}.
$$

Proof Indeed, $x_{k} \in \mathcal{L}_{k} \subseteq \mathbb{R}^{k, n}$ and therefore $f_{p}(x_{k}) = f_{k}(x_{k}) \geq f_{k}^{*}$ □

Now we are ready to prove the main result of this section.

Theorem 2.1.7 For any k, $1 \ \leq \k \ \leq \ \frac{1}{2}(n - 1)$ , and any $x_{0} ~ \in ~ \mathbb{R}^{n}$ there exists a function $f ~ \in ~ \mathcal{F}_{L}^{\infty, 1}(\mathbb{R}^{n})$ such that for any first-order method $\mathcal{M}$ satisfying Assumption 2.1.4 we have

$$
\begin{array}{r}{f(x_{k}) - f^{*} \geq \frac{3L \| x_{0} - x^{*} \|^{2}}{32(k + 1)^{2}},} \end{array}
$$

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel^{2} \geq \frac{1}{8} \parallel{} x_{0} - x^{*} \parallel^{2},} \end{array}
$$

where $x^{*}$ is the minimum of the function f and $f^{*} = f(x^{*})$

Proof It is clear that the methods of this type are invariant with respect to a simultaneous shift of all objects in the space of variables. Thus, the sequence of iterates, which is generated by such a method for the function $f(\cdot)$ starting from x , is just a shift of the sequence generated for ${\bar{f}}(x) = f(x + x_{0})$ starting from the origin. Therefore, we can assume that $x_{0} = 0$

Let us prove the first inequality. For that, let us fix k and apply $\mathcal{M}$ to minimize $f(x) = f_{2k + 1}(x)$ . Then $x^{*} = \bar{x}_{2k + 1}$ and $f^{*} = f_{2k + 1}^{*}$ . Using Corollary 2.1.1, we conclude that

$$
f(x_{k}) \equiv f_{2k + 1}(x_{k}) = f_{k}(x_{k}) \geq f_{k}^{*}.
$$

Hence, since $x_{0} = 0$ , in view of (2.1.17) and (2.1.19) we get the following estimate:

$$
\begin{array}{r}{\frac{f(x_{k}) - f^{*}}{\| x_{0} - x^{*} \|^{2}} \geq \frac{\frac{L}{8} \left(- 1 + \frac{1}{k + 1} + 1 - \frac{1}{2k + 2} \right)}{\frac{1}{3}(2k + 2)} = \frac{3}{8} L \cdot \frac{1}{4(k + 1)^{2}}.} \end{array}
$$

Let us prove the second inequality. Since $x_{k} \in \mathbb{R}^{k, n}$ and $x_{0} = 0$ , we have

$$
\begin{array}{rlr}{{\parallel x_{k} - x^{*} \parallel^{2} \geq \sum_{i = k + 1}^{2k + 1}(\bar{x}_{2k + 1}^{(i)})^{2} = \sum_{i = k + 1}^{2k + 1}(1 - \frac{i}{2k + 2})^{2}}} \\ &{} & \\ &{} &{= k + 1 - \frac{1}{k + 1} \sum_{i = k + 1}^{2k + 1} i + \frac{1}{4(k + 1)^{2}} \sum_{i = k + 1}^{2k + 1} i^{2}.} \end{array}
$$

In view of (2.1.18), we have

$$
\begin{array}{c}{{\sum_{i = k + 1}^{2k + 1} i^{2} = \frac{1}{6} \left[(2k + 1)(2k + 2)(4k + 3) - k(k + 1)(2k + 1) \right]}} \\{{{}}} \\{{{}}} \\{{= \frac{1}{6}(k + 1)(2k + 1)(7k + 6).}} \end{array}
$$

Therefore, using (2.1.19) we finally obtain

$$
\begin{array}{rl} &{\parallel x_{k} - x^{*} \parallel^{2} \geq k + 1 - \frac{1}{k + 1} \cdot \frac{(3k + 2)(k + 1)}{2} + \frac{(2k + 1)(7k + 6)}{24(k + 1)}} \\ &{\qquad = \frac{(2k + 1)(7k + 6)}{24(k + 1)} - \frac{k}{2} = \frac{2k^{2} + 7k + 6}{24(k + 1)}} \\ &{\qquad \geq \frac{2k^{2} + 7k + 6}{16(k + 1)^{2}} \parallel x_{0} - \bar{x}_{2k + 1} \parallel^{2} \geq \frac{1}{8} \parallel x_{0} - x^{*} \parallel^{2}.} \end{array}
$$

□

The above theorem is valid only under the assumption that the number of steps of the iterative scheme is not too large as compared with the dimension of the space of variables $\begin{array}{rlr}{(k} &{{} \le} &{\frac 12(n - 1))} \end{array}$ . Complexity bounds of this type are called uniform in the dimension. Clearly, they are valid for very large problems, in which we cannot even wait for n iterates of the method. However, even for problems with a moderate dimension, these bounds also provide us with some information. Firstly, they describe the potential performance of numerical methods at the initial stage of the minimization process. Secondly, they warn us that without a direct use of finitedimensional arguments we cannot justify a better complexity of the corresponding numerical scheme.

To conclude this section, let us note that the obtained lower bound for the value of the objective function is rather optimistic. Indeed, after one hundred iterations we could decrease the initial residual by $10^{4}$ times. However, the result on the behavior of the minimizing sequence is quite disappointing. The convergence to the optimal point can be arbitrarily slow. Since this is a lower bound, this conclusion is inevitable for our problem class. The only thing we can do is to try to find problem classes in which the situation could be better. This is the goal of the next section.

## 2.1.3 Strongly Convex Functions

Let us look at a possible restriction of the functional class $\mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n}, \Vert \cdot \Vert)$ , for which we can guarantee a reasonable rate of convergence to a unique solution of the minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x), \quad f \in{\mathcal{F}}^{1}(\mathbb{R}^{n}, \| \cdot \|).
$$

Recall that in Sect. 1.2.3 we have proved that in a small neighborhood of a nondegenerate local minimum the Gradient Method (1.2.15) converges linearly. Let us try to globalize this non-degeneracy assumption. Namely, let us assume that there exists some constant $\mu > 0$ such that for any x with $\nabla f({\bar{x}}) = 0$ and any $x \in \mathbb{R}^{n}$ we have

$$
f(x) \geq f({\bar{x}}) +{\frac{1}{2}} \mu \parallel x -{\bar{x}} \parallel^{2}.
$$

Recall that the norm in this definition can be general.

Using the same reasoning as in the beginning of Sect. 2.1.1, we obtain the class of strongly convex functions.

Definition 2.1.3 A continuously differentiable function $f(\cdot)$ is called strongly convex on $\mathbb{R}^{n}$ (notation $f \in \mathcal{S}_{\mu}^{1}(Q, \| \cdot \|))$ if there exists a constant $\mu > 0$ such that for any $x, y \in Q$ we have

$$
f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle +{\frac{1}{2}} \mu \parallel y - x \parallel^{2}.\tag{2.1.20}
$$

The constant $\mu$ is called the convexity parameter of function $f$

We will also consider the classes $\mathcal{S}_{\mu, L}^{k, l}(Q, \parallel \cdot \parallel)$ where the indices k, l and L have the same meaning as for the class $C_{L}^{k, l}(Q)$

Let us mention the most important properties of strongly convex functions.

Theorem 2.1.8 I ${}^{r} f \in{\mathcal{S}}_{\mu}^{1}(\mathbb{R}^{n})$ and $\nabla f(x^{*}) = 0,$ , then

$$
f(x) \geq f(x^{*}) +{\textstyle{\frac{1}{2}}} \mu \parallel x - x^{*} \parallel^{2}\tag{2.1.21}
$$

for all $x \in \mathbb{R}^{n}$

Proof Since $\nabla f(x^{*}) = 0$ , for any $x \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{rl}{f(x) \stackrel{(2.1.20)}{\geq} f(x^{*}) + \langle \nabla f(x^{*}), x - x^{*} \rangle + \frac{1}{2} \mu \parallel x - x^{*} \parallel^{2}} &{} \\{=} &{f(x^{*}) + \frac{1}{2} \mu \parallel x - x^{*} \parallel^{2}.} \end{array}
$$

□

Let us describe the result of addition of two strongly convex functions.

Lemma 2.1.6 If $f_{1} \in \mathcal{S}_{\mu_{1}}^{1}(Q_{1}, \| \cdot \|), f_{2} \in \mathcal{S}_{\mu_{2}}^{1}(Q_{2}, \| \cdot \|)$ and α, $\beta \geq 0_{;}$ , then

$$
f = \alpha f_{1} + \beta f_{2} \in \mathcal{S}_{\alpha \mu_{1} + \beta \mu_{2}}^{1}(Q_{1} \bigcap Q_{2}, \| \cdot \|).
$$

Proof For any x, $y \in Q_{1} \bigcap Q_{2}$ , we have

$$
\begin{array}{r}{f_{1}(y) \ge f_{1}(x) + \langle \nabla f_{1}(x), y - x \rangle + \frac{1}{2} \mu_{1} \parallel y - x \parallel^{2},} \end{array}
$$

$$
\begin{array}{r}{f_{2}(y) \geq f_{2}(x) + \langle \nabla f_{2}(x), y - x \rangle + \frac{1}{2} \mu_{2} \parallel y - x \parallel^{2}.} \end{array}
$$

It remains to add these equations multiplied by α and $\beta$ respectively.

Note that the class $\mathcal{S}_{0}^{1}(Q, \| \cdot \|)$ coincides with ${\mathcal{F}}^{1}(Q, \parallel \cdot \parallel)$ . Therefore, addition of a convex function and a strongly convex function gives a strongly convex function with the same value of convexity parameter.

Let us give several equivalent definitions of strongly convex functions.

Theorem 2.1.9 Let f be continuously differentiable. Both conditions below, holding for all $x, y \in Q$ and $\alpha \in[0, 1]$ , are equivalent to inclusion $f \in \mathcal{S}_{\mu}^{1}(Q, \| \cdot \|){:}$

$$
\langle \nabla f(x) - \nabla f(y), x - y \rangle \geq \mu \parallel x - y \parallel^{2},\tag{2.1.22}
$$

$$
\alpha f(x) +(1 - \alpha) f(y) \geq f(\alpha x +(1 - \alpha) y)\tag{2.1.23}
$$

$$
\begin{array}{r}{+ \alpha(1 - \alpha) \frac{\mu}{2} \parallel x - y \parallel^{2}.} \end{array}
$$

The proof of this theorem is very similar to the proof of Theorem 2.1.5 and we leave it as an exercise for the reader.

The next statement is sometimes useful.

Theorem 2.1.10 If $f \in \mathcal{S}_{\mu}^{1}(\mathbb{R}^{n}, \parallel \cdot \parallel)$ , then for any x and y from $\mathbb{R}^{n}$ we have

$$
\begin{array}{r}{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2 \mu} \parallel \nabla f(x) - \nabla f(y) \parallel_{*}^{2},} \end{array}\tag{2.1.24}
$$

$$
\begin{array}{r}{\langle \nabla f(x) - \nabla f(y), x - y \rangle \leq \frac{1}{\mu} \parallel \nabla f(x) - \nabla f(y) \parallel_{*}^{2},} \end{array}\tag{2.1.25}
$$

$$
\mu \| x - y \| \leq \| \nabla f(x) - \nabla f(y) \|_{*}.\tag{2.1.26}
$$

Proof Let us fix some $x \in \mathbb{R}^{n}$ . Consider the function

$$
\phi(y) = f(y) - \langle \nabla f(x), y \rangle \in \mathcal{S}_{\mu}^{1}(\mathbb{R}^{n}, \| \cdot \|).
$$

Since $\nabla \phi(x) = 0$ , for any $y \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{rlr}{{\phi(x) = \operatorname{min}_{v \in \mathbb{R}^{n}} \phi(v) \stackrel{(2.1.20)}{\geq} \operatorname{min}_{v \in \mathbb{R}^{n}}[\phi(y) + \langle \nabla \phi(y), v - y \rangle + \frac{1}{2} \mu \| v - y \|^{2}]}} \\ &{} & \\ &{} &{= \phi(y) - \frac{1}{2 \mu} \| \nabla \phi(y) \|_{*}^{2},} \end{array}
$$

and this is exactly (2.1.24). Adding two copies of (2.1.24) with x and y interchanged, we get (2.1.25). Finally, (2.1.26) follows from (2.1.25) and (2.1.22).

Let us present a second-order characterization of the class $\mathcal{S}_{\mu}^{1}(Q, \| \cdot \|)$

Theorem 2.1.11 Let a continuous function f be twice continuously differentiable in intQ. It belongs to the class $\mathcal{S}_{\mu}^{2}(Q, \parallel \cdot \parallel)$ if and only if for all $x \ \in \ \operatorname{int} Q$ and $h \in \mathbb{R}^{n}$ we have

$$
\langle \nabla^{2} f(x) h, h \rangle \succeq \mu \| h \|^{2}.\tag{2.1.27}
$$

Proof We get (2.1.27) from (2.1.22) by setting $y = x + \alpha h \in{\mathcal{Q}}$ with α small enough and letting $\alpha \to 0$ □

In the case of the standard Euclidean norm, condition (2.1.27) can be written in the form of a matrix inequality:

$$
\nabla^{2} f(x) \succeq \mu I_{n}, \quad x \in \mathrm{int} Q.\tag{2.1.28}
$$

Now we can look at some examples of strongly convex functions.

## Example 2.1.2

1. Let a symmetric matrix A satisfy the conditions $\mu I_{n} \preceq A \preceq LI_{n}$ . Then, since $\nabla^{2} f(x) = A$ , we have

$$
f(x) = \alpha + \langle a, x \rangle + \frac{1}{2} \langle Ax, x \rangle \in \mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{n}) \subset \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n}).
$$

Adding this function to a convex function, we get other examples of strongly convex functions.

2. Let $Q = \Delta_{n}^{+} \{\stackrel{\mathrm{det}}{=}} \ \{x \in \mathbb{R}_{+}^{n} : \ \langle{\bar{e}}_{n}, x \rangle \leq 1\}$ , where $\bar{e}_{n} \in \mathbb{R}^{n}$ is a vector of all ones. Consider the entropy function:

$$
\eta(x) = \sum_{i = 1}^{n} x^{(i)} \ln x^{(i)}, \quad x \in \varDelta_{n}^{+}.\tag{2.1.29}
$$

For direction $\textit{h} \in \mathbb{R}^{n}$ , we have $\langle \nabla^{2} \eta(x) h, h \rangle \ = \ \sum_{i = 1}^{n} \frac{(h^{(i)})^{2}}{x^{(i)}}$ . We need to find the minimum of this expression in $x \ \in \ \operatorname{int} \varDelta_{n}^{+}$ . Since it is decreasing in $x,$ we conclude that the inequality constraint is active and we need to compute $\operatorname{min}_{\langle e_{n} x \rangle = 1} \sum_{i = 1}^{n} \frac{(h^{(i)})^{2}}{x^{(i)}}$ . In view of Corollary 1.2.1, this minimum $x_{*}$ can be found from the system of equations

$$
\begin{array}{r}{\frac{(h^{(i)})^{2}}{(x_{*}^{(i)})^{2}} = \lambda_{*},} \end{array}
$$

where $\lambda^{*}$ is the optimal dual multiplier. It can be found from the equation

$$
1 = \sum_{i = 1}^{n} x_{*}^{(i)} \ = \ \frac{1}{\lambda_{*}^{1 / 2}} \sum_{i = 1}^{n} | h^{(i)} |.
$$

Thus, $\langle \nabla^{2} \eta(x) h, h \rangle \geq \sum_{i = 1}^{n} \frac{(h^{(i)})^{2}}{x_{*}^{(i)}} = \left(\sum_{i = 1}^{n} | h^{(i)} | \right)^{2}$ , and by Theorem 2.1.11 we conclude that the entropy function is strongly convex on $\varDelta_{N}^{+}$ in the $\ell_{1}{\mathrm{- norm}}$ with convexity parameter one.

One of the most important functional classes is $\mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ (recall that the corresponding norm is standard Euclidean). This class is described by the following inequalities:

$$
\langle \nabla f(x) - \nabla f(y), x - y \rangle \geq \mu \parallel x - y \parallel^{2},\tag{2.1.30}
$$

$$
\parallel \nabla f(x) - \nabla f(y) \parallel \leq L \parallel x - y \parallel.\tag{2.1.31}
$$

The value $Q_{f} = L / \mu \geq 1$ is called the condition number of the function $f.$

It is important that inequality (2.1.30) can be strengthened by the additional information obtained from (2.1.31).

Theorem 2.1.12 If $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ , then for any x, $y \in \mathbb{R}^{n}$ we have

$$
\begin{array}{r}{\langle \nabla f(x) - \nabla f(y), x - y \rangle \geq \frac{\mu L}{\mu + L} \parallel x - y \parallel^{2} + \frac{1}{\mu + L} \parallel \nabla f(x) - \nabla f(y) \parallel^{2}.} \end{array}\tag{2.1.32}
$$

Proof Define $\phi(x) ~ = ~ f(x) -{\textstyle{\frac{1}{2}}} \mu \| x \|^{2}$ . Then $\nabla \phi(x) = \nabla f(x) - \mu x$ . Hence, by inequalities (2.1.30) and (2.1.12), $\phi \in \mathcal{F}_{L - \mu}^{1, 1}(\mathbb{R}^{n})$ . If $\mu = L$ , then (2.1.32) is proved. If $\mu < L$ , then by (2.1.11) we have

$$
\begin{array}{r}{\langle \nabla \phi(x) - \nabla \phi(y), y - x \rangle \geq \frac{1}{L - \mu} \| \nabla \phi(x) - \nabla \phi(y) \|^{2},} \end{array}
$$

and this is exactly (2.1.32).

## 2.1.4 Lower Complexity Bounds for $\mathcal{S}_{\pmb{\mu}, L}^{\infty, 1}(\mathbb{R}^{n})$

Let us obtain the lower complexity bounds for unconstrained minimization of functions from the class $\mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{n}) \stackrel{\cdot}{\subset} \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ . Consider the following problem class.

<table><tr><td rowspan=1 colspan=1>Model:</td><td rowspan=1 colspan=1> $\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x)$     $f \in \mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{n}), \ \mu > 0, \n \geq 1$ </td></tr><tr><td rowspan=1 colspan=1>Oracle:</td><td rowspan=1 colspan=1>First-order local Black Box.</td></tr><tr><td rowspan=1 colspan=1>Approximate solution:</td><td rowspan=1 colspan=1> $\bar{x} : f(\bar{x}) - f^{*} \leq \epsilon, \| \bar{x} - x^{*} \|^{2}{\leq} \epsilon.$ </td></tr></table>

As in the previous section, we consider methods satisfying Assumption 2.1.4. We are going to find the lower complexity bounds for our problems in terms of the condition number $\begin{array}{r}{Q_{f} = \frac{L}{\mu}} \end{array}$ . Note that in the description of our problem class, we do not fix the dimension of the space of variables. Therefore, formally this class also includes an infinite-dimensional problem.

We are going to give an example of a bad function defined in an infinitedimensional space. It is also possible to do this in finite dimensions, but the corresponding reasoning is more complicated.

Consider $\mathbb{R}^{\infty} \equiv \ell_{2}$ , the space of all sequences $\boldsymbol{x} = \{\boldsymbol{x}^{(i)}\}_{i = 1}^{\infty}$ with finite standard Euclidean norm

$$
\parallel x \parallel^{2} = \sum_{i = 1}^{\infty} \left(x^{(i)} \right)^{2} < \infty.
$$

Let us choose two parameters, $\mu > 0$ and $Q_{f} ~ > ~ 1$ , which define the following function

$$
f_{\mu, Q_{f}}(x) ={\textstyle \frac{\mu(Q_{f} - 1)}{8}} \left\{(x^{(1)})^{2} + \sum_{i = 1}^{\infty}(x^{(i)} - x^{(i + 1)})^{2} - 2x^{(1)} \right\} +{\textstyle \frac{\mu}{2}} \parallel x \parallel^{2}.
$$

Let $L = \mu Q_{f}$ and

$$
A = \left({\begin{array}{cc}{2 - 1} &{0} &{0} \\{- 1} &{2 - 1} &{0} \\{0 - 1} &{2} &{\ddots} \\{0} &{0} &{\ddots} \end{array}} \right).
$$

Then $\begin{array}{r}{\nabla^{2} f_{\mu, Q_{f}}(x) = \frac{\mu(Q_{f} - 1)}{4} A + \mu I} \end{array}$ , where I is the unit operator in $\mathbb{R}^{\infty}$ . As in Sect. 2.1.2, we can see that $0 \preceq A \preceq 4I$ . Therefore,

$$
\mu I \preceq \nabla^{2} f_{\mu, Q_{f}}(x) \preceq(\mu(Q_{f} - 1) + \mu) I \ = \ \mu Q_{f} I \ = \LI.
$$

This means that $f_{\mu, Q_{f}} ~ \in ~ \mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{\infty})$ . Note that the condition number of the function $f_{\mu, Q_{f}}$ is $Q_{f}$

Let us find the minimum of the function $f_{\mu, Q_{f}}$ . The first-order optimality condition

$$
\begin{array}{r}{\nabla f_{\mu, Q_{f}}(x) \equiv \left(\frac{\mu(Q_{f} - 1)}{4} A + \mu I \right) x - \frac{\mu(Q_{f} - 1)}{4} e_{1} = 0} \end{array}
$$

can be written as

$$
\begin{array}{r}{\left(A + \frac{4}{Q_{f} - 1} I \right) x = e_{1}.} \end{array}
$$

The coordinate form of this equation is as follows:

$$
\begin{array}{r}{2 \frac{Q_{f} + 1}{Q_{f} - 1} x^{(1)} - x^{(2)} = 1,} \end{array}\tag{2.1.33}
$$

$$
\begin{array}{r}{x^{(k + 1)} - 2 \frac{Q_{f} + 1}{Q_{f} - 1} x^{(k)} + x^{(k - 1)} = 0, k = 2, \dots.} \end{array}
$$

Let $q$ be the smallest root of the equation

$$
\begin{array}{r}{q^{2} - 2 \frac{Q_{f} + 1}{Q_{f} - 1} q + 1 = 0,} \end{array}
$$

that is $\begin{array}{r}{q \ = \ \frac{\sqrt{Q_{f}} - 1}{\sqrt{Q_{f}} + 1}} \end{array}$ . Then the sequence $(x^{*})^{(k)} = q^{k}, k = 1, 2, \ldots$ , satisfies the system (2.1.33). Thus, we come to the following result.

Theorem 2.1.13 For any $x_{0} ~ \in ~ \mathbb{R}^{\infty}$ and any constants $\mu \ : > \ : 0, \ : Q_{f} \ : > \ : 1$ , there exists a function $f \in \mathcal{S}_{\mu, L}^{\infty, 1}(\mathbb{R}^{\infty})$ such that for any first-order method <sup>M</sup> satisfying Assumption 2.1.4, we have

$$
\begin{array}{r}{\Vert \textbf{} x_{k} - x^{*} \textrm{\Vert}^{2} \ge \left(\frac{\sqrt{Q_{f}} - 1}{\sqrt{Q_{f}} + 1} \right)^{2k} \textrm{\Vert} x_{0} - x^{*} \textrm{\Vert}^{2},} \end{array}\tag{2.1.34}
$$

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \geq \frac{\mu}{2} \left(\frac{\sqrt{Q_{f}} - 1}{\sqrt{Q_{f}} + 1} \right)^{2k} \parallel x_{0} - x^{*} \parallel^{2},} \end{array}\tag{2.1.35}
$$

where $x^{*}$ is the unique unconstrained minimum of function $f.$

Proof Indeed, we can assume that $x_{0} = 0$ . Let us choose $f(x) = f_{\mu, Q_{f}}(x)$ . Then

$$
\parallel x_{0} - x^{*} \parallel^{2} = \sum_{i = 1}^{\infty}[(x^{*})^{(i)}]^{2} = \sum_{i = 1}^{\infty} q^{2i} ={\textstyle{\frac{q^{2}}{1 - q^{2}}}}.
$$

Since $\nabla^{2} f_{\mu, Q_{f}}(x)$ is a tri-diagonal operator and $\nabla f_{\mu, Q_{f}}(0) ~ = ~ - \frac{L - \mu}{4} e_{1}$ , we conclude that $x_{k} \in \mathbb{R}^{k, \infty}$ . Therefore

$$
\parallel x_{k} - x^{*} \parallel^{2} \geq \sum_{i = k + 1}^{\infty}[(x^{*})^{(i)}]^{2} = \sum_{i = k + 1}^{\infty} q^{2i} = \textstyle{\frac{q^{2(k + 1)}}{1 - q^{2}}} = q^{2k} \parallel x_{0} - x^{*} \parallel^{2}.
$$

The second bound of this theorem follows from (2.1.34) and Theorem 2.1.8.

## 2.1.5 The Gradient Method

Let us describe the performance of the Gradient Method as applied to the problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} ~ f(x)\tag{2.1.36}
$$

with $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ . Recall that the scheme of the Gradient Method is as follows.

Gradient Method   
0. Choose $x_{0} \in \mathbb{R}^{n}$   
1. kth iteration $(k \geq 0).$   
(a) Compute $f(x_{k})$ and $\nabla f(x_{k})$   
(b) Find $x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k})$ (see Sect. 1.2.3 for step  
size rules).

(2.1.37)

In this section, we analyze the simplest variant of the gradient scheme with $h_{k} =$ $h > 0$ . It is possible to show that for all other reasonable step-size rules the rate of convergence of this method is similar. Denote by $x^{*}$ an arbitrary optimal point of our problem, and let $f^{*} = f(x^{*})$

Theorem 2.1.14 Let $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ and $\textstyle 0 < h <{\frac{2}{L}}$ . Then the Gradient Method generates a sequence of points $\{x_{k}\}_{}$ , with function values satisfying the inequality

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{2(f(x_{0}) - f^{*}) \| x_{0} - x^{*} \|^{2}}{2 \| x_{0} - x^{*} \|^{2} + k \cdot h(2 - Lh) \cdot(f(x_{0}) - f^{*})}, \quad k \geq 0.} \end{array}
$$

Proof Let $r_{k} = \parallel{} x_{k} - x^{*} \parallel{}$ . Then

$$
\begin{array}{rl} &{r_{k + 1}^{2} = \parallel x_{k} - x^{*} - h \nabla f(x_{k}) \parallel^{2}} \\ &{\qquad = r_{k}^{2} - 2h \langle \nabla f(x_{k}), x_{k} - x^{*} \rangle + h^{2} \parallel \nabla f(x_{k}) \parallel^{2}} \\ &{\qquad \leq r_{k}^{2} - h(\frac{2}{L} - h) \parallel \nabla f(x_{k}) \parallel^{2}} \end{array}
$$

(we use (2.1.11) and $\nabla f(x^{*}) = 0)$ . Therefore, $r_{k} \le r_{0}$ . In view of (2.1.9), we have

$$
\begin{array}{rl} &{f(x_{k + 1}) \leq f(x_{k}) + \langle \nabla f(x_{k}), x_{k + 1} - x_{k} \rangle + \frac{L}{2} \parallel x_{k + 1} - x_{k} \parallel^{2}} \\ &{} \\ &{\qquad = f(x_{k}) - \omega \parallel \nabla f(x_{k}) \parallel^{2},} \end{array}
$$

where $\begin{array}{r}{\omega = h(1 - \frac{L}{2} h)} \end{array}$ . Define $\varDelta_{k} = f(x_{k}) - f^{*}$ . Then

$$
{\cal A}_{k} \overset{(2.1.2)}{\leq} \langle \nabla f(x_{k}), x_{k} - x^{*} \rangle \leq r_{0} \parallel \nabla f(x_{k}) \parallel.
$$

Therefore, $\begin{array}{r}{\varDelta{k} + 1 \leq \varDelta{k} - \frac{\omega}{r_{0}^{2}} \varDelta_{k}^{2}} \end{array}$ . Thus,

$$
\begin{array}{r}{\frac{1}{\varDelta_{k + 1}} \geq \frac{1}{\varDelta_{k}} + \frac{\omega}{r_{0}^{2}} \cdot \frac{\varDelta_{k}}{\varDelta_{k + 1}} \geq \frac{1}{\varDelta_{k}} + \frac{\omega}{r_{0}^{2}}.} \end{array}
$$

Summing up these inequalities, we get

$$
\begin{array}{r}{\frac{1}{\varDelta_{k + 1}} \geq \frac{1}{\varDelta_{0}} + \frac{\omega}{r_{0}^{2}}(k + 1).} \end{array}
$$

□

In order to choose the optimal step size, we need to maximize the function $\phi(h) = h(2 - Lh)$ with respect to h. The first-order optimality condition $\phi^{\prime}(h) =$ $2 - 2Lh = 0$ provides us with the value $\begin{array}{r}{h^{*} = \frac{1}{L}} \end{array}$ . In this case, we get the following rate of convergence for the Gradient Method:

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{2L(f(x_{0}) - f^{*}) \| x_{0} - x^{*} \|^{2}}{2L \| x_{0} - x^{*} \|^{2} + k \cdot(f(x_{0}) - f^{*})}.} \end{array}\tag{2.1.38}
$$

Further, in view of (2.1.9) we have

$$
\begin{array}{r}{f(x_{0}) \leq f^{*} + \langle \nabla f(x^{*}), x_{0} - x^{*} \rangle + \frac{L}{2} \parallel x_{0} - x^{*} \parallel^{2} = f^{*} + \frac{L}{2} \parallel x_{0} - x^{*} \parallel^{2}.} \end{array}
$$

Since the right-hand side of inequality (2.1.38) is increasing in $f(x_{0}) - f^{*}$ , we obtain the following result.

Corollary 2.1.2 $\begin{array}{r}{Ifh = \frac{1}{L}} \end{array}$ and $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ , then

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{2L \| x_{0} - x^{*} \|^{2}}{k + 4}.} \end{array}\tag{2.1.39}
$$

Let us estimate the performance of the Gradient Method on the class of strongly convex functions.

Theorem 2.1.15 If $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ and $\begin{array}{r}{0 < h \le \frac{2}{\mu + L}} \end{array}$ , then the Gradient Method generates a sequence $\{x_{k}\}$ such that

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel^{2}{\leq} \left(1 - \frac{2h \mu L}{\mu + L} \right)^{k} \parallel{x_{0}} - x^{*} \parallel^{2}.} \end{array}
$$

$\begin{array}{r}{Ifh = \frac{2}{\mu + L}} \end{array}$ , then

$$
\begin{array}{r}{\parallel{\boldsymbol x}_{k} -{\boldsymbol x}^{*} \parallel \leq \left(\frac{Q_{f} - 1}{Q_{f} + 1} \right)^{k} \parallel{\boldsymbol x}_{0} -{\boldsymbol x}^{*} \parallel,} \end{array}
$$

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{L}{2} \left(\frac{Q_{f} - 1}{Q_{f} + 1} \right)^{2k} \parallel x_{0} - x^{*} \parallel^{2},} \end{array}
$$

where $Q_{f} = L / \mu$

Proof Let $r_{k} = \parallel{} x_{k} - x^{*} \parallel{}$ . Then

$$
\begin{array}{rl} &{r_{k + 1}^{2} = \| \b{x}_{k} - \b{x}^{*} - \boldsymbol{h} \nabla f(\boldsymbol{x}_{k}) \|^{2} = r_{k}^{2} - 2 \boldsymbol{h} \langle \nabla f(\boldsymbol{x}_{k}), \boldsymbol{x}_{k} - \boldsymbol{x}^{*} \rangle + h^{2} \| \nabla f(\boldsymbol{x}_{k}) \|^{2}} \\ &{\qquad \leq \left(1 - \frac{2h \mu L}{\mu + L} \right) r_{k}^{2} + \boldsymbol{h} \left(\boldsymbol{h} - \frac{2}{\mu + L} \right) \| \nabla f(\boldsymbol{x}_{k}) \|^{2}} \end{array}
$$

(we use (2.1.32) and $\nabla f(x^{*}) = 0)$ . The last inequality of the theorem follows from the previous one and (2.1.9).

Note that the highest rate of convergence is achieved for $\begin{array}{r}{h = \frac{2}{\mu + L}} \end{array}$ . In this case,

$$
\begin{array}{r}{\| x_{k} - x^{*} \|^{2} \leq \left(\frac{L - \mu}{L + \mu} \right)^{2k} \| x_{0} - x^{*} \|^{2}.} \end{array}\tag{2.1.40}
$$

We have already seen the step-size rule $\begin{array}{r}{h = \frac{2}{\mu + L}} \end{array}$ and the linear rate of convergence of the Gradient Method in Sect. 1.2.3, Theorem 1.2.4. However, this was only a local result.

Comparing the rate of convergence of the Gradient Method with the lower complexity bounds (Theorems 2.1.7 and 2.1.13), we can see that it is far from being optimal for the classes $\mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ and $\mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ . We should also note that on these problem classes the standard unconstrained minimization methods (Conjugate Gradients, Variable Metric) are not better. The optimal methods for minimizing smooth convex and strongly convex functions need the accumulation of some global information on the objective function. We will describe such schemes in the next section.

## 2.2 Optimal Methods

(Estimating sequences and Fast Gradient Methods; Decreasing the norm of the gradient; Convex sets; Constrained minimization problems; The gradient mapping; Minimization methods over simple sets.)

## 2.2.1 Estimating Sequences

Let us consider the following unconstrained minimization problem:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x),\tag{2.2.1}
$$

where $f$ is strongly convex: $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n}), \mu \geq 0$ . Since $\mathcal{S}_{0, L}^{1, 1}(\mathbb{R}^{n}) \equiv \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ this family of classes also contains the class of convex functions with Lipschitz continuous gradient. We assume that there exists a solution $x^{*}$ of problem (2.2.1) and define $f^{*} = f(x^{*})$

In Sect. 2.1, we proved the following convergence rates for the Gradient Method:

$$
\begin{array}{rl} &{{\mathcal F}_{L}^{1, 1}({\mathbb R}^{n}) : \f(x_{k}) - f^{*} \leq \frac{2L \| x_{0} - x^{*} \|^{2}}{k + 4},} \\ &{{\mathcal S}_{\mu, L}^{1, 1}({\mathbb R}^{n}) : \f(x_{k}) - f^{*} \leq \frac{L}{2} \left(\frac{L - \mu}{L + \mu} \right)^{2k} \\parallelx_{0} - x^{*} \parallel^{2}.} \end{array}
$$

These estimates differ from our lower complexity bounds (Theorem 2.1.7 and Theorem 2.1.13) by an order of magnitude. Of course, generally speaking, this does not mean that the Gradient Method is not optimal (it may be that the lower bounds are too optimistic). However, we will see that in our case the lower bounds are exact up to a constant factor. We prove this by constructing a method with rate of convergence proportional to these bounds.

Recall that the Gradient Method forms a relaxation sequence:

$$
f(x_{k + 1}) \leq f(x_{k}).
$$

This fact is crucial for the justification of its convergence rate (Theorem 2.1.14). However, in Convex Optimization relaxation is not so important. Firstly, for some problem classes, this property is quite expensive. Secondly, the schemes and efficiency estimates of optimal methods are derived from some global topological properties of convex functions (see Theorem 2.1.5). From this point of view, the relaxation property is too microscopic to be useful.

The schemes and efficiency bounds of optimal methods are based on the notion of estimating sequences.

Definition 2.2.1 A pair of sequences $\{\phi_{k}(x)\}_{k = 0}^{\infty}$ and $\{\lambda_{k}\}_{k = 0}^{\infty}, \lambda_{k} \geq 0$ , are called the estimating sequences of the function f ( ) if

$$
\lambda_{k} \to 0,
$$

and for any $x \in \mathbb{R}^{n}$ and all $k \geq 0$ we have

$$
\phi_{k}(x) \leq(1 - \lambda_{k}) f(x) + \lambda_{k} \phi_{0}(x).\tag{2.2.2}
$$

The next statement explains why these objects are useful.

Lemma 2.2.1 If for some sequence of points $\{x_{k}\}$ we have

$$
f(x_{k}) \leq \phi_{k}^{*} \overset{\mathrm{def}}{=} \operatorname{min}_{x \in \mathbb{R}^{n}} \phi_{k}(x),\tag{2.2.3}
$$

then $f(x_{k}) - f^{*} \leq \lambda_{k}[\phi_{0}(x^{*}) - f^{*}] \to 0.$

Proof Indeed,

$$
\begin{array}{rl} &{f(x_{k}) \leq \phi_{k}^{*} = \displaystyle \operatorname{min}_{x \in{\mathbb R}^{n}} \phi_{k}(x) \stackrel{\scriptscriptstyle(2.2.2)}{=} \displaystyle \operatorname{min}_{x \in{\mathbb R}^{n}}[(1 - \lambda_{k}) f(x) + \lambda_{k} \phi_{0}(x)]} \\ &{\quad \quad \quad \quad \quad \leq \left(1 - \lambda_{k} \right) f(x^{*}) + \lambda_{k} \phi_{0}(x^{*}).} \end{array}
$$

□

Thus, for any sequence $\{x_{k}\}$ , satisfying (2.2.3), we can derive its rate of convergence directly from the convergence rate of the sequence $\{\lambda_{k}\}$ . However, at this moment we have two serious questions. Firstly, we do not know how to form the estimating sequences. Secondly, we do not know how to satisfy inequalities (2.2.3). The first question is simpler.

Lemma 2.2.2 Assume that:

1. a function $f(\cdot)$ belongs to the class $\mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$

2. $\phi_{0}(\cdot)$ is an arbitrary convex function on $\mathbb{R}^{n}$

3. $\{y_{k}\}_{k = 0}^{\infty}$ is an arbitrary sequence of points in $\mathbb{R}^{n}$

4. the coefficients $\{\alpha_{k}\}_{k = 0}^{\infty}$ satisfy conditions $\alpha_{k} \in(0, 1)$ and $\sum_{k = 0}^{\infty} \alpha_{k} = \infty,$

5. we choose $\lambda_{0} = 1$

Then the pair of sequences $\{\phi_{k}(\cdot)\}_{k = 0}^{\infty}$ and $\{\lambda_{k}\}_{k = 0}^{\infty},$ , defined recursively by the relations

$$
\lambda_{k + 1} =(1 - \alpha_{k}) \lambda_{k},
$$

$$
\begin{array}{r}{\phi_{k + 1}(x) =(1 - \alpha_{k}) \phi_{k}(x) + \alpha_{k} \left[f(y_{k}) + \langle \nabla f(y_{k}), x - y_{k} \rangle + \frac{\mu}{2} \parallel x - y_{k} \parallel^{2} \right],} \end{array}\tag{2.2.4}
$$

Proof Indeed, $\phi_{0}(x) \le(1 - \lambda_{0}) f(x) + \lambda_{0} \phi_{0}(x) \equiv \phi_{0}(x)$ . Further, let (2.2.2) hold for some $k \geq 0$ . Then

$$
\begin{array}{rlrl}{{\phi_{k + 1}(x) \overset{(2.1.20),(2.2.4)}{\leq}(1 - \alpha_{k}) \phi_{k}(x) + \alpha_{k} f(x)}} \\ &{} & &{} \\ &{=} &{(1 -(1 - \alpha_{k}) \lambda_{k}) f(x) +(1 - \alpha_{k})(\phi_{k}(x) -(1 - \lambda_{k}) f(x))} \\ &{} & &{} \\ &{} &{\leq} &{(1 -(1 - \alpha_{k}) \lambda_{k}) f(x) +(1 - \alpha_{k}) \lambda_{k} \phi_{0}(x)} \\ &{} & &{} \\ &{\overset{(2.2.4)}{\leq}} &{(1 - \lambda_{k + 1}) f(x) + \lambda_{k + 1} \phi_{0}(x).} \end{array}
$$

It remains to note that condition 4) ensures $\lambda_{k} 0.\quad \sqcup$

Thus, the above statement provides us with some rules for updating the estimating sequences. Now we have two control sequences which can help us to maintain recursively the relation (2.2.3). At this moment, we are also free in our choice of initial function $\phi_{0}(x)$ . Let us choose it as a simple quadratic function. Then, we can obtain a closed form recurrence for values $\phi_{k}^{*}$

Lemma 2.2.3 Let $\begin{array}{r}{\phi_{0}(x) = \phi_{0}^{*} + \frac{\gamma_{0}}{2} \parallel x - v_{0} \parallel^{2}} \end{array}$ . Then the process (2.2.4) preserves the canonical form of functions $\{\phi_{k}(x)\}$

$$
\begin{array}{r}{\phi_{k}(x) \equiv \phi_{k}^{*} + \frac{\gamma_{k}}{2} \parallel x - v_{k} \parallel^{2},} \end{array}\tag{2.2.5}
$$

where the sequences $\{\gamma_{k}\}, \ \{v_{k}\}$ and $\{\phi_{k}^{*}\}$ are defined as follows:

$$
\gamma_{k + 1} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu,
$$

$$
\begin{array}{r}{v_{k + 1} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} \nabla f(y_{k})],} \end{array}
$$

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} =(1 - \alpha_{k}) \phi_{k}^{*} + \alpha_{k} f(y_{k}) - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \parallel \nabla f(y_{k}) \parallel^{2}} \\ &{\qquad + \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \left(\frac{\mu}{2} \parallel y_{k} - v_{k} \parallel^{2} + \langle \nabla f(y_{k}), v_{k} - y_{k} \rangle \right).} \end{array}
$$

Proof Note that $\nabla^{2} \phi_{0}(x) = \gamma_{0} I_{n}$ . Let us show that $\nabla^{2} \phi_{k}(x) = \gamma_{k} I_{n}$ for all $k \geq 0$ Indeed, if it is true for some $k,$ , then

$$
\begin{array}{r}{\nabla^{2} \phi_{k + 1}(x) =(1 - \alpha_{k}) \nabla^{2} \phi_{k}(x) + \alpha_{k} \mu I_{n} =((1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu) I_{n} \equiv \gamma_{k + 1} I_{n}.} \end{array}
$$

This justifies the canonical form (2.2.5) of the functions $\phi_{k}(\cdot)$ . Further,

$$
\begin{array}{rl} &{\phi_{k + 1}(x) \overset{(2.2.4)}{=}(1 - \alpha_{k}) \left(\phi_{k}^{*} + \frac{\gamma_{k}}{2} \parallel x - v_{k} \parallel^{2} \right)} \\ &{\qquad + \alpha_{k}[f(y_{k}) + \langle \nabla f(y_{k}), x - y_{k} \rangle + \frac{\mu}{2} \parallel x - y_{k} \parallel^{2}].} \end{array}
$$

Therefore the equation $\nabla \phi_{k + 1}(x) = 0$ , which is the first-order optimality condition for the function $\phi_{k + 1}(\cdot)$ , is as follows:

$$
(1 - \alpha_{k}) \gamma_{k}(x - v_{k}) + \alpha_{k} \nabla f(y_{k}) + \alpha_{k} \mu(x - y_{k}) = 0.
$$

From this equation, we get a closed form expression for the point $v_{k + 1}$ , the minimum of the function $\phi_{k + 1}(\cdot)$

Finally, let us compute $\phi_{k + 1}^{*}$ . In view of the recurrence (2.2.4) for the sequence $\{\phi_{k}(\cdot)\}$ , we have

$$
\begin{array}{r}{\phi_{k + 1}^{*} + \frac{\gamma_{k + 1}}{2} \parallel y_{k} - v_{k + 1} \parallel^{2} \stackrel{(2.2.5)}{=} \phi_{k + 1}(y_{k})} \\{=(1 - \alpha_{k}) \left(\phi_{k}^{*} + \frac{\gamma_{k}}{2} \parallel y_{k} - v_{k} \parallel^{2} \right) + \alpha_{k} f(y_{k}).} \end{array}\tag{2.2.6}
$$

By the recursive relation for $v_{k + 1}$ , we have

$$
\begin{array}{r}{v_{k + 1} - y_{k} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k}(v_{k} - y_{k}) - \alpha_{k} \nabla f(y_{k})].} \end{array}
$$

Therefore,

$$
\begin{array}{rl} &{\frac{\gamma_{k + 1}}{2} \parallel \boldsymbol{v}_{k + 1} - \boldsymbol{y}_{k} \parallel^{2} = \frac{1}{2 \gamma_{k + 1}}[(1 - \alpha_{k})^{2} \gamma_{k}^{2} \parallel \boldsymbol{v}_{k} - \boldsymbol{y}_{k} \parallel^{2}} \\ &{\qquad - 2 \alpha_{k}(1 - \alpha_{k}) \gamma_{k} \langle \nabla f(\boldsymbol{y}_{k}), \boldsymbol{v}_{k} - \boldsymbol{y}_{k} \rangle + \alpha_{k}^{2} \parallel \nabla f(\boldsymbol{y}_{k}) \parallel^{2}].} \end{array}
$$

It remains to substitute this relation into (2.2.6), taking into account that the multiplicative factor for the term $\parallel \y_{k} - v_{k} \parallel^{2}$ in the resulting expression is as follows:

$$
\begin{array}{c}{{(1 - \alpha_{k}){\frac{\gamma_{k}}{2}} -{\frac{1}{2 \gamma_{k + 1}}}(1 - \alpha_{k})^{2} \gamma_{k}^{2} =(1 - \alpha_{k}){\frac{\gamma_{k}}{2}} \left(1 -{\frac{(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}}} \right)}} \\{{{}}} \\{{=(1 - \alpha_{k}){\frac{\gamma_{k}}{2}} \cdot{\frac{\alpha_{k} \mu}{\gamma_{k + 1}}}.}} \end{array}
$$

□

The situation now is more transparent, and we are close to getting an algorithmic scheme. Indeed, assume that we already have $x_{k}$ :

$$
\phi_{k}^{*} \geq f(x_{k}).
$$

Then, in view of Lemma 2.2.3,

$$
\begin{array}{rl}{\phi_{k + 1}^{*} \ \geq \left(1 - \alpha_{k} \right) f(x_{k}) + \alpha_{k} f(y_{k}) - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \ \| \ \nabla f(y_{k}) \ \|^{2}} &{} \\{+ \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \langle \nabla f(y_{k}), v_{k} - y_{k} \rangle.} &{} \end{array}
$$

Since $f(x_{k}) \overset{(2.1.2)}{\geq} f(y_{k}) + \langle \nabla f(y_{k}), x_{k} - y_{k} \rangle$ , we get the following estimate:

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} \geq f(y_{k}) - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \parallel \nabla f(y_{k}) \parallel^{2}} \\ &{\qquad +(1 - \alpha_{k}) \langle \nabla f(y_{k}), \frac{\alpha_{k} \gamma_{k}}{\gamma_{k + 1}}(v_{k} - y_{k}) + x_{k} - y_{k} \rangle.} \end{array}
$$

Let us look at this inequality. We want to have $\phi_{k + 1}^{*} \geq f(x_{k + 1})$ . Recall that we can ensure the inequality

$$
\begin{array}{r}{f(y_{k}) - \frac{1}{2L} \parallel \nabla f(y_{k}) \parallel^{2} \geq f(x_{k + 1})} \end{array}
$$

in many different ways. The simplest one is just to take the gradient step

$$
x_{k + 1} = y_{k} - h_{k} \nabla f(y_{k})
$$

with $\begin{array}{r}{h_{k} \ = \ \frac{1}{L}} \end{array}$ (see (2.1.9)). Let us define $\alpha_{k}$ as a positive root of the quadratic equation

$$
L \alpha_{k}^{2} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu \quad(= \gamma_{k + 1}).
$$

Then $\begin{array}{r}{\frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} = \frac{1}{2L}} \end{array}$ , and we can replace the previous inequality by the following one:

$$
\begin{array}{r}{\phi_{k + 1}^{*} \geq f(x_{k + 1}) +(1 - \alpha_{k}) \langle \nabla f(y_{k}), \frac{\alpha_{k} \gamma_{k}}{\gamma_{k + 1}}(v_{k} - y_{k}) + x_{k} - y_{k} \rangle.} \end{array}
$$

Let us now use our freedom in the choice of $y_{k}$ . It can be found from the equation:

$$
\begin{array}{r}{\frac{\alpha_{k} \gamma_{k}}{\gamma_{k + 1}}(v_{k} - y_{k}) + x_{k} - y_{k} = 0.} \end{array}
$$

This is $\begin{array}{r}{y_{k} = \frac{\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k}}{\gamma_{k} + \alpha_{k} \mu}} \end{array}$ , and we come to the following methods, which are often addressed as Fast Gradient Methods

General Scheme of Optimal Method   
0. Choose the point $x_{0} \in \mathbb{R}^{n}$ , some $\gamma_{0} > 0;$ and set $v_{0} = x_{0}$   
1. kth iteration $(k \geq 0)$   
(a) Compute $\alpha_{k} \in(0, 1)$ from the equation   
Lα <sup>2</sup> (1 α<sub>k</sub>)γ<sub>k</sub> α<sub>k</sub>μ.   
Set $\gamma_{k + 1} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu.$   
(b) Choose $\begin{array}{r}{y_{k} \ = \ \frac{1}{\gamma_{k} + \alpha_{k} \mu} \left[\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k} \right]} \end{array}$ . Compute   
$f(y_{k})$ and $\nabla f(y_{k})$   
(c) Find $x_{k + 1}$ such that   
f (x<sub>k 1</sub>)  f (y<sub>k</sub>) <sup>1</sup> f (y<sub>k</sub>) <sup>2</sup>   
(see Sect. 1.2.3 for the step-size rules).   
(d) $\begin{array}{r}{\mathsf{Set} v_{k + 1} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} \nabla f(y_{k})].} \end{array}$

(2.2.7)

Note that in Step 1(c) of this scheme we can choose an arbitrary $x_{k + 1}$ satisfying the inequality $\begin{array}{r}{f(x_{k + 1}) \ \le \f(y_{k}) - \frac{\omega}{2} \ \parallel \ \nabla f(y_{k}) \ \parallel^{2}} \end{array}$ with some $\omega > 0$ . Then the constant $\frac{1}{\omega}$ replaces L in the equation of Step 1(a).

Theorem 2.2.1 Scheme (2.2.7) generates a sequence of points $\{x_{k}\}_{k = 0}^{\infty}$ such that

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \lambda_{k} \left[f(x_{0}) - f^{*} + \frac{\gamma_{0}}{2} \parallel x_{0} - x^{*} \parallel^{2} \right],} \end{array}
$$

where $\lambda_{0} = 1$ and $\lambda_{k} = \varPi_{i = 0}^{k - 1}(1 - \alpha_{i})$

Proof Indeed, let us choose $\begin{array}{r}{\phi_{0}(x) = f(x_{0}) + \frac{\gamma_{0}}{2} \parallel x - v_{0} \parallel^{2}} \end{array}$ . Then $f(x_{0}) = \phi_{0}^{*}$ and we get $f(x_{k}) \leq \phi_{k}^{*}$ by the rules of the scheme. It remains to use Lemma 2.2.1. □

Thus, in order to estimate the rate of convergence rate of method (2.2.7), we need to understand how quickly the sequence $\{\lambda_{k}\}$ approaches zero. Define

$$
\begin{array}{r}{q_{f} = \frac{1}{Q_{f}} = \frac{\mu}{L}.} \end{array}\tag{2.2.8}
$$

Lemma 2.2.4 If in the method (2.2.7) we choose γ $\mathbf{\xi} \in \left(\mu, 3L + \mu \right]$ , then for all $k \geq 0$ we have

$$
\begin{array}{r}{\lambda_{k} \leq \frac{4 \mu}{(\gamma_{0} - \mu) \cdot \left[\exp \left(\frac{k + 1}{2} q_{f}^{1 / 2} \right) - \exp \left(- \frac{k + 1}{2} q_{f}^{1 / 2} \right) \right]^{2}} \leq \frac{4L}{(\gamma_{0} - \mu)(k + 1)^{2}}.} \end{array}\tag{2.2.9}
$$

For $\gamma_{0} = \mu$ , we have $\lambda_{k} ={\left(1 - \sqrt{q_{f}} \right)}^{k}, k \geq 0.$

Proof Let us start from the case $\gamma_{0} > \mu$ . In accordance with Step 1(a) in (2.2.7),

$$
\gamma_{k + 1} - \mu =(1 - \alpha_{k})(\gamma_{k} - \mu) =...= \lambda_{k + 1}(\gamma_{0} - \mu).\tag{2.2.10}
$$

Since $\begin{array}{r}{\alpha_{k} = 1 - \frac{\lambda_{k + 1}}{\lambda_{k}}} \end{array}$ , from the quadratic equation of Step 1(a), we have

$$
\begin{array}{r}{1 - \frac{\lambda_{k + 1}}{\lambda_{k}} = \left[\frac{\gamma_{k + 1}}{L} \right]^{1 / 2} \stackrel{(2.2.10)}{=} \left[\frac{\mu}{L} + \lambda_{k + 1} \frac{\gamma_{0} - \mu}{L} \right]^{1 / 2}.} \end{array}
$$

Therefore, $\begin{array}{r}{\frac{1}{\lambda_{k + 1}} - \frac{1}{\lambda_{k}} = \frac{1}{\lambda_{k + 1}^{1 / 2}} \left[\frac{q_{f}}{\lambda_{k + 1}} + \frac{\gamma_{0} - \mu}{L} \right]^{1 / 2}} \end{array}$ . Thus,

$$
\begin{array}{r}{\frac{1}{\lambda_{k + 1}^{1 / 2}} \left[\frac{q_{f}}{\lambda_{k + 1}} + \frac{\gamma_{0} - \mu}{L} \right]^{1 / 2} \le \left(\frac{1}{\lambda_{k + 1}^{1 / 2}} + \frac{1}{\lambda_{k}^{1 / 2}} \right) \cdot \left(\frac{1}{\lambda_{k + 1}^{1 / 2}} - \frac{1}{\lambda_{k}^{1 / 2}} \right) \le \frac{2}{\lambda_{k + 1}^{1 / 2}} \left(\frac{1}{\lambda_{k + 1}^{1 / 2}} - \frac{1}{\lambda_{k}^{1 / 2}} \right).} \end{array}
$$

Defining $\begin{array}{r}{\xi_{k} = \left[\frac{L}{(\gamma_{0} - \mu) \lambda_{k}} \right]^{1 / 2}} \end{array}$ , we get the following relation:

$$
\begin{array}{r}{\xi_{k + 1} - \xi_{k} \ge \frac 12 \left[q_{f} \xi_{k + 1}^{2} + 1 \right]^{1 / 2}.} \end{array}\tag{2.2.11}
$$

Now, for $\begin{array}{r}{\delta = \frac{1}{2} \sqrt{q_{f}}} \end{array}$ , we are going to prove by induction that

$$
\begin{array}{r}{\xi_{k} \ge \frac{1}{4 \delta} \left[e^{(k + 1) \delta} - e^{-(k + 1) \delta} \right], \quad k \ge 0.} \end{array}\tag{2.2.12}
$$

For $k = 0$ , in view of the upper bound on $\gamma_{0}$ , we have

$$
\begin{array}{r}{\xi_{0} = \left[\frac{L}{\gamma_{0} - \mu} \right]^{1 / 2} \ge \frac{1}{3^{1 / 2}} > \frac{1}{2} \left[e^{1 / 2} - e^{- 1 / 2} \right] \ge \frac{1}{4 \delta} \left[e^{\delta} - e^{- \delta} \right]} \end{array}
$$

since the right-hand side of the above inequality is increasing in δ, and $\begin{array}{r}{\delta \le \frac{1}{2}} \end{array}$

Thus, for $k = 0,$ , inequality (2.2.12) is valid. Let us assume that it is valid for some $k \geq 0$ . Consider the function $\begin{array}{r}{\psi(t) = \frac{1}{4 \delta} \left[e^{(t + 1) \delta} - e^{-(t + 1) \delta} \right]} \end{array}$ . Its derivative

$$
\begin{array}{r}{\psi^{\prime}(t) = \frac{1}{4} \left[e^{(t + 1) \delta} + e^{-(t + 1) \delta} \right]} \end{array}
$$

is increasing in t. Thus, in view of Theorem 2.1.3 the function $\psi(\cdot)$ is convex. In view of our assumption,

$$
\begin{array}{r}{\psi(t) \leq \xi_{k} \stackrel{(2.2.11)}{\leq} \xi_{k + 1} - \frac{1}{2} \big[q_{f} \xi_{k + 1}^{2} + 1 \big]^{1 / 2} \stackrel{\mathrm{def}}{=} \gamma(\xi_{k + 1}).} \end{array}
$$

Note that $\begin{array}{r}{\gamma^{\prime}(\xi) = 1 - \frac 12 \frac{q_{f} \xi}{\left[q_{f} \xi_{k + 1}^{2} + 1 \right]^{1 / 2}} > 0.} \end{array}$ . Suppose that $\xi_{k + 1} < \psi(t + 1)$ . Then

$$
\begin{array}{rl} &{\psi(t) < \psi(t + 1) - \frac{1}{2} \left[4 \delta^{2} \cdot \left(\frac{1}{4 \delta} \left[e^{(t + 2) \delta} - e^{-(t + 2) \delta} \right] \right)^{2} + 1 \right]^{1 / 2}} \\ &{} \\ &{\quad = \psi(t + 1) - \frac{1}{4} \left[e^{(t + 2) \delta} + e^{-(t + 2) \delta} \right]} \\ &{} \\ &{\quad = \psi(t + 1) + \psi^{\prime}(t + 1)(t -(t + 1)) \quad \stackrel{(2.1.2)}{\leq} \quad \psi(t).} \end{array}
$$

Thus, we get a contradiction with our second assumption, which proves the lower bound (2.2.12).

For the case $\gamma_{0} ~ = ~ \mu$ , we have $\gamma_{k} ~ = ~ \mu$ for all $k \geq 0$ (see (2.2.10)). By the quadratic equation of Step 1(a) in method (2.2.7), this means that $\alpha_{k} = \sqrt{q_{f}}, k \ge 0$ □

Let us present an exact statement on the optimality of (2.2.7).

Theorem 2.2.2 Let us take in $\left(2.2.7 \right) \gamma_{0} = 3L + \mu$ . Then this scheme generates a sequence $\{x_{k}\}_{k = 0}^{\infty}$ such that

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{2(4 + q_{f}) \mu \| x_{0} - x^{*} \|^{2}}{3 \left[\exp \left(\frac{k + 1}{2} q_{f}^{1 / 2} \right) - \exp \left(- \frac{k + 1}{2} q_{f}^{1 / 2} \right) \right]^{2}} \leq \frac{2(4 + q_{f}) L \| x_{0} - x^{*} \|^{2}}{3(k + 1)^{2}}.} \end{array}\tag{2.2.13}
$$

This means that method (2.2.7) is optimal for solving the unconstrained minimization problem (2.2.1) with $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ and $\mu \geq 0,$ , when the accuracy $\epsilon > 0$ is small enough:

$$
\begin{array}{r}{\epsilon \leq \frac{\mu}{2} \| x_{0} - x^{*} \|^{2}.} \end{array}\tag{2.2.14}
$$

$If \mu = 0$ , then this method is optimal for

$$
\begin{array}{r}{\epsilon \leq \frac{3L}{32} \| x_{0} - x^{*} \|^{2}.} \end{array}\tag{2.2.15}
$$

Proof Indeed, since $f(x_{0}) -{f^{*}} \overset{(2.1.9)}{\leq} \frac{L}{2} \parallel x_{0} - x^{*} \parallel^{2}$ , by Theorem 2.2.1 we have

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{\lambda_{k}}{2}(L + \gamma_{0}) \| x_{0} - x^{*} \|^{2}.} \end{array}
$$

Therefore, by Lemma 2.2.4, we obtain the following bounds:

$$
\begin{array}{r}{f(x_{k}) - f^{*} \leq \frac{2 \mu(L + \gamma_{0}) \| x_{0} - x^{*} \|^{2}}{(\gamma_{0} - \mu) \cdot \left[\exp \left(\frac{k + 1}{2} q_{f}^{1 / 2} \right) - \exp \left(- \frac{k + 1}{2} q_{f}^{1 / 2} \right) \right]^{2}} \leq \frac{2L(L + \gamma_{0}) \| x_{0} - x^{*} \|^{2}}{(\gamma_{0} - \mu)(k + 1)^{2}}.} \end{array}
$$

The upper bounds in the above relations are decreasing in $\gamma_{0}$ . Hence, choosing it as the maximal allowed value, we get inequality (2.2.13).

Let $\mu > 0$ . From the lower complexity bounds for the class (see Theorem 2.1.13), we have

$$
\begin{array}{r}{f(x_{k}) - f^{*} \geq \frac{\mu}{2} \left(\frac{\sqrt{Q_{f}} - 1}{\sqrt{Q_{f}} + 1} \right)^{2k} \mathbb{R}^{2} \geq \frac{\mu}{2} \exp \left(- \frac{4k}{\sqrt{Q_{f}} - 1} \right) \mathbb{R}^{2},} \end{array}
$$

where $R \ = \parallel \x_{0} - x^{*} \parallel$ . Therefore, the worst case lower bound for finding $x_{k}$ satisfying $f(x_{k}) - f^{*} \leq \epsilon$ cannot be better than

$$
\begin{array}{r}{k \geq \frac{\sqrt{Q_{f}} - 1}{4} \ln \frac{\mu \mathbb{R}^{2}}{2 \epsilon}} \end{array}\tag{2.2.16}
$$

calls of the oracle (in view of assumption (2.2.14), the right-hand side of this inequality is positive). For our scheme, we have

$$
\begin{array}{r}{f(x_{k}) - f^{*} \stackrel{(2.2.13)}{\leq} \frac{10 \mu \mathbb{R}^{2}}{3} \left[e^{(k + 1) q_{f}^{1 / 2}} - 1 \right]^{- 1}.} \end{array}
$$

Therefore, we guarantee that for $\begin{array}{r}{k \textgreater \sqrt{Q_{f}} \ln \left(1 + \frac{10 \mu \mathbb{R}^{2}}{3 \epsilon} \right)} \end{array}$ our problem will be solved. Since

$$
\begin{array}{r}{\ln \left(1 + \frac{10 \mu \mathbb{R}^{2}}{3 \epsilon} \right) \overset{(2.2.14)}{\leq} \ln \left(\frac{\mu \mathbb{R}^{2}}{2 \epsilon} + \frac{10 \mu \mathbb{R}^{2}}{3 \epsilon} \right) = \ln \frac{\mu \mathbb{R}^{2}}{2 \epsilon} + \ln \frac{23}{3},} \end{array}
$$

the upper bound for the number of iterations (= calls of the oracle) in method (2.2.7) is as follows:

$$
\begin{array}{r}{\sqrt{Q_{f}} \cdot \left(\ln \frac{\mu \mathbb{R}^{2}}{2 \epsilon} + \ln \frac{23}{3} \right).} \end{array}\tag{2.2.17}
$$

Clearly, this bound is proportional to the lower bound (2.2.16). Therefore, the method (2.2.7) is optimal.

The same reasoning can be used for the class $\mathcal{S}_{0, L}^{1, 1}(\mathbb{R}^{n})$ . As above, we need to impose the upper bound (2.2.15) for accuracy in order to have a positive lower bound for the number of calls of the oracle (see Theorem 2.1.7).

Remark 2.2.1 Note that the scheme and the complexity analysis of method (2.2.7) is continuous in the convexity parameter $\mu$ . Therefore, its version for convex functions

with Lipschitz continuous gradient has the following rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f^{*} \overset{(2.2.13)}{\leq} \frac{8L \| x_{0} - x^{*} \|^{2}}{3(k + 1)^{2}}.} \end{array}\tag{2.2.18}
$$

Let us analyze a variant of scheme (2.2.7), which uses a constant gradient step for finding the point $x_{k + 1}$

## Constant Step Scheme I

0. Choose the point $x_{0} \in \mathbb{R}^{n}$ , some $\gamma_{0} > 0;$ , and set $v_{0} = x_{0},$

1. kth iteration $(k \geq 0).$

(a) Compute $\alpha_{k} \in(0, 1)$ from the equation

$$
L \alpha_{k}^{2} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu.\tag{2.2.19}
$$

Set $\gamma_{k + 1} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu.$ (b) Choose $\begin{array}{rl} &{y_{k} \ = \ \frac{1}{\gamma_{k} + \alpha_{k} \mu} \left[\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k} \right]} \\ &{\mathrm{nd} \ \nabla f(y_{k}).} \end{array}$ . Compute $f(y_{k})$ a

(c) Set $\begin{array}{r}{x_{k + 1} = y_{k} - \frac{1}{L} \nabla f(y_{k})} \end{array}$ and

$$
\begin{array}{r}{v_{k + 1} = \frac{1}{\gamma_{k + 1}} \left[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} \nabla f(y_{k}) \right].} \end{array}
$$

Let us show that this scheme can be rewritten in a simpler form. Note that

$$
\begin{array}{r}{y_{k} = \frac{1}{\gamma_{k} + \alpha_{k} \mu}(\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k}),} \end{array}
$$

$$
\begin{array}{r}{x_{k + 1} = y_{k} - \frac{1}{L} \nabla f(y_{k}),} \end{array}
$$

$$
\begin{array}{r}{v_{k + 1} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} \nabla f(y_{k})].} \end{array}
$$

Therefore,

$$
\begin{array}{rl} &{v_{k + 1} = \frac{1}{\gamma_{k + 1}} \left\{\frac{(1 - \alpha_{k})}{\alpha_{k}}[(\gamma_{k} + \alpha_{k} \mu) y_{k} - \gamma_{k + 1} x_{k}] + \alpha_{k} \mu y_{k} - \alpha_{k} \nabla f(y_{k}) \right\}} \\ &{\quad = \frac{1}{\gamma_{k + 1}} \left\{\frac{(1 - \alpha_{k}) \gamma_{k}}{\alpha_{k}} y_{k} + \mu y_{k} \right\} - \frac{1 - \alpha_{k}}{\alpha_{k}} x_{k} - \frac{\alpha_{k}}{\gamma_{k + 1}} \nabla f(y_{k})} \\ &{\quad = x_{k} + \frac{1}{\alpha_{k}}(y_{k} - x_{k}) - \frac{1}{\alpha_{k} L} \nabla f(y_{k}) \ = \x_{k} + \frac{1}{\alpha_{k}}(x_{k + 1} - x_{k}).} \end{array}
$$

## 2.2 Optimal Methods

Hence,

$$
\begin{array}{rl} &{y_{k + 1} = \frac{1}{\gamma_{k + 1} + \alpha_{k + 1} \mu}(\alpha_{k + 1} \gamma_{k + 1} v_{k + 1} + \gamma_{k + 2} x_{k + 1})} \\ &{\qquad = x_{k + 1} + \frac{\alpha_{k + 1} \gamma_{k + 1}(v_{k + 1} - x_{k + 1})}{\gamma_{k + 1} + \alpha_{k + 1} \mu} = x_{k + 1} + \beta_{k}(x_{k + 1} - x_{k}),} \end{array}
$$

where $\begin{array}{r}{\beta_{k} = \frac{\alpha_{k + 1} \gamma_{k + 1}(1 - \alpha_{k})}{\alpha_{k}(\gamma_{k + 1} + \alpha_{k + 1} \mu)}} \end{array}$ . Thus, we managed to eliminate the sequence $\{v_{k}\}$ . Let us do the same with the coefficients $\{\gamma_{k}\}$ . We have

$$
\alpha_{k}^{2} L =(1 - \alpha_{k}) \gamma_{k} + \mu \alpha_{k} \equiv \gamma_{k + 1}.
$$

Therefore

$$
\begin{array}{rcl}{\beta_{k} = \frac{\alpha_{k + 1} \gamma_{k + 1}(1 - \alpha_{k})}{\alpha_{k}(\gamma_{k + 1} + \alpha_{k + 1} \mu)} = \frac{\alpha_{k + 1} \gamma_{k + 1}(1 - \alpha_{k})}{\alpha_{k}(\gamma_{k + 1} + \alpha_{k + 1}^{2} L -(1 - \alpha_{k + 1}) \gamma_{k + 1})}} \\{} &{} & \\{= \frac{\gamma_{k + 1}(1 - \alpha_{k})}{\alpha_{k}(\gamma_{k + 1} + \alpha_{k + 1} L)} = \frac{\alpha_{k}(1 - \alpha_{k})}{\alpha_{k}^{2} + \alpha_{k + 1}}.} \end{array}
$$

Note also that $\alpha_{k + 1}^{2} =(1 - \alpha_{k + 1}) \alpha_{k}^{2} + q_{f} \alpha_{k + 1}$ , and

$$
\alpha_{0}^{2} L =(1 - \alpha_{0}) \gamma_{0} + \mu \alpha_{0}.
$$

The latter relation means that $\gamma_{0}$ can be seen as a function of $\alpha_{0}$ . Thus, we can completely eliminate the sequence $\{\gamma_{k}\}$ . Let us write down the corresponding method.

## Constant Step Scheme II

0. Choose the point $x_{0} \in \mathbb{R}^{n}$ , some $\alpha_{0} \in(0, 1)$ , and set $y_{0} =$ $x_{0}.$

1. kth iteration $(k \geq 0)$

(a) Compute $f(y_{k})$ and $\nabla f(y_{k})$ . Set $\begin{array}{r}{x_{k + 1} = y_{k} - \frac{1}{L} \nabla f(y_{k}).} \end{array}$

(2.2.20)

(b) Compute $\alpha_{k + 1} \in(0, 1)$ from the equation

$$
\alpha_{k + 1}^{2} =(1 - \alpha_{k + 1}) \alpha_{k}^{2} + q_{f} \alpha_{k + 1}.
$$

$$
\begin{array}{r}{\operatorname{Set} \beta_{k} = \frac{\alpha_{k}(1 - \alpha_{k})}{\alpha_{k}^{2} + \alpha_{k + 1}} \mathrm{~ and ~} y_{k + 1} = x_{k + 1} + \beta_{k}(x_{k + 1} - x_{k}).} \end{array}
$$

The rate of convergence of this method can be derived from Theorem 2.2.1 and Lemma 2.2.4. Let us write down the corresponding statement in terms of $\alpha_{0}$

Theorem 2.2.3 If in the method (2.2.20) we choose $\alpha_{0}$ in accordance with the conditions

$$
\begin{array}{r}{\sqrt{q_{f}} \le \alpha_{0} \ \le \ \frac{2(3 + q_{f})}{3 + \sqrt{21 + 4q_{f}}},} \end{array}\tag{2.2.21}
$$

then

$$
\begin{array}{rl} &{f(x_{k}) - f^{*} \leq \frac{4 \mu \left[f(x_{0}) - f^{*} + \frac{\gamma_{0}}{2} \| x_{0} - x^{*} \|^{2} \right]}{(\gamma_{0} - \mu) \cdot \left[\exp \left(\frac{k + 1}{2} q_{f}^{1 / 2} \right) - \exp \left(- \frac{k + 1}{2} q_{f}^{1 / 2} \right) \right]^{2}}} \\ &{\qquad \leq \frac{4L}{(\gamma_{0} - \mu)(k + 1)^{2}} \left[f(x_{0}) - f^{*} + \frac{\gamma_{0}}{2} \parallel x_{0} - x^{*} \parallel^{2} \right],} \end{array}
$$

where $\begin{array}{r}{\gamma_{0} = \frac{\alpha_{0}(\alpha_{0} L - \mu)}{1 - \alpha_{0}}} \end{array}$

We do not need to prove this theorem since the initial scheme has not changed. We change only the notation. In Theorem 2.2.3, condition (2.2.21) is equivalent to the condition $\mu \leq \gamma_{0} \leq 3L + \mu$ of Lemma 2.2.4.

Scheme (2.2.20) becomes very simple if we choose $\alpha_{0} = \sqrt{q_{f}}$ (this corresponds to $\gamma_{0} = \mu)$ . Then

$$
\begin{array}{r}{\alpha_{k} = \sqrt{q_{f}}, \quad \beta_{k} = \frac{1 - \sqrt{q_{f}}}{1 + \sqrt{q_{f}}}} \end{array}
$$

for all $k \geq 0$ . Thus, we come to the following process.

## Constant Step scheme III

0. Choose $y_{0} = x_{0} \in \mathbb{R}^{n}$

1. kth iteration $(k \geq 0)$

$$
\begin{array}{r}{x_{k + 1} = y_{k} - \frac{1}{L} \nabla f(y_{k}),} \end{array}\tag{2.2.22}
$$

$$
\begin{array}{r}{y_{k + 1} = x_{k + 1} + \frac{1 - \sqrt{q_{f}}}{1 + \sqrt{q_{f}}}(x_{k + 1} - x_{k}).} \end{array}
$$

In accordance with Theorem 2.2.1 and Lemma 2.2.4, it has the following rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f^{*} \stackrel{(2.1.9)}{\leq} \frac{L + \mu}{2} \| x_{0} - x^{*} \|^{2} e^{- k \sqrt{q_{f}}}, \quad k \geq 0.} \end{array}\tag{2.2.23}
$$

However, this method does not work for $\mu = 0$ . The choice of a bigger value of the parameter $\gamma_{0}$ (which corresponds to another value of $\alpha_{0})$ is much safer.

Finally, let us prove the following statement.

Theorem 2.2.4 Let method (2.2.7) be applied to the function $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ (this means that $\mu = 0)$ . Then for any $k \geq 0$ we have

$$
\begin{array}{r}{\| v_{k} - x^{*} \| \leq \left[1 + \frac{1}{\gamma_{0}} L \right]^{1 / 2} r_{0},} \end{array}\tag{2.2.24}
$$

$$
\begin{array}{r}{\| x_{k} - x^{*} \| \leq \left[1 + \frac{1}{\gamma_{0}} L \right]^{1 / 2} r_{0},} \end{array}\tag{2.2.25}
$$

where $r_{0} \stackrel{\mathrm{def}}{=} \| x^{*} - x_{0} \|$ . Moreover, for the vector $\begin{array}{r}{g_{k} = \frac{\lambda_{k}}{1 - \lambda_{k}} \displaystyle \sum_{i = 0}^{k - 1} \frac{\alpha_{i}}{\lambda_{i + 1}} \nabla f(y_{k})} \end{array}$ , whose coefficients satisfy the equation $\begin{array}{r}{\sum_{i = 0}^{k - 1} \frac{\alpha_{i}}{\lambda_{i + 1}} = \frac{1 - \lambda_{k}}{\lambda_{k}}, k \ge 1} \end{array}$ , we have

$$
\begin{array}{r}{\| g_{k} \| \le \frac{\lambda_{k} \gamma_{0}}{1 - \lambda_{k}} \left(1 + \left[1 + \frac{1}{\gamma_{0}} L \right]^{1 / 2} \right) r_{0}.} \end{array}\tag{2.2.26}
$$

Choosing $\gamma_{0} = 3L$ , we get the following rate:

$$
\begin{array}{r}{\| g_{k} \| \overset{(2.2.9)}{\leq} \frac{4(3 + 2 \sqrt{3}) Lr_{0}}{3(k + 1)^{2} - 4}, \quad k \geq 1.} \end{array}\tag{2.2.27}
$$

Proof As we have seen, method (2.2.7) recursively updates a sequence of estimating functions, which can be represented as follows:

$$
\begin{array}{r}{\phi_{k}(x) = \ell_{k}(x) + \lambda_{k}(f(x_{0}) + \frac 12 \gamma_{0} \| x - x_{0} \|^{2}), \quad k \ge 0,} \end{array}
$$

where $\ell_{k}(\cdot)$ are linear functions updated by the rules $\ell_{0}(x) \equiv 0$

$$
\ell_{k + 1}(x) =(1 - \alpha_{k}) \ell_{k}(x) + \alpha_{k}[f(y_{k}) + \langle \nabla f(y_{k}), x - y_{k} \rangle], \quad k \geq 0.\tag{2.2.28}
$$

Let $\nabla \ell_{k} \equiv \nabla \ell_{k}(x), x \in \mathbb{R}^{n}$

Note that function $\phi_{k}$ is strongly convex with convexity parameter $\lambda_{k} \gamma_{0}$ . Therefore, for all $x \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rcl}{f(x_{k}) + \frac{1}{2} \lambda_{k} \gamma_{0} \| x - v_{k} \|^{2}} &{\leq} &{\phi_{k}^{*} + \frac{1}{2} \lambda_{k} \gamma_{0} \| x - v_{k} \|^{2} \overset{(2.1.21)}{\leq} \phi_{k}(x)} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(2.2.2)}{\leq} f(x) + \lambda_{k}(f(x_{0}) + \frac{1}{2} \gamma_{0} \| x - x_{0} \|^{2} - f(x)).} \end{array}
$$

Taking in this inequality $x = x^{*}$ , we get

$$
\begin{array}{r}{\frac 12 \lambda_{k} \gamma_{0} \| x^{*} - v_{k} \|^{2} \leq \lambda_{k}(f(x_{0}) - f(x^{*}) + \frac 12 \gamma_{0} \| x^{*} - x_{0} \|^{2}) \overset{(2.1.9)}{\leq} \frac 12 \lambda_{k}(L + \gamma_{0}) r_{0}^{2},} \end{array}
$$

and this is the bound (2.2.24).

Let us prove by induction that the bound (2.2.25) holds for all $k \geq 0$ . Since $x_{0} = v_{0}$ , it holds for $k = 0$ . Assume it holds for some $k \geq 0$ . Then, in view of Step (b) in (2.2.19), we have $\| y_{k} - x^{*} \| \le[1 + \textstyle \frac 1{\nu_{0}} L]^{1 / 2} r_{0}$ . It remains to note that the gradient step decreases the distance to the optimal point (see, for example, the proof of Theorem 2.1.14).

Let us look now at the evolution of the vectors $\begin{array}{r}{s_{k} \ \stackrel{\mathrm{def}}{=} \ \frac{1}{\lambda_{k}} \nabla \ell_{k}} \end{array}$ . Note that $s_{0} = 0$ and

$$
\begin{array}{rl}{\nabla \ell_{k + 1} \stackrel{\scriptscriptstyle(2.2.28)}{=}(1 - \alpha_{k}) \nabla \ell_{k} + \alpha_{k} \nabla f(y_{k})} &{{}} \\{=} &{{} \frac{\lambda_{k + 1}}{\lambda_{k}} \nabla \ell_{k} + \alpha_{k} \nabla f(y_{k}), \quad k \ge 0.} \end{array}
$$

Thus, $s_{k} = \sum_{i = 0}^{k - 1} \frac{\alpha_{i}}{\lambda_{i + 1}} \nabla f(y_{i}), k \geq 0$ . On the other hand, for $\begin{array}{r}{\tau_{i} = \frac{\alpha_{i}}{\lambda_{i + 1}}} \end{array}$ we have

$$
\begin{array}{r}{\tau_{i} \stackrel{(2.2.4)}{=} \frac{\alpha_{i}}{(1 - \alpha_{i}) \lambda_{i}} = \frac{1}{\lambda_{i + 1}} - \frac{1}{\lambda_{i}}.} \end{array}
$$

Thus, $\sum_{i = 0}^{k - 1} \tau_{i} = \frac{1}{\lambda_{k}} - 1$ , and $\begin{array}{r}{g_{k} = \frac{\lambda_{k} s_{k}}{1 - \lambda_{k}} \equiv \frac{1}{1 - \lambda_{k}} \nabla \ell_{k}(x), x \in \mathbb{R}^{n}} \end{array}$ . Note that

$$
\begin{array}{r}{v_{k} = x_{0} - \frac{1}{\lambda_{k} \gamma_{0}} \nabla \ell_{k} \ : = \ : x_{0} - \frac{1 - \lambda_{k}}{\lambda_{k} \gamma_{0}} g_{k}.} \end{array}
$$

Hence,

$$
\begin{array}{r}{\left[1 + \frac{1}{\gamma_{0}} L \right]^{1 / 2} r_{0} \overset{(2.2.24)}{\geq} \| x_{0} - \frac{1 - \lambda_{k}}{\lambda_{k} \gamma_{0}} g_{k} - x^{*} \| \ \geq \ \frac{1 - \lambda_{k}}{\lambda_{k} \gamma_{0}} \| g_{k} \| - r_{0},} \end{array}
$$

and we get inequality (2.2.26).

Theorem 2.2.4 can be used to generate points with small gradient of the quadratic function $\begin{array}{r}{f(x) = \frac{1}{2} \langle Ax, x \rangle - \langle b, x \rangle} \end{array}$ with $A \succeq 0$ . For that, we just compute the point

$$
\begin{array}{r}{\hat{y}_{k} = \frac{\lambda_{k}}{1 - \lambda_{k}} \displaystyle \sum_{i = 0}^{k - 1} \frac{\alpha_{i}}{\lambda_{i + 1}} y_{i}, \quad k \ge 1.} \end{array}\tag{2.2.29}
$$

Another example of employing the rule (2.2.29) is given in Sect. 2.2.3.

## 2.2.2 Decreasing the Norm of the Gradient

Sometimes, in solving the optimization problem (2.2.1) with $f \in \mathcal{F}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ , we are interested in finding a point with small norm of the gradient:

$$
\| \nabla f(x) \| \leq \epsilon.\tag{2.2.30}
$$

(We will give an important example of this situation in Example 2.2.4 in Sect. 2.2.3.) What are the lower and upper complexity bounds for this goal? Since

$$
\begin{array}{r}{f({x}) -{f^{*}} \overset{(2.1.2)}{\leq} \| \nabla f({x}) \| \cdot \|{x} -{x^{*}} \|,} \end{array}
$$

the corresponding lower complexity bounds must be of the same order as for finding a point with small residual in function value: $f(x) - f^{*} \leq \epsilon$ . Let us see which methods can be used to find points with small gradients.

First of all, let us look at the abilities of Gradient Method (2.1.37) with $\begin{array}{r}{h_{k} = \frac{1}{L}} \end{array}$ Denote $R_{0} = \| x_{0} - x^{*} \|$ . Let us fix the total number of iterations $T \geq 3$ . After the first k iterations, $0 \leq k < T$ , we have

$$
f(x_{k}) - f^{*} \begin{array}{r}{(2.1.39)} \\{\leq} \end{array} \frac{2LR_{0}^{2}}{k + 4}.
$$

If $\begin{array}{rlrl}{i} &{{} \ge} &{k} &{{}} \end{array}$ , then $\begin{array}{rlr}{f(x_{i}) \ - \f(x_{i + 1})} &{{} \stackrel{(2.1.9)}{\geq}} &{\frac{1}{2L} \| \nabla f(x_{i})) \|^{2}} \end{array}$ . Define $\begin{array}{rl}{g_{k, T}} &{{} =} \end{array}$ $\operatorname{min}_{k \leq i \leq T} \| \nabla f(x_{i}) \|$ . Then

$$
\begin{array}{l}{(T - k + 1) g_{k, T}^{2} \le \displaystyle \sum_{i = k}^{T} \| \nabla f(x_{i}) \|^{2} \le 2L \displaystyle \sum_{i = k}^{T}(f(x_{i}) - f(x_{i + 1}))} \\{\qquad = 2L(f(x_{k}) - f(x_{T + 1})) \le 2L(f(x_{k}) - f^{*}) \le \frac{4L^{2} R_{0}^{2}}{k + 4}.} \end{array}
$$

Thus, $\begin{array}{r}{g_{0, T}^{2} \le \frac{4L^{2} R_{0}^{2}}{(k + 4)(T - k + 1)}} \end{array}$ . We can choose k by maximizing the quadratic function $q(k) =(k + 4)(T - k + 1)$ for integer k. Note that

$$
q^{*} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{k \in \mathbb{Z}} q(k) \geq q(\tau^{*} +{\frac{1}{2}}), \quad \tau^{*} = \arg \operatorname{max}_{\tau \in \mathbb{R}} q(\tau).
$$

Since $\begin{array}{r}{\tau^{*} = \frac{T - 3}{2}} \end{array}$ , we get $\begin{array}{r}{q^{*} \geq q(\frac{T - 2}{2}) = \frac{1}{4}(T + 4)(T + 6)} \end{array}$

Thus, we have proved the following theorem.

Theorem 2.2.5 Let $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ and choose in method (2.1.37) $\begin{array}{r}{h_{k} = \frac{1}{L}} \end{array}$ . Then for the total number of steps in this method $T \geq 3$ we have

$$
\begin{array}{r}{g_{0, T} \le \frac{4LR_{0}}{[(T + 4)(T + 6)]^{1 / 2}}.} \end{array}\tag{2.2.31}
$$

Thus, the Gradient Method ensures the goal (2.2.30) in $O(\textstyle{\frac{1}{\epsilon}})$ iterations. Let us see what happens with a monotone version of the Optimal Method (2.2.19) in the case $\mu = 0$

Monotone Constant Step Scheme $\mathbf{I_{A}}$   
0. Choose the point $x_{0} \in \mathbb{R}^{n}$ . Set $\lambda_{0} = 1$ and $v_{0} = x_{0}$   
1. kth iteration $(k \geq 0).$   
(a) Compute $\alpha_{k} \in(0, 1)$ from equation $\alpha_{k}^{2} = 3(1 - \alpha_{k}) \lambda_{k}$   
(b) Set $y_{k} = \alpha_{k} v_{k} +(1 - \alpha_{k}) x_{k}$ and $\lambda_{k + 1} =(1 - \alpha_{k}) \lambda_{k}$   
(c) Compute $\nabla f(y_{k})$ and set $\begin{array}{r}{\hat{x}_{k + 1} = y_{k} - \frac{1}{L} \nabla f(y_{k}).} \end{array}$   
(d) Define $\begin{array}{r}{\boldsymbol{v}_{k + 1} = \boldsymbol{v}_{k} - \frac{1}{L \alpha_{k}} \nabla \boldsymbol{f}(y_{k}).} \end{array}$   
(e) Set ${\hat{y}}_{k} = \arg$ min $\big \{f(y) : \y \in \{x_{k}, \hat{x}_{k + 1}\} \big\}.$   
(f) Compute $\nabla f(\hat{y}_{k})$ and set $\begin{array}{r}{x_{k + 1} = \hat{y}_{k} - \frac{1}{L} \nabla f(\hat{y}_{k}).} \end{array}$

(2.2.32)

This scheme corresponds to the method (2.2.7) with $\gamma_{0} = 3L$ and $\mu = 0$ . Hence, $\gamma_{k} \equiv 3L \lambda_{k}$ . Note that it ensures a monotone decrease of the objective function:

$$
\begin{array}{r}{f(x_{k}) \overset{(2.2.32)_{e}}{\geq} f(\widehat{y}_{k}) \overset{(2.2.32)_{f}}{\geq} f(x_{k + 1}) + \frac{1}{2L} \| \nabla f(\widehat{y}_{k}) \|^{2}.} \end{array}\tag{2.2.33}
$$

As before, we divide the total number of iterations $T \geq 3$ into two parts. After the first k iterations, $0 \leq k < T$ , we have

$$
f(x_{k}) - f^{*} \overset{(2.2.18)}{\leq} \frac{8LR_{0}^{2}}{3(k + 1)^{2}}.
$$

If $\begin{array}{rlr}{i} &{{} \ge} &{k.} \end{array}$ , then $\begin{array}{rlr}{f(x_{i}) ~ - ~ f(x_{i + 1})} &{{} \stackrel{(2.2.33)}{\geq}} &{\frac{1}{2L} \| \nabla f(\hat{y}_{i})) \|^{2}} \end{array}$ . Define $\begin{array}{rl}{g_{k, T}} &{{} =} \end{array}$ $\operatorname{min}_{k \le i \le T} \| \nabla f(\hat{y}_{i}) \|$ . Then

$$
\begin{array}{l}{(T - k + 1) g_{k, T}^{2} \le \displaystyle \sum_{i = k}^{T} \| \nabla f(\hat{y}_{i}) \|^{2} \le 2L \displaystyle \sum_{i = k}^{T}(f(x_{i}) - f(x_{i + 1}))} \\{\qquad = 2L(f(x_{k}) - f(x_{T + 1})) \le 2L(f(x_{k}) - f^{*}) \le \frac{16L^{2} R_{0}^{2}}{3(k + 1)^{2}}.} \end{array}
$$

Thus, $\begin{array}{r}{g_{0, T}^{2} \le \frac{16L^{2} R_{0}^{2}}{3(k + 1)^{2}(T - k + 1)}} \end{array}$ . We can choose k by maximizing the cubic function $q(k) =(k + 1)^{2}(T - k + 1)$ for integer k. Note that $k^{*}$ , the optimal solution of the problem $q^{*} \stackrel{\mathrm{def}}{=} \operatorname{max}_{k \in \mathbb{Z}} q(k)$ , belongs to the interval $[\tau^{*} - \textstyle{\frac{1}{2}}, \tau^{*} + \textstyle{\frac{1}{2}}]$ , where $\tau^{*} = \arg \operatorname{max}_{\tau \in \mathbb{R}_{+}} q(\tau)$ . Moreover, since the function $q(\cdot)$ is concave in this interval, we have

$$
\begin{array}{l}{{q^{*} \geq \operatorname{min} \{q(\tau^{*} - \frac{1}{2}), q(\tau^{*} + \frac{1}{2})\}}} \\{{\}} \\{{\} = \underset{\delta = \pm \frac{1}{2}}{\operatorname{min}} \left.q(\tau^{*}) + \frac{1}{2} q^{\prime \prime}(\tau^{*})(\frac{1}{2})^{2} + \frac{1}{6} q^{\prime \prime \prime}(\tau^{*}) \delta^{3} \right.} \\{{\}} \\{{\} = q(\tau^{*}) + \frac{1}{8} q^{\prime \prime}(\tau^{*}) - \frac{1}{8}.} \end{array}
$$

Note that $q^{\prime}(\tau) =(\tau + 1)(2T + 1 - 3 \tau)$ and $q^{\prime \prime}(\tau) = 2T - 2 - 6k$ . Therefore, $\begin{array}{r}{\tau^{*} ={\frac{2T + \bar{1}}{3}}, q^{\prime \prime}(\tau^{*}) = - 2T - 4.} \end{array}$ , and $\begin{array}{r}{q(\tau^{*}) = \frac{4}{27}(T + 2)^{3}} \end{array}$ . Hence, 3

$$
\begin{array}{r}{q^{*} \geq \frac{4}{27}(T + 2)^{3} - \frac{1}{4}(T + 2) - \frac{1}{8}.} \end{array}
$$

Thus, we have proved the following theorem.

Theorem 2.2.6 If $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ , then method (2.2.32) ensures the following rate of decrease for the norm of the gradient:

$$
\begin{array}{r}{g_{0, T} \leq \frac{4LR_{0}}{[\frac 43(T + 2)^{3} - \frac 94(T + 2) - \frac 98]^{1 / 2}}, \quad T \geq 1.} \end{array}\tag{2.2.34}
$$

Thus, the Optimal Method (2.2.32) ensures the goal (2.2.30) in $\begin{array}{r}{O(\frac{1}{\epsilon^{2 / 3}})} \end{array}$ iterations. Let us show that we can be even faster if we apply a regularization technique.

Let us fix a regularization parameter $\delta > 0$ and consider the following function:

$$
\begin{array}{r}{f_{\delta}(x) = f(x) + \frac{1}{2} \delta \| x - x_{0} \|^{2}.} \end{array}
$$

In view of conditions (2.1.12) and (2.1.22), $f_{\delta} \in \mathcal{S}_{\delta, L + \delta}^{1, 1}(\mathbb{R}^{n})$ . Denote by $x_{\delta}^{*}$ its unique optimal point, which satisfies the equation

$$
\nabla f(x_{\delta}^{*}) + \delta(x_{\delta}^{*} - x_{0}) = 0.\tag{2.2.35}
$$

Note that

$$
\begin{array}{r}{f_{\delta}(x_{\delta}^{*}) + \frac 12 \delta \| x_{\delta}^{*} - x^{*} \|^{2} \overset{(2.1.21)}{\leq} f_{\delta}(x^{*}) \ = \f(x^{*}) + \frac 12 \delta \| x^{*} - x^{0} \|^{2}.} \end{array}
$$

Since $f(x^{*}) \leq f(x_{\delta}^{*})$ , we conclude that

$$
\| x_{\delta}^{*} - x_{0} \|^{2} + \| x_{\delta}^{*} - x^{*} \|^{2} \leq \| x_{0} - x^{*} \|^{2}.\tag{2.2.36}
$$

Thus, by choosing an appropriate $\delta,$ , we can make the gradient $\nabla f(x_{\delta}^{*})$ small:

$$
\| \nabla f(x_{\delta}^{*}) \| \overset{(2.2.35)}{=} \delta \| x_{\delta}^{*} - x_{0} \| \overset{(2.2.36)}{=} \delta R_{0}.
$$

Therefore, it is possible to find a point with small norm of the gradient by minimizing the function $f_{\delta}$ . Let us estimate the complexity of this process.

Let us use for our goal the scheme (2.2.22) with parameters $L + \delta$ and $\begin{array}{r}{q_{f} = \frac{\delta}{\delta + L}} \end{array}$ Then after T iterations of this method, we have

$$
\begin{array}{rlr}{\| \nabla f(x_{T}) \|} &{\leq} &{\| \nabla f(x_{\delta}^{*}) \| + \| \nabla f(x_{T}) - \nabla f(x_{\delta}^{*}) \| \overset{(1.28)}{\leq} \delta R_{0} + L \| x_{T} - x_{\delta}^{*} \|} \\ &{} & \\{\overset{(2.1.21)}{\leq} \delta R_{0} + L \left[\frac{2}{\delta}(f_{\delta}(x_{T}) - f_{\delta}(x_{\delta}^{*})) \right]^{1 / 2}} \\ &{} & \\ &{} &{(2.2.23)} \\ &{\leq} &{\delta R_{0} + L \left[\frac{L + 2 \delta}{\delta} R_{0}^{2} e^{- T \sqrt{q_{f}}} \right]^{1 / 2}.} \end{array}
$$

Thus, choosing δ from condition $\delta R_{0} ={\textstyle \frac{1}{2}} \epsilon$ , we get $\begin{array}{r}{\frac{1}{q_{f}} = 1 + \frac{2LR_{0}}{\epsilon}} \end{array}$ . Therefore, the number of steps $T$ in our scheme is bounded by the solution of the following inequality:

$$
\begin{array}{r}{LR_{0} \left[\frac{L + 2 \delta}{\delta} \right]^{1 / 2} \leq \frac{\epsilon}{2} e^{T \sqrt{q_{f}} / 2}.} \end{array}
$$

This is $\begin{array}{r}{T \ge \frac{2}{\sqrt{q_{f}}} \ln \left(\left(\frac{1}{q_{f}} - 1 \right) \left(1 + \frac{1}{q_{f}} \right)^{1 / 2} \right)} \end{array}$ . Thus, we have proved the following theorem

Theorem 2.2.7 Let $f \in \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ and $\delta \ = \ \frac{\epsilon}{2R_{0}}$ . Then the number of steps T which is necessary for method (2.2.22) to generate a point $x_{T}$ with $\| \nabla f(x_{T}) \| \le \epsilon$ $by$ minimizing the function $f_{\delta}$ is bounded as follows:

$$
\begin{array}{r}{T \le 3 \sqrt{1 + \frac{2LR_{0}}{\epsilon}} \ln \left(1 + \frac{2LR_{0}}{\epsilon} \right).} \end{array}\tag{2.2.37}
$$

Thus, up to a logarithmic factor, the complexity estimate of the regularization scheme is optimal. To the best of our knowledge, it is not known yet if this factor can be dropped.

## 2.2.3 Convex Sets

The next step in generalizing the unconstrained minimization problem (2.1.36) is a constrained minimization problem with no functional constraints:

$$
\operatorname{min}_{x \in Q} f(x),
$$

where Q is a convex set of $\mathbb{R}^{n}$ . We have already introduced these sets in Definition 2.1.1, as natural domains of convex functions. Now we will need them as simple constraints.

Let us look at two important examples of convex sets.

Lemma 2.2.5 $Iff(\cdot)$ is a convex function on $\mathbb{R}^{n}$ , then for any $\beta \in \mathbb{R}$ its level set

$$
{\mathcal{L}}_{f}(\beta) = \{x \in \mathbb{R}^{n} \mid f(x) \leq \beta\}
$$

is either convex or empty.

Proof Indeed, let x and y belong to ${\mathcal{L}}_{f}(\beta)$ . Then $f(x) \ \leq \ \beta$ and $f(y) ~ \leq ~ \beta$ Therefore,

$$
f(\alpha x +(1 - \alpha) y) \stackrel{(2.1.3)}{\leq} \alpha f(x) +(1 - \alpha) f(y) \leq \beta,
$$

which means $\alpha x +(1 - \alpha) y \in \mathcal{L}_{f}(\beta)$ □

Lemma 2.2.6 Let f ( ) be a convex function on $\mathbb{R}^{n}$ . Then its epigraph

$$
\mathcal{E}_{f} = \{(x, \tau) \in \mathbb{R}^{n + 1} \mid f(x) \leq \tau\}
$$

is a convex set.

Proof Indeed, let $z_{1} =(x_{1}, \tau_{1}) \in \mathcal{E}_{f}$ and $z_{2} =(x_{2}, \tau_{2}) \in \mathcal{E}_{f}$ . Then for any $\alpha \in$ 0, 1 we have

$$
z_{\alpha} \equiv \alpha z_{1} +(1 - \alpha) z_{2} =(\alpha x_{1} +(1 - \alpha) x_{2}, \alpha \tau_{1} +(1 - \alpha) \tau_{2}),
$$

$$
f(\alpha x_{1} +(1 - \alpha) x_{2}) \stackrel{(2.1.3)}{\leq} \alpha f(x_{1}) +(1 - \alpha) f(x_{2}) \leq \alpha \tau_{1} +(1 - \alpha) \tau_{2}.
$$

Thus, $z_{\alpha} \in \mathcal{E}_{f}^{{}}$ □

Let us consider now the most important operations with convex sets.

Theorem 2.2.8 Let $Q_{1} \subseteq \mathbb{R}^{n}$ and $Q_{2} \subseteq \mathbb{R}^{m}$ be closed convex sets, and $\mathcal{A}(\cdot)$ be a linear operator:

$$
{\mathcal{A}}(x) = Ax + b : \ \mathbb{R}^{n} \to \ \mathbb{R}^{m}.
$$

1. The intersection of two sets $(m = n), ~ Q_{1} \bigcap Q_{2} = \{x \in \mathbb{R}^{n} ~ | ~ x \in Q_{1}, ~ x \in Q_{2}\},$ is convex and closed.

2. The sum of two sets $(m = n), Q_{1} + Q_{2} = \{z = x + y \mid x \in Q_{1}, y \in Q_{2}\}$ , is convex. It is closed provided that one of the sets is bounded.

3. The direct product of two sets, $\mathcal{Q}_{1} \times Q_{2} = \{(x, y) \in \mathbb{R}^{n + m} \ | \x \in Q_{1}, \y \in Q_{2}\}$ is convex and closed.

4. The conic hull of a set, ${\mathcal{H}}(Q_{1}) = \{z \in \mathbb{R}^{n} \mid z = \beta x, \x \in Q_{1}, \beta \geq 0\}$ , is convex. It is closed if the set $Q_{1}$ is bounded and does not contain the origin.

5. The convex hull of two sets,

$$
\mathrm{Conv}(\mathcal{Q}_{1}, \mathcal{Q}_{2}) = \{z \in \mathbb{R}^{n} \ | \z = \alpha x +(1 - \alpha) y, \x \in \mathcal{Q}_{1}, \y \in Q_{2}, \ \alpha \in[0, 1]\},
$$

is convex. It is closed if both sets are bounded.

6. The affine image of a set, $\mathcal{A}(Q_{1}) = \{y \in \mathbb{R}^{m} \ | \y = \mathcal{A}(x), \x \in Q_{1}\}$ , is convex and closed.

7. The inverse affine image: $\mathcal{A}^{- 1}(Q_{2}) = \{x \in \mathbb{R}^{n} \ | \d(x) \in Q_{2}\}$ is convex. It is closed $ifQ_{2}$ is bounded.

## Proof

1. If $x_{1} \in \mathrm{~} Q_{1} \bigcap Q_{2}$ and $x_{1} \in Q_{1} \bigcap Q_{2}$ , then $[x_{1}, x_{2}] \subset Q_{1}$ and $[x_{1}, x_{2}] \subset Q_{2}$ Therefore, $[x_{1}, x_{2}] \subset Q_{1} \bigcap Q_{2}$ . Closedness of intersection is evident.

2. If $z_{1} = x_{1} + y_{1}$ with $x_{1} \ \in \Q_{1}, y_{1} \ \in \Q_{2}$ , and $z_{2} = x_{2} + y_{2}$ with $x_{2} ~ \in ~ Q_{1}$ $y_{2} \in Q_{2}$ , then

$$
\alpha z_{1} +(1 - \alpha) z_{2} =[\alpha x_{1} +(1 - \alpha) x_{2}]_{1} +[\alpha y_{1} +(1 - \alpha) y_{2}]_{2},
$$

where $[\cdot]_{1} \in Q_{1}$ and $[\cdot]_{2} \in Q_{2}$ . Let us assume now that the set $Q_{2}$ is bounded. Consider a convergent sequence $z_{k} \ = \x_{k} + y_{k} \ \to \ \bar{z}$ with $\{x_{k}\} \subset \Q_{1}$ and $\{y_{k}\} \subset Q_{2}$ . Since $Q_{2}$ is bounded, we can assume that the whole sequence $\{y_{k}\}$ converges (otherwise, select a converging subsequence). Then, the sequence $\{x_{k}\}$ also converges. This implies the inclusion $\bar{z} \in Q_{1} + Q_{2}$

3. If $z_{1} =(x_{1}, y_{1}), x_{1} \in Q_{1}, y_{1} \in Q_{2}$ and $z_{2} =(x_{2}, y_{2}), x_{2} \in Q_{1}, y_{2} \in Q_{2}$ , then

$$
\alpha z_{1} +(1 - \alpha) z_{2} =([\alpha x_{1} +(1 - \alpha) x_{2}]_{1},[\alpha y_{1} +(1 - \alpha) y_{2}]_{2}),
$$

where $[\cdot]_{1} \in Q_{1}$ and $[\cdot]_{2} \in Q_{2}$ . Further, if a sequence $\{z_{k} =(x_{k}, y_{k})\} \subset Q_{1} \times Q_{2}$ converges to $\bar{z} =(\bar{x}, \bar{y})$ , this means that $x_{k} \to \bar{x} \in Q_{1}$ and $y_{k} \to \bar{y} \in Q_{2}$ Hence, the point z belongs to $Q_{1} \times Q_{2}$

4. If $z_{1} = \beta_{1} x_{1}$ with $x_{1} \in Q_{1}$ and $\beta_{1} \geq 0$ , and $z_{2} = \beta_{2} x_{2}$ with $x_{2} \in Q_{1}$ and $\beta_{2} \geq 0$ then for any $\alpha \in[0, 1]$ we have

$$
\alpha z_{1} +(1 - \alpha) z_{2} = \alpha \beta_{1} x_{1} +(1 - \alpha) \beta_{2} x_{2} = \gamma(\bar{\alpha} x_{1} +(1 - \bar{\alpha}) x_{2}),
$$

where $\gamma = \alpha \beta_{1} +(1 - \alpha) \beta_{2}$ , and $\bar{\alpha} = \alpha \beta_{1} / \gamma \in[0, 1]$ . Thus, the set $\mathcal{H}(Q_{1})$ is convex.

Consider a convergent sequence $\{z_{k} = \beta_{k} x_{k} \bar{z}\}$ with $\{x_{k}\} \subset Q_{1}.\operatorname{If} Q_{1}$ is bounded, then the sequence $\{x_{k}\}$ is bounded. If $0 \not \in{\cal Q}_{1}$ , then the sequence $\{\beta_{k}\}$ is also bounded. Therefore, without loss of generality, we can assume that both sequences $\{\beta_{k}\}$ and $\{x_{k}\}$ are convergent. Hence, $\bar{z} \in \mathcal{H}(Q_{1})$ and we conclude that this cone is closed.

5. If $z_{1} = \beta_{1} x_{1} +(1 - \beta_{1}) y_{1}$ with $x_{1} ~ \in ~ Q_{1}, y_{1} ~ \in ~ Q_{2}$ , and $\beta_{1} ~ \in ~[0, 1]$ , and $z_{2} = \beta_{2} x_{2} +(1 - \beta_{2}) y_{2}$ with $x_{2} \in Q_{1}, y_{2} \in Q_{2}$ , and $\beta_{2} \in[0, 1]$ , then for any $\alpha \in[0, 1]$ we have

$$
\begin{array}{r}{\alpha z_{1} +(1 - \alpha) z_{2} = \alpha(\beta_{1} x_{1} +(1 - \beta_{1}) y_{1}) +(1 - \alpha)(\beta_{2} x_{2} +(1 - \beta_{2}) y_{2})} \\{= \bar{\alpha}(\bar{\beta}_{1} x_{1} +(1 - \bar{\beta}_{1}) x_{2}) +(1 - \bar{\alpha})(\bar{\beta}_{2} y_{1} +(1 - \bar{\beta}_{2}) y_{2}),} \end{array}
$$

where $\bar{\alpha} = \alpha \beta_{1} +(1 - \alpha) \beta_{2} \mathrm{and} \bar{\beta}_{1} = \alpha \beta_{1} / \bar{\alpha}, \bar{\beta}_{2} = \alpha(1 - \beta_{1}) /(1 - \bar{\alpha}).$

Let us assume that both sets are bounded. Considering now a convergent sequence $\{z_{k} = \beta_{k} x_{k} +(1 - \beta_{k}) y_{k} \bar{z}\}$ with $\{\beta_{k}\} \subset[0, 1], \{x_{k}\} \subset Q_{1}$ , and $\{y_{k}\} \subset Q_{2}$ , without loss of generality, we can assume that all these sequences are convergent. This implies that $\bar{z} \in \mathrm{Conv} \{Q_{1}, Q_{2}\}$

6. If $y_{1}, y_{2} \in{\mathcal{A}}(Q_{1})$ then $y_{1} = Ax_{1} + b$ and $y_{2} = Ax_{2} + b$ for some $x_{1}, x_{2} \in Q_{1}$ Therefore, for $y(\alpha) = \alpha y_{1} +(1 - \alpha) y_{2}, 0 \leq \alpha \leq 1$ , we have

$$
y(\alpha) = \alpha(Ax_{1} + b) +(1 - \alpha)(Ax_{2} + b) = A(\alpha x_{1} +(1 - \alpha) x_{2}) + b.
$$

Thus, $y(\alpha) \ \in \{\mathcal{A}}(Q_{1})$ . This set is closed in view of the continuity of linear operators.

7. If $x_{1}, x_{2} \in \mathcal{A}^{- 1}(Q_{2})$ then $Ax_{1} + b = y_{1}$ and $Ax_{2} + b = y_{2}$ for some $y_{1}, y_{2} \in Q_{2}$ Therefore, for $x(\alpha) = \alpha x_{1} +(1 - \alpha) x_{2}, 0 \leq \alpha \leq 1$ , we have

$$
\begin{array}{rl} &{\mathcal{A}(x(\alpha)) = A(\alpha x_{1} +(1 - \alpha) x_{2}) + b} \\ &{\qquad = \alpha(Ax_{1} + b) +(1 - \alpha)(Ax_{2} + b) = \alpha y_{1} +(1 - \alpha) y_{2} \in Q_{2}.} \end{array}
$$

Let $Q_{2}$ be bounded. Consider a convergent sequence $\{x_{k} \to \bar{x}\} \subset \mathcal{A}^{- 1}(Q_{2})$ Then, without loss of generality, we can assume that the sequence $\{y_{k} ~ =$ $\mathcal{A}(x_{k})\} \subset Q_{2}$ is convergent to a point $\bar{y} \in Q_{2}$ . Since $\bar{y} = A(\bar{x})$ , we conclude that $\bar{x} \in \mathcal{A}^{- 1}(Q_{2})$ . Thus, the inverse image of a bounded set is closed. □

Let us give examples justifying the additional assumptions of Theorem 2.2.8, which were introduced to ensure closedness of the results of some operations with convex sets.

Example 2.2.1 In all examples below, we work with an unbounded convex set

$$
\begin{array}{r}{Q = \left\{x \in \mathbb{R}_{+}^{2} : \x^{(2)} \geq \frac{1}{x^{(1)}} \right\}.} \end{array}
$$

- Sum of two sets. Consider the set R $\begin{array}{rl} &{\mathrm{\i}, 2 \stackrel{\mathrm{def}}{=} \left\{x \in \mathbb{R}^{2} : x^{(1)} \geq 0, x^{(2)} = 0 \right\}} \end{array}$ . Then

$$
Q - \mathbb{R}_{+}^{1, 2} = \left\{x \in \mathbb{R}^{2} \colon x^{(2)} > 0 \right\}
$$

is an open set. At the same time, $Q + \mathbb{R}_{+}^{1, 2} \equiv Q$ is closed.

- Conic hull. Let $0_{2} =(0, 0)^{T} \in \mathbb{R}^{2}$ . The set

$$
\mathcal{H}(Q) \equiv \left\{x \in \mathbb{R}^{2} :{x}^{(1)} > 0,{x}^{(2)} > 0 \right\} \bigcup \left\{{0}_{2} \right\}
$$

is not closed. Also, for $Q_{1} = \left\{x \in \mathbb{R}^{2} : \ \| x - e_{1} \| \leq 1 \right\}$ , we have

$$
{\mathcal{H}}(Q_{1}) = \left\{x \in \mathbb{R}^{2} : x^{(1)} > 0 \right\} \bigcup \{0_{2}\},
$$

which is not closed.

- Convex hull. Note that $\mathrm{Conv} \{0_{2}, Q\} = \mathcal{H}(Q)$ , and the latter set is not closed.

- Inverse affine image. Note that

$$
\{x \in \mathbb{R} : \ \exists \tau > 0 \mathrm{~ such ~ that ~}(\tau, x) \in Q\} = \{x \in \mathbb{R} : \x > 0\},
$$

and this set is open.

Using the statements above, we can justify the convexity of some important sets.

## Example 2.2.2

1. Half-space. The set $\{x \ \in \mathbb{R}^{n} \mid \langle a, x \rangle \leq \beta\}$ is convex since linear function is convex.

2. $Polytope$ . The set $\{x ~ \in ~ \mathbb{R}^{n} ~ | ~ \langle a_{i}, x \rangle ~ \leq ~ b_{i}, ~ i ~ = ~ 1 \dots m\}$ is convex as an intersection of convex sets.

3. Ellipsoid. Let $A = A^{T} \succeq 0$ . Then the set $\{x \ \in \mathbb{R}^{n} \mid \langle Ax, x \rangle \leq r^{2}\}$ is convex since the function $\langle Ax, x \rangle$ is convex.

Let us consider now a smooth optimization problem with the set constraint:

$$
\operatorname{min}_{x \in Q} f(x), \quad f \in{\mathcal{F}}^{1}(Q, \| \cdot \|),\tag{2.2.38}
$$

where $Q$ is a closed convex set. We assume that the optimal set of this problem $X^{*}$ is not empty. Our current goal consists in describing the optimality conditions for problem (2.2.38). It is clear that the old condition

$$
\nabla f(x) = 0
$$

does not work here.

Example 2.2.3 Consider the following univariate minimization problem:

$$
\operatorname{min}_{x \geq 0} x.
$$

Here $Q = \{x \in \mathbb{R} : x \geq 0\}$ , and $f(x) = x$ . Note that $x^{*} = 0$ , but $\nabla f(x^{*}) = 1 > 0$ □

Theorem 2.2.9 Let $f \in{\mathcal{F}}^{1}(Q)$ and the set $Q$ be closed and convex. A point $x^{*}$ is a solution of problem (2.2.38) if and only if

$$
\langle \nabla f(x^{*}), x - x^{*} \rangle \geq 0\tag{2.2.39}
$$

for all $x \in Q$

Proof Indeed, if (2.2.39) is true, then

$$
f(x) \stackrel{(2.1.2)}{\geq} f(x^{*}) + \langle \nabla f(x^{*}), x - x^{*} \rangle \stackrel{(2.2.39)}{\geq} f(x^{*})
$$

for all $x \in Q$

Let $x^{*}$ be a solution to (2.2.38). Assume that there exists some $x \in Q$ such that

$$
\langle \nabla f(x^{*}), x - x^{*} \rangle < 0.
$$

Consider the function $\phi(\alpha) = f(x^{*} + \alpha(x - x^{*})), \alpha \in[0, 1]$ . Note that

$$
\phi(0) = f(x^{*}), \quad \phi^{\prime}(0) = \langle \nabla f(x^{*}), x - x^{*} \rangle < 0.
$$

Therefore, for α small enough we have

$$
f(x^{*} + \alpha(x - x^{*})) = \phi(\alpha) < \phi(0) = f(x^{*}).
$$

This is a contradiction.

The next statement is often addressed as the growth property of strongly convex functions.

Corollary 2.2.1 If $f \in \mathcal{S}_{\mu}^{1}(Q, \| \cdot \|)$ , then for any $x \in Q$ , we have

$$
\begin{array}{r}{f(x) \geq f(x^{*}) + \frac{\mu}{2} \| x - x^{*} \|^{2}.} \end{array}\tag{2.2.40}
$$

Proof Indeed,

$$
\begin{array}{rl}{f(x)} &{{} \stackrel{(2.1.20)}{\geq} f(x^{*}) + \langle \nabla f(x^{*}), x - x^{*} \rangle + \frac{\mu}{2} \| x - x^{*} \|^{2}} \end{array}
$$

$$
\begin{array}{rlr}{\stackrel{(2.2.39)}{\geq} f(x^{*}) + \frac{\mu}{2} \| x - x^{*} \|^{2}.} &{{} \quad} &{\sqsubset} \end{array}
$$

Corollary 2.2.2 Let $f \in C_{L}^{1, 1}(\mathbb{R}^{n}, \parallel \cdot \parallel)$ . Then, for any two points $x_{1}^{*}, x_{2}^{*} \in X^{*}$ , we have

$$
\nabla f(x_{1}^{*}) = \nabla f(x_{2}^{*}), \quad \langle \nabla f(x_{1}^{*}), x_{1}^{*} \rangle \ = \ \langle \nabla f(x_{2}^{*}), x_{2}^{*} \rangle.\tag{2.2.41}
$$

Proof Indeed, $\begin{array}{rlr}{{\langle \nabla f(x_{1}^{*}), x_{2}^{*} - x_{1}^{*} \rangle \stackrel{(2.2.39)}{\geq}}} &{{}} &{} \end{array}$ 0 and $\begin{array}{rlr}{{\langle \nabla f(x_{2}^{*}), x_{1}^{*} - x_{2}^{*} \rangle \stackrel{(2.2.39)}{\geq}}} \end{array}$ 0. Adding these two inequalities, we have

$$
\begin{array}{r}{0 \geq \langle \nabla f(x_{1}^{*}) - \nabla f(x_{2}^{*}), x_{1}^{*} - x_{2}^{*} \rangle \stackrel{(2.1.11)}{\geq} \frac{1}{L} \| \nabla f(x_{1}^{*}) - \nabla f(x_{2}^{*}) \|_{*}^{2}.} \end{array}
$$

For $x^{*} \in X^{*}$ , let $g^{*} = \nabla f(x^{*})$ . Then,

$$
0 \stackrel{(2.2.39)}{\geq} \langle \nabla f(x_{2}^{*}), x_{2}^{*} - x_{1}^{*} \rangle \stackrel{(2.2.41)}{=} \langle g^{*}, x_{2}^{*} - x_{1}^{*} \rangle
$$

$$
\overset{(2.2.41)}{=} \langle \nabla f({x}_{1}^{*}),{x}_{2}^{*} -{x}_{1}^{*} \rangle \overset{(2.2.39)}{\geq} 0.\qquad \mathbb{U}
$$

Let us now prove the existence theorem.

Theorem 2.2.10 Let $f \in \mathcal{S}_{\mu}^{1}(Q, \| \cdot \|)$ with $\mu > 0$ and the set Q be closed and convex. Then there exists a unique solution $x^{*}$ of problem (2.2.38).

Proof Let $x_{0} \in{Q}$ . Consider the set $\bar{Q} = \{x \in Q \mid f(x) \leq f(x_{0})\}$ . Note that the problem (2.2.38) is equivalent to the following

$$
\operatorname{min} \{f(x) \mid x \in{\bar{Q}}\}.\tag{2.2.42}
$$

However, the set $\bar{Q}$ is bounded: for all $x \in{\bar{Q}}$ , we have

$$
f(x_{0}) \geq f(x) \stackrel{(2.1.20)}{\geq} f(x_{0}) + \langle \nabla f(x_{0}), x - x_{0} \rangle +{\textstyle \frac{\mu}{2}} \parallel x - x_{0} \parallel^{2}.
$$

Hence, $\begin{array}{r}{x - x_{0} \parallel \le \frac{2}{\mu} \parallel \nabla f(x_{0}) \parallel_{*}} \end{array}$

Thus, the solution $x^{*}$ of problem (2.2.42) ( (2.2.38)) exists. Let us prove that it is unique. Indeed, if $x_{1}^{*}$ is also an optimal solution to (2.2.38), then

$$
f^{*} = f(x_{1}^{*}) \stackrel{(2.2.40)}{\geq} f^{*} +{\textstyle \frac{\mu}{2}} \parallel x_{1}^{*} - x^{*} \parallel^{2}.
$$

Therefore $x_{1}^{*} = x^{*}$ □

Example 2.2.4 Let $f \in{\mathcal{F}}_{\mu}^{1}(Q, \| \cdot \|_{p})$ . Consider the following primal minimization problem:

$$
f^{*} = \operatorname{min}_{x \in Q} \{f(x) : Ax = b\},\tag{2.2.43}
$$

where $A \in \mathbb{R}^{m \times n}$ and $b \in \mathbb{R}^{m}$ . In some applications the set $Q$ and function $f$ are very simple, and the complexity of this problem is related to the nontrivial intersection of the linear constraints with the set $Q.$ . In these cases, it is recommended to solve problem (2.2.43) by dualizing the linear constraints.

Let us introduce dual multipliers for equality constraints, and define the Lagrangian

$$
\mathcal{L}(x, u) = f(x) + \langle u, b - Ax \rangle, \quad x \in Q, u \in \mathbb{R}^{m}.
$$

Now we can define the dual function $\phi(u) = \operatorname{min}_{x \in \mathcal{Q}} \mathcal{L}(x, u)$ . By Theorem 2.2.10, this function is well defined for all $u \in \mathbb{R}^{m}$ . Let $x(u) = \arg \operatorname{min}_{x \in Q} \mathcal{L}(x, u) \in \mathcal{Q}$ and let $g(u) = b - Ax(u)$ . Note that for arbitrary $u_{1}$ and $u_{2} \in \mathbb{R}^{m}$ we have

$$
\begin{array}{l}{\phi(u_{1}) = f(x(u_{1})) + \langle u_{1}, b - Ax(u_{1}) \rangle ~ \leq ~ f(x(u_{2})) + \langle u_{1}, b - Ax(u_{2}) \rangle} \\{\quad} \\{\qquad = \phi(u_{2}) + \langle u_{1} - u_{2}, g(u_{2}) \rangle.} \end{array}
$$

Let us introduce in $\mathbb{R}^{m}$ the norm $\| \cdot \|_{d}$ . Define

$$
\| A \|_{p, d} = \operatorname{max}_{x, u} \{\langle Ax, u \rangle : \| x \|_{p} \leq 1, \| u \|_{d} \leq 1\} \stackrel{(2.1.6)}{=} \operatorname{max}_{u} \{\| A^{T} u \|_{p *} : \| u \|_{d} \leq 1\}.
$$

Then, for any $u_{1}, u_{2} \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rl} &{\langle \nabla f(x(u_{2})), x(u_{1}) - x(u_{2}) \rangle \overset{(2.2.39)}{\geq} \langle A^{T} u_{2}, x(u_{1}) - x(u_{2}) \rangle.} \end{array}\tag{2.2.44}
$$

Therefore,

$$
\begin{array}{rl}{\phi(u)} &{= \phantom{-} f(x(u)) \phantom{-} +(u_{1}, b - Ax(u)) \phantom{-}} \\ &{\qquad \Omega(x(u))} \\{\geq 0} &{\phantom{-} f(x(u)) \phantom{-} +(\nabla f(x(u_{2})), \nabla(u_{1}) - v(u_{2})) + \frac{1}{2} \mu[x(v_{1}) - x(u_{2})] \Bigr |_{\phi}^{2},} \\ &{\qquad \quad +(u_{1}, b - Ax(u)) \phantom{-}} \\ &{\qquad \partial_{x_{1}}^{2, 0} g(x(u)) \phantom{-} f(x(u_{2}, \Delta x(u_{1})) - x(u_{2})) \phantom{-} + \frac{1}{2} \mu[x(u_{1}) - x(u_{2})] \Bigr |_{\phi}^{2},} \\ &{\qquad \quad +(u_{1}, b - Ax(u)) \phantom{-}} \\ &{\qquad \quad + \frac{1}{2} \mu[x(u_{2}) + \xi(u_{2}), u_{1} - u_{2}] - \frac{1}{2} \mu[- \lambda_{1} \partial_{x_{2}} \A(x(u_{1}) - x(u_{2}))] \phantom{-}} \\ &{\qquad \quad + \frac{1}{2} \mu[x(u) - x(u_{2})] \phantom{-}} \\ &{\qquad \geq} \end{array}
$$

Since $\phi$ is concave, $g(u) \ = \ \nabla \phi(u)$ and $- \phi \stackrel{(2.1.9)}{\in} \mathcal{F}_{L}^{1, 1}(\mathbb{R}^{m}, \parallel \cdot \parallel_{d})$ with $L \ =$ $\textstyle{\frac{1}{\mu}} \| A \|_{p, d}^{2}.$

Now we can solve the Lagrangian dual problem

$$
\operatorname{min}_{u \in \mathbb{R}^{m}} \{- \phi(u)\}\tag{2.2.45}
$$

by any method for minimizing smooth convex functions. Assuming that the solution of this problem $u^{*}$ exists, we have

$$
0 = \nabla \phi(u^{*}) \ : = \ : b - Ax(u^{*}).
$$

Thus, $x(u^{*})$ is feasible for problem (2.2.43). On the other hand,

$$
f^{*} ~ \stackrel{(1.3.6)}{\geq} ~ f_{*} ~ \stackrel{\mathrm{def}}{=} ~ \operatorname{max}_{u \in \mathbb{R}^{m}} \phi(u) ~ = ~ f(x(u^{*})) + \langle u^{*}, \nabla \phi(u^{*}) \rangle ~ = ~ f(x(u^{*})).
$$

Hence, $f^{*} = f_{*}$ and $x(u^{*})$ is the optimal solution of problem (2.2.43).

Now, assume that $\bar{u} \in \mathbb{R}^{m}$ is an approximate solution to the dual problem (2.2.45). Then it is clear that the norm of the gradient of the objective function at this point is very important. Indeed, it bounds the residual $b - A(x(\bar{u}))$ . On the other hand,

$$
\begin{array}{rl}{f(x(\bar{u})) - f^{*} = \phi(\bar{u}) - \langle \bar{u}, \nabla \phi(\bar{u}) \rangle - \phi(u^{*}) \ \leq \ \| \bar{u} \|_{d} \cdot \| \nabla \phi(\bar{u}) \|_{d}^{*}.} \end{array}
$$

Thus, the size of the gradient of the dual function bounds at the same time the level of infeasibility and the level of optimality.

We have already discussed in Sect. 2.2.2 how to compute a point with small norm of the gradient. However, for problem (2.2.45) the situation is even simpler. Indeed, Theorem 2.2.4 shows that the average gradient at points $\{y_{k}\}$ decreases as $O(\textstyle{\frac{1}{k^{2}}})$ For problem (2.2.45), this means that the residual of the linear system $Ax ={\ddot{b}}$ at some average point of the sequence $\{x(v_{k})\} \subset Q$ (with points $\{v_{k}\}$ corresponding to $\{y_{k}\}$ in method (2.2.7)) decreases as $\begin{array}{r}{O(\frac{1}{k^{2}})} \end{array}$ . So, these average points can be taken as approximate solutions to the primal problem (2.2.43).

To conclude this section, let us analyze the properties of Euclidean projection onto the convex set. Up to the end of this section the notation $\| \cdot \|$ is used for the standard Euclidean norm.

Definition 2.2.2 Let $Q$ be a closed set and $x_{0} \in \mathbb{R}^{n}$ . Define

$$
\pi_{\mathcal{Q}}(x_{0}) = \arg \operatorname{min}_{x \in \mathcal{Q}} \ \parallel \x - x_{0} \parallel.\tag{2.2.46}
$$

We call $\pi_{Q}(\boldsymbol{x}_{0})$ the Euclidean projection of the point $x_{0}$ onto the set $Q.$

Let $f(x) ={\begin{array}{l}{{\frac{1}{2}}} \end{array}} \|{\begin{array}{l}{x} \end{array}} \|^{2}$ . Since $\nabla ^ { 2 } f ( x ) = I _ { n } $ , this function belongs to the class $\mathcal{S}_{1}^{2}(\mathbb{R}^{n})$

Theorem 2.2.11 If Q is a convex set, then there exists a unique projection $\pi_{Q}(\boldsymbol{x}_{0})$

Proof Indeed, $\pi_{\mathcal{Q}}(x_{0}) = \arg \operatorname{min}_{x \in \mathcal{Q}} f(x)$ , where $f \in \mathcal{S}_{1, 1}^{1, 1}(\mathbb{R}^{n})$ . Therefore $\pi_{Q}(\boldsymbol{x}_{0})$ is unique and well defined in view of Theorem 2.2.10.

Since Q is closed, $\pi_{Q}(x_{0}) = x_{0}$ if and only if $x_{0} \in{Q}$

Lemma 2.2.7 Let Q be a closed convex set and $x_{0} \notin Q$ . Then for any $x \in Q,$ , we have

$$
\langle \pi_{Q}(x_{0}) - x_{0}, x - \pi_{Q}(x_{0}) \rangle \geq 0.\tag{2.2.47}
$$

Proof Note that $\pi_{Q}(\boldsymbol{x}_{0})$ is a solution of the minimization problem $\operatorname{min}_{x \in Q} ~ f(x)$ with $f(x) ={\textstyle{\frac{1}{2}}} \parallel x - x_{0} \parallel^{2}$ . Therefore, in view of Theorem 2.2.9 we have

$$
\langle \nabla f(\pi_{Q}(x_{0})), x - \pi_{Q}(x_{0}) \rangle \geq 0
$$

for all $x \in Q$ . It remains to note that $\nabla f(x) = x - x_{0}$ . □

Corollary 2.2.3 For any two points $x_{1}$ and $x_{2} \in \mathbb{R}^{n}$ , we have

$$
\| \pi_{Q}(x_{1}) - \pi_{Q}(x_{2}) \| \leq \| x_{1} - x_{2} \|.\tag{2.2.48}
$$

Proof Indeed, in view of inequality (2.2.47), we have

$$
\langle \pi_{Q}(x_{1}) - x_{1}, \pi_{Q}(x_{2}) - \pi_{Q}(x_{1}) \geq 0,
$$

$$
\langle \pi_{Q}(x_{2}) - x_{2}, \pi_{Q}(x_{1}) - \pi_{Q}(x_{2}) \geq 0.
$$

Adding these two inequalities, we get

$$
\| \pi_{Q}(x_{1}) - \pi_{Q}(x_{2}) \|^{2} \ \leq \ \langle \pi_{Q}(x_{1}) - \pi_{Q}(x_{2}), x_{1} - x_{2} \rangle
$$

$$
\leq \| \pi_{Q}(x_{1}) - \pi_{Q}(x_{2}) \| \cdot \| x_{1} - x_{2} \|.
$$

□

Let us also mention a triangle inequality for projection (compare with (2.2.36)). Lemma 2.2.8 For any two point $x \in Q$ and $y \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{\parallel x - \pi_{Q}(y) \parallel^{2} + \parallel \pi_{Q}(y) - y \parallel^{2} \leq \parallel x - y \parallel^{2}.} \end{array}\tag{2.2.49}
$$

Proof Indeed, in view of (2.2.47), we have

$$
\parallel x - \pi_{Q}(y) \parallel^{2} - \parallel x - y \parallel^{2} = \langle y - \pi_{Q}(y), 2x - \pi_{Q}(y) - y \rangle
$$

$$
\leq - \parallel y - \pi_{Q}(y) \parallel^{2}.
$$

□

There exists a useful characterization of optimal solutions to problem (2.2.38) in terms of Euclidean projection.

Theorem 2.2.12 Let $x^{*}$ be an optimal solution to problem (2.2.38). Then, for any $\gamma > 0$ we have

$$
\begin{array}{r}{\pi_{\cal Q}(x^{*} - \frac{1}{\gamma} \nabla f(x^{*})) = x^{*}.} \end{array}\tag{2.2.50}
$$

Proof Consider the minimization problem $\operatorname{in}_{\epsilon Q} \frac{1}{2} \| x - x^{*} + \frac{1}{\gamma} \nabla f(x^{*}) \|^{2}$ . Its objective x   
function is strongly convex. Hence, in view of Theorem 2.2.10, its solution $x_{*}$ exists   
and is unique. Moreover, in view of Theorem 2.2.9, it is completely characterized   
by the following inequality:

$$
\begin{array}{r}{\langle x_{*} - x^{*} + \frac{1}{\gamma} \nabla f(x^{*}), x - x_{*} \rangle \geq 0, \quad \forall x \in Q.} \end{array}
$$

Hence, $x_{*} = x^{*}$ .

## 2.2 Optimal Methods

Finally, let us mention some properties of the distance function to a convex set:

$$
\begin{array}{r}{\rho_{Q}(x) \stackrel{\mathrm{def}}{=} \frac{1}{2} \| x - \pi_{Q}(x) \|^{2}, \quad x \in \mathbb{R}^{n}.} \end{array}\tag{2.2.51}
$$

Lemma 2.2.9 A function $\rho_{Q}$ is convex and differentiable on $\mathbb{R}^{n}$ with gradient

$$
\begin{array}{r}{\nabla \rho_{Q}(x) = x - \pi_{Q}(x), \quad x \in \mathbb{R}^{n},} \end{array}\tag{2.2.52}
$$

which is Lipschitz continuous in the standard Euclidean norm with constant one.

Proof Let us fix two arbitrary points $x_{1}$ and $x_{2}$ in $\mathbb{R}^{n}$ . Let $\pi_{1} = \pi_{Q}(x_{1}) \in Q$ $\pi_{2} = \pi_{Q}(x_{2}) \in Q, g_{1} = x_{1} - \pi_{1}$ , and $g_{2} = x_{2} - \pi_{2}$ . In view of the Euclidean identity

$$
\begin{array}{r}{\frac 12 \| g_{2} \|^{2} = \frac 12 \| g_{1} \|^{2} + \langle g_{1}, g_{2} - g_{1} \rangle + \frac 12 \| g_{2} - g_{1} \|^{2},} \end{array}\tag{2.2.53}
$$

we have

$$
\begin{array}{rcl}{\rho_{Q}(x_{2})} &{\geq} &{\rho_{Q}(x_{1}) + \langle x_{1} - \pi_{Q}(x_{1}), x_{2} - x_{1} \rangle} \\ & &{+ \langle \pi_{Q}(x_{1}) - x_{1}, \pi_{Q}(x_{2}) - \pi_{Q}(x_{1}) \rangle} \end{array}
$$

$$
\stackrel{(2.2.47)}{\geq} \rho_{Q}(x_{1}) + \langle g_{1}, x_{2} - x_{1} \rangle.
$$

On the other hand,

$$
\begin{array}{rlr}{{\rho_{Q}(x_{2}) - \rho_{Q}(x_{1}) \overset{\scriptscriptstyle(2, 2, 53)}{=} \langle g_{1}, g_{2} - g_{1} \rangle + \frac{1}{2} \| g_{2} - g_{1} \|^{2}}} \\ &{} & \\ &{=} &{\langle g_{1}, x_{2} - x_{1} \rangle + \langle g_{1}, \pi_{1} - \pi_{2} - g_{2} \rangle + \frac{1}{2} \| g_{1} \|^{2} + \frac{1}{2} \| g_{2} \|^{2}} \\ &{} & \\ &{} &{\overset{\scriptscriptstyle(2, 2, 46)}{\leq} \langle g_{1}, x_{2} - x_{1} \rangle + \langle g_{1}, \pi_{1} - x_{2} \rangle + \frac{1}{2} \| g_{1} \|^{2} + \frac{1}{2} \| x_{2} - \pi_{1} \|^{2}} \\ &{} & \\ &{=} &{\langle g_{1}, x_{2} - x_{1} \rangle + \frac{1}{2} \| x_{2} - x_{1} \|^{2}.} \end{array}
$$

Thus, for arbitrary points $x_{1}$ and $x_{2} \in \mathbb{R}^{n}$ we have proved the following relations:

$$
\begin{array}{r}{\langle g_{1}, x_{2} - x_{1} \rangle \le \rho_{Q}(x_{2}) - \rho_{Q}(x_{1}) \ \le \ \langle g_{1}, x_{2} - x_{1} \rangle + \frac 12 \| x_{2} - x_{1} \|^{2}.} \end{array}
$$

Hence the function $\rho_{Q}$ is differentiable at any point $x \in \mathbb{R}^{n}$ and $\nabla \rho_{Q}(x) = x -$ $\pi_{Q}(x)$ . Moreover, in view of condition (2.1.9), $f \in \mathcal{F}_{1}^{1, 1}(\mathbb{R}^{n})$ . □

## 2.2.4 The Gradient Mapping

As compared with the unconstrained problem, in the constrained minimization problem (2.2.38), the gradient of the objective function should be treated differently. In the previous section, we have already seen that its role in optimality conditions is changing. Moreover, we can no longer use it for the gradient step since the result may be infeasible. If we look at the main properties of the gradient, which are useful for functions from the class $\mathcal{F}_{L}^{1, 1}(\mathbb{R}^{n})$ , we can see that two of them are of the highest importance. The first is that the step along the direction of the anti-gradient decreases the function value by an amount comparable with the squared norm of the gradient:

$$
\begin{array}{r}{f(x - \frac{1}{L} \nabla f(x)) \leq f(x) - \frac{1}{2L} \parallel \nabla f(x) \parallel^{2}.} \end{array}
$$

The second is the inequality

$$
\begin{array}{r}{\langle \nabla f(x), x - x^{*} \rangle \geq \frac{1}{L} \parallel \nabla f(x) \parallel^{2}.} \end{array}
$$

It turns out that for Constrained Minimization we can introduce an object which inherits both these important properties.

Definition 2.2.3 Let us fix some $\gamma > 0$ . Define

$$
x_{Q}(\bar{x}; \gamma) = \arg \operatorname{min}_{x \in Q} \left[f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle + \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2} \right],\tag{2.2.54}
$$

$$
g_{Q}(\bar{x}; \gamma) = \gamma(\bar{x} - x_{Q}(\bar{x}; \gamma)).
$$

We call $x_{Q}(\bar{x}, \gamma)$ the gradient mapping, and $g_{Q}(\bar{x}, \gamma)$ the reduced gradient of the function $f$ on $Q$

Note that the objective function of the optimization problem in this definition can be written as

$$
\begin{array}{r}{f(\bar{x}) + \frac{\gamma}{2} \| x - \bar{x} + \frac{1}{\gamma} \nabla f(\bar{x}) \|^{2} - \frac{1}{2 \gamma} \| \nabla f(\bar{x}) \|^{2}.} \end{array}\tag{2.2.55}
$$

Thus, $x_{Q}(\bar{x}; \gamma)$ is a projection of point $\begin{array}{r}{\bar{x} - \frac{1}{\gamma} \nabla f(\bar{x})} \end{array}$ onto the feasible set. For $Q \equiv$ $\mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{x_{Q}(\bar{x}; \gamma) = \bar{x} - \frac{1}{\gamma} \nabla f(\bar{x}), \quad g_{Q}(\bar{x}; \gamma) = \nabla f(\bar{x}).} \end{array}
$$

The value $\frac{1}{\gamma}$ can be seen as a natural step size for the “gradient” step

$$
\begin{array}{r}{\bar{x} \to x_{Q}(\bar{x}; \gamma) \overset{(2.2.54)}{=} \bar{x} - \frac{1}{\gamma} g_{Q}(\bar{x}; \gamma).} \end{array}\tag{2.2.56}
$$

## 2.2 Optimal Methods

Note that the gradient mapping is well defined in view of Theorem 2.2.10. Moreover, it is defined for all ${\bar{x}} \in \mathbb{R}^{n}$ , not necessarily from $Q$

Let us write down the main property of the gradient mapping.

Theorem 2.2.13 Let $f \in \mathcal{S}_{\mu, L}^{1, 1}(Q), \gamma \geq L$ , and $\bar{x} \in \mathbb{R}^{n}$ . Then for any $x \in Q$ , we have

$$
\begin{array}{r}{f(x) \geq f(x_{Q}(\bar{x}; \gamma)) + \langle g_{Q}(\bar{x}; \gamma), x - \bar{x} \rangle + \frac{1}{2 \gamma} \parallel g_{Q}(\bar{x}; \gamma) \parallel^{2} + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}.} \end{array}\tag{2.2.57}
$$

Proof Let $x_{Q} = x_{Q}(\gamma, \bar{x}), g_{Q} = g_{Q}(\gamma, \bar{x})$ , and

$$
\begin{array}{r}{\phi(x) = f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle + \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2}.} \end{array}
$$

Then $\nabla \phi(x) = \nabla f({\bar{x}}) + \gamma(x -{\bar{x}})$ , and for any $x \in Q$ we have

$$
\langle \nabla f(\bar{x}) - g_{Q}, x - x_{Q} \rangle = \langle \nabla \phi(x_{Q}), x - x_{Q} \rangle \stackrel{(2.2.39)}{\geq} 0.
$$

Hence,

$$
\begin{array}{rl}{f(x) - \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}^{(2, 1, 20)} f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle} \\{=} &{f(\bar{x}) + \langle \nabla f(\bar{x}), x_{Q} - \bar{x} \rangle + \langle \nabla f(\bar{x}), x - x_{Q} \rangle} \\{\ \ge\} &{f(\bar{x}) + \langle \nabla f(\bar{x}), x_{Q} - \bar{x} \rangle + \langle g_{Q}, x - x_{Q} \rangle} \\{=} &{\phi(x_{Q}) - \frac{\gamma}{2} \parallel x_{Q} - \bar{x} \parallel^{2} + \langle g_{Q}, x - x_{Q} \rangle} \\{=} &{\phi(x_{Q}) - \frac{1}{2 \gamma} \parallel g_{Q} \parallel^{2} + \langle g_{Q}, x - x_{Q} \rangle} \\{=} &{\phi(x_{Q}) + \frac{1}{2 \gamma} \parallel g_{Q} \parallel^{2} + \langle g_{Q}, x - \bar{x} \rangle,} \end{array}
$$

and $\phi(x_{Q}) \stackrel{(2.1.9)}{\geq} f(x_{Q})$ since $\gamma \geq L$ .

Corollary 2.2.4 Let $f \in{\mathcal{S}}_{\mu, L}^{1, 1}(Q), \gamma \geq L, and{\bar{x}} \in Q$ . Then

$$
\begin{array}{r}{f(x_{Q}(\bar{x}; \gamma)) \leq f(\bar{x}) - \frac{1}{2 \gamma} \parallel g_{Q}(\bar{x}; \gamma) \parallel^{2},} \end{array}\tag{2.2.58}
$$

$$
\begin{array}{c}{{\langle g_{Q}(\bar{x}; \gamma), \bar{x} - x^{*} \rangle \geq \frac{1}{2 \gamma} \parallel g_{Q}(\bar{x}; \gamma) \parallel^{2} + \frac{\mu}{2} \parallel \bar{x} - x^{*} \parallel^{2}}} \\{{{}}} \\{{+ \frac{\mu}{2} \parallel x_{Q}(\bar{x}; \gamma) - x^{*} \parallel^{2}.}} \end{array}\tag{2.2.59}
$$

Proof Indeed, using (2.2.57) with $x = \bar{x}$ , we get (2.2.58). Using (2.2.57) with $x =$ $x^{*}$ , we get (2.2.59) since

$$
\begin{array}{r}{f(x_{Q}(\bar{x}; \gamma)) \stackrel{(2.2.40)}{\geq} f(x^{*}) + \frac{\mu}{2} \| x_{Q}(\bar{x}; \gamma) - x^{*} \|^{2}.} \end{array}
$$

## 2.2.5 Minimization over Simple Sets

Let us show that we can use the gradient mapping to solve the following problem:

$$
\operatorname{min}_{x \in Q} f(x),
$$

where $f \in \mathcal{S}_{\mu, L}^{1, 1}(Q)$ and $Q$ is a closed convex set. We assume that the set Q is simple enough, so the gradient mapping can be computed by a closed form expression. This assumption is valid for some simple sets like positive orthants, n dimensional boxes, simplexes, Euclidean balls, and some others.

Let us start with the Gradient Method.

## Gradient Method for Simple Set

0. Choose a starting point $x_{0} \in Q$ and a parameter $\gamma > 0.$

1. kth iteration $(k \geq 0)$

$$
x_{k + 1} = x_{k} -{\textstyle \frac{1}{\gamma}} g_{Q}(x_{k}; \gamma).\tag{2.2.60}
$$

Note that in this scheme

$$
\begin{array}{rl}{x_{k + 1}} &{\stackrel{(2.2.56)}{=} x_{\mathscr{Q}}(x_{k}; \gamma) = \pi_{\mathscr{Q}} \left(x_{k} - \frac{1}{\gamma} \nabla f(x_{k}) \right).} \end{array}\tag{2.2.61}
$$

The efficiency analysis of this scheme is very similar to the analysis of its unconstrained version.

Theorem 2.2.14 Let $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ . If in (2.2.60) $\begin{array}{r}{\gamma \geq \frac{L + \mu}{2}} \end{array}$ , then

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel{} \leq \left(1 - \frac{\mu}{\gamma} \right)^{k} \parallel{} x_{0} - x^{*} \parallel.} \end{array}
$$

## 2.2 Optimal Methods

Proof Let $r_{k} = \parallel{} x_{k} - x^{*} \parallel{}$ . Then, in view of Theorem 2.2.12, we have

$$
\begin{array}{rl}{\nu_{k + 1}^{2}} &{\tau_{k}^{2, \pm(1, 2, 61)} \| \pi_{\mathcal{Q}}(x_{k} - \frac{1}{\gamma} \nabla f(x_{k})) - \pi_{\mathcal{Q}}(x^{*} - \frac{1}{\gamma} \nabla f(x^{*})) \|^{2}} \\ &{\overset{(2, 2, 48)}{\leq} \| x_{k} - x^{*} - \frac{1}{\gamma}(\nabla f(x_{k}) - \nabla f(x^{*})) \|^{2}} \\ &{\qquad = \quad r_{k}^{2} - \frac{2}{\gamma} \langle \nabla f(x_{k}) - \nabla f(x^{*}), x_{k} - x^{*} \rangle + \frac{1}{\gamma^{2}} \| \nabla f(x_{k}) - \nabla f(x^{*}) \|^{2}} \\ &{\overset{(2, 1, 32)}{\leq} \Big(1 - \frac{2}{\gamma} \cdot \frac{\mu L}{\mu + L} \Big) r_{k}^{2} + \Big(\frac{1}{\gamma^{2}} - \frac{2}{\gamma} \cdot \frac{1}{\mu + L} \Big) \| \nabla f(x_{k}) - \nabla f(x^{*}) \|^{2}} \\ &{\overset{(2, 1, 26)}{\leq} \Big(1 - \frac{2}{\gamma} \cdot \frac{\mu L}{\mu + L} + \mu^{2} \Big(\frac{1}{\gamma^{2}} - \frac{2}{\gamma} \cdot \frac{1}{\mu + L} \Big) \Big) r_{k}^{2} = \Big(1 - \frac{\mu}{\gamma} \Big)^{2} r_{k}^{2}.\quad \sqsubsetneqq} \end{array}
$$

Thus, for the minimal value of the scaling parameter $\textstyle \gamma ={\frac{L + \mu}{2}}$ , method (2.2.60) has the same rate of convergence as for the unconstrained scheme (2.1.37):

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel \leq \left(\frac{L - \mu}{L + \mu} \right)^{k} \parallel{} x_{0} - x^{*} \parallel.} \end{array}\tag{2.2.62}
$$

Consider now the optimal schemes. We give only a sketch of their justification since it is very similar to the analysis of Sect. 2.2.1.

First of all, we define the estimating sequences. Assume that $x_{0} \in{Q}$ . Define

$$
\begin{array}{rl} &{\phi_{0}(x) = f(x_{0}) + \frac{\gamma_{0}}{2} \parallel x - x_{0} \parallel^{2},} \\ &{\phi_{k + 1}(x) =(1 - \alpha_{k}) \phi_{k}(x) + \alpha_{k}[f(x_{Q}(y_{k}; L)) + \frac{1}{2L} \parallel g_{Q}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \langle g_{Q}(y_{k}; L), x - y_{k} \rangle + \frac{\mu}{2} \parallel x - y_{k} \parallel^{2}], \quad k \geq 0.} \end{array}
$$

Note that the recursive rule for updating the estimating functions $\phi_{k}(\cdot)$ has changed. The reason is that now we have to use inequality (2.2.57) instead of (2.1.20). However, this modification does not change the functional terms in the recursion, only the constant terms are affected. Therefore, it is possible to keep all complexity results of Sect. 2.2.1.

It is easy to see that the estimating sequence $\{\phi_{k}(x \cdot)\}$ can be represented in the canonical form

$$
\begin{array}{r}{\phi_{k}(x) = \phi_{k}^{*} + \frac{\gamma_{k}}{2} \parallel x - v_{k} \parallel^{2},} \end{array}
$$

with the following recursive rules for $\gamma_{k}, v_{k}$ and $\phi_{k}^{*}$ :

$$
\gamma_{k + 1} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu,
$$

$$
\begin{array}{r}{v_{k + 1} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} g_{Q}(y_{k}; L)],} \end{array}
$$

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} =(1 - \alpha_{k}) \phi_{k}^{*} + \alpha_{k} f(x_{\mathscr{Q}}(y_{k}; L)) + \left(\frac{\alpha_{k}}{2L} - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \right) \parallel g_{\mathscr{Q}}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \left(\frac{\mu}{2} \parallel y_{k} - v_{k} \parallel^{2} + \langle g_{\mathscr{Q}}(y_{k}; L), v_{k} - y_{k} \rangle \right).} \end{array}
$$

Further, assuming that $\phi_{k}^{*} \geq f(x_{k})$ and using the inequality

$$
\begin{array}{rl}{f(x_{k}) \overset{(2.2.57)}{\geq} f(x_{Q}(y_{k}; L)) + \langle g_{Q}(y_{k}; L), x_{k} - y_{k} \rangle} &{} \\{\quad} &{} \\{\quad} &{+ \frac{1}{2L} \parallel g_{Q}(y_{k}; L) \parallel^{2} + \frac{\mu}{2} \parallel x_{k} - y_{k} \parallel^{2}],} \end{array}
$$

we come to the following lower bound:

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} \geq(1 - \alpha_{k}) f(x_{k}) + \alpha_{k} f(x_{Q}(y_{k}; L)) + \left(\frac{\alpha_{k}}{2L} - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \right) \parallel g_{Q}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \langle g_{Q}(y_{k}; L), v_{k} - y_{k} \rangle} \\ &{\geq f(x_{Q}(y_{k}; L)) + \left(\frac{1}{2L} - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \right) \parallel g_{Q}(y_{k}; L) \parallel^{2}} \\ &{\qquad +(1 - \alpha_{k}) \langle g_{Q}(y_{k}; L), \frac{\alpha_{k} \gamma_{k}}{\gamma_{k + 1}}(v_{k} - y_{k}) + x_{k} - y_{k} \rangle.} \end{array}
$$

Thus, again we can choose

$$
x_{k + 1} = x_{Q}(y_{k}; L),
$$

$$
L \alpha_{k}^{2} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu \equiv \gamma_{k + 1},
$$

$$
\begin{array}{r}{y_{k} = \frac{1}{\gamma_{k} + \alpha_{k} \mu}(\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k}).} \end{array}
$$

Let us write down the corresponding variant of scheme (2.2.20).

## Constant Step Scheme II for Simple Set

0. Choose $x_{0} \in \mathbb{R}^{n}$ and $\begin{array}{r}{\alpha_{0} \in \left[\sqrt{q_{f}}, \frac{2(3 + q_{f})}{3 + \sqrt{21 + 4q}} \right]} \end{array}$ . Set $y_{0} =$ $x_{0}$

1. kth iteration $(k \geq 0)$

(a) Compute $f(y_{k})$ and $\nabla f(y_{k})$ . Set $x_{k + 1} = x_{\mathcal{Q}}(y_{k}; L)$

(2.2.63)

(b) Compute $\alpha_{k + 1} \in(0, 1)$ from the equation

$$
\alpha_{k + 1}^{2} =(1 - \alpha_{k + 1}) \alpha_{k}^{2} + q_{f} \alpha_{k + 1}.
$$

$$
\begin{array}{r}{\operatorname{Set} \beta_{k} = \frac{\alpha_{k}(1 - \alpha_{k})}{\alpha_{k}^{2} + \alpha_{k + 1}} \operatorname{and} y_{k + 1} = x_{k + 1} + \beta_{k}(x_{k + 1} - x_{k}).} \end{array}
$$

The rate of convergence of this method is given by Theorem 2.2.3. Note that only the points $\{x_{k}\}$ are feasible for $Q.$ . The sequence $\{y_{k}\}$ is used for computing the gradient mapping and it may be infeasible.

## 2.3 The Minimization Problem with Smooth Components

(Minimax problems: Gradient Mapping, Gradient Method, Optimal Methods; Problem with functional constraints; Methods for Constrained Minimization.)

## 2.3.1 The Minimax Problem

Very often, the objective function in optimization problems is composed of several functional components. For example, the reliability of a complex system is usually defined as the minimal reliability of its parts. A constrained minimization problem with functional constraints also provides us with an example of the interaction of several nonlinear functions, etc.

The simplest problem of this type is called the (discrete) minimax problem. In this section, we consider the following smooth minimax problem:

$$
\operatorname{min}_{x \in Q} \left[f(x) = \operatorname{max}_{1 \leq i \leq m} f_{i}(x) \right],\tag{2.3.1}
$$

where $f_{i} \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n}, \| \cdot \|), i = 1...m$ , and $Q$ is a closed convex set. We call the function $f$ a max-type function composed of components $f_{i}(x)$ . We write $f \in$ $\mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n}, \| \cdot \|)$ if all components of the function $f$ belong to this class.

Note that in general, $f$ is not differentiable. However, provided that all $f_{i}$ are differentiable functions, we can introduce an object, which behaves exactly as a linear approximation of the differentiable function.

Definition 2.3.1 Let $f$ be a max-type function:

$$
f(x) = \operatorname{max}_{1 \leq i \leq m} \f_{i}(x).
$$

The function

$$
f({\bar{x}}; x) = \operatorname{max}_{1 \leq i \leq m}[f_{i}({\bar{x}}) + \langle \nabla f_{i}({\bar{x}}), x -{\bar{x}} \rangle],
$$

is called the linearization of $f$ at the point x.

Compare the following result with inequalities (2.1.20) and (2.1.9).

Lemma 2.3.1 For any two points x and $\bar{x}$ in $\mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{f(x) \geq f(\bar{x}; x) + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2},} \end{array}\tag{2.3.2}
$$

$$
f(x) \leq f({\bar{x}}; x) +{\frac{L}{2}} \parallel x -{\bar{x}} \parallel^{2}.\tag{2.3.3}
$$

Proof Indeed, for all $i = 1, \ldots, m$ , we have

$$
\begin{array}{r}{f_{i}(x) \stackrel{(2.1.20)}{\geq} f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}.} \end{array}
$$

Taking the maximum of these inequalities in i, we get (2.3.2).

To prove (2.3.3), we use inequalities

$$
f_{i}(x) \overset{(2.1.9)}{\leq} f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{L}{2} \parallel x - \bar{x} \parallel^{2}, \quad i = 1, \ldots, m.
$$

Let us write down the optimality conditions for problem (2.3.1) (compare with Theorem 2.2.9).

Theorem 2.3.1 The point $x^{*} \in Q$ is an optimal solution to problem (2.3.1) if and only if for any $x \in Q$ we have

$$
f(x^{*}; x) \geq f(x^{*}; x^{*}) = f(x^{*}).\tag{2.3.4}
$$

Proof Indeed, if condition (2.3.4) holds, then

$$
f(x) \stackrel{(2.3.2)}{\geq} f(x^{*}; x) \geq f(x^{*}; x^{*}) = f(x^{*})
$$

for all $x \in Q$

Let $x^{*}$ be an optimal solution to (2.3.1). Assume that there exists an $x \in Q$ such that $f(x^{*}; x) < f(x^{*})$ . Consider the functions

$$
\phi_{i}(\alpha) = f_{i}(x^{*} + \alpha(x - x^{*})), \quad i = 1 \ldots m.
$$

Note that for all i, $1 \leq i \leq m$ , we have

$$
f_{i}(x^{*}) + \langle \nabla f_{i}(x^{*}), x - x^{*} \rangle < f(x^{*}) = \operatorname{max}_{1 \leq i \leq m} f_{i}(x^{*}).
$$

Therefore, either $\phi_{i}(0) \equiv f_{i}(x^{*}) < f(x^{*})$ , or

$$
\phi_{i}(0) = f(x^{*}), \quad \phi_{i}^{\prime}(0) = \langle \nabla f_{i}(x^{*}), x - x^{*} \rangle < 0.
$$

Thus, for α small enough, we have

$$
f_{i}(x^{*} + \alpha(x - x^{*})) = \phi_{i}(\alpha) < f(x^{*})
$$

for all $i, 1 \le i \le m$ . This is a contradiction.

Corollary 2.3.1 Let $x^{*}$ be a minimum of the max-type function $f(\cdot)$ on the set $Q.$ If f belongs to $\mathcal{S}_{\mu}^{1}(\mathbb{R}^{n}, \| \cdot \|)$ , then

$$
\begin{array}{r}{f(x) \geq f(x^{*}) + \frac{\mu}{2} \parallel x - x^{*} \parallel^{2}} \end{array}
$$

for all $x \in Q$

Proof Indeed, in view of (2.3.2) and Theorem 2.3.1, for any $x \in Q$ , we have

$$
\begin{array}{c}{f(x) \geq f(x^{*}; x) + \frac{\mu}{2} \parallel x - x^{*} \parallel^{2} \geq \f(x^{*}; x^{*}) + \frac{\mu}{2} \parallel x - x^{*} \parallel^{2}} \\{{}} \\{= f(x^{*}) + \frac{\mu}{2} \parallel x - x^{*} \parallel^{2}.} \end{array}
$$

Finally, let us prove an existence theorem.

Theorem 2.3.2 Let the max-type function f belong to the class $\mathcal{S}_{\mu}^{1}(\mathbb{R}^{n}, \| \cdot \|)$ with $\mu > 0,$ , and $Q$ be a closed convex set. Then there exists a unique optimal solution $x^{*}$ to problem (2.3.1).

Proof Let $\bar{x} \in Q$ . Consider the set $\bar{Q} = \{x \in Q \mid f(x) \leq f(\bar{x})\}$ . Note that the problem (2.3.1) is equivalent to the following problem:

$$
\operatorname{min} \{f(x) \mid x \in{\bar{Q}}\}.\tag{2.3.5}
$$

However, the set $\bar{Q}$ is bounded: for any $x \in{\bar{Q}}$ we have

$$
\begin{array}{r}{f(\bar{x}) \geq f_{i}(x) \overset{(2.1.20)}{\geq} f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}, \quad i = 1, \ldots, m.} \end{array}
$$

Consequently,

$$
\begin{array}{r}{\frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}{\le} \parallel \nabla f_{i}(\bar{x}) \parallel_{*} \cdot \parallel x - \bar{x} \parallel + f(\bar{x}) - f_{i}(\bar{x}), \quad i = 1, \ldots, m.} \end{array}
$$

Thus, the solution $x^{*}$ of (2.3.5) (and of (2.3.1)) exists.

If $x_{1}^{*}$ is another solution to (2.3.1), then

$$
\begin{array}{r}{f({\boldsymbol x}^{*}) = f({\boldsymbol x}_{1}^{*}) \overset{(2.3.2)}{\geq} f({\boldsymbol x}^{*};{\boldsymbol x}_{1}^{*}) + \frac{\mu}{2} \parallel x_{1}^{*} -{\boldsymbol x}^{*} \parallel^{2} \overset{(2.3.4)}{\geq} f({\boldsymbol x}^{*}) + \frac{\mu}{2} \parallel x_{1}^{*} -{\boldsymbol x}^{*} \parallel^{2}.} \end{array}
$$

Therefore, $x_{1}^{*} = x^{*}$ □

## 2.3.2 Gradient Mapping

In Sect. 2.2.4, we introduced the reduced gradient, which replaces the usual gradient for a constrained minimization problem over a simple set. Since linearization of a max-type function behaves similarly to the linearization of a smooth function, we can adapt this notion to our particular situation. Up to the end of this chapter, we will be working with the standard Euclidean norm.

Let us fix some $\gamma > 0$ and point ${\bar{x}} \in \mathbb{R}^{n}$ . For a max-type function $f_{:}$ , define

$$
f_{\gamma}(\bar{x}; x) = f(\bar{x}; x) +{\textstyle \frac{\gamma}{2}} \parallel x - \bar{x} \parallel^{2}.
$$

The following definition is an extension of Definition 2.2.3.

Definition 2.3.2 Define

$$
f^{*}({\bar{x}}; \gamma) = \operatorname{min}_{x \in Q} f_{\gamma}({\bar{x}}; x),
$$

$$
x_{f}(\bar{x}; \gamma) = \arg \operatorname{min}_{x \in Q} f_{\gamma}(\bar{x}; x),
$$

$$
g_{f}(\bar{x}; \gamma) = \gamma(\bar{x} - x_{f}(\bar{x}; \gamma)).
$$

We call $x_{f}(x; \gamma)$ the Gradient Mapping and $g_{f}(\bar{x}; \gamma)$ the Reduced Gradient of a max-type function $f$ on $Q$

For $m = 1$ , this definition is equivalent to Definition 2.2.3. Note that the point of linearization x does not necessarily belong to Q. At the same time, now the point $x_{f}(\bar{x}; \gamma)$ cannot be interpreted as a projection (2.2.55).

It is clear that $f_{\gamma}({\bar{x}}; \cdot)$ is a max-type function composed by the components

$$
\begin{array}{r}{f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2} \in \mathcal{S}_{\gamma, \gamma}^{1, 1}(\mathbb{R}^{n}), \quad i = 1 \ldots m.} \end{array}
$$

Therefore, the gradient mapping is well defined (see Theorem 2.3.2).

Let us now prove the main result of this section, which highlights the similarity between the properties of the Gradient Mapping and the properties of the reduced gradient (compare with Theorem 2.2.13).

Theorem 2.3.3 For all $x \in Q, \gamma \geq L$ , and ${\bar{x}} \in \mathbb{R}^{n}$ , we have

$$
f(\bar{x}; x) \geq f^{*}(\bar{x}; \gamma) + \langle g_{f}(\bar{x}; \gamma), x - \bar{x} \rangle + \frac{1}{2 \gamma} \parallel g_{f}(\bar{x}; \gamma) \parallel^{2}.\tag{2.3.6}
$$

Proof Let $x_{f} = x_{f}(\bar{x}; \gamma), g_{f} = g_{f}(\bar{x}; \gamma)$ . It is clear that $f_{\gamma}(\bar{x}; \cdot) \in \mathcal{S}_{\gamma, \gamma}^{1, 1}(\mathbb{R}^{n})$ and it is a max-type function. Therefore, all results of the previous section can also be applied to the function $f_{\gamma}$

Since $x_{f} = \arg \operatorname{min}_{x \in Q} \f_{\gamma}({\bar{x}}; x)$ , in view of Corollary 2.3.1 and Theorem 2.3.1, we have

$$
\begin{array}{rl} &{f(\bar{x}; x) = f_{\gamma}(\bar{x}; x) - \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2}} \\ &{\qquad \geq f_{\gamma}(\bar{x}; x_{f}) + \frac{\gamma}{2}(\parallel x - x_{f} \parallel^{2} - \parallel x - \bar{x} \parallel^{2})} \\ &{\qquad \geq f^{*}(\bar{x}; \gamma) + \frac{\gamma}{2} \langle \bar{x} - x_{f}, 2x - x_{f} - \bar{x} \rangle} \\ &{\qquad = f^{*}(\bar{x}; \gamma) + \frac{\gamma}{2} \langle \bar{x} - x_{f}, 2(x - \bar{x}) + \bar{x} - x_{f} \rangle} \\ &{\qquad = f^{*}(\bar{x}; \gamma) + \langle g_{f}, x - \bar{x} \rangle + \frac{1}{2 \gamma} \parallel g_{f} \parallel^{2}.\quad \parallel} \end{array}
$$

In what follows, we often use the following corollary to Theorem 2.3.3.

Corollary 2.3.2 Let $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ and $\gamma \geq L$ . Then:

1. For any $x \in Q$ and $\bar{x} \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{f(x) \geq f(x_{f}(\bar{x}; \gamma)) + \langle g_{f}(\bar{x}; \gamma), x - \bar{x} \rangle + \frac{1}{2 \gamma} \parallel g_{f}(\bar{x}; \gamma) \parallel^{2} + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}} \end{array}\tag{2.3.7}
$$

2. $H \bar{x} \in Q$ , then

$$
\begin{array}{r}{f(x_{f}(\bar{x}; \gamma)) \leq f(\bar{x}) - \frac{1}{2 \gamma} \parallel g_{f}(\bar{x}; \gamma) \parallel^{2}.} \end{array}\tag{2.3.8}
$$

3. For any ${\bar{x}} \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{\langle g_{f}(\bar{x}; \gamma), \bar{x} - x^{*} \rangle \geq \frac{1}{2 \gamma} \parallel g_{f}(\bar{x}; \gamma) \parallel^{2} + \frac{\mu}{2} \parallel x^{*} - \bar{x} \parallel^{2}.} \end{array}\tag{2.3.9}
$$

Proof Assumption $\gamma \geq L$ implies that $f^{*}({\bar{x}}; \gamma) \geq f(x_{f}({\bar{x}}; \gamma))$ . Therefore, (2.3.7) follows from (2.3.6) since

$$
f(x) \geq f({\bar{x}}; x) +{\textstyle{\frac{\mu}{2}}} \parallel x -{\bar{x}} \parallel^{2}
$$

for all $x \in \mathbb{R}^{n}$ (see Lemma 2.3.1).

Using (2.3.7) with $x \ = \ \bar{x}$ , we get (2.3.8), and using (2.3.7) with $x = x^{*}$ , we get (2.3.9) since $f(x_{f}(\bar{x}; \gamma)) - f(x^{*}) \geq 0.$ □

Finally, let us estimate the variation of the optimal value $f^{*}({\bar{x}}; \gamma)$ as a function of $\gamma$

Lemma 2.3.2 For any $\gamma_{1}, \gamma_{2} > 0$ , and ${\bar{x}} \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{f^{*}(\bar{x}; \gamma_{2}) \geq f^{*}(\bar{x}; \gamma_{1}) + \frac{\gamma_{2} - \gamma_{1}}{2 \gamma_{1} \gamma_{2}} \parallel g_{f}(\bar{x}; \gamma_{1}) \parallel^{2}.} \end{array}
$$

Proof Let $x_{i} = x_{f}(\bar{x}; \gamma_{i}), g_{i} = g_{f}(\bar{x}; \gamma_{i}), i = 1, 2$ . In view of (2.3.6), we have

$$
\begin{array}{rl} &{f(\bar{x}; x) + \frac{\gamma_{2}}{2} \parallel x - \bar{x} \parallel^{2} \geq f^{*}(\bar{x}; \gamma_{1}) + \langle g_{1}, x - \bar{x} \rangle} \\ &{\qquad + \frac{1}{2 \gamma_{1}} \parallel g_{1} \parallel^{2} + \frac{\gamma_{2}}{2} \parallel x - \bar{x} \parallel^{2}} \end{array}\tag{2.3.10}
$$

for all $x \in Q$ . In particular, for $x = x_{2}$ we obtain

$$
\begin{array}{rlr}{f^{*}(\bar{x}; \gamma_{2}) = f(\bar{x}; x_{2}) + \frac{\gamma_{2}} 2 \parallel x_{2} - \bar{x}} &{\parallel^{2}} & \\{\quad} &{\geq f^{*}(\bar{x}; \gamma_{1}) + \langle g_{1}, x_{2} - \bar{x} \rangle + \frac{1}{2 \gamma_{1}} \parallel g_{1} \parallel^{2} + \frac{\gamma_{2}} 2 \parallel x_{2} - \bar{x} \parallel^{2}} & \\{\quad} &{= f^{*}(\bar{x}; \gamma_{1}) + \frac{1}{2 \gamma_{1}} \parallel g_{1} \parallel^{2} - \frac{1}{\gamma_{2}} \langle g_{1}, g_{2} \rangle + \frac{1}{2 \gamma_{2}} \parallel g_{2} \parallel^{2}} & \\{\quad} &{\geq f^{*}(\bar{x}; \gamma_{1}) + \frac{1}{2 \gamma_{1}} \parallel g_{1} \parallel^{2} - \frac{1}{2 \gamma_{2}} \parallel g_{1} \parallel^{2}.} &{\triangleq} &{\perp} \end{array}
$$

## 2.3.3 Minimization Methods for the Minimax Problem

As usual, we start the presentation of numerical methods for problem (2.3.1) with a variant of the Gradient Method with constant step.

Gradient Method for Minimax Problem   
0. Choose $x_{0} \in Q$ and $h > 0.$   
1. kth iteration $(k \geq 0)$   
x<sub>k 1</sub> x<sub>k</sub> hg<sub>f</sub> (x<sub>k</sub> L).

(2.3.11)

Theorem 2.3.4 Let $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ . If in method (2.3.11) we choose $\begin{array}{r}{h \le \frac{1}{L}} \end{array}$ , then it forms a feasible sequence of points such that

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel^{2} \leq(1 - \mu h)^{k} \parallel x_{0} - x^{*} \parallel^{2}, \quad k \geq 0.} \end{array}
$$

Proof Let $r_{k} = \parallel{} x_{k} - x^{*} \parallel{}$ and $g_{k} = g_{f}(x_{k}; L)$ . Then, in view of (2.3.9), we have

$$
\begin{array}{rl} &{r_{k + 1}^{2} = \parallel x_{k} - x^{*} - hg_{k} \parallel^{2} ={r}_{k}^{2} - 2h \langle g_{k}, x_{k} - x^{*} \rangle + h^{2} \parallel g_{k} \parallel^{2}} \\ &{\qquad \leq(1 - h \mu) r_{k}^{2} + h \left(h - \frac{1}{L} \right) \parallel g_{k} \parallel^{2} \leq(1 - h \mu) r_{k}^{2}.} \end{array}
$$

Let $\alpha = hL \leq 1$ . Then $x_{k + 1} =(1 - \alpha) x_{k} + \alpha x_{f}(x_{k}, L) \in \mathcal{Q}.$ □

With the maximal step size $\begin{array}{r}{h = \frac{1}{L}} \end{array}$ , we have

$$
\begin{array}{r}{x_{k + 1} = x_{k} - \frac{1}{L} g_{f}(x_{k}; L) = x_{f}(x_{k}; L).} \end{array}
$$

For this step size, the rate of convergence of method (2.3.11) is as follows:

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel^{2} \leq \left(1 - \frac{\mu}{L} \right)^{k} \parallel{} x_{0} - x^{*} \parallel^{2}.} \end{array}
$$

As compared with Theorem 2.2.14, the Gradient Method for the minimax problem has a rate of convergence with a similar dependence on the condition number.

Let us check what we can say about the optimal methods. In order to develop an optimal scheme, we need to introduce estimating sequences with some recursive updating rules. Formally, the minimax problem differs from the unconstrained minimization problem only by the analytical form of the lower approximation of the objective function. In the case of unconstrained minimization, we use inequality (2.1.20) for updating the estimating sequence. Now we just replace it by the lower bound (2.3.7).

Let us introduce the estimating sequences for problem (2.3.1). We fix some point $x_{0} \in{\cal Q}$ and coefficient $\gamma _ { 0 } > 0 $ . Consider the sequences $\{y_{k}\} \subset \mathbb{R}^{n}$ and $\{\alpha_{k}\} \subset$ (0, 1). Define

$$
\begin{array}{r}{\phi_{0}(x) = f(x_{0}) + \frac{\gamma_{0}}{2} \parallel x - x_{0} \parallel^{2},} \end{array}
$$

$$
\begin{array}{rl} &{\phi_{k + 1}(x) =(1 - \alpha_{k}) \phi_{k}(x) + \alpha_{k}[\left[f(x_{f}(y_{k}; L)) + \frac{1}{2L} \parallel g_{f}(y_{k}; L) \parallel^{2} \right]} \\ &{~ + \langle g_{f}(y_{k}; L), x - y_{k} \rangle + \frac{\mu}{2} \parallel x - y_{k} \parallel^{2}].} \end{array}
$$

Comparing these relations with (2.2.4), we can see the difference only in the constant term (shown in the frame). In (2.2.4), we used $f(y_{k})$ in this position. This difference leads to a trivial modification of the results of Lemma 2.2.3: All appearances of $f(y_{k})$ must be formally replaced by the expression in the frame, and $\nabla f(y_{k})$ must be replaced by the reduced gradient $g_{f}(y_{k}; L)$ . Thus, we come to the following lemma.

Lemma 2.3.3 For all $k \geq 0$ we have

$$
\begin{array}{r}{\phi_{k}(x) \equiv \phi_{k}^{*} + \frac{\gamma_{k}}{2} \parallel x - v_{k} \parallel^{2},} \end{array}
$$

where the sequences $\{\gamma_{k}\}, \ \{v_{k}\}$ and $\{\phi_{k}^{*}\}$ are defined as $v_{0} = x_{0}, \phi_{0}^{*} = f(x_{0})$ , and

$$
\gamma_{k + 1} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu,
$$

$$
\begin{array}{r}{v_{k + 1} = \frac{1}{\gamma_{k + 1}}[(1 - \alpha_{k}) \gamma_{k} v_{k} + \alpha_{k} \mu y_{k} - \alpha_{k} g_{f}(y_{k}; L)],} \end{array}
$$

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} =(1 - \alpha_{k}) \phi_{k} + \alpha_{k}(f(x_{f}(y_{k}; L)) + \frac{1}{2L} \parallel g_{f}(y_{k}; L) \parallel^{2}) + \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \parallel g_{f}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \left(\frac{\mu}{2} \parallel y_{k} - v_{k} \parallel^{2} + \langle g_{f}(y_{k}; L), v_{k} - y_{k} \rangle \right).} \end{array}
$$

□

Now we can proceed exactly as in Sect. 2.2. Assume that $\begin{array}{rlr}{\phi_{k}^{*}} &{{} \ge} &{f(x_{k})} \end{array}$ Inequality (2.3.7) with $x = x_{k}$ and $\bar{x} = y_{k}$ becomes as follows:

$$
\begin{array}{rl} &{f(x_{k}) \geq f(x_{f}(y_{k}; L)) + \langle g_{f}(y_{k}; L), x_{k} - y_{k} \rangle + \frac{1}{2L} \parallel g_{f}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \frac{\mu}{2} \parallel x_{k} - y_{k} \parallel^{2}.} \end{array}
$$

Hence,

$$
\begin{array}{rl} &{\phi_{k + 1}^{*} \geq(1 - \alpha_{k}) f(x_{k}) + \alpha_{k} f(x_{f}(y_{k}; L)) + \left(\frac{\alpha_{k}}{2L} - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \right) \parallel g_{f}(y_{k}; L) \parallel^{2}} \\ &{\qquad + \frac{\alpha_{k}(1 - \alpha_{k}) \gamma_{k}}{\gamma_{k + 1}} \langle g_{f}(y_{k}; L), v_{k} - y_{k} \rangle} \\ &{\geq f(x_{f}(y_{k}; L)) + \left(\frac{1}{2L} - \frac{\alpha_{k}^{2}}{2 \gamma_{k + 1}} \right) \parallel g_{f}(y_{k}; L) \parallel^{2}} \\ &{\qquad +(1 - \alpha_{k}) \langle g_{f}(y_{k}; L), \frac{\alpha_{k} \gamma_{k}}{\gamma_{k + 1}}(v_{k} - y_{k}) + x_{k} - y_{k} \rangle.} \end{array}
$$

Thus, again we can choose

$$
\boldsymbol{x}_{k + 1} = \boldsymbol{x}_{f}(\boldsymbol{y}_{k}; L),
$$

$$
L \alpha_{k}^{2} =(1 - \alpha_{k}) \gamma_{k} + \alpha_{k} \mu \equiv \gamma_{k + 1},
$$

$$
\begin{array}{r}{y_{k} = \frac{1}{\gamma_{k} + \alpha_{k} \mu}(\alpha_{k} \gamma_{k} v_{k} + \gamma_{k + 1} x_{k}).} \end{array}
$$

Let us write down the resulting scheme in the form of (2.2.20), with eliminated sequences $\{v_{k}\}$ and $\{\gamma_{k}\}$

## Constant Step Scheme II for Minimax Problem

0. Choose $x_{0} \in \mathbb{R}^{n}$ and $\begin{array}{r}{\alpha_{0} \in \left[\sqrt{q_{f}}, \frac{2(3 + q_{f})}{3 + \sqrt{21 + 4q_{f}}} \right]} \end{array}$ . Set $y_{0} =$ $x_{0}.$

1. kth iteration $(k \geq 0)$

(a) Compute $\{f_{i}(y_{k})\}_{i = 1}^{m}$ and $\{\nabla f_{i}(y_{k})\}_{i = 1}^{m}$

(2.3.12)

Set $x_{k + 1} = x_{f}(y_{k}; L)$

(b) Compute $\alpha_{k + 1} \in(0, 1)$ from the equation

$$
\alpha_{k + 1}^{2} =(1 - \alpha_{k + 1}) \alpha_{k}^{2} + q_{f} \alpha_{k + 1}.
$$

$$
\begin{array}{r}{\operatorname{Set} \beta_{k} = \frac{\alpha_{k}(1 - \alpha_{k})}{\alpha_{k}^{2} + \alpha_{k + 1}} \operatorname{and} y_{k + 1} = x_{k + 1} + \beta_{k}(x_{k + 1} - x_{k}).} \end{array}
$$

The convergence analysis of this scheme is completely identical to the analysis used for scheme (2.2.20). Let us just give the final result.

Theorem 2.3.5 Let the max-type function f belong to $\mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ . If in the method (2.3.12) we take $\begin{array}{r}{\alpha_{0} \in \left[\sqrt{q_{f}}, \frac{2(3 + q_{f})}{3 + \sqrt{21 + 4q_{f}}} \right]} \end{array}$ , then

$$
\begin{array}{rl} &{f(x_{k}) - f^{*} \leq \frac{4 \mu \left[f(x_{0}) - f^{*} + \frac{\gamma_{0}}{2} \| x_{0} - x^{*} \|^{2} \right]}{(\gamma_{0} - \mu) \cdot \left[\exp \left(\frac{k + 1}{2} q_{f}^{1 / 2} \right) - \exp \left(- \frac{k + 1}{2} q_{f}^{1 / 2} \right) \right]^{2}}} \\ &{\qquad \leq \frac{4L}{(\gamma_{0} - \mu)(k + 1)^{2}} \left[f(x_{0}) - f^{*} + \frac{\gamma_{0}}{2} \parallel x_{0} - x^{*} \parallel^{2} \right],} \end{array}
$$

where $\begin{array}{r}{\gamma_{0} = \frac{\alpha_{0}(\alpha_{0} L - \mu)}{1 - \alpha_{0}}} \end{array}$ <sup>.</sup> <sub>$\square$</sub>

Note that the scheme (2.3.12) works for all $\mu \geq 0$ . Let us write down the method for solving problem (2.3.1) with strictly convex components.

```latex
Optimal Method for Minimax Problem with $f \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$
0. Choose $x_{0} \in Q.$ . Set $\begin{array}{r}{y_{0} = x_{0}, \beta = \frac{1 - \sqrt{q_{f}}}{1 + \sqrt{q_{f}}}.} \end{array}$
1. kth iteration $(k \geq 0)$
Compute $\{f_{i}(y_{k})\}$ and $\{\nabla f_{i}(y_{k})\}$ . Set $x_{k + 1} = x_{f}(y_{k}; L)$ and
y<sub>k 1</sub> x<sub>k 1</sub> β(x<sub>k 1</sub> x<sub>k</sub>).
```

(2.3.13)

Theorem 2.3.6 For scheme (2.3.13) we have

$$
f(x_{k}) - f^{*} \leq 2 \left(1 -{\sqrt{\frac{\mu}{L}}} \right)^{k}(f(x_{0}) - f^{*}).\tag{2.3.14}
$$

Proof Scheme (2.3.13) is a variant of (2.3.12) with $\begin{array}{r}{\alpha_{0} = \sqrt{\frac{\mu}{L}}} \end{array}$ . Under this choice, $\gamma_{0} = \mu$ and we get (2.3.14) from Theorem 2.3.5 since, in view of Corollary 2.3.1, ${\begin{array}{l}{{\frac{\mu}{2}} \parallel x_{0} - x^{*} \parallel^{2} \leq f(x_{0}) - f^{*}} \end{array}}$ □

To conclude this section, let us look at the auxiliary problem, which we need to solve for computing the Gradient Mapping of the minimax problem. Recall that this problem is as follows:

$$
\operatorname{min}_{x \in \mathcal{Q}} \left\{\operatorname{max}_{1 \leq i \leq m} \left[f_{i}(x_{0}) + \langle \nabla f_{i}(x_{0}), x - x_{0} \rangle \right] + \frac{\gamma}{2} \parallel x - x_{0} \parallel^{2} \right\}.
$$

Introducing an additional variable $t ~ \in ~ \mathbb{R}$ , we can rewrite this problem in the following form:

$$
\operatorname{min}_{{\boldsymbol x}, t}{\big \{} t +{\frac{\gamma}{2}}{\big \|}{\boldsymbol x} -{\boldsymbol x}_{0}{\big \|}^{2}{\big\}}
$$

$$
\begin{array}{r}{\mathrm{s.~ t.~} f_{i}(x_{0}) + \langle \nabla f_{i}(x_{0}), x - x_{0} \rangle \leq t, \i = 1 \ldots m,} \end{array}\tag{2.3.15}
$$

$$
x \in Q, t \in \mathbb{R},
$$

If $Q$ is a polytope, then the problem (2.3.15) is a quadratic optimization problem. Such a problem can be solved by some special finite methods (simplex-type algorithms). It can also be solved by Interior Point Methods (see Chap. 5). In the latter case, we can treat much more complicated structures of the basic feasible set $Q$

## 2.3.4 Optimization with Functional Constraints

Let us show that the methods of the previous section can be used to solve a constrained minimization problem with smooth functional constraints. Recall, that the analytical form of such a problem is as follows:

$$
\begin{array}{c}{\displaystyle \operatorname{min}_{x \in Q} f_{0}(x),} \\{\displaystyle} \\{\mathrm{s.t.} f_{i}(x) \leq 0, i = 1 \ldots m,} \end{array}\tag{2.3.16}
$$

where the functions $f_{i}$ are convex and smooth and $Q$ is a simple closed convex set. In this section, we assume that $f_{i} \in \mathcal{S}_{u.L}^{1, 1}(\mathbb{R}^{n}), i = 0 \dots m$ , with some $\mu > 0$

The relation between problem (2.3.16) and minimax problems is established by some special function of one variable. Consider the parametric max-type function

$$
f(t; x) = \operatorname{max} \{f_{0}(x) - t; f_{i}(x), i = 1 \ldots m\}, \quad t \in \mathbb{R}, \x \in Q.
$$

Let us introduce the auxiliary function

$$
f^{*}(t) = \operatorname{min}_{x \in Q} \f(t; x).\tag{2.3.17}
$$

Note that the components of the max-type function $f(t; \cdot)$ are strongly convex in $x.$ Therefore, for any $t ~ \in ~ \mathbb{R}$ , the solution of problem $(2.3.17), x^{*}(t)$ , exists and is unique in view of Theorem 2.3.2.

We will try to approach the solution of problem (2.3.16) by a process based on approximate values of the function $f^{*}(t)$ . This approach can be seen as a variant of Sequential Quadratic Optimization. It can also be applied to nonconvex problems.

Let us establish some properties of function $f^{*}(\cdot)$ . Clearly, this is a continuous function.

Lemma 2.3.4 $Lett^{*}$ be the optimal value of problem (2.3.16). Then

$$
f^{*}(t) \leq 0forallt \geq t^{*},
$$

$$
f^{*}(t) > 0forallt < t^{*}.
$$

Proof Let $x^{*}$ be the solution to problem (2.3.16). If $t \geq t^{*}$ , then

$$
f^{*}(t) \leq f(t; x^{*}) = \operatorname{max} \{f_{0}(x^{*}) - t; f_{i}(x^{*})\} \leq \operatorname{max} \{t^{*} - t; f_{i}(x^{*})\} \leq 0.
$$

Suppose that $t < t^{*}$ and $f^{*}(t) \leq 0$ . Then there exists a $y \in Q$ such that

$$
f_{0}(y) \leq t < t^{*}, \quad f_{i}(y) \leq 0, i = 1 \dots m.
$$

Hence, $t^{*}$ cannot be the optimal value of problem (2.3.16).

Thus, the smallest root of the function $f^{*}(\cdot)$ corresponds to the optimal value of problem (2.3.16). Note also that, using the methods of the previous section, we can only compute an approximation to the value $f^{*}(t)$ . Hence, our goal now is to form a process for finding this root, based on this inexact information. To do so, we need to establish some properties of the function $f^{*}(\cdot)$

Lemma 2.3.5 For any $\varDelta \geq 0,$ , we have

$$
f^{*}(t) - \varDelta \leq f^{*}(t + \varDelta) \leq f^{*}(t).
$$

Proof Indeed,

$$
\begin{array}{rl} &{f^{*}(t + \Delta) = \underset{x \in Q}{\operatorname{min}} \ \underset{1 \leq i \leq m}{\operatorname{max}} \left.f_{0}(x) - t - \Delta; f_{i}(x) \right.} \\ &{} \\ &{\qquad \leq \underset{x \in Q}{\operatorname{min}} \ \underset{1 \leq i \leq m}{\operatorname{max}} \left.f_{0}(x) - t; f_{i}(x) \right.= \f^{*}(t),} \end{array}
$$

$$
\begin{array}{rl} &{f^{*}(t + \varDelta) = \underset{x \in Q}{\operatorname{min}} \ \underset{1 \leq i \leq m}{\operatorname{max}} \left.f_{0}(x) - t; f_{i}(x) + \varDelta \right.- \varDelta} \\ &{} \\ &{\qquad \geq \underset{x \in Q}{\operatorname{min}} \ \underset{1 \leq i \leq m}{\operatorname{max}} \left.f_{0}(x) - t; f_{i}(x) \right.- \varDelta \ = \f^{*}(t) - \varDelta.\quad \sqcup} \end{array}
$$

In other words the function $f^{*}(\cdot)$ is decreasing and Lipschitz continuous with constant one.

Lemma 2.3.6 For any $t_{1} < t_{2}$ and $\varDelta \geq 0,$ , we have

$$
\begin{array}{r}{f^{*}(t_{1} - \varDelta) \geq f^{*}(t_{1}) + \varDelta \frac{f^{*}(t_{1}) - f^{*}(t_{2})}{t_{2} - t_{1}}.} \end{array}\tag{2.3.18}
$$

Proof Let $\begin{array}{r}{t_{0} = t_{1} - \varDelta, \alpha = \frac{\varDelta}{t_{2} - t_{0}} \equiv \frac{\varDelta}{t_{2} - t_{1} + \varDelta} \in[0, 1]} \end{array}$ . Then $t_{1} =(1 - \alpha) t_{0} + \alpha t_{2}$ and inequality (2.3.18) can be written as follows:

$$
f^{*}(t_{1}) \leq(1 - \alpha) f^{*}(t_{0}) + \alpha f^{*}(t_{2}).\tag{2.3.19}
$$

Let $x_{\alpha} =(1 - \alpha) x^{*}(t_{0}) + \alpha x^{*}(t_{2})$ . Then

$$
\begin{array}{rl}{f^{*}(t_{1})} &{\leq \ \underset{1 \leq t \leq m}{\operatorname{max}} \ \{f_{0}({\boldsymbol{\alpha}}_{\alpha}) - t_{1}; \hat{\boldsymbol{f}}_{i}({\boldsymbol{\alpha}}_{\alpha})\}} \\ &{\overset{(2, 1; 3)} \leq \ \underset{1 \leq t \leq m}{\operatorname{max}} \ \{(1 - \alpha)(f_{0}({\boldsymbol{\alpha}}^{*}(t_{0})) - t_{0}) + \alpha(f_{0}({\boldsymbol{\alpha}}^{*}(t_{2})) - t_{2});} \\ &{\overset{(3, 1; 4)} \leq \alpha(1 - \alpha) f_{i}({\boldsymbol{\alpha}}^{*}(t_{0})) + \alpha f_{i}({\boldsymbol{\alpha}}^{*}(t_{2}))\}} \\ &{\leq \(1 - \alpha) \underset{1 \leq t \leq m}{\operatorname{max}} \ \{f_{0}({\boldsymbol{\alpha}}^{*}(t_{0})) - t_{0}; \hat{\boldsymbol{f}}_{i}({\boldsymbol{\alpha}}^{*}(t_{0}))\}} \\ &{+ \alpha \underset{1 \leq t \leq m}{\operatorname{max}} \[f_{0}({\boldsymbol{\alpha}}^{*}(t_{2})) - t_{2}; \hat{\boldsymbol{f}}_{i}({\boldsymbol{\alpha}}^{*}(t_{2}))]} \\ &{= \(1 - \alpha) f^{*}(t_{0}) + \alpha f^{*}(t_{2}),} \end{array}
$$

and we get (2.3.18).

Note that Lemmas 2.3.5 and 2.3.6 are valid for any parametric max-type functions, not necessarily formed by the functional components of problem (2.3.16).

Let us now study the properties of Gradient Mapping for the parametric max-type function. Define a linearization of parametric max-type function $f(t; \cdot)$

$$
f(t; \bar{x}; x) = \operatorname{max}_{1 \leq i \leq m} \{f_{0}(\bar{x}) + \langle \nabla f_{0}(\bar{x}), x - \bar{x} \rangle - t; f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle\}.
$$

Now we can introduce a Gradient Mapping in the usual way. Let us fix some $\gamma > 0$ Define

$$
\begin{array}{r}{f_{\gamma}(t; \bar{x}; x) = f(t; \bar{x}; x) + \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2},} \end{array}
$$

$$
f^{*}(t; \bar{x}; \gamma) = \operatorname{min}_{x \in Q} \f_{\gamma}(t; \bar{x}; x),
$$

$$
x_{f}(t; \bar{x}; \gamma) = \arg \operatorname{min}_{x \in Q} f_{\gamma}(t; \bar{x}; x),
$$

$$
g_{f}(t; \bar{x}; \gamma) = \gamma(\bar{x} - x_{f}(t; \bar{x}; \gamma)).
$$

We call $x_{f}(t; \bar{x}; \gamma)$ the Constrained Gradient Mapping, and $g_{f}(t; \bar{x}, \gamma)$ the Constrained Reduced Gradient of problem (2.3.16). As usual, the point of linearization x is not necessarily feasible for Q.

Note that the function $f_{\gamma}(t;{\bar{x}}; \cdot)$ itself is a max-type function composed of the components

$$
f_{0}(\bar{x}) + \langle \nabla f_{0}(\bar{x}), x - \bar{x} \rangle - t + \textstyle \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2},
$$

$$
\begin{array}{r}{f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\gamma}{2} \parallel x - \bar{x} \parallel^{2}, i = 1 \ldots m.} \end{array}
$$

Moreover, $f_{\gamma}(t; \bar{x}; \cdot) \ \in \ \mathcal{S}_{\gamma, \gamma}^{1, 1}(\mathbb{R}^{n})$ . Therefore, in view of Theorem 2.3.2, the Constrained Gradient Mapping is well defined for any $t \in \mathbb{R}$

Since $f(t; \cdot) \in \mathcal{S}_{\mu, L}^{1, 1}(\mathbb{R}^{n})$ , we have

$$
f_{\mu}(t; \bar{x}; x) \overset{(2.3.2)}{\leq} f(t; x) \overset{(2.3.3)}{\leq} f_{L}(t; \bar{x}; x)
$$

for all $x \in \mathbb{R}^{n}$ . Therefore

$$
f^{*}(t; \bar{x}; \mu) \leq f^{*}(t) \ \leq \f^{*}(t; \bar{x}; L).
$$

Moreover, using Lemma 2.3.6, we obtain the following result.

For any $\bar{x} \in \mathbb{R}^{n}, \gamma > 0, \Delta \geq 0$ and $t_{1} < t_{2}$ and we have

$$
\begin{array}{r}{f^{*}(t_{1} - \varDelta; \bar{x}; \gamma) \geq f^{*}(t_{1}; \bar{x}; \gamma) + \frac{\varDelta}{t_{2} - t_{1}}(f^{*}(t_{1}; \bar{x}; \gamma) - f^{*}(t_{2}; \bar{x}; \gamma)).} \end{array}\tag{2.3.20}
$$

There are two values, $\gamma = L$ and $\gamma = \mu$ , which are important for us. Applying Lemma 2.3.2 to the max-type function $f_{\gamma}(t; \bar{x}; x)$ with $\gamma_{1} = L$ and $\gamma_{2} = \mu$ , we get the following inequality:

$$
\begin{array}{r}{f^{*}(t; \bar{x}; \mu) \ge f^{*}(t; \bar{x}; L) - \frac{L - \mu}{2 \mu L} \parallel g_{f}(t; \bar{x}; L) \parallel^{2}.} \end{array}\tag{2.3.21}
$$

Since we are interested in finding a root of the function $f^{*}(\cdot)$ , let us look first at the roots of the function $f^{*}(\cdot; \bar{x}; \gamma)$ , which can be seen as an approximation to $f^{*}(\cdot)$

Define

$$
t^{*}(\bar{x}, t) = \mathrm{root}_{t}(f^{*}(t; \bar{x}; \mu))
$$

(the notation $\mathrm{root}_{t}(\cdot)$ corresponds to the root in t of the function ( )).

Lemma 2.3.7 Let ${\bar{x}} \in \mathbb{R}^{n}$ and $\bar{t} < t^{*}$ be such that

$$
f^{*}(\bar{t}; \bar{x}; \mu) \ge(1 -{\varkappa}) f^{*}(\bar{t}; \bar{x}; L)
$$

for some $\varkappa \in(0, 1)$ . Then $\bar{t} < t^{*}(\bar{x}, \bar{t}) \leq t^{*}$ . Moreover, for any $t < \bar{t}$ and $x \in \mathbb{R}^{n}$ we have

$$
\begin{array}{r}{f^{*}(t; x; L) \geq 2(1 - \varkappa) f^{*}(\bar{t}; \bar{x}; L) \sqrt{\frac{\bar{t} - t}{t^{*}(\bar{x}, \bar{t}) - \bar{t}}}.} \end{array}
$$

Proof Since $\bar{t} < t^{*}$ , we have

$$
\begin{array}{r}{0 < f^{*}(\bar{t}) \le f^{*}(\bar{t}; \bar{x}; L) \le \frac{1}{1 - x} f^{*}(\bar{t}; \bar{x}; \mu).} \end{array}
$$

Thus, $f^{*}(\bar{t}; \bar{x}; \mu) > 0$ and, since $f^{*}(\cdot; \bar{x}; \mu)$ is decreasing, we get

$$
t^{*}({\bar{x}},{\bar{t}}) >{\bar{t}}.
$$

Let $\varDelta = \bar{t} - t$ . Then, in view of inequality (2.3.20), we have

$$
\begin{array}{rl} &{f^{*}(t; x; L) \geq f^{*}(t) \geq f^{*}(\bar{t}; \bar{x}; \mu) \geq f^{*}(\bar{t}; \bar{x}; \mu) + \frac{\Delta}{t^{*}(\bar{x}, \bar{t}) - \bar{t}} f^{*}(\bar{t}; \bar{x}; \mu)} \\ &{\qquad \geq(1 - x) \left(1 + \frac{\Delta}{t^{*}(\bar{x}, \bar{t}) - \bar{t}} \right) f^{*}(\bar{t}; \bar{x}; L)} \\ &{\qquad \geq 2(1 - x) f^{*}(\bar{t}; \bar{x}; L) \sqrt{\frac{\Delta}{t^{*}(\bar{x}, \bar{t}) - \bar{t}}}.} \end{array}
$$

In the last inequality, we use the relation $1 + \tau \geq 2 \sqrt{\tau}, \tau \geq 0$ □

## 2.3.5 The Method for Constrained Minimization

Now we are ready to analyze the following process.

Constrained Minimization Scheme   
0. Choose $x_{0} \in Q, x \in(0, \frac{1}{2}), t_{0} < t^{*}$ , and accuracy $\epsilon > 0.$   
1. kth iteration $(k \geq 0)$   
(a) Generate the sequence $\{x_{k, j}\}$ by method (2.3.13) as   
applied to $f(t_{k}; \cdot)$ with starting point $x_{k, 0} = x_{k}$ . If   
$f^{*}(t_{k}; x_{k, j}; \mu) \ge(1 - \varkappa) f^{*}(t_{k}; x_{k, j}; L),$   
then stop the internal process and set $j ( k ) = j $   
$j^{*}(k) = \arg \operatorname{min}_{0 \leq j \leq j(k)} \f^{*}(t_{k}; x_{k, j}; L),$   
$x_{k + 1} = x_{f}(t_{k}; x_{k, j^{*}(k)}; L).$   
Global Stop: $f^{*}(t_{k}; x_{k, j}; L) \le \epsilon$ at some iteration of   
the internal scheme.   
(b) Set $t_{k + 1} = t^{*}(x_{k, j(k)}, t_{k}).$

(2.3.22)

This is the first time in this book we have met a two-level process. Clearly, its analysis is more complicated. Firstly, we need to estimate the rate of convergence of the upper-level process in (2.3.22) (called the Master Process). Secondly, we need to estimate the total complexity of the internal processes in Step 1(a). Since we are interested in the analytical complexity of this method, the arithmetical cost of computation of the root $t^{*}(x, t)$ and optimal value $f^{*}(t; x, \gamma)$ is not important for us now.

Let us describe the convergence of the Master Process.

## Lemma 2.3.8

$$
\begin{array}{r}{f^{*}(t_{k}; x_{k + 1}; L) \le \frac{t^{*} - t_{0}}{1 - \varkappa} \left[\frac{1}{2(1 - \varkappa)} \right]^{k}.} \end{array}
$$

Proof Let $\begin{array}{r}{\beta = \frac{1}{2(1 - \varkappa)} \left(< 1 \right)} \end{array}$ and

$$
\begin{array}{r}{\delta_{k} = \frac{f^{*}(t_{k}; x_{k, j(k)}; L)}{\sqrt{t_{k + 1} - t_{k}}}.} \end{array}
$$

Since $t_{k + 1} = t^{*}(x_{k, j(k)}, t_{k})$ , in view of Lemma 2.3.7, for $k \geq 1$ we have

$$
\begin{array}{r}{2(1 - \varkappa) \frac{f^{*}(t_{k}; x_{k, j(k)}; L)}{\sqrt{t_{k + 1} - t_{k}}} \leq \frac{f^{*}(t_{k - 1}; x_{k - 1, j(k - 1)}; L))}{\sqrt{t_{k} - t_{k - 1}}}.} \end{array}
$$

Thus, $\delta_{k} \le \beta \delta_{k - 1}$ and we obtain

$$
\begin{array}{rl} &{f^{*} \big(t_{k}; x_{k, j(k)}; L \big) = \delta_{k} \sqrt{t_{k + 1} - t_{k}} \ \le \ \beta^{k} \delta_{0} \sqrt{t_{k + 1} - t_{k}}} \\ &{} \\ &{\quad \quad \quad = \beta^{k} f^{*} \big(t_{0}; x_{0, j(0)}; L \big) \sqrt{\frac{t_{k + 1} - t_{k}}{t_{1} - t_{0}}}.} \end{array}
$$

Further, in view of Lemma 2.3.5, we have $t_{1} - t_{0} \geq f^{*}(t_{0}; x_{0, j(0)}; \mu)$ . Hence,

$$
\begin{array}{rl} &{f^{*}(t_{k}; x_{k, j(k)}; L) \leq \beta^{k} f^{*}(t_{0}; x_{0, j(0)}; L) \sqrt{\frac{t_{k + 1} - t_{k}}{f^{*}(t_{0}; x_{0, j(0)}; \mu)}}} \\ &{\qquad \leq \frac{\beta^{k}}{1 - x} \sqrt{f^{*}(t_{0}; x_{0, j(0)}; \mu)(t_{k + 1} - t_{k})}} \\ &{\qquad \leq \frac{\beta^{k}}{1 - x} \sqrt{f^{*}(t_{0})(t^{*} - t_{0})}.} \end{array}
$$

It remains to note that $f^{*}(t_{0}) \leq t^{*} - t_{0}$ (see Lemma 2.3.5), and

$$
f^{*}(t_{k}; x_{k + 1}; L) \equiv f^{*}(t_{k}; x_{k, j^{*}(k)}; L) \le f^{*}(t_{k}; x_{k, j(k)}; L).
$$

The above result provides us with an estimate for the number of upper-level iterations, which we need for finding an $\epsilon$-solution to problem (2.3.16). Indeed, let $f^{*}(t_{k}; x_{k, j}; L) \le \epsilon$ . Then for $x_{*} = x_{f}(t_{k}; x_{k, j}; L)$ , we have

$$
f(t_{k}; x_{*}) = \operatorname{max}_{1 \leq i \leq m} \{f_{0}(x_{*}) - t_{k}; f_{i}(x_{*})\} \leq f^{*}(t_{k}; x_{k, j}; L) \leq \epsilon.
$$

Since $t_{k} \leq t^{*}$ , we conclude that

$$
\begin{array}{l}{f_{0}(x_{*}) \leq t^{*} + \epsilon,} \\{\} \\{f_{i}(x_{*}) \leq \epsilon, i = 1 \ldots m.} \end{array}\tag{2.3.23}
$$

In view of Lemma 2.3.8, we can get (2.3.23) at most in

$$
\begin{array}{r}{N(\epsilon) = \frac{1}{\ln[2(1 - \epsilon)]} \ln \frac{t^{*} - t_{0}}{(1 - \epsilon) \epsilon}} \end{array}\tag{2.3.24}
$$

full iterations of the master process (the last iteration of the process, in general, is not full since it is terminated by the Global Stop rule). Note that in estimate (2.3.24), $\varkappa$ is an absolute constant (for example, $\varkappa = \frac{1}{4})$ .

Let us analyze the complexity of the internal process. Assume that the sequence $\{x_{k, j}\}$ is generated by (2.3.13) starting from the point $x_{k, 0} ~ = ~ x_{k}$ . In view of Theorem 2.3.6, we have

$$
\begin{array}{rl} &{f(t_{k}; x_{k, j}) - f^{*}(t_{k}) \leq 2 \left(1 - \sqrt{q_{f}} \right)^{j} \left(f(t_{k}; x_{k}) - f^{*}(t_{k}) \right)} \\ &{} \\ &{\qquad \leq 2e^{- \sigma \cdot j}(f(t_{k}; x_{k}) - f^{*}(t_{k})) \leq 2e^{- \sigma \cdot j} f(t_{k}; x_{k}),} \end{array}
$$

where $\sigma{\stackrel{\mathrm{def}}{=}}{\sqrt{q_{f}}}$ . Recall that $\begin{array}{r}{Q_{f} = \frac{1}{q_{f}} = \frac{L}{\mu}} \end{array}$

Let N be the number of full iterations of process $(2.3.22) \left(N \leq N(\epsilon) \right)$ . Thus, j (k) is well defined for all k, $0 \le k \le N$ . Note that $t_{k} = t^{*}(x_{k - 1, j(k - 1)}, t_{k - 1}) > t_{k - 1}$ Therefore

$$
f(t_{k}; x_{k}) \leq f(t_{k - 1}; x_{k}) \leq f^{*}(t_{k - 1}; x_{k - 1, j^{*}(k - 1)}, L).
$$

Define

$$
\begin{array}{r}{\varDelta_{k} = f^{*}(t_{k - 1}; x_{k - 1, j^{*}(k - 1)}, L), \quad k \geq 1, \quad \varDelta_{0} = f(t_{0}; x_{0}).} \end{array}
$$

Then, for all $k \geq 0$ we have

$$
f(t_{k}; x_{k}) - f^{*}(t_{k}) \le \Delta_{k}.
$$

Lemma 2.3.9 For all k, $0 \le k \le N$ , the internal process no longer works if the following condition is satisfied:

$$
\begin{array}{r}{f(t_{k}; x_{k, j}) - f^{*}(t_{k}) \le \frac{\varkappa}{Q_{f} - 1} \cdot f^{*}(t_{k}; x_{k, j}; L).} \end{array}\tag{2.3.25}
$$

Proof Assume that (2.3.25) is satisfied. Then, in view of (2.3.8), we have

$$
\begin{array}{rl} &{\frac{1}{2L} \parallel g_{f}(t_{k}; x_{k, j}; L \parallel^{2} \le f(t_{k}; x_{k, j}) - f(t_{k}; x_{f}(t_{k}; x_{k, j}; L))} \\ &{} \\ &{\qquad \le f(t_{k}; x_{k, j}) - f^{*}(t_{k}).} \end{array}
$$

Therefore, using (2.3.21), we obtain

$$
\begin{array}{rcl}{f^{*}(t_{k}; x_{k, j}; \mu)} &{\geq} &{f^{*}(t_{k}; x_{k, j}; L) - \frac{L - \mu}{2 \mu L} \parallel g_{f}(t_{k}; x_{k, j}; L \parallel^{2}} \\ & &{} \\ &{\geq} &{f^{*}(t_{k}; x_{k, j}; L) -(Q_{f} - 1) \cdot(f(t_{k}; x_{k, j}) - f^{*}(t_{k}))} \\ & &{} \\ &{\stackrel{(2.3.25)}{\geq}(1 - \kappa) f^{*}(t_{k}; x_{k, j}; L),} \end{array}
$$

which is the termination criterion of Step 1(a) in (2.3.22).

The above result, combined with the estimate of the rate of convergence for the internal process, provide us with the total complexity estimate for the constrained minimization scheme.

Lemma 2.3.10 For all $k, 0 \leq k \leq N$ , we have

$$
\begin{array}{r}{j(k) \leq 1 + \sqrt{Q_{f}} \cdot \ln \frac{2(Q_{f} - 1) \varDelta_{k}}{\varkappa \varDelta_{k + 1}}.} \end{array}
$$

Proof Assume that

$$
\begin{array}{r}{j(k) - 1 > \frac{1}{\sigma} \ln \frac{2(Q_{f} - 1) \varDelta_{k}}{\varkappa \varDelta_{k + 1}},} \end{array}\tag{2.3.26}
$$

where $\sigma{\mathrm{~}} ={\sqrt{q_{f}}}$ . Recall that $\Delta_{k + 1} ~ = ~ \operatorname{min}_{0 \leq j \leq j(k)} ~ f^{*}(t_{k}; x_{k, j}; L)$ . Note that the stopping criterion of the internal process was not satisfied for $j ~ = ~ j(k) - 1$ Therefore, in view of Lemma 2.3.9, we have

$$
\begin{array}{r}{f^{*}(t_{k}; x_{k, j}; L) \le \frac{Q_{f} - 1}{x}(f(t_{k}; x_{k, j}) - f^{*}(t_{k})) \ \le \2 \frac{Q_{f} - 1}{x} e^{- \sigma \cdot j} \varDelta_{k} \ \stackrel{(2.3.26)}{<} \ \varDelta_{k + 1}.} \end{array}
$$

This is a contradiction with the definition of $\varDelta \v{k}{+} 1$

Corollary 2.3.3

$$
\begin{array}{r}{\displaystyle \sum_{k = 0}^{N} j(k) \leq(N + 1) \left[1 + \sqrt{Q_{f}} \cdot \ln \frac{2(L - \mu)}{x \mu} \right] + \sqrt{Q_{f}} \cdot \ln \frac{\varDelta_{0}}{\varDelta_{N + 1}}.} \end{array}
$$

It remains to estimate the number of internal iterations in the last step of the Master Process. Denote this number by $j^{*}$

Lemma 2.3.11

$$
\begin{array}{r}{j^{*} \le 1 + \sqrt{Q_{f}} \cdot \ln \frac{2(Q_{f} - 1) \varDelta_{N + 1}}{\varkappa \epsilon}.} \end{array}
$$

Proof The proof is very similar to the proof of Lemma 2.3.10. Suppose that

$$
\begin{array}{r}{j^{*} - 1 > \sqrt{Q_{f}} \cdot \ln \frac{2(Q_{f} - 1) \varDelta_{N + 1}}{\varkappa \epsilon}.} \end{array}
$$

Note that for $j = j^{*} - 1$ we have

$$
\begin{array}{rl}{\epsilon \le f^{*}(t_{N + 1}; x_{N + 1, j}; L) \le \frac{Q_{f} - 1}{x}(f(t_{N + 1}; x_{N + 1, j}) - f^{*}(t_{N + 1}))} &{} \\{} &{} \\{\le 2 \frac{Q_{f} - 1}{x} e^{- \sigma \cdot j} \varDelta_{N + 1} < \epsilon.} \end{array}
$$

This is a contradiction.

Corollary 2.3.4

$$
j^{\ast} + \sum_{k = 0}^{N} j(k) \leq(N + 2) \left[1 + \sqrt{Q_{f}} \cdot \ln \frac{2(Q_{f} - 1)}{x} \right] + \sqrt{Q_{f}} \cdot \ln \frac{\varDelta_{0}}{\epsilon}.
$$

Let us put everything together. Substituting the estimate (2.3.24) for the number of full iterations N into the estimate of Corollary 2.3.4, we come to the following bound for the total number of internal iterations of process (2.3.22):

$$
\begin{array}{rl} &{\left[\frac{1}{\ln[2(1 - x)]} \ln \frac{t_{0} - t^{*}}{(1 - x) \epsilon} + 2 \right] \cdot \left[1 + \sqrt{Q_{f}} \cdot \ln \frac{2(Q_{f} - 1)}{x} \right]} \\ &{\quad + \sqrt{Q_{f}} \cdot \ln \left(\frac{1}{\epsilon} \cdot \operatorname{max}_{1 \leq i \leq m} \{f_{0}(x_{0}) - t_{0}; f_{i}(x_{0})\} \right).} \end{array}\tag{2.3.27}
$$

Note that method (2.3.13), which is used in the internal process, calls the oracle of problem (2.3.16) only once at each iteration. Therefore, the estimate (2.3.27) is an upper bound for the analytical complexity of problem (2.3.16) which $\epsilon$-solution is defined by relations (2.3.23).

Let us check how far this estimate is from the lower bound. The principal term in the estimate (2.3.27) is of the order

$$
\begin{array}{r}{\ln \frac{t_{0} - t^{*}}{\epsilon} \cdot \sqrt{Q_{f}} \cdot \ln Q_{f}.} \end{array}
$$

This value differs from the lower bound for an unconstrained minimization problem by a factor of ln $\frac{L}{\mu}$ . This means that the scheme (2.3.22) is at least suboptimal for constrained optimization problems.

To conclude this section, let us address two technical questions. Firstly, in scheme (2.3.22) it is assumed that we know some estimate $t_{0} < t^{*}$ . This assumption is not binding since it is possible to choose $t_{0}$ as the optimal value of the minimization problem

$$
\begin{array}{rl} &{\underset{x \in Q}{\operatorname{min}}[f(x_{0}) + \langle \nabla f(x_{0}), x - x_{0} \rangle + \frac{\mu}{2} \parallel x - x_{0} \parallel^{2}].} \end{array}
$$

Clearly, this value is less than or equal to $t^{*}$

Secondly, we assume that we are able to compute $t^{*}(\bar{x}, t)$ . Recall that $t^{*}(\bar{x}, t)$ is a root of the function

$$
f^{*}(t; \bar{x}; \mu) = \operatorname{min}_{x \in Q} \f_{\mu}(t; \bar{x}; x),
$$

where $f_{\mu}(t; \bar{x}; x)$ is a max-type function composed of the components

$$
\begin{array}{r}{f_{0}(\bar{x}) + \langle \nabla f_{0}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2} - t,} \end{array}
$$

$$
\begin{array}{r}{f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}, i = 1 \ldots m.} \end{array}
$$

In view of Lemma 2.3.4, it is the optimal value of the following minimization problem:

$$
\begin{array}{l}{\displaystyle \operatorname{min}_{x \in Q}[f_{0}(\bar{x}) + \langle \nabla f_{0}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2}],} \end{array}
$$

$$
\begin{array}{r}{\mathrm{s.t.} ~ f_{i}(\bar{x}) + \langle \nabla f_{i}(\bar{x}), x - \bar{x} \rangle + \frac{\mu}{2} \parallel x - \bar{x} \parallel^{2} \leq 0, \i = 1 \ldots m.} \end{array}
$$

This problem is not a pure problem of Quadratic Optimization since the constraints are not linear. However, it still can be solved in finite time by a simplex-type procedure, since the objective function and the constraints have the same Hessian. This problem can also be solved by Interior-Point Methods (see Chap. 5).


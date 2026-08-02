---
title: "Chapter 4 \u2014 Second-Order Methods."
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 4
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 10224
source_line_end: 13679
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
  source_control_characters: 5
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 4 — Second-Order Methods.

> [[../README|本书目录]] · [[03-chapter-3-nonsmooth-convex-optimization|上一章]] · [[05-chapter-5-polynomial-time-interior-point-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 10224–13679。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 4.1 Cubic Regularization of Newton’s Method

(Cubic regularization of quadratic approximation; General convergence results; Global rate of convergence for different problem classes; Implementation issues; Complexity results for strongly convex functions.)

## 4.1.1 Cubic Regularization of Quadratic Approximation

In this section, we consider the simplest unconstrained minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} ~ f(x)
$$

with a twice continuously differentiable objective function. The standard secondorder scheme for this problem, Newton’s method, is as follows:

$$
x_{k + 1} = x_{k} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}).\tag{4.1.1}
$$

We have already looked at this method in Sect. 1.2.

Despite its very natural motivation, this scheme has several hidden drawbacks. First of all, it may happen that at the current test point the Hessian is degenerate; in this case the method is not well-defined. Secondly, it may happen that this scheme diverges or converges to a saddle point or even to a point of local maximum. In order to overcome these difficulties, there are three standard recipes.

- Levenberg–Marquardt regularization. If $\nabla^{2} f(x_{k})$ is indefinite, let us regularize it with a unit matrix. Namely, use the matrix $G_{k} = \nabla^{2} f(x_{k}) + \gamma I_{n} \succ 0$ in order to perform the step:

$$
\boldsymbol{x}_{k + 1} = \boldsymbol{x}_{k} - G_{k}^{- 1} \nabla f(\boldsymbol{x}_{k}).
$$

This strategy is sometimes considered as a way of mixing Newton’s method with the gradient method.

- Line search. Since we are interested in minimization, it is reasonable to introduce in method (4.1.1) a certain step size $h_{k} > 0;$

$$
x_{k + 1} = x_{k} - h_{k}[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}).
$$

(This is a damped Newton method. Compare with the scheme (5.1.28).) This can help in generating a monotone sequence of function values: $f(x_{k + 1}) \leq f(x_{k})$

- Trust-region methods. In accordance with this approach, at point a $x_{k}$ we have to define a neighborhood, where the second-order approximation of the objective function is reliable. This is a certain trust region $\varDelta(x_{k})$ . For example, we can take

$$
\Delta(x_{k}) = \{x : \| x - x_{k} \| \leq \epsilon\}
$$

with some $\epsilon > 0$ . Then the next point $x_{k + 1}$ can be chosen as a solution to the following auxiliary problem:

$$
\operatorname{min}_{x \in \varDelta(x_{k})} \left[\langle \nabla f(x_{k}), x - x_{k} \rangle + \frac{1}{2} \langle \nabla^{2} f(x_{k})(x - x_{k}), x - x_{k} \rangle \right].
$$

Note that for $\varDelta(x_{k}) \equiv \mathbb{R}^{n}$ , this is exactly the standard Newton step.

Unfortunately, none of these approaches seems to be useful in addressing the global behavior of second-order schemes. In this section, we present a modification of Newton’s method, which is constructed in a similar way as the Gradient Mapping (see Sect. 2.2.4).

Let $\mathcal F \subseteq \mathbb{R}^{n}$ be an open convex set. Consider a function $f$ which is twice differentiable on $\mathcal{F}$ . Let $x_{0} \in{\mathcal{F}}$ be a starting point of our iterative scheme. We assume that the set $\mathcal{F}$ is large enough: It contains at least the level set

$$
\mathcal{L}(f(x_{0})) \equiv \{x \in \mathbb{R}^{n} : f(x) \leq f(x_{0}).\}
$$

Moreover, in this section we always assume the following.

Assumption 4.1.1 The Hessian of the function f is Lipschitz continuous on $\mathcal{F}.$ :

$$
\| \nabla^{2} f(x) - \nabla^{2} f(y) \| \leq L \| x - y \|, \quad \forall x, y \in \mathcal{F},\tag{4.1.2}
$$

with some constant $L > 0$ . In this section, the norm is always standard Euclidean.

For the reader’s convenience, let us recall the following variant of Lemma 1.2.4.

Lemma 4.1.1 For any x and y from $\mathcal{F}$ we have

$$
\| \nabla f(y) - \nabla f(x) - \nabla^{2} f(x)(y - x) \| \overset{(I.2.I3)}{\leq} \frac 12L \| y - x \|^{2},\tag{4.1.3}
$$

$$
\begin{array}{r}{| f(y) - f(x) - \langle \nabla f(x), y - x \rangle - \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle | \overset{(l.2.l \mathcal{A})}{\leq} \frac{L}{6} \| y - x \|^{3}.} \end{array}\tag{4.1.4}
$$

Let M be a positive parameter. Define a modified Newton step by minimizing a cubic regularization of the quadratic approximation of the function $f \colon$

$$
\begin{array}{r}{\underset{y}{\operatorname{min}} \left[\langle \nabla f(x), y - x \rangle + \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle + \frac{M}{6} \| y - x \|^{3} \right].} \end{array}\tag{4.1.5}
$$

Denote by $T_{M}(x)$ and arbitrary point from the set of global minima of this minimization problem. We postpone the discussion of computational complexity of finding this point up to Sect. 4.1.4.1.

Note that point $T_{M}(x)$ satisfies the following first-order optimality condition:

$$
\begin{array}{r}{\nabla f(x) + \nabla^{2} f(x)(T_{M}(x) - x) + \frac{M}{2} \| T_{M}(x) - x \| \cdot(T_{M}(x) - x) \overset{(1.2.4)}{=} 0.} \end{array}\tag{4.1.6}
$$

Let $r_{M}(x) = \| x - T_{M}(x) \|$ . Multiplying (4.1.6) by $T_{M}(x) - x$ , we get the equation

$$
\begin{array}{r}{\langle \nabla f(x), T_{M}(x) - x \rangle + \langle \nabla^{2} f(x)(T_{M}(x) - x), T_{M}(x) - x \rangle + \frac{M}{2} r_{M}^{3}(x) = 0.} \end{array}\tag{4.1.7}
$$

In our analysis of the process (4.1.16), we need the following fact.

Lemma 4.1.2 For any $x \in \mathcal{F}$ , we have

$$
\begin{array}{r}{\nabla^{2} f(x) + \frac{M}{2} r_{M}(x) I_{n} \succeq 0.} \end{array}\tag{4.1.8}
$$

This statement will be justified later in Sect. 4.1.4.1. Let us now present the main properties of the vector function $T_{M}(\cdot)$

Lemma 4.1.3 For any $x \in{\mathcal{L}}(f(x_{0})$ , we have the following relation:

$$
\langle \nabla f(x), x - T_{M}(x) \rangle \geq 0.\tag{4.1.9}
$$

If $M >{\textstyle \frac{2}{3}} L$ and $x \in int ~{\mathcal{F}},$ , then $T_{M}(x) \in \mathcal{L}(f(x)) \subset \mathcal{F}.$

Proof Indeed, multiplying (4.1.8) by $x - T_{M}(x)$ twice, we get

$$
\begin{array}{r}{\langle \nabla^{2} f(x)(T_{M}(x) - x), T_{M}(x) - x \rangle + \frac{M}{2} r_{M}^{3}(x) \geq 0.} \end{array}
$$

Therefore, (4.1.9) follows from (4.1.7).

Further, let $M >{\textstyle \frac{2}{3}} L$ . Assume that $T_{M}(x) \not \in{\mathcal{F}}$ . Then $r_{M}(x) > 0$ . Consider the following points:

$$
y(\alpha) = x + \alpha(T_{M}(x) - x), \quad \alpha \in[0, 1].
$$

Since $y(0) \in \mathcal{F}$ , the value

$$
\bar{\alpha} : y(\bar{\alpha}) \in \partial{\mathrm{cl ~}}(\mathcal F)
$$

is well defined. In accordance with our assumption, $\bar{\alpha} \leq 1$ and $y(\alpha) \in \mathcal{F}$ for all $\alpha \in[0, \bar{\alpha})$ . Therefore, using (4.1.4), relation (4.1.7), and inequality (4.1.9), we get

$$
\begin{array}{rl} &{f(y(\alpha)) \leq f(x) + \langle \nabla f(x), y(\alpha) - x \rangle} \\ &{\qquad + \frac{1}{2} \langle \nabla^{2} f(x)(y(\alpha) - x), y(\alpha) - x \rangle + \frac{\alpha^{3} L}{6} r_{M}^{3}(x)} \\ &{\qquad = f(x) + \langle \nabla f(x), y(\alpha) - x \rangle} \\ &{\qquad + \frac{1}{2} \langle \nabla^{2} f(x)(y(\alpha) - x), y(\alpha) - x \rangle + \frac{\alpha^{3} M}{4} r_{M}^{3}(x) - \alpha^{3} \delta} \\ &{\qquad = f(x) +(\alpha - \frac{\alpha^{2}}{2}) \langle \nabla f(x), T_{M}(x) - x \rangle - \frac{\alpha^{2}(1 - \alpha)}{4} Mr_{M}^{3}(x) - \alpha^{3} \delta} \\ &{\qquad \leq f(x) - \frac{\alpha^{2}(1 - \alpha)}{4} Mr_{M}^{3}(x) - \alpha^{3} \delta,} \end{array}
$$

where $\delta \ = \ \left(\frac{M}{4} - \frac{L}{6} \right) r_{M}^{3}(x) \ > \0$ . Thus, $f(y({\bar{\alpha}})) ~ < ~ f(x)$ . Therefore $y(\bar{\alpha}) \in$ ${\mathcal{L}}(f(x)) \subset{\mathcal{F}}$ . This is a contradiction. Hence, $T_{M}(x) ~ \in ~ \mathcal{F}$ . Using the same arguments, we prove that $f(T_{M}(x)) \leq f(x)$

Lemma 4.1.4 If $T_{M}(x) \in \mathcal{F}$ , then

$$
\| \nabla f(T_{M}(x)) \| \leq \frac 12(L + M) r_{M}^{2}(x).\tag{4.1.10}
$$

Proof From Eq. (4.1.6), we get

$$
\| \nabla f(x) + \nabla^{2} f(x)(T_{M}(x) - x) \| ={\frac{1}{2}} Mr_{M}^{2}(x).
$$

On the other hand, in view of (4.1.3), we have

$$
\| \nabla f(T_{M}(x)) - \nabla f(x) - \nabla^{2} f(x)(T_{M}(x) - x) \| \leq{\frac{1}{2}} Lr_{M}^{2}(x).
$$

Combining these two relations, we obtain inequality (4.1.10).

Define

$$
\begin{array}{r}{\bar{f}_{M}(x) = \underset{y}{\operatorname{min}} \left[f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle + \frac{M}{6} \| y - x \|^{3} \right].} \end{array}
$$

Lemma 4.1.5 For any $x \in \mathcal{F}$ , we have

$$
\begin{array}{r}{\bar{f}_{M}(x) \le \displaystyle \operatorname{min}_{y \in \mathcal{F}} \left[f(y) + \frac{L + M}{6} \| y - x \|^{3} \right],} \end{array}\tag{4.1.11}
$$

$$
\begin{array}{r}{f(x) - \bar{f}_{M}(x) \geq \frac{M}{12} r_{M}^{3}(x).} \end{array}\tag{4.1.12}
$$

Moreover, if $M \geq L$ , then $T_{M}(x) \in \mathcal{F}$ and

$$
f(T_{M}(x)) \leq{\bar{f}}_{M}(x).\tag{4.1.13}
$$

Proof Indeed, using the lower bound in (4.1.4), for any $y \in \mathcal{F}$ we have

$$
\begin{array}{r}{f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle \leq f(y) + \frac{L}{6} \| y - x \|^{3},} \end{array}
$$

and inequality in (4.1.11) follows from the definition of $\bar{f}_{M}(x)$

Further, in view of the definition of the point $T_{M}(x)$ , relation (4.1.7), and inequality (4.1.9), we have

$$
\begin{array}{rl} &{f(x) - \bar{f}_{M}(x) = \langle \nabla f(x), x - T_{M}(x) \rangle} \\ &{\qquad - \frac 12 \langle \nabla^{2} f(x)(T_{M}(x) - x), T_{M}(x) - x \rangle - \frac{M} 6r_{M}^{3}(x)} \\ &{\qquad = \frac 12 \langle \nabla f(x), x - T_{M}(x) \rangle + \frac{M}{12} r_{M}^{3}(x) \ \ge \ \frac{M}{12} r_{M}^{3}(x).} \end{array}
$$

Finally, if $M \geq L$ , then $T_{M}(x) \in \mathcal{F}$ in view of Lemma 4.1.3. Therefore, we get inequality (4.1.13) from the upper bound in (4.1.4).

## 4.1.2 General Convergence Results

In this section, our main problem of interest is as follows:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x),\tag{4.1.14}
$$

where the objective function $f(\cdot)$ satisfies Assumption 4.1.1. Recall that the necessary conditions for a point $x^{*}$ to be a local minimum of problem (4.1.14) are as follows (see Theorem 1.2.2):

$$
\nabla f(x^{*}) = 0, \quad \nabla^{2} f(x^{*}) \succeq 0.\tag{4.1.15}
$$

Therefore, for arbitrary $x \in \mathcal{F}$ , we can introduce the following measure of local optimality:

$$
\begin{array}{r}{\mu_{M}(x) = \operatorname{max} \left\{\sqrt{\frac{2}{L + M} \| \nabla f(x) \|}, - \frac{2}{2L + M} \lambda_{\mathrm{min}}(\nabla^{2} f(x)) \right\},} \end{array}
$$

where M is a positive parameter, and $\lambda_{\operatorname{min}}(\cdot)$ is the minimal eigenvalue of the corresponding matrix. It is clear that for any x from $\mathcal{F}$ the measure $\mu_{M}(x)$ is non-negative and it vanishes only at the points satisfying conditions (4.1.15). The analytical form of this measure can be justified by the following result.

## Lemma 4.1.6 For any $x \in \mathcal{F}$ we have $\mu_{M}(T_{M}(x)) \leq r_{M}(x)$

Proof The proof follows immediately from inequality (4.1.10) and relation (4.1.8) since

$$
\nabla^{2} f(T_{M}(x)) \succeq \nabla^{2} f(x) - Lr_{M}(x) I \succeq -(\frac{1}{2} M + L) r_{M}(x) I.
$$

Let $L_{0} ~ \in ~(0, L]$ be a positive parameter. Consider the following regularized Newton method.

Cubic Regularization of Newton’s Method   
Initialization: Choose $x_{0} \in \mathbb{R}^{n}$   
Iteration k, $(k \geq 0)$   
1. Find $M_{k} \in[L_{0}, 2L]$ such that $f(T_{M_{k}}(x_{k})) \leq \bar{f}_{M_{k}}(x_{k})$   
2. Set $x_{k + 1} = T_{M_{k}}(x_{k}).$

(4.1.16)

Since ${\bar{f}}_{M}(x) \leq f(x)$ , this process is monotone:

$$
f(x_{k + 1}) \leq f(x_{k}).
$$

If the constant L is known, in Step 1 of this scheme we can take $M_{k} \equiv L$ . In the opposite case, it is possible to apply a simple search procedure; we will discuss its complexity later in Sect. 4.1.4.2.

Let us start from the following simple observation.

Theorem 4.1.1 Let the sequence $\{x_{i}\}$ be generated by method (4.1.16). Assume that the objective function $f(\cdot)$ is bounded below:

$$
f(x) \geq f^{*} \quad \forall x \in{\mathcal{F}}.
$$

Then $\sum_{i = 0}^{\infty} r_{M_{i}}^{3}(x_{i}) \le \frac{12}{L_{0}}(f(x_{0}) - f^{*})$ . Hence, $\operatorname{lim}_{i \to \infty} \mu_{L}(x_{i}) = 0$ and for any $k \geq 1$ we have

$$
\operatorname{min}_{1 \leq i \leq k} \mu_{L}(x_{i}) \leq \frac{8}{3} \cdot \left(\frac{3(f(x_{0}) - f^{*})}{2k \cdot L_{0}} \right)^{1 / 3}.\tag{4.1.17}
$$

Proof In view of inequality (4.1.12), we have

$$
f(x_{0}) - f^{*} \geq \sum_{i = 0}^{k - 1}[f(x_{i}) - f(x_{i + 1}) \ \geq \ \sum_{i = 0}^{k - 1} \frac{M_{i}}{12} r_{M_{i}}^{3}(x_{i}) \ \geq \ \frac{L_{0}}{12} \sum_{i = 0}^{k - 1} r_{M_{i}}^{3}(x_{i}).
$$

It remains to use the statement of Lemma 4.1.6 and the upper bound on $M_{k}$ at Step 1 in (4.1.16):

$$
r_{M_{i}}(x_{i}) \geq \mu_{M_{i}}(x_{i + 1}) \geq \frac{3}{4} \mu_{L}(x_{i + 1}).\qquad \mathtt{U}
$$

Note that inequality (4.1.17) implies that

$$
\operatorname{min}_{1 \leq i \leq k} \| \nabla f(x_{i}) \| \leq O(k^{- 2 / 3}).
$$

We have seen that for a gradient scheme, the right-hand side in this inequality can be of the order $O \left(k^{- 1 / 2} \right)$ (see inequality (1.2.24)).

Theorem 4.1.1 helps us to get convergence results in many different situations. We mention only one of them.

Theorem 4.1.2 Let the sequence $\{x_{i}\}$ be generated by method (4.1.16). Let us assume that for some $i \geq 0$ the set $\mathcal{L}(f(x_{i}))$ is bounded. Then there exists a limit

$$
\operatorname{lim}_{i \to \infty} f(x_{i}) = f^{*}.
$$

The set $X^{*}$ of limit points of this sequence is non-empty. Moreover, this is a connected set such that for any $x^{*} \in X^{*}$ we have

$$
f(x^{*}) = f^{*}, \quad \nabla f(x^{*}) = 0, \quad \nabla^{2} f(x^{*}) \succeq 0.
$$

Proof The proof of this theorem can be derived from Theorem 4.1.1 in a standard way.

Let us describe now the behavior of the process (4.1.16) in a neighborhood of a non-degenerate stationary point, which is not a point of local minimum.

Lemma 4.1.7 Let $\bar{x} \in \mathcal{F}$ be a non-degenerate saddle point or a point of local maximum of the function f ( ):

$$
\nabla f(\bar{x}) = 0, \quad \lambda_{\mathrm{min}}(\nabla^{2} f(\bar{x})) < 0.
$$

Then there exist constants $\epsilon, \delta > 0$ such that whenever the point $x_{i}$ appears to be in the set $Q = \{x : \| x -{\bar{x}} \| \leq \epsilon, f(x) \geq f({\bar{x}})\}$ (for instance, $ifx_{i} = \bar{x})$ , then the next point $x_{i + 1}$ leaves the set $Q.$

$$
f(x_{i + 1}) \leq f({\bar{x}}) - \delta.
$$

Proof Let us choose a direction d, $\| d \| = 1$ , with negative curvature:

$$
\langle \nabla^{2} f(\bar{x}) d, d \rangle \equiv - 2 \sigma < 0.
$$

And let $\bar{\tau} > 0$ be small enough: $\bar{x} \pm \bar{\tau} d \in \mathcal{F}$ . Define $\epsilon$ min $\left\{\frac{\sigma}{2L}, \bar{\tau} \right\}$ and $\textstyle \delta ={\frac{\sigma}{6}} \epsilon^{2}$ Then, in view of inequality (4.1.11), upper bound on $M_{i}$ , and inequality (4.1.4), for $| \tau | \leq \bar{\tau}$ we get the following estimate

$$
\begin{array}{rl} &{f(x_{i + 1}) \leq f(\bar{x} + \tau d) + \frac{L}{2} \| \bar{x} + \tau d - x_{i} \|^{3}} \\ &{\qquad \quad \leq f(\bar{x}) - \sigma \tau^{2} + \frac{L}{6} | \tau |^{3} + \frac{L}{2} \left[\epsilon^{2} + 2 \tau \langle d, \bar{x} - x_{i} \rangle + \tau^{2} \right]^{3 / 2}.} \end{array}
$$

Since we are free in the choice of the sign of τ , we can guarantee that

$$
\begin{array}{r}{f(x_{i + 1}) \leq f(\bar{x}) - \sigma \tau^{2} + \frac{L}{6} | \tau |^{3} + \frac{L}{2} \left[\epsilon^{2} + \tau^{2} \right]^{3 / 2}, \quad | \tau | \leq \bar{\tau}.} \end{array}
$$

Let us choose $| \tau | = \epsilon \leq \bar{\tau}$ . Then

$$
\begin{array}{r}{f(x_{i + 1}) \leq f(\bar{x}) - \sigma \tau^{2} + \frac{5L}{3} | \tau |^{3} \leq f(\bar{x}) - \sigma \tau^{2} + \frac{5L}{3} \cdot \frac{\sigma}{2L} \cdot \tau^{2} = f(\bar{x}) - \frac{1}{6} \sigma \tau^{2}.} \end{array}
$$

Since the process (4.1.16) is monotone with respect to the objective function, it will never return to $Q$ □

Consider now the behavior of the regularized Newton scheme (4.1.16) in a neighborhood of a non-degenerate local minimum. It appears that in such a situation, condition $L_{0} \ > \0$ is no longer necessary. Let us analyze a relaxed version of (4.1.16):

$$
\begin{array}{r}{\boxed{x_{k + 1} = T_{M_{k}}(x_{k}), k \ge 0}} \end{array}\tag{4.1.18}
$$

where $M_{k} \in(0, 2L]$ . Define

$$
\begin{array}{r}{\delta_{k} = \frac{L \| \nabla f(x_{k}) \|}{\lambda_{\operatorname{min}}^{2}(\nabla^{2} f(x_{k}))}.} \end{array}
$$

Theorem 4.1.3 Let $\nabla^{2} f(x_{0}) \succ 0$ and $\begin{array}{r}{\delta_{0} \leq \frac{1}{4}} \end{array}$ . Let the points $\{x_{k}\}$ be generated by method (4.1.18). Then:

1. For all $k \geq 0$ the values $\delta_{k}$ are well defined and converge quadratically to zero:

$$
\begin{array}{r}{\delta_{k + 1} \leq \frac{3}{2} \left(\frac{\delta_{k}}{1 - \delta_{k}} \right)^{2} \leq \frac{8}{3} \delta_{k}^{2} \leq \frac{2}{3} \delta_{k}, \quad k \geq 0.} \end{array}\tag{4.1.19}
$$

2. Minimal eigenvalues of all Hessians $\nabla^{2} f(x_{k})$ satisfy the following bounds:

$$
e^{- 1} \lambda_{\operatorname{min}}(\nabla^{2} f(x_{0})) \leq \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})) \leq e^{3 / 4} \lambda_{\operatorname{min}}(\nabla^{2} f(x_{0})).\tag{4.1.20}
$$

3. The whole sequence $\{x_{i}\}$ converges quadratically to a point $x^{*}$ , which is a nondegenerate local minimum of the function f . In particular, for any $k \geq 1$ we have

$$
\begin{array}{r}{\| \nabla f(x_{k}) \| \leq \lambda_{\operatorname{min}}^{2}(\nabla^{2} f(x_{0})) \frac{9e^{3 / 2}}{16L} \left(\frac{1}{2} \right)^{2^{k}}.} \end{array}\tag{4.1.21}
$$

Proof Assume that $\nabla^{2} f(x_{k}) \succ 0$ for some $k \geq 0$ . Then the corresponding $\delta_{k}$ is well defined. Assume that $\delta_{k} \le{\textstyle \frac{1}{4}}$ . From Eq. (4.1.6), we have

$$
\begin{array}{l}{r_{M_{k}}(x_{k}) = \| T_{M_{k}}(x_{k}) - x_{k} \| = \|(\nabla^{2} f(x_{k}) + r_{M_{k}}(x_{k}) \frac{M_{k}}{2} I_{n})^{- 1} \nabla f(x_{k}) \|} \\{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad(4} \\{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad(4} \\{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad(4} \end{array}\tag{.1.22}
$$

Note also that $\nabla^{2} f(x_{k + 1}) \stackrel{(4.1.2)}{\succeq} \nabla^{2} f(x_{k}) - r_{M_{k}}(x_{k}) LI_{n}$ . Therefore,

$$
\begin{array}{rl} &{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{k + 1})) \geq \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})) - r_{M_{k}}(x_{k}) L} \\ &{} \\ &{\qquad \geq \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})) - \frac{L \| \nabla f(x_{k}) \|}{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{k}))}} \\ &{} \\ &{\qquad =(1 - \delta_{k}) \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})).} \end{array}\tag{4.1.23}
$$

Thus, $\nabla^{2} f(x_{k + 1})$ is also positive definite. Moreover, using inequality (4.1.10) and the upper bound for $M_{k}$ , we obtain

$$
\begin{array}{rl} &{\delta_{k + 1} = \frac{L \| \nabla f(x_{k + 1}) \|}{\lambda_{\operatorname{min}}^{2}(\nabla^{2} f(x_{k + 1}))} \ \leq \ \frac{3L^{2} r_{M_{k}}^{2}(x_{k})}{2 \lambda_{\operatorname{min}}^{2}(\nabla^{2} f(x_{k + 1}))} \ \leq \ \frac{3L^{2} \| \nabla f(x_{k}) \|^{2}}{2 \lambda_{\operatorname{min}}^{4}(\nabla^{2} f(x_{k}))(1 - \delta_{k})^{2}}} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{\quad \quad = \frac{3}{2} \left(\frac{\delta_{k}}{1 - \delta_{k}} \right)^{2} \ \leq \ \frac{8}{3} \delta_{k}^{2}.} \end{array}
$$

Thus, $\textstyle \delta_{k + 1} \leq{\frac{1}{4}}$ and we prove (4.1.19) by induction. We also get $\delta_{k + 1} \leq \textstyle{\frac{2}{3}} \delta_{k}$ , and, since $\begin{array}{r}{\delta_{0} \leq \frac{1}{4}} \end{array}$ , we come to the following bound:

$$
\sum_{i = 0}^{\infty} \delta_{i} \ \leq \ \frac{\delta_{0}}{1 - \frac{2}{3}} \leq 1 - \delta_{0}.\tag{4.1.24}
$$

Further,

$$
\begin{array}{r}{\ln \frac{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{k}))}{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{0}))} \overset{(4.1.23)}{\ge} \displaystyle \sum_{i = 0}^{\infty} \ln(1 - \delta_{i}) \ge - \sum_{i = 0}^{\infty} \frac{\delta_{i}}{1 - \delta_{i}} \ge - \frac{1}{1 - \delta_{0}} \displaystyle \sum_{i = 0}^{\infty} \delta_{i} \ge - 1.} \end{array}
$$

In order to get an upper bound, note that $\nabla^{2} f(x_{k + 1}) \stackrel{(4.1.2)}{\preceq} \nabla^{2} f(x_{k}) + r_{M_{k}}(x_{k}) LI_{n}.$ Hence,

$$
\begin{array}{r}{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{k + 1})) \leq \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})) + r_{M_{k}}(x_{k}) L \overset{(4.1.22)}{\leq}(1 + \delta_{k}) \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})).} \end{array}
$$

Therefore

$$
\ln \frac{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{k}))}{\lambda_{\operatorname{min}}(\nabla^{2} f(x_{0}))} \leq \sum_{i = 0}^{\infty} \ln(1 + \delta_{i}) \leq \sum_{i = 0}^{\infty} \delta_{i} \leq \frac{3}{4}.
$$

It remains to prove Item 3 of the theorem. In view of inequalities (4.1.22) and (4.1.20), we have

$$
\begin{array}{r}{r_{M_{k}}(x_{k}) \le \frac{1}{L} \lambda_{\operatorname{min}}(\nabla^{2} f(x_{k})) \delta_{k} \le \frac{e^{3 / 4}}{L} \lambda_{\operatorname{min}}(\nabla^{2} f(x_{0})) \delta_{k}.} \end{array}
$$

Thus, in view of the bound $(4.1.24), \{x_{i}\}$ is a Cauchy sequence, which has a unique limit point $x^{*}$ . Since the eigenvalues of $\nabla^{2} f(x)$ are continuous functions of x, from the first inequality in (4.1.20) we conclude that $\nabla^{2} f(x^{*}) \succ 0$

Further, by inequality (4.1.19), we get the bound

$$
\begin{array}{r}{\delta_{k + 1} \leq \frac{\delta_{k}^{2}}{(1 - \delta_{0})^{2}} \leq \frac{16}{9} \delta_{k}^{2}.} \end{array}
$$

Defining $\begin{array}{r}{\hat{\delta}_{k} = \frac{16}{9} \delta_{k}} \end{array}$ , we get $\hat{\delta}_{k + 1} \leq \hat{\delta}_{k}^{2}$ . Thus, for any $k \geq 1$ , we have

$$
\begin{array}{r}{\delta_{k} = \frac{9}{16} \hat{\delta}_{k} \leq \frac{9}{16} \hat{\delta}_{0}^{2^{k}} < \frac{9}{16} \left(\frac{1}{2} \right)^{2^{k}}.} \end{array}
$$

Using the upper bound in (4.1.20), we get the last upper bound (4.1.21).

## 4.1.3 Global Efficiency Bounds on Specific Problem Classes

In the previous section, we have already seen that the modified Newton scheme can be supported by a global efficiency estimate (4.1.17) on a general class of nonconvex problems. The main goal of this section is to show that by specifying some additional properties of non-convex functions, it is possible to get for this method much better performance guarantees. A nice feature of method (4.1.16) consists in its ability to automatically adjust its rate of convergence to the specific problem classes.

## 4.1.3.1 Star-Convex Functions

Let us start from a definition.

Definition 4.1.1 We call the function $f$ star-convex if its set of global minimums $X^{*}$ is not empty and for any $x^{*} \in X^{*}$ and any $x \in \mathbb{R}^{n}$ we have

$$
f(\alpha x^{*} +(1 - \alpha) x) \leq \alpha f(x^{*}) +(1 - \alpha) f(x) \quad \forall x \in \mathcal{F}, \forall \alpha \in[0, 1].\tag{4.1.25}
$$

A particular example of a star-convex function is a usual convex function. However, in general star-convex function need not to be convex, even in the scalar case. For instance, $f(x) = | x |(1 - e^{- | x |}), x \in \mathbb R$ , is star-convex, but not convex. Star-convex functions arise quite often in optimization problems related to sum of squares. For example the function $f(x, y){\overset{\vartriangle}{=}} x^{2} y^{2} + x^{\bar{2}} + y^{2}$ with $(x, y) \in \mathbb{R}^{2}$ belongs to this class.

Theorem 4.1.4 Assume that the objective function in the problem $(4.l.I4)$ is starconvex, and the set $\mathcal{F}$ is bounded: diam $\mathcal{F} = D < \infty$ . Let the sequence $\{x_{k}\}$ be generated by method (4.1.16).

1. If $\begin{array}{r}{f(x_{0}) - f^{*} \ge \frac{3}{2} LD^{3}} \end{array}$ , then $\begin{array}{r}{f(x_{1}) - f^{*} \leq \frac{1}{2} LD^{3}} \end{array}$

2. If $\begin{array}{r}{f(x_{0}) - f^{*} \le \frac{3}{2} LD^{3}} \end{array}$ , then the rate of convergence of process (4.1.16) is as follows:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{3LD^{3}}{2(1 + \frac{1}{3} k)^{2}}, \quad k \geq 0.} \end{array}\tag{4.1.26}
$$

Proof Indeed, in view of inequality (4.1.11) the upper bound on the parameters $M_{k}$ and definition (4.1.25), for any $k \geq 0$ we have:

$$
\begin{array}{rl}{f(x_{k + 1}) - f(x^{*}) \leq} &{\underset{y}{\mathrm{min}} \quad[f(y) - f(x^{*}) + \frac{L}{2} \| y - x_{k} \|^{3} :} \\ &{} \\ &{\qquad \quad y = \alpha x^{*} +(1 - \alpha) x_{k}, \alpha \in[0, 1]]} \\ &{\leq \underset{\alpha \in[0, 1]}{\mathrm{min}} \left[f(x_{k}) - f(x^{*}) \right.} \\ &{\left.- \alpha(f(x_{k}) - f(x^{*})) + \frac{L}{2} \alpha^{3} \| x^{*} - x_{k} \|^{3} \right]} \\ &{\leq \underset{\alpha \in[0, 1]}{\mathrm{min}} \left[f(x_{k}) - f(x^{*}) - \alpha(f(x_{k}) - f(x^{*})) + \frac{L}{2} \alpha^{3} D^{3} \right].} \end{array}
$$

The minimum of the objective function in the last minimization problem in $\alpha \geq 0$ is achieved for

$$
\begin{array}{r}{\alpha_{k} = \sqrt{\frac{2(f(x_{k}) - f(x^{*}))}{3LD^{3}}}.} \end{array}
$$

If $\alpha_{k} \geq 1$ , then the actual optimal value corresponds to $\alpha = 1$ . In this case,

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \frac{1}{2} LD^{3}.} \end{array}
$$

Since the process (4.1.16) is monotone, this can happen only at the first iteration of the method.

Assume that $\alpha_{k} \leq 1$ . Then

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq f(x_{k}) - f(x^{*}) - \left[\frac{2}{3}(f(x_{k}) - f(x^{*})) \right]^{3 / 2} \frac{1}{\sqrt{LD^{3}}}.} \end{array}
$$

Or, using the notation $\begin{array}{r}{\alpha_{k} \ = \ \sqrt{\frac{2(f(x_{k}) - f(x^{*}))}{3LD^{3}}}} \end{array}$ , this is $\alpha_{k + 1}^{2} \ : \le \ : \alpha_{k}^{2} \ : - \ : \frac{2}{3} \alpha_{k}^{3} \ : < \ : \alpha_{k}^{2}.$ Therefore,

$$
\begin{array}{r}{\frac{1}{\alpha_{k + 1}} - \frac{1}{\alpha_{k}} = \frac{\alpha_{k} - \alpha_{k + 1}}{\alpha_{k} \alpha_{k + 1}} \ = \ \frac{\alpha_{k}^{2} - \alpha_{k + 1}^{2}}{\alpha_{k} \alpha_{k + 1}(\alpha_{k} + \alpha_{k + 1})} \ \geq \ \frac{\alpha_{k}^{2} - \alpha_{k + 1}^{2}}{2 \alpha_{k}^{3}} \ \geq \ \frac{1}{3}.} \end{array}
$$

Thus, $\begin{array}{r}{\frac{1}{\alpha_{k}} \geq \frac{1}{\alpha_{0}} + \frac{k}{3} \geq 1 + \frac{k}{3}} \end{array}$ , and (4.1.26) follows.

Let us now introduce the notion of a generalized non-degenerate global minimum.

Definition 4.1.2 We say that the optimal set $X^{*}$ of function $f(\cdot)$ is globally nondegenerate if there exists a constant $\mu > 0$ such that for any $x \in \mathcal{F}$ we have

$$
\begin{array}{r}{f(x) - f^{*} \geq \frac{\mu}{2} \rho^{2}(x, X^{*}),} \end{array}\tag{4.1.27}
$$

where $f^{*}$ is the global minimal value of the function $f(\cdot)$ , and $\rho(x, X^{*})$ is the Euclidean distance from x to $X^{*}$

Of course, this property holds for strongly convex functions (see (3.2.43); in this case $X^{*}$ is a singleton). However, it can also hold for some non-convex functions. As an example, we can look at the function

$$
f(x) =(\| x \|^{2} - 1)^{2}, \quad X^{*} = \{x : \| x \| = 1\} \subset \mathbb{R}^{n}.
$$

Note also that if the set $X^{*}$ has a connected non-trivial component, then the Hessians of the objective function at these points are necessarily degenerate. However, as we will see, in this situation the modified Newton scheme still ensures a super-linear rate of convergence. Define

$$
\begin{array}{r}{\bar{\omega} = \frac{1}{L^{2}} \left(\frac{\mu}{2} \right)^{3}.} \end{array}
$$

Theorem 4.1.5 Let a function f be star-convex. Assume that it also has a globally non-degenerate optimal set. Then the performance of the scheme (4.1.16) on this problem is as follows.

1. If $\begin{array}{r}{f(x_{0}) - f(x^{*}) \ge \frac{4}{9} \bar{\omega}} \end{array}$ , then at the first phase of the process we get the following rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \left[(f(x_{0}) - f(x^{*}))^{1 / 4} - \frac{k}{6} \sqrt{\frac{2}{3}} \bar{\omega}^{1 / 4} \right]^{4}.} \end{array}\tag{4.1.28}
$$

This phase is terminated as soon as $f(x_{k_{0}}) - f(x^{*}) \leq{\textstyle{\frac{4}{9}}} \bar{\omega}$ for some $k_{0} \geq 0.$ 2. For $k \geq k_{0}$ the sequence converges superlinearly:

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \frac{1}{2}(f(x_{k}) - f(x^{*})) \sqrt{\frac{f(x_{k}) - f(x^{*})}{\bar{\omega}}}.} \end{array}\tag{4.1.29}
$$

Proof Denote by $x_{k}^{*}$ the projection of the point $x_{k}$ onto the optimal set $X^{*}$ . In view of inequality (4.1.11) the upper bound on the parameters $M_{k}$ and definitions (4.1.25), (4.1.27), for any $k \geq 0$ we have:

$$
\begin{array}{rl} &{f(x_{k + 1}) - f(x^{*}) \underset{\alpha \in[0, 1]}{\mathrm{min}} \left[f(x_{k}) - f(x^{*}) - \alpha(f(x_{k}) - f(x^{*})) \right.} \\ &{\qquad \left.+ \displaystyle \frac{L}{2} \alpha^{3} \lVert x_{k}^{*} - x_{k} \rVert^{3} \right]} \\ &{\leq \underset{\alpha \in[0, 1]}{\mathrm{min}} \left[f(x_{k}) - f(x^{*}) - \alpha(f(x_{k}) - f(x^{*})) \right.} \\ &{\qquad \left.+ \displaystyle \frac{L}{2} \alpha^{3} \left(\frac{2}{\mu}(f(x_{k}) - f(x^{*})) \right)^{3 / 2} \right].} \end{array}
$$

Defining $\varDelta_{k} =(f(x_{k}) - f(x^{*})) / \bar{\omega}$ , we get the inequality

$$
\varDelta_{k + 1} \leq \operatorname{min}_{\alpha \in[0, 1]} \left[\varDelta_{k} - \alpha \varDelta_{k} + \frac{1}{2} \alpha^{3} \varDelta_{k}^{3 / 2} \right].\tag{4.1.30}
$$

Note that the first-order optimality condition for $\alpha \ge 0$ in this problem is

$$
\alpha_{k} = \sqrt{\frac{2}{3} \varDelta_{k}^{- 1 / 2}}.
$$

Therefore, if $\begin{array}{r}{\varDelta_{k} \geq \frac{4}{9}} \end{array}$ , we get

$$
\begin{array}{r}{\varDelta_{k + 1} \leq \varDelta_{k} - \left(\frac 23 \right)^{3 / 2} \varDelta_{k}^{3 / 4}.} \end{array}
$$

Defining $\begin{array}{r}{u_{k} = \frac{9}{4} \varDelta_{k}} \end{array}$ , we get a simpler relation:

$$
\begin{array}{r}{u_{k + 1} \leq u_{k} - \frac{2}{3} u_{k}^{3 / 4},} \end{array}
$$

which is applicable if $u_{k} \ \geq \1$ . Since the right-hand side of this inequality is increasing for $\begin{array}{r}{u_{k} \ge \frac{1}{16}} \end{array}$ , let us prove by induction that

$$
\begin{array}{r}{u_{k} \le \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{4}.} \end{array}
$$

Indeed, inequality

$$
\begin{array}{r}{\left[u_{0}^{1 / 4} - \frac{k + 1}{6} \right]^{4} \ge \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{4} - \frac{2}{3} \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{3}} \end{array}
$$

is clearly equivalent to

$$
\begin{array}{rl} &{\quad \frac{2}{3} \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{3} \geq \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{4} - \left[u_{0}^{1 / 4} - \frac{k + 1}{6} \right]^{4} = \frac{1}{6} \bigg \{\left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{3}} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad + \left[u_{0}^{1 / 4} - \frac{k}{6} \right]^{2} \left[u_{0}^{1 / 4} - \frac{k + 1}{6} \right]^{3} \bigg\},} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \end{array}
$$

which is obviously true.

Finally, if $u_{k} \leq 1$ , then the optimal value for α in (4.1.30) is equal to one, and we get (4.1.29).

## 4.1.3.2 Gradient-Dominated Functions

Let us now look at another interesting class of nonconvex functions.

Definition 4.1.3 A function $f(\cdot)$ is called gradient dominated of degree $p \in[1, 2]$ if it attains a global minimum at some point $x^{*}$ and for any $x \in \mathcal{F}$ we have

$$
f(x) - f(x^{*}) \leq \tau_{f} \| \nabla f(x) \|^{p},\tag{4.1.31}
$$

where $\tau_{f}$ is a positive constant. The parameter $p$ is called the degree of domination.

We do not assume here that the global minimum of function f is unique. Let us give several examples of gradient dominated functions.

Example 4.1.1 (Convex Functions) Let f be convex on $\mathbb{R}^{n}$ . Assume it achieves its minimum at point $x^{*}$ . Then, for any $x \in \mathbb{R}^{n}$ with $\| x - x^{*} \| < R$ , we have

$$
f(x) - f(x^{*}) \stackrel{(2.1.2)}{\leq} \langle \nabla f(x), x - x^{*} \rangle \leq \| \nabla f(x) \| \cdot R.
$$

Thus, the function $f$ is a gradient dominated function of degree one on the set $\mathcal{F} = \{x : \ \| x - x^{*} \| < R\}$ with $\tau_{f} = R$ □

Example 4.1.2 (Strongly Convex Functions) Let $f$ be differentiable and strongly convex on $\mathbb{R}^{n}$ . This means that there exists a constant $\mu > 0$ such that

$$
\begin{array}{r}{f(y) \stackrel{(2.1.20)}{\geq} f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2} \mu \| y - x \|^{2},} \end{array}\tag{4.1.32}
$$

for all $x, y \in \mathbb{R}^{n}$ . Then, minimizing both sides of this inequality in y, we obtain,

$$
\begin{array}{r}{f(x) - f(x^{*}) \leq \frac{1}{2 \mu} \| \nabla f(x) \|^{2} \quad \forall x \in \mathbb{R}^{n}.} \end{array}
$$

Thus, $f$ is a gradient dominated function of degree two on the set $\mathcal{F} = \mathbb{R}^{n}$ with $\begin{array}{r}{\tau_{f} = \frac{1}{2 \mu}} \end{array}$ .

Example 4.1.3 (Sum of Squares) Consider a system of non-linear equations:

$$
g(x) = 0,\tag{4.1.33}
$$

where $g(x) =(g_{1}(x), \ldots, g_{m}(x))^{T} : \mathbb{R}^{n} \mathbb{R}^{m}$ is a differentiable vector function. We assume that $m \leq n$ and that there exists a solution $x^{*}$ to (4.1.33). Let us assume in addition that the Jacobian

$$
J^{T}(x) =(\nabla g_{1}(x), \ldots, \nabla g_{m}(x))
$$

is uniformly non-degenerate on a certain convex set $\mathcal{F}$ containing $x^{*}$ . This means that the value

$$
\sigma \equiv \operatorname{inf}_{x \in{\mathcal{F}}} \lambda_{\operatorname{min}} \left(J(x) J^{T}(x) \right)
$$

is positive. Consider the function

$$
f(x) = \frac{1}{2} \sum_{i = 1}^{m} g_{i}^{2}(x).
$$

Clearly, $f(x^{*}) = 0$ . Note that $\nabla f(x) = J^{T}(x) g(x)$ . Therefore,

$$
\| \nabla f(x) \|^{2} = \langle \left(J(x) J^{T}(x) \right) g(x), g(x) \rangle \ \ge \ \sigma \| g(x) \|^{2} \ = \2 \sigma(f(x) - f(x^{*})).
$$

Thus, $f$ is a gradient dominated function on $\mathcal{F}$ of degree two with $\begin{array}{r}{\tau_{f} = \frac{1}{2 \sigma}} \end{array}$ . Note that, for $m \ : < n$ , the set of solutions to (4.1.33) is not a singleton and therefore the Hessians of the function $f$ are necessarily degenerate at the solutions.

In order to study the complexity of minimization of the gradient dominated functions, we need one auxiliary result.

Lemma 4.1.8 At each step of method (4.1.16) we can guarantee the following decrease of the objective function:

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{L_{0} \cdot \| \nabla f(x_{k + 1}) \|^{3 / 2}}{3 \sqrt{2} \cdot(L + L_{0})^{3 / 2}}, \quad k \geq 0.} \end{array}\tag{4.1.34}
$$

Proof In view of inequalities (4.1.12) and (4.1.10) we get

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \ge \frac{M_{k}}{12} r_{M_{k}}^{3}(x_{k}) \ge \frac{M_{k}}{12} \left(\frac{2 \| \nabla f(x_{k + 1}) \|}{L + M_{k}} \right)^{3 / 2} = \frac{M_{k} \| \nabla f(x_{k + 1}) \|^{3 / 2}}{3 \sqrt{2} \cdot(L + M_{k})^{3 / 2}}.} \end{array}
$$

It remains to note that the right-hand side of this inequality is increasing in $M_{k} \ \le$ 2L. Thus, we can replace $M_{k}$ by its lower bound $L_{0}$ .

Let us start from the analysis of gradient dominated functions of degree one. The following theorem shows that the process can be partitioned into two phases. The first phase (with large values of the objective function) is very short, while at the second phase we can guarantee the rate of convergence of the order $O(1 / k^{2})$ .

Theorem 4.1.6 Let us use method (4.1.16) for minimizing a gradient dominated function f of degree $p = 1$

1. If the initial value of the objective function is large enough:

$$
\begin{array}{r}{f(x_{0}) - f(x^{*}) \geq \hat{\omega} \stackrel{\mathrm{def}}{=} \frac{18}{L_{0}^{2}} \tau_{f}^{3} \cdot(L + L_{0})^{3},} \end{array}
$$

then the process converges to the region $\mathcal{L}(\hat{\omega})$ superlinearly:

$$
\begin{array}{r}{\ln \left(\frac{1}{\hat{\omega}}(f(x_{k}) - f(x^{*}) \right) \leq \left(\frac{2}{3} \right)^{k} \ln \left(\frac{1}{\hat{\omega}}(f(x_{0}) - f(x^{*}) \right).} \end{array}\tag{4.1.35}
$$

2. If $f(x_{0}) - f(x^{*}) \leq \gamma^{2} \hat{\omega}$ for some $\gamma > 1$ , then we have the following estimate for the rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \hat{\omega} \cdot \frac{\gamma^{2} \left(2 + \frac{3}{2} \gamma \right)^{2}}{\left(2 + \left(k + \frac{3}{2} \right) \cdot \gamma \right)^{2}}, \quad k \geq 0.} \end{array}\tag{4.1.36}
$$

Proof Using inequalities (4.1.34) and (4.1.31) with $p = 1$ , we get

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \ge \frac{L_{0} \cdot(f(x_{k + 1}) - f(x^{*}))^{3 / 2}}{3 \sqrt{2} \cdot(L + L_{0})^{3 / 2} \cdot \tau_{f}^{3 / 2}} \ : = \ : \hat{\omega}^{- 1 / 2}(f(x_{k + 1}) - f(x^{*}))^{3 / 2}.} \end{array}
$$

Defining $\delta \boldsymbol{k} =(f(\boldsymbol{x}_{k}) - f(\boldsymbol{x}^{*})) / \hat{\omega}$ , we obtain

$$
\delta_{k} - \delta_{k + 1} \geq \delta_{k + 1}^{3 / 2}.\tag{4.1.37}
$$

Hence, ln $\begin{array}{r}{\delta_{k} \geq \ln \delta_{k + 1} + \ln(1 + \delta_{k + 1}^{1 / 2}) \geq \frac 32 \ln \delta_{k + 1}} \end{array}$ . Thus, ln $\begin{array}{r}{\delta_{k} \le \left(\frac{2}{3} \right)^{k}} \end{array}$ ln δ<sub>0</sub>, and this is inequality (4.1.35).

Let us now prove inequality (4.1.36). Using inequality (4.1.37), we have

$$
\begin{array}{rl} &{\frac{1}{\sqrt{\delta_{k + 1}}} - \frac{1}{\sqrt{\delta_{k}}} \geq \frac{1}{\sqrt{\delta_{k + 1}}} - \frac{1}{\sqrt{\delta_{k + 1} + \delta_{k + 1}^{3 / 2}}} = \frac{\sqrt{\delta_{k + 1} + \delta_{k + 1}^{3 / 2}} - \sqrt{\delta_{k + 1}}}{\sqrt{\delta_{k + 1}} \sqrt{\delta_{k + 1} + \delta_{k + 1}^{3 / 2}}} = \frac{\sqrt{1 + \delta_{k + 1}^{1 / 2}} - 1}{\sqrt{\delta_{k + 1} + \delta_{k + 1}^{3 / 2}}}} \\ &{\qquad = \frac{1}{\sqrt{1 + \sqrt{\delta_{k + 1}}} \cdot \left(1 + \sqrt{1 + \sqrt{\delta_{k + 1}}} \right)} = \frac{1}{1 + \sqrt{\delta_{k + 1}} + \sqrt{1 + \sqrt{\delta_{k + 1}}}}} \\ &{\qquad \geq \frac{1}{2 + \frac{3}{2} \sqrt{\delta_{k + 1}}} \geq \frac{1}{2 + \frac{3}{2} \sqrt{\delta_{0}}}.} \end{array}
$$

Thus, $\begin{array}{r}{\frac{1}{\sqrt{\delta_{k}}} \geq \frac{1}{\gamma} + \frac{k}{2 + \frac{3}{2} \gamma}} \end{array}$ , and this is (4.1.36).

The reader should not be confused by the superlinear rate of convergence established by (4.1.35). It is valid only for the first stage of the process and describes a convergence to the set $\mathcal{L}(\hat{\omega})$ . For example, the first stage of the process discussed in Theorem 4.1.4 is even shorter: it takes just one iteration.

Let us now look at the gradient dominated functions of degree two. Here we can also see two phases of the process.

Theorem 4.1.7 Let us apply method (4.1.16) for minimizing a gradient dominated function f of degree $p = 2$

1. If the initial value of the objective function is large enough:

$$
\begin{array}{r}{f(x_{0}) - f(x^{*}) \geq \tilde{\omega} \ \stackrel{\mathrm{def}}{=} \ \frac{L_{0}^{4}}{324(L + L_{0})^{6} \tau_{f}^{3}},} \end{array}\tag{4.1.38}
$$

then at its first phase the process converges as follows:

$$
f(x_{k}) - f(x^{*}) \leq(f(x_{0}) - f(x^{*})) \cdot e^{- k \cdot \sigma},\tag{4.1.39}
$$

where $\begin{array}{r}{\sigma = \frac{{\tilde{\omega}}^{1 / 4}}{{\tilde{\omega}}^{1 / 4} +(f(x_{0}) - f(x^{*}))^{1 / 4}}} \end{array}$ . This phase ends at the first iteration k for which (4.1.38) does not hold.

2. For $k \geq k_{0},$ , the rate of convergence is super-linear:

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \tilde{\omega} \cdot \left(\frac{f(x_{k}) - f(x^{*})}{\tilde{\omega}} \right)^{4 / 3}.} \end{array}\tag{4.1.40}
$$

Proof Using inequalities (4.1.34) and (4.1.31) with $p = 2$ , we get

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{L_{0} \cdot(f(x_{k + 1}) - f(x^{*}))^{3 / 4}}{3 \sqrt{2} \cdot(L + L_{0})^{3 / 2} \cdot \tau_{f}^{3 / 4}} = \tilde{\omega}^{1 / 4}(f(x_{k + 1}) - f(x^{*}))^{3 / 4}.} \end{array}
$$

Defining $\delta_{k} =(f(x_{k}) - f(x^{*})) / \tilde{\omega}$ , we obtain

$$
\delta_{k} \geq \delta_{k + 1} + \delta_{k + 1}^{3 / 4}.\tag{4.1.41}
$$

Hence,

$$
\begin{array}{r}{\frac{\delta_{k}}{\delta_{k + 1}} \geq 1 + \delta_{k}^{- 1 / 4} \geq 1 + \delta_{0}^{- 1 / 4} = \frac{1}{1 - \sigma} \geq e^{\sigma},} \end{array}
$$

and we get (4.1.39). Finally, from (4.1.41) we have $\delta_{k + 1} ~ \le ~ \delta_{k}^{4 / 3}$ , which is (4.1.40).

Comparing the statement of Theorem 4.1.7 with other theorems of this section, we can see a significant difference. This is the first time when the initial residual $f(x_{0}) -$ $f(x^{*})$ enters the complexity estimate of the first phase of the process in a polynomial way. In all other cases, the dependence on this value is much weaker. However, we will observe a similar situation in Sect. 5.2, when we will address the complexity of minimizing self-concordant functions.

Note that it is possible to embed the gradient dominated functions of degree two into the class of gradient dominated functions of degree one. However, it is easy to check that this only makes the efficiency estimates established by Theorem 4.1.7 worse.

## 4.1.3.3 Nonlinear Transformations of Convex Functions

Let $u(x) : \mathbb{R}^{n} \to \mathbb{R}^{n}$ be a non-degenerate vector function. Denote by $v(u)$ its inverse:

$$
v(u) : \mathbb{R}^{n} \mathbb{R}^{n}, \quad v(u(x)) \equiv x.
$$

Consider the following function:

$$
f(x) = \phi(u(x)),
$$

where $\phi(u)$ is a convex function with bounded level sets. Denote by $x^{*} \equiv v(u^{*})$ its minimum. Let us fix some $x_{0} \in \mathbb{R}^{n}$ . Define

$$
\sigma = \operatorname{max}_{u} \{\| v^{\prime}(u) \| : \phi(u) \leq f(x_{0})\},
$$

$$
D = \operatorname{max}_{u} \{\| u - u^{*} \| : \phi(u) \leq f(x_{0})\}.
$$

The following result is straightforward.

Lemma 4.1.9 For any x, $y \in \mathcal{L}(f(x_{0}))$ we have

$$
\| x - y \| \leq \sigma \| u(x) - u(y) \|.\tag{4.1.42}
$$

Proof Indeed, for $x, y \in{\mathcal{L}}(f(x_{0}))$ , we have $\phi(u(x)) \leq f(x_{0})$ and $\phi(u(y)) ~ \leq$ $f(x_{0})$ . Consider the trajectory $x(t) = v(tu(y) +(1 - t) u(x)), t \in[0, 1]$ . Then

$$
\begin{array}{r}{y - x = \underset{0}{\overset{1}{\int}} x^{\prime}(t) dt = \left(\underset{0}{\overset{1}{\int}} v^{\prime}(tu(y) +(1 - t) u(x)) dt \right) \cdot(u(y) - u(x)),} \end{array}
$$

and (4.1.42) follows.

The following result is very similar to Theorem 4.1.4.

Theorem 4.1.8 Assume that the Hessian of the function f is Lipschitz continuous on a convex set $\mathcal{F} \supset \mathcal{L}(f(x_{0}))$ with constant L and let the sequence $\{x_{k}\}$ be generated by method $(4.l.I6)$

1. If $\begin{array}{r}{f(x_{0}) - f^{*} \geq \frac{3}{2} L(\sigma D)^{3}} \end{array}$ , then $\begin{array}{r}{f(x_{1}) - f^{*} \leq \frac{1}{2} L(\sigma D)^{3}.} \end{array}$

2. If $\begin{array}{r}{f(x_{0}) - f^{*} \leq \frac{3}{2} L(\sigma D)^{3}} \end{array}$ , then the rate of convergence of the process (4.1.16) is as follows:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{3L(\sigma D)^{3}}{2(1 + \frac{1}{3} k)^{2}}, \quad k \geq 0.} \end{array}\tag{4.1.43}
$$

Proof Indeed, in view of inequality (4.1.11), the upper bound on the parameters $M_{k}$ and definition (4.1.25), for any $k \geq 0$ we have:

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \underset{y}{\mathrm{min}}[\f(y) - f(x^{*}) + \frac{L}{2} \| y - x_{k} \|^{3} :} \end{array}
$$

$$
y = v(\alpha u^{*} +(1 - \alpha) u(x_{k})), \alpha \in[0, 1] \].
$$

By definition of the points y in the above minimization problem and (4.1.42), we have

$$
f(y) - f(x^{*}) = \phi(\alpha u^{*} +(1 - \alpha) u(x_{k})) - \phi(u^{*}) \leq(1 - \alpha)(f(x_{k}) - f(x^{*})),
$$

$$
\| y - x_{k} \| \leq \alpha \sigma \| u(x_{k}) - u^{*} \| \leq \alpha \sigma D.
$$

This means that the reasoning of Theorem 4.1.4 goes through replacing $D$ by $\sigma D$ <sup>.</sup> <sub>$\square$</sub>

Let us prove a statement on strongly convex $\phi.$ . Define $\begin{array}{r}{\check{\omega} = \frac{1}{L^{2}} \left(\frac{\mu}{2 \sigma^{2}} \right)^{3}} \end{array}$

Theorem 4.1.9 Let the function φ be strongly convex with convexity parameter $\mu \ > \0$ . Then, under assumptions of Theorem 4.1.8, the performance of the scheme (4.1.16) is as follows.

1. If $\begin{array}{r}{f(x_{0}) - f(x^{*}) \ge \frac{4}{9} \check{\omega},} \end{array}$ , then in the first phase of the process we get the following rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \left[(f(x_{0}) - f(x^{*}))^{1 / 4} - \frac{k}{6} \sqrt{\frac{2}{3}} \check{\omega}^{1 / 4} \right]^{4}.} \end{array}\tag{4.1.44}
$$

This phase is terminated as soon as $\begin{array}{r}{f(x_{k_{0}}) - f(x^{*}) \le \frac{4}{9} \check{\omega}} \end{array}$ for some $k_{0} \geq 0.$ 2. For $k \geq k_{0}$ , the sequence converges superlinearly:

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \frac{1}{2}(f(x_{k}) - f(x^{*})) \sqrt{\frac{f(x_{k}) - f(x^{*})}{\check{\omega}}}.} \end{array}\tag{4.1.45}
$$

Proof Indeed, in view of inequality (4.1.11), the upper bound on the parameters $M_{k}$ and definition (4.1.25), for any $k \geq 0$ we have:

$$
\begin{array}{r}{f(x_{k + 1}) - f(x^{*}) \leq \underset{y}{\mathrm{min}}[\f(y) - f(x^{*}) + \frac{L}{2} \| y - x_{k} \|^{3} :} \end{array}
$$

$$
y = v(\alpha u^{*} +(1 - \alpha) u(x_{k})), \alpha \in[0, 1] \].
$$

By definition of the points y in the above minimization problem and (4.1.42), we have

$$
f(y) - f(x^{*}) = \phi(\alpha u^{*} +(1 - \alpha) u(x_{k})) - \phi(u^{*}) \leq(1 - \alpha)(f(x_{k}) - f(x^{*})),
$$

$$
\begin{array}{r}{\| y - x_{k} \| \leq \alpha \sigma \| u(x_{k}) - u^{*} \| \overset{(2.1.21)}{\leq} \alpha \sigma \sqrt{\frac{2}{\mu}(f(x_{0}) - f(x^{*}))}.} \end{array}
$$

This means that the reasoning of Theorem 4.1.5 goes through replacing L by $\sigma^{3} L$ .

Note that the functions described in this section are often used as test functions for non-convex optimization algorithms. The simplest way of defining a nondegenerate transformation $u(\cdot) : \mathbb{R}^{n} \mathbb{R}^{n}$ is as follows:

$$
\begin{array}{l}{{u^{(1)}(x) = x^{(1)},}} \\{{\}} \\{{u^{(2)}(x) = x^{(2)} + \phi_{1}(x^{(1)}),}} \\{{\}} \\{{u^{(3)}(x) = x^{(3)} + \phi_{2}(x^{(1)}, x^{(2)}),}} \\{{\}} \\{{\cdots \quad \cdots \quad \cdots}} \\{{u^{(n)}(x) = x^{(n)} + \phi_{n - 1}(x^{(1)}, \ldots, x^{(n - 1)}),}} \end{array}\tag{4.1.46}
$$

where $\phi_{1}, \cdots, \phi_{n - 1}$ are arbitrary differentiable functions. It is clear that the Jacobian $u^{\prime}(x)$ is an upper-triangular matrix with unit diagonal. Thus, this transformation is non-degenerate.

## 4.1.4 Implementation Issues

## 4.1.4.1 Minimizing the Cubic Regularization

In order to compute the mapping $T_{M}(x)$ , we need to solve an auxiliary minimization problem (4.1.5), namely,

$$
\begin{array}{r}{\underset{h \in \mathbb{R}^{n}}{\operatorname{min}} \left[v(h) \ \stackrel{\mathrm{def}}{=} \ \langle g, h \rangle + \frac{1}{2} \langle Hh, h \rangle + \frac{M}{6} \| h \|^{3} \right].} \end{array}\tag{4.1.47}
$$

If the Hessian H is indefinite, this problem is nonconvex. It can have many strict isolated minima, while we need to find a global one. Nevertheless, as we will show in this section, this problem is equivalent to a convex univariate optimization problem.

Note that the objective function of the optimization problem (4.1.47) can be represented in the following way:

$$
\begin{array}{r}{v(h) = \underset{\tau \in \mathbb{R}}{\operatorname{min}} \left\{\tilde{v}(h, \tau) \stackrel{\mathrm{def}}{=} \langle g, h \rangle + \frac{1}{2} \langle Hh, h \rangle + \frac{M}{6} | \tau |^{3 / 2} : \| h \|^{2} \leq \tau \right\}.} \end{array}
$$

Thus, the point $T_{M}(x)$ can be found from the following problem

$$
\operatorname{min}_{h \in \mathbb{R}^{n}, \tau \in \mathbb{R}} \left[\tilde{v}(h, \tau) : \f(h, \tau) \stackrel{\mathrm{def}}{=} \frac 12 \| h \|^{2} - \frac 12 \tau \leq 0 \right].
$$

Since this is already a constrained minimization problem, we can form for it a Lagrangian dual problem (see Sect. 1.3.3). Indeed, define the Lagrangian $\begin{array}{r}{\mathcal{L}(h, \tau, \lambda) = \tilde{\upsilon}(h, \tau) \stackrel{}{+} \lambda[\frac{1}{2} \| h \|^{2} - \frac{1}{2} \tau]} \end{array}$ with $\textit{h} \in \mathbb{R}^{n}$ and $\tau, \lambda \in \mathbb{R}$ . Then the dual function is

$$
\begin{array}{r}{\psi(\lambda) = \operatorname{inf}_{h \in \mathbb{R}^{n}, \tau \in \mathbb{R}} \left\{\langle g, h \rangle + \frac{1}{2} \langle Hh, h \rangle + \frac{M}{6} | \tau |^{3 / 2} + \lambda[\frac{1}{2} \| h \|^{2} - \frac{1}{2} \tau] \right\}.} \end{array}
$$

The optimal value of τ can be found from the equation $\begin{array}{r}{\frac{M}{4} | \tau |^{1 / 2} \mathrm{sign}(\tau) = \frac{1}{2} \lambda} \end{array}$ Therefore, $\begin{array}{r}{\tau(\lambda) = \frac{4 \lambda | \lambda |}{M^{2}}} \end{array}$ , and we have

$$
\begin{array}{r}{\psi(\lambda) = \operatorname{inf}_{h \in \mathbb{R}^{n}} \left\{\langle g, h \rangle + \frac{1}{2} \langle(H + \lambda I_{n}) h, h \rangle - \frac{2}{3M^{2}} | \lambda |^{3} \right\},} \end{array}
$$

$$
\mathrm{dom} ~ \psi = \left\{\lambda \in \mathbb{R} : \operatorname{inf}_{h \in \mathbb{R}^{n}}[q_{\lambda}(h) \{\stackrel{\mathrm{def}}{=}} \ \langle g, h \rangle +{\frac{1}{2}} \langle(H + \lambda I_{n}) h, h \rangle] > - \infty \right\}.
$$

Let us describe the structure of dom $\psi$ . Without loss of generality, we can assume that $H$ is a diagonal matrix with values $\{H_{i}\}_{i = 1}^{n}$ on the diagonal. Let $H_{\operatorname{min}} = \operatorname{min}_{1 \leq i \leq n} H_{i}$

If $\lambda > - H_{\mathrm{{min}}}$ , then $\lambda \in$ dom ψ. If $\lambda < - H_{\mathrm{{min}}}$ , then $\lambda \notin$ dom $\psi$ . Thus, only the status of the point $\lambda = - H_{\operatorname{min}}$ can be different. Define

$$
G^{2} = \sum_{i \in I^{*}}(g^{(i)})^{2}, ~ I^{*} = \{i : H_{i} = H_{\operatorname{min}}\}.
$$

There are three possibilities.

1. $G^{2} > 0$ . Then dom $\psi = \{\lambda \in \mathbb{R} : \lambda > - H_{\operatorname{min}}\}$ . For any $\lambda$ in this domain we have

$$
\begin{array}{r}{\psi(\lambda) = - \frac{1}{2} \frac{G^{2}}{H_{\mathrm{min}} + \lambda} - \frac{1}{2} \displaystyle \sum_{i \notin I^{*}} \frac{(g^{(i)})^{2}}{H_{i} + \lambda} - \frac{2}{3M^{2}} | \lambda |^{3}.} \end{array}\tag{4.1.48}
$$

At the same time, the optimal vector for the function $q_{\lambda}(\cdot)$ has the form

$$
h(\lambda) = -(H + \lambda I_{n})^{- 1} g.
$$

This vector and value $\tau(\lambda)$ are uniquely defined and continuous on dom $\psi$ Hence, in view of Theorem 1.3.2, we have

$$
\operatorname{min}_{h \in \mathbb{R}^{n}} v(h) = \operatorname{max}_{\lambda \in \operatorname{dom} \psi \bigcap \mathbb{R}_{+}} \psi(\lambda).\tag{4.1.49}
$$

2. $G^{2} = 0$ . Then dom $\psi = \{\lambda \in \mathbb{R} : \ \lambda \geq - H_{\operatorname{min}}\}$ . In this case, for any $\lambda >$ $- H_{\operatorname{min}}$ , the optimal vector is uniquely defined as follows:

$$
\begin{array}{r}{h^{(i)}(\lambda) = \left\{\begin{array}{ll}{\frac{g^{(i)}}{H_{i} + \lambda}, \mathrm{if} i \notin I^{*},} \\{\quad \0, \mathrm{otherwise},} \end{array} \right.\i = 1, \dots, n.} \end{array}\tag{4.1.50}
$$

This vector is continuous on dom $\psi$ . Therefore, if

$$
\lambda^{*} \stackrel{\mathrm{def}}{=} \arg \operatorname{max}_{\lambda \in \mathrm{dom} ~ \psi \bigcap \mathbb{R}_{+}} \psi(\lambda) ~ > ~ - H_{\operatorname{min}},
$$

then the conditions of Theorem 1.3.2 are satisfied. Hence, in this case relation (4.1.49) is also valid.

3. The only remaining case is $G^{2} = 0$ and $\lambda^{*} = - H_{\operatorname{min}}$ . This is possible only if $H_{\operatorname{min}} \leq 0$ and the gradient is small enough $(\boldsymbol{e}.\boldsymbol{g}.\g \ = \0)$ . In this situation, the rule (4.1.50) does not work and we need to form the solution of problem (4.1.47) using an eigenvector of matrix $H$ , which corresponds to the eigenvalue $H_{\mathrm{min}}$

Let us choose an arbitrary $k \in I^{*}$ and a small parameter $\delta > 0$ . Define a new function

$$
\begin{array}{r}{{v}_{\delta}(h) = v(h) + \delta h^{(k)}.} \end{array}
$$

This function satisfies the condition of Item 1. Therefore, in view of (4.1.49) we have

$$
\operatorname{max}_{h \in \mathbb{R}^{n}} v_{\delta}(h) = \operatorname{max}_{\lambda \in \mathsf{dom} ~ \psi_{\delta} \bigcap \mathbb{R}_{+}} \psi_{\delta}(\lambda),
$$

$$
\begin{array}{r}{\psi_{\delta}(\lambda) = - \frac{1}{2} \frac{\delta^{2}}{H_{\mathrm{min}} + \lambda} - \frac{1}{2} \displaystyle \sum_{i \notin I^{*}} \frac{(g^{(i)})^{2}}{H_{i} + \lambda} - \frac{2}{3M^{2}} | \lambda |^{3}.} \end{array}
$$

Since dom $\psi_{\delta} =(- H_{\mathrm{min}}, + \infty)$ , the optimal point of the dual problem ${\lambda}_{\delta}^{*}$ can be found from the following equation:

$$
\begin{array}{r}{\frac{\delta^{2}}{(H_{\mathrm{min}} + \lambda)^{2}} + \displaystyle \sum_{i \notin I^{*}} \frac{(g^{(i)})^{2}}{(H_{i} + \lambda)^{2}} = \frac{4 \lambda^{2}}{M^{2}}.} \end{array}\tag{4.1.51}
$$

Thus, the optimal vector for the primal problem is

$$
h_{*}(\delta) = -(H + \lambda_{\delta}^{*} I_{n})^{- 1}(g + \delta e_{k}).
$$

All components $h_{*}^{(i)}(\delta)$ with $i \neq k$ are continuous in δ (recall that H is a diagonal matrix). For $i = k$ , we have

$$
\begin{array}{r}{h_{\ast}^{(k)}(\delta) = - \frac{\delta}{H_{\mathrm{min}} + \lambda_{\delta}^{\ast}} \stackrel{(4.1.51)}{=} - \left[\frac{4(\lambda_{\delta}^{\ast})^{2}}{M^{2}} - \sum_{i \notin I^{\ast}} \frac{(g^{(i)})^{2}}{(H_{i} + \lambda_{\delta}^{\ast})^{2}} \right]^{1 / 2}.} \end{array}
$$

Thus, there exists a limit $h_{*} = \operatorname{lim}_{\delta \to 0} h_{*}(\delta)$ , defined as follows:

$$
\begin{array}{rl} &{h_{*} = \displaystyle \sum_{i \notin I^{*}} h_{*}^{(i)} e_{i} + h_{*}^{(k)} e_{k}, \quad h_{*}^{(i)} = - \frac{g^{(i)}}{H_{i} - H_{\operatorname{min}}}, \quad i \notin I^{*},} \\ &{h_{*}^{(k)} = - \left[\frac{4H_{\operatorname{min}}^{2}}{M^{2}} - \displaystyle \sum_{i \notin I^{*}} \frac{(g^{(i)})^{2}}{(H_{i} - H_{\operatorname{min}})^{2}} \right]^{1 / 2}.} \end{array}\tag{4.1.52}
$$

It is easy to see that $h_{*}$ is a global optimum for problem (4.1.47). Indeed, for any $h \in \mathbb{R}^{n}$ we have

$$
v_{\delta}(h) \ge v_{\delta}(h_{*}(\delta)) \ge \v(h_{*}(\delta)) - \delta | h_{*}^{(k)}(\delta) |.
$$

Taking in these inequalities the limit as $\delta 0$ , we get $v(h) \geq v(h_{*})$ .

Note that in both Items 1 and 2, the optimal solution of the dual problem $\lambda^{*}$ satisfies the first-order optimality condition

$$
\psi^{\prime}(\lambda^{*}) = - \textstyle{\frac{1}{2}} \frac{G^{2}}{(H_{\operatorname{min}} + \lambda^{*})^{2}} - \textstyle{\frac{1}{2}} \sum_{i \notin I^{*}} \frac{(g^{(i)})^{2}}{(H_{i} + \lambda^{*})^{2}} - \frac{2}{M^{2}}(\lambda^{*})^{2} \stackrel{(1.2.4)}{=} 0,
$$

and the optimal global solution of primal problem (4.1.47) is $h_{*} = -(H + \lambda^{*} I_{n})^{- 1} g$ In other words, $\lambda^{*}$ satisfies the equation

$$
\begin{array}{r}{\|(H + \lambda^{*} I_{n})^{- 1} g \| = \frac{2}{M} \lambda^{*}.} \end{array}\tag{4.1.53}
$$

Thus, $\begin{array}{r}{r_{M}(x) = \| h_{*} \| = \frac{2}{M} \lambda^{*}} \end{array}$ , and we conclude that $\begin{array}{r}{H + \frac{Mr_{M}(x)}{2} I_{n} \ \succeq \0} \end{array}$ (this is (4.1.8)). Note that in the case described in Item 3, we have $\begin{array}{r}{\| h_{*} \| = \frac{2 | H_{\operatorname{min}} |}{M}} \end{array}$ , Thus, we also have

$$
\begin{array}{rl}{H + \frac{Mr_{M}(x)}{2} I_{n} = H + | H_{\operatorname{min}} | I_{n}} &{\succeq 0.} \end{array}
$$

Using the new variable r, we can rewrite equation (4.1.53) in the following form

$$
\begin{array}{r}{r = \parallel \left(H + \frac{Mr}{2} I \right)^{- 1} g \parallel,} \end{array}\tag{4.1.54}
$$

with $r \geq \frac{2}{M}(- \lambda_{\operatorname{min}}(H))_{+}$ . A technique for solving such equations is very well developed for the needs of Trust Region Methods. As compared with (4.1.54), the equations for Trust Region Schemes have a constant left-hand side. But of course, all possible difficulties with (4.1.54) are due to the non-linear convex right-hand side. In any case, before running a procedure for solving this equation, it is reasonable to transform the matrix H into a tri-diagonal form using the Lanczos algorithm. In the general case, it takes $O(n^{3})$ operations.

In order to illustrate possible difficulties arising in the dual problem, let us look at the following example.

Example 4.1.4 Let $n = 2$ and

$$
g =(- 1, 0)^{T}, \quad H_{1} = 0, \quad H_{2} = - 1, \quad M = 1.
$$

Thus, our primal problem is as follows:

$$
\operatorname{min}_{h \in \mathbb{R}^{2}} \left\{\psi(h) \equiv - h^{(1)} - \frac{1}{2} \left(h^{(2)} \right)^{2} + \frac{1}{6} \left[\sqrt{\left(h^{(1)} \right)^{2} + \left(h^{(2)} \right)^{2}} \right]^{3} \right\}.
$$

Following (4.1.6), we have to solve the system of two non-linear equations:

$$
\begin{array}{r}{\frac{h^{(1)}}{2} \sqrt{\left(h^{(1)} \right)^{2} + \left(h^{(2)} \right)^{2}} = 1,} \end{array}
$$

$$
\begin{array}{r}{\frac{h^{(2)}}{2} \sqrt{\left(h^{(1)} \right)^{2} + \left(h^{(2)} \right)^{2}} = h^{(2)}.} \end{array}
$$

Thus, we have three candidate solutions:

$$
h_{1}^{*} =(\sqrt{2}, 0)^{T}, \quad h_{2}^{*} =(1, \sqrt{3})^{T}, \quad h_{3}^{*} =(1, - \sqrt{3})^{T}.
$$

By direct substitution, we can see that

$$
\begin{array}{r}{\psi(h_{1}^{*}) = - \frac{2 \sqrt{2}}{3} ~ > ~ - \frac{7}{6} = \psi(h_{2}^{*}) = \psi(h_{3}^{*}).} \end{array}
$$

Thus, both $h_{2}^{*}$ and $h_{3}^{*}$ are our global solutions.

Let us look at the dual problem. Since $G^{2} = 0$ , we have the following objective:

$$
\psi(\lambda) \stackrel{(4.1.48)}{=} -{\textstyle \frac{1}{2 \lambda}} -{\textstyle \frac{2}{3}} \lambda^{3}.
$$

We need to maximize this function subject to the constraint $\lambda \ge(- H_{\operatorname{min}})_{+} = 1$ Since $\psi^{\prime}(1) < 0$ , we conclude that $\lambda^{*} = 1$ . Thus, using representation (4.1.52), we get

$$
\begin{array}{r}{h^{*} = - e_{1} \cdot \frac{- 1}{0 + 1} + e_{2} \left[4H_{\operatorname{min}}^{2} - \frac{1}{(- H_{\operatorname{min}})^{2}} \right]^{1 / 2} =(1, \sqrt{3})^{T}.} \end{array}
$$

To the best of our knowledge, a technique for finding the global minimum of problem (4.1.47) in the degenerate situation of Item 3 without computing an eigenvalue decomposition of the matrix H is not known yet. Of course, we can always say that this degeneracy disappears with probability one after an arbitrary small random perturbation of the vector g.

## 4.1.4.2 Line Search Strategies

Let us discuss the computational cost of Step 1 in method (4.1.16), which consists in finding $M_{k} \in[L_{0}, 2L]$ satisfying the equation:

$$
f(T_{M_{k}}(x_{k})) \leq \bar{f}_{M_{k}}(x_{k}).
$$

Note that for $M_{k} \ge L$ this inequality holds. Consider now the following backtracking strategy.

$$
\mathrm{Find ~ the ~ first} i_{k} \geq 0 \mathrm{~ such ~ that ~} f(T_{2^{i_{k}} M_{k}}(x)) \leq \bar{f}_{2^{i_{k}} M_{k}}(x_{k}).\tag{4.1.55}
$$

$$
\mathrm{Define} \x_{k + 1} : = T_{2^{i_{k}} M_{k}}(x_{k}) \ \mathrm{and} \M_{k + 1} : = 2^{i_{k}} M_{k}.
$$

If we apply this procedure at each iteration of process (4.1.16), which starts from $M_{0} \in[L_{0}, 2L]$ , then we have the following advantages:

$M_{k} \le 2L$

- The total amount of additional computations of mappings $T_{M_{k}}(\cdot)$ during N iterations of process (4.1.16) is equal to

$$
\begin{array}{r}{\sum_{k = 0}^{N} i_{k} = \displaystyle \sum_{k = 0}^{N} \log_{2} \frac{M_{k + 1}}{M_{k}} = \log_{2} \frac{M_{N + 1}}{M_{0}} \leq 1 + \log_{2} \frac{L}{L_{0}}.} \end{array}
$$

(Indeed, if $i_{k} = 0,$ , then we compute only one mapping $T_{M_{k}}(\cdot)$ at this iteration.) The right-hand side of the above bound does not depend on N, the number of iterations of the main process.

However, it may happen that rule (4.1.55) is too conservative. Indeed, we can only increase our estimates for the constant L and never let them go down. This may force the method to take only short steps. A more optimistic strategy is as follows:

Find the first $i_{k} \ge 0$ such that $f(T_{2^{i_{k}} M_{k}}(x_{k})) \leq \bar{f}_{2^{i_{k}} M_{k}}(x_{k}).$

$$
\mathrm{Define} \x_{k + 1} : = T_{2^{i_{k}} M_{k}}(x_{k}) \ \mathrm{and} \M_{k + 1} : = \operatorname{max} \left\{L_{0}, 2^{i_{k} - 1} M_{k} \right\}.\tag{4.1.56}
$$

Then the total amount of additional computations of mappings $T_{M_{k}}(\cdot)$ after N iterations of the process (4.1.16) can be bounded as follows

$$
\begin{array}{r}{\displaystyle \sum_{k = 0}^{N} i_{k} \leq \sum_{k = 0}^{N} \log_{2} \frac{2M_{k + 1}}{M_{k}} = N + 1 + \log_{2} \frac{M_{N + 1}}{M_{0}} \leq N + 2 + \log_{2} \frac{L}{L_{0}}.} \end{array}
$$

Thus, after N iterations of this process, we never compute more than

$$
\begin{array}{r}{2N + 3 + \log_{2} \frac{2L}{L_{0}}} \end{array}
$$

mappings $T_{M}(\cdot)$ . This is a reasonable price to pay for the possibility of moving by long steps.

## 4.1.5 Global Complexity Bounds

Let us compare the complexity results presented in this section with some known facts on global efficiency bounds of other minimization schemes.

Assume that the function $f$ is strongly convex on $\mathbb{R}^{n}$ with convexity parameter $\mu > 0$ (see (4.1.32)). In this case, there exists its unique global minimum $x^{*}$ , and condition (4.1.27) holds for all $x \in \mathbb{R}^{n}$ (see Theorem 2.1.8). Assume also that the Hessian of this function is Lipschitz continuous:

$$
\| \nabla^{2} f(x) - \nabla^{2} f(y) \| \leq L \| x - y \|, \quad \forall x, y \in \mathbb{R}^{n}.
$$

For such functions, let us obtain the complexity bounds of method (4.1.16) using the results of Theorems 4.1.4 and 4.1.5.

Indeed, let us fix some $x_{0} \in \mathbb{R}^{n}$ . Denote by $D$ the radius of its level set:

$$
D = \operatorname{max}_{x} \{\| x - x^{*} \| : \f(x) \leq f(x_{0})\}.
$$

From the condition (4.1.27), we get

$$
\begin{array}{r}{D \le \left[\frac{2}{\mu}(f(x_{0}) - f(x^{*})) \right]^{1 / 2}.} \end{array}
$$

We will see that it is natural to measure the quality of the starting point $x_{0}$ by the following characteristic:

$$
\begin{array}{r}{\varkappa \equiv \varkappa(x_{0}) = \frac{LD}{\mu}.} \end{array}
$$

Let us introduce three switching values

$$
\begin{array}{r}{\omega_{0} = \frac{\mu^{3}}{18L^{2}} \equiv \frac{4}{9} \bar{\omega}, \quad \omega_{1} = \frac{3}{2} \mu D^{2}, \quad \omega_{2} = \frac{3}{2} LD^{3}.} \end{array}
$$

In view of Theorem 4.1.4, we can reach the level $\begin{array}{r}{f(x_{0}) - f(x^{*}) \le \frac{1}{2} LD^{3}} \end{array}$ in one iteration. Therefore, without loss of generality we assume that

$$
f(x_{1}) - f(x^{*}) \leq \omega_{2}.
$$

Suppose we are interested in a very high accuracy of the solution. Note that the case $\varkappa \leq 1$ is very easy since the first iteration of method (4.1.16) comes very close to the region of super-linear convergence (see Item 2 of Theorem 4.1.5).

Consider the case $\varkappa \geq 1$ . Then $\omega_{0} \leq \omega_{1} \leq \omega_{2}$ . Let us estimate the duration of the following phases:

$$
\mathrm{Phase ~} 1 \colon \omega_{1} \leq f(x_{i}) \leq \omega_{2},
$$

$$
\mathrm{Phase} 2 \colon \omega_{0} \leq f(x_{i}) \leq \omega_{1},
$$

$$
\mathrm{Phase} 3 : \epsilon \le f(x_{i}) \le \omega_{0}.
$$

In view of Theorem 4.1.4, the duration $k_{1}$ of the first phase is bounded as follows:

$$
\begin{array}{r}{\omega_{1} \leq \frac{3LD^{3}}{2(1 + \frac{1}{3} k_{1})^{2}}.} \end{array}
$$

Thus, $k_{1} \le 3 \sqrt{\varkappa}$ . Further, in view of Item 1 of Theorem 4.1.5, we can bound the duration $k_{2}$ of the second phase:

$$
\begin{array}{rl} &{\omega_{0}^{1 / 4} \leq(f(x_{k_{1} + 1}) - f(x^{*}))^{1 / 4} - \frac{k_{2}}{6} \omega_{0}^{1 / 4}} \\ &{} \\ &{\qquad \leq(\frac{1}{2} \mu D^{2})^{1 / 4} - \frac{k_{2}}{6} \omega_{0}^{1 / 4}.} \end{array}
$$

This gives the following bound: $k_{2} \leq 3^{3 / 4} 2^{1 / 2} \sqrt{\varkappa} \leq 3.25 \sqrt{\varkappa}.$

Finally, let $\begin{array}{r}{\delta_{k} = \frac{1}{4 \omega_{0}}(f(x_{k}) - f(x^{*}))} \end{array}$ . In view of inequality (4.1.29) we have:

$$
\delta_{k + 1} \leq \delta_{k}^{3 / 2}, \quad k \geq \bar{k} \equiv k_{1} + k_{2} + 1.
$$

At the same time $f(x_{\bar{k}}) - f(x^{*}) \leq \omega_{0}$ . Thus, $\begin{array}{r}{\delta_{\bar{k}} \leq \frac{1}{4}} \end{array}$ , and the bound on the duration $k_{3}$ of the last phase can be found from the following inequality:

$$
\begin{array}{r}{\left(\frac{3}{2} \right)^{k_{3}} \ln 4 \le \ln \frac{4 \omega_{0}}{\epsilon}.} \end{array}
$$

This is $\begin{array}{r}{k_{3} \le \log_{\frac{3}{7}} \log_{4} \frac{2 \mu^{3}}{9 \epsilon L^{2}}} \end{array}$ . Putting all the bounds together, we obtain that the total number of steps N in (4.1.16) is bounded as follows:

$$
\begin{array}{r}{N \leq 6.25 \sqrt{\frac{LD}{\mu}} + \log_{\frac{3}{2}} \left(\log_{4} \frac{1}{\epsilon} + \log_{4} \frac{2 \mu^{3}}{9L^{2}} \right).} \end{array}\tag{4.1.57}
$$

It is interesting that in estimate (4.1.57) the parameters of our problem interact with accuracy in an additive way. Recall that usually such an interaction is multiplicative. Let us estimate, for example, the complexity of our problem for the Fast Gradient Method (2.2.20) for strongly convex functions with Lipschitz continuous gradient. Denote by Lˆ the largest eigenvalue of the matrix $\nabla^{2} f(x^{*})$

Then we can guarantee that

$$
\mu I \preceq \nabla^{2} f(x) \preceq(\hat{L} + LD) I \quad \forall x, \| x - x^{*} \| \leq D.
$$

Thus, the complexity bound for the optimal gradient method is of the order of

$$
\begin{array}{r}{O \left(\sqrt{\frac{\hat{L} + LD}{\mu}} \ln \frac{(\hat{L} + LD) D^{2}}{\epsilon} \right)} \end{array}
$$

iterations. For the Gradient Method (2.1.37) it is even worse:

$$
\begin{array}{r}{O \left(\frac{\hat{L} + LD}{\mu} \ln \frac{(\hat{L} + LD) D^{2}}{\epsilon} \right).} \end{array}
$$

Thus, we conclude that the global complexity bounds of the Cubic Newton Method (4.1.16) are considerably better than the estimates of the gradient schemes. At the same time, we should recall, of course, the difference in computational cost of each iteration.

Note that similar bounds can be obtained for other classes of non-convex problems. For example, for nonlinear transformations of convex functions (see Sect. 4.1.3.3), the complexity bound is as follows:

$$
\begin{array}{r}{N \le 6.25 \sqrt{\frac \sigma \mu LD} + \log_{\frac{3}{2}} \left(\log_{4} \frac 1 \epsilon + \log_{4} \frac{2 \mu^{3}}{9 \sigma^{6} L^{2}} \right).} \end{array}\tag{4.1.58}
$$

To conclude, note that in scheme (4.1.16) it is possible to find elements of the Levenberg–Marquardt approach (see relation (4.1.8)), or a trust-region idea (see the discussion in Sect. 4.1.4.1), or a line-search technique (see the rule of Step 1 in (4.1.16)). However, all these facts are consequences of the main idea of the scheme, consisting in computation of the next test point of the process as a global minimizer of cubic regularization of the second-order approximation, which globally overestimates the values of the objective function.

## 4.2 Accelerated Cubic Newton

(Primal and dual spaces; Uniformly convex functions; Regularization of Newton iteration; An Accelerated scheme Global non-degeneracy for second-order schemes; Minimizing strongly convex functions; False accelerations.)

## 4.2.1 Real Vector Spaces

Starting from this section, we often work with more abstract real vector spaces. In the previous part of the book, we were dealing mainly with the simplest space $\mathbb{R}^{n}$ . However, very often we need to highlight the fundamental difference between the vectors of decision variables and the vectors of gradients. The simplest way of doing this is to just keep them in different spaces. For us, the space for variables will always be the primal space, and the space for gradients will be the dual space.

Let E be a finite-dimensional real vector space, and $\mathbb{E}^{*}$ be its dual space, comprised of linear functions on E. Denote by $\langle s, x \rangle_{\mathbb{E}}$ the value of $s \in \mathbb{E}^{*}$ at a point $x \in \mathbb{E}$ (sometimes it is called the scalar product of s and x). If there is no ambiguity of notation, the subscript of the scalar product is usually omitted. Since we always work in finite dimensions, we have $(\mathbb{E}^{*})^{*} = \mathbb{E}$

Consider, for example, a differentiable function f with dom $f = \mathbb{E}$ . Then, by definition of the gradient, we have

$$
f(x + h) = f(x) + \langle \nabla f(x), h \rangle + o(\| h \|), \quad x, h \in \mathbb{E}.
$$

Thus, the gradient defines a linear function of x, and therefore $\nabla f(x) \in \mathbb{E}^{*}$ . It is important to remember that the coordinate form of the gradient (1.2.3) makes sense only if $\mathbb{E} = \mathbb{E}^{*} = \mathbb{R}^{n}$ . In order to convert $\mathbb{E}$ to $\mathbb{R}^{n}$ , we need to fix a basis of this space. This operation can be done in many different ways, which significantly change the topology of functions and their characteristics. Therefore, it is often convenient to avoid this operation in explaining the principles of optimization schemes.

Further, for two spaces $\mathbb{E}_{1}$ and $\mathbb{E}_{2}^{*}$ , we can consider a linear operator $A : \mathbb { E } _ { 1 } $ $\mathbb{E}_{2}^{*}$ . For this operator, we can define the adjoint operator $A^{*}$ as follows:

$$
\langle Ax, y \rangle_{\mathbb{E}_{2}} \equiv \langle A^{*} y, x \rangle_{\mathbb{E}_{1}}, \quad \forall x \in \mathbb{E}_{1}, \y \in \mathbb{E}_{2}.
$$

Clearly, $A^{*}$ maps $\mathbb{E}_{2}$ to $\mathbb{E}_{1}^{*}$ . In the case when $\mathbb{E}_{1} = \mathbb{R}^{n}$ , and $\mathbb{E}_{2} = \mathbb{R}^{m}$ the operator A can be represented by an $(m \times n)$ -matrix. Then the matrix for $A^{*}$ is just its transpose: $A^{*} = A^{\bar{T}}$

In order to have a full picture, let us describe a standard procedure for converting E and $\mathbb{E}^{*}$ into $\mathbb{R}^{n}$ . Let n dim E. Let us choose a basis $B =(b_{1}, \ldots, b_{n})$ in E. We can treat it as a linear operator $B : \mathbb{R}^{n} \mathbb{E}$ defined by the following rule:

$$
x = B \bar{x} \ \stackrel{\mathrm{def}}{=} \ \sum_{i = 1}^{n} b_{i} \bar{x}^{(i)}, \quad \bar{x} =(\bar{x}^{(1)}, \ldots, \bar{x}^{(n)})^{T} \in \mathbb{R}^{n}.
$$

Using this basis, we can define a linear operator $B^{*} : \mathbb{E}^{*} \mathbb{R}^{n}$ as follows:

$$
\bar{s} =(\bar{s}^{(1)}, \ldots, \bar{s}^{(n)})^{T} \ = \B^{*} s \in \mathbb{R}^{n}, \quad s \in \mathbb{E}^{*},
$$

which is equivalent to the following rules:

$$
\bar{s}^{(i)} = \langle s, b_{i} \rangle, \quad i = 1, \dots, n.
$$

Then, using the operator $(B^{*})^{- 1} : \mathbb{R}^{n} \to \mathbb{E}^{*}$ , we can define the dual basis in $\mathbb{E}^{*}$ Indeed, $s =(B^{*})^{- 1} \bar{s} \in \mathbb{E}^{*}$ for $\overline{{s}} \in \mathbb{R}^{n}$ . Therefore, the corresponding basis vectors in $\mathbb{E}^{*}$ are as follows:

$$
\left((B^{*})^{- 1} e_{1}, \dots,(B^{*})^{- 1} e_{n} \right),
$$

where $e_{i}$ are the unit coordinate vectors in $\mathbb{R}^{n}, i = 1...., n$ . Note that

$$
\begin{array}{rl} &{\langle(B^{*})^{- 1} \bar{s}, b_{i} \rangle_{\mathbb{E}} = \langle(B^{*})^{- 1} \bar{s}, Be_{i} \rangle_{\mathbb{E}} = \langle B^{*}(B^{*})^{- 1} \bar{s}, e_{i} \rangle_{\mathbb{R}^{n}}} \\ &{} \\ &{= \bar{s}^{(i)}, \quad i = 1, \ldots, n.} \end{array}\tag{4.2.1}
$$

Hence, we get the following representation for the scalar product of two vectors $s \in \mathbb{E}^{*}$ and $x \in \mathbb{E}^{};$

$$
\begin{array}{rcl}{\langle s, x \rangle_{\mathbb{E}}} &{=} &{\langle(B^{*})^{- 1} \bar{s}, B \bar{x} \rangle_{\mathbb{E}} = \displaystyle \sum_{i = 1}^{n} \bar{x}^{(i)} \langle(B^{*})^{- 1} \bar{s}, b_{i} \rangle} \end{array}
$$

$$
\stackrel{(4.2.1)}{=} \sum_{i = 1}^{m} \bar{x}^{(i)} \bar{s}^{(i)} = \bar{s}^{T} \bar{x} \equiv \langle \bar{s}, \bar{x} \rangle_{\mathbb{R}^{n}}.
$$

Further, the operator $B : \mathbb{E} \mathbb{E}^{*}$ is called self-adjoint if

$$
\langle Bx, y \rangle \equiv \langle By, x \rangle, \quad \forall x, y \in \mathbb{E}.
$$

For $\mathbb{E} = \mathbb{R}^{n}$ a self-adjoint operator is represented by a symmetric matrix. The most important examples of self-adjoint operators are given by Hessians. Indeed, by definition (see (1.2.7)), we have

$$
\nabla f(x + h) = \nabla f(x) + \nabla^{2} f(x) h + \mathbf{o}(\| h \|) \ \in \ \mathbb{E}^{*}, \quad x \in \mathbb{E}, \h \in \mathbb{E}.
$$

Thus, $\nabla^{2} f(x)$ is a linear operator from $\mathbb{E}$ to $\mathbb{E}^{*}$ . This interpretation confirms the validity of the Newton direction:

$$
[\nabla^{2} f(x)]^{- 1} \nabla f(x) \in \mathbb{E}.
$$

It is well known that for twice continuously differentiable functions the matrix representation of the Hessian is symmetric. This means that any Hessian is a selfadjoint operator.

Finally, a self-adjoint operator $B : \mathbb{E} \mathbb{E}^{*}$ is positive semidefinite if

$$
\langle Bx, x \rangle \geq 0, \quad \forall x \in \mathbb{E},
$$

notation $B \succeq 0$ . If the above inequality is strict for all $x \neq 0.$ , we call the operator positive definite (notation $B \succ 0)$ . Positive definite operators are invertible.

Now we can define all necessary objects. Let us fix a positive definite self-adjoint operator $B : \mathbb{E} \mathbb{E}^{*}$ . Define the primal norm for the space $\mathbb{E}^{\cdot}$

$$
\| h \| = \langle Bh, h \rangle^{1 / 2}, \quad h \in \mathbb{E}.\tag{4.2.2}
$$

Our above discussion suggests that the most natural candidates for such an operator B are nondegenerate Hessians of convex functions. We will discuss this possibility in detail in Chap. 5.

The dual norm for $\mathbb{E}^{*}$ can be defined in the standard way:

$$
\| s \|_{*} = \operatorname{max}_{x \in \mathbb{E}} \{\langle s, x \rangle : \ \| x \| \leq 1\} \stackrel{(3.1.64)}{=} \ \langle s, B^{- 1} s \rangle^{1 / 2}, \quad s \in \mathbb{E}^{*}.\tag{4.2.3}
$$

An immediate consequence of this definition is the Cauchy–Schwarz inequality

$$
\begin{array}{r}{\langle s, x \rangle \stackrel{(4.2.3)}{\leq} \| s \|_{*} \cdot \| x \|, \quad x \in \mathbb{E}, s \in \mathbb{E}^{*}.} \end{array}\tag{4.2.4}
$$

Finally, for a linear operator $A : \mathbb{E} \mathbb{E}^{*}$ we have

$$
\| A \| = \operatorname{max}_{\| h \| \leq 1} \| Ah \|_{*}.\tag{4.2.5}
$$

If the operator A is self-adjoint, the same norm can be defined as

$$
\| A \| = \operatorname{max}_{\| h \| \leq 1} | \langle Ah, h \rangle |.\tag{4.2.6}
$$

Any $s \in \mathbb{E}^{*}$ generates a rank-one self-adjoint operator $ss^{*} : \mathbb{E} \to \mathbb{E}^{*}$ acting as follows

$$
ss^{*} \cdot x \ = \ \langle s, x \rangle \cdot s, \quad x \in \mathbb{E}.
$$

We extend the operator $A(s) \{\stackrel{\mathrm{def}}{=}} \{\frac{ss^{*}}{\| s \|_{*}}}$ onto the origin in a continuous way: $A(0) = 0$ <sup>∗</sup>In this section, we mainly consider functions with Lipschitz-continuous Hessian:

$$
\Vert \nabla^{2} f(x) - \nabla^{2} f(y) \Vert ~ \leq ~ L_{3} \Vert x - y \Vert, ~ x, y \in \mathbb{E},\tag{4.2.7}
$$

where $L_{3} \stackrel{\mathrm{def}}{=} L_{3}(f)$ . Consequently, for all x and y from E we have

$$
\begin{array}{r}{\| \nabla f(y) - \nabla f(x) - \nabla^{2} f(x)(y - x) \|_{*} \overset{(1.2.13)}{\leq} \frac{1}{2} L_{3} \| y - x \|^{2}.} \end{array}\tag{4.2.8}
$$

Moreover, for the quadratic model

$$
f_{2}(x; y){\overset{\underset{\mathrm{def}}{}}{=}} f(x) + \langle \nabla f(x), y - x \rangle +{\frac{1}{2}} \langle \nabla^{2} f(x)(y - x), y - x \rangle
$$

we can bound the residual:

$$
\begin{array}{r}{| f(y) - f_{2}(x; y) | \overset{(1.2.14)}{\leq} \frac{L_{3}}{6} \| y - x \|^{3}, \quad x, y \in \mathbb{E}.} \end{array}\tag{4.2.9}
$$

## 4.2.2 Uniformly Convex Functions

In this section, we will often use the cubic power function

$$
\begin{array}{r}{d_{3}(x) = \frac 13 \| x - x_{0} \|^{3}, ~ \nabla d_{3}(x) = \| x - x_{0} \| \cdot B(x - x_{0}), ~ x \in \mathbb{E}.} \end{array}
$$

This is the simplest example of the uniformly convex function. In order to understand their properties, we need to develop some theory.

Let the function $d(\cdot)$ be differentiable on a closed convex set $Q$ . We call it uniformly convex on $Q$ of degree $p \ge 2$ if there exists a constant $\sigma_{p} = \sigma_{p}(d) > 0$ such that<sup>1</sup>

$$
\begin{array}{r}{d(y) \geq d(x) + \langle \nabla d(x), y - x \rangle + \frac{1}{p} \sigma_{p} \| y - x \|^{p}, \quad \forall x, y \in Q.} \end{array}\tag{4.2.10}
$$

The constant $\sigma_{p}$ is called the parameter of uniform convexity of this function. By adding such a function to an arbitrary convex function, we get a uniformly convex function of the same degree and with the same value of parameter. Recall that degree $p = 2$ corresponds to strongly convex functions (see (2.1.20)). In our old notation, the parameter $\mu$ of strong convexity for the function $f$ corresponds to $\sigma_{2}(f)$

Note that any uniformly convex function grows faster than any linear function. Therefore, its level sets are always bounded. This implies that any minimization problem with uniformly convex objective is always solvable provided that its feasible set is nonempty. Moreover, its solution is always unique.

Adding two copies of inequality (4.2.10) with x and y interchanged, we get

$$
\begin{array}{r}{\langle \nabla d(x) - \nabla d(y), x - y \rangle \geq \frac{2}{p} \sigma_{p} \| x - y \|^{p}, \quad \forall x, y \in Q.} \end{array}\tag{4.2.11}
$$

It appears that this condition is sufficient for uniform convexity (however, for $p > 2$ the convexity parameter is changing).

Lemma 4.2.1 Assume that for some $p \geq 2, \sigma > 0;$ , and all $x, y \in Q$ the following inequality holds:

$$
\langle \nabla d(x) - \nabla d(y), x - y \rangle \geq \sigma \| x - y \|^{p}, \quad x, y \in Q.\tag{4.2.12}
$$

Then the function d is uniformly convex on $Q$ with degree p and parameter σ .

Proof Indeed,

$$
\begin{array}{l}{\displaystyle d(y) - d(x) - \langle \nabla d(x), y - x \rangle = \int_{0}^{1} \langle d(x + \tau(y - x)) - \nabla d(x), y - x \rangle d \tau} \\{\displaystyle_{0}} \\{\displaystyle = \int_{0}^{1} \frac{1}{\tau} \langle d(x + \tau(y - x)) - \nabla d(x), \tau(y - x) \rangle d \tau} \\{\displaystyle_{(4, 2, 12) \atop \geq} \int_{\sigma}^{1} \int_{\sigma \tau^{p - 1} \| y - x \|^{p} d \tau} = \frac{1}{p} \sigma \| y - x \|^{p}.} \end{array}
$$

Lemma 4.2.2 Let d be uniformly convex on Q of degree $p \ge 2.$ . Then for all x, $y \in$ Q we have

$$
\begin{array}{r}{d(y) - d(x) - \langle \nabla d(x), y - x \rangle \leq \frac{p - 1}{p} \left(\frac{1}{\sigma_{p}} \right)^{\frac{1}{p - 1}} \| \nabla d(y) - \nabla d(x) \|_{*}^{\frac{p}{p - 1}}.} \end{array}\tag{4.2.13}
$$

Proof Assume that d attains its global minimum on $\mathbb{E}$ at some point $x^{*} \in Q$ . Then

$$
\begin{array}{rl}{d(x^{*})} &{= \ \underset{y \in \mathcal{Q}}{\operatorname{min}} d(y) \overset{(4.2.10)}{\geq} \ \underset{x \in \mathcal{Q}}{\operatorname{min}} \bigg[d(x) + \langle \nabla d(x), y - x \rangle + \frac{1}{p} \sigma_{p} \| y - x \|^{p} \bigg]} \\ &{\geq \ \underset{x \in \mathbb{R}}{\operatorname{min}} \bigg[d(x) + \langle \nabla d(x), y - x \rangle + \frac{1}{p} \sigma_{p} \| y - x \|^{p} \bigg]} \\ &{(\overset{(4.2.3)}{=} d(x) - \frac{p - 1}{p} \left(\frac{1}{\sigma_{p}} \right)^{\frac{1}{p - 1}} \| \nabla d(x) \|_{*}^{\frac{p}{p - 1}}.} \end{array}
$$

Let us fix $x \in Q$ and consider the convex function $\phi(y) = d(y) - \langle \nabla d(x), y \rangle$ . It is uniformly convex of degree p and parameter $\sigma_{p}$ . Moreover, it attains its minimum at $y = x \in Q$ . Hence, applying the above inequality to $\phi(y)$ , we get (4.2.13).

Let us give an important example of a uniformly convex function. By fixing an arbitrary $x_{0} \in \mathbb{E}$ , we define the function $\begin{array}{r}{d_{p}(x) = \overset{\cdot}{\underset{p}{\ln}} \Vert x - x_{0} \Vert^{p}} \end{array}$ , where the norm is Euclidean (see (4.2.2)). Then

$$
\nabla d_{p}(x) \ : = \ : \| x - x_{0} \|^{p - 2} \cdot B(x - x_{0}), \quad x \in \mathbb{E}.
$$

Lemma 4.2.3 For any x and y from $\mathbb{E}$ we have

$$
\begin{array}{rl} &{\langle \nabla d_{p}(x) - \nabla d_{p}(y), x - y \rangle \geq \left(\frac{1}{2} \right)^{p - 2} \| x - y \|^{p},} \end{array}\tag{4.2.14}
$$

$$
\begin{array}{r}{d_{p}(x) - d_{p}(y) - \langle \nabla d_{p}(y), x - y \rangle \geq \frac{1}{p} \left(\frac{1}{2} \right)^{p - 2} \| x - y \|^{p}.} \end{array}\tag{4.2.15}
$$

Proof Without loss of generality, let us assume that $x_{0} = 0$ . Then

$$
\begin{array}{rl} &{\langle \nabla d_{p}(x) - \nabla d_{p}(y), x - y \rangle = \langle \| x \|^{p - 2} \cdot Bx - \| y \|^{p - 2} \cdot By, x - y \rangle} \\ &{} \\ &{\qquad = \| x \|^{p} + \| y \|^{p} - \langle Bx, y \rangle(\| x \|^{p - 2} + \| y \|^{p - 2}).} \end{array}
$$

To prove (4.2.14), we need to show that the right-hand side of the latter equality is greater than or equal to

$$
\left({\frac{1}{2}} \right)^{p - 2} \| x - y \|^{p} = \left({\frac{1}{2}} \right)^{p - 2} \left[\left\| x \right\|^{2} + \left\| y \right\|^{2} - 2 \langle Bx, y \rangle \right]^{p / 2}.
$$

Without loss of generality we can assume that $x \neq 0$ and $y \neq 0$ . Then, defining

$$
\begin{array}{r}{\tau \ = \ \frac{\| y \|}{\| x \|}, \quad \alpha = \frac{\langle Bx, y \rangle}{\| x \| \cdot \| y \|} \in[- 1, 1],} \end{array}
$$

we obtain the statement to be proved:

$$
1 + \tau^{p} \ \geq \ \alpha \tau(1 + \tau^{p - 2}) + \left(\frac{1}{2} \right)^{p - 2}[1 + \tau^{2} - 2 \alpha \tau]^{p / 2}, \quad \tau \geq 0, \quad | \alpha | \leq 1.\tag{4.2.16}
$$

Since the right-hand side of this inequality is convex in α, in view of Corollary 3.1.2, we need to justify two marginal inequalities:

$$
\begin{array}{r}{\alpha = 1 : \quad 1 + \tau^{p} \geq \tau(1 + \tau^{p - 2}) + \left(\frac{1}{2} \right)^{p - 2} | 1 - \tau |^{p},} \end{array}\tag{4.2.17}
$$

$$
\begin{array}{r}{\alpha = - 1 : \quad 1 + \tau^{p} \geq - \tau(1 + \tau^{p - 2}) + \left(\frac{1}{2} \right)^{p - 2}(1 + \tau)^{p}} \end{array}
$$

for all $\tau \geq 0$

The second inequality in (4.2.17) can be derived from the lower bound for the ratio

$$
\begin{array}{r}{\frac{1 + \tau^{p} + \tau(1 + \tau^{p - 2})}{(1 + \tau)^{p}} = \frac{1 + \tau^{p - 1}}{(1 + \tau)^{p - 1}}, \quad \tau \geq 0.} \end{array}
$$

Indeed, its minimum is attained at $\tau = 1$ , and this proves the second line in (4.2.17). To prove the first line, note that it is valid for $\tau = 1.\mathrm{If} \tau \geq 0$ and $\tau \neq 1$ , then we need to estimate from below the ratio

$$
\begin{array}{r}{\frac{1 + \tau^{p} - \tau(1 + \tau^{p - 2})}{| 1 - \tau |^{p}} = \frac{(1 - \tau)(1 - \tau^{p - 1})}{| 1 - \tau |^{p}} = \frac{1 + \tau + \cdots + \tau^{p - 2}}{| 1 - \tau |^{p - 2}}.} \end{array}
$$

Since the absolute value of any coefficient of the polynomial $(1 - \tau)^{p - 2}$ does not exceed $2^{p - 2}$ , the first line in inequality (4.2.17) is also justified. This proves (4.2.14), and, to prove (4.2.15), we can now use Lemma 4.2.1.

The main property of uniformly convex functions is the following growth condition.

Theorem 4.2.1 Let d be uniformly convex on $Q$ of degree $p \ \geq \2$ with positive constant $\sigma_{p}$ . Let $x^{*} = \arg \operatorname{min}_{x \in Q} d(x)$ . Then for all $x \in Q$ we have

$$
\begin{array}{r}{d({\boldsymbol x}) \geq d({\boldsymbol x}^{*}) + \frac{1}{p} \sigma_{p} \|{\boldsymbol x} -{\boldsymbol x}^{*} \|^{p}.} \end{array}\tag{4.2.18}
$$

Proof Indeed, in view of the first-order optimality condition (2.2.39), we have

$$
\langle \nabla d(x^{*}), x - x^{*} \rangle \geq 0, \quad x \in Q.
$$

Therefore, (4.2.18) follows from (4.2.10).

Thus, by (4.2.14) and Lemma 4.2.1 we conclude that $\begin{array}{r}{\sigma_{3}(d_{3}) = \frac{1}{2}} \end{array}$ . On the other hand we can prove the following important fact.

Lemma 4.2.4 For any $x, y \in \mathbb{E}$ we have

$$
\lVert \nabla^{2} d_{3}(x) - \nabla^{2} d_{3}(y) \rVert \leq 2 \lVert x - y \rVert.\tag{4.2.19}
$$

Proof For any $x \in \mathbb{E}$ , we have $\begin{array}{r}{\nabla^{2} d_{3}(x) = \| x \| B + \frac{1}{\| x \|} Bxx^{\ast} B} \end{array}$ . Clearly, for all $x \in \mathbb{E}$ we have

$$
\begin{array}{rlr}{{\Vert \nabla^{2} d_{3}(x) \Vert \stackrel{(4.2.4)}{\leq} 2 \Vert x \Vert.}} \end{array}\tag{4.2.20}
$$

Let us fix two points x, $y \in \mathbb{E}$ and an arbitrary direction $h \in \mathbb{E}$ . Define $x(\tau) =$ $x + \tau(y - x)$ and

$$
\begin{array}{r}{\phi(\tau) = \langle \nabla^{2} d_{3}(x(\tau)) h, h \rangle \ = \ \| x(\tau) \| \cdot \| h \|^{2} + \frac{1}{\| x(\tau) \|} \langle Bx(\tau), h \rangle^{2}, \quad \tau \in[0, 1].} \end{array}
$$

Assume first that $0 \not \in[x, y]$ . Then $\phi(\tau)$ is continuously differentiable on 0, 1 and

$$
\begin{array}{rl} &{\phi^{\prime}(\tau) = \frac{\langle Bx(\tau), y - x \rangle}{\| x(\tau) \|} \cdot \| h \|^{2} + \frac{2 \langle Bx(\tau), h \rangle}{\| x(\tau) \|} \langle Bh, y - x \rangle - \frac{\langle Bx(\tau), h \rangle^{2}}{\| x(\tau) \|^{3}} \langle Bx(\tau), y - x \rangle} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{\quad = \frac{\langle Bx(\tau), y - x \rangle}{\| x(\tau) \|} \cdot \underbrace{\left(\| h \|^{2} - \frac{\langle Bx(\tau), h \rangle^{2}}{\| x(\tau) \|^{2}} \right)}_{\geq 0 \mathrm{by}(4.2.4)} + \frac{2 \langle Bx(\tau), h \rangle}{\| x(\tau) \|} \langle Bh, y - x \rangle.} \end{array}
$$

$\begin{array}{r}{\operatorname{\lrcorner} \operatorname{et} \alpha = \frac{\langle Bx(\tau), h \rangle}{\| x(\tau) \| \cdot \| h \|} \in[- 1, 1].} \end{array}$ . Then

$$
| \phi^{\prime}(\tau) | \leq \| y - x \| \cdot \| h \|^{2} \cdot(1 - \alpha^{2} + 2 | \alpha |) \ \leq \2 \| y - x \| \cdot \| h \|^{2}.
$$

Hence,

$$
| \langle(\nabla^{2} d_{3}(y) - \nabla^{2} d_{3}(x)) h, h \rangle | ~ = ~ | \phi(1) - \phi(0) | ~ \leq ~ 2 \left\| y - x \right\| \cdot \left\| h \right\|^{2},
$$

and we get (4.2.19) from (4.2.6).

The remaining case $0 \in[x, y]$ is trivial since then $\| x - y \| = \| x \| + \| y \|$ and we can apply (4.2.20).

In the sequel, we often use Lipschitz constants for different derivatives. For $p \geq$ 2, denote by $L_{p}(f)$ the Lipschitz constant for the $(p - 1)$ -st derivative of the function $f \colon$

$$
\begin{array}{r}{\| \nabla^{(p - 1)} f(x) - \nabla^{(p - 1)} f(y) \| \leq L_{p}(f) \| x - y \|, \quad x, y \in \mathrm{dom} ~ f.} \end{array}\tag{4.2.21}
$$

In this notation, $L_{2}(f)$ is the Lipschitz constant for the gradient of the function $f$ At the same time, by Lemma 4.2.4, we conclude that $L_{3}(d_{3}) = 2$

We often establish the complexity of different problem classes in terms of condition numbers of variable degree:

$$
\begin{array}{r}{\gamma_{p}(f) \stackrel{\mathrm{def}}{=} \frac{\sigma_{p}(f)}{L_{p}(f)}, \quad p \geq 2.} \end{array}\tag{4.2.22}
$$

It is clear, for example, that for $\begin{array}{r}{d_{2}(x) = \frac{1}{2} \| x - x_{0} \|^{2}} \end{array}$ we have $\gamma_{2}(d_{2}) = 1$ . On the other hand, we have seen that $\begin{array}{r}{\gamma_{3}(d_{3}) = \frac{1}{4}} \end{array}$

## 4.2.3 Cubic Regularization of Newton Iteration

Consider the following minimization problem:

$$
\operatorname{min}_{x \in \mathbb{E}} f(x),\tag{4.2.23}
$$

where E is a finite-dimension real vector space, and $f$ is a twice differentiable convex function with Lipschitz-continuous Hessian. As was shown in Sect. 4.1, the global rate of convergence of the Cubic Newton Method (CNM) on this problem class is of the order $O(\textstyle{\frac{1}{k^{2}}})$ , where k is the iteration counter (see Theorem 4.1.4). However, note that CNM is a local one-step second-order method. From the complexity theory of smooth Convex Optimization, it is known that the rate of convergence of the local one-step first-order method (this is just the Gradient Method, see Theorem 2.1.14) can be improved from $O(\textstyle{\frac{1}{k}})$ to $O(\textstyle{\frac{1}{k^{2}}})$ by applying a $multi - step$ strategy (see, for example, Theorem 2.2.3). In this section we show that a similar trick also works with CNM. As a result, we get a new method, which converges on the specified problem class as $O(\textstyle{\frac{1}{k^{3}}})$

Let us recall the most important properties of cubic regularization of Newton’s method, taking into account the convexity of the objective function.

As suggested in Sect. 4.1, we introduce the following mapping:

$$
T_{M}(x) \stackrel{\mathrm{def}}{=} \mathrm{Arg} \operatorname{min}_{y \in \mathbb{E}} \left[\hat{f}_{M}(x; y) \stackrel{\mathrm{def}}{=} f_{2}(x; y) + \frac{M}{6} \| y - x \|^{3} \right].\tag{4.2.24}
$$

Note that $T = T_{M}(x)$ is a unique solution of the following equation

$$
\begin{array}{r}{\nabla f(x) + \nabla^{2} f(x)(T - x) + \frac{1}{2} M \cdot \Vert T - x \Vert \cdot B(T - x) = 0.} \end{array}\tag{4.2.25}
$$

Define $r_{M}(x) = \| x - T_{M}(x) \|$ . Then,

$$
\begin{array}{rlr}{{\| \nabla f(T) \|_{*} \overset{(4, 2.25)}{=} \| \nabla f(T) - \nabla f(x) - \nabla^{2} f(x)(T - x) - \frac{M}{2} r_{M}(x) B(T - x) \|_{*}}} \\ &{} &{\overset{(4.2.8)}{\leq} \frac{L_{3} + M}{2} r_{M}^{2}(x).} &{(4.2.26)} \end{array}
$$

Further, multiplying (4.2.25) by $T - x$ , we obtain

$$
\langle \nabla f(x), x - T \rangle = \langle \nabla^{2} f(x)(T - x), T - x \rangle + \frac{1}{2} Mr_{M}^{3}(x).\tag{4.2.27}
$$

Let us assume that $M \geq L_{3}$ . Then, in view of (4.2.9), we have

$$
\begin{array}{l}{\displaystyle{f(x) - f(T) \geq f(x) - \hat{f}_{M}(x; T)}} \\{\displaystyle{\qquad = \langle \nabla f(x), x - T \rangle - \frac{1}{2} \langle \nabla^{2} f(x)(T - x), T - x \rangle - \frac{M}{6} r_{M}^{3}(x)}} \\{\displaystyle{\qquad = \frac{1}{2} \langle \nabla^{2} f(x)(T - x), T - x \rangle + \frac{M}{3} r_{M}^{3}(x)}.} \end{array}\tag{28}
$$

In particular, since f is convex,

$$
\begin{array}{r}{f(x) - f(T) \stackrel{(4.2.28)}{\geq} \frac{M}{3} r_{M}^{3}(x) \stackrel{(4.2.26)}{\geq} \frac{M}{3} \left(\frac{2}{L_{3} + M} \| \nabla f(T) \|_{*} \right)^{3 / 2}.} \end{array}\tag{4.2.29}
$$

Sometimes we need to interpret this step from a global perspective:

$$
\begin{array}{rl}{f(T) \stackrel{(M \geq L_{3})}{\leq} \underset{y}{\operatorname{min}} \left[f_{2}(x; y) + \frac{M}{6} \| y - x \|^{3} \right]} &{} \\{\quad} &{} \\{\stackrel{(4.2.9)}{\leq} \underset{y}{\operatorname{min}} \left[f(y) + \frac{L_{3} + M}{6} \| y - x \|^{3} \right].} \end{array}\tag{4.2.30}
$$

Finally, let us prove the following result.

Lemma 4.2.5 If $M \geq 2L_{3}$ , then

$$
\begin{array}{r}{\langle \nabla f(T), x - T \rangle \geq \sqrt{\frac{2}{L_{3} + M}} \cdot \| \nabla f(T) \|_{*}^{3 / 2}.} \end{array}\tag{4.2.31}
$$

Proof Let $T = T_{M}(x)$ and $r = r_{M}(x)$ . Then

$$
\begin{array}{rl}{\frac{1}{4} L_{3}^{2} r^{4} = \Big(\frac{L_{3}}{2} \| T - x \|^{2} \Big)^{2}{\overset{(4.2.8)}{\geq}} \| \nabla f(T) - \nabla f(x) - \nabla^{2} f(x)(T - x) \|_{*}^{2}} \\ &{\qquad \overset{(4.2.25)}{=} \| \nabla f(T) + \frac{1}{2} M \cdot r \cdot B(T - x) \|_{*}^{2}} \\ &{\qquad = \quad \| \nabla f(T) \|_{*}^{2} + Mr \langle \nabla f(T), T - x \rangle + \frac{1}{4} M^{2} r^{4}.} \end{array}
$$

Hence,

$$
\begin{array}{r}{\langle \nabla f(T), x - T \rangle \geq \frac{1}{Mr} \| \nabla f(T) \|_{*}^{2} + \frac{1}{4M}(M^{2} - L_{3}^{2}) r^{3}.} \end{array}\tag{4.2.32}
$$

In view of the conditions of the lemma, we can estimate the derivative in r of the right-hand side of inequality (4.2.32):

$$
\begin{array}{r}{- \frac{1}{Mr^{2}} \| \nabla f(T) \|_{*}^{2} + \frac{3r^{2}}{4M}(M^{2} - L_{3}^{2}) \ \ge \ - \frac{1}{Mr^{2}} \| \nabla f(T) \|_{*}^{2} + \left(\frac{L_{3} + M}{2} \right)^{2} \frac{r^{2}}{M} \ \stackrel{(4.2.26)}{\ge} \0.} \end{array}
$$

Thus, its minimum is attained at the boundary point $\begin{array}{r}{r = \left\lceil \frac{2}{L_{3} + M} \| \nabla f(T) \|_{*} \right\rceil^{1 / 2}} \end{array}$ of the feasible ray (4.2.26). Substituting this value into (4.2.32), we obtain (4.2.31).

To conclude this section, let us estimate the rate of convergence of CNM as applied to our main problem (4.2.23). We assume that there exists a solution of this problem $x^{*}$ , and the Lipschitz constant $L_{3}$ for the Hessian of objective function is known. Thus, we just iterate

$$
x_{k + 1} = T_{L_{3}}(x_{k}), \quad k = 0, 1, \ldots.\tag{4.2.33}
$$

Theorem 4.2.2 Assume that the level sets of problem (4.2.23) are bounded:

$$
\| x - x^{*} \| \leq D \quad \forall x : f(x) \leq f(x_{0}).\tag{4.2.34}
$$

If the sequence $\{x_{k}\}_{k = 1}^{\infty}$ is generated by method (4.2.33), then

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{9L_{3} D^{3}}{(k + 4)^{2}}, k \geq 1.} \end{array}\tag{4.2.35}
$$

Proof In view of (4.2.28), $f(x_{k + 1}) \leq f(x_{k})$ for all $k \geq 0$ . Thus, $\| x_{k} - x^{*} \| \leq D$ $k \geq 0$ . Further, in view of (4.2.30), we have

$$
\begin{array}{r}{f(x_{1}) \ \le \f(x^{*}) + \frac{L_{3}}{3} D^{3}.} \end{array}\tag{4.2.36}
$$

Consider now an arbitrary $k \geq 1$ . Let $x_{k}(\tau) = x^{*} +(1 - \tau)(x_{k} - x^{*})$ . In view of inequality (4.2.30), for any $\tau \in[0, 1]$ we have

$$
\begin{array}{r}{f(x_{k + 1}) \le f(x_{k}(\tau)) + \tau^{3} \frac{L_{3}}{3} \| x_{k} - x^{*} \|^{3} \ \le \f(x_{k}) - \tau(f(x_{k}) - f(x^{*})) + \tau^{3} \frac{L_{3} D^{3}}{3}.} \end{array}
$$

The minimum of the right-hand side of this inequality in τ is attained for

$$
\begin{array}{r}{\tau = \sqrt{\frac{f(x_{k}) - f(x^{*})}{L_{3} D^{3}}} ~ \leq ~ \sqrt{\frac{f(x_{1}) - f(x^{*})}{L_{3} D^{3}}} ~ \stackrel{(4.2.36)}{<} 1.} \end{array}
$$

Thus, for any $k \geq 1$ , we have

$$
\begin{array}{r}{f(x_{k + 1}) \leq f(x_{k}(\tau)) - \frac{2}{3} \cdot \frac{(f(x_{k}) - f(x^{*}))^{3 / 2}}{\sqrt{L_{3} D^{3}}}.} \end{array}\tag{4.2.37}
$$

Let $\delta_{k} = f(x_{k}) - f(x^{*})$ . Then

$$
\begin{array}{r}{\frac{1}{\sqrt{\delta_{k + 1}}} - \frac{1}{\sqrt{\delta_{k}}} \ = \ \frac{\delta_{k} - \delta_{k + 1}}{\sqrt{\delta_{k} \delta_{k + 1}}(\sqrt{\delta_{k}} + \sqrt{\delta_{k + 1}})} \ \geq \ \frac{(4.2.37)}{3 \sqrt{L_{3} D^{3}}} \cdot \frac{\delta_{k}}{\sqrt{\delta_{k + 1}}(\sqrt{\delta_{k}} + \sqrt{\delta_{k + 1}})}} \end{array}
$$

$$
\begin{array}{rl}{\geq} &{{} \frac{1}{3 \sqrt{L_{3} D^{3}}}.} \end{array}
$$

Thus, for any $k \geq 1$ , we have

$$
\begin{array}{r}{\frac{1}{\sqrt{\delta_{k}}} \geq \frac{1}{\sqrt{\delta_{1}}} + \frac{k - 1}{3 \sqrt{L_{3} D^{3}}} \overset{(4.2.36)}{\geq} \frac{1}{\sqrt{L_{3} D^{3}}} \cdot \left(\sqrt{3} + \frac{k - 1}{3} \right) \geq \frac{k + 4}{3 \sqrt{L_{3} D^{3}}}.} \end{array}
$$

## 4.2.4 An Accelerated Scheme

In order to accelerate method (4.2.33), we apply a variant of the estimating sequences technique, which we presented in Sect. 2.2.1 as a tool for accelerating the usual Gradient Method. In our situation, this idea can be applied to CNM in the following way.

To solve the problem (4.2.23), we recursively update the following sequences.

- The sequence of estimating functions

$$
\begin{array}{r}{\psi_{k}(x) = \ell_{k}(x) + \frac{C}{6} \| x - x_{0} \|^{3}, \quad k = 1, 2, \ldots,} \end{array}\tag{4.2.38}
$$

where $\ell_{k}(x)$ are linear functions in $x \in \mathbb{E}$ , and C is a positive parameter.

- The minimizing sequence $\{x_{k}\}_{k = 1}^{\infty}$

- The sequence of scaling parameters $\{A_{k}\}_{k = 1}^{\infty}$

$$
A_{k + 1} \{\stackrel{\mathrm{def}}{=}} \A_{k} + a_{k}, \quad k = 1, 2, \ldots.
$$

For these objects, we are going to maintain the following relations:

$$
\left.\begin{array}{l}{\displaystyle \mathcal{R}_{k}^{1} : A_{k} f(x_{k}) \leq \psi_{k}^{*} \equiv \displaystyle \operatorname{min}_{x \in \mathbb{E}} \psi_{k}(x),} \\{\displaystyle} \\{\mathcal{R}_{k}^{2} : \quad \psi_{k}(x) \leq A_{k} f(x) + \frac{2L_{3} + C}{6} \| x - x_{0} \|^{3}, \ \forall x \in \mathbb{E}} \end{array} \right\}, k \geq 1.\tag{4.2.39}
$$

Let us ensure that relations (4.2.39) hold for $k = 1$ . We choose

$$
x_{1} = T_{L_{3}}(x_{0}), \quad \ell_{1}(x) \equiv f(x_{1}), x \in \mathbb{E}, \quad A_{1} = 1.\tag{4.2.40}
$$

Then $\psi_{1}^{*} = f(x_{1})$ , so $\mathcal{R}_{1}^{1}$ holds. On the other hand, in view of definition (4.2.38), we get

$$
\begin{array}{rl}{\psi_{1}(x)} &{= \quad f(x_{1}) + \frac{C}{6} \| x - x_{0} \|^{3}} \\ &{\overset{(4.2.30)}{\leq} \underset{y \in \mathbb{E}}{\operatorname{min}} \bigg[f(y) + \frac{2L_{3}}{6} \| y - x_{0} \|^{3} \bigg] + \frac{C}{6} \| x - x_{0} \|^{3},} \end{array}
$$

and $\mathcal{R}_{1}^{2}$ follows.

Assume now that relations (4.2.39) hold for some $k \geq 1$ . Let

$$
v_{k} \ = \ \underset{x \in \mathbb{E}}{\arg \operatorname{min}} \ \psi_{k}(x).
$$

Let us choose some $a_{k} > 0$ and $M \geq 2L_{3}$ . Define<sup>2</sup>

$$
\begin{array}{r}{\alpha_{k} = \frac{a_{k}}{A_{k} + a_{k}}, \quad y_{k} =(1 - \alpha_{k}) x_{k} + \alpha_{k} v_{k}, \quad x_{k + 1} = T_{M}(y_{k}),} \end{array}\tag{4.2.41}
$$

$$
\psi_{k + 1}(x) = \psi_{k}(x) + a_{k}[f(x_{k + 1}) + \langle \nabla f(x_{k + 1}), x - x_{k + 1} \rangle].
$$

In view of $\mathcal{R}_{k}^{2}$ , for any $x \in \mathbb{E}$ we have

$$
\begin{array}{rlr}{{\psi_{k + 1}(x) \leq A_{k} f(x) + \frac{2L_{3} + C}{6} \| x - x_{0} \|^{3} + a_{k}[f(x_{k + 1}) + \langle \nabla f(x_{k + 1}), x - x_{k + 1} \rangle]}} \\ &{} & \\ &{\overset{(2.1.2)}{\leq}(A_{k} + a_{k}) f(x) + \frac{2L_{3} + C}{6} \| x - x_{0} \|^{3},} \end{array}
$$

and this is $\mathcal{R}_{k + 1}^{2}$ . Let us show now that, for the appropriate choices of $a_{k}, C$ and $M$ relation $\mathcal{R}_{k + 1}^{1}$ is also valid.

Indeed, in view of $\mathcal{R}_{k}^{1}$ and Lemma 4.2.3 with $p = 3$ , for any $x \in \mathbb{E}$ , we have

$$
\begin{array}{l}{{\psi_{k}(x) \equiv \ell_{k}(x) + \frac{C}{2} d_{3}(x) \ : \geq \ : \psi_{k}^{*} + \frac{C}{2} \cdot \frac{1}{6} \| x - v_{k} \|^{3}}} \\{{\mathrm{}}} \\{{\mathrm{} \geq A_{k} f(x_{k}) + \frac{C}{2} \cdot \frac{1}{6} \| x - v_{k} \|^{3}.}} \end{array}\tag{4.2.42}
$$

Therefore,

$$
\begin{array}{rl}{V_{i + 1}^{\prime}} &{= \phantom{\frac{1}{\pi}} \frac{\Gamma \kappa}{\kappa \Theta} \frac{\Gamma \kappa(\lambda_{1} + \lambda_{2})}{(\kappa + \lambda_{1})}(\frac{\Gamma \kappa}{\Theta} \Lambda_{i + 1}) +(i \kappa^{\prime}(\partial_{x_{i + 1}}^{\prime}) + \Lambda^{\prime}(\partial_{x_{i + 1}}^{\prime}) \Lambda_{i} - \Lambda_{i - 1}) i} \\ &{\Updownarrow} \\{\frac{d \kappa}{\Theta^{2}}} &{= \phantom{\frac{1}{\pi}} \frac{\Gamma \kappa}{\kappa \Theta} \frac{\Gamma \kappa}{\kappa \Theta} \{\lambda_{1} \wedge \zeta(x_{i + 1}) \begin{array}{rl}{\frac{d}{d \kappa}} &{i} \\{1} &{i} \end{array}\}} \\ &{\medskip = \phantom{\frac{1}{\pi}} \frac{\Gamma \kappa}{\kappa \Theta} \frac{\Gamma \kappa}{\kappa \Theta} \frac{\Gamma \kappa}{\kappa \Theta}(\Lambda_{i + 1} +(\kappa + \lambda_{2}) \Gamma(\Gamma(\kappa_{i + 1}), x_{i} - x_{i + 1}))} \\ &{\phantom{\frac{1}{\pi}} +(i \kappa + \kappa + \kappa_{2}) \Gamma(\kappa(x_{i + 1}), \lambda_{2} - \kappa_{2}) \Gamma(\kappa(x_{i + 1}), x_{i} - x_{i + 1})} \\ & \phantom{\frac{1}{\pi}} \frac{\Gamma \kappa}{\kappa \Theta} \frac{\Gamma \kappa} \end{array}
$$

Further, if we choose $M \geq 2L_{3}$ , then by (4.2.31) we have

$$
\begin{array}{rlr}{\langle \nabla f(x_{k + 1}), y_{k} - x_{k + 1} \rangle} &{{} \ge} &{\sqrt{\frac{2}{L_{3} + M}} \cdot \| \nabla f(x_{k + 1}) \|_{*}^{3 / 2}.} \end{array}
$$

Hence, our choice of parameters must ensure the following inequality:

$$
\begin{array}{r}{A_{k + 1} \sqrt{\frac{2}{L_{3} + M}} \cdot \| \nabla f(x_{k + 1}) \|_{*}^{3 / 2} + a_{k} \langle \nabla f(x_{k + 1}), x - v_{k} \rangle + \frac{C}{12} \| x - v_{k} \|^{3} \geq 0,} \end{array}
$$

for all $x \in \mathbb{E}$ . Minimizing this expression in $x \in \mathbb{E}$ , we come to the following condition:

$$
\begin{array}{r}{A_{k + 1} \sqrt{\frac{2}{L_{3} + M}} \geq \frac{4}{3 \sqrt{C}} a_{k}^{3 / 2}.} \end{array}\tag{4.2.43}
$$

For $k \geq 1$ , let us choose

$$
\begin{array}{rl} &{A_{k} = \frac{k(k + 1)(k + 2)}{6},} \\ &{} \\ &{a_{k} = A_{k + 1} - A_{k} \ = \ \frac{(k + 1)(k + 2)(k + 3)}{6} - \frac{k(k + 1)(k + 2)}{6}} \\ &{\quad \quad = \frac{(k + 1)(k + 2)}{2}.} \end{array}\tag{4.2.44}
$$

Since

$$
\begin{array}{r}{a_{k}^{- 3 / 2} A_{k + 1} = \frac{2^{3 / 2}(k + 1)(k + 2)(k + 3)}{6[(k + 1)(k + 2)]^{3 / 2}} = \frac{2^{1 / 2}(k + 3)}{3[(k + 1)(k + 2)]^{1 / 2}} \geq \frac{2}{3},} \end{array}
$$

inequality (4.2.43) leads to the following condition on the parameters:

$$
\begin{array}{r}{\frac{1}{L_{3} + M} \geq \frac{2}{C}.} \end{array}
$$

Hence, we can choose

$$
M = 2L_{3}, C = 2(L_{3} + M) = 6L_{3}.\tag{4.2.45}
$$

In this case $2L_{3} + C = 8L_{3}$

Now we are ready to put all the pieces together.

## Accelerated Cubic Regularization of Newton’s Method

Initialization: Choose $x_{0} \in \mathbb{E}$ . Set $M = 2L_{3}$ and $C = 6L_{3}$

Compute $x_{1} = T_{L_{3}}(x_{0})$ and define $\begin{array}{r}{\psi_{1}(x) = f(x_{1}) + \frac{C}{6} \| x - x_{0} \|^{3}.} \end{array}$

Iteration $k,(k \geq 1)$ :

1. Compute $v_{k} = \arg \operatorname{min}_{x \in \mathbb{E}} \psi_{k}(x)$ and choose $\begin{array}{r}{y_{k} = \frac{k}{k + 3} x_{k} + \frac{3}{k + 3} v_{k}.} \end{array}$

2. Compute $x_{k + 1} = T_{M}(y_{k})$ and update

$$
\begin{array}{r}{\psi_{k + 1}(x) = \psi_{k}(x) + \frac{(k + 1)(k + 2)}{2} \cdot[f(x_{k + 1}) + \langle \nabla f(x_{k + 1}), x - x_{k + 1} \rangle].} \end{array}\tag{4.2.46}
$$

The above discussion proves the following theorem.

Theorem 4.2.3 If the sequence $\{x_{k}\}_{k = 1}^{\infty}$ is generated by method (4.2.46) as applied to problem (4.2.23), then for any $k \geq 1$ we have:

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{8L_{3} \| x_{0} - x^{*} \|^{3}}{k(k + 1)(k + 2)},} \end{array}\tag{4.2.47}
$$

where $x^{*}$ is an optimal solution to the problem.

Proof Indeed, we have shown that

$$
\begin{array}{r}{A_{k} f(x_{k}) \leq \psi_{k}^{*} \leq \frac{\mathcal{R}_{k}^{2}}{A_{k} f(x^{*}) + \frac{2L_{3} + C}{6} \| x_{0} - x^{*} \|^{3}.}} \end{array}
$$

Thus, (4.2.47) follows from (4.2.44) and (4.2.45).

Note that the point $v_{k}$ can be found in (4.2.46) by a closed-form expression. Consider

$$
s_{k} = \nabla \ell_{k}(x).
$$

Since the function $\ell_{k}(x)$ is linear, this vector does not depend on x. Therefore,

$$
\begin{array}{r}{\boldsymbol{v}_{k} = \boldsymbol{x}_{0} - \sqrt{\frac{2}{C \| s_{k} \|_{*}}} \cdot B^{- 1} \boldsymbol{s}_{k}.} \end{array}
$$

## 4.2.5 Global Non-degeneracy for Second-Order Schemes

Traditionally, in Numerical Analysis the term non-degenerate is applied to certain classes of efficiently solvable problems. For unconstrained optimization, nondegeneracy of the objective function is usually characterized by a uniform lower bound $\tau(f)$ on the angle between the gradient at point x and the direction pointing towards the optimal solution:

$$
\begin{array}{r}{\alpha(x) \stackrel{\mathrm{def}}{=} \frac{\langle \nabla f(x), x - x^{*} \rangle}{\| \nabla f(x) \|_{*} \cdot \| x - x^{*} \|} \ge \tau(f) > 0, \quad x \in \mathbb{E}.} \end{array}\tag{4.2.48}
$$

This condition has a nice geometric interpretation. Moreover, there exists a large class of smooth convex functions possessing this property. This is the class of strongly convex functions with Lipschitz-continuous gradient.

Lemma 4.2.6 $\begin{array}{r}{\tau(f) \geq \frac{2 \sqrt{\gamma_{2}(f)}}{1 + \gamma_{2}(f)} > \sqrt{\gamma_{2}(f)}.} \end{array}$

Proof Indeed, in view of inequality (2.1.32), we have

$$
\begin{array}{r}{\langle \nabla f(x), x - x^{*} \rangle \ge \frac{1}{\sigma_{2} + L_{2}} \| \nabla f(x) \|_{*}^{2} + \frac{\sigma_{2} L_{2}}{\sigma_{2} + L_{2}} \| x - x^{*} \|^{2}} \end{array}
$$

$$
\begin{array}{rl}{{\geq \frac{2 \sqrt{\sigma_{2} L_{2}}}{\sigma_{2} + L_{2}} \cdot \| \nabla f(x) \|_{*} \cdot \| x - x^{*} \|,}} \end{array}
$$

and this proves the required inequality.

Note that the efficiency bounds of the first-order schemes for the class of smooth strongly convex functions can be completely characterized in terms of the condition number $\gamma_{2}$ . Indeed, on one hand, the lower complexity bound for finding an $\epsilon \mathrm{-}$ solution for problems from this problem class is proven to be

$$
\begin{array}{r}{O \left(\frac{1}{\sqrt{\gamma_{2}}} \ln \frac{\sigma_{2} D^{2}}{\epsilon} \right)} \end{array}\tag{4.2.49}
$$

calls of the oracle, where the constant D bounds the distance between the initial point and the optimal solution (see Theorem 2.1.13). On the other hand, the simple numerical scheme (2.2.20) exhibits the required rate of convergence (see Theorem 2.2.3).

What can be said about the complexity of the above problem class for the secondorder schemes? Surprisingly enough, in this situation it is difficult to find any favorable consequences of the condition (4.2.48). We will discuss the complexity bounds for this problem class in detail later in Sect. 4.2.6. Now let us present a new non-degeneracy condition, which replaces (4.2.48) for the second-order methods.

Assume that $\begin{array}{r}{\gamma_{3}(f) = \frac{\sigma_{3}(f)}{L_{3}(f)} > 0.} \end{array}$ . In this case,

$$
\begin{array}{r}{f(x) - f(x^{*}) \stackrel{(4.2.13)}{\leq} \frac{2}{3 \sqrt{\sigma_{3}}} \cdot \| \nabla f(x) \|_{*}^{3 / 2}.} \end{array}\tag{4.2.50}
$$

Therefore, for method (4.2.33) we have

$$
\begin{array}{rl} &{f(x_{k}) - f(x_{k + 1}) \overset{(4.2.29)}{\geq} \frac{1}{3 \sqrt{L_{3}}} \| \nabla f(x_{k + 1}) \|_{*}^{3 / 2}} \\ &{\qquad \overset{(4.2.50)}{\geq} \frac{1}{2} \sqrt{\gamma_{3}(f)} \cdot(f(x_{k + 1}) - f(x^{*})).} \end{array}\tag{4.2.51}
$$

Hence, for any $k \geq 1$ we have

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \stackrel{(4.2.51)}{\leq} \frac{f(x_{1}) - f^{*}}{\left(1 + \frac{1}{2} \sqrt{\gamma_{3}(f)} \right)^{k - 1}}} \end{array}\tag{4.2.52}
$$

$$
\begin{array}{rl}{{\stackrel{(4.2.30)}{\leq} e^{- \frac{\sqrt{\gamma_{3}(f)} \cdot(k - 1)}{2 + \sqrt{\gamma_{3}(f)}}} \.\ \frac{L_{3}}{3} \| x_{0} - x^{*} \|^{3}.}} \end{array}
$$

Thus, the complexity of minimizing a function with positive condition number $\gamma_{3}(f)$ by method (4.2.33) is of the order of

$$
\begin{array}{r}{O \left(\frac{1}{\sqrt{\gamma_{3}(f)}} \ln \frac{L_{3} D^{3}}{\epsilon} \right)} \end{array}\tag{4.2.53}
$$

calls of the oracle. The structure of this estimate is similar to that of (4.2.49). Hence, it is natural to say that such functions possess global second-order non-degeneracy.

Let us demonstrate that the accelerated variant of Newton’s method (4.2.46) can be used to improve the complexity estimate (4.2.53). Denote by $\mathcal{A}_{k}(x_{0})$ the point x generated by method (4.2.46) with starting point x . Consider the following process.

$$
\begin{array}{r}{\mathbf{1.\mathrm{Define}} m = \left\lceil \left(\frac{24e}{\gamma_{3}(f)} \right)^{1 / 3} \right\rceil, \mathrm{and} \mathrm{set} y_{0} = x_{0}.} \end{array}\tag{4.2.54}
$$

2. For $k \geq 0$ , iterate $y_{k + 1} = \mathcal{A}_{m}(y_{k})$

The performance of this scheme can be derived from the following lemma.

Lemma 4.2.7 For any $k \geq 0$ we have

$$
\begin{array}{r}{\| y_{k + 1} - x^{*} \|^{3} \leq \frac{1}{e} \| y_{k} - x^{*} \|^{3},} \end{array}\tag{4.2.55}
$$

$$
\begin{array}{r}{f(y_{k + 1}) - f(x^{*}) \leq \frac{1}{e}(f(y_{k}) - f(x^{*})).} \end{array}
$$

Proof Indeed, since $\begin{array}{r}{m \ge \left(\frac{24e}{\gamma_{3}(f)} \right)^{1 / 3}} \end{array}$ , we have

$$
\begin{array}{rcl}{\displaystyle \frac 13 \sigma_{3} \| y_{k + 1} - x^{*} \|^{3} \stackrel{(4.2.10)}{\leq} f(y_{k + 1}) - f(x^{*})} \\{\displaystyle} &{\displaystyle \qquad(4.2.47)} \\{\displaystyle} &{\displaystyle \leq} &{\frac{8L_{3} \| y_{k} - x^{*} \|^{3}}{m(m + 1)(m + 2)} \leq \frac{1}{3e} \sigma_{3} \| y_{k} - x^{*} \|^{3}} \\{\displaystyle} &{\displaystyle \qquad(4.2.10)} &{\displaystyle \frac 1e(f(y_{k}) - f(x^{*})).} \end{array}
$$

Thus,

$$
\begin{array}{r}{f(T_{L_{3}}(y_{k})) - f(x^{*}) \stackrel{(4.2.30)}{\leq} \frac{L_{3}}{3} \| y_{k} - x^{*} \|^{3} \stackrel{(4.2.30)}{\leq} \frac{L_{3}}{3} \| y_{0} - x^{*} \|^{3} \cdot e^{- k},} \end{array}
$$

and we conclude that an $\epsilon$-solution to our problem can be found by (4.2.54) in

$$
\begin{array}{r}{O \left(\frac{1}{[\gamma_{3}(f)]^{1 / 3}} \ln \left[\frac{L_{3}}{\epsilon} \lVert x_{0} - x^{*} \rVert^{3} \right] \right)} \end{array}\tag{4.2.56}
$$

iterations. Lower complexity bounds for this problem class have not yet been developed. So, we cannot say how far these results are from the best possible ones.

## 4.2.6 Minimizing Strongly Convex Functions

Let us look now at the complexity of problem (4.2.23) with

$$
\sigma_{2}(f) \ > \0, L_{3}(f) \ < \ \infty.\tag{4.2.57}
$$

The main advantage of such functions consists in quadratic convergence of Newton’s method (4.2.33) in a certain neighborhood of the optimal solution. Indeed, for $T = T_{L_{3}}(x)$ we have

$$
\begin{array}{rl} &{f(x) - f(T) \overset{(4.2.28)}{\geq} \frac{1}{2} \langle \nabla^{2} f(T)(T - x), T - x \rangle \geq \frac{\sigma_{2}}{2} \cdot r_{L_{3}}^{2}(x)} \\ &{\qquad \overset{(4.2.26)}{\geq} \frac{\sigma_{2}}{2L_{3}} \cdot \Vert \nabla f(T) \Vert_{*} \overset{(4.2.13)}{\geq} \frac{\sigma_{2}}{2L_{3}} \cdot \left[2 \sigma_{2}(f(T) - f(x^{*})) \right]^{1 / 2}.} \end{array}\tag{4.2.58}
$$

Hence,

$$
\begin{array}{r}{f(T) - f(x^{*}) \stackrel{(4.2.58)}{\leq} \frac{2L_{3}^{2}}{\sigma_{2}^{3}}(f(x) - f(T))^{2} \leq \frac{2L_{3}^{2}}{\sigma_{2}^{3}}(f(x) - f(x^{*}))^{2}.} \end{array}\tag{4.2.59}
$$

Therefore, the region of quadratic convergence of method (4.2.33) can be defined as

$$
\begin{array}{r}{\mathcal{Q}_{f} = \left\{x \in \mathbb{E} : \f(x) - f(x^{*}) \leq \frac{\sigma_{2}^{3}}{2L_{3}^{2}} \right\}.} \end{array}\tag{4.2.60}
$$

Alternatively, the region of quadratic convergence can be described in terms of the norm of the gradient. Indeed,

$$
\begin{array}{rl} &{\frac{\sigma_{2}}{2} \cdot r_{L_{3}}^{2}(x) \leq \frac{1}{2} \langle \nabla^{2} f(T)(T - x), T - x \rangle} \\ &{\overset{(4.2.28)}{\leq} f(x) - f(T) \leq \| \nabla f(x) \|_{*} \cdot r_{L_{3}}(x).} \end{array}
$$

Thus,

$$
\begin{array}{r}{\| \nabla f(x) \|_{*} \ge \frac{\sigma_{2}}{2} \cdot r_{L_{3}}(x) \overset{(4.2.26)}{\ge} \frac{\sigma_{2}}{2} \left[\frac{1}{L_{3}} \| \nabla f(T) \|_{*} \right]^{1 / 2}.} \end{array}
$$

Consequently,

$$
\begin{array}{r}{\| \nabla f(T) \|_{*} \leq \frac{4L_{3}}{\sigma_{2}^{2}} \| \nabla f(x) \|_{*}^{2},} \end{array}\tag{4.2.61}
$$

and the region of quadratic convergence can be defined as

$$
\begin{array}{r}{\mathcal{Q}_{g} = \left\{x \in \mathbb{E} : \ \| \nabla f(x) \|_{*} \leq \frac{\sigma_{2}^{2}}{4L_{3}} \right\}.} \end{array}\tag{4.2.62}
$$

Thus, the global complexity of problem (4.2.23), (4.2.57) is mainly related to the number of iterations required to come from x to the region $\mathcal{Q}_{f}$ (or, to ${\mathcal{Q}}_{g})$ . For method (4.2.33), this value can be estimated from above by

$$
\begin{array}{r}{O \left(\sqrt{\frac{L_{3}(f) D}{\sigma_{2}(f)}} \right),} \end{array}\tag{4.2.63}
$$

where D is defined by (4.2.34) (see Sect. 4.1). Let us show that, using the accelerated scheme (4.2.46), it is possible to improve this complexity bound.

Assume that we know an upper bound for the distance to the solution:

$$
\| x_{0} - x^{*} \| ~ \leq ~ R ~(\leq D).
$$

Consider the following process.

1. Set $y_{0} = T_{L_{3}}(x_{0})$ , and define $\begin{array}{r}{m_{0} = \left\lceil \frac{64L_{3}(f) R}{\sigma_{2}(f)} \right\rceil^{1 / 3}} \end{array}$

2. While $\begin{array}{r}{\| \nabla f(T_{L_{3}}(y_{k})) \|_{*} \ge \frac{\sigma_{2}^{2}}{4L_{3}} \mathbf{do} \{y_{k + 1} = \mathcal{A}_{m_{k}}(y_{k}), m_{k + 1} = \frac{1}{2^{1 / 3}} m_{k}\}.} \end{array}$

(4.2.64)

Theorem 4.2.4 The process (4.2.64) terminates at most after

$$
\begin{array}{r}{\frac{1}{\ln 4} \ln \left(\frac{8}{3} \cdot \left(\frac{L_{3}(f) R}{\sigma_{2}(f)} \right)^{3} \right)} \end{array}\tag{4.2.65}
$$

stages. The total number of Newton steps in all stages does not exceed 4m .

Proof Let $\begin{array}{r}{R_{k} = R \cdot \left(\frac{1}{2} \right)^{k}} \end{array}$ . It is clear that

$$
\begin{array}{r}{m_{k} \geq 4 \left(\frac{L_{3}(f) R_{k}}{\sigma_{2}(f)} \right)^{1 / 3}, k \geq 0.} \end{array}\tag{4.2.66}
$$

For $k \geq 0$ , let us prove by induction that

$$
\| y_{k} - x^{*} \| \leq R_{k}.\tag{4.2.67}
$$

Assume that for some $k \geq 0$ this statement is valid (it is true for $k = 0)$ . Then,

$$
\begin{array}{r}{\frac{\sigma_{2}}{2} \| y_{k + 1} - x^{*} \|^{2} \overset{(2.1.21)}{\leq} f(y_{k + 1}) - f(x^{*}) \overset{(4.2.47)}{\leq} \frac{8L_{3} R_{k}^{3}}{m_{k}(m_{k} + 1)(m_{k} + 2)}} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(4.2.66)}{\leq} \frac{8}{64} \sigma_{2} R_{k}^{2} = \frac{1}{8} \sigma_{2} R_{k}^{2} = \frac{1}{2} \sigma_{2} R_{k + 1}^{2}.} \end{array}
$$

Thus, (4.2.67) is valid for all $k \geq 0$ . On the other hand,

$$
\begin{array}{rl}{f(y_{k + 1}) - f(x^{*}) \overset{(4.2.47)}{\leq}} &{\frac{8L_{3} \| y_{k} - x^{*} \|^{3}}{m_{k}(m_{k} + 1)(m_{k} + 2)} \overset{(4.2.67)}{\leq} \frac{8L_{3} \| y_{k} - x^{*} \|^{2} R_{k}}{m_{k}(m_{k} + 1)(m_{k} + 2)}} \\ &{} \\{\overset{(4.2.66)}{\leq} \frac{1}{8} \sigma_{2} \| y_{k} - x^{*} \|^{2} \overset{(2.1.21)}{\leq} \frac{1}{4}(f(y_{k}) - f(x^{*})).} \end{array}
$$

Hence

$$
\begin{array}{rl}{\frac{\sigma_{2}}{2L_{3}} \| \nabla f(T_{L_{3}}(y_{k})) \|_{*} \stackrel{(4.2.58)}{\leq} f(y_{k}) - f(T_{L_{3}}(y_{k})) \leq f(y_{k}) - f(x^{*})} &{} \\{\leq} &{\left(\frac{1}{4} \right)^{k} \left(f(y_{0}) - f(x^{*}) \right) \stackrel{(4.2.30)}{\leq} \left(\frac{1}{4} \right)^{k} \frac{L_{3}}{3} \mathbb{R}^{3},} \end{array}
$$

and (4.2.65) follows from (4.2.62). Finally, the total number of Newton steps does not exceed

$$
\sum_{k = 0}^{\infty} m_{k} \ = \m_{0} \sum_{k = 0}^{\infty}{\frac{1}{2^{k / 3}}} \ = \{\frac{m_{0}}{2^{1 / 3} - 1}} \ < \4m_{0}.\qquad \mathtt{U}
$$

## 4.2.7 False Acceleration

Note that the properties of the class of smooth strongly convex functions (4.2.57) leave some space for erroneous conclusions related to the rate of convergence of the optimization methods at the first stage of the process, aiming to enter the region of quadratic convergence. Let us demonstrate this with a particular example.

Consider a modified version ${\mathcal{M}}^{\prime}$ of method (4.2.46). The only modification is introduced in Step 2. Now it is as follows:

2’. Compute $\hat{y}_{k} = T_{M}(y_{k})$ and update

$$
\begin{array}{r}{\psi_{k + 1}(x) = \psi_{k}(x) + \frac{(k + 1)(k + 2)}{2} \cdot[f(\hat{y}_{k}) + \langle \nabla f(\hat{y}_{k}), x - \hat{y}_{k} \rangle].} \end{array}
$$

$$
\mathrm{Choose ~} \hat{x}_{k} : \mathrm{~} f(\hat{x}_{k}) = \operatorname{min} \{f(x_{k}), \mathrm{~} f(\hat{y}_{k})\}.\mathrm{Set ~} x_{k + 1} = T_{M}(\hat{x}_{k}).\tag{4.2.68}
$$

Note that for $\mathcal{M}^{\prime}$ the statement of Theorem 4.2.3 is valid. Moreover, the process now becomes monotone, and, using the same reasoning as in (4.2.58) with $M = 2L_{3}$ we obtain

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \ge f(\hat{x}_{k}) - f(x_{k + 1}) \ge \frac{\sqrt{2} \sigma_{2}^{3 / 2}}{3L_{3}} \cdot[f(x_{k + 1}) - f(x^{*})]^{1 / 2}.} \end{array}\tag{4.2.69}
$$

Further, let us fix the number of steps N. Define $\hat{k} \ = \ \mathsf{\Omega}_{3}^{2} N$ . Then, in view of (4.2.47), we can guarantee that

$$
\begin{array}{r}{f(x_{\widehat{k}}) - f(x^{*}) \leq \left(\frac{3}{2} \right)^{3} \frac{8L_{3} \mathbb{R}^{3}}{N^{3}} = 3^{3} \frac{L_{3} \mathbb{R}^{3}}{N^{3}}.} \end{array}\tag{4.2.70}
$$

On the other hand

$$
\begin{array}{rlr}{f(x_{\hat{k}}) - f(x^{*})} &{{} \geq} &{f(x_{\hat{k}}) - f(x_{N + 1})} \end{array}\tag{4.2.71}
$$

$$
\begin{array}{rlr}{{\stackrel{(4.2.69)}{\geq} \frac{1}{3} N \cdot \frac{\sqrt{2} \sigma_{2}^{3 / 2}}{3L_{3}} \cdot[f(x_{N + 1}) - f(x^{*})]^{1 / 2}.}} \end{array}
$$

Combining (4.2.70) and (4.2.71) we obtain

$$
\begin{array}{r}{f(x_{N + 1}) - f(x^{*}) \leq \frac{3^{10} \cdot L_{3}^{4} \cdot \mathbb{R}^{6}}{2 \sigma_{2}^{3}} \cdot N^{- 8}.} \end{array}\tag{4.2.72}
$$

As compared with the rate of convergence (4.2.47), the proposed modification looks amazingly efficient. However, that is just an illusion. Indeed, in view of (4.2.60), in order to enter the region of quadratic convergence of Newton’s method, we need to make the right-hand-side of inequality (4.2.72) smaller than $\frac{\sigma_{2}^{3}}{2L_{3}^{2}}$ . For that we need

$$
\begin{array}{rl}{O \left(\left[\frac{L_{3} R}{\sigma_{2}} \right]^{3 / 4} \right)} \end{array}\tag{4.2.73}
$$

iterations of $\mathcal{M}^{\prime}$ . This is much worse than the complexity estimate (4.2.63) of the basic scheme (4.2.33) even without acceleration (4.2.46).

Another clarification comes from an estimate for the number of steps, which is necessary for $\mathcal{M}^{\prime}$ to halve the distance to the minimum. From (4.2.72) we see that it needs $\cal{O} \left(\left[\frac{\cal{L}_{3} R}{\sigma_{2}} \right]^{1 / 2} \right)$ iterations, which is worse than the corresponding estimate for the method (4.2.46).

## 4.2.8 Decreasing the Norm of the Gradient

Let us check now our ability to generate points with small norm of the gradient using second-order methods (compare with Sect. 2.2.2). We first look at the simplest method (4.2.33).

Denote by $T$ the total number of iterations of this scheme. For the sake of simplicity, let us assume that $T = 3m + 2$ for some integer $m \geq 0$ . Let us divide all

iterations of the method into two parts. For the first part of length 2m we have

$$
\begin{array}{r}{f(x_{2m}) -{f^{*}} \overset{(4.2.35)}{\leq} \frac{9L_{3} D^{3}}{4(m + 2)^{2}},} \end{array}
$$

where $L_{3} = L_{3}(f)$ . For the second part of length $m + 2$ , we have

$$
f(x_{2m}) - f(x_{T}) = \sum_{k = 0}^{m + 1}(f(x_{2m + k}) - f(x_{2m + k + 1})) \stackrel{(4.2.29)}{\geq} \frac{m + 2}{3L_{3}^{1 / 2}}(g_{T}^{*})^{3 / 2},
$$

where $g_{T}^{*} = \operatorname{min}_{1 \leq k \leq T} \| \nabla f(x_{k}) \|_{*}$ . Thus,

$$
\begin{array}{r}{g_{T}^{*} \leq \left(\frac{27L_{3}^{3 / 2} D^{3}}{4(m + 2)^{3}} \right)^{2 / 3} = \frac{3^{4} L_{3} D^{3}}{2^{4 / 3}(T + 4)^{2}}.} \end{array}\tag{4.2.74}
$$

Let us look now at the monotone version of the accelerated Cubic Newton Method (4.2.46), (4.2.68). Let $R_{0} = \| x_{0} - x^{*} \|$ . Let $T = 4m$ for some integer $m \geq 1$ . Then, for the first 3m iterations of this method we have

$$
\begin{array}{r}{f(x_{3m}) - f^{*} \overset{(4.2.47)}{\leq} \frac{8L_{3} R_{0}^{3}}{3m(3m + 1)(3m + 2)}.} \end{array}
$$

For the second part of length m, we have

$$
f(x_{3m}) - f(x_{T}) = \sum_{k = 0}^{m - 1}(f(x_{3m + k}) - f(x_{3m + k + 1})) \stackrel{(4.2.29)}{\geq} \frac{m}{3L_{3}^{1 / 2}}(g_{T}^{*})^{3 / 2}.
$$

Thus,

$$
\begin{array}{r}{g_{T}^{*} \leq \left(\frac{8L_{3}^{3 / 2} R_{0}^{3}}{m^{2}(3m + 1)(3m + 2)} \right)^{2 / 3} < \frac{2^{8} L_{3} R_{0}^{2}}{T^{8 / 3}}.} \end{array}\tag{4.2.75}
$$

Finally, let us check what can be achieved with the regularization technique. As in Sect. 2.2.2, we fix a regularization parameter $\delta > 0$ and introduce the following function:

$$
\begin{array}{r}{f_{\delta}(x) = f(x) + \frac{1}{3} \delta \| x - x_{0} \|^{3}.} \end{array}
$$

Let $D = \operatorname{max}_{{\boldsymbol{\mathbf{\mathit{r}}}} \in \mathbb{R}} \{\|{\boldsymbol{\mathit{x}}} -{\boldsymbol{\mathbf{\mathit{x}}}}_{0} \| :{\boldsymbol{\mathbf{\mathit{f}}}}({\boldsymbol{\mathbf{\mathit{x}}}}) \leq f({\boldsymbol{\mathbf{\mathit{x}}}}_{0})\}$ . Since $f_{\delta}(x) \ge f(x)$ for all $x \in \mathbb{E}$ inequality $f_{\delta}(x) \leq f(x_{0})$ implies $\| x - x_{0} \| \leq D$

In view of Lemmas 4.2.3 and 4.2.4, we have

$$
\begin{array}{ll}{{\sigma_{3}(f_{\delta}) = \frac{1}{2} \delta,}} &{{L_{3}(f_{\delta}) = L_{3} + 2 \delta.}} \end{array}
$$

Thus, $\begin{array}{r}{\gamma_{3}(f_{\delta}) = \frac{\delta}{2L_{3} + 4 \delta}.} \end{array}$

Let $x_{\delta}^{*} = \arg \operatorname{min}_{x \in \mathbb{E}} f_{\delta}(x)$ and let $\begin{array}{r}{m = \left\lceil \left(24e \left(4 + \frac{2L_{3}}{\delta} \right) \right)^{1 / 3} \right\rceil} \end{array}$ . In view of Lemma 4.2.7, restarting strategy (4.2.54) ensures the following rate of convergence:

$$
f_{\delta}(y_{k + 1}) - f_{\delta}(x_{\delta}^{*}) \leq \frac{1}{e}(f_{\delta}(y_{k}) - f_{\delta}(x_{\delta}^{*})),
$$

where $y_{0} = T_{L_{3}}(x_{0})$ . Thus, $f_{\delta}(y_{k}) - f_{\delta}(x_{\delta}^{*}) \stackrel{(4.1.11)}{\leq} \frac{1}{3e^{k}} L_{3}(f) D^{3}.$

Define $y_{k}^{*} = T_{L_{3}(f_{\delta})}(y_{k})$ . Then $f_{\delta}(y_{k}^{+}) \le f_{\delta}(y_{k}) \le f(x_{0})$ . Hence, $| y_{k}^{+} - x_{0} | | \leq$ D and we have

$$
\begin{array}{rcl}{\| \nabla f(y_{k}^{+}) \|_{*}} &{\leq} &{\| \nabla f_{\delta}(y_{k}^{+}) \|_{*} + \delta D^{2}} \\ & &{\overset{(4.2.29)}{\leq} \Big[3L_{3}^{1 / 2}(f_{\delta}) \cdot \big(f_{\delta}(y_{k}) - f_{\delta}(x_{\delta}^{*}) \big) \Big]^{2 / 3} + \delta D^{2}} \\ & &{\leq} &{\frac{1}{e^{2k / 3}} L_{3} D^{2} \sqrt{1 + \frac{2 \delta}{L_{3}}} + \delta D^{2}.} \end{array}
$$

Let us choose now $\begin{array}{r}{\delta = \frac{\epsilon}{2D^{2}}} \end{array}$ . Define $\begin{array}{r}{\varkappa = \frac{L_{3} D^{2}}{\epsilon}} \end{array}$ . Then, to ensure $\| \nabla f(y_{k}^{+}) \|_{*} \leq \epsilon$ we need to perform

$$
\begin{array}{r}{k \geq \frac{3}{2} \ln \left(2 \sqrt{\varkappa^{2} + \varkappa} \right)} \end{array}
$$

iterations of the restarting strategy (4.2.54). Each cycle of this strategy needs $\left\lceil 2(12e(1 + \varkappa))^{1 / 3} \right\rceil$ iterations of the Accelerated Cubic Newton Method (4.2.46). Thus, we get a bound which is asymptotically better than the simple estimate (4.2.75). However, it seems that for all practical values of the accuracy, the method (4.2.46), (4.2.68) has better performance guarantees.

## 4.2.9 Complexity of Non-degenerate Problems

1. From the complexity results presented in the previous sections, we can derive a class of problems which are easy for the second-order schemes:

$$
\sigma_{2}(f) ~ > ~ 0, \quad \sigma_{3}(f) ~ > ~ 0, \quad L_{3}(f) ~ < ~ \infty.\tag{4.2.76}
$$

For such functions, the second-order methods exhibit a global linear rate of convergence and a local quadratic convergence. In accordance with (4.2.56) and (4.2.60), we need

$$
\begin{array}{r}{O \left(\left[\frac{L_{3}(f)}{\sigma_{3}(f)} \right]^{1 / 3} \ln \left[\frac{L_{3}(f)}{\sigma_{2}(f)} \lVert x_{0} - x^{*} \rVert \right] \right)} \end{array}\tag{4.2.77}
$$

iterations of (4.2.46) to enter the region of quadratic convergence.

Note that the class (4.2.76) is non-trivial. It contains, for example, all functions

$$
\xi_{\alpha, \beta}(x) = \alpha d_{2}(x) + \beta d_{3}(x), \quad \alpha, \beta > 0,
$$

with parameters

$$
\sigma_{2}(\xi_{\alpha, \beta}) = \alpha, \quad \sigma_{3}(\xi_{\alpha, \beta}) = \frac{1}{2} \beta, \quad L_{3}(\xi_{\alpha, \beta}) = 2 \beta.
$$

Moreover, any convex function with Lipschitz-continuous Hessian can be regularized by adding an auxiliary function $\xi_{\alpha, \beta}$

2. For one important class of convex problems, namely, for problems with

$$
\sigma_{2}(f) > 0, L_{2}(f) < \infty, L_{3}(f) < \infty,\tag{4.2.78}
$$

we have actually failed to clarify the situation. The standard theory of optimal firstorder methods (see Sect. 2.2) can bound the number of iterations which are required to enter the region of quadratic convergence (4.2.60), as follows:

$$
\begin{array}{r}{O \left(\left[\frac{L_{2}(f)}{\sigma_{2}(f)} \right]^{1 / 2} \ln \left[\frac{L_{2}(f) L_{3}^{2}(f)}{\sigma_{2}^{3}(f)} \lVert x_{0} - x^{*} \rVert^{2} \right] \right).} \end{array}\tag{4.2.79}
$$

Note that in this estimate the role of the second-order scheme is quite weak: it is used only to establish the bounds of the termination stage. Of course, as is shown in Sect. 4.2.6, we could also use it at the first stage. However, in this case the size of the optimal solution $x^{*}$ enters polynomially the estimate for the number of iterations. Thus, the following question is still open:

Can we get any advantage from the second-order schemes being used at the initial stage of minimization process as applied to a function from the problem class (4.2.78)?

We will come back to the complexity of problem class (4.2.78) again in Sect. 5.2, when we will discuss our possibilities in minimizing self-concordant functions.

## 4.3 Optimal Second-Order Methods

## 4.3.1 Lower Complexity Bounds

Let us derive lower complexity bounds for the second-order methods as applied to the problem

$$
f^{*} = \operatorname{min}_{x \in \mathbb{R}^{n}} f(x),\tag{4.3.1}
$$

where the Hessian of the objective function is Lipschitz continuous. We assume that this problem is solvable and $x^{*}$ is its optimal solution.

For the sake of simplicity, as we did in Sect. 2.1.2 (see Assumption 2.1.4), let us first fix the natural rules for generating the test points. It can be easily checked that the second-order methods usually compute the next test point as follows:

$$
x_{k + 1} = x_{k} - h_{k}[\alpha_{k} I_{n} +(1 - \alpha_{k}) \nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}),
$$

where $h_{k} \ > \0$ is a step-size parameter, and the coefficient $\alpha_{k} ~ \in ~[0, 1]$ depends on a particular optimization scheme. In the case $\alpha_{k} = 1$ , we get the usual Gradient Method. The case $\alpha_{k} = 0$ corresponds to the standard Newton direction. Finally, the Cubic Regularization strategy (4.2.24) and the majority of Trust Region Methods compute these values from some equation (see, for example, (4.2.25)). Therefore, the following assumption looks quite reasonable.

Assumption 4.3.1 All iterative second-order schemes generate a sequence of test points $\{x_{k}\}_{k \ge 0}$ such that

$$
x_{k + 1} \in x_{0} + Lin \left\{\mathcal{G}_{f}(x_{0}), \ldots, \mathcal{G}_{f}(x_{k}) \right\}, \quad k \geq 0,\tag{4.3.2}
$$

where $\mathcal{G}_{f}(x) = cl ~ \big(Conv ~ \big \{[\alpha I_{n} +(1 - \alpha) \nabla^{2} f(x)]^{- 1} \nabla f(x), ~ \alpha \in[0, 1) \big\} \big).$

Note that the set $\mathcal{G}_{f}(x)$ also contains $\nabla f(x)$ . Therefore, the rules for computing the point $v_{k}$ in the accelerated method (4.2.46) also satisfy condition (4.3.2).

For $2 \leq k \leq n$ , consider the following parametric family of functions:

$$
f_{k}(\boldsymbol{x}) = \frac{1}{3} \left\{\sum_{i = 1}^{k - 1} | x^{(i)} - x^{(i + 1)} |^{3} + \sum_{i = k}^{n} | x^{(i)} |^{3} \right\} - x^{(1)}, \quad \boldsymbol{x} \in \mathbb{R}^{n}.\tag{4.3.3}
$$

This is a uniformly convex function, and its unique minimum can be found from the following system of equations:

$$
(x^{(1)} - x^{(2)}) | x^{(1)} - x^{(2)} | = 1,
$$

$$
(x^{(i)} - x^{(i - 1)}) | x^{(i)} - x^{(i - 1)} | +(x^{(i)} - x^{(i + 1)}) | x^{(i)} - x^{(i + 1)} | = 0, \quad 2 \leq i \leq k - 1,
$$

$$
(x^{(k)} - x^{(k - 1)}) | x^{(k)} - x^{(k - 1)} | + x^{(k)} | x^{(k)} | = 0,
$$

$$
x^{(i)} | x^{(i)} | = 0, \quad k + 1 \leq i \leq n.
$$

Clearly, the only solution of this system is given by vector $x_{*}$ with coordinates

$$
x_{*}^{(i)} =(k - i + 1)_{+}, \quad i = 1, \ldots, n,\tag{4.3.4}
$$

where $(\tau)_{+} = \operatorname{max} \{\tau, 0\}$ . For our methods, we always take $x_{0} = 0$ . Therefore, we have the following characteristics of our problem (4.3.1) with $f = f_{k}$

$$
\begin{array}{r}{f_{k}^{*} = - \frac{2}{3} k,} \end{array}
$$

$$
R_{k}^{2} = \| x_{0} - x_{*} \|_{(2)}^{2} = \sum_{i = 1}^{k} i^{2} < \frac{(k + 1)^{3}}{3}.\tag{4.3.5}
$$

It remains to estimate the Lipschitz constant of the Hessian of the function $f_{k}$ with respect to the standard Euclidean norm.

Let us look first at the Hessian of the following function

$$
\rho_{3}(u) = \frac{1}{3} \sum_{i = 1}^{n} | u^{(i)} |^{3}, \quad u \in \mathbb{R}^{n}.
$$

For a direction $h \in \mathbb{R}^{n}$ , we have $\langle \nabla^{2} \rho_{3}(u) h, h \rangle = 2 \sum_{i = 1}^{n} \left| u^{(i)} \right|(h^{(i)})^{2}$ . Therefore, for $u, v \in \mathbb{R}^{n}$ we get

$$
\left| \langle(\nabla^{2} \rho_{3}(u) - \nabla^{2} \rho_{3}(v)) h, h \rangle \right| = 2 \left| \sum_{i = 1}^{n}(| u^{(i)} | - | v^{(i)} |)(h^{(i)})^{2} \right| \ \leq \2 \| u - v \|_{(\infty)} \| h \|_{(2)}^{2}.
$$

Note that function $f_{k}(\cdot)$ can be represented as follows:

$$
f_{k}(x) = \rho_{3}(B_{k} x) - x^{(1)}, \quad B_{k} ={\binom{A_{k} \quad 0}{0 \I_{n - k}}} \in \mathbb{R}^{n \times n},
$$

where the upper bi-diagonal matrix $A_{k} \in \mathbb{R}^{k \times k}$ has the following structure:

$$
A_{k} = \left(\begin{array}{cccc}{{1 - 1}} &{{0 \ldots}} &{{0}} \\{{0}} &{{1 - 1 \ldots}} &{{0}} \\{{}} &{{}} &{{\ldots}} &{{0}} \\{{}} &{{}} &{{\ldots}} &{{- 1}} \\{{0 \ldots \ldots \ldots}} &{{0}} &{{1}} \end{array} \right).
$$

Therefore, for any point x, displacement $d,$ and direction h in $\mathbb{R}^{n}$ we have

$$
\begin{array}{rl} &{\left| \langle(\nabla^{2} f_{k}(x + d) - \nabla^{2} f_{k}(x)) h, h \rangle \right| = \left| \langle(\nabla^{2} \rho_{3}(B_{k}(x + d)) - \nabla^{2} \rho_{3}(B_{k} x)) B_{k} h, B_{k} h \rangle \right|} \\ &{} \\ &{\qquad \leq 2 \| B_{k} d \|_{(\infty)} \| B_{k} h \|_{(2)}^{2}.} \end{array}
$$

Note that for any $h \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rl} &{\| B_{k} d \|_{(\infty)} \le \underset{1 \le i \le n - 1}{\operatorname{max}} \{| d^{(i)} | + | d^{(i + 1)} |\} \le \underset{1 \le i \le n - 1}{\operatorname{max}} \sqrt{2[(d^{(i)})^{2} +(d^{(i + 1)})^{2}]}} \\ &{\le 2^{1 / 2} \| d \|_{(2)},} \\ &{\| B_{k} h \|_{(2)}^{2} = \displaystyle \sum_{i = 1}^{k - 1}(h^{(i)} - h^{(i + 1)})^{2} + \sum_{i = k}^{n}(h^{(i)})^{2} \le 4 \| h \|_{(2)}^{2}.} \end{array}
$$

Thus, we conclude that

$$
\| \nabla^{2} f_{k}(x + d) - \nabla^{2} f_{k}(x) \| \leq 8{\sqrt{2}} \| d \|_{(2)},
$$

and we can take the Lipschitz constant for the Hessian of this function $L = 2^{7 / 2}$

In order to understand the behavior of numerical schemes satisfying condition (4.3.2), as applied to minimization of some function $f_{t}$ with t big enough, we need to introduce the following subspaces (compare with Sect. 2.1.2):

$$
\mathbb R^{k, n} = \{x \in \mathbb \mathbb{R}^{n} : \x^{(i)} = 0 \mathrm{~ for ~} i > k\}, \quad 1 \leq k \leq n - 1,
$$

$$
\mathbb{S}^{k, n} = \{H \in \mathbb{R}^{n \times n} : ~ H = H^{T}, ~ H^{(i, j)} = 0 \mathrm{~ if ~} i \neq j \mathrm{~ and ~}(i > k \mathrm{~ or ~} j > k)\}.
$$

Let us write down the first and the second derivatives of the function $f_{t}$ along direction $h \in \mathbb{R}^{n}$ (see (4.3.3):

$$
\begin{array}{l}{{\displaystyle \langle \nabla f_{t}(x), h \rangle = \sum_{i = 1}^{t - 1} | x^{(i)} - x^{(i + 1)} |(x^{(i)} - x^{(i + 1)})(h^{(i)} - h^{(i + 1)})}} \\{{\displaystyle}} \\{{\displaystyle \qquad + \sum_{i = t}^{n} | x^{(i)} | x^{(i)} h^{(i)} - h^{(1)},}} \\{{\displaystyle}} \\{{\displaystyle \langle \nabla^{2} f_{t}(x) h, h \rangle = 2 \sum_{i = 1}^{t - 1} | x^{(i)} - x^{(i + 1)} |(h^{(i)} - h^{(i + 1)})^{2} + 2 \sum_{i = t}^{n} | x^{(i)} |(h^{(i)})^{2}.}} \end{array}\tag{4.3.6}
$$

From this structure, we derive the following important conclusions.

Lemma 4.3.1 $Ifx \in \mathbb{R}^{i, n}$ and $i ~ < ~ k,$ , then $\nabla f_{t}(x) \ \in \ \mathbb{R}^{i + 1, n}$ and $\nabla^{2} f_{t}(x) \ \in$ $\mathbb{S}^{i + 1, n}$ .

Corollary 4.3.1 Let $x_{i} \in \mathbb R^{i, n}, i = 0, \ldots, k,$ , and suppose the point $x_{k + 1}$ satisfies condition (4.3.2) with $f(\cdot) = f_{t}(\cdot)$ , where $k + 1 \leq t \leq n$ . Then $x_{k + 1} \in \mathbb{R}^{k + 1, n}$

Proof Indeed, in view of Lemma 4.3.1, we have

$$
\begin{array}{r}{\nabla f_{t}(x_{i}) \in \mathbb{R}^{i + 1, n} \subset \mathbb{R}^{k + 1, n}, \quad \nabla^{2} f_{t}(x_{i}) \ \in \ \mathbb{S}^{i + 1, n} \subset \ \mathbb{S}^{k + 1, n}, \quad i = 0, \dots, k.} \end{array}
$$

Therefore,

$$
[\alpha I_{n} +(1 - \alpha) \nabla^{2} f_{t}(x_{i})]^{- 1} \nabla f_{t}(x_{i}) \in \mathbb{R}^{k + 1, n}
$$

for all $\alpha \in[0, 1)$ and $i = 0, \ldots, k$ .

Our last observation is as follows.

Lemma 4.3.2 For any $p \geq 0$ and $x \in \mathbb{R}^{k, n}$ , we have $f_{k + p}(x) = f_{k}(x)$ □

Now we can prove the lower complexity bound for the second-order methods.

Theorem 4.3.1 Let the Hessian of the objective function f in problem $(4.3.{\cal I})$ be Lipschitz continuous with constant $L_{f}$ . Assume that the rules of a secondorder method <sup>M</sup> satisfy condition $(4.3.2)$ , and for any starting point $x_{0}$ with $\lVert x_{0} - x^{*} \rVert_{(2)} \leq \rho_{0}$ we can guarantee that

$$
\begin{array}{r}{\underset{0 \leq i \leq k}{\operatorname{min}} f(x_{i}) - f(x^{*}) \leq \frac{L_{f} \rho_{0}^{3}}{C_{\mathcal M}(k)},} \end{array}\tag{4.3.7}
$$

where k is the number of generated test points. Then for $k = 3m + 2$ with integer m, $\begin{array}{r}{0 \leq m \leq \frac{n}{4} - 1} \end{array}$ , we have

$$
C_{\mathcal{M}}(k) \leq 36(k + 1)^{3.5}.\tag{4.3.8}
$$

Proof Let $k = 3m + 2$ for some integer $m \geq 0$ . Define $t = 4m + 3$ . Then

$$
k + 1 = 3(m + 1), \quad t + 1 = 4(m + 1).
$$

Let us apply method <sup>M</sup> for minimizing the function $f_{t}(\cdot)$ starting from the point (4.3.2) $x_{0} = 0$ . Note that $\nabla f_{t}(x_{0}) = - e_{1} \in \mathbb{R}^{1, n}$ and $\nabla^{2} f_{t}(x_{0}) = 0$ . Therefore, $x_{1} ~ \in$ $\mathbb{R}^{1, n}$ , and by induction, using Corollary 4.3.1, we get $x_{k} \stackrel{(4.3.2)}{\in} \mathbb{R}^{k, n}, 0 \leq k \leq t$ Hence, by Lemma 4.3.2, we have

$$
{\textstyle \frac{2}{3}}(m + 1) \stackrel{(4.3.5)}{=} f_{k}^{*} - f_{t}^{*} \ \leq \ \operatorname{min}_{0 \leq i \leq k} f_{t}(x_{i}) - f_{t}^{*} \stackrel{(4.3.7)}{\leq} \ \frac{L_{f} \rho_{0}^{3}}{C_{{\mathcal M}}(k)}
$$

$$
\begin{array}{r}{\stackrel{(4.3.5)}{\leq} \frac{2^{7 / 2}}{C_{\mathcal M}(k)} \left(\frac{(t + 1)^{3}}{3} \right)^{3 / 2}.} \end{array}
$$

Thus,

$$
\begin{array}{l}{\displaystyle{C_{\mathcal{M}}(k) \leq \frac{2^{5 / 2}(t + 1)^{9 / 2}}{(m + 1)^{3^{1 / 2}}} = \frac{2^{5 / 2} 3^{1 / 2}}{k + 1} \left(\frac{4}{3}(k + 1) \right)^{9 / 2} = \frac{2^{23 / 2}}{3^{4}}(k + 1)^{3.5}}} \\{\displaystyle{< 36(k + 1)^{3.5}}.\quad \mathrm{~} \forall} \end{array}
$$

As we can see, the lower bound (4.3.8) is a little bit better than the rate of convergence (4.2.47) of the Accelerated Cubic Regularization (4.2.46). In the next section, we will discuss the possibility of reaching this lower bound.

## 4.3.2 A Conceptual Optimal Scheme

As in Sect. 4.2.3, let us fix a self-adjoint positive definite operator $B : \mathbb{E} \mathbb{E}^{*}$ and define primal and dual Euclidean norms

$$
\| x \| = \langle Bx, x \rangle^{1 / 2}, \quad \| g \|_{*} = \langle g, B^{- 1} g \rangle^{1 / 2}, \quad x \in \mathbb{E}, \g \in \mathbb{E}^{*}.
$$

Consider the problem of unconstrained optimization

$$
\operatorname{min}_{x \in \mathbb{E}} f(x),\tag{4.3.9}
$$

where the Hessian of the function f satisfies the Lipschitz condition

$$
\| \nabla^{2} f(x) - \nabla^{2} f(y) \| \leq M_{f} \| x - y \|, \quad \forall x, y \in \mathbb{E}.\tag{4.3.10}
$$

Our main iteration will be the Cubic Newton Step

$$
\begin{array}{rl} &{T_{M}(x) = \underset{T \in \mathbb{R}}{\arg \operatorname{min}} \Big \{\langle \nabla f(x), T - x \rangle + \frac{1}{2} \langle \nabla^{2} f(x)(T - x), T - x \rangle} \\ &{} \\ &{\qquad + \frac{M}{6} \| T - x \|^{3} \Big\}.} \end{array}\tag{4.3.11}
$$

Let $r_{M}(x) = \| T_{M}(x) - x \|$ . Then the point $T = T_{M}(x)$ is characterized by the following first-order optimality condition:

$$
\begin{array}{r}{\nabla f(x) + \nabla^{2} f(x)(T - x) + \frac{1}{2} Mr_{M}(x) B(T - x) = 0.} \end{array}\tag{4.3.12}
$$

Lemma 4.3.3 For any $x \in \mathbb{E}$ we have

$$
\langle \nabla f(T_{M}(x)), x - T_{M}(x) \rangle \geq \frac{1}{Mr_{M}(x)} \| \nabla f(T_{M}(x)) \|_{*}^{2} + \frac{M^{2} - M_{f}^{2}}{4M} r_{M}^{3}(x).\tag{4.3.13}
$$

Moreover, if $\begin{array}{r}{M \geq \frac{1}{\sigma} M_{f}} \end{array}$ for some $\sigma \in(0, 1]$ , then

$$
\langle \nabla f(T_{M}(x)), x - T_{M}(x) \rangle \geq{\frac{1}{Mr_{M}(x)}} \| \nabla f(T_{M}(x)) \|_{*}^{2} +{\frac{1 - \sigma^{2}}{4}} Mr_{M}^{3}(x).\tag{4.3.14}
$$

Proof Let $T = T_{M}(x)$ . Then

$$
\begin{array}{rl}{\frac{M_{f}^{2} r_{M}^{4}(x)}{4} \overset{(4.3.10)}{\geq} \| \nabla f(T) - \nabla f(x) - \nabla^{2} f(x)(T - x) \|_{*}^{2}} &{} \\{\quad} &{} \\{\overset{(4.3.12)}{=} \| \nabla f(T) + \frac{1}{2} Mr_{M}(x) B(T - x) \|_{*}^{2}} &{} \\{\quad} &{} \\{= \quad} &{\| \nabla f(T) \|_{*}^{2} + Mr_{M}(x) \langle \nabla f(T), T - x \rangle + \frac{M^{2} r_{M}^{4}(x)}{4}.} \end{array}
$$

This is (4.3.13). Inequality (4.3.14) follows from (4.3.13) since $M_{f} \le \sigma M$ □

Let us consider now the following conceptual version of the Optimal Cubic Newton Method.

```latex
Optimal Cubic Newton Method (Conceptual Version)
Initialization. Choose $x_{0} \in \mathbb{E}, \sigma \in(0, 1)$ . Define $\begin{array}{r}{\psi_{0}(x) = \frac 12 \| x - x_{0} \|^{2}.} \end{array}$
Set $A_{0} = 0$ and $\begin{array}{r}{M = \frac{1}{\sigma} M_{f}} \end{array}$
kth iteration $(k \geq 0)$
(a) Compute $v_{t} = \arg \operatorname{min}_{x \in \mathbb{E}} \psi_{k}(x).$
(b) Choose $\rho_{k} > 0$ and find $a_{k + 1} > 0$ from equation $\begin{array}{r}{a_{k + 1}^{2} = \frac{2(A_{k} + a_{k + 1})}{M \rho_{k}}} \end{array}$
(c) Set $\begin{array}{r}{A_{k + 1} = A_{k} + a_{k + 1}, \tau_{k} = \frac{a_{k + 1}}{A_{k + 1}}, y_{k} =(1 - \tau_{k}) x_{k} + \tau_{k} v_{k}.} \end{array}$
(d) Compute $x_{k + 1} = T_{M}(y_{k})$ and define
ψ<sub>k 1</sub>(x)  ψ<sub>k</sub>(x)  a<sub>k 1</sub> f (x<sub>k 1</sub>) f (x<sub>k 1</sub>), x  x<sub>k 1</sub> .
```

(4.3.15)

Step (b) of method (4.3.15) is not completely specified since the definition of the parameter $\rho_{k}$ is missing. This is the reason why we call this method conceptual. Let us present some guidelines for its choice.

Lemma 4.3.4 Assume that parameters $\rho_{k}$ in method (4.3.15) satisfy condition

$$
r_{M}(y_{k}) \leq \rho_{k}.\tag{4.3.16}
$$

## 4.3 Optimal Second-Order Methods

Then for any $k \geq 0$ we have

$$
A_{k} f(x_{k}) + B_{k} \leq \psi_{k}^{*} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{min}_{x \in \mathbb{E}} \psi_{k}(x),\tag{4.3.17}
$$

where $\begin{array}{r}{B_{k} = \frac{1 - \sigma^{2}}{4} M \displaystyle \sum_{i = 0}^{k - 1} A_{i + 1} r_{M}^{3}(y_{i}).} \end{array}$

Proof Let us prove (4.3.17) by induction. For $t ~ = ~ 0$ it is trivial. Assume that inequality (4.3.17) is valid for some $k \geq 0$ . Then for any $x \in \mathbb{E}$ we have

$$
\begin{array}{rl}{\psi_{k + 1}(x)} &{\geq \quad \psi_{k}^{*} + \frac{1}{2} \| x - v_{k} \|^{2} + a_{k + 1}[f(x_{k + 1}) + \langle \nabla f(x_{k + 1}), x - x_{k + 1} \rangle]} \\ &{\overset{(4, 3, 17)}{\leq} \quad A_{k} f(x_{k}) + B_{k} + \frac{1}{2} \| x - v_{k} \|^{2}} \\ &{\qquad + a_{k + 1}[f(x_{k + 1}) + \langle \nabla f(x_{k + 1}), x - x_{k + 1} \rangle]} \\ &{\geq \quad A_{k + 1} f(x_{k + 1}) + B_{k} + \frac{1}{2} \| x - v_{k} \|^{2}} \\ &{\quad + \langle \nabla f(x_{k + 1}), A_{k}(x_{k} - x_{k + 1}) + a_{k + 1}(x - x_{k + 1}) \rangle} \\ &{= \quad A_{k + 1} f(x_{k + 1}) + B_{k} + \frac{1}{2} \| x - v_{k} \|^{2}} \\ &{\quad + \langle \nabla f(x_{k + 1}), a_{k + 1}(x - v_{k}) + A_{k + 1}(y_{k} - x_{k + 1}) \rangle.} \end{array}
$$

Therefore,

$$
\begin{array}{rl}{\psi_{k + 1}^{*}} &{\geq \quad A_{k + 1} f(x_{k + 1}) + B_{k} - \frac{1}{2} a_{k + 1}^{2} \| \nabla f(x_{k + 1}) \|_{*}^{2}} \\ &{\qquad + A_{k + 1} \langle \nabla f(x_{k + 1}), y_{k} - x_{k + 1} \rangle} \\ &{\overset{(4, 3.14)}{\geq} A_{k + 1} f(x_{k + 1}) + B_{k} - \frac{A_{k + 1}}{M \rho_{k}} \| \nabla f(x_{k + 1}) \|_{*}^{2}} \\ &{\qquad + A_{k + 1} \left(\frac{1}{Mr_{M}(y_{k})} \| \nabla f(x_{k + 1}) \|_{*}^{2} + \frac{1 - \sigma^{2}}{4} Mr_{M}^{3}(y_{k}) \right)} \end{array}
$$

□

$$
\begin{array}{rlr}{{\stackrel{(4.3.16)}{\geq} A_{k + 1} f(x_{k + 1}) + B_{k} + \frac{1 - \sigma^{2}}{4} MA_{k + 1} r_{M}^{3}(y_{k}).}} \end{array}
$$

In order to ensure a fast growth of the coefficients $A_{k}$ , we need to introduce more conditions for the parameters $\rho_{k}$

Lemma 4.3.5 Let us choose $\gamma \geq 1$ . Assume that parameters $\rho_{k}$ in method (4.3.15) satisfy condition

$$
r_{M}(y_{k}) \leq \rho_{k} \ \leq \ \gamma r_{M}(y_{k}).\tag{4.3.18}
$$

Then for any $k \geq 1$ we have

$$
\begin{array}{r}{A_{k} \geq \frac{1}{4} \left(\frac{1}{\gamma} \right)^{3 / 2} \frac{\sqrt{1 - \sigma^{2}}}{M \| x_{0} - x^{*} \|} \left(\frac{2k + 1}{3} \right)^{3.5}.} \end{array}\tag{4.3.19}
$$

Proof First of all, let us relate the rate of growth of coefficients $A_{k}$ to the values $r_{M}(y_{k})$ . Note that

$$
\begin{array}{r}{A_{k + 1}^{1 / 2} - A_{k}^{1 / 2} = \frac{a_{k + 1}}{A_{k + 1}^{1 / 2} + A_{k}^{1 / 2}} \ = \ \frac{1}{A_{k + 1}^{1 / 2} + A_{k}^{1 / 2}} \sqrt{\frac{2A_{k + 1}}{M \rho_{k}}} \ \geq \ \sqrt{\frac{1}{2M \rho_{k}}}.} \end{array}
$$

Thus,

$$
A_{k} \ge \frac{1}{2M} \left(\sum_{i = 0}^{k - 1} \frac{1}{\rho_{i}^{1 / 2}} \right)^{2} \stackrel{(4.3.18)}{\ge} \frac{1}{2M \gamma} \left(\sum_{i = 0}^{k - 1} \frac{1}{r_{M}^{1 / 2}(y_{i})} \right)^{2}.\tag{4.3.20}
$$

On the other hand, we have $\begin{array}{r}{A_{k} f(x_{k}) + B_{k} \stackrel{(4.3.17)}{\leq} A_{k} f(x^{*}) + \frac{1}{2} \| x_{0} - x^{*} \|^{2}.} \end{array}$ Therefore,

$$
\begin{array}{r}{B_{k} \ \equiv \ \frac{1 - \sigma^{2}}{4} M \displaystyle \sum_{i = 0}^{k - 1} A_{i + 1} r_{M}^{3}(y_{i}) \leq \frac 12 \| x_{0} - x^{*} \|^{2}.} \end{array}
$$

Let us estimate from below the value $\sum_{i = 0}^{k - 1} \frac{1}{r_{M}^{1 / 2}(y_{i})}$ subject to the above constraint. Defining $\xi_{i} = r_{M}^{1 / 2}(y_{i})$ and $\begin{array}{r}{D = \frac{2}{(1 - \sigma^{2}) M} \| x_{0} - x^{*} \|^{2}} \end{array}$ , we come to the following minimization problem:

$$
\xi^{*} = \operatorname{min}_{\xi \in \mathbb{R}^{k}} \left\{\sum_{i = 0}^{k - 1} \frac{1}{\xi_{i}} : \quad \sum_{i = 0}^{k - 1} A_{i + 1} \xi_{i}^{6} \leq D \right\}.
$$

Introducing a Lagrange multiplier λ for the inequality constraint, we get the following optimality conditions:

$$
\textstyle \frac{1}{\xi_{i}^{2}} = \lambda A_{i + 1} \xi_{i}^{5}, \quad i = 0, \ldots, k - 1.
$$

Thus, $\begin{array}{r}{\xi_{i} = \left(\frac{1}{\lambda A_{i + 1}} \right)^{1 / 7}} \end{array}$ . Since the constraint is active,

$$
D = \sum_{i = 0}^{k - 1} A_{i + 1} \left({\textstyle \frac{1}{\lambda A_{i + 1}}} \right)^{6 / 7} \ = \{\textstyle \frac{1}{\lambda^{6 / 7}}} \sum_{i = 0}^{k - 1} A_{i + 1}^{1 / 7}.
$$

Therefore, $\begin{array}{r}{\xi^{*} = \underset{i = 0}{\overset{k - 1}{\sum}}(\lambda A_{i + 1})^{1 / 7} = \frac{1}{D^{1 / 6}} \left(\underset{i = 0}{\overset{k - 1}{\sum}} A_{i + 1}^{1 / 7} \right)^{7 / 6}} \end{array}$ . Coming back to our initial notation, we get

$$
\begin{array}{r}{\displaystyle \sum_{i = 0}^{k - 1} \frac{1}{r_{M}^{1 / 2}(y_{i})} \geq \left(\frac{(1 - \sigma^{2}) M}{2 \| x_{0} - x^{*} \|^{2}} \right)^{1 / 6} \left(\displaystyle \sum_{i = 0}^{k - 1} A_{i + 1}^{1 / 7} \right)^{7 / 6}.} \end{array}
$$

In view of inequality (4.3.20), we come to the following relation:

$$
\begin{array}{r}{A_{k} \ge \frac{1}{2 \gamma} \left(\frac{1 - \sigma^{2}}{2M^{2} \| x_{0} - x^{*} \|^{2}} \right)^{1 / 3} \left(\displaystyle \sum_{i = 1}^{k} A_{i}^{1 / 7} \right)^{7 / 3}, \quad k \ge 1.} \end{array}\tag{4.3.21}
$$

Denote the coefficient in the right-hand side of inequality (4.3.21) by θ and let $C_{k} =$ $\left(\sum_{i = 1}^{k} A_{i}^{1 / 7} \right)^{2 / 3}$ . Then (4.3.21) can be rewritten as

$$
C_{k + 1}^{3 / 2} - C_{k}^{3 / 2} \geq \theta^{1 / 7} C_{k + 1}^{1 / 2}.
$$

This means that $C_{1} \geq \theta^{1 / 7}$ and

$$
\begin{array}{rl} &{\theta^{1 / 7} C_{k + 1}^{1 / 2} \le(C_{k + 1}^{1 / 2} - C_{k}^{1 / 2})(C_{k + 1}^{1 / 2}(C_{k + 1}^{1 / 2} + C_{k}^{1 / 2}) + C_{k})} \\ &{\qquad \le(C_{k + 1}^{1 / 2} - C_{k}^{1 / 2})(C_{k + 1}^{1 / 2}(C_{k + 1}^{1 / 2} + C_{k}^{1 / 2}) + \frac{1}{2} C_{k + 1}^{1 / 2}(C_{k + 1}^{1 / 2} + C_{k}^{1 / 2}))} \\ &{\qquad = \frac{3}{2} C_{k + 1}^{1 / 2}(C_{k + 1} - C_{k}).} \end{array}
$$

Thus, $C_{k} \geq \theta^{1 / 7}(1 + \textstyle \frac 23(k - 1)), k \geq 1$ . Finally, we obtain

$$
\begin{array}{rl}{{A_{k} \stackrel{(4, 3, 21)}{\geq} \theta(C_{k}^{3 / 2})^{7 / 3} \geq \theta(\theta^{1 / 7} \cdot \frac{2k + 1}{3})^{7 / 2} = \theta^{3 / 2}(\frac{2k + 1}{3})^{7 / 2}}} \\ &{=(\frac{1}{2 \gamma}(\frac{1 - \sigma^{2}}{2M^{2} \| x_{0} - x^{*} \|^{2}})^{1 / 3})^{3 / 2}(\frac{2k + 1}{3})^{3.5}} \\ &{= \frac{1}{4}(\frac{1}{\gamma})^{3 / 2} \frac{\sqrt{1 - \sigma^{2}}}{M \| x_{0} - x^{*} \|}(\frac{2k + 1}{3})^{3.5}.\qquad \mathtt{D}} \end{array}
$$

Now we are ready to justify the rate of convergence of method (4.3.15).

Theorem 4.3.2 Let us choose $\sigma \in(0, 1)$ and $\gamma \geq 1$ . Suppose that the parameters $\rho_{k}$ in method $(4.3.I5)$ satisfy condition (4.3.18). If method (4.3.15) is applied with $\begin{array}{r}{M = \frac{1}{\sigma} M_{f}} \end{array}$ , then for any $k \geq 1$ we have

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{2 \gamma^{3 / 2} M_{f} \| x_{0} - x^{*} \|^{3}}{\sigma \sqrt{1 - \sigma^{2}}} \left(\frac{3}{2k + 1} \right)^{3.5}.} \end{array}\tag{4.3.22}
$$

Proof Indeed, in view of inequality (4.3.17), we have

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq \frac{1}{2A_{k}} \| x_{0} - x^{*} \|^{2}.} \end{array}
$$

It remains to use the lower bound (4.3.19).

The best value of $\sigma$ in the right-hand side of inequality (4.3.22) is $\begin{array}{r}{\sigma = \frac{1}{\sqrt{2}}} \end{array}$ . In this case,

$$
\begin{array}{r}{f(x_{k}) - f(x^{*}) \leq 4 \gamma^{3 / 2} M_{f} \| x_{0} - x^{*} \|^{3} \left(\frac{3}{2k + 1} \right)^{3.5}, \quad k \geq 1.} \end{array}\tag{4.3.23}
$$

## 4.3.3 Complexity of the Search Procedure

In the previous section, we presented a conceptual second-order scheme (4.3.15), which reaches the best possible rate of convergence (4.3.8). In contrast to the Accelerated Cubic Newton Method (4.2.46), its estimating sequence $\{\psi_{k}\}$ starts from the squared Euclidean norm. Another difference consists in presenting the coefficient $\rho_{k}$ in the equation defining the scaling coefficient $a_{k + 1}$ (see Step b)). In order to make this method function in accordance to its rate of convergence (4.3.22), we need to ensure that

$$
\rho_{k} \approx r_{M}(y_{k}).\tag{4.3.24}
$$

Note that the right-hand side of this equality is a continuous function of $\rho_{k}$ . In this method, if $\rho_{k} = 0$ , then $a_{k + 1} = + \infty$ and $y_{k} = v_{k}$ . In this case, the left-hand side of inequality (4.3.24) is smaller than its right-hand side. If $\rho_{k} \to \infty$ , then $a_{k + 1} \to 0$ and $y_{k} \to x_{k}$ . Thus, there is always a root of equation (4.3.24).

However, the problem is that any search procedure in $\rho_{k}$ is very expensive. It needs to call the oracle many times. At present it is difficult to point out any favorable property of function $y_{k} = y_{k}(\rho_{k})$ which could help.

At the same time, from the practical point of view, the gain from this acceleration of the rate of convergence is very small. Indeed, method (4.2.46) ensures $\begin{array}{r}{O(\frac{1}{\epsilon^{1 / 3}})} \end{array}$ complexity of finding an $\epsilon$-solution of problem (4.3.9). The number of iterations of method (4.3.15) is of the order $\begin{array}{r}{O(\frac{1}{\epsilon^{2 / 7}})} \end{array}$ . Thus, the gain in the number of iterations of the “optimal” method is bounded by a factor proportional to $\left({\frac{1}{\epsilon}} \right)^{\frac{1}{21}}$ . For the values of $\epsilon$ used in practical applications, namely the range $10^{- 4} \dots 10^{- 12}$ , this is just an absolute constant (since $\left(10^{12} \right)^{\frac{1}{21}} < 4)$ . Therefore, this factor, decreasing the total number of iterations, cannot compensate a significant increase in the analytical computational complexity of each iteration. That is the main reason why we drop the cumbersome analysis of the complexity of the corresponding search procedure in this book.

To conclude, from the practical point of view, method (4.2.46) is now the fastest second-order scheme. At the same time, the problem of finding the optimal secondorder method with cheap iteration remains an open and challenging question in Optimization Theory.

## 4.4 The Modified Gauss–Newton Method

(Quadratic regularization; The modified Gauss–Newton process; Global rate of convergence; Comparative analysis; Implementation issues.)

## 4.4.1 Quadratic Regularization of the Gauss–Newton Iterate

The problem of solving a system of nonlinear equations is one of the most fundamental problems in Numerical Analysis. The standard approach consists in replacing the initial problem

$$
{\mathrm{Find ~}} x \in \mathbb{E} : \f_{i}(x) = 0, \quad i = 1, \ldots, m,\tag{4.4.1}
$$

by a minimization problem

$$
\operatorname{min}_{x \in \mathbb{E}} \left[f(x){\stackrel{\mathrm{def}}{=}} \phi(f_{1}(x), \ldots, f_{m}(x)) \right],\tag{4.4.2}
$$

where function $\phi(u)$ is non-negative and vanishes only at the origin. The most recommended choice for this merit function $\phi(u)$ is the standard squared Euclidean norm:

$$
\phi(u) = \| u \|_{(2)}^{2} \equiv \sum_{i = 1}^{m} \left(u^{(i)} \right)^{2},\tag{4.4.3}
$$

where squaring the norm has the advantage of keeping the objective function in (4.4.2) smooth enough. Of course, the new problem (4.4.2), (4.4.3) can be solved by the standard second-order minimization schemes. However, it is possible to reduce the order of the required derivatives by applying the so-called Gauss–Newton approach. In this case, the search direction is defined as a solution of the following

auxiliary problem:

$$
\operatorname{min}_{h \in \mathbb{R}} \left\{\phi \left(f_{1}(x) + \langle \nabla f_{1}(x), h \rangle, \ldots, f_{m}(x) + \langle \nabla f_{m}(x), h \rangle \right) : x + h \in D(x) \right\},
$$

where $D(x)$ is a properly chosen neighborhood of the point x. Under some nondegeneracy assumptions, for this strategy it is possible to establish local quadratic convergence.

Despite its elegance, the above approach deserves some criticism. Indeed, the transformation of problem (4.4.1) into problem (4.4.2) is done in a quite straightforward way. For example, if the initial system of equations is linear, then such a transformation squares the condition number of the problem. Besides increasing numerical instability, for large problems this leads to squaring the number of iterations, which is necessary to get an $\epsilon$-solution of the original problem.

In this section, we consider another approach. At first glance, it looks very similar to the standard one: We replace our initial problem by a minimization problem (4.4.2). However, our merit function is non-smooth.

Before we start, let us recall some notation. For a linear operator $A : \mathbb{E}_{1} \mathbb{E}_{2}$ its adjoint operator $A^{*} : \mathbb{E}_{2}^{*} \to \mathbb{E}_{1}^{*}$ is defined as follows:

$$
\begin{array}{r}{\langle s, Ax \rangle = \langle A^{*} s, x \rangle, \quad \forall x \in \mathbb{E}_{1}, \s \in \mathbb{E}_{2}^{*}.} \end{array}
$$

For measuring distances in $\mathbb{E}_{1}$ and $\mathbb{E}_{2}$ , we introduce the norms $\| \cdot \|_{\mathbb{E}_{1}}$ and $\| \cdot \|_{\mathbb{E}_{2}}$ In the dual spaces, the norms are defined in the standard way. For example,

$$
\| s \|_{\mathbb{E}_{1}^{*}} = \operatorname{max}_{x \in \mathbb{E}_{1}} \{\langle s, x \rangle : \ \| x \|_{\mathbb{E}_{1}} \leq 1\}, \quad s \in \mathbb{E}_{1}^{*}.
$$

If no ambiguity occurs, we drop subindexes of the norms since they are always defined by the spaces containing the arguments. For example, $\| s \| \equiv \| s \|_{\mathbb{E}_{1}^{*}}$ for $s \in \mathbb{E}_{1}^{*}$

For $A : \mathbb{E}_{1} \mathbb{E}_{2}$ , we define the minimal singular value as follows:

$$
\sigma_{\operatorname{min}}(A) = \operatorname{min}_{x \in \mathbb{E}_{1}} \{\| Ax \| : \ \| x \| = 1\} \quad \Rightarrow \quad \| Ax \| \ge \sigma_{\operatorname{min}}(A) \| x \| \quad \forall x \in \mathbb{E}_{1}.
$$

For invertible A, we have $\sigma_{\operatorname{min}}(A) = 1 / \| A^{- 1} \|$ . Note that for two linear operators $A_{1}$ and $A_{2}$

$$
\sigma_{\operatorname{min}}(A_{1} A_{2}) \geq \sigma_{\operatorname{min}}(A_{1}) \cdot \sigma_{\operatorname{min}}(A_{2}).
$$

If $\sigma_{\mathrm{min}}(A) > 0$ , then we say that the operator A possesses primal non-degeneracy.   
If $\sigma_{\mathrm{min}}(A^{*}) > 0$ , then we say that A possesses dual non-degeneracy.

Finally, for a non-linear function $F(\cdot) : \mathbb{E}_{1} \to \mathbb{E}_{2}$ we denote by $F^{\prime}(x)$ its Jacobian, which is a linear operator from $\mathbb{E}_{1}$ to $\mathbb{E}_{2}$

$$
F^{\prime}(x) h = \operatorname{lim}_{\alpha 0}{\frac{1}{\alpha}}[F(x + \alpha h) - F(x)] \in \mathbb{E}_{2}, \quad h \in \mathbb{E}_{1}.
$$

In the special case $f(\cdot) : \mathbb{E}_{1} \to \mathbb{E}_{2} \equiv \mathbb{R}$ , we have $f^{\prime}(x) h = \langle \nabla f(x), h \rangle$ for all $h \in{\mathbb{E}}_{1}$

Consider a smooth non-linear function $F(\cdot) : \mathbb{E}_{1} \to \mathbb{E}_{2}$ . Our main problem of interest is to find an approximate solution to the following system of equations:

$$
F(x) = 0, \quad x \in \mathbb{E}_{1}.\tag{4.4.4}
$$

In order to measure the quality of such a solution, we introduce a (sharp) merit function $\phi(u), u \in \mathbb{E}_{2}$ , which satisfies the following conditions:

- It is convex, non-negative and vanishes only at the origin. (Hence, its level sets are bounded.)

- It is Lipschitz-continuous with unit Lipschitz constant:

$$
| \phi(u) - \phi(v) | \leq \| u - v \|, \quad \forall u, v \in \mathbb{E}_{2}.\tag{4.4.5}
$$

- It has a sharp minimum at the origin:

$$
\phi(u) \geq \gamma_{\phi} \Vert u \Vert, \quad \forall u \in \mathbb{E}_{2},\tag{4.4.6}
$$

for a certain $\gamma_{\phi} \in(0, 1]$

For example, we can take $\phi(u) = \| u \|_{\mathbb{E}_{2}}$ . Then $\gamma_{\phi} = 1$

We can use this merit function to transform the problem (4.4.4) into the following unconstrained minimization problem:

$$
\operatorname{min}_{x \in \mathbb{E}_{1}} \{\f(x) \equiv \phi(F(x)) \\} \stackrel{\mathrm{def}}{=} \f^{*}.\tag{4.4.7}
$$

Clearly, the solution $x^{*}$ to the system (4.4.4) exists if and only if the optimal value $f^{*}$ of the problem (4.4.7) is equal to zero. The iterative scheme proposed below can be seen as a minimization method for problem (4.4.7), which employs a special structure of the objective function. Function $f$ can even be non-smooth. However, we will see that it is possible to decrease its value at any point $x \in \mathbb{E}_{1}$ excluding the stationary points of the problem (4.4.7).

Let us fix some $x ~ \in ~ \mathbb{E}_{1}$ . Consider the following local model of our objective function:

$$
\psi(x; y) = \phi \left(F(x) + F^{\prime}(x)(y - x) \right), \quad y \in \mathbb{E}_{1}.
$$

Note that $\psi(x; y)$ is convex in $y.$ . Therefore it looks natural to choose the next approximation of the solution to problem (4.4.7) from the set

$$
\operatorname{Arg} \operatorname{min}_{y \in \mathbb{E}_{1}} \psi(x; y).
$$

Such schemes are very well studied in the literature. For example, if choosing $\phi$ as in (4.4.3), we get the classical Gauss–Newton method. However, in what follows we see that a simple regularization of this approach leads to another scheme, for which we can speak about global efficiency of the process.

Let us introduce the following smoothness assumption. Denote by $\mathcal{F}$ a closed convex set in $\mathbb{E}_{1}$ with non-empty interior.

Assumption 4.4.1 The function $F(\cdot)$ is differentiable on the set $\mathcal{F}$ and its derivative is Lipschitz-continuous:

$$
\| F^{\prime}(x) - F^{\prime}(y) \| \leq L \| x - y \|, \quad \forall x, y \in \mathcal{F},\tag{4.4.8}
$$

with some $L > 0$

A straightforward consequence of this assumption is as follows:

$$
\begin{array}{r}{\| F(y) - F(x) - F^{\prime}(x)(y - x) \| \le \frac{1}{2} L \| y - x \|^{2}, \quad x, y \in \mathcal{F}.} \end{array}\tag{4.4.9}
$$

We skip its proof since it is very similar to the proof of inequality (1.2.13). In the remaining part of this section, we always assume that Assumption 4.4.1 is satisfied.

Lemma 4.4.1 For any x and y from ${\mathcal F},$ , we have

$$
\begin{array}{r}{| f(y) - \psi(x; y) | \leq \frac{1}{2} L \| y - x \|^{2}.} \end{array}\tag{4.4.10}
$$

Proof Let $d(x, y) = F(y) - F(x) - F^{\prime}(x)(y - x) \in \mathbb{E}_{2}$ . By inequality (4.4.9),

$$
\| d(x, y) \| \leq{\frac{1}{2}} L \| x - y \|^{2}.
$$

Since both x and y belong to $\mathcal{F}$ , we have

$$
\begin{array}{rlr}{{\vert f(y) - \psi(x; y) \vert = \vert \phi(F(y)) - \phi(F(x) + F^{\prime}(x)(y - x)) \vert}} \\ &{} &{\stackrel{(4.4.5)}{\leq} \Vert d(x, y) \Vert \leq \frac{1}{2} L \Vert y - x \Vert^{2}.\qquad \boxtimes} \end{array}
$$

Inequality (4.4.10) provides us with an upper approximation of function $f$

$$
\begin{array}{r}{f(y) \leq \psi(x; y) + \frac{1}{2} L \| y - x \|^{2}, \quad \forall x, y \in \mathcal{F}.} \end{array}
$$

Let us use it for constructing a minimization scheme. Let M be a positive parameter. For the problem (4.4.7), define a modified Gauss–Newton iterate from a point $x \in$ $\mathcal{F}$ as follows:

$$
\begin{array}{r}{\boxed{V_{M}(x) \in \mathop{\mathrm{Arg}} \underset{y \in \mathbb{E}_{1}}{\operatorname{min}} \left[\psi(x; y) + \frac{1}{2} M \lVert y - x \rVert^{2} \right],}} \end{array}\tag{4.4.11}
$$

where $\mathbf{\ddot{\tau}} \mathbf{Arg}^{\mathbf{\vec{\tau}}, \mathbf{\vec{\tau}}}$ indicates that $V_{M}(x)$ is chosen from the set of global minima of the corresponding minimization problem.<sup>3</sup> Note that the auxiliary optimization problem in (4.4.11) is convex in $y.$ . We postpone a discussion on the complexity of finding the point $V_{M}(x)$ until Sect. 4.4.4.

Let us prove several auxiliary results. Define

$$
\begin{array}{l}{r_{M}(x) = \| V_{M}(x) - x \|,} \\{\quad} \\{f_{M}(x) = \psi(x; V_{M}(x)) + \frac{1}{2} Mr_{M}^{2}(x),} \\{\quad} \\{\delta_{M}(x) = f(x) - f_{M}(x).} \end{array}
$$

For a fixed x, the value $f_{M}(x)$ is a concave function in M since it can be represented as a minimum of functions linear in M (see Theorem 3.1.8):

$$
f_{M}(x) = \operatorname{min}_{y \in \mathbb{E}_{1}} \left[\psi(x; y) +{\textstyle \frac{1}{2}} M \| y - x \|^{2} \right].
$$

Consequently, the value $\textstyle{\frac{1}{2}} r_{M}^{2}(x)$ , which is equal to the derivative of $f_{M}(x)$ in M (see Lemma 3.1.14), is a decreasing function of M.

Lemma 4.4.2 For any $x \in \mathbb{E}_{1}$ we have

$$
\delta_{M}(x) \geq \frac{1}{2} Mr_{M}^{2}(x).\tag{4.4.12}
$$

Proof Let us fix an arbitrary $x \in \mathbb{E}_{1}$ . Let $\begin{array}{r}{\psi_{0}(y) = \frac{1}{2} M \| y - x \|^{2}} \end{array}$ and

$$
\psi_{1}(y) = \psi(x; y) + \psi_{0}(y).
$$

In view of Theorem 3.1.24, there exists $g_{1} \in \partial_{y} \psi(x; V_{M}(x))$ and $g_{2} \in \partial \psi_{0}(V_{M}(x))$ such that

$$
\langle g_{1} + g_{2}, y - V_{M}(x) \rangle \geq 0 \quad \forall y \in \mathbb{E}_{1}.\tag{4.4.13}
$$

At the same time, in view of identity (3.1.39), we have $\langle g_{2}, V_{M}(x) - x \rangle = Mr_{M}^{2}(x)$ Hence,

$$
\begin{array}{lcl}{{f(x)}} &{{=}} &{{\psi(x; x) \begin{array}{c}{{\stackrel{(3.1.23)}{\geq}}} \end{array} \psi(x, V_{M}(x)) + \langle g_{1}, x - V_{M}(x) \rangle}} \\{{}} &{{}} \\{{}} &{{\stackrel{(4.4.13)}{\geq} \psi(x, V_{M}(x)) + \langle g_{2}, V_{M}(x) - x \rangle}} \\{{}} &{{}} \\{{}} &{{=}} &{{\psi(x, V_{M}(x)) + Mr_{M}^{2}(x) = \f_{M}(x) +{\textstyle \frac 12} Mr_{M}^{2}(x).}} \end{array}
$$

This is exactly inequality (4.4.12).

Let us compare $\delta_{M}(x)$ with another natural measure of local decrease of the model $\psi(x; \cdot)$ . For $r > 0$ define

$$
\Delta_{r}(x) = f(x) - \operatorname{min}_{y \in \mathbb{E}_{1}} \{\psi(x; y) : \ \| y - x \| \le r\}.
$$

Lemma 4.4.3 For any $x \in \mathbb{E}_{1}$ and $r > 0$ we have

$$
\begin{array}{r}{\delta_{M}(x) \ge Mr^{2} \cdot \varkappa \left(\frac{1}{Mr^{2}} \varDelta_{r}(x) \right),} \end{array}\tag{4.4.14}
$$

where

$$
\varkappa(t) = \left\{\begin{array}{ll}{t - \frac{1}{2}, t \geq 1,} \\{\qquad} \\{\frac{1}{2} t^{2}, t \in[0, 1].} \end{array} \right.
$$

The right-hand side of the bound $(4.4.I4)$ is a decreasing function of M.

Proof Let us choose $h_{r} \in \operatorname{Arg} \operatorname{min}_{h \in \mathbb{E}_{1}} \{\psi(x; x + h) : \ \| h \| \leq r\}$ . Then

$$
\begin{array}{rl} &{f_{M}(x) \leq \underset{\tau}{\operatorname{min}} \{\phi(F(x) + \tau F^{\prime}(x) h_{r}) + \frac{1}{2} M \tau^{2} r^{2} : \ \tau \in[0, 1]\}} \\ &{\qquad = \underset{\tau}{\operatorname{min}} \{\phi((1 - \tau) F(x) + \tau(F(x) + F^{\prime}(x) h_{r})) + \frac{1}{2} M \tau^{2} r^{2} : \ \tau \in[0, 1]\}} \\ &{\qquad \leq \underset{\tau}{\operatorname{min}} \{(1 - \tau) \phi(F(x)) + \tau \phi(F(x) + F^{\prime}(x) h_{r})) + \frac{1}{2} M \tau^{2} r^{2} : \ \tau \in[0, 1]\}} \\ &{\qquad = \underset{\tau}{\operatorname{min}} \{f(x) - \tau \Delta_{r}(x) + \frac{1}{2} M \tau^{2} r^{2} : \ \tau \in[0, 1]\}.} \end{array}
$$

Thus,

$$
\delta_{M}(x) \geq \operatorname{max}_{\tau \in[0, 1]} \{\tau \Delta_{r}(x) - \frac{1}{2} M \tau^{2} r^{2}\} = Mr^{2} \cdot \varkappa \left(\frac{1}{Mr^{2}} \Delta_{r}(x) \right).
$$

Note that the right-hand side of this inequality is decreasing in M.

Define

$$
\mathcal{L}(\tau) = \{y \in \mathbb{E}_{1} : \f(y) \leq \tau\}.
$$

Lemma 4.4.4 Let ${\mathcal{L}}(f(x)) \subseteq$ int $\mathcal{F}$ and $M \geq L$ . Then $V_{M}(x) \in \mathcal{L}(f(x))$

Proof Let $V_{M}(x) \not \in{\mathcal{L}}(f(x))$ . Consider the points

$$
y(\alpha) = x + \alpha \cdot(V_{M}(x) - x), \quad \alpha \in[0, 1].
$$

Since $y(0) = x \in$ int $\mathcal{F}$ , we can define the value $\bar{\alpha} \in(0, 1)$ such that $y(\bar{\alpha})$ lies at the boundary of the set $\mathcal{F}$ . Note that

$$
f(y({\bar{\alpha}})) \geq f(x) \geq f_{M}(x),
$$

and $r_{M}(x) > 0$ . By our assumption, $\bar{\alpha} \in(0, 1)$ . Define

$$
d = F(y(\bar{\alpha})) - F(x) - \bar{\alpha} F^{\prime}(x)(V_{M}(x) - x) \in \mathbb{E}_{2}.
$$

In view of inequality (4.4.9), $\begin{array}{r}{\| d \| \leq \frac{L}{2} \bar{\alpha}^{2} r_{M}^{2}(x)} \end{array}$ . Therefore,

$$
\begin{array}{rl} &{f(x) \leq f(y(\bar{\alpha})) = \phi(F(x) + \bar{\alpha} F^{\prime}(x)(y(1) - x) + d)} \\ &{} \\ &{\qquad \leq \phi((F(x) + \bar{\alpha} F^{\prime}(x)(V_{M}(x) - x)) + \| d \|} \\ &{} \\ &{\qquad \leq(1 - \bar{\alpha}) f(x) + \bar{\alpha} \phi((F(x) + F^{\prime}(x)(V_{M}(x) - x)) + \frac 12M \bar{\alpha}^{2} r_{M}^{2}(x)} \\ &{} \\ &{\qquad \leq(1 - \bar{\alpha}) f(x) + \bar{\alpha} f_{M}(x) - \frac 12M \bar{\alpha}(1 - \bar{\alpha}) r_{M}^{2}(x).} \end{array}
$$

Thus, $\begin{array}{r}{f(x) \le f_{M}(x) - \frac 12M(1 - \bar{\alpha}) r_{M}^{2}(x)} \end{array}$ , which is a contradiction to (4.4.12).

Lemma 4.4.5 Let both x and $V_{M}(x)$ belong to $\mathcal{F}$ . Then

$$
f_{M}(x) \leq \operatorname{min}_{y \in \mathcal{F}} \left[f(y) + \frac{1}{2}(L + M) \| y - x \|^{2} \right].\tag{4.4.15}
$$

Proof For $y \in \mathcal{F}$ let $d(x, y) ~ = ~ F(y) - F(x) - F^{\prime}(x)(y - x) ~ \in ~ \mathbb{E}_{2}$ . By inequality (4.4.9),

$$
\| d(x, y) \| \leq{\frac{1}{2}} L \| x - y \|^{2}.
$$

Hence, since both x and $V_{M}(x)$ belong to $\mathcal{F}$ , we have

$$
\begin{array}{l}{f_{M}(x) = \displaystyle \operatorname{min}_{y \in \mathcal{F}} \left[\phi(F(x) + F^{\prime}(x)(y - x)) + \displaystyle \frac{1}{2} M \| y - x \|^{2} \right]} \\{\displaystyle \quad = \operatorname{min}_{y \in \mathcal{F}} \left[\phi(F(y) - d(x, y)) + \displaystyle \frac{1}{2} M \| y - x \|^{2} \right]} \\{\displaystyle \quad \leq \operatorname{min}_{y \in \mathcal{F}} \left[f(y) + \displaystyle \frac{1}{2}(L + M) \| y - x \|^{2} \right].} \end{array}
$$

Corollary 4.4.1 Let $x^{*}$ be a solution to problem (4.4.7) and ${\mathcal{L}}(f(x)) \subseteq{\mathcal{F}}$ . Then

$$
f_{M}(x) \leq f^{*} + \frac{1}{2}(L + M) \| x - x^{*} \|^{2}.\tag{4.4.16}
$$

Proof It is enough to substitute $y = x^{*}$ in the right-hand side of (4.4.15).

## 4.4.2 The Modified Gauss–Newton Process

Now we can analyze the convergence of the following process. Let us fix $L_{0} ~ \in$ $(0, L]$

Modified Gauss–Newton method   
Initialization: Choose $x_{0} \in \mathbb{R}^{n}$   
Iteration $k,(k \geq 0)$   
1. Find $M_{k} \in[L_{0}, 2L]$ such that   
f (V<sub>M</sub> (x<sub>k</sub>))  f<sub>M</sub> (x<sub>k</sub>).   
2. Set x<sub>k 1</sub> V<sub>M</sub> (x<sub>k</sub>).

(4.4.17)

Since $f_{M}(x) \leq f(x)$ , this process is monotone:

$$
f(x_{k + 1}) \leq f(x_{k}).\tag{4.4.18}
$$

If the constant L is known, then in Item 1 of this scheme we can use $M_{k} \equiv L$ . In the opposite case, it is possible to apply a simple search procedure (see, for example, Sect. 4.1.4). Let us now present the convergence results.

Let $x_{0} \in$ int $\mathcal{F}$ be a starting point for the above minimization process. We need to assume the following.

Assumption 4.4.2 The set $\mathcal{F}$ is big enough: ${\mathcal{L}}(f(x_{0})) \subseteq{\mathcal{F}}$

In what follows, we always suppose that Assumption 4.4.2 is satisfied. In view of (4.4.18,) this assumption implies that ${\mathcal{L}}(f(x_{k})) \subseteq{\mathcal{F}}$ for any $k \geq 0$

Theorem 4.4.1 For any $k \geq 0$ and $r > 0$ we have

$$
f(x_{k}) - f^{*} \geq \textstyle \frac{1}{2}{L_{0}} \sum_{i = k}^{\infty} r_{M_{i}}^{2}(x_{i}) \geq \textstyle \frac{1}{2}{L_{0}} \sum_{i = k}^{\infty} r_{2L}^{2}(x_{i}),\tag{4.4.19}
$$

$$
\begin{array}{r}{f(x_{k}) - f^{*} \ge r^{2} \displaystyle \sum_{i = k}^{\infty} M_{i} x \left(\frac{1}{M_{i} r^{2}} \Delta_{r}(x) \right) \ge 2Lr^{2} \displaystyle \sum_{i = k}^{\infty} \varkappa \left(\frac{1}{2Lr^{2}} \Delta_{r}(x) \right).} \end{array}
$$

Proof Indeed, in view of the rules of Step 1 in (4.4.17),

$$
f_{M_{i}}(x_{i}) \geq f(x_{i + 1}), \quad M_{i} \geq L_{0}, \quad r_{M_{i}}(x_{i}) \geq r_{2L}(x_{i}).
$$

Thus, inequality (4.4.12) justifies the first inequality in (4.4.19). In order to prove the second one, we apply (4.4.14) and use the bound $M_{i} ~ \leq ~ 2L$ imposed by (4.4.17).

Corollary 4.4.2 Let the sequence $\{x_{k}\}_{k = 0}^{\infty}$ be generated by the scheme (4.4.17). Then

$$
\operatorname{lim}_{k \to \infty} \| x_{k} - x_{k + 1} \| = 0, \quad \operatorname{lim}_{k \to \infty} \varDelta_{r}(x_{k}) = 0,
$$

and therefore the set of limit points $X^{*}$ of this sequence is connected. For any $\bar{x}$ from $X^{*}$ , we have $\varDelta_{r}(\bar{x}) = 0$ .

Let us justify now the local convergence of the scheme (4.4.17).

Theorem 4.4.2 Let the point $x^{*} \in \mathcal{L}(f(x_{0}))$ with $F(x^{*}) = 0$ be a non-degenerate solution to problem (4.4.4):

$$
\sigma \equiv \sigma_{\mathrm{min}}(F^{\prime}(x^{*})) > 0.
$$

Let $\gamma_{\phi}$ be defined by (4.4.6). If $x_{k} \in \mathcal{L}(f(x_{0}))$ and

$$
\begin{array}{r}{\| \boldsymbol{x}_{k} - \boldsymbol{x}^{*} \| \le \frac{2}{L} \cdot \frac{\sigma \gamma_{\phi}}{3 + 5 \gamma_{\phi}},} \end{array}
$$

then $x_{k + 1} \in{\mathcal{L}}(f(x_{0}))$ and

$$
\begin{array}{r}{\| x_{k + 1} - x^{*} \| \leq \frac{3(1 + \gamma_{\phi}) L \| x_{k} - x^{*} \|^{2}}{2 \gamma_{\phi}(\sigma - L \| x_{k} - x^{*} \|)} \leq \| x_{k} - x^{*} \|.} \end{array}\tag{4.4.20}
$$

Proof Since $f(x^{*}) = 0$ , in view of inequality (4.4.16) and inequality (4.4.9), we have

$$
\begin{array}{rl} &{\frac{\lambda \hat{L}}{2} \Vert x_{k} - x^{*} \Vert^{2} \geq f_{M_{k}}(x_{k}) \geq \psi(x_{k}; x_{k + 1}) \geq \gamma_{\phi} \Vert F(x_{k}) + F^{\prime}(x_{k})(x_{k + 1} - x_{k}) \Vert} \\ &{\qquad = \gamma_{\phi} \Vert F^{\prime}(x^{*})(x_{k + 1} - x^{*}) + \big(F(x_{k}) - F(x^{*}) - F^{\prime}(x^{*})(x_{k} - x^{*}) \big)} \\ &{\qquad +(F^{\prime}(x_{k}) - F^{\prime}(x^{*}))(x_{k + 1} - x_{k}) \Vert} \\ &{\qquad \geq \gamma_{\phi} \Vert F^{\prime}(x^{*})(x_{k + 1} - x^{*}) \Vert - \frac{L}{2} \Vert x_{k} - x^{*} \Vert^{2}} \\ &{\qquad - L \Vert x_{k} - x^{*} \Vert \cdot \Vert x_{k + 1} - x_{k} \Vert]} \\ &{\qquad \geq \gamma_{\phi} \Big[(\sigma - L \Vert x_{k} - x^{*} \Vert) \cdot \Vert x_{k + 1} - x^{*} \Vert - \frac{3L}{2} \Vert x_{k} - x^{*} \Vert^{2} \Big].\quad \quad \Gamma} \end{array}
$$

## 4.4.3 Global Rate of Convergence

In order to get global complexity results for method (4.4.17), we need to introduce an additional non-degeneracy assumption.

Assumption 4.4.3 The operator $F^{\prime}(x) : \mathbb{E}_{1} \to \mathbb{E}_{2}$ possesses a uniform dual nondegeneracy:

$$
\sigma_{\operatorname{min}}(F^{\prime}(x)^{*}) \geq \sigma > 0 \quad \forall x \in \mathcal{L}(f(x_{0})).
$$

Note that this assumption implies dim $\mathbb{E}_{2} ~ \leq ~ \mathrm{dim} \mathbb{E}_{1}$ . The role of Assumption 4.4.3 in our analysis can be seen from the following standard result.

Lemma 4.4.6 Let the linear operator $A : \mathbb{E}_{1} \mathbb{E}_{2}$ possess dual non-degeneracy:

$$
\sigma_{\mathrm{min}}(A^{*}) > 0.
$$

Then for any $b \in \mathbb{E}_{2}$ there exists a point $x(b) \in \mathbb{E}_{1}$ such that

$$
\begin{array}{r}{Ax(b) = b, \quad \| x(b) \| \ \leq \ \frac{\| b \|}{\sigma_{\operatorname{min}}(A^{*})}.} \end{array}
$$

Proof Consider the following optimization problem:

$$
\operatorname{min}_{x} \{f(x) = \| x \| : Ax = b\}.
$$

Since the level sets of its objective function are bounded, its solution $x^{*}$ exists. In view of the statement (3.1.59), there exists a $y^{\ast} \in \mathbb{E}_{2}^{\ast}$ such that $g^{*} = A^{*} y^{*} \in$ $\partial f(x^{*})$ . Using inequality (3.1.42) and Lemma 3.1.15, we conclude that $\| g^{*} \| \leq 1$ Thus,

$$
1 \geq \| A^{*} y^{*} \| ~ \geq ~ \sigma_{\operatorname{min}}(A^{*}) \| y^{*} \|.\tag{4.4.21}
$$

On the other hand,

$$
\| x^{*} \| \overset{(3.1.40)}{=} \langle g^{*}, x^{*} \rangle = \langle Ax^{*}, y^{*} \rangle = \langle b, y^{*} \rangle \leq \| b \| \cdot \| y^{*} \|.
$$

It remains to apply inequality (4.4.21).

An important consequence of Lemma 4.4.6 is as follows.

Lemma 4.4.7 Let the operator $F^{\prime}(x)$ possess dual non-degeneracy: $\sigma_{\mathrm{min}}(F^{\prime}(x)^{*})$ $> 0.$ . Then for any $M > 0$ we have

$$
\begin{array}{r}{r_{M}(x) \leq \frac{\| F(x) \|}{\sigma_{\operatorname{min}}(F^{\prime}(x)^{*})}.} \end{array}\tag{4.4.22}
$$

Proof Indeed, in view of Lemma 4.4.6 there exists an $h^{*}$ such that

$$
F(x) + F^{\prime}(x) h^{*} = 0
$$

and $\begin{array}{r}{\| h^{*} \| \leq \frac{\| F(x) \|}{\sigma_{\operatorname{min}}(F^{\prime}(x)^{*})}} \end{array}$ . Therefore

$$
\begin{array}{l}{\displaystyle \frac{M}{2} r_{M}^{2}(x) \leq \psi(x; V_{M}(x)) + \frac{M}{2} r_{M}^{2}(x) = \displaystyle \operatorname{min}_{h \in \mathbb{E}_{1}} \left[\psi(x; x + h) + \frac{M}{2} \| h \|^{2} \right]} \\{\leq \displaystyle \frac{M}{2} \| h^{*} \|^{2} \leq \frac{M \| F(x) \|^{2}}{2 \sigma_{\operatorname{min}}^{2}(F^{\prime}(x)^{*})}.\qquad \Omega} \end{array}
$$

Now we can justify the global rate of convergence of scheme (4.4.17).

Theorem 4.4.3 Let Assumptions 4.4.1, 4.4.2 and 4.4.3 be satisfied.

1) Suppose that the sequence $\{x_{k}\}_{k = 0}^{\infty}$ is generated by method (4.4.17). If $f(x_{k}) \geq$ $\frac{\sigma^{2}}{2L} \gamma_{\phi}^{2},$ , then

$$
\begin{array}{r}{f(x_{k + 1}) \leq f(x_{k}) - \frac{\sigma^{2}}{4L} \gamma_{\phi}^{2}.} \end{array}\tag{4.4.23}
$$

Otherwise,

$$
\begin{array}{r}{f(x_{k + 1}) \leq \frac{L}{\sigma^{2} \gamma_{\phi}^{2}} f^{2}(x_{k}) \leq \frac{1}{2} f(x_{k}).} \end{array}\tag{4.4.24}
$$

2) Suppose that the sequence $\{x_{k}\}_{k = 0}^{\infty}$ is generated by method (4.4.17) with $M_{k} \equiv$ L. If $\begin{array}{r}{f(x_{k}) \ge \frac{\sigma^{2}}{L} \gamma_{\phi}^{2};} \end{array}$ , then

$$
\begin{array}{r}{f(x_{k + 1}) \leq f(x_{k}) - \frac{\sigma^{2}}{2L} \gamma_{\phi}^{2}.} \end{array}\tag{4.4.25}
$$

Otherwise,

$$
\begin{array}{r}{f(x_{k + 1}) \leq \frac{L}{2 \sigma^{2} \gamma_{\phi}^{2}} f^{2}(x_{k}) \leq \frac{1}{2} f(x_{k}).} \end{array}\tag{4.4.26}
$$

Proof Let us prove the first part of the theorem. Since the operator $F^{\prime}(x_{k})$ is nondegenerate, in view of Lemma 4.4.6 there exists a solution $h_{k}^{*}$ to the system of linear equations $F(x_{k}) + F^{\prime}(x_{k}) h = 0$ with a bounded norm:

$$
\begin{array}{r}{\| h_{k}^{*} \| \leq \frac{1}{\sigma} \| F(x_{k}) \| \leq \frac{1}{\sigma \gamma_{\phi}} f(x_{k}).} \end{array}
$$

Therefore, in view of the step-size rules in the scheme (4.4.17) and the upper bound on the values $M_{k}$ , we have

$$
\begin{array}{rl}{f(x_{k + 1}) \leq \underset{h \in \mathbb{E}_{1}}{\operatorname{min}} \left[\phi(F(x_{k}) + F^{\prime}(x_{k}) h) + \frac{1}{2} M_{k} \| h \|^{2} \right]} &{} \\ &{\leq \underset{t \in[0, 1]}{\operatorname{min}} \left[\phi(F(x_{k}) + tF^{\prime}(x_{k}) h_{k}^{*}) + L \| th_{k}^{*} \|^{2} \right]} \\ &{\leq \underset{t \in[0, 1]}{\operatorname{min}} \left[\phi((1 - t) F(x_{k})) + \frac{L}{\sigma^{2} \gamma_{\phi}^{2}} t^{2} f^{2}(x_{k}) \right]} \\ &{\leq \underset{t \in[0, 1]}{\operatorname{min}} \left[(1 - t) f(x_{k}) + \frac{L}{\sigma^{2} \gamma_{\phi}^{2}} t^{2} f^{2}(x_{k}) \right].} \end{array}
$$

Thus, if $\begin{array}{r}{f(x_{k}) \ \le \ \frac{\sigma^{2}}{2L} \gamma_{\phi}^{2}} \end{array}$ , then the minimum in the latter univariate problem is attained at $t = 1$ and we get inequalities (4.4.24). In the opposite case, the minimum is attained at $\begin{array}{r}{t = \frac{\sigma^{2} \gamma_{\phi}^{2}}{2Lf(x_{k})}} \end{array}$ and we get estimate (4.4.23).

The second part of the theorem can be proved in a similar way.

Using Theorem 4.4.3, we can establish some properties of problem (4.4.7).

Theorem 4.4.4 Let Assumptions 4.4.1, 4.4.2 and 4.4.3 be satisfied. Then there exists a solution $x^{*}$ to problem (4.4.7) such that $f(x^{*}) = 0$ and

$$
\begin{array}{r}{\| \boldsymbol{x}^{*} - \boldsymbol{x}_{0} \| \le \frac{2}{\sigma} \| \boldsymbol{F}(\boldsymbol{x}_{0}) \|.} \end{array}\tag{4.4.27}
$$

Proof Let us choose $\phi(u) = \| u \|$ . Then $\gamma_{\phi} = 1$ . Let us now apply method (4.4.17) with $M_{k} \equiv L$ to the corresponding problem (4.4.7) with $f(x) = \| F(x) \|$

Assume first that $\begin{array}{ll}{f(x_{0}){\mathrm{~ > ~}} \frac{\sigma^{2}}{L}} \end{array}$ . In accordance with the second statement of Theorem 4.4.3, as far as $\begin{array}{r}{f(x_{k}) \ge \frac{\sigma^{2}}{L}} \end{array}$ we have

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{\sigma^{2}}{2L}.} \end{array}\tag{4.4.28}
$$

Denote by N the length of the first stage of the process:

$$
\begin{array}{r}{f(x_{N}) \geq \frac{\sigma^{2}}{L} \geq f(x_{N + 1}).} \end{array}
$$

Summing up inequalities (4.4.28) for $k = 0, \ldots, N$ , we get

$$
\begin{array}{r}{N + 1 \le \frac{2L}{\sigma^{2}}(f(x_{0}) - f(x_{N + 1})).} \end{array}\tag{4.4.29}
$$

On the other hand, in view of inequality (4.4.12) we have

$$
f(x_{k}) - f(x_{k + 1}) \geq{\frac{L}{2}} \| x_{k} - x_{k + 1} \|^{2}.\tag{4.4.30}
$$

Summing up these inequalities for $k = 0, \ldots, N$ , we get

$$
f(x_{0}) - f(x_{N + 1}) \geq \frac{L}{2} \sum_{k = 0}^{N} \| x_{k} - x_{k + 1} \|^{2} \geq \frac{L}{2(N + 1)} \left(\sum_{k = 0}^{N} \| x_{k} - x_{k + 1} \| \right)^{2}
$$

$$
\begin{array}{r}{\geq \frac{L}{2(N + 1)} \| x_{0} - x_{N + 1} \|^{2}.} \end{array}
$$

Now, using estimate (4.4.29), we obtain

$$
\begin{array}{r}{\| x_{0} - x_{N + 1} \| \leq \left[\frac{2(N + 1)}{L}(f(x_{0}) - f(x_{N + 1})) \right]^{1 / 2} \leq \frac{2}{\sigma}(f(x_{0}) - f(x_{N + 1})).} \end{array}\tag{4.4.31}
$$

Further, in view of Theorem 4.4.3, at the second stage of the process we can guarantee that

$$
\begin{array}{r}{f(x_{k + 1}) \leq \frac{L}{2 \sigma^{2}} f^{2}(x_{k}) \leq \frac{1}{2} f(x_{k}), \quad k \geq N + 1.} \end{array}\tag{4.4.32}
$$

Thus, $f(x_{N + k + 1}) \leq(\textstyle{\frac{1}{2}})^{k} f(x_{N + 1})$ for $k \geq 0$ . Hence, in view of inequality (4.4.22) we have

$$
\begin{array}{r}{\| x_{N + k + 2} - x_{N + k + 1} \| \le \frac{1}{\sigma}(\frac{1}{2})^{k} f(x_{N + 1}), \quad k \ge 0.} \end{array}
$$

Thus, the sequence $\{x_{k}\}_{k = 0}^{\infty}$ converges to a point $x^{*}$ with $F(x^{*}) = 0$ and

$$
\begin{array}{r}{\| x^{*} - x_{N + 1} \| \leq \frac{2}{\sigma} f(x_{N + 1}).} \end{array}
$$

Taking into account this inequality and (4.4.31), we get (4.4.27).

If $\begin{array}{r}{f(x_{0}) \leq \frac{\sigma^{2}}{L}} \end{array}$ , then we can apply the latter reasoning from the very beginning:

$$
\sum_{k = 0}^{\infty} \| x_{k + 1} - x_{k} \| \leq{\frac{1}{\sigma}} \sum_{k = 0}^{\infty} f(x_{k}) \leq{\frac{1}{\sigma}} f(x_{0}) \sum_{k = 0}^{\infty}({\frac{1}{2}})^{k} ={\frac{2}{\sigma}} f(x_{0}).
$$

Applying exactly the same arguments as in the proof of Theorem 4.4.4, it is possible to justify the following statement.

Theorem 4.4.5 Let Assumptions 4.4.1, 4.4.2 and 4.4.3 be satisfied. Suppose the sequence $\{x_{k}\}_{k = 0}^{\infty}$ is generated by method $(4.4.I7)$ as applied to problem (4.4.7). Then this sequence converges to a single point $x^{*}$ with $F(x^{*}) = 0$ □

Let us conclude this section with the following remark. We have seen that Assumptions 4.4.1, 4.4.2 and 4.4.3 guarantee the existence of a solution to problem (4.4.4). Define

$$
D = \operatorname{min}_{x} \{\| x - x_{0} \| : x \in \mathcal{L}(f(x_{0})), \F(x) = 0\}.
$$

In view of Corollary 4.4.1 and the bounds on $M_{k}$ in method (4.4.17), we can always guarantee that

$$
\begin{array}{r}{f(x_{1}) \leq \frac{3}{2} LD^{2}.} \end{array}\tag{4.4.33}
$$

Thus, in view of Theorem 4.4.3, the number of iterations N of method (4.4.17) which is necessary for reaching the region of quadratic convergence can be bounded as follows:

$$
\begin{array}{r}{N \leq 1 + \frac{4L}{\sigma^{2} \gamma_{\phi}^{2}} f(x_{1}) \leq 1 + 6 \left(\frac{LD}{\sigma \gamma_{\phi}} \right)^{2}.} \end{array}\tag{4.4.34}
$$

We will refer to this bound as an upper complexity estimate of the class of problems described by Assumptions 4.4.1, 4.4.2 and 4.4.3. This bound is justified by the modified Gauss–Newton method (4.4.17).

## 4.4.4 Discussion

## 4.4.4.1 A Comparative Analysis of Scheme (4.4.17)

Let us compare the efficiency of method (4.4.17) with the Cubic Newton Method for unconstrained minimization (see Sect. 4.1). Note that the fields of applications of both methods intersect. Indeed, any problem of solving a system of non-linear equations can be transformed into a problem of unconstrained minimization using some merit function. On the other hand, any unconstrained minimization problem can be reduced to a system of non-linear equations, which corresponds to the firstorder optimality conditions (1.2.4).

Consider the following unconstrained minimization problem:

$$
\operatorname{min}_{x \in \mathbb{E}_{1}} \varphi(x),\tag{4.4.35}
$$

where $\varphi(\cdot)$ is a twice differentiable strongly convex function whose Hessian is Lipschitz continuous. In this subsection, we assume that all norms are Euclidean. Suppose that there exist positive $\sigma$ and L such that the conditions

$$
\begin{array}{rlr} &{} &{\langle \nabla^{2} \varphi(x) h, h \rangle \ge \sigma \| h \|^{2},} \\ &{} & \\ &{} &{\| \nabla^{2} \varphi(x + h) - \nabla^{2} \varphi(x) \| \le L \| h \|,} \end{array}\tag{4.4.36}
$$

are satisfied for any x and h from $\mathbb{E}_{1}$ . Let $D = \| x_{0} - x^{*} \|$ . Then in Sect. 4.1.5, we have shown that the complexity of problem (4.4.35) for the Cubic Newton Method (4.1.16) depends on the characteristic

$$
\begin{array}{r}{\zeta = \frac{LD}{\sigma}} \end{array}
$$

(we use the notation of this section). If $\zeta ~ < ~ 1$ , then problem (4.4.35) is easy. In the opposite case, the number of iterations of the modified Newton scheme which is necessary to come to the region of quadratic convergence is essentially bounded by

$$
N_{1} = 6.25{\sqrt{\zeta}},\tag{4.4.37}
$$

(see (4.1.57)).

Note that problem (4.4.35) can be posed in the form (4.4.4):

$$
\mathrm{Find} x : F(x) \{\stackrel{\mathrm{def}}{=}} \ \nabla \varphi(x) = 0.\tag{4.4.38}
$$

In this case, $F^{\prime}(x) \ = \ \nabla^{2} \varphi(x)$ . Therefore, in view of conditions (4.4.36), our problem (4.4.38) satisfies Assumptions 4.4.1, 4.4.2 and 4.4.3. Let us choose $f(x) =$ $\| F(x) \|$ . Then, in view of (4.4.34), the number of iterations of the modified Gauss– Newton scheme (4.4.17) required to come to the region of quadratic convergence is

bounded by

$$
N_{2} = 1 + 6 \zeta^{2}.\tag{4.4.39}
$$

Clearly, the estimate (4.4.37) is much better than (4.4.39). However, this observation just confirms a standard rule that the specialized procedures are usually more efficient than a general purpose scheme. However, at this moment we cannot come to a definitive answer since the lower complexity bounds for the problem class described by Assumptions 4.4.1, 4.4.2 and 4.4.3 are not known. $\mathrm{So}.$ , there is a chance that the complexity (4.4.39) can be improved by other methods.

In fact, as compared with the Cubic Newton Method (4.1.16), the scheme (4.4.17) has one important advantage. The auxiliary problem for computing the new test point at each iteration of method (4.1.16) is solvable in polynomial time only if this method is based on the Euclidean norm. On the contrary, in the modified Gauss– Newton scheme we are absolutely free in the choice of norms in the spaces $\mathbb{E}_{1}$ and $\mathbb{E}_{2}$ . As we will see in Sect. 4.4.4.2, any choice results in a convex auxiliary problem. Therefore, it is possible to choose the norms in a reasonable way, which makes the ratio $\begin{array}{l}{\displaystyle{\frac{L}{\sigma}}} \end{array}$ as small as possible.

## 4.4.4.2 Implementation Issues

Let us study the complexity of auxiliary problem (4.4.11). For simplicity, let us assume that we choose $f(x) = \| F(x) \|$ . So, our problem is as follows:

$$
\mathrm{Find ~} f_{M}(x) = \operatorname{min}_{h \in \mathbb{E}_{1}} \left[\left\| F(x) + F^{\prime}(x) h \right\| + \frac{1}{2} M \left\| h \right\|^{2} \right].\tag{4.4.40}
$$

Note that sometimes this problem looks easier in its dual form:

$$
\begin{array}{rl} &{\underset{h \in \mathbb{E}_{h}}{\operatorname{min}} \left[\| F(x) + F^{\prime}(x) h \| + \frac{1}{2} M \| h \|^{2} \right]} \\ &{= \underset{h \in \mathbb{E}_{h}}{\operatorname{min}} \underset{| x \in \mathbb{Z}_{h}}{\operatorname{max}} \left[\langle s, F(x) + F^{\prime}(x) h \rangle + \frac{1}{2} M \| h \|^{2} \right]} \\ &{= \underset{| x \in \mathbb{Z}_{h}}{\operatorname{max}} \underset{h \in \mathbb{Z}_{h}}{\operatorname{min}} \left[\langle s, F(x) + F^{\prime}(x) h \rangle + \frac{1}{2} M \| h \|^{2} \right]} \\ &{= \underset{| x \in \mathbb{Z}_{h}}{\operatorname{max}} \left[\langle s, F(x) \rangle - \frac{1}{2M} \| F^{\prime}(x)^{*} s \|_{\infty}^{2} : \| s \| \leq 1 \right].} \end{array}
$$

Since this problem is convex, it can be solved by the efficient optimization schemes of Convex Optimization.

Let us show that for Euclidean norms, problem (4.4.40) can be solved by the standard Linear Algebra technique.

Lemma 4.4.8 Let us introduce in $\mathbb{E}_{1}$ and $\mathbb{E}_{2}$ the Euclidean norms:

$$
\| x \| = \langle B_{1} x, x \rangle^{1 / 2}, \x \in \mathbb{E}_{1}, \quad \| u \| = \langle B_{2} u, u \rangle^{1 / 2}, \u \in \mathbb{E}_{2},
$$

where $B_{1} = B_{1}^{*} \succeq 0$ , and $B_{2} = B_{2}^{*} \succeq 0$ . Then the solution of the problem (4.4.40) can be found by the following univariate convex optimization problem:

$$
\begin{array}{r}{f_{M}(x) = \underset{\tau \geq 0}{\operatorname{min}} \Big[\tau + \frac{1}{\tau} \| F(x) \|^{2} - \langle[\tau F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + \tau^{2} MB_{1}]^{- 1} g, g \rangle \Big],} \end{array}\tag{4.4.41}
$$

where $g = F^{\prime}(x)^{*} B_{2} F(x).{\ :} If \tau^{*}$ is an optimal solution to this problem, then the solution $to \(4.4.40)$ is given by

$$
h^{*} = - \left[F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + \tau^{*} MB_{1} \right]^{- 1} F^{\prime}(x)^{*} B_{2} F(x).\tag{4.4.42}
$$

Proof Indeed

$$
\begin{array}{rlr}{{f_{M}(x) = \operatorname{min}_{h \in \mathbb{E}_{1}} \operatorname{min}_{\tau \geq 0}[\frac{1}{2}{\tau} + \frac{1}{2 \tau} \| F(x) + F^{\prime}(x) h \|^{2} + \frac{M}{2} \| h \|^{2}]}} \\ &{} & \\ &{} &{= \operatorname{min}_{\tau \geq 0} \operatorname{min}_{h \in \mathbb{E}_{1}}[\frac{1}{2}{\tau} + \frac{1}{2 \tau} \| F(x) + F^{\prime}(x) h \|^{2} + \frac{M}{2} \| h \|^{2}]} \\ &{} & \\ &{} &{= \operatorname{min}_{\tau \geq 0} \operatorname{min}_{h \in \mathbb{E}_{1}}[\frac{1}{2}{\tau} + \frac{1}{2 \tau} \| F(x) \|^{2} + \frac{1}{\tau} \langle B_{2} F(x), F^{\prime}(x) h \rangle} \\ &{} & \\ &{} &{+ \frac{1}{2 \tau} \langle B_{2} F^{\prime}(x) h, F^{\prime}(x) h \rangle + \frac{M}{2} \langle B_{1} h, h \rangle].} \end{array}
$$

The minimum of the internal minimization problem is achieved at

$$
\begin{array}{rlr} &{} &{h^{*}(\tau) = - \left[\frac{1}{\tau} F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + MB_{1} \right]^{- 1} \frac{1}{\tau} F^{\prime}(x)^{*} B_{2} F(x)} \\ &{} & \\ &{} &{= - \left[F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + \tau MB_{1} \right]^{- 1} F^{\prime}(x)^{*} B_{2} F(x).} \end{array}
$$

With the notation $g = F^{\prime}(x)^{*} B_{2} F(x)$ , the objective function of the optimization problem in τ is as follows:

$$
\begin{array}{r}{\frac{1}{2} \tau + \frac{1}{2 \tau} \| F(x) \|^{2} - \frac{1}{2 \tau^{2}} \langle \left[\frac{1}{\tau} F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + MB_{1} \right]^{- 1} g, g \rangle} \\{= \frac{1}{2} \tau + \frac{1}{2 \tau} \| F(x) \|^{2} - \frac{1}{2} \langle \left[\tau F^{\prime}(x)^{*} B_{2} F^{\prime}(x) + \tau^{2} MB_{1} \right]^{- 1} g, g \rangle.} \end{array}
$$

In view of Theorem 3.1.7, this function is convex in τ .

Note that the univariate optimization problem in (4.4.41) can be solved efficiently by one-dimensional search procedures (see, for example, Sect. A.1).

Part II Structural Optimization


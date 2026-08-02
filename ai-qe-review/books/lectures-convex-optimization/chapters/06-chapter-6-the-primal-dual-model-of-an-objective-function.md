---
title: "Chapter 6 \u2014 The Primal-Dual Model of an Objective Function"
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 6
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 17887
source_line_end: 20495
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
  source_control_characters: 8
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 6 — The Primal-Dual Model of an Objective Function

> [[../README|本书目录]] · [[05-chapter-5-polynomial-time-interior-point-methods|上一章]] · [[07-chapter-7-optimization-in-relative-scale|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 17887–20495。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 8。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 6 The Primal-Dual Model of an Objective Function

In the previous chapters, we have proved that in the Black-Box framework the non-smooth optimization problems are much more difficult than the smooth ones. However, very often we know the explicit structure of the functional components. In this chapter we show how this knowledge can be used to accelerate the minimization methods and to extract a useful information about the dual counterpart of the problem. The main acceleration idea is based on the approximation of a nondifferentiable function by a differentiable one. We develop a technique for creating computable smoothed versions of non-differentiable functions and minimize them by Fast Gradient Methods. The number of iterations of the resulting methods is proportional to the square root of the number of iterations of the standard subgradient scheme. At the same time, the complexity of each iteration does not change. This technique can be used either in the primal form, or in the symmetric primal-dual form. We include in this chapter an example of application of this approach to the problem of Semidefinite Optimization. The chapter is concluded by analysis of performance of the Conditional Gradient method, which is based only on solving at each iteration an auxiliary problem of minimization of a linear function. We show that this method can also reconstruct the primal-dual solution of the problem. A similar idea is used in the second-order Trust Region Method with contraction, the first method of this type with provable global worst-case performance guarantees.

## 6.1 Smoothing for an Explicit Model of an Objective Function

(The minimax model of non-differentiable objective functions; The Fast Gradient Method for arbitrary norms and composite objective function; Application examples: minimax strategies for matrix games, the continuous location problem, variational inequalities with linear operator, minimization of piece-wise linear functions; Implementation issues.)

## 6.1.1 Smooth Approximations of Non-differentiable Functions

As we have seen in Chap. 3, subgradient methods solve the problem of Nonsmooth Convex Optimization in

$$
\begin{array}{rlr}{\mathrm{~}} &{{}} &{O \left(\frac{1}{\epsilon^{2}} \right)} \end{array}\tag{6.1.1}
$$

calls of the oracle, where $\epsilon$ is the desired absolute accuracy of finding the approximate solution in the function value. Moreover, we have already seen that the efficiency bound of the simplest Subgradient Method cannot be improved uniformly in the dimension of the space of variables (see Sect. 3.2). Of course, this statement is valid only for a Black-Box model of the objective function. However, the proof is constructive: it can be shown that the simplest problems like

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \left\{\gamma \operatorname{max}_{1 \leq i \leq k} x^{(i)} + \frac{\mu}{2} \| x \|^{2} \right\}, \quad 1 \leq k \leq n,
$$

where the norm is standard Euclidean, are difficult for all numerical schemes. The extremal simplicity of these functions possibly explains a common pessimistic belief that the actual worst-case complexity bound for finding an $\epsilon$-approximation of the minimal value of a piece-wise linear function by gradient schemes is indeed given by (6.1.1).

In fact, this is not absolutely true. In practice, we almost never meet a pure Black-Box model. We always know something about the structure of the underlying objects (we have already discussed this in Sect. 5.1.1), and the proper use of this structure can and does help in constructing more efficient schemes.

In this section, we discuss one such possibility based on constructing a smooth approximation of a nonsmooth function. Let us look at the following situation. Consider a function $f$ which is convex on <sup>E</sup>. Assume that $f$ satisfies the following growth condition:

$$
f(x) \leq f(0) + L \| x \|, \quad \forall x \in \mathbb{R}^{n},\tag{6.1.2}
$$

where the Euclidean norm $\| x \| = \langle Bx, x \rangle^{1 / 2}$ is defined by a self-adjoint positive definite linear operator $B : \mathbb{E} \mathbb{E}^{*}$ . Define the Fenchel conjugate of the function f as follows:

$$
f_{*}(s) = \operatorname{sup}_{x \in \mathbb{E}}[\langle s, x \rangle - f(x)], \quad s \in \mathbb{E}^{*}.\tag{6.1.3}
$$

Clearly, this function is closed and convex in view of Theorem 3.1.8. Its domain is not empty since by Theorem 3.1.20

$$
\operatorname{dom} f_{*} \supseteq \partial f(x), \quad \forall x \in \mathbb{E}.
$$

At the same time, dom $f_{*}$ is bounded:

$$
\| s \| \overset{(6.1.2)}{\leq} L \quad \forall s \in \operatorname{dom} f_{*}.\tag{6.1.4}
$$

Note that for all $x \in \mathbb{E}$ and $g \in \partial f(x)$ , we have

$$
f(x) + f_{*}(g) = \langle g, x \rangle.\tag{6.1.5}
$$

Hence, for any $s \in$ dom $f_{*}$ this implies that

$$
f_{*}(s) \stackrel{(6.1.3)}{\geq} \langle s, x \rangle - f(x) \stackrel{(6.1.5)}{=} f_{*}(g) + \langle s - g, x \rangle.
$$

In other words, if $g \in \partial f(x)$ , then $x \in \partial f_{*}(g)$

Let us prove the following relation (compare with general Theorem 3.1.16).

Lemma 6.1.1 For all $x \in \mathbb{R}^{n}$ , we have

$$
f(x) = \operatorname{max}_{s \in \dim f_{*}}[\langle s, x \rangle - f_{*}(s)].
$$

Proof Indeed, for any $s \in$ dom $f_{*}$ , we have $\langle s, x \rangle - f_{*}(s) \stackrel{(6.1.3)}{\leq} f(x)$ , and, in view of (6.1.5), equality is achieved for $s \in \partial f(x)$ . □

Let us now look at the following smooth approximation of function $f \colon$

$$
\begin{array}{r}{f_{\mu}(x) = \underset{s \in \mathrm{dom}}{\operatorname{max}} \left.\left.s, x \right.- f_{*}(s) - \frac{1}{2} \mu(\| s \|^{*})^{2} \right.,} \end{array}\tag{6.1.6}
$$

where $\mu \geq 0$ is a smoothing parameter and the dual norm is defined as $\| s \|^{*} =$ $\langle s, B^{- 1} s \rangle^{1 / 2}$ . In view of Lemma 6.1.1, we have

$$
\begin{array}{r}{f(x) \ge f_{\mu}(x) \overset{^{(6.1.4)}}{\ge} f(x) - \frac{1}{2} \mu L^{2}, \quad \forall x \in \mathbb{E}.} \end{array}\tag{6.1.7}
$$

On the other hand, it appears that the function $f_{\mu}$ has a Lipschitz continuous gradient.

Lemma 6.1.2 The function $f_{\mu}$ is differentiable on $\mathbb{E},$ and for any points $x_{1}$ and $x_{2} \in \mathbb{E}$ we have

$$
\begin{array}{r}{\| \nabla f_{\mu}(x_{1}) - \nabla f_{\mu}(x_{2}) \|^{*} \leq \frac{1}{\mu} \| x_{1} - x_{2} \|.} \end{array}\tag{6.1.8}
$$

Proof Consider two points $x_{1}$ and $x_{2}$ from $\mathbb{E}.$ . Let $s_{i}^{*}, i \ = \1, 2$ be the optimal solutions of the corresponding optimization problems in (6.1.6). They are uniquely defined since the objective function in definition (6.1.6) is strongly concave.

Note that by Theorem 3.1.14, $s_{i}^{*} \in \partial f_{\mu}(x_{i}), i = 1, 2$ . On the other hand, by the first-order optimality condition of Theorem 3.1.20, there exist vectors $\tilde{x}_{i} \in \partial f_{*}(s_{i}^{*})$ such that

$$
\langle s - s_{i}^{*}, x_{i} - \tilde{x}_{i} - \mu B^{- 1} s_{i}^{*} \rangle \leq 0, \quad \forall s \in \mathrm{dom} f_{*}, \quad i = 1, 2.
$$

Taking in this inequality $s = s_{3 - i}^{*}$ and adding two copies of it with $i = 1, 2$ , we get

$$
\begin{array}{rl} &{\mu(\| s_{1}^{*} - s_{2}^{*} \|^{*})^{2} \leq \langle s_{1}^{*} - s_{2}^{*}, x_{1} - \tilde{x}_{1} -(x_{2} - \tilde{x}_{2}) \rangle \overset{(3.1.24)}{\leq} \langle s_{1}^{*} - s_{2}^{*}, x_{1} - x_{2} \rangle} \\ &{} \\ &{\qquad \leq \| s_{1}^{*} - s_{2}^{*} \|^{*} \cdot \| x_{1} - x_{2} \|.} \end{array}
$$

Thus, $\begin{array}{r}{\| s_{1}^{*} - s_{2}^{*} \|^{*} \leq \frac{1}{\mu} \| x_{1} - x_{2} \|} \end{array}$ . Now, applying Lemma 3.1.10, we get $\nabla f_{\mu}(x_{i}) =$ $s_{i}^{*}, i = 1, 2.\quad \sqcup$

Of course the smooth approximation (6.1.6) of the function f is not very practical since its internal minimization problem includes a potentially complicated function $f_{*}$ . However, it already gives us some hints. Indeed, if we choose $\mu \approx \epsilon$ , then the Lipschitz constant $L_{\mu}$ for the gradient of $f_{\mu}$ will be $O(\textstyle{\frac{1}{\epsilon}})$ . Therefore, Fast Gradient Methods (e.g. (2.2.20)) can find an $\epsilon$-approximation of function $f$ (this is $f_{\mu})$ in $\begin{array}{r}{O \left(\sqrt{\frac{L_{\mu}}{\epsilon}} \right) \approx O(\frac{1}{\epsilon})} \end{array}$ calls of an oracle.

It remains to find a systematic and computationally inexpensive way of approximating the initial non-smooth objective function by a function with a Lipschitz continuous gradient. This can be done by exploiting a special max-representation of the objective function, which we introduce in Sect. 6.1.2.

For our goals, it is convenient to use the following notation. We often work with two finite-dimensional real vector spaces $\mathbb{E}_{1}$ and $\mathbb{E}_{2}$ . In these spaces, we use the corresponding scalar products and general norms

$$
\begin{array}{r}{\langle s, x \rangle_{E_{i}}, \quad \| x \|_{\mathbb{E}_{i}}, \quad \| s \|_{\mathbb{E}_{i}}^{*}, \quad x \in \mathbb{E}_{i}, \quad s \in \mathbb{E}_{i}^{*}, \quad i = 1, 2,} \end{array}
$$

which are not necessarily Euclidean. A norm of a linear operator $A : \mathbb{E}_{1} \mathbb{E}_{2}^{*}$ is defined in the standard way:

$$
\| A \|_{1, 2} = \operatorname{max}_{x, u} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} : \| x \|_{\mathbb{E}_{1}} = 1, \| u \|_{\mathbb{E}_{2}} = 1\}.
$$

Clearly,

$$
\begin{array}{r}{\| A \|_{1, 2} = \| A^{*} \|_{2, 1} = \underset{x}{\operatorname{max}} \{\| Ax \|_{\mathbb{E}_{2}}^{*} : \| x \|_{\mathbb{E}_{1}} = 1\}} \\{= \underset{u}{\operatorname{max}} \{\| A^{*} u \|_{\mathbb{E}_{1}}^{*} : \| u \|_{\mathbb{E}_{2}} = 1\}.} \end{array}
$$

Hence, for any $x \in \mathbb{E}_{1}$ and $u \in \mathbb{E}_{2}$ we have

$$
\left\| Ax \right\|_{\mathbb{E}_{2}}^{*} \leq \left\| A \right\|_{1, 2} \cdot \left\| x \right\|_{\mathbb{E}_{1}}, \quad \left\| A^{*} u \right\|_{\mathbb{E}_{1}}^{*} \leq \left\| A \right\|_{1, 2} \cdot \left\| u \right\|_{\mathbb{E}_{2}}.\tag{6.1.9}
$$

## 6.1.2 The Minimax Model of an Objective Function

In this section, our main problem of interest is as follows:

$$
{\mathrm{Find ~}} f^{*} = \operatorname{min}_{x} \{f(x) :{x} \in Q_{1}\},\tag{6.1.10}
$$

where $Q_{1}$ is a bounded closed convex set in a finite-dimensional real vector space $E_{1}$ , and $f(\cdot)$ is a continuous convex function on $Q_{1}$ . We do not assume $f$ to be differentiable.

Quite often, the structure of the objective function in (6.1.10) is given explicitly. Let us assume that this structure can be described by the following model:

$$
f(x) ={\hat{f}}(x) + \operatorname{max}_{u} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} -{\hat{\phi}}(u) : u \in Q_{2}\},\tag{6.1.11}
$$

where the function ${\hat{f}}(\cdot)$ is continuous and convex on $Q_{1}, Q_{2}$ is a bounded closed convex set in a finite-dimensional real vector space $E_{2}, \ \hat{\phi}(\cdot)$ is a continuous convex function on $Q_{2}$ , and the linear operator A maps $E_{1}$ to $E_{2}^{*}$ . In this case, problem (6.1.10) can be written in an adjoint form. Indeed,

$$
\begin{array}{rlr}{f^{*}} &{=} &{\underset{x \in Q_{1}}{\operatorname{min}} \underset{u \in Q_{2}}{\operatorname{max}} \{\hat{f}(x) + \langle Ax, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u)\}} \\ &{} & \\ &{\overset{(1.3.6)}{\geq} \underset{u \in Q_{2}}{\operatorname{max}} \underset{x \in Q_{1}}{\operatorname{min}} \{\hat{f}(x) + \langle Ax, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u)\}.} \end{array}
$$

Thus, the adjoint problem can be stated as follows:

$$
\begin{array}{rl} &{f_{*} = \underset{u \in Q_{2}}{\operatorname{max}} \phi(u),} \\ &{} \\ &{\phi(u) = - \hat{\phi}(u) + \underset{x \in Q_{1}}{\operatorname{min}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} + \hat{f}(x)\}.} \end{array}\tag{6.1.12}
$$

However, the complexity of this problem is not completely identical to that of (6.1.10). Indeed, in the primal problem (6.1.10), we implicitly assume that the function $\hat{\phi}(\cdot)$ and set $Q_{2}$ are so simple that the solution of the optimization problem in (6.1.11) can be found in a closed form. This assumption may be not valid for the objects defining the function $\phi(\cdot)$

Note that usually, for a convex function $f_{:}$ , representation (6.1.11) is not uniquely defined. If we decide to use, for example, the Fenchel dual of $f,$

$$
\hat{\phi}(u) \equiv f_{*}(u) = \operatorname{max}_{x} \{\langle u, x \rangle_{\mathbb{E}_{1}} - f(x) : x \in \mathbb{E}_{1}\}, \quad Q_{2} \equiv \mathbb{E}_{2} = \mathbb{E}_{1}^{*},
$$

then we can take ${\hat{f}}(x) \equiv 0$ , and A is equal to $I_{n}$ , the identity operator. However, in this case the function $\hat{\phi}(\cdot)$ may be too complicated for our goals. Intuitively, it is clear that the bigger the dimension of the space $\mathbb{E}_{2}$ is, the simpler is the structure of the adjoint object defined by the function ${\hat{\phi}}(\cdot)$ and the set $Q_{2}$ . Let us demonstrate this with an example.

Example 6.1.1 Consider $f(x) = \operatorname{max}_{1 \leq j \leq m} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} |$ . Let us choose $A = ~ I_{n}$ $\mathbb{E}_{2} = \mathbb{E}_{1}^{*} = \mathbb{R}^{n}$ , and

$$
\begin{array}{l}{\displaystyle \hat{\phi}(u) = f_{*}(u) = \operatorname{max}_{x} \left\{\langle u, x \rangle_{\mathbb{E}_{1}} - \underset{1 \leq j \leq m}{\operatorname{max}} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} | \right\}} \\{\displaystyle \qquad = \operatorname{max}_{x} \underset{s \in \mathbb{R}^{m}}{\operatorname{min}} \left\{\langle u, x \rangle_{\mathbb{E}_{1}} - \sum_{j = 1}^{m} s^{(j)}[\langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)}] : \sum_{j = 1}^{m} | s^{(j)} | \leq 1 \right\}} \\{\displaystyle \qquad = \underset{s \in \mathbb{R}^{m}}{\operatorname{min}} \left\{\langle b, s \rangle_{\mathbb{E}_{2}} : As = u, \ \underset{j = 1}{\overset{m}{\sum}} | s^{(j)} | \leq 1 \right\}.} \end{array}
$$

It is clear that the structure of such a function can be very complicated.

Let us look at another possibility. Note that

$$
\begin{array}{rl} &{f(x) = \underset{1 \leq j \leq m}{\operatorname{max}} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} |} \\ &{= \underset{u \in \mathbb{R}^{m}}{\operatorname{max}} \left\{\underset{j = 1}{\overset{m}{\sum}} u^{(j)}[\langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)}] : \ \underset{j = 1}{\overset{m}{\sum}} | u^{(j)} | \leq 1 \right\}.} \end{array}
$$

In this case $\mathbb{E}_{2} = \mathbb{R}^{m}, \hat{\phi}(u) = \langle b, u \rangle_{\mathbb{E}_{2}}$ and $Q_{2} = \left\{u \in \mathbb{R}^{m} : ~ \sum_{j = 1}^{m} | u^{(j)} | \leq 1 \right\}.$

Finally, we can also represent $f(x)$ as follows:

$$
f(\boldsymbol{x}) = \operatorname{max}_{u =(u_{1}, u_{2}) \in \mathbb{R}_{+}^{2m}} \left\{\sum_{j = 1}^{m}(u_{1}^{(j)} - u_{2}^{(j)}) \cdot[\langle a_{j}, \boldsymbol{x} \rangle_{\mathbb{E}_{1}} - b^{(j)}] : \sum_{j = 1}^{m}(u_{1}^{(j)} + u_{2}^{(j)}) = 1 \right\}.
$$

In this case $\mathbb{E}_{2} = \mathbb{R}^{2m}, \hat{\phi}(u)$ is a linear function and $Q_{2}$ is a simplex. In Sect. 6.1.4.4 we will see that this representation is the easiest one.

Let us show that the knowledge of structure (6.1.11) can help in solving both problems (6.1.10) and (6.1.12). We are going to use this structure to construct a smooth approximation of the objective function in (6.1.10).

Consider a differentiable prox-function $d_{2}(\cdot)$ of the set $Q_{2}$ . This means that $d_{2}(\cdot)$ is strongly convex on $Q_{2}$ with convexity parameter one. Denote by

$$
u_{0} = \arg \operatorname{min}_{u} \{d_{2}(u) : \u \in Q_{2}\}
$$

its prox-center. Without loss of generality, we assume that $d_{2}(u_{0}) = 0$ . Thus, for any $u \in Q_{2}$ we have

$$
d_{2}(u) \overset{(2.2.40)}{\geq} \frac{1}{2} \Vert u - u_{0} \Vert_{\mathbb{E}_{2}}^{2}.\tag{6.1.13}
$$

Let $\mu$ be a positive smoothing parameter. Consider the following function:

$$
f_{\mu}(x) = \operatorname{max}_{u} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u) - \mu d_{2}(u) : \u \in Q_{2}\}.\tag{6.1.14}
$$

Denote by $u_{\mu}(x)$ the optimal solution of the above problem. Since the function $d_{2}(\cdot)$ is strongly convex, this solution is unique.

Theorem 6.1.1 The function $f_{\mu}$ is well defined and continuously differentiable at any $x \in \mathbb{E}_{1}$ . Moreover, this function is convex and its gradient

$$
\nabla f_{\mu}(x) = A^{*} u_{\mu}(x)\tag{6.1.15}
$$

is Lipschitz continuous with constant

$$
\begin{array}{r}{L_{\mu} = \frac{1}{\mu} \| A \|_{1, 2}^{2}.} \end{array}
$$

Proof Indeed the function $f_{\mu}(\cdot)$ is convex as a maximum of functions which are linear in $x,$ , and $A^{*} u_{\mu}(x) \ \in \ \partial f_{\mu}(x)$ (see Lemma 3.1.14). Let us prove now the existence and Lipschitz continuity of its gradient.

Consider two points $x_{1}$ and $x_{2}$ from $\mathbb{E}_{1}$ . From the first-order optimality conditions (3.1.56), we have

$$
\langle Ax_{i} - g_{i} - \mu \nabla d_{2}(u_{\mu}(x_{i})), u_{\mu}(x_{3 - i}) - u_{\mu}(x_{i}) \rangle_{\mathbb{E}_{2}} \leq 0
$$

for some $g_{i} \in \partial \hat{\phi}(u_{\mu}(x_{i})), i = 1$ , 2. Adding these inequalities, we get

$$
\mu \| u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \|_{\mathbb{E}_{2}}^{2} \stackrel{(2.1.22)}{\leq} \mu \langle \nabla d_{2}(u_{\mu}(x_{1})) - \nabla d_{2}(u_{\mu}(x_{2})), u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \rangle_{\mathbb{E}_{2}}
$$

$$
\begin{array}{rl}{\leq{}} &{{} \langle A(x_{1} - x_{2}) -(g_{1} - g_{2}), u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \rangle_{\mathbb{E}_{2}}} \end{array}
$$

$$
\stackrel{(3.1.24)}{\leq} \langle A(x_{1} - x_{2}), u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \rangle_{{\mathbb E}_{2}}
$$

$$
\begin{array}{rl}{\leq{}} &{{} \| A \|_{1, 2} \cdot \| x_{1} - x_{2} \|_{\mathbb{E}_{1}} \cdot \| u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \|_{\mathbb{E}_{2}}.} \end{array}
$$

Thus, in view of (6.1.9), we have

$$
\begin{array}{rl} &{\| A^{*} u_{\mu}(x_{1}) - A^{*} u_{\mu}(x_{2})) \|_{\mathbb{E}_{1}}^{*} \leq \| A \|_{1, 2} \cdot \| u_{\mu}(x_{1}) - u_{\mu}(x_{2}) \|_{\mathbb{E}_{2}}^{2}} \\ &{\qquad \leq \frac{1}{\mu} \| A \|_{1, 2}^{2} \cdot \| x_{1} - x_{2} \|_{\mathbb{E}_{1}}.} \end{array}
$$

It remains to use Lemma 3.1.10.

Let $D_{2} = \operatorname{max}_{u \in Q_{2}} d_{2}(u){\mathrm{~ and ~}} f_{0}(x) = \operatorname{max}_{u \in Q_{2}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u)\}$ . Then, for any $x \in \mathbb{E}_{1}$ we have

$$
f_{0}(x) \stackrel{(6.1.14)}{\geq} f_{\mu}(x) \stackrel{(6.1.14)}{\geq} f_{0}(x) - \mu D_{2}.\tag{6.1.16}
$$

Thus, for $\mu > 0$ the function $f_{\mu}$ can be seen as a uniform μ-approximation of the objective function $f_{0}$ with Lipschitz constant for the gradient of the order $O(\textstyle{\frac{1}{\mu}})$

## 6.1.3 The Fast Gradient Method for Composite Minimization

Let $f(\cdot)$ be a convex differentiable function defined on a closed convex set $Q \subseteq E$ Assume that the gradient of this function is Lipschitz continuous:

$$
\| \nabla f(x) - \nabla f(y) \|^{*} \leq L \| x - y \|, \quad \forall x, y \in Q.
$$

Denote by $d(\cdot)$ a differentiable prox-function of the set $Q$ . Assume that $d(\cdot)$ is strongly convex on $Q$ with convexity parameter one. Let $x_{0}$ be the d-center of Q:

$$
x_{0} = \arg \operatorname{min}_{x \in Q} d(x).
$$

Without loss of generality, assume that $d(x_{0}) = 0$ . Thus, for any $x \in Q$ we have

$$
d(x) \stackrel{(2.2.40)}{\geq} \frac{1}{2} \| x - x_{0} \|^{2}.\tag{6.1.17}
$$

In this section, we present a fast gradient method for solving the following composite optimization problem:

$$
\operatorname{min}_{x} \left\{\tilde{f}(x) \stackrel{\mathrm{def}}{=} f(x) + \psi(x) : x \in Q \right\},\tag{6.1.18}
$$

where $\psi(\cdot)$ is an arbitrary simple closed convex function defined on $Q.$ Our main assumption is that the auxiliary minimization problem of the form

$$
\operatorname{min}_{x \in Q} \{\langle s, x \rangle + \alpha d(x) + \beta \psi(x)\}, \quad \alpha, \beta \geq 0,
$$

is easily solvable. For simplicity, we assume that the constant $L > 0$ is known.

```latex
Method of Similar Triangles
0. Choose $x_{0} \in \mathcal{Q}.\mathrm{Set} v_{0} = x_{0} \mathrm{and} \phi_{0}(x) = Ld(x).$
1. kth iteration $(k \geq 0)$
(a) Define $\begin{array}{r}{y_{k} = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k}.} \end{array}$
(b) Set $\begin{array}{r}{\phi_{k + 1}(x) = \phi_{k}(x) + \frac{k + 1}{2}[f(y_{k}) + \langle \nabla f(y_{k}), x - y_{k} \rangle + \varPsi(x)].} \end{array}$
(c) Compute $v_{k + 1} = \operatorname{min}_{x \in Q} \phi_{k + 1}(x).$
(d) Define $\begin{array}{r}{x_{k + 1} = \frac{k}{k + 2} x_{k} + \frac{2}{k + 2} v_{k + 1}.} \end{array}$
```

(6.1.19)

In this scheme, we generate two sequences of feasible points $\{x_{k}\}_{k = 0}^{\infty}$ and $\{y_{k}\}_{k = 0}^{\infty},$ and a sequence of estimating functions $\{\phi_{k}(x)\}_{k = 0}^{\infty}.$ . At each iteration of this method, all “events” happen in the two-dimensional plane defined by the triangle

$$
\{x_{k}, v_{k}, v_{k + 1}\}.
$$

Note that this triangle is similar to the resulting triangle $\{x_{k}, y_{k}, x_{k + 1}\}$ , defining the new point of the sequence $\{x_{k}\}_{k = 0}^{\infty}.$ , for which we are able to establish the rate of convergence.

Theorem 6.1.2 Let the sequences $\{x_{k}\}_{k = 0}^{\infty}, \{y_{k}\}_{k = 0}^{\infty},$ , and $\{v_{k}\}_{k = 0}^{\infty}$ be generated by method (6.1.19). Then, for any $k \geq 0$ and $x \in Q$ we have

$$
\begin{array}{r}{\frac{k(k + 1)}{4} \widetilde{f}(x_{k}) + \frac{L}{2} \| v_{k} - x \|^{2}} \end{array}
$$

$$
\leq \phi_{k}(x) = Ld(x) + \sum_{i = 0}^{k - 1}{\textstyle \frac{i + 1}{2}}[f(y_{i}) + \langle \nabla f(y_{i}), x - y_{i} \rangle] +{\textstyle \frac{k(k + 1)}{4}} \psi(x).\tag{6.1.20}
$$

Therefore, for any $k \geq 1$ , we get

$$
\begin{array}{r}{\tilde{f}(x_{k}) - \tilde{f}(x^{*}) + \frac{2L}{k(k + 1)} \| v_{k} - x^{*} \|^{2} \leq \frac{4Ld(x^{*})}{k(k + 1)},} \end{array}\tag{6.1.21}
$$

where $x^{*}$ is an optimal solution to problem (6.1.18).

Proof For $k \geq 0$ , let

$$
\begin{array}{lll}{\displaystyle{a_{k} = \frac{k}{2},}} &{\displaystyle{A_{k} = \sum_{i = 0}^{k} a_{i} = \frac{k(k + 1)}{4},}} &{\displaystyle{\tau_{k} = \frac{a_{k + 1}}{A_{k + 1}}.}} \end{array}
$$

Then the rules of method (6.1.19) can be written as follows:

$$
y_{k} =(1 - \tau_{k}) x_{k} + \tau_{k} v_{k}, \quad x_{k + 1} =(1 - \tau_{k}) x_{k} + \tau_{k} v_{k + 1}.\tag{6.1.22}
$$

Let us prove that

$$
A_{k} \tilde{f}(x_{k}) \leq \phi_{k}^{*} \stackrel{\mathrm{def}}{=} \operatorname{min}_{x \in Q} \phi_{k} = \phi_{k}(v_{k}), \quad k \geq 0.\tag{6.1.23}
$$

Since $A_{0} = 0$ , this inequality is valid for $k = 0$ . Assume that it is true for some $k \geq 0$ . Since all functions $\phi_{k}$ are strongly convex with convexity parameter L, we have

$$
\begin{array}{rl}{\vartheta_{i + 1}^{\prime}} &{= \vartheta_{i} \langle \upsilon_{i + 1} \rangle + a_{i + 1} \vert f(\vartheta_{i}) +(\nabla f(\wp_{i}), \upsilon_{i + 1} - \vartheta_{i}) + \psi(\iota_{k + 1}) \rangle} \\ &{\quad(2 \geq \vartheta)} \\ &{\quad \Phi_{i}^{2} + \frac{\lambda}{2} \eta \vert \vartheta_{i + 1} - \upsilon_{k} \vert^{2}} \\ &{\quad \quad + a_{i + 1}[f(g_{0}), \upsilon_{i + 1} - \upsilon_{k}] + \mathcal{V}(\vartheta_{i + 1})]} \\ &{\quad \quad \quad + a_{i + 1}[f(g_{0}), \upsilon_{i + 1} - \upsilon_{k}] + \mathcal{V}(\vartheta_{i + 1})]} \\ &{\quad \quad \quad \stackrel{(b, 1, 2)}{\geq} A_{i}[f(x_{0}) + \psi(x_{1})] + \frac{\ell}{2} \Vert \vartheta_{i + 1} - \upsilon_{k} \vert^{2}} \\ &{\quad \quad \quad + a_{i + 1}[f(g_{0}), \upsilon_{i + 1} - \mathcal{V} \kappa_{i + 1} - \mathcal{V} \kappa_{i}] + \mathcal{V}(\upsilon_{i + 1})]} \\ &{\quad \quad \quad - \delta_{i + 1}[f(g_{0}) + \{\nabla f(g_{0}), \upsilon_{i + 1} - \mathcal{V}\} + a_{i + 1}(\upsilon_{i + 1} - \mathcal{V} \kappa_{i})]} \\ &{\quad \quad \quad \stackrel{(b, 1, 2)}{\geq} A_{i + 1} f(\vartheta_{i}) +(\nabla f(g_{0}), A_{i}(x_{k} - \vartheta_{i}) + a_{i + 1}(\upsilon_{i + 1} - \mathcal{V} \kappa_{i}))} \\ & \quad \quad \quad + \frac \end{array}
$$

By the rules of the method, $A_{k}(x_{k} - y_{k}) + a_{k + 1}(v_{k + 1} - y_{k}) \stackrel{(6.1.22)}{=} a_{k + 1}(v_{k + 1} - v_{k})$ and $A_{k} \psi(x_{k}) + a_{k + 1} \psi(v_{k + 1}) \geq A_{k + 1} \psi(x_{k + 1})$ . Therefore,

$$
\begin{array}{rlr}{\phi_{k + 1}^{*}} &{\geq} &{A_{k + 1} f(y_{k}) + a_{k + 1} \langle \nabla f(y_{k}), v_{k + 1} - v_{k} \rangle + \frac{L}{2} \| v_{k + 1} - v_{k} \|^{2}} \\ &{} &{+ A_{k + 1} \psi(x_{k + 1})} \\ &{\overset{(6.\lfloor \underline{{\cdot}} 2^{2})}{=} A_{k + 1}[f(y_{k}) + \langle \nabla f(y_{k}), x_{k + 1} - y_{k} \rangle + \frac{LA_{k + 1}}{2a_{k + 1}^{2}} \| x_{k + 1} - y_{k} \|^{2}} \\ &{} &{+ \psi(x_{k + 1})].} \end{array}
$$

Since $\begin{array}{r}{\frac{A_{k + 1}}{a_{k + 1}^{2}} = \frac{(k + 1)(k + 2)}{4} \cdot \frac{4}{(k + 1)^{2}} > 1} \end{array}$ , we get $\phi_{k + 1}^{*} \stackrel{(2.1.9)}{\geq} A_{k + 1} f(x_{k + 1})$ . By strong convexity of the function $\phi_{k}$ , we have

$$
\begin{array}{r}{\phi_{k}(x) \stackrel{(2.2.40)}{\geq} \phi_{k}^{*} + \frac{L}{2} \| x - v_{k} \|^{2} \stackrel{(6.1.23)}{\geq} A_{k} \tilde{f}(x_{k}) + \frac{L}{2} \| x - v_{k} \|^{2},} \end{array}
$$

and this is inequality (6.1.20). Finally, inequality (6.1.21) follows from (6.1.20) in view of the convexity of the function $f$ .

Remark 6.1.1 Note that method (6.1.19) generates bounded sequences of points. Indeed, by the rules of this method we have

$$
x_{k}, y_{k} \in \operatorname{Conv} \{v_{0}, \ldots, v_{k}\}, \quad k \geq 0.
$$

On the other hand, from inequality (6.1.21), it follows that

$$
\| v_{k} - x^{*} \|^{2} \leq 2d(x^{*}).\tag{6.1.24}
$$

In the Euclidean case, $\begin{array}{r}{d(x) = \frac{1}{2} \| x - x_{0} \|^{2}} \end{array}$ , and we get

$$
\| v_{k} - x^{*} \| \leq \| x_{0} - x^{*} \|, \quad k \geq 0.\tag{6.1.25}
$$

## 6.1.4 Application Examples

Let us put the results of the previous sections together. Assume that the function ${\hat{f}}(\cdot)$ in (6.1.11) is differentiable and its gradient is Lipschitz-continuous with some constant $M ~ \geq ~ 0$ . Then the smoothing technique as applied to problem (6.1.10) provides us with the following objective function:

$$
{\bar{f}}_{\mu}(x) ={\hat{f}}(x) + f_{\mu}(x) \quad \to \quad \operatorname{min}{\mathrm{: ~}} x \in Q_{1}.\tag{6.1.26}
$$

In view of Theorem 6.1.1, the gradient of this function is Lipschitz continuous with the constant

$$
\begin{array}{r}{L_{\mu} = M + \frac{1}{\mu} \| A \|_{1, 2}^{2}.} \end{array}
$$

Let us choose some prox-function $d_{1}(\cdot)$ for the set $Q_{1}$ with convexity parameter equal to one. Recall that the set $Q_{1}$ is assumed to be bounded:

$$
\operatorname{max}_{x \in Q_{1}} d_{1}(x) \leq D_{1}.
$$

Theorem 6.1.3 Let us apply method (6.1.19) to problem (6.1.26) with the following value of the smoothness parameter:

$$
\begin{array}{r}{\mu = \mu(N) = \frac{2 \| A \|_{1, 2}}{\sqrt{N(N + 1)}} \cdot \sqrt{\frac{D_{1}}{D_{2}}}.} \end{array}
$$

Then after N iterations we can generate approximate solutions to problems (6.1.10) and (6.1.12), namely,

$$
\begin{array}{r}{\hat{x} = x_{N} \in Q_{1}, \quad \hat{u} \ = \ \displaystyle \sum_{i = 0}^{N - 1} \frac{2(i + 1)}{(N + 1)(N + 2)} u_{\mu}(y_{i}) \in Q_{2},} \end{array}\tag{6.1.27}
$$

which satisfy the following inequality:

$$
\begin{array}{r}{0 \leq f(\hat{x}) - \phi(\hat{u}) \leq \frac{4 \| A \|_{1, 2}}{\sqrt{N(N + 1)}} \cdot \sqrt{D_{1} D_{2}} + \frac{4MD_{1}}{N(N + 1)}.} \end{array}\tag{6.1.28}
$$

Thus, the complexity of finding an $\epsilon$-solution to problems (6.1.10), (6.1.12) by the smoothing technique does not exceed

$$
4 \| A \|_{1, 2} \sqrt{D_{1} D_{2}} \cdot \frac{1}{\epsilon} \ + \2 \sqrt{\frac{MD_{1}}{\epsilon}}\tag{6.1.29}
$$

iterations of method (6.1.19).

Proof Let us fix an arbitrary $\mu > 0$ . In view of Theorem 6.1.2, after N iterations of method (2.2.63) we can deliver a point $\hat{x} = x_{N}$ such that

$$
\begin{array}{r}{\bar{f}_{\mu}(\hat{x}) \leq \frac{4L_{\mu} D_{1}}{N(N + 1)} + \displaystyle \operatorname{min}_{x \in \mathcal{Q}_{1}} \sum_{i = 0}^{N - 1} \frac{2(i + 1)}{N(N + 1)}[\bar{f}_{\mu}(y_{i}) + \langle \nabla \bar{f}_{\mu}(x_{i}), x - y_{i} \rangle_{\mathbb{E}_{1}}].} \end{array}\tag{6.1.30}
$$

Note that

$$
\begin{array}{rlr} &{} &{f_{\mu}(y) = \underset{u}{\operatorname{max}} \{\langle Ay, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u) - \mu d_{2}(u) : \u \in Q_{2}\}} \\ &{} & \\ &{} &{\quad = \langle Ay, u_{\mu}(y) \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u_{\mu}(y)) - \mu d_{2}(u_{\mu}(y)),} \end{array}
$$

$$
\langle \nabla f_{\mu}(y), y \rangle_{\mathbb{E}_{1}} = \langle A^{*} u_{\mu}(y), y \rangle_{\mathbb{E}_{1}}.
$$

Therefore, for $i = 0, \ldots, N - 1$ we have

$$
f_{\mu}(y_{i}) - \langle \nabla f_{\mu}(y_{i}), y_{i} \rangle_{\mathbb{E}_{1}} \ = \ - \hat{\phi}(u_{\mu}(y_{i})) - \mu d_{2}(u_{\mu}(y_{i})).\tag{6.1.31}
$$

Thus, in view of (6.1.15) and (6.1.31) we obtain

$$
\begin{array}{rl} &{\displaystyle \sum_{i = 0}^{N - 1}(i + 1)[\hat{f}_{\mu}(y_{i}) + \langle \nabla \bar{f}_{\mu}(y_{i}), x - y_{i} \rangle_{\mathbb{E}_{1}}]} \\ &{\displaystyle} \\ &{\mathrm{~} i = 0} \\ &{\displaystyle \sum_{i = 0}^{(2.1.2)} \sum_{i = 0}^{N - 1}(i + 1)[f_{\mu}(y_{i}) - \langle \nabla f_{\mu}(y_{i}), y_{i} \rangle_{\mathbb{E}_{1}}] + \frac{1}{2} N(N + 1)(\hat{f}(x) + \langle A^{*} \hat{u}, x \rangle_{\mathbb{E}_{1}})} \\ &{\displaystyle} \\ &{\displaystyle \leq \ - \sum_{i = 0}^{N - 1}(i + 1) \hat{\phi}(u_{\mu}(y_{i})) + \frac{1}{2} N(N + 1)(\hat{f}(x) + \langle A^{*} \hat{u}, x \rangle_{\mathbb{E}_{1}})} \\ &{\displaystyle} \\ &{\displaystyle \leq \ \frac{1}{2} N(N + 1)[- \hat{\phi}(\hat{u}) + \hat{f}(x) + \langle Ax, \hat{u} \rangle_{\mathbb{E}_{2}}].} \end{array}
$$

Hence, using (6.1.30), (6.1.12) and (6.1.16), we get the following bound:

$$
\begin{array}{r}{\frac{4L_{\mu} D_{1}}{N(N + 1)} \geq \bar{f}_{\mu}(\hat{x}) - \phi(\hat{u}) \geq f(\hat{x}) - \phi(\hat{u}) - \mu D_{2}.} \end{array}
$$

This is

$$
\begin{array}{r}{0 \leq f(\hat{x}) - \phi(\hat{u}) \leq \mu D_{2} + \frac{4 \| A \|_{1, 2}^{2} D_{1}}{\mu N(N + 1)} + \frac{4MD_{1}}{N(N + 1)}.} \end{array}\tag{6.1.32}
$$

Minimizing the right-hand side of this inequality in $\mu.$ , we get inequality (6.1.28).

Note that the efficiency estimate (6.1.29) is much better than the standard bound $\begin{array}{rlr}{\mathrm{~}} &{{}} &{O \left(\frac{1}{\epsilon^{2}} \right)} \end{array}$ . In accordance with the above theorem, for $M = 0$ the optimal dependence of the parameters $\mu, L_{\mu}$ and N in $\epsilon$ is as follows:

$$
\begin{array}{r}{\sqrt{N(N + 1)} \ge 4 \| A \|_{1, 2} \sqrt{D_{1} D_{2}} \cdot \frac{1}{\epsilon}, \quad \mu \ = \ \frac{\epsilon}{2D_{2}}, \quad L_{\mu} \ = \D_{2} \cdot \frac{\| A \|_{1, 2}^{2}}{\epsilon}.} \end{array}\tag{6.1.33}
$$

Remark 6.1.2 Inequality (6.1.28) shows that the pair of adjoint problems (6.1.10) and (6.1.12) has no duality gap:

$$
f^{*} = f_{*}.\tag{6.1.34}
$$

Let us now look at some examples.

## 6.1.4.1 Minimax Strategies for Matrix Games

Denote by $\varDelta_{n}$ the standard simplex in $\mathbb{R}^{n}$ :

$$
\Delta_{n} = \left\{x \in \mathbb{R}_{+}^{n} : \ \sum_{i = 1}^{n} x^{(i)} = 1 \right\}.
$$

Let $A : \mathbb{R}^{n} \to \mathbb{R}^{m}, \mathbb{E}_{1} = \mathbb{R}^{n}$ , and $\mathbb{E}_{2} = \mathbb{R}^{m}$ . Consider the following saddle point problem:

$$
\operatorname{min}_{x \in \varDelta_{n}} \operatorname{max}_{u \in \varDelta_{m}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} + \langle c, x \rangle_{\mathbb{E}_{1}} + \langle b, u \rangle_{\mathbb{E}_{2}}\}.\tag{6.1.35}
$$

From the viewpoint of players, this problem can be seen as a pair of non-smooth minimization problems:

$$
\operatorname{min}_{x \in \varDelta_{n}} f(x), \f(x) \ = \ \langle c, x \rangle_{\mathbb{E}_{1}} + \operatorname{max}_{1 \leq j \leq m}[\langle a_{j}, x \rangle_{\mathbb{E}_{1}} + b^{(j)}],\tag{6.1.36}
$$

$$
\operatorname{max}_{u \in \varDelta_{m}} \phi(u), \phi(u) \ = \ \langle b, u \rangle_{\mathbb{E}_{2}} + \operatorname{min}_{1 \leq i \leq n}[\langle \hat{a}_{i}, u \rangle_{\mathbb{E}_{2}} + c^{(i)}],
$$

where $a_{j}$ are the rows and $\hat{a}_{i}$ are the columns of matrix A. In order to solve this pair of problems using the smoothing approach, we need to find a reasonable proxfunction for the simplex. Let us compare two possibilities.

## 1. Euclidean Distance Let us choose

$$
\| x \|_{\mathbb{E}_{1}} = \left[\sum_{i = 1}^{n}(x^{(i)})^{2} \right]^{1 / 2}, d_{1}(x) = \textstyle{\frac{1}{2}} \sum_{i = 1}^{n}(x^{(i)} - \frac{1}{n})^{2},
$$

$$
\| u \|_{\mathbb{E}_{2}} = \left[\sum_{j = 1}^{m}(u^{(j)})^{2} \right]^{1 / 2}, \d_{2}(x) = \frac{1}{2} \sum_{j = 1}^{m}(u^{(j)} - \frac{1}{m})^{2}.
$$

Then $\begin{array}{r}{D_{1} = 1 - \frac{1}{n} < 1, D_{2} = 1 - \frac{1}{m} < 1} \end{array}$ and

$$
\| A \|_{1, 2} = \operatorname{max}_{u} \{\| Ax \|_{2}^{*} : \| x \|_{\mathbb{E}_{1}} = 1\} = \lambda_{\operatorname{max}}^{1 / 2}(A^{T} A).
$$

Thus, in our case the estimate (6.1.28) for the result (6.1.27) can be specified as follows:

$$
\begin{array}{r}{0 \leq f(\hat{x}) - \phi(\hat{u}) \leq \frac{4 \lambda_{\operatorname{max}}^{1 / 2}(A^{T} A)}{\sqrt{N(N + 1)}}.} \end{array}\tag{6.1.37}
$$

## 2. Entropy Distance Let us choose

$$
\| x \|_{\mathbb{E}_{1}} = \sum_{i = 1}^{n} | x^{(i)} |, \d_{1}(x) = \ln n + \sum_{i = 1}^{n} x^{(i)} \ln x^{(i)},
$$

$$
\| u \|_{\mathbb{E}_{2}} = \sum_{j = 1}^{m} | u^{(j)} |, d_{2}(u) = \ln m + \sum_{j = 1}^{m} u^{(j)} \ln u^{(j)}.
$$

Functions $d_{1}$ and $d_{2}$ are called the entropy functions.

Lemma 6.1.3 The above prox-functions are strongly convex in an $\ell_{1}{-} norm$ with convexity parameter one and $D_{1} = \ln n, D_{2} = \ln m$

Proof Note that the function $d_{1}$ is twice continuously differentiable in the interior of simplex $\varDelta_{n}$ , and

$$
\begin{array}{r}{\langle \nabla^{2} d_{1}(x) h, h \rangle = \displaystyle \sum_{i = 1}^{n} \frac{(h^{(i)})^{2}}{x^{(i)}}.} \end{array}
$$

Thus, in view of Theorem 2.1.11 strong convexity of $d_{1}$ is a consequence of the following variant of Cauchy–Schwarz inequality,

$$
\left(\sum_{i = 1}^{n} | h^{(i)} | \right)^{2} \leq \left(\sum_{i = 1}^{n} x^{(i)} \right) \cdot \left(\sum_{i = 1}^{n} \frac{(h^{(i)})^{2}}{x^{(i)}} \right),
$$

which is valid for all positive vectors $x \in \mathbb{R}^{n}$ . Since $d_{1}(\cdot)$ is a convex symmetric function of the arguments, its minimum is attained at the center of the simplex, the point $\textstyle x_{0} ={\frac{1}{n}}{\bar{e}}_{n}$ . Clearly, $d_{1}(x_{0}) = 0$ . On the other hand, its maximum is attained at one of the vertices of the simplex (see Corollary 3.1.2).

The reasoning for $d_{2}(\cdot)$ is similar.

Note also that now we get the following norm of the operator $A$

$$
\| A \|_{1, 2} = \operatorname{max}_{x} \{\operatorname{max}_{1 \leq j \leq m} | \langle a_{j}, x \rangle | : \| x \|_{\mathbb{E}_{1}} \leq 1\} = \operatorname{max}_{i, j} | A^{(i, j)} |
$$

(see Corollary 3.1.2). Thus, if we apply the entropy distance, the estimate (6.1.28) can be written as follows:

$$
\begin{array}{r}{0 \leq f(\hat{x}) - \phi(\hat{u}) \leq \frac{4 \sqrt{\ln n \ln m}}{\sqrt{N(N + 1)}} \cdot \underset{i, j}{\operatorname{max}} | A^{(i, j)} |.} \end{array}\tag{6.1.38}
$$

Note that typically the estimate (6.1.38) is much better than its Euclidean variant (6.1.37).

Let us write down explicitly the smooth approximation for the objective function in the first problem of (6.1.36) using the entropy distance. By definition,

$$
\bar{f}_{\mu}(x) = \langle c, x \rangle_{\mathbb{E}_{1}} + \operatorname{max}_{u \in \varDelta_{m}} \left\{\sum_{j = 1}^{m} u^{(j)}[\langle a_{j}, x \rangle + b^{(j)}] - \mu \sum_{j = 1}^{m} u^{(j)} \ln u^{(j)} - \mu \ln m \right\}.
$$

Let us apply the following result.

## Lemma 6.1.4 The solution of the problem

$$
Find \phi_{*}(s) = \operatorname{max}_{u \in \varDelta_{m}} \left\{\sum_{j = 1}^{m} u^{(j)} s^{(j)} - \mu \sum_{j = 1}^{m} u^{(j)} \ln u^{(j)} \right\}\tag{6.1.39}
$$

is given by the vector $u_{\mu}(s) \in \varDelta_{m}$ with the following entries

$$
\begin{array}{r}{u_{\mu}^{(j)}(s) = \frac{e^{s^{(j)} / \mu}}{\displaystyle \sum_{i = 1}^{m} e^{s^{(i)} / \mu}}, \quad j = 1, \ldots, m.} \end{array}\tag{6.1.40}
$$

Therefore, $\phi_{*}(s) = \mu \ln \left(\sum_{i = 1}^{m} e^{s^{(i)} / \mu} \right)$

Proof Note that the gradient of the objective function in problem (6.1.39) goes to infinity as the argument approaches the boundary of the domain. Therefore, the first order necessary and sufficient optimality conditions for this problem are as follows (see (3.1.59)):

$$
\begin{array}{r}{s^{(j)} - \mu(1 + \ln u^{(j)}) = \lambda, ~ j = 1, \dots, m,} \end{array}
$$

$$
\sum_{j = 1}^{m} u^{(j)} = 1.
$$

Clearly, they are satisfied by (6.1.40) with $\lambda = \mu \ln \left(\sum_{l = 1}^{m} e^{s^{(l)} / \mu} \right) - \mu$ □

Using the result of Lemma 6.1.4, we conclude that in our case the problem (6.1.26) is as follows:

$$
\operatorname{min}_{x \in \Delta_{n}} \left\{\bar{f}_{\mu}(x) = \langle c, x \rangle_{\mathbb{E}_{1}} + \mu \ln \left(\frac{1}{m} \sum_{j = 1}^{m} e^{[\langle a_{j}, x \rangle + b^{(j)}] / \mu} \right) \right\}.
$$

Note that the complexity of the oracle for this problem is basically the same as that of the initial problem (6.1.36).

## 6.1.4.2 The Continuous Location Problem

Consider the following location problem. There are $p$ cities with population $m_{j}$ which are located at points $c_{j} \in \mathbb{R}^{n},{\boldsymbol{j}} = 1, \ldots, p$ . We want to construct a service center at some position $x \in \mathbb{R}^{n} \equiv \mathbb{E}_{1}$ , which minimizes the total social distance $f(x)$ to the center. On the other hand, this center must be constructed not too far from the origin.

Mathematically, the above problem can be posed as follows

$$
{\mathrm{Find ~}} f^{*} = \operatorname{min}_{x} \left\{{f(x) = \sum_{j = 1}^{p} m_{j} \| x - c_{j} \|_{\mathbb{E}_{1}} : \ \| x \|_{\mathbb{E}_{1}} \leq \bar{r}} \right\}.\tag{6.1.41}
$$

In accordance to its interpretation, it is natural to choose

$$
\| x \|_{\mathbb{E}_{1}} = \left[\sum_{i = 1}^{n}(x^{(i)})^{2} \right]^{1 / 2}, \quad d_{1}(x) \ = \ \textstyle{\frac{1}{2}} \| x \|_{\mathbb{E}_{1}}^{2}.
$$

Then $D_{1} ={\textstyle \frac{1}{7}} \bar{r}^{2}$

Further, the structure of the adjoint space $\mathbb{E}_{2}$ is quite clear:

$$
\mathbb{E}_{2} =(\mathbb{E}_{1}^{*})^{p}, \quad Q_{2} = \left\{u =(u_{1}, \dots, u_{p}) \in \mathbb{E}_{2} : \| u_{j} \|_{\mathbb{E}_{1}}^{*} \leq 1, \j = 1, \dots, p \right\}.
$$

Let us choose

$$
\begin{array}{r}{\| u \|_{\mathbb{E}_{2}} = \left[\displaystyle \sum_{j = 1}^{p} m_{j}(\| u_{j} \|_{\mathbb{E}_{1}}^{*})^{2} \right]^{1 / 2}, \quad d_{2}(u) \ = \ \frac{1}{2} \| u \|_{\mathbb{E}_{2}}^{2}.} \end{array}
$$

Then $\begin{array}{r}{D_{2} = \frac{1}{2} P} \end{array}$ with $P \equiv \sum_{j = 1}^{p} m_{j}$ . Note that the value $P$ may be interpreted as the total size of the population.

It remains to compute the norm of the operator $A$

$$
\begin{array}{l}{{\displaystyle \| A \|_{1, 2} = \operatorname{max}_{x, u} \left\{\sum_{j = 1}^{p} m_{j} \langle u_{j}, x \rangle_{\mathbb{E}_{1}} : \sum_{j = 1}^{p} m_{j}(\| u_{j} \|_{\mathbb{E}_{1}}^{*})^{2} = 1, \ \| x \|_{\mathbb{E}_{1}} = 1 \right\}}} \\{{\displaystyle = \operatorname{max}_{r_{j}} \left\{\sum_{j = 1}^{p} m_{j} r_{j} : \sum_{j = 1}^{p} m_{j} r_{j}^{2} = 1 \right\} ={\cal P}^{1 / 2}}} \end{array}
$$

(see Lemma 3.1.20).

Putting the computed values into the estimate (6.1.28), we get the following rate of convergence:

$$
\begin{array}{r}{f(\hat{x}) - f^{*} \leq \frac{2P \bar{r}}{\sqrt{N(N + 1)}}.} \end{array}\tag{6.1.42}
$$

Note that the value $\begin{array}{r}{\tilde{f}(x) = \frac{1}{P} f(x)} \end{array}$ corresponds to the average individual expenses generated by the location x. Therefore,

$$
\begin{array}{r}{\tilde{f}(\hat{x}) - \tilde{f}^{*} \leq \frac{2 \bar{r}}{\sqrt{N(N + 1)}}.} \end{array}
$$

It is interesting that the right-hand side of this inequality is independent of any dimension. At the same time, it is clear that the reasonable accuracy for the approximate solution of our problem should not be too high. Given the low complexity of each iteration in the scheme (6.1.19), the total efficiency of the proposed technique looks quite promising.

To conclude with the location problem, let us write down explicitly a smooth approximation of the objective function.

$$
\begin{array}{rl} &{f_{\mu}(x) = \displaystyle \operatorname{max}_{u} \left\{\displaystyle \sum_{j = 1}^{p} m_{j} \langle u_{j}, x - c_{j} \rangle_{\mathbb{E}_{1}} - \mu d_{2}(u) : u \in Q_{2} \right\}} \\ &{\quad \quad \quad = \displaystyle \operatorname{max}_{u} \left\{\displaystyle \sum_{j = 1}^{p} m_{j} \left(\langle u_{j}, x - c_{j} \rangle_{\mathbb{E}_{1}} - \frac{1}{2} \mu(\| u_{j} \|_{\mathbb{E}_{1}}^{*})^{2} \right) : \| u_{j} \|_{\mathbb{E}_{1}}^{*} \leq 1, \right.} \\ &{\quad \quad \quad \quad \left.\quad \quad j = 1, \ldots, p \right\}} \\ &{\quad \quad = \displaystyle \sum_{j = 1}^{p} m_{j} \psi_{\mu}(\| x - c_{j} \|_{\mathbb{E}_{1}}),} \end{array}
$$

where the function $\psi_{\mu}(\tau), \tau \geq 0$ , is defined as follows:

$$
\psi_{\mu}(\tau) = \operatorname{max}_{\gamma \in[0, 1]} \{\gamma \tau - \frac{1}{2} \mu \gamma^{2}\} = \left\{\begin{array}{c}{{\frac{\tau^{2}}{2 \mu}, 0 \leq \tau \leq \mu,}} \\{{}} \\{{\tau - \frac{\mu}{2}, \mu \leq \tau.}} \end{array} \right.\tag{6.1.43}
$$

This is the so-called the Huber loss function.

## 6.1.4.3 Variational Inequalities with a Linear Operator

Consider a linear operator $B(w) = Bw + c \colon \mathbb{E} \to \mathbb{E}^{*}$ , which is monotone:

$$
\langle Bh, h \rangle \geq 0 \quad \forall h \in \mathbb{E}.
$$

Let $Q$ be a bounded closed convex set in <sup>E</sup>. Then we can pose the following variational inequality problem:

$$
\mathrm{Find ~} w^{*} \in \mathcal{Q} : \quad \langle B(w^{*}), w - w^{*} \rangle \geq 0 \quad \forall w \in \mathcal{Q}.\tag{6.1.44}
$$

Note that we can always rewrite problem (6.1.44) as an optimization problem. Indeed, define

$$
\psi(w) = \operatorname{max}_{v} \{\langle B(v), w - v \rangle : v \in Q\}.
$$

In view of Theorem 3.1.8, $\psi(w)$ is a convex function. Let us show that the problem

$$
\operatorname{min}_{w} \{\psi(w) : \w \in Q\}\tag{6.1.45}
$$

is equivalent to (6.1.44).

Lemma 6.1.5 A point $w^{*}$ is a solution to (6.1.45) if and only if it solves variational inequality (6.1.44). Moreover, for such $w^{*}$ we have $\psi(w^{*}) = 0.$

Proof Indeed, at any $w \in Q$ the function $\psi$ is non-negative. If $w^{*}$ is a solution to (6.1.44), then for any $v \in Q$ we have

$$
\langle B(v), v - w^{*} \rangle \geq \langle B(w^{*}), v - w^{*} \rangle \geq 0.
$$

Hence, $\psi(w^{*}) = 0$ and $w^{*} \in \mathrm{Arg} \operatorname{min}_{w \in Q} \psi(w)$

Now, consider some $w^{\ast} \in{\cal Q}$ with $\psi(w^{*}) = 0$ . Then for any $v \in Q$ we have

$$
\langle B(v), v - w^{*} \rangle \geq 0.
$$

Suppose there exists some $v_{1} \in Q$ such that $\langle B(w^{*}), v_{1} - w^{*} \rangle < 0$ . Consider the points

$$
v_{\alpha} = w^{*} + \alpha(v_{1} - w^{*}), \quad \alpha \in[0, 1].
$$

Then

$$
\begin{array}{rl} &{0 \leq \langle B(v_{\alpha}), v_{\alpha} - w^{*} \rangle = \alpha \langle B(v_{\alpha}), v_{1} - w^{*} \rangle} \\ &{} \\ &{\quad = \alpha \langle B(w^{*}), v_{1} - w^{*} \rangle + \alpha^{2} \langle B \cdot(v_{1} - w^{*}), v_{1} - w^{*} \rangle.} \end{array}
$$

Hence, for α small enough we get a contradiction.

There are two possibilities for representing the problem (6.1.44), (6.1.45) in the form (6.1.10), (6.1.11).

1. Primal Form We take $\begin{array}{r}{\mathbb{E}_{1} = \mathbb{E}_{2} = \mathbb{E}, Q_{1} = Q_{2} = Q, d_{1}(x) = d_{2}(x) = d(x).} \end{array}$ $A = B$ , and

$$
\hat{f}(x) = \langle b, x \rangle_{\mathbb{E}_{1}}, \quad \hat{\phi}(u) = \langle b, u \rangle_{\mathbb{E}_{1}} + \langle Bu, u \rangle_{\mathbb{E}_{1}}.
$$

Note that the quadratic function $\hat{\phi}(u)$ is convex. To compute the value and the gradient of the function $f_{\mu}(x)$ , we need to solve the following problem:

$$
\operatorname{max}_{u \in Q} \{\langle Bx, u \rangle_{\mathbb{E}_{1}} - \mu d(u) - \langle b, u \rangle_{\mathbb{E}_{1}} - \langle Bu, u \rangle_{\mathbb{E}_{1}}\}.\tag{6.1.46}
$$

Since in our case $M = 0$ , from Theorem 6.1.3 we get the following estimate for the complexity of problem (6.1.44):

$$
\begin{array}{r}{\frac{4D_{1} \| B \|_{1, 2}}{\epsilon}.} \end{array}\tag{6.1.47}
$$

However, because of the presence of a non-trivial quadratic function in (6.1.46), the oracle for the function fˆ can be quite expensive. We can avoid that in the dual variant of this problem.

## 2. Dual Form Consider the dual variant of problem (6.1.45):

$$
\operatorname{min}_{w \in Q} \operatorname{max}_{v \in Q} \langle B(v), w - v \rangle = \operatorname{max}_{v \in Q} \operatorname{min}_{w \in Q} \langle B(v), w - v \rangle = - \operatorname{min}_{v \in Q} \operatorname{max}_{w \in Q} \langle B(v), v - w \rangle.
$$

Thus, we can take $\mathbb{E}_{1} = \mathbb{E}_{2} = \mathbb{E}, Q_{1} = Q_{2} = Q, d_{1}(x) = d_{2}(x) = d(x), A = B,$ and

$$
\hat{f}(x) = \langle b, x \rangle_{\mathbb{E}_{1}} + \langle Bx, x \rangle_{\mathbb{E}_{1}}, \quad \hat{\phi}(u) = \langle b, u \rangle_{\mathbb{E}_{1}}.
$$

Now the computation of the function value $f_{\mu}(x)$ becomes much simpler:

$$
f_{\mu}(x) = \operatorname{max}_{u} \{\langle Bx, u \rangle_{\mathbb{E}_{1}} - \mu d(u) - \langle b, u \rangle_{\mathbb{E}_{1}} : \u \in \mathcal{Q}\}.
$$

Note that we pay quite a moderate cost for this. Indeed, now M becomes equal to $\| B \|_{1, 2}$ . Hence, the complexity estimate (6.1.47) increases up to the following level:

$$
\begin{array}{r}{\frac{4D_{1} \| B \|_{1, 2}}{\epsilon} + \sqrt{\frac{D_{1} \| B \|_{1, 2}}{\epsilon}}.} \end{array}
$$

In the important particular case of skew-symmetry of the operator B, that is $B +$ $B^{*} = 0$ , the primal and dual variant have a similar complexity.

## 6.1.4.4 Piece-Wise Linear Optimization

1. Maximum of Absolute Values Consider the following problem:

$$
\operatorname{min}_{x \in{\cal Q}_{1}} \left\{f(x) = \operatorname{max}_{1 \leq j \leq m} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} | \right\}.\tag{6.1.48}
$$

For simplicity, let us choose

$$
\| x \|_{\mathbb{E}_{1}} = \left[\sum_{i = 1}^{n}(x^{(i)})^{2} \right]^{1 / 2}, \quad d_{1}(x) \ = \ \frac{1}{2} \| x \|^{2}.
$$

Denote by A the matrix with rows $a_{j}, j = 1, \dotsc, m$ . It is convenient to choose

$$
\mathbb{E}_{2} = \mathbb{R}^{2m}, \quad \| u \|_{\mathbb{E}_{2}} = \sum_{j = 1}^{2m} | u^{(j)} |, \quad d_{2}(u) = \ln(2m) + \sum_{j = 1}^{2m} u^{(j)} \ln u^{(j)}.
$$

Then

$$
f(x) = \operatorname{max}_{u} \{\langle \hat{A} x, u \rangle_{\mathbb{E}_{2}} - \langle \hat{b}, u \rangle_{\mathbb{E}_{2}} : u \in \varDelta_{2m}\},
$$

where $\hat{A} = \binom{A}{- A} \ \mathrm{and} \hat{b} = \binom{b}{- b}.\mathrm{Thus}, D_{2} = \ln(2m),$ , and

$$
D_{1} = \frac{1}{2} \bar{r}^{2}, \quad \bar{r} = \operatorname{max}_{x} \{\| x \|_{\mathbb{E}_{1}} : \x \in Q_{1}\}.
$$

It remains to compute the norm of the operator $\hat{A} \mathrm{:}$

$$
\begin{array}{l}{{\| \hat{A} \|_{1, 2} = \displaystyle \operatorname{max}_{x, u} \{\langle \hat{A} x, u \rangle_{\mathbb{E}_{2}} : \| x \|_{\mathbb{E}_{1}} = 1, \ \| u \|_{\mathbb{E}_{2}} = 1\}}} \\{{\displaystyle \quad \quad = \operatorname{max}_{x} \{\operatorname{max}_{1 \leq j \leq m} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} | : \ \| x \|_{\mathbb{E}_{1}} = 1\} = \operatorname{max}_{1 \leq j \leq m} \| a_{j} \|_{1}^{*}.}} \end{array}
$$

Putting all the computed values into the estimate (6.1.29), we see that the problem (6.1.48) can be solved in

$$
2 \sqrt{2} \bar{r} \operatorname{max}_{1 \leq j \leq m} \| a_{j} \|_{1}^{*} \sqrt{\ln(2m)} \cdot \frac{1}{\epsilon}
$$

iterations of scheme (6.1.19). The standard subgradient schemes in this situation can count only on an

$$
O \left(\left[\bar{r} \operatorname{max}_{1 \leq j \leq m} \| a_{j} \|_{1}^{*} \cdot \frac{1}{\epsilon} \right]^{2} \right)
$$

upper bound for the number of iterations.

Finally, the smooth version of the objective function in (6.1.48) is as follows:

$$
\bar{f}_{\mu}(x) = \mu \ln \left(\textstyle{\frac{1}{m}} \sum_{j = 1}^{m} \xi \left(\frac{1}{\mu}[\langle a_{j}, x \rangle + b^{(j)}] \right) \right)
$$

with $\begin{array}{r}{\xi(\tau) = \frac{1}{2}[e^{\tau} + e^{- \tau}]} \end{array}$ . We leave the justification of this expression as an exercise for the reader.

## 2. Sum of Absolute Values Consider now the problem

$$
\operatorname{min}_{x \in Q_{1}} \left\{f(x) = \sum_{j = 1}^{m} | \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} | \right\}.\tag{6.1.49}
$$

The simplest representation of the function $f(\cdot)$ is as follows. Denote by A the matrix with the rows $a_{j}$ . Let us choose

$$
\mathbb{E}_{2} = \mathbb{R}^{m}, \quad Q_{2} = \{u \in \mathbb{R}^{m} : | u^{(j)} | \leq 1, j = 1, \dots, m\},
$$

$$
\begin{array}{r}{d_{2}(u) = \frac 12 \| u \|_{\mathbb{E}_{2}}^{2} = \frac{1}{2} \displaystyle \sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*} \cdot(u^{(j)})^{2}.} \end{array}
$$

Then the smooth version of the objective function is as follows:

$$
\begin{array}{l}{{f_{\mu}(x) = \underset{u}{\operatorname{max}} \{{Ax - b, u}\}_{\mathbb{E}_{2}} - \mu d_{2}(u) : u \in Q_{2}\}}} \\{{\}} \\{{\} ={\displaystyle \sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*} \cdot \psi_{\mu} \left(\frac{| \langle a_{j}, x \rangle_{\mathbb{E}_{1}} - b^{(j)} |}{\| a_{j} \|_{\mathbb{E}_{1}}^{*}} \right)},} \end{array}
$$

where the function $\psi_{\mu}(\tau)$ is defined by (6.1.43). Note that

$$
\begin{array}{l}{{\displaystyle \| A \|_{1, 2} = \operatorname{max}_{x, u} \left\{\sum_{j = 1}^{m} u^{(j)}({a}_{j}, x)_{\mathbb{E}_{1}} : \| x \|_{\mathbb{E}_{1}} \leq 1, \| u \|_{\mathbb{E}_{2}} \leq 1 \right\}}} \\{~} \\{{\displaystyle \quad \leq \operatorname{max}_{u} \left\{\sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*} \cdot | u^{(j)} | : \ \sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*} \cdot(u^{(j)})^{2} \leq 1 \right\}}} \\{{\displaystyle \qquad = D^{1 / 2} \ \equiv \ \left[\sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*} \right]^{1 / 2}.}} \end{array}
$$

On the other hand, $\begin{array}{r}{D_{2} = \frac{1}{2} D} \end{array}$ . Therefore from Theorem 6.1.3 we get the following complexity bound:

$$
\frac{2}{\epsilon} \cdot \sqrt{2D_{1}} \cdot \sum_{j = 1}^{m} \| a_{j} \|_{\mathbb{E}_{1}}^{*}
$$

iterations of method (6.1.19).

## 6.1.5 Implementation Issues

## 6.1.5.1 Computational Complexity

Let us discuss the computational complexity of the method (6.1.19) as applied to the function $\bar{f}_{\mu}(\cdot)$ . The main computations are performed at Steps (b) and (c) of the algorithm.

Step (b). Call of Oracle At this step we need to compute the solution of the following maximization problem:

$$
\operatorname{max}_{u \in Q_{2}} \{\langle Ay_{k}, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u) - \mu d_{2}(u) : \u \in Q_{2}\}.
$$

Note that from the origin of this problem we know that this computation for $\mu = 0$ can be done in a closed form. Thus, we can expect that with a properly chosen proxfunction, computation of the smoothed version is not too difficult. In Sect. 6.1.4 we have seen three examples which confirm this belief.

Step (c). Computation of ${\pmb v}_{k + 1}$ This computation consists in solving the following problem:

$$
\operatorname{min}_{x \in Q_{1}} \{d_{1}(x) + \langle s, x \rangle_{\mathbb{E}_{1}}\}
$$

for some fixed $s \in \mathbb{E}_{1}^{*}$ . If the set $Q_{1}$ and the prox-function $d_{1}(\cdot)$ are simple enough, this computation can be done in a closed form (see Sect. 6.1.4). For some sets we need to solve an auxiliary equation with one variable.

## 6.1.5.2 Computational Stability

Our approach is based on the smoothing of non-differentiable functions. In accordance with (6.1.33), the value of the smoothness parameter $\mu$ must be of the order of $\epsilon.$ . This may cause some numerical troubles in computing the function $\bar{f}_{\mu}(x)$ and its gradient. Among examples of Sect. 6.1.4, only a smooth variant of the objective function in Sect. 6.1.4.2 does not involve dangerous operations; all others need a careful implementation.

In both Sects. 6.1.4.1 and 6.1.4.4 we need a stable technique for computing the values and derivatives of the function

$$
\eta(u) = \mu \ln \left(\sum_{j = 1}^{m} e^{u^{(j)} / \mu} \right)\tag{6.1.50}
$$

with very small values of parameter $\mu.$ . This can be done in the following way. Let

$$
\bar{u} = \operatorname{max}_{1 \leq j \leq m} u^{(j)}, \quad v^{(j)} = u^{(j)} - \bar{u}, \j = 1, \ldots, m.
$$

Then

$$
\eta(u) = \bar{u} + \eta(v).
$$

Note that all components of the vector v are non-negative and one of them is zero. Therefore, the value $\eta(v)$ can be computed quite accurately. The same technique can be used to compute the gradient since $\nabla \eta(u) = \nabla \eta(v)$

## 6.2 An Excessive Gap Technique for Non-smooth Convex Minimization

(Primal-dual problem structure; An excessive gap condition; Gradient mapping; Convergence analysis; Minimizing strongly convex functions.)

## 6.2.1 Primal-Dual Problem Structure

In this section, we give some extensions of the results presented in Sect. 6.1, where it was shown that some structured non-smooth optimization problems can be solved in $O(\textstyle{\frac{1}{\epsilon}})$ iterations of a gradient-type scheme with $\epsilon$ being the desired accuracy of the solution. This complexity is much better than the theoretical lower complexity bound $\begin{array}{r}{O(\frac{1}{\epsilon^{2}})} \end{array}$ for Black-Box methods (see Sect. 3.2). This improvement, of course, is possible because of certain relaxations of the standard Black Box assumption. Instead, it was assumed that our problem has an explicit and quite simple minimax structure. However, the approach discussed in Sect. 6.1 has a certain drawback. Namely, the number of steps of the optimization scheme must be fixed in advance. It is chosen in accordance with the worst case complexity analysis and desired accuracy. Let us try to be more flexible.

Consider the same optimization problems as before:

$$
{\mathrm{Find ~}} f^{*} = \operatorname{min}_{x \in{\mathcal{Q}}_{1}} \f(x),\tag{6.2.1}
$$

where $Q_{1}$ is a bounded closed convex set in a finite-dimensional real vector space $\mathbb{E}_{1}$ , and $f$ is a continuous convex function on $Q_{1}$ . We do not assume $f$ to be differentiable. Let the structure of the objective function be described by the following model:

$$
f(x) ={\hat{f}}(x) + \operatorname{max}_{u \in Q_{2}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} -{\hat{\phi}}(u)\},\tag{6.2.2}
$$

where the function $\hat{f}$ is continuous and convex on $Q_{1}, \Q_{2}$ is a closed convex bounded set in a finite-dimensional real vector space $\mathbb{E}_{2}, \ \hat{\phi}(\cdot)$ is a continuous convex function on $Q_{2}$ , and the linear operator A maps $\mathbb{E}_{1}$ to $\mathbb{E}_{2}^{*}$ . In this case, problem (6.2.1) can be written in an adjoint form:

$$
\begin{array}{rl} &{f_{*} = \underset{u \in Q_{2}}{\operatorname{max}} ~ \phi(u),} \\ &{} \\ &{\phi(u) = - \hat{\phi}(u) + \underset{x \in Q_{1}}{\operatorname{min}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} + \hat{f}(x)\},} \end{array}\tag{6.2.3}
$$

which has zero duality gap (see (6.1.34)).

We assume that this representation is completely similar to (6.2.1) in the following sense. All methods described in this section are implementable only if the optimization problems involved in the definitions of functions $f$ and $\phi$ can be solved in a closed form. So, we assume that the structure of all objects in $\hat{f}, \hat{\phi}, Q_{1}$ and $Q_{2}$ is simple enough. We also assume that functions $\hat{f}$ and $\hat{\phi}$ have Lipschitz continuous gradients with Lipschitz constants $L_{1}(\hat{f})$ and $L_{2}(\hat{\phi})$ respectively.

Let us show that the knowledge of structure (6.2.2) can help in solving problems (6.2.1) and (6.2.3). Consider a prox-function $d_{2}(\cdot)$ of the set $Q_{2}$ . This means that $d_{2}$ is continuous and strongly convex on $Q_{2}$ with a strong convexity parameter equal to one. Denote by

$$
u_{0} = \arg \operatorname{min}_{u \in \mathcal{Q}_{2}} d_{2}(u)
$$

the prox-center of the function $d_{2}$ . Without loss of generality we assume that $d_{2}(u_{0}) = 0$ . Thus, in view of (4.2.18), for any $u \in Q_{2}$ we have

$$
d_{2}(u) \geq \frac{1}{2} \Vert u - u_{0} \Vert_{2}^{2}.\tag{6.2.4}
$$

Let $\mu_{2}$ be a positive smoothing parameter. Consider the following function:

$$
f_{\mu_{2}}(x) = \hat{f}(x) + \operatorname{max}_{u \in Q_{2}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u) - \mu_{2} d_{2}(u)\}.\tag{6.2.5}
$$

Denote by $u_{\mu_{2}}(x)$ the optimal solution of this problem. Since the function $d_{2}$ is strongly convex, this solution is unique. In accordance with Danskin’s theorem, the

gradient of $f_{\mu_{2}}$ is well defined as

$$
\nabla f_{\mu_{2}}(x) = \nabla \hat{f}(x) + A^{*} u_{\mu_{2}}(x).\tag{6.2.6}
$$

Moreover, this gradient is Lipschitz-continuous with constant

$$
\begin{array}{r}{L_{1}(f_{\mu_{2}}) = L_{1}(\hat{f}) + \frac{1}{\mu_{2}} \| A \|_{1, 2}^{2}} \end{array}\tag{6.2.7}
$$

(see Theorem 6.1.1).

Similarly, let us consider a prox-function $d_{1}(\cdot)$ of the set $Q_{1}$ , which has convexity parameter equal to one, and the prox-center $x_{0}$ with $d_{1}(x_{0}) = 0$ . By (4.2.18), for any $x \in Q_{1}$ we have

$$
d_{1}(x) \geq{\frac{1}{2}} \| x - x_{0} \|_{1}^{2}.\tag{6.2.8}
$$

Let $\mu_{1}$ be a positive smoothing parameter. Consider

$$
\phi_{\mu_{1}}(u) = - \hat{\phi}(u) + \operatorname{min}_{x \in{\cal Q}_{1}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} + \hat{f}(x) + \mu_{1} d_{1}(x)\}.\tag{6.2.9}
$$

Since the second term in the above definition is a minimum of linear functions, $\phi_{\mu_{1}}(u)$ is concave. Denote by $x_{\mu_{1}}(u)$ the unique optimal solution of the above problem. In accordance with Theorem 6.1.1, the gradient

$$
\nabla \phi_{\mu_{1}}(u) = - \nabla \hat{\phi}(u) + Ax_{\mu_{1}}(u)\tag{6.2.10}
$$

is Lipschitz-continuous with constant

$$
\begin{array}{r}{L_{2}(\phi_{\mu_{1}}) = L_{2}(\hat{\phi}) + \frac{1}{\mu_{1}} \| A \|_{1, 2}^{2}.} \end{array}\tag{6.2.11}
$$

## 6.2.2 An Excessive Gap Condition

In view of Theorem 1.3.1, for any $x \in Q_{1}$ and $u \in Q_{2}$ we have

$$
\phi(u) \leq f(x),\tag{6.2.12}
$$

and our assumptions guarantee no duality gap for problems (6.2.1) and (6.2.3). However, $f_{\mu_{2}}(x) \leq f(x)$ and $\phi(u) \leq \phi_{\mu_{1}}(u)$ . This opens a possibility to satisfy the following excessive gap condition:

$$
f_{\mu_{2}}(\bar{x}) ~ \le ~ \phi_{\mu_{1}}(\bar{u})\tag{6.2.13}
$$

for certain $\bar{x} \in Q_{1}$ and $\bar{u} \in Q_{2}$ . Let us show that condition (6.2.13) provides us with an upper bound on the quality of the primal-dual pair (x, u).

Lemma 6.2.1 Let $\bar{x} \in Q_{1}$ and $\bar{u} \in Q_{2}$ satisfy (6.2.13). Then

$$
\begin{array}{rl} &{0 \le \operatorname{max} \{f(\bar{x}) - f^{*}, f^{*} - \phi(\bar{u})\}} \\ &{} \\ &{\le f(\bar{x}) - \phi(\bar{u}) \le \mu_{1} D_{1} + \mu_{2} D_{2},} \end{array}\tag{6.2.14}
$$

where $D_{1} = \operatorname{max}_{x \in Q_{1}} d_{1}(x)$ , and $D_{2} = \operatorname{max}_{u \in Q_{2}} \d_{2}(u)$

Proof Indeed, for any $\bar{x} \in Q_{1}, \bar{u} \in Q_{2}$ we have

$$
f(\bar{x}) - \mu_{2} D_{2} \leq f_{\mu_{2}}(\bar{x}) \stackrel{{\scriptscriptstyle(6.2.13)}}{\leq} \phi_{\mu_{1}}(\bar{u}) \leq \phi(\bar{u}) + \mu_{1} D_{1}.
$$

It remains to apply inequality (6.2.12).

Our goal is to justify a process for recursively updating the pair $({\bar{x}},{\bar{u}})$ , which maintains inequality (6.2.13) as $\mu_{1}$ and $\mu_{2}$ go to zero. Before we start our analysis, let us prove a useful inequality.

Lemma 6.2.2 For any x and x from $Q_{1}$ we have:

$$
\begin{array}{r}{f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), x - \hat{x} \rangle_{\mathbb{E}_{1}} \leq \hat{f}(x) + \langle Ax, u_{\mu_{2}}(\hat{x}) \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u_{\mu_{2}}(\hat{x})).} \end{array}\tag{6.2.15}
$$

Proof Let us take arbitrary x and $\hat{x}$ from $Q_{1}$ . Let $\hat{u} = u_{\mu_{2}}(\hat{x})$ . Then

$$
\begin{array}{rl} &{f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), x - \bar{y} \rangle_{\mathbb{E}_{1}} \stackrel{(6.2.5),(6.2.6)}{=} \hat{f}(\hat{x}) + \langle A \bar{y}, \hat{u} \rangle_{\mathbb{E}_{2}} - \hat{\phi}(\hat{u}) - \mu_{2} d_{2}(\hat{u})} \\ &{\qquad + \langle \nabla \hat{f}(\hat{x}) + A^{*} \hat{u}, x - \hat{x} \rangle_{\mathbb{E}_{1}}} \end{array}
$$

$$
\begin{array}{rlr}{\stackrel{(2.1.2)}{\leq}} &{{}} &{\hat{f}(x) + \langle Ax, \hat{u} \rangle_{\mathbb{E}_{2}} - \hat{\phi}(\hat{u}).} \end{array}
$$

Let us justify the possibility of satisfying the excessive gap condition (6.2.13) at some starting primal-dual pair.

Lemma 6.2.3 Let us choose an arbitrary $\mu_{2} > 0$ and set

$$
\bar{x} = \arg \operatorname{min}_{x \in Q_{1}} \{\langle \nabla f_{\mu_{2}}(x_{0})), x - x_{0} \rangle_{\mathbb{E}_{1}} + L_{1}(f_{\mu_{2}}) d_{1}(x)\},\tag{6.2.16}
$$

$$
\bar{u} = u_{\mu_{2}}(x_{0}).
$$

Then the excessive gap condition is satisfied for any $\mu_{1} \geq L_{1}(f_{\mu_{2}})$

Proof Indeed, in view of (1.2.11) we have

$$
\begin{array}{rcl}{f_{\mu_{2}}(\bar{x})} &{\leq} &{f_{\mu_{2}}(x_{0}) + \langle \nabla f_{\mu_{2}}(x_{0}), \bar{x} - x_{0} \rangle \mathbb{E}_{1} + \frac{1}{2} L_{1}(f_{\mu_{2}}) \| \bar{x} - x_{0} \|_{1}^{2}} \\ & &{\overset{(6, 2, 4)}{\leq}} & \\ & &{\overset{(6, 2, 4)}{\leq}} & \\ & &{\overset{(6, 2, 4)}{\leq}} & \\ & &{\overset{(6, 2, 16)}{=}} &{\operatorname{min} \big \{\langle \nabla f_{\mu_{2}}(x_{0}), \bar{x} - x_{0} \rangle_{\mathbb{E}_{1}} + \frac{1}{2} L_{1}(f_{\mu_{2}}) d_{1}(\bar{x})} \\ & &{\overset{(6, 2, 16)}{=}} &{\operatorname{min} \big \{\langle \nabla f_{\mu_{2}}(x_{0}), x - x_{0} \rangle_{\mathbb{E}_{1}} + L_{1}(f_{\mu_{2}}) d_{1}(x) \big\}} \\ & &{\overset{(6, 2, 15)}{\leq}} & \\ & &{\overset{(6, 3)}{\leq}} &{\operatorname{min} \bigg \{\hat{f}(x) + \langle Ax, u_{\mu_{2}}(x_{0}) \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u_{\mu_{2}}(x_{0})) + L_{1}(f_{\mu_{2}}) d_{1}(x) \bigg\}} \\ & & \overset{(6, 2, 9)}{=} \phi_{L_{1}(f_{\mu_{2}})}(\bar{u}) \ \end{array}
$$

Thus, condition (6.2.13) can be satisfied for some primal-dual pair. Let us show how we can update the points $\bar{x}$ and $\bar{u}$ in order to keep it valid for smaller values of $\mu_{1}$ and $\mu_{2}$ . In view of the symmetry of the situation, at the first step of the process we can try to decrease only $\mu_{1}$ , keeping $\mu_{2}$ unchanged. After that, at the second step, we update $\mu_{2}$ and keep $\mu_{1}$ constant, and so on. The main advantage of such a switching strategy is that we need to find a justification only for the first step. The proof for the second one will be symmetric.

Theorem 6.2.1 Let points $\bar{x} \in Q_{1}$ and $\bar{u} \in Q_{2}$ satisfy the excessive gap condition (6.2.13) for some positive $\mu_{1}$ and $\mu_{2}$ . Let us fix $\tau \in(0, 1)$ and choose $\mu_{1}^{+} =(1 - \tau) \mu_{1}$

$$
\begin{array}{rl}{\hat{x}} &{=(1 - \tau) \bar{x} + \tau x_{\mu_{1}}(\bar{u}),} \\ &{} \\ &{\bar{u}_{+} =(1 - \tau) \bar{u} + \tau u_{\mu_{2}}(\hat{x}),} \\ &{} \\ &{\bar{x}_{+} =(1 - \tau) \bar{x} + \tau x_{\mu_{1}^{+}}(\bar{u}_{+}).} \end{array}\tag{6.2.17}
$$

Then the pair $(\bar{x}_{+}, \bar{u}_{+})$ satisfies condition (6.2.13) with smoothing parameters $\mu_{1}^{+}$ and $\mu_{2}$ provided that τ satisfies the following relation:

$$
\begin{array}{r}{\boxed{\frac{\tau^{2}}{1 - \tau} \le \frac{\mu_{1}}{L_{1}(f_{\mu_{2}})}}} \end{array}\tag{6.2.18}
$$

Proof Let $\hat{u} = u_{\mu_{2}}(\hat{x}), x_{1} = x_{\mu_{1}}(\bar{u})$ , and $\tilde{x}_{+} = x_{\mu_{1}^{+}}(\bar{u}_{+})$ . Since $\hat{\phi}$ is convex, in view of the operation in (6.2.17), we have $\hat{\phi}(\bar{u}_{+}) \leq(1 - \tau) \hat{\phi}(\bar{u}) + \tau \hat{\phi}(\hat{u})$ . Therefore,

$$
\begin{array}{lcl}{{\phi_{\mu_{1}}^{\ast}(\bar{u}_{+})}} &{{=}} &{{(1 - \tau) \mu_{1} d_{1}(\tilde{x}_{+}) + \langle A \tilde{x}_{+},(1 - \tau) \bar{u} + \tau \hat{u} \rangle_{\mathbb{Z}_{2}} + \hat{f}(\tilde{x}_{+}) - \hat{\phi}(\bar{u}_{+})}} \\{{}} &{{}} &{{}} \\{{}} &{{\geq}} &{{(1 - \tau)[\mu_{1} d_{1}(\tilde{x}_{+}) + \langle A \tilde{x}_{+}, \bar{u} \rangle_{\mathbb{E}_{2}} + \hat{f}(\tilde{x}_{+}) - \hat{\phi}(\bar{u})]}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{+ \tau[\hat{f}(\tilde{x}_{+}) + \langle A \tilde{x}_{+}, \hat{u} \rangle_{\mathbb{E}_{2}} - \hat{\phi}(\hat{u})]}} \\{{}} &{{}} &{{}} \\{{}} &{{\stackrel{(6, 2, 15)}{\geq}(1 - \tau)[\phi_{\mu_{1}}(\bar{u}) + \frac{1}{2} \mu_{1} \| \tilde{x}_{+} - x_{1} \|_{1}^{2}]{}_{\alpha}}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{+ \tau[f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), \tilde{x}_{+} - \hat{x} \rangle_{\mathbb{E}_{1}}]{}_{b}.}} \end{array}
$$

Note that in view of condition (6.2.13) and the first line in (6.2.17) we have

$$
\begin{array}{rl} &{\phi_{\mu_{1}}(\bar{u}) \geq f_{\mu_{2}}(\bar{x}) \geq f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x} - \hat{x} \rangle_{\mathbb{E}_{1}}} \\ &{} \\ &{\qquad = f_{\mu_{2}}(\hat{x}) + \tau \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x} - x_{1} \rangle_{\mathbb{E}_{1}}.} \end{array}
$$

Therefore, we can estimate the expression in the first brackets as follows:

$$
\begin{array}{r}{[\mathbf{\nabla} \cdot]_{a} \geq f_{\mu_{2}}(\hat{x}) + \tau \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x} - x_{1} \rangle_{\mathbb{E}_{1}} + \frac{1}{2} \mu_{1} \| \tilde{x}_{+} - x_{1} \|_{1}^{2}.} \end{array}
$$

In view of the first line in (6.2.15), for second brackets we have

$$
[\cdot]_{b} = f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), \tilde{x}_{+} - x_{1} +(1 - \tau)(x_{1} - \bar{x}) \rangle_{\mathbb{E}_{1}}.
$$

Thus, taking into account that $\bar{x}_{+} - \hat{x} \overset{(6.2.17)}{=} \tau(\tilde{x}_{+} - x_{1})$ , we finish the proof as follows:

$$
\begin{array}{rcl}{\phi_{\mu_{1}^{+}}(\bar{u}_{+})} &{\geq} &{f_{\mu_{2}}(\hat{x}) + \tau \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x}_{+} - x_{1} \rangle_{\mathbb{E}_{1}} + \frac{1}{2}(1 - \tau) \mu_{1} \| \tilde{x}_{+} - x_{1} \|_{1}^{2}} \\ & &{} \\ & &{=} &{f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x}_{+} - \hat{x} \rangle_{\mathbb{E}_{1}} + \frac{(1 - \tau) \mu_{1}}{2 \tau^{2}} \| \bar{x}_{+} - \hat{x} \|_{1}^{2}} \\ & &{} \\ & &{\overset{(6.2.18)}{\geq} f_{\mu_{2}}(\hat{x}) + \langle \nabla f_{\mu_{2}}(\hat{x}), \bar{x}_{+} - \hat{x} \rangle_{\mathbb{E}_{1}} + \frac{1}{2} L_{1}(f_{\mu_{2}}) \| \bar{x}_{+} - \hat{x} \|_{1}^{2}} \\ & &{} \\ &{(1.2.11)} &{} \\ & &{\overset{(\mathrm{criptsize ~ um ~} f_{\mu_{2}}(\bar{x}_{+}).}{\geq} f_{\mu_{2}}(\bar{x}_{+}).} \end{array}
$$

## 6.2.3 Convergence Analysis

In Sect. 6.2.2, we have seen that the smoothness parameters $\mu_{1}$ and $\mu_{2}$ can be decreased by a switching strategy. Thus, in order to transform the result of Theorem 6.2.1 into an algorithmic scheme, we need to point out a strategy for updating these parameters, which is compatible with the growth condition (6.2.18). In this section, we do this for an important case $L_{1}(\hat{f}) = L_{2}(\hat{\phi}) = 0$

It is convenient to represent the smoothness parameters as follows:

$$
\begin{array}{r}{\mu_{1} = \lambda_{1} \cdot \| A \|_{1, 2} \cdot \sqrt{\frac{D_{2}}{D_{1}}}, \quad \mu_{2} = \lambda_{2} \cdot \| A \|_{1, 2} \cdot \sqrt{\frac{D_{1}}{D_{2}}}.} \end{array}\tag{6.2.19}
$$

Then the estimate (6.2.14) for the duality gap becomes symmetric:

$$
f(\bar{x}) - \phi(\bar{u}) \leq(\lambda_{1} + \lambda_{2}) \cdot \| A \|_{1, 2} \cdot \sqrt{D_{1} D_{2}}.\tag{6.2.20}
$$

Since by (6.2.7), $\begin{array}{r}{L_{1}(f_{\mu_{2}}) = \frac{1}{\mu_{2}} \| A \|_{1, 2}^{2}} \end{array}$ , condition (6.2.18) becomes problem independent:

$$
\begin{array}{r}{\frac{\tau^{2}}{1 - \tau} \leq \mu_{1} \mu_{2} \cdot \frac{1}{\| A \|_{1, 2}^{2}} = \lambda_{1} \lambda_{2}.} \end{array}\tag{6.2.21}
$$

Let us write down the corresponding switching algorithmic scheme in an explicit form. It is convenient to have a permanent iteration counter. In this case, at even iterations we apply the primal update (6.2.17), and at odd iterations the corresponding dual update is used. Since at even iterations $\lambda_{2}$ does not change and at odd iterations $\lambda_{1}$ does not change it is convenient to put their new values in the same sequence $\{\alpha_{k}\}_{k = - 1}^{\infty}$ . Let us fix the following relations between the sequences:

$$
\begin{array}{rl}{k =} &{{} 2l \mathrm{~ ~ \cdot ~} \lambda_{1, k} = \alpha_{k - 1}, \lambda_{2, k} = \alpha_{k},} \end{array}\tag{6.2.22}
$$

$$
k = 2l + 1 : \lambda_{1, k} = \alpha_{k}, \quad \lambda_{2, k} = \alpha_{k - 1}.
$$

Then the corresponding parameters $\tau_{k}$ (see the rule (6.2.1)) define the reduction rate of the sequence $\{\alpha_{k}\}_{k = - 1}^{\infty}$

Lemma 6.2.4 For all $k \geq 0$ we have $\alpha_{k + 1} =(1 - \tau_{k}) \alpha_{k - 1}$

Proof Indeed, in accordance with (6.2.22), if $k = 2l$ , then

$$
\alpha_{k + 1} = \lambda_{1, k + 1} =(1 - \tau_{k}) \lambda_{1, k} =(1 - \tau_{k}) \alpha_{k - 1}.
$$

And if $k = 2l + 1$ , then $\alpha_{k + 1} = \lambda_{2, k + 1} =(1 - \tau_{k}) \lambda_{2, k} =(1 - \tau_{k}) \alpha_{k - 1}$ .

Corollary 6.2.1 In terms of the sequence $\{\alpha_{k}\}_{k = - 1}^{\infty}$ , condition (6.2.21) is as follows:

$$
\begin{array}{r}{(\alpha_{k + 1} - \alpha_{k - 1})^{2} \le \alpha_{k + 1} \alpha_{k} \alpha_{k - 1}^{2}, \quad k \ge 0.} \end{array}\tag{6.2.23}
$$

Proof In view of (6.2.22), we always have $\lambda_{1, k} \lambda_{2, k} = \alpha_{k} \alpha_{k - 1}$ . Since $\begin{array}{r}{\tau_{k} = 1 - \frac{\alpha_{k + 1}}{\alpha_{k - 1}}} \end{array}$ we get (6.2.23).

Clearly, condition (6.2.23) is satisfied by

$$
\begin{array}{r}{\alpha_{k} = \frac{2}{k + 2}, \quad k \ge - 1.} \end{array}\tag{6.2.24}
$$

Then

$$
\begin{array}{r}{\tau_{k} = 1 - \frac{\alpha_{k + 1}}{\alpha_{k - 1}} = \frac{2}{k + 3}, \quad k \ge 0.} \end{array}\tag{6.2.25}
$$

Now we are ready to write down an algorithmic scheme. Let us do this for the rule (6.2.17). In this scheme, we use the sequences $\{\mu_{1, k}\}_{k = - 1}^{\infty}$ and $\{\mu_{2, k}\}_{k = - 1}^{\infty}$ generated in accordance with rules (6.2.19), (6.2.22) and (6.2.24).

```latex
1. Initialization: Choose $\bar{x}_{0}$ and $\bar{u}_{0}$ in accodance with
(6.2.16) taking $\mu_{1} = \mu_{1, 0}$ and $\mu_{2} = \mu_{2, 0}$
2. Iterations $(k \geq 0)$
(a) Set $\begin{array}{r}{\tau_{k} = \frac{2}{k + 3}.} \end{array}$
(b) If k is even, then generate $(\bar{x}_{k + 1}, \bar{u}_{k + 1})$ from $(\bar{x}_{k}, \bar{u}_{k})$ using
(6.2.17).
(c) If k is odd, then generate $(\bar{x}_{k + 1}, \bar{u}_{k + 1})$ from $(\bar{x}_{k}, \bar{u}_{k})$ using
the symmetric dual variant of (6.2.17).
```

(6.2.26)

Theorem 6.2.2 Let the sequences $\{\bar{x}_{k}\}_{k = 0}^{\infty}$ and $\{\bar{u}_{k}\}_{k = 0}^{\infty}$ be generated by method (6.2.26). Then each pair of points $(\bar{x}_{k}, \bar{u}_{k})$ satisfy the excessive gap condition. Therefore,

$$
\begin{array}{r}{f(\bar{x}_{k}) - \phi(\bar{u}_{k}) \leq \frac{4 \| A \|_{1, 2}}{k + 1} \sqrt{D_{1} D_{2}}.} \end{array}\tag{6.2.27}
$$

Proof In accordance with our choice of parameters,

$$
\mu_{1, 0} \mu_{2, 0} = \lambda_{1, 0} \lambda_{2, 0} \cdot \| A \|_{1, 2}^{2} \ = \2 \mu_{2, 0} L_{1}(f_{\mu_{2, 0}}) \ > \ \mu_{2, 0} L_{1}(f_{\mu_{2, 0}}).
$$

Hence, in view of Lemma 6.2.3 the pair $(\bar{x}_{0}, \bar{u}_{0})$ satisfies the excessive gap condi tion. We have already checked that the sequence $\{\tau_{k}\}_{k = 0}^{\infty}$ defined by (6.2.25) satisfies

the conditions of Theorem 6.2.1. Therefore, excessive gap conditions will be valid for the sequences generated by (6.2.26). It remains to use inequality (6.2.20).

## 6.2.4 Minimizing Strongly Convex Functions

Consider now the model (6.2.2), which satisfies the following assumption.

Assumption 6.2.1 In representation (6.2.2) the function $\hat{f}$ is strongly convex with convexity parameter $\hat{\sigma} > 0$

Let us prove the following variant of Danskin’s theorem.

Lemma 6.2.5 Under Assumption 6.2.1 the function $\phi$ defined by (6.2.3) is concave and differentiable. Moreover, its gradient

$$
\nabla \phi(u) = - \nabla \hat{\phi}(u) + Ax_{0}(u),\tag{6.2.28}
$$

where $x_{0}(u)$ is defined by (6.2.9), is Lipschitz-continuous with constant

$$
\begin{array}{r}{L_{2}(\phi) = \frac{1}{\hat{\sigma}} \| A \|_{1, 2}^{2} + L_{2}(\hat{\phi}).} \end{array}\tag{6.2.29}
$$

Proof Let $\tilde{\phi}(u) = \operatorname{min}_{x \in Q_{1}} \{\langle Ax, u \rangle_{\mathbb{E}_{2}} + \hat{f}(x)\}$ . This function is concave as a minimum of linear functions. Since $\hat{f}$ is strongly convex, the solution of the latter minimization problem is unique. Therefore, $\tilde{\phi}(\cdot)$ is differentiable and $\nabla \tilde{\phi}(u) = Ax_{0}(u)$

Consider two points $u_{1}$ and $u_{2}$ . From the first-order optimality conditions for (6.2.3) we have

$$
\begin{array}{r}{\langle A^{*} u_{1} + \nabla \hat{f}(x_{0}(u_{1})), x_{0}(u_{2}) - x_{0}(u_{1}) \rangle_{\mathbb{E}_{1}} \geq 0,} \end{array}
$$

$$
\begin{array}{r}{\langle A^{*} u_{2} + \nabla \hat{f}(x_{0}(u_{2})), x_{0}(u_{1}) - x_{0}(u_{2}) \rangle_{\mathbb{E}_{1}} \geq 0.} \end{array}
$$

Adding these inequalities and using the strong convexity of ${\hat{f}}(\cdot)$ , we continue as follows:

$$
\begin{array}{rl} &{\langle Ax_{0}(u_{2}) - Ax_{0}(u_{1}), u_{1} - u_{2} \rangle_{\mathbb{E}_{2}}} \\ &{\quad \ge \quad \langle \nabla \hat{f}(x_{0}(u_{1})) - \nabla \hat{f}(x_{0}(u_{2})), x_{0}(u_{1}) - x_{0}(u_{2}) \rangle_{\mathbb{E}_{1}}} \\ &{\quad \overset{(2.1.22)}{\ge} \hat{\sigma} \Vert x_{0}(u_{1}) - x_{0}(u_{2}) \Vert_{\mathbb{E}_{1}}^{2} \quad \overset{(6.1.9)}{\ge} \frac{\hat{\sigma}}{\Vert A \Vert_{1, 2}^{2}} \left(\Vert \nabla \tilde{\phi}(u_{1}) - \nabla \tilde{\phi}(u_{2}) \Vert_{\mathbb{E}_{2}}^{*} \right)^{2}.} \end{array}
$$

Thus, $\begin{array}{r}{\| \nabla \tilde{\phi}(u_{1}) - \nabla \tilde{\phi}(u_{2}) \|_{| E_{2}}^{*} \leq \frac{1}{\hat{\sigma}} \| A \|_{1, 2}^{2} \cdot \| u_{1} - u_{2} \|_{\mathbb{E}_{2}}} \end{array}$ , and (6.2.29) follows.

Lemma 6.2.6 For any u and $\hat{u}$ from $Q_{2},$ , we have:

$$
\begin{array}{rlr}{\phi(\hat{u}) + \langle \nabla \phi(\hat{u}), u - \hat{u} \rangle_{\mathbb{E}_{2}}} &{\ge} &{- \hat{\phi}(u) + \langle Ax_{0}(\hat{u}), u \rangle_{\mathbb{E}_{2}} + \hat{f}(x_{0}(\hat{u})).} \end{array}\tag{6.2.30}
$$

Proof Let us take arbitrary u and $\hat{u}$ from $Q_{2}$ . Define $\hat{x} = x_{0}(\hat{u})$ . Then

$$
\begin{array}{rl} &{\phi(\hat{u}) + \langle \nabla \phi(\hat{u}), u - \hat{u} \rangle_{\mathbb{E}_{2}}} \\{=} &{- \hat{\phi}(\hat{u}) + \langle A \hat{x}, \hat{u} \rangle_{\mathbb{E}_{2}} + \hat{f}(\hat{x}) + \langle - \nabla \hat{\phi}(\hat{u}) + A \hat{x}, u - \hat{u} \rangle_{\mathbb{E}_{2}}} \end{array}
$$

$$
\stackrel{(2.1.2)}{\geq} - \hat{\phi}(u) + \langle A \hat{x}, u \rangle_{\mathbb{E}_{2}} + \hat{f}(\hat{x}).
$$

□

In this section, we derive an optimization scheme from the following variant of excessive gap condition:

$$
\boxed{\begin{array}{rl} &{f_{\mu_{2}}(\bar{x}) \ \leq \ \phi(\bar{u})} \end{array}}\tag{6.2.31}
$$

for some $\bar{x} \in Q_{1}$ and $\bar{u}$ in $Q_{2}$

This condition can be seen as a variant of condition (6.2.13) with $\mu_{1} ~ = ~ 0.$ However, we prefer not to use the results of the previous sections since our assumptions will be slightly different. For example, we no longer need the set $Q_{1}$ to be bounded.

Lemma 6.2.7 Let points x from $Q_{1}$ and u from $Q_{2}$ satisfy condition (6.2.31). Then

$$
0 \leq f(\bar{x}) - \phi(\bar{u}) \ \leq \ \mu_{2} D_{2}.\tag{6.2.32}
$$

Proof Indeed, for any $x \in Q_{1}$ , we have $f_{\mu_{2}}(x) \geq f(x) - \mu_{2} D_{2}$ .

Define the adjoint gradient mapping as follows:

$$
V(u) = \arg \operatorname{max}_{v \in Q_{2}} \left\{\langle \nabla \phi(u), v - u \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| v - u \|_{\mathbb{E}_{2}}^{2} \right\}.\tag{6.2.33}
$$

Lemma 6.2.8 The excessive gap condition (6.2.31) is valid for $\mu_{2} = L_{2}(\phi)$ and

$$
\bar{x} \ = \x_{0}(u_{0}), \quad \bar{u} \ = \V(u_{0}).\tag{6.2.34}
$$

Proof Indeed, in view of Lemma 6.2.5 and (1.2.11), we get the following relations:

$$
\phi(V(u_{0})) \qquad \geq \qquad \phi(u_{0}) + \langle \nabla \phi(u_{0}), V(u_{0}) - u_{0} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| V(u_{0}) - u_{0} \|_{2}^{2}
$$

$$
\stackrel{(6.2.33)}{=} \quad \operatorname{max}_{u \in Q_{2}} \left\{\phi(u_{0}) + \langle \nabla \phi(u_{0}), u - u_{0} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| u - u_{0} \|_{2}^{2} \right\}
$$

$$
\begin{array}{rlr}{{(6.2.3) \underline{{,(6.2.28)}} \operatorname{max}_{u \in Q_{2}} \Big \{- \hat{\phi}(u_{0}) + \langle Ax_{0}(u_{0}), u_{0} \rangle_{\mathbb{E}_{2}} + \hat{f}(x_{0}(u_{0}))} \\ &{} & \\ &{} &{+ \langle Ax_{0}(u_{0}) - \nabla \hat{\phi}(u_{0}), u - u_{0} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} \mu_{2} \| u - u_{0} \|_{2}^{2} \Big\}} \qquad} \end{array}
$$

$$
\begin{array}{rlr}{\stackrel{(6.2.4)}{\geq}} &{{}} &{\underset{u \in Q_{2}}{\operatorname{max}} \left\{- \hat{\phi}(u) + \hat{f}(x_{0}(u_{0})) + \langle Ax_{0}(u_{0}), u \rangle_{\mathbb{E}_{2}} - \mu_{2} d_{2}(u) \right\}} \end{array}
$$

(6.2.5)

$$
f_{\mu_{2}}(x_{0}(u_{0})).
$$

Theorem 6.2.3 Let points $\bar{x} \in Q_{1}$ and $\bar{u} \in Q_{2}$ satisfy the excessive gap condition (6.2.31) for some positive $\mu_{2}$ . Let us fix $\tau \in \mathsf{\Gamma}(0, 1)$ and choose $\mu_{2}^{+} =$ $(1 - \tau) \mu_{2}$

$$
\begin{array}{rl}{\hat{u}} &{{} =(1 - \tau) \bar{u} + \tau u_{\mu_{2}}(\bar{x}),} \end{array}
$$

$$
\bar{x}_{+} =(1 - \tau) \bar{x} + \tau x_{0}(\hat{u}),\tag{6.2.35}
$$

$$
\bar{u}_{+} = V(\hat{u}).
$$

Then the pair $(\bar{x}_{+}, \bar{u}_{+})$ satisfies condition (6.2.31) with smoothness parameter $\mu_{2}^{+}$ provided that τ satisfies the following growth relation:

$$
\begin{array}{r}{\frac{\tau^{2}}{1 - \tau} \leq \frac{\mu_{2}}{L_{2}(\phi)}.} \end{array}\tag{6.2.36}
$$

Proof Let $\hat{x} = x_{0}(\hat{u})$ and $u_{2} = u_{\mu_{2}}(\bar{x})$ . In view of the second rule in (6.2.35), and (6.2.5), we have:

$$
\begin{array}{rcl}{{f_{\mu_{2}^{*}}(\bar{x}_{+})}} &{{=}} &{{\hat{f}(\bar{x}_{+}) + \displaystyle \operatorname{max}_{s \in \mathcal{Q}, \{4((1 - \tau) \bar{x} + \tau \hat{x}), u\} g_{2} - \hat{\phi}(u)}}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{-(1 - \tau) \mu_{2} d_{2}(u) \displaystyle 1}} \\{{}} &{{}} &{{}} \\{{}} &{{\displaystyle \overset{\mathrm{(L.1.2)}}{\leq} \displaystyle \operatorname{max}_{u \in \mathcal{Q}, \{1 - \tau\}} \{(1 - \tau)[\hat{f}(\bar{x}) + \langle A \bar{x}, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u) - \mu_{2} d_{2}(u)]}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{+ \tau[\hat{f}(\hat{x}) + \langle A \hat{x}, u \rangle_{\mathbb{E}_{2}} - \hat{\phi}(u)]\}}} \\{{}} &{{}} &{{}} \\{{}} &{{\displaystyle \overset{\mathrm{(4.218)}}{\leq} \displaystyle \operatorname{max}_{u \in \mathcal{Q}, \{1 - \tau\}} \{(1 - \tau)[f_{s \in \overline{{\Delta}}} - \frac{1}{2} \mu_{2} \| u - u_{2} \|_{2}^{2}]}} \\{{}} &{{}} &{{}} \\{{}} &{{}} & + \tau[6 \hat{u}) + \langle \nabla \phi(\hat{u}), u - \hat{u} \rangle_\end{array}
$$

where we used (6.2.30) in the last line. Since $\phi$ is concave, by (6.2.31) we obtain

$$
\begin{array}{rlrlrl}{f_{\mu_{2}}(\bar{x})} &{{} \quad} &{\le \quad} &{{} \quad} &{\phi(\bar{u}) \le \phi(\hat{u}) + \langle \nabla \phi(\hat{u}), \bar{u} - \hat{u} \rangle_{\mathbb{E}_{2}}} \end{array}
$$

$$
\operatorname{Line} \mathbb{1} \operatorname{in}_{=}(6.2.35) \phi(\hat{u}) + \tau \langle \nabla \phi(\hat{u}), \bar{u} - u_{2} \rangle_{\mathbb{E}_{2}}.
$$

Hence, we can finish the proof as follows:

$$
\begin{array}{rlr}{f_{\mu_{2}^{+}}(\bar{x}_{+})} &{\leq} &{\underset{u \in Q_{2}}{\operatorname{max}} \left\{\phi(\hat{u}) + \tau \langle \nabla \phi(\hat{u}), u - u_{2} \rangle_{\mathbb{E}_{2}} - \frac{1}{2}(1 - \tau) \mu_{2} \| u - u_{2} \|_{2}^{2} \right\}} \\ &{} & \\ &{\overset{(6.2.36)}{\leq} \underset{u \in Q_{2}}{\operatorname{max}} \left\{\phi(\hat{u}) + \tau \langle \nabla \phi(\hat{u}), u - u_{2} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} \tau^{2} L_{2}(\phi) \| u - u_{2} \|_{2}^{2} \right\}.} \end{array}
$$

Defining now $\boldsymbol{v} = \bar{\boldsymbol{u}} + \tau(\boldsymbol{u} - \bar{\boldsymbol{u}}))$ with $u \in Q_{2}$ , we continue:

$$
\begin{array}{rcccl}{f_{\mu_{2}^{+}}(\bar{x}_{+})} &{\leq} &{\displaystyle \operatorname{max}_{v \in \bar{u} + \tau(Q_{2} - \bar{u})} \left\{\phi(\hat{u}) + \langle \nabla \phi(\hat{u}), v - \hat{u} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| v - \hat{u} \|_{2}^{2} \right\}} \\{\displaystyle} &{} & &{} \\{\displaystyle(\mathcal{Q}_{2} \mathrm{~ is ~ convex})} &{\leq} &{\displaystyle \operatorname{max}_{v \in Q_{2}} \left\{\phi(\hat{u}) + \langle \nabla \phi(\hat{u}), v - \hat{u} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| v - \hat{u} \|_{2}^{2} \right\}} \\{\displaystyle} &{} & &{} \\{\displaystyle} &{\stackrel{(6.2.33)}{\leq} \phi(\hat{u}) + \langle \nabla \phi(\hat{u}), \bar{u}_{+} - \hat{u} \rangle_{\mathbb{E}_{2}} - \frac{1}{2} L_{2}(\phi) \| \bar{u}_{+} - \hat{u} \|_{2}^{2}} \\{\displaystyle} &{} & &{} \\{\displaystyle} &{\stackrel{(1.2.1)}{\leq} \phi(\bar{u}_{+}).} &{\qquad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \Omega} \end{array}
$$

Now we can justify the following minimization scheme.

$$
\begin{array}{rl} &{\mathrm{1.~ Imitalization :}} \\ &{\qquad \mathrm{Sig ~} l_{2, 0} = 2L_{2}(\phi), \bar{x}_{0} = 3 \eta(u_{0}) \mathrm{~ and ~} \bar{u}_{0} = V(u_{0}),} \\ &{} \\ &{\mathrm{2.~ For ~} k \succeq 0 \mathrm{iterate :}} \\ &{\qquad \mathrm{Set ~ r_\alpha = \frac{2}{\pi} ~ and ~} \bar{u}_{k} =(1 - \tau_{k}) \bar{u}_{k} + \nabla u_{0, k_{\perp}}(\bar{x}_{k}),} \\ &{\qquad \mathrm{Vplatal ~} \mu_{k} \mathrm{=}(1 - \tau_{k}) u_{0, k},} \\ &{\qquad \bar{x}_{k + 1} =(1 - \tau_{k}) \bar{x}_{k} + \tau_{k} x_{0}(\bar{u}_{k}),} \\ &{\qquad \bar{u}_{k + 1} = V(\bar{u}_{k}),} \end{array}\tag{6.2.37}
$$

Theorem 6.2.4 Let problem (6.2.1) satisfy Assumption 6.2.1. Then the pairs $(\bar{x}_{k}, \bar{u}_{k})$ generated by scheme (6.2.37) satisfy the following inequality:

$$
\begin{array}{r}{f(\bar{x}_{k}) - \phi({\bar{u}}_{k}) \leq \frac{4L_{2}(\phi) D_{2}}{(k + 1)(k + 2)},} \end{array}\tag{6.2.38}
$$

where $L_{2}(\phi)$ is given by (6.2.29).

Proof Indeed, in view of Theorem 6.2.3 and Lemma 6.2.8 we need only to justify that the sequences $\{\mu_{2, k}\}_{k = 0}^{\infty}$ and $\{\tau_{k}\}_{k = 0}^{\infty}$ satisfy relation (6.2.36). This is straightforward because of the following relation:

$$
\begin{array}{r}{\mu_{2, k} = \frac{4L_{2}(\phi)}{(k + 1)(k + 2)},} \end{array}
$$

which is valid for all $k \geq 0$ . □

Let us conclude this section with an example. Consider the problem

$$
f(\boldsymbol{x}) = \frac{1}{2} \| \boldsymbol{x} \|_{\mathbb{E}_{1}}^{2} + \operatorname{max}_{1 \leq j \leq m}[f_{j} + \langle g_{j}, \boldsymbol{x} - \boldsymbol{x}_{j} \rangle_{\mathbb{E}_{1}}] \quad \to \quad \operatorname{min} : \ \boldsymbol{x} \in \mathbb{E}_{1}.\tag{6.2.39}
$$

Let $\mathbb{E}_{1} = \mathbb{R}^{n}$ and choose

$$
\| x \|_{1}^{2} = \sum_{i = 1}^{n}(x^{(i)})^{2}, \quad x \in \mathbb{E}_{1}.
$$

Then this problem can be solved by the method (6.2.37).

Indeed, we can represent the objective function in (6.2.39) in the form (6.2.2) using the following objects:

$$
\mathbb{E}_{2} = \mathbb{R}^{m}, \quad Q_{2} = \varDelta_{m} = \{u \in \mathbb{R}_{+}^{m} : \sum_{j = 1}^{m} u^{(j)} = 1\},
$$

$$
\begin{array}{r}{\hat{f}(x) = \frac 12 \| x \|_{1}^{2}, \quad \hat{\phi}(u) \ = \ \langle b, u \rangle_{\mathbb{E}_{2}}, \quad b^{(j)} \ = \ \langle g_{j}, x_{j} \rangle_{\mathbb{E}_{1}} - f_{j}, \j = 1, \ldots, m,} \end{array}
$$

$$
A^{T} =(g_{1}, \dotsc, g_{m}).
$$

Thus, $\hat{\sigma} = 1$ and $L_{2}(\hat{\phi}) = 0$ . Let us choose for $\mathbb{E}_{2}$ the following norm:

$$
\| u \|_{\mathbb{E}_{2}} = \sum_{j = 1}^{m} | u^{(j)} |.
$$

Then we can use the entropy distance function,

$$
\begin{array}{r}{d_{2}(u) = \ln m + \displaystyle \sum_{j = 1}^{m} u^{(j)} \ln u^{(j)}, \quad u_{0} =(\frac{1}{m}, \ldots, \frac{1}{m}),} \end{array}
$$

for which the convexity parameter is one and $D_{2} = \ln m$ . Note that in this case

$$
\| A \|_{1, 2} = \operatorname{max}_{1 \leq j \leq m} \| g_{j} \|_{1}^{*}.
$$

Thus, method (6.2.37) as applied to problem (6.2.39) converges with the following rate:

$$
\begin{array}{r}{f(\bar{x}_{k}) - \phi(\bar{u}_{k}) \leq \frac{4 \ln m}{(k + 1)(k + 2)} \cdot \displaystyle \operatorname{max}_{1 \leq j \leq m} \left(\| g_{j} \|_{1}^{*} \right)^{2}.} \end{array}
$$

Let us study the complexity of method (6.2.37) for our example. At each iteration, we need to compute the following objects.

1. Computation of $u_{\mu_{2}}(\bar{x})$ . This is the solution of the following problem:

$$
\operatorname{max}_{u} \left\{\sum_{j = 1}^{m} u^{(j)} s^{(j)}(\bar{x}) - \mu_{2} d_{2}(u) : u \in Q_{2} \right\}
$$

with $s^{(j)}(\bar{x}) = f_{j} + \langle g_{j}, \bar{x} - x_{j} \rangle, j = 1, \ldots, m$ . As we have seen several times, this solution can be found in a closed form:

$$
u_{\mu_{2}}^{(j)}(\bar{x}) = e^{s^{(j)}(\bar{x}) / \mu_{2}} \cdot \left[\sum_{l = 1}^{m} e^{s^{(l)}(\bar{x}) / \mu_{2}} \right]^{- 1}, \quad j = 1, \dots, m.
$$

2. Computation of $x_{0}(\hat{u})$ . In our case, this is a solution to the problem

$$
\operatorname{min}_{x} \left\{\langle Ax, \hat{u} \rangle_{\mathbb{E}_{2}} + \frac{1}{2} \| x \|_{\mathbb{E}_{1}}^{2} : \x \in \mathbb{E}_{1} \right\}.
$$

Hence, the answer is very simple: $\boldsymbol{x}_{0}(\hat{\boldsymbol{u}}) = - \boldsymbol{A}^{T} \hat{\boldsymbol{u}}$

3. Computation of $V(\hat{u})$ . In our case,

$$
\begin{array}{l}{\displaystyle \phi(\bar{u}) = \displaystyle \operatorname{min}_{x \in \mathbb{E}_{1}} \left\{\sum_{j = 1}^{m} u^{(j)}[f_{j} + \langle g_{j}, x - x_{j} \rangle_{\mathbb{E}_{1}}] + \frac{1}{2} \| x \|_{\mathbb{E}_{1}}^{2} \right\}} \\{\displaystyle = - \langle b, u \rangle_{\mathbb{E}_{2}} - \frac{1}{2} \left(\| A^{T} \hat{u} \|_{\mathbb{E}_{1}}^{*} \right)^{2}.} \end{array}
$$

Thus, $\nabla \phi(\bar{u}) = - b - AA^{T} \hat{u}$ . Now we can compute $V(\hat{u})$ by (6.2.33). It can be easily shown that the complexity of finding $V(\hat{u})$ is of the order O(m ln m), which comes from the necessity to sort the components of a vector in $\mathbb{R}^{m}$

Thus, we have seen that all computations at each iteration of method (6.2.37) as applied to problem (6.2.39) are very cheap. The most expensive part of the iteration is the multiplication of matrix A by a vector. In a straightforward implementation, we need three such multiplications per iteration. However, a simple modification of the order of operations can reduce this amount to two.

## 6.3 The Smoothing Technique in Semidefinite Optimization

(Smooth symmetric functions of eigenvalues; Minimizing the maximal eigenvalue of a symmetric matrix.)

## 6.3.1 Smooth Symmetric Functions of Eigenvalues

In Sects. 6.1 and 6.2, we have shown that a proper use of the structure of nonsmooth convex optimization problems leads to very efficient gradient schemes, whose performance is significantly better than the lower complexity bounds derived from the Black Box assumptions. However, this observation leads to implementable algorithms only if we are able to form a computable smooth approximation of the objective function of our problem. In this case, applying to this approximation an optimal method (6.1.19) for minimizing smooth convex functions, we can easily obtain a good solution to our initial problem.

Our previous results are related mainly to piece-wise linear functions. In this section, we extend them to the problems of Semidefinite Optimization (SO).

For that, we introduce computable smooth approximation for one of the most important nonsmooth functions of symmetric matrices, its maximal eigenvalue. Our approximation is based on entropy smoothing.

In what follows, we denote by $\mathbb{M}_{n}$ the space of real $n \ \times \n{\mathrm{- matrices}}$ , and by $\mathbb{S}_{n} \subset \mathbb{M}_{n}$ the space of symmetric matrices. $\mathbf{A}$ particular matrix is always denoted by a capital letter. In the spaces $\mathbb{R}^{n}$ and $\mathbb{M}_{n}$ we use the standard inner products

$$
\langle x, y \rangle = \sum_{i = 1}^{n} x^{(i)} y^{(i)}, \x, y \in \mathbb{R}^{n},
$$

$$
\langle X, Y \rangle_{F} = \sum_{i, j = 1}^{n} X^{(i, j)} Y^{(i, j)}, \X, Y \in \mathbb{M}_{n}.
$$

For $X \in \mathbb{S}_{n}$ , we denote by $\lambda(X) \in \mathbb{R}^{n}$ the vector of its eigenvalues. We assume that the eigenvalues are ordered in a decreasing order:

$$
\lambda^{(1)}(X) \geq \lambda^{(2)}(X) \geq \cdots \geq \lambda^{(n)}(X), \quad X \in \mathbb{S}_{n}.
$$

Thus, $\lambda_{\operatorname{max}}(X) = \lambda^{(1)}(X)$ . The notation $D(\lambda) \in \mathbb{S}_{n}$ is used for a diagonal matrix with vector $\lambda ~ \in ~ \mathbb{R}^{n}$ on the main diagonal. Note that any $X ~ \in ~ \mathbb{S}_{n}$ admits an eigenvalue decomposition

$$
X = U(X) D(\lambda(X)) U(X)^{T}
$$

with $U(X) U(X)^{T} = I_{n}$ , where $I_{n} \in \mathbb{S}_{n}$ is the identity matrix.

Let us mention some notations with different meanings for vectors and matrices. For a vector $\lambda \in \mathbb{R}^{n}$ , we denote by $| \lambda | \in \mathbb{R}^{n}$ the vector with entries $| \lambda^{(i)} |, i =$ $1, \ldots, n$ . The notation $\lambda^{k} \in \mathbb{R}^{n}$ is used for the vector with components $(\lambda^{(i)})^{k}$ $i = 1, \ldots, n$ . However, for $X \in \mathbb{S}_{n}$ we define

$$
| X | \stackrel{\mathrm{def}}{=} U(X) D(| \lambda(X) |) U(X)^{T} \succeq 0,
$$

and the notation $X^{k}$ is used for the standard matrix power. Since the power $k \geq 0$ does not change the ordering of nonnegative components, for any $X \succeq 0$ we have

$$
\lambda^{k}(X) = \lambda(X^{k}).\tag{6.3.1}
$$

Further, in $\mathbb{R}^{n}$ , we use a standard notation for $\ell_{p}{\mathrm{- norms}}$

$$
\| x \|_{(p)} = \left[\sum_{i = 1}^{n} | x^{(i)} |^{p} \right]^{1 / p}, \quad x \in \mathbb{R}^{n},
$$

where $p ~ \geq ~ 1$ , and $\| x \|_{(\infty)} ~ = ~ \operatorname{max}_{1 \leq i \leq n} | x^{(i)} |$ . The corresponding norms in $\mathbb{S}_{n}$ are introduced by

$$
\| X \|_{(p)} = \| \lambda(X) \|_{(p)} = \| \lambda(| X |) \|_{(p)}, \quad X \in \mathbb{S}_{n}.\tag{6.3.2}
$$

For $k \geq 1$ , consider the following function:

$$
\pi_{k}(X) = \langle X^{k}, I_{n} \rangle_{F} = \sum_{i = 1}^{n}(\lambda^{(i)}(X))^{k}, \quad X \in \mathbb{S}_{n}.
$$

Let us derive an upper bound for its second derivative. Note that this bound is nontrivial only for $k \geq 2$

The derivatives of this function along a direction $H \in \mathbb{S}_{n}$ are defined as follows:

$$
\langle \nabla \pi_{k}(X), H \rangle_{F} = k \langle X^{k - 1}, H \rangle_{F},
$$

$$
\langle \nabla^{2} \pi_{k}(X) H, H \rangle_{F} = k \sum_{p = 0}^{k - 2} \langle X^{p} HX^{k - 2 - p}, H \rangle_{F}.\tag{6.3.3}
$$

We need the following result.

Lemma 6.3.1 For any $p, q \ge 0;$ , and X, H from $\mathbb{S}_{n}$ we have

$$
\begin{array}{rcl}{{\langle X^{p} HX^{q} + X^{q} HX^{p}, H \rangle_{F}}} &{{\leq}} &{{2 \langle | X |^{p + q}, H^{2} \rangle_{F}}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{\leq 2 \ \langle \lambda^{p + q}(| X |), \lambda^{2}(| H |) \rangle.}} \end{array}\tag{6.3.4}
$$

Proof Indeed, let $\lambda = \lambda(X), D = D(\lambda), U = U(X)$ and $\hat{H} = U^{T} HU$ . Then

$$
\begin{array}{l}{{\langle X^{p} HX^{q} + X^{q} HX^{p}, H \rangle_{F} = \langle UD^{p} U^{T} HUD^{q} U^{T} + UD^{q} U^{T} HUD^{p} U^{T}, H \rangle_{F}}} \\{{\}} \\{{\}} \\{{\}} \\{{\displaystyle = \langle D^{p} \hat{H} D^{q} + D^{q} \hat{H} D^{p}, \hat{H} \rangle_{F}}} \\{{\}} \\{{\displaystyle = \sum_{i, j = 1}^{n}(\hat{H}^{(i, j)})^{2} \left((\lambda^{(i)})^{p}(\lambda^{(j)})^{q} +(\lambda^{(i)})^{q}(\lambda^{(j)})^{p} \right)}} \\{{\}} \\{{\displaystyle \leq \sum_{i, j = 1}^{n}(\hat{H}^{(i, j)})^{2} \left(| \lambda^{(i)} |^{p} | \lambda^{(j)} |^{q} + | \lambda^{(i)} |^{q} | \lambda^{(j)} |^{p} \right).}} \end{array}
$$

Note that for arbitrary non-negative values a and b we always have

$$
0 \leq(a^{p} - b^{p})(a^{q} - b^{q}) =(a^{p + q} + b^{p + q}) -(a^{p} b^{q} + a^{q} b^{p}).
$$

Thus, we can continue as follows:

$$
\begin{array}{l}{{\langle X^{p} HX^{q} + X^{q} HX^{p}, H \rangle_{F} \le \displaystyle \sum_{i, j = 1}^{n}(\hat{H}^{(i, j)})^{2} \left(| \lambda^{(i)} |^{p + q} + | \lambda^{(j)} |^{p + q} \right)}} \\{{\mathrm{}}} \\{{\mathrm{} = 2 \displaystyle \sum_{i, j = 1}^{n}(\hat{H}^{(i, j)})^{2} | \lambda^{(i)} |^{p + q} = 2 \langle D(| \lambda |)^{p + q} \hat{H}, \hat{H} \rangle_{F}}} \\{{\mathrm{}}} \\{{\mathrm{} = 2 \langle D^{p + q}(| \lambda |), \hat{H}^{2} \rangle_{F} = 2 \langle | X |^{p + q}, H^{2} \rangle_{F}.}} \end{array}
$$

Hence, we get the first inequality in (6.3.4). Further, by von Neumann’s inequality

$$
\langle | X |^{p + q}, H^{2} \rangle_{F} \ \leq \ \langle \lambda(| X |^{p + q}), \lambda(H^{2}) \rangle \stackrel{(6.3.1)}{=} \ \langle \lambda^{p + q}(| X |), \lambda^{2}(| H |) \rangle,
$$

and this proves the remaining part of (6.3.4).

Corollary 6.3.1 For any $k \geq 2,$ , we have

$$
\langle \nabla^{2} \pi_{k}(X) H, H \rangle_{F} \leq k(k - 1) \langle \lambda^{k - 2}(| X |), \lambda^{2}(| H |) \rangle.\tag{6.3.5}
$$

Proof For $k = 2$ , the bound is trivial. For $k \geq 3$ , in representation (6.3.3) we can k−2 unify the terms in the expression $\sum_{p = 0}^{} \langle X^{p} HX^{k - 2 - p}, H \rangle_{F}$ in symmetric pairs

$$
\langle X^{p} HX^{k - 2 - p} + X^{k - 2 - p} HX^{p}, H \rangle_{F}.
$$

Applying inequality (6.3.4) to each pair, we get the estimate (6.3.5).

Let $f(\cdot)$ be a function of a real variable, defined by a power series

$$
f(\tau) = a_{0} + \sum_{k = 1}^{\infty} a_{k} \tau^{k}
$$

with $a_{k} \geq 0$ for $k \geq 2$ . We assume that its domain dom $f = \{\tau : | \tau | < R\}$ is nonempty. For $X \in \mathbb{S}_{n}$ , consider the following symmetric function of eigenvalues:

$$
F(X) = \sum_{i = 1}^{n} f(\lambda^{(i)}(X)).
$$

Clearly, dom $F = \{X \in \mathbb{S}_{n} : \ \lambda^{(1)}(X) < R, \ \lambda^{(n)}(X) > - R\}$

Theorem 6.3.1 For any $X \in$ dom F and $H \in \mathbb{S}_{n}$ we have

$$
\langle \nabla^{2} F(X) H, H \rangle \leq \sum_{i = 1}^{n} \nabla^{2} f(\lambda^{(i)}(| X |))(\lambda^{(i)}(| H |))^{2}.
$$

Proof Indeed,

$$
\begin{array}{rcl}{{}} &{{}} &{{F(X) = n \cdot a_{0} + \displaystyle \sum_{i = 1}^{n} \sum_{k = 1}^{\infty} a_{k}(\lambda^{(i)}(X))^{k}}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{= n \cdot a_{0} + \displaystyle \sum_{k = 1}^{\infty} a_{k} \sum_{i = 1}^{n}(\lambda^{(i)}(X))^{k} ~ = ~ n \cdot a_{0} + \sum_{k = 1}^{\infty} a_{k} \pi_{k}(X).}} \end{array}
$$

Thus, in view of inequality (6.3.5),

$$
\begin{array}{l}{\langle \nabla^{2} F(X) H, H \rangle_{F} = \displaystyle \sum_{k = 2}^{\infty} a_{k} \langle \nabla^{2} \pi_{k}(X) H, H \rangle_{F}} \\{\displaystyle \qquad \leq \displaystyle \sum_{k = 2}^{\infty} k(k - 1) a_{k} \langle \lambda^{k - 2}(| X |), \lambda^{2}(| H |) \rangle} \\{\displaystyle \qquad = \displaystyle \sum_{i = 1}^{n} \displaystyle \sum_{k = 2}^{\infty} k(k - 1) a_{k}(\lambda^{(i)}(| X |))^{k - 2}(\lambda^{(i)}(| H |))^{2}} \\{\displaystyle \qquad = \displaystyle \sum_{i = 1}^{n} \nabla^{2} f(\lambda^{(i)}(| X |))(\lambda^{(i)}(| H |))^{2}.} \end{array}
$$

Let us consider now two important examples of symmetric functions of eigenvalues.

1. Squared $\ell_{p}$ -Matrix Norm. For an integer $p \ \geq \1$ , consider the following function:

$$
\begin{array}{r}{F_{p}({\cal X}) = \frac{1}{2} \| \lambda({\cal X}) \|_{(2p)}^{2} = \frac{1}{2} \langle{\cal X}^{2p}, I_{n} \rangle_{F}^{1 / p}, \quad{\cal X} \in \mathbb{S}_{n}.} \end{array}\tag{6.3.6}
$$

Thus, $F_{p}(X) ={\textstyle \frac{1}{2}}(\pi_{2p}(X))^{1 / p}$ . Therefore, in view of (6.3.5), for any X, $H \in \mathbb{S}_{n}$ we have

$$
\begin{array}{r}{\langle \nabla F_{p}(X), H \rangle_{F} = \frac{1}{2p}(\pi_{2p}(X))^{\frac{1}{p} - 1} \langle \nabla \pi_{2p}(X), H \rangle_{F},} \end{array}
$$

$$
\begin{array}{rl} &{\langle \nabla^{2} F_{p}(X) H, H \rangle_{F} = \frac{1}{2p} \cdot \left(\frac{1}{p} - 1 \right) \cdot(\pi_{2p}(X))^{\frac{1}{p} - 2} \langle \nabla \pi_{2p}(X), H \rangle_{F}^{2}} \\ &{\qquad + \frac{1}{2p}(\pi_{2p}(X))^{\frac{1}{p} - 1} \langle \nabla^{2} \pi_{2p}(X) H, H \rangle_{F}} \\ &{\qquad \leq(2p - 1)(\pi_{2p}(X))^{\frac{1}{p} - 1} \langle \lambda^{2p - 2}(| X |), \lambda^{2}(| H |) \rangle.} \end{array}\tag{6.3.7}
$$

Let us apply Hölder’s inequality $\langle x, y \rangle \leq \| x \|_{(\beta)} \| y \|_{(\gamma)}$ with $\begin{array}{r}{\beta = \frac{p}{p - 1}, \gamma = \frac{\beta}{\beta - 1} =} \end{array}$ $p,$ , and

$$
x^{(i)} =(\lambda^{(i)}(\vert X \vert))^{2p - 2}, \quad y^{(i)} =(\lambda^{(i)}(\vert H \vert))^{2}, \quad i = 1, \ldots, n.
$$

Then,

$$
\begin{array}{rlr}{\langle x, y \rangle} &{\le} &{\left[\displaystyle \sum_{i = 1}^{n}(\lambda^{(i)}(| X |))^{2p} \right]^{\frac{p - 1}{p}} \cdot \left[\displaystyle \sum_{i = 1}^{n}(\lambda^{(i)}(| H |))^{2p} \right]^{\frac{1}{p}}} \end{array}
$$

$$
\stackrel{(6.3.2)}{=} \pi_{2p}(X) \stackrel{p - 1}{^p} \cdot \| \lambda(H) \|_{(2p)}^{2},
$$

and we can continue:

$$
\langle \nabla^{2} F_{p}(X) H, H \rangle_{F} \leq(2p - 1) \| \lambda(H) \|_{(2p)}^{2} =(2p - 1) \| H \|_{(2p)}^{2}.\tag{6.3.8}
$$

2. Entropy Smoothing of Maximal Eigenvalue. Consider the function

$$
E(X) = \ln \sum_{i = 1}^{n} e^{\lambda^{(i)}(X)} \{\stackrel{\mathrm{def}}{=}} \ \ln F(X), \quad X \in \mathbb{S}_{n}.\tag{6.3.9}
$$

Note that

$$
\begin{array}{r}{\langle \nabla E(X), H \rangle_{F} = \frac{1}{F(X)} \langle \nabla F(X), H \rangle_{F},} \end{array}
$$

$$
\begin{array}{rl} &{\langle \nabla^{2} E(X) H, H \rangle_{F} = - \frac{1}{F^{2}(X)} \langle \nabla F(X), H \rangle_{F}^{2} + \frac{1}{F(X)} \langle \nabla^{2} F(X) H, H \rangle_{F}} \\ &{} \\ &{\qquad \leq \frac{1}{F(X)} \langle \nabla^{2} F(X) H, H \rangle_{F}.} \end{array}
$$

Let us assume first that $X ~ \succeq ~ 0$ . The function $F(X)$ is formed by the auxiliary function $f(\tau) = e^{\tau}$ , which satisfies the assumptions of Theorem 6.3.1. Therefore,

$$
\langle \nabla^{2} E(X) H, H \rangle_{F} \leq \left[\sum_{i = 1}^{n} e^{\lambda^{(i)}(X)} \right]^{- 1} \sum_{i = 1}^{n} e^{\lambda^{(i)}(X)}(\lambda^{(i)}(| H |))^{2} \ \leq \ \| H \|_{(\infty)}^{2}.\tag{6.3.10}
$$

It remains to note that $E(X + \tau I_{n}) = E(X) + \tau$ . Hence, the Hessian ${\nabla}^{2} E(X +$ $\tau I_{n})$ does not depend on τ , and we conclude that the estimate (6.3.10) is valid for arbitrary $X \in \mathbb{S}_{n}$

## 6.3.2 Minimizing the Maximal Eigenvalue of the Symmetric Matrix

Consider the following problem:

$$
\displaystyle \mathrm{Find} \phi^{*} ~ = ~ \operatorname{min}_{y \in Q} \{\phi(y) ~ \stackrel{\mathrm{def}}{=} ~ \lambda_{\mathrm{max}}(C + A(y))\},\tag{6.3.11}
$$

where $Q$ is a closed convex set in $\mathbb{R}^{m}$ and $A(\cdot)$ is a linear operator from $\mathbb{R}^{m}$ to $\mathbb{S}_{n}$ :

$$
A(y) = \sum_{i = 1}^{m} y^{(i)} A_{i} \in \mathbb{S}_{n}, \quad y \in \mathbb{R}^{m}.
$$

Note that the objective function in (6.3.11) is nonsmooth. Therefore, this problem can be solved either by interior-point methods (see Chap. 5), or by general methods of nonsmooth convex optimization (see Chap. 3). However, due to the very special structure of the objective function, for problem (6.3.11) it is better to develop a special scheme.

We are going to solve problem (6.3.11) by a smoothing technique discussed in Sect. 6.1. This means that we replace the function $\lambda_{\operatorname{max}}(X)$ by its smooth approximation $f_{\mu}(X) \ = \ \mu E(\frac{1}{\mu} X)$ , defined by (6.3.9) with tolerance parameter $\mu > 0$ . Note that

$$
f_{\mu}(X) = \mu \ln \left[\sum_{i = 1}^{n} e^{\lambda^{(i)}(X) / \mu} \right] \geq \lambda_{\operatorname{max}}(X),\tag{6.3.12}
$$

$$
f_{\mu}(X) \leq \lambda_{\mathrm{max}}(X) + \mu \ln n.
$$

At the same time,

$$
\nabla f_{\mu}(X) = \left[\sum_{i = 1}^{n} e^{\lambda^{(i)}(X) / \mu} \right]^{- 1} \cdot \sum_{i = 1}^{n} e^{\lambda^{(i)}(X) / \mu} u_{i}(X) u_{i}(X)^{T},\tag{6.3.13}
$$

where $u_{i}(X), i = 1, \dots, n$ , are corresponding unit eigenvectors of the symmetric matrix X. Thus, at each test point $X,$ , the gradient $\nabla f_{\mu}(X)$ takes into account all eigenvalues of the matrix X. However, since the factors $e^{\lambda^{(i)}(X) / \mu}$ decrease very rapidly, it actually depends only on few largest eigenvalues. Their selection is made automatically by expression (6.3.13). The ranking of importance of the eigenvalues is done in a logarithmic scale controlled by the tolerance parameter $\mu.$

Let us analyze now the efficiency of the smoothing technique as applied to problem (6.3.11). Our goal is to find an $\epsilon$-solution ${\bar{x}} \in Q$ to problem (6.3.11):

$$
\phi({\bar{y}}) - \phi^{*} \leq \epsilon.\tag{6.3.14}
$$

For that, we will try to find a $\scriptstyle{\frac{1}{2}} \epsilon$ -solution to the smooth problem

$$
\displaystyle \mathrm{Find} \phi_{\mu}^{*} = \operatorname{min}_{y \in Q} \{\phi_{\mu}(y) \{\stackrel{\mathrm{def}}{=}} \f_{\mu}(C + A(y))\},\tag{6.3.15}
$$

with

$$
\textstyle \mu = \mu(\epsilon) ={\frac{\epsilon}{2 \ln n}}.\tag{6.3.16}
$$

Clearly, if $\begin{array}{r}{\phi_{\mu}(\bar{y}) - \phi_{\mu}^{*} \leq \frac{1}{2} \epsilon} \end{array}$ , then in view of (6.3.12) we have

$$
\phi(\bar{y}) - \phi^{*} \leq \phi_{\mu}(\bar{y}) - \phi_{\mu}^{*} + \mu \ln n \leq \epsilon.
$$

Let us analyze now the complexity of finding a $\frac{1}{2} \epsilon \mathrm{- solution}$ to problem (6.3.15) by the optimal method (6.1.19).

Let us fix some norm h for $h \in \mathbb{R}^{m}$ . Consider a prox-function $d(\cdot)$ of the set $Q$ with prox-center $x_{0} \in{\cal Q}$ . We assume this function to be strongly convex on $Q$ with convexity parameter one. Define

$$
\| A \| = \operatorname{max}_{h \in \mathbb{R}^{m}} \{\| A(h) \|_{(\infty)} : \| h \| = 1\}.
$$

Note that this norm is quite small. Indeed,

$$
\| A(h) \|_{(\infty)} = \lambda^{(1)}(| A(h) |) \ \leq \ \langle A(h), A(h) \rangle_{F}^{1 / 2}, \quad h \in \mathbb{R}^{m}.
$$

Therefore, for example, $\| A \| \leq \| A \|_{G} \{\stackrel{\mathrm{def}}{=}} \ \operatorname{max}_{\| h \| = 1} \left.A(h), A(h) \right._{F}^{1 / 2}.$

Let us estimate the second derivative of the function $\phi_{\mu}(\cdot)$ . For any y and h from $\mathbb{R}^{m}$ , in view of inequality (6.3.10) we have

$$
\langle \nabla \phi_{\mu}(y), h \rangle = \langle \nabla f_{\mu}(C + A(y)), h \rangle \ = \ \langle \nabla E(\textstyle{\frac{1}{\mu}}(C + A(y))), A(h) \rangle_{F},
$$

$$
\begin{array}{rlr} &{} &{\langle \nabla^{2} \phi_{\mu}(y) h, h \rangle = \frac{1}{\mu} \langle \nabla^{2} E(C + A(y)) A(h), A(h) \rangle_{F}} \\ &{} & \\ &{} &{\leq \frac{1}{\mu} \| A(h) \|_{(\infty)}^{2} \leq \frac{1}{\mu} \| A \|^{2} \cdot \| h \|^{2}.} \end{array}
$$

Thus, by Theorem 6.1.1 the function $\phi_{\mu}$ has Lipschitz continuous gradient with the constant

$$
\begin{array}{r}{L = \frac{1}{\mu} \| A \|^{2} = \frac{2 \ln n}{\epsilon} \| A \|^{2}.} \end{array}
$$

Now taking into account the estimate (6.1.21), we conclude that the method (6.1.19), as applied to problem (6.3.15), has the following rate of convergence:

$$
\begin{array}{r}{\phi_{\mu}(y_{k}) - \phi_{\mu}^{*} \leq \frac{8 \ln n \| A \|^{2} d(y_{\mu}^{*})}{\epsilon \cdot(k + 1)(k + 2)},} \end{array}
$$

where $y_{\mu}^{\ast} \in \mathcal{Q}$ is the solution to (6.3.15). Hence, it is able to generate a $\frac{1}{2} \epsilon \mathrm{- solution}$ to this problem (which is an $\epsilon$-solution to problem (6.3.11)) at most after

$$
\begin{array}{r}{\frac{4 \| A \|}{\epsilon} \sqrt{d(y_{\mu}^{\ast}) \ln n}} \end{array}\tag{6.3.17}
$$

iterations.

## 6.4 Minimizing the Local Model of an Objective Function

(A linear optimization oracle; The method of conditional gradients; Conditional gradients with contraction; Computation of primal-dual solution; Strong convexity of the composite term; The second-order trust-region method with contraction.)

## 6.4.1 A Linear Optimization Oracle

In this section we consider numerical methods for solving the following composite minimization problem:

$$
\operatorname{min}_{x} \left\{\bar{f}(x) \{\stackrel{\mathrm{def}}{=}} \f(x) + \varPsi(x) \right\},\tag{6.4.1}
$$

where $\psi$ is a simple closed convex function with bounded domain $Q \subset \mathbb{E}.$ and $f$ is a convex function, which is differentiable on $Q.$ . Denote by $x^{*}$ one of the optimal solutions of (6.4.1), and $D \{\stackrel{\mathrm{def}}{=}}$ diam(Q). As usual, our assumption on the simplicity of the function Ψ means that some auxiliary optimization problems related to Ψ are easily solvable. The complexity of these problems will be always discussed for corresponding optimization schemes.

The most important examples of the function $\psi$ are as follows.

$\psi$ is an indicator function of a closed convex set $Q{\mathrm{:}}$

$$
\psi(x) = \mathrm{Ind}_{\mathcal{Q}}(x) \ \stackrel{\mathrm{def}}{=} \ \left\{\begin{array}{c}{0, x \in \mathcal{Q},} \\{+ \infty, \mathrm{otherwise}.} \end{array} \right.\tag{6.4.2}
$$

- $\psi$ is a self-concordant barrier for a closed convex set $Q$ (see Sect. 5.3).

$\psi$ is a nonsmooth convex function with simple structure. In this case, we need to include in $\psi$ an indicator function for a bounded domain. For example, it

could be

$$
\psi(x) = \left\{\begin{array}{ll}{\| x \|_{(1)}, \mathrm{{if}} \ \| x \|_{(1)} \le R,} \\{\quad + \infty, \mathrm{{otherwise}}.} \end{array} \right.
$$

We assume that the function f is represented by a Black-Box oracle. If it is a first-order oracle, we assume its gradients satisfy the following Hölder condition:

$$
\| \nabla f(x) - \nabla f(y) \|_{*} \leq G_{\nu} \| x - y \|^{\nu}, \quad x, y \in Q.\tag{6.4.3}
$$

The constant $G_{\nu}$ is formally defined for any $\nu \in(0, 1]$ . For some values of ν it can be $+ \infty$ . Note that for any x and y in $Q$ we have

$$
\begin{array}{r}{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{G_{\nu}}{1 + \nu} \| y - x \|^{1 + \nu}.} \end{array}\tag{6.4.4}
$$

If this is a second-order oracle, we assume that its Hessians satisfy the Hölder condition

$$
\| \nabla^{2} f(x) - \nabla^{2} f(y) \| \leq H_{\nu} \| x - y \|^{\nu}, \quad x, y \in Q.\tag{6.4.5}
$$

In this case, for any x and y in Q we have

$$
\begin{array}{r}{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle + \frac{H_{\nu} \| y - x \|^{2 + \nu}}{(1 + \nu)(2 + \nu)}.} \end{array}\tag{6.4.6}
$$

Our assumption on the simplicity of the function Ψ means exactly the following. Assumption 6.4.1 For any $s \in \mathbb{E}^{*}$ , the auxiliary problem

$$
\operatorname{min}_{x \in Q} \left\{\langle s, x \rangle + \varPsi(x) \right\}\tag{6.4.7}
$$

is easily solvable. Denote by $v_{\varPsi} \left(s \right) \in Q$ one of its optimal solutions.

Thus, for our methods we assume that we can use a linear optimization oracle, related to the set $Q.$ . Indeed, in the case (6.4.2), this assumption implies that we are able to solve the problem

$$
\operatorname{min}_{x} \{\langle s, x \rangle : x \in Q\}.
$$

For some sets (e.g. convex hulls of finite number of points), this oracle has lower complexity than the standard auxiliary problem consisting in minimizing a proxfunction plus a linear term (see, for example, Sect. 6.1.3).

In view of Theorem 3.1.23 the point $v_{\varPsi} \left(s \right)$ is characterized by the following variational principle:

$$
\langle s, x - v_{\psi}(s) \rangle + \psi(x) \geq \psi(v_{\psi}(s)), \quad x \in \mathcal{Q}.\tag{6.4.8}
$$

By Definition 3.1.5, this means that $- s \in \partial \varPsi(v \psi(s))$ .

In the sequel, we often need to estimate the partial sums of different series. For that, it is convenient to use the following lemma, the proof of which we leave as an exercise for the reader.

Lemma 6.4.1 Let the function $\xi(\tau), \tau \in \mathbb{R},$ , be decreasing and convex. Then, for any two integers a and b, such that $[a -{\frac{1}{2}}, b + 1] \subset$ dom ξ, we have

$$
\begin{array}{r}{\overset{b + 1}{\underset{a}{\int}} \xi(\tau) d \tau \ \leq \ \overset{b}{\underset{k = a}{\sum}} \xi(k) \leq \overset{b + 1 / 2}{\underset{a - 1 / 2}{\int}} \xi(\tau) d \tau.} \end{array}\tag{6.4.9}
$$

For example, for any $t \geq 0$ and $p \geq - t$ , we have

$$
\begin{array}{rcl}{{\displaystyle \sum_{k = t}^{2t + p} \frac{1}{k + p + 1} \stackrel{(5.4.38)}{\geq} \int_{t}^{t + p + 1} \frac{1}{\tau + p + 1} d \tau \ = \ \ln(\tau + p + 1) \Big \vert_{t}^{2t + p + 1}}} \\{{\}} &{{\}} &{{\}} \\{{\displaystyle =\}} &{{\ln \frac{2t + 2p + 2}{t + p + 1} \ = \ \ln 2.}} \end{array}\tag{6.4.10}
$$

On the other hand, if $t \geq 1$ , then

$$
\begin{array}{rcl}{{\displaystyle \sum_{k = t}^{2t + 1} \frac{1}{(k + 2)^{2}} \stackrel{(5.4.38)}{\leq} \int_{t - 1 / 2}^{2} \frac{1}{(\tau + 2)^{2}} d \tau = - \frac{1}{\tau + 2} \Big |_{t - 1 / 2}^{2t + 3 / 2} = \frac{1}{t + 3 / 2} - \frac{1}{2t + 7 / 2}}} \\{{}} &{{}} &{{}} \\{{=}} &{{\frac{4t + 8}{(2t + 3)(4t + 7)} \leq \frac{12}{11(2t + 3)}.}} \end{array}\tag{6.4.11}
$$

## 6.4.2 The Method of Conditional Gradients with Composite Objective

In order to solve problem (6.4.1), we apply the following method.

Conditional Gradients with Composite Objective

1. Choose an arbitrary point $x_{0} \in Q$

(6.4.12)

2. For $t \geq 0$ iterate: (a) Compute $v_{t} = v_{\varPsi}(\nabla f(x_{t}))$

(b) Choose $\tau_{t} \in(0, 1]$ and set $x_{t + 1} =(1 - \tau_{t}) x_{t} + \tau_{t} v_{t}.$

It is clear that this method can solve only problems where the function f has continuous gradient.

Example 6.4.1 Let $\psi(x) ={\mathrm{Ind}}_{Q}(x)$ with $Q = \{x \in \mathbb{R}^{2} : ~(x^{(1)})^{2} +(x^{(2)})^{2} \leq 1\}$ Define

$$
f(x) = \operatorname{max} \{x^{(1)}, x^{(2)}\}.
$$

Then clearly $\begin{array}{r}{x_{*} = \left(\frac{- 1}{\sqrt{2}}, \frac{- 1}{\sqrt{2}} \right)^{T}} \end{array}$ . Let us choose in $(6.4.12) x_{0} \neq x_{*}$

For the function $f_{:}$ , we can apply an oracle which returns at any $x \in \Q$ a subgradient $\nabla f(x) ~ \in ~ \{(1, 0)^{T},(0, 1)^{T}\}$ . Then, for any feasible x, the point $v_{\varPsi}(\nabla f(x))$ is equal either to $y_{1} =(- 1, 0)^{T}$ , or to $y_{2} =(0, - 1)^{T}$ . Therefore, all points of the sequence $\{x_{t}\}_{t \ge 0}$ , generated by method (6.4.12), belong to the triangle $\mathrm{Conv} \{x_{0}, y_{1}, y_{2}\}$ , which does not contain the optimal point $x_{*}$ . □

In order to justify the rate of convergence of method (6.4.12) for functions with Hölder continuous gradients, we apply a variant of the estimating sequences technique (see Sects. 2.2.1 and 6.1.3). For that, it is convenient to introduce in (6.4.12) new control variables. Consider a sequence of nonnegative weights $\{a_{t}\}_{t \ge 0}$ . Define

$$
A_{t} = \sum_{k = 0}^{t} a_{k}, \quad \tau_{t} = \frac{a_{t + 1}}{A_{t + 1}}, \quad t \geq 0.\tag{6.4.13}
$$

From now on, we assume that the parameter $\tau_{t}$ in method (6.4.12) is chosen in accordance with the rule (6.4.13). Define

$$
V_{0} = \operatorname{max}_{x} \left\{\langle \nabla f(x_{0}), x_{0} - x \rangle + \varPsi(x_{0}) - \varPsi(x) \right\},
$$

$$
B_{\nu, t} = a_{0} V_{0} + \left(\sum_{k = 1}^{t} \frac{a_{k}^{1 + \nu}}{A_{k}^{\nu}} \right) G_{\nu} D^{1 + \nu}, \quad t \geq 0.\tag{6.4.14}
$$

It is clear that

$$
\begin{array}{rlr}{V_{0} \stackrel{(6.4.6)}{\leq} \operatorname{max}_{x} \Big \{f(x_{0}) - f(x) + \frac{G_{\nu}}{1 + \nu} \| x - x_{0} \|^{1 + \nu} + \psi(x_{0}) - \psi(x) \Big\}} &{} & \\{\quad} &{} & \\{\leq} &{\bar{f}(x_{0}) - \bar{f}(x_{*}) + \frac{G_{\nu} D^{1 + \nu}}{1 + \nu} \stackrel{\mathrm{def}}{=} \Delta(x_{0}) + \frac{G_{\nu} D^{1 + \nu}}{1 + \nu}.} &{} & \end{array}\tag{6.4.15}
$$

Theorem 6.4.1 Let the sequence $\{x_{t}\}_{t \ge 0}$ be generated by method (6.4.12). Then, for any $\nu \in(0, 1]$ with $G_{\nu} < + \infty,$ , any step $t \geq 0$ , and any $x \in Q$ we have

$$
A_{t}(f(x_{t}) + \psi(x_{t})) \leq \sum_{k = 0}^{t} a_{k}[f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \psi(x)] + B_{\nu, t}.\tag{6.4.16}
$$

Proof Indeed, in view of definition (6.4.14), for $t ~ = ~ 0$ inequality (6.4.16) is satisfied. Assume that it is valid for some $t \geq 0$ . Then

$$
\begin{array}{rl} &{\frac{t + 1}{\xi} = \alpha t \{f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \Psi(x)\} + B_{0, t}} \\ &{+ \alpha t} \\ &{\overset{\mathrm{(i.d.l.)}}{\le} A_{\xi}(f(x_{l}) + \psi(x_{k})) + a_{t + 1}[f(x_{t + 1}) + \langle \nabla f(x_{t + 1}), x - x_{t + 1} \rangle + \psi(x)]} \\ &{\overset{}{\le} A_{t + 1} f(x_{t + 1}) + A_{t} \psi(x_{t}) + \langle \nabla f(x_{t + 1}), a_{t + 1}(x - x_{t + 1}) + A_{t}(x_{t} - x_{t + 1}) \rangle} \\ &{\quad + a_{t + 1} \psi(x)} \\ &{\overset{}{\le} A_{t + 1} \frac{1}{2}{b} A_{t + 1} f(x_{t + 1}) + A_{t} \psi(x_{t}) + a_{t + 1}[\psi(x) + \{\nabla f(x_{t + 1}), x - v_{t}\}]} \\ &{\overset{(i.d.l)}{\le} A_{\xi + 1}(f(x_{t + 1}) + \psi(x_{t})) + a_{t + 1}[\psi(x) - \psi(v_{t}) + \langle \nabla f(x_{t + 1}), x - v_{t} \rangle]} \\ &{\overset{(i.d.l)}{\le} A_{\xi + 1} \{f(x_{t + 1}) + \psi(x_{t + 1})\} + a_{t + 1}[\psi(x) - \psi(v_{t}) + \langle \nabla f(x_{t + 1}), x - v_{t} \rangle].} \end{array}
$$

It remains to note that

$$
\begin{array}{rl} &{\psi(x) - \psi(v_{t}) + \langle \nabla f(x_{t + 1}), x - v_{t} \rangle \overset{(6.4, 8)}{\geq} \langle \nabla f(x_{t + 1}) - \nabla f(x_{t}), x - v_{t} \rangle} \\ &{\qquad \quad \stackrel{(6.4, 3)}{\geq} - \tau_{t}^{\nu} G_{\nu} D^{1 + \nu}.} \end{array}
$$

Thus, to ensure that (6.4.16) is valid for the next iteration, it is enough to choose

$$
\begin{array}{r}{B_{\nu, t + 1} = B_{\nu, t} + \frac{a_{t + 1}^{1 + \nu}}{A_{t + 1}^{\nu}} G_{\nu} D^{1 + \nu}.\qquad \perp} \end{array}
$$

Corollary 6.4.1 For any $t \geq 0$ with $A_{t} > 0;$ , and any $\nu \in(0, 1]$ , we have

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \le \frac{1}{A_{t}} B_{\nu, t}.} \end{array}\tag{6.4.17}
$$

Let us discuss now the possible variants for choosing the weights $\{a_{t}\}_{t \ge 0}$

1. Constant weights. Let us choose $a_{t} ~ \equiv ~ 1, ~ t ~ \geq ~ 0$ . Then $\boldsymbol{A}_{t} ~ = ~ \boldsymbol{t} + \boldsymbol{1}$ , and for $\nu \in(0, 1)$ we have

$$
\begin{array}{rcl}{\displaystyle B_{\nu, t}} &{=} &{\displaystyle V_{0} + \left(\sum_{k = 1}^{t} \frac{1}{(1 + k)^{\nu}} \right) G_{\nu} D^{1 + \nu}} \\ & &{\displaystyle \stackrel{(6.49)}{\leq}} &{\displaystyle V_{0} + G_{\nu} D^{1 + \nu} \frac{1}{1 - \nu}(1 + \tau)^{1 - \nu} \Big |_{1 / 2}^{t + 1 / 2}} \\ & &{\displaystyle \stackrel{(6.4.15)}{\leq} \varDelta(x_{0}) + G_{\nu} D^{1 + \nu} \left[\frac{1}{1 + \nu} + \left(\frac{3}{2} \right)^{1 - \nu} \frac{1}{1 - \nu} \left(\left(1 + \frac{2}{3} t \right)^{1 - \nu} - 1 \right) \right].} \end{array}
$$

Thus, for $\nu \in(0, 1)$ , we have $\begin{array}{r}{\frac{1}{A_{t}} B_{\nu, t} \ \leq \O(t^{- \nu})} \end{array}$ . For the most important case $\nu = 1$ , we have lim $\begin{array}{r}{\frac{1}{1 - \nu} \left(\left(1 + \frac{2}{3} t \right)^{1 - \nu} - 1 \right) = \ln(1 + \frac{2}{3} t)} \end{array}$ . Therefore, ν 1

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{1}{t + 1} \left(\varDelta(x_{0}) + G_{1} D^{2} \left[\frac{1}{2} + \ln(1 + \frac{2}{3} t) \right] \right).} \end{array}\tag{6.4.18}
$$

In this situation, in method (6.4.12) we take $\tau_{t} \stackrel{(6.4.13)}{=} \frac{1}{t + 1}$

2. Linear weights. Let us choose $a_{t} \equiv t, t \geq 0$ . Then $\begin{array}{r}{A_{t} = \frac{t(t + 1)}{2}} \end{array}$ , and for $\nu \in(0, 1)$ with $t \geq 1$ we have

$$
\begin{array}{rcl}{{B_{\nu, t}}} &{{=}} &{{\left(\displaystyle \sum_{k = 1}^{t} \frac{2^{\nu} k^{1 + \nu}}{k^{\nu}(1 + k)^{\nu}} \right) G_{\nu} D^{1 + \nu} ~ \le ~ \left(\displaystyle \sum_{k = 1}^{t} 2^{\nu} k^{1 - \nu} \right) G_{\nu} D^{1 + \nu}}} \end{array}
$$

$$
\begin{array}{rlr}{{\stackrel{(6.4.9)}{\leq} G_{\nu} D^{1 + \nu} \frac{2^{\nu}}{2 - \nu} \tau^{2 - \nu}{\Big |}_{1 / 2}^{t + 1 / 2} = \frac{2^{\nu}}{2 - \nu}[(t + \frac{1}{2})^{2 - \nu} -(\frac{1}{2})^{2 - \nu}] G_{\nu} D^{1 + \nu}.}} \end{array}
$$

Thus, for $\nu \in(0, 1)$ , we again have $\begin{array}{r}{\frac{1}{A_{t}} B_{\nu, t} \le O(t^{- \nu})} \end{array}$ . For the case $\nu = 1$ , we get the following bound:

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{4}{t + 1} G_{1} D^{2}, \quad t \geq 1.} \end{array}\tag{6.4.19}
$$

As we can see, this rate of convergence is better than (6.4.18). In this case, in method (6.4.12) we take $\tau_{t} \stackrel{(6.4.13)}{=} \frac{2}{t + 2}$ , which is a standard recommendation for this scheme.

3. Aggressive weights. Let us choose, for example, $a_{t} \equiv t^{2}, t \geq 0$ . Then $A_{t} \ =$ $\frac{t(t + 1)(2t + 1)}{c}$ . Note that for $k \geq 0$ we have $\begin{array}{r}{\frac{k^{2 + \nu}}{(k + 1)^{\nu}(2k + 1)^{\nu}} \leq \frac{k^{2 - \nu}}{2^{\nu}}} \end{array}$ . Therefore, for 6 $\nu \in(0, 1)$ with $t \geq 1$ we obtain

$$
\begin{array}{rcl}{{B_{\nu, t}}} &{{=}} &{{\displaystyle \left(\sum_{k = 1}^{t} \frac{6^{\nu} k^{2(1 + \nu)}}{k^{\nu}(1 + k)^{\nu}(2k + 1)^{\nu}} \right) G_{\nu} D^{1 + \nu} ~ \leq ~ \left(\sum_{k = 1}^{t} 3^{\nu} k^{2 - \nu} \right) G_{\nu} D^{1 + \nu}}} \end{array}
$$

$$
\begin{array}{rlr}{{\stackrel{(6.4.9)}{\leq} G_{\nu} D^{1 + \nu} \frac{3^{\nu}}{3 - \nu} \tau^{3 - \nu}{\Big |}_{1 / 2}^{t + 1 / 2} = \frac{3^{\nu}}{3 - \nu}[(t + \frac{1}{2})^{3 - \nu} -(\frac{1}{2})^{3 - \nu}] G_{\nu} D^{1 + \nu}.}} \end{array}
$$

For $\nu \in(0, 1)$ , we get again $\begin{array}{r}{\frac{1}{A_{t}} B_{\nu, t} \le O(t^{- \nu})} \end{array}$ . For $\nu = 1$ , we obtain

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{9}{2t + 1} G_{1} D^{2}, \quad t \geq 1,} \end{array}\tag{6.4.20}
$$

which is slightly worse than (6.4.19). The rule for choosing the coefficients $\tau_{t}$ in this situation is $\tau_{t} \stackrel{(6.4.13)}{=} \frac{6(t{+} 1)}{(t{+} 2)(2t{+} 3)}$ . It can be easily checked that a further <sup>+ +</sup>increase of the rate of growth of coefficients $a_{t}$ makes the rate of convergence of method (6.4.12) even worse.

Note that the above rules for choosing the coefficients $\{\tau_{t}\}_{t \ge 0}$ in method (6.4.12) do not depend on the smoothness parameter $\nu \in(0, 1]$ . In this sense, method (6.4.12) is a universal method for solving the problem (6.4.1). Moreover, this method is affine invariant. Its behavior does not depend on the choice of norm in <sup>E</sup>. Hence, its rate of convergence can be established with respect to the best norm describing the geometry of the feasible set.

## 6.4.3 Conditional Gradients with Contraction

In this section, we will use some special dual functions. Let $Q \subset E$ be a bounded closed convex set. For a closed convex function $F(\cdot)$ with dom $F \supseteq$ int $Q.$ , we define its restricted dual function, (with respect to a central point ${\bar{x}} \in Q)$ , as follows:

$$
F_{\bar{x}, Q}^{*}(s) = \operatorname{max}_{x \in Q} \{\langle s,{\bar{x}} - x \rangle + F(\bar{x}) - F(x)\}, \quad s \in \mathbb{E}^{*}.\tag{6.4.21}
$$

Clearly, this function is well defined for all $s \in \mathbb{E}^{*}$ . Moreover, it is convex and nonnegative on $\mathbb{E}^{*}$

We need to introduce in construction (6.4.21) an additional scaling parameter $\tau \in[0, 1]$ , which controls the size of the feasible set. For $s \in \mathbb{E}^{*}$ , we call the function

$$
F_{\tau, \bar{x}, Q}^{*}(s) = \operatorname{max}_{x \in Q} \{\langle s,{\bar{x}} - y \rangle + F(\bar{x}) - F(y) : \y =(1 - \tau) \bar{x} + \tau x\}\tag{6.4.22}
$$

the scaled restricted dual of the function $F$

Lemma 6.4.2 For any $s \in \mathbb{E}^{*}$ and $\tau \in[0, 1]$ , we have

$$
F_{\bar{x}, Q}^{*}(s) \geq F_{\tau, \bar{x}, Q}^{*}(s) \geq \tau F_{\bar{x}, Q}^{*}(s).\tag{6.4.23}
$$

Proof Since for any $x \in Q$ , the point $y =(1 - \tau) \bar{x} + \tau x$ belongs to $Q.$ , the first inequality is trivial. On the other hand,

$$
\begin{array}{rl} &{F_{\tau, \bar{x}, Q}^{*}(s) = \underset{x \in Q}{\operatorname{max}} \{\langle s, \tau(\bar{x} - x) \rangle + F(\bar{x}) - F(y) : \y =(1 - \tau) \bar{x} + \tau x \\}} \\ &{\qquad \quad \geq \underset{x \in Q}{\operatorname{max}} \{\langle s, \tau(\bar{x} - x) \rangle + F(\bar{x}) -(1 - \tau) F(\bar{x}) - \tau F(x) \\}} \\ &{\qquad \quad = \tau F_{\bar{x}, Q}^{*}(s).} \end{array}
$$

Let us consider a variant of method (6.4.12), which takes into account the composite form of the objective function in problem (6.4.1). For $\psi(x) \equiv{\mathrm{Ind}}_{Q} \left(x \right)$ , these two methods coincide. Otherwise, they generate different minimization sequences.

Conditional Gradient Method with Contraction   
1. Choose an arbitrary point $x_{0} \in Q$   
2. For $t \geq 0$ iterate: Choose a coefficient $\tau_{t} \in(0,$ 1 and compute   
x<sub>t 1</sub> arg min f (x<sub>t</sub> ), y Ψ (y) y (1 τ<sub>t</sub> )x<sub>t</sub> τ<sub>t</sub> x .   
x Q

(6.4.24)

This method can be seen as a Trust-Region Scheme with a linear model of the objective function. The trust region in method (6.4.24) is formed by a contraction of the initial feasible set. In Sect. 6.4.6, we will consider a more traditional trust-region method with quadratic model of the objective.

In view of Theorem 3.1.23 the point $x_{t + 1}$ in method (6.4.24) is characterized by the following variational principle:

$$
\begin{array}{rl} &{x_{t + 1} =(1 - \tau_{t}) x_{t} + \tau_{t} v_{t}, \v_{t} \in Q,} \\ &{} \\ &{\psi((1 - \tau_{t}) x_{t} + \tau_{t} x) + \tau_{t} \langle \nabla f(x_{t}), x - x_{t} \rangle} \\ &{} \\ &{\geq \psi(x_{t + 1}) + \langle \nabla f(x_{t}), x_{t + 1} - x_{t} \rangle, \quad x \in Q.} \end{array}\tag{6.4.25}
$$

Let us choose somehow the sequence of nonnegative weights $\{a_{t}\}_{t \ge 0}$ , and define in (6.4.24) the coefficients $\tau_{t}$ in accordance to (6.4.13). Define now the estimating functional sequence $\{\phi_{t}(x)\}_{t \geq 0}$ as follows:

$$
\begin{array}{rl} &{\quad \phi_{0}(x) = a_{0} \bar{f}(x),} \\ &{\quad \phi_{t + 1}(x) = \phi_{t}(x) + a_{t + 1}[f(x_{t}) + \langle \nabla f(x_{t}), x - x_{t} \rangle + \psi(x)], \quad t \geq 0.} \end{array}\tag{6.4.26}
$$

Clearly, for all $t \geq 0$ we have

$$
\phi_{t}(x) \leq A_{t} \bar{f}(x), \quad x \in Q.\tag{6.4.27}
$$

Define

$$
\begin{array}{r}{C_{\nu, t} = a_{0} \varDelta(x_{0}) + \frac{1}{1 + \nu} \left(\displaystyle \sum_{k = 1}^{t} \frac{a_{k}^{1 + \nu}}{A_{k}^{\nu}} \right) G_{\nu} D^{1 + \nu}, \quad t \geq 0.} \end{array}\tag{6.4.28}
$$

Let us introduce

$$
\delta(x) \stackrel{\mathrm{def}}{=} \operatorname{max}_{y \in Q} \{\langle \nabla f(x), x - y \rangle + \psi(x) - \psi(y)\} \stackrel{(6.4.21)}{=} \psi_{x, Q}^{*}(\nabla f(x)).\tag{6.4.29}
$$

For problem (6.4.1), this value measures the level of satisfaction of the first-order optimality conditions at a point $x \in Q$ . For any $x \in Q$ , we have

$$
\delta(x) \geq \bar{f}(x) - \bar{f}(x_{*}) \geq 0.\tag{6.4.30}
$$

We call $\delta(x)$ the total variation of the linear model of the composite objective function in problem (6.4.1) over the feasible set. It justifies the first-order optimality conditions in our problem. Note that this value can be computed by a procedure for solving the auxiliary problem (6.4.7).

Theorem 6.4.2 Let the sequence $\{x_{t}\}_{t \ge 0}$ be generated by method (6.4.24). Then, for any $\nu \in(0, 1]$ and any step $t \geq 0$ , we have

$$
A_{t} \bar{f}(x_{t}) \leq \phi_{t}(x) + C_{\nu, t}, \quad x \in Q.\tag{6.4.31}
$$

Moreover, for any $t \geq 0$ we have

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{t + 1}) \ge \tau_{t} \delta(x_{t}) - \frac{G_{\nu} D^{1 + \nu}}{1 + \nu} \tau_{t}^{1 + \nu}.} \end{array}\tag{6.4.32}
$$

Proof Let us prove inequality (6.4.31). For $t = 0$ , we have ${\cal C}_{\nu, 0} = a_{0}[\bar{f}(x_{0}) -$ $\bar{f}(x_{*})]$ . Thus, in this case (6.4.31) follows from (6.4.27).

Assume now that (6.4.31) is valid for some $t \geq 0$ . In view of definition (6.4.13), optimality condition (6.4.25) can written in the following form:

$$
\begin{array}{rl} &{a_{t + 1} \langle \nabla f(x_{t}), x - x_{t} \rangle \geq A_{t + 1} \left[\varPsi(x_{t + 1}) - \varPsi((1 - \tau_{t}) x_{t} + \tau_{t} x) \right.} \\ &{~} \\ &{~ \qquad \left.~ + ~ \langle \nabla f(x_{t}), x_{t + 1} - x_{t} \rangle \right]} \end{array}
$$

for all $x \in Q$ . Therefore,

$$
\begin{array}{rl}{\phi_{+ 1}(x) + C_{v, \tau} \quad} &{= \quad \phi_{+ 1}(x) + C_{v, \tau}} \\ &{\quad +(\alpha_{+ 1} \lfloor f(x_{i}) + \langle \nabla f(x_{i}), x - x_{i} \rangle + \psi(x))} \\ &{\quad \quad + \alpha_{+ 1} \lfloor f(x_{i}) + \langle \nabla f(x_{i}), x - x_{i} \rangle + \langle \nabla(x) \rfloor} \\ &{\stackrel{\mathrm{(isd.25)} \rho_{0} 4.19}{\leq} \quad A_{i}[f(x_{i}) + \psi(x_{i})] + \alpha_{+ 1} \lfloor f(x_{i}) + \psi(x) \rfloor} \\ &{\quad \quad + A_{i + 1}[\psi(x_{i + 1}) - \psi((1 - \tau_{1}) x_{i} + \tau_{1} x)} \\ &{\quad \quad + \langle \nabla f(x), x_{i + 1} - x_{i} \rangle]} \\{\geq \quad} &{\quad A_{i + 1}[f(x_{i}) + \langle \nabla f(x), x_{i + 1} - x_{i} \rangle + \psi(x_{i + 1})]} \\{\quad \quad} &{\quad \quad{(\phi_{\geq}^{44})} \quad} \\ &{\quad{\quad \leq} \quad A_{i + 1} \Big[\tilde{f}(x_{i + 1}) - \frac{1}{1 + \gamma} G_{v} | x_{i + 1} - x_{i} |^{1 + \psi} \Big].} \end{array}
$$

It remains to note that $\begin{array}{r}{\| \boldsymbol{x}_{t + 1} - \boldsymbol{x}_{t} \| = \tau_{t} \| \boldsymbol{x}_{t} - \boldsymbol{v}_{t} \| \stackrel{(6.4.13)}{\leq} \frac{a_{t + 1}}{A_{t + 1}} D} \end{array}$ . Thus, we can take

$$
\begin{array}{r}{C_{\nu, t + 1} = C_{\nu, t} + \frac{1}{1 + \nu} \frac{a_{t + 1}^{1 + \nu}}{A_{t + 1}^{\nu}} G_{\nu} D^{1 + \nu}.} \end{array}
$$

In order to prove inequality (6.4.32), let us introduce the values

$$
\begin{array}{rl}{\delta_{\tau}(x)} &{\stackrel{\mathrm{def}}{=} \underset{u \in Q}{\operatorname{max}} \{\langle \nabla f(x), x - y \rangle + \psi(x) - \psi(y) \colon y =(1 - \tau) x + \tau u\}} \\ &{} \\ &{\stackrel{(6.4.22)}{=} \psi_{\tau, x, Q}^{*}(\nabla f(x)), \quad \tau \in[0, 1].} \end{array}
$$

Clearly,

$$
\begin{array}{rcl}{- \delta_{\tau_{t}}(x_{t})} &{=} &{\displaystyle \operatorname{min}_{x \in Q} \{\langle \nabla f(x_{t}), y - x_{t} \rangle + \varPsi(y) - \varPsi(x_{t}) : y =(1 - \tau_{t}) x_{t} + \tau_{t} x\}} \\ & &{} \\ & &{=} &{\langle \nabla f(x_{t}), x_{t + 1} - x_{t} \rangle + \varPsi(x_{t + 1}) - \varPsi(x_{t})} \\ & &{} \\ & &{\stackrel{(6.4.4)}{\geq} \bar{f}(x_{t + 1}) - \bar{f}(x_{t}) - \frac{G_{\nu}}{1 + \nu} \| x_{t + 1} - x_{t} \|^{1 + \nu}.} \end{array}
$$

Since $\| x_{t + 1} - x_{t} \| \leq \tau_{t} D$ , we conclude that

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{t + 1}) \ge \delta_{\tau_{t}}(x_{t}) - \frac{G_{\nu} D^{1 + \nu}}{1 + \nu} \tau_{t}^{1 + \nu} \overset{(6.4.23)} \ge \tau_{t} \delta(x_{t}) - \frac{G_{\nu} D^{1 + \nu}}{1 + \nu} \tau_{t}^{1 + \nu}.} \end{array}
$$

In view of (6.4.27), inequality (6.4.31) results in the following rate of convergence:

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{1}{A_{t}} C_{\nu, t}, \quad t \geq 0.} \end{array}\tag{6.4.33}
$$

For the linearly growing weights $\begin{array}{r}{a_{t} = t, A_{t} = \frac{t(t + 1)}{2}, t \geq 0} \end{array}$ , we have already seen that

$$
\begin{array}{rl}{C_{\nu, t} = \frac{1}{1 + \nu} B_{\nu, t} \ \leq} &{\frac{2^{\nu}}{(1 + \nu)(2 - \nu)} \left[\left(t + \frac{1}{2} \right)^{2 - \nu} - \left(\frac{1}{2} \right)^{2 - \nu} \right] G_{\nu} D^{1 + \nu}.} \end{array}
$$

In the case $\nu = 1$ , this results in the following rate of convergence:

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{2}{t + 1} G_{1} D^{2}, \quad t \geq 1.} \end{array}\tag{6.4.34}
$$

Let us justify for this case the rate of convergence of the sequence $\{\delta(x_{t})\}_{t \geq 1}$ . We have $\begin{array}{r}{\tau_{t} \stackrel{(6.4.13)}{=} \frac{a_{t + 1}}{A_{t + 1}} = \frac{2}{t + 2}} \end{array}$ . On the other hand, for any $T \geq t$

$$
\begin{array}{c}{{\frac{2G_{1} D^{2}}{t + 1} \stackrel{(6.4.34)}{\geq} \bar{f}(x_{t}) - \bar{f}(x_{*})}} \\{{{}}} \\{{(6.4.32) \underset{k = t}{\overset{T}{\geq}} \left[\tau_{k} \delta(x_{k}) - \frac{1}{2} G_{1} D^{2} \tau_{k}^{2} \right] + \bar{f}(x_{T + 1}) - \bar{f}(x_{*}).}} \end{array}\tag{6.4.35}
$$

Let $\delta_{T}^{*} = \operatorname{min}_{0 \leq t \leq T} \delta(x_{t})$ . Then, choosing $T = 2t + 1$ , we get

$$
\begin{array}{rlr}{2 \ln 2 \cdot \delta_{T}^{*}} &{\stackrel{(6.4.10)}{\leq} \left(\underset{k = t}{\sum} \frac{2}{k + 2} \right) \delta_{T}^{*}} &{\stackrel{(6.4.35)}{\leq} 2G_{1} D^{2} \left[\frac{1}{t + 1} + \underset{k = t}{\sum} \frac{1}{(k + 2)^{2}} \right]} \\ &{} & \\{\stackrel{(6.4.11)}{\leq} 2G_{1} D^{2} \left[\frac{1}{t + 1} + \frac{12}{11(2t + 3)} \right] = 2G_{1} D^{2} \left[\frac{2}{T + 1} + \frac{12}{11(T + 2)} \right]} \\ &{} & \\ &{\leq} &{\frac{68}{11} \cdot \frac{G_{1} D^{2}}{T + 1}.} \end{array}
$$

Thus, in the case $\nu = 1$ , for odd T , we get the following bound:

$$
\begin{array}{r}{\delta_{T}^{*} \leq \frac{34}{11 \ln 2} \cdot \frac{G_{1} D^{2}}{T + 1}.} \end{array}\tag{6.4.36}
$$

## 6.4.4 Computing the Primal-Dual Solution

Note that both methods (6.4.12) and (6.4.24) admit computable accuracy certificates. For the first method, define

$$
\begin{array}{r}{\ell_{t} = \frac{1}{A_{t}} \underset{x}{\operatorname{min}} \left\{\underset{k = 0}{\overset{t}{\sum}} a_{k}[f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \varPsi(x)] : x \in Q \right\}.} \end{array}
$$

This value can be computed by the standard operation (6.4.7). Clearly,

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \bar{f}(x_{t}) - \ell_{t} \overset{(6.4.16)}{\leq} \frac{1}{A_{t}} B_{\nu, t}.} \end{array}\tag{6.4.37}
$$

For the second method, let us choose $a_{0} = 0$ . Then the estimating functions are linear:

$$
\phi_{t}(x) = \sum_{k = 1}^{t} a_{k}[f(x_{k - 1}) + \langle \nabla f(x_{k - 1}), x - x_{k - 1} \rangle + \varPsi(x)].
$$

Therefore, defining $\begin{array}{r}{\hat{\ell}_{t} = \frac{1}{A_{t}} \operatorname{min}_{x} \{\phi_{t}(x) : x \in Q\}} \end{array}$ , we also have

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \bar{f}(x_{t}) - \hat{\ell}_{t} \overset{(6.4.16)}{\leq} \frac{1}{A_{t}} C_{\nu, t}, \quad t \geq 1.} \end{array}\tag{6.4.38}
$$

Accuracy certificates (6.4.37) and (6.4.38) justify that both methods (6.4.12) and (6.4.24) are able to recover some information on the optimal dual solution. However, in order to implement this ability, we need to open the Black Box and introduce an explicit model of the function $f(\cdot)$

Let us assume that the function f is representable in the following form:

$$
f(x) = \operatorname{max}_{u} \{\langle Ax, u \rangle - g(u) : \u \in Q_{d}\},\tag{6.4.39}
$$

where $A : \mathbb{E} \to \mathbb{E}_{1}^{*}, Q_{d}$ is a closed convex set in a finite-dimensional linear space $\mathbb{E}_{2}$ , and the function $g(\cdot)$ is p-uniformly convex on $Q_{d}$ :

$$
\langle \nabla g(u_{1}) - \nabla g(u_{2}), u_{1} - u_{2} \rangle \ge \sigma_{g} \| u_{1} - u_{2} \|^{p}, \quad u_{1}, u_{2} \in{\cal Q}_{d},\tag{6.4.40}
$$

where the convexity degree $p \ \geq \2$ . Denote by $u(x) ~ \in ~ Q_{d}$ the unique optimal solution to optimization problem in (6.4.39).

Lemma 6.4.3 The function f has Hölder continuous gradient $\nabla f(x) = A^{*} u(x)$ with parameter $\textstyle \nu ={\frac{1}{p - 1}}$ and constant $\begin{array}{r}{G_{\nu} = \left(\frac{1}{\sigma_{g}} \right)^{\nu} \Vert A \Vert^{1 + \nu}} \end{array}$

Proof Let $u_{1} = u(x_{1}), u_{2} = u(x_{2}), g_{1}^{\prime} = \nabla g(u_{1})$ , and $g_{2}^{\prime} = \nabla g(u_{2})$ . Then, in view of the optimality condition (2.2.39), we have

$$
\langle Ax_{1} - g_{1}^{\prime}, u_{2} - u_{1} \rangle \leq 0, \quad \langle Ax_{2} - g_{2}^{\prime}, u_{1} - u_{2} \rangle \ \leq \0.
$$

Adding these two inequalities, we get

$$
\langle A(x_{1} - x_{2}), u_{1} - u_{2} \rangle \ge \langle g_{1}^{\prime} - g_{2}^{\prime}, u_{1} - u_{2} \rangle \stackrel{(6.4.40)}{\ge} \sigma_{g} \| u_{1} - u_{2} \|^{p}.
$$

Thus,

$$
\begin{array}{rl} &{\Vert \nabla f(x_{1}) - \nabla f(x_{2}) \Vert^{*} = \Vert A^{*}(u_{1} - u_{2}) \Vert^{*} \ \leq \ \Vert A \Vert \cdot \Vert u_{1} - u_{2} \Vert} \\ &{\qquad \leq \Vert A \Vert \cdot \left(\frac{1}{\sigma_{g}} \Vert A(x_{1} - x_{2}) \Vert \right)^{\frac{1}{p - 1}}} \\ &{\qquad \leq \Vert A \Vert^{\frac{p}{p - 1}} \left(\frac{1}{\sigma_{g}} \Vert x_{1} - x_{2} \Vert \right)^{\frac{1}{p - 1}}.\qquad \sqsupset} \end{array}
$$

Let us write down an adjoint problem to (6.4.1).

$$
\begin{array}{rl}{\underset{x}{\operatorname{min}} \{\bar{f}(x) : x \in Q\} \overset{(6.4.39)}{=} \underset{x}{\operatorname{min}} \left\{\psi(x) + \underset{u}{\operatorname{max}} \{\langle Ax, u \rangle - g(u) : u \in Q_{d}\} \right\}} &{} \\{\geq} &{\underset{u \in Q_{d}}{\operatorname{max}} \left\{- g(u) + \underset{x}{\operatorname{min}} \{\langle A^{*} u, x \rangle + \psi(x)\} \right\}.} \end{array}
$$

Thus, defining $\phi(u) ~ = ~ \operatorname{min}_{x} \{\langle A^{*} u, x \rangle + \psi(x)\}$ , we get the following adjoint problem:

$$
\operatorname{max}_{u \in \mathcal{Q}_{d}} \left\{\bar{g}(u) \stackrel{\mathrm{def}}{=} - g(u) + \phi(u) \right\}.\tag{6.4.41}
$$

In this problem, the objective function is nonsmooth and uniformly strongly concave of degree p. Clearly, we have

$$
\bar{f}(x) - \bar{g}(u) \geq 0, \quad x \in \mathcal{Q}, \u \in \mathcal{Q}_{d}.\tag{6.4.42}
$$

Let us show that both methods (6.4.12) and (6.4.24) are able to approximate the optimal solution to the problem (6.4.41).

Note that for any ${\bar{x}} \in Q$ we have

$$
\begin{array}{rl}{f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle \stackrel{{(6.4.39)}}{=} \langle A \bar{x}, u(\bar{x}) \rangle - g(u(\bar{x})) + \langle A^{*} u(\bar{x}), x - \bar{x} \rangle} &{} \\{} &{{}} \\{=} &{{} \langle Ax, u(\bar{x}) \rangle - g(u(\bar{x})).} \end{array}
$$

Therefore, defining for the first method (6.4.12) $\begin{array}{r}{u_{t} = \frac{1}{A_{t}} \displaystyle \sum_{k = 0}^{t} a_{k} u(x_{k})} \end{array}$ , we obtain

$$
\begin{array}{rl} &{\ell_{t} = \displaystyle \operatorname{min}_{x \in \mathcal{Q}} \bigg \{\psi(x) + \frac{1}{A_{t}} \sum_{k = 0}^{t} a_{k}[\langle Ax, u(x_{k}) \rangle - g(u(x_{k}))] \bigg\}} \\ &{} \\ &{= \phi(u_{t}) - \frac{1}{A_{t}} \displaystyle \sum_{k = 0}^{t} a_{k} g(u(x_{k})) \ \leq \ \bar{g}(u_{t}).} \end{array}
$$

Thus, we get

$$
0 \stackrel{(6.4.42)}{\leq} \bar{f}(x_{t}) - \bar{g}(u_{t}) \ \leq \ \bar{f}(x_{t}) - \ell_{t} \stackrel{(6.4.37)}{\leq} \ \frac{1}{A_{t}} B_{\nu, t}, t \geq 0.\tag{6.4.43}
$$

For the second method (6.4.24), we choose $a_{0} = 0$ and take $\begin{array}{r}{u_{t} = \frac{1}{A_{t}} \displaystyle \sum_{k = 1}^{t} a_{k} u(x_{k - 1})} \end{array}$ In this case, by a similar reasoning, we get

$$
0 \stackrel{(6.4.42)}{\leq} \bar{f}(x_{t}) - \bar{g}(u_{t}) \ \leq \ \bar{f}(x_{t}) - \hat{\ell}_{t} \stackrel{(6.4.38)}{\leq} \ \frac{1}{A_{t}} C_{\nu, t}, t \geq 1.\tag{6.4.44}
$$

## 6.4.5 Strong Convexity of the Composite Term

In this section, we assume that the function $\psi$ in problem (6.4.1) is strongly convex (see Sect. 3.2.6). In view of (3.2.37), this means that there exists a positive constant $\sigma_{\psi}$ such that

$$
\begin{array}{r}{\psi(\tau x +(1 - \tau) y) \leq \tau \psi(x) +(1 - \tau) \psi(y) - \frac{1}{2} \sigma_{\psi} \tau(1 - \tau) \| x - y \|^{2}} \end{array}\tag{6.4.45}
$$

for all $x, y \in Q$ and $\tau \in[0, 1]$ . Let us show that in this case CG-methods converge much faster. We demonstrate this for method (6.4.12).

In view of the strong convexity of $\psi$ , the variational principle (6.4.8) characterizing the point $v_{t}$ in method (6.4.12) can be strengthened:

$$
\begin{array}{r}{\psi(x) + \langle \nabla f(x_{t}), x - v_{t} \rangle \geq \psi(v_{t}) + \frac{1}{2} \sigma_{\psi} \| x - v_{t} \|^{2}, \quad x \in Q.} \end{array}\tag{6.4.46}
$$

Let $V_{0}$ be defined as in (6.4.14). Define

$$
\hat{B}_{\nu, t} = a_{0} V_{0} + \left(\sum_{k = 1}^{t} \frac{a_{k}^{1 + 2 \nu}}{A_{k}^{2 \nu}} \right) \frac{G_{\nu}^{2} D^{2 \nu}}{2 \sigma_{\psi}}, \quad t \geq 0.\tag{6.4.47}
$$

Theorem 6.4.3 Let the sequence $\{x_{t}\}_{t \ge 0}$ be generated by method (6.4.12), and assume the function Ψ is strongly convex. Then, for any $\nu \in(0, 1]$ , any step $t \geq 0_{\mathrm{{;}}}$ and any $x \in Q$ we have

$$
A_{t}(f(x_{t}) + \psi(x_{t})) \leq \sum_{k = 0}^{t} a_{k}[f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \psi(x)] + \hat{B}_{\nu, t}.\tag{6.4.48}
$$

Proof The beginning of the proof of this statement is very similar to that of Theorem 6.4.1. Assuming that (6.4.48) is valid for some $t \geq 0$ , we get the following inequality:

$$
\sum_{k = 0}^{t + 1} a_{k}[f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \varPsi(x)] + B_{\nu, t}
$$

$$
\begin{array}{r}{\geq A_{t + 1} \left(f(x_{t + 1}) + \psi(x_{t + 1}) \right) + a_{t + 1} \left[\psi(x) - \psi(v_{t}) + \langle \nabla f(x_{t + 1}), x - v_{t} \rangle \right].} \end{array}
$$

Further,

$$
\psi(x) - \psi(v_{t}) + \langle \nabla f(x_{t + 1}), x - v_{t} \rangle
$$

$$
\begin{array}{rl}{{\stackrel{(6.4.46)}{\geq} \langle \nabla f({x}_{t + 1}) - \nabla f({x}_{t}),{x} -{v}_{t} \rangle + \frac{1}{2} \sigma_{\psi} \|{x} -{v}_{t} \|^{2}}} \end{array}
$$

$$
\begin{array}{rl}{{\stackrel{(4.2.3)}{\geq} - \frac{1}{2 \sigma_{\psi}} \| \nabla f(x_{t + 1}) - \nabla f(x_{t}) \|_{*}^{2}}} \end{array}
$$

$$
\begin{array}{r}{\frac{(6.4.3)}{\geq} - \frac{1}{2 \sigma_{\psi}} \left(\frac{a_{t + 1}^{\nu}}{A_{t + 1}^{\nu}} G_{\nu} D^{\nu} \right)^{2}.} \end{array}
$$

Thus, to ensure that (6.4.48) is valid for the next iteration, it is enough to choose

$$
\begin{array}{r}{\hat{B}_{\nu, t + 1} = \hat{B}_{\nu, t} + \frac{1}{2 \sigma_{\psi}} \frac{a_{t + 1}^{1 + 2 \nu}}{A_{t + 1}^{2 \nu}} G_{\nu}^{2} D^{2 \nu} \mathrm{.~ \qquad} \mathbb{U}} \end{array}
$$

It can be easily checked that in our situation, the linear weights strategy $a_{t} \equiv t$ is not the best one. Let us choose $a_{t} = t^{2}, t \geq 0$ . Then $\begin{array}{r}{A_{t} = \frac{t(t + 1)(2t + 1)}{6}} \end{array}$ , and we get

$$
\begin{array}{rcl}{\hat{B}_{\nu, t}} &{=} &{\left(\displaystyle \sum_{k = 1}^{t} \frac{6^{2 \nu} k^{2(1 + 2 \nu)}}{k^{2 \nu}(k + 1)^{2 \nu}(2k + 1)^{2 \nu}} \right) \frac{G_{\nu}^{2} D^{2 \nu}}{2 \sigma_{\psi}} \ \leq \ \left(3^{2 \nu} \displaystyle \sum_{k = 1}^{t} k^{2(1 - \nu)} \right) \frac{G_{\nu}^{2} D^{2 \nu}}{2 \sigma_{\psi}}} \end{array}
$$

$$
\begin{array}{rlr}{{\stackrel{(6.4.9)}{\leq}}} &{\frac{G_{\nu}^{2} D^{2 \nu}}{2 \sigma \psi} \cdot \frac{3^{2 \nu}}{3 - 2 \nu} \tau^{3 - 2 \nu} \Big |_{1 / 2}^{t + 1 / 2} = \frac{3^{2 \nu}}{3 - 2 \nu}[(t + \frac{1}{2})^{3 - 2 \nu} -(\frac{1}{2})^{3 - 2 \nu}] \frac{G_{\nu}^{2} D^{2 \nu}}{2 \sigma \psi}.} \end{array}
$$

Thus, for $\nu \in(0, 1)$ , we get $\begin{array}{r}{\frac{1}{A_{t}} \hat{B}_{\nu, t} \le O(t^{- 2 \nu})} \end{array}$ . For $\nu = 1$ , we obtain

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{54}{(t + 1)(2t + 1)} \cdot \frac{G_{1}^{2} D^{2}}{2 \sigma_{\psi}},} \end{array}\tag{6.4.49}
$$

which is much better than (6.4.19). This gives us an example of acceleration of the Conditional Gradient Method by a strong convexity assumption.

## 6.4.6 Minimizing the Second-Order Model

Let us assume now that in problem (6.4.1) the function $f$ is twice continuously differentiable. Then we can apply to this problem the following method.

## Composite Trust-Region Method with Contraction

1. Choose an arbitrary point $x_{0} \in Q$

2. For $t \geq 0$ iterate: Define the coefficient $\tau_{t} \in(0,$ 1 and choose

$$
\begin{array}{rl} &{x_{t + 1} \in \A \mathrm{rg} \underset{y}{\operatorname{min}} \bigg \lbrace \ \langle \nabla f(x_{t}), y - x_{t} \rangle + \frac{1}{2} \langle \nabla^{2} f(x_{t})(y - x_{t}), y - x_{t} \rangle} \\ &{\qquad + \psi(y) : \y \in(1 - \tau_{t}) x_{t} + \tau_{t} x, \x \in Q \quad \bigg \rbrace.} \end{array}\tag{6.4.50}
$$

Note that this scheme is well defined even if the Hessian of the function $f$ is positive semidefinite. Of course, in general, the computational cost of each iteration of this scheme can be big. However, in one important case, when $\psi(\cdot)$ is an indicator function of a Euclidean ball, the complexity of each iteration of this scheme is dominated by the complexity of matrix inversion. Thus, method (6.4.50) can be easily applied to problems of the form

$$
\operatorname{min}_{x} \{f(x) : \| x - x_{0} \| \leq r\},\tag{6.4.51}
$$

where the norm $\| \cdot \|$ is Euclidean.

Let $H_{\nu} < + \infty$ for some $\nu \in(0, 1]$ . In this section we assume that

$$
\langle \nabla^{2} f(x) h, h \rangle \leq L \| h \|^{2}, \quad x \in Q, \h \in \mathbb{E}.\tag{6.4.52}
$$

Let us choose a sequence of nonnegative weights $\{a_{t}\}_{t \ge 0}$ , and define in (6.4.50) the coefficients $\{\tau_{t}\}_{t \ge 0}$ in accordance with (6.4.13). Define the estimating functional sequence $\{\phi_{t}(x)\}_{t \geq 0}$ by recurrent relations (6.4.26), where the sequence $\{x_{t}\}_{t \ge 0}$ is generated by method (6.4.50). Finally, define

$$
\hat{C}_{\nu, t} = a_{0} \varDelta(x_{0}) + \left(\sum_{k = 1}^{t} \frac{a_{k}^{2 + \nu}}{A_{k}^{1 + \nu}} \right) \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} + \left(\sum_{k = 1}^{t} \frac{a_{k}^{2}}{2A_{k}} \right) LD^{2}.\tag{6.4.53}
$$

In our convergence results, we also estimate the second-order optimality measure for problem (6.4.1) at the current test points. Let us introduce

$$
\begin{array}{r}{\theta(x) \stackrel{\mathrm{def}}{=} \underset{y \in \mathcal{Q}}{\operatorname{max}} \{\langle \nabla f(x), x - y \rangle - \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle + \varPsi(x) - \varPsi(y)\}.} \end{array}\tag{6.4.54}
$$

For any $x \in Q$ we have $\theta(x) \geq 0$ . We call $\theta(x)$ the total variation of the quadratic model of the composite objective function in problem (6.4.1) over the feasible set. Defining

$$
\begin{array}{r}{F_{x}(y) = \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle + \varPsi(y),} \end{array}
$$

we get $\theta(x) ={\Big(} F_{x}{\Big)}_{x, Q}^{*}(\nabla f(x))$ (see definition (6.4.21)).

Theorem 6.4.4 Let the sequence $\{x_{t}\}_{t \ge 0}$ be generated by method (6.4.50). Then, for any $\nu \in[0, 1]$ and any step $t \geq 0$ we have

$$
A_{t} \bar{f}(x_{t}) \leq \phi_{t}(x) + \hat{C}_{\nu, t}, \quad x \in \mathcal{Q}.\tag{6.4.55}
$$

Moreover, for any $t \geq 0$ we have

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{t + 1}) \ge \tau_{t} \theta(x_{t}) - \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} \tau_{t}^{2 + \nu}.} \end{array}\tag{6.4.56}
$$

Proof Let us prove inequality (6.4.55). For $t = 0, \hat{C}_{\nu, 0} = a_{0}[\bar{f}(x_{0}) - \bar{f}(x_{*})]$ Therefore, this inequality is valid.

In view of Theorem 3.1.23 the point $x_{t + 1}$ is characterized by the following variational principle:

$$
x_{t + 1} =(1 - \tau_{t}) x_{t} + \tau_{t} v_{t}, \quad v_{t} \in Q,
$$

$$
\psi(y) + \langle \nabla f(x_{t}) + \nabla^{2} f(x_{t})(x_{t + 1} - x_{t}), y - x_{t + 1} \rangle \geq \psi(x_{t + 1}),
$$

$$
\forall y =(1 - \tau_{t}) x_{t} + \tau_{t} x, \quad x \in Q.
$$

Therefore, in view of definition (6.4.13), for any $x \in Q$ we have

$$
\begin{array}{rcl}{a_{t + 1} \langle \nabla f(x_{t}), x - x_{t} \rangle} &{\geq} &{A_{t + 1} \langle \nabla f(x_{t}) + \nabla^{2} f(x_{t})(x_{t + 1} - x_{t}), x_{t + 1} - x_{t} \rangle} \\ & &{} & \\ & & &{+ a_{t + 1} \langle \nabla^{2} f(x_{t})(x_{t + 1} - x_{t}), x_{t} - x \rangle} \\ & &{} & \\ & & &{+ A_{t + 1}[\psi(x_{t + 1}) - \psi((1 - \tau_{t}) x_{t} + \tau_{t} x)]} \end{array}
$$

$$
\begin{array}{rl}{{\stackrel{(6.4.52)}{\geq} A_{t + 1} \langle \nabla f({x}_{t}) + \frac{1}{2} \nabla^{2} f({x}_{t})({x}_{t + 1} -{x}_{t}),{x}_{t + 1} -{x}_{t} \rangle}} \\ &{} \\ &{+ A_{t + 1}[\varPsi({x}_{t + 1}) - \psi((1 - \tau_{t}){x}_{t} + \tau_{t}{x})] - \frac{a_{t + 1}^{2}}{2A_{t + 1}} L{D}^{2}.} \end{array}
$$

Hence,

$$
\begin{array}{rl} &{A_{t} \hat{f}(x_{t}) + a_{t + 1}[f(x_{t}) + \langle \nabla f(x_{t}), x - x_{t} \rangle + \varPsi(x)]} \\{\geq} &{A_{t} \varPsi(x_{t}) + A_{t + 1}[f(x_{t}) + \langle \nabla f(x_{t}) + \frac{1}{2} \nabla^{2} f(x_{t})(x_{t + 1} - x_{t}), x_{t + 1} - x_{t} \rangle]} \\ &{+ a_{t + 1} \varPsi(x) + A_{t + 1}[\varPsi(x_{t + 1}) - \varPsi((1 - \tau_{t}) x_{t} + \tau_{t} x)] - \frac{a_{t + 1}^{2}}{2A_{t + 1}} LD^{2}} \\{\overset{(6, 4.6)}{\geq} A_{t + 1}[f(x_{t + 1}) + \varPsi(x_{t + 1})] - A_{t + 1} \frac{H_{t} \| x_{t + 1} - x_{t} \|^{2 + \nu}}{(1 + \nu)^{(2 + \nu)}} - \frac{a_{t + 1}^{2}}{2A_{t + 1}} LD^{2}} \\{\geq} &{A_{t + 1} \hat{f}(x_{t + 1}) - \frac{a_{t + 1}^{2 + \nu}}{A_{t + 1}^{\nu}} \cdot \frac{H_{t} D^{2 + \nu}}{(1 + \nu)^{(2 + \nu)}} - \frac{a_{t + 1}^{2}}{2A_{t + 1}} LD^{2}.} \end{array}
$$

Thus, if (6.4.55) is valid for some $t \geq 0$ , then

$$
\begin{array}{rl} &{\phi_{t + 1}(x) + \hat{C}_{\nu, t} \geq A_{t} \bar{f}(x_{t}) + a_{t + 1}[f(x_{t}) + \langle \nabla f(x_{t}), x - x_{t} \rangle + \varPsi(x)]} \\ &{\qquad \geq A_{t + 1} \bar{f}(x_{t + 1}) - \frac{a_{t + 1}^{2 + \nu}}{A_{t + 1}^{1 + \nu}} \cdot \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} - \frac{a_{t + 1}^{2}}{2A_{t + 1}} LD^{2}.} \end{array}
$$

Therefore, we can take $\begin{array}{r}{\hat{C}_{\nu, t + 1} = \hat{C}_{\nu, t} + \frac{a_{t + 1}^{2 + \nu}}{A_{\star \star 1}^{1 + \nu}} \cdot \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} + \frac{a_{t + 1}^{2}}{2A_{t + 1}} LD^{2}.} \end{array}$

In order to justify inequality (6.4.56), let us introduce the values

$$
\begin{array}{rl}{\theta_{t}(\tau)} &{\stackrel{\mathrm{def}}{=}} &{\underset{x \in Q}{\operatorname{max}} \{\langle \nabla f(x_{t}), x_{t} - y \rangle - \frac{1}{2} \langle \nabla^{2} f(x_{t})(y - x_{t}), y - x_{t} \rangle} \\ &{} \\ &{\quad + \psi(x_{t}) - \psi(y) : \y =(1 - \tau) x_{t} + \tau x\}} \\ &{\stackrel{(6.4.22)}{=} \Big(F_{x_{t}} \Big)_{\tau, x_{t}, Q}^{*}(\nabla f(x_{t})), \quad \tau \in[0, 1].} \end{array}
$$

Clearly,

$$
\begin{array}{rl} &{- \theta_{t}(\tau_{t}) = \underset{x \in \mathcal{Q}}{\operatorname{min}} \{\langle \nabla f(x_{t}), y - x_{t} \rangle - \frac{1}{2} \langle \nabla^{2} f(x_{t})(y - x_{t}), y - x_{t} \rangle} \\ &{\qquad + \psi(y) - \varPsi(x_{t}) : y =(1 - \tau_{t}) x_{t} + \tau_{t} x\}} \\ &{\qquad = \langle \nabla f(x_{t}), x_{t + 1} - x_{t} \rangle - \frac{1}{2} \langle \nabla^{2} f(x_{t})(x_{t + 1} - x_{t}), x_{t + 1} - x_{t} \rangle} \\ &{\qquad + \psi(x_{t + 1}) - \varPsi(x_{t})} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(6.4.6)}{\geq} \bar{f}(x_{t + 1}) - \bar{f}(x_{t}) - \frac{H_{\nu}}{(1 + \nu)(2 + \nu)} \| x_{t + 1} - x_{t} \|^{2 + \nu}.} \end{array}
$$

Since $\| x_{t + 1} - x_{t} \| \leq \tau_{t} D$ , we conclude that

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{t + 1}) \ge \theta_{t}(\tau_{t}) - \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} \tau_{t}^{2 + \nu} \stackrel{(6.4.23)}{\ge} \tau_{t} \theta(x_{t}) - \frac{H_{\nu} D^{2 + \nu}}{(1 + \nu)(2 + \nu)} \tau_{t}^{2 + \nu}.\stackrel{\square}{\ge} \tau_{t}^{2 + \nu},} \end{array}
$$

Thus, inequality (6.4.55) ensures the following rate of convergence of method (6.4.50)

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \le \frac{1}{A_{t}} \hat{C}_{\nu, t}.} \end{array}\tag{6.4.57}
$$

A particular expression of the right-hand side of this inequality for different values of $\nu \in[0, 1]$ can be obtained in exactly the same way as it was done in Sect. 6.4.2. Here, we restrict ourselves only to the case when $\nu = 1$ and $a_{t} = t^{2}, t \geq 0$ . Then $\begin{array}{r}{A_{t} = \frac{t(t + 1)(2t + 1)}{6}} \end{array}$ , and

$$
\sum_{k = 1}^{t} \frac{a_{k}^{3}}{A_{k}^{2}} = \sum_{k = 1}^{t} \frac{36k^{6}}{k^{2}(k + 1)^{2}(2k + 1)^{2}} \ \leq \18t,
$$

$$
\sum_{k = 1}^{t} \frac{a_{k}^{2}}{2A_{k}} = \sum_{k = 1}^{t} \frac{3k^{4}}{k(k + 1)(2k + 1)} \ \leq \ \frac{3}{2} \sum_{k = 1}^{t} k = \frac{3}{4} t(t + 1).
$$

Thus, we get

$$
\begin{array}{r}{\bar{f}(x_{t}) - \bar{f}(x_{*}) \leq \frac{18H_{1} D^{3}}{(t + 1)(2t + 1)} + \frac{9LD^{2}}{2(2t + 1)}.} \end{array}\tag{6.4.58}
$$

Note that the rate of convergence (6.4.58) is worse than the convergence rate of cubic regularization of the Newton method (see Sect. 4.2.3). However, to the best of our knowledge, inequality (6.4.58) gives us the first global rate of convergence of an optimization scheme belonging to the family of trust-region methods. In view of inequality (6.4.55), the optimal solution of the dual problem (6.4.41) can be approximated by method (6.4.50) with $a_{0} = 0$ in the same way as it was suggested in Sect. 6.4.4 for Conditional Gradient Methods.

Let us now estimate the rate of decrease of the values $\theta(x_{t}), t \geq 0$ , in the case when $\nu = 1$ . Note that $\begin{array}{r}{\tau_{t} \stackrel{(6.4.13)}{=} \frac{a_{t + 1}}{A_{t + 1}} = \frac{6(t + 1)}{(t + 2)(2t + 3)}} \end{array}$ . It is easy to see that these coefficients satisfy the following inequalities:

$$
\begin{array}{r}{\frac{3}{t + 3} \leq \tau_{t} \ \leq \ \frac{6}{2t + 5}, t \geq 0.} \end{array}\tag{6.4.59}
$$

Therefore, choosing the total number of steps $T = 2t + 2$ , we have

$$
\sum_{k = t}^{T} \tau_{k} \stackrel{(6.4.59)}{\geq} 3 \sum_{k = t}^{2t + 2} \frac{1}{k + 3} \stackrel{(6.4.10)}{\geq} 3 \ln 2,
$$

$$
\begin{array}{rcl}{{\displaystyle \sum_{k = t}^{T} \tau_{k}^{3}}} &{{\stackrel{(6.4.59)}{\leq} \displaystyle \sum_{k = t}^{2t + 2} \frac{27}{(k + 5 / 2)^{3}} \stackrel{(6.4.11)}{\leq} - \frac{27}{2(k + 5 / 2)^{2}} \Big |_{t - 1 / 2}^{2t + 5 / 2}}} \\{{}} &{{}} &{{}} \\{{=}} &{{\frac{27}{2} \left[\frac{1}{(t + 2)^{2}} - \frac{1}{(2t + 5)^{2}} \right] = \frac{27}{2} \left[\frac{4}{(T + 2)^{2}} - \frac{1}{(T + 3)^{2}} \right]}} \\{{}} &{{}} &{{}} \\{{=}} &{{\frac{27(3T + 8)(T + 4)}{2(T + 2)^{2}(T + 3)^{2}} \stackrel{(6.81}{\leq} \frac{81}{2(T + 1)(T + 2)}.}} \end{array}\tag{6.4.60}
$$

Now we can use the same trick as at the end of Sect. 6.4.2. Define

$$
\theta_{T}^{*} = \operatorname{min}_{0 \leq t \leq T} \theta(x_{t}).
$$

Then

$$
\begin{array}{rlr}{\frac{36H_{1} D^{3}}{T(T - 1)} + \frac{9LD^{2}}{2(T - 1)}} &{\overset{(6.4.58)}{\geq} \bar{f}(x_{t}) - \bar{f}(x_{*}) \geq \displaystyle \sum_{k = t}^{T}(\bar{f}(x_{k}) - \bar{f}(x_{k + 1}))} & \\ &{} & \\ &{\overset{(6.4.56)}{\geq} \theta_{T}^{*} \displaystyle \sum_{k = t}^{T} \tau_{k} - \frac{H_{1} D^{3}}{6} \displaystyle \sum_{k = t}^{T} \tau_{k}^{3}} & \\ &{} & \\ &{\overset{(6.4.60)}{\geq} 3 \theta_{T}^{*} \ln 2 - \frac{27H_{1} D^{3}}{4(T + 1)(T + 2)}.} & \end{array}
$$

Thus, for even T , we get the following bound:

$$
\begin{array}{rl} &{\theta_{T}^{*} \leq \frac{3}{\ln 2} \left[\frac{4H_{1} D^{3}}{T(T - 1)} + \frac{3H_{1} D^{3}}{4(T + 1)(T + 2)} + \frac{LD^{2}}{2(T - 1)} \right]} \\ &{} \\ &{\leq \frac{3}{\ln 2} \left[\frac{5H_{1} D^{3}}{T(T - 1)} + \frac{LD^{2}}{2(T - 1)} \right].} \end{array}\tag{6.4.61}
$$


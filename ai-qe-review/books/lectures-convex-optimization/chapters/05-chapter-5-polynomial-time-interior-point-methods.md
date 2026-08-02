---
title: "Chapter 5 \u2014 Polynomial-Time Interior-Point Methods"
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 5
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 13680
source_line_end: 17886
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

# Chapter 5 — Polynomial-Time Interior-Point Methods

> [[../README|本书目录]] · [[04-chapter-4-second-order-methods|上一章]] · [[06-chapter-6-the-primal-dual-model-of-an-objective-function|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 13680–17886。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 5 Polynomial-Time Interior-Point Methods

In this section, we present the problem classes and complexity bounds of polynomial-time interior-point methods. These methods are based on the notion of a self-concordant function. It appears that such a function can be easily minimized by the Newton’s Method. On the other hand, an important subclass of these functions, the self-concordant barriers, can be used in the framework of pathfollowing schemes. Moreover, it can be proved that we can follow the corresponding central path with polynomial-time complexity. The size of the steps in the penalty coefficient of the central path depends on the corresponding barrier parameter. It appears that for any convex set there exists a self-concordant barrier with parameter proportional to the dimension of the space of variables. On the other hand, for any convex set with explicit structure, such a barrier with a reasonable value of parameter can be constructed by simple combination rules. We present applications of this technique to Linear and Quadratic Optimization, Linear Matrix Inequalities and other optimization problems.

## 5.1 Self-concordant Functions

(Do we really have a Black Box? What does the Newton method actually do? Definition of self-concordant functions; Main properties; The Implicit Function Theorem; Minimizing self-concordant functions; Relations with the standard second-order methods.)

## 5.1.1 The Black Box Concept in Convex Optimization

In this chapter, we are going to present the main ideas underlying the modern polynomial-time interior-point methods in Nonlinear Optimization. In order to start, let us look first at the traditional formulation of a minimization problem.

Suppose we want to solve a minimization problem in the following form:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \{f_{0}(x) : \f_{j}(x) \leq 0, \j = 1 \ldots m\}.
$$

We assume that the functional components of this problem are convex. Note that all standard convex optimization schemes for solving this problem are based on the Black-Box concept. This means that we assume our problem to be equipped with an oracle, which provides us with some information on the functional components of the problem at some test point x. This oracle is local: If we change the shape of the component far enough from the test point, the answer of the oracle does not change. These answers comprise the only information available for numerical methods.

However, looking carefully at the above situation, we can discover a certain contradiction. Indeed, in order to apply the convex optimization methods, we need to be sure that our functional components are convex. However, we can check convexity only by analyzing the structure of these functions<sup>2</sup>: If our function is obtained from the basic convex functions by convex operations (summation, maximum, etc.), we conclude that it is convex.

Thus, the functional components of the problem are not in the Black Box at the moment we are checking their convexity and choose the minimization scheme. However, we lock them in the Black Box for numerical methods. This is the main conceptual contradiction of the standard Convex Optimization theory.<sup>3</sup>

The above observation gives us hope that the structure of the problem could be used to improve performance of convex minimization schemes. Unfortunately, structure is a very fuzzy notion, which is quite difficult to formalize. One possible way to describe the structure is to fix the analytical type of functional components. For example, we can consider the problems with linear functions $f_{j}(\cdot)$ only. This works, but note that this approach is very fragile: If we introduce in our problem just a single functional component of different type, we get another problem class and all the theory must be redone from scratch.

Alternatively, it is clear that having the structure at hand, we can play with the analytical form of the problem. We can rewrite the problem in many equivalent forms using nontrivial transformations of variables or constraints, introducing additional variables, etc. However, this would serve no purpose without realizing the final goal of such transformations. So, let us try to find such a goal.

At this moment, it is better to look at classical examples. In many situations, the sequential reformulations of the initial problem can be seen as a part of the numerical method. We start from a complicated problem $\mathcal{P}$ and, step by step, simplify its structure up to the moment we get a trivial problem (or, a problem

## 5.1 Self-concordant Functions

which we know how to solve):

$$
\mathcal{P} \longrightarrow \ldots \longrightarrow(f^{*}, x^{*}).
$$

Let us look at the standard approach for solving the system of linear equations, namely,

$$
Ax = b.
$$

We can proceed as follows:

1. Check that matrix A is symmetric and positive definite. Sometimes this is clear from its origin.

2. Compute the Cholesky factorization of the matrix:

$$
A = LL^{T},
$$

where L is a lower-triangular matrix. Form two auxiliary systems

$$
Ly = b, \quad L^{T} x = y.
$$

## 3. Solve the auxiliary systems.

This process can be seen as a sequence of equivalent transformations of the initial problem.

Imagine for a moment that we do not know how to solve the systems of linear equation. In order to discover the above technology, we should perform the following steps:

1. Find a class of problems which can be solved very efficiently (linear systems with triangular matrices in our example).

2. Describe the transformation rules for converting our initial problem into the desired form.

3. Describe the class of problems for which these transformation rules are applicable.

We are ready to explain how it works in Convex Optimization. First of all, we need to find a basic numerical scheme and problem formulation at which this scheme is very efficient. We will see that for our goals the most appropriate candidate is the Newton’s method (see Sect. 1.2.4 and Chap. 4) as applied in the framework of Sequential Unconstrained Minimization (see Sect. 1.3.3).

In the next section, we will analyze some drawbacks of the standard theory on the Newton’s method. From this analysis, we derive a family of very special convex functions, so-called self-concordant functions and self-concordant barriers, which can be efficiently minimized by the Newton’s method. We use these objects in the description of a transformed version of the initial problem. In the sequel, we refer to this description as a barrier model of our problem. This model will replace the standard functional model of the optimization problem used in the previous chapters.

## 5.1.2 What Does the Newton’s Method Actually Do?

Let us look at the standard result on the local convergence of Newton’s method (we have proved it as Theorem 1.2.5). We need to find an unconstrained local minimum $x^{*}$ of the twice differentiable function $f(\cdot)$

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} f(x),\tag{5.1.1}
$$

For the moment, all the norms we use are standard Euclidean. Assume that:

$\nabla^{2} f(x^{*}) \succeq \mu I_{n}$ with some constant $\mu > 0$

$\parallel \nabla^{2} f(x) - \nabla^{2} f(y) \parallel \leq M \parallel x - y \parallel$ for all x and $y \in \mathbb{R}^{n}$

Assume also that the starting point of the Newton process $x_{0}$ is close enough to $x^{*}$

$$
\textstyle \parallel x_{0} - x^{*} \parallel <{\bar{r}} ={\frac{2 \mu}{3M}}.\tag{5.1.2}
$$

Then we can prove (see Theorem 1.2.5) that the sequence

$$
x_{k + 1} = x_{k} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}), \quad k \geq 0,\tag{5.1.3}
$$

is well defined. Moreover, $x_{k} \ - \x^{*} \ \Vdash \ \bar{r}$ for all $k \ \geq \0$ and the Newton’s method (5.1.3) converges quadratically:

$$
\begin{array}{r}{\| ~ x_{k + 1} - x^{*} ~ \| \leq \frac{M \| x_{k} - x^{*} \|^{2}}{2(\mu - M \| x_{k} - x^{*} \|)}.} \end{array}
$$

What is wrong with this result? Note that the description of the region of quadratic convergence (5.1.2) for this method is given in terms of the standard inner product

$$
\langle x, y \rangle = \sum_{i = 1}^{n} x^{(i)} y^{(i)}, \quad x, y \in \mathbb{R}^{n}.
$$

If we choose a new basis in $\mathbb{R}^{n}$ , then all objects in our description change: the metric, the Hessians, the bounds $\mu$ and M. However, let us see what happens in this situation with the Newton process. Namely, let B be a nondegenerate $(n \times n)$ -matrix. Consider the function

$$
\phi(y) = f(By), \quad y \in \mathbb{R}^{n}.
$$

The following result is very important for understanding the nature of the Newton’s method.

Lemma 5.1.1 Let the sequence $\{x_{k}\}$ be generated by the Newton’s method as applied to the function $f.$

$$
x_{k + 1} = x_{k} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}), \quad k \geq 0.
$$

Consider the sequence $\{y_{k}\}$ , generated by the Newton’s method for the function $\phi.$

$$
y_{k + 1} = y_{k} -[\nabla^{2} \phi(y_{k})]^{- 1} \nabla \phi(y_{k}), \quad k \ge 0,
$$

with $y_{0} = B^{- 1} x_{0}$ . Then $y_{k} = B^{- 1} x_{k} forallk \ge 0.$

Proof Let $y_{k} = B^{- 1} x_{k}$ for some $k \geq 0$ . Then

$$
\begin{array}{rl} &{y_{k + 1} = y_{k} -[\nabla^{2} \phi(y_{k})]^{- 1} \nabla \phi(y_{k}) = y_{k} -[B^{T} \nabla^{2} f(By_{k}) B]^{- 1} B^{T} \nabla f(By_{k})} \\ &{\qquad = B^{- 1} x_{k} - B^{- 1}[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}) = B^{- 1} x_{k + 1}.} \end{array}
$$

Thus, the Newton’s method is affine invariant with respect to affine transformations of variables. Therefore, its actual region of quadratic convergence does not depend on a particular choice of the basis. It depends only on the local topological structure of the function $f(\cdot)$

Let us try to understand what was wrong in our assumptions. The main assumption is related to the Lipschitz continuity of the Hessians:

$$
\parallel \nabla^{2} f(x) - \nabla^{2} f(y) \parallel \leq M \parallel x - y \parallel, \quad \forall x, y \in \mathbb{R}^{n}.
$$

Let us assume that $f \in C^{3}(\mathbb{R}^{n})$ . Define

$$
f^{\prime \prime \prime}(x)[u] = \operatorname{lim}_{\alpha 0}{\frac{1}{\alpha}}[\nabla^{2} f(x + \alpha u) - \nabla^{2} f(x)] \equiv D^{3} f(x)[h].
$$

The object in the right-hand side of this equality (and, consequently, in its left-hand side) is an $(n \times n) – \mathrm{matrix}.$ . Thus, our assumption is equivalent to the condition

$$
\parallel f^{\prime \prime \prime}(x)[u] \parallel \leq M \parallel u \parallel.
$$

This means that at any point $x \in \mathbb{R}^{n}$ , we have

$$
\langle f^{\prime \prime \prime}(x)[u] v, v \rangle \ \equiv \D^{3} f(x)[u, v, v] \leq M \parallel u \parallel \cdot \parallel v \parallel^{2} \ \quad \forall u, v \in \mathbb{R}^{n}.
$$

Note that the value in the left-hand side of this inequality is invariant with respect to affine transformations of variables (since this is just a third directional derivative along direction u and twice along direction v). However, its right-hand side does depend on the choice of coordinates. Therefore, the most natural way to improve our situation consists in finding an affine-invariant replacement for the standard Euclidean norm $\| \cdot \|$ . The most natural candidate for such a replacement is quite evident: This is the norm defined by the Hessian $\nabla^{2} f(x)$ itself, namely,

$$
\parallel u \parallel_{\nabla^{2} f(x)}^{2} = \langle \nabla^{2} f(x) u, u \rangle \equiv D^{2} f(x)[h, h].
$$

This choice results in the definition of a self-concordant function.

## 5.1.3 Definition of Self-concordant Functions

Since we are going to work with affine-invariant objects, it is natural to get rid of coordinate representations and denote by E a real vector space for our variables, and by $\mathbb{E}^{*}$ the dual space (see Sect. 4.2.1).

Let us consider a closed convex function $f(\cdot) \in C^{3}(\operatorname{dom} f)$ with open domain. By fixing a point $x \in$ dom $f$ and direction $u \in \mathbb{E}$ , we define a function

$$
\phi(x; t) = f(x + tu),
$$

dependent on the variable $t \in \operatorname{dom} \phi(x; \cdot) \subseteq \mathbb{R}$ . Define

$$
Df(x)[u] = \phi^{\prime}(x; 0) = \langle \nabla f(x), u \rangle,
$$

$$
D^{2} f(x)[u, u] = \phi^{\prime \prime}(x; 0) = \langle \nabla^{2} f(x) u, u \rangle = \parallel u \parallel_{\nabla^{2} f(x)}^{2},
$$

$$
D^{3} f(x)[u, u, u] = \phi^{\prime \prime \prime}(x; 0) = \langle D^{3} f(x)[u] u, u \rangle.
$$

Definition 5.1.1 A function $f$ is called self-concordant if there exists a constant $M_{f} \geq 0$ such that the inequality

$$
| D^{3} f(x)[u, u, u] | \leq 2M_{f} \parallel u \parallel_{\nabla^{2} f(x)}^{3}\tag{5.1.4}
$$

holds for all $x \in$ dom f and $u \in \mathbb{E}$ . If $M_{f} = 1$ , the function is called standard self-concordant.

Note that we are going to use these functions to construct a barrier model of our problem. Our main hope is that they can be easily minimized by the Newton’s method.

Let us point out an equivalent definition of self-concordant functions.

Lemma 5.1.2 A function f is self-concordant if and only if for any $x \in$ dom f and any triple of directions u<sub>1</sub>, u<sub>2</sub>, $u_{3} \in \mathbb{E}$ we have

$$
\mid D^{3} f(x)[u_{1}, u_{2}, u_{3}] \mid \leq 2M_{f} \prod_{i = 1}^{3} \parallel u_{i} \parallel_{\nabla^{2} f(x)}.\tag{5.1.5}
$$

We accept this statement without proof since it needs some special facts from the theory of tri-linear symmetric forms. For the same reason, we accept without proof the following corollary.

Corollary 5.1.1 A function f is self-concordant if and only if for any $x \in$ dom f and any direction $u \in \mathbb{R}^{n}$ we have

$$
D^{3} f(x)[u] \preceq 2M_{f} \| u \|_{\nabla^{2} f(x)} \nabla^{2} f(x).\tag{5.1.6}
$$

In what follows, we often use Definition 5.1.1 in order to prove that some f is self-concordant. In contrast, Lemma 5.1.2 is useful for establishing different properties of self-concordant functions.

Let us consider several examples.

Example 5.1.1

1. Linear function. Consider the function

$$
f(x) = \alpha + \langle a, x \rangle, \quad{\mathrm{dom ~}} f = \mathbb{E}.
$$

Then

$$
\nabla f(x) = a, \quad \nabla^{2} f(x) = 0, \quad \nabla^{3} f(x) = 0,
$$

and we conclude that $M_{f} = 0$

2. Convex quadratic function. Consider the function

$$
f(x) = \alpha + \langle a, x \rangle +{\frac{1}{2}} \langle Ax, x \rangle, \quad{\mathrm{dom ~}} f = \mathbb{E},
$$

where $A = A^{*} \succeq 0$ . Then

$$
\nabla f(x) = a + Ax, \quad \nabla^{2} f(x) = A, \quad \nabla^{3} f(x) = 0,
$$

and we conclude that $M_{f} = 0$

3. Logarithmic barrier for a ray. Consider a univariate function

$$
f(x) = - \ln x, \quad{\mathrm{dom ~}} f = \{x \in \mathbb{R} \mid x > 0\}.
$$

Then

$$
\begin{array}{r}{f^{\prime}(x) = - \frac{1}{x}, \quad f^{\prime \prime}(x) = \frac{1}{x^{2}}, \quad f^{\prime \prime \prime}(x) = - \frac{2}{x^{3}}.} \end{array}
$$

Therefore, $f(\cdot)$ is self-concordant with $M_{f} = 1$

4. Logarithmic barrier for an ellipsoid. Let $A = A^{*} \succeq 0$ . Consider the concave function

$$
\phi(x) = \alpha + \langle a, x \rangle - \frac{1}{2} \langle Ax, x \rangle.
$$

Define $f(x) = - \ln{\phi(x)}$ , with dom $f = \{x \in \mathbb{E} : \phi(x) > 0\}$ . Then

$$
\begin{array}{r}{Df(x)[u] = - \frac{1}{\phi(x)}[\langle a, u \rangle - \langle Ax, u \rangle],} \end{array}
$$

$$
\begin{array}{r}{D^{2} f(x)[u, u] = \frac{1}{\phi^{2}(x)}[\langle a, u \rangle - \langle Ax, u \rangle]^{2} + \frac{1}{\phi(x)} \langle Au, u \rangle,} \end{array}
$$

$$
\begin{array}{r}{D^{3} f(x)[u, u, u] = - \frac{2}{\phi^{3}(x)}[\langle a, u \rangle - \langle Ax, u \rangle]^{3}} \end{array}
$$

$$
\begin{array}{r}{- \frac{3}{\phi^{2}(x)}[\langle a, u \rangle - \langle Ax, u \rangle] \langle Au, u \rangle.} \end{array}
$$

Let $\omega_{1} = Df(x)[u]$ and $\begin{array}{r}{\omega_{2} = \frac{1}{\phi(x)} \langle Au, u \rangle} \end{array}$ . Then

$$
D^{2} f(x)[u, u] = \omega_{1}^{2} + \omega_{2} \geq 0,
$$

$$
\mid D^{3} f(x)[u, u, u] \mid = \mid 2 \omega_{1}^{3} + 3 \omega_{1} \omega_{2} \mid.
$$

The only nontrivial case is $\omega_{1} \neq 0.\mathrm{Let} \xi = \omega_{2} / \omega_{1}^{2}$ . Then

$$
\begin{array}{r}{\frac{| D^{3} f(x)[u, u, u] |}{(D^{2} f(x)[u, u])^{3 / 2}} \leq \frac{2 | \omega_{1} |^{3} + 3 | \omega_{1} | \omega_{2}}{(\omega_{1}^{2} + \omega_{2})^{3 / 2}} = \frac{2(1 + \frac{3}{2} \xi)}{(1 + \xi)^{3 / 2}} \leq 2,} \end{array}
$$

where the last inequality follows from the convexity of the function $(1 + \xi)^{3 / 2}$ for $\xi \ge - 1$ . Thus, the function f is self-concordant and $M_{f} = 1$

5. It is easy to verify that none of the following univariate functions is selfconcordant:

$$
\begin{array}{r}{f(x) = e^{x}, \quad f(x) = \frac{1}{x^{p}}, ~ x > 0, ~ p > 0, ~ f(x) = \mid x ~ \mid^{p}, ~ p > 2.} \end{array}
$$

However the function $\begin{array}{r}{f_{p}(x) = \frac{1}{2} x^{2} + \frac{1}{px^{p}} - \frac{1}{p}} \end{array}$ with $p > 0$ is self-concordant for $x > 0$ . Let us prove this. Indeed,

$$
\begin{array}{r}{f_{p}^{\prime}(x) = x - \frac{1}{x^{p + 1}}, \quad f_{p}^{\prime \prime}(x) = 1 + \frac{p + 1}{x^{p + 2}} \geq 1, \quad f_{p}^{\prime \prime \prime}(x) = - \frac{(p + 1)(p + 2)}{x^{p + 3}}.} \end{array}
$$

If $x \ge 1$ , then

$$
\begin{array}{r}{| f_{p}^{\prime \prime \prime}(x) | = \frac{(p + 1)(p + 2)}{x^{p + 2}} \le(p + 2) f_{p}^{\prime \prime}(x) \le(p + 2)[f_{p}^{\prime \prime}(x)]^{3 / 2}.} \end{array}
$$

If $x \in(0, 1]$ , then

$$
\begin{array}{rl} &{| f_{p}^{\prime \prime \prime}(x) | = \frac{(p + 1)(p + 2)}{x^{p + 3}} \le(p + 1)(p + 2) \left(\frac{1}{x^{p + 2}} \right)^{3 / 2}} \\ &{\qquad \le(p + 1)(p + 2) \left(\frac{f_{p}^{\prime \prime}(x)}{p + 1} \right)^{3 / 2}.} \end{array}
$$

Thus, we can take $\begin{array}{r}{M_{f_{p}} = \operatorname{max} \left\{1 + \frac{p}{2}, \frac{p + 2}{2 \sqrt{p + 1}} \right\} = 1 + \frac{p}{2}} \end{array}$ . Note that the function $f_{p}$ is well defined as $p0$ . Indeed,

$$
\operatorname{lim}_{p \to 0} f_{p}(x) ={\textstyle{\frac{1}{2}}} x^{2} + \operatorname{lim}_{p \to 0}{\frac{1}{p}} \biggl[e^{p \ln{\frac{1}{x}}} - 1 \biggr] ={\textstyle{\frac{1}{2}}} x^{2} - \ln{x}.
$$

6. Let $f \in C_{L_{3}}^{3, 2}(\mathbb{R}^{n})$ . Assume that it is strongly convex on $\mathbb{R}^{n}$ with convexity parameter $\sigma_{2}(f)$ . Then, for any $x \in \mathbb{R}^{n}$ and direction $u \in \mathbb{R}^{n}$ we have

$$
\begin{array}{r}{D^{3} f(x)[u] \preceq L_{3} \| u \| I_{n} \overset{(2.1.28)}{\preceq} L_{3} \left(\frac{1}{\sigma_{2}(f)} \| u \|_{\nabla^{2} f(x)}^{2} \right)^{1 / 2} \frac{1}{\sigma_{2}(f)} \nabla^{2} f(x).} \end{array}
$$

Thus, in view of Corollary 5.1.1, we can take $\begin{array}{r}{M_{f} = \frac{L_{3}}{2 \sigma_{2}^{3 / 2}(f)}} \end{array}$ . □

Let us now look at the main properties of self-concordant functions.

Theorem 5.1.1 Let functions $f_{i}$ be self-concordant with constants $M_{i}, i = 1, 2,$ and let α, $\beta > 0$ . Then the function $f(x) = \alpha f_{1}(x) + \beta f_{2}(x)$ is self-concordant with constant

$$
\begin{array}{r}{M_{f} = \operatorname{max} \left\{\frac{1}{\sqrt{\alpha}} M_{1}, \frac{1}{\sqrt{\beta}} M_{2} \right\}} \end{array}
$$

and dom f dom f<sub>1</sub> $\cap$ dom f<sub>2</sub>.

Proof In view of Theorem 3.1.5, f is a closed convex function. Let us fix some $x \in$ dom f and $u \in \mathbb{E}$ . Then

$$
\mid D^{3} f_{i}(x)[u, u, u] \mid \mid \leq 2M_{i} \left[D^{2} f_{i}(x)[u, u] \right]^{3 / 2}, \quad i = 1, 2.
$$

Let $\omega_{i} = D^{2} f_{i}(x)[u, u] \geq 0$ . Then

$$
\begin{array}{rlr}{\frac{| D^{3} f(x)[u, u, u] |}{[D^{2} f(x)[u, u]]^{3 / 2}} \le \frac{\alpha | D^{3} f_{1}(x)[u, u, u] | + \beta | D^{3} f_{2}(x)[u, u, u] |}{[\alpha D^{2} f_{1}(x)[u, u] + \beta D^{2} f_{2}(x)[u, u]]^{3 / 2}}} &{\le} &{\frac{\alpha M_{1} \omega_{1}^{3 / 2} + \beta M_{2} \omega_{2}^{3 / 2}}{[\alpha \omega_{1} + \beta \omega_{2}]^{3 / 2}}.} \end{array}\tag{5.1.7}
$$

The right-hand side of this inequality does not change when we replace $(\omega_{1}, \omega_{2})$ by $(t \omega_{1}, t \omega_{2})$ with $t > 0$ . Therefore, we can assume that

$$
\alpha \omega_{1} + \beta \omega_{2} = 1.
$$

Let $\xi = \alpha \omega_{1}$ . Then the right-hand side of inequality (5.1.7) becomes equal to

$$
\begin{array}{r}{\frac{M_{1}}{\sqrt{\alpha}} \xi^{3 / 2} + \frac{M_{2}}{\sqrt{\beta}}(1 - \xi)^{3 / 2}, \quad \xi \in[0, 1].} \end{array}
$$

This function is convex in $\xi$ . Therefore it attains its maximum at the end points of the interval (see Corollary 3.1.1).

Corollary 5.1.2 Let a function f be self-concordant with some constant $M_{f}$ . If $A = A^{*} \succeq 0$ , then the function

$$
\phi(x) = \alpha + \langle a, x \rangle + \frac{1}{2} \langle Ax, x \rangle + f(x)
$$

is also self-concordant with constant $M_{\phi} = M_{f}$

Proof We have seen that any convex quadratic function is self-concordant with zero constant.

Corollary 5.1.3 Let a function f be self-concordant with some constant $M_{f}$ and $\alpha \ > \0.$ . Then the function $\phi(x) = \alpha f(x)$ is also self-concordant with constant $\begin{array}{r}{M_{\phi} = \frac{1}{\sqrt{\alpha}} M_{f}} \end{array}$ □

Let us now prove that self-concordance is an affine-invariant property.

Theorem 5.1.2 Let $\mathcal{A}(\boldsymbol{x}) = A \boldsymbol{x} + \boldsymbol{b} \colon \mathbb{E} \mathbb{E}_{1}$ be a linear operator. Assume that a function $f(\cdot)$ is self-concordant with constant $M_{f}$ . Then the function

$$
\phi(x) = f({\mathcal{A}}(x))
$$

is also self-concordant and $M_{\phi} = M_{f}$

Proof The function $\phi(\cdot)$ is closed and convex in view of Theorem 3.1.6. Let us fix some $x \in$ dom $\phi = \{x : \mathcal{A}(x) \in \mathrm{dom} f\}$ and $u \in \mathbb{E}$ . Define $y = \mathcal{A}(x), v = Au$ Then

$$
D \phi(x)[u] = \langle \nabla f({\mathcal{A}}(x)), Au \rangle = \langle \nabla f(y), v \rangle,
$$

$$
D^{2} \phi(x)[u, u] = \langle \nabla^{2} f(\mathcal{A}(x)) Au, Au \rangle = \langle \nabla^{2} f(y) v, v \rangle,
$$

$$
D^{3} \phi(x)[u, u, u] = D^{3} f({\mathcal{A}}(x))[Au, Au, Au] = D^{3} f(y)[v, v, v].
$$

Therefore,

$$
\begin{array}{c}{{\mid D^{3} \phi(x)[u, u, u] \mid = \mid D^{3} f(y)[v, v, v] \mid \leq 2M_{f} \langle \nabla^{2} f(y) v, v \rangle^{3 / 2}}} \\{{{}}} \\{{{} = 2M_{f}(D^{2} \phi(x)[u, u])^{3 / 2}.}} \end{array}
$$

Finally, let us describe the behavior of a self-concordant function near the boundary of its domain.

Theorem 5.1.3 Let f be a self-concordant function. Then for any $\bar{x} \in \partial(domf)$ and any sequence

$$
\begin{array}{rl}{\{x_{k}\} \subset domf :} &{{} x_{k} \to \bar{x}} \end{array}
$$

we have $f(x_{k}) + \infty.$

Proof Since f is a closed convex function with open domain, this statement follows from Item 2 of Theorem 3.1.4.

Thus, f is a barrier function for cl (dom f ) (see Sect. 1.3.3). Finally, let us establish the self-concordance of a logarithmic barrier for the level set of selfconcordant function.

Theorem 5.1.4 Let a function f be self-concordant with constant $M_{f}$ and $f(x) \geq$ $f^{*}$ for all $x \in$ dom f . For arbitrary $\beta > f^{*}$ , consider the function

$$
\phi(x) = - \ln(\beta - f(x)).
$$

Then

1. φ is well defined on dom $\phi = \{x \in$ dom $f : \f(x) < \beta\}$

2. For any x dom φ and $h \in \mathbb{E}$ we have

$$
\langle \nabla^{2} \phi(x) h, h \rangle \geq \langle \nabla \phi(x), h \rangle^{2}.\tag{5.1.8}
$$

3. $\phi$ is self-concordant with constant $M_{\phi} = \sqrt{1 + M_{f}^{2}(\beta - f^{*})}.$

Proof Let us fix $x \in$ dom φ and $h \in \mathbb{E}$ . Consider the function $\psi ( \tau ) = \phi ( x + \tau h ) $ Define $\omega = \beta - f(x)$ . Then

$$
\begin{array}{r}{\psi^{\prime}(0) = \frac{1}{\omega} \langle \nabla f(x), h \rangle, \quad \psi^{\prime \prime}(0) = \frac{1}{\omega} \langle \nabla^{2} f(x) h, h \rangle + \frac{1}{\omega^{2}} \langle \nabla f(x), h \rangle^{2},} \end{array}
$$

$$
\begin{array}{r}{\psi^{\prime \prime \prime}(0) = \frac{1}{\omega} D^{3} f(x)[h, h, h] + \frac{3}{\omega^{2}} \langle \nabla^{2} f(x) h, h \rangle \langle \nabla f(x), h \rangle + \frac{2}{\omega^{3}} \langle \nabla f(x), h \rangle^{3}.} \end{array}
$$

Thus, $\psi^{\prime \prime}(0) \geq(\psi^{\prime}(0))^{2}$ , and this is inequality (5.1.8).

Further, we need to bound $\psi^{\prime \prime \prime}(0)$ from above by $\psi^{\prime \prime}(0)^{3 / 2}$ . Since $f$ is selfconcordant, we have

$$
\begin{array}{rl}{\psi^{\prime \prime \prime}(0) \overset{(5.1.4)}{\leq}} &{\frac{2M_{f}}{\omega} \langle \nabla^{2} f(x) h, h \rangle^{3 / 2} + \frac{3}{\omega^{2}} \langle \nabla^{2} f(x) h, h \rangle \langle \nabla f(x), h \rangle} \\ &{\qquad + \frac{2}{\omega^{3}} \langle \nabla f(x), h \rangle^{3}.} \end{array}
$$

The right-hand side of this inequality is homogeneous in $h$ of degree three. Therefore, let us find an upper bound for it assuming that $\psi^{\prime \prime}(0) = 1$ . Defining

$$
\begin{array}{r}{\tau = \Big(\frac{1}{\omega} \langle \nabla^{2} f(x) h, h \rangle \Big)^{1 / 2}, \quad \xi = \frac{1}{\omega} \langle \nabla f(x), h \rangle,} \end{array}
$$

we come to the following maximization problem:

$$
\operatorname{max}_{\tau, \xi \in \mathbb{R}} \left\{2 \hat{\omega}^{1 / 2} \tau^{3} + 3 \tau^{2} \xi + 2 \xi^{3} : \tau^{2} + \xi^{2} = 1 \right\},
$$

where $\hat{\omega} = M_{f}^{2} \omega$ . Note that the optimal values of $\tau$ and $\xi$ in this problem are nonnegative. Therefore, in view of the equality constraint, we can rewrite the objective function as follows.

$$
\begin{array}{c}{{2 \hat{\omega}^{1 / 2} \tau^{3} + 3 \tau^{2} \xi + 2 \xi^{3} = 2 \hat{\omega}^{1 / 2} \tau^{3} + \tau^{2} \xi + 2 \xi(\tau^{2} + \xi^{2}) \ = \2 \hat{\omega}^{1 / 2} \tau^{3} +(\tau^{2} + 2) \xi}} \\{{{}}} \\{{{}}} \\{{= 2 \hat{\omega}^{1 / 2} \tau^{3} +(\tau^{2} + 2) \sqrt{1 - \tau^{2}}.}} \end{array}
$$

The first-order optimality condition for this univariate function can be written as follows:

$$
\begin{array}{r}{0 = 6 \hat{\omega}^{1 / 2} \tau^{2} + 2 \tau \sqrt{1 - \tau^{2}} -(\tau^{2} + 2) \frac{\tau}{\sqrt{1 - \tau^{2}}} = 6 \hat{\omega}^{1 / 2} \tau^{2} - \frac{3 \tau^{3}}{\sqrt{1 - \tau^{2}}}.} \end{array}
$$

Thus, the optimal value $\tau_{*}$ satisfies equation $\begin{array}{r}{2 \hat{\omega}^{1 / 2} = \frac{\tau_{*}}{\sqrt{1 - \tau_{*}^{2}}}} \end{array}$ . Hence, $\begin{array}{r}{\tau_{*} = \sqrt{\frac{4 \hat{\omega}}{1 + 4 \hat{\omega}}}.} \end{array}$ Substituting this value into the objective function, we come to the following bound:

$$
\begin{array}{r}{2 \hat{\omega}^{1 / 2} \left(\frac{4 \hat{\omega}}{1 + 4 \hat{\omega}} \right)^{3 / 2} + \frac{2 + 12 \hat{\omega}}{(1 + 4 \hat{\omega})^{3 / 2}} = \frac{2 + 12 \hat{\omega} + 16 \omega^{2}}{(1 + 4 \hat{\omega})^{3 / 2}} = 2 \frac{1 + 2 \hat{\omega}}{(1 + 4 \hat{\omega})^{1 / 2}} \leq 2 \sqrt{1 + \hat{\omega}}.} \end{array}
$$

It remains to note that $\hat{\omega} \le M_{f}^{2}(\beta - f^{*})$ .

## 5.1.4 Main Inequalities

Let f be a self-concordant function. Define

$$
\parallel h \parallel_{x} = \langle \nabla^{2} f(x) h, h \rangle^{1 / 2}.
$$

We call $\Vert \h \ \Vert_{x}$ the (primal) local norm of direction h with respect to x. Let us fix a point $x \in$ dom $f$ and a direction $h \in \mathbb{E}$ such that $\langle \nabla^{2} f(x) h, h \rangle > 0$ . Consider the univariate function

$$
\begin{array}{r}{\phi(t) = \frac{1}{\langle \nabla^{2} f({x} + th) h, h \rangle^{1 / 2}}.} \end{array}
$$

In view of the continuity of the second derivative of the function $f, 0 \in \operatorname{int} \left(\operatorname{dom} \phi \right)$

Lemma 5.1.3 For all feasible t, we have $\mid \phi^{\prime}(t) \mid \leq M_{f}$

Proof Indeed,

$$
\begin{array}{r}{\phi^{\prime}(t) = - \frac{D^{3} f(x + th)[h, h, h]}{2 \langle \nabla^{2} f(x + tu) h, h \rangle^{3 / 2}}.} \end{array}
$$

Therefore $\mid \phi^{\prime}(t) \mid \leq M_{f}$ in view of Definition 5.1.1.

Corollary 5.1.4 The domain of function $\phi(\cdot)$ contains the interval

$$
\begin{array}{r}{I_{x} = \left(- \frac{1}{M_{f}} \phi(0), \frac{1}{M_{f}} \phi(0) \right).} \end{array}
$$

Proof Indeed, in view of Lemma 5.1.3, the values $\langle \nabla^{2} f({\boldsymbol{x}} +{\boldsymbol{\tau}} h) h, h \rangle$ are positive at any subinterval of $I_{x}$ and $\phi(t) \geq \phi(0) - M_{f} \mid t \mid$ . Moreover, since $f(x + th) \infty$ as the points $x + th$ approach the boundary of dom f (see Theorem 5.1.3), the cannot intersect the boundary as $t \in I_{x}$ □

Let us consider the following ellipsoids:

$$
\begin{array}{r}{W^{0}(x; r) = \{y \in \mathbb{E} \mid \parallel y - x \parallel_{x} < r\},} \end{array}
$$

$$
\begin{array}{r}{W(x; r) = \operatorname{cl} \big(W^{0}(x; r) \big) = \{y \in \mathbb{E} \mid \| y - x \|_{x} \leq r\}.} \end{array}
$$

This set is called the Dikin ellipsoid of the function f at x.

Theorem 5.1.5 1. For any $x \in$ dom f , we have $\begin{array}{r}{W^{0}(x; \frac{1}{M_{f}}) \subseteq domf.} \end{array}$

2. For all $x, y \in$ dom $f,$ , the following inequality holds:

$$
\begin{array}{r}{\parallel y - x \parallel_{y} \geq \frac{\parallel y - x \parallel_{x}}{1 + M_{f} \parallel y - x \parallel_{x}}.} \end{array}\tag{5.1.9}
$$

3. If $\begin{array}{r}{y \mathrm{~ - ~} x \parallel_{x} < \frac{1}{M_{f}}} \end{array}$ , then

$$
\begin{array}{r}{\parallel y - x \parallel_{y} \leq \frac{\parallel y - x \parallel_{x}}{1 - M_{f} \parallel y - x \parallel_{x}}.} \end{array}\tag{5.1.10}
$$

Proof 1. Let us choose in E a Euclidean norm $\| \cdot \|$ and small $\epsilon > 0$ . Consider the function $\begin{array}{r}{f_{\epsilon}(x) = f(x) + \frac{1}{2} \epsilon \| x \|^{2}} \end{array}$ . In view of Corollary 5.1.2, it is self-concordant with constant $M_{f}$ . Moreover, for any $h \in \mathbb{E}$ we have $\langle \nabla^{2} f_{\epsilon}(x) h, h \rangle > 0$ . Therefore, in view of Corollary 5.1.4, dom $f_{\epsilon} \equiv \operatorname{dom} f$ contains the set

$$
\left\{y = x + th \mid t^{2}(\parallel h \parallel_{x}^{2} + \epsilon \parallel h \parallel^{2}) < \frac 1{M_{f}^{2}} \right\}
$$

(since $\phi(0) = 1 / \langle \nabla^{2} f_{\epsilon}(x) h, h \rangle^{1 / 2})$ . Since $\epsilon$ can be arbitrarily small, this means that dom f contains $\begin{array}{r}{W^{0}(x; \frac{1}{M_{f}})} \end{array}$

2. Let us choose $h ={\dot{y}} - x$ . Assume for a moment that $\| h \|_{x} > 0$ . Then

$$
\begin{array}{r}{\phi(1) = \frac{1}{\| y - x \|_{y}}, \quad \phi(0) = \frac{1}{\| y - x \|_{x}},} \end{array}
$$

and $\phi(1) \leq \phi(0) + M_{f}$ in view of Lemma 5.1.3. This is inequality (5.1.9).

3. If $\begin{array}{r}{y \mathrm{~ - ~} x \parallel_{x} < \frac{1}{M_{f}}} \end{array}$ , then $\phi(0) > M_{f}$ , and in view of Lemma 5.1.3 $\phi(1) \geq$ $\phi(0) - M_{f}$ . This is inequality (5.1.10).

In the case when $\| h \|_{x} = 0$ , both items can be justified by the trick used in the proof of Item 1.

The next statement demonstrates that some local properties of self-concordant functions reflect somehow the global properties of its domain.

Theorem 5.1.6 Let a function f be self-concordant and dom f contains no straight lines. Then the Hessian $\nabla^{2} f(x)$ is nondegenerate at all points $x \in domf.$

Proof Assume that $\langle \nabla^{2} f({\bar{x}}) h, h \rangle = 0$ for some ${\bar{x}} \in$ dom f and direction $h \in \mathbb{E}$ $h \neq 0$ . Then, all points of the line $\{x = \bar{x} + \tau h, \ \tau \in \mathbb{R}\}$ belong to the ellipsoid $\begin{array}{r}{W^{0}(x; \frac{1}{M_{f}})} \end{array}$ . However, in view of Item 1 of Theorem 5.1.5, this ellipsoid belongs to dom $f$ . This contradicts the conditions of the theorem.

Theorem 5.1.7 Let $x \in$ dom f . Then for any $\begin{array}{r}{y \in W^{0}(x; \frac{1}{M_{f}})} \end{array}$ we have

$$
\begin{array}{r}{(1 - M_{f} r)^{2} \nabla^{2} f(x) \preceq \nabla^{2} f(y) \preceq \frac{1}{(1 - M_{f} r)^{2}} \nabla^{2} f(x),} \end{array}\tag{5.1.11}
$$

where $r = \parallel y - x \parallel_{x}$

Proof Let us fix an arbitrary direction $h \in \mathbb{E}, h \neq 0$ . Consider the function

$$
\psi(t) = \langle \nabla^{2} f(x + t(y - x)) h, h \rangle, \quad t \in[0, 1].
$$

Define $y_{t} = x + t(y - x)$ and $r = \| y - x \|_{x}$ . Then, in view of Lemma 5.1.2 and inequality (5.1.10), we have

$$
\begin{array}{rl} &{\mid \psi^{\prime}(t) \mid = \mid D^{3} f(y_{t})[y - x, h, h] \mid \leq 2M_{f} \parallel y - x \parallel_{y_{t}} \parallel h \parallel_{y_{t}}^{2}} \\ &{\qquad = \frac{2M_{f}}{t} \parallel y_{t} - x \parallel_{y_{t}} \psi(t) \leq \frac{2M_{f}}{t} \cdot \frac{\parallel y_{t} - x \parallel_{x}}{1 - M_{f} \parallel y_{t} - x \parallel_{x}} \cdot \psi(t)} \\ &{\qquad = \frac{2M_{f} r}{1 - tM_{f} r} \psi(t).} \end{array}
$$

$\operatorname{If} \| y - x \|_{x} = 0$ , then $\psi(t) = \psi(0), t \in[0, 1]$ , and therefore

$$
\begin{array}{r}{(1 - M_{f} r)^{2} \psi(0) \leq \psi(t) \ \leq \ \frac{1}{(1 - M_{f} r)^{2}} \psi(0).} \end{array}\tag{5.1.12}
$$

If $r > 0,$ , then $2(\ln(1 - tM_{f} r))^{\prime} \leq(\ln \psi(t))^{\prime} \leq - 2(\ln(1 - tM_{f} r))^{\prime}$ for all $t \in[0, 1]$ Integrating these inequalities in $t \in[0, 1]$ , we get again (5.1.12), which is equivalent to (5.1.11) since h was chosen arbitrarily.

Corollary 5.1.5 Let $x \in$ dom f and $\textstyle r = \parallel \y - x \ \parallel_{x} < \{\frac{1}{M_{f}}}$ . Then we can bound the operator

$$
G = \int_{0}^{1} \nabla^{2} f(x + \tau(y - x)) d \tau
$$

as follows:

$$
\begin{array}{r}{\left(1 - M_{f} r + \frac{1}{3} M_{f}^{2} r^{2} \right) \nabla^{2} f(x) \preceq G \preceq \frac{1}{1 - M_{f} r} \nabla^{2} f(x).} \end{array}
$$

Proof Indeed, in view of Theorem 5.1.7 we have

$$
\begin{array}{rl} &{G = \int \nabla^{2} f(x + \tau(y - x)) d \tau \succeq \nabla^{2} f(x) \cdot \int(1 - \tau M_{f} r)^{2} d \tau} \\ &{\quad \quad \quad 0} \\ &{\quad \quad =(1 - M_{f} r + \frac{1}{3} M_{f}^{2} r^{2}) \nabla^{2} f(x),} \end{array}
$$

$$
\begin{array}{r}{\mathrm{and} G \preceq \nabla^{2} f(x) \cdot \int \frac{1}{(1 - \tau M_{f} r)^{2}} = \frac{1}{1 - M_{f} r} \nabla^{2} f(x).\quad \scriptstyle \Pi} \end{array}
$$

Remark 5.1.1 The statement of Corollary 5.1.5 remains valid for $r = \| y - x \|_{y}$

Let us now recall the most important facts we have already proved.

- At any point $x \in$ dom f we can define an ellipsoid

$$
\begin{array}{r}{W^{0} \left(x; \frac{1}{M_{f}} \right) = \left\{x \in \mathbb{E} \mid \langle \nabla^{2} f(x)(y - x), y - x) \rangle < \frac{1}{M_{f}^{2}} \right\},} \end{array}
$$

belonging to dom $f.$

- Inside the ellipsoid $W(x; r)$ with $r \in[0, \frac{1}{M_{f}})$ the function f is almost quadratic:

$$
\begin{array}{r}{(1 - M_{f} r)^{2} \nabla^{2} f(x) \preceq \nabla^{2} f(y) \ \preceq \ \frac{1}{(1 - M_{f} r)^{2}} \nabla^{2} f(x)} \end{array}
$$

for all $\begin{array}{r}{{\boldsymbol{y}} \in W({\boldsymbol{x}}; r)} \end{array}$ . Choosing r small enough, we can make the quality of quadratic approximation acceptable for our goals.

These two facts form the basis for all consequent results.

Let us now prove several inequalities related to the divergence of the value of a self-concordant function with respect to its linear approximation.

Theorem 5.1.8 For any x, $y \in$ dom f , we have

$$
\begin{array}{r}{\langle \nabla f(y) - \nabla f(x), y - x \rangle \ge \frac{\| y - x \|_{x}^{2}}{1 + M_{f} \| y - x \|_{x}},} \end{array}\tag{5.1.13}
$$

$$
\begin{array}{r}{f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{M_{f}^{2}} \omega(M_{f} \parallel y - x \parallel_{x}),} \end{array}\tag{5.1.14}
$$

where $\omega(t) = t - \ln(1 + t)$

Proof Let $y_{\tau} = x + \tau(y - x), \tau \in[0, 1]$ , and $r = \parallel y - x \parallel_{x}$ . Then, in view of (5.1.9) we have

$$
\begin{array}{rl} &{\langle \nabla f(y) - \nabla f(x), y - x \rangle = \displaystyle \int \langle \nabla^{2} f(y_{\tau})(y - x), y - x \rangle d \tau} \\ &{\quad \quad \quad = \displaystyle \int \frac{1}{\tau^{2}} \ \| y_{\tau} - x \|_{\mathfrak{p}_{\tau}}^{2} d \tau} \\ &{\quad \quad \quad = \displaystyle \int \frac{1}{0} \frac{1}{(1 + \tau M_{f} r)^{2}} d \tau = \frac{{\cal T}}{M_{f}} \ \displaystyle \int \frac{1}{0} dt = \frac{r^{2}}{1 + M_{f} r}.} \end{array}
$$

Further, using (5.1.13), we obtain

$$
\begin{array}{rl} &{\quad f(y) - f(x) - \langle \nabla f(x), y - x \rangle \ = \ \int \langle \nabla f(y_{\tau}) - \nabla f(x), y - x \rangle d \tau} \\ &{\quad = \ \int \frac{1}{\tau} \langle \nabla f(y_{\tau}) - \nabla f(x), y_{\tau} - x \rangle d \tau \ \ge \ \int \ \frac{1}{\tau} \frac{\| y_{\tau} - x \|_{x}^{2}}{\tau(1 + M_{f} \| y_{\tau} - x \|_{x})} d \tau \ = \ \int \ \frac{1}{0} \frac{\tau r^{2}}{1 + \tau M_{f} r} d \tau} \\ &{\quad = \frac{M_{f} r}{M_{f}^{2}} \ \int \ \frac{tdt}{0} \ = \ \frac{1}{M_{f}^{2}} \omega(M_{f} r).} \end{array}
$$

□

Theorem 5.1.9 $Letx \in$ dom f and $\begin{array}{r}{y \mathrm{~ - ~} x \parallel_{x} < \frac{1}{M_{f}}} \end{array}$ . Then

$$
\begin{array}{rl} &{\langle \nabla f(y) - \nabla f(x), y - x \rangle \leq \frac{\| y - x \|_{x}^{2}}{1 - M_{f} \| y - x \|_{x}},} \\ &{} \\ &{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} \parallel y - x \parallel_{x}),} \end{array}\tag{5.1.15}
$$

(5.1.16)

where $\omega_{*}(t) = - t - \ln(1 - t)$

Proof Let $y_{\tau} = x + \tau(y - x), \tau \in[0, 1]$ , and $r = \parallel y - x$ <sub>x</sub>. Since $\begin{array}{r}{y_{\tau} - x \parallel < \frac{1}{M_{f}}} \end{array}$ in view of (5.1.10) we have

$$
\begin{array}{rl} &{\langle \nabla f(y) - \nabla f(x), y - x \rangle = \displaystyle \int \langle \nabla^{2} f(y_{\tau})(y - x), y - x \rangle d \tau} \\ &{\quad \quad \quad = \displaystyle \int \frac{1}{\tau^{2}} \ \| y_{\tau} - x \|_{\mathfrak{p}_{\tau}}^{2} d \tau} \\ &{\quad \quad \quad = \displaystyle \int \frac{1}{0} \frac{1}{(1 - \tau M_{f} r)^{2}} d \tau = \frac{{\cal T}}{M_{f}} \ \int \frac{1}{(1 - t)^{2}} dt \ = \frac{r^{2}}{1 - M_{f} r}.} \end{array}
$$

Further, using (5.1.15), we obtain

$$
\begin{array}{rl} &{\quad f(y) - f(x) - \langle \nabla f(x), y - x \rangle \ = \ \overset{1}{\int} \langle \nabla f(y_{\tau}) - \nabla f(x), y - x \rangle d \tau} \\ &{\quad = \ \overset{1}{\int} \frac{1}{\tau} \langle \nabla f(y_{\tau}) - \nabla f(x), y_{\tau} - x \rangle d \tau \ \leq \ \overset{1}{\int} \frac{\| y_{\tau} - x \|_{x}^{2}}{\tau(1 - M_{f} \| y_{\tau} - x \|_{x})} d \tau = \overset{1}{\int} \frac{\tau r^{2}}{1 - \tau M_{f} r} d \tau} \\ &{\quad = \frac{M_{f} r}{M_{f}^{2}} \ \underset{0}{\overset{i}{\prod}} \frac{dt}{1 - t} = \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r).} \end{array}
$$

□

Theorem 5.1.10 Inequalities (5.1.9), (5.1.10), (5.1.13), (5.1.14), (5.1.15) and (5.1.16) are necessary and sufficient characteristics of self-concordant functions.

Proof We have already justified two sequences of implications:

$$
\mathrm{Definition} 5.1.1 \Rightarrow \(5.1.9) \ \Rightarrow \(5.1.13) \Rightarrow \(5.1.14),
$$

$$
\mathrm{Definition} 5.1.1 \Rightarrow \(5.1.10) \Rightarrow \(5.1.15) \Rightarrow \(5.1.16).
$$

Let us prove the implication (5.1.14) Definition 5.1.1. Let $x \in$ dom f and $x -$ αu dom f for $\alpha \in[0, \epsilon)$ . Consider the function

$$
\psi(\alpha) = f(x - \alpha u), \quad \alpha \in[0, \epsilon).
$$

Let $r = \| u \|_{x} \equiv[\psi^{\prime \prime}(0)]^{1 / 2}$ . Assuming that (5.1.14) holds for all x and y from dom $f_{\cdot}$ , we have

$$
\begin{array}{r}{\psi(\alpha) - \psi(0) - \psi^{\prime}(0) \alpha - \frac 12 \psi^{\prime \prime}(0) \alpha^{2} \geq \frac{1}{M_{f}^{2}} \omega(\alpha M_{f} r) - \frac 12 \alpha^{2} r^{2}.} \end{array}
$$

Therefore

$$
\begin{array}{rl} &{\frac{1}{6} \psi^{\prime \prime \prime}(0) = \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{1}{\alpha^{3}} \left[\psi(\alpha) - \psi(0) - \psi^{\prime}(0) \alpha - \frac{1}{2} \psi^{\prime \prime}(0) \alpha^{2} \right]} \\ &{\quad \quad \quad \quad \quad \geq \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{1}{\alpha^{3}} \left[\frac{1}{M_{f}^{2}} \omega(\alpha M_{f} r) - \frac{1}{2} \alpha^{2} r^{2} \right] = \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{r}{3 \alpha^{2}} \left[\frac{1}{M_{f}} \omega^{\prime}(\alpha M_{f} r) - \alpha r \right]} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad} \\ &{= \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{r}{3 \alpha^{2}} \left[\frac{\alpha r}{1 + \alpha M_{f} r} - \alpha r \right] = - \frac{1}{3} M_{f} r^{3}.} \end{array}
$$

Therefore, $D^{3} f(x)[u, u, u] \ = \ - \psi^{\prime \prime \prime}(0) \ \leq \2M_{f}[\psi^{\prime \prime}(0)]^{3 / 2}$ and this is Definition 5.1.1. Implication (5.1.16) Definition 5.1.1 can be proved in a similar way.

Sometimes Theorem 5.1.10 is convenient for establishing self-concordance of certain functions. Let us demonstrate this with an Implicit Function Theorem.

Let us assume that $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2}$ . Thus, we have a corresponding partition of variable $z =(x, y) \in \mathbb{E}$ . Let $\phi$ be a self-concordant function with dom $\phi \subseteq \mathbb{E}$ Consider the following implicit function:

$$
f(x) = \operatorname{min}_{y} \{\phi(x, y) : \(x, y) \in \operatorname{dom} \phi\}.\tag{5.1.17}
$$

In order to simplify the situation, let us assume that for any x such that the set $Q(x) = \{y :(x, y) \in \operatorname{dom} \phi\}$ is nonempty, it does not contain a straight line. Then simple conditions, like boundedness of $\boldsymbol{\phi}$ from below, guarantee existence of the unique solution $y(x)$ of the optimization problem in (5.1.17) (see Sect. 5.1.5).

Anyway, let us assume existence of point $y(x)$ . Then it is characterized by the first-order optimality condition:

$$
\nabla_{y} \phi(x, y(x)) = 0.\tag{5.1.18}
$$

Moreover, by Theorem 3.1.25 and Lemma 3.1.10, we have

$$
\nabla f(x) = \nabla_{x} \phi(x, y(x)).\tag{5.1.19}
$$

Let us compute the Hessian of the function $f.$ . Differentiating equation (5.1.18) along direction $h \in{\mathbb{E}}_{1}$ , we get

$$
\nabla_{yx}^{2} \phi(x, y(x)) h + \nabla_{yy}^{2} \phi(x, y(x)) y^{\prime}(x) h = 0.
$$

Therefore, by differentiating equality (5.1.19) along direction h, we obtain

$$
\begin{array}{rl} &{\quad \nabla^{2} f(x) h \ = \ \nabla_{xx}^{2} \phi(x, y(x)) h + \nabla_{xy}^{2} \phi(x, y(x)) y^{\prime}(x) h} \\ &{\quad = \nabla_{xx}^{2} \phi(x, y(x)) h - \nabla_{xy}^{2} \phi(x, y(x))[\nabla_{yy}^{2} \phi(x, y(x))]^{- 1} \nabla_{yx}^{2} \phi(x, y(x)) h.} \end{array}\tag{5.1.20}
$$

Theorem 5.1.11 Let Φ be a self-concordant function. Then the function f defined by (5.1.17) is also self-concordant with constant $M_{\phi}$

Proof Let us $\operatorname{fix}{\bar{x}} ~ \in$ dom $f$ . Define $\bar{z} =(\bar{x}, y(\bar{x}))$ and let $x \in$ dom $f.$ . Then with $z =(x, y)$ , we have

$$
\begin{array}{rcl}{f(x)} &{=} &{\displaystyle \operatorname{min}_{y \in Q(x)} \phi(x, y)} \\ & &{\mathrm{}} \\ & &{\displaystyle \stackrel{(5.1.14)}{\geq} \operatorname{min}_{y \in Q(x)} \left\{\phi(\bar{x}, y(\bar{x})) + \langle \nabla \phi(\bar{x}, y(\bar{x})), z - \bar{z} \rangle + \frac{1}{M_{f}^{2}} \omega(M_{f} \| z - \bar{z} \|_{\bar{z}}) \right\}} \\ & &{\displaystyle(5.\underline{{{1}}}.19)} \\ & &{\displaystyle \stackrel{(5.\underline{{{\bf{l}}}}.1.19)}{=} f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle_{E_{1}} + \frac{1}{M_{f}^{2}} \omega \left(M_{f} \operatorname{min}_{y \in \mathcal{Q}(x)} \| z - \bar{z} \|_{\bar{z}} \right).} \end{array}
$$

It remains to compute the minimum in the last line. Let $h = x -{\bar{x}}$ . Then

$$
\begin{array}{rl} &{\underset{y \in \mathcal{Q}(x)}{\mathrm{min}} ~ \Vert z - \bar{z} \Vert_{z}^{2} = \langle \nabla_{xx}^{2} \phi(\bar{z}) h, h \rangle_{\mathbb{E}_{1}}} \\ &{+ \underset{y \in \mathcal{Q}(x)}{\mathrm{min}} \left[2 \langle \nabla_{xy}^{2} \phi(\bar{z})(y - \bar{y}), h \rangle_{\mathbb{E}_{1}} + \langle \nabla_{yy}^{2} \phi(\bar{z})(y - \bar{y}), y - \bar{y} \rangle_{\mathbb{E}_{2}} \right]} \\ &{+ \underset{y \in \mathcal{Q}(x)}{\mathrm{min}} \left[2 \langle \nabla_{x}^{2} \phi(\bar{z}) h, h \rangle_{\mathbb{E}_{1}} + \underset{\delta \in \mathbb{E}_{2}}{\mathrm{min}} \left\{2 \langle \nabla_{xy}^{2} \phi(\bar{z}) \delta, h \rangle_{\mathbb{E}_{1}} + \langle \nabla_{yy}^{2} \phi(\bar{z}) \delta, \delta \rangle_{\mathbb{E}_{2}} \right\} \right.} \\{\geq} &{\langle \nabla_{xx}^{2} \phi(\bar{z}) h, h \rangle_{\mathbb{E}_{1}} - \langle \nabla_{yy}^{2} \phi(\bar{z}) \rangle^{- 1} \nabla_{yx}^{2} \phi(\bar{z}) h, \nabla_{yx}^{2} \phi(\bar{z}) h \rangle_{\mathbb{E}_{1}}} \\{=} & \langle \nabla_{xx}^{2} \phi(\bar{z}) h, h \rangle_{\mathbb{E}_{1}} - \langle \nabla_{yy}^{2} \phi(\bar{z}) \rangle^{- 1} \nabla_{yx}^{2} \phi(\bar{z}) h, \nabla_{yx}^{2} \phi(\bar{z}) h \rangle_\mathrm \end{array}
$$

It remains to apply Theorem 5.1.10.

Let us prove two more inequalities. From now on, we assume that dom f contains no straight lines. In this case, in view of Theorem 5.1.6, all Hessians $\nabla^{2} f(x)$ with x dom f are nondegenerate. Denote by

$$
\parallel g \parallel_{x}^{*} = \langle g,[\nabla^{2} f(x)]^{- 1} g \rangle^{1 / 2}, \quad g \in \mathbb{E}^{*},
$$

the dual local norm. Clearly, $\mid \left.g, h \right.\mid \leq \parallel g \parallel_{x}^{*} \cdot \parallel h \parallel_{x}$

Theorem 5.1.12 For any x and y from dom f we have

$$
\begin{array}{r}{f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{M_{f}^{2}} \omega(M_{f} \| \nabla f(y) - \nabla f(x) \|_{y}^{*}).} \end{array}\tag{5.1.21}
$$

If in addition $\begin{array}{r}{\| \nabla f(y) - \nabla f(x) \|_{y}^{*} < \frac{1}{M_{f}}} \end{array}$ , then

$$
\begin{array}{r}{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} \| \nabla f(y) - \nabla f(x) \|_{y}^{*}).} \end{array}\tag{5.1.22}
$$

Proof Let us fix arbitrary points x and y from dom f . Consider the function

$$
\phi(z) = f(z) - \langle \nabla f(x), z \rangle, \quad z \in \operatorname{dom} f.
$$

Note that this function is self-concordant and $\nabla \phi(x) ~ = ~ 0$ . Therefore, using inequality (5.1.16), we get

$$
\begin{array}{l}{f(x) - \langle \nabla f(x), x \rangle = \phi(x) = \displaystyle \operatorname{min}_{z \in \mathrm{dom} f} \phi(z)} \\{\displaystyle \qquad} \\{\le \displaystyle \operatorname{min}_{z} \left\{\phi(y) + \langle \nabla \phi(y), z - y \rangle + \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} \| z - y \|_{\mathfrak{y}}) : \| z - y \|_{\mathfrak{y}} < \frac{1}{M_{f}} \right\}} \end{array}
$$

$$
\begin{array}{rl} &{= \underset{0 \leq \tau < 1}{\operatorname{min}} \Bigg \{\phi(y) - \frac{\tau}{M_{f}} \| \nabla \phi(y) \|_{y}^{*} + \frac{1}{M_{f}^{2}} \omega_{*}(\tau) \Bigg\} = \ \phi(y) - \frac{1}{M_{f}^{2}} \omega(M_{f} \| \nabla \phi(y) \|_{y}^{*})} \\ &{= f(y) - \langle \nabla f(x), y \rangle - \frac{1}{M_{f}^{2}} \omega(M_{f} \| \nabla f(y) - \nabla f(x) \|_{y}^{*}),} \end{array}
$$

and this is inequality (5.1.21). In order to prove inequality (5.1.22), we use a similar reasoning based on inequality (5.1.14).

All theorems above are written in terms of two auxiliary univariate functions,

$$
\omega(t) = t - \ln(1 + t), \quad \omega_{*}(\tau) = - \tau - \ln(1 - \tau).
$$

Note that

$$
\begin{array}{r}{\omega^{\prime}(t) = \frac{t}{1 + t} \ \geq \0, \omega^{\prime \prime}(t) = \frac{1}{(1 + t)^{2}} \ > \0,} \end{array}
$$

$$
\begin{array}{r}{\omega_{*}^{\prime}(\tau) = \frac{\tau}{1 - \tau} \ \geq \0, \ \omega_{*}^{\prime \prime}(\tau) = \frac{1}{(1 - \tau)^{2}} \ > \0.} \end{array}
$$

Therefore, $\omega(\cdot)$ and $\omega_{*}(\cdot)$ are convex functions. In what follows, we often use different relations between these objects. Let us provide them with a formal justification.

Lemma 5.1.4 For any $t \geq 0$ and $\tau \in[0, 1)$ , we have

$$
\omega^{\prime}(\omega_{*}^{\prime}(\tau)) = \tau, \quad \omega_{*}^{\prime}(\omega^{\prime}(t)) = t,
$$

$$
\omega(t) \ = \ \operatorname{max}_{0 \leq \xi < 1}[\xi t - \omega_{*}(\xi)], \quad \omega_{*}(\tau) \ = \ \operatorname{max}_{\xi \geq 0}[\xi \tau - \omega(\xi)],
$$

$$
\omega(t) + \omega_{*}(\tau) \ \geq \ \tau t,
$$

$$
\omega_{*}(\tau) = \tau \omega_{*}^{\prime}(\tau) - \omega(\omega_{*}^{\prime}(\tau)), \omega(t) = t \omega^{\prime}(t) - \omega_{*}(\omega^{\prime}(t)).
$$

We leave the proof of this lemma as an exercise for the reader. Note that the main reason for the above relations is that functions $\omega(t)$ and $\omega_{*}(t)$ are Fenchel conjugate (see definition (3.1.27)).

Functions $\omega(\cdot)$ and $\omega_{*}(\cdot)$ will often be used for estimating the rate of growth of self-concordant functions. Sometimes, it is more convenient to replace them by appropriate lower and upper bounds.

Lemma 5.1.5 For any $t \geq 0$ we have

$$
\begin{array}{r}{\frac{t^{2}}{2(1 + t)} ~ \le ~ \frac{t^{2}}{2 \left(1 + \frac{2}{3} t \right)} ~ \le ~ \omega(t) \le \frac{t^{2}}{2 + t},} \end{array}\tag{5.1.23}
$$

and for $t \in[0, 1)$ ),

$$
\begin{array}{r}{\frac{t^{2}}{2 - t} \ \leq \ \omega_{*}(t) \leq \frac{t^{2}}{2(1 - t)}.} \end{array}\tag{5.1.24}
$$

Proof Let $\begin{array}{r}{\psi_{1}(t) = \frac{t^{2}}{2 \left(1 + \frac{2}{3} t \right)}} \end{array}$ . Note that $\psi_{1}(0) = \omega(0) = 0$ . At the same time,

$$
\begin{array}{r}{\psi_{1}^{\prime}(t) = \frac{t}{1 + \frac{2}{3} t} - \frac{t^{2}}{3 \left(1 + \frac{2}{3} t \right)^{2}} = \frac{t(3 + t)}{3 \left(1 + \frac{2}{3} t \right)^{2}} \leq \frac{t}{1 + t} = \omega^{\prime}(t).} \end{array}
$$

Similarly, for $\textstyle \psi_{2}(t) ={\frac{t^{2}}{2 + t}}$ , we have

$$
\begin{array}{r}{\psi_{2}^{\prime}(t) = \frac{2t}{2 + t} - \frac{t^{2}}{(2 + t)^{2}} = \frac{4t + t^{2}}{(2 + t)^{2}} \geq \frac{t}{1 + t} = \omega^{\prime}(t).} \end{array}
$$

For the second inequality, let $\begin{array}{r}{\psi_{3}(t) = \frac{t^{2}}{2 - t}} \end{array}$ and $\begin{array}{r}{\psi_{4}(t) = \frac{t^{2}}{2(1 - t)}} \end{array}$ . Then

$$
\begin{array}{r}{\psi_{3}^{\prime}(t) = \frac{2t}{2 - t} + \frac{t^{2}}{(2 - t)^{2}} = \frac{4t - t^{2}}{(2 - t)^{2}} \leq \frac{t}{1 - t},} \end{array}
$$

$$
\begin{array}{r}{\psi_{4}^{\prime}(t) = \frac{t}{1 - t} + \frac{t^{2}}{2(1 - t)^{2}} = \frac{2t - t^{2}}{2(1 - t)^{2}} \geq \frac{t}{1 - t}.} \end{array}
$$

Since $\begin{array}{r}{\frac{t}{1 - t} ~ = ~ \omega_{*}^{\prime}(t)} \end{array}$ and $\omega_{*}(0) \ = \ \psi_{3}(0) \ = \ \psi_{4}(0) \ = \0$ , we get (5.1.24) by integration.

## 5.1.5 Self-Concordance and Fenchel Duality

Let us start with some preliminary results. Consider the following minimization problem:

$$
\operatorname{min} \{f(x) \mid x \in \operatorname{dom} f\},\tag{5.1.25}
$$

where we assume that $f$ is self-concordant and all Hessians $\nabla^{2} f(x), x \in$ dom $f$ are positive definite. In view of Theorem 5.1.6, this can be derived from the fact that dom $f$ contains no straight lines. Or, we can assume that $f$ is strongly convex.

Define

$$
\lambda_{f}(x) = \langle \nabla f(x),[\nabla^{2} f(x)]^{- 1} \nabla f(x) \rangle^{1 / 2}.
$$

We call $\lambda_{f}(x) = \parallel \nabla f(x) \parallel_{x}^{*}$ the local norm of the gradient $\nabla f(x).^{4}$

The next theorem provides us with a sufficient condition for existence of solution of problem (5.1.25).

Theorem 5.1.13 Let $\begin{array}{r}{\lambda_{f}(x) < \frac{1}{M_{f}}} \end{array}$ for some $x \in$ dom $f.$ . Then there exists a unique solution $\boldsymbol{x}_{f}^{*}$ of problem (5.1.25) and

$$
\begin{array}{r}{f(x) - f(x_{f}^{*}) \leq \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} \lambda_{f}(x)).} \end{array}\tag{5.1.26}
$$

Proof Indeed, in view of (5.1.14), for any $y \in$ dom f we have

$$
\begin{array}{rl} &{f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{M_{f}^{2}} \omega(M_{f} \parallel y - x \parallel_{x})} \\ &{\qquad = f(x) - \lambda_{f}(x) \cdot \parallel y - x \parallel_{x} + \frac{1}{M_{f}^{2}} \omega(M_{f} \parallel y - x \parallel_{x})} \\ &{\qquad = f(x) + \left(\frac{1}{M_{f}} - \lambda_{f}(x) \right) \parallel y - x \parallel_{x} - \frac{1}{M_{f}^{2}} \ln(1 + M_{f} \parallel y - x \parallel_{x}).} \end{array}
$$

Thus, the level set $\mathcal{L}_{f}(f(x))$ is bounded and therefore $\boldsymbol{x}_{f}^{*}$ exists. It is unique since in view of (5.1.14), for all $y \in$ dom f we have

$$
\begin{array}{r}{f(y) \geq f(x_{f}^{*}) + \frac{1}{M_{f}^{2}} \omega(M_{f} \parallel y - x_{f}^{*} \parallel_{x_{f}^{*}}).} \end{array}
$$

Finally, taking in (5.1.22) $x = x^{*}$ and $y = x$ , we get inequality (5.1.26).

Thus, we have proved that a local condition $\begin{array}{r}{\lambda_{f}(x) < \frac{1}{M_{f}}} \end{array}$ provides us with some global information on the function $f,$ namely, the existence of the minimum $\boldsymbol{x}_{f}^{*}$ Note that the result of Theorem 5.1.13 cannot be strengthened.

Example 5.1.2 Let us fix some $\epsilon > 0$ . Consider a function of one variable

$$
f_{\epsilon}(x) = \epsilon x - \ln x, \quad x > 0.
$$

This function is self-concordant in view of Example 5.1.1 and Corollary 5.1.2. Note that

$$
\begin{array}{r}{\nabla f_{\epsilon}(x) = \epsilon - \frac{1}{x}, \quad \nabla^{2} f_{\epsilon} = \frac{1}{x^{2}}.} \end{array}
$$

Therefore $\lambda_{f_{\epsilon}}(x) = \mid 1 - \epsilon x \mid$ . Thus, for $\epsilon = 0$ we have $\lambda_{f_{0}}(x) = 1$ for any $x > 0$ Note that the function f is not bounded below.

If $\epsilon > 0$ , then $\begin{array}{r}{x_{f_{\epsilon}}^{*} = \frac{1}{\epsilon}} \end{array}$ . However, we can guarantee the existence of this point by collecting information at the point $x = 1$ even if $\epsilon$ is arbitrary small.

Theorem 5.1.13 has several important consequences. One of them is called the Theorem on Recession Direction. Note that for its validity, we do not need the assumption that all Hessians of the function $f$ are positive definite.

Theorem 5.1.14 Let $h \in \mathbb{E}$ be a recession direction of the self-concordant function $f \colon for$ any $x \in$ dom f we have

$$
\langle \nabla f(x), h \rangle \leq 0,
$$

and there exists $a \tau = \tau(x)$ such that $x - \tau h \in \partial domf$ . Then

$$
\langle \nabla^{2} f(x) h, h \rangle^{1 / 2} \leq M_{f} \langle - \nabla f(x), h \rangle, \quad x \in domf.\tag{5.1.27}
$$

Proof Let us fix an arbitrary $x \in$ dom $f.$ . Consider a univariate function $\phi(\tau) =$ $f(x + \tau h)$ . This function is self-concordant and $0 \in$ dom φ. As dom $\phi$ contains no straight line, by Theorem 5.1.6, $\phi^{\prime \prime}(\tau) > 0$ for all $\tau \in$ dom $\phi$ . Therefore, we must have

$$
\begin{array}{r}{\lambda_{\phi}^{2}(0) \equiv \frac{\langle \nabla f(x), h \rangle^{2}}{\langle \nabla^{2} f(x) h, h \rangle} \geq \frac{1}{M_{f}^{2}}} \end{array}
$$

since otherwise, by Theorem 5.1.13, the minimum of $\phi(\cdot)$ exists. Thus,

$$
\begin{array}{r}{\langle \nabla f(x), h \rangle^{2} \geq \frac{1}{M_{f}^{2}} \langle \nabla^{2} f(x) h, h \rangle,} \end{array}
$$

and we get (5.1.27) taking into account the sign of the first derivative.

Let us consider now the scheme of the Damped Newton’s method.

## Damped Newton’s method

0. Choose x<sub>0</sub> dom f.

$$
\begin{array}{r}{\mathbf{1}.\operatorname{Iterate} x_{k + 1} = x_{k} - \frac{1}{1 + M_{f} \lambda_{f}(x_{k})}[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}), k \ge 0.} \end{array}\tag{5.1.28}
$$

Theorem 5.1.15 For any $k \geq 0,$ , we have

$$
\begin{array}{r}{f(x_{k + 1}) \leq f(x_{k}) - \frac{1}{M_{f}^{2}} \omega(M_{f} \lambda_{f}(x_{k})).} \end{array}\tag{5.1.29}
$$

Proof Let $\lambda = \lambda_{f}(x_{k})$ . Then $\begin{array}{r}{\parallel \boldsymbol{x}_{k + 1} - \boldsymbol{x}_{k} \parallel_{\boldsymbol{x}_{k}} = \frac{\lambda}{1 + M_{f} \lambda} = \frac{1}{M_{f}} \omega^{\prime}(M_{f} \lambda)} \end{array}$ . Therefore, in view of (5.1.16) and Lemma 5.1.4, we have

$$
\begin{array}{rl} &{f(x_{k + 1}) \leq f(x_{k}) + \langle \nabla f(x_{k}), x_{k + 1} - x_{k} \rangle + \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} \parallel x_{k + 1} - x_{k} \parallel_{x})} \\ &{\qquad = f(x_{k}) - \frac{\lambda^{2}}{1 + M_{f} \lambda} + \frac{1}{M_{f}^{2}} \omega_{*}(\omega^{\prime}(M_{f} \lambda))} \\ &{\qquad = f(x_{k}) - \frac{\lambda}{M_{f}} \omega^{\prime}(M_{f} \lambda) + \frac{1}{M_{f}^{2}} \omega_{*}(\omega^{\prime}(M_{f} \lambda))} \\ &{\qquad = f(x_{k}) - \frac{1}{M_{f}^{2}} \omega(M_{f} \lambda).} \end{array}
$$

Thus, for all $x \in \operatorname{dom} f$ with $\lambda_{f}(x) \geq \beta > 0$ , one step of the damped Newton’s Method decreases the value of the function $f(\cdot)$ at least by a constant $\frac{1}{M_{f}^{2}} \omega(M_{f} \beta) >$ 0. Note that the result of Theorem 5.1.15 is global. In Sect. 5.2 it will be used to obtaine a global efficiency bound of the process. However, now we employ it to prove an existence theorem. Recall that we assume that dom $f$ contains no straight line.

Theorem 5.1.16 Let a self-concordant function f be bounded below. Then it attains its minimum at a single point.

Proof Indeed, assume that $f(x) \geq f^{*}$ for all $x \in$ dom $f.$ . Let us start the process (5.1.28) from some $x_{0} ~ \in ~ \operatorname{dom} f$ . If the number of steps of this method exceeds $M_{f}^{2}(f(x_{0}) - f^{*}) / \omega(1)$ , then in view of (5.1.29) we must get a point $x_{k}$ J with $\begin{array}{r}{\lambda_{f}(x_{k}) < \frac{1}{M_{f}}} \end{array}$ . However, by Theorem 5.1.13 this implies the existence of a point $\vx_{f}^{*}$ . It is unique since all Hessians of the function $f$ are nondegenerate.

Now we can introduce the Fenchel dual of a self-concordant function $f$ (sometimes called a conjugate function, or dual function of $f)$ . For $s \in \mathbb{E}^{*}$ , the value of this function is defined as follows:

$$
f_{*}(s) = \operatorname{sup}_{x \in \mathrm{dom} f}[\langle s, x \rangle - f(x)].\tag{5.1.30}
$$

Clearly, dom $f_{*} = \{s \in \mathbb{E}^{*} : \f(x) - \langle s, x \rangle$ is bounded below on dom $f\}$

Lemma 5.1.6 The function $f_{*}$ is a closed convex function with nonempty open domain. Moreover, dom $f_{*} = \{\nabla f(x) : x \in domf\}$

Proof Indeed, for any $\bar{x} \in \operatorname{dom} f.$ , we have $\nabla f({\bar{x}}) \in \operatorname{dom} f_{*}$ . On the other hand, if $s \in \operatorname{dom} f_{*}$ , then $f(x) - \langle s, x \rangle$ is below bounded. Hence, by Theorem 5.1.16 and the first-order optimality condition, there exists an $x \in$ dom $f$ such that $s = \nabla f(x)$

Further, the epigraph of the function $f_{*}$ is an intersection of half-spaces

$$
\{(s, \tau) \in \mathbb{E}^{*} \times \mathbb{R} : \tau \geq \langle s, x \rangle - f(x)\}, \quad x \in \operatorname{dom} f,
$$

which are closed and convex. Therefore, the epigraph of $f_{*}$ is also closed and convex.

Suppose for $s_{1}$ and $s_{2}$ from dom $f_{*}$ we have

$$
f(x) - \langle s_{1}, x \rangle \geq f_{1}^{*}, \quad f(x) - \langle s_{2}, x \rangle \geq f_{2}^{*}
$$

for all $x \in$ dom $f.$ . Then, for any $\alpha \in[0, 1]$

$$
\begin{array}{rl} &{f(x) - \langle \alpha s_{1} +(1 - \alpha) s_{2}, x \rangle = \alpha(f(x) - \langle s_{1}, x \rangle) +(1 - \alpha)(f(x) - \langle s_{2}, x \rangle)} \\ &{} \\ &{\qquad \geq \alpha f_{1}^{*} +(1 - \alpha) f_{2}^{*}, \quad x \in \mathrm{dom} f.} \end{array}
$$

Thus, $\alpha s_{1} +(1 - \alpha) s_{2} \in$ dom $f_{*}$ .

Finally, let $s \in$ dom $f_{*}$ . Denote by $x(s) \in$ dom f the unique solution of the equation

$$
s = \nabla f(x(s)).
$$

Let $\delta \in \mathbb{E}^{*}$ be small enough: $\begin{array}{r}{\| \delta \|_{x(s)}^{*} < \frac{1}{M_{f}}} \end{array}$ . Consider the function

$$
f_{\delta}(x) = f(x) - \langle s + \delta, x \rangle.
$$

Then $\nabla f_{\delta}(x(s)) = \nabla f(x(s)) - s - \delta = - \delta$ . Therefore, $\begin{array}{r}{\lambda_{f_{\delta}}(x(s)) = \| \delta \|_{x(s)}^{*} < \frac{1}{M_{f}}} \end{array}$ Thus, in view of Theorem 5.1.13 the function $f_{\delta}$ attains its minimum. Consequently, $s + \delta \in \mathrm{dom} f_{*}$ , and we conclude that s is an interior point of dom $f_{*}$ .

Example 5.1.3 Note that in general, the structure of the set $\{\nabla f(x) : \x \in \operatorname{dom} f\}$ can be quite complicated. Consider the function

$$
\begin{array}{r}{f(\boldsymbol{x}) = \frac{1}{x^{(1)}} \left(x^{(2)} \right)^{2}, \quad \mathrm{dom} f = \{x \in \mathbb{R}^{2} : x^{(1)} > 0\} \bigcup \{0\}, \quad f(0) = 0.} \end{array}
$$

In Example 3.1.2(5) we have seen that this is a closed convex function. However,

$$
\begin{array}{r}{\nabla f(x) = \left(- \left(\frac{x^{(2)}}{x^{(1)}} \right)^{2}, 2 \frac{x^{(2)}}{x^{(1)}} \right), ~ x \neq 0, ~ \nabla f(0) = 0.} \end{array}
$$

Thus, $\{\nabla f(x) : x \in \operatorname{dom} f\} = \{g \in \mathbb{R}^{2} : g^{(1)} = -{\frac{1}{2}}(g^{(2)})^{2}\}.$ □

Let us now look at the derivatives of the function $f_{*}.\mathrm{Since} \f$ is self-concordant, for any $s \in$ dom $f_{*}$ , the supremum in (5.1.30) is attained (see Theorem 5.1.16).

Define

$$
x(s) = \arg \operatorname{max}_{x \in \operatorname{dom} f}[\langle s, x \rangle - f(x)].
$$

Thus,

$$
\nabla f(x(s)) = s.\tag{5.1.31}
$$

In view of Lemma 3.1.14, we have $x(s) \in \partial f_{*}(s)$ . On the other hand, for $s_{1}$ and $s_{2}$ from dom $f_{*}$ we have

$$
\begin{array}{rlr}{{\frac{\| x(s_{1}) - x(s_{2}) \|_{x(s_{1})}^{2}}{1 + M_{f} \| x(s_{1}) - x(s_{2}) \|_{x(s_{1})}} \stackrel{(5.1.13)}{\leq} \langle \nabla f(x(s_{1})) - \nabla f(x(s_{2})), x(s_{1}) - x(s_{2}) \rangle}} \\ &{} & \\ &{} &{\stackrel{(5.\underbrace{1.31}}{=} \langle s_{1} - s_{2}, x(s_{1}) - x(s_{2}) \rangle} \\ &{} & \\ &{} &{\leq \| s_{1} - s_{2} \|_{x(s_{1})}^{*} \| x(s_{1}) - x(s_{2}) \|_{x(s_{1})}.} \end{array}
$$

Thus, $x(s)$ is a continuous function of s and by Lemma 3.1.10 we conclude that

$$
\nabla f_{*}(s) = x(s).\tag{5.1.32}
$$

Let us differentiate identities (5.1.31) and (5.1.32) along direction $h \in \mathbb{E}^{*}$

$$
\nabla^{2} f(x(s)) x^{\prime}(s) h = h, \quad \nabla^{2} f_{\ast}(s) h \ = \x^{\prime}(s) h.
$$

Thus,

$$
\nabla^{2} f_{\ast}(s) =[\nabla^{2} f(x(s))]^{- 1}, \quad s \in \mathrm{dom} ~ f_{\ast}.\tag{5.1.33}
$$

In other words, if $s = \nabla f(x)$ , then

$$
\nabla^{2} f_{*}(s) =[\nabla^{2} f(x)]^{- 1}, \quad x \in \operatorname{dom} f.\tag{5.1.34}
$$

Let us compute the third derivative of the dual function $f_{*}$ along direction $h \in \mathbb{E}^{*}$ using the representation (5.1.33).

$$
\begin{array}{rl} &{\quad D^{3} f_{*}(s)[h] \ = \ \underset{\alpha \to 0}{\operatorname{lim}} \frac{1}{\alpha} \left([\nabla^{2} f(x(s + \alpha h))]^{- 1} -[\nabla^{2} f(x(s))]^{- 1} \right)} \\ &{\quad = \underset{\alpha \to 0}{\operatorname{lim}} \frac{1}{\alpha}[\nabla^{2} f(x(s))]^{- 1} \left(\nabla^{2} f(x(s)) - \nabla^{2} f(x(s + \alpha h)) \right)[\nabla^{2} f(x(s + \alpha h))]^{- 1}} \\ &{\quad = -[\nabla^{2} f(x(s))]^{- 1} D^{3} f(x(s))[x^{\prime}(s) h][\nabla^{2} f(x(s))]^{- 1}.} \end{array}
$$

Thus, we have proved the following representation:

$$
D^{3} f_{*}(s)[h] = \nabla^{2} f_{*}(s) D^{3} f(x(s)) \left[- \nabla^{2} f_{*}(s) h \right] \nabla^{2} f_{*}(s),\tag{5.1.35}
$$

which is valid for all $s \in$ dom $f_{*}$ and $h \in \mathbb{E}^{*}$ . Now we can prove our main statement.

Theorem 5.1.17 The function $f_{*}$ is self-concordant with $M_{f_{\ast}} = M_{f}$

Proof Indeed, in view of Lemma 5.1.6, $f_{*}$ is a closed convex function with open domain. Further, for any $s \in$ dom $f_{*}$ and $h \in \mathbb{E}^{*}$ we have

$$
\| \nabla^{2} f_{*}(s) h \|_{x(s)}^{2} \stackrel{(5.1.33)}{=} \langle h, \nabla^{2} f_{*}(s) h \rangle \stackrel{\mathrm{criptsize ~ def}}{=} r^{2}.
$$

Therefore, in view of (5.1.35),

$$
D^{3} f_{*}(s)[h] \stackrel{(5.1.6)}{\ \preceq\} 2M_{f} r \nabla^{2} f_{*}(s) \nabla^{2} f(x(s)) \nabla^{2} f_{*}(s) \stackrel{(5.1.33)}{\ \stackrel{(5.1.3)}{\ =\}} 2M_{f} r \nabla^{2} f_{*}(s).
$$

It remains to use Corollary 5.1.1.

As an example of application of Theorem 5.1.17, let us prove the following result.

Lemma 5.1.7 Let $x, y \in$ dom f and $\begin{array}{r}{d = \| \nabla f(x) - \nabla f(y) \|_{x}^{*} < \frac{1}{M_{f}}} \end{array}$ . Then

$$
\begin{array}{r}{(1 - M_{f} d)^{2} \nabla^{2} f(x) \preceq \nabla^{2} f(y) \ \preceq \ \frac{1}{(1 - M_{f} d)^{2}} \nabla^{2} f(x).} \end{array}\tag{5.1.36}
$$

Proof Let $u = \nabla f(x)$ and $v = \nabla f(y)$ . In view of Lemma 5.1.6, both points belong to dom $f_{*}$ . Note that

$$
d^{2} =(\| \nabla f(x) - \nabla f(y) \|_{x}^{*})^{2} \ = \ \langle u - v, \nabla^{2} f_{*}(u)(u - v) \rangle.
$$

Since $f_{*}$ is self-concordant with constant $M_{f}$ , by Theorem 5.1.7 we have

$$
\begin{array}{r}{(1 - M_{f} d)^{2} \nabla^{2} f_{*}(u) \preceq \nabla^{2} f_{*}(v) \ \preceq \ \frac{1}{(1 - M_{f} d)^{2}} \nabla^{2} f_{*}(u).} \end{array}
$$

In view of (5.1.33), this is exactly (5.1.36).

Remark 5.1.2 Some results on self-concordant functions have a more natural dual interpretation. Let us look at the statement of Theorem 5.1.13. Since the function $f_{*}$ is self-concordant, for any ${\bar{s}} \in$ dom $f_{*}$ the ellipsoid

$$
\begin{array}{r}{W_{*}^{0}(\bar{s}) = \left\{s \in \mathbb{E}^{*} : \ \langle s - \bar{s}, \nabla^{2} f_{*}(\bar{s})(s - \bar{s}) \rangle < \frac{1}{M_{f}^{2}} \right\}} \end{array}
$$

belongs to dom $f_{*}$ . Note that for $\bar{s} = \nabla f(x)$ , in view of (5.1.33), condition $\lambda_{f}(x) <$ $\frac{1}{M_{f}}$ is equivalent to

$$
\langle \bar{s}, \nabla^{2} f_{*}(\bar{s}) \bar{s} \rangle < \frac{1}{M_{f}^{2}}.
$$

This guarantees that $0 \in W_{*}^{0}(\bar{s})$ . Consequently, $0 \in$ dom $f_{*}$ and consequently the function $f_{*}$ is below bounded.

## 5.2 Minimizing Self-concordant Functions

(Local convergence of different variants of Newton’s Method; Path-following method; Minimization of strongly convex functions.)

## 5.2.1 Local Convergence of Newton’s Methods

In this section, we are going to study the complexity of solving the problem (5.1.25) by different optimization strategies. Let us look first at different variants of Newton’s Method.

Variants of Newton’s Method   
0. Choose $x_{0} \in$ dom $f.$   
1. For $k \geq 0.$ , iterate   
$\begin{array}{r}{x_{k + 1} = x_{k} - \frac{1}{1 + \xi_{k}}[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}),} \end{array}$   
where $\xi_{k}$ is chosen in one of the following ways:   
(A) $\xi_{k} = 0$ (this is the Standard Newton’s Method),   
(B) $\xi_{k} = M_{f} \lambda_{k}$ (this is the Damped Newton’s Method (5.1.28)),   
(C) $\begin{array}{r}{\xi_{k} = \frac{M_{f}^{2} \lambda_{k}^{2}}{1 + M_{f} \lambda_{k}}} \end{array}$ (this is the Intermediate Newton’s Method),   
where $\lambda_{k} = \lambda_{f}(x_{k})$

(5.2.1)

We call method $(5.2.1)_{C}$ intermediate since for big $\lambda_{k}$ it is close to variant B, and for small values of $\lambda_{k}$ it is very close to variant A. However, note that its step size is always bigger than the step size of variant B, which was obtained

by minimizing an upper bound for the self-concordant function (see the proof of Theorem 5.1.15). Nevertheless, method (5.2.1) ensures a monotone decrease of the value of objective function in problem (5.1.25).

Lemma 5.2.1 Let points $\{x_{k}\}_{k \ge 0}$ be generated by method $(5.2.l)_{C}$ . Then, for any $k \geq 0$ we have

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{\lambda_{k}^{2}}{2(1 + M_{f} \lambda_{k} + M_{f}^{2} \lambda_{k}^{2})} + \frac{M_{f} \lambda_{k}^{3}}{2(1 + M_{f} \lambda_{k})(3 + 2M_{f} \lambda_{k})}.} \end{array}\tag{5.2.2}
$$

Proof Indeed, in view of inequality (5.1.16), we have

$$
\begin{array}{rl} &{f(x_{k + 1}) \leq f(x_{k}) - \frac{\lambda_{k}^{2}}{1 + \xi_{k}} + \frac{1}{M_{f}^{2}} \omega_{*} \left(\frac{M_{f} \lambda_{k}}{1 + \xi_{k}} \right)} \\ &{= f(x_{k}) - \frac{\lambda_{k}^{2}(1 + M_{f} \lambda_{k})}{1 + M_{f} \lambda_{k} + M_{f}^{2} \lambda_{k}^{2}} + \frac{1}{M_{f}^{2}} \left[- \frac{M_{f} \lambda_{k}(1 + M_{f} \lambda_{k})}{1 + M_{f} \lambda_{k} + M_{f}^{2} \lambda_{k}^{2}} + \ln \left(1 + M_{f} \lambda_{k} + M_{f}^{2} \lambda_{k}^{2} \right) \right].} \end{array}
$$

Defining $\tau_{k} = M_{f} \lambda_{k}$ , we have

$$
\begin{array}{rl} &{\frac{\tau_{k}(1 + \tau_{k})^{2}}{1 + \tau_{k} + \tau_{k}^{2}} - \ln \left(1 + \tau_{k} + \tau_{k}^{2} \right) = \frac{\tau_{k}(1 + \tau_{k})^{2}}{1 + \tau_{k} + \tau_{k}^{2}} - \tau_{k} + \omega(\tau_{k}) - \ln \left(1 + \frac{\tau_{k}^{2}}{1 + \tau_{k}} \right)} \\ &{\overset{(5.1.23)}{\geq} \frac{\tau_{k}^{2}}{1 + \tau_{k} + \tau_{k}^{2}} + \frac{\tau_{k}^{2}}{2 \left(1 + \frac{2}{3} \tau_{k} \right)} - \ln \left(1 + \frac{\tau_{k}^{2}}{1 + \tau_{k}} \right) = \frac{\tau_{k}^{2}}{2 \left(1 + \frac{2}{3} \tau_{k} \right)} - \xi_{k} + \frac{\xi_{k}}{1 + \xi_{k}} + \omega(\xi_{k}).} \end{array}
$$

It remains to note that

$$
\begin{array}{r}{\frac{\tau_{k}^{2}}{2 \left(1 + \frac{2}{3} \tau_{k} \right)} - \frac{1}{2} \xi_{k} = \frac{\tau_{k}^{2}}{2} \left(\frac{1}{1 + \frac{2}{3} \tau_{k}} - \frac{1}{1 + \tau_{k}} \right) = \frac{\tau_{k}^{3}}{2(1 + \tau_{k})(3 + 2 \tau_{k})},} \end{array}
$$

$$
\begin{array}{r}{\mathrm{and} - \frac{\xi_{k}}{2} + \omega(\xi_{k}) \overset{(5.1.23)}{\geq} - \frac{\xi_{k}}{2} + \frac{\xi_{k}^{2}}{2(1 + \xi_{k})} = - \frac{\xi_{k}}{2(1 + \xi_{k})}.\quad \Pi} \end{array}
$$

Let us describe now the local convergence of different variants of the Newton’s Method. Note that we can measure the convergence of these schemes in four different ways. We can estimate the rate of convergence for the functional gap $f(x_{k}) - f(x_{f}^{*})$ , or for the local norm of the gradient $\lambda_{f}(\boldsymbol{x}_{k}) = \parallel \nabla f(\boldsymbol{x}_{k}) \parallel_{\boldsymbol{x}_{k}}^{*}$ , or for the local distance to the minimum $\| \x_{k} - x_{f}^{*} \|_{x_{k}}$ . Finally, we can look at the distance to the minimum in a fixed metric

$$
r_{*}(x_{k}) = \| \boldsymbol{x}_{k} - \boldsymbol{x}_{f}^{*} \|_{\boldsymbol{x}_{f}^{*}},
$$

defined by the minimum itself. Let us prove that locally all these measures are equivalent.

Theorem 5.2.1 Let $\begin{array}{r}{\lambda_{f}(x) < \frac{1}{M_{f}}} \end{array}$ . Then

$$
\omega(M_{f} \lambda_{f}(x)) \ \le \M_{f}^{2}(f(x) - f(x_{f}^{*})) \ \le \ \omega_{*}(M_{f} \lambda_{f}(x)),\tag{5.2.3}
$$

$$
\omega^{\prime}(M_{f} \lambda_{f}(x)) \ \leq \M_{f} \ \| \x - x_{f}^{*} \ \|_{x} \leq \ \omega_{*}^{\prime}(M_{f} \lambda_{f}(x)),\tag{5.2.4}
$$

$$
\omega(M_{f} r_{*}(x)) \ \leq \M_{f}^{2}(f(x) - f(x_{f}^{*})) \ \leq \ \omega_{*}(M_{f} r_{*}(x)),\tag{5.2.5}
$$

where the last inequality is valid for $\begin{array}{r}{r_{*}(x) < \frac{1}{M_{f}}} \end{array}$

Proof Let $r \ = \parallel \x - x_{f}^{*} \ \parallel_{x}$ and $\lambda ~ = ~ \lambda_{f}(x)$ . Inequalities (5.2.3) follow from Theorem 5.1.12. Further, in view of (5.1.13), we have

$$
\begin{array}{r}{\frac{r^{2}}{1 + M_{f} r} \leq \langle \nabla f(x), x - x_{f}^{*} \rangle \leq \lambda r.} \end{array}
$$

Applying the function $\omega_{*}^{\prime}(\cdot)$ to both sides of inequality ${\frac{M_{f} r}{1 + M_{f} r}} ~ \le ~ M_{f} \lambda$ , we get the right-hand side of inequality (5.2.4). If $\begin{array}{r}{r \ge \frac{1}{M_{f}}} \end{array}$ , then the left-hand side of this inequality is trivial. Suppose that $\begin{array}{r}{r < \frac{1}{M_{f}}} \end{array}$ . Then $\nabla f(x) = G(x - x_{f}^{*})$ with

$$
\begin{array}{r}{G = \int \nabla^{2} f(x_{f}^{*} + \tau(x - x_{f}^{*})) d \tau \ \succ \0,} \\{0} \end{array}
$$

and $\lambda_{f}^{2}(x) = \langle G[\nabla^{2} f(x)]^{- 1} G(x - x_{f}^{*}), x - x_{f}^{*} \rangle$ . Let us introduce in $\mathbb{E}$ a canonical basis. Then all self-adjoint operators from E to $\mathbb{E}^{*}$ can be represented by symmetric matrices (we do not change the existing notation). Define

$$
H = \nabla^{2} f(x), \quad S \ = \H^{- 1 / 2} GH^{- 1} GH^{- 1 / 2} \ = \ \left(H^{- 1 / 2} GH^{- 1 / 2} \right)^{2} \{\stackrel{\mathrm{def}}{=}} \P^{2} \succ 0.
$$

Then $\| H^{1 / 2}(x - x_{f}^{*}) \|_{2} = \| x - x_{f}^{*} \|_{x} = r$ , where $\| \cdot \|_{2}$ is the standard Euclidean norm, and

$$
\begin{array}{r}{\lambda_{f}(x) \ = \ \langle H^{1 / 2} SH^{1 / 2}(x - x^{*}), x - x^{*} \rangle^{1 / 2} \ \leq \parallel \P \ \Vert_{2} \ \Vert H^{1 / 2}(x - x^{*}) \Vert_{2} \ = \parallel \P \ \Vert_{2} r.} \end{array}
$$

In view of Corollary 5.1.5 (see Remark 5.1.1), we have

$$
\begin{array}{r}{G \preceq \frac{1}{1 - M_{f} r} H.} \end{array}
$$

Therefore, $\begin{array}{r}{P \parallel_{2} \leq \frac{1}{1 - M_{f} r}} \end{array}$ and we conclude that

$$
\begin{array}{r}{M_{f} \lambda_{f}(x) \le \frac{M_{f} r}{1 - M_{f} r} = \omega_{*}^{\prime}(M_{f} r).} \end{array}
$$

Applying the function $\omega^{\prime}(\cdot)$ to both sides of this inequality, we get the remaining part of (5.2.4). Finally, inequalities (5.2.5) follow from (5.1.14) and (5.1.16).

We are going to estimate the local rate of convergence of different variants of the Newton’s method (5.2.1) in terms of $\lambda_{f}(\cdot)$ , the local norm of the gradient.

Theorem 5.2.2 Let $x \in$ dom f and $\lambda = \lambda_{f}(x)$

1. $\begin{array}{r}{If \lambda < \frac{1}{M_{f}}} \end{array}$ and the point $x_{+}$ is generated by variant A of method (5.2.1), then $x_{+} \in$ dom f and

$$
\begin{array}{r}{\lambda_{f}(x_{+}) \le \frac{M_{f} \lambda^{2}}{(1 - M_{f} \lambda)^{2}}.} \end{array}\tag{5.2.6}
$$

2. If point $x_{+}$ is generated by variant B of method (5.2.1), then $x_{+} \in$ dom f and

$$
\begin{array}{r}{\lambda_{f}(x_{+}) \le M_{f} \lambda^{2} \left(1 + \frac{1}{1 + M_{f} \lambda} \right).} \end{array}\tag{5.2.7}
$$

3. If $M_{f} \lambda + M_{f}^{2} \lambda^{2} + M_{f}^{3} \lambda^{3} \leq 1$ and point $x_{+}$ is generated by method $(5.2.l)_{C}$ , then $x_{+} \in$ dom f and

$$
\lambda_{f}(x_{+}) \le M_{f} \lambda^{2} \left(1 + M_{f} \lambda + \frac{M_{f} \lambda}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} \right) ~ \le ~ M_{f} \lambda^{2} \left(1 + 2M_{f} \lambda \right).\tag{5.2.8}
$$

Proof Let $h = x_{+} - x, \lambda = \lambda_{f}(x)$ , and $r = \| h \|_{x}$ . Then $\begin{array}{r}{r = \frac{\lambda}{1 + \xi}} \end{array}$ . Note that for all variants of method (5.2.1), we have $M_{f} \lambda < 1 + \xi$ <sup>+</sup>. Therefore, in all cases, $M_{f} r < 1$ and $x_{+} \in$ dom f (see Theorem 5.1.5). Hence, in view of Theorem 5.1.7 we have

$$
\begin{array}{r}{\lambda_{f}(x_{+}) = \langle \nabla f(x_{+}),[\nabla^{2} f(x_{+})]^{- 1} \nabla f(x_{+}) \rangle^{1 / 2} \ \leq \ \frac{1}{1 - M_{f} r} \ \Vert \ \nabla f(x_{+}) \ \Vert_{x}^{*} \.} \end{array}
$$

Further, by (5.2.1)

$$
\nabla f(x_{+}) = \nabla f(x) + \int_{0}^{1} \nabla^{2} f(x + \tau h) hd \tau \ = \Gh,
$$

where $G = \int_{0}^{1}[\nabla^{2} f(x + \tau h) -(1 + \xi) \nabla^{2} f(x)] d \tau$ . As in the proof of Theorem 5.2.1, let us pass to matrices. Define

$$
H = \nabla^{2} f(x), ~ S ~ = ~ H^{- 1 / 2} GH^{- 1} GH^{- 1 / 2} ~ \stackrel{\mathrm{def}}{=} ~ P^{2},
$$

where $P = H^{- 1 / 2} GH^{- 1 / 2}$ . Then $\| H^{1 / 2} h \|_{2} = \| h \|_{x} = r$ , and

$$
\begin{array}{r}{\| \nabla f(x_{+}) \|_{x}^{*} = \langle Gh, H^{- 1} Gh \rangle^{1 / 2} = \langle H^{1 / 2} SH^{1 / 2} h, h \rangle^{1 / 2} \leq \|{P} \|_{2} r.} \end{array}
$$

In view of Corollary 5.1.5,

$$
\begin{array}{r}{\left(- \xi - M_{f} r + \frac{1}{3} M_{f}^{2} r^{2} \right) H \preceq G \ \preceq \left(\frac{1}{1 - M_{f} r} -(1 + \xi) \right) H.} \end{array}
$$

Therefore, $\begin{array}{r}{P \ \|_{2} \leq \operatorname{max} \left\{\frac{M_{f} r}{1 - M_{f} r} - \xi, M_{f} r + \xi \right\}} \end{array}$

For the variant $\mathrm{A}, \xi = 0.{\mathrm{Thus}}, r = \lambda$ and we get $\begin{array}{r}{\| \mathbb{P} \|_{2} \le \frac{M_{f} \lambda}{1 - M_{f} \lambda}} \end{array}$ . Therefore,

$$
\begin{array}{r}{\lambda_{f}(x_{+}) \le \frac{\lambda}{1 - M_{f} \lambda} \| P \|_{2} \ \le \ \frac{M_{f} \lambda^{2}}{(1 - M_{f} \lambda)^{2}}.} \end{array}
$$

For the variant B, $\xi = M_{f} \lambda$ . Therefore, $\begin{array}{r}{r = \frac{\lambda}{1 + M_{f} \lambda}} \end{array}$ , and we get $\| P \|_{2} \leq M_{f} \lambda +$ $\frac{M_{f} \lambda}{1 + M_{f} \lambda}$ . Consequently,

$$
\begin{array}{r}{\lambda_{f}(x_{+}) \le \frac{r}{1 - M_{f} r} \| P \|_{2} \le M_{f} \lambda^{2} \left(1 + \frac{1}{1 + M_{f} \lambda} \right).} \end{array}
$$

Finally, for variant $\begin{array}{r}{\mathrm{C}, \xi = \frac{M_{f}^{2} \lambda^{2}}{1 + M_{f} \lambda}} \end{array}$ . Then, $\begin{array}{r}{r = \frac{\lambda(1 + M_{f} \lambda)}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}}} \end{array}$ , and we have

$$
\begin{array}{rl} &{\frac{M_{f} r}{1 - M_{f} r} - M_{f} r - \xi \ = \ \frac{M_{f}^{2} r^{2}}{1 - M_{f} r} - \xi \ = \ \frac{M_{f}^{2} \lambda^{2}(1 + M_{f} \lambda)^{2}}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} - \frac{M_{f}^{2} \lambda^{2}}{1 + M_{f} \lambda}} \\ &{= \frac{M_{f}^{2} \lambda^{2}(2M_{f} \lambda + 2M_{f}^{2} \lambda^{2} + M_{f}^{3} \lambda^{3})}{(1 + M_{f} \lambda + M_{f}^{2} \lambda^{2})(1 + M_{f} \lambda)} \ = \ \frac{\xi(2M_{f} \lambda + 2M_{f}^{2} \lambda^{2} + M_{f}^{3} \lambda^{3})}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} \ \leq \ \xi} \end{array}
$$

in view of the condition of this item. Hence

$$
\begin{array}{rl} &{\lambda_{f}(x_{+}) \le \frac{r}{1 - M_{f} r} \| P \|_{2} \le \frac{r}{1 - M_{f} r}(M_{f} r + \xi)} \\ &{\qquad = \frac{\lambda(1 + M_{f} \lambda)}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}}(1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}) \left(\frac{M_{f} \lambda(1 + M_{f} \lambda)}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} + \frac{M_{f}^{2} \lambda^{2}}{1 + M_{f} \lambda} \right)} \\ &{\qquad = M_{f} \lambda^{2} \left(\frac{(1 + M_{f} \lambda)^{2}}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} + M_{f} \lambda \right)} \\ &{\qquad = M_{f} \lambda^{2} \left(1 + M_{f} \lambda + \frac{M_{f} \lambda}{1 + M_{f} \lambda + M_{f}^{2} \lambda^{2}} \right).} \end{array}
$$

Among all variants of the rate of convergence, described in Theorem 5.2.2, the estimate (5.2.8) looks more attractive. It provides us with the following description

of the region of quadratic convergence for method (5.2.1) $)_{C}$

$$
\begin{array}{r}{\mathcal{Q}_{f} \stackrel{\mathrm{def}}{=} \left\{x \in \mathrm{dom} f : \lambda_{f}(x) < \frac{1}{2M_{f}} \right\}.} \end{array}\tag{5.2.9}
$$

In this case, we can guarantee that $\lambda_{f}(x_{+}) ~ < ~ \lambda_{f}(x)$ , and then the quadratic convergence starts (see (5.2.8)). Thus, our results lead to the following strategy for solving the initial problem (5.1.25).

- First stage: $\begin{array}{r}{\lambda_{f}(x_{k}) ~ \ge ~ \frac{1}{2M_{f}}} \end{array}$ . At this stage we apply the Damped Newton’s Method (5.1.28). At each iteration of this method, we have

$$
\begin{array}{r}{f(x_{k + 1}) \leq f(x_{k}) - \frac{1}{M_{f}^{2}} \omega(\frac{1}{2}).} \end{array}
$$

Thus, the number of steps of this stage is bounded as follows:

$$
\begin{array}{r}{N \leq M_{f}^{2}[f(x_{0}) - f(x_{f}^{*})] / \omega(\frac{1}{2}).} \end{array}\tag{5.2.10}
$$

- Second stage: $\begin{array}{r}{\lambda_{f}(x_{k}) \ < \ \frac{1}{2M_{f}}} \end{array}$ . At this stage, we apply method (5.2.1)<sub>C</sub>. This process converges quadratically:

$$
\lambda_{f}(x_{k + 1}) \le M_{f} \lambda_{f}^{2}(x_{k})(1 + 2M_{f} \lambda_{f}(x_{k})) < \lambda_{f}(x_{k}).
$$

Since the quadratic convergence is very fast, the main efforts in the above strategy are spent at the first stage. The estimate (5.2.10) shows that the length of this stage is $O(\varDelta_{f}(x_{0}))$ , where

$$
\Delta_{f}(x_{0}) \{\stackrel{\mathrm{def}}{=}} \M_{f}^{2}[f(x_{0}) - f(x_{f}^{*})].\tag{5.2.11}
$$

Is it possible to reach the region of quadratic convergence in a faster way? In order to answer this question, let us consider an alternative way to solve the problem (5.1.25), based on a path-following scheme. In Sect. 5.3 we will see how we can use this idea for solving a constrained minimization problem.

## 5.2.2 Path-Following Scheme

Assume that we have $y_{0} \in$ dom $f.$ Let us define an auxiliary central path

$$
y(t) = \arg \operatorname{min}_{y \in \operatorname{dom} f} \left[\psi(t; y) \stackrel{\mathrm{def}}{=} f(y) - t \langle \nabla f(y_{0}), y \rangle \right], \quad t \in[0, 1].\tag{5.2.12}
$$

This minimization problem corresponds to computation of the value of the dual function $- f_{*}(s)$ with $s = t \nabla f(y_{0})$ (see (5.1.30)). Note that $\nabla f(y_{0}) \in \operatorname{dom} f_{*}$ and

the origin in the dual space also belongs to dom $f_{*}$ since the problem (5.1.25) is solvable. Therefore, in view of Lemma 5.1.6,

$$
t \nabla f(y_{0}) \in \mathrm{dom} f_{*}, \quad 0 \leq t \leq 1,
$$

and trajectory (5.2.12) is well defined.

We are going to follow the auxiliary central path with parameter t changing from one to zero by updating points satisfying the approximate centering condition

$$
\begin{array}{r}{\lambda_{\psi(t; \cdot)}(y) \stackrel{\mathrm{def}}{=} \| \nabla f(y) - t \nabla f(y_{0}) \|_{y}^{*} \leq \frac{\beta}{M_{f}},} \end{array}\tag{5.2.13}
$$

where the centering parameter $\beta$ is small enough. Note that the function $\psi(t; \cdot)$ is self-concordant with constant $M_{f}$ and domain dom $f$ (see Corollary 5.1.2).

Consider the following iterate:

$$
(t_{+}, y_{+}) = \mathcal{P}_{\gamma}(t, y) \equiv \left\{\begin{array}{l}{t_{+} = t - \frac{\gamma}{M_{f} \Vert \nabla f(y_{0}) \Vert_{y}^{*}},} \\{} \\{y_{+} = y - \frac{[\nabla^{2} f(y)]^{- 1}(\nabla f(y) - t_{+} \nabla f(y_{0}))}{1 + \xi},} \end{array} \right.\tag{5.2.14}
$$

where $\begin{array}{r}{\xi = \frac{M_{f}^{2} \lambda^{2}}{1 + M_{f} \lambda}} \end{array}$ and $\lambda = \lambda_{\psi(t; \cdot)}(y)$ (this is one iteration of method (5.2.1) ). For future use, we allow the parameter γ in (5.2.14) to be both positive or negative.

Lemma 5.2.2 Let the pair $(t, y)$ satisfy (5.2.13) with $\begin{array}{r}{\beta = \tau^{2}(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}})} \end{array}$ where $\begin{array}{r}{\tau \leq \frac{1}{2}} \end{array}$ . Then the pair $(t_{+}, y_{+})$ satisfies the same condition for γ small enough, namely

$$
\begin{array}{r}{| \gamma | \leq \tau - \tau^{2} \left(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}} \right).} \end{array}\tag{5.2.15}
$$

Proof Let $\begin{array}{r}{\lambda = \| \nabla f(y) - t \nabla f(y_{0}) \|_{y}^{*} \le \frac{\beta}{M_{f}}, \lambda_{1} = \| \nabla f(y) - t_{+} \nabla f(y_{0}) \|_{y}^{*}} \end{array}$ , and $\lambda_{+} = \| \nabla f(y) - t_{+} \nabla f(y_{0}) \|_{y_{+}}^{*}$ . Then $\begin{array}{r}{\lambda_{1} \le \lambda + \frac{| \gamma |}{M_{f}} \le \frac{1}{M_{f}}(\beta + | \gamma |) \stackrel{(5.2.15)}{\le} \frac{\tau}{M_{f}}.} \end{array}$ Hence,

$$
\begin{array}{r}{\lambda_{+} \stackrel{(5.2.8)}{\leq} \frac{\tau^{2}}{M_{f}} \left(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}} \right) = \frac{\beta}{M_{f}}.} \end{array}
$$

Let us derive from this fact a complexity bound of the path-following scheme as applied to problem (5.1.25).

Theorem 5.2.3 Consider the following process:

$$
t_{0} = 1, \y_{0} \in dom \f, \quad(t_{k + 1}, y_{k + 1}) ={\mathcal P}_{\gamma}(t_{k}, y_{k}), \quad k \ge 0,\tag{5.2.16}
$$

where $\begin{array}{r}{\gamma = \gamma(\tau) = \tau - \beta, \beta = \beta(\tau) = \tau^{2} \left(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}} \right)} \end{array}$ , and $\tau \leq 0.23$ . Then

$$
\begin{array}{r}{\lambda_{k} \ \stackrel{def}{=} \ \| \nabla f(y_{k}) - t_{k} \nabla f(y_{0}) \|_{y_{k}}^{*} \leq \frac{\beta}{M_{f}}, \quad k \geq 0.} \end{array}\tag{5.2.17}
$$

Assume that $\begin{array}{r}{\lambda_{f}(y_{k}) \ge \frac{1}{2M_{f}}} \end{array}$ for all $k = 0, \ldots, N$ . Then

$$
\begin{array}{r}{t_{N} \leq \exp \left\{- \frac{\gamma \varkappa(\tau) N^{2}}{\varDelta_{f}(x_{0})} \right\},} \end{array}\tag{5.2.18}
$$

where $\begin{array}{r}{\varkappa(\tau) = \frac{(\tau - 3 \beta)(1 + \beta)}{2(1 + \beta + \beta^{2})}} \end{array}$

Proof Since $\begin{array}{r}{\lambda_{0} = 0 < \frac{\beta}{M_{f}}} \end{array}$ , by Lemma 5.2.2 we prove that inequality (5.2.17) is valid for all $k \geq 0$ . Let $c = - \nabla f(y_{0})$ . Note that

$$
\begin{array}{r}{y_{k} - y_{k + 1} \overset{(5.2.14)}{=} \frac{1}{1 + \xi_{k}}[\nabla^{2} f(y_{k})]^{- 1} \left(t_{k} c + \nabla f(y_{k}) - \frac{\gamma c}{M_{f} \| c \|_{y_{k}}^{*}} \right),} \end{array}\tag{5.2.19}
$$

where $\begin{array}{r}{\xi_{k} = \frac{M_{f}^{2} \lambda_{k}^{2}}{1 + M_{f} \lambda_{k}}} \end{array}$ . Therefore,

$$
\begin{array}{r}{r_{k} \stackrel{\mathrm{def}}{=} \| y_{k} - y_{k + 1} \|_{y_{k}} \leq \frac{\lambda_{k}}{1 + \xi_{k}} + \frac{\gamma}{M_{f}(1 + \xi_{k})} = \frac{\gamma + M_{f} \lambda_{k}}{M_{f}(1 + \xi_{k})} \stackrel{(5.2.17)}{\leq} \frac{\tau}{M_{f}}.} \end{array}\tag{5.2.20}
$$

Further,

$$
\begin{array}{r}{t_{k + 1} \stackrel{(5.2.14)}{=} t_{k} - \frac{\gamma}{M_{f} \| c \|_{\mathcal{Y}_{k}}^{*}} = t_{k} \left(1 - \frac{\gamma}{M_{f} t_{k} \| c \|_{\mathcal{Y}_{k}}^{*}} \right) \leq t_{k} \exp \left\{- \frac{\gamma}{M_{f} t_{k} \| c \|_{\mathcal{Y}_{k}}^{*}} \right\}.} \end{array}
$$

Thus, $\begin{array}{r}{t_{N} \leq \exp \left\{- \frac{\gamma}{M_{f}} S_{N} \right\}} \end{array}$ , where $S_{N} = \sum_{k = 0}^{N}{\frac{1}{t_{k} \| c \|_{y_{k}}^{*}}}$ . Let us estimate this value from below.

Since $\begin{array}{r}{\frac{\beta^{2}}{M_{f}^{2}} \stackrel{(5.2.17)}{\geq} \lambda_{f}^{2}(y_{k}) + 2t_{k} \langle \nabla f(y_{k}),[\nabla^{2} f(y_{k})]^{- 1} c \rangle + t_{k}^{2}(\| c \|_{y_{k}}^{*})^{2}} \end{array}$ , we have

$$
\begin{array}{r}{- \langle \nabla f(y_{k}),[\nabla^{2} f(y_{k})]^{- 1} c \rangle \ge \frac{1}{2t_{k}} \left[\lambda_{f}^{2}(y_{k}) + t_{k}^{2}(\| c \|_{y_{k}}^{*})^{2} - \frac{\beta^{2}}{M_{f}^{2}} \right].} \end{array}\tag{5.2.21}
$$

## 5.2 Minimizing Self-concordant Functions

Therefore,

$$
\begin{array}{rl} &{f(y_{k}) - f(y_{k + 1}) \overset{(5, 1, 16)}{\geq} \langle \nabla f(y_{k}), y_{k} - y_{k + 1} \rangle - \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r_{k})} \\ &{\overset{(5, 2, 19)}{=} \frac{1}{1 + \xi_{k}} \langle \nabla f(y_{k}),[\nabla^{2} f(y_{k})]^{- 1} \left(t_{k} c + \nabla f(y_{k}) - \frac{\gamma c}{M_{f} \| c \|_{y_{k}}^{2}} \right) \rangle - \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r_{k})} \\{=\} &{\frac{\lambda_{k}^{2}}{1 + \xi_{k}} - \frac{t_{k}}{1 + \xi_{k}} \langle c,[\nabla^{2} f(y_{k})]^{- 1} \left(t_{k} c + \nabla f(y_{k}) \right) \rangle} \\ &{+ \frac{1}{1 + \xi_{k}} \langle \nabla f(y_{k}),[\nabla^{2} f(y_{k})]^{- 1} \left(\frac{- \gamma c}{M_{f} \| c \|_{y_{k}}^{2}} \right) \rangle - \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r_{k})} \end{array}
$$

$$
\begin{array}{rl} &{\quad \overset{(5.2.17)}{\geq} \frac{\lambda_{k}^{2} - t_{k} \| c \|_{y_{k}}^{*} \lambda_{k}}{1 + \xi_{k}} - \frac{\gamma}{M_{f} \| c \|_{y_{k}}^{*}(1 + \xi_{k})} \langle \nabla f(y_{k}),[\nabla^{2} f(y_{k})]^{- 1} c \rangle - \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r_{k})} \\ &{\quad \overset{(5.2.21)}{\geq} \frac{\lambda_{k}^{2} - t_{k} \| c \|_{y_{k}}^{*} \lambda_{k}}{1 + \xi_{k}} + \frac{\gamma}{2M_{f} t_{k} \| c \|_{y_{k}}^{*}(1 + \xi_{k})} \Bigg[\lambda_{f}^{2}(y_{k}) + t_{k}^{2}(\| c \|_{y_{k}}^{*})^{2} - \frac{\beta^{2}}{M_{f}^{2}} \Bigg]} \\ &{\quad \qquad - \frac{1}{M_{f}^{2}} \omega_{*}(M_{f} r_{k})} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(5.2.20)}{\geq} \frac{\gamma - 2M_{f} \lambda_{k}}{2M_{f}(1 + \xi_{k})} t_{k} \| c \|_{y_{k}}^{*} + \rho_{k},} \end{array}
$$

$$
\begin{array}{r}{\mathrm{where} \rho_{k} = \frac{\gamma}{2M_{f} t_{k} \| c \|_{y_{k}}^{*}(1 + \xi_{k})} \bigg[\lambda_{f}^{2}(y_{k}) - \frac{\beta^{2}}{M_{f}^{2}} \bigg] - \frac{1}{M_{f}^{2}} \omega_{*}(\tau).} \end{array}
$$

Our next goal is to show that $\rho_{k} \ge 0$ . Note that $\begin{array}{r}{t_{k} \| c \|_{y_{k}}^{*} \overset{(5.2.17)}{\leq} \lambda_{f}(y_{k}) + \frac{\beta}{M_{f}}.} \end{array}$ Since $\begin{array}{r}{\lambda_{f}(y_{k}) \ge \frac{1}{2M_{f}}} \end{array}$ , we have

$$
\begin{array}{rlr}{\rho_{k}} &{{} \ge} &{\frac{\gamma}{2M_{f}(1 + \xi_{k})} \left[\lambda_{f}(y_{k}) - \frac{\beta}{M_{f}} \right] - \frac{1}{M_{f}^{2}} \omega_{*}(\tau) \ge \frac{\gamma(1 - 2 \beta)}{4M_{f}^{2}(1 + \xi_{k})} - \frac{1}{M_{f}^{2}} \omega_{*}(\tau)} \end{array}
$$

$$
\begin{array}{r}{\stackrel{(5.2.17)}{\geq} \frac{1}{M_{f}^{2}} \left[\frac{\gamma(1 - 2 \beta)(1 + \beta)}{4(1 + \beta + \beta^{2})} - \omega_{*}(\tau) \right].} \end{array}
$$

Note that $\gamma ={\cal O}(\tau), \beta ={\cal O}(\tau^{2})$ , and $\omega_{*}(\tau) = O(\tau^{2})$ . Therefore, for $\tau$ small enough we have $\rho_{k} \ge 0$ . By numerical evaluation, it is easy to check that this can be achieved by taking $\tau \leq 0.23$

Further,

$$
\begin{array}{r}{\frac{\gamma - 2M_{f} \lambda_{k}}{2(1 + \xi_{k})} \overset{(5.2.17)}{\geq} \frac{(\gamma - 2 \beta)(1 + \beta)}{2(1 + \beta + \beta^{2})} = \frac{(\tau - 3 \beta)(1 + \beta)}{2(1 + \beta + \beta^{2})} \overset{\mathrm{def}}{=} \varkappa(\tau).} \end{array}
$$

Again, it is easy to check that $\varkappa(\tau) > 0$ for $\tau \in(0, 0.23]$ . Thus, we have proved that $\begin{array}{r}{f(y_{k}) - f(y_{k + 1}) \geq \frac{\varkappa(\tau)}{M_{f}} t_{k} \| c \|_{y_{k}}} \end{array}$ . Therefore,

$$
S_{N} \ge \sum_{k = 0}^{N} \frac{\varkappa(\tau)}{M_{f}(f(y_{k}) - f(y_{k + 1}))} ~ \ge ~ \frac{\varkappa(\tau) A^{*}(N)}{M_{f}(f(y_{0}) - f(y_{N + 1}))},
$$

$$
\mathrm{where} \A^{*}(N) = \operatorname{min}_{\lambda \in \mathbb{R}_{+}^{N + 1}} \left\{\sum_{i = 1}^{N + 1} \frac{1}{\lambda^{(i)}} : \ \sum_{i = 1}^{N + 1} \lambda^{(i)} = 1 \right\} =(N + 1)^{2}.\ \mathrm{~ qcup ~\}
$$

Let us estimate now the number of iterations, which are necessary for method (5.2.16) to enter the region of quadratic convergence $\mathcal{Q}_{f}$ . Define

$$
D = \operatorname{max}_{x, y \in \operatorname{dom} f} \{\| x - y \|_{y_{0}} : \f(x) \leq f(y_{0}), \f(y) \leq f(y_{0})\}.
$$

Theorem 5.2.4 Let the sequence $\{y_{k}\}_{k \ge 0}$ be generated by method (5.2.16). Then for all

$$
\begin{array}{r}{N \ge \left[\frac{\Delta_{f}(x_{0})}{\gamma x(\tau)} \ln \left(\frac{M_{f} D \omega^{- 1}(\Delta_{f}(x_{0}))}{\omega(\frac{(1 - \beta)(1 - 2 \beta)}{2})} \right) \right]^{1 / 2}} \end{array}\tag{5.2.22}
$$

and we have $y_{N} \in \mathcal{Q}_{f}$

Proof Indeed,

$$
\begin{array}{rl} &{f(y(t_{k})) - f^{*} \leq \langle \nabla f(y(t_{k})), y(t_{k}) - x^{*} \rangle \overset{(5.2.12)}{=} t_{k} \langle \nabla f(y_{0}), y(t_{k}) - x^{*} \rangle} \\ &{} \\ &{\qquad \leq t_{k} \lambda_{f}(y_{0}) D.} \end{array}
$$

Note that $\omega(M_{f} \lambda_{f}(y_{0})) \stackrel{(5.1.29)}{\leq} M_{f}^{2}(f(y_{0}) - f^{*}) = \varDelta_{f}(y_{0}).\mathrm{Thus},$

$$
\begin{array}{r}{\frac{1}{M_{f}^{2}} \omega(M_{f} \lambda_{f}(y(t_{k}))) \overset{^{(5.1.29)}}{\leq} f(y(t_{k})) - f^{*} \leq \frac{t_{k}}{M_{f}} \omega^{- 1}(\varDelta_{f}(y_{0})) D.} \end{array}
$$

Since $\begin{array}{r}{\| \nabla f(y_{k}) - \nabla f(y(t_{k})) \|_{{\mathcal{Y}_{k}}}^{*} \overset{(5.2.12)}{=} \| \nabla f(y_{k}) - t_{k} \nabla f(y_{0}) \|_{\mathcal{Y}_{k}}^{*} \leq \frac{\beta}{M_{f}}} \end{array}$ , we have

$$
\begin{array}{rl} &{\lambda_{f}(y_{k}) \overset{(5.2.17)}{\leq} t_{k} \| \nabla f(y_{0}) \|_{y_{k}}^{*} + \frac{\beta}{M_{f}} \ = \ \langle \nabla f(y(t_{k})),[\nabla^{2} f(y_{k})]^{- 1} \nabla f(y(t_{k})) \rangle^{1 / 2}} \\ &{\qquad + \frac{\beta}{M_{f}}} \end{array}
$$

$$
\begin{array}{r}{\frac{(5.1.36)}{\leq} \frac{1}{1 - \beta} \lambda_{f}(y(t_{k})) + \frac{\beta}{M_{f}}.} \end{array}
$$

Thus, inclusion $y_{k} \in \mathcal{Q}_{f}$ is ensured by the inequality $\begin{array}{r}{\lambda_{f}(y(t_{k})) \le \frac{(1 - \beta)(1 - 2 \beta)}{2M_{f}}} \end{array}$ Consequently, we need to ensure the inequality

$$
\begin{array}{r}{\frac{t_{k}}{M_{f}} \omega^{- 1}(\varDelta_{f}(x_{0})) D \leq \frac{1}{M_{f}^{2}} \omega \left(\frac{(1 - \beta)(1 - 2 \beta)}{2} \right).} \end{array}
$$

It remains to use the estimate (5.2.18).

As we can see from the estimate (5.2.22), up to a logarithmic factor, the number of iterations of the path-following scheme is proportional to $\boldsymbol{\varDelta}_{f}^{1 / 2}(y_{0})$ This is much better than the guarantee (5.2.10) obtained for the Damped Newton’s Method (5.1.28). However, as we will see in Sect. 5.2.3, for some special subclasses of self-concordant functions the performance estimate (5.2.22) can be significantly improved.

From the practical point of view, reasonable values of parameters for pathfollowing scheme (5.2.16) correspond to $\tau = 0.15$ . In this case, $\begin{array}{r}{\left[\frac{1}{\gamma(\tau) \varkappa(\tau)} \right]^{1 / 2} \leq} \end{array}$ 16.1.

Remark 5.2.1 The dual interpretation of the central path (5.2.12) is quite straightforward: it is just a straight line. We follow the primal image of the dual central path

$$
s(t) = t \nabla f(y_{0}) \ \in \mathrm{dom} \f_{*}, \quad 0 \leq t \leq 1,
$$

by generating points $s_{k} = \nabla f(y_{k})$ in a small neighborhood of this trajectory:

$$
\begin{array}{rlr}{\langle s_{k} - s(t_{k}), \nabla^{2} f_{*}(s_{k})(s_{k} - s(t_{k})) \rangle} &{{} \stackrel{(5.2.13)}{\leq}} &{\frac{\beta^{2}}{M_{f}^{2}}.} \end{array}
$$

## 5.2.3 Minimizing Strongly Convex Functions

Let $B = B^{*} \succ 0$ map $\mathbb{E}$ to $\mathbb{E}^{*}$ . Define the Euclidean metric

$$
\| x \|^{2} = \langle Bx, x \rangle^{1 / 2}, \quad x \in \mathbb{E}.
$$

In this section, we consider the following minimization problem

$$
\operatorname{min}_{x \in \mathbb{E}} f(x),\tag{5.2.23}
$$

where $f$ is a strongly convex function:

$$
\begin{array}{r}{f(y) \geq f(x) + \langle \nabla f(x), y - x \rangle + \frac{1}{2} \sigma_{2}(f) \| y - x \|^{2}, \quad x, y \in \mathbb{E},} \end{array}\tag{5.2.24}
$$

where $\sigma_{2}(f) > 0$ . We also assume that the function f belongs to $\mathbb{C}^{3}(\mathbb{E})$ and its Hessian is Lipschitz continuous:

$$
\begin{array}{r}{\| \nabla^{2} f(x) - \nabla^{2} f(y) \| \leq L_{3}(f) \| x - y \|, \quad x, y \in \mathbb{E}.} \end{array}\tag{5.2.25}
$$

As we have seen in Example 5.1.1 (6), this function is self-concordant on E with the constant

$$
\begin{array}{r}{M_{f} = \frac{L_{3}(f)}{2 \sigma_{2}^{3 / 2}(f)}.} \end{array}\tag{5.2.26}
$$

Thus, problem (5.2.23) can be solved by methods (5.1.28) and (5.2.16). The corresponding complexity bounds can be given in terms of the complexity measure

$$
\begin{array}{r}{\Delta_{f}(x_{0}) = \frac{L_{3}(f)}{2 \sigma_{2}^{3 / 2}(f)}(f(x_{0}) - f^{*}).} \end{array}
$$

As we have seen, the first method needs $O(\varDelta_{f}(x_{0}))$ iterations. The complexity bound for the second scheme is of the order $\dot{\tilde{O}}(\varDelta_{f}^{1 / 2}(x_{0}))$ , where ${\tilde{O}}(\cdot)$ denotes the hidden logarithmic factors. Let us show that for our particular subclass of selfconcordant functions these bounds can be significantly improved.

We will do this by the second-order methods based on cubic regularization of the Newton’s Method (see Sect. 4.2). In view of (4.2.60), the region of quadratic convergence of the Cubic Newton’s Method (4.2.33) in terms of function value is defined as

$$
\begin{array}{r}{\mathbb{Q}_{f} = \left\{x \in \mathbb{E} : \f(x) - f^{*} \leq \frac{\sigma_{2}^{3}(f)}{2L_{3}^{2}(f)} = \frac{1}{8M_{f}^{2}} \right\}.} \end{array}
$$

Let us check how many iterations we need to enter this region by different schemes based on the cubic Newton step.

Assume our method has the following rate of convergence:

$$
\begin{array}{r}{f(x_{k}) - f^{*} \le \frac{cL_{3}(f) D^{3}}{k^{p}},} \end{array}
$$

where $c$ is an absolute constant, $p > 0.$ , and $D = \operatorname{max}_{\mathbf{\mu}_{\mathbf{\nu}_{r \subset \mathbb{R}}}} \{\| x - x^{*} \| : \f(x) \leq f(x^{0})\}$ x∈E Since f is strongly convex, for all x with $f(x) \leq f(x_{0})$ we have

$$
\begin{array}{r}{\frac{1}{2} \sigma_{2}(f) \lVert x - x^{*} \rVert^{2} \overset{(5.2.24)}{\leq} f(x) - f^{*} \ \leq \f(x_{0}) - f^{*}.} \end{array}
$$

Therefore,

$$
\begin{array}{rlr}{f(x_{k}) - f^{*}} &{\le} &{\frac{cL_{3}(f)}{k^{p}} \left(\frac{2}{\sigma_{2}(f)}(f(x_{0}) - f^{*}) \right)^{3 / 2}} \\ &{} &{\stackrel{(5.2.26)}{=} \frac{2^{5 / 2} cM_{f}}{k^{p}}(f(x_{0}) - f^{*})^{3 / 2}.\qquad} \end{array}\tag{5.2.27}
$$

Thus, we need $O \left(\left[M_{f}^{3}(f(x_{0}) - f^{\ast})^{3 / 2} \right]^{1 / p} \right) = O \left(\varDelta_{f}^{\frac{3}{2p}}(x_{0}) \right)$ iterations to enter the region of quadratic convergence $\mathbb{Q}_{f}$ . For the Cubic Newton’s method (4.2.33) we have $p = 2$ . Thus, it ensures complexity $O(A_{f}^{3 / 4}(x_{0}))$ . For the accelerated Cubic Newton’s method (4.2.46) we have $p = 3$ . Thus, it needs $O(A^{1 / 2}(x_{0}))$ iterations (which is slightly better than (5.2.22)). However, note that for these methods there exists a powerful acceleration tool based on a restarting procedure.

Let us define $k_{p}$ as the first integer for which the right-hand side of inequality (5.2.27) is smaller than ${\textstyle \frac{1}{2}}(f(x_{0}) - f^{*})$ :

$$
\begin{array}{r}{\frac{2^{5 / 2} cM_{f}}{k^{p}}(f(x_{0}) - f^{*})^{3 / 2} \leq \frac{1}{2}(f(x_{0}) - f^{*}).} \end{array}
$$

Clearly $k_{p} = O \left(\left[M_{f}(f(x_{0}) - f^{*})^{1 / 2} \right]^{1 / p} \right) = O \left(\varDelta_{f}^{\frac{1}{2p}}(x_{0}) \right)$ . This value can be used in the following multi-stage scheme.

```perl
Multi-stage Acceleration Scheme
Set $y_{0} = x_{0}$
At the kth stage $(k \ge 1)$ the method starts from the point $y_{k - 1}$
After $\begin{array}{r}{t_{k} = \left\lceil \frac{k_{p}}{2^{(k - 1) /(2p)}} \right\rceil} \end{array}$ steps it generates the output $y_{k}$
The method stops when $y_{k} \in \mathbb{Q}_{f}$
```

(5.2.28)

## Theorem 5.2.5 The total number of stages T in the optimizations strategy (5.2.28) satisfies the inequality

$$
T \leq 4 + \log_{2} \varDelta_{f}(x_{0}).\tag{5.2.29}
$$

The total number of lower-level iterations N in this scheme does not exceed

$$
\begin{array}{r}{4 + \log_{2} \Delta_{f}(x_{0}) + \frac{2^{1 /(2p)}}{2^{1 /(2p)} - 1} k_{p}.} \end{array}
$$

Proof Let us prove by induction that $\begin{array}{r}{f(y_{k}) - f^{*} \leq(\frac{1}{2})^{k}(f(y_{0}) - f^{*})} \end{array}$ . For $k = 0$ this is true. Assume that this is also true for some $k \geq 0.$ . Note that $t_{k + 1}^{p} \geq(\frac{1}{2})^{k / 2} k_{p}^{p}$ Therefore,

$$
\begin{array}{rl} &{\frac{f(y_{k + 1}) - f^{*}}{f(y_{k}) - f^{*}} \leq \frac{2^{5 / 2} cM_{f}}{t_{k + 1}^{p}}(f(y_{k}) - f^{*})^{1 / 2} \ \leq \ \frac{k_{p}^{p}(f(y_{k}) - f^{*})^{1 / 2}}{2t_{k + 1}^{p}(f(x_{0}) - f^{*})^{1 / 2}}} \\ &{\qquad \leq \ \frac{1}{2} \left[\frac{2^{k}(f(y_{k}) - f^{*})}{f(x_{0}) - f^{*}} \right]^{1 / 2} \ \leq \ \frac{1}{2}.} \end{array}
$$

Thus, the total number of stages satisfies inequality $\begin{array}{r}{\left(\frac{1}{2} \right)^{T - 1}(f(x_{0}) - f^{*}) \geq \frac{1}{8M_{f}^{2}}} \end{array}$ Finally,

$$
\begin{array}{c}{{{\cal N} = \displaystyle \sum_{k = 1}^{T} t_{k} ~ \le ~ T + k_{p} \sum_{k = 0}^{T - 1} \left(\displaystyle \frac{1}{2} \right)^{\frac{k}{2p}} ~ \le ~ T + k_{p} \sum_{k = 0}^{\infty} \left(\displaystyle \frac{1}{2} \right)^{\frac{k}{2p}}}} \\{{{} ~ ={\cal T} + \displaystyle \frac{k_{p}}{1 - \left(\displaystyle \frac{1}{2} \right)^{1 /(2p)}}.}} \end{array}
$$

Applying Theorem 5.2.5 to different second-order methods based on Cubic Regularization, we get the following complexity bounds.

- Cubic Newton’s Method (4.2.33). For this method $\p \ = \2$ . Therefore, the complexity bound of this scheme, used in the framework of multi-stage method (5.2.28), is of the order

$$
O \left(\varDelta_{f}^{1 / 4}(x_{0}) \right).
$$

In fact, this method does not need a restarting strategy. Thus, Theorem 5.2.5 provides the Cubic Newton method with a better way of estimating its rate of convergence.

- Accelerated Newton’s Method (4.2.46). For this method $p = 3$ . Hence, the complexity bound of the corresponding multi-stage scheme (5.2.28) becomes

$$
{\cal O} \left(\varDelta^{1 / 6}(x_{0}) \right).
$$

- Optimal second-order method (see Sect. 4.3.2). For this method $p \ = \3.5$ Therefore, the corresponding complexity bound is

$$
\tilde{O} \left(A^{1 / 7}(x_{0}) \right).
$$

However, note that this method includes an expensive line-search procedure. Consequently, its practical efficiency should be worse that the efficiency of the method from the previous item. Note that the theoretical gap in the complexity estimates of these methods is negligibly small, of the order of $O \left(\varDelta_{f}^{1 / 4 \bar{2}}(x_{0}) \right)$ For all reasonable values of the complexity measure $\varDelta_{f}(x_{0})$ , feasible for modern computers, it should be much smaller than the logarithmic factors coming from the line search.

## 5.3 Self-concordant Barriers

(Motivation; Definition of self-concordant barriers; Barriers related to self-concordant functions; The implicit barrier theorem; Main properties; Standard minimization problems; The central path; The path-following method; How to initialize the process? Problems with functional constraints.)

## 5.3.1 Motivation

In the previous section, we have seen that the Newton’s Method is very efficient in minimizing self-concordant functions. Such a function is always a barrier for its domain. Let us check what can be proved about the Sequential Unconstrained Minimization approach (Sect. 1.3.3) based on these barriers. From now on, we are always working with standard self-concordant functions, which means that

$$
M_{f} = 1.\tag{5.3.1}
$$

In what follows, we deal with constrained minimization problems of a special type. Let Dom $f = \operatorname{cl} \left(\operatorname{dom} f \right)$

Definition 5.3.1 A constrained minimization problem is called standard if it has the following form:

$$
\operatorname{min} \{\langle c, x \rangle \mid x \in Q\},\tag{5.3.2}
$$

where $Q$ is a closed convex set. It is also assumed that we know a standard selfconcordant function $f$ such that Dom $f = Q$

Note that the assumption $M_{f} = 1$ is not binding since otherwise we can multiply $f$ by an appropriate constant (see Corollary 5.1.3).

Let us introduce a parametric family of penalty functions

$$
f(t; x) = t \langle c, x \rangle + f(x)
$$

with $t \geq 0$ . Note that $f(t; x)$ is self-concordant in x (see Corollary 5.1.2). Define

$$
x^{*}(t) = \arg \operatorname{min}_{x \in \mathrm{dom} f} f(t; x).
$$

This trajectory is called the central path of problem (5.3.2). We can expect that $x^{*}(t) \to x^{*}$ as $t \to \infty$ (see Sect. 1.3.3). Therefore, it should be a good idea to keep our test points close to this trajectory.

Recall that the Newton’s Methods, as applied to the minimization of the function $f(t; \cdot)$ , have local quadratic convergence (Theorem 5.2.2). Our subsequent analysis is based on the Intermediate Newton Method (5.2.1) , which has the following region of quadratic convergence:

$$
\begin{array}{r}{\lambda_{f(t; \cdot)}(x) \le \beta < \frac{1}{2}.} \end{array}
$$

Let us study our possibilities to move forward in t, assuming that we know exactly $x = x^{*}(t)$ for some $t > 0$

Thus, we are going to increase t:

$$
t_{+} = t + \Delta, \quad \Delta > 0.
$$

However, we need to keep x in the region of quadratic convergence of Newton’s Method for the function $f(t + \varDelta; \cdot)$ :

$$
\begin{array}{r}{\lambda_{f(t + \Delta; \cdot)}(x) \le \beta < \frac{1}{2}.} \end{array}
$$

Note that the update $tt_{+}$ does not change the Hessian of the barrier function:

$$
\nabla^{2} f(t + \Delta; x) = \nabla^{2} f(t; x).
$$

Therefore, it is easy to estimate how big the step Δ can be. Indeed, the first-order optimality condition (1.2.4) provides us with the following central path equation:

$$
tc + \nabla f(x^{*}(t)) = 0.\tag{5.3.3}
$$

Since $tc + \nabla f(x) = 0$ , we obtain

$$
\begin{array}{r}{\lambda_{f(t + \varDelta; \cdot)}(x) = \parallel t_{+} c + \nabla f(x) \parallel_{x}^{*} \overset{(5.3.3)}{=} \varDelta \parallel c \parallel_{x}^{*} = \ \frac{\varDelta}{t} \parallel \nabla f(x) \parallel_{x}^{*} \leq \beta.} \end{array}
$$

Hence, if we want to increase t at some linear rate, we need to assume that the value

$$
\lambda_{f}^{2}(x) =(\parallel \nabla f(x) \parallel_{x}^{*})^{2} \equiv \langle \nabla f(x),[\nabla^{2} f(x)]^{- 1} \nabla f(x) \rangle
$$

is uniformly bounded on dom f . Without this assumption, we can have only a sublinear rate of convergence of the process (see Sect. 5.2.2).

Thus, we come to a definition of a self-concordant barrier.

## 5.3.2 Definition of a Self-concordant Barrier

Definition 5.3.2 Let $F(\cdot)$ be a standard self-concordant function. We call it a $\nu -$ self-concordant barrier for the set Dom F , if

$$
\operatorname{sup}_{u \in \mathbb{E}} \left[2 \langle \nabla F(x), u \rangle - \langle \nabla^{2} F(x) u, u \rangle \right] \leq \nu\tag{5.3.4}
$$

for all $x \in$ dom F . The value ν is called the parameter of the barrier.

Note that we do not assume $\nabla^{2} F(x)$ to be nondegenerate. However, if this is the case, then inequality (5.3.4) is equivalent to the following:

$$
\langle \nabla F(x),[\nabla^{2} F(x)]^{- 1} \nabla F(x) \rangle \leq \nu.\tag{5.3.5}
$$

We will also use another equivalent form of inequality (5.3.4):

$$
\langle \nabla F(x), u \rangle^{2} \leq \nu \langle \nabla^{2} F(x) u, u \rangle \quad \forall u \in \mathbb{E}.\tag{5.3.6}
$$

(To see this for u with $\langle \nabla^{2} F(x) u, u \rangle > 0$ , replace u in (5.3.4) by τ u and find the maximum of the left-hand side in τ .) Note that the condition (5.3.6) can be rewritten in matrix notation:

$$
\begin{array}{r}{\nabla^{2} F(x) \succeq \frac{1}{\nu} \nabla F(x) \nabla F(x)^{T}.} \end{array}\tag{5.3.7}
$$

Lemma 5.3.1 Let F be a ν-self-concordant barrier. Then for any $p ~ \geq ~ \nu$ the function $\xi_{p}(x) = \exp \left\{- \frac{1}{p} F(x) \right\}$ is concave on dom F . On the other hand, $if$ function $\xi_{\nu}(\cdot)$ is concave on dom $\acute{F}_{;}$ , then F is a self-concordant barrier.

Proof Indeed, for any $x \in$ dom F and $h \in \mathbb{E}$ , we have

$$
\begin{array}{r}{\langle \nabla \xi_{p}(x), h \rangle = - \frac{1}{p} \langle \nabla F(x), h \rangle \xi_{p}(x),} \end{array}
$$

$$
\begin{array}{r}{\langle \nabla^{2} \xi_{p}(x) h, h \rangle = \frac{1}{p^{2}} \langle \nabla F(x), h \rangle^{2} \xi_{p}(x) - \frac{1}{p} \langle \nabla^{2} F(x) h, h \rangle \xi_{p}(x).} \end{array}
$$

It remains to use definition (5.3.6).

Note that condition (5.3.5) has interesting dual interpretation. In view of relation (5.1.34), definition (5.3.5) is equivalent to the following condition:

$$
\langle s, \nabla^{2} F_{*}(s) s \rangle \leq \nu, \quad s \in \mathrm{dom} F_{*}.\tag{5.3.8}
$$

In other words, at any feasible s, the distance to the origin is proportional to the size of the unit Dikin ellipsoid, which describes an ellipsoidal neighborhood in dom $f_{*}$ with similar Hessians.

Let us now check which self-concordant functions presented in Example 5.1.1 are also self-concordant barriers.

## Example 5.3.1

1. Linear function: $f(x) = \alpha + \langle a, x \rangle$ , dom $f = \mathbb{E}$ . Clearly, for $a \neq 0$ this function is not a self-concordant barrier since $\nabla^{2} F(x) = 0$

2. Convex quadratic function. Let $A = A^{T} \succ 0$ . Consider the function

$$
f(x) = \alpha + \langle a, x \rangle +{\frac{1}{2}} \langle Ax, x \rangle, \quad{\mathrm{dom ~}} f = \mathbb{R}^{n}.
$$

Then $\nabla f(x) = a + Ax$ and $\nabla^{2} f(x) = A$ . Therefore,

$$
\begin{array}{rl} &{\langle[\nabla^{2} f(x)]^{- 1} \nabla f(x), \nabla f(x) \rangle = \langle A^{- 1}(Ax + a), Ax + a \rangle} \\ &{} \\ &{\qquad = \langle Ax, x \rangle + 2 \langle a, x \rangle + \langle A^{- 1} a, a \rangle.} \end{array}
$$

Clearly, this value is unbounded from above on $\mathbb{R}^{n}$ . Thus, a quadratic function is not a self-concordant barrier.

3. Logarithmic barrier for a ray. Consider the following function of one variable:

$$
F(x) = - \ln x, \quad \mathrm{dom} F = \{x \in \mathbb{R} \mid x > 0\}.
$$

Then $\begin{array}{r}{\nabla F(x) = - \frac{1}{x}} \end{array}$ and $\begin{array}{r}{\nabla^{2} F(x) = \frac{1}{x^{2}} > 0} \end{array}$ . Therefore

$$
\begin{array}{r}{\frac{(\nabla F(x))^{2}}{\nabla^{2} F(x)} = \frac{1}{x^{2}} \cdot x^{2} = 1.} \end{array}
$$

Thus, $F(\cdot)$ is a ν-self-concordant barrier for the set $\{x \ge 0\}$ with $\nu = 1$

4. Logarithmic barrier for a second-order region. Let $A = A^{T} \succeq 0$ . Consider the concave quadratic function

$$
\phi(x) = \alpha + \langle a, x \rangle - \frac{1}{2} \langle Ax, x \rangle.
$$

Define $F(x) = - \ln{\phi(x)}$ , dom $f = \{x \in \mathbb{R}^{n} \mid \phi(x) > 0\}$ . Then

$$
\begin{array}{r}{\langle \nabla F(x), u \rangle = - \frac{1}{\phi(x)}[\langle a, u \rangle - \langle Ax, u \rangle],} \end{array}
$$

$$
\begin{array}{r}{\langle \nabla^{2} F(x) u, u \rangle = \frac{1}{\phi^{2}(x)}[\langle a, u \rangle - \langle Ax, u \rangle]^{2} + \frac{1}{\phi(x)} \langle Au, u \rangle.} \end{array}
$$

Let $\omega_{1} = \langle \nabla F(x), u \rangle$ and $\begin{array}{r}{\omega_{2} = \frac{1}{\phi(x)} \langle Au, u \rangle} \end{array}$ . Then

$$
\langle \nabla^{2} F(x) u, u \rangle = \omega_{1}^{2} + \omega_{2} \geq \omega_{1}^{2}.
$$

Therefore $2 \langle \nabla F(x), u \rangle - \langle \nabla^{2} F(x) u, u \rangle \leq 2 \omega_{1} - \omega_{1}^{2} \leq 1$ . Thus, $F(\cdot)$ is a ν-selfconcordant barrier with $\nu = 1$ .

Let us now check the results of some simple operations with self-concordant barriers.

Theorem 5.3.1 Let $F(\cdot)$ be a self-concordant barrier. Then the function $\langle c, x \rangle +$ $F(x)$ is a standard self-concordant function on dom $F.$

Proof Since $F(\cdot)$ is a self-concordant function, we just apply Corollary 5.1.2.

Note that this property is important for path-following schemes.

Theorem 5.3.2 Let $F_{i}$ be $\nu_{i} - self -$ concordant barriers, $i = 1, 2.$ . Then the function

$$
F(x) = F_{1}(x) + F_{2}(x)
$$

is a self-concordant barrier for a convex set Dom F Dom $F_{1} \cap$ Dom $F_{2}$ with the parameter $\nu = \nu_{1} + \nu_{2}$

Proof In view of Theorem 5.1.1, $F$ is a standard self-concordant function. Let us fix $x \in$ dom F . Then

$$
\begin{array}{rl} &{\underset{u \in \mathbb{R}^{n}}{\mathrm{max}} \left[2 \langle \nabla F(x), u \rangle - \langle \nabla^{2} F(x) u, u \rangle \right]} \\ &{= \underset{u \in \mathbb{R}^{n}}{\mathrm{max}} \left[2 \langle \nabla F_{1}(x), u \rangle - \langle \nabla^{2} F_{1}(x) u, u \rangle + 2 \langle \nabla F_{2}(x), u \rangle - \langle \nabla^{2} F_{2}(x) u, u \rangle \right]} \\ &{\leq \underset{u \in \mathbb{R}^{n}}{\mathrm{max}} \left[2 \langle \nabla F_{1}(x), u \rangle - \langle \nabla^{2} F_{1}(x) u, u \rangle \right] + \underset{u \in \mathbb{R}^{n}}{\mathrm{max}} \left[2 \langle \nabla F_{2}(x), u \rangle - \langle \nabla^{2} F_{2}(x) u, u \rangle \right]} \end{array}
$$

$$
\leq \nu_{1} + \nu_{2}.
$$

□

It is easy to see that the value of the parameter of a self-concordant barrier is invariant with respect to an affine transformation of variables.

Theorem 5.3.3 Let $\mathcal{A}(x) = Ax + b$ be a linear operator, $\mathcal{A} : \mathbb{E} \mathbb{E}_{1}$ . Assume that function $F$ is a ν-self-concordant barrier with Dom $F \subset \mathbb{E}_{1}$ . Then the function

$$
\Phi(x) = F({\mathcal{A}}(x))
$$

is a ν-self-concordant barrier for the set Dom $\phi = \{x \in \mathbb{E} : \{\mathcal{A}}(x) \in DomF\}$

Proof The function $\varPhi(\cdot)$ is a standard self-concordant function in view of Theorem 5.1.2. Let us fix $x \in$ dom $\boldsymbol{\phi}$ . Then $y = \mathcal{A}(x) \in$ dom $F$ . Note that for any $u \in \mathbb{E}$ we have

$$
\langle \nabla \phi(x), u \rangle = \langle \nabla F(y), Au \rangle, \quad \langle \nabla^{2} \phi(x) u, u \rangle = \langle \nabla^{2} F(y) Au, Au \rangle.
$$

Therefore

$$
\begin{array}{rl} &{\underset{u \in \mathbb{E}}{\operatorname{max}} \left[2 \langle \nabla \phi(x), u \rangle - \langle \nabla^{2} \phi(x) u, u \rangle \right] = \underset{u \in \mathbb{E}}{\operatorname{max}} \left[2 \langle \nabla F(y), Au \rangle - \langle \nabla^{2} F(y) Au, Au \rangle \right]} \\ &{} \\ &{\leq \underset{w \in \mathbb{E}_{1}}{\operatorname{max}} \left[2 \langle \nabla F(y), w \rangle - \langle \nabla^{2} F(y) w, w \rangle \right] \leq \nu.} \end{array}
$$

To conclude this section, let us show how to construct self-concordant barriers for the level sets of self-concordant functions and for the epigraphs of self-concordant barriers.

Theorem 5.3.4 Let the function f be self-concordant with constant $M_{f} \ \geq \0.$ Suppose that the set

$$
{\mathcal{L}}(\beta) = \{x \in domf : \f(x) \leq \beta\}
$$

has nonempty interior and $f(x) \geq f^{*}$ for all $x \in$ dom f . Then the function

$$
F(x) = - \nu \ln(\beta - f(x))
$$

with any $\nu \ge 1 + M_{f}^{2}(\beta - f^{*})$ is a ν-self-concordant barrier for the level set ${\mathcal{L}}(\beta)$

Proof Let $\phi(x) = - \ln(\beta - f(x))$ . In view of Theorem 5.1.4 and Corollary 5.1.3, the function $F(x) = \nu \phi(x)$ is a standard self-concordant function on dom f . On the other hand, for any $h \in \mathbb{E}$ we have

$$
\begin{array}{r}{\langle \nabla F(x), h \rangle^{2} = \nu^{2} \langle \nabla \phi(x), h \rangle^{2} \overset{^{(5.1.8)}}{\leq} \nu^{2} \langle \nabla^{2} \phi(x) h, h \rangle \ = \ \nu \langle \nabla^{2} F(x) h, h \rangle.} \end{array}
$$

Thus, by definition (5.3.6), F is a ν-self-concordant barrier for ${\mathcal{L}}(\beta)$ □

Theorem 5.3.5 Let f be a ν-self-concordant barrier. Then the function

$$
F(x, t) = f(x) - \ln(t - f(x))
$$

is a (ν 1)-self-concordant barrier for the epigraph

$$
\mathcal{E}_{f} = \{(x, t) \in domf \times \mathbb{R} : t \geq f(x)\}.
$$

Proof Let us fix a direction $h \in \mathbb{E}$ and $\delta \in \mathbb{R}$ . Consider the function

$$
\phi(\tau) = F(x + \tau h, t + \tau \delta) \ = \f(x + \tau h) - \ln(t + \tau \delta - \f(x + \tau h).
$$

Let $\omega = t - f(x)$ and $\begin{array}{r}{\hat{\omega} = 1 + \frac{1}{\omega}} \end{array}$ . Then

$$
\begin{array}{rl} &{\phi^{\prime}(0) = \langle \nabla f(x), h \rangle + \frac{1}{\omega}(\langle \nabla f(x), h \rangle - \delta),} \\ &{} \\ &{\phi^{\prime \prime}(0) = \langle \nabla^{2} f(x) h, h \rangle + \frac{1}{\omega^{2}}(\langle \nabla f(x), h \rangle - \delta)^{2} + \frac{1}{\omega} \langle \nabla^{2} f(x) h, h \rangle} \\ &{\qquad = \hat{\omega} \langle \nabla^{2} f(x) h, h \rangle + \frac{1}{\omega^{2}}(\langle \nabla f(x), h \rangle - \delta)^{2}.} \end{array}
$$

Define $\begin{array}{r}{\xi = \left[\hat{\omega} \langle \nabla^{2} f(x) h, h \rangle \right]^{1 / 2} \mathrm{and} \lambda = \frac{1}{\omega}(\langle \nabla f(x), h \rangle - \delta)} \end{array}$ . Note that

$$
\phi^{\prime}(0) \stackrel{(5.3.6)}{\leq} \sqrt{\nu} \langle \nabla^{2} f(x) h, h \rangle^{1 / 2} + \lambda = \xi \sqrt{\frac{\nu}{\hat{\omega}}} + \lambda.
$$

It remains to note that the maximum of the right-hand side of this inequality subject to the constraint $\xi^{2} + \lambda^{2} = 1$ is equal to $\begin{array}{r}{\left[\frac{\nu}{\hat{\omega}} + 1 \right]^{1 / 2} \leq \sqrt{\nu + 1}} \end{array}$ . Thus, in view of <sup>ˆ</sup>definition (5.3.6), the parameter of the barrier $F$ can be chosen as $\nu + 1$

Let us estimate now the third derivative of the function $\phi$ at zero, assuming that its second derivative is less or equal to one. Note that

$$
\begin{array}{lll}{\phi^{\prime \prime \prime}(0)} &{=} &{D^{3} f(x)[h, h, h] + \frac{2}{\omega^{3}}(\langle \nabla f(x), h \rangle - \delta)^{3}} \\ & &{\qquad + \frac{3}{\omega^{2}}(\langle \nabla f(x), h \rangle - \delta) \langle \nabla^{2} f(x) h, h \rangle + \frac{1}{\omega} D^{3} f(x)[h, h, h]} \\ &{\qquad \langle{\hat{s}}_{-}^{1.4 \delta} \rangle} \\ &{\leq} &{2 \hat{\omega}(\nabla^{2} f(x) h, h)^{3 / 2} + \frac{2}{\omega^{3}}(\langle \nabla f(x), h \rangle - \delta)^{3}} \\ & &{\qquad + \frac{3}{\omega^{2}}(\langle \nabla f(x), h \rangle - \delta) \langle \nabla^{2} f(x) h, h \rangle} \\ &{=} &{2 \sqrt{\frac{\omega}{1 + \omega}}{\hat{s}}^{3} + 2{\hat{s}}^{3} + \frac{3}{1 + \omega}{\hat{s}}^{2}{\hat{\lambda}} = 2 \gamma{\hat{\xi}}^{3} + 2{\lambda}^{3} + 3(1 - \gamma^{2}){\hat{\xi}}^{2}{\hat{\lambda}},} \end{array}
$$

where $\textstyle \gamma^{2} ={\frac{\omega}{1 + \omega}}$ . We need to maximize the right-hand side of the above inequality subject to constraints $\xi^{2} + \lambda^{2} \leq 1$ and $\gamma \in[0, 1]$ :

$$
x^{*} = \operatorname{max}_{\gamma, \lambda, \xi} \{2 \gamma \xi^{3} + 2 \lambda^{3} + 3(1 - \gamma^{2}) \xi^{2} \lambda : \xi^{2} + \lambda^{2} \leq 1, 0 \leq \gamma \leq 1\}.
$$

Let us maximize this objective in $\gamma$ . From the first-order optimality condition for $\gamma$

$$
2 \xi^{3} - 6 \gamma \xi^{2} \lambda = 0,
$$

we have $\begin{array}{r}{\gamma_{*} = \operatorname{min} \left\{1, \frac{\xi}{3 \lambda} \right\}} \end{array}$ . Assume that $\xi \ \ge \3 \lambda$ . Then $\gamma_{*} = 1$ and we need to maximize $2 \xi^{3} + 2 \lambda^{3}$ with constraints $\xi^{2} + \lambda^{2} = 1$ and $\xi \ge 3 \lambda$ . Introducing new

variables $\hat{\xi} = \xi^{2}$ and $\hat{\lambda} = \lambda^{2}$ , we come to the problem

$$
\operatorname{max}_{\hat{\xi}, \hat{\lambda} \geq 0} \{2 \hat{\xi}^{3 / 2} + 2 \hat{\lambda}^{3 / 2} : \hat{\xi} + \hat{\lambda} \leq 1, \hat{\xi} \geq 9 \hat{\lambda}\}.
$$

Its objective is convex. Hence, by inspecting the extreme points of its feasible set we find the optimal solution $\hat{\xi}_{*} = i, \hat{\lambda}_{*} \bar{=} 0$ . Thus, the maximal value of this problem is two.

Assume now that $\xi \le 3 \lambda$ . Then $\begin{array}{r}{\gamma_{*} = \frac{\xi}{3 \lambda}} \end{array}$ and we get the following objective:

$$
\begin{array}{r}{2 \frac{\xi}{3 \lambda} \xi^{3} + 2 \lambda^{3} + 3 \left(1 - \frac{\xi^{2}}{9 \lambda^{2}} \right) \xi^{2} \lambda = \frac{\xi^{4}}{3 \lambda} + 2 \lambda^{3} + 3 \xi^{2} \lambda.} \end{array}
$$

Note that the maximum of this expression is attained at the boundary of the unit circle: $\xi^{2} + \lambda^{2} = 1$ . Thus, we need to show that

$$
\begin{array}{r}{\frac{(1 - \lambda^{2})^{2}}{3 \lambda} + 2 \lambda^{3} + 3(1 - \lambda^{2}) \lambda \leq 2,} \end{array}
$$

with constraint $3 \lambda \ge \sqrt{1 - \lambda^{2}}$ . In other words, we need to prove that

$$
p(\lambda) \stackrel{\mathrm{def}}{=}(1 - \lambda^{2})^{2} + 3 \lambda(3 \lambda - \lambda^{3}) - 6 \lambda \leq 0, \quad \frac{1}{\sqrt{10}} \leq \lambda \leq 1.
$$

Note that $p(\lambda) =(1 - \lambda)^{2}(3 - 2(1 + \lambda)^{2}) \leq 0$ for all $\begin{array}{r}{\lambda \ge \sqrt{\frac{3}{2}} - 1 = \frac{1}{2 + \sqrt{6}}} \end{array}$ , and this constant is smaller than our lower bound for λ: $\begin{array}{r}{\frac{1}{\sqrt{10}} > \frac{1}{2 + \sqrt{6}}.} \end{array}$

Thus, $\varkappa^{*} \leq 2$ , which means that F is a standard self-concordant function.

Corollary 5.3.1 If f is a standard self-concordant function, then F is also a standard self-concordant function with Dom $F = \mathcal{\mathcal{E}}_{f}^{{}}$

Finally, let us prove the Implicit Barrier Theorem. Let $\boldsymbol{\phi}$ be a ν-self-concordant barrier for dom $\phi \subset \mathbb{E}$ . We partition the space as follows: $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{2}$ . Define

$$
F(x) = \operatorname{min}_{y} \{\phi(x, y) :(x, y) \in \dim \phi\}.\tag{5.3.9}
$$

We assume that for any $x \in$ dom $F \subset \mathbb{E}_{1}$ the solution $y(x)$ of this optimization problem exists and is unique. Then, as we have seen in the proof of Theorem 5.1.11,

$$
\nabla_{y} \phi(x, y(x)) = 0, \quad \nabla_{x} \phi(x, y(x)) = \nabla F(x).
$$

Theorem 5.3.6 The function F defined by (5.3.9) is a ν-self-concordant barrier.

Proof In view of Theorem 5.1.11 the function F is standard self-concordant. Let us fix x dom F . Then for any direction $z =(h, \delta) \in \mathbb{E}_{1} \times \mathbb{E}_{2}$ we have

$$
\begin{array}{rlr}{\langle \nabla F(x), h \rangle_{\mathbb{E}_{1}}^{2}} &{=} &{\langle \nabla_{x} \phi(x, y(x)), h \rangle_{\mathbb{E}_{1}}^{2} = \langle \nabla \phi(x, y(x)), z \rangle_{\mathbb{E}}^{2}} \end{array}
$$

$$
\stackrel{(5.3.6)}{\leq} \nu \langle \nabla^{2} \phi(x, y(x)) z, z \rangle_{\mathbb{E}}.
$$

As was shown in the proof of Theorem 5.1.11,

$$
\operatorname{min}_{\delta \in \mathbb{E}_{2}} \langle \nabla^{2} \phi(x, y(x)) z, z \rangle_{\mathbb{E}} = \langle \nabla^{2} F(x) h, h \rangle_{\mathbb{E}_{1}}.
$$

Thus, F satisfies definition (5.3.6) of a ν-self-concordant barrier.

## 5.3.3 Main Inequalities

Let us show that the local characteristics of a self-concordant barrier (gradient and Hessian) provide us with global information about the structure of its domain.

Theorem 5.3.7 1. Let F be a ν-self-concordant barrier. For any x and y from dom F , we have

$$
\langle \nabla F(x), y - x \rangle \ < \ \nu.\tag{5.3.10}
$$

Moreover, $if \left.\nabla F(x), y - x \right.\geq 0 \mathrm{,}$ , then

$$
\begin{array}{r}{\langle \nabla F(y) - \nabla F(x), y - x \rangle \ge \frac{\langle \nabla F(x), y - x \rangle^{2}}{\nu - \langle \nabla F(x), y - x \rangle}.} \end{array}\tag{5.3.11}
$$

2. A standard self-concordant function F is a ν-self-concordant barrier if and only $if$

$$
\begin{array}{r}{F(y) \geq F(x) - \nu \ln \left(1 - \frac{1}{\nu} \langle \nabla F(x), y - x \rangle \right) \quad \forall x, y \in domF.} \end{array}\tag{5.3.12}
$$

Proof 1. Let us fix two points x, $y \in$ dom F . Consider the univariate function

$$
\phi(t) = \langle \nabla F(x + t(y - x)), y - x \rangle, \quad t \in[0, 1].
$$

If $\phi(0) \leq 0.$ , then (5.3.10) is trivial. If $\phi(0) = 0$ , then (5.3.11) is valid in view of convexity of f . Suppose that $\phi(0) > 0$ . In view of inequality (5.3.6), we have

$$
\begin{array}{rl} &{\phi^{\prime}(t) = \langle \nabla^{2} F(x + t(y - x))(y - x), y - x \rangle} \\ &{} \\ &{\qquad \geq \frac{1}{\nu} \langle \nabla F(x + t(y - x)), y - x \rangle^{2} = \frac{1}{\nu} \phi^{2}(t).} \end{array}
$$

Therefore, $\phi(t)$ increases and is positive for $t \in[0, 1]$ . Moreover, for any $t \in[0, 1]$ we have

$$
\begin{array}{r}{- \frac{1}{\phi(t)} + \frac{1}{\phi(0)} = \int \frac{t}{\phi^{2}(\tau)} d \tau \stackrel{(5.3.6)}{\geq} \frac{1}{\nu} t.} \end{array}
$$

This implies that $ { \langle \nabla F ( x ) , y - x \rangle } = \phi ( 0 ) < \frac { \nu } { t }$ for all $t \in[0, 1]$ . Thus, (5.3.10) is proved. At the same time,

$$
\begin{array}{r}{\phi(t) - \phi(0) \geq \frac{\nu \phi(0)}{\nu - t \phi(0)} - \phi(0) = \frac{t \phi(0)^{2}}{\nu - t \phi(0)}, \quad t \in[0, 1].} \end{array}
$$

Choosing $t = 1$ , we get inequality (5.3.11).

2. Let $\psi(x) = e^{-{\frac{1}{\nu}} F(x)}$ . In view of Lemma 5.3.1, this function is concave. It remains to note that inequality (5.3.12) is equivalent to the condition

$$
\psi(y) \leq \psi(x) + \langle \nabla \psi(x), y - x \rangle
$$

up to a logarithmic transformation of both sides.

Corollary 5.3.2 Let F be a ν-self-concordant barrier and $h \in \mathbb{E}$ be a recession direction of dom $F \colon x + \tau h \in$ dom F for any $x \in$ dom F and $\tau \geq 0.$ . Then,

$$
\langle \nabla^{2} F(x) h, h \rangle^{1 / 2} \leq \langle - \nabla F(x), h \rangle.\tag{5.3.13}
$$

Proof In view of inequality $(5.3.10), \langle \nabla F(x), h \rangle \leq 0$ . If dom F does not contain the line $\{x + \tau h, \ \tau \in \mathbb{R}\}$ , then inequality (5.3.13) follows from (5.1.27). If it contains the line, then $\langle \nabla F(x), h \rangle = 0$ for all $x \in$ dom F . This means that F is constant along this line and both sides of inequality (5.3.13) vanish.

Corollary 5.3.3 $Letx, y \in$ dom F . Then for any $\alpha \in[0, 1)$ we have

$$
F(x + \alpha(y - x)) \leq F(x) - \nu \ln(1 - \alpha).\tag{5.3.14}
$$

Proof Let $y(t) = x + t(y - x)$ and $\phi(t) = F(y(t))$ . Then

$$
\begin{array}{rl}{\phi^{\prime}(t) = \langle \nabla F(y(t)), y - x \rangle \ = \ \frac{1}{1 - t} \langle \nabla F(y(t)), y - y(\alpha) \rangle \ \stackrel{(5.3.10)}{\ \leq\} \ \frac{\nu}{1 - t}.} \end{array}
$$

Integrating this inequality in $t \in[0, \alpha)$ , we get inequality (5.3.14).

Theorem 5.3.8 Let F be a ν-self-concordant barrier. Then for any $x \in$ dom F and $y \in DomF$ such that

$$
\langle \nabla F(x), y - x \rangle \geq 0,\tag{5.3.15}
$$

## 5.3 Self-concordant Barriers

we have

$$
\| \y - x \ \|_{x} \leq \ \nu + 2{\sqrt{\nu}}.\tag{5.3.16}
$$

Proof Let $r \ = \parallel \y \ - \x \ \parallel_{x}$ and suppose $r \ > \ \sqrt \nu$ (otherwise (5.3.16) is trivial). Consider the point $y_{\alpha} ~ = ~ x + \alpha(y - x)$ with $\begin{array}{r}{\alpha{\mathrm{~ = ~}} \frac{\sqrt{\nu}}{r} \ < \1} \end{array}$ . In view of our assumption (5.3.15) and inequality (5.1.13) we have

$$
\begin{array}{rl} &{\omega \equiv \langle \nabla F(y_{\alpha}), y - x \rangle \geq \langle \nabla F(y_{\alpha}) - \nabla F(x), y - x \rangle} \\ &{\qquad = \frac{1}{\alpha} \langle \nabla F(y_{\alpha}) - \nabla F(x), y_{\alpha} - x \rangle} \\ &{\qquad \geq \frac{1}{\alpha} \cdot \frac{\| y_{\alpha} - x \|_{x}^{2}}{1 + \| y_{\alpha} - x \|_{x}} \ = \ \frac{\alpha \| y - x \|_{x}^{2}}{1 + \alpha \| y - x \|_{x}} \ = \ \frac{r \sqrt{\nu}}{1 + \sqrt{\nu}}.} \end{array}
$$

On the other hand, in view of (5.3.10), we obtain

$$
(1 - \alpha) \omega \ = \ \langle \nabla F(y_{\alpha}), y - y_{\alpha} \rangle \ \leq \ \nu.
$$

Thus,

$$
\begin{array}{r}{\left(1 - \frac{\sqrt{\nu}}{r} \right) \frac{r \sqrt{\nu}}{1 + \sqrt{\nu}} \leq \nu,} \end{array}
$$

and this is exactly (5.3.16).

We conclude this section by studying the properties of one special point of a convex set.

Definition 5.3.3 Let F be a ν-self-concordant barrier for the set Dom F . The point

$$
x_{F}^{*} = \arg \operatorname{min}_{x \in \mathrm{dom} F} F(x)
$$

is called the analytic center of the convex set Dom F , generated by the barrier F .

Theorem 5.3.9 Assume that the analytic center of a ν-self-concordant barrier F exists. Then for any x Dom F we have

$$
\| \x - x_{F}^{*} \|_{x_{F}^{*}} \leq \nu + 2 \sqrt{\nu}.
$$

On the other hand, for any $x \in \mathbb{R}^{n}$ such that $\| ~ x - x_{F}^{*} ~ \|_{x_{F}^{*}} \leq 1$ , we have x Dom F .

Proof The first statement follows from Theorem 5.3.8 since $\nabla F(x_{F}^{*}) = 0$ . The second statement follows from Theorem 5.1.5.

Thus, the asphericity of the set Dom F with respect to $x_{F}^{*}$ , computed in the metric $\| \cdot \|_{x_{F}^{*}}$ , does not exceed $\nu + 2 \sqrt \nu $ . It is well known that for any convex set in $\mathbb{R}^{n}$ there exists a metric in which the asphericity of this set is less than or equal to n

(John’s Theorem). However, we managed to estimate the asphericity in terms of the parameter of the self-concordant barrier. This value does not depend directly on the dimension of the space of variables.

Recall also that if Dom F contains no straight lines the existence of $x_{F}^{*}$ implies the boundedness of Dom F (since then $\nabla^{2} F(x_{F}^{*})$ is nondegenerate, see Theorem 5.1.6).

Corollary 5.3.4 Let Dom F be bounded. Then for any $x \in$ dom F and $v \in \mathbb{R}^{n}$ we have

$$
\begin{array}{r}{\left.\textbf{\em v} \right._{x}^{*} \le \mathbf{\epsilon}(\nu + 2 \sqrt{\nu}) \ \left.\textbf{\em v} \right._{x_{F}^{*}}^{*}.} \end{array}
$$

In other words, for any $x \in$ dom F we have

$$
\begin{array}{r}{\nabla^{2} F(x) \succeq \frac{1}{(\nu + 2 \sqrt{\nu})^{2}} \nabla^{2} F(x_{F}^{*}).} \end{array}\tag{5.3.17}
$$

Proof By Lemma 3.1.20, we get the following representation:

$$
\parallel \upsilon \parallel_{x}^{*} \equiv \langle \upsilon,[\nabla^{2} F(x)]^{- 1} \upsilon \rangle^{1 / 2} = \operatorname{max} \{\langle \upsilon, u \rangle \mid \langle \nabla^{2} F(x) u, u \rangle \leq 1\}.
$$

On the other hand, in view of Theorems 5.1.5 and 5.3.9, we have

$$
B \equiv \{y \in \mathbb{R}^{n} \mid \| y - x \|_{x} \leq 1\} \subseteq \mathrm{Dom} F
$$

$$
\subseteq \{y \in \mathbb{R}^{n} \mid \| y - x_{F}^{*} \|_{x_{F}^{*}} \leq \nu + 2{\sqrt{\nu}}\} \equiv B_{*}.
$$

Therefore, using again Theorem 5.3.9, we get the following relations:

$$
\begin{array}{rl} &{\parallel v \parallel_{x}^{*} = \operatorname{max} \{\langle v, y - x \rangle \mid y \in B\} \ \leq \ \operatorname{max} \{\langle v, y - x \rangle \mid y \in B_{*}\}} \\ &{\qquad = \langle v, x_{F}^{*} - x \rangle +(\nu + 2 \sqrt{\nu}) \parallel v \parallel_{x_{F}^{*}}^{*}.} \end{array}
$$

Note that $\parallel \boldsymbol{v} \parallel_{\boldsymbol{x}}^{*} = \parallel - \boldsymbol{v} \parallel_{\boldsymbol{x}}^{*}$ . Therefore, we can always ensure $\langle v, x_{F}^{*} - x \rangle \leq 0$ .

## 5.3.4 The Path-Following Scheme

Now we are ready to describe a barrier model of the minimization problem. This is a standard minimization problem

$$
\operatorname{min} \{\langle c, x \rangle \mid x \in Q\}\tag{5.3.18}
$$

where $Q$ is a bounded closed convex set with nonempty interior, which is a closure of the domain of some ν-self-concordant barrier F .

We are going to solve (5.3.18) by tracing the central path:

$$
x^{*}(t) = \arg \operatorname{min}_{x \in \mathrm{dom} F} f(t; x),\tag{5.3.19}
$$

where $f(t; x) = t \langle c, x \rangle + F(x)$ and $t \geq 0$ . In view of the first-order optimality condition (1.2.4), any point of the central path satisfies the equation

$$
tc + \nabla F(x^{*}(t)) = 0.\tag{5.3.20}
$$

Since the set $Q$ is bounded and F is a closed convex function, the analytic center of this set $x_{F}^{*}$ exists and it is uniquely defined (see Item 4 of Theorems 3.1.4 and 5.1.6). Moreover, it is a starting point for the central path:

$$
x^{*}(0) = x_{F}^{*}.\tag{5.3.21}
$$

In order to follow the central path, we are going to update the points satisfying an approximate centering condition:

$$
\lambda_{f(t; \cdot)}(x) \equiv \parallel f^{\prime}(t; x) \parallel_{x}^{*} = \parallel tc + \nabla F(x) \parallel_{x}^{*} \le \beta,\tag{5.3.22}
$$

where the centering parameter $\beta$ is small enough.

Let us show that this is a reasonable goal.

Theorem 5.3.10 For any $t > 0$ , we have

$$
\begin{array}{r}{\langle c, x^{*}(t) \rangle - c^{*} \leq \frac{\nu}{t},} \end{array}\tag{5.3.23}
$$

where $c^{*}$ is the optimal value of problem (5.3.18). If a point x satisfies the approximate centering condition (5.3.22), then

$$
\begin{array}{r}{\langle c, x \rangle - c^{*} \leq \frac{1}{t} \left(\nu + \frac{(\beta + \sqrt{\nu}) \beta}{1 - \beta} \right).} \end{array}\tag{5.3.24}
$$

Proof Let $x^{*}$ be a solution to (5.3.18). In view of (5.3.20) and (5.3.10), we have

$$
\begin{array}{r}{\langle c, x^{*}(t) - x^{*} \rangle = \frac{1}{t} \langle \nabla F(x^{*}(t)), x^{*} - x^{*}(t) \rangle \ \leq \ \frac{\nu}{t}.} \end{array}
$$

Further, let x satisfy (5.3.22). Let $\lambda ~ = ~ \lambda_{f(t; \cdot)}(x)$ . Then, in view of (5.3.5), Theorem 5.2.1, and (5.3.22), we have

$$
\begin{array}{rlr}{{t \langle c, x - x^{*}(t) \rangle = \langle f^{\prime}(t; x) - \nabla F(x), x - x^{*}(t) \rangle \ \leq \(\lambda + \sqrt{\nu}) \ \| \x - x^{*}(t) \ \|_{x}}} \\ &{} & \\ &{} &{\qquad \leq(\lambda + \sqrt{\nu}) \cfrac{\lambda}{1 - \lambda} \ \leq \ \frac{(\beta + \sqrt{\nu}) \beta}{1 - \beta}.\qquad \quad \bigcirc} \end{array}
$$

Let us analyze now one step of a path-following scheme. It differs from the updating rule (5.2.14) only by the origin of the objective vector.

Assume that $x \in$ dom $F.$ . Consider the following iterate:

$$
\begin{array}{rl} &{t_{+} = t + \frac{\gamma}{\| c \|_{x}^{*}},} \\ &{x_{+} = x - \frac{1}{1 + \xi}[\nabla^{2} F(x)]^{- 1}(t_{+} c + \nabla F(x)),} \\ &{\mathrm{where ~} \xi = \frac{\lambda^{2}}{1 + \lambda} \mathrm{~ and ~} \lambda = \| t_{+} c + \nabla F(x) \|_{x}^{*}.} \end{array}\tag{5.3.25}
$$

From Lemma 5.2.2 we know that if $\begin{array}{r}{\beta = \beta(\tau) = \tau^{2}(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}})} \end{array}$ with $\tau \in[0, \frac{1}{2}]$ and x satisfies approximate centering condition (5.3.22), then for $\gamma.$ , such that

$$
\begin{array}{r}{\mid \gamma \mid \leq \tau - \tau^{2}(1 + \tau + \frac{\tau}{1 + \tau + \tau^{2}}),} \end{array}\tag{5.3.26}
$$

we have again $\parallel t_{+} c + \nabla F(x_{+}) \parallel_{x_{+}}^{*} \leq \beta.$

Let us prove now that the increase of t in the scheme (5.3.25) is sufficiently large.

Lemma 5.3.2 Let x satisfy (5.3.22). Then

$$
\begin{array}{r}{\parallel c \parallel_{x}^{\ast} \leq \frac{1}{t}(\beta + \sqrt{\nu}).} \end{array}\tag{5.3.27}
$$

Proof Indeed, in view of (5.3.22) and (5.3.5), we have

$$
\begin{array}{rlr}{{t \parallel c \parallel_{x}^{*} = \parallel f^{\prime}(t; x) - \nabla F(x) \parallel_{x}^{*} \leq \parallel f^{\prime}(t; x) \parallel_{x}^{*} + \parallel \nabla F(x) \parallel_{x}^{*}}} \\ &{} & \\ &{\leq \beta + \sqrt{\nu}.} &{\sqsupset} \end{array}
$$

Let us now fix some reasonable values of parameters in method (5.3.25). In the remaining part of this chapter we always assume that

$$
\begin{array}{l}{{\tau = 0.29, \quad \beta = \beta(\tau) \approx 0.126,}} \\{{}} \\{{\gamma = \tau - \beta(\tau) \approx 0.164 \quad \Rightarrow \quad \gamma^{- 1} < 6.11.}} \end{array}\tag{5.3.28}
$$

We have proved that it is possible to follow the central path, using the rule (5.3.25). Note that we can either increase or decrease the current value of t. The lower

estimate for the rate of increasing t is

$$
\begin{array}{r}{t_{+} \geq \left(1 + \frac{\gamma}{\beta + \sqrt{\nu}} \right) \cdot t,} \end{array}
$$

and the upper estimate for the rate of decreasing t is

$$
\begin{array}{r}{t_{+} \leq \left(1 - \frac{\gamma}{\beta + \sqrt{\nu}} \right) \cdot t.} \end{array}
$$

Thus, the general scheme for solving the problem (5.3.18) is as follows.

## Main path-following scheme

0. Set $t_{0} = 0.$ . Choose an accuracy $\epsilon > 0$ and $x_{0} \in \operatorname{dom} F$ such that

$$
\| \ \nabla F(x_{0}) \ \|_{x_{0}}^{*} \leq \beta.
$$

1. kth iteration $(k \geq 0)$ . Set

$$
\begin{array}{r}{t_{k + 1} = t_{k} + \frac{\gamma}{\| c \|_{x_{k}}^{*}},} \end{array}
$$

$$
\begin{array}{r}{x_{k + 1} = x_{k} - \frac{1}{1 + \xi_{k}}[\nabla^{2} F(x_{k})]^{- 1}(t_{k + 1} c + \nabla F(x_{k})),} \end{array}
$$

$$
\begin{array}{r}{\mathrm{where} \xi_{k} = \frac{\lambda_{k}^{2}}{1 + \lambda_{k}}, ~ \mathrm{and} \lambda_{k} = \| t_{k + 1} c + \nabla F(x_{k}) \|_{x_{k}}^{*}.} \end{array}
$$

2. Stop the process if $\begin{array}{r}{t_{k} \ge \frac{1}{\epsilon} \left(\nu + \frac{(\beta + \sqrt{\nu}) \beta}{1 - \beta} \right)} \end{array}$

(5.3.29)

Let us derive a complexity bound for the above scheme.

Theorem 5.3.11 Method (5.3.29) terminates after N steps at most, where

$$
\begin{array}{r}{N \leq O \left(\sqrt{\nu} \ln \frac{\nu \left.c \right._{x_{F}^{*}}^{*}}{\epsilon} \right).} \end{array}
$$

Moreover, at the moment of termination we have $\langle c, x_{N} \rangle - c^{*} \leq \epsilon.$

Proof Note that $\begin{array}{r}{r_{0} \equiv \parallel{x}_{0} -{x}_{F}^{*} \parallel_{{x}_{0}} \le \frac{\beta}{1 - \beta}} \end{array}$ (see Theorem 5.2.1). Therefore, in view of Theorem 5.1.7 we have

$$
\begin{array}{r}{\frac{\gamma}{t_{1}} = \parallel c \parallel_{x_{0}}^{*} \leq \frac{1}{1 - r_{0}} \parallel c \parallel_{x_{F}^{*}}^{*} \leq \frac{1 - \beta}{1 - 2 \beta} \parallel c \parallel_{x_{F}^{*}}^{*}.} \end{array}
$$

Thus, $\begin{array}{r}{t_{k} \geq \frac{\gamma(1 - 2 \beta)}{(1 - \beta) \left.c \right._{x_{F}^{*}}^{*}} \left(1 + \frac{\gamma}{\beta + \sqrt{\nu}} \right)^{k - 1}} \end{array}$ for all $k \geq 1$ □

Let us discuss now the above complexity bound. The main term there is

$$
6.11 \sqrt{\nu} \ln \frac{\nu \| c \|_{x_{F}^{*}}^{*}}{\epsilon}.
$$

Note that the value $\nu \parallel c \parallel_{x_{F}^{*}}^{*}$ estimates from above the variation of the linear function $\langle c, x \rangle$ over the set Dom $F$ (see Theorem 5.3.9). Thus, the ratio $\frac{\epsilon}{\nu \| c \|_{\boldsymbol{x}_{F}^{*}}^{*}}$ can be seen as the relative accuracy of the solution.

The process (5.3.29) has one drawback. Sometimes it is difficult to satisfy its starting condition

$$
\begin{array}{r}{\parallel \nabla F(x_{0}) \parallel_{x_{0}}^{*} \leq \beta.} \end{array}
$$

In this case, we need an additional process for computing an appropriate starting point. We analyze the corresponding strategies in the next section.

## 5.3.5 Finding the Analytic Center

Thus, our current goal is to find an approximation to the analytic center of the set Dom F . Let us look at the following minimization problem:

$$
\operatorname{min} \{F(x) \mid x \in \operatorname{dom} F\},\tag{5.3.30}
$$

where F is a ν-self-concordant barrier. In view of the needs of the previous section, we accept an approximate solution $\bar{x} \in$ dom $F$ to this problem, which satisfies the inequality

$$
\begin{array}{r}{\| ~ \nabla F(\bar{x}) ~ \|_{\bar{x}}^{*} \leq ~ \beta,} \end{array}
$$

for certain $\beta \in(0, 1)$

As we have already discussed in Sect. 5.2, we can apply two different minimization strategies. The first one is a straightforward implementation of the Intermediate Newton’s Method and the second one is based on a path-following approach.


<!-- MinerU source pages 401-600 -->

## 5.3 Self-concordant Barriers

Consider the first scheme.

Intermediate Newton’s Method for finding the analytic center   
0. Choose $y_{0} \in$ dom F.   
1. kth iteration $(k \geq 0)$ . Set   
<sup>2</sup>F (y ) −<sup>1</sup> F (y )   
y<sub>k 1</sub> y<sub>k</sub> 1 ξ<sub>k</sub>   
where $\begin{array}{r}{\xi_{k} = \frac{\lambda_{k}^{2}}{1 + \lambda_{k}}} \end{array}$ and $\lambda_{k} = \parallel \nabla F(y_{k}) \parallel_{y_{k}}^{*}$   
2. Stop the process if $\| \ \nabla F(y_{k}) \ \|_{y_{k}}^{*} \leq \beta.$

(5.3.31)

As we have seen already, this method needs $O(F(y_{0}) - F(x_{F}^{*}))$ iterations to enter to the region of quadratic convergence.

To implement the path-following approach, we need to choose some $y_{0} \in$ dom F and define the auxiliary central path:

$$
y^{*}(t) = \arg \operatorname{min}_{y \in \mathrm{dom}{\cal F}}[- t \langle \nabla{\cal F}(y_{0}), y \rangle +{\cal F}(y)],
$$

where $t \geq 0$ . Since this trajectory satisfies the equation

$$
\nabla F(y^{*}(t)) \ : = \ : t \nabla F(y_{0}),\tag{5.3.32}
$$

it connects two points, the starting point y and the analytic center $x_{F}^{*}$ :

$$
y^{*}(1) = y_{0}, \quad y^{*}(0) = x_{F}^{*}.
$$

As was shown in Lemma 5.2.2, we can follow this trajectory by the process (5.3.25) with decreasing t.

Let us estimate the rate of convergence of the auxiliary central path $y^{*}(t)$ to the analytic center in terms of the barrier parameter.

Lemma 5.3.3 For any $t \geq 0,$ , we have

$$
\| ~ \nabla F(y^{*}(t)) ~ \|_{y^{*}(t)}^{*} \leq(\nu + 2 \sqrt{\nu}) ~ \| ~ \nabla F(y_{0}) ~ \|_{x_{F}^{*}}^{*} \cdot t.
$$

Proof This estimate follows from (5.3.32) and Corollary 5.3.4.

Let us look now at the corresponding algorithmic scheme.

## Auxiliary Path-Following Scheme

0. Choose $y_{0} \in$ dom F. Set $t_{0} = 1$

1. kth iteration $(k \geq 0)$ . Set

$$
\begin{array}{r}{t_{k + 1} = t_{k} - \frac{\gamma}{\Vert \nabla F(y_{0}) \Vert_{y_{k}}^{*}},} \end{array}
$$

$$
\begin{array}{r}{y_{k + 1} = y_{k} - \frac{1}{1 + \xi_{k}}[\nabla^{2} F(y_{k})]^{- 1}(- t_{k + 1} \nabla F(y_{0}) + \nabla F(y_{k})),} \end{array}
$$

$$
\begin{array}{r}{\mathrm{where} \xi_{k} = \frac{\lambda_{k}^{2}}{1 + \lambda_{k}} \operatorname{and} \lambda_{k} = \| t_{k + 1} \nabla F(y_{0}) - \nabla F(y_{k}) \|_{y_{k}}^{*}.} \end{array}
$$

2. Stop the process if $\| \ \nabla F(y_{k}) \ \|_{y_{k}}^{*} \leq \tau.$ Set $\begin{array}{r}{\xi_{k} = \frac{\lambda_{F}(y_{k})^{2}}{1 + \lambda_{F}(y_{k})}} \end{array}$

$$
\begin{array}{r}{\mathrm{and} \bar{x} = y_{k} - \frac{1}{1 + \xi_{k}}[\nabla^{2} F(y_{k})]^{- 1} \overset{\cdot}{\nabla} F(y_{k}).} \end{array}\tag{5.3.33}
$$

Note that the above scheme follows the auxiliary central path $y^{*}(t)$ as $t_{k} \to 0$ . It updates the points $\{y_{k}\}$ satisfying the approximate centering condition

$$
\| - t_{k} \nabla F(y_{0}) + \nabla F(y_{k}) \ \|_{y_{k}}^{*} \leq \beta.
$$

The termination criterion of this process,

$$
\lambda_{k} = \parallel \nabla F(y_{k}) \parallel_{y_{k}}^{*} \leq \tau,
$$

guarantees that $\| ~ \nabla F(\bar{x}) ~ \|_{\bar{x}}^{*} \leq \beta(\tau)$ (see Theorem 5.2.2). Let us derive a complexity bound for this process.

Theorem 5.3.12 The process (5.3.33) terminates no later than after

$$
\begin{array}{r}{\frac{1}{\gamma}(\beta + \sqrt{\nu}) \ln \left[\frac{1}{\gamma}(\nu + 2 \sqrt{\nu}) \ \parallel \nabla F(y_{0}) \ \parallel_{x_{F}^{*}}^{*} \right]} \end{array}
$$

iterations.

Proof Recall that our parameters are fixed by (5.3.28). Note that $t_{0} = 1$ . Therefore, in view of Lemmas 5.2.2 and 5.3.2, we have

$$
\begin{array}{r}{t_{k + 1} \leq \left(1 - \frac{\gamma}{\beta + \sqrt{\nu}} \right) t_{k} \leq \exp \left(- \frac{\gamma(k + 1)}{\beta + \sqrt{\nu}} \right) t_{0}.} \end{array}
$$

Further, in view of Lemma 5.3.3, we obtain

$$
\begin{array}{rl} &{\| ~ \nabla F(y_{k}) ~ \|_{y_{k}}^{*} = \| ~(- t_{k} \nabla F(x_{0}) + \nabla F(y_{k})) + t_{k} \nabla F(y_{0}) ~ \|_{y_{k}}^{*}} \\ &{\qquad \le \beta + t_{k} ~ \| ~ \nabla F(y_{0}) ~ \|_{y_{k}}^{*} \le \beta + t_{k}(\nu + 2 \sqrt{\nu}) ~ \| ~ \nabla F(y_{0}) ~ \|_{x_{F}^{*}}^{*}.} \end{array}
$$

Thus, the process is terminated at most when the following inequality holds:

$$
t_{k}(\nu + 2 \sqrt{\nu}) \parallel \nabla F(y_{0}) \parallel_{x_{F}^{*}}^{*} \leq \tau - \beta(\tau) = \gamma.\qquad \mathtt{D}
$$

The principal term in the complexity bound of the auxiliary path-following scheme is

$$
6.11 \sqrt \nu[\ln \nu + \ln \mid \mid \nabla F(y_{0}) \mid \mid_{x_{F}^{*}}^{*}]
$$

and for the auxiliary Intermediate Newton’s method it is $O(F(y_{0}) - F(x_{F}^{*}))$ . These estimates cannot be compared directly. However, as we have proved in Sect. 5.2.2 by another reasoning the path-following approach is much more efficient. Note also that its complexity estimate naturally fits the complexity of the main path-following process. Indeed, if we apply (5.3.29) with (5.3.33), we get the following complexity bound for the whole process:

$$
\begin{array}{r}{6.11 \sqrt{\nu} \left[2 \ln \nu + \ln \mid \mid \nabla F(y_{0}) \mid \mid_{x_{F}^{*}}^{*} + \ln \mid \mid c \mid \mid_{x_{F}^{*}}^{*} + \ln \frac{1}{\epsilon} \right].} \end{array}
$$

To conclude this section, note that for some problems it is difficult even to point out a starting point $y_{0} \in \mathrm{dom} F.$ . In such cases, we should apply one more auxiliary minimization process, which is similar to the process (5.3.33). We discuss this situation in the next section.

## 5.3.6 Problems with Functional Constraints

Let us consider the following minimization problem:

$$
\operatorname{min}_{x \in Q} \{f_{0}(x) : \f_{j}(x) \leq 0, \j = 1 \ldots m\},\tag{5.3.34}
$$

where $Q$ is a simple bounded closed convex set with nonempty interior and all functions $f_{j}, ~ j = 0 \ldots m$ , are convex. We assume that the problem satisfies the Slater condition: There exists an $\bar{x} \in$ int $Q$ such that $f_{j}({\bar{x}}) < 0$ for all $j = 1 \ldots m$

Let us assume that we know an upper bound $\bar{\xi}$ such that $f_{0}(x) < \bar{\xi}$ for all $x \in Q$ Then, introducing two additional variables $\xi$ and $\varkappa$ , we can rewrite this problem in the standard form:

$$
\operatorname{min}_{\xi \le \bar{\xi}, \x \le 0, \atop x \in Q} \{\xi : \f_{0}(x) \leq \xi, \f_{j}(x) \leq \varkappa, \j = 1 \ldots m\}.\tag{5.3.35}
$$

Note that we can apply interior-point methods to this problem only if we are able to construct a self-concordant barrier for the feasible set. In the current situation, this means that we should be able to construct the following barriers:

- A self-concordant barrier $F_{O}(x)$ for the set $Q$

$\mathbf{A}$ self-concordant barrier $F_{0}(x, \xi)$ for the epigraph of the objective function $f_{0}(x)$

- Self-concordant barriers $F_{j}(x, \varkappa)$ for the epigraphs of functional constraints $f_{j}(x)$

Let us assume that we can do that. Then the resulting self-concordant barrier for the feasible set of problem (5.3.35) is as follows:

$$
\hat{F}(x, \xi, x) = F_{Q}(x) + F_{0}(x, \xi) + \sum_{j = 1}^{m} F_{j}(x, x) - \ln(\bar{\xi} - \xi) - \ln(- \chi).
$$

The parameter of this barrier is

$$
\hat{\nu} = \nu_{Q} + \nu_{0} + \sum_{j = 1}^{m} \nu_{j} + 2,\tag{5.3.36}
$$

where $\nu_{(\cdot)}$ are the parameters of the corresponding barriers.

Note that it could still be difficult to find a starting point from dom $\hat{F}.$ . This domain is an intersection of the set $Q$ with epigraphs of the objective function and constraints, and with two additional linear constraints $\xi \le \bar{\xi}$ and $\varkappa \leq 0$ . If we have a point $x_{0} \in$ int $Q$ , then we can choose $\xi_{0}$ and $\varkappa_{0}$ large enough to guarantee

$$
f_{0}(x_{0}) \ < \ \xi_{0} \ < \ \bar{\xi}, f_{j}(x_{0}) \ < \x_{0}, \j = 1 \ldots m.
$$

Then, only constraint $\varkappa \leq 0$ will be violated.

In order to simplify our analysis, let us change the notation. From now on, we consider the problem

$$
\operatorname{min}_{z \in S} \{\langle c, z \rangle : \langle d, z \rangle \leq 0\},\tag{5.3.37}
$$

where $z ~ = ~(x, \xi, x), ~ \langle c, z \rangle ~ \equiv ~ \xi, ~ \langle d, z \rangle ~ \equiv ~ \varkappa$ and $s$ is the feasible set of problem (5.3.35) without the constraint $\varkappa \leq 0$ . Note that we know a self-concordant barrier $F(z)$ for the set S, and we can easily find a point $z_{0} ~ \in$ int S. Moreover, in

view of our assumptions, the set

$$
S(\alpha) \ = \ \{z \in S \mid \ \langle d, z \rangle \leq \alpha\}
$$

is bounded and, for $\alpha$ large enough, it has nonempty interior.

The process of solving problem (5.3.37) consists of three stages.

1. Choose a starting point $z_{0} ~ \in$ int $s$ and some initial gap $\varDelta \ > \0$ . Set $\alpha =$ $\langle d, z_{0} \rangle + \varDelta.\mathrm{If} \alpha \leq 0$ , then we can use the two-stage process described in Sect. 5.3.5. Otherwise, we do the following. First, we find an approximate analytic center of the set $S(\alpha)$ , generated by the barrier

$$
\tilde{F}(z) = F(z) - \ln(\alpha - \langle d, z \rangle).
$$

Namely, we find a point $\tilde{z}$ satisfying the condition

$$
\begin{array}{r}{\lambda_{\tilde{F}}(\tilde{z}) \equiv \langle \nabla F(\tilde{z}) + \frac{d}{\alpha - \langle d, \tilde{z} \rangle},[\nabla^{2} \tilde{F}(\tilde{z})]^{- 1} \Big(\nabla F(\tilde{z}) + \frac{d}{\alpha - \langle d, \tilde{z} \rangle} \Big) \rangle^{1 / 2} \leq \beta.} \end{array}
$$

In order to generate such a point, we can use the auxiliary schemes discussed in Sect. 5.3.5.

2. The next stage consists in following the central path $z(t)$ defined by the equation

$$
td + \nabla \tilde{F}(z(t)) = 0, \quad t \geq 0.
$$

Note that the previous stage provides us with a reasonable approximation to the analytic center $z(0)$ . Therefore, we can follow this path, using the process (5.3.25). This trajectory leads us to the solution of the minimization problem

$$
\operatorname{min} \{\langle d, z \rangle \mid z \in S(\alpha)\}.
$$

In view of the Slater condition for problem (5.3.37), the optimal value of this problem is strictly negative.

The goal of this stage consists in finding an approximation to the analytic center of the set

$$
\bar{S} = \{z \in S(\alpha) \mid \langle d, z \rangle \leq 0\}
$$

generated by the barrier $\bar{F}(z) = \tilde{F}(z) - \ln(- \langle d, z \rangle)$ . This point, $z_{*}$ , satisfies the equation

$$
\begin{array}{r}{\nabla \tilde{F}(z_{*}) - \frac{d}{\langle d, z_{*} \rangle} = 0.} \end{array}
$$

Therefore, $z_{*}$ is a point of the central path $z(t)$ . The corresponding value of the penalty parameter $t_{*}$ is

$$
\begin{array}{r}{t_{*} = - \frac{1}{\langle d, z_{*} \rangle} > 0.} \end{array}
$$

This stage terminates with a point $\bar{z}$ satisfying the condition

$$
\begin{array}{r}{\lambda_{\tilde{F}}(\bar{z}) \equiv \langle \nabla \tilde{F}(\bar{z}) - \frac{d}{\langle d, \bar{z} \rangle},[\nabla^{2} \tilde{F}(\bar{z})]^{- 1} \Big(\nabla \tilde{F}(\bar{z}) - \frac{d}{\langle d, \bar{z} \rangle} \Big) \rangle^{1 / 2} \leq \beta.} \end{array}
$$

3. Note that $\nabla^{2} \bar{F}(z) \succeq \nabla^{2} \tilde{F}(z)$ . Therefore, the point $\bar{z},$ computed at the previous stage, satisfies the inequality

$$
\begin{array}{r}{\lambda_{\bar{\cal F}}(\bar{z}) \equiv \langle \nabla \tilde{\cal F}(\bar{z}) - \frac{d}{\langle d, \bar{z} \rangle},[\nabla^{2} \bar{\cal F}(\bar{z})]^{- 1} \Big(\nabla \tilde{\cal F}(\bar{z}) - \frac{d}{\langle d, \bar{z} \rangle} \Big) \rangle^{1 / 2} \leq \beta.} \end{array}
$$

This means that we have a good approximation of the analytic center of the set ${\bar{S}},$ and we can apply the main path-following scheme (5.3.29) to solve the problem

$$
\operatorname{min} \{\langle c, z \rangle : z \in{\bar{S}}\}.
$$

Clearly, this problem is equivalent to (5.3.37).

We omit the detailed complexity analysis of the above three-stage scheme. It can be done similarly to the analysis of Sect. 5.3.5. The main term in the complexity of this scheme is proportional to the product of $\sqrt{\hat{\nu}}$ (see (5.3.36)) and the sum of the logarithm of the desired accuracy $\epsilon$ with logarithms of some structural characteristics of the problem (size of the region, depth of Slater condition, etc.).

Thus, we have shown that the interior point methods can be applied to all problems, for which we can point out some self-concordant barriers for the basic feasible set $Q$ and for the epigraphs of functional constraints. Our main goal now is to describe the classes of convex problems for which such barriers can be constructed in a computable form. Note that we have an exact characteristic of the quality of self-concordant barrier. This is the value of its parameter. The smaller it is, the more efficient will be the corresponding path-following scheme. In the next section, we discuss our possibilities in applying the developed theory to particular convex problems.

## 5.4 Applications to Problems with Explicit Structure

(Bounds on parameters of self-concordant barriers; Linear and quadratic optimization; Semidefinite optimization; Extremal ellipsoids; Constructing self-concordant barriers for particular sets; Separable problems; Geometric optimization; Approximation in $\ell_{p}{\cdot} \mathrm{norms};$ Choice of optimization scheme.)

## 5.4.1 Lower Bounds for the Parameter of a Self-concordant Barrier

In the previous section, we discussed a path-following scheme for solving the following problem:

$$
\operatorname{min}_{x \in Q}{\langle c, x \rangle},\tag{5.4.1}
$$

where $Q$ is a closed convex set with nonempty interior, for which we know a ν-selfconcordant barrier $F(\cdot)$ . Using such a barrier, we can solve (5.4.1) in $O \left(\sqrt{\nu} \cdot \ln \frac{\nu}{\epsilon} \right)$ iterations of a path-following scheme. Recall that the most difficult part of each iteration is the solution of a system of linear equations.

In this section, we study the limits of applicability of this approach. We discuss the lower and upper bounds for the parameters of self-concordant barriers. We also discuss some classes of convex problems for which the model (5.4.1) can be created in a computable form.

Let us start from the lower bounds on the barrier parameters.

Lemma 5.4.1 Let f be a ν-self-concordant barrier for the interval $(\alpha, \beta) \subset \mathbb{R}_{}$ $\alpha < \beta < \infty$ , where we admit the value $\alpha = - \infty$ . Then

$$
\nu \ge \varkappa \ \overset{def}{=} \ \operatorname{sup}_{t \in(\alpha, \beta)} \ \frac{(f^{\prime}(t))^{2}}{f^{\prime \prime}(t)} \ \ge \1.
$$

Proof Note that $\nu \geq \varkappa$ by definition. Let us assume that $\varkappa < 1$ . Since f is a convex barrier function for $(\alpha, \beta)$ , there exists a value $\bar{\alpha} \in(\alpha, \beta)$ such that $f^{\prime}(t) > 0$ for all $t \in[\bar{\alpha}, \beta)$

Consider the function $\begin{array}{r}{\phi(t) = \frac{(f^{\prime}(t))^{2}}{f^{\prime \prime}(t)}, t \in[\bar{\alpha}, \beta)} \end{array}$ . Then, since $f^{\prime}(t) > 0, f(\cdot)$ is standard self-concordant, and $\phi(t) \overset{\cdot}{\leq} \varkappa < 1$ , we have

$$
\begin{array}{rl} &{\phi^{\prime}(t) = 2f^{\prime}(t) - \left(\frac{f^{\prime}(t)}{f^{\prime \prime}(t)} \right)^{2} f^{\prime \prime \prime}(t)} \\ &{\quad \quad = f^{\prime}(t) \left(2 - \frac{f^{\prime}(t)}{\sqrt{f^{\prime \prime}(t)}} \cdot \frac{f^{\prime \prime \prime}(t)}{[f^{\prime \prime}(t)]^{3 / 2}} \right) \ \geq \2(1 - \sqrt{\varkappa}) f^{\prime}(t).} \end{array}
$$

Hence, for all $t \in[\bar{\alpha}, \beta)$ we obtain $\phi(t) \geq \phi({\bar{\alpha}}) + 2(1 -{\sqrt{\varkappa}})(f(t) - f({\bar{\alpha}}))$ . This is a contradiction since $f$ is a barrier function and $\phi$ is bounded from above.

Corollary 5.4.1 Let F be a ν-self-concordant barrier for $Q \subset \mathbb{E}.$ . Then $\nu \geq 1$

Proof Indeed, let $x \in$ int Q. Since $Q \subset \mathbb{E}$ , there exists a nonzero direction $u \in \mathbb{E}$ such that the line $\{y \ = \x + tu, \t \ \in \ \mathbb{R}\}$ intersects the boundary of the set $Q$ Therefore, considering function $f(t) = F(x + tu)$ , and using Lemma 5.4.1, we get the result.

Let us prove a simple lower bound for parameters of self-concordant barriers for unbounded sets.

Let $Q$ be a closed convex set with nonempty interior. Consider $\bar{x} \in$ int $Q$ Assume that there exists a nontrivial set of recession directions $\{p1, \ldots, p_{k}\}$ of the set $Q \colon Q \colon$

$$
\bar{x} + \alpha p_{i} \in \mathcal{Q} \quad \forall \alpha \geq 0, \quad i = 1, \ldots, k.
$$

Theorem 5.4.1 Let the positive coefficients $\{\beta_{i}\}_{i = 1}^{k}$ satisfy the condition

$$
\bar{x} - \beta_{i} \p_{i} \notin intQ, \quad i = 1, \ldots, k.
$$

If for some positive $\alpha_{1}, \ldots, \alpha_{k}$ we have ${\bar{y}} ={\bar{x}} - \sum_{i = 1}^{k} \alpha_{i} p_{i} \in Q$ , then the parameter ν of any self-concordant barrier for the set $Q$ satisfies the inequality:

$$
\nu \geq \sum_{i = 1}^{k} \{\frac{\alpha_{i}}{\beta_{i}}}.
$$

Proof Let $F$ be a ν-self-concordant barrier for the set $Q$ . Since $p_{i}$ is a recession direction, by Theorem 5.1.14 we have

$$
\langle \nabla F(\bar{x}), - p_{i} \rangle \ge \langle \nabla^{2} F(\bar{x}) p_{i}, p_{i} \rangle^{1 / 2} \equiv \parallel p_{i} \parallel_{\bar{x}}.
$$

Note that ${\bar{x}} - \beta_{i} \p_{i} \notin Q$ . Therefore, in view of Theorem 5.1.5, the norm of direction $p_{i}$ is large enough: $\beta_{i} \parallel p_{i} \parallel_{\bar{x}} \geq 1$ . Hence, in view of Theorem 5.3.7, we obtain

$$
\nu \ge \langle \nabla F(\bar{x}), \bar{y} - \bar{x} \rangle \ = \ \langle \nabla F(\bar{x}), - \sum_{i = 1}^{k} \alpha_{i} p_{i} \rangle
$$

$$
\geq \sum_{i = 1}^{k} \alpha_{i} \parallel p_{i} \parallel_{\bar{x}} \geq \sum_{i = 1}^{k} \frac{\alpha_{i}}{\beta_{i}}.
$$

## 5.4.2 Upper Bound: Universal Barrier and Polar Set

Let us present now an existence theorem for self-concordant barriers. Consider a closed convex set $Q.$ int $Q \neq \emptyset.$ , and assume that $Q$ contains no straight lines. Define a polar set of $Q$ with respect to some point $\bar{x} \in$ int $Q$ as follows:

$$
P({\bar{x}}) = \{s \in \mathbb{R}^{n} \mid \langle s, x -{\bar{x}} \rangle \leq 1, \forall x \in Q\}.
$$

It can be proved that for any $x \in$ int $Q$ the set $P(x)$ is a bounded closed convex set with nonempty interior. It always contains the origin.

Define $V(x) = \operatorname{vol}_{n} P(x)$

Theorem 5.4.2 There exist absolute constants $c_{1}$ and $c_{2},$ , such that the function

$$
U(x) = c_{1} \cdot \ln V(x)
$$

is a (c n)-self-concordant barrier for $Q.$ .

We drop the proof of this statement since it is very technical.

The function $U(\cdot)$ is called the Universal Barrier for the set $Q.$ . Note that the analytical complexity of problem (5.4.1), equipped with a universal barrier, is $O \left({\sqrt{n}} \cdot \ln{\frac{n}{\epsilon}} \right)$ calls of oracle. Recall that such efficiency estimate is impossible for the methods based on a local Black-Box oracle (see Theorem 3.2.8).

The statement of Theorem 5.4.2 is mainly of theoretical interest. Indeed, in general, the value $U(x)$ cannot easily be computed. However, Theorem 5.4.2 demonstrates that self-concordant barriers, in principle, can be found for any convex set. Thus, the applicability of this approach is restricted only by our ability to construct a computable self-concordant barrier, hopefully with a small value of the parameter. The process of creating the barrier model of the initial problem can hardly be described in a formal way. For each particular problem, there could be many different barrier models, and we should choose the best one, taking into account the value of the parameter of the self-concordant barrier, the complexity of the computation of its gradient and Hessian, and the complexity of the solution of the corresponding Newton system.

In the remaining part of this section we will see how this can be done for some standard problem classes of Convex Optimization.

## 5.4.3 Linear and Quadratic Optimization

Let us start from a problem of Linear Optimization:

$$
\operatorname{min}_{x \in \mathbb{R}_{+}^{n}} \{\langle c, x \rangle \colon Ax = b\},\tag{5.4.2}
$$

where $A$ is an $(m \times n) – \mathrm{matrix}$ $\textit{m} \ : < \ : n$ . The basic feasible set in this problem is represented by the positive orthant, the set of all vectors with nonnegative coefficients in $\mathbb{R}^{n}$ . It can be equipped with the following self-concordant barrier:

$$
F(x) = - \sum_{i = 1}^{n} \ln x^{(i)}, \quad \nu = n,\tag{5.4.3}
$$

(see Example 5.3.1 and Theorem 5.3.2). This barrier is called the standard logarithmic barrier for $\mathbb{R}_{+}^{n}$

In order to solve problem (5.4.2), we have to use a restriction of the barrier F onto the affine subspace $\{x \ : \quad Ax \ = \b\}$ . Since this restriction is an n-selfconcordant barrier (see Theorem 5.3.3), the complexity bound for problem (5.4.2) is $O \left({\sqrt{n}} \cdot \ln{\frac{n}{\epsilon}} \right)$ iterations of a path-following scheme.

Let us prove that the standard logarithmic barrier is optimal for $\mathbb{R}_{+}^{n}$

Lemma 5.4.2 The parameter ν of any self-concordant barrier for <sup>Rn</sup> satisfies inequality $\nu \geq n.$

Proof Let us choose

$$
\bar{x} = \bar{e}_{n} \equiv(1, \ldots, 1)^{T} \in \mathrm{int} \mathbb{R}_{+}^{n},
$$

$$
p_{i} = e_{i}, \quad i = 1 \ldots n,
$$

where $e_{i}$ is the ith coordinate vector of $\mathbb{R}^{n}$ . In this case the conditions of Theorem 5.4.1 are satisfied with $\alpha_{i} = \beta_{i} = 1, i = 1 \ldots n$ . Therefore,

$$
\nu \geq \sum_{i = 1}^{n}{\frac{\alpha_{i}}{\beta_{i}}} \ = \n.\qquad \sqcap
$$

Note that the above lower bound is valid only for the whole set $\mathbb{R}_{+}^{n}$ . The lower bound for the intersection $\{x \in \mathbb{R}_{+}^{n} \mid Ax = b\}$ can be smaller.

Self-concordant barriers for cones usually have one important property, which is called logarithmic homogeneity (e.g. (5.4.3)).

Definition 5.4.1 A function $F \in C^{2}(\mathbb{E})$ with Dom $F = K$ , where K is a closed convex cone, is called logarithmically homogeneous if there exists a constant $\nu \geq 1$ such that

$$
F(\tau x) = F(x) - \nu \ln \tau, \quad \forall x \in \operatorname{int} K, \ \tau > 0.\tag{5.4.4}
$$

This simple property has surprisingly many interesting consequences, one of which makes the computation of the barrier parameter completely trivial.

Lemma 5.4.3 Let F be a logarithmically homogeneous self-concordant barrier for a convex cone K which contains no straight lines. Then for any $x \in$ int K and $\tau > 0$ we have

$$
\begin{array}{r}{\nabla F(\tau x) = \frac{1}{\tau} \nabla F(x), \quad \nabla^{2} F(\tau x) \ = \ \frac{1}{\tau^{2}} \nabla^{2} F(x),} \end{array}\tag{5.4.5}
$$

$$
\langle \nabla F(x), x \rangle = - \nu, \quad \nabla^{2} F(x) x ~ = ~ - \nabla F(x),\tag{5.4.6}
$$

$$
\langle \nabla^{2} F(x) x, x \rangle = \nu, \quad \langle \nabla F(x),[\nabla^{2} F(x)]^{- 1} \nabla F(x) \rangle = \nu.\tag{5.4.7}
$$

Proof Differentiating identity (5.4.4) in x, we get the first identity in (5.4.5).   
Differentiating the latter identity in x again, we get the second relation in (5.4.5).

Differentiating identity (5.4.4) in τ and taking $\tau = 1$ , we get the first identity in (5.4.6). Differentiating it in x, we obtain the second identity in this line.

Finally, substituting the last expression in (5.4.6) into the first one, we get the first identity in (5.4.7). Since K contains no straight lines $\nabla^{2} F(x)$ is non-degenerate. Therefore, $x = -[\nabla^{2} F(x)]^{- 1} \nabla F(x)$ , and we get the last expression in (5.4.7).

Thus, for logarithmically homogeneous barriers, the degree of homogeneity is always equal to the barrier parameter (see the second identity in (5.4.7)).

Let us look now at the quadratically constrained quadratic optimization problem:

$$
\begin{array}{r}{\underset{x \in \mathbb{R}^{n}}{\operatorname{min}} \{\q_{0}(x) = \alpha_{0} + \langle a_{0}, x \rangle + \frac{1}{2} \langle A_{0} x, x \rangle,} \end{array}\tag{5.4.8}
$$

$$
\begin{array}{r}{q_{i}(x) = \alpha_{i} + \langle a_{i}, x \rangle + \frac{1}{2} \langle A_{i} x, x \rangle \leq \beta_{i}, \i = 1 \ldots m\},} \end{array}
$$

where $A_{i}$ are some positive semidefinite $(n \times n)$ -matrices. Let us rewrite this problem in the standard form:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}, \tau \in \mathbb{R}} \{\tau : q_{0}(x) \leq \tau, \q_{i}(x) \leq \beta_{i}, \i = 1 \ldots m\}.\tag{5.4.9}
$$

The feasible set of this problem can be equipped with the following self-concordant barrier:

$$
F(x, \tau) = - \ln(\tau - q_{0}(x)) - \sum_{i = 1}^{m} \ln(\beta_{i} - q_{i}(x)), \quad \nu = m + 1,
$$

(see Example 5.3.1, and Theorem 5.3.2). Thus, the complexity bound for problem (5.4.8) is $O \left({\sqrt{m + 1}} \cdot \ln{\frac{m}{\epsilon}} \right)$ iterations of a path-following scheme. Note that this estimate does not depend on n.

In some applications, the functional components of the problem include a nonsmooth quadratic term of the form $\parallel \Ax \ - \b \ \parallel$ , where the norm is standard Euclidean. Let us show that we can treat such terms using an interior-point technique.

## Lemma 5.4.4 The function

$$
F(x, t) = - \ln(t^{2} - \parallel x \parallel^{2})
$$

is a 2-self-concordant barrier for the convex cone<sup>5</sup>

$$
K_{2} = \{(x, t) \in \mathbb{R}^{n + 1} \mid t \geq \parallel x \parallel\}.
$$

Proof Let us fix a point $z =(x, t) \in$ int $K_{2}$ and a nonzero direction $u =(h, \tau) \in$ $\mathbb{R}^{n + i}$ . Let $\xi(\alpha) =(t + \alpha \tau)^{2} - \parallel x + \alpha h \parallel^{2}$ . We need to compare the derivatives of the function

$$
\phi(\alpha) = F(z + \alpha u) = - \ln \xi(\alpha)
$$

at $\alpha = 0$ . Let $\phi^{(\cdot)} = \phi^{(\cdot)}(0), \xi^{(\cdot)} = \xi^{(\cdot)}(0)$ . Then

$$
\xi^{\prime} = 2(t \tau - \langle x, h \rangle), \quad \xi^{\prime \prime} = 2(\tau^{2} - \parallel h \parallel^{2}), \quad \xi^{\prime \prime \prime} = 0,
$$

$$
\begin{array}{r}{\phi^{\prime} = - \frac{\xi^{\prime}}{\xi}, \quad \phi^{\prime \prime} = \left(\frac{\xi^{\prime}}{\xi} \right)^{2} - \frac{\xi^{\prime \prime}}{\xi}, \quad \phi^{\prime \prime \prime} = 3 \frac{\xi^{\prime} \xi^{\prime \prime}}{\xi^{2}} - 2 \left(\frac{\xi^{\prime}}{\xi} \right)^{3}.} \end{array}
$$

Note that inequality $2 \phi^{\prime \prime} \ge ~(\phi^{\prime})^{2}$ is equivalent to $(\xi^{\prime})^{2} \ge 2 \xi \xi^{\prime \prime}$ . Thus, we need to prove that for any $(h, \tau)$ we have

$$
(t \tau - \langle x, h \rangle)^{2} \geq(t^{2} - \parallel x \parallel^{2})(\tau^{2} - \parallel h \parallel^{2}).
$$

After opening the brackets and cancellation, we come to the inequality

$$
\tau^{2} \| x \|^{2} + t^{2} \| h \|^{2} + \langle x, h \rangle^{2} - 2 \tau t \langle x, h \rangle \geq \| x \|^{2} \| h \|^{2}.
$$

Minimizing the left-hand side in τ , we get inequality

$$
\begin{array}{rl} &{t^{2} \| h \|^{2} + \langle x, h \rangle^{2} - t^{2} \frac{\langle x, h \rangle^{2}}{\| x \|^{2}} \geq \| x \|^{2} \| h \|^{2},} \\ &{~ \Updownarrow} \\ &{\| h \|^{2}(t^{2} - \| x \|^{2}) \geq \langle x, h \rangle^{2} \left(\frac{t^{2}}{\| x \|^{2}} - 1 \right),} \end{array}
$$

which is valid since $t \geq \| x \|$

Finally, since $\begin{array}{r}{0 \le \frac{\xi \xi^{\prime \prime}}{(\xi^{\prime})^{2}} \le \frac{1}{2}} \end{array}$ and $[1 - \xi]^{3 / 2} \geq 1 - \frac{3}{2} \xi$ , we get the following:

$$
\begin{array}{r}{\frac{| \phi^{\prime \prime \prime} |}{(\phi^{\prime \prime})^{3 / 2}} = 2 \frac{| \xi^{\prime} | \cdot |(\xi^{\prime})^{2} - \frac 32 \xi \xi^{\prime \prime} |}{[(\xi^{\prime})^{2} - \xi \xi^{\prime \prime}]^{3 / 2}} \ \leq \2.\qquad \mathtt{U}} \end{array}
$$

Let us prove that the barrier described in the above statement is optimal for the second-order cone.

Lemma 5.4.5 The parameter ν of any self-concordant barrier for the set $K_{2}$ satisfies the inequality $\nu \geq 2$

Proof Let us choose $\bar{z} =(0, 1) \in \mathrm{int} K_{2}$ and some $h \in \mathbb{R}^{n}, \parallel h \parallel = 1$ . Define

$$
p_{1} =(h, 1), \quad p_{2} =(- h, 1), \quad \alpha_{1} = \alpha_{2} = \frac 12, \quad \beta_{1} = \beta_{2} = \frac 12.
$$

Note that for all $\gamma \geq 0$ we have $\bar{z} + \gamma p_{i} =(\pm \gamma h, 1 + \gamma) \in K_{2}$ and

$$
\begin{array}{r}{\bar{z} - \beta_{i} p_{i} =(\pm \frac{1}{2} h, \frac{1}{2}) \notin \mathrm{int} K_{2},} \end{array}
$$

$$
\begin{array}{r}{\bar{z} - \alpha_{1} p_{1} - \alpha_{2} p_{2} =(- \frac{1}{2} h + \frac{1}{2} h, 1 - \frac{1}{2} - \frac{1}{2}) \ = \0 \in K_{2}.} \end{array}
$$

Therefore, the conditions of Theorem 5.4.1 are satisfied and

$$
\begin{array}{r}{\nu \geq \frac{\alpha_{1}}{\beta_{1}} + \frac{\alpha_{2}}{\beta_{2}} = 2.\qquad \mathtt{U}} \end{array}
$$

## 5.4.4 Semidefinite Optimization

In Semidefinite Optimization, the decision variables are matrices. Let

$$
X = \{X^{(i, j)}\}_{i, j = 1}^{n}
$$

be a symmetric $n \times n{\mathrm{- matrix}}$ (notation: $X \in \mathbb{S}^{n})$ . The real vector space $\mathbb{S}^{n}$ can be provided with the following inner product: for any X, $Y \in \mathbb{S}^{n}$ define

$$
\langle X, Y \rangle_{F} = \sum_{i = 1}^{n} \sum_{j = 1}^{n} \X^{(i, j)} Y^{(i, j)}, \quad \parallel X \parallel_{F} = \langle X, X \rangle_{F}^{1 / 2}.
$$

Sometimes the value $\parallel \boldsymbol{X} \parallel_{F}$ is called the Frobenius norm of the matrix X. For symmetric matrices X and Y , we have the following identity:

$$
\begin{array}{rcl}{{\langle X, Y \cdot Y \rangle_{\cal F} = \displaystyle \sum_{i = 1}^{n} \displaystyle \sum_{j = 1}^{n} X^{(i, j)} \displaystyle \sum_{k = 1}^{n} Y^{(i, k)} Y^{(j, k)} = \displaystyle \sum_{i = 1}^{n} \displaystyle \sum_{j = 1}^{n} \displaystyle \sum_{k = 1}^{n} X^{(i, j)} Y^{(i, k)} Y^{(j, k)}}} \\{{}} &{{}} \\{{= \displaystyle \sum_{k = 1}^{n} \displaystyle \sum_{j = 1}^{n} Y^{(k, j)} \displaystyle \sum_{i = 1}^{n} X^{(j, i)} Y^{(i, k)} = \displaystyle \sum_{k = 1}^{n} \displaystyle \sum_{j = 1}^{n} Y^{(k, j)}(XY)^{(j, k)}}} \\{{}} &{{}} \\{{}} &{{= \displaystyle \sum_{k = 1}^{n}(YXY)^{(k, k)} = \mathrm{Trace} \left(YXY \right) = \langle YXY, I_{n} \rangle_{\cal F}.}} \end{array}\tag{5.4.10}
$$

In Semidefinite Optimization, a nontrivial part of the constraints is formed by the cone of positive semidefinite n n-matrices $\mathbb{S}_{+}^{N} \subset \mathbb{S}^{n}$ . Recall that $X \in \mathbb{S}_{+}^{n}$ if and only if $\langle Xu, u \rangle \geq 0$ for any $u \in \mathbb{R}^{n}$ . If $\langle Xu, u \rangle > 0$ for all nonzero u, we call ${\mathbb S}_{+}^{n}$ is a closed convex set.

The general formulation of the Semidefinite Optimization problem is as follows:

$$
\operatorname{min}_{X \in \mathbb{S}_{+}^{n}} \{\langle C, X \rangle_{F} : \langle A_{i}, X \rangle_{F} = b_{i}, i = 1 \ldots m\},\tag{5.4.11}
$$

where C and all $A_{i}$ belong to $\mathbb{S}^{n}$ . In order to apply a path-following scheme to this problem, we need a self-concordant barrier for the cone $\mathbb{S}_{+}^{n}$

Let the matrix X belong to int ${\mathbb S}_{+}^{n}$ . Define $F(X) = - \ln \operatorname{det} X$ . Clearly

$$
F(X) = - \sum_{i = 1}^{n} \ln \lambda_{i}(X),
$$

where $\{\lambda_{i}(X)\}_{i = 1}^{n}$ is the set of eigenvalues of matrix X.

Lemma 5.4.6 Function F is convex and $\nabla F(X) \ = \ - X^{- 1}$ . Moreover, for any direction $\varDelta \in \mathbb{S}^{n}$ , we have

$$
\begin{array}{l}{{\langle \nabla^{2} F(X) \varDelta, \varDelta \rangle_{F} = \parallel X^{- 1 / 2} \varDelta X^{- 1 / 2} \parallel_{F}^{2} = \langle X^{- 1} \varDelta X^{- 1}, \varDelta \rangle_{F}}} \\{{\mathrm{}}} \\{{= Trace \left([X^{- 1 / 2} \varDelta X^{- 1 / 2}]^{2} \right),}} \end{array}
$$

$$
\begin{array}{c}{{D^{3} F(x)[\varDelta, \varDelta, \varDelta] = - 2 \langle I_{n},[X^{- 1 / 2} \varDelta X^{- 1 / 2}]^{3} \rangle_{F}}} \\{{{}}} \\{{{}}} \\{{= - 2Trace \left([X^{- 1 / 2} \varDelta X^{- 1 / 2}]^{3} \right).}} \end{array}
$$

Proof Let us fix some $\varDelta \in \mathbb{S}^{n}$ and $X \in \operatorname{int} \mathbb{S}_{+}^{n}$ such that $X + \varDelta \in \mathbb{S}_{+}^{n}$ . Then

$$
\begin{array}{rl} &{F(X + \varDelta) - F(X) = - \log \det(X + \varDelta) - \log \det X} \\ &{\qquad = - \ln \det(I_{n} + X^{- 1 / 2} \varDelta X^{- 1 / 2})} \\ &{\qquad \quad \geq - \ln \left[\frac{1}{n} \mathrm{Trace} \left(I_{n} + X^{- 1 / 2} \varDelta X^{- 1 / 2} \right) \right]^{n}} \\ &{\qquad = - n \ln \left[1 + \frac{1}{n} \langle I_{n}, X^{- 1 / 2} \varDelta X^{- 1 / 2} \rangle_{F} \right]} \\ &{\qquad \quad \geq - \langle I_{n}, X^{- 1 / 2} \varDelta X^{- 1 / 2} \rangle_{F} = - \langle X^{- 1}, \varDelta \rangle_{F}.} \end{array}
$$

Thus, $- X^{- 1} \in \partial{\cal F}(X)$ . Therefore, F is convex (Lemma 3.1.6) and $\nabla F(x) = - X^{- 1}$ (Lemma 3.1.7).

Further, consider the function $\phi(\alpha) \equiv \langle \nabla F(X + \alpha \varDelta), \varDelta \rangle_{F}, \alpha \in[0, 1]$ . Then

$$
\begin{array}{rl} &{\phi(\alpha) - \phi(0) = \langle X^{- 1} -(X + \alpha \varDelta)^{- 1}, \varDelta \rangle_{F}} \\ &{} \\ &{\qquad = \langle(X + \alpha \varDelta)^{- 1}[(X + \alpha \varDelta) - X] X^{- 1}, \varDelta \rangle_{F}} \\ &{} \\ &{\qquad = \alpha \langle(X + \alpha \varDelta)^{- 1} \varDelta X^{- 1}, \varDelta \rangle_{F}.} \end{array}
$$

Thus, $\phi^{\prime}(0) = \langle \nabla^{2} F(X) \varDelta, \varDelta \rangle_{F} = \langle X^{- 1} \varDelta X^{- 1}, \varDelta \rangle_{F}$

The last expression can be proved in a similar way by differentiating the function $\psi(\alpha) = \langle(X + \alpha \varDelta)^{- 1} \varDelta(X + \alpha \varDelta)^{- 1}, \varDelta \rangle_{F}$ .

Theorem 5.4.3 The function F is an n-self-concordant barrier for ${\mathbb S}_{+}^{n}$

Proof Let us fix $X \in \mathrm{int} \mathbb{S}_{+}^{n}$ and $\varDelta \ \in \mathbb{S}^{n}$ . Define $Q = X^{- 1 / 2}{\varDelta} X^{- 1 / 2}$ and $\lambda_{i} =$ $\lambda_{i}(Q), i = 1 \ldots n$ . Then, in view of Lemma 5.4.6, we have

$$
\langle \nabla F(X), \varDelta \rangle_{F} = \sum_{i = 1}^{n} \lambda_{i},
$$

$$
\langle \nabla^{2} F(X) \varDelta, \varDelta \rangle_{F} = \sum_{i = 1}^{n} \lambda_{i}^{2},
$$

$$
D^{3} F(X)[\varDelta, \varDelta, \varDelta] = - 2 \sum_{i = 1}^{n} \lambda_{i}^{3}.
$$

Using the two standard inequalities

$$
\left(\sum_{i = 1}^{n} \lambda_{i} \right)^{2} \leq n \sum_{i = 1}^{n} \lambda_{i}^{2}, \quad \left| \sum_{i = 1}^{n} \lambda_{i}^{3} \right| \ \leq \ \left(\sum_{i = 1}^{n} \lambda_{i}^{2} \right)^{3 / 2},
$$

we obtain

$$
\langle \nabla F(X), \varDelta \rangle_{F}^{2} \leq n \langle \nabla^{2} F(X) \varDelta, \varDelta \rangle_{F},
$$

$$
\mid D^{3} F(X)[\varDelta, \varDelta, \varDelta] \mid \leq 2 \langle \nabla^{2} F(X) \varDelta, \varDelta \rangle_{F}^{3 / 2}.
$$

Let us prove that $F(X) = -$ ln det X is the optimal barrier for ${\mathbb S}_{+}^{n}$

Lemma 5.4.7 The parameter ν of any self-concordant barrier for the cone ${\mathbb S}_{+}^{n}$ satisfies the inequality $\nu \geq n$

Proof Let us choose $\bar{X} \ = \I_{n} \ \in \ \mathrm{int} \mathbb{S}_{+}^{n}$ and directions $P_{i} = e_{i} e_{i}^{T}, i = 1...n$ where $e_{i}$ is the ith coordinate vector of $\mathbb{R}^{n}$ . Note that for any $\gamma ~ \geq ~ 0$ we have

$I_{n} + \gamma P_{i} \in$ int $\mathbb{S}_{+}^{n}$ . Moreover,

$$
I_{n} - e_{i} e_{i}^{T} \notin \mathrm{int} \mathbb{S}_{+}^{n}, \quad I_{n} - \sum_{i = 1}^{n} e_{i} e_{i}^{T} = 0 \in \mathbb{S}_{+}^{n}.
$$

Therefore conditions of Theorem 5.4.1 are satisfied with $\alpha_{i} = \beta_{i} = 1, i = 1 \ldots n$ and we obtain $\nu \geq \sum_{i = 1}^{n} \frac{\alpha_{i}}{\beta_{i}} = n$ .

As in Linear Optimization problem (5.4.2), in problem (5.4.11) we need to use the restriction of $F$ onto the affine subspace

$$
{\mathcal{L}} = \{X : \langle A_{i}, X \rangle_{F} = b_{i}, i = 1 \ldots m\}.
$$

This restriction is an n-self-concordant barrier in view of Theorem 5.3.3. Thus, the complexity bound of the problem (5.4.11) is $O \left({\sqrt{n}} \cdot \ln{\frac{n}{\epsilon}} \right)$ iterations of a pathfollowing scheme. Note that this estimate is very encouraging since the dimension of the problem (5.4.11) is $\textstyle{\frac{1}{2}} n(n + 1)$ .

Let us estimate the arithmetical cost of each iteration of a path-following scheme (5.3.29) as applied to the problem (5.4.11). Note that we work with a restriction of the barrier F to the set $\mathcal{L}$ . In view of Lemma 5.4.6, each Newton step consists in solving the following problem:

$$
\begin{array}{r}{\underset{\Delta}{\operatorname{min}} \{\langle U, \Delta \rangle_{F} + \frac{1}{2} \langle X^{- 1} \Delta X^{- 1}, \Delta \rangle_{F} : \langle A_{i}, \Delta \rangle_{F} = 0, \i = 1 \dots m\},} \end{array}
$$

where $X ~ \succ ~ 0$ belongs to $\mathcal{L}$ and U is a combination of the cost matrix C and the gradient $\nabla F(X)$ . In accordance with the statement (3.1.59), the solution of this problem can be found from the following system of linear equations:

$$
\begin{array}{c}{{U + X^{- 1} \varDelta X^{- 1} = \displaystyle \sum_{j = 1}^{m} \lambda^{(j)} A_{j},}} \\{{}} \\{{\langle A_{i}, \varDelta \rangle_{F} = 0, \quad i = 1 \dots m.}} \end{array}\tag{5.4.12}
$$

From the first equation in (5.4.12) we get

$$
\Delta = X \left[- U + \sum_{j = 1}^{m} \lambda^{(j)} A_{j} \right] X.\tag{5.4.13}
$$

Substituting this expression into the second equation in (5.4.12), we get the linear system

$$
\sum_{j = 1}^{m} \lambda^{(j)} \langle A_{i}, XA_{j} X \rangle_{F} = \langle A_{i}, XUX \rangle_{F}, \quad i = 1 \dots m,\tag{5.4.14}
$$

which can be written in matrix form as $S \lambda = d$ with

$$
{\cal S}^{(i, j)} = \langle A_{i}, XA_{j} X \rangle_{\cal F}, \quad d^{(j)} = \langle U, XA_{j} X \rangle_{\cal F}, \quad i, j = 1 \dots n.
$$

Thus, a straightforward strategy of solving system (5.4.12) consists in the following steps.

- Compute the matrices $XA_{j} X, j = 1 \dots m$ . Cost: $O(mn^{3})$ operations.

- Compute the elements of $s$ and d. Cost: $O(m^{2} n^{2})$ operations.

- Compute $\lambda = S^{- 1} d.$ . Cost: $O(m^{3})$ operations.

- Compute $\varDelta$ by (5.4.13). Cost: $O(mn^{2})$ operations.

Taking into account that $m \ \leq \{\frac{n(n + 1)}{2}}$ we conclude that the complexity of one Newton step does not exceed

$$
O(n^{2}(m + n) m){\mathrm{~ arithmetic ~ operations.}}\tag{5.4.15}
$$

However, if the matrices $A_{j}$ possess a certain structure, then this estimate can be significantly improved. For example, if all $A_{j}$ are of rank 1:

$$
A_{j} = a_{j} a_{j}^{T}, \quad a_{j} \in \mathbb{R}^{n}, \quad j = 1 \dots m,
$$

then the computation of the Newton step can be done in

$$
O((m + n)^{3}) \mathrm{arithmeticoperations}.\tag{5.4.16}
$$

We leave the justification of this claim as an exercise for the reader.

To conclude this section, note that in many important applications we can use the barrier ln det( ) to treat some functions of eigenvalues. Consider, for example, a matrix $\mathcal A(x) \in \mathbb S^{n}$ which depends linearly on x. Then the convex region

$$
\{(x, t) \mid \operatorname{max}_{1 \leq i \leq n} \lambda_{i}(\mathcal{A}(x)) \leq t\}
$$

can be described by a self-concordant barrier

$$
\begin{array}{r}{F(x, t) = - \ln \operatorname{det}(tI_{n} - \mathcal{A}(x)).} \end{array}
$$

The value of the parameter of this barrier is equal to $n$

## 5.4.5 Extremal Ellipsoids

In some applications, we are interested in approximating different sets by ellipsoids.   
Let us consider the most important examples.

## 5.4.5.1 Circumscribed Ellipsoid

Given a set of points $a_{1}, \dots, a_{m} \in \mathbb{R}^{n}$ , find an ellipsoid W with the minimal volume which contains all points $\left\{a_{i} \right\}$

Let us pose this problem in a formal way. First of all, note that any bounded ellipsoid $W \subset \mathbb{R}^{n}$ can be represented as

$$
W = \{x \in \mathbb{R}^{n} \mid x = H^{- 1}(v + u), \parallel u \parallel \leq 1\},
$$

where $H \in \operatorname{int} \mathbb{S}_{+}^{n}, v \in \mathbb{R}^{n}$ , and the norm is standard Euclidean. Then the inclusion $a \in W$ is equivalent to the inequality $Ha - v \parallel \leq 1$ . Note also that

$$
\begin{array}{r}{\operatorname{vol}_{n} W = \operatorname{vol}_{n} B_{2}(0, 1) \cdot \operatorname{det} H^{- 1} = \frac{\operatorname{vol}_{n} B_{2}(0, 1)}{\operatorname{det} H}.} \end{array}
$$

Thus, our problem is as follows:

$$
\operatorname{min}_{\stackrel{H \in \mathbb{S}_{+}^{n},}{\tau \in \mathbb{R}^{n}}} \{\tau : - \ln \operatorname{det} H \leq \tau, \parallel Ha_{i} - v \parallel \leq 1, i = 1 \ldots m\}.\tag{5.4.17}
$$

In order to solve this problem by an interior-point scheme, we need to find a selfconcordant barrier for the feasible set. In view of Theorems 5.4.3 and 5.3.5, we know self-concordant barriers for all components. Indeed, we can use the following barrier:

$$
F(H, v, \tau) = - \ln \operatorname{det} H - \ln(\tau + \ln \operatorname{det} H) - \sum_{i = 1}^{m} \ln(1 - \parallel Ha_{i} - v \parallel^{2}),
$$

$$
\nu = m + n + 1.
$$

The corresponding complexity bound is $O \left({\sqrt{m + n + 1}} \cdot \ln{\frac{m + n}{\epsilon}} \right)$ iterations of a path-following scheme.

## 5.4.5.2 Inscribed Ellipsoid with Fixed Center

Let $Q$ be a convex polytope defined by a set of linear inequalities:

$$
Q = \{x \in \mathbb{R}^{n} \mid \langle a_{i}, x \rangle \leq b_{i}, i = 1 \ldots m\},
$$

and let $v \in$ int $Q.$ . Find an ellipsoid $W \subset Q$ with the biggest volume which is centered at v.

Let us fix some $H \in$ int <sup>Sn</sup> . We can represent the ellipsoid W as

$$
W = \{x \in \mathbb{R}^{n} \mid \langle H^{- 1}(x - v), x - v \rangle \leq 1\}.
$$

We need the following simple result.

Lemma 5.4.8 Let $\langle a, v \rangle < b.$ . The inequality $\langle a, x \rangle \leq b$ is valid for all $x \in W$ if and only if

$$
\langle Ha, a \rangle \leq(b - \langle a, v \rangle)^{2}.
$$

Proof In view of Lemma 3.1.20, we have

$$
\operatorname{max}_{u} \{\langle a, u \rangle \mid \langle H^{- 1} u, u \rangle \leq 1\} = \langle Ha, a \rangle^{1 / 2}.
$$

Therefore, we need to ensure

$$
\begin{array}{l}{\displaystyle \operatorname{max}_{x \in W} \langle a, x \rangle = \displaystyle \operatorname{max}_{x \in W}[\langle a, x - v \rangle + \langle a, v \rangle]} \\{\displaystyle} \\{\displaystyle = \langle a, v \rangle + \displaystyle \operatorname{max}_{x} \{\langle a, u \rangle \mid \langle H^{- 1} u, u \rangle \le 1\}} \\{\displaystyle} \\{\displaystyle = \langle a, v \rangle + \langle Ha, a \rangle^{1 / 2} \le b.} \end{array}
$$

This proves our statement since $\langle a, v \rangle < b$ □

Note that $\mathrm{vol}_{n}{\cal W} = \mathrm{vol}_{n} B_{2}(0, 1)[\operatorname{det} H]^{1 / 2}$ . Hence, our problem is as follows:

$$
\operatorname{min}_{H \in \mathbb{S}_{+}^{n}, \tau \in \mathbb{R}} \{\tau : - \ln \operatorname{det} H \leq \tau, \ \langle Ha_{i}, a_{i} \rangle \leq(b_{i} - \langle a_{i}, v \rangle)^{2}, \i = 1 \dots m\}.\tag{5.4.18}
$$

In view of Theorems 5.4.3 and 5.3.5, we can use the following self-concordant barrier:

$$
F(H, \tau) = - \ln \operatorname{det} H - \ln(\tau + \ln \operatorname{det} H) - \sum_{i = 1}^{m} \ln[(b_{i} - \langle a_{i}, v \rangle)^{2} - \langle Ha_{i}, a_{i} \rangle],
$$

with barrier parameter $\nu = m + n + 1$ . The complexity bound of the corresponding path-following scheme is

$$
O \left({\sqrt{m + n + 1}} \cdot \ln{\frac{m + n}{\epsilon}} \right)
$$

iterations.

## 5.4.5.3 Inscribed Ellipsoid with Free Center

Let Q be a convex polytope defined by a set of linear inequalities:

$$
Q = \{x \in \mathbb{R}^{n} \mid \langle a_{i}, x \rangle \leq b_{i}, i = 1 \ldots m\},
$$

and let int $Q \neq \emptyset$ . Find an ellipsoid W with the biggest volume which is contained in $Q$

Let $G \in$ int $\mathbb{S}_{+}^{n}$ and $v \in$ int $Q$ . We can represent W as follows:

$$
\begin{array}{rl} &{W = \{x \in \mathbb{R}^{n} \mid \| G^{- 1}(x - v) \| \leq 1\}} \\ &{} \\ &{\equiv \{x \in \mathbb{R}^{n} \mid \langle G^{- 2}(x - v), x - v \rangle \leq 1\}.} \end{array}
$$

In view of Lemma 5.4.8, inequality $\langle a, x \rangle \leq b$ is valid for any $x \in W$ if and only if

$$
\Vert Ga \Vert^{2} \equiv \langle G^{2} a, a \rangle \ \leq \(b - \langle a, v \rangle)^{2}.
$$

This gives us a convex feasible set for parameters $(G, v)$

$$
\| \Ga \ \| \leq b - \langle a, v \rangle.
$$

Note that vol<sub>n</sub> $W ={\mathrm{vol}}_{n} B_{2}(0, 1)$ det G. Therefore, our problem can be written as follows:

$$
\operatorname{min}_{\stackrel{G \in \mathbb{S}_{+}^{n}, \tau}{v \in \mathbb{R}^{n}, \tau \in \mathbb{R}}} \{\tau : - \ln \operatorname{det} G \leq \tau, \parallel Ga_{i} \parallel \leq b_{i} - \langle a_{i}, v \rangle, \i = 1 \ldots m\}.\tag{5.4.19}
$$

In view of Theorems 5.4.3, 5.3.5 and Lemma 5.4.4, we can use the following self-concordant barrier:

$$
F(G, v, \tau) = - \ln \operatorname{det} G - \ln(\tau + \ln \operatorname{det} G) - \sum_{i = 1}^{m} \ln[(b_{i} - \langle a_{i}, v \rangle)^{2} - \parallel Ga_{i} \parallel^{2}]
$$

with barrier parameter $\nu = 2m + n + 1$ . The corresponding efficiency estimate is $O \left({\sqrt{2m + n + 1}} \cdot \ln{\frac{m + n}{\epsilon}} \right)$ iterations of a path-following scheme.

## 5.4.6 Constructing Self-concordant Barriers for Convex Sets

In this section we develop a general framework for constructing self-concordant barriers for convex cones. First of all, let us define the objects we are working with. They are related to three different real vector spaces, $\mathbb{E}_{1}, \mathbb{E}_{2}$ , and $\mathbb{E}_{3}$

Consider a function $\xi(\cdot) : \mathbb{E}_{1} \to \mathbb{E}_{2}$ defined on a closed convex set $Q_{1} \subset \mathbb{E}_{1}$ Assume that $\xi$ is three times continuously differentiable and concave with respect to a closed convex cone $K \subset E_{2}$

$$
- D^{2} \xi(x)[h, h] \in K \forall x \in \mathrm{int} Q_{1}, h \in \mathbb{E}_{1}.\tag{5.4.20}
$$

It is convenient to write this inclusion as $D^{2} \xi(x)[h, h] \preceq_{K} 0.$

Definition 5.4.2 Let $F(\cdot)$ be a ν-self-concordant barrier for $Q_{1}$ and $\beta \geq 1$ . We say that a function $\xi$ is $\beta \mathrm{.}$ -compatible with $F$ if for all $x \in \operatorname{int} Q_{1}$ and $h \in{\mathbb{E}}_{1}$ we have

$$
D^{3} \xi(x)[h, h, h] \preceq_{K} - 3 \beta \cdot D^{2} \xi(x)[h, h] \cdot \langle \nabla^{2} F(x) h, h \rangle^{1 / 2}.\tag{5.4.21}
$$

Alternating the sign of direction h in (5.4.21), we get the following equivalent condition:

$$
- D^{3} \xi(x)[h, h, h] \preceq_{K} - 3 \beta \cdot D^{2} \xi(x)[h, h] \cdot \langle \nabla^{2} F(x) h, h \rangle^{1 / 2}.\tag{5.4.22}
$$

Note that the set of $\beta \mathrm{- compatible}$ functions is a convex cone: if functions $\xi_{1}$ and $\xi_{2}$ are β-compatible with barrier $F$ , then the sum $\alpha_{1} \xi_{1} + \alpha_{2} \xi_{2}$ , with arbitrary $\alpha_{1}, \alpha_{2} > 0$ , is also β-compatible with $F$

Let us construct a self-concordant barrier for a composition of the set

$$
\mathcal{S}_{1} = \{(x, y) \in Q_{1} \times \mathbb{E}_{2} : \xi(x) \succeq_{K} y\}
$$

and a convex set $Q_{2} \subset \mathbb{E}_{2} \times \mathbb{E}_{3}$ . That is

$$
\mathcal{Q} = \{(x, z) \in Q_{1} \times \mathbb{E}_{3} : \ \exists y, \ \xi(x) \succeq_{K} \y, \(y, z) \in Q_{2}\}.
$$

The necessity of such a structure is clear from the following example.

Example 5.4.1 Let us fix some $\alpha \in(0, 1)$ . Consider the following power cone

$$
\begin{array}{r}{K_{\alpha} = \left\{({\boldsymbol x}^{(1)},{\boldsymbol x}^{(2)},{\boldsymbol z}) \in \mathbb{R}_{+}^{2} \times \mathbb{R} :({\boldsymbol x}^{(1)})^{\alpha} \cdot({\boldsymbol x}^{(2)})^{1 - \alpha} \geq |{\boldsymbol z} | \right\}.} \end{array}
$$

For our representation, we need the following objects:

$$
\begin{array}{r}{\mathbb{E}_{1} = \mathbb{R}^{2}, \quad Q_{1} = \mathbb{R}_{+}^{2}, \quad F(x) = - \ln x^{(1)} - \ln x^{(2)}, \quad \nu = 2,} \end{array}
$$

$$
\begin{array}{r}{\mathbb{E}_{2} = \mathbb{R}, \quad \xi(x) =(x^{(1)})^{\alpha} \cdot(x^{(2)})^{1 - \alpha}, \quad K = \mathbb{R}_{+} \subset \mathbb{E}_{2},} \end{array}
$$

$$
\begin{array}{r}{\mathbb{E}_{3} = \mathbb{R}, \quad Q_{2} = \{(y, z) \in \mathbb{E}_{2} \times \mathbb{E}_{3} : \y \geq | z |\}.} \end{array}
$$

In our construction, we also need a μ-self-concordant barrier $\boldsymbol{\varPhi}(y, z)$ for the set $Q_{2}$ . We assume that all directions from the cone $K_{0} \{\stackrel{\mathrm{def}}{=}} \K \times \{0\} \subset \mathbb{E}_{2} \times \mathbb{E}_{3}$ are recession directions of the set $Q_{2}$ . Consequently, for any $s \in K$ and $(y, z) \in \mathrm{int} Q_{2}$ we have

$$
\langle \nabla_{y} \phi(y, z), s \rangle = \langle \nabla \phi(y, z),(s, 0) \rangle \overset{(5.3.13)}{\leq} 0.\tag{5.4.23}
$$

Consider the barrier

$$
\varPsi(x, z) = \varPhi(\xi(x), z) + \beta^{3} F(x).
$$

Let us fix a point $(x, z) \in$ int $\mathcal{Q}$ and choose an arbitrary direction $d =(h, v) \in$ $E_{1} \times E_{3}$ . Define

$$
\begin{array}{r}{\xi^{\prime} = D \xi(x)[h], \quad \xi^{\prime \prime} = D^{2} \xi(x)[h, h], \quad \xi^{\prime \prime \prime} = D^{3} \xi(x)[h, h, h], \quad l =(\xi^{\prime}, v).} \end{array}
$$

Let $\psi(x, z) = \phi(\xi(x), z)$ . Consider the following directional derivatives:

$$
\begin{array}{r}{\varDelta_{1} \overset{\mathrm{def}}{=} D \psi(x, z)[d] = \langle \nabla_{y} \phi(\xi(x), z), \xi^{\prime} \rangle + \langle \nabla_{z} \phi(\xi(x), z), v \rangle = \langle \nabla \phi(\xi(x), z), l \rangle.} \end{array}
$$

Note that $l \equiv l(x)$ . Therefore $l^{\prime} \stackrel{\mathrm{def}}{=} Dl(x)[d] =(\xi^{\prime \prime}, 0) \stackrel{(5.4.20)}{\in} - K_{0}$ . Thus, we can continue:

$$
\begin{array}{rl} &{\lambda_{2} \overset{\mathrm{def}}{=} D^{2} \psi(x, z)[d, d] = \langle \nabla^{2} \phi(\xi(x), z) l, l \rangle + \langle \nabla \phi(\xi(x), z), l^{\prime} \rangle} \\ &{} \\ &{\quad = \langle \nabla^{2} \phi(\xi(x), z) l, l \rangle + \langle \nabla_{y} \phi(\xi(x), z), \xi^{\prime \prime} \rangle \overset{\mathrm{def}}{=} \sigma_{1} + \sigma_{2}.} \end{array}\tag{5.4.24}
$$

Since $- l^{\prime}$ is a recession direction of $Q_{2}$ , by (5.3.13) we have $\sigma_{2} \geq 0$ . Finally,

$$
\begin{array}{rl} &{A_{3} \stackrel{\mathrm{def}}{=} D^{3} \psi(x, z)[d, d, d]} \\ &{\quad \quad = D^{3} \phi(\xi(x), z)[l, l, l] + 3 \langle \nabla^{2} \phi(\xi(x), z) l, l^{\prime} \rangle + \langle \nabla_{y} \phi(\xi(x), z), \xi^{\prime \prime \prime} \rangle.} \end{array}\tag{5.4.25}
$$

Again, since $- l^{\prime}$ is a recession direction of $Q_{2}$

$$
\begin{array}{rlr}{\langle \nabla^{2} \phi(\xi(x), z) l, l^{\prime} \rangle} &{{} \le} &{\langle \nabla^{2} \phi(\xi(x), z) l, l \rangle^{1 / 2} \cdot \langle \nabla^{2} \phi(\xi(x), z) l^{\prime}, l^{\prime} \rangle^{1 / 2}} \end{array}
$$

$$
\stackrel{(5.3.13)}{\leq} \langle \nabla^{2} \Phi(\xi(x), z) l, l \rangle^{1 / 2} \cdot \langle - \nabla \Phi(\xi(x), z), - l^{\prime} \rangle = \sigma_{1}^{1 / 2} \sigma_{2}.
$$

Further, let $\sigma_{3} = \langle \nabla^{2} F(\boldsymbol{x}) h, h \rangle$ . Since $\xi$ is $\beta \mathrm{.}$ -compatible with F (see (5.4.22)), we have

$$
\begin{array}{rl} &{\langle - \nabla_{y} \Phi(\xi(x), z), - \xi^{\prime \prime \prime} \rangle \overset{(5.4.23)}{\leq} 3 \beta \langle - \nabla_{y} \Phi(\xi(x), z), - \xi^{\prime \prime} \rangle \cdot \sigma_{3}^{1 / 2} = 3 \beta \cdot \sigma_{2} \cdot \sigma_{3}^{1 / 2}.} \end{array}
$$

Thus, substituting these inequalities into (5.4.25) and using (5.1.4), we obtain

$$
\begin{array}{r}{\varDelta_{3} \leq 2 \sigma_{1}^{3 / 2} + 3 \sigma_{1}^{1 / 2} \sigma_{2} + 3 \beta \cdot \sigma_{2} \cdot \sigma_{3}^{1 / 2}.} \end{array}
$$

Consider now $D_{k}, k = 1 \ldots 3$ , the directional derivatives of the function $\psi$ . Note that

$$
D_{2} = A_{2} + \beta^{3} \sigma_{3} ~ = ~ \sigma_{1} + \sigma_{2} + \beta^{3} \sigma_{3} ~ \geq ~ \sigma_{1} + \sigma_{2} + \beta^{2} \sigma_{3}.\tag{5.4.26}
$$

Therefore,

$$
\begin{array}{rcl}{{D_{3}}} &{{=}} &{{A_{3} + \beta^{3} D^{3} F(x)[h, h, h] \stackrel{(5.1.4)}{\leq} \Delta_{3} + 2 \beta^{3} \sigma_{3}^{3 / 2}}} \\{{}} &{{}} &{{}} \\{{}} &{{\leq}} &{{2 \sigma_{1}^{3 / 2} + 3 \sigma_{1}^{1 / 2} \sigma_{2} + 3 \beta \cdot \sigma_{2} \cdot \sigma_{3}^{1 / 2} + 2 \beta^{3} \sigma_{3}^{3 / 2}}} \\{{}} &{{}} &{{}} \\{{}} &{{=}} &{{(\sigma_{1}^{1 / 2} + \beta \sigma_{3}^{1 / 2})(2 \sigma_{1} - 2 \beta \sigma_{1}^{1 / 2} \sigma_{3}^{1 / 2} + 2 \beta^{2} \sigma_{3} + 3 \sigma_{2})}} \end{array}
$$

$$
\stackrel{(5.4.26)}{\leq}(\sigma_{1}^{1 / 2} + \beta \sigma_{3}^{1 / 2})(3D_{2} -(\sigma_{1}^{1 / 2} + \beta \sigma_{3}^{1 / 2})^{2}) \leq 2D_{2}^{3 / 2}.
$$

Thus, we come to the following statement.

Theorem 5.4.4 Let the function $\xi(\cdot) : E_{1} \to E_{2}$ satisfy the following conditions.

- It is concave with respect to a convex cone $K \subset E_{2}$

- It is β-compatible with self-concordant barrier F ( ) for a set $Q \subseteq dom \xi$

Assume in addition that $\boldsymbol \phi(\cdot, \cdot)$ is a μ-self-concordant barrier for a closed convex set $Q_{2} \subset E_{2} \times E_{3}$ , and the cone $K \times \{0\} \subset E_{2} \times E_{3}$ contains only the recession directions of the set $Q_{2}$ . Then the function

$$
\varPsi(x, z) = \varPhi(\xi(x), z) + \beta^{3} F(x)\tag{5.4.27}
$$

is a self-concordant barrier for the set $\{(x, z) \in Q \times \mathbb{E}_{3} : \ \exists y, \ \xi(x) \succeq_{K} \y, \(y, z) \in$ $Q_{2}\}$ with barrier parameter $\hat{\nu} = \mu + \beta^{3} \nu$

Proof We need to justify only the value of the barrier parameter ${ \hat { \mathbf { \rho } } } _ { \hat { \mathbf { \rho } } } { } $ . Indeed,

$$
\begin{array}{rl} &{D_{1} = \langle \nabla \phi(\xi(x), z), l \rangle + \beta^{3} \langle \nabla F(x), h \rangle \ \leq \ \sqrt{\nu} \cdot \sigma_{1}^{1 / 2} + \beta^{3} \sqrt{\mu} \cdot \sigma_{3}^{1 / 2}} \\ &{\quad \quad \leq \displaystyle \operatorname{max}_{\sigma_{1}, \sigma_{3} \geq 0} \{\sqrt{\nu} \cdot \sigma_{1}^{1 / 2} + \beta^{3} \cdot \sqrt{\mu} \sigma_{3}^{1 / 2} \colon \sigma_{1} + \beta^{3} \sigma_{3} \stackrel{(5.4.26)}{\ \leq\} D_{2}\}} \\ &{\quad \quad = \sqrt{\hat{\nu}} \cdot D_{2}^{1 / 2}.} \end{array}
$$

It remains to use definition (5.3.6).

Note that in construction (5.4.27) the function $\xi$ must be compatible only with the barrier $F.$ . The function $\phi$ can be an arbitrary self-concordant barrier for the set $Q_{2}$

## 5.4.7 Examples of Self-concordant Barriers

Despite its complicated formulation, Theorem 5.4.4 is very convenient for constructing a good self-concordant barrier for convex cones. Let us confirm this claim with several examples.

1. The power cone and epigraph of the p-norm. Let us fix some $\alpha \in(0, 1)$ . To the description of the representation of the power cone

$$
K_{\alpha} = \left\{(x^{(1)}, x^{(2)}, z) \in R_{+}^{2} \times R :(x^{(1)})^{\alpha} \cdot(x^{(2)})^{1 - \alpha} \geq | z | \right\},
$$

given in Example 5.4.1, we need to add only a definition of the barrier function for the set $Q_{2}$ . In view of Lemma 5.4.4, we can take

$$
\phi(y, z) = - \ln(y^{2} - z^{2}),
$$

with barrier parameter $\mu = 2$ . Thus, all conditions of Theorem 5.4.4 are clearly satisfied except β-compatibility.

Let us prove that the function $\xi(x) =(x^{(1)})^{\alpha} \cdot(x^{(2)})^{1 - \alpha}$ is β-comptible with barrier $\bar{F(x)} = - \ln x^{(1)} - \ln x^{(2)}$ . Let us choose a direction $h \in \mathbb{R}^{2}$ and $x \in \operatorname{int} \mathbb{R}_{+}^{2}$

Define

$$
\begin{array}{r}{\delta_{1} = \frac{h^{(1)}}{x^{(1)}}, \quad \delta_{2} = \frac{h^{(2)}}{x^{(2)}}, \quad \sigma = \delta_{1}^{2} + \delta_{2}^{2}.} \end{array}
$$

Let us compute the directional derivatives:

$$
\begin{array}{r}{D \xi(x)[h] = \left[\frac{\alpha h^{(1)}}{x^{(1)}} + \frac{(1 - \alpha) h^{(2)}}{x^{(2)}} \right] \cdot \xi(x) =[\alpha \delta_{1} +(1 - \alpha) \delta_{2}] \cdot \xi(x),} \end{array}
$$

$$
\begin{array}{rcl}{{}} &{{}} &{{D^{2} \xi(x)[h, h] = -[\alpha \delta_{1}^{2} +(1 - \alpha) \delta_{2}^{2}] \cdot \xi(x) +[\alpha \delta_{1} +(1 - \alpha) \delta_{2}] \cdot D \xi(x)[h]}} \\{{}} &{{}} &{{}} \\{{}} &{{}} &{{= - \alpha(1 - \alpha)(\delta_{1} - \delta_{2})^{2} \cdot \xi(x),}} \end{array}
$$

$$
\begin{array}{rl} &{D^{3} \xi(x)[h, h, h] = 2 \alpha(1 - \alpha)(\delta_{1} - \delta_{2}) \cdot(\delta_{1}^{2} - \delta_{2}^{2}) \cdot \xi(x)} \\ &{\qquad - \alpha(1 - \alpha)(\delta_{1} - \delta_{2})^{2} \cdot D \xi(x)[h]} \\ &{\qquad = \xi(x) \cdot \alpha(1 - \alpha)(\delta_{1} - \delta_{2})^{2} \cdot[2 \delta_{1} + 2 \delta_{2} - \alpha \delta_{1} -(1 - \alpha) \delta_{2}]} \\ &{\qquad = - D^{2} \xi(x)[h, h] \cdot[(2 - \alpha) \delta_{1} +(1 + \alpha) \delta_{2}].} \end{array}
$$

Since $(2 - \alpha) \delta_{1} +(1 + \alpha) \delta_{2} \leq[(2 - \alpha)^{2} +(1 + \alpha)^{2}]^{1 / 2} \sigma^{1 / 2} < 3 \sigma^{1 / 2}$ , we conclude that $\xi$ is 1-compatible with F . Therefore, in view of Theorem 5.4.4, function

$$
\psi_{P}(x, z) = - \ln \left((x^{(1)})^{2 \alpha} \cdot(x^{(2)})^{2(1 - \alpha)} - z^{2} \right) - \ln x^{(1)} - \ln x^{(2)}\tag{5.4.28}
$$

is a 4-self-concordant barrier for cone $K_{\alpha}$

A similar structure can be used to construct a self-concordant barrier for the cone

$$
\begin{array}{r}{K_{\alpha}^{+} = \left\{(x^{(1)}, x^{(2)}, z) \in \mathbb{R}_{+}^{2} \times \mathbb{R} :(x^{(1)})^{\alpha} \cdot(x^{(2)})^{1 - \alpha} \geq z \right\}.} \end{array}
$$

In this case, we can choose $\phi(y, z) = \ln(y - z)$ with parameter $\mu = 1$ . Thus, by Theorem 5.4.4, we get the following 3-self-concordant barrier:

$$
\psi_{P}^{+}(x, z) = - \ln \left((x^{(1)})^{\alpha} \cdot(x^{(2)})^{(1 - \alpha)} - z \right) - \ln x^{(1)} - \ln x^{(2)}.\tag{5.4.29}
$$

Let us show that this barrier has the best possible value of parameter.

Lemma 5.4.9 Any ν-self-concordant barrier for the cone $K_{\alpha}^{+}$ has $\nu \geq 3$

Proof Note that the cone $K_{\alpha}^{+}$ has three recession directions:

$$
p_{1} =(1, 0, 0)^{T}, \quad p_{2} =(0, 1, 0)^{T}, \quad p_{3} =(0, 0, - 1)^{T}.
$$

Let us choose a parameter $\tau > 0$ and define $\bar{x} =(1, 1, - \tau)^{T}$ . Note that

$$
\bar{x} - p_{1} \notin \mathrm{int} K_{\alpha}^{+}, \quad \bar{x} - p_{2} \notin \mathrm{int} K_{\alpha}^{+}, \quad \bar{x} -(1 + \tau) p_{3} \in \partial K_{\alpha}^{+}.
$$

On the other hand, $\bar{x} - p_{1} - p_{2} - \tau p_{3} = 0 \in K_{\alpha}^{+}$ . Thus, to apply Theorem 5.4.1, we can choose

$$
\alpha_{1} = \alpha_{2} = 1, \alpha_{3} = \tau, \beta_{1} = \beta_{2} = 1, \beta_{3} = 1 + \tau.
$$

Hence, $\textstyle \nu \geq \sum_{i = 1}^{3}{\frac{\alpha_{i}}{\beta_{i}}} = 2 +{\frac{\tau}{1 + \tau}}$ . It remains to compute the limit as $\tau \to + \infty$ .

Note that the barrier $\psi_{P}(x, z)$ can be used to construct 4n-self-concordant barrier for the epigraph of an $\ell_{p}{\mathrm{- norm}}$ in $\mathbb{R}^{n}$ :

$$
\begin{array}{r}{\mathcal{H}_{p} = \left\{(\tau, z) \in \mathbb{R} \times \mathbb{R}^{n} : \tau \geq \| z \|_{(p)} \right\}, \quad 1 \leq p \leq \infty,} \end{array}
$$

where $\| z \|_{(p)} = \left[\sum_{i = 1}^{n} | z^{(i)} |^{p} \right]^{1 / p}$ . Let us assume that $\alpha \{\stackrel{\mathrm{def}}{=}} \{\frac{1}{p}} \in \left(0, 1 \right)$ . Then, it is easy to prove that the point $(\tau, z)$ belongs to $\mathcal{H}_{p}$ if and only if there exists an $x \in \mathbb{R}_{+}^{n}$ satisfying the conditions

$$
\begin{array}{c}{(x^{(i)})^{\alpha} \cdot \tau^{1 - \alpha} \geq | z^{(i)} |, \quad i = 1, \dots, n,} \\{\} \\{\displaystyle \sum_{i = 1}^{n} x^{(i)} = \tau.} \end{array}\tag{5.4.30}
$$

Thus, a self-concordant barrier for the cone $\mathcal{H}_{p}$ can be implemented by restricting the (4n)-self-concordant barrier

$$
\psi_{\alpha}(\tau, x, z) = - \sum_{i = 1}^{n} \left[\ln \left((x^{(i)})^{2 \alpha} \cdot \tau^{2(1 - \alpha)} -(z^{(i)})^{2} \right) + \ln x^{(i)} + \ln \tau \right]\tag{5.4.31}
$$

onto the hyperplane $\sum_{i = 1}^{n} x^{(i)} = \tau$

2. The conic hull of the epigraph of the entropy function. We need to describe the conic hull of the following set:

$$
\left\{(x^{(1)}, z) : \z \geq x^{(1)} \ln x^{(1)}, \x^{(1)} > 0 \right\}.
$$

Introducing a projective variable $x^{(2)} > 0$ , we obtain the cone

$$
\begin{array}{r}{{\mathcal{Q}} = \left\{({\boldsymbol x}^{(1)},{\boldsymbol x}^{(2)},{\boldsymbol z}) : \z \geq{\boldsymbol x}^{(1)} \cdot[\ln{\boldsymbol x}^{(1)} - \ln{\boldsymbol x}^{(2)} \], \x^{(1)},{\boldsymbol x}^{(2)} > 0 \right\}.} \end{array}\tag{5.4.32}
$$

Let us represent it in the format of Theorem 5.4.4:

$$
\begin{array}{r}{\mathbb{E}_{1} = \mathbb{R}^{2}, \quad Q_{1} = R_{+}^{2}, \quad F(x) = - \ln x^{(1)} - \ln x^{(2)}, \quad \nu = 2,} \end{array}
$$

$$
\begin{array}{r}{\mathbb{E}_{2} = \mathbb{R}, \quad \xi(x) = - x^{(1)} \cdot[\ln x^{(1)} - \ln x^{(2)}], \quad K = \mathbb{R}_{+},} \end{array}
$$

$$
\begin{array}{r}{{\mathbb E}_{3} ={\mathbb R}, \quad Q_{2} = \{(y, z) : ~ y + z \geq 0\}, \quad \varPhi(y, z) = - \ln(y + z), \quad \mu = 1.} \end{array}
$$

Let us show that $\xi$ is 1-compatible with F . We use the notation of the previous example.

$$
D \xi(x)[h] = \delta_{1} \cdot \xi(x) - x^{(1)} \cdot[\delta_{1} - \delta_{2}].
$$

$$
\begin{array}{l}{{D^{2} \xi(x)[h, h] = - \delta_{1}^{2} \cdot \xi(x) + \delta_{1} \cdot D \xi(x)[h] - h^{(1)} \cdot[\delta_{1} - \delta_{2}] + x^{(1)} \cdot[\delta_{1}^{2} - \delta_{2}^{2}]}} \\{{\}} \\{{\qquad = x^{(1)} \cdot[- 2 \delta_{1}(\delta_{1} - \delta_{2}) + \delta_{1}^{2} - \delta_{2}^{2}] = - x^{(1)} \cdot(\delta_{1} - \delta_{2})^{2}.}} \end{array}
$$

$$
\begin{array}{l}{{D^{3} \xi(x)[h, h, h] = - h^{(1)} \cdot(\delta_{1} - \delta_{2})^{2} + 2x^{(1)} \cdot(\delta_{1} - \delta_{2}) \cdot(\delta_{1}^{2} - \delta_{2}^{2})}} \\{{\ \qquad = x^{(1)}(\delta_{1} - \delta_{2})^{2} \cdot[- \delta_{1} + 2(\delta_{1} + \delta_{2})]}} \\{{\ \qquad = - D^{2} \xi(x)[h, h] \cdot[\delta_{1} + 2 \delta_{2}].}} \end{array}
$$

Since $\delta_{1} + 2 \delta_{2} \leq \sqrt{5} \cdot \sigma^{1 / 2} < 3 \sigma^{1 / 2}$ , we conclude that $\xi$ is 1-compatible with $F.$ Therefore, in view of Theorem 5.4.4 the function

$$
\begin{array}{r}{\psi_{E}(x, z) = - \ln \left(z - x^{(1)} \cdot \ln \frac{x^{(1)}}{x^{(2)}} \right) - \ln x^{(1)} - \ln x^{(2)}} \end{array}\tag{5.4.33}
$$

is a 3-self-concordant barrier for the cone $\mathcal{Q}$ . It is interesting that the same barrier can also describe the epigraph of logarithmic and exponent functions. Indeed,

$$
\mathcal{Q} \bigcap \{x : x^{(1)} = 1\} = \{(x^{(2)}, z) : z \geq - \ln x^{(2)}\} = \{(x^{(2)}, z) : x^{(2)} \geq e^{- z}\}.
$$

Let us show that we can use the 3-self-concordant barrier

$$
\begin{array}{r}{\psi_{E}(x, y, \tau) = - \ln{\left(\tau \ln{\frac{y}{\tau}} - x \right)} - \ln{y} - \ln{\tau},} \end{array}\tag{5.4.34}
$$

$$
\begin{array}{r}{(x, y, \tau) \in \operatorname{int} \mathcal{E} \overset{\mathrm{def}}{=} \left\{y \geq \tau e^{x / \tau}, \ \tau > 0 \right\} \subset \mathbb{R}^{3},} \end{array}
$$

in more complicated situations. Consider the conic hull of the epigraph of the following function:

$$
f_{n}(x) \{\stackrel{\mathrm{def}}{=}} \ \ln \left(\sum_{i = 1}^{n} e^{x^{(i)}} \right), \quad x \in \mathbb{R}^{n},\tag{5.4.35}
$$

$$
\begin{array}{r}{Q \stackrel{\mathrm{def}}{=} \left\{(x, t, \tau) \in \mathbb{R}^{n} \times \mathbb{R} \times \mathbb{R} : t \geq \tau f_{n} \left(\frac{x}{\tau} \right), \ \tau > 0 \right\}.} \end{array}
$$

Clearly $(x, t, \tau) \in Q$ if and only if

$$
\begin{array}{r}{f_{n} \left(\frac{1}{\tau}(x - t \cdot \bar{e}_{n}) \right) \le 1,} \end{array}
$$

where $\bar{e}_{n} \in \mathbb{R}^{n}$ is the vector of all ones. Therefore, we can model $Q$ as a projection of the following cone:

$$
\begin{array}{r}{\hat{Q} = \Big \{(x, y, t, \tau) \in \mathbb{R}^{n} \times \mathbb{R}^{n} \times \mathbb{R} \times \mathbb{R} : y^{(i)} \geq \tau e^{(x^{(i)} - t) / \tau}, \i = 1, \dots, n,} \end{array}
$$

$$
\sum_{i = 1}^{n} y^{(i)} = \tau \bigg\}.
$$

This cone admits a 3n-self-concordant barrier, obtained as a restriction of the function

$$
\varPsi_{L}(x, y, t, \tau) = - \sum_{i = 1}^{n} \left[\ln \left(t + \tau \ln y^{(i)} - x^{(i)} - \tau \ln \tau \right) + \ln y^{(i)} + \ln \tau \right],\tag{5.4.36}
$$

onto the hyperplane $\sum_{i = 1}^{n} y^{(i)} = \tau.$

3. The geometric mean. Let $x \in \mathbb{R}_{+}^{n}$ and $a \in \mathcal{\Delta}_{n} \ \stackrel{\mathrm{def}}{=} \left\{y \in \mathbb{R}_{+}^{n} : \ \sum_{i = 1}^{n} y^{(i)} = 1 \right\}$ Without loss of generality, we can consider a with positive components. Define

$$
\xi(x) = x^{a} \{\stackrel{\mathrm{def}}{=}} \ \prod_{i = 1}^{n}(x^{(i)})^{a^{(i)}}.
$$

Let us write down the directional derivatives of this function along some $h \in \mathbb{R}^{n}$ Define

$$
\begin{array}{r}{\delta_{x}^{(i)}(h) = \frac{h^{(i)}}{x^{(i)}}, ~ i = 1, \dots, n,} \end{array}
$$

$$
\delta_{x}(h) = \left(\delta_{x}^{(1)}(h), \dots, \delta_{x}^{(n)}(h) \right)^{T},
$$

$$
F(x) = - \sum_{i = 1}^{n} \ln x^{(i)}.
$$

Clearly, $\| h \|_{x} \{\stackrel{\mathrm{def}}{=}} \ \langle F^{\prime \prime}(x) h, h \rangle^{1 / 2} = \| \delta_{x}(h) |$ , where the norm is standard Euclidean. Note that

$$
\begin{array}{r}{D(\ln \xi(x))[h] = \frac{1}{\xi(x)} D \xi(x)[h] \ = \ \langle a, \delta_{x}(h) \rangle.} \end{array}
$$

Thus, $D \xi(x)[h] = \xi(x) \cdot \langle a, \delta_{x}(h) \rangle$ . Denoting by $[x]^{k} \in \mathbb{R}^{n}$ a component-wise power of a vector $x \in \mathbb{R}^{n}$ , we obtain:

$$
\begin{array}{rl} &{D^{2} \xi(x)[h, h] = \xi(x) \cdot \langle a, \delta_{x}(h) \rangle^{2} - \xi(x) \cdot \langle a,[\delta_{x}(h)]^{2} \rangle} \\ &{} \\{\qquad = - \xi(x) \cdot \langle a,[\delta_{x}(h) - \langle a, \delta_{x}(h) \rangle \cdot \bar{e}_{n}]^{2} \rangle \overset{\mathrm{def}}{=} - \xi(x) \cdot S_{2}.} \end{array}
$$

Further, defining $\xi = \xi(x)$ and $\delta = \delta_{x}(h)$ , we obtain:

$$
\begin{array}{rl} &{D^{3} \xi(x)[h, h, h] = \xi \langle a, \delta \rangle^{3} + 2 \xi \langle a, \delta \rangle \langle a, -[\delta]^{2} \rangle - \xi \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle - \xi \langle a, - 2[\delta]^{3} \rangle} \\ &{} \\ &{\qquad = \xi \left(\langle a, \delta \rangle^{3} - 3 \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle + 2 \langle a,[\delta]^{3} \rangle \right).} \end{array}
$$

Define

$$
\begin{array}{l}{{S_{3} = \langle a,[\delta - \langle a, \delta \rangle \bar{e}_{n}]^{3} \rangle ~ = ~ \langle a,[\delta]^{3} - 3 \langle a, \delta \rangle[\delta]^{2} + 3 \langle a, \delta \rangle^{2} \delta - \langle a, \delta \rangle^{3} \bar{e}_{n} \rangle}} \\{{{}}} \\{{{} = \langle a,[\delta]^{3} \rangle - 3 \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle + 2 \langle a, \delta \rangle^{3}.}} \end{array}
$$

Then, in this new notation we have

$$
\begin{array}{rl} &{D^{3} \xi(x)[h, h, h] = \xi \Bigl(\langle a, \delta \rangle^{3} - 3 \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle} \\ &{\qquad \quad + 2 \left[S_{3} + 3 \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle - 2 \langle a, \delta \rangle^{3} \right] \Bigr)} \\ &{\qquad \quad = \xi \left(2S_{3} + 3 \langle a, \delta \rangle \langle a,[\delta]^{2} \rangle - 3 \langle a, \delta \rangle^{3} \right) \ = \ \xi(2S_{3} + 3 \langle a, \delta \rangle S_{2}).} \end{array}
$$

Therefore,

$$
\begin{array}{l}{{\displaystyle{D^{3} \xi(x)[h, h, h] \leq \xi S_{2} \left(3 \langle a, \delta \rangle + 2 \operatorname{max}_{1 \leq i \leq n}[\delta^{(i)} - \langle a, \delta \rangle] \right)}}} \\{{\displaystyle{}}} \\{{\leq \xi S_{2} \left(\langle a, \delta \rangle + 2 \operatorname{max}_{1 \leq i \leq n} | \delta^{(i)} | \right)}} \\{{\displaystyle{}}} \\{{\displaystyle{\leq - 3D^{2} \xi(x)[h, h] \cdot \langle F^{\prime \prime}(x) \delta, \delta \rangle^{1 / 2}}.}} \end{array}
$$

Thus, we have proved that $\xi$ is 1-compatible with $F$ . This means that the function

$$
\psi(x, t) = - \ln(\xi(x) - t) + F(x), \quad x > 0 \in \mathbb{R}^{n},\tag{5.4.37}
$$

is an $(n + 1)$ -self-concordant barrier for the hypograph of the function $\xi$ . Moreover, since the set of β-compatible functions is a convex cone, any sum

$$
\xi(x) = \sum_{k = 1}^{m} \alpha_{k} x^{a_{k}},\tag{5.4.38}
$$

with $\alpha_{k} \ > \0.$ , and $a_{k} \in \varDelta_{n}, k \ : = \ : 1, \ldots, m$ , is 1-compatible with $F$ . Hence, for such functions formula (5.4.37) is also applicable and the parameter of this barrier remains equal to $n + 1$

Note that the functions in the form (5.4.38) sometimes arise in optimization problems related to polynomials. Indeed, assume we need to solve the problem

$$
\operatorname{max}_{y} \left\{p(y) = \sum_{k = 1}^{m} \alpha_{k} y^{b_{k}} : \y \ge 0, \ \| y \|_{(d)} \le 1 \right\},
$$

where all $b_{k}$ belong to $d \cdot \varDelta_{n}$ and $\| y \|_{(d)} = \left[\sum_{i = 1}^{n}(y^{(i)})^{d} \right]^{1 / d}$ . Then for new variables $y^{(i)} ~ = ~ \left\lceil x^{(i)} \right\rceil^{1 / d}, ~ i ~ = ~ 1, \dots, n$ , our problem becomes convex with a concave objective ξ( ) given by (5.4.38).

4. The hypograph of the exponent of the self-concordant barrier. Let $F(\cdot)$ be ν-self-concordant barrier for the set Dom F . Let us fix $p \geq \nu$ and consider the function $\begin{array}{r}{\xi_{p}(x) = \exp \left\{- \frac{1}{p} F(x) \right\}} \end{array}$ . As we have proved in Lemma 5.3.1, this function is concave on dom $F$ . Consider the following set:

$$
\begin{array}{r}{\mathcal{H}_{p} = \left\{(x, t) \in \mathrm{dom} F \times \mathbb{R} : \xi_{p}(x) \geq t \right\}.} \end{array}
$$

Let us construct a self-concordant barrier for this set.

In our framework, $Q_{1} =$ Dom $F, Q_{2} = \{(y, t) \in \mathbb{R}^{2} : \y \geq t\}$ $K = \mathbb{R}_{+}$ , and $\phi(y, t) = - \ln(y - t)$ with $\mu = 1$ . Let us prove that $\xi_{p}(x)$ is concave with respect to $K$ , and it is β-compatible with F .

Let us fix $x \in \operatorname{dom} F$ and an arbitrary direction $h \in \mathbb{E}$ . Then

$$
\begin{array}{r}{\xi^{\prime} \overset{\mathrm{def}}{=} D \xi_{p}(x)[h] = - \frac{1}{p} \langle \nabla F(x), h \rangle \xi_{p}(x),} \end{array}
$$

$$
\begin{array}{r}{\xi^{\prime \prime} \overset{\mathrm{def}}{=} D^{2} F(x)[h, h] \ = \ \frac{1}{p^{2}} \langle \nabla F(x), h \rangle^{2} \xi_{p}(x) - \frac{1}{p} \langle \nabla^{2} F(x) h, h \rangle \xi_{p}(x),} \end{array}
$$

$$
\begin{array}{rl} &{\xi^{\prime \prime \prime} \overset{\mathrm{def}}{=} D^{3} F(x)[h, h, h] = - \frac{1}{p^{3}} \langle \nabla F(x), h \rangle^{3} \xi_{p}(x)} \\ &{\qquad + \frac{3}{p^{2}} \langle \nabla F(x), h \rangle \cdot \langle \nabla^{2} F(x) h, h \rangle \xi_{p}(x) - \frac{1}{p} D^{3} F(x)[h, h, h] \xi_{p}(x).} \end{array}
$$

As we have already seen, in view of (5.3.6), we have $\xi^{\prime \prime} \leq 0$ . This means that it is concave with respect to $K$

Let $\xi = \xi_{p}(x), D_{1} = \langle \nabla F(x), h \rangle, D_{2} = \langle \nabla^{2} F(x) h, h \rangle^{1 / 2}$ , and $\begin{array}{r}{\tau = \frac{\xi}{p} D_{2}^{2}} \end{array}$ . Then

$$
\begin{array}{rcl}{\xi^{\prime \prime}} &{=} &{\frac{\xi}{p^{2}} D_{1}^{2} - \tau \ \leq \0,} \end{array}
$$

$$
\begin{array}{rlr}{\xi^{\prime \prime \prime}} &{\overset{(5.1.4)}{\leq}} &{\frac{2 \xi}{p} D_{2}^{3} + \frac{3 \xi}{p^{2}} D_{1} D_{2}^{2} - \frac{\xi}{p^{3}} D_{1}^{3} = 2 \tau D_{2} + \frac{1}{p} D_{1} \left(3 \tau - \frac{\xi}{p^{2}} D_{1}^{2} \right)} \\ &{} & \\ &{=} &{2 \tau D_{2} + \frac{1}{p} D_{1} \left(2 \tau - \xi^{\prime \prime} \right) \overset{(5.3.6)}{\leq} 2 \tau D_{2} + \frac{\sqrt{\nu}}{p} D_{2} \left(2 \tau - \xi^{\prime \prime} \right).} \end{array}
$$

Note that $\begin{array}{r}{\xi^{\prime \prime} + \tau = \frac{\xi}{p^{2}} D_{1}^{2} \stackrel{(5.3.6)}{\leq} \frac{\xi \nu}{p^{2}} D_{2}^{2} = \frac{\nu}{p} \tau} \end{array}$ . Thus, $\begin{array}{r}{\tau \le \frac{p}{p - \nu}(- \xi^{\prime \prime})} \end{array}$ , and therefore

$$
\begin{array}{r}{\xi^{\prime \prime \prime} \leq D_{2} \left(2(1 + \frac{\sqrt{\nu}}{p}) \tau + \frac{\sqrt{\nu}}{p}(- \xi^{\prime \prime}) \right) \ \leq \D_{2} \left(\frac{2}{\sqrt{p} - \sqrt{\nu}} + \frac{\sqrt{\nu}}{p} \right)(- \xi^{\prime \prime}).} \end{array}
$$

This means that for $p \geq(1 + \sqrt{\nu})^{2}$ the function $\xi_{p}(x)$ is 1-compatible with $F$ and by Theorem 5.4.4 we get a $(\nu + 1)$ -self-concordant barrier

$$
\begin{array}{r}{\psi_{H}(x, t) = - \ln{\left(\exp{\left\{- \frac{1}{p} F(x) \right\}} - t \right)} + F(x)} \end{array}\tag{5.4.39}
$$

for the set $\mathcal{H}_{p}$

5. The matrix epigraph of the inverse matrix. Consider the following set

$$
\mathcal{I}_{n} = \{(X, Y) \in \mathbb{S}_{+}^{n} \times \mathbb{S}_{+}^{n} : \X^{- 1} \preceq Y\}.
$$

In order to construct a barrier for this set, consider the mapping $\xi(X) = - X^{- 1}$ It is defined on the set of positive definite matrices, for which we know a ν-selfconcordant barrier $F(X) \ = \ - \ln$ det X with the barrier parameter $\nu ~ = ~ n$ (see Theorem 5.4.3). Let us show that $\xi$ is 1-compatible with $F$

Indeed, let us fix an arbitrary direction $H \ \in \ \mathbb{S}^{n}$ . By the same reasoning as in Lemma 5.4.6, we can prove that

$$
D \xi(X)[H] = X^{- 1} HX^{- 1},
$$

$$
D^{2} \xi(X)[H, H] = - 2X^{- 1} HX^{- 1} HX^{- 1} \ \in - S_{+}^{n},
$$

$$
D^{3} \xi(X)[H, H, H] = 6X^{- 1} HX^{- 1} HX^{- 1} HX^{- 1}.
$$

Let $A = X^{- 1 / 2} HX^{- 1 / 2}$ and $\rho = \operatorname{max}_{1 \leq i \leq n} | \lambda_{i}(A) |$ . Then, in view of Lemma 5.4.6,

$$
\langle \nabla^{2} F(X) H, H \rangle = \| A \|_{F}^{2} = \sum_{i = 1}^{n} \lambda_{i}^{2}(A) \geq \rho^{2}.
$$

On the other hand,

$$
\begin{array}{c}{{D^{3} \xi(X)[H, H, H] = 6X^{- 1 / 2} A^{3} X^{- 1 / 2} \ \preceq \6 \rho X^{- 1 / 2} A^{2} X^{- 1 / 2}}} \\{{}} \\ \\{{\preceq 6 \langle \nabla^{2} F(X) H, H \rangle^{1 / 2} X^{- 1 / 2} A^{2} X^{- 1 / 2}}} \\{{}} \\ \\{{= 3 \langle \nabla^{2} F(X) H, H \rangle^{1 / 2} D^{2} F(X)[H, H].}} \end{array}
$$

Thus, condition (5.4.21) is satisfied with $\beta \ : = \ : 1$ . Hence, by Theorem 5.4.4 the function

$$
F(X, Y) = - \ln \operatorname{det}(Y - X^{- 1}) - \ln \operatorname{det} X\tag{5.4.40}
$$

is a ν-self-concordant barrier for ${\mathcal{I}}_{n}$ with $\nu = 2n$

Lemma 5.4.10 Any self-concordant barrier for the set ${\mathcal{I}}_{n}$ has parameter $\nu \geq 2n$

Proof Let us choose $\gamma > 1$ and consider matrices ${\bar{X}} ={\bar{Y}} = \gamma I_{n}$ . Clearly the point $({\bar{X}},{\bar{Y}})$ belongs to int ${\mathcal{I}}_{n}$ . Note that for positive definite matrices, relation $Y \succeq X^{- 1}$ holds if and only if $X \succeq Y^{- 1}$ . Therefore, all directions

$$
p_{i} =(e_{i} e_{i}^{T}, 0), \quad q_{i} \ = \(0, e_{i} e_{i}^{T}), \quad i = 1, \ldots, n,
$$

are recession directions of the set ${\mathcal{I}}_{n}$ . It is easy to check that for $\begin{array}{r}{\beta = \gamma - \frac{1}{\gamma}} \end{array}$ we get

$$
({\bar{X}},{\bar{Y}}) - \beta p_{i} \in \partial{\mathcal{S}}_{n}, \quad({\bar{X}},{\bar{Y}}) - \beta q_{i} \in \partial{\mathcal{S}}_{n}, \quad i = 1, \ldots, n.
$$

On the other hand, for $\alpha = \gamma - 1$ , we have $\bar{Y} - \alpha \sum_{i = 1}^{n}{e_{i} e_{i}^{T}} = I_{n} =(\bar{X} - \alpha \sum_{i = 1}^{n}{e_{i} e_{i}^{T}})^{- 1}$ Therefore, in the conditions of Theorem 5.4.1 we can get all $\alpha_{i} = \alpha$ and all $\beta_{i} = \beta$ Thus, we obtain $\begin{array}{r}{\nu \ge 2n \frac{\alpha}{\beta} = \frac{2n \gamma}{1 + \gamma}} \end{array}$ . Since $\gamma$ can be arbitrarily big, we come to the bound $\nu \geq 2n$ □

## 5.4.8 Separable Optimization

In problems of Separable Optimization all nonlinear terms in functional components are represented by univariate functions. A general formulation of such a problem is

as follows:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \left\{\begin{array}{ll}{q_{0}(x) = \sum_{j = 1}^{m_{0}} \alpha_{0, j} f_{0, j}(\langle a_{0, j}, x \rangle + b_{0, j}),} \end{array} \right.\tag{5.4.41}
$$

$$
q_{i}(x) = \sum_{j = 1}^{m_{i}} \alpha_{i, j} f_{i, j}(\langle a_{i, j}, x \rangle + b_{i, j}) \leq \beta_{i}, \i = 1 \dots m \Big\},
$$

where $\alpha_{i, j}$ are some positive coefficients, $a_{i, j} \in \mathbb{R}^{n}$ and $f_{i, j}(\cdot)$ are convex functions of one variable. Let us rewrite this problem in the standard form:

$$
\operatorname{min}_{\substack{x \in \mathbb{R}^{n}, \tau \in \mathbb{R}^{m + 1}, t \in \mathbb{R}^{M}}} \left\{\begin{array}{ll}{\tau_{0} : \sum_{j = 1}^{m_{i}} \alpha_{i, j} t_{i, j} \leq \tau_{i}, i = 0 \ldots m, \tau_{i} \leq \beta_{i}, i = 1 \ldots m,} \end{array} \right.
$$

$$
f_{i, j}(\langle a_{i, j}, x \rangle + b_{i, j}) \leq t_{i, j}, \j = 1 \ldots m_{i}, \i = 0 \ldots m, \ \Big\},\tag{5.4.42}
$$

where $M = \sum_{i = 0}^{m} m_{i}$ . Thus, in order to construct a self-concordant barrier for the feasible set of this problem, we need barriers for epigraphs of univariate convex functions $f_{i, j}$ . Let us point out such barriers for several important examples.

## 5.4.8.1 Logarithm and Exponent

By fixing the first coordinate in the barrier (5.4.33), we obtain the barrier function $F_{1}(x, t) = - \ln x - \ln(\ln x + t)$ , which is a 3-self-concordant barrier for the set

$$
\mathcal{Q}_{1} = \{(x, t) \in \mathbb{R}^{2} \ | \x > 0, \t \geq - \ln x\}.
$$

Similarly, we obtain the function $F_{2}(x, t) ~ = ~ - \ln t ~ - \ln(\ln t ~ - ~ x)$ as a 3-selfconcordant barrier for the set

$$
Q_{2} = \{(x, t) \in \mathbb{R}^{2} \mid t \geq e^{x}\}.
$$

## 5.4.8.2 Entropy Function

By fixing the second coordinate in the barrier (5.4.33), we obtain the barrier function $F_{3}(x, t) = - \ln x - \ln(t - x \ln x)$ , which is a 3-self-concordant barrier for the set

$$
\mathcal{Q}_{3} = \{(x, t) \in \mathbb{R}^{2} \ | \x \ge 0, \t \ge x \ln x\}.
$$

## 5.4.8.3 Increasing Power Functions

Let $p \geq 1$ and define $\textstyle \alpha ={\frac{1}{p}}$ . By fixing the second variable in barrier (5.4.28), $x^{(2)} = 1$ , we get function $\dot{F_{4}}(x, t) = - \ln t - \ln(t^{2 / p} - x^{2})$ , which is a 4-selfconcordant barrier for the set

$$
\begin{array}{r}{Q_{4} = \{(x, t) \in \mathbb{R}^{2} \mid t \geq \mid x \mid^{p}\}, \quad p \geq 1.} \end{array}
$$

If $p \ < \1$ , then a similar operation with the barrier (5.4.29) gives us the function $F_{5}(x, t) = - \ln t - \ln(t^{p} - x)$ , which is a 3-self-concordant barrier for the set

$$
Q_{5} = \{(x, t) \in \mathbb{R}^{2} \mid t \geq 0, t^{p} \geq x\}, \quad 0 < p \leq 1_{\cdot}
$$

## 5.4.8.4 Decreasing Power Functions

Let $p > 0$ . Define $\begin{array}{r}{\alpha = \frac{p}{p + 1}} \end{array}$ . Then by fixing $z = 1$ in the barrier (5.4.29), we get the function $F_{6}(x, t) = - \ln x - \ln t - \ln(x^{\alpha} t^{1 - \alpha} - 1)$ , which is a 3-self-concordant barrier for the set

$$
\begin{array}{r}{Q_{6} = \left\{(x, t) \in \mathbb{R}^{2} \ | \x > 0, \t \geq \frac{1}{x^{p}} \right\}.} \end{array}
$$

Let us conclude our discussion with two examples.

## 5.4.8.5 Geometric Optimization

The initial formulation of such problems is as follows:

$$
\begin{array}{rlr}{\operatorname{min}_{x \in \mathbb{R}_{+ +}^{n}} \bigg \{\{q}_{0}(x) = \sum_{j = 1}^{m_{0}} \alpha_{0, j} \ \prod_{j = 1}^{n}(x^{(j)})^{{\sigma}_{0, j}^{(j)}},} \\ &{} \\ &{} &{\qquad q_{i}(x) = \sum_{j = 1}^{m_{i}} \alpha_{i, j} \ \underset{j = 1}{\overset{n}{\prod}}(x^{(j)})^{{\sigma}_{i, j}^{(j)}} \leq 1, \i = 1 \ldots m \bigg\},} \end{array}\tag{5.4.43}
$$

where $\mathbb{R}_{+ +}^{N}$ is the interior of the positive orthant, and $\alpha_{i, j}$ are some positive coefficients. Note that the problem (5.4.43) is not convex.

Let us introduce vectors $a_{i, j} =(\sigma_{i, j}^{(1)}, \ldots, \sigma_{i, j}^{(n)}) \in \mathbb{R}^{n}$ , and change variables:

$$
x^{(i)} = e^{y^{(i)}}, \quad i = 1, \ldots, n.
$$

Then problem (5.4.43) can be written in a convex form.

$$
\operatorname{min}_{y \in \mathbb{R}^{n}} \left\{\sum_{j = 1}^{m_{0}} \alpha_{0, j} \exp(\langle a_{0, j}, y \rangle) : \sum_{j = 1}^{m_{i}} \alpha_{i, j} \exp(\langle a_{i, j}, y \rangle) \leq 1, i = 1 \ldots m \right\}.\tag{5.4.44}
$$

Let $M = \sum_{i = 0}^{m} m_{i}$ . The complexity of solving (5.4.44) by a path-following scheme is $O \left(M^{1 / 2} \cdot \ln \frac{M}{\epsilon} \right)$ iterations.

## 5.4.8.6 Approximation in an $\ell_{p}{\mathbf{-}} \mathbf{N_{0}} \mathbf{rm}$

The simplest problem of this type is as follows:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \left\{\sum_{i = 1}^{m} \mid \langle a_{i}, x \rangle - b^{(i)} \mid^{p} \colon \alpha \leq x \leq \beta \right\},\tag{5.4.45}
$$

where $p \geq 1$ and α, $\beta \in \mathbb{R}^{n}$ . Clearly, we can rewrite this problem in an equivalent standard form:

$$
\operatorname{min}_{\substack{x \in \mathbb{R}^{n}, \tau \in \mathbb{R}^{m + 1}}} \left\{\tau^{(0)} : \vert \left.a_{i}, x \right.- b^{(i)} \vert^{p} \leq \tau^{(i)}, i = 1 \ldots m, \right.
$$

$$
\sum_{i = 1}^{m} \tau^{(i)} \leq \tau^{(0)}, \alpha \leq x \leq \beta\}.\tag{5.4.46}
$$

The complexity bound of this problem is $O \left({\sqrt{m + n}} \cdot \ln{\frac{m + n}{\epsilon}} \right)$ iterations of a pathfollowing scheme.

We have discussed the performance of Interior-Point Methods for several pure optimization problems. However, it is important that we can apply these methods to mixed problems. For example, in problems (5.4.11) or (5.4.45) we can also treat the quadratic constraints. To do this, we need to construct a corresponding selfconcordant barrier. Such barriers are known for all important functional components arising in practical applications.

## 5.4.9 Choice of Minimization Scheme

We have seen that the majority of convex optimization problems can be solved by Interior-Point Methods. However, the same problems can also be solved by methods of Nonsmooth Optimization. In general, we cannot say which approach is better, since the answer depends on the individual structure of a particular problem. However, the complexity estimates for optimization schemes are often helpful in making the choice. Let us consider a simple example.

Assume we are going to solve a problem of finding the best approximation in an $\ell_{p}{\mathrm{- norm}} \colon$

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \left\{\sum_{i = 1}^{m} \mid \langle a_{i}, x \rangle - b^{(i)} \mid^{p} \colon \alpha \leq x \leq \beta \right\},\tag{5.4.47}
$$

where $p \geq 1$ . We have two available numerical methods:

- The Ellipsoid Method (Sect. 3.2.8).

- The Interior-Point Path-Following Scheme.

Which of them should we use? The answer can be derived from the complexity analysis of the corresponding schemes.

Firstly, let us estimate the performance of the Ellipsoid Method as applied to problem (5.4.47).

```latex
Complexity of the Ellipsoid Method
Number of iterations: $O \left(n^{2} \ln \frac{1}{\epsilon} \right)$
Complexity of the oracle: O(mn) operations,
Complexity of the iteration: $O(n^{2})$ operations.
Total complexity $O \left(n^{3}(m + n) \ln{\frac{1}{\epsilon}} \right)$ operations.
```

The analysis of the Path-Following Method is more involved. First of all, we should form a barrier model of the problem:

$$
\operatorname{min}_{\substack{x \in \mathbb{R}^{n}, \tau \in \mathbb{R}^{m}, \xi \in \mathbb{R}}} \bigg \{\xi : | \langle a_{i}, x \rangle - b^{(i)} |^{p} \leq \tau^{(i)}, i = 1 \ldots m,
$$

$$
\sum_{i = 1}^{m} \tau^{(i)} \leq \xi, \alpha \leq x \leq \beta\},
$$

$$
\begin{array}{c}{{\displaystyle F(x, \tau, \xi)) = \sum_{i = 1}^{m} f(\langle a_{i}, x \rangle - b^{(i)}, \tau^{(i)}) - \ln(\xi - \sum_{i = 1}^{m} \tau^{(i)})}} \\{{- \displaystyle \sum_{i = 1}^{n}[\ln(x^{(i)} - \alpha^{(i)}) + \ln(\beta^{(i)} - x^{(i)})],}} \end{array}\tag{5.4.48}
$$

where $f(y, t) = - \ln t - \ln(t^{2 / p} - y^{2})$

We have seen that the parameter of barrier $F(x, \tau, \xi) \ \mathrm{is} \ \nu \ = \4m + n + 1$ Therefore, the Path-Following Scheme needs $O \left({\sqrt{4m + n + 1}} \cdot \ln{\frac{m + n}{\epsilon}} \right)$ iterations at most.

At each iteration of this method, we need to compute the gradient and the Hessian of barrier $F(x, \tau, \xi)$ . Define

$$
g_{1}(y, t) = \nabla_{y} f(y, t), \quad g_{2}(y, t) = f_{t}^{\prime}(y, t).
$$

Then

$$
\nabla_{\boldsymbol{x}} F(\boldsymbol{x}, \tau, \boldsymbol{\xi}) = \sum_{i = 1}^{m} g_{1}(\langle a_{i}, \boldsymbol{x} \rangle - b^{(i)}, \tau^{(i)}) a_{i} - \sum_{i = 1}^{n} \left[\frac{1}{\boldsymbol{x}^{(i)} - \alpha^{(i)}} - \frac{1}{\beta^{(i)} - \boldsymbol{x}^{(i)}} \right] e_{i},
$$

$$
F_{\tau^{(i)}}^{\prime}(x, \tau, \xi) = g_{2}(\langle a_{i}, x \rangle - b^{(i)}, \tau^{(i)}) + \left[\xi - \sum_{j = 1}^{m} \tau^{(j)} \right]^{- 1},
$$

$$
F_{\xi}^{\prime}(x, \tau, \xi) = - \left[\xi - \sum_{i = 1}^{m} \tau^{(i)} \right]^{- 1}.
$$

Further, defining

$$
h_{11}(y, t) = \nabla_{yy}^{2} F(y, t), \quad h_{12}(y, t) = \nabla_{yt}^{2} F(y, t), \quad h_{22}(y, t) = F_{tt}^{\prime \prime}(y, t),
$$

we obtain

$$
\begin{array}{r}{\nabla_{xx}^{2} F(x, \tau, \xi) = \displaystyle \sum_{i = 1}^{m} h_{11}(\langle a_{i}, x \rangle - b^{(i)}, \tau^{(i)}) a_{i} a_{i}^{T}} \\{+ \operatorname{diag} \left[\frac{1}{(x^{(i)} - \alpha^{(i)})^{2}} + \frac{1}{(\beta^{(i)} - x^{(i)})^{2}} \right],} \end{array}
$$

$$
\begin{array}{r}{\nabla_{\tau^{(i)} x}^{2} F(x, \tau, \xi) = h_{12}(\langle a_{i}, x \rangle - b^{(i)}, \tau^{(i)}) a_{i},} \end{array}
$$

$$
F_{\tau^{(i)}, \tau^{(i)}}^{\prime \prime}(x, \tau, \xi) = h_{22}(\langle a_{i}, x \rangle - b^{(i)}, \tau^{(i)}) + \left(\xi - \sum_{i = 1}^{m} \tau^{(i)} \right)^{- 2},
$$

$$
F_{\tau^{(i)}, \tau^{(j)}}^{\prime \prime}(x, \tau, \xi) = \left(\xi - \sum_{i = 1}^{m} \tau^{(i)} \right)^{- 2}, i \neq j,
$$

$$
\nabla_{x, \xi}^{2} F(x, \tau, \xi) = 0, \quad F_{\tau^{(i)}, \xi}^{\prime \prime}(x, \tau, \xi) \ = \ - \left(\xi - \sum_{i = 1}^{m} \tau^{(i)} \right)^{- 2},
$$

$$
F_{\xi, \xi}^{\prime \prime}(x, \tau, \xi) = \left(\xi - \sum_{i = 1}^{m} \tau^{(i)} \right)^{- 2}.
$$

Thus, the complexity of the second-order oracle in the Path-Following Scheme is $O(mn^{2})$ arithmetic operations.

Let us estimate now the complexity of each iteration. The main source of computations at each iteration is the solution of the Newton system. Let

$$
\varkappa = \left(\xi - \sum_{i = 1}^{m} \tau^{(i)} \right)^{- 2}, \quad s_{i} = \langle a_{i}, x \rangle - b^{(i)}, i = 1 \dots n,
$$

and

$$
\begin{array}{r}{A_{0} = \operatorname{diag} \left[\frac{1}{(x^{(i)} - \alpha^{(i)})^{2}} + \frac{1}{(\beta^{(i)} - x^{(i)})^{2}} \right]_{i = 1}^{n} A_{1} = \operatorname{diag}(h_{11}(s_{i}, \tau^{(i)}))_{i = 1}^{m},} \end{array}
$$

$$
\varLambda_{2} = \operatorname{diag}(h_{12}(s_{i}, \tau^{(i)}))_{i = 1}^{m}, \qquad D = \operatorname{diag}(h_{22}(s_{i}, \tau^{(i)}))_{i = 1}^{m}.
$$

Then, using the notation $A =(a_{1}, \ldots, a_{m}), \bar{e}_{m} =(1, \ldots, 1) \in \mathbb{R}^{m}$ , the Newton system can be written in the following form:

$$
\begin{array}{r}{[A(\varLambda_{0} + \varLambda_{1}) A^{T}] \varDelta x + A \varLambda_{2} \varDelta \tau = \nabla_{x} F(x, \tau, \xi),} \\{~} \\{\varLambda_{2} A^{T} \varDelta x +[D + \varkappa I_{m}] \varDelta \tau + \varkappa \bar{e}_{m} \varDelta \xi = F_{\tau}^{\prime}(x, \tau, \xi),} \\{~} \\{\varkappa \langle \bar{e}_{m}, \varDelta \tau \rangle + \varkappa \varDelta \xi = F_{\xi}^{\prime}(x, \tau, \xi) + t,} \end{array}\tag{5.4.49}
$$

where t is the penalty parameter. From the second equation in (5.4.49), we obtain

$$
\varDelta \tau =[D + \varkappa I_{m}]^{- 1}(F_{\tau}^{\prime}(x, \tau, \xi) - A_{2} A^{T} \varDelta x - \varkappa \bar{e}_{m} \varDelta \xi).
$$

Substituting $\varDelta \tau$ into the first equation in (5.4.49), we have

$$
\begin{array}{rl} &{\varDelta x =[A(\varLambda_{0} + \varLambda_{1} - \varLambda_{2}^{2}[D + \varkappa I_{m}]^{- 1}) A^{T}]^{- 1} \{\nabla_{x} F(x, \tau, \xi)} \\ &{\qquad - A \varLambda_{2}[D + \varkappa I_{m}]^{- 1}(F_{\tau}^{\prime}(x, \tau, \xi) - \varkappa \bar{e}_{m} \varDelta \xi)\}.} \end{array}
$$

Using these relations, we can find $\varDelta \xi$ from the last equation in (5.4.49).

Thus, the Newton system (5.4.49) can be solved in $O(n^{3} + mn^{2})$ operations. This implies that the total complexity of the Path-Following Scheme can be estimated as

$$
O \left(n^{2}(m + n)^{3 / 2} \cdot \ln \frac{m + n}{\epsilon} \right)
$$

arithmetic operations. Comparing this estimate with the bound for the Ellipsoid Method, we conclude that the Interior-Point Method is more efficient if m is not too big, namely, if $m \le{O}(n^{2})$ .

Of course, this analysis is valid only if the methods behave in accordance with their worst-case complexity bounds. For the Ellipsoid Method this is indeed true. However, Interior-Point Path-Following Schemes can be accelerated by long-step strategies. The explanation of these abilities requires the introduction of a primaldual setting of the optimization problems, posed in a conic form. Because of the volume constraints, we have decided not to touch on this deep theory in the present book.


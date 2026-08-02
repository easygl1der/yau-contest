---
title: "Chapter 1 \u2014 From Linear to Conic Programming"
book: "Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications"
book_slug: lectures-modern-convex-optimization
course: optimization
chapter_number: 1
citekey: null
official_syllabus: false
source_pdf: "sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-modern-convex-optimization/reading.md"
source_line_start: 673
source_line_end: 3528
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 4
source_empty_image_alt: 4
non_semantic_image_alt: 2
caption_derived_image_alt: 2
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 9
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
---

# Chapter 1 — From Linear to Conic Programming

> [[../README|本书目录]] · [[02-chapter-2-conic-quadratic-programming|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications
> - 权威原件：[source.pdf](../../../sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-modern-convex-optimization/reading.md)，源行 673–3528。
> - 本章保留 4 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 9；Affine × 55；different × 6；efficient × 5；sufficient × 26。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# From Linear to Conic Programming

## 1.1 Linear programming: basic notions

A Linear Programming (LP) program is an optimization program of the form

$$
\min \left\{c^{T} x \bigg | Ax \geq b \right\},\tag{LP}
$$

where

$\boldsymbol{x} \in \mathbb{R}^{n}$ is the design vector

$c \in \mathbb{R}^{n}$ is a given vector of coeficients of the objective function $c^{T} x$

- A is a given $m \times n$ constraint matrix, and $b \in \mathbb{R}^{m}$ is a given right hand side of the constraints.

(LP) is called

– feasible, if its feasible set

$$
\mathcal{F} = \{x: Ax - b \geq 0\}
$$

is nonempty; a point $x \in{\mathcal{F}}$ is called a feasible solution to $\left(\mathrm{LP} \right)$ ;

– bounded below, if it is either infeasible, or its objective $c^{T} x$ is bounded below on ${\mathcal F}.$

For a feasible bounded below problem (LP), the quantity

$$
c^{*} \equiv \inf_{x: Ax - b \geq 0} c^{T} x
$$

is called the optimal value of the problem. For an infeasible problem, we set $c_{*} = + \infty$ 2 while for feasible unbounded below problem we set $c_{*} = - \infty$

(LP) is called solvable, if it is feasible, bounded below and the optimal value is attained, i.e., there exists $x \in{\mathcal{F}}$ with $c^{T} x = c^{*}$ . An x of this type is called an optimal solution to (LP).

A priori it is unclear whether a feasible and bounded below LP program is solvable: why should the infimum be achieved? It turns out, however, that a feasible and bounded below program (LP) always is solvable. This nice fact (we shall establish it later) is specific for LP. Indeed, a very simple nonlinear optimization program

$$
\min \left\{\frac{1}{x} \bigg | x \geq 1 \right\}
$$

is feasible and bounded below, but it is not solvable.

## 1.2 Duality in Linear Programming

The most important and interesting feature of Linear Programming as a mathematical entity (i.e., aside of computations and applications) is the wonderful LP duality theory we are about to consider. We motivate this topic by first addressing the following question:

Given an LP program

$$
c^{*} = \min_{x} \left\{c^{T} x \mid Ax - b \geq 0 \right\},\tag{LP}
$$

how to find a systematic way to bound from below its optimal value $c^{*} ~ ?$

Why this is an important question, and how the answer helps to deal with LP, this will be seen in the sequel. For the time being, let us just believe that the question is worthy of the efort.

A trivial answer to the posed question is: solve (LP) and look what is the optimal value. There is, however, a smarter and a much more instructive way to answer our question. Just to get an idea of this way, let us look at the following example:

$$
\min \left\{x_{1} + x_{2} + \ldots + x_{2002} \bigg | \begin{array}{ccc} x_{1} + 2x_{2} + \ldots + 2001x_{2001} + 2002x_{2002} - 1 & \geq & 0, \\ 2002x_{1} + 2001x_{2} + \ldots + 2x_{2001} + x_{2002} - 100 & \geq & 0, \\ \ldots \ldots & \ldots & \ldots \end{array} \right\}.
$$

We claim that the optimal value in the problem is $\geq \frac{101}{2003}$ . How could one certify this bound? This is immediate: add the first two constraints to get the inequality

$$
2003 \left(x_{1} + x_{2} + \dots + x_{1998} + x_{2002}\right) - 101 \geq 0,
$$

and divide the resulting inequality by 2003. LP duality is nothing but a straightforward generalization of this simple trick.

## 1.2.1 Certificates for solvability and insolvability

Consider a (finite) system of scalar inequalities with n unknowns. To be as general as possible, we do not assume for the time being the inequalities to be linear, and we allow for both nonstrict and strict inequalities in the system, as well as for equalities. Since an equality can be represented by a pair of non-strict inequalities, our system can always be written as

$$
f_{i}(x) \Omega_{i} 0, i = 1, \dots, m,\tag{S}
$$

where every $\Omega_{i}$ is either the relation $^{\mathfrak{n}} >^{\mathfrak{n}}$ or the relation $^{99} >^{99}$

The basic question about (S) is

## (?) Whether (S) has a solution or not.

Knowing how to answer the question (?), we are able to answer many other questions. $\mathrm{E.g.}$ , to verify whether a given real a is a lower bound on the optimal value $c^{*}$ of (LP) is the same as to verify whether the system

$$
\left\{\begin{array}{rl} - c^{T} x + a & > 0 \\ Ax - b & \geq 0 \end{array} \right.
$$

has no solutions.

The general question above is too dificult, and it makes sense to pass from it to a seemingly simpler one:

(??) How to certify that (S) has, or does not have, a solution.

Imagine that you are very smart and know the correct answer to (?); how could you convince somebody that your answer is correct? What could be an “evident for everybody” certificate of the validity of your answer?

If your claim is that (S) is solvable, a certificate could be just to point out a solution $x^{*}$ to (S). Given this certificate, one can substitute $x^{*}$ into the system and check whether $x^{*}$ indeed is a solution.

Assume now that your claim is that (S) has no solutions. What could be a “simple certificate” of this claim? How one could certify a negative statement? This is a highly nontrivial problem not just for mathematics; for example, in criminal law: how should someone accused in a murder prove his innocence? The “real life” answer to the question “how to certify a negative statement” is discouraging: such a statement normally cannot be certified (this is where the rule “a person is presumed innocent until proven guilty” comes from). In mathematics, however, the situation is different: in some cases there exist “simple certificates” of negative statements. E.g., in order to certify that (S) has no solutions, it sufices to demonstrate that a consequence of (S) is a contradictory inequality such as

$$
- 1 \geq 0.
$$

For example, assume that $\lambda_{i}, i = 1,..., m$ , are nonnegative weights. Combining inequalities from (S) with these weights, we come to the inequality

$$
\sum_{i = 1}^{m} \lambda_{i} f_{i}(x) \Omega 0\tag{Cons(λ)}
$$

where Ω is either $^{99} >^{99}$ (this is the case when the weight of at least one strict inequality from (S) is positive), $\operatorname{or} \{\mathfrak{N}} \ \geq \{\mathfrak{N}}$ (otherwise). Since the resulting inequality, due to its origin, is a consequence of the system (S), i.e., it is satisfied by every solution to S), it follows that if (Cons(λ)) has no solutions at all, we can be sure that (S) has no solution. Whenever this is the case, we may treat the corresponding vector λ as a “simple certificate” of the fact that (S) is infeasible.

Let us look what does the outlined approach mean when (S) is comprised of linear inequalities:

$$
(\mathcal{S}): \quad \{a_{i}^{T} x \Omega_{i} b_{i}, i = 1,..., m\} \quad \left[\Omega_{i} = \left\{\begin{array}{ll}" >" \\ " \geq " \end{array} \right.\right]
$$

Here the “combined inequality” is linear as well:

$$
(\operatorname{Cons}(\lambda)): \qquad(\sum_{i = 1}^{m} \lambda a_{i})^{T} x \Omega \sum_{i = 1}^{m} \lambda b_{i}
$$

(Ω is $^{\mathfrak{n}} >^{\mathfrak{n}}$ whenever $\lambda_{i} > 0$ for at least one i with $\Omega_{i} = " > "$ , and Ω is $" \geq "$ otherwise). Now, when can a linear inequality

$$
d^{T} x \Omega e
$$

be contradictory? Of course, it can happen only when $d = 0$ . Whether in this case the inequality is contradictory, it depends on what is the relation Ω: if $\Omega = " > "$ , then the inequality is contradictory if and only if $e \geq 0$ , and if $\Omega = " \geq "$ , it is contradictory if and only if $e > 0$ . We have established the following simple result:

Proposition 1.2.1 Consider a system of linear inequalities

$$
\left\{\begin{array}{ll} a_{i}^{T} x & > b_{i}, i = 1, \dots, m_{s}, \\ a_{i}^{T} x & \geq b_{i}, i = m_{s} + 1, \dots, m.\end{array} \right.
$$

with n-dimensional vector of unknowns x. Let us associate with (S) two systems of linear inequalities and equations with m-dimensional vector of unknowns λ:

$$
\mathcal{T}_{\mathrm{I}}: \qquad \left\{\begin{array}{cccc}(a) & \lambda & \geq & 0; \\(b) & \sum_{i = 1}^{m} \lambda_{i} a_{i} & = & 0; \\(c_{\mathrm{I}}) & \sum_{i = 1}^{m} \lambda_{i} b_{i} & \geq & 0; \\ \hline(d_{\mathrm{I}}) & \sum_{i = 1}^{m_{s}} \lambda_{i} & > & 0.\end{array} \right.
$$

$$
\mathcal{T}_{\mathrm{II}}: \qquad \left\{\begin{array}{cccc}(a) & \lambda & \geq & 0; \\(b) & \sum_{i = 1}^{m} \lambda_{i} a_{i} & = & 0; \\ \hline(c_{\mathrm{II}}) & \sum_{i = 1}^{m} \lambda_{i} b_{i} & > & 0.\end{array} \right.
$$

Assume that at least one of the systems T<sub>I</sub>, $\mathcal{T}_{\mathrm{II}}$ is solvable. Then the system (S) is infeasible.

Proposition 1.2.1 says that in some cases it is easy to certify infeasibility of a linear system of inequalities: a “simple certificate” is a solution to another system of linear inequalities. Note, however, that the existence of a certificate of this latter type is to the moment only a sufficient, but not a necessary, condition for the infeasibility of (S). A fundamental result in the theory of linear inequalities is that the sufficient condition in question is in fact also necessary:

Theorem 1.2.1 [General Theorem on Alternative] In the notation from Proposition 1.2.1, system (S) has no solutions if and only if either ${\mathcal{T}}_{\mathrm{I}},$ or $\mathcal{T}_{\mathrm{II}}$ , or both these systems, are solvable.

There are numerous proofs of the Theorem on Alternative; in my taste, the most instructive one is to reduce the Theorem to its particular case – the Homogeneous Farkas Lemma:

[Homogeneous Farkas Lemma] A homogeneous nonstrict linear inequality

$$
a^{T} x \leq 0
$$

is a consequence of a system of homogeneous nonstrict linear inequalities

$$
a_{i}^{T} x \leq 0, i = 1, \dots, m
$$

if and only if it can be obtained from the system by taking weighted sum with nonnegative weights:

(a)

$$
\begin{array}{c} a_{i}^{T} x \leq 0, i = 1,..., m \Rightarrow a^{T} x \leq 0, \\ \Updownarrow \\ \exists \lambda_{i} \geq 0: a = \sum_{i} \lambda_{i} a_{i}.\end{array}\tag{b}
$$

(1.2.1)

The reduction of GTA to HFL is easy. As about the HFL, there are, essentially, two ways to prove the statement:

- The “quick and dirty” one based on separation arguments (see Section B.2.6 and/or Exercise B.14), which is as follows:

1. First, we demonstrate that if A is a nonempty closed convex set in $\mathbb{R}^{n}$ and a is a point from $\mathbb{R}^{n} \backslash A$ , then a can be strongly separated from A by a linear form: there exists $x \in \mathbb{R}^{n}$ such that

$$
x^{T} a < \inf_{b \in A} x^{T} b.\tag{1.2.2}
$$

To this end, it sufices to verify that

(a) In A, there exists a point closest to a w.r.t. the standard Euclidean norm $\| b \|_{2} = \sqrt{b^{T} b},$ $\mathrm{i.e.}$ , that the optimization program

$$
\min_{b \in A} \| a - b \|_{2}
$$

has a solution $b_{*};$

(b) Setting $x = b_{*} - a,$ one ensures (1.2.2).

Both (a) and (b) are immediate.

2. Second, we demonstrate that the set

$$
A = \{b: \exists \lambda \geq 0: b = \sum_{i = 1}^{m} \lambda_{i} a_{i}\}
$$

– the cone spanned by the vectors $a_{1},..., a_{m} -$ is convex (which is immediate) and closed (the proof of this crucial fact also is not dificult).

3. Combining the above facts, we immediately see that

either $a \in A.$ , i.e., (1.2.1.b) holds,

— or there exists x such that $x^{T} a < \operatorname{inf}_{\lambda \geq 0} x^{T} \sum_{i} \lambda_{i} a_{i}$

The latter inf is finite if and only if $x^{T} a_{i} \geq 0$ for all $i,$ and in this case the inf is $0,$ so that the $^{6} \mathrm{or}^{9}$ statement says exactly that there exists x with $a_{i}^{T} x \ge 0, a^{T} x < 0$ , or, which is the same, that (1.2.1.a) does not hold.

Thus, among the statements (1.2.1.a) and the negation of (1.2.1.b) at least one (and, as it is immediately seen, at most one as well) always is valid, which is exactly the equivalence (1.2.1).

- “Advanced” proofs based purely on Linear Algebra facts (see Section B.2.5.A). The advantage of these purely Linear Algebra proofs is that they, in contrast to the outlined separation-based proof, do not use the completeness of $\mathbb{R}^{n}$ as a metric space and thus work when we pass from systems with real coeficients and unknowns to systems with rational (or algebraic) coeficients. As a result, an advanced proof allows to establish the Theorem on Alternative for the case when the coeficients and unknowns in (S), $\mathcal{T}_{I}, \mathcal{T}_{II}$ are restricted to belong to a given “real field” (e.g., are rational).

We formulate here explicitly two very useful principles following from the Theorem on Alternative:

A. A system of linear inequalities

$$
a_{i}^{T} x \Omega_{i} b_{i}, i = 1, \dots, m
$$

has no solutions if and only if one can combine the inequalities of the system in a linear fashion $({\boldsymbol{\mathrm{i.e.}}}$ , multiplying the inequalities by nonnegative weights, adding the results and passing, if necessary, from an inequality $a^{T} x > b$ to the inequality $a^{T} x \geq b)$ to get a contradictory inequality, namely, either the inequality $0^{T} x \ge 1$ , or the inequality $0^{T} x > 0$

B. A linear inequality

$$
a_{0}^{T} x \Omega_{0} b_{0}
$$

is a consequence of a solvable system of linear inequalities

$$
a_{i}^{T} x \Omega_{i} b_{i}, i = 1, \dots, m
$$

if and only if it can be obtained by combining, in a linear fashion, the inequalities of the system and the trivial inequality $0 > - 1$

It should be stressed that the above principles are highly nontrivial and very deep. Consider, e.g., the following system of 4 linear inequalities with two variables u, v:

$$
\begin{array}{l} - 1 \leq u \leq 1 \\ - 1 \leq v \leq 1.\end{array}
$$

From these inequalities it follows that

$$
u^{2} + v^{2} \leq 2,\tag{!}
$$

which in turn implies, by the Cauchy inequality, the linear inequality $u + v \leq 2 \colon$

$$
u + v = 1 \times u + 1 \times v \leq \sqrt{1^{2} + 1^{2}} \sqrt{u^{2} + v^{2}} \leq(\sqrt{2})^{2} = 2.\tag{!!}
$$

The concluding inequality is linear and is a consequence of the original system, but in the demonstration of this fact both steps (!) and (!!) are “highly nonlinear”. It is absolutely unclear a priori why the same consequence can, as it is stated by Principle A, be derived from the system in a linear manner as well [of course it can – it sufices just to add two inequalities $u \leq 1$ and $v \leq 1]$

Note that the Theorem on Alternative and its corollaries A and B heavily exploit the fact that we are speaking about linear inequalities. E.g., consider the following 2 quadratic and 2 linear inequalities with two variables:

$$
\begin{array}{cccc}(a) & u^{2} & \geq & 1; \\(b) & v^{2} & \geq & 1; \\(c) & u & \geq & 0; \\(d) & v & \geq & 0; \end{array}
$$

along with the quadratic inequality

$$
(e) \quad uv \geq 1.
$$

The inequality (e) is clearly a consequence of $(a) -(d)$ . However, if we extend the system of inequalities $(a) \mathrm{~ - ~}(b)$ by all “trivial” (i.e., identically true) linear and quadratic inequalities with 2 variables, like $0 > - 1, u^{2} + v^{2} \geq 0, u^{2} + 2uv + v^{2} \geq 0, u^{2} - uv + v^{2} \geq 0$ , etc., and ask whether (e) can be derived in a linear fashion from the inequalities of the extended system, the answer will be negative. Thus, Principle A fails to be true already for quadratic inequalities (which is a great sorrow – otherwise there were no dificult problems at all!)

We are about to use the Theorem on Alternative to obtain the basic results of the LP duality theory.

(a)

## 1.2.2 Dual to an LP program: the origin

As already mentioned, the motivation for constructing the problem dual to an LP program

$$
c^{*} = \min_{x} \left\{c^{T} x \bigg | Ax - b \geq 0 \right\} \quad \left[A = \left[\begin{array}{l} a_{1}^{T} \\ a_{2}^{T} \\ \dots \\ a_{m}^{T} \end{array} \right] \in{\bf R}^{m \times n} \right]\tag{LP}
$$

is the desire to generate, in a systematic way, lower bounds on the optimal value $c^{*}$ of (LP). An evident way to bound from below a given function $f(x)$ in the domain given by system of inequalities

$$
g_{i}(x) \geq b_{i}, i = 1, \dots, m,\tag{1.2.3}
$$

is ofered by what is called the Lagrange duality and is as follows:

## Lagrange Duality:

- Let us look at all inequalities which can be obtained from (1.2.3) by linear aggregation, $\displaystyle i.e.,$ , at the inequalities of the form

$$
\sum_{i} y_{i} g_{i}(x) \geq \sum_{i} y_{i} b_{i}\tag{1.2.4}
$$

with the “aggregation weights” $y_{i} \geq 0$ . Note that the inequality (1.2.4), due to its origin, is valid on the entire set X of solutions of (1.2.3).

- Depending on the choice of aggregation weights, it may happen that the left hand side in $(1.2.4) \is \leq f(x)$ for all $\boldsymbol{x} \in \mathbb{R}^{n}$ . Whenever it is the case, the right hand side $\sum_{i} y_{i} b_{i}$ of (1.2.4) is a lower bound on $f$ in $X$ .

Indeed, on X the quantity $\sum_{i} y_{i} b_{i}$ is a lower bound on $y_{i} g_{i}(x)$ , and for y in question the latter function of x is everywhere $\leq f(x)$ .

## It follows that

- The optimal value in the problem

$$
\max_{y} \left\{\sum_{i} y_{i} b_{i}: \begin{array}{c} y \geq 0, \\ \sum_{i} y_{i} g_{i}(x) \leq f(x) \forall x \in \mathbb{R}^{n} \end{array} \right.\tag{b}
$$

(1.2.5)

is a lower bound on the values of $f$ on the set of solutions to the system (1.2.3).

Let us look what happens with the Lagrange duality when $f$ and $g_{i}$ are homogeneous linear functions: $f = c^{T} x, g_{i}(x) = a_{i}^{T} x$ . In this case, the requirement (1.2.5.b) merely says that $c = \sum_{i} y_{i} a_{i}$ (or, which is the same, $A^{T} y = c$ due to the origin of $A)$ . Thus, problem (1.2.5) becomes the Linear Programming problem

$$
\max_{y} \left\{b^{T} y: A^{T} y = c, y \geq 0 \right\},\tag{\((\mathrm{LP}^{*})\}
$$

which is nothing but the LP dual of (LP).

By the construction of the dual problem,

[Weak Duality] The optimal value in (LP<sup>∗</sup>) is less than or equal to the optimal value in (LP).

In fact, the “less than or equal $\mathrm{to}^{\dag}$ in the latter statement is “equal”, provided that the optimal value $c^{*}$ in (LP) is a number (i.e., (LP) is feasible and below bounded). To see that this indeed is the case, note that a real a is a lower bound on $c^{*}$ if and only if $c^{T} x \geq a$ whenever $Ax \geq b,$ or, which is the same, if and only if the system of linear inequalities

$$
(\mathcal{S}_{a}): \qquad - c^{T} x > - a, Ax \geq b
$$

has no solution. We know by the Theorem on Alternative that the latter fact means that some other system of linear equalities (more exactly, at least one of a certain pair of systems) does have a solution. More precisely,

(\*) $(S_{a})$ has no solutions if and only if at least one of the following two systems with $m + 1$ unknowns:

$$
\mathcal{T}_{\mathrm{I}}: \qquad \left\{\begin{array}{cccc}(a) & \lambda =(\lambda_{0}, \lambda_{1},..., \lambda_{m}) & \geq & 0; \\(b) & - \lambda_{0} c + \sum_{i = 1}^{m} \lambda_{i} a_{i} & = & 0; \\ \hline(c_{\mathrm{I}}) & - \lambda_{0} a + \sum_{i = 1}^{m} \lambda_{i} b_{i} & \geq & 0; \\(d_{\mathrm{I}}) & \lambda_{0} & > & 0, \end{array} \right.
$$

or

$$
\mathcal{T}_{\mathrm{II}}: \qquad \left\{\begin{array}{ll}(a) & \lambda =(\lambda_{0}, \lambda_{1},..., \lambda_{m}) \geq 0; \\(b) & - \lambda_{0} c - \sum_{i = 1}^{m} \lambda_{i} a_{i} = 0; \\ \hline(c_{\mathrm{II}}) & - \lambda_{0} a - \sum_{i = 1}^{m} \lambda_{i} b_{i} > 0 \end{array} \right.
$$

– has a solution.

Now assume that (LP) is feasible. We claim that under this assumption $(S_{a})$ has no solutions if and only $if \mathcal{T}_{\mathrm{I}}$ has a solution.

The implication ${\mathfrak{s}}_{\mathcal{T}_{\mathrm{I}}}$ has a solution $\begin{array}{cl}{\displaystyle \Rightarrow} &{\displaystyle(S_{a})} \end{array}$ has no solution” is readily given by the above remarks. To verify the inverse implication, assume that $(S_{a})$ has no solutions and the system $Ax \leq b$ has a solution, and let us prove that then $\mathcal{T}_{\mathrm{I}}$ has a solution. If $\mathcal{T}_{\mathrm{I}}$ has no solution, then by $(^{*}) ~{\mathcal{T}}_{\mathrm{II}}$ has a solution and, moreover, $\lambda_{0} = 0$ for (every) solution to $\mathcal{T}_{\mathrm{II}}$ (since a solution to the latter system with $\lambda_{0} > 0$ solves T as well). But the fact that $\mathcal{T}_{\mathrm{II}}$ has a solution λ with $\lambda_{0} = 0$ is independent of the values of a and $c;$ if this fact would take place, it would mean, by the same Theorem on Alternative, that, e.g., the following instance of $(S_{a})$

$$
0^{T} x \geq - 1, Ax \geq b
$$

has no solutions. The latter means that the system $Ax \geq b$ has no solutions – a contradiction with the assumption that (LP) is feasible. ✷

Now, if $\mathcal{T}_{\mathrm{I}}$ has a solution, this system has a solution with $\lambda_{0} = 1$ as well (to see this, pass from a solution $\lambda$ to the one $\lambda / \lambda_{0};$ this construction is well-defined, since $\lambda_{0} > 0$ for every solution to $\pi_{\mathrm{I}})$ . Now, an $(m + 1)$ -dimensional vector $\lambda =(1, y)$ is a solution to $\mathcal{T}_{\mathrm{I}}$ if and only if the m-dimensional vector y solves the system of linear inequalities and equations

$$
\begin{array}{rcl} y & \geq & 0; \\ A^{T} y \equiv \sum_{i = 1}^{m} y_{i} a_{i} & = & c; \\ b^{T} y & \geq & a \end{array}\tag{D}
$$

Summarizing our observations, we come to the following result.

Proposition 1.2.2 Assume that system (D) associated with the LP program (LP) has a solution $(y, a)$ . Then a is a lower bound on the optimal value in (LP). Vice versa, if (LP) is feasible and a is a lower bound on the optimal value of (LP), then a can be extended by a properly chosen m-dimensional vector y to a solution to (D).

We see that the entity responsible for lower bounds on the optimal value of (LP) is the system (D): every solution to the latter system induces a bound of this type, and in the case when (LP) is feasible, all lower bounds can be obtained from solutions to (D). Now note that if (y, a) is a solution to (D), then the pair $(y, b^{T} y)$ also is a solution to the same system, and the lower bound $b^{T} y$ on $c^{*}$ is not worse than the lower bound $a.$ Thus, as far as lower bounds on $c^{*}$ are concerned, we lose nothing by restricting ourselves to the solutions $(y, a)$ of (D) with $a = b^{T} y;$ the best lower bound on $c^{*}$ given by (D) is therefore the optimal value of the problem ma $   z _ { y } \{ b ^ { T } y | A ^ { T } y = c , y \geq 0 \} $ , which is nothing but the dual to (LP) problem (LP<sup>∗</sup>). Note that (LP<sup>∗</sup>) is also a Linear Programming program.

All we know about the dual problem to the moment is the following:

Proposition 1.2.3 Whenever y is a feasible solution to $\left(\mathrm{LP^{*}} \right)$ , the corresponding value of the dual objective $b^{T} y$ is a lower bound on the optimal value $c^{*}$ in (LP). If (LP) is feasible, then for every $a \leq c^{*}$ there exists a feasible solution y of $\left(\mathrm{LP^{*}} \right)$ with $b^{T} y \geq a$

## 1.2.3 The LP Duality Theorem

Proposition 1.2.3 is in fact equivalent to the following

Theorem 1.2.2 [Duality Theorem in Linear Programming] Consider a Linear Programming program

$$
\min_{x} \left\{c^{T} x \mid Ax \geq b \right\}\tag{LP}
$$

along with its dual

$$
\max_{y} \left\{b^{T} y \Big | A^{T} y = c, y \geq 0 \right\}\tag{\((\mathrm{LP}^{*})\}
$$

Then

1) The duality is symmetric: the problem dual to dual is equivalent to the primal;

2) The value of the dual objective at every dual feasible solution is $\leq$ the value of the primal objective at every primal feasible solution

3) The following 5 properties are equivalent to each other:

(i) The primal is feasible and bounded below.

(ii) The dual is feasible and bounded above.

(iii) The primal is solvable.

(iv) The dual is solvable.

(v) Both primal and dual are feasible.

Whenever ${\mathrm{(i)}} \equiv{\mathrm{(ii)}} \equiv{\mathrm{(iii)}} \equiv{\mathrm{(iv)}} \equiv{\mathrm{\equiv}}{\mathrm{(v)}}$ is the case, the optimal values of the primal and the dual problems are equal to each other.

Proof. 1) is quite straightforward: writing the dual problem $\left(\mathrm{LP^{*}} \right)$ in our standard form, we get

$$
\min_{y} \left\{- b^{T} y \bigg | \left[\begin{array}{c} I_{m} \\ A^{T} \\ - A^{T} \end{array} \right] y - \left[\begin{array}{c} 0 \\ - c \\ c \end{array} \right] \geq 0 \right\},
$$

where $I_{m}$ is the m-dimensional unit matrix. Applying the duality transformation to the latter problem, we come to the problem

$$
\max_{\xi, \eta, \zeta} \left\{0^{T} \xi + c^{T} \eta +(- c)^{T} \zeta : \begin{array}{rcl} \xi & \geq & 0 \\ \eta & \geq & 0 \\ \zeta & \geq & 0 \\ \xi - A \eta + A \zeta & = & - b \end{array} \right\},
$$

which is clearly equivalent to (LP) (set $x = \eta - \zeta)$

2) is readily given by Proposition 1.2.3.

3):

$(i){\Rightarrow}(\mathrm{iv})$ : If the primal is feasible and bounded below, its optimal value $c^{*}$ (which of course is a lower bound on itself) can, by Proposition 1.2.3, be (non-strictly) majorized by a quantity $b^{T} y^{*}$ , where $y^{*}$ is a feasible solution to $\left(\mathrm{LP^{*}} \right)$ In the situation in question, of course, $b^{T} y^{*} = c^{*}$ (by already proved item 2)); on the other hand, in view of the same Proposition 1.2.3, the optimal value in the dual is $\leq c^{*}$ . We conclude that the optimal value in the dual is attained and is equal to the optimal value in the primal.

(iv)⇒(ii): evident;

(ii)⇒(iii): This implication, in view of the primal-dual symmetry, follows from the implication $(i){\Rightarrow}(i v)$

(iii)⇒(i): evident.

We have seen that $(i) \equiv(\mathrm{ii}) \equiv(\mathrm{iii}) \equiv(\mathrm{iv})$ and that the first (and consequently each) of these 4 equivalent properties implies that the optimal value in the primal problem is equal to the optimal value in the dual one. All which remains is to prove the equivalence between $(i){-}(i v)$ , on one hand, and (v), on the other hand. This is immediate: $(i){-}(i v)$ , of course, imply (v); vice versa, in the case of (v) the primal is not only feasible, but also bounded below (this is an immediate consequence of the feasibility of the dual problem, see 2)), and (i) follows. ✷

An immediate corollary of the LP Duality Theorem is the following necessary and sufficient optimality condition in LP:

Theorem 1.2.3 [Necessary and sufficient optimality conditions in Linear Programming] Consider an $LP$ program (LP) along with its dual $\left(\mathrm{LP^{*}} \right)$ . A pair $(x, y)$ of primal and dual feasible solutions is comprised of optimal solutions to the respective problems if and only if

$$
y_{i}[Ax - b]_{i} = 0, i = 1, \dots, m,
$$

[complementary slackness]

likewise as if and only if

$$
c^{T} x - b^{T} y = 0
$$

[zero duality gap]

Indeed, the “zero duality gap” optimality condition is an immediate consequence of the fact that the value of primal objective at every primal feasible solution is ≥ the value of the dual objective at every dual feasible solution, while the optimal values in the primal and the dual are equal to each other, see Theorem 1.2.2. The equivalence between the “zero duality $\mathrm{gap}^{\mathrm{, 9}}$ and the “complementary slackness” optimality conditions is given by the following computation: whenever x is primal feasible and y is dual feasible, the products $y_{i}[Ax - b]_{i}$ $i = 1,..., m$ , are nonnegative, while the sum of these products is precisely the duality gap:

$$
y^{T}[Ax - b] =(A^{T} y)^{T} x - b^{T} y = c^{T} x - b^{T} y.
$$

Thus, the duality gap can vanish at a primal-dual feasible pair $(x, y)$ if and only if all products $y_{i}[Ax - b]_{i}$ <sub>i</sub> for this pair are zeros.

## 1.3 Selected Engineering Applications of LP

Linear Programming possesses enormously wide spectrum of applications. Most of them, or at least the vast majority of applications presented in textbooks, have to do with Decision Making. Here we present an instructive sample of applications of LP in Engineering. The “common denominator” of what follows (except for the topic on Support Vector Machines, where we just tell stories) can be summarized as “LP Duality at work.”

## 1.3.1 Sparsity-oriented Signal Processing and $\ell_{1}$ minimization

<sup>1</sup> Let us start with Compressed Sensing which addresses the problem as follows: “in the nature” there exists a signal represented by an n-dimensional vector x. We observe (perhaps, in the presence of observation noise) the image of x under linear transformation $x \mapsto Ax$ , where A is a given m × n sensing matrix; thus, our observation is

$$
y = Ax + \eta \in \mathbb{R}^{m}\tag{1.3.1}
$$

where η is observation noise. Our goal is to recover x from the observed y. The outlined problem is responsible for an extremely wide variety of applications and, depending on a particular application, is studied in different “regimes.” For example, in the traditional Statistics x is interpreted not as a signal, but as the vector of parameters of a “black box” which, given on input a vector $a \in \mathbb{R}^{n}$ , produces output $a^{T} x$ . Given a collection $a^{1},..., a^{m}$ of n-dimensional inputs to the black box and the corresponding outputs (perhaps corrupted by noise) $y_{i} =[a^{i}]^{T} x + \eta_{i}$ we want to recover the vector of parameters x; this is called linear regression problem,. In order to represent this problem in the form of (1.3.1) one should make the row vectors $[a^{i}]^{T}$ the rows of an $m \times n$ matrix, thus getting matrix A, and to set $y =[y_{1};...; y_{m}], \eta =[\eta_{1};...; \eta_{m}]$ . The typical regime here is m $\gg n$ - the number of observations is much larger than the number of parameters to be recovered, and the challenge is to use this “observation redundancy” in order to get rid, to the best extent possible, of the observation noise. In Compressed Sensing the situation is opposite: the regime of interest is $m \ll n$ . At the first glance, this regime seems to be completely hopeless: even with no noise $(\eta = 0)$ , we need to recover a solution x to an underdetermined system of linear equations $y = Ax$ . When the number of variables is greater than the number of observations, the solution to the system either does not exist, or is not unique, and in both cases our goal seems to be unreachable. This indeed is so, unless we have at our disposal some additional information on x. In Compressed Sensing, this additional information is that x is s-sparse — has at most a given number s of nonzero entries. Note that in many applications we indeed can be sure that the true signal x is sparse. Consider, e.g., the following story about signal detection:

There are n locations where signal transmitters could be placed, and m locations with the receivers. The contribution of a signal of unit magnitude originating in location $j$ to the signal measured by receiver i is a known quantity $a_{ij}$ , and signals originating in different locations merely sum up in the receivers; thus, if x is the n-dimensional vector with entries x<sub>j</sub> representing the magnitudes of signals transmitted in locations $j = 1, 2,..., n_{\mathrm{{s}}}$ , then the m-dimensional vector y of (noiseless) measurements of the m receivers is $y = Ax, A \in \mathbb{R}^{m \times n}$ . Given this vector, we intend to recover y.

Now, if the receivers are hydrophones registering noises emitted by submarines in certain part of Atlantic, tentative positions of submarines being discretized with resolution 500 m, the dimension of the vector x (the number of points in the discretization grid) will be in the range of tens of thousands, if not tens of millions. At the same time, the total number of submarines (i.e., nonzero entries in x) can be safely upper-bounded by 50, if not by 20.

It should be added that typical images and audio signals, when represented by their coeficients in properly selected bases<sup>2</sup> admit tight sparse approximations, making sparsity-oriented signal recovery extremely promising, literally revolutionary, technique in, e.g., Medical Imaging, allowing ro reduce by significant factor the acquisition time in procedures like MRI without sacrificing quality of the resulting images<sup>3</sup>

## 1.3.1.1 Sparse recovery from deficient observations

Sparsity changes dramatically our possibilities to recover high-dimensional signals from their low-dimensional linear images: given in advance that x has at most $s \ll$ m nonzero entries, the possibility of exact recovery of x at least from noiseless observations y becomes quite natural. Indeed, let us try to recover x by the following “brute force” search: we inspect, one by one, all subsets I of the index set $\{1,..., n\}$ first the empty set, then n singletons $\{1\},..., \{n\}$ , then $\frac{n(n - 1)}{2}$ 2-element subsets, etc., and each time try to solve the system of linear equations

$$
y = Ax, x_{j} = 0 \text{when} j \notin I;
$$

when arriving for the first time at a solvable system, we terminate and claim that its solution is the true vector x. It is clear that we will terminate before all sets I of cardinality $\le s$ are inspected. It is also easy to show (do it!) that if every 2s distinct columns in A are linearly independent (when $m \geq 2s$ , this indeed is the case for a matrix A in a “general position”<sup>4</sup>), then the procedure is correct — it indeed recovers the true vector x.

A bad news is that the outlined procedure becomes completely impractical already for “small” values of s and n because of the astronomically large number of linear systems we need to process<sup>5</sup>. A partial remedy is as follows. The outlined approach is, essentially, a particular way to solve the optimization problem

$$
\min \{\mathrm{nnz}(x): Ax = y\},\tag{\((*)\}
$$

where $\mathrm{nnz}(x)$ is the number of nonzero entries in a vector x. At the present level of our knowledge, this problem looks completely intractable (in fact, we do not know algorithms solving the problem essentially faster than the brute force search), and there are strong reasons, to be addressed later in our course, to believe that it indeed is intractable. Well, if we do not know how to minimize under linear constraints the “bad” objective nnz(x), let us “approximate” this objective with one which we do know how to minimize. The true objective is separable: nnz $\textstyle(x) = \sum_{i = 1}^{n} \xi(x_{j})$ , where $\xi(s)$ is the function on the axis equal to 0 at the origin and equal to 1 otherwise. As a matter of fact, the separable functions which we do know how to minimize under linear constraints are sums of convex functions of $x_{1},..., x_{n} \^{6}$ . The most natural candidate to the role of convex approximation of $\xi(s)$ is $| s |;$ with this approximation, (∗) converts into the $\ell_{1}$ -minimization problem

$$
\min_{x} \left\{\| x \|_{1} := \sum_{i = 1}^{n} | x_{j} |: Ax = y \right\},\tag{1.3.2}
$$

which is equivalent to the LP program

$$
\min_{x, w} \left\{\sum_{i = 1}^{n} w_{j}: Ax = y, - w_{j} \leq x_{j} \leq w_{j}, 1 \leq j \leq n \right\}.
$$

For the time being, we were focusing on the (unrealistic!) case of noiseless observations $\eta = 0$ . A realistic model is that $\eta \neq 0$ . How to proceed in this case, depends on what we know on η. In the simplest case of “unknown but small noise” one assumes that, say, the Euclidean norm $\| \cdot \|_{2}$ of η is upper-bounded by a given “noise level ${\mathrm{~ \# ~}} \delta \colon \ \| \eta \|_{2} \leq \delta$ . In this case, the $\ell_{1}$ recovery usually takes the form

$$
\widehat{x} = \underset{w}{\operatorname{Argmin}} \left\{\| w \|_{1}: \| Aw - y \|_{2} \leq \delta \right\}\tag{1.3.3}
$$

Now we cannot hope that our recovery $\widehat{x}$ will be exactly equal to the true s-sparse signal x, but perhaps may hope that x is close to x when δ is small.

Note that (1.3.3) is not an LP program anymore<sup>7</sup>, but still is a nice convex optimization program which can be solved to high accuracy even for reasonable large $m, n.$

## 1.3.1.2 s-goodness and nullspace property

Let us say that a sensing matrix A is s-good, if in the noiseless case $\ell_{1}$ minimization (1.3.2) recovers correctly all s-sparse signals x. It is easy to say when this is the case: the necessary and sufficient condition for A to be s-good is the following nullspace property:

$$
\forall(z \in \mathbb{R}^{n}: Az = 0, z \neq 0, I \subset \{1,..., n\}, \mathrm{Card}(I) \leq s): \sum_{i \in I} | z_{i} | < \frac{1}{2} \| z \|_{1}.\tag{1.3.4}
$$

In other words, for every nonzero vector $z \in \mathrm{Ker} A$ , the sum $\| z \|_{s, 1}$ of the s largest magnitudes of entries in z should be strictly less than half of the sum of magnitudes of all entries.

The necessity and suficiency of the nullspace property for s-goodness of A can be derived “from scratch” — from the fact that s-goodness means that every s-sparse signal x should be the unique optimal solution to the associated LP min ${ . w \{ \| w \| _ { 1 } } $ $Aw = Ax\}$ combined with the LP optimality conditions. Another option, which we prefer to use here, is to guess the condition and then to prove that its indeed is necessary and sufficient for s-goodness of A. The necessity is evident: if the nullspace property does not take place, then there exists 0 $\neq z \in$ KerA and s-element subset I of the index set $\{1,..., n\}$ such that if J is the complement of I in $\{1,..., n\}$ , then the vector $z_{I}$ obtained from z by zeroing out all entries with indexes not in I along with the vector $z_{J}$ obtained from z by zeroing out all entries with indexes not in J satisfy the relation $\begin{array}{r}{\| z_{I} \|_{1} \geq \frac{1}{2} \| z \|_{1} = \frac{1}{2}[\| z_{I} \|_{1} + \| z_{J} \|_{1}]} \end{array}$ , that is,

$$
\left\| z_{I} \right\|_{1} \geq \left\| z_{J} \right\|_{1}.
$$

Since $Az = 0$ , we have $Az_{I} = A[- z_{J}]$ , and we conclude that the s-sparse vector $z_{I}$ is not the unique optimal solution to the LP min $\boldsymbol{\mathrm{1}}_{w} \left\{\| w \|_{1} : Aw = Az_{I} \right\}$ , since $- z_{J}$ is feasible solution to the program with the value of the objective at least as good as the one at $z_{J}$ , on one hand, and the solution $- z_{J}$ is different from $z_{I}$ (since otherwise we should have $z_{I} = z_{J} = 0$ , whence $z = 0$ , which is not the case) on the other hand.

To prove that the nullspace property is sufficient for A to be s-good is equally easy: indeed, assume that this property does take place, and let x be s-sparse signal, so that the indexes of nonzero entries in x are contained in an s-element subset I of $\{1,..., n\}$ , and let us prove that if $\widehat{x}$ is an optimal solution to the LP (1.3.2), then ${\widehat{x}} = x$ . Indeed, denoting by $J$ the complement of $I,$ setting $z ={\widehat{x}} - x$ and assuming that $z \neq 0$ , we have $Az = 0$ . Further, in the same notation as above we have

$$
\| x_{I} \|_{1} - \| \widehat{x}_{I} \|_{1} \leq \| z_{I} \|_{1} < \| z_{J} \|_{1} = \| \widehat{x}_{J} \|_{1}
$$

(the first inequality is due to the Triangle inequality, the second – due to the nullspace property, the equality is due to $x_{J} = 0$ , that is, $z_{J} = \widehat{x}_{J})$ , whence $\| x \|_{1} = \| x_{I} \|_{1} <$ $\| \widehat{\boldsymbol{x}}_{I} \|_{1} + \| \widehat{\boldsymbol{x}}_{J} \| = \| \widehat{\boldsymbol{x}} \|_{1}$ , which contradicts the origin of x.

## 1.3.1.3 From nullspace property to error bounds for imperfect $\ell_{1}$ recovery

The nullspace property establishes necessary and sufficient condition for the validity of $\ell_{1}$ recovery in the noiseless case, whatever be the s-sparse true signal. We are about to show that after appropriate quantification, this property implies meaningful error bounds in the case of imperfect recovery (presence of observation noise, near-, but not exact, s-sparsity of the true signal, approximate minimization in (1.3.3).

The aforementioned “proper quantification” of the nullspace property is suggested by the LP duality theory and is as follows. Let $V_{s}$ be the set of all vectors $v \in \mathbb{R}^{n}$ with at most s nonzero entries, equal ±1 each. Observing that the sum $\| z \|_{s, 1}$ of the s largest magnitudes of entries in a vector z is nothing that $\operatorname{max}_{v \in V_{s}} v^{\bar{T}} z$ , the nullspace property says that the optimal value in the LP program

$$
\gamma(v) = \max_{z} \{v^{T} z: Az = 0, \| z \|_{1} \leq 1\}\tag{\((P_{v})\}
$$

is $< 1 / 2$ whenever $v \in V_{s}$ (why?). Applying the LP Duality Theorem, we get, after straightforward simplifications of the dual, that

$$
\gamma(v) = \min_{h} \| A^{T} h - v \|_{\infty}.
$$

Denoting by $h_{v}$ an optimal solution to the right hand side LP, let us set

$$
\gamma := \gamma_{s}(A) = \max_{v \in V_{s}} \gamma(v), \beta_{s}(A) = \max_{v \in V_{s}} \| h_{v} \|_{2}.
$$

Observe that the maxima in question are well defined reals, since $V_{s}$ is a finite set, and that the nullspace property is nothing but the relation

$$
\gamma_{s}(A) < 1 / 2.\tag{1.3.5}
$$

Observe also that we have the following relation:

$$
\forall z \in \mathbb{R}^{n}: \| z \|_{s, 1} \leq \beta_{s}(A) \| Az \|_{2} + \gamma_{s}(A) \| z \|_{1}.\tag{1.3.6}
$$

Indeed, for $v \in V_{s}$ and $z \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rl} v^{T} z = &[v - A^{T} h_{v}]^{T} z +[A^{T} h_{v}]^{T} z \leq \| v - A^{T} h_{v} \|_{\infty} \| z \|_{1} + h_{v}^{T} Az \\ \leq & \gamma(v) \| z \|_{1} + \| h_{v} \|_{2} \| Az \|_{2} \leq \gamma_{s}(A) \| z \|_{1} + \beta_{s}(A) \| Az \|_{2}.\end{array}
$$

Since $\| z \|_{s, 1} = \operatorname{max}_{v \in V_{s}} v^{T} z$ , the resulting inequality implies (1.3.6).

Now consider imperfect $\ell_{1}$ recovery $x \mapsto y \mapsto{\widehat{x}}$ , where

1. $x \in \mathbb{R}^{n}$ can be approximated within some accuracy $\rho,$ measured in the $\ell_{1}$ norm, by an s-sparse signal, or, which is the same,

$$
\| x - x^{s} \|_{1} \leq \rho
$$

where $x^{s}$ is the best s-sparse approximation of x (to get this approximation, one zeros out all but the s largest in magnitude entries in $x,$ the ties, if any, being resolved arbitrarily);

2. y is a noisy observation of x:

$$
y = Ax + \eta, \| \eta \|_{2} \leq \delta;
$$

3. x is a µ-suboptimal and $\epsilon$-feasible solution to (1.3.3), specifically,

$$
\| \widehat{x} \|_{1} \leq \mu + \min_{w} \left\{\| w \|_{1}: \| Aw - y \|_{2} \leq \delta \right\} \& \| A \widehat{x} - y \|_{2} \leq \epsilon.
$$

Theorem 1.3.1 Let A, s be given, and let the relation

$$
\forall z: \| z \|_{s, 1} \leq \beta \| Az \|_{2} + \gamma \| z \|_{1}\tag{1.3.7}
$$

holds true with some parameters $\gamma < 1 / 2$ and $\beta < \infty$ (as definitely is the case when A is s-good, $\gamma = \gamma_{s}(A)$ and $\beta = \beta_{s}(A))$ . The for the outlined imperfect $\ell_{1}$ recovery the following error bound holds true:

$$
\| \widehat{x} - x \|_{1} \leq \frac{2 \beta(\delta + \epsilon) + \mu + 2 \rho}{1 - 2 \gamma},\tag{1.3.8}
$$

$i.e.$ , the recovery error is of order of the maximum of the “imperfections” mentioned in $1) ~ -$ 3).

Proof. Let I be the set of indexes of the s largest in magnitude entries in $x, \J$ be the complement of I, and $z ~ = ~{\widehat{x}} \cdot - ~ x$ Observing that $x$ is feasible for (1.3.3), we have $\operatorname{min}_{w} \left\{\| w \|_{1} : \| Aw - y \|_{2} \leq \delta \right\} \leq \| x \|_{1}$ , whence

$$
\| \widehat{x} \|_{1} \leq \mu + \| x \|_{1},
$$

or, in the same notation as above,

$$
\underbrace{\| x_{I} \|_{1} - \| \widehat{x}_{I} \|_{1}}_{\leq \| z_{I} \|_{1}} \geq \underbrace{\| \widehat{x}_{J} \|_{1} - \| x_{J} \|_{1}}_{\geq \| z_{J} \|_{1} - 2 \| x_{J} \|_{1}} - \mu
$$

whence

$$
\left\| z_{J} \right\|_{1} \leq \mu + \left\| z_{I} \right\|_{1} + 2 \left\| x_{J} \right\|_{1},
$$

so that

$$
\| z \|_{1} \leq \mu + 2 \| z_{I} \|_{1} + 2 \| x_{J} \|_{1}.\tag{a}
$$

We further have

$$
\left\| z_{I} \right\|_{1} \leq \beta \| Az \|_{2} + \gamma \| z \|_{1},
$$

which combines with (a) to imply that

$$
\left\| z_{I} \right\|_{1} \leq \beta \| Az \|_{2} + \gamma[\mu + 2 \| z_{I} \|_{1} + 2 \| x_{J} \|_{1}],
$$

whence, in view of $\gamma < 1 / 2$ and due to $\| x_{J} \|_{1} = \rho_{\mathrm{\ell}}$

$$
\left\| z_{I} \right\|_{1} \leq \frac{1}{1 - 2 \gamma} \left[\beta \| Az \|_{2} + \gamma[\mu + 2 \rho] \right].
$$

Combining this bound with (a), we get

$$
\| z \|_{1} \leq \mu + 2 \rho + \frac{2}{1 - 2 \gamma}[\beta \| Az \|_{2} + \gamma[\mu + 2 \rho]].
$$

Recalling that $z ={\widehat{x}} - x$ and that therefore $\| Az \|_{2} \le \| Ax - y \|_{2} + \| A \widehat{x} - y \|_{2} \le \delta + \epsilon$ , we finally get

$$
\| \widehat{x} - x \|_{1} \leq \mu + 2 \rho + \frac{2}{1 - 2 \gamma}[\beta[\delta + \epsilon] + \gamma[\mu + 2 \rho]].
$$

## 1.3.1.4 Compressed Sensing: Limits of performance

The Compressed Sensing theory demonstrates that

1. For given m, n with $m \ll n{\mathrm{~(say, ~}} m / n \leq 1 / 2{\mathrm{)}}$ , there exist $m \times n$ sensing matrices which are s-good for the values of s “nearly as large as $m, "$ specifically, for $\begin{array}{r}{s \leq O(1) \frac{m}{\ln(n / m)}} \end{array}^{8}$ Moreover, there are natural families of matrices where this level of goodness “is a rule.” $\mathrm{E.g.}$ , when drawing an $m \times n$ matrix at random from the Gaussian or the ±1 distributions (i.e., filling the matrix with independent realizations of a random variable which is either Gaussian (zero mean, variance $1 / m)$ , or takes values $\pm 1 / \sqrt{m}$ with probabilities $0.5^{\mathrm{~ 9 ~}}$ , the result will be s-good, for the outlined value of $s,$ with probability approaching 1 as m and n grow. Moreover, for the indicated values of s and randomly selected matrices A, one has $\beta_{s}(A) \leq O(1) \sqrt{s}$ with probability approaching one when m, n grow.

2. The above results can be considered as a good news. A bad news is, that we do not know how to check eficiently, given an s and a sensing matrix A, that the matrix is sgood. Indeed, we know that a necessary and sufficient condition for s-goodness of A is the nullspace property (1.3.5); this, however, does not help, since the quantity $\gamma_{s}(A)$ is dificult to compute: computing it by definition requires solving $2^{s} C_{s}^{n}$ LP programs $(P_{v})$ $v \in V_{s}$ , which is an astronomic number already for moderate n unless s is really small, like 1 or 2. And no alternative efficient way to compute $\gamma_{s}(A)$ is known.

As a matter of fact, not only we do not know how to check s-goodness eficiently; there still is no efficient recipe allowing to build, given $m,$ an $m \ \times$ 2m matrix A which is provably s-good for s larger than $O(1) \sqrt{m} - \mathrm{~ a ~}$ much smaller “level of goodness” then the one $(s = O(1) m)$ promised by theory for typical randomly generated matrices.<sup>10</sup> The “common life” analogy of this pitiful situation would be as follows: you know that with probability at least 0.9, a brick in your wall is made of gold, and at the same time, you do not know how to tell a golden brick from a usual one.<sup>11</sup>

## 1.3.1.5 Verifiable sufficient conditions for s-goodness

As it was already mentioned, we do not know efficient ways to check s-goodness of a given sensing matrix in the case when s is not really small. The dificulty here is the standard: to certify sgoodness, we should verify (1.3.5), and the most natural way to do it, based on computing $\gamma_{s}(A)$ ， is blocked: by definition,

$$
\gamma_{s}(A) = \max_{z} \left\{\| z \|_{s, 1}: Az = 0, \| z \|_{1} \leq 1 \right\}\tag{1.3.9}
$$

that is, $\gamma_{s}(A)$ is the maximum of a convex function $\| z \|_{s, 1}$ over the convex set $\{z : Az = 0, \| z \|_{\leq} 1\}$ Although both the function and the set are simple, maximizing of convex function over a convex set typically is dificult. The only notable exception here is the case of maximizing a convex function $f$ over a convex set X given as the convex hull of a finite set: $X = \operatorname{Conv} \{v^{1},..., v^{N}\}$ . In this case, a maximizer of $f$ on the finite set $\{v^{1},..., v^{N}\}$ (this maximizer can be found by brute force computation of the values of $f$ at $v^{i})$ is the maximizer of $f$ over the entire X (check it yourself or see Section C.5).

Given that the nullspace property “as it $\mathrm{is}^{\dag}$ is dificult to check, we can look for “the second best thing” — eficiently computable upper and lower bounds on the “goodness” $s_{*}(A)$ of A $(\mathrm{i.e.}$ , on the largest s for which A is s-good).

Let us start with efficient lower bounding of $s_{*}(A)$ , that is, with eficiently verifiable sufficient conditions for s-goodness. One way to derive such a condition is to specify an eficiently computable upper bound $\widehat{\gamma}_{s}(A)$ on $\gamma_{s}(A)$ . With such a bound at our disposal, the eficiently verifiable condition $\widehat{\gamma}_{s}(A) < 1 / 2$ clearly will be a sufficient condition for the validity of (1.3.5).

The question is, how to find an eficiently computable upper bound on $\gamma_{s}(A)$ , and here is

one of the options:

$$
\begin{array}{rl} &{\gamma_{s}(A) = \max_{z} \left\{\max_{v \in V_{s}} v^{T} z: Az = 0, \| z \|_{1} \leq 1 \right\}} \\{\Rightarrow \forall H \in \mathbb{R}^{m \times n}:} &{\gamma_{s}(A) = \max_{z} \left\{\max_{v \in V_{s}} v^{T}[1 - H^{T} A] z: Az = 0, \| z \|_{1} \leq 1 \right\}} \\ &{\leq \max_{z} \left\{\max_{v \in V_{s}} v^{T}[1 - H^{T} A] z: \| z \|_{1} \leq 1 \right\}} \\ &{= \max_{z \in Z} \|[I - H^{T} A] z \|_{s, 1}, Z = \{z: \| z \|_{1} \leq 1\}.} \end{array}
$$

We see that whatever be “design parameter” $H \in \mathbb{R}^{m \times n}$ , the quantity $\gamma_{s}(A)$ does not exceed the maximum of a convex function $\|[I - H^{T} A] z \|_{s, 1}$ of z over the unit $\ell_{1}{\mathrm{- ball}} Z$ . But the latter set is perfectly well suited for maximizing convex functions: it is the convex hull of a small (just 2n points, ± basic orths) set. We end up with

$$
\forall H \in \mathbb{R}^{m \times n}: \gamma_{s}(A) \leq \max_{z \in Z} \|[I - H^{T} A] z \|_{s, 1} = \max_{1 \leq j \leq n} \| \mathrm{Col}_{j}[I - H^{T} A] \|_{s, 1},
$$

where $\operatorname{Col}_{j}(B)$ denotes j-th column of a matrix B. We conclude that

$$
\gamma_{s}(A) \leq \widehat{\gamma}_{s}(A) := \min_{H} \underbrace{\max_{j} \| \operatorname{Col}_{j}[I - H^{T} A] \|_{s, 1}}_{\Psi(H)}\tag{1.3.10}
$$

The function $\Psi(H)$ is eficiently computable and convex, this is why its minimization can be carried out eficiently. Thus, $\widehat{\gamma}_{s}(A)$ is an eficiently computable upper bound on $\gamma_{s}(A)$

Some instructive remarks are in order.

1. The trick which led us to $\widehat{\gamma}_{s}(A)$ is applicable to bounding from above the maximum of a convex function $f$ over the set X of the form $\{x \in \operatorname{Conv} \{v^{1},..., v^{N}\} : Ax = 0\}$ (i.e., over the intersection of an “easy for convex maximization” domain and a linear subspace. The trick is merely to note that if A is $m \times n,$ , then for every $H \in \mathbb{R}^{m \times n}$ one has

$$
\max_{x} \left\{f(x): x \in \operatorname{Conv} \{v^{1}, \dots, v^{N}\}, Ax = 0 \right\} \leq \max_{1 \leq i \leq N} f([I - H^{T} Ax] v^{i})\tag{!}
$$

Indeed, a feasible solution x to the left hand side optimization problem can be represented as a convex combination $\sum_{i} \lambda_{i}{v}^{i}$ , and since $Ax = 0$ , we have also $\begin{array}{r}{x = \sum_{i} \lambda_{i}[I - H^{T} A] v^{i};} \end{array}$ since f is convex, we have therefore $f(x) \leq$ max $f([I - H^{T} A] v^{i})$ , and (!) follows. Since (!) i takes place for every $H$ , we arrive at

$$
\max_{x} \left\{f(x): x \in \mathrm{Conv} \{v^{1}, \dots, v^{N}\}, Ax = 0 \right\} \leq \widehat{\gamma} := \max_{1 < i < N} f([I - H^{T} A] v^{i}),
$$

and, same as above, $\widehat{\gamma}$ is eficiently computable, provided that f is eficiently computable convex function.

2. The eficiently computable upper bound $\widehat{\gamma}_{s}(A)$ is polyhedrally representable — it is the optimal value in an explicit LP program. To derive this problem, we start with important by itself polyhedral representation of the function $\| z \|_{s, 1}.$

Lemma 1.3.1 For every $z \in \mathbb{R}^{n}$ and integer $s \leq n$ , we have

$$
\| z \|_{s, 1} = \min_{w, t} \left\{st + \sum_{i = 1}^{n} w_{i}: | z_{i} | \leq t + w_{i}, 1 \leq i \leq n, w \geq 0 \right\}.\tag{1.3.11}
$$

Proof. One way to get (1.3.11) is to note that $\Vert z \Vert_{s, 1} = \operatorname{max}_{v \in V_{s}} v^{T} z = \operatorname{max}_{v \in \mathrm{Conv}(V_{s})} v^{T} z$ and to verify that the convex hull of the set $V_{s}$ is exactly the polytope $\mathcal{V}_{s} = \{v \in \mathbb{R}^{n} : | v_{i} | \leq$ $1 \forall i, \textstyle \sum_{i} | v_{i} | \leq s\}$ (or, which is the same, to verify that the vertices of the latter polytope are exactly the vectors from $V_{s})$ . With this verification at our disposal, we get

$$
\| z \|_{s, 1} = \max_{v} \left\{v^{T} z: | v_{i} | \leq 1 \forall i, \sum_{i} | v_{i} | \leq s \right\};
$$

applying LP Duality, we get the representation (1.3.11). A shortcoming of the outlined approach is that one indeed should prove that the extreme points of $\mathcal{V}_{s}$ are exactly the points from $V_{s};$ this is a relatively easy exercise which we strongly recommend to do. We, however, prefer to demonstrate (1.3.11) directly. Indeed, if $(w, t)$ is feasible for (1.3.11), then $| z_{i} | \leq w_{i} + t$ whence the sum of the s largest magnitudes of entries in z does not exceed st plus the sum of the corresponding s entries in w, and thus – since w is nonnegative – does not exceed $st + \textstyle \sum_{i} w_{i}$ . Thus, the right hand side in (1.3.11) is $\geq$ the left hand side. On the other hand, let $| z_{i_{1}} | \geq | z_{i_{2}} | \geq \ldots \geq | z_{i_{s}} |$ are the s largest magnitudes of entries in $z ~ \left(\mathrm{so} \right.$ that $i_{1},..., i_{s}$ are distinct from each other), and let $t = | z_{i_{s}} |, w_{i} = \operatorname{max}[| z_{i} | - t, 0]$ . It is immediately seen that $(t, w)$ is feasible for the right hand side problem in (1.3.11) and that st $+ \textstyle \sum_{i} w_{i} = \sum_{j = 1}^{s} | z_{i_{j}} | = \| z \|_{s, 1}$ . Thus, the right hand side in (1.3.11) is $\leq$ the left hand side. ✷

Lemma 1.3.1 straightforwardly leads to the following polyhedral representation of $\widehat{\gamma}_{s}(A)$

$$
\begin{array}{rcl} \widehat{\gamma}_{s}(A) & := & \underset{H}{\min} \underset{j}{\max} \| \mathrm{Col}_{j}[I - H^{T} A] \|_{s, 1} \\ & = & \underset{H, w^{j}, t^{j}, \tau}{\min} \left\{\tau : \begin{array}{l} - w_{i}^{j} - t^{j} \leq[I - H^{T} A]_{ij} \leq w_{i}^{j} + t^{j} \forall i, j \\ w^{j} \geq 0 \forall j, st^{j} + \sum_{i} w_{i}^{j} \leq \tau \forall j \end{array} \right\}.\end{array}
$$

3. The quantity $\widehat{\gamma}_{1}(A)$ is exactly equal to $\gamma_{1}(A)$ rather than to be an upper bound on the latter quantity.

Indeed, we have

$$
\gamma_{1}(A) = \max_{i} \max_{z} \left\{| z_{i} |: Az = 0, \| z \|_{1} \leq 1 \right\} \max_{i} \underbrace{\max_{z} \left\{z_{i} : Az = 0, \| z \|_{1} \leq 1 \right\}}_{\gamma_{i}}
$$

Applying LP Duality, we get

$$
\gamma_{i} = \min_{h} \| e_{i} - A^{T} h \|_{\infty},\tag{\((P_{i})\}
$$

where $e_{i}$ are the standard basic orths in $\mathbb{R}^{n}$ . Denoting by $h^{i}$ optimal solutions to the latter problem and setting $H =[H^{1},..., h^{n}]$ , we get

$$
\begin{array}{rl} \gamma_{1}(A) = & \max_{i} \gamma_{i} = \max_{i} \| e_{i} - A^{T} h^{i} \|_{\infty} = \max_{i, j} |[I - A^{T} h^{i}]_{j} | \\ = & \max_{i, j} |[I - A^{T} H]_{ij} | = \max_{i, j} |[I - H^{T} A]_{ij} | \\ = & \max_{i} \| \mathrm{Col}_{j}[I - H^{T} A] \|_{1, 1} \\ \geq & \widehat{\gamma}_{1}(A); \end{array}
$$

since the opposite inequality $\gamma_{1}(A) \leq{\widehat{\gamma}}_{1}(A)$ definitely holds true, we conclude that

$$
\widehat{\gamma}_{1}(A) = \gamma_{1}(A) = \min_{H} \max_{i, j} |[I - H^{T} A]_{ij} |.
$$

Observe that an optimal solution H to the latter problem can be found column by column, with j-th column $h^{j}$ of H being an optimal solution to the LP $(P_{j})$ ; this is in a nice contrast with computing $\widehat{\gamma}_{s}(A)$ for $s > 1$ , where we should solve a single LP with $O(n^{2})$ variables and constraints, which is typically much more time consuming that solving $O(n)$ LP’s with $O(n)$ variables and constraints each, as it is the case when computing $\widehat{\gamma}_{1}(A)$

Observe also that if $p, q$ are positive integers, then for every vector z one has $\| z \|_{pq, 1} \leq$ $q \| z \|_{p, 1}$ , and in particular $\| z \|_{s, 1} \leq s \| z \|_{1, 1} = s \| z \|_{\infty}$ . It follows that if H is such that $\widehat{\gamma}_{p}(A) = \operatorname{max}_{i} \| \mathrm{Col}_{j}[I - H^{T} A] \|_{p, 1}$ , then $\widehat{\gamma}_{pq}(A) \leq q \operatorname{max}_{i} \| \mathrm{Col}_{j}[I - H^{T} A] \|_{p, 1} \leq q \widehat{\gamma}_{p}(A)$ . In 1 j particular,

$$
\widehat{\gamma}_{s}(A) \leq s \widehat{\gamma}_{1}(A),
$$

meaning that the easy-to-verify condition

$$
\widehat{\gamma}_{1}(A) < \frac{1}{2s}
$$

is sufficient for the validity of the condition

$$
\widehat{\gamma}_{s}(A) < 1 / 2
$$

and thus is sufficient for s-goodness of A.

4. Assume that A and s are such that s-goodness of A can be certified via our verifiable sufficient condition, that is, we can point out an $m \times n$ matrix H such that

$$
\gamma := \max_{j} \| \operatorname{Col}_{j}[I - H^{T} A] \|_{s, 1} < 1 / 2.
$$

Now, for every $n \times n$ matrix $B{\mathrm{,}}$ , any norm $\| \cdot \|$ on $\mathbb{R}^{n}$ and every vector $z \in \mathbb{R}^{n}$ we clearly have

$$
\| Bz \| \leq \left[\max_{j} \| \operatorname{Col}_{j}[B] \| \right] \| z \|_{1}
$$

(why?) Therefore form the definition of $\gamma$ , for every vector z we have $\|[I - H^{T} A] z \|_{s, 1} \leq$ $\gamma \| z \|_{1}$ , so that

$$
\| z \|_{s, 1} \leq \| H^{T} Az \|_{s, 1} + \|[I - H^{T} A] z \|_{s, 1} \leq \left[s \max_{j} \| \mathrm{Col}_{j}[H] \|_{2} \right] \| Az \|_{2} + \gamma \| z \|_{1},
$$

meaning that H certifies not only the s-goodness of $A,$ , but also an inequality of the form (1.3.7) and thus – the associated error bound (1.3.8) for imperfect $\ell_{1}$ recovery.

## 1.3.2 Supervised Binary Machine Learning via LP Support Vector Machines

Imagine that we have a source of feature vectors — collections x of n measurements representing, $\mathrm{e.g.}$ , the results of n medical tests taken from patients, and a patient can be afected, or not afected, by a particular illness. “In reali $\mathrm{ty, \vec{\Omega}}$ these feature vectors x go along with labels y taking values ±1; in our example, the label −1 says that the patient whose test results are recorded in the feature vector x does not have the illness in question, while the label +1 means that the patient is ill.

We assume that there is certain dependence between the feature vectors and the labels, and our goal is to predict, given a feature vector alone, the value of the label. What we have at our disposal is a training sample $(x^{i}, y^{i}), 1 \leq i \leq N$ of examples $(x^{i}, y^{i})$ where we know both the feature vector and the label; given this sample, we want to build a classifier – a function $f(x)$ on the space of feature vectors x taking values ±1 – which we intend to use to predict, given the value of a new feature vector, the value of the corresponding label. In our example this setup reads: we are given medical records containing both the results of medical tests and the diagnoses of N patients; given this data, we want to learn how to predict the diagnosis given the results of the tests taken from a new patient.

The simplest predictors we can think about are just the “linear” ones looking as follows. We fix an Affine form $z^{T} x + b$ of a feature vector, choose a positive threshold γ and say that if the value of the form at a feature vector x is “well positive” – is $\geq \gamma -$ then the proposed label for x is +1; similarly, if the value of the form at x is “well negative ${\bf \ddot{\Phi}}^{59} - \bf \dot{1} S \le - \boldsymbol{\gamma}$ , then the proposed label will be −1. In the “gray area $\because - \gamma < z^{T} x + b < \gamma$ we decline to classify. Noting that the actual value of the threshold is of no importance (to compensate a change in the threshold by certain factor, it sufices to multiply by this factor both z and b, without afecting the resulting classification), we from now on normalize the situation by setting the threshold to the value 1.

Now, we have explained how a linear classifier works, but where from to take it? An intuitively appealing idea is to use the training sample in order to “train” our potential classifier – to choose z and b in a way which ensures correct classification of the examples in the sample. This amounts to solving the system of linear inequalities

$$
z^{T} x^{i} + b \geq 1 \forall(i \leq N: y^{i} = + 1) \& z^{T} x^{i} + b \leq - 1 \forall(i: y^{i} = - 1),
$$

which can be written equivalently as

$$
y^{i}(z_{i}^{T} x^{i} + b) \geq 1 \forall i = 1, \dots, N.
$$

Geometrically speaking, we want to find a “stripe”

$$
- 1 < z^{T} x + b < 1\tag{\((*)\}
$$

between two parallel hyperplanes $\{x : z^{T} x + b = - 1\}$ and $\{x : z^{T} x + b = 1\}$ such that all “positive examples” (those with the label +1) from the training sample are on one side of this stripe, while all negative (the label −1) examples from the sample are on the other side of the stripe. With this approach, it is natural to look for the “thickest” stripe separating the positive and the negative examples. Since the geometric width of the stripe is $\frac{2}{\sqrt{z^{T} z}} \ \mathrm{(why ?)}$ , this amounts to solving the optimization program

$$
\min_{z, b} \left\{\| z \|_{2} := \sqrt{z^{T} z}: y^{i}(z^{T} x^{i} + b) \geq 1, 1 \leq i \leq N \right\};\tag{1.3.12}
$$

The latter problem, of course, not necessarily is feasible: it well can happen that it is impossible to separate the positive and the negative examples in the training sample by a stripe between two parallel hyperplanes. To handle this possibility, we allow for classification errors and minimize a weighted sum of $\| w \|_{2}$ and total penalty for these errors. Since the absence of classification penalty at an example $(x^{i}, y^{i})$ in outer context is equivalent to the validity of the inequality $y^{i}(w^{T} x^{i} + b) \geq 1$ , the most natural penalty for misclassification of the example is max[1 − $y^{i}(z^{T} x^{i} + b), 0]$ . With this in mind, the problem of building “the best on the training sample” classifier becomes the optimization problem

$$
\min_{z, b} \left\{\| z \|_{2} + \lambda \sum_{i = 1}^{N} \max[1 - y^{i}(z^{T} x^{i} + b), 0] \right\},\tag{1.3.13}
$$

where $\lambda > 0$ is responsible for the “compromise” between the width of the stripe (∗) and the “separation quality” of this stripe; how to choose the value of this parameter, this is an additional story we do not touch here. Note that the outlined approach to building classifiers is the most basic and the most simplistic version of what in Machine Learning is called “Support Vector Machines.”

Now, (1.3.13) is not an LO program: we know how to get rid of nonlinearities $\mathrm{max}[1 \mathrm{~ - ~}$ $y^{i}(w^{T} x^{i} + b), 0]$ by adding slack variables and linear constraints, but we cannot get rid of the nonlinearity brought by the term $\left.{z} \right._{2}$ . Well, there are situations in Machine Learning where it makes sense to get rid of this term by “brute force,” specifically, by replacing the $\| \cdot \|_{2}$ with $\| \cdot \|_{1}$ The rationale behind this “brute force” action is as follows. The dimension n of the feature vectors can be large, In our medical example, it could be in the range of tens, which perhaps is “not large;” but think about digitalized images of handwritten letters, where we want to distinguish between handwritten letters $" \mathrm{A}^{\prime \}$ and ${}^{,,} \mathrm{B};{}^{,,}$ here the dimension of x can well be in the range of thousands, if not millions. Now, it would be highly desirable to design a good classifier with sparse vector of weights $z,$ and there are several reasons for this desire. First, intuition says that a good on the training sample classifier which takes into account just 3 of the features should be more “robust” than a classifier which ensures equally good classification of the training examples, but uses for this purpose 10,000 features; we have all reasons to believe that the first classifier indeed “goes to the point,” while the second one adjusts itself to random, irrelevant for the “true classification,” properties of the training sample. Second, to have a good classifier which uses small number of features is definitely better than to have an equally good classifier which uses a large number of them (in our medical example: the “predictive power” being equal, we definitely would prefer predicting diagnosis via the results of 3 tests to predicting via the results of 20 tests). Finally, if it is possible to classify well via a small number of features, we hopefully have good chances to understand the mechanism of the dependencies between these measured features and the feature which presence/absence we intend to predict — it usually is much easier to understand interaction between 2-3 features than between 2,000- 3,000 of them. Now, the SVMs (1.3.12), (1.3.13) are not well suited for carrying out the outlined feature selection task, since minimizing $\Vert{z} \Vert_{2}$ norm under constraints on z (this is what explicitly goes on in (1.3.12) and implicitly goes on in $(1.3.13)^{12})$ typically results in “spread” optimal solution, with many small nonzero components. In view of our “Compressed Sensing” discussion, we could expect that minimizing the $\ell_{1}{\mathrm{- norm}}$ of z will result in “better concentrated” optimal solution, which leads us to what is called “LO Support Vector Machine.” Here the classifier is

$$
\min_{z, b} \left\{\| z \|_{2}: \sum_{i = 1}^{N} \max \left[1 - y^{i} \left(z^{T} x^{i} + b\right), 0 \right] \leq \Lambda \right\}
$$

given by the solution of the $\| \cdot \|_{1}$ -analogy of (1.3.13), specifically, the optimization problem

$$
\min_{z, b} \left\{\| z \|_{1} + \lambda \sum_{i = 1}^{N} \max[1 - y^{i}(z^{T} x^{i} + b), 0] \right\}.\tag{1.3.14}
$$

This problem clearly reduces to the LO program

$$
\min_{z, b, w, \xi} \left\{\sum_{j = 1}^{n} w_{j} + \lambda \sum_{i = 1}^{N} \xi_{i}: - w_{j} \leq z_{j} \leq w_{j}, 1 \leq j \leq n, \xi_{i} \geq 0, \xi_{i} \geq 1 - y^{i}(z^{T} x^{i} + b), 1 \leq i \leq N \right\}.\tag{1.3.15}
$$

Concluding remarks. A reader could ask, what is the purpose of training the classifier on the training set of examples, where we from the very beginning know the labels of all the examples? why a classifier which classifies well on the training set should be good at new examples? Well, intuition says that if a simple rule with a relatively small number of “tuning parameters” (as it is the case with a sparse linear classifier) recovers well the labels in examples from a large enough sample, this classifier should have learned something essential about the dependency between feature vectors and labels, and thus should be able to classify well new examples. Machine Learning theory ofers a solid probabilistic framework in which “our intuition is right”, so that under assumptions (not too restrictive) imposed by this framework it is possible to establish quantitative links between the size of the training sample, the behavior of the classifier on this sample (quantified by the $\| \cdot \|_{2}{\mathrm{~ or ~}} \| \cdot \|_{1}$ norm of the resulting z and the value of the penalty for misclassification), and the predictive power of the classifier, quantified by the probability of misclassification of a new example; roughly speaking, good behavior of a linear classifier achieved at a large training sample ensures low probability of misclassifying a new example.

## 1.3.3 Synthesis of linear controllers

## 1.3.3.1 Discrete time linear dynamical systems

The most basic and well studied entity in control is a linear dynamical system (LDS). In the sequel, we focus on discrete time LDS modeled as

$$
\begin{array}{rcll}{x_{0}} & = & z & \mathrm{[initialcondition]} \\{x_{t + 1}} & = &{A_{t} x_{i} + B_{t} u_{t} + R_{t} d_{t},} & \mathrm{[stateequations]} \\{y_{t}} & = &{C_{t} x_{t} + D_{t} d_{t}} & \mathrm{[outputs]} \end{array}\tag{1.3.16}
$$

In this description,

$t = 0, 1, 2, \ldots$ . are time instants,

$x_{t} \in \mathbb{R}^{n_{x}}$ is state of the system at instant $t,$

$u_{t} \in \mathbb{R}^{n_{u}}$ is control generated by system’s controller at instant $t,$

$d_{t} \in \mathbb{R}^{n_{d}}$ is external disturbance coming from system’s environment at instant $t,$

$y_{t} \in \mathbb{R}^{n_{y}}$ is observed output at instant $t,$

$A_{t}, B_{t},..., D_{t}$ are (perhaps depending on $t)$ matrices of appropriate sizes specifying system’s dynamics and relations between states, controls, external disturbances and outputs.

What we have described so far is called an open loop system (or open loop plant). This plant should be augmented by a controller which generates subsequent controls. The standard assumption is that the control $u_{t}$ is generated in a deterministic fashion and depends on the outputs $y_{0}, y_{1},..., y_{t}$ observed prior to instant t and at this very instant (non-anticipative, or causal control):

$$
u_{t} = U_{t}(y_{0}, \dots, y_{t});\tag{1.3.17}
$$

here $U_{t}$ are arbitrary everywhere defined functions of their arguments taking values in $\mathbb{R}^{n_{u}}$ Plant augmented by controller is called a closed loop system; its behavior clearly depends on the initial state and external disturbances only.

## 1.3.3.2 Affine control

The simplest (and extremely widely used) form of control law is Affine control, where $u_{t}$ are Affine functions of the outputs:

$$
u_{t} = \xi_{t} + \Xi_{0}^{t} y_{0} + \Xi_{1}^{t} y_{1} + \ldots + \Xi_{t}^{t} y_{t},\tag{1.3.18}
$$

where $\xi_{t}$ are vectors, and $\Xi_{\tau}^{t}, 0 \leq \tau \leq t.$ , are matrices of appropriate sizes.

Augmenting linear open loop system (1.3.16) with Affine controller (1.3.18), we get a well defined closed loop system in which states, controls and outputs are Affine functions of the initial state and external disturbances; moreover, $x_{t}$ depends solely on the initial state z and the collection $d^{t - 1} =[d_{0};...; d_{t - 1}]$ of disturbances prior to instant $t,$ while $u_{t}$ and $y_{t}$ may depend on z and the collection $d^{t} =[d_{0};...; d_{t}]$ of disturbances including the one at instant t.

## 1.3.3.3 Design specifications and the Analysis problem

The entities of primary interest in control are states and controls; we can arrange states and controls into a long vector — the state-control trajectory

$$
w^{N} =[x_{1}; x_{2}; \dots; x_{N}; u_{0}; u_{1}, \dots; u_{N - 1}];
$$

here N is the time horizon on which we are interested in system’s behavior. With Affine control law (1.3.18), this trajectory is an Affine function of $z$ and $d^{N}$ :

$$
w^{N} = w^{N}(z, d^{N - 1}) = \omega_{N} + \Omega_{N}[z; d^{N - 1}]
$$

with vector $\omega_{N}$ and matrix $\Omega_{N}$ readily given by the matrices $A_{t},..., D_{t}, 0 \leq t < N$ , from the description of the open loop system and by the collection $\vec{\xi}^{N} = \{\xi_{t}, \Xi_{\tau}^{t} : 0 \le \tau \le t < N\}$ of the parameters of the Affine control law (1.3.18).

Imagine that the “desired behaviour” of the closed loop system on the time horizon in question is given by a system of linear inequalities

$$
\mathcal{B} w^{N} \leq b(\zeta) \quad[b(\zeta): \text{affine in} \zeta :=[z; d^{N - 1}]]\tag{1.3.19}
$$

which should be satisfied by the state-control trajectory provided that the initial state z and the disturbances $d^{N - 1}$ vary in their “normal ranges” Z and $\mathcal{D}^{N - 1}$ , respectively; this is a pretty general form of design specifications. The fact that $w^{N}$ depends afinely on $\zeta : =[z; d^{N - 1}]$ makes it easy to solve the Analysis problem: to check wether a given control law (1.3.18) ensures the validity of design specifications (1.3.19). Indeed, to this end we should check whether the functions $[{\cal Bw}^{N} -{\cal b}(\zeta)]_{i}, 1 \le i \le I$ (I is the number of linear inequalities in (1.3.19)) remain nonpositive whenever

$$
\zeta :=[z; d^{N - 1}] \in \mathcal{ZD}^{N - 1} := \mathcal{Z} \times \mathcal{D}^{N - 1}.
$$

For a given control law, the functions in question are explicitly given Affine function $\phi_{i}(\zeta)$ of [ζ], so that what we need to verify is that

$$
\max_{\zeta} \left\{\phi_{i}(\zeta): \zeta \in \mathcal{ZD}^{N - 1} \right\} \leq 0, i = 1,..., I.
$$

Whenever $\mathcal{D}^{N - 1}$ and $\mathcal{Z}$ are explicitly given convex sets, the latter problems are convex and thus easy to solve. Moreover, if $\mathcal{Z} \mathcal{D}^{N - 1}$ is given by polyhedral representation:

$$
\mathcal{ZD}^{N - 1} = \{\zeta : \exists v: P \zeta + Qv \leq r\}\tag{1.3.20}
$$

(this is a pretty flexible and enough general way to describe typical ranges of disturbances and initial states), the analysis problem reduces to a bunch of explicit LPs

$$
\max_{\zeta, v} \left\{\phi_{i}(\zeta): P \zeta + Qv \leq r \right\}, 1 \leq i \leq I;
$$

the answer in the analysis problem is positive if and only if the optimal values in all these LPs are nonpositive.

## 1.3.3.4 Synthesis problem

As we have seen, with Affine control and Affine design specifications, it is easy to check whether a given control law meets the specifications. The basic problem in linear control is, however, somehow different: usually we need to build an Affine control which meets the design specifications (or to detect that no such control exists). And here we run into dificult problem: while state-control trajectory for a given Affine control is an easy-to-describe Affine function of $[z; d^{N - 1}]$ , its dependence on the collection $\vec{\xi}^{N}$ of the parameters of the control law is highly nonlinear, even for a time-invariant system (the matrices $A_{t},..., D_{t}$ are independent of t) and a control law as simple as time-invariant linear feedback: $u_{t} = Ky_{t}$ . Indeed, due to the dynamic nature of the system, in the expressions for states and controls powers of the matrix K will be present. Highly nonlinear dependence of states and controls on $\bar{\xi}^{N}$ makes it impossible to opti mize eficiently w.r.t. the parameters of the control law and thus makes the synthesis problem extremely dificult.

The situation, however, is far from being hopeless. We are about to demonstrate that one can re-parameterize Affine control law in such a way that with the new parameterization both Analysis and Synthesis problems become tractable.

## Illustration. As a simple illustration, consider the situation as follows:

Water supply in a village comes from tank of capacity V which is filled by pumps taking water from a source of unlimited capacity. Denoting by $x_{t}$ the amount of water (‘level”) in the tank at the beginning of hour $t, 0 \leq t < N = 24$ , the dynamics of this level is given by

$$
x_{t + 1} = x_{t} + u_{t} - d_{t}, t = 0, 1, \dots, 23
$$

where $x_{0} = z$ is the amount of water $({}^{66} \mathrm{level}^{37})$ of tank at midnight, $u_{t}, 0 \leq t \leq 23$ 2 is the amount of water pumped into the tank during hour t, and $d_{t}$ is the demand – the amount of water consumed during the same hour by the villagers. Pumping a unit of water into the tank during hour t costs $c_{t} \geq 0 ~^{13}$ . We assume that $x_{t}$ is observed at the beginning of hour t, when the decision on $u_{t}$ should be made, while $d_{t}$ is not known at this time instant.

Given the range $\mathcal{Z} =[0, \overline{{z}}]$ of the initial level of water and upper and lower bounds $\overline{{d}}_{t} \geq d_{t} \geq 0$ on the demand $d_{t}, 0 \leq t \leq 23$ , we want to design, in a non-anticipative fashion, nonnegative controls $u_{t}, 0 \leq t \leq 23$ , in such a way that the levels $x_{t}$ remain nonnegative and not exceeding tank’s capacity V whenever the initial state z and the demand trajectory $d^{23} =[d_{0};...; d_{23}]$ stay in their normal range:

$$
\zeta :=[z; d_{0}; d_{1}; \dots; d_{23}] \in \mathcal{ZD}^{23} := \{[z; d_{0}; \dots; d_{23}]: 0 \leq z \leq \overline{{z}}, \underline{{d}}_{t} \leq d_{t} \leq \overline{{d}}_{t}\}
$$

The dynamical system modeling the above story is

$$
\begin{array}{rcl}{x_{0}} & = &{z} \\{x_{t + 1}} & = &{x_{t} + u_{t} - d_{t}, 0 \leq t < N = 23} \\{y_{t}} & = &{x_{t}} \end{array}\tag{1.3.21}
$$

and the design specifications are given by the system of linear inequalities

$$
0 \leq x_{t} \leq V, 1 \leq t \leq N = 24 \& 0 \leq u_{t}, 0 \leq t \leq N - 1 = 23\tag{1.3.22}
$$

The total price of a given control policy on our 24-hour time horizon depends on the actual realization of $\zeta.$ In our illustration, we are interested to minimize the maximum, over $\zeta \in \mathcal{Z} \mathcal{D}^{23}$ total price of pumping by seeking Affine controller satisfying the design specifications (1.3.22) for all realizations of $\zeta \in \mathcal{Z} \mathcal{D}^{23}$

## 1.3.3.5 Purified outputs and purified-output-based control laws

Imagine that we “close” the open loop system with a whatever (Affine or non-Affine) control law (1.3.17) and in parallel with running the closed loop system run its model:

$$
\begin{array}{ccc} \hline \text{System:} \\ x_{0} & = & z \\ x_{t + 1} & = & A_{t} x_{i} + B_{t} u_{t} + R_{t} d_{t}, \\ y_{t} & = & C_{t} x_{t} + D_{t} d_{t} \\ \hline \text{Model:} \\ \widehat{x}_{0} & = & 0 \\ \widehat{x}_{t + 1} & = & A_{t} \widehat{x}_{i} + B_{t} u_{t}, \\ \widehat{y}_{t} & = & C_{t} \widehat{x}_{t} \\ \hline \text{Controller:} \\ u_{t} & = & U_{t}(y_{0},..., y_{t}) \qquad(\text{!}) \\ \hline \end{array}\tag{1.3.23}
$$

Assuming that we know the matrices $A_{t},..., D_{t}$ , we can run the model in an on-line fashion, so that at instant $t,$ when the control $u_{t}$ should be specified, we have at our disposal both the actual outputs $y_{0},..., y_{t}$ and the model outputs $\widehat{y}_{0},..., \widehat{y}_{t}$ , and thus have at our disposal the purified outputs

$$
v_{\tau} = y_{\tau} - \widehat{y}_{\tau}, 0 \leq \tau \leq t.
$$

Now let us ask ourselves what will happen if we, instead of building the controls $u_{t}$ on the basis of actual outputs $y_{\tau}, 0 \leq \tau \leq t$ , pass to controls $u_{t}$ built on the basis of purified outputs $v_{\tau}.$ $0 \leq \tau \leq t_{\ast}$ i.e., replace the control law (!) with control law of the form

$$
u_{t} = V_{t}(v_{0}, \dots, v_{t})\tag{!!}
$$

It easily seen that nothing will happen:

(∗) For every control law $\{U_{t}(y_{0},..., y_{t})\}_{t = 0}^{\infty}$ of the form (!) there exists a control law $\{V_{t}(v_{0},..., v_{t})\}_{t = 0}^{\infty}$ of the form (!!) (and vice versa, for every control law of the form (!!) there exists a control law of the form (!)) such that the dependencies of actual states, outputs and controls on the disturbances and the initial state for both control laws in question are exactly the same. Moreover, the above “equivalence claim” remains valid when we restrict controls (!), (!!) to be Affine in their arguments.

Justification of (∗) is presented at the end of this section,

The bottom line is that every behavior of the close loop system which can be obtained with Affine non-anticipative control (1.3.18) based on actual outputs, can be also obtained with Affine non-anticipative control law

$$
u_{t} = \eta_{t} + H_{0}^{t} v_{0} + H_{1}^{t} v_{1} + \ldots + H_{t}^{t} v_{t},\tag{1.3.24}
$$

based on purified outputs (and vice versa).

We have said that as far as achievable behaviors of the closed loop system are concerned, we loose (and gain) nothing when passing from Affine output-based control laws (1.3.18) to Affine purified output-based control laws (1.3.24). At the same time, when passing to purified outputs, we get a huge bonus:

(#) With control (1.3.24), the trajectory $w^{N}$ of the closed loop system turns out to be bi-Affine: it is Affine in $\dot{\zeta} =[z; d^{N - 1}]$ , the parameters $\vec{\eta}^{N} = \{\eta_{t}, H_{\tau}^{t}, 0 \le \tau \le t \le N\}$ of the control law being fixed, and is Affine in the parameters of the control law $\vec{\eta}^{N}$ $[z; d^{N - 1}]$ being fixed, and this bi-afinity, as we shall see in a while, is the key to efficient solvability of the synthesis problem.

The reason for bi-afinity is as follows (after this reason is explained, verification of bi-afinity itself becomes immediate): purified output $v_{t}$ is completely independent on the controls and is a known in advance Affine function of $d^{t}, z$ . Indeed, from (1.3.23) it follows that

$$
v_{t} = C_{t}(\underbrace{x_{t} - \widehat{x}_{t}}_{\delta_{t}}) + D_{t} d_{t}
$$

and that the evolution of $\delta_{t}$ is given by

$$
\delta_{0} = z, \delta_{t + 1} = A_{t} \delta_{t} + R_{t} d_{t}
$$

and thus is completely independent of the controls, meaning that $\delta_{t}$ and $v_{t}$ indeed are known in advance (provided the matrices $A_{t},..., D_{t}$ are known in advance) Affine functions of $d^{t}, z.$

Note that in contrast to the just outlined “control-independent” nature of purified outputs, the actual outputs are heavily control-dependent (indeed, $u_{t}$ is afected by y ; $y_{t}$ is afected by $x_{t}$ , and this state, in turn, is afected by past controls $u_{0},..., u_{t - 1})$ . This is why with the usual output-based Affine control, the states and the controls are highly nonlinear in the parameters of the control law – to build $u_{i},$ , we multiply matrices $\Xi_{\tau}^{t}$ (which are parameters of the control law) by outputs $y_{\tau}$ which by themselves already depend on the “past” parameters of the control law.

## 1.3.3.6 Tractability of the Synthesis problem

Assume that the normal range $\mathcal{Z} \mathcal{D}^{N - 1}$ of $\zeta =[z; d^{N - 1}]$ is a nonempty and bounded set given by polyhedral representation (1.3.20), and let us prove that in this case the design specifications (1.3.19) reduce to a system of explicit linear inequalities in variables $\vec{\eta}^{N} -$ the parameters of the purified-output-based Affine control law used to close the open-loop system – and appropriate slack variables. Thus, (parameters of) purified-output-based Affine control laws meeting the design specifications (1.3.19) form a polyhedrally representable, and thus easy to work with, set.

The reasoning goes as follows. As stated by $(\#)$ , the state-control trajectory $w^{N}$ associated with Affine purified-output-based control with parameters $\vec{\eta}^{N}$ is bi-Affine in $\zeta =[z; d^{N - 1}]$ and in $\vec{\eta}^{N}$ , so that it can be represented in the form

$$
w^{N} = w[\vec{\eta}^{N}] + W[\vec{\eta}^{N}] \zeta,
$$

where the vector-valued and the matrix-valued functions $w[\cdot], W[\cdot]$ are Affine and are readily given by the matrices $A_{t},..., D_{t}, 0 \leq t \leq N - 1$ . Plugging the representation of $w^{N}$ into the design specifications (1.3.19), we get a system of scalar constraints of the form

$$
\alpha_{i}^{T}(\vec{\eta}^{N}) \zeta \leq \beta_{i}(\vec{\eta}^{N}), 1 \leq i \leq I,\tag{&}
$$

where the vector-valued functions $\alpha_{i}(\cdot)$ and the scalar functions $\beta_{i}(\cdot)$ are Affine and readily given by the description of the open-loop system and by the data B, b in the design specifications. What we want from $\vec{\eta}^{N}$ is to ensure the validity of every one of the constraints $(\&)$ for all $\zeta$ from $\mathcal{Z} \mathcal{D}^{N - 1}$ , or, which is the same in view of (1.3.20), we want the optimal values in the LPs

$$
\max_{\zeta, v} \left\{\alpha_{i}^{T}(\vec{\eta}^{N}) \zeta : P \zeta + Qv \leq r \right\}
$$

to be $\leq \beta_{i}(\vec{\eta}^{N})$ for $1 \leq i \leq I$ . Now, the LPs in question are feasible; passing to their duals, what we want become exactly the relations

$$
\min_{s_{i}} \left\{r^{T} s_{i}: P^{T} s_{i} = \beta_{i}(\vec{\eta}^{N}), Q^{T} s_{i} = 0, s_{i} \geq 0 \right\} \leq \beta_{i}(\vec{\eta}^{N}), 1 \leq i \leq I.
$$

The bottom line is that

A purified-output-based control law meets the design specifications (1.3.19) if and only if the corresponding collection $\vec{\eta}^{N}$ of parameters can be augmented by properly chosen slack vector variables $s_{i}$ to give a solution to the system of linear inequalities in variables $s_{1},..., s_{I}, \vec{\eta}^{N}$ , specifically, the system

$$
P^{T} s_{i} = \beta_{i}(\vec{\eta}^{N}), Q^{T} s_{i} = 0, r^{T} s_{i} \leq \beta_{i}(\vec{\eta}^{N}), s_{i} \geq 0, 1 \leq i \leq I.\tag{1.3.25}
$$

Remark 1.3.1 We can say that when passing from an Affine output-based control laws to Affine purifies output based ones we are all the time dealing with the same entities (Affine nonanticipative control laws), but switch from one parameterization of these laws (the one by $\vec{\xi}^{N}.$ parameters) to another parameterization (the one by $\vec{\eta}^{N} \mathrm{- parameters})$ . This re-parameterization is nonlinear, so that in principle there is no surprise that what is dificult in one of them (the Synthesis problem) is easy in another one. This being said, note that with our re-parameterization we neither lose nor gain only as far as the entire family of linear controllers is concerned. Specific sub-families of controllers can be “simply-looking” in one of the parameterizations and be extremely dificult to describe in the other one. For example, time-invariant linear feedback $u_{t} = Ky_{t}$ looks pretty simple (just a linear subspace) in the $\vec{\xi}^{N}$ -parameterization and form a highly nonlinear manifold in the $\vec{\eta}^{N_{\mathrm{- one}}}$ . Similarly, the purified output-based control $u_{t} = Kv_{t}$ looks simple in the $\vec{\eta}^{N}$ -parameterization and is dificult to describe in the $\vec{\xi^{N}}_{\mathrm{- one}}$ . We can say that there is no such thing as “the best” parameterization of Affine control laws — everything depends on what are our goals. For example, the $\vec{\eta}^{N}$ parameterization is well suited for synthesis of general-type Affine controllers and becomes nearly useless when a linear feedback is sought.

Illustration [continued]. We are about to demonstrate how the outlined methodology works in our toy “water supply” illustration. In our experiment, we used tank capacity $V = 50$ ; the pumping costs $c_{t}$ and the upper bounds on hourly demands $\overline{{d}}_{t}$ are shown on the left plots of figure 1.1; the lower bounds on hourly demands were set to 0. The upper bound z on the tank’s level at the beginning of hour 0 was set to 10.

The performance of the purified output-based controller for (1.3.21) yielded by minimizing the worst-case total pumping cost over Affine purified output-based controllers satisfying the design specifications (1.3.22) for all $\zeta \in \mathcal{Z} \mathcal{D}^{23}$ is illustrated by the right part of figure 1.1, where we plot 100 state and control trajectories corresponding to 100 initial tank levels z and demand trajectories selected at random from the “uncertainty set” $\mathcal{Z} D^{23} = \{[z; d_{0};...; d_{23}] : 0 \leq z \leq$ $\overline{{z}}, 0 \leq d_{t} \leq \overline{{d}}_{t}, 0 \leq t \leq 23\}$ . The pumping costs in these simulations were as follows:

<table><tr><td>min</td><td>mean</td><td>median</td><td>max</td></tr><tr><td>50.00</td><td>472.13</td><td>473.31</td><td>905.00</td></tr></table>

Total pumping costs in 100 simulations

The worst-case, w.r.t. $\zeta \in \mathcal{Z} \mathcal{D}^{23}$ , pumping cost for our controller is 915.00. To put this result into proper perspective, note that with ζ corresponding to the zero initial tank level and the largest possible hourly demands $d_{t} = \overline{{d}}_{t}, 0 \leq t \leq 23$ , the minimal possible pumping cost is 885.00 – just by 3.3% less that the cost guaranteed in the worst case by our controller. Thus, in our example passing from non-anticipating Affine controllers to “utopian’ controls policies utilizing a priori knowledge of $\zeta$ cannot reduce the worst-case, over $\zeta \in \mathcal{Z} \mathcal{D}^{23}$ , pumping cost by more than 3.3%.

## 1.3.3.7 Clearing debts: justification of (∗)

In one direction: Assume that the controller is given by $u_{t} = U_{t}(y_{0},..., y_{t}), t = 0, 1,...,$ , and let us prove that the same system’s behaviour can be obtained by purified output-based controller $u_{t} = \widehat{U}_{t}(v_{0}, v_{1},..., v_{t}), t = 0, 1,...$ . To this end it sufices to prove by induction in t that with the output-based control, the outputs $y_{t}$ are deterministic functions of stemming from our control purified outputs: $y_{t} = Y_{t}(v_{0}, v_{1},..., v_{t}), t = 0, 1,....$ . Base $t = 0$ is trivial, since by construction $y_{0} = v_{0}$ . Assuming that $y_{\tau} = Y_{\tau}(v_{0},..., v_{\tau})$ for $0 \leq \tau \leq t.$ we conclude that $u_{\tau} = \hat{U}_{\tau}(v_{0},..., v_{\tau}) : =$ $U_{\tau}(Y_{0}(v_{0}), Y_{1}(v_{0}, v_{1}),..., Y_{\tau}(v_{0},..., v_{\tau}))$ . Looking at the model, we conclude that $\widehat{x}_{\tau + 1}, 0 \leq \tau \leq t,$ are deterministic functions of $v_{0},..., v_{\tau} \colon \widehat{x}_{\tau + 1} = \widehat{X}_{\tau + 1}(v_{0},..., v_{\tau})$ . Consequently, $\widehat{y}_{t + 1} = C_{t + 1} \widehat{x}_{t + 1}$ is a deterministic function of $v_{0},..., v_{t} \colon \widehat{y}_{t + 1} = \widehat{Y}_{t + 1}(v_{0},..., v_{t})$ , implying that $y_{t + 1} = \widehat{y}_{t + 1}$ + $v_{t + 1} = \widehat{Y}_{t + 1}(v_{0},..., v_{t}) + v_{t + 1}$ , that is, $y_{t + 1}$ is deterministic function of $v_{0},..., v_{t + 1}$ . Inductive step is complete. And since $y_{t} ~ = ~ Y_{t}(v_{0},..., v_{t})$ , we conclude that the output-based controls $u_{t} = U_{t}(y_{0},..., y_{t})$ can be represented as deterministic functions of the purified outputs: $u_{t} =$ $\widehat{U}_{t}(v_{0},..., v_{t})$ , as claimed. It is immediately seen that Affine in $[y_{0};...; y_{t}]$ functions $U_{t}(y_{0},..., y_{t})$ the above construction results in Affine in $[v_{0};...; v_{t}]$ functions $U_{t}(v_{0},..., v_{t})$

![Figure 1.1](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/7dc7694278de28546064bcb8a216999868ef186b8ad9bb20ca41199e63d41de1.jpg)  
Figure 1.1: Left, top: hourly pumping cost. Left, bottom: and upper bounds $\overline{{d}}_{t}$ on hourly demands (o) and sample demand trajectory (+). Right: 100 sample level (top) and control (bottom) trajectories.

In the opposite direction: Assume that the controller is given by $u_{t} = \widehat{U}_{t}(v_{0},..., v_{t}), t =$ $0, 1,...,$ and let us prove that the same system’s behaviour can be obtained by control policy of the form $u_{t} = U_{t}(y_{0}, y_{1},..., y_{t}), t = 0, 1,...$ . To this end it sufices to prove by induction in t that with the purified-output-based control, the purified outputs $v_{t}$ are deterministic functions of stemming from our control actual outputs y<sub>t</sub>: $v_{t} = \widehat{V}_{t}(y_{0}, y_{1},..., y_{t}), t = 0, 1,....$ . Base $t = 0$ is trivial, since by construction $v_{0} ~ = ~ y_{0}$ . Assuming that $v_{\tau} = \hat{V}_{\tau}(y_{0},..., y_{\tau})$ for $0 \leq \tau \leq t.$ we conclude that for $0 \leq \tau \leq t$ the controls $u_{\tau}$ are deterministic functions of $y_{0},..., y_{\tau} \colon u_{\tau} =$ $U_{\tau}(y_{0},..., y_{\tau}) : = \widehat{U}_{\tau}(\widehat{V}_{0}(y_{0}),..., \widehat{V}_{\tau}(y_{0},..., y_{\tau})), \tau \leq t$ . As a result, from model’s dynamics $\widehat{x}_{t + 1}$ is a deterministic function of $y_{0},..., y_{t} \colon \widehat{x}_{t + 1} = \dot{X}_{t + 1}(y_{0},..., y_{t})$ , whence, again by model dynamics, $\widehat{y}_{t + 1}$ is a deterministic function of $y_{0},..., y_{t},$ so that $v_{t + 1} = y_{t + 1} - \widehat{y}_{t + 1}$ is deterministic function of $y_{0},..., y_{t + 1}$ . Induction is complete. It remains to note that with $v_{t}$ being deterministic functions of $y_{0},..., y_{t}, t = 1, 2,...$ , the purified-output-base controls $u_{t} = \widehat{U}_{t}(v_{0},..., v_{t})$ become deterministic functions of $y_{0},..., y_{t} \colon u_{u} \ : = \ : U_{t}(y_{0},..., y_{t})$ , and the resulting output-based control yields the same system’s behaviour as the purified-output-based control we started with. And here again looking at the construction, we immediately conclude that when the initial purified-output-based controller is Affine, so is the resulting output-based controller. ✷

## 1.4 From Linear to Conic Programming

Linear Programming models cover numerous applications. Whenever applicable, LP allows to obtain useful quantitative and qualitative information on the problem at hand. The specific analytic structure of LP programs gives rise to a number of general results (e.g., those of the LP Duality Theory) which provide us in many cases with valuable insight and understanding. At the same time, this analytic structure underlies some specific computational techniques for LP; these techniques, which by now are perfectly well developed, allow to solve routinely quite large (tens/hundreds of thousands of variables and constraints) LP programs. Nevertheless, there are situations in reality which cannot be covered by LP models. To handle these “essentially nonlinear” cases, one needs to extend the basic theoretical results and computational techniques known for LP beyond the bounds of Linear Programming.

For the time being, the widest class of optimization problems to which the basic results of LP were extended, is the class of convex optimization programs. There are several equivalent ways to define a general convex optimization problem; the one we are about to use is not the traditional one, but it is well suited to encompass the range of applications we intend to cover in our course.

When passing from a generic LP problem

$$
\min_{x} \left\{c^{T} x \Big | Ax \geq b \right\} \quad[A: m \times n]\tag{LP}
$$

to its nonlinear extensions, we should expect to encounter some nonlinear components in the problem. The traditional way here is to say: “Well, in (LP) there are a linear objective function $f(x) = c^{T}$ x and inequality constraints $f_{i}(x) \geq b_{i}$ with linear functions $f_{i}(x) = a_{i}^{T} x, i = 1,..., m$ Let us allow some/all of these functions $f, f_{1},..., f_{m}$ to be nonlinear.” In contrast to this traditional way, we intend to keep the objective and the constraints linear, but introduce “nonlinearity” in the inequality sign ≥.

## 1.4.1 Orderings of $\mathbb{R}^{m}$ and cones

The constraint inequality $Ax \geq b$ in (LP) is an inequality between vectors; as such, it requires a definition, and the definition is well-known: given two vectors $a, b \in \mathbb{R}^{m}$ , we write $a \geq b$ , if the coordinates of a majorate the corresponding coordinates of b:

$$
a \geq b \Leftrightarrow \{a_{i} \geq b_{i}, i = 1, \dots, m\}.\tag{“ \geq ”}
$$

In the latter relation, we again meet with the inequality sign ≥, but now it stands for the “arithmetic $\geq^{\mathfrak{n}} - \mathrm{~ a ~}$ well-known relation between real numbers. The above “coordinate-wise” partial ordering of vectors in $\mathbb{R}^{m}$ satisfies a number of basic properties of the standard ordering of reals; namely, for all vectors $a, b, c, d, \ldots \in \mathbb{R}^{m}$ one has

1. Reflexivity: $a \geq a;$

2. Anti-symmetry: if both $a \geq b$ and $b \geq a,$ , then $a = b;$

3. Transitivity: if both $a \geq b$ and $b \geq c.$ , then $a \geq c;$

4. Compatibility with linear operations:

(a) Homogeneity: if $a \geq b$ and λ is a nonnegative real, then $\lambda a \ge \lambda b$

(”One can multiply both sides of an inequality by a nonnegative real”)

(b) Additivity: if both $a \geq b$ and $c \geq d,$ then $a + c \geq b + d$

(”One can add two inequalities of the same sign”).

It turns out that

- A significant part of the nice features of LP programs comes from the fact that the vector inequality ≥ in the constraint of (LP) satisfies the properties $1, - 4.$ ;

- The standard inequality $" \geq "$ is neither the only possible, nor the only interesting way to define the notion of a vector inequality fitting the axioms 1. – 4.

As a result,

A generic optimization problem which looks exactly the same as (LP), up to the fact that the inequality ≥ in (LP) is now replaced with and ordering which difers from the component-wise one, inherits a significant part of the properties of LP problems. Specifying properly the ordering of vectors, one can obtain from (LP) generic optimization problems covering many important applications which cannot be treated by the standard LP.

To the moment what is said is just a declaration. Let us look how this declaration comes to life.

We start with clarifying the “geometry” of a “vector inequality” satisfying the axioms 1. – 4. Thus, we consider vectors from a finite-dimensional Euclidean space E with an inner product $\langle \cdot, \cdot \rangle$ and assume that E is equipped with a partial ordering (called also vector inequality), let it be denoted by $\succeq$: in other words, we say what are the pairs of vectors a, b from E linked by the inequality $a \succeq b$ . We call the ordering “good”, if it obeys the axioms 1. – 4., and are interested to understand what are these good orderings.

Our first observation is:

A. A good vector inequality $\succeq$ is completely identified by the set K of $\succeq$-nonnegative vectors:

$$
\mathbf{K} = \{a \in \mathbb{E}: a \succeq 0\}.
$$

Namely,

$$
a \succeq b \Leftrightarrow a - b \succeq 0[\Leftrightarrow a - b \in \mathbf{K}].
$$

Indeed, let $a \succeq b.$ . By 1. we have $- b \succeq - b,$ and by 4.(b) we may add the latter inequality to the former one to get $a - b \succeq 0$ . Vice versa, if $a - b \succeq 0$ , then, adding to this inequality the one $b \succeq b.$ we get $a \succeq b$

The set K in Observation A cannot be arbitrary. It is easy to verify that it must be a pointed cone, i.e., it must satisfy the following conditions:

1. K is nonempty and closed under addition:

$$
a, a^{\prime} \in \mathbf{K} \Rightarrow a + a^{\prime} \in \mathbf{K};
$$

2. K is a conic set:

$$
a \in \mathbf{K}, \lambda \geq 0 \Rightarrow \lambda a \in \mathbf{K}.
$$

## 3. K is pointed:

$$
a \in \mathbf{K} \text{and} - a \in \mathbf{K} \Rightarrow a = 0.
$$

Geometrically: K does not contain straight lines passing through the origin.

Definition 1.4.1 [a cone] From now on, we refer to a subset of $\mathbb{R}^{n}$ which is nonempty, conic and closed under addition as to a cone in $\mathbb{R}^{n}$ ; equivalently, a cone in $\mathbb{R}^{n}$ is a nonempty convex and conic subset of $\mathbb{R}^{n}$

Note that with our terminology, convexity is built into the definition of a cone; in this book the words “convex cone” which we use from time to time mean exactly the same as the word “cone.”

Exercise 1.1 Prove that the outlined properties of K are necessary and sufficient for the vector inequality $a \succeq b \Leftrightarrow a - b \in \mathbf{K}$ to be good.

Thus, every pointed cone K in E induces a partial ordering on E which satisfies the axioms $1, \textrm{--} 4$ . We denote this ordering by $\ge \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}} \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\Lambda}}}}}}$

$$
a \geq_{\mathbf{K}} b \Leftrightarrow a - b \geq_{\mathbf{K}} 0 \Leftrightarrow a - b \in \mathbf{K}.
$$

What is the cone responsible for the standard coordinate-wise ordering $\geq$ on $\mathbb{E} = \mathbb{R}^{m}$ we have started with? The answer is clear: this is the cone comprised of vectors with nonnegative entries – the nonnegative orthant

$$
\mathbb{R}_{+}^{m} = \{x =(x_{1}, \dots, x_{m})^{T} \in \mathbb{R}^{m}: x_{i} \geq 0, i = 1, \dots, m\}.
$$

(Thus, in order to express the fact that a vector a is greater than or equal $^{\mathrm{to,}}$ in the componentwise sense, to a vector $b,$ we were supposed to write $a \geq_{\mathbb{R}_{+}^{m}} b.$ . However, we are not going to be that formal and shall use the standard shorthand notation $a \geq b.)$

The nonnegative orthant $\mathbb{R}_{+}^{m}$ is not just a pointed cone; it possesses two useful additional properties:

I. The cone is closed: if a sequence of vectors $a^{i}$ from the cone has a limit, the latter also belongs to the cone.

II. The cone possesses a nonempty interior: there exists a vector such that a ball of positive radius centered at the vector is contained in the cone.

These additional properties are very important. For example, I is responsible for the possibility to pass to the term-wise limit in an inequality:

$$
a^{i} \geq b^{i} \quad \forall i, \quad a^{i} \rightarrow a, b^{i} \rightarrow b \text{as} i \rightarrow \infty \Rightarrow a \geq b.
$$

It makes sense to restrict ourselves with good partial orderings coming from cones K sharing the properties I, II. Thus,

From now $on,$ speaking about vector inequalities $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}.$ , we always assume that the underlying set K is a pointed and closed cone with a nonempty interior.

Note that the closedness of K makes it possible to pass to limits in $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}^{}.$ -inequalities:

$$
a^{i} \ge_{\mathbf{K}} b^{i}, a^{i} \rightarrow a, b^{i} \rightarrow b \mathrm{as} i \rightarrow \infty \Rightarrow a \ge_{\mathbf{K}} b.
$$

The nonemptiness of the interior of K allows to define, along with the “non-strict” inequality $a \ge_{\bf K} b.$ , also the strict inequality according to the rule

$$
a >_{\mathbf{K}} b \Leftrightarrow a - b \in \operatorname{int} \mathbf{K},
$$

where int K is the interior of the cone K. $\mathrm{E.g.}$ , the strict coordinate-wise inequality $a > \mathbb{R}_{+}^{m}$ b (shorthand: $a > b)$ simply says that the coordinates of a are strictly greater, in the usual arithmetic sense, than the corresponding coordinates of b.

Examples. The partial orderings we are especially interested in are given by the following cones:

- The nonnegative orthant $\mathbb{R}_{+}^{m}$ in $\mathbb{R}^{n}$ ;

- The Lorentz (or the second-order, or the less scientific name the ice-cream) cone

$$
\mathbf{L}^{m} = \left\{x =(x_{1},..., x_{m - 1}, x_{m})^{T} \in \mathbb{R}^{m}: x_{m} \geq \sqrt{\sum_{i = 1}^{m - 1} x_{i}^{2}} \right\}
$$

- The semidefinite cone $\mathbf{S}_{+}^{m}$ . This cone “lives” in the space $\mathbb{E} = \mathbf{S}^{m}$ of m × m symmetric matrices (equipped with the Frobenius inner product $\langle A, B \rangle = \operatorname{Tr}(AB) = \sum_{i, j} A_{ij} B_{ij})$ and consists of all $m \times m$ matrices A which are positive semidefinite, i.e.,

$$
A = A^{T}; \quad x^{T} Ax \geq 0 \quad \forall x \in \mathbb{R}^{m}.
$$

## 1.4.2 “Conic programming” – what is it?

Let K be a regular cone in E, regularity meaning that the cone is convex, pointed, closed and with a nonempty interior. Given an objective $c \in \mathbb{R}^{n}$ , a linear mapping $x \mapsto$ Ax : $\mathbb{R}^{n} \to$ E and a right hand side $b \in \mathbb{E}.$ , consider the optimization problem

$$
\min_{x} \left\{c^{T} x \mid Ax \geq_{\mathbf{K}} b \right\}\tag{CP).}
$$

We shall refer to (CP) as to a conic problem associated with the cone K, and to the constraint

$$
Ax \geq_{\mathbf{K}} b
$$

– as to linear vector inequality, or conic inequality, or conic constraint, in variables x.

Note that the only diference between this program and an LP problem is that the latter deals with the particular choice ${\bf E} ={\bf R}^{m},{\bf K} ={\bf R}_{+}^{m}$ . With the formulation (CP), we get a possibility to cover a much wider spectrum of applications which cannot be captured by LP; we shall look at numerous examples in the sequel.

## 1.4.3 Conic Duality

Aside of algorithmic issues, the most important theoretical result in Linear Programming is the LP Duality Theorem; can this theorem be extended to conic problems? What is the extension?

The source of the LP Duality Theorem was the desire to get in a systematic way a lower bound on the optimal value $c^{*}$ in an LP program

$$
c^{*} = \min_{x} \left\{c^{T} x \mid Ax \geq b \right\}.\tag{LP}
$$

The bound was obtained by looking at the inequalities of the type

$$
\langle \lambda, Ax \rangle \equiv \lambda^{T} Ax \geq \lambda^{T} b\tag{Cons(λ)}
$$

with weight vectors $\lambda \geq 0$ . By its origin, an inequality of this type is a consequence of the system of constraints Ax ≥ b of (LP), i.e., it is satisfied at every solution to the system. Consequently, whenever we are lucky to get, as the left hand side of (Cons(λ)), the expression $c^{T} x,$ , i.e., whenever a nonnegative weight vector λ satisfies the relation

$$
A^{T} \lambda = c,
$$

the inequality $\left(\mathrm{Cons}(\lambda) \right)$ yields a lower bound $b^{T} \lambda$ on the optimal value in (LP). And the dual problem

$$
\max \left\{b^{T} \lambda : \lambda \geq 0, A^{T} \lambda = c \right\}
$$

was nothing but the problem of finding the best lower bound one can get in this fashion.

The same scheme can be used to develop the dual to a conic problem

$$
\min \left\{c^{T} x: Ax \geq_{\mathbf{K}} b \right\}, \mathbf{K} \subset \mathbb{E}.\tag{CP}
$$

Here the only step which needs clarification is the following one:

(?) What are the “admissible” weight vectors λ, i.e., the vectors such that the scalar inequality

$$
\langle \lambda, Ax \rangle \geq \langle \lambda, b \rangle
$$

is a consequence of the vector inequality Ax $\ge_{\bf K} b \ge$

In the particular case of coordinate-wise partial ordering, i.e., in the case of ${\bf E} ={\bf R}^{m},{\bf K} ={\bf R}_{+}^{m}$ the admissible vectors were those with nonnegative coordinates. These vectors, however, not necessarily are admissible for an ordering $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}}$ when K is different from the nonnegative orthant:

Example 1.4.1 Consider the ordering $\ge \mathbf{L}^{3}$ on $\mathbb{E} = \mathbb{R}^{3}$ given by the 3-dimensional ice-cream cone:

$$
\left(\begin{array}{c} a_{1} \\ a_{2} \\ a_{3} \end{array} \right) \geq_{\mathbf{L}^{3}} \left(\begin{array}{c} 0 \\ 0 \\ 0 \end{array} \right) \Leftrightarrow a_{3} \geq \sqrt{a_{1}^{2} + a_{2}^{2}}.
$$

The inequality

$$
\left(\begin{array}{c} - 1 \\ - 1 \\ 2 \end{array} \right) \geq_{\mathbf{L}^{3}} \left(\begin{array}{c} 0 \\ 0 \\ 0 \end{array} \right)
$$

is valid; however, aggregating this inequality with the aid of a positive weight vector $\lambda = \left(\begin{array}{c}{{1}} \\{{1}} \\{{0.1}} \end{array} \right)$ 2 we get the false inequality

$$
- 1.8 \geq 0.
$$

Thus, not every nonnegative weight vector is admissible for the partial ordering $\ge \mathbf{L}^{3}$

To answer the question (?) is the same as to say what are the weight vectors λ such that

$$
\forall a \geq_{\mathbf{K}} 0: \quad \langle \lambda, a \rangle \geq 0.\tag{1.4.1}
$$

Whenever λ possesses the property (1.4.1), the scalar inequality

$$
\langle \lambda, a \rangle \geq \langle \lambda, b \rangle
$$

is a consequence of the vector inequality $a \ge \mathbf{\mathbf{\mathbf{\mathbf{K}}}}$ b:

$$
\begin{array}{ccccc} & a & \geq_{\mathbf{K}} & b \\ \Leftrightarrow & a - b & \geq_{\mathbf{K}} & 0 &[\text{additivity of} \geq_{\mathbf{K}}] \\ \Rightarrow & \langle \lambda, a - b \rangle & \geq & 0 &[\text{by (1.4.1)}] \\ \Leftrightarrow & \langle \lambda, a \rangle & \geq & \lambda^{T} b.& \square \end{array}
$$

Vice versa, if λ is an admissible weight vector for the partial ordering $\ge \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}} \colon$

$$
\forall(a, b: a \geq_{\mathbf{K}} b): \quad \langle \lambda, a \rangle \geq \langle \lambda, b \rangle
$$

then, of course, λ satisfies (1.4.1).

Thus the weight vectors λ which are admissible for a partial ordering $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}}$ are exactly the vectors satisfying (1.4.1), or, which is the same, the vectors from the set

$$
\mathbf{K}_{*} = \{\lambda \in \mathbb{E}: \langle \lambda, a \rangle \geq 0 \quad \forall a \in \mathbf{K}\}.
$$

The set K<sub>∗</sub> is comprised of vectors whose inner products with all vectors from K are nonnegative. $\mathbf{K}_{*}$ is called the cone dual to K. The name is legitimate due to the following fact (see Section B.2.7.B):

Theorem 1.4.1 [Properties of the dual cone] Let E be a finite-dimensional Euclidean space with inner product $\langle \cdot, \cdot \rangle$ and let $K \subset \mathbb{E}$ be a nonempty set. Then

(i) The set

$$
K_{*} = \{\lambda \in \mathbb{E}^{m}: \langle \lambda, a \rangle \geq 0 \quad \forall a \in K\}
$$

is a closed cone.

(ii) If int $K \neq \emptyset$ , then K<sub>∗</sub> is pointed.

(iii) If K is a closed pointed cone, then int $K_{*} \neq \emptyset$

(iv) If K is a closed cone, then so is $K_{*}$ , and the cone dual to $K_{*}$ is K itself:

$$
(K_{*})_{*} = K.
$$

An immediate corollary of the Theorem is as follows:

Corollary 1.4.1 A closed cone $K \subset \mathbb{E}$ is regular $(i.e.$ , in addition to being a closed cone, is pointed and with a nonempty interior) $if$ and only if the set $K_{*}$ is so.

From the dual cone to the problem dual to (CP). Now we are ready to derive the dual problem of a conic problem (CP). In fact, it makes sense to operate with the problem in a slightly more flexible form than (CP), namely, problem

$$
\operatorname{Opt}(P) = \min_{x \in \mathbb{R}^{n}} \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0, Rx = r \right\}\tag{P}
$$

where K is a regular cone in Euclidean space $E.$

As in the case of Linear Programming, we start with the observation that whenever x is a feasible solution to $(P)$ , λ is an admissible weight vector, $\mathrm{i.e., ~} \lambda \in \mathbf{K}_{*}$ , and $\mu$ is a whatever vector of the same dimension as $r,$ let us call it $d,$ then x satisfies the scalar inequality

$$
(A^{*} \lambda)^{T} x + \mathbb{R}^{T} \mu \geq \langle b, \lambda \rangle + r^{T} \mu, \quad 14)
$$

– this observation is an immediate consequence of the definition of $\mathbf{K}_{*}$ . It follows that whenever $\lambda \in \mathbf{K},$ <sub>∗</sub> and $\boldsymbol{\mu} \in \mathbb{R}^{d}$ satisfy the relation

$$
A^{*} \lambda + \mathbb{R}^{T} \mu = c,
$$

one has

$$
c^{T} x =(A^{*} \lambda)^{T} x + \mu^{T} x = \langle \lambda, Ax \rangle + \mu^{T} x \geq \langle b, \lambda \rangle + r^{T} \mu
$$

for all $x$ feasible for $(P)$ , so that the quantity $\langle b, \lambda \rangle + r^{T} \mu$ is a lower bound on the optimal value $\mathrm{Opt}(P)$ of $(P)$ . The best bound one can get in this fashion is the optimal value in the problem

$$
\operatorname{Opt}(D) = \max_{\lambda, \mu} \left\{\langle b, \lambda \rangle + r^{T} \mu : A^{*} \lambda + \mathbb{R}^{T} \mu = c, \lambda \geq_{\mathbf{K}_{*}} 0 \right\}\tag{D}
$$

and this program is called the program dual to $(P)$

Slight modification. “In real $\operatorname{life}^{\dag}$ the cone K in (P ) usually is a direct product of a number m regular cones:

$$
\mathbf{K} = \mathbf{K}^{1} \times \ldots \times \mathbf{K}^{m}
$$

or, in other words, instead of one conic constraint $Ax - b \ge_{\mathbf{K}} 0$ we operate with a system of m conic constraints $A_{i} x - b_{i} \ge_{\mathbf{K}^{i}} 0, i \le m$ , so that $(P)$ reads

$$
\operatorname{Opt}(P) = \min_{x} \left\{c^{T} x: A_{i} x - b_{i} \ge_{\mathbf{K}^{i}} 0, i \leq m, Rx = r \right\}.\tag{P}
$$

Taking into account that the cone dual to the direct product of several regular cones clearly is the direct product of cones dual to the factors, the above recipe for building the dual as applied to the latter problem reads as follows:

- We equip conic constraints $A_{i} x - b_{i} \geq_{\mathbf{K}^{i}}$ 0 with weights (a.k.a Lagrange multipliers) $\lambda_{i}$ restricted to reside in the dual to $\mathbf{K}^{i}$ cones ${\bf K}_{*}^{i}$ , and the linear equality constraint $Rx = r$ - with Lagrange multiplier $\mu$ residing in $\mathbb{R}^{d}.$ , where d is the dimension of $r;$

$$
\langle y, Ax \rangle = x^{T} Ay \quad \forall(y \in{\bf E}, x \in{\bf R}^{n}).
$$

- We multiply the constraints by the Lagrange multipliers and sum the results up, thus arriving at the aggregated scalar linear inequality

$$
\left[\sum_{i} A_{i}^{*} \lambda_{i} + \mathbb{R}^{T} \mu \right]^{T} x \geq \sum_{i} \langle b_{i}, \lambda_{i} \rangle + r^{T} \mu
$$

which by its origin is a consequence of the system of constraints of $(P) \mathrm{~ - ~} \mathrm{it}$ is satisfied at every feasible solution x to the problem. In particular, when the left hand side of the aggregated inequality is identically in x equal to $c^{T} x$ , its right hand size is a lower bound on $\mathrm{Opt}(P)$

The problem dual to (P ) is the problem

$$
\operatorname{Opt}(D) = \max_{\{\lambda_{i}\}, \mu} \left\{\sum_{i} \langle b_{i}, \lambda_{i} \rangle + r^{T} \mu : \sum_{i} A_{i}^{*} \lambda_{i} + \mathbb{R}^{T} \mu = c, \lambda_{i} \in \mathbf{K}_{*}^{i}, i \leq m \right\}
$$

of finding the best lower bound on $\mathrm{Opt}(P)$ allowed by this bounding mechanism.

So far, what we know about the duality we have just introduced is the following

Proposition 1.4.1 [Weak Conic Duality Theorem] The optimal value $\mathrm{Opt}(D) ~ of \left(D \right)$ is a lower bound on the optimal value $\mathrm{Opt}(P)$ of (P ).

## 1.4.4 Geometry of the primal and the dual problems

We are about to understand extremely nice geometry of the pair comprised of conic problem (P ) and its dual (D):

$$
\begin{array}{rcl} \mathrm{Opt}(P) & = & \min_{x} \left\{c^{T} x: Ax - b \in{\bf K}, Rx = r \right\} \\ \mathrm{Opt}(D) & = & \max_{\lambda, \mu} \left\{\langle b, \lambda \rangle + r^{T} \mu : \lambda \in{\bf K}_{*}, A^{*} \lambda + \mathbb{R}^{T} \mu = c \right\} \end{array}\tag{P}
$$

(D)

Let us make the following

Assumption: The systems of linear equality constraints in (P ) and (D) are solvable:

$$
\exists \bar{x},(\lambda, \bar{\mu}): R \bar{x} = r, A^{*} \bar{\lambda} + \mathbb{R}^{T} \bar{\mu} = c.
$$

which acts everywhere in this Section.

A. Let us pass in (P ) from variable x to primal slack $\eta = Ax - b$ . Whenever x satisfies $Rx = r.$ we have

$$
c^{T} x =[A^{*} \bar{\lambda} + \mathbb{R}^{T} \bar{\mu}]^{T} x = \langle \bar{\lambda}, Ax \rangle + \bar{\mu}^{T} Rx = \langle \bar{\lambda}, Ax - b \rangle +[\langle b, \bar{\lambda} \rangle + r^{T} \bar{\mu}]
$$

We see that (P ) is equivalent to the conic problem

$$
\begin{array}{c} \operatorname{Opt}(\mathcal{P}) = \min_{\eta} \left\{\langle \bar{\lambda}, \eta \rangle : \eta \in[\mathcal{L} - \bar{\eta}] \cap \mathbf{K} \right\}, \mathcal{L} = \{Ax: Rx = 0\}, \bar{\eta} = b - A \bar{x} \\ \left[\operatorname{Opt}(\mathcal{P}) = \operatorname{Opt}(P) -[\langle b, \bar{\lambda} \rangle + r^{T} \bar{\mu}] \right] \end{array}\tag{P}
$$

Indeed, (P ) wants of $\eta : = Ax - b \left(a \right)$ to belong to K, and (b) to be representable as $Ax{-} b$ for some x satisfying $Rx = r.\(b)$ says that η should belong to the primal Affine plane $\{Ax - b : Rx = r\}$ which is the shift of the parallel linear subspace $\mathcal{L} = \{Ax : Rx = 0\}$ by a (whatever) vector from the primal Affine plane, $\mathrm{e.g.}$ , the vector $- \bar{\eta} = A \bar{x} - b$

B. Let us pass in (D) from variables $(\lambda, \mu)$ to variable λ. Whenever $(\lambda, \mu)$ satisfies $A * \lambda + \mathbb{R}^{T} \mu =$ $^{c,}$ we have

$$
\langle b, \lambda \rangle + r^{T} \mu = \langle b, \lambda \rangle + \bar{x}^{T} \mathbb{R}^{T} \mu = \langle b, \lambda \rangle + \bar{x}^{T}[c - A^{*} \lambda] = \langle b - A \bar{x}, \lambda \rangle + c^{T} \bar{x} = \langle \bar{\eta}, \lambda \rangle + c^{T} \bar{x},
$$

and we see that (D) is equivalent to the conic problem

$$
\begin{array}{c} \operatorname{Opt}(\mathcal{D}) = \max_{\lambda} \left\{\langle \widehat{\eta}, \lambda \rangle : \lambda \in[\mathcal{L}^{\perp} + \widehat{\lambda}] \cap \mathbf{K}_{*} \right\} \\ \left[\operatorname{Opt}(\mathcal{D}) = \operatorname{Opt}(D) - c^{T} \widehat{x} \right] \end{array}\tag{D}
$$

where $\mathcal{L}^{\perp}$ is the orthogonal complement to $\mathcal{L}$ in $E{:}$

$$
\mathcal{L}^{\perp} = \{\zeta \in E: \langle \zeta, \eta \rangle = 0 \forall \eta \in \mathcal{L}\}.
$$

Indeed, (D) wants of $\lambda \(a)$ to belong to $\mathbf{K}_{*},$ and (b) to satisfy $A^{*} \lambda = c - \mathbb{R}^{T} \mu$ for some $\mu.\mathrm{\Gamma(b)}$ says that λ should belong to the dual Affine plane $\{\lambda : \exists \mu : A^{*} \lambda + \mathbb{R}^{T} \mu = c\}$ , which is the shift of the parallel linear subspace $\widetilde{\mathcal{L}} = \{\lambda : \exists \mu : A^{*} \lambda + \mathbb{R}^{T} \mu = 0\}$ by a (whatever) vector from the dual Affine plane, $\mathrm{e.g.}$ , the vector $\widehat{\lambda}.$ It remains to note that Elementary Linear Algebra says that $\widetilde{\mathcal{L}} = \mathcal{L}^{\perp}$ . Indeed,

$$
\begin{array}{rcl}{[\widetilde{\mathcal{L}}]^{\perp}} & = & \{z \zeta : \langle \zeta, \lambda \rangle = 0 \forall \lambda : \exists \mu : A^{*} \lambda + \mathbb{R}^{T} \mu = 0\} \\ & = & \{\zeta : \langle \zeta, \lambda \rangle + 0^{T} \mu = 0 \text{whenever} A^{*} \lambda + \mathbb{R}^{T} \mu = 0\} \\ & = & \{\zeta : \exists x: \underbrace{\langle \zeta, \lambda \rangle + 0^{T} \mu -[A^{*} \lambda + \mathbb{R}^{T} \mu]^{T} x}_{\equiv[\rangle \zeta - Ax, \lambda \rangle -[Rx]^{T} \mu} \equiv 0 \forall \lambda, \mu\} \equiv \langle \zeta + \forall(\lambda, \mu)\} \\ & = & \{\zeta : \exists x: \zeta = Ax \& Rx = 0\} \end{array}
$$

The bottom line is that problems $(P),(D)$ are equivalent, respectively, to the problems

$$
\begin{array}{rcl} \mathrm{Opt}(\mathcal{P}) & = & \min_{\eta} \left\{\langle \widehat{\lambda}, \eta \rangle : \eta \in[\mathcal{L} - \widehat{\eta}] \cap \mathbf{K} \right\} \qquad(\mathcal{P}) \\ \mathrm{Opt}(\mathcal{D}) & = & \max_{\lambda} \left\{\langle \widehat{\eta}, \lambda \rangle : \lambda \in[\mathcal{L}^{\perp} + \widehat{\lambda}] \cap \mathbf{K}_{*} \right\} \quad(\mathcal{D}) \\ \Big[\mathcal{L} = \{Ax: Rx = 0\}, R \widehat{x} = r, \widehat{\eta} = b - A \widehat{x}, A^{*} \widehat{\lambda} + \mathbb{R}^{T} \widehat{\mu} = c \Big] \end{array}
$$

Note that when x is feasible for $(P)$ , and $[\lambda, \mu]$ is feasible for $(D)$ , the vectors $\eta = Ax - b, \lambda$ are feasible for $(\mathcal{P})$ , resp., (D), and every pair η, λ of feasible solutions to $(\mathcal{P}),(\mathcal{D})$ can be obtained in the fashion just described from feasible solutions x to $(P)$ and $(\lambda, \mu)$ to (D). Besides this, we have nice expression for the duality gap – the value of the objective of $(P)$ at x minus the value of the objective of (D) as evaluated at $(\lambda, \mu)$

$$
\text{DualityGap}(x;(\lambda, \mu)) := c^{T} x -[\langle b, \lambda \rangle + r^{T} \mu] =[A^{*} \lambda + \mathbb{R}^{T} \mu]^{T} x - \langle b, \lambda \rangle - r^{T} \mu = \langle Ax - b, \lambda \rangle = \langle \eta, \lambda \rangle.
$$

Geometrically, (P ), (D) are as follows: ”geometric data” of the problems are the pair of linear subspaces $\mathcal{L}, \mathcal{L}^{\perp}$ in the space E where K, K<sub>∗</sub> live, the subspaces being orthogonal complements to each other, and pair of vectors $\widehat{\eta}, \widehat{\lambda}$ in this space.

$(P)$ is equivalent to minimizing $f(\eta) = \langle \widehat{\lambda}, \eta \rangle$ over the intersection of K and the primal feasible plane $\mathcal{M}_{P}$ which is the shift of L by −η

- (D) is equivalent to maximizing $g(\lambda) = \langle \widehat{\eta}.\lambda \rangle$ over the intersection of $\mathbf{K}_{*}$ <sub>∗</sub> and the dual feasible plane $\mathcal{M}_{D}$ which is the shift of $\mathcal{L}^{\perp}$ by λ

- taken together, (P ) and (D) form the problem of minimizing the duality gap over feasible solutions to the problems, which is exactly the problem of finding pair of vectors in $\mathcal{M}_{P} \cap \mathbf{K}$ and $\mathcal{M}_{D} \cap \mathbf{K}_{*}$ <sub>∗</sub> as close to orthogonality as possible.

Pay attention to the ideal geometrical primal-dual symmetry we observe.

![Figure 1.1](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/7fb18996e45dde8e26a507b8c1a51a6a9873d47e62815035985870c639df8691.jpg)  
Figure 1.1. Primal-dual pair of conic problems on 3D Lorentz cone Red: feasible set of (P) Blue: feasible set of (D)

## 1.4.5 Conic Duality Theorem

Definition 1.4.2 A conic problem of optimizing a linear objective under the constraints

$$
Ax - b \in \mathbf{K}, Rx = r
$$

is called strictly feasible, if there exists a feasible solution x¯ which strictly satisfies the conic constraint:

$$
\exists \bar{x}: R \bar{x} = r \& A \bar{x} - b \in \operatorname{int} \mathbf{K}.
$$

Assuming that the conic constraint is split into ”general” and ”polyhedral” parts, so that the feasible set is given by

$$
Ax - b \in{\bf K}, Px - p \geq 0, Rx = r
$$

the problem is called essentially strictly feasible, if there exists a feasible solution x¯ which strictly satisfies the ”general” conic constraint:

$$
\exists \bar{x}: R \bar{x} = r, P \bar{x} - p \geq 0, A \bar{x} - b \in \operatorname{int} \mathbf{K}.
$$

From now on we make the following

Convention: In the above definition, the constraints of the problem have conic part $Ax - b \geq_{\mathbf{K}} 0$ and linear equality part Rx = r (or conic part Ax − $b \ge \mathbf{\mathbf{\mathbf{\mathbf{K}}}} \0$ , polyhedral part $Px - p \geq 0$ , and linear equality part $Rx = 0)$ . In the sequel, when speaking about strict/essemtially strict feasibility of a particular conic problem, some of these parts can be absent. Whenever this is the case, to make the definition applicable, we act as if the constraints were augmented by trivial version(s) of the missing part(s), say, $[0;...; 0]^{T} x + 1 \ge 0$ in the role of the actually missing conic part $Ax - b \ge_{\bf K} ~ 0$ and $[0;...; 0]^{T} x = 0$ in the role of the actually missing linear equality part.

For example, the univariate problem

$$
\min_{x \in \mathbb{R}} \{x: x \geq 0, - x \geq - 1\}
$$

(single conic constraint with ${\bf K} ={\bf R}_{+}^{2}$ , no linear equalities) is strictly feasible, same as the problem

$$
\min_{x \in \mathbb{R}} \{x: x = 0\}
$$

(no conic constraint, only linear equality one), while the problem

$$
\min_{x \in \mathbb{R}} \{x: x \geq 0, - x \geq 0\}
$$

(single polyhedral conic constraint with ${\bf K} ={\bf R}_{+}^{2}$ , no linear equalities) is essentially strictly feasible, but is not strictly feasible.

Note: When the conic constraint in the primal problem allows for splitting into ”general” and ”polyhedral” parts:

$$
\operatorname{Opt}(P) = \min_{x} \left\{c^{T} x: Ax - b \in \mathbf{K}, Px - p \geq 0, Rx = r \right\}\tag{P}
$$

then the dual problem reads

$$
\operatorname{Opt}(D) = \max_{\lambda, \theta, \mu} \left\{\langle b, \lambda \rangle + p^{T} \theta + r^{T} \mu : \lambda \in \mathbf{K}_{*}, \theta \geq 0, A^{*} \lambda + P^{T} \theta + \mathbb{R}^{T} \mu = c \right\}\tag{D}
$$

so that its conic constraint also is split into ”general” and ”polyhedral” parts.

Definition 1.4.3 Let K be a regular cone. A conic constraint

$$
Ax - b \geq_{\mathbf{K}} 0\tag{\((*)\}
$$

is called strictly feasible, if there exists x¯ which satisfies the constraint strictly: $A{\bar{x}} - b >_{\mathbf{K}}$ 0 $(i.e, A{\bar{x}} - b \in \operatorname{int} K)$

The constraint is called essentially strictly feasible, if K can be represented as the direct product of several factors, some of them nonnegative orthants (“polyhedral factors”), and there exists an essentially strictly feasible solution – a feasible solution x¯ such that Ax¯ − b belongs to the direct product of these polyhedral factors and the interiors of the remaining factors.

Note: Essential strict feasibility of (∗) means that in fact (∗) is a system of several conic constraints, some of them just ≥-type ones, and there exists ¯x which satisfies the $\geq$ constraints and strictly satisfies all other constraints of the system. For example,

- the system of constraints in variables $x \in \mathbb{R}^{3}$

$$
x_{1} - x_{2} \geq 0, x_{2} - x_{1} \geq - 1, x_{3} \geq \sqrt{x_{1}^{2} + x_{2}^{2}}
$$

(it can be thought of as a single conic constraint with ${\bf K} ={\bf R}_{+} \times{\bf R}_{+} \times{\bf L}^{3})$ is strictly feasible, a strictly feasible solution being, $\mathrm{e.g.,} \x_{1} = 0.5, x_{2} = 0, x_{3} = 1$ ;

- the system of constraints in variables $x \in \mathbb{R}^{3}$

$$
x_{1} - x_{2} \geq 0, x_{2} - x_{1} \geq 0, x_{3} \geq \sqrt{x_{1}^{2} + x_{2}^{2}}
$$

— a single conic constraint with the same cone $\mathbf{K} = \mathbb{R}_{+} \times \mathbb{R}_{+} \times \mathbf{L}^{3}$ as above — clearly is not strictly feasible, but is essentially strictly feasible, an essentially strictly feasible solution being, e.g. $x_{1} = 0, x_{2} = 0, x_{3} = 1$

Theorem 1.4.2 [Conic Duality Theorem] Consider conic program along with its dual:

$$
\begin{array}{rcl} \mathrm{Opt}(P) & = & \min_{x} \left\{c^{T} x: Ax - b \in{\bf K}, Rx = r \right\} \\ \mathrm{Opt}(D) & = & \max_{\lambda, \mu} \left\{\langle b, \lambda \rangle + r^{T} \mu : \lambda \in{\bf K}_{*}, A^{*} \lambda + \mathbb{R}^{T} \mu = c \right\} \end{array}\tag{P}
$$

(D)

Then

- [Primal-Dual Symmetry] The duality is symmetric: (D) is conic along with (P ) and the problem dual to (D) is (equivalent to) (P ).

- [Weak Duality] One has Opt $(D) \leq \mathrm{Opt}(P)$

- [Strong Duality] Assume that one of the problems $(P),(D)$ is strictly feasible and bounded, boundedness meaning on the feasible set the objective is bounded from below in the minimization and from above – in the maximization case. Then the other problem in the pair is solvable, and

$$
\operatorname{Opt}(P) = \operatorname{Opt}(D).
$$

In particular, if both problems are strictly feasible (and thus both are bounded by Weak Duality), then both problems are solvable with equal optimal values.

In addition, if one of the problems is strictly feasible, then $\mathrm{Opt}(P) = \mathrm{Opt}(D)$

Proof.

A. Primal-Dual Symmetry: (D) is a conic problem. To write down its dual, we rewrite it as a minimization problem

$$
- \operatorname{Opt}(D) = \min_{\lambda, \mu} \left\{- \langle b, \lambda \rangle - r^{T} \mu : \lambda \in \mathbf{K}_{*}, A^{*} \lambda + \mathbb{R}^{T} \mu = c \right\}
$$

denoting the Lagrange multipliers for the constraints $\lambda \in \mathbf{K},$ <sub>∗</sub> and $A^{*} \lambda + \mathbb{R}^{T} \mu = c \mathrm{by} \z \ \mathrm{and} \ - x$ 2 the dual to dual problem reads

$$
\max_{z, x} \bigg \{- c^{T} x: \underbrace{- Ax + z = - b, z \in(\mathbf{K}_{*})_{*}[= \mathbf{K}]}_{\text{says that} Ax - b \in \mathbf{K}}, - Rx = - r \bigg\}.
$$

Eliminating z, we arrive at $(P)$

B. Weak Duality By construction of the dual.

C. Strong Duality: We should prove that if one of the problems $(P),(D)$ is strictly feasible and bounded, then the other problem is solvable with $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ , or, which is the same by Weak Duality, with $\mathrm{Opt}(D) \geq \mathrm{Opt}(P)$ . By Primal-Dual Symmetry, we lose nothing when assuming that (P ) is strictly feasible and bounded.

C.0. Observe that the fact we should prove is “stable w.r.t. shift in x: passing in $(P)$ from variable x to variable $h = x - \bar{x}$ , the problem becomes

$$
\left[\operatorname{Opt}(P) - c^{T} \bar{x} = \right] \operatorname{Opt}(P^{\prime}) = \min_{h} \left\{c^{T} h: Ah -[b - A \bar{x}] \ge_{\mathbf{K}} 0, Rh =[r - R \bar{x}] \right\},
$$

with the dual being

$$
\operatorname{Opt}(D^{\prime}) = \max_{\lambda, \mu} \left\{\langle b - A \bar{x}, \lambda \rangle +[r - R \bar{x}]^{T} \mu : \lambda \in \mathbf{K}_{*}, A^{*} \lambda + \mathbb{R}^{T} \mu = c \right\}\tag{\((D')\}
$$

We see that the feasible set of $(D^{\prime})$ is exactly the same as the one of $(D)$ , and at a point $(\lambda, \mu)$ from this set the objective of $(D^{\prime})$ is the objective of (D) minus the quantity

$$
\langle A \bar{x}, \lambda \rangle +[R \bar{x}]^{T} \mu = \bar{x}^{T}[A^{*} \lambda + \mathbb{R}^{T} \mu] = c^{T} \bar{x}
$$

Thus, $(D^{\prime})$ is obtained from (D) by keeping the feasible set of $(D)$ intact and shifting the objective by the constant $- c^{T} \bar{x}$ . Consequently, (D) and $(D^{\prime})$ are solvable/unsolvable simultaneously, and $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ is exactly the same as $\mathrm{Opt}(P^{\prime}) = \mathrm{Opt}(D^{\prime})$

The observation we have just made says that we lose nothing when assuming that the strictly feasible solution ¯x is just the origin, implying that $r = 0, b <_{\mathbf{K}} 0$ , and the dual problem reads

$$
\max_{\lambda, \mu} \left\{\langle b, \lambda \rangle : \lambda \in \mathbf{K}_{*}, A^{*} \lambda + \mathbb{R}^{T} \mu = c \right\}\tag{D}
$$

C.1. Let $F = \{x : Rx = 0\}$ be the set of solutions to the system of primal equality constraints. Consider the sets

$$
S = \{(s, z) \in \mathbb{R} \times E: s < \operatorname{Opt}(P), z \leq_{\mathbf{K}} 0\}, T = \{(s, z) \in \mathbb{R} \times E: \exists x \in F: c^{T} x \leq s, b - Ax \leq_{\mathbf{K}} z\}.
$$

Clearly, S and T are nonempty convex sets with empty intersection. Now let us use the following fundamental fact: (see Section B.2.6):

Theorem 1.4.3 [Separation Theorem for Convex Sets] Let $S, T$ be nonempty nonintersecting convex subsets of a finite-dimensional Euclidean space H with inner product $\langle \cdot, \cdot \rangle$ . Then S and T can be separated by a linear functional: there exists a nonzero vector $\lambda \in \mathbf{H}$ such that

$$
\sup_{u \in S} \langle \lambda, u \rangle \leq \inf_{u \in T} \langle \lambda, u \rangle.
$$

By Separation Theorem, we can find a pair $0 \neq(\alpha, \lambda) \in \mathbb{R} \times \mathbb{E}$ such that

$$
\underbrace{\sup_{s < \operatorname{Opt}(P), z \leq_{K} 0}[\alpha s + \langle \lambda, z \rangle]}_{\equiv \sup_{(s, z) \in S}[\alpha s + \langle \lambda, z \rangle]} \leq \inf_{(s, z) \in T}[\alpha s + \langle \lambda, z \rangle].\tag{1.4.2}
$$

The left hand side in this inequality should be finite, implying that $\alpha \geq 0$ and $\lambda \in \mathbf{K}_{*}$ . In view of this observation and the definitions of $S$ and $T$ , the left hand side in the inequality s $\alpha \mathrm{Opt}(P)$ , and the right hand side is

$$
\inf_{x} \left\{\alpha c^{T} x + \langle b - Ax, \lambda \rangle : x \in F \right\}.
$$

Thus, by (1.4.2) we have

$$
\alpha \mathrm{Opt}(P) \leq \inf_{x \in F} \left[\alpha c^{T} x + \langle b - Ax, \lambda \rangle \right].\tag{1.4.3}
$$

Recall that $\alpha \geq 0$ and $\lambda \in \mathbf{K}_{*}$ . We claim that in fact $\alpha > 0$ . Indeed, assuming $\alpha = 0$ , we have $\lambda \neq 0$ (since $(\alpha, \lambda) \neq 0)$ and $\lambda \in \mathbf{K}_{*}$ , whence $\langle b, \lambda \rangle < 0$ (recall that $b <_{\mathbf{K}} 0)$ . As a result, (1.4.3) cannot hold true (look what happens with the right hand side when $x = 0 \in F)$ which is the desired contradiction.

We conclude that $\alpha > 0$ , so that (1.4.3) implies that $\lambda_{*} = \alpha^{- 1} \lambda$ is well defined, belongs to ${\bf K}_{*}$ and satisfies the relation

$$
\forall(x \in F): \ell(x) := c^{T} x - \langle Ax, \lambda_{*} \rangle \geq \delta := \operatorname{Opt}(\lambda) - \langle b, \lambda_{*} \rangle.
$$

Recall that F is the linear subspace $Rx = 0$ , and since the linear form $\ell(x)$ is below bounded by d on this space, it is identically zero on $F,$ and $\delta \leq 0$ . In particular, $c - A^{*} \lambda.$ is orthogonal to $F_{;}$ implying by Linear Algebra that $c = A^{*} \lambda_{*} + \mathbb{R}^{T} \mu_{*}$ for some $\mu_{*}$ . Recalling that $\lambda_{*} \in \bf{K}$ ∗ and looking at $(D)$ , we see that $(\lambda_{*}, \mu_{*})$ is a feasible solution to $(D)$ ; the value $b^{T} \lambda_{*}$ of the dual objective at this feasible solution is $\geq \mathrm{Opt}(P)$ due to $\delta \leq 0$ , which, by weak duality, implies that $(\lambda_{*}, \mu_{*})$ is optimal solution to $(D)$ and $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ .

C.2. We have proved that when one of the problems $(P),(D)$ is strictly feasible and bounded, then the other one is solvable, and $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ . As a result, when both $(P)$ and $(D)$ are strictly feasible, then both are solvable with equal optimal values (since by Weak Duality when one of the problems is feasible, the other one is bounded). Finally, we should verify that if one of the problems $(P),(D)$ is strictly feasible, then $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ . By Primal-Dual Symmetry, we lose nothing when assuming that $(P)$ is strictly feasible. If $(P)$ is bounded, then we already know that $\mathrm{Opt}(D) = \mathrm{Opt}(P)$ . And when $(P)$ us unbounded, we have $\operatorname{Opt}(P) = - \infty.$ , whence $\mathrm{Opt}(D) = - \infty$ by Weak Duality. Verification of Strong Duality is completed.

D. Optimality conditions. Let x be feasible for $(P),(\lambda, \mu)$ be feasible for (D), and let one of the problems be strictly feasible and bounded, so that $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ are two equal reals. We have

$$
\text{DualityGap}(x,(\lambda, \mu)) = c^{T} x -[\langle b, \lambda \rangle + r^{T} \mu] = \underbrace{\left[c^{T} x - \text{Opt}(P) \right]}_{\geq 0} + \underbrace{\left[Opt(D) -[\langle b, \lambda \rangle + r^{T} \mu] \right]}_{\geq 0}
$$

We see that in the case under consideration the duality gap is the sum of non-optimalities of the primal feasible solution and the dual feasible solution in terms of respective problems, implying ghat the duality gap is zero if and only if the solutions in question are optimal for the respective problems.

The “Complementary Slackness” necessary and sufficient, under the circumstances, optimality condition is readily given by the fact that for primal-dual feasible $x,(\lambda, \mu)$ (in fact- for $x,(\lambda, \mu)$ satisfying only the linear equality constraints of the respective problems), we have

$$
c^{T} x -[\langle b, \lambda \rangle + r^{T} \mu] =[A^{*} \lambda + \mathbb{R}^{T} \mu]^{T} x -[\langle b, \lambda \rangle + r^{T} \mu] = \langle \lambda, Ax - b \rangle + \underbrace{\mu^{T}[Rx - r]}_{= 0},
$$

that is, the duality gap is zero if and only if complementary slackness takes place.

## 1.4.5.1 Refinement

We can slightly refine the Conic Duality Theorem, applying “special treatment” to scalar linear inequality constraints. Specifically, assume that our primal problem is

$$
\operatorname{Opt}(P) = \min_{x} \left\{c^{T} x: \begin{array}{ll} Px - p \geq 0 &(a) \\ Ax - b \in \mathbf{K} &(b) \end{array} \right\}\tag{P}
$$

where K is regular cone in Euclidean space $E;$ to save notation, we assume that linear equality constraints, if any, are represented by pairs of opposite scalar linear inequalities included into (a) . As we know, with (P ) in this form, the dual problem is

$$
\operatorname{Opt}(D) = \max_{\theta, \lambda} \left\{\theta^{T} p + \langle b, \lambda \rangle : \theta \geq 0, \lambda \in \mathbf{K}_{*}, P^{T} \theta + A^{T} \lambda = c \right\}\tag{D}
$$

The refinement in question is as follows:

Theorem 1.4.4 [Refined Conic Duality Theorem] Consider a primal-dual pair of conic programs $(P),(D)$ . All claims of Conic Duality Theorem $1.4.2$ remain valid when replacing in its formulation “strict feasibility” with “essentially strict feasibility” as defined in Definition 1.4.2.

Note that the Refined Conic Duality Theorem covers the usual Linear Programming Duality Theorem: the latter is the particular case of the former corresponding to the case when the only “actual” constraints are the polyhedral ones (which formally can be modeled by setting ${\bf K} ={\bf R}_{+}$ and $Ax - b \equiv 1)$

Proof. The only claim we should take care of is that Strong Duality remains valid when strict feasibility is relaxed to essentially strict feasibility, provided that $(P),(Q)$ are of the form postulated in this Section. On a closest inspection, it is immediately seen that all we need is to prove that if one of the problems $(P),(D)$ is bounded and essentially strictly feasible, then the other problem is solvable, and optimal values are equal to each other. Same as in the proof of Theorem 1.4.2, we lose nothing when assuming that the essentially strictly feasible and bounded problem is (P ).

Next, let us select among essentially strictly feasible solutions to $(P)$ the one which maximizes the number of constraints in the polyhedral part $Px - p \ge 0$ which are strictly satisfied at this solution. By reasons completely similar to those used in item C.0 of the proof of Theorem 1.4.2 we lose nothing when assuming that this essentially strictly feasible solution is the origin (implying that $b <_{\mathbf{K}} 0$ and $p \leq 0)$ . We also loose nothing when assuming that the constraints $Px - p \geq 0$ indeed are present, since otherwise all we need is given by Theorem 1.4.2; let $m > 0$ be the dimension of $p.$

It may happen that all constraints $Px - p \geq 0$ are strictly satisfied at the origin $(\mathrm{i.e.,} p < 0)$ In this case the origin is strictly feasible solution to $(P)$ , and we get everything we need from Theorem 1.4.2 as applied with $R = 0, r = 0$ , the cone ${\mathbb{R}}_{+}^{m} \times{\mathbf{K}}$ in the role of K, and the mapping $x \mapsto[Px - p; Ax - b]$ in the role of the mapping $x \mapsto Ax - b$ . Now assume that $\nu, 0 < \nu \leq m$ , of the entries in $p$ are zeros, and the remaining, if any, are strictly negative. We lose nothing when assuming that the last ν entries in p are zeros, and the first $m - \nu$ are negative. Now let us split the constraints $Px - p \geq 0$ into two groups: the first $m - \nu$ forming the system $Qx - q \ge 0$ with $q < 0$ and the last ν forming the system $Rx \ge 0$ . We claim that the system of constraints

$$
Rx \geq 0\tag{!}
$$

has the same set of solutions as the system of linear equations

$$
Rx = 0.\tag{!!}
$$

The only thing we should check is that if ¯x solves (!), it solves (!!) as well, that is, all entries in Rx¯ (which are nonnegative) are in fact zeros. Indeed, assuming that some of these entries are positive, we conclude that for small positive t the vector tx¯ strictly satisfies, along with $x = 0$ the constraint $Ax - b \geq_{\mathbf{K}}$ 0 and the constraints $Qx - q \geq 0$ , and satisfies all the constraints $Rx \ge 0$ , some of them – strictly. In other words, tx¯ is an essentially strictly feasible solution to $(P)$ were the number of strictly satisfied constraints of the system $Px - p \ge 0$ is larger than at the origin; this is impossible, since by construction $x = 0$ is the essentially strictly feasible solution to $(P)$ with the largest possible number of constraints $Px - p \geq 0$ which are satisfied at this solution strictly.

Now let $\mathbf{K}^{+} = \mathbb{R}_{+}^{m - \nu} \times \mathbf{K} \subset \mathbb{E}^{+} = \mathbb{R}^{m - \nu} \times E$ . Consider the conic problem

$$
\operatorname{Opt}(P^{\prime}) = \min_{x} \left\{c^{T} x:[Q; A] x -[q; b] \geq_{\mathbf{K}^{+}} 0, Rx = r \equiv 0 \right\}\tag{\((P')\}
$$

where $[Q; A] x -[q; b] \equiv(Qx - q, Ax - b)$ . By construction and in view of the fact that solution sets to (!) and (!!) are the same, the feasible set of the conic problem $(P^{\prime})$ and its objective are exactly the same as in $(P)$ , implying that $(P^{\prime})$ is bounded and $\mathrm{Opt}(P^{\prime}) = \mathrm{Opt}(P)$ . Besides this, $(P^{\prime})$ is strictly feasible, a strictly feasible solution being the origin. Applying Theorem 1.4.2, the problem

$$
\operatorname{Opt}(D^{\prime}) = \max_{\gamma, \mu, \lambda} \Bigg \{\langle b, \lambda \rangle + \underbrace{q^{T} \gamma}_{= p^{T}[\gamma; \mu]}: \lambda \in \mathbf{K}_{*}, \gamma \geq 0, \underbrace{Q^{T} \gamma + \mathbb{R}^{T} \mu}_{= P^{T}[\gamma; \mu]} + A^{*} \lambda = c \Bigg\}\tag{\((D')\}
$$

dual to $(P^{\prime})$ is solvable with $\mathrm{Opt}(D^{\prime}) = \mathrm{Opt}(P^{\prime})$ , whence $\mathrm{Opt}(D^{\prime}) = \mathrm{Opt}(P)$ . Now let $\gamma_{*}, \mu_{*}, \lambda_{*}$ be an optimal solution to (D<sup>0</sup>). Since (!!) is consequence of (!), for every column $\rho$ of $\mathbb{R}^{T}$ the vector $- \rho$ is a conic combination of the rows $\rho_{1},..., \rho_{\nu}$ of $\mathbb{R}^{T}$ (since the homogeneous linear inequality $\rho^{T} x \le 0$ is consequence of (!); recall Homogeneous Farkas Lemma). It follows that we can find a vector $\mu_{*}^{+} \geq 0$ such that $\mathbf{\bar{\Psi}} \mathbb{R}^{T} \boldsymbol{\mu}_{*} = \mathbb{R}^{T} \boldsymbol{\mu}_{*}^{+}$ . It follows that $\gamma_{*}, \mu_{*}^{+}, \lambda_{*}$ is an optimal solution to $(D^{\prime})$ with the value of the objective $\mathrm{Opt}(D^{\prime}) = \mathrm{Opt}(P)$ . Looking at (D) and $(D^{\prime})$ and recalling that $\gamma_{*} \geq 0, \mu_{*}^{+} \geq 0$ and that the last ν entries in p are zeros, we conclude immediately that $\theta_{*}^{+} : =[\gamma_{*}; \mu_{+}^{+}], \lambda_{*}$ is a feasible solution to (D) with the value of the objective $\mathrm{Opt}(P)$ By Weak Duality as applied to $(P), \(D)$ , this solution is optimal. Thus, (D) is solvable, and $\mathrm{Opt}(P) = \mathrm{Opt}(D)$ ✷

## 1.4.6 Is something wrong with conic duality?

The statement of the Conic Duality Theorem is weaker than that of the LP Duality theorem: in the LP case, feasibility (even non-strict) and boundedness of either primal, or dual problem implies solvability of both the primal and the dual and equality between their optimal values. In the general conic case something “nontrivial” is stated only in the case of strict (or essentially strict) feasibility (and boundedness) of one of the problems. It can be demonstrated by examples that this phenomenon reflects the nature of things, and is not due to our ability to analyze it. The case of non-polyhedral cone K is truly more complicated than the one of the nonnegative orthant $\mathbf{K};$ as a result, a “word-by-word” extension of the LP Duality Theorem to the conic case is false.

Example 1.4.2 Consider the following conic problem with 2 variables $x =(x_{1}, x_{2})^{T}$ and the 3-dimensional ice-cream cone K:

$$
\min \left\{x_{1}: Ax - b \equiv \left[\begin{array}{c} x_{1} - x_{2} \\ 1 \\ x_{1} + x_{2} \end{array} \right] \geq_{\mathbf{L}^{3}} 0 \right\}.
$$

Recalling the definition of ${\bf L}^{3}$ , we can write the problem equivalently as

$$
\min \left\{x_{1}: \sqrt{(x_{1} - x_{2})^{2} + 1} \leq x_{1} + x_{2} \right\},
$$

i.e., as the problem

$$
\min \left\{x_{1}: 4x_{1} x_{2} \geq 1, x_{1} + x_{2} > 0 \right\}.
$$

Geometrically the problem is to minimize $x_{1}$ over the intersection of the 3D ice-cream cone with a 2D plane; the inverse image of this intersection in the “design plane” of variables $x_{1}, x_{2}$ is part of the 2D nonnegative orthant bounded by the hyperbola $x_{1} x_{2} \geq 1 / 4$ . The problem is clearly strictly feasible (a strictly feasible solution is, e.g., $x =(1, 1)^{T})$ and bounded below, with the optimal value 0. This optimal value, however, is not achieved – the problem is unsolvable!

Example 1.4.3 Consider the following conic problem with two variables $\boldsymbol{x} =(x_{1}, x_{2})^{T}$ and the 3-dimensional ice-cream cone K:

$$
\min \left\{x_{2}: Ax - b = \left[\begin{array}{c} x_{1} \\ x_{2} \\ x_{1} \end{array} \right] \geq_{\mathbf{L}^{3}} 0 \right\}.
$$

The problem is equivalent to the problem

$$
\left\{x_{2}: \sqrt{x_{1}^{2} + x_{2}^{2}} \leq x_{1} \right\},
$$

i.e., to the problem

$$
\min \left\{x_{2}: x_{2} = 0, x_{1} \geq 0 \right\}.
$$

The problem is clearly solvable, and its optimal set is the ray $\{x_{1} \geq 0, x_{2} = 0\}$

Now let us build the conic dual to our (solvable!) primal. It is immediately seen that the cone dual to an ice-cream cone is this ice-cream cone itself. Thus, the dual problem is

$$
\max_{\lambda} \left\{0: \left[\begin{array}{c} \lambda_{1} + \lambda_{3} \\ \lambda_{2} \end{array} \right] = \left[\begin{array}{c} 0 \\ 1 \end{array} \right], \lambda \geq_{\mathbf{L}^{3}} 0 \right\}.
$$

In spite of the fact that primal is solvable, the dual is infeasible: indeed, assuming that λ is dual feasible, we have $\lambda \geq_{\mathbf{L}^{3}} 0$ , which means that $\lambda_{3} \geq \sqrt{\lambda_{1}^{2} + \lambda_{2}^{2}};$ since also $\lambda_{1} + \lambda_{3} = 0$ , we come to $\lambda_{2} = 0$ , which contradicts the equality $\lambda_{2} = 1$

We see that the weakness of the Conic Duality Theorem as compared to the LP Duality one reflects pathologies which indeed may happen in the general conic case.

## 1.4.7 Consequences of the Conic Duality Theorem

## 1.4.7.1 sufficient condition for infeasibility

Recall that a necessary and sufficient condition for infeasibility of a (finite) system of scalar linear inequalities (i.e., for a vector inequality with respect to the partial ordering ≥) is the possibility to combine these inequalities in a linear fashion in such a way that the resulting scalar linear inequality is contradictory. In the case of cone-generated vector inequalities a slightly weaker result can be obtained:

Proposition 1.4.2 [Conic Theorem on Alternative] Consider a linear vector inequality

$$
Ax - b \geq_{\mathbf{K}} 0.\tag{I}
$$

(i) If there exists λ satisfying

$$
\lambda \geq_{\mathbf{K}_{*}} 0, A^{*} \lambda = 0, \langle \lambda, b \rangle > 0,\tag{II}
$$

then (I) has no solutions.

(ii) If (II) has no solutions, then (I) is “almost solvable” – for every positive $\epsilon$ there exists $b^{\prime}$ such that $\| b^{\prime} - b \|_{2} < \epsilon$ and the perturbed system

$$
Ax - b^{\prime} \ge_{\mathbf{K}} 0
$$

is solvable.

Moreover,

(iii) (II) is solvable if and only if (I) is not “almost solvable”.

Note the diference between the simple case when $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}}}$ is the usual partial ordering $\geq$ and the general case. In the former, one can replace in (ii) “nearly solvable” by “solvable”; however, in the general conic case “almost” is unavoidable.

Example 1.4.4 Let system (I) be given by

$$
Ax - b \equiv \left[\begin{array}{c} x + 1 \\ x - 1 \\ \sqrt{2} x \end{array} \right] \ge_{\mathbf{L}^{3}} 0.
$$

Recalling the definition of the ice-cream cone ${\bf L}^{3}$ , we can write the inequality equivalently as

$$
\sqrt{2} x \geq \sqrt{(x + 1)^{2} +(x - 1)^{2}} \equiv \sqrt{2x^{2} + 2},\tag{i}
$$

which of course is unsolvable. The corresponding system (II) is

$$
\begin{array}{rl} \lambda_{3} \geq \sqrt{\lambda_{1}^{2} + \lambda_{2}^{2}} & \left[\Leftrightarrow \lambda \geq_{\mathbf{L}_{*}^{3}} 0 \right] \\ \lambda_{1} + \lambda_{2} + \sqrt{2} \lambda_{3} = 0 & \left[\Leftrightarrow A^{T} \lambda = 0 \right] \\ \lambda_{2} - \lambda_{1} > 0 & \left[\Leftrightarrow b^{T} \lambda > 0 \right] \end{array}\tag{ii}
$$

From the second of these relations, $\lambda_{3} = - \textstyle{\frac{1}{\sqrt{2}}}(\lambda_{1} + \lambda_{2})$ , so that from the first inequality we get $0 \leq(\lambda_{1} - \lambda_{2})^{2}$ , whence $\lambda_{1} = \lambda_{2}$ . But then the third inequality in (ii) is impossible! We see that here both (i) and (ii) have no solutions.

The geometry of the example is as follows. (i) asks to find a point in the intersection of the 3D ice-cream cone and a line. This line is an asymptote of the cone (it belongs to a 2D plane which crosses the cone in such way that the boundary of the cross-section is a branch of a hyperbola, and the line is one of two asymptotes of the hyperbola). Although the intersection is empty ((i) is unsolvable), small shifts of the line make the intersection nonempty (i.e., (i) is unsolvable and “almost solvable” at the same time). And it turns out that one cannot certify the fact that (i) itself is unsolvable by providing a solution to (ii).

Proof of the Proposition. (i) is evident (why?).

Let us prove (ii). To this end it sufices to verify that if (I) is not “almost solvable”, then (II) is solvable. Let us fix a vector $\sigma >_{\mathbf{K}}$ 0 and look at the conic problem

$$
\min_{x, t} \left\{t: Ax + t \sigma - b \geq_{\mathbf{K}} 0 \right\}\tag{CP}
$$

in variables $(x, t)$ . Clearly, the problem is strictly feasible (why?). Now, if (I) is not almost solvable, then the optimal value in (CP) is strictly positive (otherwise the problem would admit feasible solutions with t close to 0, and this would mean that (I) is almost solvable). From the Conic Duality Theorem it follows that the dual problem of (CP)

$$
\max_{\lambda} \left\{\langle b, \lambda \rangle : A^{*} \lambda = 0, \langle \sigma, \lambda \rangle = 1, \lambda \ge_{\mathbf{K}_{*}} 0 \right\}
$$

has a feasible solution with positive $\langle b, \lambda \rangle$ , i.e., (II) is solvable.

It remains to prove (iii). Assume first that (I) is not almost solvable; then (II) must be solvable by (ii). Vice versa, assume that (II) is solvable, and let λ be a solution to (II). Then λ solves also all systems of the type (II) associated with small enough perturbations of b instead of b itself; by (i), it implies that all inequalities obtained from (I) by small enough perturbation of b are unsolvable. ✷

Explanation and refinement. The set B of those b’s for which (I) is solvable is nothing but

$$
B = \{b = Ax - y: y \in \mathbf{K}\};
$$

this set clearly is convex and nonempty, but not necessarily is closed. Clearly, the set $\overline{B}$ of those b’s for which (I) is almost solvable is exactly the closure clB of B. Now, by Conic Theorem on Alternative, solvability of (II) is exactly the same as the fact that b 6∈ B. When B is closed, to be outside of B and outside of $\overline{B}$ is the same, and in this special case (I) is unsolvable if and only if (II) is solvable. For example, this is the case when K is a nonnegative orthant, since here B is polyhedrally representable and therefore polyhedral and therefore closed. However, in general B not necessarily is closed, this is why there is a gap between insolvability of (I) (that is, the fact that $b \notin B)$ and solvability of (II) (that is, the fact that $b \notin{\overline{{B}}})$

Note that we can slightly refine Conic Theorem on Alternative by considering the case when the conic constraint in question has “general” and “polyhedral” parts:

Proposition 1.4.3 [Refined Conic Theorem on Alternative] Consider a linear vector inequality split into “general” and “polyhedral” parts

$$
Px - p \geq_{\mathbf{L}} 0, Qx - q \geq 0\tag{I}
$$

(i) If there exists λ and µ satisfying

$$
\lambda \geq_{\mathbf{L}_{*}} 0, \mu \geq 0, P^{*} \lambda + Q^{T} \mu = 0, \langle \lambda, p \rangle + \mu^{T} q > 0,\tag{II}
$$

(that is, aggregating the components of (I) with weights λ and $\mu$ leads to a contradictory inequality), then (I) has no solutions.

(ii) If (II) has no solutions, then (I) is “almost solvable” – for every positive $\epsilon$ there exists $p^{\prime}$ such that $\| p^{\prime} - p \|_{2} < \epsilon$ and the perturbed system

$$
Px - p^{\prime} \ge_{\mathbf{L}} 0, Qx - q \ge 0
$$

is solvable.

Moreover,

(iii) (II) is solvable if and only if (I) is not “almost solvable”.

Note the diference with Proposition 1.4.2: now “almost solvability” means the possibility to make (I) feasible by arbitrarily small perturbation of block p of the conic constraint $Ax - b : =$ $[Px; Qx] -[p; q] \ge_{\bf K} 0,{\bf K} ={\bf L} \times{\bf R}_{+}^{n}$ , while in Proposition 1.4.2 we were allowed to perturb the entire b.

Proof. It sufices to prove (iii). In one direction: let (II) be solvable, and $\lambda, \mu$ be a solution to (II), and in particular $P^{*} \lambda{+} Q^{T} \mu = 0$ . Then for small positive $\epsilon$ and all $p^{\prime}$ such that $\| p^{\prime} - p \|_{2} \leq \epsilon$ we have $\langle \lambda, p^{\prime} \rangle + \mu^{T} q > 0$ , implying that for every x it holds

$$
\langle \lambda, Px - p^{\prime} \rangle + \mu^{T}(Qx - q) = - \langle \lambda, p^{\prime} \rangle - \mu^{T} q < 0,
$$

implying that there is no x such that $Px - p^{\prime} \ge_{\mathbf{L}} 0$ and $Qx \geq q$ (recall that $\lambda \ge_{\mathbf{L}_{*}} ~ 0$ and $\mu \geq 0)$ Thus, all small enough perturbations of p keep (I) infeasible, so that (I) is not almost solvable, as claimed.

In the opposite direction: assume that (II) is unsolvable, and let us prove that (I) is almost solvable. Assume that the latter is not the case, that is (II) is unsolvable and (I) is not almost solvable, and let us lead this assumption to contradiction. First, observe that the system of constraints $Qx - q \ge 0$ is solvable, since otherwise by the usual Theorem on Alternative there exists $\mu \geq 0$ such that $Q^{T} \boldsymbol{\mu} = 0$ and $q^{T} \mu > 0$ ; augmenting $\mu$ by $\lambda = 0$ , we get a solution to (II), which is unsolvable. Next, let us set

$$
B = \{r: \exists x, y: r = Px - y, y \in \mathbf{L}, Qx \geq q\}
$$

Since the system $Qx \geq q$ of constraints on x is solvable, B is a nonempty (and clearly convex) set; it is comprised of all $r_{\mathrm{}}^{\prime} s$ such that the system

$$
Px - r \geq_{\mathbf{L}} 0, Qx - q \geq 0
$$

of constraints on x is solvable. Since (I) is not almost solvable p does not belong to the closure B of B. By Separation Theorem, p can be strictly separated from B: there exist $\alpha > 0$ and λ such that

$$
\begin{array}{rcl} \langle \lambda, p \rangle & \geq & \alpha + \sup_{r \in B} \langle \lambda, r \rangle \\ & = & \alpha + \sup_{x, y} \{\langle \lambda, Px - y \rangle : Qx \geq q, y \in{\bf L}\} \end{array}\tag{1.4.4}
$$

we see that the concluding $\operatorname{sup}_{x, y}$ is finite, implying that $\lambda \in \mathbf{L}_{*}$ and therefore

$$
\infty > \sup_{x, y} \{\langle \lambda, Px - y \rangle : Qx \geq q, y \in \mathbf{L}\} = \sup_{x} \{\langle \lambda, Px \rangle : Qx \geq q\}.
$$

Since the system $Qx \geq q$ is solvable and su $p_{x} \{\langle \lambda, Px \rangle : Qx \ge q\}$ is finite, applying LP Duality, we conclude that there exists $\mu \geq 0$ such that $Q^{T} \mu + P^{*} \lambda = 0$ and

$$
\sup_{x} \{\langle \lambda, Px \rangle : Qx \geq q\} = - \mu^{T} q.
$$

Invoking (1.4.4), we get

$$
\langle \lambda, p \rangle \geq \alpha - q^{T} \mu,
$$

and, as we have seen $\lambda \in{\bf L}_{*}, \mu \geq 0, P^{*} \lambda + Q^{T} \mu = 0$ , implying that $(\lambda, \mu)$ is a solution to (II), which is the desired contradiction. ✷

## 1.4.7.2 When is a scalar linear inequality a consequence of a given linear vector inequality?

The question we are interested in is as follows: given a linear vector inequality

$$
Ax \geq_{\mathbf{K}} b\tag{V}
$$

and a scalar inequality

$$
c^{T} x \geq d\tag{S}
$$

we want to check whether (S) is a consequence of (V). If K is the nonnegative orthant, the answer is given by the Inhomogeneous Farkas Lemma:

Inequality (S) is a consequence of a feasible system of linear inequalities $Ax \geq b$ if and only if (S) can be obtained from (V) and the trivial inequality $1 \geq 0$ in a linear fashion (by taking weighted sum with nonnegative weights).

In the general conic case we can get a slightly weaker result:

Proposition 1.4.4 (i) $If \left(\mathrm{S} \right)$ can be obtained from (V) and from the trivial inequality $1 \geq 0$ by admissible aggregation, i.e., there exist weight vector $\lambda \geq_{\mathbf{K}}$ 0 such that

$$
A^{*} \lambda = c, \langle \lambda, b \rangle \geq d,
$$

then (S) is a consequence $of \left(\mathrm{V} \right)$

(ii) $H \left(\mathrm{S} \right)$ is a consequence of an essentially strictly feasible linear vector inequality (V), then (S) can be obtained from (V) by an admissible aggregation.

The diference between the case of the partial ordering $\geq$ and a general partial ordering $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}}$ is in the words “essentially strictly” in (ii).

Proof of the proposition. (i) is evident (why?). To prove (ii), assume that (V) is strictly feasible and (S) is a consequence of (V) and consider the conic problem

$$
\min_{x, t} \left\{t: \bar{A} \binom{x}{t} - \bar{b} \equiv \left[\begin{array}{c} Ax - b \\ d - c^{T} x + t \end{array} \right] \geq_{\bar{\mathbf{K}}} 0 \right\}, \bar{\mathbf{K}} = \{(x, t): x \in \mathbf{K}, t \geq 0\}
$$

The problem is clearly essentially strictly feasible (choose x to be an essentially strictly feasible solution to (V) and then choose t to be large enough). The fact that (S) is a consequence of (V) says exactly that the optimal value in the problem is nonnegative. By the (refined) Conic Duality Theorem, the dual problem

$$
\max_{\lambda, \mu} \left\{\langle b, \lambda \rangle - d \mu : A^{*} \lambda - c = 0, \mu = 1, \binom{\lambda}{\mu} \geq_{\bar{\mathbf{K}}_{*}} 0 \right\}
$$

has a feasible solution with the value of the objective $\geq 0$ . Since, as it is easily seen, $\bar{\bf K}_{*} = \{(\lambda, \mu) : \lambda \in$ $\mathbf{K}_{*}, \mu \geq 0\}$ , the indicated solution satisfies the requirements

$$
\lambda \geq_{\mathbf{K}_{*}} 0, A^{*} \lambda = c, \langle b, \lambda \rangle \geq d,
$$

i.e., (S) can be obtained from (V) by an admissible aggregation.

## 1.4.7.3 “Robust solvability status”

Examples 1.4.3 – 1.4.4 make it clear that in the general conic case we may meet “pathologies” which do not occur in LP. E.g., a feasible and bounded problem may be unsolvable, the dual to a solvable conic problem may be infeasible, etc. Where the pathologies come from? Looking at our “pathological examples”, we arrive at the following guess: the source of the pathologies is that in these examples, the “solvability status” of the primal problem is non-robust – it can be changed by small perturbations of the data. This issue of robustness is very important in modelling, and it deserves a careful investigation.

Data of a conic problem. When asked “What are the data of an LP program min $\{c^{T} x$ $Ax - b \geq 0\}^{\ast}$ , everybody will give the same answer: “the objective $c,$ the constraint matrix A and the right hand side vector $b^{\prime}$ . Similarly, for a conic problem

$$
\min \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\},\tag{CP}
$$

its data, by definition, is the triple $(c, A, b)$ , while the sizes of the problem – the dimension n of $x$ and the dimension m of $\mathbf{K},$ same as the underlying cone K itself, are considered as the structure of (CP).

Robustness. A question of primary importance is whether the properties of the program (CP) (feasibility, solvability, etc.) are stable with respect to perturbations of the data. The reasons which make this question important are as follows:

- In actual applications, especially those arising in Engineering, the data are normally inexact: their true values, even when they “exist in the nature”, are not known exactly when the problem is processed. Consequently, the results of the processing say something definite about the “true” problem only if these results are robust with respect to small data perturbations i.e., the properties of (CP) we have discovered are shared not only by the particular (“nominal”) problem we were processing, but also by all problems with nearby data.

- Even when the exact data are available, we should take into account that processing them computationally we unavoidably add “noise” like rounding errors (you simply cannot load something like 1/7 to the standard computer). As a result, a real-life computational routine can recognize only those properties of the input problem which are stable with respect to small perturbations of the data.

Due to the above reasons, we should study not only whether a given problem (CP) is feasi ble/bounded/solvable, etc., but also whether these properties are robust – remain unchanged under small data perturbations. As it turns out, the Conic Duality Theorem allows to recognize “robust feasibility/boundedness/solvability...”.

Let us start with introducing the relevant concepts. We say that (CP) is

- robust feasible, if all “suficiently close” problems (i.e., those of the same structure (n, m, K) and with data close enough to those of (CP)) are feasible;

- robust infeasible, if all suficiently close problems are infeasible;

- robust bounded below, if all suficiently close problems are bounded below (i.e., their objectives are bounded below on their feasible sets);

- robust unbounded, if all suficiently close problems are not bounded;

- robust solvable, if all suficiently close problems are solvable.

Note that a problem which is not robust feasible, not necessarily is robust infeasible, since among close problems there may be both feasible and infeasible (look at Example 1.4.3 – slightly shifting and rotating the plane Im A − b, we may get whatever we want – a feasible bounded problem, a feasible unbounded problem, an infeasible problem...). This is why we need two kinds of definitions: one of “robust presence of a property” and one more of “robust absence of the same property”.

Now let us look what are necessary and sufficient conditions for the most important robust forms of the “solvability status”.

Proposition 1.4.5 [Robust feasibility] (CP) is robust feasible if and only if it is strictly feasible, in which case the dual problem (D) is robust bounded above.

Assuming KerA = {0}, (D) is robust feasible if and only if (D) is strictly feasible.

Proof. The statements are nearly tautological.

Problem (CP): let us fix $\delta >_{\bf K} 0$ . If (CP) is robust feasible, then for small enough $\epsilon > 0$ the perturbed problem min $\{c^{T} x : Ax - b - \epsilon \delta \geq_{\bf K} 0\}$ should be feasible; a feasible solution to the perturbed problem clearly is a strictly feasible solution to (CP). The inverse implication is evident (a strictly feasible solution to (CP) remains feasible for all problems with close enough data). It remains to note that if all problems suficiently close to (CP) are feasible, then their duals, by the Weak Conic Duality Theorem, are bounded above, so that (D) is robust above bounded.

Problem (D): let us fix $\delta >_{\mathbf{K}_{*}} 0.$ If (D) is robust feasible, the system $A^{*} \lambda = c - \epsilon A^{*} \delta$ for a small enough $\epsilon > 0$ should have a solution $\lambda_{\epsilon} \ge_{\bf K_{*}} 0$ , implying that $A^{*}[\lambda_{\epsilon} + \epsilon \delta] = c$ and $[\lambda_{\epsilon} + \epsilon \delta] >_{{\bf K}_{*}} 0$ , that is, (D) is strictly feasible. Vice versa, if (D) is strictly feasible: $A^{*} \bar{\lambda} = c$ with $\bar{\lambda} >_{\bf K_{*}} 0,$ , for $A^{\prime}$ close enough to A and $c^{\prime}$ close enough to c the vector $\Delta = A^{\prime}([A^{\prime}]^{*} A^{\prime})^{- 1}[c^{\prime} -[A^{\prime}]^{*} \bar{\lambda}]$ is well defined (recall that $\operatorname{Ker} A = \{0\})$ ), and setting $\lambda = \bar{\lambda} + \Delta$ , we clearly have $[A^{\prime}]^{*} \lambda = c^{\prime};$ besides this $\Delta 0$ as $A^{\prime} A$ and $c^{\prime} \to c,$ , implying, due to $\bar{\lambda} >_{\mathbf{K}_{*}} 0$ , that the above λ is $\geq \mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{\mathbf{K}}}}}}}.$ 0 whenever $A^{\prime}$ is close enough to $A,$ and $c^{\prime}$ is close enough to $c,$ that is, (D) is robust feasible. ✷

Proposition 1.4.6 [Robust infeasibility] Let KerA = {0}. Then (CP) is robust infeasible $if$ and only if the system

$$
\langle b, \lambda \rangle = 1, A^{*} \lambda = 0, \lambda >_{\mathbf{K}_{*}} 0\tag{1.4.5}
$$

has a solution.

Proof. First assume that (1.4.5) is solvable, and let us prove that all problems suficiently close to (CP) are infeasible. Let us fix a solution λ<sup>¯</sup> to (1.4.5). Since A is of full column rank, simple Linear Algebra says that the systems $[A^{\prime}]^{*} \lambda = 0$ are solvable for all matrices $A^{\prime}$ from a small enough neighbourhood U of $A;$ moreover, the corresponding solution $\lambda(A^{\prime})$ can be chosen to satisfy $\lambda(A) ={\bar{\lambda}}$ and to be continuou in $A^{\prime} \in U$ . Since $\lambda(A^{\prime})$ is continuous and $\lambda(A) >_{\mathbf{K}_{*}} ~ 0$ , we have $\lambda(A^{\prime}) >_{\mathbf{K}_{*}}$ 0 in a neighbourhood of $A;$ shrinking U appropriately, we may assume that $\lambda(A^{\prime}) >_{\mathbf{K}_{*}}$ 0 for all $A^{\prime} \in U$ . Now, $b^{T} \bar{\lambda} = 1 \colon$ by continuity reasons, there exists a neighbourhood V of b and a neighbourhood $U^{\prime}$ of A such that $b^{\prime} \in V$ and all $A^{\prime} \in U^{\prime}$ one has $\langle b^{\prime}, \lambda(A^{\prime}) \rangle > 0$

Thus, we have seen that there exist a neighbourhood $U^{\prime}$ of A and a neighbourhood V of $b,$ along with a function $\lambda(A^{\prime}), A^{\prime} \in U^{\prime}$ , such that

$$
\langle b^{\prime}, \lambda(A^{\prime}) \rangle > 0,[A^{\prime}]^{*} \lambda(A^{\prime}) = 0, \lambda(A^{\prime}) \geq_{\mathbf{K}_{*}} 0
$$

for all $b^{\prime} \in V$ and $A^{\prime} \in U$ . By Proposition 1.4.2.(i) it means that all the problems

$$
\min \left\{\left[c^{\prime} \right]^{T} x: A^{\prime} x - b^{\prime} \geq_{\mathbf{K}} 0 \right\}
$$

with $b^{\prime} \in V$ and $A^{\prime} \in U^{\prime}$ are infeasible, so that (CP) is robust infeasible.

Now let us assume that (CP) is robust infeasible, and let us prove that then (1.4.5) is solvable. Indeed, by the definition of robust infeasibility, there exist neighbourhoods U of A and V of b such that all vector inequalities

$$
A^{\prime} x - b^{\prime} \geq_{\mathbf{K}} 0
$$

with $A^{\prime} \in U$ and $b^{\prime} \in V$ are unsolvable. It follows that whenever $A^{\prime} \in U$ and $b^{\prime} \in V$ , the vector inequality

$$
A^{\prime} x - b^{\prime} \geq_{\mathbf{K}} 0
$$

is not almost solvable (see Proposition 1.4.2). We conclude from Proposition 1.4.2.(ii) that for every $A^{\prime} \in U$ and $b^{\prime} \in V$ there exists $\lambda = \lambda(A^{\prime}, b^{\prime})$ ) such that

$$
\langle b^{\prime}, \lambda(A^{\prime}, b^{\prime}) \rangle > 0,[A^{\prime}]^{*} \lambda(A^{\prime}, b^{\prime}) = 0, \lambda(A^{\prime}, b^{\prime}) \geq_{\mathbf{K}_{*}} 0.
$$

Now let us choose $\lambda_{0} >_{\mathbf{K}}$ 0. For all small enough positive $\epsilon$ we have $A_{\epsilon} = A + \epsilon b[A^{*} \lambda_{0}]^{T} \in U$ . Let us choose an $\epsilon$ with the latter property to be so small that $\varepsilon \langle b, \lambda_{0} \rangle > - 1$ and set $A^{\prime} = A_{\epsilon}, b^{\prime} = b$ . According to the previous observation, there exists $\lambda = \lambda(A^{\prime}, b)$ such that

$$
\langle b, \lambda \rangle > 0,[A^{\prime}]^{*} \lambda \equiv A^{*}[\lambda + \epsilon \langle b, \lambda \rangle \lambda_{0}] = 0, \lambda \geq_{\mathbf{K}_{*}} 0.
$$

Setting $\bar{\lambda} = \lambda + \epsilon \langle b, \lambda \rangle \lambda_{0}$ , we get $\bar{\lambda} >_{{\bf K}_{*}} 0$ (since $\lambda \ge_{\bf K_{*}} 0, \lambda_{0} >_{\bf K},$ 0 and $\langle b, \lambda \rangle > 0)$ , while $A^{*} \bar{\lambda} = 0$ and $\langle b, \bar{\lambda} \rangle = \langle b, \lambda \rangle(1 + \epsilon \langle b, \lambda_{0} \rangle) > 0$ . Multiplying λ<sup>¯</sup> by appropriate positive factor, we get a solution to (1.4.5). ✷

Now we are able to formulate our main result on “robust solvability”.

Proposition 1.4.7 For a conic problem (CP) with $\mathrm{{Ker}} A = \{0\}$ the following conditions are equivalent to each other

(i) (CP) is robust feasible and robust bounded (below);

(ii) (CP) is robust solvable;

(iii) (D) is robust solvable;

(iv) (D) is robust feasible and robust bounded (above);

(v) Both (CP) and (D) are strictly feasible.

In particular, under every one of these equivalent assumptions, both (CP) and (D) are solvable with equal optimal values.

Proof. ${\mathrm{(i)} \Rightarrow \mathrm{(v)}}$ : If (CP) is robust feasible, it also is strictly feasible (Proposition 1.4.5) and therefore remains strictly feasible for all small enough perturbations of data. If, in addition, (CP) is robust bounded below, then (D) is robust solvable (by the Conic Duality Theorem); in particular, (D) is robust feasible. Let $\lambda_{0} \in$ int K<sub>∗</sub>. Since (D) is robust feasible, the system $A^{*} \lambda = c - \epsilon A^{*} \lambda_{0}$ for small $\epsilon > 0$ should have a solution $\lambda_{\epsilon} \ge_{\bf K_{*}} 0$ , implying that $A^{*}[\lambda_{\epsilon} + \epsilon \lambda_{0}] = c;$ since $\lambda_{\epsilon} + \epsilon \lambda_{0} >_{\bf K}.$ 0, we see that (D) is strictly feasible, completing justification of (v).

${\bf{\Psi}}(v) \Rightarrow(\mathrm{ii})$ and ${\mathrm{(v)} \Rightarrow \mathrm{(iii)}}$ : when (v) holds true, problems (CP) and (D) remain strictly feasible for all small enough perturbations of data (for (CP) it is evident, for (D) is readily given by the fact that A has trivial kernel), so that (ii) and (iii) hold true due to the Conic Duality Theorem.

$(\mathrm{ii}) \Rightarrow(i)$ : trivial.

We have seen that $(i){\equiv}(\mathrm{ii}){\equiv}(v)$

$(\mathrm{iv}) \Rightarrow(v)$ : By Proposition 1.4.5, in the case of $\mathrm{(iv) \(D)}$ is strictly feasible, and since $\operatorname{Ker} A = \{0\},(\mathrm{D})$ remains strictly feasible for all small enough perturbations of data. Thus, $\mathrm{(iv) \Rightarrow(ii)}$ (by Conic Duality Theorem), and we already know that $(\operatorname{ii}){\equiv}(\operatorname{v})$

(iii) ⇒ (iv): trivial.

We have seen that ${\mathrm{(v)}} \Rightarrow{\mathrm{(iii)}} \Rightarrow{\mathrm{(iv)}} \Rightarrow{\mathrm{(v)}}$ , whence $(v){\equiv}(\mathrm{iii}){\equiv}(\mathrm{iv})$

## 1.5 Exercises for Lecture 1

Solutions to exercises/parts of exercises colored in cyan can be found in section 6.1.

## 1.5.1 Around General Theorem on Alternative

Exercise 1.3 Derive General Theorem on Alternative from Homogeneous Farkas Lemma Hint: Verify that the system

$$
\left\{\begin{array}{ll} a_{i}^{T} x & > b_{i}, i = 1,..., m_{s}, \\ a_{i}^{T} x & \geq b_{i}, i = m_{s} + 1,..., m.\end{array} \right.\tag{S):}
$$

## 1.5. EXERCISES FOR LECTURE 1

in variables x has no solution if and only if the homogeneous inequality

$$
\epsilon \leq 0
$$

in variables $x, \epsilon, t$ is a consequence of the system of homogeneous inequalities

$$
\left\{\begin{array}{rcl} a_{i}^{T} x - b_{i} t - \epsilon & \geq & 0, i = 1, \dots, m_{s}, \\ a_{i}^{T} x - b_{i} t & \geq & 0, i = m_{s} + 1, \dots, m, \\ t & \geq & \epsilon, \end{array} \right.
$$

in these variables.

There exist several particular cases of GTA (which in fact are equivalent to GTA); the goal of the next exercise is to prove the corresponding statements.

Exercise 1.4 Derive the following statements from the General Theorem on Alternative:

1. [Gordan’s Theorem on Alternative] One of the inequality systems

$$
\text{(I)} \quad Ax < 0, x \in \mathbb{R}^{n},\tag{II}
$$

$$
A^{T} y = 0, 0 \neq y \geq 0, y \in \mathbb{R}^{m},
$$

(A being an $m \times n$ matrix, x are variables in (I), y are variables in (II)) has a solution if and only if the other one has no solutions.

2. [Inhomogeneous Farkas Lemma] A linear inequality in variables x

$$
a^{T} x \leq p\tag{1.5.1}
$$

is a consequence of a solvable system of linear inequalities

$$
Nx \leq q\tag{1.5.2}
$$

if and only if it is a ”linear consequence” of the system and the trivial inequality

$$
0^{T} x \leq 1,
$$

i.e., if it can be obtained by taking weighted sum, with nonnegative coeficients, of the inequalities from the system and this trivial inequality.

Algebraically: (1.5.1) is a consequence of solvable system (1.5.2) if and only if

$$
a = N^{T} \nu
$$

for some nonnegative vector ν such that

$$
\nu^{T} q \leq p.
$$

3. [Motzkin’s Theorem on Alternative] The system

$$
Sx < 0, Nx \leq 0
$$

in variables x has no solutions if and only if the system

$$
S^{T} \sigma + N^{T} \nu = 0, \sigma \geq 0, \nu \geq 0, \sigma \neq 0
$$

in variables $\sigma, \nu$ has a solution.

Exercise 1.5 Consider the linear inequality

$$
x + y \leq 2
$$

and the system of linear inequalities

$$
\left\{\begin{array}{l} x \leq 1 \\ - x \leq - 100 \end{array} \right.
$$

Our inequality clearly is a consequence of the system – it is satisfied at every solution to it (simply because there are no solutions to the system at all). According to the Inhomogeneous Farkas Lemma, the inequality should be a linear consequence of the system and the trivial inequality $0 \leq 1$ , i.e., there should exist nonnegative $\nu_{1}, \nu_{2}$ such that

$$
\binom{1}{1} = \nu_{1} \binom{1}{0} + \nu_{2} \binom{- 1}{0}, \quad \nu_{1} - 1000 \nu_{2} \leq 2,
$$

which clearly is not the case. What is the reason for the observed “contradiction”?

## 1.5.2 Around cones

Attention! In what follows, if otherwise is not explicitly stated, “cone” is a shorthand for regular (i.e., closed pointed cone with a nonempty interior) cone, K denotes a cone, and $\mathbf{K}_{*}$ is the cone dual to K.

Exercise 1.6 Let K be a cone, and let $\bar{x} >_{\bf K} 0$ . Prove that x ><sub>K</sub> 0 $if$ and only if there exists positive real t such that x $\ge \mathbf{\mathbf{\mathbf{\mathbf{K}} \mathbf{\mathbf{\mathbf{\Lambda}}}}} t \bar{\mathbf{\mathcal{x}}}$

Exercise 1.7 1) Prove that if $0 \neq x \ge \mathbf{\mathbf{\mathbf{\mathbf{K}}}} \0$ and $\lambda >_{\bf K_{*}} 0$ , then $\lambda^{T} x > 0$

2) Assume that $\lambda \ge_{\mathbf{K}_{*}} ~ 0$ . Prove that $\lambda >_{\mathbf{K}_{*}} \mathrm{~ 0 ~} if$ and only if $\lambda^{T} x > 0$ whenever $0 \neq x \ge_{\bf K} 0$

3) Prove that $\lambda >_{\mathbf{K}_{*}} 0$ if and only if the set

$$
\{x \geq_{\mathbf{K}} 0: \lambda^{T} x \leq 1\}
$$

is compact.

## 1.5.2.1 Calculus of cones

Exercise 1.8 Prove the following statements:

1) [stability with respect to direct multiplication] Let ${\bf K}_{i} \subset{\bf R}^{n_{i}}$ be cones, $i = 1,..., k$ . Prove that the direct product of the cones:

$$
\mathbf{K} = \mathbf{K}_{1} \times \dots \times \mathbf{K}_{k} = \left\{\left(x_{1}, \dots, x_{k}\right): x_{i} \in \mathbf{K}_{i}, i = 1, \dots, k \right\}
$$

is a cone in $\mathbb{R}^{n_{1} + \ldots + n_{k}} = \mathbb{R}^{n_{1}} \times \ldots \times \mathbb{R}^{n_{k}}$

Prove that the cone dual to K is the direct product of the cones dual to $\mathbf{K}_{i}, i = 1,.., k$

2) [stability with respect to taking inverse image] Let K be a cone in $\mathbb{R}^{n}$ and $u \mapsto Au$ be a linear mapping from certain $\mathbb{R}^{k}$ to $\mathbb{R}^{n}$ with trivial null space $(\operatorname{Null}(A) = \{0\})$ and such that ImA ∩ int $\mathbf{K} \neq \varnothing$ . Prove that the inverse image of K under the mapping:

$$
A^{- 1}(\mathbf{K}) = \{u: Au \in \mathbf{K}\}
$$

## 1.5. EXERCISES FOR LECTURE 1

is a cone in $\mathbb{R}^{k}$

Prove that the cone dual to $A^{- 1}(\mathbf{K})$ is $A^{T} \mathbf{K}_{*}, \i.e$

$$
\left(A^{- 1}(\mathbf{K})\right)_{*} = \left\{A^{T} \lambda : \lambda \in \mathbf{K}_{*} \right\}.
$$

3) [stability with respect to taking linear image] Let K be a cone in $\mathbb{R}^{n}$ and $y = Ax$ be a linear mapping from $\mathbb{R}^{n}$ onto ${\mathbb{R}}^{N}{\mathbf{\Psi}}(i, e, \mathbf{\Psi})$ the image of A is the entire $\mathbb{R}^{N})$ . Assume $\mathrm{Null}(A) \cap \mathbf{K} = \{0\}$

Prove that then the set

$$
A \mathbf{K} = \{Ax: x \in \mathbf{K}\}
$$

is a cone in $\mathbb{R}^{N}$

Prove that the cone dual to AK is

$$
(A \mathbf{K})_{*} = \{\lambda \in \mathbb{R}^{N}: A^{T} \lambda \in \mathbf{K}_{*}\}.
$$

Demonstrate by example that if in the above statement the assumption $\mathrm{Null}(A) \cap \mathbf{K} = \{0\}$ is weakened to $\operatorname{Null}(A) \cap$ int $\mathbf{K} = \boldsymbol{\emptyset}$ , then the set $A(\mathbf{K})$ may happen to be non-closed.

Hint. Look what happens when the 3D ice-cream cone is projected onto its tangent plane.

## 1.5.2.2 Primal-dual pairs of cones and orthogonal pairs of subspaces

Exercise 1.9 Let A be $a \m \times n$ matrix of full column rank and K be a cone in ${\mathbb{R}}^{m}$

1) Prove that at least one of the following facts always takes place:

(i) There exists a nonzero $x \in$ Im A which is $\geq_{\mathrm{K}} 0;$

(ii) There exists a nonzero $\lambda \in \operatorname{Null}(A^{T})$ which is $\geq_{\mathrm{{K}_{*}}} 0.$

Geometrically: given a primal-dual pair of cones K, K<sub>∗</sub> and a pair $L, L^{\perp}$ of linear subspaces which are orthogonal complements of each other, we either can find a nontrivial ray in the intersection $L \cap \mathbf{K},$ , or in the intersection $L^{\perp} \cap{\bf K}_{*},$ or both.

2) Prove that there exists $\lambda \in \operatorname{Null}(A^{T})$ which is ${\displaystyle >} \mathbf{K}.$ 0 (this is the strict version $of \(\mathrm{ii})) \if$ and only if (i) is false. Prove that, similarly, there exists $x \in$ ImA which is $>_{\bf K} 0$ (this is the strict version $of \left(i \right))$ if and only if (ii) is false.

Geometrically: if K, K<sub>∗</sub> is a primal-dual pair of cones and $L, L^{\perp}$ are linear subspaces which are orthogonal complements of each other, then the intersection $L \cap \mathbf{K}$ is trivial (i.e., is the singleton {0}) if and only if the intersection $L^{\perp} \cap$ int K<sub>∗</sub> is nonempty.

## 1.5.2.3 Several interesting cones

Given a cone K along with its dual K<sub>∗</sub>, let us call a complementary pair every pair $x \in \mathbf{K}$ $\lambda \in \mathbf{K}$ <sub>∗</sub> such that

$$
\lambda^{T} x = 0.
$$

Recall that in “good cases” (e.g., under the premise of item 4 of the Conic Duality Theorem) a pair of feasible solutions $(x, \lambda)$ of a primal-dual pair of conic problems

$$
\min \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\}
$$

$$
\max \left\{b^{T} \lambda : A^{T} \lambda = c, \lambda \geq_{\mathbf{K}_{*}} 0 \right\}
$$

is primal-dual optimal if and only if the “primal slack” $y = Ax - b$ and λ are complementary.

Exercise 1.10 [Nonnegative orthant] Prove that the n-dimensional nonnegative orthant $\mathbb{R}_{+}^{n}$ is a cone and that it is self-dual:

$$
(\mathbb{R}_{+}^{n})_{*} = \mathbb{R}_{+}^{n}.
$$

What are complementary pairs $\Rsh 2$

Exercise 1.11 [Ice-cream cone] Let ${\bf L}^{n}$ be the n-dimensional ice-cream cone:

$$
\mathbf{L}^{n} = \{x \in \mathbb{R}^{n}: x_{n} \geq \sqrt{x_{1}^{2} +...+ x_{n - 1}^{2}}\}.
$$

1) Prove that ${\bf L}^{n}$ is a cone.

2) Prove that the ice-cream cone is self-dual:

$$
\left(\mathbf{L}^{n}\right)_{*} = \mathbf{L}^{n}.
$$

3) Characterize the complementary pairs.

Exercise 1.12 [Positive semidefinite cone] Let $\mathbf{S}_{+}^{n}$ be the cone of $n \times n$ positive semidefinite matrices in the space ${\mathbf{S}}^{n}$ of symmetric $n \times n$ matrices. Assume that ${\mathbf{S}}^{n}$ is equipped with the Frobenius inner product

$$
\langle X, Y \rangle = \operatorname{Tr}(XY) = \sum_{i, j = 1}^{n} X_{ij} Y_{ij}.
$$

1) Prove that $\mathbf{S}_{+}^{n}$ indeed is a cone.

2) Prove that the semidefinite cone is self-dual:

$$
(\mathbf{S}_{+}^{n})_{*} = \mathbf{S}_{+}^{n},
$$

i. $.e._{;}$ , that the Frobenius inner products of a symmetric matrix Λ with all positive semidefinite matrices X of the same size are nonnegative if and only if the matrix Λ itself is positive semidefinite.

3) Prove the following characterization of the complementary pairs:

Two matrices $X \in \mathbf{S}_{+}^{n}, \Lambda \in(\mathbf{S}_{+}^{n})_{*} \equiv \mathbf{S}_{+}^{n}$ are complementary $(i.e., \langle \Lambda, X \rangle = 0)$ if and only if their matrix product is zero: $\Lambda X = X \Lambda = 0$ . In particular, matrices from a complementary pair commute and therefore share a common orthonormal eigenbasis.

## 1.5.3 Around conic problems: Several primal-dual pairs

Exercise 1.13 [The min-max Steiner problem] Consider the problem as follows:

Given N points $b_{1},..., b_{N}$ in $\mathbb{R}^{n}$ , find a point $\boldsymbol{x} \in \mathbb{R}^{n}$ which minimizes the maximum (Euclidean) distance from itself to the points $b_{1},..., b_{N}, i.e.$ , solve the problem

$$
\min_{x} \max_{i = 1, \dots, N} \| x - b_{i} \|_{2}.
$$

Imagine, $\mathrm{e.g.}$ , that $n = 2, b_{1},..., b_{N}$ are locations of villages and you are interested to locate a fire station for which the worst-case distance to a possible fire is as small as possible.

1) Pose the problem as a conic quadratic $one \mathrm{~ - ~} a$ conic problem associated with a direct product of ice-cream cones.

2) Build the dual problem.

3) What is the geometric interpretation of the dual? Are the primal and the dual strictly feasible? Solvable? With equal optimal values? What is the meaning of the complementary slackness?

## 1.5. EXERCISES FOR LECTURE 1

## Exercise 1.14 [The weighted Steiner problem] Consider the problem as follows:

Given N points $b_{1},..., b_{N}$ in $\mathbb{R}^{n}$ along with positive weights $\omega_{i}, ~ i = 1,..., N$ , find a point $\boldsymbol{x} \in \mathbb{R}^{n}$ which minimizes the weighted sum of its (Euclidean) distances to the points $b_{1},..., b_{N}, i.e..$ , solve the problem

$$
\min_{x} \sum_{i = 1}^{N} \omega_{i} \| x - b_{i} \|_{2}.
$$

Imagine, $\mathrm{e.g.}$ , that $n = 2, b_{1},..., b_{N}$ are locations of N villages and you are interested to place a telephone station for which the total cost of cables linking the station and the villages is as small as possible. The weights can be interpreted as the per mile cost of the cables (they may vary from village to village due to diferences in populations and, consequently, in the required capacities of the cables).

1) Pose the problem as a conic quadratic one.

2) Build the dual problem.

3) What is the geometric interpretation of the dual? Are the primal and the dual strictly feasible? Solvable? With equal optimal values? What is the meaning of the complementary slackness?

## 1.5.4 Feasible and level sets of conic problems

Default assumption: Everywhere in this Section matrix A is of full column rank $(\mathrm{i.e.}$ , with linearly independent columns).

Consider a feasible conic problem

$$
\min \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\}.\tag{CP}
$$

In many cases it is important to know whether the problem has

1) bounded feasible set $\{x : Ax - b \geq_{\mathbf{K}} 0\}$

2) bounded level sets

$$
\{x: Ax - b \ge_{\mathbf{K}} 0, c^{T} x \leq a\}
$$

for all real a.

Exercise 1.15 Let (CP) be feasible. Then the following four properties are equivalent:

(i) the feasible set of the problem is bounded;

(ii) the set of primal slacks $Y = \{y : y \ge_{\mathbf{K}} 0, y = Ax - b\}$ is bounded.

(iii) Im $A \cap \mathbf{K} = \{0\}$

(iv) the system of vector (in)equalities

$$
A^{T} \lambda = 0, \lambda >_{\mathbf{K}_{*}} 0
$$

is solvable.

Corollary. The property of (CP) to have a bounded feasible set is independent of the particular value of b, provided that with this b (CP) is feasible!

Exercise 1.16 Let problem (CP) be feasible. Prove that the following two conditions are equivalent:

(i) (CP) has bounded level sets;

(ii) The dual problem

$$
\max \left\{b^{T} \lambda : A^{T} \lambda = c, \lambda \geq_{\mathbf{K}_{*}} 0 \right\}
$$

is strictly feasible.

Corollary. The property of (CP) to have bounded level sets is independent of the particular value of $b,$ , provided that with this b (CP) is feasible!

## 1.5.5 Operational exercises on engineering applications of LP

## Operational Exercise 1.5.1

1. Mutual incoherence. Let A be an $m \times n$ matrix with columns $A_{j}$ normalized to have Euclidean lengths equal to 1. The quantity

$$
\mu(A) = \max_{i \neq j} | A_{i}^{T} A_{j} |
$$

is called mutual incoherence of A, the smaller is this quantity, the closer the columns of A are to mutual orthogonality.

(a) Prove that $\begin{array}{r}{\gamma_{1}(A) = \widehat \gamma_{1}(A) \le \frac{\mu(A)}{\mu(A) + 1}} \end{array}$ and that whenever $s < \frac{\mu(A) + 1}{2 \mu(A)}$ , the relation (1.3.7) is satisfied with

$$
\gamma = \frac{s \mu(A)}{\mu(A) + 1} < 1 / 2, \beta = \frac{s \mu(A)}{\mu(A) + 1}.
$$

Hint: Look what happens with the verifiable sufficient condition for s-goodness when $\begin{array}{r}{H = \frac{\mu(A)}{\mu(A) + 1} A} \end{array}$

(b) Let A be randomly selected m×n matrix, $1 \ll m \leq n$ , with independent entries taking values $\pm 1 / \sqrt{m}$ with probabilities 0.5. Verify that for a properly chosen absolute constant C we have $\mu(A) \leq C \sqrt{\ln(n) / m}$ . Derive from this observation that the above verifiable sufficient condition for s-goodness for properly selected $m \times n$ matrices can certify their s -goodness with s as large as $O({\sqrt{m / \ln(n)}})$ .

2. Limits of performance of verifiable sufficient condition for s-goodness. Demonstrate that when $m \le n / 2$ , our verifiable sufficient condition for s-goodness does not allow to certify s-goodness of A with $s \geq C \sqrt{m}$ , C being an appropriate absolute constant.

3. Upper-bounding the goodness level. In order to demonstrate that A is not s-good for a given s, it sufices to point out a vector $z \in \operatorname{Ker} A \backslash \{0\}$ such that $\| z \|_{1} \leq 1$ and $\begin{array}{r}{\| z \|_{s, 1} \geq \frac{1}{2}} \end{array}$ The simplest way to attempt to achieve this goal is as follows: Start with a whatever $v^{0} \in V_{s}$ and solve the LP max $\{[v^{0}]^{T} z : Az = 0, \| z \|_{1} \leq 1\}$ , thus getting $z^{1}$ such that z $\| z^{1} \|_{s, 1} \geq[v^{0}]^{T} z^{1}$ and $Az^{1} = 0, \| z^{1} \|_{1} \leq 1$ . Now choose $v^{1} \in V_{s}$ such that $[v^{1}]^{T} z^{1} = \| z^{1} \|_{s, 1}$ and solve the LP program max $\left\{[v^{1}]^{T} z : Az = 0, \| z \|_{1} \leq 1 \right\}$ , thus getting a new $z = z^{2}$ z then define $v^{2} \in V_{s}$ such that $[v^{2}]^{T} z^{2} = \| z^{2} \|_{s, 1}$ , solve the new LP, and so on. In short,

## 1.5. EXERCISES FOR LECTURE 1

the outlined process is an attempt to lower-bound $\gamma_{s}(A) = \operatorname{max}_{{\boldsymbol{v}} \in V_{s} \atop z : Az = 0, \|{\boldsymbol{z}} \|_{1} \leq 1}{\boldsymbol{v}}^{T}{\boldsymbol{z}}$ by switching from maximization in z to maximization in v and vice versa. What we can ensure is that $\| z^{t} \|_{s, 1}$ grows with t and $Az^{t} = 0, \| z^{t} \|_{1} \leq 1$ for all t. With luck, at certain step we get $\| z^{t} \|_{s, 1} \geq 1 / 2$ , meaning that A is not s-good, and $z^{t}$ can be converted into an ssparse signal for which the $\ell_{1}$ recovery does not work properly. Alternatively, the routine eventually “gets stuck:” the norms $\| z^{t} \|_{s, 1}$ nearly do not grow with t, which, practically speaking, means that we have nearly reached a local maximum of the function $\| z \|_{s, 1}$ on the set $\{Az = 0, \| z \|_{1} \leq 1\}$ . This local maximum, however, is not necessary global, so that getting stuck with the value of $\| z \|_{s, 1}$ like 0.4 (or even 0.499999) does not allow us to make any conclusion on whether or not $\gamma_{s}(A) < 1 / 2$ . In this case it makes sense to restart our procedure from a new randomly selected $v^{0}$ , and run this process with restarts during the time we are ready to spend on upper-bounding of the goodness level.

4. Running experiment. Use cvx [9] to run experiment as follows:

- Build $64 \times 64$ Hadamard matrix<sup>15</sup>, extract from it at random a $56 \times 64$ submatrix and scale the columns of the resulting matrix to have Euclidean norms equal to 1; what you get is your $56 \times 64$ sensing matrix A.

- Compute the best lower bounds on the level $s_{*}(A)$ of goodness of A as given by mutual incoherence, our simplified sufficient condition $^{66} A$ is s-good for every s for which $s \widehat{\gamma}_{1}(A) < 1 / 2, \stackrel{}{,}$ and our “full strength” verifiable sufficient condition $^{66} \mathrm{A}$ is s-good for every s such that $\widehat{\gamma}_{s}(A) < 1 / 2.\AA^{3}$

- Compute an upper bound on $s_{*}(A)$ . How far of is this bound from the lower one?

- Finally, take your upper bound on $s_{*}(A)$ , increase it by about 50%, thus getting some S such that A definitely is not S-good, and run 100 experiments where randomly generated signals x with S nonzero entries each are recovered by $\ell_{1}$ minimization from their noiseless observations Ax. How many failures of the $\ell_{1}$ recovery have you observed?

Rerun your experiments with the 64 × 64 Hadamard matrix replaced with those drawn from $64 \times 64$ Rademacher<sup>16</sup> and Gaussian<sup>17</sup> matrix ensembles.

Operational Exercise 1.5.2 The goal of this exercise is to play with the outlined synthesis of linear controllers via LP.

1. Situation and notation. From now on, we consider discrete time linear dynamic system (1.3.16) which is time-invariant, meaning that the matrices $A_{t},..., D_{t}$ are independent of t (so that we write $A,..., D$ instead of $A_{t},..., D_{t})$ . As always, N is the time horizon.

Let us start with convenient notation. Affine p.o.b. control law $\vec{\eta}^{N}$ on time horizon N can be represented by a pair comprised of the block-vector $\vec{h} =[h_{0}; h_{1};..., h_{N - 1}]$ and the

block-lower-triangular matrix

$$
\mathbf{H} = \left[\begin{array}{ccccc} H_{0}^{0} & & & & \\ H_{0}^{1} & H_{1}^{1} & & & \\ H_{0}^{2} & H_{1}^{2} & H_{2}^{2} & & \\ \vdots & \vdots & \vdots & \ddots & \\ H_{0}^{N - 1} & \dots & \dots & \dots & H_{N - 1}^{N - 1} \end{array} \right]
$$

with $n_{u} \times n_{y}$ blocks $H_{\tau}^{t}$ (from now on, when drawing a matrix, blanks represent zero entries/blocks). Further, we can stack in long vectors other entities of interest, specifically,

$$
\begin{array}{rcl} w^{N} & := & \left[\begin{array}{c} \vec{x} \\ \vec{u} \end{array} \right] = \left[\begin{array}{c} x_{1} \\ \vdots \\ x_{N} \\ u_{0} \\ \vdots \\ u_{N - 1} \end{array} \right] \quad[\text{state - control trajectory}] \\ \vec{v} & = & \left[\begin{array}{c} v_{0} \\ \vdots \\ v_{N - 1} \end{array} \right] \quad[\text{purified outputs}] \end{array}
$$

and introduce block matrices

$$
\begin{array}{lll} \zeta 2v & = & \left[\begin{array}{ccccccccc} C & D & & & & & & \\ CA & CR & D & & & & & \\ CA^{2} & CAR & CR & D & & & & \\ \vdots & \vdots & \vdots & \vdots & \ddots & & \\ CA^{N - 1} & CA^{N - 2} R & CA^{N - 3} R & \dots & \dots & CR & D \end{array} \right] \\ \zeta 2x & = & \left[\begin{array}{ccccccccc} A & R & & & & \\ A^{2} & AR & R & & \\ A^{3} & A^{2} R & AR & R & \\ \vdots & \vdots & \vdots & \ddots & \\ A^{N} & A^{N - 1} R & A^{N - 2} R & \dots & AR & R \end{array} \right] \\ u2x & = & \left[\begin{array}{ccccccccc} B & & & & \\ AB & B & & \\ A^{2} B & AB & B & \\ \vdots & \vdots & \vdots & \ddots \\ A^{N - 1} B & A^{N - 2} B & \dots & AB & B \end{array} \right] \\ \end{array} \quad \begin{array}{lllllllll}[\text{Note that} \vec{v} = \zeta 2v \cdot[z; d^{N}]] \\[\text{Note that the contribution of}[z; d^{N}] \text{to} \vec{x} \text{for a given} \vec{u}] \\[\text{is} \zeta 2x \cdot[z; d^{N}]] \\[\text{Note that the contribution of} \vec{u} \text{to} \vec{x} \text{is} u2x \cdot \vec{u}] \end{array}
$$

In this notation, the dependencies between $[z; d^{N}], \vec{\eta}^{N} =(h, H), w^{N}$ and $\vec{v}$ are given by

$$
\begin{array}{rcl} \vec{v} & = & \zeta 2v \cdot[z; d^{N}], \\ w^{N} & := & \left[\begin{array}{ccc} \vec{x} & = &[u2x \cdot \mathbf{H} \cdot \zeta 2v + \zeta 2x] \cdot[z; d^{N}] + u2x \cdot h \\ \vec{u} & = & \mathbf{H} \cdot \zeta 2v \cdot[z; d^{N}] + h \end{array} \right].\end{array}\tag{1.5.3}
$$

## 2. Task 1:

(a) Verify (1.5.3).

(b) Verify that the system closed by an a.p.o.b. control law $\vec{\eta}^{N} = \left(\vec{h}, \mathbf{H} \right)$ satisfies the specifications

$$
\mathcal{B} w^{N} \leq b
$$

whenever $[z; d^{N}]$ belongs to a nonempty set given by polyhedral representation

$$
\{[z; d^{N}]: \exists u: P[z; d^{N}] + Qu \leq r\}
$$

if and only if there exists entrywise nonnegative matrix Λ such that

$$
\begin{array}{l} \Lambda P = \mathcal{B} \cdot \left[\begin{array}{c} u2x \cdot \mathbf{H} \cdot \zeta 2v + \zeta 2x \\ \mathbf{H} \cdot \zeta 2v \end{array} \right] \\ \Lambda Q = 0 \\ \Lambda r + \mathcal{B} \cdot \left[\begin{array}{c} u2x \cdot h \\ h \end{array} \right] \leq b.\end{array}
$$

(c) Assume that at time $t = 0$ the system is at a given state, and what we want is to have it at time N in another given state. Due to linearity, we lose nothing when assuming that the initial state is $0,$ and the target state is a given vector $x_{*}$ . The design specifications are as follows:

- If there are no disturbances (i.e., the initial state is exactly 0, and all d’s are zeros, we want the trajectory (let us call it the nominal one) $\dot{w}^{N} = w_{\mathrm{nom}}^{N}$ to have x<sub>N</sub> exactly equal to $x_{*}$ . In other words, we say that the nominal range of $[z; d^{N}]$ is just the origin, and when $[z; d^{N}]$ is in this range, the state at time $N$ should be $x_{*}$

- When $[z; d^{N}]$ deviates form 0, the trajectory $w^{N}$ will deviate from the nominal trajectory $w_{\mathrm{nom}}^{\bar{N}}$ , and we want the scaled uniform norm $\lVert \mathrm{Diag} \{\beta\}(w^{N} - w_{\mathrm{nom}}^{N}) \rVert_{\infty}$ not to exceed a multiple, with the smallest possible factor, of the scaled uniform norm $\| \operatorname{Diag} \{\gamma\}[z; d^{N}] \|_{\infty}$ of the deviation of $[z; d^{n}]$ from its normal range (the origin). Here $\beta$ and $\gamma$ are positive weight vectors of appropriate sizes.

Prove that the outlined design specifications reduce to the following LP in variables $\vec{\eta}^{N} =(\vec{h},{\bf H})$ and additional matrix variable Λ of appropriate size:

$$
\min_{\substack{\vec{\eta}^{N} =(\vec{h},\mathbf{H}),\\\Lambda,\tau,\alpha}}\left\{\right.\alpha :\left\{\begin{array}{ll}(a)&\text{\bf H is block lower triangular}\\(b)&\text{thelast $n_{x}$ entriesin $u2x\cdot\vec{h}$ formthevector $x_{*}$}\\(c)&\Lambda_{ij}\geq 0\forall i,j\\(d)&\Lambda \left[\begin{array}{c}\operatorname{Diag}\{\gamma\}\\-\operatorname{Diag}\{\gamma\}\end{array}\right] = \left[\begin{array}{c}u2x\cdot \mathbf{H}\cdot \zeta 2v + \zeta 2x\\-u2x\cdot \mathbf{H}\cdot \zeta 2v - \zeta 2x\end{array}\right]\\(e)&\Lambda \cdot \mathbf{1}\leq \alpha \left[\begin{array}{c}\beta\\\beta\end{array}\right]\end{array}\right\}\tag{1.5.4}
$$

where 1 is the all-one vector of appropriate dimension.

## 3. Task 2: Implement the approach summarized in (1.5.4) in the following situation:

Boeing 747 is flying horizontally along the X-axis in the XZ plane with the velocity 774 ft/sec at the altitude 40000 ft and has 100 sec to change the altitude to 41000 ft. You should plan this maneuver.

The details are as follows<sup>18</sup>. First, you should keep in mind that in the description to follow the state variables are deviations of the “physical” state variables (like velocity, altitude, etc.) from their values at the “physical” state of the aircraft at the initial time instant, and not the physical states themselves, and similarly for the controls – they are deviations of actual controls from some “background” controls. The linear dynamics approximation is enough accurate, provided that these deviations are not too large. This linear dynamics is as follows:

- State variables: $\Delta{h};$ deviation in altitude, ft; $\Delta u \colon$ deviation in velocity along the aircraft’s X-axis; $\Delta v \colon$ deviation in velocity orthogonal to the aircraft’s axis, ft/sec (positive is down); $\Delta \theta \colon$ deviation in angle θ between the aircraft’s axis and the X-axis (positive is up), crad (hundredths of radian); q: angular velocity of the aircraft (pitch rate), crad/sec.

- Disturbances: $u_{w} \mathrm{.}$ : wind velocity along the aircraft’s axis, ft/sec; $v_{w}.$ : wind velocity orthogonal to the aircraft’s axis, ft/sec. We assume that there is no side wind.

Assuming that $\delta$ stays small, we will not distinguish between $\Delta u \(\Delta v)$ and the deviations of the aircraft’s velocities along the $X \mathfrak{-},$ respectively, Z-axes, and similarly for $u_{w}$ and $v_{w}$

- Controls: $\delta_{e} \colon$ elevator angle deviation (positive is down); $\delta_{t} \colon$ thrust deviation.

- Outputs: velocity deviation $\Delta u$ and climb rate $\dot{h} = - \Delta v + 7.74 \theta$

- Linearized dynamics:

$$
\begin{array}{rl} \frac{d}{ds} \left[\begin{array}{c} \Delta h \\ \Delta u \\ \Delta v \\ q \\ \Delta \theta \end{array} \right] & = \underbrace{\left[\begin{array}{cccccc} 0 & 0 & - 1 & 0 & 0 \\ 0 & -.003 &.039 & 0 & -.322 \\ 0 & -.065 & -.319 & 7.74 & 0 \\ 0 &.020 & -.101 & -.429 & 0 \\ 0 & 0 & 0 & 1 & 0 \end{array} \right]}_{\mathcal{A}} \cdot \underbrace{\left[\begin{array}{c} \Delta h \\ \Delta u \\ \Delta v \\ q \\ \Delta \theta \end{array} \right]}_{\chi(s)} + \underbrace{\left[\begin{array}{cc} 0 & 0 \\.01 & 1 \\ -.18 & -.04 \\ - 1.16 &.598 \\ 0 & 0 \end{array} \right]}_{\mathcal{B}} \underbrace{\left[\begin{array}{c} \delta_{e} \\ \delta_{t} \end{array} \right]}_{v(s)} \\ & + \underbrace{\left[\begin{array}{cc} 0 & - 1 \\.003 & -.039 \\.065 &.319 \\ -.020 &.101 \\ 0 & 0 \end{array} \right]}_{\mathcal{R}} \cdot \underbrace{\left[\begin{array}{c} u_{w} \\ v_{w} \end{array} \right]}_{\delta(s)} \\ y & = \underbrace{\left[\begin{array}{ccccc} 0 & 1 & 0 & 0 & 0 \\ 0 & 0 & - 1 & 0 & 7.74 \end{array} \right]}_{\mathcal{C}} \cdot \left[\begin{array}{c} \Delta h \\ \Delta u \\ \Delta v \\ q \\ \Delta \theta \end{array} \right] \end{array}
$$

- From continuous to discrete time: Note that our system is a continuous time one; we denote this time by s and measure it in seconds (this is why in the Boeing state dynamics the derivative with respect to time is denoted by $\frac{d}{ds}$ , Boeing’s state in a (continuous time) instant s is denoted by $\chi(s)$ , etc.) Our current goal is to approximate this system by a discrete time one, in order to use our machinery for controller design. To this end, let us choose a “time resolution” $\Delta s > 0$ , say, $\Delta s = 10$ sec, and look at the physical system at continuous time instants $t \Delta s, t = 0, 1,...,$ so that the state $x_{t}$ of the system at discrete time instant t is $\chi(t \Delta s)$ , and similarly for controls, outputs, disturbances, etc. With this approach, 100 sec-long maneuver corresponds to the discrete time horizon $N = 10$

We now should decide how to approximate the actual – continuous time – system with a discrete time one. The simplest way to do so would be just to replace diferential equations with their finite-diference approximations:

$$
x_{t + 1} = \chi(t \Delta s + \Delta s) \approx \chi(t \Delta s) +(\Delta s \mathcal{A}) \chi(t \Delta s) +(\Delta s \mathcal{B}) v(t \Delta s) +(\Delta s \mathcal{R}) \delta(t \Delta s)
$$

We can, however, do better than this. Let us associate with discrete time instant t the continuous time interval $[t \Delta s,(t + 1) \Delta s)$ , and assume (this is a quite reasonable assumption) that the continuous time controls are kept constant on these continuous time intervals:

$$
t \Delta s \leq s <(t + 1) \Delta s \Rightarrow v(s) \equiv u_{t};\tag{*}
$$

$u_{t}$ will be our discrete time controls. Let us now define the matrices of the discrete time dynamics in such a way that with our piecewise constant continuous time controls, the discrete time states $x_{t}$ of the discrete time system will be exactly the same as the states $\chi(t \Delta s)$ of the continuous time system. To this end let us note that with the piecewise constant continuous time controls (∗), we have exact equations

$$
\begin{array}{rcl} \chi((t + 1) \Delta s) & = &[\exp \{\Delta s \mathcal{A}\}] \chi(t \Delta s) +[\int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{B} dr] u_{t} \\ & & +[\int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{R} \delta((t + 1) \Delta s - r) dr], \end{array}
$$

where the exponent of a (square) matrix can be defined by either one of the straightforward matrix analogies of the (equivalent to each other) definitions of the univariate exponent:

$$
\begin{array}{rcl} \exp \{B\} & = & \lim_{n \to \infty}(I + n^{- 1} B)^{n}, \text{or} \\ \exp \{B\} & = & \sum_{n = 0}^{\infty} \frac{1}{n !} B^{n}.\end{array}
$$

We see that when setting

$$
A = \exp \{\Delta s \mathcal{A}\}, B = \left[\int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{B} dr \right], e_{t} = \int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{R} \delta((t + 1) \Delta s - r) dr,
$$

we get exact equalities

$$
x_{t + 1} := \chi(t \Delta s) = Ax_{t} + Bu_{t} + e_{t}, x_{0} = \chi(0)\tag{$}
$$

If we now assume (this again makes complete sense) that continuous time outputs are measured at continuous time instants $t \Delta s, t = 0, 1, \ldots$ , we can augment the above discrete time dynamics with description of discrete time outputs:

$$
y_{t} = \mathcal{C} x_{t}.
$$

Now imagine that the decisions on $u_{t}$ are made as follows: at “continuous time” instant $t \Delta s$ , after $y_{t}$ is measured, we immediately specify $u_{t}$ as an Affine function of $y_{1},..., y_{t}$ and keep the controls in the “physical time” interval $[t \Delta s,(t + 1) \Delta s)$ at the level $u_{t}$ . Now both the dynamics and the candidate Affine controllers in continuous time fit their discrete time counterparts, and we can pass from Affine output based controllers to Affine purified output based ones, and utilize the outlined approach for synthesis of a.p.o.b. controllers to build eficiently a controller for the “true” continuous time system. Note that with this approach we should not bother much on how small is $\Delta s.$ , since our discrete time approximation reproduces exactly the behaviour of the continuous time system along the discrete grid $t \Delta s, t = 0, 1, \ldots$ The only restriction on $\Delta s$ comes from the desire to make design specifications expressed in terms of discrete time trajectory meaningful in terms of the actual continuous time behavior, which usually is not too dificult.

The only dificulty which still remains unresolved is how to translate our a priori information on continuous time disturbances $\delta(s)$ into information on their discrete time counterparts $e_{t}.$ . For example, when assuming that the normal range of the continuous time disturbances $\delta(\cdot)$ is given by an upper bound $\forall s, \| \delta(s) \| \leq \rho$ on a given norm $\| \cdot \|$ of the disturbance, the “translated” information on $e_{t}$ is $e_{t} \in \rho E$ where $\begin{array}{r}{E = \Big \{e = \int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{R} \delta(r) dr : \| \delta(r) \| \leq 1, 0 \leq r \leq \Delta s \Big\}.19} \end{array}$ . We then can set $d_{t} = e_{t}, R \stackrel{.}{=} I_{n_{x}}$ and say that the normal range of the discrete time disturbances $d_{t}$ is $d_{t} \in E$ for all t. A disadvantage of this approach is that for our purposes, we need E to admit a simple representation, which not necessary is the case with $E^{\6}{\mathrm{~}}^{66}{\mathrm{as}}$ it is.” Here is $a$ (slightly conservative) way to resolve this dificulty. Assume that the normal range of the continuous time disturbance is given as $\| \delta(s) \|_{\infty} \leq \rho \forall s$ . Let abs[M] be the matrix comprised of the moduli of the entries of a matrix M. When $\| \delta(s) \|_{\infty} \leq 1$ for all $s,$ we clearly have

$$
\operatorname{abs} \left[\int_{0}^{\Delta s} \exp \{r \mathcal{A}\} \mathcal{R} \delta(r) dr \right] \leq r := \int_{0}^{\Delta s} \operatorname{abs}[\exp \{r \mathcal{A}\} \mathcal{R}] \cdot \mathbf{1} dr,
$$

meaning that $E \subset \{\mathrm{Diag} \{r\} d : \| d \|_{\infty} \leq 1\}$ . In other words, we can only increase the set of allowed disturbances $e_{t}$ by assuming that they are of the form $e_{t} = Rd_{t}$ with $R = \mathrm{Diag} \{r\}$ and $\| d_{t} \|_{\infty} \leq \rho$ . As a result, every controller for the discrete time system

$$
\begin{array}{l}{x_{t + 1} = Ax_{t} + Bu_{t} + Rd_{t},} \\{y_{t} = Cx_{t}} \end{array}
$$

with just defined $A, B, R$ and $C = \mathcal{C}$ which meets desired design specifications, the normal range of $d^{N}$ being $\{\| d_{t} \|_{\infty} \leq \rho \forall t\}$ , definitely meets the design specifications for the system (\$), the normal range of the disturbances $e_{t}$ being $e_{t} \in \rho E$ for all t.

Now you are prepared to carry out your task:

(a) Implement the outlined strategy to the Boeing maneuver example. The still missing components of the setup are as follows:

$$
\text{state at} s = 0: \quad x_{0} =[\Delta h = 0; \Delta u = 0; \Delta v = 0; q = 0; \Delta \delta = 0]
$$

[cruiser horizontal flight at the speed $774 + 73.3 ~ \mathrm{ft / sec}$ , altitude 40000 ft]

$$
\text{state at} s = 100: \quad x_{10} =[\Delta h = 1000; \Delta u = 0; \Delta v = 0; q = 0; \Delta \delta = 0]
$$

[cruiser horizontal flight at the speed $774 + 73.3 \ \mathrm{ft / sec},$ altitude 41000 ft]

## 1.5. EXERCISES FOR LECTURE 1

(774 ft/sec ≈ 528 mph is the aircraft speed w.r.t to the air, 73.3 ft $\mathrm{; / sec = 50}$ mph is the steady-state tail wind).

- Specify the $\mathrm{a.o.p.b}$ . control as given by an optimal solution to (1.5.4). What is the optimal value $\alpha_{*}$ in the problem?

- With the resulting control law, specify the nominal state-control trajectories of the discrete and the continuous time models of the maneuver (i.e., zero initial state, no wind); plot the corresponding XZ trajectory of the aircraft.

- Run 20 simulations of the discrete time and the continuous time models of the maneuver when the initial state and the disturbances are randomly selected vectors of uniform norm not exceeding $\rho = 1$ (which roughly corresponds to up to 1 mph randomly oriented in the XZ plane deviations of the actual wind velocity from the steady-state tail 50 mph one) and plot the resulting bunch of the aircraft’s XZ trajectories. Check that the uniform deviation of the state-control trajectories from the nominal one all the time does not exceed $\alpha_{*} \rho$ (as it should be due to the origin of $\alpha_{*})$ . What is the mean, over the observed trajectories, ratio of the deviation to αρ?

- Repeat the latter experiment with ρ increased to 10 (up to 10 mph deviations in the wind velocity).

My results are as follows:  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/69515c090f52bc19bc8333b498046b41414bfb88cb368df446f5c7de77023397.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/a548a90fec7f4de3fa6392354aad9dc3938a58e3d402997b1ee9c5936ace6956.jpg)  
Bunches of 20 XZ trajectories

[X-axis: mi; Z-axis: ft, deviations from 40000 ft initial altitude]

<table><tr><td colspan="2"> $\rho = 1$ </td><td colspan="2"> $\rho = 10$ </td></tr><tr><td>mean</td><td>max</td><td>mean</td><td>max</td></tr><tr><td>14.2%</td><td>22.8%</td><td>12.8%</td><td>36.3%</td></tr></table>

$\frac{\| \boldsymbol{w}^{N} - \boldsymbol{w}_{\mathrm{nom}}^{N} \|_{\infty}}{\rho \alpha_{*}}$ , data

over 20 simulations, α<sub>∗</sub> = 57.18

## Lecture 2


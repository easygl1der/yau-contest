---
title: "Chapter 2 \u2014 Conic Quadratic Programming"
book: "Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications"
book_slug: lectures-modern-convex-optimization
course: optimization
chapter_number: 2
citekey: null
official_syllabus: false
source_pdf: "sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-modern-convex-optimization/reading.md"
source_line_start: 3529
source_line_end: 6574
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 10
source_empty_image_alt: 10
non_semantic_image_alt: 9
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 17
  latex_environment_mismatches: 1
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
---

# Chapter 2 — Conic Quadratic Programming

> [[../README|本书目录]] · [[01-chapter-1-from-linear-to-conic-programming|上一章]] · [[03-chapter-3-convex-sets-in-r-n|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications
> - 权威原件：[source.pdf](../../../sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-modern-convex-optimization/reading.md)，源行 3529–6574。
> - 本章保留 10 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 17；Affine × 41；different × 5；efficient × 2；sufficient × 1；PDF-confirmed LMCO PDF p.155 Eq. (2.5.6) repair × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Conic Quadratic Programming

Several “generic” families of conic problems are of special interest, both from the viewpoint of theory and applications. The cones underlying these problems are simple enough, so that one can describe explicitly the dual cone; as a result, the general duality machinery we have developed becomes “algorithmic”, as in the Linear Programming case. Moreover, in many cases this “algorithmic duality machinery” allows to understand more deeply the original model, to convert it into equivalent forms better suited for numerical processing, etc. The relative simplicity of the underlying cones also enables one to develop efficient computational methods for the corresponding conic problems. The most famous example of a “nice” generic conic problem is, doubtless, Linear Programming; however, it is not the only problem of this sort. Two other nice generic conic problems of extreme importance are Conic Quadratic and Semidefinite Programming (CQP and SDP for short). We are about to consider the first of these two problems.

## 2.1 Conic Quadratic problems: preliminaries

Recall the definition of the m-dimensional ice-cream (≡second-order≡Lorentz) cone ${\bf L}^{m}$ :

$$
\mathbf{L}^{m} = \left\{x =(x_{1},..., x_{m}) \in \mathbb{R}^{m}: x_{m} \geq \sqrt{x_{1}^{2} +...+ x_{m - 1}^{2}} \right\}, \quad m \geq 2.
$$

Note: In full accordance with the standard convention that the value of empty sum is $0,$ we allow in this definition for $m = 1$ , resulting in ${\bf L}^{1} ={\bf R}_{+}$ , and thus identifying linear vector inequalities involving ${\bf L}^{1}$ and scalar linear inequalities.

A conic quadratic problem is a conic problem

$$
\min_{x} \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\}\tag{CP}
$$

for which the cone K is a direct product of several ice-cream cones:

$$
\begin{array}{rcl} \mathbf{K} & = & \mathbf{L}^{m_{1}} \times \mathbf{L}^{m_{2}} \times...\times \mathbf{L}^{m_{k}} \\ & = & \left\{y = \left(\begin{array}{c} y[1] \\ y[2] \\...\\ y[k] \end{array} \right): y[i] \in \mathbf{L}^{m_{i}}, i = 1,..., k \right\}.\end{array}\tag{2.1.1}
$$

In other words, a conic quadratic problem is an optimization problem with linear objective and finitely many “ice-cream constraints”

$$
A_{i} x - b_{i} \geq_{\mathbf{L}^{m_{i}}} 0, i = 1, \dots, k,
$$

where

$$
[A; b] = \left[\begin{array}{c} \frac{[A_{1}; b_{1}]}{[A_{2}; b_{2}]} \\ \hline \dots \\ \hline[A_{k}; b_{k}] \end{array} \right]
$$

is the partition of the data matrix $[A; b]$ corresponding to the partition of $y$ in (2.1.1). Thus, a conic quadratic program can be written as

$$
\min_{x} \left\{c^{T} x: A_{i} x - b_{i} \geq_{\mathbf{L}^{m_{i}}} 0, i = 1,..., k \right\}.\tag{2.1.2}
$$

Recalling the definition of the relation $\ge \mathbf{L}^{m}$ and partitioning the data matrix $[A_{i}, b_{i}]$ as

$$
[A_{i}; b_{i}] = \left[\begin{array}{ll} D_{i} & d_{i} \\ p_{i}^{T} & q_{i} \end{array} \right]
$$

where $D_{i}$ is of the size $(m_{i} - 1) \times$ dim $x,$ we can write down the problem as

$$
\min_{x} \left\{c^{T} x: \| D_{i} x - d_{i} \|_{2} \leq p_{i}^{T} x - q_{i}, i = 1, \dots, k \right\};\tag{QP}
$$

this is the “most explicit” form is the one we prefer to use. In this form, $D_{i}$ are matrices of the same row dimension as $x, d_{i}$ are vectors of the same dimensions as the column dimensions of the matrices $D_{i}, p_{i}$ are vectors of the same dimension as x and $q_{i}$ are reals.

It is immediately seen that (2.1.1) is indeed a cone, in fact a self-dual one: ${\bf K}_{*} ={\bf K}.$ Consequently, the problem dual to (CP) is

$$
\max_{\lambda} \left\{b^{T} \lambda : A^{T} \lambda = c, \lambda \geq_{\mathbf{K}} 0 \right\}.
$$

Denoting $\lambda ={\left(\begin{array}{l}{\lambda_{1}} \\{\lambda_{2}} \\{\dots} \\{\lambda_{k}} \end{array} \right)}$ with $m_{i}$ -dimensional blocks $\lambda_{i}$ (cf. (2.1.1)), we can write the dual problem as

$$
\max_{\lambda_{1}, \dots, \lambda_{m}} \left\{\sum_{i = 1}^{k} b_{i}^{T} \lambda_{i}: \sum_{i = 1}^{k} A_{i}^{T} \lambda_{i} = c, \lambda_{i} \geq_{\mathbf{L}^{m_{i}}} 0, i = 1, \dots, k \right\}.
$$

Recalling the meaning of $\ge \mathbf{L}^{m_{i}}$ <sub>i</sub> 0 and representing $\lambda_{i} ={\binom{\mu_{i}}{\nu_{i}}}$ with scalar component $\nu_{i}$ , we finally come to the following form of the problem dual to (QP):

$$
\max_{\mu_{i}, \nu_{i}} \left\{\sum_{i = 1}^{k}[\mu_{i}^{T} d_{i} + \nu_{i} q_{i}]: \sum_{i = 1}^{k}[D_{i}^{T} \mu_{i} + \nu_{i} p_{i}] = c, \| \mu_{i} \|_{2} \leq \nu_{i}, i = 1,..., k \right\}.\tag{QD}
$$

The design variables in (QD) are vectors $\mu_{i}$ of the same dimensions as the vectors $d_{i}$ and reals $\nu_{i}, i = 1,..., k$

## 2.2 Examples of conic quadratic problems

## 2.2.1 Contact problems with static friction [35]

Consider a rigid body in $\mathbb{R}^{3}$ and a robot with N fingers. When can the robot hold the body? To pose the question mathematically, let us look what happens at the point $p^{i}$ of the body which is in contact with i-th finger of the robot:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/51047d421ca54966b3b147e24d5b23d1df0bafdf36501aa41deb1c0c091a4806.jpg)  
Geometry of i-th contact

$[p^{i}$ is the contact point; $f^{i}$ is the contact force; $v^{i}$ is the inward normal to the surface]

Let $v^{i}$ be the unit inward normal to the surface of the body at the point $p^{i}$ where i-th finger touches the body, $f^{i}$ be the contact force exerted by i-th finger, and $F^{i}$ be the friction force caused by the contact. Physics (Coulomb’s law) says that the latter force is tangential to the surface of the body:

$$
(F^{i})^{T} v^{i} = 0\tag{2.2.1}
$$

and its magnitude cannot exceed $\mu$ times the magnitude of the normal component of the contact force, where $\mu$ is the friction coeficient:

$$
\| F^{i} \|_{2} \leq \mu(f^{i})^{T} v^{i}.\tag{2.2.2}
$$

Assume that the body is subject to additional external forces $(\mathrm{e.g., gravity})$ ; as far as their mechanical consequences are concerned, all these forces can be represented by a single force – their $\mathrm{sum} - F^{\mathrm{ext}}$ along with the torque $T^{\mathrm{ext}} -$ the sum of vector products of the external forces and the points where they are applied.

In order for the body to be in static equilibrium, the total force acting at the body and the total torque should be zero:

$$
\begin{array}{rcl} \sum_{i = 1}^{N}(f^{i} + F^{i}) + F^{\mathrm{ext}} & = & 0 \\ \sum_{i = 1}^{N} p^{i} \times(f^{i} + F^{i}) + T^{\mathrm{ext}} & = & 0, \end{array}\tag{2.2.3}
$$

where $p \times q$ stands for the vector product of two 3D vectors $p$ and $q^{\1)}$

$$
[p, q] = \left(\begin{array}{c} \operatorname{Det} \left(\begin{array}{cc} p_{2} & p_{3} \\ q_{2} & q_{3} \end{array} \right) \\ \operatorname{Det} \left(\begin{array}{cc} p_{3} & p_{1} \\ q_{3} & q_{1} \end{array} \right) \\ \operatorname{Det} \left(\begin{array}{cc} p_{1} & p_{2} \\ q_{1} & q_{2} \end{array} \right) \end{array} \right)
$$

The question “whether the robot is capable to hold the body” can be interpreted as follows. Assume that $f^{i}, F^{\mathrm{ext}}, T^{\mathrm{ext}}$ are given. If the friction forces $F^{i}$ can adjust themselves to satisfy the friction constraints (2.2.1) – (2.2.2) and the equilibrium equations (2.2.3), i.e., if the system of constraints (2.2.1), (2.2.2), (2.2.3) with respect to unknowns $F^{i}$ is solvable, then, and only then, the robot holds the body (“the body is in a stable grasp”).

Thus, the question of stable grasp is the question of solvability of the system (S) of constraints (2.2.1), (2.2.2) and (2.2.3), which is a system of conic quadratic and linear constraints in the variables $f^{i}, \F^{\mathrm{ext}}, \T^{\mathrm{ext}}, \ \{F^{i}\}$ . It follows that typical grasp-related optimization problems can be posed as CQPs. Here is an example:

The robot should hold a cylinder by four fingers, all acting in the vertical direction. The external forces and torques acting at the cylinder are the gravity $F_{g}$ and an externally applied torque $T$ along the cylinder axis, as shown in the picture:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/29bfd0d46795a583b0eaa09d1040c0028aca595cd8c4dabac69017cdda587c0a.jpg)

The magnitudes $\nu_{i}$ of the forces $f_{i}$ may vary in a given segment $[0, F_{\mathrm{max}}]$

What can be the largest magnitude $\tau$ of the external torque $T$ such that a stable grasp is still possible?

Denoting by $u^{i}$ the directions of the fingers, by $v^{i}$ the directions of the inward normals to cylinder’s surface at the contact points, and by u the direction of the axis of the cylinder, we can pose the problem as the optimization program

s.t.

$$
\begin{array}{rlr} \max \tau & \\ \sum_{i = 1}^{4}(\nu_{i} u^{i} + F^{i}) + F_{g} = 0 &[\mathrm{totalforceequals0}] \\ \sum_{i = 1}^{4} p^{i} \times(\nu_{i} u^{i} + F^{i}) + \tau u = 0 &[\mathrm{totaltorqueequals0}] \\(v^{i})^{T} F^{i} = 0, i = 1, \dots, 4 &[F^{i} \text{are tangential to the surface}] \\ \| F^{i} \|_{2} \leq[\mu[u^{i}]^{T} v^{i}] \nu_{i}, i = 1, \dots, 4 &[\mathrm{Coulomb^{\prime} sconstraints}] \\ 0 \leq \nu_{i} \leq F_{\max}, i = 1, \dots, 4 &[\mathrm{boundson} \nu_{i}] \end{array}
$$

in the design variables $\tau, \nu_{i}, F_{i}, i = 1,..., 4$ . This is a conic quadratic program, although not in the standard form (QP). To convert the problem to this standard form, it sufices, e.g., to replace all linear equalities by pairs of linear inequalities and further represent linear inequalities $\alpha^{T} x \leq \beta$ as conic quadratic constraints

$$
Ax - b \equiv \left[\begin{array}{c} 0 \\ \beta - \alpha^{T} x \end{array} \right] \ge_{\mathbf{L}^{2}} 0.
$$

## 2.3 What can be expressed via conic quadratic constraints?

Optimization problems arising in applications are not normally in their “catalogue” forms, and thus an important skill required from those interested in applications of Optimization is the ability to recognize the fundamental structure underneath the original formulation. The latter is frequently in the form

$$
\min_{x} \{f(x): x \in X\},\tag{2.3.1}
$$

where $f$ is a “loss function”, and the set X of admissible design vectors is typically given as

$$
X = \bigcap_{i = 1}^{m} X_{i};\tag{2.3.2}
$$

every $X_{i}$ is the set of vectors admissible for a particular design restriction which in many cases is given by

$$
X_{i} = \{x \in \mathbb{R}^{n}: g_{i}(x) \leq 0\},\tag{2.3.3}
$$

where $g_{i}(x)$ is i-th constraint function<sup>2)</sup>.

It is well-known that the objective f in always can be assumed linear, otherwise we could move the original objective to the list of constraints, passing to the equivalent problem

$$
\min_{t, x} \left\{t:(t, x) \in \widehat{X} \equiv \{(x, t): x \in X, t \geq f(f)\} \right\}.
$$

Thus, we may assume that the original problem is of the form

$$
\min_{x} \left\{c^{T} x: x \in X = \bigcap_{i = 1}^{m} X_{i} \right\}.\tag{P}
$$

In order to recognize that X is in one of our “catalogue” forms, one needs a kind of dictionary, where different forms of the same structure are listed. We shall build such a dictionary for the conic quadratic programs. Thus, our goal is to understand when a given set X can be represented by conic quadratic inequalities $\mathrm{(c.q.i.\dot{s})}$ , i.e., one or several constraints of the type $\| Dx - d \|_{2} \leq p^{T} x - q$ . The word “represented” needs clarification, and here it is:

We say that a set $X \subset \mathbb{R}^{n}$ can be represented via conic quadratic inequalities (for short: is CQr – Conic Quadratic representable), if there exists a system S of finitely many vector inequalities of the form $A_{j} \left(\begin{array}{l}{x} \\{u} \end{array} \right) - b_{j} \geq_{\mathbf{L}^{m_{j}}}$ 0 in variables $\boldsymbol{x} \in \mathbb{R}^{n}$ and additional variables u such that X is the projection of the solution set of S onto the x-space, i.e., $x \in X$ if and only if one can extend x to a solution $(x, u)$ of the system S:

$$
x \in X \Leftrightarrow \exists u: A_{j} \binom{x}{u} - b_{j} \geq_{\mathbf{L}^{m_{j}}} 0, j = 1,..., N.
$$

Every such system S is called a conic quadratic representation (for short: a CQR) of the set X. We call such a CQR strictly/essentially strictly feasible, if $S,$ considered as a single conic inequality (by passing from the cones $K_{j}$ to their direct product) is strictly, resp., essentially strictly feasible, see Definition 1.4.3

Equivalently:

X is CQr when X can be represented as

$$
X = \{x: \exists u: Ax + Bu + b \ge_{\mathbf{K}} 0\}
$$

for properly selected A, B, b and K being the direct product of finitely many Lorenz cones.

Such a representation is a CQR of X, and this CQR is strictly/essentoially feasible if the conic inequality

$$
Ax + Bu + b \geq_{\mathbf{K}} 0
$$

is so.

The idea behind this definition is clarified by the following observation:

Consider an optimization problem

$$
\min_{x} \left\{c^{T} x: x \in X \right\}
$$

and assume that X is CQr. Then the problem is equivalent to a conic quadratic program. The latter program can be written down explicitly, provided that we are given a CQR of X.

Indeed, let S be a CQR of X, and u be the corresponding vector of additional variables. The problem

$$
\min_{x, u} \left\{c^{T} x:(x, u) \text{satisfy} S \right\}
$$

with design variables $x, u$ is equivalent to the original problem (P), on one hand, and is a conic quadratic program, on the other hand.

Let us call a problem of the form (P) with CQ-representable X a good problem.

How to recognize good problems, i.e., how to recognize CQ-representable sets? Well, how we recognize continuity of a given function, like $f(x, y) = \exp \{\sin(x + \exp \{y\})\} \ ?$ Normally it is not done by a straightforward verification of the definition of continuity, but by using two kinds of tools:

A. We know a number of simple functions – a constant, $f(x) = x, f(x) = \sin(x), f(x) =$ $\exp \{x\}$ , etc. – which indeed are continuous: “once for the entire life” we have verified it directly, by demonstrating that the functions fit the definition of continuity;

B. We know a number of basic continuity-preserving operations, like taking products, sums, superpositions, etc.

When we see that a function is obtained from “simple” functions – those of type A – by operations of type B (as it is the case in the above example), we immediately infer that the function is continuous.

This approach which is common in Mathematics is the one we are about to follow. In fact, we need to answer two kinds of questions:

(?) What are CQ-representable sets

(??) What are CQ-representable functions $g(x)$ , i.e., functions which possess CQ-representable epigraphs

$$
\operatorname{Epi} \{g\} = \{(x, t) \in \mathbb{R}^{n} \times \mathbb{R}: g(x) \leq t\}.
$$

Our interest in the second question is motivated by the following

Observation: If a function g is CQ-representable, then so are all it level sets $\{x :$ $g(x) \leq a\}$ , and every CQ-representation of (the epigraph of) g explicitly induces CQ-representations of the level sets.

Indeed, assume that we have a CQ-representation of the epigraph of $g \colon$

$$
g(x) \leq t \Leftrightarrow \exists u: \| \alpha_{j}(x, t, u) \|_{2} \leq \beta_{j}(x, t, u), j = 1, \dots, N,
$$

where $\alpha_{j}$ and $\beta_{j}$ are, respectively, vector-valued and scalar Affine functions of their arguments. In order to get from this representation a CQ-representation of a level set $\{x : g(x) \leq a\}$ , it sufices to fix in the conic quadratic inequalities $\| \alpha_{j}(x, t, u) \|_{2} \leq \beta_{j}(x, t, u)$ the variable t at the value a.

We list below our “raw materials” – simple functions and sets admitting CQR’s.

## 2.3.1 Elementary CQ-representable functions/sets

## 1. A constant function $g(x) \equiv a$

Indeed, the epigraph of the function $\{(x, t) \mid a \leq t\}$ is given by a linear inequality, and a linear inequality $0 \leq p^{T} z - q$ is at the same time conic quadratic inequality due to ${\bf L}^{1} ={\bf R}_{+}$

## 2. An Affine function $g(x) = a^{T} x + b.$

Indeed, the epigraph of an Affine function is given by a linear inequality.

## 3. The Euclidean norm $g(x) = \| x \|_{2}$

Indeed, the epigraph of g is given by the conic quadratic inequality $\| x \|_{2} \leq t$ in variables $x, t.$

## 4. The squared Euclidean norm $g(x) = x^{T} x$

Indeed, $\begin{array}{r}{t ={\frac{(t + 1)^{2}}{4}} -{\frac{(t - 1)^{2}}{4}}} \end{array}$ , so that

$$
x^{T} x \leq t \Leftrightarrow x^{T} x + \frac{(t - 1)^{2}}{4} \leq \frac{(t + 1)^{2}}{4} \Leftrightarrow \left\| \binom{x}{\frac{t - 1}{2}} \right\|_{2} \leq \frac{t + 1}{2}
$$

(check the second ⇔!), and the last relation is a conic quadratic inequality.

5. The fractional-quadratic function $g(x, s) = \left\{{\begin{array}{ll}{\frac{x^{T} x}{s},} &{s > 0} \\{0,} &{s = 0, x = 0} \\{+ \infty,} &{{\mathrm{otherwise}}} \end{array}} \right.$ (x vector, s scalar).

Indeed, with the convention that $(x^{T} x) / 0$ is 0 or +∞, depending on whether $x = 0$ or not, and taking into account that $\begin{array}{r}{ts = \frac{(t + s)^{2}}{4} - \frac{(t - s)^{2}}{4}} \end{array}$ , we have:

$$
\left\{\frac{x^{T} x}{s_{1}} \leq t, s \geq 0 \right\} \Leftrightarrow \left\{x^{T} x \leq ts, t \geq 0, s \geq 0 \right\} \Leftrightarrow \left\{x^{T} x + \frac{(t - s)^{2}}{4} \leq \frac{(t + s)^{2}}{4}, t \geq 0, s \geq 0 \right\}
$$

$$
\Leftrightarrow \left\| \binom{x}{\frac{t - s}{2}} \right\|_{2} \leq \frac{t + s}{2}
$$

(check the third ⇔!), and the last relation is a conic quadratic inequality.

The level sets of the CQr functions 1 – 5 provide us with a spectrum of “elementary” CQr sets. We add to this spectrum one more set:

6. (A branch of) Hyperbola $\{(t, s) \in \mathbb{R}^{2} : ts \geq 1, t > 0\}$

Indeed,

$$
\begin{array}{c} \{ts \geq 1, t > 0\} \Leftrightarrow \{\frac{(t + s)^{2}}{4} \geq 1 + \frac{(t - s)^{2}}{4} \& t > 0\} \Leftrightarrow \{\left\| \binom{\frac{t - s}{2}}{1} \right\|_{2}^{2} \leq \frac{(t + s)^{2}}{4}\} \\ \Leftrightarrow \{\left\| \binom{\frac{t - s}{2}}{1} \right\|_{2} \leq \frac{t + s}{2}\} \end{array}
$$

(check the last ⇔!), and the latter relation is a conic quadratic inequality.

Next we study simple operations preserving CQ-representability of functions/sets.

## 2.3.2 Operations preserving CQ-representability of sets

To save words, in the sequel SO stands for the family of cones which are finite direct products of Lorentz cones.

A. Intersection: If sets $X_{i} \subset \mathbb{R}^{n}, i = 1,..., k$ , are CQr:

$$
X_{i} = \{x: \exists u_{i}: A_{i} x + B_{i} u_{i} + b_{i} \in \mathbf{K}_{i}\}\tag{\([\mathbf{K}_i\in \mathcal{SO}]\}
$$

so is their intersection $X = \bigcap_{i = 1}^{k} X_{i}$

Indeed,

$$
\bigcap_{i = 1}^{k} X_{i} = \{x: \exists u =[u_{1};...; u_{k}]:[A_{1};...; A_{k}] x + \operatorname{Diag} \{B_{1},..., B_{k}\} u +[c_{1};...; c_{k}] \in \mathbf{K} := \mathbf{K}_{1} \times,, \times \mathbf{K}_{k}\}
$$

and $\mathbf{K} \in S{\mathcal{O}}$

Corollary 2.3.1 A polyhedral set – a set in $\mathbb{R}^{n}$ given by finitely many scalar linear inequalities $a_{i}^{T} x \le b_{i}, i = 1,..., m \ - \is \CQr$

Indeed, a polyhedral set is the intersection of finitely many level sets of Affine functions, and all these functions (and thus – their level sets) are CQr.

Since a scalar linear equality is equivalent to a pair of opposite scalar linear inequalities, the words “inequalities” in Corollary 2.3.1 can be replaced with “inequalities and equalities.”

Corollary 2.3.2 If every one of the sets $X_{i}$ in problem (P) is $CQr_{;}$ then the problem is good – it can be rewritten in the form of a conic quadratic problem, and such a transformation is readily given by CQR’s of the sets $X_{i}, i = 1,..., m$

B. Direct product: If sets $X_{i} \subset \mathbb{R}^{n_{i}}, i = 1,..., k.$ , are CQr:

$$
X_{i} = \left\{x_{i}: \exists u_{i}: A_{i} x_{i} + B_{i} u_{i} + b_{i} \in \mathbf{K}_{i} \right\}\tag{\([\mathbf{K}_i\in \mathcal{SO}]\}
$$

so is their direct product $X_{1} \times \ldots \times X_{k}$

$$
\begin{array}{rcl} X_{1} \times...\times X_{k} & = & \left\{x =[x_{1};...; x_{k}]: \exists u =[u_{1};...; u_{k}]: \right.\\ & & \text{Diag} \{A_{1},..., A_{k}] x + \text{Diag} \{B_{1},..., B_{k}] u +[c_{1};...; c_{N} k] \in \mathbf{K} := \mathbf{K}_{1} \times...\times \mathbf{K}_{k} \Bigg\} \end{array}
$$

and $\mathbf{K} \in S{\mathcal{O}}$

C. Affine image (“Projection”): If a set $X \subset \mathbb{R}^{n}$ is CQr:

$$
X = \{x: \exists u: Px + Qu + r \geq_{\mathbf{K}} 0\}
$$

$$
[\mathbf{K} \in \mathcal{SO}]
$$

and $x \mapsto y = \ell(x) : = Ax + b$ is an Affine mapping of $\mathbb{R}^{n}$ to $\mathbb{R}^{k}$ , then the image \`(X) of the set X under the mapping is CQr.

Indeed,

$$
\ell(X) = \{y: \exists(x, u): Px + Qu + r \geq_{\mathbf{K}} 0, y - Ax - b = 0\}
$$

and the right hand side representation is a CQR.

Corollary 2.3.3 A nonempty set X is CQr if and only if its characteristic function

$$
\chi(x) = \left\{\begin{array}{ll} 0, & x \in X \\ + \infty, & \text{otherwise} \end{array} \right.
$$

is $CQr.$

Indeed, $\mathrm{Epi} \{\chi\}$ is the direct product of X and the nonnegative ray; therefore if X is $\mathrm{CQr}$ , so is $\chi(\cdot)$ (see B. and Corollary 2.3.1). Vice versa, if χ is CQr, then X is CQr by C., since X is the projection of the Epi{χ} on the space of x-variables.

D. Inverse Affine image: Let $X \subset \mathbb{R}^{n}$ be a CQr set:

$$
X = \{x: \exists u: Px + Qu + r \geq_{\mathbf{K}} 0\}\tag{[K \in SO]}
$$

and let $\ell(y) = Ay + b$ be an Affine mapping from $\mathbb{R}^{k}$ to $\mathbb{R}^{n}$ . Then the inverse image $\ell^{- 1}(X) =$ $\{y \in \mathbb{R}^{k} : Ay + b \in X\}$ of X under the mapping is CQr.

$$
\ell^{- 1}(X) = \{y: \exists u: PAy + Qu +[r + Pb] \geq_{\mathbf{K}} 0\}
$$

Corollary 2.3.4 Consider a good problem (P) and assume that we restrict its design variables to be given Affine functions of a new design vector y. Then the induced problem with the design vector y is also good.

It should be stressed that the above statements are not just existence theorems – they are “algorithmic”: given CQR’s of the “operands” (say, m sets $X_{1},..., X_{m})$ , we may build completely mechanically a CQR for the “result of the operation” (e.g., for the intersection $\bigcap_{i = 1}^{m} X_{i})$

## 2.3.3 Operations preserving CQ-representability of functions

Recall that a function $g(x)$ is called CQ-representable, if its epigraph ${\mathrm{Epi}} \{g\} = \{(x, t) : g(x) \leq t\}$ is a CQ-representable set; a CQR of the epigraph of $g$ is called conic quadratic representation of $g.$ . Recall also that a level set of a $\mathrm{CQr}$ function is CQ-representable. Here are transformations preserving CQ-representability of functions:

E. Taking maximum: If functions $g_{i}(x), \i = 1,..., m$ , are $\mathrm{CQr}$ , then so is their maximum $g(x) \overline{{= \operatorname{max}_{i = 1, \ldots, m} g_{i}(x)}}$

Indeed, ${\mathrm{Epi}} \{g\} = \bigcap_{i}{\mathrm{Epi}} \{g_{i}\}$ , and the intersection of finitely many CQr sets again is $\mathrm{CQr}$

F. Summation with nonnegative weights: If functions $g_{i}(x), x \in \mathbb{R}^{n}$ , are $\mathrm{CQr}, i = 1,..., m$ , and $\alpha_{i}$ are nonnegative weights, then the function $g(x) = \sum_{i = 1}^{m} \alpha_{i} g_{i}(x)$ is also $\mathrm{CQr}$ This is a particular case of

Theorem 2.3.1 [Theorem on superposition] Let $g_{i}(x) : \mathbb{R}^{n} \mathbb{R} \cup \{+ \infty\}, i \leq m$ , be $CQr \mathrm{:}$

$$
\{t \geq g_{i}(x)\} \Leftrightarrow \{\exists u_{i}: A_{i} x + tb_{i} + B_{i} u_{i} + c_{i} \in \mathbf{K}_{i} \in \mathcal{SO}\}
$$

and $F : \mathbb{R}^{m} \mathbb{R} \cup \{+ \infty\}$ be CQr:

$$
\{t \geq F(y)\} \Leftrightarrow \{\exists u: Ay + tb + Bu + c \in \mathbf{K} \in \mathcal{SO}\}
$$

and nonincreasing in every one of its arguments. Then the composition

$$
g(x) = \left\{\begin{array}{ll} F(f_{1}(x),..., f_{m}(x)), & f_{i}(x) < \infty, i \leq m \\ + \infty, & otherwise \end{array} \right.
$$

is $CQr$

Indeed, as it is immediately seen,

$$
\{t \geq g(x)\} \Leftrightarrow \left\{\exists u, u_{1},..., u_{m}, t_{1},..., t_{m}: \left\{\begin{array}{ll} \overbrace{A_{i} x + t_{i} b_{i} + B_{i} u_{i} + c_{i} \in \mathbf{K}_{i}}^{\text{``says'' that} f_{i}(x) \leq t_{i}}, & i \leq m \\ \underbrace{A[t_{1};...; t_{m}] + tb + Bu + c \in \mathbf{K}}_{\text{``says'' that} F([t_{1};...; t_{m}]) \leq t} & \end{array} \right.\right\}
$$

and the system of constraints on variables $x, t_{i}, t, u_{i}, u$ in the right hand side is a linear in these variables vector inequality with cone from $s \mathcal{O}$

In order to get from Theorem on superposition the “sum with nonnegative weights” rule, it sufices to set $\begin{array}{r}{F(y) = \sum_{i} \lambda_{i} y_{i}} \end{array}$

Note that when some of the $f_{i}$ are Affine, Theorem on superposition remain true when skipping the requirement for $F$ to be monotone in the arguments $y_{i}$ for which $f_{i}$ are Affine. Assuming that $f_{1},..., f_{s}$ are Affine, a CQR of g is given by the equivalence

$$
\{t \geq g(x)\} \Leftrightarrow \left\{\exists u, u_{s + 1}, u_{s + 2},..., u_{m}, t_{1},..., t_{m}: \left\{\begin{array}{ll} f_{i}(x) - t_{i} = 0, & i \leq s \\ A_{i} x + t_{i} b_{i} + B_{i} u_{i} + c_{i} \in \mathbf{K}_{i}, & s < i \leq m \\ A[t_{1};...; t_{m}] + tb + Bu + c \in \mathbf{K} \end{array} \right.\right\}
$$

G. Direct summation: If functions $g_{i}(x_{i}), x_{i} \in \mathbb{R}^{n_{i}}, i = 1,..., m$ , are $\mathrm{CQr}$ , so is their direct sum

$$
g(x_{1}, \dots, x_{m}) = g_{1}(x_{1}) + \dots + g_{m}(x_{m}).
$$

Indeed, the functions $\hat{g}_{i}(x_{1},..., x_{m}) = g_{i}(x_{i})$ are clearly CQr – their epigraphs are inverse images of the epigraphs of $g_{i}$ under the Affine mappings $(x_{1},..., x_{m}, t) \mapsto(x_{i}, t)$ . It remains to note that $g = \sum_{i} \hat{g}_{i}$

H. Affine substitution of argument: If a function $g(x), x \in \mathbb{R}^{n}$ , is CQr and $y \mapsto Ay + b$ is an Affine mapping from $\overline{{\mathbb{R}^{k}}}$ to $\mathbb{R}^{n}$ , then the superposition $g^{}(y) = g(Ay + b)$ is $\mathrm{CQr}$ Indeed, the epigraph of $g^{}$ is the inverse image of the epigraph of $g$ under the Affine mapping $(y, t) \mapsto$ $(Ay + b, t)$

I. Partial minimization: Let $g(x)$ be CQr. Assume that x is partitioned into two sub-vectors: $\boldsymbol{x} =(v, w)$ , and let $\hat{g}$ be obtained from $g$ by partial minimization in w:

$$
\hat{g}(v) = \inf_{w} g(v, w),
$$

and assume that for every v such that $\hat{g}(v) < \infty$ the minimum in w is achieved. Then $\hat{g}$ is $\mathrm{CQr}$ Indeed, under the assumption that the minimum in w is achieved at every v for which $g(v, \cdot)$ is not identically $+ \infty, \mathrm{Epi} \{\hat{g}\}$ is the image of the epigraph of $\operatorname{Epi} \{g\}$ under the projection $(v, w, t) \mapsto(v, t)$

## 2.3.4 More operations preserving CQ-representability

Let us list a number of more “advanced” operations with sets/functions preserving CQrepresentability.

J. Arithmetic summation of sets. Let $X_{i}, i = 1,..., k$ , be nonempty convex sets in $\mathbb{R}^{n}$ , and let $X_{1} + X_{2} + \ldots + X_{k}$ be the arithmetic sum of these sets:

$$
X_{1} + \dots + X_{k} = \{x = x^{1} + \dots + x^{k}: x^{i} \in X_{i}, i = 1, \dots, k\}.
$$

We claim that

If all $X_{i}$ are $CQr,$ so is their sum.

Indeed, the direct product

$$
X = X_{1} \times X_{2} \times \ldots \times X_{k} \subset \mathbb{R}^{nk}
$$

is CQr by $\mathrm{B.;}$ it remains to note that $X_{1} + \ldots + X_{k}$ is the image of X under the linear mapping

$$
\left(x^{1}, \dots, x^{k}\right) \mapsto x^{1} + \dots + x^{k}: \mathbb{R}^{nk} \rightarrow \mathbb{R}^{n},
$$

and by C. the image of a CQr set under an Affine mapping is also $\mathrm{CQr \(see \C.)}$

![Figure 2.1](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/4363386580beda2795ebae62aebf13226646d1b5efe1c2ed0f38c54110733555.jpg)  
Figure 2.1: Closed conic hulls of two closed convex sets shown in blue: segment (left) and ray (right). Magenta sets are liftings of the blue ones; red angles are the closed conic hulls of blue sets. To get from closed conic hulls the conic hulls per se, you should eliminate from the red angles their parts on the x-axis. When the original set is bounded (left picture), all you need to eliminate is the origin; when it is unbounded (right picture), you need to eliminate much more.

J.1. inf-convolution. The operation with functions related to the arithmetic summation of sets is the inf-convolution defined as follows. Let $f_{i} : \mathbb{R}^{n} \mathbb{R} \cup \{\infty\}, i = 1,..., n_{\mathrm{{i}}}$ , be functions. Their inf-convolution is the function

$$
f(x) = \inf \left\{f_{1} \left(x^{1}\right) + \dots + f_{k} \left(x^{k}\right): x^{1} + \dots + x^{k} = x \right\}.\tag{\((*)\}
$$

We claim that

If all $f_{i}$ are CQr, their inf-convolution is $> - \infty$ everywhere and for every x for which the inf in the right hand side of (\*) is finite, this infimum is achieved, then f is CQr.

Indeed, under the assumption in question the epigraph $\operatorname{Epi} \{f\} = \operatorname{Epi} \{f_{1}\} + \ldots + \operatorname{Epi} \{f_{k}\}$

K. Taking conic hull of a convex set. Let $X \subset \mathbb{R}^{n}$ be a nonempty convex set. Its conic hull is the set

$$
X^{+} = \{(x, t) \in \mathbb{R}^{n} \times \mathbb{R}: t > 0, t^{- 1} x \in X\}.
$$

Geometrically (see Fig. 2.1): we add to the coordinates of vectors from $\mathbb{R}^{n}$ a new coordinate equal to 1:

$$
(x_{1}, \dots, x_{n})^{T} \mapsto(x_{1}, \dots, x_{n}, 1)^{T},
$$

thus getting an Affine embedding of $\mathbb{R}^{n}$ in $\mathbb{R}^{n + 1}$ . We take the image of X under this mapping $- \phantom{+}^{66} \mathrm{lift}^{9}$ X by one along the $(n + 1)$ st axis – and then form the set $X^{+}$ by taking all (open) rays emanating from the origin and crossing the “lifted” X.

The conic hull is not closed (e.g., it does not contain the origin, which clearly is in its closure). The closed conic hull of X is the closure of its conic hull:

$$
\widehat{X}^{+} = \operatorname{cl} X^{+} = \left\{(x, t) \in \mathbb{R}^{n} \times \mathbb{R}: \exists \{(x_{i}, t_{i})\}_{i = 1}^{\infty}: t_{i} > 0, t_{i}^{- 1} x_{i} \in X, t = \lim_{i} t_{i}, x = \lim_{i} x_{i} \right\}.
$$

Note that if X is a closed convex set, then the conic hull $X^{+}$ of X is nothing but the intersection of the closed conic hull ${\widehat{X}}^{+}$ and the open half-space $\{t > 0\}$ (check!); thus, the closed conic hull of a closed convex set X is larger than the conic hull by some part of the hyperplane $\{t = 0\}$ . When X is closed and bounded, then the diference between the hulls is pretty small: $\widehat{X}^{+} = X^{+} \cup \{0\}$ (check!). Note also that if X is a closed convex set, you can obtain it from its (closed) conic hull by taking intersection with the hyperplane $\{t = 1\}$

$$
x \in X \Leftrightarrow(x, 1) \in \widehat{X}^{+} \Leftrightarrow(x, 1) \in X^{+}.
$$

Proposition 2.3.1 (i) If a set X is $CQr.$

$$
X = \left\{x: \exists u: Ax + Bu + b \geq_{\mathbf{K}} 0 \right\},\tag{2.3.4}
$$

with $\in S{\mathcal{O}}_{.}$ , then the conic hull $X^{+}$ is $CQr$ as well:

$$
X^{+} = \{(x, t): \exists(u, s): Ax + Bu + tb \geq_{\mathbf{K}} 0, \left[\begin{array}{c} 2 \\ s - t \\ s + t \end{array} \right] \geq_{\mathbf{L}^{3}} 0\}.\tag{2.3.5}
$$

(ii) If the set X given by (2.3.4) is closed, then the CQr set

$$
\tilde{X}^{+} = \{(x, t): \exists u: Ax + Bu + tb \geq_{\mathbf{K}} 0\} \bigcap \{(x, t): t \geq 0\}\tag{2.3.6}
$$

is “between” the conic hull $X^{+}$ and the closed conic hull ${\widehat{X}}^{+}$ of X :

$$
X^{+} \subset \tilde{X}^{+} \subset \hat{X}^{+}.
$$

(iii) If the CQR (2.3.4) is such that $Bu \in{\bf K}$ implies that $Bu = 0$ , then $\widetilde X^{+} = \widehat X^{+}$ , so that ${\widehat{X}}^{+}$ is $CQr$

Proof. (i): We have

$$
\begin{array}{rcl} X^{+} & \equiv & \{(x, t): t > 0, x / t \in X\} \\ & = & \{(x, t): \exists u: A(x / t) + Bu + b \ge_{\mathbf{K}} 0, t > 0\} \\ & = & \{(x, t): \exists v: Ax + Bv + tb \ge_{\mathbf{K}} 0, t > 0\} \\ & = & \{(x, t): \exists v, s: Ax + Bv + tb \ge_{\mathbf{K}} 0, t, s \geq 0, ts \geq 1\}, \end{array}
$$

and we arrive at (2.3.5).

(ii): We should prove that the set $\widetilde{X}^{+}$ (which by construction is $\mathrm{CQr})$ is between $X^{+}$ and ${\widehat{X}}^{+}$ . The inclusion $X^{+} \subset \widetilde{X}^{+}$ is readily given by (2.3.5). Next, let us prove that $\widetilde X^{+} \subset \widehat X^{+}$ . Let us choose a point ${\bar{x}} \in X$ , so that for a properly chosen ¯u it holds

$$
A \bar{x} + B \bar{u} + b \geq_{\mathbf{K}} 0,
$$

i.e., $(\bar{x}, 1) \in \widetilde{X}^{+}$ . Since $\widetilde{X}^{+}$ is convex (this is true for every CQr set), we conclude that whenever $(x, t)$ belongs to $\widetilde{X}^{+}$ , so does every pair $(x_{\epsilon} = x + \epsilon \bar{x}, t_{\epsilon} = t + \epsilon)$ with $\epsilon > 0 :$

$$
\exists u = u_{\epsilon}: Ax_{\epsilon} + Bu_{\epsilon} + t_{\epsilon} b \geq_{\mathbf{K}} 0.
$$

It follows that $t_{\epsilon}^{- 1} x_{\epsilon} \in X$ , whence $(x_{\epsilon}, t_{\epsilon}) \in X^{+} \subset \widehat{X}^{+}$ . As $\epsilon + 0$ , we have $(x_{\epsilon}, t_{\epsilon})(x, t)$ , and since ${\widehat{X}}^{+}$ is closed, we get $(x, t) \in \widehat{X}^{+}$ . Thus, $\widetilde X^{+} \subset \widehat X^{+}$

(ii): Assume that $Bu \in{\bf K}$ only if $Bu = 0$ , and let us show that $\widetilde X^{+} = \widehat X^{+}$ . We just have to prove that $\widetilde{X}^{+}$ is closed, which indeed is the case due to the following

Lemma 2.3.1 Let Y be $a ~ CQr$ set with CQR

$$
Y = \{y: \exists v: Py + Qv + r \geq_{\mathbf{K}} 0\}
$$

such that $Qv \in \mathbf{K}$ only when $Qv = 0$ . Then

(i) There exists a constant $C < \infty$ such that

$$
Py + Qv + r \in \mathbf{K} \Rightarrow \| Qv \|_{2} \leq C(1 + \| Py + r \|_{2});\tag{2.3.7}
$$

(ii) Y is closed.

Proof of Lemma. (i): Assume, on the contrary to what should be proved, that there exists a sequence $\{y_{i}, v_{i}\}$ such that

$$
Py_{i} + Qv_{i} + r \in \mathbf{K}, \| Qv_{i} \|_{2} \geq \alpha_{i}(1 + \| Py_{i} + r \|_{2}), \alpha_{i} \rightarrow \infty \text{as} i \rightarrow \infty.\tag{2.3.8}
$$

By Linear $\mathrm{\Algebra}$ , for every b such that the linear system $Qv = b$ is solvable, it admits a solution v such that $\| v \|_{2} \leq C_{1} \| b \|_{2}$ with $C_{1} < \infty$ depending on $Q$ only; therefore we can assume, in addition to (2.3.8), that

$$
\| v_{i} \|_{2} \leq C_{1} \| Qv_{i} \|_{2}\tag{2.3.9}
$$

for all i. Now, from (2.3.8) it clearly follows that

$$
\| Qv_{i} \|_{2} \to \infty \text{as} i \to \infty;\tag{2.3.10}
$$

setting

$$
\widehat{v}_{i} = \frac{1}{\| Qv_{i} \|_{2}} v_{i},
$$

we have

(a)

(b)

$$
\| Q \widehat{v}_{i} \|_{2} = 1 \quad \forall i,\tag{c}
$$

$$
\| \widehat{v}_{i} \| \leq C_{1} \quad \forall i,\tag{[by(2.3.9)]}
$$

$$
Q \widehat{v}_{i} + \| Qv_{i} \|_{2}^{- 1}(Py_{i} + r) \in \mathbf{K} \quad \forall i,
$$

$$
(d) \quad \| Qv_{i} \|_{2}^{- 1} \| Py_{i} + r \|_{2} \leq \alpha_{i}^{- 1} \rightarrow 0 \text{as} i \rightarrow \infty \quad[\text{by (2.3.8)}]
$$

Taking into account (b) and passing to a subsequence, we can assume that $\widehat{v}_{i} \to \widehat{v}$ as $i \infty;$ by $(c, d)$ $Q \widehat{v} \in \mathbf{K}$ , while by (a) $\| Q{\widehat{v}} \|_{2} = 1,{\mathrm{i.e., ~}} Q{\widehat{v}} \neq 0$ , which is the desired contradiction.

(ii) To prove that Y is closed, assume that $y_{i} ~ \in ~ Y$ and $y_{i} \to y \mathrm{~ as ~} i \to \infty.$ , and let us verify that $y \in Y$ . Indeed, since $y_{i} \in Y$ , there exist $v_{i}$ such that $Py_{i} + Qv_{i} + r \in \mathbf{K}$ . Same as above, we can assume that (2.3.9) holds. Since $y_{i} \to y,$ the sequence $\{Qv_{i}\}$ is bounded by (2.3.7), so that the sequence $\{v_{i}\}$ is bounded by (2.3.9). Passing to a subsequence, we can assume that $v_{i} v$ as i → ∞; passing to the limit, as $i \infty,$ , in the inclusion $Py_{i} + Qv_{i} + r \in \mathbf{K}$ , we get $Py + Qv + r \in \mathbf{K}$ , i.e., $y \in Y$ ✷

K.1. “Projective transformation” of a CQr function. The operation with functions related to taking conic hull of a convex set is the “projective transformation” which converts a function $f(x) : \mathbb{R}^{n} \mathbb{R} \cup \{\infty\}^{3)}$ into the function

$$
f^{+}(x, s) = sf(x / s): \{s > 0\} \times \mathbb{R}^{n} \rightarrow \mathbb{R} \cup \{\infty\}.
$$

The epigraph of $f^{+}$ is the conic hull of the epigraph of $f$ with the origin excluded:

$$
\begin{array}{rcl} \{(x, s, t): s > 0, t \geq f^{+}(x, s)\} & = & \{(x, s, t): s > 0, s^{- 1} t \geq f(s^{- 1} x)\} \\ & = & \{(x, s, t): s > 0, s^{- 1}(x, t) \in \mathrm{Epi} \{f\}\}.\end{array}
$$

The set cl $\operatorname{Epi} \{f^{+}\}$ is the epigraph of certain function, let it be denoted $\widehat{f}^{+}(x, s)$ ; this function is called the projective transformation of $f.\ \mathrm{E.g.}$ , the fractional-quadratic function from Example 5 is the projective transformation of the function $f(x) = x^{T} x$ . Note that the function $\widehat{f}^{+}(x, s)$ does not necessarily coincide with $f^{+}(x, s)$ even in the open half-space $s > 0;$ ; this is the case if and only if the epigraph of f is closed (or, which is the same, $f$ is lower semicontinuous: whenever $x_{i} \to x$ and $f(x_{i}) a.$ , we have $f(x) \leq a)$ . We are about to demonstrate that the projective transformation “nearly” preserves CQ-representability:

Proposition 2.3.2 Let $f : \mathbb{R}^{n} \mathbb{R} \cup \{\infty\}$ be a lower semicontinuous function which is $CQr \mathrm{:}$

$$
\operatorname{Epi} \{f\} \equiv \{(x, t): t \geq f(x)\} = \{(t, x): \exists u: Ax + tp + Bu + b \geq_{\mathbf{K}} 0\},\tag{2.3.11}
$$

where $\mathbf{K} \in{\mathcal{S}}{\mathcal{O}}$ . Assume that the CQR is such that $Bu \ge_{\bf K} ~ 0$ implies that $Bu = 0$ . Then the projective transformation ${\widehat{f}}^{+}$ of f is CQr, namely,

$$
\operatorname{Epi} \{\widehat{f}^{+}\} = \{(x, t, s): s \geq 0, \exists u: Ax + tp + Bu + sb \geq_{\mathbf{K}} 0\}.
$$

Indeed, let us set

$$
G = \left\{(x, t, s): \exists u: s \geq 0, Ax + tp + Bu + sb \geq_{\mathbf{K}} 0 \right\}.
$$

As we remember from the previous combination rule, G is exactly the closed conic hull of the epigraph of $f, \mathrm{i.e.,} G = \mathrm{Epi} \{\widehat{f}^{+}\}$

L. The polar of a convex set. Let $X \subset \mathbb{R}^{n}$ be a convex set containing the origin. The polar of X is the set

$$
X_{*} = \left\{y \in \mathbb{R}^{n}: y^{T} x \leq 1 \forall x \in X \right\}.
$$

In particular,

- the polar of the singleton {0} is the entire space;

- the polar of the entire space is the singleton {0};

- the polar of a linear subspace is its orthogonal complement $\mathrm{(why ?)}$ ;

- the polar of a closed convex pointed cone K with a nonempty interior is $- K_{*}$ , minus the dual cone (why?).

Polarity is “symmetric”: if X is a closed convex set containing the origin, then so is $X_{*}$ , and twice taken polar is the original set: $(X_{*})_{*} = X$

We are about to prove that the polarity $X \mapsto X_{*}$ “nearly” preserves CQ-representability:

Proposition 2.3.3 Let $X \subset \mathbb{R}^{n}, 0 \in X$ , be a CQr set:

$$
X = \left\{x: \exists u: Ax + Bu + b \geq_{\mathbf{K}} 0 \right\},\tag{2.3.12}
$$

where $\mathbf{K} \in S{\mathcal{O}}$

Assume that the conic inequality in (2.3.12 is essentially strictly feasible (see Definition $\it 1.4.3)$ . Then the polar of X is the CQr set

$$
X_{*} = \left\{y: \exists \xi : A^{T} \xi + y = 0, B^{T} \xi = 0, b^{T} \xi \leq 1, \xi \geq_{\mathbf{K}} 0 \right\}\tag{2.3.13}
$$

Indeed, consider the following conic quadratic problem:

$$
\min_{x, u} \left\{- y^{T} x: Ax + Bu + b \geq_{\mathbf{K}} 0 \right\}.\tag{\((P_y)\}
$$

A vector y belongs to $X_{*}$ if and only if $(\mathbb{P}_{y})$ is bounded below and its optimal value is at least −1. Since $(\mathbb{P}_{y})$ is essentially strictly feasible, from the (refined) Conic Duality Theorem it follows that these properties of $(\mathbb{P}_{y})$ hold if and only if the dual problem

$$
\max_{\xi} \left\{- b^{T} \xi : A^{T} \xi = - y, B^{T} \xi = 0, \xi \geq_{\mathbf{K}} 0 \right\}
$$

(recall that K is self-dual) has a feasible solution with the value of the dual objective at least -1. Thus,

$$
X_{*} = \left\{y: \exists \xi : A^{T} \xi + y = 0, B^{T} \xi = 0, b^{T} \xi \leq 1, \xi \geq_{\mathbf{K}} 0 \right\},
$$

as claimed in (2.3.13). The resulting representation of X<sub>∗</sub> clearly is a CQR.

L.1. The Legendre transformation of a CQr function. The operation with functions related to taking polar of a convex set is the Legendre (or Fenchel conjugate) transformation. The Legendre transformation (≡ the Fenchel conjugate) of a function $f(x) : \mathbb{R}^{n} \mathbb{R} \cup \{\infty\}$ is the function

$$
f_{*}(y) = \sup_{x} \left[y^{T} x - f(x) \right].
$$

In particular,

- the conjugate of a constant $f(x) \equiv c$ is the function

$$
f_{*}(y) = \left\{\begin{array}{ll} - c, & y = 0 \\ + \infty, & y \neq 0 \end{array}; \right.
$$

- the conjugate of an Affine function $f(x) \equiv a^{T} x + b$ is the function

$$
f_{*}(y) = \left\{\begin{array}{ll} - b, & y = a \\ + \infty, & y \neq a \end{array}; \right.
$$

- the conjugate of a convex quadratic form $\begin{array}{r}{f(x) \equiv \frac{1}{2} x^{T} D^{T} Dx + b^{T} x + c} \end{array}$ with rectangular D such that $\mathrm{Null}(D^{T}) = \{0\}$ is the function

$$
f_{*}(y) = \left\{\begin{array}{ll} \frac{1}{2}(y - b)^{T} D^{T}(DD^{T})^{- 2} D(y - b) - c, & y - b \in \operatorname{Im} D^{T} \\ + \infty, & \text{otherwise} \end{array}; \right.
$$

It is worth mentioning that the Legendre transformation is symmetric: if f is a proper convex lower semicontinuous function $(\mathrm{i.e.,} \ \emptyset \neq \mathrm{Epi} \{f\}$ is convex and closed), then so is $f_{*}$ , and taken twice, the Legendre transformation recovers the original function: $(f_{*})_{*} = f.$

We are about to prove that the Legendre transformation “nearly” preserves CQ-representability:

Proposition 2.3.4 Let $f : \mathbb{R}^{n} \mathbb{R} \cup \{\infty\}$ be $CQr$

$$
\{(x, t): t \geq f(x)\} = \{(t, x): \exists u: Ax + tp + Bu + b \geq_{\mathbf{K}} 0\},
$$

where $\mathbf{K} \in{\mathcal{S}}{\mathcal{O}}$ . Assume that the conic inequality in the right hand side is essentially strictly convex. Then the Legendre transformation of f is $CQr$

$$
\operatorname{Epi} \left\{f_{*} \right\} = \left\{(y, s): \exists \xi : A^{T} \xi = - y, B^{T} \xi = 0, p^{T} \xi = 1, s \geq b^{T} \xi, \xi \geq_{\mathbf{K}} 0 \right\}.\tag{2.3.14}
$$

Indeed, we have

$$
\operatorname{Epi} \left\{f_{*} \right\} = \left\{(y, s): y^{T} x - f(x) \leq s \forall x \right\} = \left\{(y, s): y^{T} x - t \leq s \forall(x, t) \in \operatorname{Epi} \{f\} \right\}.\tag{2.3.15}
$$

Consider the conic quadratic program

$$
\min_{x, t, u} \left\{- y^{T} x + t: Ax + tp + Bu + b \geq_{\mathbf{K}} 0 \right\}.\tag{\((\mathbb{P}_y)\}
$$

By (2.3.15), a pair $(y, s)$ belongs to $\operatorname{Epi} \{f_{*}\}$ if and only if $(\mathbb{P}_{y})$ is bounded below with optimal value $\geq - s$ . Since $(\mathbb{P}_{y})$ is essentially strictly feasible, this is the case if and only if the dual problem

$$
\max_{\xi} \left\{- b^{T} \xi : A^{T} \xi = - y, B^{T} \xi = 0, p^{T} \xi = 1, \xi \geq_{\mathbf{K}} 0 \right\}
$$

has a feasible solution with the value of the dual objective $\geq - s$ . Thus,

$$
\operatorname{Epi} \left\{f_{*} \right\} = \left\{(y, s): \exists \xi : A^{T} \xi = - y, B^{T} \xi = 0, p^{T} \xi = 1, s \geq b^{T} \xi, \xi \geq_{\mathbf{K}} 0 \right\}
$$

as claimed in (2.3.14), and (2.3.14) is a CQR.

Corollary 2.3.5 Let X be $a ~ CQr$ set:

$$
X = \{x: \exists u: Ax + By + r \in \mathbf{K}\}\tag{[K \in SO]}
$$

and let the conic inequality in this CQR be essentially strictly feasible. Then the support function

$$
\operatorname{Supp}_{X}(x) = \sup_{y \in X} x^{T} y
$$

of a nonempty CQr set X is $CQr$

Indeed, $\operatorname{Supp}_{X}(\cdot)$ clearly is the Fenchel conjugate of the characteristic function $\chi(x)$ of X, and the latter function admits the CQR given by the equivalence

$$
\{t \geq \chi(x)\} \Leftrightarrow \{\exists u:[Ax + By + c; t] \geq_{\mathbf{K} \times \mathbb{R}_{+}} 0\}.
$$

The conic inequality in the right hand side is essentially strictly feasible along with $Ax + Bu +$ $c \ge_{\bf K} ~ 0$ , and it remains to refer to Proposition 2.3.4. ✷

M. Taking convex hull of a finite union. The convex hull of a set $Y ~ \subset ~ \mathbb{R}^{n}$ is the smallest convex set which contains Y :

$$
\operatorname{Conv}(Y) = \left\{x = \sum_{i = 1}^{k_{x}} \alpha_{i} x_{i}: x_{i} \in Y, \alpha_{i} \geq 0, \sum_{i} \alpha_{i} = 1 \right\}
$$

The closed convex hull $\overline{{\mathrm{Conv}}}(Y) = \operatorname{cl} \mathrm{Conv}(Y)$ of Y is the smallest closed convex set containing $Y.$

Following Yu. Nesterov, let us prove that taking convex hull “nearly” preserves CQrepresentability:

Proposition 2.3.5 Let $X_{1},..., X_{k} \subset \mathbb{R}^{n}$ be closed nonempty convex CQr sets:

$$
X_{i} = \{x: A_{i} x + B_{i} u_{i} + b_{i} \geq_{\mathbf{K}_{i}} 0, i = 1, \dots, k\},\tag{2.3.16}
$$

with $\mathbf{K}_{i} \in S \mathcal{O}$ . Then the $CQr$ set

$$
\begin{array}{rclrcl} Y & = & \{x: \exists \xi^{1},..., \xi^{k}, t_{1},..., t_{k}, \eta^{1},..., \eta^{k}: \\ & &[A_{1} \xi^{1} + B_{1} \eta^{1} + t_{1} b_{1};...; A_{k} \xi^{k} + B_{k} \eta^{k} + t_{k} b_{k}] & \geq_{\mathbf{K}} & 0, \mathbf{K} = \mathbf{K}_{1} \times...\times \mathbf{K}_{k} \\ & & t_{1},..., t_{k} & \geq & 0, \\ & & \xi^{1} +...+ \xi^{k} & = & x \\ & & t_{1} +...+ t_{k} & = & 1\}, \end{array}\tag{2.3.17}
$$

is between the convex hull and the closed convex hull of the set $X_{1} \cup \ldots \cup X_{k}$

$$
\operatorname{Conv} \left(\bigcup_{i = 1}^{k} X_{i}\right) \subset Y \subset \overline{{\operatorname{Conv}}} \left(\bigcup_{i = 1}^{k} X_{i}\right).
$$

If, in addition to CQ-representability,

(i) all $X_{i}$ are bounded,

(ii) $X_{i} = Z_{i} + W$ , where $Z_{i}$ are closed and bounded sets and W is a convex closed set, then

$$
\operatorname{Conv} \left(\bigcup_{i = 1}^{k} X_{i}\right) = Y = \overline{{\operatorname{Conv}}} \left(\bigcup_{i = 1}^{k} X_{i}\right)
$$

is $CQr$

Proof. First, the set Y clearly contains $\operatorname{Conv}(\bigcup_{i = 1}^{k} X_{i})$ . Indeed, since the sets $X_{i}$ are convex, the convex hull of their union is

$$
\left\{x = \sum_{i = 1}^{k} t_{i} x^{i}: x^{i} \in X_{i}, t_{i} \geq 0, \sum_{i = 1}^{k} t_{i} = 1 \right\}
$$

(why?); for a point

$$
x = \sum_{i = 1}^{k} t_{i} x^{i} \qquad \left[x^{i} \in X_{i}, t_{i} \geq 0, \sum_{i = 1}^{k} t_{i} = 1 \right],
$$

there exist $u^{i}, i = 1,..., k$ , such that

$$
A_{i} x^{i} + B_{i} u^{i} + b_{i} \geq_{\mathbf{K}_{i}} 0.
$$

We get

$$
\begin{array}{rcl} x & = &(t_{1} x^{1}) + \ldots +(t_{k} x^{k}) \\ & = & \xi^{1} + \ldots + \xi^{k}, \\ & &[\xi^{i} = t_{i} x^{i}]; \\ t_{1}, \ldots, t_{k} & \geq & 0; \\ t_{1} + \ldots + t_{k} & = & 1; \\ A_{i} \xi^{i} + B_{i} \eta^{i} + t_{i} b_{i} & \geq_{\mathbf{K}_{i}} & 0, i = 1, \ldots, k, \\ & &[\eta^{i} = t_{i} u^{i}], \end{array}\tag{2.3.18}
$$

so that $x \in Y$ (see the definition of Y ).

To complete the proof that Y is between the convex hull and the closed convex hull of $\bigcup_{i = 1}^{k} X_{i}$ 5 it remains to verify that if $x \in Y$ then x is contained in the closed convex hull of $\bigcup_{i = 1}^{k} X_{i}$ . Let us somehow choose ${\bar{x}}^{i} \in X_{i};$ for properly chosen ${\bar{u}}^{i}$ we have

$$
A_{i} \bar{x}^{i} + B_{i} \bar{u}^{i} + b_{i} \geq_{\mathbf{K}_{i}} 0, i = 1, \dots, k.\tag{2.3.19}
$$

Since $x \in Y$ , there exist $t_{i}, \xi^{i}, \eta^{i}$ satisfying the relations

$$
\begin{array}{rcl} x & = & \xi^{1} + \ldots + \xi^{k}, \\ t_{1}, \ldots, t_{k} & \geq & 0, \\ t_{1} + \ldots + t_{k} & = & 1, \\ A_{i} \xi^{i} + B_{i} \eta^{i} + t_{i} b_{i} & \geq_{\mathbf{K}_{i}} & 0, i = 1, \ldots, k.\end{array}\tag{2.3.20}
$$

In view of the latter relations and (2.3.19), we have for $0 < \epsilon <$ 1:

$$
A_{i}[(1 - \epsilon) \xi^{i} + \epsilon k^{- 1} \bar{x}^{i}] + B_{i}[(1 - \epsilon) \eta^{i} + \epsilon k^{- 1} \bar{u}^{i}] +[(1 - \epsilon) t_{i} + \epsilon k^{- 1}] b_{i} \ge_{\mathbf{K}_{i}} 0;
$$

setting

$$
\begin{array}{rcl} t_{i, \epsilon} & = &(1 - \epsilon) t_{i} + \epsilon k^{- 1}; \\ x_{\epsilon}^{i} & = & t_{i, \epsilon}^{- 1} \left[(1 - \epsilon) \xi^{i} + \epsilon k^{- 1} \bar{x}^{i} \right]; \\ u_{\epsilon}^{i} & = & t_{i, \epsilon}^{- 1} \left[(1 - \epsilon) \eta^{i} + \epsilon k^{- 1} \bar{u}^{i} \right], \end{array}
$$

we get

$$
\begin{array}{rlr}{A_{i} x_{\epsilon}^{i} + B_{i} u_{\epsilon}^{i} + b_{i}} &{\geq_{\mathbf{K}_{i}}} &{0 \Rightarrow x_{\epsilon}^{i} \in X_{i},} \\{t_{1, \epsilon},..., t_{k, \epsilon}} &{\geq} &{0,} \\{t_{1, \epsilon} +...+ t_{k, \epsilon}} & = & 1 \end{array}
$$

whence

$$
x_{\epsilon} := \sum_{i = 1}^{k} t_{i, \epsilon} x_{\epsilon}^{i} \in \operatorname{Conv}(\bigcup_{i = 1}^{k} X_{i}).
$$

On the other hand, we have by construction

$$
x_{\epsilon} = \sum_{i = 1}^{k} \left[(1 - \epsilon) \xi^{i} + \epsilon k^{- 1} \bar{x}^{i} \right]\rightarrow x = \sum_{i = 1}^{k} \xi^{i} \text{as} \epsilon \rightarrow + 0,
$$

so that x belongs to the closed convex hull of $\bigcup_{\cdot}^{k} X_{i},$ , as claimed. i=1

It remains to verify that in the cases of (i), (ii) the convex hull of $\bigcup_{i = 1}^{k} X_{i}$ is the same as the closed convex hull of this union. (i) is a particular case of (ii) corresponding to $W = \{0\}$ , so that it sufices to prove (ii). Assume that

$$
\begin{array}{c}x_{t} = \sum_{i = 1}^{k} \mu_{ti}[z_{ti} + p_{ti}] \rightarrow x \text{as} i \rightarrow \infty\\\left[z_{ti} \in Z_{i}, p_{ti} \in W, \mu_{ti} \geq 0, \sum_{i} \mu_{ti} = 1 \right]\end{array}
$$

and let us prove that x belongs to the convex hull of the union of $X_{i}$ . Indeed, since $Z_{i}$ are closed and bounded, passing to a subsequence, we may assume that

$$
z_{ti} \rightarrow z_{i} \in Z_{i} \text{and} \mu_{ti} \rightarrow \mu_{i} \text{as} t \rightarrow \infty.
$$

It follows that $\mu_{i} \geq 0, \sum_{i} \mu_{i} = 1$ , and the vectors

$$
p_{t} = \sum_{i = 1}^{m} \mu_{ti} p_{ti} = x_{t} - \sum_{i = 1}^{k} \mu_{ti} z_{ti}
$$

converge as $t \to \infty$ to some vector $p,$ and since W is closed and convex, $p \in W$ . We now have

$$
x = \lim_{i \to \infty} \left[\sum_{i = 1}^{k} \mu_{ti} z_{ti} + p_{t} \right] = \sum_{i = 1}^{k} \mu_{i} z_{i} + p = \sum_{i = 1}^{k} \mu_{i}[z_{i} + p],
$$

so that x belongs to the convex hull of the union of $X_{i}$ (as a convex combination of points $z_{i} + p \in X_{i})$ ). ✷

N. The recessive cone of a CQr set. Let X be a closed nonempty convex set. The recessive cone $\operatorname{\overline{{Rec}}}(X)$ of X is the set

$$
\operatorname{Rec}(X) = \{h: x + th \in X \quad \forall(x \in X, t \geq 0)\}.
$$

It can be easily verified that Rec(X) is a closed cone, and that

$$
\operatorname{Rec}(X) = \left\{h: \bar{x} + th \in X \quad \forall t \geq 0 \right\} \quad \forall \bar{x} \in X,
$$

i.e., that Rec(X) is the set of all directions h such that the ray emanating from a point of X and directed by h is contained in X.

Proposition 2.3.6 Let X be a nonempty CQr set with CQR

$$
X = \{x \in \mathbb{R}^{n}: \exists u: Ax + Bu + b \geq_{\mathbf{K}} 0\},
$$

where $\mathbf{K} \in{\mathcal{S}}{\mathcal{O}}$ , and let the CQR be such that $Bu \in{\bf K}$ only if $Bu = 0$ . Then X is closed, and the recessive cone of X is $CQr$

$$
\operatorname{Rec}(X) = \{h: \exists v: Ah + Bv \geq_{\mathbf{K}} 0\}.\tag{2.3.21}
$$

Proof. The fact that X is closed is given by Lemma 2.3.1. In order to prove (2.3.21), let us temporary denote by R the set in the right hand side of this relation; we should prove that $R = \operatorname{Rec}(X)$ The inclusion $R \subset \operatorname{Rec}(X)$ is evident. To prove the inverse inclusion, let ${\bar{x}} \in X$ and $h \in \operatorname{Rec}(X)$ , so that for every $i = 1, 2, \dots$ there exists $u_{i}$ such that

$$
A(\bar{x} + ih) + Bu_{i} + b \in \mathbf{K}.\tag{2.3.22}
$$

By Lemma 2.3.1,

$$
\left\| Bu_{i} \right\|_{2} \leq C(1 + \left\| A(\bar{x} + ih) + b \right\|_{2})\tag{2.3.23}
$$

for certain $C < \infty$ and all i. Besides this, we can assume w.l.o.g. that

$$
\| u_{i} \|_{2} \leq C_{1} \| Bu_{i} \|_{2}\tag{2.3.24}
$$

(cf. the proof of Lemma 2.3.1). By (2.3.23) – (2.3.24), the sequence $\{v_{i} = i^{- 1} u_{i}\}$ is bounded; passing to a subsequence, we can assume that $v_{i} \to v{\mathrm{~ as ~}} i \to \infty.$ . By (2.3.22, we have for all i

$$
i^{- 1} A(\bar{x} + ih) + Bv_{i} + i^{- 1} b \in \mathbf{K},
$$

whence, passing to limit as $i \infty, Ah + Bv \in \mathbf{K}$ . Thus, $h \in R.$

## 2.3.5 More examples of CQ-representable functions/sets

We are suficiently equipped to build the dictionary of CQ-representable functions/sets. Having built already the “elementary” part of the dictionary, we can add now a more “advanced” part. Numeration below continues the one on Section 2.3.1.

7. Convex quadratic form $g(x) = x^{T} Qx + q^{T} x + r(Q$ is a positive semidefinite symmetric matrix) is CQr.

Indeed, Q is positive semidefinite symmetric and therefore can be decomposed as $Q = D^{T} D$ , so that $g(x) = \| Dx \|_{2}^{2} + q^{T} x + r$ . We see that g is obtained from our “raw materials” – the squared Euclidean norm and an Affine function – by Affine substitution of argument and addition.

Here is an explicit CQR of g:

$$
\{(x, t): x^{T} D^{T} Dx + q^{T} x + r \leq t\} = \{(x, t): \left\| \begin{array}{c} Dx \\ \frac{t + q^{T} x + r}{2} \end{array} \right.\left\|_{2} \leq \frac{t - q^{T} x - r}{2} \right\}\tag{2.3.25}
$$

8. The cone $K = \{(x, \sigma_{1}, \sigma_{2}) \in \mathbb{R}^{n} \times \mathbb{R} \times \mathbb{R} : \sigma_{1}, \sigma_{2} \geq 0, \sigma_{1} \sigma_{2} \geq x^{T} x\}{\mathrm{~ is ~ CQr ~}}$

Indeed, the set is just the epigraph of the fractional-quadratic function $x^{T} x / s,$ , see Example $5;$ we simply write $\sigma_{1}$ instead of s and $\sigma_{2}$ instead of t.

Here is an explicit CQR for the set:

$$
K = \{(x, \sigma_{1}, \sigma_{2}): \left\| \binom{x}{\frac{\sigma_{1} - \sigma_{2}}{2}} \right\|_{2} \leq \frac{\sigma_{1} + \sigma_{2}}{2}\}\tag{2.3.26}
$$

Surprisingly, our set is just the ice-cream cone, more precisely, its inverse image under the one-to-one linear mapping

$$
\left(\begin{array}{c} x \\ \sigma_{1} \\ \sigma_{2} \end{array} \right) \mapsto \left(\begin{array}{c} x \\ \frac{\sigma_{1} - \sigma_{2}}{2} \\ \frac{\sigma_{1} + \sigma_{2}}{2} \end{array} \right).
$$

9. The “half-cone” $K_{+}^{2} = \{(x_{1}, x_{2}, t) \in \mathbb{R}^{3} : x_{1}, x_{2} \geq 0, 0 \leq t \leq \sqrt{x_{1} x_{2}}\}$ is $\mathrm{CQr}$ Indeed, our set is the intersection of the cone $\{t^{2} \leq x_{1} x_{2}, x_{1}, x_{2} \geq 0\}$ from the previous example and the half-space $t \geq 0$

Here is the explicit CQR of $K_{+}$ :

$$
K_{+} = \{(x_{1}, x_{2}, t): t \geq 0, \left\| \binom{t}{\frac{x_{1} - x_{2}}{2}} \right\|_{2} \leq \frac{x_{1} + x_{2}}{2}\}.\tag{2.3.27}
$$

10. The hypograph of the geometric mean – the set $K^{2} = \{(x_{1}, x_{2}, t) \in \mathbb{R}^{3} : x_{1}, x_{2} \geq 0, t \leq \sqrt{x_{1} x_{2}}\}$ is CQr.

Note the diference with the previous example – here t is not required to be nonnegative!

Here is the explicit CQR for $K^{2}$ (cf. Example 9):

$$
K^{2} = \left\{(x_{1}, x_{2}, t): \exists \tau : t \leq \tau; \tau \geq 0, \left\| \binom{\tau}{\frac{x_{1} - x_{2}}{2}} \right\|_{2} \leq \frac{x_{1} + x_{2}}{2} \right\}.
$$

11. The hypograph of the geometric mean of $2^{l}$ variables – the set $K^{2^{l}} = \{(x_{1},..., x_{2^{l}}, t) \in \mathbb{R}^{2^{l} + 1}$ $x_{i} \geq 0, i = 1,..., 2^{l}, t \leq(x_{1} x_{2}...x_{2^{l}})^{1 / 2^{l}}\} - \mathrm{is ~ CQr}$ . To see it and to get its CQR, it sufices to iterate the construction of Example 10. Indeed, let us add to our initial variables a number of additional x-variables: – let us call our $2^{l}$ original x-variables the variables of level 0 and write $x_{0, i}$ instead of $x_{i}$ . Let us add one new variable of level 1 per every two variables of level 0. Thus, we add $2^{l - 1}$ variables $x_{1, i}$ of level 1.

– similarly, let us add one new variable of level 2 per every two variables of level 1, thus adding $2^{l - 2}$ variables $x_{2, i};$ then we add one new variable of level 3 per every two variables of level 2, and so on, until level l with a single variable $x_{l, 1}$ is built.

Now let us look at the following system $S$ of constraints:

$$
\begin{array}{ll} \text{layer 1:} & x_{1, i} \leq \sqrt{x_{0, 2i - 1} x_{0, 2i}}, x_{1, i}, x_{0, 2i - 1}, x_{0, 2i} \geq 0, i = 1,..., 2^{l - 1} \\ \text{layer 2:} & x_{2, i} \leq \sqrt{x_{1, 2i - 1} x_{1, 2i}}, x_{2, i}, x_{1, 2i - 1}, x_{1, 2i} \geq 0, i = 1,..., 2^{l - 2} \end{array}
$$

$$
\begin{array}{c} \text{layer l:} \\ \hline(*) \end{array} \qquad \begin{array}{c} x_{l, 1} \leq \sqrt{x_{l - 1, 1} x_{l - 1, 2}}, x_{l, 1}, x_{l - 1, 1}, x_{l - 1, 2} \geq 0 \\ t \leq x_{l, 1} \end{array}
$$

The inequalities of the first layer say that the variables of the zero and the first level should be nonnegative and every one of the variables of the first level should be $\leq$ the geometric mean of the corresponding pair of our original x-variables. The inequalities of the second layer add the requirement that the variables of the second level should be nonnegative, and every one of them should be $\leq$ the geometric mean of the corresponding pair of the first level variables, etc. It is clear that if all these inequalities and (\*) are satisfied, then t is $\leq$ the geometric mean of $x_{1},..., x_{2^{l}}$ . Vice versa, given nonnegative $x_{1},..., x_{2^{l}}$ and a real t which is $\leq$ the geometric mean of $x_{1},..., x_{2^{l}}$ , we always can extend these data to a solution of S. In other words, $K^{2^{l}}$ is the projection of the solution set of $S$ onto the plane of our original variables $x_{1},..., x_{2^{l}}, t$ . It remains to note that the set of solutions of S is CQr (as the intersection of CQr sets $\left\{\left(v, p, q, r \right) \in \mathbb{R}^{N} \times \mathbb{R}_{+}^{3} : r \leq \sqrt{qp} \right\}$ , see Example 9), so that its projection is also CQr. To get a CQR of $K^{2^{l}}$ , it sufices to replace the inequalities in $S$ with their conic quadratic equivalents, explicitly given in Example 9.

12. The convex increasing power function $x_{+}^{p / q}$ of rational degree $p / q \ge 1$ is $\mathrm{CQr}$ Indeed, given positive integers $p, q, p \ > \q.$ , let us choose the smallest integer l such that $p \leq 2^{l}$ , and consider the CQr set

$$
K^{2^{l}} = \{(y_{1},..., y_{2^{l}}, s) \in \mathbb{R}_{+}^{2^{l} + 1}: s \leq(y_{1} y_{2}...y_{2^{l}})^{1 / 2^{l}}\}.\tag{2.3.28}
$$

Setting $r = 2^{l} - p,$ consider the following Affine parameterization of the variables from $\mathbb{R}^{2^{l} + 1}$ by two variables $\xi, t \colon$

– s and r first variables $y_{i}$ are all equal to ξ (note that we still have $2^{l} - r = p \ge q$ “unused” variables $y_{i})$ ;

– q next variables $y_{i}$ are all equal to $t;$

– the remaining $y_{i} \mathrm{^{*} s}$ , if any, are all equal to 1.

The inverse image of $K^{2^{l}}$ under this mapping is CQr and it is the set

$$
K = \{(\xi, t) \in \mathbb{R}_{+}^{2}: \xi^{1 - r / 2^{l}} \leq t^{q / 2^{l}}\} = \{(\xi, t) \in \mathbb{R}_{+}^{2}: t \geq \xi^{p / q}\}.
$$

It remains to note that the epigraph of $x_{+}^{p / q}$ can be obtained from the CQr set K by operations preserving the CQr property. Specifically, the set $L = \{(x, \xi, t) \in \mathbb{R}^{3} : \xi \geq 0, \xi \geq x, t \geq \xi^{p / q}\}$ is the intersection of $\mathbf{K} \times \mathbb{R}$ and the half-space $\{(x, \xi, t) : \xi \geq x\}$ and thus is $\mathrm{CQr}$ along with $K$ , and $\mathrm{Epi} \{x_{+}^{p / q}\}$ is the projection of the CQr set L on the plane of x, t-variables.

13. The decreasing power function $g(x) ={\left\{\begin{array}{ll}{x^{- p / q},} &{x > 0} \\{+ \infty,} &{x \leq 0} \end{array} \right.}$ (p, q are positive integers) is $\mathrm{CQr}$ Same as in Example 12, we choose the smallest integer l such that $2^{l} \geq p + q.$ , consider the CQr set (2.3.28) and parameterize afinely the variables $y_{i}, s$ by two variables $(x, t)$ as follows:

– s and the first $(2^{l} - p - q)$ y<sub>i</sub>’s are all equal to one;

$p$ of the remaining $y_{i} \mathrm{\dot{s}}$ are all equal to x, and the q last of $y_{i} \mathrm{^s}$ are all equal to t.

It is immediately seen that the inverse image of $K^{2^{l}}$ under the indicated Affine mapping is the epigraph of $g.$

14. The even power function $g(x) = x^{2p}$ on the axis $(p$ positive integer) is CQr. Indeed, we already know that the sets $P = \{(x, \xi, t) \in \mathbb{R}^{3} : x^{2} \leq \xi\}$ and $K^{\prime} = \{(x, \xi, t) \in \mathbb{R}^{3} : 0 \leq \xi, \xi^{p} \leq$ $t\}$ are CQr (both sets are direct products of R and the sets with already known to us $\mathrm{CQR}^{\prime} s)$ . It remains to note that the epigraph of $g$ is the projection of $P \cap Q$ onto the (x, t)-plane.

Example 14 along with our combination rules allows to build a CQR for a polynomial $p(x)$ of the form

$$
p(x) = \sum_{l = 1}^{L} p_{l} x^{2l}, \quad x \in \mathbb{R},
$$

with nonnegative coeficients.

15. The concave monomial $x_{1}^{\pi_{1}}...x_{n}^{\pi_{n}}$ . Let $\begin{array}{r}{\pi_{1} ={\frac{p_{1}}{p}},..., \pi_{n} ={\frac{p_{n}}{p}}} \end{array}$ be positive rational numbers with $\overline{{\pi_{1} + \ldots + \pi_{n} \leq 1}}$ . The function

$$
f(x) = - x_{1}^{\pi_{1}}...x_{n}^{\pi_{n}}: \mathbb{R}_{+}^{n} \to \mathbb{R}
$$

is $\mathrm{CQr}.$

The construction is similar to the one of Example 12. Let l be such that $2^{l} \geq p$ . We recall that the set

$$
Y = \left\{(y_{1},..., y_{2^{l}}, s): y_{1},..., y_{2^{l}}, s): y_{1},..., y_{2^{l}} \geq 0, 0 \leq s \leq(y_{1}..., y_{2^{l}})^{1 / 2^{l}} \right\}
$$

is $\mathrm{CQr}$ , and therefore so is its inverse image under the Affine mapping

$$
(x_{1}, \ldots, x_{n}, s) \mapsto(\underbrace{x_{1}, \ldots, x_{1}}_{p_{1}}, \underbrace{x_{2}, \ldots, x_{2}}_{p_{2}}, \ldots, \underbrace{x_{n}, \ldots, x_{n}}_{p_{n}}, \underbrace{s, \ldots, s}_{2^{l} - p}, \underbrace{1, \ldots, 1}_{p - p_{1} - \dots - p_{n}}, s),
$$

i.e., the set

$$
\begin{array}{rcl} Z & = & \{(x_{1},..., x_{n}, s): x_{1},..., x_{n} \geq 0, 0 \leq s \leq(x_{1}^{p_{1}}...x_{n}^{p_{n}} s^{2^{l} - p})^{1 / 2^{l}}\} \\ & = & \{(x_{1},..., x_{n}, s): x_{1},..., x_{n} \geq 0, 0 \leq s \leq x_{1}^{p_{1} / p}...x_{n}^{p_{n} / p}\}.\end{array}
$$

Since the set $Z$ is $\mathrm{CQr},$ so is the set

$$
Z^{\prime} = \{(x_{1},..., x_{n}, t, s): x_{1},..., x_{n} \geq 0, s \geq 0, 0 \leq s - t \leq x_{1}^{\pi_{1}}...x_{n}^{\pi_{n}}\},
$$

which is the intersection of the half-space $\{s \geq 0\}$ and the inverse image of Z under the Affine mapping $(x_{1},..., x_{n}, t, s) \mapsto(x_{1},..., x_{n}, s - t)$ . It remains to note that the epigraph of f is the projection of $Z^{\prime}$ onto the plane of the variables $x_{1},..., x_{n}, t$

16. The convex monomial $x_{1}^{- \pi_{1}}...x_{n}^{- \pi_{n}}$ . Let $\pi_{1},..., \pi_{n}$ be positive rational numbers. The function

$$
f(x) = x_{1}^{- \pi_{1}} \dots x_{n}^{- \pi_{n}}: \{x \in \mathbb{R}^{n}: x > 0\} \rightarrow \mathbb{R}
$$

is $\mathrm{CQr}.$

The verification is completely similar to the one in Example 15.

17a. The $p \mathrm { - n o r m ~ } \| x \| _ { p } = ( \sum _ { i = 1 } ^ { n } | x _ { i } | ^ { p } ) ^ { 1 / p } : \mathbf { R } ^ { n }  \mathbf { R } ( p \geq 1 $ is a rational number). We claim that the function $\| x \|_{p}$ is CQr.

It is immediately seen that

$$
\| x \|_{p} \leq t \Leftrightarrow t \geq 0 \& \exists v_{1},..., v_{n} \geq 0: | x_{i} | \leq t^{(p - 1) / p} v_{i}^{1 / p}, i = 1,..., n, \sum_{i = 1}^{n} v_{i} \leq t.\tag{2.3.29}
$$

Indeed, if the indicated $v_{i}$ exist, then $\sum_{i = 1}^{n} | x_{i} |^{p} \leq t^{p - 1} \sum_{i = 1}^{n} v_{i} \leq t^{p}$ , i.e., $\| x \|_{p} \leq t$ . Vice versa, assume that $\| x \|_{p} \leq t$ . If $t = 0$ , then $x = 0.$ , and the right hand side relations in (2.3.29) are satisfied for $v_{i} = 0, \i = 1,..., n$ . If $t > 0$ , we can satisfy these relations by setting $v_{i} = | x_{i} |^{p} t^{1 - p}$

(2.3.29) says that the epigraph of $\| x \|_{p}$ is the projection onto the (x, t)-plane of the set of solutions to the system of inequalities

$$
\begin{array}{c} t \geq 0 \\ v_{i} \geq 0, i = 1,..., n \\ x_{i} \leq t^{(p - 1) / p} v_{i}^{1 / p}, i = 1,..., n \\ - x_{i} \leq t^{(p - 1) / p} v_{i}^{1 / p}, i = 1,..., n \\ v_{1} +...+ v_{n} \leq t \end{array}
$$

Each of these inequalities defines a CQr set (in particular, for the nonlinear inequalities this is due to Example 15). Thus, the solution set of the system is CQr (as an intersection of finitely many CQr sets), whence its projection on the $(x, t) – \mathrm{plane - i.e.}$ , the epigraph of $\| x \|_{p}$ – is CQr.

17b. The function $\| x _ { + } \| _ { p } = { \biggl ( } \sum _ { i = 1 } ^ { n } \operatorname* { m a x } ^ { p } [ x _ { i } , 0 ] { \biggr ) } ^ { 1 / p } \colon \mathbf { R } ^ { n } \to \mathbf { R } ~ ( p \geq 1 \qquad $ a rational number) is CQr.

Indeed,

$$
t \geq \| x_{+} \|_{p} \Leftrightarrow \exists y_{1}, \dots, y_{n}: 0 \leq y_{i}, x_{i} \leq y_{i}, i = 1, \dots, n, \| y \|_{p} \leq t.
$$

Thus, the epigraph of $\| x_{+} \|_{p}$ is a projection of the CQr set (see Example 17) given by the system of inequalities in the right hand side.

From the above examples it is seen that the “expressive abilities” of c.q.i.’s are indeed strong: they allow to handle a wide variety of very different functions and sets.

## 2.3.6 Fast CQr approximations of exponent and logarithm

The epigraph of exponent (after “changing point of view,” becoming the hypograph of logarithm) is important for applications convex set which is not representable via Magic Cones. However, “for all practical purposes” this set is CQr (rigorously speaking, admits “short” high-accuracy CQr approximation).

Exponent exp{x} which lives in our mind is defined on the entire real axis and rapidly goes to 0 as $x \to - \infty$ and to +∞ as $x \to \infty$ . Exponent which lives in a computer is a different beast: if you ask a computer with the usual floating point arithmetics what is exp{−750} or exp{750}, it will return 0 in the first, and +∞ in the second case. Thus, “for all practical purposes” we can restrict the domain of the exponent — pass from $\exp \{x\}$ to

$$
\operatorname{Exp}_{R}(x) = \left\{\begin{array}{ll} \exp \{x\}, & | x | \leq R \\ + \infty, & \text{otherwise} \end{array} \right.
$$

with once for ever fixed moderate (few hundreds) R.

Proposition 2.3.7 “For all practical purposes, $\because \exp_{R}(\cdot)$ is $CQr$ . Rigorously speaking: for every $\epsilon \in(0, 0.1)$ we can point out a CQr function $E_{R, \ell}$ <sub>$\epsilon$</sub> with domain $[- R, R]$ and with explicit $CQR$ (involving $O(1) \ln(R / \epsilon)$ variables and conic quadratic constraints) such that

$$
\forall x \in[- R, R]:(1 - \epsilon) \exp \{x\} \leq E_{R, \epsilon}(x) \leq \exp \{x\}.
$$

Proof. is given by explicit construction as follows. Let k be positive integer such that $2^{k} > 2R$ For $x \in[- R, R]$ , setting $y = 2^{- k} x$ , we have $\left| y \right| \leq \frac{1}{2}$ , whence, as is immediately seen,

$$
\exp \{y - 4y^{2}\} \leq 1 + y \leq \exp \{y\} \& \exp \{x\} = \exp \{2^{k} y\}.
$$

Consequently,

$$
\exp \{x\} \exp \{- 2^{k + 2} y^{2}\} \leq[1 + y]^{(2^{k})} \leq \exp \{x\}.
$$

We have $2^{k + 2} y^{2} = 2^{2 - k} \mathbb{R}^{2}$ . Consequently, with properly chosen $O(1)$ and $k = \rvert{O(1) \ln(R / \epsilon)} \rvert$ we have

$$
(1 - \epsilon) \exp \{x\} \leq \left[1 + 2^{- k} x \right]^{(2^{k})} \leq \exp \{x\} \forall x \in[- R, R].
$$

With the just defined k, the CQr function $E_{R, \epsilon}(x)$ given by the CQR

$$
t \geq E_{R, \epsilon}(x) \Leftrightarrow \left\{| x | \leq R, \exists u_{0},..., u_{k - 1}: 1 + 2^{- k} x \leq u_{0}, u_{0}^{2} \leq u_{1}, u_{1}^{2} \leq u_{2},..., u_{k - 2}^{2} \leq u_{k - 1}, u_{k - 1}^{2} \leq t \right\}
$$

is the required CQr approximation of $\mathrm{Exp}_{R}(\cdot)$

Fast CQr approximation of logarithm which “lives in computer.” Tight CQr approximation of “computer exponent” $\mathrm{Exp}_{R}(\cdot)$ yields tight CQr approximation of the (minus) “computer logarithm.” The construction is as follows:

Given $\epsilon \in(0, 0.1)$ and R, we have built a CQr set ${\mathcal{Q}} ={\mathcal{Q}}_{R, \epsilon} \subset \mathbb{R}^{2}$ with “short” (with $O(1)$ ln $(R / \epsilon)$ variables and conic quadratic constraints) explicit CQR and have ensured that

A) If $(x, t) \in \mathcal{Q}$ and $t^{\prime} \geq t,$ then $(x, t^{\prime}) \in \mathcal{Q}$

B) If $(x, t) \in \mathcal{Q}.$ , then $| x | \le R$ and $t \geq(1 - \epsilon) \exp \{x\}$

C) If $| x | \leq R$ , then there exists t such that $(x, t) \in \mathcal{Q}$ and $t \le(1 + \epsilon) \exp \{x\}$

Now let

$$
\Delta = \Delta_{R, \epsilon} =(1 + \epsilon)[\exp \{- R\}, \exp \{R\}]
$$

(with R like $700, \Delta, \cdots$ for all practical purposes”, is the entire positive ray), and let

$$
\overline{{\mathcal{Q}}} = \overline{{\mathcal{Q}}}_{R, \epsilon} = \{(x, t) \in \mathcal{Q}_{R, \epsilon}: t \in \Delta\}.
$$

Note that $\overline{{\mathcal{Q}}}$ is CQr with explicit and short CQR readily given by the CQR of $\mathcal{Q}.$ Let function $\operatorname{Ln}(t) : = \operatorname{Ln}_{R, \epsilon}(t) : \mathbb{R} \to \mathbb{R} \cup \{- \infty\}$ be defined by the relation

$$
z \leq \mathrm{Ln}(t) \Leftrightarrow \exists x: z \leq x \&(x, t) \in \overline{{\mathcal{Q}}}\tag{2.3.30}
$$

## From A) – C) immediately follows

Proposition 2.3.8 Ln(t) is a concave function with hypograph given by explicit $CQR,$ and this function approximates ln(t) on $\Delta$ within accuracy $O(\epsilon)$

$$
t \notin \Delta \Rightarrow \operatorname{Ln}(t) = - \infty \& t \in \Delta \Rightarrow - \ln(1 + \epsilon) \leq \operatorname{Ln}(t) - \ln(t) \leq \ln \left(\frac{1}{1 - \epsilon}\right)
$$

Verification is immediate. When $t \not \in \Delta$ , the right hand side condition in (2.3.30) never takes place (since $(x, t) \in \overline{{\Omega}}$ implies $t \in \Delta)$ , implying that $\operatorname{Ln}(t) = - \infty$ outside of $\Delta.$ . Now let $t \in \Delta$ $\operatorname{If} z \leq \operatorname{Ln}(t)$ , then there exists $x \geq z$ such that $(x, t) \in \overline{{\mathcal{Q}}} \subset \mathcal{Q}$ , whence exp $\{x\}(1 - \epsilon) \leq t$ by B), that is, $z \leq x \leq \ln(t) - \ln(1 - \epsilon)$ . Since this relation holds true for every $z \le \mathrm{Ln}(t)$ , we get

$$
\mathrm{Ln}(t) \leq \ln(t) - \ln(1 - \epsilon).
$$

On the other hand, let $x_{t} = \ln(t) - \ln(1 + \epsilon)$ , that is, exp $\{x_{t}\}(1 + \epsilon) = t$ . Since $t \in \Delta$ , we have $| x_{t} | \le R,$ , which, by C), implies that there exists $t^{\prime}$ such that $(x_{t}, t^{\prime}) \in \mathcal{Q}$ and $t^{\prime} \leq(1 + \epsilon) \exp \{x_{t}\} =$ $t.\ \mathrm{By \A})$ it follows that $(x_{t}, t) \in \mathcal{Q}$ , and since $t \in \Delta.$ , we have also $\left(x_{t}, t \right) \in \overline{{\mathcal{Q}}}$ . Setting $z = x_{t}$ , we $\mathrm{get} \z \le x_{t}$ and $(x_{t}, t) \in \overline{{\Omega}}$ , that is $z = x_{t} \leq \mathrm{Ln}(t)$ by (2.3.30). Thus, $\operatorname{Ln}(t) \geq x_{t} = \ln(t) - \ln(1 + \epsilon)$ completing the proof of Proposition. ✷

Refinement. Our construction of fast CQr approximation of $\mathrm{Exp}_{R}(\cdot)$ (which, as a byproduct, gives fast CQr approximation of $\operatorname{Ln}_{R}(\cdot))$ has two components:

- Computing $\exp \{x\}$ for large x reduces to computing $\exp \{2^{- k} x\}$ and squaring the results k times;

- For small $y, \exp \{y\} \approx 1 + y$ , and this simplest approximation is accurate enough for our purposes.

Note that the second component can be improved: we can approximate $\exp \{y\}$ by a larger part of the Taylor expansion, provided that the epigraph of this part is CQr. For example,

$$
g_{6}(y) = 1 + y + \frac{y^{2}}{2} + \frac{y^{3}}{6} + \frac{y^{4}}{24} + \frac{y^{5}}{120} + \frac{y^{6}}{720}
$$

for small y approximates exp{y} much better than $g_{1}(y) = 1 + y$ and happens to be convex function of y representable as

$$
g_{6}(y) = c_{0} + c_{2}(\alpha_{2} + x)^{2} + c_{4}(\alpha_{2} + y)^{4} + c_{6}(\alpha_{6} + y)^{6}
$$

$$
[c_{i} > 0 \forall i]
$$

As a result, g<sub>6</sub> is CQr with simple $\mathrm{CQR}^{\mathrm{~ 4 ~}}$ . As a result, the CQr function $E(x)$ with the CQR

$$
t \geq E(x) \Leftrightarrow \left\{| x | \leq R, \exists u_{0},..., u_{k - 1}: \underbrace{g_{6}(2^{- k} x) \leq u_{0}}_{\mathrm{CQr}}, u_{0}^{2} \leq u_{1}, u_{1}^{2} \leq u_{2},..., u_{k - 2}^{2} \leq u_{k - 1}, u_{k - 1}^{2} \leq t \right\}
$$

ensures the target relation

$$
| x | \leq R \Rightarrow(1 - \epsilon) \exp \{x\} \leq E(x) \leq(1 + \epsilon) \exp \{x\}
$$

with smaller k than in our initial construction. For example, with $g_{6}$ in the role of $g_{1}, R = 700$ $k = 15$ we ensure $\epsilon = 3.0 \mathrm{{e -}} 11$ . It is an “honest” result – it indeed is what happens on actual computer. In this respect it should be mentioned that our previous considerations contain an element of cheating (hopefully, recognized by a careful reader): by reasons similar to those which make “computer exponent” of 750 equal +∞, applying the standard floating point arithmetics to numbers like $1 + y$ for “very small” y leads to significant loss of accuracy, and in our reasoning we tacitly assumed (as everywhere in this course) that operating with CQR’s we use precise Real Arithmetics. With floating point implementation, the best $\epsilon$ achievable with our initial construction, as applied with $R = 700$ , value of $\epsilon$ is as “large” as 1.e-5, the corresponding k being 35.

## 2.3.7 From CQR’s to K-representations of functions and sets

On a closest inspection, the calculus of conic quadratic representations of convex sets and functions we have developed so far has nothing in common with Lorentz cones per se — we could speak about “K-representable” functions and sets, where K is a family of regular cones in finitedimensional Euclidean spaces such that K

1. contains nonnegative ray,

2. contains the 3D Lorentz cone,

3. is closed w.r.t. taking finite direct products of its members, and

4. is closed w.r.t. passing from a cone to its dual.

Given such a family, we can define K-representation of a set $X \subset \mathbb{R}^{n}$ as a representation

$$
X = \left\{x \in \mathbb{R}^{n}: \exists u: Ax + Bu + c \in \mathbf{K} \right\}
$$

with $\mathbf{K} \in \mathcal{K}$ , and K-representation of a function $f(x) : \mathbb{R}^{m} \to \mathbb{R} \cup \{+ \infty\} \cdot$ as a K-representation of the epigraph of the function.

What we have developed so far dealt with the case when K is comprised of finite direct products of Lorentz cones; however, straightforward inspection shows that the calculus rules remain intact when replacing conic quadratic representability with K-representability<sup>5</sup>. What changes when passing from one family K to another is the “raw materials,” and therefore the scope of K-representable sets and functions. The importance of calculus of K-representability stems from the fact that given a solver for conic problems on cones from $\kappa.$ , this calculus allows one to recognize that in the problem of interest min $ _ { \cdot x \in \mathcal { X } } \Psi ( x )$ the objective Ψ and the domain $\mathcal{X}$ are $\scriptstyle{\mathcal{K}} \mathrm{- representable}^{6}$ and thus the problem of interest can be converted to a conic problem on cone from K and thus can be solved by the solver at hand.

As a matter of fact, as far as its paradigm and set of rules (not the set of raw materials!) are concerned,“calculus of K-representability” we have developed so far covers basically all needs of “well-structured” convex optimization. There is, however, an exception – this is the case when the objective in the convex problem of interest

$$
\min_{x \in \mathcal{X}} \overline{{\Psi}}(x)\tag{P}
$$

is given implicitly:

$$
\overline{{\Psi}}(x) = \sup_{y \in \mathcal{Y}} \psi(x, y)\tag{2.3.31}
$$

where Y is convex set and $\psi : \mathcal{X} \times \mathcal{Y} \mathbb{R}$ is convex-concave $(\mathrm{i.e.}$ , convex in $x \in \mathcal{X}$ and concave in $y \in \mathcal{V})$ and continuous. Problem (P ) with objective given by (2.3.31) is called “primal problem associated with the convex-concave saddle point problem mi ${\scriptstyle 1}_{x \in \mathcal{X}} \operatorname{max}_{y \in \mathcal{Y}} \psi(x, y)^{,}$ (see Section D.4), and problems of this type do arise in some applications of well-structured convex optimization. We are about to present a saddle point version of K-representability along with the corresponding calculus which allows to convert “K-representable convex-concave saddle point problems” into usual conic problems on cones from $\kappa$

What follows is taken from [31], where one can also find results on conic representations of the “most general problems with convex structure” – variational inequalities with monotone operators, the topic to be considered in Section 5.7.1.

From now on we fix a family K of regular cones in Euclidean spaces which contains nonnegative rays, ${\bf L}^{3}$ , and is closed w.r.t. taking finite direct products and passing from a cone K to its dual $\mathbf{K}^{*}$ . Unless otherwise is explicitly stated, all cones below belong to $\kappa.$

## 2.3.7.1 Conic representability of convex-concave function—definition

Let X , Y be nonempty convex sets given by K-representations:

$$
\mathcal{X} = \{x: \exists \xi : Ax + B \xi \leq_{\mathbf{K}_{\mathcal{X}}} c\}, \mathcal{Y} = \{y: \exists \eta : Cy + D \eta \leq_{\mathbf{K}_{\mathcal{Y}}} e\}.
$$

Let us say that a convex-concave continuous function $\psi(x, y) : \mathcal{X} \times \mathcal{Y} \mathbb{R}$ is K-representable on $\mathcal{X} \times \mathcal{V}$ , if it admits representation of the form

$$
\forall(x \in \mathcal{X}, y \in \mathcal{Y}): \psi(x, y) = \inf_{f, t, u} \left\{f^{T} y + t: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right\}\tag{2.3.32}
$$

where $\mathbf{K} \in \mathcal{K}$ . We call representation (2.3.32) essentially strictly feasible, if the conic constraint

$$
Pf + tp + Qu \leq_{\mathbf{K}} s - Rx
$$

in variables $f, t, u$ is essentially strictly feasible for every $x \in \mathcal{X}$

## 2.3.7.2 Main observation

Assume that Y is compact and is given by essentially strictly feasible K-representation

$$
\mathcal{Y} = \{y: \exists \eta : Cy + D \eta \leq_{\mathbf{K}_{\mathcal{Y}}} e\}.\tag{2.3.33}
$$

Then problem (P ) can be processed as follows: for $x \in \mathcal{X}$ we have

$$
\begin{array}{ll} \overline{{\Psi}}(x) = & \max_{y \in \mathcal{Y}} \inf_{f, t, u} \left[f^{T} y + t: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right] \\ = & \inf_{f, t, u} \left\{\max_{y \in \mathcal{Y}}[f^{T} y + t]: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right\} \\ & \left[\begin{array}{c} \text{Sion - Kakutani Theorem (Theorem D.4.3); recall} \\ \text{that} \mathcal{Y} \text{is convex and compact} \end{array} \right] \\ = & \inf_{f, t, u} \left\{\max_{y, \eta} \left[f^{T} y: Cy + D \eta \leq_{\mathbf{K}_{\mathcal{Y}}} e \right] + t: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right\} \\ = & \inf_{f, t, u} \left[\min_{\lambda} \left[\lambda^{T} e: C^{T} \lambda = f, D^{T} \lambda = 0, \lambda \geq_{\mathbf{K}_{\mathcal{Y}}^{*}} 0 \right] + t: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right\} \\ & \left[\begin{array}{c} \text{by strong conic duality, Theorem 1.4.4;} \\ \text{recall that (2.3.33) is essentially strictly feasible,} \end{array} \right] \end{array}
$$

so that the problem of interest

$$
\min_{x \in \mathcal{X}} \overline{{\Psi}}(x)\tag{a}
$$

reduces to the explicit K-conic problem

$$
\min_{x, \xi, f, t, u, \lambda} \left\{e^{T} \lambda + t: \begin{array}{ll} Pf + tp + Qu + Rx \le_{\mathbf{K}} s, \\ C^{T} \lambda = f, D^{T} \lambda = 0, \lambda \ge_{\mathbf{K}_{\mathcal{Y}}^{*}} 0, \\ Ax + B \xi \le_{\mathbf{K}_{\mathcal{X}}} c \end{array} \right\}.\tag{b}
$$

Here,“reduction” means that the x-component of a feasible solution $\boldsymbol{\zeta} =(x, \xi, f, t, u, \lambda)$ to (b) is a feasible solution to (a) with the value of the objective of the latter problem at x being ≤ the value of the objective of (b) at $\zeta,$ and the optimal values in (a) and (b) are the same. Thus, as far as building feasible approximate solutions of a prescribed accuracy $\epsilon > 0$ in terms of the objective are concerned, problem (a) reduces to the explicit conic problem (b). Note, however, that (a) and (b) are not “exactly the same”—it may happen that (a) is solvable while (b) is not so. “For all practical purposes,” this subtle diference is of no importance since in actual computations exactly optimal solutions usually are not reachable anyway.

Discussion. Note that for continuous convex-concave function $\psi : \mathcal{X} \times \mathcal{Y} \mathbb{R}$ the set

$$
\mathcal{Z} = \{[f; t; x]: x \in \mathcal{X}, f^{T} y + t \geq \psi(x, y) \forall y \in \mathcal{Y}\}
$$

clearly is convex, and by the standard Fenchel duality we have

$$
\forall(x \in \mathcal{X}, y \in \mathcal{Y}): \psi(x, y) = \inf_{f, t} \left[f^{T} y + t:[f; t; x] \in \mathcal{Z} \right].\tag{2.3.34}
$$

K-representability of $\psi$ on $\mathcal{X} \times \mathcal{V}$ means that (2.3.34) is preserved when replacing the set Z with its properly selected K-representable subset. Given that $\mathcal{Z}$ is convex, this assumption seems to be not too restrictive; taken together with K-representability of X and $\mathcal{V},$ it can be treated as the definition of K-representability of the convex-concave function $\psi.$ . The above derivation shows that convex-concave saddle point problem with K-representable domain and cost function (more precisely, the primal minimization problem (P ) induced by this saddle point problem) can be represented in explicit K-conic form, at least when the K-representations of the cost and of (compact) $\mathcal{V}$ are essentially strictly feasible.

Note also that if X and Y are convex sets and a function $\psi(x, y) : \mathcal{X} \times \mathcal{Y} \mathbb{R}$ admits representation (2.3.32), then $\psi$ automatically is convex in $x \in \mathcal{X}$ and concave in $y \in \mathcal{V}$

## 2.3.7.3 Symmetry

Assume that representation (2.3.32) is essentially strictly feasible. Then for all $x \in \mathcal{X}, y \in \mathcal{Y}$ we have by conic duality

$$
\begin{array}{rcl} \psi(x, y) & = & \inf_{f, t, u} \left\{f^{T} y + t: Pf + tp + Qu + Rx \le_{\mathbf{K}} s \right\} \\ & = & \sup_{\overline{{u}} \in \mathbf{K}^{*}} \left\{\overline{{u}}^{T}[Rx - s]: P^{T} \overline{{u}} + y = 0, p^{T} \overline{{u}} + 1 = 0, Q^{T} \overline{{u}} = 0 \right\}, \end{array}
$$

whence, setting

$$
\overline{{\mathcal{X}}} = \mathcal{Y}, \overline{{\mathcal{Y}}} = \mathcal{X}, \overline{{x}} = y, \overline{{y}} = x, \overline{{\psi}}(\overline{{x}}, \overline{{y}}) = - \psi(\overline{{y}}, \overline{{x}}) = - \psi(x, y),
$$

we have

$$
\begin{array}{rl}(\forall \overline{{x}} \in \overline{{\mathcal{X}}}, \overline{{y}} \in \overline{{\mathcal{Y}}}): \\ \overline{{\psi}}(\overline{{x}}, \overline{{y}}) = - \psi(x, y) = \inf_{\overline{{u}} \in \mathbf{K}^{*}} \left\{- \overline{{u}}^{T}[Rx - s]: P^{T} \overline{{u}} + y = 0, p^{T} \overline{{u}} + 1 = 0, Q^{T} \overline{{u}} = 0 \right\} \\ = \inf_{\overline{{f}}, \overline{{t}}, \overline{{u}}} \left\{\overline{{f}}^{T} \overline{{y}} + \overline{{t}}: \underbrace{\left[\begin{array}{l} \overline{{f}} = - \mathbb{R}^{T} \overline{{u}}, \overline{{t}} = s^{T} \overline{{u}}, Q^{T} \overline{{u}} = 0, \\ p^{T} \overline{{u}} + 1 = 0, P^{T} \overline{{u}} + \overline{{x}} = 0, \overline{{u}} \in \mathbf{K}^{*} \end{array} \right]}_{\Leftrightarrow \overline{{P}} \overline{{f}} + \overline{{t}} \overline{{p}} + \overline{{Q}} \overline{{u}} + \overline{{R}} \overline{{x}} \leq_{\overline{{\mathbf{K}}}^{-} \overline{{s}}}} \right\} \end{array}
$$

with $\mathbf{\overline{{K}}} \in \kappa$ . We see that a (essentially strictly feasible) K-representation of convex-concave function $\psi$ on $\mathcal{X} \times \mathcal{V}$ induces straightforwardly a K-representation of the “symmetric entity”— the convex-concave function $\overline{{\psi}}(y, x) = - \psi(x, y)$ on $\mathcal{V} \times \mathcal{X}$ , with immediate consequences for converting the optimization problem

$$
\sup_{y \in \mathcal{Y}} \left[\underline{{\Psi}}(y) := \inf_{x \in \mathcal{X}} \psi(x, y) \right]\tag{D}
$$

into the standard conic form.

## 2.3.7.4 Calculus of conic representations of convex-concave functions

Representations of the form (2.3.32) admit a calculus.

2.3.7.4.A. Raw materials for the calculus are given by

$$
t \geq a(x) \Leftrightarrow \exists u: \overline{{R}} x + t \overline{{p}} + \overline{{Q}} u \leq_{\overline{{\mathbf{K}}}} \overline{{s}}
$$

1. Functions $\psi(x, y) = a(x)$ , where $a(x)$ , Dom $a \supset{\mathcal{X}}$ , is K-representable:

$$
[\overline{{\mathbf{K}}} \in \mathcal{K}].
$$

In this case

$$
\psi(x, y) = \inf_{f, t, u} \bigg \{f^{T} y + t: \underbrace{f = 0, \overline{{R}} x + t \overline{{p}} + \overline{{Q}} u \leq_{\overline{{\mathbf{K}}}} \overline{{s}}}_{\Leftrightarrow Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \text{with} \mathbf{K} \in \mathcal{K}} \bigg\}.
$$

2. Functions $\psi(x, y) = - b(y)$ , where $b(y)$ , Dom $b \supset \mathcal{V}$ , is K-representable:

$$
t \geq b(y) \Leftrightarrow \exists u: \overline{{R}} y + t \overline{{p}} + \overline{{Q}} u \leq_{\overline{{\mathbf{K}}}} \overline{{s}}
$$

$$
[\overline{{\mathbf{K}}} \in \mathcal{K}]
$$

with essentially strictly feasible K-representation. In this case

$$
\begin{array}{rcl}\psi(x,y) & = & -b(y) = -\inf_{t,u}\Big\{t:\overline{R} y + t\overline{p} +\overline{Q} u\leq_{\overline{\mathbf{K}}}\overline{s}\Big\} \\ & = & -\sup_{u\in \overline{\mathbf{K}}^{*}}\Big\{-[\overline{R}^{T}u]^{T}y - s^{T}u: - u^{T}\overline{p} = 1,\overline{Q}^{T}u = 0\Big\text{[by conic duality]}\\ & = & \inf_{f,t,u}\bigg\{f^{T}y + t:\underbrace{f = \mathbb{R}^{T}u,t = s^{T}u,\overline{p}^{T}u + 1 = 0,\overline{Q}^{T}u = 0,u\geq_{\overline{\mathbf{K}}^{*}}0}_{\Leftrightarrow Pf + tp + Qu\leq_{\mathbf{K}}s\text{with $\mathbf{K}$}\in \mathcal{K}}\bigg\}.\end{array}
$$

3. Bilinear functions:

$$
\psi(x, y) \equiv a^{T} x + b^{T} y + x^{T} Ay + c \Rightarrow \psi(x, y) = \min_{f, t} \bigg \{f^{T} y + t: \underbrace{f = A^{T} x + b, t = a^{T} x + c}_{\Leftrightarrow Pf + tp + Rx \leq s} \bigg\}.
$$

4. “Generalized bilinear functions.” Let $\mathbf{U} \in{\mathcal{K}}$ and E be the embedding Euclidean space of U.

(a) Let $\overline{{\mathcal{X}}}$ be a nonempty K-representable set, and let continuous mapping $F(x) :{\overline{{\mathcal{X}}}} \to E$ possess K-representable U-epigraph<sup>7</sup>

$$
\operatorname{Epi}_{\mathbf{U}} F := \{(x, z) \in \overline{{\mathcal{X}}} \times E, z \geq_{\mathbf{U}} F(x)\} = \{(x, z): \exists u: \overline{{R}} x + \overline{{S}} z + \overline{{T}} u \leq_{\overline{{\mathbf{K}}}} \overline{{s}}\}[\overline{{\mathbf{K}}} \in \mathcal{K}].
$$

Then the function

$$
\overline{{\psi}}(x, y) = y^{T} F(x): \overline{{\mathcal{X}}} \times \mathbf{U}^{*} \to \mathbb{R}
$$

is K-representable on $\overline{{\mathcal{X}}} \times \mathbf{U}^{*}$

$$
\begin{array}{rcl} \forall(x \in \overline{{\mathcal{X}}}, y \in \mathbf{U}^{*}): \\ \overline{{\psi}}(x, y) & = & y^{T} F(x) = \inf_{f} \left\{f^{T} y: f \geq_{\mathbf{U}} F(x) \right\} \\ & = & \inf_{f, u} \left\{f^{T} y: \overline{{R}} x + \overline{{S}} z + \overline{{T}} u \leq_{\overline{{\mathbf{K}}}} \overline{{s}} \right\}.\end{array}
$$

(b) Let $\mathcal{V}$ be a nonempty K-representable set, and let continuous mapping $G(y) : \mathcal{V} \to E$ possess K-representable U<sup>∗</sup>-hypograph,

$$
\begin{array}{rcl} \mathrm{Hypo}_{\mathbf{U}^{*}} G & := & \{(y, w) \in \mathcal{Y} \times E: w \leq_{\mathbf{U}^{*}} G(y)\} \\ & = & \{(y, w): \exists u: \underline{{R}} y + \underline{{S}} w + \underline{{Q}} u \geq_{\underline{{\mathbf{K}}}} \underline{{s}}\} \qquad[\underline{{\mathbf{K}}} \in \mathcal{K}], \end{array}
$$

$$
\forall(x^{\prime}; x^{\prime \prime} \in \overline{{\mathcal{X}}}, \lambda \in[0, 1]): F(\lambda x^{\prime} +(1 - \lambda) x^{\prime \prime}) \leq_{\mathbf{U}} \lambda F(x^{\prime}) +(1 - \lambda) F(x^{\prime \prime}).
$$

the representation being essentially strictly feasible. Then the function

$$
\underline{{\psi}}(\underline{{x}}, y) = \underline{{x}}^{T} G(y): \mathbf{U} \times \mathcal{Y} \to \mathbb{R}
$$

is K-representable on $\mathbf{U} \times \mathbf{\mathcal{V}}$ :

$$
\begin{array}{rcl} \forall(\underline{{x}} \in \mathbf{U}, y \in \mathcal{Y}): \\ \underline{{\psi}}(\underline{{x}}, y) & = & \underline{{x}}^{T} G(y) = \sup_{w} \left\{\underline{{x}}^{T} w: w \leq_{\mathbf{U}^{*}} G(y) \right\}[\text{due to} \underline{{x}} \in \mathbf{U}] \\ & = & \sup_{w, u} \left\{\underline{{x}}^{T} w: \underline{{R}} y + \underline{{S}} w + \underline{{Q}} u \geq_{\underline{{\mathbf{K}}}} \underline{{s}} \right\} \\ & = & \inf_{\lambda} \left\{[\underline{{s}} - \underline{{R}} y]^{T} \lambda : \underline{{S}}^{T} \lambda = \underline{{x}}, \underline{{Q}}^{T} \lambda = 0, \lambda \in \underline{{\mathbf{K}}}^{*} \right\}[\text{by conic duality}] \\ & = & \inf_{f, t, u =[\lambda; w]} \left\{f^{T} y + t: \underbrace{\left[\begin{array}{c} f + \underline{{R}}^{T} \lambda = 0, \underline{{s}}^{T} \lambda = t, \\ \underline{{S}}^{T} \lambda = \underline{{x}}, \underline{{Q}}^{T} \lambda = 0, \lambda \in \underline{{\mathbf{K}}}^{*} \end{array} \right]}_{\Leftrightarrow Pf + tp + Qu + Rx \leq_{\mathbf{K}} s} \right\}[\mathbf{K} \in \mathcal{K}].\end{array}\tag{2.3.35}
$$

(c) Let Y and $G(\cdot)$ be as in item 4b) with $G(\mathcal{Y}) \subset \mathbf{U}^{*}$ , let X be a nonempty $\displaystyle \mathop{\kappa}_{\scriptscriptstyle -}$ representable set, and let

$$
F(x): \mathcal{X} \to \mathbf{U}
$$

be continuous U-convex mapping with K-representable U-epigraph:

$$
\begin{array}{rcl} \mathrm{Epi}_{\mathbf{U}} F & := & \{(x, z): x \in \mathcal{X}, z \ge_{\mathbf{U}} F(x)\} \\ & = & \{x, z: \exists v: \hat{R} x + \hat{S} z + \hat{Q} v \le_{\widehat{\mathbf{K}}} \hat{s}\} \qquad[\widehat{\mathbf{K}} \in \mathcal{K}] \end{array}\tag{2.3.36}
$$

Then the function

$$
\psi(x, y) = F^{T}(x) G(y): \mathcal{X} \times \mathcal{Y} \to \mathbb{R}
$$

is continuous convex-concave and admits K-representation as follows:

$$
\begin{array}{rcl} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi(x, y) & = & F^{T}(x) G(y) \\ & = & \inf_{z} \left\{z^{T} G(y): z \ge_{\mathbf{U}} F(x) \right\}[\mathrm{since} G(y) \in \mathbf{U}^{*}] \\ & = & \inf_{z, v} \left\{z^{T} G(y): \widehat{R} x + \widehat{S} z + \widehat{Q} v \le_{\widehat{\mathbf{K}}} \widehat{s} \right\}[\mathrm{by(2.3.36)}] \\ & = & \inf_{z, v} \left\{\inf_{f, t} \left\{f^{T} y + t: Pf + tp + Qu + Rz \le_{\mathbf{K}} s \right\}: \widehat{R} x + \widehat{S} z + \widehat{Q} v \le_{\widehat{\mathbf{K}}} \widehat{s} \right\} \end{array}
$$

due to (2.3.35)—note that on the domain on which in $f_{z, v}$ is taken we have $z \_ \geq \mathbf{\mathbf{U}}$ $F(x) \in \mathbf{U}$ , making (2.3.35) applicable. We conclude that

$$
\psi(x,y) = \inf_{f,t,u =[z;v]} \left\{f^{T}y + t:\underbrace{\left[\begin{array}{c}Pf + tp + Qu + Rz\leq_{\mathbf{K}}s,\\ \widehat{Rx} +\widehat{S} z + \widehat{Q} v\leq_{\widehat{\mathbf{K}}} \widehat{s}\\ \end{array} \right]}_{\Leftrightarrow \widetilde{P} f + t\widetilde{p} +\widetilde{Q} u + \widetilde{Rx}\leq_{\widetilde{\mathbf{K}}} \widetilde{c}}\right\} \quad[\widetilde{\mathbf{K}}\in \mathcal{K}].
$$

## 2.3.7.4.B. Basic calculus rules are as follows.

1. [Direct summation] Let $\theta_{i} > 0, i \leq I$ , and let

$$
\begin{array}{l} \forall(x^{i} \in \mathcal{X}^{i}, y^{i} \in \mathcal{Y}^{i}, i \leq I): \\ \psi_{i}(x^{i}, y^{i}) = \inf_{f_{i}, t_{i}, u_{i}} \left\{f_{i}^{T} y^{i} + t_{i}: P_{i} f_{i} + t_{i} p_{i} + Q_{i} u_{i} + R_{i} x^{i} \leq_{\mathbf{K}_{i}} s_{i} \right\} \end{array} \qquad[\mathbf{K}_{i} \in \mathcal{K}].
$$

Then

$$
\begin{array}{rl} \forall(x =[x^{1};...; x^{I}] \in \mathcal{X} = \mathcal{X}_{1} \times...\times \mathcal{X}_{I}, y =[y^{1};...; y^{I}] \in \mathcal{Y} = \mathcal{Y}_{1} \times...\times \mathcal{Y}_{I}): \\ \psi(x, y) := \sum_{i} \theta_{i} \psi_{i}(x^{i}, y^{i}) \\ = \inf_{f, t, u = \{f_{i}, t_{i}, u_{i}, i \leq I\}} \left\{f^{T} y + t: \underbrace{\frac{f =[\theta_{1} f_{1};...; \theta_{I} f_{I}], t = \sum_{i} \theta_{i} t_{i},}{P_{i} f_{i} + t_{i} p_{i} + Q_{i} u_{i} + R_{i} x^{i} \leq_{\mathbf{K}_{i}} s_{i}, 1 \leq i \leq I}}_{\Leftrightarrow Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \text{with} \mathbf{K} \in \mathcal{K}} \right\} \end{array}
$$

2. [Affine substitution of variables] Let

$$
\begin{array}{l} \forall(\xi \in \mathcal{X}^{+}, \eta \in \mathcal{Y}^{+}): \\ \psi_{+}(\xi, \eta) = \inf_{f_{+}, t_{+}, u_{+}} \left\{f_{+}^{T} \eta + t_{+}: P_{+} f_{+} + t_{+} p_{+} + Q_{+} u_{+} + R_{+} \xi \leq_{\mathbf{K}_{+}} s_{+} \right\}, \end{array}
$$

and

$$
x \mapsto Ax + b: \mathcal{X} \to \mathcal{X}^{+}, y \mapsto By + c: \mathcal{Y} \to \mathcal{Y}^{+}.
$$

Then

$$
\begin{array}{rcl} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi(x, y) & := & \psi_{+}(Ax + b, By + c) \\ & = & \inf_{f_{+}, t_{+}, u_{+}} \left\{f_{+}^{T}(By + c) + t_{+}: P_{+} f_{+} + t_{+} p_{+} + Q_{+} u_{+} + R_{+}[Ax + b] \leq_{\mathbf{K}_{+}} s_{+} \right\} \\ & = & \inf_{f, t, u =[f_{+}; t_{+}; u_{+}]} \Bigg \{f^{T} y + t: \underbrace{\left[\begin{array}{c} f = B^{T} f_{+}, t = t_{+} + f_{+}^{T} c \\ P_{+} f_{+} + t_{+} p_{+} + Q_{+} u_{+} + R_{+} Ax \leq_{\mathbf{K}_{+}} s_{+} - R_{+} b \end{array} \right]}_{\Leftrightarrow Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \text{with} \mathbf{K} \in \mathcal{K}} \Bigg\}.\end{array}
$$

3. [Taking conic combinations] This rule, evident by itself, is a combination of the two preceding rules:

Let $\theta_{i} > 0$ and $\psi_{i}(x, y) :{\mathcal{X}} \times{\mathcal{Y}} \to \mathbb{R}, i \leq I$ , be such that

$$
\begin{array}{l} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi_{i}(x, y) = \inf_{f_{i}, t_{i}, u_{i}} \left\{f_{i}^{T} y^{i} + t_{i}: P_{i} f_{i} + t_{i} p_{i} + Q_{i} u_{i} + R_{i} x^{i} \leq_{\mathbf{K}_{i}} s_{i} \right\}.\end{array}
$$

Then

$$
\begin{array}{rcl} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi(x, y) & := & \sum_{i} \theta_{i} \psi_{i}(x, y) \\ & = & \inf_{f, t, u = \{f_{i}, t_{i}, u_{i}, i \leq I\}} \Big \{f^{T} y + t: \underbrace{\left[\begin{array}{l} f = \sum_{i} \theta_{i} f_{i}, t = \sum_{i} \theta_{i} t_{i}, \\ P_{i} f_{i} + t_{i} p_{i} + Q_{i} u_{i} + R_{i} x^{i} \leq_{\mathbf{K}_{i}} s_{i}, 1 \leq i \leq I \end{array} \right]}_{\Leftrightarrow Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \text{with} \mathbf{K} \in \mathcal{K}} \Big\}.\end{array}
$$

4. [Projective transformation in x-variable] Let

$$
\forall(x \in \mathcal{X}, y \in \mathcal{Y}): \psi(x, y) = \inf_{f, t, u} \left\{f^{T} y + t: Pf + tp + Qu + Rx \leq_{\mathbf{K}} s \right\} \qquad[\mathbf{K} \in \mathcal{K}].
$$

Then

$$
\begin{array}{l}(\forall(\alpha, x): \alpha > 0, \alpha^{- 1} x \in \mathcal{X}, \forall y \in \mathcal{Y}) \\ \overline{{\psi}}((\alpha, x), y) := \alpha \psi(\alpha^{- 1} x, y) = \inf_{f, t, u} \Big \{f^{T} y + t: Pf + tp + Qu + Rx - \alpha s \leq_{\mathbf{K}} 0 \Big\}.\end{array}
$$

5. [Superposition in x-variable] Let $\mathcal{X}, \mathcal{y}$ be K-representable, $\overline{{\mathcal{X}}}$ be a K-representable subset of some $\mathbb{R}^{n}$ , and let $\kappa \ni \mathbf{U}$ be a cone in $\mathbb{R}^{n}$ . Furthermore, assume that

$$
\overline{{\psi}}(\overline{{x}}, y): \overline{{\mathcal{X}}} \times \mathcal{Y} \to \mathbb{R}
$$

is a continuous convex-concave function which is U-nondecreasing in ${\overline{{x}}} \in{\overline{{\mathcal{X}}}}$ , i.e.

$$
\forall(y \in \mathcal{Y}, \overline{{x}}^{\prime}, \overline{{x}}^{\prime \prime} \in \overline{{\mathcal{X}}}: \overline{{x}}^{\prime} \leq_{\mathbf{U}} \overline{{x}}^{\prime \prime}): \overline{{\psi}}(\overline{{x}}^{\prime \prime}, y) \geq \overline{{\psi}}(\overline{{x}}^{\prime}, y),
$$

and admits K-representation on $\overline{{\mathcal{X}}} \times \mathcal{Y}$

$$
\forall(\overline{{x}} \in \overline{{\mathcal{X}}}, y \in \mathcal{Y}): \overline{{\psi}}(\overline{{x}}, y) = \inf_{f, t, \overline{{u}}} \left\{f^{T} y + t: \overline{{P}} f + t \overline{{p}} + \overline{{Q}} \overline{{u}} + \overline{{R}} \overline{{x}} \leq_{\overline{{\mathbf{K}}}} \overline{{s}} \right\}.
$$

Let also

$$
x \mapsto X(x): \mathcal{X} \mapsto \overline{{\mathcal{X}}}
$$

be a U-convex mapping such that the intersection of the U-epigraph of the mapping with $\mathcal{X} \times \overline{{\mathcal{X}}}$ admits K-representation:

$$
\{(x, \overline{{x}}): x \in \mathcal{X}, \overline{{x}} \in \overline{{\mathcal{X}}}, \overline{{x}} \geq_{\mathbf{U}} X(x)\} = \{(x, \overline{{x}}): \exists v: Ax + B \overline{{x}} + Cv \leq_{\widehat{\mathbf{K}}} d\} \quad[\widehat{\mathbf{K}} \in \mathcal{K}].
$$

Then the function $\psi(x, y) = \overline{{\psi}}(X(x), y)$ admits K-representation on $\mathcal{X} \times \mathcal{V}$ :

$$
\begin{array}{rcl} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi(x, y) & = & \overline{{\psi}}(X(x), y) = \inf_{\overline{{x}}} \{\overline{{\psi}}(\overline{{x}}, y): \overline{{x}} \in \overline{{\mathcal{X}}} \& \overline{{x}} \ge_{\mathbf{U}} X(x)\} \\ & = & \inf_{f, t, \overline{{u}}, \overline{{x}}} \bigg \{f^{T} y + t: \begin{array}{l} \overline{{x}} \in \overline{{\mathcal{X}}}, \overline{{x}} \ge_{\mathbf{U}} X(x) \\ \overline{{P}} f + t \overline{{p}} + \overline{{Q}} \overline{{u}} + \overline{{R}} \overline{{x}} \le_{\overline{{\mathbf{K}}}} \overline{{s}} \end{array} \bigg\} \\ & = & \inf_{f, t, \overline{{u}}, \overline{{x}}, v} \bigg \{f^{T} y + t: \begin{array}{l} Ax + B \overline{{x}} + Cv \le_{\widehat{\mathbf{K}}} d \\ \overline{{P}} f + t \overline{{p}} + \overline{{Q}} \overline{{u}} + \overline{{R}} \overline{{x}} \le_{\overline{{\mathbf{K}}}} \overline{{s}} \end{array} \bigg\} \\ & = & \inf_{f, t, u =[\overline{{u}}, \overline{{x}}, v]} \Bigg \{f^{T} y + t: \underbrace{\left[\begin{array}{l} Ax + B \overline{{x}} + Cv \le_{\widehat{\mathbf{K}}} d \\ \overline{{P}} f + t \overline{{p}} + \overline{{Q}} \overline{{u}} + R \overline{{x}} \le_{\overline{{\mathbf{K}}}} \overline{{s}} \end{array} \right]}_{\Leftrightarrow Pf + tp + Qu + Rx \le_{\mathbf{K}} s \text{with} \mathbf{K} \in \mathcal{K}} \Bigg\}.\end{array}
$$

6. [Partial maximization] Let

$$
\begin{array}{l} \forall(x \in \mathcal{X}, y =[w; z] \in \mathcal{Y}): \\ \psi(x,[w; z]) = \inf_{[g; h], \tau, u} \left\{g^{T} w + h^{T} z + \tau : Gg + Hh + \tau p + Qu + Rx \leq_{\mathbf{K}} s \right\} \qquad[\mathbf{K} \in \mathcal{K}], \end{array}
$$

and let $\mathcal{V}$ be compact and given by K-representation:

$$
\mathcal{Y} = \{[w; z]: \exists v: Aw + Bz + Cv \leq_{\mathbf{L}} r\}
$$

such that the conic constraint $Bz + Cv \leq_{\mathbf{L}} r - A$ w in variables $z, v$ is essentially strictly feasible for every $w \in \mathcal{W} = \{w : \exists z :[w; z] \in \mathcal{V}\}$ . Then the function

$$
\overline{{\psi}}(x; w) := \max_{z} \left\{\psi(x,[w; z]):[w; z] \in \mathcal{Y} \right\}: \mathcal{X} \times \mathcal{W} \to \mathbb{R}
$$

is K-representable provided it is continuous<sup>8</sup>:

$$
\begin{array}{l} \forall(x \in \mathcal{X}, w \in \mathcal{W}): \\ \overline{{\psi}}(x; w) = \max_{z} \Big \{\inf_{[g; h], \tau, u} \Big[g^{T} w + h^{T} z + \tau : Gg + Hh + \tau p + Qu + Rx \le_{\mathbf{K}} s \Big]:[w; z] \in \mathcal{Y} \Big\} \\ = \inf_{[g; h], \tau, u} \Big \{\max_{z} \Big[g^{T} w + h^{T} z + \tau :[w; z] \in \mathcal{Y} \Big]: Gg + Hh + \tau p + Qu + Rx \le_{\mathbf{K}} s \Big\} \\ \quad \text{[bytheSion - KakutaniTheorem(TheoremD.4.3); notethatforw\in\mathcal{W}} \\ \quad \text{the set} \{z:[w; z] \in \mathcal{Y}\} \text{is nonempty, convex and compact]} \\ = \inf_{[g; h], \tau, u} \Big \{\max_{z, v} \Big[g^{T} w + h^{T} z + \tau : Bz + Cv \le_{\mathbf{L}} r - Aw \Big]: Gg + Hh + \tau p + Qu + Rx \le_{\mathbf{K}} s \Big\} \\ = \inf_{[g; h], \tau, u} \Big \{\min_{\xi} \Big[g^{T} w +(r - Aw)^{T} \xi + \tau : B^{T} \xi = h, C^{T} \xi = 0, \xi \ge_{\mathbf{L}^{*}} 0 \Big]: \\ \qquad Gg + Hh + \tau p + Qu + Rx \le_{\mathbf{K}} s \Big\} \qquad[byconicduality] \\ = \inf_{f, t, \overline{{u}} =[g, h, \tau, u, \xi]} \Bigg \{f^{T} w + t: \underbrace{\left[f = g - A^{T} \xi, t = r^{T} \xi + \tau, B^{T} \xi = h, c^{T} \xi = 0, \right.}_{\Leftrightarrow \overline{{P}} f + t \overline{{p}} + \overline{{Q}} \overline{{u}} + \overline{{R}} x \le_{\overline{{\mathbf{K}}}} s} with \overline{{\mathbf{K}}} \in \mathcal{K} \\ \end{array}
$$

Note that the last three rules combine with symmetry to induce “symmetric” rules on perspective transformation and superposition in y-variable and partial minimization in x-variable.

7. [Taking Fenchel conjugate] Let $\mathcal{X} \subset \mathbb{R}^{n}, \mathcal{Y} \subset \mathbb{R}^{m}$ be nonempty convex compact sets given by essentially strictly feasible K-representations

$$
\mathcal{X} = \{x: \exists \xi : Ax + B \xi \le_{\mathbf{K}_{\mathcal{X}}} c\}, \mathcal{Y} = \{y: \exists \eta : Cy + D \eta \le_{\mathbf{K}_{\mathcal{Y}}} e\},
$$

and assume that the conic constraint

$$
D^{T} \lambda = 0 \& \lambda \geq_{\mathbf{K}_{\mathcal{Y}}^{*}} 0
$$

is essentially strictly feasible (this definitely is the case when $\mathbf{K}_{\mathcal{Y}}$ is polyhedral). Let, next, $\psi(x, y) : \mathcal{X} \times \mathcal{Y} \mathbb{R}$ be continuous convex-concave function given by essentially strictly feasible K-representation:

$$
\psi(x, y) = \inf_{f, t, u} \left\{f^{T} y + t: Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s \right\}.
$$

Consider the Fenchel conjugate of $\psi :$ the function

$$
\psi_{*}(p, q) = \max_{x \in \mathcal{X}} \min_{y \in \mathcal{Y}} \left[p^{T} x + q^{T} y - \psi(x, y) \right]: \mathbb{R}^{n} \times \mathbb{R}^{m} \to \mathbb{R}.
$$

(cf. item L.1 in Section 2.3.3). We claim that $\psi_{*}$ is a continuous convex-concave $\displaystyle \mathop{\kappa}_{\scriptscriptstyle -}$ representable function with K-representation readily given by the K-representations of $\mathcal{X}$ $\mathcal{V}, \psi.$

The fact that $\psi_{*}$ is well defined and continuous is readily given by compactness of ${\mathcal{X}},$ $\mathcal{V}$ and continuity of $\psi.$ . These properties of the data imply by Sion-Kakutani Theorem (Theorem D.4.3)) that

$$
\psi_{*}(p, q) = \min_{y \in \mathcal{Y}} \max_{x \in \mathcal{X}} \left[p^{T} x + q^{T} y - \psi(x, y) \right].
$$

From the initial max min definition of $\psi_{*}$ it follows that ${\overline{{x}}}^{- - -}{\overline{{y}}}$

$$
\psi_{*}(p, q) = \max_{x \in \mathcal{X}} \left[p^{T} x + \min_{y \in \mathcal{Y}}[q^{T} y - \psi(x, y)] \right]
$$

is the pointwise maximum of a family of Affine functions of $p$ and thus is convex in $p.$ . From the min max representation of $\psi_{*}$ it follows that ${\overline{{y}}}^{--}{\overline{{x}}}$

$$
\psi_{*}(p, q) = \min_{y \in \mathcal{Y}}[q^{T} y + \max_{x \in \mathcal{X}}[p^{T} x - \psi(x, y)]]
$$

is the pointwise minimum of a family of Affine functions of $q$ and thus is concave in $q.$ It remains to build K-representation of $\psi_{*}$ . We have

$$
\begin{array}{ll} & \psi_{*}(p, q) \\ = & \max_{x \in \mathcal{X}} \min_{y \in \mathcal{Y}} \left[p^{T} x + q^{T} y - \psi(x, y) \right] = \max_{x \in \mathcal{X}} \left[p^{T} x + \min_{y \in \mathcal{Y}} \sup_{f, t, u} \left\{[q - f]^{T} y - t: Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s \right\} \right] \\ = & \max_{x \in \mathcal{X}} \left[p^{T} x + \sup_{f, t, u} \left\{\min_{y \in \mathcal{Y}} \{[q - f]^{T} y\} - t: Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s \right\} \right] \\ &[\text{bySion - KakutaniTheorem; notethatYisconvexandcompact, and[q - f]^{T} y - tisconcaveinf,t,uandconvexiny}] \\ = & \max_{x \in \mathcal{X}} \left[p^{T} x + \sup_{f, t, u} \left\{\sup_{\lambda} \left\{- e^{T} \lambda : f - C^{T} \lambda = q, D^{T} \lambda = 0, \lambda \geq_{\mathbf{K}_{\mathcal{Y}}^{*}} 0 \right\} - t: Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s \right\} \right] \\ &[\text{by Conic Duality; note that Y is given by essentially strictly feasible K - representation}] \end{array}
$$

$$
\begin{array}{ll} = & \sup_{x \in \mathcal{X}, f, t, u, \lambda} \left\{\begin{array}{ccc} & D^{T} \lambda = 0 &(a) \\ p^{T} x - t - e^{T} \lambda : & f - C^{T} \lambda = q &(b) \\ & \lambda \geq_{\mathbf{K}_{\mathcal{Y}}^{*}} 0 &(c) \\ & Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s &(d) \end{array} \right.\\ = & \sup_{x, \xi, f, t, u, \lambda} \left\{\begin{array}{ccc} & D^{T} \lambda = 0 &(a) \\ & f - C^{T} \lambda = q &(b) \\ p^{T} x - t - e^{T} \lambda : & \lambda \geq_{\mathbf{K}_{\mathcal{Y}}^{*}} 0 &(c) \\ & Pf + t \Pi + Qu + Rx \leq_{\mathbf{K}} s &(d) \\ & Ax + B \xi \leq_{\mathbf{K}_{\mathcal{X}}} c &(e) \end{array} \right.\end{array}\tag{*}
$$

Now, the K-representation of X is essentially strictly feasible, so that $(e)$ admits an essentially strictly feasible solution $\bar{x}, \bar{\xi};$ note that $\bar{x} \in \mathcal{X}$ . The K-representation of ψ is essentially strictly feasible, implying that ¯x can be augmented by ${\bar{f}},{\bar{t}},$ ¯u in such a way that $(\bar{x}, \bar{f}, \bar{t}, \bar{u})$ is an essentially strictly feasible solution to $(d)$ . By the origin of the constraints $(a) \mathrm{~ - ~}(c)$ , their system, as a system of constraints on λ, is feasible for all $f, q.$ Besides this, by assumption there exists a representation $\mathbf{K}_{\mathcal{V}}^{*} = \boldsymbol{M} \times \boldsymbol{N}$ with regular come M and polyhedral cone N and $\lambda^{\prime} \in[\mathrm{int} M] \times N$ such that $\check{D}^{T} \lambda^{\prime} = 0$ . Taking into account that the system $(a) -(c)$ , considered as a system in variable $\lambda,$ , is solvable for all $f, q$ , there exists $\lambda^{\prime \prime} \in \mathbf{K}_{\mathcal{Y}^{*}}$ such that $D^{T} \lambda^{\prime \prime} = 0$ and $\bar{\bar{f}} - C^{T} \lambda^{\prime \prime} = q + C^{T} \lambda^{\prime}$ , implying that $\bar{\lambda} = \lambda^{\prime} + \lambda^{\prime \prime}$ taken together with $\bar{f}$ is an essentially strictly feasible solution to the constraints $(a) -(c)$ in variables $\lambda, f.$ . The bottom line is that the constraints $(a) -(e)$ in variables $x, \xi, f, t, u, \lambda$ form an essentially strictly feasible conic constraint. Besides this, problem (∗) by its origin is bounded. Applying to (∗) Conic Duality, we get

$$
\begin{array}{rcl} \psi_{*}(p, q) & = & \min_{\alpha, \beta, \gamma, \delta, \epsilon} \left\{\begin{array}{c} \gamma \geq_{\mathbf{K}_{\mathcal{Y}}} 0, \delta \geq_{\mathbf{K}^{*}} 0, \epsilon \geq_{\mathbf{K}_{\mathcal{X}}^{*}} 0 \\ \beta^{T} q + s^{T} \delta + c^{T} \epsilon : \mathbb{R}^{T} \delta + A^{T} \epsilon = p, B^{T} \epsilon = 0, P^{T} \delta + \beta = 0 \\ \Pi^{T} \delta = - 1, Q^{T} \delta = 0, D \alpha - C \beta + e = \gamma \end{array} \right\} \\ & = & \min_{\beta, \tau, w =(\alpha, \delta, \epsilon)} \left\{\begin{array}{c} \delta \geq_{\mathbf{K}^{*}} 0, \epsilon \geq_{\mathbf{K}_{\mathcal{X}}^{*}} 0, \tau = s^{T} \delta + c^{T} \epsilon \\ \beta^{T} q + \tau : \mathbb{R}^{T} \delta + A^{T} \epsilon = p, B^{T} \epsilon = 0, P^{T} \delta + \beta = 0 \\ \Pi^{T} \delta = - 1, Q^{T} \delta = 0, D \alpha - C \beta + e \geq_{\mathbf{K}_{\mathcal{Y}}} 0 \end{array} \right\}, \end{array}
$$

which is a desired K-representation of $\psi_{*}$

## 2.3.7.5 Illustrations

A. Our first illustration is motivated by a statistical application of saddle point optimization— near-optimal recovery of linear forms in Discrete observation scheme, see [30, Section 3.1]. Let

$$
\psi(x, y) = \ln \left(\sum_{i} e^{x_{i}} y_{i}\right): \mathcal{X} \times \mathcal{Y} \to \mathbb{R},
$$

X and Y be K-representable, and let $\mathcal{V}, \0 \ \notin \ \mathcal{V}$ , be is a compact subset of the nonnegative orthant. Because for $z > 0$

$$
\ln z = \inf_{u} ze^{u} - u - 1,
$$

for $y \geq 0$ we clearly have

$$
\begin{array}{c} \ln \left(\sum_{i} e^{x_{i}} y_{i}\right) = \inf_{u} \left[\left(\sum_{i} e^{x_{i}} y_{i}\right) e^{u} - u - 1 \right] = \inf_{f, u} \left[\sum_{i} y_{i} f_{i} - u - 1: f_{i} \geq e^{x_{i} + u} \right] \\ = \inf_{f, t, u} \left\{f^{T} u + t: f_{i} \geq e^{x_{i} + u} \forall i \& t \geq - u - 1 \right\} \end{array}
$$

The resulting representation is a K-representation, provided that the closed w.r.t. taking finite direct products and passing to the dual cone family K of regular cones contains $\mathbb{R}_{+}$ , the exponential cone

$$
\mathbb{E} = \operatorname{cl} \left\{\left[t; s; r \right]: t \geq s e^{r / s}, s > 0 \right\},
$$

and, therefore, its dual cone

$$
\mathbb{E}^{*} = \operatorname{cl} \left\{\left[\tau; \sigma; - \rho \right]: \tau > 0, \rho > 0, \sigma \geq \rho \ln(\rho / \tau) - \rho \right\}.
$$

B. Let now

$$
\psi(x, y) = \left(\sum_{i = 1}^{n} \theta_{i}^{p}(x) y_{i}\right)^{1 / p}
$$

where $p > 1, \theta_{i}(x)$ are nonnegative K-representable real-valued functions on K-representable set X , and Y is a K-representable subset of the nonnegative orthant. In this case, as is easily seen, for all $(x \in \mathcal{X}, y \in \mathcal{Y})$ it holds

$$
\psi(x, y) = \inf_{[f; t]} \left\{f^{T} y + t: t \geq 0, f \geq 0, t^{\frac{p - 1}{p}} f_{i}^{\frac{1}{p}} \geq \kappa \theta_{i}(x), i \leq n \right\} \quad[\kappa = p^{- 1}(p - 1)^{\frac{p - 1}{p}}]
$$

which can immediately be converted into K-representation, provided K contains 3D Lorentz cone $\mathbf{L}^{3} = \{x \in \mathbb{R}^{3} : x_{3} \geq \sqrt{x_{1}^{2} + x_{2}^{2}}\}$ and p is rational, see Section 2.3.5.

C. In our next example, $\mathcal{X} \subset \mathbb{R}^{m \times n}$ and $\mathcal{Y} \subset \mathbf{S}_{+}^{m}$ are nonempty convex sets, and

$$
\psi(x, y) = 2 \sqrt{\operatorname{Tr}(x^{T} yx)}: \mathcal{X} \times \mathcal{Y} \to \mathbb{R}.
$$

Taking into account that for $a \geq 0$ one has $2 \sqrt{a} = \operatorname{inf}_{s > 0}[a / s + s]$ , we have

$$
\begin{array}{rcl} \forall(x \in \mathcal{X}, y \in \mathcal{Y}): \\ \psi(x, y) & = & 2 \sqrt{\mathrm{Tr}(y[xx^{T}])} = \inf_{g} \left\{2 \sqrt{\mathrm{Tr}(yg)}: g \succeq xx^{T} \right\} \\ & = & \inf_{f, s} \left\{\mathrm{Tr}(yf) + s: s > 0, fs \succeq xx^{T} \right\} \\ & = & \inf_{f, s} \left\{\mathrm{Tr}(yf) + s: \left[\begin{array}{cc} f & x \\ \hline x^{T} & sI_{n} \end{array} \right] \succeq 0 \right\}.\end{array}
$$

The resulting representation is K-representation, provided that K contains semidefinite cones.

This is how C works in Robust Markowitz Portfolio Selection (cf, e.g., [22, 25])

$$
\min_{x \in \mathcal{X}} \max_{y \in \mathcal{Y}} \left[- r^{T} x + 2 \rho \sqrt{x^{T} yx} \right]
$$

$$
[\rho > 0]
$$

(here $x \in \mathbb{R}^{n}$ is the composition of portfolio, r is the vector of expected returns, and y is the uncertain covariance matrix of the returns). Assuming for the sake of definiteness that Y is cut of $\mathbf{S}_{+}^{n}$ by the constraints

$$
\sum_{\tau}[a_{i \tau}^{T} yb_{i \tau} + b_{i \tau}^{T} ya_{i \tau}] \preceq p_{i}, i \leq I, y_{-} \leq y \leq y_{+}
$$

(where $\leq$ for matrices acts entrywise) and applying our machinery on the top of the above semidefinite representation of $2 \sqrt{x^{T} yx}$ , the saddle point problem reduces to

$$
\min_{\begin{array}{c} x, s, \alpha_{i}, \mu_{\pm} \end{array}} \left\{\begin{array}{l} - r^{T} x + \rho \left[s + \sum_{i} \operatorname{Tr}(\alpha_{i} p_{i}) + \operatorname{Tr}(\mu_{+} y_{+} - \mu_{-} y_{-}) \right]: \\ \left[\frac{\sum_{i} \sum_{\tau}[a_{i \tau} \alpha_{i} b_{i \tau}^{T} + b_{i \tau} \alpha_{i} a_{i \tau}^{T}] + \mu_{+} - \mu_{-}}{x^{T}} \bigg | \begin{array}{c} x \\ s \end{array} \right] \succeq 0 \\ \alpha_{i} \succeq 0, i \leq I, \mu_{\pm} \geq 0, x \in \mathcal{X} \end{array} \right\}.
$$

A good exercise for the reader is to apply Symmetry in order to build semidefinite representation of the dual problem - the one of identifying the y-component of the saddle point of $[- r^{T} x + 2 \rho \sqrt{x^{T} yx}]$ . Here is the answer: assuming that X is compact set given by essentially strictly feasible K-representation $\mathcal{X} = \{x : \exists w : Ax + Bw \leq_{\mathbf{K}_{\mathcal{X}}}$ $c\}$ , the y-component of a saddle point is the y-component of an optimal solution to the problem

$$
\max_{\lambda, y, z} \left\{- c^{T} \lambda : \left[\begin{array}{ll} y & z \\ \hline z^{T} & 1 \end{array} \right] \succeq 0, y \in \mathcal{Y}, A^{T} \lambda = r + 2 \rho z, B^{T} \lambda = 0, \lambda \geq_{\mathbf{K}_{\mathcal{X}}^{*}} 0 \right\}.
$$

D. In our concluding example, K contains the products of semidefinite cones, $\mathcal{X} \ : = \ : \mathbb{R}^{m \times n}$ ， $\mathcal{Y} = \mathbf{S}_{+}^{n}$ , and

$$
\psi(x, y) = \mathrm{Tr}(x^{T} xy^{1 / 2}): \mathcal{X} \times \mathcal{Y} \to \mathbb{R}.
$$

This is a “generalized bilinear function”; in terms of item 4.c of Section 2.3.7.4.A we have $F(x) = x^{T} x, G(y) = y^{1 / 2}, \mathbf{U} = \mathbf{U}^{*} = \mathbf{S}_{+}^{n}$ , and

$$
\begin{array}{rcl} \mathrm{Epi}_{\mathbf{U}} F & := & \{(x, z): z \succeq x^{T} x\} = \left\{(x, z): \left[\begin{array}{cc} z & x^{T} \\ \hline x & I_{m} \end{array} \right] \succeq 0 \right\}, \\ \mathrm{Hypo}_{\mathbf{U}^{*}} G & := & \{(y, w): y \in \mathbf{S}_{+}^{n}, w \preceq y^{1 / 2}\} = \left\{(y, w): \exists v: \left[\begin{array}{cc} y & v \\ \hline v & I_{n} \end{array} \right] \succeq 0, v \succeq 0, w \preceq v \right\}.\end{array}
$$

With these data, the construction from item 4.c of Section 2.3.7.4.A leads straightforwardly to the following semidefinite representation of $\psi :$

$$
\psi(x, y) := \operatorname{Tr}(x^{T} xy^{1 / 2}) = \inf_{f, t, u =(z, \beta, \gamma)} \left\{\begin{array}{ll} & f \in \mathbf{S}^{n}, \beta \in \mathbb{R}^{n \times n}, \gamma \in \mathbf{S}^{n}, z \in \mathbf{S}^{n} \\ \operatorname{Tr}(fy) + t: & t = \operatorname{Tr}(\gamma), z \preceq \beta + \beta^{T} \\ & \left[\begin{array}{cc} f & \beta \\ \hline \beta^{T} & \gamma \end{array} \right] \succeq 0, \left[\begin{array}{cc} z & x^{T} \\ \hline x & I_{m} \end{array} \right] \succeq 0 \end{array} \right\}.
$$

## 2.4 More applications: Robust Linear Programming

Equipped with abilities to treat a wide variety of CQr functions and sets, we can consider now an important generic application of Conic Quadratic Programming, specifically, in the Robust Linear Programming.

## 2.4.1 Robust Linear Programming: the paradigm

Consider an LP program

$$
\min_{x} \left\{c^{T} x: Ax - b \geq 0 \right\}.\tag{LP}
$$

In real world applications, the data $c, A, b$ of $\left(\mathrm{LP} \right)$ is not always known exactly; what is typically known is a domain U in the space of data – an “uncertainty set” – which for sure contains the “actual” (unknown) data. There are cases in reality where, in spite of this data uncertainty, our decision x must satisfy the “actual” constraints, whether we know them or not. Assume, e.g., that (LP) is a model of a technological process in Chemical Industry, so that entries of x represent the amounts of different kinds of materials participating in the process. Typically the process includes a number of decomposition-recombination stages. A model of this problem must take care of natural balance restrictions: the amount of every material to be used at a particular stage cannot exceed the amount of the same material yielded by the preceding stages. In a meaningful production plan, these balance inequalities must be satisfied even though they involve coeficients afected by unavoidable uncertainty of the exact contents of the raw materials, of time-varying parameters of the technological devices, etc.

If indeed all we know about the data is that they belong to a given set U, but we still have to satisfy the actual constraints, the only way to meet the requirements is to restrict ourselves to robust feasible candidate solutions – those satisfying all possible realizations of the uncertain constraints, i.e., vectors x such that

$$
Ax - b \geq 0 \quad \forall[A; b] \text{such that} \exists c:(c, A, b) \in \mathcal{U}.\tag{2.4.1}
$$

In order to choose among these robust feasible solutions the best possible, we should decide how to “aggregate” the various realizations of the objective into a single “quality characterist $c^{\mathfrak{r}}$ . To be methodologically consistent, we use the same worst-case-oriented approach and take as an objective function $f(x)$ the maximum, over all possible realizations of the objective $c^{T} x$

$$
f(x) = \sup \{c^{T} x \mid c: \exists[A; b]:(c, A, b) \in \mathcal{U}\}.
$$

With this methodology, we can associate with our uncertain LP program (i.e., with the family

$$
\mathcal{LP}(\mathcal{U}) = \left\{\min_{x: Ax \geq b} c^{T} x |(c, A, b) \in \mathcal{U} \right\}
$$

of all usual (“certain”) LP programs with the data belonging to $\mathcal{U})$ its robust counterpart. In the latter problem we are seeking for a robust feasible solution with the smallest possible value of the “guaranteed objective” f(x). In other words, the robust counterpart of ${\mathcal{LP}}(u)$ is the optimization problem

$$
\min_{t, x} \left\{t: c^{T} x \leq t, Ax - b \geq 0 \quad \forall(c, A, b) \in \mathcal{U} \right\}.\tag{R}
$$

Note that (R) is a usual – “certain” – optimization problem, but typically it is not an LP program: the structure of (R) depends on the geometry of the uncertainty set U and can be very complicated.

As we shall see in a while, in many cases it is reasonable to specify the uncertainty set U as an ellipsoid – the image of the unit Euclidean ball under an Affine mapping – or, more generally, as a CQr set. As we shall see in a while, in this case the robust counterpart of an uncertain LP problem is (equivalent to) an explicit conic quadratic program. Thus, Robust Linear Programming with CQr uncertainty sets can be viewed as a “generic source” of conic quadratic problems.

Let us look at the robust counterpart of an uncertain LP program

$$
\left\{\min_{x} \left\{c^{T} x: a_{i}^{T} x - b_{i} \geq 0, i = 1,..., m \right\} |(c, A, b) \in \mathbf{U} \right\}
$$

in the case of a “simple” ellipsoidal uncertainty – one where the data $(a_{i}, b_{i})$ of i-th inequality constraint

$$
a_{i}^{T} x - b_{i} \geq 0,
$$

and the objective c are allowed to run independently of each other through respective ellipsoids $E_{i}, E$ . Thus, we assume that the uncertainty set is

$$
\mathcal{U} = \left\{(a_{1}, b_{1};...; a_{m}, b_{m}; c): \exists(\{u_{i}, u_{i}^{T} u_{i} \leq 1\}_{i = 0}^{m}): c = c_{*} + P_{0} u_{0}, \binom{a_{i}}{b_{i}} = \binom{a_{i}^{*}}{b_{i}^{*}} + P_{i} u^{i}, i = 1,..., m \right\},
$$

where $c_{*}, a_{i}^{*}, b_{i}^{*}$ are the “nominal data” and $P_{i} u_{i}, i = 0, 1,..., m$ , represent the data perturbations; the restrictions $u_{i}^{T} u_{i} \leq 1$ enforce these perturbations to vary in ellipsoids.

In order to realize that the robust counterpart of our uncertain LP problem is a conic quadratic program, note that x is robust feasible if and only if for every $i = 1,..., m$ we have

$$
\begin{array}{rcl} 0 & \leq & \min_{u_{i}: u_{i}^{T} u_{i} \leq 1} \left[a_{i}^{T}[u] x - b_{i}[u]: \binom{a_{i}[u]}{b_{i}[u]} = \binom{a_{i}^{*}}{b_{i}^{*}} + P_{i} u_{i} \right] \\ & = &(a_{i}^{*} x)^{T} x - b_{i}^{*} + \min_{u_{i}: u_{i}^{T} u_{i} \leq 1} u_{i}^{T} P_{i}^{T} \binom{x}{- 1} \\ & = &(a_{i}^{*})^{T} x - b_{i}^{*} - \left\| P_{i}^{T} \binom{x}{- 1} \right\|_{2} \end{array}
$$

Thus, x is robust feasible if and only if it satisfies the system of c.q.i.’s

$$
\left\| P_{i}^{T} \binom{x}{- 1} \right\|_{2} \leq[a_{i}^{*}]^{T} x - b_{i}^{*}, i = 1, \dots, m.
$$

Similarly, a pair $(x, t)$ satisfies all realizations of the inequality $c^{T} x \leq t$ “allowed” by our ellipsoidal uncertainty set U if and only if

$$
c_{*}^{T} x + \| P_{0}^{T} x \|_{2} \leq t.
$$

Thus, the robust counterpart (R) becomes the conic quadratic program

$$
\min_{x, t} \left\{t: \| P_{0}^{T} x \|_{2} \leq - c_{*}^{T} x + t; \left\| P_{i}^{T} \binom{x}{- 1} \right\|_{2} \leq[a_{i}^{*}]^{T} x - b_{i}^{*}, i = 1,..., m \right\}\tag{RLP}
$$

## 2.4.2 Robust Linear Programming: examples

Example 1: Robust synthesis of antenna array. Consider a monochromatic transmitting antenna placed at the origin. Physics says that

1. The directional distribution of energy sent by the antenna can be described in terms of antenna’s diagram which is a complex-valued function $D(\delta)$ of a 3D direction $\delta.$ . The directional distribution of energy sent by the antenna is proportional to $| D(\delta) |^{2}$

2. When the antenna is comprised of several antenna elements with diagrams $D_{1}(\delta),..., D_{k}(\delta)$ 9 the diagram of the antenna is just the sum of the diagrams of the elements.

In a typical Antenna Design problem, we are given several antenna elements with diagrams $D_{1}(\delta),..., D_{k}(\delta)$ and are allowed to multiply these diagrams by complex weights $x_{i}$ (which in reality corresponds to modifying the output powers and shifting the phases of the elements). As a result, we can obtain, as a diagram of the array, any function of the form

$$
D(\delta) = \sum_{i = 1}^{k} x_{i} D_{i}(\delta),
$$

and our goal is to find the weights $x_{i}$ which result in a diagram as close as possible, in a prescribed sense, to a given “target diagram” $D_{*}(\delta)$

Consider an example of a planar antenna comprised of a central circle and 9 concentric rings of the same area as the circle (Fig. 2.2.(a)) in the XY -plane (“Earth’s surface”). Let the wavelength be $\lambda = 50 \mathrm{cm}$ , and the outer radius of the outer ring be 1 m (twice the wavelength).

One can easily see that the diagram of a ring $\{a \leq r \leq b\}$ in the plane XY (r is the distance from a point to the origin) as a function of a 3-dimensional direction δ depends on the altitude (the angle θ between the direction and the plane) only. The resulting function of $\theta$ turns out to be real-valued, and its analytic expression is

$$
D_{a, b}(\theta) = \frac{1}{2} \int_{a}^{b} \left[\int_{0}^{2 \pi} r \cos \left(2 \pi r \lambda^{- 1} \cos(\theta) \cos(\phi)\right) d \phi \right] dr.
$$

Fig. 2.2.(b) represents the diagrams of our 10 rings for $\lambda = 50 \mathrm{cm}$

Assume that our goal is to design an array with a real-valued diagram which should be axial symmetric with respect to the Z-axis and should be “concentrated” in the cone $\pi / 2 \geq \theta \geq $ $\pi / 2 - \pi / 12$ . In other words, our target diagram is a real-valued function $D_{*}(\theta)$ of the altitude θ with $D_{*}(\theta) = 0$ for $0 \leq \theta \leq \pi / 2 - \pi / 12$ and $D_{*}(\theta)$ somehow approaching 1 as θ approaches $\pi / 2$ . The target diagram $D_{*}(\theta)$ used in this example is given in Fig. 2.2.(c) (the dashed curve).

Finally, let us measure the discrepancy between a synthesized diagram and the target one by the Tschebyshev distance, taken along the equidistant 120-point grid of altitudes, i.e., by the

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/e932ec4f14396094632e0305304f87e2bad6004b609441fc83aab7d07f4c1c51.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/1b02e23a50e1497371e5c86611c977e3c5da1c3d15409c05ca8416877c6d518b.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/ad63b6bb9ea15b2d65294990d9451a4a09943492612a9ec7f74c2b750d8c7da4.jpg)  
(c)  
(a): 10 array elements of equal areas in the XY -plane  
the outer radius of the largest ring is 1m, the wavelength is 50cm  
(b): “building blocks” – the diagrams of the rings as functions of the altitude angle θ  
(c): the target diagram (dashed) and the synthesied diagram (solid)

Figure 2.2: Synthesis of antennae array

quantity

$$
\tau = \max_{\ell = 1, \dots, 120} \left| D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} x_{j} \underbrace{D_{r_{j - 1}, r_{j}}(\theta_{\ell})}_{D_{j}(\theta_{\ell})} \right|, \quad \theta_{\ell} = \frac{\ell \pi}{240}.
$$

Our design problem is simplified considerably by the fact that the diagrams of our “building blocks” and the target diagram are real-valued; thus, we need no complex numbers, and the problem we should finally solve is

$$
\min_{\tau \in \mathbb{R}, x \in \mathbb{R}^{10}} \left\{\tau : - \tau \leq D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} x_{j} D_{j}(\theta_{\ell}) \leq \tau, \ell = 1,..., 120 \right\}.\tag{Nom}
$$

This is a simple LP program; its optimal solution $x^{*}$ results in the diagram depicted at Fig. 2.2.(c). The uniform distance between the actual and the target diagrams is $\approx 0.0621$ (recall that the target diagram varies from 0 to 1).

Now recall that our design variables are characteristics of certain physical devices. In reality, of course, we cannot tune the devices to have precisely the optimal characteristics $x_{j}^{*};$ the best we may hope for is that the actual characteristics $x_{j}^{\mathrm{fct}}$ will coincide with the desired values $\boldsymbol{x}_{j}^{*}$ within a small margin, say, 0.1% (this is a fairly high accuracy for a physical device):

$$
x_{j}^{\mathrm{fct}} = p_{j} x_{j}^{*}, 0.999 \leq p_{j} \leq 1.001.
$$

It is natural to assume that the factors $p_{j}$ are random with the mean value equal to 1; it is perhaps not a great sin to assume that these factors are independent of each other.

Since the actual weights difer from their desired values $\boldsymbol{x}_{j}^{*}$ , the actual (random) diagram of our array of antennae will difer from the “nominal” one we see on Fig.2.1.(c). How large could

be the diference? Look at the picture:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/55d746d686fcd9cdce3efad94901291cd1833a4a4fd714ad0d12ab35a0f93492.jpg)  
“Dream and reality”: the nominal (left, solid) and an actual (right, solid) diagrams [dashed: the target diagram]

The diagram shown to the right is not even the worst case: we just have taken as $p_{j}$ a sample of 10 independent numbers distributed uniformly in [0.999, 1.001] and have plotted the diagram corresponding to $x_{j} = p_{j} x_{j}^{*}$ . Pay attention not only to the shape (completely opposite to what we need), but also to the scale: the target diagram varies from 0 to 1, and the nominal diagram (the one corresponding to the exact optimal $x_{j})$ difers from the target by no more than by 0.0621 (this is the optimal value in the “nominal” problem (Nom)). The actual diagram varies from ≈ −8 to ≈ 8, and its uniform distance from the target is 7.79 (125 times the nominal optimal value!). We see that our nominal optimal design is completely meaningless: it looks as if we were trying to get the worse possible result, not the best possible one...

How could we get something better? Let us try to apply the Robust Counterpart approach. To this end we take into account from the very beginning that if we want the amplification coeficients to be certain $x_{j}$ , then the actual amplification coeficients will be $x_{j}^{\mathrm{fct}} = p_{j} x_{j}, 0.999 \leq$ $p _ { j } \leq 1 . 0 0 1 $ , and the actual discrepancies will be

$$
\delta_{\ell}(x) = D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} p_{j} x_{j} D_{j}(\theta_{\ell}).
$$

Thus, we in fact are solving an uncertain LP problem where the uncertainty afects the coeficients of the constraint matrix (those corresponding to the variables $x_{j})$ : these coeficients may vary within 0.1% margin of their nominal values.

In order to apply to our uncertain LP program the Robust Counterpart approach, we should specify the uncertainty set U. The most straightforward way is to say that our uncertainty is “an interval” one – every uncertain coeficient in a given inequality constraint may (independently of all other coeficients) vary through its own uncertainty segment “nominal value ±0.1%”. This approach, however, is too conservative: we have completely ignored the fact that our $p_{j}$ ’s are of stochastic nature and are independent of each other, so that it is highly improbable that all of them will simultaneously fluctuate in “dangerous” directions. In order to utilize the statistical independence of perturbations, let us look what happens with a particular inequality

$$
- \tau \leq \delta_{\ell}(x) \equiv D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} p_{j} x_{j} D_{j}(\theta_{\ell}) \leq \tau\tag{2.4.2}
$$

when $\boldsymbol{p}_{j}^{\cdot} \mathrm{\boldsymbol{s}}$ are random. For a fixed x, the quantity $\delta_{\ell}(x)$ is a random variable with the mean

$$
\delta_{\ell}^{*}(x) = D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} x_{j} D_{j}(\theta_{\ell})
$$

and the standard deviation

$$
\begin{array}{c} \sigma_{\ell}(x) = \sqrt{E \{(\delta_{\ell}(x) - \delta_{\ell}^{*}(x))^{2}\}} = \sqrt{\sum_{j = 1}^{10} x_{j}^{2} D_{j}^{2}(\theta_{\ell}) E \{(p_{j} - 1)^{2}\}} \leq \kappa \nu_{\ell}(x), \\ \nu_{\ell}(x) = \sqrt{\sum_{j = 1}^{10} x_{j}^{2} D_{j}^{2}(\theta_{\ell})}, \kappa = 0.001.\end{array}
$$

Thus, $^{66} a$ typical value” of $\delta_{\ell}(x)$ difers from $\delta_{\ell}^{*}(x)$ by a quantity of order of $\sigma_{\ell}(x)$ . Now let us act as an engineer which believes that a random variable difers from its mean by at most three times its standard deviation; since we are not obliged to be that concrete, let us choose a “safety parameter” ω and ignore all events which result in $| \delta_{\ell}(x) - \delta_{\ell}^{*}(x) | > \omega \nu_{\ell}(x){\}^{9)}$ . As for the remaining events – those with $| \delta_{\ell}(x) - \delta_{\ell}^{*}(x) | \le \omega \nu_{\ell}(x) -$ we take upon ourselves full responsibility. With this approach, a “reliable deterministic version” of the uncertain constraint (2.4.2) becomes the pair of inequalities

$$
\begin{array}{c} - \tau \leq \delta_{\ell}^{*}(x) - \omega \nu_{\ell}(x), \\ \delta_{\ell}^{*}(x) + \omega \nu_{\ell}(x) \leq \tau; \end{array}
$$

Replacing all uncertain inequalities in (Nom) with their “reliable deterministic versions” and recalling the definition of $\delta_{\ell}^{*}(x)$ and $\nu_{\ell}(x)$ , we end up with the optimization problem

minimize s.t.

$$
\begin{array}{rcl} \| Q_{\ell} x \|_{2} & \leq &[D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} x_{j} D_{j}(\theta_{\ell})] + \tau, \ell = 1,..., 120 \\ \| Q_{\ell} x \|_{2} & \leq & -[D_{*}(\theta_{\ell}) - \sum_{j = 1}^{10} x_{j} D_{j}(\theta_{\ell})] + \tau, \ell = 1,..., 120 \\ & &[Q_{\ell} = \omega \kappa \mathrm{Diag}(D_{1}(\theta_{\ell}), D_{2}(\theta_{\ell}),..., D_{10}(\theta_{\ell}))] \end{array}\tag{Rob}
$$

It is immediately seen that (Rob) is nothing but the robust counterpart of (Nom) corresponding to a simple ellipsoidal uncertainty, namely, the one as follows:

The only data of a constraint

$$
\sum_{j = 1}^{10} A_{\ell j} x_{j} \leq p_{\ell} \tau + q_{\ell}
$$

(all constraints in (Nom) are of this form) afected by the uncertainty are the coeficients $A_{\ell j}$ of the left hand side, and the diference $dA[\ell]$ between the vector of these coeficients and the nominal value $(D_{1}(\theta_{\ell}),..., D_{10}(\theta_{\ell}))^{\hat{T}}$ of the vector of coeficients belongs to the ellipsoid

$$
\{dA[\ell] = \omega \kappa Q_{\ell} u: u \in \mathbb{R}^{10}, u^{T} u \leq 1\}.
$$

Thus, the above “engineering reasoning” leading to (Rob) was nothing but a reasonable way to specify the uncertainty ellipsoids!

The bottom line of our “engineering reasoning” deserves to be formulated as a separate statement and to be equipped with a “reliability bound”:

Proposition 2.4.1 Consider a randomly perturbed linear constraint

$$
a_{0}(x) + \epsilon_{1} a_{1}(x) + \dots + \epsilon_{n} a_{n}(x) \geq 0,\tag{2.4.3}
$$

where $a_{j}(x)$ are deterministic Affine functions of the design vector x, and $\epsilon_{j}$ are independent random perturbations with zero means and such that $| \epsilon_{j} | \le \sigma_{j}$ . Assume that x satisfies the “reliable” version of (2.4.3), specifically, the deterministic constraint

$$
a_{0}(x) - \kappa \sqrt{\sigma_{1}^{2} a_{1}^{2}(x) + \ldots + \sigma_{n}^{2} a_{n}^{2}(x)} \geq 0\tag{2.4.4}
$$

$(\kappa ~ > ~ 0)$ Then $x$ satisfies a realization of (2.4.3) with probability at least $1 \ : -$ $\exp \{- \kappa^{2} / 2\}$

Proof. All we need is to verify the following Hoefding’s bound on probabilities of large deviations:

$Ha_{i}$ are deterministic reals and $\epsilon_{i}$ are independent random variables with zero means and such that $| \epsilon_{i} | \le \sigma_{i}$ for given deterministic $\sigma_{i},$ then for every $\kappa \geq 0$ one has

$$
p(\kappa) \equiv \mathrm{Prob} \left\{\sum_{i} \epsilon_{i} a_{i} > \kappa \underbrace{\sqrt{\sum_{i} a_{i}^{2} \sigma_{i}^{2}}}_{\sigma} \right\} \leq \exp \{- \kappa^{2} / 2\}.
$$

Verification is easy: denoting by E the expectation, for $\gamma > 0$ we have

$$
\begin{array}{rcl} \exp \{\gamma \kappa \sigma\} p(\kappa) & \leq & \mathbb{E} \left\{\exp \{\gamma \sum_{i} a_{i} \epsilon_{i}\} \right\} \\ & = & \prod_{i} \mathbb{E} \left\{\exp \{\gamma a_{i} \epsilon_{i}\} \right\} \\ & &[\mathrm{since} \epsilon_{i} \mathrm{areindependentofeachother}] \\ & = & \prod_{i} \mathbb{E} \left\{\exp \{\gamma a_{i} \epsilon_{i}\} - \sinh(\gamma a_{i} \sigma_{i}) \sigma_{i}^{- 1} \epsilon_{i} \right\} \\ & &[\mathrm{since} \mathbb{E} \{\epsilon_{i}\} = 0] \\ & \leq & \prod_{i} \max_{- \sigma_{i} \leq s_{i} \leq \sigma_{i}}[\exp \{\gamma a_{i} s_{i}\} - \sinh(\gamma a_{i} \sigma_{i}) s_{i}] \\ & = & \prod_{i} \cosh(\gamma a_{i} \sigma_{i}) = \prod_{i} \left[\sum_{k = 0}^{\infty} \frac{[\gamma^{2} a_{i}^{2} \sigma_{i}^{2}]^{k}}{(2k) !} \right] \\ & \leq & \prod_{i} \left[\sum_{k = 0}^{\infty} \frac{[\gamma^{2} a_{i}^{2} \sigma_{i}^{2}]^{k}}{2^{k} k !} \right] \\ & = & \prod_{i} \exp \{\frac{\gamma^{2} a_{i}^{2} \sigma_{i}^{2}}{2}\} \\ & = & \exp \{\gamma^{2} \sigma^{2}\}.\end{array}
$$

Thus,

$$
p(\kappa) \leq \min_{\gamma > 0} \exp \left\{\frac{\gamma^{2} \sigma^{2}}{2} - \gamma \kappa \sigma \right\} = \exp \left\{- \frac{\kappa^{2}}{2} \right\}.
$$

Now let us look what are the diagrams yielded by the Robust Counterpart approach – i.e., those given by the robust optimal solution. These diagrams are also random (neither the nominal nor the robust solution cannot be implemented exactly!). However, it turns out that they are incomparably closer to the target (and to each other) than the diagrams associated with the optimal solution to the “nominal” problem. Look at a typical “robust” diagram:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/35ae50d598f4f5d7cdf9b4189fdf03ee8f88c3784c98462116dd1564df053367.jpg)  
A “Robust” diagram. Uniform distance from the target is 0.0822. [the safety parameter for the uncertainty ellipsoids is $\omega = 1]$

With the safety parameter $\omega = 1$ , the robust optimal value is 0.0817; although it is by 30% larger than the nominal optimal value 0.0635, the robust optimal value has a definite advantage that it indeed says something reliable about the quality of actual diagrams we can obtain when implementing the robust optimal solution: in a sample of 40 realizations of the diagrams corresponding to the robust optimal solution, the uniform distances from the target were varying from 0.0814 to 0.0830.

We have built the robust optimal solution under the assumption that the “implementation errors” do not exceed 0.1%. What happens if in reality the errors are larger – say, 1%? It turns out that nothing dramatic happens: now in a sample of 40 diagrams given by the “old” robust optimal solution (afected by 10 times larger “implementation errors”) the uniform distances from the target were varying from 0.0834 to 0.116. Imagine what will happen with the nominal solution under the same circumstances...

The last issue to be addressed here is: why is the nominal solution so unstable? And why with the robust counterpart approach we were able to get a solution which is incomparably better, as far as “actual implementation” is concerned? The answer becomes clear when looking at the nominal and the robust optimal weights:

<table><tr><td>j</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr><tr><td> $x_{j}^{\text{nom}}$ </td><td>1624.4</td><td>-14701</td><td>55383</td><td>-107247</td><td>95468</td><td>19221</td><td>-138622</td><td>144870</td><td>-69303</td><td>13311</td></tr><tr><td> $x_{j}^{\text{rob}}$ </td><td>-0.3010</td><td>4.9638</td><td>-3.4252</td><td>-5.1488</td><td>6.8653</td><td>5.5140</td><td>5.3119</td><td>-7.4584</td><td>-8.9140</td><td>13.237</td></tr></table>

It turns out that the nominal problem is “ill-posed” – although its optimal solution is far away from the origin, there is a “massive” set of “nearly optimal” solutions, and among the latte ones we can choose solutions of quite moderate magnitude. Indeed, here are the optimal values obtained when we add to the constraints of (Nom) the box constraints $| x_{j} | \leq L, j = 1,..., 10 \colon$

<table><tr><td>L</td><td>1</td><td>10</td><td> $10^2$ </td><td> $10^3$ </td><td> $10^4$ </td><td> $10^5$ </td><td> $10^6$ </td><td> $10^7$ </td></tr><tr><td>Opt_Val</td><td>0.09449</td><td>0.07994</td><td>0.07358</td><td>0.06955</td><td>0.06588</td><td>0.06272</td><td>0.06215</td><td>0.06215</td></tr></table>

Since the “implementation inaccuracies” for a solution are the larger the larger the solution is, there is no surprise that our “huge” nominal solution results in a very unstable actual design. In contrast to this, the Robust Counterpart penalizes the (properly measured) magnitude of x (look at the terms $\| Q_{\ell} x \|_{2}$ in the constraints of (Rob)) and therefore yields a much more stable design. Note that this situation is typical for many applications: the nominal solution is on the boundary of the nominal feasible domain, and there are “nearly optimal” solutions to the nominal problem which are in the “deep interior” of this domain. When solving the nominal problem, we do not take any care of a reasonable tradeof between the “depth of feasibility” and the optimality: any improvement in the objective is sufficient to make the solution just marginally feasible for the nominal problem. And a solution which is only marginally feasible in the nominal problem can easily become “very infeasible” when the data are perturbed. This would not be the case for a “deeply interior” solution. With the Robust Counterpart approach, we do use certain tradeof between the “depth of feasibility” and the optimality – we are trying to find something like the “deepest feasible nearly optimal solution”; as a result, we normally gain a lot in stability; and if, as in our example, there are “deeply interior nearly optimal” solutions, we do not loose that much in optimality.

Example 2: NETLIB Case Study. NETLIB is a collection of about 100 not very large LPs, mostly of real-world origin, used as the standard benchmark for LP solvers. In the study to be described, we used this collection in order to understand how “stable” are the feasibility properties of the standard – “nominal” – optimal solutions with respect to small uncertainty in the data. To motivate the methodology of this “Case Study”, here is the constraint # 372 of the problem PILOT4 from NETLIB:

$$
\begin{array}{rcl} a^{T} x & \equiv & - 15.79081x_{826} - 8.598819x_{827} - 1.88789x_{828} - 1.362417x_{829} - 1.526049x_{830} \\ & & - 0.031883x_{849} - 28.725555x_{850} - 10.792065x_{851} - 0.19004x_{852} - 2.757176x_{853} \\ & & - 12.290832x_{854} + 717.562256x_{855} - 0.057865x_{856} - 3.785417x_{857} - 78.30661x_{858} \\ & & - 122.163055x_{859} - 6.46609x_{860} - 0.48371x_{861} - 0.615264x_{862} - 1.353783x_{863} \\ & & - 84.644257x_{864} - 122.459045x_{865} - 43.15593x_{866} - 1.712592x_{8^{7} O} - \mathrm{0.401597x}_{8^{7} I} \\ & & + x_{8^{8} O} - \mathrm{0.946049x}_{8^{9} H} - \mathrm{0.946049x}_{9^{1} I} \\ & \geq & b \equiv \mathrm{23.387405} \end{array}\tag{C}
$$

The related nonzero coordinates in the optimal solution $x^{*}$ of the problem, as reported by CPLEX (one of the best commercial LP solvers), are as follows:

$$
\begin{array}{lll} x_{826}^{*} = 255.6112787181108 & x_{827}^{*} = 6240.488912232100 & x_{828}^{*} = 3624.613324098961 \\ x_{829}^{*} = 18.20205065283259 & x_{849}^{*} = 174397.0389573037 & x_{870}^{*} = 14250.00176680900 \\ x_{871}^{*} = 25910.00731692178 & x_{880}^{*} = 104958.3199274139 \end{array}
$$

The indicated optimal solution makes (C) an equality within machine precision.

Observe that most of the coeficients in (C) are “ugly reals” like -15.79081 or -84.644257. We have all reasons to believe that coeficients of this type characterize certain technological devices/processes, and as such they could hardly be known to high accuracy. It is quite natural to assume that the “ugly coeficients” are in fact uncertain – they coincide with the “true” values of the corresponding data within accuracy of 3-4 digits, not more. The only exception is the coeficient 1 of x – it perhaps reflects the structure of the problem and is therefore exact – “certain”.

Assuming that the uncertain entries of a are, say, 0.1%-accurate approximations of unknown entries of the “true” vector of coeficients ${\tilde{a}},$ we looked what would be the efect of this uncertainty on the validity of the “true” constraint $\tilde{a}^{T} x \ge b$ at $x^{*}$ . Here is what we have found:

- The minimum (over all vectors of coeficients ˜a compatible with our “0.1%-uncertainty hypothesis”) value of $\tilde{a}^{T} x^{*} - b, \mathrm{is} < - 104.9;$ in other words, the violation of the constraint can be as large as 450% of the right hand side!

- Treating the above worst-case violation as “too pessimistic” (why should the true values of all uncertain coeficients difer from the values indicated in (C) in the “most dangerous” way?), consider a more realistic measure of violation. Specifically, assume that the true values of the uncertain coeficients in (C) are obtained from the “nominal values” (those shown in (C)) by random perturbations $a_{j} \mapsto \tilde{a}_{j} =(1 + \xi_{j}) a_{j}$ with independent and, say, uniformly distributed on $[- 0.001, 0.001]$ “relative perturbations” $\xi_{j}$ . What will be a “typical” relative violation

$$
V = \frac{\max[b - \tilde{a}^{T} x^{*}, 0]}{b} \times 100
$$

of the “true” (now random) constraint $\tilde{a}^{T} x \ge b$ at $x^{\ast} ?$ The answer is nearly as bad as for the worst scenario:

<table><tr><td>Prob{V&gt;0}</td><td>Prob{V&gt;150%}</td><td>Mean(V)</td></tr><tr><td>0.50</td><td>0.18</td><td>125%</td></tr></table>

Table 2.1. Relative violation of constraint $\#$ 372 in PILOT4  
(1,000-element sample of 0.1% perturbations of the uncertain data)

We see that quite small (just 0.1%) perturbations of “obviously uncertain” data coeficients can make the “nominal” optimal solution $x^{*}$ heavily infeasible and thus – practically meaningless.

Inspired by this preliminary experiment, we have carried out the “diagnosis” and the “treatment” phases as follows.

“Diagnosis”. Given a “perturbation level” $\epsilon$ (for which we have used the values 1%, 0.1%, 0.01%), for every one of the NETLIB problems, we have measured its “stability index” at this perturbation level, specifically, as follows.

1. We computed the optimal solution $x^{*}$ of the program by CPLEX.

2. For every one of the inequality constraints

$$
a^{T} x \leq b
$$

of the program,

- We looked at the right hand side coeficients $a_{j}$ and split them into “certain” – those which can be represented, within machine accuracy, as rational fractions $p / q$ with $| q | \le 100$ , and “uncertain” – all the rest. Let J be the set of all uncertain coeficients of the constraint under consideration.

- We defined the reliability index of the constraint as the quantity

$$
\frac{a^{T}x^{*} + \epsilon\sqrt{\sum_{j\in J}a_{j}^{2}(x_{j}^{*})^{2}} - b}{\max[1,|b|]}\times 100\%\tag{I}
$$

Note that the quantity $\epsilon \sqrt{\sum_{j \in J} a_{j}^{2}(x_{j}^{*})^{2}}$ , as we remember from the Antenna story, is of order of typical diference between $a^{T} x^{*}$ and $\tilde{a}^{T} x^{*}$ , where ˜a is obtained from a by random perturbation $a_{j} \mapsto \tilde{a}_{j} = p_{j} a_{j}$ of uncertain coeficients, with independent random $p_{j}$ uniformly distributed in the segment $[- \epsilon, \epsilon]$ . In other words, the reliability index is of order of typical violation (measured in percents of the right hand side) of the constraint, as evaluated at $x^{*}$ , under independent random perturbations of uncertain coeficients, $\epsilon$ being the relative magnitude of the perturbations.

<table><tr><td rowspan="2">Problem</td><td rowspan="2"> $Size^{a)}$ </td><td colspan="2"> $\epsilon=0.01\%$ </td><td colspan="2"> $\epsilon=0.1\%$ </td><td colspan="2"> $\epsilon=1\%$ </td></tr><tr><td> $Nbad^{b)}$ </td><td> $Index^{c)}$ </td><td>Nbad</td><td>Index</td><td>Nbad</td><td>Index</td></tr><tr><td>80BAU3B</td><td>2263×9799</td><td>37</td><td>84</td><td>177</td><td>842</td><td>364</td><td>8,420</td></tr><tr><td>25FV47</td><td>822×1571</td><td>14</td><td>16</td><td>28</td><td>162</td><td>35</td><td>1,620</td></tr><tr><td>ADLITTLE</td><td>57×97</td><td></td><td></td><td>2</td><td>6</td><td>7</td><td>58</td></tr><tr><td>AFIRO</td><td>28×32</td><td></td><td></td><td>1</td><td>5</td><td>2</td><td>50</td></tr><tr><td>BNL2</td><td>2325×3489</td><td></td><td></td><td></td><td></td><td>24</td><td>34</td></tr><tr><td>BRANDY</td><td>221×249</td><td></td><td></td><td></td><td></td><td>1</td><td>5</td></tr><tr><td>CAPRI</td><td>272×353</td><td></td><td></td><td>10</td><td>39</td><td>14</td><td>390</td></tr><tr><td>CYCLE</td><td>1904×2857</td><td>2</td><td>110</td><td>5</td><td>1,100</td><td>6</td><td>11,000</td></tr><tr><td>D2Q06C</td><td>2172×5167</td><td>107</td><td>1,150</td><td>134</td><td>11,500</td><td>168</td><td>115,000</td></tr><tr><td>E226</td><td>224×282</td><td></td><td></td><td></td><td></td><td>2</td><td>15</td></tr><tr><td>FFFFFF800</td><td>525×854</td><td></td><td></td><td></td><td></td><td>6</td><td>8</td></tr><tr><td>FINNIS</td><td>498×614</td><td>12</td><td>10</td><td>63</td><td>104</td><td>97</td><td>1,040</td></tr><tr><td>GREENBEA</td><td>2393×5405</td><td>13</td><td>116</td><td>30</td><td>1,160</td><td>37</td><td>11,600</td></tr><tr><td>KB2</td><td>44×41</td><td>5</td><td>27</td><td>6</td><td>268</td><td>10</td><td>2,680</td></tr><tr><td>MAROS</td><td>847×1443</td><td>3</td><td>6</td><td>38</td><td>57</td><td>73</td><td>566</td></tr><tr><td>NESM</td><td>751×2923</td><td></td><td></td><td></td><td></td><td>37</td><td>20</td></tr><tr><td>PEROLD</td><td>626×1376</td><td>6</td><td>34</td><td>26</td><td>339</td><td>58</td><td>3,390</td></tr><tr><td>PILOT</td><td>1442×3652</td><td>16</td><td>50</td><td>185</td><td>498</td><td>379</td><td>4,980</td></tr><tr><td>PILOT4</td><td>411×1000</td><td>42</td><td>210,000</td><td>63</td><td>2,100,000</td><td>75</td><td>21,000,000</td></tr><tr><td>PILOT87</td><td>2031×4883</td><td>86</td><td>130</td><td>433</td><td>1,300</td><td>990</td><td>13,000</td></tr><tr><td>PILOTJA</td><td>941×1988</td><td>4</td><td>46</td><td>20</td><td>463</td><td>59</td><td>4,630</td></tr><tr><td>PILOTNOV</td><td>976×2172</td><td>4</td><td>69</td><td>13</td><td>694</td><td>47</td><td>6,940</td></tr><tr><td>PILOTWE</td><td>723×2789</td><td>61</td><td>12,200</td><td>69</td><td>122,000</td><td>69</td><td>1,220,000</td></tr><tr><td>SCFXM1</td><td>331×457</td><td>1</td><td>95</td><td>3</td><td>946</td><td>11</td><td>9,460</td></tr><tr><td>SCFXM2</td><td>661×914</td><td>2</td><td>95</td><td>6</td><td>946</td><td>21</td><td>9,460</td></tr><tr><td>SCFXM3</td><td>991×1371</td><td>3</td><td>95</td><td>9</td><td>946</td><td>32</td><td>9,460</td></tr><tr><td>SHARE1B</td><td>118×225</td><td>1</td><td>257</td><td>1</td><td>2,570</td><td>1</td><td>25,700</td></tr></table>

Table 2.2. Bad NETLIB problems.  
<sup>a)</sup> # of linear constraints (excluding the box ones) plus 1 and # of variables  
<sup>b)</sup> # of constraints with index > 5%  
<sup>c)</sup> The worst, over the constraints, reliability index, in %

3. We treat the nominal solution as unreliable, and the problem - as bad, the level of perturbations being $\epsilon$, if the worst, over the inequality constraints, reliability index of the constraint is worse than 5%.

The results of the Diagnosis phase of our Case Study were as follows. From the total of 90 NETLIB problems we have processed,

- in 27 problems the nominal solution turned out to be unreliable at the largest ($\epsilon$ = 1%) level of uncertainty;

- 19 of these 27 problems are already bad at the 0.01%-level of uncertainty, and in 13 of these 19 problems, 0.01% perturbations of the uncertain data can make the nominal solution more than 50%-infeasible for some of the constraints.

The details are given in Table 2.2. Our diagnosis leads to the following conclusion:

♦ In real-world applications of Linear Programming one cannot ignore the possibility that a small uncertainty in the data (intrinsic for most real-world LP programs) can make the usual optimal solution of the problem completely meaningless from a

practical viewpoint.

Consequently,

$\diamondsuit$ In applications of LP, there exists a real need of a technique capable of detecting cases when data uncertainty can heavily afect the quality of the nominal solution, and in these cases to generate a “reliable” solution, one which is immune against uncertainty.

“Treatment”. At the treatment phase of our Case Study, we used the Robust Counterpart methodology, as outlined in Example 1, to pass from “unreliable” nominal solutions of bad NETLIB problems to “uncertainty-immunized” robust solutions. The primary goals here were to understand whether “treatment” is at all possible (the Robust Counterpart may happen to be infeasible) and how “costly” it is – by which margin the robust solution is worse, in terms of the objective, than the nominal solution. The answers to both these questions turned out to be quite encouraging:

- Reliable solutions do exist, except for the four cases corresponding to the highest $(\epsilon = 1 \%)$ uncertainty level (see the right column in Table 2.3).

- The price of immunization in terms of the objective value is surprisingly low: when $\epsilon \leq$ 0.1%, it never exceeds 1% and it is less than 0.1% in 13 of 23 cases. Thus, passing to the robust solutions, we gain a lot in the ability of the solution to withstand data uncertainty, while losing nearly nothing in optimality.

The details are given in Table 2.3.

## 2.4.3 Robust counterpart of uncertain LP with a CQr uncertainty set

We have seen that the robust counterpart of uncertain LP with simple “constraint-wise” ellipsoidal uncertainty is a conic quadratic problem. This fact is a special case of the following

Proposition 2.4.2 Consider an uncertain LP

$$
\mathcal{LP}(\mathcal{U}) = \left\{\min_{x: Ax \geq b} c^{T} x:(c, A, b) \in \mathcal{U} \right\}
$$

and assume that the uncertainty set $\mathcal{U}$ is $CQr.$

$$
\mathcal{U} = \left\{\zeta =(c, A, B) \in \mathbb{R}^{n} \times \mathbb{R}^{m \times n} \times \mathbb{R}^{m}: \exists u: \mathcal{A}(\zeta, u) \equiv P \zeta + Qu + r \geq_{\mathbf{K}} 0 \right\},
$$

where $\mathcal{A}(\zeta, u)$ is an Affine mapping and $\mathbf{K} \in{\mathcal{S}}{\mathcal{O}}$ . Assume, further, that the above CQR of U is essentially strictly feasible, see Definition $1.4.3.$ Then the robust counterpart of ${\mathcal{LP}}(u)$ is equivalent to an explicit conic quadratic problem.

Proof. Introducing an additional variable t and denoting by $z =(t, x)$ the extended vector of design variables, we can write down the instances of our uncertain LP in the form

$$
\min_{z} \left\{d^{T} z: \alpha_{i}^{T}(\zeta) z - \beta_{i}(\zeta) \geq 0, i = 1,..., m + 1 \right\}\tag{\(\mathrm{(LP}[\zeta])\}
$$

with an appropriate vector $d;$ here the functions

$$
\alpha_{i}(\zeta) = A_{i} \zeta + a_{i}, \quad \beta_{i}(\zeta) = b_{i}^{T} \zeta + c_{i}
$$

<table><tr><td rowspan="2">Problem</td><td rowspan="2">Nominal optimal value</td><td colspan="3">Objective at robust solution</td></tr><tr><td> $\epsilon = 0.01\%$ </td><td> $\epsilon = 0.1\%$ </td><td> $\epsilon = 1\%$ </td></tr><tr><td>80BAU3B</td><td>987224.2</td><td>987311.8 (+ 0.01%)</td><td>989084.7 (+ 0.19%)</td><td>1009229 (+ 2.23%)</td></tr><tr><td>25FV47</td><td>5501.846</td><td>5501.862 (+ 0.00%)</td><td>5502.191 (+ 0.01%)</td><td>5505.653 (+ 0.07%)</td></tr><tr><td>ADLITTLE</td><td>225495.0</td><td></td><td>225594.2 (+ 0.04%)</td><td>228061.3 (+ 1.14%)</td></tr><tr><td>AFIRO</td><td>-464.7531</td><td></td><td>-464.7500 (+ 0.00%)</td><td>-464.2613 (+ 0.11%)</td></tr><tr><td>BNL2</td><td>1811.237</td><td></td><td>1811.237 (+ 0.00%)</td><td>1811.338 (+ 0.01%)</td></tr><tr><td>BRANDY</td><td>1518.511</td><td></td><td></td><td>1518.581 (+ 0.00%)</td></tr><tr><td>CAPRI</td><td>1912.621</td><td></td><td>1912.738 (+ 0.01%)</td><td>1913.958 (+ 0.07%)</td></tr><tr><td>CYCLE</td><td>1913.958</td><td>1913.958 (+ 0.00%)</td><td>1913.958 (+ 0.00%)</td><td>1913.958 (+ 0.00%)</td></tr><tr><td>D2Q06C</td><td>122784.2</td><td>122793.1 (+ 0.01%)</td><td>122893.8 (+ 0.09%)</td><td>Infeasible</td></tr><tr><td>E226</td><td>-18.75193</td><td></td><td></td><td>-18.75173 (+ 0.00%)</td></tr><tr><td>FFFFFF800</td><td>555679.6</td><td></td><td></td><td>555715.2 (+ 0.01%)</td></tr><tr><td>FINNIS</td><td>172791.1</td><td>172808.8 (+ 0.01%)</td><td>173269.4 (+ 0.28%)</td><td>178448.7 (+ 3.27%)</td></tr><tr><td>GREENBEA</td><td>-72555250</td><td>-72526140 (+ 0.04%)</td><td>-72192920 (+ 0.50%)</td><td>-68869430 (+ 5.08%)</td></tr><tr><td>KB2</td><td>-1749.900</td><td>-1749.877 (+ 0.00%)</td><td>-1749.638 (+ 0.01%)</td><td>-1746.613 (+ 0.19%)</td></tr><tr><td>MAROS</td><td>-58063.74</td><td>-58063.45 (+ 0.00%)</td><td>-58011.14 (+ 0.09%)</td><td>-57312.23 (+ 1.29%)</td></tr><tr><td>NESM</td><td>14076040</td><td></td><td></td><td>14172030 (+ 0.68%)</td></tr><tr><td>PEROLD</td><td>-9380.755</td><td>-9380.755 (+ 0.00%)</td><td>-9362.653 (+ 0.19%)</td><td>Infeasible</td></tr><tr><td>PILOT</td><td>-557.4875</td><td>-557.4538 (+ 0.01%)</td><td>-555.3021 (+ 0.39%)</td><td>Infeasible</td></tr><tr><td>PILOT4</td><td>-64195.51</td><td>-64149.13 (+ 0.07%)</td><td>-63584.16 (+ 0.95%)</td><td>-58113.67 (+ 9.47%)</td></tr><tr><td>PILOT87</td><td>301.7109</td><td>301.7188 (+ 0.00%)</td><td>302.2191 (+ 0.17%)</td><td>Infeasible</td></tr><tr><td>PILOTJA</td><td>-6113.136</td><td>-6113.059 (+ 0.00%)</td><td>-6104.153 (+ 0.15%)</td><td>-5943.937 (+ 2.77%)</td></tr><tr><td>PILOTNOV</td><td>-4497.276</td><td>-4496.421 (+ 0.02%)</td><td>-4488.072 (+ 0.20%)</td><td>-4405.665 (+ 2.04%)</td></tr><tr><td>PILOTWE</td><td>-2720108</td><td>-2719502 (+ 0.02%)</td><td>-2713356 (+ 0.25%)</td><td>-2651786 (+ 2.51%)</td></tr><tr><td>SCFXM1</td><td>18416.76</td><td>18417.09 (+ 0.00%)</td><td>18420.66 (+ 0.02%)</td><td>18470.51 (+ 0.29%)</td></tr><tr><td>SCFXM2</td><td>36660.26</td><td>36660.82 (+ 0.00%)</td><td>36666.86 (+ 0.02%)</td><td>36764.43 (+ 0.28%)</td></tr><tr><td>SCFXM3</td><td>54901.25</td><td>54902.03 (+ 0.00%)</td><td>54910.49 (+ 0.02%)</td><td>55055.51 (+ 0.28%)</td></tr><tr><td>SHARE1B</td><td>-76589.32</td><td>-76589.32 (+ 0.00%)</td><td>-76589.32 (+ 0.00%)</td><td>-76589.29 (+ 0.00%)</td></tr></table>

Table 2.3. Objective values for nominal and robust solutions to bad NETLIB problems

are Affine in the data vector ζ. The robust counterpart of our uncertain LP is the optimization program

$$
\min_{z} \left\{d^{T} z \to \min: \alpha_{i}^{T}(\zeta) z - \beta_{i}(\zeta) \geq 0 \quad \forall \zeta \in \mathcal{U} \forall i = 1, \dots, m + 1 \right\}.\tag{\((\mathrm{RC}_{\mathrm{ini}})\}
$$

Let us fix i and ask ourselves what does it mean that a vector z satisfies the infinite system of linear inequalities

$$
\alpha_{i}^{T}(\zeta) z - \beta_{i}(\zeta) \geq 0 \quad \forall \zeta \in \mathcal{U}.\tag{\((C_{i})\}
$$

Clearly, a given vector z possesses this property if and only if the optimal value in the optimization program

$$
\min_{\tau, \zeta} \left\{\tau : \tau \geq \alpha_{i}^{T}(\zeta) z - \beta_{i}(\zeta), \zeta \in \mathcal{U} \right\}
$$

is nonnegative. Recalling the definition of $\mathcal{U},$ , we see that the latter problem is equivalent to the conic quadratic program

$$
\min_{\tau, \zeta} \left\{\tau : \tau \geq \alpha_{i}^{T}(\zeta) z - \beta_{i}(\zeta) \equiv[\underbrace{A_{i} \zeta + a_{i}}_{\alpha_{i}(\zeta)}]^{T} z -[\underbrace{b_{i}^{T} \zeta + c_{i}}_{\beta_{i}(\zeta)}], \mathcal{A}(\zeta, u) \equiv P \zeta + Qu + r \geq_{\mathbf{K}} 0 \right\}\tag{\((\mathrm{CQ}_i[z])\}
$$

in variables $\tau, \zeta, u$ . Thus, z satisfies $\left(\mathrm{C}_{i} \right)$ if and only if the optimal value in $\left(\mathrm{CQ}_{i}[z] \right)$ is nonnegative.

Since by assumption the system of conic quadratic inequalities $\mathcal{A}(\zeta, u) \ge_{\bf K} \0$ is essentially strictly feasible, the conic quadratic program $\left(\mathrm{CQ}_{i}[z] \right)$ is essentially strictly feasible. By the refined Conic Duality Theorem, if (a) the optimal value in $\left(\mathrm{CQ}_{i}[z] \right)$ is nonnegative, then (b) the dual to $\left(\mathrm{CQ}_{i}[z] \right)$ problem admits a feasible solution with a nonnegative value of the dual objective. By Weak Duality, (b) implies (a). Thus, the fact that the optimal value in $\left(\mathrm{CQ}_{i}[z] \right)$ is nonnegative is equivalent to the fact that the dual problem admits a feasible solution with a nonnegative value of the dual objective:

$$
\left\{\begin{array}{c} z \text{satisfies}(\mathrm{C}_{i}) \\ \Updownarrow \\ \operatorname{Opt}(\mathrm{CQ}_{i}[z]) \geq 0 \\ \Updownarrow \\ \exists \lambda \in \mathbb{R}, \xi \in \mathbb{R}^{N}(N \text{is the dimension of} \mathbf{K}): \\ \lambda[a_{i}^{T} z - c_{i}] - \xi^{T} r \geq 0, \\ \lambda = 1, \\ - \lambda A_{i}^{T} z + b_{i} + P^{T} \xi = 0, \\ Q^{T} \xi = 0, \\ \lambda \geq 0, \\ \xi \geq_{\mathbf{K}} 0.\\ \Updownarrow \\ \left\{\begin{array}{l} \exists \xi \in \mathbb{R}^{N}: \\ a_{i}^{T} z - c_{i} - \xi^{T} r \geq 0 \\ - A_{i}^{T} z + b_{i} + P^{T} \xi = 0, \\ Q^{T} \xi = 0, \\ \xi \geq_{\mathbf{K}} 0.\end{array} \right.\end{array} \right.
$$

We see that the set of vectors z satisfying (C<sub>i</sub>) is CQr:

$$
\begin{array}{c} z \text{satisfies}(\mathrm{C}_{i}) \\ \Updownarrow \\ \left\{\begin{array}{c} \exists \xi \in \mathbb{R}^{N}: \\ a_{i}^{T} z - c_{i} - \xi^{T} r \geq 0, \\ - A_{i}^{T} z + b_{i} + P^{T} \xi = 0, \\ Q^{T} \xi = 0, \\ \xi \geq_{\mathbf{K}} 0.\end{array} \right.\end{array}
$$

Consequently, the set of robust feasible z – those satisfying $\left(\mathrm{C}_{i} \right)$ for all $i = 1,..., m + 1 -$ is CQr (as the intersection of finitely many CQr sets), whence the robust counterpart of our uncertain LP, being the problem of minimizing a linear objective over a CQr set, is equivalent to a conic quadratic problem. Here is this problem:

$$
\begin{array}{c} \text{minimize} d^{T} z \\ \left\{\begin{array}{c} a_{i}^{T} z - c_{i} - \xi_{i}^{T} r \geq 0, \\ - A_{i}^{T} z + b_{i} + P^{T} \xi_{i} = 0, \\ Q^{T} \xi_{i} = 0, \\ \xi_{i} \geq_{\mathbf{K}} 0 \end{array}, i = 1,..., m + 1 \right.\end{array}
$$

with design variables $z, \xi_{1},..., \xi_{m + 1}$ . Here $A_{i}, a_{i}, c_{i}, b_{i}$ come from the Affine functions $\alpha_{i}(\zeta) =$ $A_{i} \zeta + a_{i}$ and $\beta_{i}(\zeta) = b_{i}^{T} \zeta + c_{i}$ , while $P, Q, r$ come from the description of $\mathcal{U} \mathrm{:}$

$$
\mathcal{U} = \{\zeta : \exists u: P \zeta + Qu + r \ge_{\bf K} 0\}.
$$

Remark 2.4.1 Looking at the proof of Proposition 2.4.2, we see that the assumption that the uncertainty set U is CQr plays no crucial role. What indeed is important is that U is the projection on the ζ-space of the solution set of an essentially strictly feasible conic inequality associated with certain cone K. Whenever this is the case, the above construction demonstrates that the robust counterpart of ${\mathcal{LP}}(u)$ is a conic problem associated with the cone which is a direct product of several cones dual to K. $\mathrm{E.g.}$ , when the uncertainty set is polyhedral (i.e., it is given by finitely many scalar linear inequalities: ${\bf K} ={\bf R}_{+}^{m})$ , the robust counterpart of ${\mathcal{LP}}(u)$ is an explicit LP program (and in this case we can eliminate the assumption that the conic inequality defining U is essentially strictly feasible (why?)). Consider, e.g., an uncertain LP with interval uncertainty in the data:

$$
\left\{\begin{array}{ll} & | c_{j} - c_{j}^{*} | \leq \epsilon_{j}, j = 1,..., n \\ \min_{x} \left\{c^{T} x: Ax \geq b \right\}: & A_{ij} \in[A_{ij}^{*} - \epsilon_{ij}, A_{ij}^{*} + \epsilon_{ij}], i = 1,..., m, j = 1,..., n \\ & | b_{i} - b_{i}^{*} | \leq \delta_{i}, i = 1,..., m \end{array} \right\}.
$$

The (LP equivalent of the) Robust Counterpart of the program is

$$
\min_{x, y} \left\{\sum_{j}[c_{j}^{*} x_{j} + \epsilon_{j} y_{j}]: \begin{array}{l} \sum_{j} A_{ij}^{*} x_{j} - \sum_{j} \epsilon_{ij} y_{j} \geq b_{i}^{*} + \delta_{i}, i = 1,..., m \\ - y_{j} \leq x_{j} \leq y_{j}, j = 1,..., n \end{array} \right\}
$$

(why ?)

## 2.4.4 CQ-representability of the optimal value in a CQ program as a function of the data

Let us ask ourselves the following question: consider a conic quadratic program

$$
\min_{x} \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\},\tag{P}
$$

direct product of ice-cream cones; the dual of our problem is

$$
\max_{\lambda} \left\{b^{T} \lambda : A^{T} \lambda = c, \lambda \geq_{\mathbf{K}} 0 \right\}\tag{D}
$$

The optimal value of (P ) clearly is a function of the data $(c, A, b)$ of the problem. What can be said about CQ-representability of this function? In general, not much: the function is not even convex. There are, however, two modifications of our question which admit good answers. Namely, under mild regularity assumptions

(a) With $c, A$ fixed, the optimal value in (P ) is a CQ-representable function of the right hand side vector $b;$

(b) with A, b fixed, the minus optimal value in (P ) is a CQ-representable function of c. Here are the exact forms of our claims:

Proposition 2.4.3 Let $c, A$ be fixed, (D) be essentially strictly feasible (this property is independent of what b is). and let B Then the optimal value of (P ) is a CQr function of b.

The statement is quite evident: since (D) is essentially strictly feasible, for every b the optimal value $\mathrm{Opt}(b)$ is either +∞, or is achieved (by refined Conic Duality Theorem); therefore in both cases,

$$
\{t \geq \operatorname{Opt}(b)\} \Leftrightarrow \{\exists x: c^{T} x \leq t \& Ax - b \geq_{\mathbf{K}} 0\}
$$

this equivalence is nothing but a CQR of $\mathrm{Opt}(b)$

## Similarly, the exact form of (b) reads

Proposition 2.4.4 Let A, b be such that (P ) is essentially strictly feasible (this property of (P ) is independent of what c is). Then the minus optimal value $- \mathrm{Opt}(c)$ of (P ) is a CQr function $ofc.$

Proof is obtained from the previous one by swapping (P ) and (D): since (P ) is essentially strictly feasible, by refined Conic Duality Theorem for every c either $\mathrm{Opt}(c) = - \infty$ (which happens if and only if (D) is infeasible), or is equal to the optimal vale in the (solvable in the case in question) problem (D). Therefore in both cases

$$
\{t \leq \mathrm{Opt}(c)\} \Leftrightarrow \{\exists \lambda : A^{T} \lambda = c, b^{T} \lambda \geq t, \lambda \geq_{\mathbf{K}} 0\}
$$

and this equivalence is nothing but a CQR of $- \mathrm{Opt}(c)$

A careful reader could have realized that Proposition 2.4.2 is nothing but a straightforward application of Proposition 2.4.4.

Remark 2.4.2 Same as Proposition 2.4.2, Propositions $\it{2.4.3, 2.4.4}$ can be extended from conic quadratic problems to general conic problems on regular cones, with the only modification that the conic constraint $\lambda \ge_{\bf K} 0$ in (D) in the general case becomes $\lambda \ge_{\mathbf{K}_{\ast}} 0 /$

## 2.4.5 Afinely Adjustable Robust Counterpart

The rationale behind our Robust Optimization paradigm is based on the following tacit assumptions:

1. All constraints are “a must”, so that a meaningful solution should satisfy all realizations of the constraints from the uncertainty set.

2. All decisions are made in advance and thus cannot tune themselves to the “true” values of the data. Thus, candidate solutions must be fixed vectors, and not functions of the true data.

Here we preserve the first of these two assumptions and try to relax the second of them. The motivation is twofold:

- There are situations in dynamical decision-making when the decisions should be made at subsequent time instants, and decision made at instant t in principle can depend on the part of uncertain data which becomes known at this instant.

- There are situations in LP when some of the decision variables do not correspond to actual decisions; they are artificial “analysis variables” added to the problem in order to convert it to a desired form, say, a Linear Programming one. The analysis variables clearly may adjust themselves to the true values of the data.

To give an example, consider the problem where we look for the best, in the discrete $L_{1^{-}}$ norm, approximation of a given sequence b by a linear combination of given sequences $a_{j}$ $j = 1,..., n,$ , so that the problem with no data uncertainty is

$$
\min_{x,t}\left\{t:\sum_{t = 1}^{T}|b_{t} - \sum_{j}a_{tj}x_{j}|\leq t\right\}\tag{P}
$$

$$
\min_{t, x, y} \left\{t: \sum_{t = 1}^{T} y_{t} \leq t, - y_{t} \leq b_{t} - \sum_{j} a_{tj} x_{j} \leq y_{t}, 1 \leq t \leq T \right\}\tag{LP}
$$

Note that (LP) is an equivalent LP reformulation of (P), and y are typical analysis variables; whether x’s do or do not represent “actual decisions”, y’s definitely do not represent them. Now assume that the data become uncertain. Perhaps we have reasons to require from (t, x)s to be independent of actual data and to satisfy the constraint in (P) for all realizations of the data. This requirement means that the variables t, x in (LP) must be data-independent, but we have absolutely no reason to insist on data-independence of $y ' s \mathrm{:}$ (t, x) is robust feasible for (P) if and only if (t, x), for all realizations of the data from the uncertainty set, can be extended, by a properly chosen and perhaps depending on the data vector $y,$ to a feasible solution of (the corresponding realization of) (LP). In other words, equivalence between (P) and (LP) is restricted to the case of certain data only; when the data become uncertain, the robust counterpart of (LP) is more conservative than the one of (P).

In order to take into account a possibility for (part of) the variables to adjust themselves to the true values of (part of) the data, we could act as follows.

Adjustable and non-adjustable decision variables. Consider an uncertain LP program. Without loss of generality, we may assume that the data are afinely parameterized by properly chosen “perturbation vector” ζ running through a given perturbation set $\mathcal{Z};$ thus, our uncertain $\mathrm{LP}$ can be represented as the family of $\mathrm{LP}$ instances

$$
\mathcal{LP} = \left\{\min_{x} \left\{c^{T}[\zeta] x: A[\zeta] x - b[\zeta] \geq 0 \right\}: \zeta \in \mathcal{Z} \right\}
$$

Now assume that decision variable $x_{j}$ is allowed to depend on part of the true data. Since the true data are Affine functions of $\zeta,$ this is the same as to assume that $x_{j}$ can depend on “a part” $P_{j} \zeta$ of the perturbation vector, where $P_{j}$ is a given matrix. The case of $P_{j} = 0$ correspond to “here and now” decisions $x_{j} -$ those which should be done in advance; we shall call these decision variables non-adjustable. The case of nonzero $P_{j} ~(^{\ast}{a d} justable$ decision variable”) corresponds to allowing certain dependence of $x_{j}$ on the data, and the case when $P_{j}$ has trivial kernel means that $x_{j}$ is allowed to depend on the entire true data.

Adjustable Robust Counterpart of LP. With our assumptions, a natural modification of the Robust Optimization methodology results in the following adjustable Robust Counterpart of $\mathcal{L} \mathcal{P}$

$$
\min_{t, \{\phi_{j}(\cdot)\}_{j = 1}^{n}} \left\{t: \begin{array}{l} \sum_{j = 1}^{n} c_{j}[\zeta] \phi_{j}(P_{j} \zeta) \leq t \forall \zeta \in \mathcal{Z} \\ \sum_{j = 1}^{n} \phi_{j}(P_{j} \zeta) A_{j}[\zeta] - b[\zeta] \geq 0 \forall \zeta \in \mathcal{Z} \end{array} \right\}\tag{ARC}
$$

Here $c_{j}[\zeta]$ is j-th entry of the objective vector, and $A_{j}[\zeta]$ is j-th column of the constraint matrix.

It should be stressed that the variables in (ARC) corresponding to adjustable decision variables in the original problem are not reals; they are “decision rules” – real-valued functions of the corresponding portion $P_{j} \zeta$ of the data. This fact makes (ARC) infinite-dimensional optimization problem and thus problem which is extremely dificult for numerical processing. Indeed, in general it is unclear how to represent in a tractable way a general-type function of three (not speaking of three hundred) variables; and how could we hope to find, in an efficient manner, optimal decision rules when we even do not know how to write them down? Thus, in general (ARC) has no actual meaning – basically all we can do with the problem is to write it down on paper and then look at it...

## 2.4.5.1 Afinely Adjustable Robust Counterpart of $\mathcal{L} \mathcal{P}$

A natural way to overcome the outlined dificulty is to restrict the decision rules to be “easily representable”, specifically, to be Affine functions of the allowed portions of data:

$$
\phi_{j}(P_{j} \zeta) = \mu_{j} + \nu_{j}^{T} P_{j} \zeta.
$$

With this approach, our new decision variables become reals $\mu_{j}$ and vectors $\nu_{j}.$ , and (ARC) becomes the following problem (called Afinely Adjustable Robust Counterpart of LP):

$$
\min_{t, \{\mu_{j}, \nu_{j}\}_{j = 1}^{n}} \left\{t: \begin{array}{ll} & \sum_{j} c_{j}[z][\mu_{j} + \nu_{j}^{T} P_{j} \zeta] \leq t \forall \zeta \in \mathcal{Z} \\ & \sum_{j}[\mu_{j} + \nu_{j}^{T} P_{j}] A_{j}[\zeta] - b[\zeta] \geq 0 \forall \zeta \in \mathcal{Z} \end{array} \right\}\tag{AARC}
$$

Note that the AARC is “in-between” the usual non-adjustable RC (no dependence of variables on the true data at all) and the ARC (arbitrary dependencies of the decision variables on the allowed portions of the true data). Note also that the only reason to restrict ourselves with Affine decision rules is the desire to end up with a “tractable” robust counterpart, and even this natural goal for the time being is not achieved. Indeed, the constraints in (AARC) are Affine in our new decision variables t, $\mu_{j}, \nu_{j}$ , which is a good news. At the same time, they are semi-infinite, same as in the case of the non-adjustable Robust Counterpart, but, in contrast to this latter case, in general are quadratic in perturbations rather than to be linear in them. This indeed makes a diference: as we know from Proposition 2.4.2, the usual – non-adjustable – RC of an uncertain LP with CQr uncertainty set is equivalent to an explicit Conic Quadratic problem and as such is computationally tractable (in fact, the latter remain true for the case of non-adjustable RC of uncertain LP with arbitrary “computationally tractable” uncertainty set). In contrast to this, AARC can become intractable for uncertainty sets as simple as boxes. There are, however, good news on AARCs:

- First, there exist a generic “good case” where the AARC is tractable. This is the “fixed recourse” case, where the coeficients of adjustable variables $x_{j}$ – those with $P_{j} \neq 0 ~ \AA^{}$ are certain (not afected by uncertainty). In this case, the left hand sides of the constraints in (AARC) are Affine in $\zeta,$ and thus AARC, same as the usual non-adjustable RC, is computationally tractable whenever the perturbation set Z is so; in particular, Proposition 2.4.2 remains valid for both RC and AARC.

- Second, we shall see in Lecture 3 that even when AARC is intractable, it still admits tight, in certain precise sense, tractable approximations.

## 2.4.5.2 Example: Uncertain Inventory Management Problem

The model. Consider a single product inventory system comprised of a warehouse and I factories. The planning horizon is T periods. At a period t:

$d_{t}$ is the demand for the product. All the demand must be satisfied;

$v(t)$ is the amount of the product in the warehouse at the beginning of the period (v(1) is given);

$p_{i}(t)$ is the i-th order of the period – the amount of the product to be produced during the period by factory i and used to satisfy the demand of the period (and, perhaps, to replenish the warehouse);

$P_{i}(t)$ is the maximal production capacity of factory $i;$

$c_{i}(t)$ is the cost of producing a unit of the product at a factory $i.$

Other parameters of the problem are:

$V_{\mathrm{min}}$ - the minimal allowed level of inventory at the warehouse;

$V_{\mathrm{max}}$ - the maximal storage capacity of the warehouse;

$Q_{i}$ - the maximal cumulative production capacity of i’th factory throughout the planning horizon.

The goal is to minimize the total production cost over all factories and the entire planning period. When all the data are certain, the problem can be modelled by the following linear program:

$$
\begin{array}{ll} \min_{p_{i}(t), v(t), F} & F \\ \text{s.t.} & \sum_{t = 1}^{T} \sum_{i = 1}^{I} c_{i}(t) p_{i}(t) \leq F \\ & 0 \leq p_{i}(t) \leq P_{i}(t), i = 1, \ldots, I, t = 1, \ldots, T \\ & \sum_{t = 1}^{T} p_{i}(t) \leq Q(i), i = 1, \ldots, I \\ & v(t + 1) = v(t) + \sum_{i = 1}^{I} p_{i}(t) - d_{t}, t = 1, \ldots, T \\ & V_{\min} \leq v(t) \leq V_{\max}, t = 2, \ldots, T + 1.\end{array}\tag{2.4.5}
$$

Eliminating v-variables, we get an inequality constrained problem:

$$
\begin{array}{ll} \min_{p_{i}(t), F} & F \\ \text{s.t.} & \sum_{t = 1}^{T} \sum_{i = 1}^{I} c_{i}(t) p_{i}(t) \leq F \\ & 0 \leq p_{i}(t) \leq P_{i}(t), i = 1, \ldots, I, t = 1, \ldots, T \\ & \sum_{t = 1}^{T} p_{i}(t) \leq Q(i), i = 1, \ldots, I \\ & V_{\min} \leq v(1) + \sum_{s = 1}^{t} \sum_{i = 1}^{I} p_{i}(s) - \sum_{s = 1}^{t} d_{s} \leq V_{\max}, t = 1, \ldots, T.\end{array}\tag{2.4.6}
$$

Assume that the decision on supplies $p_{i}(t)$ is made at the beginning of period $t,$ and that we are allowed to make these decisions on the basis of demands $d_{r}$ observed at periods $r \in I_{t}$ , where $I_{t}$ is a given subset of $\{1,..., t\}$ . Further, assume that we should specify our supply policies before the planning period starts (“at period $0^{\dag})$ ), and that when specifying these policies, we do not know exactly the future demands; all we know is that

$$
d_{t} \in[d_{t}^{*} - \theta d_{t}^{*}, d_{t}^{*} + \theta d_{t}^{*}], t = 1, \ldots, T,\tag{2.4.7}
$$

with given positive $\theta$ and positive nominal demand $d_{t}^{*}$ . We have now an uncertain LP, where the uncertain data are the actual demands $d_{t}$ , the decision variables are the supplies $p_{i}(t)$ , and these decision variables are allowed to depend on the data $\{d_{\tau} : \tau \in I_{t}\}$ which become known when $p_{i}(t)$ should be specified. Note that our uncertain LP is a “fixed recourse” one – the uncertainty afects solely the right hand side. Thus, the AARC of the problem is computationally tractable, which is good. Let us build the AARC. Restricting our decision-making policy with Affine decision rules

$$
p_{i}(t) = \pi_{i, t}^{0} + \sum_{r \in I_{t}} \pi_{i, t}^{r} d_{r},\tag{2.4.8}
$$

where the coeficients $\pi_{i, t}^{r}$ are our new non-adjustable design variables, we get from (2.4.6) the following uncertain Linear Programming problem in variables $\pi_{i, t}^{s}, F \colon$

$$
\begin{array}{rl} \underset{\pi, F}{\min} & F \\ \mathrm{s.t.} & \sum_{t = 1}^{T} \sum_{i = 1}^{I} c_{i}(t) \left(\pi_{i, t}^{0} + \sum_{r \in I_{t}} \pi_{i, t}^{r} d_{r}\right) \leq F \\ & 0 \leq \pi_{i, t}^{0} + \sum_{r \in I_{t}} \pi_{i, t}^{r} d_{r} \leq P_{i}(t), i = 1, \ldots, I, t = 1, \ldots, T \\ & \sum_{t = 1}^{T} \left(\pi_{i, t}^{0} + \sum_{r \in I_{t}} \pi_{i, t}^{r} d_{r}\right) \leq Q(i), i = 1, \ldots, I \\ & V_{\min} \leq v(1) + \sum_{s = 1}^{t} \left(\sum_{i = 1}^{I} \pi_{i, s}^{0} + \sum_{r \in I_{s}} \pi_{i, s}^{r} d_{r}\right) - \sum_{s = 1}^{t} d_{s} \leq V_{\max}, \\ & t = 1, \ldots, T \\ & \forall \{d_{t} \in[d_{t}^{*} - \theta d_{t}^{*}, d_{t}^{*} + \theta d_{t}^{*}], t = 1, \ldots, T\}, \end{array}\tag{2.4.9}
$$

or, which is the same,

$$
\begin{array}{rl} \underset{\pi, F}{\min} & F \\ \text{s.t.} & \sum_{t = 1}^{T} \sum_{i = 1}^{I} c_{i}(t) \pi_{i, t}^{0} + \sum_{r = 1}^{T} \left(\sum_{i = 1}^{I} \sum_{t: r \in I_{t}} c_{i}(t) \pi_{i, t}^{r}\right) d_{r} - F \leq 0 \\ & \pi_{i, t}^{0} + \sum_{r \in I_{t}}^{t} \pi_{i, t}^{r} d_{r} \leq P_{i}(t), i = 1, \ldots, I, t = 1, \ldots, T \\ & \pi_{i, t}^{0} + \sum_{r \in I_{t}} \pi_{i, t}^{r} d_{r} \geq 0, i = 1, \ldots, I, t = 1, \ldots, T \\ & \sum_{t = 1}^{T} \pi_{i, t}^{0} + \sum_{r = 1}^{T} \left(\sum_{t: r \in I_{t}} \pi_{i, t}^{r}\right) d_{r} \leq Q_{i}, i = 1, \ldots, I \\ & \sum_{s = 1}^{t} \sum_{i = 1}^{I} \pi_{i, s}^{0} + \sum_{r = 1}^{t} \left(\sum_{i = 1}^{I} \sum_{s \leq t, r \in I_{s}} \pi_{i, s}^{r} - 1\right) d_{r} \leq V_{\max} - v(1) \\ & t = 1, \ldots, T \\ & - \sum_{s = 1}^{t} \sum_{i = 1}^{I} \pi_{i, s}^{0} - \sum_{r = 1}^{t} \left(\sum_{i = 1}^{I} \sum_{s \leq t, r \in I_{s}} \pi_{i, s}^{r} - 1\right) d_{r} \leq v(1) - V_{\min} \\ & t = 1, \ldots, T \\ & \forall \{d_{t} \in[d_{t}^{*} - \theta d_{t}^{*}, d_{t}^{*} + \theta d_{t}^{*}], t = 1, \ldots, T\}.\end{array}\tag{2.4.10}
$$

Now, using the following equivalences

$$
\begin{array}{c} \sum_{t = 1}^{T} d_{t} x_{t} \leq y, \forall d_{t} \in[d_{t}^{*}(1 - \theta), d_{t}^{*}(1 + \theta)] \\ \biguplus \\ \sum_{t: x_{t} < 0} d_{t}^{*}(1 - \theta) x_{t} + \sum_{t: x_{t} > 0} d_{t}^{*}(1 + \theta) x_{t} \leq y \\ \biguplus \\ \sum_{t = 1}^{T} d_{t}^{*} x_{t} + \theta \sum_{t = 1}^{T} d_{t}^{*} | x_{t} | \leq y, \end{array}
$$

and defining additional variables

$$
\alpha_{r} \equiv \sum_{t: r \in I_{t}} c_{i}(t) \pi_{i, t}^{r}; \quad \delta_{i}^{r} \equiv \sum_{t: r \in I_{t}} \pi_{i, t}^{r}; \quad \xi_{t}^{r} \equiv \sum_{i = 1}^{I} \sum_{s \leq t, r \in I_{s}} \pi_{i, s}^{r} - 1,
$$

we can straightforwardly convert the AARC (2.4.10) into an equivalent LP (cf. Remark 2.4.1):

$$
\begin{array}{c}\min_{\pi,F,\alpha,\beta,\gamma,\delta,\zeta,\xi,\eta} F\\ \sum \liminfits_{i = 1}^{I}\sum \liminfits_{t:r\in I_{t}}c_{i}(t)\pi_{i,t}^{r} = \alpha_{r}, - \beta_{r}\leq \alpha_{r}\leq \beta_{r}, 1\leq r\leq T, \sum \liminfits_{t = 1}^{T}\sum \liminfits_{i = 1}^{I}c_{i}(t)\pi_{i,t}^{0} + \sum \liminfits_{r = 1}^{T}\alpha_{r}d_{r}^{*} + \theta \sum \liminfits_{r = 1}^{T}\beta_{r}d_{r}^{*}\leq F;\\ -\gamma_{i,t}^{r}\leq \pi_{i,t}^{r}\leq \gamma_{i,t}^{r}, r\in I_{t}, \pi_{i,t}^{0} + \sum \liminfits_{r\in I_{t}}\pi_{i,t}^{r}d_{r}^{*} + \theta \sum \liminfits_{r\in I_{t}}\gamma_{i,t}^{r}d_{r}^{*}\leq P_{i}(t), 1\leq i\leq I,1\leq t\leq T;\\ \pi_{i,t}^{0} + \sum \liminfits_{r\in I_{t}}\pi_{i,t}^{r}d_{r}^{*} - \theta \sum \liminfits_{r\in I_{t}}\gamma_{i,t}^{r}d_{r}^{*}\geq 0, \sum \liminfits_{t:r\in I_{t}}\pi_{i,t}^{r} = \delta_{i}^{r}, - \zeta_{i}^{r}\leq \delta_{i}^{r}\leq \zeta_{i}^{r}, 1\leq i\leq I,1\leq r\leq T,\\ \sum \liminfits_{t = 1}^{T}\pi_{i,t}^{0} + \sum \liminfits_{r = 1}^{T}\delta_{i}^{r}d_{r}^{*} + \theta \sum \liminfits_{r = 1}^{T}\zeta_{i}^{r}d_{r}^{*}\leq Q_{i}, 1\leq i\leq I;\\ \sum \liminfits_{i = 1}^{I}\sum \liminfits_{s\leq t,r\in I_{s}}\pi_{i,s}^{r}-\xi_{t}^{r}=1, - \eta_{t}^{r}\leq\xi_{t}^{r}\leq\eta_{t}^{r}, 1\leq r\leq t\leq T,\\ \sum \liminfits_{s = 1}^{t}\sum \liminfits_{i = 1}^{I}\pi_{i,s}^{0} + \sum \liminfits_{r = 1}^{t}\xi_{t}^{r}d_{r}^{*} + \theta \sum \liminfits_{r = 1}^{t}\eta_{t}^{r}d_{r}^{*}\leq V_{\max}-v(1), 1\leq t\leq T,\\ \sum \liminfits_{s = 1}^{t}\sum \liminfits_{i = 1}^{I}\pi_{i,s}^{0} + \sum \liminfits_{r = 1}^{t}\xi_{t}^{r}d_{r}^{*}-\theta \sum \liminfits_{r = 1}^{t}\eta_{t}^{r}d_{r}^{*}\geq v(1)-V_{\min}, 1\leq t\leq T.\end{array}\tag{2.4.11}
$$

An illustrative example. There are I = 3 factories producing a seasonal product, and one warehouse. The decisions concerning production are made every month, and we are planning production for 24 months, thus the time horizon is $T = 24$ periods. The nominal demand $d^{*}$ is seasonal, reaching its maximum in winter, specifically,

$$
d_{t}^{*} = 1000 \left(1 + \frac{1}{2} \sin \left(\frac{\pi(t - 1)}{12}\right)\right), \quad t = 1, \dots, 24.
$$

We assume that the uncertainty level θ is 20%, i.e., $d_{t} \in[0.8d_{t}^{*}, 1.2d_{t}^{*}]$ , as shown on the picture.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/bc5aedf2f8084539ea03a32999c860afa417865986f633e60980462bd607e3d8.jpg)

- Nominal demand (solid)

- “demand tube” – nominal demand ±20% (dashed)

a sample realization of actual demand (dotted)

The production costs per unit of the product depend on the factory and on time and follow the same seasonal pattern as the demand, i.e., rise in winter and fall in summer. The production cost for a factory i at a period t is given by:

$$
\begin{array}{c} c_{i}(t) = \alpha_{i} \left(1 + \frac{1}{2} \sin \left(\frac{\pi(t - 1)}{12}\right)\right), \quad t = 1, \ldots, 24.\\ \alpha_{1} = 1 \\ \alpha_{2} = 1.5 \\ \alpha_{3} = 2 \end{array}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/c8305fb23feab01d34481e8e32a531bbeee3e77d93e0880627e3d2459acb8a38.jpg)  
Production costs for the 3 factories

The maximal per month production capacity of each one of the factories per is $P_{i}(t) = 567$ units, and the total, for the entire planning period, production capacity each one of the factories for a year is $Q_{i} = 13600$ . The inventory at the warehouse should not be less then 500 units, and cannot exceed 2000 units.

With this data, the AARC (2.4.11) of the uncertain inventory problem is an LP, the dimensions of which vary, depending on the “information basis” (see below), from 919 variables and 1413 constraints (empty information basis) to 2719 variables and 3213 constraints (on-line information basis).

The experiments. In every one of the experiments, the corresponding management policy was tested against a given number (100) of simulations; in every one of the simulations, the actual demand $d_{t}$ of period t was drawn at random, according to the uniform distribution on the segment $[(1 - \theta) d_{t}^{*},(1 + \theta) d_{t}^{*}]$ where θ was the “uncertainty level” characteristic for the experiment. The demands of distinct periods were independent of each other.

## We have conducted two series of experiments:

1. The aim of the first series of experiments was to check the influence of the demand uncertainty θ on the total production costs corresponding to the robustly adjustable management policy – the policy (2.4.8) yielded by the optimal solution to the AARC (2.4.11). We compared this cost to the “ideal” one, i.e., the cost we would have paid in the case when all the demands were known to us in advance and we were using the corresponding optimal management policy as given by the optimal solution of (2.4.5).

2. The aim of the second series of experiments was to check the influence of the “information basis” allowed for the management policy, on the resulting management cost. Specifically, in our model as described in the previous Section, when making decisions $p_{i}(t)$ at time period t, we can make these decisions depending on the demands of periods $r \in I_{t}$ , where $I_{t}$ is a given subset of the segment $\{1, 2,..., t\}$ . The larger are these subsets, the more flexible can be our decisions, and hopefully the less are the corresponding management costs. In order to quantify this phenomenon, we considered 4 “information bases” of the decisions:

(a) $I_{t} = \{1,..., t\}$ (the richest “on-line” information basis);

(b) $I_{t} = \{1,..., t - 1\}$ (this standard information basis seems to be the most natural “information basis”: past is known, present and future are unknown);

(c) $I_{t} = \{1,..., t - 4\}$ (the information about the demand is received with a four-day delay);

(d) $I_{t} = \varnothing \left(\mathrm{i.e.} \right.$ , no adjusting of future decisions to actual demands at all. This “information basis” corresponds exactly to the management policy yielded by the usual RC of our uncertain LP.).

## The results of our experiments are as follows:

1. The influence of the uncertainty level on the management cost. Here we tested the robustly adjustable management policy with the standard information basis against different levels of uncertainty, specifically, the levels of 20%, 10%, 5% and 2.5%. For every uncertainty level, we have computed the average (over 100 simulations) management costs when using the corresponding robustly adaptive management policy. We saved the simulated demand trajectories and then used these trajectories to compute the ideal management costs. The results are summarized in the table below. As expected, the less is the uncertainty, the closer are our management costs to the ideal ones. What is surprising, is the low “price of robustness”: even at the 20% uncertainty level, the average management cost for the robustly adjustable policy was just by 3.4% worse than the corresponding ideal cost; the similar quantity for 2.5%-uncertainty in the demand was just 0.3%.

<table><tr><td></td><td colspan="2">AARC</td><td colspan="2">Ideal case</td><td></td></tr><tr><td>Uncertainty</td><td>Mean</td><td>Std</td><td>Mean</td><td>Std</td><td>price of robustness</td></tr><tr><td>2.5%</td><td>33974</td><td>190</td><td>33878</td><td>194</td><td>0.3%</td></tr><tr><td>5%</td><td>34063</td><td>432</td><td>33864</td><td>454</td><td>0.6%</td></tr><tr><td>10%</td><td>34471</td><td>595</td><td>34009</td><td>621</td><td>1.6%</td></tr><tr><td>20%</td><td>35121</td><td>1458</td><td>33958</td><td>1541</td><td>3.4%</td></tr></table>

Management costs vs. uncertainty level

2. The influence of the information basis. The influence of the information basis on the performance of the robustly adjustable management policy is displayed in the following table:

<table><tr><td rowspan="2">information basis for decision  $p_i(t)$  is demand in periods</td><td colspan="2">Management cost</td></tr><tr><td>Mean</td><td>Std</td></tr><tr><td>1,...,t</td><td>34583</td><td>1475</td></tr><tr><td>1,...,t-1</td><td>35121</td><td>1458</td></tr><tr><td>1,...,t-4</td><td colspan="2">Infeasible</td></tr><tr><td> $\emptyset$ </td><td colspan="2">Infeasible</td></tr></table>

These experiments were carried out at the uncertainty level of 20%. We see that the poorer is the information basis of our management policy, the worse are the results yielded by this policy. In particular, with 20% level of uncertainty, there does not exist a robust non-adjustable management policy: the usual RC of our uncertain LP is infeasible. In other words, in our illustrating example, passing from a priori decisions yielded by RC to “adjustable” decisions yielded by AARC is indeed crucial.

An interesting question is what is the uncertainty level which still allows for a priori decisions. It turns out that the RC is infeasible even at the 5% uncertainty level. Only at the uncertainty level as small as 2.5% the RC becomes feasible and yields the following management costs:

<table><tr><td></td><td colspan="2">RC</td><td colspan="2">Ideal cost</td><td></td></tr><tr><td>Uncertainty</td><td>Mean</td><td>Std</td><td>Mean</td><td>Std</td><td>price of robustness</td></tr><tr><td>2.5%</td><td>35287</td><td>0</td><td>33842</td><td>172</td><td>4.3%</td></tr></table>

Note that even at this unrealistically small uncertainty level the price of robustness for the policy yielded by the RC is by 4.3% larger than the ideal cost (while for the robustly adjustable management this diference is just 0.3%.

Comparison with Dynamic Programming. An Inventory problem we have considered is a typical example of sequential decision-making under dynamical uncertainty, where the information basis for the decision $x_{t}$ made at time t is the part of the uncertainty revealed at instant t. This example allows for an instructive comparison of the AARC-based approach with Dynamic Programming, which is the traditional technique for sequential decision-making under dynami cal uncertainty. Restricting ourselves with the case where the decision-making problem can be modelled as a Linear Programming problem with the data afected by dynamical uncertainty, we could say that (minimax-oriented) Dynamic Programming is a specific technique for solving the ARC of this uncertain LP. Therefore when applicable, Dynamic Programming has a significant advantage as compared to the above AARC-based approach, since it does not impose on the adjustable variables an “ad hoc” restriction (motivated solely by the desire to end up with a tractable problem) to be Affine functions of the uncertain data. At the same time, the above “if applicable” is highly restrictive: the computational efort in Dynamical Programming explodes exponentially with the dimension of the state space of the dynamical system in question. For example, the simple Inventory problem we have considered has 4-dimensional state space (the current amount of product in the warehouse plus remaining total capacities of the three factories), which is already computationally too demanding for accurate implementation of Dynamic Programming. The main advantage of the AARC-based dynamical decision-making as compared with Dynamic Programming (as well as with Multi-Stage Stochastic Programming) comes from the “built-in” computational tractability of the approach, which prevents the “curse of dimensionality” and allows to process routinely fairly complicated models with high-dimensional state spaces and many stages.

By the way, it is instructive to compare the AARC approach with Dynamic Programming when the latter is applicable. For example, let us reduce the number of factories in our Inventory problem from 3 to 1, increasing the production capacity of this factory from the previous 567 to 1800 units per period, and let us make the cumulative capacity of the factory equal to $24 \times 1800$ so that the restriction on cumulative production becomes redundant. The resulting dynamical decision-making problem has just one-dimensional state space (all which matters for the future is the current amount of product in the warehouse). Therefore we can easily find by Dynamic Programming the “minimax optimal” inventory management cost (minimum over arbitrary casual<sup>10)</sup> decision rules, maximum over the realizations of the demands from the uncertainty set). With 20% uncertainty, this minimax optimal inventory management cost turns out to be $\mathrm{Opt_{*} = 31269.69}$ . The guarantees for the AARC-based inventory policy can be only worse than for the minimax optimal one: we should pay a price for restricting the decision rules to be Affine in the demands. How large is this price? Computation shows that the optimal value in the AARC is $\mathrm{Opt}_{\mathrm{AARC}} = 31514.17$ , i.e., it is just by 0.8% larger than the minimax optimal cost $\mathrm{Opt}_{*}$ . And all this – at the uncertainty level as large as 20%! We conclude that the AARC is perhaps not as bad as one could think...

## 2.5 Does Conic Quadratic Programming exist?

Of course it does. What is meant is whether CQP exists as an independent entity?. Specifically, we ask:

(?) Whether a conic quadratic problem can be “eficiently approximated” by a Linear Programming one?

To pose the question formally, let us say that a system of linear inequalities

$$
Py + tp + Qu \geq 0\tag{LP}
$$

approximates the conic quadratic inequality

$$
\| y \|_{2} \leq t\tag{CQI}
$$

within accuracy $\epsilon$ (or, which is the same, is an $\epsilon$-approximation of (CQI)), if

(i) Whenever $(y, t)$ satisfies (CQI), there exists u such that $(y, t, u)$ satisfies (LP);

(ii) Whenever $(y, t, u)$ satisfies (LP), $(y, t)$ “nearly satisfies” (CQI), namely,

$$
\| y \|_{2} \leq(1 + \epsilon) t.\tag{\((\mathrm{CQI}_{\epsilon})\}
$$

Note that given a conic quadratic program

$$
\min_{x} \left\{c^{T} x: \| A_{i} x - b_{i} \|_{2} \leq c_{i}^{T} x - d_{i}, i = 1, \dots, m \right\}\tag{CQP}
$$

with $m_{i} \times n \cdot$ -matrices $A_{i}$ and $\epsilon$-approximations

$$
P^{i} y_{i} + t_{i} p^{i} + Q^{i} u_{i} \geq 0
$$

of conic quadratic inequalities

$$
\| y_{i} \|_{2} \leq t_{i}
$$

$$
[\dim y_{i} = m_{i}],
$$

one can approximate (CQP) by the Linear Programming program

$$
\min_{x, u} \left\{c^{T} x: P^{i}(A_{i} x - b_{i}) +(c_{i}^{T} x - d_{i}) p^{i} + Q^{i} u_{i} \geq 0, i = 1,..., m \right\};
$$

if $\epsilon$ is small enough, this program, for every practical purpose, is “the same” as (CQP) <sup>11)</sup>.

Now, in principle, any closed cone of the form

$$
\{(y, t): t \geq \phi(y)\}
$$

can be approximated, in the aforementioned sense, by a system of linear inequalities within any accuracy $\epsilon > 0$ The question of crucial importance, however, is how large should be the approximating system – how many linear constraints and additional variables it requires. With naive approach to approximating $\mathbf{L}^{n + 1} \mathrm{~ - ~}^{66}$ take tangent hyperplanes along a fine finite grid of boundary directions and replace the Lorentz cone with the resulting polyhedral $\mathrm{{one}^{\prime \prime} \mathrm{~ - ~}}$ the number of linear constraints in, say, 0.5-approximation blows up exponentially as n grows, rapidly making the approximation completely meaningless. Surprisingly, there is a much smarter way to approximate ${\bf L}^{n + 1}$

Theorem 2.5.1 Let n be the dimension of y in (CQI), and let $0 < \epsilon < 1 / 2$ . There exists (and can be explicitly written) a system of no more than $O(1) n$ ln $\frac{1}{\epsilon}$ linear inequalities of the form (LP) with dim $u \le{\cal O}(1) n$ ln $\frac{1}{\epsilon}$ which is an $\epsilon$-approximation of (CQI). Here $O(1)$ ’s are appropriate absolute constants.

To get an impression of the constant factors in the Theorem, look at the numbers $I(n, \epsilon)$ of linear inequalities and $V(n, \epsilon)$ of additional variables u in an $\epsilon$-approximation (LP) of the conic quadratic inequality (CQI) with dim $y = n \colon$

<table><tr><td rowspan="2">n</td><td colspan="2"> $\epsilon = 10^{-1}$ </td><td colspan="2"> $\epsilon = 10^{-6}$ </td><td colspan="2"> $\epsilon = 10^{-14}$ </td></tr><tr><td> $V(n, \epsilon)$ </td><td> $I(N, \epsilon)$ </td><td> $V(n, \epsilon)$ </td><td> $I(n, \epsilon)$ </td><td> $V(n, \epsilon)$ </td><td> $I(n, \epsilon)$ </td></tr><tr><td>4</td><td>6</td><td>17</td><td>31</td><td>69</td><td>70</td><td>148</td></tr><tr><td>16</td><td>30</td><td>83</td><td>159</td><td>345</td><td>361</td><td>745</td></tr><tr><td>64</td><td>133</td><td>363</td><td>677</td><td>1458</td><td>1520</td><td>3153</td></tr><tr><td>256</td><td>543</td><td>1486</td><td>2711</td><td>5916</td><td>6169</td><td>12710</td></tr><tr><td>1024</td><td>2203</td><td>6006</td><td>10899</td><td>23758</td><td>24773</td><td>51050</td></tr></table>

You can see that $\begin{array}{r}{V(n, \epsilon) \approx 0.7n \ln \frac{1}{\epsilon}, I(n, \epsilon) \approx 2n \ln \frac{1}{\epsilon}.} \end{array}$

The smart approximation described in Theorem 2.5.1 is incomparably better than the outlined naive approximation. On a closest inspection, the “power” of the smart approximation comes from the fact that here we approximate the Lorentz cone by a projection of a simple higher-dimensional polyhedral cone. When projecting a polyhedral cone living in $\mathbb{R}^{N}$ onto a linear subspace of dimension $\ll N$ , you get a polyhedral cone with the number of facets which can be by an exponential in N factor larger than the number of facets of the original cone. Thus, the projection of a simple (with small number of facets) polyhedral cone onto a subspace of smaller dimension can be a very complicated (with an astronomical number of facets) polyhedral cone, and this is the fact exploited in the approximation scheme to follow.

## 2.5.1 Proof of Theorem 2.5.1

Let $\epsilon > 0$ and a positive integer n be given. We intend to build a polyhedral $\epsilon$-approximation of the Lorentz cone $\mathbf{L}^{n + 1}$ . Without loss of generality we may assume that n is an integer power of $2 \colon n = 2^{\kappa}, \kappa \in \mathbf{N}$

${\bf 1}^{0}$ . “Tower of variables”. The first step of our construction is quite straightforward: we introduce extra variables to represent a conic quadratic constraint

$$
\sqrt{y_{1}^{2} + \ldots + y_{n}^{2}} \leq t\tag{CQI}
$$

of dimension $n + 1$ by a system of conic quadratic constraints of dimension 3 each. Namely, let us call our original y-variables “variables of generation $0^{\dag}$ and let us split them into pairs $(y_{1}, y_{2}),...,(y_{n - 1}, y_{n})$ . We associate with every one of these pairs its “successor” – an additional variable “ of generation $1^{\mathfrak{n}}$ . We split the resulting $2^{\kappa - 1}$ variables of generation 1 into pairs and associate with every pair its successor – an additional variable of “generation $2^{\mathfrak{s}}$ , and so on; after $\kappa - 1$ steps we end up with two variables of the generation $\kappa - 1$ . Finally, the only variable of generation κ is the variable t from (CQI).

To introduce convenient notation, let us denote by y<sup>\`</sup> i-th variable of generation $\ell,$ so that $y_{1}^{0},..., y_{n}^{0}$ are our original y-variables $y_{1},..., y_{n}, y_{1}^{\kappa} \equiv t$ is the original t-variable, and the “parents” of $y_{i}^{\ell}$ are the variables $y_{2i - 1}^{\ell - 1}, y_{2i}^{\ell - 1}$

Note that the total number of all variables in the “tower of variables” we end up with is $2n - 1$

It is clear that the system of constraints

$$
\sqrt{[y_{2i - 1}^{\ell - 1}]^{2} +[y_{2i}^{\ell - 1}]^{2}} \leq y_{i}^{\ell}, i = 1, \dots, 2^{\kappa - \ell}, \ell = 1, \dots, \kappa\tag{2.5.1}
$$

is a representation of (CQI) in the sense that a collection $(y_{1}^{0} \equiv y_{1},..., y_{n}^{0} \equiv y_{n}, y_{1}^{\kappa} \equiv t)$ can be extended to a solution of (2.5.1) if and only if $(y, t)$ solves (CQI). Moreover, let $\Pi_{\ell}(x_{1}, x_{2}, x_{3}, u^{\ell})$ be polyhedral $\epsilon$<sub>\`</sub>-approximations of the cone

$$
\mathbf{L}^{3} = \{(x_{1}, x_{2}, x_{3}): \sqrt{x_{1}^{2} + x_{2}^{2}} \leq x_{3}\},
$$

$\ell = 1,..., \kappa$ . Consider the system of linear constraints in variables $y_{i}^{\ell}, u_{i}^{\ell};$

$$
\Pi_{\ell}(y_{2i - 1}^{\ell - 1}, y_{2i}^{\ell - 1}, y_{i}^{\ell}, u_{i}^{\ell}) \geq 0, i = 1,..., 2^{\kappa - \ell}, \ell = 1,..., \kappa.\tag{2.5.2}
$$

Writing down this system of linear constraints as $\Pi(y, t, u) \ge 0$ , where Π is linear in its arguments, $y =(y_{1}^{0},..., y_{n}^{0}), \t \ = \y_{1}^{\kappa}$ , and u is the collection of all $u_{i}^{\ell}, \ell = 1,..., \kappa$ and all $y_{i}^{\ell}.$ $\ell = 1,..., \kappa - 1$ , we immediately conclude that Π is a polyhedral $\epsilon$-approximation of $\mathbf{L}^{n + 1}$ with

$$
1 + \epsilon = \prod_{\ell = 1}^{\kappa}(1 + \epsilon_{\ell}).\tag{2.5.3}
$$

In view of this observation, we may focus on building polyhedral approximations of the Lorentz cone $\mathbf{L}^{3}$

2<sup>0</sup>. Polyhedral approximation of $\mathbf{L}^{3}$ we intend to use is given by the system of linear inequalities as follows (positive integer ν is the parameter of the construction):

$$
\begin{array}{ll}(a) & \left\{\begin{array}{lll} \xi^{0} & \geq & | x_{1} | \\ \eta^{0} & \geq & | x_{2} | \end{array} \right.\\(b) & \left\{\begin{array}{lll} \xi^{j} & = & \cos \left(\frac{\pi}{2^{j + 1}}\right) \xi^{j - 1} + \sin \left(\frac{\pi}{2^{j + 1}}\right) \eta^{j - 1} \\ \eta^{j} & \geq & \left| - \sin \left(\frac{\pi}{2^{j + 1}}\right) \xi^{j - 1} + \cos \left(\frac{\pi}{2^{j + 1}}\right) \eta^{j - 1} \right| \end{array}, j = 1, \dots, \nu \right.\\(c) & \left\{\begin{array}{lll} \xi^{\nu} & \leq & x_{3} \\ \eta^{\nu} & \leq & \operatorname{tg} \left(\frac{\pi}{2^{\nu + 1}}\right) \xi^{\nu} \end{array} \right.\end{array}\tag{2.5.4}
$$

Note that (2.5.4) can be straightforwardly written down as a system of linear homogeneous inequalities $\Pi^{(\nu)}(x_{1}, x_{2}, x_{3}, u) \ge 0$ , where u is the collection of $2(\nu{+} 1)$ variables $\xi^{j}, \eta^{i}, j = 0,..., \nu.$

Proposition 2.5.1 $\Pi^{(\nu)}$ is a polyhedral $\delta(\nu)$ -approximation of $\mathbf{L}^{3} = \{(x_{1}, x_{2}, x_{3}) : \sqrt{x_{1}^{2} + x_{2}^{2}} \leq$ $x_{3}\}$ with

$$
\delta(\nu) = \frac{1}{\cos \left(\frac{\pi}{2^{\nu + 1}}\right)} - 1.\tag{2.5.5}
$$

Proof. We should prove that

(i) If $(x_{1}, x_{2}, x_{3}) \in \mathbf{L}^{3}$ , then the triple $(x_{1}, x_{2}, x_{3})$ can be extended to a solution to (2.5.4); (ii) If a triple $(x_{1}, x_{2}, x_{3})$ can be extended to a solution to (2.5.4), then $\|(x_{1}, x_{2}) \|_{2} \leq(1 +$ $\delta(\nu)) x_{3}$

(i): Given $(x_{1}, x_{2}, x_{3}) \in \mathbf{L}^{3}$ , let us set $\xi^{0} = | x_{1} |, \eta^{0} = | x_{2} |$ , thus ensuring $(2.5.4.a)$ . Note that $\|(\xi^{0}, \eta^{0}) \|_{2} = \|(x_{1}, x_{2}) \|_{2}$ and that the point $P^{0} =(\xi^{0}, \eta^{0})$ belongs to the first quadrant.

Now, for $j = 1,..., \nu$ let us set

$$
\begin{array}{rcl} \xi^{j} & = & \cos \left(\frac{\pi}{2^{j + 1}}\right) \xi^{j - 1} + \sin \left(\frac{\pi}{2^{j + 1}}\right) \eta^{j - 1} \\ \eta^{j} & = & \left| - \sin \left(\frac{\pi}{2^{j + 1}}\right) \xi^{j - 1} + \cos \left(\frac{\pi}{2^{j + 1}}\right) \eta^{j - 1} \right|, \end{array}
$$

thus ensuring (2.5.4.b), and let $P^{j} =(\xi^{j}, \eta^{j})$ The point $P^{j}$ is obtained from $P^{j - 1}$ by the following construction: we rotate clockwise $P^{j - 1}$ by the angle $\begin{array}{r}{\phi_{j} = \frac{\pi}{2j + 1}} \end{array}$ , thus getting a point $Q^{j - 1}$ ; if this point is in the upper half-plane, we set $P^{j} = Q^{j - 1}$ , otherwise $P^{j}$ is the reflection of $Q^{j - 1}$ with respect to the x-axis. From this description it is clear that

(I) $\| P^{j} \|_{2} = \| P^{j - 1} \|_{2}.$ , so that all vectors $P^{j}$ are of the same Euclidean norm as $P^{0}$ , i.e., of the norm $\|(x_{1}, x_{2}) \|_{2};$

(II) Since the point $P^{0}$ is in the first quadrant, the point $Q^{0}$ is in the angle $\begin{array}{r}{- \frac{\pi}{4} \le \arg(P) \le \frac{\pi}{4}} \end{array}$ so that $P^{1}$ is in the angle $0 \leq \arg(P) \leq{\frac{\pi}{4}}$ . The latter relation, in turn, implies that $Q^{1}$ is in the angle $-{\frac{\pi}{8}} \leq \arg(P) \leq{\frac{\pi}{8}}$ , whence $P^{2}$ is in the angle $0 \leq \arg ( P ) \leq { \frac { \pi } { 8 } } $ . Similarly, $P^{3}$ is in the angle $\begin{array}{r}{0 \leq \arg(P) \leq \frac{\pi}{16}} \end{array}$ , and so on: $P^{j}$ is in the angle $0 \leq \arg(P) \leq{\frac{\pi}{2^{j + 1}}}$

By $(\operatorname{I}), \xi^{\nu} \leq \| P^{\nu} \|_{2} = \|(x_{1}, x_{2}) \|_{2} \leq x_{3}$ , so that the first inequality in (2.5.4.c) is satisfied. $\mathrm{By} \(\mathrm{II}), P^{\nu}$ is in the angle $0 \leq \arg(P) \leq{\frac{\pi}{2 \nu + 1}}$ , so that the second inequality in (2.5.4.c) also is satisfied. We have extended a point from $\bar{\mathbf{L}}^{3}$ to a solution to (2.5.4).

(ii): Let $(x_{1}, x_{2}, x_{3})$ can be extended to a solution $(x_{1}, x_{2}, x_{3}, \{\xi^{j}, \eta^{j}\}_{j = 0}^{\nu})$ to (2.5.4). Let us set $P^{j} =(\xi^{j}, \eta^{j})$ . From $(2.5.4.a, b)$ it follows that all vectors $P^{j}$ are nonnegative. We have $\| P^{0} \|_{2} \geq \| \left(x_{1}, x_{2} \right) \|_{2}$ by $(2.5.4.a)$ . Now, (2.5.4.b) says that the coordinates of $P^{j}$ are $\geq$ absolute values of the coordinates of $P^{j - 1}$ taken in certain orthonormal system of coordinates, so that $\| P^{j} \|_{2} ~ \ge ~ \| P^{j - 1} \|_{2}$ Thus, $\| P^{\nu} \|_{2} \geq \|(x_{1}, x_{2})^{T} \|_{2}$ . On the other hand, by (2.5.4.c) one has $\begin{array}{r}{\| P^{\nu} \|_{2} \leq \frac{1}{\cos \left(\frac{\pi}{2^{\nu + 1}} \right)} \xi^{\nu} \leq \frac{1}{\cos \left(\frac{\pi}{2^{\nu + 1}} \right)} x_{3}} \end{array}$ , so that $\|(x_{1}, x_{2})^{T} \|_{2} \leq \delta(\nu) x_{3}$ , as claimed. ✷

Specifying in (2.5.2) the mappings $\Pi_{\ell}(\cdot)$ as $\Pi^{(\nu_{\ell})}(\cdot)$ , we conclude that for every collection of positive integers $\nu_{1},..., \nu_{\kappa}$ one can point out a polyhedral $\beta \mathrm{.}$ approximation $\Pi_{\nu_{1}, \dots, \nu_{\kappa}}(y, t, u)$ of $\mathbf{L}^{n}, n = 2^{\kappa}$ :

$$
\begin{array}{rl}(a_{\ell, i}) & \left\{\begin{array}{lll} \xi_{\ell, i}^{0} & \geq & | y_{2i - 1}^{\ell - 1} | \\ \eta_{\ell, i}^{0} & \geq & | y_{2i}^{\ell - 1} | \end{array} \right.\\(b_{\ell, i}) & \left\{\begin{array}{lll} \xi_{\ell, i}^{j} & = & \cos \left(\frac{\pi}{2^{j + 1}}\right) \xi_{\ell, i}^{j - 1} + \sin \left(\frac{\pi}{2^{j + 1}}\right) \eta_{\ell, i}^{j - 1} \\ \eta_{\ell, i}^{j} & \geq & \left| - \sin \left(\frac{\pi}{2^{j + 1}}\right) \xi_{\ell, i}^{j - 1} + \cos \left(\frac{\pi}{2^{j + 1}}\right) \eta_{\ell, i}^{j - 1} \right|, j = 1,..., \nu_{\ell} \end{array}\right.\(c_{\ell, i}) & \left\{\begin{array}{lll} \xi_{\ell, i}^{\nu_{\ell}} & \leq & y_{i}^{\ell} \\ \eta_{\ell, i}^{\nu_{\ell}} & \leq & \operatorname{tg} \left(\frac{\pi}{2^{\nu_{\ell} + 1}}\right) \xi_{\ell, i}^{\nu_{\ell}} \\ & & i = 1,..., 2^{\kappa - \ell}, \ell = 1,..., \kappa.\end{array} \right.\end{array}\tag{2.5.6}
$$

The approximation possesses the following properties:

1. The dimension of the u-vector (comprised of all variables in (2.5.6) except $y_{i} = y_{i}^{0}$ and $t = y_{1}^{\kappa})$ is

$$
p(n, \nu_{1}, \dots, \nu_{\kappa}) \leq n + O(1) \sum_{\ell = 1}^{\kappa} 2^{\kappa - \ell} \nu_{\ell};
$$

2. The image dimension of $\Pi_{\nu_{1}, \dots, \nu_{\kappa}}(\cdot)$ (i.e., the $\#$ of linear inequalities plus twice the $\#$ of linear equations in (2.5.6)) is

$$
q(n, \nu_{1}, \dots, \nu_{\kappa}) \leq O(1) \sum_{\ell = 1}^{\kappa} 2^{\kappa - \ell} \nu_{\ell};
$$

3. The quality $\beta$ of the approximation is

$$
\beta = \beta(n; \nu_{1},..., \nu_{\kappa}) = \prod_{\ell = 1}^{\kappa} \frac{1}{\cos \left(\frac{\pi}{2^{\nu_{\ell} + 1}}\right)} - 1.
$$

${\bf 3}^{0}$ . Back to the general case. Given $\epsilon \in(0, 1]$ and setting

$$
\nu_{\ell} = \left\lfloor O(1) \ell \ln \frac{2}{\epsilon} \right\rfloor, \ell = 1, \dots, \kappa,
$$

with properly chosen absolute constant $O(1)$ , we ensure that

$$
\begin{array}{rcl} \beta(\nu_{1}, \dots, \nu_{\kappa}) & \leq & \epsilon, \\ p(n, \nu_{1}, \dots, \nu_{\kappa}) & \leq & O(1) n \ln \frac{2}{\epsilon}, \\ q(n, \nu_{1}, \dots, \nu_{\kappa}) & \leq & O(1) n \ln \frac{2}{\epsilon}, \end{array}
$$

as required.

## 2.6 Exercises for Lecture 2

Solutions to exercises/parts of exercises colored in cyan can be found in section 6.2.

## 2.6.1 Optimal control in discrete time linear dynamic system

Consider a discrete time linear dynamic system

$$
\begin{array}{rcl} x(t) & = & A(t) x(t - 1) + B(t) u(t), t = 1, 2,..., T; \\ x(0) & = & x_{0}.\end{array}\tag{S}
$$

Here:

- t is the (discrete) time;

$\boldsymbol{x}(t) \in \mathbb{R}^{l}$ is the state vector: its value at instant t identifies the state of the controlled plant;

$u(t) \in \mathbb{R}^{k}$ is the exogenous input at time instant $t; \{u(t)\}_{t = 1}^{T}$ is the control;

- For every $t = 1,..., T, A(t)$ is a given $l \times l,$ and B(t) – a given $l \times k$ matrices.

A typical problem of optimal control associated with (S) is to minimize a given functional of the trajectory $x(\cdot)$ under given restrictions on the control. As a simple problem of this type, consider the optimization model

$$
\min_{x} \left\{c^{T} x(T) \mid \frac{1}{2} \sum_{t = 1}^{T} u^{T}(t) Q(t) u(t) \leq w \right\},\tag{OC}
$$

where $Q(t)$ are given positive definite symmetric matrices.

Exercise 2.1 1) Use (S) to express $x(T)$ via the control and convert (OC) in a quadratically constrained problem with linear objective w.r.t. the u-variables.

2) Convert the resulting problem to a conic quadratic program

3) Pass to the resulting problem to its dual and find the optimal solution to the latter problem.

## 2.6.2 Around stable grasp

Recall that the Stable Grasp Analysis problem is to check whether the system of constraints

$$
\begin{array}{rcl} \| F^{i} \|_{2} & \leq & \mu(f^{i})^{T} v^{i}, i = 1, \dots, N \\(v^{i})^{T} F^{i} & = & 0, i = 1, \dots, N \\ \sum_{i = 1}^{N}(f^{i} + F^{i}) + F^{\mathrm{ext}} & = & 0 \\ \sum_{i = 1}^{N} p^{i} \times(f^{i} + F^{i}) + T^{\mathrm{ext}} & = & 0 \end{array}\tag{SG}
$$

in the 3D vector variables $F^{i}$ is or is not solvable. Here the data are given by a number of 3D vectors, namely,

- vectors $v^{i} -$ unit inward normals to the surface of the body at the contact points;

- contact points $p^{i}$ ;

- vectors $f^{i} -$ contact forces;

- vectors $F^{\mathrm{ext}}$ and $T^{\mathrm{ext}}$ of the external force and torque, respectively.

$\mu > 0$ is a given friction coeficient; we assume that $f_{i}^{T} v^{i} > 0$ for all i.

Exercise 2.2 Regarding (SG) as the system of constraints of a maximization program with trivial objective, build the dual problem.

## 2.6.3 Around randomly perturbed linear constraints

Consider a linear constraint

$$
a^{T} x \geq b \quad[x \in \mathbb{R}^{n}].\tag{2.6.1}
$$

We have seen that if the coeficients $a_{j}$ of the left hand side are subject to random perturbations:

$$
a_{j} = a_{j}^{*} + \epsilon_{j},\tag{2.6.2}
$$

where $\epsilon_{j}$ are independent random variables with zero means taking values in segments $[- \sigma_{j}, \sigma_{j}]$ then $^{66} a$ reliable version” of the constraint is

$$
\sum_{j} a_{j}^{*} x_{j} - \underbrace{\omega \sqrt{\sum_{j} \sigma_{j}^{2} x_{j}^{2}}}_{\alpha(x)} \geq b,\tag{2.6.3}
$$

where $\omega > 0$ is a “safety parameter”. “Reliability” means that if certain x satisfies (2.6.3), then x is $\mathrm{~}^{\mathfrak{a}} \exp \{- \omega^{2} / 4\}$ -reliable solution to $(2.6.1)^{\mathfrak{3}}$ , that is, the probability that x fails to satisfy a realization of the randomly perturbed constraint (2.6.1) does not exceed exp $\{- \omega^{2} / 4\}$ (see Proposition 2.4.1). Of course, there exists a possibility to build an “absolutely sa $\mathrm{fe}^{\prime \prime}$ version of (2.6.1) – (2.6.2) (an analogy of the Robust Counterpart), that is, to require that $\operatorname{min}_{| \epsilon_{j} | \leq \sigma_{j}} \sum_{j}(a_{j}^{\ast} +$ $\epsilon_{j}) x_{j} \geq b,$ , which is exactly the inequality

$$
\sum_{j} a_{j}^{*} x_{j} - \underbrace{\sum_{j} \sigma_{j} | x_{j} |}_{\beta(x)} \geq b.\tag{2.6.4}
$$

Whenever x satisfies (2.6.4), x satisfies all realizations of (2.6.1), and not “all, up to exceptions of small probability”. Since (2.6.4) ensures more guarantees than (2.6.3), it is natural to expect from the latter inequality to be “less conservative” than the former one, that is, to expect that the solution set of (2.6.3) is larger than the solution set of (2.6.4). Whether this indeed is the case? The answer depends on the value of the safety parameter ω: when $\omega \leq 1$ , the “safety term” $\alpha(x)$ in (2.6.3) is, for every $x,$ not greater than the safety term $\beta(x)$ in (2.6.4), so that every solution to (2.6.4) satisfies (2.6.3). When ${\sqrt{n}} > \omega > 1$ , the “safety terms” in our inequalities become “non-comparable”: depending on $x,$ it may happen that $\alpha(x) \leq \beta(x)$ (which is typical when $\omega < <{\sqrt{n}})$ , same as it may happen that $\alpha(x) > \beta(x)$ Thus, in the range $1 < \omega <{\sqrt{n}}$ no one of inequalities (2.6.3), (2.6.4) is more conservative than the other one. Finally, when $\omega \geq{\sqrt{n}}$ , we always have $\alpha(x) \geq \beta(x)$ (why?), so that for “large” values of ω (2.6.3) is even more conservative than (2.6.4). The bottom line is that (2.6.3) is not completely satisfactory candidate to the role of “reliable version” of linear constraint (2.6.1) afected by random perturbations (2.6.2): depending on the safety parameter, this candidate not necessarily is less conservative than the “absolutely reliable” version (2.6.4).

The goal of the subsequent exercises is to build and to investigate an improved version of (2.6.3).

Exercise 2.3 1) Given x, assume that there exist $u,$ v such that

(a)

(b)

$$
\begin{array}{c} x = u + v \\ \sum_{j} a_{j}^{*} x_{j} - \sum_{j} \sigma_{j} | u_{j} | - \omega \sqrt{\sum_{j} \sigma_{j}^{2} v_{j}^{2}} \geq b \end{array}\tag{2.6.5}
$$

Prove that then the probability for x to violate a realization of (2.6.1) is $\leq \exp \{- \omega^{2} / 4\}$ (and is $\leq \exp \{- \omega^{2} / 2\}$ in the case of symmetrically distributed $\epsilon_{j})$

2) Verify that the requirement $^{66} x$ can be extended, by properly chosen $u, v,$ , to a solution of $(2.6.5)^{\prime \prime}$ is weaker than every one of the requirements

(a) x satisfies (2.6.3)

(b) x satisfies (2.6.4)

The conclusion of Exercise 2.3 is:

A good “reliable version” of randomly perturbed constraint (2.6.1) – (2.6.2) is system (2.6.5) of linear and conic quadratic constraints in variables x, u, v:

- whenever x can be extended to a solution of system (2.6.5), x is exp $\{- \omega^{2} / 4\}$ reliable solution to $(2.6.1)$ (when the perturbations are symmetrically distributed, you can replace exp $\{- \omega^{2} / 4\}$ } with exp $\{- \omega^{2} / 2\})$ ;

- at the same time, “as far as x is concerned”, system (2.6.5) is less conservative than every one of the inequalities (2.6.3), (2.6.4): if x solves one of these inequalities, x can be extended to a feasible solution of the system.

Recall that both (2.6.3) and (2.6.4) are Robust Counterparts

$$
\min_{a \in \mathcal{U}} a^{T} x \geq b\tag{2.6.6}
$$

of (2.6.1) corresponding to certain choices of the uncertainty set U: (2.6.3) corresponds to the ellipsoidal uncertainty set

$$
\mathcal{U} = \{a: a_{j} = a_{j}^{*} + \sigma_{j} \zeta_{j}, \sum_{j} \zeta_{j}^{2} \leq \omega^{2}\},
$$

while (2.6.3) corresponds to the box uncertainty set

$$
\mathcal{U} = \{a: a_{j} = a_{j}^{*} + \sigma_{j} \zeta_{j}, \max_{j} | \zeta_{j} | \leq 1\}.
$$

What about (2.6.5)? Here is the answer:

(!) System (2.6.5) is (equivalent to) the Robust Counterpart (2.6.6) of (2.6.1), the uncertainty set being the intersection of the above ellipsoid and box:

$$
\mathcal{U}_{*} = \{a: a_{j} = a_{j}^{*} + \sigma_{j} \zeta_{j}, \sum_{j} \zeta_{j}^{2} \leq \omega^{2}, \max_{j} | \zeta_{j} | \leq 1\}.
$$

Specifically, x can be extended to a feasible solution of (2.6.5) if and only if one has

$$
\min_{a \in \mathcal{U}_{*}} a^{T} x \geq b.
$$

Exercise 2.4 Prove (!) by demonstrating that

$$
\max_{z} \left\{p^{T} z: \sum_{j} z_{j}^{2} \leq \mathbb{R}^{2}, | z_{j} | \leq 1 \right\} = \min_{u, v} \left\{\sum_{j} | u_{j} | + R \| v \|_{2}: u + v = p \right\}.
$$

Exercise 2.5 Extend the above constructions and results to the case of uncertain linear inequality

$$
a^{T} x \geq b
$$

with certain b and the vector of coeficients a randomly perturbed according to the scheme

$$
a = a^{*} + B \epsilon,
$$

where B is deterministic, and the entries $\epsilon_{1},..., \epsilon_{N}$ of $\epsilon$ are independent random variables with zero means and such that $| \epsilon_{i} | \le \sigma_{i}$ for all $\textit{i} \left(\boldsymbol{igma}_{i} \right.$ are deterministic).

## 2.6.4 Around Robust Antenna Design

Consider Antenna Design problem as follows:

Given locations $p_{1},..., p_{k} \in \mathbb{R}^{3}$ of k coherent harmonic oscillators, design antenna array which sends as much energy as possible in a given direction (which w.l.o.g. may be taken as the positive direction of the x-axis).

Of course, this is informal setting. The goal of subsequent exercises is to build and process the corresponding model.

## Background. In what follows, you can take for granted the following facts:

1. The diagram of “standardly invoked” harmonic oscillator placed at a point $p \in \mathbb{R}^{3}$ is the following function of a 3D unit direction δ:

$$
D_{p}(\delta) = \cos \left(\frac{2 \pi p^{T} \delta}{\lambda}\right) + i \sin \left(\frac{2 \pi p^{T} \delta}{\lambda}\right) \quad[\delta \in \mathbb{R}^{3}, \delta^{T} \delta = 1]\tag{2.6.7}
$$

where λ is the wavelength, and i is the imaginary unit.

2. The diagram of an array of oscillators placed at points $p_{1},..., p_{k}$ , is the function

$$
D(\delta) = \sum_{\ell = 1}^{k} z_{\ell} D_{p_{\ell}}(\delta),
$$

where $z_{\ell}$ are the “element weights” (which form the antenna design and can be arbitrary complex numbers).

3. A natural for engineers way to measure the “concentration” of the energy sent by antenna around a given direction e (which from now on is the positive direction of the $x \mathrm{- axis)}$ is

- to choose a $\theta > 0$ and to define the corresponding sidelobe angle $\Delta_{\theta}$ as the set of all unit 3D directions $\delta$ which are at the angle $\geq \theta$ with the direction $e;$

- to measure the “energy concentration” by the index $\begin{array}{r}{\rho = \frac{\left| D(e) \right|}{\underset{\delta \in \Delta_{\theta}}{\operatorname{max}} \left| D(\delta) \right|}} \end{array}$ , where $D(\cdot)$ is the diagram of the antenna.

4. To make the index easily computable, let us replace in its definition the maximum over the entire sidelobe angle with the maximum over a given “fine finite $\mathrm{grid}^{\dag \dag} \Gamma \subset \Delta_{\theta}$ , thus arriving at the quantity

$$
\rho = \frac{| D(e) |}{\max_{\delta \in \Gamma_{\theta}} | D(\delta) |}
$$

which we from now on call the concentration index.

Developments. Now we can formulate the Antenna Design problem as follows:

(\*) Given

- locations $p_{1},..., p_{k}$ of harmonic oscillators,

- wavelength λ,

- finite set Γ of unit 3D directions,

choose complex weights $z_{\ell} = x_{\ell} + iy_{\ell}, \ell = 1,..., k$ which maximize the index

$$
\rho = \frac{| \sum_{\ell} z_{\ell} D_{\ell}(e) |}{\max_{\delta \in \Gamma} | \sum_{\ell} z_{\ell} D_{\ell}(\delta) |}\tag{2.6.8}
$$

where $D_{\ell}(\cdot)$ are given by (2.6.7).

Exercise 2.6 1) Whether the objective (2.6.8) is a concave (and thus “easy to maximize”) function?

2) Prove that (∗) is equivalent to the convex optimization program

$$
\max_{x_{\ell}, y_{\ell} \in \mathbb{R}} \left\{\Re \left(\sum_{\ell}(x_{\ell} + iy_{\ell}) D_{\ell}(e)\right): | \sum_{\ell}(x_{\ell} + iy_{\ell}) D_{\ell}(\delta) | \leq 1, \delta \in \Gamma \right\}.\tag{2.6.9}
$$

In order to carry out our remaining tasks, it makes sense to approximate (2.6.9) with a Linear Programming problem. To this end, it sufices to approximate the modulus of a complex numbe $z \(\mathrm{i.e.}$ , the Euclidean norm of a 2D vector) by the quantity

$$
\pi_{J}(z) = \max_{j = 1, \dots, J} \Re(\omega_{j} z)
$$

$$
[\omega_{j} = \cos(\frac{2 \pi j}{J}) + i \sin(\frac{2 \pi j}{J})]
$$

(geometrically: we approximate the unit disk in $\mathbf{C} = \mathbb{R}^{2}$ by circumscribed perfect J-side polygon).

Exercise 2.7 What is larger $- \pi_{J}(z) or | z | \it{?}$ Within which accuracy the “polyhedral norm” $\pi_{J}(\cdot)$ approximates the modulus?

With the outlined approximation of the modulus, (2.6.9) becomes the optimization program

$$
\max_{x_{\ell}, y_{\ell} \in \mathbb{R}} \left\{\Re \left(\sum_{\ell}(x_{\ell} + iy_{\ell}) D_{\ell}(e)\right): \Re \left(\omega_{j} \sum_{\ell}(x_{\ell} + iy_{\ell}) D_{\ell}(\delta)\right) \leq 1, 1 \leq j \leq J, \delta \in \Gamma \right\}.\tag{2.6.10}
$$

Operational Exercise 2.6.1 1) Verify that (2.6.10) is a Linear Programming program and solve it numerically for the following two setups:

## Data A:

- k = 16 oscillators placed at the points $p_{\ell} =(\ell - 1) e, \ell = 1,..., 16;$

- wavelength $\lambda = 2.5 \mathrm{:}$

$J = 10;$

sidelobe grid Γ: since with the oscillators located along the x-axis, the diagram of the array is symmetric with respect to rotations around the x-axis, it sufices to look at the “sidelobe directions” from the xyplane. To get Γ, we form the set of all directions which are at the angle at least $\theta = 0$ .3rad away from the positive direction of the x-axis, and take 64-point equidistant grid in the resulting “arc of directions”, so that

$$
\Gamma = \left\{\delta_{s} = \left[\begin{array}{c} \cos(\alpha + sd \alpha) \\ \sin(\alpha + sd \alpha) \\ 0 \end{array} \right] \right\}_{s = 0}^{63} \qquad[\alpha = 0.3, d \alpha = \frac{2(\pi - \alpha)}{63}]
$$

Data B: exactly as Data A, except for the wavelength, which is now $\lambda = 5$

2) Assume that in reality the weights are afected by “implementation errors”:

$$
x_{\ell} = x_{\ell}^{*}(1 + \sigma \xi_{\ell}), y_{\ell} = x_{\ell}^{*}(1 + \sigma \eta_{\ell}),
$$

where $x_{\ell}^{*}, y_{\ell}^{*}$ are the “nominal optimal weights” obtained when solving (2.6.10), x<sub>\`</sub>, y<sub>\`</sub> are actual weights, $\sigma > 0$ is the “perturbation level”, and $\xi_{\ell}, \eta_{\ell}$ are mutually independent random perturbations uniformly distributed in [−1, 1].

2.1) Check by simulation what happens with the concentration index of the actual diagram as a result of implementation errors. Carry out the simulations for the perturbation level σ taking values 1.e-4, 5.e-4, 1.e-3.

2.2) If you are not satisfied with the behaviour of nominal design(s) in the presence implementation errors, use the Robust Counterpart methodology to replace the nominal designs with the robust ones. What is the “price of robustness” in terms of the index? What do you gain in stability of the diagram w.r.t. implementation errors?


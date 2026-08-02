---
title: "Chapter 3 \u2014 Convex sets in R^n"
book: "Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications"
book_slug: lectures-modern-convex-optimization
course: optimization
chapter_number: 3
citekey: null
official_syllabus: false
source_pdf: "sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-modern-convex-optimization/reading.md"
source_line_start: 6575
source_line_end: 13668
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 20
source_empty_image_alt: 20
non_semantic_image_alt: 20
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 37
  latex_environment_mismatches: 1
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
---

# Chapter 3 — Convex sets in R^n

> [[../README|本书目录]] · [[02-chapter-2-conic-quadratic-programming|上一章]] · [[04-chapter-4-polynomial-time-interior-point-algorithms-for-lp-cqp-and-sdp|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications
> - 权威原件：[source.pdf](../../../sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-modern-convex-optimization/reading.md)，源行 6575–13668。
> - 本章保留 20 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.164) × 1；PDF-confirmed control-symbol repair (PDF p.220) × 1；PDF-confirmed book-specific control-codepoint pattern × 34；Affine × 45；different × 13；efficient × 8；sufficient × 17；PDF-page fallback for unrecoverable formula (PDF p.232) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Lecture 3

# Semidefinite Programming

In this lecture we study Semidefinite Programming – a generic conic program with an extremely wide area of applications.

## 3.1 Semidefinite cone and Semidefinite programs

## 3.1.1 Preliminaries

Let $\mathbf{S}^{m}$ be the space of symmetric $m \times m$ matrices, and $\mathbf{M}^{m, n}$ be the space of rectangular $m \times n$ matrices with real entries. In the sequel, we always think of these spaces as of Euclidean spaces equipped with the Frobenius inner product

$$
\langle A, B \rangle \equiv \mathrm{Tr}(AB^{T}) = \sum_{i, j} A_{ij} B_{ij},
$$

and we may use in connection with these spaces all notions based upon the Euclidean structure, e.g., the (Frobenius) norm of a matrix

$$
\| X \|_{2} = \sqrt{\langle X, X \rangle} = \sqrt{\sum_{i, j = 1}^{m} X_{ij}^{2}} = \sqrt{\operatorname{Tr}(X^{T} X)}
$$

and likewise the notions of orthogonality, orthogonal complement of a linear subspace, etc. Of course, the Frobenius inner product of symmetric matrices can be written without the transposition sign:

$$
\langle X, Y \rangle = \operatorname{Tr}(XY), X, Y \in \mathbf{S}^{m}.
$$

Let us focus on the space ${\mathbf{S}}^{m}$ . After it is equipped with the Frobenius inner product, we may speak about a cone dual to a given cone ${\mathbf{K}} \subset{\mathbf{S}}^{m}$ :

$$
\mathbf{K}_{*} = \{Y \in \mathbf{S}^{m} \mid \langle Y, X \rangle \geq 0 \quad \forall X \in \mathbf{K}\}.
$$

Among the cones in ${\mathbf{S}}^{m}$ , the one of special interest is the semidefinite cone $\mathbf{S}_{+}^{m}$ , the cone of all symmetric positive semidefinite matrices<sup>1)</sup>. It is easily seen that $\mathbf{S}_{+}^{m}$ indeed is a cone, and moreover it is self-dual:

$$
(\mathbf{S}_{+}^{m})_{*} = \mathbf{S}_{+}^{m}.
$$

Another simple fact is that the interior $\mathbf{S}_{+ +}^{m}$ of the semidefinite cone $\mathbf{S}_{+}^{m}$ is exactly the set of all positive definite symmetric $m \times m$ matrices, i.e., symmetric matrices A for which $x^{T} Ax > 0$ for all nonzero vectors $x, \mathrm{or},$ which is the same, symmetric matrices with positive eigenvalues.

The semidefinite cone gives rise to a family of conic programs “minimize a linear objective over the intersection of the semidefinite cone and an Affine plane”; these are the semidefinite programs we are about to study.

Before writing down a generic semidefinite program, we should resolve a small dificulty with notation. Normally we use lowercase Latin and Greek letters to denote vectors, and the uppercase letters – to denote matrices; $\mathrm{e.g.}$ , our usual notation for a conic problem is

$$
\min_{x} \left\{c^{T} x: Ax - b \geq_{\mathbf{K}} 0 \right\}.\tag{CP}
$$

In the case of semidefinite programs, where ${\bf K} ={\bf S}_{+}^{m}$ , the usual notation leads to a conflict with the notation related to the space where $\mathbf{S}_{+}^{m}$ lives. Look at (CP): without additional remarks it is unclear what is $A - \mathrm{is}$ it a $m \times m$ matrix from the space ${\mathbf{S}}^{m}$ or is it a linear mapping acting from the space of the design vectors – some $\mathbb{R}^{n} \mathrm{~ \tiny ~ - ~}$ to the space $\mathbf{S}^{m} \boldsymbol{?}$ When speaking about a conic problem on the cone $\mathbf{S}_{+}^{m}$ , we should have in mind the second interpretation of $A,$ , while the standard notation in (CP) suggests the first (wrong!) interpretation. In other words, we meet with the necessity to distinguish between linear mappings acting to/from $\mathbf{S}^{m}$ and elements of $\mathbf{S}^{m}$ (which themselves are linear mappings from $\mathbb{R}^{m}$ to $\mathbb{R}^{m})$ . In order to resolve the dificulty, we make the following

Notational convention: To denote a linear mapping acting from a linear space to a space of matrices (or from a space of matrices to a linear space), we use uppercase script letters like ${\mathcal{A, B}}, \ldots$ Elements of usual vector spaces $\mathbb{R}^{n}$ are, as always, denoted by lowercase Latin/Greek letters $a, b,..., z, \alpha,..., \zeta.$ , while elements of a space of matrices usually are denoted by uppercase Latin letters $A, B,..., Z$ . According to this convention, a semidefinite program of the form (CP) should be written as

$$
\min_{x} \left\{c^{T} x: \mathcal{A} x - B \geq_{\mathbf{S}_{+}^{m}} 0 \right\}.\tag{\((*)\}
$$

We also simplify the sign $\ge \mathbf{S}_{+}^{m}$ to $\succeq$ and the sign ${\bf \Sigma} >{\bf S}_{+}^{m}$ to $\succ$ (same as we write $\geq$ instead of $\mathbf{\geq} \mathbb{R}_{+}^{m}$ and > instead of ${\bf \Sigma} >_{\mathbb{R}_{+}^{m}})$ . Thus, $A \succeq B \left(\Leftrightarrow B \preceq A \right)$ means that A and B are symmetric matrices of the same size and $A - B$ is positive semidefinite, while $A \succ B \left(\Leftrightarrow B \prec A \right)$ means that A, B are symmetric matrices of the same size with positive definite $A - B$

Our last convention is how to write down expressions of the type AAxB (A is a linear mapping from some $\mathbb{R}^{n}$ to $\mathbf{S}^{m}, x \in \mathbb{R}^{n}, A, B \in \mathbf{S}^{m})$ ; what we are trying to denote is the result of the following operation: we first take the value $\boldsymbol{Ax}$ of the mapping $\mathcal{A}$ at a vector x, thus getting an m × m matrix ${\mathcal{A}} x,$ , and then multiply this matrix from the left and from the right by the matrices $A, B$ . In order to avoid misunderstandings, we write expressions of this type as

$$
A[\mathcal{A} x] B
$$

or as $A \mathcal{A}(x) B,$ , or as $A \mathcal{A}[\boldsymbol{x}] B$

How to specify a mapping $\pmb{\mathcal{A}} : \mathbb{R}^{n} \mathbf{S}^{m}$ . A natural data specifying a linear mapping A : $\mathbb{R}^{n} \to \mathbb{R}^{m}$ is a collection of n elements of the “destination $\mathrm{space}^{\prime \prime} - n$ vectors $a_{1}, a_{2},..., a_{n} \in \mathbb{R}^{m}$ – such that

$$
Ax = \sum_{j = 1}^{n} x_{j} a_{j}, \quad x =(x_{1},..., x_{n})^{T} \in \mathbb{R}^{n}.
$$

Similarly, a natural data specifying a linear mapping $\pmb{\mathcal{A}} : \mathbb{R}^{n} \mathbf{S}^{m}$ is a collection $A_{1},..., A_{n}$ of n matrices from $\mathbf{S}^{m}$ such that

$$
\mathcal{A} x = \sum_{j = 1}^{n} x_{j} A_{j}, \quad x =(x_{1},..., x_{n})^{T} \in \mathbb{R}^{n}.\tag{3.1.1}
$$

In terms of these data, the semidefinite program (\*) can be written as

$$
\min_{x} \left\{c^{T} x: x_{1} A_{1} + x_{2} A_{2} + \dots + x_{n} A_{n} - B \succeq 0 \right\}.\tag{SDPr}
$$

It is a simple exercise to verify that if A is represented as in (3.1.1), then the conjugate to A linear mapping $\mathcal{A}^{\ast} : \mathbf{S}^{m} \mathbb{R}^{n}$ is given by

$$
\mathcal{A}^{*} \Lambda =(\mathrm{Tr}(\Lambda A_{1}),..., \mathrm{Tr}(\Lambda A_{n}))^{T}: \mathbf{S}^{m} \to \mathbb{R}^{n}.\tag{3.1.2}
$$

Linear Matrix Inequality constraints and semidefinite programs. In the case of conic quadratic problems, we started with the simplest program of this type – the one with a single conic quadratic constraint $Ax - b \geq_{\mathbf{L}^{m}} 0 -$ and then defined a conic quadratic program as a program with finitely many constraints of this type, i.e., as a conic program on a direct product of the ice-cream cones. In contrast to this, when defining a semidefinite program, we impose on the design vector just one Linear Matrix Inequality (LMI) $\mathcal{A} \boldsymbol{x} - \boldsymbol{B} \succeq 0$ . Now we indeed should not bother about more than a single LMI, due to the following simple fact:

A system of finitely many LMI’s

$$
\mathcal{A}_{i} x - B_{i} \succeq 0, i = 1, \dots, k,
$$

is equivalent to the single LMI

$$
\mathcal{A} x - B \succeq 0,
$$

with

$$
\mathcal{A} x = \mathrm{Diag} \left(\mathcal{A}_{1} x, \mathcal{A}_{2} x,..., \mathcal{A}_{k} x\right), B = \mathrm{Diag}(B_{1},..., B_{k});
$$

here for a collection of symmetric matrices $Q_{1},..., Q_{k}$

$$
\operatorname{Diag}(Q_{1},..., Q_{k}) = \left(\begin{array}{ccc} Q_{1} & & \\ & \ddots & \\ & & Q_{k} \end{array} \right)
$$

is the block-diagonal matrix with the diagonal blocks $Q_{1},..., Q_{k}$

Indeed, a block-diagonal symmetric matrix is positive (semi)definite if and only if all its diagonal blocks are so.

## 3.1.1.1 Dual to a semidefinite program (SDP)

Specifying the general concept of conic dual of a conic program in the case when the latter is a semidefinite program $(^{*})$ and taking into account (3.1.2) along with the fact that the semidefinite cone is self-dual, we see that the dual to (\*) is the semidefinite program

$$
\max_{\Lambda} \left\{\langle B, \Lambda \rangle \equiv \operatorname{Tr}(B \Lambda): \operatorname{Tr}(A_{i} \Lambda) = c_{i}, i = 1,..., n; \Lambda \succeq 0 \right\}.\tag{SDDl}
$$

## 3.1.1.2 Conic Duality in the case of Semidefinite Programming

Let us see what we get from Conic Duality Theorem in the case of semidefinite programs. Strict feasibility of (SDPr) means that there exists x such that $Ax - B$ is positive definite, and strict feasibility of (SDDl) means that there exists a positive definite Λ satisfying $A^{*} \Lambda = c.$ According to the Refined Conic Duality Theorem, if both primal and dual are essentially strictly feasible, both are solvable, the optimal values are equal to each other, and the complementary slackness condition

$$
[\mathrm{Tr}(\Lambda[\mathcal{A} x - B]) \equiv] \qquad \langle \Lambda, \mathcal{A} x - B \rangle = 0
$$

is necessary and sufficient for a pair of a primal feasible solution x and a dual feasible solution Λ to be optimal for the corresponding problems.

It is easily seen that for a pair X, Y of positive semidefinite symmetric matrices one has

$$
\operatorname{Tr}(XY) = 0 \Leftrightarrow XY = YX = 0;
$$

in particular, in the case of essentially strictly feasible primal and dual problems, the “primal slack” $S_{*} = \mathcal{A} x^{*} - B$ corresponding to a primal optimal solution commutes with (any) dual optimal solution Λ<sub>∗</sub>, and the product of these two matrices is 0. Besides this, S<sub>∗</sub> and $\Lambda_{*}$ as a pair of commuting symmetric matrices, share a common eigenbasis, and the fact that $S_{*} \Lambda_{*} = 0$ means that the eigenvalues of the matrices in this basis are “complementary”: for every common eigenvector, either the eigenvalue of $S_{*},$ or the one of $\Lambda_{*},$ , or both, are equal to 0 (cf. with complementary slackness in the LP case).

## 3.1.2 Comments.

Writing down a SDP program as a conic program with a single SDP constraint allows to save notation; however, in actual applications of Semidefinite Programming, the “maiden” form of an SDP program in variables $\boldsymbol{x} \in \mathbb{R}^{n}$ usually is

$$
\begin{array}{c} \operatorname{Opt}(SDP) = \underset{x}{\min} \left\{c^{T} x: \mathcal{A}_{i} x - B_{i} \succeq 0, i \leq m, Rx = r \right\} \\ \left[\mathcal{A}_{i} = \sum_{j = 1}^{n} x_{i} A_{j}^{i}, A_{j}^{i} \in \mathbf{S}^{k_{i}}, B_{i} \in \mathbf{S}^{k_{i}} \right] \end{array}\tag{SDP}
$$

Here is how we build the semidefinite dual of (SDP ) (cf. general considerations of this type in Section 1.4.3):

- We assign the semidefinite constraints $A_{i} x - B_{i} \succeq 0$ with Lagrange multipliers $\left(\begin{array}{l}{{66}_{\mathrm{Weights}^{3}}} \\{{}} \end{array} \right)$ Λ from the cone dual to the semidefinite cone $\mathbf{S}_{+}^{k_{i}}$ , that is, from the same semidefinite cone: $\Lambda_{i} \succeq 0$ , and the linear equality constraints $Rx = r -$ with Lagrange multiplier $\mu$ which is a vector of the same dimension as $r;$

- We multiply the constraints by the weight and sum up the results, thus arriving at the aggregated constraint

$$
[\sum_{i} \mathcal{A}_{i}^{*} \Lambda_{i}]^{T} +[\mathbb{R}^{T} \mu]^{T} x \geq \sum_{i} \mathrm{Tr}(B_{i} \lambda_{i}) + r^{Y} \mu \qquad[\mathcal{A}_{i}^{*} \Lambda_{i} =[\mathrm{Tr}(A_{1}^{i} \Lambda_{i});...; \mathrm{Tr}(A_{n}^{i} \Lambda_{i})]
$$

which by its origin is a consequence of the constraints of (SDP ).

- When the left hand side of the aggregated constrain identically in $x$ is $c^{T} x.$ , the right hand side of the constraint is a lower bound on Opt(SDD). The dual problem

$$
\operatorname{Opt}(SDD) = \max_{\{\Lambda_{i}\}, \mu} \left\{\sum_{i} \operatorname{Tr}(B_{i} \Lambda_{i}) + r^{T} \mu : \sum_{i} \mathcal{A}_{i}^{*} \Lambda_{i} + \mathbb{R}^{T} \mu = x, \Lambda_{i} \succeq 0, i \leq m \right\}\tag{SDD}
$$

is the problem of maximizing this lower bound over (legitimate) Lagrange multipliers. Usually this “detailed” form of the dual allows for numerous simplifications (like analytical elimination of some dual variables) and is much more instructive than the “economical” single-constraint form of the dual.

## 3.2 What can be expressed via LMI’s?

As in the previous lecture, the first thing to realize when speaking about the “semidefinite programming universe” is how to recognize that a convex optimization program

$$
\min_{x} \left\{c^{T} x: x \in X = \bigcap_{i = 1}^{m} X_{i} \right\}\tag{P}
$$

can be cast as a semidefinite program. Just as in the previous lecture, this question actually asks whether a given convex set/convex function is positive semidefinite representable (in short: SDr). The definition of the latter notion is completely similar to the one of a CQr set/function:

We say that a convex set $X \subset \mathbb{R}^{n}$ is SDr, if there exists an Affine mapping $( x , u ) $ $\mathcal{A}[\boldsymbol{x}; \boldsymbol{u}] - B : \mathbb{R}_{x}^{n} \times \mathbb{R}_{u}^{k} \mathbf{S}^{m}$ such that

$$
x \in X \Leftrightarrow \exists u: \mathcal{A}[x; u] - B \succeq 0;
$$

in other words, X is SDr, if there exists LMI

$$
\mathcal{A}[x; u] - B \succeq 0,
$$

in the original design vector x and a vector u of additional design variables such that X is the projection of the solution set of the LMI onto the x-space. An LMI with this property is called Semidefinite Representation (SDR) of the set X. We say that this SDR is strictly/essentially strictly feasible, if the conic constraints $\mathcal{A}[\boldsymbol{x}; \boldsymbol{u}] - \boldsymbol{B} \succeq 0$ is so.

A convex function $f : \mathbb{R}^{n} \mathbb{R} \cup \{+ \infty\}$ is called $SDr,$ if its epigraph

$$
\{(x, t) \mid t \geq f(x)\}
$$

is a SDr set. A SDR of the epigraph of f is called semidefinite representation of $f.$ . By exactly the same reasons as in the case of conic quadratic problems, one has:

1. If f is a SDr function, then all its level sets $\{x \mid f(x) \leq a\}$ are $SDr;$ the SDR of the level sets are explicitly given by (any) SDR of $f;$

2. If all the sets $X_{i}$ in problem (P) are SDr with known SDR’s, then the problem can explicitly be converted to a semidefinite program.

In order to understand which functions/sets are SDr, we may use the same approach as in Lecture 2. “The calculus”, i.e., the list of basic operations preserving SD-representability, is exactly the same as in the case of conic quadratic problems; we just may repeat word by word the relevant reasoning from Lecture 2, each time replacing $^{66} \mathrm{CQr}^{\prime \prime}$ with “SDr,” and the family SO of finite direct products of Lorentz cones with the family SD of finite direct products of semidefinite cones (or, which for our purposes is the same, the family of semidefinite cones); for more details on this subject, see Section 2.3.7. Thus, the only issue to be addressed is the derivation of a catalogue of “simple” SDr functions/sets. Our first observation in this direction is as follows:

1-17. <sup>2)</sup> If a function/set is $CQr,$ it is also SDr, and any CQR of the function/set can be explicitly converted to its SDR.

Indeed, the notion of a CQr/SDr function is a “derivative” of the notion of a CQr/SDr set: by definition, a function is $\mathrm{CQr / SDr}$ if and only if its epigraph is so. Now, CQr sets are exactly those sets which can be obtained as projections of the solution sets of systems of conic quadratic inequalities, i.e., as projections of inverse images, under Affine mappings, of direct products of ice-cream cones. Similarly, SDr sets are projections of the inverse images, under Affine mappings, of positive semidefinite cones. Consequently,

(i) in order to verify that a CQr set is SDr as well, it sufices to show that an inverse image, under an Affine mapping, of a direct product of ice-cream cones – a set of the form

$$
Z = \left\{z \mid Az - b \in \mathbf{K} = \prod_{i = 1}^{l} \mathbf{L}^{k_{i}} \right\}
$$

is the inverse image of a semidefinite cone under an Affine mapping. To this end, in turn, it sufices to demonstrate that

(ii) a direct product $\mathbf{K} = \prod_{i = 1}^{l} \mathbf{L}^{k_{i}}$ of ice-cream cones is an inverse image of a semidefinite cone under an Affine mapping.

Indeed, representing K as $\{y \mid \mathcal{A} y - b \in \mathbf{S}_{+}^{m}\}$ , we get

$$
Z = \{z \mid Az - b \in{\bf K}\} = \{z \mid \hat{\mathcal{A}} z - \hat{B} \in{\bf S}_{+}^{m}\},
$$

where $\hat{\mathcal{A}} z - \hat{B} = \mathcal{A}(Az - b) - B$ is Affine.

In turn, in order to prove (ii) it sufices to show that

(iii) Every ice-cream cone ${\bf L}^{k}$ is an inverse image of a semidefinite cone under an Affine mapping.

In fact the implication $(\mathrm{iii}) \Rightarrow(\mathrm{ii})$ is given by our calculus, since a direct product of SDr sets is again $\mathrm{SDr^{3}})$

We have reached the point where no more reductions are necessary, and here is the demonstration of (iii). To see that the Lorentz cone $\mathbf{L}^{k}, \k > 1$ , is $\mathrm{SDr,}$ it sufices to observe that

$$
\binom{x}{t} \in \mathbf{L}^{k} \Leftrightarrow \mathcal{A}(x, t) = \left(\begin{array}{cc} tI_{k - 1} & x \\ x^{T} & t \end{array} \right) \succeq 0\tag{3.2.1}
$$

(x is $k - 1$ -dimensional, t is scalar, $I_{k - 1}$ is the $(k - 1) \times(k - 1)$ unit matrix). (3.2.1) indeed resolves the problem, since the matrix $\boldsymbol{\mathcal{A}}(\boldsymbol{x}, t)$ is linear in $(x, t) !$

It remains to verify (3.2.1), which is immediate. If $(x, t) \in \mathbf{L}^{k}$ , i.e., if $\| x \|_{2} \leq t.$ , then for every $y ={\binom{\xi}{\tau}} \in \mathbb{R}^{k}$ (ξ is (k − 1)-dimensional, τ is scalar) we have

$$
\begin{array}{rcl} y^{T} \mathcal{A}(x, t) y & = & \tau^{2} t + 2 \tau x^{T} \xi + t \xi^{T} \xi \geq \tau^{2} t - 2 | \tau | \| x \|_{2} \| \xi \|_{2} + t \| \xi \|_{2}^{2} \\ & \geq & t \tau^{2} - 2t | \tau | \| \xi \|_{2} + t \| \xi \|_{2}^{2} \\ & \geq & t(| \tau | - \| \xi \|_{2})^{2} \geq 0, \end{array}
$$

so that $\boldsymbol{\mathcal{A}}(\boldsymbol{x}, t) \succeq 0$ . Vice versa, if $\mathbf{\mathcal{A}}(t, x) \succeq 0$ , then of course $t \geq 0$ . Assuming $t = 0,$ , we immediately obtain $x = 0$ (since otherwise for $y ={\binom{x}{0}}$ we would have $0 \leq y^{T} \boldsymbol{\mathcal{A}}(x, t) y =$ $- 2 \| x \|_{2}^{2});$ ; thus, $A(x, t) \succeq 0$ implies $\| x \|_{2} \leq t$ in the case of $t = 0$ . To see that the same implication is valid for $t > 0$ , let us set $y = \left({- x \atop t} \right)$ to get

$$
0 \leq y^{T} \mathcal{A}(x, t) y = tx^{T} x - 2tx^{T} x + t^{3} = t(t^{2} - x^{T} x),
$$

whence $\| x \|_{2} \leq t,$ as claimed.

We see that the “expressive abilities” of semidefinite programming are even richer than those of Conic Quadratic programming. In fact the gap is quite significant. The first new possibility is the ability to handle eigenvalues, and the importance of this possibility can hardly be overestimated.

## 3.2.1 SD-representability of functions of eigenvalues of symmetric matrices

Our first eigenvalue-related observation is as follows:

18. The largest eigenvalue $\lambda_{\operatorname{max}}(X)$ regarded as a function of $m \times m$ symmetric matrix X is SDr. Indeed, the epigraph of this function

$$
\{(X, t) \in \mathbf{S}^{m} \times \mathbb{R} \mid \lambda_{\max}(X) \leq t\}
$$

is given by the LMI

$$
tI_{m} - X \succeq 0,
$$

where $I_{m}$ is the unit $m \times m$ matrix.

image of a semidefinite cone under an Affine mapping:

$$
\mathbf{L}^{k_{i}} = \{x_{i} \in \mathbb{R}^{k_{i}} \mid \mathcal{A}_{i} x_{i} - B_{i} \succeq 0\},
$$

we can represent K as the inverse image of a semidefinite cone under an Affine mapping, namely, as

$$
\mathbf{K} = \left\{x = \left(x_{1},..., x_{l}\right) \in \mathbb{R}^{k_{1}} \times...\times \mathbb{R}^{k_{l}} \mid \operatorname{Diag}(\mathcal{A}_{1} x_{i} - B_{1},..., \mathcal{A}_{l} x_{l} - B_{l}) \succeq 0 \right\}.
$$

Indeed, the eigenvalues of $tI_{m} - X$ are t minus the eigenvalues of X, so that the matrix $tI_{m} - X$ is positive semidefinite – all its eigenvalues are nonnegative – if and only if t dominates all eigenvalues of X.

The latter example admits a natural generalization. Let M, A be two symmetric m×m matrices, and let M be positive definite. A real λ and a nonzero vector e are called eigenvalue and eigenvector of the pencil $[M, A]$ , if $Ae = \lambda Me$ (in particular, the usual eigenvalues/eigenvectors of A are exactly the eigenvalues/eigenvectors of the pencil $[I_{m}, A])$ . Clearly, λ is an eigenvalue of $[M, A]$ if and only if the matrix $\lambda M - A$ is singular, and nonzero vectors from the kernel of the latter matrix are exactly the eigenvectors of $[M, A]$ associated with the eigenvalue λ. The eigenvalues of the pencil $[M, A]$ are the usual eigenvalues of the matrix $M^{- 1 / 2} AM^{- 1 / 2}$ , as can be concluded from:

$$
\operatorname{Det}(\lambda M - A) = 0 \Leftrightarrow \operatorname{Det}(M^{1 / 2}(\lambda I_{m} - M^{- 1 / 2} AM^{- 1 / 2}) M^{1 / 2}) = 0 \Leftrightarrow \operatorname{Det}(\lambda I_{m} - M^{- 1 / 2} AM^{- 1 / 2}) = 0.
$$

The announced extension of Example 18 is as follows:

18a. [The maximum eigenvalue of a pencil]: Let M be a positive definite symmetric $m \times m$ matrix, and let $\overline{{\lambda_{\operatorname{max}}(X : M)}}$ be the largest eigenvalue of the pencil $[M, X]$ , where X is a symmetric m × m matrix. The inequality

$$
\lambda_{\max}(X: M) \leq t
$$

is equivalent to the matrix inequality

$$
tM - X \succeq 0.
$$

In particular, $\lambda_{\operatorname{max}}(X : M)$ , regarded as a function of X, is SDr.

18b. The spectral norm $| X |$ of a symmetric $m \times m$ matrix $X,$ , i.e., the maximum of absolute values of the eigenvalues of X, is SDr. Indeed, a SDR of the epigraph

$$
\{(X, t) \mid | X | \leq t\} = \{(X, t) \mid \lambda_{\max}(X) \leq t, \lambda_{\max}(- X) \leq t\}
$$

of $| X |$ is given by the pair of LMI’s

$$
tI_{m} - X \succeq 0, tI_{m} + X \succeq 0.
$$

In spite of their simplicity, the indicated results are extremely useful. As a more complicated example, let us build a SDr for the sum of the k largest eigenvalues of a symmetric matrix.

From now on, speaking about $m \times m$ symmetric matrix X, we denote by $\lambda_{i}(X), i = 1,..., m$ 2 its eigenvalues counted with their multiplicities and arranged in a non-ascending order:

$$
\lambda_{1}(X) \geq \lambda_{2}(X) \geq...\geq \lambda_{m}(X).
$$

The vector of the eigenvalues (in the indicated order) will be denoted $\lambda(X)$

$$
\lambda(X) =(\lambda_{1}(X), \dots, \lambda_{m}(X))^{T} \in \mathbb{R}^{m}.
$$

The question we are about to address is which functions of the eigenvalues are SDr. We already know that this is the case for the largest eigenvalue $\lambda_{1}(X)$ . Other eigenvalues cannot be SDr since they are not convex functions of X. And convexity, of course, is a necessary condition for SD-representability (cf. Lecture 2). It turns out, however, that the m functions

$$
S_{k}(X) = \sum_{i = 1}^{k} \lambda_{i}(X), k = 1, \dots, m,
$$

are convex and, moreover, are SDr:

18c. Sums of largest eigenvalues of a symmetric matrix. Let X be $m \times m$ symmetric matrix, and let $k \leq m$ . Then the function $S_{k}(X)$ is SDr. Specifically, the epigraph

$$
\{(X, t) \mid S_{k}(x) \leq t\}
$$

of the function admits the SDR

$$
\begin{array}{rlrl}{(a)} &{t - ks - \mathrm{Tr}(Z)} &{\geq} &{0} \\{(b)} &{Z} &{\succeq} &{0} \\{(c)} &{Z - X + sI_{m}} &{\succeq} &{0} \end{array}\tag{3.2.2}
$$

where $Z \in \mathbf{S}^{m}$ and $s \in \mathbb{R}$ are additional variables.

We should prove that

(i) If a given pair $X, t$ can be extended, by properly chosen $s, Z,$ to a solution of the system of LMI’s (3.2.2), then $S_{k}(X) \leq t;$

(ii) Vice versa, if $S_{k}(X) \leq t$ , then the pair X, t can be extended, by properly chosen $s, Z,$ to a solution of (3.2.2).

To prove (i), we use the following basic $\mathrm{fact^{4}})$

(W) The vector $\lambda(X)$ is $a \succeq.$ -monotone function of $X \in \mathbf{S}^{m}$

$$
X \succeq X^{\prime} \Rightarrow \lambda(X) \geq \lambda(X^{\prime}).
$$

Assuming that $(X, t, s, Z)$ is a solution to (3.2.2), we get $X \preceq Z + sI_{m}$ , so that

$$
\lambda(X) \leq \lambda(Z + sI_{m}) = \lambda(Z) + s \left(\begin{array}{c} 1 \\ \vdots \\ 1 \end{array} \right),
$$

whence

$$
S_{k}(X) \leq S_{k}(Z) + sk.
$$

Since $Z \succeq 0$ (see (3.2.2.b)), we have $S_{k}(Z) \le \operatorname{Tr}(Z)$ , and combining these inequalities we get

$$
S_{k}(X) \leq \operatorname{Tr}(Z) + sk.
$$

The latter inequality, in view of (3.2.2.a)), implies $S_{k}(X) \leq t.$ , and (i) is proved.

To prove (ii), assume that we are given X, t with $S_{k}(X) \leq t.$ , and let us set $s = \lambda_{k}(X)$ Then the k largest eigenvalues of the matrix $X - sI_{m}$ are nonnegative, and the remaining are nonpositive. Let Z be a symmetric matrix with the same eigenbasis as X and such that the k largest eigenvalues of $Z$ are the same as those of $X - sI_{m}$ , and the remaining eigenvalues are zeros. The matrices $Z$ and $Z - X + sI_{m}$ are clearly positive semidefinite (the first by construction, and the second since in the eigenbasis of X this matrix is diagonal with the first k diagonal entries being 0 and the remaining being the same as those of the matrix $sI_{m} - X$ $\mathrm{i.e.,}$ nonnegative). Thus, the matrix Z and the real s we have built satisfy $(3.2.2.b, c)$ . In order to see that (3.2.2.a) is satisfied as well, note that by construction $\mathrm{Tr}(Z) = S_{k}(x) - sk$ whence $t - sk - \operatorname{Tr}(Z) = t - S_{k}(x) \geq 0$ ✷

$$
\lambda_{i}(A) = \min_{E \in \mathcal{E}_{i}} \max_{e \in E: e^{T} e = 1} e^{T} Ae,
$$

In order to proceed, we need the following highly useful technical result:

Lemma 3.2.1 [Lemma on the Schur Complement] Let

$$
A = \left(\begin{array}{cc} B & C^{T} \\ C & D \end{array} \right)
$$

be a symmetric matrix with $k \times k$ block B and $\ell \times \ell$ block D. Assume that B is positive definite. Then A is positive (semi)definite if and only if the matrix

$$
D - CB^{- 1} C^{T}
$$

is positive (semi)definite (this matrix is called the Schur complement of B in $A)$

Proof. The positive semidefiniteness of A is equivalent to the fact that

$$
0 \leq(x^{T}, y^{T}) \left(\begin{array}{cc} B & C^{T} \\ C & D \end{array} \right) \binom{x}{y} = x^{T} Bx + 2x^{T} C^{T} y + y^{T} Dy \quad \forall x \in \mathbb{R}^{k}, y \in \mathbb{R}^{\ell},
$$

or, which is the same, to the fact that

$$
\inf_{x \in \mathbb{R}^{k}} \left[x^{T} Bx + 2x^{T} C^{T} y + y^{T} Dy \right] \geq 0 \quad \forall y \in \mathbb{R}^{\ell}.
$$

Since B is positive definite by assumption, the infimum in x can be computed explicitly for every fixed $y \colon$ the optimal x is $- B^{- 1} C^{T} y$ , and the optimal value is

$$
y^{T} Dy - y^{T} CB^{- 1} C^{T} y = y^{T}[D - CB^{- 1} C^{T}] y.
$$

The positive definiteness/semidefiniteness of A is equivalent to the fact that the latter expression is, respectively, positive/nonnegative for every $y \ne 0$ , i.e., to the positive definiteness/semidefiniteness of the Schur complement of B in A. ✷

18d. “Determinant” of a symmetric positive semidefinite matrix. Let X be a symmetric positive semidefinite $m \times m$ matrix. Although its determinant

$$
\operatorname{Det}(X) = \prod_{i = 1}^{m} \lambda_{i}(X)
$$

is neither a convex nor a concave function of $X { \mathrm { ~ ( i f ~ } } m \geq 2 ) $ , it turns out that the function $\mathrm{Det}^{q}(X)$ is concave in X whenever $\textstyle 0 \leq q \leq{\frac{1}{m}}$ . Function of this type are important in many volume-related problems (see below); we are about to prove that

$ifq$ is a rational number,, $\textstyle 0 \leq q \leq{\frac{1}{m}}$ , then the function

$$
f_{q}(X) = \left\{\begin{array}{ll} - \mathrm{Det}^{q}(X), & X \succeq 0 \\ + \infty, & otherwise \end{array} \right.
$$

is SDr.

Consider the following system of LMI’s:

$$
\left(\begin{array}{cc} X & \Delta \\ \Delta^{T} & D(\Delta) \end{array} \right) \succeq 0,\tag{D}
$$

where $\Delta$ is $m \times m$ lower triangular matrix comprised of additional variables, and $D(\Delta)$ is the diagonal matrix with the same diagonal entries as those of $\Delta.$ . Let $\operatorname{diag}(\Delta)$ denote the vector of the diagonal entries of the square matrix $\Delta$

As we know from Lecture 2 (see Example 15), the set

$$
\left\{\left(\delta, t\right) \in \mathbb{R}_{+}^{m} \times \mathbb{R} \mid t \leq \left(\delta_{1}...\delta_{m}\right)^{q} \right\}
$$

admits an explicit CQR. Consequently, this set admits an explicit SDR as well. The latter SDR is given by certain LMI $S(\delta, t; u) \succeq 0$ , where u is the vector of additional variables of the SDR, and $S(\delta, t, u)$ is a matrix afinely depending on the arguments. We claim that

(!) The system of LMI’s (D) & $S(\operatorname{diag}(\Delta), t; u) \succeq 0$ is a SDR for the set

$$
\{(X, t) \mid X \succeq 0, t \leq \operatorname{Det}^{q}(X)\},
$$

which is basically the epigraph of the function $f_{q}$ (the latter is obtained from our set by reflection with respect to the plane $t = 0)$ .

To support our claim, recall that by Linear Algebra a matrix $X$ is positive semidefinite if and only if it can be factorized as $X = \widehat{\Delta} \widehat{\Delta}^{T}$ with a lower triangular $\widehat{\Delta}, \operatorname{diag}(\widehat{\Delta}) \geq 0;$ ; the resulting matrix $\widehat{\Delta}$ is called the Choleski factor of X. Now note that if $X \succeq 0$ and $t \le \mathrm{Det}^{q}(X)$ , then (1) We can extend X by appropriately chosen lower triangular matrix $\Delta$ to a solution of (D) in such a way that if $\delta = \operatorname{diag}(\Delta)$ , then $\prod_{i = 1}^{m} \delta_{i} = \operatorname{Det}(X)$

Indeed, let $\widehat{\Delta}$ be the Choleski factor of X. Let $\widehat{D}$ be the diagonal matrix with the same diagonal entries as those of $\widehat{\Delta}$ , and let $\Delta = \widehat{\Delta} \widehat{D}$ , so that the diagonal entries $\delta_{i}$ of $\Delta$ are squares of the diagonal entries $\widehat{\delta}_{i}$ of the matrix $\widehat{\Delta}$ . Thus, $D(\Delta) = \widehat{D}^{2}$ . It follows that for every $\epsilon > 0$ one has $\Delta[D(\Delta) + \epsilon I]^{- 1} \Delta^{T} = \widehat{\Delta} \widehat{D}[\widehat{D}^{2} + \epsilon I]^{- 1} \widehat{D} \widehat{\Delta}^{T} \preceq \widehat{\Delta} \widehat{\Delta}^{T} = X$ . We see that by the Schur Complement Lemma all matrices of the form $\left(\begin{array}{ll}{{X}} &{{\Delta}} \\{{\Delta^{T}}} &{{D(\Delta) + \epsilon I}} \end{array} \right)$ with $\epsilon > 0$ are positive semidefinite, whence $\left(\begin{array}{cc}{{X}} &{{\Delta}} \\{{\Delta^{T}}} &{{D(\Delta)}} \end{array} \right) \succeq 0$ . Thus, (D) is indeed satisfied by $(X, \Delta)$ . And of course $X = \widehat{\Delta} \widehat{\Delta}^{T} \Rightarrow \mathrm{Det}(X) = \mathrm{Det}^{2}(\widehat{\Delta}) = \prod_{i = 1}^{m} \widehat{\delta}_{i}^{2} = \prod_{i = 1}^{m} \delta_{i}.$

(2) Since $\delta = \operatorname{diag}(\Delta) \geq 0$ and $\prod_{i = 1}^{m} \delta_{i} = \operatorname{Det}(X)$ , we get $t \leq \mathrm{Det}^{q}(X) = \left(\prod_{i = 1}^{m} \delta_{i} \right)^{q}$ , so that we can extend (t, δ) by a properly chosen u to a solution of the LMI $S(\operatorname{diag}(\Delta), \dot{t}; u) \succeq 0$

We conclude that if $X \succeq 0$ and $t \le \mathrm{Det}^{q}(X)$ , then one can extend the pair X, t by properly chosen $\Delta$ and u to a solution of the LMI (D) & $S(\operatorname{diag}(\Delta), t; u) \succeq 0$ , which is the first part of the proof of (!).

To complete the proof of (!), it sufices to demonstrate that if for a given pair $X, t$ there exist $\Delta$ and u such that (D) and the LMI $S(\operatorname{diag}(\Delta), t; u) \ \succeq \0$ are satisfied, then X is positive semidefinite and $t \le \mathrm{Det}^{q}(X)$ This is immediate: denoting $\delta = \operatorname{diag}(\Delta) \[\geq \0]$ and applying the Schur Complement Lemma, we conclude that $X \succeq \Delta[D(\Delta) + \epsilon I]^{- 1} \Delta^{T}$ for every $\epsilon > 0$ . Applying (W), we get $\lambda(X) \ge \lambda(\Delta[D(\Delta) + \epsilon I]^{- 1} \Delta^{T})$ , whence of course $\mathrm{Det}(X) \geq \mathrm{Det}(\Delta[D(\Delta) + \epsilon I]^{- 1} \Delta^{T}) = \prod_{i = 1}^{m} \delta_{i}^{2} /(\delta_{i} + \epsilon)$ . Passing to limit as $\epsilon 0$ , we get $\prod_{i = 1}^{m} \delta_{i} \leq \operatorname{Det}(X)$ . On the other hand, the LMI $S(\delta, t; u) \succeq 0$ takes place, which means that $t \leq \left(\prod_{i = 1}^{m} \delta_{i} \right)^{q}$ . Combining the resulting inequalities, we come to $t \leq \mathrm{Det}^{q}(X)$ , as required.

18e. Negative powers of the determinant. Let $q$ be a positive rational. Then the function

$$
f(X) = \left\{\begin{array}{ll} \operatorname{Det}^{- q}(X), & X \succ 0 \\ + \infty, & \text{otherwise} \end{array} \right.
$$

of symmetric $m \times m$ matrix X is SDr.

The construction is completely similar to the one used in Example 18d. As we remember from Lecture 2, Example 16, the function $g(\delta) =(\delta_{1}...\delta_{m})^{- q}$ of positive vector $\boldsymbol{\delta} =(\delta_{1},..., \delta_{m})^{T}$ is CQr and is therefore SDr as well. Let an SDR of the function be given by LMI $\mathcal{R}(\delta, t, u) \succeq$ 0. The same arguments as in Example 18d demonstrate that the pair of LMI’s (D) & $\mathcal{R}(\mathrm{Dg}(\Delta), t, u) \succeq 0$ is an SDR for $f.$

In examples 18, 18b – 18d we were discussed SD-representability of particular functions of eigenvalues of a symmetric matrix. Here is a general statement of this type:

Proposition 3.2.1 Let $g(x_{1},..., x_{m}) : \mathbb{R}^{m} \mathbb{R} \cup \{+ \infty\}$ be a symmetric $(i.e.,$ invariant with respect to permutations of the coordinates $x_{1},..., x_{m})$ SD-representable function:

$$
t \geq f(x) \Leftrightarrow \exists u: \mathcal{S}(x, t, u) \succeq 0,
$$

with S afinely depending on $x, t, u$ . Then the function

$$
f(X) = g(\lambda(X))
$$

of symmetric m × m matrix X is $SDr,$ with SDR given by the relation

$$
\begin{array}{l}(a) \qquad \qquad \qquad t \geq f(X) \\ \qquad \qquad \qquad \qquad \Updownarrow \\ \exists x_{1},..., x_{m}, u: \\(b) \left\{\begin{array}{c} \mathcal{S}(x_{1},..., x_{m}, t, u) \succeq 0 \\ x_{1} \geq x_{2} \geq...\geq x_{m} \\ S_{j}(X) \leq x_{1} +...+ x_{j}, j = 1,..., m - 1 \\ \operatorname{Tr}(X) = x_{1} +...+ x_{m} \end{array} \right.\end{array}\tag{3.2.3}
$$

(recall that the functions $S_{j}(X) = \sum_{i = 1}^{k} \lambda_{i}(X)$ are $SDr,$ see Example $18c)$ . Thus, the solution set of (b) is SDr (as an intersection of SDr sets), which implies SD-representability of the projection of this set onto the (X, t)-plane; by (3.2.3) the latter projection is exactly the epigraph of f ).

Proof of Proposition 3.2.1 is the subject of Exercises in Section 3.8.1.4. This proof is based upon an extremely useful result known as Birkhof’s Theorem<sup>5)</sup>.

As a corollary of Proposition 3.2.1, we see that the following functions of a symmetric $m \times m$ matrix X are SDr:

$\begin{array}{r}{f(X) = - \mathrm{Det}^{q}(X), X \succeq 0, q \leq \frac{1}{m}} \end{array}$ is a positive rational (this fact was already established directly);

[here $g(x_{1},..., x_{m}) =(x_{1}...x_{m})^{q} : \mathbb{R}_{+}^{n} \mathbb{R};$ ; a CQR (and thus – a SDR) of g is presented in Example 15 of Lecture 2]

$f(x) = \mathrm{Det}^{- q}(X), X \succ 0,$ , q is a positive rational (cf. Example 18e)

[here $g(x_{1},..., x_{m}) =(x_{1},..., x_{m})^{- q} : \mathbb{R}_{+ +}^{m} \mathbb{R};$ a CQR of g is presented in Example 16, Lecture 2]

$\| X \|_{p} = \bigg(\sum_{i = 1}^{m} | \lambda_{i}(X) |^{p} \bigg)^{1 / p}, p \ge 1$ is rational

$[g(x) = \| x \|_{p} \equiv \left(\sum_{i = 1}^{m} | x_{i} |^{p} \right)^{1 / p}$ , see Example 17a, Lecture 2, Example 17a]

$\| X_{+} \|_{p} = \Big(\sum_{i = 1}^{m} \operatorname{max}^{p}[\lambda_{i}(X), 0] \Big)^{1 / p}, p \geq 1$ is rational

[here $g(x) = \| x_{+} \|_{p} \equiv \biggl(\sum_{i = 1}^{m} \mathrm{max}^{p}[x_{i}, 0] \biggr)^{1 / p}.$ , see Example 17b, Lecture 2]

## 3.2.1.1 SD-representability of functions of singular values

Preamble: singular values of rectangular matrices. Let X be $m \times n$ matrix. LinearAlgebra says that

1. There exists representation, called singular value decomposition,

$$
X = \sum_{i = 1}^{k} \sigma_{i} \ell_{i} r_{i}^{T},
$$

where

$k = \operatorname{Rank}(X) = \dim \operatorname{Im} X = \dim \operatorname{Im} X^{T}$

- left singular vectors $\ell_{1},..., \ell_{k}$ of X form an orthonormal basis in ImX, and right singular vectors $r_{1},..., r_{k}$ of X form an orthonormal basis in Im $X^{T}$

$\sigma_{i} = \sigma_{i}(X), \sigma_{1} \geq \sigma_{2} \geq...\geq \sigma_{k} > 0$ are the nonzero singular values of X.

Note: Note: It is convenient to define $\sigma_{i}(X)$ for $i > k$ as well, namely, as zeros.

Equivalently: $X = LDR^{T}$ , where L and R are $m \times m$ and $n \times n$ orthonormal matrices, and D is $m \times n$ matrix with zero of-diagonal entries: $D_{ij} = 0, \ : i \neq j$ , and k nonzero diagonal entries $D_{ii} = \sigma_{i}, 1 \leq i \leq k$

2. $\sigma_{i}(X) = \sigma_{i}(X^{T}), \i \leq k,$ are square roots of nonzero eigenvalues of $X^{T} X$ , same as of nonzero eigenvalues of $XX^{T}$ , the eigenvalues being arranged in the non-ascending order

3. The eigenvectors/eigenvalues of the symmetric $(m + n) \times(m + n)$ matrix

$$
A(X) = \left[\begin{array}{cc} & X \\ \hline X^{T} & \end{array} \right]
$$

are as follows:

- k eigenvectors $[\ell_{i}; r_{i}]$ with eigenvalues $\sigma_{i}, 1 \leq i \leq k$

$m + n - 2k$ eigenvectors forming orthonormal basis in

$$
\operatorname{Ker} A(X) = \{[u; v]: \ell_{i}^{T} u = 0, i \leq k, r_{i}^{T} v = 0, i \leq k\}
$$

with zero eigenvalues

- k eigenvectors $[\ell_{i}; - r_{i}]$ with eigenvalues $- \sigma_{i}, i = k, k - 1,..., 1$

SDRs of functions of singular values. Consider the space $\mathbf{M}^{m, n}$ of m $\times \n$ matrices, and let $k = = \operatorname{min}[m, n]$ . so that $\sigma_{i}(A) = 0, i > k$ , for every $A \in \mathbf{M}^{m, n}$

Among the singular values of a rectangular matrix, the most important is the largest $\sigma_{1}(A)$ This is nothing but the operator (or spectral) norm of A:

$$
| A | = \max \{\| Ax \|_{2} \mid \| x \|_{2} \leq 1\}.
$$

For a symmetric matrix, the singular values are exactly the moduli of the eigenvalues, and our new definition of the norm coincides with the one already given in 18b.

It turns out that the sum of a given number of the largest singular values of A

$$
\Sigma_{p}(A) = \sum_{i = 1}^{p} \sigma_{i}(A)
$$

is a convex and, moreover, a SDr function of A. In particular, the operator norm of A is SDr:

19. The sum $\Sigma_{p}(X)$ of p largest singular values of a rectangular matrix $X \in \mathbf{M}^{m, n}$ is SDr. In particular, the operator norm of a rectangular matrix is SDr:

$$
| X | \leq t \Leftrightarrow \left(\begin{array}{cc} tI_{l} & - X^{T} \\ - X & tI_{k} \end{array} \right) \succeq 0.
$$

Indeed, it sufices to consider the case of $p \le k = \operatorname{min}[m, n]$ . Here the result in question follows from the fact that the sums of p largest eigenvalues of a symmetric matrix are SDr (Example 18c) due to the aforementioned fact that eigenvalues of the symmetric $(m + n) \times$ $(m + n)$ matrix

$$
\bar{X} = \left[\begin{array}{cc} & X \\ \hline X^{T} & \end{array} \right]
$$

are the nonzero singular values of X, minus these values, and perhaps a number of zeros. As a result,

$$
p \leq \min[m, n] \Rightarrow \Sigma_{p}(X) = S_{p}(\bar{X}),
$$

Since X<sup>¯</sup> linearly depends on X, SDR’s of the functions $S_{p}(\cdot)$ induce SDR’s of the functions $\Sigma_{p}(X) = S_{p}(\bar{X})$ (Rule on Affine substitution, Lecture 2; recall that all “calculus rules” established in Lecture 2 for CQR’s are valid for SDR’s as well)

Looking at Proposition 3.2.1, we see that the fact that specific functions of eigenvalues of a symmetric matrix X, namely, the sums $S_{k}(X)$ of k largest eigenvalues of X, are SDr, underlies the possibility to build SDR’s for a wide class of functions of the eigenvalues. The role of the sums of k largest singular values of a rectangular matrix X is equally important:

Proposition 3.2.2 Let m, n be positive integers, and $k = \mathrm{min}[m, n]$ . Let also $g(x_{1},..., x_{k})$ $\mathbb{R}_{+}^{k} \mathbb{R} \cup \{+ \infty\}$ be a symmetric monotone function:

$$
0 \leq y \leq x \in \operatorname{Dom} f \Rightarrow f(y) \leq f(x).
$$

Assume that g is $SDr$

$$
t \geq g(x) \Leftrightarrow \exists u: \mathcal{S}(x, t, u) \succeq 0,
$$

with $\boldsymbol{\mathcal{S}}$ afinely depending on x, t, u. Then the function

$$
f(X) = g(\sigma(X)): \mathbf{M}^{m, n} \to \mathbb{R} \cup \{+ \infty\}
$$

is $SDr$ , with SDR given by the relation

$$
\begin{array}{l}(a) \qquad \qquad \qquad t \geq f(X) \\ \qquad \qquad \qquad \qquad \Updownarrow \\ \exists x_{1},..., x_{k}, u: \\(b) \left\{\begin{array}{c} \mathcal{S}(x_{1},..., x_{k}, t, u) \succeq 0 \\ x_{1} \geq x_{2} \geq...\geq x_{k} \geq 0 \\ \Sigma_{j}(X) \leq x_{1} +...+ x_{j}, j = 1,..., m \end{array} \right.\end{array}\tag{3.2.4}
$$

Note the diference between the symmetric (Proposition 3.2.1) and the non-symmetric (Proposition 3.2.2) situations: in the former the function $g(x)$ was assumed to be SDr and symmetric only, while in the latter the monotonicity requirement is added. The proof of Proposition 3.2.2 is outlined in Section 3.8.1.4.

“Nonlinear matrix inequalities”. There are several cases when matrix inequalities $F(x) \succeq$ 0, where $F$ is a nonlinear function of x taking values in the space of symmetric $m \times m$ matrices, can be “linearized” – expressed via LMI’s.

20a. General quadratic matrix inequality. Let X be a rectangular $k \times l$ matrix and

$$
F(X) =(AXB)(AXB)^{T} + CXD +(CXD)^{T} + E
$$

be a “quadratic” matrix-valued function of $X;$ here $A, B, C, D, E = E^{T}$ are rectangular matrices of appropriate sizes. Let $m$ be the row size of the values of F . Consider the “$\succeq$-epigraph” of the (matrix-valued!) function $F -$ the set

$$
\{(X, Y) \in \mathbf{M}^{k, l} \times \mathbf{S}^{m} \mid F(X) \preceq Y\}.
$$

We claim that this set is SDr with the SDR

$$
\left(\begin{array}{cc} I_{r} &(AXB)^{T} \\ \hline AXB & Y - E - CXD -(CXD)^{T} \end{array} \right) \succeq 0
$$

$$
[B: l \times r]
$$

Indeed, by the Schur Complement Lemma our LMI is satisfied if and only if the Schur complement of the North-Western block is positive semidefinite, which is exactly our origina “quadratic” matrix inequality.

20b. General “fractional-quadratic” matrix inequality. Let X be a rectangular k×l matrix, and V be a positive definite symmetric $\overline{{l \times l}}$ matrix. Then we can define the matrix-valued function

$$
F(X, V) = XV^{- 1} X^{T}
$$

taking values in the space of $k \times k$ symmetric matrices. We claim that the closure of the $\succeq$-epigraph of this (matrix-valued!) function, i.e., the set

$$
E = \operatorname{cl} \left\{(X, V; Y) \in \mathbf{M}^{k, l} \times \mathbf{S}_{+ +}^{l} \times \mathbf{S}^{k} \mid F(X, V) \equiv XV^{- 1} X^{T} \preceq Y \right\}
$$

is SDr, and an SDR of this set is given by the LMI

$$
\left(\begin{array}{cc} V & X^{T} \\ X & Y \end{array} \right) \succeq 0.\tag{R}
$$

Indeed, by the Schur Complement Lemma a triple $(X, V, Y)$ with positive definite V belongs to the “epigraph of $F^{\prime \prime \prime} -$ satisfies the relation $F(X, V) \preceq Y -{\mathrm{if}}$ and only if it satisfies (R). Now, if a triple $(X, V, Y)$ belongs to $E,$ i.e., it is the limit of a sequence of triples from the epigraph of $F.$ , then it satisfies (R) (as a limit of triples satisfying (R)). Vice versa, if a triple $(X, V, Y)$ satisfies (R), then V is positive semidefinite (as a diagonal block in a positive semidefinite matrix). The “regularized” triples $(X, V_{\epsilon} = V + \epsilon I_{l}, Y)$ associated with $\epsilon > 0$ satisfy (R) along with the triple $(X, V, R)$ ; since, as we just have seen, $V \succeq 0$ , we have $V_{\epsilon} \succ 0$ , for $\epsilon > 0.$ . Consequently, the triples $(X, V_{\epsilon}, Y)$ belong to $E$ (this was our very first observation); since the triple $(X, V, Y)$ is the limit of the regularized triples which, as we have seen, all belong to the epigraph of $F,$ the triple $(X, Y, V)$ belongs to the closure $E$ of this epigraph. ✷

20c. Matrix inequality $Y \preceq(C^{T} X^{- 1} C)^{- 1}$ . In the case of scalars $x, y$ the inequality $y \le$ $(cx^{- 1} c)^{- 1}$ in variables $x, y$ is just an awkward way to write down the linear inequality $y \leq c^{- 2} x.$ but it naturally to the matrix analogy of the original inequality, namely, $Y \preceq(C^{T} X^{- 1} C)^{- 1}$ with rectangular $m \times n$ matrix C and variable symmetric $n \times n$ matrix Y and $m \times m$ matrix X. In order for the matrix inequality to make sense, we should assume that the rank of C equals n (and thus $m \geq n)$ . Under this assumption, the matrix $(C^{T} X^{- 1} C)^{- 1}$ makes sense at least for a positive definite X. We claim that the closure of the solution set of the resulting inequality – the set

$$
\mathcal{X} = \operatorname{cl} \left\{(X, Y) \in \mathbf{S}^{m} \times \mathbf{S}^{n} \mid X \succ 0, Y \preceq(C^{T} X^{- 1} C)^{- 1} \right\}
$$

is SDr:

$$
\mathcal{X} = \{(X, Y) \mid \exists Z: Y \preceq Z, Z \succeq 0, X \succeq CZC^{T}\}.
$$

Indeed, let us denote by $\mathcal{X}^{\prime}$ the set in the right hand side of the latter relation; we should prove that $\mathcal{X}^{\prime} = \mathcal{X}$ . By definition, X is the closure of its intersection with the domain $X \succ 0$ It is clear that $\mathcal{X}^{\prime}$ also is the closure of its intersection with the domain $X \succ 0$ . Thus, all we need to prove is that a pair $(Y, X)$ with $X \succ 0$ belongs to X if and only if it belongs to X <sup>0</sup>. “If” part: Assume that $X \succ 0$ and $(Y, X) \in{\mathcal{X}}^{\prime}$ Then there exists $Z$ such that $Z \succeq 0$ $Z \succeq Y$ and $X \succeq CZC^{T}$ . Let us choose a sequence $Z_{i} \succ Z$ such that $Z_{i} \to Z, i \to \infty$ Since $CZ_{i} C^{T} CZC^{T} \preceq X$ as $i \infty,$ , we can find a sequence of matrices $X_{i}$ such that $X_{i} \to X, i \to \infty$ , and $X_{i} \ \succ \CZ_{i} C^{T}$ for all i. By the Schur Complement Lemma, the matrices $\left(\begin{array}{cc}{{X_{i}}} &{{C}} \\{{C^{T}}} &{{Z_{i}^{- 1}}} \end{array} \right)$ are positive definite; applying this lemma again, we conclude that

$Z_{i}^{- 1} \succeq C^{T} X_{i}^{- 1} C$ . Note that the left and the right hand side matrices in the latter inequality are positive definite. Now let us use the following simple fact

Lemma 3.2.2 Let $U, V$ be positive definite matrices of the same size. Then

$$
U \preceq V \Leftrightarrow U^{- 1} \succeq V^{- 1}.
$$

Proof. Note that we can multiply an inequality $A \preceq B$ by a matrix $Q$ from the left and $Q^{T}$ from the right:

$$
A \preceq B \Rightarrow QAQ^{T} \preceq QBQ^{T}[A, B \in \mathbf{S}^{m}, Q \in \mathbf{M}^{k, m}]
$$

(why?) Thus, if $0 \prec U \preceq V$ , then $V^{- 1 / 2} UV^{- 1 / 2} \ \prec V^{- 1 / 2} VV^{- 1 / 2} = I$ (note that $\dot{V}^{- 1 / 2} = \lceil V^{- 1 / 2} \rceil^{T})$ , whence clearly $V^{1 / 2} U^{- 1} V^{1 / 2} =[V^{- 1 / 2} UV^{- 1 / 2}]^{- 1} \succeq I.$ Thus, $V^{1 / 2} U^{- \stackrel{}{1}} V^{1 / 2} \stackrel{}{\quad} \stackrel{\quad}{\quad}$ multiplying this inequality from the left and from the right by $V^{- 1 / 2} =[V^{\overline{{{- 1}}} / 2}]^{T}$ , we get $U^{- 1} \succeq V^{- 1}$ ✷

Applying Lemma 3.2.2 to the inequality $Z_{i}^{- 1} \succeq C^{T} X_{i}^{- 1} C[\succ 0]$ , we get $Z_{i} \preceq(C^{T} X_{i}^{- 1} C)^{- 1}$ As $i \infty,$ , the left hand side in this inequality converges to $Z,$ and the right hand side converges to $(C^{T} X^{- 1} C)^{- 1}$ Hence $Z ~ \preceq ~(C^{T} X^{- 1} C)^{- 1}$ , and since $Y ~ \preceq ~ Z$ , we get $Y \preceq$ $(C^{T} X^{- 1} C)^{- 1}$ , as claimed.

“Only if” part: Let $X \succ 0$ and $Y \preceq(C^{T} X^{- 1} C)^{- 1}$ ; we should prove that there exists $Z \succeq 0$ such that $Z \succeq Y$ and $X \succeq CZC^{T}$ . We claim that the required relations are satisfied by $Z =(C^{T} X^{- 1} C)^{- 1}$ . The only nontrivial part of the claim is that $\boldsymbol{X} \succeq CZC^{T}$ , and here is the required justification: by its origin $Z \succ 0$ , and by the Schur Complement Lemma the matrix $\left(\begin{array}{cc}{{\dot{Z}^{- 1}}} &{{\dot{C}^{T}}} \\{{C}} &{{X}} \end{array} \right)$ is positive semidefinite, whence, by the same Lemma, $X \succeq C(Z^{- 1})^{- 1} C^{T} =$ $\overset{\triangledown}{C} \overset{\triangledown}{Z} \boldsymbol{C}^{T}$

Nonnegative polynomials. Consider the problem of the best polynomial approximation – given a function $f$ on certain interval, we want to find its best uniform (or Least Squares, etc.) approximation by a polynomial of a given degree. This problem arises typically as a subproblem in all kinds of signal processing problems. In some situations the approximating polynomial is required to be nonnegative (think, e.g., of the case where the resulting polynomial is an estimate of an unknown probability density); how to express the nonnegativity restriction? As it was shown by Yu. Nesterov [44], it can be done via semidefinite programming:

The set of all nonnegative (on the entire axis, or on a given ray, or on a given segment) polynomials of a given degree is SDr.

In this statement (and everywhere below) we identify a polynomial $p(t) = \sum_{i = 0}^{k} p_{i} t^{i}$ of degree (not exceeding) k with the $(k + 1)$ -dimensional vector $\operatorname{Coef}(p) = \operatorname{Coef}(p) =(p_{0}, p_{1},..., p_{k})^{T}$ of the coeficients of $p.$ Consequently, a set of polynomials of the degree $\leq k$ becomes a set in $\mathbb{R}^{k + 1}$ and we may ask whether this set is or is not SDr.

Let us look what are the SDR’s of different sets of nonnegative polynomials. The key here is to get a SDR for the set $P_{2k}^{+}({\bf R})$ of polynomials of (at most) a given degree 2k which are nonnegative on the entire axis<sup>6)</sup>

21a. Polynomials nonnegative on the entire axis: The set $P_{2k}^{+}({\bf R})$ is SDr – it is the image of the semidefinite cone $\overline{{\mathbf{S}_{+}^{k + 1}}}$ under the Affine mapping

$$
X \mapsto \operatorname{Coef}(e^{T}(t) Xe(t)): \mathbf{S}^{k + 1} \to \mathbb{R}^{2k + 1}, \quad e(t) = \left(\begin{array}{c} 1 \\ t \\ t^{2} \\...\\ t^{k} \end{array} \right)\tag{C}
$$

First note that the fact that $P^{+} \equiv P_{2k}^{+}({\bf R})$ is an Affine image of the semidefinite cone indeed implies the SD-representability of $P^{+}$ , see the “calculus” of conic representations in Lecture 2. Thus, all we need is to show that $P^{+}$ is exactly the same as the image, let it be called $P,$ of $\mathbf{S}_{+}^{k + 1}$ under the mapping (C).

(1) The fact that P is contained in $P^{+}$ is immediate. Indeed, let $X$ be a $(k + 1) \times(k + 1)$ positive semidefinite matrix. Then X is a sum of dyadic matrices:

$$
X = \sum_{i = 1}^{k + 1} p^{i}(p^{i})^{T}, p^{i} =(p_{i0}, p_{i1},..., p_{ik})^{T} \in \mathbb{R}^{k + 1}
$$

(why?) But then

$$
e^{T}(t) Xe(t) = \sum_{i = 1}^{k + 1} e^{T}(t) p^{i}[p^{i}]^{T} e(t) = \sum_{i = 1}^{k + 1} \left(\sum_{j = 0}^{k} p_{ij} t^{j}\right)^{2}
$$

is the sum of squares of other polynomials and therefore is nonnegative on the axis. Thus, the image of X under the mapping (C) belongs to $P^{+}$

Note that reversing our reasoning, we get the following result:

(!) If a polynomial $p(t)$ of degree $\leq 2k$ can be represented as a sum of squares of other polynomials, then the vector $\operatorname{Coef}(p)$ of the coeficients of p belongs to the image of $\bf \ddot{S}_{+}^{k + 1}$ under the mapping (C).

With (!), the remaining part of the proof – the demonstration that the image of $\mathbf{S}_{+}^{k + 1}$ contains $P^{+}$ , is readily given by the following well-known algebraic fact:

(!!) A polynomial is nonnegative on the axis if and only if it is a sum of squares of polynomials.

The proof of (!!) is so nice that we cannot resist the temptation to present it here. The ${}^{66} \mathrm{\dot{I} \mathrm{\dot{I} \mathrm{\Omega}}}$ part is evident. To prove the $^{6} \mathrm{only \if{\Sigma}}$ one, assume that $p(t)$ is nonnegative on the axis, and let the degree of $p$ (it must be even) be 2k. Now let us look at the roots of $p.$ The real roots $\lambda_{1},..., \lambda_{r}$ must be of even multiplicities $2m_{1}, 2m_{2},...2m_{r}$ each (otherwise $p$ would alter its sign in a neighbourhood of a root, which contradicts the nonnegativity). The complex roots of $p$ can be arranged in conjugate pairs $(\mu_{1}, \mu_{1}^{*}),(\mu_{2}, \mu_{2}^{*}),...,(\mu_{s}, \mu_{s}^{*})$ and the factor of $p$

$$
(t - \mu_{i})(t - \mu_{i}^{*}) =(t - \Re \mu_{i})^{2} +(\Im \mu_{i})^{2}
$$

corresponding to such a pair is a sum of two squares. Finally, the leading coeficient of $p$ is positive. Consequently, we have

$$
p(t) = \omega^{2}[(t - \lambda_{1})^{2}]^{m_{1}}...[(t - \lambda_{r})^{2}]^{m_{r}}[(t - \mu_{1})(t - \mu_{1}^{*})]...[(t - \mu_{s})(t - \mu_{s}^{*})]
$$

is a product of sums of squares. But such a product is itself a sum of squares (open the parentheses)!

In fact we can say more: a nonnegative polynomial p is a sum of just two squares! To see this, note that, as we have seen, p is a product of sums of two squares and take into account the following fact (Liouville):

The product of sums of two squares is again a sum of two squares:

$$
(a^{2} + b^{2})(c^{2} + d^{2}) =(ac - bd)^{2} +(ad + bc)^{2}
$$

(cf. with: “the modulus of a product of two complex numbers is the product of their moduli”).

Equipped with the SDR of the set $P_{2k}^{+}({\bf R})$ of polynomials nonnegative on the entire axis, we can immediately obtain SDR’s for the polynomials nonnegative on a given ray/segment:

## 21b. Polynomials nonnegative on a ray/segment.

1) The set $P_{k}^{+}({\bf R}_{+})$ of (coeficients of) polynomials of degree $\leq k$ which are nonnegative on the nonnegative ray, is SDr.

Indeed, this set is the inverse image of the SDr set $P_{2k}^{+}({\bf R})$ under the linear mapping of the spaces of (coeficients of) polynomials given by the mapping

$$
p(t) \mapsto p^{+}(t) \equiv p(t^{2})
$$

(recall that the inverse image of an SDr set is SDr).

2) The set $P_{k}^{+}([0, 1])$ of (coeficients of) polynomials of degree $\leq k$ which are nonnegative on the segment [0, 1], is SDr.

Indeed, a polynomial $p(t)$ of degree $\leq k$ is nonnegative on $[0, 1]$ if and only if the rational function

$$
g(t) = p \left(\frac{t^{2}}{1 + t^{2}}\right)
$$

is nonnegative on the entire axis, or, which is the same, if and only if the polynomia

$$
p^{+}(t) =(1 + t^{2})^{k} g(t)
$$

of degree $\leq 2k$ is nonnegative on the entire axis. The coeficients of $p^{+}$ depend linearly on the coeficients of $p,$ and we conclude tha $P_{k}^{+}([0, 1])$ is the inverse image of the SDr set $P_{2k}^{+}({\bf R})$ under certain linear mapping.

Our last example in this series deals with trigonometric polynomials

$$
p(\phi) = a_{0} + \sum_{\ell = 1}^{k}[a_{\ell} \cos(\ell \phi) + b_{\ell} \sin(\ell \phi)]
$$

Identifying such a polynomial with its vector of coeficients $\mathrm{Coef}(p) \in \mathbb{R}^{2k + 1}$ , we may ask how to express the set $S_{k}^{+}(\Delta)$ of those trigonometric polynomials of $\mathrm{degree} \le k$ which are nonnegative on a segment $\Delta \subset[0, 2 \pi]$

21c. Trigonometric polynomials nonnegative on a segment. The set $S_{k}^{+}(\Delta)$ is SDr. Indeed, sin $(\ell \phi)$ and $\cos(\ell \phi)$ are polynomials of sin $\left(\phi \right)$ and $\cos(\phi)$ , and the latter functions, in turn, are rational functions of $\zeta = \tan(\phi / 2)$ :

$$
\cos(\phi) = \frac{1 - \zeta^{2}}{1 + \zeta^{2}}, \sin(\phi) = \frac{2 \zeta}{1 + \zeta^{2}}[\zeta = \tan(\phi / 2)].
$$

Consequently, a trigonometric polynomial $p(\phi)$ of degree $\leq k$ can be represented as a rational function of $\zeta = \tan(\phi / 2)$ :

$$
p(\phi) = \frac{p^{+}(\zeta)}{(1 + \zeta^{2})^{k}}[\zeta = \tan(\phi / 2)],
$$

where the coeficients of the algebraic polynomial $p^{+}$ of $\mathrm{degree} \le 2k$ are linear functions of the coeficients of $p.$ . Now, the requirement for $p$ to be nonnegative on a given segment $\Delta \subset[0, 2 \pi]$ is equivalent to the requirement for $p^{+}$ to be nonnegative on a “segment” $\Delta^{+}$ (which, depending on $\Delta$ , may be either the usual finite segment, or a ray, or the entire axis). We see that $S_{k}^{+}(\Delta)$ is inverse image, under certain linear mapping, of the SDr set $P_{2k}^{+}(\Delta^{+})$ , so that $S_{k}^{+}(\Delta)$ itself is SDr.

Finally, we may ask which part of the above results can be saved when we pass from nonnegative polynomials of one variable to those of two or more variables. Unfortunately, not too much. $\mathrm{E.g.}$ , among nonnegative polynomials of a given degree with $r > 1$ variables, exactly those of them who are sums of squares can be obtained as the image of a positive semidefinite cone under certain linear mapping similar to (D). The dificulty is that in the multi-dimensional case the nonnegativity of a polynomial is not equivalent to its representability as a sum of squares, thus, the positive semidefinite cone gives only part of the polynomials we are interested to describe.

## 3.3 Applications of Semidefinite Programming in Engineering

Due to its tremendous expressive abilities, Semidefinite Programming allows to pose and process numerous highly nonlinear convex optimization programs arising in applications, in particular, in Engineering. We are about to outline briefly just few instructive examples.

## 3.3.1 Dynamic Stability in Mechanics

“Free motions” of the so called linearly elastic mechanical systems, i.e., their behaviour when no external forces are applied, are governed by systems of diferential equations of the type

$$
M \frac{d^{2}}{dt^{2}} x(t) = - Ax(t),\tag{N}
$$

where $x(t) \in \mathbb{R}^{n}$ is the state vector of the system at time t, M is the (generalized) “mass matrix”, and A is the “stifness” matrix of the system. Basically, (N) is the Newton law for a system with the potential energy $\scriptstyle{\frac{1}{2}} x^{T} Ax$

As a simple example, consider a system of k points of masses $\mu_{1},..., \mu_{k}$ linked by springs with given elasticity coeficients; here x is the vector of the displacements $x_{i} \in \mathbb{R}^{d}$ of the points from their equilibrium positions $e_{i} ~(d = 1 / 2 / 3$ is the dimension of the model). The Newton equations become

$$
\mu_{i} \frac{d^{2}}{dt^{2}} x_{i}(t) = - \sum_{j \neq i} \nu_{ij}(e_{i} - e_{j})(e_{i} - e_{j})^{T}(x_{i} - x_{j}), i = 1, \dots, k,
$$

with $\nu_{ij}$ given by

$$
\nu_{ij} = \frac{\kappa_{ij}}{\| e_{i} - e_{j} \|_{2}^{3}},
$$

where $\kappa_{ij} > 0$ are the elasticity coeficients of the springs. The resulting system is of the form (N) with a diagonal matrix M and a positive semidefinite symmetric matrix A. The well-known simplest system of this type is a pendulum (a single point capable to slide along a given axis and linked by a spring to a fixed point on the axis):

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/eddbab77f64ddd038e2cbfa3db94cf8f28d09f9dc0864ef77de33a475b6dc05b.jpg)

Another example is given by trusses – mechanical constructions, like a railway bridge or the Eifel Tower, built from linked to each other thin elastic bars.

Note that in the above examples both the mass matrix M and the stifness matrix A are symmetric positive semidefinite; in “nondegenerate” cases they are even positive definite, and this is what we assume from now on. Under this assumption, we can pass in (N) from the variables $x(t)$ to the variables $y(t) = M^{1 / 2} x(t)$ ; in these variables the system becomes

$$
\frac{d^{2}}{dt^{2}} y(t) = - \hat{A} y(t), \hat{A} = M^{- 1 / 2} AM^{- 1 / 2}.\tag{\((N')\}
$$

It is well known that the space of solutions of system $\left(\mathrm{N}^{\prime} \right)$ (where $\hat{A}$ is symmetric positive definite) is spanned by fundamental (perhaps complex-valued) solutions of the form $\exp \{\mu t\} f$ A nontrivial (with $f \neq 0)$ function of this type is a solution to (N<sup>0</sup>) if and only if

$$
(\mu^{2} I + \hat{A}) f = 0,
$$

so that the allowed values of $\mu^{2}$ are the minus eigenvalues of the matrix ${\hat{A}},$ and $f \mathrm{^{\prime} s}$ are the corresponding eigenvectors of ${\hat{A}}.$ Since the matrix $\hat{A}$ is symmetric positive definite, the only allowed values of $\mu$ are purely imaginary, with the imaginary parts $\pm \sqrt{\lambda_{j}(\hat{A})}$ . Recalling that the eigenvalues/eigenvectors of $\hat{A}$ are exactly the eigenvalues/eigenvectors of the pencil $[M, A]$ 2 we come to the following result:

(!) In the case of positive definite symmetric $M, A,$ , the solutions to $(\mathrm{N}) \mathrm{~ - ~} the$ “free motions” of the corresponding mechanical system $S \mathrm{~ - ~} are$ of the form

$$
x(t) = \sum_{j = 1}^{n}[a_{j} \cos(\omega_{j} t) + b_{j} \sin(\omega_{j} t)] e_{j},
$$

where $a_{j}, b_{j}$ are free real parameters, $e_{j}$ are the eigenvectors of the pencil $[M, A]$

$$
(\lambda_{j} M - A) e_{j} = 0
$$

and $\omega_{j} ~ = ~ \sqrt{\lambda_{j}}$ Thus, the “free motions” of the system $\boldsymbol{\mathcal{S}}$ are mixtures of harmonic oscillations along the eigenvectors of the pencil $[M, A]$ , and the frequencies of the oscillations (“the eigenfrequencies of the system”) are the square roots of the corresponding eigenvalues of the pencil.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/fb14a59086adefa7c5ea14118e0559598759ef60cde5334070979a738fd7ff2c.jpg)  
“Nontrivial” modes of a spring triangle (3 unit masses linked by springs) Shown are 3 “eigenmotions” (modes) of a spring triangle with nonzero frequencies; at each picture, the dashed lines depict two instant positions of the oscillating triangle. There are 3 more “eigenmotions” with zero frequency, corresponding to shifts and rotation of the triangle

From the engineering viewpoint, the “dynamic behaviour” of mechanical constructions such as buildings, electricity masts, bridges, etc., is the better the larger are the eigenfrequencies of the system<sup>7)</sup>. This is why a typical design requirement in mechanical engineering is a lower bound

$$
\lambda_{\mathrm{min}}(A: M) \geq \lambda_{*}[\lambda_{*} > 0]\tag{3.3.1}
$$

on the smallest eigenvalue $\lambda_{\operatorname{min}}(A : M)$ of the pencil $[M, A]$ comprised of the mass and the stifness matrices of the would-be system. In the case of positive definite symmetric mass matrices (3.3.1) is equivalent to the matrix inequality

$$
A - \lambda_{*} M \succeq 0.\tag{3.3.2}
$$

If M and A are Affine functions of the design variables (as is the case in, e.g., Truss Design), the matrix inequality (3.3.2) is a linear matrix inequality on the design variables, and therefore it can be processed via the machinery of semidefinite programming. Moreover, in the cases when A is Affine in the design variables, and M is constant, (3.3.2) is an LMI in the design variables and $\lambda_{*}.$ , and we may play with λ<sub>∗</sub>, e.g., solve a problem of the type “given the mass matrix of the system to be designed and a number of (SDr) constraints on the design variables, build a system with the minimum eigenfrequency as large as possible”, which is a semidefinite program, provided that the stifness matrix is Affine in the design variables.

## 3.3.2 Truss Topology Design

A truss is a linearly elastic mechanical construction, like electric mast, railroad bridge, or Eifel Tower, comprised of thin elastic bars linked with each other at nodes:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/e77dfd6fe0e38576ccfe126c3fe2b8b4b248a1daadbb9016bfacc7dd55f7e6d5.jpg)

When a truss is subject to external load (collection of forces acting at the nodes), it deforms until the reaction forces caused by elongations/contractions of bars compensate the external force:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/432e27661b4aee6c13e668fbe569c7370e69a8f6d0b3227a2c6f7a007d334114.jpg)

At the equilibrium, the deformed truss capacitates certain potential energy – compliance of the truss w.r.t. the load. Compliance is a natural measure of the rigidity of the truss w.r.t. the load – the less is the compliance, the better.

Mathematically:

- Displacements of a truss are identified with long vectors comprised of “physical” $\mathrm{2D / 3D}$ displacements of m nodes allowed to be utilized in the construction; these displacements form a linear space $V = \mathbb{R}^{M} = V_{1} \times V_{2} \times \ldots \times V_{m}$ , where M is the total number of degrees of freedom of the nodal set, and $V_{i}$ is the linear subspace of $\mathbb{R}^{d} ~(d = 2$ for planar trusses and $d = 3$ for spatial ones) comprised of displacements allowed for node i by its supports (“boundary conditions”). For example, the above console is planar $(d = 2)$ , its most-left nodes are fixed $\left(V_{i} = \{0\} \right)$ and all other nodes are free $(V_{i} = \mathbb{R}^{d})$ .

- An external load acting at a truss is identified with a long vector $f \in V$ comprised of “physical” 2D/3D forces acting at the nodes

- Assuming deformation small, the reaction forces caused by the deformation form vector $A(t) v \in V$ , where $v \in V$ is the displacement of the nodal set under the deformation, and

A(t) is the stifness matrix of the truss. Mechanics says that

$$
A(t) = \sum_{j = 1}^{N} t_{j} B_{j},
$$

where $t_{j} \geq 0$ is the volume of bar i, and $B_{i} \succeq 0$ is a matrix (in fact, of rank 1) given by the geometry of the nodal set (specifically, positions of the nodes linked by j-th bar).

- Equilibrium under load f exists if and only if f belongs to the image space of the positive semidefinite matrix $A(t)$ , the corresponding displacement v of the nodal set solves the equation

$$
A(t) v = f
$$

and the compliance is

$$
\operatorname{Compl}_{f}(t) = \max_{u \in \mathcal{V}} \left[f^{T} u - \frac{1}{2} u^{T} A(t) u \right] = \frac{1}{2} f^{T} v = \frac{1}{2} v^{T} A(t) v
$$

If the equilibrium equation has no solutions, the compliance w.r.t. the load is +∞, meaning that the truss collapses under the load.

In the multi-load Truss Topology Design (TTD) problem one is given one is given

- Ground Structure: — the set of M tentative 2D/3D nodes along with boundary conditions specifying the spaces $V_{i}, i \le M$ , of allowed displacements of these nodes, — the set of tentative bars – N pairs of tentative nodes which are allowed to be linked by bars

- a collection F of K loading scenarios $f_{k} \in V, 1 \le k \le K$

and seeks for the truss of a given total weight with minimum possible worst-case, over loads from F , compliance w.r.t. the load.

$$
\begin{array}{cccccccc} \hline & \circ & \circ & \circ & \circ & \circ & \circ & \circ \\ \hline & \circ & \circ & \circ & \circ & \circ & \circ & \circ \\ \hline & \circ & \circ & \circ & \circ & \circ & \circ & \circ \\ \hline & \circ & \circ & \circ & \circ & \circ & \circ & \circ \\ \hline & \circ & \circ & \circ & \circ & \circ & \circ & \circ \end{array}
$$

9×9 nodal grid and load  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/8af1ca5ed9c70c35c86ad6379b3a50cc1510e5f974414720cbe1423a7e0d1d52.jpg)  
N = 2, 039 tentative bars

It is easily seen (check it!) that

$$
\operatorname{Compl}_{f}(t) = \min \left\{\frac{1}{2} \tau : \left[\begin{array}{cc} \tau & f^{T} \\ \hline f & A(t) \end{array} \right] \succeq 0 \right\}
$$

so that the multi-load TTD problem is nothing but the semidefinite program

$$
\min_{t, \tau} \left\{\frac{1}{2} \tau : t \geq 0, \sum_{i} t_{i} \leq w, \left[\begin{array}{cc} \tau & f_{k}^{T} \\ \hline f_{k} & \sum_{j} t_{j} B_{j} \end{array} \right] \succeq 0, 1 \leq k \leq K \right\}
$$

When solving a TTD problem, one starts with a dense nodal grid and allows for all pair connections of nodes by tentative bars. At the optimal solution, most of these tentative bars get zero volumes, and the design reveals optimal topology, not merely optimal sizing! This is where the “Topology Design” comes from.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/a880fffdbc18df5442cc956f82ca6b6f298855558f80359e3a05b80e348b94ce.jpg)  
Optimal console (single-load design)

## 3.3.3 Design of chips and Boyd’s time constant

Consider an RC-electric circuit, i.e., a circuit comprised of three types of elements: (1) resistors; (2) capacitors; (3) resistors in a series combination with outer sources of voltage:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/cab807bf764925ca53b6b4a589e49b9eda2b0ef7d8e3b8d582b5239f5e872310.jpg)  
A simple circuit

Element OA: outer supply of voltage $V_{OA}$ and resistor with conductance σ<sub>OA</sub>

Element AO: capacitor with capacitance $C_{AO}$

Element AB: resistor with conductance $\sigma AB$

Element BO: capacitor with capacitance $C_{BO}$

E.g., a chip is, electrically, a complicated circuit comprised of elements of the indicated type. When designing chips, the following characteristics are of primary importance:

- Speed. In a chip, the outer voltages are switching at certain frequency from one constant value to another. Every switch is accompanied by a “transition period”; during this period, the potentials/currents in the elements are moving from their previous values (correspond ing to the static steady state for the “old” outer voltages) to the values corresponding to the new static steady state. Since there are elements with “inertia” – capacitors – this transition period takes some time<sup>8</sup>). In order to ensure stable performance of the chip, the transition period should be much less than the time between subsequent switches in the outer voltages. Thus, the duration of the transition period is responsible for the speed at which the chip can perform.

- Dissipated heat. Resistors in the chip dissipate heat which should be eliminated, otherwise the chip will not function. This requirement is very serious for modern “high-density” chips. Thus, a characteristic of vital importance is the dissipated heat power.

The two objectives: high speed (i.e., a small transition period) and small dissipated heat – usually are conflicting. As a result, a chip designer faces the tradeof problem like “how to get a chip with a given speed and with the minimal dissipated heat”. It turns out that different optimization problems related to the tradeof between the speed and the dissipated heat in an RC circuit belong to the “semidefinite universe”. We restrict ourselves with building an SDR for the speed.

Simple considerations, based on Kirchof laws, demonstrate that the transition period in an RC circuit is governed by a linear system of diferential equations as follows:

$$
C \frac{d}{dt} w(t) = - Sw(t) + Rv.\tag{3.3.3}
$$

Here

- The state vector $w(\cdot)$ is comprised of the potentials at all but one nodes of the circuit (the potential at the remaining node – “the ground” – is normalized to be identically zero);

- Matrix $C \succeq 0$ is readily given by the topology of the circuit and the capacitances of the capacitors and is linear in these capacitances. Similarly, matrix $S \succeq 0$ is readily given by the topology of the circuit and the conductances of the resistors and is linear in these conductances. Matrix R is given solely by the topology of the circuit;

- v is the vector of outer voltages; recall that this vector is set to certain constant value at the beginning of the transition period.

As we have already mentioned, the matrices C and S, due to their origin, are positive semidefinite; in nondegenerate cases, they are even positive definite, which we assume from now on.

Let w be the steady state of (3.3.3), so that $S \widehat{w} = Rv$ . The diference $\delta(t) = w(t) - \widehat{w}$ is a solution to the homogeneous diferential equation

$$
C \frac{d}{dt} \delta(t) = - S \delta(t).\tag{3.3.4}
$$

Setting $\gamma(t) = C^{1 / 2} \delta(t)$ (cf. Section 3.3.1), we get

$$
\frac{d}{dt} \gamma(t) = -(C^{- 1 / 2} SC^{- 1 / 2}) \gamma(t).\tag{3.3.5}
$$

Since $C$ and $S$ are positive definite, all eigenvalues $\lambda_{i}$ of the symmetric matrix $C^{- 1 / 2} SC^{- 1 / 2}$ are positive. It is clear that the space of solutions to (3.3.5) is spanned by the “eigenmotions”

$$
\gamma_{i}(t) = \exp \{- \lambda_{i} t\} e_{i},
$$

where $\{e_{i}\}$ is an orthonormal eigenbasis of the matrix $C^{- 1 / 2} SC^{- 1 / 2}$ . We see that all solutions to (3.3.5) (and thus - to (3.3.4) as well) are exponentially fast converging to 0, or, which is the same, the state $w(t)$ of the circuit exponentially fast approaches the steady state $\widehat{w}.$ . The “time scale” of this transition is, essentially, defined by the quantity $\lambda_{\operatorname{min}} = \operatorname{min}_{i} \lambda_{i};$ a typical “decay rate” of a solution to (3.3.5) is nothing but $T = \lambda_{\operatorname{min}}^{- 1}$ . S. Boyd has proposed to use $T$ to quantify the length of the transition period, and to use the reciprocal of ${\mathrm{it}} -{\mathrm{i.e.}}$ , the quantity $\lambda_{\operatorname{min}}$ itself – as the quantitative measure of the speed. Technically, the main advantage of this definition is that the speed turns out to be the minimum eigenvalue of the matrix $C^{- 1 / \bar{2}} SC^{- 1 / 2}$ ， i.e., the minimum eigenvalue of the matrix pencil $\left[C : S \right]$ . Thus, the speed in Boyd’s definition turns out to be eficiently computable (which is not the case for other, more sophisticated, “time constants” used by engineers). Even more important, with Boyd’s approach, a typical design specification “the speed of a circuit should be at least such and such” is modelled by the matrix inequality

$$
S \succeq \lambda_{*} C.\tag{3.3.6}
$$

As it was already mentioned, S and C are linear in the capacitances of the capacitors and conductances of the resistors; in typical circuit design problems, the latter quantities are Affine functions of the design parameters, and (3.3.6) becomes an LMI in the design parameters.

## 3.3.4 Lyapunov stability analysis/synthesis

## 3.3.4.1 Uncertain dynamical systems

Consider a time-varying uncertain linear dynamical system

$$
\frac{d}{dt} x(t) = A(t) x(t), x(0) = x_{0}.\tag{ULS}
$$

Here $\b{x}(t) \in \mathbb{R}^{n}$ represents the state of the system at time t, and $A(t)$ is a time-varying $n \times n$ matrix. We assume that the system is uncertain in the sense that we have no idea of what is $x_{0}.$ and all we know about $A(t)$ is that this matrix, at any time t, belongs to a given uncertainty set U. Thus, (ULS) represents a wide family of linear dynamic systems rather than a single system; and it makes sense to call a trajectory of the uncertain linear system (ULS) every function $x(t)$ which is an “actual trajectory” of a system from the family, i.e., is such that

$$
{\frac{d}{dt}} x(t) = A(t) x(t)
$$

for all $t \geq 0$ and certain matrix-valued function A(t) taking all its values in U.

Note that we can model a nonlinear dynamic system

$$
\frac{d}{dt} x(t) = f(t, x(t)) \quad[x \in \mathbb{R}^{n}]\tag{NLS}
$$

with a given right hand side $f(t, x)$ and a given equilibrium $x(t) \equiv 0 \({\mathrm{i.e.,}} \f(t, 0) = 0, \t \geq 0)$ as an uncertain linear system. Indeed, let us define the set $\mathcal{U}_{f}$ as the closed convex hull of the set of $n \times n$ matrices $\textstyle{\left\{{\frac{\partial}{\partial x}} f(t, x) \mid t \geq 0, x \in \mathbb{R}^{n} \right\}}$ . Then for every point $\boldsymbol{x} \in \mathbb{R}^{n}$ we have

$$
\begin{array}{c} f(t, x) = f(t, 0) + \int_{0}^{s} \left[\frac{\partial}{\partial x} f(t, sx) \right] xds = A_{x}(t) x, \\ A_{x}(t) = \int_{0}^{1} \frac{\partial}{\partial x} f(t, sx) ds \in \mathcal{U}.\end{array}
$$

We see that every trajectory of the original nonlinear system (NLS) is also a trajectory of the uncertain linear system (ULS) associated with the uncertainty set $\mathcal{U} = \mathcal{U}_{f}$ (this trick is called “global linearization”). Of course, the set of trajectories of the resulting uncertain linear system can be much wider than the set of trajectories of (NLS); however, all “good news” about the uncertain system (like “all trajectories of (ULS) share such and such property”) are automatically valid for the trajectories of the “nonlinear system of interest” (NLS), and only “bad news” about (ULS) (“such and such property is not shared by some trajectories of (ULS)”) may say nothing about the system of interest (NLS).

## 3.3.4.2 Stability and stability certificates

The basic question about a dynamic system is the one of its stability. For (ULS), this question sounds as follows:

(?) Is it true that (ULS) is stable, i.e., that

$$
x(t) \rightarrow 0 \text{as} t \rightarrow \infty
$$

for every trajectory of the system?

A sufficient condition for the stability of (ULS) is the existence of a quadratic Lyapunov function, i.e., a quadratic form $\mathcal{L}(x) = x^{T}$ Xx with symmetric positive definite matrix X such that

$$
\frac{d}{dt} \mathcal{L}(x(t)) \leq - \alpha \mathcal{L}(x(t))\tag{3.3.7}
$$

for certain $\alpha > 0$ and all trajectories of (ULS):

Lemma 3.3.1 [Quadratic Stability Certificate] Assume (ULS) admits a quadratic Lyapunov function L. Then (ULS) is stable.

Proof. If (3.3.7) is valid with some $\alpha > 0$ for all trajectories of (ULS), then, by integrating this diferential inequality, we get

$$
\mathcal{L}(x(t)) \leq \exp \{- \alpha t\} \mathcal{L}(x(0)) \rightarrow 0 \text{as} t \rightarrow \infty.
$$

(indeed, by (3.3.7) one has $\begin{array}{r}{\frac{d}{dt} \exp \{\alpha t\} \mathcal{L}(x(t)) = \exp \{\alpha t\}[\alpha \mathcal{L}(x(t)) + \frac{d}{dt} \mathcal{L}(x(t))] \leq 0} \end{array}$ for all t). Since $\mathcal{L}(\cdot)$ is a positive definite quadratic form, $\mathcal{L}(x(t)) 0$ implies that $x(t) \to 0$ ✷

Of course, the statement of Lemma 3.3.1 also holds for non-quadratic Lyapunov functions: all we need is (3.3.7) plus the assumption that $\mathcal{L}(x)$ is smooth, nonnegative and is bounded away from 0 outside every neighbourhood of the origin. The advantage of a quadratic Lyapunov function is that we more or less know how to find such a function, if it exists:

Proposition 3.3.1 [Existence of Quadratic Stability Certificate] Let U be the uncertainty set associated with uncertain linear system (ULS). The system admits quadratic Lyapunov function if and only if the optimal value of the $\tilde{\it semi - infinite^{9}})$ semidefinite program”

minimize

$$
\begin{array}{rcl} sI_{n} - A^{T} X - XA & \succeq & 0, \quad \forall A \in \mathcal{U} \\ X & \succeq & I_{n} \end{array}\tag{Ly}
$$

with the design variables $s \in \mathbb{R}$ and $X \in \mathbf{S}^{n}$ , is negative. Moreover, every feasible solution to the problem with negative value of the objective provides a quadratic Lyapunov stability certificate for (ULS).

We shall refer to a positive definite matrix $X \succeq I_{n}$ which can be extended, by properly chosen $s < 0,$ , to a feasible solution of $\mathrm{(Ly)}$ , as to a Lyapunov stability certificate for (ULS), the uncertainty set being U.

Proof of Proposition 3.3.1. The derivative $\begin{array}{r}{\frac{d}{dt} \left[x^{T}(t) Xx(t) \right]} \end{array}$ of the quadratic function $x^{T} Xx$ along a trajectory of (ULS) is equal to

$$
\left[\frac{d}{dt} x(t) \right]^{T} Xx(t) + x^{T}(t) X \left[\frac{d}{dt} x(t) \right] = x^{T}(t)[A^{T}(t) X + XA(t)] x(t).
$$

If $x^{T} Xx$ is a Lyapunov function, then the resulting quantity must be at most $- \alpha x^{T}(t) Xx(t)$ i.e., we should have

$$
x^{T}(t) \left[- \alpha X - A^{T}(t) X - XA(t) \right] x(t) \geq 0
$$

for every possible value of $A(t)$ at any time t and for every possible value $x(t)$ of a trajectory of the system at this time. Since possible values of $x(t)$ fill the entire $\mathbb{R}^{n}$ and possible values of $A(t)$ fill the entire $\mathcal{U},$ we conclude that

$$
- \alpha X - A^{T} X - XA \succeq 0 \quad \forall A \in \mathcal{U}.
$$

By definition of a quadratic Lyapunov function, $X \succ 0$ and $\alpha > 0;$ ; by normalization (dividing both X and α by the smallest eigenvalue of X), we get a pair $\hat{s} > 0, \hat{X} \ge I_{n}$ such that

$$
- \hat{s} \hat{X} - A^{T} \hat{X} - \hat{X} A \succeq 0 \quad \forall A \in \mathcal{U}.
$$

Since $\hat{X} \succeq I_{n}$ , we conclude that

$$
- \hat{s} I_{n} - A^{T} \hat{X} - \hat{X} A \succeq \hat{s} \hat{X} - A^{T} \hat{X} - \hat{X} A \succeq 0 \quad \forall A \in \mathcal{U};
$$

thus, $(s = - \hat{s}, \hat{X})$ is a feasible solution to $(\mathrm{Ly})$ with negative value of the objective. We have demonstrated that if (ULS) admits a quadratic Lyapunov function, then $(\mathrm{Ly})$ has a feasible solution with negative value of the objective. Reversing the reasoning, we can verify the inverse implication. ✷

Lyapunov stability analysis. According to Proposition 3.3.1, the existence of a Lyapunov stability certificate is a sufficient, but, in general, not a necessary stability condition for (ULS). When the condition is not satisfied $(\mathrm{i.e.,}$ if the optimal value in $\mathrm{(Ly)}$ is nonnegative), then all we can say is that the stability of (ULS) cannot be certified by a quadratic Lyapunov function, although (ULS) still may be stable.<sup>10)</sup> In this sense, the stability analysis based on quadratic Lyapunov functions is conservative. This drawback, however, is in a sense compensated by the fact that this kind of stability analysis is “implementable”: in many cases we can eficiently solve $\mathrm{(Ly)}$ , thus getting a quadratic “stability certificate”, provided that it exists, in a constructive way. Let us look at two such cases.

Polytopic uncertainty set. The first “tractable case” of (Ly) is when U is a polytope given as a convex hull of finitely many points:

$$
\mathcal{U} = \operatorname{Conv} \left\{A_{1}, \dots, A_{N} \right\}.
$$

In this case (Ly) is equivalent to the semidefinite program

$$
\min_{s, X} \left\{s: sI_{n} - A_{i}^{T} X - XA_{i} \succeq 0, i = 1,..., N; X \succeq I_{n} \right\}\tag{3.3.8}
$$

(why?).

The assumption that U is a polytope given as a convex hull of a finite set is crucial for a possibility to get a “computationally tractable” equivalent reformulation of (Ly). If U is, say, a polytope given by a list of linear inequalities (e.g., all we know about the entries of $A(t)$ is that they reside in certain intervals; this case is called “interval uncertainty”), (Ly) may become as hard as a problem can be: it may happen that just to check whether a given pair $(s, X)$ is feasible for (Ly) is already a “computationally intractable” problem. The same dificulties may occur when U is a general-type ellipsoid in the space of $n \times n$ matrices. There exists, however, a specific type of “uncertainty ellipsoids” U for which (Ly) is “easy”. Let us look at this case.

Norm-bounded perturbations. In numerous applications the $n \times n$ matrices A forming the uncertainty set U are obtained from a fixed “nominal” matrix A<sub>∗</sub> by adding perturbations of the form $B \Delta C,$ , where $B \in \mathbf{M}^{n, k}$ and $C \in \mathbf{M}^{l, n}$ are given rectangular matrices and $\Delta \in \mathbf{M}^{k, l}$ is “the perturbation” varying in a “simple” set D:

$$
\mathcal{U} = \left\{A = A_{*} + B \Delta C \mid \Delta \in \mathcal{D} \subset \mathbf{M}^{k, l} \right\} \quad \left[B \in \mathbf{M}^{n, k}, 0 \neq C \in \mathbf{M}^{l, n} \right]\tag{3.3.9}
$$

As an instructive example, consider a controlled linear time-invariant dynamic system

$$
\begin{array}{rcl} \frac{d}{dt} x(t) & = & Ax(t) + Bu(t) \\ y(t) & = & Cx(t) \end{array}\tag{3.3.10}
$$

(x is the state, u is the control and y is the output we can observe) “closed” by a feedback

$$
u(t) = Ky(t).
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/e59703f2f37b2efa421529ea165811e8c101d1765a4280538ccfc76e24837f9b.jpg)  
Open loop (left) and closed loop (right) controlled systems

The resulting “closed loop system” is given by

$$
\frac{d}{dt} x(t) = \hat{A} x(t), \quad \hat{A} = A + BKC.\tag{3.3.11}
$$

Now assume that A, B and C are constant and known, but the feedback K is drifting around certain nominal feedback $K^{*} \colon K = K^{*} + \Delta$ . As a result, the matrix A<sup>ˆ</sup> of the closed loop system also drifts around its nominal value $A^{*} = A + BK^{*} C$ , and the perturbations in A<sup>ˆ</sup> are exactly of the form $B \Delta C$

Note that we could get essentially the same kind of drift in A<sup>ˆ</sup> assuming, instead of additive perturbations, multiplicative perturbations $C =(I_{l} + \Delta) C^{*}$ in the observer (or multiplicative disturbances in the actuator B).

Now assume that the input perturbations $\Delta$ are of spectral norm $| \Delta |$ not exceeding a given $\rho$ (norm-bounded perturbations):

$$
\mathcal{D} = \{\Delta \in \mathbf{M}^{k, l} \mid | \Delta | \leq \rho\}.\tag{3.3.12}
$$

Proposition 3.3.2 [18] In the case of uncertainty set (3.3.9), (3.3.12) the “semi-infinite” semidefinite program $(\mathrm{Ly})$ is equivalent to the usual semidefinite program

$$
\begin{array}{ccc} \text{minimize} & \alpha \\ & \text{s.t.} \\ \left(\begin{array}{cc} \alpha I_{n} - A_{*}^{T} X - XA_{*} - \lambda C^{T} C & \rho XB \\ \rho B^{T} X & \lambda I_{k} \end{array} \right) & \succeq & 0 \\ X & \succeq & I_{n} \end{array}\tag{3.3.13}
$$

in the design variables $\alpha, \lambda, X$

When shrinking the set of perturbations (3.3.12) to the ellipsoid

$$
\mathcal{E} = \{\Delta \in \mathbf{M}^{k, l} \mid \| \Delta \|_{2} \equiv \sqrt{\sum_{i = 1}^{k} \sum_{j = 1}^{l} \Delta_{ij}^{2}} \leq \rho\}, \tag{11}\tag{3.3.14}
$$

we basically do not vary $\mathrm{(Ly)}$ : in the case of the uncertainty set (3.3.9), $(\mathrm{Ly})$ is still equivalent to (3.3.13).

Proof. It sufices to verify the following general statement:

Lemma 3.3.2 [18] Consider the matrix inequality

$$
Y - Q^{T} \Delta^{T} P^{T} Z^{T} R - \mathbb{R}^{T} ZP \Delta Q \succeq 0\tag{3.3.15}
$$

where Y is symmetric $n \times n$ matrix, $\Delta$ is a k×l matrix and $P, Q, Z, R$ are rectangular matrices of appropriate sizes $(i.e., \q \times k, \l \times n, \p \times q$ and $p \times n$ , respectively). Given Y, P, Q, Z, R, with $Q \neq 0$ (this is the only nontrivial case), this matrix inequality is satisfied for all $\Delta$ with $| \Delta | \le \rho$ if and only if it is satisfied for all $\Delta$ with $\| \Delta \|_{2} \le \rho,$ and this is the case $if$ and only if

$$
\left(\begin{array}{cc} Y - \lambda Q^{T} Q & - \rho \mathbb{R}^{T} ZP \\ - \rho P^{T} Z^{T} R & \lambda I_{k} \end{array} \right) \succeq 0
$$

for a properly chosen real λ.

The statement of Proposition 3.4.14 is just a particular case of Lemma 3.3.2. For example, in the case of uncertainty set (3.3.9), (3.3.12) a pair $(\alpha, X)$ is a feasible solution to (Ly) if and only if $X \succeq I_{n}$ and (3.3.15) is valid for $Y = \alpha X - A_{*}^{T} X - XA_{*}, P = B, Q = C, Z = X, R = I_{n};$ Lemma 3.3.2 provides us with an LMI reformulation of the latter property, and this LMI is exactly what we see in the statement of Proposition 3.4.14.

Proof of Lemma. (3.3.15) is valid for all $\Delta$ with $| \Delta | \le \rho$ (let us call this property of $(Y, P, Q, Z, R)$ “Property 1”) if and only if

$$
2[\xi^{T} \mathbb{R}^{T} ZP] \Delta[Q \xi] \leq \xi^{T} Y \xi \quad \forall \xi \in \mathbb{R}^{n} \quad \forall(\Delta : | \Delta | \leq \rho),
$$

or, which is the same, if and only if

$$
\max_{\Delta : | \Delta | \leq \rho} 2 \left[[P^{T} Z^{T} R \xi]^{T} \Delta[Q \xi] \right] \leq \xi^{T} Y \xi \quad \forall \xi \in \mathbb{R}^{n}.\tag{Property2}
$$

The maximum over $\Delta, | \Delta | \le \rho,$ of the quantity $\eta^{T} \Delta \zeta.$ , clearly is equal to $\rho$ times the product of the Euclidean norms of the vectors η and $\zeta \ \mathrm{(why ?)}$ . Thus, Property 2 is equivalent to

$$
\xi^{T} Y \xi - 2 \rho \| Q \xi \|_{2} \| P^{T} Z^{T} R \xi \|_{2} \geq 0 \quad \forall \xi \in \mathbb{R}^{n}.\tag{Property3}
$$

Now is the trick: Property 3 is clearly equivalent to the following

Property 4: Every pair $\boldsymbol{\zeta} =(\xi, \eta) \in \mathbb{R}^{n} \times \mathbb{R}^{k}$ which satisfies the quadratic inequality

$$
\xi^{T} Q^{T} Q \xi - \eta^{T} \eta \geq 0\tag{I}
$$

satisfies also the quadratic inequality

$$
\xi^{T} Y \xi - 2 \rho \eta^{T} P^{T} Z^{T} R \xi \geq 0.\tag{II}
$$

Indeed, for a fixed ξ the minimum over η satisfying (I) of the left hand side in (II) is nothing but the left hand side in (Property 3).

It remains to use the S-Lemma:

S-Lemma. Let A, B be symmetric $n \times n$ matrices, and assume that the quadratic inequality

$$
x^{T} Ax \geq 0\tag{A}
$$

is strictly feasible: there exists x¯ such that $\bar{x}^{T} A \bar{x} > 0$ . Then the quadratic inequality

$$
x^{T} Bx \geq 0\tag{B}
$$

is a consequence of $\mathrm{(A)}$ if and only if it is a linear consequence of (A), i.e., if and only if there exists a nonnegative λ such that

$$
B \succeq \lambda A.
$$

(for a proof, see Section 3.5). Property 4 says that the quadratic inequality (II) with variables $\xi, \eta$ is a consequence of (I); by the S-Lemma (recall that $Q \neq 0$ , so that (I) is strictly feasible!) this is equivalent to the existence of a nonnegative λ such that

$$
\left(\begin{array}{cc} Y & - \rho \mathbb{R}^{T} ZP \\ - \rho P^{T} Z^{T} R \end{array} \right) - \lambda \left(\begin{array}{cc} Q^{T} Q & \\ & - I_{k} \end{array} \right) \succeq 0,
$$

which is exactly the statement of Lemma 3.3.2 for the case of $| \Delta | \leq \rho.$ The case of perturbations with $\| \Delta \|_{2} \le \rho$ is completely similar, since the equivalence between Properties 2 and 3 is valid independently of which norm of $\Delta - | \cdot |$ or $\parallel \cdot \parallel_{2} -$ is used. ✷

It is worthy of mentioning that Lemma 3.3.2 admits the following useful

Corollary 3.3.1 Let $a, b$ be two nonzero vectors from $\mathbb{R}^{n}$ and $Y \in \mathbf{S}^{n}$ . Relation

$$
Y \succeq \pm[ab^{T} + ba^{T}]\tag{!}
$$

holds true of and only if there exists $\lambda > 0$ such that

$$
Y \succeq \lambda aa^{T} + \lambda^{- 1} bb^{T}.
$$

$or,$ which is the same $by$ Schur Complement Lemma, if and only if there exists λ such that

$$
\left[\begin{array}{cc} Y - \lambda aa^{T} & b \\ \hline b^{T} & \lambda \end{array} \right] \succeq 0.\tag{3.3.16}
$$

Note that the case $n = 1$ of Corollary is the following well-known fact: For two nonzero reals $a, b, \y \ \geq \2 | ab |$ if and only if there exists positive λ such that $y \ge$ $\lambda a^{2} + \lambda^{- 1} b^{2}$ , or, which is the same, For two nonzero reals $a, b,$ , min $\mathsf{1}_{\lambda > 0}[\lambda a^{2} + \lambda^{- 1} b^{2}]$ is achieved and is equal to $2 | ab |$

To prove Corollary, note that (!) is exactly the same as the relation

$$
X + a \Delta^{T} b^{T} + b \Delta a^{T} \succeq 0 \forall(\Delta \in \mathbb{R}^{1 \times 1}: | \Delta | \leq 1),
$$

that is, this is relation (3.3.15) with $\rho = 1, Q = a^{T} \in{\bf R}^{1 \times n}, R = b^{T} \in{\bf R}^{1 \times n}$ and $Z = P = 1 \in$ $\mathbb{R}^{1 \times 1}$ (i.e., in the notation from Lemma 3.3.2, $k = l = p = q = 1)$ . By Lemma, (!) takes place if and only if there exists λ such that (3.3.16) takes place, and since $b \neq 0$ , this λ must be positive. ✷

## 3.3.4.3 Lyapunov Stability Synthesis

We have seen that under reasonable assumptions on the underlying uncertainty set the question of whether a given uncertain linear system (ULS) admits a quadratic Lyapunov function can be reduced to a semidefinite program. Now let us switch from the analysis question: “whether a stability of an uncertain linear system may be certified by a quadratic Lyapunov function” to the synthesis question which is as follows. Assume that we are given an uncertain open loop controlled system

$$
\begin{array}{rcl} \frac{d}{dt} x(t) & = & A(t) x(t) + B(t) u(t) \\ y(t) & = & C(t) x(t); \end{array}\tag{UOS}
$$

all we know about the collection $(A(t), B(t), C(t))$ of time-varying $n \times n$ matrix $A(t), n \times k$ matrix $B(t)$ and $l \times n$ matrix $C(t)$ is that this collection, at every time t, belongs to a given uncertainty set U. The question is whether we can equip our uncertain “open loop” system (UOS) with a linear feedback

$$
u(t) = Ky(t)
$$

in such a way that the resulting uncertain closed loop system

$$
{\frac{d}{dt}} x(t) =[A(t) + B(t) KC(t)] x(t)\tag{UCS}
$$

will be stable and, moreover, such that its stability can be certified by a quadratic Lyapunov function. In other words, now we are simultaneously looking for a “stabilizing controller” and a quadratic Lyapunov certificate of its stabilizing ability.

With the “global linearization” trick we may use the results on uncertain controlled linear systems to build stabilizing linear controllers for nonlinear controlled systems

$$
\begin{array}{rlr} \frac{d}{dt} x(t) & = & f(t, x(t), u(t)) \\ y(t) & = & g(t, x(t)) \end{array}
$$

Assuming $f(t, 0, 0) = 0, g(t, 0) = 0$ and denoting by U the closed convex hull of the set

$$
\left\{\left(\frac{\partial}{\partial x} f(t, x, u), \frac{\partial}{\partial u} f(t, x, u), \frac{\partial}{\partial x} g(t, x)\right) \Bigg | t \geq 0, x \in \mathbb{R}^{n}, u \in \mathbb{R}^{k} \right\},
$$

we see that every trajectory of the original nonlinear system is a trajectory of the uncertain linear system (UOS) associated with the set U. Consequently, if we are able to find a stabilizing controller for (UOS) and certify its stabilizing property by a quadratic Lyapunov function, then the resulting controller/Lyapunov function will stabilize the nonlinear system and will certify the stability of the closed loop system, respectively.

Exactly the same reasoning as in the previous Section leads us to the following

Proposition 3.3.3 Let U be the uncertainty set associated with an uncertain open loop controlled system (UOS). The system admits a stabilizing controller along with a quadratic Lyapunov stability certificate for the resulting closed loop system if and only if the optimal value in the optimization problem

minimize

s.t.

$$
\begin{array}{cccc} s & \\[A + BKC]^{T} X + X[A + BKC] & \preceq & sI_{n} & \forall(A, B, C) \in \mathcal{U} \\ X & \succeq & I_{n}, \end{array}\tag{LyS}
$$

in design variables $s, X, K$ , is negative. Moreover, every feasible solution to the problem with negative value of the objective provides stabilizing controller along with quadratic Lyapunov stability certificate for the resulting closed loop system.

A bad news about (LyS) is that it is much more dificult to rewrite this problem as a semidefinite program than in the analysis case (i.e., the case of $K = 0)$ , since (LyS) is a semiinfinite system of nonlinear matrix inequalities. There is, however, an important particular case where this dificulty can be eliminated. This is the case of a feedback via the full state vector – the case when $y(t) = x(t) \(\mathrm{i.e.,} \C(t)$ is the unit matrix). In this case, all we need in order to get a stabilizing controller along with a quadratic Lyapunov certificate of its stabilizing ability, is to solve a system of strict matrix inequalities

$$
\begin{array}{rcl}[A + BK]^{T} X + X[A + BK] & \preceq & Z \prec 0 \quad \forall(A, B) \in \mathcal{U} \\ X & \succ & 0 \end{array}.\tag{\((*)\}
$$

Indeed, given a solution $(X, K, Z)$ to this system, we always can convert it by normalization of X to a solution of $\mathrm{(LyS)}$ . Now let us make the change of variables

$$
Y = X^{- 1}, L = KX^{- 1}, W = X^{- 1} ZX^{- 1} \quad \left[\Leftrightarrow X = Y^{- 1}, K = LY^{- 1}, Z = Y^{- 1} WY^{- 1} \right].
$$

With respect to the new variables $Y, L, K$ system (\*) becomes

$$
\left\{\begin{array}{rcl}[A + BLY^{- 1}]^{T} Y^{- 1} + Y^{- 1}[A + BLY^{- 1}] & \preceq & Y^{- 1} WY^{- 1} \prec 0 \\ Y^{- 1} & \succ & 0 \end{array} \right.
$$

$$
\left\{\begin{array}{ccc} L^{T} B^{T} + YA^{T} + BL + AY & \preceq & W \prec 0, \quad \forall(A, B) \in \mathcal{U} \\ Y & \succ & 0 \end{array} \right.
$$

(we have multiplied all original matrix inequalities from the left and from the right by Y ). What we end up with, is a system of strict linear matrix inequalities with respect to our new design variables $L, Y, W;$ the question of whether this system is solvable can be converted to the question of whether the optimal value in a problem of the type $\mathrm{(LyS)}$ is negative, and we come to the following

Proposition 3.3.4 Consider an uncertain controlled linear system with a full observer:

$$
\begin{array}{rcl} \frac{d}{dt} x(t) & = & A(t) x(t) + B(t) u(t) \\ y(t) & = & x(t) \end{array}
$$

and let U be the corresponding uncertainty set (which now is comprised of pairs $(A, B)$ of possible values of $(A(t), B(t))$ , since $C(t) \equiv I_{n}$ is certain).

The system can be stabilized by a linear controller

$$
u(t) = Ky(t) \quad[\equiv Kx(t)]
$$

in such a way that the resulting uncertain closed loop system

$$
\frac{d}{dt} x(t) =[A(t) + B(t) K] x(t)
$$

admits a quadratic Lyapunov stability certificate if and only if the optimal value in the optimization problem

minimize

s.t.

$$
\begin{array}{rcl} BL + AY + L^{T} B^{T} + YA^{T} & \preceq & sI_{n} \quad \forall(A, B) \in \mathcal{U} \\ Y & \succeq & I \end{array}\tag{Ly \(^{*} \)}
$$

in the design variables $s \in \mathbb{R}, Y \in \mathbf{S}^{n}, L \in \mathbf{M}^{k, n}$ , is negative. Moreover, every feasible solution to $\left(\mathrm{Ly^{*}} \right)$ with negative value of the objective provides a stabilizing linear controller along with related quadratic Lyapunov stability certificate.

In particular, in the polytopic case:

$$
\mathcal{U} = \operatorname{Conv} \left\{\left(A_{1}, B_{1}\right), \dots, \left(A_{N}, B_{N}\right) \right\}
$$

the Quadratic Lyapunov Stability Synthesis reduces to solving the semidefinite program

$$
\min_{s, Y, L} \left\{s: B_{i} L + A_{i} Y + YA_{i}^{T} + L^{T} B_{i}^{T} \preceq sI_{n}, i = 1,..., N; Y \succeq I_{n} \right\}.
$$

## 3.4 Semidefinite relaxations of intractable problems

One of the most challenging and promising applications of Semidefinite Programming is in building tractable approximations of “computationally intractable” optimization problems. Let us look at several applications of this type.

## 3.4.1 Semidefinite relaxations of combinatorial problems

## 3.4.1.1 Combinatorial problems and their relaxations

Numerous problems of planning, scheduling, routing, etc., can be posed as combinatorial optimization problems, i.e., optimization programs with discrete design variables (integer or zeroone). There are several “universal forms” of combinatorial problems, among them Linear Programming with integer variables and Linear Programming with 0-1 variables; a problem given in one of these forms can always be converted to any other universal form, so that in principle it does not matter which form to use. Now, the majority of combinatorial problems are dificult – we do not know theoretically efficient (in certain precise meaning of the notion) algorithms for solving these problems. What we do know is that nearly all these dificult problems are, in a sense, equivalent to each other and are NP-complete. The exact meaning of the latter notion will be explained in Lecture 4; for the time being it sufices to say that NP-completeness of a problem P means that the problem is “as dificult as a combinatorial problem can be” – if we knew an efficient algorithm for P , we would be able to convert it to an efficient algorithm fo any other combinatorial problem. NP-complete problems may look extremely “simple”, as it is demonstrated by the following example:

(Stones) Given n stones of positive integer weights $(\boldsymbol{i.\mathrm{e.,}}$ given n positive integers $a_{1},..., a_{n})$ , check whether you can partition these stones into two groups of equal weight, i.e., check whether a linear equation

$$
\sum_{i = 1}^{n} a_{i} x_{i} = 0
$$

has a solution with $x_{i} = \pm 1$

Theoretically dificult combinatorial problems happen to be dificult to solve in practice as well. An important ingredient in basically all algorithms for combinatorial optimization is a technique for building bounds for the unknown optimal value of a given (sub)problem. A typical way to estimate the optimal value of an optimization program

$$
f^{*} = \min_{x} \{f(x): x \in X\}
$$

from above is to present a feasible solution $\bar{x};$ then clearly $f^{*} \leq f(\bar{x})$ . And a typical way to bound the optimal value from below is to pass from the problem to its relaxation

$$
f_{*} = \min_{x} \{f(x): x \in X^{\prime}\}
$$

increasing the feasible set: $X \subset X^{\prime}$ . Clearly, $f_{*} \leq f^{*}$ , so, whenever the relaxation is eficiently solvable (to ensure this, we should take care of how we choose $X^{\prime})$ , it provides us with a “computable” lower bound on the actual optimal value.

When building a relaxation, one should take care of two issues: on one hand, we want the relaxation to be “eficiently solvable”. On the other hand, we want the relaxation to be “tight”, otherwise the lower bound we get may be by far “too optimistic” and therefore not useful. For a long time, the only practical relaxations were the LP ones, since these were the only problems one could solve eficiently. With recent progress in optimization techniques, nonlinear relaxations become more and more “practical”; as a result, we are witnessing a growing theoretical and computational activity in the area of nonlinear relaxations of combinatorial problems. These developments mostly deal with semidefinite relaxations. Let us look how they emerge.

## 3.4.1.2 Shor’s Semidefinite Relaxation scheme

As it was already mentioned, there are numerous “universal forms” of combinatorial problems. $\mathrm{E.g.}$ , a combinatorial problem can be posed as minimizing a quadratic objective under quadratic inequality constraints:

$$
\begin{array}{ll} \text{minimize in} x \in \mathbb{R}^{n} & f_{0}(x) = x^{T} A_{0} x + 2b_{0}^{T} x + c_{0} \\ \text{s.t.} & \\ & f_{i}(x) = x^{T} A_{i} x + 2b_{i}^{T} x + c_{i} \leq 0, i = 1,..., m.\end{array}\tag{3.4.1}
$$

To see that this form is “universal”, note that it covers the classical universal combinatorial problem – a generic LP program with Boolean (0-1) variables:

$$
\min_{x} \left\{c^{T} x: a_{i}^{T} x - b_{i} \leq 0, i = 1,..., m; x_{j} \in \{0, 1\}, j = 1,..., n \right\}\tag{B}
$$

Indeed, the fact that a variable $x_{j}$ must be Boolean can be expressed by the quadratic equality

$$
x_{j}^{2} - x_{j} = 0,
$$

which can be represented by a pair of opposite quadratic inequalities and a linear inequality $a_{i}^{T} x - b_{i} \leq 0$ is a particular case of quadratic inequality. Thus, (B) is equivalent to the problem

$$
\min_{x, s} \left\{c^{T} x: a_{i}^{T} x - b_{i} \leq 0, i = 1,..., m; x_{j}^{2} - x_{j} \leq 0, - x_{j}^{2} + x_{j} \leq 0j = 1,..., n \right\},
$$

and this problem is of the form (3.4.1).

To bound from below the optimal value in (3.4.1), we may use the same technique we used for building the dual problem (it is called the Lagrange relaxation). We choose somehow “weights” $\lambda_{i} \ge 0, i = 1,..., m$ , and add the constraints of (3.4.1) with these weights to the objective, thus coming to the function

$$
\begin{array}{rcl}{f_{\lambda}(x)} & = &{f_{0}(x) + \sum_{i = 1}^{m} \lambda_{i} f_{i}(x)} \\ & = &{x^{T} A(\lambda) x + 2b^{T}(\lambda) x + c(\lambda),} \end{array}\tag{3.4.2}
$$

where

$$
\begin{array}{rcl} A(\lambda) & = & A_{0} + \sum_{i = 1}^{m} \lambda_{i} A_{i} \\ b(\lambda) & = & b_{0} + \sum_{i = 1}^{m} \lambda_{i} b_{i} \\ c(\lambda) & = & c_{0} + \sum_{i = 1}^{m} \lambda_{i} c_{i} \end{array}
$$

By construction, the function $f_{\lambda}(x){\mathrm{~ is ~}} \leq$ the actual objective $f_{0}(x)$ on the feasible set of the problem (3.4.1). Consequently, the unconstrained infimum of this function

$$
a(\lambda) = \inf_{x \in \mathbb{R}^{n}} f_{\lambda}(x)
$$

is a lower bound for the optimal value in (3.4.1). We come to the following simple result (cf. the Weak Duality Theorem:)

(\*) Assume that $\lambda \in \mathbb{R}_{+}^{m}$ and $\zeta \in \mathbb{R}$ are such that

$$
f_{\lambda}(x) - \zeta \geq 0 \quad \forall x \in \mathbb{R}^{n}\tag{3.4.3}
$$

(i.e., that $\zeta \leq a(\lambda))$ . Then $\zeta$ is a lower bound for the optimal value in (3.4.1).

It remains to clarify what does it mean that (3.4.3) holds. Recalling the structure of $f_{\lambda},$ , we see that it means that the inhomogeneous quadratic form

$$
g_{\lambda}(x) = x^{T} A(\lambda) x + 2b^{T}(\lambda) x + c(\lambda) - \zeta
$$

is nonnegative on the entire space. Now, an inhomogeneous quadratic form

$$
g(x) = x^{T} Ax + 2b^{T} x + c
$$

is nonnegative everywhere if and only if certain associated homogeneous quadratic form is nonnegative everywhere. Indeed, given $t \neq 0$ and $x \in \mathbb{R}^{n}$ , the fact that $g(t^{- 1} x) \geq 0$ means exactly the nonnegativity of the homogeneous quadratic form $G(x, t)$

$$
G(x, t) = x^{T} Ax + 2tb^{T} x + ct^{2}
$$

with $(n + 1)$ variables $x, t.$ We see that if g is nonnegative, then $G$ is nonnegative whenever $t \neq 0;$ by continuity, G then is nonnegative everywhere. Thus, if g is nonnegative, then G is, and of course vice versa (since $g(x) = G(x, 1))$ . Now, to say that $G$ is nonnegative everywhere is literally the same as to say that the matrix

$$
\left(\begin{array}{cc} c & b^{T} \\ b & A \end{array} \right)\tag{3.4.4}
$$

is positive semidefinite.

It is worthy to catalogue our simple observation:

Simple Lemma. A quadratic inequality with a (symmetric) $n \times n$ matrix A

$$
x^{T} Ax + 2b^{T} x + c \geq 0
$$

is identically $true \mathrm{~ - ~} is$ valid for all $x \in \mathbb{R}^{n} - if$ only if the matrix (3.4.4) is positive semidefinite.

Applying this observation to $g_{\lambda}(x)$ , we get the following equivalent reformulation of $(^{*})$ :

${\cal I} f \left(\lambda, \zeta \right) \in{\bf R}_{+}^{m} \times{\bf R}$ satisfy the LMI

$$
\left(\begin{array}{cc} \sum_{i = 1}^{m} \lambda_{i} c_{i} - \zeta & b_{0}^{T} + \sum_{i = 1}^{m} \lambda_{i} b_{i}^{T} \\ b_{0} + \sum_{i = 1}^{m} \lambda_{i} b_{i} & A_{0} + \sum_{i = 1}^{m} \lambda_{i} A_{i} \end{array} \right) \succeq 0,
$$

then ζ is a lower bound for the optimal value in (3.4.1).

Now, what is the best lower bound we can get with this scheme? Of course, it is the optimal value of the semidefinite program

$$
\max_{\zeta, \lambda} \left\{\zeta : \left(\begin{array}{cc} c_{0} + \sum_{i = 1}^{m} \lambda_{i} c_{i} - \zeta & b_{0}^{T} + \sum_{i = 1}^{m} \lambda_{i} b_{i}^{T} \\ b_{0} + \sum_{i = 1}^{m} \lambda_{i} b_{i} & A_{0} + \sum_{i = 1}^{m} \lambda_{i} A_{i} \end{array} \right) \succeq 0, \lambda \geq 0 \right\}.\tag{3.4.5}
$$

We have proved the following simple


<!-- MinerU source pages 201-400 -->

Proposition 3.4.1 The optimal value in (3.4.5) is a lower bound for the optimal value in (3.4.1).

The outlined scheme is extremely transparent, but it looks different from a relaxation scheme as explained above – where is the extension of the feasible set of the original problem? In fact the scheme is of this type. To see it, note that the value of a quadratic form at a point $\boldsymbol{x} \in \mathbb{R}^{n}$ can be written as the Frobenius inner product of a matrix defined by the problem data and the dyadic matrix $X(x) ={\binom{1}{x}} \left({\begin{array}{l}{1} \\{x} \end{array}} \right)^{T}$ :

$$
x^{T} Ax + 2b^{T} x + c = \binom{1}{x}^{T} \left(\begin{array}{cc} c & b^{T} \\ b & A \end{array} \right) \binom{1}{x} = \operatorname{Tr} \left(\left(\begin{array}{cc} c & b^{T} \\ b & A \end{array} \right) X(x)\right).
$$

Consequently, (3.4.1) can be written as

$$
\min_{x} \left\{\operatorname{Tr} \left(\left(\begin{array}{cc} c_{0} & b_{0}^{T} \\ b_{0} & A_{0} \end{array} \right) X(x)\right): \operatorname{Tr} \left(\left(\begin{array}{cc} c_{i} & b_{i}^{T} \\ b_{i} & A_{i} \end{array} \right) X(x)\right) \leq 0, i = 1,..., m \right\}.\tag{3.4.6}
$$

Thus, we may think of (3.4.2) as a problem with linear objective and linear equality constraints and with the design vector X which is a symmetric $(n + 1) \times(n + 1)$ matrix running through the nonlinear manifold X of dyadic matrices $X(x), x \in \mathbb{R}^{n}$ . Clearly, all points of X are positive semidefinite matrices with North-Western entry 1. Now let $\bar{\mathcal X}$ be the set of all such matrices. Replacing X by X<sup>¯</sup>, we get a relaxation of (3.4.6) (the latter problem is, essentially, our original problem (3.4.1)). This relaxation is the semidefinite program

$$
\begin{array}{c} \min_{X} \left\{\operatorname{Tr}(\bar{A}_{0} X): \operatorname{Tr}(\bar{A}_{i} X) \leq 0, i = 1,..., m; X \succeq 0; X_{11} = 1 \right\} \\ \left[\bar{A}_{i} = \left(\begin{array}{cc} c_{i} & b_{i}^{T} \\ b_{i} & A_{i} \end{array} \right), i = 1,..., m \right].\end{array}\tag{3.4.7}
$$

We get the following

Proposition 3.4.2 The optimal value of the semidefinite program (3.4.7) is a lower bound for the optimal value in (3.4.1).

One can easily verify that problem (3.4.5) is just the semidefinite dual of (3.4.7); thus, when deriving (3.4.5), we were in fact implementing the idea of relaxation. This is why in the sequel we call both (3.4.7) and (3.4.5) semidefinite relaxations of (3.4.1).

## 3.4.1.3 When the semidefinite relaxation is exact?

In general, the optimal value in (3.4.7) is just a lower bound on the optimal value of (3.4.1). There are, however, two cases when this bound is exact. These are

- Convex case, where all quadratic forms in (3.4.1) are convex $(\mathrm{i.e., ~} Q_{i} \succeq 0, i = 0, 1,..., m)$ Here, strict feasibility of the problem (i.e., the existence of a feasible solution ¯x with $f_{i}(\bar{x}) < 0, i = 1,..., m)$ plus below boundedness of it imply that (3.4.7) is solvable with the optimal value equal to the one of (3.4.1). This statement is a particular case of the well-known Lagrange Duality Theorem in Convex Programming.

- The case of $m = 1$ . Here the optimal value in (3.4.1) is equal to the one in (3.4.7), provided that (3.4.1) is strictly feasible. This highly surprising fact (no convexity is assumed!) is called Inhomogeneous S-Lemma; we shall prove it in Section 3.5.2.

Let us look at several interesting examples of Semidefinite relaxations.

## 3.4.1.4 Stability number, Shannon and Lovasz capacities of a graph

Stability number of a graph. Consider a (non-oriented) graph – a finite set of nodes linked by arcs<sup>12)</sup>, like the simple 5-node graph $C_{5};$ :

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/432595f43ee9245f79142751e88ac1e58d39a6684502a8ec31b3fd257360b0aa.jpg)  
Graph C<sub>5</sub>  
One of the fundamental characteristics of a graph Γ is its stability number α(Γ) defined as the maximum cardinality of an independent subset of nodes – a subset such that no two nodes from it are linked by an arc. E.g., the stability number for the graph $C_{5}$ is 2, and a maximal independent set is, e.g., {A; C}.

The problem of computing the stability number of a given graph is NP-complete, this is why it is important to know how to bound this number.

Shannon capacity of a graph. An upper bound on the stability number of a graph which interesting by its own right is the Shannon capacity Θ(Γ) defined as follows.

Let us treat the nodes of Γ as letters of certain alphabet, and the arcs as possible errors in certain communication channel: you can send trough the channel one letter per unit time, and what arrives on the other end of the channel can be either the letter you have sent, or any letter adjacent to it. Now assume that you are planning to communicate with an addressee through the channel by sending n-letter words (n is fixed). You fix in advance a dictionary $D_{n}$ of words to be used and make this dictionary known to the addressee. What you are interested in when building the dictionary is to get a good one, meaning that no word from it could be transformed by the channel into another word from the dictionary. If your dictionary satisfies this requirement, you may be sure that the addressee will never misunderstand you: whatever word from the dictionary you send and whatever possible transmission errors occur, the addressee is able either to get the correct message, or to realize that the message was corrupted during transmission, but there is no risk that your “yes” will be read as “no!”. Now, in order to utilize the channel “at full capacity”, you are interested to get as large dictionary as possible. How many words it can include? The answer is clear: this is precisely the stability number of the graph $\Gamma^{n}$ as follows: the nodes of $\Gamma^{n}$ are ordered n-element collections of the nodes of Γ – all possible n-letter words in your alphabet; two distinct nodes $(i_{1},..., i_{n}) \(j_{1},..., j_{n})$ are adjacent in $\Gamma^{n}$ if and only if for every l the l-th letters $i_{l}$ and $j_{l}$ in the two words either coincide, or are adjacent in Γ (i.e., two distinct n-letter words are adjacent, if the transmission can convert one of them into the other one). Let us denote the maximum number of words in a “good” dictionary $D_{n} \{\mathrm{(i.e.}}$ , the stability number of $\Gamma^{n})$ by $f(n)$ , The function $f(n)$ possesses the following nice property:

$$
f(k) f(l) \leq f(k + l), k, l = 1, 2, \dots\tag{\((*)\}
$$

Indeed, given the best (of the cardinality $f(k))$ good dictionary $D_{k}$ and the best good dictionary $D_{l}$ , let us build a dictionary comprised of all $(k + l).$ -letter words as follows: the initial k-letter fragment of a word belongs to $D_{k}$ , and the remaining l-letter fragment belongs to $D_{l}$ . The resulting dictionary is clearly good and contains $f(k) f(l)$ words, and (\*) follows.

Now, this is a simple exercise in analysis to see that for a nonnegative function f with property (\*) one has

$$
\lim_{k \to \infty}(f(k))^{1 / k} = \sup_{k \geq 1}(f(k))^{1 / k} \in[0, + \infty].
$$

In our situation $\operatorname{sup}_{k \geq 1}(f(k))^{1 / k} < \infty.$ , since clearly $f(k) \leq n^{k}$ , n being the number of letters (the number of nodes in Γ). Consequently, the quantity

$$
\Theta(\Gamma) = \lim_{k \to \infty}(f(k))^{1 / k}
$$

is well-defined; moreover, for every k the quantity $(f(k))^{1 / k}$ is a lower bound for Θ(Γ). The number Θ(Γ) is called the Shannon capacity of Γ. Our immediate observation is that

(!) The Shannon capacity Θ(Γ) upper-bounds the stability number of Γ:

$$
\alpha(\Gamma) \leq \Theta(\Gamma).
$$

Indeed, as we remember, $(f(k))^{1 / k}$ is a lower bound for Θ(Γ) for every $k = 1, 2,...;$ setting $k = 1$ and taking into account that $f(1) = \alpha(\Gamma)$ , we get the desired result.

We see that the Shannon capacity number is an upper bound on the stability number; and this bound has a nice interpretation in terms of the Information Theory. The bad news is that we do not know how to compute the Shannon capacity. $\mathrm{E.g.}$ , what is it for the toy graph $C_{5} ?$

The stability number of $C_{5}$ clearly is 2, so that our first observation is that

$$
\Theta(C_{5}) \geq \alpha(C_{5}) = 2.
$$

To get a better estimate, let us look the graph $(C_{5})^{2}$ (as we remember, $\Theta(\Gamma) \geq(f(k))^{1 / k} =$ $(\alpha(\Gamma^{k}))^{1 / k}$ for every $k)$ . The graph $(C_{5})^{2}$ has 25 nodes, so that we do not draw it; it, however, is not that dificult to find its stability number, which turns out to be 5. A good 5-element dictionary $(\equiv a$ 5-node independent set in $(C_{5})^{2})$ is, e.g.,

$$
AA, BC, CE, DB, ED.
$$

Thus, we get

$$
\Theta(C_{5}) \geq \sqrt{\alpha((C_{5})^{2})} = \sqrt{5}.
$$

Attempts to compute the subsequent lower bounds $(f(k))^{1 / k}$ , as long as they are implementable (think how many vertices there are in $(C_{5})^{4} !)$ , do not yield any improvements, and for more than 20 years it remained unknown whether $\Theta(C_{5}) = \sqrt{5}$ or $\mathrm{is} > \sqrt{5}$ . And this is for a toy graph! The breakthrough in the area of upper bounds for the stability number is due to L. Lovasz who in early $70 \mathrm{{^{\circ} s}}$ found a new – computable! – bound of this type.

Lovasz capacity number. Given a n-node graph Γ, let us associate with it an Affine matrixvalued function $\mathcal{L}(x)$ taking values in the space of $n \times n$ symmetric matrices, namely, as follows:

- For every pair $i, j$ of indices $(1 \leq i, j \leq n)$ such that the nodes i and $j$ are not linked by an arc, the ij-th entry of $\mathcal{L}$ is equal to 1;

- For a pair $i < j$ of indices such that the nodes $i, j$ are linked by an arc, the ij-th and the $ji \mathrm{{- th}}$ entries in $\mathcal{L}$ are equal to $x_{ij} \ : -$ to the variable associated with the arc $(i, j)$

Thus, $\mathcal{L}(x)$ is indeed an Affine function of N design variables $x_{ij}$ , where N is the number of arcs in the graph. $\mathrm{E.g.}$ , for graph $C_{5}$ the function $\mathcal{L}$ is as follows:

$$
\mathcal{L} = \left(\begin{array}{ccccc} 1 & x_{AB} & 1 & 1 & x_{EA} \\ x_{AB} & 1 & x_{BC} & 1 & 1 \\ 1 & x_{BC} & 1 & x_{CD} & 1 \\ 1 & 1 & x_{CD} & 1 & x_{DE} \\ x_{EA} & 1 & 1 & x_{DE} & 1 \end{array} \right).
$$

Now, the Lovasz capacity number $\vartheta(\Gamma)$ is defined as the optimal value of the optimization program

$$
\min_{x} \left\{\lambda_{\max}(\mathcal{L}(x)) \right\},
$$

i.e., as the optimal value in the semidefinite program

$$
\min_{\lambda, x} \left\{\lambda : \lambda I_{n} - \mathcal{L}(x) \succeq 0 \right\}.\tag{L}
$$

Proposition 3.4.3 [Lovasz] The Lovasz capacity number is an upper bound for the Shannon capacity:

$$
\vartheta(\Gamma) \geq \Theta(\Gamma)
$$

and, consequently, for the stability number:

$$
\vartheta(\Gamma) \geq \Theta(\Gamma) \geq \alpha(\Gamma).
$$

For the graph $C_{5}$ , the Lovasz capacity can be easily computed analytically and turns out to be exactly ${\sqrt{5}}.$ . Thus, a small byproduct of Lovasz’s result is a solution to the problem which remained open for two decades.

Let us look how the Lovasz bound on the stability number can be obtained from the general relaxation scheme. To this end note that the stability number of an n-node graph $\Gamma$ is the optimal value of the following optimization problem with 0-1 variables:

$$
\max_{x} \left\{e^{T} x: x_{i} x_{j} = 0 \text{whenever} i, j \text{are adjacent nodes}, x_{i} \in \{0, 1\}, i = 1,..., n \right\},
$$

$$
e =(1, \dots, 1)^{T} \in \mathbb{R}^{n}.
$$

Indeed, 0-1 n-dimensional vectors can be identified with sets of nodes of Γ: the coordinates $x_{i}$ of the vector $x$ representing a set $A$ of nodes are ones for $i \in A$ and zeros otherwise. The quadratic equality constraints $x_{i} x_{j} = 0$ for such a vector express equivalently the fact that the corresponding set of nodes is independent, and the objective $e^{T}$ x counts the cardinality of this set.

As we remember, the 0-1 restrictions on the variables can be represented equivalently by quadratic equality constraints, so that the stability number of Γ is the optimal value of the following problem with quadratic (in fact linear) objective and quadratic equality constraints:

$$
\begin{array}{rlr} \mathrm{maximize} & e^{T} x \\ \mathrm{s.t.} & & \\ & x_{i} x_{j} = 0,(i, j) \mathrm{isanarc} \\ & x_{i}^{2} - x_{i} = 0, i = 1,..., n.\end{array}\tag{3.4.8}
$$

The latter problem is in the form of (3.4.1), with the only diference that the objective should be maximized rather than minimized. Switching from maximization of $e^{T} x$ to minimization of $(- e)^{T} x$ and passing to (3.4.5), we get the problem

$$
\max_{\zeta, \mu} \left\{\zeta : \left(\begin{array}{cc} - \zeta & - \frac{1}{2}(e + \mu)^{T} \\ - \frac{1}{2}(e + \mu) & A(\mu, \lambda) \end{array} \right) \succeq 0 \right\},
$$

where $\mu$ is n-dimensional and $A(\mu, \lambda)$ is as follows:

- The diagonal entries of $A(\mu, \lambda)$ are $\mu_{1},..., \mu_{n};$

- The of-diagonal cells ij corresponding to non-adjacent nodes $i, j \(\mathrm{^{4} empty \cells^{\cdots}})$ are zeros;

- The of-diagonal cells $ij, i < j$ , and the symmetric cells $ji$ corresponding to adjacent nodes $i, j \(^{\circ}{\mathrm{arc \cells^{\prime \prime}}})$ are filled with free variables $\lambda_{ij}$

Note that the optimal value in the resulting problem is a lower bound for minus the optimal value of (3.4.8), i.e., for minus the stability number of Γ.

Passing in the resulting problem from the variable ζ to a new variable $\xi = - \zeta$ and again switching from maximization of $\zeta = - \xi$ to minimization of $\xi,$ we end up with the semidefinite program

$$
\min_{\xi, \lambda, \mu} \left\{\xi : \left(\begin{array}{cc} \xi & - \frac{1}{2}(e + \mu)^{T} \\ - \frac{1}{2}(e + \mu) & A(\mu, \lambda) \end{array} \right) \succeq 0 \right\}.\tag{3.4.9}
$$

The optimal value in this problem is the minus optimal value in the previous one, which, in turn, is a lower bound on the minus stability number of $\Gamma;$ consequently, the optimal value in (3.4.9) is an upper bound on the stability number of Γ.

We have built a semidefinite relaxation (3.4.9) of the problem of computing the stability number of Γ; the optimal value in the relaxation is an upper bound on the stability number. To get the Lovasz relaxation, let us further fix the µ-variables at the level 1 (this may only increase the optimal value in the problem, so that it still will be an upper bound for the stability number)<sup>13)</sup>. With this modification, we come to the problem

$$
\min_{\xi, \lambda} \left\{\xi : \left(\begin{array}{cc} \xi & - e^{T} \\ - e & A(e, \lambda) \end{array} \right) \succeq 0 \right\}.
$$

In every feasible solution to the problem, ξ should be $\geq 1$ (it is an upper bound for $\alpha(\Gamma) \geq 1)$ . When $\xi \ge 1$ , the LMI

$$
\left(\begin{array}{cc} \xi & - e^{T} \\ e & A(e, \lambda) \end{array} \right) \succeq 0
$$

by the Schur Complement Lemma is equivalent to the LMI

$$
A(e, \lambda) \succeq(- e) \xi^{- 1}(- e)^{T},
$$

or, which is the same, to the LMI

$$
\xi A(e, \lambda) - ee^{T} \succeq 0.
$$

The left hand side matrix in the latter LMI is equal to $\xi I_{n} - B(\xi, \lambda)$ , where the matrix $B(\xi, \lambda)$ is as follows:

- The diagonal entries of $B(\xi, \lambda)$ are equal to 1;

- The of-diagonal “empty cells” are filled with ones;

- The “arc cells” from a symmetric pair of-diagonal pair $ij$ and $ji \(i < j)$ are filled with $\xi \lambda_{ij}$

Passing from the design variables λ to the new ones $x_{ij} = \xi \lambda_{ij}$ , we conclude that problem (3.4.9) with $\mu \mathrm{{s}}$ set to ones is equivalent to the problem

$$
\min_{\xi, x} \left\{\xi \rightarrow \min | \xi I_{n} - \mathcal{L}(x) \succeq 0 \right\},
$$

whose optimal value is exactly the Lovasz capacity number of Γ.

As a byproduct of our derivation, we get the easy part of the Lovasz Theorem – the inequality $\vartheta(\Gamma) \geq \alpha(\Gamma)$ ; this inequality, however, could be easily obtained directly from the definition of $\vartheta(\Gamma)$ . The advantage of our derivation is that it demonstrates what is the origin of $\vartheta(\Gamma)$

How good is the Lovasz capacity number? The Lovasz capacity number plays a crucial role in numerous graph-related problems; there is an important sub-family of graphs – perfect graphs – for which this number coincides with the stability number. However, for a general-type graph $\Gamma, \vartheta(\Gamma)$ may be a fairly poor bound for $\alpha(\Gamma)$ . Lovasz has proved that for any graph Γ with n nodes, $\vartheta(\Gamma) \vartheta(\hat{\Gamma}) \geq n.$ , where $\hat{\Gamma}$ is the complement to Γ (i.e., two distinct nodes are adjacent in Γ if and only if they are<sup>ˆ</sup> not adjacent in Γ). It follows that for n-node graph Γ one always has $\operatorname{max}[\vartheta(\Gamma), \vartheta(\hat{\Gamma})] \geq \sqrt{n}$ . On the other hand, it turns out that for a random n-node graph Γ (the arcs are drawn at random and independently of each other, with probability 0.5 to draw an arc linking two given distinct nodes) max $[\alpha(\Gamma), \alpha(\hat{\Gamma})]$ is “typically” (with probability approaching 1 as n grows) of order of ln n. It follows that for random n-node graphs a typical value of the ratio $\vartheta(\Gamma) / \alpha(\Gamma)$ is at least of order of $n^{1 / 2} /$ ln n; as n grows, this ratio blows up to ∞.

A natural question arises: are there “dificult” (NP-complete) combinatorial problems admitting “good” semidefinite relaxations – those with the quality of approximation not deteriorating as the sizes of instances grow? Let us look at two breakthrough results in this direction.

## 3.4.1.5 The MAXCUT problem and maximizing quadratic form over a box

The MAXCUT problem. The maximum cut problem is as follows:

Problem 3.4.1 [MAXCUT] Let Γ be an n-node graph, and let the arcs $(i, j)$ of the graph be associated with nonnegative $^{} weights^{\prime \prime} \a_{ij}$ . The problem is to find a cut of the largest possible weight, i.e., to partition the set of nodes in two parts $S, S^{\prime}$ in such a way that the total weight of all arcs “linking S and $S^{\prime}^{\prime}^{\prime} \left(i.e., \right.$ , with one incident node in S and the other one in $S^{\prime})$ is as large as possible.

In the MAXCUT problem, we may assume that the weights $a_{ij} = a_{ji} \geq 0$ are defined for every pair $i, j$ of indices; it sufices to set $a_{ij} = 0$ for pairs $i, j$ of non-adjacent nodes.

In contrast to the minimum cut problem (where we should minimize the weight of a cut instead of maximizing it), which is, basically, a nice LP program of finding the maximum flow in a network and is therefore eficiently solvable, the MAXCUT problem is as dificult as a combinatorial problem can be – it is NP-complete.

Theorem of Goemans and Williamson [24]. It is easy to build a semidefinite relaxation of MAXCUT. To this end let us pose MAXCUT as a quadratic problem with quadratic equality constraints. Let Γ be a n-node graph. A cut $(S, S^{\prime}) \mathrm{~ - ~ a ~}$ partitioning of the set of nodes in two disjoint parts $S, S^{\prime} -$ can be identified with a n-dimensional vector x with coordinates $\pm 1 -$ $x_{i} = 1$ for i ∈ S, $x_{i} = - 1$ for $i \in S^{\prime}$ . The quantity $\frac{1}{2} \sum_{i, j = 1}^{n} a_{ij} x_{i} x_{j}$ is the total weight of arcs with both ends either in $S$ or in $S^{\prime}$ minus the weight of the cut $(S, S^{\prime})$ ; consequently, the quantity

$$
{\frac{1}{2}} \left[{\frac{1}{2}} \sum_{i, j = 1}^{n} a_{ij} -{\frac{1}{2}} \sum_{i, j = 1}^{n} a_{ij} x_{i} x_{j} \right] ={\frac{1}{4}} \sum_{i, j = 1}^{n} a_{ij}(1 - x_{i} x_{j})
$$

is exactly the weight of the cut $(S, S^{\prime})$

We conclude that the MAXCUT problem can be posed as the following quadratic problem with quadratic equality constraints:

$$
\max_{x} \left\{\frac{1}{4} \sum_{i, j = 1}^{n} a_{ij}(1 - x_{i} x_{j}): x_{i}^{2} = 1, i = 1,..., n \right\}.\tag{3.4.10}
$$

For this problem, the semidefinite relaxation (3.4.7) after evident simplifications becomes the semidefinite program

$$
\begin{array}{rl} &{\mathrm{maximize} \quad \frac{1}{4} \sum_{i, j = 1}^{n} a_{ij}(1 - X_{ij})} \\ &{\mathrm{s.t.}} \\ &{\qquad X =[X_{ij}]_{i, j = 1}^{n} = X^{T} \succeq 0} \\ &{\qquad X_{ii} = 1, i = 1,..., n;} \end{array}\tag{3.4.11}
$$

the optimal value in the latter problem is an upper bound for the optimal value of MAXCUT.

The fact that (3.4.11) is a relaxation of (3.4.10) can be established directly, independently of any “general theory”: (3.4.10) is the problem of maximizing the objective

$$
\frac{1}{4} \sum_{i, j = 1}^{n} a_{ij} - \frac{1}{2} \sum_{i, j = 1}^{n} a_{ij} x_{i} x_{j} \equiv \frac{1}{4} \sum_{i, j = 1}^{n} a_{ij} - \frac{1}{4} \mathrm{Tr}(AX(x)), \quad X(x) = xx^{T}
$$

over all rank 1 matrices $X(x) = xx^{T}$ given by n-dimensional vectors x with entries ±1. All these matrices are symmetric positive semidefinite with unit entries on the diagonal, i.e., they belong the feasible set of (3.4.11). Thus, (3.4.11) indeed is a relaxation of (3.4.10).

The quality of the semidefinite relaxation (3.4.11) is given by the following brilliant result of Goemans and Williamson (1995):

Theorem 3.4.1 Let OP T be the optimal value of the MAXCUT problem (3.4.10), and SDP be the optimal value of the semidefinite relaxation (3.4.11). Then

$$
OPT \leq SDP \leq \alpha \cdot OPT, \alpha = 1.138 \dots\tag{3.4.12}
$$

Proof. The left inequality in (3.4.12) is what we already know – it simply says that semidefinite program (3.4.11) is a relaxation of MAXCUT. To get the right inequality, Goemans and Williamson act as follows. Let $X =[X_{ij}]$ be a feasible solution to the semidefinite relaxation. Since X is positive semidefinite, it is the covariance matrix of a Gaussian random vector ξ with zero mean, so that E $\{\xi_{i} \xi_{j}\} = X_{ij}$ . Now consider the random vector $\zeta = \mathrm{sign}[\xi]$ comprised of signs of the entries in ξ. A realization of ζ is almost surely a vector with coordinates ±1, i.e., it is a cut. What is the expected weight of this cut? A straightforward computation demonstrates that $\begin{array}{r}{\mathbb{E} \left\{\zeta_{i} \zeta_{j} \right\} = \frac{2}{\pi} \mathrm{asin}(X_{ij})^{14)}} \end{array}$ . It follows that

$$
\mathbb{E} \left\{\frac{1}{4} \sum_{i, j = 1}^{n} a_{ij}(1 - \zeta_{i} \zeta_{i}) \right\} = \frac{1}{4} \sum_{i, j = 1}^{n} a_{ij} \left(1 - \frac{2}{\pi} \mathrm{asin}(X_{ij})\right).\tag{3.4.13}
$$

Now, it is immediately seen that

$$
- 1 \leq t \leq 1 \Rightarrow 1 - \frac{2}{\pi} \mathrm{asin}(t) \geq \alpha^{- 1}(1 - t), \quad \alpha = 1.138...
$$

In view of $a_{ij} \geq 0$ , the latter observation combines with (3.4.13) to imply that

$$
\mathbb{E} \left\{\frac{1}{4} \sum_{i, j = 1}^{n} a_{ij}(1 - \zeta_{i} \zeta_{i}) \right\} \geq \alpha^{- 1} \frac{1}{4} \sum_{i, j = 1}^{n} a_{ij}(1 - X_{ij}).
$$

The left hand side in this inequality, by evident reasons, is $\le \mathit{OPT}$ . We have proved that the value of the objective in (3.4.11) at every feasible solution X to the problem is $\leq \alpha \cdot OPT$ 9 whence $SDP \le \alpha \cdot OPT$ as well. ✷

Note that the proof of Theorem 3.4.1 provides a randomized algorithm for building a suboptimal, within the factor $\alpha^{- 1} = 0.878....$ , solution to MAXCUT: we find a (nearly) optimal solution X to the semidefinite relaxation (3.4.11) of MAXCUT, generate a sample of, say, 100 realizations of the associated random cuts ζ and choose the one with the maximum weight.

## 3.4.1.6 Nesterov’s π Theorem

In the MAXCUT problem, we are in fact maximizing the homogeneous quadratic form

$$
x^{T} Ax \equiv \sum_{i = 1}^{n} \left(\sum_{j = 1}^{n} a_{ij}\right) x_{i}^{2} - \sum_{i, j = 1}^{n} a_{ij} x_{i} x_{j}
$$

over the set $S_{n}$ of n-dimensional vectors x with coordinates ±1. It is easily seen that the matrix A of this form is positive semidefinite and possesses a specific feature that the of-diagonal entries are nonpositive, while the sum of the entries in every row is 0. What happens when we are maximizing over $S_{n}$ a quadratic form $x^{T}$ Ax with a general-type (symmetric) matrix A? An extremely nice result in this direction was obtained by Yu. Nesterov. The cornerstone of Nesterov’s construction relates to the case when A is positive semidefinite, and this is the case we shall focus on. Note that the problem of maximizing a quadratic form $x^{T} Ax$ with positive semidefinite (and, say, integer) matrix $A$ over $S_{n}.$ , same as MAXCUT, is NP-complete.

The semidefinite relaxation of the problem

$$
\max_{x} \left\{x^{T} Ax: x \in S_{n} \quad[\Leftrightarrow x_{i} \in \{- 1, 1\}, i = 1,..., n] \right\}\tag{3.4.14}
$$

can be built exactly in the same way as (3.4.11) and turns out to be the semidefinite program

maximize

s.t.

$$
\begin{array}{rcl} X = X^{T} =[X_{ij}]_{i, j = 1}^{n} & \succeq & 0 \\ X_{ii} & = & 1, i = 1, \dots, n.\end{array}\tag{3.4.15}
$$

The optimal value in this problem, let it again be called $SDP_{i}$ is $\geq$ the optimal value $OPT$ in the original problem (3.4.14). The ratio OP T /SDP , however, cannot be too large:

Theorem 3.4.2 [Nesterov’s $\frac{\pi}{2}$ Theorem] Let A be positive semidefinite. Then

$$
OPT \leq SDP \leq \frac{\pi}{2} SDP[\frac{\pi}{2} = 1.570...]
$$

The proof utilizes the central idea of Goemans and Williamson in the following brilliant reasoning:

The inequality $SDP \ge OPT$ is valid since (3.4.15) is a relaxation of (3.4.14). Let X be a feasible solution to the relaxed problem; let, same as in the MAXCUT construction, ξ be a Gaussian random vector with zero mean and the covariance matrix $X$ , and let $\zeta = \mathrm{sign}[\xi]$ . As we remember,

$$
\mathbb{E} \left\{\zeta^{T} A \zeta \right\} = \sum_{i, j} A_{ij} \frac{2}{\pi} \mathrm{asin}(X_{ij}) = \frac{2}{\pi} \mathrm{Tr}(A, \mathrm{asin}[X]),\tag{3.4.16}
$$

where for a function f on the axis and a matrix $X ~ f[X]$ denotes the matrix with the entries $f(X_{ij})$ . Now – the crucial (although simple) observation:

For a positive semidefinite symmetric matrix X with diagonal entries ±1 (in fact, for any positive semidefinite X with $| X_{ij} | \le 1)$ one has

$$
\operatorname{asin}[X] \succeq X.\tag{3.4.17}
$$

The proof is immediate: denoting by $[X]^{k}$ the matrix with the entries $X_{ij}^{k}$ and making use of the Taylor series for the asin (this series converges uniformly on [−1, 1]), for a matrix X with all entries belonging to [−1, 1] we get

$$
\operatorname{asin}[X] - X = \sum_{k = 1}^{\infty} \frac{1 \times 3 \times 5 \times \ldots \times(2k - 1)}{2^{k} k !(2k + 1)}[X]^{2k + 1},
$$

and all we need is to note is that all matrices in the left hand side are $\succeq 0$ along with $X^{~ 15)}$

Combining (3.4.16), (3.4.17) and the fact that A is positive semidefinite, we conclude that

$$
{[OPT \geq]}{\mathbb{E} \left\{\zeta^{T} A \zeta \right\} = \frac{2}{\pi} \mathrm{Tr}(A \operatorname{asin}[X]) \geq \frac{2}{\pi} \mathrm{Tr}(AX).}
$$

The resulting inequality is valid for every feasible solution X of (3.4.15), whence $\begin{array}{r}{SDP \le \frac{\pi}{2} OPT} \end{array}$ ✷

The $\frac{\pi}{2}$ Theorem has a number of far-reaching consequences (see Nesterov’s papers [45, 46]), for example, the following two:

Theorem 3.4.3 Let T be a convex compact subset of R<sup>n</sup> which intersects int R<sup>n</sup> . Consider the set

$$
\mathcal{T} = \{x \in \mathbb{R}^{n}:(x_{1}^{2},..., x_{n}^{2})^{T} \in T\},
$$

and let A be a symmetric $n \times n$ matrix. Then the quantities $m_{*}(A) = \operatorname{min}_{x \in \mathcal{T}} x^{T}$ Ax and $m^{*}(A) =$ $\operatorname{max}_{x \in \mathcal{T}} x^{T}$ Ax admit eficiently computable bounds

$$
s_{*}(A) \equiv \min_{X} \left\{\mathrm{Tr}(AX): X \succeq 0,(X_{11},..., X_{nn})^{T} \in T \right\},
$$

$$
s^{*}(A) \equiv \max_{X} \left\{\mathrm{Tr}(AX): X \succeq 0,(X_{11}, \dots, X_{nn})^{T} \in T \right\},
$$

such that

$$
s_{*}(A) \leq m_{*}(A) \leq m^{*}(A) \leq s^{*}(A)
$$

and

$$
m^{*}(A) - m_{*}(A) \leq s^{*}(A) - s_{*}(A) \leq \frac{\pi}{4 - \pi}(m^{*}(A) - m_{*}(A))
$$

(in the case of $A \succeq 0$ and $0 \in T,$ , the $factor \ \frac{\pi}{4 - \pi}$ can be replaced with $\frac{\pi}{2} \Big)$

Thus, the “variation” $^{\prime \prime} \operatorname{max}_{x \in \mathcal{T}} x^{T} Ax - \operatorname{min}_{x \in \mathcal{T}} x^{T}$ Ax of the quadratic form $x^{T}$ Ax on $\tau$ can be $eff -$ ciently bounded from above, and the bound is tight within an absolute constant factor.

Note that if T is given by an essentially strictly feasible SDR, then both $\left(- s_{*}(A) \right)$ and $s^{*}(A)$ are SDr functions of A (semidefinite version of Proposition $\it{2.4.4})$

Theorem 3.4.4 Let $p \in[2, \infty], r \in[1, 2]$ , and let A be an m × n matrix. Consider the problem of computing the operator norm $\| A \|_{p, r}$ of the linear mapping $x \mapsto Ax$ , considered as the mapping from the space $\mathbb{R}^{n}$ equipped with the norm $\| \cdot \|_{p}$ to the space $\mathbb{R}^{m}$ equipped with the norm $\| \cdot \|_{r}.$

$$
\left\| A \right\|_{p, r} = \max \left\{\left\| Ax \right\|_{r}: \left\| x \right\|_{p} \leq 1 \right\};
$$

note that it is dificult (NP-hard) to compute this norm, except for the case of $p = r = 2$ . The “computationally intractable” quantity $\| A \|_{p, r}$ admits an eficiently computable upper bound

$$
\omega_{p, r}(A) = \min_{\lambda \in \mathbb{R}^{m}, \mu \in \mathbb{R}^{n}} \left\{\frac{1}{2} \left[\| \mu \|_{\frac{p}{p - 2}} + \| \lambda \|_{\frac{r}{2 - r}} \right]: \left(\begin{array}{cc} \mathrm{Diag} \{\mu\} & A^{T} \\ A & \mathrm{Diag} \{\lambda\} \end{array} \right) \succeq 0 \right\};
$$

this bound is exact for a nonnegative matrix A, and for an arbitrary A the bound is tight within the factor ${\frac{\pi}{2{\sqrt{3}} - 2 \pi / 3}} = 2.293...$ :

$$
\| A \|_{p, r} \leq \omega_{p, r}(A) \leq \frac{\pi}{2 \sqrt{3} - 2 \pi / 3} \| A \|_{p, r}.
$$

Moreover, when $p \in[1, \infty)$ and $r \in[1, 2]$ are rational $(orp = \infty$ and $r \in[1, 2]$ is rational), the bound $\omega_{p, r}(A)$ is an SDr function of A.

## 3.4.1.7 Shor’s semidefinite relaxation revisited

In retrospect, Goemans-Williamson and Nesterov’s theorems on tightness of SDP relaxation follow certain approach which, to the best of our knowledge, underlies all other results of this type. This approach stems from “probabilistic interpretation” of Shor’s relaxation scheme. Specifically, consider quadratic quadratically constrained problem

$$
\begin{array}{ll} \text{minimize in} x \in \mathbb{R}^{n} & f_{0}(x) = x^{T} A_{0} x + 2b_{0}^{T} x + c_{0} \\ \text{s.t.} & f_{i}(x) = x^{T} A_{i} x + 2b_{i}^{T} x + c_{i} \leq 0, i = 1, \dots, m.\end{array}\tag{P}
$$

and imagine that we are looking for random solution x which should satisfy the constraints at average and minimize under this restriction the average value of the objective. As far as averages of objective and constraints are concerned, all that matters is the moment matrix

$$
X = \mathbb{E} \left\{[1; x][1; x]^{T} \right\} = \left[\begin{array}{cc} 1 &[\mathbb{E} \{x\}]^{T} \\ \hline \mathbb{E} \{x\} & \mathbb{E} \{xx^{T}\} \end{array} \right]
$$

of x comprised of the first and the second moments of random solution x. In terms of this matrix the averages of $f_{i}(x)$ are $\operatorname{Tr}({\bar{A}}_{i} X)$ , with $\bar{A}_{i}$ given by (3.4.7). Now, the moment matrices of random vectors x of dimension n are exactly positive semidefinite $(n + 1) \times(n + 1)$ matrices X with $X_{11} = 1 -$ every matrix of this type can be represented as the moment matrix of a random vector (with significant freedom in the distribution of the vector), and vice versa. As a result, the “averaged” version of $(P)$ is exactly the semidefinite relaxation (3.4.7) of $(P)$ . Note that in the homogeneous case – one where all quadratic forms in $(P)$ are with no linear terms $(b_{i} = 0$ 2 $0 \leq i \leq m)$ there is no reason to care about first order moments of a random solution $x,$ and the “pass to averaged problem” approach results in the semidefinite relaxation

$$
\min_{X} \{\mathrm{Tr}(A_{0} X): X \succeq 0, \mathrm{Tr}(A_{i} X) + c_{i} \leq 0, 1 \leq i \leq m\}
$$

The advantage of probabilistic interpretation of SDP relaxation of $(P)$ is that it provides us with certain way to pass from optimal or suboptimal solution $X_{*}$ of the relaxation to candidate solutions to the problem of interest. Specifically, given $X_{*}$ , we select somehow the distribution of random solution x with the moment matrix $X_{*}$ and generate from this distribution a sample $x^{1}, \x^{2},..., \x^{N}$ of candidate solutions to $(P)$ . Of course, there is no reason for these solutions to be feasible, but in good cases we can correct $x^{i}$ to get feasible solutions ${\bar{x}}^{i}$ to $(P)$ , and can understand how much this correction “costs” in terms of the objective, thus upper-bounding the conservatism of the relaxation. The reader is strongly advised to look at the proofs of Goemans-Williamson and Nesterov theorems through the lens just outlined: the theorems in question operate with homogeneous problem $(P)$ , and the design variable X in SDP relaxation is interpreted as ${\bf E} \{xx^{T}\}$ . To establish tightness bounds, we treat an optimal solution to the SDP relaxation as the covariance matrix of Gaussian zero mean random vector, generate from this distributions samples $x^{i}$ and correct them to make feasible for the problem of interest $(\mathrm{i.e.},$ to be $\pm 1$ vector) by passing from vectors $x^{i}$ to vectors comprised of signs of entries in $x^{i}$ . We shall see this approach in action in several tightness results to follow.

## 3.4.2 Semidefinite relaxation on ellitopes and its applications

The problem we are interested in now is

$$
\operatorname{Opt}_{*}(C) = \max_{x \in \mathcal{X}} x^{T} Cx,\tag{!}
$$

where A is an $n \times n$ symmetric matrix and X is a given compact subset of $\mathbb{R}^{n}$ . We restrict these sets to be ellitopes.

## 3.4.2.1 Ellitopes

A basic ellitope is a set X represented as

$$
\mathcal{X} = \{x \in \mathbb{R}^{n}: \exists t \in \mathcal{T}: x^{T} S_{k} x \leq t_{k}, 1 \leq k \leq K\}\tag{3.4.18}
$$

where:

$S_{k} \succeq 0, k \leq K, \mathrm{and} \sum_{k} S_{k} \succ 0$

- $\tau$ is a convex computationally tractable compact subset of $\mathbb{R}_{+}^{K}$ which has a nonempty interior and is monotone, monotonicity meaning that every nonnegative vector t ≥-dominate by some vector from $\tau$ also belongs to $\tau{:}$ whenever $0 \leq t \leq t^{\prime} \in \mathcal T$ , we have $t \in \tau$

An ellitope is a set $\mathcal{X}$ represented as the linear image of basic ellitope:

$$
\mathcal{X} = \left\{x \in \mathbb{R}^{m}: \exists(t \in \mathcal{T}, z \in \mathbb{R}^{n}): x = Pz, z^{T} S_{k} z \leq t_{k}, k \leq K \right\}\tag{3.4.19}
$$

with $\tau$ and $S_{k}$ are as above.

Clearly, every ellitope is a convex compact set symmetric w.r.t. the origin; a basic ellitope, in addition, has a nonempty interior.

Examples: A. Bounded intersection X of K centered at the origin ellipsoids/elliptic cylinders $\{x : x^{T} S_{k} x \leq 1\} \[S_{k} \succeq 0]$ is a basic ellitope:

$$
\mathcal{X} = \{x: \exists t \in \mathcal{T} :=[0, 1]^{K}: x^{T} S_{k} x \leq t_{k}, k \leq K\}
$$

In particular, the unit box $\{x : \| x \|_{\infty} \leq 1\}$ is a basic ellitope. $\mathbf{B}.\parallel \cdot \parallel_{p^{-}} \mathrm{ball}$ in $\mathbb{R}^{n}$ with $p \in[2, \infty]$ is a basic ellitope:

$$
\{x \in \mathbb{R}^{n}: \| x \|_{p} \leq 1\} = \{x: \exists t \in \mathcal{T} = \{t \in \mathbb{R}_{+}^{n}, \| t \|_{p / 2} \leq 1\}: \underbrace{x_{k}^{2}}_{x^{T} S_{k} x} \leq t_{k}, k \leq K\}.
$$

In fact, ellitopes admit fully algorithmic ”calculus:” this family is closed with respect to basic operations preserving convexity and symmetry w.r.t. the origin, like taking finite intersections, linear images, inverse images under linear embeddings, direct products, arithmetic summation (for details, see [30, Section 4.3]); what is missing, is taking convex hulls of finite unions.

## 3.4.2.2 Construction and main result

Assume that the domain X in (!) is ellitope given by (3.4.19), and let us build a computationally tractable relaxation of (P ). We have

$$
\begin{array}{rlr} & &{(\lambda \in \mathbb{R}_{+}^{k} \& P^{T} CP \preceq \sum_{k} \lambda_{k} S_{k} \& x \in \mathcal{X})} \\ &{\Rightarrow} &{(\lambda \in \mathbb{R}_{+}^{k} \& P^{T} CP \preceq \sum_{k} \lambda_{k} S_{k} \& x = Pz \mathrm{with} z^{T} S_{k} z \leq t_{k}, k \leq K, \mathrm{and} t \in \mathcal{T})} \\ &{\Rightarrow} &{x^{T} Cx = z^{T} P^{T} CPz \leq z^{T}[\sum_{k} \lambda_{k} S_{k}] z \leq \sum_{k} \lambda_{k} t_{k},} \end{array}
$$

implying the validity of the implication

$$
\lambda \geq 0, P^{T} CP \preceq \sum_{k} \lambda_{k} S_{k} \Rightarrow \operatorname{Opt}_{*}(C) \leq \phi_{\mathcal{T}}(\lambda) := \max_{t \in \mathcal{T}} \lambda^{T} t.
$$

Note that $\phi_{T}(\lambda)$ is the support function of $\tau{;}$ it is real-valued, convex and eficiently computable (since $\tau$ is a computationally tractable convex compact set) is positively homogeneous of degree $1 \colon \phi(s \lambda) = s \phi(\lambda)$ when $s \geq 0$ , and, finally, is positive whenever $\lambda \geq 0$ is nonzero (recall that $\tau$ is contained in $\mathbb{R}_{+}^{K}$ and has a nonempty interior).

We have arrived at the first claim of the following

Theorem 3.4.5 [30, Proposition 4.6] Given ellitope

$$
\mathcal{X} = \{x \in \mathbb{R}^{m}: \exists(t \in \mathcal{T}, z \in \mathbb{R}^{n}): x = Pz, z^{T} S_{k} z \leq t_{k}, k \leq K\}
$$

and a symmetric matrix C, consider the quadratic maximization problem

$$
\operatorname{Opt}_{*}(C) = \max_{x \in \mathcal{X}} x^{T} Cx.
$$

along with its relaxation

$$
\operatorname{Opt}(C) = \min_{\lambda} \left\{\phi_{\mathcal{T}}(\lambda): \lambda \geq 0, P^{T} CP \preceq \sum_{k} \lambda_{k} S_{k} \right\}\tag{3.4.20}
$$

The latter problem is computationally tractable and solvable, and its optimal value is an $eff -$ ciently computable upper bound on $\mathrm{Opt}(C)$

$$
\operatorname{Opt}_{*}(C) \leq \operatorname{Opt}(C).\tag{3.4.21}
$$

This upper bound is reasonably tight:

$$
\operatorname{Opt}(C) \leq 3 \ln(\sqrt{3} K) \operatorname{Opt}_{*}(C).\tag{3.4.22}
$$

Let us make several comments:

- When $\tau$ is SDr with essentially strictly feasible SDR, $\phi \tau(\cdot)$ is SDr as well (by semidefinite version of Corollary 2.3.5). Consequently, in this case (3.4.20) can be reformulated as an SDP program,

- When $\mathcal{T} =[0; 1]^{K}, \mathrm{Opt}_{*}[C]$ is the maximum of the quadratic form $z^{T}[P^{T} CP] z$ over the intersection of centered at the origin ellipsoids/elliptic cylinders $z^{T} S_{k} z \le 1$ , that is, the maximum of a homogeneous quadratic constraints $x^{T} S_{k} \leq 1$ . It is immediately seen that Opt(C) as defined in (3.4.20) is nothing but the upper bound on $\mathrm{Opt}_{*}(C)$ yielded by Shor’s semidefinite relaxation. It is shown in [37] that in this case the ratio $\mathrm{Opt / Opt_{*}}$ indeed can be as large as $O(\ln(K))$ , even when all ${\dot{S}}_{k} = qa_{k} a_{k}^{T}$ are of rank 1 and $\mathcal{X}$ is the polytope $\{x : | a_{k}^{T} x | \leq 1, k \leq K\}$ .Robust

- Pay attention to the fact that the tightness factor in (3.4.22) is “nearly independent” of the “size” K of the ellitope $\mathcal{X}$ and is completely independent of all other parameters of the situation.

Proof of Theorem 3.4.5. ${\bf 1}^{0}.$ . We start with rewriting the optimization problem in (3.4.20) as a conic program. To this end let

$$
\mathbf{T} = \operatorname{cl} \left\{\left[t; \tau \right]: \tau > 0, t / \tau \in \mathcal{T} \right\}
$$

be the closed conic hull of $\tau.$ . Since $\tau$ is a convex compact set with a nonempty interior, T is a regular cone, nonzero vectors from T are exactly the vectors of the form $[t; \tau]$ with $\tau > 0$ and $t / \tau \in \mathcal{T}$ , and

$$
\mathcal{T} = \{t:[t; 1] \in \mathbf{T}\}.
$$

We claim that the cone $\mathbf{T}_{*}$ dual to T is

$$
\mathbf{T}_{*} = \{[g; s]: s \geq \phi_{\mathcal{T}}(- g)\}
$$

Indeed, nonzero vectors from T are positive multiplies of vectors $[t; 1]$ with $t \in \mathcal{T}$ , so that $[g; s] \in \mathbf{T}.$ if and only if $g^{T} t + s \geq 0$ for all $t \in \mathcal T$ , that is, if and only if

$$
0 \leq s + \min_{t \in \mathcal{T}}[g^{T} t] = s - \max_{t \in \mathcal{T}}[- g]^{T} t = s - \phi_{\mathcal{T}}(- g).
$$

In view of these observations, (3.4.20) reads

$$
\operatorname{Opt}(C) = \min_{\lambda, \tau} \left\{\tau : \lambda \geq 0,[- \lambda; \tau] \in \mathbf{T}_{*}, P^{T} CP \preceq \sum_{k} \lambda_{k} S_{k} \right\}\tag{3.4.23}
$$

This conic problem clearly is strictly feasible (recall that $\textstyle \sum_{k} S_{k} \succ 0)$ , so that the dual problem is solvable with the same optimal value. Denoting the Lagrange multipliers for the constraints in the latter problem by $\mu \geq 0,[t; s] \in(\mathbf{T}_{*})_{*} = \mathbf{T}, X \succeq 0$ , the dual problem reads

$$
\max_{\mu,[t; s], X} \left\{\operatorname{Tr}(P^{T} CPX): \mu^{T} \lambda + \tau s - \lambda^{T} t + \operatorname{Tr}(X \sum_{k} \lambda_{k} S_{k}) = \tau \forall(\lambda, \tau), \mu \geq 0,[t; s] \in \mathbf{T}, X \succeq 0 \right\},
$$

or, which is the same,

$$
\max_{\mu,[t; s], X} \left\{\operatorname{Tr}(BX): s = 1, \operatorname{Tr}(XS_{k}) + \mu_{k} = t_{k}, k \leq K, \mu \geq 0,[t; s] \in \mathbf{T}, X \succeq 0 \right\}; \quad[B = P^{T} CP]
$$

after eliminating variables s and $\mu,$ and recalling $[t; 1] \in \mathbf{T}$ is exactly the same as $t \in \mathcal{T}$ , and that the optimal value in the dual problem is $\mathrm{Opt}(C)$ , we arrive at

$$
\operatorname{Opt}(C) = \max_{X, t} \left\{\operatorname{Tr}(BX): X \succeq 0, t \in \mathcal{T}, \operatorname{Tr}(XS_{k}) \leq t_{k}, k \leq K \right\}.\tag{3.4.24}
$$

As we remember, the resulting problem is solvable; let $X, \t^{*}$ be an optimal solution to the problem.

$\mathbf{2}^{0}$ . Let

$$
\widetilde{B} := X_{*}^{1 / 2} BX_{*}^{1 / 2} = U \mathrm{Diag} \{\mu\} U^{T}\tag{\([U\) isorthogonal]}
$$

and let $\widetilde{S}_{k} = U^{T} X_{*}^{1 / 2} S_{k} X_{*}^{1 / 2} U$ , so that

$$
0 \preceq \widetilde{S}_{k}, \operatorname{Tr}(\widetilde{S}_{k}) = \operatorname{Tr}(X_{*}^{1 / 2} S_{k} X_{*}^{1 / 2}) = \operatorname{Tr}(S_{k} X_{*}) \leq t_{k}^{*}.\tag{3.4.25}
$$

Let ζ be Rademacher random vector (independent entries taking values $\pm 1$ with probability $1 / 2)$ , and let

$$
\xi = X_{*}^{1 / 2} U \zeta.
$$

We have

$$
\mathbb{E} \{\xi \xi^{T}\} = \mathbb{E} \{X_{*}^{1 / 2} U \zeta \zeta^{T} U^{T} X_{*}^{1 / 2}\} = X_{*}\tag{a}
$$

$$
\xi^{T} B \xi = \zeta^{T} U^{T} X_{*}^{1 / 2} BX_{*}^{1 / 2} U \zeta = \zeta^{T} U^{T} \tilde{B} U \zeta
$$

$$
= \zeta^{T} \operatorname{Diag} \{\mu\} \zeta = \sum_{i} \mu_{i} = \operatorname{Tr}(\widetilde{B}) = \operatorname{Tr}(BX_{*}) = \operatorname{Opt}(C)\tag{3.4.26}
$$

(b)

$$
\xi^{T} S_{k} \xi = \zeta^{T} U^{T} X_{*}^{1 / 2} S_{k} X_{*}^{1 / 2} U \zeta = \zeta^{T} \widetilde{S}_{k} \zeta\tag{c}
$$

Observe that

A: when k is such that $t_{k}^{*} = 0$ , we have $\boldsymbol{\widetilde{S}}_{k} = 0$ by (3.4.25), whence $\xi^{T} S_{k} \xi \equiv 0$ by (3.4.26.c)

B: when k is such that $t_{k}^{*} > 0$ , we have $\mathrm{Tr}(\widetilde{S}_{k} / t_{k}^{*}) \le 1$ , whence

$$
\mathbb{E} \left\{\exp \left\{\frac{\xi^{T} S_{k} \xi}{3t_{k}^{*}} \right\} \right\} = \mathbb{E} \left\{\exp \left\{\frac{\zeta^{T} \widetilde{S}_{k} \zeta}{3t_{k}^{*}} \right\} \right\} \leq \sqrt{3},\tag{3.4.27}
$$

where the equality is due to (3.4.26.c), and the concluding inequality is due to the following fact to be proved later:

Lemma 3.4.1 Let $Q$ be positive semidefinite $N \times N$ matrix with trace $\leq 1$ and ζ be N-dimensional Rademacher random vector. Then

$$
\mathbb{E} \left\{\exp \left\{\zeta^{T} Q \zeta / 3 \right\} \right\} \leq \sqrt{3}.
$$

as applied with $Q = \widetilde{S}_{k} / t_{k}^{*}$ (the latter matrix satisfies Lemma’s premise in view of (3.4.25)). $\mathbf{3}^{0} \cdot \mathrm{\By \2^{0}.A{- B}}$ , we have

$$
\mathrm{Prob} \{\xi^{T} S_{k} \xi > \gamma t_{k}^{*}\} \leq \sqrt{3} \exp \{- \gamma / 3\}, \forall \gamma \geq 0.\tag{3.4.28}
$$

Indeed, for k with $t_{k}^{*} > 0$ this relation is readily given by (3.4.27), while for k with $t_{k}^{*} = 0$ , as we have seen, it holds $\xi^{T} S_{k} \xi \equiv 0$ . From (3.4.28) it follows that

$$
\operatorname{Prob} \{\exists k: \xi^{T} S_{k} \xi > 3 \ln(\sqrt{3} K) t_{k}^{*}\} < 1.
$$

implying that there exists a realization $\bar{\xi}$ of $\xi$ such that $\begin{array}{r}{\overline{{\xi}}^{T} S_{k} \overline{{\xi}} \leq 3 \ln(\sqrt{3} K) t_{k}^{*}, k \leq K} \end{array}$ , while by (3.4.26.b) we have $\overline{{\xi}}^{T} B \overline{{\xi}} = \mathrm{Opt}(C)$ . Setting $z = \overline{{\xi}} / \sqrt{3 \ln(\sqrt{3} K)}$ , we get

$$
z^{T} S_{k} z \leq t_{k}^{*}, k \leq K \& z^{T} Bz = \operatorname{Opt}(C) /[3 \ln(\sqrt{3} K)]
$$

that is, $x : = Pz \in \mathcal{X}$ and $x^{T} Cx \ge \mathrm{Opt}(C) /[3 \ln(\sqrt{3} K)]$ , implying the second inequality in (3.4.22).

$4^{0}$ . It remains to prove Lemma 3.4.1. Let $Q$ obey the premise of Lemma, and let $\begin{array}{r}{Q = \sum_{i} \sigma_{i} f_{i} f_{i}^{T}} \end{array}$ be the eigenvalue decomposition of $Q,$ , so that $f_{i}^{T} f_{i} = 1, \sigma_{i} \geq 0$ , and $\textstyle \sum_{i} \sigma_{i} \leq 1$ . The function

$$
f(\sigma_{1}, \dots, \sigma_{N}) = \mathbb{E} \left\{e^{\frac{1}{3} \sum_{i} \sigma_{i} \zeta^{T} f_{i} f_{i}^{T} \zeta} \right\}
$$

is convex on the simplex $\begin{array}{r}{\{\sigma \geq 0, \sum_{i} \sigma_{i} \leq 1\}} \end{array}$ and thus attains it maximum over the simplex at a vertex, implying that for some $f = f_{i}, f^{T} f = 1$ , it holds

$$
\mathbb{E} \{e^{\frac{1}{3} \zeta^{T} Q \zeta}\} \leq \mathbb{E} \{e^{\frac{1}{3}(f^{T} \zeta)^{2}}\}.
$$

Let $\xi \sim \mathcal{N}(0, 1)$ be independent of $\zeta.$ We have

$$
\begin{array}{l} \mathbb{E}_{\zeta} \left\{\exp \{\frac{1}{3}(f^{T} \zeta)^{2}\} \right\} = \mathbb{E}_{\zeta} \left\{\mathbb{E}_{\xi} \left\{\exp \{[\sqrt{2 / 3} f^{T} \zeta] \xi\} \right\} \right\} \\ = \mathbb{E}_{\xi} \left\{\mathbb{E}_{\zeta} \left\{\exp \{[\sqrt{2 / 3} f^{T} \zeta] \xi\} \right\} \right\} = \mathbb{E}_{\xi} \left\{\prod_{j = 1}^{N} \mathbb{E}_{\zeta} \left\{\exp \{\sqrt{2 / 3} \xi f_{j} \zeta_{j}\} \right\} \right\} \\ = \mathbb{E}_{\xi} \left\{\prod_{j = 1}^{N} \cosh(\sqrt{2 / 3} \xi f_{j}) \right\} \leq \mathbb{E}_{\xi} \left\{\prod_{j = 1}^{N} \exp \{\xi^{2} f_{j}^{2} / 3\} \right\} \\ = \mathbb{E}_{\xi} \left\{\exp \{\xi^{2} / 3\} \right\} = \sqrt{3} \end{array}
$$

Note: As shown in [30, Section 4.3], Semidefinite Relaxation and Theorem 3.4.5 can be extended from ellitopes to an essentially wider family of spectratopes; the same holds true for applications and modifications of this Theorem we are about to consider below. A basic spectratope is a bounded set represented as

$$
\mathcal{X} = \{x \in \mathbb{R}^{n}: \exists t \in \mathcal{T}: S_{k}^{2}[x] \preceq t_{k} I_{d_{k}}, k \leq K\}
$$

where $\begin{array}{r}{S_{k}[x] = \sum_{j = 1}^{n} x_{j} S^{kj}} \end{array}$ with matrix coeficients $S^{kj} \in \mathbf{S}^{d_{k}}$ , with the same restrictions on $\tau$ as for ellitopes. A spectratope is a set representable as linear image of basic spectratope. Every spectratope is an ellitope, but not vice versa; for example the “matrix box” $\{x \in \mathbb{R}^{m \times n}$ $\| x \|_{2, 2} \leq 1\}, \| x \|_{2, 2}$ being the spectral norm (maximum singular value) of matrix $x,$ is a “genuine” spectratope. Spectratopes admit fully algorithmic calculus completely similar to the one of ellitopes.

## 3.4.2.3 Application: Near-optimal linear estimation

Consider the following basic statistical problem: Given noisy observation

$$
\omega = Ax + \xi
$$

$[A : m \times n; \xi$ : standard (zero mean, unit covariance) Gaussian noise]

of unknown signal x known to belong to a given “signal set” $\mathcal{X} \subset \mathbb{R}^{n}$ , recover the linear image $Bx \in \mathbb{R}^{\nu}$ of x.

We quantify the performance of a candidate estimate ${\widehat x}(\cdot)$ by its risk

$$
\operatorname{Risk}[\widehat{x} | \mathcal{X}] = \sup_{x \in \mathcal{X}} \mathbb{E}_{\xi} \left\{\| \widehat{x}(Ax + \xi) - Bx \| \right\},
$$

where $\| \cdot \|$ is a given norm on $\mathbb{R}^{\nu}$

The simplest estimates are linear ones: $\widehat{x}(\omega) = \widehat{x}_{H}(\omega) : = H^{T} \omega$

Noting that for a linear estimate $\widehat{x}_{H}(\omega) = H^{T} \omega$ we have

$$
\| Bx - \widehat{x}_{H}(Ax + \xi) \| = \|[B - H^{T} A] x - H^{T} \xi \| \leq \|[B - H^{T} A] x \| + \| H^{T} \xi \|
$$

the risk of a linear estimate can be upper-bounded as follows:

$$
\operatorname{Risk}[\widehat{x} | \mathcal{X}] \leq \overline{{\operatorname{Risk}}}[\widehat{x} | \mathcal{X}] := \underbrace{\max_{x \in \mathcal{X}} \|[B - H^{T} A] x \|}_{\text{``bias''}} + \underbrace{\mathbb{E} \{\| H^{T} \xi \|\}}_{\text{stochastic term}}.
$$

It is easily seen that when X is symmetric w.r.t. the origin, which we assume from now on, this bound is at most twice the actual risk. The minimum (within factor 2) risk linear estimate is given by an optimal solution to the convex optimization problem

$$
\operatorname{Opt}_{*} = \min_{H} \left\{\Phi(H) + \Psi(H) \right\}, \Phi(H) := \max_{x \in \mathcal{X}} \|[B - H^{T} A] x \|, \Psi(H) = \mathbb{E} \{\| H^{T} \xi \|\}
$$

where the expectation is taken w.r.t. the standard (zero mean, unit covariance) Gaussian distribution.

The dificulty is that Φ and Ψ, while convex, are, in general, dificult to compute. For example, as far as computing $\Phi$ is concerned, the only generic “easy cases” here are those of an ellipsoid X , or X given as a convex hull of finite set.

Assume that

- the signal set X is a basic ellitope<sup>16</sup>:

$$
\mathcal{X} = \{x: \exists t \in \mathcal{T}: x^{T} S_{k} x \leq t_{k}, k \leq K\}
$$

- the unit ball $\boldsymbol{B}_{\ast}$ of the norm $\| \cdot \|.$ <sub>∗</sub> conjugate to $\| \cdot \|$ is an ellitope:

$$
\mathcal{B}_{*} = \{u: \| u \|_{*} \leq 1\} = \{u: \exists z \in \mathcal{Z}: u = Mz\}, \mathcal{Z} = \{z: \exists r \in \mathcal{R}: z^{T} R_{\ell} z \leq r_{\ell}, \ell \leq L\},
$$

as is the case, e.g., when $\| \cdot \| = \| \cdot \|_{p}$ with $1 \le p \le 2$ 2

where $\tau, S_{k}, \mathcal{R}, R_{\ell}$ are as required by the definition of an ellitope.

We are about to demonstrate that under these assumptions Φ and Ψ admit eficiently computable convex in H upper bounds.

Upper-bounding Φ. Observe that

$$
\Phi(H) = \max_{x \in \mathcal{X}} \|[B - H^{T} A] x \| = \max_{u \in \mathcal{B}_{*}, x \in \mathcal{X}} u^{T}[B - H^{T} A] x = \max_{z \in \mathcal{Z}, x \in \mathcal{X}} z^{T}[M^{T}[B - H^{T} A]] x.
$$

We see that $\Phi(H)$ is the maximum of homogeneous quadratic form of $[u; x]$ over $[u; x] \in \mathcal{Z} \times \mathcal{X}$ and the set $\mathcal{Z} \times \mathcal{X}$ is an ellitope along with $\mathcal{Z}$ and X . Applying semidefinite relaxation we arrive at an eficiently computable upper bound

$$
\overline{{\Phi}}(H) := \min_{\lambda, \mu} \left\{\phi_{\mathcal{T}}(\lambda) + \psi_{\mathcal{R}}(\mu): \left[\begin{array}{cc} \lambda \geq 0, \mu \geq 0 \\ \hline \sum_{\ell} \mu_{\ell} R_{\ell} & \frac{1}{2} M^{T}[B - H^{T} A] \\ \hline \frac{1}{2}[B^{T} - A^{T} H] M & \sum_{k} \lambda_{k} S_{k} \end{array} \right] \succeq 0 \right\}
$$

on $\Phi(H)$ ; here $\phi \tau$ and $\phi_{\mathcal{R}}$ are the support functions of $\tau$ and $\mathcal{R}.$ . Note that by Theorem 3.4.5 this bound is tight within the factor $3 \ln(\sqrt{3}(K + L))$

Upper-bounding Ψ. Observe that whenever nonnegative vector $\theta,$ symmetric matrix Θ, and H satisfy the matrix inequality

$$
\left[\begin{array}{cc} \sum_{\ell} \theta_{\ell} R_{\ell} & \frac{1}{2} M^{T} H^{T} \\ \hline \frac{1}{2} HM & \Theta \end{array} \right] \succeq 0,
$$

we have $\Psi(H) \leq \phi_{\mathcal{R}}(\theta) + \mathrm{Tr}(\Theta)$ . Indeed, when the above matrix inequality takes place, we have for every $[z; \xi]$

$$
[Mz]^{T} H^{T} \xi \leq z^{T}[\sum_{\ell} \theta_{\ell} R_{\ell}] z + \xi^{T} \Theta \xi.
$$

When $z \in{\mathcal{Z}}$ , the first term in the right hand side $\mathrm{is} \le \phi_{\mathscr R}(\theta)$ (see the proof of Theorem 3.4.5), and we arrive at

$$
\| H^{T} \xi \| = \max_{z \in \mathcal{Z}}[Mz]^{T} H^{T} \xi \leq \phi_{\mathcal{R}}(\theta) + \xi^{T} \Theta \xi.
$$

Taking expectation over $\xi,$ , we arrive at $\Psi(H) \leq \phi_{\mathcal{R}}(\theta) + \mathrm{Tr}(\Theta)$ , as claimed. The bottom line is that

$$
\Psi(\eta) \leq \overline{{\Psi}}(H) := \min_{\theta, \Theta} \left\{\phi_{\mathcal{R}}(\theta) + \operatorname{Tr}(\Theta): \theta \geq 0, \left[\begin{array}{cc} \sum_{\ell} \theta_{\ell} R_{\ell} & \frac{1}{2} M^{T} H^{T} \\ \hline \frac{1}{2} HM & \Theta \end{array} \right] \succeq 0 \right\}.
$$

It turns out (see [30, Lemma 4.51]) that the upper bound ${\overline{{\Psi}}}(H)$ on $\Psi(H)$ is tight within the factor $O(1) \sqrt{\ln(L + 1)}$

Bottom line is as follows. Consider the convex optimization problem

$$
\operatorname{Opt} = \min_{H, \lambda, \mu, \theta, \Theta} \left\{\phi_{\mathcal{T}}(\lambda) + \phi_{\mathcal{R}}(\mu) + \phi_{\mathcal{R}}(\theta) + \operatorname{Tr}(\Theta): \begin{array}{l} \lambda \geq 0, \mu \geq 0, \theta \geq 0 \\ \left[\frac{\sum_{\ell} \mu_{\ell} R_{\ell}}{\frac{1}{2}[B^{T} - A^{T} H] M} \bigg | \frac{1}{2} M^{T}[B - H^{T} A] \right] \succeq 0 \\ \left[\frac{\sum_{\ell} \theta_{\ell} R_{\ell}}{\frac{1}{2} HM} \bigg | \frac{1}{2} M^{T} H^{T} \right] \succeq 0 \end{array} \right\}
$$

(this is nothing but the problem of minimizing $\overline{{\Phi}}(H) + \overline{{\Psi}}(H)$ over $H)$ . This problem is eficiently solvable, and the linear estimate $\widehat{x}_{H_{*}}$ yielded by the H-component $H_{*}$ of optimal solution satisfies the relation

$$
\operatorname{Risk}[\widehat{x}_{H_{*}} | \mathcal{X}] \leq \overline{{\operatorname{Risk}}}[\widehat{x}_{H_{*}} | \mathcal{X}] \leq \operatorname{Opt}.
$$

From what was said on tightness of the upper bounds $\overline{{\Phi}}, \ \overline{{\Psi}}$ it follows that the resulting linear estimate is optimal, within the “moderate” factor $O(1) \ln(K + L)$ , in terms of its risk among all linear estimates. Surprisingly, it turns out (see [30, Proposition 4.50]) that the estimate $\widehat{x}_{H_{*}}$ is optimal, within the factor $O(1) \sqrt{\ln(K + 1) \ln(L + 1)}$ , in terms of its risk among all estimates, linear and nonlinear alike.

## 3.4.2.4 Application: Tight bounding of operator norms

So far, we have utilized Semidefinite Relaxation on ellitopes in order to build “presumably good” linear estimates of signals observed via the standard Signal Processing observation scheme. Now we intend to use it for another purpose – upper-bounding operator norms.

Consider the problem as follows (cf. Theorem 3.4.4):

Given an $m \times n$ matrix A and norms $\pi(\cdot)$ on $\mathbb{R}^{n}$ and $\theta(\cdot)$ on $\mathbb{R}^{m}$ , compute/tightly upper-bound the induced by $\pi, \theta$ operator norm of A

$$
\Phi_{\pi \rightarrow \theta}(A) = \max_{x} \left\{\theta(Ax): \pi(x) \leq 1 \right\}
$$

The problem in question is to maximize a specific convex function over a specific convex set, and as such it can be computationally intractable. Whether this indeed is the case, it depends on the norms π and $\theta,$ and here is the list of known “easy cases:”

$\pi(\cdot)$ and $\theta(\cdot)$ are the standard Euclidean norms. In this case $\Phi_{\pi \theta}(A) -$ the spectral norm of $A - i$ is the maximal singular value of $A,$ and this quantity is eficiently computable.

$\pi(\cdot) = \| \cdot \|_{1}$ . In this case $\Phi_{\pi \to \theta}(A) = \operatorname{max}_{j \leq n} \theta(\operatorname{Col}_{j}[A]){\mathrm{~}}(\mathrm{why} ?).$

$\theta(\cdot) = \| \cdot \|_{\infty}$ . In this case $\Phi_{\pi \to \theta}(A) = \operatorname{max}_{i \leq m} \pi_{*}(\operatorname{Row}_{i}[A])$ , where $\mathrm{Row}_{j}^{T}[A]$ is i-th row of $A,$ and

$$
\pi_{*}(y) = \max_{x} \{y^{T} x: \pi(x) \leq 1\}
$$

is the norm conjugate to $\pi.$

Note that the last two statements are straightforward reformulations of each other due to the following immediate observation:

Let $\phi_{*}, \theta_{*}$ be the norms conjugate to $\pi, \theta.$

$$
\begin{array}{rcl} \pi_{*}(y) & = & \max_{x} \{x^{T} y: \pi(x) \leq 1\}[\Leftrightarrow \pi(x) = \max_{y} \{x^{T} y: \pi_{*}(y) \leq 1\}:(\pi_{*})_{*} = \pi] \\ \theta_{*}(u) & = & \max_{v} \{v^{T} u: \theta(v) \leq 1\}[\Leftrightarrow \theta(v) = \max_{u} \{u^{T} v: \theta_{*}(u) \leq 1\}:(\theta_{*})_{*} = \theta] \end{array}
$$

Indeed, we have

$$
\begin{array}{l} \Phi_{\pi \to \theta}(A) = \max_{x} \{\theta(Ax): \pi(x) \leq 1\} = \max_{x} \left\{\{\max_{v}[v^{T} Ax: \theta_{*}(v) \leq 1]\}: \pi(x) \leq 1 \right\} \\ = \max_{v, x} \left\{v^{T} Ax: \theta_{*}(v) \leq 1, \pi(x) \leq 1 \right\} = \max_{x, v} \{x^{T} A^{T} v: \theta_{*}(v) = 1,(\pi_{*})_{*}(x) \equiv \pi(x) \leq 1\} \\ = \Phi_{\pi_{*} \to \theta_{*}}(A^{T}).\end{array}
$$

On the other hand, it is known than when $\pi(\cdot) = \| \cdot \|_{p}, \theta(\cdot) = \| \cdot \|_{\i}$ with $p > 2$ and $r < 2$ , then computing $\Phi_{\pi \to \theta}(A)$ is NP-hard in general (i.e., when $m, n,$ and A are considered as problem data).

Observe that as we just have seen, the operator norm of a matrix is the maximum of quadratic (in fact, even bilinear) form:

$$
\begin{array}{c} \Phi_{\pi \to \theta}(A) = \max_{v, x} \{v^{T} Ax: \theta_{*}(v) \leq 1, \pi(x) \leq 1\} = \max_{[v; x] \in \Theta_{*} \times \Pi} \left\{[v; x]^{T} \Big[\frac{}{\frac{1}{2} A^{T}} \Big | \frac{\frac{1}{2} A}{-} \Big][v; x] \right\}, \\ \Pi = \{x: \pi(x) \leq 1\}, \Theta_{*} = \{v: \theta_{*}(v) \leq 1\}.\end{array}
$$

It follows that when, as we assume from now on, Π and $\Theta_{*}$ and are ellitopes:

$$
\begin{array}{rcl} \Pi & = & \{x: \exists r \in \mathcal{R}, z: x = Pz, z^{T} R_{k} z \leq r_{k}, k \leq K\}, \\ \Theta_{*} & = & \{v: \exists s \in \mathcal{S}, w: v = Qw, w^{T} S_{\ell} w \leq s_{\ell}, \ell \leq L\} \end{array}\tag{3.4.29}
$$

with $\mathcal{R}, \mathcal{S}, \R_{k}, \S_{\ell}$ as required in the definition of ellitopes, $\Phi_{\pi \to \theta}(A)$ is the maximum of a quadratic form on the ellitope $\Theta_{*} \times \Pi$ and as such can be tightly upper-bounded by Semidefinite

Relaxation. As is immediately seen, in our present situation and notation the construction from Section 3.4.2.2 boils down to specifying the eficiently computable convex function

$$
\begin{array}{rcl} \overline{{\Phi}}_{\pi \to \theta}(A) & = & \min_{\lambda \geq 0, \mu \geq 0} \left\{\phi_{\mathcal{R}}(\lambda) + \phi_{\mathcal{S}}(\mu): \left[\begin{array}{cc} \sum_{\ell} \mu_{\ell} S_{\ell} & \frac{1}{2} Q^{T} AP \\ \hline \frac{1}{2} P^{T} A^{T} Q & \sum_{k} \lambda_{k} R_{k} \end{array} \right] \succeq 0 \right\} \\ & &[\phi_{\mathcal{R}}, \phi_{\mathcal{S}} \text{are support functions of} \mathcal{R} \text{and} \mathcal{S}] \\ & = & \min_{\lambda, \mu, p, q} \left\{p + q: \left\{\begin{array}{l}[- \lambda; p] \in \mathbb{R}_{*},[- \mu; p] \in \mathrm{S}_{*}, \lambda \geq 0, \mu \geq 0 \\ \left[\begin{array}{cc} \sum_{\ell} \mu_{\ell} S_{\ell} & \frac{1}{2} Q^{T} AP \\ \hline \frac{1}{2} P^{T} A^{T} Q & \sum_{k} \lambda_{k} R_{k} \end{array} \right] \succeq 0 \end{array} \right.\right\} \end{array}\tag{a}
$$

(3.4.30)

(b)

where $\mathbb{R}_{*} = \{[g; p] : p \geq \phi_{\mathcal{R}}(- g)\}$ is the cone dual to the cone $\mathbb{R} = \mathrm{cl} \{[r; t] : t > 0, r / t \in \mathscr{R}\}$ , and $\mathrm{S}_{*} = \{[h; q] : q \geq \phi s(- h)\}$ is the cone dual to the cone $\mathrm{S} = \mathrm{cl} \{[s; t] : t > 0, s / t \in S\}$ . Theorem 3.4.5 states that

$$
\Phi_{\pi \rightarrow \theta}(A) \leq \overline{{\Phi}}_{\pi \rightarrow \theta}(A) \leq 3 \ln(\sqrt{3}[K + L]) \Phi_{\pi \rightarrow \theta}(A),
$$

$K + L$ being the size of the ellitope $\Theta_{*} \times \Pi$ . Our current goal is to slightly refine the latter result:

Theorem 3.4.6 In the case of (3.4.29), one has

$$
\Phi_{\pi \rightarrow \theta}(A) \leq \overline{{\Phi}}_{\pi \rightarrow \theta}(A) \leq 3 \sqrt{\ln(4K) \ln(4L)} \Phi_{\pi \rightarrow \theta}(A),\tag{3.4.31}
$$

Remark 3.4.1 When the quadratic forms $z^{T} R_{k} z, \w^{T} S_{\ell} w$ are just squares of entries in z and w, Nesterov’s results presented in Theorem $\it 3.4.3$ allow to improve the tightness factor in $(3.4.31)$ to an appropriate absolute constant, see Exercise 3.35.

Proof of Theorem 3.4.6 follows the one of Theorem 3.4.5, utilizing at some point bilinearity of the quadratic form we want to upper-bound on $\Theta_{*} \times \Pi$ . To save notation, let M and N be the dimensions of $v,$ respectively, z, in (3.4.29), and assume that $M \leq N$ , which is $\mathrm{w.l.o.g.}^{17}$

1<sup>0</sup>. Applying Conic Duality to the (clearly strictly feasible and bounded) conic representation of ${\overline{{\Phi}}}_{\pi \to \theta}(A)$ as given by 3.4.30.b, we get

$$
\begin{array}{ll} & \overline{{\Phi}}_{\pi \to \theta}(A) \\ = & \max_{r, s, U, V, W} \left\{\operatorname{Tr}(W^{T} Q^{T} AP): \left\{\begin{array}{c} r \in \mathcal{R}, s \in \mathcal{S}, \operatorname{Tr}(S_{\ell} U) \leq s_{\ell} \forall \ell, \operatorname{Tr}(R_{k} V) \leq r_{k} \forall k \\ \left[\begin{array}{cc} U & W \\ \hline W^{T} & V \end{array} \right] \succeq 0 \end{array} \right.\right\} \\ = & \max_{U, V, Y, r, s} \left\{\operatorname{Tr}([U^{1 / 2} YV^{1 / 2}]^{T} Q^{T} AP): \left\{\begin{array}{c} r \in \mathcal{R}, s \in \mathcal{S}, U \succeq 0, V \succeq 0, Y^{T} Y \preceq I \\ \operatorname{Tr}(S_{\ell} U) \leq s_{\ell} \forall \ell, \operatorname{Tr}(R_{k} V) \leq r_{k} \forall k \end{array} \right.\right\} \\ = & \max_{U, V, r, s} \left\{\sum_{i = 1}^{M} \sigma_{i}(U^{1 / 2} Q^{T} APV^{1 / 2}): U \succeq 0, V \succeq 0, \operatorname{Tr}(S_{\ell} U) \leq s_{\ell} \forall \ell, \operatorname{Tr}(R_{k} V) \leq r_{k} \forall k, r \in \mathcal{R}, s \in \mathcal{S} \right\} \\ &[\sigma_{i}(\cdot) \text{are the singular values of M\times N matrix; recall that M\leq N}] \end{array}
$$

At the last two steps of the above derivation, we have used the well known and easy to check (check them!) facts that

$\left[\frac{U}{W^{T}} \Big | \frac{W}{V} \right] \succeq 0$ if and only if $U \succeq 0, V \succeq 0$ and W = U <sup>1/2</sup>Y V <sup>1/2</sup> with Y <sup>T</sup> Y $\preceq I$, and

- the maximum of Frobenius inner products of a given matrix with matrices of spectral norm not exceeding 1 is the sum of singular values of the matrix.

The concluding optimization problem in the above chain clearly is solvable; let $U, V, r, s$ be the optimal solution, and let $\sigma_{i}$ be the singular values, and $\scriptstyle \sum_{\iota = 1}^{M} \sigma_{\iota} e_{\iota} f_{\iota}^{T}$ be the singular value decomposition of $U^{1 / 2} Q^{T} APV^{1 / 2}$ , so that

$$
\overline{{\Phi}}_{\pi \rightarrow \theta}(A) = \sum_{\iota = 1}^{M} \sigma_{\iota}\tag{a}
$$

$$
U^{1 / 2} Q^{T} APV^{1 / 2} = \sum_{\iota = 1}^{M} \sigma_{\iota} e_{\iota} f_{\iota}^{T}\tag{b}
$$

$$
e_{i}^{T} e_{j} = \left\{\begin{array}{ll} 1, & i = j \leq M \\ 0, & i \neq j \end{array} \right., f_{i}^{T} f_{j} = \left\{\begin{array}{ll} 1, & i = j \leq N \\ 0, & i \neq j \end{array} \right.\tag{3.4.32}
$$

(c)

$$
\operatorname{Tr}(U^{1 / 2} S_{\ell} U^{1 / 2}) \leq s_{\ell}, \ell \leq L \& s \in \mathcal{S}\tag{d.1}
$$

$$
\operatorname{Tr}(V^{1 / 2} R_{k} V^{1 / 2}) \leq r_{k}, k \leq K \& r \in \mathcal{R}\tag{d.2}
$$

Let $\epsilon_{1},..., \epsilon_{N}$ be independent random variables taking values ±1 with probabilities $1 / 2$ , and let

$$
\xi = \sum_{i = 1}^{M} \epsilon_{i} e_{i}, \eta = \sum_{j = 1}^{N} \epsilon_{j} f_{j}.
$$

Then in view of (3.4.32) it holds, identically in $\epsilon_{i} = \pm 1, 1 \le i \le N$

$$
\xi^{T} U^{1 / 2} Q^{T} APV^{1 / 2} \eta = \sum_{i, \iota \leq M, j \leq N}[\epsilon_{i} \epsilon_{j} \sigma_{\iota} e_{i}^{T} e_{\iota} f_{\iota}^{T} f_{j}] = \sum_{\iota = 1}^{M} \sigma_{\iota} = \overline{{\Phi}}_{\pi \rightarrow \theta}(A)\tag{3.4.33}
$$

On the other hand, setting ${\mathbb{E}} =[e_{1},..., e_{M}]$ , we get an orthonormal $M \times M$ matrix such that $\xi = E \underline{{\epsilon}}$ , where $\underline{{\epsilon}} =[\epsilon_{1};...; \epsilon_{M}]$ is a Rademacher vector, and

$$
\xi^{T} U^{1 / 2} S_{\ell} U^{1 / 2} \xi = \underline{{\epsilon}}^{T} \underbrace{[E^{T} U^{1 / 2} S_{\ell} U^{1 / 2} E]}_{\overline{{S}}_{\ell}} \underline{{\epsilon}}
$$

By construction, $\overline{{S}}_{\ell} \succeq 0$ is with the same trace as $U^{1 / 2} S_{\ell} U^{1 / 2}$ , that is, with trace $\leq s_{\ell}.$ , see (3.4.32). For every \` such that $s_{\ell} > 0$ we have $\mathrm{Tr}(s_{\ell}^{- 1} \overline{{S}}_{\ell}) \leq 1$ , whence by Lemma 3.4.1

$$
\mathbb{E} \{\exp \{\xi^{T}[s_{\ell}^{- 1} U^{1 / 2} S_{\ell} U^{1 / 2}] \xi / 3\}\} = \mathbb{E} \{\exp \{\underline{{\epsilon}}^{T}[s_{\ell}^{- 1} \overline{{S}}_{\ell}] \underline{{\epsilon}} / 3\}\} \leq \sqrt{3}.
$$

As a result, for every \` such that $s_{\ell} > 0$ we have

$$
\operatorname{Prob} \{\xi^{T} U^{1 / 2} S_{\ell} U^{1 / 2} \xi > 3 \ln(4L) s_{\ell}\} < 1 /(2L).
$$

The latter relation holds true for those \` for which $s_{\ell} = 0$ as well, since for these \` one has $U^{1 / 2} S_{\ell} U^{1 / 2} = 0$ , due to the trace of the latter positive semidefinie matrix being $\le \s_{\ell}$ . Similar reasoning with $\bar{\epsilon} =[\epsilon_{1};...; \epsilon_{N}]$ in the role of $\underline{{\epsilon}}$ and $R_{k} \mathrm{{^{*} s}, ~} r_{k} \mathrm{{^{*}}}$ s in the roles of $S_{\ell}, s_{\ell}$ demonstrates that for every k we have

$$
\mathrm{Prob} \{\eta^{T} V^{1 / 2} R_{k} V^{1 / 2} \eta > 3 \ln(4K) r_{k}\} < 1 /(2K).
$$

Consequently, invoking (3.4.33), there exist realization $(\bar{\xi}, \bar{\eta})$ of $(\xi, \eta)$ such that

$$
\begin{array}{r} \overline{{\xi}}^{T} U^{1 / 2} Q^{T} APV^{1 / 2} \overline{{\eta}} = \overline{{\Phi}}_{\pi \to \theta}(A), \\ \overline{{\xi}}^{T} U^{1 / 2} S_{\ell} U^{1 / 2} \overline{{\xi}} \leq 3 \ln(4L) s_{\ell} \forall \ell, \overline{{\eta}}^{T} V^{1 / 2} R_{k} V^{1 / 2} \overline{{\eta}} \leq 3 \ln(4K) r_{k} \forall k.\end{array}
$$

Setting $v = QU^{1 / 2} \overline{{{\xi}}}, \x = PV^{1 / 2} \overline{{{\eta}}}$ and invoking (3.4.29), we get $\pi(x) \leq \sqrt{3 \ln(4K)}, \theta_{*}(v) \leq$ $\sqrt{3 \ln(4L)}$ , resulting in

$$
\overline{{\Phi}}_{\pi \rightarrow \theta}(A) = \overline{{\xi}}^{T} U^{1 / 2} Q^{T} APV^{1 / 2} \overline{{\eta}} = v^{T} Ax \leq \pi(x) \theta_{*}(v) \Phi_{\pi \rightarrow \theta}(A),
$$

that is,

$$
\overline{{\Phi}}_{\pi \rightarrow \theta}(A) \leq 3 \sqrt{\ln(4K) \ln(4L)} \Phi_{\pi \rightarrow \theta}(A).
$$

Note that when $\pi(\cdot) = \| \cdot \|_{p}, \theta(\cdot) = \| \cdot \|_{\i}$ <sub>r</sub> with $p \geq 2, r \leq 2$ , Nesterov’s Theorem 3.4.4 states that the Semidefinite Relaxation bound $\omega_{p, r}(A)$ (which under the circumstances is nothing but ${\overline{{\Phi}}}_{\pi \theta}(A))$ is tight within absolute constant factor, which is stronger than what in the case in question is stated by Theorem 3.4.6. However, it can be proved that in the full scope of the latter Theorem, logarithmic growth of the tightness factor with $K, L$ is unavoidable.

## 3.4.3 Matrix Cube Theorem and interval stability analysis/synthesis

Consider the problem of Lyapunov Stability Analysis in the case of interval uncertainty:

$$
\mathcal{U} = \mathcal{U}_{\rho} = \{A \in \mathbf{M}^{n, n} | | A_{ij} - A_{ij}^{*} | \leq \rho D_{ij}, i, j = 1, \dots, n\},\tag{3.4.34}
$$

where $A^{*}$ is the “nominal” matrix, $D \neq 0$ is a matrix with nonnegative entries specifying the “scale” for perturbations of different entries, and $\rho \geq 0$ is the “level of perturbations”. We deal with a polytopic uncertainty, and as we remember from Section 3.3.4, to certify the stability is the same as to find a feasible solution of the associated semidefinite program (3.3.8) with a negative value of the objective. The dificulty, however, is that the number N of LMI constraints in this problem is the number of vertices of the polytope (3.4.34), i.e., $N = 2^{m}$ , where m is the number of uncertain entries in our interval matrix (≡the number of positive entries in D). For $5 \times 5$ interval matrices with “full uncertainty” $m = 25$ , i.e., $N = 2^{25} = 33, 554, 432$ , which is $^{66} a$ bit” too many; for “fully uncertain” $10 \times 10$ matrices, $N = 2^{100} > 1.2 \times 10^{30}..$ .. Thus, the “brute force” approach fails already for “pretty small” matrices afected by interval uncertainty.

In fact, the dificulty we have encountered lies in the NP-hardness of the following problem:

Given a candidate Lyapunov stability certificate $X \succ 0$ and $\rho > 0$ , check whether X indeed certifies stability of all instances of $\mathcal{U}_{\rho},$ , i.e., whether X solves the semi-infinite system of LMI’s

$$
A^{T} X + XA \preceq - I \quad \forall A \in \mathcal{U}_{\rho}.\tag{3.4.35}
$$

(in fact, we are interested in the system $^{\ast} A^{T} X + XA \prec 0 \forall A \in \mathcal{U}_{\rho}^{\ast}$ , but this is a minor diference – the “system of interest” is homogeneous in X, and therefore every feasible solution of it can be converted to a solution of (3.4.35) just by scaling $X \mapsto tX)$

The above problem, in turn, is a particular case of the following problem:

“Matrix Cube”: Given matrices $A_{0}, A_{1},..., A_{m} \in \mathbf{S}^{n}$ with $A_{0} \succeq 0$ , find the largest $\rho = R[A_{1},..., A_{m} : A_{0}]$ such that the set

$$
\mathcal{A}_{\rho} = \left\{A = A_{0} + \sum_{i = 1}^{m} z_{i} A_{i} \mid \| z \|_{\infty} \leq \rho \right\}\tag{3.4.36}
$$

– the image of the m-dimensional cube $\{z \in \mathbb{R}^{m} \mid \| z \|_{\infty} \leq \rho\}$ under the Affine mapping $z \mapsto A_{0} + \sum_{i = 1}^{m} z_{i} A_{i} -$ is contained in the semidefinite cone $\mathbf{S}_{+}^{n}$

This is the problem we will focus on; what follows stems from [13]

## 3.4.3.1 The Matrix Cube Theorem

The problem “Matrix Cube” (MC for short) is NP-hard; this is true also for the “feasibility version” $\mathrm{MC}_{\rho}$ of MC, where we, given a $\rho \geq 0$ , are interested to verify the inclusion $\mathcal{A}_{\rho} \subset \mathbf{S}_{+}^{n}$ However, we can point out a simple sufficient condition for the validity of the inclusion $\mathcal{A}_{\rho} \subset \mathbf{S}_{+}^{n}$

Proposition 3.4.4 Assume that the system of LMI’s

(a)

(b)

$$
\begin{array}{c} X^{i} \succeq \rho A_{i}, X^{i} \succeq - \rho A_{i}, i = 1, \dots, m; \\ \sum_{i = 1}^{m} X_{i} \preceq A_{0} \end{array}\tag{\((S_{\rho})\}
$$

in matrix variables $X^{1},..., X^{m} \in \mathbf{S}^{n}$ is solvable. Then $\mathcal{A}_{\rho} \subset \mathbf{S}_{+}^{n}$

Proof. Let $X^{1},..., X^{m}$ be a solution of $(\mathrm{S}_{\rho})$ . From (a) it follows that whenever $\| z \|_{\infty} \leq \rho,$ we have $X^{i} \succeq z_{i} A_{i}$ for all i, whence by (b)

$$
A_{0} + \sum_{i = 1}^{m} z_{i} A_{i} \succeq A_{0} - \sum_{i} X_{i} \succeq 0.
$$

Our main result is that the sufficient condition for the inclusion $\mathcal{A}_{\rho} \subset \mathbf{S}_{+}^{n}$ stated by Proposition 3.4.4 is not too conservative:

Theorem 3.4.7 If the system of $LMI^{\prime} s \({\mathrm S}_{\rho})$ is not solvable, then

$$
\mathcal{A}_{\vartheta(\mu) \rho} \not \subset \mathbf{S}_{+}^{n};\tag{3.4.37}
$$

here

$$
\mu = \max_{1 \leq i \leq m} \operatorname{Rank}(A_{i})
$$

(note $^{66} i \geq 1^{99}$ in the max!), and $\vartheta(\cdot)$ is a universal function, specified in the proof to follow, such that

$$
\vartheta(1) = 1, \vartheta(2) = \pi / 2, \vartheta(3) = 1.7348..., \vartheta(4) = 2 \& \vartheta(k) \leq \frac{\pi \sqrt{k}}{2}, k \geq 1.\tag{3.4.38}
$$

Proof. Below $\zeta \sim \mathcal{N}(0, I_{n})$ means that $\zeta$ is a random Gaussian n-dimensional vector with zero mean and the unit covariance matrix, and $p_{n}(\cdot)$ stands for the density of the corresponding probability distribution:

$$
p_{n}(u) =(2 \pi)^{- n / 2} \exp \left\{- \frac{u^{T} u}{2} \right\}, \quad u \in \mathbb{R}^{n}.
$$

Let us set

$$
\vartheta(k) = \frac{1}{\min \left\{\int | \alpha_{i} u_{1}^{2} + \dots + \alpha_{k} u_{k}^{2} | p_{k}(u) du | \alpha \in \mathbb{R}^{k}, \| \alpha \|_{1} = 1 \right\}}.\tag{3.4.39}
$$

It sufices to verify that

(i): With the just defined $\vartheta(\cdot)$ , insolvability of $(\mathrm{S}_{\rho})$ does imply (3.4.37);

(ii): ϑ(·) satisfies (3.4.38).

Let us prove (i).

$1^{0}.$ . Assume that $(\mathrm{S}_{\rho})$ has no solutions. It means that the optimal value of the semidefinite problem

$$
\min_{t, \{X^{i}\}} \left\{t \Bigg | \begin{array}{c} X^{i} \succeq \rho A_{i}, X^{i} \succeq - \rho A_{i}, i = 1,..., m; \\ \sum_{i = 1}^{m} X_{i} \preceq A_{0} + tI \end{array} \right\}\tag{3.4.40}
$$

is positive. Since the problem is strictly feasible, its optimal value is positive if and only if the optimal value of the dual problem

$$
\max_{W, \{U^{i}, V^{i}\}} \left\{\rho \sum_{i = 1}^{m} \mathrm{Tr}([U^{i} - V^{i}] A_{i}) - \mathrm{Tr}(WA_{0}) \bigg | \begin{array}{c} U^{i} + V^{i} = W, i = 1,..., m, \\ \mathrm{Tr}(W) = 1, \\ U^{i}, V^{i}, W \succeq 0 \end{array} \right\}
$$

is positive. Thus, there exists matrices $U^{i}, V^{i}, W$ such that

(a)

$$
\begin{array}{c} U^{i}, V^{i}, W \succeq 0, \\ U^{i} + V^{i} = W, i = 1, 2,...m, \end{array}\tag{b}
$$

$$
(c) \quad \rho \sum_{i = 1}^{m} \mathrm{Tr}([U^{i} - V^{i}] A_{i}) > \mathrm{Tr}(WA_{0}).\tag{3.4.41}
$$

$2^{0}$ . Now let us use simple

Lemma 3.4.2 Let $W, A \in \mathbf{S}^{n}, \ : W \succeq 0$ . Then

$$
\max_{U, V \succeq 0, U + V = W} \operatorname{Tr}([U - V] A) = \max_{X = X^{T}: \| \lambda(X) \|_{\infty} \leq 1} \operatorname{Tr}(XW^{1 / 2} AW^{1 / 2}) = \| \lambda(W^{1 / 2} AW^{1 / 2}) \|_{1}.\tag{3.4.42}
$$

Proof of Lemma. We clearly have

$$
U, V \succeq 0, U + V = W \Leftrightarrow U = W^{1 / 2} PW^{1 / 2}, V = W^{1 / 2} QW^{1 / 2}, P, Q \succeq 0, P + Q = I,
$$

whence

$$
\max_{U, V: U, V \succeq 0, U + V = W} \operatorname{Tr}([U - V] A) = \max_{P, Q: P, Q \succeq 0, P + Q = I} \operatorname{Tr}([P - Q] W^{1 / 2} AW^{1 / 2}).
$$

When $P, Q$ are linked by the relation $P + Q = I$ and vary in $\{P \succeq 0, Q \succeq 0\}$ , the matrix $X = P - Q$ runs through the entire “interval” $\{- I \preceq X \preceq I\}$ (why?); we have proved the first equality in $\left(3.4.42 \right)$ . When proving the second equality, we may assume $\mathrm{w.l.o.g}$ . that the matrix $W^{1 / 2} AW^{1 / 2}$ is diagonal, so that $\mathrm{Tr}(XW^{1 / 2} AW^{1 / 2}) = \lambda^{\bar{T}}(W^{1 / 2} AW^{1 / 2}) \mathrm{\bar{D} g}(X)$ where $\operatorname{Dg}(X)$ is the diagonal of X. When X runs through the “interval” $\{- I \preceq X \preceq I\}$ , the diagonal of X runs through the entire unit cube $\{\| x \|_{\infty} \leq 1\}$ , which immediately yields the second equality in (3.4.42). ✷

By Lemma 3.4.2, from (3.4.41) it follows that there exists $W \succeq 0$ such that

$$
\rho \sum_{i = 1}^{m} \| \lambda(W^{1 / 2} A_{i} W^{1 / 2}) \|_{1} > \operatorname{Tr}(W^{1 / 2} A_{0} W^{1 / 2}).\tag{3.4.43}
$$

$3^{0}$ . Now let us use the following observation:

Lemma 3.4.3 With $\xi \sim \mathcal{N}(0, I_{n})$ , for every k and every symmetric $n \times n$ matrix A with Rank $(A) \leq k$ one has

$$
\begin{array}{cc}(a) & \mathbb{E} \left\{\xi^{T} A \xi \right\} = \mathrm{Tr}(A), \\(a) & \mathbb{E} \left\{| \xi^{T} A \xi | \right\} \geq \frac{1}{\vartheta(\mathrm{Rank}(A))} \| \lambda(A) \|_{1}; \end{array}\tag{3.4.44}
$$

here E stands for the expectation w.r.t. the distribution of ξ.

Proof of Lemma. (3.4.44.a) is evident:

$$
\mathbb{E} \left\{\xi^{T} A \xi \right\} = \sum_{i, j = 1}^{m} A_{ij} \mathbb{E} \left\{\xi_{i} \xi_{j} \right\} = \operatorname{Tr}(A).
$$

To prove (3.4.44.b), by homogeneity it sufices to consider the case when $\| \lambda(A) \|_{1} = 1$ , and by rotational invariance of the distribution of $\xi ~ -$ the case when $A$ is diagonal, and the first Rank(A) of diagonal entries of A are the nonzero eigenvalues of the matrix; with this normalization, the required relation immediately follows from the definition of $\vartheta(\cdot)$ ✷

$4^{0}$ . Now we are ready to prove (i). Let $\xi \sim \mathcal{N}(0, I_{n})$ . We have

$$
\begin{array}{rcl} \mathbb{E} \left\{\rho \vartheta(\mu) \sum_{i = 1}^{k} | \xi^{T} W^{1 / 2} A_{i} W^{1 / 2} \xi | \right\} & = & \sum_{i = 1}^{m} \rho \vartheta(\mu) \mathbb{E} \left\{| \xi^{T} W^{1 / 2} A_{i} W^{1 / 2} \xi | \right\} \\ & \geq & \rho \sum_{i = 1}^{m} \| \lambda(W^{1 / 2} A_{i} W^{1 / 2} \|_{1} \end{array}
$$

$$
\begin{array}{rl} &[\text{by (3.4.44.b) due to} \operatorname{Rank}(W^{1 / 2} A_{i} W^{1 / 2}) \leq \operatorname{Rank}(A_{i}) \leq \mu, i \geq 1] \\ & \quad > \quad \operatorname{Tr}(W^{1 / 2} A_{0} W^{1 / 2}) \\ & \quad \quad \quad \quad \quad \quad \quad \quad \quad[\text{by (3.4.43)}] \\ & \quad = \quad \operatorname{Tr}(\xi^{T} W^{1 / 2} A_{0} W^{1 / 2} \xi), \\ & \quad \quad \quad \quad \quad \quad \quad \quad[\text{by (3.4.44.a)}] \end{array}
$$

whence

$$
\mathbb{E} \left\{\rho \vartheta(\mu) \sum_{i = 1}^{k} | \xi^{T} W^{1 / 2} A_{i} W^{1 / 2} \xi | - \xi^{T} W^{1 / 2} A_{0} W^{1 / 2} \xi \right\} > 0.
$$

It follows that there exists $r \in \mathbb{R}^{n}$ such that

$$
\vartheta(\mu) \rho \sum_{i = 1}^{m} | r^{T} W^{1 / 2} A_{i} W^{1 / 2} r | > r^{T} W^{1 / 2} A_{0} W^{1 / 2} r,
$$

so that setting $z_{i} = - \vartheta(\mu) \rho \mathrm{sign}(r^{T} W^{1 / 2} A_{i} W^{1 / 2} r)$ , we get

$$
r^{T} W^{1 / 2} \left(A_{0} + \sum_{i = 1}^{m} z_{i} A_{i}\right) W^{1 / 2} r < 0.
$$

We see that the matrix $A_{0} + \sum_{i = 1}^{m} z_{i} A_{i}$ is not positive semidefinite, while by construction $\| z \|_{\infty} \leq \vartheta(\mu) \rho$ Thus, (3.4.37) holds true. (i) is proved.

To prove (ii), let $\alpha \in \mathbb{R}^{k}$ be such that $\| \alpha \|_{1} = 1$ , and let

$$
J = \int | \alpha_{1} u_{1}^{2} + \dots + \alpha_{k} u_{k}^{2} | p_{k}(u) du.
$$

Let $\beta = \left[\begin{array}{c}{{\alpha}} \\{{- \alpha}} \end{array} \right]$ , and let $\xi \sim \mathcal{N}(0, I_{2k})$ . We have

$$
\mathbb{E} \left\{\left| \sum_{i = 1}^{2k} \beta_{i} \xi_{i}^{2} \right| \right\} \leq \mathbb{E} \left\{\left| \sum_{i = 1}^{k} \beta_{i} \xi_{i}^{2} \right| \right\} + \mathbb{E} \left\{\left| \sum_{i = 1}^{k} \beta_{i + k} \xi_{i + k}^{2} \right| \right\} = 2J.\tag{3.4.45}
$$

On the other hand, let $\begin{array}{r}{\eta_{i} = \frac{1}{\sqrt{2}}(\xi_{i} - \xi_{k + i}), \zeta_{i} = \frac{1}{\sqrt{2}}(\xi_{i} + \xi_{k + i}), i = 1,..., k} \end{array}$ , and let $\omega = \left(\begin{array}{c}{{\alpha_{1} \eta_{1}}} \\{{\vdots}} \\{{\alpha_{k} \eta_{k}}} \end{array} \right)$ $\widetilde{\boldsymbol{\omega}} = \left(\begin{array}{c}{\vert \alpha_{1} \eta_{1} \vert} \\{\vdots} \\{\vert \alpha_{k} \eta_{k} \vert} \end{array} \right), \boldsymbol{\zeta} = \left(\begin{array}{c}{\zeta_{1}} \\{\vdots} \\{\zeta_{k}} \end{array} \right)$ . Observe that ζ and ω are independent and $\zeta \sim \mathcal{N}(0, I_{k})$ . We have

$$
\mathbb{E} \left\{\left| \sum_{i = 1}^{2k} \beta_{i} \xi_{i}^{2} \right| \right\} = 2 \mathbb{E} \left\{\left| \sum_{i = 1}^{k} \alpha_{i} \eta_{i} \zeta_{i} \right| \right\} = 2 \mathbb{E} \left\{| \omega^{T} \zeta | \right\} = \mathbb{E} \left\{\| \omega \|_{2} \right\} \mathbb{E} \left\{| \zeta_{1} | \right\},
$$

where the concluding equality follows from the fact that $\zeta \sim \mathcal{N}(0, I_{k})$ is independent of ω. We further have

$$
\mathbb{E} \left\{\left| \zeta_{1} \right| \right\} = \int | t | p_{1}(t) dt = \frac{2}{\sqrt{2 \pi}}
$$

and

$$
\mathbb{E} \left\{\| \omega \|_{2} \right\} = \mathbb{E} \left\{\| \widetilde{\omega} \|_{2} \right\} \geq \| \mathbb{E} \left\{\widetilde{\omega} \right\} \|_{2} = \left[\int | t | p_{1}(t) dt \right] \sqrt{\sum_{i = 1}^{m} \alpha_{i}^{2}}.
$$

Combining our observations, we come to

$$
\mathbb{E} \left\{\left| \sum_{i = 1}^{2k} \beta_{i} \xi_{i}^{2} \right| \right\} \geq 2 \left(\frac{2}{\sqrt{2 \pi}}\right)^{2} \| \alpha \|_{2} \geq \frac{4}{\pi \sqrt{k}} \| \alpha \|_{1} = \frac{4}{\pi \sqrt{k}}.
$$

This relation combines with (3.4.45) to yield $J \ge \frac{2}{\pi \sqrt{k}}$ . Recalling the definition of $\vartheta(k)$ , we come to $\begin{array}{r}{\vartheta(k) \leq \frac{\pi \sqrt{k}}{2}} \end{array}$ , as required in $\left(3.4.38 \right)$

It remains to prove that $\begin{array}{r}{\vartheta(2) = \frac{\pi}{2}} \end{array}$ . From the definition of $\vartheta(\cdot)$ it follows that

$$
\vartheta^{- 1}(2) = \min_{0 \leq \theta \leq 1} \int | \theta u_{1}^{2} -(1 - \theta) u_{2}^{2} | p_{2}(u) du \equiv \min_{0 \leq \theta \leq 1} f(\theta).
$$

The function $f(\theta)$ is clearly convex and satisfies the identity $f(\theta) = f(1 - \theta), 0 \leq \theta \leq 1$ , so that its minimum is attained at $\begin{array}{r}{\theta{'} = \frac{1}{2}} \end{array}$ . A direct computation says that $\begin{array}{l}{f(\frac{1}{2}) = ~ \frac{2}{\pi}} \end{array}$ . Straightforward boring computation says that $\begin{array}{r}{\vartheta(3) = \displaystyle \operatorname{min}_{0 \leq \gamma \leq 1} \left[1 - 2 \gamma + \frac{2 \gamma^{3 / 2}}{\sqrt{2 - \gamma}} \right] = 1.7438...,} \end{array}$ and verification of the fact that $\vartheta(4) =$ 2 is left to the reader.<sup>18</sup> ✷

Corollary 3.4.1 Let the ranks of all matrices $A_{1},..., A_{m}$ in MC be $\leq \mu$ . Then the optimal value in the semidefinite problem

$$
\rho[A_{1},..., A_{m}: A_{0}] = \max_{\rho, X^{i}} \left\{\rho \mid \begin{array}{c} X^{i} \succeq \rho A_{i}, X^{i} \succeq - \rho A_{i}, i = 1,..., m, \\ \sum_{i = 1}^{m} X^{i} \preceq A_{0} \end{array} \right\}\tag{3.4.46}
$$

is a lower bound on $R[A_{1},..., A_{m} : A_{0}]$ , and the “true” quantity is at most $\vartheta(\mu)$ times (see (3.4.39), (3.4.38)) larger than the bound:

$$
\rho \left[A_{1}, \dots, A_{m}: A_{0} \right] \leq R \left[A_{1}, \dots, A_{m}: A_{0} \right] \leq \vartheta(\mu) \rho \left[A_{1}, \dots, A_{m}: A_{0} \right].\tag{3.4.47}
$$

$$
\vartheta(k) = \min_{1 \leq \ell \leq k / 2} \min_{0 \leq \gamma \leq 1} \int_{0}^{\infty} \int_{0}^{\infty} \left| \frac{\gamma}{k - \ell} u - \frac{1 - \gamma}{\ell} v \right| \pi_{k - \ell}(u) \pi_{\ell}(v) dudv,
$$

## 3.4.3.2 Application: Lyapunov Stability Analysis for an interval matrix

Now we are equipped to attack the problem of certifying the stability of uncertain linear dynamic system with interval uncertainty. The problem we are interested in is as follows:

“Interval Lyapunov”: Given a stable $n \times n$ matrix $A_{*}^{\phantom{*}}{}^{19})$ and an $n \times n$ matrix $D \neq 0$ with nonnegative entries, find the supremum $R[A_{*}, D]$ of those $\rho \geq 0$ for which all instances of the “interval matrix”

$$
\mathcal{U}_{\rho} = \left\{A \in \mathbf{M}^{n, n}: \left| A_{ij} - \left(A_{*}\right)_{ij} \right| \leq \rho D_{ij}, i, j = 1, \dots, n \right\}
$$

share a common quadratic Lyapunov function, i.e., the semi-infinite system of LMI’s

$$
X \succeq I; A^{T} X + XA \preceq - I \forall A \in \mathcal{U}_{\rho}\tag{\((\mathrm{Ly}_{\rho})\}
$$

in matrix variable $X \in \mathbf{S}^{n}$ is solvable.

Observe that $X \succeq I$ solves $\left(\mathrm{Ly}_{\rho} \right)$ if and only if the matrix cube

$$
\begin{array}{rcl} \mathcal{A}_{\rho}[X] & = & \left\{B = \underbrace{\left[- I - A_{*}^{T} X - XA_{*} \right]}_{A_{0}[X]} \right.\\ & & + \sum_{(i, j) \in \mathcal{D}} z_{ij} \underbrace{\left[[D_{ij} E^{ij}]^{T} X + X[D_{ij} E^{ij}] \right]}_{A_{ij}[X]} \Big | | z_{ij} | \leq \rho,(i, j) \in \mathcal{D} \Big\} \\ \mathcal{D} & = & \{(i, j): D_{ij} > 0\} \end{array}
$$

is contained in $\mathbf{S}_{+}^{n}$ ; here $E^{ij}$ are the “basic $n \times n$ matrices” (ij-th entry of $E^{ij}$ is 1, all other entries are zero). Note that the ranks of the matrices $A_{ij}[X],(i, j) \in \mathcal{D}$ , are at most 2. Therefore from Proposition 3.4.4 and Theorem 3.4.7 we get the following result:

Proposition 3.4.5 Let $\rho \geq 0$ . Then

(i) If the system of LMI’s

$$
\begin{array}{c} X \succeq I, \\ X^{ij} \succeq - \rho D_{ij} \left[[E^{ij}]^{T} X + XE^{ij} \right], X^{ij} \succeq \rho D_{ij} \left[[E^{ij}]^{T} X + XE^{ij} \right],(i, j) \in \mathcal{D} \\ \sum_{(i, j) \in \mathcal{D}}^{n} X^{ij} \preceq - I - A_{*}^{T} X - XA_{*} \end{array}\tag{\((A_{\rho})\}
$$

in matrix variables $X, X^{ij}, ~(i, j) \in \mathcal{D}$ , is solvable, then so is the system $\left(\mathrm{Ly}_{\rho} \right)$ , and the $X \cdot$ component of a solution of the former system solves the latter system.

(ii) If the system of $LMI^{\prime} s \(\mathrm{A}_{\rho})$ is not solvable, then so is the system $\scriptstyle \left(\mathrm{Ly}{\frac{\pi \rho}{2}} \right)$

In particular, the supremum $\rho[A_{*}, D]$ of those ρ for which $(\mathrm{A}_{\rho})$ is solvable is a lower bound for $R[A_{*}, D]$ , and the $^{6} true^{99}$ quantity is at most $\frac{\pi}{2}$ times larger than the bound:

$$
\rho[A_{*}, D] \leq R[A_{*}, D] \leq \frac{\pi}{2} \rho[A_{*}, D].
$$

Computing $\rho[A_{*}, D]$ . The quantity $\rho[A_{*}, D]$ , in contrast to $R[A_{*}, D]$ , is “eficiently computable”: applying dichotomy in $\rho,$ we can find a high-accuracy approximation of $\rho[A_{*}, D]$ via solving a small series of semidefinite feasibility problems $(\mathrm{A}_{\rho})$ . Note, however, that problem $(\mathrm{A}_{\rho})$ , although “computationally tractable”, is not that simple: in the case of “full uncertainty” $(D_{ij} > 0$ for all $i, j)$ it has $n^{\bar{2}} + 1$ matrix variables of the size n×n each. It turns out [13] that one can reduce dramatically the sizes of the problem specifying $\rho[A_{*}, D]$ . The resulting (equivalent!) description of the bound is:

$$
\frac{1}{\rho[A_{*}, D]} = \inf_{\lambda, Y, X, \{\eta_{i}\}} \left\{\right.\lambda : \left\{\begin{array}{c}X \succeq I,\\\left[\begin{array}{ccccc}Y - \sum_{\ell = 1}^{m} \eta_{\ell} e_{j_{\ell}} e_{j_{\ell}}^{T}&Xe_{i_{1}}&Xe_{i_{2}}&...&Xe_{i_{m}}\\\hline[Xe_{i_{1}}]^{T}&\eta_{1}&&&\\\hline[Xe_{i_{2}}]^{T}&&\eta_{2}&&\\\hline \vdots&&&\ddots&\\\hline[Xe_{i_{m}}]^{T}&&&&\eta_{m}\end{array}\right] \succeq 0,\\A_{0}[X] \equiv - I - A_{*}^{T} X - XA_{*} \succ 0, Y \preceq \lambda A_{0}[X], \lambda > 0\end{array}\right\},\tag{3.4.48}
$$

where $(i_{1}, j_{1}),...,(i_{m}, j_{m})$ are the positions of the uncertain entries in our uncertain matrix $({\mathrm{i.e.}}$ , the pairs $(i, j)$ such that $D_{ij} > 0)$ and $e_{1},..., e_{n}$ are the standard basic orths in $\mathbb{R}^{n}$

Note that the optimization program in (3.4.48) has just two symmetric matrix variables $X, Y,$ a single scalar variable λ and $m \leq n^{2}$ scalar variables η<sub>i</sub>, i.e., totally at most $2n^{2} + n + 2$ scalar design variables, which, for large $m_{\colon}$ , is much less than the design dimension of $(\mathrm{A}_{\rho})$

A good exercise is to pass from $\left(A_{\rho} \right)$ to (3.4.48) by utilizing Corollary 3.3.1.

Remark 3.4.2 Note that our results on the Matrix Cube problem can be applied to the interval version of the Lyapunov Stability Synthesis problem, where we are interested to find the supremum R of those $\rho$ for which an uncertain controllable system

$$
\frac{d}{dt} x(t) = A(t) x(t) + B(t) u(t)
$$

with interval uncertainty

$$
(A(t), B(t)) \in \mathcal{U}_{\rho} = \{(A, B): | A_{ij} -(A_{*})_{ij} | \leq \rho D_{ij}, | B_{i \ell} -(B_{*})_{i \ell} | \leq \rho C_{i \ell} \forall i, j, \ell\}
$$

admits a linear feedback

$$
u(t) = Kx(t)
$$

such that all instances $A(t){+} B(t) K$ of the resulting closed loop system share a common quadratic Lyapunov function. Here our constructions should be applied to the semi-infinite system of LMI’s

$$
Y \succeq I, \quad BL + AY + L^{T} B^{T} + YA^{T} \preceq - I \quad \forall(A, B) \in \mathcal{U}_{\rho}
$$

in variables $L, Y$ (see Proposition 3.3.4), and them yield an eficiently computable lower bound on R which is at most $\frac{\pi}{2}$ times less than $R.$

We have seen that the Matrix Cube Theorem allows to build tight computationally tractable approximations to semi-infinite systems of LMI’s responsible for stability of uncertain linear dynamical systems afected by interval uncertainty. The same is true for many other semiinfinite systems of LMI’s arising in Control in the presence of interval uncertainty, since in a typical Control-related LMI, a perturbation of a single entry in the underlying data results in a small-rank perturbation of the LMI – a situation well-suited for applying the Matrix Cube Theorem.

## 3.4.3.3 Application: Nesterov’s $\frac{\pi}{2}$ Theorem revisited

Our results on the Matrix Cube problem give an alternative proof of Nesterov’s $\frac{\pi}{2}$ Theorem (Theorem 3.4.2). Recall that in this theorem we are comparing the true maximum

$$
OPT = \max_{d} \{d^{T} Ad | \| d \|_{\infty} \leq 1\}
$$

of a positive semidefinite $(A \succeq 0)$ quadratic form on the unit n-dimensional cube and the semidefinite upper bound

$$
SDP = \max_{X} \{\mathrm{Tr}(AX) \mid X \succeq 0, X_{ii} \leq 1, i = 1,..., n\}\tag{3.4.49}
$$

on $OPT;$ the theorem says that

$$
OPT \leq SDP \leq \frac{\pi}{2} OPT.\tag{3.4.50}
$$

To derive (3.4.50) from the Matrix Cube-related considerations, assume that $A \succ 0$ rather than $A \succeq 0$ (by continuity reasons, to prove (3.4.50) for the case of $A \succ 0$ is the same as to prove the relation for all $A \succeq 0)$ and let us start with the following simple observation:

Lemma 3.4.4 Let $A \succ 0$ and

$$
OPT = \max_{d} \left\{d^{T} Ad \mid \| d \|_{\infty} \leq 1 \right\}.
$$

Then

$$
\frac{1}{OPT} = \max \left\{\rho : \left[\begin{array}{cc} 1 & d^{T} \\ \hline d & A^{- 1} \end{array} \right] \succeq 0 \quad \forall(d: \| d \|_{\infty} \leq \rho^{1 / 2}) \right\}\tag{3.4.51}
$$

and

$$
\frac{1}{OPT} = \max \left\{\rho : A^{- 1} \succeq X \quad \forall(X \in \mathbf{S}^{n}: | X_{ij} | \leq \rho \forall i, j) \right\}.\tag{3.4.52}
$$

Proof. To get (3.4.51), note that by the Schur Complement Lemma, all matrices of the form $\lceil{\frac{1}{d}} \rceil{}_{A^{- 1}}^{d^{T}} \rceil$ with $\| d \|_{\infty} \leq \rho^{1 / 2}{\mathrm{~ are ~}} \succeq 0$ if and only if $d^{T}(A^{- 1})^{- 1} d \ = \d^{T} Ad \ \leq \1$ for all $d,$ $\bar{| |} d \|_{\infty} \leq \rho^{1 / 2}$ , i.e., if and only if $\rho{\cdot} OPT \leq 1$ ; we have derived (3.4.51). We now have

(a)

$$
\begin{array}{c} \frac{1}{OPT} \geq \rho \\ \Updownarrow \\ \left[\frac{1}{d} \quad d^{T} \right] \succeq 0 \quad \forall(d: \| d \|_{\infty} \leq \rho^{1 / 2}) \\ \Updownarrow \\ A^{- 1} \succeq \rho dd^{T} \quad \forall(d, \| d \|_{\infty} \leq 1) \\ \Updownarrow \\ x^{T} A^{- 1} x \geq \rho(d^{T} x)^{2} \forall x \forall(d: \| d \|_{\infty} \leq 1) \\ \Updownarrow \\ x^{T} A^{- 1} x \geq \rho \| x \|_{1}^{2} \forall x \\ \Updownarrow \\ A^{- 1} \succeq \rho Y \forall(Y = Y^{T}: | Y_{ij} | \leq 1 \forall i, j) \end{array}\tag{[by(3.4.51)]}
$$

[the Schur Complement Lemma]

(b)

where the concluding $\Updownarrow$ is given by the evident relation

$$
\| x \|_{1}^{2} = \max_{Y} \left\{x^{T} Yx: Y = Y^{T}, | Y_{ij} | \leq 1 \forall i, j \right\}.
$$

The equivalence $(a) \Leftrightarrow(b)$ is exactly (3.4.52).

By (3.4.52), $\displaystyle \frac{1}{OPT}$ is exactly the maximum R of those $\rho$ for which the matrix cube

$$
\mathcal{C}_{\rho} = \{A^{- 1} + \sum_{1 \leq i \leq j \leq n} z_{ij} S^{ij} | \max_{i, j} | z_{ij} | \leq \rho\}
$$

is contained in $\mathbf{S}_{+}^{n}$ ; here $S^{ij}$ are the “basic symmetric matrices” $(S^{ii}$ has a single nonzero entry, equal to 1, in the cell ii, and $S^{ij}, i < j$ , has exactly two nonzero entries, equal to 1, in the cells $ij$ and $ji)$ . Since the ranks of the matrices $S^{ij}$ do not exceed 2, Proposition 3.4.4 and Theorem 3.4.7 say that the optimal value in the semidefinite program

$$
\rho(A) = \max_{\rho, X^{ij}} \left\{\rho \Bigg | \begin{array}{c} X^{ij} \succeq \rho S^{ij}, X^{ij} \succeq - \rho S^{ij}, 1 \leq i \leq j \leq n, \\ \sum_{i \leq j} X^{ij} \preceq A^{- 1} \end{array} \right\}\tag{S}
$$

is a lower bound for $R,$ and this bound coincides with R up to the factor ${\frac{\pi}{2}};$ consequently, $\frac{1}{\rho(A)}$ is an upper bound on $OPT$ , and this bound is at most $\frac{\pi}{2}$ times larger than $OPT$ . It remains to note that a direct computation demonstrates that $\textstyle{\frac{1}{\rho(A)}}$ is exactly the quantity $SDP$ given by (3.4.49).

## 3.4.3.4 Application: Bounding robust ellitopic norms of uncertain matrix with box uncertainty

Consider the following problem which arises, $\mathrm{e.g.}$ , in Robust Control:

Given box-type uncertainty set

$$
\mathcal{U}[\rho] = \{A = \sum_{i = 1}^{N} z_{i} A_{i}: \| z \|_{\infty} \leq \rho\}
$$

in the space of $m \times n$ matrices, upper-bound the quantity

$$
\operatorname{Opt}_{*}(\rho) = \max_{A \in \mathcal{U}[\rho]} | A |,
$$

where $| \cdot |$ stands for the spectral norm of a matrix.

This problem can be immediately reduced to Matrix Cube; indeed, associating with $m \times n$ matrix A symmetric $(m + n) \times(m + n)$ matrix

$$
\mathcal{L}[A] = \left[\begin{array}{cc} & A \\ \hline A^{T} & \end{array} \right],
$$

observe that $| A | \le R$ if and only if ${\cal R} I_{m + n} -{\mathcal{L}}[A] \succeq 0$ . Therefore the relation

$$
\mathrm{Opt}_{*}(\rho) \leq R\tag{3.4.53}
$$

is equivalent to

$$
RI_{m + n} + \sum_{i = 1}^{N} z_{i} \mathcal{L}[A_{i}] \succeq 0 \forall(z: \| z \|_{\infty} \leq \rho).
$$

Applying the Matrix Cube machinery, we conclude that an eficiently verifiable sufficient condi tion for the validity of the latter semi-infinite LMI is the solvability of the parametric system of LMIs

$$
RI_{m + n} - \rho \sum_{i = 1}^{N} U_{i}, U_{i} \succeq \pm \mathcal{L}[A_{i}], 1 \leq i \leq N\tag{\(\mathcal{S}[R,\rho]\}
$$

in matrix variables $U_{i}$ . Besides this, we clearly have $\mathrm{Rank}({\mathcal{L}}[A]) \leq 2 \mathrm{Rank}(A)$ , so that the conservatism of the just presented sufficient condition for (3.4.53) can be quantified by Matrix Cube Theorem, specifically,

Setting $\mu = \operatorname{max}_{1 \leq i \leq N} \operatorname{Rank}(A_{i})$ , we have:

- (3.4.53) does take place when $S[R, \rho]$ is feasible, and

- when $S[R, \rho]$ is infeasible, one has $\operatorname{Opt}(\vartheta(2 \mu) \rho) > R$ , with $\vartheta(\cdot)$ from Theorem 3.4.7.

Our current goal is to extend this result from the spectral norm $\left.\cdot \right.$ onto a more general “ellitopic” norm of a matrix.

Bounding robust ellitopic norm of uncertain matrix under box uncertainty: problem setting. Let

$$
\begin{array}{rcl} \mathcal{X} & = & \{x: \exists t \in \mathcal{T}: x^{T} T_{k} x \leq t_{k}, k \leq K\} \subset \mathbb{R}^{n} \\ \mathcal{B}_{*} & = & \{y: \exists s \in \mathcal{S}: y^{T} S_{\ell} y \leq s_{\ell}, \ell \leq L\} \subset \mathbb{R}^{m} \end{array}\tag{3.4.54}
$$

be two basic ellitopes, see Section 3.4.2, and let $A_{i} \in{\bf R}^{m \times n}, 1 \leq i \leq N$ . In the sequel we set

$$
\| A \| = 2 \max_{y \in \mathcal{B}_{*}, x \in \mathcal{X}} y^{T} Ax = \max_{[y; x] \in \mathcal{B}_{*} \times \mathcal{X}}[y; x]^{T} \left[\begin{array}{cc} & A \\ \hline A^{T} & \end{array} \right][y; x]: \mathbb{R}^{m \times n} \to \mathbb{R}\tag{3.4.55}
$$

Our goal is to upper-bound, in a computationally efficient fashion, the quantity

$$
\operatorname{Opt}_{*} = \max_{\epsilon : \| \epsilon \|_{\infty} \leq 1} \| \sum_{i} \epsilon_{i} A_{i} \|\tag{3.4.56}
$$

which we refer to as robust k · k-norm of uncertain matrix $\begin{array}{r}{\mathcal{A} = \left\{\sum_{i} \epsilon_{i} A_{i} : \| \epsilon \|_{\infty} \leq 1 \right\}} \end{array}$

Note that when both $\mathcal{X}$ and $\boldsymbol{B}_{\ast}$ are unit Euclidean balls, k · k becomes twice the spectral norm. Another cases covered by our setup are those when $\mathcal{X}$ and $\boldsymbol{B}_{\ast}$ are $\| \cdot \|_{p}$ and $\| \cdot \|_{q}$ balls, $2 \leq p, q \leq \infty$ , resulting in

$$
\| A \| = 2 \max_{x} \{\| Ax \|_{\frac{q}{q - 1}}: \| x \|_{p} \leq 1\}.
$$

Processing the problem. Let S be the closed conic hull of $s,$ T be the closed conic hull of $\tau$ (see proof of Theorem 3.4.5), so that, by item $1^{0}$ of the proof of Theorem 3.4.5, we have

$$
\mathcal{S} = \{s:[s; 1] \in \mathbf{S}\}, \mathbf{S}_{*} = \{[g; \tau]: \tau \geq \phi_{\mathcal{S}}(- g)\}, \mathcal{T} = \{t:[t; 1] \in \mathbf{T}\}, \mathbf{T}_{*} = \{[g; \tau]: \tau \geq \phi_{\mathcal{T}}(- g)\},
$$

where

$$
\phi_{\mathcal{H}}(\lambda) = \max_{h \in \mathcal{H}} \lambda^{T} h
$$

is the support function of a set $\mathcal{H}.$ .

Let

> [!warning] PDF 公式回退
> 此公式块的 OCR 转录已截断、重复或乱码，不能安全重写为 LaTeX。以下嵌入的是已核验的原 PDF 第 232 页；本章仍需人工转写后才可标为 `reviewed`。
>
> ![[../../../transcripts/mineru/lectures-modern-convex-optimization/source.pdf#page=232]]

where $\sigma(A)$ is the vector of singular values of a matrix $A, \lambda(A)$ is the vector of eigenvalues of a symmetric matrix $A,$ and

$$
\mathcal{L}[B] = \left[\begin{array}{cc} & B \\ \hline B^{T} & \end{array} \right],
$$

In (3.4.57), (a) follows from the two simple observations (cf. proof of Theorem 3.4.6):

$\operatorname{LMI} \left[{\frac{P \mid Q}{Q^{T} \mid R}} \right] \succeq 0$ with $p \times p$ matrix $P$ and $r \times r$ matrix R takes place if and only if $P \succeq 0, R \succeq 0$ , and $Q = P^{1 / 2} YR^{1 / 2}$ with $p \times r$ matrix $Y$ such that $Y^{T} Y \preceq I_{r}$ , and

- for $p \times r$ matrix A, one has $\operatorname{max}_{Y} \{\mathrm{Tr}(Y^{T} A) : Y \in \mathbb{R}^{p \times r}, Y^{T} Y \preceq I_{r}\} = \| \sigma(A) \|_{1}$

while (b) stems from the fact that the eigenvalues of ${\mathcal{L}}[B]$ are positive singular values of $B,$ minus these positive singular values, and a number of zeros.

Note that Opt as defined in (3.4.57) clearly is a convex function of $[A_{1},..., A_{N}]$

Observe that $\mathrm{Opt_{*}} \le \mathrm{Opt}$ . Indeed, the problem specifying Opt clearly is solvable, and if $\lambda \geq$ $0, \mu \geq 0, P_{i}, Q_{i}$ is its optimal solution, we have for all $y \in \mathcal{B}_{*}, x \in \mathcal{X}, \epsilon_{i} = \pm 1$ :

$$
\begin{array}{rl} & 2 \epsilon_{i} y^{T} A_{i} x \leq y^{T} P_{i} y + x^{T} Q_{i} x \Rightarrow 2 \sum_{i} \epsilon_{i} y^{T} A_{i} x \leq y^{T}[\sum_{\ell} \lambda_{\ell} S_{\ell}] y + x^{T}[\sum_{k} \mu_{k} T_{k}] x \\ & \Rightarrow 2 \sum_{i} \epsilon_{i} y^{T} A_{i} x \leq \max_{s \in \mathcal{S}, t \in \mathcal{T}}[\lambda^{T} s + \mu^{T} t] \leq \phi_{\mathcal{S}}(\lambda) + \phi_{\mathcal{T}}(t) = \mathrm{Opt}.\end{array}
$$

This relation holds true for all $x \in \mathcal{X}, y \in B,$ <sub>∗</sub> and all $\epsilon_{i} = \pm 1$ , implying that $\mathrm{Opt_{*}} \le \mathrm{Opt}$

Now let $X \succeq 0, Y \succeq 0, t, s$ be such that $t \in{\mathcal{T}}, s \in{\mathcal{S}}, \operatorname{Tr}(YS_{\ell}) \leq s_{\ell}, \ell \leq L, \operatorname{Tr}(XT_{k}) \leq t_{k}$ 2 $k \leq K$ , and

$$
\mathrm{Opt} = \sum_{i} \| \lambda(\mathcal{L}[Y^{1 / 2} A_{i} X^{1 / 2}]) \|_{1}.
$$

By Lemma 3.4.3, if the ranks of all matrices $A_{i}$ do not exceed a given $\kappa,$ which we assume from now on, then for $\omega \sim \mathcal{N}(0, I_{m + n})$ one has

$$
\mathbb{E} \left\{\left| \omega^{T} \mathcal{L} \left[Y^{1 / 2} A_{i} X^{1 / 2} \right] \omega \right| \right\} \geq \| \lambda(\mathcal{L} \left[Y^{1 / 2} A_{i} X^{1 / 2} \right]) \|_{1} / \vartheta(2 \kappa),
$$

where $\vartheta(k)$ is the universal function from Theorem 3.4.7. It follows that

$$
\mathrm{Opt} \leq \vartheta(2 \kappa) \mathbb{E}_{\omega \sim \mathcal{N}(0, I_{m + n})} \left\{\sum_{i} | \omega^{T} \mathcal{L}[Y^{1 / 2} A_{i} X^{1 / 2}] \omega | \right\} = \vartheta(2 \kappa) \mathbb{E}_{[\eta; \xi] \sim \mathcal{N}(0, \mathrm{Diag} \{Y, X\})} \left\{2 \sum_{i} | \eta^{T} A_{i} \xi | \right\}.
$$

Now let $p(\cdot)$ be the norm on $\mathbb{R}^{n}$ with the unit ball $x,$ , and $q(\cdot)$ be the norm on $\mathbb{R}^{m}$ with the unit ball $B_{*};$ then

$$
\forall(\eta \in \mathbb{R}^{m}, \xi \in \mathbb{R}^{n}): 2 \sum_{i} | \eta^{T} A_{i} \xi | = \max_{\epsilon_{i} = \pm 1} 2 \eta^{T}[\sum_{i} \epsilon_{i} A_{i}] \xi \leq q(\eta) p(\xi) \mathrm{Opt}_{*},
$$

and we arrive at the relation

$$
\mathrm{Opt} \leq \vartheta(2 \kappa) \mathrm{Opt}_{*} \mathbb{E}_{[\eta; \xi] \sim \mathcal{N}(0, \mathrm{Diag} \{Y, X\})} \{q(\eta) p(\xi)\} = \vartheta(2 \kappa) \mathrm{Opt}_{*} \mathbb{E}_{\xi \sim \mathcal{N}(0, X)} \left\{p(\xi) \right\} \mathbb{E}_{\eta \sim \mathcal{N}(0, Y)} \left\{q(\eta) \right\}\tag{3.4.58}
$$

Lemma 3.4.5 Let

$$
\mathcal{Z} = \left\{z \in \mathbb{R}^{d}: \exists w \in \mathcal{W}: z^{T} Z_{j} z \leq w_{j}, 1 \leq j \leq J \right\} \subset \mathbb{R}^{d}
$$

be a basic ellitope, $W \succeq 0$ be symmetric $d \times d$ matrix such that

$$
\exists w \in \mathcal{W}: \operatorname{Tr}(WZ_{j}) \leq w_{j}, j \leq J,
$$

and $\omega \sim \mathcal{N}(0, W)$ . Denoting by $r(\cdot)$ the norm on $\mathbb{R}^{d}$ with the unit ball ${\mathcal{Z}},$ we have

$$
\mathbb{E} \{r(\omega)\} \leq v(J) := \left\{\begin{array}{ll} 1, & J = 1 \\ \frac{5}{2} \sqrt{\ln(2J)}, & J > 1 \end{array} \right.\tag{3.4.59}
$$

Proof. Let us start with the case of $J = 1$ . Setting $\bar{w} = \operatorname{max} \{w : w \in \mathcal{W}\}$ and $Z = Z_{1} / \bar{w}$ , we have $\operatorname{Tr}(WZ) \leq 1$ and $r(u) = \lVert Z^{1 / 2} u \rVert_{2}$ . Setting $\bar{W} = \breve{Z}^{1 / 2} WZ^{1 / 2}$ and $\bar{\omega} = Z^{1 \bar{/} 2} \omega$ , we get $\bar{\boldsymbol{\omega}} \sim \mathcal{N}(\boldsymbol{0}, \bar{\boldsymbol{W}})$ $\operatorname{Tr}(\bar{W}) \leq 1$ , and

$$
\mathbb{E} \{r(\omega)\} = \mathbb{E} \{\| \bar{\omega} \|_{2}\} \leq \sqrt{\mathbb{E} \{\bar{\omega}^{T} \bar{\omega}\}} = \sqrt{\operatorname{Tr}(\bar{W})} \leq 1 = v(1).
$$

Now let $J > 1$ . Observe that if $\Theta \succeq 0$ is a $d \times d$ matrix with trace 1, then

$$
\begin{array}{rl} & 0 \leq \theta < 1 / 2 \Rightarrow \mathbb{E}_{\zeta \sim \mathcal{N}(0, I_{d})} \exp \{\theta \zeta^{T} \Theta \zeta\} = \mathbb{E}_{\zeta \sim \mathcal{N}(0, I_{d})} \left\{\exp \{\theta \sum_{i} \zeta_{i}^{2} \lambda_{i}(\Theta)\} \right\} \\ & \leq \mathbb{E}_{s \sim \mathcal{N}(0, 1)} \{\exp \{\theta s^{2}\}\} =(1 - 2 \theta)^{- 1 / 2}[\text{by convexity of} \mathbb{E}_{\zeta \sim \mathcal{N}(0, I_{d})} \left\{\exp \{\theta \sum_{i} \zeta_{i}^{2} \lambda_{i}\} \right\} \text{in} \lambda] \\ & \Rightarrow \forall s \geq 0: \operatorname{Prob}_{\zeta \sim \mathcal{N}(0, I_{d})} \left\{\zeta^{T} \Theta \zeta \geq s^{2} \right\} \leq \frac{1}{\sqrt{1 - 2 \theta}} \exp \{- \theta s^{2}\}.\end{array}
$$

Under the premise of Lemma, let $w \in \mathcal{W}$ be such that ${\mathrm{Tr}}(WZ_{j}) \leq w_{j}$ for all $j.$ For every $j$ such that $w_{j} > 0$ , setting $\Theta_{j} = W^{1 / 2} Z_{j} W^{1 / 2} / w_{j}$ , we get $\Theta_{j} \succeq 0, \operatorname{Tr}(\Theta_{j}) \dot{\leq} 1$ , so that by the above

$$
\forall s > 0: \mathrm{Prob}_{\omega \sim \mathcal{N}(0, W)} \{\omega^{T} Z_{j} \omega > s^{2} w_{j}\} = \mathrm{Prob}_{\zeta \sim \mathcal{N}(0, I_{d})} \{\zeta^{T} \Theta_{j} \zeta > s^{2}\} \leq \frac{\exp \{- \theta s^{2}\}}{\sqrt{1 - 2 \theta}}.
$$

The resulting inequality clearly holds true for $j$ with $w_{j} = 0$ as well. Now, when ω and $s > 0$ are such that $\omega^{T} Z_{j} \omega \le s^{2} \bar{w}_{j}$ for all $j,$ we have $r(\omega) \leq s.$ Combining our observations, we $\mathrm{get}$

$$
\operatorname{Prob}_{\omega \sim \mathcal{N}(0, W)} \left\{r(\omega) > s \right\} \leq \min \left[1, K \frac{\exp \left\{- \theta s^{2} \right\}}{\sqrt{1 - 2 \theta}} \right],
$$

implying that

$$
\mathbb{E}_{\omega \sim \mathcal{N}(0, W)} \left\{r(\omega) \right\} \leq \int_{0}^{\infty} \min \left[1, K \frac{\exp \{- \theta s^{2}\}}{\sqrt{1 - 2 \theta}} \right] ds
$$

Optimizing in $\theta,$ we arrive at

$$
\mathbb{E}_{\omega \sim \mathcal{N}(0, W)} \left\{r(\omega) \right\} \leq \frac{5}{2} \sqrt{\ln(2J)} = v(J).
$$

Applying Lemma to ${\mathcal{Z}} = \chi, W = X$ , and to $\mathcal{Z} = B_{\ast}, W = Y$ , we get from (3.4.58) the following conclusion:

Proposition 3.4.6 In the situation described in Problem Setting, assuming that ranks of all $A_{i}$ $are \le \kappa$ , the eficiently computable quantity Opt as given by (3.4.57) is a reasonably tight upper bound on the quantity of interest $\mathrm{Opt}_{\mathrm{:}}$ <sub>∗</sub> as given by (3.4.56), specifically,

$$
\begin{array}{c} \operatorname{Opt}_{*} \leq \operatorname{Opt} \leq v(K) v(L) \vartheta(2 \kappa), \\ \vartheta(1) = 1, \vartheta(2) = \frac{\pi}{2}, \vartheta(4) = 2, \vartheta(k) \leq \pi \sqrt{k} / 2.\end{array}\tag{3.4.60}
$$

with the same $\vartheta(\cdot)$ as in Theorem ${3.4.7},$ with K, L given by (3.4.54), and with $\upsilon(\cdot)$ given by (3.4.59).

Remark 3.4.3 Assume that matrices $A_{i} = A_{i}[\chi]$ are Affine in some vector $\chi$ of control parameters. In this case, the quantities $\mathrm{Opt_{*}}$ and $\mathrm{Opt}$ as defined by (3.4.56), resp., (3.4.57), become functions $\mathrm{Opt}_{*}(\chi), \mathrm{Opt} = \mathrm{Opt}(\chi)$ of $\chi,$ and it is immediately seen that both of them are convex. As a result, we can handle, to some extent, the problem of minimizing in $\chi$ the robust $\| \cdot \|.$ -norm of uncertain matrix

$$
\mathcal{A}[\chi] = \{A = \sum_{i} \epsilon_{i} A_{i}[\chi]: \| \epsilon \|_{\infty} \leq 1\}.
$$

More precisely, we can minimize over $\chi$ eficiently computable convex upper bound $\mathrm{Opt}(\chi)$ on the robust norm $\mathrm{Opt}_{*}(\chi)$ of $\mathcal{A}[\chi]$ , the bound being reasonably tight provided that the ranks of matrices $A_{i}[\chi]$ are small for all $\chi$ in question.

Extension. The above results can be straightforwardly extended from what we called ellitopic norms of matrices onto a more general class of matrix norms. Specifically, let

$\mathcal{X} \subset \mathbb{R}^{n}$ be a set with nonempty interior represented as

$$
\begin{array}{rcl} \mathcal{X} & = & \mathrm{Conv} \{\bigcup_{i = 1}^{I} P_{i} \mathcal{X}_{i}\} = \{x = \sum_{i = 1}^{I} \lambda_{i} P_{i} x_{i}: x_{i} \in \mathcal{X}_{i}, \lambda_{i} \geq 0, \sum_{i} \lambda_{i} = 1\} \\ & = & \{x = \sum_{i} P_{i} x_{i}: \sum_{i} \| x_{i} \|_{\mathcal{X}_{i}} \leq 1\},[\| \cdot \|_{\mathcal{X}_{i}}: \mathrm{normon} \mathbb{R}^{n_{i}} \mathrm{withunitball} \mathcal{X}_{i}] \end{array}
$$

where $\mathcal{X}_{i} \subset \mathbb{R}^{n_{i}}$ are basic ellitopes. Clearly, $\mathcal{X}$ is a convex compact set symmetric w.r.t. the origin and containing a neighbourhood of the origin and as such is the unit ball of certain norm $\| \cdot \|_{\mathcal{X}}$ on $\mathbb{R}^{n}$

Our assumption allows, of course, X to be an ellitope, but it allows also for a much wider family of convex sets and associated norms. For example, let $p_{i} \in[2, \infty], \mathcal{X}_{i} = \{x_{i} \in \mathbb{R}^{n_{i}}$ $\| x_{i} \|_{p_{i}} \leq 1\}$ , and let

$$
P_{i} x_{i} =[0; \dots; 0; x_{i}; 0; \dots; 0]
$$

be natural embeddings of $\mathbb{R}^{n_{i}}$ into ${\bf R}^{n_{1} + \ldots + n_{I}} ={\bf R}^{n_{1}} \times \ldots \times{\bf R}^{n_{I}}$ . In this case

$$
\mathcal{X} = \left\{\left[x_{1}; \dots; x_{I} \right]: x_{i} \in \mathbb{R}^{n_{i}}, i \leq I: \sum_{i} \| x_{i} \|_{p_{i}} \leq 1 \right\} \& \|[x_{1}; \dots; x_{I}] \|_{\mathcal{X}} = \sum_{i} \| x_{i} \|_{p_{i}};
$$

in particular, we get handle on block $\ell_{1} / \ell_{2}$ norm.

$\mathcal{V} \subset \mathbb{R}^{m}$ is the polar of a set of the structure just described:

$$
\mathcal{Y} = \{y \in \mathbb{R}^{m}: \max_{z \in \mathcal{Z}} z^{T} y \leq 1\}, \mathcal{Z} = \{z = \sum_{j = 1}^{J} \mu_{j} Q_{j} z_{j}, z_{j} \in \mathcal{Z}_{j}, \mu_{j} \geq 0, \sum_{j} \mu_{j} = 1\}
$$

where $\mathcal{Z}_{j} \subset \mathbb{R}^{m_{j}}$ are basic ellitopes and $Q_{j}, \mathcal{Z}_{j}$ are such that Z has a nonempty interior. $\mathcal{V}$ is the unit ball of some norm, $\| \cdot \|_{\mathcal{V}}$ , on $\mathbf { R } ^ { m } $ ; we clearly have

$$
\| y \|_{\mathcal{Y}} = \max_{z \in \mathcal{Z}} z^{T} y = \max_{j} \max_{z_{j} \in \mathcal{Z}_{j}}[Q_{j}^{T} y]^{T} z_{j} = \max_{j} \| Q_{j}^{T} y \|_{\mathcal{Z}_{j}, *},
$$

where $\| \cdot \| z_{j}, *$ is the norm conjugate to the norm on $\mathbb{R}^{m_{j}}$ with the unit ball ${\mathcal{Z}}_{j}$ For example, when $\mathcal{Z}_{j} = \{z_{j} \in \mathbb{R}^{m_{j}} : \| z_{j} \|_{r_{j}} \leq 1\}, r_{j} \in[2, \infty]$ , we get

$$
\| y \|_{\mathcal{Y}} = \max_{j} \| Q_{j}^{T} y \|_{q_{j}}, q_{j} = \frac{r_{j}}{r_{j} - 1}.
$$

Now, when $A \in \mathbb{R}^{m \times n}$ , the operator norm of A induced by the norms $\| \cdot \|_{\mathcal{X}}$ and $\| \cdot \|_{\mathcal{V}}$ on the argument and image spaces is

$$
\begin{array}{lll} \| A \|_{\mathcal{X} \to \mathcal{Y}} & = & \max_{x} \{\| Ax \|_{\mathcal{Y}}: \| x \|_{\mathcal{X}} \leq 1\} \\ & = & \max_{x} \left\{\max_{j} \| Q_{j}^{T} Ax \|_{\mathcal{Z}_{j}, *}: \| x \|_{\mathcal{X}} \leq 1 \right\} \\ & = & \max_{x} \left\{\max_{j} \max_{z_{j}} \{z_{j}^{T} Q_{j}^{T} Ax: z_{j} \in \mathcal{Z}_{j}\}: \| x \|_{\mathcal{X}} \leq 1 \right\} \\ & = & \max_{j} \left\{\max_{x, z_{j}} z_{j}^{T} Q_{j}^{T} Ax: z_{j} \in \mathcal{Z}_{j}, x \in \mathcal{X} \right\} \\ & = & \max_{j} \left\{\max_{z_{j}, x} z_{j}^{T} Q_{j}^{T} Ax: z_{j} \in \mathcal{Z}_{j}, x \in \mathrm{Conv} \{\cup_{i} P_{i} \mathcal{X}_{i}\} \right\} \\ & = & \max_{j} \left\{\max_{z_{j}, x_{1}, \ldots, x_{I}} z_{j}^{T} Q_{j}^{T} AP_{i} x_{i}: z_{j} \in \mathcal{Z}_{j}, x_{i} \in \mathcal{X}_{i} \right\} \\ & = & \max_{j} \left\{\max_{i} \left[\max_{z_{j} \in \mathcal{Z}_{j}, x_{i} \in \mathcal{X}_{i}} z_{j}^{T} Q_{j}^{T} AP_{i} x_{i} \right] \right\} \\ & = & \max_{i, j} \| Q_{j}^{T} AP_{i} \|_{ij}, \end{array}
$$

where

$$
\| Q_{j}^{T} AP_{i} \|_{ij} = \max_{z_{j} \in \mathcal{Z}_{j}, x_{i} \in \mathcal{X}_{i}} z_{j}^{T}[Q_{j}^{T} AP_{i}] x_{i}.
$$

As we know from Theorem 3.4.6, we can upper-bound $\| Q_{j}^{T} AP_{i} \|_{ij}$ by $\Phi_{ij}(Q_{j}^{T} AP_{i})$ with convex and eficiently computable $\Phi_{ij}(\cdot)$ , the bound being tight within the factor $3 \sqrt{\ln(4K_{i}) \ln(4L_{j})}$ where $K_{i}$ and $L_{j}$ are ellitopic sizes (numbers of quadratic constraints in the ellitopic descriptions) of $\mathcal{X}_{i}$ and ${\mathcal{Z}}_{j}$ . Besides this, the above reasoning combines with Proposition 3.4.6 to imply that if $\begin{array}{r}{\mathcal{A} = \{\sum_{k = 1}^{K} \dot{\epsilon}_{k} A_{k} : \| \epsilon \|_{\infty} \leq 1\}} \end{array}$ is uncertain $m \times n$ matrix with box uncertainty, we can eficiently upper-bound the robust $\mathcal{X}, \mathcal{y}$ -norm

$$
\| \mathcal{A} \|_{\mathcal{X} \to \mathcal{Y}} = \max_{A \in \mathcal{A}} \| A \|_{\mathcal{X} \to \mathcal{Y}}
$$

of A by properly defined quantity $\Phi_{{\mathcal{X}} y}(A_{1},..., A_{K})$ , where $\Phi_{\mathcal{X} \mathcal{Y}}(\cdot)$ is an eficiently computable convex function, and this upper bound is tight within the factor

$$
\max_{i, j} v(K_{i}) v(L_{j}) \vartheta(2 \kappa),
$$

where κ is the maximum over $k \leq K$ of ranks of $A_{k}$ , with $\upsilon(\cdot)$ defined by (3.4.59) and $\vartheta(\cdot)$ defined in Theorem 3.4.7.

Illustration: Let

$$
m = n = \sum_{k = 1}^{K} d_{k}, I = 1, J = K
$$

$$
\mathcal{X} = \mathcal{X}_{1} = \left\{w = \left[w_{1}; \dots; w_{K} \right] \in \mathbb{R}^{n}: w_{k} \in \mathbb{R}^{d_{k}}, \| w_{k} \|_{2} \leq 1, k \leq K \right\}
$$

$$
= \{x =[x_{1}; \dots; x_{K}] \in \mathbb{R}^{n_{1}} \times \dots \times \mathbb{R}^{n_{K}}: \exists t \in \mathcal{T} =[0, 1]^{K}: x^{T} T_{k} x := x_{k}^{T} x_{k} \leq t_{k}, k \leq K\}
$$

$$
= \{x =[x_{1}; \dots; x_{K}] \in \mathbb{R}^{n_{1}} \times \dots \times \mathbb{R}^{n_{K}}: \| x_{k} \|_{2} \leq 1, k \leq K\}
$$

$$
Q_{j} z_{j} = \left[0_{1 \times d_{1}}; \dots; 0_{1 \times d_{j - 1}}; z_{j}; 0_{1 \times d_{j + 1}}; \dots; 0_{1 \times d_{K}} \right]: \mathbb{R}_{j}^{d} \rightarrow \mathbb{R}^{n}, j \leq K
$$

$$
\mathcal{Z} = \{z = \sum_{j = 1}^{J} \mu_{j} Q_{j} z_{j}: z_{j} \in \mathcal{Z}_{j} := \{z_{i} \in \mathbb{R}^{d_{j}}: z_{j}^{T} z_{j} \leq 1\}, \mu_{j} \geq 0, \sum_{j} \mu_{j} = 1\},
$$

$$
= \left\{z = \left[z_{1}; \dots; z_{K} \right]: z_{k} \in \mathbb{R}^{d_{k}}, \sum_{k < K} \| z_{k} \|_{2} \leq 1 \right\}
$$

$$
\mathcal{Y} = \{y \in \mathbb{R}^{m} \equiv \mathbb{R}^{n}: \max_{z \in \mathcal{Z}} z^{T} y \leq 1\}^{-} = \{y =[y_{1};...; y_{K}]: y_{k} \in \mathbb{R}^{d_{k}}, \| y_{k} \|_{2} \leq 1, k \leq K\}
$$

$$
\|[x_{1}; \dots; x_{K}] \|_{\mathcal{X}} = \|[x_{1}; \dots; x_{K}] \|_{\mathcal{Y}} = \max_{k \leq K} \| x_{k} \|_{2}.
$$

In this case, $A \in \mathbb{R}^{n \times n}$ can be reprsented as $A =[A^{ij}]_{i, j \le K}$ with $d_{i} \times d_{j}$ blocks $A^{ij}$ , and

$$
\| A\|_{\mathcal{X}\to \mathcal{Y}} = \| A\|_{\mathcal{X}\to \mathcal{X}} = \max_{i\leq K}\max_{\substack{y =[y_{1};\ldots;y_{K}]\\ \in \mathbb{R}^{d_{1}}\times \ldots \times \mathbb{R}^{d_{K}}}}\left\{\| \sum_{j = 1}^{K}A^{ij}y_{j}\|_{2}:\| y_{j}\|_{2}\leq 1,j\leq K\right\}
$$

Toy experiment. Given an uncertain $n \times n$ matrix $\begin{array}{r}{\mathcal{A} = \{A = \sum_{i = 1}^{N} \epsilon_{i} a_{i} b_{i}^{T} : \| \epsilon \|_{\infty} \leq 1\}} \end{array}$ , we are interested to lower-bound the supremum $\rho_{*}$ of reals $\rho > 0$ such that all instances of the uncertain matrix $I_{n} + \rho \mathcal{A}$ are nonsingular. A sufficient condition for a given $\rho > 0$ to satisfy the latter condition is that $\rho \operatorname{max}_{A \in \mathcal{A}} \| A \|_{\mathcal{X} \to \mathcal{X}} < 1$ , and different selections of X result, in general, in different lower bounds on $\rho_{*}$ . In our experiment,

- we set $n = 32$ , select at random columns $a_{i}$ of the $n \times n$ Hadamard matrix and columns $b_{i}$ of $I_{n}, 1 \leq i \leq N = 14$ , and set

$$
\mathcal{A} = \{\sum_{i = 1}^{N} \epsilon_{i} a_{i} b_{i}^{T}: \| \epsilon \|_{\infty} \leq 1\}
$$

- for $K = 2^{\ell}, 0 \leq \ell \leq 5$ , we applied the above machinery to upper bound the robust norm of A induced by the norm $\| x \|_{(K)} = \operatorname{max}_{1 \leq k \leq K} \| x_{k} \|_{2}$ , where $x_{1},..., x_{K}$ are consecutive segments, with $n / K$ entries each, of $\boldsymbol{x} \in \mathbb{R}^{n}$

In our experiment, the resulting bounds on the robust norms of $\mathcal{A}$ were as follows:

<table><tr><td>K</td><td>1</td><td>2</td><td>4</td><td>8</td><td>16</td><td>32</td></tr><tr><td>bound</td><td>10.4525</td><td>9.7980</td><td>11.1589</td><td>11.6066</td><td>13.8419</td><td>14.0000</td></tr></table>

so that the best lower bound on $\rho_{*}$ corresponds to $K = 2$ and is equal to $1 / 9.7980 = 0.1021$ Brute force simulation demonstrates that $\rho_{*} \le 0.1722$ , thus our lower bound on $\rho_{*}$ is tight within the factor 1.69.

## 3.5 S-Lemma and Approximate S-Lemma

## 3.5.1 S-Lemma

Let us look again at the Lagrange relaxation of a quadratically constrained quadratic problem, but in the very special case when all the forms involved are homogeneous, and the right hand sides of the inequality constraints are zero:

$$
\begin{array}{cc} \text{minimize} & x^{T} Bx \\ \text{s.t.} & x^{T} A_{i} x \geq 0, i = 1, \dots, m \end{array}\tag{3.5.1}
$$

$(B, A_{1},..., A_{m}$ are given symmetric $m \times m$ matrices). Assume that the problem is feasible. In this case (3.5.1) is, at a first glance, a trivial problem: due to homogeneity, its optimal value is either −∞ or 0, depending on whether there exists or does not exist a feasible vector x such that $x^{T} Bx \ < \0$ . The challenge here is to detect which one of these two alternatives takes place, i.e., to understand whether or not a homogeneous quadratic inequality $x^{T} Bx \ge 0$ is a consequence of the system of homogeneous quadratic inequalities $x^{T} A_{i} x \geq 0$ , or, which is the same, to understand when the implication

(a)

$$
\begin{array}{c} x^{T} A_{i} x \geq 0, i = 1,..., m \\ \Downarrow \\ x^{T} Bx \geq 0 \end{array}\tag{b}
$$

(3.5.2)

holds true.

In the case of homogeneous linear inequalities it is easy to recognize when an inequality $x^{T} b \geq 0$ is a consequence of the system of inequalities $x^{T} a_{i} \ge 0, i = 1,..., m \colon$ by Farkas Lemma, it is the case if and only if the inequality is a linear consequence of the system, i.e., if b is representable as a linear combination, with nonnegative coeficients, of the vectors ${{a}_{i}}.$ Now we are asking a similar question about homogeneous quadratic inequalities: when (b) is a consequence of $(a) ?$

In general, there is no analogy of the Farkas Lemma for homogeneous quadratic inequalities. Note, however, that the easy “if” part of the Lemma can be extended to the quadratic case: if the target inequality (b) can be obtained by linear aggregation of the inequalities (a) and a trivial – identically true – inequality, then the implication in question is true. Indeed, a linear aggregation of the inequalities (a) is an inequality of the type

$$
x^{T}(\sum_{i = 1}^{m} \lambda_{i} A_{i}) x \geq 0
$$

with nonnegative weights $\lambda_{i}$ , and a trivial – identically true – homogeneous quadratic inequality is of the form

$$
x^{T} Qx \geq 0
$$

with $Q \succeq 0$ . The fact that (b) can be obtained from $(a)$ and a trivial inequality by linear aggregation means that B can be represented as $B = \sum_{i = 1}^{m} \lambda_{i} A_{i} + Q$ with $\lambda_{i} \geq 0, Q \succeq 0, \mathrm{or}$ , which is the same, if $B \succeq \sum_{i = 1}^{m} \lambda_{i} A_{i}$ for certain nonnegative $\lambda_{i}.$ . If this is the case, then (3.5.2) is trivially true. We have arrived at the following simple

Proposition 3.5.1 Assume that there exist nonnegative $\lambda_{i}$ such that $B \succeq \sum_{i} \lambda_{i} A_{i}$ . Then the implication (3.5.2) is true.

Proposition 3.5.1 is no more than a sufficient condition for the implication (3.5.2) to be true, and in general this condition is not necessary. There is, however, an extremely fruitful particular case when the condition is both necessary and sufficient – this is the case of $m = 1$ , i.e., a single quadratic inequality in the premise of (3.5.2):

Theorem 3.5.1 [S-Lemma] Let A, B be symmetric $n \times n$ matrices, and assume that the quadratic inequality

$$
x^{T} Ax \geq 0\tag{A}
$$

is strictly feasible: there exists x¯ such that $\bar{x}^{T} A \bar{x} > 0$ . Then the quadratic inequality

$$
x^{T} Bx \geq 0\tag{B}
$$

is a consequence $of \left(\mathrm{A} \right)$ if and only if it is a linear consequence of (A), i.e., if and only if there exists a nonnegative λ such that

$$
B \succeq \lambda A.
$$

We are about to present an “intelligent” proof of the S-Lemma based on the ideas of semidefinite relaxation.

In view of Proposition 3.5.1, all we need is to prove the “only if” part of the S-Lemma, i.e., to demonstrate that if the optimization problem

$$
\min_{x} \left\{x^{T} Bx: x^{T} Ax \geq 0 \right\}
$$

is strictly feasible and its optimal value is $\geq 0$ , then $B \succeq \lambda A$ for certain $\lambda \geq 0$ . By homogeneity reasons, it sufices to prove exactly the same statement for the optimization problem

$$
\min_{x} \left\{x^{T} Bx: x^{T} Ax \geq 0, x^{T} x = n \right\}.\tag{P}
$$

The standard semidefinite relaxation of (P) is the problem

$$
\min_{X} \left\{\operatorname{Tr}(BX): \operatorname{Tr}(AX) \geq 0, \operatorname{Tr}(X) = n, X \succeq 0 \right\}.\tag{\((P')\}
$$

If we could show that when passing from the original problem (P) to the relaxed problem $\left(\mathrm{P^{\prime}} \right)$ the optimal value (which was nonnegative for (P)) remains nonnegative, we would be done. Indeed, observe that $\left(\mathrm{P^{\prime}} \right)$ is clearly bounded below (its feasible set is compact!) and is strictly feasible (which is an immediate consequence of the strict feasibility of $\mathrm{(A)})$ ). Thus, by the Conic Duality Theorem the problem dual to $\left(\mathrm{P^{\prime}} \right)$ is solvable with the same optimal value (let it be called $n \theta^{*})$ as the one in (P<sup>0</sup>). The dual problem is

$$
\max_{\mu, \lambda} \left\{n \mu : \lambda A + \mu I \preceq B, \lambda \geq 0 \right\},
$$

and the fact that its optimal value is $n \theta^{*}$ means that there exists a nonnegative λ such that

$$
B \succeq \lambda A + n \theta^{*} I.
$$

If we knew that the optimal value $n \theta^{*}$ in $\left(\mathrm{P^{\prime}} \right)$ is nonnegative, we would conclude that $B \succeq \lambda A$ for certain nonnegative $\lambda,$ which is exactly what we are aiming at. Thus, all we need is to prove that under the premise of the S-Lemma the optimal value in $\left(\mathrm{P^{\prime}} \right)$ is nonnegative, and here is the proof:

Observe first that problem $\left(\mathrm{P^{\prime}} \right)$ is feasible with a compact feasible set, and thus is solvable. Let $X^{*}$ be an optimal solution to the problem. Since $X^{*} \geq 0$ , there exists a matrix D such that $X^{*} = DD^{\hat{T}}$ . Note that we have

$$
\begin{array}{c} 0 \leq \mathrm{Tr}(AX^{*}) = \mathrm{Tr}(ADD^{T}) = \mathrm{Tr}(D^{T} AD), \\ n \theta^{*} = \mathrm{Tr}(BX^{*}) = \mathrm{Tr}(BDD^{T}) = \mathrm{Tr}(D^{T} BD), \\ n = \mathrm{Tr}(X^{*}) = \mathrm{Tr}(DD^{T}) = \mathrm{Tr}(D^{T} D).\end{array}\tag{\((^{*})\}
$$

It remains to use the following observation

(!) Let $P, Q$ be symmetric matrices such that $\operatorname{Tr}(P) \geq 0$ and $\mathrm{Tr}(Q) < 0$ . Then there exists a vector e such that $e^{T} Pe \geq 0$ and $e^{T} Qe < 0$

Indeed, let us believe that (!) is valid, and let us prove that $\theta^{*} \geq 0$ . Assume, on the contrary, that $\theta^{*} < 0$ . Setting $P = \bar{D}^{T} BD$ and $Q = D^{T} AD$ and taking into account $(^{*})$ , we see that the matrices $P, Q$ satisfy the premise in (!), whence, by (!), there exists a vector e such that $0 \leq e^{T} Pe =[\bar{D} e]^{T} A[De]$ and $0 > e^{T} Qe =[De]^{T} B[De]$ , which contradicts the premise of the S-Lemma.

It remains to prove (!). Given $P$ and $Q$ as in (!), note that $Q,$ as every symmetric matrix, admits a representation

$$
Q = U^{T} \Lambda U
$$

with an orthonormal U and a diagonal Λ. Note that $\theta \equiv \mathrm{Tr}(\Lambda) = \mathrm{Tr}(Q) < 0$ . Now let $\xi$ be a random n-dimensional vector with independent entries taking values ±1 with probabilities $1 / 2$ . We have

$$
[U^{T} \xi]^{T} Q[U^{T} \xi] =[U^{T} \xi]^{T} U^{T} \Lambda U[U^{T} \xi] = \xi^{T} \Lambda \xi = \mathrm{Tr}(\Lambda) = \theta \quad \forall \xi,
$$

while

$$
[U^{T} \xi]^{T} P[U^{T} \xi] = \xi^{T}[UPU^{T}] \xi,
$$

and the expectation of the latter quantity over $\xi$ is clearly $\mathrm{Tr}(UPU^{T}) = \mathrm{Tr}(P) \ge 0$ . Since the expectation is nonnegative, there is at least one realization $\bar{\xi}$ of our random vector $\xi$ such that

$$
0 \leq[U^{T} \bar{\xi}]^{T} P[U^{T} \bar{\xi}].
$$

We see that the vector $e = U^{T} \bar{\xi}$ is a required one: $e^{T} Qe = \theta < 0$ and $e^{T} Pe \geq 0$

## 3.5.2 Inhomogeneous S-Lemma

Proposition 3.5.2 [Inhomogeneous S-Lemma] Consider optimization problem with quadratic objective and a single quadratic constraint:

$$
f_{*} = \min_{x} \left\{f_{0}(x) \equiv x^{T} A_{0} x + 2b_{0}^{T} x + c_{0}: f_{1}(x) \equiv x^{T} A_{1} x + 2b_{1}^{T} x + c_{1} \leq 0 \right\}\tag{3.5.3}
$$

Assume that the problem is strictly feasible and below bounded. Then the Semidefinite relaxation (3.4.5) of the problem is solvable with the optimal value $f_{*}$

Proof. By Proposition 3.4.1, the optimal value in (3.4.5) can be only $\leq f_{*}$ . Thus, it sufices to verify that (3.4.5) admits a feasible solution with the value of the objective $\geq f_{*}$ , that is, that there exists $\lambda_{*} \geq 0$ such that

$$
\left(\begin{array}{cc} c_{0} + \lambda_{*} c_{1} - f_{*} & b_{0}^{T} + \lambda_{*} b_{1}^{T} \\ b_{0} + \lambda_{*} b_{1} & A_{0} + \lambda_{*} A_{1} \end{array} \right) \succeq 0.\tag{3.5.4}
$$

To this end, let us associate with (3.5.3) a pair of homogeneous quadratic forms of the extended vector of variables $y =(t, x)$ , where $t \in \mathbb{R}.$ , specifically, the forms

$$
y^{T} Py \equiv x^{T} A_{1} x + 2tb_{1}^{T} x + c_{1} t^{2}, y^{T} Qy = - x^{T} A_{0} y - 2tb_{0}^{T} x -(c_{0} - f_{*}) t^{2}.
$$

We claim that, first, there exist $\epsilon_{0} > 0$ and ¯y with $\bar{y}^{T} P \bar{y} < - \epsilon_{0} \bar{y}^{T} \bar{y}$ and, second, that for every $\epsilon \in(0, \epsilon_{0}]$ the implication

$$
y^{T} Py \leq - \epsilon y^{T} y \Rightarrow y^{T} Qy \leq 0\tag{3.5.5}
$$

holds true. The first claim is evident: by assumption, there exists ¯x such that $f_{1}(\bar{x}) < 0;$ setting $\bar{y} =(1, \bar{x})$ , we see that $\bar{y}^{T} P \bar{y} = f_{1}(\bar{x}) < 0$ , whence $\bar{y}^{T} P \bar{y} < - \epsilon_{0} \bar{y}^{T} \bar{y}$ for appropriately chosen $\epsilon_{0} > 0$ . To support the second claim, assume that $y =(t, x)$ is such that $\bar{y^{T}} Py \le - \epsilon \bar{y}^{T} y$ , and let us prove that then $y^{T} Qy \leq 0$

- Case $1 \colon t \neq 0$ . Setting $y^{\prime} = t^{- 1} y =(1, x^{\prime})$ , we have $f_{1}(x^{\prime}) =[y^{\prime}]^{T} Py^{\prime} = t^{- 2} y^{T} Py \le 0$ whence $\overline{{f_{0}(x^{\prime})}} \geq f_{*}$ , or, which is the same, $[y^{\prime}]^{T} Qy^{\prime} \le 0$ , so that $y^{T} Qy \leq 0$ , as required in (3.5.5).

- Case 2: $t = 0$ . In this case, $- \epsilon x^{T} x = - \epsilon y^{T} y \ge y^{T} Py = x^{T} A_{1} x$ and $y^{T} Qy = - x^{T} A_{0} x$ , and we should prove that the latter quantity is nonpositive. Assume, on the contrary, that this quantity is positive, that is, $x^{T} A_{0} x < 0$ . Then $x \neq 0$ and therefore $x^{T} A_{1} x \leq - \epsilon x^{T} x < 0$ From $x^{T} A_{1} x \ < \0$ and $x^{T} A_{0} x \ < \0$ it follows that $f_{1}(sx) \ \to \ - \infty$ and $f_{0}(sx) \ \to \ - \infty$ as $s + \infty$ , which contradicts the assumption that (3.5.3) is below bounded. Thus, $y^{T} Qy \leq 0$

Our observations combine with S-Lemma to imply that for every $\epsilon \in(0, \epsilon_{0}]$ there exists $\lambda =$ $\lambda_{\epsilon} \geq 0$ such that

$$
B \preceq \lambda_{\epsilon}(A + \epsilon I),\tag{3.5.6}
$$

whence, in particular,

$$
\bar{y}^{T} B \bar{y} \leq \lambda_{\epsilon} \bar{y}^{T}[A + \epsilon I] \bar{y}.
$$

The latter relation, due to $\bar{y}^{T} A \bar{y} < 0$ , implies that $\lambda_{\epsilon}$ remains bounded as $\epsilon + 0$ . Thus, we have $\lambda_{\epsilon_{i}} \lambda_{*} \geq 0$ as $i \to \infty$ for a properly chosen sequence $\epsilon_{i} \to + 0$ of values of $\epsilon,$ and (3.5.6) implies that $B \preceq \lambda_{*} A$ . Recalling what are A and B, we arrive at (3.5.4). ✷

## 3.5.3 Approximate S-Lemma

In general, the S-Lemma fails to be true when there is more than a single quadratic form in (3.5.2) (that is, when $m > 1)$ . Similarly, Inhomogeneous S-Lemma fails to be true for general quadratic quadratically constrained problems with more than a single quadratic constraint.

There exists, however, a useful approximate version of the Inhomogeneous S-Lemma in the “multi-constrained” case<sup>20</sup>.

Consider a single-parametric family of ellitopes

$$
\mathcal{X}[\rho] = \{x \in \mathbb{R}^{n}: \exists z \in \mathcal{Z}[\rho]: x = Pz\}, \mathcal{Z}[\rho] = \left\{z \in \mathbb{R}^{N}: \exists t \in \mathcal{T}: z^{T} S_{k} z \leq \rho t_{k}, k \leq K \right\}\tag{3.5.7}
$$

where $\rho > 0$ and $S_{k}$ and $\tau$ as they should be to specify an ellitope, see Section 3.4.2, and let

$$
\begin{array}{rcl} \mathrm{Opt}_{*}(\rho) & = & \max_{x \in \mathcal{X}[\rho]}[x^{T} Ax + 2b^{T} x] \\ & = & \max_{z} \left\{z^{T} Qz + 2q^{T} z: z \in \mathcal{Z}[\rho] \right\} \\ & = & \max_{z, t} \left\{z^{T} Qz + 2q^{T} z: z^{T} S_{k} z \leq \rho t_{k}, k \leq K, t \in \mathcal{T} \right\}, \\ & & Q := P^{T} AP, q = P^{T} b \end{array}\tag{3.5.8}
$$

Let us set

$$
Q_{+} = \left[\begin{array}{cc} Q & q \\ \hline q^{T} & \end{array} \right],
$$

and let

$$
\phi_{\mathcal{T}}(\lambda) = \max_{t \in \mathcal{T}} \lambda^{T} t
$$

be the support function of $\tau.$

The following proposition establishes the quality of the semidefinite relaxation upper bound on the quantity $\mathrm{Opt}_{*}(\rho)$

Proposition 3.5.3 [Approximate S-Lemma] In the situation just defined, let

$$
\operatorname{Opt}[\rho] = \min_{\lambda, \mu} \left\{\rho \phi_{\mathcal{T}}(\lambda) + \mu : Q_{+} \preceq \left[\begin{array}{cc} \sum_{k} \lambda_{k} S_{k} & \\ \hline & \mu \end{array} \right] \right\}\tag{3.5.9}
$$

Then

$$
\mathrm{Opt}_{*}[\rho] \leq \mathrm{Opt}[\rho] \leq \mathrm{Opt}_{*}[\kappa \rho]\tag{3.5.10}
$$

with

$$
\kappa = 3 \ln(6K)\tag{3.5.11}
$$

Proof follows the lines of the proof of Theorem 3.4.5 (which, essentially, is the homogeneous case $b = 0$ of Proposition 3.5.3). Replacing $\tau$ with $\rho \mathcal{T}$ , we assume once for ever that $\rho = 1$ $1^{0}$ . As we have seen when proving Theorem 3.4.5, setting

$$
\mathbf{T} = \operatorname{cl} \left\{\left[t; \tau \right]: \tau > 0, t / \tau \in \mathcal{T} \right\}
$$

we get a regular cone with the dual cone

$$
\mathbf{T}_{*} = \{[g; s]: s \geq \phi \tau(- g)\}
$$

and such that

$$
\mathcal{T} = \{t:[t; 1] \in \mathbf{T}\}.
$$

Problem (3.5.9) with $\rho = 1$ is the conic problem

$$
\operatorname{Opt}[1] = \min_{\lambda, \tau, \mu} \left\{\tau + \mu : \begin{array}{l} \lambda \in \mathbb{R}_{+}^{K}, \mu \geq 0 \\[- \lambda; \tau] \in \mathbf{T}_{*} \\ \left[\frac{\sum_{k} \lambda_{k} S_{k}}{\mu} \right] - Q_{+} \succeq 0 \end{array} \right\}\tag{\( \left(*\right)\}
$$

It is immediately seen that $(*)$ is strictly feasible and solvable, so that $\mathrm{Opt}[1]$ is the optimal value in the conic dual of (∗). The latter problem, as is immediately seen, after straightforward simplifications, becomes

$$
\operatorname{Opt}[1] = \max_{V, v, t} \left\{\operatorname{Tr}(VQ) + 2v^{T} q: \begin{array}{l} t \in \mathcal{T}, \operatorname{Tr}(S_{k} V) \leq t_{k}, k \leq K \\ \left[\begin{array}{cc} V & v \\ \hline v^{T} & 1 \end{array} \right] \succeq 0 \end{array} \right\}\tag{3.5.12}
$$

By definition,

$$
\operatorname{Opt}_{*}[1] = \max_{z, t} \left\{z^{T} Qz + 2q^{T} z: t \in \mathcal{T}, z^{T} S_{k} z \leq t_{k}, k \leq K \right\}.
$$

If (z, t) is a feasible solution to the latter problem, then $V = zz^{T}, v = z, t$ is a feasible solution to (3.5.12) with the same value of the objective, implying that $\mathrm{Opt[1]} \geq \mathrm{Opt}_{*}[1]$ , as stated in the first relation in (3.5.10) (recall that we are in the case of $\rho = 1)$

$\mathbf{2}^{0}$ . We have already stated that problem (3.5.12) is solvable. Let $V_{*}, v_{*}, t^{*}$ be its optimal solution, and let

$$
X_{*} = \left[\begin{array}{cc} V_{*} & v_{*} \\ \hline v_{*}^{T} & 1 \end{array} \right].
$$

Let $\zeta$ be Rademacher random vector of the same size as the one of $Q_{+}$ , let

$$
X_{*}^{1 / 2} Q_{+} X_{*}^{1 / 2} = U \mathrm{Diag} \{\mu\} U^{T}
$$

with orthogonal U, and let $\xi = X_{*}^{1 / 2} U \zeta =[\eta; \tau]$ , where $\tau$ is the last entry in $\xi.$ . Then

$$
\begin{array}{l} \xi^{T} Q_{+} \xi = \zeta^{T} U^{T} X_{*}^{1 / 2} Q_{+} X_{*}^{1 / 2} U \zeta = \zeta^{T} \mathrm{Diag} \{\mu\} \zeta \\ = \sum_{i} \mu_{i} = \mathrm{Tr}(X_{*}^{1 / 2} Q_{+} X_{*}^{1 / 2}) = \mathrm{Tr}(X_{*} Q_{+}) = \mathrm{Opt}[1].\end{array}\tag{3.5.13}
$$

Next, we have

$$
\xi \xi^{T} = \left[\begin{array}{cc} \eta \eta^{T} & \tau \eta \\ \hline \tau \eta^{T} & \tau^{2} \end{array} \right] = X_{*}^{1 / 2} U \zeta \zeta^{T} U^{T} X_{*}^{1 / 2}
$$

whence

$$
\mathbb{E} \{\xi \xi^{T}\} = \left[\begin{array}{cc} \mathbb{E} \{\eta \eta^{T}\} & \mathbb{E} \{\tau \eta\} \\ \hline \mathbb{E} \{\tau \eta^{T}\} & \mathbb{E} \{\tau^{2}\} \end{array} \right] = X_{*} = \left[\begin{array}{cc} V_{*} & v_{*} \\ \hline v_{*}^{T} & 1 \end{array} \right]\tag{3.5.14}
$$

In particular,

$$
\mathbb{E} \{\eta^{T} S_{k} \eta\} = \operatorname{Tr}(S_{k} \mathbb{E} \{\eta \eta^{T}\}) = \operatorname{Tr}(S_{k} V_{*}) \leq t_{k}^{*}, k \leq K,
$$

We have $\eta = W \zeta$ for certain rectangular matrix W such that $V_{*} = \mathbb{E} \{\eta \eta^{T}\} = \mathbb{E} \{W \zeta \zeta^{T} W^{T}\} =$ $WW^{T}$ Consequently, $\operatorname{Tr}(W^{T} S_{k} \bar{W}) ~ = ~ \mathbb{E} \{\zeta^{T} W^{T} S_{k} W \zeta\} ~ = ~ \mathbb{E} \{\eta^{\hat{T}} \dot{S_{k}} \eta\} ~ \leq ~ \acute{t_{k}^{*}}.$ Relations $W^{T} S_{k} W \succeq 0, \mathrm{Tr}(W^{T} S_{k} W) \leq t_{k}^{*}$ combine with Lemma 3.4.1 to imply that

$$
\operatorname{Prob} \{\eta^{T} S_{k} \eta > rt_{k}^{*}\} = \operatorname{Prob} \{\zeta^{T} W^{T} S_{k} W \zeta > rt_{k}^{*}\} \leq \sqrt{3} \exp \{- r / 3\} \forall r \geq 0, 1 \leq k \leq K.\tag{3.5.15}
$$

${\bf 3}^{0}$ . Invoking (3.5.14) we have

$$
\mathbb{E} \{\tau^{2}\} = \mathbb{E} \{[\xi \xi^{T}]_{N + 1, N + 1}\} = 1\tag{3.5.16}
$$

and

$$
\boldsymbol{\tau} = \boldsymbol{\beta}^{T} \boldsymbol{\zeta}
$$

for some vector $\beta$ with $\| \beta \|_{2} = 1$ due to (3.5.16). Now let us use the following fact [14, Lemma A.1]

Lemma 3.5.1 Let $\beta$ be a deterministic $\|{\bf \cdot} \ \|_{2} - unit$ vector in $\mathbb{R}^{N}$ and $\zeta$ be $N_{-}$ dimensional Rademacher random vector. Then Prob $\{| \beta^{T} \zeta | \le 1\} \ge 1 / 3$

Now, from definition of $\kappa$ it follows that

$$
K \sqrt{3} \exp \{- \kappa / 3\} < 1 / 3.
$$

By (3.5.15) as applied with $r = \kappa$ and Lemma 3.5.1 there exists a realization $\bar{\xi} =[\bar{\xi}; \bar{\tau}]$ of $\xi$ such that

$$
\bar{\xi}^{T} S_{k} \bar{\xi} \leq \kappa t_{k}^{*}, k \leq K \& | \bar{\tau} | \leq 1.\tag{3.5.17}
$$

Invoking (3.5.13) and taking into account that $| \bar{\tau} | \leq 1$ we have

$$
\mathrm{Opt}[1] = \bar{\xi}^{T} Q_{+} \bar{\xi} = \bar{\xi}^{T} Q \bar{\xi} + 2 \bar{\tau} q^{T} \bar{\xi} \leq \widehat{\xi}^{T} Q \widehat{\xi} + 2q^{T} \widehat{\xi},
$$

where $\widehat{\xi} = \bar{\xi}$ when $q^{T} \bar{\xi} \geq 0$ and ${\widehat{\xi}} = -{\bar{\xi}}$ otherwise. In both cases from the first relation in (3.5.17) we conclude that $\widehat{\xi} \in \mathcal{Z}[\kappa]$ , and we arrive at $\mathrm{Opt}[1] \leq \mathrm{Opt}_{*}[\kappa]$ ✷

## 3.5.3.1 Application: Approximating Afinely Adjustable Robust Counterpart of Uncertain Linear Programming problem with ellitopic uncertainty

The notion of Afinely Adjustable Robust Counterpart $(\mathrm{AARC})$ of uncertain LP was introduced and motivated in Section 2.4.5. As applied to uncertain LP

$$
\mathcal{LP} = \left\{\min_{x} \left\{c^{T}[\zeta] x: A[\zeta] x - b[\zeta] \geq 0 \right\}: \zeta \in \mathcal{Z} \right\}\tag{3.5.18}
$$

afinely parameterized by perturbation vector $\zeta$ and with variables $x_{j}$ allowed to be Affine functions of $P_{j} \zeta$ :

$$
x_{j} = \mu_{j} + \nu_{j}^{T} P_{j} \zeta,\tag{3.5.19}
$$

the AARC is the following semi-infinite optimization program in variables $t, \mu_{j}, \nu_{j}$ :

$$
\min_{t, \{\mu_{j}, \nu_{j}\}_{j = 1}^{n}} \left\{t: \begin{array}{l} \sum_{j} c_{j}[\zeta][\mu_{j} + \nu_{j}^{T} P_{j} \zeta] \leq t \forall \zeta \in \mathcal{Z} \\ \sum_{j}[\mu_{j} + \nu_{j}^{T} P_{j}] A_{j}[\zeta] - b[\zeta] \geq 0 \forall \zeta \in \mathcal{Z} \end{array} \right\}\tag{AARC}
$$

It was explained that in the case of fixed recourse $(c_{j}[\zeta]$ and $A_{j}[\zeta]$ are independent of $\zeta$ for all $j$ for which $x_{j}$ is adjustable, that is, $P_{j} \neq 0)$ , (AARC) is equivalent to an explicit conic quadratic program, provided that the perturbation set $\mathcal{Z}$ is CQr with essentially strictly feasible CQR. In fact CQ-representability plays no crucial role here (see Remark 2.4.1); in particular, when Z is SDr with an essentially strictly feasible SDR, (AARC), in the case of fixed recourse, is equivalent to an explicit semidefinite program. What indeed plays a crucial role is the assumption of fixed recourse; it can be shown that when this assumption does not hold, (AARC) can be computationally intractable. Our current goal is to demonstrate that even in this dificult case (AARC) admits a “tight” computationally tractable approximation, provided that Z is taken from a single-parametric family of ellitopes

$$
\mathcal{Z}[\rho] = \left\{\zeta : \exists t \in \mathcal{T}: \zeta^{T} S_{k} \zeta \leq \rho t_{k}, k \leq K \right\}
$$

where the $S_{k}$ and $\tau$ are as required by the definition of ellitope (see Section 3.4.2) and $\rho > 0$ is the “uncertainty level.”

As it is immediately seen, AARC of uncertain LP with perturbation set ${\mathcal Z} ={\mathcal Z}[\rho]$ is optimization problem of the form

$$
\operatorname{Opt}_{*}[\rho] = \min_{\theta \in \Theta} \left\{c^{T} \theta : \operatorname{Opt}_{i}^{*}[\theta; \rho] := \max_{\zeta \in \mathcal{Z}[\rho]} \left[\zeta^{T} P_{i}[\theta] \zeta + 2p_{i}^{T}[\theta] \zeta \right] \leq r_{i}[\theta], i \leq I \right\} \quad(\mathrm{AARC}[\rho])
$$

where

$\boldsymbol{\theta} \in{\mathbb{R}}^{N}$ is a collection of parameters of the Affine decision rules we are looking for,

- $\Theta$ is a given nonempty set $\mathbf{\Delta} \in \mathbb{R}^{N}$ (typically, $\boldsymbol \Theta ={\mathbb{R}}^{N}$ ; from now on, we assume that Θ is closed, convex, and computationally tractable, e.g., is given by an SDR),

$P_{i}[\theta], p_{i}[\theta], r_{i} \theta]$ are known Affine in θ matrix-, vector-, and real-valued functions.

Applying the construction from Section 3.5.3 to every one of the quantities

$$
\max_{\zeta \in \mathcal{Z}[\rho]} \left[\zeta^{T} P_{i}[\theta] \zeta + 2p_{i}^{T}[\theta] \zeta \right]
$$

and invoking Proposition 3.5.3, we arrive at computationally tractable convex problem

$$
\begin{array}{rcl} \operatorname{Opt}[\rho] & = & \min_{\theta \in \Theta} \left\{c^{T} \theta : \operatorname{Opt}_{i}[\theta; \rho] \leq r_{i}[\theta], i \leq I \right\} \\ \operatorname{Opt}_{i}[\theta; \rho] & = & \min_{\lambda^{i}, \mu^{i}} \left\{\rho \phi_{\mathcal{T}}(\lambda^{i}) + \mu^{i}: \left[\begin{array}{cc} \lambda^{i} \geq 0, \nu^{i} \geq 0 \\ \hline - p_{i}^{T} \theta & - p_{i}[\theta] \\ \hline - p_{i}^{T} \theta & \mu^{i} \end{array} \right] \succeq 0 \end{array} \right\}\tag{APPR[ρ]}
$$

such that

$$
\begin{array}{c} \forall(\rho > 0, \theta, i): \operatorname{Opt}_{i}^{*}[\theta; \rho] \leq \operatorname{Opt}_{i}[\theta; \rho] \leq \operatorname{Opt}_{i}^{*}[\theta; \kappa \rho] \\[\kappa = 3 \ln(6K)] \end{array}\tag{3.5.20}
$$

Note that when $\phi \tau$ is SDr (which definitely is the case when $\tau$ is a SDr set with essentially strictly feasible SDR, see comments after Theorem 3.4.5), $\left(\mathrm{APPR}[\rho] \right)$ reduces to a semidefinite program.

By (3.5.20), computationally tractable problem $(\mathrm{APPR}[\rho])$ is a safe tractable approximation of the problem of interest $\left(\operatorname{AARC}[\rho] \right)$ , meaning that the objectives of the problems are identical and every feasible solution θ of the approximating problem is feasible for the problem of interest as well. We are about to demonstrate that as far as dependence on the uncertainty level is concerned, this approximation is tight within the factor γ:

$$
\operatorname{Opt}_{*}[\rho] \leq \operatorname{Opt}[\rho] \leq \operatorname{Opt}_{*}[\kappa \rho].\tag{3.5.21}
$$

Indeed, we have already established the left inequality; to establish the right one, note that every feasible solution θ to $(\operatorname{AARC}[\kappa \rho])$ in view of (3.5.20) is a feasible solution to $\left(\mathrm{APPR}[\rho] \right)$ with the same value of the objective.

The “tightness result” has a quite transparent interpretation. In general, the problem of interest $\left(\operatorname{AARC}[\rho] \right)$ is computationally intractable; in contrast, its safe approximation $\left(\mathrm{APPR}[\rho] \right)$ is tractable. This approximation is conservative (when feasible, can result in a worse value of the objective that the problem of interest, or can be infeasible when the problem of interest is feasible), but this conservatism can be “compensated” by moderate reduction of the uncertainty level: $\mathrm{if}^{\6} \mathrm{in}$ the nature” there exist Affine decision rules which guarantee, in a robust w.r.t. uncertainty of level $\rho,$ some value v of the objective, our methodology finds in a computationally efficient fashion Affine decision rules which will guarantee the same value v of the objective robustly w.r.t. reduced uncertainty level $\rho / \kappa$ with a “moderate” κ.

## 3.5.3.2 Application: Robust Conic Quadratic Programming with ellitopic uncertainty

The concept of robust counterpart of an optimization problem with uncertain data (see Section 2.4.1) is in no sense restricted to Linear Programming. Whenever we have an optimization problem depending on some data, we may ask what happens when the data are uncertain and all we know is an uncertainty set the data belong to. Given such an uncertainty set, we may require from candidate solutions to be robust feasible – to satisfy the realizations of the constraints for all data running through the uncertainty set. The robust counterpart of an uncertain problem is the problem of minimizing the objective<sup>21)</sup> over the set of robust feasible solutions.

Now, we have seen in Section 2.4.1 that the “robust form” of an uncertain linear inequality with the coeficients varying in an ellipsoid is a conic quadratic inequality; as a result, the robust counterpart of an uncertain LP problem with ellipsoidal uncertainty (or, more general, with a $\mathrm{CQr}$ uncertainty set) is a conic quadratic problem. What is the “robust form” of an uncertain conic quadratic inequality

$$
\| Ax + b \|_{2} \leq c^{T} x + d \quad[A \in \mathbf{M}^{m, n}, b \in \mathbb{R}^{m}, c \in \mathbb{R}^{n}, d \in \mathbb{R}]\tag{3.5.22}
$$

with uncertain data $(A, b, c, d) \in \mathcal{U} ?$ The question is how to describe the set of all robust feasible solutions of this inequality, i.e., the set of x’s such that

$$
\| Ax + b \|_{2} \leq c^{T} x + d \quad \forall(A, b, c, d) \in \mathcal{U}.\tag{3.5.23}
$$

We intend to focus on the case when the uncertainty is “side-wise” – the data $(A, b)$ of the left hand side and the data $(c, d)$ of the right hand side of the inequality $(3.5.22)$ independently of each other run through respective uncertainty sets $\mathcal{U}^{\mathrm{left}}[\rho], \mathcal{U}^{\mathrm{right}} \left(\rho \geq 0 \right.$ is the left hand side uncertainty level). It sufices to assume the right hand side uncertainty set to be SDr with an essentially strictly feasible SDR:

$$
\mathcal{U}^{\text{right}} = \{(c, d) \mid \exists u: \mathcal{P} c + Qd + \mathcal{R} u \succeq S\}.\tag{3.5.24}
$$

$$
\min_{x} \{f(x): x \in X\} \mapsto \min_{t, x} \left\{t: f(x) - t \leq 0, x \in X \right\}.
$$

As about the left hand side uncertainty set, we assume that it is parameterized by “perturbation” $\zeta$ running through a single-parametric family of basic ellitopes:

$$
\mathcal{U}^{\mathrm{left}}[\rho] = \{[A, b] =[A_{*}, b_{*}] + \sum_{j} \zeta_{j}[A^{j}, b^{j}]: \zeta \in \mathcal{Z}[\rho]\} \mathcal{Z}[\rho] = \{z \in \mathbb{R}^{N}: \exists t \in \mathcal{T}: z^{T} S_{k} z \leq \rho t_{k}, k \leq K\}\tag{3.5.25}
$$

where $\tau$ and $S_{k}$ are as required in the definition of an ellitope (see Section 3.4.2.1).

Since the left hand side and the right hand side data independently of each other run through respective uncertainty sets, a point $x$ is robust feasible if and only if there exists a real $\tau$ such that

(a)

(b)

$$
\begin{array}{rcl} \tau & \leq & c^{T} x + d \quad \forall(c, d) \in \mathcal{U}^{\text{right}}, \\ \| Ax + b \|_{2} & \leq & \tau \quad \forall[A, b] \in \mathcal{U}^{\text{left}}[\rho].\end{array}\tag{3.5.26}
$$

We know that the set of $(\tau, x)$ satisfying (3.5.26.a) is SDr (see Proposition 2.4.2 and Remark 2.4.1); it is easy to verify that the corresponding SDR is as follows:

(a)

$$
\begin{array}{c}(x, \tau) \text{satisfies (3.5.26.a)} \\ \Updownarrow \\ \exists \Lambda : \\ \Lambda \succeq 0, \mathcal{P}^{*} \Lambda = x, \mathrm{Tr}(Q \Lambda) = 1, \mathcal{R}^{*} \Lambda = 0, \mathrm{Tr}(S \Lambda) \geq \tau.\end{array}\tag{b}
$$

(3.5.27)

As about building SDR of the set of pairs $(\tau, x)$ satisfying (3.5.26.b), this is much more dificult (and in many cases even hopeless) task, since (3.5.23) in general turns out to be NP-hard and as such cannot be posed as an explicit semidefinite program. We can, however, build a kind of safe (i.e., inner) approximation of the set in question utilizing semidefinite relaxation.

Observe that with sidewise uncertainty, we lose nothing when assuming that all we want it to build/safely approximate the robust counterpart

$$
\forall[A, b] \in \mathcal{U}[\rho]: \| Ax + b \|_{2} \leq \tau
$$

of uncertain conic quadratic inequality

$$
\{\| Ax + b \|_{2} \leq \tau |[A, b] \in \mathcal{U}[\rho]\}
$$

in variables $x, \tau$ (which we eventually will link by the constraints like (3.5.26), but for the time being it is irrelevant). Note that with our uncertainty set, the robust counterpart can be written down as the constraint

$$
\| \mathcal{A}[x][\zeta; 1] \|_{2} \leq \tau \forall \zeta \in \mathcal{Z}[\rho]\tag{\(\operatorname{RC}[\rho]\}
$$

in variables $x, \tau$ with $\boldsymbol{\mathcal{A}}[\boldsymbol{x}]$ Affine in x. Equivalently, the constraint can be written down as

$$
\forall \zeta \in \mathcal{Z}[\rho]:[\zeta; 1]^{T} \mathcal{A}^{T}[x] \mathcal{A}[x][\zeta; 1] \leq \tau^{2} \& \tau \geq 0.
$$

Note that by Schur Complement Lemma, $(\tau, x)$ is feasible for the latter constraints if and only if $(\tau, x)$ can be augmented by symmetric matrix X to yield a robust solution to the semi-infinite system of constraints

$$
\left[\begin{array}{cc} X & \mathcal{A}^{T}[x] \\ \hline \mathcal{A}[x] & \tau I \end{array} \right] \succeq 0\tag{a}
$$

$$
[\zeta; \dot{1}]^{T} X[\zeta; \dot{1}] \leq \tau \forall \zeta \in \mathcal{Z}[\rho]\tag{b}
$$

in variables $X, x, \tau$ . Constraint $(a)$ in this system is an explicit semidefinite constraint, which allows us to focus on the only troublemaker – the semiinfinite constraint (b). Representing

$$
X = \left[\begin{array}{cc} V & v \\ \hline v^{T} & w \end{array} \right],
$$

our task reduces to processing the semiinfinite constraint

$$
\zeta^{T} V \zeta + 2v^{T} \zeta \leq \tau - w \forall \zeta \in \mathcal{Z}[\rho]\tag{\((S[\rho])\}
$$

in variables $V, v, \tau, w$ . The task at hand can be resolved by Approximate S-Lemma (Proposition 3.5.3) which says that the system of explicit convex constraints

$$
\begin{array}{c} \lambda \in \mathbb{R}_{+}^{K}, \mu \geq 0 \\ \left[\begin{array}{cc} V & v \\ \hline v^{T} & \end{array} \right] \preceq \left[\begin{array}{cc} \sum_{k} \lambda_{k} S_{k} & \\ \hline & \mu \end{array} \right] \\ \rho \phi_{\mathcal{T}}(\lambda) + \mu \leq \tau - w \\ \left[\phi_{\mathcal{T}}(\lambda) = \max_{t \in \mathcal{T}} \lambda^{T} t \text{is the support function of} \mathcal{T} \right] \end{array}\tag{3.5.28}
$$

in variables $V, v, w, \tau, \lambda, \mu$ is a safe tractable approximation of $(S[\rho])$ : whenever $V, v, w, \tau$ can be extended by properly selected $\lambda, \mu$ to a feasible solution to (3.5.28), $V, v, w, \tau$ satisfy $(S[\rho])$ . Moreover, this approximation is tight within the factor $\kappa = 3 \ln(6K)$ , meaning that when $V, v, w, \tau$ cannot be extended to a feasible solution of (3.5.28), $V, v, w, \tau$ is unfeasible for $(S[\kappa \rho])$

Combining (3.5.28) with our preceding observations, we end up with a system $(S[\rho])$ of explicit convex constraints in “variables of interest” $x, \tau$ and additional variables $\omega$ which is a safe approximation of $\operatorname{RC}[\rho] \colon$ whenever $x, \tau$ can be augmented by appropriate value of $\omega$ to a feasible solution of $(S[\rho]),(x, \tau)$ is feasible for $\mathrm{RC}[\rho]$ . And if such “augmentation” is impossible, then $x, \tau$ perhaps are feasible for $\mathrm{RC}[\rho]$ , but definitely are not feasible for $\mathrm{RC}[\kappa \rho]$ . Thus, we have built computationally tractable safe approximation of the robust counterpart of uncertain conic quadratic inequality (3.5.22) with ellitopic left hand side perturbation set $\mathcal{Z}[\rho]$ , see (3.5.25), with moderate – logarithmic in $K -$ conservatism in terms of the uncertainty level $\rho.$

Finally, we note that

- When $\phi \tau$ is SDr (which definitely is the case when $\tau$ is SDr with essentially strictly feasible SDR, see comments to Theorem 3.4.5), $(S[\rho])$ reduces to a semidefinite program.

- When $K = 1 \(\mathrm{i.e.,} \ \mathcal{Z}[\rho]$ is the family of proportional to each other ellipses centered at the origin), Inhomogeneous S-Lemma in the role of Approximate S-Lemma shows that our safe conservative approximation of the robust counterpart of uncertain conic quadratic constraint is not conservative at ${\mathrm{all}} -(x, \tau)$ can be extended to a feasible solution to $(S[\rho])$ if and only if $(x, \tau)$ is feasible for $\mathrm{RC}[\rho]$

- Our uncertainty level $\rho$ is a kind of energy of perturbation rather than its magnitude — increasing $\rho$ by constant factor $\theta, \z[\rho]$ is multiplied by ${\sqrt{\theta}};$ as a result, the “true” conservatism of our safe approximation of $\mathrm{RC}[\rho]$ is $\sqrt{\kappa}$ rather than $\kappa \cdot$ if $(x, \tau)$ cannot be extended to a feasible solution of $(S[\rho])$ at certain uncertainty level, increasing an appropriate perturbation $\zeta \in \mathcal{Z}[\rho]$ by factor $\sqrt{\kappa}$ to get enlarged perturbation $\bar{\zeta}$ , we arrive at $\| \mathcal{A}[x][\bar{\zeta}; 1] \|_{2} > \tau$

Example: Antenna Synthesis revisited. To illustrate the potential of the Robust Optimization methodology as applied to conic quadratic problems, consider the Circular Antenna Design problem from Section 2.4.1. Assume that now we deal with 40 ring-type antenna elements, and that our goal is to minimize the (discretized) $L_{2}.$ -distance from the synthesized diagram $\sum_{j = 1}^{40} x_{j} D_{r_{j - 1}, r_{j}}(\cdot)$ to the “ideal” diagram $D_{*}(\cdot)$ which is equal to 1 in the range $77^{o} \leq \theta \leq 90^{o}$ and is equal to 0 in the range $0^{o} \leq \theta \leq 70^{o}$ . The associated problem is just the Least Squares problem

$$
\min_{\tau, x} \left\{\tau : \underbrace \sqrt{\frac{\sum_{\theta \in \Theta_{\mathrm{cns}}} D_{x}^{2}(\theta) + \sum_{\theta \in \Theta_{\mathrm{obj}}}(D_{x}(\theta) - 1)^{2}}{\operatorname{card}(\Theta_{\mathrm{cns}} \cup \Theta_{\mathrm{obj}})}}_{\| D_{*} - D_{x} \|_{2}} \leq \tau \right\},\tag{3.5.29}
$$

where $\Theta_{\mathrm{cns}}$ and $\Theta_{\mathrm{obj}}$ are the intersections of the 240-point grid on the segment $0 \leq \theta \leq 90^{o}$ with the “angle of interest” $77^{o} \leq \theta \leq 90^{o}$ and the “sidelobe angle” $0^{o} \leq \theta \leq 70^{o}$ , respectively.

The Nominal Least Squares design obtained from the optimal solution to this problem is completely unstable w.r.t. small implementation errors $x_{j} \mapsto(1 + \xi_{j}) x_{j}, | \xi_{j} | \leq \rho{\mathrm{;}}$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/5ebb67db7e0d680aabd36b2d2cd0966dc47f9c1f1480a402a4a98b3606340a1a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/8d52af7a51bcb81549d7c22348580b553a358fd107867bdb97d4dfc7e7767649.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/844b889a17c7fb99215b360d082dad0be34388e893d53b898a95475b25f44f08.jpg)  
a realization of D, 2% errors kD<sub>∗</sub> − Dk<sub>2</sub> ∈ [2.9, 19.6]  
Nominal Least Squares design: dream and reality.

Range of $\| D_{*} - D \|_{2}$ is obtained by simulating 100 diagrams afected by implementation errors.

In order to take into account implementation errors, we should treat (3.5.29) as an uncertain conic quadratic problem

$$
\left\{\min_{\tau, x} \left\{\tau : \| Ax - b \|_{2} \leq \tau \right\} | A \in \mathcal{U} \right\}
$$

with the uncertainty set of the form

$$
\mathcal{U} = \left\{A = A_{*} + A_{*} \operatorname{Diag}(\xi) \mid \xi_{k}^{2} \leq \rho \forall k \right\},
$$

which is a particular case of the ellitopic uncertainty with $K = \dim \xi.$ . In the experiments to be reported, we use $\rho =(0.02)^{2}$ (2% implementation errors). The approximate Robust Counterpart $(\mathrm{S}[\rho])$ of our uncertain conic quadratic problem yields the Robust design as follows:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/3c955226cd1ae3a9f19558f47f8cdc2c156519ad88f4801360a530a387d01567.jpg)  
Robust Least Squares design: dream and reality. Data from 100-element sample.

## 3.6 Semidefinite Relaxation and Chance Constraints

## 3.6.1 Chance constraints

We already have touched on two different occasions (Sections 2.4, 3.5.3.2) the important area of optimization under uncertainty — solving optimization problems with partially unknown (“uncertain”) data. However, for the time being, we have dealt solely with uncertain-but-bounded data perturbations, that is, data perturbations running through a given uncertainty set, and with a specific interpretation of an uncertainty-afected constraint: we wanted from the candidate solutions (non-adjustable or adjustable alike) to satisfy the constraints for all realizations of the data perturbations from the uncertainty set; this was called Robust Optimization paradigm. In Optimization there exists another approach to treating data uncertainty, the Stochastic Optimization approach historically by far preceding the RO one. With the Stochastic Optimization approach, the data perturbations are assumed to be random with completely or partially known probability distribution. In this situation, a natural way to handle data uncertainty is to pass to chance constrained forms of the uncertainty-afected constraints<sup>22</sup>, namely, to replace a constraint

$$
f(x, \zeta) \leq 0
$$

(x is the decision vector, ζ stands for data perturbation) with the constraint

$$
\mathrm{Prob}_{\zeta \sim P} \left\{\zeta : f(x, \zeta) \leq 0 \right\} \leq 1 - \epsilon,
$$

where $\epsilon \ll 1$ is a given tolerance, and $P$ is the distribution of ζ. This formulation tacitly assumes that the distribution of $\zeta$ is known exactly, which typically is not the case in reality. In real life, even if we have reasons to believe that the data perturbations are random (which by itself is a “big if”), we usually are not informed enough to point out their distribution exactly. Instead, we usually are able to point out a family P of probability distributions which contains the true distribution of $\zeta.$ In this case, we usually pass to ambiguously chance constrained version of the uncertain constraint:

$$
\sup_{P \in \mathcal{P}} \operatorname{Prob}_{\zeta \sim P} \left\{\zeta : f(x, \zeta) \leq 0 \right\} \geq 1 - \epsilon.\tag{3.6.1}
$$

Chance constraints is a quite old notion (going back to mid-1950’s); over the years, they were subject of intensive and fruitful research of numerous excellent scholars worldwide. With all due respect to this efort, chance constraints, even as simply-looking as scalar linear inequalities with randomly perturbed coeficients, remain quite challenging computationally<sup>23</sup>. The reason is twofold:

- Checking the validity of a chance constraint at a given point $x,$ even with exactly known distribution of $\zeta,$ requires multi-dimensional (provided ζ is so) integration, which typically is a computationally intractable task. Of course, one can replace precise integration by Monte Carlo simulation — by generating a long sample of independent realizations $\zeta^{1},..., \zeta^{N}$ of $\zeta$ and replacing the true probability with its empirical approximation – the frequency of the event $f(x, \zeta^{t}) \leq 0$ in the sample. However, this approach is unapplicable to the case of an ambiguous chance constraint and, in addition, does not work when $\epsilon$ is “really small,” like $10^{- 6}$ or less. The reason is that in order to decide reliably from simulations that the probability of the event $f(x, \zeta) > 0$ indeed is $\leq \epsilon,$ the sample size N should be of order of $1 / \epsilon$ and thus becomes impractically large when $\epsilon$ is “really small.”

- Another potential dificulty with chance constraint is that its feasible set can be nonconvex already for a pretty simple – just Affine in $x -$ function $f(x, \zeta)$ , which makes the optimization of objective over such a set highly problematic.

Essentially, the only generic situation where neither one of the above two dificulties occur is the case of scalar linear constraint

$$
\sum_{i = 1}^{n} \zeta_{i} x_{i} \leq 0
$$

with Gaussian $\zeta =[\zeta_{1};...; \zeta_{N}]$ . Assuming that the distribution of $\zeta$ is known exactly and denoting by $\mu.$ , Σ the expectation and the covariance matrix of $\zeta,$ , we have

$$
\mathrm{Prob} \{\sum_{i} \zeta_{i} x_{i} \leq 0\} \geq 1 - \epsilon \Leftrightarrow \sum_{i} \mu_{i} \zeta_{i} + \Phi^{- 1}(\epsilon) \sqrt{x^{T} \Sigma x} \leq 0,
$$

where $\Phi^{- 1}(\cdot)$ is the inverse error function given by:

$$
\int_{\Phi^{- 1}(\epsilon)}^{\infty} \frac{1}{\sqrt{2 \pi}} \exp \{- s^{2} / 2\} ds = \epsilon.
$$

When $\epsilon \leq 1 / 2$ , the above “deterministic equivalent” of the chance constraint is an explicit Conic Quadratic inequality.

## 3.6.2 Safe tractable approximations of chance constraints

When a chance constraint “as it $\mathrm{is}^{\prime \prime}$ is computationally intractable, one can look for the “second best thing” — a system S of eficiently computable convex constraints in variable x and perhaps additional slack variables u which “safely approximates” the chance constraint, meaning that whenever x can be extended, by a properly chosen u, to a feasible solution of S, x is feasible for the chance constraint of interest. For a survey of state-of-the-art techniques for safe tractable approximations of chance constraints, we refer an interested reader to [39, 15] and references therein. In the sequel, we concentrate on a particular technique of this type, originating from [17, 16] and heavily exploiting semidefinite relaxation; the results to follow are taken from [39].

## 3.6.3 Situation and goal

In the sequel, we focus on the chance constrained form of a quadratically perturbed scalar linear constraint. A generic form of such a chance constraint is

$$
\mathrm{Prob}_{\zeta \sim P} \left\{\mathrm{Tr}(WZ[\zeta]) \leq 0 \right\} \geq 1 - \epsilon \forall P \in \mathcal{P}, Z[\zeta] = \left[\begin{array}{cc} 1 & \zeta^{T} \\ \hline \zeta & \zeta \zeta^{T} \end{array} \right] \forall P \in \mathcal{P},\tag{3.6.2}
$$

where the data perturbations $\zeta \in \mathbb{R}^{d}$ , and the symmetric matrix $W$ is Affine in the decision variables; we lose nothing by assuming that W itself is the decision variable.

We start with the description of $\mathcal{P}_{\cdot}$ . Specifically, we assume that our a priori information on the distribution $P$ of the uncertain data can be summarized as follows:

P.1 We know that the marginals $P_{i}$ of ${\cal P} \(\mathrm{i.e.}$ , the distributions of the entries $\zeta_{i}$ in $\zeta)$ belong to given families $\mathcal{P}_{i}$ of probability distributions on the axis;

P.2 The matrix $V_{P} = \mathbb{E}_{\zeta \sim P} \{Z[\zeta]\}$ of the first and the second moments of $P$ is known to belong to a given convex closed subset V of the positive semidefinite cone;

P.3 P is supported on a set S given by a finite system of quadratic constraints:

$$
S = \{\zeta : \operatorname{Tr}(A_{\ell} Z[\zeta]) \leq 0, 1 \leq \ell \leq L\}
$$

The above assumptions model well enough a priori information on uncertain data in typical applications of decision-making origin.

## 3.6.4 Approximating chance constraints via Lagrangian relaxation

The approach, which we in the sequel refer to as Lagrangian approximation, implements the idea as follows. Assume that given $W$ , we have a systematic way to generate pairs $( \gamma ( \cdot ) : \mathbf { R } ^ { d } $ $\mathbb{R}, \theta > 0)$ such that $(\mathrm{I}) \ \gamma(\cdot) \geq 0$ in $S,(\mathrm{II}) \gamma(\cdot) \geq \theta$ in the part of S where $\operatorname{Tr}(WZ[\zeta]) \geq 0$ , and (c) we have at our disposal a functional Γ[γ] such that $\begin{array}{r}{\Gamma[\gamma] \ge \Gamma_{*}[\gamma] : = \operatorname{sup}_{P \in \mathcal{P}} \mathbb{E}_{\zeta \sim P} \left\{\gamma(\zeta) \right\}} \end{array}$ Since $\gamma(\cdot)$ is nonnegative at the support of $\zeta$ and $\mathrm{is} \geq \theta$ in the part of this support where the body $\operatorname{Tr}(WZ[\zeta])$ of the chance constraint is positive, we clearly have $\Gamma[\gamma] \ge \mathbb{E}_{\zeta \sim P \in \mathcal{P}} \{\gamma(\zeta)\} \ge$ $\theta \mathrm{Prob}_{\zeta \sim P} \{\mathrm{Tr}(WZ[\zeta]) < 0\}$ , so that the condition

$$
\Gamma[\gamma] \leq \theta \epsilon
$$

clearly is sufficient for the validity of (3.6.2), and we can further optimize this sufficient condition over the pairs $\gamma, \theta$ produced by our hypothetic mechanism.

The question is, how to build the required mechanism, and here is an answer. Let us start with building $\Gamma[\cdot]$ . Under our assumptions on ${\mathcal{P}}_{:}$ , the most natural family of functions $\gamma(\cdot)$ for which one can bound from above $\Gamma_{*}[\gamma]$ is comprised of functions of the form

$$
\gamma(\zeta) = \mathrm{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d} \gamma_{i}(\zeta_{i})\tag{3.6.3}
$$

with $Q \in \mathbf{S}^{d + 1}$ . For such $\textrm{a} \gamma,$ one can set

$$
\Gamma[\gamma] = \sup_{V \in \mathcal{V}} \mathrm{Tr}(QV) + \sum_{i = 1}^{d} \sup_{P_{i} \in \mathcal{P}_{i}} \int \gamma_{i}(\zeta_{i}) dP_{i}(\zeta_{i})
$$

Further, the simplest way to ensure (I) is to use Lagrangian relaxation, specifically, to require from the function $\gamma(\cdot)$ given by (3.6.3) to be such that with properly chosen $\mu_{\ell} \geq 0$ one has

$$
\operatorname{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d} \gamma_{i}(\zeta_{i}) + \sum_{\ell = 1}^{L} \mu_{\ell} \operatorname{Tr}(A_{\ell} Z[\zeta]) \geq 0 \forall \zeta \in \mathbb{R}^{d}.
$$

In turn, the simplest way to ensure the latter relation is to impose on $\gamma_{i}(\zeta_{i})$ the restrictions

$$
\begin{array}{rl}{(a)} &{\gamma_{i}(\zeta_{i}) \geq p_{i} \zeta_{i}^{2} + 2q_{i} \zeta_{i} + r_{i} \forall \zeta_{i} \in \mathbb{R},} \\{(b)} &{\mathrm{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d}[p_{i} \zeta_{i}^{2} + 2q_{i} \zeta_{i} + r_{i}] + \sum_{\ell = 1}^{L} \mu_{\ell} \mathrm{Tr}(A_{\ell} Z[\zeta]) \geq 0 \forall \zeta \in \mathbb{R}^{d};} \end{array}\tag{3.6.4}
$$

note that (b) reduces to the LMI

$$
Q + \left[\begin{array}{cc} \sum_{i} r_{i} & q^{T} \\ \hline q & \text{Diag} \{p\} \end{array} \right] + \sum_{\ell = 1}^{L} \mu_{\ell} A_{\ell} \succeq 0\tag{3.6.5}
$$

in variables $p =[p_{1};...; p_{d}], q =[q_{1};...; q_{d}], r =[r_{1};...; r_{d}], Q, \{\mu_{\ell} \geq 0\}_{\ell = 1}^{L}.$

Similarly, a sufficient condition for (II) is the existence of $p^{\prime}, q^{\prime}, r^{\prime} \in \mathbb{R}^{d}$ and nonnegative $\nu_{\ell}$ such that

$$
\begin{array}{rl}{(a)} &{\gamma_{i}(\zeta_{i}) \geq p_{i}^{\prime} \zeta_{i}^{2} + 2q_{i}^{\prime} \zeta_{i} + r_{i}^{\prime} \forall \zeta_{i} \in \mathbb{R},} \\{(b)} &{\mathrm{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d}[p_{i}^{\prime} \zeta_{i}^{2} + 2q_{i}^{\prime} \zeta_{i} + r_{i}^{\prime}] + \sum_{\ell = 1}^{L} \nu_{\ell} \mathrm{Tr}(A_{\ell} Z[\zeta]) - \mathrm{Tr}(WZ[\zeta]) \geq \theta \forall \zeta \in \mathbb{R}^{d},} \end{array}\tag{3.6.6}
$$

with (b) reducing to the LMI

$$
Q + \left[\begin{array}{cc} \sum_{i} r_{i}^{\prime} - \theta &[q^{\prime}]^{T} \\ \hline q^{\prime} & \mathrm{Diag} \{p^{\prime}\} \end{array} \right] + \sum_{\ell = 1}^{L} \nu_{\ell} A_{\ell} - W \succeq 0\tag{3.6.7}
$$

in variables W , $p^{\prime}, q^{\prime}, r^{\prime} \in \mathbb{R}^{d}, ~ Q, ~ \{\nu_{i} \geq 0\}_{i = 1}^{L}$ and $\theta > 0$ . Finally, observe that under the restrictions $(3.6.4.a),(3.6.6.a)$ , the best – resulting in the smallest possible $\Gamma[\gamma] - \mathrm{choice ~ of ~} \gamma_{i}(\cdot)$ is

$$
\gamma_{i}(\zeta_{i}) = \max[p_{i} \zeta_{i}^{2} + 2q_{i} \zeta_{i} + r_{i}, p_{i}^{\prime} \zeta_{i}^{2} + 2q_{i}^{\prime} \zeta_{i} + r_{i}^{\prime}].
$$

We have arrived at the following result:

Proposition 3.6.1 Let (S) be the system of constraints in variables W , $p, q, r, p^{\prime}, q^{\prime}, r^{\prime} \in \mathbb{R}^{d}$ ${\cal Q} \in{\bf S}^{d + 1}, \ \{\nu_{\ell} \in{\bf R}\}_{\ell = 1}^{L}, \ \theta \in{\bf R}, \ \{\mu_{\ell} \in{\bf R}\}_{\ell = 1}^{L}$ comprised of the LMIs (3.6.5), (3.6.7) augmented by the constraints

$$
\mu_{\ell} \geq 0 \forall \ell, \nu_{\ell} \geq 0 \forall \ell, \theta > 0\tag{3.6.8}
$$

<table><tr><td>Hypothesis</td><td>Approximation</td><td>Guaranteed profit-at-1%-risk</td></tr><tr><td>A</td><td>Bernstein</td><td>0.0552</td></tr><tr><td>B, C</td><td>Lagrangian</td><td>0.0101</td></tr></table>

Table 3.1: Optimal values in various approximations of (3.6.10).

and

$$
\sup_{V \in \mathcal{V}} \mathrm{Tr}(QV) + \sum_{i = 1}^{d} \sup_{P_{i} \in \mathcal{P}_{i}} \int \max[p_{i} \zeta_{i}^{2} + 2q_{i} \zeta_{i} + r_{i}, p_{i}^{\prime} \zeta_{i}^{2} + 2q_{i}^{\prime} \zeta_{i} + r_{i}^{\prime}] dP_{i} \leq \epsilon \theta.\tag{3.6.9}
$$

(S) is a system of convex constraints which is a safe approximation of the chance constraint (3.6.2), meaning that whenever W can be extended to a feasible solution of (S), W is feasible for the ambiguous chance constraint (3.6.2), P being given by P.1-3. This approximation is tractable, provided that the suprema in (3.6.9) are eficiently computable.

Note that the strict inequality $\theta > 0$ in (3.6.8) can be expressed by the LMI $\left[\begin{array}{ll}{\theta} &{1} \\{1} &{\lambda} \end{array} \right] \succeq 0.$

## 3.6.4.1 Illustration I

Consider the situation as follows: there are $d = 15$ assets with yearly returns $r_{i} = 1 + \mu_{i} + \sigma_{i} \zeta_{i}.$ where $\mu_{i}$ is the expected profit of i-th return, $\sigma_{i}$ is the return’s variability, and $\zeta_{i}$ is random factor with zero mean supported on [−1, 1]. The quantities $\mu_{i}, \sigma_{i}$ used in our illustration are shown on the left plot on figure 3.1. The goal is to distribute \$1 between the assets in order to maximize the value-at-1% risk (the lower 1%-quantile) of the yearly profit. This is the ambiguously chance constrained problem

$$
\operatorname{Opt} = \max_{t, x} \left\{t: \operatorname{Prob}_{\zeta \sim P} \left\{\sum_{i = 1}^{15} \mu_{i} x_{i} + \sum_{i = 1}^{15} \zeta_{i} \sigma_{i} x_{i} \geq t \right\} \geq 0.99 \forall P \in \mathcal{P}, x \geq 0, \sum_{i = 1}^{15} x_{i} = 1 \right\}\tag{3.6.10}
$$

Consider three hypotheses A, B, C about P. In all of them, $\zeta_{i}$ are zero mean and supported on $[- 1, 1]$ , so that the domain information is given by the quadratic inequalities $\zeta_{i}^{2} \leq 1, 1 \leq i \leq 15;$ this is exactly what is stated by C. In addition, A says that $\zeta_{i}$ are independent, and B says that the covariance matrix of $\zeta$ is proportional to the unit matrix. Thus, the sets V associated with the hypotheses are, respectively, $\{V \in \mathbf{S}_{+}^{d + 1} : V_{ii} \le V_{00} = 1, V_{ij} = 0, i \ne j\}, \{V \in \mathbf{S}_{+}^{d + 1} : 1 =$ $V_{00} \geq V_{11} = V_{22} =...= V_{dd}, V_{ij} = 0, i \neq j\}$ , and $\{V \in \mathbf{S}_{+}^{d + 1} : V_{ii} \le V_{00} = 1, V_{0j} = 0, 1 \le j \le d\}$ where $\mathbf{S}_{+}^{k}$ is the cone of positive semidefinite symmetric $k \times k$ matrices. Solving the associated safe tractable approximations of the problem, specifically, the Bernstein approximation in the case of $\mathrm{A}.$ , and the Lagrangian approximations in the cases of B, C, we arrive at the results displayed in table 3.1 and on figure 3.1.

Note that in our illustration, the (identical to each other) single-asset portfolios yielded by the Lagrangian approximation under hypotheses B, C are exactly optimal under circumstances. Indeed, on a closest inspection, there exists a distribution $P_{*}$ compatible with hypothesis B (and therefore – with C as well) such that the probability of “crisis,” where all $\zeta_{i}$ simultaneously are equal to $- 1, \ \mathrm{is} \ \geq \0.01$ . It follows that under hypotheses B, C, the worst-case, over $P \in{\mathcal{P}},$ profit at 1% risk of any portfolio cannot be better than the profit of this portfolio in the case of crisis, and the latter quantity is maximized by the single-asset portfolio depicted on figure 3.1. Note that the Lagrangian approximation turns out to be “intelligent enough” to discover this phenomenon and to infer its consequences. A couple of other instructive observations is as follows:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/d1f15680496598715a074b60974a3c821a987af1463d76d569135c975b8cf255.jpg)  
Expectations and ranges of returns

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/d6e564e8738a833b8fc8074f97372faacc1145a5095b8070d234ad8e113e29ed.jpg)  
Optimal portfolios: diversified (hypothesis A) and single-asset (hypotheses B, C)  
Figure 3.1: Data and results for portfolio allocation.

- the diversified portfolio yielded by the Bernstein approximation<sup>24</sup> in the case of crisis exhibits negative profit, meaning that under hypotheses B, C its worst-case profit at 1% risk is negative;

- assume that the yearly returns are observed on a year-by-year basis, and the year-by-year realizations of $\zeta$ are independent and identically distributed. It turns out that it takes over 100 years to distinguish, with reliability 0.99, between hypothesis A and the “bad” distribution $P_{*}$ via the historical data.

To put these observations into proper perspective, note that it is extremely time-consuming to identify, to reasonable accuracy and with reasonable reliability, a multi-dimensional distribution directly from historical data, so that in applications one usually postulates certain parametric form of the distribution with a relatively small number of parameters to be estimated from the historical data. When dim $\zeta$ is large, the requirement on the distribution to admit a lowdimensional parameterization usually results in postulating some kind of independence. While in some applications (e.g., in telecommunications) this independence in many cases can be justified via the “physics” of the uncertain data, in Finance and other decision-making applications postulating independence typically is an “act of faith” which is dificult to justify experimentally, and we believe a decision-maker should be well aware of the dangers related to these “acts of faith.”

## 3.6.5 Modification

When building safe tractable approximation of an afinely perturbed scalar linear chance constraint

$$
\forall p \in \mathcal{P}: \operatorname{Prob}_{\zeta \sim P} \{w_{0} + \sum_{i = 1}^{d} \zeta_{i} w_{i} \leq 0\} \geq 1 - \epsilon,\tag{3.6.11}
$$

one, essentially, is interested in efficient bounding from above the quantity

$$
p(w) = \sup_{P \in \mathcal{P}} \mathbb{E}_{\zeta \sim P} \left\{f(w_{0} + \sum_{i = 1}^{d} \zeta_{i} w_{i}) \right\}
$$

for a very specific function $f(s)$ , namely, equal to 0 when $s \leq 0$ and equal to 1 when $s > 0$ There are situations when we are interested in bounding similar quantity for other functions $f,$ specifically, piecewise linear convex function $f(s) = \operatorname{max}_{1 \leq j \leq J}[a_{i} + b_{i} s]$ , see, e.g., [21]. Here again one can use Lagrange relaxation, which in fact is able to cope with a more general problem of bounding from above the quantity

$$
\Psi[W] = \sup_{P \in \mathcal{P}} \mathbb{E}_{\zeta \sim P} \left\{f(W, \zeta) \right\}, f(W, \zeta) = \max_{1 \leq j \leq J} \mathrm{Tr}(W^{j} Z[\zeta]);
$$

here the matrices $W^{j} \in \mathbf{S}^{d + 1}$ are Affine in the decision variables and $\boldsymbol{W} =[W^{1},..., W^{J}]$ . Specifically, with the assumptions P.1-3 in force, observe that if, for a given W , a matrix $Q \in \mathbf{S}^{d + 1}$ and vectors $p^{j}, q^{j}, r^{j} \in \mathbb{R}^{d}, 1 \leq j \leq J$ are such that that the relations

$$
\mathrm{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d}[p_{i}^{j} \zeta_{i}^{2} + 2q_{i}^{j} \zeta_{i} + r_{i}^{j}] \geq \mathrm{Tr}(W^{j} Z[\zeta]) \forall \zeta \in S\tag{\((I_{j})\}
$$

take place for $1 \le j \le J$ , then the function

$$
\gamma(\zeta) = \mathrm{Tr}(QZ[\zeta]) + \sum_{i = 1}^{d} \max_{1 \leq j \leq J}[p_{i}^{j} \zeta_{i}^{2} + 2q_{i}^{j} \zeta_{i} + r_{i}^{j}]\tag{3.6.12}
$$

upper-bounds $f(W, \zeta)$ when $\zeta \in S$ , and therefore the quantity

$$
F(W, Q, p, q, r) = \sup_{V \in \mathcal{V}} \mathrm{Tr}(QV) + \sum_{i = 1}^{d} \sup_{P_{i} \in \mathcal{P}_{i}} \int \max_{1 \leq j \leq J}[p_{i}^{j} \zeta_{i}^{2} + 2q_{i}^{j} \zeta_{i} + r_{i}^{j}] dP_{i}(\zeta_{i})\tag{3.6.13}
$$

is an upper bound on $\Psi[W]$ . Using Lagrange relaxation, a sufficient condition for the validity of $(I_{j}), 1 \leq j \leq J.$ , is the existence of nonnegative $\mu_{j \ell}$ such that

$$
Q + \left[\begin{array}{cc} \sum_{i} r_{i}^{j} &[q^{j}]^{T} \\ \hline q^{j} & \text{Diag} \{p^{j}\} \end{array} \right] - W^{j} + \sum_{\ell = 1}^{L} \mu_{j \ell} A_{\ell} \succeq 0, 1 \leq j \leq J.\tag{3.6.14}
$$

We have arrived at the result as follows:

Proposition 3.6.2 Consider the system S of constraints in the variables $W =[W^{1},..., W^{d}]$ t and slack variables $Q \in \mathbf{S}^{d + 1}, \{p^{j}, q^{j}, r^{j} \in \mathbb{R}^{d} : 1 \le j \le J\}, \{\mu_{ij} : 1 \le i \le d, 1 \le j \le J\}$ comprised of LMIs (3.6.14) augmented by the constraints

(a) $\mu_{ij} \geq 0, \forall i, j$

(b)

$$
\max_{V \in \mathcal{V}} \mathrm{Tr}(QV) + \sum_{i = 1}^{d} \sup_{P_{i} \in \mathcal{P}_{i}} \int \max_{1 \leq j \leq J}[p_{i}^{j} \zeta_{i}^{2} + 2q_{i}^{j} \zeta_{i} + r_{i}^{j}] dP_{i}(\zeta_{i}) \leq t.\tag{3.6.15}
$$

The constraints in the system are convex; they are eficiently computable, provided that the suprema in (3.6.15.b) are eficiently computable, and whenever W, t can be extended to a feasible solution to ${\mathbf{}} S,$ one has $\Psi[W] \leq t$ . In particular, when the suprema in (3.6.15.b) are eficiently computable, the eficiently computable quantity

$$
\operatorname{Opt}[W] = \min_{t, Q, p, q, r, \mu} \left\{t: W, t, Q, p, q, r, \mu \text{satisfy} \mathcal{S} \right\}\tag{3.6.16}
$$

is a convex in W upper bound on $\Psi[W]$

## 3.6.5.1 Illustration II

Consider a special case of the above situation where all we know about $\zeta$ are the marginal distributions $P_{i}$ of $\zeta_{i}$ with well defined first order moments; in this case, $\mathcal{P}_{i} = \{P_{i}\}$ are singletons, and we lose nothing when setting $\mathcal{V} = \mathbf{S}_{+}^{d + 1}, S = \mathbb{R}^{d}$ . Let a piecewise linear convex function on the axis:

$$
f(s) = \max_{1 \leq j \leq J}[a_{j} + b_{j} s]
$$

be given, and let our goal be to bound from above the quantity

$$
\psi(w) = \sup_{P \in \mathcal{P}} \mathbb{E}_{\zeta \sim \mathcal{P}} \left\{f(\zeta^{w}) \right\}, \zeta^{w} = w_{0} + \sum_{i = 1}^{d} \zeta_{i} w_{i}.
$$

This is a special case of the problem we have considered, corresponding to

$$
W^{j} = \left[\begin{array}{cccc} a_{j} + b_{j} w_{0} & \frac{1}{2} b_{j} w_{1} & \ldots & \frac{1}{2} b_{j} w_{d} \\ \hline \frac{1}{2} b_{j} w_{1} & & & \\ \vdots & & & \\ \frac{1}{2} b_{j} w_{d} & & & \end{array} \right].
$$

In this case, system $s$ from Proposition 3.6.2, where we set $p_{i}^{j} = 0, Q = 0$ , reads

$$
\begin{array}{rl}(a) & 2q_{i}^{j} = b_{j} w_{i}, 1 \leq i \leq d, q \leq j \leq J, \sum_{i = 1}^{d} r_{i}^{j} \geq a_{j} + b_{j} w_{0}, \\(b) & \sum_{i = 1}^{d} \int \max_{1 \leq j \leq J}[2q_{i}^{j} \zeta_{i} + r_{i}^{j}] dP_{i}(\zeta_{i}) \leq t \end{array}
$$

so that the upper bound (3.6.16) on $\begin{array}{r}{\operatorname{sup}_{P \in \mathcal{P}} \mathbb{E}_{\zeta \sim P} \left\{f(\zeta^{w}) \right\}} \end{array}$ implies that

$$
\operatorname{Opt}[w] = \min_{\left\{r_{i}^{j} \right\}} \left\{\sum_{i = 1}^{d} \int \max_{1 \leq j \leq J} \left[b_{j} w_{i} \zeta_{i} + r_{i}^{j} \right] dP_{i}(\zeta_{i}): \sum_{i} r_{i}^{j} = a_{j} + b_{j} w_{0}, 1 \leq j \leq J \right\}\tag{3.6.17}
$$

is an upper bound on $\psi(w)$ . A surprising fact is that in the situation in question $({\mathrm{i.e.}}$ , when $\mathcal{P}$ is comprised of all probability distributions with given marginals $P_{1},..., P_{d})$ , the upper bound Opt[w] on $\psi(w)$ is equal to $\psi(w)$ [15, Poposition 4.5.4]. This result ofers an alternative (and simpler) proof for the following remarkable fact established by Dhaene et al [21]: if $f$ is a convex function on the axis and $\eta_{1},..., \eta_{d}$ are scalar random variables with distributions $P_{1},..., P_{d}$ possessing first order moments, then $\begin{array}{r}{\operatorname{sup}_{P \in \mathcal{P}} \mathbb{E}_{\eta \sim P} \{f(\eta_{1} + \ldots + \eta_{d})\}} \end{array}$ , P being the family of all distributions on $\mathbb{R}^{d}$ with marginals $P_{1},..., P_{d}$ , is achieved when $\eta_{1},..., \eta_{d}$ are comonotone, that is, are deterministic monotone transformation of a single random variable uniformly distributed on $[0, 1]$

## 3.7 Extremal ellipsoids

We already have met, on different occasions, with the notion of an ellipsoid – a set $E$ in $\mathbb{R}^{n}$ which can be represented as the image of the unit Euclidean ball under an Affine mapping:

$$
E = \{x = Au + c \mid u^{T} u \leq 1\}[A \in \mathbf{M}^{n, q}]\tag{Ell}
$$

Ellipsoids are very convenient mathematical entities:

## 3.7. EXTREMAL ELLIPSOIDS

- it is easy to specify an ellipsoid – just to point out the corresponding matrix A and vector $c;$

- the family of ellipsoids is closed with respect to Affine transformations: the image of an ellipsoid under an Affine mapping again is an ellipsoid;

- there are many operations, like minimization of a linear form, computation of volume, etc., which are easy to carry out when the set in question is an ellipsoid, and is dificult to carry out for more general convex sets.

By the indicated reasons, ellipsoids play important role in different areas of applied mathematics; in particular, people use ellipsoids to approximate more complicated sets. Just as a simple motivating example, consider a discrete-time linear time invariant controlled system:

$$
\begin{array}{rcl} x(t + 1) & = & Ax(t) + Bu(t), t = 0, 1, \ldots \\ x(0) & = & 0 \end{array}
$$

and assume that the control is norm-bounded:

$$
\| u(t) \|_{2} \leq 1 \quad \forall t.
$$

The question is what is the set $X_{T}$ of all states “reachable in a given time $T^{\mathfrak{s}}$ , i.e., the set of all possible values of $x(T)$ . We can easily write down the answer:

$$
X_{T} = \{x = Bu_{T - 1} + ABu_{T - 2} + A^{2} Bu_{T - 3} + \dots + A^{T - 1} Bu_{0} | \| u_{t} \|_{2} \leq 1, t = 0, \dots, T - 1\},
$$

but this answer is not “explicit”; just to check whether a given vector x belongs to $X_{T}$ requires to solve a nontrivial conic quadratic problem, the complexity of the problem being the larger the larger is T . In fact the geometry of $X_{T}$ may be very complicated, so that there is no possibility to get a “tractable” explicit description of the set. This is why in many applications it makes sense to use “simple” – ellipsoidal - approximations of $X_{T};$ as we shall see, approximations of this type can be computed in a recurrent and computationally efficient fashion.

It turns out that the natural framework for different problems of the “best possible” approximation of convex sets by ellipsoids is given by semidefinite programming. In this Section we intend to consider a number of basic problems of this type.

## 3.7.1 Preliminaries on ellipsoids

According to our definition, an ellipsoid in $\mathbb{R}^{n}$ is the image of the unit Euclidean ball in certain R<sup>q</sup> under an Affine mapping; e.g., for us a segment in $\mathbb{R}^{100}$ is an ellipsoid; indeed, it is the image of one-dimensional Euclidean ball under Affine mapping. In contrast to this, in geometry an ellipsoid in $\mathbb{R}^{n}$ is usually defined as the image of the n-dimensional unit Euclidean ball under an invertible Affine mapping, i.e., as the set of the form (Ell) with additional requirements that $q = n$ , i.e., that the matrix A is square, and that it is nonsingular. In order to avoid confusion, let us call these “true” ellipsoids full-dimensional. Note that a full-dimensional ellipsoid E admits two nice representations:

- First, E can be represented in the form (Ell) with positive definite symmetric A:

$$
E = \{x = Au + c \mid u^{T} u \leq 1\}[A \in \mathbf{S}_{+ +}^{n}]\tag{3.7.1}
$$

Indeed, it is clear that if a matrix A represents, via (Ell), a given ellipsoid E, the matrix AU, U being an orthogonal $n \times n$ matrix, represents E as well. It is known from Linear Algebra that by multiplying a nonsingular square matrix from the right by a properly chosen orthogonal matrix, we get a positive definite symmetric matrix, so that we always can parameterize a full-dimensional ellipsoid by a positive definite symmetric A.

- Second, E can be given by a strictly convex quadratic inequality:

$$
E = \{x \mid(x - c)^{T} D(x - c) \leq 1\}[D \in \mathbf{S}_{+ +}^{n}].\tag{3.7.2}
$$

Indeed, one may take $D = A^{- 2}$ , where A is the matrix from the representation (3.7.1).

Note that the set (3.7.2) makes sense and is convex when the matrix D is positive semidefinite rather than positive definite. When $D \succeq 0$ is not positive definite, the set (3.7.1) is, geometrically, an “elliptic cylinder” – a shift of the direct product of a full-dimensional ellipsoid in the range space of D and the complementary to this range linear subspace – the kernel of D.

In the sequel we deal a lot with volumes of full-dimensional ellipsoids. Since an invertible Affine transformation $x \mapsto Ax + b : \mathbb{R}^{n} \to \mathbb{R}^{n}$ multiplies the volumes of n-dimensional domains by $| \mathrm{Det} A |$ , the volume of a full-dimensional ellipsoid E given by (3.7.1) is $\kappa_{n} \mathrm{Det} A.$ , where $\kappa_{n}$ is the volume of the n-dimensional unit Euclidean ball. In order to avoid meaningless constant factors, it makes sense to pass from the usual n-dimensional volume ${\mathrm{mes}}_{n}(G)$ of a domain G to its normalized volume

$$
\mathrm{Vol}(G) = \kappa_{n}^{- 1} \mathrm{mes}_{n}(G),
$$

i.e., to choose, as the unit of volume, the volume of the unit ball rather than the one of the cube with unit edges. From now on, speaking about volumes of n-dimensional domains, we always mean their normalized volume (and omit the word “normalized”). With this convention, the volume of a full-dimensional ellipsoid E given by (3.7.1) is just

$$
\operatorname{Vol}(E) = \operatorname{Det} A,
$$

while for an ellipsoid given by (3.7.1) the volume is

$$
\mathrm{Vol}(E) =[\mathrm{Det} D]^{- 1 / 2}.
$$

## 3.7.2 Outer and inner ellipsoidal approximations

It was already mentioned that our current goal is to realize how to solve basic problems of “the best” ellipsoidal approximation E of a given set S. There are two types of these problems:

- Outer approximation, where we are looking for the “smallest” ellipsoid E containing the set S;

- Inner approximation, where we are looking for the “largest” ellipsoid E contained in the set S.

In both these problems, a natural way to say when one ellipsoid is “smaller” than another one is to compare the volumes of the ellipsoids. The main advantage of this viewpoint is that it results in Affine-invariant constructions: an invertible Affine transformation multiplies volumes of all domains by the same constant and therefore preserves ratios of volumes of the domains.

Thus, what we are interested in are the largest volume ellipsoid(s) contained in a given set S and the smallest volume ellipsoid(s) containing a given set S. In fact these extremal ellipsoids are unique, provided that S is a solid – a closed and bounded convex set with a nonempty interior, and are not too bad approximations of the set:

Theorem 3.7.1 [L¨owner – Fritz John] Let $S \subset \mathbb{R}^{n}$ be a solid. Then

(i) There exists and is uniquely defined the largest volume full-dimensional ellipsoid $E_{\mathrm{in}}$ contained in S. The concentric to $E_{\mathrm{in}}$ n times larger (in linear sizes) ellipsoid contains $S; ifS$ is central-symmetric, then already $\sqrt{n}$ times larger than $E_{\mathrm{in}}$ concentric to $E_{\mathrm{in}}$ ellipsoid contains S.

(ii) There exists and is uniquely defined the smallest volume full-dimensional ellipsoid $E_{\mathrm{out}}$ containing S. The concentric to $E_{\mathrm{out}}$ n times smaller (in linear sizes) ellipsoid is contained in $S; \textit{if} S$ is central-symmetric, then already $\sqrt{n}$ times smaller than $E_{\mathrm{out}}$ concentric to $E_{\mathrm{out}}$ ellipsoid is contained in S.

The proof is the subject of Exercise 3.37.

The existence of extremal ellipsoids is, of course, a good news; but how to compute these ellipsoids? The possibility to compute eficiently (nearly) extremal ellipsoids heavily depends on the description of S. Let us start with two simple examples.

## 3.7.2.1 Inner ellipsoidal approximation of a polytope

Let S be a polyhedral set given by a number of linear equalities:

$$
S = \{x \in \mathbb{R}^{n} \mid a_{i}^{T} x \leq b_{i}, i = 1, \dots, m\}.
$$

Proposition 3.7.1 Assume that S is a full-dimensional polytope $(i.e.$ , is bounded and possesses a nonempty interior). Then the largest volume ellipsoid contained in S is

$$
E = \{x = Z_{*} u + z_{*} \mid u^{T} u \leq 1\},
$$

where $Z_{*}, z_{*}$ are given by an optimal solution to the following semidefinite program:

maximize t

s.t.

(a)

$$
t \leq(\operatorname{Det} Z)^{1 / n},\tag{In}
$$

(b)

$$
Z \succeq 0,\tag{c}
$$

$$
\| Za_{i} \|_{2} \leq b_{i} - a_{i}^{T} z, i = 1, \dots, m,
$$

with the design variables $Z \in \mathbf{S}^{n}, z \in \mathbb{R}^{n}, t \in \mathbb{R}$

Note that (In) indeed is a semidefinite program: both (In.a) and (In.c) can be represented by LMIs, see Examples 18d and 1-17 in Section 3.2.

Proof. Indeed, an ellipsoid (3.7.1) is contained in S if and only if

$$
a_{i}^{T}(Au + c) \leq b_{i} \quad \forall u: u^{T} u \leq 1,
$$

or, which is the same, if and only if

$$
\| Aa_{i} \|_{2} + a_{i}^{T} c = \max_{u: u^{T} u \leq 1}[a_{i}^{T} Au + a_{i}^{T} c] \leq b_{i}.
$$

Thus, $(\mathrm{In}.b - c)$ just express the fact that the ellipsoid $\{x = Zu + z \mid u^{T} u \leq 1\}$ is contained in S, so that (In) is nothing but the problem of maximizing (a positive power of) the volume of an ellipsoid over ellipsoids contained in S. ✷

We see that if S is a polytope given by a set of linear inequalities, then the problem of the best inner ellipsoidal approximation of S is an explicit semidefinite program and as such can be eficiently solved. In contrast to this, if S is a polytope given as a convex hull of finite set:

$$
S = \operatorname{Conv} \{x_{1}, \dots, x_{m}\},
$$

then the problem of the best inner ellipsoidal approximation of S is “computationally intractable” – in this case, it is dificult just to check whether a given candidate ellipsoid is contained in S.

## 3.7.2.2 Outer ellipsoidal approximation of a finite set

Let S be a polyhedral set given as a convex hull of a finite set of points:

$$
S = \operatorname{Conv} \{x_{1}, \dots, x_{m}\}.
$$

Proposition 3.7.2 Assume that S is a full-dimensional polytope $(i.e.,$ possesses a nonempty interior). Then the smallest volume ellipsoid containing S is

$$
E = \{x \mid(x - c_{*})^{T} D_{*}(x - c_{*}) \leq 1\},
$$

where $c_{*}, D_{*}$ are given by an optimal solution $\left(t_{*}, Z_{*}, z_{*}, s_{*} \right)$ to the semidefinite program

maximize t

s.t.

(a)

(b)

$$
t \leq(\operatorname{Det} Z)^{1 / n},\tag{c}
$$

$$
Z \succeq 0,\tag{Out}
$$

$$
\left(\begin{array}{cc} s & z^{T} \\ z & Z \end{array} \right) \succeq 0,\tag{d}
$$

$$
x_{i}^{T} Zx_{i} - 2x_{i}^{T} z + s \leq 1, i = 1, \dots, m,
$$

with the design variables $Z \in{\bf S}^{n}, z \in \mathbb{R}^{n}, t, s \in \mathbb{R}$ via the relations

$$
D_{*} = Z_{*}; c_{*} = Z_{*}^{- 1} z_{*}.
$$

Note that (Out) indeed is a semidefinite program, cf. Proposition 3.7.1.

Proof. Indeed, let us pass in the description (3.7.2) from the “parameters” $D, c$ to the parameters $Z = D, z = Dc$ , thus coming to the representation

$$
E = \{x \mid x^{T} Zx - 2x^{T} z + z^{T} Z^{- 1} z \leq 1\}.\tag{!}
$$

The ellipsoid of the latter type contains the points $x_{1},..., x_{m}$ if and only if

$$
x_{i}^{T} Zx_{i} - 2x_{i}^{T} z + z^{T} Z^{- 1} z \leq 1, i = 1, \dots, m,
$$

or, which is the same, if and only if there exists $s \geq z^{T} Z^{- 1} z$ such that

$$
x_{i}^{T} Zx_{i} - 2x_{i}^{T} z + s \leq 1, i = 1, \dots, m.
$$

Recalling Lemma on the Schur Complement, we see that the constraints $(\mathrm{Out}.b - d)$ say exactly that the ellipsoid (!) contains the points $x_{1},..., x_{m}$ Since the volume of such an ellipsoid is $\mathrm{(Det} Z)^{- 1 / 2}$ , (Out) is the problem of maximizing a negative power of the volume of an ellipsoid containing the finite set $\{x_{1},..., x_{m}\}$ , i.e., the problem of finding the smallest volume ellipsoid containing this finite set. It remains to note that an ellipsoid is convex, so that it is exactly the same – to say that it contains a finite set $\{x_{1},..., x_{m}\}$ and to say that it contains the convex hull of this finite set. ✷

We see that if S is a polytope given as a convex hull of a finite set, then the problem of the best outer ellipsoidal approximation of S is an explicit semidefinite program and as such can be eficiently solved. In contrast to this, if S is a polytope given by a list of inequality constraints, then the problem of the best outer ellipsoidal approximation of S is “computationally intractable” – in this case, it is dificult just to check whether a given candidate ellipsoid contains S.

## 3.7.3 Ellipsoidal approximations of unions/intersections of ellipsoids

Speaking informally, Proposition 3.7.1 deals with inner ellipsoidal approximation of the intersection of “degenerate” ellipsoids, namely, half-spaces (a half-space is just a very large Euclidean ball!) Similarly, Proposition 3.7.2 deals with the outer ellipsoidal approximation of the union of degenerate ellipsoids, namely, points (a point is just a ball of zero radius!). We are about to demonstrate that when passing from “degenerate” ellipsoids to the “normal” ones, we still have a possibility to reduce the corresponding approximation problems to explicit semidefinite programs. The key observation here is as follows:

Proposition 3.7.3 [18] An ellipsoid

$$
E = E(Z, z) \equiv \{x = Zu + z \mid u^{T} u \leq 1\}[Z \in \mathbf{M}^{n, q}]
$$

is contained in the full-dimensional ellipsoid

$$
W = W(Y, y) \equiv \{x \mid(x - y)^{T} Y^{T} Y(x - y) \leq 1\}[Y \in \mathbf{M}^{n, n}, \mathrm{Det} Y \neq 0]
$$

if and only if there exists λ such that

$$
\left(\begin{array}{ccc} I_{n} & Y(z - y) & YZ \\(z - y)^{T} Y^{T} & 1 - \lambda & \\ Z^{T} Y^{T} & & \lambda I_{q} \end{array} \right) \succeq 0\tag{3.7.3}
$$

as well as if and only if there exists λ such that

$$
\left(\begin{array}{ccc} Y^{- 1}(Y^{- 1})^{T} & z - y & Z \\(z - y)^{T} & 1 - \lambda & \\ Z^{T} & & \lambda I_{q} \end{array} \right) \succeq 0\tag{3.7.4}
$$

Proof. We clearly have

$$
\begin{array}{c} E \subset W \\ \Updownarrow \\ u^{T} u \leq 1 \Rightarrow(Zu + z - y)^{T} Y^{T} Y(Zu + z - y) \leq 1 \\ \Updownarrow \\ u^{T} u \leq t^{2} \Rightarrow(Zu + t(z - y))^{T} Y^{T} Y(Zu + t(z - y)) \leq t^{2} \\ \Updownarrow \mathcal{S} \text{-Lemma} \\ \exists \lambda \geq 0:[t^{2} -(Zu + t(z - y))^{T} Y^{T} Y(Zu + t(z - y))] - \lambda[t^{2} - u^{T} u] \geq 0 \quad \forall(u, t) \\ \exists \lambda \geq 0: \left(\begin{array}{cc} 1 - \lambda -(z - y)^{T} Y^{T} Y(z - y) & -(z - y)^{T} Y^{T} YZ \\ - Z^{T} Y^{T} Y(z - y) & \lambda I_{q} - Z^{T} Y^{T} YZ \end{array} \right) \succeq 0 \\ \Updownarrow \\ \exists \lambda \geq 0: \binom{1 - \lambda}{\lambda I_{q}} - \binom{(z - y)^{T} Y^{T}}{Z^{T} Y^{T}}(Y(z - y) \quad YZ) \succeq 0 \end{array}
$$

Now note that in view of Lemma on the Schur Complement the matrix

$$
\left(\begin{array}{cc} 1 - \lambda & \\ & \lambda I_{q} \end{array} \right) - \binom{(z - y)^{T} Y^{T}}{Z^{T} Y^{T}}(Y(z - y) YZ)
$$

is positive semidefinite if and only if the matrix in (3.7.3) is so. Thus, $E \subset W$ if and only if there exists a nonnegative λ such that the matrix in (3.7.3), let it be called $P(\lambda)$ , is positive semidefinite. Since the latter matrix can be positive semidefinite only when $\lambda \geq 0$ , we have proved the first statement of the proposition. To prove the second statement, note that the matrix in (3.7.4), let it be called $Q(\lambda)$ , is closely related to $P(\lambda)$

$$
Q(\lambda) = SP(\lambda) S^{T}, \quad S = \left(\begin{array}{ccc} Y^{- 1} & & \\ & 1 & \\ & & I_{q} \end{array} \right) \succ 0,
$$

so that $Q(\lambda)$ is positive semidefinite if and only if $P(\lambda)$ is so.

Here are some consequences of Proposition 3.7.3.

## 3.7.3.1 Inner ellipsoidal approximation of the intersection of full-dimensional ellipsoids

Let

$$
W_{i} = \{x \mid(x - c_{i})^{T} B_{i}^{2}(x - c_{i}) \leq 1\}[B_{i} \in \mathbf{S}_{+ +}^{n}],
$$

$i = 1,..., m$ , be given full-dimensional ellipsoids in $\mathbb{R}^{n}$ ; assume that the intersection $W$ of these ellipsoids possesses a nonempty interior. Then the problem of the best inner ellipsoidal approximation of W is the explicit semidefinite program

maximize

s.t.

$$
\begin{array}{rlr}{t} &{\leq} &{(\mathrm{Det} Z)^{1 / n},} \\{\left(\begin{array}{ccc} I_{n} & B_{i}(z - c_{i}) & B_{i} Z \\(z - c_{i})^{T} B_{i} & 1 - \lambda_{i} & \\ ZB_{i} & & \lambda_{i} I_{n} \end{array} \right)} &{\succeq} &{0, i = 1, \dots, m,} \\{Z} &{\succeq} &{0} \end{array}\tag{InEll}
$$

with the design variables $Z \in{\bf S}^{n}, z \in{\bf R}^{n}, \lambda_{i}, t \in{\bf R}$ . The largest ellipsoid contained in $W =$ $\bigcap_{i = 1}^{m} W_{i}$ is given by an optimal solution $Z_{*}, z_{*}, t_{*}, \{\lambda_{i}^{*}\})$ of (InEll) via the relation

$$
E = \{x = Z_{*} u + z_{*} \mid u^{T} u \leq 1\}.
$$

Indeed, by Proposition 3.7.3 the LMIs

$$
\left(\begin{array}{ccc} I_{n} & B_{i}(z - c_{i}) & B_{i} Z \\(z - c_{i})^{T} B_{i} & 1 - \lambda_{i} & \\ ZB_{i} & & \lambda_{i} I_{n} \end{array} \right) \succeq 0, i = 1,..., m
$$

express the fact that the ellipsoid $\{x = Zu + z \mid u^{T} u \leq 1\}$ with $Z \succeq 0$ is contained in every one of the ellipsoids $W_{i}, \mathrm{i.e.}$ , is contained in the intersection W of these ellipsoids. Consequently, (InEll) is exactly the problem of maximizing (a positive power of) the volume of an ellipsoid over the ellipsoids contained in W .

## 3.7.3.2 Outer ellipsoidal approximation of the union of ellipsoids

$$
W_{i} = \{x = A_{i} u + c_{i} \mid u^{T} u \leq 1\}[A_{i} \in \mathbf{M}^{n, k_{i}}],
$$

$i = 1,..., m$ , be given ellipsoids in $\mathbb{R}^{n};$ assume that the convex hull W of the union of these ellipsoids possesses a nonempty interior. Then the problem of the best outer ellipsoidal approximation of W is the explicit semidefinite program

maximize t

s.t.

$$
\begin{array}{rcl} & t & \leq(\mathrm{Det} Y)^{1 / n}, \\ \left(\begin{array}{ccc} I_{n} & Yc_{i} - z & YA_{i} \\(Yc_{i} - z)^{T} & 1 - \lambda_{i} & \\ A_{i}^{T} Y & & \lambda_{i} I_{k_{i}} \end{array} \right) & \succeq & 0, i = 1,..., m, \\ Y & \succeq & 0 \end{array}\tag{OutEll}
$$

with the design variables $Y \in{\bf S}^{n}, z \in{\bf R}^{n}, \lambda_{i}, t \in{\bf R}$ . The smallest ellipsoid containing $W =$ $\operatorname{Conv}(\bigcup_{i = 1}^{m} W_{i})$ is given by an optimal solution $(Y_{*}, z_{*}, t_{*}, \{\lambda_{i}^{*}\})$ of (OutEll) via the relation

$$
E = \{x \mid(x - y_{*}) Y_{*}^{2}(x - y_{*}) \leq 1\}, \quad y_{*} = Y_{*}^{- 1} z_{*}.
$$

Indeed, by Proposition 3.7.3 for $Y \succ 0$ the LMIs

$$
\left(\begin{array}{ccc} I_{n} & Yc_{i} - z & YA_{i} \\(Yc_{i} - z)^{T} & 1 - \lambda_{i} & \\ A_{i}^{T} Y & & \lambda_{i} I_{k_{i}} \end{array} \right) \succeq 0, i = 1,..., m
$$

express the fact that the ellipsoid $E = \{x \mid(x - Y^{- 1} z)^{T} Y^{2}(x - Y^{- 1} y) \leq 1\}$ contains every one of the ellipsoids $W_{i}, \mathrm{i.e.}$ , contains the convex hull W of the union of these ellipsoids. The volume of the ellipsoid E is $\mathrm{(Det} Y)^{- 1}$ ; consequently, (OutEll) is exactly the problem of maximizing a negative power (i.e., of minimizing a positive power) of the volume of an ellipsoid over the ellipsoids containing W .

## 3.7.4 Approximating sums of ellipsoids

Let us come back to our motivating example, where we were interested to build ellipsoidal approximation of the set $X_{T}$ of all states $x(T)$ where a given discrete time invariant linear system

$$
\begin{array}{rcl} x(t + 1) & = & Ax(t) + Bu(t), t = 0,..., T - 1 \\ x(0) & = & 0 \end{array}
$$

can be driven in time T by a control $u(\cdot)$ satisfying the norm bound

$$
\| u(t) \|_{2} \leq 1, t = 0, \dots, T - 1.
$$

How could we build such an approximation recursively? Let $X_{t}$ be the set of all states where the system can be driven in time $t \leq T.$ , and assume that we have already built inner and outer ellipsoidal approximations $E_{\mathrm{in}}^{t}$ and $E_{\mathrm{out}}^{t}$ of the set $X_{t} \colon$

$$
E_{\mathrm{in}}^{t} \subset X_{t} \subset E_{\mathrm{out}}^{t}.
$$

Let also

$$
E = \{x = Bu \mid u^{T} u \leq 1\}.
$$

Then the set

$$
F_{\mathrm{in}}^{t + 1} = AE_{\mathrm{in}}^{t} + E \equiv \{x = Ay + z | y \in E_{\mathrm{in}}^{t}, z \in E\}
$$

clearly is contained in $X_{t + 1}$ , so that a natural recurrent way to define an inner ellipsoidal approximation of $X_{t + 1}$ is to take as $E_{\mathrm{in}}^{t + 1}$ the largest volume ellipsoid contained in $F_{\mathrm{in}}^{t + 1}$ . Similarly, the set

$$
F_{\mathrm{out}}^{t + 1} = AE_{\mathrm{out}}^{t} + E \equiv \{x = Ay + z | y \in E_{\mathrm{out}}^{t}, z \in E\}
$$

clearly covers $X_{t + 1}$ , and the natural recurrent way to define an outer ellipsoidal approximation of $X_{t + 1}$ is to take as $E_{\mathrm{out}}^{t + 1}$ the smallest volume ellipsoid containing $F_{\mathrm{out}}^{t + 1}$

Note that the sets $F_{\mathrm{in}}^{t + 1}$ and $F_{\mathrm{out}}^{t + 1}$ are of the same structure: each of them is the arithmetic sum $\{x = v + w \mid v \in V, w \in W\}$ of two ellipsoids V and W . Thus, we come to the problem as follows: Given two ellipsoids W, V , find the best inner and outer ellipsoidal approximations of their arithmetic sum $W + V$ . In fact, it makes sense to consider a little bit more general problem:

Given m ellipsoids $W_{1},..., W_{m}$ in $\mathbb{R}^{n}$ , find the best inner and outer ellipsoidal $ap -$ proximations of the arithmetic sum

$$
W = \left\{x = w_{1} + w_{1} + \dots + w_{m} \mid w_{i} \in W_{i}, i = 1, \dots, m \right\}
$$

of the ellipsoids $W_{1},..., W_{m}$

In fact, we have posed two different problems: the one of inner approximation of W (let this problem be called (I)) and the other one, let it be called (O), of outer approximation. It seems that in general both these problems are dificult (at least when m is not once for ever fixed). There exist, however, “computationally tractable” approximations of both (I) and (O) we are about to consider.

In considerations to follow we assume, for the sake of simplicity, that the ellipsoids $W_{1},..., W_{m}$ are full-dimensional (which is not a severe restriction – a “flat” ellipsoid can be easily approxi mated by a “nearly flat” full-dimensional ellipsoid). Besides this, we may assume without loss of generality that all our ellipsoids $W_{i}$ are centered at the origin. Indeed, we have $W_{i} = c_{i} + V_{i},$ where $c_{i}$ is the center of $W_{i}$ and $V_{i} = W_{i} - c_{i}$ is centered at the origin; consequently,

$$
W_{1} + \dots + W_{m} =(c_{1} + \dots + c_{m}) +(V_{1} + \dots + V_{m}),
$$

so that the problems (I) and (O) for the ellipsoids $W_{1},..., W_{m}$ can be straightforwardly reduced to similar problems for the centered at the origin ellipsoids $V_{1},..., V_{m}$

## 3.7.4.1 Problem (O)

Let the ellipsoids $W_{1},..., W_{m}$ be represented as

$$
W_{i} = \{x \in \mathbb{R}^{n} \mid x^{T} B_{i} x \leq 1\}\tag{\([B_i \succ 0]\).}
$$

Our strategy to approximate (O) is very natural: we intend to build a parametric family of ellipsoids in such a way that, first, every ellipsoid from the family contains the arithmetic sum $W_{1} + \ldots + W_{m}$ of given ellipsoids, and, second, the problem of finding the smallest volume ellipsoid within the family is a “computationally tractable” problem (specifically, is an explicit semidefinite program)<sup>25)</sup>. The seemingly simplest way to build the desired family was proposed in [18] and is based on the idea of semidefinite relaxation. Let us start with the observation that an ellipsoid

$$
W[Z] = \{x \mid x^{T} Zx \leq 1\}\tag{\([Z\succ 0]\}
$$

contains $W_{1} + \ldots + W_{m}$ if and only if the following implication holds:

$$
\left\{\{x^{i} \in \mathbb{R}^{n}\}_{i = 1}^{m},[x^{i}]^{T} B_{i} x^{i} \leq 1, i = 1,..., m \right\} \Rightarrow(x^{1} +...+ x^{m})^{T} Z(x^{1} +...+ x^{m}) \leq 1.\tag{\((*)\}
$$

Now let $B^{i}$ be $(nm) \times(nm)$ block-diagonal matrix with m diagonal blocks of the size $n \times n$ each, such that all diagonal blocks, except the i-th one, are zero, and the i-th block is the $n \times n$ matrix $B_{i}$ . Let also $M[Z]$ denote $(mn) \times(mn)$ block matrix with $m^{2}$ blocks of the size $n \times n$ each, every of these blocks being the matrix Z. This is how $B^{i}$ and $M[Z]$ look in the case of $m = 2 \colon$

$$
B^{1} = \left[\begin{array}{ll} B_{1} & \\ & \end{array} \right], \quad B^{2} = \left[\begin{array}{ll} & \\ & B_{2} \end{array} \right], \quad M[Z] = \left[\begin{array}{ll} Z & Z \\ Z & Z \end{array} \right].
$$

Validity of implication (∗) clearly is equivalent to the following fact:

(\*.1) For every (mn)-dimensional vector x such that

$$
x^{T} B^{i} x \equiv \mathrm{Tr}(B^{i} \underbrace{xx^{T}}_{X[x]}) \leq 1, i = 1,..., m,
$$

one has

$$
x^{T} M[Z] x \equiv \mathrm{Tr}(M[Z] X[x]) \leq 1.
$$

Now we can use the standard trick: the rank one matrix $X[x]$ is positive semidefinite, so that we for sure enforce the validity of the above fact when enforcing the following stronger fact:

(\*.2) For every $(mn) \times(mn)$ symmetric positive semidefinite matrix X such that

$$
\mathrm{Tr}(B^{i} X) \leq 1, i = 1,..., m,
$$

one has

$$
\operatorname{Tr}(M[Z] X) \leq 1.
$$

We have arrived at the following result.

(D) Let a positive definite $n \times n$ matrix $Z$ be such that the optimal value in the semidefinite program

$$
\max_{X} \left\{\mathrm{Tr}(M[Z] X) | \mathrm{Tr}(B^{i} X) \leq 1, i = 1,..., m, X \succeq 0 \right\}\tag{SDP}
$$

is $\leq 1$ . Then the ellipsoid

$$
W[Z] = \{x \mid x^{T} Zx \leq 1\}
$$

contains the arithmetic sum $W_{1} + \ldots + W_{m}$ of the ellipsoids $\begin{array}{r}{W_{i} = \{x \mid x^{T} B_{i} x \leq 1\}} \end{array}$

We are basically done: the set of those symmetric matrices Z for which the optimal value in (SDP) $\mathrm{is} \leq 1$ is SD-representable; indeed, the problem is clearly strictly feasible, and Z afects, in a linear fashion, the objective of the problem only. On the other hand, the optimal value in an essentially strictly feasible semidefinite maximization program is a SDr function of the objective (“semidefinite version” of Proposition 2.4.4). Consequently, the set of those $Z$ for which the optimal value in (SDP) is $\leq 1$ is SDr (as the inverse image, under Affine mapping, of the level set of an SDr function). Thus, the “parameter” Z of those ellipsoids $W[Z]$ which satisfy the premise in (D) and thus contain $W_{1} + \ldots + W_{m}$ varies in an SDr set Z. Consequently, the problem of finding the smallest volume ellipsoid in the family $\{W[Z]\}_{Z \in{\mathcal{Z}}}$ is equivalent to the problem of maximizing a positive power of Det(Z) over the SDr set $\mathcal{Z}, \mathrm{i.e.}$ , is equivalent to a semidefinite program.

It remains to build the aforementioned semidefinite program. By the Conic Duality Theorem the optimal value in the (clearly strictly feasible) maximization program (SDP) is $\leq 1$ if and only if the dual problem

$$
\min_{\lambda} \left\{\sum_{i = 1}^{m} \lambda_{i} | \sum_{i} \lambda_{i} B^{i} \succeq M[Z], \lambda_{i} \geq 0, i = 1,..., m \right\}.
$$

admits a feasible solution with the value of the objective $\leq 1$ , or, which is clearly the same $\mathrm{(why ?)}$ , admits a feasible solution with the value of the objective equal 1. In other words, whenever $Z \succeq 0$ is such that $M[Z]{\mathrm{~ is ~}} \preceq{\mathrm{~ a ~}}$ convex combination of the matrices $B^{i}$ , the set

$$
W[Z] = \{x \mid x^{T} Zx \leq 1\}
$$

(which is an ellipsoid when $Z \succ 0)$ contains the set $W_{1} + \ldots + W_{m}$ . We have arrived at the following result (see [18], Section 3.7.4):

Proposition 3.7.4 Given m centered at the origin full-dimensional ellipsoids

$$
W_{i} = \{x \in \mathbb{R}^{n} \mid x^{T} B_{i} x \leq 1\}[B_{i} \succ 0],
$$

$i = 1,..., m$ , in $\mathbb{R}^{n}$ , let us associate with these ellipsoids the semidefinite program

$$
\max_{t, Z, \lambda} \left\{\begin{array}{c} t \leq \operatorname{Det}^{1 / n}(Z) \\ \sum_{i = 1}^{m} \lambda_{i} B^{i} \succeq M[Z] \\ t \Big | \lambda_{i} \geq 0, i = 1,..., m \\ Z \succeq 0 \\ \sum_{i = 1}^{m} \lambda_{i} = 1 \end{array} \right\}\tag{Õ}
$$

where $B^{i}$ is the $(mn) \times(mn)$ block-diagonal matrix with blocks of the size $n \times n$ and the only nonzero diagonal block (the i-th one) equal to $B_{i},$ and $M[Z]$ is the $(mn) \times(mn)$ matrix partitioned into $m^{2}$ blocks, every one of them being Z. Every feasible solution $(Z, \ldots)$ to this program with positive value of the objective produces ellipsoid

$$
W[Z] = \{x \mid x^{T} Zx \leq 1\}
$$

which contains $W_{1} + \ldots + W_{m}$ , and the volume of this ellipsoid is at most $t^{- n / 2}$ . The smallest volume ellipsoid which can be obtained in this way is given by (any) optimal solution of (O)<sup>˜</sup> .

How “conservative” is $\left(\tilde{\mathrm{O}} \right) : \ ?$ The ellipsoid $W[Z^{*}]$ given by the optimal solution of $(\tilde{\mathrm{O}})$ contains the arithmetic sum W of the ellipsoids $W_{i}$ , but not necessarily is the smallest volume ellipsoid containing $W;$ all we know is that this ellipsoid is the smallest volume one in certain subfamily of the family of all ellipsoids containing W . “In the nature” there exists the “true” smallest volume ellipsoid $W[Z^{* *}] = \{x \mid x^{T} Z^{* *} x \leq 1\}, Z^{* *} \succ 0$ , containing W . It is natural to ask how large could be the ratio

$$
\vartheta = \frac{\operatorname{Vol}(W[Z^{*}])}{\operatorname{Vol}(W[Z^{* *}])}.
$$

The answer is as follows:

Proposition 3.7.5 One has $\vartheta \leq \left(\frac{\pi}{2} \right)^{n / 2}$

Note that the bound stated by Proposition 3.7.5 is not as bad as it looks: the natural way to compare the “sizes” of two n-dimensional bodies $E^{\prime}, E^{\prime \prime}$ is to look at the ratio of their average linear sizes $\left({\frac{\mathrm{Vol}(E^{\prime})}{\mathrm{Vol}(E^{\prime \prime})}} \right)^{1 / n}$ (it is natural to assume that shrinking a body by certain factor, say, 2, we reduce the $^{66} \mathrm{size}^{79}$ of the body exactly by this factor, and not by 2<sup>n</sup>). With this approach, the “level of non-optimali $\mathrm{ty}^{\dag}$ of $W[Z^{*}]$ is no more than ${\sqrt{\pi / 2}} = 1.253...,{\mathrm{i.e.}}$ , is within 25% margin. Proof of Proposition 3.7.5: Since $Z^{* *}$ contains W , the implication (\*.1) holds true, i.e., one has

$$
\max_{x \in \mathbb{R}^{mn}} \left\{x^{T} M \left[Z^{* *} \right] x \mid x^{T} B^{i} x \leq 1, i = 1, \dots, m \right\} \leq 1.
$$

Since the matrices $B^{i}, i = 1,..., m$ , commute and $M[Z^{* *}] \succeq 0$ , we can apply Proposition 3.8.4 (see Section 3.8.7.3) to conclude that there exist nonnegative $\mu_{i}, i = 1,..., m$ , such that

$$
M[Z^{* *}] \preceq \sum_{i = 1}^{m} \mu_{i} B^{i}, \quad \sum_{i} \mu_{i} \leq \frac{\pi}{2}.
$$

It follows that setting $\begin{array}{r}{\lambda_{i} = \left(\sum_{j} \mu_{j} \right)^{- 1} \mu_{i}, Z = \left(\sum_{j} \mu_{j} \right)^{- 1} Z^{* *}, t = \mathrm{Det}^{1 / n}(Z)} \end{array}$ , we get a feasible solution of (O). Recalling the origin of <sup>˜</sup> $Z^{\ast}$ , we come to

$$
\operatorname{Vol}(W[Z^{*}]) \leq \operatorname{Vol}(W[Z]) = \left(\sum_{j} \mu_{j}\right)^{n / 2} \operatorname{Vol}(W[Z^{* *}]) \leq(\pi / 2)^{n / 2} \operatorname{Vol}(W[Z^{* *}]),
$$

as claimed.

Problem (O), the case of “co-axial” ellipsoids. Consider the co-axial case – the one when there exist coordinates (not necessarily orthogonal) such that all m quadratic forms defining the ellipsoids $W_{i}$ are diagonal in these coordinates, or, which is the same, there exists a nonsingular matrix C such that all the matrices $C^{T} B_{i} C, i = 1,..., m$ , are diagonal. Note that the case of $m = 2$ always is co-axial – Linear Algebra says that every two homogeneous quadratic forms, at least one of the forms being positive outside of the origin, become diagonal in a properly chosen coordinates.

We are about to prove that

(E) In the “co-axial” case, (O) <sup>˜</sup> yields the smallest in volume ellipsoid containing W<sub>1</sub> + ... + W<sub>m</sub>.

Consider the co-axial case. Since we are interested in volume-related issues, and the ratio of volumes remains unchanged under Affine transformations, we can assume w.l.o.g. that the matrices $B_{i}$ defining the ellipsoids $\begin{array}{r}{W_{i} = \{x \mid x^{T} B_{i} x \leq 1\}} \end{array}$ are positive definite and diagonal; let $b_{\ell}^{i}$ be the \`-th diagonal entry of $B_{i}, \ell = 1,..., n$

By the Fritz John Theorem, “in the nature” there exists a unique smallest volume ellipsoid $W_{*}$ which contains $W_{1} + \ldots + W_{m};$ ; from uniqueness combined with the fact that the sum of our ellipsoids is symmetric w.r.t. the origin it follows that this optimal ellipsoid $W_{*}$ is centered at the origin:

$$
W_{*} = \{x \mid x^{T} Z_{*} x \leq 1\}
$$

with certain positive definite matrix $Z_{*}$

Our next observation is that the matrix $Z_{*}$ is diagonal. Indeed, let E be a diagonal matrix with diagonal entries $\pm 1$ . Since all $B_{i}$ ’s are diagonal, the sum $W_{1} + \ldots + W_{m}$ remains invariant under multiplication by E:

$$
x \in W_{1} + \ldots + W_{m} \Leftrightarrow Ex \in W_{1} + \ldots + W_{m}.
$$

It follows that the ellipsoid $E(W_{*}) = \{x \mid x^{T}(E^{T} Z_{*} E) x \leq 1\}$ covers $W_{1} + \ldots + W_{m}$ along with $W_{*}$ and of course has the same volume as $W_{*};$ from the uniqueness of the optimal ellipsoid it follows that $E(W_{*}) = W_{*}$ , whence $E^{T} Z_{*} E = Z_{*}$ <sub>∗</sub> (why?). Since the concluding relation should be valid for all diagonal matrices $E$ with diagonal entries ±1, $Z_{*}$ must be diagonal.

Now assume that the set

$$
W(z) = \{x \mid x^{T} \mathrm{Diag}(z) x \leq 1\}\tag{3.7.5}
$$

given by a nonnegative vector z contains $W_{1} + \ldots + W_{m}$ . Then the following implication holds true:

$$
\forall \{x_{\ell}^{i}\}_{\substack{i = 1,\ldots,m\\ \ell = 1,\ldots,n}}: \sum_{\ell = 1}^{n}b_{\ell}^{i}(x_{\ell}^{i})^{2}\leq 1, i = 1,\ldots,m \Rightarrow \sum_{\ell = 1}^{n}z_{\ell}(x_{\ell}^{1} + x_{\ell}^{2} + \ldots +x_{\ell}^{m})^{2}\leq 1.\tag{3.7.6}
$$

Denoting $y_{\ell}^{i} =(x_{\ell}^{i})^{2}$ and taking into account that $z_{\ell} \geq 0$ , we see that the validity of (3.7.6) implies the validity of the implication

$$
\forall \{y_{\ell}^{i}\geq 0\}_{\substack{i = 1,\ldots,m\\ \ell = 1,\ldots,n}}: \quad \sum_{\ell = 1}^{n}b_{\ell}^{i}y_{\ell}^{i}\leq 1, i = 1,\ldots,m \Rightarrow \sum_{\ell = 1}^{n}z_{\ell}\left(\sum_{i = 1}^{m}y_{\ell}^{i} + 2\sum_{1\leq i < j\leq m}\sqrt{y_{\ell}^{i}y_{\ell}^{j}}\right)\leq 1.\tag{3.7.7}
$$

Now let $Y$ be an $(mn) \times(mn)$ symmetric matrix satisfying the relations

$$
Y \succeq 0; \operatorname{Tr}(YB^{i}) \leq 1, i = 1,..., m.\tag{3.7.8}
$$

Let us partition $Y$ into $m^{2}$ square blocks, and let $Y_{\ell}^{ij}$ be the \`-th diagonal entry of the ij-th block of $Y.$ . For all $i, j$ with $1 \leq i < j \leq m$ , and all $\ell, 1 \leq \ell \leq n$ , the $2 \times 2$ matrix $\left(\begin{array}{ll}{Y_{\ell}^{ii}} &{Y_{\ell}^{ij}} \\{Y_{\ell}^{ij}} &{Y_{\ell}^{jj}} \end{array} \right)$ is a principal submatrix of $Y$ and therefore is positive semidefinite along with $Y,$ whence

$$
Y_{\ell}^{ij} \leq \sqrt{Y_{\ell}^{ii} Y_{\ell}^{jj}}.\tag{3.7.9}
$$

In view of (3.7.8), the numbers $y_{\ell}^{i} \equiv Y_{\ell}^{ii}$ satisfy the premise in the implication (3.7.7), so that

$$
\begin{array}{rcl} 1 & \geq & \sum_{\ell = 1}^{n} z_{\ell} \left[\sum_{i = 1}^{m} Y_{\ell}^{ii} + 2 \sum_{1 \leq i < j \leq m} \sqrt{Y_{\ell}^{ii} Y_{\ell}^{jj}} \right] \\ & \geq & \sum_{\ell = 1}^{n} z_{\ell} \left[\sum_{i = 1}^{m} Y_{\ell}^{ii} + 2 \sum_{1 \leq i < j \leq m} Y_{\ell}^{ij} \right] \\ & = & \mathrm{Tr}(YM[\mathrm{Diag}(z)]).\end{array} \quad[\text{by (3.7.7)}]
$$

Thus, (3.7.8) implies the inequality $\mathrm{Tr}(YM[\mathrm{Diag}(z)]) \leq 1$ , i.e., the implication

$$
Y \succeq 0, \operatorname{Tr}(YB^{i}) \leq 1, i = 1,..., m \Rightarrow \operatorname{Tr}(YM[\mathrm{Diag}(z)]) \leq 1
$$

holds true. Since the premise in this implication is strictly feasible, the validity of the implication, by Semidefinite Duality, implies the existence of nonnegative $\begin{array}{r}{\lambda_{i}, \sum_{i} \lambda_{i} \leq 1} \end{array}$ , such that

$$
M[\mathrm{Diag}(z)] \preceq \sum_{i} \lambda_{i} B^{i}.
$$

Combining our observations, we come to the conclusion as follows:

In the case of diagonal matrices $B_{i}$ , if the set (3.7.5), given by a nonnegative vector $z,$ contains $W_{1} + \ldots + W_{m}$ , then the matrix $\operatorname{Diag}(z)$ can be extended to a feasible solution of the problem (O)<sup>˜</sup> . Consequently, in the case in question the approximation scheme given by (O) <sup>˜</sup> yields the minimum volume ellipsoid containing $W_{1} + \ldots + W_{m}$ (since the latter ellipsoid, as we have seen, is of the form (3.7.5) with $z \geq 0)$

It remains to note that the approximation scheme associated with $(\tilde{\mathrm{O}})$ is Affine-invariant, so that the above conclusion remains valid when we replace in its premise “the case of diagonal matrices $B_{i}^{{\boldsymbol{\mathbf{\mathit{\Pi}}}}^{\dagger}}$ with “the co-axial case”.

Remark 3.7.1 In fact, (E) is an immediate consequence of the following fact (which, essentially, is proved in the above reasoning):

Let $A_{1},..., A_{m}$ , B be symmetric matrices such that the of-diagonal entries of all A<sub>i</sub>’s are nonpositive, and the of-diagonal entries of B are nonnegative. Assume also that the system of inequalities

$$
x^{T} A_{i} x \leq a_{i}, i = 1, \dots, m\tag{S}
$$

is strictly feasible. Then the inequality

$$
x^{T} Bx \leq b
$$

is a consequence of the system (S) if and only if it is a “linear consequence” of (S), i.e., if and only if there exist nonnegative weights $\lambda_{i}$ such that

$$
B \preceq \sum_{i} \lambda_{i} A_{i}, \quad \sum_{i} \lambda_{i} a_{i} \leq b.
$$

In other words, in the case in question the optimization program

$$
\max_{x} \left\{x^{T} Bx \mid x^{T} A_{i} x \leq a_{i}, i = 1, \dots, m \right\}
$$

and its standard semidefinite relaxation

$$
\max_{X} \left\{\operatorname{Tr}(BX) \mid X \succeq 0, \operatorname{Tr}(A_{i} X) \leq a_{i}, i = 1, \dots, m \right\}
$$

share the same optimal value.

## 3.7.4.2 Problem (I)

Let us represent the given centered at the origin ellipsoids $W_{i}$ as

$$
W_{i} = \{x \mid x = A_{i} u \mid u^{T} u \leq 1\}
$$

$$
[\operatorname{Det}(A_{i}) \neq 0].
$$

We start from the following observation:

(F) An ellipsoid $E[Z] = \{x = Zu \mid u^{T} u \leq 1\} \([\mathrm{Det}(Z) \neq 0])$ is contained in the sum $W_{1} + \ldots + W_{m}$ of the ellipsoids $W_{i}$ if and only if one has

$$
\forall x: \quad \| Z^{T} x \|_{2} \leq \sum_{i = 1}^{m} \| A_{i}^{T} x \|_{2}.\tag{3.7.10}
$$

Indeed, assume, first, that there exists a vector $x_{*}$ such that the inequality in (3.7.10) is violated at $x = x_{*}$ , and let us prove that in this case $W[Z]$ is not contained in the set $W = W_{1} + \ldots + W_{m}$ . We have

$$
\max_{x \in W_{i}} x_{*}^{T} x = \max \left[x_{*}^{T} A_{i} u \mid u^{T} u \leq 1 \right] = \| A_{i}^{T} x_{*} \|_{2}, i = 1, \dots, m,
$$

and similarly

$$
\max_{x \in E[Z]} x_{*}^{T} x = \| Z^{T} x_{*} \|_{2},
$$

whence

$$
\begin{array}{rcl} \max_{x \in W} x_{*}^{T} x & = & \max_{x^{i} \in W_{i}} x_{*}^{T}(x^{1} + \ldots + x^{m}) = \sum_{i = 1}^{m} \max_{x^{i} \in W_{i}} x_{*}^{T} x^{i} \\ & = & \sum_{i = 1}^{m} \| A_{i}^{T} x_{*} \|_{2} < \| Z^{T} x_{*} \|_{2} = \max_{x \in E[Z]} x_{*}^{T} x, \end{array}
$$

and we see that $E[Z]$ cannot be contained in W . Vice versa, assume that $E[Z]$ is not contained in $W_{;}$ , and let $y \in E[Z] \backslash W$ . Since W is a convex compact set and $y \notin W$ , there exists a vector $x_{*}$ such that $x_{*}^{T}{\overset{\cdot}{y}} > \operatorname{max}_{x \in W} x_{*}^{T} x$ , whence, due to the previous computation,

$$
\| Z^{T} x_{*} \|_{2} = \max_{x \in E[Z]} x_{*}^{T} x \geq x_{*}^{T} y > \max_{x \in W} x_{*}^{T} x = \sum_{i = 1}^{m} \| A_{i}^{T} x_{*} \|_{2},
$$

and we have found a point $x = x_{*}$ at which the inequality in (3.7.10) is violated. Thus, $E[Z]$ is not contained in W if and only if (3.7.10) is not true, which is exactly what should be proved.

A natural way to generate ellipsoids satisfying (3.7.10) is to note that whenever $X_{i}$ are $n \times n$ matrices of spectral norms

$$
| X_{i} | \equiv \sqrt{\lambda_{\max}(X_{i}^{T} X_{i})} = \sqrt{\lambda_{\max}(X_{i} X_{i}^{T})} = \max_{x} \{\| X_{i} x \|_{2} \mid \| x \|_{2} \leq 1\}
$$

not exceeding 1, the matrix

$$
Z = Z(X_{1}, \dots, X_{m}) = A_{1} X_{1} + A_{2} X_{2} + \dots + A_{m} X_{m}
$$

satisfies (3.7.10):

$$
\| Z^{T} x \|_{2} = \|[X_{1}^{T} A_{1}^{T} + \ldots + X_{m}^{T} A_{m}^{T}] x \|_{2} \leq \sum_{i = 1}^{m} \| X_{i}^{T} A_{i}^{T} x \|_{2} \leq \sum_{i = 1}^{m} | X_{i}^{T} | \| A_{i}^{T} x \|_{2} \leq \sum_{i = 1}^{m} \| A_{i}^{T} x \|_{2}.
$$

Thus, every collection of square matrices $X_{i}$ with spectral norms not exceeding 1 produces an ellipsoid satisfying (3.7.10) and thus contained in W , and we could use the largest volume ellipsoid of this form (i.e., the one corresponding to the largest $\left| \operatorname{Det}(A_{1} X_{1} + \ldots + A_{m} X_{m}) \right|)$ as a surrogate of the largest volume ellipsoid contained in W . Recall that we know how to express a bound on the spectral norm of a matrix via LMI:

$$
| X | \leq t \Leftrightarrow \left(\begin{array}{cc} tI_{n} & - X^{T} \\ - X & tI_{n} \end{array} \right) \succeq 0[X \in \mathbf{M}^{n, n}]
$$

(item 16 of Section 3.2). The dificulty, however, is that the matrix $\sum_{i = 1}^{m} A_{i} X_{i}$ specifying the ellipsoid $E(X_{1},..., X_{m})$ , although being linear in the “design variables” $X_{i},$ is not necessarily symmetric positive semidefinite, and we do not know how to maximize the determinant over general-type square matrices. We may, however, use the following fact from Linear Algebra:

Lemma 3.7.1 Let $Y = S + C$ be a square matrix represented as the sum of a symmetric matrix S and a skew-symmetric $(i.e., C^{T} = - C)$ matrix C. Assume that S is positive definite. Then

$$
| \operatorname{Det}(Y) | \geq \operatorname{Det}(S).
$$

Proof. We have $Y = S + C = S^{1 / 2}(I + \Sigma) S^{1 / 2}$ , where $\Sigma = S^{- 1 / 2} CS^{- 1 / 2}$ is skew-symmetric along with C. We have $| \mathrm{Det}(Y) | = \mathrm{Det}(S) | \mathrm{Det}(I + \Sigma) |$ ; it remains to note that all eigenvalues of the skewsymmetric matrix Σ are purely imaginary, so that the eigenvalues of $I + \Sigma$ are $\geq 1$ in absolute value, whence $| \mathrm{Det}(I + \Sigma) | \geq 1$ ✷

In view of Lemma, it makes sense to impose on $X_{1},..., X_{m}$ , besides the requirement that their spectral norms $\mathrm{are} \leq 1$ , also the requirement that the “symmetric part”

$$
S(X_{1}, \dots, X_{m}) = \frac{1}{2} \left[\sum_{i = 1}^{m} A_{i} X_{i} + \sum_{i = 1}^{m} X_{i}^{T} A_{i} \right]
$$

of the matrix $\sum A_{i} X_{i}$ is positive semidefinite, and to maximize under these constraints the i quantity $\mathrm{Det}(S(X_{1},..., X_{m})) \textrm{- a}$ lower bound on the volume of the ellipsoid $E[Z(X_{1},..., X_{m})]$ With this approach, we come to the following result:

Proposition 3.7.6 Let $W_{i} ~ = ~ \{x ~ = ~ A_{i} u ~ \vert ~ u^{T} u ~ \leq ~ 1\}, ~ A_{i} ~ \succ ~ 0, ~ i ~ = ~ 1,.., m$ . Consider the semidefinite program

maximize t

s.t.

(a)

$$
{t}{\leq}{\left(\operatorname{Det} \left(\frac{1}{2} \sum_{i = 1}^{m}[X_{i}^{T} A_{i} + A_{i} X_{i}] \right) \right)^{1 / n}}\tag{\((\tilde{I})\}
$$

(b)

$$
\sum_{i = 1}^{m} \left[X_{i}^{T} A_{i} + A_{i} X_{i} \right] \succeq 0\tag{c}
$$

$$
\begin{array}{rl}{^{i - 1} \left(\begin{array}{cc} I_{n} & - X_{i}^{T} \\ - X_{i} & I_{n} \end{array} \right)} &{\succeq 0, i = 1,..., m} \end{array}
$$

with design variables $X_{1},..., X_{m} \in \mathbf{M}^{n, n}, t \in \mathbb{R}$ . Every feasible solution $\left(\left\{X_{i} \right\}, t \right)$ to this problem produces the ellipsoid

$$
E(X_{1}, \dots, X_{m}) = \{x =(\sum_{i = 1}^{m} A_{i} X_{i}) u \mid u^{T} u \leq 1\}
$$

contained in the arithmetic sum $W_{1} + \ldots + W_{m}$ of the original ellipsoids, and the volume $of$ this ellipsoid is at least $t^{n}$ . The largest volume ellipsoid which can be obtained in this way is associated with (any) optimal solution to (<sup>˜</sup>I).

In fact, problem (I) is equivalent to the problem

$$
| \mathrm{Det}(\sum_{i = 1}^{m} A_{i} X_{i}) | \rightarrow \max | | X_{i} | \leq 1, i = 1,..., m\tag{3.7.11}
$$

we have started with, since the latter problem always has an optimal solution $\{X_{i}^{*}\}$ with positive semidefinite symmetric matrix $G_{*} = \sum_{i = 1}^{m} A_{i} X_{i}^{*}$ . Indeed, let $\{X_{i}^{+}\}$ be an optimal solution of the problem. The matrix $G_{+} = \sum_{i = 1}^{m} A_{i} X_{i}^{+}$ , as every $n \times n$ square matrix, admits a representation $G_{+} = G_{*} U$ , where $G_{+}$ is a positive semidefinite symmetric, and $U$ is an orthogonal matrix. Setting $X_{i}^{*} = X_{i} U^{T}$ , we convert $\{X_{i}^{+}\}$ into a new feasible solution of (3.7.11); for this solution $\sum_{i = 1}^{m} A_{i} X_{i}^{*} = G_{*} \succeq 0$ , and $\operatorname{Det}(G_{+}) = \operatorname{Det}(G_{*})$ , so that the new solution is optimal along with $\{X_{i}^{+}\}$

Problem (I), the co-axial case. We are about to demonstrate that in the co-axial case, when in properly chosen coordinates in $\mathbb{R}^{n}$ the ellipsoids $W_{i}$ can be represented as

$$
W_{i} = \{x = A_{i} u \mid u^{T} u \leq 1\}
$$

with positive definite diagonal matrices $A_{i}$ , the above scheme yields the best (the largest volume) ellipsoid among those contained in $W = W_{1} + \ldots + W_{m}$ . Moreover, this ellipsoid can be pointed out explicitly – it is exactly the ellipsoid $E[Z]$ with $Z = Z(I_{n},..., I_{n}) = A_{1} +...+ A_{m} !$

The announced fact is nearly evident. Assuming that $A_{i}$ are positive definite and diagonal, consider the parallelotope

$$
\widehat{W} = \{x \in \mathbb{R}^{n} \mid | x_{j} | \leq \ell_{j} = \sum_{i = 1}^{m}[A_{i}]_{jj}, j = 1, \dots, n\}.
$$

This parallelotope clearly contains $W \ \mathrm{(why ?)}$ , and the largest volume ellipsoid contained in $\widehat{W}$ clearly is the ellipsoid

$$
\{x \mid \sum_{j = 1}^{n} \ell_{j}^{- 2} x_{j}^{2} \leq 1\},
$$

i.e., is nothing else but the ellipsoid $E[A_{1} + \ldots + A_{m}]$ . As we know from our previous considerations, the latter ellipsoid is contained in $W_{;}$ , and since it is the largest volume ellipsoid among those contained in the set $\widehat W \supset W$ , it is the largest volume ellipsoid contained in W as well.

Example. In the example to follow we are interested to understand what is the domain $D_{T}$ on the 2D plane which can be reached by a trajectory of the diferential equation

$$
\frac{d}{dt} \binom{x_{1}(t)}{x_{2}(t)} = \underbrace{\left(\begin{array}{cc} - 0.8147 & - 0.4163 \\ 0.8167 & - 0.1853 \end{array} \right)}_{A} \binom{x_{1}(t)}{x_{2}(t)} + \binom{u_{1}(t)}{0.7071u_{2}(t)}, \quad \binom{x_{1}(0)}{x_{2}(0)} = \binom{0}{0}
$$

in $T$ sec under a piecewise-constant control $u(t) ={\binom{u_{1}(t)}{u_{2}(t)}}$ which switches from one constant value to another one every $\Delta t = 0.01$ sec and is subject to the norm bound

$$
\| u(t) \|_{2} \leq 1 \quad \forall t.
$$

The system is stable (the eigenvalues of A are $- 0.5 \pm 0.4909i)$ . In order to build $D_{T}.$ , note that the states of the system at time instants k∆t, $k = 0, 1, 2, \ldots$ . are the same as the states $x[k] ={\binom{x_{1}(k \Delta t)}{x_{2}(k \Delta t)}}$ of the discrete time system

$$
x[k + 1] = \underbrace{\exp \{A \Delta t\}}_{S} x[k] + \underbrace{\left[\int_{0}^{\Delta t} \exp \{As\} \left(\begin{array}{cc} 1 & 0 \\ 0 & 0.7071 \end{array} \right) ds \right]}_{B} u[k], x[0] = \binom{0}{0},\tag{3.7.12}
$$

where $u[k]$ is the value of the control on the “continuous time” interval $(k \Delta t,(k + 1) \Delta t)$

We build the inner $\mathcal{T}_{k}$ and the outer $\mathcal{O}_{k}$ ellipsoidal approximations of the domains $D^{k} = D_{k \Delta t}$ in a recurrent manner:

- the ellipses $\mathcal{T}_{0}$ and $\mathcal{O}_{0}$ are just the singletons (the origin);

$\mathcal{T}_{k + 1}$ is the best (the largest in the area) ellipsis contained in the set

$$
S \mathcal{I}_{k} + BW, \quad W = \{u \in \mathbb{R}^{2} | \| u \|_{2} \leq 1\},
$$

which is the sum of two ellipses;

$\mathcal{O}_{k + 1}$ is the best (the smallest in the area) ellipsis containing the set

$$
S \mathcal{O}_{k} + BW,
$$

which again is the sum of two ellipses.

Here is the picture we get:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/0e2b7a03c76eaffa1b74a4b593fa5b2aad50e278b9b9ee31c3bf523058166cc4.jpg)  
Outer and inner approximations of the “reachability domains”

$$
D^{10 \ell} = D_{0.1 \ell \text{sec}}, \ell = 1, 2,..., 10.
$$

- Ten pairs of ellipses are the outer and inner approximations of the domains $D^{1},..., D^{10}$ (look how close the ellipses from a pair are close to each other!);

Four curves are sample trajectories of the system (dots correspond to time instants 0.1\` sec in continuous time, i.e., time instants 10\` in discrete time, $\ell = 0, 1,..., 10)$

## 3.8 Exercises for Lecture 3

Solutions to exercises/parts of exercises colored in cyan can be found in section 6.3.

## 3.8.1 Around positive semidefiniteness, eigenvalues and $\succeq$-ordering

## 3.8.1.1 Criteria for positive semidefiniteness

Recall the criterion of positive definiteness of a symmetric matrix:

[Sylvester] A symmetric m × m matrix $A =[a_{ij}]_{i, j = 1}^{m}$ is positive definite if and only if all angular minors

$$
\operatorname{Det} \left([a_{ij}]_{i, j = 1}^{k}\right), \quad k = 1,..., m,
$$

are positive.

Exercise 3.1 Prove that a symmetric $m \times m$ matrix A is positive semidefinite if and only if all its principal minors $(i.e.$ , determinants of square sub-matrices symmetric w.r.t. the diagonal) are nonnegative.

Hint: look at the angular minors of the matrices $A + \epsilon I_{n}$ for small positive $\epsilon$.

Demonstrate by an example that nonnegativity of angular minors of a symmetric matrix is not sufficient for the positive semidefiniteness of the matrix.

Exercise 3.2 [Diagonal-dominant matrices] Let a symmetric matrix $A =[a_{ij}]_{i, j = 1}^{m}$ satisfy the relation

$$
a_{ii} \geq \sum_{j \neq i} | a_{ij} |, i = 1, \dots, m.
$$

Prove that A is positive semidefinite.

## 3.8.1.2 Variational characterization of eigenvalues

The basic fact about eigenvalues of a symmetric matrix is the following

Variational Characterization of Eigenvalues [Theorem A.7.3] Let A be a symmetric $m \times m$ matrix and $\overline{{\lambda(A) =(\lambda_{1}(A),..., \lambda_{m}(A))}}$ ) be the vector of eigenvalues of A taken with their multiplicities and arranged in non-ascending order:

$$
\lambda_{1}(A) \geq \lambda_{2}(A) \geq \dots \geq \lambda_{m}(A).
$$

Then for every $i = 1,..., m$ one has:

$$
\lambda_{i}(A) = \min_{E \in \mathcal{E}_{i}} \max_{v \in E, v^{T} v = 1} v^{T} Av,
$$

where $\mathcal{E}_{i}$ is the family of all linear subspaces of $\mathbb{R}^{m}$ of dimension $m - i + 1$

Singular values of rectangular matrices also admit variational description:

Variational Characterization of Singular Values Let A be an $m \times n$ matrix, $m \leq n$ , and let $\sigma(A) = \lambda((AA^{T})^{1 / 2})$ be the vector of singular values of A. Then for every $i = 1,..., m$ one has:

$$
\sigma_{i}(A) = \min_{E \in \mathcal{E}_{i}} \max_{v \in E, v^{T} v = 1} \| Av \|_{2},
$$

where $\mathcal{E}_{i}$ is the family of all linear subspaces of $\mathbb{R}^{n}$ of dimension $n - i + 1$

Exercise 3.3 Derive the Variational Characterization of Singular Values from the Variational Characterization of Eigenvalues.

Exercise 3.4 Derive from the Variational Characterization of Eigenvalues the following facts: (i) [Monotonicity of the vector of eigenvalues] If $A \succeq B$ , then $\lambda(A) \geq \lambda(B)$ ;

(ii) The functions $\lambda_{1}(X), \lambda_{m}(X)$ of $X \in \mathbf{S}^{m}$ are convex and concave, respectively.

(iii) $If \Delta$ is a convex subset of the real axis, then the set of all matrices $X \in \mathbf{S}^{m}$ with spectrum from $\Delta$ is convex.

Recall now the definition of a function of symmetric matrix. Let A be a symmetric $m \times m$ matrix and

$$
p(t) = \sum_{i = 0}^{k} p_{i} t^{i}
$$

be a real polynomial on the axis. By definition,

$$
p(A) = \sum_{i = 0}^{k} p_{i} A^{i} \in \mathbf{S}^{m}.
$$

This definition is compatible with the arithmetic of real polynomials: when you add/multiply polynomials, you add/multiply the “values” of these polynomials at every fixed symmetric matrix:

$$
(p + q)(A) = p(A) + q(A);(p \cdot q)(A) = p(A) q(A).
$$

A nice feature of this definition is that

(A) For $A \in \mathbf{S}^{m}$ , the matrix $p(A)$ depends only on the restriction of p on the spectrum (set of eigenvalues) of A: if p and q are two polynomials such that $p(\lambda_{i}(A)) = q(\lambda_{i}(A))$ for $i = 1,..., m$ , then $p(A) = q(A)$

Indeed, we can represent a symmetric matrix A as $A = U^{T} \Lambda U$ , where U is orthogonal and Λ is diagonal with the eigenvalues of A on its diagonal. Since $UU^{T} = I.$ we have $A^{i} = U^{T} \Lambda^{i} U;$ consequently,

$$
p(A) = U^{T} p(\Lambda) U,
$$

and since the matrix $p(\Lambda)$ depends on the restriction of $p$ on the spectrum of A only, the result follows.

As a byproduct of our reasoning, we get an “explicit” representation of $p(A)$ in terms of the spectral decomposition $A = U^{T} \Lambda U$ (U is orthogonal, Λ is diagonal with the diagonal $\lambda(A))$ ):

(B) The matrix $p(A)$ is just $U^{T} \mathrm{Diag}(p(\lambda_{1}(A)),..., p(\lambda_{n}(A))) U.$

(A) allows to define arbitrary functions of matrices, not necessarily polynomials:

Let A be symmetric matrix and f be a real-valued function defined at least at the spectrum of A. By definition, the matrix $f(A)$ is defined as $p(A)$ , where $p$ is a polynomial coinciding with $\overline{{f}}$ on the spectrum of A. (The definition makes sense, since by $(\boldsymbol{A}) \p(\boldsymbol{A})$ depends only on the restriction of $p$ on the spectrum of $A,$ i.e., every “polynomial continuation $\vec{\iota}^{\prime} \p(\cdot)$ of $f$ from the spectrum of A to the entire axis results in the same $p(A))$ ).

The “calculus of functions of a symmetric matrix” is fully compatible with the usual arithmetic of functions, e.g:

$$
(f + g)(A) = f(A) + g(A);(\mu f)(A) = \mu f(A);(f \cdot g)(A) = f(A) g(A);(f \circ g)(A) = f(g(A)),
$$

provided that the functions in question are well-defined on the spectrum of the corresponding matrix. And of course the spectral decomposition of $f(A)$ is just $f(A) \quad =$ $U^{T} \mathrm{Diag}(f(\lambda_{1}(A)),..., f(\lambda_{m}(A))) U$ , where $A = U^{T} \mathrm{Diag}(\lambda_{1}(A),..., \lambda_{m}(A)) U$ is the spectral decomposition of A.

Note that “Calculus of functions of symmetric matrices” becomes very unusual when we are trying to operate with functions of several (non-commuting) matrices. E.g., it is generally not true that $\exp \{A + B\} = \exp \{A\} \exp \{B\}$ (the right hand side matrix may be even nonsymmetric!). It is also generally not true that if $f$ is monotone and $A \succeq B$ , then $f(A) \succeq f(B)$ ， etc.

Exercise 3.5 Demonstrate by an example that the relation $0 \preceq A \preceq B$ does not necessarily imply that $A^{2} \preceq B^{2}$

By the way, the relation $0 \preceq A \preceq B$ does imply that $0 \preceq A^{1 / 2} \preceq B^{1 / 2}$

Sometimes, however, we can get “weak” matrix versions of usual arithmetic relations. $\mathrm{E.g.}$

Exercise 3.6 Let f be a nondecreasing function on the real line, and let $A \succeq B$ . Prove that $\lambda(f(A)) \geq \lambda(f(B))$

The strongest (and surprising) “weak” matrix version of a usual $\left(\{}^{66} \mathrm{scalar}{}^{99} \right)$ inequality is as follows.

Let $f(t)$ be a closed convex function on the real line; by definition, it means that $f$ is a function on the axis taking real values and the value +∞ such that

– the set Dom f of the values of argument where $f$ is finite is convex and nonempty;

$- \ \mathrm{if}$ a sequence $\{t_{i} \in \operatorname{Dom} f\}$ converges to a point t and the sequence $f(t_{i})$ has a limit, then $t \in$ Dom f and $f(t) \leq \operatorname{lim}_{i \to \infty} f(t_{i})$ (this property is called “lower semicontinuity”).

$\mathrm{E.g.}$ , the function $f(x) ={\left\{\begin{array}{ll}{0,} &{0 \leq t \leq 1} \\{+ \infty,} &{{\mathrm{otherwise}}} \end{array} \right.}$ is closed. In contrast to this, the functions

$$
g(x) = \left\{\begin{array}{ll} 0, & 0 < t \leq 1 \\ 1, & t = 0 \\ + \infty, & \text{for all remaining} t \end{array} \right.
$$

and

$$
h(x) = \left\{\begin{array}{ll} 0, & 0 < t < 1 \\ + \infty, & \text{otherwise} \end{array} \right.
$$

are not closed, although they are convex: a closed function cannot “jump $\mathrm{up}^{\mathrm{5}}$ at an endpoint of its domain, as it is the case for $^{g,}$ and it cannot take value +∞ at a point, if it takes values $\leq a < \infty$ in a neighbourhood of the point, as it is the case for $h.$

For a convex function $f,$ its Legendre transformation $f_{*}$ (also called the conjugate, or the Fenchel dual of $f)$ is defined as

$$
f_{*}(s) = \sup_{t}[ts - f(t)].
$$

It turns out that the Legendre transformation of a closed convex function also is closed and convex, and that twice taken Legendre transformation of a closed convex function is this function.

The Legendre transformation (which, by the way, can be defined for convex functions on $\mathbb{R}^{n}$ as well) underlies many standard inequalities. Indeed, by definition of $f_{*}$ we have

$$
f_{*}(s) + f(t) \geq st \quad \forall s, t;\tag{L}
$$

For specific choices of $f,$ we can derive from the general inequality (L) many useful inequalities. E. $\cdot g.$

$\begin{array}{r}{\operatorname{If} f(t) = \frac{1}{2} t^{2}} \end{array}$ , then $\begin{array}{r}{f_{*}(s) = \frac{1}{2} s^{2}} \end{array}$ , and (L) becomes the standard inequality

$$
st \leq \frac{1}{2} t^{2} + \frac{1}{2} s^{2} \quad \forall s, t \in \mathbb{R};
$$

${\mathrm{If ~ 1}} < p < \infty$ and $f(t) = \left\{\begin{array}{ll}{\frac{t^{p}}{p},} &{t \geq 0} \\{+ \infty,} &{t < 0} \end{array} \right.$ , then $f_{*}(s) = \left\{\begin{array}{ll}{\frac{s^{q}}{q},} &{s \geq 0} \\{+ \infty,} &{s < 0} \end{array} \right.$ , with q given by $\begin{array}{r}{\frac{1}{p} + \frac{1}{q} = 1} \end{array}$ , and (L) becomes the Young inequality

$$
\forall(s, t \geq 0): \quad ts \leq \frac{t^{p}}{p} + \frac{s^{q}}{q}, 1 < p, q < \infty, \frac{1}{p} + \frac{1}{q} = 1.
$$

Now, what happens with (L) if s, t are symmetric matrices? Of course, both sides of (L) still make sense and are matrices, but we have no hope to say something reasonable about the relation between these matrices (e.g., the right hand side in (L) is not necessarily symmetric). However,

Exercise 3.7 Let f<sub>∗</sub> be a closed convex function with the domain Dom $f_{*} \subset \mathbb{R}_{+}$ , and let f be the Legendre transformation of $f_{*}$ . Then for every pair of symmetric matrices X, Y of the same size with the spectrum of X belonging to Dom f and the spectrum of Y belonging to Dom $f_{*}$ one has

$$
\lambda(f(X)) \geq \lambda \left(Y^{1 / 2} XY^{1 / 2} - f_{*}(Y)\right)^{26)}
$$

## 3.8.1.3 Birkhof ’s Theorem

Surprisingly enough, one of the most useful facts about eigenvalues of symmetric matrices is the following, essentially combinatorial, statement (it does not mention the word “eigenvalue” at all).

Birkhof ’s Theorem. Consider the set $S_{m}$ of double-stochastic $m \times m$ matrices, i.e., square matrices $[p_{ij}]_{i, j = 1}^{m}$ satisfying the relations

$$
\begin{array}{rcl} p_{ij} & \geq & 0, i, j = 1,..., m; \\ \sum_{i = 1}^{m} p_{ij} & = & 1, j = 1,..., m; \\ \sum_{j = 1}^{m} p_{ij} & = & 1, i = 1,..., m.\end{array}
$$

A matrix P belongs to $S_{m}$ if and only if it can be represented as a convex combination of m × m permutation matrices:

$$
P \in \mathcal{S}_{m} \Leftrightarrow \exists(\lambda_{i} \geq 0, \sum_{i} \lambda_{i} = 1): P = \sum_{i} \lambda_{i} \Pi^{i},
$$

where all $\Pi^{i}$ are permutation matrices $( i . \mathrm { e } . $ , with exactly one nonzero element, equal to $^{1,}$ in every row and every column).

An immediate corollary of the Birkhof Theorem is the following fact:

(C) Let $f :{\mathbb{R}}^{m}{\mathbb{R}} \cup \{+ \infty\}$ be a convex symmetric function (symmetry means that the value of the function remains unchanged when we permute the coordinates in an argument), let $x \in \operatorname{Dom} f$ and $P \in \cal{S}_{m}$ . Then

$$
f(Px) \leq f(x).\tag{3.8.1}
$$

The proof is immediate: by Birkhof’s Theorem, $Px$ is a convex combination of a number of permutations $x^{i}$ of x. Since f is convex, we have

$$
f(Px) \leq \max_{i} f(x^{i}) = f(x),
$$

the concluding equality resulting from the symmetry of $f.$

The role of (C) in numerous questions related to eigenvalues is based upon the following simple

Observation. Let A be a symmetric $m \times m$ matrix. Then the diagonal $\mathrm{Dg}(A)$ of the matrix A is the image of the vector $\lambda(A)$ of the eigenvalues of A under multiplication by a double stochastic matrix:

$$
\mathrm{Dg}(A) = P \lambda(A) \text{for some} P \in \mathcal{S}_{m}
$$

Indeed, consider the spectral decomposition of $A{:}$

$$
A = U^{T} \mathrm{Diag}(\lambda_{1}(A),..., \lambda_{m}(A)) U
$$

with orthogonal $U =[u_{ij}]$ . Then

$$
A_{ii} = \sum_{j = 1}^{m} u_{ji}^{2} \lambda_{j}(A) \equiv(P \lambda(A))_{i},
$$

where the matrix $P =[u_{ji}^{2}]_{i, j = 1}^{m}$ is double stochastic.

Combining the Observation and (C), we conclude that if $f$ is a convex symmetric function on $\mathbb{R}^{m}$ , then for every m × m symmetric matrix A one has

$$
f(\mathrm{Dg}(A)) \leq f(\lambda(A)).
$$

Moreover, let ${\mathcal{O}}_{m}$ be the set of all orthogonal $m \times m$ matrices. For every $V \in{\mathcal{O}}_{m}$ , the matrix $V^{T} AV$ has the same eigenvalues as A, so that for a convex symmetric f one has

$$
f(\mathrm{Dg}(V^{T} AV)) \leq f(\lambda(V^{T} AV)) = f(\lambda(A)),
$$

whence

$$
f(\lambda(A)) \geq \max_{V \in \mathcal{O}_{m}} f(\mathrm{Dg}(V^{T} AV)).
$$

In fact the inequality here is equality, since for properly chosen $V \in \mathcal{O}_{m}$ we have $\mathrm{Dg}(V^{T} AV) =$ $\lambda(A)$ . We have arrived at the following result:

(D) Let $f$ be a symmetric convex function on $\mathbb{R}^{m}$ . Then for every symmetric $m \times m$ matrix A one has

$$
f(\lambda(A)) = \max_{V \in \mathcal{O}_{m}} f(\mathrm{Dg}(V^{T} AV)),
$$

${\mathcal{O}}_{m}$ being the set of all $m \times m$ orthogonal matrices.

In particular, the function

$$
F(A) = f(\lambda(A))
$$

is convex in $A \in \mathbf{S}^{m}$ (as the maximum of a family of convex in A functions $F_{V}(A) =$ $f(\mathrm{Dg}(V^{T} AV)), V \in \mathcal{O}_{m}.)$

Exercise 3.8 Let $g(t) : \mathbb{R} \mathbb{R} \cup \{+ \infty\}$ be a convex function, and let ${\mathcal{F}}_{n}$ be the set of all matrices $X \in \mathbf{S}^{n}$ with the spectrum belonging to Dom g. Prove that the function $\operatorname{Tr}(g(X))$ is convex on ${\mathcal{F}}_{n}$

Hint: Apply (D) to the function $f(x_{1},..., x_{n}) = g(x_{1}) +...+ g(x_{n})$

Exercise 3.9 Let $A = \left[a_{ij} \right]$ be a symmetric $m \times m$ matrix. Prove that

(i) Whenever $p \geq 1$ , one has $\sum_{i = 1}^{m} | a_{ii} |^{p} \leq \sum_{i = 1}^{m} | \lambda_{i}(A) |^{p};$

(ii) Whenever A is positive semidefinite, $\prod_{i = 1}^{m} a_{ii} \geq \operatorname{Det}(A),$

(iii) For $\boldsymbol{x} \in \mathbb{R}^{m}$ , let the function $S_{k}(x)$ be the sum of k largest entries of $\it{\Delta} x \it{\Delta}(i.e.$ , the sum of the first k entries in the vector obtained from x by writing down the coordinates $ofx$ in the non-ascending order). Prove that $S_{k}(x)$ is a convex symmetric function of x and derive from this observation that

$$
S_{k}(\mathrm{Dg}(A)) \leq S_{k}(\lambda(A)).
$$

Hint: note that $S_{k}(x) = \operatorname{max}_{1 \leq i_{1} < i_{2} < \ldots < i_{k} \leq m} \sum_{l = 1}^{k} x_{i_{l}}$

(iv) [Trace inequality] Whenever $A, B \in \mathbf{S}^{m}$ , one has

$$
\lambda^{T}(A) \lambda(B) \geq \operatorname{Tr}(AB).
$$

Exercise 3.10 Prove that if $A \in \mathbf{S}^{m}$ and $p, q \in[1, \infty]$ are such that $\begin{array}{r}{\frac{1}{p} + \frac{1}{q} = 1} \end{array}$ , then

$$
\max_{B \in \mathbf{S}^{m}: \| \lambda(B) \|_{q} = 1} \operatorname{Tr}(AB) = \| \lambda(A) \|_{p}.
$$

In particular, $\| \lambda(\cdot) \|_{p}$ is a norm on ${\bf S}^{m}$ , and the conjugate of this norm is $\begin{array}{r}{\| \lambda(\cdot) \|_{q}, \frac{1}{p} + \frac{1}{q} = 1} \end{array}$

Exercise 3.11 Let $X = \left(\begin{array}{cccc}{{X_{11}}} &{{X_{12}}} &{{...}} &{{X_{1m}}} \\{{X_{12}^{T}}} &{{X_{22}}} &{{...}} &{{X_{2m}}} \\{{.}} &{{.}} &{{.}} &{{..}} \\{{X_{1m}^{T}}} &{{X_{2m}^{T}}} &{{...}} &{{X_{mm}}} \end{array} \right)$ be an $n \times n$ symmetric matrix which is

partitioned into $m^{2}$ blocks $X_{ij}$ in a symmetric, w.r.t. the diagonal, fashion (so that the blocks $X_{jj}$ are square), and let

$$
\hat{X} = \left(\begin{array}{cccc} X_{11} & & & \\ & X_{22} & & \\ & & \ddots & \\ & & & X_{mm} \end{array} \right).
$$

1) Let $F : \mathbf{S}^{n} \mathbb{R} \cup \{+ \infty\}$ be a convex “rotation-invariant” function: for all $Y \in \mathbf{S}^{n}$ and all orthogonal matrices U one has $F(U^{T} YU) = F(Y)$ . Prove that

$$
F(\widehat{X}) \leq F(X).
$$

Hint: Represent the matrix $\widehat{X}$ as a convex combination of the rotations $U^{T} XU, U^{T} U = I,$ of X .

2) Let $f : \mathbb{R}^{n} \mathbb{R} \cup \{+ \infty\}$ be a convex symmetric w.r.t. permutations of the entries in the argument function, and let $F(Y) = f(\lambda(Y)), Y \in \mathbf{S}^{n}$ . Prove that

$$
F(\widehat{X}) \leq F(X).
$$

3) Let $g : \mathbb{R} \mathbb{R} \cup \{+ \infty\}$ be convex function on the real line which is finite on the set of eigenvalues of X, and let ${\mathcal{F}}_{n} ~ \subset ~{\mathbf{S}}^{n}$ be the set of all $n \times n$ symmetric matrices with all eigenvalues belonging to the domain of g. For $X \in \mathcal{F}_{n}$ , let $g(X)$ be the matrix built as follows: $g(X)$ is symmetric matrix for which the spectral subspaces $\{x : Xx = \lambda x\}$ of X are invariant, and on such a subspace the mapping $x \mapsto g(x) x$ is just the multiplication by $g(\lambda).^{27}$ Assume that the mapping

$$
Y \mapsto g(Y): \mathcal{F}_{n} \to \mathbf{S}^{n}
$$

is $\succeq$-convex:

$$
g \left(\lambda^{\prime} Y^{\prime} + \lambda^{\prime \prime} Y^{\prime \prime}\right) \preceq \lambda^{\prime} g \left(Y^{\prime}\right) + \lambda^{\prime \prime} g \left(Y^{\prime \prime}\right) \quad \forall \left(Y^{\prime}, Y^{\prime \prime} \in \mathcal{F}_{n}, \lambda^{\prime}, \lambda^{\prime \prime} \geq 0, \lambda^{\prime} + \lambda^{\prime \prime} = 1\right).
$$

Prove that

$$
(g(X))_{ii} \succeq g(X_{ii}), i = 1, \dots, m,
$$

where the partition of $g(X)$ into the blocks $(g(X))_{ij}$ is identical to the partition of X into the blocks $X_{ij}$

Exercise 3.11 gives rise to a number of interesting inequalities. Let $X,{\widehat{X}}$ be the same as in the Exercise, and let [Y ] denote the northwest block, of the same size as $X_{11}$ , of an $n \times n$ matrix Y . Then

1. $\left(\sum_{i = 1}^{m} \| \lambda(X_{ii}) \|_{p}^{p} \right)^{1 / p} \leq \| \lambda(X) \|_{p}, 1 \leq p < \infty$

[Exercise 3.11.2), $f(x) = \| x \|_{p}]$

2. If $X \succ 0$ , then $\operatorname{Det}(X) \leq \prod_{i = 1}^{m} \operatorname{Det}(X_{ii})$

[Exercise 3.11.2), $f(x) = -(x_{1}...x_{n})^{1 / n}{\mathrm{~ for ~}} x \geq 0]$

3. $[X^{2}] \succeq X_{11}^{2}$

[This inequality is nearly evident; it follows also from Exercise 3.11.3) with $g(t) = t^{2}$ (the $\succeq$-convexity of $g(Y)$ is stated in Exercise 3.21.1))];

4. If $X \succ 0$ , then $X_{11}^{- 1} \preceq[X^{- 1}]$

[Exercise 3.11.3) with $g(t) = t^{- 1}$ for $t > 0;$ the $\succeq$-convexity of $g(Y)$ on $\mathbf{S}_{+ +}^{n}$ is stated by Exercise 3.21.2)];

5. For every $X \succeq 0,[X^{1 / 2}] \preceq X_{11}^{1 / 2}$

[Exercise 3.11.3) with $g(t) = - \sqrt{t};$ the $\succeq$-convexity of $g(Y)$ is stated by Exercise 3.21.4)].

Extension: If $X \succeq 0$ , then for every $\alpha \in(0, 1)$ one has $[X^{\alpha}] \preceq X_{11}^{\alpha}$

[Exercise 3.11.3) with $g(t) = - t^{\alpha}$ ; the function $- Y^{\alpha}$ of $Y \succeq 0$ is known to be $\succeq - \mathrm{convex}]$ ;

6. If $X \succ 0$ , then $[\ln(X)] \preceq \ln(X_{11})$

[Exercise 3.11.3) with $g(t) = - \ln t, t > 0;$ the $\succeq$-convexity of $g(Y)$ is stated by Exercise 3.21.5)].

Exercise 3.12 1) Let $A =[a_{ij}]_{i, j} \succeq 0$ , let $\alpha \geq 0$ , and let $B \equiv[b_{ij}]_{i, j} = A^{\alpha}$ . Prove that

$$
b_{ii} \left\{\begin{array}{ll} \leq a_{ii}^{\alpha}, & \alpha \leq 1 \\ \geq a_{ii}^{\alpha}, & \alpha \geq 1 \end{array} \right.
$$

2) Let $A =[a_{ij}]_{i, j} \succ 0$ , and let $B \equiv[b_{ij}]_{i, j} = A^{- 1}$ . Prove that $b_{ii} \geq a_{ii}^{- 1}$

3) Let [A] denote the northwest $2 \times 2$ block of a square matrix. Which of the implications

(a) $A \succeq 0 \Rightarrow[A^{4}] \succeq[A]^{4}$

(b) $A \succeq 0 \Rightarrow[A^{4}]^{1 / 4} \succeq[A]$

are true $\ell$

## 3.8.1.4 Semidefinite representations of functions of eigenvalues

The goal of the subsequent series of exercises is to prove Proposition 3.2.1.

We start with a description (important by its own right) of the convex hull of permutations of a given vector. Let $\boldsymbol{x} \in \mathbb{R}^{m}$ , and let $X[x]$ be the set of all convex combinations of m! vectors obtained from x by all permutations of the coordinates.

Claim: [“Majorization principle”] $X[x]$ is exactly the solution set of the following system of inequalities in variables $y \in \mathbb{R}^{m}$

$$
\begin{array}{c} S_{j}(y) \leq S_{j}(x), j = 1, \dots, m - 1 \\ y_{1} + \dots + y_{m} = x_{1} + \dots + x_{m} \end{array}\tag{+}
$$

(recall that $S_{j}(y)$ is the sum of the largest j entries of a vector y).

Exercise 3.13 [Easy part of the claim] Let Y be the solution set $of \left(+ \right)$ . Prove that $Y \supset X[x]$

Hint: Use (C) and the convexity of the functions $S_{j}(\cdot)$

Exercise 3.14 [Dificult part of the claim] Let Y be the solution set $of \left(+ \right)$ . Prove that $Y \subset$ $X[x]$

Sketch of the proof: Let $y \in Y$ . We should prove that $y \in X[x]$ . By symmetry, we may assume that the vectors x and y are ordered: $x_{1} \geq x_{2} \geq...\geq x_{m}, y_{1} \geq y_{2} \geq...\geq y_{m}$ Assume that $y \not \in X[x]$ , and let us lead this assumption to a contradiction.

1) Since $X[x]$ clearly is a convex compact set and $y \not \in X[x]$ , there exists a linear functional $c(z) = \sum_{i = 1}^{m} c_{i} z_{i}$ which separates y and $X[x]$

$$
c(y) > \max_{z \in X[x]} c(z).
$$

Prove that such a functional can be chosen “to be ordered”: $c_{1} \geq c_{2} \geq...\geq c_{m}$

2) Verify that

$$
c(y) \equiv \sum_{i = 1}^{m} c_{i} y_{i} = \sum_{i = 1}^{m - 1} \left(c_{i} - c_{i + 1}\right) \sum_{j = 1}^{i} y_{j} + c_{m} \sum_{j = 1}^{m} y_{j}
$$

(Abel’s formula – a discrete version of integration by parts). Use this observation along with “orderedness” of $c(\cdot)$ and the inclusion $y \in Y$ to conclude that $c(y) \leq c(x)$ , thus coming to the desired contradiction.

Exercise 3.15 Use the Majorization principle to prove Proposition 3.2.1.

The next pair of exercises is aimed at proving Proposition 3.2.2.

Exercise 3.16 Let $x \in \mathbb{R}^{m}$ , and let $X_{+}[x]$ be the set of all vectors $x^{\prime}$ dominated by a vector form $X[x]$

$$
X_{+}[x] = \{y \mid \exists z \in X[x]: y \leq z\}.
$$

1) Prove that $X_{+}[x]$ is a closed convex set.

2) Prove the following characterization of $X_{+}[x]$

$X_{+}[x]$ is exactly the set of solutions of the system of inequalities $S_{j}(y) \ \leq \S_{j}(x)$

$j = 1,..., m$ , in variables y.

Exercise 3.17 Derive Proposition 3.2.2 from the result of Exercise 3.16.2).

## 3.8.1.5 Cauchy’s inequality for matrices

The standard Cauchy’s inequality says that

$$
\left| \sum_{i} x_{i} y_{i} \right| \leq \sqrt{\sum_{i} x_{i}^{2}} \sqrt{\sum_{i} y_{i}^{2}}\tag{3.8.2}
$$

for reals $x_{i}, y_{i}, i = 1,..., n;$ this inequality is exact in the sense that for every collection $x_{1},..., x_{n}$ there exists a collection $y_{1},..., y_{n}$ with $\sum_{i} y_{i}^{2} = 1$ which makes (3.8.2) an equality.

Exercise 3.18 (i) Prove that whenever $X_{i}, Y_{i} \in \mathbf{M}^{p, q}$ , one has

$$
\sigma \left(\sum_{i} X_{i}^{T} Y_{i}\right) \leq \lambda \left(\left[\sum_{i} X_{i}^{T} X_{i} \right]^{1 / 2}\right) \| \lambda \left(\sum_{i} Y_{i}^{T} Y_{i}\right) \|_{\infty}^{1 / 2}\tag{\(^{*} \)}
$$

where $\sigma(A) = \lambda([AA^{T}]^{1 / 2})$ is the vector of singular values of a matrix A arranged in the nonascending order.

Prove that for every collection $X_{1},..., X_{n} \in \mathbf{M}^{p, q}$ there exists a collection $Y_{1},..., Y_{n} \in \mathbf{M}^{p, q}$ with $\sum Y_{i}^{T} Y_{i} = I_{q}$ which makes (∗) an equality.

(ii) Prove the following “matrix version” of the Cauchy inequality: whenever $X_{i}, Y_{i} \in \mathbf{M}^{p, q}$ one has

$$
\left| \sum_{i} \operatorname{Tr} \left(X_{i}^{T} Y_{i}\right) \right| \leq \operatorname{Tr} \left(\left[\sum_{i} X_{i}^{T} X_{i} \right]^{1 / 2}\right) \| \lambda \left(\sum_{i} Y_{i}^{T} Y_{i}\right) \|_{\infty}^{1 / 2},\tag{\(^{**} \)}
$$

and $for$ every collection $X_{1},..., X_{n} \ \in \ \mathrm{~ M}^{p, q}$ there exists a collection $Y_{1},..., Y_{n} \in \mathrm{~ \bf ~ M ~}^{p, q}$ with $\sum_{i} Y_{i}^{T} Y_{i} = I_{q}$ which makes (∗∗) an equality.

Here is another exercise of the same flavour:

Exercise 3.19 For nonnegative reals $a_{1},..., a_{m}$ and a real $\alpha > 1$ one has

$$
\left(\sum_{i = 1}^{m} a_{i}^{\alpha}\right)^{1 / \alpha} \leq \sum_{i = 1}^{m} a_{i}.
$$

Both sides of this inequality make sense when the nonnegative reals $a_{i}$ are replaced with positive semidefinite $n \times n$ matrices $A_{i}$ . What happens with the inequality in this case?

Consider the following four statements (where $\alpha > 1$ is a real and $m, n > 1)$ :

1)

$$
\forall(A_{i} \in \mathbf{S}_{+}^{n}): \quad \left(\sum_{i = 1}^{m} A_{i}^{\alpha}\right)^{1 / \alpha} \preceq \sum_{i = 1}^{m} A_{i}.
$$

2)

$$
\forall(A_{i} \in \mathbf{S}_{+}^{n}): \quad \lambda_{\max} \left(\left(\sum_{i = 1}^{m} A_{i}^{\alpha}\right)^{1 / \alpha}\right) \leq \lambda_{\max} \left(\sum_{i = 1}^{m} A_{i}\right).
$$

3)

$$
\forall(A_{i} \in \mathbf{S}_{+}^{n}): \quad \operatorname{Tr} \left(\left(\sum_{i = 1}^{m} A_{i}^{\alpha}\right)^{1 / \alpha}\right) \leq \operatorname{Tr} \left(\sum_{i = 1}^{m} A_{i}\right).
$$

4)

$$
\forall(A_{i} \in \mathbf{S}_{+}^{n}): \quad \operatorname{Det} \left(\left(\sum_{i = 1}^{m} A_{i}^{\alpha}\right)^{1 / \alpha}\right) \leq \operatorname{Det} \left(\sum_{i = 1}^{m} A_{i}\right).
$$

Among these 4 statements, exactly 2 are true. Identify and prove the true statements.

## 3.8.1.6 $\succeq$-convexity of some matrix-valued functions

Consider a function $F(x)$ defined on a convex set $X \subset \mathbb{R}^{n}$ and taking values in ${\mathbf{S}}^{m}$ . We say that such a function is $\succeq$-convex, if

$$
F(\alpha x +(1 - \alpha) y) \preceq \alpha F(x) +(1 - \alpha) F(y)
$$

for all $x, y \in X$ and all $\alpha \in[0, 1]$ . F is called $\succeq$-concave, if $- F \ \mathrm{is} \succeq - \mathrm{convex}$

A function F : Dom $F \to \mathbf{S}^{m}$ defined on a set Dom $F \subset \mathbf{S}^{k}$ is called $\succeq$-monotone, if

$$
x, y \in \operatorname{Dom} F, x \succeq y \Rightarrow F(x) \succeq F(y);
$$

F is called $\succeq$-antimonotone, if −F is $\succeq$-monotone.

Exercise 3.20 1) Prove that a function $F : X \to \mathbf{S}^{m}, X \subset \mathbb{R}^{n}$ , is $\succeq$-convex if and only if its “epigraph”

$$
\{(x, Y) \in \mathbb{R}^{n} \rightarrow \mathbf{S}^{m} \mid x \in X, F(x) \preceq Y\}
$$

is a convex set.

2) Prove that a function $F : X \mathbf{S}^{m}$ with convex domain $X \subset \mathbb{R}^{n}$ is $\succeq$-convex if and only $iffor$ every $A \in \mathbf{S}_{+}^{m}$ the function $\operatorname{Tr}(AF(x))$ is convex on X.

Prove that the following functions are $\succeq$-concave and monotone:

3) Let $X \subset \mathbb{R}^{n}$ be a convex set with a nonempty interior and $F : X \mathbf{S}^{m}$ be a function continuous on X which is twice diferentiable in int X. Prove that $F ~ is \succeq - convex ~ if$ and only if the second directional derivative of F

$$
D^{2} F(x)[h, h] \equiv \frac{d^{2}}{dt^{2}} \Big |_{t = 0} F(x + th)
$$

$is \succeq 0$ for every $x \in$ int X and every direction $h \in \mathbb{R}^{n}$

4) Let F : dom $F \to \mathbf{S}^{m}$ be defined and continuously diferentiable on an open convex subset of $\mathbf{S}^{k}$ . Prove that the necessary and sufficient condition for F to be $\succeq$-monotone is the validity of the implication

$$
h \in \mathbf{S}_{+}^{k}, x \in \operatorname{Dom} F \Rightarrow DF(x)[h] \succeq 0.
$$

5) Let F be $\succeq$-convex and ${\mathcal{S}} \subset \mathbf{S}^{m}$ be a convex set which is $\succeq$-antimonotone, i.e. whenever $Y^{\prime} \preceq Y$ and $Y \in S$ , one has $Y^{\prime} \in S$ . Prove that the set $F^{- 1}(S) = \{x \in X \mid F(x) \in S\}$ is convex.

6) Let G : Dom $G \to \mathbf{S}^{k}$ and F : Dom $F \to \mathbf{S}^{m}$ , let $G(\operatorname{Dom} G) \subset \operatorname{Dom} F,$ , and let $H(x) =$ $F(G(x))$ : Dom $G \to \mathbf{S}^{m}$

a) Prove that $ifG$ and F are $\succeq$-convex and F is $\succeq$-monotone, then H is $\succeq - convex.$

b) Prove that if G and F are $\succeq$-concave and F is $\succeq$-monotone, then H is $\succeq$-concave.

7) Let $F_{i} : G \mathbf{S}^{m}$ , and assume that for every $x \in G$ exists

$$
F(x) = \lim_{i \to \infty} F_{i}(x).
$$

Prove that if all functions from the sequence $\{F_{i}\}$ are (a) $\succeq$-convex, or (b) $\succeq$-concave, or (c) $\succeq$-monotone, or (d) $\succeq$-antimonotone, then so is F .

The goal of the next exercise is to establish the $\succeq$-convexity of several matrix-valued functions.

Exercise 3.21 Prove that the following functions are $\succeq$-convex:

1) $F(x) = xx^{T} : \mathbf{M}^{p, q} \mathbf{S}^{p};$

2) $F(x) = x^{- 1} : \mathrm{int} \mathbf{S}_{+}^{m} \mathrm{int} \mathbf{S}_{+}^{m};$

$$
F(u, v) = u^{T} v^{- 1} u: \mathbf{M}^{p, q} \times
$$

$$
\mathbf{S}_{+}^{p} \to \mathbf{S}^{q};
$$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
4)  $F(x) = x^{1/2} : \mathbf{S}_{+}^{m} \to \mathbf{S}^{m};$
</div>

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
5)  $F(x) = \ln x : \operatorname{int} \mathbf{S}_{+}^{m} \to \mathbf{S}^{m};$
</div>

6) $F(x) = \left(Ax^{- 1} A^{T} \right)^{- 1}$ : int $\mathbf{S}_{+}^{n} \to \mathbf{S}^{m}$ , provided that A is an m × n matrix of rank m.

## 3.8.2 SD representations of epigraphs of convex polynomials

Mathematically speaking, the central question concerning the “expressive abilities” of Semidefinite Programming is how wide is the family of convex sets which are SDr. By definition, an SDr set is the projection of the inverse image of $\mathbf{S}_{+}^{m}$ under Affine mapping. In other words, every SDr set is a projection of a convex set given by a number of polynomial inequalities (indeed, the cone $\mathbf{S}_{+}^{m}$ is a convex set given by polynomial inequalities saying that all principal minors of matrix are nonnegative). Consequently, the inverse image of $\mathbf{S}_{+}^{m}$ under an Affine mapping is also a convex set given by a number of (non-strict) polynomial inequalities. And it is known that every projection of such a set is also given by a number of polynomial inequalities (both strict and non-strict). We conclude that

A SD-representable set always is a convex set given by finitely many polynomial inequalities (strict and non-strict).

A natural (and seemingly very dificult) question is whether the inverse is true – whether a convex set given by a number of polynomial inequalities is always SDr. This question can be simplified in many ways – we may fix the dimension of the set, we may assume the polynomials participating in inequalities to be convex, we may fix the degrees of the polynomials, etc.; to the best of our knowledge, all these questions are open.

The goal of the subsequent exercises is to answer afirmatively the simplest question of the above series:

Let $\pi(x)$ be a convex polynomial of one variable. Then its epigraph

$$
\{(t, x) \in \mathbb{R}^{2} \mid t \geq \pi(x)\}
$$

is SDr.

Let us fix a nonnegative integer k and consider the curve

$$
p(x) =(1, x, x^{2}, \dots, x^{2k})^{T} \in \mathbb{R}^{2k + 1}.
$$

Let $\Pi_{k}$ be the closure of the convex hull of values of the curve. How can one describe $\Pi_{k} ?$

A convenient way to answer this question is to pass to a matrix representation of all objects involved. Namely, let us associate with a vector $\xi =(\xi_{0}, \xi_{1},..., \xi_{2k}) \in \mathbb{R}^{2k + 1}$ the $(k + 1) \times(k + 1)$ symmetric matrix

$$
\mathcal{M}(\xi) = \left(\begin{array}{cccccc} \xi_{0} & \xi_{1} & \xi_{2} & \xi_{3} & \dots & \xi_{k} \\ \xi_{1} & \xi_{2} & \xi_{3} & \xi_{4} & \dots & \xi_{k + 1} \\ \xi_{2} & \xi_{3} & \xi_{4} & \xi_{5} & \dots & \xi_{k + 2} \\ \xi_{3} & \xi_{4} & \xi_{5} & \xi_{6} & \dots & \xi_{k + 3} \\ \vdots & \vdots & \vdots & \vdots & \ddots & \vdots \\ \xi_{k} & \xi_{k + 1} & \xi_{k + 2} & \xi_{k + 3} & \dots & \xi_{2k} \end{array} \right),
$$

so that

$$
[\mathcal{M}(\xi)]_{ij} = \xi_{i + j}, i, j = 0,..., k.
$$

The transformation $\xi \mapsto \mathcal{M}(\xi) : \mathbb{R}^{2k + 1} \to \mathbf{S}^{k + 1}$ is a linear embedding; the image of $\Pi_{k}$ under this embedding is the closure of the convex hull of values of the curve

$$
P(x) = \mathcal{M}(p(x)).
$$

It follows that the image $\widehat{\Pi}_{k}$ of $\Pi_{k}$ under the mapping M possesses the following properties:

(i) $\widehat{\Pi}_{k}$ belongs to the image of M, i.e., to the subspace $H_{k}$ of ${\bf S}^{2k + 1}$ comprised of Hankel matrices – matrices with entries depending on the sum of indices only:

$$
H_{k} = \left\{X \in \mathbf{S}^{2k + 1} | i + j = i^{\prime} + j^{\prime} \Rightarrow X_{ij} = X_{i^{\prime} j^{\prime}} \right\};
$$

(ii) $\widehat{\Pi}_{k} \subset \mathbf{S}_{+}^{k + 1}$ (indeed, every matrix $\mathcal{M}(p(x))$ is positive semidefinite);

(iii) For every $X \in \widehat{\Pi}_{k}$ one has $X_{00} = 1$

It turns out that properties $(i) \mathrm{~ - ~}(\mathrm{iii})$ characterize $\widehat{\Pi}_{k} \colon$ (G) A symmetric $(k + 1) \times(k + 1)$ matrix X belongs to $\widehat{\Pi}_{k}$ if and only if it possesses the properties $(i) \mathrm{~ - ~}(\mathrm{iii})$ : its entries depend on sum of indices only $\overline{{(i.\mathrm{e., ~}}} X \in H_{k})$ , X is positive semidefinite and $X_{00} = 1$

(G) is a particular case of the classical results related to the so called “moment problem”. The goal of the subsequent exercises is to give a simple alternative proof of this statement.

Note that the mapping $\mathcal{M}^{\ast} : \mathbf{S}^{k + 1} \to \mathbb{R}^{2k + 1}$ conjugate to the mapping M is as follows:

$$
(\mathcal{M}^{*} X)_{l} = \sum_{i = 0}^{l} X_{i, l - i}, l = 0, 1,..., 2k,
$$

and we know something about this mapping: Example 21a of this Lecture says that

(H) The image of the cone $\mathbf{S}_{+}^{k + 1}$ under the mapping $\mathcal{M}^{\ast}$ is exactly the cone of coeficients of polynomials of degree $\leq 2k$ which are nonnegative on the entire real line.

## Exercise 3.22 Derive (G) from (H).

(G), among other useful things, implies the result we need:

(I) Let $\pi(x) = \pi_{0} + \pi_{1} x + \pi_{2} x^{2} +...+ \pi_{2k} x^{2k}$ be a convex polynomial of degree 2k. Then the epigraph of π is SDr:

$$
\{(t, x) \in \mathbb{R}^{2} \mid t \geq p(x)\} = \mathcal{X}[\pi],
$$

where

$$
\begin{array}{rcl}\mathcal{X}[\pi]&=&\left\{\right.(t, x) \middle | \exists x_{2},..., x_{2k}: \left(\begin{array}{cccccc}1&x&x_{2}&x_{3}&...&x_{k}\\x&x_{2}&x_{3}&x_{4}&...&x_{k + 1}\\x_{2}&x_{3}&x_{4}&x_{5}&...&x_{k + 2}\\x_{3}&x_{4}&x_{5}&x_{6}&...&x_{k + 3}\\...&...&...&...&\ddots&...\\x_{k}&x_{k + 1}&x_{k + 2}&x_{k + 3}&...&x_{2k}\end{array}\right) \succeq 0,\\&&\pi_{0} + \pi_{1} x + \pi_{2} x_{2} + \pi_{3} x_{3} +...+ \pi_{2k} x_{2k} \leq t \Bigg\}\end{array}
$$

Exercise 3.23 Prove (I).

Note that the set ${\mathcal{X}}[\pi]$ makes sense for an arbitrary polynomial $\pi,$ , not necessary for a convex one. What is the projection of this set onto the $(t, x)$ -plane? The answer is surprisingly nice: this is the convex hull of the epigraph of the polynomial $\pi !$

Exercise 3.24 Let $\pi(x) = \pi_{0} + \pi_{1} x +...+ \pi_{2k} x^{2k}$ with $\pi_{2k} > 0$ , and let

$$
G[\pi] = \operatorname{Conv} \{(t, x) \in \mathbb{R}^{2} \mid t \geq p(x)\}
$$

be the convex hull of the epigraph of π (the set of all convex combinations of points from the epigraph $of \pi)$

1) Prove that $G[\pi]$ is a closed convex set.

2) Prove that

$$
G[\pi] = \mathcal{X}[\pi].
$$

## 3.8.3 Around the Lovasz capacity number and semidefinite relaxations of combinatorial problems

Recall that the Lovasz capacity number $\Theta(\Gamma)$ of an n-node graph Γ is the optimal value of the following semidefinite program:

$$
\min_{\lambda, x} \left\{\lambda : \lambda I_{n} - \mathcal{L}(x) \succeq 0 \right\}\tag{L}
$$

where the symmetric $n \times n$ matrix $\mathcal L(x)$ is defined as follows:

- the dimension of x is equal to the number of arcs in Γ, and the coordinates of x are indexed by these arcs;

- the element of $\mathcal{L}(x)$ in an “empty” cell $ij$ (one for which the nodes i and $j$ are not linked by an arc in Γ) is 1;

- the elements of $\mathcal L(x)$ in a pair of symmetric “non-empty” cells $ij, ji$ (those for which the nodes i and j are linked by an arc) are equal to the coordinate of x indexed by the corresponding arc.

As we remember, the importance of $\Theta(\Gamma)$ comes from the fact that $\Theta(\Gamma)$ is a computable upper bound on the stability number $\alpha(\Gamma)$ of the graph. We have seen also that the Shore semidefinite relaxation of the problem of finding the stability number of Γ leads to a “seemingly stronger” upper bound on $\alpha(\Gamma)$ , namely, the optimal value $\sigma(\Gamma)$ in the semidefinite program

$$
\min_{\lambda, \mu, \nu} \left\{\lambda : \left(\begin{array}{cc} \lambda & - \frac{1}{2}(e + \mu)^{T} \\ - \frac{1}{2}(e + \mu) & A(\mu, \nu) \end{array} \right) \succeq 0 \right\}\tag{Sh}
$$

where $e =(1,..., 1)^{T} \in \mathbb{R}^{n}$ and $A(\mu, \nu)$ is the matrix as follows:

- the dimension of ν is equal to the number of arcs in Γ, and the coordinates of ν are indexed by these arcs;

- the diagonal entries of $A(\mu, \nu)$ are $\mu_{1},..., \mu_{n};$

- the of-diagonal entries of $A(\mu, \nu)$ corresponding to “empty cells” are zeros;

- the of-diagonal entries of $A(\mu, \nu)$ in a pair of symmetric “non-empty” cells $ij, ji$ are equal to the coordinate of ν indexed by the corresponding arc.

We have seen that (L) can be obtained from (Sh) when the variables $\mu_{i}$ are set to 1, so that $\sigma(\Gamma) \leq \Theta(\Gamma)$ ). Thus,

$$
\alpha(\Gamma) \leq \sigma(\Gamma) \leq \Theta(\Gamma).\tag{3.8.3}
$$

Exercise 3.25 1) Prove that $if \left(\lambda, \mu, \nu \right)$ is a feasible solution to (Sh), then there exists a symmetric n × n matrix A such that $\lambda I_{n} - A \succeq 0$ and at the same time the diagonal entries of A and the of-diagonal entries in the “empty ce $\iiint{a}^{\prime 3} \are \ \geq 1$ . Derive from this observation that the optimal value in (Sh) is not less than the optimal value $\Theta^{\prime}(\Gamma)$ in the following semidefinite program:

$$
\min_{\lambda, x} \left\{\lambda : \lambda I_{n} - X \succeq 0, X_{ij} \geq 1 \text{whenever} i, j \text{are not adjacent in} \Gamma \right\}\tag{Sc}
$$

2) Prove that $\Theta^{\prime}(\Gamma) \ge \alpha(\Gamma)$

Hint: Demonstrate that if all entries of a symmetric $k \times k$ matrix $\mathrm{are} \geq 1$ , then the maximum eigenvalue of the matrix is at least k. Derive from this observation and the Interlacing Eigenvalues Theorem (Exercise 3.4.(ii)) that if a symmetric matrix contains a principal $k \times k$ submatrix with entries $\geq 1$ , then the maximum eigenvalue of the matrix is at least k.

The upper bound $\Theta^{\prime}(\Gamma)$ on the stability number of Γ is called the Schrijver capacity of graph Γ. Note that we have

$$
\alpha(\Gamma) \leq \Theta^{\prime}(\Gamma) \leq \sigma(\Gamma) \leq \Theta(\Gamma).
$$

A natural question is which inequalities in this chain may happen to be strict. In order to answer it, we have computed the quantities in question for about 2,000 random graphs with number of nodes varying 8 to 20. In our experiments, the stability number was computed – by brute force – for graphs with $\leq 12$ nodes; for all these graphs, the integral part of $\Theta(\Gamma)$ was equal to $\alpha(\Gamma)$ Furthermore, $\Theta(\Gamma)$ was non-integer in 156 of our 2,000 experiments, and in 27 of these 156 cases the Schrijver capacity number $\Theta^{\prime}(\Gamma)$ was strictly less than $\Theta(\Gamma)$ . The quantities $\Theta^{\prime}(\cdot), \sigma(\cdot), \Theta(\cdot)$ for 13 of these 27 cases are listed in the table below:

<table><tr><td>Graph #</td><td># of nodes</td><td> $\alpha$ </td><td> $\Theta'$ </td><td> $\sigma$ </td><td> $\Theta$ </td></tr><tr><td>1</td><td>20</td><td>?</td><td>4.373</td><td>4.378</td><td>4.378</td></tr><tr><td>2</td><td>20</td><td>?</td><td>5.062</td><td>5.068</td><td>5.068</td></tr><tr><td>3</td><td>20</td><td>?</td><td>4.383</td><td>4.389</td><td>4.389</td></tr><tr><td>4</td><td>20</td><td>?</td><td>4.216</td><td>4.224</td><td>4.224</td></tr><tr><td>5</td><td>13</td><td>?</td><td>4.105</td><td>4.114</td><td>4.114</td></tr><tr><td>6</td><td>20</td><td>?</td><td>5.302</td><td>5.312</td><td>5.312</td></tr><tr><td>7</td><td>20</td><td>?</td><td>6.105</td><td>6.115</td><td>6.115</td></tr><tr><td>8</td><td>20</td><td>?</td><td>5.265</td><td>5.280</td><td>5.280</td></tr><tr><td>9</td><td>9</td><td>3</td><td>3.064</td><td>3.094</td><td>3.094</td></tr><tr><td>10</td><td>12</td><td>4</td><td>4.197</td><td>4.236</td><td>4.236</td></tr><tr><td>11</td><td>8</td><td>3</td><td>3.236</td><td>3.302</td><td>3.302</td></tr><tr><td>12</td><td>12</td><td>4</td><td>4.236</td><td>4.338</td><td>4.338</td></tr><tr><td>13</td><td>10</td><td>3</td><td>3.236</td><td>3.338</td><td>3.338</td></tr></table>

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/8b83f4759610d62f94ca3dd0c80962cc45433e06965027225bc1e5ffd916d544.jpg)  
Graphs # 13 (left) and # 8 (right); all nodes are on circumferences.

Exercise 3.26 Compute the stability numbers of the graphs $\# \ : \delta$ and $\# ~ 1 \mathcal{B}.$

Exercise 3.27 Prove that $\sigma(\Gamma) = \Theta(\Gamma)$ .

The chromatic number $\xi(\Gamma)$ of a graph Γ is the minimal number of colours such that one can colour the nodes of the graph in such a way that no two adjacent (i.e., linked by an arc) nodes get the same colour<sup>28)</sup>. The complement Γ of a graph Γ is the graph with the same set of nodes,<sup>¯</sup> and two distinct nodes in $\bar{\Gamma}$ are linked by an arc if and only if they are not linked by an arc in Γ.

Lovasz proved that for every graph

$$
\Theta(\Gamma) \leq \xi(\bar{\Gamma})\tag{*}
$$

so that

$$
\alpha(\Gamma) \leq \Theta(\Gamma) \leq \xi(\bar{\Gamma})
$$

(Lovasz’s Sandwich Theorem).

Exercise 3.28 Prove (\*).

Hint: Let us colour the vertices of Γ in $k = \xi(\bar{\Gamma})$ colours in such a way that no two vertices of the same colour are adjacent in Γ, i.e., every two nodes of the same colour are adjacent<sup>¯</sup> in Γ. Set $\lambda = k,$ , and let x be such that

$$
[\mathcal{L}(x)]_{ij} = \left\{\begin{array}{ll} -(k - 1), & i \neq j, i, j \text{are of the same colour} \\ 1, & \text{otherwise} \end{array} \right.
$$

Prove that $(\lambda, x)$ is a feasible solution to (L).

Now let us switch from the Lovasz capacity number to semidefinite relaxations of combinatorial problems, specifically to those of maximizing a quadratic form over the vertices of the unit cube, and over the entire cube:

$$
\begin{array}{ll}(a) & \max_{x} \left\{x^{T} Ax: x \in \operatorname{Vrt}(C_{n}) = \{x \in \mathbb{R}^{n} \mid x_{i} = \pm 1 \forall i\} \right\} \\(b) & \max_{x} \left\{x^{T} Ax: x \in C_{n} = \{x \in \mathbb{R}^{n} \mid - 1 \leq x_{i} \leq 1, \forall i\} \right\} \end{array}\tag{3.8.4}
$$

The standard semidefinite relaxations of the problems are, respectively, the problems

$$
\begin{array}{ll}(a) & \max_{X} \left\{\operatorname{Tr}(AX): X \succeq 0, X_{ii} = 1, i = 1,..., n \right\}, \\(b) & \max_{X} \left\{\operatorname{Tr}(AX): X \succeq 0, X_{ii} \leq 1, i = 1,..., n \right\}; \end{array}\tag{3.8.5}
$$

the optimal value of a relaxation is an upper bound for the optimal value of the respective original problem.

Exercise 3.29 Let $A \in \mathbf{S}^{n}$ . Prove that

$$
\max_{x: x_{i} = \pm 1, i = 1, \dots, n} x^{T} Ax \geq \operatorname{Tr}(A).
$$

Develop an efficient algorithm which, given A, generates a point x with coordinates ±1 such that $x^{T} Ax \geq \operatorname{Tr}(A)$

Exercise 3.30 Prove that if the diagonal entries of A are nonnegative, then the optimal values in (3.8.5.a) and (3.8.5.b) are equal to each other. Thus, in the case in question, the relaxations $^{6} do$ not understand” whether we are maximizing over the vertices of the cube or over the entire cube.

Exercise 3.31 Prove that the problems dual to (3.8.5.a, b) are, respectively,

(a)

(b)

$$
\begin{array}{rl} & \min_{\Lambda} \left\{\mathrm{Tr}(\Lambda): \Lambda \succeq A, \Lambda \text{is diagonal} \right\}, \\ & \min_{\Lambda} \left\{\mathrm{Tr}(\Lambda): \Lambda \succeq A, \Lambda \succeq 0, \Lambda \text{is diagonal} \right\}; \end{array}\tag{3.8.6}
$$

the optimal values in these problems are equal to those of the respective problems in (3.8.5) and are therefore upper bounds on the optimal values of the respective combinatorial problems from (3.8.4).

The latter claim is quite transparent, since the problems (3.8.6) can be obtained as follows:

- In order to bound from above the optimal value of a quadratic form $x^{T}$ Ax on a given set $S,$ we look at those quadratic forms $x^{T} \Lambda x$ which can be easily maximized over S. For the case of $S = \mathrm{Vrt}(C_{n})$ these are quadratic forms with diagonal matrices $\Lambda,$ and for the case of $S = C_{n}$ these are quadratic forms with diagonal and positive semidefinite matrices $\Lambda;$ in both cases, the respective maxima are merely $\operatorname{Tr}(\Lambda)$

- Having specified a family $\mathcal{F}$ of quadratic forms $x^{T} \Lambda x$ “easily optimizable over $S^{\ast}$ , we then look at those forms from $\mathcal{F}$ which dominate everywhere the original quadratic form $x^{T} Ax$ , and take among these forms the one with the minimal $\operatorname{max}_{x \in S} x^{T} \Lambda x$ , thus coming to the problem

$$
\min_{\Lambda} \left\{\max_{x \in S} x^{T} \Lambda x: \Lambda \succeq A, \Lambda \in \mathcal{F} \right\}.\tag{!}
$$

It is evident that the optimal value in this problem is an upper bound on $\operatorname{max}_{x \in S} x^{T} Ax$ . It is also immediately seen that in the case of $S = \mathrm{Vrt}(C_{n})$ the problem (!), with $\mathcal{F}$ specified as the set $\mathcal{D}$ of all diagonal matrices, is equivalent to $(3.8.6.a)$ , while in the case of $S = C_{n} \(!)$ , with $\mathcal{F}$ specified as the set $\mathcal{D}_{+}$ of positive semidefinite diagonal matrices, is nothing but (3.8.6.b).

Given the direct and quite transparent road leading to $(3.8.6.a, b)$ , we can try to move a little bit further along this road. To this end observe that there are trivial upper bounds on the maximum of an arbitrary quadratic form $x^{T} \Lambda x$ over $\mathrm{Vrt}(C_{n})$ and $C_{n}.$ , specifically:

$$
\max_{x \in \operatorname{Vrt}(C_{n})} x^{T} \Lambda x \leq \operatorname{Tr}(\Lambda) + \sum_{i \neq j} | \Lambda_{ij} |, \quad \max_{x \in C_{n}} x^{T} \Lambda x \leq \sum_{i, j} | \Lambda_{ij} |.
$$

For the above families $\mathcal{D}, \mathcal{D}_{+}$ of matrices Λ for which $x^{T} \Lambda x$ x is “easily optimizable” over $\mathrm{Vrt}(C_{n})$ respectively, $C_{n}$ , the above bounds are equal to the precise values of the respective maxima. Now let us update (!) as follows: we eliminate the restriction $\Lambda \in{\mathcal{F}}$ , replacing simultaneously the objective $\operatorname{max}_{x \in S} x^{T}$ Λx with its upper bound, thus coming to the pair of problems

(a)

(b)

$$
\begin{array}{rl} \min_{\Lambda} \left\{\operatorname{Tr}(\Lambda) + \sum_{i \neq j} | \Lambda_{ij} |: \Lambda \succeq A \right\} &[S = \operatorname{Vrt}(C_{n})] \\ \min_{\Lambda} \left\{\sum_{i, j} | \Lambda_{ij} |: \Lambda \succeq A \right\} &[S = C_{n}] \end{array}\tag{3.8.7}
$$

From the origin of the problems it is clear that they still yield upper bounds on the optimal values of the respective problems (3.8.4.a, b), and that these bounds are at least as good as the bounds yielded by the standard relaxations (3.8.5.a, b):

(a)

(b)

$$
\begin{array}{l} \text{Opt(3.8.4.a)\leq Opt(3.8.7.a) \underbrace{\leq}_{(*)} Opt(3.8.5.a) = Opt(3.8.6.a)}, \\ \text{Opt(3.8.4.b)\leq Opt(3.8.7.b) \underbrace{\leq}_{(**)} Opt(3.8.5.b) = Opt(3.8.6.b)}, \end{array}\tag{3.8.8}
$$

where $\mathrm{Opt}(\cdot)$ means the optimal value of the corresponding problem.

Indeed, consider the problem (3.8.7.a). Whenever Λ is a feasible solution of this problem, the quadratic form $x^{T} \Lambda x$ dominates everywhere the form $x^{T} Ax.$ , so that $\operatorname{max}_{x \in \mathrm{Vrt}(C_{n})} x^{T} Ax \leq$ $\operatorname{max}_{x \in \mathrm{Vrt}(C_{n})} x^{T} \Lambda x;$ the latter quantity, in turn, is upper-bounded by $\mathrm{Tr}(\Lambda) + \sum_{i \neq j} | \Lambda_{ij} |$ , whence the value of the objective of the problem (3.8.7.a) at every feasible solution of the problem upper-bounds the quantity $\operatorname{max}_{x \in \mathrm{Vrt}(C_{n})} x^{T} Ax$ . Thus, the optimal value in (3.8.7.a) is an upper bound on the maximum of $x^{T}$ Ax over the vertices of the cube $C_{n}$ . At the same time, when passing from the (dual form of the) standard relaxation (3.8.6.a) to our new bounding problem (3.8.7.a), we only extend the feasible set and do not vary the objective at the “old” feasible set; as a result of such a modification, the optimal value may only decrease. Thus, the upper bound on the maximum of $x^{T} Ax$ over $\mathrm{Vrt}(C_{n})$ yielded by (3.8.7.a) is at least as good as those (equal to each other) bounds yielded by the standard relaxations (3.8.5.a), (3.8.6.a), as required in (3.8.8.a). Similar reasoning proves (3.8.8.b).

Note that problems (3.8.7) are equivalent to semidefinite programs and thus are of the same status of “computational tractability” as the standard SDP relaxations (3.8.6) of the combinatorial problems in question. At the same time, our new bounding problems are more dificult than the standard SDP relaxations. Can we justify this by getting an improvement in the quality of the bounds?

Exercise 3.32 Find out whether the problems (3.8.7.a, b) yield better bounds than the respective problems (3.8.6.a, b), i.e., whether the inequalities (\*), (\*\*) in (3.8.8) can be strict.

Hint: Look at the problems dual to (3.8.7.a, b).

Exercise 3.33 Let D be a given subset of $\mathbb{R}_{+}^{n}$ . Consider the following pair of optimization problems:

$$
\max_{x} \left\{x^{T} Ax:(x_{1}^{2}, x_{2}^{2},..., x_{n}^{2})^{T} \in D \right\}\tag{P}
$$

$$
\max_{X} \left\{\mathrm{Tr}(AX): X \succeq 0, \mathrm{Dg}(X) \in D \right\}\tag{R}
$$

(Dg(X) is the diagonal of a square matrix X). Note that when $\boldsymbol{D} = \{(1,..., 1)^{T}\}, ~(\mathbb{P})$ is the problem of maximizing a quadratic form over the vertices of $C_{n}$ , while (R) is the standard semidefinite relaxation of $(P)_{i}$ ; when $D = \{x \in \mathbb{R}^{n} \mid 0 \leq x_{i} \leq 1 \forall i\}$ , (P ) is the problem of maximizing a quadratic form over the cube $C_{n}$ , and (R) is the standard semidefinite relaxation of the latter problem.

1) Prove that if D is semidefinite-representable, then (R) can be reformulated as a semidefinite program.

2) Prove that (R) is a relaxation of (P ), i.e., that

$$
\operatorname{Opt}(P) \leq \operatorname{Opt}(R).
$$

3) [Nesterov] Let $A \succeq 0$ . Prove that then

$$
\operatorname{Opt}(P) \leq \operatorname{Opt}(R) \leq \frac{\pi}{2} \operatorname{Opt}(P).
$$

Hint: Use Nesterov’s $\frac{\pi}{2}$ Theorem (Theorem 3.4.2).

Exercise 3.34 Let $A \in \mathbf{S}_{+}^{m}$ . Prove that

$$
\max \{x^{T} Ax \mid x_{i} = \pm 1, i = 1,..., m\} = \max \{\frac{2}{\pi} \sum_{i, j = 1}^{m} a_{ij} \mathrm{asin}(X_{ij}) \mid X \succeq 0, X_{ii} = 1, i = 1,..., m\}.
$$

## 3.8.4 Around operator norms

Exercise 3.35 1) Let $T \subset \mathbb{R}^{n}$ be a convex compact set with a nonempty interior, and

$$
\mathbf{T} = \operatorname{cl} \left\{\left[x; t \right] \in \mathbb{R}^{n} \times \mathbb{R}: t > 0, t^{- 1} x \in T \right\}
$$

be the closed conic hull of T . Prove that T is a regular cone such that

$$
T = \{x:[x; 1] \in \mathbf{T},
$$

and the cone dual to T is

$$
\mathbf{T}_{*} = \{[g; s]: s \geq \phi_{T}(- g) \|,
$$

where

$$
\phi_{T}(y) = \max_{x \in T} x^{T} y
$$

is the support function of T .

2) Let T be a convex compact subset of $\mathbb{R}_{+}^{m}$ with int $T \neq \emptyset$ , and let

$$
X[T] = \{X \in \mathbf{S}_{+}^{m}: \mathrm{Dg}(X) \in T\},
$$

where, as always, $\operatorname{Dg}(X)$ is the vector of diagonal entries $of$ matrix X. Prove that $X[T]$ is a convex compact subset of S<sup>n</sup> , the closed conic hull of X[T ] is the regular cone

$$
\mathbf{X}[T] = \{(X, t) \in \mathbf{S}_{+}^{m} \times \mathbb{R}:[\mathrm{Dg}(X); t] \in \mathbf{T}\},
$$

where T is the closed conic hull of T , and the cone dual to $\mathbf{X}[T]$ is

$$
\mathbf{X}_{*}[T] = \{Y \in \mathbf{S}^{m}: \exists h \in \mathbb{R}^{m}: \operatorname{Diag} \{h\} + Y \succeq 0, r \geq \phi_{T}(h)\},
$$

with the same $\phi_{T}(\cdot)$ as in 1).

3) Under the premise and in the notation of Theorem 3.4.3, let T posses a nonempty interior. Prove that

$$
s_{*}(A) = - \min_{u} \left\{\phi_{T}(- u): A \succeq \operatorname{Diag} \{u\} \right\}\tag{a}
$$

$$
{s^{*}(A)} ={\min_{w} \{\phi_{T}(w): \mathrm{Diag} \{w\} \succeq A\}}\tag{b}
$$

(!)

4) In the situation of 3), let matrix A from 3) be of special structure: $A = \left[{\frac{\partial}{B^{T}}} \right]$ with $p \times q$ matrix B. Prove that in this case

a. One has $s^{*}(A) = - s_{*}(A)$ and $m^{*}(A) = - m_{*}(A)$

b. One has $\begin{array}{r}{m^{*}(A) ~ = ~ \operatorname{max}_{x \in{\mathcal{T}}} | x^{T} Ax | ~ \leq ~ s^{*}(A) ~ = ~ \operatorname{min}_{h} \left\{\phi_{T}(h) : \operatorname{Diag} \{h\} \succeq A \right\} ~ \leq ~ H^{*},} \end{array}$ ${\frac{\pi}{4 - \pi}} m^{*}(A)$

c. Derive from Theorem 3.4.3 the following “partial refinement” of Theorem 3.4.6:

Theorem 3.8.1 Consider a special case of the situation considered in Theorem 3.4.6, specifically, the one where in (3.4.29) K = dim z, $z^{T} R_{k} z = z_{k}^{2}, k \le K$ , and similarly L = dim w and $w^{T} S_{\ell} w = w_{\ell}^{2}, \ell \le L$ . Then the eficiently computable upper bound

$$
\overline{{\Phi}}_{\pi \to \theta}(C) = \min_{\lambda \geq 0, \mu \geq 0} \left\{\phi_{\mathcal{R}}(\lambda) + \phi_{\mathcal{S}}(\mu): \left[\begin{array}{cc} \operatorname{Diag} \{\mu\} & \frac{1}{2} Q^{T} CP \\ \hline \frac{1}{2} P^{T} C^{T} Q & \operatorname{Diag} \{\lambda\} \end{array} \right] \succeq 0 \right\}\tag{a}
$$

(3.8.9)

(cf. (3.4.30)) on the operator norm $\Phi_{\pi \to \theta}(C) = \operatorname{max}_{x : \pi(x) \leq 1} \theta(Cx)$ of a matrix C is tight within absolute constant factor:

$$
\Phi_{\pi \to \theta}(C) \leq \overline{{\Phi}}_{\pi \to \theta}(C) \leq \frac{\pi}{4 - \pi} \Phi_{\pi \to \theta}(C),\tag{3.8.10}
$$

cf. (3.4.31).

## 3.8.5 Around Lyapunov Stability Analysis

A natural mathematical model of a swing is the linear time invariant dynamic system

$$
y^{\prime \prime}(t) = - \omega^{2} y(t) - 2 \mu y^{\prime}(t)\tag{S}
$$

with positive $\omega^{2}$ and $0 \leq \mu < \omega$ (the term $2 \mu y^{\prime}(t)$ represents friction). A general solution to this equation is

$$
y(t) = a \cos(\omega^{\prime} t + \phi_{0}) \exp \{- \mu t\}, \omega^{\prime} = \sqrt{\omega^{2} - \mu^{2}},
$$

with free parameters a and φ<sub>0</sub>, i.e., this is a decaying oscillation. Note that the equilibrium

$$
y(t) \equiv 0
$$

is stable – every solution to (S) converges to 0, along with its derivative, exponentially fast.

After stability is observed, an immediate question arises: how is it possible to swing on a swing? Everybody knows from practice that it is possible. On the other hand, since the equilibrium is stable, it looks as if it was impossible to swing, without somebody’s assistance, for a long time. The reason which makes swinging possible is highly nontrivial – parametric resonance. A swinging child does not sit on the swing in a once forever fixed position; what he

right: $h = 0.25 \colon$ this child can already swing...

does is shown below:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/d47f5b47880120d49116adcf29960cdf8a87857951c61274fb3c868673f834f8.jpg)  
A swinging child

As a result, the “efective length” of the swing l – the distance from the point where the rope is fixed to the center of gravity of the system – is varying with time: $l = l(t)$ . Basic mechanics says that $\omega^{2} = g / l$ , g being the gravity acceleration. Thus, the actual swing is a time-varying linear dynamic system:

$$
y^{\prime \prime}(t) = - \omega^{2}(t) y(t) - 2 \mu y^{\prime}(t),\tag{S'}
$$

and it turns out that for properly varied $\omega(t)$ the equilibrium $y(t) \equiv 0$ is not stable. A swinging child is just varying $l(t)$ in a way which results in an unstable dynamic system (S<sup>0</sup>), and this instability is in fact what the child enjoys...

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/473b7018d6cb4555ab1f769d5cd122e312f353983deaf74379ef714e5d2c6058.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/09ef32d1f2dcc825ce641b254856d94be31f0cfe1971c4897e835dbb268499a9.jpg)

$$
\begin{array}{c} y^{\prime \prime}(t) = - \frac{g}{l + h \sin(2 \omega t)} y(t) - 2 \mu y^{\prime}(t), \quad y(0) = 0, y^{\prime}(0) = 0.1 \\ \left[l = 1[m], g = 10[\frac{m}{\sec^{2}}], \mu = 0.15[\frac{1}{\sec}], \omega = \sqrt{g / l} \right] \end{array}
$$

left: $h = 0.125 \colon$ this child is too small; he should grow up...

Exercise 3.36 Assume that you are given parameters l (“nominal length of the swing rope”), $h > 0$ and $\mu > 0$ , and it is known that a swinging child can vary the “efective length” of the rope within the bounds $l \pm h$ , i.e., his/her movement is governed by the uncertain linear time-varying system

$$
y^{\prime \prime}(t) = - a(t) y(t) - 2 \mu y^{\prime}(t), \quad a(t) \in \left[\frac{g}{l + h}, \frac{g}{l - h} \right].
$$

Try to identify the domain in the 3D-space of parameters l, µ, h where the system is stable, as well as the domain where its stability can be certified by a quadratic Lyapunov function. What is “the diference” between these two domains?

## 3.8.6 Around ellipsoidal approximations

Exercise 3.37 Prove the L¨owner – Fritz John Theorem (Theorem 3.7.1).

## 3.8.6.1 More on ellipsoidal approximations of sums of ellipsoids

The goal of two subsequent exercises is to get in an alternative way the problem $(\tilde{\mathrm{O}})$ “generating” a parametric family of ellipsoids containing the arithmetic sum of m given ellipsoids (Section 3.7.4).

Exercise 3.38 Let $P_{i}$ be nonsingular, and $\Lambda_{i}$ be positive definite $n \times n$ matrices, $i = 1,..., m$ Prove that for every collection $x^{1},..., x^{m}$ of vectors from $\mathbb{R}^{n}$ one has

$$
[x^{1} + \dots + x^{m}]^{T} \left[\sum_{i = 1}^{m}[P_{i}^{T}]^{- 1} \Lambda_{i}^{- 1} P_{i}^{- 1} \right]^{- 1}[x^{1} + \dots + x^{m}] \leq \sum_{i = 1}^{m}[x^{i}]^{T} P_{i} \Lambda_{i} P_{i}^{T} x^{i}.\tag{3.8.11}
$$

Hint: Consider the $(nm + n) \times(nm + n)$ symmetric matrix

$$
A = \left[\begin{array}{cccc} P_{1} \Lambda_{1} P_{1}^{T} & & & I_{n} \\ & \ddots & & \vdots \\ & & P_{m} \Lambda_{m} P_{m}^{T} & I_{n} \\ \hline I_{n} & \dots & I_{n} & \sum_{i = 1}^{m}[P_{i}^{T}]^{- 1} \Lambda_{i}^{- 1} P_{i}^{- 1} \end{array} \right]
$$

and apply twice the Schur Complement Lemma: first time – to prove that the matrix is positive semidefinite, and the second time – to get from the latter fact the desired inequality.

Exercise 3.39 Assume you are given m full-dimensional ellipsoids centered at the origin

$$
W_{i} = \{x \in \mathbb{R}^{n} \mid x^{T} B_{i} x \leq 1\}, i = 1, \dots, m
$$

$$
[B_{i} \succ 0]
$$

in $\mathbb{R}^{n}$

1) Prove that for every collection Λ of positive definite $n \times n$ matrices $\Lambda_{i}$ such that

$$
\sum_{i} \lambda_{\mathrm{max}}(\Lambda_{i}) \leq 1
$$

the ellipsoid

$$
E_{\Lambda} = \{x \mid x^{T} \left[\sum_{i = 1}^{m} B_{i}^{- 1 / 2} \Lambda_{i}^{- 1} B_{i}^{- 1 / 2} \right]^{- 1} x \leq 1\}
$$

contains the sum $W_{1} + \ldots + W_{m}$ of the ellipsoids W<sub>i</sub>.

2) Prove that in order to find the smallest volume ellipsoid in the family $\{E_{\Lambda}\}_{\Lambda}$ defined in 1) it sufices to solve the semidefinite program

(a)

(b)

$$
\left[\begin{array}{cccc} \Lambda_{1} & & & \\ & \Lambda_{2} & & \\ & & \ddots & \\ & & & \Lambda_{m} \end{array} \right] \succeq \left[\begin{array}{cccc} t \leq \operatorname{Det}^{1 / n}(Z), \\ B_{1}^{- 1 / 2} ZB_{1}^{- 1 / 2} & B_{1}^{- 1 / 2} ZB_{2}^{- 1 / 2} &...& B_{1}^{- 1 / 2} ZB_{m}^{- 1 / 2} \\ B_{2}^{- 1 / 2} ZB_{1}^{- 1 / 2} & B_{2}^{- 1 / 2} ZB_{2}^{- 1 / 2} &...& B_{2}^{- 1 / 2} ZB_{m}^{- 1 / 2} \\ \vdots & \vdots & \ddots & \vdots \\ B_{m}^{- 1 / 2} ZB_{1}^{- 1 / 2} & B_{m}^{- 1 / 2} ZB_{2}^{- 1 / 2} &...& B_{m}^{- 1 / 2} ZB_{m}^{- 1 / 2} \end{array} \right],\tag{c}
$$

$$
Z \succeq 0,\tag{d}
$$

$$
\Lambda_{i} \preceq \lambda_{i} I_{n}, i = 1, \dots, m,\tag{e}
$$

$$
\sum_{i = 1}^{m} \lambda_{i} \leq 1\tag{3.8.12}
$$

in variables $Z, \Lambda_{i} \in \mathbf{S}^{n}, t, \lambda_{i} \in \mathbb{R}$ ; the smallest volume ellipsoid in the family $\{E_{\Lambda}\}_{\Lambda}$ is $E_{\Lambda^{*}}$ where $\Lambda^{*}$ is the $\cdot \prime \Lambda \cdot part^{\prime \prime}$ of an optimal solution of the problem.

Hint: Use example 20c.

3) Demonstrate that the optimal value in (3.8.12) remains unchanged when the matrices $\Lambda_{i}$ are further restricted to be scalar: $\Lambda_{i} = \lambda_{i} I_{n}$ . Prove that with this additional constraint problem (3.8.12) becomes equivalent to problem (O)<sup>˜</sup> from Section 3.7.4.

Remark 3.8.1 Exercise 3.39 demonstrates that the approximating scheme for solving problem (O) presented in Proposition 3.7.4 is equivalent to the following one:

Given m positive reals $\lambda_{i}$ with unit sum, one defines the ellipsoid $E(\lambda) ~ = ~ \{x ~\}$ $x^{T} \left[\sum_{i = 1}^{m} \lambda_{i}^{- 1} B_{i}^{- 1} \right]^{- 1} x \le 1\}$ . This ellipsoid contains the arithmetic sum W of the ellipsoids $\{x \mid x^{T} B_{i} x \leq 1\}$ , and in order to approximate the smallest volume ellipsoid containing $W$ , we merely minimize Det $\left(E(\lambda) \right)$ over $\lambda$ varying in the standard simplex $\{\lambda \ge 0, \sum_{i} \lambda_{i} = 1\}$

In this form, the approximation scheme in question was proposed by Schweppe (1975).

Exercise 3.40 Let $A_{i}$ be nonsingular $n \times n$ matrices, $i = 1,..., m$ , and let $W_{i} = \{x = A_{i} u$ $u^{T} u \leq 1\}$ be the associated ellipsoids in $\mathbb{R}^{n}$ . Let $\Delta_{m} = \{\lambda \in{\bf R}_{+}^{m} \mid \sum_{i} \lambda_{i} = 1\}$ . Prove that

1) Whenever $\lambda \in \Delta_{m}$ and $A \in \mathbf{M}^{n, n}$ is such that

$$
AA^{T} \succeq F(\lambda) \equiv \sum_{i = 1}^{m} \lambda_{i}^{- 1} A_{i} A_{i}^{T},
$$

the ellipsoid $E[A] = \{x = Au \mid u^{T} u \leq 1\}$ contains $W = W_{1} + \ldots + W_{m}$

Hint: Use the result of Exercise 3.39.1)

2) Whenever $A \in \mathbf{M}^{n, n}$ is such that

$$
AA^{T} \preceq F(\lambda) \quad \forall \lambda \in \Delta_{m},
$$

the ellipsoid $E[A]$ is contained in $W_{1} + \ldots + W_{m}$ , and vice versa.

Hint: Note that

$$
\left(\sum_{i = 1}^{m} \left| \alpha_{i} \right|\right)^{2} = \min_{\lambda \in \Delta_{m}} \sum_{i = 1}^{m} \frac{\alpha_{i}^{2}}{\lambda_{i}}
$$

and use statement (F) from Section 3.7.4.

## 3.8.6.2 “Simple” ellipsoidal approximations of sums of ellipsoids

Let $W_{i} = \{x = A_{i} u \mid u^{T} u \leq 1\}, i = 1,..., m$ , be full-dimensional ellipsoids in $\mathbb{R}^{n}$ (so that $A_{i}$ are nonsingular $n \times n$ matrices), and let $W = W_{1} + \ldots + W_{m}$ be the arithmetic sum of these ellipsoids. Observe that $W$ is the image of the set

$$
\mathcal{B} = \left\{u = \left[\begin{array}{c} u[1] \\ \vdots \\ u[m] \end{array} \right] \in \mathbb{R}^{nm} \mid u^{T}[i] u[i] \leq 1, i = 1,..., m \right\}
$$

under the linear mapping

$$
u \mapsto \mathcal{A} u = \sum_{i = 1}^{m} A_{i} u[i]: \mathbb{R}^{nm} \to \mathbb{R}^{n}.
$$

It follows that

Whenever an nm-dimensional ellipsoid W contains $B,$ the set $\mathbf{\nabla} A(\mathcal W)$ , which is an n-dimensional ellipsoid (why?) contains W , and whenever W is contained in $B{\mathrm{,}}$ the ellipsoid A(W) is contained in W .

In view of this observation, we can try to approximate W from inside and from outside by the ellipsoids $W_{-} \equiv \mathcal{A}(\mathcal{W}_{-})$ and $W^{+} = \mathcal{A}(\mathcal{W}^{+})$ , where $\mathcal{W}_{-}$ and $\mathcal{W}^{+}$ are, respectively, the largest and the smallest volume nm-dimensional ellipsoids contained in/containing B.

Exercise 3.41 1) Prove that

$$
\mathcal{W}_{-} = \{u \in \mathbb{R}^{nm} \mid \sum_{i = 1}^{m} u^{T}[i] u[i] \leq 1\},
$$

$$
\mathcal{W}^{+} = \{u \in \mathbb{R}^{nm} | \sum_{i = 1}^{m} u^{T}[i] u[i] \leq m\},
$$

so that

$$
\begin{array}{rcl} W \supset W_{-} & \equiv & \{x = \sum_{i = 1}^{m} A_{i} u[i] \mid \sum_{i = 1}^{m} u^{T}[i] u[i] \leq 1\}, \\ W \subset W_{+} & \equiv & \{x = \sum_{i = 1}^{m} A_{i} u[i] \mid \sum_{i = 1}^{m} u^{T}[i] u[i] \leq m\} = \sqrt{m} W_{-}.\end{array}
$$

2) Prove that W<sub>−</sub> can be represented as

$$
W_{-} = \{x = Bu \mid u \in \mathbb{R}^{n}, u^{T} u \leq 1\}
$$

with matrix $B \succ 0$ representable as

$$
B = \sum_{i = 1}^{m} A_{i} X_{i}
$$

with square matrices $X_{i}$ of norms $| X_{i} | \le 1$

Derive from this observation that the “level of conservativeness” of the inner ellipsoidal approximation of W given by Proposition 3.7.6 is at most $\sqrt{m}$ : if W<sub>∗</sub> is this inner ellipsoidal approximation and $W_{* *}$ is the largest volume ellipsoid contained in $W_{☉}$ , then

$$
\left(\frac{\operatorname{Vol}(W_{* *})}{\operatorname{Vol}(W_{*})}\right)^{1 / n} \leq \left(\frac{\operatorname{Vol}(W)}{\operatorname{Vol}(W_{*})}\right)^{1 / n} \leq \sqrt{m}.
$$

## 3.8.6.3 Invariant ellipsoids

Exercise 3.42 Consider a discrete time controlled dynamic system

$$
\begin{array}{rcl} x(t + 1) & = & Ax(t) + bu(t), t = 0, 1, 2,...\\ x(0) & = & 0, \end{array}
$$

where $\b{x}(t) \in \mathbb{R}^{n}$ is the state vector and $u(t) \in[- 1, 1]$ is the control at time t. An ellipsoid centered at the origin

$$
W = \{x \mid x^{T} Zx \leq 1\}[Z \succ 0]
$$

is called invariant, if

$$
x \in W \Rightarrow Ax \pm b \in W.
$$

Prove that

1) If W is an invariant ellipsoid and $x(t) \in W$ for some t, then $x(t^{\prime}) \in W$ for all $t^{\prime} \geq t$

2) Assume that the vectors $b, Ab, A^{2} b,..., A^{n - 1} b$ are linearly independent. Prove that an invariant ellipsoid exists if and only if A is stable (the absolute values of all eigenvalues of A $are < 1)$

3) Assuming that A is stable, prove that an ellipsoid $\{x \mid x^{T} Zx \leq 1\} \[Z \succ 0]$ is invariant if and only if there exists $\lambda \geq 0$ such that

$$
\left(\begin{array}{cc} 1 - b^{T} Zb - \lambda & - b^{T} ZA \\ - A^{T} Zb & \lambda Z - A^{T} ZA \end{array} \right) \succeq 0.
$$

How could one use this fact to approximate numerically the smallest volume invariant ellipsoid?

## 3.8.6.4 Greedy infinitesimal ellipsoidal approximations

Consider a linear time-varying controlled system

$$
{\frac{d}{dt}} x(t) = A(t) x(t) + B(t) u(t) + v(t)\tag{3.8.13}
$$

with continuous matrix-valued functions A(t), $B(t)$ , continuous vector-valued function $v(\cdot)$ and norm-bounded control:

$$
\| u(\cdot) \|_{2} \leq 1.\tag{3.8.14}
$$

Assume that the initial state of the system belongs to a given ellipsoid:

$$
x(0) \in E(0) = \{x \mid(x - x^{0})^{T} G^{0}(x - x^{0}) \leq 1\}[G^{0} =[G^{0}]^{T} \succ 0].\tag{3.8.15}
$$

Our goal is to build, in an “on-line” fashion, a system of ellipsoids

$$
E(t) = \{x \mid(x - x_{t})^{T} G_{t}(x - x_{t}) \leq 1\}[G_{t} = G_{t}^{T} \succ 0]\tag{3.8.16}
$$

in such a way that if $u(\cdot)$ is a control satisfying (3.8.14) and $x(0)$ is an initial state satisfying (3.8.15), then for every $t \geq 0$ it holds

$$
x(t) \in E(t).
$$

We are interested to minimize the volumes of the resulting ellipsoids.

There is no dificulty with the path $x_{t}$ of centers of the ellipsoids: it “obviously” should satisfy the requirements

$$
\frac{d}{dt} x_{t} = A(t) x_{t} + v(t), t \geq 0; x_{0} = x^{0}.\tag{3.8.17}
$$

Let us take this choice for granted and focus on how should we define the positive definite matrices $G_{t}$ . Let us look for a continuously diferentiable matrix-valued function $G_{t}$ , taking values in the set of positive definite symmetric matrices, with the following property:

(L) For every $t \geq 0$ and every point $x^{t} \in E(t)$ (see (3.8.16)), every trajectory $x(\tau)$ $\tau \geq t$ , of the system

$$
\frac{d}{d \tau} x(\tau) = A(\tau) x(\tau) + B(\tau) u(\tau) + v(\tau), \quad x(t) = x^{t}
$$

with $\| u(\cdot) \|_{2} \leq 1$ satisfies $x(\tau) \in E(\tau)$ for all $\tau \geq t.$

Note that (L) is a sufficient (but in general not necessary) condition for the system of ellipsoids $E(t), t \geq 0;$ “to cover” all trajectories of $(3.8.13) \textrm{--}(3.8.14)$ . Indeed, when formulating (L), we act as if we were sure that the states $x(t)$ of our system run through the entire ellipsoid $E(t)$ which is not necessarily the case. The advantage of (L) is that this condition can be converted into an “infinitesimal” form:

Exercise 3.43 Prove that if $G_{t} \succ 0$ is continuously diferentiable and satisfies (L), then

$$
\forall \left(t \geq 0, x, u: x^{T} G_{t} x = 1, u^{T} u \leq 1\right): \quad 2u^{T} B^{T}(t) G_{t} x + x^{T}[\frac{d}{dt} G_{t} + A^{T}(t) G_{t} + G_{t} A(t)] x \leq 0.\tag{3.8.18}
$$

Vice versa, $if \G_{t}$ is a continuously diferentiable function taking values in the set of positive definite symmetric matrices and satisfying (3.8.18) and the initial condition $G_{0} = G^{0}$ , then the associated system of ellipsoids $\{E(t)\}$ satisfies (L).

The result of Exercise 3.43 provides us with a kind of description of the families of ellipsoids $\{E(t)\}$ we are interested in. Now let us take care of the volumes of these ellipsoids. The latter can be done via a “greedy” (locally optimal) policy: given $E(t)$ , let us try to minimize, under restriction (3.8.18), the derivative of the volume of the ellipsoid at time t. Note that this locally optimal policy does not necessary yield the smallest volume ellipsoids satisfying (L) (achieving “instant reward” is not always the best way to happiness); nevertheless, this policy makes sense.

We have 2 ln vol(E<sub>t</sub>) = − ln Det(G<sub>t</sub>), whence

$$
2 \frac{d}{dt} \ln \mathrm{vol}(E(t)) = - \mathrm{Tr}(G_{t}^{- 1} \frac{d}{dt} G_{t});
$$

thus, our greedy policy requires to choose $\begin{array}{r}{H_{t} \equiv \frac{d}{dt} G_{t}} \end{array}$ as a solution to the optimization problem

$$
\begin{array}{r} \max_{H = H^{T}} \bigg \{\mathrm{Tr}(G_{t}^{- 1} H): 2u^{T} B^{T}(t) G_{t} x + x^{T}[\frac{d}{dt} G_{t} - A^{T}(t) G_{t} - G_{t} A(t)] x \leq 0 \\ \forall \left(x, u: x^{T} G_{t} x = 1, u^{T} u \leq 1\right) \bigg\}.\end{array}
$$

Exercise 3.44 Prove that the outlined greedy policy results in the solution $G_{t}$ to the diferential equation

$$
\begin{array}{r} \frac{d}{dt} G_{t} = - A^{T}(t) G_{t} - G_{t} A(t) - \sqrt{\frac{n}{\mathrm{Tr}(G_{t} B(t) B^{T}(t))}} G_{t} B(t) B^{T}(t) G_{t} - \sqrt{\frac{\mathrm{Tr}(G_{t} B(t) B^{T}(t))}{n}} G_{t}, t \geq 0; \\ G_{0} = G^{0}.\end{array}
$$

Prove that the solution to this equation is symmetric and positive definite for all $t > 0$ , provided that $G^{0} =[G^{0}]^{T} \succ 0$

Exercise 3.45 Modify the previous reasoning to demonstrate that the “locally optimal” policy for building inner ellipsoidal approximation of the set

$$
\begin{array}{rcl} X(t) & = & \{x(t) \mid \exists x^{0} \in E(0) \equiv \{x \mid(x - x^{0})^{T} G^{0}(x - x^{0}) \leq 1\}, \exists u(\cdot), \| u(\cdot) \|_{2} \leq 1: \\ & & \frac{d}{d \tau} x(\tau) = A(\tau) x(\tau) + B(\tau) u(\tau) + v(\tau), 0 \leq \tau \leq t, x(0) = x^{0}\} \end{array}
$$

results in the family of ellipsoids

$$
\underline{{E}}(t) = \{x \mid(x - x_{t})^{T} W_{t}(x - x_{t}) \leq 1\},
$$

where $x_{t}$ is given by (3.8.17) and $W_{t}$ is the solution of the diferential equation

$$
\frac{d}{dt} W_{t} = - A^{T}(t) W_{t} - W_{t} A(t) - 2W_{t}^{1 / 2}(W_{t}^{1 / 2} B(t) B^{T}(t) W_{t}^{1 / 2})^{1 / 2} W_{t}^{1 / 2}, t \geq 0; W_{0} = G^{0}.
$$

## 3.8.7 Around S-Lemma

The S-Lemma is a kind of the Theorem on Alternative, more specifically, a “quadratic” analog of the Homogeneous Farkas Lemma:

Homogeneous Farkas Lemma: A homogeneous linear inequality $a^{T} x \geq 0$ is a consequence of a system of homogeneous linear inequalities $b_{i}^{T} x \ge 0, i = 1,..., m$ , if and only if it is a “linear consequence” of the system, i.e., if and only if

$$
\exists(\lambda \geq 0): \quad a = \sum_{i} \lambda_{i} b_{i}.
$$

S-Lemma: A homogeneous quadratic inequality $x^{T} Ax \ \geq \0$ is a consequence of a strictly feasible system of homogeneous quadratic inequalities $x^{T} B_{i} x \ge 0, i =$ $1,..., m$ , with $m = 1$ if and only if it is a “linear consequence” of the system and a trivial – identically true – quadratic inequality, i.e., if and only if

$$
\exists(\lambda \geq 0, \Delta \succeq 0): A = \sum_{i} \lambda_{i} B_{i} + \Delta.
$$

We see that the S-Lemma is indeed similar to the Farkas Lemma, up to a (severe!) restriction that now the system in question must contain a single quadratic inequality (and up to the mild “regularity assumption” of strict feasibility).

The Homogeneous Farkas Lemma gives rise to the Theorem on Alternative for systems of linear inequalities; and as a matter of fact, this Lemma is the basis of the entire Convex Analysis and the reason why Convex Programming problems are “easy” (see Lecture 4). The fact that a similar statement for quadratic inequalities – i.e., S-Lemma – fails to be true for a “multi-inequality” system is very unpleasant and finally is the reason for the existence of “simple-looking” computationally intractable (NP-complete) optimization problems.

Given the crucial role of different “Theorems on Alternative” in Optimization, it is vitally important to understand extent to which the “linear” Theorem on Alternative can be generalized onto the case of non-linear inequalities. The “standard” generalization of this type is as follows:

The Lagrange Duality Theorem (LDT): Let $f_{0}$ be a convex, and $f_{1},..., f_{m}$ be concave functions on $\overline{{\mathbb{R}^{m}}}$ such that the system of inequalities

$$
f_{i}(x) \geq 0, i = 1, \dots, m\tag{S}
$$

is strictly feasible $(i.\mathrm{e., ~} f_{i}(\bar{x}) > 0$ for some x¯ and all $i = 1,..., m)$ . The inequality

$$
f_{0}(x) \geq 0
$$

is a consequence of the system (S) if and only if it can be obtained, in a linear fashion, from (S) and a “trivially” true – valid on the entire $\mathbb{R}^{n}$ – inequality, i.e., if and only if there exist m nonnegative weights $\lambda_{i}$ such that

$$
f_{0}(x) \geq \sum_{i = 1}^{m} \lambda_{i} f_{i}(x) \quad \forall x.
$$

The Lagrange Duality Theorem plays the central role in “computationally tractable Optimization”, i.e., in Convex Programming (for example, the “plain” (not refined!) Conic Duality Theorem from Lecture 1 is just a reformulation of the LDT). This theorem, however, imposes severe convexity-concavity restrictions on the inequalities in question. $\mathrm{E.g.}$ , in the case when all the inequalities are homogeneous quadratic, LDT is “empty”. Indeed, a homogeneous quadratic function $x^{T} Bx$ is concave if and only if $B \preceq 0$ , and is convex if and only if $B \succeq 0$ . It follows that in the case of $f_{i} = x^{T} A_{i} x, i = 0,..., m$ , the premise in the LDT is “empty” (a system of homogeneous quadratic inequalities $x^{T} A_{i} x \geq 0$ with $A_{i} \preceq 0, i = 1,..., m$ , simply cannot be strictly feasible), and the conclusion in the LDT is trivial (if $f_{0}(x) = x^{T} A_{0} x$ with $A_{0} \succeq 0$ , then $f_{0}(x) \geq \sum_{i = 1}^{m} 0 \times f_{i}(x)$ , whatever are $f_{i} \mathrm{^{5} s)}$ Comparing the S-Lemma to the LDT, we see that the former statement is, in a sense, “complementary” to the second one: the S-Lemma, when applicable, provides us with information which definitely cannot be extracted from the LDT. Given this “unique role” of the S-Lemma, it surely deserves the efort to understand what are possibilities and limitations of extending the Lemma to the case of “multi-inequality system”, i.e., to address the question as follows:

(SL.?) We are given a homogeneous quadratic inequality

$$
x^{T} Ax \geq 0\tag{I}
$$

along with a strictly feasible system of homogeneous quadratic inequalities

$$
x^{T} B_{i} x \geq 0, \quad i = 1, \dots, m.\tag{S}
$$

Consider the following two statements:

(i) (I) is a consequence of (S), i.e., (I) is satisfied at every solution of (S).

(ii) (I) is a “linear consequence” of (S) and a trivial – identically true – homogeneous quadratic inequality:

$$
\exists(\lambda \geq 0, \Delta \succeq 0): \quad A = \sum_{i = 1}^{m} \lambda_{i} B_{i} + \Delta.
$$

What is the $\mathrm{\Delta}^{66} g ap^{\prime \prime}$ between (i) and $(\mathrm{ii}) ?$

One obvious fact is expressed in the following

Exercise 3.46 [“Inverse” S-Lemma] Prove the implication $(\mathrm{ii}){\Rightarrow}(i)$

In what follows, we focus on less trivial results concerning the aforementioned “gap”.

## 3.8.7.1 A straightforward proof of the standard S-Lemma

The goal of the subsequent exercises is to work out a straightforward proof of the S-Lemma instead of the “tricky”, although elegant, proof presented in Lecture 3. The $ { \mathbf { \hat { \theta } } } _ { 1 }  { \mathbf { f } } ^ { \prime } { } ^ { \prime }$ part of the Lemma is evident, and we focus on the “only if” part. Thus, we are given two quadratic forms $x^{T} Ax$ and $x^{T} Bx$ with symmetric matrices A, B such that $\bar{x}^{T} A \bar{x} > 0$ for some ¯x and the implication

$$
x^{T} Ax \geq 0 \Rightarrow x^{T} Bx \geq 0\tag{\( \Rightarrow \)}
$$

is true. Our goal is to prove that

(SL.A) There exists $\lambda \geq 0$ such that $B \succeq \lambda A$

The main tool we need is the following

Theorem 3.8.2 [General Helley Theorem] Let $\{A_{\alpha}\}_{\alpha \in I}$ be a family of closed convex sets in $\mathbb{R}^{n}$ such that

1. Every $n + 1$ sets from the family have a point in common;

2. There is a finite sub-family of the family such that the intersection of the sets from the sub-family is bounded.

Then all sets from the family have a point in common.

Exercise 3.47 Prove the General Helley Theorem.

Exercise 3.48 Show that (SL.A) is a corollary of the following statement:

(SL.B) Let $x^{T} Ax, x^{T} Bx$ be two quadratic forms such that $\bar{x}^{T} A \bar{x} > 0$ for certain x¯ and

$$
x^{T} Ax \geq 0, x \neq 0 \Rightarrow x^{T} Bx > 0\tag{\((\Rightarrow^{\prime})\}
$$

Then there exists $\lambda \geq 0$ such that $B \succeq \lambda A$

Exercise 3.49 Given data A, B satisfying the premise of (SL.B), define the sets

$$
Q_{x} = \{\lambda \geq 0: x^{T} Bx \geq \lambda x^{T} Ax\}.
$$

1) Prove that every one of the sets $Q_{x}$ is a closed nonempty convex subset of the real line;

2) Prove that at least one of the sets $Q_{x}$ is bounded;

3) Prove that every two sets $Q_{x^{\prime}}, Q_{x^{\prime \prime}}$ have a point in common.

4) Derive (SL.B) from 1) – 3), thus concluding the proof of the S-Lemma.

## 3.8.7.2 S-Lemma with a multi-inequality premise

The goal of the subsequent exercises is to present a number of cases when, under appropriate additional assumptions on the data (I), (S), of the question (SL.?), statements (i) and (ii) are equivalent, even if the number m of homogeneous quadratic inequalities in (S) is > 1.

Our first exercise demonstrates that certain additional assumptions are definitely necessary.

Exercise 3.50 Demonstrate by example that if $x^{T} Ax, x^{T} Bx, x^{T}$ Cx are three quadratic forms with symmetric matrices such that

$$
\begin{array}{c} \exists \bar{x}: \bar{x}^{T} A \bar{x} > 0, \bar{x}^{T} B \bar{x} > 0 \\ x^{T} Ax \geq 0, x^{T} Bx \geq 0 \Rightarrow x^{T} Cx \geq 0, \end{array}\tag{3.8.19}
$$

then not necessarily there exist $\lambda, \mu \geq 0$ such that $C \succeq \lambda A + \mu B$

Hint: Clearly there do not exist nonnegative $\lambda, \mu$ such that $C \succeq \lambda A + \mu B$ when

$$
\operatorname{Tr}(A) \geq 0, \quad \operatorname{Tr}(B) \geq 0, \quad \operatorname{Tr}(C) < 0.\tag{3.8.20}
$$

Thus, to build the required example it sufices to find $A, B, C$ satisfying both (3.8.19) and (3.8.20).

$$
2 \times 2
$$

$$
A, B, C
$$

$$
f_{A}(x) = x^{T} Ax, f_{B}(x) = x^{T} Bx, f_{C}(x) = x^{T} Cx
$$

- The set $X_{A} = \{x \mid f_{A}(x) \geq 0\}$ is the union of an angle D symmetric w.r.t. the $x_{\mathrm{1}} \mathrm{- axis}$ and the angle −D: $f_{A}(x) = \lambda^{2} x_{1}^{2} - x_{2}^{2}$ with $\lambda > 0$

- The set $X_{B} = \{x \mid f_{B}(x) \geq 0\}$ looks like a clockwise rotation of $X_{A}$ by a small angle: $f_{B}(x) =(\mu x - y)(\nu x + y)$ with $0 < \mu < \lambda$ and $\nu > \lambda;$

- The set $X_{C} = \{x \mid x^{T} Cx \geq 0\}$ is the intersection of $X_{A}$ and $X_{B} \colon f_{C}(x) =(\mu x - y)(\nu x + y)$

Surprisingly, there exists a “semi-extension” of the S-Lemma to the case of $m = 2$ in (SL.?):

(SL.C) Let $n \geq 3$ , and let $A, B, C$ be three symmetric $n \times n$ matrices such that

(i) certain linear combination of the matrices A, B, C is positive definite,

(ii) the system of inequalities

$$
\left\{\begin{array}{l} x^{T} Ax \geq 0 \\ x^{T} Bx \geq 0 \end{array} \right.\tag{3.8.21}
$$

is strictly feasible, $i.e., \exists \bar{x} \colon \bar{x}^{T} A \bar{x} > 0, \bar{x}^{T} B \bar{x} > 0.$

Then the inequality

$$
x^{T} Cx \geq 0
$$

is a consequence of the system (3.8.21) if and only if there exist nonnegative $\lambda, \mu$ such that

$$
C \succeq \lambda A + \mu B.
$$

The proof of (SL.C) uses a nice convexity result which is interesting by its own right:

(SL.D) [B. Polyak] Let $n \geq 3$ , and let $f_{i}(x) = x^{T} A_{i} x, i = 1, 2, 3$ , be three homogeneous quadratic forms on $\mathbb{R}^{n}$ (here $A_{i}, i = 1, 2, 3$ , are symmetric $n \times n$ matrices). Assume that certain linear combination of the matrices $A_{i}$ is positive definite. Then the image of $\mathbb{R}^{n}$ under the mapping $F(x) ={\binom{f_{1}(x)}{f_{2}(x)}}$ is a closed convex set.

Exercise 3.51 Derive (SL.C) from (SL.D).

Hint for the only nontrivial “only $\mathrm{if}^{\dag}$ part of (SL.C): By (SL.C.i) and (SL.D), the set

$$
Y = \{y \in \mathbb{R}^{3} \mid \exists x: y = \left(\begin{array}{c} x^{T} Ax \\ x^{T} Bx \\ x^{T} Cx \end{array} \right)\}
$$

is a closed and convex set in $\mathbb{R}^{3}$ . Prove that if $x^{T} Bx \geq 0$ for every solution of (3.8.21), then Y does not intersect the convex set $Z = \{(y =(y_{1}, y_{2}, y_{3})^{T} | y_{1}, y_{2} \geq 0, y_{3} < 0\}$ Applying the Separation Theorem, conclude that there exist nonnegative weights $\theta, \lambda, \mu,$ not all of them zero, such that the matrix $\theta C - \lambda A - \mu B$ is positive definite. Use (SL.C.ii) to demonstrate that $\theta > 0$

Now let us prove (SL.D). We start with a number of simple topological facts. Recall that a metric space X is called connected, if there does not exist a pair of nonempty open sets $V, U \subset X$ such that $U \cap V = \emptyset$ and $U \cup V = X$ . The simplest facts about connectivity are as follows:

(C.1) If a metric space Y is linearly connected: for every two points $x, y \in Y$ there exists a continuous curve linking x and y, i.e., a continuous function $\gamma :[0, 1] \to Y$ such that $\gamma(0) = x{\mathrm{~ and ~}} \gamma(1) = y,$ , then Y is connected. In particular, a line segment in $\mathbb{R}^{k}$ , same as every other convex subset of $\mathbb{R}^{k}$ is connected (from now on, a set $Y \subset \mathbb{R}^{k}$ is treated as a metric space, the metric coming from the standard metric on $\mathbb{R}^{k})$

(C.2) Let $F : YZ$ be a continuous mapping from a connected metric space to a metric space Z. Then the image $F(Y)$ of the mapping (regarded as a metric space, the metric coming from $Z)$ is connected.

We see that the connectivity of a set $Y \in \mathbb{R}^{n}$ is a much weaker property than the convexity. There is, however, a simple case where these properties are equivalent: the one-dimensional case $k = 1 \colon$

Exercise 3.52 Prove that a set $Y \subset \mathbb{R}$ is connected if and only if it is convex.

To proceed, recall the notion of the n-dimensional projective space $\mathbb{P}^{n}$ . A point in this space is a line in $\mathbb{R}^{n + 1}$ passing through the origin. In order to define the distance between two points of this $\mathrm{type, i.e.}$ , between two lines $\ell, \ell^{\prime}$ in $\mathbb{R}^{n + 1}$ passing through the origin, we take the intersections of the lines with the unit Euclidean sphere in $\mathbb{R}^{n + 1}$ ; let the first intersection be comprised of the points ±e, and the second – of the points $\pm e^{\prime}$ . The distance between \` and $\ell^{\prime}$ is, by definition, min $\{\| e + e^{\prime} \|_{2}, \| e - e^{\prime} \|_{2}\}$ (it is clear that the resulting quantity is well-defined and that it is a metric). Note that there exists a natural mapping Φ (“the canonical projection”) of the unit sphere $S^{n} \subset \mathbb{R}^{n + 1}$ onto $\mathbb{P}^{n} -$ the mapping which maps a unit vector $e \in S^{n}$ onto the line spanned by e. It is immediately seen that this mapping is continuous and maps points ±e, $e \in S^{n}$ , onto the same point of $\mathbb{P}^{n}$ . In what follows we will make use of the following simple facts:

Proposition 3.8.1 Let $Y \subset S^{n}$ be a set with the following property: for every two points $x, x^{\prime} \in Y$ there exists a point $y \in Y$ such that both $x, x^{\prime}$ can be linked by continuous curves in $Y$ with the set $\{y; - y\} \(i.e.$ , we can link in $Y ~(1)$ both x and $x^{\prime}$ with $y,$ or (2) x with y, and $x^{\prime}$ with −y, or (3) both x and $x^{\prime} \with \ - y, \or \(4) \x \with \ - y$ , and $x^{\prime}$ with y). Then the set $\Phi(Y) \subset \mathbb{P}^{n}$ is linearly connected (and thus – connected).

Proposition 3.8.2 Let $F : Y \to \mathbb{R}^{k}$ be a continuous mapping defined on a central-symmetric subset $(Y = - Y)$ of the unit sphere $S^{n} \subset \mathbb{R}^{n + 1}$ , and let the mapping be even: $F(y) = F(- y)$ for every $y \in Y$ . Let $Z = \Phi(Y)$ be the image of Y in $\mathbb{P}^{n}$ under the canonical projection, and let the mapping $G : Z \to \mathbb{R}^{k}$ be defined as follows: in order to specify $G(z)$ for $z \in Z$ , we choose somehow a point $y \in Y$ such that $\Phi(y) = z$ and set $G(z) = F(y)$ . Then the mapping G is well-defined and continuous on $Z$

Exercise 3.53 Prove Proposition 3.8.1.

Exercise 3.54 Prove Proposition 3.8.2.

The key argument in the proof of (SL.D) is the following fact:

Proposition 3.8.3 Let $f(x) = x^{T} Qx$ be a homogeneous quadratic form on $\mathbb{R}^{n}, n \geq 3$ . Assume that the set $Y = \{x \in S^{n - 1} : f(x) = 0\}$ is nonempty. Then the set $Y$ is central-symmetric, and its image $Z$ under the canonical projection $\Phi : S^{n - 1} \to \mathbb{P}^{n - 1}$ is connected.

The goal of the next exercise is to prove Proposition 3.8.3. In what follows $f, Y, Z$ are as in the Proposition. The relation $Y = - Y$ is evident, so that all we need to prove is the connectedness of $Z.$ . W.l.o.g. we may assume that

$$
f(x) = \sum_{i = 1}^{n} \lambda_{i} x_{i}^{2}, \lambda_{1} \geq \lambda_{2} \geq \dots \geq \lambda_{n};
$$

since $Y$ is nonempty, we have $\lambda_{1} \geq 0, \lambda_{n} \leq 0$ . Replacing, if necessary, f with $- f$ (which does not vary $Y)$ , we may further assume that $\lambda_{1} \geq | \lambda_{n} |$ . The case $\lambda_{1} = \lambda_{n} = 0$ is trivial, since in this case $f \equiv 0$ , whence $Y = S^{n - 1}$ ; thus, Y (and therefore – Z, see $\left(\mathrm{C.2} \right))$ is connected. Thus, we may assume that $\lambda_{1} \geq | \lambda_{n} |$ and $\lambda_{1} > 0 \geq \lambda_{n}$ . Finally, it is convenient to set $\theta_{1} = \lambda_{1}, \theta_{2} = - \lambda_{n};$ reordering the coordinates of $x,$ we come to the situation as follows:

$$
\begin{array}{ll}(a) & f(x) = \theta_{1} x_{1}^{2} - \theta_{2} x_{2}^{2} + \sum_{i = 3}^{n} \theta_{i} x_{i}^{2}, \\(b) & \theta_{1} \geq \theta_{2} \geq 0, \theta_{1} + \theta_{2} > 0; \\(c) & - \theta_{2} \leq \theta_{i} \leq \theta_{1}, i = 3,..., n.\end{array}\tag{3.8.22}
$$

Exercise 3.55 1) Let $x \in Y$ . Prove that x can be linked in Y by a continuous curve with a point $x^{\prime}$ such that the coordinates of $x^{\prime}$ with indices $3, 4,..., n$ vanish.

Hint: Setting $d =(0, 0, x_{3},..., x_{n})^{T}$ , prove that there exists a continuous curve $\mu(t), 0 \leq t \leq 1$ in $Y$ such that

$$
\mu(t) = \left(x_{1}(t), x_{2}(t), 0, 0, \dots, 0\right)^{T} +(1 - t) d, 0 \leq t \leq 1,
$$

and $x_{1}(0) = x_{1}, x_{2}(0) = x_{2}$

2) Prove that there exists a point $z^{+} =(z_{1}, z_{2}, z_{3}, 0, 0,..., 0)^{T} \in Y$ such that

(i) $z_{1} z_{2} = 0,$

(ii) given a point $u =(u_{1}, u_{2}, 0, 0,..., 0)^{T} \in Y$ , you can either (ii.1) link u by continuous curves in Y both to $z^{+}$ and to $\bar{z}^{+} =(z_{1}, z_{2}, - z_{3}, 0, 0,..., 0)^{T} \in Y$ , or (ii.2) link u both to $z^{-} =$ $(- z_{1}, - z_{2}, z_{3}, 0, 0,..., 0)^{T}$ and $\bar{z}^{-} =(- z_{1}, - z_{2}, - z_{3}, 0, 0,..., 0)^{T}$ (note that $\ : z^{+} = - \bar{z}^{-}, \bar{z}^{+} = - z^{-}) \ :$

Hint: Given a point $u \in Y, u_{3} = u_{4} =...= u_{n} = 0$ , build a continuous curve $\mu(t) \in Y$ of the type

$$
\mu(t) = \left(x_{1}(t), x_{2}(t), t, 0, 0, \dots, 0\right)^{T} \in Y
$$

such that $\mu(0) = u$ and look what can be linked with u by such a curve.

3) Conclude from 1-2) that $Y$ satisfies the premise of Proposition 3.8.1 and thus complete the proof of Proposition 3.8.3.

## 3.8. EXERCISES FOR LECTURE 3

Now we are ready to prove (SL.D).

Exercise 3.56 Let $A_{i}, i = 1, 2, 3$ , satisfy the premise of $\mathbf{\left(SL.D \right)}$

1) Demonstrate that in order to prove (SL.D), it sufices to prove the statement in the particular case $A_{1} = I$

Hint: The validity status of the conclusion in (SL.D) remains the same when we replace our initial quadratic forms $f_{i}(x), i = 1, 2, 3$ , by the forms $g_{i}(x) = \sum_{j = 1}^{3} c_{ij} f_{j}(x), i = 1, 2, 3,$ , provided that the matrix $\left[c_{ij} \right]$ is nonsingular. Taking into account the premise in (SL.D), we can choose such a transformation to get, as g<sub>1</sub>, a positive definite quadratic form. W.l.o.g. we may therefore assume from the very beginning that $A_{1} \ \succ \0.$ . Now, passing from the quadratic forms given by the matrices $A_{1}, A_{2}, A_{3}$ to those given by the matrices $I, A_{1}^{- 1 / 2} \dot{A_{2}} \dot{A_{1}}^{- 1 / 2}, A_{1}^{- 1 / 2} \dot{A_{3}} \dot{A_{1}}^{- 1 / 2}$ , we do not vary the set H at all. Thus, we can restrict ourselves with the case $A_{1} = I$

2) Assuming $A_{1} = I$ , prove that the set

$$
H_{1} = \left\{\left(v_{1}, v_{2}\right)^{T} \in \mathbb{R}^{2} \mid \exists x \in \mathbf{S}^{n - 1}: v_{1} = f_{2}(x), v_{3} = f_{3}(x) \right\}
$$

is convex.

Hint: Prove that the intersection of $H_{1}$ with every line $\ell \subset \mathbb{R}^{2}$ is the image of a connected set in $\mathbb{P}^{n - 1}$ under a continuous mapping and is therefore connected by (C.2). Then apply the result of Exercise 3.52.

3) Assuming $A_{1} = I$ , let $\widetilde{H}_{1} = \{(1, v_{1}, v_{2})^{T} \in \mathbb{R}^{3} \ | \(v_{1}, v_{2})^{T} \in H_{1}\}$ , and let $H = F(\mathbb{R}^{n})$ $F(x) =(f_{1}(x), f_{2}(x), f_{3}(x))^{T}$ . Prove that H is the closed convex hull of $\widetilde{H}_{1}$

$$
H = \operatorname{cl} \left\{y \mid \exists t > 0, u \in \widetilde{H}_{1}: y = tu \right\}.
$$

Use this fact and the result $of2)$ to prove that H is closed and convex, thus completing the proof of (SL.D).

Note that the restriction $n \geq 3$ in (SL.D) and (SL.C) is essential:

Exercise 3.57 Demonstrate by example that (SL.C) not necessarily remains valid when skipping the assumption $^{66} n \geq 3^{\prime 9}$ in the premise.

Hint: An example can be obtained via the construction outlined in the Hint to Exercise 3.50.

In order to extend (SL.C) to the case of $2 \times 2$ matrices, it sufices to strengthen a bit the premise:

(SL.E) Let $A, B, C$ be three $2 \times 2$ symmetric matrices such that

(i) certain linear combination of the matrices A, B is positive definite,

(ii) the system of inequalities (3.8.21) is strictly feasible.

Then the inequality

$$
x^{T} Cx \geq 0
$$

is a consequence of the system (3.8.21) if and only if there exist nonnegative $\lambda, \mu$ such that

$$
C \succeq \lambda A + \mu B.
$$

Exercise 3.58 Let $A, B, C$ be three $2 \times 2$ symmetric matrices such that the system of inequalities $x^{T} Ax \ge 0, x^{T} Bx \ge 0$ is strictly feasible and the inequality $x^{T}$ Cx is a consequence of the system. 1) Assume that there exists a nonsingular matrix Q such that both the matrices $QAQ^{T}$ and $QBQ^{T}$ are diagonal. Prove that then there exist $\lambda, \mu \geq 0$ such that $C \succeq \lambda A + \mu B$

2) Prove that if a linear combination of two symmetric matrices A, B (not necessarily $2 \times 2$ ones) is positive definite, then there exists a system of (not necessarily orthogonal) coordinates where both quadratic forms $x^{T} Ax, x^{T}$ Bx are diagonal, or, equivalently, that there exists a nonsingular matrix Q such that both $QAQ^{T}$ and $QBQ^{T}$ are diagonal matrices. Combine this fact with 1) to prove (SL.E).

We have seen that the “2-inequality-premise” version of the S-Lemma is valid (under an additional mild assumption that a linear combination of the three matrices in question is positive definite). In contrast, the “3-inequality-premise” version of the Lemma is hopeless:

Exercise 3.59 Consider four matrices

$$
\begin{array}{c} A_{1} = \left(\begin{array}{ccc} 2 + \epsilon & & \\ & - 1 & \\ & & - 1 \end{array} \right), A_{2} = \left(\begin{array}{ccc} - 1 & & \\ & 2 + \epsilon & \\ & & - 1 \end{array} \right), A_{3} = \left(\begin{array}{ccc} - 1 & & \\ & - 1 & \\ & & 2 + \epsilon \end{array} \right), \\ B = \left(\begin{array}{ccc} 1 & 1.1 & 1.1 \\ 1.1 & 1 & 1.1 \\ 1.1 & 1.1 & 1 \end{array} \right).\end{array}
$$

1) Prove that $if \epsilon > 0$ is small enough, then the matrices satisfy the conditions

(a)

$$
\begin{array}{c} \forall(x, x^{T} A_{i} x \geq 0, i = 1, 2, 3): x^{T} Bx \geq 0, \\ \exists \bar{x}: \quad \bar{x}^{T} A_{i} \bar{x} > 0.\end{array}\tag{b}
$$

2) Prove that whenever $\epsilon \geq 0$ , there do not exist nonnegative $\lambda_{i}, ~ i ~ = ~ 1, 2, 3$ , such that $B \succeq \sum_{i = 1}^{3} \lambda_{i} A_{i}$

Thus, an attempt to extend the S-Lemma to the case of three quadratic inequalities in the premise fails already when the matrices of these three quadratic forms are diagonal.

Hint: Note that if there exists a collection of nonnegative weights $\lambda_{i} \ge 0, i = 1, 2, 3$ , such that $B \succeq \sum_{i = 1}^{3} \lambda_{i} A_{i}$ , then the same property is shared by any collection of weights obtained from the original one by a permutation. Conclude that under the above $ { \mathrm { ^ 6 _ { 1 } f ^ { 9 } } }$ one should have $B \succeq \theta \sum_{i = 1}^{3} A_{i}$ with some $\theta \ge 0$ , which in fact is not the case.

Exercise 3.59 demonstrates that when considering (SL.?) for $m = 3$ , even the assumption that all quadratic forms in (S) are diagonal not necessarily implies an equivalence between (i) and (ii). Note that under a stronger assumption that all quadratic forms in question are diagonal, (i) is equivalent to (ii) for all m:

Exercise 3.60 Let $A, B_{1},..., B_{m}$ be diagonal matrices. Prove that the inequality

$$
x^{T} Ax \geq 0
$$

is a consequence of the system of inequalities

$$
x^{T} B_{i} x \geq 0, i = 1, \dots, m
$$

if and only if it is a linear consequence of the system and an identically true quadratic inequality, i.e., if and only $if$

$$
\exists(\lambda \geq 0, \Delta \succeq 0): \quad A = \sum_{i} \lambda_{i} B_{i} + \Delta.
$$

Hint: Pass to new variables $y_{i} = x_{i}^{2}$ and apply the Homogeneous Farkas Lemma.

## 3.8.7.3 Relaxed versions of S-Lemma

In Exercises 3.51 – 3.60 we were interested to understand under which additional assumptions on the data of (SL.?) we can be sure that (i) is equivalent to (ii). In the exercises to follow, we are interested to understand what could be the $\mathrm{\Delta^{66} gap^{9}}$ between (i) and (ii) “in general”. An example of such a $\mathrm{\Delta^{66} gap^{9}}$ statement is as follows:

(SL.F) Consider the situation of (SL.?) and assume that (i) holds. Then (ii) is valid on a subspace of codimension $\leq m - 1$ , i.e., there exist nonnegative weights $\lambda_{i}$ such that the symmetric matrix

$$
\Delta = A - \sum_{i = 1}^{m} \lambda_{i} B_{i}
$$

has at most $m - 1$ negative eigenvalues (counted with their multiplicities).

Note that in the case $m = 1$ this statement becomes exactly the S-Lemma.

The idea of the proof of (SL.F) is very simple. To say that (I) is a consequence of (S) is basically the same as to say that the optimal value in the optimization problem

$$
\min_{x} \left\{f_{0}(x) \equiv x^{T} Ax: f_{i}(x) \equiv x^{T} B_{i} x \geq \epsilon, i = 1, \dots, m \right\}\tag{\((P_{\epsilon})\}
$$

is positive, whenever $\epsilon > 0$ . Assume that the problem is solvable with an optimal solution $x_{\epsilon}$ and let $I_{\epsilon} = \{i \ge 1 | f_{i}(x_{\epsilon}) = \epsilon\}$ . Assume, in addition, that the gradients $\{\nabla f_{i}(x_{\epsilon}) \mid i \in I_{\epsilon}\}$ are linearly independent. Then the second-order necessary optimality conditions are satisfied at $x_{\epsilon}, \mathrm{i.e.}$ , there exist nonnegative Lagrange multipliers $\lambda_{i}^{\epsilon}, i \in I_{\epsilon}$ , such that for the function

$$
L_{\epsilon}(x) = f_{0}(x) - \sum_{i \in I_{\epsilon}} \lambda_{i}^{\epsilon} f_{i}(x)
$$

one has:

$$
\begin{array}{c} \nabla L_{\epsilon}(x_{\epsilon}) = 0, \\ \forall(d \in E = \{d: d^{T} \nabla f_{i}(x_{\epsilon}) = 0, i \in I_{\epsilon}\}): \quad d^{T} \nabla^{2} L_{\epsilon}(x_{\epsilon}) d \geq 0.\end{array}
$$

In other words, setting $D = A - \sum_{i \in I_{\epsilon}} \lambda_{i}^{\epsilon} B_{i}$ , we have

$$
Dx_{\epsilon} = 0; \quad d^{T} Dd \geq 0 \quad \forall d \in E.
$$

We conclude that $d^{T} Dd \geq 0$ for all $d \in E^{+} = E + \mathbb{R} x_{\epsilon}$ , and it is easily seen that the codimension of $E^{+}$ is at most $m - 1$ . Consequently, the number of negative eigenvalues of $D,$ , counted with their multiplicities, is at most $m - 1$

The outlined “proof” is, of course, incomplete: we should justify all the assumptions made along the way. This indeed can be done (and the “driving force” of the justification is the Sard Theorem: if $f : \mathbb{R}^{n} \mathbb{R}^{k}, n \geq k.$ , is a $\mathrm{C}^{\infty}$ mapping, then the image under $f$ of the set of points x where the rank of $f^{\prime}(x)$ is $< k,$ is of the k-dimensional Lebesgue measure 0).

We should confess that we do not know any useful applications of (SL.F), which is not the case for other “relaxations” of the S-Lemma we are about to consider. All these relaxations have to do with “inhomogeneous” versions of the Lemma, like the one which follows:

(SL.??) Consider a system of quadratic inequalities of the form

$$
x^{T} B_{i} x \leq d_{i}, i = 1, \dots, m,\tag{S'}
$$

where all $d_{i}$ are $\geq 0$ , and a homogeneous quadratic form

$$
f(x) = x^{T} Ax;
$$

we are interested to evaluate the maximum $f^{*}$ of the latter form on the solution set of $\mathrm{(S^{\prime})}$

The standard semidefinite relaxation of the optimization problem

$$
\max_{x} \left\{f(x): x^{T} B_{i} x \leq d_{i} \right\}\tag{P}
$$

is the problem

$$
\max_{X} \left\{F(X) \equiv \operatorname{Tr}(AX): \operatorname{Tr}(B_{i} X) \leq d_{i}, i = 1, \dots, m, X = X^{T} \succeq 0 \right\},\tag{SDP}
$$

and the optimal value $F^{*}$ in this problem is an upper bound on $f^{\ast} \ \mathrm{(why ?)}$ . How large can the diference $F^{*} - f^{*}$ be?

The relation between (SL.??) and (SL.?) is as follows. Assume that the only solution to the system of inequalities

$$
x^{T} B_{i} x \leq 0, i = 1, \dots, m
$$

is $x = 0$ . Then (P) is equivalent to the optimization problem

$$
\min_{\theta, x} \left\{\theta : x^{T} Ax \leq \theta t^{2}, x^{T} B_{i} x \leq d_{i} t^{2}, i = 1, \dots, m \right\}\tag{P'}
$$

in the sense that both problems have the same optimal value $f^{\ast} \ \mathrm{(why ?)}$ . In other words,

(J) $f^{*}$ is the smallest value of a parameter θ such that the homogeneous quadratic inequality

$$
\left[\begin{array}{c} x \\ t \end{array} \right]^{T} \widehat{A}_{\theta} \underbrace{\left[\begin{array}{c} x \\ t \end{array} \right]}_{z} \geq 0, \quad \widehat{A}_{\theta} = \left(\begin{array}{cc} - A & \\ & \theta \end{array} \right)\tag{C}
$$

is a consequence of the system of homogeneous quadratic inequalities

$$
z^{T} \widehat{B}_{i} z \geq 0, i = 1,..., m, \quad \widehat{B}_{i} = \left(\begin{array}{cc} - B_{i} & \\ & d_{i} \end{array} \right)\tag{H}
$$

Now let us assume that (P) is strictly feasible, so that (SDP) is also strictly feasible $\mathrm{(why ?)}$ and that (SDP) is bounded above. By the Conic Duality Theorem, the semidefinite dual of (SDP)

$$
\min_{\lambda} \left\{\sum_{i = 1}^{m} \lambda_{i} d_{i}: \sum_{i = 1}^{m} \lambda_{i} B_{i} \succeq A, \lambda \geq 0 \right\}\tag{SDD}
$$

is solvable and has the same optimal value $F^{*}$ as (SDP). On the other hand, it is immediately seen that the optimal value in (SDD) is the smallest θ such that there exist nonnegative weights $\lambda_{i}$ satisfying the relation

$$
\widehat{A}_{\theta} \succeq \sum_{i = 1}^{m} \lambda_{i} \widehat{B}_{i}.
$$

Thus,

(K) $F^{*}$ is the smallest value of θ such that $\widehat{A}_{\theta} \is \succeq a$ combination, with nonnegative weights, of ${\widehat{B}}_{i} \{\boldsymbol{s}}, \{\mathrm{or}}.$ , which is the same, $F^{*}$ is the smallest value of the parameter θ for which (C) is a “linear consequence” of (H).

Comparing (J) and (K), we see that our question (SL.??) is closely related to the question what is the $\mathrm{\Delta^{66} gap^{9}}$ between (i) and (ii) in (SL.?): in (SL.??), we are considering a parameterized family $z^{T}{\widehat{A}}_{\theta} z \geq 0$ of quadratic inequalities and ask ourselves what is the gap between

(a) the smallest value $f^{*}$ of the parameter θ for which the inequality $z^{T} \widehat{A}_{\theta} z \geq 0$ is a consequence of the system (H) of homogeneous quadratic inequalities,

and

(b) the smallest value $F^{*}$ of θ for which the inequality $z^{T}{\widehat{A}}_{\theta} z \geq 0$ is a linear consequence of (H).

The goal of the subsequent exercises is to establish the following result related to (SL.??):

Proposition 3.8.4 [Nesterov;Ye] Consider (SL.??), and assume that

1. The matrices $B_{1},..., B_{m}$ commute with each other;

2. System (S<sup>0</sup>) is strictly feasible, and there exists a combination of the matrices $B_{i}$ with nonnegative coeficients which is positive definite;

3. $A \succeq 0.$

Then $f^{*} \geq 0$ , (SDD) is solvable with the optimal value $F^{*}$ , and

$$
F^{*} \leq \frac{\pi}{2} f^{*}.\tag{3.8.23}
$$

Exercise 3.61 Derive Proposition 3.8.4 from the result of Exercise 3.33.

Hint: Observe that since $B_{i}$ are commuting symmetric matrices, they share a common or thogonal eigenbasis, so that w.l.o.g. we can assume that all $B_{i}^{\phantom{\dagger}}$ ’s are diagonal.

## 3.8.8 Around Chance constraints

Exercise 3.62 Here you will learn how to verify claims like “distinguishing, with reliability 0.99, between distributions A and B takes at least so much observations.”

1. Problem’s setting. Let P and Q be two probability distributions on the same space Ω with densities $p(\cdot), q(\cdot)$ with respect to some measure $\mu.$

Those with limited experience in measure theory will lose nothing by assuming whenever possible that Ω is the finite set $\{1,..., N\}$ and $\mu$ is the “counting measure” (the µ-mass of every point from Ω is 1). In this case, the density of a probability distribution P on Ω is just the function $p(\cdot)$ on the N-point set Ω (i.e., N-dimensional vector) with $p(i) = \operatorname{Prob}_{\omega \sim P} \{\omega = i\}$ (that is, $p(i)$ is the probability mass which is assigned by P to a point $i \in \Omega)$ . In this case (in the sequel, we refer to it as to the discrete one), the density of a probability distribution on Ω is just a probabilistic vector from $\mathbb{R}^{N} - a$ nonnegative vector with entries summing up to 1.

Given an observation $\omega \in \Omega$ drawn at random from one (we do not know in advance from which one) of the distributions $P, Q$ , we want to decide what is the underlying distribution; this is called distinguishing between two simple hypotheses<sup>29</sup>. A (deterministic) decision rule clearly should be as follows: we specify a subset $\Omega_{P} \subset \Omega$ and accept the hypothesis $H_{P}$ that the distribution from which $\omega$ is drawn is $P$ if and only if $\omega \in \Omega_{P};$ otherwise we accept the alternative hypothesis $H_{Q}$ saying that the “actual” distribution is $Q.$

$\mathrm{A}$ decision rule for distinguishing between the hypotheses can be characterized by two error probabilities: $\epsilon_{P}$ (to accept $H_{Q}$ when $H_{P}$ is true) and $\epsilon_{Q}$ (to accept $H_{P}$ when $H_{Q}$ is true). We clearly have

$$
\epsilon_{P} = \int_{\omega \not \in \Omega_{P}} p(\omega) d \mu(\omega), \epsilon_{Q} = \int_{\omega \in \Omega_{P}} q(\omega) d \mu(\omega)
$$

Task $\underline{{1}} \mathrm{: Prove^{30}}$ that for every decision rule it holds

$$
\epsilon_{P} + \epsilon_{Q} \geq \int_{\Omega} \min[p(\omega), q(\omega)] d \mu(\omega).
$$

Prove that this lower bound is achieved for the maximum likelihood test, where $\Omega_{P} = \{\omega :$ $p(\omega) \geq q(\omega)\}$

Follow-up: Essentially, the only multidimensional case where it is easy to compute the total error $\epsilon_{P} + \epsilon_{Q}$ of the maximum likelihood test is when $P$ and $Q$ are Gaussian distributions on $\Omega = \mathbb{R}^{k}$ with common covariance matrix (which we for simplicity set to the unit matrix) and different expectations, say, a and $b,$ so that the densities (taken w.r.t. the usual Lebesgue measure $d \mu(\omega_{1},..., \omega_{k}) = d \omega_{1}...d \omega_{k})$ are $\begin{array}{r}{p(\omega) = \frac{1}{(2 \pi)^{k / 2}} \exp \{-(\omega - a)^{T}(\omega - a) / 2\}} \end{array}$ and $\begin{array}{r}{q(\omega) = \frac{1}{(2 \pi)^{k / 2}} \exp \{-(\omega - b)^{T}(\omega - b) / 2\}} \end{array}$ . Prove that in this case the likelihood test reduces to accepting $P$ when $\| \omega - a \|_{2} \leq \| \omega - b \|_{2}$ and accepting $Q$ otherwise. of the ab ---1e

Prove that the total error of the above test is $2 \Phi(\| a - b \|_{2} / 2)$ , where

$$
\Phi(s) = \frac{1}{\sqrt{2 \pi}} \int_{s}^{\infty} \exp \{- t^{2} / 2\} dt
$$

is the error function.

2. Kullback-Leibler divergence. The question we address next is how to compute the outlined lower bound on $\epsilon_{P} + \epsilon_{Q}$ (its explicit representation as an integral does not help much – how could we compute this integral in a multi-dimensional case?)

One of the useful approaches to the task at hand is based on Kullback-Leibler divergence defined as

$$
\mathcal{H}(p, q) = \int p(\omega) \ln \left(\frac{p(\omega)}{q(\omega)}\right) d \mu(\omega) \quad \left[= \sum_{\omega \in \Omega} p(\omega) \ln \left(\frac{p(\omega)}{q(\omega)}\right) \text{in the discrete case} \right]
$$

In this definition, we set $0 \ln(0 / a) = 0$ whenever $a \geq 0$ and a ln $.(a / 0) = + \infty$ whenever $a > 0$

(a) Compute the Kullback-Leibler divergence between two Gaussian distributions on $\mathbb{R}^{k}$ with unit covariance matrices and expectations $a, b.$

(b) Prove that $\mathcal{H}(p, q)$ is convex function of $(p(\cdot), q(\cdot)) \geq 0$ Hint: It sufices to prove that the function t ln $(t / s)$ is a convex function of $t, s \geq 0$ . To this end, it sufices to note that this function is the projective transformation $sf(t / s)$ of the (clearly convex) function $f(t) = t \ln(t)$ with the domain $t \geq 0$

(c) Prove that when $p, q$ are probability densities, $\mathcal{H}(p, q) \geq 0.$

(d) Let k be a positive integer and let for $1 \leq s \leq kp^{s}$ be a probability density on $\Omega^{s}$ taken w.r.t. measure $\mu^{s}$ . Let us define the “direct product” $p^{1} \times \ldots \times p^{k}$ of the densities $p^{s}$ the density of k-element sample $\omega_{1},....\omega_{k}$ with independent $\omega_{s}$ drawn according to $p ^ { s } , \ s = 1 , . . . , k $ ; the product density is taken $\mathrm{w.r.t.}$ . the measure $\mu = \mu^{1} \times \ldots \times \mu^{k}$ $({\mathrm{i.e., ~}} d \mu(\omega_{1}),..., \omega_{k}) = d \mu^{1}(\omega_{1})...d \mu^{k}(\omega_{k}))$ on the space $\Omega^{1} \times \ldots \times \Omega^{k}$ where the sample lives. For example, in the discrete case $p^{s}$ are probability vectors of dimension $N_{s}$ $s = 1,..., k.$ and $p^{1} \times \ldots \times p^{k}$ is the probability vector of the dimension $N_{1},..., N_{k}$ with the entries

$$
p_{i_{1}, \dots, i_{k}} = p_{i_{1}}^{1} p_{i_{2}}^{2} \dots p_{i_{k}}^{k}, 1 \leq i_{s} \leq N_{s}, 1 \leq s \leq k.
$$

Prove that if $p^{s}, q^{s}$ are probability densities on $\Omega_{s}$ taken $\mathrm{w.r.t}$ . measures $\mu^{s}$ on these spaces, then

$$
\mathcal{H}(p^{1} \times \dots \times p^{k}, q^{1} \times \dots \times q^{k}) = \sum_{s = 1}^{k} \mathcal{H}(p^{s}, q^{s}).
$$

In particular, when all $p^{s}$ coincide with some $p$ (in this case, we denote $p^{1} \times \ldots \times p^{k}$ by $p^{\otimes k})$ and $q^{1},..., q^{k}$ coincide with some $q,$ then

$$
\mathcal{H}(p^{\otimes k}, q^{\otimes k}) = k \mathcal{H}(p, q).
$$

Follow-up: What is Kullback-Leibler divergence between two k-dimensional Gaussian distributions $\textstyle{\mathcal{N}}(a, I_{k})$ and $\mathcal{N}(b, I_{k}) \(\Omega ={\bf R}^{k}, d \mu(\omega_{1},..., \omega_{k}) = d \omega_{1}...d \omega_{k}$ , the density of $\begin{array}{r}{\mathcal{N}(a, I_{k}) \mathrm{~ is ~} \frac{1}{(2 \pi)^{k / 2}} \exp \{-(w - a)^{T}(w - a) / 2\}) ?} \end{array}$

(e) Let $p, q$ be probability densities on $(\Omega, \mu)$ , and let $A \subset \Omega, B = \Omega \backslash A$ . Let $p_{A}, p_{B} =$ $1 - p_{A}$ be the $p{\vdash}$ -probability masses of A and $B$ , and let $q_{A}, q_{B} = 1 - q_{A}$ be the q-probability masses of A, B. Prove that

$$
\mathcal{H}(p, q) \geq p_{A} \ln \left(\frac{p_{A}}{q_{A}}\right) + p_{B} \ln \left(\frac{p_{B}}{q_{B}}\right).
$$

(f) In the notation from Problem’s setting, prove that if the hypotheses $H_{P}, H_{Q}$ can be distinguished from an observation with probabilities of the errors satisfying $\epsilon_{P} + \epsilon_{Q} \leq$ $2 \epsilon < 1 / 2$ , then

$$
\mathcal{H}(p, q) \geq(1 - 4 \epsilon) \ln \left(\frac{1}{2 \epsilon}\right).\tag{3.8.24}
$$

Follow-up: Let $p$ and $q$ be Gaussian densities on $\mathbb{R}^{k}$ with unit covariance matrices and expectations $a, \b.$ . Given that $\| b - a \|_{2} = 1$ , how large should be a sample of independent realizations (drawn either all from $p,$ or all from $q)$ in order to distinguish between $P$ and $Q$ with total error $2.\mathrm{{e - 6 ?}}$ Give a lower bound on the sample size based on (3.8.24) and its true minimum size (to find it, use the result of the Follow-up in item 1; note that a sample of vectors drawn independently from Gaussian distribution is itself a large Gaussian vector).

3. Hellinger afinity. The Hellinger afinity of P and Q is defined as

$$
\operatorname{Hel}(p, q) = \int_{\Omega} \sqrt{p(\omega) q(\omega)} d \mu(\omega) \qquad \left[= \sum_{\omega \in \Omega} \sqrt{p(\omega) q(\omega)} \text{in the discrete case} \right]
$$

Task 3:

(a) Prove that the Hellinger afinity is nonnegative, is concave in $(p, q) \ge 0$ , does not exceed 1 when $p, q$ are probability densities (and is equal to one if and only if $p = q)$ ， and possesses the following two properties:

$$
\operatorname{Hel}(p, q) \leq \sqrt{2 \int \min[p(\omega), q(\omega)] d \mu(\omega)}
$$

and

$$
\operatorname{Hel} \left(p^{1} \times \dots \times p^{k}, q^{1} \times \dots \times q^{k}\right) = \operatorname{Hel} \left(p^{1}, q^{1}\right) \cdot \dots \cdot \operatorname{Hel} \left(p^{k}, q^{k}\right).
$$

(b) Derive from the previous item that the total error $2 \epsilon$ in distinguishing two hypotheses on distribution of $\omega^{k} =(\omega_{1},..., \omega_{k}) \in \Omega \times...\times \Omega$ , the first stating that the density of $\omega^{k}$ is $p^{\otimes k}$ , and the second stating that this density is $q^{\otimes k}$ , admits the lower bound

$$
4 \epsilon \geq(\operatorname{Hel}(p, q))^{2k}.
$$

Follow-up: Compute the Hellinger afinity of two Gaussian densities on $\mathbb{R}^{k}$ , both with covariance matrices $I_{k},$ the means of the densities being a and b. Use this result to derive a lower bound on the sample size considered in the previous Follow-up.

4. Experiment.

Task 4: Carry out the experiment as follows:

(a) Use the scheme represented in Proposition 3.6.1 to reproduce the results presented in Illustration for the hypotheses B and C. Use the following data on the returns:

$$
n = 15, r_{i} = 1 + \mu_{i} + \sigma_{i} \zeta_{i}, \mu_{i} = 0.001 + 0.9 \cdot \frac{i - 1}{n - 1}, \sigma_{i} = \left[0.9 + 0.2 \cdot \frac{i - 1}{n - 1} \right] \mu_{i}, 1 \leq i \leq n,
$$

where $\zeta_{i}$ are zero mean random perturbations supported on [−1, 1].

(b) Find numerically the probability distribution p of $\zeta \in B =[- 1, 1]^{15}$ for which the probability of “crisis” $\zeta = - 1, 1 \leq i \leq 15$ , is as large as possible under the restrictions that

— p is supported on the set of $2^{15}$ vertices of the box B (i.e., the factors $\zeta_{i}$ take values ±1 only);

— the marginal distributions of $\zeta_{i}$ induced by p are the uniform distributions on {−1; 1} (i.e., every $\zeta_{i}$ takes values ±1 with probabilities $1 / 2)$ ;

— the covariance matrix of ζ is $I_{15}$

(c) After p is found, take its convex combination with the uniform distribution on the vertices of B to get a distribution $P_{*}$ on the vertices of B for which the probability of the crisis $P_{*}(\{\zeta =[\mathrm{- 1}; \mathrm{~}...; - 1]\})$ is exactly 0.01.

(d) Use the Kullback-Leibler and the Hellinger bounds to bound from below the observation time needed to distinguish, with the total error 2 · 0.01, between two probability distributions on the vertices of B, namely, $P_{*}$ and the uniform one (the latter corresponds to the case where $\zeta_{i}, 1 \leq i \leq 15$ , are independent and take values ±1 with probabilities $1 / 2)$


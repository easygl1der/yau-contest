---
title: "Chapter 1 \u2014 Vector Spaces"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 1
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 252
source_line_end: 761
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
  source_control_characters: 2
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 1 — Vector Spaces

> [[../README|本书目录]] · [[02-chapter-2-extended-real-valued-functions|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 252–761。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.13) × 1；Affine × 7；different × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Vector Spaces

This chapter reviews several important facts about different aspects of vectors spaces that will be used throughout the book. More comprehensive and detailed accounts of these subjects can be found in advanced linear algebra books.

## 1.1 Definition

A vector space <sup>E</sup> over <sup>R</sup> (or a “real vector space”) is a set of elements called vectors such that the following holds.

(A) For any two vectors x, $\mathbf{y} \in \mathbb{E}$ , there corresponds a vector $\mathbf x + \mathbf y$ , called the sum of x and y, satisfying the following properties:

1. ${\bf x} +{\bf y} ={\bf y} +{\bf x}$ for any x, $\mathbf{y} \in \mathbb{E}$

2. ${\bf x} +({\bf y} +{\bf z}) =({\bf x} +{\bf y}) +{\bf z}$ for any $\mathbf{x}, \mathbf{y}, \mathbf{z} \in \mathbb{E}$

3. There exists in <sup>E</sup> a unique vector 0 (called the zeros vector) such that $\mathbf{x} + \mathbf{0} = \mathbf{x}$ for any x.

4. For any $\mathbf{x} \in \mathbb{E}$ , there exists a vector $- \mathbf{x} \in \mathbb{E}$ such that $\mathbf{x} +(- \mathbf{x}) = \mathbf{0}$

(B) For any real number (also called scalar ) $\alpha \in \mathbb{R}$ and $\mathbf{x} \in \mathbb{E}$ , there corresponds a vector αx called the scalar multiplication of α and x satisfying the following properties:

1. $\alpha(\beta \mathbf{x}) =(\alpha \beta) \mathbf{x}$ for any $\alpha, \beta \in \mathbb{R}, \mathbf{x} \in \mathbb{E}$

2. 1x = x for any $\mathbf{x} \in \mathbb{E}$

(C) The two operations (summation, scalar multiplication) satisfy the following properties:

1. α(x + y) = αx + αy for any $\alpha \in \mathbb{R}, \mathbf{x}, \mathbf{y} \in \mathbb{E}$

2. $(\alpha + \beta) \mathbf{x} = \alpha \mathbf{x} + \beta \mathbf{x}$ for any $\alpha, \beta \in \mathbb{R}, \mathbf{x} \in \mathbb{E}$

## 1.2 Dimension

A set of vectors $\left\{\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{n} \right\}$ in a vector space <sup>E</sup> is called linearly independent or just independent if the linear system

$$
\sum_{i = 1}^{n} \alpha_{i} \mathbf{v}_{i} = \mathbf{0}
$$

implies that $\alpha_{1} = \alpha_{2} = \cdot \cdot \cdot = \alpha_{n} = 0$ . In other words, there does not exist a nontrivial linear combination of vectors that is equal to the zeros vector. A set of vectors $\{\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{n}\}$ is said to span <sup>E</sup> if for any $\mathbf{x} \in \mathbb{E}$ , there exist $\beta_{1}, \beta_{2}, \ldots, \beta_{n} \in$ <sup>R</sup> such that

$$
\mathbf{x} = \sum_{i = 1}^{n} \beta_{i} \mathbf{v}_{i}.
$$

A basis of a vector space <sup>E</sup> is an independent set of vectors that spans $\mathbb{E}.$ It is well known that the number of vectors in all the bases of a vector space <sup>E</sup> is the same; this number is called the dimension of the space and is denoted by dim(<sup>E</sup>). In this book we will discuss only vector spaces with a finite dimension, namely, finite-dimensional vector spaces.

## 1.3 Norms

A norm $\| \cdot \|$ on a vector space $\mathbb{E}$ is a function $\| \cdot \| : \mathbb{E} \to \mathbb{R}$ satisfying the following properties:

1. (nonnegativity) $\| \mathbf{x} \| \geq 0$ for any $\mathbf{x} \in \mathbb{E}$ and $\| \mathbf{x} \| = 0$ if and only if $\mathbf{x} = \mathbf{0}$

2. (positive homogeneity) $\| \lambda \mathbf{x} \| = | \lambda | \cdot \| \mathbf{x} \|$ for any $\mathbf{x} \in \mathbb{E}$ and $\lambda \in \mathbb{R}$

3. (triangle inequality) $\| \mathbf{x} + \mathbf{y} \| \leq \| \mathbf{x} \| + \| \mathbf{y} \|$ for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}.$

We will sometimes denote the norm of a space <sup>E</sup> by $\| \cdot \|_{\mathbb{E}}$ to emphasize the identity of the space and to distinguish it from other norms. The open ball with center $\mathbf{c} \in \mathbb{E}$ and radius $r > 0$ is denoted by $B(\mathbf{c}, r)$ and defined by

$$
B(\mathbf{c}, r) = \{\mathbf{x} \in \mathbb{E}: \| \mathbf{x} - \mathbf{c} \| < r\}.
$$

The closed ball with center $\mathbf{c} \in \mathbb{E}$ and radius $r > 0$ is denoted by $B[\mathbf{c}, r]$ and defined by

$$
B[\mathbf{c}, r] = \{\mathbf{x} \in \mathbb{E}: \| \mathbf{x} - \mathbf{c} \| \leq r\}.
$$

We will sometimes use the notation $B_{\parallel \cdot \parallel}[\mathbf{c}, r]$ or $B_{\parallel \cdot \parallel}(\mathbf{c}, r)$ to identify the specific norm that is being used.

## 1.4 Inner Products

An inner product of a real vector space <sup>E</sup> is a function that associates to each pair of vectors x, y a real number, which is denoted by $\langle \mathbf{x}, \mathbf{y} \rangle$ and satisfies the following properties:

1. (commutativity) $\langle \mathbf{x}, \mathbf{y} \rangle = \langle \mathbf{y}, \mathbf{x} \rangle$ for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$

2. (linearity) $\langle \alpha_{1}{\bf x}_{1} + \alpha_{2}{\bf x}_{2},{\bf y} \rangle = \alpha_{1} \langle{\bf x}_{1},{\bf y} \rangle + \alpha_{2} \langle{\bf x}_{2},{\bf y} \rangle$ for any $\alpha_{1}, \alpha_{2} \in \mathbb{R}$ and $\mathbf{x}_{1}, \mathbf{x}_{2}, \mathbf{y} \in \mathbb{E}$

3. (positive definiteness) $\langle \mathbf{x}, \mathbf{x} \rangle \geq 0$ for any $\mathbf{x} \in \mathbb{E}$ and $\langle \mathbf{x}, \mathbf{x} \rangle = 0$ if and only if $\mathbf{x} = \mathbf{0}$

A vector space endowed with an inner product is also called an inner product space. At this point we would like to make the following important note:

Underlying Spaces: In this book the underlying vector spaces, usually denoted by <sup>V</sup> or <sup>E</sup>, are always finite dimensional real inner product spaces with endowed inner product $\langle \cdot, \cdot \rangle$ and endowed norm $\lVert \cdot \rVert$.

## 1.5 Affine Sets and Convex Sets

Given a real vector space <sup>E</sup>, a set $S \subseteq \mathbb{E}$ is called $affine$ if for any $\mathbf{x}, \mathbf{y} \in S$ and $\lambda \in \mathbb{R}$ , the inclusion $\lambda \mathbf{x} +(1 - \lambda) \mathbf{y} \in S$ holds. For a set $S \subseteq \mathbb{E},$ , the Affine hull of S, denoted by af(S), is the intersection of all Affine sets containing S. Clearly, af(S) is by itself an Affine set, and it is the smallest Affine set containing S (w.r.t. inclusion). A hyperplane is a subset of <sup>E</sup> given by

$$
H_{\mathbf{a}, b} = \{\mathbf{x} \in \mathbb{E}: \langle \mathbf{a}, \mathbf{x} \rangle = b\},
$$

where $\mathbf{a} \in \mathbb{E}$ and $b \in \mathbb{R}$ . It is an easy exercise to show that hyperplanes are Affine sets.

A set $C \subseteq \mathbb{E}$ is called convex if for any $\mathbf{x}, \mathbf{y} \in C$ and $\lambda \in[0, 1]$ it holds that $\lambda \mathbf{x} +(1 - \lambda) \mathbf{y} \in C$ . Evidently, Affine sets are always convex. Open and closed balls are always convex regardless of the choice of norm. For given $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ , the closed line segment between x and y is a subset of <sup>E</sup> denoted by $\left[\mathbf{x}, \mathbf{y} \right]$ and defined as

$$
[\mathbf{x}, \mathbf{y}] = \left\{\alpha \mathbf{x} +(1 - \alpha) \mathbf{y}: \alpha \in[0, 1] \right\}.
$$

The open line segment $\displaystyle(\mathbf{x}, \mathbf{y})$ is similarly defined as

$$
(\mathbf{x}, \mathbf{y}) = \{\alpha \mathbf{x} +(1 - \alpha) \mathbf{y}: \alpha \in(0, 1)\}
$$

when $\mathbf x \neq \mathbf y$ and is the empty set ∅ when $\mathbf x = \mathbf y$ . Closed and open line segments are convex sets. Another example of convex sets are half-spaces, which are sets of the form

$$
H_{\mathbf{a}, b}^{-} = \{\mathbf{x} \in \mathbb{E}: \langle \mathbf{a}, \mathbf{x} \rangle \leq b\},
$$

where $\mathbf{a} \in \mathbb{E}$ and $b \in \mathbb{R}$

## 1.6 Euclidean Spaces

A finite dimensional real vector space equipped with an inner product $\langle \cdot, \cdot \rangle$ is called a Euclidean space if it is endowed with the norm $\| \mathbf{x} \| ={\sqrt{\langle \mathbf{x}, \mathbf{x} \rangle}}$ , which is referred to as the Euclidean norm.

## 1.7 The Space $\mathbb{R}^{n}$

The vector space $\mathbb{R}^{n}$ (n being a positive integer) is the set of n-dimensional column vectors with real components endowed with the component-wise addition operator,

$$
\left(\begin{array}{c} x_{1} \\ x_{2} \\ \vdots \\ x_{n} \end{array} \right) + \left(\begin{array}{c} y_{1} \\ y_{2} \\ \vdots \\ y_{n} \end{array} \right) = \left(\begin{array}{c} x_{1} + y_{1} \\ x_{2} + y_{2} \\ \vdots \\ x_{n} + y_{n} \end{array} \right),
$$

and the scalar-vector product,

$$
\lambda \left(\begin{array}{c} x_{1} \\ x_{2} \\ \vdots \\ x_{n} \end{array} \right) = \left(\begin{array}{c} \lambda x_{1} \\ \lambda x_{2} \\ \vdots \\ \lambda x_{n} \end{array} \right),
$$

where in the above $x_{1}, x_{2}, \ldots, x_{n}, \lambda$ are real numbers. We will denote the standard basis of $\mathbb{R}^{n}$ by $\mathbf{e}_{1}, \mathbf{e}_{2}, \ldots, \mathbf{e}_{n}$ , where $\mathbf{e}_{i}$ is the n-length column vector whose ith component is one while all the others are zeros. The column vectors of all ones and all zeros will be denoted by e and 0, respectively, where the length of the vectors will be clear from the context.

By far the most used inner product in $\mathbb{R}^{n}$ is the dot product defined by

$$
\langle \mathbf{x}, \mathbf{y} \rangle = \sum_{i = 1}^{n} x_{i} y_{i}.
$$

Inner Product in $\mathbb{R}^{n}$ : In this book, unless otherwise stated, the endowed inner product in $\mathbb{R}^{n}$ is the dot product.

Of course, the dot product is not the only possible inner product that can be defined over $\mathbb{R}^{n}$ . Another useful option is the $\mathbf{Q} \mathbf{\cdot}$ -inner product, which is defined as

$$
\langle \mathbf{x}, \mathbf{y} \rangle_{\mathbf{Q}} = \mathbf{x}^{T} \mathbf{Q} \mathbf{y},
$$

where $\mathbf{Q}$ is a positive definite $n \times n$ matrix. Obviously, the Q-inner product amounts to the dot product when $\mathbf Q = \mathbf I$ $\operatorname{If} \mathbb{R}^{n}$ is endowed with the dot product, then the associated Euclidean norm is the l -norm

$$
\| \mathbf{x} \|_{2} = \sqrt{\langle \mathbf{x}, \mathbf{x} \rangle} = \sqrt{\sum_{i = 1}^{n} x_{i}^{2}}.
$$

If $\mathbb{R}^{n}$ is endowed with the $\mathbf{Q} \mathbf{-}$ -inner product, then the associated Euclidean norm is the Q-norm

$$
\| \mathbf{x} \|_{\mathbf{Q}} = \sqrt{\mathbf{x}^{T} \mathbf{Q} \mathbf{x}}.
$$

For a given $p \geq 1$ , the $l_{p}{\mathrm{- norm}}$ on $\mathbb{R}^{n}$ is given by the formula

$$
\| \mathbf{x} \|_{p} = \sqrt[p]{\sum_{i = 1}^{n} | x_{i} |^{p}}.
$$

The $l_{\infty} \mathrm{- norm}$ on $\mathbb{R}^{n}$ is defined by

$$
\| \mathbf{x} \|_{\infty} = \max_{i = 1, 2, \dots, n} | x_{i} |.
$$

## 1.7.1 Subsets of $\mathbb{R}^{n}$

The nonnegative orthant is the subset of $\mathbb{R}^{n}$ consisting of all vectors in $\mathbb{R}^{n}$ with nonnegative components and is denoted by $\mathbb{R}_{+}^{n}$ :

$$
\mathbb{R}_{+}^{n} = \left\{\left(x_{1}, x_{2}, \dots, x_{n}\right)^{T}: x_{1}, x_{2}, \dots, x_{n} \geq 0 \right\}.
$$

Similarly, the positive orthant consists of all the vectors in $\mathbb{R}^{n}$ with positive components and is denoted by $\mathbb{R}_{+ +}^{n}$

$$
\mathbb{R}_{+ +}^{n} = \left\{(x_{1}, x_{2}, \ldots, x_{n})^{T}: x_{1}, x_{2}, \ldots, x_{n} > 0 \right\}.
$$

The unit simplex , denoted by $\Delta_{n}.$ , is the subset of $\mathbb{R}^{n}$ comprising all nonnegative vectors whose components sum up to one:

$$
\Delta_{n} = \left\{\mathbf{x} \in \mathbb{R}^{n}: \mathbf{x} \geq \mathbf{0}, \mathbf{e}^{T} \mathbf{x} = 1 \right\}.
$$

Given two vectors $\boldsymbol{\ell},{\mathbf{u}} \in \mathbb{R}^{n}$ that satisfy $\ell \leq \mathbf{u}.$ , the box with lower bounds - and upper bounds u is denoted by Box[-, u] and defined as

$$
\operatorname{Box}[\boldsymbol{\ell}, \mathbf{u}] = \left\{\mathbf{x} \in \mathbb{R}^{n}: \boldsymbol{\ell} \leq \mathbf{x} \leq \mathbf{u} \right\}.
$$

Thus, for example, Box $[- \mathbf{e}, \mathbf{e}] =[- 1, 1]^{n}$

## 1.7.2 Operations on Vectors in $\mathbb{R}^{n}$

There are several operations on vectors in $\mathbb{R}^{n}$ that will be frequently used in the book. For a given vector $\mathbf{x} \in \mathbb{R}^{n}$ , the vector $[\mathbf{x}]_{+}$ is the nonnegative part of x defined by $[\mathbf{x}]_{+} =(\operatorname{max} \{x_{i}, 0\})_{i = 1}^{n}$ . For a given $\mathbf{x} \in \mathbb{R}^{n}$ , the vector $| \mathbf{x} |$ is the vector of component-wise absolute values $(| x_{i} |)_{i = 1}^{n}$ , and the vector $\operatorname{sgn}(\mathbf{x})$ is defined as

$$
\operatorname{sgn}(\mathbf{x})_{i} = \left\{\begin{array}{ll} 1, & x_{i} \geq 0, \\ - 1, & x_{i} < 0.\end{array} \right.
$$

For two vectors a, $\mathbf{b} \in \mathbb{R}^{n}$ , their Hadamard product, denoted by $\mathbf{a} \odot \mathbf{b}$ , is the vector comprising the component-wise products: a $\odot \mathbf{b} =(a_{i} b_{i})_{i = 1}^{n}$

## 1.8 The Space $\mathbb{R}^{m \times n}$

The set of all real-valued $m \times n$ matrices is denoted by $\mathbb{R}^{m \times n}$ . This is a vector space with the component-wise addition as the summation operation and the componentwise scalar multiplication as the “scalar-vector multiplication” operation. The dot product in $\mathbb{R}^{m \times n}$ is defined by

$$
\langle \mathbf{A}, \mathbf{B} \rangle = \mathrm{Tr}(\mathbf{A}^{T} \mathbf{B}) = \sum_{i = 1}^{m} \sum_{j = 1}^{n} A_{ij} B_{ij}, \quad \mathbf{A}, \mathbf{B} \in \mathbb{R}^{m \times n}.
$$

The space $\mathbb{R}^{m \times n}$ is sometimes associated with the space $\mathbb{R}^{mn}$ in the sense that each matrix in $\mathbb{R}^{m \times n}$ corresponds to the mn-length vector constructed by stacking the columns of the matrix. Unless otherwise stated, we will assume that the inner product in $\mathbb{R}^{m \times n}$ is the dot product.

Inner Product in $\mathbb{R}^{m \times n}$ : In this book, unless otherwise stated, the endowed inner product in $\mathbb{R}^{m \times n}$ is the dot product.

## 1.8.1 Subsets of $\mathbb{R}^{n \times n}$

The set of all $n \times n$ symmetric matrices is denoted by $\mathbb{S}^{n}$ :

$$
\mathbb{S}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{A} = \mathbf{A}^{T} \right\}.
$$

Note that $\mathbb{S}^{n}$ is also a vector space with the same summation and scalar multiplication operations as in $\mathbb{R}^{n \times n}$ . The inner product in $\mathbb{S}^{n}$ , unless otherwise stated, is the dot product.

The set of all $n \times n$ positive semidefinite matrices is denoted by $\mathbb{S}_{+}^{n}$ :

$$
\mathbb{S}_{+}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{A} \succeq \mathbf{0} \right\}.
$$

The set of all $n \times n$ positive definite matrices is denoted by ${\mathbb S}_{+ +}^{n}$

$$
\mathbb{S}_{+ +}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{A} \succ \mathbf{0} \right\}.
$$

Obviously, the inclusion $\mathbb{S}_{+ +}^{n} \subseteq \mathbb{S}_{+}^{n} \subseteq \mathbb{S}^{n}$ holds. Similarly, $\mathbb{S}_{-}^{n}$ is the set of all $n \times n$ negative semidefinite matrices, and $\mathbb{S}_{--}^{n}$ is the set of all $n \times n$ negative definite matrices:

$$
\begin{array}{c} \mathbb{S}_{-}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{A} \preceq \mathbf{0} \right\}, \\ \mathbb{S}_{- -}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{A} \prec \mathbf{0} \right\}.\end{array}
$$

The set of all $n \times n$ orthogonal matrices is denoted by $\mathbb{O}^{n}$ :

$$
\mathbb{O}^{n} = \left\{\mathbf{A} \in \mathbb{R}^{n \times n}: \mathbf{AA}^{T} = \mathbf{A}^{T} \mathbf{A} = \mathbf{I} \right\}.
$$

## 1.8.2 Norms in $\mathbb{R}^{m \times n}$

If $\mathbb{R}^{m \times n}$ is endowed with the dot product, then the corresponding Euclidean norm is the Frobenius norm defined by

$$
\| \mathbf{A} \|_{F} = \sqrt{\operatorname{Tr}(\mathbf{A}^{T} \mathbf{A})} = \sqrt{\sum_{i = 1}^{m} \sum_{j = 1}^{n} A_{ij}^{2}}, \quad \mathbf{A} \in \mathbb{R}^{m \times n}.
$$

Many examples of matrix norms are generated by using the concept of induced norms, which we now describe. Given a matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ and two norms $\| \cdot \|_{a}$ and $\| \cdot \|_{b}$ on $\mathbb{R}^{n}$ and $\mathbb{R}^{m}$ , respectively, the induced matrix norm $\| \mathbf{A} \|_{a, b}$ is defined by

$$
\| \mathbf{A} \|_{a, b} = \max_{\mathbf{x}} \{\| \mathbf{Ax} \|_{b}: \| \mathbf{x} \|_{a} \leq 1\}.
$$

It can be easily shown that the above definition implies that for any $\mathbf{x} \in \mathbb{R}^{n}$ , the inequality

$$
\| \mathbf{A} \mathbf{x} \|_{b} \leq \| \mathbf{A} \|_{a, b} \| \mathbf{x} \|_{a}
$$

holds. We refer to the matrix norm $\Vert \cdot \Vert_{a, b}$ as the $(a, b) – \mathrm{norm}$ . When $a = b,$ , we will simply refer to it as an a-norm and omit one of the subscripts in its notation, that is, use the notation $\| \cdot \|_{a}$ instead of $\| \cdot \|_{a, a}$

Example 1.1 (spectral norm). $\operatorname{If} \parallel \cdot \parallel_{a} = \parallel \cdot \parallel_{b} = \parallel \cdot \parallel_{2}$ , then the induced norm of a matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ is the maximum singular value of A:

$$
\| \mathbf{A} \|_{2} = \| \mathbf{A} \|_{2, 2} = \sqrt{\lambda_{\max}(\mathbf{A}^{T} \mathbf{A})} \equiv \sigma_{\max}(\mathbf{A}).
$$

Example 1.2 (1-norm). When $\| \cdot \|_{a} = \| \cdot \|_{b} = \| \cdot \|_{1}$ , the induced matrix norm of a matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ is given by

$$
\| \mathbf{A} \|_{1} = \max_{j = 1, 2, \dots, n} \sum_{i = 1}^{m} | A_{i, j} |.
$$

This norm is also called the maximum absolute column sum norm.

Example 1.3 (∞-norm). When $\| \cdot \|_{a} = \| \cdot \|_{b} = \| \cdot \|_{\infty}$ , the induced matrix norm of a matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ is given by

$$
\| \mathbf{A} \|_{\infty} = \max_{i = 1, 2, \dots, m} \sum_{j = 1}^{n} | A_{i, j} |.
$$

This norm is also called the maximum absolute row sum norm.

## 1.9 Cartesian Product of Vector Spaces

Given m vector spaces $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{m}$ equipped with inner products $\langle \cdot, \cdot \rangle_{\mathbb{E}_{i}}$ , their Cartesian product $\mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ is the vector space of all m-tuples $(\mathbf{v}_{1}, \mathbf{v}_{2}$ $\ldots, \mathbf{v}_{m})$ equipped with the component-wise addition between vectors:

$$
\left(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{m}\right) + \left(\mathbf{w}_{1}, \mathbf{w}_{2}, \dots, \mathbf{w}_{m}\right) = \left(\mathbf{v}_{1} + \mathbf{w}_{1}, \mathbf{v}_{2} + \mathbf{w}_{2}, \dots, \mathbf{v}_{m} + \mathbf{w}_{m}\right)
$$

and the scalar-vector multiplication operation given by

$$
\alpha(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{m}) =(\alpha \mathbf{v}_{1}, \alpha \mathbf{v}_{2}, \dots, \alpha \mathbf{v}_{m}).
$$

The inner product in the Cartesian product space is defined as

$$
\langle(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{m}),(\mathbf{w}_{1}, \mathbf{w}_{2}, \dots, \mathbf{w}_{m}) \rangle_{\mathbb{E}_{1} \times \mathbb{E}_{2} \times \dots \times \mathbb{E}_{m}} = \sum_{i = 1}^{m} \langle \mathbf{v}_{i}, \mathbf{w}_{i} \rangle_{\mathbb{E}_{i}}.\tag{1.1}
$$

The space $\mathbb{R} \times \mathbb{R}$ , for example, consists of all two-dimensional row vectors, so in that respect it is different than $\mathbb{R}^{2}$ , which comprises all two-dimensional column vectors. However, with only a slight abuse of notation, we will occasionally refer to $\mathbb{R} \times \mathbb{R}$ as $\mathbb{R}^{2}$

Suppose that $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{m}$ are vector spaces with endowed norms $\| \cdot \|_{\mathbb{E}_{1}, \|}$ $\|_{\mathbb{E}_{2}}, \ldots, \| \cdot \|_{\mathbb{E}_{m}}.$ respectively. There are many ways to define a norm on the Cartesian product space $\mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ . For example, for any $p \geq 1$ , we can define the composite $l_{p}{\mathrm{- norm}}$ as

$$
\left\| \left(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}\right) \right\| = \sqrt[p]{\sum_{i = 1}^{m} \left\| \mathbf{u}_{i} \right\|_{\mathbb{E}_{i}}^{p}}.
$$

Another norm is a composite weighted $l_{2}.$ -norm:

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}) \| = \sqrt{\sum_{i = 1}^{m} \omega_{i} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}},
$$

where $\omega_{1}, \omega_{2}, \ldots, \omega_{m}$ are given positive real numbers.

We will use the convention that if $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{m}$ are Euclidean spaces, then $\mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ is also a Euclidean space, and consequently, by the definition (1.1) of the inner product in product spaces,

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}) \|_{\mathbb{E}_{1} \times \mathbb{E}_{2} \times \dots \times \mathbb{E}_{m}} = \sqrt{\sum_{i = 1}^{m} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}}.
$$

## 1.10 Linear Transformations

Given two vector spaces <sup>E</sup> and <sup>V</sup>, a function $\mathcal{A} : \mathbb{E} \mathbb{V}$ is called a linear transformation if the following property holds for any $\mathbf{x}, \mathbf{y} \in \mathbb{E}$ and $\alpha, \beta \in \mathbb{R}$ :

$$
\mathcal{A}(\alpha \mathbf{x} + \beta \mathbf{y}) = \alpha \mathcal{A}(\mathbf{x}) + \beta \mathcal{A}(\mathbf{y}).
$$

All linear transformations from $\mathbb{R}^{n}$ to $\mathbb{R}^{m}$ have the form

$$
\mathcal{A}(\mathbf{x}) = \mathbf{Ax}
$$

for some matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ . All linear transformations from $\mathbb{R}^{m \times n}$ to $\mathbb{R}^{k}$ have the form

$$
\mathcal{A}(\mathbf{X}) = \left(\begin{array}{c} \operatorname{Tr}(\mathbf{A}_{1}^{T} \mathbf{X}) \\ \operatorname{Tr}(\mathbf{A}_{2}^{T} \mathbf{X}) \\ \vdots \\ \operatorname{Tr}(\mathbf{A}_{k}^{T} \mathbf{X}) \end{array} \right)
$$

for some $\mathbf{A}_{1}, \mathbf{A}_{2}, \ldots, \mathbf{A}_{k} \in \mathbb{R}^{m \times n}$ . The identity transformation, denoted by $\mathcal{T},$ is defined by the relation $\mathcal{T}(\mathbf{x}) = \mathbf{x}$ for all $\mathbf{x} \in \mathbb{E}$

## 1.11 The Dual Space

A linear functional on a vector space <sup>E</sup> is a linear transformation from <sup>E</sup> to <sup>R</sup>. Given a vector space $\mathbb{E}.$ , the set of all linear functionals on <sup>E</sup> is called the dual space and is denoted by $\mathbb{E}^{*}$ . For inner product spaces, it is known that given a linear functional $f \in \mathbb{E}^{*}$ , there always exists $\mathbf{v} \in \mathbb{E}$ such that

$$
f(\mathbf{x}) = \langle \mathbf{v}, \mathbf{x} \rangle.\tag{1.2}
$$

For the sake of simplicity of notation, we will represent the linear functional f given in (1.2) by the vector v. This correspondence between linear functionals and elements in <sup>E</sup> leads us to consider the elements in $\mathbb{E}^{*}$ as exactly the same as those in <sup>E</sup>. The inner product in $\mathbb{E}^{*}$ is the same as the inner product in <sup>E</sup>. Essentially, the only diference between <sup>E</sup> and $\mathbb{E}^{*}$ will be in the choice of norms of each of the spaces. Suppose that <sup>E</sup> is endowed with a norm $\| \cdot \|$ . Then the norm of the dual space, called the dual norm, is given by

$$
\| \mathbf{y} \|_{*} \equiv \max_{\mathbf{x}} \{\langle \mathbf{y}, \mathbf{x} \rangle : \| \mathbf{x} \| \leq 1\}, \quad \mathbf{y} \in \mathbb{E}^{*}.\tag{1.3}
$$

It is not dificult to show that the dual norm is indeed a norm. A useful property is that the maximum in (1.3) can be taken over the unit sphere rather than over the unit ball, meaning that the following formula is valid:

$$
\| \mathbf{y} \|_{*} = \max_{\mathbf{x}} \{\langle \mathbf{y}, \mathbf{x} \rangle : \| \mathbf{x} \| = 1\}, \quad \mathbf{y} \in \mathbb{E}^{*}.
$$

The definition of the dual norm readily implies the following generalized version of the Cauchy–Schwarz inequality.

Lemma 1.4 (generalized Cauchy–Schwarz inequality). Let <sup>E</sup> be an inner product vector space endowed with a norm $\| \cdot \|$ . Then

$$
| \langle \mathbf{y}, \mathbf{x} \rangle | \leq \| \mathbf{y} \|_{*} \| \mathbf{x} \| forany \mathbf{y} \in \mathbb{E}^{*}, \mathbf{x} \in \mathbb{E}.\tag{1.4}
$$

Proof. If $\mathbf{x} = \mathbf{0}$ , the inequality is trivially satisfied. Otherwise, take $\tilde{\mathbf{x}} = \frac{\mathbf{x}}{\| \mathbf{x} \|}$ Obviously, $\| \tilde{\mathbf{x}} \| = 1$ , and hence, by the definition of the dual norm, we have

$$
\left\| \mathbf{y} \right\|_{*} \geq \langle \mathbf{y}, \tilde{\mathbf{x}} \rangle = \frac{1}{\left\| \mathbf{x} \right\|} \langle \mathbf{y}, \mathbf{x} \rangle,
$$

showing that $\langle \mathbf{y}, \mathbf{x} \rangle \leq \| \mathbf{y} \|_{*} \| \mathbf{x} \|$ . Plugging −x instead of $\mathbf{x}$ in the latter inequality, we obtain that $\langle \mathbf{y}, \mathbf{x} \rangle \geq - \| \mathbf{y} \|_{*} \| \mathbf{x} \|$ , thus showing the validity of inequality (1.4).

Another important result is that Euclidean norms are self-dual, meaning that $\| \cdot \| = \| \cdot \|_{*}$ . Here of course we use our convention that the elements in the dual space $\mathbb{E}^{*}$ are the same as the elements in <sup>E</sup>. We can thus write, in only a slight abuse of notation,<sup>1</sup> that for any Euclidean space $\mathbb{E}, \mathbb{E} = \mathbb{E}^{*}$

Example 1.5 $\left(l_{p}{\mathbf{- norms}} \right)$ . Consider the space $\mathbb{R}^{n}$ endowed with the $l_{p}{\mathrm{- norm}}$ When $p > 1$ , the dual norm is the $l_{q}{\mathrm{- norm}}$ , where $q > 1$ is the number satisfying $\begin{array}{r}{\frac{1}{p} + \frac{1}{q} = 1} \end{array}$ . When $p = 1$ , the dual norm is the $l_{\infty} \mathrm{- norm}$ , and vice versa—the dual norm of the $l_{\infty} \mathrm{- norm}$ is the $l_{1}{\mathrm{- norm}}$ ■

Example 1.6 (Q-norms). Consider the space $\mathbb{R}^{n}$ endowed with the Q-norm, where $\mathbf{Q} \in \mathbb{S}_{+ +}^{n}$ . The dual norm of $\| \cdot \|_{\mathbf{Q}} \mathrm{~ is ~} \| \cdot \|_{\mathbf{Q}^{- 1}}$ , meaning

$$
\left\| \mathbf{x} \right\|_{\mathbf{Q}^{- 1}} = \sqrt{\mathbf{x}^{T} \mathbf{Q}^{- 1} \mathbf{x}}.
$$

As an example, consider the case where $\mathbf{Q}$ is diagonal: $\mathbf{Q} = \operatorname{diag}(w_{1}, w_{2}, \dots, w_{n})$ with $w_{1}, w_{2}, \ldots, w_{n} > 0$ . The Q-norm in this case takes the form

$$
\| \mathbf{x} \| = \sqrt{\sum_{i = 1}^{n} w_{i} x_{i}^{2}},
$$

and its dual norm is

$$
\| \mathbf{x} \|_{*} = \sqrt{\sum_{i = 1}^{n} \frac{1}{w_{i}} x_{i}^{2}}.\quad \blacksquare
$$

Example 1.7 (dual norm of Cartesian products of spaces). Consider the space $\mathbb{E} = \mathbb{E}_{1} \times \mathbb{E}_{1} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ , where $\mathbb{E}_{1}, \mathbb{E}_{2}, \ldots, \mathbb{E}_{m}$ are inner product vectors spaces with norms $\| \cdot \|_{\mathbb{E}_{1}}, \| \cdot \|_{\mathbb{E}_{2}}, \ldots, \| \cdot \|_{\mathbb{E}_{m}}$ , respectively. Recall that we assume that the inner product in the product space is given by

$$
\langle(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{m}),(\mathbf{w}_{1}, \mathbf{w}_{2}, \dots, \mathbf{w}_{m}) \rangle = \sum_{i = 1}^{m} \langle \mathbf{v}_{i}, \mathbf{w}_{i} \rangle.
$$

The dual space to $\mathbb{E}_{1} \times \mathbb{E}_{2} \times \cdot \cdot \cdot \times \mathbb{E}_{m}$ is the product space $\mathbb{E}_{1}^{*} \times \mathbb{E}_{2}^{*} \times \cdot \cdot \cdot \times \mathbb{E}_{m}^{*}$ with endowed norm defined as usual in dual spaces. For example, suppose that the norm on the product space is the composite weighted l<sub>2</sub>-norm:

$$
\|(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{m}) \| = \sqrt{\sum_{i = 1}^{m} \omega_{i} \| \mathbf{u}_{i} \|_{\mathbb{E}_{i}}^{2}}, \quad \mathbf{u}_{i} \in \mathbb{E}_{i}, i = 1, 2, \dots, p,
$$

where $\omega_{1}, \omega_{2}, \ldots, \omega_{m} > 0$ are given positive weights. Then it is simple to show that the dual norm in this case is given by

$$
\|(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{m}) \|_{*} = \sqrt{\sum_{i = 1}^{m} \frac{1}{\omega_{i}} \| \mathbf{v}_{i} \|_{\mathbb{E}_{i}^{*}}^{2}}, \quad \mathbf{v}_{i} \in \mathbb{E}_{i}^{*}, i = 1, 2, \dots, p.
$$

where $\| \cdot \|_{\mathbb{E}_{i}^{*}}$ is the dual norm to $\| \cdot \|_{\mathbb{E}_{i}}$ , namely, the norm of the dual space $\mathbb{E}_{i}^{*}$ . ■

## 1.12 The Bidual Space

Given a vector space <sup>E</sup>, the dual space $\mathbb{E}^{*}$ is also a vector space, and we can also consider its dual space, namely, $\mathbb{E}^{* *}$ . This is the so-called bidual space. In the setting of finite dimensional spaces, the bidual space is the same as the original space (under our convention that the elements in the dual space are the same as the elements in the original space), and the corresponding norm (bidual norm) is the same as the original norm.

## 1.13 Adjoint Transformations

Given two inner product vector spaces $\mathbb{E}, \mathbb{V}$ and a linear transformation $\mathcal{A}$ from $\mathbb{V}$ to <sup>E</sup>, the adjoint transformation, denoted by $\mathcal{A}^{T}$ , is a transformation from $\mathbb{E}^{*}$ $\mathbb{V}^{*}$ defined by the relation

$$
\langle \mathbf{y}, \mathcal{A}(\mathbf{x}) \rangle = \langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{x} \rangle
$$

for any $\mathbf x \in \mathbb V, \mathbf y \in \mathbb E^{*}$ . When $\mathbb{V} = \mathbb{R}^{n}, \mathbb{E} = \mathbb{R}^{m}$ (endowed with the dot product), and $\mathcal{A}(\mathbf{x}) = \mathbf{A} \mathbf{x}$ for some matrix $\mathbf{A} \in \mathbb{R}^{m \times n}$ , then the adjoint transformation is given by $\mathbf{\mathcal{A}}^{T}(\mathbf{x}) = \mathbf{A}^{T} \mathbf{x}$

Example 1.8 (adjoint of a transformation from $\mathbb{R}^{m \times n}{\bf \Pi}_{{\bf to}} \mathbb{R}^{k})$ . Consider now a linear transformation from the space $\mathbb{R}^{m \times n}$ to $\mathbb{R}^{k}$ . As was already mentioned in Section 1.10, such a transformation has the form

$$
\mathcal{A}(\mathbf{X}) = \left(\begin{array}{c} \operatorname{Tr}(\mathbf{A}_{1}^{T} \mathbf{X}) \\ \operatorname{Tr}(\mathbf{A}_{2}^{T} \mathbf{X}) \\ \vdots \\ \operatorname{Tr}(\mathbf{A}_{k}^{T} \mathbf{X}) \end{array} \right),
$$

where $\mathbf{A}_{i} \in \mathbb{R}^{m \times n}$ are given matrices. The adjoint transformation $\mathcal{A}^{T}$ will be a transformation from $\mathbb{R}^{k}$ to $\mathbb{R}^{m \times n}$ . To find it, let us write the defining relation of the adjoint operator:

$$
\langle \mathbf{y}, \mathcal{A}(\mathbf{X}) \rangle = \left\langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{X} \right\rangle \text{for all} \mathbf{X} \in \mathbb{R}^{m \times n}, \mathbf{y} \in \mathbb{R}^{k},
$$

which is the same as (recall that unless otherwise stated, the inner products in $\mathbb{R}^{m \times n}$ and $\mathbb{R}^{k}$ are the dot products)

$$
\sum_{i = 1}^{k} y_{i} \mathrm{Tr}(\mathbf{A}_{i}^{T} \mathbf{X}) = \langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{X} \rangle \mathrm{forall} \mathbf{X} \in \mathbb{R}^{m \times n}, \mathbf{y} \in \mathbb{R}^{k},
$$

that is,

$$
\operatorname{Tr} \left(\left[\sum_{i = 1}^{k} y_{i} \mathbf{A}_{i} \right]^{T} \mathbf{X}\right) = \langle \mathcal{A}^{T}(\mathbf{y}), \mathbf{X} \rangle \text{for all} \mathbf{X} \in \mathbb{R}^{m \times n}, \mathbf{y} \in \mathbb{R}^{k}.
$$

Obviously, the above relation implies that the adjoint transformation is given by

$$
\mathcal{A}^{T}(\mathbf{y}) = \sum_{i = 1}^{k} y_{i} \mathbf{A}_{i}.\quad \blacksquare
$$

The adjoint of the adjoint transformation is the original transformation: $(A^{T})^{T}$ $= A$ . It also holds that whenever A is an invertible transformation,

$$
(\mathcal{A}^{T})^{- 1} =(\mathcal{A}^{- 1})^{T}.
$$

## 1.14 Norms of Linear Transformations

Let $\mathcal{A} : \mathbb{E} \mathbb{V}$ be a linear transformation from a vector space <sup>E</sup> to a vector space <sup>V</sup>. Assume that <sup>E</sup> and <sup>V</sup> are endowed with the norms $\| \cdot \|_{\mathbb{E}}$ and $\| \cdot \|_{\mathbb{V}}$ , respectively. The norm of the linear transformation is defined by

$$
\| \mathcal{A} \| \equiv \max \{\| \mathcal{A}(\mathbf{x}) \|_{\mathbb{V}}: \| \mathbf{x} \|_{\mathbb{E}} \leq 1\}.
$$

It is not dificult to show that $\| \mathcal{A} \| = \| \mathcal{A}^{T} \|$ . There is a close connection between the notion of induced norms discussed in Section 1.8.2 and norms of linear transformations. Specifically, suppose that A is a linear transformation from $\mathbb{R}^{n}$ to <sup>Rm</sup> given by

$$
\mathcal{A}(\mathbf{x}) = \mathbf{Ax},\tag{1.5}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}$ , and assume that $\mathbb{R}^{n}$ and $\mathbb{R}^{m}$ are endowed with the norms $\| \cdot \|_{a}$ and $\Vert \cdot \Vert_{b}.$ , respectively. Then $\| \mathcal{A} \| = \| \mathbf{A} \|_{a, b}$ , meaning that the induced norm of a matrix is actually the norm of the corresponding linear transformation given by the relation (1.5).

Chapter 2


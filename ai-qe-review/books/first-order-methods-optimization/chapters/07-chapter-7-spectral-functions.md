---
title: "Chapter 7 \u2014 Spectral Functions"
book: "First-Order Methods in Optimization"
book_slug: first-order-methods-optimization
course: optimization
chapter_number: 7
citekey: beck2017first
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf"
source_transcript: "transcripts/mineru/first-order-methods-optimization/reading.md"
source_line_start: 8109
source_line_end: 8670
source_pdf_page_range: null
review_status: machine-verified
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
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

# Chapter 7 — Spectral Functions

> [[../README|本书目录]] · [[06-chapter-6-the-proximal-operator|上一章]] · [[08-chapter-8-primal-and-dual-projected-subgradient-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：First-Order Methods in Optimization（beck2017first）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/first-order-methods-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 8109–8670。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chapter 7 Spectral Functions

In this chapter we will concentrate on spectral functions, which are functions of matrices that depend only on their singular values or on their eigenvalues. The underlying spaces in this chapter are all Euclidean. We start by defining the notion of symmetry w.r.t. a given set of orthogonal matrices.

## 7.1 Symmetric Functions

## 7.1.1 Definition and Examples

Definition 7.1 (symmetric functions). Let ${\mathcal{A}} \subseteq \mathbb{O}^{n}$ be a set of orthogonal matrices. A proper function $f : \mathbb{R}^{n}(- \infty, \infty]$ is called symmetric w.r.t. A if

$$
f(\mathbf{A} \mathbf{x}) = f(\mathbf{x}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}, \mathbf{A} \in \mathcal{A}.
$$

The following are five types of symmetric functions, each one dictated by the choice of orthogonal matrices in A.

Example 7.2 (even functions). If ${\mathcal{A}} = \{-{\bf I}\}$ , then $f : \mathbb{R}^{n}(- \infty, \infty]$ is symmetric w.r.t. A if

$$
f(\mathbf{x}) = f(- \mathbf{x}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}.
$$

Such functions will be called even functions.

Example 7.3 (absolutely symmetric functions). Take $\mathcal{A} = \{\mathbf{D}_{1}, \mathbf{D}_{2}, \dots, \mathbf{D}_{n}\}$ $\subseteq \mathbb{R}^{n \times n}$ , where $\mathbf{D}_{i}$ is the diagonal matrix whose diagonal elements are all ones except for the $(i, i)$ component which is equal to −1. Then a proper function $f : \mathbb{R}^{n}(- \infty, \infty]$ is symmetric w.r.t. A if and only if

$$
f(\mathbf{x}) = f(| \mathbf{x} |) \text{for all} \mathbf{x} \in \mathbb{R}^{n}.
$$

We will call such a function an absolutely symmetric function. It is easy to show that $f$ is absolutely symmetric if and only if there exists a function $g : \mathbb{R}_{+}^{n}(- \infty, \infty]$ such that $f(\mathbf{x}) = g(| \mathbf{x} |)$ for all $\mathbf{x} \in \mathbb{R}^{n}$ ■

Example 7.4 (norm-dependent functions). A proper function $f : \mathbb { R } ^ { n } $ $(- \infty, \infty]$ is symmetric w.r.t. $\b{\mathcal{A}} = \mathbb{O}^{n}$ if and only if

$$
f(\mathbf{x}) = f(\mathbf{Ux}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}, \mathbf{U} \in \mathbb{O}^{n}.
$$

The above holds if and only if there exists a proper function $g : \mathbb{R}(- \infty, \infty]$ such that

$$
f(\mathbf{x}) = g \left(\| \mathbf{x} \|_{2}\right) \text{for all} \mathbf{x} \in \mathbb{R}^{n}.
$$

A function satisfying the above is called a norm-dependent function.

We will require some additional notation before describing the next two examples. For a given vector $\mathbf{x} \in \mathbb{R}^{n}$ , the vector $\mathbf{x}^{\downarrow}$ is the vector x reordered nonincreasingly. For example, if $\mathbf{x} =(2, - 9, 2, 10)^{T}$ , then $\mathbf{x}^{\downarrow} =(10, 2, 2, - 9)^{T}$

Definition 7.5 (permutation matrices). An $n \times n$ matrix is called a permutation matrix if all its components are either 0 or 1 and each row and each column has exactly one nonzero element. The set of all $n \times n$ permutation matrices is denoted by $\Lambda_{n}$

Definition 7.6 (generalized permutation matrices). An $n \times n$ matrix is called a generalized permutation matrix if all its components are either 0, 1, $or - 1$ and each row and each column has exactly one nonzero element. The set of all $n \times n$ generalized permutation matrices is denoted by $\Lambda_{n}^{\mathrm{G}}$

Thus, for example,

$$
\left(\begin{array}{ccc} 0 & 1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 1 \end{array} \right) \in \Lambda_{3}, \qquad \left(\begin{array}{ccc} 0 & - 1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & - 1 \end{array} \right) \in \Lambda_{3}^{\mathrm{G}}.
$$

By the definition of permutation and generalized permutation matrices, it is easy to see that for any $\mathbf{x} \in \mathbb{R}^{n}$ there exists a permutation matrix $\mathbb{P} \in \Lambda_{n}$ for which $\mathbf{Px} = \mathbf{x}^{\downarrow}$ and a generalized permutation matrix $\mathbf{Q} \in \Lambda_{n}^{\mathrm{G}}$ for which $\mathbf{Qx} = | \mathbf{x} |^{\downarrow}$ . It can be readily verified that permutation matrices, as well as generalized permutation matrices, are orthogonal.

Example 7.7 (permutation symmetric functions). A proper function $f$ : $\mathbb{R}^{n} \to(- \infty, \infty]$ is symmetric w.r.t. $\Lambda_{n}$ if and only if

$$
f(\mathbf{x}) = f(\mathbf{Px}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}, \mathbb{P} \in \Lambda_{n}.
$$

Such a function will be called a permutation symmetric function. It is easy to show that $f$ is permutation symmetric if and only if

$$
f(\mathbf{x}) = f(\mathbf{x}^{\downarrow}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}.
$$

Example 7.8 (absolutely permutation symmetric functions). A proper function $f : \mathbb{R}^{n}(- \infty, \infty]$ is symmetric w.r.t. $\Lambda_{n}^{\mathrm{G}}$ if and only if

$$
f(\mathbf{x}) = f(\mathbf{Px}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}, \mathbb{P} \in \Lambda_{n}^{\mathrm{G}}.
$$

Such a function will be called an absolutely permutation symmetric function. It is easy to show that f is absolutely permutation symmetric if and only if

$$
f(\mathbf{x}) = f(| \mathbf{x} |^{\downarrow}) \text{for all} \mathbf{x} \in \mathbb{R}^{n}.
$$

## 7.1.2 The Symmetric Conjugate Theorem

We will now show that the conjugate of a symmetric function w.r.t. a set of orthog onal matrices is always symmetric w.r.t. the same set of matrices.

Theorem 7.9 (symmetric conjugate theorem).<sup>36</sup> Let $f : \mathbb{R}^{n}(- \infty, \infty]$ be a proper function which is symmetric w.r.t. a set of orthogonal matrices ${\mathcal{A}} \subseteq \mathbb{O}^{n}$ Then $f^{*}$ is symmetric w.r.t. A.

Proof. Let $\mathbf{A} \in \mathcal{A}$ . Then by the symmetry assumption, $h = f$ , where $h(\mathbf{x}) \equiv$ $f(\mathbf{Ax})$ . Thus,

$$
f^{*}(\mathbf{y}) = h^{*}(\mathbf{y}) \text{for all} \mathbf{y} \in \mathbb{R}^{n}.\tag{7.1}
$$

By Theorem 4.13 and the orthogonality of $\mathbf{A},$ , for any $\mathbf{y} \in \mathbb{R}^{n}$

$$
h^{*}(\mathbf{y}) = f^{*}((\mathbf{A}^{T})^{- 1} \mathbf{y}) = f^{*}(\mathbf{A} \mathbf{y}),
$$

which, combined with (7.1), yields

$$
f^{*}(\mathbf{y}) = f^{*}(\mathbf{Ay}) \text{for all} \mathbf{y} \in \mathbb{R}^{n}.
$$

Since the above holds for any $\mathbf A \in{\mathcal A}$ , it follows that $f^{*}$ is symmetric w.r.t. A.

Example 7.10. In this example we will illustrate the symmetric conjugate theorem by verifying that the types of symmetries satisfied by the functions in the table of Section 4.4.16 also hold for their conjugates.

- even functions

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td> $f^{*}(\mathbf{y})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\frac{1}{p}|x|^p$ </td><td> $\mathbb{R}$ </td><td> $\frac{1}{q}|y|^q$ </td><td> $p > 1, \frac{1}{p} + \frac{1}{q} = 1$ </td><td>Section 4.4.4</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^T\mathbf{A}\mathbf{x} + c$ </td><td> $\mathbb{R}^n$ </td><td> $\frac{1}{2}\mathbf{y}^T\mathbf{A}^{-1}\mathbf{y} - c$ </td><td> $\mathbf{A} \in \mathbb{S}_{++}^n, c \in \mathbb{R}$ </td><td>Section 4.4.6</td></tr></table>

- permutation symmetric functions

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td> $f^{*}(\mathbf{y})$ </td><td>Reference</td></tr><tr><td> $\sum_{i=1}^{n} x_{i} \log x_{i}$ </td><td> $\mathbb{R}_{+}^{n}$ </td><td> $\sum_{i=1}^{n} e^{y_{i}-1}$ </td><td>Section 4.4.8</td></tr><tr><td> $\sum_{i=1}^{n} x_{i} \log x_{i}$ </td><td> $\Delta_{n}$ </td><td> $\log\left(\sum_{i=1}^{n} e^{y_{i}}\right)$ </td><td>Section 4.4.10</td></tr><tr><td> $\log\left(\sum_{i=1}^{n} e^{x_{i}}\right)$ </td><td> $\mathbb{R}^{n}$ </td><td> $\sum_{i=1}^{n} y_{i} \log y_{i}$  $(\text{dom}(f^{*}) = \Delta_{n})$ </td><td>Section 4.4.11</td></tr><tr><td> $\max_{i}\{x_{i}\}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\delta_{\Delta_{n}}(\mathbf{y})$ </td><td>Example 4.10</td></tr></table>

<sub>36</sub>The symmetric conjugate theorem (Theorem 7.9) is from Rockafellar [108, Corollary 12.3.1].

- absolutely permutation symmetric functions

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td> $f^{*}(\mathbf{y})$ </td><td>Reference</td></tr><tr><td> $\| \mathbf{x}\|_{p}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\delta_{B_{\|\cdot\|_{q}}[\mathbf{0},1]}(\mathbf{y})$ </td><td>Section 4.4.12</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_{p}^{2}$ </td><td> $\mathbb{E}$ </td><td> $\frac{1}{2}\|\mathbf{y}\|_{q}^{2}$ </td><td>Section 4.4.15</td></tr></table>

where $\begin{array}{r}{p, q \in[1, \infty], \frac{1}{p} + \frac{1}{q} = 1} \end{array}$ (with the convention that if $p = 1, \infty$ , then $q = \infty, 1$ respectively).

## • norm-dependent functions

<table><tr><td>f</td><td>dom(f)</td><td> $f^*$ </td><td>Reference</td></tr><tr><td> $\| \mathbf{x} \|_2$ </td><td> $\mathbb{R}^n$ </td><td> $\delta_{B_{\|\cdot\|_2}[0,1]}(\mathbf{y})$ </td><td>Section 4.4.12</td></tr><tr><td> $-\sqrt{\alpha^2 - \| \mathbf{x} \|_2^2}_{(\alpha >0)}$ </td><td> $B_{\|\cdot\|_2}[\mathbf{0},\alpha]$ </td><td> $\alpha\sqrt{\|\mathbf{y}\|_2^2 + 1}$ </td><td>Section 4.4.13</td></tr><tr><td> $\sqrt{\alpha^2 + \| \mathbf{x} \|_2^2}_{(\alpha >0)}$ </td><td> $\mathbb{R}^n$ </td><td> $-\alpha\sqrt{1 - \| \mathbf{y}\|_2^2}_{(\text{dom}f^* = B_{\|\cdot\|_2}[0,1])}$ </td><td>Section 4.4.14</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_2^2$ </td><td> $\mathbb{R}^n$ </td><td> $\frac{1}{2}\|\mathbf{y}\|_2^2$ </td><td>Section 4.4.15</td></tr></table>

## 7.2 Symmetric Spectral Functions over $\mathbb{S}^{n^{37}}$

The main concern of this chapter are functions of matrices that are defined on either the set of symmetric matrices $\mathbb{S}^{n}$ or the set of matrices $\mathbb{R}^{m \times n}$ . We will deal only with functions that depend either on the eigenvalues of their argument (if the underlying space is $\mathbb{S}^{n})$ or on the singular values (if the underlying space is $\mathbb{R}^{m \times n})$ Such functions are called spectral functions. We first consider functions over <sup>Sn</sup>. Given a matrix $\mathbf{X} \in \mathbb{S}^{n}$ , its eigenvalues ordered nonincreasingly are denoted by

$$
\lambda_{1}(\mathbf{X}) \geq \lambda_{2}(\mathbf{X}) \geq \dots \geq \lambda_{n}(\mathbf{X}).
$$

The eigenvalues function $\pmb{\lambda} : \mathbb{S}^{n} \mathbb{R}^{n}$ is defined as

$$
\boldsymbol{\lambda}(\mathbf{X}) \equiv(\lambda_{1}(\mathbf{X}), \lambda_{2}(\mathbf{X}), \dots, \lambda_{n}(\mathbf{X}))^{T}.
$$

A key fact from linear algebra is that any symmetric matrix $\mathbf{X} \in \mathbb{S}^{n}$ has a spectral decomposition, meaning an orthogonal matrix $\mathbf{U} \in \mathbb{O}^{n}$ for which $\mathbf{X} = \mathbf{U} \operatorname{diag}(\lambda(\mathbf{X})) \mathbf{U}^{T}$ We begin by formally defining the notion of spectral functions over $\mathbb{S}^{n}$

Definition 7.11 (spectral functions over $\mathbb{S}^{n})$ . A proper function $g : { \mathbb { S } } ^ { n } $ $(- \infty, \infty]$ is called a spectral function over $\mathbb{S}^{n}$ if there exists a proper function $f : \mathbb{R}^{n}(- \infty, \infty]$ for which $g = f \circ \lambda$

If $g = f \circ \lambda$ , we will refer to $f$ (which is actually not necessarily unique) as the associated function. Our main interest will be to study spectral functions whose associated functions are permutation symmetric.

Definition 7.12 (symmetric spectral functions over $\mathbb{S}^{n})$ . A proper function $f : \mathbb{S}^{n}(- \infty, \infty]$ is called a symmetric spectral function over $\mathbb{S}^{n}$ if there exists a proper permutation symmetric function $f : \mathbb{R}^{n}(- \infty, \infty]$ for which $g =$ $f \circ \lambda$

Example 7.13. Following is a list of permutation symmetric functions along with their associated symmetric spectral functions.

<table><tr><td>#</td><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td> $f(\boldsymbol{\lambda}(\mathbf{X}))$ </td><td> $\text{dom}(f \circ \boldsymbol{\lambda})$ </td></tr><tr><td>1</td><td> $\sum_{i=1}^{n} x_i$ </td><td> $\mathbb{R}^n$ </td><td> $\text{Tr}(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>2</td><td> $\max_{i=1,2,\ldots,n} x_i$ </td><td> $\mathbb{R}^n$ </td><td> $\lambda_{\text{max}}(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>3</td><td> $\alpha \| \mathbf{x} \|_2(\alpha \in \mathbb{R})$ </td><td> $\mathbb{R}^n$ </td><td> $\alpha \| \mathbf{X} \|_F$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>4</td><td> $\alpha \| \mathbf{x} \|_2^2(\alpha \in \mathbb{R})$ </td><td> $\mathbb{R}^n$ </td><td> $\alpha \| \mathbf{X} \|_F^2$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>5</td><td> $\alpha \| \mathbf{x} \|_\infty(\alpha \in \mathbb{R})$ </td><td> $\mathbb{R}^n$ </td><td> $\alpha \| \mathbf{X} \|_{2,2}$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>6</td><td> $\alpha \| \mathbf{x} \|_1(\alpha \in \mathbb{R})$ </td><td> $\mathbb{R}^n$ </td><td> $\alpha \| \mathbf{X} \|_{S_1}$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td>7</td><td> $-\sum_{i=1}^{n} \log(x_i)$ </td><td> $\mathbb{R}_{++}^n$ </td><td> $-\log \det(\mathbf{X})$ </td><td> $\mathbb{S}_{++}^n$ </td></tr><tr><td>8</td><td> $\sum_{i=1}^{n} x_i \log(x_i)$ </td><td> $\mathbb{R}_+^n$ </td><td> $\sum_{i=1}^{n} \lambda_i(\mathbf{X}) \log(\lambda_i(\mathbf{X}))$ </td><td> $\mathbb{S}_+^n$ </td></tr><tr><td>9</td><td> $\sum_{i=1}^{n} x_i \log(x_i)$ </td><td> $\Delta_n$ </td><td> $\sum_{i=1}^{n} \lambda_i(\mathbf{X}) \log(\lambda_i(\mathbf{X}))$ </td><td> $\Upsilon_n$ </td></tr></table>

The domain of the last function in the above table is the spectahedron set given by

$$
\Upsilon_{n} = \{\mathbf{X} \in \mathbb{S}_{+}^{n}: \operatorname{Tr}(\mathbf{X}) = 1\}.
$$

The norm used in the sixth function is the Schatten 1-norm whose expression for symmetric matrices is given by

$$
\| \mathbf{X} \|_{S_{1}} = \sum_{i = 1}^{n} | \lambda_{i}(\mathbf{X}) |, \quad \mathbf{X} \in \mathbb{S}^{n}.
$$

Schatten p-norms will be discussed in detail in Section 7.3

A fundamental inequality that will be a key argument in establishing the main results of this section is the so-called Fan inequality stating that the inner product of two symmetric matrices is upper bounded by the inner product of their eigenvalues vectors and that equality holds if and only if the two matrices are simultaneously orthogonally diagonalizable.

Theorem 7.14 (Fan’s Inequality [32, 119]). For any two symmetric matrices X, $\mathbf{Y} \in \mathbb{S}^{n}$ it holds that

$$
\operatorname{Tr}(\mathbf{XY}) \leq \langle \boldsymbol{\lambda}(\mathbf{X}), \boldsymbol{\lambda}(\mathbf{Y}) \rangle,
$$

and equality holds if and only if there exists $\mathbf{V} \in \mathbb{O}^{n}$ for which

$$
\mathbf{X} = \mathbf{V} \operatorname{diag}(\lambda(\mathbf{X})) \mathbf{V}^{T},
$$

$$
\mathbf{Y} = \mathbf{V} \operatorname{diag}(\lambda(\mathbf{Y})) \mathbf{V}^{T}.
$$

## 7.2.1 The Spectral Conjugate Formula

A rather direct result of Fan’s inequality is the spectral conjugate formula that shows how to compute the conjugate of a symmetric spectral function over $\mathbb{S}^{n}$ in terms of the conjugate of its associated function.

Theorem 7.15 (spectral conjugate formula over $\mathbb{S}^{n})$ . Let $f : \mathbb{E} \to(- \infty, \infty]$ be a permutation symmetric function. Then

$$
(f \circ \boldsymbol{\lambda})^{*} = f^{*} \circ \boldsymbol{\lambda}.
$$

Proof. Let $\mathbf{Y} \in \mathbb{S}^{n}$ . Then

$$
\begin{array}{l}(f \circ \boldsymbol{\lambda})^{*}(\mathbf{Y}) = \max_{\mathbf{X} \in \mathbb{S}^{n}} \{\mathrm{Tr}(\mathbf{XY}) - f(\boldsymbol{\lambda}(\mathbf{X}))\} \\ \qquad \leq \max_{\mathbf{X} \in \mathbb{S}^{n}} \{\langle \boldsymbol{\lambda}(\mathbf{X}), \boldsymbol{\lambda}(\mathbf{Y}) \rangle - f(\boldsymbol{\lambda}(\mathbf{X}))\} \\ \qquad \leq \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\langle \mathbf{x}, \boldsymbol{\lambda}(\mathbf{Y}) \rangle - f(\mathbf{x})\} \\ \qquad =(f^{*} \circ \boldsymbol{\lambda})(\mathbf{Y}), \end{array}
$$

where Fan’s inequality (Theorem 7.14) was used in the first inequality. To show the reverse inequality, take a spectral decomposition of Y:

$$
\mathbf{Y} = \mathbf{U} \operatorname{diag}(\boldsymbol{\lambda}(\mathbf{Y})) \mathbf{U}^{T}(\mathbf{U} \in \mathbb{O}^{n}).
$$

Then

$$
\begin{array}{l}(f^{*} \circ \boldsymbol{\lambda})(\mathbf{Y}) = \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\langle \mathbf{x}, \boldsymbol{\lambda}(\mathbf{Y}) \rangle - f(\mathbf{x})\} \\ \qquad = \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\mathrm{Tr}(\operatorname{diag}(\mathbf{x}) \operatorname{diag}(\boldsymbol{\lambda}(\mathbf{Y})) - f(\mathbf{x})\} \\ \qquad = \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\mathrm{Tr}(\operatorname{diag}(\mathbf{x}) \mathbf{U}^{T} \mathbf{Y} \mathbf{U}) - f(\mathbf{x}^{\downarrow})\} \\ \qquad = \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\mathrm{Tr}(\operatorname{diag}(\mathbf{x}) \mathbf{U}^{T} \mathbf{Y} \mathbf{U}) - f(\boldsymbol{\lambda}(\mathbf{U} \operatorname{diag}(\mathbf{x}) \mathbf{U}^{T}))\} \\ \qquad = \max_{\mathbf{x} \in \mathbb{R}^{n}} \{\mathrm{Tr}(\mathbf{U} \operatorname{diag}(\mathbf{x}) \mathbf{U}^{T} \mathbf{Y}) - f(\boldsymbol{\lambda}(\mathbf{U} \operatorname{diag}(\mathbf{x}) \mathbf{U}^{T}))\} \\ \qquad \leq \max_{\mathbf{Z} \in \mathbb{S}^{n}} \{\mathrm{Tr}(\mathbf{ZY}) - f(\boldsymbol{\lambda}(\mathbf{Z}))\} \\ \qquad =(f \circ \boldsymbol{\lambda})^{*}(\mathbf{Y}).\quad \square \end{array}
$$

Example 7.16. Using the spectral conjugate formula, we can compute the conjugates of the functions from the table of Example 7.13. The conjugates appear in the following table, which also includes references to the corresponding results for functions over $\mathbb{R}^{n}$ . The numbering is the same as in the table of Example 7.13.

7.2. Symmetric Spectral Functions over $\mathbb{S}^{n}$

<table><tr><td>#</td><td>g(X)</td><td>dom(g)</td><td>g*(Y)</td><td>dom(g*)</td><td>Reference</td></tr><tr><td>1</td><td> $\text{Tr}(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{\{\mathbf{I}\}}(\mathbf{Y})$ </td><td> $\{\mathbf{I}\}$ </td><td>Section 4.4.7</td></tr><tr><td>2</td><td> $\lambda_{\max}(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{\Upsilon_n}(\mathbf{Y})$ </td><td> $\Upsilon_n$ </td><td>Example 4.10</td></tr><tr><td>3</td><td> $\alpha\|\mathbf{X}\|_F(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_F}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_F}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr><tr><td>4</td><td> $\alpha\|\mathbf{X}\|_F^2(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\frac{1}{4\alpha}\|\mathbf{Y}\|_F^2$ </td><td> $\mathbb{S}^n$ </td><td>Section 4.4.6</td></tr><tr><td>5</td><td> $\alpha\|\mathbf{X}\|_{2,2}(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr><tr><td>6</td><td> $\alpha\|\mathbf{X}\|_{S_1}(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_{2,2}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{2,2}}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr><tr><td>7</td><td> $-\log \det(\mathbf{X})$ </td><td> $\mathbb{S}_{++}^n$ </td><td> $-n-\log \det(-\mathbf{Y})$ </td><td> $\mathbb{S}_{--}^n$ </td><td>Section 4.4.9</td></tr><tr><td>8</td><td> $\sum_{i=1}^{n}\lambda_i(\mathbf{X})\log(\lambda_i(\mathbf{X}))$ </td><td> $\mathbb{S}_+^n$ </td><td> $\sum_{i=1}^{n}e^{\lambda_i(\mathbf{Y})-1}$ </td><td> $\mathbb{S}^n$ </td><td>Section 4.4.8</td></tr><tr><td>9</td><td> $\sum_{i=1}^{n}\lambda_i(\mathbf{X})\log(\lambda_i(\mathbf{X}))$ </td><td> $\Upsilon_n$ </td><td> $\log\left(\sum_{i=1}^{n}e^{\lambda_i(\mathbf{Y})}\right)$ </td><td> $\mathbb{S}^n$ </td><td>Section 4.4.10</td></tr></table>

The spectral conjugate formula has several important consequences, one of which is the following theorem stating that a symmetric spectral function is closed and convex if and only if its associated function is closed and convex.

Theorem 7.17 (closedness and convexity of symmetric spectral functions over $\mathbb{S}^{n})$ . Let $F : \mathbb{S}^{n}(- \infty, \infty]$ be given by $F = f \circ \lambda$ , where $f : \mathbb{R}^{n}(- \infty, \infty]$ is a permutation symmetric proper function. Then F is closed and convex $if$ and only if f is closed and convex.

Proof. By the spectral conjugate formula (Theorem 7.15),

$$
F^{*} =(f \circ \boldsymbol{\lambda})^{*} = f^{*} \circ \boldsymbol{\lambda}.
$$

Since by the symmetric conjugate theorem (Theorem 7.9) $f^{*}$ is permutation symmetric, we can invoke once again the spectral conjugate formula to obtain

$$
F^{* *} =(f^{*} \circ \boldsymbol{\lambda})^{*} = f^{* *} \circ \boldsymbol{\lambda}.\tag{7.2}
$$

If f is closed and convex, then by Theorem 4.8 (taking also into account the properness of $f)$ , it follows that $f^{* *} = f$ . Therefore, by (7.2),

$$
F^{* *} = f \circ \boldsymbol{\lambda} = F.
$$

Thus, since $F$ is a conjugate of another function $(F^{*})$ , it follows by Theorem 4.3 that it is closed and convex. Now assume that F is closed and convex. Since F is in addition proper, it follows by Theorem 4.8 that $F^{* *} = F$ , which, combined with (7.2), yields the equality

$$
f \circ \boldsymbol{\lambda} = F = F^{* *} = f^{* *} \circ \boldsymbol{\lambda}.
$$

Therefore, for any $\mathbf{x} \in \mathbb{R}^{n}$

$$
f(\mathbf{x}^{\downarrow}) = f(\boldsymbol{\lambda}(\operatorname{diag}(\mathbf{x}))) = f^{* *}(\boldsymbol{\lambda}(\operatorname{diag}(\mathbf{x}))) = f^{* *}(\mathbf{x}^{\downarrow}).
$$

By the permutation symmetry property of both $f$ and $f^{* *}$ , it follows that $f(\mathbf{x}^{\downarrow}) =$ $f(\mathbf{x})$ and $f^{* *}({\bf x}^{\downarrow}) = f^{* *}({\bf x})$ , and we thus obtained that $f({\bf x}) = f^{* *}({\bf x})$ for any $\mathbf{x} \in \mathbb{R}^{n}$ , meaning that $f = f^{* *}$ . Therefore, $f,$ as a conjugate of another function $(f^{\ast})$ is closed and convex.

## 7.2.2 The Proximal Operator of Symmetric Spectral Functions over $\mathbb{S}^{n}$

The next result shows a simple formula for computing the prox operator of a symmetric spectral function over $\mathbb{S}^{n}$ which is also proper closed and convex. The prox is expressed in terms of the spectral decomposition of the argument and the prox operator of the associated function.

Theorem 7.18 (spectral prox formula over $\mathbb{S}^{n})$ . Let $F : \mathbb{S}^{n}(- \infty, \infty]$ be given by $F = f \circ \lambda$ , where $f : \mathbb{R}^{n}(- \infty, \infty]$ is a permutation symmetric proper closed and convex function. Let $\mathbf{X} \in \mathbb{S}^{n}$ , and suppose that $\mathbf{X} = \bar{\mathbf{U}} \operatorname{diag}(\lambda(\mathbf{X})) \bar{\mathbf{U}}^{T}$ where $\mathbf{U} \in \mathbb{O}^{n}$ . Then

$$
\operatorname{prox}_{F}(\mathbf{X}) = \mathbf{U} \text{diag}(\operatorname{prox}_{f}(\boldsymbol{\lambda}(\mathbf{X}))) \mathbf{U}^{T}.
$$

Proof. Recall that

$$
\operatorname{prox}_{F}(\mathbf{X}) = \operatorname{argmin}_{\mathbf{Z} \in \mathbb{S}^{n}} \left\{F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{X} \|_{F}^{2} \right\}.\tag{7.3}
$$

Denoting $\mathbf{D} = \operatorname{diag}(\lambda(\mathbf{X}))$ , we note that for any $\mathbf{Z} \in \mathbb{S}^{n}$

$$
F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{X} \|_{F}^{2} = F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{UDU}^{T} \|_{F}^{2} \stackrel{(*)}{=} F(\mathbf{U}^{T} \mathbf{ZU}) + \frac{1}{2} \| \mathbf{U}^{T} \mathbf{ZU} - \mathbf{D} \|_{F}^{2},
$$

where the transition $(*)$ is due to the fact that $F(\mathbf{Z}) = f(\lambda(\mathbf{Z})) = f(\lambda(\mathbf{U}^{T} \mathbf{Z} \mathbf{U})) =$ ${\cal F}({\bf U}^{T}{\bf ZU})$ . Making the change of variables $\mathbf{W} = \mathbf{U}^{T} \mathbf{Z} \mathbf{U}$ , we conclude that the optimal solution of (7.3) is given by

$$
\mathbf{Z} = \mathbf{UW}^{*} \mathbf{U}^{T},\tag{7.4}
$$

where $\mathbf{W}^{*} \in \mathbb{S}^{n}$ is the unique optimal solution of

$$
\min_{\mathbf{W} \in \mathbb{S}^{n}} \left\{G(\mathbf{W}) \equiv F(\mathbf{W}) + \frac{1}{2} \| \mathbf{W} - \mathbf{D} \|_{F}^{2} \right\}.\tag{7.5}
$$

We will prove that $\mathbf{W}^{*}$ is diagonal. Let $i \in \{1, 2, \ldots, n\}$ . Take $\mathbf{V}_{i}$ to be the diagonal matrix whose diagonal elements are all ones except for the $(i, i)$ th component, which is −1. Define $\widetilde{\mathbf{W}}_{i} = \mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T}$ . Obviously, by the fact that $\mathbf{V}_{i} \in \mathbb{O}^{n}$

$$
F(\mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T}) = f(\boldsymbol{\lambda}(\mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T})) = f(\boldsymbol{\lambda}(\mathbf{W}^{*})) = F(\mathbf{W}^{*}),
$$

and we thus obtain

$$
\begin{array}{rcl} G(\widetilde{\mathbf{W}}_{i}) & = & F(\widetilde{\mathbf{W}}_{i}) + \frac{1}{2} \| \widetilde{\mathbf{W}}_{i} - \mathbf{D} \|_{F}^{2} \\ & = & F(\mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T}) + \frac{1}{2} \| \mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T} - \mathbf{D} \|_{F}^{2} \\ & = & F(\mathbf{W}^{*}) + \frac{1}{2} \| \mathbf{W}^{*} - \mathbf{V}_{i}^{T} \mathbf{DV}_{i} \|_{F}^{2} \\ & \stackrel{(* *)}{=} & F(\mathbf{W}^{*}) + \frac{1}{2} \| \mathbf{W}^{*} - \mathbf{D} \|_{F}^{2}, \\ & = & G(\mathbf{W}^{*}), \end{array}
$$

where (\*\*) follows from the fact that $\mathbf{V}_{i}$ and D are both diagonal, and hence $\mathbf{V}_{i}^{T} \mathbf{D} \mathbf{V}_{i} = \mathbf{V}_{i}^{T} \mathbf{V}_{i} \mathbf{D} = \mathbf{D}$ . We conclude that $\widetilde{\mathbf{W}}_{i}$ is also an optimal solution, but by the uniqueness of the optimal solution of problem (7.5), it follows that $\mathbf{W^{*}} =$ $\mathbf{V}_{i} \mathbf{W}^{*} \mathbf{V}_{i}^{T}$ . Comparing the ith rows of the two matrices, we deduce that $W_{ij}^{*} = 0$ for any $j \neq i$ . Since this argument is valid for any $i \in \{1, 2, \ldots, n\}$ , it follows that $\mathbf{W}^{*}$ is a diagonal matrix, and consequently the optimal solution of (7.5) is given by $\mathbf{W^{*}} = \operatorname{diag}(\mathbf{w}^{*})$ , where $\mathbf{w}^{*}$ is the optimal solution of

$$
\min_{\mathbf{w}} \left\{F(\operatorname{diag}(\mathbf{w})) + \frac{1}{2} \| \operatorname{diag}(\mathbf{w}) - \mathbf{D} \|_{F}^{2} \right\}.
$$

Since $F(\operatorname{diag}(\mathbf{w})) = f(\mathbf{w}^{\downarrow}) = f(\mathbf{w}) \mathrm{and} \| \operatorname{diag}(\mathbf{w}) - \mathbf{D} \|_{F}^{2} = \| \mathbf{w} - \pmb{\lambda}(\mathbf{X}) \|_{2}^{2}$ , it follows that $\mathbf{w}^{*}$ is given by

$$
\mathbf{w}^{*} = \operatorname{argmin}_{\mathbf{w}} \left\{f(\mathbf{w}) + \frac{1}{2} \| \mathbf{w} - \boldsymbol{\lambda}(\mathbf{X}) \|_{2}^{2} \right\} = \operatorname{prox}_{f}(\boldsymbol{\lambda}(\mathbf{X})).
$$

Therefore, $\mathbf{W}^{*} = \operatorname{diag}(\mathrm{prox}_{f}(\boldsymbol{\lambda}(\mathbf{X})))$ , which, along with (7.4), establishes the desired result.

Example 7.19. Using the spectral prox formula, we can compute the prox of symmetric spectral functions in terms of the prox of their associated functions. Using this observation, we present in the table below expressions of prox operators of several functions. The parameter $\alpha$ is always assumed to be positive, and U is assumed to be an orthogonal matrix satisfying $\mathbf{X} = \mathbf{U} \operatorname{diag}(\lambda(\mathbf{X})) \mathbf{U}^{T}$ . The table also includes references to the corresponding results for the associated functions, which are always defined over $\mathbb{R}^{n}$

<table><tr><td> $F(\mathbf{X})$ </td><td> $\text{dom}(F)$ </td><td> $\text{prox}_F(\mathbf{X})$ </td><td>Reference</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F^2$ </td><td> $\mathbb{S}^n$ </td><td> $\frac{1}{1+2\alpha}\mathbf{X}$ </td><td>Section 6.2.3</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F$ </td><td> $\mathbb{S}^n$ </td><td> $\left(1-\frac{\alpha}{\max\{\| \mathbf{X}\|_F,\alpha\}}\right)\mathbf{X}$ </td><td>Example 6.19</td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_1}$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\mathcal{T}_{\alpha}(\boldsymbol{\lambda}(\mathbf{X})))\mathbf{U}^T$ </td><td>Example 6.8</td></tr><tr><td> $\alpha\|\mathbf{X}\|_{2,2}$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\boldsymbol{\lambda}(\mathbf{X})-\alpha P_{B_{\|\cdot\|_1}[0,1]}(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T$ </td><td>Example 6.48</td></tr><tr><td> $-\alpha\log\det(\mathbf{X})$ </td><td> $\mathbb{S}_{++}^n$ </td><td> $\mathbf{Udiag}\left(\frac{\lambda_j(\mathbf{X})+\sqrt{\lambda_j(\mathbf{X})^2+4\alpha}}{2}\right)\mathbf{U}^T$ </td><td>Example 6.9</td></tr><tr><td> $\alpha\lambda_1(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\boldsymbol{\lambda}(\mathbf{X})-\alpha P_{\Delta_n}(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T$ </td><td>Example 6.49</td></tr><tr><td> $\alpha\sum_{i=1}^{k}\lambda_i(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{X}-\alpha\mathbf{Udiag}(P_C(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T,$  $C = H_{\mathbf{e},k} \cap \text{Box}[\mathbf{0},\mathbf{e}]$ </td><td>Example 6.50</td></tr></table>

A set $T \subseteq \mathbb{S}^{n}$ is called a symmetric spectral set in $\mathbb{S}^{n}$ if the indicator function $\delta_{T}$ is a symmetric spectral function over $\mathbb{S}^{n}$ , meaning that it has the form $\delta_{T} = \delta_{C} \circ \lambda$ 2 where $\delta_{C}$ is a permutation symmetric function. The set $C \subseteq \mathbb{R}^{n}$ is the associated set. Since $\mathrm{prox}_{\delta_{T}} = P_{T}$ and $\mathrm{prox}_{\delta_{C}} = P_{C}$ , it follows by the spectral prox formula that if C is nonempty closed and convex, then

$$
P_{T}(\mathbf{X}) = \mathbf{U} \operatorname{diag}(P_{C}(\boldsymbol{\lambda}(\mathbf{X}))) \mathbf{U}^{T}, \mathbf{X} \in \mathbb{S}^{n},\tag{7.6}
$$

where U is an orthogonal matrix satisfying $\mathbf{X} = \mathbf{U} \operatorname{diag}(\lambda(\mathbf{X})) \mathbf{U}^{T}$

Example 7.20. Using formula (7.6), we present in the following table expressions for the orthogonal projection onto several symmetric spectral sets in $\mathbb{S}^{n}$ . The table also includes references to the corresponding results on orthogonal projections onto the associated subsets of $\mathbb{R}^{n}$ . The matrix U is assumed to be an orthogonal matrix satisfying $\mathbf{X} = \mathbf{U} \operatorname{diag}(\lambda(\mathbf{X})) \mathbf{U}^{T}$

<table><tr><td>set (T)</td><td> $P_{T}(\mathbf{X})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\mathbb{S}_{+}^{n}$ </td><td> $\textbf{Udiag}([\boldsymbol{\lambda}(\mathbf{X})]_{+})\mathbf{U}^{T}$ </td><td>-</td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{X} : \ell \mathbf{I} \preceq \mathbf{X} \preceq u \mathbf{I}\}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T},$  $v_{i} = \min\{\max\{\lambda_{i}(\mathbf{X}), \ell\}, u\}$ </td><td> $\ell \leq u$ </td><td>Lemma 6.26</td></tr><tr><td> $B_{\parallel \cdot \|_{F}}[\mathbf{0}, r]$ </td><td> $\frac{r}{\max\{\| \mathbf{X}\|_{F}, r\}}\mathbf{X}$ </td><td> $r > 0$ </td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{X} : \text{Tr}(\mathbf{X}) \leq b\}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T}, \mathbf{v} = \boldsymbol{\lambda}(\mathbf{X}) - \frac{[\mathbf{e}^{T} \boldsymbol{\lambda}(\mathbf{X}) - b]_{+}}{n}\mathbf{e}$ </td><td> $b \in \mathbb{R}$ </td><td>Lemma 6.26</td></tr><tr><td> $\Upsilon_{n}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T}, \mathbf{v} =[\boldsymbol{\lambda}(\mathbf{X}) - \mu^{*}\mathbf{e}]_{+} \text{where} \mu^{*} \in \mathbb{R} \text{satisfies} \mathbf{e}^{T}[\boldsymbol{\lambda}(\mathbf{X}) - \mu^{*}\mathbf{e}]_{+} = 1$ </td><td>-</td><td>Corollary 6.29</td></tr><tr><td> $B_{\parallel \cdot \|_{S_1}}[\mathbf{0}, \alpha]$ </td><td> $\left\{\begin{array}{ll} \mathbf{X}, & \| \mathbf{X}\|_{S_1} \leq \alpha, \\ \textbf{Udiag}(\mathcal{T}_{\beta^{*}}(\boldsymbol{\lambda}(\mathbf{X})))\mathbf{U}^{T}, & \| \mathbf{X}\|_{S_1} > \alpha, \\ \| \mathcal{T}_{\beta^{*}}(\boldsymbol{\lambda}(\mathbf{X}))\|_{1} = \alpha, \beta^{*} > 0 \end{array} \right.$ </td><td> $\alpha > 0$ </td><td>Example 6.33</td></tr></table>

## 7.3 Symmetric Spectral Functions over $\mathbb{R}^{m \times n}$

Let $m, n$ be two positive integers and $r ~ = ~ \mathrm{min} \{m, n\}$ . We will denote by $\sigma :$ $\mathbb{R}^{m \times n} \mathbb{R}^{r}$ the singular values function that assigns to each matrix $\mathbf{X} \in \mathbb{R}$ m×n the vector of singular values $(\sigma_{1}({\mathbf{X}}), \sigma_{2}({\mathbf{X}}), \ldots, \sigma_{r}({\mathbf{X}}))^{T}$ , where $\sigma_{1}(\mathbf{X}) \geq \sigma_{2}(\mathbf{X}) \geq$ $\begin{array}{r}{\cdots \geq \sigma_{r}({\bf X}) \geq 0} \end{array}$ . We will also require the following notation. For a vector $\mathbf{v} \in \mathbb{R}^{r}$ ， the matrix $\mathrm{dg}(\mathbf{v})$ is the $m \times n$ matrix defined by

$$
\mathrm{dg}(\mathbf{v})_{i, j} = \left\{\begin{array}{ll} v_{i}, & i = j, \\ 0 & \text{else}.\end{array} \right.
$$

The operator $\deg(\cdot)$ maps r-dimensional vectors to $\mathrm{generalized}^{38} \m \ \times \n$ diagonal matrices. The integers m and $n$ (and hence also $r)$ will be fixed throughout this section, and hence there is no need to indicate their values in the operator dg. We do not use the $\mathrm{\ddot{\Phi} diag \mathrm{\uparrow}}$ notation since it is reserved to square diagonal matrices.

It is well known (see Golub and Van Loan [60, Theorem 2.5.2]) that any matrix $\mathbf{X} \in \mathbb{R}^{m \times n}$ has a singular value decomposition, meaning matrices $\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}$ for which ${\bf X} ={\bf U} d{\bf g}({\pmb \sigma}({\bf X})){\bf V}^{T}$

The analysis in this section uses very similar arguments to those used in the previous section; however, for the sake of completeness we will provide the results with their complete proofs.

We begin by formally defining the notion of spectral functions over $\mathbb{R}^{m \times n}$

Definition 7.21 (spectral functions over $\mathbb{R}^{m \times n})$ . A proper function $\textit{g} :$ $\mathbb{R}^{m \times n}(- \infty, \infty]$ is called a spectral function over $\mathbb{R}^{m \times n}$ if there exists a proper function $f : \mathbb{R}^{r}(- \infty, \infty]$ for which $g = f \circ \sigma$

Similarly to the notation in Section 7.2, if $g = f \circ \sigma$ , we will refer to $f$ (which is actually not necessarily unique) as the associated function. Our main interest will be with spectral functions whose associated functions are absolutely permutation symmetric.

Definition 7.22 (symmetric spectral functions over $\mathbb{R}^{m \times n})$ . A proper function $f ~ : ~ \mathbb{R}^{m \times n} ~ ~(- \infty, \infty]$ is called a symmetric spectral function over <sup>Rm</sup>×<sup>n</sup> if there exists a proper absolutely permutation symmetric function $f : \mathbb { R } ^ { r } $ $(- \infty, \infty]$ for which $g = f \circ \sigma$

Example 7.23 (Schatten p-norms). Let $p \in[1, \infty]$ . Then the Schatten p-norm is the norm defined by

$$
\| \mathbf{X} \|_{S_{p}} \equiv \| \boldsymbol{igma}(\mathbf{X}) \|_{p}, \mathbf{X} \in \mathbb{R}^{m \times n}.
$$

It is well $\mathrm{known^{39}}$ that $\| \cdot \|_{S_{p}}$ is indeed a norm for any $p \in[1, \infty]$ . Specific examples are the following:

- trace-norm (Schatten 1-norm)—also called the nuclear norm:

$$
\| \mathbf{X} \|_{S_{1}} = \sum_{i = 1}^{r} \sigma_{i}(\mathbf{X}).
$$

- spectral norm (Schatten ∞-norm):

$$
\| \mathbf{X} \|_{S_{\infty}} = \sigma_{1}(\mathbf{X}) = \| \mathbf{X} \|_{2, 2}.
$$

- Frobenius norm (Schatten 2-norm):

$$
\| \mathbf{X} \|_{S_{2}} = \sqrt{\sum_{i = 1}^{r} \sigma_{i}(\mathbf{X})^{2}} = \sqrt{\operatorname{Tr} \left(\mathbf{X}^{T} \mathbf{X}\right)}.
$$

The Schatten p-norm is a symmetric spectral function over $\mathbb{R}^{m \times n}$ whose associated function is the $l_{p}.$ -norm on $\mathbb{R}^{r}$ , which is obviously an absolutely permutation symmetric function.

Example 7.24 (Ky Fan k-norms). Recall the notation from Example 6.51— given a vector $\mathbf{x} \in \mathbb{R}^{r}, \x_{\langle i \rangle}$ is the component of x with the ith largest absolute value, meaning in particular that

$$
\left| x_{\langle 1 \rangle} \right| \geq \left| x_{\langle 2 \rangle} \right| \geq \dots \geq \left| x_{\langle r \rangle} \right|.
$$

The function $\begin{array}{r}{f_{k}(\mathbf{x}) = \sum_{i = 1}^{k} | x_{\langle i \rangle} |} \end{array}$ is an absolutely permutation symmetric function. The corresponding symmetric spectral function is the so-called $Ky$ Fan k-norm given by

$$
\| \mathbf{X} \|_{\langle k \rangle} = f_{k}(\sigma(\mathbf{X})) = \sum_{i = 1}^{k} \sigma_{i}(\mathbf{X}).
$$

Obviously, $\| \cdot \|_{\langle 1 \rangle}$ is the spectral norm, which is also the Schatten ∞-norm; the norm $\| \cdot \|_{\langle r \rangle}$ is the trace-norm, which is also the Schatten 1-norm. ■

A key inequality that is used in the analysis of spectral functions over $\mathbb{R}^{m \times n}$ is an inequality bounding the inner product of two matrices via the inner product of their singular vectors. The inequality, which is credited to von Neumann and is in a sense the $\mathbb{R}^{m \times n}$ -counterpart” of Fan’s inequality (Theorem 7.14).

Theorem 7.25 (von Neumann’s trace inequality [123]). For any two matrices $\mathbf{X}, \mathbf{Y} \in \mathbb{R}^{m \times n}$ , the inequality

$$
\langle \mathbf{X}, \mathbf{Y} \rangle \leq \langle \boldsymbol{igma}(\mathbf{X}), \boldsymbol{igma}(\mathbf{Y}) \rangle
$$

holds. Equality holds if and only if there exists a simultaneous nonincreasing singular value decomposition of X, Y, meaning that there exist $\mathbf{U} \in \mathbb{O}^{m}$ and $\mathbf{V} \in \mathbb{O}^{n}$ for which

$$
\begin{array}{r} \mathbf{X} = \mathbf{U} \mathrm{dg}(\pmb{\sigma}(\mathbf{X})) \mathbf{V}^{T}, \\ \mathbf{Y} = \mathbf{U} \mathrm{dg}(\pmb{\sigma}(\mathbf{Y})) \mathbf{V}^{T}.\end{array}
$$

## 7.3.1 The Spectral Conjugate Formula

A direct result of von Neumann’s trace inequality is the spectral conjugate formula over $\mathbb{R}^{m \times n}$

Theorem 7.26 (spectral conjugate formula over $\mathbb{R}^{m \times n})$ . Let $f : \mathbb { E } $ $(- \infty, \infty]$ be an absolutely permutation symmetric function. Then

$$
(f \circ \boldsymbol{igma})^{*} = f^{*} \circ \boldsymbol{igma}.
$$

Proof. Let $\mathbf{Y} \in \mathbb{R}^{m \times n}$ . Then

$$
\begin{array}{l}(f \circ \boldsymbol{igma})^{*}(\mathbf{Y}) = \max_{\mathbf{X} \in \mathbb{R}^{m \times n}} \{\mathrm{Tr}(\mathbf{XY}) - f(\boldsymbol{igma}(\mathbf{X}))\} \\ \quad \leq \max_{\mathbf{X} \in \mathbb{R}^{m \times n}} \{\langle \boldsymbol{igma}(\mathbf{X}), \boldsymbol{igma}(\mathbf{Y}) \rangle - f(\boldsymbol{igma}(\mathbf{X}))\} \\ \quad \leq \max_{\mathbf{x} \in \mathbb{R}^{r}} \{\langle \mathbf{x}, \boldsymbol{igma}(\mathbf{Y}) \rangle - f(\mathbf{x})\} \\ \quad =(f^{*} \circ \boldsymbol{igma})(\mathbf{Y}), \end{array}
$$

where Von Neumann’s trace inequality (Theorem 7.25) was used in the first inequality. To show the reverse inequality, take a singular value decomposition of Y:

$$
\mathbf{Y} = \mathbf{U} \mathrm{dg}(\boldsymbol{igma}(\mathbf{Y})) \mathbf{V}^{T}(\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}).
$$

Then

$$
\begin{array}{l}(f^{*} \circ \boldsymbol{igma})(\mathbf{Y}) = \underset{\mathbf{x} \in \mathbb{R}^{r}}{\max} \{\langle \mathbf{x}, \boldsymbol{igma}(\mathbf{Y}) \rangle - f(\mathbf{x})\} \\ \qquad = \underset{\mathbf{x} \in \mathbb{R}^{r}}{\max} \{\mathrm{Tr}(\mathrm{dg}(\mathbf{x})^{T} \mathrm{dg}(\boldsymbol{igma}(\mathbf{Y}))) - f(\mathbf{x})\} \\ \qquad = \underset{\mathbf{x} \in \mathbb{R}^{r}}{\max} \{\mathrm{Tr}(\mathrm{dg}(\mathbf{x})^{T} \mathbf{U}^{T} \mathbf{YV}) - f(\mathbf{x}^{\downarrow})\} \\ \qquad = \underset{\mathbf{x} \in \mathbb{R}^{r}}{\max} \{\mathrm{Tr}(\mathrm{dg}(\mathbf{x})^{T} \mathbf{U}^{T} \mathbf{YV}) - f(\boldsymbol{igma}(\mathbf{Udg}(\mathbf{x}) \mathbf{V}^{T}))\} \\ \qquad = \underset{\mathbf{x} \in \mathbb{R}^{r}}{\max} \{\mathrm{Tr}(\mathbf{Vdg}(\mathbf{x})^{T} \mathbf{U}^{T} \mathbf{Y}) - f(\boldsymbol{igma}(\mathbf{Udg}(\mathbf{x}) \mathbf{V}^{T}))\} \\ \qquad \leq \underset{\mathbf{Z} \in \mathbb{R}^{m \times n}}{\max} \{\mathrm{Tr}(\mathbf{Z}^{T} \mathbf{Y}) - f(\boldsymbol{igma}(\mathbf{Z}))\} \\ \qquad =(f \circ \boldsymbol{igma})^{*}(\mathbf{Y}).\quad \square \end{array}
$$

Example 7.27. Using the spectral conjugate formula over $\mathbb{R}^{m \times n}$ , we present below expressions for the conjugate functions of several symmetric spectral functions over $\mathbb{R}^{m \times n}$ (all with full domain). The table also includes the references to the corresponding results on functions over $\mathbb{R}^{r}$ . The constant α is assumed to be positive.

<table><tr><td>g(X)</td><td>dom(g)</td><td>g*(Y)</td><td>dom(g*)</td><td>Reference</td></tr><tr><td> $\alpha\sigma_1(\mathbf{X})(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_F}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_F}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F^2(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\frac{1}{4\alpha}\|\mathbf{Y}\|_F^2$ </td><td> $\mathbb{R}^{m\times n}$ </td><td>Section 4.4.6</td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_1}(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_{S_\infty}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{S_\infty}}[\mathbf{0},\alpha]$ </td><td>Section 4.4.12</td></tr></table>

The spectral conjugate formula can be used to show that a symmetric spectral function over $\mathbb{R}^{m \times n}$ is closed and convex if and only if its associated function is closed and convex.

Theorem 7.28 (closedness and convexity of symmetric spectral functions over $\mathbb{R}^{m \times n})$ . Let $F : \mathbb{R}^{m \times n}(- \infty, \infty]$ be given by $F = f \circ \sigma_{;}$ , where $f : \mathbb { R } ^ { r } $ $(- \infty, \infty]$ is an absolutely permutation symmetric proper function. Then F is closed and convex if and only if f is closed and convex.

Proof. By the spectral conjugate formula (Theorem 7.26),

$$
F^{*} =(f \circ \boldsymbol{igma})^{*} = f^{*} \circ \boldsymbol{igma}.
$$

Since by the symmetric conjugate theorem (Theorem 7.9) $f^{*}$ is absolutely permutation symmetric, we can invoke once again the spectral conjugate formula to obtain

$$
F^{* *} =(f^{*} \circ \boldsymbol{igma})^{*} = f^{* *} \circ \boldsymbol{igma}.\tag{7.7}
$$

If $f$ is closed and convex, then by Theorem 4.8 (taking also in account the properness of $f)$ it follows that $f^{* *} = f$ . Therefore, by (7.7),

$$
F^{* *} = f \circ \pmb{\sigma} = F.
$$

Thus, since $F$ is a conjugate of another function $(F^{*})$ , it follows by Theorem 4.3 that it is closed and convex. Now assume that $F$ is closed and convex. Since $F$ is in addition proper, it follows by Theorem 4.8 that $F^{* *} = F$ , which, combined with (7.7), yields the equality

$$
f \circ \boldsymbol{igma} = F = F^{* *} = f^{* *} \circ \boldsymbol{igma}.
$$

Therefore, for any $\mathbf{x} \in \mathbb{R}^{r}$

$$
f(| \mathbf{x} |^{\downarrow}) = f(\pmb{\sigma}(\mathrm{dg}(\mathbf{x}))) = f^{* *}(\pmb{\sigma}(\mathrm{dg}(\mathbf{x}))) = f^{* *}(| \mathbf{x} |^{\downarrow}).
$$

By the absolutely permutation symmetry property of both f and $f^{* *}$ , it follows that $f(| \mathbf{x} |^{\downarrow}) = f(\mathbf{x})$ and $f^{* *}(| \mathbf{x} |^{\downarrow}) = f^{* *}(\mathbf{x})$ , and therefore $f({\bf x}) = f^{* *}({\bf x})$ for any $\mathbf{x} \in \mathbb{R}^{r}$ , meaning that $f = f^{* *}$ . Therefore, $f,$ as a conjugate of another function $(f^{\ast})$ , is closed and convex.

## 7.3.2 The Proximal Operator of Symmetric Spectral Functions over <sup>Rm</sup>×<sup>n</sup>

The next result shows a simple formula for computing the prox operator of a symmetric spectral function over $\mathbb{R}^{m \times n}$ , which is also proper closed and convex. The prox is expressed in terms of the singular value decomposition of the argument and the prox operator of the associated function.

Theorem 7.29 (spectral prox formula over $\mathbb{R}^{m \times n})$ . Let $F : \mathbb{R}^{m \times n}(- \infty, \infty]$ be given by $F = f \circ \sigma$ , where $f : \mathbb{R}^{r}(- \infty, \infty]$ is an absolutely permutation symmetric proper closed and convex function. Let $\mathbf{X} \in \mathbb{R}^{m \times n}$ , and suppose that ${\bf X} ={\bf U} d{\bf g}({\pmb \sigma}({\bf X})){\bf V}^{T}$ , where $\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}$ . Then

$$
\operatorname{prox}_{F}(\mathbf{X}) = \mathbf{U} \mathrm{dg}(\operatorname{prox}_{f}(\boldsymbol{igma}(\mathbf{X}))) \mathbf{V}^{T}.
$$

Proof. Recall that

$$
\operatorname{prox}_{F}(\mathbf{X}) = \operatorname{argmin}_{\mathbf{Z} \in \mathbb{R}^{m \times n}} \left\{F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{X} \|_{F}^{2} \right\}.\tag{7.8}
$$

Denoting $\mathbf{D} = \deg(\pmb{\sigma}(\mathbf{X}))$ , we note that for any $\mathbf{Z} \in \mathbb{R}^{m \times n}$

$$
F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{X} \|_{F}^{2} = F(\mathbf{Z}) + \frac{1}{2} \| \mathbf{Z} - \mathbf{UDV}^{T} \|_{F}^{2} \overset{(*)}{=} F(\mathbf{U}^{T} \mathbf{ZV}) + \frac{1}{2} \| \mathbf{U}^{T} \mathbf{ZV} - \mathbf{D} \|_{F}^{2},
$$

where the transition $(*)$ is due to the fact that $F(\mathbf{Z}) = f(\pmb{\sigma}(\mathbf{Z})) = f(\pmb{\sigma}(\mathbf{U}^{T} \mathbf{Z} \mathbf{V})) =$ $F(\mathbf{U}^{T} \mathbf{Z} \mathbf{V})$ . Making the change of variables $\mathbf{W} = \mathbf{U}^{T} \mathbf{Z} \mathbf{V}$ , we conclude that the unique optimal solution of (7.8) is given by

$$
\mathbf{Z} = \mathbf{UW}^{*} \mathbf{V}^{T},\tag{7.9}
$$

where $\mathbf{W}^{*}$ is the unique optimal solution of

$$
\min_{\mathbf{W} \in \mathbb{R}^{m \times n}} \left\{G(\mathbf{W}) \equiv F(\mathbf{W}) + \frac{1}{2} \| \mathbf{W} - \mathbf{D} \|_{F}^{2} \right\}.\tag{7.10}
$$

We will prove that $\mathbf{W}^{*}$ is a generalized diagonal matrix (meaning that all ofdiagonal components are zeros). Let $i \in \{1, 2,..., r\}$ . Take $\pmb{\Sigma}_{i}^{(1)} \in \mathbb{R}^{m \times m}$ and $\pmb{\Sigma}_{i}^{(2)} \in \mathbb{R}^{n \times n}$ to be the $m \times m$ and $n \times n$ diagonal matrices whose diagonal elements are all ones except for the $(i, i) \mathrm{th}$ component, which is −1. Define $\widetilde{\mathbf{W}}_{i} =$ $\Sigma_{i}^{(1)} \mathbf{W}^{*} \Sigma_{i}^{(2)}$ . Obviously, by the fact that $\Sigma_{i}^{(1)} \in \mathbb{O}^{m}, \Sigma_{i}^{(2)} \in \mathbb{O}^{n}$ 2

$$
F(\pmb{\Sigma}_{i}^{(1)} \mathbf{W}^{*} \pmb{\Sigma}_{i}^{(2)}) = f(\pmb{\sigma}(\pmb{\Sigma}_{i}^{(1)} \mathbf{W}^{*} \pmb{\Sigma}_{i}^{(2)})) = f(\pmb{\sigma}(\mathbf{W}^{*})) = F(\mathbf{W}^{*}),
$$

and we thus obtain

$$
\begin{array}{rl} & G(\widetilde{\mathbf{W}}_{i}) = F(\widetilde{\mathbf{W}}_{i}) + \frac{1}{2} \| \widetilde{\mathbf{W}}_{i} - \mathbf{D} \|_{F}^{2} \\ & \qquad = F(\boldsymbol{\Sigma}_{i}^{(1)} \mathbf{W}^{*} \boldsymbol{\Sigma}_{i}^{(2)}) + \frac{1}{2} \| \boldsymbol{\Sigma}_{i}^{(1)} \mathbf{W}^{*} \boldsymbol{\Sigma}_{i}^{(2)} - \mathbf{D} \|_{F}^{2} \\ & \qquad = F(\mathbf{W}^{*}) + \frac{1}{2} \| \mathbf{W}^{*} - \boldsymbol{\Sigma}_{i}^{(1)} \mathbf{D} \boldsymbol{\Sigma}_{i}^{(2)} \|_{F}^{2} \\ & \qquad = F(\mathbf{W}^{*}) + \frac{1}{2} \| \mathbf{W}^{*} - \mathbf{D} \|_{F}^{2}, \\ & \qquad = G(\mathbf{W}^{*}).\end{array}
$$

Consequently, $\widetilde{\mathbf{W}}_{i}$ is also an optimal solution of (7.10), but by the uniqueness of the optimal solution of problem (7.10), we conclude that $\mathbf{W}^{*} = \Sigma_{i}^{(1)} \mathbf{W}^{*} \Sigma_{i}^{(2)}$ Comparing the ith rows and columns of the two matrices we obtain that $W_{ij}^{*} = 0$ and $W_{ji}^{*} = 0$ for any $j \neq i$ . Since this argument is valid for any $i \in \{1, 2,..., r\}$ it follows that $\mathbf{W}^{*}$ is a generalized diagonal matrix, and consequently the optimal solution of (7.10) is given by $\mathbf{W}^{*} = \mathrm{dg}(\mathbf{w}^{*})$ , where $\mathbf{w}^{*}$ is the optimal solution of

$$
\min_{\mathbf{w}} \left\{F(\mathrm{dg}(\mathbf{w})) + \frac{1}{2} \| \mathrm{dg}(\mathbf{w}) - \mathbf{D} \|_{F}^{2} \right\}.
$$

Since $F(\mathrm{dg}(\mathbf{w})) = f(| \mathbf{w} |^{4}) = f(\mathbf{w}) \mathrm{~ and ~} \| \mathrm{dg}(\mathbf{w}) - \mathbf{D} \|_{F}^{2} = \| \mathbf{w} - \pmb{\sigma}(\mathbf{X}) \|_{2}^{2}$ , it follows that $\mathbf{w}^{*}$ is given by

$$
\mathbf{w}^{*} = \operatorname{argmin}_{\mathbf{w}} \left\{f(\mathbf{w}) + \frac{1}{2} \| \mathbf{w} - \boldsymbol{igma}(\mathbf{X}) \|_{2}^{2} \right\} = \operatorname{prox}_{f}(\boldsymbol{igma}(\mathbf{X})).
$$

Therefore, $\mathbf{W}^{*} = d \mathbf{g}(\mathrm{prox}_{f}({\pmb \sigma}(\mathbf{X})))$ , which, along with (7.9), establishes the desired result.

Example 7.30. Using the spectral prox formula over $\mathbb{R}^{m \times n}$ , we can compute the prox of symmetric spectral functions in terms of the prox of their associated functions. Using this observation, we present in the table below expressions of prox operators of several functions. The parameter $\alpha$ is always assumed to be positive, and $\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}$ are assumed to satisfy ${\bf X} ={\bf U} d{\bf g}({\pmb \sigma}({\bf X})){\bf V}^{T}$ . The table also includes a reference to the corresponding results for the associated functions, which are always defined over $\mathbb{R}^{r}$

<table><tr><td>F(X)</td><td>prox $_{F}$ (X)</td><td>Reference</td></tr><tr><td>α||X|| $_{F}^{2}$ </td><td> $\frac{1}{1+2\alpha}$ X</td><td>Section 6.2.3</td></tr><tr><td>α||X|| $_{F}$ </td><td> $\left(1-\frac{\alpha}{\max\{||\mathbf{X}\|_{F},\alpha\}}\right)$ X</td><td>Example 6.19</td></tr><tr><td>α||X|| $_{S_{1}}$ </td><td>Udg( $\mathcal{T}_{\alpha}(\boldsymbol{igma}(\mathbf{X}))$ )V $^{T}$ </td><td>Example 6.8</td></tr><tr><td>α||X|| $_{S_{\infty}}$ </td><td> $\mathbf{X}-\alpha\text{Udg}(P_{B_{\|\cdot\|_{1}}[\mathbf{0},1]}(\boldsymbol{igma}(\mathbf{X})/\alpha))\mathbf{V}^{T}$ </td><td>Example 6.48</td></tr><tr><td>α||X|| $_{<k>}$ </td><td> $\mathbf{X}-\alpha\text{Udg}(P_{C}(\boldsymbol{igma}(\mathbf{X})/\alpha))\mathbf{V}^{T},$  $C=B_{\|\cdot\|_{1}}[\mathbf{0},k]\cap B_{\|\cdot\|_{\infty}}[\mathbf{0},1]$ </td><td>Example 6.51</td></tr></table>

Note that $\| \mathbf{X} \|_{S_{\infty}}$ can be written as either $\sigma_{1}({\mathbf{X}})$ or $\| \mathbf{X} \|_{2, 2}$

A set $T \subseteq \mathbb{R}^{m \times n}$ is called a symmetric spectral set in $\mathbb{R}^{m \times n}$ if the indicator function $\delta_{T}$ is a symmetric spectral function over $\mathbb{R}^{m \times n}$ , meaning that it has the form $\delta_{T} = \delta_{C} \circ \sigma$ , where $\delta_{C}$ is an absolutely permutation symmetric function. The set $C \subseteq \mathbb{R}^{m \times n}$ is the associated set. Since $\mathrm{prox}_{\delta_{T}} = P_{T}$ and $\mathrm{prox}_{\delta_{C}} = P_{C}$ , it follows by the spectral prox formula that if C is nonempty closed and convex, then

$$
P_{T}(\mathbf{X}) = \mathbf{U} \mathrm{dg}(P_{C}(\boldsymbol{igma}(\mathbf{X}))) \mathbf{V}^{T}, \mathbf{X} \in \mathbb{R}^{m \times n},\tag{7.11}
$$

where $\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}$ are assumed to satisfy ${\bf X} ={\bf U} d{\bf g}({\pmb \sigma}({\bf X})){\bf V}^{T}$

Example 7.31. Using formula (7.11), we present in the following table expressions for the orthogonal projection onto several symmetric spectral sets in $\mathbb{R}^{m \times n}$ . The table also includes references to the corresponding results on the orthogonal projection onto the associated subset of $\mathbb{R}^{r}$ . The matrices $\mathbf{U} \in \mathbb{O}^{m}, \mathbf{V} \in \mathbb{O}^{n}$ are assumed to satisfy ${\bf X} ={\bf U} d{\bf g}({\pmb \sigma}({\bf X})){\bf V}^{T}$

<table><tr><td>set (T)</td><td> $P_T(\mathbf{X})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $B_{\parallel \cdot \|S_\infty}[\mathbf{0},\alpha]$ </td><td> $\mathbf{U}\mathrm{dg}(\mathbf{v})\mathbf{V}^T, v_i = \min\{\sigma_i(\mathbf{X}),\alpha\}$ </td><td> $\alpha > 0$ </td><td>Lemma 6.26</td></tr><tr><td> $B_{\parallel \cdot \|F}[\mathbf{0},r]$ </td><td> $\frac{r}{\max\{\|\mathbf{X}\|_F,r\}}\mathbf{X}$ </td><td> $r > 0$ </td><td>Lemma 6.26</td></tr><tr><td> $B_{\parallel \cdot \|S_1}[\mathbf{0},\alpha]$ </td><td> $\begin{cases}\mathbf{X}, & \| \mathbf{X}\|_{S_1} \leq \alpha, \\ \mathbf{U}\mathrm{dg}(\mathcal{T}_{\beta^*}(\sigma(\mathbf{X})))\mathbf{V}^T, & \| \mathbf{X}\|_{S_1} > \alpha, \\ \| \mathcal{T}_{\beta^*}(\boldsymbol{igma}(\mathbf{X}))\|_1 = \alpha, \beta^* > 0\end{cases}$ </td><td> $\alpha > 0$ </td><td>Example 6.33</td></tr></table>

Chapter 8


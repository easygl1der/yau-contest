---
title: "Chapter 27 \u2014 Covering Numbers"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 27
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 10228
source_line_end: 10349
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
  - machine-learning
  - official-syllabus
---

# Chapter 27 — Covering Numbers

> [[../README|本书目录]] · [[26-chapter-26-rademacher-complexities|上一章]] · [[28-chapter-28-proof-of-the-fundamental-theorem-of-learning-theory|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 10228–10349。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 27.1 Covering

<sup>definition</sup> 27.1 (Covering) Let $A \subset \mathbb{R}^{m}$ be a set of vectors. We say that A is r-covered by a set $A^{\prime},$ , with respect to the Euclidean metric, if for all $\mathbf{a} \in A$ there exists $\mathbf{a}^{\prime} \in A^{\prime}$ with $\| \mathbf{a} - \mathbf{a}^{\prime} \| \leq r$ . We define by $N(r, A)$ the cardinality of the smallest $A^{\prime}$ that r-covers A.

Example 27.1 (Subspace) Suppose that $A \subset \mathbb{R}^{m}$ , let $c = \operatorname{max}_{\mathbf{a} \in A} \left\| \mathbf{a} \right\|$ , and assume that A lies in a d-dimensional subspace of $\mathbb{R}^{m}$ . Then, $N(r, A) \leq(2c \sqrt{d} / r)^{d}$ To see this, let $\mathbf{v}_{1}, \ldots, \mathbf{v}_{d}$ be an orthonormal basis of the subspace. Then, any $\mathbf{a} \in A$ can be written as $\begin{array}{r}{\mathbf{a} = \sum_{i = 1}^{d} \alpha_{i} \mathbf{v}_{i}} \end{array}$ with $\|{\boldsymbol{\alpha}} \|_{\infty} \leq \|{\boldsymbol{\alpha}} \|_{2} = \| \mathbf{a} \|_{2} \leq c$ . Let $\epsilon \in \mathbb{R}$ and consider the set

$$
A^{\prime} = \left\{\sum_{i = 1}^{d} \alpha_{i}^{\prime} \mathbf{v}_{i}: \forall i, \alpha_{i}^{\prime} \in \{- c, - c + \epsilon, - c + 2 \epsilon, \dots, c\} \right\}.
$$

Given $\mathbf{a} \in A$ s.t. $\begin{array}{r}{\mathbf{a} = \sum_{i = 1}^{d} \alpha_{i} \mathbf{v}_{i}} \end{array}$ with $\|{\pmb{\alpha}} \|_{\infty} \leq c,$ , there exists $\mathbf{a}^{\prime} \in A^{\prime}$ such that

$$
\left\| \mathbf{a} - \mathbf{a}^{\prime} \right\|^{2} = \left\| \sum_{i} \left(\alpha_{i}^{\prime} - \alpha_{i}\right) \mathbf{v}_{i} \right\|^{2} \leq \epsilon^{2} \sum_{i} \left\| \mathbf{v}_{i} \right\|^{2} \leq \epsilon^{2} d.
$$

Choose $\epsilon = r / \sqrt{d};$ then $\| \mathbf{a} - \mathbf{a}^{\prime} \| \leq r$ and therefore $A^{\prime}$ is an r-cover of A. Hence,

$$
N(r, A) \leq | A^{\prime} | = \left(\frac{2c}{\epsilon}\right)^{d} = \left(\frac{2c \sqrt{d}}{r}\right)^{d}.
$$

## 27.1.1 Properties

The following lemma is immediate from the definition.

<sup>lemma</sup> 27.2 For any $A \subset \mathbb{R}^{m}$ , scalar $c > 0$ , and vector $\mathbf{a}_{0} \in \mathbb{R}^{m}$ , we have

$$
\forall r > 0, \quad N(r, \{c \mathbf{a} + \mathbf{a}_{0}: \mathbf{a} \in A\}) \leq N(cr, A).
$$

Next, we derive a contraction principle.

<sup>lemma</sup> 27.3 For each $i \in[m]$ , let $\phi_{i} : \mathbb{R} \mathbb{R}$ be a ρ-Lipschitz function; namely, for all $\alpha, \beta \in \mathbb{R}$ we have $| \phi_{i}(\alpha) - \phi_{i}(\beta) | \le \rho | \alpha - \beta |$ . For $\mathbf{a} \in \mathbb{R}^{m}$ let $\phi(\mathbf{a})$ denote the vector $(\phi_{1}(a_{1}), \dots, \phi_{m}(a_{m}))$ . Let φ ◦ $A = \{\phi(\mathbf{a}) : a \in A\}$ . Then,

$$
N(\rho r, \phi \circ A) \leq N(r, A).
$$

Proof Define $B = \phi \circ A$ . Let $A^{\prime}$ be an r-cover of A and define $B^{\prime} = \phi \circ A^{\prime}$ Then, for all $\mathbf{a} \in A$ there exists $\mathbf{a}^{\prime} \in A^{\prime}$ with $\| \mathbf{a} - \mathbf{a}^{\prime} \| \leq r$ . So,

$$
\left\| \phi(\mathbf{a}) - \phi \left(\mathbf{a}^{\prime}\right) \right\|^{2} = \sum_{i} \left(\phi_{i} \left(a_{i}\right) - \phi_{i} \left(a_{i}^{\prime}\right)\right)^{2} \leq \rho^{2} \sum_{i} \left(a_{i} - a_{i}^{\prime}\right)^{2} \leq(\rho r)^{2}.
$$

Hence, $B^{\prime}$ is an $(\rho r)$ -cover of $B.$

## 27.2 From Covering to Rademacher Complexity via Chaining

The following lemma bounds the Rademacher complexity of A based on the covering numbers $N(r, A)$ . This technique is called Chaining and is attributed to Dudley.

<sup>lemma</sup> 27.4 Let $c = \operatorname{min}_{\bar{\mathbf{a}}} \operatorname{max}_{\mathbf{a} \in A} \left\| \mathbf{a} -{\bar{\mathbf{a}}} \right\|$ . Then, for any integer $M > 0$ 2

$$
R(A) \leq \frac{c2^{- M}}{\sqrt{m}} + \frac{6c}{m} \sum_{k = 1}^{M} 2^{- k} \sqrt{\log(N(c2^{- k}, A))}.
$$

Proof Let a¯ be a minimizer of the objective function given in the definition of c. On the basis of Lemma 26.6, we can analyze the Rademacher complexity assuming that $\bar{\mathbf{a}} = \mathbf{0}$

Consider the set $B_{0} = \{\mathbf{0}\}$ and note that it is a c-cover of A. Let $B_{1}, \ldots, B_{M}$ be sets such that each $B_{k}$ corresponds to a minimal $(c2^{- k})$ -cover of $A.$ . Let $\mathbf{a}^{*} = \operatorname{argmax}_{\mathbf{a} \in A} \langle \pmb{\sigma}, \mathbf{a} \rangle$ (where if there is more than one maximizer, choose one in an arbitrary way, and if a maximizer does not exist, choose $\mathbf{a}^{*}$ such that $\langle \pmb{\sigma}, \mathbf{a}^{*} \rangle$ is close enough to the supremum). Note that $\mathbf{a}^{*}$ is a function of $\pmb{\sigma}$ . For each $k,$ let $\mathbf{b}^{(k)}$ be the nearest neighbor of $\mathbf{a}^{*}$ in $B_{k}$ (hence $\mathbf{b}^{(k)}$ is also a function of $\sigma)$ . Using the triangle inequality,

$$
\left\| \mathbf{b}^{(k)} - \mathbf{b}^{(k - 1)} \right\| \leq \left\| \mathbf{b}^{(k)} - \mathbf{a}^{*} \right\| + \left\| \mathbf{a}^{*} - \mathbf{b}^{(k - 1)} \right\| \leq c(2^{- k} + 2^{-(k - 1)}) = 3c2^{- k}.
$$

For each k define the set

$$
\hat{B}_{k} = \left\{\left(\mathbf{a} - \mathbf{a}^{\prime}\right): \mathbf{a} \in B_{k}, \mathbf{a}^{\prime} \in B_{k - 1}, \| \mathbf{a} - \mathbf{a}^{\prime} \| \leq 3c2^{- k} \right\}.
$$

We can now write

$$
\begin{array}{l} R(A) = \frac{1}{m} \mathbb{E} \langle \boldsymbol{igma}, \mathbf{a}^{*} \rangle \\ \qquad = \frac{1}{m} \mathbb{E} \left[\langle \boldsymbol{igma}, \mathbf{a}^{*} - \mathbf{b}^{(M)} \rangle + \sum_{k = 1}^{M} \langle \boldsymbol{igma}, \mathbf{b}^{(k)} - \mathbf{b}^{(k - 1)} \rangle \right] \\ \qquad \leq \frac{1}{m} \mathbb{E} \left[\| \boldsymbol{igma} \| \| \mathbf{a}^{*} - \mathbf{b}^{(M)} \| \right] + \sum_{k = 1}^{M} \frac{1}{m} \mathbb{E} \left[\sup_{\mathbf{a} \in \hat{B}_{k}} \langle \boldsymbol{igma}, \mathbf{a} \rangle \right].\end{array}
$$

Since $\|{\pmb{\sigma}} \| ={\sqrt{m}}$ and $\lVert \mathbf{a}^{*} - \mathbf{b}^{(M)} \rVert \leq c2^{- M}$ , the first summand is at most $\frac{c}{\sqrt{m}} 2^{- M}$ . Additionally, by Massart lemma,

$$
\frac{1}{m} \mathbb{E} \sup_{\mathbf{a} \in \hat{B}_{k}} \left\langle \boldsymbol{igma}, \mathbf{a} \right\rangle \leq 3c2^{- k} \frac{\sqrt{2 \log(N(c2^{- k}, A)^{2})}}{m} = 6c2^{- k} \frac{\sqrt{\log(N(c2^{- k}, A))}}{m}.
$$

Therefore,

$$
R(A) \leq \frac{c2^{- M}}{\sqrt{m}} + \frac{6c}{m} \sum_{k = 1}^{M} 2^{- k} \sqrt{\log(N(c2^{- k}, A))}.
$$

As a corollary we obtain the following:

<sup>lemma</sup> 27.5 Assume that there are $\alpha, \beta > 0$ such that for any $k \geq 1$ we have

$$
\sqrt{\log(N(c2^{- k}, A))} \leq \alpha + \beta k.
$$

Then,

$$
R(A) \leq \frac{6c}{m}(\alpha + 2 \beta).
$$

Proof The bound follows from Lemma 27.4 by taking $M \to \infty$ and noting that $\scriptstyle \sum_{k = 1}^{\infty} 2^{- k} = 1$ and $\scriptstyle \sum_{k = 1}^{\infty} k2^{- k} = 2$ □

Example 27.2 Consider a set A which lies in a d dimensional subspace of $\mathbb{R}^{m}$ and such that $c = \operatorname{max}_{\mathbf{a} \in A} \left\| \mathbf{a} \right\|$ . We have shown that $\begin{array}{r}{N(r, A) \leq \left(\frac{2c \sqrt{d}}{r} \right)^{d}} \end{array}$ . Therefore, for any k,

$$
\begin{array}{l} \sqrt{\log(N(c2^{- k}, A))} \leq \sqrt{d \log \left(2^{k + 1} \sqrt{d}\right)} \\ \qquad \qquad \qquad \leq \sqrt{d \log(2 \sqrt{d})} + \sqrt{kd} \\ \qquad \qquad \qquad \leq \sqrt{d \log(2 \sqrt{d})} + \sqrt{d} k.\end{array}
$$

Hence Lemma 27.5 yields

$$
R(A) \leq \frac{6c}{m} \left(\sqrt{d \log(2 \sqrt{d})} + 2 \sqrt{d}\right) = O \left(\frac{c \sqrt{d \log(d)}}{m}\right).
$$

## 27.3 Bibliographic Remarks

The chaining technique is due to Dudley (1987). For an extensive study of covering numbers as well as other complexity measures that can be used to bound the rate of uniform convergence we refer the reader to (Anthony & Bartlet 1999).


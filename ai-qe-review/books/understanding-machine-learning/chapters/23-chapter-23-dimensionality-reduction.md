---
title: "Chapter 23 \u2014 Dimensionality Reduction"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 23
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 8264
source_line_end: 8892
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 1
caption_derived_image_alt: 2
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 23 — Dimensionality Reduction

> [[../README|本书目录]] · [[22-chapter-22-clustering|上一章]] · [[24-chapter-24-generative-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 8264–8892。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；different × 4；efficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 23.1 Principal Component Analysis (PCA)

Let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ be m vectors in $\mathbb{R}^{d}$ . We would like to reduce the dimensionality of these vectors using a linear transformation. A matrix $W \in \mathbb{R}^{n, d}$ , where $n < d.$ , induces a mapping $\mathbf{x} \mapsto W \mathbf{x}$ , where $W \mathbf{x} \in \mathbb{R}^{n}$ is the lower dimensionality representation of $\mathbf{x}.$ Then, a second matrix $U \in \mathbb{R}^{d, n}$ can be used to (approximately) recover each original vector x from its compressed version. That is, for a compressed vector $\mathbf{y} = W \mathbf{x}.$ , where $\mathbf{y}$ is in the low dimensional space $\mathbb{R}^{n}$ , we can construct $\tilde{\mathbf{x}} = U \mathbf{y}$ , so that x˜ is the recovered version of x and resides in the original high dimensional space $\mathbb{R}^{d}$

In PCA, we find the compression matrix $W$ and the recovering matrix $U$ so that the total squared distance between the original and recovered vectors is minimal; namely, we aim at solving the problem

$$
\operatorname{argmin}_{W \in \mathbb{R}^{n, d}, U \in \mathbb{R}^{d, n}} \sum_{i = 1}^{m} \| \mathbf{x}_{i} - UW \mathbf{x}_{i} \|_{2}^{2}.\tag{23.1}
$$

To solve this problem we first show that the optimal solution takes a specific form.

<sup>lemma</sup> 23.1 Let $(U, W)$ be a solution to Equation $\it(23.1)$ . Then the columns of $U$ are orthonormal (namely, $U^{\top} U$ is the identity matrix of $\mathbb{R}^{n})$ and $W = U^{\top}$

Proof Fix any $U, W$ and consider the mapping $\mathbf{x} \mapsto UW \mathbf{x}$ . The range of this mapping, $R = \{UW \mathbf{x} : \mathbf{x} \in \mathbb{R}^{d}\}$ , is an n dimensional linear subspace of $\mathbb{R}^{d}$ . Let $V \in \mathbb{R}^{d, n}$ be a matrix whose columns form an orthonormal basis of this subspace, namely, the range of V is R and $V ^ { \top } V = I $ . Therefore, each vector in R can be written as $V \mathbf{y}$ where $\mathbf{y} \in \mathbb{R}^{n}$ . For every $\mathbf{x} \in \mathbb{R}^{d}$ and $\mathbf{y} \in \mathbb{R}^{n}$ we have

$$
\| \mathbf{x} - V \mathbf{y} \|_{2}^{2} = \| \mathbf{x} \|^{2} + \mathbf{y}^{\top} V^{\top} V \mathbf{y} - 2 \mathbf{y}^{\top} V^{\top} \mathbf{x} = \| \mathbf{x} \|^{2} + \| \mathbf{y} \|^{2} - 2 \mathbf{y}^{\top}(V^{\top} \mathbf{x}),
$$

where we used the fact that $V^{\top} V$ is the identity matrix of $\mathbb{R}^{n}$ . Minimizing the preceding expression with respect to $\mathbf{y}$ by comparing the gradient with respect to $\mathbf{y}$ to zero gives that $\mathbf{y} = V^{\top} \mathbf{x}$ . Therefore, for each x we have that

$$
VV^{\top} \mathbf{x} = \underset{\tilde{\mathbf{x}} \in R}{\operatorname{argmin}} \| \mathbf{x} - \tilde{\mathbf{x}} \|_{2}^{2}.
$$

In particular this holds for $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ and therefore we can replace $U, W$ by $V, V^{\top}$ and by that do not increase the objective

$$
\sum_{i = 1}^{m} \| \mathbf{x}_{i} - UW \mathbf{x}_{i} \|_{2}^{2} \geq \sum_{i = 1}^{m} \| \mathbf{x}_{i} - VV^{\top} \mathbf{x}_{i} \|_{2}^{2}.
$$

Since this holds for every $U, W$ the proof of the lemma follows.

On the basis of the preceding lemma, we can rewrite the optimization problem given in Equation (23.1) as follows:

$$
\operatorname{argmin}_{U \in \mathbb{R}^{d, n}: U^{\top} U = I} \sum_{i = 1}^{m} \| \mathbf{x}_{i} - UU^{\top} \mathbf{x}_{i} \|_{2}^{2}.\tag{23.2}
$$

We further simplify the optimization problem by using the following elementary algebraic manipulations. For every $\mathbf{x} \in \mathbb{R}^{d}$ and a matrix $U \in \mathbb{R}^{d, n}$ such that $U^{\top} U = I$ we have

$$
\begin{array}{rl} &{\| \mathbf{x} - UU^{\top} \mathbf{x} \|^{2} = \| \mathbf{x} \|^{2} - 2 \mathbf{x}^{\top} UU^{\top} \mathbf{x} + \mathbf{x}^{\top} UU^{\top} UU^{\top} \mathbf{x}} \\ &{\qquad = \| \mathbf{x} \|^{2} - \mathbf{x}^{\top} UU^{\top} \mathbf{x}} \\ &{\qquad = \| \mathbf{x} \|^{2} - \operatorname{tr}(U^{\top} \mathbf{xx}^{\top} U),} \end{array}\tag{23.3}
$$

where the trace of a matrix is the sum of its diagonal entries. Since the trace is a linear operator, this allows us to rewrite Equation (23.2) as follows:

$$
\underset{U \in \mathbb{R}^{d, n}: U^{\top} U = I}{\operatorname{argmax}} \operatorname{trace} \left(U^{\top} \sum_{i = 1}^{m} \mathbf{x}_{i} \mathbf{x}_{i}^{\top} U\right).\tag{23.4}
$$

Let $\begin{array}{r}{A = \sum_{i = 1}^{m} \mathbf{x}_{i} \mathbf{x}_{i}^{\top}} \end{array}$ . The matrix A is symmetric and therefore it can be written using its spectral decomposition as $A = VDV^{\top}$ , where D is diagonal and $V^{\top} V = VV^{\top} = I$ . Here, the elements on the diagonal of $D$ are the eigenvalues of A and the columns of $V$ are the corresponding eigenvectors. We assume without loss of generality that $D_{1, 1} \geq D_{2, 2} \geq \cdot \cdot \cdot \geq D_{d, d}.$ . Since A is positive semidefinite it also holds that $D_{d, d} \geq 0$ . We claim that the solution to Equation (23.4) is the matrix U whose columns are the n eigenvectors of A corresponding to the largest n eigenvalues.

theorem 23.2 Let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ be arbitrary vectors in $\mathbb{R}^{d}$ , let $\begin{array}{r}{A = \sum_{i = 1}^{m} \mathbf{x}_{i} \mathbf{x}_{i}^{\top}} \end{array}$ and let $\mathbf{u}_{1}, \ldots, \mathbf{u}_{n}$ be n eigenvectors of the matrix A corresponding to the largest n eigenvalues of A. Then, the solution to the PCA optimization problem given in Equation $\it{(23.1)}$ is to set $U$ to be the matrix whose columns are $\mathbf{u}_{1}, \ldots, \mathbf{u}_{n}$ and to set $W = U^{\top}$

Proof Let $VDV^{\top}$ be the spectral decomposition of A. Fix some matrix $U \in \mathbb{R}^{d, n}$ 2 with orthonormal columns and let $B = V^{\top} U$ . Then, $VB = VV^{\top} U = U$ . It follows that

$$
U^{\top} AU = B^{\top} V^{\top} VDV^{\top} VB = B^{\top} DB,
$$

and therefore

$$
\operatorname{trace} \left(U^{\top} AU\right) = \sum_{j = 1}^{d} D_{j, j} \sum_{i = 1}^{n} B_{j, i}^{2}.
$$

Note that $B^{\top} B = U^{\top} VV^{\top} U = U^{\top} U = I.$ . Therefore, the columns of $B$ are also orthonormal, which implies that $\begin{array}{r}{\sum_{j = 1}^{d} \sum_{i = 1}^{n} B_{j, i}^{2} = n} \end{array}$ . In addition, let $\tilde{B} \in$ $\mathbb{R}^{d, d}$ be a matrix such that its first n columns are the columns of $B$ and in addition $\tilde{B}^{\top} \tilde{B} = I$ . Then, for every $j$ we have $\begin{array}{r}{\sum_{i = 1}^{d} \tilde{B}_{j, i}^{2} = 1} \end{array}$ , which implies that $\textstyle \sum_{i = 1}^{n} B_{j, i}^{2} \leq 1$ . It follows that:

$$
\operatorname{trace}(U^{\top} AU) \leq \max_{\boldsymbol{\beta} \in[0, 1]^{d}: \| \boldsymbol{\beta} \|_{1} \leq n} \sum_{j = 1}^{d} D_{j, j} \beta_{j}.
$$

It is not hard to verify (see Exercise 2) that the right-hand side equals to $\textstyle \sum_{j = 1}^{n} D_{j, j}$ . We have therefore shown that for every matrix $U \in \mathbb{R}^{d, n}$ with orthonormal columns it holds that trace $\begin{array}{r}{(U^{\top} AU) \leq \sum_{j = 1}^{n} D_{j, j}} \end{array}$ . On the other hand, if we set U to be the matrix whose columns are the n leading eigenvectors of A we obtain that trace $\begin{array}{r}{(U^{\top} AU) = \sum_{j = 1}^{n} D_{j, j}} \end{array}$ , and this concludes our proof.

Remark 23.1 The proof of Theorem 23.2 also tells us that the value of the objective of Equation (23.4) is $\textstyle \sum_{i = 1}^{n} D_{i, i}$ . Combining this with Equation (23.3) and noting that $\begin{array}{r}{\sum_{i = 1}^{m} \| \mathbf{x}_{i} \|^{2} = \operatorname{trace}(A) = \sum_{i = 1}^{d} D_{i, i}} \end{array}$ we obtain that the optimal objective value of Equation (23.1) is $\textstyle \sum_{i = n + 1}^{d} D_{i, i}.$

Remark 23.2 It is a common practice to “center” the examples before applying PCA. That is, we first calculate $\begin{array}{r}{\pmb{\mu} = \frac{1}{m} \sum_{i = 1}^{m} \mathbf{x}_{i}} \end{array}$ and then apply PCA on the vectors $(\mathbf{x}_{1} -{\pmb \mu}), \dots,(\mathbf{x}_{m} -{\pmb \mu})$ . This is also related to the interpretation of PCA as variance maximization (see Exercise 4).

## 23.1.1 A More efficient Solution for the Case d $\gg m$

In some situations the original dimensionality of the data is much larger than the number of examples m. The computational complexity of calculating the PCA solution as described previously is $O(d^{3})$ (for calculating eigenvalues of A) plus $O(md^{2})$ (for constructing the matrix A). We now show a simple trick that enables us to calculate the PCA solution more eficiently when $d \gg m$

Recall that the matrix A is defined to be $\textstyle \sum_{i = 1}^{m} \mathbf{x}_{i} \mathbf{x}_{i}^{\top}$ . It is convenient to rewrite $A = X^{\top} X$ where $\boldsymbol{X} \in \mathbb{R}^{m, d}$ is a matrix whose ith row is $\mathbf{x}_{i}^{\top}$ . Consider the matrix $B = XX^{\top}$ . That is, $B \in \mathbb{R}^{m, m}$ is the matrix whose i, j element equals $\left.\mathbf{x}_{i}, \mathbf{x}_{j} \right.$ . Suppose that u is an eigenvector of B: That is, Bu = λu for some $\lambda \in \mathbb{R}$ . Multiplying the equality by $X^{\top}$ and using the definition of B we obtain $X^{\top} XX^{\top} \mathbf{u} = \lambda X^{\top} \mathbf{u}$ . But, using the definition of A, we get that $A(X^{\top} \mathbf{u}) =$ $\lambda(X^{\top} \mathbf{u})$ . Thus, $\frac{X^{\top} \mathbf{u}}{\| X^{\top} \mathbf{u} \|}$ is an eigenvector of A with eigenvalue of λ.

We can therefore calculate the PCA solution by calculating the eigenvalues of B instead of A. The complexity is $O(m^{3})$ (for calculating eigenvalues of B) and $m^{2} d$ (for constructing the matrix B).

Remark 23.3 The previous discussion also implies that to calculate the PCA solution we only need to know how to calculate inner products between vectors. This enables us to calculate PCA implicitly even when d is very large (or even infinite) using kernels, which yields the kernel PCA algorithm.

## 23.1.2 Implementation and Demonstration

A pseudocode of PCA is given in the following.

![Figure 23.1](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/915bce4008b669b18242d8fc10a692846c2e459f4bf05d0ef4635aeb7b276ed0.jpg)  
Figure 23.1 A set of vectors in $\mathbb{R}^{2}$ (blue x’s) and their reconstruction after dimensionality reduction to $\mathbb{R}^{1}$ using PCA (red circles).

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
PCA
input
A matrix of m examples  $X \in R^{m,d}$ 
number of components n
if (m &gt; d)
 $A = X^{\top}X$ 
Let  $u_{1}, \ldots, u_{n}$  be the eigenvectors of A with largest eigenvalues
else
 $B = XX^{\top}$ 
Let  $v_{1}, \ldots, v_{n}$  be the eigenvectors of B with largest eigenvalues
for  $i = 1, \ldots, n$  set  $u_{i} = \frac{1}{\|X^{\top}v_{i}\|} X^{\top}v_{i}$ 
output:  $u_{1}, \ldots, u_{n}$
</div>

To illustrate how PCA works, let us generate vectors in $\mathbb{R}^{2}$ that approximately reside on a line, namely, on a one dimensional subspace of $\mathbb{R}^{2}$ . For example, suppose that each example is of the form $(x, x + y)$ where x is chosen uniformly at random from $[- 1, 1]$ and $y$ is sampled from a Gaussian distribution with mean 0 and standard deviation of 0.1. Suppose we apply PCA on this data. Then, the eigenvector corresponding to the largest eigenvalue will be close to the vector $(1 / \sqrt{2}, 1 / \sqrt{2})$ . When projecting a point $(x, x + y)$ on this principal component we will obtain the scalar $\frac{2x + y}{\sqrt{2}}$ . The reconstruction of the original vector will be $((x + y / 2),(x + y / 2))$ ). In Figure 23.1 we depict the original versus reconstructed data.

Next, we demonstrate the efectiveness of PCA on a data set of faces. We extracted images of faces from the Yale data set (Georghiades, Belhumeur & Kriegman 2001). Each image contains $50 \times 50 = 2500$ pixels; therefore the original dimensionality is very high.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/802df722813567ef36dffcd6b080203c8b83ca48ad78bb42962bb69397e17237.jpg)

![Figure 23.2](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/297dfbc4e2affccb3dbb66aebb119d234eea017a46119aa9fec7b4fd1a949e94.jpg)  
Figure 23.2 Images of faces extracted from the Yale data set. Top-Left: the original images in $\mathbb{R}^{50x50}$ . Top-Right: the images after dimensionality reduction to $\mathbb{R}^{10^{\circ}}$ and reconstruction. Middle row: an enlarged version of one of the images before and after PCA. Bottom: The images after dimensionality reduction to $\mathbb{R}^{2}$ . The different marks indicate different individuals.

Some images of faces are depicted on the top-left side of Figure 23.2. Using PCA, we reduced the dimensionality to $\mathbb{R}^{10}$ and reconstructed back to the original dimension, which is $50^{2}$ . The resulting reconstructed images are depicted on the top-right side of Figure 23.2. Finally, on the bottom of Figure 23.2 we depict a 2 dimensional representation of the images. As can be seen, even from a 2 dimensional representation of the images we can still roughly separate different individuals.

## 23.2 Random Projections

In this section we show that reducing the dimension by using a random linear transformation leads to a simple compression scheme with a surprisingly low distortion. The transformation $\mathbf{x} \mapsto W \mathbf{x}$ , when W is a random matrix, is often referred to as a random projection. In particular, we provide a variant of a famous lemma due to Johnson and Lindenstrauss, showing that random projections do not distort Euclidean distances too much.

Let $\mathbf{x}_{1}, \mathbf{x}_{2}$ be two vectors in $\mathbb{R}^{d}$ . A matrix W does not distort too much the distance between $\mathbf{x}_{1}$ and $\mathbf{x}_{2}$ if the ratio

$$
\frac{\| W \mathbf{x}_{1} - W \mathbf{x}_{2} \|}{\| \mathbf{x}_{1} - \mathbf{x}_{2} \|}
$$

is close to 1. In other words, the distances between $\mathbf{x}_{1}$ and $\mathbf{x}_{2}$ before and after the transformation are almost the same. To show that $\| W \mathbf{x}_{1} - W \mathbf{x}_{2} \|$ is not too far away from ${\left\|{{\bf{x}}_{1}} -{{\bf{x}}_{2}} \right\|}$ it sufices to show that W does not distort the norm of the diference vector ${\bf x} ={\bf x}_{1} -{\bf x}_{2}$ . Therefore, from now on we focus on the ratio $\frac{\| W \mathbf{x} \|}{\| \mathbf{x} \|}$

We start with analyzing the distortion caused by applying a random projection to a single vector.

<sup>lemma</sup> 23.3 Fix some $\mathbf{x} \in \mathbb{R}^{d}$ . Let $W \in \mathbb{R}^{n, d}$ be a random matrix such that each $W_{i, j}$ is an independent normal random variable. Then, for every $\epsilon \in(0, 3)$ we have

$$
\mathbb{P} \left[\left| \frac{\|(1 / \sqrt{n}) W \mathbf{x} \|^{2}}{\| \mathbf{x} \|^{2}} - 1 \right| > \epsilon \right] \leq 2e^{- \epsilon^{2} n / 6}.
$$

Proof Without loss of generality we can assume that $\| \mathbf{x} \|^{2} = 1$ . Therefore, an equivalent inequality is

$$
\mathbb{P} \left[(1 - \epsilon) n \leq \| W \mathbf{x} \|^{2} \leq(1 + \epsilon) n \right] \geq 1 - 2e^{- \epsilon^{2} n / 6}.
$$

Let $\mathbf{w}_{i}$ be the ith row of $W$ . The random variable $\langle \mathbf{w}_{i}, \mathbf{x} \rangle$ is a weighted sum of d independent normal random variables and therefore it is normally distributed with zero mean and variance $\begin{array}{r}{\sum_{j} x_{j}^{2} = \| \mathbf{x} \|^{2} = 1} \end{array}$ . Therefore, the random variable $\begin{array}{r}{\| W \mathbf{x} \|^{2} = \sum_{i = 1}^{n}(\langle \mathbf{w}_{i}, \mathbf{x} \rangle)^{\top}} \end{array}$ has $\mathrm{~ a ~} \chi_{n}^{2}$ distribution. The claim now follows directly from a measure concentration property of $\chi^{2}$ random variables stated in Lemma B.12 given in Section B.7. □

The Johnson-Lindenstrauss lemma follows from this using a simple union bound argument.

<sup>lemma</sup> 23.4 (Johnson-Lindenstrauss Lemma) Let $Q$ be a finite set of vectors in $\mathbb{R}^{d}$ . Let $\delta \in(0, 1)$ and n be an integer such that

$$
\epsilon = \sqrt{\frac{6 \log(2 | Q | / \delta)}{n}} \leq 3.
$$

Then, with probability of at least $1 - \delta$ over a choice of a random matrix $W \in \mathbb{R}^{n, d}$ such that each element of $W$ is distributed normally with zero mean and variance of $1 / n$ we have

$$
\sup_{\mathbf{x} \in Q} \left| \frac{\| W \mathbf{x} \|^{2}}{\| \mathbf{x} \|^{2}} - 1 \right| < \epsilon.
$$

Proof Combining Lemma 23.3 and the union bound we have that for every $\epsilon \in(0, 3)$ :

$$
\mathbb{P} \left[\sup_{\mathbf{x} \in Q} \left| \frac{\| W \mathbf{x} \|^{2}}{\| \mathbf{x} \|^{2}} - 1 \right| > \epsilon \right] \leq 2 | Q | e^{- \epsilon^{2} n / 6}.
$$

Let δ denote the right-hand side of the inequality; thus we obtain that

$$
\epsilon = \sqrt{\frac{6 \log(2 | Q | / \delta)}{n}}.
$$

Interestingly, the bound given in Lemma 23.4 does not depend on the original dimension of x. In fact, the bound holds even if x is in an infinite dimensional Hilbert space.

## 23.3 Compressed Sensing

Compressed sensing is a dimensionality reduction technique which utilizes a prior assumption that the original vector is sparse in some basis. To motivate compressed sensing, consider a vector $\mathbf{x} \in \mathbb{R}^{d}$ that has at most s nonzero elements. That is,

$$
\| \mathbf{x} \|_{0} \stackrel{\mathrm{def}}{=} | \{i: x_{i} \neq 0\} | \leq s.
$$

Clearly, we can compress x by representing it using s (index,value) pairs. Furthermore, this compression is lossless – we can reconstruct x exactly from the s (index,value) pairs. Now, lets take one step forward and assume that $\mathbf{x} = U \mathbf{\alpha} \mathbf{x}$ where α is a sparse vector, $\|{\boldsymbol{\alpha}} \|_{0} \leq s,$ and U is a fixed orthonormal matrix. That is, x has a sparse representation in another basis. It turns out that many natural vectors are (at least approximately) sparse in some representation. In fact, this assumption underlies many modern compression schemes. For example, the JPEG-2000 format for image compression relies on the fact that natural images are approximately sparse in a wavelet basis.

Can we still compress x into roughly s numbers? Well, one simple way to do this is to multiply x by $U^{\top}$ , which yields the sparse vector α, and then represent α by its s (index,value) pairs. However, this requires us first to “sense” x, to store it, and then to multiply it by $U^{\top}$ . This raises a very natural question: Why go to so much efort to acquire all the data when most of what we get will be thrown away? Cannot we just directly measure the part that will not end up being thrown away?

Compressed sensing is a technique that simultaneously acquires and compresses the data. The key result is that a random linear transformation can compress x without losing information. The number of measurements needed is order of s log(d). That is, we roughly acquire only the important information about the signal. As we will see later, the price we pay is a slower reconstruction phase. In some situations, it makes sense to save time in compression even at the price of a slower reconstruction. For example, a security camera should sense and compress a large amount of images while most of the time we do not need to decode the compressed data at all. Furthermore, in many practical applications, compression by a linear transformation is advantageous because it can be performed eficiently in hardware. For example, a team led by Baraniuk and Kelly has proposed a camera architecture that employs a digital micromirror array to perform optical calculations of a linear transformation of an image. In this case, obtaining each compressed measurement is as easy as obtaining a single raw measurement. Another important application of compressed sensing is medical imaging, in which requiring fewer measurements translates to less radiation for the patient.

Informally, the main premise of compressed sensing is the following three “surprising” results:

1. It is possible to reconstruct any sparse signal fully if it was compressed by $\mathbf{x} \mapsto W \mathbf{x},$ , where $W$ is a matrix which satisfies a condition called the Restricted Isoperimetric Property (RIP). A matrix that satisfies this property is guaranteed to have a low distortion of the norm of any sparse representable vector.

2. The reconstruction can be calculated in polynomial time by solving a linear program.

3. A random n × d matrix is likely to satisfy the RIP condition provided that n is greater than an order of s log(d).

Formally,

<sup>definition</sup> 23.5 (RIP) A matrix $W \in \mathbb{R}^{n, d}$ is $(\epsilon, s) \mathrm{- RIP}$ if for all $\mathbf{x} \neq 0 \ \mathrm{s.t}$ $\| \mathbf{x} \|_{0} \leq s$ we have

$$
\left| \frac{\| W \mathbf{x} \|_{2}^{2}}{\| \mathbf{x} \|_{2}^{2}} - 1 \right| \leq \epsilon.
$$

The first theorem establishes that RIP matrices yield a lossless compression scheme for sparse vectors. It also provides a (noneficient) reconstruction scheme.

theorem 23.6 Let $\epsilon < 1$ and let W be a $(\epsilon, 2s) \ / – RIP$ matrix. Let x be a vector $s.t.\ \| \mathbf{x} \|_{0} \leq s$ , let $\mathbf{y} = W \mathbf{x}$ be the compression of x, and let

$$
\tilde{\mathbf{x}} \in \operatorname{argmin}_{\mathbf{v}: W \mathbf{v} = \mathbf{y}} \| \mathbf{v} \|_{0}
$$

be a reconstructed vector. Then, $\tilde{\mathbf{x}} = \mathbf{x}$

Proof We assume, by way of contradiction, that $\tilde{\mathbf{x}} \neq \mathbf{x}.$ . Since x satisfies the constraints in the optimization problem that defines x˜ we clearly have that $\| \tilde{\mathbf{x}} \|_{0} \leq \| \mathbf{x} \|_{0} \leq s$ . Therefore, $\|{\mathbf x} - \tilde{{\mathbf x}} \|_{0} \ \le$ 2s and we can apply the RIP inequality on the vector $\mathbf{x} -{\tilde{\mathbf{x}}}$ . But, since $W(\mathbf{x} - \tilde{\mathbf{x}}) = \mathbf{0}$ we get that $| 0 - 1 | \leq \epsilon,$ which leads to a contradiction. □

The reconstruction scheme given in Theorem 23.6 seems to be noneficient because we need to minimize a combinatorial objective (the sparsity of v). Quite surprisingly, it turns out that we can replace the combinatorial objective, $\| \mathbf{v} \|_{0},$ with a convex objective, $\| \mathbf{v} \|_{1}$ , which leads to a linear programming problem that can be solved eficiently. This is stated formally in the following theorem.

<sup>theorem</sup> 23.7 Assume that the conditions of Theorem 23.6 holds and that $\begin{array}{r}{\epsilon < \frac{1}{1 + \sqrt{2}}} \end{array}$ . Then,

$$
\mathbf{x} = \underset{\mathbf{v}: W \mathbf{v} = \mathbf{y}}{\operatorname{argmin}} \| \mathbf{v} \|_{0} = \underset{\mathbf{v}: W \mathbf{v} = \mathbf{y}}{\operatorname{argmin}} \| \mathbf{v} \|_{1}.
$$

In fact, we will prove a stronger result, which holds even if x is not a sparse vector.

theorem 23.8 Let $\textstyle \epsilon <{\frac{1}{1 +{\sqrt{2}}}}$ and let W be $a ~(\epsilon, 2s){- RIP}$ matrix. $Let{\textbf{x}}$ be an arbitrary vector and denote

$$
\mathbf{x}_{s} \in \operatorname{argmin}_{\mathbf{v}: \| \mathbf{v} \|_{0} \leq s} \| \mathbf{x} - \mathbf{v} \|_{1}.
$$

That is, $\mathbf{x}_{s}$ is the vector which equals x on the s largest elements of x and equals 0 elsewhere. Let $\mathbf{y} = W \mathbf{x}$ be the compression of x and let

$$
\mathbf{x}^{\star} \in \operatorname{argmin}_{\mathbf{v}: W \mathbf{v} = \mathbf{y}} \| \mathbf{v} \|_{1}
$$

be the reconstructed vector. Then,

$$
\| \mathbf{x}^{\star} - \mathbf{x} \|_{2} \leq 2 \frac{1 + \rho}{1 - \rho} s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1},
$$

where $\rho = \sqrt{2} \epsilon /(1 - \epsilon)$

Note that in the special case that $\mathbf{x} = \mathbf{x}_{s}$ we get an exact recovery, $\mathbf{x}^{\star} = \mathbf{x}.$ , so Theorem 23.7 is a special case of Theorem 23.8. The proof of Theorem 23.8 is given in Section 23.3.1.

Finally, the third result tells us that random matrices with $n \geq \Omega(s \log(d))$ are likely to be RIP. In fact, the theorem shows that multiplying a random matrix by an orthonormal matrix also provides an RIP matrix. This is important for compressing signals of the form $\mathbf{x} = U \mathbf{\alpha} \mathbf{x}$ where x is not sparse but α is sparse. In that case, if W is a random matrix and we compress using $\mathbf{y} = W \mathbf{x}$ then this is the same as compressing α by $\mathbf{y} =(WU) \mathbf{\alpha}$ and since W U is also RIP we can reconstruct α (and thus also x) from y.

<sup>theorem</sup> 23.9 Let U be an arbitrary fixed $d \times d$ orthonormal matrix, let $\epsilon, \delta$ be scalars in (0, 1), let s be an integer in $[d]$ , and let n be an integer that satisfies

$$
n \geq 100 \frac{s \log(40d /(\delta \epsilon))}{\epsilon^{2}}.
$$

Let $W \in \mathbb{R}^{n, d}$ be a matrix s.t. each element of W is distributed normally with zero mean and variance of $1 / n$ . Then, with proabability of at least $1 - \delta$ over the choice of W , the matrix W U is $(\epsilon, s)$ -RIP.

## 23.3.1 Proofs\*

## Proof of Theorem 23.8

We follow a proof due to Cand\`es (2008).

Let $\mathbf{h} = \mathbf{x}^{\star} - \mathbf{x}$ . Given a vector v and a set of indices I we denote by $\mathbf{v}_{I}$ the vector whose ith element is $v_{i}$ if $i \in I$ and 0 otherwise.

The first trick we use is to partition the set of indices $[d] = \{1, \dotsc, d\}$ into disjoint sets of size s. That is, we will write $[d] = T_{0} \cup T_{1} \cup T_{2}...T_{d / s - 1}$ where for all $i, | T_{i} | = s,$ , and we assume for simplicity that $d / s$ is an integer. We define the partition as follows. In $T_{0}$ we put the s indices corresponding to the s largest elements in absolute values of $\mathbf{x}$ (ties are broken arbitrarily). Let $T_{0}^{c} =[d] \ \backslash \T_{0}$ Next, $T_{1}$ will be the s indices corresponding to the s largest elements in absolute value of $\mathbf{h}_{T_{0}^{c}}$ . Let $T_{0, 1} = T_{0} \cup T_{1}$ and $T_{0, 1}^{c} =[d] \backslash T_{0, 1}$ . Next, $T_{2}$ will correspond to the s largest elements in absolute value of $\mathbf{h}_{T_{0, 1}^{c}}$ . And, we will construct $T_{3}, T_{4}, \dots.$ in the same way.

To prove the theorem we first need the following lemma, which shows that RIP also implies approximate orthogonality.

<sup>lemma</sup> 23.10 Let W be an $(\epsilon, 2s) \ / – RIP$ matrix. Then, for any two disjoint sets $I, J,$ both of size at most $s,$ , and for any vector u we have that $\langle W \mathbf{u}_{I}, W \mathbf{u}_{J} \rangle \leq$ $\epsilon \| \mathbf{u}_{I} \|_{2} \| \mathbf{u}_{J} \|_{2}$

Proof W.l.o.g. assume $\| \mathbf{u}_{I} \|_{2} = \| \mathbf{u}_{J} \|_{2} = 1$

$$
\langle W \mathbf{u}_{I}, W \mathbf{u}_{J} \rangle = \frac{\| W \mathbf{u}_{I} + W \mathbf{u}_{J} \|_{2}^{2} - \| W \mathbf{u}_{I} - W \mathbf{u}_{J} \|_{2}^{2}}{4}.
$$

But, since $| J \cup I | \leq 2s$ we get from the RIP condition that $\| W \mathbf{u}_{I} + W \mathbf{u}_{J} \|_{2}^{2} \leq$ $(1 + \epsilon)(\| \mathbf{u}_{I} \|_{2}^{2} + \| \mathbf{u}_{J} \|_{2}^{2}) = 2(1 + \epsilon)$ and that $- \| W \mathbf{u}_{I} - W \mathbf{u}_{J} \|_{2}^{2} \leq - \epsilon)(\| \mathbf{u}_{I} \|_{2}^{2} +$ $\| \mathbf{u}_{J} \|_{2}^{2}) = - 2(1 - \epsilon)$ , which concludes our proof. □

We are now ready to prove the theorem. Clearly,

$$
\| \mathbf{h} \|_{2} = \| \mathbf{h}_{T_{0, 1}} + \mathbf{h}_{T_{0, 1}^{c}} \|_{2} \leq \| \mathbf{h}_{T_{0, 1}} \|_{2} + \| \mathbf{h}_{T_{0, 1}^{c}} \|_{2}.\tag{23.5}
$$

To prove the theorem we will show the following two claims:

Claim 1:. $\| \mathbf{h}_{T_{0, 1}^{c}} \|_{2} \leq \| \mathbf{h}_{T_{0}} \|_{2} + 2s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1}$

Claim 2:. $\begin{array}{r}{\| \mathbf{h}_{T_{0, 1}} \|_{2} \leq \frac{2 \rho}{1 - \rho} s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1}} \end{array}$

Combining these two claims with Equation (23.5) we get that

$$
\begin{array}{l} \| \mathbf{h} \|_{2} \leq \| \mathbf{h}_{T_{0, 1}} \|_{2} + \| \mathbf{h}_{T_{0, 1}^{c}} \|_{2} \leq 2 \| \mathbf{h}_{T_{0, 1}} \|_{2} + 2s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1} \\ \quad \leq 2 \left(\frac{2 \rho}{1 - \rho} + 1\right) s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1} \\ \quad = 2 \frac{1 + \rho}{1 - \rho} s^{- 1 / 2} \| \mathbf{x} - \mathbf{x}_{s} \|_{1}, \end{array}
$$

and this will conclude our proof.

## Proving Claim 1:

To prove this claim we do not use the RIP condition at all but only use the fact that $\mathbf{x}^{\star}$ minimizes the $\ell_{1}$ norm. Take $j > 1$ . For each $i \in T_{j}$ and $i^{\prime} \in T_{j - 1}$ we have that $| h_{i} | \leq | h_{i^{\prime}} |.$ Therefore, $\| \mathbf{h}_{T_{j}} \|_{\infty} \leq \| \mathbf{h}_{T_{j - 1}} \|_{1} / s$ . Thus,

$$
\left\| \mathbf{h}_{T_{j}} \right\|_{2} \leq s^{1 / 2} \left\| \mathbf{h}_{T_{j}} \right\|_{\infty} \leq s^{- 1 / 2} \left\| \mathbf{h}_{T_{j - 1}} \right\|_{1}.
$$

Summing this over $j = 2, 3, \dots$ . and using the triangle inequality we obtain that

$$
\left\| \mathbf{h}_{T_{0, 1}^{c}} \right\|_{2} \leq \sum_{j \geq 2} \left\| \mathbf{h}_{T_{j}} \right\|_{2} \leq s^{- 1 / 2} \left\| \mathbf{h}_{T_{0}^{c}} \right\|_{1}\tag{23.6}
$$

Next, we show that $\| \mathbf{h}_{T_{0}^{c}} \|_{1}$ cannot be large. Indeed, from the definition of $\mathbf{x}^{\star}$ we have that $\| \mathbf{x} \|_{1} \geq \| \mathbf{x}^{\star} \|_{1} = \| \mathbf{x} + \mathbf{h} \|_{1}$ . Thus, using the triangle inequality we obtain that

$$
\| \mathbf{x} \|_{1} \geq \| \mathbf{x} + \mathbf{h} \|_{1} = \sum_{i \in T_{0}} | x_{i} + h_{i} | + \sum_{i \in T_{0}^{c}} | x_{i} + h_{i} | \geq \| \mathbf{x}_{T_{0}} \|_{1} - \| \mathbf{h}_{T_{0}} \|_{1} + \| \mathbf{h}_{T_{0}^{c}} \|_{1} - \| \mathbf{x}_{T_{0}^{c}} \|_{1}\tag{23.7}
$$

and since $\| \mathbf{x}_{T_{0}^{c}} \|_{1} = \| \mathbf{x} - \mathbf{x}_{s} \|_{1} = \| \mathbf{x} \|_{1} - \| \mathbf{x}_{T_{0}} \|_{1}$ we get that

$$
\left\| \mathbf{h}_{T_{0}^{c}} \right\|_{1} \leq \left\| \mathbf{h}_{T_{0}} \right\|_{1} + 2 \left\| \mathbf{x}_{T_{0}^{c}} \right\|_{1}.\tag{23.8}
$$

Combining this with Equation (23.6) we get that

$$
\| \mathbf{h}_{T_{0, 1}^{c}} \|_{2} \leq s^{- 1 / 2} \left(\| \mathbf{h}_{T_{0}} \|_{1} + 2 \| \mathbf{x}_{T_{0}^{c}} \|_{1}\right) \leq \| \mathbf{h}_{T_{0}} \|_{2} + 2s^{- 1 / 2} \| \mathbf{x}_{T_{0}^{c}} \|_{1},
$$

which concludes the proof of claim 1.

## Proving Claim 2:

For the second claim we use the RIP condition to get that

$$
(1 - \epsilon) \| \mathbf{h}_{T_{0, 1}} \|_{2}^{2} \leq \| W \mathbf{h}_{T_{0, 1}} \|_{2}^{2}.\tag{23.9}
$$

Since $\begin{array}{r}{W \mathbf{h}_{T_{0, 1}} = W \mathbf{h} - \sum_{j \geq 2} W \mathbf{h}_{T_{j}} = - \sum_{j \geq 2} W \mathbf{h}_{T_{j}}} \end{array}$ we have that

$$
\| W \mathbf{h}_{T_{0, 1}} \|_{2}^{2} = - \sum_{j \geq 2} \left\langle W \mathbf{h}_{T_{0, 1}}, W \mathbf{h}_{T_{j}} \right\rangle = - \sum_{j \geq 2} \left\langle W \mathbf{h}_{T_{0}} + W \mathbf{h}_{T_{1}}, W \mathbf{h}_{T_{j}} \right\rangle.
$$

From the RIP condition on inner products we obtain that for all $i \in \{1, 2\}$ and $j \geq 2$ we have

$$
| \langle W \mathbf{h}_{T_{i}}, W \mathbf{h}_{T_{j}} \rangle | \leq \epsilon \| \mathbf{h}_{T_{i}} \|_{2} \| \mathbf{h}_{T_{j}} \|_{2}.
$$

Since $\| \mathbf{h}_{T_{0}} \|_{2} + \| \mathbf{h}_{T_{1}} \|_{2} \leq \sqrt{2} \| \mathbf{h}_{T_{0, 1}} \|_{2}$ we therefore get that

$$
\| W \mathbf{h}_{T_{0, 1}} \|_{2}^{2} \leq \sqrt{2} \epsilon \| \mathbf{h}_{T_{0, 1}} \|_{2} \sum_{j \geq 2} \| \mathbf{h}_{T_{j}} \|_{2}.
$$

Combining this with Equation (23.6) and Equation (23.9) we obtain

$$
(1 - \epsilon) \| \mathbf{h}_{T_{0, 1}} \|_{2}^{2} \leq \sqrt{2} \epsilon \| \mathbf{h}_{T_{0, 1}} \|_{2} s^{- 1 / 2} \| \mathbf{h}_{T_{0}^{c}} \|_{1}.
$$

Rearranging the inequality gives

$$
\| \mathbf{h}_{T_{0, 1}} \|_{2} \leq \frac{\sqrt{2} \epsilon}{1 - \epsilon} s^{- 1 / 2} \| \mathbf{h}_{T_{0}^{c}} \|_{1}.
$$

Finally, using Equation (23.8) we get that

$$
\| \mathbf{h}_{T_{0, 1}} \|_{2} \leq \rho s^{- 1 / 2} \left(\| \mathbf{h}_{T_{0}} \|_{1} + 2 \| \mathbf{x}_{T_{0}^{c}} \|_{1}\right) \leq \rho \| \mathbf{h}_{T_{0}} \|_{2} + 2 \rho s^{- 1 / 2} \| \mathbf{x}_{T_{0}^{c}} \|_{1},
$$

but since $\Vert \mathbf{h}_{T_{0}} \Vert_{2} \leq \Vert \mathbf{h}_{T_{0, 1}} \Vert_{2}$ this implies

$$
\| \mathbf{h}_{T_{0, 1}} \|_{2} \leq \frac{2 \rho}{1 - \rho} s^{- 1 / 2} \| \mathbf{x}_{T_{0}^{c}} \|_{1},
$$

which concludes the proof of the second claim.

## Proof of Theorem 23.9

To prove the theorem we follow an approach due to (Baraniuk, Davenport, De-Vore $\&$ Wakin 2008). The idea is to combine the Johnson-Lindenstrauss (JL) lemma with a simple covering argument.

We start with a covering property of the unit ball.

<sup>lemma</sup> 23.11 Let $\epsilon \in(0, 1)$ . There exists a finite set $Q \subset \mathbb{R}^{d}$ of size $\begin{array}{r}{| Q | \leq \left(\frac{3}{\epsilon} \right)^{d}} \end{array}$ such that

$$
\sup_{\mathbf{x}: \| \mathbf{x} \| \leq 1} \min_{\mathbf{v} \in Q} \| \mathbf{x} - \mathbf{v} \| \leq \epsilon.
$$

Proof Let k be an integer and let

$$
Q^{\prime} = \left\{\mathbf{x} \in \mathbb{R}^{d}: \forall j \in[d], \exists i \in \{- k, - k + 1, \dots, k\} \text{s.t.} x_{j} = \frac{i}{k} \right\}.
$$

Clearly, $| Q^{\prime} | =(2k + 1)^{d}$ . We shall set $Q = Q^{\prime} \cap B_{2}(1)$ , where $B_{2}(1)$ is the unit $\ell_{2}$ ball of $\mathbb{R}^{d}$ . Since the points in $Q^{\prime}$ are distributed evenly on the unit $\ell_{\infty}$ ball, the size of $Q$ is the size of $Q^{\prime}$ times the ratio between the volumes of the unit $\ell_{2}$ and $\ell_{\infty}$ balls. The volume of the $\ell_{\infty}$ ball is $2^{d}$ and the volume of $B_{2}(1)$ is

$$
\frac{\pi^{d / 2}}{\Gamma(1 + d / 2)}.
$$

For simplicity, assume that d is even and therefore

$$
\Gamma(1 + d / 2) =(d / 2)! \geq \left(\frac{d / 2}{e}\right)^{d / 2},
$$

where in the last inequality we used Stirling’s approximation. Overall we obtained that

$$
| Q | \leq(2k + 1)^{d}(\pi / e)^{d / 2}(d / 2)^{- d / 2} 2^{- d}.\tag{23.10}
$$

Now lets specify k. For each $\mathbf{x} \in B_{2}(1)$ let $\mathbf{v} \in Q$ be the vector whose ith element is $\mathrm{sign}(x_{i}) \left\lfloor \left\lfloor x_{i} \right\rfloor k \right\rfloor / k$ . Then, for each element we have that $| x_{i} - v_{i} | \leq 1 / k$ and thus

$$
\left\| \mathbf{x} - \mathbf{v} \right\| \leq \frac{\sqrt{d}}{k}.
$$

To ensure that the right-hand side will be at most $\epsilon$ we shall set $k = \lceil \sqrt{d} / \epsilon \rceil$ Plugging this value into Equation (23.10) we conclude that

$$
| Q | \leq(3 \sqrt{d} /(2 \epsilon))^{d}(\pi / e)^{d / 2}(d / 2)^{- d / 2} = \left(\frac{3}{\epsilon} \sqrt{\frac{\pi}{2e}}\right)^{d} \leq \left(\frac{3}{\epsilon}\right)^{d}.
$$

Let x be a vector that can be written as $\mathbf{x} = U{\mathrm{:}}$ α with U being some orthonormal matrix and $\| \alpha \|_{0} \leq s.$ . Combining the earlier covering property and the JL lemma (Lemma 23.4) enables us to show that a random $W$ will not distort any such x.

<sup>lemma</sup> 23.12 Let U be an orthonormal $d \times d$ matrix and let $I \subset[d]$ be a set of indices of size $| I | = s$ . Let S be the span of $\{U_{i} : i \in I\}$ , where $U_{i}$ is the ith column of U. Let $\delta \in(0, 1), \epsilon \in(0, 1)$ , and $n \in \mathbb{N}$ such that

$$
n \geq 24 \frac{\log(2 / \delta) + s \log(12 / \epsilon)}{\epsilon^{2}}.
$$

Then, with probability of at least $1 - \delta$ over a choice of a random matrix $W \in$ Rn,d such that each element of W is independently distributed according to $N(0, 1 / n)$ , we have

$$
\sup_{\mathbf{x} \in S} \left| \frac{\| W \mathbf{x} \|}{\| \mathbf{x} \|} - 1 \right| < \epsilon.
$$

Proof It sufices to prove the lemma for all $\mathbf{x} \in S$ with $\| \mathbf{x} \| = 1$ . We can write $\mathbf{x} = U_{I} \mathbf{\alpha} \alpha$ where $\pmb{\alpha} \in \mathbb{R}^{s}, \| \pmb{\alpha} \|_{2} = 1$ , and $U_{I}$ is the matrix whose columns are $\{U_{i} : i \in I\}$ . Using Lemma 23.11 we know that there exists a set $Q$ of size $| Q | \leq(12 / \epsilon)^{s}$ such that

$$
\sup_{\boldsymbol{\alpha}: \| \boldsymbol{\alpha} \| = 1} \min_{\mathbf{v} \in Q} \| \boldsymbol{\alpha} - \mathbf{v} \| \leq(\epsilon / 4).
$$

But since U is orthogonal we also have that

$$
\sup_{\boldsymbol{\alpha}: \| \boldsymbol{\alpha} \| = 1} \min_{\mathbf{v} \in Q} \| U_{I} \boldsymbol{\alpha} - U_{I} \mathbf{v} \| \leq(\epsilon / 4).
$$

Applying Lemma 23.4 on the set $\{U_{I} \mathbf{v} : \mathbf{v} \in Q\}$ we obtain that for n satisfying the condition given in the lemma, the following holds with probability of at least $1 - \delta \colon$

$$
\sup_{\mathbf{v} \in Q} \left| \frac{\| WU_{I} \mathbf{v} \|^{2}}{\| U_{I} \mathbf{v} \|^{2}} - 1 \right| \leq \epsilon / 2,
$$

This also implies that

$$
\sup_{\mathbf{v} \in Q} \left| \frac{\| WU_{I} \mathbf{v} \|}{\| U_{I} \mathbf{v} \|} - 1 \right| \leq \epsilon / 2.
$$

Let a be the smallest number such that

$$
\forall \mathbf{x} \in S, \frac{\| W \mathbf{x} \|}{\| \mathbf{x} \|} \leq 1 + a.
$$

Clearly $a < \infty$ . Our goal is to show that $a \leq \epsilon.$ . This follows from the fact that for any $\mathbf{x} \in S$ of unit norm there exists $\mathbf{v} \in Q$ such that $\| \mathbf{x} - U_{I} \mathbf{v} \| \leq \epsilon / 4$ and therefore

$$
\| W \mathbf{x} \| \leq \| WU_{I} \mathbf{v} \| + \| W(\mathbf{x} - U_{I} \mathbf{v}) \| \leq 1 + \epsilon / 2 +(1 + a) \epsilon / 4.
$$

Thus,

$$
\forall \mathbf{x} \in S, \frac{\| W \mathbf{x} \|}{\| \mathbf{x} \|} \leq 1 +(\epsilon / 2 +(1 + a) \epsilon / 4).
$$

But the definition of a implies that

$$
a \leq \epsilon / 2 +(1 + a) \epsilon / 4 \Rightarrow a \leq \frac{\epsilon / 2 + \epsilon / 4}{1 - \epsilon / 4} \leq \epsilon.
$$

This proves that for all $\mathbf{x} \in S$ we have $\frac{\| W \mathbf{x} \|}{\| \mathbf{x} \|} - 1 \leq \epsilon.$ . The other side follows from this as well since

$$
\| W \mathbf{x} \| \geq \| WU_{I} \mathbf{v} \| - \| W(\mathbf{x} - U_{I} \mathbf{v}) \| \geq 1 - \epsilon / 2 -(1 + \epsilon) \epsilon / 4 \geq 1 - \epsilon.
$$

The preceding lemma tells us that for $\mathbf{x} \in S$ of unit norm we have

$$
(1 - \epsilon) \leq \| W \mathbf{x} \| \leq(1 + \epsilon),
$$

which implies that

$$
(1 - 2 \epsilon) \leq \| W \mathbf{x} \|^{2} \leq(1 + 3 \epsilon).
$$

The proof of Theorem 23.9 follows from this by a union bound over all choices of I.

## 23.4 PCA or Compressed Sensing?

Suppose we would like to apply a dimensionality reduction technique to a given set of examples. Which method should we use, PCA or compressed sensing? In this section we tackle this question, by underscoring the underlying assumptions behind the two methods.

It is helpful first to understand when each of the methods can guarantee perfect recovery. PCA guarantees perfect recovery whenever the set of examples is contained in an n dimensional subspace of $\mathbb{R}^{d}$ . Compressed sensing guarantees perfect recovery whenever the set of examples is sparse (in some basis). On the basis of these observations, we can describe cases in which PCA will be better than compressed sensing and vice versa.

As a first example, suppose that the examples are the vectors of the standard basis of $\mathbb{R}^{d}$ , namely, $\mathbf{e}_{1}, \ldots, \mathbf{e}_{d}$ , where each $\mathbf{e}_{i}$ is the all zeros vector except 1 in the ith coordinate. In this case, the examples are 1-sparse. Hence, compressed sensing will yield a perfect recovery whenever $n \geq \Omega(\log(d))$ ). On the other hand, PCA will lead to poor performance, since the data is far from being in an n dimensional subspace, as long as $n < d.$ . Indeed, it is easy ro verify that in such a case, the averaged recovery error of PCA (i.e., the objective of Equation (23.1) divided by m) will be $(d - n) / d,$ which is larger than $1 / 2$ whenever $n \leq d / 2$

We next show a case where PCA is better than compressed sensing. Consider m examples that are exactly on an n dimensional subspace. Clearly, in such a case, PCA will lead to perfect recovery. As to compressed sensing, note that the examples are n-sparse in any orthonormal basis whose first n vectors span the subspace. Therefore, compressed sensing would also work if we will reduce the dimension to Ω(n log(d)). However, with exactly n dimensions, compressed sensing might fail. PCA has also better resilience to certain types of noise. See (Chang, Weiss & Freeman 2009) for a discussion.

## 23.5 Summary

We introduced two methods for dimensionality reduction using linear transformations: PCA and random projections. We have shown that PCA is optimal in the sense of averaged squared reconstruction error, if we restrict the reconstruction procedure to be linear as well. However, if we allow nonlinear reconstruction, PCA is not necessarily the optimal procedure. In particular, for sparse data, random projections can significantly outperform PCA. This fact is at the heart of the compressed sensing method.

## 23.6 Bibliographic Remarks

PCA is equivalent to best subspace approximation using singular value decomposition (SVD). The SVD method is described in Appendix C. SVD dates back to Eugenio Beltrami (1873) and Camille Jordan (1874). It has been rediscovered many times. In the statistical literature, it was introduced by Pearson (1901). Besides PCA and SVD, there are additional names that refer to the same idea and are being used in different scientific communities. A few examples are the Eckart-Young theorem (after Carl Eckart and Gale Young who analyzed the method in 1936), the Schmidt-Mirsky theorem, factor analysis, and the Hotelling transform.

Compressed sensing was introduced in Donoho (2006) and in (Candes & Tao 2005). See also Candes (2006).

## 23.7 Exercises

1. In this exercise we show that in the general case, exact recovery of a linear compression scheme is impossible.

1. let $A \in \mathbb{R}^{n, d}$ be an arbitrary compression matrix where $n \leq d - 1$ . Show that there exists u, $\mathbf{v} \in \mathbb{R}^{n}$ , u 6= v such that $A \mathbf{u} = A \mathbf{v}$

2. Conclude that exact recovery of a linear compression scheme is impossible.

2. Let $\pmb{\alpha} \in \mathbb{R}^{d}$ such that $\alpha_{1} \geq \alpha_{2} \geq \cdot \cdot \cdot \geq \alpha_{d} \geq 0$ . Show that

$$
\max_{\boldsymbol{\beta} \in[0, 1]^{d}: \| \boldsymbol{\beta} \|_{1} \leq n} \sum_{j = 1}^{d} \alpha_{j} \beta_{j} = \sum_{j = 1}^{n} \alpha_{j}.
$$

Hint: Take every vector $\beta \in[0, 1]^{d}$ such that $\| \beta \|_{1} \leq n$ . Let i be the minimal index for which $\beta_{i} < 1$ . If $i = n + 1$ we are done. Otherwise, show that we can increase $\beta_{i}$ , while possibly decreasing $\beta_{j}$ for some $j > i$ , and obtain a better solution. This will imply that the optimal solution is to set $\beta_{i} = 1$ for $i \leq n$ and $\beta_{i} = 0$ for $i > n$

3. Kernel PCA: In this exercise we show how PCA can be used for constructing nonlinear dimensionality reduction on the basis of the kernel trick (see Chapter 16).

Let X be some instance space and let $S = \{\mathbf{x}_{1}, \dots, \mathbf{x}_{m}\}$ be a set of points in X . Consider a feature mapping $\psi : \mathcal{X} \to V$ , where V is some Hilbert space (possibly of infinite dimension). Let $K : \mathcal{X} \times \mathcal{X}$ be a kernel function, that is, $k(\mathbf{x}, \mathbf{x}^{\prime}) = \langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle$ i. Kernel PCA is the process of mapping the elements in S into $V$ using ψ, and then applying PCA over $\{\psi(\mathbf{x}_{1}), \hdots, \psi(\mathbf{x}_{m})\}$ } into <sup>Rn</sup>. The output of this process is the set of reduced elements.

Show how this process can be done in polynomial time in terms of m and n, assuming that each evaluation of $K(\cdot, \cdot)$ can be calculated in a constant time. In particular, if your implementation requires multiplication of two matrices A and B, verify that their product can be computed. Similarly, if an eigenvalue decomposition of some matrix C is required, verify that this decomposition can be computed.

## 4. An Interpretation of PCA as Variance Maximization:

Let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ be m vectors in $\mathbb{R}^{d}.$ , and let x be a random vector distributed according to the uniform distribution over $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ . Assume that $\mathbb{E}[\mathbf{x}] = \mathbf{0}$

1. Consider the problem of finding a unit vector, $\textbf{w} \in \mathbb{R}^{d},$ , such that the random variable $\langle \mathbf{w}, \mathbf{x} \rangle$ has maximal variance. That is, we would like to solve the problem

$$
\operatorname{argmax}_{\substack{\mathbf{w}:\| \mathbf{w}\| = 1}}\operatorname{Var}[\langle \mathbf{w},\mathbf{x}\rangle] = \operatorname{argmax}_{\substack{\mathbf{w}:\| \mathbf{w}\| = 1}}\frac{1}{m}\sum_{i = 1}^{m}(\langle \mathbf{w},\mathbf{x}_{i}\rangle)^{2}.
$$

Show that the solution of the problem is to set w to be the first principle vector of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$

2. Let $\mathbf{w}_{1}$ be the first principal component as in the previous question. Now, suppose we would like to find a second unit vector, $\mathbf{w}_{2} \in \mathbb{R}^{d}$ , that maximizes the variance of $\langle \mathbf{w}_{2}, \mathbf{x} \rangle$ , but is also uncorrelated to $\langle \mathbf{w}_{1}, \mathbf{x} \rangle$ . That is, we would like to solve:

$$
\operatorname{argmax}_{\mathbf{w}: \| \mathbf{w} \| = 1, \mathbb{E}[(\langle \mathbf{w}_{1}, \mathbf{x} \rangle)(\langle \mathbf{w}, \mathbf{x} \rangle)] = 0} \operatorname{Var}[\langle \mathbf{w}, \mathbf{x} \rangle].
$$

Show that the solution to this problem is to set w to be the second principal component of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$

Hint: Note that

$$
\mathbb{E}[(\langle \mathbf{w}_{1}, \mathbf{x} \rangle)(\langle \mathbf{w}, \mathbf{x} \rangle)] = \mathbf{w}_{1}^{\top} \mathbb{E}[\mathbf{xx}^{\top}] \mathbf{w} = m \mathbf{w}_{1}^{\top} A \mathbf{w},
$$

where $\begin{array}{r}{A = \sum_{i} \mathbf{x}_{i} \mathbf{x}_{i}^{\top}} \end{array}$ . Since w is an eigenvector of A we have that the constraint $\mathbb{E}[(\langle \mathbf{w}_{1}, \mathbf{x} \rangle)(\langle \mathbf{w}, \mathbf{x} \rangle)] = 0$ is equivalent to the constraint

$$
\left\langle \mathbf{w}_{1}, \mathbf{w} \right\rangle = 0.
$$

5. The Relation between SVD and PCA: Use the SVD theorem (Corollary C.6) for providing an alternative proof of Theorem 23.2.

6. Random Projections Preserve Inner Products: The Johnson-Lindenstrauss lemma tells us that a random projection preserves distances between a finite set of vectors. In this exercise you need to prove that if the set of vectors are within the unit ball, then not only are the distances between any two vectors preserved, but the inner product is also preserved.

Let Q be a finite set of vectors in $\mathbb{R}^{d}$ and assume that for every $\mathbf{x} \in Q$ we have $\| \mathbf{x} \| \leq 1$

1. Let $\delta \in(0, 1)$ ) and n be an integer such that

$$
\epsilon = \sqrt{\frac{6 \log(| Q |^{2} / \delta)}{n}} \leq 3.
$$

Prove that with probability of at least $1 - \delta$ over a choice of a random matrix $W \in \mathbb{R}^{n, d}.$ , where each element of $W$ is independently distributed according to $\mathcal{N}(0, 1 / n)$ , we have

$$
| \langle W \mathbf{u}, W \mathbf{v} \rangle - \langle \mathbf{u}, \mathbf{v} \rangle | \leq \epsilon
$$

for every $\mathbf{u}, \mathbf{v} \in Q$

Hint: Use JL to bound both $\frac{\| W(\mathbf{u} + \mathbf{v}) \|}{\| \mathbf{u} + \mathbf{v} \|}$ and $\frac{\| W(\mathbf{u} - \mathbf{v}) \|}{\| \mathbf{u} - \mathbf{v} \|}$

2. (\*) Let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ be a set of vectors in $\mathbb{R}^{d}$ of norm at most 1, and assume that these vectors are linearly separable with margin of $\gamma.$ Assume that $d \gg 1 / \gamma^{2}$ . Show that there exists a constant $c > 0$ such that if we randomly project these vectors into $\mathbb{R}^{n}$ , for $n = c / \gamma^{2}$ , then with probability of at least 99% it holds that the projected vectors are linearly separable with margin $\gamma / 2.$

We started this book with a distribution free learning framework; namely, we did not impose any assumptions on the underlying distribution over the data. Furthermore, we followed a discriminative approach in which our goal is not to learn the underlying distribution but rather to learn an accurate predictor. In this chapter we describe a generative approach, in which it is assumed that the underlying distribution over the data has a specific parametric form and our goal is to estimate the parameters of the model. This task is called parametric density estimation.

The discriminative approach has the advantage of directly optimizing the quantity of interest (the prediction accuracy) instead of learning the underlying distribution. This was phrased as follows by Vladimir Vapnik in his principle for solving problems using a restricted amount of information:

When solving a given problem, try to avoid a more general problem as an intermediate step.

Of course, if we succeed in learning the underlying distribution accurately, we are considered to be “experts” in the sense that we can predict by using the Bayes optimal classifier. The problem is that it is usually more dificult to learn the underlying distribution than to learn an accurate predictor. However, in some situations, it is reasonable to adopt the generative learning approach. For example, sometimes it is easier (computationally) to estimate the parameters of the model than to learn a discriminative predictor. Additionally, in some cases we do not have a specific task at hand but rather would like to model the data either for making predictions at a later time without having to retrain a predictor or for the sake of interpretability of the data.

We start with a popular statistical method for estimating the parameters of the data, which is called the maximum likelihood principle. Next, we describe two generative assumptions which greatly simplify the learning process. We also describe the EM algorithm for calculating the maximum likelihood in the presence of latent variables. We conclude with a brief description of Bayesian reasoning.


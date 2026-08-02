---
title: "Chapter 15 \u2014 Dimensionality Reduction"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 15
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 8764
source_line_end: 9059
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 4
source_empty_image_alt: 4
non_semantic_image_alt: 4
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
  - machine-learning
  - official-syllabus
---

# Chapter 15 — Dimensionality Reduction

> [[../README|本书目录]] · [[14-chapter-14-algorithmic-stability|上一章]] · [[16-chapter-16-learning-automata-and-languages|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 8764–9059。
> - 本章保留 4 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5；different × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 15 Dimensionality Reduction

In settings where the data has a large number of features, it is often desirable to reduce its dimension, or to find a lower-dimensional representation preserving some of its properties. The key arguments for dimensionality reduction (or manifold learning) techniques are:

<sub>•</sub> Computational: to compress the initial data as a preprocessing step to speed up subsequent operations on the data.

<sub>•</sub> Visualization: to visualize the data for exploratory analysis by mapping the input data into two- or three-dimensional spaces.

<sub>•</sub> Feature extraction: to hopefully generate a smaller and more efective or useful set of features.

The benefits of dimensionality reduction are often illustrated via simulated data, such as the Swiss roll dataset. In this example, the input data, depicted in figure 15.1a, is three-dimensional, but it lies on a two-dimensional manifold that is “unfolded” in two-dimensional space as shown in figure 15.1b. It is important to note, however, that exact low-dimensional manifolds are rarely encountered in practice. Hence, this idealized example is more useful to illustrate the concept of dimensionality reduction than to verify the efectiveness of dimensionality reduction algorithms.

Dimensionality reduction can be formalized as follows. Consider a sample $S =$ $(x_{1}, \ldots, x_{m})$ , a feature mapping $\Phi \colon \mathcal{X} \mathbb{R}^{N}$ and the data matrix $\mathbf{X} \in \mathbb{R}^{N};$ m defined as $(\pmb{\Phi}(x_{1}), \dots, \pmb{\Phi}(x_{m}))$ . The ith data point is represented by $\mathbf{x}_{i} = \Phi(x_{i})$ , or the ith column of X, which is an N-dimensional vector. Dimensionality reduction techniques broadly aim to find, for $k \ll N$ , a k-dimensional representation of the data, $\mathbf{Y} \in \mathbb{R}^{k \times m}$ , that is in some way faithful to the original representation X.

In this chapter we will discuss various techniques that address this problem. We first present the most commonly used dimensionality reduction technique called principal component analysis (PCA). We then introduce a kernelized version of PCA (KPCA) and show the connection between KPCA and manifold learning algorithms. We conclude with a presentation of the Johnson-Lindenstrauss lemma, a classical theoretical result that has inspired a variety of dimensionality reduction methods based on the concept of random projections. The discussion in this chapter relies on basic matrix properties that are reviewed in appendix A.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/76f07cf95dbad4294635c2a500fff03581bd03419003cc6a27977bad6d2a197f.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/d64e4db49b28519dc01b3a6dd347c4099ed26dc7d86d672910bb52e787870589.jpg)  
(b)  
Figure 15.1  
The “Swiss roll” dataset. (a) high-dimensional representation. (b) lower-dimensional representation.

## 15.1 Principal component analysis

Fix $k \in[N]$ and let X be a mean-centered data matrix, that is, $\textstyle \sum_{i = 1}^{m} \mathbf{x}_{i} = \mathbf{0}$ . Define $\mathcal{P}_{k}$ as the set of N-dimensional rank-k orthogonal projection matrices. PCA consists of projecting the N-dimensional input data onto the k-dimensional linear subspace that minimizes reconstruction error, that is the sum of the squared $L_{\mathrm{{2}}}{\mathrm{{- distances}}}$ between the original data and the projected data. Thus, the PCA algorithm is completely defined by the orthogonal projection matrix solution $\mathbb{P}^{*}$ of the following minimization problem:

$$
\min_{\mathbb{P} \in \mathcal{P}_{k}} \| \mathbf{PX} - \mathbf{X} \|_{F}^{2}.\tag{15.1}
$$

The following theorem shows that PCA coincides with the projection of each data point onto the k top singular vectors of the sample covariance matrix, i.e., $\mathbf{C} ={\textstyle \frac{1}{m}} \mathbf{X} \mathbf{X}^{\top}$ for the mean-centered data matrix X. Figure 15.2 illustrates the basic intuition behind PCA, showing how two-dimensional data points with highly correlated features can be more succinctly represented with a one-dimensional representation that captures most of the variance in the data.

Theorem 15.1 Let $\mathbf{P^{*}} \in \mathcal{P}_{k}$ be the PCA solution, i.e., the orthogonal projection matrix solution of (15.1). Then, $\mathbb{P}^{*} = \mathbf{U}_{k} \mathbf{U}_{k}^{\top}$ , where ${\bf U}_{k} \in \mathbb{R}^{N \times k}$ is the matrix formed by the top k singular vectors of $\begin{array}{r}{\mathbf{C} = \frac{1}{m} \mathbf{X} \mathbf{X}^{\top}} \end{array}$ , the sample covariance matrix corresponding to X. Moreover, the associated k-dimensional representation of X is given by $\mathbf{Y} = \mathbf{U}_{k}^{\top} \mathbf{X}$

Proof: Let $\mathbb{P} = \mathbb{P}^{\top}$ be an orthogonal projection matrix. By the definition of the Frobenius norm, the linearity of the trace operator and the fact that P is idempotent, i.e., $\mathbb{P}^{2} = \mathbb{P}$ , we observe that

$$
\begin{array}{rl} &{\| \mathbf{PX} - \mathbf{X} \|_{F}^{2} = \mathrm{Tr}[(\mathbf{PX} - \mathbf{X})^{\top}(\mathbf{PX} - \mathbf{X})] = \mathrm{Tr}[\mathbf{X}^{\top} \mathbb{P}^{2} \mathbf{X} - 2 \mathbf{X}^{\top} \mathbf{PX} + \mathbf{X}^{\top} \mathbf{X}]} \\ &{\qquad = - \mathrm{Tr}[\mathbf{X}^{\top} \mathbf{PX}] + \mathrm{Tr}[\mathbf{X}^{\top} \mathbf{X}].} \end{array}
$$

Since $\operatorname{Tr}[\mathbf{X}^{\top} \mathbf{X}]$ is a constant with respect to P, we have

$$
\underset{\mathbb{P} \in \mathcal{P}_{k}}{\text{argmin}} \| \mathbf{PX} - \mathbf{X} \|_{F}^{2} = \underset{\mathbb{P} \in \mathcal{P}_{k}}{\text{argmax}} \operatorname{Tr}[\mathbf{X}^{\top} \mathbf{PX}].\tag{15.2}
$$

By definition of orthogonal projections in $\mathcal{P}_{k}, \ \mathbb{P} = \mathbf{U} \mathbf{U}^{\top}$ for some $\mathbf{U} \in \mathbb{R}^{N \times k}$ containing orthogonal columns. Using the invariance of the trace operator under cyclic permutations and the orthogonality of the columns of U, we have

$$
\operatorname{Tr} \left[\mathbf{X}^{\top} \mathbf{PX} \right] = \operatorname{Tr} \left[\mathbf{U}^{\top} \mathbf{XX}^{\top} \mathbf{U} \right] = \sum_{i = 1}^{k} \mathbf{u}_{i}^{\top} \mathbf{XX}^{\top} \mathbf{u}_{i},
$$

where $\mathbf{u}_{i}$ is the ith column of U. By the Rayleigh quotient (section A.2.3), it is clear that the largest k singular vectors of $\mathbf{\mathbf{XX}^{\top}}$ maximize the rightmost sum above. Since $\mathbf{\mathbf{XX}^{\top}}$ and C difer only by a scaling factor, they have the same singular vectors, and thus ${\bf U}_{k}$ maximizes this sum, which proves the first statement of the theorem. Finally, since $\mathbf{PX} = \mathbf{U}_{k} \mathbf{U}_{k}^{\top} \mathbf{X}, \ \mathbf{Y} \ = \ \mathbf{U}_{k}^{\top} \mathbf{X}$ is a k-dimensional representation of X with $\mathbf{U}_{k}$ as the basis vectors. $\square$

By definition of the covariance matrix, the top singular vectors of C are the directions of maximal variance in the data, and the associated singular values are equal to these variances. Hence, PCA can also be viewed as projecting onto the subspace of maximal variance. Under this interpretation, the first principal component is derived from projection onto the direction of maximal variance, given by the top singular vector of C. Similarly, the ith principal component, for $1 \leq i \leq k.$ 2 is derived from projection onto the ith direction of maximal variance, subject to orthogonality constraints to the previous i 1 directions of maximal variance (see exercise 15.1 for more details).

## 15.2 Kernel principal component analysis (KPCA)

In the previous section, we presented the PCA algorithm, which involved projecting onto the singular vectors of the sample covariance matrix C. In this section, we present a kernelized version of PCA, called KPCA. In the KPCA setting, Φ is a feature mapping to an arbitrary RKHS (not necessarily to $\mathbb{R}^{N})$ and we work exclusively with a kernel function K corresponding to the inner product in this RKHS. The KPCA algorithm can thus be defined as a generalization of PCA in which the input data is projected onto the top principle components in this RKHS. We will show the relationship between PCA and KPCA by drawing upon the deep connections among the SVDs of X, C and K. We then illustrate how various manifold learning algorithms can be interpreted as special instances of KPCA.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/9302692d1bca02708fa2c7f0cbca80860f7e57cb1d61a59b3674f0904165db5b.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/cc93df8523899cbfd1bcf05a198a50c2c492c3568a6f87c52950c071eb470697.jpg)  
(b)  
Figure 15.2  
Example of PCA. (a) Two-dimensional data points with features capturing shoe size measured with different units. (b) One-dimensional representation that captures the most variance in the data, generated by projecting onto largest principal component (red line) of the mean-centered data points.

Let K be a PDS kernel defined over $\mathcal{X} \times \mathcal{X}$ and define the kernel matrix as $\mathbf K =$ $\mathbf{X}^{\top} \mathbf{X}$ . Since X admits the following singular value decomposition: $\mathbf{X} = \mathbf{U} \pmb{\Sigma} \mathbf{V}^{\top}$ C and K can be rewritten as follows:

$$
\mathbf{C} = \frac{1}{m} \mathbf{U} \boldsymbol{\Lambda} \mathbf{U}^{\top} \quad \mathbf{K} = \mathbf{V} \boldsymbol{\Lambda} \mathbf{V}^{\top},\tag{15.3}
$$

where $\pmb{\Lambda} = \pmb{\Sigma}^{2}$ is the diagonal matrix of the singular values (equivalently eigenvalues) of mC and U is the matrix of the singular vectors (equivalently eigenvectors) of C (and mC).

Starting with the SVD of X, note that right multiplying by $\mathbf{V} \pmb{\Sigma}^{- 1}$ and using the relationship between Λ and Σ yields ${\bf U} ={\bf X}{\bf V}{\pmb \Lambda}^{- 1 / 2}$ . Thus, the singular vector u of C associated to the singular value $\lambda / m$ coincides with $\frac{\mathbf{x}_{\mathbf{v}}}{\sqrt{\lambda}}$ , where v is the singular vector of K associated to λ. Now fix an arbitrary feature vector $\mathbf{x} = \Phi(x)$ for $x \in{\mathcal{X}}$ . Then, following the expression for Y in theorem 15.1, the one-dimensional representation of x derived by projection onto $\mathbf P_{u} = \mathbf u \mathbf u^{\top}$ is defined by

$$
\mathbf{x}^{\top} \mathbf{u} = \mathbf{x}^{\top} \frac{\mathbf{Xv}}{\sqrt{\lambda}} = \frac{\mathbf{k}_{x}^{\top} \mathbf{v}}{\sqrt{\lambda}},\tag{15.4}
$$

where $\mathbf k_{x} =(K(x_{1}, x), \ldots, K(x_{m}, x))^{\top}$ . If x is one of the data points, i.e., $\mathbf{x} = \mathbf{x}_{i}$ for $1 \leq i \leq m$ , then $\mathbf{k}_{x}$ is the ith column of K and (15.4) can be simplified as follows: T

$$
\mathbf{x}^{\top} \mathbf{u} = \frac{\mathbf{k}_{x}^{\top} \mathbf{v}}{\sqrt{\lambda}} = \frac{\lambda v_{i}}{\sqrt{\lambda}} = \sqrt{\lambda} v_{i},\tag{15.5}
$$

where $v_{i}$ is the ith component of v. More generally, the PCA solution of theorem 15.1 can be fully defined by the top k singular vectors (or eigenvectors) of K, $\mathbf{v}_{1}, \ldots, \mathbf{v}_{k}$ , and the corresponding singular values (or eigenvalues). This alternative derivation of the PCA solution in terms of K precisely defines the KPCA solution, providing a generalization of PCA via the use of PDS kernels (see chapter 6 for more details on kernel methods).

## 15.3 KPCA and manifold learning

Several manifold learning techniques have been proposed as non-linear methods for dimensionality reduction. These algorithms implicitly assume that high-dimensional data lie on or near a low-dimensional non-linear manifold embedded in the input space. They aim to learn this manifold structure by finding a low-dimensional space that in some way preserves the local structure of high-dimensional input data. For instance, the Isomap algorithm aims to preserve approximate geodesic distances, or distances along the manifold, between all pairs of data points. Other algorithms, such as Laplacian eigenmaps and locally linear embedding, focus only on preserving local neighborhood relationships in the high-dimensional space. We will next describe these classical manifold learning algorithms and then interpret them as specific instances of KPCA.

## 15.3.1 Isomap

Isomap aims to extract a low-dimensional data representation that best preserves all pairwise distances between input points, as measured by their geodesic distances along the underlying manifold. It approximates geodesic distance assuming that $L_{2}$ distance provides good approximations for nearby points, and for faraway points it estimates distance as a series of hops between neighboring points. The Isomap algorithm works as follows:

1. Find the t nearest neighbors for each data point based on $L_{2}$ distance and construct an undirected neighborhood graph, denoted by $\mathcal{G}$ , with points as nodes and links between neighbors as edges.

2. Compute the approximate geodesic distances, $\Delta_{ij}$ , between all pairs of nodes $(i, j)$ by computing all-pairs shortest distances in $\mathcal{G}$ using, for instance, the Floyd-Warshall algorithm.

3. Convert the squared distance matrix into a $m \times m$ similarity matrix by performing double centering, i.e., compute ${\bf K}_{\mathrm{Iso}} = -{\textstyle \frac{1}{2}}{\bf H} \Delta{\bf H}$ , where $\Delta$ is the squared distance matrix, $\mathbf{H} = \mathbf{I}_{m} -{\frac{1}{m}} \mathbf{1} \mathbf{1}^{\top}$ is the centering matrix, ${\mathbf I}_{m}$ is the $m \times m$ identity matrix and 1 is a column vector of all ones (for more details on double centering see exercise 15.2).

4. Find the optimal k-dimensional representation, $\mathbf{Y} = \{\mathbf{y}_{i}\}_{i = 1}^{n}$ , such that $\mathbf{Y} =$ argmin<sub>Y0</sub> $\begin{array}{r}{\sum_{i, j} \left(\lVert \mathbf{y}_{i}^{\prime} - \mathbf{y}_{j}^{\prime} \rVert_{2}^{2} - \Delta_{ij}^{2} \right)} \end{array}$ . The solution is given by,

$$
\mathbf{Y} =(\boldsymbol{\Sigma}_{\mathrm{Iso}, k})^{1 / 2} \mathbf{U}_{\mathrm{Iso}, k}^{\top}\tag{15.6}
$$

where $\Sigma_{\mathrm{Iso}, k}$ is the diagonal matrix of the top k singular values of ${\bf K}_{\mathrm{Iso}}$ and $\mathbf{U}_{\mathrm{Iso}, k}$ are the associated singular vectors.

${\bf K}_{\mathrm{Iso}}$ can naturally be viewed as a kernel matrix, thus providing a simple connection between Isomap and KPCA. Note, however, that this interpretation is valid only when ${\bf K}_{\mathrm{Iso}}$ is in fact positive semidefinite, which is indeed the case in the continuum limit for a smooth manifold.

## 15.3.2 Laplacian eigenmaps

The Laplacian eigenmaps algorithm aims to find a low-dimensional representation that best preserves neighborhood relations as measured by a weight matrix W. The algorithm works as follows:

1. Find t nearest neighbors for each point.

2. Construct W, a sparse, symmetric $m \times m$ matrix, where $\mathbf{W}_{ij} = \exp \big(- \mathbf{\nabla} \| \mathbf{x}_{i} - \mathbf{\nabla}$ $\mathbf{x}_{j} \|_{2}^{2} / \sigma^{2})$ if $(\mathbf{x}_{i}, \mathbf{x}_{j})$ are neighbors, 0 otherwise, and σ is a scaling parameter.

3. Construct the diagonal matrix D, such that $\begin{array}{r}{\mathbf{D}_{ii} = \sum_{j} \mathbf{W}_{ij}} \end{array}$

4. Find the k-dimensional representation by minimizing the weighted distance between neighbors as,

$$
\mathbf{Y} = \underset{\mathbf{Y}^{\prime}}{\operatorname{argmin}} \sum_{i, j} \mathbf{W}_{ij} \| \mathbf{y}_{i}^{\prime} - \mathbf{y}_{j}^{\prime} \|_{2}^{2}.\tag{15.7}
$$

This objective function penalizes nearby inputs for being mapped to faraway outputs, with “nearness” measured by the weight matrix W. The solution to the minimization in (15.7) is $\mathbf{Y} = \mathbf{U}_{\mathbf{L}, k}^{\top}$ , where $\mathbf{L} = \mathbf{D} - \mathbf{W}$ is the graph Laplacian and $\mathbf{U}_{\mathbf{L}, k}^{\top}$ are the bottom k singular vectors of $\mathbf{L},$ excluding the last singular vector corresponding to the singular value 0 (assuming that the underlying neighborhood graph is connected).

The solution to (15.7) can also be interpreted as finding the largest singular vectors of $\mathbf{L}^{\dagger}$ , the pseudo-inverse of L. Defining $\mathbf{K}_{\mathbf{L}} = \mathbf{L}^{\dagger}$ we can thus view Laplacian Eigenmaps as an instance of KPCA in which the output dimensions are normalized to have unit variance, which corresponds to setting $\lambda = 1$ in (15.5). Moreover, it can be shown that $\mathbf{K}_{\mathbf{L}}$ is the kernel matrix associated with the commute times of difusion on the underlying neighborhood graph, where the commute time between nodes i and $j$ in a graph is the expected time taken for a random walk to start at node i, reach node $j$ and then return to i.

## 15.3.3 Locally linear embedding (LLE)

The locally linear embedding (LLE) algorithm also aims to find a low-dimensional representation that preserves neighborhood relations as measured by a weight matrix W. The algorithm works as follows:

1. Find t nearest neighbors for each point.

2. Construct W, a sparse, symmetric m m matrix, whose ith row sums to one and contains the linear coeficients that optimally reconstruct $\mathbf{x}_{i}$ from its t neighbors. More specifically, if we assume that the ith row of W sums to one, then the reconstruction error is

$$
\left(\mathbf{x}_{i} - \sum_{j \in \mathcal{N}_{i}} \mathbf{W}_{ij} \mathbf{x}_{j}\right)^{2} = \left(\sum_{j \in \mathcal{N}_{i}} \mathbf{W}_{ij}(\mathbf{x}_{i} - \mathbf{x}_{j})\right)^{2} = \sum_{j, k \in \mathcal{N}_{i}} \mathbf{W}_{ij} \mathbf{W}_{ik} \mathbf{C}_{jk}^{\prime}\tag{15.8}
$$

where $\mathcal{N}_{i}$ is the set of indices of the neighbors of point $\mathbf{x}_{i}$ and ${\bf C}_{jk}^{\prime} =({\bf x}_{i} -$ ${\bf x}_{j})^{\top}({\bf x}_{i} -{\bf x}_{k})$ the local covariance matrix. Minimizing this expression with the constraint $\begin{array}{r}{\sum_{j} \mathbf{W}_{ij} = 1} \end{array}$ gives the solution

$$
\mathbf{W}_{ij} = \frac{\sum_{k}(\mathbf{C}^{\prime - 1})_{jk}}{\sum_{st}(\mathbf{C}^{\prime - 1})_{st}}.\tag{15.9}
$$

Note that the solution can be equivalently obtained by first solving the system of linear equations $\begin{array}{r}{\sum_{j} \mathbf{C}_{kj}^{\prime} \mathbf{W}_{ij} = 1} \end{array}$ , for $k \in \mathcal N_{i}$ , and then normalizing so that the weights sum to one.

3. Find the k-dimensional representation that best obeys neighborhood relations as specified by W, i.e.,

$$
\mathbf{Y} = \underset{\mathbf{Y}^{\prime}}{\operatorname{argmin}} \sum_{i} \left(\mathbf{y}_{i}^{\prime} - \sum_{j} \mathbf{W}_{ij} \mathbf{y}_{j}^{\prime}\right)^{2}.\tag{15.10}
$$

The solution to the minimization in (15.10) is $\mathbf{Y} = \mathbf{U}_{\mathbf{M}, k}^{\top}$ , where $\mathbf{M} = \left(\mathbf{I} - \mathbf{\partial} \right.$ $\mathbf{W}^{\top})(\mathbf{I} - \mathbf{W}^{\top})$ and $\mathbf{U}_{\mathbf{M}, k}^{\top}$ are the bottom k singular vectors of M, excluding the last singular vector corresponding to the singular value 0.

As discussed in exercise 15.5, LLE coincides with KPCA used with a particular kernel matrix ${\bf K}_{LLE}$ whereby the output dimensions are normalized to have unit variance (as in the case of Laplacian Eigenmaps).

## 15.4 Johnson-Lindenstrauss lemma

The Johnson-Lindenstrauss lemma is a fundamental result in dimensionality reduction that states that any m points in high-dimensional space can be mapped to a much lower dimension, $\begin{array}{r}{k \geq O \big(\frac{\log m}{\epsilon^{2}} \big)} \end{array}$ , without distorting pairwise distance between any two points by more than a factor of $(1 \pm \epsilon)$ . In fact, such a mapping can be found in randomized polynomial time by projecting the high-dimensional points onto randomly chosen k-dimensional linear subspaces. The Johnson-Lindenstrauss lemma is formally presented in lemma 15.4. The proof of this lemma hinges on lemma 15.2 and lemma 15.3, and it is an example of the “probabilistic method”, in which probabilistic arguments lead to a deterministic statement. Moreover, as we will see, the Johnson-Lindenstrauss lemma follows by showing that the squared norm of a random vector is sharply concentrated around its mean when the vector is projected onto a k-dimensional random subspace.

First, we prove the following property of the $\chi^{2}$ distribution (see definition C.7 in appendix), which will be used in lemma 15.3.

Lemma 15.2 Let Q be a random variable following a $\chi^{2}$ distribution with k degrees of freedom. Then, for any $0 < \epsilon < 1 / 2$ , the following inequality holds:

$$
\mathbb{P}[(1 - \epsilon) k \leq Q \leq(1 + \epsilon) k] \geq 1 - 2e^{-(\epsilon^{2} - \epsilon^{3}) k / 4}.\tag{15.11}
$$

Proof: By Markov’s inequality, we can write

$$
\begin{array}{c} \mathbb{P}[Q \geq(1 + \epsilon) k] = \mathbb{P}[\exp(\lambda Q) \geq \exp(\lambda(1 + \epsilon) k)] \leq \frac{\mathbb{E}[\exp(\lambda Q)]}{\exp(\lambda(1 + \epsilon) k)} \\ = \frac{(1 - 2 \lambda)^{- k / 2}}{\exp(\lambda(1 + \epsilon) k)}, \end{array}
$$

where we used for the final equality the expression of the moment-generating function of $\mathrm{~ a ~} \chi^{2}$ distribution, $\mathbb{E}[\exp(\lambda Q)]$ , for $\lambda < 1 / 2$ (equation (C.25)). Choosing $\begin{array}{r}{\lambda = \frac{\epsilon}{2(1 + \epsilon)} < 1 / 2} \end{array}$ , which minimizes the right-hand side of the final equality, and using the inequality $1 + \epsilon \le \exp(\epsilon -(\epsilon^{2} - \epsilon^{3}) / 2)$ yield

$$
\mathbb{P}[Q \geq(1 + \epsilon) k] \leq \left(\frac{1 + \epsilon}{\exp(\epsilon)}\right)^{k / 2} \leq \left(\frac{\exp \left(\epsilon - \frac{\epsilon^{2} - \epsilon^{3}}{2}\right)}{\exp(\epsilon)}\right)^{k / 2} = \exp \left(- \frac{k}{4}(\epsilon^{2} - \epsilon^{3})\right).
$$

The statement of the lemma follows by using similar techniques to bound $\mathbb{P}[Q \leq$ $(1 - \epsilon) k]$ and by applying the union bound. $\square$

Lemma 15.3 Let $\mathbf{x} \in \mathbb{R}^{N}$ , define $k < N$ and assume that entries in $\mathbf{A} \in \mathbb{R}^{k \times N}$ are sampled independently from the standard normal distribution, $N(0, 1)$ . Then, for any $0 < \epsilon < 1 / 2$ 2

$$
\mathbb{P} \left[(1 - \epsilon) \| \mathbf{x} \|^{2} \leq \| \frac{1}{\sqrt{k}} \mathbf{Ax} \|^{2} \leq(1 + \epsilon) \| \mathbf{x} \|^{2} \right] \geq 1 - 2e^{-(\epsilon^{2} - \epsilon^{3}) k / 4}.\tag{15.12}
$$

Proof: Let $\widehat{\mathbf{x}} = \mathbf{A} \mathbf{x}$ and observe that

$$
\mathbb{E}[\widehat{x}_{j}^{2}] = \mathbb{E} \left[\left(\sum_{i = 1}^{N} A_{ji} x_{i}\right)^{2} \right] = \mathbb{E} \left[\sum_{i = 1}^{N} A_{ji}^{2} x_{i}^{2} \right] = \sum_{i = 1}^{N} x_{i}^{2} = \| \mathbf{x} \|^{2}.
$$

The second and third equalities follow from the independence and unit variance, respectively, of the $A_{ij}$ . Now, define $T_{j} = \widehat{x}_{j} / \vert \vert \mathbf{x} \vert \vert$ and note that the $T_{j} s$ are independent standard normal random variables since the $A_{ij}$ are i.i.d. standard normal random variables and $\mathbb{E}[\widehat{x}_{j}^{2}] = \| \mathbf{x} \|^{2}$ . Thus, the variable $Q$ defined by $\begin{array}{r}{Q = \sum_{j = 1}^{k} T_{j}^{2}} \end{array}$ follows a $\chi^{2}$ distribution with k degrees of freedom and we have

$$
\begin{array}{rl} &{\mathbb{P} \left[(1 - \epsilon) \| \mathbf{x} \|^{2} \leq \frac{\| \widehat{\mathbf{x}} \|^{2}}{k} \leq(1 + \epsilon) \| \mathbf{x} \|^{2} \right] = \mathbb{P} \left[(1 - \epsilon) k \leq \sum_{j = 1}^{k} T_{j}^{2} \leq(1 + \epsilon) k \right]} \\ &{\qquad \qquad \qquad \qquad \qquad = \mathbb{P} \left[(1 - \epsilon) k \leq Q \leq(1 + \epsilon) k \right]} \\ &{\qquad \qquad \qquad \geq 1 - 2e^{-(\epsilon^{2} - \epsilon^{3}) k / 4},} \end{array}
$$

where the final inequality holds by lemma 15.2, thus proving the statement of the lemma. $\square$

Lemma 15.4 (Johnson-Lindenstrauss) For any $0 < \epsilon < 1 / 2$ and any integer m $> 4$ , let $\begin{array}{r}{k = \frac{20 \log m}{\epsilon^{2}}} \end{array}$ . Then for any set V of m points in $\mathbb{R}^{N}$ , there exists a map $f \colon \mathbb{R}^{N} \to \mathbb{R}^{k}$ such that for all u, $\mathbf{v} \in V$

$$
(1 - \epsilon) \| \mathbf{u} - \mathbf{v} \|^{2} \leq \| f(\mathbf{u}) - f(\mathbf{v}) \|^{2} \leq(1 + \epsilon) \| \mathbf{u} - \mathbf{v} \|^{2}.\tag{15.13}
$$

Proof: Let $\textstyle f ={\frac{1}{\sqrt{k}}} \mathbf{A}$ where $k < N$ and entries in $\mathbf{A} \in \mathbb{R}^{k \times N}$ are sampled independently from the standard normal distribution, $N(0, 1)$ . For fixed u, $\mathbf{v} \in V$ , we can apply lemma 15.3, with ${\bf x} ={\bf u} -{\bf v}$ , to lower bound the success probability by $1 - 2 \bar{e}^{-(\bar{\epsilon}^{2} - \epsilon^{3}) k / 4}$ . Applying the union bound over the $\mathrm{O}(m^{2})$ pairs in $V$ , setting $\textstyle k ={\frac{20}{\epsilon^{2}}}$ log m and upper bounding $\epsilon$ by $1 / 2$ , we have

$$
\mathbb{P}[success] \geq 1 - 2m^{2} e^{-(\epsilon^{2} - \epsilon^{3}) k / 4} = 1 - 2m^{5 \epsilon - 3} > 1 - 2m^{- 1 / 2} > 0.
$$

Since the success probability is strictly greater than zero, a map that satisfies the desired conditions must exist, thus proving the statement of the lemma. $\square$

## 15.5 Chapter notes

PCA was introduced in the early 1900s by Pearson [1901]. KPCA was introduced roughly a century later, and our presentation of KPCA is a more concise derivation of results given by Mika et al. [1999]. Isomap and LLE were pioneering works on non-linear dimensionality reduction introduced by Tenenbaum et al. [2000], Roweis and Saul [2000]. Isomap itself is a generalization of a standard linear dimensionality reduction technique called Multidimensional Scaling [Cox and Cox, 2000]. Isomap and LLE led to the development of several related algorithms for manifold learning, e.g., Laplacian Eigenmaps and Maximum Variance Unfolding [Belkin and Niyogi, 2001, Weinberger and Saul, 2006]. As shown in this chapter, classical manifold learning algorithms are special instances of KPCA [Ham et al., 2004]. The Johnson-Lindenstrauss lemma was introduced by Johnson and Lindenstrauss [1984], though our proof of the lemma follows Vempala [2004]. Other simplified proofs of this lemma have also been presented, including Dasgupta and Gupta [2003].

## 15.6 Exercises

15.1 PCA and maximal variance. Let X be an uncentered data matrix and let $\begin{array}{r}{\bar{\mathbf{x}} = \frac{1}{m} \sum_{i} \mathbf{x}_{i}} \end{array}$ be the sample mean of the columns of X.

(a) Show that the variance of one-dimensional projections of the data onto an arbitrary vector u equals $\mathbf{u}^{\top} \mathbf{Cu}$ , where $\begin{array}{r}{\mathbf{C} = \frac{1}{m} \sum_{i}(\mathbf{x}_{i} - \bar{\mathbf{x}})(\mathbf{x}_{i} - \bar{\mathbf{x}})^{\top}} \end{array}$ is the sample covariance matrix.

(b) Show that PCA with k = 1 projects the data onto the direction $(\mathrm{i.e., \u^{\top} \mathbf{u} =}$ 1) of maximal variance.

15.2 Double centering. In this problem we will prove the correctness of the double centering step in Isomap when working with Euclidean distances. Define X and x¯ as in exercise 15.1, and define X∗ as the centered version of X, that is, let $\mathbf{x}_{i}^{*} = \mathbf{x}_{i} - \bar{\mathbf{x}}$ be the ith column of X∗. Let $\mathbf{K} = \mathbf{X}^{\top} \mathbf{X}$ , and let D denote the Euclidean distance matrix, i.e., $\mathbf{D}_{ij} = \| \mathbf{x}_{i} - \mathbf{x}_{j} \|$

(a) Show that $\begin{array}{r}{\mathbf{K}_{ij} = \frac{1}{2}(\mathbf{K}_{ii} + \mathbf{K}_{jj} + \mathbf{D}_{ij}^{2})} \end{array}$

(b) Show that $\begin{array}{r}{\mathbf{K}^{*} ={\mathbf{X}^{*}}^{\top}{\mathbf{X}^{*}} = \mathbf{K} -{\frac{1}{m}} \mathbf{K} \mathbf{1} \mathbf{1}^{\top} -{\frac{1}{m}} \mathbf{1} \mathbf{1}^{\top} \mathbf{K} +{\frac{1}{m^{2}}} \mathbf{1} \mathbf{1}^{\top} \mathbf{K} \mathbf{1} \mathbf{1}^{\top}} \end{array}$

(c) Using the results from (a) and (b) show that

$$
\mathbf{K}_{ij}^{*} = - \frac{1}{2} \left[\mathbf{D}_{ij}^{2} - \frac{1}{m} \sum_{k = 1}^{m} \mathbf{D}_{ik}^{2} - \frac{1}{m} \sum_{k = 1}^{m} \mathbf{D}_{kj}^{2} + \bar{\mathbf{D}} \right],
$$

where $\begin{array}{r}{\bar{\mathbf{D}} = \frac{1}{m^{2}} \sum_{u} \sum_{v} \mathbf{D}_{u, v}^{2}} \end{array}$ is the mean of the $m^{2}$ entries in D.

(d) Show that $\begin{array}{r}{{\bf K}^{*} = - \frac{1}{2}{\bf H}{\bf D}{\bf H}} \end{array}$ , where $\begin{array}{r}{\mathbf{H} = \mathbf{I}_{m} - \frac{1}{m} \mathbf{1} \mathbf{1}^{\top}} \end{array}$

15.3 Laplacian eigenmaps. Assume $k = 1$ and we seek a one-dimensional representation y. Show that (15.7) is equivalent to $\begin{array}{r}{\mathbf y = \operatorname{argmin}_{\mathbf y^{\prime}} \mathbf y^{\prime \top} \mathbf L \mathbf y^{\prime}} \end{array}$ , where L is the graph Laplacian.

15.4 Nystr¨om method. Define the following block representation of a kernel matrix:

$$
\mathbf{K} = \left[\begin{array}{cc} \mathbf{W} & \mathbf{K}_{21}^{\top} \\ \mathbf{K}_{21} & \mathbf{K}_{22} \end{array} \right] \quad \text{and} \quad \mathbf{C} = \left[\begin{array}{c} \mathbf{W} \\ \mathbf{K}_{21} \end{array} \right].
$$

The Nystr¨om method uses $\mathbf{W} \in \mathbb{R}^{l \times l}$ and $\mathbf{C} \in \mathbb{R}^{m \times l}$ to generate the approximation $\widetilde{\mathbf{K}} = \mathbf{C} \mathbf{W}^{\dagger} \mathbf{C}^{\top} \approx \mathbf{K}$

(a) Show that W is SPSD and that $\begin{array}{r}{\| \mathbf{K} - \widetilde{\mathbf{K}} \|_{F} = \| \mathbf{K}_{22} - \mathbf{K}_{21} \mathbf{W}^{\dagger} \mathbf{K}_{21}^{\top} \|_{F}.} \end{array}$

(b) Let $\mathbf{K} = \mathbf{X}^{\top} \mathbf{X}$ for some $\mathbf{X} \in \mathbb{R}^{N \times m}$ , and let $\mathbf{X}^{\prime} \in \mathbb{R}^{N \times l}$ be the first l columns of X. Show that $\widetilde{\mathbf{K}} = \mathbf{X}^{\top} \mathbb{P}_{U_{X^{\prime}}} \mathbf{X}$ , where $\mathbb{P}_{U_{X^{\prime}}}$ is the orthogonal projection onto the span of the left singular vectors of $\mathbf{X}^{\prime}$

(c) Is $\mathrm{\widetilde{\bf K}} \mathrm{\SPSD ?}$

(d) If $\operatorname{rank}(\mathbf{K}) = \operatorname{rank}(\mathbf{W}) = r \ll m$ , show that $\widetilde{\mathbf{K}} = \mathbf{K}$ . Note: this statement holds whenever rank $(\mathbf{K}) = \operatorname{rank}(\mathbf{W})$ , but is of interest mainly in the lowrank setting.

(e) If $m = 20 \mathrm{M}$ and K is a dense matrix, how much space is required to store K if each entry is stored as a double? How much space is required by the Nystr¨om method if $l = \mathrm{{10K ?}}$

15.5 Expression for ${\bf K}_{LLE}$ . Show the connection between LLE and KPCA by deriving the expression for ${\bf K}_{LLE}$

15.6 Random projection, PCA, and nearest neighbors.

(a) Download the MNIST test set of handwritten digits at:

http: $/ / \mathrm{yann.1ecun.com / exdb / mnist / t10k - images^{-} idx3 \mathrm{-} ubyte.} ~ \mathrm{gz} \mathrm{nd} \mathrm{\cdot} ~ \mathrm{g.}$

Create a data matrix $\mathbf{X} \in \mathbb{R}^{N \times m}$ from the first $m = 2{,} 000$ instances of this dataset (the dimension of each instance should be $N = 784)$

(b) Find the ten nearest neighbors for each point in X, that is, compute $\mathcal{N}_{i, 10}$ for $1 \leq i \leq m$ , where $\mathcal{N}_{i, t}$ denotes the set of the t nearest neighbors for the ith datapoint and nearest neighbors are defined with respect to the $L_{2}$ norm. Also compute $\mathcal{N}_{i, 50}$ for all i.

(c) Generate $\tilde{\mathbf{X}} = \mathbf{A} \mathbf{X}$ , where $\mathbf{A} \in \mathbb{R}^{k \times N}, k = 100$ and entries of A are sampled independently from the standard normal distribution. Find the ten nearest neighbors for each point in $\tilde{\mathbf{X}}$ , that is, compute $\tilde{\mathcal{N}}_{i, 10}$ for $1 \leq i \leq m$

(d) Report the quality of approximation by computing score $\begin{array}{r}{\mathbf{\Lambda}_{10} = \frac{1}{m} \sum_{i = 1}^{m} | \mathcal{N}_{i, 10} |} \end{array}$ $\tilde{\mathcal{N}}_{i, 10} |$ . Similarly, compute sco $\begin{array}{r}{\cdot e_{50} = \frac{1}{m} \sum_{i = 1}^{m} | \mathcal{N}_{i, 50} \cap \tilde{\mathcal{N}}_{i, 10} |,} \end{array}$

(e) Generate two plots that show score<sub>10</sub> and score<sub>50</sub> as functions of k (i.e., perform steps (c) and (d) for $k = \{1, 10, 50, 100, 250, 500\})$ ). Provide a oneor two-sentence explanation of these plots.

(f) Generate similar plots as in (e) using PCA (with various values of k) to generate $\tilde{\mathbf{X}}$ and subsequently compute nearest neighbors. Are the nearest neighbor approximations generated via PCA better or worse than those generated via random projections? Explain why.

This chapter presents an introduction to the problem of learning languages. This is a classical problem explored since the early days of formal language theory and computer science, and there is a very large body of literature dealing with related mathematical questions. In this chapter, we present a brief introduction to this problem and concentrate specifically on the question of learning finite automata, which, by itself, has been a topic investigated in multiple forms by thousands of technical papers. We will examine two broad frameworks for learning automata, and for each, we will present an algorithm. In particular, we describe an algorithm for learning automata in which the learner has access to several types of query, and we discuss an algorithm for identifying a sub-class of the family of automata in the limit.


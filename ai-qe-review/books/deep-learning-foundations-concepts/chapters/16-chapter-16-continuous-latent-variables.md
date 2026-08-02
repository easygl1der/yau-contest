---
title: "Chapter 16 \u2014 Continuous Latent Variables"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 16
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 12346
source_line_end: 13249
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 27
source_empty_image_alt: 27
non_semantic_image_alt: 21
caption_derived_image_alt: 6
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 2
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 16 — Continuous Latent Variables

> [[../README|本书目录]] · [[15-chapter-15-discrete-latent-variables|上一章]] · [[17-chapter-17-generative-adversarial-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 12346–13249。
> - 本章保留 27 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 2；PDF-confirmed exercise difficulty marker (PDF p.544) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 16.1. Principal Component Analysis

Principal component analysis, or PCA, is widely used for applications such as dimensionality reduction, lossy data compression, feature extraction, and data visualization (Jolliffe, 2002). It is also known as the Kosambi–Karhunen–Loeve\` transform.

Consider the orthogonal projection of a data set onto a lower-dimensional linear space, known as the principal subspace, as shown in Figure 16.2. PCA can be defined as the linear projection that maximizes the variance of the projected data (Hotelling, 1933). Equivalently, it can be defined as the linear projection that minimizes the average projection cost, defined as the mean squared distance between the data points and their projections (Pearson, 1901). We consider each of these definitions in turn.

## 16.1.1 Maximum variance formulation

Consider a data set of observations $\left\{\mathbf{x}_{n} \right\}$ where $n = 1, \ldots, N$ , and ${\bf x}_{n}$ is a Euclidean variable with dimensionality D. Our goal is to project the data onto a space having dimensionality $M < D$ while maximizing the variance of the projected data. For the moment, we will assume that the value of M is given. Later in this chapter, we will consider techniques to determine an appropriate value of M from the data.

To begin with, consider the projection onto a one-dimensional space $(M = 1)$ . We can define the direction of this space using a D-dimensional vector $\mathbf{u}_{1}$ , which for convenience (and without loss of generality) we will choose to be a unit vector so that ${\bf u}_{1}^{\mathrm{T}}{\bf u}_{1} = 1$ (note that we are interested only in the direction defined by $\mathbf{u}_{1}$ not in the magnitude of $\mathbf{u}_{1}$ itself). Each data point ${\bf x}_{n}$ is then projected onto a scalar value ${\bf u}_{1}^{\mathrm{T}}{\bf x}_{n}$ . The mean of the projected data is $\mathbf{u}_{1}^{\mathrm{T}} \overline{{\mathbf{x}}}$ where x is the sample set mean given by

$$
\overline{{\mathbf{x}}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n}\tag{16.1}
$$

and the variance of the projected data is given by

$$
\frac{1}{N} \sum_{n = 1}^{N} \left\{\mathbf{u}_{1}^{\mathrm{T}} \mathbf{x}_{n} - \mathbf{u}_{1}^{\mathrm{T}} \overline{{\mathbf{x}}} \right\}^{2} = \mathbf{u}_{1}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{1}\tag{16.2}
$$

where $\mathbf{S}$ is the data covariance matrix defined by

$$
\mathbf{S} ={\frac{1}{N}} \sum_{n = 1}^{N}(\mathbf{x}_{n} -{\overline{{\mathbf{x}}}})(\mathbf{x}_{n} -{\overline{{\mathbf{x}}}})^{\mathrm{T}}.\tag{16.3}
$$

We now maximize the projected variance ${\bf u}_{1}^{\mathrm{T}}{\bf S}{\bf u}_{1}$ with respect to $\mathbf{u}_{1}$ . Clearly, this has to be a constrained maximization to prevent $\| \mathbf{u}_{1} \| \infty$ . The appropriate constraint comes from the normalization condition $\mathbf{u}_{1}^{\mathrm{T}} \mathbf{u}_{1} ~ = ~ 1$ . To enforce this constraint, we introduce a Lagrange multiplier that we will denote by $\lambda_{1}$ , and then make an unconstrained maximization of

$$
\mathbf{u}_{1}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{1} + \lambda_{1} \left(1 - \mathbf{u}_{1}^{\mathrm{T}} \mathbf{u}_{1} \right).\tag{16.4}
$$

By setting the derivative with respect to $\mathbf{u}_{1}$ equal to zero, we see that this quantity will have a stationary point when

$$
\mathbf{S} \mathbf{u}_{1} = \lambda_{1} \mathbf{u}_{1},\tag{16.5}
$$

which says that $\mathbf{u}_{1}$ must be an eigenvector of S. If we left-multiply by ${\bf u}_{1}^{\mathrm{T}}$ and make use of ${\bf u}_{1}^{\mathrm{T}}{\bf u}_{1} = 1$ , we see that the variance is given by

$$
\mathbf{u}_{1}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{1} = \lambda_{1}\tag{16.6}
$$

and so the variance will be a maximum when we set $\mathbf{u}_{1}$ equal to the eigenvector having the largest eigenvalue $\lambda_{1}$ . This eigenvector is known as the first principal component.

We can define additional principal components in an incremental fashion by choosing each new direction to be that which maximizes the projected variance amongst all possible directions orthogonal to those already considered. If we consider the general case of an M-dimensional projection space, the optimal linear projection for which the variance of the projected data is maximized is now defined by the M eigenvectors $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ of the data covariance matrix S corresponding to the M largest eigenvalues $\lambda_{1}, \dots, \lambda_{M}$ . This is easily shown using proof by induction.

To summarize, PCA involves evaluating the mean x and the covariance matrix S of a data set and then finding the M eigenvectors of S corresponding to the M largest eigenvalues. Algorithms for finding eigenvectors and eigenvalues, as well as additional theorems related to eigenvector decomposition, can be found in Golub and Van Loan (1996). Note that the computational cost of computing the full eigenvector decomposition for a matrix of size $D \times D$ is $\mathcal{O}(D^{3})$ . If we plan to project our data onto the first M principal components, then we only need to find the first M eigenvalues and eigenvectors. This can be done with more efficient techniques, such as the power method (Golub and Van Loan, 1996), that scale like $\mathcal{O}(\bar{M} D^{2})$ , or alternatively we can make use of the EM algorithm.

## 16.1.2 Minimum-error formulation

We now discuss an alternative formulation of PCA based on projection error minimization. To do this, we introduce a complete orthonormal set of D-dimensional basis vectors $\left\{{{\bf{u}}_{i}} \right\}$ where $i = 1, \ldots, D$ that satisfy

$$
\begin{array}{r}{{\bf u}_{i}^{\mathrm{T}}{\bf u}_{j} = \delta_{ij}.} \end{array}\tag{16.7}
$$

Because this basis is complete, each data point can be represented exactly by a linear combination of the basis vectors

$$
\mathbf{x}_{n} = \sum_{i = 1}^{D} \alpha_{ni} \mathbf{u}_{i}\tag{16.8}
$$

where the coefficients $\alpha_{ni}$ will be different for different data points. This simply corresponds to a rotation of the coordinate system to a new system defined by the $\left\{{{\bf{u}}_{i}} \right\}$ , and the original $D$ components $\{x_{n1}, \ldots, x_{nD}\}$ are replaced by an equivalent set $\left\{\alpha_{n1}, \ldots, \alpha_{nD} \right\}$ . Taking the inner product with $\mathbf{u}_{j}$ , and making use of the orthonormality property, we obtain $\alpha_{nj} = \mathbf{x}_{n}^{\mathrm{T}} \mathbf{u}_{j}$ , and so without loss of generality we can write

$$
\mathbf{x}_{n} = \sum_{i = 1}^{D} \left(\mathbf{x}_{n}^{\mathrm{{T}}} \mathbf{u}_{i} \right) \mathbf{u}_{i}.\tag{16.9}
$$

Our goal, however, is to approximate this data point using a representation involving a restricted number $M < D$ of variables corresponding to a projection onto a lower-dimensional subspace. The M-dimensional linear subspace can be represented, without loss of generality, by the first $M$ of the basis vectors, and so we approximate each data point ${\bf x}_{n}$ by

$$
\widetilde{\mathbf{x}}_{n} = \sum_{i = 1}^{M} z_{ni} \mathbf{u}_{i} + \sum_{i = M + 1}^{D} b_{i} \mathbf{u}_{i}\tag{16.10}
$$

where the $\left\{z_{ni} \right\}$ depend on the particular data point, whereas the $\{b_{i}\}$ are constants that are the same for all data points. We are free to choose the $\left\{{\bf{u}}_{i} \right\}$ , the $\left\{z_{ni} \right\}$ , and the $\{b_{i}\}$ so as to minimize the error introduced by the reduction in dimensionality. $\mathbf{A} \mathbf{s}$ our error measure, we will use the squared distance between the original data point ${\bf x}_{n}$ and its approximation $\widetilde{\mathbf{x}}_{n}$ , averaged over the data set, so that our goal is to minimize

$$
J = \frac{1}{N} \sum_{n = 1}^{N} \| \mathbf{x}_{n} - \widetilde{\mathbf{x}}_{n} \|^{2}.\tag{16.11}
$$

Consider first the minimization with respect to the quantities $\left\{z_{ni} \right\}$ . Substituting for $\widetilde{\mathbf{x}}_{n}$ , setting the derivative with respect to $z_{nj}$ to zero, and making use of the orthonormality conditions, we obtain

$$
z_{nj} = \mathbf{x}_{n}^{\mathrm{T}} \mathbf{u}_{j}\tag{16.12}
$$

where $j = 1, \dots, M$ . Similarly, setting the derivative of $J$ with respect to $b_{i}$ to zero and again making use of the orthonormality relations, gives

$$
b_{j} = \overline{{\mathbf{x}}}^{\mathrm{T}} \mathbf{u}_{j}\tag{16.13}
$$

where $j = M + 1, \dotsc, D$ . If we substitute for $z_{ni}$ and $b_{i}$ and make use of the general expansion (16.9), we obtain

$$
\mathbf{x}_{n} - \widetilde{\mathbf{x}}_{n} = \sum_{i = M + 1}^{D} \left\{(\mathbf{x}_{n} - \overline{{\mathbf{x}}})^{\mathrm{T}} \mathbf{u}_{i} \right\} \mathbf{u}_{i}\tag{16.14}
$$

from which we see that the displacement vector from ${\bf x}_{n}$ to $\widetilde{\mathbf{x}}_{n}$ lies in the space orthogonal to the principal subspace, because it is a linear combination of $\left\{{{\bf{u}}_{i}} \right\}$ for $i = M + 1, \ldots, D.$ , as illustrated in Figure 16.2. This is to be expected because the projected points $\widetilde{\mathbf{x}}_{n}$ must lie within the principal subspace, but we can move them freely within that subspace, and so the minimum error is given by the orthogonal projection.

We therefore obtain an expression for the error measure J as a function purely of the $\left\{{\bf{u}}_{i} \right\}$ in the form

$$
J = \frac{1}{N} \sum_{n = 1}^{N} \sum_{i = M + 1}^{D} \left(\mathbf{x}_{n}^{\mathrm{{T}}} \mathbf{u}_{i} - \overline{{\mathbf{x}}}^{\mathrm{{T}}} \mathbf{u}_{i} \right)^{2} = \sum_{i = M + 1}^{D} \mathbf{u}_{i}^{\mathrm{{T}}} \mathbf{S} \mathbf{u}_{i}.\tag{16.15}
$$

There remains the task of minimizing J with respect to the $\{\mathbf{u}_{i}\}$ , which must be a constrained minimization otherwise we will obtain the vacuous result $\mathbf{u}_{i} = 0$ . The constraints arise from the orthonormality conditions, and as we will see, the solution will be expressed in terms of the eigenvector expansion of the covariance matrix. Before considering a formal solution, let us try to obtain some intuition about the result by considering a two-dimensional data space $D = 2$ and a one-dimensional principal subspace $M = 1$ . We have to choose a direction $\mathbf{u}_{2}$ so as to minimize $\bar{\mathbf{J}} = \bar{\mathbf{u}}_{2}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{2}$ , subject to the normalization constraint $\mathbf{u}_{2}^{\mathrm{T}} \mathbf{u}_{2} = 1$ . Using a Lagrange multiplier $\lambda_{2}$ to enforce the constraint, we consider the minimization of

$$
\widetilde{J} = \mathbf{u}_{2}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{2} + \lambda_{2} \left(1 - \mathbf{u}_{2}^{\mathrm{T}} \mathbf{u}_{2} \right).\tag{16.16}
$$

Setting the derivative with respect to $\mathbf{u}_{2}$ to zero, we obtain $\mathbf{S} \mathbf{u}_{2} \ = \ \lambda_{2} \mathbf{u}_{2}$ so that $\mathbf{u}_{2}$ is an eigenvector of S with eigenvalue $\lambda_{2}$ . Thus, any eigenvector will define a stationary point of the error measure. To find the value of J at the minimum, we back-substitute the solution for $\mathbf{u}_{2}$ into the error measure to give $J = \lambda_{2}$ . We therefore obtain the minimum value of J by choosing $\mathbf{u}_{2}$ to be the eigenvector corresponding to the smaller of the two eigenvalues. Thus, we should choose the principal subspace to be aligned with the eigenvector having the larger eigenvalue. This result accords with our intuition that, to minimize the average squared projection distance, we should choose the principal component subspace so that it passes through the mean of the data points and is aligned with the directions of maximum variance. If the eigenvalues are equal, any choice of principal direction will give rise to the same value of J.

The general solution to the minimization of J for arbitrary $D$ and arbitrary $M <$ D is obtained by choosing the $\left\{{{\bf{u}}_{i}} \right\}$ to be eigenvectors of the covariance matrix given by

$$
\mathbf{S} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{i}\tag{16.17}
$$

where $i = 1, \ldots, D$ , and as usual the eigenvectors $\left\{{{\bf{u}}_{i}} \right\}$ are chosen to be orthonormal. The corresponding value of the error measure is then given by

$$
J = \sum_{i = M + 1}^{D} \lambda_{i},\tag{16.18}
$$

which is simply the sum of the eigenvalues of those eigenvectors that are orthogonal to the principal subspace. We therefore obtain the minimum value of J by selecting these eigenvectors to be those having the $D - M$ smallest eigenvalues, and hence the eigenvectors defining the principal subspace are those corresponding to the M largest eigenvalues.

Although we have considered $M \ : < \ : D$ , the PCA analysis still holds if $M =$ $D,$ in which case there is no dimensionality reduction but simply a rotation of the coordinate axes to align with the principal components.

Finally, note that there is a related linear dimensionality reduction technique called canonical correlation analysis (Hotelling, 1936; Bach and Jordan, 2002). Whereas PCA works with a single random variable, canonical correlation analysis considers two (or more) variables and tries to find a corresponding pair of linear subspaces that have high cross-correlation, so that each component within one of the subspaces is correlated with a single component from the other subspace. Its solution can be expressed in terms of a generalized eigenvector problem.

## 16.1.3 Data compression

One application for PCA is data compression, and we can illustrate this by considering a data set of images of handwritten digits. Because each eigenvector of the covariance matrix is a vector in the original D-dimensional space, we can represent the eigenvectors as images of the same size as the data points. The mean image and the first four eigenvectors, along with their corresponding eigenvalues, are shown in Figure 16.3.

A plot of the complete spectrum of eigenvalues, sorted into decreasing order, is shown in Figure 16.4(a). The error measure J associated with choosing a particular value of M is given by the sum of the eigenvalues from M + 1 up to $D$ and is plotted for different values of M in Figure 16.4(b).

If we substitute (16.12) and (16.13) into (16.10), we can write the PCA approx-

![Figure 16.3](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/6b0695de96e3101764bef711d9215562f58da57eaf5afbee0791dc2723753eea.jpg)  
Figure 16.3 Illustration of PCA applied to a data set of 6,000 images of size $28 \times 28$ , each comprising a handwritten image of the numeral $\mathfrak{s}$ , showing the mean vector x along with the first four PCA eigenvectors $\mathbf{u}_{1}, \ldots, \mathbf{u}_{4}$ together with their corresponding eigenvalues.

imation to a data vector ${\bf x}_{n}$ in the form

$$
\begin{array}{rcl}{\widetilde{\mathbf{x}}_{n}} &{=} &{\displaystyle \sum_{i = 1}^{M}(\mathbf{x}_{n}^{\mathrm{T}} \mathbf{u}_{i}) \mathbf{u}_{i} + \sum_{i = M + 1}^{D}(\overline{{\mathbf{x}}}^{\mathrm{T}} \mathbf{u}_{i}) \mathbf{u}_{i}} \\ &{=} &{\displaystyle \overline{{\mathbf{x}}} + \sum_{i = 1}^{M} \left(\mathbf{x}_{n}^{\mathrm{T}} \mathbf{u}_{i} - \overline{{\mathbf{x}}}^{\mathrm{T}} \mathbf{u}_{i} \right) \mathbf{u}_{i}} \end{array}\tag{16.19}
$$

(16.20)

where we have made use of the relation

$$
\overline{{\mathbf{x}}} = \sum_{i = 1}^{D} \left(\overline{{\mathbf{x}}}^{\mathrm{T}} \mathbf{u}_{i} \right) \mathbf{u}_{i},\tag{16.21}
$$

which follows from the completeness of the $\left\{{{\bf{u}}_{i}} \right\}$ . This represents a compression of the data set, because for each data point we have replaced the D-dimensional vector ${\bf x}_{n}$ with an M-dimensional vector having components $\left(\mathbf{x}_{n}^{\mathrm{{T}}} \mathbf{u}_{i} - \overline{{\mathbf{x}}}^{\mathrm{{T}}} \mathbf{u}_{i} \right)$ . The smaller the value of M, the greater the degree of compression. Examples of PCA reconstructions of data points for the digits data set are shown in Figure 16.5.

## 16.1.4 Data whitening

Another application of PCA is to data pre-processing. In this case, the goal is not dimensionality reduction but rather the transformation of a data set to standardize certain of its properties. This can be important in allowing subsequent machine learning algorithms to be applied successfully to the data set. Typically, it is done when the original variables are measured in various different units or have significantly different variabilities. For instance in the Old Faithful data set, the time between eruptions is typically an order of magnitude greater than the duration of an eruption. When we applied the K-means algorithm to this data set, we first made a separate linear re-scaling of the individual variables such that each variable had zero mean and unit variance. This is known as standardizing the data, and the covariance matrix for the standardized data has components

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/31b080a3d60ac39cb424fc4e54b2997242c9b684e05858b933311f5b9d62b6cc.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/81841ed13b829c0ae09fa8a7485a335536b06fe08dc6748d33fed435c477ba9c.jpg)  
(b)  
Figure 16.4 (a) Plot of the eigenvalue spectrum for the data set of handwritten digits used in Figure 16.3. (b) Plot of the sum of the discarded eigenvalues, which represents the sum-of-squares error J introduced by projecting the data onto a principal component subspace of dimensionality M.

$$
\rho_{ij} = \frac{1}{N} \sum_{n = 1}^{N} \frac{(x_{ni} - \overline{{x}}_{i})}{\sigma_{i}} \frac{(x_{nj} - \overline{{x}}_{j})}{\sigma_{j}}\tag{16.22}
$$

where $\sigma_{i}$ is the standard deviation of $x_{i}$ . This is known as the correlation matrix of the original data and has the property that if two components $x_{i}$ and $x_{j}$ of the data are perfectly correlated, then $\rho_{ij} = 1$ , and if they are uncorrelated, then $\rho_{ij} = 0$

However, using PCA we can make a more substantial normalization of the data to give it zero mean and unit covariance, so that different variables become decorre-

![Figure 16.5](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b50876a2df5ad83533f0fa9d7369851d304dcfa7155ebf9cce97df745c6de322.jpg)  
Figure 16.5 An example from the data set of handwritten digits together with its PCA reconstructions obtained by retaining M principal components for various values of M. As M increases, the reconstruction becomes more accurate and would become perfect when $M = D = 28 \times 28 = 784$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/459ccddcfd30ae0271e6440e719d7d8e6ea4cbf8b843483845d9dc345a6118e7.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/48f9b8a4a129eff52fd656d79ffdaab5b2480fcf1cfa05c2004d1de81ad1e509.jpg)

![Figure 16.6](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/0ff8c6da4d5deb383dddea91add4e5f6888bcb4db50a68475a00bc9b0f4a2776.jpg)  
Figure 16.6 Illustration of the effects of linear pre-processing applied to the Old Faithful data set. The plot on the left shows the original data. The centre plot shows the result of standardizing the individual variables to zero mean and unit variance. Also shown are the principal axes of this normalized data set, plotted over the range $\pm \lambda_{i}^{1 / 2}$ . The plot on the right shows the result of whitening the data to give it zero mean and unit covariance.

lated. To do this, we first write the eigenvector equation (16.17) in the form

$$
\mathbf{SU} = \mathbf{UL}\tag{16.23}
$$

where $\mathbf{L}$ is a $D \times D$ diagonal matrix with elements $\lambda_{i}$ , and U is a $D \times D$ orthogonal matrix with columns given by $\mathbf{u}_{i}$ . Then we define, for each data point $\mathbf{x}_{n}.$ , a transformed value given by

$$
{\bf y}_{n} ={\bf L}^{- 1 / 2}{\bf U}^{\mathrm{T}}({\bf x}_{n} - \overline{{\bf x}})\tag{16.24}
$$

where $\overline{{\mathbf{x}}}$ is the sample mean defined by (16.1). Clearly, the set $\left\{\mathbf{y}_{n} \right\}$ has zero mean, and its covariance is given by the identity matrix because

$$
\begin{array}{rcl}{\displaystyle \frac{1}{N} \sum_{n = 1}^{N} \mathbf{y}_{n} \mathbf{y}_{n}^{\mathrm{T}}} &{=} &{\displaystyle \frac{1}{N} \sum_{n = 1}^{N} \mathbf{L}^{- 1 / 2} \mathbf{U}^{\mathrm{T}}(\mathbf{x}_{n} - \overline{{\mathbf{x}}})(\mathbf{x}_{n} - \overline{{\mathbf{x}}})^{\mathrm{T}} \mathbf{U} \mathbf{L}^{- 1 / 2}} \\ &{=} &{\mathbf{L}^{- 1 / 2} \mathbf{U}^{\mathrm{T}} \mathbf{S} \mathbf{U} \mathbf{L}^{- 1 / 2} = \mathbf{L}^{- 1 / 2} \mathbf{L} \mathbf{L}^{- 1 / 2} = \mathbf{I}.} \end{array}\tag{16.25}
$$

This operation is known as whitening or sphering the data and is illustrated for the Old Faithful data set in Figure 16.6.

## 16.1.5 High-dimensional data

In some applications of PCA, the number of data points is smaller than the dimensionality of the data space. For example, we might want to apply PCA to a data set of a few hundred images, each of which corresponds to a vector in a space of potentially several million dimensions (corresponding to three colour values for each of the pixels in the image). Note that in a D-dimensional space, a set of N points, where $N < D$ , defines a linear subspace whose dimensionality is at most $N - 1$ , and so there is little point in applying PCA for values of M that are greater than $N - 1$ Indeed, if we perform PCA we will find that at least $D - N + 1$ of the eigenvalues are zero, corresponding to eigenvectors along whose directions the data set has zero variance. Furthermore, typical algorithms for finding the eigenvectors of a $D \times D$ matrix have a computational cost that scales like $\mathcal{O}(D^{3})$ , and so for applications such as the image example, a direct application of PCA will be computationally infeasible.

We can resolve this problem as follows. First, let us define X to be the $(N \times D)$ dimensional centred data matrix, whose nth row is given by $({\bf x}_{n} -{\overline{{\bf x}}})^{\mathrm{T}}$ . The covariance matrix (16.3) can then be written as ${\bf S} = N^{{- 1}}{\bf X}^{\mathrm{T}}{\dot{\bf X}}$ , and the corresponding eigenvector equation becomes

$$
\frac{1}{N} \mathbf{X}^{\mathrm{{T}}} \mathbf{X} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{i}.\tag{16.26}
$$

Now pre-multiply both sides by X to give

$$
\frac{1}{N}{\bf X}{\bf X}^{\mathrm{T}}({\bf X}{\bf u}_{i}) = \lambda_{i}({\bf X}{\bf u}_{i}).\tag{16.27}
$$

If we now define $\mathbf{v}_{i} = \mathbf{X} \mathbf{u}_{i}$ , we obtain

$$
\frac{1}{N} \mathbf{X} \mathbf{X}^{\mathrm{{T}}} \mathbf{v}_{i} = \lambda_{i} \mathbf{v}_{i},\tag{16.28}
$$

which is an eigenvector equation for the $N \times N$ matrix $N^{- 1} \mathbf{X} \mathbf{X}^{\mathrm{{T}}}$ . We see that this has the same $N - 1$ eigenvalues as the original covariance matrix (which itself has an additional $D - N + 1$ eigenvalues of value zero). Thus, we can solve the eigenvector problem in spaces of lower dimensionality with computational cost $\mathcal{O}(N^{\mathrm{{3}}})$ instead of $\mathcal{O}(D^{3})$ . To determine the eigenvectors, we multiply both sides of (16.28) by $\mathbf{X}^{\mathrm{{T}}}$ to give

$$
\left({\frac{1}{N}}{\bf X}^{\mathrm{T}}{\bf X} \right) \left({\bf X}^{\mathrm{T}}{\bf v}_{i} \right) = \lambda_{i}{\left({\bf X}^{\mathrm{T}}{\bf v}_{i} \right)}\tag{16.29}
$$

from which we see that $\left(\mathbf{X}^{\mathrm{{T}}} \mathbf{v}_{i} \right)$ is an eigenvector of S with eigenvalue $\lambda_{i}$ . Note, however, that these eigenvectors are not necessarily normalized. To determine the appropriate normalization, we re-scale $\mathbf{u}_{i} \propto \mathbf{X}^{\mathrm{{T}}} \mathbf{v}_{i}$ by a constant such that $\left\| \mathbf{u}_{i} \right\| = 1$ which, assuming $\mathbf{v}_{i}$ has been normalized to unit length, gives

$$
\mathbf{u}_{i} = \frac{1}{(N \lambda_{i})^{1 / 2}} \mathbf{X}^{\mathrm{T}} \mathbf{v}_{i}.\tag{16.30}
$$

In summary, to apply this approach we first evaluate $\mathbf{XX^{\mathrm{T}}}$ and then find its eigenvectors and eigenvalues and then compute the eigenvectors in the original data space using (16.30).

## 16.2. Probabilistic Latent Variables

We have seen in the previous section that PCA can be defined in terms of a linear projection of the data onto a subspace of lower dimensionality than the original data space. Each data point projects to a unique value of the quantities $z_{nj}$ defined by (16.12), and we can view these quantities as deterministic latent variables. To introduce and motivate probabilistic continuous latent variables, we now show that PCA can also be expressed as the maximum likelihood solution of a probabilistic latentvariable model. This reformulation of PCA, known as probabilistic PCA, has several advantages compared with conventional PCA:

- A probabilistic PCA model represents a constrained form of a Gaussian distribution in which the number of free parameters can be restricted while still allowing the model to capture the dominant correlations in a data set.

- We can derive an EM algorithm for PCA that is computationally efficient in situations where only a few leading eigenvectors are required and that avoids having to evaluate the data covariance matrix as an intermediate step.

- The combination of a probabilistic model and EM allows us to deal with missing values in the data set.

- Mixtures of probabilistic PCA models can be formulated in a principled way and trained using the EM algorithm.

- The existence of a likelihood function allows direct comparison with other probabilistic density models. By contrast, conventional PCA will assign a low reconstruction cost to data points that are close to the principal subspace even if they lie arbitrarily far from the training data.

- Probabilistic PCA can be used to model class-conditional densities and hence be applied to classification problems.

- A probabilistic PCA model can be run generatively to provide samples from the distribution.

- Probabilistic PCA forms the basis for a Bayesian treatment of PCA in which the dimensionality of the principal subspace can be found automatically from the data (Bishop, 2006).

This formulation of PCA as a probabilistic model was proposed independently by Tipping and Bishop 1997; 1999 and by Roweis (1998). As we will see later, it is closely related to factor analysis (Basilevsky, 1994).

## 16.2.1 Generative model

Probabilistic PCA is a simple example of the linear-Gaussian framework in which all the marginal and conditional distributions are Gaussian. We can formulate probabilistic PCA by first introducing an explicit M-dimensional latent variable z corresponding to the principal-component subspace. Next we define a Gaussian prior distribution $p(\mathbf{z})$ over the latent variable, together with a Gaussian conditional distribution $p(\mathbf{x} | \mathbf{z})$ for the D-dimensional observed variable x conditioned on the value of the latent variable. Specifically, the prior distribution over z is given by a zero-mean unit-covariance Gaussian:

$$
\begin{array}{r}{p(\mathbf{z}) = \mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I}).} \end{array}\tag{16.31}
$$

Similarly, the conditional distribution of the observed variable x, conditioned on the value of the latent variable z, is again Gaussian:

$$
p(\mathbf{x} | \mathbf{z}) = \mathcal{N}(\mathbf{x} | \mathbf{W} \mathbf{z} + \pmb{\mu}, \sigma^{2} \mathbf{I})\tag{16.32}
$$

in which the mean of x is a general linear function of z governed by the $D \times M$ matrix W and the D-dimensional vector $\mu.$ Note that this factorizes with respect to the elements of $\mathbf{x}.$ In other words this is an example of a naive Bayes model. As we will see shortly, the columns of W span a linear subspace within the data space that corresponds to the principal subspace. The other parameter in this model is the scalar $\sigma^{2}$ governing the variance of the conditional distribution. Note that there is no loss of generality in assuming a zero-mean unit-covariance Gaussian for the latent distribution $p(\mathbf{z})$ because a more general Gaussian distribution would give rise to an equivalent probabilistic model.

We can view the probabilistic PCA model from a generative viewpoint in which a sampled value of the observed variable is obtained by first choosing a value for the latent variable and then sampling the observed variable conditioned on this latent value. Specifically, the D-dimensional observed variable x is defined by a linear transformation of the M-dimensional latent variable z plus additive Gaussian noise, so that

$$
\mathbf{x} = \mathbf{W} \mathbf{z} + \pmb{\mu} + \pmb{\epsilon}\tag{16.33}
$$

where z is an M-dimensional Gaussian latent variable, and $\epsilon$ is a D-dimensional zero-mean Gaussian-distributed noise variable with covariance $\sigma^{2} \mathbf{I}$ . This generative process is illustrated in Figure 16.7. Note that this framework is based on a mapping from latent space to data space, in contrast to the more conventional view of PCA discussed above. The reverse mapping, from data space to the latent space, will be obtained shortly using Bayes’ theorem.

## 16.2.2 Likelihood function

Suppose we wish to determine the values of the parameters W, $\mu,$ , and $\sigma^{2}$ using maximum likelihood. To write down the likelihood function, we need an expression for the marginal distribution $p(\mathbf{x})$ of the observed variable. This is expressed, from the sum and product rules of probability, in the form

$$
p(\mathbf{x}) = \int p(\mathbf{x} | \mathbf{z}) p(\mathbf{z}) d \mathbf{z}.\tag{16.34}
$$

Because this corresponds to a linear-Gaussian model, this marginal distribution is again Gaussian, and is given by

![Figure 16.7](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/7426589bff4932a62f986853122351ebb6b0ad23efd63ea18606c7cfc8307921.jpg)  
Figure 16.7 An illustration of the generative view of a probabilistic PCA model for a two-dimensional data space and a one-dimensional latent space. An observed data point x is generated by first drawing a value <sup>b</sup>z for the latent variable from its prior distribution $p(z)$ and then drawing a value for x from an isotropic Gaussian distribution (illustrated by the red circles) having mean $\widehat{\mathbf{w}_{z}} + \mu$ and covariance $\sigma^{2} \mathbf{I}$ . The green ellipses show the density contours for the marginal distribution $p(\mathbf{x})$

$$
p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \mathbf{C})\tag{16.35}
$$

where the $D \times D$ covariance matrix C is defined by

$$
\mathbf{C} = \mathbf{W} \mathbf{W}^{\mathrm{T}} + \sigma^{2} \mathbf{I}.\tag{16.36}
$$

This result can also be derived more directly by noting that the predictive distribution will be Gaussian and then evaluating its mean and covariance using (16.33). This gives

$$
\mathbb{E}[\mathbf{x}] = \mathbb{E}[\mathbf{W} \mathbf{z} + \pmb{\mu} + \pmb{\epsilon}] = \pmb{\mu}\tag{16.37}
$$

$$
\mathrm{cov}[\mathbf{x}] = \mathbb{E} \left[(\mathbf{W} \mathbf{z} + \boldsymbol{\epsilon})(\mathbf{W} \mathbf{z} + \boldsymbol{\epsilon})^{\mathrm{T}} \right]
$$

$$
\mathbf{\Sigma} = \mathbb{E} \left[\mathbf{W} \mathbf{z} \mathbf{z}^{\mathrm{T}} \mathbf{W}^{\mathrm{T}} \right] + \mathbb{E}[\mathbf{\epsilon} \mathbf{\epsilon}^{\mathrm{T}}]\tag{16.38}
$$

$$
\mathbf{\Sigma} = \mathbf{W} \mathbf{W}^{\mathrm{T}} + \sigma^{2} \mathbf{I}\tag{16.39}
$$

where we have used the fact that z and $\epsilon$ are independent random variables and hence are uncorrelated.

Intuitively, we can think of the distribution $p(\mathbf{x})$ as being defined by taking an isotropic Gaussian ‘spray can’ and moving it across the principal subspace spraying Gaussian ink with density determined by $\sigma^{2}$ and weighted by the prior distribution. The accumulated ink density gives rise to a ‘pancake’ shaped distribution representing the marginal density $p(\mathbf{x})$

The predictive distribution $p(\mathbf{x})$ is governed by the parameters µ, W, and $\sigma^{2}$ However, there is redundancy in this parameterization corresponding to rotations of the latent space coordinates. To see this, consider a matrix $\widetilde{{\mathbf W}} ={\mathbf W}{\mathbf R}$ where R is an orthogonal matrix. Using the orthogonality property $\mathbf{RR}^{\mathrm{T}} = \mathbf{I}.$ , we see that the quantity $\widetilde{\mathbf{W}} \widetilde{\mathbf{W}}^{\mathrm{T}}$ that appears in the covariance matrix C takes the form

$$
\widetilde{\mathbf{W}} \widetilde{\mathbf{W}}^{\mathrm{T}} = \mathbf{W} \mathbb{R} \mathbb{R}^{\mathrm{T}} \mathbf{W}^{\mathrm{T}} = \mathbf{W} \mathbf{W}^{\mathrm{T}}\tag{16.40}
$$

The probabilistic PCA model for a data set of N observations of x can be expressed as a directed graph in which each observation ${\bf x}_{n}$ is associated with a value $\mathbf{z}_{n}$ of the latent variable.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/a2a8a1538cad97946fbe3408d81dfa658b33adb882ed603ca6b056b54ce7d541.jpg)

and hence is independent of R. Thus, there is a whole family of matrices $\widetilde{\mathbf{W}}$ all of which give rise to the same predictive distribution. This invariance can be understood in terms of rotations within the latent space. We will return to a discussion of the number of independent parameters in this model later.

When we evaluate the predictive distribution, we require $\mathbf{C}^{- 1}$ , which involves the inversion of a $D \times D$ matrix. The computation required to do this can be reduced by making use of the matrix inversion identity (A.7) to give

$$
\mathbf{C}^{- 1} = \sigma^{- 2} \mathbf{I} - \sigma^{- 2} \mathbf{W} \mathbf{M}^{- 1} \mathbf{W}^{\mathrm{T}}\tag{16.41}
$$

where the $M \times M$ matrix M is defined by

$$
\mathbf{M} = \mathbf{W}^{\mathrm{T}} \mathbf{W} + \sigma^{2} \mathbf{I}.\tag{16.42}
$$

Because we invert M rather than inverting C directly, the cost of evaluating $\mathbf{C}^{- 1}$ is reduced from $\mathcal{O}(D^{3})$ to $\mathcal{O}(M^{3})$

As well as the predictive distribution $p(\mathbf{x})$ , we will also require the posterior distribution $p(\mathbf{z} | \mathbf{x})$ , which can again be written down directly using the result (3.100) for linear-Gaussian models to give

$$
p(\mathbf{z} | \mathbf{x}) = \mathcal{N} \left(\mathbf{z} | \mathbf{M}^{- 1} \mathbf{W}^{\mathrm{T}}(\mathbf{x} - \pmb{\mu}), \sigma^{2} \mathbf{M}^{- 1} \right).\tag{16.43}
$$

Note that the posterior mean depends on x, whereas the posterior covariance is independent of x.

## 16.2.3 Maximum likelihood

We next consider the determination of the model parameters using maximum likelihood. Given a data set ${\bf X} = \{{\bf x}_{n}\}$ of observed data points, the probabilistic PCA model can be expressed as a directed graph, as shown in Figure 16.8. The corresponding log likelihood function is given, from (16.35), by

$$
\begin{array}{rlr}{{\ln p({\mathbf{X}} |{\boldsymbol{\mu}},{\mathbf{W}}, \sigma^{2}) = \sum_{n = 1}^{N} \ln p({\mathbf{x}}_{n} |{\mathbf{W}},{\boldsymbol{\mu}}, \sigma^{2})}} \\ &{=} &{- \frac{ND}{2} \ln(2 \pi) - \frac{N}{2} \ln |{\mathbf{C}} | - \frac{1}{2} \sum_{n = 1}^{N}({\mathbf{x}}_{n} -{\boldsymbol{\mu}})^{{\mathrm{T}}}{\mathbf{C}}^{- 1}({\mathbf{x}}_{n} -{\boldsymbol{\mu}}).} \end{array}\tag{16.44}
$$

Setting the derivative of the log likelihood with respect to $\pmb{\mu}$ equal to zero gives the expected result $\pmb{\mu} = \overline{{\mathbf{x}}}$ where x is the data mean defined by (16.1). Because the log likelihood is a quadratic function of $\textstyle \mu,$ , this solution represents the unique maximum, as can be confirmed by computing second derivatives. Back-substituting, we can then write the log likelihood function in the form

$$
\ln p({\bf X} |{\bf W},{\pmb \mu}, \sigma^{2}) = - \frac{N}{2} \left\{D \ln(2 \pi) + \ln \left|{\bf C} \right| + \mathrm{Tr} \left({\bf C}^{- 1}{\bf S} \right) \right\}\tag{16.45}
$$

where S is the data covariance matrix defined by (16.3).

Maximization with respect to W and $\sigma^{2}$ is more complex but nonetheless has an exact closed-form solution. It was shown by Tipping and Bishop (1999) that all the stationary points of the log likelihood function can be written as

$$
{\bf W}_{\mathrm{ML}} ={\bf U}_{M}({\bf L}_{M} - \sigma^{2}{\bf I})^{1 / 2}{\bf R}\tag{16.46}
$$

where ${\mathbf{U}}_{M}$ is a $D \times M$ matrix whose columns are given by any subset (of size M) of the eigenvectors of the data covariance matrix S. The $M \times M$ diagonal matrix $\mathbf{L}_{M}$ has elements given by the corresponding eigenvalues $\lambda_{i}$ , and R is an arbitrary $M \times M$ orthogonal matrix.

Furthermore, Tipping and Bishop (1999) showed that the maximum of the likelihood function is obtained when the M eigenvectors are chosen to be those whose eigenvalues are the M largest (all other solutions being saddle points). A similar result was conjectured independently by Roweis (1998), although no proof was given. Again, we will assume that the eigenvectors have been arranged in order of decreasing values of the corresponding eigenvalues, so that the M principal eigenvectors are $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ . In this case, the columns of W define the principal subspace of standard PCA. The corresponding maximum likelihood solution for $\bar{\sigma}^{2}$ is then given by

$$
\sigma_{\mathrm{ML}}^{2} ={\frac{1}{D - M}} \sum_{i = M + 1}^{D} \lambda_{i}\tag{16.47}
$$

so that $\sigma_{\mathrm{ML}}^{2}$ is the average variance associated with the discarded dimensions.

Because R is orthogonal, it can be interpreted as a rotation matrix in the Mdimensional latent space. If we substitute the solution for W into the expression for C and make use of the orthogonality property ${\bf RR}^{\mathrm{T}} ={\bf I}$ , we see that C is independent of R. This simply says that the predictive density is unchanged by rotations in the latent space as discussed earlier. For the particular case $\mathbb{R} = \mathbf{I}$ , we see that the columns of W are the principal component eigenvectors scaled by the variance parameters $\lambda_{i} - \sigma^{2}$ . The interpretation of these scaling factors is clear once we recognize that for a convolution of independent Gaussian distributions (in this case the latent space distribution and the noise model) the variances are additive. Thus, the variance $\lambda_{i}$ in the direction of an eigenvector $\mathbf{u}_{i}$ is composed of the sum of a contribution $\lambda_{i} - \sigma^{2}$ from the projection of the unit-variance latent space distribution into data space through the corresponding column of W plus an isotropic contribution of variance $\sigma^{2}$ , which is added in all directions by the noise model.

It is worth taking a moment to study the form of the covariance matrix given by (16.36). Consider the variance of the predictive distribution along some direction specified by the unit vector v, where $\mathbf{v}^{\mathrm{T}} \mathbf{v} = 1$ , which is given by $\mathbf{v}^{\mathrm{T}} \mathbf{Cv}$ . First suppose that v is orthogonal to the principal subspace, in other words it is given by some linear combination of the discarded eigenvectors. Then $\mathbf{v}^{\mathrm{T}} \mathbf{U} = \mathbf{0}$ and hence $\mathbf{v}^{\mathrm{{T}}} \mathbf{C} \mathbf{v} = \sigma^{2}$ . Thus, the model predicts a noise variance orthogonal to the principal subspace, which from $(16.47)$ is just the average of the discarded eigenvalues. Now suppose that $\mathbf{v} = \mathbf{u}_{i}$ where $\mathbf{u}_{i}$ is one of the retained eigenvectors defining the principal subspace. Then ${\bf v}^{\mathrm{T}}{\bf C}{\bf v} =(\lambda_{i} - \sigma^{2}) + \sigma^{2} = \lambda_{i}$ . In other words, this model correctly captures the variance of the data along the principal axes and approximates the variance in all remaining directions with a single average value $\sigma^{2}$

One way to construct the maximum likelihood density model would simply be to find the eigenvectors and eigenvalues of the data covariance matrix and then to evaluate W and $\sigma^{2}$ using the results given above. In this case, we would choose $\mathbb{R} = \mathbf{I}$ for convenience. However, if the maximum likelihood solution is found by numerical optimization of the likelihood function, for instance using an algorithm such as conjugate gradients (Fletcher, 1987; Nocedal and Wright, 1999) or through the EM algorithm, then the resulting value of R is essentially arbitrary. This implies that the columns of W need not be orthogonal. If an orthogonal basis is required, the matrix W can be post-processed appropriately (Golub and Van Loan, 1996). Alternatively, the EM algorithm can be modified in such a way as to yield orthonormal principal directions, sorted in descending order of the corresponding eigenvalues, directly (Ahn and Oh, 2003).

The rotational invariance in latent space represents a form of statistical nonidentifiability, analogous to that encountered for mixture models for discrete latent variables. Here there is a continuum of parameters, any value of which leads to the same predictive density, in contrast to the discrete non-identifiability associated with component relabelling in the mixture setting.

If we consider $M = D$ , so that there is no reduction of dimensionality, then ${\mathbf{U}}_{M} ={\mathbf{U}}$ and $\mathbf{L}_{M} = \mathbf{L}$ . Making use of the orthogonality properties $\mathbf{U} \mathbf{U}^{\mathrm{T}} = \mathbf{I}$ and $\mathbf{RR}^{\mathrm{T}} = \mathbf{I}$ , we see that the covariance C of the marginal distribution for x becomes

$$
\mathbf{C} = \mathbf{U(L} - \sigma^{2} \mathbf{I})^{1 / 2} \mathbb{R} \mathbb{R}^{\mathrm{T}}(\mathbf{L} - \sigma^{2} \mathbf{I})^{1 / 2} \mathbf{U}^{\mathrm{T}} + \sigma^{2} \mathbf{I} = \mathbf{U} \mathbf{L} \mathbf{U}^{\mathrm{T}} = \mathbf{S}\tag{16.48}
$$

and so we obtain the standard maximum likelihood solution for an unconstrained Gaussian distribution in which the covariance matrix is given by the sample covariance.

Conventional PCA is generally formulated as a projection of points from the Ddimensional data space onto an M-dimensional linear subspace. Probabilistic PCA, however, is most naturally expressed as a mapping from the latent space into the data space via (16.33). For applications such as visualization and data compression, we can reverse this mapping using Bayes’ theorem. Any point x in data space can then be summarized by its posterior mean and covariance in latent space. From (16.43) the mean is given by

$$
\mathbb{E}[\mathbf{z} | \mathbf{x}] = \mathbf{M}^{- 1} \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}}(\mathbf{x} - \overline{{\mathbf{x}}})\tag{16.49}
$$

where M is given by (16.42). This projects to a point in data space given by

$$
\mathbf{W} \mathbb{E}[\mathbf{z} | \mathbf{x}] + \pmb{\mu}.\tag{16.50}
$$

Note that this takes the same form as the equations for regularized linear regression and is a consequence of maximizing the likelihood function for a linear-Gaussian model. Similarly, from (16.43) the posterior covariance is given by $\sigma^{2} \mathbf{M}^{- 1}$ and is independent of x.

If we take the limit $\sigma^{2} \to 0$ , then the posterior mean reduces to

$$
(\mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \mathbf{W}_{\mathrm{ML}})^{- 1} \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}}(\mathbf{x} - \overline{{\mathbf{x}}}),\tag{16.51}
$$

which represents an orthogonal projection of the data point onto the latent space, and so we recover the standard PCA model. The posterior covariance in this limit is zero, however, and the density becomes singular. For $\sigma^{2} > 0$ , the latent projection is shifted towards the origin, relative to the orthogonal projection.

Finally, note that an important role for the probabilistic PCA model is in defining a multivariate Gaussian distribution in which the number of degrees of freedom, in other words the number of independent parameters, can be controlled while still allowing the model to capture the dominant correlations in the data. Recall that a general Gaussian distribution has $D(D + 1) / 2$ independent parameters in its covariance matrix (plus another D parameters in its mean). Thus, the number of parameters scales quadratically with $D$ and can become excessive in spaces of high dimensionality. If we restrict the covariance matrix to be diagonal, then it has only D independent parameters, and so the number of parameters now grows linearly with dimensionality. However, it now treats the variables as if they were independent and hence can no longer express any correlations between them. Probabilistic PCA provides an elegant compromise in which the M most significant correlations can be captured while still ensuring that the total number of parameters grows only linearly with D. We can see this by evaluating the number of degrees of freedom in the probabilistic PCA model as follows. The covariance matrix C depends on the parameters W, which has size $D \times M$ , and $\sigma^{2}$ , giving a total parameter count of $DM + 1$ . However, we have seen that there is some redundancy in this parameterization associated with rotations of the coordinate system in the latent space. The orthogonal matrix R that expresses these rotations has size $M \times M$ In the first column of this matrix, there are $M - 1$ independent parameters, because the column vector must be normalized to unit length. In the second column, there are $M - 2$ independent parameters, because the column must be normalized and also must be orthogonal to the previous column, and so on. Summing this arithmetic series, we see that R has a total of $M(M - 1) / 2$ independent parameters. Thus, the number of degrees of freedom in the covariance matrix C is given by

$$
DM + 1 - M(M - 1) / 2.\tag{16.52}
$$

The number of independent parameters in this model therefore only grows linearly with $D,$ , for fixed M . If we take $M = D - 1$ , then we recover the standard result for a full covariance Gaussian. In this case, the variance along $D - 1$ linearly in-

dependent directions is controlled by the columns of W, and the variance along the remaining direction is given by $\sigma^{2}$ . If $M = 0$ , the model is equivalent to the isotropic covariance case.

## 16.2.4 Factor analysis

Factor analysis is a linear-Gaussian latent-variable model that is closely related to probabilistic PCA. Its definition differs from that of probabilistic PCA only in that the conditional distribution of the observed variable x given the latent variable z has a diagonal rather than an isotropic covariance so that

$$
p(\mathbf{x} | \mathbf{z}) = \mathcal{N}(\mathbf{x} | \mathbf{W} \mathbf{z} + \pmb{\mu}, \boldsymbol{\Psi})\tag{16.53}
$$

where Ψ is a $D \times D$ diagonal matrix. Note that the factor analysis model, in common with probabilistic PCA, assumes that the observed variables $x_{1}, \ldots, x_{D}$ are independent, given the latent variable z. In essence, a factor analysis model explains the observed covariance structure of the data by representing the independent variance associated with each coordinate in the matrix Ψ and capturing the covariance between variables in the matrix W. In the factor analysis literature, the columns of W, which capture the correlations between observed variables, are called factor loadings, and the diagonal elements of Ψ, which represent the independent noise variances for each of the variables, are called uniquenesses.

The origins of factor analysis are as old as those of PCA, and discussions of factor analysis can be found in the books by Everitt (1984), Bartholomew (1987), and Basilevsky (1994). Links between factor analysis and PCA were investigated by Lawley (1953) and Anderson (1963), who showed that at stationary points of the likelihood function, for a factor analysis model with $\textstyle \Psi = \sigma^{2} \mathbf{I}$ , the columns of W are scaled eigenvectors of the sample covariance matrix and $\sigma^{2}$ is the average of the discarded eigenvalues. Later, Tipping and Bishop (1999) showed that the maximum of the log likelihood function occurs when the eigenvectors comprising W are chosen to be the principal eigenvectors.

Making use of (16.34), we see that the marginal distribution for the observed variable is given by $p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \mathbf{C})$ where now

$$
\mathbf{C} = \mathbf{W} \mathbf{W}^{\mathrm{T}} + \boldsymbol \Psi.\tag{16.54}
$$

As with probabilistic PCA, this model is invariant to rotations in the latent space.

Historically, factor analysis has been the subject of controversy when attempts have been made to place an interpretation on the individual factors (the coordinates in z-space), which has proven problematic due to the non-identifiability of factor analysis associated with rotations in this space. From our perspective, however, we shall view factor analysis as a form of latent-variable density model, in which the form of the latent space is of interest but not the particular choice of coordinates used to describe it. If we wish to remove the degeneracy associated with latentspace rotations, we must consider non-Gaussian latent-variable distributions, giving rise to independent component analysis models.

Another difference between probabilistic PCA and factor analysis is their behaviour under transformations of the data set. For PCA and probabilistic PCA, if we rotate the coordinate system in data space, then we obtain exactly the same fit to the data but with the W matrix transformed by the corresponding rotation matrix. However, for factor analysis, the analogous property is that if we make a component-wise re-scaling of the data vectors, then this is absorbed into a corresponding re-scaling of the elements of Ψ.

## 16.2.5 Independent component analysis

One generalization of the linear-Gaussian latent-variable model is to consider models in which the observed variables are related linearly to the latent variables, but for which the latent distribution is non-Gaussian. An important class of such models, known as independent component analysis, or ICA, arises when we consider a distribution over the latent variables that factorizes, so that

$$
p(\mathbf{z}) = \prod_{j = 1}^{M} p(z_{j}).\tag{16.55}
$$

To understand the role of such models, consider a situation in which two people are talking at the same time, and we record their voices using two microphones. If we ignore effects such as time delay and echoes, then the signals received by the microphones at any point in time will be given by linear combinations of the amplitudes of the two voices. The coefficients of this linear combination will be constant, and if we can infer their values from sample data, then we can invert the mixing process (assuming it is non-singular) and thereby obtain two clean signals each of which contains the voice of just one person. This is an example of a problem called blind source separation in which ‘blind’ refers to the fact that we are given only the mixed data, and neither the original sources nor the mixing coefficients are observed (Cardoso, 1998).

This type of problem is sometimes addressed using the following approach (MacKay, 2003) in which we ignore the temporal nature of the signals and treat the successive samples as i.i.d. We consider a generative model in which there are two latent variables corresponding to the unobserved speech signal amplitudes, and there are two observed variables given by the signal values at the microphones. The latent variables have a joint distribution that factorizes as above, and the observed variables are given by a linear combination of the latent variables. There is no need to include a noise distribution because the number of latent variables equals the number of observed variables, and therefore the marginal distribution of the observed variables will not in general be singular, so the observed variables are simply deterministic linear combinations of the latent variables. Given a data set of observations, the likelihood function for this model is a function of the coefficients in the linear combination. The log likelihood can be maximized using gradient-based optimization giving rise to a particular version of ICA.

The success of this approach requires that the latent variables have non-Gaussian distributions. To see this, recall that in probabilistic PCA (and in factor analysis) the latent-space distribution is given by a zero-mean isotropic Gaussian. The model therefore cannot distinguish between two different choices for the latent variables if these differ simply by a rotation in latent space. This can be verified directly by noting that the marginal density (16.35), and hence the likelihood function, is unchanged if we make the transformation W WR where R is an orthogonal matrix satisfying ${\bf RR}^{\mathrm{T}} ={\bf I}$ , because the matrix C given by (16.36) is itself invariant. Extending the model to allow more general Gaussian latent distributions does not change this conclusion because, as we have seen, such a model is equivalent to the zero-mean isotropic Gaussian latent-variable model.

Another way to see why a Gaussian latent-variable distribution in a linear model is insufficient to find independent components is to note that the principal components represent a rotation of the coordinate system in data space so as to diagonalize the covariance matrix. The data distribution in the new coordinates is then uncorrelated. Although zero correlation is a necessary condition for independence it is not, however, sufficient. In practice, a common choice for the latent-variable distribution is given by

$$
p(z_{j}) = \frac{1}{\pi \cosh(z_{j})} = \frac{2}{\pi(e^{z_{j}} + e^{- z_{j}})},\tag{16.56}
$$

which has heavy tails compared to a Gaussian, reflecting the observation that many real-world distributions also exhibit this property.

The original ICA model (Bell and Sejnowski, 1995) was based on the optimization of an objective function defined by information maximization. One advantage of a probabilistic latent-variable formulation is that it helps to motivate and formulate generalizations of basic ICA. For instance, independent factor analysis (Attias, 1999) considers a model in which the number of latent and observed variables can differ, the observed variables are noisy, and the individual latent variables have flexible distributions modelled by mixtures of Gaussians. The log likelihood for this model is maximized using EM, and the reconstruction of the latent variables is approximated using a variational approach. Many other types of model have been considered, and there is now a huge literature on ICA and its applications (Jutten and Herault, 1991; Comon, Jutten, and Herault, 1991; Amari, Cichocki, and Yang, 1996; Pearlmutter and Parra, 1997; Hyvarinen and Oja, 1997; Hinton¨ et al., 2001; Miskin and MacKay, 2001; Hojen-Sorensen, Winther, and Hansen, 2002; Choudrey and Roberts, 2003; Chan, Lee, and Sejnowski, 2003; Stone, 2004).

## 16.2.6 Kalman filters

So far we have assumed that the data values are i.i.d. A common situation in which this assumption does not hold is when the data points form an ordered sequence. We have seen that a hidden Markov model can be viewed as an extension of the mixture models to allow for sequential correlations in the data. In a similar way, a continuous latent-variable model can be extended to handle sequential data by connecting the latent variables to form a Markov chain, as shown in the graphical model of Figure 16.9. This is known as a linear dynamical system or Kalman filter (Zarchan and Musoff, 2005). Note that this is the same graphical structure as a hidden Markov model. It is interesting to note that, historically, hidden Markov models and linear dynamical systems were developed independently. Once they are both expressed as graphical models, however, the deep relationship between them

Figure 16.9

A probabilistic graphical model for sequential data, known as a linear dynamical system, or Kalman filter, in which the latent variables form a Markov chain.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/4267dd720dc6bf68d0b54338a258b5faaef49e356eaf7794554c5de9ea6961e0.jpg)

immediately becomes apparent. Kalman filters are widely used in many real-time tracking applications, for example to track aircraft using radar reflections.

In the simplest such model, the distributions $p(\mathbf{x}_{n} | \mathbf{z}_{n})$ in Figure 16.9 represent a linear-Gaussian latent-variable model for that particular observation, of the kind we have discussed previously for i.i.d. data. However, the latent variables $\left\{{{\bf{z}}_{n}} \right\}$ are no longer treated as independent but now form a Markov chain in which the distribution $p(\mathbf{z}_{n} | \mathbf{z}_{n - 1})$ of each latent variable is conditioned on the state of the previous latent variable in the chain. Again these can be chosen to be linear-Gaussian in which the distribution of $\mathbf{z}_{n}$ is Gaussian with a mean given by a linear function of $\mathbf{z}_{n - 1}$ Typically the parameters of all the distributions $p(\mathbf{x}_{n} | \mathbf{z}_{n})$ are shared, and likewise the parameters of the distributions $p(\mathbf{z}_{n} | \mathbf{z}_{n - 1})$ are shared, so that the total number of parameters in the model is fixed, independently of the length of the sequence. These parameters can be learned from data by maximum likelihood with efficient algorithms that involve propagating messages around the graph (Bishop, 2006). For the rest of this chapter, however, we will focus on i.i.d. data.

## 16.3. Evidence Lower Bound

Section 15.4

In our discussion of models with discrete latent variables, we derived the evidence lower bound (ELBO) on the marginal log likelihood and showed how this forms the basis for deriving the expectation–maximization (EM) algorithm including its generalizations such as variational inference. The same framework applies to continuous latent variables as well as to models that combine both discrete and continuous variables. Here we present a slightly different derivation of the ELBO, and we assume that the latent variables z are continuous.

Consider a model $p(\mathbf{x}, \mathbf{z} | \mathbf{w})$ with an observed variable x, a latent variable $\mathbf{z},$ and a learnable parameter vector w. If we introduce an arbitrary distribution $q(\mathbf{z})$ over the latent variable then we can write the log likelihood function ln $p(\mathbf{x} | \mathbf{w})$ as a sum of two terms in the form

$$
\ln p(\mathbf{x} | \mathbf{w}) = \mathcal{L}(\mathbf{w}) + \mathrm{KL} \left(q(\mathbf{z}) \| p(\mathbf{z} | \mathbf{x}, \mathbf{w}) \right)\tag{16.57}
$$

where we have defined

$$
\mathcal{L}(q, \mathbf{w}) = \int q(\mathbf{z}) \ln \left\{\frac{p(\mathbf{x}, \mathbf{z} | \mathbf{w})}{q(\mathbf{z})} \right\} d \mathbf{z}\tag{16.58}
$$

$$
\mathrm{KL} \left(q(\mathbf{z}) \| p(\mathbf{z} | \mathbf{x}, \mathbf{w}) \right) = - \int q(\mathbf{z}) \ln \left\{\frac{p(\mathbf{z} | \mathbf{x}, \mathbf{w})}{q(\mathbf{z})} \right\} d \mathbf{z}.\tag{16.59}
$$

Since KL $(q(\mathbf{z}) \| p(\mathbf{z} | \mathbf{x}, \mathbf{w}))$ is a Kullback–Leibler divergence, it satisfies the property KL $(\cdot \| \cdot) \geqslant 0$ from which it follows that

$$
\ln p(\mathbf{x} | \mathbf{w}) \geqslant \mathcal{L}(\mathbf{w})\tag{16.60}
$$

and we therefore see that $\mathcal{L}(\boldsymbol{q},{\bf w})$ given by (16.58) forms a lower bound on the log likelihood, known as the evidence lower bound or ELBO. We see that $\mathcal{L}(q, \mathbf{w})$ takes the same form (15.53 ) as derived for the discrete case but with summations replaced by integrals.

We can maximize the log likelihood function using a two-stage iterative procedure called the expectation maximization algorithm, or EM algorithm, in which we alternately maximize $\mathcal{L}(q, \mathbf{w})$ with respect to $q(\mathbf{z})$ (the E step) and w (the M step). We first initialize the parameters $\mathbf{w}^{(\mathrm{old})}$ . Then in the E step we keep w fixed and we maximize the lower bound with respect to $q(\mathbf{z})$ . This is easily done by noting that the highest value for the bound is obtained by minimizing the Kullback–Leibler divergence in (16.59) and hence is achieved when $q(\mathbf{z}) = p \bar{(\mathbf{z} | \mathbf{x}, \mathbf{w}^{(\mathrm{old})})}$ for which the Kullback–Leibler divergence is zero. In the M step, we keep this choice of $q(\mathbf{z})$ fixed and maximize $\mathcal{L}(\boldsymbol{q},{\bf w})$ with respect to w. Substituting for $q(\mathbf{z})$ in (16.58) we obtain

$$
\begin{array}{l}{\displaystyle \mathcal{L}(q, \mathbf{w}) = \int p(\mathbf{z} | \mathbf{x}, \mathbf{w}^{\mathrm{(old)}}) \ln p(\mathbf{x}, \mathbf{z} | \mathbf{w}) d \mathbf{z}} \\{\displaystyle \qquad - \int p(\mathbf{z} | \mathbf{x}, \mathbf{w}^{\mathrm{(old)}}) \ln p(\mathbf{z} | \mathbf{x}, \mathbf{w}^{\mathrm{(old)}}) d \mathbf{z}.} \end{array}\tag{16.61}
$$

We now maximize this with respect to w in the M step while keeping $\mathbf{w}^{(\mathrm{old})}$ fixed. Note that the second term on the right-hand side of (16.61) is independent of w and so can be ignored during the M step. The first term on the right-hand side is the expectation of the complete data log likelihood where the expectation is taken with respect to the posterior distribution of z computed using $\mathbf{w}^{(\mathrm{ol} \bar{d})}$

If we have a data set $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ of i.i.d. observations then the likelihood function takes the form

$$
\ln p(\mathbf{X} | \mathbf{w}) = \sum_{n = 1}^{N} \ln p(\mathbf{x}_{n} | \mathbf{w})\tag{16.62}
$$

where the data matrix X comprises $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ , and the parameters w are shared across all data points. For each data point we introduce a corresponding latent variable $\mathbf{z}_{n}$ with its associated distribution $q(\mathbf{z}_{n})$ , and by following similar steps to those used to derive (16.58), we obtain the ELBO in the form

$$
\mathcal{L}(q, \mathbf{w}) = \sum_{n = 1}^{N} \int q(\mathbf{z}_{n}) \ln \left\{\frac{p(\mathbf{x}_{n}, \mathbf{z}_{n} | \mathbf{w})}{q(\mathbf{z}_{n})} \right\} d \mathbf{z}_{n}.\tag{16.63}
$$

When we discuss variational autoencoders, we will encounter a model for which an exact solution to the E step is not feasible so instead a partial maximization is performed by modelling $q(\mathbf{z})$ using a deep neural network and then using the ELBO to learn the parameters of the network.

## 16.3.1 Expectation maximization

We can now use the EM algorithm, derived by iteratively maximizing the evidence lower bound, to learn the parameters of the probabilistic PCA model. This may seem rather pointless because we have already obtained an exact closed-form solution for the maximum likelihood parameter values. However, in spaces of high dimensionality, there may be computational advantages in using an iterative EM procedure rather than working directly with the sample covariance matrix. This EM procedure can also be extended to the factor analysis model, for which there is no closed-form solution. Finally, it allows missing data to be handled in a principled way.

We can derive the EM algorithm for probabilistic PCA by following the general framework for EM. Thus, we write down the complete-data log likelihood and take its expectation with respect to the posterior distribution of the latent distribution evaluated using ‘old’ parameter values. Maximization of this expected completedata log likelihood then yields the ‘new’ parameter values. Because the data points are assumed independent, the complete-data log likelihood function takes the form

$$
\ln p \left(\mathbf{X}, \mathbf{Z} | \mu, \mathbf{W}, \sigma^{2} \right) = \sum_{n = 1}^{N} \left\{\ln p(\mathbf{x}_{n} | \mathbf{z}_{n}) + \ln p(\mathbf{z}_{n}) \right\}\tag{16.64}
$$

where the nth row of the matrix $\mathbf{Z}$ is given by $\mathbf{z}_{n}$ . We already know that the exact maximum likelihood solution for $\pmb{\mu}$ is given by the sample mean x defined by (16.1), and it is convenient to substitute for $\pmb{\mu}$ at this stage. Making use of the expressions (16.31) and (16.32) for the latent and conditional distributions, respectively, and taking the expectation with respect to the posterior distribution over the latent variables, we obtain

$$
\begin{array}{l}{{\displaystyle{\mathbb{E}}[\ln p({\bf X},{\bf Z} |{\boldsymbol{\mu}},{\bf W}, \sigma^{2})] = - \sum_{n = 1}^{N} \{\frac{D}{2} \ln(2 \pi \sigma^{2}) + \frac{1}{2} \mathrm{Tr}({\mathbb{E}}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}])} \ ~} \\{{\displaystyle ~ ~ + \frac{1}{2 \sigma^{2}} \|{\bf x}_{n} -{\boldsymbol{\mu}} \|^{2} - \frac{1}{\sigma^{2}}{\mathbb{E}}[{\bf z}_{n}]^{\mathrm{T}}{\bf W}^{\mathrm{T}}({\bf x}_{n} -{\boldsymbol{\mu}}) \ ~} \ ~} \\{{\displaystyle ~ + \frac{1}{2 \sigma^{2}} \mathrm{Tr}({\mathbb{E}}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}]{\bf W}^{\mathrm{T}}{\bf W}) + \frac{M}{2} \ln(2 \pi)\}.\ ~ \ ~}} \end{array}
$$

Note that this depends on the posterior distribution only through the sufficient statistics of the Gaussian. Thus, in the E step, we use the old parameter values to evaluate

$$
\begin{array}{rcl}{\mathbb{E}[{\bf z}_{n}]} &{=} &{{\bf M}^{- 1}{\bf W}^{\mathrm{T}}({\bf x}_{n} - \overline{{\bf x}})} \end{array}\tag{16.66}
$$

$$
\begin{array}{rlr}{\mathbb{E}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}]} &{=} &{\sigma^{2}{\bf M}^{- 1} + \mathbb{E}[{\bf z}_{n}] \mathbb{E}[{\bf z}_{n}]^{\mathrm{T}},} \end{array}\tag{16.67}
$$

which follow directly from the posterior distribution (16.43) together with the standard result $\mathbb{E}[\mathbf{z}_{n} \mathbf{z}_{n}^{\mathrm{T}}] \stackrel{*}{=} \mathrm{cov}[\mathbf{z}_{n}] \stackrel{*}{+} \mathbb{E}[\mathbf{z}_{n}] \mathbb{E}[\mathbf{z}_{n}]^{\mathrm{T}}$ . Here M is defined by (16.42).

In the M step, we maximize with respect to W and $\sigma^{2}$ , keeping the posterior statistics fixed. Maximization with respect to $\sigma^{2}$ is straightforward. For the maximization with respect to W, we make use of (A.24) to obtain the M-step equations:

$$
\begin{array}{rcl}{{\displaystyle{\bf W}_{\mathrm{new}}}} &{{=}} &{{\displaystyle \left[\sum_{n = 1}^{N}({\bf x}_{n} -{\bf \bar{x}}){\mathbb E}[{\bf z}_{n}]^{\mathrm{T}} \right] \left[\sum_{n = 1}^{N}{\mathbb E}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}] \right]^{- 1}}} \\{{\displaystyle \sigma_{\mathrm{new}}^{2}}} &{{=}} &{{\displaystyle \frac{1}{ND} \sum_{n = 1}^{N} \left\{\|{\bf x}_{n} -{\bf \bar{x}} \|^{2} - 2{\mathbb E}[{\bf z}_{n}]^{\mathrm{T}}{\bf W}_{\mathrm{new}}^{\mathrm{T}}({\bf x}_{n} -{\bf \bar{x}}) \right.}} \\{{\displaystyle}} &{{}} &{{\displaystyle \left.+ \mathrm{Tr} \left({\mathbb E}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}]{\bf W}_{\mathrm{new}}^{\mathrm{T}}{\bf W}_{\mathrm{new}} \right) \right\}.}} \end{array}\tag{16.68}
$$

(16.69)

The EM algorithm for probabilistic PCA proceeds by initializing the parameters and then alternately computing the sufficient statistics of the latent space posterior distribution using (16.66) and (16.67) in the E step and revising the parameter values using (16.68) and (16.69) in the M step.

One of the benefits of the EM algorithm for PCA is its computational efficiency for large-scale applications (Roweis, 1998). Unlike conventional PCA based on an eigenvector decomposition of the sample covariance matrix, the EM approach is iterative and so might appear to be less attractive. However, each cycle of the EM algorithm can be computationally much more efficient than conventional PCA in spaces of high dimensionality. To see this, note that the eigendecomposition of the covariance matrix requires $\dot{\mathcal{O}}(D^{3})$ computation. Often we are interested only in the first M eigenvectors and their corresponding eigenvalues, in which case we can use algorithms that are $\mathcal{O}(MD^{2})$ . However, evaluating the covariance matrix requires $\mathcal{O} \bar{(} ND^{2})$ computations, where N is the number of data points. Algorithms such as the snapshot method (Sirovich, 1987), which assume that the eigenvectors are linear combinations of the data vectors, avoid a direct evaluation of the covariance matrix but are $\mathcal{O}(N^{3})$ and hence unsuited to large data sets. The EM algorithm described here also does not construct the covariance matrix explicitly. Instead, the most computationally demanding steps are those involving sums over the data set that are $\mathcal{O}(NDM)$ . For large D, and $M \ll D$ , this can be a significant saving compared to $\mathcal{O}(ND^{2})$ and can offset the iterative nature of the EM algorithm.

Note that this EM algorithm can be implemented in an online form in which each D-dimensional data point is read in and processed and then discarded before the next data point is considered. To see this, note that the quantities evaluated in the E step (an M-dimensional vector and an $M \times M$ matrix) can be computed for each data point separately, and in the M step we need to accumulate sums over data points, which we can do incrementally. This approach can be advantageous if both N and D are large.

Because we now have a fully probabilistic model for PCA, we can deal with missing data, provided that it is missing at random, in other words that the process that determines which values are missing does not depend on the values of any observed or unobserved variables. Such data sets can be handled by marginalizing over the distribution of the unobserved variables, and the resulting likelihood function can be maximized using the EM algorithm.

## 16.3.2 EM for PCA

Another elegant feature of the EM approach is that we can take the limit $\sigma^{2} \to 0$ corresponding to standard PCA, and still obtain a valid EM-like algorithm (Roweis,

1998). From (16.67), we see that the only quantity we need to compute in the E step is $\mathbb{E}[\mathbf{z}_{n}]$ . Furthermore, the M step is simplified because $\mathbf{M} = \mathbf{W}^{\mathrm{T}} \bar{\mathbf{W}}$ . To emphasize the simplicity of the algorithm, let us define $\widetilde{\mathbf{X}}$ to be a matrix of size $N \times D$ whose nth row is given by the vector ${\bf x}_{n} - \overline{{\bf x}}$ and similarly define Ω to be a matrix of size $M \times N$ whose nth column is given by the vector $\mathbb{E}[\mathbf{z}_{n}]$ . The E step (16.66) of the EM algorithm for PCA then becomes

$$
\pmb{\Omega} =(\mathbf{W}_{\mathrm{old}}^{\mathrm{T}} \mathbf{W}_{\mathrm{old}})^{- 1} \mathbf{W}_{\mathrm{old}}^{\mathrm{T}} \widetilde{\mathbf{X}}^{\mathrm{T}}\tag{16.70}
$$

and the M step (16.68) takes the form

$$
\mathbf{W}_{\mathrm{new}} = \widetilde{\mathbf{X}}^{\mathrm{T}} \pmb{\Omega}^{\mathrm{T}}(\pmb{\Omega} \pmb{\Omega}^{\mathrm{T}})^{- 1}.\tag{16.71}
$$

Again these can be implemented in an online form. These equations have a simple interpretation as follows. From our earlier discussion, we see that the E step involves an orthogonal projection of the data points onto the current estimate for the principal subspace. Correspondingly, the M step represents a re-estimation of the principal subspace to minimize the reconstruction error in which the projections are fixed.

We can give a simple physical analogy for this EM algorithm, which is easily visualized for $D \ = \2$ and $M \ : = \ : 1$ Consider a collection of data points in two dimensions, and let the one-dimensional principal subspace be represented by a solid rod. Now attach each data point to the rod via a spring obeying Hooke’s law (force is proportional to the length of the spring and therefore stored energy is proportional to the square of the spring’s length). In the E step, we keep the rod fixed and allow the attachment points to slide up and down the rod so as to minimize the energy. This causes each attachment point (independently) to position itself at the orthogonal projection of the corresponding data point onto the rod. In the M step, we keep the attachment points fixed and then release the rod and allow it to move to the minimum energy position. The E step and M step are then repeated until a suitable convergence criterion is satisfied, as is illustrated in Figure 16.10.

## 16.3.3 EM for factor analysis

We can determine the parameters $\mu,$ , W, and Ψ in a factor analysis model by maximum likelihood. The solution for $\pmb{\mu}$ is again given by the sample mean. However, unlike probabilistic PCA, there is no longer a closed-form maximum likelihood solution for W, which must therefore be found iteratively. Because factor analysis is a latent-variable model, this can be done using an EM algorithm (Rubin and Thayer, 1982) that is analogous to the one used for probabilistic PCA. Specifically, the E-step equations are given by

$$
\begin{array}{rlr}{{\mathbb{E}}[{\bf z}_{n}]} &{=} &{{\bf G}{\bf W}^{\mathrm{T}} \Psi^{- 1}({\bf x}_{n} - \overline{{\bf x}})} \end{array}\tag{16.72}
$$

$$
\begin{array}{rlr}{\mathbb{E}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}]} &{=} &{{\bf G} + \mathbb{E}[{\bf z}_{n}] \mathbb{E}[{\bf z}_{n}]^{\mathrm{T}}} \end{array}\tag{16.73}
$$

where we have defined

$$
\mathbf G =(\mathbf I + \mathbf W^{\mathrm T} \pmb{\Psi}^{- 1} \mathbf W)^{- 1}.\tag{16.74}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/76cf817677f835d73f69b51b51132c0257c50e5c3c00a8c34890cd3e6364b7f5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/596eb26855ad27b63996b97ea277c5a822d38756ee0c55d1bfcad496f93b41b8.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/42db2ec31c94d5fdd32420e2a6448dcf145fe7b4e82dcea04e256a99570b4fbb.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/1279d7cda9cd35144f41d7af92a5a871951239376d2211c008a293ddd723a5ff.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/e64111f605d482b31ad25a4d6f17b8a40675abcc36309b9ace88ffbdf39693be.jpg)

![Figure 16.10](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/a00b2c839894789d37fe63cb90e00c8cb1f49ca0c9d33b8b763f1d3be503fb29.jpg)  
Figure 16.10 Synthetic data illustrating the EM algorithm for PCA defined by (16.70) and (16.71). (a) A set of data points shown in green, together with the true principal components (shown as eigenvectors scaled by the square roots of the eigenvalues). (b) Initial configuration of the principal subspace defined by W, shown in red, together with the projections of the latent points Z into the data space, given by $\mathbf{Z} \mathbf{W}^{\mathrm{T}}$ , shown in cyan. (c) After one M step, W has been updated with Z held fixed. (d) After the successive E step, the values of Z have been updated, giving orthogonal projections, with W held fixed. (e) After the second M step. (f) The converged solution.

Note that this is expressed in a form that involves inversion of matrices of size $M \times M$ rather than $D \times D$ (except for the $D \times D$ diagonal matrix Ψ whose inverse is trivial to compute in $\mathcal{O}(D)$ steps), which is convenient because often $M \ll D$ . Similarly, the M-step equations take the form

Exercise 16.25

$$
\begin{array}{rlr}{{\bf W}_{\mathrm{new}}} &{=} &{\left[\sum_{n = 1}^{N}({\bf x}_{n} - \overline{{\bf x}}) \mathbb{E}[{\bf z}_{n}]^{\mathrm{T}} \right] \left[\sum_{n = 1}^{N} \mathbb{E}[{\bf z}_{n}{\bf z}_{n}^{\mathrm{T}}] \right]^{- 1}} \end{array}\tag{16.75}
$$

$$
\begin{array}{ccl}{\Psi_{\mathrm{new}}} &{=} &{\operatorname{diag} \left\{\mathbf{S} - \mathbf{W}_{\mathrm{new}} \displaystyle \frac{1}{N} \sum_{n = 1}^{N} \mathbb{E}[\mathbf{z}_{n}](\mathbf{x}_{n} - \overline{{\mathbf{x}}})^{\mathrm{T}} \right\}} \end{array}\tag{16.76}
$$

where the diag operator sets all the non-diagonal elements of a matrix to zero.

## 16.4. Nonlinear Latent Variable Models

So far in this chapter we have focused on latent variable models based on linear transformations from the latent space to the data space. It is natural to ask whether we can use the flexibility of deep neural networks to represent more complex transformations, while exploiting the learning ability of deep networks to allow the resulting distribution to be fitted to a data set. Consider a simple distribution over a vector variable z, for example a Gaussian of the form

$$
\begin{array}{r}{p_{\mathbf{z}}(\mathbf{z}) = \mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I}).} \end{array}\tag{16.77}
$$

Now suppose we transform z using a function $\mathbf{x} = \mathbf{g}(\mathbf{z}, \mathbf{w})$ given by a deep neural network, where w represents the weights and biases. The combination of the distribution over z together with the neural network defines a distribution over x. Sampling from such a model is straightforward because we can generate samples from $p_{\mathbf{z}}(\mathbf{z})$ and then transform each of them using the neural network function to give corresponding samples of x. This is an efficient process since it does not involve iteration.

To learn ${\bf g}({\bf z},{\bf w})$ from data, consider how to evaluate the likelihood function $p(\mathbf{x} | \mathbf{w})$ . The distribution of x is given by the change of variables formula for densities:

$$
p_{\mathbf{x}}(\mathbf{x}) = p_{\mathbf{z}}(\mathbf{z}(\mathbf{x})) \left| \operatorname{det} \mathbf{J}(\mathbf{x}) \right|\tag{16.78}
$$

where J is the Jacobian matrix of partial derivatives whose elements are given by

$$
J_{ij}({\bf x}) = \frac{\partial z_{i}}{\partial x_{j}}.\tag{16.79}
$$

To evaluate the distribution $p_{\mathbf{z}}(\mathbf{z}(\mathbf{x}))$ on the right-hand side of (16.78) for a given data vector x and to evaluate the Jacobian matrix in (16.79) for that same value of x, we need the inverse $\mathbf{z} = \mathbf{g}^{- 1}(\mathbf{x}, \mathbf{w})$ of the neural network function. For most neural networks this inverse will not be well defined. For example, the network may represent a many-to-one function in which multiple different input values map to the same output value, in which case the change of variable formula does not give a well-defined density. Moreover, if the dimensionality of the latent space is different from that of the data space then the transformation will not be invertible.

One approach is to restrict our attention to functions ${\bf g}({\bf z},{\bf w})$ that are invertible, which requires that z and x have the same dimensionality. We will explore this approach in more detail when we introduce the technique of normalizing flows.

## 16.4.1 Nonlinear manifolds

Requiring that the latent and data spaces have the same number of dimensions is a significant limitation. Consider the situation in which z has dimensionality M and x has dimensionality D, where $M < D$ . In this case the distribution over x is confined to a manifold, or subspace, of dimensionality M , as illustrated in Figure 16.11. Low-dimensional manifolds arise in many machine learning applications,

Illustration of a mapping from a two-dimensional latent space $\mathrm { ~ { ~ \bf ~ z ~ } ~ } = \mathrm { ~ \bf ~ \left( ~ \right)} z _ { 1 } , z _ { 2 } $ to a three-dimensional data space $\mathbf{x} ~ = ~(x_{1}, x_{2}, x_{3})$ using a nonlinear function $\mathbf{x} =$ ${\bf g}({\bf z},{\bf w})$ represented by a neural network with parameter vector w.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b75e5ab7c973f9d6f9a124ca5f60a140ddbd413cdc6e2ab304119b55d1d7e068.jpg)

for example when modelling the distribution of natural images. Nonlinear latentvariable models can be very useful in modelling such data because they express the strong inductive bias that the data does not ‘fill’ the data space but is confined to a manifold, although the shape and dimensionality of this manifold are typically not known in advance.

However, one problem with this framework is that it assigns zero probability density to any data vector that does not lie exactly on the manifold, which is a problem for gradient-based learning since the likelihood function will be zero at each of the data points and constant for small changes in w, for any realistic data set. To address this, we follow the approach used previously with regression and classification problems and define a conditional distribution across the entire data space, whose parameters are given by the output of the neural network. If, for example, x comprises a vector of continuous variables then we can choose the conditional distribution to be a Gaussian:

$$
p(\mathbf{x} | \mathbf{z}, \mathbf{w}) = \mathcal{N}(\mathbf{x} | \mathbf{g}(\mathbf{z}, \mathbf{w}), \sigma^{2} \mathbf{I})\tag{16.80}
$$

in which the neural network ${\bf g}({\bf z},{\bf w})$ has linear output-unit activation functions, and $\mathbf{g} \in \mathbb{R}^{D}$ . The generative model is specified by the latent distribution over z together with the conditional distribution over x, and can be represented by the simple graphical model shown in Figure 16.12.

Note that it is straightforward, and computationally efficient, to draw independent samples from this distribution. We first draw a sample from the Gaussian distribution (16.77) using standard methods. Next, we use this value as input to the neural network, giving an output value ${\bf g}({\bf z},{\bf w})$ . Finally, we draw a sample from a Gaussian distribution with mean ${\bf g}({\bf z},{\bf w})$ and covariance $\sigma^{2} \mathbf{I}$ , as defined by (16.80). This three-step process can then be repeated to generate multiple independent samples.

The combination of a latent-variable distribution $p(\mathbf{z})$ and a conditional distri-

Graphical model representing the distribution given by (16.77) and (16.80), which together define a joint distribution $p(\mathbf{x}, \mathbf{z}) = p(\mathbf{x} | \mathbf{z}) p(\mathbf{z})$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/96572c1bdabf13c7403827b59bee072be846e75d3272bf7ec9b133f491a98ed3.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/8e49c0dda34b67dadaafeb7727b13dd30f95727b8c73d38bc4c33f6d0f64bdf0.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/d1e68f1242594234a5d0e04471f5f4996f48fcc154e95478ee235556f5902d0a.jpg)  
(b)  
Figure 16.13 Illustration of a nonlinear latent-variable model for a one-dimensional latent space and a twodimensional data space. (a) The prior distribution in latent space is given by a zero-mean unit-variance Gaussian distribution. (b) The three left-most plots show examples of the Gaussian conditional distribution $p(\mathbf{x} | z)$ for different values of z, whereas the right-most plot shows the marginal distribution $p(\mathbf{x})$ . The nonlinear function $\mathbf{g}(z)$ , which defines the mean of the conditional distribution, is given by $g_{1}(z) = \sin(z)$ $g_{2}(z) = \cos(z)$ , and, therefore, traces out a circle in data space. The standard deviation of the conditional distribution is given by $\sigma = 0.3$ . [Based on Prince (2020) with permission.]

bution $p(\mathbf{x} | \mathbf{z})$ defines a marginal distribution over the data space given by

$$
p(\mathbf{x}) = \int p(\mathbf{z}) p(\mathbf{x} | \mathbf{z}) d \mathbf{z}.\tag{16.81}
$$

We illustrate this using a simple example involving a one-dimensional latent space and a two-dimensional data space in Figure 16.13.

## 16.4.2 Likelihood function

We have seen that it is easy to draw samples from this nonlinear latent-variable model. Now suppose we wish to fit the model to an observed data set by maximizing the likelihood function. The likelihood is obtained from the product and sum rules of probability by integrating over z:

$$
\begin{array}{l}{p(\mathbf{x} | \mathbf{w}) = \displaystyle \int p(\mathbf{x} | \mathbf{z}, \mathbf{w}) p(\mathbf{z}) d \mathbf{z}} \\{\displaystyle = \int \mathcal{N}(\mathbf{x} | \mathbf{g}(\mathbf{z}, \mathbf{w}), \sigma^{2} \mathbf{I}) \mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I}) d \mathbf{z}.} \end{array}\tag{16.82}
$$

Although both distributions inside the integral are Gaussian, the integral is analytically intractable due to the highly nonlinear function ${\bf g}({\bf z},{\bf w})$ defined by the neural network.

Figure 16.14 Three example images of handwritten digits, illustrating why sampling from the latent space to evaluate the likelihood function requires large numbers of samples. (a) shows the original image, (b) shows a corrupted image with part of the stroke removed, and (c) shows the original image shifted by half a pixel down and half a pixel to the right. Image (b) is closer to (a) in terms of likelihood, even though image (c) is much closer to (a) in appearance. [From Doersch (2016) with permission.]  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/734b222f80bde38c8e802987f8e70c4461d59fd1343751f43dc24127e0fd692b.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/58e8a499e06296de7d0f444b77d2901078fa0eba5ca4e5fd81ab94197cd08cdc.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/54fd4aba82e6bec4c86db834fe62429391f6b928b733256cad990d1fff557ecc.jpg)  
(c)

One approach for evaluating the likelihood function would be to draw samples from the latent space distribution and use these to approximate (16.82) by

$$
p(\mathbf{x} | \mathbf{w}) \simeq \frac{1}{K} \sum_{i = 1}^{K} p(\mathbf{x} | \mathbf{z}_{i}, \mathbf{w})\tag{16.83}
$$

where $\mathbf{z}_{i} \sim p(\mathbf{z})$ . This expresses the distribution over z as a mixture of Gaussians with fixed mixing coefficients given by $1 / K$ , and in the limit of an infinite number of samples, this gives the true likelihood function. However, the value of K needed for effective training will typically be far too high to be practical. To see why, consider the three images of handwritten digits shown in Figure 16.14, and suppose that image (a) represents the vector x for which we wish to evaluate the likelihood function. If a trained model generated image (b), we would consider this a poor model as this image is not a good representation of a digit ‘2’, and so this should be assigned a much lower likelihood. Conversely, image (c), which was obtained by shifting the digit in (a) down and to the right by half a pixel, is a good example of a digit ‘2’ and should therefore have a high likelihood. Since the distribution (16.80) is Gaussian, the likelihood function is proportional to the exponential of the negative squared distance between the output of the network and the data vector x. However, the squared distance between (a) and (b) is 0.0387 whereas the squared distance between (a) and (c) is 0.2693. So if the variance parameter $\sigma^{2}$ is set to a sufficiently small value that image (b) has low likelihood, then image (c) will have an even lower likelihood. Even if the model is good at generating digits, we would have to consider extremely large numbers of samples for z before seeing a digit that is sufficiently close to (a). We therefore seek more sophisticated techniques for training nonlinear latent variable models that can be used in practical applications. Before outlining such methods, we first discuss briefly some considerations regarding discrete data spaces.

Schematic illustration of dequantization, showing (a) a discrete distribution over a single variable and (b) an associated dequantized continuous distribution.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/83fcf13e54c9fe60de39061962e4586473d82b4a7149e5f8940cc96afe44026d.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/851a2f86a1c61038ae71104e22ed376046f2c0e97e3919d0aa7d2f06e7c5e3b0.jpg)  
(b)

## 16.4.3 Discrete data

If the observed data set comprises independent binary variables then we can use a conditional distribution of the form

$$
p(\mathbf{x} | \mathbf{z}, \mathbf{w}) = \prod_{i = 1}^{D} g_{i}(\mathbf{z}, \mathbf{w})^{x_{i}} \left(1 - g_{i}(\mathbf{z}, \mathbf{w}) \right)^{1 - x_{i}}\tag{16.84}
$$

where $g_{i}(\mathbf{z}, \mathbf{w}) = \sigma(a_{i}(\mathbf{z}, \mathbf{w}))$ represents the activation of output unit $i,$ the activation function $\sigma(\cdot)$ is given by the logistic sigmoid, and $a_{i}({\bf z},{\bf w})$ is the pre-activation for output unit i. Similarly, for one-hot encoded categorical variables, we can use a multinomial distribution:

$$
p(\mathbf{x} | \mathbf{z}, \mathbf{w}) = \prod_{i = 1}^{D} g_{i}(\mathbf{z}, \mathbf{w})^{x_{i}}\tag{16.85}
$$

where

$$
g_{i}(\mathbf{z}, \mathbf{w}) = \frac{\exp(a_{i}(\mathbf{z}, \mathbf{w}))}{\sum_{j} \exp(a_{j}(\mathbf{z}, \mathbf{w}))}\tag{16.86}
$$

is the softmax activation function. We can also consider combinations of discrete and continuous variables by forming the product of the associated conditional distributions.

In practice, continuous variables are represented with discrete values, for example in images, the red, green, and blue channel intensities might be expressed using 8-bit numbers representing the values 0, . . . , 255 . This can cause problems when we employ highly flexible models based on deep neural networks, as the likelihood function can go to zero if the density collapses onto one or more of the discrete values. The problem can be resolved using a technique called dequantization, which involves adding noise to the variables, typically drawn from a uniform distribution over the region between successive discrete values, as shown in Figure 16.15. A training set is dequantized by replacing each observed value with a sample drawn randomly from the associated continuous distribution associated with that discrete value, and this makes it less likely that the model will discover a pathological solution.

## 16.4.4 Four approaches to generative modelling

We have seen that nonlinear latent-variable models based on deep neural networks offer a highly flexible framework for building generative models. Due to the universality of the neural network transformation, such models are capable, in principle, of approximating essentially any desired distribution to high accuracy. Moreover, such models offer the potential, once trained, to generate samples from the distribution in using an efficient, non-iterative process. However, we have also identified some challenges associated with training such models that force us to develop more sophisticated techniques than those needed for linear models. Many such methods have been proposed, each having their own strengths and limitations. These can be broadly grouped into four approaches, as follows.

With generative adversarial networks, or GANs, we relax the requirement for the network mapping to be invertible, thereby allowing the latent space to have a lower dimensionality than the data space. We also abandon the concept of a likelihood function and instead introduce a second neural network whose function is to provide a training signal for the generative network. Due to the absence of a welldefined likelihood function, the training procedure may be brittle, but once trained it is straightforward to generate samples from the model, and the results can be of high quality.

The framework of variational autoencoders, or VAEs, also uses a second neural network whose role is to approximate the posterior distribution over the latent variables, thereby allowing an approximation to the likelihood function to be evaluated. Training is more robust than with GANs, and sampling from the trained model is straightforward, although it can be harder to obtain the highest quality results.

In normalizing flows, we set the dimensionality of the latent space to be equal to that of the data space and then modify the generative neural network so that it becomes invertible. The requirement that the network is invertible restricts its functional form but it allows the likelihood function to be evaluated without approximation and it also allows for efficient sampling.

Finally, diffusion models use a network that learns to transform a sample from the prior distribution into a sample from the data distribution through a sequence of denoising steps. This leads to state-of-the-art performance in many applications, although the cost of sampling can be high due to the multiple denoising passes through the network.

We explore these approaches in detail in the final four chapters of this book.

## Exercises

(? ?) In this exercise, we use proof by induction to show that the linear projection onto an M-dimensional subspace that maximizes the variance of the projected data is defined by the M eigenvectors of the data covariance matrix S, given by (16.3), corresponding to the M largest eigenvalues. In Section 16.1, this result was proven for $\bar{M_{\mathrm{~}}} = 1$ . Now suppose the result holds for some general value of M and show that it consequently holds for dimensionality $M + 1$ . To do this, first set the derivative of the variance of the projected data with respect to a vector ${\bf u}_{M + 1}$ defining the new direction in data space equal to zero. This should be done subject to the constraints that ${\bf u}_{M + 1}$ are orthogonal to the existing vectors $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ , and also that it is normalized to unit length. Use Lagrange multipliers to enforce these constraints. Then make use of the orthonormality properties of the vectors $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ to show that the new vector $\mathbf{u}_{M + 1}$ is an eigenvector of S. Finally, show that the variance is maximized if the eigenvector is chosen to be the one corresponding to eigenvalue $\lambda_{M + 1}$ where the eigenvalues have been ordered in decreasing value.

16.2 (? ?) Show that the minimum value of the PCA error measure J given by (16.15) with respect to the ${\bf u}_{i},$ subject to the orthonormality constraints (16.7), is obtained when the $\mathbf{u}_{i}$ are eigenvectors of the data covariance matrix S. To do this, introduce a matrix H of Lagrange multipliers, one for each constraint, so that the modified error measure, in matrix notation reads

$$
\widetilde{J} = \mathrm{Tr} \left\{\widehat{\mathbf{U}}^{\mathrm{T}} \mathbf{S} \widehat{\mathbf{U}} \right\} + \mathrm{Tr} \left\{\mathbf{H}(\mathbf{I} - \widehat{\mathbf{U}}^{\mathrm{T}} \widehat{\mathbf{U}}) \right\}\tag{16.87}
$$

where $\widehat{\bf U}$ is a matrix of dimension $D \times(D - M)$ whose columns are given by $\mathbf{u}_{i}$ Now minimize $\widetilde{J}$ with respect to $\widehat{\bf U}$ and show that the solution satisfies $\mathbf{S \widehat{U}} = \widehat{\mathbf{U}} \mathbf{H}$ Clearly, one possible solution is that the columns of $\widehat{\bf U}$ are eigenvectors of S, in which case H is a diagonal matrix containing the corresponding eigenvalues. To obtain the general solution, show that H can be assumed to be a symmetric matrix, and by using its eigenvector expansion, show that the general solution to $\mathbf{S \widehat{U}} = \widehat{\mathbf{U}} \mathbf{H}$ gives the same value for $\widetilde{J}$ as the specific solution in which the columns of $\widehat{\bf U}$ are the eigenvectors of S. Because these solutions are all equivalent, it is convenient to choose the eigenvector solution.

16.3 (?) Verify that the eigenvectors defined by (16.30) are normalized to unit length, assuming that the eigenvectors $\mathbf{v}_{i}$ have unit length.

16.4 (?) Suppose we replace the zero-mean, unit-covariance latent space distribution (16.31) in the probabilistic PCA model by a general Gaussian distribution of the form $\mathcal{N}(\mathbf{z} | \mathbf{m}, \pmb{\Sigma})$ By redefining the parameters of the model, show that this leads to an identical model for the marginal distribution $p(\mathbf{x})$ over the observed variables for any valid choice of m and Σ.

16.5 (? ?) Let x be a D-dimensional random variable having a Gaussian distribution given by $\mathcal{N}({\bf x} | \mu, \Sigma)$ , and consider the M-dimensional random variable given by ${\textbf{y}} =$ ${\bf A}{\bf x} +{\bf \Gamma}$ b where A is an $M \times D$ matrix. Show that y also has a Gaussian distribution, and find expressions for its mean and covariance. Discuss the form of this Gaussian distribution for $M < D$ , for $M = D_{\mathrm{{\scriptsize{\cdot}}}}$ , and for $M > D$

16.6 (? ?) By making use of the results (2.122) and (2.123) for the mean and covariance of a general distribution, derive the result (16.35) for the marginal distribution $p(\mathbf{x})$ in the probabilistic PCA model.

16.7 (?) Draw a directed probabilistic graph for the probabilistic PCA model described in Section 16.2 in which the components of the observed variable x are shown explicitly as separate nodes. Hence, verify that the probabilistic PCA model has the same independence structure as the naive Bayes model discussed in Section 11.2.3.

16.8 (? ?) By making use of the result (3.100), show that the posterior distribution $p(\mathbf{z} | \mathbf{x})$ for the probabilistic PCA model is given by (16.43).

16.9 (?) Verify that maximizing the log likelihood (16.44) for the probabilistic PCA model with respect to the parameter $\pmb{\mu}$ gives the result $\pmb{\mu}_{\mathrm{ML}} = \overline{{\mathbf{x}}}$ where $\overline{{\mathbf{x}}}$ is the mean of the data vectors.

16.10 (? ?) By evaluating the second derivatives of the log likelihood function (16.44) for the probabilistic PCA model with respect to the parameter $\textstyle \mu,$ , show that the stationary point $\pmb{\mu}_{\mathrm{ML}} = \overline{{\mathbf{x}}}$ represents the unique maximum.

16.11 (? ?) Show that in the limit $\sigma^{2} \to 0$ , the posterior mean for the probabilistic PCA model becomes an orthogonal projection onto the principal subspace, as in conventional PCA.

16.12 (? ?) For $\sigma^{2} > 0$ show that the posterior mean in the probabilistic PCA model is shifted towards the origin relative to the orthogonal projection.

16.13 (? ?) Show that the optimal reconstruction of a data point under probabilistic PCA, according to the least-squares projection cost of conventional PCA, is given by

$$
\begin{array}{r}{\widetilde{\mathbf{x}} = \mathbf{W}_{\mathrm{ML}}(\mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \mathbf{W}_{\mathrm{ML}})^{- 1} \mathbf{M} \mathbb{E}[\mathbf{z} | \mathbf{x}].} \end{array}\tag{16.88}
$$

16.14 (?) The number of independent parameters in the covariance matrix for a probabilistic PCA model with an M-dimensional latent space and a D-dimensional data space is given by (16.52). Verify that for $M = D - \bar{1}$ , the number of independent parameters is the same as in a general covariance Gaussian, whereas for $\bar{M} = 0$ it is the same as for a Gaussian with an isotropic covariance.

16.15 (?) Derive an expression for the number of independent parameters in the factor analysis model described in Section 16.2.4.

16.16 (? ?) Show that the factor analysis model described in Section 16.2.4 is invariant under rotations of the latent space coordinates.

16.17 (? ?) Consider a linear-Gaussian latent-variable model having a latent space distribution $p(\mathbf{z}) = \mathcal{N}(\mathbf{x} | \mathbf{0}, \mathbf{I})$ and a conditional distribution for the observed variable $p(\mathbf{x} | \mathbf{z}) = \mathcal{N}(\mathbf{x} | \mathbf{W} \mathbf{z} + \pmb{\mu}, \Phi)$ where Φ is an arbitrary symmetric positive-definite noise covariance matrix. Now suppose that we make a non-singular linear transformation of the data variables $\mathbf{x} \to \mathbf{Ax}$ , where A is a $D \times D$ matrix. If $\mu_{\mathrm{ML}}, \mathbf{W}_{\mathrm{ML}}$ and $\Phi_{\mathrm{ML}}$ represent the maximum likelihood solution corresponding to the original un-transformed data, show that $\mathbf{A} \mu_{\mathrm{ML}}, \mathbf{AW}_{\mathrm{ML}}$ , and ${\bf A} \Phi_{\mathrm{ML}} \mathbf{\hat{A}}^{\mathrm{T}}$ represent the corresponding maximum likelihood solution for the transformed data set. Finally, show that the form of the model is preserved in two cases: (i) A is a diagonal matrix and Φ is a diagonal matrix. This corresponds to factor analysis. The transformed Φ remains diagonal, and hence factor analysis is covariant under component-wise re-scaling of the data variables; (ii) A is orthogonal and Φ is proportional to the unit matrix so that $\begin{array}{r}{\Phi = \sigma^{2}{\bf I}} \end{array}$ . This corresponds to probabilistic PCA. The transformed Φ matrix remains proportional to the unit matrix, and hence probabilistic PCA is covariant under a rotation of the axes of the data space, as is the case for conventional PCA.

16.18 (?) Verify that the log likelihood function for a model with continuous latent variables can be written as the sum of two terms in the form (16.57) in which the terms are defined by (16.58) and (16.59). This can be done by using the product rule of probability in the form

$$
p(\mathbf{x}, \mathbf{z} | \mathbf{w}) = p(\mathbf{z} | \mathbf{x}, \mathbf{w}) p(\mathbf{x} | \mathbf{w})\tag{16.89}
$$

and then substituting for $p(\mathbf{x}, \mathbf{z} | \mathbf{w})$ in (16.58).

16.19 (?) Show that, for a set of i.i.d. data, the evidence lower bound (ELBO) takes the form (16.63).

16.20 (? ?) Draw a directed probabilistic graphical model representing a discrete mixture of probabilistic PCA models in which each PCA model has its own values of W, $\textstyle \mu,$ and $\sigma^{2}$ . Now draw a modified graph in which these parameter values are shared between the components of the mixture.

16.21 (? ?) Derive the M-step equations (16.68) and (16.69) for the probabilistic PCA model by maximizing the expected complete-data log likelihood function given by (16.65).

16.22 (★★★) One benefit of a probabilistic formulation of principal component analysis is that it can be applied to a data set in which some of the values are missing, provided they are missing at random. Derive the EM algorithm for maximizing the likelihood function for the probabilistic PCA model in this situation. Note that the $\left\{{{\bf{z}}_{n}} \right\}$ , as well as the missing data values that are components of the vectors $\left\{\mathbf{x}_{n} \right\}$ , are now latent variables. Show that in the special case in which all the data values are observed, this reduces to the EM algorithm for probabilistic PCA derived in Section 16.3.2.

16.23 (? ?) Let W be a $D \times M$ matrix whose columns define a linear subspace of dimensionality M embedded within a data space of dimensionality D, and let $\pmb{\mu}$ be a D-dimensional vector. Given a data set $\left\{\mathbf{x}_{n} \right\}$ where $n = 1, \ldots, N$ , we can approximate the data points using a linear mapping from a set of M-dimensional vectors $\left\{{{\bf{z}}_{n}} \right\}$ , so that ${\bf x}_{n}$ is approximated by $\mathbf{W} \mathbf{z}_{n} + \pmb{\mu}.$ The associated sum-of-squares reconstruction cost is given by

$$
J = \sum_{n = 1}^{N} \| \mathbf{x}_{n} - \pmb{\mu} - \mathbf{W} \mathbf{z}_{n} \|^{2}.\tag{16.90}
$$

First show that minimizing J with respect to $\pmb{\mu}$ leads to an analogous expression with ${\bf x}_{n}$ and $\mathbf{z}_{n}$ replaced by zero-mean variables ${\bf x}_{n} - \overline{{\bf x}}$ and ${\bf z}_{n} - \overline{{{\bf z}}}$ , respectively, where x and z denote sample means. Then show that minimizing J with respect to $\mathbf{z}_{n}$ , where

W is kept fixed, gives rise to the PCA E step (16.70), and that minimizing J with respect to W, where $\left\{{{\bf{z}}_{n}} \right\}$ is kept fixed, gives rise to the PCA M step (16.71).

16.24 (? ?) Derive the formulae (16.72) and (16.73) for the E step of the EM algorithm for factor analysis. Note that from the result of Exercise 16.26, the parameter µ can be replaced by the sample mean x.

16.25 (? ?) Write down an expression for the expected complete-data log likelihood function for the factor analysis model, and hence derive the corresponding M-step equations (16.75) and (16.76).

16.26 (? ?) By considering second derivatives, show that the only stationary point of the log likelihood function for the factor analysis model discussed in Section 16.2.4 with respect to the parameter µ is given by the sample mean defined by (16.1). Furthermore, show that this stationary point is a maximum.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/eb28c39e067057b3471744357d628404dd6e40305e53ed8e9d7bc7a505b9d052.jpg)

Generative models use machine learning algorithms to learn a distribution from a set of training data and then generate new examples from that distribution. For example, a generative model might be trained on images of animals and then used to generate new images of animals. We can think of such a generative model in terms of a distribution $p(\mathbf{x} | \mathbf{w})$ in which x is a vector in the data space, and w represent the learnable parameters of the model. In many cases we are interested in conditional generative models of the form $p(\mathbf{x} | \mathbf{c}, \mathbf{w})$ where c represents a vector of conditioning variables. In the case of our generative model for animal images, we may wish to specify that a generated image should be of a particular animal, such as a cat or a dog, specified by the value of c.

For real-world applications such as image generation, the distributions are extremely complex, and consequently the introduction of deep learning has dramatically improved the performance of generative models. We have already encountered an important class of deep generative models when we discussed autoregressive large language models based on transformers. We have also outlined four important classes of generative model based on nonlinear latent variable models, and in this chapter we discuss the first of these, called generative adversarial networks. The other three approaches will be discussed in subsequent chapters.

![Figure 17.1](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/0b752e3bded4f28c41bd9aac416940c93d861aeac400be924bc9a2975868d6e5.jpg)  
Figure 17.1 Schematic illustration of a GAN in which a discriminator neural network $d(\mathbf{x}, \phi)$ is trained to distinguish between real samples from the training set, in this case images of kittens, and synthetic samples produced by the generator network ${\bf g}({\bf z},{\bf w})$ . The generator aims to maximize the error of the discriminator network by producing realistic images, whereas the discriminator network tries to minimize the same error by becoming better at distinguishing real from synthetic examples.


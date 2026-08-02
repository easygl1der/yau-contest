---
title: "Chapter 4 \u2014 Single-layer Networks: Regression"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 4
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 3693
source_line_end: 4301
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 19
source_empty_image_alt: 19
non_semantic_image_alt: 16
caption_derived_image_alt: 3
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 4 — Single-layer Networks: Regression

> [[../README|本书目录]] · [[03-chapter-3-standard-distributions|上一章]] · [[05-chapter-5-single-layer-networks-classification|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 3693–4301。
> - 本章保留 19 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；PDF-confirmed exercise difficulty marker (PDF p.148) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 4.1. Linear Regression

The goal of regression is to predict the value of one or more continuous target variables t given the value of a D-dimensional vector x of input variables. Typically we are given a training data set comprising N observations $\left\{\mathbf{x}_{n} \right\}$ , where $n = 1, \ldots, N$ together with corresponding target values $\left\{t_{n} \right\}$ , and the goal is to predict the value of t for a new value of $\mathbf{x}.$ . To do this, we formulate a function $y(\mathbf{x}, \mathbf{w})$ whose values for new inputs x constitute the predictions for the corresponding values of t, and where w represents a vector of parameters that can be learned from the training data.

The simplest model for regression is one that involves a linear combination of the input variables:

$$
y(\mathbf{x}, \mathbf{w}) = w_{0} + w_{1} x_{1} + \ldots + w_{D} x_{D}\tag{4.1}
$$

where ${\bf x} =(x_{1}, \ldots, x_{D})^{\mathrm{T}}$ . The term linear regression sometimes refers specifically to this form of model. The key property of this model is that it is a linear function of the parameters $w_{0}, \ldots, w_{D}$ . It is also, however, a linear function of the input variables $x_{i}$ , and this imposes significant limitations on the model.

## 4.1.1 Basis functions

We can extend the class of models defined by (4.1) by considering linear combinations of fixed nonlinear functions of the input variables, of the form

$$
y(\mathbf{x}, \mathbf{w}) = w_{0} + \sum_{j = 1}^{M - 1} w_{j} \phi_{j}(\mathbf{x})\tag{4.2}
$$

where $\phi_{j}(\mathbf{x})$ are known as basis functions. By denoting the maximum value of the index j by $M - 1$ , the total number of parameters in this model will be M .

The parameter $w_{0}$ allows for any fixed offset in the data and is sometimes called a bias parameter (not to be confused with bias in a statistical sense). It is often convenient to define an additional dummy basis function $\phi_{0}(\mathbf{x})$ whose value is fixed at $\phi_{0}(\mathbf{x}) = 1$ so that (4.2) becomes

$$
y(\mathbf{x}, \mathbf{w}) = \sum_{j = 0}^{M - 1} w_{j} \phi_{j}(\mathbf{x}) = \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x})\tag{4.3}
$$

where $\mathbf{w} =(w_{0}, \hdots, w_{M - 1})^{\mathrm{T}}$ and $\phi =(\phi_{0}, \ldots, \phi_{M - 1})^{\mathrm{T}}$ . We can represent the model (4.3) using a neural network diagram, as shown in Figure 4.1.

By using nonlinear basis functions, we allow the function $y(\mathbf{x}, \mathbf{w})$ to be a nonlinear function of the input vector x. Functions of the form (4.2) are called linear models, however, because they are linear in w. It is this linearity in the parameters that will greatly simplify the analysis of this class of models. However, it also leads to some significant limitations.

The linear regression model (4.3) can be expressed as a simple neural network diagram involving a single layer of parameters. Here each basis function $\phi_{j}(\mathbf{x})$ is represented by an input node, with the solid node representing the ‘bias’ basis function $\phi_{0},$ and the function $y(\mathbf{x}, \mathbf{w})$ is represented by an output node. Each of the parameters $w_{j}$ is shown by a line connecting the corresponding basis function to the output.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/e5684551679d004cd3dbaf3ea4e109cda8b3ec478004a4f50a879c2477ecd0ce.jpg)

Before the advent of deep learning it was common practice in machine learning to use some form of fixed pre-processing of the input variables $\mathbf{x},$ also known as feature extraction, expressed in terms of a set of basis functions $\{\phi_{j}(\mathbf{x})\}$ . The goal was to choose a sufficiently powerful set of basis functions that the resulting learning task could be solved using a simple network model. Unfortunately, it is very difficult to hand-craft suitable basis functions for anything but the simplest applications. Deep learning avoids this problem by learning the required nonlinear transformations of the data from the data set itself.

We have already encountered an example of a regression problem when we discussed curve fitting using polynomials. The polynomial function (1.1) can be expressed in the form (4.3) if we consider a single input variable x and if we choose basis functions defined by $\phi_{j}(x) = x^{j}$ . There are many other possible choices for the basis functions, for example

$$
\phi_{j}(x) = \exp \left\{- \frac{(x - \mu_{j})^{2}}{2s^{2}} \right\}\tag{4.4}
$$

where the $\mu_{j}$ govern the locations of the basis functions in input space, and the parameter s governs their spatial scale. These are usually referred to as ‘Gaussian’ basis functions, although it should be noted that they are not required to have a probabilistic interpretation. In particular the normalization coefficient is unimportant because these basis functions will be multiplied by learnable parameters $w_{j}$

Another possibility is the sigmoidal basis function of the form

$$
\phi_{j}(x) = \sigma \left({\frac{x - \mu_{j}}{s}} \right)\tag{4.5}
$$

where $\sigma(a)$ is the logistic sigmoid function defined by

$$
\sigma(a) = \frac{1}{1 + \exp(- a)}.\tag{4.6}
$$

Equivalently, we can use the tanh function because this is related to the logistic sigmoid by tanh $(a) = 2 \sigma(2a) - 1$ , and so a general linear combination of logistic sigmoid functions is equivalent to a general linear combination of tanh functions in the sense that they can represent the same class of input–output functions. These various choices of basis function are illustrated in Figure 4.2.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/235a3d81bc7a47c714978b4a1a88d39cc4594b5d4304a8f370ffbf3db9293de3.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/7c168e831721c7bb1f32557dc4ef71cd15d528907749b85c7a0a2291c5b36d3a.jpg)

![Figure 4.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1200c10924481af954a05c69afcf31393c5681fc612b9f3366dde07c7956fb8b.jpg)  
Figure 4.2 Examples of basis functions, showing polynomials on the left, Gaussians of the form (4.4) in the centre, and sigmoidal basis functions of the form (4.5) on the right.

Yet another possible choice of basis function is the Fourier basis, which leads to an expansion in sinusoidal functions. Each basis function represents a specific frequency and has infinite spatial extent. By contrast, basis functions that are localized to finite regions of input space necessarily comprise a spectrum of different spatial frequencies. In signal processing applications, it is often of interest to consider basis functions that are localized in both space and frequency, leading to a class of functions known as wavelets (Ogden, 1997; Mallat, 1999; Vidakovic, 1999). These are also defined to be mutually orthogonal, to simplify their application. Wavelets are most applicable when the input values live on a regular lattice, such as the successive time points in a temporal sequence or the pixels in an image.

Most of the discussion in this chapter, however, is independent of the choice of basis function set, and so we will not specify the particular form of the basis functions, except for numerical illustration. Furthermore, to keep the notation simple, we will focus on the case of a single target variable t, although we will briefly outline the modifications needed to deal with multiple target variables.

## 4.1.2 Likelihood function

We solved the problem of fitting a polynomial function to data by minimizing a sum-of-squares error function, and we also showed that this error function could be motivated as the maximum likelihood solution under an assumed Gaussian noise model. We now return to this discussion and consider the least-squares approach, and its relation to maximum likelihood, in more detail.

As before, we assume that the target variable t is given by a deterministic function $y(\mathbf{x}, \mathbf{w})$ with additive Gaussian noise so that

$$
t = y(\mathbf{x}, \mathbf{w}) + \epsilon\tag{4.7}
$$

where $\epsilon$ is a zero-mean Gaussian random variable with variance $\sigma^{2}$ . Thus, we can write

$$
p(t | \mathbf{x}, \mathbf{w}, \sigma^{2}) = \mathcal{N}(t | y(\mathbf{x}, \mathbf{w}), \sigma^{2}).\tag{4.8}
$$

Now consider a data set of inputs $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ with corresponding target values $t_{1}, \ldots, t_{N}$ . We group the target variables $\{t_{n}\}$ into a column vector that we denote by t where the typeface is chosen to distinguish it from a single observation of a multivariate target, which would be denoted t. Making the assumption that these data points are drawn independently from the distribution (4.8), we obtain an expression for the likelihood function, which is a function of the adjustable parameters w and $\sigma^{2}$ :

$$
p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \sigma^{2}) = \prod_{n = 1}^{N} \mathcal{N}(t_{n} | \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}), \sigma^{2})\tag{4.9}
$$

where we have used (4.3). Taking the logarithm of the likelihood function and making use of the standard form (2.49) for the univariate Gaussian, we have

$$
\begin{array}{l}{\displaystyle \ln p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \sigma^{2}) = \sum_{n = 1}^{N} \ln \mathcal{N}(t_{n} | \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}), \sigma^{2})} \\{\displaystyle = - \frac{N}{2} \ln \sigma^{2} - \frac{N}{2} \ln(2 \pi) - \frac{1}{\sigma^{2}} E_{D}(\mathbf{w})} \end{array}\tag{4.10}
$$

where the sum-of-squares error function is defined by

$$
E_{D}(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} \{t_{n} - \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n})\}^{2}.\tag{4.11}
$$

The first two terms in (4.10) can be treated as constants when determining w because they are independent of w. Therefore, as we saw previously, maximizing the likelihood function under a Gaussian noise distribution is equivalent to minimizing the sum-of-squares error function (4.11).

## 4.1.3 Maximum likelihood

Having written down the likelihood function, we can use maximum likelihood to determine w and $\sigma^{2}$ . Consider first the maximization with respect to w. The gradient of the log likelihood function (4.10) with respect to w takes the form

$$
\nabla_{\mathbf{w}} \ln{p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \sigma^{2})} = \frac{1}{\sigma^{2}} \sum_{n = 1}^{N} \left\{t_{n} - \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x}_{n}) \right\} \boldsymbol{\phi}(\mathbf{x}_{n})^{\mathrm{T}}.\tag{4.12}
$$

Setting this gradient to zero gives

$$
0 = \sum_{n = 1}^{N} t_{n} \phi(\mathbf{x}_{n})^{\mathrm{T}} - \mathbf{w}^{\mathrm{T}} \left(\sum_{n = 1}^{N} \phi(\mathbf{x}_{n}) \phi(\mathbf{x}_{n})^{\mathrm{T}} \right).\tag{4.13}
$$

Solving for w we obtain

$$
\mathbf{w}_{\mathrm{ML}} = \left(\Phi^{\mathrm{T}} \Phi \right)^{- 1} \Phi^{\mathrm{T}} \mathbf{t},\tag{4.14}
$$

which are known as the normal equations for the least-squares problem. Here Φ is an $N \times M$ matrix, called the design matrix, whose elements are given by $\Phi_{nj} = \phi_{j}(\mathbf{x}_{n})$ , so that

$$
\begin{array}{r}{\Phi = \left(\begin{array}{cccc}{\phi_{0}(\mathbf{x}_{1})} &{\phi_{1}(\mathbf{x}_{1})} &{\cdot \cdot \cdot} &{\phi_{M - 1}(\mathbf{x}_{1})} \\{\phi_{0}(\mathbf{x}_{2})} &{\phi_{1}(\mathbf{x}_{2})} &{\cdot \cdot \cdot} &{\phi_{M - 1}(\mathbf{x}_{2})} \\{\vdots} &{\vdots} &{\ddots} &{\vdots} \\{\phi_{0}(\mathbf{x}_{N})} &{\phi_{1}(\mathbf{x}_{N})} &{\cdot \cdot \cdot} &{\phi_{M - 1}(\mathbf{x}_{N})} \end{array} \right).} \end{array}\tag{4.15}
$$

The quantity

$$
{\pmb{\Phi}}^{\dagger} \equiv \left(\Phi^{\mathrm{T}} \pmb{\Phi} \right)^{- 1} \Phi^{\mathrm{T}}\tag{4.16}
$$

is known as the Moore–Penrose pseudo-inverse of the matrix Φ (Rao and Mitra, 1971; Golub and Van Loan, 1996). It can be regarded as a generalization of the notion of a matrix inverse to non-square matrices. Indeed, if Φ is square and invertible, then using the property $(\mathbf{A} \mathbf{B})^{- 1} = \mathbf{B}^{- 1} \mathbf{A}^{- 1}$ we see that $\bar{\Phi}^{\dagger} \equiv \mathbf{\dot{\Phi}}^{- 1}$

At this point, we can gain some insight into the role of the bias parameter $w_{0}$ . If we make the bias parameter explicit, then the error function (4.11) becomes

$$
E_{D}(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} \{t_{n} - w_{0} - \sum_{j = 1}^{M - 1} w_{j} \phi_{j}(\mathbf{x}_{n})\}^{2}.\tag{4.17}
$$

Setting the derivative with respect to $w_{0}$ equal to zero and solving for $w_{0}$ , we obtain

$$
w_{0} = \bar{t} - \sum_{j = 1}^{M - 1} w_{j} \overline{{\phi_{j}}}\tag{4.18}
$$

where we have defined

$$
\overline{{t}} = \frac{1}{N} \sum_{n = 1}^{N} t_{n}, \overline{{\phi_{j}}} = \frac{1}{N} \sum_{n = 1}^{N} \phi_{j}(\mathbf{x}_{n}).\tag{4.19}
$$

Thus, the bias $w_{0}$ compensates for the difference between the averages (over the training set) of the target values and the weighted sum of the averages of the basis function values.

We can also maximize the log likelihood function (4.10) with respect to the variance $\sigma^{2}$ , giving

$$
\sigma_{\mathrm{ML}}^{2} = \frac{1}{N} \sum_{n = 1}^{N} \{t_{n} - \mathbf{w}_{\mathrm{ML}}^{\mathrm{T}} \phi(\mathbf{x}_{n})\}^{2},\tag{4.20}
$$

and so we see that the maximum likelihood value of the variance parameter is given by the residual variance of the target values around the regression function.

Figure 4.3 Geometrical interpretation of the leastsquares solution in an N-dimensional space whose axes are the values of $t_{1}, \ldots, t_{N}$ . The least-squares regression function is obtained by finding the orthogonal projection of the data vector t onto the subspace spanned by the basis functions $\phi_{j}(\mathbf{x})$ in which each basis function is viewed as a vector $\varphi_{j}$ of length N with elements $\phi_{j}(\mathbf{x}_{n})$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/426b4731581486e7eb8642c62589bf008cd29464052186c53f54e85010278b78.jpg)

## 4.1.4 Geometry of least squares

At this point, it is instructive to consider the geometrical interpretation of the least-squares solution. To do this, we consider an N-dimensional space whose axes are given by the $t_{n}.$ so that $\mathbf{t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ is a vector in this space. Each basis function $\phi_{j}(\mathbf{x}_{n})$ , evaluated at the N data points, can also be represented as a vector in the same space, denoted by $\varphi_{j}$ , as illustrated in Figure 4.3. Note that $\varphi_{j}$ corresponds to the jth column of Φ, whereas $\phi({\mathbf{x}}_{n})$ corresponds to the transpose of the nth row of Φ. If the number M of basis functions is smaller than the number N of data points, then the M vectors $\phi_{j}({\mathbf{x}}_{n})$ will span a linear subspace  of dimensionality M . We define y to be an N-dimensional vector whose nth element is given by $y(\mathbf{x}_{n}, \mathbf{w})$ where $n = 1, \ldots, N$ . Because y is an arbitrary linear combination of the vectors $\varphi_{j}$ , it can live anywhere in the M-dimensional subspace. The sum-of-squares error (4.11) is then equal (up to a factor of $1 / 2)$ to the squared Euclidean distance between y and t. Thus, the least-squares solution for w corresponds to that choice of y that lies in subspace  and is closest to t. Intuitively, from Figure 4.3, we anticipate that this solution corresponds to the orthogonal projection of t onto the subspace . This is indeed the case, as can easily be verified by noting that the solution for y is given by Φ $\mathbf{w}_{\mathrm{ML}}$ and then confirming that this takes the form of an orthogonal projection.

In practice, a direct solution of the normal equations can lead to numerical difficulties when $\Phi^{\mathrm{T}} \Phi$ is close to singular. In particular, when two or more of the basis vectors $\varphi_{j}$ are co-linear, or nearly so, the resulting parameter values can have large magnitudes. Such near degeneracies will not be uncommon when dealing with real data sets. The resulting numerical difficulties can be addressed using the technique of singular value decomposition, or SVD (Deisenroth, Faisal, and Ong, 2020). Note that the addition of a regularization term ensures that the matrix is non-singular, even in the presence of degeneracies.

## 4.1.5 Sequential learning

The maximum likelihood solution (4.14) involves processing the entire training set in one go and is known as a batch method. This can become computationally costly for large data sets. If the data set is sufficiently large, it may be worthwhile to use sequential algorithms, also known as online algorithms, in which the data points are considered one at a time and the model parameters updated after each such presentation. Sequential learning is also appropriate for real-time applications in which the data observations arrive in a continuous stream and predictions must be

made before all the data points are seen.

We can obtain a sequential learning algorithm by applying the technique of stochastic gradient descent, also known as sequential gradient descent, as follows. If the error function comprises a sum over data points $\textstyle E = \sum_{n} E_{n}$ , then after presentation of data point $n,$ the stochastic gradient descent algorithm updates the parameter vector w using

$$
\mathbf{w}^{(\tau + 1)} = \mathbf{w}^{(\tau)} - \eta \nabla E_{n}\tag{4.21}
$$

where $\tau$ denotes the iteration number, and $\eta$ is a suitably chosen learning rate parameter. The value of w is initialized to some starting vector $\mathbf{w}^{(0)}$ . For the sum-ofsquares error function (4.11), this gives

$$
\mathbf{w}^{(\tau + 1)} = \mathbf{w}^{(\tau)} + \eta(t_{n} - \mathbf{w}^{(\tau) \mathrm{T}} \phi_{n}) \phi_{n}\tag{4.22}
$$

where $\phi_{n} = \phi(\mathbf{x}_{n})$ . This is known as the least-mean-squares or the LMS algorithm.

## 4.1.6 Regularized least squares

We have previously introduced the idea of adding a regularization term to an error function to control over-fitting, so that the total error function to be minimized takes the form

$$
E_{D}(\mathbf{w}) + \lambda E_{W}(\mathbf{w})\tag{4.23}
$$

where $\lambda$ is the regularization coefficient that controls the relative importance of the data-dependent error $E_{D}(\mathbf{w})$ and the regularization term $E_{W}(\mathbf{w})$ . One of the simplest forms of regularizer is given by the sum of the squares of the weight vector elements:

$$
E_{W}(\mathbf{w}) = \frac{1}{2} \sum_{j} w_{j}^{2} = \frac{1}{2} \mathbf{w}^{\mathrm{{T}}} \mathbf{w}.\tag{4.24}
$$

If we also consider the sum-of-squares error function given by

$$
E_{D}(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} \{t_{n} - \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n})\}^{2},\tag{4.25}
$$

then the total error function becomes

$$
\frac{1}{2} \sum_{n = 1}^{N} \{t_{n} - \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n})\}^{2} + \frac{\lambda}{2} \mathbf{w}^{\mathrm{T}} \mathbf{w}.\tag{4.26}
$$

In statistics, this regularizer provides an example of a parameter shrinkage method because it shrinks parameter values towards zero. It has the advantage that the error function remains a quadratic function of w, and so its exact minimizer can be found in closed form. Specifically, setting the gradient of (4.26) with respect to w to zero and solving for w as before, we obtain

$$
\mathbf{w} = \left(\lambda \mathbf{I} + \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \right)^{- 1} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t}.\tag{4.27}
$$

This represents a simple extension of the least-squares solution (4.14).

Figure 4.4 Representation of a linear regression model as a neural network having a single layer of connections. Each basis function is represented by a node, with the solid node representing the ‘bias’ basis function $\phi_{0}$ . Likewise each output $y_{1}, \ldots, y_{K}$ is represented by a node. The links between the nodes represent the corresponding weight and bias parameters.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/07a0eb1cae39d8c30318d8765b7891d4907f4102cfc58585223002ffca6d01c4.jpg)

## 4.1.7 Multiple outputs

So far, we have considered situations with a single target variable t. In some applications, we may wish to predict $K > 1$ target variables, which we denote collectively by the target vector $\mathbf{t} =(t_{1}, \dots, t_{K})^{\mathrm{T}}$ . This could be done by introducing a different set of basis functions for each component of t, leading to multiple, independent regression problems. However, a more common approach is to use the same set of basis functions to model all of the components the target vector so that

$$
\mathbf{y}(\mathbf{x}, \mathbf{w}) = \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x})\tag{4.28}
$$

where y is a K-dimensional column vector, W is an $M \times K$ matrix of parameters, and $\phi(\mathbf{x})$ is an M-dimensional column vector with elements $\phi_{j}(\mathbf{x})$ with $\phi_{0}(\mathbf{x}) = 1$ as before. Again, this can be represented as a neural network having a single layer of parameters, as shown in Figure 4.4.

Suppose we take the conditional distribution of the target vector to be an isotropic Gaussian of the form

$$
p(\mathbf{t} | \mathbf{x}, \mathbf{W}, \boldsymbol{igma}^{2}) = \mathcal{N}(\mathbf{t} | \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x}), \boldsymbol{igma}^{2} \mathbf{I}).\tag{4.29}
$$

If we have a set of observations $\mathbf{t}_{1}, \ldots, \mathbf{t}_{N}$ , we can combine these into a matrix T of size $N \times K$ such that the nth row is given by $\mathbf{t}_{n}^{\mathrm{T}}.$ . Similarly, we can combine the input vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ into a matrix $\mathbf{X}$ . The log likelihood function is then given by

$$
\begin{array}{l}{{\displaystyle \ln p({\bf T} |{\bf X},{\bf W}, \sigma^{2}) = \sum_{n = 1}^{N} \ln \mathcal{N}({\bf t}_{n} |{\bf W}^{\mathrm{T}} \phi({\bf x}_{n}), \sigma^{2}{\bf I})} \ ~} \\{{\displaystyle ~ = - \frac{NK}{2} \ln \left(2 \pi \sigma^{2} \right) - \frac{1}{2 \sigma^{2}} \sum_{n = 1}^{N} \left\|{\bf t}_{n} -{\bf W}^{\mathrm{T}} \phi({\bf x}_{n}) \right\|^{2}}.} \end{array}\tag{4.30}
$$

As before, we can maximize this function with respect to W, giving

$$
\mathbf{W}_{\mathrm{ML}} = \left(\Phi^{\mathrm{T}} \Phi \right)^{- 1} \Phi^{\mathrm{T}} \mathbf{T}\tag{4.31}
$$

where we have combined the input feature vectors $\phi(\mathbf{x}_{1}), \hdots, \phi(\mathbf{x}_{N})$ into a matrix Φ. If we examine this result for each target variable $t_{k}$ , we have

$$
\mathbf{w}_{k} = \left(\Phi^{\mathrm{T}} \Phi \right)^{- 1} \Phi^{\mathrm{T}} \mathbf{t}_{k} = \Phi^{\dagger} \mathbf{t}_{k}\tag{4.32}
$$

where $\mathbf{t}_{k}$ is an N-dimensional column vector with components $t_{nk}$ for $n = 1, \ldots N$ Thus, the solution to the regression problem decouples between the different target variables, and we need compute only a single pseudo-inverse matrix $\Phi^{\dagger}$ , which is shared by all the vectors $\mathbf{w}_{k}$

The extension to general Gaussian noise distributions having arbitrary covariance matrices is straightforward. Again, this leads to a decoupling into K independent regression problems. This result is unsurprising because the parameters W define only the mean of the Gaussian noise distribution, and we know that the maximum likelihood solution for the mean of a multivariate Gaussian is independent of the covariance. From now on, we will therefore consider a single target variable t for simplicity.

## 4.2. Decision theory

We have formulated the regression task as one of modelling a conditional probability distribution $p(t | \mathbf{x})$ , and we have chosen a specific form for the conditional probability, namely a Gaussian (4.8) with an x-dependent mean $y(\mathbf{x}, \mathbf{w})$ governed by parameters w and with variance given by the parameter $\sigma^{2}$ . Both w and $\sigma^{2}$ can be learned from data using maximum likelihood. The result is a predictive distribution given by

$$
p(t | \mathbf{x}, \mathbf{w}_{\mathrm{ML}}, \sigma_{\mathrm{ML}}^{2}) = \mathcal{N}(t | y(\mathbf{x}, \mathbf{w}_{\mathrm{ML}}), \sigma_{\mathrm{ML}}^{2}).\tag{4.33}
$$

The predictive distribution expresses our uncertainty over the value of t for some new input x. However, for many practical applications we need to predict a specific value for t rather than returning an entire distribution, particularly where we must take a specific action. For example, if our goal is to determine the optimal level of radiation to use for treating a tumour and our model predicts a probability distribution over radiation dose, then we must use that distribution to decide the specific dose to be administered. Our task therefore breaks down into two stages. In the first stage, called the inference stage, we use the training data to determine a predictive distribution $p(t | \mathbf{x})$ . In the second stage, known as the decision stage, we use this predictive distribution to determine a specific value $f(\mathbf{x})$ , which will be dependent on the input vector x, that is optimal according to some criterion. We can do this by minimizing a loss function that depends on both the predictive distribution $p(t | \mathbf{x})$ and on $f.$

Intuitively we might choose the mean of the conditional distribution, so that we would use $f(\mathbf{x}) = y(\mathbf{x}, \mathbf{w}_{\mathrm{ML}})$ . In some cases this intuition will be correct, but in other situations it can give very poor results. It is therefore useful to formalize this so that we can understand when it applies and under what assumptions, and the framework for doing this is called decision theory.

Suppose that we choose a value $f(\mathbf{x})$ for our prediction when the true value is t. In doing so, we incur some form of penalty or cost. This is determined by a loss, which we denote $L(t, f(\mathbf{x}))$ . Of course, we do not know the true value of t, so instead of minimizing L itself, we minimize the average, or expected, loss which is

The regression function $f^{\star}(x)$ which minimizes the expected squared loss, is given by the mean of the conditional distribution $p(t | x)$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b1186b57ce765188090a266c10d413266f54d7bfd6d7538be59db52ac315a16a.jpg)

given by

$$
\mathbb{E}[L] = \int \int L(t, f(\mathbf{x})) p(\mathbf{x}, t) d \mathbf{x} d t\tag{4.34}
$$

where we are averaging over the distribution of both input and target variables, weighted by their joint distribution $\boldsymbol{p}(\mathbf{x}, t)$ . A common choice of loss function in regression problems is the squared loss given by $L(t, f(\mathbf{x})) = \{f(\mathbf{x}) - t\}^{2}$ . In this case, the expected loss can be written

$$
\mathbb{E}[L] = \int \int \{f(\mathbf{x}) - t\}^{2} p(\mathbf{x}, t) d \mathbf{x} d t.\tag{4.35}
$$

It is important not to confuse the squared-loss function with the sum-of-squares error function introduced earlier. The error function is used to set the parameters during training in order to determine the conditional probability distribution $p(t | \mathbf{x})$ whereas the loss function governs how the conditional distribution is used to arrive at a predictive function $f(\mathbf{x})$ specifying a prediction for each value of x.

Our goal is to choose $f(\mathbf{x})$ so as to minimize $\mathbb{E}[L]$ . If we assume a completely flexible function $f(\mathbf{x})$ , we can do this formally using the calculus of variations to give

$$
{\frac{\delta \mathbb{E}[L]}{\delta f(\mathbf{x})}} = 2 \int \{f(\mathbf{x}) - t\} p(\mathbf{x}, t) d t = 0.\tag{4.36}
$$

Solving for $f(\mathbf{x})$ and using the sum and product rules of probability, we obtain

$$
f^{\star}({\bf x}) = \frac{1}{p({\bf x})} \int tp({\bf x}, t) d t = \int tp(t |{\bf x}) d t = \mathbb{E}_{t}[t |{\bf x}],\tag{4.37}
$$

which is the conditional average of t conditioned on x and is known as the regression function. This result is illustrated in Figure 4.5. It can readily be extended to multiple target variables represented by the vector t, in which case the optimal solution is the conditional average $\mathbf{f}^{\star}(\mathbf{x}) = \mathbb{E}_{t}[\mathbf{t} | \mathbf{x}]$ . For a Gaussian conditional distribution of the form (4.8), the conditional mean will be simply

$$
\mathbb{E}[t |{\bf x}] = \int tp(t |{\bf x}) d t = y({\bf x},{\bf w}).\tag{4.38}
$$

The use of calculus of variations to derive (4.37) implies that we are optimizing over all possible functions $f(\mathbf{x})$ . Although any parametric model that we can implement in practice is limited in the range of functions that it can represent, the framework of deep neural networks, discussed extensively in later chapters, provides a highly flexible class of functions that, for many practical purposes, can approximate any desired function to high accuracy.

We can derive this result in a slightly different way, which will also shed light on the nature of the regression problem. Armed with the knowledge that the optimal solution is the conditional expectation, we can expand the square term as follows

$$
\begin{array}{rl} &{\{f(\mathbf{x}) - t\}^{2} = \{f(\mathbf{x}) - \mathbb{E}[t | \mathbf{x}] + \mathbb{E}[t | \mathbf{x}] - t\}^{2}} \\ &{= \{f(\mathbf{x}) - \mathbb{E}[t | \mathbf{x}]\}^{2} + 2 \{f(\mathbf{x}) - \mathbb{E}[t | \mathbf{x}]\} \{\mathbb{E}[t | \mathbf{x}] - t\} + \{\mathbb{E}[t | \mathbf{x}] - t\}^{2}} \end{array}
$$

where, to keep the notation uncluttered, we use $\mathbb{E}[t |{\bf x}]$ to denote $\mathbb{E}_{t}[t | \mathbf{x}]$ . Substituting into the loss function (4.35) and performing the integral over $t,$ we see that the crossterm vanishes and we obtain an expression for the loss function in the form

$$
\mathbb{E}[L] = \int \left\{f(\mathbf{x}) - \mathbb{E}[t | \mathbf{x}] \right\}^{2} p(\mathbf{x}) d \mathbf{x} + \int \mathrm{var} \left[t | \mathbf{x} \right] p(\mathbf{x}) d \mathbf{x}.\tag{4.39}
$$

The function $f(\mathbf{x})$ we seek to determine appears only in the first term, which will be minimized when $f(\mathbf{x})$ is equal to $\mathbb{E}[t |{\bf x}]$ , in which case this term will vanish. This is simply the result that we derived previously, and shows that the optimal least-squares predictor is given by the conditional mean. The second term is the variance of the distribution of $t,$ averaged over x, and represents the intrinsic variability of the target data and can be regarded as noise. Because it is independent of $f(\mathbf{x})$ , it represents the irreducible minimum value of the loss function.

The squared loss is not the only possible choice of loss function for regression. Here we consider briefly one simple generalization of the squared loss, called the Minkowski loss, whose expectation is given by

$$
\mathbb{E}[L_{q}] = \int \int | f(\mathbf{x}) - t |^{q} p(\mathbf{x}, t) d \mathbf{x} d t,\tag{4.40}
$$

which reduces to the expected squared loss for $q \ : = \ : 2$ The function $\lvert f - t \rvert^{q}$ is plotted against $f - t$ for various values of $q$ in Figure 4.6. The minimum of $\mathbb{E}[L_{q}]$ is given by the conditional mean for $q = 2$ , the conditional median for $q = 1$ , and the conditional mode for $q \to 0$

Note that the Gaussian noise assumption implies that the conditional distribution of $t$ given $\mathbf{x}$ is unimodal, which may be inappropriate for some applications. In this case a squared loss can lead to very poor results and we need to develop more sophisticated approaches. For example, we can extend this model by using mixtures

Section 6.5

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/4df78d4c8cff79c960ef98200e51c8add89a26a9987a97bbf77046bc43871b07.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/9d434b8488a215bce1ae1d09f9cfee94048c9a36432570941e8bdb2e85165856.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/a28ff61aae678216d46d1455946578088b37323392b846dfeba4fd62f867485b.jpg)

![Figure 4.6](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/2cad74316d54e628bee95fe8bf32f2e4d249d7680963d50dc6ed1737f66f97ab.jpg)  
Figure 4.6 Plots of the quantity $L_{q} = | f - t |^{q}$ for various values of $q.$

of Gaussians to give multimodal conditional distributions, which often arise in the solution of inverse problems. Our focus in this section has been on decision theory for regression problems, and in the next chapter we shall develop analogous concepts for classification tasks.

## 4.3. The Bias–Variance Trade-off

So far in our discussion of linear models for regression, we have assumed that the form and number of basis functions are both given. We have also seen that the use of maximum likelihood can lead to severe over-fitting if complex models are trained using data sets of limited size. However, limiting the number of basis functions to avoid over-fitting has the side effect of limiting the flexibility of the model to capture interesting and important trends in the data. Although a regularization term can control over-fitting for models with many parameters, this raises the question of how to determine a suitable value for the regularization coefficient λ. Seeking the solution that minimizes the regularized error function with respect to both the weight vector w and the regularization coefficient λ is clearly not the right approach, since this leads to the unregularized solution with $\lambda = 0$

It is instructive to consider a frequentist viewpoint of the model complexity issue, known as the bias–variance trade-off. Although we will introduce this concept in the context of linear basis function models, where it is easy to illustrate the ideas using simple examples, the discussion has very general applicability. Note, however, that over-fitting is really an unfortunate property of maximum likelihood and does not arise when we marginalize over parameters in a Bayesian setting (Bishop, 2006).

When we discussed decision theory for regression problems, we considered various loss functions, each of which leads to a corresponding optimal prediction once we are given the conditional distribution $p(t | \mathbf{x})$ . A popular choice is the squared-loss function, for which the optimal prediction is given by the conditional expectation, which we denote by $h(\mathbf{x})$ and is given by

$$
h(\mathbf{x}) = \mathbb{E}[t | \mathbf{x}] = \int tp(t | \mathbf{x}) d t.\tag{4.41}
$$

We have also seen that the expected squared loss can be written in the form

$$
\mathbb{E}[L] = \int \left\{f(\mathbf{x}) - h(\mathbf{x}) \right\}^{2} p(\mathbf{x}) d \mathbf{x} + \iint \{h(\mathbf{x}) - t\}^{2} p(\mathbf{x}, t) d \mathbf{x} d t.\tag{4.42}
$$

Recall that the second term, which is independent of $f(\mathbf{x})$ , arises from the intrinsic noise on the data and represents the minimum achievable value of the expected loss. The first term depends on our choice for the function $f(\mathbf{x})$ , and we will seek a solution for $f(\mathbf{x})$ that makes this term a minimum. Because it is non-negative, the smallest value that we can hope to achieve for this term is zero. If we had an unlimited supply of data (and unlimited computational resources), we could in principle find the regression function $h(\mathbf{x})$ to any desired degree of accuracy, and this would represent the optimal choice for $f(\mathbf{x})$ . However, in practice we have a data set containing only a finite number $N$ of data points, and consequently, we cannot know the regression function $h(\mathbf{x})$ exactly.

If we were to model $h(\mathbf{x})$ using a function governed by a parameter vector w, then from a Bayesian perspective, the uncertainty in our model would be expressed through a posterior distribution over w. A frequentist treatment, however, involves making a point estimate of w based on the data set and tries instead to interpret the uncertainty of this estimate through the following thought experiment. Suppose we had a large number of data sets each of size N and each drawn independently from the distribution $p(t, \mathbf{x})$ . For any given data set , we can run our learning algorithm and obtain a prediction function $f(\mathbf{x}; \mathcal{D})$ . Different data sets from the ensemble will give different functions and consequently different values of the squared loss. The performance of a particular learning algorithm is then assessed by taking the average over this ensemble of data sets.

Consider the integrand of the first term in (4.42), which for a particular data set takes the form

$$
\left\{f(\mathbf{x}; \mathcal{D}) - h(\mathbf{x}) \right\}^{2}.\tag{4.43}
$$

Because this quantity will be dependent on the particular data set $\mathcal{D}_{:}$ we take its average over the ensemble of data sets. If we add and subtract the quantity $\mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})]$ inside the braces, and then expand, we obtain

$$
\begin{array}{rl} &{\{f(\mathbf{x}; \mathcal{D}) - \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] + \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] - h(\mathbf{x})\}^{2}} \\ &{= \{f(\mathbf{x}; \mathcal{D}) - \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})]\}^{2} + \{\mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] - h(\mathbf{x})\}^{2}} \\ &{+ 2 \{f(\mathbf{x}; \mathcal{D}) - \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})]\} \{\mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] - h(\mathbf{x})\}.} \end{array}\tag{4.44}
$$

We now take the expectation of this expression with respect to  and note that the final term will vanish, giving

$$
\begin{array}{rl} &{\mathbb{E}_{\mathcal{D}} \left[\{f(\mathbf{x}; \mathcal{D}) - h(\mathbf{x})\}^{2} \right]} \\ &{= \underbrace{\left\{\mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] - h(\mathbf{x}) \right\}^{2}}_{(\mathsf{bias})^{2}} + \underbrace{\mathbb{E}_{\mathcal{D}} \left[\{f(\mathbf{x}; \mathcal{D}) - \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})]\}^{2} \right]}_{\mathsf{variance}}.} \end{array}\tag{4.45}
$$

We see that the expected squared difference between $f(\mathbf{x}; \mathcal{D})$ and the regression function $h(\mathbf{x})$ can be expressed as the sum of two terms. The first term, called the squared bias, represents the extent to which the average prediction over all data sets differs from the desired regression function. The second term, called the variance, measures the extent to which the solutions for individual data sets vary around their average, and hence, this measures the extent to which the function $f(\mathbf{x}; \mathcal{D})$ is sensitive to the particular choice of data set. We will provide some intuition to support these definitions shortly when we consider a simple example.

So far, we have considered a single input value x. If we substitute this expansion back into (4.42), we obtain the following decomposition of the expected squared loss:

$$
\mathrm{expected \loss =(bias)^{2} + variance + noise}\tag{4.46}
$$

where

$$
(\mathrm{bias})^{2} = \int \{\mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] - h(\mathbf{x})\}^{2} p(\mathbf{x}) d \mathbf{x}\tag{4.47}
$$

$$
\mathrm{variance} = \int \mathbb{E}_{\mathcal{D}} \left[\left\{f(\mathbf{x}; \mathcal{D}) - \mathbb{E}_{\mathcal{D}}[f(\mathbf{x}; \mathcal{D})] \right\}^{2} \right] p(\mathbf{x}) d \mathbf{x}\tag{4.48}
$$

$$
\mathrm{noise} = \iint \{h({\bf x}) - t\}^{2} p({\bf x}, t) d{\bf x} d t\tag{4.49}
$$

and the bias and variance terms now refer to integrated quantities.

Our goal is to minimize the expected loss, which we have decomposed into the sum of a (squared) bias, a variance, and a constant noise term. As we will see, there is a trade-off between bias and variance, with very flexible models having low bias and high variance, and relatively rigid models having high bias and low variance. The model with the optimal predictive capability is the one that leads to the best balance between bias and variance. This is illustrated by considering the sinusoidal data set introduced earlier. Here we independently generate 100 data sets, each containing

Section 1.2

$N = 25$ data points, from the sinusoidal curve $h(x) = \sin(2 \pi x)$ . The data sets are indexed by $l = 1, \ldots, L$ , where $L = 100$ . For each data set $\dot{\mathcal{D}}^{(l)}$ , we fit a model with $M = 24$ Gaussian basis functions along with a constant ‘bias’ basis function to give a total of 25 parameters. By minimizing the regularized error function (4.26), we obtain a prediction function ${\dot{f}}^{(l)}(x)$ , as shown in Figure 4.7.

The top row corresponds to a large value of the regularization coefficient λ that gives low variance (because the red curves in the left plot look similar) but high bias (because the two curves in the right plot are very different). Conversely on the bottom row, for which λ is small, there is large variance (shown by the high variability between the red curves in the left plot) but low bias (shown by the good fit between the average model fit and the original sinusoidal function). Note that the result of averaging many solutions for the complex model with $M = 25$ is a very good fit to the regression function, which suggests that averaging may be a beneficial procedure. Indeed, a weighted averaging of multiple solutions lies at the heart of a Bayesian approach, although the averaging is with respect to the posterior distribution of parameters, not with respect to multiple data sets.

We can also examine the bias–variance trade-off quantitatively for this example. The average prediction is estimated from

$$
\overline{{f}}(x) = \frac{1}{L} \sum_{l = 1}^{L} f^{(l)}(x),\tag{4.50}
$$

and the integrated squared bias and integrated variance are then given by

$$
(\mathrm{bias})^{2} = \frac{1}{N} \sum_{n = 1}^{N} \left\{\overline{{f}}(x_{n}) - h(x_{n}) \right\}^{2}\tag{4.51}
$$

$$
{\mathrm{variance}} ={\frac{1}{N}} \sum_{n = 1}^{N}{\frac{1}{L}} \sum_{l = 1}^{L}{\big \{} f^{(l)}(x_{n}) -{\overline{{f}}}(x_{n}){\big\}}^{2}\tag{4.52}
$$

where the integral over x, weighted by the distribution $p(x)$ , is approximated by a finite sum over data points drawn from that distribution. These quantities, along with their sum, are plotted as a function of ln λ in Figure 4.8. We see that small values of λ allow the model to become finely tuned to the noise on each individual data set leading to large variance. Conversely, a large value of λ pulls the weight parameters towards zero leading to large bias.

Note that the bias–variance decomposition is of limited practical value because it is based on averages with respect to ensembles of data sets, whereas in practice we have only the single observed data set. If we had a large number of independent training sets of a given size, we would be better off combining them into a single larger training set, which of course would reduce the level of over-fitting for a given model complexity. Nevertheless, the bias–variance decomposition often provides useful insights into the model complexity issue, and although we have introduced it in this chapter from the perspective of regression problems, the underlying intuition has broad applicability.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/19bcca230265164f3f8ebc75c0747e51c950cc121e78cc2dccd394464b57d84c.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/e592a1da714a17178974dc8977e61db58c44b51c6530a9cfced7dbd94c47c511.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d355ce4259055ec65b4ed83b581594a1bd3b10147669d433e9314b34b9ff59db.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/169f21f76652967aa3efb2806f40d4fd83edcb35514797a3e68066ef5a2118ed.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/219952c8d6d1c6e9c128eca6e316d8eea6eec8f09044a15f26290529ce619ee9.jpg)

![Figure 4.7](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/a4af8d27c0dfb4453d90d6ac9b5b73c2612dab924f4536f00ea25c469af29378.jpg)  
Figure 4.7 Illustration of the dependence of bias and variance on model complexity governed by a regulariza tion parameter $\lambda,$ using the sinusoidal data from Chapter 1. There are $L = 10 \dot{0}$ data sets, each having $N = 25$ data points, and there are 24 Gaussian basis functions in the model so that the total number of parameters is $M = 25$ including the bias parameter. The left column shows the result of fitting the model to the data sets for various values of ln $\lambda$ (for clarity, only 20 of the 100 fits are shown). The right column shows the corresponding average of the 100 fits (red) along with the sinusoidal function from which the data sets were generated (green).

Figure 4.8 Plot of squared bias and variance, together with their sum, corresponding to the results shown in Figure 4.7. Also shown is the average test set error for a test data set size of 1,000 points. The minimum value of $(\mathrm{bias})^{2}$ + variance occurs around ln $\lambda = 0.43$ , which is close to the value that gives the minimum error on the test data.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/2f856652d8d5945bc60e75951831fb0b0f2bb94b51d83ee43ca514f356179116.jpg)

## Exercises

4.1 (?) Consider the sum-of-squares error function given by (1.2) in which the function $y(x, \mathbf{w})$ is given by the polynomial (1.1). Show that the coefficients $\mathbf{w} = \{w_{i}\}$ that minimize this error function are given by the solution to the following set of linear equations:

$$
\sum_{j = 0}^{M} A_{ij} w_{j} = T_{i}\tag{4.53}
$$

where

$$
A_{ij} = \sum_{n = 1}^{N}(x_{n})^{i + j}, T_{i} = \sum_{n = 1}^{N}(x_{n})^{i} t_{n}.\tag{4.54}
$$

Here a suffix i or $j$ denotes the index of a component, whereas $(x)^{i}$ denotes x raised to the power of i.

4.2 (?) Write down the set of coupled linear equations, analogous to (4.53), satisfied by the coefficients $w_{i}$ that minimize the regularized sum-of-squares error function given by (1.4).

4.3 (?) Show that the tanh function defined by

$$
\operatorname{tanh}(a) ={\frac{e^{a} - e^{- a}}{e^{a} + e^{- a}}}\tag{4.55}
$$

and the logistic sigmoid function defined by (4.6) are related by

$$
\operatorname{tanh}(a) = 2 \sigma(2a) - 1.\tag{4.56}
$$

Hence, show that a general linear combination of logistic sigmoid functions of the form

$$
y(x, \mathbf{w}) = w_{0} + \sum_{j = 1}^{M} w_{j} \sigma \left(\frac{x - \mu_{j}}{s} \right)\tag{4.57}
$$

is equivalent to a linear combination of tanh functions of the form

$$
y(x, \mathbf{u}) = u_{0} + \sum_{j = 1}^{M} u_{j} \operatorname{tanh} \left({\frac{x - \mu_{j}}{2s}} \right)\tag{4.58}
$$

and find expressions to relate the new parameters $\{u_{1},..., u_{M}\}$ to the original parameters $\{w_{1}, \hdots, w_{M}\}$

## 4.4 (★★★) Show that the matrix

$$
\Phi(\Phi^{\mathrm{T}} \Phi)^{- 1} \Phi^{\mathrm{T}}\tag{4.59}
$$

takes any vector v and projects it onto the space spanned by the columns of $\Phi$ . Use this result to show that the least-squares solution (4.14) corresponds to an orthogonal projection of the vector t onto the manifold , as shown in Figure 4.3.

4.5 (?) Consider a data set in which each data point $t_{n}$ is associated with a weighting factor $r_{n} > 0$ , so that the sum-of-squares error function becomes

$$
E_{D}(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} r_{n} \left\{t_{n} - \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) \right\}^{2}.\tag{4.60}
$$

Find an expression for the solution $\mathbf{w}^{\star}$ that minimizes this error function. Give two alternative interpretations of the weighted sum-of-squares error function in terms of (i) data-dependent noise variance and (ii) replicated data points.

4.6 (?) By setting the gradient of (4.26) with respect to w to zero, show that the exact minimum of the regularized sum-of-squares error function for linear regression is given by (4.27).

4.7 (? ?) Consider a linear basis function regression model for a multivariate target variable t having a Gaussian distribution of the form

$$
p(\mathbf{t} | \mathbf{W}, \pmb{\Sigma}) = \mathcal{N}(\mathbf{t} | \mathbf{y}(\mathbf{x}, \mathbf{W}), \pmb{\Sigma})\tag{4.61}
$$

where

$$
\mathbf{y}(\mathbf{x}, \mathbf{W}) = \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x})\tag{4.62}
$$

together with a training data set comprising input basis vectors $\phi({\mathbf{x}}_{n})$ and corresponding target vectors $\mathbf{t}_{n}$ , with $n = 1, \ldots, N$ . Show that the maximum likelihood solution ${\bf W}_{\mathrm{MI}}$ for the parameter matrix W has the property that each column is given by an expression of the form (4.14), which was the solution for an isotropic noise distribution. Note that this is independent of the covariance matrix Σ. Show that the maximum likelihood solution for Σ is given by

$$
\boldsymbol{\Sigma} = \frac{1}{N} \sum_{n = 1}^{N} \left(\mathbf{t}_{n} - \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \phi(\mathbf{x}_{n}) \right) \left(\mathbf{t}_{n} - \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \phi(\mathbf{x}_{n}) \right)^{\mathrm{T}}.\tag{4.63}
$$

4.8 (?) Consider the generalization of the squared-loss function (4.35) for a single target variable t to multiple target variables described by the vector t given by

$$
\mathbb{E}[L(\mathbf{t}, \mathbf{f}(\mathbf{x}))] = \iint \| \mathbf{f}(\mathbf{x}) - \mathbf{t} \|^{2} p(\mathbf{x}, \mathbf{t}) d \mathbf{x} d \mathbf{t}.\tag{4.64}
$$

Using the calculus of variations, show that the function $\mathbf{f} \left(\mathbf{x} \right)$ for which this expected loss is minimized is given by

$$
\mathbf{f}(\mathbf{x}) = \mathbb{E}_{t}[\mathbf{t} | \mathbf{x}].\tag{4.65}
$$

4.9 (?) By expansion of the square in (4.64), derive a result analogous to (4.39) and, hence, show that the function $\mathbf{f} \left(\mathbf{x} \right)$ that minimizes the expected squared loss for a vector t of target variables is again given by the conditional expectation of t in the form (4.65).

4.10 (? ?) Rederive the result (4.65) by first expanding (4.64) analogous to (4.39).

4.11 (? ?) The following distribution

$$
p(x | \sigma^{2}, q) = \frac{q}{2(2 \sigma^{2})^{1 / q} \Gamma(1 / q)} \exp \left(- \frac{| x |^{q}}{2 \sigma^{2}} \right)\tag{4.66}
$$

is a generalization of the univariate Gaussian distribution. Here $\Gamma(x)$ is the gamma function defined by

$$
\Gamma(x) = \int_{- \infty}^{\infty} u^{x - 1} e^{- u} d u.\tag{4.67}
$$

Show that this distribution is normalized so that

$$
\int_{- \infty}^{\infty} p(x | \sigma^{2}, q) d x = 1\tag{4.68}
$$

and that it reduces to the Gaussian when $q = 2$ . Consider a regression model in which the target variable is given by $t = y(\mathbf{x}, \mathbf{w}) + \epsilon$ and $\epsilon$ is a random noise variable drawn from the distribution (4.66). Show that the log likelihood function over w and $\sigma^{2}$ , for an observed data set of input vectors $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ and corresponding target variables $\mathbf{t} =(t_{1}, \ldots, t_{N})^{\hat{\mathrm{T}}}$ , is given by

$$
\ln p({\bf t} |{\bf X},{\bf w}, \sigma^{2}) = - \frac{1}{2 \sigma^{2}} \sum_{n = 1}^{N} | y({\bf x}_{n},{\bf w}) - t_{n} |^{q} - \frac{N}{q} \ln(2 \sigma^{2}) + \mathrm{const}\tag{4.69}
$$

where ‘const’ denotes terms independent of both w and $\sigma^{2}$ . Note that, as a function of $\mathbf{w},$ this is the $L_{q}$ error function considered in Section 4.2.

4.12 (? ?) Consider the expected loss for regression problems under the $L_{q}$ loss function given by (4.40). Write down the condition that $y(\mathbf x)$ must satisfy to minimize $\mathbb{E}[L_{q}]$ Show that, for $q = 1$ , this solution represents the conditional median, i.e., the function $y(\mathbf x)$ such that the probability mass for $t < y(\mathbf{x})$ is the same as for $t \geqslant y(\mathbf{x})$ Also show that the minimum expected $L_{q}$ loss for $q \to 0$ is given by the conditional mode, i.e., by the function $y(\mathbf x)$ being equal to the value of t that maximizes $p(t | \mathbf{x})$ for each x.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/c1d0faeba075218a6a41f4873a260e9d40f646f8e05756d7f1917e8453f9c46b.jpg)

In the previous chapter, we explored a class of regression models in which the output variables were linear functions of the model parameters and which can therefore be expressed as simple neural networks having a single layer of weight and bias parameters. We turn now to a discussion of classification problems, and in this chapter, we will focus on an analogous class of models that again can be expressed as single-layer neural networks. These will allow us to introduce many of the key concepts of classification before dealing with more general deep neural networks in later chapters.

The goal in classification is to take an input vector $\mathbf{x} \in \mathbb{R}^{D}$ and assign it to one of K discrete classes $\mathcal{C}_{k}$ where $k = 1, \ldots, K$ . In the most common scenario, the classes are taken to be disjoint, so that each input is assigned to one and only one class. The input space is thereby divided into decision regions whose boundaries are called decision boundaries or decision surfaces. In this chapter, we consider linear models for classification, by which we mean that the decision surfaces are linear functions of the input vector x and, hence, are defined by $(D - 1)$ -dimensional hyperplanes within the D-dimensional input space. Data sets whose classes can be separated exactly by linear decision surfaces are said to be linearly separable. Linear classification models can be applied to data sets that are not linearly separable, although not all inputs will be correctly classified.

We can broadly identify three distinct approaches to solving classification problems. The simplest involves constructing a discriminant function that directly assigns each vector x to a specific class. A more powerful approach, however, models the conditional probability distributions $p(\mathcal{C}_{k} \vert \mathbf{x})$ in an inference stage and subsequently uses these distributions to make optimal decisions. Separating inference and decision brings numerous benefits. There are two different approaches to determining the conditional probabilities $p(\mathcal{C}_{k} | \mathbf{x})$ . One technique is to model them directly, for example by representing them as parametric models and then optimizing the parameters using a training set. This will be called a discriminative probabilistic model. Alternatively, we can model the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , together with the prior probabilities $p(\mathcal{C}_{k})$ for the classes, and then compute the required posterior probabilities using Bayes’ theorem:

$$
p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{p(\mathbf{x})}.\tag{5.1}
$$

This will be called a generative probabilistic model because it offers the opportunity to generate samples from each of the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ . In this chapter, we will discuss examples of all three approaches: discriminant functions, generative probabilistic models, and discriminative probabilistic models.


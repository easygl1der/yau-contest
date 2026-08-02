---
title: "Chapter 3 \u2014 Standard Distributions"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 3
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 2049
source_line_end: 3692
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 28
source_empty_image_alt: 28
non_semantic_image_alt: 25
caption_derived_image_alt: 3
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 3 — Standard Distributions

> [[../README|本书目录]] · [[02-chapter-2-probabilities|上一章]] · [[04-chapter-4-single-layer-networks-regression|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 2049–3692。
> - 本章保留 28 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed exercise difficulty marker (PDF p.125) × 1；PDF-confirmed exercise difficulty marker (PDF p.126) × 1；PDF-confirmed exercise difficulty marker (PDF p.127) × 2；PDF-confirmed exercise difficulty marker (PDF p.128) × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 3.1. Discrete Variables

We begin by considering simple distributions for discrete variables, starting with binary variables and then moving on to multi-state variables.

## 3.1.1 Bernoulli distribution

Consider a single binary random variable $x \in \{0, 1\}$ . For example, x might describe the outcome of flipping a coin, with $x = 1$ representing ‘heads’ and $x = 0$ representing ‘tails’. If this were a damaged coin, such as the one shown in Figure 2.2, the probability of landing heads is not necessarily the same as that of landing tails. The probability of $x = 1$ will be denoted by the parameter $\mu$ so that

$$
p(x = 1 | \mu) = \mu\tag{3.1}
$$

where $0 \leqslant \mu \leqslant 1$ , from which it follows that $p(x = 0 | \mu) = 1 - \mu$ . The probability distribution over x can therefore be written in the form

$$
\operatorname{Bern}(x | \mu) = \mu^{x}(1 - \mu)^{1 - x},\tag{3.2}
$$

which is known as the Bernoulli distribution. It is easily verified that this distribution

is normalized and that it has mean and variance given by

$$
\mathbb{E}[x] \quad = \quad \mu\tag{3.3}
$$

$$
\begin{array}{r}{\operatorname{var}[x] \ = \ \mu(1 - \mu).} \end{array}\tag{3.4}
$$

Now suppose we have a data set $\mathcal{D} = \{x_{1},..., x_{N}\}$ of observed values of $x_{\ast}$ We can construct the likelihood function, which is a function of $\mu.$ , on the assumption that the observations are drawn independently from $p(x | \mu)$ , so that

$$
p(\mathcal{D} | \mu) = \prod_{n = 1}^{N} p(x_{n} | \mu) = \prod_{n = 1}^{N} \mu^{x_{n}}(1 - \mu)^{1 - x_{n}}.\tag{3.5}
$$

We can estimate a value for $\mu$ by maximizing the likelihood function or equivalently by maximizing the logarithm of the likelihood, since the log is a monotonic function. The log likelihood function of the Bernoulli distribution is given by

$$
\ln p(\mathcal{D} | \mu) = \sum_{n = 1}^{N} \ln p(x_{n} | \mu) = \sum_{n = 1}^{N} \left\{x_{n} \ln \mu +(1 - x_{n}) \ln(1 - \mu) \right\}.\tag{3.6}
$$

At this point, note that the log likelihood function depends on the N observations $x_{n}$ only through their sum $\textstyle \sum_{n} x_{n}$ . This sum provides an example of a sufficient statistic for the data under this distribution. If we set the derivative of ln $p(\mathcal{D} | \mu)$ with respect to $\mu$ equal to zero, we obtain the maximum likelihood estimator:

Section 3.4

$$
\mu_{\mathrm{ML}} = \frac{1}{N} \sum_{n = 1}^{N} x_{n},\tag{3.7}
$$

which is also known as the sample mean. Denoting the number of observations of $x = 1$ (heads) within this data set by m, we can write (3.7) in the form

$$
\mu_{\mathrm{ML}} ={\frac{m}{N}}\tag{3.8}
$$

so that the probability of landing heads is given, in this maximum likelihood framework, by the fraction of observations of heads in the data set.

## 3.1.2 Binomial distribution

We can also work out the distribution for the binary variable $x$ of the number m of observations of $x = 1$ , given that the data set has size N . This is called the binomial distribution, and from (3.5) we see that it is proportional to $\mu^{m}(1 - \mu)^{N - m}$ To obtain the normalization coefficient, note that out of N coin flips, we have to add up all of the possible ways of obtaining m heads, so that the binomial distribution can be written as

$$
\mathrm{Bin}(m | N, \mu) = \binom{N}{m} \mu^{m}(1 - \mu)^{N - m}\tag{3.9}
$$

Figure 3.1 Histogram plot of the binomial distribution (3.9) as a function of m for $N = \dot{10}$ and $\mu = 0.25$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/a51cabd85f52a709e248d32f48bbe622548b3258b1b9cd140c1449e1cf6942be.jpg)

where

$$
{\binom{N}{m}} \equiv \frac{N !}{(N - m) ! m !}\tag{3.10}
$$

is the number of ways of choosing m objects out of a total of N identical objects without replacement. Figure 3.1 shows a plot of the binomial distribution for $N = 10$ and $\mu = 0.25$

The mean and variance of the binomial distribution can be found by using the results that, for independent events, the mean of the sum is the sum of the means and the variance of the sum is the sum of the variances. Because $m = x_{1} + \ldots + x_{N}$ and because for each observation the mean and variance are given by (3.3) and (3.4), respectively, we have

$$
\mathbb{E}[m] \equiv \sum_{m = 0}^{N} m \mathrm{Bin}(m | N, \mu) = N \mu\tag{3.11}
$$

$$
\operatorname{var}[m] \equiv \sum_{m = 0}^{N}{\left(m - \mathbb{E}[m] \right)^{2} \operatorname{Bin}(m | N, \mu)} = N \mu(1 - \mu).\tag{3.12}
$$

These results can also be proved directly by using calculus.

## 3.1.3 Multinomial distribution

Binary variables can be used to describe quantities that can take one of two possible values. Often, however, we encounter discrete variables that can take on one of K possible mutually exclusive states. Although there are various alternative ways to express such variables, we will see shortly that a particularly convenient representation is the $1{\mathrm{- of}}{\mathrm{-}} K$ scheme, sometimes called ‘one-hot encoding’, in which the variable is represented by a K-dimensional vector x in which one of the elements $x_{k}$ equals 1 and all remaining elements equal 0. So, for instance, if we have a variable that can take $K = 6$ states and a particular observation of the variable happens to correspond to the state where $x_{3} = 1$ , then x will be represented by

$$
\mathbf{x} =(0, 0, 1, 0, 0, 0)^{\mathrm{T}}.\tag{3.13}
$$

Note that such vectors satisfy $\textstyle \sum_{k = 1}^{K} x_{k} = 1$ . If we denote the probability of $x_{k} = 1$ by the parameter $\mu_{k}$ , then the distribution of x is given by

$$
p(\mathbf{x} | \pmb{\mu}) = \prod_{k = 1}^{K} \mu_{k}^{x_{k}}\tag{3.14}
$$

where $\pmb{\mu} =(\mu_{1}, \ldots, \mu_{K})^{\mathrm{T}}$ , and the parameters $\mu_{k}$ are constrained to satisfy $\mu_{k} \geqslant 0$ and $\textstyle \sum_{k} \mu_{k} = 1$ , because they represent probabilities. The distribution (3.14) can be regarded as a generalization of the Bernoulli distribution to more than two outcomes. It is easily seen that the distribution is normalized:

$$
\sum_{\mathbf{x}} p(\mathbf{x} | \mu) = \sum_{k = 1}^{K} \mu_{k} = 1\tag{3.15}
$$

and that

$$
\mathbb{E}[{\mathbf{x}} |{\pmb{\mu}}] = \sum_{\mathbf{x}} p(\mathbf{x} |{\pmb{\mu}}) \mathbf{x} ={\pmb{\mu}}.\tag{3.16}
$$

Now consider a data set $\mathcal{D}$ of N independent observations $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ . The corresponding likelihood function takes the form

$$
p(\mathcal{D} | \boldsymbol{\mu}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} \mu_{k}^{x_{nk}} = \prod_{k = 1}^{K} \mu_{k}^{\left(\sum_{n} x_{nk} \right)} = \prod_{k = 1}^{K} \mu_{k}^{m_{k}}\tag{3.17}
$$

where we see that the likelihood function depends on the N data points only through the $K$ quantities:

$$
m_{k} = \sum_{n = 1}^{N} x_{nk},\tag{3.18}
$$

which represent the number of observations of $x_{k} = 1$ . These are called the sufficient statistics for this distribution. Note that the variables $m_{k}$ are subject to the constraint

$$
\sum_{k = 1}^{K} m_{k} = N.\tag{3.19}
$$

To find the maximum likelihood solution for $\pmb{\mu}.$ , we need to maximize ln $p(\mathcal{D} | \boldsymbol{\mu})$ with respect to $\mu_{k}$ taking account of the constraint (3.15) that the $\mu_{k}$ must sum to one. This can be achieved using a Lagrange multiplier λ and maximizing

$$
\sum_{k = 1}^{K} m_{k} \ln \mu_{k} + \lambda \left(\sum_{k = 1}^{K} \mu_{k} - 1 \right).\tag{3.20}
$$

Setting the derivative of (3.20) with respect to $\mu_{k}$ to zero, we obtain

$$
\mu_{k} = - m_{k} / \lambda.\tag{3.21}
$$

We can solve for the Lagrange multiplier λ by substituting (3.21) into the constraint $\textstyle \sum_{k} \mu_{k} = 1$ to give $\lambda = - N$ . Thus, we obtain the maximum likelihood solution for $\mu_{k}$ in the form

$$
\mu_{k}^{\mathrm{ML}} = \frac{m_{k}}{N},\tag{3.22}
$$

which is the fraction of the $N$ observations for which $x_{k} = 1$

We can also consider the joint distribution of the quantities $m_{1}, \ldots, m_{K}$ , conditioned on the parameter vector $\pmb{\mu}$ and on the total number N of observations. From (3.17), this takes the form

$$
\mathrm{Mult}(m_{1}, m_{2},..., m_{K} | \pmb{\mu}, N) = \binom{N}{m_{1} m_{2}...m_{K}} \prod_{k = 1}^{K} \mu_{k}^{m_{k}},\tag{3.23}
$$

which is known as the multinomial distribution. The normalization coefficient is the number of ways of partitioning N objects into K groups of size $m_{1}, \ldots, m_{K}$ and is given by

$$
\binom{N}{m_{1} m_{2}...m_{K}} = \frac{N !}{m_{1} ! m_{2} ! \cdot..m_{K} !}.\tag{3.24}
$$

Note that two-state quantities can be represented either as binary variables and modelled using the binomial distribution (3.9) or as 1-of-2 variables and modelled using the distribution (3.14) with $K = 2$

## 3.2. The Multivariate Gaussian

The Gaussian, also known as the normal distribution, is a widely used model for the distribution of continuous variables. We have already seen that for of a single variable x, the Gaussian distribution can be written in the form

$$
\mathcal{N}(x | \mu, \sigma^{2}) = \frac{1}{\left(2 \pi \sigma^{2} \right)^{1 / 2}} \exp \left\{- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right\}\tag{3.25}
$$

where $\mu$ is the mean and $\sigma^{2}$ is the variance. For a D-dimensional vector x, the multivariate Gaussian distribution takes the form

$$
\mathcal{N}({\mathbf x} |{\pmb \mu},{\pmb \Sigma}) = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{|{\pmb \Sigma} |^{1 / 2}} \exp \left\{- \frac{1}{2}({\mathbf x} -{\pmb \mu})^{\mathrm{T}}{\pmb \Sigma}^{- 1}({\mathbf x} -{\pmb \mu}) \right\}\tag{3.26}
$$

where $\pmb{\mu}$ is the D-dimensional mean vector, Σ is the $D \times D$ covariance matrix, and det Σ denotes the determinant of $\pmb{\Sigma}$

The Gaussian distribution arises in many different contexts and can be motivated from a variety of different perspectives. For example, we have already seen that for

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/0e849ea1f86c422c73bb8430120115a212291b666a4e58c7e99a399cb349fead.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/87f95ce6827b1e721ce555f0fd33098a3c26bce0b206b560ff8e018e79b695d8.jpg)

![Figure 3.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/3c53ab7e7b8958344d7d759446466ca6d870601f22b43aa7807c09406b2f48c5.jpg)  
Figure 3.2 Histogram plots of the mean of N uniformly distributed numbers for various values of N. We observe that as N increases, the distribution tends towards a Gaussian.

a single real variable, the distribution that maximizes the entropy is the Gaussian.   
This property applies also to the multivariate Gaussian.

Another situation in which the Gaussian distribution arises is when we consider the sum of multiple random variables. The central limit theorem tells us that, subject to certain mild conditions, the sum of a set of random variables, which is of course itself a random variable, has a distribution that becomes increasingly Gaussian as the number of terms in the sum increases (Walker, 1969). We can illustrate this by considering N variables $x_{1}, \ldots, x_{N}$ each of which has a uniform distribution over the interval [0, 1] and then considering the distribution of the mean $(x_{1} + \cdot \cdot \cdot + x_{N}) / N$ For large N , this distribution tends to a Gaussian, as illustrated in Figure 3.2. In practice, the convergence to a Gaussian as N increases can be very rapid. One consequence of this result is that the binomial distribution (3.9), which is a distribution over m defined by the sum of N observations of the random binary variable x, will tend to a Gaussian as $N \to \infty$ (see Figure 3.1 for $N = 10)$ .

The Gaussian distribution has many important analytical properties, and we will consider several of these in detail. As a result, this section will be rather more technically involved than some of the earlier sections and will require familiarity with various matrix identities.

## 3.2.1 Geometry of the Gaussian

We begin by considering the geometrical form of the Gaussian distribution. The functional dependence of the Gaussian on x is through the quadratic form

$$
\Delta^{2} =({\bf x} -{\pmb \mu})^{\mathrm{T}}{\pmb \Sigma}^{- 1}({\bf x} -{\pmb \mu}),\tag{3.27}
$$

which appears in the exponent. The quantity $\Delta$ is called the Mahalanobis distance from µ to x. It reduces to the Euclidean distance when Σ is the identity matrix. The Gaussian distribution is constant on surfaces in x-space for which this quadratic form is constant.

First, note that the matrix Σ can be taken to be symmetric, without loss of generality, because any antisymmetric component would disappear from the exponent. Now consider the eigenvector equation for the covariance matrix

$$
\pmb{\Sigma} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{i}\tag{3.28}
$$

where $i = 1, \ldots, D$ . Because $\pmb{\Sigma}$ is a real, symmetric matrix, its eigenvalues will be real, and its eigenvectors can be chosen to form an orthonormal set, so that

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = I_{ij}\tag{3.29}
$$

where $I_{ij}$ is the $i, j$ element of the identity matrix and satisfies

$$
I_{ij} ={\left\{\begin{array}{ll}{1,} &{{\mathrm{if ~}} i = j} \\{0,} &{{\mathrm{otherwise.}}} \end{array} \right.}\tag{3.30}
$$

The covariance matrix $\pmb{\Sigma}$ can be expressed as an expansion in terms of its eigenvectors in the form

$$
\boldsymbol \Sigma = \sum_{i = 1}^{D} \lambda_{i} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}}\tag{3.31}
$$

and similarly the inverse covariance matrix $\pmb{\Sigma}^{- 1}$ can be expressed as

$$
\boldsymbol{\Sigma}^{- 1} = \sum_{i = 1}^{D} \frac{1}{\lambda_{i}} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}}.\tag{3.32}
$$

Substituting (3.32) into (3.27), the quadratic form becomes

$$
\Delta^{2} = \sum_{i = 1}^{D} \frac{y_{i}^{2}}{\lambda_{i}}\tag{3.33}
$$

where we have defined

$$
y_{i} = \mathbf{u}_{i}^{\mathrm{T}}(\mathbf{x} -{\pmb{\mu}}).\tag{3.34}
$$

We can interpret $\{y_{i}\}$ as a new coordinate system defined by the orthonormal vectors $\mathbf{u}_{i}$ that are shifted and rotated with respect to the original $x_{i}$ coordinates. Forming the vector $\mathbf{y} =(y_{1}, \dots, y_{D})^{\mathrm{T}}$ , we have

$$
\mathbf{y} = \mathbf{U}(\mathbf{x} - \pmb{\mu})\tag{3.35}
$$

where U is a matrix whose rows are given by $\mathbf{u}_{i}^{\mathrm{T}}$ . From (3.29) it follows that U is an orthogonal matrix, i.e., it satisfies $\mathbf{UU}^{\mathrm{T}} = \mathbf{\dot{U}}^{\mathrm{T}} \mathbf{U} = \mathbf{I}$ , where I is the identity matrix.

The quadratic form, and hence the Gaussian density, is constant on surfaces for which (3.33) is constant. If all the eigenvalues $\lambda_{i}$ are positive, then these surfaces represent ellipsoids, with their centres at $\pmb{\mu}$ and their axes oriented along $\mathbf{u}_{i}.$ , and with scaling factors in the directions of the axes given by $\lambda_{i}^{1 / 2}$ , as illustrated in Figure 3.3.

For the Gaussian distribution to be well defined, it is necessary for all the eigenvalues $\lambda_{i}$ of the covariance matrix to be strictly positive, otherwise the distribution cannot be properly normalized. A matrix whose eigenvalues are strictly positive is said to be positive definite. When we discuss latent variable models, we will encounter Gaussian distributions for which one or more of the eigenvalues are zero, in

Figure 3.3

The red curve shows the elliptical surface of constant probability density for a Gaussian in a two-dimensional space $\bf{x} =$ $(x_{1}, x_{2})$ on which the density is $\exp(- 1 / 2)$ of its value at $\bf{x} =$ $\mu.$ The axes of the ellipse are defined by the eigenvectors $\mathbf{u}_{i}$ of the covariance matrix, with corresponding eigenvalues $\lambda_{i}$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/cffa5f201b449e548bc039b0589dd334439a14d5b349220d0909651ea64f04b1.jpg)

which case the distribution is singular and is confined to a subspace of lower dimensionality. If all the eigenvalues are non-negative, then the covariance matrix is said to be positive semidefinite.

Now consider the form of the Gaussian distribution in the new coordinate system defined by the $y_{i}$ . In going from the x to the y coordinate system, we have a Jacobian matrix J with elements given by

$$
J_{ij} ={\frac{\partial x_{i}}{\partial y_{j}}} = U_{ji}\tag{3.36}
$$

where $U_{ji}$ are the elements of the matrix $\mathbf{U}^{\mathrm{T}}$ . Using the orthonormality property of the matrix U, we see that the square of the determinant of the Jacobian matrix is

$$
\mathbf{\left| J \right|^{2}} = \left| \mathbf{U^{\mathrm{T}}} \right|^{2} = \left| \mathbf{U^{\mathrm{T}}} \right| \left| \mathbf{U} \right| = \left| \mathbf{U^{\mathrm{T}} U} \right| = \left| \mathbf{I} \right| = 1\tag{3.37}
$$

and, hence, $| \mathbf{J} | = 1$ . Also, the determinant $| \pmb{\Sigma} |$ of the covariance matrix can be written as the product of its eigenvalues, and hence

$$
| \Sigma |^{1 / 2} = \prod_{j = 1}^{D} \lambda_{j}^{1 / 2}.\tag{3.38}
$$

Thus, in the $y_{j}$ coordinate system, the Gaussian distribution takes the form

$$
p(\mathbf{y}) = p(\mathbf{x}) | \mathbf{J} | = \prod_{j = 1}^{D} \frac{1}{(2 \pi \lambda_{j})^{1 / 2}} \exp \left\{- \frac{y_{j}^{2}}{2 \lambda_{j}} \right\},\tag{3.39}
$$

which is the product of $D$ independent univariate Gaussian distributions. The eigenvectors therefore define a new set of shifted and rotated coordinates with respect to which the joint probability distribution factorizes into a product of independent distributions. The integral of the distribution in the y coordinate system is then

$$
\int p(\mathbf{y}) d \mathbf{y} = \prod_{j = 1}^{D} \int_{- \infty}^{\infty}{\frac{1}{(2 \pi \lambda_{j})^{1 / 2}}} \exp \left\{-{\frac{y_{j}^{2}}{2 \lambda_{j}}} \right\} d y_{j} = 1\tag{3.40}
$$

where we have used the result (2.51) for the normalization of the univariate Gaussian.   
This confirms that the multivariate Gaussian (3.26) is indeed normalized.

## 3.2.2 Moments

We now look at the moments of the Gaussian distribution and thereby provide an interpretation of the parameters $\pmb{\mu}$ and Σ. The expectation of x under the Gaussian distribution is given by

$$
{\begin{array}{l}{\displaystyle \mathbb{E}[\mathbf{x}] ={\frac{1}{(2 \pi)^{D / 2}}}{\frac{1}{| \mathbf{\boldsymbol{\Sigma}} |^{1 / 2}}} \int \exp \left\{-{\frac{1}{2}}(\mathbf{x} -{\boldsymbol{\mu}})^{\mathrm{{T}}}{\boldsymbol{\Sigma}}^{- 1}(\mathbf{x} -{\boldsymbol{\mu}}) \right\} \mathbf{x} d \mathbf{x}} \\{\displaystyle \quad ={\frac{1}{(2 \pi)^{D / 2}}}{\frac{1}{| \mathbf{\boldsymbol{\Sigma}} |^{1 / 2}}} \int \exp \left\{-{\frac{1}{2}} \mathbf{z}^{\mathrm{{T}}}{\boldsymbol{\Sigma}}^{- 1} \mathbf{z} \right\}(\mathbf{z} +{\boldsymbol{\mu}}) d \mathbf{z}} \end{array}}\tag{3.41}
$$

where we have changed variables using $\mathbf{z} = \mathbf{x} - \boldsymbol{\mu}$ . Note that the exponent is an even function of the components of z, and because the integrals over these are taken over the range $(- \infty, \infty)$ , the term in z in the factor $(\mathbf{z} + \pmb{\mu})$ will vanish by symmetry. Thus,

$$
\mathbb{E}[\mathbf{x}] = \pmb{\mu},\tag{3.42}
$$

and so we refer to $\pmb{\mu}$ as the mean of the Gaussian distribution.

We now consider second-order moments of the Gaussian. In the univariate case, we considered the second-order moment given by $\mathbb{E}[x^{2}]$ . For the multivariate Gaussian, there are $D^{2}$ second-order moments given by $\mathbb{E}[x_{i} x_{j}]$ , which we can group together to form the matrix $\mathbb{E}[{\mathbf{xx}^{\mathrm{T}}}]$ . This matrix can be written as

$$
{\begin{array}{r}{\mathbb{E}[{\mathbf{x}}{\mathbf{x}}^{\mathrm{T}}] ={\frac{1}{(2 \pi)^{D / 2}}}{\frac{1}{|{\boldsymbol{\Sigma}} |^{1 / 2}}} \int \exp \left\{-{\frac{1}{2}}({\mathbf{x}} -{\boldsymbol{\mu}})^{\mathrm{T}}{\boldsymbol{\Sigma}}^{- 1}({\mathbf{x}} -{\boldsymbol{\mu}}) \right\}{\mathbf{x}}{\mathbf{x}}^{\mathrm{T}} d{\mathbf{x}}} \\{={\frac{1}{(2 \pi)^{D / 2}}}{\frac{1}{|{\boldsymbol{\Sigma}} |^{1 / 2}}} \int \exp \left\{-{\frac{1}{2}}{\mathbf{z}}^{\mathrm{T}}{\boldsymbol{\Sigma}}^{- 1}{\mathbf{z}} \right\}({\mathbf{z}} +{\boldsymbol{\mu}})({\mathbf{z}} +{\boldsymbol{\mu}})^{\mathrm{T}} d{\mathbf{z}}} \end{array}}\tag{3.43}
$$

where again we have changed variables using ${\bf z} ={\bf x} - \mu$ . Note that the cross-terms involving $\mu \mathbf{z}^{\mathrm{T}}$ and ${\pmb{\mu}}^{\mathrm{T}}{\bf z}$ will again vanish by symmetry. The term $\mu \mu^{\mathrm{T}}$ is constant and can be taken outside the integral, which itself is unity because the Gaussian distribution is normalized. Consider the term involving ${\bf z}{\bf z}^{\dagger}$ . Again, we can make use of the eigenvector expansion of the covariance matrix given by (3.28), together with the completeness of the set of eigenvectors, to write

$$
\mathbf{z} = \sum_{j = 1}^{D} y_{j} \mathbf{u}_{j}\tag{3.44}
$$

where $y_{j} = \mathbf{u}_{j}^{\mathrm{T}} \mathbf{z},$ which gives

$$
\begin{array}{l}{{\displaystyle \frac{1}{(2 \pi)^{D / 2}} \frac{1}{| \mathbf{\boldsymbol{\Sigma}} |^{1 / 2}} \int \exp \left\{- \frac{1}{2} \mathbf{z}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \mathbf{z} \right\} \mathbf{z} \mathbf{z}^{\mathrm{T}} d \mathbf{z}}} \\{{\displaystyle = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{| \mathbf{\boldsymbol{\Sigma}} |^{1 / 2}} \sum_{i = 1}^{D} \sum_{j = 1}^{D} \mathbf{u}_{i} \mathbf{u}_{j}^{\mathrm{T}} \int \exp \left\{- \sum_{k = 1}^{D} \frac{y_{k}^{2}}{2 \lambda_{k}} \right\} y_{i} y_{j} d \mathbf{y}}} \\{{\displaystyle = \sum_{i = 1}^{D} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}} \lambda_{i} = \boldsymbol{\Sigma}}} \end{array}\tag{3.45}
$$

where we have made use of the eigenvector equation (3.28), together with the fact that the integral on the middle line vanishes by symmetry unless $i = j$ . In the final line we have made use of the results (2.53) and (3.38), together with (3.31). Thus, we have

$$
\mathbb{E}[{\bf x}{\bf x}^{\mathrm{T}}] = \pmb{\mu} \pmb{\mu}^{\mathrm{T}} + \pmb{\Sigma}.\tag{3.46}
$$

When defining the variance for a single random variable, we subtracted the mean before taking the second moment. Similarly, in the multivariate case it is again convenient to subtract off the mean, giving rise to the covariance of a random vector x defined by

$$
\begin{array}{r}{\mathrm{cov}[\mathbf{x}] = \mathbb{E} \left[(\mathbf{x} - \mathbb{E}[\mathbf{x}])(\mathbf{x} - \mathbb{E}[\mathbf{x}])^{\mathrm{T}} \right].} \end{array}\tag{3.47}
$$

For the specific case of a Gaussian distribution, we can make use of $\mathbb{E}[{\bf x}] = \mu$ together with the result (3.46), to give

$$
\operatorname{cov}[\mathbf{x}] = \pmb{\Sigma}.\tag{3.48}
$$

Because the parameter matrix Σ governs the covariance of x under the Gaussian distribution, it is called the covariance matrix.

## 3.2.3 Limitations

Although the Gaussian distribution (3.26) is often used as a simple density model, it suffers from some significant limitations. Consider the number of free parameters in the distribution. A general symmetric covariance matrix Σ will have $\mathbf{\bar{\boldsymbol{D}}}(\boldsymbol{D} + 1) / 2$ independent parameters, and there are another D independent parameters in µ, giving $\bar{D}(D + 3) / 2$ parameters in total. For large D, the total number of parameters therefore grows quadratically with $D,$ and the computational task of manipulating and inverting the large matrices can become prohibitive. One way to address this problem is to use restricted forms of the covariance matrix. If we consider covariance matrices that are diagonal, so that $\pmb{\Sigma} = \operatorname{diag}(\sigma_{i}^{2})$ , we then have a total of 2D independent parameters in the density model. The corresponding contours of constant density are given by axis-aligned ellipsoids. We could further restrict the covariance matrix to be proportional to the identity matrix, $\pmb{\Sigma} = \sigma^{2} \mathbf{I}$ , known as an isotropic covariance, giving $D + 1$ independent parameters in the model together with spherical surfaces of constant density. The three possibilities of general, diagonal, and isotropic covariance matrices are illustrated in Figure 3.4. Unfortunately, whereas such approaches limit the number of degrees of freedom in the distribution and make inversion of the covariance matrix a much faster operation, they also greatly restrict the form of the probability density and limit its ability to capture interesting correlations in the data.

Figure 3.4 Contours of constant probability density for a Gaussian distribution in two dimensions in which the covariance matrix is (a) of general form, (b) diagonal, in which case the elliptical contours are aligned with the coordinate axes, and (c) proportional to the identity matrix, in which case the contours are concentric circles.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/6a7e9eff983c856ca74c4c586593a56bb58635640d682b039ad0db7076f826e7.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/48a5d564f3e51fc8afe1fa70aafe772f164a35f2aed016c6fb07da0ef664a2d1.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/82fcad9f0e2eb069032e8eb362931050f21b7de74e56fd7bf95a6abc587f5af7.jpg)  
(c)

A further limitation of the Gaussian distribution is that it is intrinsically unimodal (i.e., has a single maximum) and so is unable to provide a good approximation to multimodal distributions. Thus, the Gaussian distribution can be both too flexible, in the sense of having too many parameters, and too limited in the range of distributions that it can adequately represent. We will see later that the introduction of latent variables, also called hidden variables or unobserved variables, allows both of these problems to be addressed. In particular, a rich family of multimodal distributions is obtained by introducing discrete latent variables leading to mixtures of Gaussians. Similarly, the introduction of continuous latent variables leads to models in which the number of free parameters can be controlled independently of the dimensionality D of the data space while still allowing the model to capture the dominant correlations in the data set.

## 3.2.4 Conditional distribution

An important property of a multivariate Gaussian distribution is that if two sets of variables are jointly Gaussian, then the conditional distribution of one set conditioned on the other is again Gaussian. Similarly, the marginal distribution of either set is also Gaussian.

First, consider the case of conditional distributions. Suppose that x is a Ddimensional vector with Gaussian distribution $\mathcal{N}({\bf x} | \mu, \Sigma)$ and that we partition x into two disjoint subsets $\mathbf{x}_{a}$ and $\mathbf{x}_{b}$ . Without loss of generality, we can take $\mathbf{x}_{a}$ to form the first M components of $\mathbf{x},$ with $\mathbf{x}_{b}$ comprising the remaining $D - M$ components, so that

$$
\begin{array}{r}{{\bf x} = \left(\begin{array}{l}{{\bf x}_{a}} \\{{\bf x}_{b}} \end{array} \right).} \end{array}\tag{3.49}
$$

We also define corresponding partitions of the mean vector µ given by

$$
{\pmb \mu} = \binom{{\pmb \mu}_{a}}{{\pmb \mu}_{b}}\tag{3.50}
$$

and of the covariance matrix Σ given by

$$
\Sigma = \left(\begin{array}{cc}{{\Sigma_{aa}}} &{{\Sigma_{ab}}} \\{{\Sigma_{ba}}} &{{\Sigma_{bb}}} \end{array} \right).\tag{3.51}
$$

Note that the symmetry $\pmb{\Sigma}^{\mathrm{T}} = \pmb{\Sigma}$ of the covariance matrix implies that $\Sigma_{aa}$ and $\Sigma_{bb}$ are symmetric and that $\Sigma_{ba} = \Sigma_{ab}^{\mathrm{T}}$

In many situations, it will be convenient to work with the inverse of the covariance matrix:

$$
\begin{array}{r}{\pmb{\Lambda} \equiv \pmb{\Sigma}^{- 1},} \end{array}\tag{3.52}
$$

which is known as the precision matrix. In fact, we will see that some properties of Gaussian distributions are most naturally expressed in terms of the covariance, whereas others take a simpler form when viewed in terms of the precision. We therefore also introduce the partitioned form of the precision matrix:

$$
\pmb{\Lambda} = \left(\begin{array}{cc}{{\pmb{\Lambda}_{aa}}} &{{\pmb{\Lambda}_{ab}}} \\{{\pmb{\Lambda}_{ba}}} &{{\pmb{\Lambda}_{bb}}} \end{array} \right)\tag{3.53}
$$

corresponding to the partitioning (3.49) of the vector x. Because the inverse of a symmetric matrix is also symmetric, we see that $\mathbf{\Delta} \Lambda_{aa}$ and $\Lambda_{bb}$ are symmetric and that $\mathbf{A}_{ba} = \mathbf{A}_{ab}^{\mathrm{T}}$ . It should be stressed at this point that, for instance, $\mathbf{\Delta} \Lambda_{aa}$ is not simply given by the inverse of $\Sigma_{aa}$ . In fact, we will shortly examine the relation between the inverse of a partitioned matrix and the inverses of its partitions.

We begin by finding an expression for the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ From the product rule of probability, we see that this conditional distribution can be evaluated from the joint distribution $p(\mathbf{x}) = p(\mathbf{x}_{a}, \mathbf{x}_{b})$ simply by fixing $\mathbf{x}_{b}$ to the observed value and normalizing the resulting expression to obtain a valid probability distribution over $\mathbf{x}_{a}$ . Instead of performing this normalization explicitly, we can obtain the solution more efficiently by considering the quadratic form in the exponent of the Gaussian distribution given by (3.27) and then reinstating the normalization coefficient at the end of the calculation. If we make use of the partitioning (3.49), (3.50), and (3.53), we obtain

$$
\begin{array}{l}{{\displaystyle - \frac 12({\bf x} -{\boldsymbol{\mu}})^{\mathrm{T}}{\bf{\Sigma}}^{- 1}({\bf x} -{\boldsymbol{\mu}}) =} \} \\{{\displaystyle \qquad - \frac 12({\bf x}_{a} -{\boldsymbol{\mu}}_{a})^{\mathrm{T}} \Lambda_{aa}({\bf x}_{a} -{\boldsymbol{\mu}}_{a}) - \frac 12({\bf x}_{a} -{\boldsymbol{\mu}}_{a})^{\mathrm{T}} \Lambda_{ab}({\bf x}_{b} -{\boldsymbol{\mu}}_{b})} \ ~} \\{{\displaystyle \qquad - \frac 12({\bf x}_{b} -{\boldsymbol{\mu}}_{b})^{\mathrm{T}} \Lambda_{ba}({\bf x}_{a} -{\boldsymbol{\mu}}_{a}) - \frac 12({\bf x}_{b} -{\boldsymbol{\mu}}_{b})^{\mathrm{T}} \Lambda_{bb}({\bf x}_{b} -{\boldsymbol{\mu}}_{b})}.} \end{array}\tag{3.54}
$$

We see that as a function of $\mathbf{x}_{a}$ , this is again a quadratic form, and hence, the corresponding conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ will be Gaussian. Because this distribution is completely characterized by its mean and its covariance, our goal will be to identify expressions for the mean and covariance of $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ by inspection of (3.54).

This is an example of a rather common operation associated with Gaussian distributions, sometimes called ‘completing the square’, in which we are given a quadratic form defining the exponent terms in a Gaussian distribution and we need to determine the corresponding mean and covariance. Such problems can be solved straightforwardly by noting that the exponent in a general Gaussian distribution $\mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Sigma})$ can be written as

$$
-{\frac{1}{2}}(\mathbf{x} -{\boldsymbol{\mu}})^{\mathrm{{T}}}{\boldsymbol{\Sigma}}^{- 1}(\mathbf{x} -{\boldsymbol{\mu}}) = -{\frac{1}{2}} \mathbf{x}^{\mathrm{{T}}}{\boldsymbol{\Sigma}}^{- 1} \mathbf{x} + \mathbf{x}^{\mathrm{{T}}}{\boldsymbol{\Sigma}}^{- 1}{\boldsymbol{\mu}} +{\mathrm{const}}\tag{3.55}
$$

where ‘const’ denotes terms that are independent of x, We have also made use of the symmetry of Σ. Thus, if we take our general quadratic form and express it in the form given by the right-hand side of (3.55), then we can immediately equate the matrix of coefficients entering the second-order term in x to the inverse covariance matrix $\pmb{\Sigma}^{- 1}$ and the coefficient of the linear term in x to $\Sigma^{- 1} \boldsymbol{\mu}$ , from which we can obtain $\pmb{\mu}.$

Now let us apply this procedure to the conditional Gaussian distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ for which the quadratic form in the exponent is given by (3.54). We will denote the mean and covariance of this distribution by $\mu_{a \left| b \right.}$ and $\Sigma_{a \left.b \right.}$ , respectively. Consider the functional dependence of (3.54) on $\mathbf{x}_{a}$ in which $\mathbf{x}_{b}$ is regarded as a constant. If we pick out all terms that are second order in $\mathbf{x}_{a}$ , we have

$$
- \frac{1}{2} \mathbf{x}_{a}^{\mathrm{{T}}} \pmb{\Lambda}_{aa} \mathbf{x}_{a}\tag{3.56}
$$

from which we can immediately conclude that the covariance (inverse precision) of $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ is given by

$$
\begin{array}{r}{\pmb{\Sigma}_{a | b} = \pmb{\Lambda}_{aa}^{- 1}.} \end{array}\tag{3.57}
$$

Now consider all the terms in (3.54) that are linear in $\mathbf{x}_{a}$ :

$$
{\bf x}_{a}^{\mathrm{T}} \left\{\pmb{\Lambda}_{aa} \pmb{\mu}_{a} - \pmb{\Lambda}_{ab} \big(\mathbf{x}_{b} - \pmb{\mu}_{b} \big) \right\}\tag{3.58}
$$

where we have used $\pmb{\Lambda}_{ba}^{\mathrm{T}} = \pmb{\Lambda}_{ab}$ . From our discussion of the general form (3.55), the coefficient of $\mathbf{x}_{a}$ in this expression must equal $\Sigma_{a | b}^{- 1} \mu_{a | b}$ and, hence,

$$
\begin{array}{rcl}{{\pmb \mu}_{a | b}} &{{=}} &{{\pmb \Sigma_{a | b} \left\{{\pmb \Lambda}_{aa}{\pmb \mu}_{a} -{\pmb \Lambda}_{ab}({\pmb x}_{b} -{\pmb \mu}_{b}) \right\}}} \\{{}} &{{=}} &{{\pmb \mu}_{a} -{\pmb \Lambda}_{aa}^{- 1}{\pmb \Lambda}_{ab}({\pmb x}_{b} -{\pmb \mu}_{b})} \end{array}\tag{3.59}
$$

where we have made use of (3.57).

The results (3.57) and (3.59) are expressed in terms of the partitioned precision matrix of the original joint distribution $p(\mathbf{x}_{a}, \mathbf{x}_{b})$ . We can also express these results in terms of the corresponding partitioned covariance matrix. To do this, we make use of the following identity for the inverse of a partitioned matrix:

$$
\left(\mathbf{{A}}{\mathbf{B}} \right)^{- 1} = \left(\mathbf{{M}} \mathbf{{\Lambda}} - \mathbf{{M}} \mathbf{{B}} \mathbf{{D}}^{- 1} \mathbf{{\Lambda}}^{- 1} \mathbf{{C}} \mathbf{{M}} \mathbf{{B}} \mathbf{{D}}^{- 1} \right)\tag{3.60}
$$

where we have defined

$$
\mathbf{M} = \left(\mathbf{A} - \mathbf{B} \mathbf{D}^{- 1} \mathbf{C} \right)^{- 1}.\tag{3.61}
$$

The quantity ${{\bf{M}}^{- 1}}$ is known as the Schur complement of the matrix on the left-hand side of (3.60) with respect to the submatrix D. Using the definition

$$
\left(\begin{array}{cc}{{{\Sigma}_{aa}}} &{{{\Sigma}_{ab}}} \\{{{\Sigma}_{ba}}} &{{{\Sigma}_{bb}}} \end{array} \right)^{- 1} = \left(\begin{array}{cc}{{{\Lambda}_{aa}}} &{{{\Lambda}_{ab}}} \\{{{\Lambda}_{ba}}} &{{{\Lambda}_{bb}}} \end{array} \right)\tag{3.62}
$$

and making use of (3.60), we have

$$
\begin{array}{rcl}{{{\bf{\Lambda}}}_{{aa}}} &{{=}} &{({\bf{\Sigma}})_{aa} - \Sigma_{ab} \Sigma_{bb}^{- 1} \Sigma_{ba})^{- 1}} \end{array}\tag{3.63}
$$

$$
\begin{array}{rlr}{\Lambda_{ab}} &{=} &{- \big(\boldsymbol{\Sigma}_{aa} - \boldsymbol{\Sigma}_{ab} \boldsymbol{\Sigma}_{bb}^{- 1} \boldsymbol{\Sigma}_{ba} \big)^{- 1} \boldsymbol{\Sigma}_{ab} \boldsymbol{\Sigma}_{bb}^{- 1}.} \end{array}\tag{3.64}
$$

From these we obtain the following expressions for the mean and covariance of the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$

$$
\begin{array}{ccl}{\pmb{\mu}_{a | b}} &{=} &{\pmb{\mu}_{a} + \pmb{\Sigma}_{ab} \pmb{\Sigma}_{bb}^{- 1}(\pmb{x}_{b} - \pmb{\mu}_{b})} \end{array}\tag{3.65}
$$

$$
\begin{array}{rcl}{{\Sigma_{a | b}}} &{{=}} &{{\Sigma_{aa} - \Sigma_{ab} \Sigma_{bb}^{- 1} \Sigma_{ba}.}} \end{array}\tag{3.66}
$$

Comparing (3.57) and (3.66), we see that the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ takes a simpler form when expressed in terms of the partitioned precision matrix than when it is expressed in terms of the partitioned covariance matrix. Note that the mean of the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ , given by (3.65), is a linear function of $\mathbf{x}_{b}$ and that the covariance, given by (3.66), is independent of $\mathbf{x}_{b}$ . This represents an example of a linear-Gaussian model.

Section 11.1.4

## 3.2.5 Marginal distribution

We have seen that if a joint distribution $p(\mathbf{x}_{a}, \mathbf{x}_{b})$ is Gaussian, then the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ will again be Gaussian. Now we turn to a discussion of the marginal distribution given by

$$
p(\mathbf{x}_{a}) = \int p(\mathbf{x}_{a}, \mathbf{x}_{b}) d \mathbf{x}_{b},\tag{3.67}
$$

which, as we will see, is also Gaussian. Once again, our strategy for calculating this distribution will be to focus on the quadratic form in the exponent of the joint distribution and thereby to identify the mean and covariance of the marginal distribution $p(\mathbf{x}_{a})$

The quadratic form for the joint distribution can be expressed, using the partitioned precision matrix, in the form (3.54). Our goal is to integrate out $\mathbf{x}_{b}$ , which is most easily achieved by first considering the terms involving $\mathbf{x}_{b}$ and then completing the square to facilitate the integration. Picking out just those terms that involve $\mathbf{x}_{b}$ we have

$$
- \frac{1}{2} \mathbf{x}_{b}^{\mathrm{T}} \mathbf{A}_{bb} \mathbf{x}_{b} + \mathbf{x}_{b}^{T} \mathbf{m} = - \frac{1}{2}(\mathbf{x}_{b} - \mathbf{A}_{bb}^{- 1} \mathbf{m})^{\mathrm{T}} \mathbf{A}_{bb}(\mathbf{x}_{b} - \mathbf{A}_{bb}^{- 1} \mathbf{m}) + \frac{1}{2} \mathbf{m}^{\mathrm{T}} \mathbf{A}_{bb}^{- 1} \mathbf{m}\tag{3.68}
$$

where we have defined

$$
\mathbf{m} = \pmb{\Lambda}_{bb} \pmb{\mu}_{b} - \pmb{\Lambda}_{ba}(\mathbf{x}_{a} - \pmb{\mu}_{a}).\tag{3.69}
$$

We see that the dependence on $\mathbf{x}_{b}$ has been cast into the standard quadratic form of a Gaussian distribution corresponding to the first term on the right-hand side of (3.68) plus a term that does not depend on $\mathbf{x}_{b}$ (but that does depend on $\mathbf{x}_{a})$ . Thus, when we take the exponential of this quadratic form, we see that the integration over $\mathbf{x}_{b}$ required by (3.67) will take the form

$$
\int \exp \left\{- \frac{1}{2}(\mathbf{x}_{b} - \mathbf{A}_{bb}^{- 1} \mathbf{m})^{\mathrm{T}} \mathbf{A}_{bb}(\mathbf{x}_{b} - \mathbf{A}_{bb}^{- 1} \mathbf{m}) \right\} d \mathbf{x}_{b}.\tag{3.70}
$$

This integration is easily performed by noting that it is the integral over an unnormalized Gaussian, and so the result will be the reciprocal of the normalization coefficient. We know from the form of the normalized Gaussian given by (3.26) that this coefficient is independent of the mean and depends only on the determinant of the covariance matrix. Thus, by completing the square with respect to $\mathbf{x}_{b}$ , we can integrate out $\mathbf{x}_{b}$ so that the only term remaining from the contributions on the left-hand side of (3.68) that depends on $\mathbf{x}_{a}$ is the last term on the right-hand side of (3.68) in which m is given by (3.69). Combining this term with the remaining terms from (3.54) that depend on $\mathbf{x}_{a}$ , we obtain

$$
\begin{array}{rl}{{\frac{1}{2}[\Lambda_{bb} \mu_{b} - \Lambda_{ba}(\mathbf x_{a} - \pmb \mu_{a})]^{\mathrm{T}} \mathbf\Lambda_{bb}^{- 1}[\Lambda_{bb} \mu_{b} - \Lambda_{ba}(\mathbf x_{a} - \pmb \mu_{a})]}} \\ &{- \frac{1}{2} \mathbf x_{a}^{\mathrm T} \mathbf \Lambda_{aa} \mathbf x_{a} + \mathbf x_{a}^{\mathrm T}(\mathbf \Lambda_{aa} \pmb \mu_{a} + \Lambda_{ab} \mu_{b}) + \mathrm{const}} \\ &{= \ - \frac{1}{2} \mathbf x_{a}^{\mathrm T}(\mathbf \Lambda_{aa} - \Lambda_{ab} \pmb \Lambda_{bb}^{- 1} \mathbf \Lambda_{ba}) \mathbf x_{a}} \\ &{+ \mathbf x_{a}^{\mathrm T}(\mathbf \Lambda_{aa} - \mathbf \Lambda_{ab} \pmb \Lambda_{bb}^{- 1} \mathbf \Lambda_{ba}) \pmb \mu_{a} + \mathrm{const}} \end{array}\tag{3.71}
$$

where ‘const’ denotes quantities independent of $\mathbf{x}_{a}$ . Again, by comparison with (3.55), we see that the covariance of the marginal distribution $p(\mathbf{x}_{a})$ is given by

$$
\pmb{\Sigma}_{a} =(\pmb{\Lambda}_{aa} - \pmb{\Lambda}_{ab} \pmb{\Lambda}_{bb}^{- 1} \pmb{\Lambda}_{ba})^{- 1}.\tag{3.72}
$$

Similarly, the mean is given by

$$
\Sigma_{a}(\Lambda_{aa} - \Lambda_{ab} \Lambda_{bb}^{- 1} \Lambda_{ba}) \pmb{\mu}_{a} = \pmb{\mu}_{a}\tag{3.73}
$$

where we have used (3.72). The covariance (3.72) is expressed in terms of the partitioned precision matrix given by (3.53). We can rewrite this in terms of the corresponding partitioning of the covariance matrix given by (3.51), as we did for the conditional distribution. These partitioned matrices are related by

$$
\left(\Lambda_{aa} \quad \Lambda_{ab} \right)^{- 1} = \left(\begin{array}{cc}{{{\Sigma}_{aa}}} &{{{\Sigma}_{ab}}} \\{{{\Sigma}_{ba}}} &{{{\Sigma}_{bb}}} \end{array} \right).\tag{3.74}
$$

Making use of (3.60), we then have

$$
\left(\pmb{\Lambda}_{aa} - \pmb{\Lambda}_{ab} \pmb{\Lambda}_{bb}^{- 1} \pmb{\Lambda}_{ba} \right)^{- 1} = \pmb{\Sigma}_{aa}.\tag{3.75}
$$

Thus, we obtain the intuitively satisfying result that the marginal distribution $p(\mathbf{x}_{a})$ has mean and covariance given by

$$
\begin{array}{rlr}{{\mathbb E}[{\bf x}_{a}]} &{{} =} &{\pmb{\mu}_{a}} \end{array}\tag{3.76}
$$

$$
\begin{array}{rcl}{\displaystyle \mathrm{cov}[\mathbf{x}_{a}]} &{=} &{\pmb{\Sigma}_{aa}.} \end{array}\tag{3.77}
$$

We see that for a marginal distribution, the mean and covariance are most simply expressed in terms of the partitioned covariance matrix, in contrast to the conditional distribution for which the partitioned precision matrix gives rise to simpler expressions.

Our results for the marginal and conditional distributions of a partitioned Gaussian can be summarized as follows. Given a joint Gaussian distribution $\mathcal{N}({\bf x} | \mu, \Sigma)$ with $\pmb{\Lambda} \equiv \pmb{\Sigma}^{- 1}$ and the following partitions

$$
\mathbf{x} ={\binom{\mathbf{x}_{a}}{\mathbf{x}_{b}}}, \quad \pmb{\mu} ={\binom{\pmb{\mu}_{a}}{\pmb{\mu}_{b}}}\tag{3.78}
$$

$$
\pmb{\Sigma} = \left(\begin{array}{cc}{\pmb{\Sigma}_{aa}} &{\pmb{\Sigma}_{ab}} \\{\pmb{\Sigma}_{ba}} &{\pmb{\Sigma}_{bb}} \end{array} \right), \quad \pmb{\Lambda} = \left(\begin{array}{cc}{\pmb{\Lambda}_{aa}} &{\pmb{\Lambda}_{ab}} \\{\pmb{\Lambda}_{ba}} &{\pmb{\Lambda}_{bb}} \end{array} \right)\tag{3.79}
$$

then the conditional distribution is given by

$$
\begin{array}{rlr}{p(\mathbf{x}_{a} | \mathbf{x}_{b})} &{{} =} &{\mathcal{N}(\mathbf{x} | \pmb{\mu}_{a | b}, \pmb{\Lambda}_{aa}^{- 1})} \end{array}\tag{3.80}
$$

$$
\begin{array}{ccl}{\pmb{\mu}_{a | b}} &{=} &{\pmb{\mu}_{a} - \pmb{\Lambda}_{aa}^{- 1} \pmb{\Lambda}_{ab} \big(\mathbf{x}_{b} - \pmb{\mu}_{b} \big)} \end{array}\tag{3.81}
$$

and the marginal distribution is given by

$$
\begin{array}{r}{p(\mathbf{x}_{a}) = \mathcal{N}(\mathbf{x}_{a} | \pmb{\mu}_{a}, \pmb{\Sigma}_{aa}).} \end{array}\tag{3.82}
$$

We illustrate the idea of conditional and marginal distributions associated with a multivariate Gaussian using an example involving two variables in Figure 3.5.

## 3.2.6 Bayes’ theorem

In Sections 3.2.4 and 3.2.5 we considered a Gaussian $p(\mathbf{x})$ in which we partitioned the vector x into two subvectors $\mathbf{x} =(\mathbf{x}_{a}, \mathbf{x}_{b})$ and then found expressions for the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ and the marginal distribution $p(\mathbf{x}_{a})$ We noted that the mean of the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ was a linear function of $\mathbf{x}_{b}$ . Here we will suppose that we are given a Gaussian marginal distribution $p(\mathbf{x})$ and a Gaussian conditional distribution $p(\mathbf{y} \vert \mathbf{x})$ in which $p(\mathbf{y} \vert \mathbf{x})$ has a mean that is a linear function of x and a covariance that is independent of x. This is an example of a linear-Gaussian model (Roweis and Ghahramani, 1999). We wish to find the marginal distribution $p(\mathbf{y})$ and the conditional distribution $p(\mathbf{x} | \mathbf{y})$ . This is a structure that arises in several types of generative model and it will prove convenient to derive the general results here.

We will take the marginal and conditional distributions to be

$$
\begin{array}{rcl}{p(\mathbf{x})} &{=} &{\mathcal{N} \left(\mathbf{x} | \pmb{\mu}, \pmb{\Lambda}^{- 1} \right)} \end{array}\tag{3.83}
$$

$$
\begin{array}{rlr}{p({\bf y} |{\bf x})} &{{} =} &{N \left({\bf y} |{\bf Ax} +{\bf b},{\bf L}^{- 1} \right)} \end{array}\tag{3.84}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/153e93d90c128fdc0845a437b7c39c0bf720d6a857641fd0eb443e394c46b584.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b91b0a330df54b935ca005905f54901c4533e07f338d2142076ad333a3b35fe7.jpg)  
(b)  
Figure 3.5 (a) Contours of a Gaussian distribution $p(x_{a}, x_{b})$ over two variables. (b) The marginal distribution $p(x_{a})$ (blue curve) and the conditional distribution $p(x_{a} | x_{b})$ for $x_{b} = 0.7$ (red curve).

where $\mu, \mathbf{A}$ , and b are parameters governing the means, and Λ and L are precision matrices. If x has dimensionality $\dot{M}$ and y has dimensionality D, then the matrix A has size $D \times M$

First we find an expression for the joint distribution over x and y. To do this, we define

$$
\mathbf{z} ={\binom{\mathbf{x}}{\mathbf{y}}}\tag{3.85}
$$

and then consider the log of the joint distribution:

$$
\begin{array}{lcl}{\ln p(\mathbf{z})} &{=} &{\ln p(\mathbf{x}) + \ln p(\mathbf{y} | \mathbf{x})} \\ &{=} &{\displaystyle - \frac{1}{2}(\mathbf{x} - \pmb{\mu})^{\mathrm{T}} \mathbf{A}(\mathbf{x} - \pmb{\mu})} \\ & &{\displaystyle - \frac{1}{2}(\mathbf{y} - \mathbf{A} \mathbf{x} - \mathbf{b})^{\mathrm{T}} \mathbf{L}(\mathbf{y} - \mathbf{A} \mathbf{x} - \mathbf{b}) + \mathrm{const}} \end{array}\tag{3.86}
$$

where ‘const’ denotes terms independent of x and y. As before, we see that this is a quadratic function of the components of $\mathbf{z},$ and hence, $p(\mathbf{z})$ is Gaussian distribution. To find the precision of this Gaussian, we consider the second-order terms in (3.86), which can be written as

$$
\begin{array}{r}{- \frac{1}{2} \mathbf{x}^{\mathrm{T}}(\mathbf{A} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}) \mathbf{x} - \frac{1}{2} \mathbf{y}^{\mathrm{T}} \mathbf{L} \mathbf{y} + \frac{1}{2} \mathbf{y}^{\mathrm{T}} \mathbf{L} \mathbf{A} \mathbf{x} + \frac{1}{2} \mathbf{x}^{\mathrm{T}} \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{y}} \\{= \mathbf{\Sigma} - \frac{1}{2} \left(\mathbf{\Sigma} \mathbf{y} \right)^{\mathrm{T}} \left(\mathbf{\Sigma}^{\mathbf{A} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}} - \mathbf{A}^{\mathrm{T}} \mathbf{L} \right) \left(\mathbf{\Sigma} \mathbf{y} \right) = - \frac{1}{2} \mathbf{z}^{\mathrm{T}} \mathbb{R} \mathbf{z}} \end{array}\tag{3.87}
$$

and so the Gaussian distribution over z has precision (inverse covariance) matrix

given by

$$
\mathbb{R} = \left(\begin{array}{cc}{\mathbf{\Lambda} \mathbf{1} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}} &{- \mathbf{A}^{\mathrm{T}} \mathbf{L}} \\{- \mathbf{L} \mathbf{A}} &{\mathbf{L}} \end{array} \right).\tag{3.88}
$$

The covariance matrix is found by taking the inverse of the precision, which can be done using the matrix inversion formula (3.60) to give

$$
\mathrm{cov}[\mathbf{z}] = \mathbb{R}^{- 1} = \left(\begin{array}{cc}{\mathbf{\mathbf{A}}^{- 1}} &{\mathbf{\mathbf{A}}^{- 1} \mathbf{A}^{\mathrm{T}}} \\{\mathbf{A} \mathbf{A}^{- 1}} &{\mathbf{L}^{- 1} + \mathbf{A} \mathbf{A}^{- 1} \mathbf{A}^{\mathrm{T}}} \end{array} \right).\tag{3.89}
$$

Similarly, we can find the mean of the Gaussian distribution over z by identifying the linear terms in (3.86), which are given by

$$
\mathbf{x}^{\mathrm{T}} \mathbf{A} \mu - \mathbf{x}^{\mathrm{T}} \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{b} + \mathbf{y}^{\mathrm{T}} \mathbf{L} \mathbf{b} ={\binom{\mathbf{x}}{\mathbf{y}}}^{\mathrm{T}} \left({\begin{array}{c}{\mathbf{\mathbf{A}} \mu - \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{b}} \\{\mathbf{L} \mathbf{b}} \end{array}} \right).\tag{3.90}
$$

Using our earlier result (3.55) obtained by completing the square over the quadratic form of a multivariate Gaussian, we find that the mean of z is given by

$$
\mathbb{E}[{\mathbf{z}}] ={\mathbb{R}}^{- 1} \left({\begin{array}{c}{\mathbf{\Lambda} \mathbf{A} \mathbf{\mu} -{\mathbf{A}}^{\mathrm{T}}{\mathbf{L}}{\mathbf{b}}} \\{{\mathbf{\Lambda}}{\mathbf{L}}{\mathbf{b}}} \end{array}} \right).\tag{3.91}
$$

Making use of (3.89), we then obtain

$$
\mathbb{E}[\mathbf{z}] = \binom{\mu}{\mathbf{A} \mu + \mathbf{b}}.\tag{3.92}
$$

Next we find an expression for the marginal distribution $p(\mathbf{y})$ in which we have marginalized over x. Recall that the marginal distribution over a subset of the components of a Gaussian random vector takes a particularly simple form when expressed in terms of the partitioned covariance matrix. Specifically, its mean and covariance are given by (3.76) and (3.77), respectively. Making use of (3.89) and (3.92), we see that the mean and covariance of the marginal distribution $p(\mathbf{y})$ are given by

$$
\begin{array}{rcl}{{\mathbb{E}}[{\bf y}]} &{=} &{{\bf A} \mu +{\bf b}} \end{array}\tag{3.93}
$$

$$
\mathrm{cov}[\mathbf{y}] \ = \ \mathbf{L}^{- 1} + \mathbf{A} \mathbf{A}^{- 1} \mathbf{A}^{\mathrm{{T}}}.\tag{3.94}
$$

A special case of this result is when $\mathbf{A} = \mathbf{I},$ in which case the marginal distribution reduces to the convolution of two Gaussians, for which we see that the mean of the convolution is the sum of the means of the two Gaussians and the covariance of the convolution is the sum of their covariances.

Finally, we seek an expression for the conditional $p(\mathbf{x} | \mathbf{y})$ . Recall that the results for the conditional distribution are most easily expressed in terms of the partitioned precision matrix, using (3.57) and (3.59). Applying these results to (3.89) and (3.92), we see that the conditional distribution $p(\mathbf{x} | \mathbf{y})$ has mean and covariance given by

$$
\begin{array}{lll}{{\mathbb{E}}[{\bf x} |{\bf y}]} &{=} &{\left({\pmb{\Lambda}} +{\bf A}^{\mathrm{T}}{\bf LA} \right)^{- 1} \left\{{\bf A}^{\mathrm{T}}{\bf L}({\bf y} -{\bf b}) +{\pmb{\Lambda}}{\pmb{\mu}} \right\}} \end{array}\tag{3.95}
$$

$$
\mathrm{cov}[{\bf x} |{\bf y}] =({\bf A} +{\bf A}^{\mathrm{T}}{\bf LA})^{- 1}.\tag{3.96}
$$

The evaluation of this conditional distribution can be seen as an example of Bayes’ theorem, in which we interpret $p(\mathbf{x})$ as a prior distribution over x. If the variable y is observed, then the conditional distribution $p(\mathbf{x} | \mathbf{y})$ represents the corresponding posterior distribution over x. Having found the marginal and conditional distributions, we have effectively expressed the joint distribution $p(\mathbf{z}) = p(\mathbf{x}) p(\mathbf{y} | \mathbf{x})$ in the form $p(\mathbf{x} | \mathbf{y}) p(\mathbf{y})$

These results can be summarized as follows. Given a marginal Gaussian distribution for x and a conditional Gaussian distribution for y given x in the form

$$
\begin{array}{rcl}{p({\bf x})} &{=} &{\mathcal{N}({\bf x} | \pmb{\mu}, \pmb{\Lambda}^{- 1})} \end{array}\tag{3.97}
$$

$$
\begin{array}{rlr}{p({\bf y} |{\bf x})} &{=} &{\mathcal{N}({\bf y} |{\bf Ax} +{\bf b},{\bf L}^{- 1}),} \end{array}\tag{3.98}
$$

then the marginal distribution of y and the conditional distribution of x given y are given by

$$
\begin{array}{lll}{p(\mathbf{y})} &{=} &{\mathcal{N}(\mathbf{y} | \mathbf{A} \mu + \mathbf{b}, \mathbf{L}^{- 1} + \mathbf{A} \mathbf{A}^{- 1} \mathbf{A}^{\mathrm{T}})} \end{array}\tag{3.99}
$$

$$
\begin{array}{rlr}{p({\bf x} |{\bf y})} &{=} &{\mathcal{N}({\bf x} | \Sigma \{{\bf A}^{\mathrm{T}}{\bf L}({\bf y} -{\bf b}) + \Lambda \mu\}, \Sigma)} \end{array}\tag{3.100}
$$

where

$$
\begin{array}{r}{\pmb{\Sigma} =(\pmb{\Lambda} + \pmb{\Lambda}^{\mathrm{T}} \mathbf{L} \mathbf{A})^{- 1}.} \end{array}\tag{3.101}
$$

## 3.2.7 Maximum likelihood

Given a data set $\mathbf{X} =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{N})^{\mathrm{T}}$ in which the observations $\left\{{\bf x}_{n} \right\}$ are assumed to be drawn independently from a multivariate Gaussian distribution, we can estimate the parameters of the distribution by maximum likelihood. The log likelihood function is given by

$$
\ln p({\bf X} |{\boldsymbol \mu},{\boldsymbol \Sigma}) = -{\frac{ND}{2}} \ln(2 \pi) -{\frac{N}{2}} \ln |{\boldsymbol \Sigma} | -{\frac{1}{2}} \sum_{n = 1}^{N}({\bf x}_{n} -{\boldsymbol \mu})^{\mathrm{T}}{\boldsymbol \Sigma}^{- 1}({\bf x}_{n} -{\boldsymbol \mu}).\tag{3.102}
$$

By simple rearrangement, we see that the likelihood function depends on the data set only through the two quantities

$$
\sum_{n = 1}^{N} \mathbf{x}_{n}, \qquad \sum_{n = 1}^{N} \mathbf{x}_{n} \mathbf{x}_{n}^{\mathrm{T}}.\tag{3.103}
$$

These are known as the sufficient statistics for the Gaussian distribution. Using (A.19), the derivative of the log likelihood with respect to $\pmb{\mu}$ is given by

$$
\frac{\partial}{\partial \pmb{\mu}} \ln p(\mathbf{X} | \pmb{\mu}, \pmb{\Sigma}) = \sum_{n = 1}^{N} \pmb{\Sigma}^{- 1}(\mathbf{x}_{n} - \pmb{\mu}),\tag{3.104}
$$

and setting this derivative to zero, we obtain the solution for the maximum likelihood estimate of the mean:

$$
\pmb{\mu}_{\mathrm{ML}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n},\tag{3.105}
$$

which is the mean of the observed set of data points. The maximization of (3.102) with respect to Σ is rather more involved. The simplest approach is to ignore the symmetry constraint and show that the resulting solution is symmetric as required. Alternative derivations of this result, which impose the symmetry and positive definiteness constraints explicitly, can be found in Magnus and Neudecker (1999). The result is as expected and takes the form

$$
{\boldsymbol{\Sigma}}_{\mathrm{ML}} ={\frac{1}{N}} \sum_{n = 1}^{N}(\mathbf{x}_{n} -{\boldsymbol{\mu}}_{\mathrm{ML}})(\mathbf{x}_{n} -{\boldsymbol{\mu}}_{\mathrm{ML}})^{\mathrm{T}},\tag{3.106}
$$

which involves $\pmb{\mu}_{\mathrm{ML}}$ because this is the result of a joint maximization with respect to $\pmb{\mu}$ and Σ. Note that the solution (3.105) for $\pmb{\mu}_{\mathrm{ML}}$ does not depend on $\pmb{\Sigma}_{\mathrm{ML}}$ , and so we can first evaluate $\pmb{\mu}_{\mathrm{MI}}$ and then use this to evaluate $\pmb{\Sigma}_{\mathrm{ML}}$

If we evaluate the expectations of the maximum likelihood solutions under the true distribution, we obtain the following results

$$
\mathbb{E}[\pmb{\mu}_{\mathrm{ML}}] \ = \ \pmb{\mu}\tag{3.107}
$$

$$
\mathbb{E}[\Sigma_{\mathrm{{ML}}}] = \frac{N - 1}{N} \Sigma.\tag{3.108}
$$

We see that the expectation of the maximum likelihood estimate for the mean is equal to the true mean. However, the maximum likelihood estimate for the covariance has an expectation that is less than the true value, and hence, it is biased. We can correct this bias by defining a different estimator $\widetilde{\pmb{\Sigma}}$ given by

$$
\widetilde \Sigma = \frac{1}{N - 1} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \pmb{\mu}_{\mathrm{ML}})(\mathbf{x}_{n} - \pmb{\mu}_{\mathrm{ML}})^{\mathrm{T}}.\tag{3.109}
$$

Clearly from (3.106) and (3.108), the expectation of $\widetilde{\pmb{\Sigma}}$ is equal to $\pmb{\Sigma}$

## 3.2.8 Sequential estimation

Our discussion of the maximum likelihood solution represents a batch method in which the entire training data set is considered at once. An alternative is to use sequential methods, which allow data points to be processed one at a time and then discarded. These are important for online applications and for large data when the batch processing of all data points at once is infeasible.

Consider the result (3.105) for the maximum likelihood estimator of the mean $\pmb{\mu}_{\mathrm{ML}}$ , which we will denote by $\mu_{\mathrm{ML}}^{(N)}$ when it is based on N observations. If we

Figure 3.6 Plots of the Old Faithful data in which the red curves are contours of constant probability density. (a) A single Gaussian distribution which has been fitted to the data using maximum likelihood. Note that this distribution fails to capture the two clumps in the data and indeed places much of its probability mass in the central region between the clumps where the data are relatively sparse. (b) The distribution given by a linear combination of two Gaussians, also fitted by maximum likelihood, which gives a better representation of the data.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/681d904d084b935fc3e6f2b02a21adfe49c644d8ddd09990bf3fec85b9c77b8d.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/9374d845447bf5c46102693fb9fbf5032ec74c0115274eab000753a114467638.jpg)  
dissect out the contribution from the final data point $\mathbf{x}_{N}$ , we obtain

$$
\begin{array}{rcl}{\displaystyle \mu_{\mathrm{ML}}^{(N)}} &{=} &{\displaystyle \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n}} \\ &{=} &{\displaystyle \frac{1}{N} \mathbf{x}_{N} + \frac{1}{N} \sum_{n = 1}^{N - 1} \mathbf{x}_{n}} \\ &{=} &{\displaystyle \frac{1}{N} \mathbf{x}_{N} + \frac{N - 1}{N} \mu_{\mathrm{ML}}^{(N - 1)}} \\ &{=} &{\displaystyle \mu_{\mathrm{ML}}^{(N - 1)} + \frac{1}{N}(\mathbf{x}_{N} - \mu_{\mathrm{ML}}^{(N - 1)}).} \end{array}\tag{3.110}
$$

This result has a nice interpretation, as follows. After observing $N - 1$ data points, we estimate $\pmb{\mu}$ by $\mu_{\mathrm{ML}}^{(N - 1)}$ . We now observe data point $\mathbf{x}_{N}$ , and we obtain our revised estimate $\mu_{\mathrm{ML}}^{(N)}$ by moving the old estimate a small amount, proportional to $1 / N$ , in the direction of the ‘error signal’ $({\bf x}_{N} - \pmb{\mu}_{\mathrm{ML}}^{(N - 1)})$ . Note that, as N increases, so the contributions from successive data points get smaller.

## 3.2.9 Mixtures of Gaussians

Although the Gaussian distribution has some important analytical properties, it suffers from significant limitations when used to model modelling real data sets. Consider the example shown in Figure 3.6(a). This is known as the ‘Old Faithful data set, and comprises 272 measurements of the eruption of the Old Faithful geyser in Yellowstone National Park in the USA. Each measurement gives the duration of the eruption in minutes (horizontal axis) and the time in minutes to the next eruption (vertical axis). We see that the data set forms two dominant clumps, and that a simple Gaussian distribution is unable to capture this structure.

We might expect that a superposition of two Gaussian distributions would be able to do a much better job of representing the structure in this data set, and indeed

Figure 3.7 Example of a Gaussian mixture distribution in one dimension showing three Gaussians (each scaled by a coefficient) in blue and their sum in red.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/8cc1a5f2b8ee56fc0ea0998f85f49c6a3e9bac091923411bf17b088706a1ddfd.jpg)

this proves to be the case, as can be seen from Figure 3.6(b). Such superpositions, formed by taking linear combinations of more basic distributions such as Gaussians, can be formulated as probabilistic models known as mixture distributions. In this section we will consider Gaussians to illustrate the framework of mixture models. More generally, mixture models can comprise linear combinations of other distributions, for example mixtures of Bernoulli distributions for binary variables. In Figure 3.7 we see that a linear combination of Gaussians can give rise to very complex densities. By using a sufficient number of Gaussians and by adjusting their means and covariances as well as the coefficients in the linear combination, almost any continuous distribution can be approximated to arbitrary accuracy.

We therefore consider a superposition of K Gaussian densities of the form

$$
p({\mathbf x}) = \sum_{k = 1}^{K} \pi_{k} \mathcal{N}({\mathbf x} | \mu_{k}, \Sigma_{k}),\tag{3.111}
$$

which is called a mixture of Gaussians. Each Gaussian density $\mathcal{N}({\bf x} | \mu_{k}, \Sigma_{k})$ is called a component of the mixture and has its own mean $\pmb{\mu}_{k}$ and covariance $\Sigma_{k}$ Contour and surface plots for a Gaussian mixture in two dimensions having three components are shown in Figure 3.8.

The parameters $\pi_{k}$ in (3.111) are called mixing coefficients. If we integrate both sides of (3.111) with respect to x, and note that both $p(\mathbf{x})$ and the individual Gaussian components are normalized, we obtain

$$
\sum_{k = 1}^{K} \pi_{k} = 1.\tag{3.112}
$$

Also, given that $\mathcal{N}({\bf x} | \mu_{k}, \Sigma_{k}) \geqslant 0$ , a sufficient condition for the requirement $p(\mathbf{x}) \geqslant$ 0 is that $\pi_{k} \geqslant 0$ for all k. Combining this with the condition (3.112), we obtain

Chapter 15

$$
0 \leqslant \pi_{k} \leqslant 1.\tag{3.113}
$$

We can therefore see that the mixing coefficients satisfy the requirements to be probabilities, and we will show that this probabilistic interpretation of mixture distributions is very powerful.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/0dd758a562a6ee71c07170f4ac09d892efe7313c65517031be13857abe03d96c.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/4c77e8302401ad9894c2df27444ed7c911502a7bf40597cb8e8329f8d70f7785.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/5282283010a72d683e9f91e4e2b6ba7bae9860cd49a57f4f9f344d91e9ff5f04.jpg)  
(c)  
Figure 3.8 Illustration of a mixture of three Gaussians in a two-dimensional space. (a) Contours of constant density for each of the mixture components, in which the three components are denoted red, blue, and green, and the values of the mixing coefficients are shown below each component. (b) Contours of the marginal probability density $p(\mathbf{x})$ of the mixture distribution. (c) A surface plot of the distribution $p(\mathbf{x})$

From the sum and product rules of probability, the marginal density can be written as

$$
p(\mathbf{x}) = \sum_{k = 1}^{K} p(k) p(\mathbf{x} | k),\tag{3.114}
$$

which is equivalent to (3.111) in which we can view $\pi_{k} = p(k)$ as the prior probability of picking the kth component, and the density $\mathcal{N}({\bf x} | \mu_{k}, \Sigma_{k}) = p({\bf x} | k)$ as the probability of x conditioned on k. As we will see in later chapters, an important role is played by the corresponding posterior probabilities $p(k | \mathbf{x})$ , which are also known as responsibilities. From Bayes’ theorem, these are given by

$$
\begin{array}{rcl}{\gamma_{k}(\mathbf x)} &{\equiv} &{p(k | \mathbf x)} \\ &{=} &{\displaystyle \frac{p(k) p(\mathbf x | k)}{\sum_{l} p(l) p(\mathbf x | l)}} \\ &{=} &{\displaystyle \frac{\pi_{k} \mathcal{N}(\mathbf x | \pmb{\mu}_{k}, \pmb{\Sigma}_{k})}{\sum_{l} \pi_{l} \mathcal{N}(\mathbf x | \pmb{\mu}_{l}, \pmb{\Sigma}_{l})}.} \end{array}\tag{3.115}
$$

The form of the Gaussian mixture distribution is governed by the parameters $\pi$ µ, and Σ, where we have used the notation $\pi \equiv \{\pi_{1},..., \pi_{K}\}, \mu \equiv \{\pmb{\mu}_{1},..., \pmb{\mu}_{K}\}$ and $\pmb{\Sigma} \equiv \{\pmb{\Sigma}_{1}, \ldots \pmb{\Sigma}_{K}\}$ . One way to set the values of these parameters is to use maximum likelihood. From (3.111), the log of the likelihood function is given by

$$
\ln p({\mathbf X} |{\boldsymbol \pi},{\boldsymbol \mu},{\boldsymbol \Sigma}) = \sum_{n = 1}^{N} \ln \left\{\sum_{k = 1}^{K} \pi_{k}{\mathcal N}({\mathbf x}_{n} |{\boldsymbol \mu}_{k},{\boldsymbol \Sigma}_{k}) \right\}\tag{3.116}
$$

where $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ . We immediately see that the situation is now much more complex than with a single Gaussian, due to the summation over k inside the logarithm. As a result, the maximum likelihood solution for the parameters no longer has a closed-form analytical solution. One approach for maximizing the likelihood function is to use iterative numerical optimization techniques. Alternatively, we can employ a powerful framework called expectation maximization, which has wide applicability to a variety of different deep generative models.

## 3.3. Periodic Variables

Although Gaussian distributions are of great practical significance, both in their own right and as building blocks for more complex probabilistic models, there are situations in which they are inappropriate as density models for continuous variables. One important case, which arises in practical applications, is that of periodic variables.

An example of a periodic variable is the wind direction at a particular geographical location. We might, for instance, measure the wind direction at multiple locations and wish to summarize this data using a parametric distribution. Another example is calendar time, where we may be interested in modelling quantities that are believed to be periodic over 24 hours or over an annual cycle. Such quantities can conveniently be represented using an angular (polar) coordinate $0 \leqslant \theta < 2 \pi$

We might be tempted to treat periodic variables by choosing some direction as the origin and then applying a conventional distribution such as the Gaussian. Such an approach, however, would give results that were strongly dependent on the arbitrary choice of origin. Suppose, for instance, that we have two observations at $\theta_{1} = 1^{\circ}$ and $\theta_{2} = 359^{\circ}$ , and we model them using a standard univariate Gaussian distribution. If we place the origin at $0^{\circ}$ , then the sample mean of this data set will be $180^{\circ}$ with standard deviation $179^{\circ}$ , whereas if we place the origin at $180^{\circ}$ , then the mean will be $0^{\circ}$ and the standard deviation will be $1^{\circ}$ . We clearly need to develop a special approach for periodic variables.

## 3.3.1 Von Mises distribution

Let us consider the problem of evaluating the mean of a set of observations $\mathcal{D} = \{\theta_{1},..., \theta_{N}\}$ of a periodic variable θ where θ is measured in radians. We have already seen that the simple average $(\theta_{1} + \cdot \cdot \cdot + \theta_{N}) / N$ will be strongly coordinate dependent. To find an invariant measure of the mean, note that the observations can be viewed as points on the unit circle and can therefore be described instead by two-dimensional unit vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ where $\left.\mathbf{x}_{n} \right.= 1$ for $n = 1, \ldots, N$ , as illustrated in Figure 3.9. We can average the vectors $\left\{{\bf x}_{n} \right\}$ instead to give

$$
\overline{{\mathbf{x}}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n}\tag{3.117}
$$

and then find the corresponding angle $\overline{{\theta}}$ of this average. Clearly, this definition will ensure that the location of the mean is independent of the origin of the angular coordinate. Note that x will typically lie inside the unit circle. The Cartesian coordinates

Figure 3.9 Illustration of the representation of values $\theta_{n}$ of a periodic variable as twodimensional vectors ${\bf x}_{n}$ living on the unit circle. Also shown is the average $\overline{{\bf x}}$ of those vectors.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d4532d2964f87ccc1de93dab1ab8000fced495c288312b5aebdd68b094a5ebee.jpg)

of the observations are given by ${\bf x}_{n} =(\cos \theta_{n}, \sin \theta_{n})$ , and we can write the Cartesian coordinates of the sample mean in the form $\mathbf{\overline{{x}}} =(\overline{{r}} \cos \overline{{\theta}}, \overline{{r}} \sin \overline{{\theta}})$ . Substituting into (3.117) and equating the $x_{1}$ and $x_{2}$ components then gives

$$
{\overline{{x}}}_{1} ={\overline{{r}}} \cos{\overline{{\theta}}} ={\frac{1}{N}} \sum_{n = 1}^{N} \cos \theta_{n}, \qquad{\overline{{x}}}_{2} ={\overline{{r}}} \sin{\overline{{\theta}}} ={\frac{1}{N}} \sum_{n = 1}^{N} \sin \theta_{n}.\tag{3.118}
$$

Taking the ratio, and using the identity tan $\theta =$ sin $\theta /$ cos $\theta,$ we can solve for $\overline{{\theta}}$ to give

$$
\overline{{\theta}} = \tan^{- 1} \left\{\frac{\sum_{n} \sin \theta_{n}}{\sum_{n} \cos \theta_{n}} \right\}.\tag{3.119}
$$

Shortly, we will see how this result arises naturally as a maximum likelihood estimator.

First, we need to define a periodic generalization of the Gaussian called the von Mises distribution. Here we will limit our attention to univariate distributions, although analogous periodic distributions can also be found over hyperspheres of arbitrary dimension (Mardia and Jupp, 2000).

By convention, we will consider distributions $p(\theta)$ that have period $2 \pi$ . Any probability density $p(\theta)$ defined over $\theta$ must not only be non-negative and integrate to one, but it must also be periodic. Thus, $p(\theta)$ must satisfy the three conditions:

$$
\begin{array}{rlr}{p(\theta)} &{{} \geqslant} &{0} \end{array}\tag{3.120}
$$

$$
\int_{0}^{2 \pi} p(\theta) d \theta = 1\tag{3.121}
$$

$$
\begin{array}{lcl}{{p(\theta + 2 \pi)}} &{{=}} &{{p(\theta).}} \end{array}\tag{3.122}
$$

From (3.122), it follows that $p(\theta + M2 \pi) = p(\theta)$ for any integer $M$

We can easily obtain a Gaussian-like distribution that satisfies these three properties as follows. Consider a Gaussian distribution over two variables ${\bf x} =(x_{1}, x_{2})$

Figure 3.10

The von Mises distribution can be derived by considering a two-dimensional Gaussian of the form (3.123), whose density contours are shown in blue, and conditioning on the unit circle shown in red.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/0fbfb93d6611aac7f9cdba3bbd25ad1dd42cbe5f241e145fece0708d0e9622ec.jpg)

having mean $\pmb{\mu} =(\mu_{1}, \mu_{2})$ and a covariance matrix $\pmb{\Sigma} = \sigma^{2} \mathbf{I}$ where I is the $2 \times 2$ identity matrix, so that

$$
p(x_{1}, x_{2}) = \frac{1}{2 \pi \sigma^{2}} \exp \left\{- \frac{(x_{1} - \mu_{1})^{2} +(x_{2} - \mu_{2})^{2}}{2 \sigma^{2}} \right\}.\tag{3.123}
$$

The contours of constant $p(\mathbf{x})$ are circles, as illustrated in Figure 3.10.

Now suppose we consider the value of this distribution along a circle of fixed radius. Then by construction, this distribution will be periodic, although it will not be normalized. We can determine the form of this distribution by transforming from Cartesian coordinates $(x_{1}, x_{2})$ to polar coordinates $(r, \theta)$ so that

$$
x_{1} = r \cos \theta, \qquad x_{2} = r \sin \theta.\tag{3.124}
$$

We also map the mean $\pmb{\mu}$ into polar coordinates by writing

$$
\mu_{1} = r_{0} \cos \theta_{0}, \qquad \mu_{2} = r_{0} \sin \theta_{0}.\tag{3.125}
$$

Next we substitute these transformations into the two-dimensional Gaussian distribution (3.123), and then condition on the unit circle $r = 1$ , noting that we are interested only in the dependence on θ. Focusing on the exponent in the Gaussian distribution we have

$$
\begin{array}{rlr}{{- \frac{1}{2 \sigma^{2}} \{(r \cos \theta - r_{0} \cos \theta_{0})^{2} +(r \sin \theta - r_{0} \sin \theta_{0})^{2}\}}} \\ &{=} &{- \frac{1}{2 \sigma^{2}} \{1 + r_{0}^{2} - 2r_{0} \cos \theta \cos \theta_{0} - 2r_{0} \sin \theta \sin \theta_{0}\}} \\ &{=} &{\frac{r_{0}}{\sigma^{2}} \cos(\theta - \theta_{0}) + \mathrm{const}} \end{array}\tag{3.126}
$$

where ‘const’ denotes terms independent of θ. We have made use of the following trigonometrical identities:

$$
\cos^{2} A + \sin^{2} A = 1\tag{3.127}
$$

$$
\cos A \cos B + \sin A \sin B = \cos(A - B).\tag{3.128}
$$

If we now define $m = r_{0} / \sigma^{2}$ , we obtain our final expression for the distribution of $p(\theta)$ along the unit circle $r = 1$ in the form

$$
p(\theta | \theta_{0}, m) = \frac{1}{2 \pi I_{0}(m)} \exp \left\{m \cos(\theta - \theta_{0}) \right\},\tag{3.129}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/fe341aec06dcfc4b4dde40c9a7dc4b7b19ba42b41bd4186cb1799c4b0ab8e48a.jpg)

![Figure 3.11](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1b83f83bcfe39d2f6d13d86e80e4eac102224ecad007d851f6cabdc260760735.jpg)  
Figure 3.11 The von Mises distribution plotted for two different parameter values, shown as a Cartesian plot on the left and as the corresponding polar plot on the right.

which is called the von Mises distribution or the circular normal. Here the parameter $\theta_{0}$ corresponds to the mean of the distribution, whereas m, which is known as the concentration parameter, is analogous to the inverse variance (i.e. the precision) for the Gaussian. The normalization coefficient in (3.129) is expressed in terms of $I_{0}(m)$ , which is the zeroth-order modified Bessel function of the first kind (Abramowitz and Stegun, 1965) and is defined by

$$
I_{0}(m) = \frac{1}{2 \pi} \int_{0}^{2 \pi} \exp \left\{m \cos \theta \right\} d \theta.\tag{3.130}
$$

For large $m,$ the distribution becomes approximately Gaussian. The von Mises distribution is plotted in Figure 3.11, and the function $I_{0}(m)$ is plotted in Figure 3.12.

Now consider the maximum likelihood estimators for the parameters $\theta_{0}$ and m for the von Mises distribution. The log likelihood function is given by

$$
\ln p(\mathcal{D} | \theta_{0}, m) = - N \ln(2 \pi) - N \ln I_{0}(m) + m \sum_{n = 1}^{N} \cos(\theta_{n} - \theta_{0}).\tag{3.131}
$$

Setting the derivative with respect to $\theta_{0}$ equal to zero gives

$$
\sum_{n = 1}^{N} \sin(\theta_{n} - \theta_{0}) = 0.\tag{3.132}
$$

To solve for $\theta_{0}$ , we make use of the trigonometric identity

$$
\sin(A - B) = \cos B \sin A - \cos A \sin B\tag{3.133}
$$

Exercise 3.32

from which we obtain

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/cf8abb7aeeced861a651026038c30fbdfe9ee2253bd44b80da7a1f52cd0725f7.jpg)

![Figure 3.12](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/6e48c5aee8f9d07c977c19679aaedc54abaa18d26d07bb943fc5355cfcae84fc.jpg)  
Figure 3.12 Plot of the Bessel function $I_{0}(m)$ defined by (3.130), together with the function $A(m)$ defined by (3.136).

$$
\theta_{0}^{\mathrm{ML}} = \tan^{- 1} \left\{\frac{\sum_{n} \sin \theta_{n}}{\sum_{n} \cos \theta_{n}} \right\},\tag{3.134}
$$

which we recognize as the result (3.119) obtained earlier for the mean of the observations viewed in a two-dimensional Cartesian space.

Similarly, maximizing (3.131) with respect to m and making use of $I_{0}^{\prime}(m) =$ $I_{1}(m)$ (Abramowitz and Stegun, 1965), we have

$$
A(m_{\mathrm{ML}}) = \frac{1}{N} \sum_{n = 1}^{N} \cos(\theta_{n} - \theta_{0}^{\mathrm{ML}})\tag{3.135}
$$

where we have substituted for the maximum likelihood solution for $\theta_{0}^{\mathrm{ML}}$ (recalling that we are performing a joint optimization over θ and m), and we have defined

$$
A(m) = \frac{I_{1}(m)}{I_{0}(m)}.\tag{3.136}
$$

The function $A(m)$ is plotted in Figure 3.12. Making use of the trigonometric identity (3.128), we can write (3.135) in the form

$$
A(m_{\mathrm{ML}}) = \left(\frac{1}{N} \sum_{n = 1}^{N} \cos \theta_{n} \right) \cos \theta_{0}^{\mathrm{ML}} + \left(\frac{1}{N} \sum_{n = 1}^{N} \sin \theta_{n} \right) \sin \theta_{0}^{\mathrm{ML}}.\tag{3.137}
$$

The right-hand side of (3.137) is easily evaluated, and the function $A(m)$ can be inverted numerically. One limitation of the von Mises distribution is that it is unimodal. By forming mixtures of von Mises distributions, we obtain a flexible framework for modelling periodic variables that can handle multimodality.

For completeness, we mention briefly some alternative techniques for constructing periodic distributions. The simplest approach is to use a histogram of observations in which the angular coordinate is divided into fixed bins. This has the virtue of simplicity and flexibility but also suffers from significant limitations, as we will see when we discuss histogram methods in more detail later. Another approach starts, like the von Mises distribution, from a Gaussian distribution over a Euclidean space but now marginalizes onto the unit circle rather than conditioning (Mardia and Jupp, 2000). However, this leads to more complex forms of distribution and will not be discussed further. Finally, any valid distribution over the real axis (such as a Gaussian) can be turned into a periodic distribution by mapping successive intervals of width $2 \pi$ onto the periodic variable (0, 2π), which corresponds to ‘wrapping’ the real axis around the unit circle. Again, the resulting distribution is more complex to handle than the von Mises distribution.

## 3.4. The Exponential Family

The probability distributions that we have studied so far in this chapter (with the exception of mixture models) are specific examples of a broad class of distributions called the exponential family (Duda and Hart, 1973; Bernardo and Smith, 1994). Members of the exponential family have many important properties in common, and it is illuminating to discuss these properties in some generality.

The exponential family of distributions over x, given parameters η, is defined to be the set of distributions of the form

$$
\begin{array}{r}{p(\mathbf{x} | \pmb{\eta}) = h(\mathbf{x}) g(\pmb{\eta}) \exp \left\{\pmb{\eta}^{\mathrm{T}} \mathbf{u}(\mathbf{x}) \right\}} \end{array}\tag{3.138}
$$

where x may be scalar or vector and may be discrete or continuous. Here η are called the natural parameters of the distribution, and $\mathbf{u}(\mathbf{x})$ is some function of x. The function $g(\pmb{\eta})$ can be interpreted as the coefficient that ensures that the distribution is normalized, and therefore, it satisfies

$$
g(\pmb{\eta}) \int h(\mathbf x) \exp \left\{\pmb{\eta}^{\mathrm{T}} \mathbf{u}(\mathbf x) \right\} \mathrm d \mathbf x = 1\tag{3.139}
$$

where the integration is replaced by summation if $\mathbf{x}$ is a discrete variable.

We begin by taking some examples of the distributions introduced earlier in the chapter and showing that they are indeed members of the exponential family. Consider first the Bernoulli distribution:

$$
p(x | \mu) = \mathrm{Bern}(x | \mu) = \mu^{x}(1 - \mu)^{1 - x}.\tag{3.140}
$$

Expressing the right-hand side as the exponential of the logarithm, we have

$$
\begin{array}{rcl}{{p(x | \mu)}} &{{=}} &{{\displaystyle \exp \left\{x \ln \mu +(1 - x) \ln(1 - \mu) \right\}}} \\{{}} &{{=}} &{{\displaystyle(1 - \mu) \exp \left\{\ln \left(\frac{\mu}{1 - \mu} \right) x \right\}.}} \end{array}\tag{3.141}
$$

Comparison with (3.138) allows us to identify

$$
\eta = \ln \left(\frac{\mu}{1 - \mu} \right)\tag{3.142}
$$

which we can solve for $\mu$ to give $\mu = \sigma(\eta)$ , where

$$
\sigma(\eta) = \frac{1}{1 + \exp(- \eta)}\tag{3.143}
$$

is called the logistic sigmoid function. Thus, we can write the Bernoulli distribution using the standard representation (3.138) in the form

$$
p(x | \eta) = \sigma(- \eta) \exp(\eta x)\tag{3.144}
$$

where we have used $1 - \sigma(\eta) = \sigma(- \eta)$ , which is easily proved from (3.143). Comparison with (3.138) shows that

$$
\begin{array}{rlr}{u(x)} &{{} =} &{x} \end{array}\tag{3.145}
$$

$$
\begin{array}{rlr}{h(x)} &{{} =} &{1} \end{array}\tag{3.146}
$$

$$
\begin{array}{rlr}{g(\eta)} &{{} =} &{\sigma(- \eta).} \end{array}\tag{3.147}
$$

Next consider the multinomial distribution which, for a single observation x, takes the form

$$
p(\mathbf x | \pmb \mu) = \prod_{k = 1}^{M} \mu_{k}^{x_{k}} = \exp \left\{\sum_{k = 1}^{M} x_{k} \ln \mu_{k} \right\}\tag{3.148}
$$

where $\mathbf{x} =(x_{1}, \hdots, x_{M})^{\mathrm{T}}$ . Again, we can write this in the standard representation (3.138) so that

$$
p(\mathbf{x} | \pmb{\eta}) = \exp(\pmb{\eta}^{\mathrm{T}} \mathbf{x})\tag{3.149}
$$

where $\eta_{k} = \ln \mu_{k}$ , and we have defined $\pmb{\eta} =(\eta_{1}, \dots, \eta_{M})^{\mathrm{T}}$ . Again, comparing with (3.138) we have

$$
\begin{array}{rlr}{{\bf u}({\bf x})} &{{} =} &{{\bf x}} \end{array}\tag{3.150}
$$

$$
h(\mathbf{x}) \quad = \quad 1\tag{3.151}
$$

$$
\begin{array}{rcl}{{g(\eta)}} &{{=}} &{{1.}} \end{array}\tag{3.152}
$$

Note that the parameters $\eta_{k}$ are not independent because the parameters $\mu_{k}$ are subject to the constraint

$$
\sum_{k = 1}^{M} \mu_{k} = 1\tag{3.153}
$$

so that, given any $M - 1$ of the parameters $\mu_{k}$ , the value of the remaining parameter is fixed. In some circumstances, it will be convenient to remove this constraint by expressing the distribution in terms of only $M - 1$ parameters. This can be achieved by using the relationship (3.153) to eliminate $\mu_{M}$ by expressing it in terms of the remaining $\{\mu_{k}\}$ where $k = 1, \ldots, M - 1$ , thereby leaving $M - 1$ parameters. Note that these remaining parameters are still subject to the constraints

$$
0 \leqslant \mu_{k} \leqslant 1, \qquad \sum_{k = 1}^{M - 1} \mu_{k} \leqslant 1.\tag{3.154}
$$

Making use of the constraint (3.153), the multinomial distribution in this representation then becomes

$$
\begin{array}{cl}{\displaystyle \exp \left\{\sum_{k = 1}^{M} x_{k} \ln \mu_{k} \right\}} \\{=} &{\displaystyle \exp \left\{\sum_{k = 1}^{M - 1} x_{k} \ln \mu_{k} + \left(1 - \sum_{k = 1}^{M - 1} x_{k} \right) \ln \left(1 - \sum_{k = 1}^{M - 1} \mu_{k} \right) \right\}} \\{=} &{\displaystyle \exp \left\{\sum_{k = 1}^{M - 1} x_{k} \ln \left(\frac{\mu_{k}}{1 - \sum_{j = 1}^{M - 1} \mu_{j}} \right) + \ln \left(1 - \sum_{k = 1}^{M - 1} \mu_{k} \right) \right\}.} \end{array}\tag{3.155}
$$

We now identify

$$
\ln \left(\frac{\mu_{k}}{1 - \sum_{j} \mu_{j}} \right) = \eta_{k},\tag{3.156}
$$

which we can solve for $\mu_{k}$ by first summing both sides over k and then rearranging and back-substituting to give

$$
\mu_{k} = \frac{\exp(\eta_{k})}{1 + \sum_{j} \exp(\eta_{j})}.\tag{3.157}
$$

This is called the softmax function or the normalized exponential. In this representation, the multinomial distribution therefore takes the form

$$
p(\mathbf x | \pmb \eta) = \left(1 + \sum_{k = 1}^{M - 1} \exp(\eta_{k}) \right)^{- 1} \exp(\pmb \eta^{\mathrm T} \mathbf x).\tag{3.158}
$$

This is the standard form of the exponential family, with parameter vector $\eta =$ $(\eta_{1}, \dots, \eta_{M - 1})^{\mathrm{T}}$ in which

$$
\begin{array}{rlr}{{\bf u}({\bf x})} &{{} =} &{{\bf x}} \end{array}\tag{3.159}
$$

$$
h(\mathbf{x}) \quad = \quad 1\tag{3.160}
$$

$$
\begin{array}{rcl}{g(\pmb{\eta})} &{=} &{\left(1 + \displaystyle \sum_{k = 1}^{M - 1} \exp(\eta_{k}) \right)^{- 1}.} \end{array}\tag{3.161}
$$

Finally, let us consider the Gaussian distribution. For the univariate Gaussian, we have

$$
\begin{array}{rcl}{p(x | \mu, \sigma^{2})} &{=} &{\displaystyle \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \exp \left.- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right.} \end{array}\tag{3.162}
$$

$$
\ = \ \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \exp \left\{- \frac{1}{2 \sigma^{2}} x^{2} + \frac{\mu}{\sigma^{2}} x - \frac{1}{2 \sigma^{2}} \mu^{2} \right\},\tag{3.163}
$$

Exercise 3.35

which, after some simple rearranging, can be cast in the standard exponential family form (3.138) with

$$
\begin{array}{llr}{\eta} &{=} &{\left(\begin{array}{c}{\mu / \sigma^{2}} \\{- 1 / 2 \sigma^{2}} \end{array} \right)} \end{array}\tag{3.164}
$$

$$
\begin{array}{ccc}{\mathbf{u}(x)} &{=} &{\left(\begin{array}{cc}{x} \\{x^{2}} \end{array} \right)} \end{array}\tag{3.165}
$$

$$
\begin{array}{lll}{{h({\bf x})}} &{{=}} &{{(2 \pi)^{- 1 / 2}}} \end{array}\tag{3.166}
$$

$$
g(\pmb{\eta}) =(- 2 \eta_{2})^{1 / 2} \exp \left(\frac{\eta_{1}^{2}}{4 \eta_{2}} \right).\tag{3.167}
$$

Finally, we shall sometimes make use of a restricted form of (3.138) in which we choose $\mathbf{u}(\mathbf{x}) = \mathbf{x}$ . However, this can be somewhat generalized by noting that if $f(\mathbf{x})$ is a normalized density then

$$
{\frac{1}{s}} f \left({\frac{1}{s}} \mathbf{x} \right)\tag{3.168}
$$

is also a normalized density, where $s > 0$ is a scale parameter. Combining these, we arrive at a restricted set of exponential family class-conditional densities of the form

$$
p(\mathbf{x} | \mathbf{\lambda}_{k}, s) = \frac{1}{s} h \left(\frac{1}{s} \mathbf{x} \right) g(\lambda_{k}) \exp \left\{\frac{1}{s} \mathbf{\lambda}_{k}^{\mathrm{T}} \mathbf{x} \right\}.\tag{3.169}
$$

Note that we are allowing each class to have its own parameter vector $\lambda_{k}$ but we are assuming that the classes share the same scale parameter s.

## 3.4.1 Sufficient statistics

Let us now consider the problem of estimating the parameter vector η in the general exponential family distribution (3.138) using the technique of maximum likelihood. Taking the gradient of both sides of (3.139) with respect to $\eta_{\mathrm{:}}$ we have

$$
\begin{array}{l}{{\displaystyle \nabla g({\boldsymbol \eta}) \int h({\bf x}) \exp \{{\boldsymbol \eta}^{\mathrm{T}}{\bf u}({\bf x})\} \ d{\bf x}} \ ~} \\{{\displaystyle + g({\boldsymbol \eta}) \int h({\bf x}) \exp \{{\boldsymbol \eta}^{\mathrm{T}}{\bf u}({\bf x})\}{\bf u}({\bf x}) d{\bf x} = 0}.} \end{array}\tag{3.170}
$$

Rearranging and making use again of (3.139) then gives

$$
- \frac{1}{g(\eta)} \nabla g(\eta) = g(\eta) \int h(\mathbf{x}) \exp \left\{\eta^{\mathrm{T}} \mathbf{u}(\mathbf{x}) \right\} \mathbf{u}(\mathbf{x}) d \mathbf{x} = \mathbb{E}[\mathbf{u}(\mathbf{x})].\tag{3.171}
$$

We therefore obtain the result

$$
- \nabla \ln g(\pmb{\eta}) = \mathbb{E}[\mathbf{u}(\mathbf{x})].\tag{3.172}
$$

Note that the covariance of $\mathbf{u}(\mathbf{x})$ can be expressed in terms of the second derivatives of $g(\pmb{\eta})$ , and similarly for higher-order moments. Thus, provided we can normalize a distribution from the exponential family, we can always find its moments by simple differentiation.

Now consider a set of independent identically distributed data denoted by $\mathbf{X} =$ $\left\{\mathbf{x}_{1}, \ldots, \mathbf{x}_{n} \right\}$ , for which the likelihood function is given by

$$
p(\mathbf{X} | \boldsymbol{\eta}) = \left(\prod_{n = 1}^{N} h(\mathbf{x}_{n}) \right) g(\boldsymbol{\eta})^{N} \exp \left\{\boldsymbol{\eta}^{\mathrm{T}} \sum_{n = 1}^{N} \mathbf{u}(\mathbf{x}_{n}) \right\}.\tag{3.173}
$$

Setting the gradient of ln $p(\mathbf{X} | \eta)$ with respect to η to zero, we get the following condition to be satisfied by the maximum likelihood estimator $\pmb{\eta}_{\mathrm{ML}}$

$$
- \nabla \ln g(\pmb{\eta}_{\mathrm{ML}}) = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{u}(\mathbf{x}_{n}),\tag{3.174}
$$

which can in principle be solved to obtain $\eta_{\mathrm{ML}}$ We see that the solution for the maximum likelihood estimator depends on the data only through $\textstyle \sum_{n} \mathbf{u}(\mathbf{x}_{n})$ , which is therefore called the sufficient statistic of the distribution (3.138). We do not need to store the entire data set itself but only the value of the sufficient statistic. For the Bernoulli distribution, for example, the function $\mathbf{u}(x)$ is given just by x and so we need only keep the sum of the data points $\{x_{n}\}$ , whereas for the Gaussian ${\mathbf u}(x) =(x, x^{2})^{\dot{\mathrm{T}}}$ , and so we should keep both the sum of $\{x_{n}\}$ and the sum of $\{x_{n}^{2}\}$

If we consider the limit $N \infty$ , then the right-hand side of (3.174) becomes $\mathbb{E}[{\bf u}({\bf x})]$ , and so by comparing with (3.172) we see that in this limit, $\pmb{\eta}_{\mathrm{ML}}$ will equal the true value η.

## 3.5. Nonparametric Methods

Throughout this chapter, we have focused on the use of probability distributions having specific functional forms governed by a small number of parameters whose values are to be determined from a data set. This is called the parametric approach to density modelling. An important limitation of this approach is that the chosen density might be a poor model of the distribution that generates the data, which can result in poor predictive performance. For instance, if the process that generates the data is multimodal, then this aspect of the distribution can never be captured by a Gaussian, which is necessarily unimodal. In this final section, we consider some nonparametric approaches to density estimation that make few assumptions about the form of the distribution.

## 3.5.1 Histograms

Let us start with a discussion of histogram methods for density estimation, which we have already encountered in the context of marginal and conditional distributions in Figure 2.5 and in the context of the central limit theorem in Figure 3.2. Here we explore the properties of histogram density models in more detail, focusing on cases with a single continuous variable x. Standard histograms simply partition x into distinct bins of width $\Delta_{i}$ and then count the number $n_{i}$ of observations of x falling in bin i. To turn this count into a normalized probability density, we simply divide by the total number N of observations and by the width $\Delta_{i}$ of the bins to obtain probability values for each bin:

An illustration of the histogram approach to density estimation, in which a data set of 50 data points is generated from the distribution shown by the green curve. Histogram density estimates, based on (3.175) with a common bin width ∆, are shown for various values of $\Delta$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/3e24e22368ab5b67d0decfa5b19dab19d084986859efe9d5fbc5bba8f157571b.jpg)

$$
p_{i} = \frac{n_{i}}{N \Delta_{i}}\tag{3.175}
$$

for which it is easily seen that $\textstyle \int p(x) d x = 1$ . This gives a model for the density $p(x)$ that is constant over the width of each bin. Often the bins are chosen to have the same width $\Delta_{i} = \Delta$

In Figure 3.13, we show an example of histogram density estimation. Here the data is drawn from the distribution corresponding to the green curve, which is formed from a mixture of two Gaussians. Also shown are three examples of histogram density estimates corresponding to three different choices for the bin width $\Delta$ . We see that when $\Delta$ is very small (top figure), the resulting density model is very spiky, with a lot of structure that is not present in the underlying distribution that generated the data set. Conversely, if $\Delta$ is too large (bottom figure) then the result is a model that is too smooth and consequently fails to capture the bimodal property of the green curve. The best results are obtained for some intermediate value of $\Delta$ (middle figure). In principle, a histogram density model is also dependent on the choice of edge location for the bins, though this is typically much less significant than the bin width $\Delta$

Note that the histogram method has the property (unlike the methods to be discussed shortly) that, once the histogram has been computed, the data set itself can be discarded, which can be advantageous if the data set is large. Also, the histogram approach is easily applied if the data points arrive sequentially.

In practice, the histogram technique can be useful for obtaining a quick visualization of data in one or two dimensions but is unsuited to most density estimation applications. One obvious problem is that the estimated density has discontinuities that are due to the bin edges rather than any property of the underlying distribution that generated the data. A major limitation of the histogram approach is its scaling with dimensionality. If we divide each variable in a D-dimensional space into

M bins, then the total number of bins will be $M^{D}$ . This exponential scaling with D is an example of the curse of dimensionality. In a space of high dimensionality, the quantity of data needed to provide meaningful estimates of the local probability density would be prohibitive.

The histogram approach to density estimation does, however, teach us two important lessons. First, to estimate the probability density at a particular location, we should consider the data points that lie within some local neighbourhood of that point. Note that the concept of locality requires that we assume some form of distance measure, and here we have been assuming Euclidean distance. For histograms, this neighbourhood property was defined by the bins, and there is a natural ‘smoothing’ parameter describing the spatial extent of the local region, in this case the bin width. Second, to obtain good results, the value of the smoothing parameter should be neither too large nor too small. This is reminiscent of the choice of model complexity in polynomial regression where the degree M of the polynomial, or alternatively the value λ of the regularization parameter, was optimal for some intermediate value, neither too large nor too small. Armed with these insights, we turn now to a discussion of two widely used nonparametric techniques for density estimation, kernel estimators and nearest neighbours, which have better scaling with dimensionality than the simple histogram model.

## 3.5.2 Kernel densities

Let us suppose that observations are being drawn from some unknown probability density $p(\mathbf{x})$ in some D-dimensional space, which we will take to be Euclidean, and we wish to estimate the value of $p(\mathbf{x})$ . From our earlier discussion of locality, let us consider some small region  containing x. The probability mass associated with this region is given by

$$
P = \int_{\mathcal R} p(\mathbf x) \mathrm d \mathbf x.\tag{3.176}
$$

Now suppose that we have collected a data set comprising N observations drawn from $p(\mathbf{x})$ . Because each data point has a probability $\bar{P}$ of falling within , the total number K of points that lie inside  will be distributed according to the binomial distribution:

$$
\mathrm{Bin}(K | N, P) = \frac{N !}{K !(N - K) !} P^{K}(1 - P)^{N - K}.\tag{3.177}
$$

Using (3.11), we see that the mean fraction of points falling inside the region is $\mathbb{E}[K / N] = P$ , and similarly using (3.12), we see that the variance around this mean is var $[\dot{K} / N] = P(1 - P) / N$ . For large N , this distribution will be sharply peaked around the mean and so

$$
K \simeq NP.\tag{3.178}
$$

If, however, we also assume that the region $\mathcal{R}$ is sufficiently small so that the probability density $p(\mathbf{x})$ is roughly constant over the region, then we have

$$
P \simeq p(\mathbf{x}) V\tag{3.179}
$$

where $V$ is the volume of $\mathcal{R}$ . Combining (3.178) and (3.179), we obtain our density estimate in the form

$$
p(\mathbf{x}) = \frac{K}{NV}.\tag{3.180}
$$

Note that the validity of (3.180) depends on two contradictory assumptions, namely that the region is sufficiently small that the density is approximately constant over the region and yet sufficiently large (in relation to the value of that density) that the number $K$ of points falling inside the region is sufficient for the binomial distribution to be sharply peaked.

We can exploit the result (3.180) in two different ways. Either we can fix K and determine the value of V from the data, which gives rise to the K-nearest-neighbour technique discussed shortly, or we can fix $V$ and determine K from the data, giving rise to the kernel approach. It can be shown that both the K-nearest-neighbour density estimator and the kernel density estimator converge to the true probability density in the limit $N \to \infty$ provided that V shrinks with $\bar{N}$ and that K grows with $N_{\ast}$ , at an appropriate rate (Duda and Hart, 1973).

We begin by discussing the kernel method in detail. To start with we take the region $\mathcal{R}$ to be a small hypercube centred on the point x at which we wish to determine the probability density. To count the number $K$ of points falling within this region, it is convenient to define the following function:

$$
k(\mathbf{u}) = \left\{\begin{array}{ll}{1,} &{| u_{i} | \leqslant 1 / 2, \qquad i = 1, \ldots, D,} \\{0,} &{\mathrm{otherwise,}} \end{array} \right.\tag{3.181}
$$

which represents a unit cube centred on the origin. The function $k(\mathbf{u})$ is an example of a kernel function, and in this context, it is also called a Parzen window. From (3.181), the quantity $k((\mathbf{x} - \mathbf{x}_{n}) / h)$ will be 1 if the data point ${\bf x}_{n}$ lies inside a cube of side h centred on x, and zero otherwise. The total number of data points lying inside this cube will therefore be

$$
K = \sum_{n = 1}^{N} k \left({\frac{\mathbf{x} - \mathbf{x}_{n}}{h}} \right).\tag{3.182}
$$

Substituting this expression into (3.180) then gives the following result for the estimated density at x:

$$
p(\mathbf{x}) = \frac{1}{N} \sum_{n = 1}^{N} \frac{1}{h^{D}} k \left(\frac{\mathbf{x} - \mathbf{x}_{n}}{h} \right)\tag{3.183}
$$

where we have used $V \ : = \ : h^{D}$ for the volume of a hypercube of side h in D dimensions. Using the symmetry of the function $k(\mathbf{u})$ , we can now reinterpret this equation, not as a single cube centred on x but as the sum over N cubes centred on the N data points $\mathbf{x}_{n}.$

As it stands, the kernel density estimator (3.183) will suffer from one of the same problems that the histogram method suffered from, namely the presence of artificial discontinuities, in this case at the boundaries of the cubes. We can obtain a smoother

Illustration of the kernel density model (3.184) applied to the same data set used to demonstrate the histogram approach in Figure 3.13. We see that h acts as a smoothing parameter and that if it is set too small (top panel), the result is a very noisy density model, whereas if it is set too large (bottom panel), then the bimodal nature of the underlying distribution from which the data is generated (shown by the green curve) is washed out. The best density model is obtained for some intermediate value of h (middle panel).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/fb782559e7b02fa27c3f9ea5a799710b0c023bc2a85621b20edf5a4422b28a06.jpg)

density model if we choose a smoother kernel function, and a common choice is the Gaussian, which gives rise to the following kernel density model:

$$
p(\mathbf{x}) = \frac{1}{N} \sum_{n = 1}^{N} \frac{1}{(2 \pi h^{2})^{D / 2}} \exp \left\{- \frac{\| \mathbf{x} - \mathbf{x}_{n} \|^{2}}{2h^{2}} \right\}\tag{3.184}
$$

where h represents the standard deviation of the Gaussian components. Thus, our density model is obtained by placing a Gaussian over each data point, adding up the contributions over the whole data set, and then dividing by N so that the density is correctly normalized. In Figure 3.14, we apply the model (3.184) to the data set used earlier to demonstrate the histogram technique. We see that, as expected, the parameter h plays the role of a smoothing parameter, and there is a trade-off between sensitivity to noise at small h and over-smoothing at large h. Again, the optimization of h is a problem in model complexity, analogous to the choice of bin width in histogram density estimation or the degree of the polynomial used in curve fitting.

We can choose any other kernel function $k({\mathbf{u}})$ in (3.183) subject to the conditions

$$
k({\mathbf{u}}) \quad \geqslant \quad 0,\tag{3.185}
$$

$$
\begin{array}{r}{\int k(\mathbf{u}) d \mathbf{u} = 1,} \end{array}\tag{3.186}
$$

which ensure that the resulting probability distribution is non-negative everywhere and integrates to one. The class of density model given by (3.183) is called a kernel density estimator or Parzen estimator. It has a great merit that there is no computation involved in the ‘training’ phase because this simply requires the training set to be stored. However, this is also one of its great weaknesses because the computational cost of evaluating the density grows linearly with the size of the data set.

Figure 3.15

Illustration of K-nearestneighbour density estimation using the same data set as in Figures 3.14 and 3.13. We see that the parameter K governs the degree of smoothing, so that a small value of K leads to a very noisy density model (top panel), whereas a large value (bottom panel) smooths out the bimodal nature of the true distribution (shown by the green curve) from which the data set was generated.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/bd22221ec82e99c19a7f19ac774f08318511f3da48c201a3a4c284887456c0b9.jpg)

## 3.5.3 Nearest-neighbours

One of the difficulties with the kernel approach to density estimation is that the parameter h governing the kernel width is fixed for all kernels. In regions of high data density, a large value of h may lead to over-smoothing and a washing out of structure that might otherwise be extracted from the data. However, reducing h may lead to noisy estimates elsewhere in the data space where the density is smaller. Thus, the optimal choice for h may be dependent on the location within the data space. This issue is addressed by nearest-neighbour methods for density estimation.

We therefore return to our general result (3.180) for local density estimation, and instead of fixing V and determining the value of K from the data, we consider a fixed value of K and use the data to find an appropriate value for $V.$ To do this, we consider a small sphere centred on the point x at which we wish to estimate the density $p(\mathbf{x})$ , and we allow the radius of the sphere to grow until it contains precisely K data points. The estimate of the density $p(\mathbf{x})$ is then given by (3.180) with V set to the volume of the resulting sphere. This technique is known as K nearest neighbours and is illustrated in Figure 3.15 for various choices of the parameter K using the same data set as used in Figures 3.13 and 3.14. We see that the value of K now governs the degree of smoothing and that again there is an optimum choice for K that is neither too large nor too small. Note that the model produced by K nearest neighbours is not a true density model because the integral over all space diverges.

We close this chapter by showing how the K-nearest-neighbour technique for density estimation can be extended to the problem of classification. To do this, we apply the K-nearest-neighbour density estimation technique to each class separately and then make use of Bayes’ theorem. Let us suppose that we have a data set comprising $N_{k}$ points in class $\mathcal{C}_{k}$ with N points in total, so that $\textstyle \sum_{k} N_{k} = N$ . If we wish to classify a new point $\mathbf{x},$ we draw a sphere centred on x containing precisely K points irrespective of their class. Suppose this sphere has volume V and contains $K_{k}$ points from class $\mathcal{C}_{k}$ . Then (3.180) provides an estimate of the density associated

Figure 3.16 (a) In the K-nearestneighbour classifier, a new point, shown by the black diamond, is classified according to the majority class membership of the K closest training data points, in this case $K =$ $\quad 3.\quad(6)$ In the nearest-neighbour $(K = 1)$ ) approach to classification, the resulting decision boundary is composed of hyperplanes that form perpendicular bisectors of pairs of points from different classes.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/976a5fdead004b94c4fb6cfb3751bc47da5953cc28d773630dfd85742953eca0.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d52e90ed084b2378d402db8a22152b59cd6355bf0c0453c10c43bbffff120580.jpg)  
(b)

with each class:

$$
p(\mathbf{x} | \mathcal{C}_{k}) = \frac{K_{k}}{N_{k} V}.\tag{3.187}
$$

Similarly, the unconditional density is given by

$$
p(\mathbf{x}) = \frac{K}{NV}\tag{3.188}
$$

and the class priors are given by

$$
p(\mathcal{C}_{k}) = \frac{N_{k}}{N}.\tag{3.189}
$$

We can now combine (3.187), (3.188), and (3.189) using Bayes’ theorem to obtain the posterior probability of class membership:

$$
p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{p(\mathbf{x})} = \frac{K_{k}}{K}.\tag{3.190}
$$

We can minimize the probability of misclassification by assigning the test point x to the class having the largest posterior probability, corresponding to the largest value of $K_{k} / K$ . Thus, to classify a new point, we identify the K nearest points from the training data set and then assign the new point to the class having the largest number of representatives amongst this set. Ties can be broken at random. The particular case of $K = 1$ is called the nearest-neighbour rule, because a test point is simply assigned to the same class as the nearest point from the training set. These concepts are illustrated in Figure 3.16.

An interesting property of the nearest-neighbour $(K = 1)$ classifier is that, in the limit $N \to \infty$ , the error rate is never more than twice the minimum achievable error rate of an optimal classifier, i.e., one that uses the true class distributions (Cover and Hart, 1967) .

As discussed so far, both the K-nearest-neighbour method and the kernel density estimator require the entire training data set to be stored, leading to expensive computation if the data set is large. This effect can be offset, at the expense of some additional one-off computation, by constructing tree-based search structures to allow (approximate) near neighbours to be found efficiently without doing an exhaustive search of the data set. Nevertheless, these nonparametric methods are still severely limited. On the other hand, we have seen that simple parametric models are very restricted in terms of the forms of distribution that they can represent. We therefore need to find density models that are very flexible and yet for which the complexity of the models can be controlled independently of the size of the training set, and this can be achieved using deep neural networks.

## Exercises

3.1 (?) Verify that the Bernoulli distribution (3.2) satisfies the following properties:

$$
\sum_{x = 0}^{1} p(x | \mu) = 1\tag{3.191}
$$

$$
\mathbb{E}[x] \quad = \quad \mu\tag{3.192}
$$

$$
\begin{array}{r}{\operatorname{var}[x]{} ~ ={} ~ \mu(1 - \mu).} \end{array}\tag{3.193}
$$

Show that the entropy H[x] of a Bernoulli-distributed random binary variable x is given by

$$
\mathrm{H}[x] = - \mu \ln \mu -(1 - \mu) \ln(1 - \mu).\tag{3.194}
$$

3.2 (? ?) The form of the Bernoulli distribution given by (3.2) is not symmetric between the two values of x. In some situations, it will be more convenient to use an equivalent formulation for which $x \in \{- 1, 1\}$ , in which case the distribution can be written

$$
p(x | \mu) = \left(\frac{1 - \mu}{2} \right)^{(1 - x) / 2} \left(\frac{1 + \mu}{2} \right)^{(1 + x) / 2}\tag{3.195}
$$

where $\mu \in[- 1, 1]$ . Show that the distribution (3.195) is normalized, and evaluate its mean, variance, and entropy.

3.3 (? ?) In this exercise, we prove that the binomial distribution (3.9) is normalized. First, use the definition (3.10) of the number of combinations of m identical objects chosen from a total of N to show that

$$
{\binom{N}{m}} +{\binom{N}{m - 1}} ={\binom{N + 1}{m}}.\tag{3.196}
$$

Use this result to prove by induction the following result:

$$
(1 + x)^{N} = \sum_{m = 0}^{N}{\binom{N}{m}} x^{m},\tag{3.197}
$$

which is known as the binomial theorem and which is valid for all real values of $x.$ Finally, show that the binomial distribution is normalized, so that

$$
\sum_{m = 0}^{N} \binom{N}{m} \mu^{m}(1 - \mu)^{N - m} = 1,\tag{3.198}
$$

which can be done by first pulling a factor $(1 - \mu)^{N}$ out of the summation and then making use of the binomial theorem.

3.4 (? ?) Show that the mean of the binomial distribution is given by (3.11). To do this, differentiate both sides of the normalization condition (3.198) with respect to $\mu$ and then rearrange to obtain an expression for the mean of $n.$ . Similarly, by differentiating (3.198) twice with respect to $\mu$ and making use of the result (3.11) for the mean of the binomial distribution, prove the result (3.12) for the variance of the binomial.

3.5 (?) Show that the mode of the multivariate Gaussian (3.26) is given by $\pmb{\mu}.$

3.6 (? ?) Suppose that x has a Gaussian distribution with mean $\pmb{\mu}$ and covariance $\pmb{\Sigma}.$ Show that the linearly transformed variable Ax + b is also Gaussian, and find its mean and covariance.

3.7 (★★★) Show that the Kullback–Leibler divergence between two Gaussian distributions $q(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \pmb{\mu}_{q}, \pmb{\Sigma}_{q})$ and $p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \pmb{\mu}_{p}, \pmb{\Sigma}_{p})$ is given by

$$
\begin{array}{l}{\displaystyle \mathrm{KL} \left(q(\mathbf{x}) \| p(\mathbf{x}) \right)} \\{\displaystyle = \frac{1}{2} \left\{\ln \frac{| \Sigma_{p} |}{| \Sigma_{q} |} - D + \mathrm{Tr} \left(\Sigma_{p}^{- 1} \Sigma_{q} \right) +(\mu_{p} - \mu_{q})^{\mathrm{T}} \Sigma_{p}^{- 1}(\mu_{p} - \mu_{q}) \right\}} \end{array}\tag{3.199}
$$

where $\operatorname{Tr}(\cdot)$ denotes the trace of a matrix, and $D$ is the dimensionality of $\mathbf{x}$

3.8 (? ?) This exercise demonstrates that the multivariate distribution with maximum entropy, for a given covariance, is a Gaussian. The entropy of a distribution $p(\mathbf{x})$ is given by

$$
\mathrm{H}[\mathbf{x}] = - \int p(\mathbf{x}) \ln p(\mathbf{x}) d \mathbf{x}.\tag{3.200}
$$

We wish to maximize $\mathrm{H}[\mathbf{x}]$ over all distributions $p(\mathbf{x})$ subject to the constraints that $p(\mathbf{x})$ is normalized and that it has a specific mean and covariance, so that

$$
\int p(\mathbf{x}) d \mathbf{x} = 1\tag{3.201}
$$

$$
\int p(\mathbf{x}) \mathbf{x} d \mathbf{x} = \pmb{\mu}\tag{3.202}
$$

$$
\int p(\mathbf{x})(\mathbf{x} -{\pmb \mu})(\mathbf{x} -{\pmb \mu})^{\mathrm{T}} d \mathbf{x} = \pmb{\Sigma}.\tag{3.203}
$$

By performing a variational maximization of (3.200) and using Lagrange multipliers to enforce the constraints (3.201), (3.202), and (3.203), show that the maximum likelihood distribution is given by the Gaussian (3.26).

3.9 $({\star \star \star \star})$ Show that the entropy of the multivariate Gaussian $\mathcal{N}({\bf x} | \mu, \Sigma)$ is given by

$$
\mathrm{H}[\mathbf{x}] = \frac{1}{2} \ln \left| \pmb{\Sigma} \right| + \frac{D}{2} \left(1 + \ln(2 \pi) \right)\tag{3.204}
$$

where D is the dimensionality of $\mathbf{x}.$

3.10 $({\star \star \star \star})$ Consider two random variables $x_{1}$ and $x_{2}$ having Gaussian distributions with means $\mu_{1}$ and $\mu_{2}$ and precisions $\tau_{1}$ and $\tau_{2}$ , respectively. Derive an expression for the differential entropy of the variable $x = x_{1} + x_{2}$ . To do this, first find the distribution of x by using the relation

$$
p(x) = \int_{- \infty}^{\infty} p(x | x_{2}) p(x_{2}) d x_{2}\tag{3.205}
$$

and completing the square in the exponent. Then observe that this represents the convolution of two Gaussian distributions, which itself will be Gaussian, and finally make use of the result (2.99) for the entropy of the univariate Gaussian.

3.11 (?) Consider the multivariate Gaussian distribution given by (3.26). By writing the precision matrix (inverse covariance matrix) as the sum of a symmetric and an antisymmetric matrix, show that the antisymmetric term does not appear in the exponent of the Gaussian, and hence, that the precision matrix may be taken to be symmetric without loss of generality. Because the inverse of a symmetric matrix is also symmetric (see Exercise 3.16), it follows that the covariance matrix may also be chosen to be symmetric without loss of generality.

3.12 (★★★) Consider a real, symmetric matrix Σ whose eigenvalue equation is given by (3.28). By taking the complex conjugate of this equation, subtracting the original equation, and then forming the inner product with eigenvector ${\bf{u}}_{i}.$ , show that the eigenvalues $\lambda_{i}$ are real. Similarly, use the symmetry property of Σ to show that two eigenvectors $\mathbf{u}_{i}$ and $\mathbf{u}_{j}$ will be orthogonal provided $\lambda_{j} \ne \lambda_{i}$ . Finally, show that, without loss of generality, the set of eigenvectors can be chosen to be orthonormal, so that they satisfy (3.29), even if some of the eigenvalues are zero.

3.13 (? ?) Show that a real, symmetric matrix Σ having the eigenvector equation (3.28) can be expressed as an expansion in the eigenvectors, with coefficients given by the eigenvalues, of the form (3.31). Similarly, show that the inverse matrix $\pmb{\Sigma}^{- 1}$ has a representation of the form (3.32).

3.14 (? ?) A positive definite matrix Σ can be defined as one for which the quadratic form

$$
\mathbf{a}^{\mathrm{T}} \mathbf{\mathbf{\mathbf{\rho}}} \mathbf{\Sigma} \mathbf{a}\tag{3.206}
$$

is positive for any real value of the vector a. Show that a necessary and sufficient condition for Σ to be positive definite is that all the eigenvalues $\lambda_{i}$ of Σ, defined by (3.28), are positive.

3.15 (?) Show that a real, symmetric matrix of size $D \times D$ has $D(D + 1) / 2$ independent parameters.

3.16 (?) Show that the inverse of a symmetric matrix is itself symmetric.

3.17 (? ?) By diagonalizing the coordinate system using the eigenvector expansion (3.31), show that the volume contained within the hyperellipsoid corresponding to a constant Mahalanobis distance $\Delta$ is given by

$$
V_{D} | \boldsymbol{\Sigma} |^{1 / 2} \boldsymbol{\Delta}^{D}\tag{3.207}
$$

where $V_{D}$ is the volume of the unit sphere in D dimensions, and the Mahalanobis distance is defined by (3.27).

3.18 (? ?) Prove the identity (3.60) by multiplying both sides by the matrix

$$
\left(\begin{array}{cc}{\mathbf{A}} &{\mathbf{B}} \\{\mathbf{C}} &{\mathbf{D}} \end{array} \right)\tag{3.208}
$$

and making use of the definition (3.61).

3.19 (★★★) In Sections 3.2.4 and 3.2.5, we considered the conditional and marginal distributions for a multivariate Gaussian. More generally, we can consider a partitioning of the components of x into three groups $\mathbf{x}_{a}, \mathbf{x}_{b}.$ , and $\mathbf{x}_{c},$ , with a corresponding partitioning of the mean vector $\pmb{\mu}$ and of the covariance matrix Σ in the form

$$
\begin{array}{r}{\pmb{\mu} =(\pmb{\mu}_{a}), \qquad \pmb{\Sigma} =(\pmb{\Sigma}_{ba} \quad \pmb{\Sigma}_{ab} \quad \pmb{\Sigma}_{ac})} \\{\pmb{\mu}_{c}),} \end{array},\tag{3.209}
$$

By making use of the results of Section 3.2, find an expression for the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ in which $\mathbf{x}_{c}$ has been marginalized out.

(? ?) A very useful result from linear algebra is the Woodbury matrix inversion formula given by

$$
(\mathbf{A} + \mathbf{BCD})^{- 1} = \mathbf{A}^{- 1} - \mathbf{A}^{- 1} \mathbf{B}(\mathbf{C}^{- 1} + \mathbf{DA}^{- 1} \mathbf{B})^{- 1} \mathbf{DA}^{- 1}.\tag{3.210}
$$

By multiplying both sides by $\left(\mathbf{A} + \mathbf{B} \mathbf{CD} \right)$ , prove the correctness of this result.

3.21 (?) Let x and z be two independent random vectors, so that $p(\mathbf{x}, \mathbf{z}) = p(\mathbf{x}) p(\mathbf{z})$ Show that the mean of their sum $\mathbf{y} = \mathbf{x} + \mathbf{z}$ is given by the sum of the means of each of the variables separately. Similarly, show that the covariance matrix of y is given by the sum of the covariance matrices of x and z.

3.22 (★★★) Consider a joint distribution over the variable

$$
\mathbf{z} ={\binom{\mathbf{x}}{\mathbf{y}}}\tag{3.211}
$$

whose mean and covariance are given by (3.92) and (3.89), respectively. By making use of the results (3.76) and (3.77), show that the marginal distribution $p(\mathbf{x})$ is given by (3.83). Similarly, by making use of the results (3.65) and (3.66), show that the conditional distribution $p(\mathbf{y} \vert \mathbf{x})$ is given by (3.84).

3.23 (? ?) Using the partitioned matrix inversion formula (3.60), show that the inverse of the precision matrix (3.88) is given by the covariance matrix (3.89).

3.24 (? ?) By starting from (3.91) and making use of the result (3.89), verify the result (3.92).

3.25 (? ?) Consider two multi-dimensional random vectors x and z having Gaussian distributions $p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \pmb{\mu_{\mathbf{x}}}, \pmb{\Sigma_{\mathbf{x}}})$ and $p(\mathbf{z}) = \mathcal{N}(\mathbf{z} | \boldsymbol{\mu}_{\mathbf{z}}, \Sigma_{\mathbf{z}})$ , respectively, together with their sum ${\bf y} ={\bf x} +{\bf z}.$ . By considering the linear-Gaussian model comprising the product of the marginal distribution $p(\mathbf{x})$ and the conditional distribution $p(\mathbf{y} \vert \mathbf{x})$ and making use of the results (3.93) and (3.94), show that the marginal distribution of $p(\mathbf{y})$ is given by

$$
p(\mathbf{y}) = \mathcal{N}(\mathbf{y} | \pmb{\mu_{x}} + \pmb{\mu_{z}}, \pmb{\Sigma_{x}} + \pmb{\Sigma_{z}}).\tag{3.212}
$$

3.26 (★★★) This exercise and the next provide practice at manipulating the quadratic forms that arise in linear-Gaussian models, and they also serve as an independent check of results derived in the main text. Consider a joint distribution $p(\mathbf{x}, \mathbf{y})$ defined by the marginal and conditional distributions given by (3.83) and (3.84). By examining the quadratic form in the exponent of the joint distribution and using the technique of ‘completing the square’ discussed in Section 3.2, find expressions for the mean and covariance of the marginal distribution $p(\mathbf{y})$ in which the variable x has been integrated out. To do this, make use of the Woodbury matrix inversion formula (3.210). Verify that these results agree with (3.93) and (3.94).

3.27 (★★★) Consider the same joint distribution as in Exercise 3.26, but now use the technique of completing the square to find expressions for the mean and covariance of the conditional distribution $p(\mathbf{x} | \mathbf{y})$ . Again, verify that these agree with the corresponding expressions (3.95) and (3.96).

3.28 (? ?) To find the maximum likelihood solution for the covariance matrix of a multivariate Gaussian, we need to maximize the log likelihood function (3.102) with respect to Σ, noting that the covariance matrix must be symmetric and positive definite. Here we proceed by ignoring these constraints and doing a straightforward maximization. Using the results (A.21), (A.26), and (A.28) from Appendix A, show that the covariance matrix Σ that maximizes the log likelihood function (3.102) is given by the sample covariance (3.106). We note that the final result is necessarily symmetric and positive definite (provided the sample covariance is non-singular).

3.29 (? ?) Use the result (3.42) to prove (3.46). Now, using the results (3.42) and (3.46), show that

$$
\mathbb{E}[{\mathbf{x}}_{n}{\mathbf{x}}_{m}^{\mathrm{T}}] ={\boldsymbol{\mu}}{\boldsymbol{\mu}}^{\mathrm{T}} + I_{nm} \boldsymbol{\Sigma}\tag{3.213}
$$

where ${\bf x}_{n}$ denotes a data point sampled from a Gaussian distribution with mean µ and covariance Σ, and $I_{nm}$ denotes the $(n, m)$ element of the identity matrix. Hence, prove the result (3.108).

3.30 (?) The various trigonometric identities used in the discussion of periodic variables in this chapter can be proven easily from the relation

$$
\exp(iA) = \cos A + i \sin A\tag{3.214}
$$

in which i is the square root of minus one. By considering the identity

$$
\exp(iA) \exp(- iA) = 1\tag{3.215}
$$

prove the result (3.127). Similarly, using the identity

$$
\cos(A - B) = \Re \exp \{i(A - B)\}\tag{3.216}
$$

where $\mathfrak{R}$ denotes the real part, prove (3.128). Finally, by using sin $(A - B) =$ ${\mathfrak{T}} \exp \{i(A - B)\}$ , where denotes the imaginary part, prove the result (3.133).

3.31 (? ?) For large m, the von Mises distribution (3.129) becomes sharply peaked around the mode $\theta_{0}$ . By defining $\xi = m^{1 / 2}(\theta - \theta_{0})$ and taking the Taylor expansion of the cosine function given by

$$
\cos \alpha = 1 - \frac{\alpha^{2}}{2} + O(\alpha^{4})\tag{3.217}
$$

show that as $m \infty$ , the von Mises distribution tends to a Gaussian.

3.32 (?) Using the trigonometric identity (3.133), show that solution of (3.132) for $\theta_{0}$ is given by (3.134).

3.33 (?) By computing the first and second derivatives of the von Mises distribution (3.129), and using $I_{0}(m) > 0$ for $m > 0$ , show that the maximum of the distribution occurs when $\theta = \theta_{0}$ and that the minimum occurs when $\theta = \theta_{0} + \pi \left({\mathrm{mod}} 2 \pi \right)$ .

3.34 (?) By making use of the result (3.118) together with (3.134) and the trigonometric identity (3.128), show that the maximum likelihood solution $m_{\mathrm{ML}}$ for the concentration of the von Mises distribution satisfies $A(m_{\mathrm{ML}}) = \overline{{r}}$ where $\overline{r}$ is the radius of the mean of the observations viewed as unit vectors in the two-dimensional Euclidean plane, as illustrated in Figure 3.9.

3.35 (?) Verify that the multivariate Gaussian distribution can be cast in exponential family form (3.138), and derive expressions for $\eta, \mathbf{u}(\mathbf{x}), h(\mathbf{x})$ , and $g(\pmb{\eta})$ analogous to (3.164) to (3.167).

3.36 (?) The result (3.172) showed that the negative gradient of ln $g(\pmb{\eta})$ for the exponential family is given by the expectation of $\mathbf{u}(\mathbf{x})$ . By taking the second derivatives of (3.139), show that

$$
- \nabla \nabla \ln g(\pmb{\eta}) = \mathbb{E}[\mathbf{u}(\mathbf{x}) \mathbf{u}(\mathbf{x})^{\mathrm{T}}] - \mathbb{E}[\mathbf{u}(\mathbf{x})] \mathbb{E}[\mathbf{u}(\mathbf{x})^{\mathrm{T}}] = \mathrm{cov}[\mathbf{u}(\mathbf{x})].\tag{3.218}
$$

3.37 (? ?) Consider a histogram-like density model in which the space x is divided into fixed regions for which the density $p(\mathbf{x})$ takes the constant value $h_{i}$ over the ith region. The volume of region i is denoted $\Delta_{i}$ . Suppose we have a set of N observations of x such that $n_{i}$ of these observations fall in region i. Using a Lagrange multiplier to enforce the normalization constraint on the density, derive an expression for the maximum likelihood estimator for the $\{h_{i}\}$

3.38 (?) Show that the K-nearest-neighbour density model defines an improper distribution whose integral over all space is divergent.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b368cdd7a305c419437fceb90cbadf30eb92bf7c565da9cf31153de77186bfbf.jpg)

In this chapter we discuss some of the basic ideas behind neural networks using the framework of linear regression, which we encountered briefly in the context of polynomial curve fitting. We will see that a linear regression model corresponds to a simple form of neural network having a single layer of learnable parameters. Although single-layer networks have very limited practical applicability, they have simple analytical properties and provide an excellent framework for introducing many of the core concepts that will lay a foundation for our discussion of deep neural networks in later chapters.


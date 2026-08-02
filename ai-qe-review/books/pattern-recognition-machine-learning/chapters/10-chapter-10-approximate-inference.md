---
title: "Chapter 10 \u2014 Approximate Inference"
book: "Pattern Recognition and Machine Learning"
book_slug: pattern-recognition-machine-learning
course: deep-learning
chapter_number: 10
citekey: bishop2006prml
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/pattern-recognition-machine-learning/reading.md"
source_line_start: 13023
source_line_end: 14971
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 36
source_empty_image_alt: 36
non_semantic_image_alt: 26
caption_derived_image_alt: 10
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 75
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 10 — Approximate Inference

> [[../README|本书目录]] · [[09-chapter-9-8-7-6-5-4-3-2|上一章]] · [[11-chapter-11-sampling-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Pattern Recognition and Machine Learning（bishop2006prml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/pattern-recognition-machine-learning/reading.md)，源行 13023–14971。
> - 本章保留 36 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed PRML exercise difficulty marker pattern × 74；PDF-confirmed control-symbol repair (PDF p.496) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Approximate Inference

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/5a691ffda2219a97c5e135fb97c8354c9b484dc6c2db1ec6e6765dd0fa905e8a.jpg)

A central task in the application of probabilistic models is the evaluation of the posterior distribution p( ) of the latent variables given the observed (visible) data variables , and the evaluation of expectations computed with respect to this distribution. The model might also contain some deterministic parameters, which we will leave implicit for the moment, or it may be a fully Bayesian model in which any unknown parameters are given prior distributions and are absorbed into the set of latent variables denoted by the vector . For instance, in the EM algorithm we need <sup>Z</sup>to evaluate the expectation of the complete-data log likelihood with respect to the posterior distribution of the latent variables. For many models of practical interest, it will be infeasible to evaluate the posterior distribution or indeed to compute expectations with respect to this distribution. This could be because the dimensionality of the latent space is too high to work with directly or because the posterior distribution has a highly complex form for which expectations are not analytically tractable. In the case of continuous variables, the required integrations may not have closed-form analytical solutions, while the dimensionality of the space and the complexity of the integrand may prohibit numerical integration. For discrete variables, the marginalizations involve summing over all possible configurations of the hidden variables, and though this is always possible in principle, we often find in practice that there may be exponentially many hidden states so that exact calculation is prohibitively expensive.

In such situations, we need to resort to approximation schemes, and these fall broadly into two classes, according to whether they rely on stochastic or deterministic approximations. Stochastic techniques such as Markov chain Monte Carlo, described in Chapter 11, have enabled the widespread use of Bayesian methods across many domains. They generally have the property that given infinite computational resource, they can generate exact results, and the approximation arises from the use of a finite amount of processor time. In practice, sampling methods can be computationally demanding, often limiting their use to small-scale problems. Also, it can be difficult to know whether a sampling scheme is generating independent samples from the required distribution.

In this chapter, we introduce a range of deterministic approximation schemes, some of which scale well to large applications. These are based on analytical approximations to the posterior distribution, for example by assuming that it factorizes in a particular way or that it has a specific parametric form such as a Gaussian. As such, they can never generate exact results, and so their strengths and weaknesses are complementary to those of sampling methods.

In Section 4.4, we discussed the Laplace approximation, which is based on a local Gaussian approximation to a mode (i.e., a maximum) of the distribution. Here we turn to a family of approximation techniques called variational inference or variational Bayes, which use more global criteria and which have been widely applied. We conclude with a brief introduction to an alternative variational framework known as expectation propagation.

## 10.1. Variational Inference

Variational methods have their origins in the $18^{\mathrm{th}}$ century with the work of Euler, Lagrange, and others on the calculus of variations. Standard calculus is concerned with finding derivatives of functions. We can think of a function as a mapping that takes the value of a variable as the input and returns the value of the function as the output. The derivative of the function then describes how the output value varies as we make infinitesimal changes to the input value. Similarly, we can define a functional as a mapping that takes a function as the input and that returns the value of the functional as the output. An example would be the entropy $\mathrm{H}[p]$ , which takes a probability distribution $p(x)$ as the input and returns the quantity

$$
\mathrm{H}[p] = \int p(x) \ln p(x) d x\tag{10.1}
$$

as the output. We can the introduce the concept of a functional derivative, which expresses how the value of the functional changes in response to infinitesimal changes to the input function (Feynman et al., 1964). The rules for the calculus of variations mirror those of standard calculus and are discussed in Appendix D. Many problems can be expressed in terms of an optimization problem in which the quantity being optimized is a functional. The solution is obtained by exploring all possible input functions to find the one that maximizes, or minimizes, the functional. Variational methods have broad applicability and include such areas as finite element methods (Kapur, 1989) and maximum entropy (Schwarz, 1988).

Although there is nothing intrinsically approximate about variational methods, they do naturally lend themselves to finding approximate solutions. This is done by restricting the range of functions over which the optimization is performed, for instance by considering only quadratic functions or by considering functions composed of a linear combination of fixed basis functions in which only the coefficients of the linear combination can vary. In the case of applications to probabilistic inference, the restriction may for example take the form of factorization assumptions (Jordan et al., 1999; Jaakkola, 2001).

Now let us consider in more detail how the concept of variational optimization can be applied to the inference problem. Suppose we have a fully Bayesian model in which all parameters are given prior distributions. The model may also have latent variables as well as parameters, and we shall denote the set of all latent variables and parameters by $\mathbf{Z}.$ Similarly, we denote the set of all observed variables by . <sup>Z X</sup>For example, we might have a set of N independent, identically distributed data, for which $\mathbf{X} ~ = ~ \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ and $\mathbf{Z} \ = \ \{\mathbf{z}_{1}, \ldots, \mathbf{z}_{N}\}$ Our probabilistic model <sup>X x x</sup>specifies the joint distribution $p(\mathbf{X}, \mathbf{Z})$ , and our goal is to find an approximation for the posterior distribution $p(\mathbf{Z} | \mathbf{X})$ as well as for the model evidence $p(\mathbf{X})$ . As in our <sup>Z X X</sup>discussion of EM, we can decompose the log marginal probability using

$$
\ln p(\mathbf{X}) = \mathcal{L}(q) + \mathrm{KL}(q \| p)\tag{10.2}
$$

where we have defined

$$
\mathcal{L}(q) = \int q(\mathbf{Z}) \ln \left\{\frac{p(\mathbf{X}, \mathbf{Z})}{q(\mathbf{Z})} \right\} d \mathbf{Z}\tag{10.3}
$$

$$
\mathrm{KL}(q \| p) = - \int q(\mathbf{Z}) \ln \left\{\frac{p(\mathbf{Z} | \mathbf{X})}{q(\mathbf{Z})} \right\} d \mathbf{Z}.\tag{10.4}
$$

This differs from our discussion of EM only in that the parameter vector $\pmb \theta$ no longer appears, because the parameters are now stochastic variables and are absorbed into . Since in this chapter we will mainly be interested in continuous variables we have used integrations rather than summations in formulating this decomposition. However, the analysis goes through unchanged if some or all of the variables are discrete simply by replacing the integrations with summations as required. As before, we can maximize the lower bound $\mathcal{L}(q)$ by optimization with respect to the distribution $q(\mathbf{Z})$ , which is equivalent to minimizing the KL divergence. If we allow any possible choice for $q(\mathbf{Z})$ , then the maximum of the lower bound occurs when the KL divergence vanishes, which occurs when $q(\mathbf{Z})$ equals the posterior distribution $p(\mathbf{Z} | \mathbf{X})$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/f8def8ad44858a403d0ef4ea31a3016d3b5826a3303061e1410af1636b2739cc.jpg)

![Figure 10.1](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/fe1bb7eac15f5759939186dd983b0bc61a19b4dc840f2766780909b1158965ae.jpg)  
Figure 10.1 Illustration of the variational approximation for the example considered earlier in Figure 4.14. The left-hand plot shows the original distribution (yellow) along with the Laplace (red) and variational (green) approximations, and the right-hand plot shows the negative logarithms of the corresponding curves.

However, we shall suppose the model is such that working with the true posterior distribution is intractable.

We therefore consider instead a restricted family of distributions $q(\mathbf{Z})$ and then seek the member of this family for which the KL divergence is minimized. Our goal is to restrict the family sufficiently that they comprise only tractable distributions, while at the same time allowing the family to be sufficiently rich and flexible that it can provide a good approximation to the true posterior distribution. It is important to emphasize that the restriction is imposed purely to achieve tractability, and that subject to this requirement we should use as rich a family of approximating distributions as possible. In particular, there is no ‘over-fitting’ associated with highly flexible distributions. Using more flexible approximations simply allows us to approach the true posterior distribution more closely.

One way to restrict the family of approximating distributions is to use a parametric distribution $q(\mathbf{Z} | \omega)$ governed by a set of parameters $\omega.$ . The lower bound $\mathcal{L}(q)$ <sup>Z</sup>then becomes a function of $\omega,$ , and we can exploit standard nonlinear optimization techniques to determine the optimal values for the parameters. An example of this approach, in which the variational distribution is a Gaussian and we have optimized with respect to its mean and variance, is shown in Figure 10.1.

## 10.1.1 Factorized distributions

Here we consider an alternative way in which to restrict the family of distributions $q(\mathbf{Z})$ . Suppose we partition the elements of $\mathbf{Z}$ into disjoint groups that we denote by $\mathbf{Z}_{i}$ where $i = 1, \dots, M$ . We then assume that the $q$ distribution factorizes with respect to these groups, so that

$$
q(\mathbf{Z}) = \prod_{i = 1}^{M} q_{i}(\mathbf{Z}_{i}).\tag{10.5}
$$

It should be emphasized that we are making no further assumptions about the distribution. In particular, we place no restriction on the functional forms of the individual factors $q_{i}(\mathbf{Z}_{i})$ . This factorized form of variational inference corresponds to an ap-<sup>Z</sup>proximation framework developed in physics called mean field theory (Parisi, 1988).

Amongst all distributions $q(\mathbf{Z})$ having the form (10.5), we now seek that distri-<sup>Z</sup>bution for which the lower bound $\mathcal{L}(q)$ is largest. We therefore wish to make a free form (variational) optimization of $\mathcal{L}(q)$ with respect to all of the distributions $q_{i}(\mathbf{Z}_{i})$ <sup>Z</sup>which we do by optimizing with respect to each of the factors in turn. To achieve this, we first substitute (10.5) into (10.3) and then dissect out the dependence on one of the factors $q_{j}(\mathbf{Z}_{j})$ . Denoting $q_{j}(\mathbf{Z}_{j})$ by simply $q_{j}$ to keep the notation uncluttered, we then obtain

$$
\begin{array}{rcl} \mathcal{L}(q) & = & \int \prod_{i} q_{i} \left\{\ln p(\mathbf{X}, \mathbf{Z}) - \sum_{i} \ln q_{i} \right\} d \mathbf{Z} \\ & = & \int q_{j} \left\{\int \ln p(\mathbf{X}, \mathbf{Z}) \prod_{i \neq j} q_{i} d \mathbf{Z}_{i} \right\} d \mathbf{Z}_{j} - \int q_{j} \ln q_{j} d \mathbf{Z}_{j} + \text{const} \\ & = & \int q_{j} \ln \widetilde{p}(\mathbf{X}, \mathbf{Z}_{j}) d \mathbf{Z}_{j} - \int q_{j} \ln q_{j} d \mathbf{Z}_{j} + \text{const} \end{array} \tag{10}\tag{10.6}
$$

where we have defined a new distribution $\widetilde{p}(\mathbf{X}, \mathbf{Z}_{j})$ by the relation

$$
\ln \widetilde{p}(\mathbf{X}, \mathbf{Z}_{j}) = \mathbb{E}_{i \neq j}[\ln p(\mathbf{X}, \mathbf{Z})] + \mathrm{const}.\tag{10.7}
$$

Here the notation $\mathbb{E}_{i \neq j}[\cdot \cdot \cdot]$ denotes an expectation with respect to the $q$ distributions over all variables $\mathbf{z}_{i}$ for $i \neq j$ , so that

$$
\mathbb{E}_{i \neq j}[\ln p(\mathbf{X}, \mathbf{Z})] = \int \ln p(\mathbf{X}, \mathbf{Z}) \prod_{i \neq j} q_{i} d \mathbf{Z}_{i}.\tag{10.8}
$$

Now suppose we keep the $\{q_{i \neq j}\}$ fixed and maximize $\mathcal{L}(q)$ in (10.6) with respect to all possible forms for the distribution $q_{j}(\mathbf{Z}_{j})$ . This is easily done by recognizing that (10.6) is a negative Kullback-Leibler divergence between $q_{j}(\mathbf{Z}_{j})$ and $\widetilde{p}(\mathbf{X}, \mathbf{Z}_{j})$ <sup>Z</sup>. Thus maximizing (10.6) is equivalent to minimizing the Kullback-Leibler

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/6ac32e63fff0a92ef86798db14d56a275c18a22d43f3eeaf5bdc41ca938334e2.jpg)

## Leonhard Euler 1707–1783

Euler was a Swiss mathematician and physicist who worked in St. Petersburg and Berlin and who is widely considered to be one of the greatest mathematicians of all time. He is certainly the most prolific, and

his collected works fill 75 volumes. Amongst his many contributions, he formulated the modern theory of the function, he developed (together with Lagrange) the calculus of variations, and he discovered the formula $e^{i \pi} ~ = ~ - 1$ which relates four of the most important numbers in mathematics. During the last 17 years of his life, he was almost totally blind, and yet he produced nearly half of his results during this period.

divergence, and the minimum occurs when $q_{j}(\mathbf{Z}_{j}) = \widetilde{p}(\mathbf{X}, \mathbf{Z}_{j})$ . Thus we obtain a general expression for the optimal solution $q_{j}^{\star}(\mathbf{Z}_{j})$ <sup>X</sup>given by

$$
\ln q_{j}^{\star}(\mathbf{Z}_{j}) = \mathbb{E}_{i \neq j}[\ln p(\mathbf{X}, \mathbf{Z})] + \mathrm{const.}\tag{10.9}
$$

It is worth taking a few moments to study the form of this solution as it provides the basis for applications of variational methods. It says that the log of the optimal solution for factor $q_{j}$ is obtained simply by considering the log of the joint distribution over all hidden and visible variables and then taking the expectation with respect to all of the other factors $\{q_{i}\}$ for $i \neq j$

The additive constant in (10.9) is set by normalizing the distribution $q_{j}^{\star}(\mathbf{Z}_{j})$ Thus if we take the exponential of both sides and normalize, we have

$$
q_{j}^{\star}(\mathbf{Z}_{j}) = \frac{\exp \left(\mathbb{E}_{i \neq j}[\ln p(\mathbf{X}, \mathbf{Z})]\right)}{\int \exp \left(\mathbb{E}_{i \neq j}[\ln p(\mathbf{X}, \mathbf{Z})]\right) d \mathbf{Z}_{j}}.
$$

In practice, we shall find it more convenient to work with the form (10.9) and then reinstate the normalization constant (where required) by inspection. This will become clear from subsequent examples.

The set of equations given by (10.9) for $j = 1, \dots, M$ represent a set of consistency conditions for the maximum of the lower bound subject to the factorization constraint. However, they do not represent an explicit solution because the expression on the right-hand side of (10.9) for the optimum $q_{j}^{\star}(\mathbf{Z}_{j})$ depends on expectations computed with respect to the other factors $q_{i}(\mathbf{Z}_{i})$ for $i \neq j$ . We will therefore seek <sup>Z</sup>a consistent solution by first initializing all of the factors $q_{i}(\mathbf{Z}_{i})$ appropriately and then cycling through the factors and replacing each in turn with a revised estimate given by the right-hand side of (10.9) evaluated using the current estimates for all of the other factors. Convergence is guaranteed because bound is convex with respect to each of the factors $q_{i}(\mathbf{Z}_{i})$ (Boyd and Vandenberghe, 2004).

## 10.1.2 Properties of factorized approximations

Our approach to variational inference is based on a factorized approximation to the true posterior distribution. Let us consider for a moment the problem of approximating a general distribution by a factorized distribution. To begin with, we discuss the problem of approximating a Gaussian distribution using a factorized Gaussian, which will provide useful insight into the types of inaccuracy introduced in using factorized approximations. Consider a Gaussian distribution $\dot{p}({\bf z}) = \mathcal{N}({\bf z} | \pmb{\mu}, \pmb{\Lambda}^{- 1})$ over two correlated variables $\textbf{z} = \(z_{1}, z_{2})$ in which the mean and precision have elements

$$
\boldsymbol{\mu} = \binom{\mu_{1}}{\mu_{2}}, \qquad \boldsymbol{\Lambda} = \left(\begin{array}{cc} \Lambda_{11} & \Lambda_{12} \\ \Lambda_{21} & \Lambda_{22} \end{array} \right)\tag{10.10}
$$

and $\Lambda_{21} = \Lambda_{12}$ due to the symmetry of the precision matrix. Now suppose we wish to approximate this distribution using a factorized Gaussian of the form $q(\mathbf{z}) =$ $q_{1}(z_{1}) q_{2}(z_{2})$ . We first apply the general result (10.9) to find an expression for the optimal factor $q_{1}^{\star}(z_{1})$ . In doing so it is useful to note that on the right-hand side we only need to retain those terms that have some functional dependence on $z_{1}$ because all other terms can be absorbed into the normalization constant. Thus we have

$$
\begin{array}{rcl} \ln q_{1}^{\star}(z_{1}) & = & \mathbb{E}_{z_{2}}[\ln p(\mathbf{z})] + \text{const} \\ & = & \mathbb{E}_{z_{2}} \left[- \frac{1}{2}(z_{1} - \mu_{1})^{2} \Lambda_{11} -(z_{1} - \mu_{1}) \Lambda_{12}(z_{2} - \mu_{2}) \right] + \text{const} \\ & = & - \frac{1}{2} z_{1}^{2} \Lambda_{11} + z_{1} \mu_{1} \Lambda_{11} - z_{1} \Lambda_{12}(\mathbb{E}[z_{2}] - \mu_{2}) + \text{const}.\end{array} \tag{10.}\tag{10.11}
$$

Next we observe that the right-hand side of this expression is a quadratic function of $z_{1}$ , and so we can identify $q^{\star}(z_{1})$ as a Gaussian distribution. It is worth emphasizing that we did not assume that $q(z_{i})$ is Gaussian, but rather we derived this result by variational optimization of the KL divergence over all possible distributions $q(z_{i})$ Note also that we do not need to consider the additive constant in (10.9) explicitly because it represents the normalization constant that can be found at the end by inspection if required. Using the technique of completing the square, we can identify the mean and precision of this Gaussian, giving

Section 2.3.1

$$
q^{\star}(z_{1}) = \mathcal{N}(z_{1} | m_{1}, \Lambda_{11}^{- 1})\tag{10.12}
$$

where

$$
m_{1} = \mu_{1} - \Lambda_{11}^{- 1} \Lambda_{12} \left(\mathbb{E}[z_{2}] - \mu_{2}\right).\tag{10.13}
$$

By symmetry, $q_{2}^{\star}(z_{2})$ is also Gaussian and can be written as

$$
q_{2}^{\star}(z_{2}) = \mathcal{N}(z_{2} | m_{2}, \Lambda_{22}^{- 1})\tag{10.14}
$$

in which

$$
m_{2} = \mu_{2} - \Lambda_{22}^{- 1} \Lambda_{21} \left(\mathbb{E}[z_{1}] - \mu_{1}\right).\tag{10.15}
$$

Note that these solutions are coupled, so that $q^{\star}(z_{1})$ depends on expectations computed with respect to $q^{\star}(z_{2})$ and vice versa. In general, we address this by treating the variational solutions as re-estimation equations and cycling through the variables in turn updating them until some convergence criterion is satisfied. We shall see an example of this shortly. Here, however, we note that the problem is sufficiently simple that a closed form solution can be found. In particular, because $\mathbb{E}[z_{1}] = m_{1}$ and $\mathbb{E}[z_{2}] = m_{2}$ , we see that the two equations are satisfied if we take $\mathbb{E}[z_{1}] = \mu_{1}$ and $\mathbb{E}[z_{2}] = \mu_{2}$ , and it is easily shown that this is the only solution provided the distribution is nonsingular. This result is illustrated in Figure 10.2(a). We see that the mean is correctly captured but that the variance of $q(\mathbf{z})$ is controlled by the direction of smallest variance of $p(\mathbf{z})$ , and that the variance along the orthogonal direction is significantly under-estimated. It is a general result that a factorized variational approximation tends to give approximations to the posterior distribution that are too compact.

By way of comparison, suppose instead that we had been minimizing the reverse Kullback-Leibler divergence $\mathrm{KL}(p | | q)$ . As we shall see, this form of KL divergence

Figure 10.2 Comparison of the two alternative forms for the Kullback-Leibler divergence. The green contours corresponding to 1, 2, and 3 standard deviations for a correlated Gaussian distribution $p(\mathbf{z})$ over two variables $z_{1}$ and $z_{2}$ and the red contours represent the corresponding levels for an approximating distribution $q(\mathbf{z})$ over the same variables given by the product of two independent univariate Gaussian distributions whose parameters are obtained by minimization of (a) the Kullback-Leibler divergence $\mathrm{KL}(q \| p)$ and (b) the reverse Kullback-Leibler divergence $\mathrm{KL}(p | | q)$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/1f189035089c616d06af65ea91d947347f7a654cd1801d8b2f1a214dfa8182a4.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/29a2b1c564815e18371d92fb453921980feacd5da13cff170ade474fbc8228e1.jpg)

Section 10.7

is used in an alternative approximate inference framework called expectation propagation. We therefore consider the general problem of minimizing KL $(p \| q)$ when $q(\mathbf{Z})$ is a factorized approximation of the form (10.5). The KL divergence can then be written in the form

$$
\mathrm{KL}(p \| q) = - \int p(\mathbf{Z}) \left[\sum_{i = 1}^{M} \ln q_{i}(\mathbf{Z}_{i}) \right] d \mathbf{Z} + \mathrm{const}\tag{10.16}
$$

Exercise 10.3

where the constant term is simply the entropy of $p(\mathbf{Z})$ and so does not depend on $q(\mathbf{Z})$ <sup>Z</sup>. We can now optimize with respect to each of the factors $q_{j}(\mathbf{Z}_{j})$ , which is easily done using a Lagrange multiplier to give

$$
q_{j}^{\star}(\mathbf{Z}_{j}) = \int p(\mathbf{Z}) \prod_{i \neq j} d \mathbf{Z}_{i} = p(\mathbf{Z}_{j}).\tag{10.17}
$$

In this case, we find that the optimal solution for $q_{j}(\mathbf{Z}_{j})$ is just given by the corresponding marginal distribution of $p(\mathbf{Z})$ <sup>Z</sup>. Note that this is a closed-form solution and so does not require iteration.

To apply this result to the illustrative example of a Gaussian distribution $p(\mathbf{z})$ over a vector we can use (2.98), which gives the result shown in Figure 10.2(b). <sup>z</sup>We see that once again the mean of the approximation is correct, but that it places significant probability mass in regions of variable space that have very low probability.

The difference between these two results can be understood by noting that there is a large positive contribution to the Kullback-Leibler divergence

$$
\mathrm{KL}(q \| p) = - \int q(\mathbf{Z}) \ln \left\{\frac{p(\mathbf{Z})}{q(\mathbf{Z})} \right\} d \mathbf{Z}\tag{10.18}
$$

(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/b6d28f2804d632afb542120ea550c70ee238c2602c62db74c8b364c45fc4c6fe.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/cc60454507dbb25486fb7f6ba05e04c37d2a6a812ff7fe77ef5b4f06ee8863af.jpg)

![Figure 10.3](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/291aba3223f505fed674db7d120254188d8745c5b1db43245b2e531f72d81d03.jpg)  
Figure 10.3 Another comparison of the two alternative forms for the Kullback-Leibler divergence. (a) The blue contours show a bimodal distribution $p(\mathbf{Z})$ given by a mixture of two Gaussians, and the red contours correspond to the single Gaussian distribution $q(\mathbf{Z})$ that best approximates $p(\mathbf{Z})$ in the sense of minimizing the Kullback-Leibler divergence $\mathrm{KL}(p | | q)$ . (b) $A s$ in (a) but now the red contours correspond to a Gaussian distribution $q(\mathbf{Z})$ found by numerical minimization of the Kullback-Leibler divergence KL $(q \| p)$ . (c) As in (b) but showing a different local minimum of the Kullback-Leibler divergence.

from regions of space in which $p(\mathbf{Z})$ is near zero unless $q(\mathbf{Z})$ is also close to <sup>Z Z Z</sup>zero. Thus minimizing this form of KL divergence leads to distributions $q(\mathbf{Z})$ that avoid regions in which $p(\mathbf{Z})$ <sup>Z</sup>is small. Conversely, the Kullback-Leibler divergence KL $(p \| q)$ <sup>Z</sup>is minimized by distributions $q(\mathbf{Z})$ that are nonzero in regions where $p(\mathbf{Z})$ is nonzero.

We can gain further insight into the different behaviour of the two KL divergences if we consider approximating a multimodal distribution by a unimodal one, as illustrated in Figure 10.3. In practical applications, the true posterior distribution will often be multimodal, with most of the posterior mass concentrated in some number of relatively small regions of parameter space. These multiple modes may arise through nonidentifiability in the latent space or through complex nonlinear dependence on the parameters. Both types of multimodality were encountered in Chapter 9 in the context of Gaussian mixtures, where they manifested themselves as multiple maxima in the likelihood function, and a variational treatment based on the minimization of $\mathrm{KL}(q \| p)$ will tend to find one of these modes. By contrast, if we were to minimize $\mathrm{KL}(p | | q)$ , the resulting approximations would average across all of the modes and, in the context of the mixture model, would lead to poor predictive distributions (because the average of two good parameter values is typically itself not a good parameter value). It is possible to make use of $\mathrm{KL}(p | | q)$ to define a useful inference procedure, but this requires a rather different approach to the one discussed here, and will be considered in detail when we discuss expectation propagation.

The two forms of Kullback-Leibler divergence are members of the alpha family

of divergences (Ali and Silvey, 1966; Amari, 1985; Minka, 2005) defined by

$$
\mathrm{D}_{\alpha}(p \| q) = \frac{4}{1 - \alpha^{2}} \left(1 - \int p(x)^{(1 + \alpha) / 2} q(x)^{(1 - \alpha) / 2} d x\right)\tag{10.19}
$$

where $- \infty < \alpha < \infty$ is a continuous parameter. The Kullback-Leibler divergence $\mathrm{KL}(p | | q)$ corresponds to the limit $\alpha 1$ , whereas $\mathrm{KL}(q \| p)$ corresponds to the limit $\alpha - 1$ . For all values of α we have $\begin{array}{r}{\mathrm{D}_{\alpha}(p \Vert q) \geqslant 0} \end{array}$ , with equality if, and only if, $p(x) = q(x)$ . Suppose $p(x)$ is a fixed distribution, and we minimize $\mathrm{D}_{\alpha}(p \Vert q)$ with respect to some set of distributions $q(x)$ . Then for $\alpha \leqslant - 1$ the divergence is zero forcing, so that any values of x for which $p(x) = 0$ will have $q(x) = 0$ , and typically $q(x)$ will under-estimate the support of $p(x)$ and will tend to seek the mode with the largest mass. Conversely for $\alpha \geqslant 1$ the divergence is zero-avoiding, so that values of $x$ for which $p(x) > 0$ will have $q(x) > 0$ , and typically $q(x)$ will stretch to cover all of $p(x)$ , and will over-estimate the support of $p(x)$ . When $\alpha = 0$ we obtain a symmetric divergence that is linearly related to the Hellinger distance given by

$$
\mathrm{D}_{\mathrm{H}}(p \| q) = \int \left(p(x)^{1 / 2} - q(x)^{1 / 2}\right) d x.\tag{10.20}
$$

The square root of the Hellinger distance is a valid distance metric.

## 10.1.3 Example: The univariate Gaussian

We now illustrate the factorized variational approximation using a Gaussian distribution over a single variable x (MacKay, 2003). Our goal is to infer the posterior distribution for the mean $\mu$ and precision $\tau,$ given a data set $\mathcal{D} = \{x_{1}, \ldots, x_{N}\}$ of observed values of $x$ which are assumed to be drawn independently from the Gaussian. The likelihood function is given by

$$
p(\mathcal{D} | \mu, \tau) = \left(\frac{\tau}{2 \pi}\right)^{N / 2} \exp \left\{- \frac{\tau}{2} \sum_{n = 1}^{N}(x_{n} - \mu)^{2} \right\}.\tag{10.21}
$$

We now introduce conjugate prior distributions for $\mu$ and $\tau$ given by

$$
p(\mu | \tau) = \mathcal{N} \left(\mu | \mu_{0},(\lambda_{0} \tau)^{- 1}\right)\tag{10.22}
$$

$$
{p(\tau)} ={\mathrm{Gam}(\tau | a_{0}, b_{0})}\tag{10.23}
$$

where Gam $(\tau | a_{0}, b_{0})$ is the gamma distribution defined by (2.146). Together these distributions constitute a Gaussian-Gamma conjugate prior distribution.

For this simple problem the posterior distribution can be found exactly, and again takes the form of a Gaussian-gamma distribution. However, for tutorial purposes we will consider a factorized variational approximation to the posterior distribution given by

$$
q(\mu, \tau) = q_{\mu}(\mu) q_{\tau}(\tau).\tag{10.24}
$$

Note that the true posterior distribution does not factorize in this way. The optimum factors $q_{\mu}(\mu)$ and $q_{\tau}(\tau)$ can be obtained from the general result (10.9) as follows. For $q_{\mu}(\mu)$ we have

$$
\begin{array}{rcl} \ln q_{\mu}^{\star}(\mu) & = & \mathbb{E}_{\tau} \left[\ln p(\mathcal{D} | \mu, \tau) + \ln p(\mu | \tau) \right] + \text{const} \\ & = & - \frac{\mathbb{E}[\tau]}{2} \left\{\lambda_{0}(\mu - \mu_{0})^{2} + \sum_{n = 1}^{N}(x_{n} - \mu)^{2} \right\} + \text{const}.\end{array}\tag{10.25}
$$

Completing the square over $\mu$ we see that $q_{\mu}(\mu)$ is a Gaussian $\mathcal{N} \left(\mu \vert \mu_{N}, \lambda_{N}^{- 1} \right)$ with mean and precision given by

$$
\mu_{N} = \frac{\lambda_{0} \mu_{0} + N \overline{{x}}}{\lambda_{0} + N}\tag{10.26}
$$

$$
\lambda_{N} =(\lambda_{0} + N) \mathbb{E}[\tau].\tag{10.27}
$$

Note that for $N \infty$ this gives the maximum likelihood result in which $\mu_{N} = \overline{{x}}$ and the precision is infinite.

Similarly, the optimal solution for the factor $q_{\tau}(\tau)$ is given by

$$
\begin{array}{rcl} \ln q_{\tau}^{\star}(\tau) & = & \mathbb{E}_{\mu} \left[\ln p(\mathcal{D} | \mu, \tau) + \ln p(\mu | \tau) \right] + \ln p(\tau) + \text{const} \\ & = &(a_{0} - 1) \ln \tau - b_{0} \tau + \frac{N}{2} \ln \tau \\ & & - \frac{\tau}{2} \mathbb{E}_{\mu} \left[\sum_{n = 1}^{N}(x_{n} - \mu)^{2} + \lambda_{0}(\mu - \mu_{0})^{2} \right] + \text{const} \end{array}\tag{10.28}
$$

and hence $q_{\tau}(\tau)$ is a gamma distribution ${\mathrm{Gam}}(\tau | a_{N}, b_{N})$ with parameters

$$
a_{N} = a_{0} + \frac{N}{2}\tag{10.29}
$$

$$
{b_{N}} ={b_{0} + \frac{1}{2} \mathbb{E}_{\mu} \left[\sum_{n = 1}^{N}(x_{n} - \mu)^{2} + \lambda_{0}(\mu - \mu_{0})^{2} \right].}\tag{10.30}
$$

Again this exhibits the expected behaviour when $N \to \infty$

It should be emphasized that we did not assume these specific functional forms for the optimal distributions $q_{\mu}(\mu)$ and $q_{\tau}(\tau)$ . They arose naturally from the structure of the likelihood function and the corresponding conjugate priors.

Thus we have expressions for the optimal distributions $q_{\mu}(\mu)$ and $q_{\tau}(\tau)$ each of which depends on moments evaluated with respect to the other distribution. One approach to finding a solution is therefore to make an initial guess for, say, the moment $\mathbb{E}[\tau]$ and use this to re-compute the distribution $q_{\mu}(\mu)$ . Given this revised distribution we can then extract the required moments $\mathbb{E}[\mu]$ and $\mathbb{E}[\mu^{2}]$ , and use these to recompute the distribution $q_{\tau}(\tau)$ , and so on. Since the space of hidden variables for this example is only two dimensional, we can illustrate the variational approximation to the posterior distribution by plotting contours of both the true posterior and the factorized approximation, as illustrated in Figure 10.4.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/d2cebc7a4830253981e5ce181d98f9a00056b873cba746f1cb590560a7ce8fb2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/643188ae2933ba26b6b1502d4b91d9f1cf765d8c39aa7d143b3015bfcf8cdcfe.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/f8ca1662697968d1ca2fcdb3338f1b9832dff0051dce10f9902b56a10b37109f.jpg)

![Figure 10.4](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/7a8632fce545b87fa7da5bf39daeeac9c7ac0a6696b0a5b077eaeaf9aa99c498.jpg)  
Figure 10.4 Illustration of variational inference for the mean $\mu$ and precision τ of a univariate Gaussian distribu tion. Contours of the true posterior distribution $p(\mu, \tau | D)$ are shown in green. (a) Contours of the initial factorized approximation $q_{\mu}(\mu) q_{\tau}(\tau)$ are shown in blue. (b) After re-estimating the factor $q_{\mu}(\mu)$ . (c) After re-estimating the factor $q_{\tau}(\tau)$ . (d) Contours of the optimal factorized approximation, to which the iterative scheme converges, are shown in red.

In general, we will need to use an iterative approach such as this in order to solve for the optimal factorized posterior distribution. For the very simple example we are considering here, however, we can find an explicit solution by solving the simultaneous equations for the optimal factors $q_{\mu}(\mu)$ and $q_{\tau}(\tau)$ . Before doing this, we can simplify these expressions by considering broad, noninformative priors in which $\mu_{0} = a_{0} = b_{0} = \lambda_{0} = 0$ . Although these parameter settings correspond to improper priors, we see that the posterior distribution is still well defined. Using the standard result $\mathbb{E}[\tau] = a_{N} / b_{N}$ for the mean of a gamma distribution, together with (10.29) and (10.30), we have

$$
\frac{1}{\mathbb{E}[\tau]} = \mathbb{E} \left[\frac{1}{N} \sum_{n = 1}^{N}(x_{n} - \mu)^{2} \right] = \overline{{x^{2}}} - 2 \overline{{x}} \mathbb{E}[\mu] + \mathbb{E}[\mu^{2}].\tag{10.31}
$$

Then, using (10.26) and (10.27), we obtain the first and second order moments of

$q_{\mu}(\mu)$ in the form

$$
\mathbb{E}[\mu] = \overline{{x}}, \qquad \mathbb{E}[\mu^{2}] = \overline{{x}}^{2} + \frac{1}{N \mathbb{E}[\tau]}.\tag{10.32}
$$

We can now substitute these moments into (10.31) and then solve for $\mathbb{E}[\tau]$ to give

$$
\begin{array}{rcl} \frac{1}{\mathbb{E}[\tau]} & = & \frac{1}{N - 1}(\overline{{x^{2}}} - \overline{{x}}^{2}) \\ & = & \frac{1}{N - 1} \sum_{n = 1}^{N}(x_{n} - \overline{{x}})^{2}.\end{array}\tag{10.33}
$$

We recognize the right-hand side as the familiar unbiased estimator for the variance of a univariate Gaussian distribution, and so we see that the use of a Bayesian approach has avoided the bias of the maximum likelihood solution.

## 10.1.4 Model comparison

As well as performing inference over the hidden variables , we may also wish to compare a set of candidate models, labelled by the index m, and having prior probabilities $p(m)$ . Our goal is then to approximate the posterior probabilities $p(m | \mathbf{X})$ , where is the observed data. This is a slightly more complex situation <sup>X X</sup>than that considered so far because different models may have different structure and indeed different dimensionality for the hidden variables . We cannot therefore simply consider a factorized approximation $q(\mathbf{Z}) q(m)$ , but must instead recog-<sup>Z</sup>nize that the posterior over must be conditioned on m, and so we must consider $q(\mathbf{Z}, m) = q(\mathbf{Z} | m) q(m)$ <sup>Z</sup>. We can readily verify the following decomposition based <sup>Z Z</sup>on this variational distribution

$$
\ln p(\mathbf{X}) = \mathcal{L}_{m} - \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, m | \mathbf{X})}{q(\mathbf{Z} | m) q(m)} \right\}\tag{10.34}
$$

where the ${\mathcal{L}}_{m}$ is a lower bound on ln $p(\mathbf{X})$ and is given by

$$
\mathcal{L}_{m} = \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, \mathbf{X}, m)}{q(\mathbf{Z} | m) q(m)} \right\}.\tag{10.35}
$$

Here we are assuming discrete , but the same analysis applies to continuous latent variables provided the summations are replaced with integrations. We can maximize ${\mathcal{L}}_{m}$ with respect to the distribution $q(m)$ using a Lagrange multiplier, with the result

$$
q(m) \propto p(m) \exp \{\mathcal{L}_{m}\}.\tag{10.36}
$$

However, if we maximize ${\mathcal{L}}_{m}$ with respect to the $q(\mathbf{Z} | m)$ , we find that the solutions <sup>Z</sup>for different m are coupled, as we expect because they are conditioned on m. We proceed instead by first optimizing each of the $q(\mathbf{Z} | m)$ individually by optimization of (10.35), and then subsequently determining the $q(m)$ using (10.36). After normalization the resulting values for $q(m)$ can be used for model selection or model averaging in the usual way.

## 10.2. Illustration: Variational Mixture of Gaussians

We now return to our discussion of the Gaussian mixture model and apply the variational inference machinery developed in the previous section. This will provide a good illustration of the application of variational methods and will also demonstrate how a Bayesian treatment elegantly resolves many of the difficulties associated with the maximum likelihood approach (Attias, 1999b). The reader is encouraged to work through this example in detail as it provides many insights into the practical application of variational methods. Many Bayesian models, corresponding to much more sophisticated distributions, can be solved by straightforward extensions and generalizations of this analysis.

Our starting point is the likelihood function for the Gaussian mixture model, illustrated by the graphical model in Figure 9.6. For each observation ${\bf x}_{n}$ we have a corresponding latent variable $\mathbf{z}_{n}$ <sup>x</sup>comprising a 1-of-K binary vector with elements $z_{nk}$ for $k = 1, \ldots, K$ <sup>z</sup>. As before we denote the observed data set by $\mathbf{X} =$ $\{\mathbf{x}_{1}, \hdots, \mathbf{x}_{N}\}$ , and similarly we denote the latent variables by $\mathbf{Z} = \{\mathbf{z}_{1}, \ldots, \mathbf{z}_{N}\}$ <sup>x x</sup>From (9.10) we can write down the conditional distribution of $\mathbf{Z},$ <sup>z z</sup> given the mixing coefficients π, in the form

$$
p(\mathbf{Z} | \boldsymbol{\pi}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} \pi_{k}^{z_{nk}}.\tag{10.37}
$$

Similarly, from (9.11), we can write down the conditional distribution of the observed data vectors, given the latent variables and the component parameters

$$
p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} \mathcal{N} \left(\mathbf{x}_{n} | \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}^{- 1}\right)^{z_{nk}}\tag{10.38}
$$

where $\boldsymbol{\mu} = \{\mu_{k}\}$ and $\pmb{\Lambda} = \{\pmb{\Lambda}_{k}\}$ . Note that we are working in terms of precision <sup>Λ Λ</sup>matrices rather than covariance matrices as this somewhat simplifies the mathematics.

Next we introduce priors over the parameters $\mu,$ and $\pi$ . The analysis is con-<sup>Λ</sup>siderably simplified if we use conjugate prior distributions. We therefore choose a Dirichlet distribution over the mixing coefficients π

$$
p(\boldsymbol{\pi}) = \operatorname{Dir}(\boldsymbol{\pi} | \boldsymbol{\alpha}_{0}) = C(\boldsymbol{\alpha}_{0}) \prod_{k = 1}^{K} \pi_{k}^{\alpha_{0} - 1}\tag{10.39}
$$

where by symmetry we have chosen the same parameter $\alpha_{0}$ for each of the components, and $C(\alpha_{0})$ is the normalization constant for the Dirichlet distribution defined

Figure 10.5 Directed acyclic graph representing the Bayesian mixture of Gaussians model, in which the box (plate) denotes a set of N i.i.d. observations. Here $\mu$ denotes $\{\mu_{k}\}$ and Λ denotes $\{\pmb{\Lambda}_{k}\}$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/2efa0ee3d0fae7c8e87624324914f20f34baba60f9c971959fcc2d8b1be31e4e.jpg)

by (B.23). As we have seen, the parameter $\alpha_{0}$ can be interpreted as the effective prior number of observations associated with each component of the mixture. If the value of $\alpha_{0}$ is small, then the posterior distribution will be influenced primarily by the data rather than by the prior.

Similarly, we introduce an independent Gaussian-Wishart prior governing the mean and precision of each Gaussian component, given by

$$
\begin{array}{rcl} p(\boldsymbol{\mu}, \boldsymbol{\Lambda}) & = & p(\boldsymbol{\mu} | \boldsymbol{\Lambda}) p(\boldsymbol{\Lambda}) \\ & = & \prod_{k = 1}^{K} \mathcal{N} \left(\boldsymbol{\mu}_{k} | \mathbf{m}_{0},(\beta_{0} \boldsymbol{\Lambda}_{k})^{- 1}\right) \mathcal{W}(\boldsymbol{\Lambda}_{k} | \mathbf{W}_{0}, \nu_{0}) \end{array}\tag{10.40}
$$

because this represents the conjugate prior distribution when both the mean and precision are unknown. Typically we would choose $\mathbf{m}_{0} = \mathbf{0}$ by symmetry.

<sup>m 0</sup>The resulting model can be represented as a directed graph as shown in Figure 10.5. Note that there is a link from to $\pmb{\mu}$ since the variance of the distribution over $\pmb{\mu}$ in (10.40) is a function of .

<sup>Λ</sup>This example provides a nice illustration of the distinction between latent variables and parameters. Variables such as $\mathbf{z}_{n}$ that appear inside the plate are regarded <sup>z</sup>as latent variables because the number of such variables grows with the size of the data set. By contrast, variables such as $\pmb{\mu}$ that are outside the plate are fixed in number independently of the size of the data set, and so are regarded as parameters. From the perspective of graphical models, however, there is really no fundamental difference between them.

## 10.2.1 Variational distribution

In order to formulate a variational treatment of this model, we next write down the joint distribution of all of the random variables, which is given by

$$
p(\mathbf{X}, \mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) = p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) p(\mathbf{Z} | \boldsymbol{\pi}) p(\boldsymbol{\pi}) p(\boldsymbol{\mu} | \boldsymbol{\Lambda}) p(\boldsymbol{\Lambda})\tag{10.41}
$$

in which the various factors are defined above. The reader should take a moment to verify that this decomposition does indeed correspond to the probabilistic graphical model shown in Figure 10.5. Note that only the variables $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ are observed.

We now consider a variational distribution which factorizes between the latent variables and the parameters so that

$$
q(\mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) = q(\mathbf{Z}) q(\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}).\tag{10.42}
$$

It is remarkable that this is the only assumption that we need to make in order to obtain a tractable practical solution to our Bayesian mixture model. In particular, the functional form of the factors $q(\mathbf{Z})$ and $q(\pi, \mu, \Lambda)$ will be determined automatically by optimization of the variational distribution. Note that we are omitting the subscripts on the $q$ distributions, much as we do with the $p$ distributions in (10.41), and are relying on the arguments to distinguish the different distributions.

The corresponding sequential update equations for these factors can be easily derived by making use of the general result (10.9). Let us consider the derivation of the update equation for the factor $q(\mathbf{Z})$ . The log of the optimized factor is given by

$$
\ln q^{\star}(\mathbf{Z}) = \mathbb{E}_{\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}}[\ln p(\mathbf{X}, \mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] + \mathrm{const}.\tag{10.43}
$$

We now make use of the decomposition (10.41). Note that we are only interested in the functional dependence of the right-hand side on the variable . Thus any terms that do not depend on $\mathbf{Z}$ can be absorbed into the additive normalization constant, giving

$$
\ln q^{\star}(\mathbf{Z}) = \mathbb{E}_{\boldsymbol{\pi}}[\ln p(\mathbf{Z} | \boldsymbol{\pi})] + \mathbb{E}_{\boldsymbol{\mu}, \boldsymbol{\Lambda}}[\ln p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] + \mathrm{const.}\tag{10.44}
$$

Substituting for the two conditional distributions on the right-hand side, and again absorbing any terms that are independent of $\mathbf{Z}$ into the additive constant, we have

$$
\ln q^{\star}(\mathbf{Z}) = \sum_{n = 1}^{N} \sum_{k = 1}^{K} z_{nk} \ln \rho_{nk} + \text{const}\tag{10.45}
$$

where we have defined

$$
\begin{array}{rlr} \ln \rho_{nk} & = & \mathbb{E}[\ln \pi_{k}] + \frac{1}{2} \mathbb{E} \left[\ln | \boldsymbol{\Lambda}_{k} | \right] - \frac{D}{2} \ln(2 \pi) \\ & & - \frac{1}{2} \mathbb{E}_{\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}} \left[(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k}) \right] \end{array}\tag{10.46}
$$

where $D$ is the dimensionality of the data variable . Taking the exponential of both sides of (10.45) we obtain

$$
q^{\star}(\mathbf{Z}) \propto \prod_{n = 1}^{N} \prod_{k = 1}^{K} \rho_{nk}^{z_{nk}}.\tag{10.47}
$$

Exercise 10.12

Requiring that this distribution be normalized, and noting that for each value of n the quantities $z_{nk}$ are binary and sum to 1 over all values of k, we obtain

$$
q^{\star}(\mathbf{Z}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} r_{nk}^{z_{nk}}\tag{10.48}
$$

where

$$
r_{nk} = \frac{\rho_{nk}}{\sum_{j = 1}^{K} \rho_{nj}}.\tag{10.49}
$$

We see that the optimal solution for the factor $q(\mathbf{Z})$ takes the same functional form as the prior $p(\mathbf{Z} | \pi)$ . Note that because $\rho_{nk}$ <sup>Z</sup>is given by the exponential of a real <sup>Z</sup>quantity, the quantities $r_{nk}$ will be nonnegative and will sum to one, as required.

For the discrete distribution $q^{\star}(\mathbf{Z})$ we have the standard result

$$
\mathbb{E}[z_{nk}] = r_{nk}\tag{10.50}
$$

from which we see that the quantities $r_{nk}$ are playing the role of responsibilities. Note that the optimal solution for $q^{\star}(\mathbf{Z})$ depends on moments evaluated with respect <sup>Z</sup>to the distributions of other variables, and so again the variational update equations are coupled and must be solved iteratively.

At this point, we shall find it convenient to define three statistics of the observed data set evaluated with respect to the responsibilities, given by

$$
N_{k} = \sum_{n = 1}^{N} r_{nk}\tag{10.51}
$$

$$
{\overline{{\mathbf{x}}}_{k}} ={\frac{1}{N_{k}} \sum_{n = 1}^{N} r_{nk} \mathbf{x}_{n}}\tag{10.52}
$$

$$
\mathbf{S}_{k} = \frac{1}{N_{k}} \sum_{n = 1}^{N} r_{nk}(\mathbf{x}_{n} - \overline{{\mathbf{x}}}_{k})(\mathbf{x}_{n} - \overline{{\mathbf{x}}}_{k})^{\mathrm{T}}.\tag{10.53}
$$

Note that these are analogous to quantities evaluated in the maximum likelihood EM algorithm for the Gaussian mixture model.

Now let us consider the factor $q(\pi, \mu, \Lambda)$ in the variational posterior distribution. Again using the general result (10.9) we have

$$
\begin{array}{l} \ln q^{\star}(\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) = \ln p(\boldsymbol{\pi}) + \sum_{k = 1}^{K} \ln p \left(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}\right) + \mathbb{E}_{\mathbf{Z}}[\ln p(\mathbf{Z} | \boldsymbol{\pi})] \\ + \sum_{k = 1}^{K} \sum_{n = 1}^{N} \mathbb{E} \left[z_{nk} \right] \ln \mathcal{N} \left(\mathbf{x}_{n} \mid \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}^{- 1}\right) + \text{const.} \end{array} \tag{10}\tag{10.54}
$$

We observe that the right-hand side of this expression decomposes into a sum of terms involving only π together with terms only involving $\pmb{\mu}$ and , which implies that the variational posterior $q(\pi, \mu, \Lambda)$ factorizes to give $q(\pi) q(\pmb{\mu}, \pmb{\Lambda})$ . Furthermore, the terms involving $\pmb{\mu}$ and  themselves comprise a sum over k of terms involving $\pmb{\mu}_{k}$ and $\mathbf{\Lambda}_{\Lambda_{k}}$ leading to the further factorization

$$
q(\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) = q(\boldsymbol{\pi}) \prod_{k = 1}^{K} q(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}).\tag{10.55}
$$

Identifying the terms on the right-hand side of (10.54) that depend on π, we have

$$
\ln q^{\star}(\boldsymbol{\pi}) =(\alpha_{0} - 1) \sum_{k = 1}^{K} \ln \pi_{k} + \sum_{k = 1}^{K} \sum_{n = 1}^{N} r_{nk} \ln \pi_{k} + \text{const}\tag{10.56}
$$

where we have used (10.50). Taking the exponential of both sides, we recognize $q^{\star}(\pi)$ as a Dirichlet distribution

$$
q^{\star}(\boldsymbol{\pi}) = \operatorname{Dir}(\boldsymbol{\pi} | \boldsymbol{\alpha})\tag{10.57}
$$

where α has components $\alpha_{k}$ given by

$$
\alpha_{k} = \alpha_{0} + N_{k}.\tag{10.58}
$$

Finally, the variational posterior distribution $q^{\star}(\pmb{\mu}_{k}, \pmb{\Lambda}_{k})$ does not factorize into the product of the marginals, but we can always use the product rule to write it in the form $q^{\star}({\pmb \mu}_{k}, \pmb \Lambda_{k}) = q^{\star}({\pmb \mu}_{k} | \pmb \Lambda_{k}) q^{\star}(\pmb \Lambda_{k})$ . The two factors can be found by inspecting (10.54) and reading off those terms that involve $\mu_{k}$ and $\mathbf{\Lambda}_{\Lambda_{k}}$ . The result, as expected, is a Gaussian-Wishart distribution and is given by

Exercise 10.13

$$
q^{\star} \left(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}\right) = \mathcal{N} \left(\boldsymbol{\mu}_{k} \mid \mathbf{m}_{k}, \left(\beta_{k} \boldsymbol{\Lambda}_{k}\right)^{- 1}\right) \mathcal{W} \left(\boldsymbol{\Lambda}_{k} \mid \mathbf{W}_{k}, \nu_{k}\right)\tag{10.59}
$$

where we have defined

$$
\beta_{k} = \beta_{0} + N_{k}\tag{10.60}
$$

$$
{\bf m}_{k} = \frac{1}{\beta_{k}}(\beta_{0}{\bf m}_{0} + N_{k} \overline{{\bf x}}_{k})\tag{10.61}
$$

$$
{\mathbf{W}_{k}^{- 1}} ={\mathbf{W}_{0}^{- 1} + N_{k} \mathbf{S}_{k} + \frac{\beta_{0} N_{k}}{\beta_{0} + N_{k}}(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{0})(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{0})^{\mathrm{T}}}\tag{10.62}
$$

$$
\nu_{k} = \nu_{0} + N_{k}.\tag{10.63}
$$

These update equations are analogous to the M-step equations of the EM algorithm for the maximum likelihood solution of the mixture of Gaussians. We see that the computations that must be performed in order to update the variational posterior distribution over the model parameters involve evaluation of the same sums over the data set, as arose in the maximum likelihood treatment.

In order to perform this variational M step, we need the expectations $\mathbb{E}[z_{nk}] =$ $r_{nk}$ representing the responsibilities. These are obtained by normalizing the $\rho_{nk}$ that are given by (10.46). We see that this expression involves expectations with respect to the variational distributions of the parameters, and these are easily evaluated to give

Exercise 10.14

$$
\begin{array}{rl} &{\mathbb{E}_{\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}} \left[(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k}) \right]} \\ &{\quad = D \beta_{k}^{- 1} + \nu_{k}(\mathbf{x}_{n} - \mathbf{m}_{k})^{\mathrm{T}} \mathbf{W}_{k}(\mathbf{x}_{n} - \mathbf{m}_{k})} \end{array}\tag{10.64}
$$

$$
\ln \widetilde{\Lambda}_{k} \equiv \mathbb{E} \left[\ln | \boldsymbol{\Lambda}_{k} | \right] = \sum_{i = 1}^{D} \psi \left(\frac{\nu_{k} + 1 - i}{2}\right) + D \ln 2 + \ln | \mathbf{W}_{k} |\tag{10.65}
$$

$$
\ln \widetilde{\pi}_{k} \equiv \mathbb{E} \left[\ln \pi_{k} \right] = \psi(\alpha_{k}) - \psi(\widehat{\alpha})\tag{10.66}
$$

where we have introduced definitions of $\widetilde{\Lambda}_{k}$ and $\widetilde{\pi}_{k}.$ , and $\psi(\cdot)$ is the digamma function defined by (B.25), with $\widehat{\alpha} = \textstyle \sum_{k} \alpha_{k}$ . The results (10.65) and (10.66) follow from the standard properties of the Wishart and Dirichlet distributions.

If we substitute (10.64), (10.65), and (10.66) into (10.46) and make use of (10.49), we obtain the following result for the responsibilities

$$
r_{nk} \propto \widetilde{\pi}_{k} \widetilde{\Lambda}_{k}^{1 / 2} \exp \left\{- \frac{D}{2 \beta_{k}} - \frac{\nu_{k}}{2}(\mathbf{x}_{n} - \mathbf{m}_{k})^{\mathrm{T}} \mathbf{W}_{k}(\mathbf{x}_{n} - \mathbf{m}_{k}) \right\}.\tag{10.67}
$$

Notice the similarity to the corresponding result for the responsibilities in maximum likelihood EM, which from (9.13) can be written in the form

$$
r_{nk} \propto \pi_{k} | \boldsymbol{\Lambda}_{k} |^{1 / 2} \exp \left\{- \frac{1}{2}(\mathbf{x}_{n} - \pmb{\mu}_{k})^{\mathrm{T}} \pmb{\Lambda}_{k}(\mathbf{x}_{n} - \pmb{\mu}_{k}) \right\}\tag{10.68}
$$

where we have used the precision in place of the covariance to highlight the similarity to (10.67).

Thus the optimization of the variational posterior distribution involves cycling between two stages analogous to the E and M steps of the maximum likelihood EM algorithm. In the variational equivalent of the E step, we use the current distributions over the model parameters to evaluate the moments in (10.64), (10.65), and (10.66) and hence evaluate $\mathbb{E}[z_{nk}] = r_{nk}$ . Then in the subsequent variational equivalent of the M step, we keep these responsibilities fixed and use them to re-compute the variational distribution over the parameters using (10.57) and (10.59). In each case, we see that the variational posterior distribution has the same functional form as the corresponding factor in the joint distribution (10.41). This is a general result and is a consequence of the choice of conjugate distributions.

Figure 10.6 shows the results of applying this approach to the rescaled Old Faithful data set for a Gaussian mixture model having $K = 6$ components. We see that after convergence, there are only two components for which the expected values of the mixing coefficients are numerically distinguishable from their prior values. This effect can be understood qualitatively in terms of the automatic trade-off in a Bayesian model between fitting the data and the complexity of the model, in which the complexity penalty arises from components whose parameters are pushed away from their prior values. Components that take essentially no responsibility for explaining the data points have $r_{nk} \simeq 0$ and hence $N_{k} \simeq 0$ . From (10.58), we see that $\alpha_{k} \simeq \alpha_{0}$ and from (10.60)–(10.63) we see that the other parameters revert to their prior values. In principle such components are fitted slightly to the data points, but for broad priors this effect is too small to be seen numerically. For the variational Gaussian mixture model the expected values of the mixing coefficients in the posterior distribution are given by

$$
\mathbb{E}[\pi_{k}] = \frac{\alpha_{k} + N_{k}}{K \alpha_{0} + N}.\tag{10.69}
$$

Consider a component for which $N_{k} \simeq 0$ and $\alpha_{k} \simeq \alpha_{0}$ . If the prior is broad so that $\alpha_{0} 0$ , then $\bar{\mathbb{E}[\pi_{k}]} \to 0$ and the component plays no role in the model, whereas if the prior tightly constrains the mixing coefficients so that $\alpha_{0} \infty,$ , then $\mathbb{E}[\pi_{k}] \to$ $1 / K$

Figure 10.6 Variational Bayesian mixture of $K \ = \6$ Gaussians applied to the Old Faithful data set, in which the ellipses denote the one standard-deviation density contours for each of the components, and the density of red ink inside each ellipse corresponds to the mean value of the mixing coefficient for each component. The number in the top left of each diagram shows the number of iterations of variational inference. Components whose expected mixing coefficient are numerically indistinguishable from zero are not plotted.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/f42f57b728572e288778e43bc5ac5acf12b8388d39b0f83838a9653b5b35cc47.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/2bff17d43662631d5abf6d95d9473a7a9788bb64dc4828bd628566b5d8a55b73.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/d878290bcae954f289022e398a81f015dcd6fbda4385cad060d0916cfcda87c5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/aa7b17ca1e4a8727f77230c6429fb3fa1bf13af4e3b9562174294f9c151fc449.jpg)

In Figure 10.6, the prior over the mixing coefficients is a Dirichlet of the form (10.39). Recall from Figure 2.5 that for $\alpha_{0} < 1$ the prior favours solutions in which some of the mixing coefficients are zero. Figure 10.6 was obtained using $\alpha_{0} = 10^{- 3}$ and resulted in two components having nonzero mixing coefficients. If instead we choose $\alpha_{0} = 1$ we obtain three components with nonzero mixing coefficients, and for $\alpha = 10$ all six components have nonzero mixing coefficients.

As we have seen there is a close similarity between the variational solution for the Bayesian mixture of Gaussians and the EM algorithm for maximum likelihood. In fact if we consider the limit $N \to \infty$ then the Bayesian treatment converges to the maximum likelihood EM algorithm. For anything other than very small data sets, the dominant computational cost of the variational algorithm for Gaussian mixtures arises from the evaluation of the responsibilities, together with the evaluation and inversion of the weighted data covariance matrices. These computations mirror precisely those that arise in the maximum likelihood EM algorithm, and so there is little computational overhead in using this Bayesian approach as compared to the traditional maximum likelihood one. There are, however, some substantial advantages. First of all, the singularities that arise in maximum likelihood when a Gaussian component ‘collapses’ onto a specific data point are absent in the Bayesian treatment.

Section 10.2.4

Indeed, these singularities are removed if we simply introduce a prior and then use a MAP estimate instead of maximum likelihood. Furthermore, there is no over-fitting if we choose a large number K of components in the mixture, as we saw in Figure 10.6. Finally, the variational treatment opens up the possibility of determining the optimal number of components in the mixture without resorting to techniques such as cross validation.

## 10.2.2 Variational lower bound

We can also straightforwardly evaluate the lower bound (10.3) for this model. In practice, it is useful to be able to monitor the bound during the re-estimation in order to test for convergence. It can also provide a valuable check on both the mathematical expressions for the solutions and their software implementation, because at each step of the iterative re-estimation procedure the value of this bound should not decrease. We can take this a stage further to provide a deeper test of the correctness of both the mathematical derivation of the update equations and of their software implementation by using finite differences to check that each update does indeed give a (constrained) maximum of the bound (Svensen and Bishop, 2004). ´

For the variational mixture of Gaussians, the lower bound (10.3) is given by

$$
\begin{array}{rcl} \mathcal{L} & = & \sum_{\mathbf{Z}} \iiint q(\mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) \ln \left\{\frac{p(\mathbf{X}, \mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda})}{q(\mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda})} \right\} d \boldsymbol{\pi} d \boldsymbol{\mu} d \boldsymbol{\Lambda} \\ & = & \mathbb{E}[\ln p(\mathbf{X}, \mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] - \mathbb{E}[\ln q(\mathbf{Z}, \boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] \\ & = & \mathbb{E}[\ln p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] + \mathbb{E}[\ln p(\mathbf{Z} | \boldsymbol{\pi})] + \mathbb{E}[\ln p(\boldsymbol{\pi})] + \mathbb{E}[\ln p(\boldsymbol{\mu}, \boldsymbol{\Lambda})] \\ & & - \mathbb{E}[\ln q(\mathbf{Z})] - \mathbb{E}[\ln q(\boldsymbol{\pi})] - \mathbb{E}[\ln q(\boldsymbol{\mu}, \boldsymbol{\Lambda})] \end{array} \tag{10}\tag{10.70}
$$

where, to keep the notation uncluttered, we have omitted the ★ superscript on the $q$ distributions, along with the subscripts on the expectation operators because each expectation is taken with respect to all of the random variables in its argument. The various terms in the bound are easily evaluated to give the following results

$$
\begin{array}{c} \mathbb{E}[\ln p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] = \frac{1}{2} \sum_{k = 1}^{K} N_{k} \left\{\ln \widetilde{\Lambda}_{k} - D \beta_{k}^{- 1} - \nu_{k} \mathrm{Tr}(\mathbf{S}_{k} \mathbf{W}_{k}) \right.\\ \left.- \nu_{k}(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{k})^{\mathrm{T}} \mathbf{W}_{k}(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{k}) - D \ln(2 \pi) \right\} \end{array}\tag{10.71}
$$

$$
\mathbb{E}[\ln p(\mathbf{Z} | \boldsymbol{\pi})] = \sum_{n = 1}^{N} \sum_{k = 1}^{K} r_{nk} \ln \widetilde{\pi}_{k}\tag{10.72}
$$

$$
\mathbb{E}[\ln p(\boldsymbol{\pi})] = \ln C(\boldsymbol{\alpha}_{0}) +(\alpha_{0} - 1) \sum_{k = 1}^{K} \ln \widetilde{\pi}_{k}\tag{10.73}
$$

$$
\begin{array}{l} \mathbb{E}[\ln p(\boldsymbol{\mu}, \boldsymbol{\Lambda})] = \frac{1}{2} \sum_{k = 1}^{K} \Bigg \{D \ln(\beta_{0} / 2 \pi) + \ln \widetilde{\Lambda}_{k} - \frac{D \beta_{0}}{\beta_{k}} \\ \qquad - \beta_{0} \nu_{k}(\mathbf{m}_{k} - \mathbf{m}_{0})^{\mathrm{T}} \mathbf{W}_{k}(\mathbf{m}_{k} - \mathbf{m}_{0}) \Bigg\} + K \ln B(\mathbf{W}_{0}, \nu_{0}) \\ \qquad + \frac{(\nu_{0} - D - 1)}{2} \sum_{k = 1}^{K} \ln \widetilde{\Lambda}_{k} - \frac{1}{2} \sum_{k = 1}^{K} \nu_{k} \operatorname{Tr}(\mathbf{W}_{0}^{- 1} \mathbf{W}_{k}) \end{array}\tag{10.74}
$$

$$
\mathbb{E}[\ln q(\mathbf{Z})] = \sum_{n = 1}^{N} \sum_{k = 1}^{K} r_{nk} \ln r_{nk}\tag{10.75}
$$

$$
\mathbb{E}[\ln q(\boldsymbol{\pi})] = \sum_{k = 1}^{K}(\alpha_{k} - 1) \ln \widetilde{\pi}_{k} + \ln C(\boldsymbol{\alpha})\tag{10.76}
$$

$$
\mathbb{E}[\ln q(\pmb{\mu}, \pmb{\Lambda})] = \sum_{k = 1}^{K} \left\{\frac{1}{2} \ln \widetilde{\Lambda}_{k} + \frac{D}{2} \ln \left(\frac{\beta_{k}}{2 \pi}\right) - \frac{D}{2} - \mathrm{H}[q(\pmb{\Lambda}_{k})] \right\}\tag{10.77}
$$

where $D$ is the dimensionality of $\mathbf{x}, \mathrm{H}[q(\pmb{\Lambda}_{k})]$ is the entropy of the Wishart distribution given by (B.82), and the coefficients $C(\alpha)$ and $B({\mathbf W}, \nu)$ are defined by (B.23) <sup>W</sup>and (B.79), respectively. Note that the terms involving expectations of the logs of the $q$ distributions simply represent the negative entropies of those distributions. Some simplifications and combination of terms can be performed when these expressions are summed to give the lower bound. However, we have kept the expressions separate for ease of understanding.

Finally, it is worth noting that the lower bound provides an alternative approach for deriving the variational re-estimation equations obtained in Section 10.2.1. To do this we use the fact that, since the model has conjugate priors, the functional form of the factors in the variational posterior distribution is known, namely discrete for $\mathbf{Z},$ Dirichlet for $\pi,$ , and Gaussian-Wishart for $(\mu_{k}, \Lambda_{k})$ . By taking general parametric <sup>Λ</sup>forms for these distributions we can derive the form of the lower bound as a function of the parameters of the distributions. Maximizing the bound with respect to these parameters then gives the required re-estimation equations.

## 10.2.3 Predictive density

In applications of the Bayesian mixture of Gaussians model we will often be interested in the predictive density for a new value $\widehat{\mathbf{x}}$ of the observed variable. ${\mathrm{As}} -$ <sup>x</sup>sociated with this observation will be a corresponding latent variable ${\widehat{\mathbf{z}}},$ and the predictive density is then given by

$$
p(\widehat{\mathbf{x}} | \mathbf{X}) = \sum_{\widehat{\mathbf{z}}} \iiint p(\widehat{\mathbf{x}} | \widehat{\mathbf{z}}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) p(\widehat{\mathbf{z}} | \boldsymbol{\pi}) p(\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda} | \mathbf{X}) d \boldsymbol{\pi} d \boldsymbol{\mu} d \boldsymbol{\Lambda}\tag{10.78}
$$

where $p(\pi, \mu, \mathbf{A} | \mathbf{X})$ is the (unknown) true posterior distribution of the parameters. Using (10.37) and (10.38) we can first perform the summation over $\widehat{\mathbf{z}}$ to give

$$
p(\widehat{\mathbf{x}} | \mathbf{X}) = \sum_{k = 1}^{K} \iiint \pi_{k} \mathcal{N} \left(\widehat{\mathbf{x}} | \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}^{- 1}\right) p(\boldsymbol{\pi}, \boldsymbol{\mu}, \boldsymbol{\Lambda} | \mathbf{X}) d \boldsymbol{\pi} d \boldsymbol{\mu} d \boldsymbol{\Lambda}.\tag{10.79}
$$

Because the remaining integrations are intractable, we approximate the predictive density by replacing the true posterior distribution $p(\pi, \mu, \mathbf{\Delta} \mathbf{\Delta} \mathbf{\Delta})$ with its variational approximation $q(\pi) q(\pmb{\mu}, \pmb{\Lambda})$ to give

$$
p(\widehat{\mathbf{x}} | \mathbf{X}) = \sum_{k = 1}^{K} \iiint \pi_{k} \mathcal{N} \left(\widehat{\mathbf{x}} | \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}^{- 1}\right) q(\boldsymbol{\pi}) q(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) d \boldsymbol{\pi} d \boldsymbol{\mu}_{k} d \boldsymbol{\Lambda}_{k}\tag{10.80}
$$

where we have made use of the factorization (10.55) and in each term we have implicitly integrated out all variables $\{\mu_{j}, \pmb{\Lambda}_{j}\}$ for $j \neq k$ The remaining integrations <sup>Λ</sup>can now be evaluated analytically giving a mixture of Student’s t-distributions

$$
p(\widehat{\mathbf{x}} | \mathbf{X}) = \frac{1}{\widehat{\alpha}} \sum_{k = 1}^{K} \alpha_{k} \mathrm{St}(\widehat{\mathbf{x}} | \mathbf{m}_{k}, \mathbf{L}_{k}, \nu_{k} + 1 - D)\tag{10.81}
$$

in which the $k^{\mathrm{th}}$ component has mean $\mathbf{m}_{k}$ , and the precision is given by

$$
\mathbf{L}_{k} = \frac{(\nu_{k} + 1 - D) \beta_{k}}{(1 + \beta_{k})} \mathbf{W}_{k}\tag{10.82}
$$

in which $\nu_{k}$ is given by (10.63). When the size N of the data set is large the predictive distribution (10.81) reduces to a mixture of Gaussians.

## 10.2.4 Determining the number of components

We have seen that the variational lower bound can be used to determine a posterior distribution over the number K of components in the mixture model. There is, however, one subtlety that needs to be addressed. For any given setting of the parameters in a Gaussian mixture model (except for specific degenerate settings), there will exist other parameter settings for which the density over the observed variables will be identical. These parameter values differ only through a re-labelling of the components. For instance, consider a mixture of two Gaussians and a single observed variable x, in which the parameters have the values $\pi_{1} = a, \pi_{2} = b, \mu_{1} = c.$ $\mu_{2} = d, \sigma_{1} = e, \sigma_{2} = f$ . Then the parameter values $\pi_{1} = b, \pi_{2} = a, \mu_{1} = d.$ $\mu_{2} = c, \sigma_{1} = f, \sigma_{2} = e.$ , in which the two components have been exchanged, will by symmetry give rise to the same value of $p(x)$ . If we have a mixture model comprising K components, then each parameter setting will be a member of a family of K! equivalent settings.

In the context of maximum likelihood, this redundancy is irrelevant because the parameter optimization algorithm (for example EM) will, depending on the initialization of the parameters, find one specific solution, and the other equivalent solutions play no role. In a Bayesian setting, however, we marginalize over all possible

Plot of the variational lower bound versus the number K of components in the Gaussian mixture model, for the Old Faithful data, showing a distinct peak at $K =$ 2 components. For each value of $K$ , the model is trained from 100 different random starts, and the results shown as $" + "$ symbols plotted with small random horizontal perturbations so that they can be distinguished. Note that some solutions find suboptimal local maxima, but that this happens infrequently.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/3248d2e04bbe6245d561fc7447b7208c7add69e4378379d008bf1029cbf70d89.jpg)

parameter values. We have seen in Figure 10.2 that if the true posterior distribution is multimodal, variational inference based on the minimization of $\mathrm{KL}(q \| p)$ will tend to approximate the distribution in the neighbourhood of one of the modes and ignore the others. Again, because equivalent modes have equivalent predictive densities, this is of no concern provided we are considering a model having a specific number K of components. If, however, we wish to compare different values of K, then we need to take account of this multimodality. A simple approximate solution is to add a term ln K! onto the lower bound when used for model comparison and averaging.

Figure 10.7 shows a plot of the lower bound, including the multimodality factor, versus the number K of components for the Old Faithful data set. It is worth emphasizing once again that maximum likelihood would lead to values of the likelihood function that increase monotonically with K (assuming the singular solutions have been avoided, and discounting the effects of local maxima) and so cannot be used to determine an appropriate model complexity. By contrast, Bayesian inference automatically makes the trade-off between model complexity and fitting the data.

This approach to the determination of K requires that a range of models having different K values be trained and compared. An alternative approach to determining a suitable value for K is to treat the mixing coefficients π as parameters and make point estimates of their values by maximizing the lower bound (Corduneanu and Bishop, 2001) with respect to $\pi$ instead of maintaining a probability distribution over them as in the fully Bayesian approach. This leads to the re-estimation equation

$$
\pi_{k} = \frac{1}{N} \sum_{n = 1}^{N} r_{nk}\tag{10.83}
$$

and this maximization is interleaved with the variational updates for the $q$ distribution over the remaining parameters. Components that provide insufficient contribution to explaining the data will have their mixing coefficients driven to zero during the optimization, and so they are effectively removed from the model through automatic relevance determination. This allows us to make a single training run in which we start with a relatively large initial value of K, and allow surplus components to be pruned out of the model. The origins of the sparsity when optimizing with respect to hyperparameters is discussed in detail in the context of the relevance vector machine.

## 10.2.5 Induced factorizations

In deriving these variational update equations for the Gaussian mixture model, we assumed a particular factorization of the variational posterior distribution given by (10.42). However, the optimal solutions for the various factors exhibit additional factorizations. In particular, the solution for $q^{\star}(\pmb{\mu}, \pmb{\Lambda})$ is given by the product of an independent distribution $q^{\star}(\pmb{\mu}_{k}, \pmb{\Lambda}_{k})$ <sup>Λ</sup>over each of the components k of the mixture, whereas the variational posterior distribution $q^{\star}(\mathbf{Z})$ over the latent variables, given <sup>Z</sup>by (10.48), factorizes into an independent distribution ${{q}^{\star}}({\bf{z}}_{n})$ for each observation n (note that it does not further factorize with respect to k because, for each value of $n_{\mathrm{:}}$ the $z_{nk}$ are constrained to sum to one over k). These additional factorizations are a consequence of the interaction between the assumed factorization and the conditional independence properties of the true distribution, as characterized by the directed graph in Figure 10.5.

We shall refer to these additional factorizations as induced factorizations because they arise from an interaction between the factorization assumed in the variational posterior distribution and the conditional independence properties of the true joint distribution. In a numerical implementation of the variational approach it is important to take account of such additional factorizations. For instance, it would be very inefficient to maintain a full precision matrix for the Gaussian distribution over a set of variables if the optimal form for that distribution always had a diagonal precision matrix (corresponding to a factorization with respect to the individual variables described by that Gaussian).

Such induced factorizations can easily be detected using a simple graphical test based on d-separation as follows. We partition the latent variables into three disjoint groups , ,  and then let us suppose that we are assuming a factorization between <sup>A B C</sup> and the remaining latent variables, so that

$$
q(\mathbf{A}, \mathbf{B}, \mathbf{C}) = q(\mathbf{A}, \mathbf{B}) q(\mathbf{C}).\tag{10.84}
$$

Using the general result (10.9), together with the product rule for probabilities, we see that the optimal solution for $q(\mathbf{A}, \mathbf{B})$ is given by

$$
\begin{array}{rcl} \ln q^{\star}(\mathbf{A}, \mathbf{B}) & = & \mathbb{E}_{\mathbf{C}}[\ln p(\mathbf{X}, \mathbf{A}, \mathbf{B}, \mathbf{C})] + \mathrm{const} \\ & = & \mathbb{E}_{\mathbf{C}}[\ln p(\mathbf{A}, \mathbf{B} | \mathbf{X}, \mathbf{C})] + \mathrm{const}.\end{array}\tag{10.85}
$$

We now ask whether this resulting solution will factorize between  and , in other words whether $q^{\star}({\bf A},{\bf B}) = q^{\star}({\bf A}) q^{\star}({\bf B})$ <sup>A B</sup>. This will happen if, and only if, ln $p(\mathbf{A}, \mathbf{B} | \mathbf{X}, \mathbf{C}) = \ln p(\mathbf{A} | \mathbf{X}, \mathbf{C}) + \ln p(\mathbf{B} | \mathbf{X}, \mathbf{C})$ , that is, if the conditional independence relation

$$
\mathbf{A} \perp \perp \mathbf{B} | \mathbf{X}, \mathbf{C}\tag{10.86}
$$

is satisfied. We can test to see if this relation does hold, for any choice of and by making use of the d-separation criterion.

To illustrate this, consider again the Bayesian mixture of Gaussians represented by the directed graph in Figure 10.5, in which we are assuming a variational factorization given by (10.42). We can see immediately that the variational posterior distribution over the parameters must factorize between $\pi$ and the remaining parameters $\pmb{\mu}$ and because all paths connecting $\pi$ to either $\pmb{\mu}$ or must pass through <sup>Λ</sup>one of the nodes $\mathbf{z}_{n}$ <sup>Λ</sup>all of which are in the conditioning set for our conditional independence test and all of which are head-to-tail with respect to such paths.

## 10.3. Variational Linear Regression

As a second illustration of variational inference, we return to the Bayesian linear regression model of Section 3.3. In the evidence framework, we approximated the integration over $\alpha$ and $\beta$ by making point estimates obtained by maximizing the log marginal likelihood. A fully Bayesian approach would integrate over the hyperparameters as well as over the parameters. Although exact integration is intractable, we can use variational methods to find a tractable approximation. In order to simplify the discussion, we shall suppose that the noise precision parameter $\beta$ is known, and is fixed to its true value, although the framework is easily extended to include the distribution over $\beta.$ For the linear regression model, the variational treatment will turn out to be equivalent to the evidence framework. Nevertheless, it provides a good exercise in the use of variational methods and will also lay the foundation for variational treatment of Bayesian logistic regression in Section 10.6.

Recall that the likelihood function for , and the prior over , are given by

$$
p(\mathbf{t} | \mathbf{w}) = \prod_{n = 1}^{N} \mathcal{N}(t_{n} | \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1})\tag{10.87}
$$

$$
{p(\mathbf{w} | \alpha)} ={\mathcal{N}(\mathbf{w} | \mathbf{0}, \alpha^{- 1} \mathbf{I})}\tag{10.88}
$$

where $\phi_{n} = \phi(\mathbf{x}_{n})$ . We now introduce a prior distribution over α. From our dis-<sup>x</sup>cussion in Section 2.3.6, we know that the conjugate prior for the precision of a Gaussian is given by a gamma distribution, and so we choose

$$
p(\alpha) = \operatorname{Gam}(\alpha | a_{0}, b_{0})\tag{10.89}
$$

where $\mathrm{Gam}(\cdot | \cdot, \cdot)$ is defined by (B.26). Thus the joint distribution of all the variables is given by

$$
p(\mathbf{t}, \mathbf{w}, \alpha) = p(\mathbf{t} | \mathbf{w}) p(\mathbf{w} | \alpha) p(\alpha).\tag{10.90}
$$

This can be represented as a directed graphical model as shown in Figure 10.8.

## 10.3.1 Variational distribution

Our first goal is to find an approximation to the posterior distribution $p(\mathbf{w}, \alpha \vert \mathbf{t})$ To do this, we employ the variational framework of Section 10.1, with a variational

Figure 10.8 Probabilistic graphical model representing the joint distribution (10.90) for the Bayesian linear regression model.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/d846c34f63fcbea6bfce1e5b79bfc7dc70606dde9807045db415e98d9332d997.jpg)

posterior distribution given by the factorized expression

$$
q(\mathbf{w}, \alpha) = q(\mathbf{w}) q(\alpha).\tag{10.91}
$$

We can find re-estimation equations for the factors in this distribution by making use of the general result (10.9). Recall that for each factor, we take the log of the joint distribution over all variables and then average with respect to those variables not in that factor. Consider first the distribution over α. Keeping only terms that have a functional dependence on α, we have

$$
\begin{array}{rl} &{\ln q^{\star}(\alpha) = \ln p(\alpha) + \mathbb{E}_{\mathbf{w}}[\ln p(\mathbf{w} | \alpha)] + \mathrm{const}} \\ &{\quad =(a_{0} - 1) \ln \alpha - b_{0} \alpha + \frac{M}{2} \ln \alpha - \frac{\alpha}{2} \mathbb{E}[\mathbf{w}^{\mathrm{T}} \mathbf{w}] + \mathrm{const}.} \end{array}\tag{10.92}
$$

We recognize this as the log of a gamma distribution, and so identifying the coefficients of α and ln α we obtain

$$
q^{\star}(\alpha) = \operatorname{Gam}(\alpha | a_{N}, b_{N})\tag{10.93}
$$

where

$$
a_{N} = a_{0} + \frac{M}{2}\tag{10.94}
$$

$$
{b_{N}} ={b_{0} + \frac{1}{2} \mathbb{E}[\mathbf{w}^{\mathrm{T}} \mathbf{w}].}\tag{10.95}
$$

Similarly, we can find the variational re-estimation equation for the posterior distribution over . Again, using the general result (10.9), and keeping only those terms that have a functional dependence on , we have

$$
\ln q^{\star}(\mathbf{w}) = \ln p(\mathbf{t} | \mathbf{w}) + \mathbb{E}_{\alpha}[\ln p(\mathbf{w} | \alpha)] + \mathrm{const}\tag{10.96}
$$

$$
{=}{- \frac{\beta}{2} \sum_{n = 1}^{N} \{\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n} - t_{n}\}^{2} - \frac{1}{2} \mathbb{E}[\alpha] \mathbf{w}^{\mathrm{T}} \mathbf{w} + \mathrm{const}}\tag{10.97}
$$

$$
{=}{- \frac{1}{2} \mathbf{w}^{\mathrm{T}} \left(\mathbb{E}[\alpha] \mathbf{I} + \beta \pmb{\Phi}^{\mathrm{T}} \pmb{\Phi} \right) \mathbf{w} + \beta \mathbf{w}^{\mathrm{T}} \pmb{\Phi}^{\mathrm{T}} \mathbf{t} + \mathrm{const.}}\tag{10.98}
$$

Because this is a quadratic form, the distribution $q^{\star}(\mathbf{w})$ is Gaussian, and so we can complete the square in the usual way to identify the mean and covariance, giving

$$
q^{\star}(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{N}, \mathbf{S}_{N})\tag{10.99}
$$

where

$$
{\bf m}_{N} = \beta{\bf S}_{N}{\bf \Phi}^{\mathrm{T}}{\bf t}\tag{10.100}
$$

$$
\mathbf{S}_{N} = \left(\mathbb{E}[\alpha] \mathbf{I} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\right)^{- 1}.\tag{10.101}
$$

Note the close similarity to the posterior distribution (3.52) obtained when α was treated as a fixed parameter. The difference is that here α is replaced by its expectation $\mathbb{E}[\alpha]$ under the variational distribution. Indeed, we have chosen to use the same notation for the covariance matrix $\mathbf{S}_{N}$ in both cases.

Using the standard results (B.27), (B.38), and (B.39), we can obtain the required moments as follows

$$
\mathbb{E}[\alpha] = a_{N} / b_{N}\tag{10.102}
$$

$$
{\mathbb{E}[\mathbf{ww}^{\mathrm{T}}]} ={\mathbf{m}_{N} \mathbf{m}_{N}^{\mathrm{T}} + \mathbf{S}_{N}.}\tag{10.103}
$$

The evaluation of the variational posterior distribution begins by initializing the parameters of one of the distributions $q(\mathbf{w})$ or $q(\alpha)$ , and then alternately re-estimates <sup>w</sup>these factors in turn until a suitable convergence criterion is satisfied (usually specified in terms of the lower bound to be discussed shortly).

It is instructive to relate the variational solution to that found using the evidence framework in Section 3.5. To do this consider the case $a_{0} = b_{0} = 0$ , corresponding to the limit of an infinitely broad prior over α. The mean of the variational posterior distribution $q(\alpha)$ is then given by

$$
\mathbb{E}[\alpha] = \frac{a_{N}}{b_{N}} = \frac{M / 2}{\mathbb{E}[\mathbf{w}^{\mathrm{T}} \mathbf{w}] / 2} = \frac{M}{\mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N} + \operatorname{Tr}(\mathbf{S}_{N})}.\tag{10.104}
$$

Comparison with (9.63) shows that in the case of this particularly simple model, the variational approach gives precisely the same expression as that obtained by maximizing the evidence function using EM except that the point estimate for α is replaced by its expected value. Because the distribution $q(\mathbf{w})$ depends on $q(\alpha)$ only through the expectation $\mathbb{E}[\alpha]$ , we see that the two approaches will give identical results for the case of an infinitely broad prior.

## 10.3.2 Predictive distribution

The predictive distribution over t, given a new input , is easily evaluated for <sup>x</sup>this model using the Gaussian variational posterior for the parameters

$$
\begin{array}{rcl} p(t | \mathbf{x}, \mathbf{t}) & = & \int p(t | \mathbf{x}, \mathbf{w}) p(\mathbf{w} | \mathbf{t}) d \mathbf{w} \\ & \simeq & \int p(t | \mathbf{x}, \mathbf{w}) q(\mathbf{w}) d \mathbf{w} \\ & = & \int \mathcal{N}(t | \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}), \beta^{- 1}) \mathcal{N}(\mathbf{w} | \mathbf{m}_{N}, \mathbf{S}_{N}) d \mathbf{w} \\ & = & \mathcal{N}(t | \mathbf{m}_{N}^{\mathrm{T}} \phi(\mathbf{x}), \sigma^{2}(\mathbf{x})) \end{array}\tag{10.105}
$$

where we have evaluated the integral by making use of the result (2.115) for the linear-Gaussian model. Here the input-dependent variance is given by

$$
\sigma^{2}(\mathbf{x}) = \frac{1}{\beta} + \phi(\mathbf{x})^{\mathrm{T}} \mathbf{S}_{N} \phi(\mathbf{x}).\tag{10.106}
$$

Note that this takes the same form as the result (3.59) obtained with fixed α except that now the expected value $\mathbb{E}[\alpha]$ appears in the definition of $\mathbf{S}_{N}$

## 10.3.3 Lower bound

Another quantity of importance is the lower bound  defined by

$$
\begin{array}{rcl} \mathcal{L}(q) & = & \mathbb{E}[\ln p(\mathbf{w}, \alpha, \mathbf{t})] - \mathbb{E}[\ln q(\mathbf{w}, \alpha)] \\ & = & \mathbb{E}_{\mathbf{w}}[\ln p(\mathbf{t} | \mathbf{w})] + \mathbb{E}_{\mathbf{w}, \alpha}[\ln p(\mathbf{w} | \alpha)] + \mathbb{E}_{\alpha}[\ln p(\alpha)] \\ & & - \mathbb{E}_{\alpha}[\ln q(\mathbf{w})]_{\mathbf{w}} - \mathbb{E}[\ln q(\alpha)].\end{array}\tag{10.107}
$$

Exercise 10.27

Evaluation of the various terms is straightforward, making use of results obtained in previous chapters, and gives

$$
\begin{array}{rlr} \mathbb{E}[\ln p(\mathbf{t} | \mathbf{w})]_{\mathbf{w}} & = & \frac{N}{2} \ln \left(\frac{\beta}{2 \pi}\right) - \frac{\beta}{2} \mathbf{t}^{\mathrm{T}} \mathbf{t} + \beta \mathbf{m}_{N}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t} \\ & & - \frac{\beta}{2} \mathrm{Tr} \left[\boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}(\mathbf{m}_{N} \mathbf{m}_{N}^{\mathrm{T}} + \mathbf{S}_{N}) \right] \end{array}\tag{10.108}
$$

$$
\begin{array}{rcl} \mathbb{E}[\ln p(\mathbf{w} | \alpha)]_{\mathbf{w}, \alpha} & = & - \frac{M}{2} \ln(2 \pi) + \frac{M}{2}(\psi(a_{N}) - \ln b_{N}) \\ & & - \frac{a_{N}}{2b_{N}} \left[\mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N} + \operatorname{Tr}(\mathbf{S}_{N}) \right] \end{array}\tag{10.109}
$$

$$
\begin{array}{rcl} \mathbb{E}[\ln p(\alpha)]_{\alpha} & = & a_{0} \ln b_{0} +(a_{0} - 1)[\psi(a_{N}) - \ln b_{N}] \\ & & - b_{0} \frac{a_{N}}{b_{N}} - \ln \Gamma(a_{N}) \end{array}\tag{10.110}
$$

$$
{- \mathbb{E}[\ln q(\mathbf{w})]_{\mathbf{w}}} ={\frac{1}{2} \ln | \mathbf{S}_{N} | + \frac{M}{2}[1 + \ln(2 \pi)]}\tag{10.111}
$$

$$
- \mathbb{E}[\ln q(\alpha)]_{\alpha} = \ln \Gamma(a_{N}) -(a_{N} - 1) \psi(a_{N}) - \ln b_{N} + a_{N}.\tag{10.112}
$$

Figure 10.9 shows a plot of the lower bound $\mathcal{L}(q)$ versus the degree of a polynomial model for a synthetic data set generated from a degree three polynomial. Here the prior parameters have been set to $a_{0} = b_{0} = 0.$ , corresponding to the noninformative prior $p(\alpha) \propto 1 / \alpha$ , which is uniform over ln α as discussed in Section 2.3.6. As we saw in Section 10.1, the quantity $\mathcal{L}$ represents lower bound on the log marginal likelihood $p(\mathfrak{t} | M)$ for the model. If we assign equal prior probabilities $p(M)$ to the different values of $M.$ , then we can interpret $\mathcal{L}$ as an approximation to the posterior model probability $p(M | \mathbf{t})$ . Thus the variational framework assigns the highest probability to the model with $M = 3$ . This should be contrasted with the maximum likelihood result, which assigns ever smaller residual error to models of increasing complexity until the residual error is driven to zero, causing maximum likelihood to favour severely over-fitted models.

Plot of the lower bound versus the order M of the polynomial, for a polynomial model, in which a set of 10 data points is generated from a polynomial with $M \ = \3$ sampled over the interval ( 5, 5) with additive Gaussian noise of variance 0.09. The value of the bound gives the log probability of the model, and we see that the value of the bound peaks at $M = 3$ , corresponding to the true model from which the data set was generated.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/deb24196d478a1c25a679a7e4e239cbc1e395a9e11265b29fec0abe2f2c0510f.jpg)

## 10.4. Exponential Family Distributions

In Chapter 2, we discussed the important role played by the exponential family of distributions and their conjugate priors. For many of the models discussed in this book, the complete-data likelihood is drawn from the exponential family. However, in general this will not be the case for the marginal likelihood function for the observed data. For example, in a mixture of Gaussians, the joint distribution of observations ${\bf x}_{n}$ and corresponding hidden variables $\mathbf{z}_{n}$ is a member of the exponential <sup>x</sup>family, whereas the marginal distribution of ${\bf x}_{n}$ <sup>z</sup>is a mixture of Gaussians and hence is not.

Up to now we have grouped the variables in the model into observed variables and hidden variables. We now make a further distinction between latent variables, denoted , and parameters, denoted $\theta,$ where parameters are intensive (fixed in number independent of the size of the data set), whereas latent variables are extensive (scale in number with the size of the data set). For example, in a Gaussian mixture model, the indicator variables $z_{kn}$ (which specify which component k is responsible for generating data point $\mathbf{x}_{n})$ represent the latent variables, whereas the means $\pmb{\mu}_{k}$ precisions $\mathbf{\Lambda}_{\Lambda_{k}}$ and mixing proportions $\pi_{k}$ represent the parameters.

<sup>Λ</sup>Consider the case of independent identically distributed data. We denote the data values by ${\bf X} = \{{\bf x}_{n}\}$ , where $n = 1, \ldots N$ , with corresponding latent variables ${\bf Z} = \{{\bf z}_{n}\}$ . Now suppose that the joint distribution of observed and latent variables <sup>Z z</sup>is a member of the exponential family, parameterized by natural parameters η so that

$$
p(\mathbf{X}, \mathbf{Z} | \boldsymbol{\eta}) = \prod_{n = 1}^{N} h(\mathbf{x}_{n}, \mathbf{z}_{n}) g(\boldsymbol{\eta}) \exp \left\{\boldsymbol{\eta}^{\mathrm{T}} \mathbf{u}(\mathbf{x}_{n}, \mathbf{z}_{n}) \right\}.\tag{10.113}
$$

We shall also use a conjugate prior for η, which can be written as

$$
p(\boldsymbol{\eta} | \nu_{0}, \mathbf{v}_{0}) = f(\nu_{0}, \boldsymbol{\chi}_{0}) g(\boldsymbol{\eta})^{\nu_{0}} \exp \left\{\nu_{o} \boldsymbol{\eta}^{\mathrm{T}} \boldsymbol{\chi}_{0} \right\}.\tag{10.114}
$$

Recall that the conjugate prior distribution can be interpreted as a prior number $\nu_{0}$ of observations all having the value $x_{0}$ for the vector. Now consider a variational distribution that factorizes between the latent variables and the parameters, so that $q({\bf Z}, \eta) = q({\bf Z}) q(\eta)$ . Using the general result (10.9), we can solve for the two factors as follows

$$
\begin{array}{rcl} \ln q^{\star}(\mathbf{Z}) & = & \mathbb{E}_{\boldsymbol{\eta}}[\ln p(\mathbf{X}, \mathbf{Z} | \boldsymbol{\eta})] + \text{const} \\ & = & \sum_{n = 1}^{N} \left\{\ln h(\mathbf{x}_{n}, \mathbf{z}_{n}) + \mathbb{E}[\boldsymbol{\eta}^{\mathrm{T}}] \mathbf{u}(\mathbf{x}_{n}, \mathbf{z}_{n}) \right\} + \text{const}.\end{array}\tag{10.115}
$$

Thus we see that this decomposes into a sum of independent terms, one for each value of $n,$ and hence the solution for $q^{\star}(\mathbf{Z})$ will factorize over $n$ so that ${\boldsymbol{q}}^{\star}(\mathbf{Z}) =$ $\prod_{n} q^{\star}(\mathbf{z}_{n})$ <sup>Z Z</sup>. This is an example of an induced factorization. Taking the exponential of both sides, we have

$$
q^{\star}(\mathbf{z}_{n}) = h(\mathbf{x}_{n}, \mathbf{z}_{n}) g \left(\mathbb{E}[\boldsymbol{\eta}]\right) \exp \left\{\mathbb{E}[\boldsymbol{\eta}^{\mathrm{T}}] \mathbf{u}(\mathbf{x}_{n}, \mathbf{z}_{n}) \right\}\tag{10.116}
$$

where the normalization coefficient has been re-instated by comparison with the standard form for the exponential family.

Similarly, for the variational distribution over the parameters, we have

$$
\ln q^{\star}(\pmb{\eta}) = \ln p(\pmb{\eta} | \nu_{0}, \pmb{\chi}_{0}) + \mathbb{E}_{\mathbf{Z}}[\ln p(\mathbf{X}, \mathbf{Z} | \pmb{\eta})] + \mathrm{const}\tag{10.117}
$$

$$
= \nu_{0} \ln g(\boldsymbol{\eta}) + \boldsymbol{\eta}^{\mathrm{T}} \boldsymbol{\chi}_{0} + \sum_{n = 1}^{N} \left\{\ln g(\boldsymbol{\eta}) + \boldsymbol{\eta}^{\mathrm{T}} \mathbb{E}_{\mathbf{z}_{n}}[\mathbf{u}(\mathbf{x}_{n}, \mathbf{z}_{n})] \right\} + \text{const.}\tag{10.118}
$$

Again, taking the exponential of both sides, and re-instating the normalization coefficient by inspection, we have

$$
q^{\star}(\boldsymbol{\eta}) = f \left(\nu_{N}, \boldsymbol{\chi}_{N}\right) g(\boldsymbol{\eta})^{\nu_{N}} \exp \left\{\boldsymbol{\eta}^{\mathrm{T}} \boldsymbol{\chi}_{N} \right\}\tag{10.119}
$$

where we have defined

$$
\nu_{N} = \nu_{0} + N\tag{10.120}
$$

$$
\chi_{N} = \chi_{0} + \sum_{n = 1}^{N} \mathbb{E}_{\mathbf{z}_{n}}[\mathbf{u}(\mathbf{x}_{n}, \mathbf{z}_{n})].\tag{10.121}
$$

Note that the solutions for $q^{\star}({\bf z}_{n})$ and $q^{\star}(\eta)$ are coupled, and so we solve them iteratively in a two-stage procedure. In the variational E step, we evaluate the expected sufficient statistics $\mathbb{E}[{\bf u}({\bf x}_{n},{\bf z}_{n})]$ using the current posterior distribution $q(\mathbf{z}_{n})$ over the latent variables and use this to compute a revised posterior distribution $q(\eta)$ over the parameters. Then in the subsequent variational M step, we use this revised parameter posterior distribution to find the expected natural parameters $\mathbb{E}[\eta^{\mathrm{T}}]$ , which gives rise to a revised variational distribution over the latent variables.

## 10.4.1 Variational message passing

We have illustrated the application of variational methods by considering a specific model, the Bayesian mixture of Gaussians, in some detail. This model can be described by the directed graph shown in Figure 10.5. Here we consider more generally the use of variational methods for models described by directed graphs and derive a number of widely applicable results.

The joint distribution corresponding to a directed graph can be written using the decomposition

$$
p(\mathbf{x}) = \prod_{i} p(\mathbf{x}_{i} | \mathrm{pa}_{i})\tag{10.122}
$$

where $\mathbf{x}_{i}$ denotes the variable(s) associated with node $i,$ and $\mathrm{pa}_{i}$ denotes the parent set corresponding to node i. Note that $\mathbf{x}_{i}$ may be a latent variable or it may belong to the set of observed variables. Now consider a variational approximation in which the distribution $q(\mathbf{x})$ is assumed to factorize with respect to the $\mathbf{x}_{i}$ so that

$$
q(\mathbf{x}) = \prod_{i} q_{i}(\mathbf{x}_{i}).\tag{10.123}
$$

Note that for observed nodes, there is no factor $q(\mathbf{x}_{i})$ in the variational distribution. <sup>x</sup>We now substitute (10.122) into our general result (10.9) to give

$$
\ln q_{j}^{\star}(\mathbf{x}_{j}) = \mathbb{E}_{i \neq j} \left[\sum_{i} \ln p(\mathbf{x}_{i} | \mathrm{pa}_{i}) \right] + \text{const.}\tag{10.124}
$$

Any terms on the right-hand side that do not depend on $\mathbf{x}_{j}$ can be absorbed into <sup>x</sup>the additive constant. In fact, the only terms that do depend on $\mathbf{x}_{j}$ are the conditional distribution for $\mathbf{x}_{j}$ given by $p(\mathbf{x}_{j} | \mathrm{pa}_{j})$ <sup>x</sup>together with any other conditional distributions that have $\mathbf{x}_{j}$ <sup>x</sup>in the conditioning set. By definition, these conditional <sup>x</sup>distributions correspond to the children of node $j$ , and they therefore also depend on the co-parents of the child nodes, i.e., the other parents of the child nodes besides node $\mathbf{x}_{j}$ itself. We see that the set of all nodes on which $q^{\star}(\mathbf{x}_{j})$ depends corresponds <sup>x</sup>to the Markov blanket of node $\mathbf{x}_{j}$ <sup>x</sup>, as illustrated in Figure 8.26. Thus the update of the factors in the variational posterior distribution represents a local calculation on the graph. This makes possible the construction of general purpose software for variational inference in which the form of the model does not need to be specified in advance (Bishop et al., 2003).

If we now specialize to the case of a model in which all of the conditional distributions have a conjugate-exponential structure, then the variational update procedure can be cast in terms of a local message passing algorithm (Winn and Bishop, 2005). In particular, the distribution associated with a particular node can be updated once that node has received messages from all of its parents and all of its children. This in turn requires that the children have already received messages from their coparents. The evaluation of the lower bound can also be simplified because many of the required quantities are already evaluated as part of the message passing scheme. This distributed message passing formulation has good scaling properties and is well suited to large networks.

## 10.5. Local Variational Methods

The variational framework discussed in Sections 10.1 and 10.2 can be considered a ‘global’ method in the sense that it directly seeks an approximation to the full posterior distribution over all random variables. An alternative ‘local’ approach involves finding bounds on functions over individual variables or groups of variables within a model. For instance, we might seek a bound on a conditional distribution $p(y | x)$ which is itself just one factor in a much larger probabilistic model specified by a directed graph. The purpose of introducing the bound of course is to simplify the resulting distribution. This local approximation can be applied to multiple variables in turn until a tractable approximation is obtained, and in Section 10.6.1 we shall give a practical example of this approach in the context of logistic regression. Here we focus on developing the bounds themselves.

We have already seen in our discussion of the Kullback-Leibler divergence that the convexity of the logarithm function played a key role in developing the lower bound in the global variational approach. We have defined a (strictly) convex function as one for which every chord lies above the function. Convexity also plays a central role in the local variational framework. Note that our discussion will apply equally to concave functions with ‘min’ and ‘max’ interchanged and with lower bounds replaced by upper bounds.

Let us begin by considering a simple example, namely the function $f(x) =$ $\exp(- x)$ , which is a convex function of x, and which is shown in the left-hand plot of Figure 10.10. Our goal is to approximate $f(x)$ by a simpler function, in particular a linear function of $x.$ . From Figure 10.10, we see that this linear function will be a lower bound on $f(x)$ if it corresponds to a tangent. We can obtain the tangent line $y(x)$ at a specific value of x, say $x = \xi$ , by making a first order Taylor expansion

$$
y(x) = f(\xi) + f^{\prime}(\xi)(x - \xi)\tag{10.125}
$$

so that $y(x) \leqslant f(x)$ with equality when $x = \xi$ . For our example function $f(x) =$

Figure 10.10 In the left-hand figure the red curve shows the function $\exp(- x)$ and the blue line shows the tangent at $x \ = \ \xi$ defined by (10.125) with $\xi = 1$ . This line has slope $\overset{\cdot}{\lambda} = f^{\prime}(\overset{\cdot}{\xi}) = - \exp(- \overset{\cdot}{\xi})$ . Note that any other tangent line, for example the ones shown in green, will have a smaller value of $y$ at $x =$ $\xi.$ The right-hand figure shows the corresponding plot of the function $\lambda \xi - g(\lambda)$ , where $g(\lambda)$ is given by $_{(10.131)}$ versus λ for $\xi ~ = ~ 1$ , in which the maximum corresponds to $\lambda = - \exp(- \xi) = - 1 / e$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/6bd6899e033ff7029ce40b053130654ad3df7b29b885f17ccfe44d25b9f67e90.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/d7dc0cf2593b1780179bce80f3932ae450a50b9e746c0203c4e06c096ad176e1.jpg)

![Figure 10.11](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/c96180c24e07265434f64b914834ab7ed9af3b273713da3a2a27b426af05300f.jpg)  
Figure 10.11 In the left-hand plot the red curve shows a convex function $f(x)$ , and the blue line represents the linear function $\lambda x,$ which is a lower bound on $f(x)$ because $f(x) > \lambda x$ for all x. For the given value of slope λ the contact point of the tangent line having the same slope is found by minimizing with respect to x the discrepancy (shown by the green dashed lines) given by $f(x) - \lambda x$ . This defines the dual function $g(\lambda)$ , which corresponds to the (negative of the) intercept of the tangent line having slope λ.

$\exp(- x)$ , we therefore obtain the tangent line in the form

$$
y(x) = \exp(- \xi) - \exp(- \xi)(x - \xi)\tag{10.126}
$$

which is a linear function parameterized by $\xi.$ For consistency with subsequent discussion, let us define $\lambda = - \exp(- \xi)$ so that

$$
y(x, \lambda) = \lambda x - \lambda + \lambda \ln(- \lambda).\tag{10.127}
$$

Different values of λ correspond to different tangent lines, and because all such lines are lower bounds on the function, we have $f(x) \geqslant y(x, \lambda)$ . Thus we can write the function in the form

$$
f(x) = \max_{\lambda} \left\{\lambda x - \lambda + \lambda \ln(- \lambda) \right\}.\tag{10.128}
$$

We have succeeded in approximating the convex function $f(x)$ by a simpler, linear function $y(x, \lambda)$ . The price we have paid is that we have introduced a variational parameter λ, and to obtain the tightest bound we must optimize with respect to λ.

We can formulate this approach more generally using the framework of convex duality (Rockafellar, 1972; Jordan et al., 1999). Consider the illustration of a convex function $f(x)$ shown in the left-hand plot in Figure 10.11. In this example, the function λx is a lower bound on $f(x)$ but it is not the best lower bound that can be achieved by a linear function having slope λ, because the tightest bound is given by the tangent line. Let us write the equation of the tangent line, having slope λ as $\lambda x - g(\lambda)$ where the (negative) intercept $g(\lambda)$ clearly depends on the slope λ of the tangent. To determine the intercept, we note that the line must be moved vertically by an amount equal to the smallest vertical distance between the line and the function, as shown in Figure 10.11. Thus

$$
\begin{array}{rcl} g(\lambda) & = & - \min_{x} \left\{f(x) - \lambda x \right\} \\ & = & \max_{x} \left\{\lambda x - f(x) \right\}.\end{array}\tag{10.129}
$$

Now, instead of fixing λ and varying x, we can consider a particular x and then adjust λ until the tangent plane is tangent at that particular x. Because the y value of the tangent line at a particular x is maximized when that value coincides with its contact point, we have

$$
f(x) = \max_{\lambda} \left\{\lambda x - g(\lambda) \right\}.\tag{10.130}
$$

We see that the functions $f(x)$ and $g(\lambda)$ play a dual role, and are related through (10.129) and (10.130).

Let us apply these duality relations to our simple example $f(x) = \exp(- x)$ From (10.129) we see that the maximizing value of x is given by $\xi = - \ln(- \lambda)$ , and back-substituting we obtain the conjugate function $g(\lambda)$ in the form

$$
g(\lambda) = \lambda - \lambda \ln(- \lambda)\tag{10.131}
$$

as obtained previously. The function $\lambda \xi - g(\lambda)$ is shown, for $\xi = 1$ in the right-hand plot in Figure 10.10. As a check, we can substitute (10.131) into (10.130), which gives the maximizing value of $\lambda = - \exp(- x)$ , and back-substituting then recovers the original function $f(x) = \exp(- x)$

For concave functions, we can follow a similar argument to obtain upper bounds, in which max’ is replaced with ‘min’, so that

$$
f(x) = \min_{\lambda} \{\lambda x - g(\lambda)\}\tag{10.132}
$$

$$
g(\lambda) = \min_{x} \left\{\lambda x - f(x) \right\}.\tag{10.133}
$$

If the function of interest is not convex (or concave), then we cannot directly apply the method above to obtain a bound. However, we can first seek invertible transformations either of the function or of its argument which change it into a convex form. We then calculate the conjugate function and then transform back to the original variables.

An important example, which arises frequently in pattern recognition, is the logistic sigmoid function defined by

$$
\sigma(x) = \frac{1}{1 + e^{- x}}.\tag{10.134}
$$

As it stands this function is neither convex nor concave. However, if we take the logarithm we obtain a function which is concave, as is easily verified by finding the second derivative. From (10.133) the corresponding conjugate function then takes the form

$$
g(\lambda) = \min_{x} \left\{\lambda x - f(x) \right\} = - \lambda \ln \lambda -(1 - \lambda) \ln(1 - \lambda)\tag{10.135}
$$

which we recognize as the binary entropy function for a variable whose probability of having the value 1 is λ. Using (10.132), we then obtain an upper bound on the log sigmoid

$$
\ln \sigma(x) \leqslant \lambda x - g(\lambda)\tag{10.136}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/b13d6406fc41131a36b6208f9c8e564c9209865fbc2b0b6e468b1c6aea958c47.jpg)

![Figure 10.12](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/a4e881ed5dd50b6532f7154fb2b749e734cf9ab86a64950d29ad2b2e92ab4cbc.jpg)  
Figure 10.12 The left-hand plot shows the logistic sigmoid function $\sigma(x)$ defined by (10.134) in red, together with two examples of the exponential upper bound (10.137) shown in blue. The right-hand plot shows the logistic sigmoid again in red together with the Gaussian lower bound (10.144) shown in blue. Here the parameter $\xi = 2.5$ , and the bound is exact at $x = \xi$ and $x = - \xi$ , denoted by the dashed green lines.

and taking the exponential, we obtain an upper bound on the logistic sigmoid itself of the form

$$
\sigma(x) \leqslant \exp(\lambda x - g(\lambda))\tag{10.137}
$$

which is plotted for two values of λ on the left-hand plot in Figure 10.12.

We can also obtain a lower bound on the sigmoid having the functional form of a Gaussian. To do this, we follow Jaakkola and Jordan (2000) and make transformations both of the input variable and of the function itself. First we take the log of the logistic function and then decompose it so that

$$
\begin{array}{rcl} \ln \sigma(x) & = & - \ln(1 + e^{- x}) = - \ln \left\{e^{- x / 2}(e^{x / 2} + e^{- x / 2}) \right\} \\ & = & x / 2 - \ln(e^{x / 2} + e^{- x / 2}).\end{array}\tag{10.138}
$$

We now note that the function $f(x) = - \ln(e^{x / 2} + e^{- x / 2})$ is a convex function of the variable $x^{2}$ , as can again be verified by finding the second derivative. This leads to a lower bound on $f(x)$ , which is a linear function of $x^{2}$ whose conjugate function is given by

$$
g(\lambda) = \max_{x^{2}} \left\{\lambda x^{2} - f \left(\sqrt{x^{2}}\right) \right\}.\tag{10.139}
$$

The stationarity condition leads to

$$
0 = \lambda - \frac{dx}{dx^{2}} \frac{d}{dx} f(x) = \lambda + \frac{1}{4x} \tanh \left(\frac{x}{2}\right).\tag{10.140}
$$

If we denote this value of $x,$ corresponding to the contact point of the tangent line for this particular value of λ, by $\xi,$ , then we have

$$
\lambda(\xi) = - \frac{1}{4 \xi} \tanh \left(\frac{\xi}{2}\right) = - \frac{1}{2 \xi} \left[\sigma(\xi) - \frac{1}{2} \right].\tag{10.141}
$$

Instead of thinking of $\lambda$ as the variational parameter, we can let $\xi$ play this role as this leads to simpler expressions for the conjugate function, which is then given by

$$
g(\lambda) = \lambda(\xi) \xi^{2} - f(\xi) = \lambda(\xi) \xi^{2} + \ln(e^{\xi / 2} + e^{- \xi / 2}).\tag{10.142}
$$

Hence the bound on $f(x)$ can be written as

$$
f(x) \geqslant \lambda x^{2} - g(\lambda) = \lambda x^{2} - \lambda \xi^{2} - \ln(e^{\xi / 2} + e^{- \xi / 2}).\tag{10.143}
$$

The bound on the sigmoid then becomes

$$
\sigma(x) \geqslant \sigma(\xi) \exp \left\{(x - \xi) / 2 - \lambda(\xi)(x^{2} - \xi^{2}) \right\}\tag{10.144}
$$

where $\lambda(\xi)$ is defined by (10.141). This bound is illustrated in the right-hand plot of Figure 10.12. We see that the bound has the form of the exponential of a quadratic function of $x,$ which will prove useful when we seek Gaussian representations of posterior distributions defined through logistic sigmoid functions.

The logistic sigmoid arises frequently in probabilistic models over binary variables because it is the function that transforms a log odds ratio into a posterior probability. The corresponding transformation for a multiclass distribution is given by the softmax function. Unfortunately, the lower bound derived here for the logistic sigmoid does not directly extend to the softmax. Gibbs (1997) proposes a method for constructing a Gaussian distribution that is conjectured to be a bound (although no rigorous proof is given), which may be used to apply local variational methods to multiclass problems.

We shall see an example of the use of local variational bounds in Sections 10.6.1. For the moment, however, it is instructive to consider in general terms how these bounds can be used. Suppose we wish to evaluate an integral of the form

$$
I = \int \sigma(a) p(a) d a\tag{10.145}
$$

where $\sigma(a)$ is the logistic sigmoid, and $p(a)$ is a Gaussian probability density. Such integrals arise in Bayesian models when, for instance, we wish to evaluate the predictive distribution, in which case $p(a)$ represents a posterior parameter distribution. Because the integral is intractable, we employ the variational bound (10.144), which we write in the form $\sigma(a) \geqslant f(a, \xi)$ where $\xi$ is a variational parameter. The integral now becomes the product of two exponential-quadratic functions and so can be integrated analytically to give a bound on I

$$
I \geqslant \int f(a, \xi) p(a) d a = F(\xi).\tag{10.146}
$$

We now have the freedom to choose the variational parameter $\xi,$ , which we do by finding the value $\xi^{\star}$ that maximizes the function $F(\xi)$ . The resulting value $F(\xi^{\star})$ represents the tightest bound within this family of bounds and can be used as an approximation to I. This optimized bound, however, will in general not be exact.

Although the bound $\sigma(a) \geqslant f(a, \xi)$ on the logistic sigmoid can be optimized exactly, the required choice for $\xi$ depends on the value of a, so that the bound is exact for one value of a only. Because the quantity $F(\xi)$ is obtained by integrating over all values of $a,$ the value of $\xi^{\star}$ represents a compromise, weighted by the distribution $p(a)$

## 10.6. Variational Logistic Regression

We now illustrate the use of local variational methods by returning to the Bayesian logistic regression model studied in Section 4.5. There we focussed on the use of the Laplace approximation, while here we consider a variational treatment based on the approach of Jaakkola and Jordan (2000). Like the Laplace method, this also leads to a Gaussian approximation to the posterior distribution. However, the greater flexibility of the variational approximation leads to improved accuracy compared to the Laplace method. Furthermore (unlike the Laplace method), the variational approach is optimizing a well defined objective function given by a rigourous bound on the model evidence. Logistic regression has also been treated by Dybowski and Roberts (2005) from a Bayesian perspective using Monte Carlo sampling techniques.

## 10.6.1 Variational posterior distribution

Here we shall make use of a variational approximation based on the local bounds introduced in Section 10.5. This allows the likelihood function for logistic regression, which is governed by the logistic sigmoid, to be approximated by the exponential of a quadratic form. It is therefore again convenient to choose a conjugate Gaussian prior of the form (4.140). For the moment, we shall treat the hyperparameters $\mathbf{m}_{0}$ and $\mathbf{S}_{0}$ as fixed constants. In Section 10.6.3, we shall demonstrate how the <sup>m S</sup>variational formalism can be extended to the case where there are unknown hyperparameters whose values are to be inferred from the data.

In the variational framework, we seek to maximize a lower bound on the marginal likelihood. For the Bayesian logistic regression model, the marginal likelihood takes the form

$$
p(\mathbf{t}) = \int p(\mathbf{t} | \mathbf{w}) p(\mathbf{w}) d \mathbf{w} = \int \left[\prod_{n = 1}^{N} p(t_{n} | \mathbf{w}) \right] p(\mathbf{w}) d \mathbf{w}.\tag{10.147}
$$

We first note that the conditional distribution for t can be written as

$$
\begin{array}{rcl}{p(t | \mathbf{w})} & = &{\sigma(a)^{t} \left\{1 - \sigma(a) \right\}^{1 - t}} \\ & = &{\left(\frac{1}{1 + e^{- a}}\right)^{t} \left(1 - \frac{1}{1 + e^{- a}}\right)^{1 - t}} \\ & = &{e^{at} \frac{e^{- a}}{1 + e^{- a}} = e^{at} \sigma(- a)} \end{array}\tag{10.148}
$$

where $a = \mathbf{w}^{\mathrm{T}} \phi$ . In order to obtain a lower bound on $p(\mathfrak{t})$ , we make use of the variational lower bound on the logistic sigmoid function given by (10.144), which

we reproduce here for convenience

$$
\sigma(z) \geqslant \sigma(\xi) \exp \left\{(z - \xi) / 2 - \lambda(\xi)(z^{2} - \xi^{2}) \right\}\tag{10.149}
$$

where

$$
\lambda(\xi) = \frac{1}{2 \xi} \left[\sigma(\xi) - \frac{1}{2} \right].\tag{10.150}
$$

We can therefore write

$$
p(t | \mathbf{w}) = e^{at} \sigma(- a) \geqslant e^{at} \sigma(\xi) \exp \left\{-(a + \xi) / 2 - \lambda(\xi)(a^{2} - \xi^{2}) \right\}.\tag{10.151}
$$

Note that because this bound is applied to each of the terms in the likelihood function separately, there is a variational parameter $\xi_{n}$ corresponding to each training set observation $(\phi_{n}, t_{n})$ . Using $a = \mathbf{w}^{\mathrm{T}} \phi$ , and multiplying by the prior distribution, we <sup>w</sup>obtain the following bound on the joint distribution of t and

$$
p(\mathbf{t}, \mathbf{w}) = p(\mathbf{t} | \mathbf{w}) p(\mathbf{w}) \geqslant h(\mathbf{w}, \boldsymbol{\xi}) p(\mathbf{w})\tag{10.152}
$$

where $\boldsymbol{\xi}$ denotes the set $\{\xi_{n}\}$ of variational parameters, and

$$
\begin{array}{rcl} h(\mathbf{w}, \boldsymbol{\xi}) & = & \prod_{n = 1}^{N} \sigma(\xi_{n}) \exp \left\{\mathbf{w}^{\mathrm{T}} \phi_{n} t_{n} -(\mathbf{w}^{\mathrm{T}} \phi_{n} + \xi_{n}) / 2 \right.\\ & & \left.- \lambda(\xi_{n})([\mathbf{w}^{\mathrm{T}} \phi_{n}]^{2} - \xi_{n}^{2}) \right\}.\end{array}\tag{10.153}
$$

Evaluation of the exact posterior distribution would require normalization of the lefthand side of this inequality. Because this is intractable, we work instead with the right-hand side. Note that the function on the right-hand side cannot be interpreted as a probability density because it is not normalized. Once it is normalized to give a variational posterior distribution $q(\mathbf{w})$ , however, it no longer represents a bound.

<sup>w</sup>Because the logarithm function is monotonically increasing, the inequality $A \geqslant$ $B$ implies ln $A \geqslant$ ln $B.$ . This gives a lower bound on the log of the joint distribution of t and of the form

$$
\begin{array}{c} \ln \left\{p(\mathbf{t} | \mathbf{w}) p(\mathbf{w}) \right\} \geqslant \ln p(\mathbf{w}) + \sum_{n = 1}^{N} \left\{\ln \sigma(\xi_{n}) + \mathbf{w}^{\mathrm{T}} \phi_{n} t_{n} \right.\\ \left.-(\mathbf{w}^{\mathrm{T}} \phi_{n} + \xi_{n}) / 2 - \lambda(\xi_{n})([\mathbf{w}^{\mathrm{T}} \phi_{n}]^{2} - \xi_{n}^{2}) \right\}.\end{array}\tag{10.154}
$$

Substituting for the prior $p(\mathbf{w})$ , the right-hand side of this inequality becomes, as a function of

$$
\begin{array}{c}{- \frac{1}{2}(\mathbf{w} - \mathbf{m}_{0})^{\mathrm{T}} \mathbf{S}_{0}^{- 1}(\mathbf{w} - \mathbf{m}_{0})} \\{+ \sum_{n = 1}^{N} \left\{\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n}(t_{n} - 1 / 2) - \lambda(\xi_{n}) \mathbf{w}^{\mathrm{T}}(\boldsymbol{\phi}_{n} \boldsymbol{\phi}_{n}^{\mathrm{T}}) \mathbf{w} \right\} + \mathrm{const}.} \end{array}\tag{10.155}
$$

This is a quadratic function of , and so we can obtain the corresponding variational approximation to the posterior distribution by identifying the linear and quadratic terms in , giving a Gaussian variational posterior of the form

$$
q(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{N}, \mathbf{S}_{N})\tag{10.156}
$$

where

$$
\mathbf{m}_{N} = \mathbf{S}_{N} \left(\mathbf{S}_{0}^{- 1} \mathbf{m}_{0} + \sum_{n = 1}^{N}(t_{n} - 1 / 2) \phi_{n}\right)\tag{10.157}
$$

$$
\mathbf{S}_{N}^{- 1} = \mathbf{S}_{0}^{- 1} + 2 \sum_{n = 1}^{N} \lambda(\xi_{n}) \phi_{n} \phi_{n}^{\mathrm{T}}.\tag{10.158}
$$

As with the Laplace framework, we have again obtained a Gaussian approximation to the posterior distribution. However, the additional flexibility provided by the variational parameters $\{\xi_{n}\}$ leads to improved accuracy in the approximation (Jaakkola and Jordan, 2000).

Here we have considered a batch learning context in which all of the training data is available at once. However, Bayesian methods are intrinsically well suited to sequential learning in which the data points are processed one at a time and then discarded. The formulation of this variational approach for the sequential case is straightforward.

Note that the bound given by (10.149) applies only to the two-class problem and so this approach does not directly generalize to classification problems with $K > 2$ classes. An alternative bound for the multiclass case has been explored by Gibbs (1997).

## 10.6.2 Optimizing the variational parameters

We now have a normalized Gaussian approximation to the posterior distribution, which we shall use shortly to evaluate the predictive distribution for new data points. First, however, we need to determine the variational parameters $\{\xi_{n}\}$ by maximizing the lower bound on the marginal likelihood.

To do this, we substitute the inequality (10.152) back into the marginal likelihood to give

$$
\ln p(\mathbf{t}) = \ln \int p(\mathbf{t} | \mathbf{w}) p(\mathbf{w}) d \mathbf{w} \geqslant \ln \int h(\mathbf{w}, \boldsymbol{\xi}) p(\mathbf{w}) d \mathbf{w} = \mathcal{L}(\boldsymbol{\xi}).\tag{10.159}
$$

As with the optimization of the hyperparameter α in the linear regression model of Section 3.5, there are two approaches to determining the $\xi_{n}$ . In the first approach, we recognize that the function $\mathcal{L}(\pmb{\xi})$ is defined by an integration over  and so we can view  as a latent variable and invoke the EM algorithm. In the second approach, we integrate over  analytically and then perform a direct maximization over $\xi$ . Let us begin by considering the EM approach.

The EM algorithm starts by choosing some initial values for the parameters $\{\xi_{n}\}$ , which we denote collectively by $\pmb{\xi}^{\mathrm{{\check{old}}}}$ . In the E step of the EM algorithm, we then use these parameter values to find the posterior distribution over , which is given by (10.156). In the M step, we then maximize the expected complete-data log likelihood which is given by

$$
Q(\pmb{\xi}, \pmb{\xi}^{\mathrm{old}}) = \mathbb{E} \left[\ln h(\mathbf{w}, \pmb{\xi}) p(\mathbf{w}) \right]\tag{10.160}
$$

where the expectation is taken with respect to the posterior distribution $q(\mathbf{w})$ evaluated using $\pmb{\xi}^{\mathrm{old}}$ . Noting that $p(\mathbf{w})$ does not depend on $\xi,$ and substituting for $h(\mathbf{w}, \pmb{\xi})$ we obtain

$$
Q(\boldsymbol{\xi}, \boldsymbol{\xi}^{\text{old}}) = \sum_{n = 1}^{N} \left\{\ln \sigma(\xi_{n}) - \xi_{n} / 2 - \lambda(\xi_{n})(\phi_{n}^{\mathrm{T}} \mathbb{E}[\mathbf{ww}^{\mathrm{T}}] \phi_{n} - \xi_{n}^{2}) \right\} + \text{const}\tag{10.161}
$$

where ‘const’ denotes terms that are independent of ${\bf \dot{\xi}}$ . We now set the derivative with respect to $\xi_{n}$ equal to zero. A few lines of algebra, making use of the definitions of $\sigma(\boldsymbol{\xi})$ and $\lambda(\xi)$ , then gives

$$
0 = \lambda^{\prime}(\xi_{n})(\phi_{n}^{\mathrm{T}} \mathbb{E}[\mathbf{ww}^{\mathrm{T}}] \phi_{n} - \xi_{n}^{2}).\tag{10.162}
$$

We now note that $\lambda^{\prime}(\xi)$ is a monotonic function of $\xi$ for $\xi \geqslant 0$ , and that we can restrict attention to nonnegative values of $\xi$ without loss of generality due to the symmetry of the bound around $\xi = 0$ . Thus $\lambda^{\prime}(\xi) \neq 0$ , and hence we obtain the following re-estimation equations

$$
(\xi_{n}^{\mathrm{new}})^{2} = \phi_{n}^{\mathrm{T}} \mathbb{E}[\mathbf{ww}^{\mathrm{T}}] \phi_{n} = \phi_{n}^{\mathrm{T}}(\mathbf{S}_{N} + \mathbf{m}_{N} \mathbf{m}_{N}^{\mathrm{T}}) \phi_{n}\tag{10.163}
$$

where we have used (10.156).

Let us summarize the EM algorithm for finding the variational posterior distribution. We first initialize the variational parameters $\boldsymbol{\xi}^{\mathrm{{old}}}$ . In the E step, we evaluate the posterior distribution over given by (10.156), in which the mean and covari-<sup>w</sup>ance are defined by (10.157) and (10.158). In the M step, we then use this variational posterior to compute a new value for $\boldsymbol{\xi}$ given by (10.163). The E and M steps are repeated until a suitable convergence criterion is satisfied, which in practice typically requires only a few iterations.

An alternative approach to obtaining re-estimation equations for $\boldsymbol{\xi}$ is to note that in the integral over in the definition (10.159) of the lower bound $\mathcal{L}(\pmb{\xi})$ , the integrand has a Gaussian-like form and so the integral can be evaluated analytically. Having evaluated the integral, we can then differentiate with respect to $\xi_{n}$ . It turns out that this gives rise to exactly the same re-estimation equations as does the EM approach given by (10.163).

As we have emphasized already, in the application of variational methods it is useful to be able to evaluate the lower bound $\mathcal{L}(\pmb{\xi})$ given by (10.159). The integration over  can be performed analytically by noting that $p(\mathbf{w})$ is Gaussian and $h(\mathbf{w}, \pmb{\xi})$ is the exponential of a quadratic function of $\mathbf{w}$ . Thus, by completing the square and making use of the standard result for the normalization coefficient of a Gaussian distribution, we can obtain a closed form solution which takes the form

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/406a2a394c76ed0861f779ce08711275b7a9aaa7638c7d7c8840bcd19a1aa11e.jpg)

![Figure 10.13](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/dfe23ff85cb1e0d11b5c0b2eca726fad70a03b742a0a2ba8d5dc376ea0847ce4.jpg)  
Figure 10.13 Illustration of the Bayesian approach to logistic regression for a simple linearly separable data set. The plot on the left shows the predictive distribution obtained using variational inference. We see that the decision boundary lies roughly mid way between the clusters of data points, and that the contours of the predictive distribution splay out away from the data reflecting the greater uncertainty in the classification of such regions. The plot on the right shows the decision boundaries corresponding to five samples of the parameter vector w drawn from the posterior distribution $p(\mathbf{w} | \mathbf{t})$

$$
\begin{array}{rcl} \mathcal{L}(\pmb{\xi}) & = & \frac{1}{2} \ln \frac{| \mathbf{S}_{N} |}{| \mathbf{S}_{0} |} - \frac{1}{2} \mathbf{m}_{N}^{\mathrm{T}} \mathbf{S}_{N}^{- 1} \mathbf{m}_{N} + \frac{1}{2} \mathbf{m}_{0}^{\mathrm{T}} \mathbf{S}_{0}^{- 1} \mathbf{m}_{0} \\ & & + \sum_{n = 1}^{N} \left\{\ln \sigma(\xi_{n}) - \frac{1}{2} \xi_{n} - \lambda(\xi_{n}) \xi_{n}^{2} \right\}.\end{array}\tag{10.164}
$$

This variational framework can also be applied to situations in which the data is arriving sequentially (Jaakkola and Jordan, 2000). In this case we maintain a Gaussian posterior distribution over , which is initialized using the prior $p(\mathbf{w})$ . As each data point arrives, the posterior is updated by making use of the bound (10.151) and then normalized to give an updated posterior distribution.

The predictive distribution is obtained by marginalizing over the posterior distribution, and takes the same form as for the Laplace approximation discussed in Section 4.5.2. Figure 10.13 shows the variational predictive distributions for a synthetic data set. This example provides interesting insights into the concept of ‘large margin’, which was discussed in Section 7.1 and which has qualitatively similar behaviour to the Bayesian solution.

## 10.6.3 Inference of hyperparameters

So far, we have treated the hyperparameter α in the prior distribution as a known constant. We now extend the Bayesian logistic regression model to allow the value of this parameter to be inferred from the data set. This can be achieved by combining the global and local variational approximations into a single framework, so as to maintain a lower bound on the marginal likelihood at each stage. Such a combined approach was adopted by Bishop and Svensen (2003) in the context of a Bayesian ´ treatment of the hierarchical mixture of experts model.

Specifically, we consider once again a simple isotropic Gaussian prior distribution of the form

$$
p(\mathbf{w} | \alpha) = \mathcal{N}(\mathbf{w} | \mathbf{0}, \alpha^{- 1} \mathbf{I}).\tag{10.165}
$$

Our analysis is readily extended to more general Gaussian priors, for instance if we wish to associate a different hyperparameter with different subsets of the parameters $w_{j}$ . As usual, we consider a conjugate hyperprior over α given by a gamma distribution

$$
p(\alpha) = \operatorname{Gam}(\alpha | a_{0}, b_{0})\tag{10.166}
$$

governed by the constants $a_{0}$ and $b_{0}$ .

The marginal likelihood for this model now takes the form

$$
p(\mathbf{t}) = \iint p(\mathbf{w}, \alpha, \mathbf{t}) d \mathbf{w} d \alpha\tag{10.167}
$$

where the joint distribution is given by

$$
p(\mathbf{w}, \alpha, \mathbf{t}) = p(\mathbf{t} | \mathbf{w}) p(\mathbf{w} | \alpha) p(\alpha).\tag{10.168}
$$

We are now faced with an analytically intractable integration over and $\alpha,$ which <sup>w</sup>we shall tackle by using both the local and global variational approaches in the same model

To begin with, we introduce a variational distribution $q(\mathbf{w}, \alpha)$ , and then apply the decomposition (10.2), which in this instance takes the form

$$
\ln p(\mathbf{t}) = \mathcal{L}(q) + \mathrm{KL}(q \| p)\tag{10.169}
$$

where the lower bound $\mathcal{L}(q)$ and the Kullback-Leibler divergence $\mathrm{KL}(q \| p)$ are defined by

$$
\mathcal{L}(q) = \iint q(\mathbf{w}, \alpha) \ln \left\{\frac{p(\mathbf{w}, \alpha, \mathbf{t})}{q(\mathbf{w}, \alpha)} \right\} d \mathbf{w} d \alpha\tag{10.170}
$$

$$
\mathrm{KL}(q \| p) = - \iint q(\mathbf{w}, \alpha) \ln \left\{\frac{p(\mathbf{w}, \alpha | \mathbf{t}))}{q(\mathbf{w}, \alpha)} \right\} d \mathbf{w} d \alpha.\tag{10.171}
$$

At this point, the lower bound $\mathcal{L}(q)$ is still intractable due to the form of the likelihood factor $p(\mathbf{t} | \mathbf{w})$ . We therefore apply the local variational bound to each of <sup>w</sup>the logistic sigmoid factors as before. This allows us to use the inequality (10.152) and place a lower bound on $\mathcal{L}(q)$ , which will therefore also be a lower bound on the log marginal likelihood

$$
\begin{array}{rcl} \ln p(\mathbf{t}) & \geqslant & \mathcal{L}(q) \geqslant \widetilde{\mathcal{L}}(q, \boldsymbol{\xi}) \\ & = & \iint q(\mathbf{w}, \alpha) \ln \left\{\frac{h(\mathbf{w}, \boldsymbol{\xi}) p(\mathbf{w} | \alpha) p(\alpha)}{q(\mathbf{w}, \alpha)} \right\} d \mathbf{w} d \alpha.\end{array}\tag{10.172}
$$

Next we assume that the variational distribution factorizes between parameters and hyperparameters so that

$$
q(\mathbf{w}, \alpha) = q(\mathbf{w}) q(\alpha).\tag{10.173}
$$

With this factorization we can appeal to the general result (10.9) to find expressions for the optimal factors. Consider first the distribution $q(\mathbf{w})$ . Discarding terms that are independent of , we have

$$
\begin{array}{rcl} \ln q(\mathbf{w}) & = & \mathbb{E}_{\alpha} \left[\ln \left\{h(\mathbf{w}, \pmb{\xi}) p(\mathbf{w} | \alpha) p(\alpha) \right\} \right] + \mathrm{const} \\ & = & \ln h(\mathbf{w}, \pmb{\xi}) + \mathbb{E}_{\alpha} \left[\ln p(\mathbf{w} | \alpha) \right] + \mathrm{const}.\end{array}
$$

We now substitute for ln $h(\mathbf{w}, \pmb{\xi})$ using (10.153), and for ln $p(\mathbf{w} | \alpha)$ using (10.165), giving

$$
\ln q(\mathbf{w}) = - \frac{\mathbb{E}[\alpha]}{2} \mathbf{w}^{\mathrm{T}} \mathbf{w} + \sum_{n = 1}^{N} \left\{(t_{n} - 1 / 2) \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n} - \lambda(\xi_{n}) \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n} \boldsymbol{\phi}_{n}^{\mathrm{T}} \mathbf{w} \right\} + \mathrm{const.}
$$

We see that this is a quadratic function of and so the solution for $q(\mathbf{w})$ will be <sup>w</sup>Gaussian. Completing the square in the usual way, we obtain

$$
q(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \boldsymbol{\mu}_{N}, \boldsymbol{\Sigma}_{N})\tag{10.174}
$$

where we have defined

$$
\boldsymbol{\Sigma}_{N}^{- 1} \boldsymbol{\mu}_{N} = \sum_{n = 1}^{N}(t_{n} - 1 / 2) \phi_{n}\tag{10.175}
$$

$$
\boldsymbol{\Sigma}_{N}^{- 1} = \mathbb{E}[\alpha] \mathbf{I} + 2 \sum_{n = 1}^{N} \lambda(\xi_{n}) \boldsymbol{\phi}_{n} \boldsymbol{\phi}_{n}^{\mathrm{T}}.\tag{10.176}
$$

Similarly, the optimal solution for the factor $q(\alpha)$ is obtained from

$$
\ln q(\alpha) = \mathbb{E}_{\mathbf{w}} \left[\ln p(\mathbf{w} | \alpha) \right] + \ln p(\alpha) + \mathrm{const.}
$$

Substituting for ln $p(\mathbf{w} | \alpha)$ using (10.165), and for ln $p(\alpha)$ using (10.166), we obtain

$$
\ln q(\alpha) = \frac{M}{2} \ln \alpha - \frac{\alpha}{2} \mathbb{E} \left[\mathbf{w}^{\mathrm{T}} \mathbf{w} \right] +(a_{0} - 1) \ln \alpha - b_{0} \alpha + \mathrm{const}.
$$

We recognize this as the log of a gamma distribution, and so we obtain

$$
q(\alpha) = \operatorname{Gam}(\alpha | a_{N}, b_{N}) = \frac{1}{\Gamma(a_{0})} a_{0}^{b_{0}} \alpha^{a_{0} - 1} e^{- b_{0} \alpha}\tag{10.177}
$$

where

$$
a_{N} = a_{0} + \frac{M}{2}\tag{10.178}
$$

$$
{b_{N}} ={b_{0} + \frac{1}{2} \mathbb{E}_{\mathbf{w}} \left[\mathbf{w}^{\mathrm{T}} \mathbf{w} \right].}\tag{10.179}
$$

We also need to optimize the variational parameters $\xi_{n}$ , and this is also done by maximizing the lower bound $\widetilde{\mathcal{L}}(q, \xi)$ . Omitting terms that are independent of $\xi,$ and integrating over α, we have

$$
\widetilde{\mathcal{L}}(q, \pmb{\xi}) = \int q(\mathbf{w}) \ln h(\mathbf{w}, \pmb{\xi}) d \mathbf{w} + \mathrm{const}.\tag{10.180}
$$

Note that this has precisely the same form as (10.159), and so we can again appeal to our earlier result (10.163), which can be obtained by direct optimization of the marginal likelihood function, leading to re-estimation equations of the form

$$
(\xi_{n}^{\mathrm{new}})^{2} = \phi_{n}^{\mathrm{T}}(\pmb{\Sigma}_{N} + \pmb{\mu}_{N} \pmb{\mu}_{N}^{\mathrm{T}}) \phi_{n}.\tag{10.181}
$$

We have obtained re-estimation equations for the three quantities $q(\mathbf{w}), q(\alpha)$ and $\xi,$ , and so after making suitable initializations, we can cycle through these quantities, updating each in turn. The required moments are given by

Appendix B

$$
\mathbb{E}[\alpha] = \frac{a_{N}}{b_{N}}\tag{10.182}
$$

$$
{\mathbb{E} \left[\mathbf{w}^{\mathrm{T}} \mathbf{w} \right]} ={\boldsymbol{\Sigma}_{N} + \boldsymbol{\mu}_{N}^{\mathrm{T}} \boldsymbol{\mu}_{N}.}\tag{10.183}
$$

## 10.7. Expectation Propagation

We conclude this chapter by discussing an alternative form of deterministic approximate inference, known as expectation propagation or $EP$ (Minka, 2001a; Minka, 2001b). As with the variational Bayes methods discussed so far, this too is based on the minimization of a Kullback-Leibler divergence but now of the reverse form, which gives the approximation rather different properties.

Consider for a moment the problem of minimizing $\mathrm{KL}(p | | q)$ with respect to $q(\mathbf{z})$ when $p(\mathbf{z})$ is a fixed distribution and $q(\mathbf{z})$ <sup>z</sup>is a member of the exponential family and so, from (2.194), can be written in the form

$$
q(\mathbf{z}) = h(\mathbf{z}) g(\boldsymbol{\eta}) \exp \left\{\boldsymbol{\eta}^{\mathrm{T}} \mathbf{u}(\mathbf{z}) \right\}.\tag{10.184}
$$

As a function of $\eta,$ the Kullback-Leibler divergence then becomes

$$
\mathrm{KL}(p \| q) = - \ln g(\pmb{\eta}) - \pmb{\eta}^{\mathrm{T}} \mathbb{E}_{p(\mathbf{z})}[\mathbf{u}(\mathbf{z})] + \mathrm{const}\tag{10.185}
$$

where the constant terms are independent of the natural parameters $\eta.$ . We can minimize $\mathrm{KL}(p | | q)$ within this family of distributions by setting the gradient with respect to η to zero, giving

$$
- \nabla \ln g(\boldsymbol{\eta}) = \mathbb{E}_{p(\mathbf{z})}[\mathbf{u}(\mathbf{z})].\tag{10.186}
$$

However, we have already seen in (2.226) that the negative gradient of ln $g(\pmb{\eta})$ is given by the expectation of $\mathbf{u}(\mathbf{z})$ under the distribution $q(\mathbf{z})$ . Equating these two results, we obtain

$$
\mathbb{E}_{q(\mathbf{z})}[\mathbf{u}(\mathbf{z})] = \mathbb{E}_{p(\mathbf{z})}[\mathbf{u}(\mathbf{z})].\tag{10.187}
$$

We see that the optimum solution simply corresponds to matching the expected sufficient statistics. So, for instance, if $q(\mathbf{z})$ is a Gaussian $\mathcal{N}(\mathbf{z} | \boldsymbol{\mu}, \boldsymbol{\Sigma})$ then we minimize <sup>z</sup>the Kullback-Leibler divergence by setting the mean $\pmb{\mu}$ of $q(\mathbf{z})$ equal to the mean of the distribution $p(\mathbf{z})$ and the covariance $\bar{\Sigma}$ <sup>z</sup>equal to the covariance of $p(\mathbf{z})$ . This is sometimes called moment matching. An example of this was seen in Figure 10.3(a).

Now let us exploit this result to obtain a practical algorithm for approximate inference. For many probabilistic models, the joint distribution of data $\mathcal{D}$ and hidden variables (including parameters) $\pmb \theta$ comprises a product of factors in the form

$$
p(\mathcal{D}, \boldsymbol{\theta}) = \prod_{i} f_{i}(\boldsymbol{\theta}).\tag{10.188}
$$

This would arise, for example, in a model for independent, identically distributed data in which there is one factor $f_{n}(\pmb{\theta}) = p(\mathbf{x}_{n} | \pmb{\theta})$ for each data point ${\bf x}_{n}$ , along with a factor $f_{0}(\pmb{\theta}) = p(\pmb{\theta})$ corresponding to the prior. More generally, it would also apply to any model defined by a directed probabilistic graph in which each factor is a conditional distribution corresponding to one of the nodes, or an undirected graph in which each factor is a clique potential. We are interested in evaluating the posterior distribution $p(\pmb \theta | \mathcal{D})$ for the purpose of making predictions, as well as the model evidence $p(\mathcal{D})$ for the purpose of model comparison. From (10.188) the posterior is given by

$$
p(\pmb{\theta} | \mathcal{D}) = \frac{1}{p(\mathcal{D})} \prod_{i} f_{i}(\pmb{\theta})\tag{10.189}
$$

and the model evidence is given by

$$
p(\mathcal{D}) = \int \prod_{i} f_{i}(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{10.190}
$$

Here we are considering continuous variables, but the following discussion applies equally to discrete variables with integrals replaced by summations. We shall suppose that the marginalization over $\theta,$ , along with the marginalizations with respect to the posterior distribution required to make predictions, are intractable so that some form of approximation is required.

Expectation propagation is based on an approximation to the posterior distribution which is also given by a product of factors

$$
q(\pmb{\theta}) = \frac{1}{Z} \prod_{i} \widetilde{f}_{i}(\pmb{\theta})\tag{10.191}
$$

in which each factor $\widetilde{f}_{i}(\pmb \theta)$ in the approximation corresponds to one of the factors $f_{i}(\pmb \theta)$ in the true posterior (10.189), and the factor $1 / Z$ is the normalizing constant needed to ensure that the left-hand side of (10.191) integrates to unity. In order to obtain a practical algorithm, we need to constrain the factors $\widetilde{f}_{i}(\pmb \theta)$ in some way, and in particular we shall assume that they come from the exponential family. The product of the factors will therefore also be from the exponential family and so can be described by a finite set of sufficient statistics. For example, if each of the $\widetilde{f}_{i}(\pmb \theta)$ is a Gaussian, then the overall approximation $q(\pmb \theta)$ will also be Gaussian.

Ideally we would like to determine the $\widetilde{f}_{i}(\pmb \theta)$ by minimizing the Kullback-Leibler divergence between the true posterior and the approximation given by

$$
\mathrm{KL} \left(p \| q\right) = \mathrm{KL} \left(\frac{1}{p(\mathcal{D})} \prod_{i} f_{i}(\boldsymbol{\theta}) \Bigg | \Bigg | \frac{1}{Z} \prod_{i} \widetilde{f}_{i}(\boldsymbol{\theta})\right).\tag{10.192}
$$

Note that this is the reverse form of KL divergence compared with that used in variational inference. In general, this minimization will be intractable because the KL divergence involves averaging with respect to the true distribution. As a rough approximation, we could instead minimize the KL divergences between the corresponding pairs $f_{i}(\pmb \theta)$ and $\widetilde{f}_{i}(\pmb \theta)$ of factors. This represents a much simpler problem to solve, and has the advantage that the algorithm is noniterative. However, because each factor is individually approximated, the product of the factors could well give a poor approximation.

Expectation propagation makes a much better approximation by optimizing each factor in turn in the context of all of the remaining factors. It starts by initializing the factors $\widetilde{f}_{i}(\pmb \theta)$ , and then cycles through the factors refining them one at a time. This is similar in spirit to the update of factors in the variational Bayes framework considered earlier. Suppose we wish to refine factor $\widetilde{f}_{j}(\pmb{\theta})$ . We first remove this factor from the product to give $\textstyle \prod_{i \neq j}{\widetilde{f}}_{i}(\pmb{\theta})$ . Conceptually, we will now determine a revised form of the factor $\widetilde{f}_{j}(\pmb{\theta})$ by ensuring that the product

$$
q^{\mathrm{new}}(\boldsymbol{\theta}) \propto \widetilde{f}_{j}(\boldsymbol{\theta}) \prod_{i \neq j} \widetilde{f}_{i}(\boldsymbol{\theta})\tag{10.193}
$$

is as close as possible to

$$
f_{j}(\boldsymbol{\theta}) \prod_{i \neq j} \widetilde{f}_{i}(\boldsymbol{\theta})\tag{10.194}
$$

in which we keep fixed all of the factors $\widetilde{f}_{i}(\pmb \theta)$ for $i \neq j$ . This ensures that the approximation is most accurate in the regions of high posterior probability as defined by the remaining factors. We shall see an example of this effect when we apply EP to the ‘clutter problem’. To achieve this, we first remove the factor $\widetilde{f}_{j}(\pmb{\theta})$ from the current approximation to the posterior by defining the unnormalized distribution

$$
q^{\backslash j}(\boldsymbol{\theta}) = \frac{q(\boldsymbol{\theta})}{\widetilde{f}_{j}(\boldsymbol{\theta})}.\tag{10.195}
$$

Note that we could instead find $q^{\setminus j}(\pmb \theta)$ from the product of factors $i \neq j$ , although in practice division is usually easier. This is now combined with the factor $f_{j}(\pmb \theta)$ to give a distribution

$$
\frac{1}{Z_{j}} f_{j}(\pmb{\theta}) q^{\backslash j}(\pmb{\theta})\tag{10.196}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/32a49320322b0c353934580ae35d04727647d9f95ce04759309561a446b61616.jpg)

![Figure 10.14](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/834abe0c6538e0e77f06a4905eb5765e08fdf19557300a05770feb2215eb081c.jpg)  
Figure 10.14 Illustration of the expectation propagation approximation using a Gaussian distribution for the example considered earlier in Figures 4.14 and 10.1. The left-hand plot shows the original distribution (yellow) along with the Laplace (red), global variational (green), and EP (blue) approximations, and the right-hand plot shows the corresponding negative logarithms of the distributions. Note that the $\mathsf{EP}$ distribution is broader than that variational inference, as a consequence of the different form of KL divergence.

where $Z_{j}$ is the normalization constant given by

$$
Z_{j} = \int f_{j}(\boldsymbol{\theta}) q^{\backslash j}(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{10.197}
$$

We now determine a revised factor $\widetilde{f}_{j}(\pmb{\theta})$ by minimizing the Kullback-Leibler divergence

$$
\mathrm{KL} \left(\right.\frac{f_{j}(\boldsymbol{\theta}) q^{\backslash j}(\boldsymbol{\theta})}{Z_{j}} \left.\right\| q^{\text{new}}(\boldsymbol{\theta})\left.\right).\tag{10.198}
$$

This is easily solved because the approximating distribution $q^{\mathrm{new}}(\pmb{\theta})$ is from the exponential family, and so we can appeal to the result (10.187), which tells us that the parameters of $q^{\mathrm{new}}(\pmb{\theta})$ are obtained by matching its expected sufficient statistics to the corresponding moments of (10.196). We shall assume that this is a tractable operation. For example, if we choose $q(\pmb \theta)$ to be a Gaussian distribution $\mathcal{N}(\pmb{\theta} | \pmb{\mu}, \pmb{\Sigma})$ , then $\pmb{\mu}$ is set equal to the mean of the (unnormalized) distribution $f_{j}(\pmb{\theta}) q^{\backslash j}(\pmb{\theta})$ , and  is set to its covariance. More generally, it is straightforward to obtain the required expectations for any member of the exponential family, provided it can be normalized, because the expected statistics can be related to the derivatives of the normalization coefficient, as given by (2.226). The EP approximation is illustrated in Figure 10.14.

From (10.193), we see that the revised factor $\widetilde{f}_{j}(\pmb{\theta})$ can be found by taking $q^{\mathrm{new}}(\pmb{\theta})$ and dividing out the remaining factors so that

$$
\widetilde{f}_{j}(\boldsymbol{\theta}) = K \frac{q^{\text{new}}(\boldsymbol{\theta})}{q^{\backslash j}(\boldsymbol{\theta})}\tag{10.199}
$$

where we have used (10.195). The coefficient K is determined by multiplying both

sides of (10.199) by $q^{\backslash i}(\pmb \theta)$ and integrating to give

$$
K = \int \widetilde{f}_{j}(\boldsymbol{\theta}) q^{\backslash j}(\boldsymbol{\theta}) d \boldsymbol{\theta}\tag{10.200}
$$

where we have used the fact that $q^{\mathrm{new}}(\pmb{\theta})$ is normalized. The value of K can therefore be found by matching zeroth-order moments

$$
\int \widetilde{f}_{j}(\boldsymbol{\theta}) q^{\backslash j}(\boldsymbol{\theta}) d \boldsymbol{\theta} = \int f_{j}(\boldsymbol{\theta}) q^{\backslash j}(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{10.201}
$$

Combining this with (10.197), we then see that $K = Z_{j}$ and so can be found by evaluating the integral in (10.197).

In practice, several passes are made through the set of factors, revising each factor in turn. The posterior distribution $p(\pmb \theta | \mathcal{D})$ is then approximated using (10.191), and the model evidence $p(\mathcal{D})$ can be approximated by using (10.190) with the factors $f_{i}(\pmb \theta)$ replaced by their approximations $\widetilde{f}_{i}(\pmb \theta)$

## Expectation Propagation

We are given a joint distribution over observed data $\mathcal{D}$ and stochastic variables θ in the form of a product of factors

$$
p(\mathcal{D}, \boldsymbol{\theta}) = \prod_{i} f_{i}(\boldsymbol{\theta})\tag{10.202}
$$

and we wish to approximate the posterior distribution $p(\pmb \theta | \mathcal{D})$ by a distribution of the form 1

$$
q(\pmb{\theta}) = \frac{1}{Z} \prod_{i} \widetilde{f}_{i}(\pmb{\theta}).\tag{10.203}
$$

We also wish to approximate the model evidence $p(\mathcal D)$

1. Initialize all of the approximating factors $\widetilde{f}_{i}(\pmb \theta)$

2. Initialize the posterior approximation by setting

$$
q(\boldsymbol{\theta}) \propto \prod_{i} \widetilde{f}_{i}(\boldsymbol{\theta}).\tag{10.204}
$$

3. Until convergence:

(a) Choose a factor $\widetilde{f}_{j}(\pmb{\theta})$ to refine.

(b) Remove $\widetilde{f}_{j}(\pmb{\theta})$ from the posterior by division

$$
q^{\backslash j}(\boldsymbol{\theta}) = \frac{q(\boldsymbol{\theta})}{\widetilde{f}_{j}(\boldsymbol{\theta})}.\tag{10.205}
$$

(c) Evaluate the new posterior by setting the sufficient statistics (moments) of $q^{\mathrm{new}}(\pmb{\theta})$ equal to those of $q^{\setminus j}({\pmb \theta}){\overline{{f_{j}}}}({\pmb \theta})$ , including evaluation of the normalization constant

$$
Z_{j} = \int q^{\backslash j}(\boldsymbol{\theta}) f_{j}(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{10.206}
$$

(d) Evaluate and store the new factor

$$
\widetilde{f}_{j}(\boldsymbol{\theta}) = Z_{j} \frac{q^{\mathrm{new}}(\boldsymbol{\theta})}{q^{\backslash j}(\boldsymbol{\theta})}.\tag{10.207}
$$

4. Evaluate the approximation to the model evidence

$$
p(\mathcal{D}) \simeq \int \prod_{i} \widetilde{f}_{i}(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{10.208}
$$

A special case of EP, known as assumed density filtering (ADF) or moment matching (Maybeck, 1982; Lauritzen, 1992; Boyen and Koller, 1998; Opper and Winther, 1999), is obtained by initializing all of the approximating factors except the first to unity and then making one pass through the factors updating each of them once. Assumed density filtering can be appropriate for on-line learning in which data points are arriving in a sequence and we need to learn from each data point and then discard it before considering the next point. However, in a batch setting we have the opportunity to re-use the data points many times in order to achieve improved accuracy, and it is this idea that is exploited in expectation propagation. Furthermore, if we apply ADF to batch data, the results will have an undesirable dependence on the (arbitrary) order in which the data points are considered, which again EP can overcome.

One disadvantage of expectation propagation is that there is no guarantee that the iterations will converge. However, for approximations $q(\pmb \theta)$ in the exponential family, if the iterations do converge, the resulting solution will be a stationary point of a particular energy function (Minka, 2001a), although each iteration of EP does not necessarily decrease the value of this energy function. This is in contrast to variational Bayes, which iteratively maximizes a lower bound on the log marginal likelihood, in which each iteration is guaranteed not to decrease the bound. It is possible to optimize the EP cost function directly, in which case it is guaranteed to converge, although the resulting algorithms can be slower and more complex to implement.

Another difference between variational Bayes and EP arises from the form of KL divergence that is minimized by the two algorithms, because the former minimizes $\operatorname{KL}(q \| p)$ whereas the latter minimizes $\mathrm{KL}(p \Vert q)$ . As we saw in Figure 10.3, for distributions $p(\pmb \theta)$ which are multimodal, minimizing $\mathrm{KL}(p | | q)$ can lead to poor approximations. In particular, if EP is applied to mixtures the results are not sensible because the approximation tries to capture all of the modes of the posterior distribution. Conversely, in logistic-type models, EP often out-performs both local variational methods and the Laplace approximation (Kuss and Rasmussen, 2006).

Figure 10.15

Illustration of the clutter problem for a data space dimensionality of $D = 1$ Training data points, denoted by the crosses, are drawn from a mixture of two Gaussians with components shown in red and green. The goal is to infer the mean of the green Gaussian from the observed data.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/da15436bbfce8b3a5b492543ea232640a405de7fc83d8d5625d4d5c015d3ca74.jpg)

## 10.7.1 Example: The clutter problem

Following Minka (2001b), we illustrate the EP algorithm using a simple example in which the goal is to infer the mean $\pmb \theta$ of a multivariate Gaussian distribution over a variable given a set of observations drawn from that distribution. To make the problem more interesting, the observations are embedded in background clutter, which itself is also Gaussian distributed, as illustrated in Figure 10.15. The distribution of observed values  is therefore a mixture of Gaussians, which we take to be of the form

$$
p(\mathbf{x} | \boldsymbol{\theta}) =(1 - w) \mathcal{N}(\mathbf{x} | \boldsymbol{\theta}, \mathbf{I}) + w \mathcal{N}(\mathbf{x} | \mathbf{0}, a \mathbf{I})\tag{10.209}
$$

where $w$ is the proportion of background clutter and is assumed to be known. The prior over $\pmb \theta$ is taken to be Gaussian

$$
p(\boldsymbol{\theta}) = \mathcal{N}(\boldsymbol{\theta} | \mathbf{0}, b \mathbf{I})\tag{10.210}
$$

and Minka (2001a) chooses the parameter values $a = 10, b = 100$ and $w = 0.5$ The joint distribution of N observations $\mathcal{D} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ and θ is given by

$$
p(\mathcal{D}, \pmb{\theta}) = p(\pmb{\theta}) \prod_{n = 1}^{N} p(\mathbf{x}_{n} | \pmb{\theta})\tag{10.211}
$$

and so the posterior distribution comprises a mixture of $2^{N}$ Gaussians. Thus the computational cost of solving this problem exactly would grow exponentially with the size of the data set, and so an exact solution is intractable for moderately large $N$

To apply EP to the clutter problem, we first identify the factors $f_{0}(\pmb{\theta}) = p(\pmb{\theta})$ and $f_{n}(\pmb{\theta}) = p(\mathbf x_{n} | \pmb \theta)$ . Next we select an approximating distribution from the exponential family, and for this example it is convenient to choose a spherical Gaussian

$$
q(\boldsymbol{\theta}) = \mathcal{N}(\boldsymbol{\theta} | \mathbf{m}, v \mathbf{I}).\tag{10.212}
$$

The factor approximations will therefore take the form of exponential-quadratic functions of the form

$$
\widetilde{f}_{n}(\pmb{\theta}) = s_{n} \mathcal{N}(\pmb{\theta} | \mathbf{m}_{n}, v_{n} \mathbf{I})\tag{10.213}
$$

where $n = 1, \ldots, N$ , and we set $\widetilde{f}_{0}(\pmb{\theta})$ equal to the prior $p(\pmb \theta)$ . Note that the use of $\mathcal{N}(\pmb \theta | \cdot, \cdot)$ does not imply that the right-hand side is a well-defined Gaussian density (in fact, as we shall see, the variance parameter $v_{n}$ can be negative) but is simply a convenient shorthand notation. The approximations $\widetilde{f}_{n}(\pmb{\theta})$ , for $n = 1, \ldots, N$ , can be initialized to unity, corresponding to $s_{n} =(2 \pi v_{n})^{D / 2}, v_{n} \to \infty$ and $\mathbf{m}_{n} = \mathbf{0}$ where $D$ is the dimensionality of and hence of $\pmb{\theta}.$ . The initial $q(\pmb \theta)$ <sup>m 0</sup>, defined by <sup>x</sup>(10.191), is therefore equal to the prior.

We then iteratively refine the factors by taking one factor $f_{n}(\pmb \theta)$ at a time and applying (10.205), (10.206), and (10.207). Note that we do not need to revise the term $f_{0}(\pmb{\theta})$ because an EP update will leave this term unchanged. Here we state the results and leave the reader to fill in the details.

First we remove the current estimate ${\dot{f}}_{n}(\pmb{\theta})$ from $q(\pmb \theta)$ by division using (10.205) to give $q^{\setminus n}(\pmb \theta)$ , which has mean and inverse variance given by

$$
{\bf m}^{\backslash n} ={\bf m} + v^{\backslash n} v_{n}^{- 1}({\bf m} -{\bf m}_{n})\tag{10.214}
$$

$$
(v^{\backslash n})^{- 1} = v^{- 1} - v_{n}^{- 1}.\tag{10.215}
$$

Next we evaluate the normalization constant $Z_{n}$ using (10.206) to give

$$
Z_{n} =(1 - w) \mathcal{N}(\mathbf{x}_{n} | \mathbf{m}^{\backslash n},(v^{\backslash n} + 1) \mathbf{I}) + w \mathcal{N}(\mathbf{x}_{n} | \mathbf{0}, a \mathbf{I}).\tag{10.216}
$$

Similarly, we compute the mean and variance of $q^{\mathrm{new}}(\pmb{\theta})$ by finding the mean and variance of $q^{\backslash n}(\pmb \theta) \bar{f}_{n}(\pmb \theta)$ to give

$$
\mathbf{m} = \mathbf{m}^{\backslash n} + \rho_{n} \frac{v^{\backslash n}}{v^{\backslash n} + 1}(\mathbf{x}_{n} - \mathbf{m}^{\backslash n})\tag{10.217}
$$

$$
v = v^{\backslash n} - \rho_{n} \frac{(v^{\backslash n})^{2}}{v^{\backslash n} + 1} + \rho_{n}(1 - \rho_{n}) \frac{(v^{\backslash n})^{2} \| \mathbf{x}_{n} - \mathbf{m}^{\backslash n} \|^{2}}{D(v^{\backslash n} + 1)^{2}}\tag{10.218}
$$

where the quantity

$$
\rho_{n} = 1 - \frac{w}{Z_{n}} \mathcal{N}(\mathbf{x}_{n} | \mathbf{0}, a \mathbf{I})\tag{10.219}
$$

has a simple interpretation as the probability of the point ${\bf x}_{n}$ not being clutter. Then we use (10.207) to compute the refined factor $\widetilde{f}_{n}(\pmb{\theta})$ whose parameters are given by

$$
{v_{n}^{- 1}} ={(v^{\mathrm{new}})^{- 1} -(v^{\backslash n})^{- 1}}\tag{10.220}
$$

$$
\mathbf{m}_{n} = \mathbf{m}^{\backslash n} +(v_{n} + v^{\backslash n})(v^{\backslash n})^{- 1}(\mathbf{m}^{\mathrm{new}} - \mathbf{m}^{\backslash n})\tag{10.221}
$$

$$
Z_{n}
$$

$$
{s_{n}} ={\frac{n}{(2 \pi v_{n})^{D / 2} \mathcal{N}(\mathbf{m}_{n} | \mathbf{m}^{\backslash n},(v_{n} + v^{\backslash n}) \mathbf{I})}.}\tag{10.222}
$$

This refinement process is repeated until a suitable termination criterion is satisfied, for instance that the maximum change in parameter values resulting from a complete pass through all factors is less than some threshold. Finally, we use (10.208) to evaluate the approximation to the model evidence, given by

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/e5cfc6504caf746b2cb5c0c3888e3486b2ee6b473863495a46e9908b77c574a5.jpg)

![Figure 10.16](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/b2a1fca96bad04c611f43938059ab94f3e1cfd2ceaf6338b3c978157bc8103ea.jpg)  
Figure 10.16 Examples of the approximation of specific factors for a one-dimensional version of the clutter problem, showing $f_{n}(\theta)$ in blue, ${\widetilde{f}}_{n}(\theta)$ in red, and $q^{\setminus n}(\theta)$ in green. Notice that the current form for $q^{\setminus n}(\theta)$ controls the range of θ over which ${\widetilde{f}}_{n}(\theta)$ will be a good approximation to $f_{n}(\theta)$

$$
p(\mathcal{D}) \simeq(2 \pi v^{\mathrm{new}})^{D / 2} \exp(B / 2) \prod_{n = 1}^{N} \left\{s_{n}(2 \pi v_{n})^{- D / 2} \right\}\tag{10.223}
$$

where

$$
B = \frac{(\mathbf{m}^{\mathrm{new}})^{\mathrm{T}} \mathbf{m}^{\mathrm{new}}}{v} - \sum_{n = 1}^{N} \frac{\mathbf{m}_{n}^{\mathrm{T}} \mathbf{m}_{n}}{v_{n}}.\tag{10.224}
$$

Examples factor approximations for the clutter problem with a one-dimensional parameter space $\theta$ are shown in Figure 10.16. Note that the factor approximations can have infinite or even negative values for the ‘variance’ parameter $v_{n}$ . This simply corresponds to approximations that curve upwards instead of downwards and are not necessarily problematic provided the overall approximate posterior $q(\pmb \theta)$ has positive variance. Figure 10.17 compares the performance of EP with variational Bayes (mean field theory) and the Laplace approximation on the clutter problem.

## 10.7.2 Expectation propagation on graphs

So far in our general discussion of EP, we have allowed the factors $f_{i}(\pmb \theta)$ in the distribution $p(\pmb \theta)$ to be functions of all of the components of θ, and similarly for the approximating factors $\widetilde f(\pmb \theta)$ in the approximating distribution $q(\pmb \theta)$ . We now consider situations in which the factors depend only on subsets of the variables. Such restrictions can be conveniently expressed using the framework of probabilistic graphical models, as discussed in Chapter 8. Here we use a factor graph representation because this encompasses both directed and undirected graphs.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/8deb410d1c8dc5ce013e3f63ee098ec1f0dad1dd6ef74f1f638fd14ec830ff46.jpg)

![Figure 10.17](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/8256298a6c77242f17de527215696828d9680141c1b3736fac4b6d55577bcf74.jpg)  
Figure 10.17 Comparison of expectation propagation, variational inference, and the Laplace approximation on the clutter problem. The left-hand plot shows the error in the predicted posterior mean versus the number of floating point operations, and the right-hand plot shows the corresponding results for the model evidence.

We shall focus on the case in which the approximating distribution is fully factorized, and we shall show that in this case expectation propagation reduces to loopy belief propagation (Minka, 2001a). To start with, we show this in the context of a simple example, and then we shall explore the general case.

First of all, recall from (10.17) that if we minimize the Kullback-Leibler divergence KL $(p \| q)$ with respect to a factorized distribution $q,$ then the optimal solution for each factor is simply the corresponding marginal of $p.$

Now consider the factor graph shown on the left in Figure 10.18, which was introduced earlier in the context of the sum-product algorithm. The joint distribution is given by

$$
p(\mathbf{x}) = f_{a}(x_{1}, x_{2}) f_{b}(x_{2}, x_{3}) f_{c}(x_{2}, x_{4}).\tag{10.225}
$$

We seek an approximation $q(\mathbf{x})$ that has the same factorization, so that

$$
q(\mathbf{x}) \propto \widetilde{f}_{a}(x_{1}, x_{2}) \widetilde{f}_{b}(x_{2}, x_{3}) \widetilde{f}_{c}(x_{2}, x_{4}).\tag{10.226}
$$

Note that normalization constants have been omitted, and these can be re-instated at the end by local normalization, as is generally done in belief propagation. Now suppose we restrict attention to approximations in which the factors themselves factorize with respect to the individual variables so that

$$
q(\mathbf{x}) \propto \widetilde{f}_{a1}(x_{1}) \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{b2}(x_{2}) \widetilde{f}_{b3}(x_{3}) \widetilde{f}_{c2}(x_{2}) \widetilde{f}_{c4}(x_{4})\tag{10.227}
$$

which corresponds to the factor graph shown on the right in Figure 10.18. Because the individual factors are factorized, the overall distribution $q(\mathbf{x})$ is itself fully factorized.

Now we apply the EP algorithm using the fully factorized approximation. Suppose that we have initialized all of the factors and that we choose to refine factor $\widetilde{f}_{b}(x_{2}, x_{3}) = \widetilde{f}_{b2}(x_{2}) \widetilde{f}_{b3}(x_{3})$ . We first remove this factor from the approximating distribution to give

![Figure 10.18](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p401-600/images/bdf38965304f07fd862f82cc997122cedad4f3e8c8d09f1c26fbe15a3d3e11a7.jpg)  
Figure 10.18 On the left is a simple factor graph from Figure 8.51 and reproduced here for convenience. On the right is the corresponding factorized approximation.

$$
q^{\backslash b}(\mathbf{x}) = \widetilde{f}_{a1}(x_{1}) \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{c2}(x_{2}) \widetilde{f}_{c4}(x_{4})\tag{10.228}
$$

and we then multiply this by the exact factor $f_{b}(x_{2}, x_{3})$ to give

$$
\widehat{p}(\mathbf{x}) = q^{\backslash b}(\mathbf{x}) f_{b}(x_{2}, x_{3}) = \widetilde{f}_{a1}(x_{1}) \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{c2}(x_{2}) \widetilde{f}_{c4}(x_{4}) f_{b}(x_{2}, x_{3}).\tag{10.229}
$$

We now find $q^{\mathrm{new}}(\mathbf{x})$ by minimizing the Kullback-Leibler divergence $\operatorname{KL}(\widehat{p} \| q^{\mathrm{new}})$ <sup>x</sup>The result, as noted above, is that $q^{\mathrm{new}}(\mathbf{z})$ comprises the product of factors, one for each variable $x_{i}$ <sup>z</sup>, in which each factor is given by the corresponding marginal of $\widehat{p}({\bf x})$ . These four marginals are given by

$$
\widehat{p}(x_{1}) \propto \widetilde{f}_{a1}(x_{1})\tag{10.230}
$$

$$
\widehat{p}(x_{2}) \propto \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{c2}(x_{2}) \sum_{x_{3}} f_{b}(x_{2}, x_{3})\tag{10.231}
$$

$$
\widehat{p}(x_{3}) \propto \sum_{x_{2}} \left\{f_{b}(x_{2}, x_{3}) \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{c2}(x_{2}) \right\}\tag{10.232}
$$

$$
\widehat{p}(x_{4}) \propto \widetilde{f}_{c4}(x_{4})\tag{10.233}
$$

and $q^{\mathrm{new}}(\mathbf{x})$ is obtained by multiplying these marginals together. We see that the only factors in $q(\mathbf{x})$ that change when we update $\widetilde{f}_{b}(x_{2}, x_{3})$ are those that involve the variables in $f_{b}$ namely $x_{2}$ and $x_{3}$ . To obtain the refined factor $\widetilde{f}_{b}(x_{2}, x_{3}) =$ $\widetilde{f}_{b2}(x_{2}) \widetilde{f}_{b3}(x_{3})$ we simply divide $q^{\mathrm{new}}(\mathbf{x})$ by $q^{\backslash b}({\mathbf{x}})$ , which gives

$$
\widetilde{f}_{b2}(x_{2}) \propto \sum_{x_{3}} f_{b}(x_{2}, x_{3})\tag{10.234}
$$

$$
\widetilde{f}_{b3}(x_{3}) \propto \sum_{x_{2}} \left\{f_{b}(x_{2}, x_{3}) \widetilde{f}_{a2}(x_{2}) \widetilde{f}_{c2}(x_{2}) \right\}.\tag{10.235}
$$

These are precisely the messages obtained using belief propagation in which messages from variable nodes to factor nodes have been folded into the messages from factor nodes to variable nodes. In particular, $\widetilde{f}_{b2}(x_{2})$ corresponds to the message $\mu_{f_{b} \to x_{2}}(x_{2})$ sent by factor node $f_{b}$ to variable node $x_{2}$ and is given by (8.81). Similarly, if we substitute (8.78) into (8.79), we obtain (10.235) in which $\widetilde{f}_{a2}(x_{2})$ corresponds to $\mu_{f_{a} \to x_{2}}(x_{2})$ and $\widetilde{f}_{c2}(x_{2})$ corresponds to $\mu_{f_{c} \to x_{2}}(x_{2})$ , giving the message $\widetilde{f}_{b3}(x_{3})$ which corresponds to $\mu_{f_{b} \to x_{3}}(x_{3})$

This result differs slightly from standard belief propagation in that messages are passed in both directions at the same time. We can easily modify the EP procedure to give the standard form of the sum-product algorithm by updating just one of the factors at a time, for instance if we refine only $\widetilde{f}_{b3}(x_{3})$ , then $\widetilde{f}_{b2}(x_{2})$ is unchanged by definition, while the refined version of $\widetilde{f}_{b3}(x_{3})$ is again given by (10.235). If we are refining only one term at a time, then we can choose the order in which the refinements are done as we wish. In particular, for a tree-structured graph we can follow a two-pass update scheme, corresponding to the standard belief propagation schedule, which will result in exact inference of the variable and factor marginals. The initialization of the approximation factors in this case is unimportant.

Now let us consider a general factor graph corresponding to the distribution

$$
p(\boldsymbol{\theta}) = \prod_{i} f_{i}(\boldsymbol{\theta}_{i})\tag{10.236}
$$

where $\theta_{i}$ represents the subset of variables associated with factor $f_{i}$ . We approximate this using a fully factorized distribution of the form

$$
q(\boldsymbol{\theta}) \propto \prod_{i} \prod_{k} \widetilde{f}_{ik}(\theta_{k})\tag{10.237}
$$

where $\theta_{k}$ corresponds to an individual variable node. Suppose that we wish to refine the particular term $\widetilde{f}_{jl}(\theta_{l})$ keeping all other terms fixed. We first remove the term $\widetilde{f}_{j}(\pmb{\theta}_{j})$ from $q(\pmb \theta)$ to give

$$
q^{\backslash j}(\pmb{\theta}) \propto \prod_{i \neq j} \prod_{k} \widetilde{f}_{ik}(\theta_{k})\tag{10.238}
$$

and then multiply by the exact factor $f_{j}(\pmb{\theta}_{j})$ . To determine the refined term $\widetilde{f}_{jl}(\theta_{l})$ we need only consider the functional dependence on $\theta_{l}$ , and so we simply find the corresponding marginal of

$$
q^{\backslash j}(\boldsymbol{\theta}) f_{j} \left(\boldsymbol{\theta}_{j}\right).\tag{10.239}
$$

Up to a multiplicative constant, this involves taking the marginal of $f_{j}(\pmb{\theta}_{j})$ multiplied by any terms from $q^{\setminus j}(\pmb \theta)$ that are functions of any of the variables in $\theta_{j}$ . Terms that correspond to other factors $\widetilde{f}_{i}(\pmb \theta_{i})$ for $i \neq j$ will cancel between numerator and denominator when we subsequently divide by $q^{\setminus j}(\pmb \theta)$ . We therefore obtain

$$
\widetilde{f}_{jl}(\theta_{l}) \propto \sum_{\theta_{m \neq l} \in \boldsymbol{\theta}_{j}} f_{j}(\boldsymbol{\theta}_{j}) \prod_{k} \prod_{m \neq l} \widetilde{f}_{km}(\theta_{m}).\tag{10.240}
$$

We recognize this as the sum-product rule in the form in which messages from variable nodes to factor nodes have been eliminated, as illustrated by the example shown in Figure 8.50. The quantity $\widetilde{f}_{jm}(\theta_{m})$ corresponds to the message $\mu_{f_{j} \to \theta_{m}}(\theta_{m})$ which factor node $j$ sends to variable node $m,$ and the product over k in $(10.240)$ is over all factors that depend on the variables $\theta_{m}$ that have variables (other than variable $\theta_{l})$ in common with factor $f_{j}(\pmb{\theta}_{j})$ . In other words, to compute the outgoing message from a factor node, we take the product of all the incoming messages from other factor nodes, multiply by the local factor, and then marginalize.

Thus, the sum-product algorithm arises as a special case of expectation propagation if we use an approximating distribution that is fully factorized. This suggests that more flexible approximating distributions, corresponding to partially disconnected graphs, could be used to achieve higher accuracy. Another generalization is to group factors $f_{i}(\pmb \theta_{i})$ together into sets and to refine all the factors in a set together at each iteration. Both of these approaches can lead to improvements in accuracy (Minka, 2001b). In general, the problem of choosing the best combination of grouping and disconnection is an open research issue.

We have seen that variational message passing and expectation propagation optimize two different forms of the Kullback-Leibler divergence. Minka (2005) has shown that a broad range of message passing algorithms can be derived from a common framework involving minimization of members of the alpha family of divergences, given by (10.19). These include variational message passing, loopy belief propagation, and expectation propagation, as well as a range of other algorithms, which we do not have space to discuss here, such as tree-reweighted message passing (Wainwright et al., 2005), fractional belief propagation (Wiegerinck and Heskes, 2003), and power EP (Minka, 2004).

## Exercises

10.1 (★) www Verify that the log marginal distribution of the observed data ln $p(\mathbf{X})$ can be decomposed into two terms in the form (10.2) where $\mathcal{L}(q)$ <sup>X</sup>is given by (10.3) and $\mathrm{KL}(q \| p)$ is given by (10.4).

10.2 (★) Use the properties $\mathbb{E}[z_{1}] = m_{1}$ and $\mathbb{E}[z_{2}] = m_{2}$ to solve the simultaneous equations (10.13) and (10.15), and hence show that, provided the original distribution $p(\mathbf{z})$ is nonsingular, the unique solution for the means of the factors in the approxi-<sup>z</sup>mation distribution is given by $\mathbb{E}[z_{1}] = \mu_{1}$ and $\mathbb{E}[z_{2}] = \mu_{2}$

10.3 (★★) www Consider a factorized variational distribution $q(\mathbf{Z})$ of the form (10.5). By using the technique of Lagrange multipliers, verify that minimization of the Kullback-Leibler divergence ${\mathrm{KL}}(p \Vert q)$ with respect to one of the factors $q_{i}(\mathbf{Z}_{i})$ keeping all other factors fixed, leads to the solution (10.17).

10.4 (★★) Suppose that $p(\mathbf{x})$ is some fixed distribution and that we wish to approximate it using a Gaussian distribution $q(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \Sigma)$ . By writing down the form of the KL divergence $\mathrm{KL}(p | | q)$ for a Gaussian $q(\mathbf{x})$ and then differentiating, show that minimization of $\mathrm{KL}(p | | q)$ with respect to $\pmb{\mu}$ and $\pmb{\Sigma}$ leads to the result that $\pmb{\mu}$ is given by the expectation of under $p(\mathbf{x})$ and that is given by the covariance.

10.5 (★★) www Consider a model in which the set of all hidden stochastic variables, denoted collectively by $\mathbf{Z},$ comprises some latent variables together with some model parameters $\pmb{\theta}.$ Suppose we use a variational distribution that factorizes between latent variables and parameters so that $q(\mathbf{z}, \pmb{\theta}) = q_{\mathbf{z}}(\mathbf{z}) q_{\pmb{\theta}}(\pmb{\theta})$ , in which the distribution $q_{\pmb{\theta}}(\pmb{\theta})$ <sup>z z</sup>is approximated by a point estimate of the form ${q}_{\pmb{\theta}}(\pmb{\theta}) = \delta(\pmb{\theta} - \pmb{\theta}_{0})$ where $\theta_{0}$ is a vector of free parameters. Show that variational optimization of this factorized distribution is equivalent to an EM algorithm, in which the E step optimizes $q_{\mathbf{z}}(\mathbf{z})$ and the M step maximizes the expected complete-data log posterior distribution of $\pmb \theta$ with respect to $\theta_{0}$

10.6 (★★) The alpha family of divergences is defined by (10.19). Show that the Kullback-Leibler divergence $\mathrm{KL}(p \Vert q)$ corresponds to $\alpha 1$ . This can be done by writing $p^{\epsilon} = \exp(\epsilon \ln p) = 1 + \epsilon \ln p + O(\epsilon^{2})$ and then taking $\epsilon 0$ . Similarly show that $\mathrm{KL}(q \| p)$ corresponds to $\alpha - 1$

10.7 (★★) Consider the problem of inferring the mean and precision of a univariate Gaussian using a factorized variational approximation, as considered in Section 10.1.3. Show that the factor $q_{\mu}(\mu)$ is a Gaussian of the form $\mathcal{N}(\mu \vert \mu_{N}, \lambda_{N}^{- 1})$ with mean and precision given by (10.26) and (10.27), respectively. Similarly show that the factor $q_{\tau}(\tau)$ is a gamma distribution of the form ${\mathrm{Gam}}(\tau | a_{N}, b_{N})$ with parameters given by (10.29) and (10.30).

10.8 (★) Consider the variational posterior distribution for the precision of a univariate Gaussian whose parameters are given by (10.29) and (10.30). By using the standard results for the mean and variance of the gamma distribution given by (B.27) and (B.28), show that if we let $N \infty$ , this variational posterior distribution has a mean given by the inverse of the maximum likelihood estimator for the variance of the data, and a variance that goes to zero.

10.9 (★★) By making use of the standard result $\mathbb{E}[\tau] = a_{N} / b_{N}$ for the mean of a gamma distribution, together with (10.26), (10.27), (10.29), and (10.30), derive the result (10.33) for the reciprocal of the expected precision in the factorized variational treatment of a univariate Gaussian.

10.10 (★) www Derive the decomposition given by (10.34) that is used to find approximate posterior distributions over models using variational inference.

10.11 (★★) www By using a Lagrange multiplier to enforce the normalization constraint on the distribution $q(m)$ , show that the maximum of the lower bound (10.35) is given by (10.36).

10.12 (★★) Starting from the joint distribution (10.41), and applying the general result (10.9), show that the optimal variational distribution $q^{\star}(\mathbf{Z})$ over the latent variables <sup>Z</sup>for the Bayesian mixture of Gaussians is given by (10.48) by verifying the steps given in the text.

10.13 (★★) www Starting from (10.54), derive the result (10.59) for the optimum variational posterior distribution over $\mu_{k}$ and $\mathbf{\Lambda}_{\Lambda_{k}}$ in the Bayesian mixture of Gaussians, <sup>Λ</sup>and hence verify the expressions for the parameters of this distribution given by (10.60)–(10.63).

10.14 (★★) Using the distribution (10.59), verify the result (10.64).

10.15 (★) Using the result (B.17), show that the expected value of the mixing coefficients in the variational mixture of Gaussians is given by (10.69).

10.16 (★★) www Verify the results (10.71) and (10.72) for the first two terms in the lower bound for the variational Gaussian mixture model given by (10.70).

10.17 (★★★) Verify the results (10.73)–(10.77) for the remaining terms in the lower bound for the variational Gaussian mixture model given by (10.70).

10.18 (★★★) In this exercise, we shall derive the variational re-estimation equations for the Gaussian mixture model by direct differentiation of the lower bound. To do this we assume that the variational distribution has the factorization defined by (10.42) and (10.55) with factors given by (10.48), (10.57), and (10.59). Substitute these into (10.70) and hence obtain the lower bound as a function of the parameters of the variational distribution. Then, by maximizing the bound with respect to these parameters, derive the re-estimation equations for the factors in the variational distribution, and show that these are the same as those obtained in Section 10.2.1.

10.19 (★★) Derive the result (10.81) for the predictive distribution in the variational treatment of the Bayesian mixture of Gaussians model.

10.20 (★★) www This exercise explores the variational Bayes solution for the mixture of Gaussians model when the size N of the data set is large and shows that it reduces (as we would expect) to the maximum likelihood solution based on EM derived in Chapter 9. Note that results from Appendix B may be used to help answer this exercise. First show that the posterior distribution $q^{\star}(\Lambda_{k})$ of the precisions becomes sharply peaked around the maximum likelihood solution. Do the same for the posterior distribution of the means $q^{\star}(\pmb{\mu}_{k} | \pmb{\Lambda}_{k})$ . Next consider the posterior distribution $q^{\star}(\pi)$ <sup>Λ</sup>for the mixing coefficients and show that this too becomes sharply peaked around the maximum likelihood solution. Similarly, show that the responsibilities become equal to the corresponding maximum likelihood values for large N, by making use of the following asymptotic result for the digamma function for large x

$$
\psi(x) = \ln x + O \left(1 / x\right).\tag{10.241}
$$

Finally, by making use of (10.80), show that for large N , the predictive distribution becomes a mixture of Gaussians.

10.21 (★) Show that the number of equivalent parameter settings due to interchange symmetries in a mixture model with K components is K!.

10.22 (★★) We have seen that each mode of the posterior distribution in a Gaussian mixture model is a member of a family of K! equivalent modes. Suppose that the result of running the variational inference algorithm is an approximate posterior distribution $q$ that is localized in the neighbourhood of one of the modes. We can then approximate the full posterior distribution as a mixture of $K !$ such $q$ distributions, once centred on each mode and having equal mixing coefficients. Show that if we assume negligible overlap between the components of the $q$ mixture, the resulting lower bound differs from that for a single component $q$ distribution through the addition of an extra term ln K!.

10.23 (★★) www Consider a variational Gaussian mixture model in which there is no prior distribution over mixing coefficients $\{\pi_{k}\}$ . Instead, the mixing coefficients are treated as parameters, whose values are to be found by maximizing the variational lower bound on the log marginal likelihood. Show that maximizing this lower bound with respect to the mixing coefficients, using a Lagrange multiplier to enforce the constraint that the mixing coefficients sum to one, leads to the re-estimation result (10.83). Note that there is no need to consider all of the terms in the lower bound but only the dependence of the bound on the $\{\pi_{k}\}$

10.24 (★★) www We have seen in Section 10.2 that the singularities arising in the maximum likelihood treatment of Gaussian mixture models do not arise in a Bayesian treatment. Discuss whether such singularities would arise if the Bayesian model were solved using maximum posterior (MAP) estimation.

10.25 (★★) The variational treatment of the Bayesian mixture of Gaussians, discussed in Section 10.2, made use of a factorized approximation (10.5) to the posterior distribution. As we saw in Figure 10.2, the factorized assumption causes the variance of the posterior distribution to be under-estimated for certain directions in parameter space. Discuss qualitatively the effect this will have on the variational approximation to the model evidence, and how this effect will vary with the number of components in the mixture. Hence explain whether the variational Gaussian mixture will tend to under-estimate or over-estimate the optimal number of components.

10.26 (★★★) Extend the variational treatment of Bayesian linear regression to include a gamma hyperprior Gam $(\beta | c_{0}, d_{0})$ over $\beta$ and solve variationally, by assuming a factorized variational distribution of the form $q(\mathbf{w}) q(\alpha) q(\beta)$ . Derive the variational <sup>w</sup>update equations for the three factors in the variational distribution and also obtain an expression for the lower bound and for the predictive distribution.

10.27 (★★) By making use of the formulae given in Appendix B show that the variational lower bound for the linear basis function regression model, defined by (10.107), can be written in the form (10.107) with the various terms defined by (10.108)–(10.112).

10.28 (★★★) Rewrite the model for the Bayesian mixture of Gaussians, introduced in Section 10.2, as a conjugate model from the exponential family, as discussed in Section 10.4. Hence use the general results (10.115) and (10.119) to derive the specific results (10.48), (10.57), and (10.59).

10.29 (★) www Show that the function $f(x) = \ln(x)$ is concave for $0 < x < \infty$ by computing its second derivative. Determine the form of the dual function $g(\lambda)$ defined by (10.133), and verify that minimization of $\lambda x - g(\lambda)$ with respect to λ according to (10.132) indeed recovers the function ln(x).

10.30 (★) By evaluating the second derivative, show that the log logistic function $f(x) =$ $- \ln(1 + e^{- x})$ is concave. Derive the variational upper bound (10.137) directly by making a second order Taylor expansion of the log logistic function around a point $x = \xi$

10.31 (★★) By finding the second derivative with respect to x, show that the function $f(x) ={\dot{-}} \ln(e^{x{\mathord{\left/{\vphantom{\mathrm{12}}} \right.\kern - delimiterspace} 2}} + e^{- x / 2})$ is a concave function of $x.$ Now consider the second derivatives with respect to the variable $x^{2}$ and hence show that it is a convex function of $x^{2}$ . Plot graphs of $f(x)$ against x and against $x^{2}$ . Derive the lower bound (10.144) on the logistic sigmoid function directly by making a first order Taylor series expansion of the function $f(x)$ in the variable $x^{\mathrm{2}}$ centred on the value $\xi^{2}$

10.32 (★★) www Consider the variational treatment of logistic regression with sequential learning in which data points are arriving one at a time and each must be processed and discarded before the next data point arrives. Show that a Gaussian approximation to the posterior distribution can be maintained through the use of the lower bound (10.151), in which the distribution is initialized using the prior, and as each data point is absorbed its corresponding variational parameter $\xi_{n}$ is optimized.

10.33 (★) By differentiating the quantity $Q(\xi, \xi^{\mathrm{old}})$ defined by (10.161) with respect to the variational parameter $\xi_{n}$ show that the update equation for $\xi_{n}$ for the Bayesian logistic regression model is given by (10.163).

10.34 (★★) In this exercise we derive re-estimation equations for the variational parameters $\boldsymbol{\xi}$ in the Bayesian logistic regression model of Section 4.5 by direct maximization of the lower bound given by (10.164). To do this set the derivative of $\mathcal{L}(\pmb{\xi})$ with respect to $\xi_{n}$ equal to zero, making use of the result (3.117) for the derivative of the log of a determinant, together with the expressions (10.157) and (10.158) which define the mean and covariance of the variational posterior distribution $q(\mathbf{w})$ .

10.35 (★★) Derive the result (10.164) for the lower bound $\mathcal{L}(\pmb{\xi})$ in the variational logistic regression model. This is most easily done by substituting the expressions for the Gaussian prior $q(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{0}, \mathbf{S}_{0})$ , together with the lower bound $h(\mathbf{w}, \pmb{\xi})$ on <sup>w w m S</sup>the likelihood function, into the integral (10.159) which defines $\mathcal{L}(\pmb{\xi})$ . Next gather together the terms which depend on  in the exponential and complete the square <sup>w</sup>to give a Gaussian integral, which can then be evaluated by invoking the standard result for the normalization coefficient of a multivariate Gaussian. Finally take the logarithm to obtain (10.164).

10.36 (★★) Consider the ADF approximation scheme discussed in Section 10.7, and show that inclusion of the factor $f_{j}(\pmb \theta)$ leads to an update of the model evidence of the form

$$
p_{j}(\mathcal{D}) \simeq p_{j - 1}(\mathcal{D}) Z_{j}\tag{10.242}
$$

where $Z_{j}$ is the normalization constant defined by (10.197). By applying this result recursively, and initializing with $p_{0}(\mathcal{D}) = 1$ , derive the result

$$
p(\mathcal{D}) \simeq \prod_{j} Z_{j}.\tag{10.243}
$$

10.37 (★) www Consider the expectation propagation algorithm from Section 10.7, and suppose that one of the factors $f_{0}(\pmb{\theta})$ in the definition (10.188) has the same exponential family functional form as the approximating distribution $q(\pmb \theta)$ . Show that if the factor $\widetilde{f}_{0}(\pmb{\theta})$ is initialized to be $f_{0}(\pmb{\theta})$ , then an EP update to refine $\widetilde{f}_{0}(\pmb{\theta})$ leaves $\widetilde{f}_{0}(\pmb{\theta})$ unchanged. This situation typically arises when one of the factors is the prior $p(\pmb \theta)$ , and so we see that the prior factor can be incorporated once exactly and does not need to be refined.

10.38 (★★★) In this exercise and the next, we shall verify the results (10.214)–(10.224) for the expectation propagation algorithm applied to the clutter problem. Begin by using the division formula (10.205) to derive the expressions (10.214) and (10.215) by completing the square inside the exponential to identify the mean and variance. Also, show that the normalization constant $Z_{n}$ , defined by (10.206), is given for the clutter problem by (10.216). This can be done by making use of the general result (2.115).

10.39 (★★★) Show that the mean and variance of $q^{\mathrm{new}}(\pmb{\theta})$ for EP applied to the clutter problem are given by (10.217) and (10.218). To do this, first prove the following results for the expectations of $\pmb \theta$ and $\boldsymbol{\theta \theta^{\mathrm{T}}}$ under $q^{\mathrm{new}}(\pmb{\theta})$

$$
{\mathbb{E}[\pmb{\theta}]} ={\mathbf{m}^{\backslash n} + v^{\backslash n} \nabla_{\mathbf{m}^{\backslash n}} \ln Z_{n}}\tag{10.244}
$$

$$
\mathbb{E}[\boldsymbol{\theta}^{\mathrm{T}} \boldsymbol{\theta}] = 2(v^{\backslash n})^{2} \nabla_{v^{\backslash n}} \ln Z_{n} + 2 \mathbb{E}[\boldsymbol{\theta}]^{\mathrm{T}} \mathbf{m}^{\backslash n} - \| \mathbf{m}^{\backslash n} \|^{2}\tag{10.245}
$$

and then make use of the result (10.216) for $Z_{n}$ . Next, prove the results (10.220)– (10.222) by using (10.207) and completing the square in the exponential. Finally, use (10.208) to derive the result (10.223).

## 11


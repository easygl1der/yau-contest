---
title: "Chapter 18 \u2014 Confronting the Partition Function"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 18
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 9453
source_line_end: 10035
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
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 18 — Confronting the Partition Function

> [[../README|本书目录]] · [[17-chapter-17-monte-carlo-methods|上一章]] · [[19-chapter-19-approximate-inference|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 9453–10035。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Confronting the Partition Function

In section 16.2.2 we saw that many probabilistic models (commonly known as undirected graphical models) are defined by an unnormalized probability distribution $\tilde{p}(\mathbf{x};\theta)$ . We must normalize $\tilde{p}$ by dividing by a partition function $Z(\pmb{\theta})$ to obtain a valid probability distribution:

$$
p(\mathbf{x}; \boldsymbol{\theta}) = \frac{1}{Z(\boldsymbol{\theta})} \tilde{p}(\mathbf{x}; \boldsymbol{\theta}).\tag{18.1}
$$

The partition function is an integral (for continuous variables) or sum (for discrete variables) over the unnormalized probability of all states:

$$
\int \tilde{p}(\boldsymbol{x}) d \boldsymbol{x}\tag{18.2}
$$

or

$$
\sum_{\boldsymbol{x}} \tilde{p}(\boldsymbol{x}).\tag{18.3}
$$

This operation is intractable for many interesting models.

As we will see in chapter 20, several deep learning models are designed to have a tractable normalizing constant, or are designed to be used in ways that do not involve computing $p(\mathbf{x})$ at all. Yet, other models directly confront the challenge of intractable partition functions. In this chapter, we describe techniques used for training and evaluating models that have intractable partition functions.

## 18.1 The Log-Likelihood Gradient

What makes learning undirected models by maximum likelihood particularly difficult is that the partition function depends on the parameters. The gradient of the log-likelihood with respect to the parameters has a term corresponding to the gradient of the partition function:

$$
\nabla_{\boldsymbol{\theta}} \log p(\mathbf{x}; \boldsymbol{\theta}) = \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x}; \boldsymbol{\theta}) - \nabla_{\boldsymbol{\theta}} \log Z(\boldsymbol{\theta}).\tag{18.4}
$$

This is a well-known decomposition into the positive phase and negative phase of learning.

For most undirected models of interest, the negative phase is difficult. Models with no latent variables or with few interactions between latent variables typically have a tractable positive phase. The quintessential example of a model with a straightforward positive phase and a difficult negative phase is the RBM, which has hidden units that are conditionally independent from each other given the visible units. The case where the positive phase is difficult, with complicated interactions between latent variables, is primarily covered in chapter 19. This chapter focuses on the difficulties of the negative phase.

Let us look more closely at the gradient of $\log Z$ :

$$
\nabla_{\theta} \log Z\tag{18.5}
$$

$$
= \frac{\nabla_{\theta} Z}{Z}\tag{18.6}
$$

$$
= \frac{\nabla_{\theta} \sum_{\mathbf{x}} \tilde{p}(\mathbf{x})}{Z}\tag{18.7}
$$

$$
= \frac{\sum_{\mathbf{x}} \nabla_{\boldsymbol{\theta}} \tilde{p}(\mathbf{x})}{Z}.\tag{18.8}
$$

For models that guarantee $p(\mathbf{x}) > 0$ for all $\mathbf{x}$ , we can substitute $\exp(\log \tilde{p}(\mathbf{x}))$ for $\tilde{p}(\mathbf{x})$ :

$$
\frac{\sum_{\mathbf{x}} \nabla_{\boldsymbol{\theta}} \exp(\log \tilde{p}(\mathbf{x}))}{Z}\tag{18.9}
$$

$$
= \frac{\sum_{\mathbf{x}} \exp(\log \tilde{p}(\mathbf{x})) \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x})}{Z}\tag{18.10}
$$

$$
= \frac{\sum_{\mathbf{x}} \tilde{p}(\mathbf{x}) \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x})}{Z}\tag{18.11}
$$

$$
= \sum_{\mathbf{x}} p(\mathbf{x}) \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x})\tag{18.12}
$$

$$
= \mathbb{E}_{\mathbf{x} \sim p(\mathbf{x})} \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x}).\tag{18.13}
$$

This derivation made use of summation over discrete x, but a similar result applies using integration over continuous x. In the continuous version of the derivation, we use Leibniz's rule for differentiation under the integral sign to obtain the identity

$$
\nabla_{\boldsymbol{\theta}} \int \tilde{p}(\mathbf{x}) d \boldsymbol{x} = \int \nabla_{\boldsymbol{\theta}} \tilde{p}(\mathbf{x}) d \boldsymbol{x}.\tag{18.14}
$$

This identity is applicable only under certain regularity conditions on $\tilde{p}$ and $\nabla_{\theta} \tilde{p}(\mathbf{x})$ . In measure theoretic terms, the conditions are: (1) The unnormalized distribution $\tilde{p}$ must be a Lebesgue-integrable function of $\boldsymbol{x}$ for every value of $\boldsymbol{\theta}$ . (2) The gradient $\nabla_{\theta} \tilde{p}(\mathbf{x})$ must exist for all $\boldsymbol{\theta}$ and almost all $\boldsymbol{x}$ . (3) There must exist an integrable function $R(\boldsymbol{x})$ that bounds $\nabla_{\theta} \tilde{p}(\mathbf{x})$ in the sense that $\max_i |\frac{\partial}{\partial \theta_i} \tilde{p}(\mathbf{x})| \leq R(\boldsymbol{x})$ for all $\boldsymbol{\theta}$ and almost all $\boldsymbol{x}$ . Fortunately, most machine learning models of interest have these properties.

This identity

$$
\nabla_{\boldsymbol{\theta}} \log Z = \mathbb{E}_{\mathbf{x} \sim p(\mathbf{x})} \nabla_{\boldsymbol{\theta}} \log \tilde{p}(\mathbf{x})\tag{18.15}
$$

is the basis for a variety of Monte Carlo methods for approximately maximizing the likelihood of models with intractable partition functions.

The Monte Carlo approach to learning undirected models provides an intuitive framework in which we can think of both the positive phase and the negative phase. In the positive phase, we increase $\log \tilde{p}(\mathbf{x})$ for x drawn from the data. In the negative phase, we decrease the partition function by decreasing $\log \tilde{p}(\mathbf{x})$ drawn from the model distribution.

In the deep learning literature, it is common to parametrize $\log\tilde{p}$ in terms of an energy function (equation 16.7). In this case, we can interpret the positive phase as pushing down on the energy of training examples and the negative phase as pushing up on the energy of samples drawn from the model, as illustrated in figure 18.1.

## 18.2 Stochastic Maximum Likelihood and Contrastive Divergence

The naive way of implementing equation 18.15 is to compute it by burning in a set of Markov chains from a random initialization every time the gradient is needed. When learning is performed using stochastic gradient descent, this means the chains must be burned in once per gradient step. This approach leads to the training procedure presented in algorithm 18.1. The high cost of burning in the Markov chains in the inner loop makes this procedure computationally infeasible, but this procedure is the starting point that other more practical algorithms aim to approximate.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 18.1 A naive MCMC algorithm for maximizing the log-likelihood with an intractable partition function using gradient ascent
Set ε, the step size, to a small positive number.
Set k, the number of Gibbs steps, high enough to allow burn in. Perhaps 100 to train an RBM on a small image patch.
while not converged do
    Sample a minibatch of m examples {x$^{(1)}$, ..., x$^{(m)}$} from the training set g ← $\frac{1}{m} \sum_{i=1}^{m} \nabla_{\theta} \log \tilde{p}(x^{(i)}; \theta)$.
    Initialize a set of m samples {x̃(1), ..., x̃(m)} to random values (e.g., from a uniform or normal distribution, or possibly a distribution with marginals matched to the model's marginals).
    for i = 1 to k do
    for j = 1 to m do
    x̃(j) ← gibbs_update(x̃(j)).
    end for
    end for
    g ← g - $\frac{1}{m} \sum_{i=1}^{m} \nabla_{\theta} \log \tilde{p}(x̃(i); \theta)$.
    θ ← θ + εg.
end while
</div>

We can view the MCMC approach to maximum likelihood as trying to achieve balance between two forces, one pushing up on the model distribution where the data occurs, and another pushing down on the model distribution where the model samples occur. Figure 18.1 illustrates this process. The two forces correspond to maximizing $\log \tilde{p}$ and minimizing $\log Z$ . Several approximations to the negative phase are possible. Each of these approximations can be understood as making the negative phase computationally cheaper but also making it push down in the wrong locations.

Because the negative phase involves drawing samples from the model's distribution, we can think of it as finding points that the model believes in strongly. Because the negative phase acts to reduce the probability of those points, they are generally considered to represent the model's incorrect beliefs about the world. They are frequently referred to in the literature as "hallucinations" or "fantasy particles." In fact, the negative phase has been proposed as a possible explanation for dreaming in humans and other animals (Crick and Mitchison, 1983), the idea being that the brain maintains a probabilistic model of the world and follows the gradient of $\log \tilde{p}$ when experiencing real events while awake and follows the negative gradient of $\log \tilde{p}$ to minimize $\log Z$ while sleeping and experiencing events sampled from the current model. This view explains much of the language used to describe algorithms with a positive and a negative phase, but it has not been proved to be correct with neuroscientific experiments. In machine learning models, it is usually necessary to use the positive and negative phase simultaneously, rather than in separate periods of wakefulness and REM sleep. As we will see in section 19.5, other machine learning algorithms draw samples from the model distribution for other purposes, and such algorithms could also provide an account for the function of dream sleep.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/3d0936ef7f535c0f4b41dac6a1634b1ab575602d7076ea9533f0e0eeb3ab8375.jpg)

![Figure 18.1](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/ed48e49e0b0f53598d819a44b38fdc1af243d4f8f3266cc02c7f945d1ea956f9.jpg)  
Figure 18.1: The view of algorithm 18.1 as having a “positive phase” and a “negative phase.” (Left) In the positive phase, we sample points from the data distribution and push up on their unnormalized probability. This means points that are likely in the data get pushed up on more. (Right) In the negative phase, we sample points from the model distribution and push down on their unnormalized probability. This counteracts the positive phase’s tendency to just add a large constant to the unnormalized probability everywhere. When the data distribution and the model distribution are equal, the positive phase has the same chance to push up at a point as the negative phase has to push down. When this occurs, there is no longer any gradient (in expectation), and training must terminate.

Given this understanding of the role of the positive and the negative phase of learning, we can attempt to design a less expensive alternative to algorithm 18.1. The main cost of the naive MCMC algorithm is the cost of burning in the Markov chains from a random initialization at each step. A natural solution is to initialize the Markov chains from a distribution that is very close to the model distribution, so that the burn in operation does not take as many steps.

The contrastive divergence (CD, or CD-k to indicate CD with k Gibbs steps) algorithm initializes the Markov chain at each step with samples from the data distribution (Hinton, 2000, 2010). This approach is presented as algorithm 18.2. Obtaining samples from the data distribution is free, because they are already available in the dataset. Initially, the data distribution is not close to the model distribution, so the negative phase is not very accurate. Fortunately, the positive phase can still accurately increase the model's probability of the data. After the positive phase has had some time to act, the model distribution is closer to the data distribution, and the negative phase starts to become accurate.

```txt
Algorithm 18.2 The contrastive divergence algorithm, using gradient ascent as the optimization procedure
Set ε, the step size, to a small positive number.
Set k, the number of Gibbs steps, high enough to allow a Markov chain sampling from p(x; θ) to mix when initialized from p_data. Perhaps 1–20 to train an RBM on a small image patch.
while not converged do
    Sample a minibatch of m examples {x(1), ..., x(m)} from the training set
    g ← 1/m ∑i=1^m ∇θ log p̃(x(i); θ).
    for i = 1 to m do
    x̃(i) ← x(i).
    end for
    for i = 1 to k do
    for j = 1 to m do
    x̃(j) ← gibbs_update(x̃(j)).
    end for
    end for
    g ← g - 1/m ∑i=1^m ∇θ log p̃(x̃(i); θ).
    θ ← θ + εg.
end while
```

Of course, CD is still an approximation to the correct negative phase. The main way in which CD qualitatively fails to implement the correct negative phase is that it fails to suppress regions of high probability that are far from actual training examples. These regions that have high probability under the model but low probability under the data-generating distribution are called spurious modes. Figure 18.2 illustrates why this happens. Essentially, modes in the model distribution that are far from the data distribution will not be visited by Markov chains initialized at training points, unless k is very large.

Carreira-Perpiñan and Hinton (2005) showed experimentally that the CD estimator is biased for RBMs and fully visible Boltzmann machines, in that it converges to different points than the maximum likelihood estimator. They argue that because the bias is small, CD could be used as an inexpensive way to initialize a model that could later be fine-tuned via more expensive MCMC methods. Bengio and Delalleau (2009) show that CD can be interpreted as discarding the smallest terms of the correct MCMC update gradient, which explains the bias.

![Figure 18.2](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/5c940afa7cafe88853231304826fc8296081fb67a57893e3b7898be0fd79d86e.jpg)  
Figure 18.2: A spurious mode. An illustration of how the negative phase of contrastive divergence (algorithm 18.2) can fail to suppress spurious modes. A spurious mode is a mode that is present in the model distribution but absent in the data distribution. Because contrastive divergence initializes its Markov chains from data points and runs the Markov chain for only a few steps, it is unlikely to visit modes in the model that are far from the data points. This means that when sampling from the model, we will sometimes get samples that do not resemble the data. It also means that due to wasting some of its probability mass on these modes, the model will struggle to place highprobability mass on the correct modes. For the purpose of visualization, this figure uses a somewhat simplified concept of distance—the spurious mode is far from the correct mode along the number line in R. This corresponds to a Markov chain based on making local moves with a single x variable in R. For most deep probabilistic models, the Markov chains are based on Gibbs sampling and can make nonlocal moves of individual variables but cannot move all the variables simultaneously. For these problems, it is usually better to consider the edit distance between modes, rather than the Euclidean distance. However, edit distance in a high-dimensional space is difficult to depict in a 2-D plot.

CD is useful for training shallow models like RBMs. These can in turn be stacked to initialize deeper models like DBNs or DBMs. But CD does not provide much help for training deeper models directly. This is because it is difficult to obtain samples of the hidden units given samples of the visible units. Since the hidden units are not included in the data, initializing from training points cannot solve the problem. Even if we initialize the visible units from the data, we will still need to burn in a Markov chain sampling from the distribution over the hidden units conditioned on those visible samples.

The CD algorithm can be thought of as penalizing the model for having a Markov chain that changes the input rapidly when the input comes from the data. This means training with CD somewhat resembles autoencoder training. Even though CD is more biased than some of the other training methods, it can be useful for pretraining shallow models that will later be stacked. This is because the earliest models in the stack are encouraged to copy more information up to their latent variables, thereby making it available to the later models. This should be thought of more of as an often-exploitable side effect of CD training rather than a principled design advantage.

Sutskever and Ticleman (2010) showed that the CD update direction is not the gradient of any function. This allows for situations where CD could cycle forever, but in practice this is not a serious problem.

A different strategy that resolves many of the problems with CD is to initialize the Markov chains at each gradient step with their states from the previous gradient step. This approach was first discovered under the name stochastic maximum likelihood (SML) in the applied mathematics and statistics community (Younes, 1998) and later independently rediscovered under the name persistent contrastive divergence (PCD, or PCD-k to indicate the use of k Gibbs steps per update) in the deep learning community (Tieleman, 2008). See algorithm 18.3. The basic idea of this approach is that, as long as the steps taken by the stochastic gradient algorithm are small, the model from the previous step will be similar to the model from the current step. It follows that the samples from the previous model's distribution will be very close to being fair samples from the current model's distribution, so a Markov chain initialized with these samples will not require much time to mix.

Because each Markov chain is continually updated throughout the learning process, rather than restarted at each gradient step, the chains are free to wander far enough to find all the model's modes. SML is thus considerably more resistant to forming models with spurious modes than CD is. Moreover, because it is possible to store the state of all the sampled variables, whether visible or latent, SML provides an initialization point for both the hidden and the visible units. CD is only able to provide an initialization for the visible units, and therefore requires burn-in for deep models. SML is able to train deep models efficiently. Marlin et al. (2010) compared SML to many other criteria presented in this chapter. They found that SML results in the best test set log-likelihood for an RBM, and that if the RBM's hidden units are used as features for an SVM classifier, SML results in the best classification accuracy.

```txt
Algorithm 18.3 The stochastic maximum likelihood / persistent contrastive divergence algorithm using gradient ascent as the optimization procedure
Set ε, the step size, to a small positive number.
Set k, the number of Gibbs steps, high enough to allow a Markov chain sampling from p(x; θ + εg) to burn in, starting from samples from p(x; θ). Perhaps 1 for RBM on a small image patch, or 5–50 for a more complicated model like a DBM.
Initialize a set of m samples {x̃(1), ..., x̃(m)} to random values (e.g., from a uniform or normal distribution, or possibly a distribution with marginals matched to the model's marginals).
while not converged do
    Sample a minibatch of m examples {x(1), ..., x(m)} from the training set
    g ← 1/m ∑i=1^m ∇θ log p̃(x(i); θ).
    for i = 1 to k do
    for j = 1 to m do
    x̃(j) ← gibbs_update(x̃(j)).
    end for
    end for
    g ← g - 1/m ∑i=1^m ∇θ log p̃(x̃(i); θ).
    θ ← θ + εg.
end while
```

SML is vulnerable to becoming inaccurate if the stochastic gradient algorithm can move the model faster than the Markov chain can mix between steps. This can happen if k is too small or $\epsilon$ is too large. The permissible range of values is unfortunately highly problem dependent. There is no known way to test formally whether the chain is successfully mixing between steps. Subjectively, if the learning rate is too high for the number of Gibbs steps, the human operator will be able to observe much more variance in the negative phase samples across gradient steps than across different Markov chains. For example, a model trained on MNIST might sample exclusively 7s on one step. The learning process will then push down strongly on the mode corresponding to 7s, and the model might sample exclusively 9s on the next step.

Care must be taken when evaluating the samples from a model trained with SML. It is necessary to draw the samples starting from a fresh Markov chain initialized from a random starting point after the model is done training. The samples present in the persistent negative chains used for training have been influenced by several recent versions of the model, and thus can make the model appear to have greater capacity than it actually does.

Berglund and Raiko (2013) performed experiments to examine the bias and variance in the estimate of the gradient provided by CD and SML. $^{CD}$ proves to have lower variance than the estimator based on exact sampling. SML has higher variance. The cause of CD's low variance is its use of the same training points in both the positive and negative phase. If the negative phase is initialized from different training points, the variance rises above that of the estimator based on exact sampling.

All these methods based on using MCMC to draw samples from the model can in principle be used with almost any variant of MCMC. This means that techniques such as SML can be improved by using any of the enhanced MCMC techniques described in chapter 17, such as parallel tempering (Desjardins et al., 2010; Cho et al., 2010).

One approach to accelerating mixing during learning relies not on changing the Monte Carlo sampling technology but rather on changing the parametrization of the model and the cost function. Fast PCD, or FPCD (Tieleman and Hinton, 2009) involves replacing the parameters $\theta$ of a traditional model with an expression

$$
\pmb{\theta} = \pmb{\theta}^{(\mathrm{slow})} + \pmb{\theta}^{(\mathrm{fast})}.\tag{18.16}
$$

There are now twice as many parameters as before, and they are added together element-wise to provide the parameters used by the original model definition. The fast copy of the parameters is trained with a much larger learning rate, allowing it to adapt rapidly in response to the negative phase of learning and push the Markov chain to new territory. This forces the Markov chain to mix rapidly, though this effect occurs only during learning while the fast weights are free to change. Typically one also applies significant weight decay to the fast weights, encouraging them to converge to small values, after only transiently taking on large values long enough to encourage the Markov chain to change modes.

One key benefit to the MCMC-based methods described in this section is that they provide an estimate of the gradient of $\log Z$ , and thus we can essentially decompose the problem into the $\log \tilde{p}$ contribution and the $\log Z$ contribution. We can then use any other method to tackle $\log \tilde{p}(\mathbf{x})$ and just add our negative phase gradient onto the other method's gradient. In particular, this means that our positive phase can make use of methods that provide only a lower bound on $\tilde{p}$ . Most of the other methods of dealing with $\log Z$ presented in this chapter are incompatible with bound-based positive phase methods.

## 18.3 Pseudolikelihood

Monte Carlo approximations to the partition function and its gradient directly confront the partition function. Other approaches sidestep the issue, by training the model without computing the partition function. Most of these approaches are based on the observation that it is easy to compute ratios of probabilities in an undirected probabilistic model. This is because the partition function appears in both the numerator and the denominator of the ratio and cancels out:

$$
\frac{p(\mathbf{x})}{p(\mathbf{y})} = \frac{\frac{1}{Z} \tilde{p}(\mathbf{x})}{\frac{1}{Z} \tilde{p}(\mathbf{y})} = \frac{\tilde{p}(\mathbf{x})}{\tilde{p}(\mathbf{y})}.\tag{18.17}
$$

The pseudolikelihood is based on the observation that conditional probabilities take this ratio-based form and thus can be computed without knowledge of the partition function. Suppose that we partition x into a, b and c, where a contains the variables we want to find the conditional distribution over, b contains the variables we want to condition on, and c contains the variables that are not part of our query:

$$
p(\mathbf{a} \mid \mathbf{b}) = \frac{p(\mathbf{a}, \mathbf{b})}{p(\mathbf{b})} = \frac{p(\mathbf{a}, \mathbf{b})}{\sum_{\mathbf{a}, \mathbf{c}} p(\mathbf{a}, \mathbf{b}, \mathbf{c})} = \frac{\tilde{p}(\mathbf{a}, \mathbf{b})}{\sum_{\mathbf{a}, \mathbf{c}} \tilde{p}(\mathbf{a}, \mathbf{b}, \mathbf{c})}.\tag{18.18}
$$

This quantity requires marginalizing out a, which can be a very efficient operation provided that a and c do not contain many variables. In the extreme case, a can be a single variable and c can be empty, making this operation require only as many evaluations of $\tilde{p}$ as there are values of a single random variable.

Unfortunately, in order to compute the log-likelihood, we need to marginalize out large sets of variables. If there are n variables total, we must marginalize a set of size n - 1. By the chain rule of probability,

$$
\log p(\mathbf{x}) = \log p(x_{1}) + \log p(x_{2} \mid x_{1}) + \dots + p(x_{n} \mid \mathbf{x}_{1: n - 1}).\tag{18.19}
$$

In this case, we have made a maximally small, but c can be as large as $x_{2:n}$ . What if we simply move c into b to reduce the computational cost? This yields the pseudolikelihood (Besag, 1975) objective function, based on predicting the value of feature $x_{i}$ given all the other features $x_{-i}$ :

$$
\sum_{i = 1}^{n} \log p(x_{i} \mid \boldsymbol{x}_{- i}).\tag{18.20}
$$

If each random variable has k different values, this requires only $k \times n$ evaluations of $\tilde{p}$ to compute, as opposed to the $k^{n}$ evaluations needed to compute the partition function.

This may look like an unprincipled hack, but it can be proved that estimation by maximizing the pseudolikelihood is asymptotically consistent (Mase, 1995). Of course, in the case of datasets that do not approach the large sample limit, pseudolikelihood may display different behavior from the maximum likelihood estimator.

It is possible to trade computational complexity for deviation from maximum likelihood behavior by using the generalized pseudolikelihood estimator (Huang and Ogata, 2002). The generalized pseudolikelihood estimator uses m different sets $\mathbb{S}^{(i)}, i = 1, \ldots, m$ of indices of variables that appear together on the left side of the conditioning bar. In the extreme case of m = 1 and $\mathbb{S}^{(1)} = 1, \ldots, n$ , the generalized pseudolikelihood recovers the log-likelihood. In the extreme case of m = n and $\mathbb{S}^{(i)} = \{i\}$ , the generalized pseudolikelihood recovers the pseudolikelihood. The generalized pseudolikelihood objective function is given by

$$
\sum_{i = 1}^{m} \log p(\mathbf{x}_{\mathbb{S}^{(i)}} \mid \mathbf{x}_{- \mathbb{S}^{(i)}}).\tag{18.21}
$$

The performance of pseudolikelihood-based approaches depends largely on how the model will be used. Pseudolikelihood tends to perform poorly on tasks that require a good model of the full joint $p(\mathbf{x})$ , such as density estimation and sampling. It can perform better than maximum likelihood for tasks that require only the conditional distributions used during training, such as filling in small amounts of missing values. Generalized pseudolikelihood techniques are especially powerful if the data has regular structure that allows the S index sets to be designed to capture the most important correlations while leaving out groups of variables that have only negligible correlation. For example, in natural images, pixels that are widely separated in space also have weak correlation, so the generalized pseudolikelihood can be applied with each S set being a small, spatially localized window.

One weakness of the pseudolikelihood estimator is that it cannot be used with other approximations that provide only a lower bound on $\tilde{p}(\mathbf{x})$ , such as variational inference, which is covered in chapter 19. This is because $\tilde{p}$ appears in the denominator. A lower bound on the denominator provides only an upper bound on the expression as a whole, and there is no benefit to maximizing an upper bound. This makes it difficult to apply pseudolikelihood approaches to deep models such as deep Boltzmann machines, since variational methods are one of the dominant approaches to approximately marginalizing out the many layers of hidden variables that interact with each other. Nonetheless, pseudolikelihood is still useful for deep learning, because it can be used to train single-layer models or deep models using approximate inference methods that are not based on lower bounds.

Pseudolikelihood has a much greater cost per gradient step than SML, due to its explicit computation of all the conditionals. But generalized pseudolikelihood and similar criteria can still perform well if only one randomly selected conditional is computed per example (Goodfellow et al., 2013b), thereby bringing the computational cost down to match that of SML.

Though the pseudolikelihood estimator does not explicitly minimize $\log Z$ , it can still be thought of as having something resembling a negative phase. The denominators of each conditional distribution result in the learning algorithm suppressing the probability of all states that have only one variable differing from a training example.

See Marlin and de Freitas (2011) for a theoretical analysis of the asymptotic efficiency of pseudolikelihood.

## 18.4 Score Matching and Ratio Matching

Score matching (Hyvärinen, 2005) provides another consistent means of training a model without estimating Z or its derivatives. The name score matching comes from terminology in which the derivatives of a log density with respect to its argument, $\nabla_{x}\log p(x)$ , are called its score. The strategy used by score matching is to minimize the expected squared difference between the derivatives of the model's log density with respect to the input and the derivatives of the data's log density with respect to the input:

$$
L(\pmb{x}, \pmb{\theta}) = \frac{1}{2} | | \nabla_{\pmb{x}} \log p_{\mathrm{model}}(\pmb{x}; \pmb{\theta}), - \nabla_{\pmb{x}} \log p_{\mathrm{data}}(\pmb{x}) | |_{2}^{2},\tag{18.22}
$$

$$
J(\pmb{\theta}) = \frac{1}{2} \mathbb{E}_{p_{\mathrm{data}}(\pmb{x})} L(\pmb{x}, \pmb{\theta}),\tag{18.23}
$$

$$
\boldsymbol{\theta}^{*} = \min_{\boldsymbol{\theta}} J(\boldsymbol{\theta}).\tag{18.24}
$$

This objective function avoids the difficulties associated with differentiating the partition function Z because Z is not a function of x and therefore $\nabla_{x}Z = 0$ . Initially, score matching appears to have a new difficulty: computing the score of the data distribution requires knowledge of the true distribution generating the training data, $p_{data}$ . Fortunately, minimizing the expected value of $L(\boldsymbol{x}, \boldsymbol{\theta})$ is equivalent to minimizing the expected value of

$$
\tilde{L}(\boldsymbol{x}, \boldsymbol{\theta}) = \sum_{j = 1}^{n} \left(\frac{\partial^{2}}{\partial x_{j}^{2}} \log p_{\text{model}}(\boldsymbol{x}; \boldsymbol{\theta}) + \frac{1}{2} \left(\frac{\partial}{\partial x_{j}} \log p_{\text{model}}(\boldsymbol{x}; \boldsymbol{\theta})\right)^{2}\right),\tag{18.25}
$$

where n is the dimensionality of x.

Because score matching requires taking derivatives with respect to x, it is not applicable to models of discrete data but the latent variables in the model may be discrete.

Like pseudolikelihood, score matching only works when we are able to evaluate $\log\tilde{p}(\mathbf{x})$ and its derivatives directly. It is not compatible with methods that provide only a lower bound on $\log\tilde{p}(\mathbf{x})$ , because score matching requires the derivatives and second derivatives of $\log\tilde{p}(\mathbf{x})$ , and a lower bound conveys no information about its derivatives. This means that score matching cannot be applied to estimating models with complicated interactions between the hidden units, such as sparse coding models or deep Boltzmann machines. While score matching can be used to pretrain the first hidden layer of a larger model, it has not been applied as a pretraining strategy for the deeper layers of a larger model. This is probably because the hidden layers of such models usually contain some discrete variables.

While score matching does not explicitly have a negative phase, it can be viewed as a version of contrastive divergence using a specific kind of Markov chain (Hyvärinen, 2007a). The Markov chain in this case is not Gibbs sampling, but rather a different approach that makes local moves guided by the gradient. Score matching is equivalent to CD with this type of Markov chain when the size of the local moves approaches zero.

Lyu (2009) generalized score matching to the discrete case (but made an error in the derivation that was corrected by Marlin et al. [2010]). Marlin et al. (2010) found that generalized score matching (GSM) does not work in high-dimensional discrete spaces where the observed probability of many events is 0.

A more successful approach to extending the basic ideas of score matching to discrete data is ratio matching (Hyvärinen, 2007b). Ratio matching applies specifically to binary data. Ratio matching consists of minimizing the average over examples of the following objective function:

$$
L^{(\mathrm{RM})}(\boldsymbol{x}, \boldsymbol{\theta}) = \sum_{j = 1}^{n} \left(\frac{1}{1 + \frac{p_{\mathrm{model}}(\boldsymbol{x}; \boldsymbol{\theta})}{p_{\mathrm{model}}(f(\boldsymbol{x}), j); \boldsymbol{\theta})}}\right)^{2},\tag{18.26}
$$

where $f(\boldsymbol{x}, j)$ returns x with the bit at position j flipped. Ratio matching avoids the partition function using the same trick as the pseudolikelihood estimator: in a ratio of two probabilities, the partition function cancels out. Marlin et al. (2010) found that ratio matching outperforms SML, pseudolikelihood and GSM in terms of the ability of models trained with ratio matching to denoise test set images.

Like the pseudolikelihood estimator, ratio matching requires n evaluations of $\tilde{p}$ per data point, making its computational cost per update roughly n times higher than that of SML.

As with the pseudolikelihood estimator, ratio matching can be thought of as pushing down on all fantasy states that have only one variable different from a training example. Since ratio matching applies specifically to binary data, this means that it acts on all fantasy states within Hamming distance 1 of the data.

Ratio matching can also be useful as the basis for dealing with high-dimensional sparse data, such as word count vectors. This kind of data poses a challenge for MCMC-based methods because the data is extremely expensive to represent in dense format, yet the MCMC sampler does not yield sparse values until the model has learned to represent the sparsity in the data distribution. Dauphin and Bengio (2013) overcame this issue by designing an unbiased stochastic approximation to ratio matching. The approximation evaluates only a randomly selected subset of the terms of the objective and does not require the model to generate complete fantasy samples.

See Marlin and de Freitas (2011) for a theoretical analysis of the asymptotic efficiency of ratio matching.

## 18.5 Denoising Score Matching

In some cases we may wish to regularize score matching, by fitting a distribution

$$
p_{\text{smoothed}}(\boldsymbol{x}) = \int p_{\text{data}}(\boldsymbol{y}) q(\boldsymbol{x} \mid \boldsymbol{y}) d \boldsymbol{y}\tag{18.27}
$$

rather than the true $p_{data}$ . The distribution $q(\boldsymbol{x} \mid \boldsymbol{y})$ is a corruption process, usually one that forms x by adding a small amount of noise to y.

Denoising score matching is especially useful because in practice, we usually do not have access to the true $p_{data}$ but rather only an empirical distribution defined by samples from it. Any consistent estimator will, given enough capacity, make $p_{model}$ into a set of Dirac distributions centered on the training points. Smoothing by q helps to reduce this problem, at the loss of the asymptotic consistency property described in section 5.4.5. Kingma and LeCun (2010) introduced a procedure for performing regularized score matching with the smoothing distribution q being normally distributed noise.

Recall from section 14.5.1 that several autoencoder training algorithms are equivalent to score matching or denoising score matching. These autoencoder training algorithms are therefore a way of overcoming the partition function problem.

## 18.6 Noise-Contrastive Estimation

Most techniques for estimating models with intractable partition functions do not provide an estimate of the partition function. SML and CD estimate only the gradient of the log partition function, rather than the partition function itself. Score matching and pseudolikelihood avoid computing quantities related to the partition function altogether.

Noise-contrastive estimation (NCE) (Gutmann and Hyvarinen, 2010) takes a different strategy. In this approach, the probability distribution estimated by the model is represented explicitly as

$$
\log p_{\mathrm{model}}(\mathbf{x}) = \log \tilde{p}_{\mathrm{model}}(\mathbf{x}; \pmb{\theta}) + c,\tag{18.28}
$$

where c is explicitly introduced as an approximation of $-\log Z(\boldsymbol{\theta})$ . Rather than estimating only $\theta$ , the noise contrastive estimation procedure treats c as just another parameter and estimates $\theta$ and c simultaneously, using the same algorithm for both. The resulting $\log p_{\mathrm{model}}(\mathbf{x})$ thus may not correspond exactly to a valid probability distribution, but it will become closer and closer to being valid as the estimate of c improves. $^{1}$

Such an approach would not be possible using maximum likelihood as the criterion for the estimator. The maximum likelihood criterion would choose to set c arbitrarily high, rather than setting c to create a valid probability distribution.

NCE works by reducing the unsupervised learning problem of estimating $p(\mathbf{x})$ to that of learning a probabilistic binary classifier in which one of the categories corresponds to the data generated by the model. This supervised learning problem is constructed in such a way that maximum likelihood estimation defines an asymptotically consistent estimator of the original problem.

Specifically, we introduce a second distribution, the noise distribution $p_{\mathrm{noise}}(\mathbf{x})$ . The noise distribution should be tractable to evaluate and to sample from. We can now construct a model over both x and a new, binary class variable y. In the new joint model, we specify that

$$
p_{\mathrm{joint}}(y = 1) = \frac{1}{2},\tag{18.29}
$$

$$
p_{\mathrm{joint}}(\mathbf{x} \mid y = 1) = p_{\mathrm{model}}(\mathbf{x}),\tag{18.30}
$$

and

$$
p_{\mathrm{joint}}(\mathbf{x} \mid y = 0) = p_{\mathrm{noise}}(\mathbf{x}).\tag{18.31}
$$

In other words, y is a switch variable that determines whether we will generate x from the model or from the noise distribution.

We can construct a similar joint model of training data. In this case, the switch variable determines whether we draw $\mathbf{x}$ from the data or from the noise distribution. Formally, $p_{\mathrm{train}}(y = 1) = \frac{1}{2}$ , $p_{\mathrm{train}}(\mathbf{x} \mid y = 1) = p_{\mathrm{data}}(\mathbf{x})$ , and $p_{\mathrm{train}}(\mathbf{x} \mid y = 0) = p_{\mathrm{noise}}(\mathbf{x})$ .

We can now just use standard maximum likelihood learning on the supervised learning problem of fitting $p_{joint}$ to $p_{train}$ :

$$
\boldsymbol{\theta}, c = \underset{\boldsymbol{\theta}, c}{\arg \max} \mathbb{E}_{\mathbf{x}, y \sim p_{\text{train}}} \log p_{\text{joint}}(y \mid \mathbf{x}).\tag{18.32}
$$

The distribution $p_{joint}$ is essentially a logistic regression model applied to the difference in log probabilities of the model and the noise distribution:

$$
p_{\text{joint}}(y = 1 \mid \mathbf{x}) = \frac{p_{\text{model}}(\mathbf{x})}{p_{\text{model}}(\mathbf{x}) + p_{\text{noise}}(\mathbf{x})}\tag{18.33}
$$

$$
= \frac{1}{1 + \frac{p_{\mathrm{noise}}(\mathbf{x})}{p_{\mathrm{model}}(\mathbf{x})}}\tag{18.34}
$$

$$
= \frac{1}{1 + \exp \left(\log \frac{p_{\text{noise}}(\mathbf{x})}{p_{\text{model}}(\mathbf{x})}\right)}\tag{18.35}
$$

$$
= \sigma \left(- \log \frac{p_{\mathrm{noise}}(\mathbf{x})}{p_{\mathrm{model}}(\mathbf{x})}\right)\tag{18.36}
$$

$$
= \sigma \left(\log p_{\mathrm{model}}(\mathbf{x}) - \log p_{\mathrm{noise}}(\mathbf{x})\right).\tag{18.37}
$$

NCE is thus simple to apply as long as $\log\tilde{p}_{model}$ is easy to back-propagate through, and, as specified above, $p_{noise}$ is easy to evaluate (in order to evaluate $p_{joint}$ ) and sample from (to generate the training data).

NCE is most successful when applied to problems with few random variables, but it can work well even if those random variables can take on a high number of values. For example, it has been successfully applied to modeling the conditional distribution over a word given the context of the word (Mnih and Kavukcuoglu, 2013). Though the word may be drawn from a large vocabulary, there is only one word.

When NCE is applied to problems with many random variables, it becomes less efficient. The logistic regression classifier can reject a noise sample by identifying any one variable whose value is unlikely. This means that learning slows down greatly after $p_{model}$ has learned the basic marginal statistics. Imagine learning a model of images of faces, using unstructured Gaussian noise as $p_{noise}$ . If $p_{model}$ learns about eyes, it can reject almost all unstructured noise samples without having learned anything about other facial features, such as mouths.

The constraint that $p_{noise}$ must be easy to evaluate and easy to sample from can be overly restrictive. When $p_{noise}$ is simple, most samples are likely to be too obviously distinct from the data to force $p_{model}$ to improve noticeably.

Like score matching and pseudolikelihood, NCE does not work if only a lower bound on $\tilde{p}$ is available. Such a lower bound could be used to construct a lower bound on $p_{\mathrm{joint}}(y=1 \mid \mathbf{x})$ , but it can only be used to construct an upper bound on $p_{\mathrm{joint}}(y=0 \mid \mathbf{x})$ , which appears in half the terms of the NCE objective. Likewise, a lower bound on $p_{noise}$ is not useful, because it provides only an upper bound on $p_{\mathrm{joint}}(y=1 \mid \mathbf{x})$ .

When the model distribution is copied to define a new noise distribution before each gradient step, NCE defines a procedure called self-contrastive estimation, whose expected gradient is equivalent to the expected gradient of maximum likelihood (Goodfellow, 2014). The special case of NCE where the noise samples are those generated by the model suggests that maximum likelihood can be interpreted as a procedure that forces a model to constantly learn to distinguish reality from its own evolving beliefs, while noise contrastive estimation achieves some reduced computational cost by only forcing the model to distinguish reality from a fixed baseline (the noise model).

Using the supervised task of classifying between training samples and generated samples (with the model energy function used in defining the classifier) to provide a gradient on the model was introduced earlier in various forms (Welling et al., 2003b; Bengio, 2009).

Noise contrastive estimation is based on the idea that a good generative model should be able to distinguish data from noise. A closely related idea is that a good generative model should be able to generate samples that no classifier can distinguish from data. This idea yields generative adversarial networks (section 20.10.4).

## 18.7 Estimating the Partition Function

While much of this chapter is dedicated to describing methods that avoid needing to compute the intractable partition function $Z(\boldsymbol{\theta})$ associated with an undirected graphical model, in this section we discuss several methods for directly estimating the partition function.

Estimating the partition function can be important because we require it if we wish to compute the normalized likelihood of data. This is often important in evaluating the model, monitoring training performance, and comparing models to each other.

For example, imagine we have two models: model $M_{A}$ defining a probability distribution $p_{A}(\mathbf{x};\boldsymbol{\theta}_{A})=\frac{1}{Z_{A}}\tilde{p}_{A}(\mathbf{x};\boldsymbol{\theta}_{A})$ and model $M_{B}$ defining a probability distribution $p_{B}(\mathbf{x};\boldsymbol{\theta}_{B})=\frac{1}{Z_{B}}\tilde{p}_{B}(\mathbf{x};\boldsymbol{\theta}_{B})$ . A common way to compare the models is to evaluate and compare the likelihood that both models assign to an i.i.d. test dataset. Suppose the test set consists of m examples $\{\boldsymbol{x}^{(1)},\ldots,\boldsymbol{x}^{(m)}\}$ . If $\prod_{i}p_{A}(x^{(i)};\boldsymbol{\theta}_{A})>\prod_{i}p_{B}(x^{(i)};\boldsymbol{\theta}_{B})$ , or equivalently if

$$
\sum_{i} \log p_{A}(x^{(i)}; \boldsymbol{\theta}_{A}) - \sum_{i} \log p_{B}(x^{(i)}; \boldsymbol{\theta}_{B}) > 0,\tag{18.38}
$$

then we say that $\mathcal{M}_A$ is a better model than $\mathcal{M}_B$ (or, at least, it is a better model of the test set), in the sense that it has a better test log-likelihood. Unfortunately, testing whether this condition holds requires knowledge of the partition function. equation 18.38 seems to require evaluating the log-probability that the model assigns to each point, which in turn requires evaluating the partition function. We can simplify the situation slightly by rearranging equation 18.38 into a form in which we need to know only the ratio of the two model's partition functions:

$$
\sum_{i} \log p_{A}(\mathbf{x}^{(i)}; \boldsymbol{\theta}_{A}) - \sum_{i} \log p_{B}(\mathbf{x}^{(i)}; \boldsymbol{\theta}_{B}) = \sum_{i} \left(\log \frac{\tilde{p}_{A}(\mathbf{x}^{(i)}; \boldsymbol{\theta}_{A})}{\tilde{p}_{B}(\mathbf{x}^{(i)}; \boldsymbol{\theta}_{B})}\right) - m \log \frac{Z(\boldsymbol{\theta}_{A})}{Z(\boldsymbol{\theta}_{B})}.\tag{18.39}
$$

We can thus determine whether $M_{A}$ is a better model than $M_{B}$ without knowing the partition function of either model but only their ratio. As we will see shortly, we can estimate this ratio using importance sampling, provided that the two models are similar.

If, however, we wanted to compute the actual probability of the test data under either $M_{A}$ or $M_{B}$ , we would need to compute the actual value of the partition functions. That said, if we knew the ratio of two partition functions, $r = \frac{Z(\theta_{B})}{Z(\theta_{A})}$ , and we knew the actual value of just one of the two, say $Z(\theta_{A})$ , we could compute the value of the other:

$$
Z(\boldsymbol{\theta}_{B}) = rZ(\boldsymbol{\theta}_{A}) = \frac{Z(\boldsymbol{\theta}_{B})}{Z(\boldsymbol{\theta}_{A})} Z(\boldsymbol{\theta}_{A}).\tag{18.40}
$$

A simple way to estimate the partition function is to use a Monte Carlo method such as simple importance sampling. We present the approach in terms of continuous variables using integrals, but it can be readily applied to discrete variables by replacing the integrals with summation. We use a proposal distribution $p_{0}(\mathbf{x}) = \frac{1}{Z_{0}}\tilde{p}_{0}(\mathbf{x})$ , which supports tractable sampling and tractable evaluation of both the partition function $Z_{0}$ and the unnormalized distribution $\tilde{p}_{0}(\mathbf{x})$ .

$$
Z_{1} = \int \tilde{p}_{1}(\mathbf{x}) d \mathbf{x}\tag{18.41}
$$

$$
= \int \frac{p_{0}(\mathbf{x})}{p_{0}(\mathbf{x})} \tilde{p}_{1}(\mathbf{x}) d \mathbf{x}\tag{18.42}
$$

$$
= Z_{0} \int p_{0}(\mathbf{x}) \frac{\tilde{p}_{1}(\mathbf{x})}{\tilde{p}_{0}(\mathbf{x})} d \mathbf{x}\tag{18.43}
$$

$$
\hat{Z}_{1} = \frac{Z_{0}}{K} \sum_{k = 1}^{K} \frac{\tilde{p}_{1}(\mathbf{x}^{(k)})}{\tilde{p}_{0}(\mathbf{x}^{(k)})} \quad \text{s.t.:} \mathbf{x}^{(k)} \sim p_{0}\tag{18.44}
$$

In the last line, we make a Monte Carlo estimator, $\hat{Z}_{1}$ , of the integral using samples drawn from $p_{0}(\mathbf{x})$ , and then weight each sample with the ratio of the unnormalized $\tilde{p}_{1}$ and the proposal $p_{0}$ .

This approach also allows us to estimate the ratio between the partition functions as

$$
\frac{1}{K} \sum_{k = 1}^{K} \frac{\tilde{p}_{1}(\mathbf{x}^{(k)})}{\tilde{p}_{0}(\mathbf{x}^{(k)})} \quad \text{s.t.:} \mathbf{x}^{(k)} \sim p_{0}.\tag{18.45}
$$

This value can then be used directly to compare two models as described in equation 18.39.

If the distribution $p_{0}$ is close to $p_{1}$ , equation 18.44 can be an effective way of estimating the partition function (Minka, 2005). Unfortunately, most of the time $p_{1}$ is both complicated (usually multimodal) and defined over a high-dimensional space. It is difficult to find a tractable $p_{0}$ that is simple enough to evaluate while still being close enough to $p_{1}$ to result in a high-quality approximation. If $p_{0}$ and $p_{1}$ are not close, most samples from $p_{0}$ will have low probability under $p_{1}$ and therefore make (relatively) negligible contribution to the sum in equation 18.44.

Having few samples with significant weights in this sum will result in an estimator that is of poor quality because of high variance. This can be understood quantitatively through an estimate of the variance of our estimate $\hat{Z}_{1}$ :

$$
\hat{\operatorname{Var}} \left(\hat{Z}_{1}\right) = \frac{Z_{0}}{K^{2}} \sum_{k = 1}^{K} \left(\frac{\tilde{p}_{1}(\mathbf{x}^{(k)})}{\tilde{p}_{0}(\mathbf{x}^{(k)})} - \hat{Z}_{1}\right)^{2}.\tag{18.46}
$$

This quantity is largest when there is significant deviation in the values of the importance weights $\frac{\tilde{p}_1(\mathbf{x}^{(k)})}{\tilde{p}_0(\mathbf{x}^{(k)})}$ .

We now turn to two related strategies developed to cope with the challenging task of estimating partition functions for complex distributions over high-dimensional spaces: annealed importance sampling and bridge sampling. Both start with the simple importance sampling strategy introduced above, and both attempt to overcome the problem of the proposal $p_{0}$ being too far from $p_{1}$ by introducing intermediate distributions that attempt to bridge the gap between $p_{0}$ and $p_{1}$ .

## 18.7.1 Annealed Importance Sampling

In situations where $D_{\mathrm{KL}}(p_{0}\|p_{1})$ is large (i.e., where there is little overlap between $p_{0}$ and $p_{1}$ ), a strategy called annealed importance sampling (AIS) attempts to bridge the gap by introducing intermediate distributions (Jarzynski, 1997; Neal, 2001). Consider a sequence of distributions $p_{\eta_{0}},\ldots,p_{\eta_{n}}$ , with $0=\eta_{0}<\eta_{1}<\cdots<\eta_{n-1}<\eta_{n}=1$ so that the first and last distributions in the sequence are $p_{0}$ and $p_{1}$ , respectively.

This approach enables us to estimate the partition function of a multimodal distribution defined over a high-dimensional space (such as the distribution defined by a trained RBM). We begin with a simpler model with a known partition function (such as an RBM with zeros for weights) and estimate the ratio between the two model's partition functions. The estimate of this ratio is based on the estimate of the ratios of a sequence of many similar distributions, such as the sequence of RBMs with weights interpolating between zero and the learned weights.

We can now write the ratio $\frac{Z_{1}}{Z_{0}}$ as

$$
\frac{Z_{1}}{Z_{0}} = \frac{Z_{1}}{Z_{0}} \frac{Z_{\eta_{1}}}{Z_{\eta_{1}}} \dots \frac{Z_{\eta_{n - 1}}}{Z_{\eta_{n - 1}}}\tag{18.47}
$$

$$
= \frac{Z_{\eta_{1}}}{Z_{0}} \frac{Z_{\eta_{2}}}{Z_{\eta_{1}}} \dots \frac{Z_{\eta_{n - 1}}}{Z_{\eta_{n - 2}}} \frac{Z_{1}}{Z_{\eta_{n - 1}}}\tag{18.48}
$$

$$
= \prod_{j = 0}^{n - 1} \frac{Z_{\eta_{j + 1}}}{Z_{\eta_{j}}}.\tag{18.49}
$$

Provided the distributions $p_{\eta_{j}}$ and $p_{\eta_{j}+1}$ , for all $0 \leq j \leq n-1$ , are sufficiently close, we can reliably estimate each of the factors $\frac{Z_{\eta_{j}+1}}{Z_{\eta_{j}}}$ using simple importance sampling and then use these to obtain an estimate of $\frac{Z_{1}}{Z_{0}}$ .

Where do these intermediate distributions come from? Just as the original proposal distribution $p_{0}$ is a design choice, so is the sequence of distributions $p_{\eta_{1}} \ldots p_{\eta_{n-1}}$ . That is, it can be specifically constructed to suit the problem domain. One general purpose and popular choice for the intermediate distributions is to use the weighted geometric average of the target distribution $p_{1}$ and the starting proposal distribution (for which the partition function is known) $p_{0}$ :

$$
p_{\eta_{j}} \propto p_{1}^{\eta_{j}} p_{0}^{1 - \eta_{j}}.\tag{18.50}
$$

In order to sample from these intermediate distributions, we define a series of Markov chain transition functions $T_{\eta_{j}}(\boldsymbol{x}^{\prime} \mid \boldsymbol{x})$ that define the conditional probability distribution of transitioning to $x^{\prime}$ given we are currently at x. The transition operator $T_{\eta_{j}}(\boldsymbol{x}^{\prime} \mid \boldsymbol{x})$ is defined to leave $p_{\eta_{j}}(\boldsymbol{x})$ invariant:

$$
p_{\eta_{j}}(\boldsymbol{x}) = \int p_{\eta_{j}} \left(\boldsymbol{x}^{\prime}\right) T_{\eta_{j}} \left(\boldsymbol{x} \mid \boldsymbol{x}^{\prime}\right) d \boldsymbol{x}^{\prime}.\tag{18.51}
$$

These transitions may be constructed as any Markov chain Monte Carlo method (e.g., Metropolis-Hastings, Gibbs), including methods involving multiple passes through all the random variables or other kinds of iterations.

The AIS sampling strategy is then to generate samples from $p_{0}$ and use the transition operators to sequentially generate samples from the intermediate distributions until we arrive at samples from the target distribution $p_{1}$ :

$$
\begin{array}{l} \bullet \text{for} k = 1 \ldots K \\ \quad - \text{Sample} \boldsymbol{x}_{\eta_{1}}^{(k)} \sim p_{0}(\mathbf{x}) \\ \quad - \text{Sample} \boldsymbol{x}_{\eta_{2}}^{(k)} \sim T_{\eta_{1}}(\mathbf{x}_{\eta_{2}}^{(k)} \mid \boldsymbol{x}_{\eta_{1}}^{(k)}) \\ \quad - \ldots \\ \quad - \text{Sample} \boldsymbol{x}_{\eta_{n - 1}}^{(k)} \sim T_{\eta_{n - 2}}(\mathbf{x}_{\eta_{n - 1}}^{(k)} \mid \boldsymbol{x}_{\eta_{n - 2}}^{(k)}) \\ \quad - \text{Sample} \boldsymbol{x}_{\eta_{n}}^{(k)} \sim T_{\eta_{n - 1}}(\mathbf{x}_{\eta_{n}}^{(k)} \mid \boldsymbol{x}_{\eta_{n - 1}}^{(k)}) \end{array}
$$

- end

For sample k, we can derive the importance weight by chaining together the importance weights for the jumps between the intermediate distributions given in equation 18.49:

$$
w^{(k)} = \frac{\tilde{p}_{\eta_{1}}(\boldsymbol{x}_{\eta_{1}}^{(k)})}{\tilde{p}_{0}(\boldsymbol{x}_{\eta_{1}}^{(k)})} \frac{\tilde{p}_{\eta_{2}}(\boldsymbol{x}_{\eta_{2}}^{(k)})}{\tilde{p}_{\eta_{1}}(\boldsymbol{x}_{\eta_{2}}^{(k)})} \dots \frac{\tilde{p}_{1}(\boldsymbol{x}_{1}^{(k)})}{\tilde{p}_{\eta_{n - 1}}(\boldsymbol{x}_{\eta_{n}}^{(k)})}.\tag{18.52}
$$

To avoid numerical issues such as overflow, it is probably best to compute $\log w^{(k)}$ by adding and subtracting log probabilities, rather than computing $w^{(k)}$ by multiplying and dividing probabilities.

With the sampling procedure thus defined and the importance weights given in equation 18.52, the estimate of the ratio of partition functions is given by:

$$
\frac{Z_{1}}{Z_{0}} \approx \frac{1}{K} \sum_{k = 1}^{K} w^{(k)}\tag{18.53}
$$

To verify that this procedure defines a valid importance sampling scheme, we can show (Neal, 2001) that the AIS procedure corresponds to simple importance sampling on an extended state space, with points sampled over the product space $[x_{\eta_1},\ldots,x_{\eta_{n - 1}},x_1]$ . To do this, we define the distribution over the extended space as

$$
\begin{array}{c} \tilde{p}(\boldsymbol{x}_{\eta_{1}}, \ldots, \boldsymbol{x}_{\eta_{n - 1}}, \boldsymbol{x}_{1}) \\ = \tilde{p}_{1}(\boldsymbol{x}_{1}) \tilde{T}_{\eta_{n - 1}}(\boldsymbol{x}_{\eta_{n - 1}} \mid \boldsymbol{x}_{1}) \tilde{T}_{\eta_{n - 2}}(\boldsymbol{x}_{\eta_{n - 2}} \mid \boldsymbol{x}_{\eta_{n - 1}}) \ldots \tilde{T}_{\eta_{1}}(\boldsymbol{x}_{\eta_{1}} \mid \boldsymbol{x}_{\eta_{2}}), \end{array}\tag{18.54}
$$

(18.55)

where $\tilde{T}_{a}$ is the reverse of the transition operator defined by $T_{a}$ (via an application of Bayes' rule):

$$
\tilde{T}_{a}(\boldsymbol{x}^{\prime} \mid \boldsymbol{x}) = \frac{p_{a}(\boldsymbol{x}^{\prime})}{p_{a}(\boldsymbol{x})} T_{a}(\boldsymbol{x} \mid \boldsymbol{x}^{\prime}) = \frac{\tilde{p}_{a}(\boldsymbol{x}^{\prime})}{\tilde{p}_{a}(\boldsymbol{x})} T_{a}(\boldsymbol{x} \mid \boldsymbol{x}^{\prime}).\tag{18.56}
$$

Plugging the above into the expression for the joint distribution on the extended state space given in equation 18.55, we get:

$$
\begin{array}{l} \tilde{p}(\boldsymbol{x}_{\eta_{1}}, \dots, \boldsymbol{x}_{\eta_{n - 1}}, \boldsymbol{x}_{1}) \\ = \tilde{p}_{1}(\boldsymbol{x}_{1}) \frac{\tilde{p}_{\eta_{n - 1}}(\boldsymbol{x}_{\eta_{n - 1}})}{\tilde{p}_{\eta_{n - 1}}(\boldsymbol{x}_{1})} T_{\eta_{n - 1}}(\boldsymbol{x}_{1} \mid \boldsymbol{x}_{\eta_{n - 1}}) \prod_{i = 1}^{n - 2} \frac{\tilde{p}_{\eta_{i}}(\boldsymbol{x}_{\eta_{i}})}{\tilde{p}_{\eta_{i}}(\boldsymbol{x}_{\eta_{i + 1}})} T_{\eta_{i}}(\boldsymbol{x}_{\eta_{i + 1}} \mid \boldsymbol{x}_{\eta_{i}}) \end{array} \tag{18}\tag{18.57}
$$

(18.58)

$$
= \frac{\tilde{p}_{1}(\boldsymbol{x}_{1})}{\tilde{p}_{\eta_{n - 1}}(\boldsymbol{x}_{1})} T_{\eta_{n - 1}}(\boldsymbol{x}_{1} \mid \boldsymbol{x}_{\eta_{n - 1}}) \tilde{p}_{\eta_{1}}(\boldsymbol{x}_{\eta_{1}}) \prod_{i = 1}^{n - 2} \frac{\tilde{p}_{\eta_{i + 1}}(\boldsymbol{x}_{\eta_{i + 1}})}{\tilde{p}_{\eta_{i}}(\boldsymbol{x}_{\eta_{i + 1}})} T_{\eta_{i}}(\boldsymbol{x}_{\eta_{i + 1}} \mid \boldsymbol{x}_{\eta_{i}}).\tag{18.59}
$$

We now have means of generating samples from the joint proposal distribution q over the extended sample via a sampling scheme given above, with the joint distribution given by

$$
q \left(\boldsymbol{x}_{\eta_{1}}, \dots, \boldsymbol{x}_{\eta_{n - 1}}, \boldsymbol{x}_{1}\right) = p_{0} \left(\boldsymbol{x}_{\eta_{1}}\right) T_{\eta_{1}} \left(\boldsymbol{x}_{\eta_{2}} \mid \boldsymbol{x}_{\eta_{1}}\right) \dots T_{\eta_{n - 1}} \left(\boldsymbol{x}_{1} \mid \boldsymbol{x}_{\eta_{n - 1}}\right).\tag{18.60}
$$

We have a joint distribution on the extended space given by equation 18.59. Taking $q(\pmb{x}_{\eta_1}, \ldots, \pmb{x}_{\eta_{n-1}}, \pmb{x}_1)$ as the proposal distribution on the extended state space from which we will draw samples, it remains to determine the importance weights:

$$
w^{(k)} = \frac{\tilde{p}(\boldsymbol{x}_{\eta_{1}}, \ldots, \boldsymbol{x}_{\eta_{n - 1}}, \boldsymbol{x}_{1})}{q(\boldsymbol{x}_{\eta_{1}}, \ldots, \boldsymbol{x}_{\eta_{n - 1}}, \boldsymbol{x}_{1})} = \frac{\tilde{p}_{1}(\boldsymbol{x}_{1}^{(k)})}{\tilde{p}_{\eta_{n - 1}}(\boldsymbol{x}_{\eta_{n - 1}}^{(k)})} \dots \frac{\tilde{p}_{\eta_{2}}(\boldsymbol{x}_{\eta_{2}}^{(k)})}{\tilde{p}_{1}(\boldsymbol{x}_{\eta_{1}}^{(k)})} \frac{\tilde{p}_{\eta_{1}}(\boldsymbol{x}_{\eta_{1}}^{(k)})}{\tilde{p}_{0}(\boldsymbol{x}_{0}^{(k)})}.\tag{18.61}
$$

These weights are the same as proposed for AIS. Thus we can interpret AIS as simple importance sampling applied to an extended state, and its validity follows immediately from the validity of importance sampling.

Annealed importance sampling was first discovered by Jarzynski (1997) and then again, independently, by Neal (2001). It is currently the most common way of estimating the partition function for undirected probabilistic models. The reasons for this may have more to do with the publication of an influential paper (Salakhutdinov and Murray, 2008) describing its application to estimating the partition function of restricted Boltzmann machines and deep belief networks than with any inherent advantage the method has over the other method described below.

A discussion of the properties of the AIS estimator (e.g., its variance and efficiency) can be found in Neal (2001).

## 18.7.2 Bridge Sampling

Bridge sampling (Bennett, 1976) is another method that, like AIS, addresses the shortcomings of importance sampling. Rather than chaining together a series of intermediate distributions, bridge sampling relies on a single distribution $p_*$ , known as the bridge. to interpolate between a distribution with known partition function, $p_0$ , and a distribution $p_1$ for which we are trying to estimate the partition function $Z_1$ .

Bridge sampling estimates the ratio $Z_{1}/Z_{0}$ as the ratio of the expected importance weights between $\tilde{p}_{0}$ and $\tilde{p}_{*}$ and between $\tilde{p}_{1}$ and $\tilde{p}_{*}$ :

$$
\frac{Z_{1}}{Z_{0}} \approx \sum_{k = 1}^{K} \frac{\tilde{p}_{*}(\boldsymbol{x}_{0}^{(k)})}{\tilde{p}_{0}(\boldsymbol{x}_{0}^{(k)})} \Bigg / \sum_{k = 1}^{K} \frac{\tilde{p}_{*}(\boldsymbol{x}_{1}^{(k)})}{\tilde{p}_{1}(\boldsymbol{x}_{1}^{(k)})}.\tag{18.62}
$$

If the bridge distribution $p_{*}$ is chosen carefully to have a large overlap of support with both $p_{0}$ and $p_{1}$ , then bridge sampling can allow the distance between two distributions (or more formally, $D_{\mathrm{KL}}(p_{0}\|p_{1})$ ) to be much larger than with standard importance sampling.

It can be shown that the optimal bridging distribution is given by $p_{*}^{(opt)}(\mathbf{x}) \propto \frac{\tilde{p}_{0}(\mathbf{x})\tilde{p}_{1}(\mathbf{x})}{r\tilde{p}_{0}(\mathbf{x}) + \tilde{p}_{1}(\mathbf{x})}$ , where $r = Z_{1}/Z_{0}$ . At first, this appears to be an unworkable solution as it would seem to require the very quantity we are trying to estimate, $Z_{1}/Z_{0}$ . However, it is possible to start with a coarse estimate of r and use the resulting bridge distribution to refine our estimate iteratively (Neal, 2005). That is, we iteratively reestimate the ratio and use each iteration to update the value of r.

Linked importance sampling Both AIS and bridge sampling have their advantages. If $D_{\mathrm{KL}}(p_{0}||p_{1})$ is not too large (because $p_{0}$ and $p_{1}$ are sufficiently close), bridge sampling can be a more effective means of estimating the ratio of partition functions than AIS. If, however, the two distributions are too far apart for a single distribution $p_{*}$ to bridge the gap, then one can at least use AIS with potentially many intermediate distributions to span the distance between $p_{0}$ and $p_{1}$ . Neal (2005) showed how his linked importance sampling method leveraged the power of the bridge sampling strategy to bridge the intermediate distributions used in AIS and significantly improve the overall partition function estimates.

Estimating the partition function while training While AIS has become accepted as the standard method for estimating the partition function for many undirected models, it is sufficiently computationally intensive that it remains infeasible to use during training. Alternative strategies have been explored to maintain an estimate of the partition function throughout training.

Using a combination of bridge sampling, short-chain AIS and parallel tempering, Desjardins et al. (2011) devised a scheme to track the partition function of an RBM throughout the training process. The strategy is based on the maintenance of independent estimates of the partition functions of the RBM at every temperature operating in the parallel tempering scheme. The authors combined bridge sampling estimates of the ratios of partition functions of neighboring chains (i.e., from parallel tempering) with AIS estimates across time to come up with a low variance estimate of the partition functions at every iteration of learning.

The tools described in this chapter provide many different ways of overcoming the problem of intractable partition functions, but there can be several other difficulties involved in training and using generative models. Foremost among these is the problem of intractable inference, which we confront next.


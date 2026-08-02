---
title: "Chapter 20 \u2014 Diffusion Models"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 20
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 14174
source_line_end: 16778
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 15
source_empty_image_alt: 15
non_semantic_image_alt: 11
caption_derived_image_alt: 4
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 6
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 20 — Diffusion Models

> [[../README|本书目录]] · [[19-chapter-19-autoencoders|上一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 14174–16778。
> - 本章保留 15 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 6；PDF-confirmed exercise difficulty marker (PDF p.613) × 1；PDF-confirmed exercise difficulty marker (PDF p.614) × 2；PDF-confirmed exercise difficulty marker (PDF p.615) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 20.1. Forward Encoder

Suppose we take an image from the training set, which we will denote by $\mathbf{x},$ and blend it with Gaussian noise independently for each pixel to give a noise-corrupted image $\mathbf{z}_{1}$ defined by

$$
\mathbf{z}_{1} = \sqrt{1 - \beta_{1}} \mathbf{x} + \sqrt{\beta_{1}} \mathbf{\epsilon}_{1}\tag{20.1}
$$

where $\epsilon_{1} \sim \mathcal{N}(\epsilon_{1} | \mathbf{0}, \mathbf{I})$ and $\beta_{1} < 1$ is the variance of the noise distribution. The choice of coefficients $\sqrt{1 - \beta_{1}}$ and $\sqrt{\beta_{1}}$ in (20.1) and (20.3) ensures that the mean of the distribution of $\mathbf{z}_{t}$ is closer to zero than the mean of $\mathbf{z}_{t - 1}$ and that the variance of $\mathbf{z}_{t}$ is closer to the unit matrix than the variance of $\mathbf{z}_{t - 1}$ . We can write the transformation (20.1) in the form

$$
q(\mathbf{z}_{1} | \mathbf{x}) = \mathcal{N}(\mathbf{z}_{1} | \sqrt{1 - \beta_{1}} \mathbf{x}, \beta_{1} \mathbf{I}).\tag{20.2}
$$

We then repeat the process with additional independent Gaussian noise steps to give a sequence of increasingly noisy images $\mathbf{z}_{2}, \ldots, \mathbf{z}_{T}$ . Note that in the literature on diffusion models, these latent variables are sometimes denoted $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ and the observed variable is denoted $\mathbf{x}_{\mathrm{0}}$ . We use the notation of $\mathbf{z}$ for latent variables and x for the observed variable for consistency with the rest of the book. Each successive image is given by

![Figure 20.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/17d709003b111ca4a8b8e9cb785db871ac50dd75468ff56db10389fb5152e4c1.jpg)  
Figure 20.2 A diffusion process represented as a probabilistic graphical model. The original image x is shown by the shaded node, since it is an observed variable, whereas the noise-corrupted images ${\bf z}_{1}, \ldots,{\bf z}_{T}$ are considered to be latent variables. The noise process is defined by the forward distribution $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ and can be viewed as an encoder. Our goal is to learn a model $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ that tries to reverse this noise process and which can be viewed as a decoder. As we will see later, the conditional distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})$ plays an important role in defining the training procedure.

$$
\mathbf{z}_{t} = \sqrt{1 - \beta_{t}} \mathbf{z}_{t - 1} + \sqrt{\beta_{t}} \mathbf{\epsilon}_{t}\tag{20.3}
$$

where $\epsilon_{t} \sim \mathcal{N}(\epsilon_{t} | \mathbf{0}, \mathbf{I})$ . Again, we can write (20.3) in the form

$$
q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}) = \mathcal{N}(\mathbf{z}_{t} | \sqrt{1 - \beta_{t}} \mathbf{z}_{t - 1}, \beta_{t} \mathbf{I}).\tag{20.4}
$$

The sequence of conditional distributions (20.4) forms a Markov chain and can be expressed as a probabilistic graphical model as shown in Figure 20.2. The values of the variance parameters $\beta_{t} \in(0, 1)$ are set by hand and are typically chosen such that the variance values increase through the chain according to a prescribed schedule such that $\beta_{1} < \beta_{2} <...< \beta_{T}$

## 20.1.1 Diffusion kernel

The joint distribution of the latent variables, conditioned on the observed data vector x, is given by

$$
q(\mathbf{z}_{1}, \dots, \mathbf{z}_{t} | \mathbf{x}) = q(\mathbf{z}_{1} | \mathbf{x}) \prod_{\tau = 2}^{t} q(\mathbf{z}_{\tau} | \mathbf{z}_{\tau - 1}).\tag{20.5}
$$

If we now marginalize over the intermediate variables $\mathbf{z}_{1}, \ldots, \mathbf{z}_{t - 1}$ , we obtain the diffusion kernel:

$$
q(\mathbf{z}_{t} | \mathbf{x}) = \mathcal{N}(\mathbf{z}_{t} | \sqrt{\alpha_{t}} \mathbf{x},(1 - \alpha_{t}) \mathbf{I})\tag{20.6}
$$

where we have defined

$$
\alpha_{t} = \prod_{\tau = 1}^{t}(1 - \beta_{\tau}).\tag{20.7}
$$

We see that each intermediate distribution has a simple closed-form Gaussian expression from which we can directly sample, which will prove useful when training DDPMs as it allows efficient stochastic gradient descent using randomly chosen intermediate terms in the Markov chain without having to run the whole chain. We can also write (20.6) in the form

$$
\mathbf{z}_{t} = \sqrt{\alpha_{t}} \mathbf{x} + \sqrt{1 - \alpha_{t}} \mathbf{\epsilon}_{t}\tag{20.8}
$$

where again $\epsilon_{t} \sim \mathcal{N}(\epsilon_{t} | \mathbf{0}, \mathbf{I})$ . Note that that $\epsilon$ now represents the total noise added to the original image instead of the incremental noise added at this step of the Markov chain.

After many steps the image becomes indistinguishable from Gaussian noise, and in the limit $T \to \infty$ we have

$$
q(\mathbf{z}_{T} | \mathbf{x}) = \mathcal{N}(\mathbf{z}_{T} | \mathbf{0}, \mathbf{I})\tag{20.9}
$$

and therefore all information about the original image is lost. The choice of coefficients $\sqrt{1 - \beta_{t}}$ and $\sqrt{\beta_{t}}$ in (20.3) ensures that once the Markov chain converges to a distribution with zero mean and unit covariance, further updates will leave this unchanged.

Since the right-hand side of (20.9) is independent of x, it follows that the marginal distribution of $\mathbf{z}_{T}$ is given by

$$
\begin{array}{r}{q(\mathbf{z}_{T}) = \mathcal{N}(\mathbf{z}_{T} | \mathbf{0}, \mathbf{I}).} \end{array}\tag{20.10}
$$

It is common to refer to the Markov chain (20.4) as the forward process, and it is analogous to the encoder in a VAE, except that here it is fixed rather than learned. Note, however, that the usual terminology in the literature is the opposite of that typically used in the literature regarding normalizing flows, where the mapping from latent space to data space is considered the forward process.

## 20.1.2 Conditional distribution

Our goal is to learn to undo the noise process, and so it is natural to consider the reverse of the conditional distribution $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ , which we can express using Bayes’ theorem in the form

$$
q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}) = \frac{q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}) q(\mathbf{z}_{t - 1})}{q(\mathbf{z}_{t})}.\tag{20.11}
$$

We can write the marginal distribution $q(\mathbf{z}_{t - 1})$ in the form

$$
q(\mathbf{z}_{t - 1}) = \int q(\mathbf{z}_{t - 1} | \mathbf{x}) p(\mathbf{x}) d \mathbf{x}\tag{20.12}
$$

where $q(\mathbf{z}_{t - 1} | \mathbf{x})$ is given by the conditional Gaussian (20.6). This distribution is intractable, however, because we must integrate over the unknown data density $p(\mathbf{x})$ If we approximate the integration using samples from the training data set, we obtain a complicated distribution expressed as a mixture of Gaussians.

Instead, we consider the conditional version of the reverse distribution, conditioned on the data vector x, defined by $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})$ , which as we will see shortly turns out to be a simple Gaussian distribution. Intuitively this is reasonable since, given a noisy image, it is difficult to guess which lower-noise image gave rise to it, whereas if we also know the starting image then the problem becomes much easier. We can calculate this conditional distribution using Bayes’ theorem:

$$
q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x}) = \frac{q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}, \mathbf{x}) q(\mathbf{z}_{t - 1} | \mathbf{x})}{q(\mathbf{z}_{t} | \mathbf{x})}.\tag{20.13}
$$

We now make use of the Markov property of the forward process to write

$$
q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}, \mathbf{x}) = q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})\tag{20.14}
$$

where the right-hand side is given by (20.4). As a function of $\mathbf{z}_{t - 1}$ , this takes the form of an exponential of a quadratic form. The term $q(\mathbf{z}_{t - 1} | \mathbf{x})$ in the numerator of (20.13) is the diffusion kernel given by (20.6), which again involves the exponential of a quadratic form with respect to $\mathbf{z}_{t - 1}$ . We can ignore the denominator in (20.13) since as a function of $\mathbf{z}_{t - 1}$ it is constant. Thus, we see that the right-hand side of (20.13) takes the form of a Gaussian distribution, and we can identify its mean and covariance using the technique of ‘completing the square’ to give

$$
\begin{array}{r}{q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x}) = \mathcal{N} \left(\mathbf{z}_{t - 1} | \mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t}), \sigma_{t}^{2} \mathbf{I} \right)} \end{array}\tag{20.15}
$$

where

$$
\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t}) = \frac{(1 - \alpha_{t - 1}) \sqrt{1 - \beta_{t}} \mathbf{z}_{t} + \sqrt{\alpha_{t - 1}} \beta_{t} \mathbf{x}}{1 - \alpha_{t}}\tag{20.16}
$$

$$
\sigma_{t}^{2} = \frac{\beta_{t} \big(1 - \alpha_{t - 1} \big)}{1 - \alpha_{t}}\tag{20.17}
$$

and we have made use of (20.7).

## 20.2. Reverse Decoder

We have seen that the forward encoder model is defined by a sequence of Gaussian conditional distributions $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ but that inverting this directly leads to a distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ that is intractable, as it would require integrating over all possible values of the starting vector x whose distribution is the unknown data distribution $p(\mathbf{x})$ that we wish to model. Instead, we will learn an approximation to the reverse distribution by using a distribution $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ governed by a deep neural network, where w represents the network weights and biases. This reverse step is analogous to the decoder in a variational autoencoder and is illustrated in Figure 20.2. Once the network is trained, we can sample from the simple Gaussian distribution over z and transform it into a sample from the data distribution $p(\mathbf{x})$ through a sequence of reverse sampling steps by repeated application of the trained network.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/092de8c154654ececb41db56cef9ad8f18309a4b4908d6fa3ec96f9ea6f35634.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b9273047233a0b620f9458493f2ac724c50f0d8393f79586fd1eb0177fc5b5bd.jpg)

![Figure 20.3](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/f390549faddde02921d79cb7ade70524ddc1b52669277093a26b3bb1dbb67d17.jpg)  
Figure 20.3 Illustration of the evaluation of the reverse distribution $q \big(z_{t - 1} | z_{t} \big)$ using Bayes’ theorem (20.13) for scalar variables. The red curve on the right-hand plot shows the marginal distribution $q \big(z_{t - 1} \big)$ illustrated using a mixture of three Gaussians, whereas the left-hand plot shows the Gaussian forward noise process $q \big(z_{t} | z_{t - 1} \big)$ as a distribution over $z_{t}$ centred on $z_{t - 1}$ . By multiplying these together and normalizing, we obtain the distribution $q \big(z_{t - 1} | z_{t} \big)$ shown for a particular choice of $z_{t}$ by the blue curve. Because the distribution on the left is relatively broad, corresponding to a large variance $\beta_{t}$ , the distribution $q \big(z_{t - 1} | z_{t} \big)$ has a complex multimodal structure.

Intuitively, if we keep the variances small so that $\beta_{t} \ll 1$ then the change in the latent vector between steps will be relatively small, and hence it should be easier to learn to invert the transformation. More specifically, if $\beta_{t} \ll 1$ then the distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ will be approximately a Gaussian distribution over $\mathbf{z}_{t - 1}$ . This can be seen from (20.11) since the right-hand side depends on $\mathbf{z}_{t - 1}$ through $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ and $q(\mathbf{z}_{t - 1})$ . If $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ is a sufficiently narrow Gaussian then $q(\mathbf{z}_{t - 1})$ will vary only a small amount over the region in which $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ has significant mass, and hence $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ will also be approximately Gaussian. This intuition can be confirmed using a simple example as shown in Figures 20.3 and 20.4. However, since the variances at each step are small, we must use a large number of steps to ensure that the distribution over the final latent variable $\mathbf{z}_{T}$ obtained from the forward noising process will still be close to a Gaussian, and this increases the cost of generating new samples. In practice, $T$ may be several thousand.

We can see more formally that $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ will be approximately Gaussian by making a Taylor series expansion of ln $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ around the point $\mathbf{z}_{t}$ as a function of $\mathbf{z}_{t - 1}$ . This also shows that for small variance, the reverse distribution $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ will have a covariance that is close to the covariance $\beta_{t} \mathbf{I}$ of the forward noise process $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ . We therefore model the reverse process using a Gaussian distribution of the form

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/a06367cbe40efc086f2c1200f8f3f21ae9451b9c0690d95207fe849ea62ab134.jpg)

![Figure 20.4](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/201d290766a279225f0ffacb1edd56a20a57db59b5052151fdd7133cf89f98f7.jpg)  
Figure 20.4 As in Figure 20.3 but in which the Gaussian distribution $q \big(z_{t} | z_{t - 1} \big)$ in the left-hand plot has a much smaller variance $\beta_{t}$ . We see that the corresponding distribution $q \big(z_{t - 1} | z_{t} \big)$ shown in blue on the right-hand plot is close to being Gaussian, with a similar variance to $q \big(z_{t} | z_{t - 1} \big)$

$$
p(\mathbf{z}_{t - 1} \vert \mathbf{z}_{t}, \mathbf{w}) = \mathcal{N}(\mathbf{z}_{t - 1} \vert \pmb{\mu}(\mathbf{z}_{t}, \mathbf{w}, t), \beta_{t} \mathbf{I})\tag{20.18}
$$

where $\mu(\mathbf{z}_{t}, \mathbf{w}, t)$ is a deep neural network governed by a set of parameters w. Note that the network takes the step index t explicitly as an input so that it can account for the variation of the variance $\beta_{t}$ across different steps of the chain. This allows us to use a single network to invert all the steps in the Markov chain, instead of having to learn a separate network for each step. It is also possible to learn the covariances of the denoising process by incorporating further outputs in the network to account for the curvature in the distribution $q(\mathbf{z}_{t - 1})$ in the neighbourhood of $\mathbf{z}_{t}$ (Nichol and Dhariwal, 2021). There considerable flexibility in the choice of architecture for the neural network used to model $\mu(\mathbf{z}_{t}, \mathbf{w}, t)$ provided the output has the same dimensionality as the input. Given this restriction, a U-net architecture is a common choice for image processing applications.

The overall reverse denoising process then takes the form of a Markov chain given by

$$
p(\mathbf{x}, \mathbf{z}_{1},..., \mathbf{z}_{T} | \mathbf{w}) = p(\mathbf{z}_{T}) \left\{\prod_{t = 2}^{T} p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w}) \right\} p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w}).\tag{20.19}
$$

Here $p(\mathbf{z}_{T})$ is assumed to be the same as the distribution of $q({\bf z}_{T})$ and hence is given by $\mathcal{N}({\bf z}_{T} | \mathbf{0},{\bf I})$ . Once the model has been trained, sampling is straightforward because we first sample from the simple Gaussian $p(\mathbf{z}_{T})$ and then we sample sequentially from each of the conditional distributions $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ in turn, finally sampling from $p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w})$ to obtain a sample x in the data space.

## 20.2.1 Training the decoder

We next have to decide on an objective function for training the neural network. The obvious choice is the likelihood function, which for data point x is given by

$$
p(\mathbf{x} | \mathbf{w}) = \int \cdots \int p(\mathbf{x}, \mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{w}) d \mathbf{z}_{1} \ldots d \mathbf{z}_{T}\tag{20.20}
$$

in which $p(\mathbf{x}, \mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{w})$ is defined by (20.19). This is an instance of the general latent-variable model (16.81) in which the latent variables comprise $\mathbf{z} =(\mathbf{z}_{1}, \dots, \mathbf{z}_{T})$ and the observed variable is x. Note that the latent variables all have the same dimensionality as the data space, as was the case for normalizing flows but not for variational autoencoders or generative adversarial networks. We see from (20.20) that the likelihood involves integrating over all possible trajectories by which noise samples could give rise to the observed data point. The integrals in (20.20) are intractable as they involve integrating over the highly complex neural network functions.

## 20.2.2 Evidence lower bound

Since the exact likelihood is intractable, we can adopt a similar approach to that used with variational autoencoders and maximize a lower bound on the log likelihood called the evidence lower bound (ELBO), which we re-derive here in the context of diffusion models. For any choice of distribution $q(\mathbf{z})$ , the following relation always holds:

$$
\ln p(\mathbf{x} | \mathbf{w}) = \mathcal{L}(\mathbf{w}) + \mathrm{KL} \left(q(\mathbf{z}) \| p(\mathbf{z} | \mathbf{x}, \mathbf{w}) \right)\tag{20.21}
$$

where $\mathcal{L}$ is the evidence lower bound, also known as the variational lower bound, given by

$$
\mathcal{L}(\mathbf{w}) = \int q(\mathbf{z}) \ln \left\{\frac{p(\mathbf{x}, \mathbf{z} | \mathbf{w})}{q(\mathbf{z})} \right\} d \mathbf{z}\tag{20.22}
$$

and the Kullback–Leibler divergence KL $(f \| g)$ between two probability densities $f(\mathbf{z})$ and $g(\mathbf{z})$ is defined by

$$
\mathrm{KL} \left(f(\mathbf{z}) \| g(\mathbf{z}) \right) = - \int f(\mathbf{z}) \ln \left\{\frac{g(\mathbf{z})}{f(\mathbf{z})} \right\} d \mathbf{z}.\tag{20.23}
$$

To verify the relation (20.21) first note that, from the product rule of probability, we have

$$
\begin{array}{r}{p(\mathbf{x}, \mathbf{z} | \mathbf{w}) = p(\mathbf{z} | \mathbf{x}, \mathbf{w}) p(\mathbf{x} | \mathbf{w}).} \end{array}\tag{20.24}
$$

Substituting (20.24) into (20.22) and making use of (20.23) gives (20.21). The Kullback–Leibler divergence has the property KL $(\cdot \| \cdot) \geqslant 0$ from which it follows that

$$
\ln p(\mathbf{x} | \mathbf{w}) \geqslant{\mathcal{L}}(\mathbf{w}).\tag{20.25}
$$

Since the log likelihood function is intractable, we train the neural network by maximizing the lower bound $\mathcal{L}(\mathbf{w})$

To do this, we first derive an explicit form for the lower bound of the diffusion model. In defining the lower bound we are free to choose any form we like for $q(\mathbf{z})$ as long as it is a valid probability distribution, i.e., that it is non-negative and integrates to 1. With many applications of the ELBO, such as the variational autoencoder, we chose a form for $q(\mathbf{z})$ that has adjustable parameters, often in the form of a deep neural network, and then we maximize the ELBO with respect to those parameters as well as with respect to the parameters of the distribution $p(\mathbf{x}, \mathbf{z} | \mathbf{w})$ . Optimizing the distribution $q(\mathbf{z})$ encourages the bound to be tight, which brings the optimization of the parameters in $p(\mathbf{x}, \mathbf{z} | \mathbf{w})$ closer to that of maximum likelihood. With diffusion models, however, we chose $q(\mathbf{z})$ to be given by the fixed distribution $q(\mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{x})$ defined by the Markov chain (20.5), and so the only adjustable parameters are those in the model $p(\mathbf{x}, \mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{w})$ for the reverse Markov chain. Note that we are using the flexibility in the choice of $q(\mathbf{z})$ to select a form that depends on x.

We therefore substitute for $q(\mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{x})$ in (20.21) using (20.5), and likewise we substitute for $p(\mathbf{x}, \mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{w})$ using (20.19), which allows us to write the

ELBO in the form

$$
\begin{array}{rlr} &{} &{\mathcal{L}({\bf w}) ={\mathbb E}_{q} \left[\ln \frac{p({\bf z}_{T}) \left\{\prod_{t = 2}^{T} p({\bf z}_{t - 1} |{\bf z}_{t},{\bf w}) \right\} p({\bf x} |{\bf z}_{1},{\bf w})}{q({\bf z}_{1} |{\bf x}) \prod_{t = 2}^{T} q({\bf z}_{t} |{\bf z}_{t - 1},{\bf x})} \right]} \\ &{} &{={\mathbb E}_{q} \left[\ln p({\bf z}_{T}) + \sum_{t = 2}^{T} \ln \frac{p({\bf z}_{t - 1} |{\bf z}_{t},{\bf w})}{q({\bf z}_{t} |{\bf z}_{t - 1},{\bf x})} - \ln q({\bf z}_{1} |{\bf x}) + \ln p({\bf x} |{\bf z}_{1},{\bf w}) \right]} \end{array}\tag{20.26}
$$

where we have defined

$$
\mathbb{E}_{q} \left[\cdot \right] \equiv \int \cdots \int q(\mathbf{z}_{1} | \mathbf{x}) \prod_{t = 2}^{T} q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}) \left[\cdot \right] d \mathbf{z}_{1} \dots d \mathbf{z}_{T}.\tag{20.27}
$$

The first term ln $p(\mathbf{z}_{T})$ on the right-hand side of (20.26) is just the fixed distribution $\mathcal{N}({\bf z}_{T} | \mathbf{0},{\bf I})$ . This has no trainable parameters and can therefore be omitted from the ELBO since it represents a fixed additive constant. Similarly, the third term $- \ln q(\mathbf{z}_{1} | \mathbf{x})$ is independent of w and so again can be omitted.

The fourth term on the right-hand side of (20.26) corresponds to the reconstruction term from the variational autoencoder. It can be evaluated by approximating the expectation $\textstyle \mathbb{E}_{q} ~[\cdot ~]$ by a Monte Carlo estimate obtained by drawing samples from the distribution over $\mathbf{z}_{1}$ defined by (20.2) so that

$$
\mathbb{E}_{q} \left[\ln p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w}) \right] \simeq \sum_{l = 1}^{L} \ln p(\mathbf{x} | \mathbf{z}_{1}^{(l)}, \mathbf{w})\tag{20.28}
$$

where $\mathbf{z}_{1}^{(l)} \sim \mathcal{N}(\mathbf{z}_{1} | \sqrt{1 - \beta_{1}} \mathbf{x}, \beta_{1} \mathbf{I})$ . Unlike with VAEs we do not need to backpropagate an error signal through the sampled value because the q-distribution is fixed and so there is no need here for the reparameterization trick.

This leaves the second term on the right-hand side of (20.26), which comprises a sum of terms each of which is dependent on a pair of adjacent latent-variable values $\mathbf{z}_{t - 1}$ and $\mathbf{z}_{t}$ . We saw earlier when we derived the diffusion kernel (20.6) that we can sample from $q(\mathbf{z}_{t - 1} | \mathbf{x})$ directly as a Gaussian distribution and we could then obtain a corresponding sample of $\mathbf{z}_{t}$ using (20.4), which is also a Gaussian. Although this would be a correct procedure in the limit of an infinite number of samples, the use of pairs of sampled values creates very noisy estimates with high variance, so that an unnecessarily large numbers of samples is required. Instead, we rewrite the ELBO in a form that can be estimated by sampling just one value per term.

## 20.2.3 Rewriting the ELBO

Following our discussion of the ELBO for the variational autoencoder, our goal here is to write the ELBO in terms of Kullback–Leibler divergences, which we can then subsequently express in closed form. The neural network is a model of the distribution in the reverse direction $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ whereas the $q \mathrm{-}$ -distribution is expressed in the forward direction $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}, \mathbf{x})$ , and so we use Bayes’ theorem to reverse the conditional distribution by writing

$$
q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}, \mathbf{x}) ={\frac{q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x}) q(\mathbf{z}_{t} | \mathbf{x})}{q(\mathbf{z}_{t - 1} | \mathbf{x})}}.\tag{20.29}
$$

This allows us to write the second term in (20.26) in the form

$$
\ln{\frac{p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})}{q(\mathbf{z}_{t} | \mathbf{z}_{t - 1}, \mathbf{x})}} = \ln{\frac{p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})}{q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})}} + \ln{\frac{q(\mathbf{z}_{t - 1} | \mathbf{x})}{q(\mathbf{z}_{t} | \mathbf{x})}}.\tag{20.30}
$$

The second term on the right-hand side of (20.30) is independent of w and so can be omitted. Substituting (20.30) into (20.26), we then obtain

$$
\mathcal{L}(\mathbf{w}) = \mathbb{E}_{q} \left[\sum_{t = 2}^{T} \ln \frac{p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})}{q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})} + \ln p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w}) \right].\tag{20.31}
$$

Finally, we can rewrite (20.31) in the form

$$
\begin{array}{l}{\displaystyle \mathcal{L}({\mathbf w}) = \underbrace{\int q({\mathbf z}_{1} |{\mathbf x}) \ln p({\mathbf x} |{\mathbf z}_{1},{\mathbf w}) d{\mathbf z}_{1}}_{\mathrm{reconstruction ~ term}}} \\{\displaystyle - \underbrace{\sum_{t = 2}^{T} \int \mathrm{KL}(q({\mathbf z}_{t - 1} |{\mathbf z}_{t},{\mathbf x}) | | p({\mathbf z}_{t - 1} |{\mathbf z}_{t},{\mathbf w})) q({\mathbf z}_{t} |{\mathbf x}) d{\mathbf z}_{t}}_{\mathrm{consistency ~ terms}}} \end{array}\tag{20.32}
$$

where we have simplified the expectation over $q(\mathbf{z}_{1}, \ldots, \mathbf{z}_{T} | \mathbf{x})$ in the first term since $\mathbf{z}_{1}$ is the only latent variable appearing in the integrand. Therefore in the expectation defined by (20.27), all the conditional distributions integrate to unity leaving only the integral over $\mathbf{z}_{1}$ . Likewise, in the second term, each integral involves only two adjacent latent variables $\mathbf{z}_{t - 1}$ and $\mathbf{z}_{t}$ , and all remaining variables can be integrated out.

The bound (20.32) is now very similar to the ELBO for the variational autoencoder given by (19.14), except that there are now multiple encoder and decoder stages. The reconstruction term rewards high probability for the observed data sample and can be trained in the same way as the corresponding term in the VAE by using the sampling approximation (20.28). The consistency terms in (20.32) are defined between pairs of Gaussian distributions and therefore can be expressed in closed form, as follows. The distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})$ is given by (20.15) whereas the distribution $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ is given by (20.18) and so the Kullback–Leibler divergence becomes

$$
\begin{array}{l}{{\displaystyle \mathrm{KL} \big(} q({\mathbf z}_{t - 1} |{\mathbf z}_{t},{\mathbf x}){\big |}{\big |} p({\mathbf z}_{t - 1} |{\mathbf z}_{t},{\mathbf w}){\big)}} \\{= \displaystyle \frac{1}{2 \beta_{t}} \left\|{\mathbf m}_{t}({\mathbf x},{\mathbf z}_{t}) - \mu({\mathbf z}_{t},{\mathbf w}, t) \right\|^{2} + \mathrm{const}} \end{array}\tag{20.33}
$$


<!-- MinerU source pages 601-656 -->

where $\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t})$ is defined by (20.16) and where any additive terms that are independent of the network parameters w have been absorbed into the constant term, which plays no role in training. Each of the consistency terms in (20.32) has one remaining integral over $\mathbf{z}_{t}.$ , weighted by $q(\mathbf{z}_{t} | \mathbf{x})$ . This can be approximated by drawing a sample from $q(\mathbf{z}_{t} | \mathbf{x})$ , which can be done efficiently using the diffusion kernel (20.6).

We see that the KL divergence (20.33) takes the form of a simple squared-loss function. Since we adjust the network parameters to maximize the lower bound in (20.32), we will be minimizing this squared error because there is a minus sign in front of the Kullback–Leibler divergence terms in the ELBO.

## 20.2.4 Predicting the noise

One modification that leads to higher quality results is to change the role of the neural network so that instead of predicting the denoised image at each step of the Markov chain it predicts the total noise component that was added to the original image to create the noisy image at that step (Ho, Jain, and Abbeel, 2020). To do this we first take (20.8) and rearrange to give

$$
\mathbf{x} = \frac{1}{\sqrt{\alpha_{t}}} \mathbf{z}_{t} - \frac{\sqrt{1 - \alpha_{t}}}{\sqrt{\alpha_{t}}} \epsilon_{t}.\tag{20.34}
$$

If we now substitute this into (20.16) we can rewrite the mean $\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t})$ of the reverse conditional distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})$ in terms of the original data vector x and the noise $\epsilon$ to give

$$
\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t}) = \frac{1}{\sqrt{1 - \beta_{t}}} \left\{\mathbf{z}_{t} - \frac{\beta_{t}}{\sqrt{1 - \alpha_{t}}} \mathbf{\epsilon}_{t} \right\}.\tag{20.35}
$$

Similarly, instead of a neural network $\mu(\mathbf{z}_{t}, \mathbf{w}, t)$ that predicts the denoised image, we introduce a neural network $\mathbf{g}(\mathbf{z}_{t}, \mathbf{w}, t)$ that aims to predict the total noise that was added to $\mathbf{x}$ to generate $\mathbf{z}_{t}$ . Following the same steps that led to (20.35) shows that these two network functions are related by

$$
\mu({\bf z}_{t},{\bf w}, t) = \frac{1}{\sqrt{1 - \beta_{t}}} \left\{{\bf z}_{t} - \frac{\beta_{t}}{\sqrt{1 - \alpha_{t}}}{\bf g}({\bf z}_{t},{\bf w}, t) \right\}.\tag{20.36}
$$

We can now substitute (20.35) and (20.36) into (20.33) to give

$$
\begin{array}{rl} &{\mathrm{KL} \big(q(\mathbf{z}_{t - 1} \vert \mathbf{z}_{t}, \mathbf{x}) \vert \vert p(\mathbf{z}_{t - 1} \vert \mathbf{z}_{t}, \mathbf{w}) \big)} \\ &{= \frac{\beta_{t}}{2(1 - \alpha_{t})(1 - \beta_{t})} \left.\mathbf{g}(\mathbf{z}_{t}, \mathbf{w}, t) - \boldsymbol \epsilon_{t} \right.^{2} + \mathrm{const}} \\ &{= \frac{\beta_{t}}{2(1 - \alpha_{t})(1 - \beta_{t})} \left.\mathbf{g}(\sqrt{\alpha_{t}} \mathbf{x} + \sqrt{1 - \alpha_{t}} \boldsymbol \epsilon_{t}, \mathbf{w}, t) - \boldsymbol \epsilon_{t} \right.^{2} + \mathrm{const}} \end{array}\tag{20.37}
$$

where in the final line we have substituted for $\mathbf{z}_{t}$ using (20.8).

The reconstruction term in the ELBO (20.32) can be approximated using (20.28) with a sampled value of $\mathbf{z}_{1}$ . Using the form (20.18) for $p(\mathbf{x} | \mathbf{z}, \mathbf{w})$ we have

$$
\ln p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w}) = - \frac{1}{2 \beta_{1}} \lVert \mathbf{x} - \boldsymbol{\mu}(\mathbf{z}_{1}, \mathbf{w}, 1) \rVert^{2} + \mathrm{const}.\tag{20.38}
$$

If we substitute for $\mu(\mathbf{z}_{1}, \mathbf{w}, 1)$ using (20.36) and we substitute for x using (20.1) and then make use of $\alpha_{1} =(1 - \beta_{1})$ , which follows from (20.7), we obtain

$$
\ln p(\mathbf{x} | \mathbf{z}_{1}, \mathbf{w}) = - \frac{1}{2(1 - \beta_{t})} \| \mathbf{g}(\mathbf{z}_{1}, \mathbf{w}, 1) - \boldsymbol{\epsilon}_{1} \|^{2} + \mathrm{const}.\tag{20.39}
$$

This is precisely the same form as (20.37) for the special case $t = 1$ , and so the reconstruction and consistency terms can be combined.

Ho, Jain, and Abbeel (2020) found empirically that performance is further improved simply by omitting the factor $\beta_{t} / 2(1 - \alpha_{t})(1 - \beta_{t})$ in front of (20.37), so that all steps in the Markov chain have equal weighting. Substituting this simplified version of (20.37) into (20.33) gives a training objective function in the form

$$
\mathcal{L}(\mathbf{w}) = - \sum_{t = 1}^{T} \left\| \mathbf{g}(\sqrt{\alpha_{t}} \mathbf{x} + \sqrt{1 - \alpha_{t}} \epsilon_{t}, \mathbf{w}, t) - \epsilon_{t} \right\|^{2}.\tag{20.40}
$$

The squared error on the right-hand side of (20.40) has a very simple interpretation: for a given step t in the Markov chain and for a given training data point x, we sample a noise vector $\epsilon_{t}$ and use this to create the corresponding noisy latent vector $\mathbf{z}_{t}$ for that step. The loss function is then the squared difference between the predicted noise and the actual noise. Note that the network $\mathbf{g}(\cdot, \cdot, \cdot)$ is predicting the total noise added to the original data vector x, not just the incremental noise added in step t.

When we use stochastic gradient descent, we evaluate the gradient vector of the loss function with respect to the network parameters for a randomly selected data point x from the training set. Also, for each such data point we randomly select a step t along the Markov chain, rather than evaluate the error for every term in the summation over t in (20.40). These gradients are accumulated over mini-batches of data samples and then used to update the weights.

Also note that this loss function automatically builds in a form of data augmentation, because every time a particular training sample x is used it is combined with a fresh sample $\epsilon_{t}$ of noise. All the above relates to a single data point x from the training set. The corresponding computation of the gradient is shown in Algorithm 20.1.

## 20.2.5 Generating new samples

Once the network has been trained we can generate new samples in the data space by first sampling from the Gaussian distribution $p(\mathbf{z}_{T})$ and then denoising successively through each step of the Markov chain. Given a denoised sample $\mathbf{z}_{t}$ at step t, we generate a sample $\mathbf{z}_{t - 1}$ in three steps. First we evaluate the output of the neural network given by $\mathbf{g}(\mathbf{z}_{t}, \mathbf{w}, t)$ . From this we evaluate $\mu(\mathbf{z}_{t}, \mathbf{w}, t)$ using (20.36).

Algorithm 20.1: Training a denoising diffusion probabilistic model   
Input: Training data $\mathcal{D} = \{\mathbf{x}_{n}\}$   
Noise schedule $\{\beta_{1},..., \beta_{T}\}$   
Output: Network parameters w   
for $t \in \{1, \ldots, T\}$ do   
$\begin{array}{r}{\alpha_{t} \prod_{\tau = 1}^{t}(1 - \beta_{\tau}) \ / /} \end{array}$ Calculate alphas from betas   
end for   
repeat   
$\mathbf{x} \sim \mathcal{D} \mathbf{\Omega} / /$ Sample a data point   
$t \sim \left\{ 1 , \dots , T \right\} \ / $ Sample a point along the Markov chain   
$\epsilon \sim \mathcal{N}(\epsilon | \mathbf{0}, \mathbf{I})$ // Sample a noise vector   
$\mathbf{z}_{t} \gets \sqrt{\alpha_{t}} \mathbf{x} + \sqrt{1 - \alpha_{t}} \epsilon$ // Evaluate noisy latent variable   
${\mathcal L}({\bf w}) \gets \|{\bf g}({\bf z}_{t},{\bf w}, t) - \epsilon \|^{2} / /$ Compute loss term   
Take optimizer step   
until converged   
return w

Finally we generate a sample $\mathbf{z}_{t - 1}$ from $p(\mathbf{z}_{t - 1} \vert \mathbf{z}_{t}, \mathbf{w}) = \mathcal{N}(\mathbf{z}_{t - 1} \vert \pmb{\mu}(\mathbf{z}_{t}, \mathbf{w}, t), \beta_{t} \mathbf{I})$ by adding noise scaled by the variance so that

$$
\mathbf{z}_{t - 1} = \mu(\mathbf{z}_{t}, \mathbf{w}, t) + \sqrt{\beta_{t}} \epsilon\tag{20.41}
$$

where $\epsilon \sim \mathcal{N}(\epsilon | \mathbf{0}, \mathbf{I})$ . Note that the network $\mathbf{g}(\cdot, \cdot, \cdot)$ predicts the total noise added to the original data vector x to obtain $\mathbf{z}_{t}$ , but in the sampling step, we subtract off only a fraction $\beta_{t} / \sqrt{1 - \alpha_{t}}$ of this noise from $\mathbf{z}_{t - 1}$ and then add additional noise with variance $\beta_{t}$ to generate $\mathbf{z}_{t - 1}$ . At the final step when we calculate a synthetic data sample x, we do not add additional noise since we are aiming to generate a noise-free output. The sampling procedure is summarized in Algorithm 20.2.

The main drawback of diffusion models for generating data is that they require multiple sequential inference passes through the trained network, which can be computationally expensive. One way to speed up the sampling process is first to convert the denoising process to a differential equation over continuous time and then to use alternative efficient discretization methods to solve the equation efficiently.

We have assumed in this chapter that the data and latent variables are continuous and that we can therefore use Gaussian noise models. Diffusion models can also be defined for discrete spaces (Austin et al., 2021), for example, to generate new candidate drug molecules in which part of the generation process involves choosing atom types from a subset of chemical elements.

We have seen that diffusion models can be computationally intensive because

## Algorithm 20.2: Sampling from a denoising diffusion probabilistic model

$$
\mathbf{g}(\mathbf{z}, \mathbf{w}, t)
$$

$$
\{\beta_{1}, \dots, \beta_{T}\}
$$

${\bf z}_{T} \sim \mathcal{N}({\bf z} |{\bf 0},{\bf I})$ // Sample from final latent space   
for $t \in T, \ldots, 2$ do   
$\begin{array}{r}{\alpha_{t} \prod_{\tau = 1}^{t}(1 - \beta_{\tau})} \end{array}$ // Calculate alpha   
$/ /$ Evaluate network output   
$\begin{array}{r}{\mu({\bf z}_{t},{\bf w}, t) \frac{1}{\sqrt{1 - \beta_{t}}} \{{\bf z}_{t} - \frac{\beta_{t}}{\sqrt{1 - \alpha_{t}}}{\bf g}({\bf z}_{t},{\bf w}, t)\}} \end{array}$   
$\epsilon \sim \mathcal{N}(\epsilon \vert \mathbf{0}, \mathbf{I}) ~ / /$ Sample a noise vector   
$\mathbf{z}_{t - 1} \gets \mu(\mathbf{z}_{t}, \mathbf{w}, t) + \sqrt{\beta_{t}} \epsilon \mathbf{\delta} / \dt$ Add scaled noise   
end for   
$\begin{array}{r}{\mathbf{x} = \frac{1}{\sqrt{1 - \beta_{1}}} \left\{\mathbf{z}_{1} - \frac{\beta_{1}}{\sqrt{1 - \alpha_{1}}} \mathbf{g}(\mathbf{z}_{1}, \mathbf{w}, t) \right\}} \end{array}$ // Final denoising step   
return x

they sequentially reverse a noise process that can have hundreds or thousands of steps. Song, Meng, and Ermon (2020) introduced a related technique called $de \mathrm{-}$ noising diffusion implicit models that relax the Markovian assumption on the noise process while retaining the same objective function for training. This thereby allows one or two orders of magnitude speed-up during sampling without degrading the quality of the generated samples.

## 20.3. Score Matching

The denoising diffusion models discussed so far in this chapter are closely related to another class of deep generative models that were developed relatively independently and which are based on score matching (Hyvarinen, 2005; Song and Ermon, 2019).¨ These make use of the score function or Stein score, which is defined as the gradient of the log likelihood with respect to the data vector x and is given by

$$
\begin{array}{r}{{\bf s}({\bf x}) = \nabla_{\bf x} \ln p({\bf x}).} \end{array}\tag{20.42}
$$

Here it is important to emphasize that the gradient is with respect to the data vector, not with respect to any parameter vector. Note that $\mathbf{s}(\mathbf{x})$ is a vector-valued function of the same dimensionality as x and that each element $s_{i}({\bf x}) = \partial \ln p({\bf x}) / \partial x_{i}$ is associated with a corresponding element $x_{i}$ of $\mathbf{x}.$ For example, if x is an image then $\mathbf{s}(\mathbf{x})$ can also be represented as an image of the same dimensions with corresponding

Illustration of the score function, showing a distribution in two dimensions comprising a mixture of Gaussians represented as a heat map and the corresponding score function defined by (20.42) plotted as vectors on a regular grid of <sup>x</sup>- values.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/80b7f2349d38fbef391bcfec87a4115f2c5101d5c49807bb750669b0b47b0720.jpg)

pixels. Figure 20.5 shows an example of a probability density in two dimensions, along with the corresponding score function.

To see why the score function is useful, consider two functions $q(\mathbf{x})$ and $p(\mathbf{x})$ that have the property that their scores are equal, so that $\nabla_{\mathbf x}$ ln $q(\mathbf{x}) = \nabla_{\mathbf{x}}$ ln $p(\mathbf{x})$ for all values of x. If we integrate both sides of the equation with respect to x and take exponentials, we obtain $q(\mathbf{x}) = Kp(\mathbf{x})$ where $K$ is a constant independent of x. So if we are able to learn a model $\mathbf{s}(\mathbf{x}, \mathbf{w})$ of the score function then we have modelled the original data density, up to a multiplicative constant.

## 20.3.1 Score loss function

To train such a model we need to define a loss function that aims to match the model score function $\mathbf{s}(\mathbf{x}, \mathbf{w})$ to the score function $\nabla_{\mathbf x}$ ln $p(\mathbf{x})$ of the distribution $p(\mathbf{x})$ that generated the data. An example of such a loss function is the expected squared error between the model score and the true score, given by

$$
J(\mathbf{w}) = \frac{1}{2} \int \left\| \mathbf{s}(\mathbf{x}, \mathbf{w}) - \nabla_{\mathbf{x}} \ln p(\mathbf{x}) \right\|^{2} p(\mathbf{x}) d \mathbf{x}.\tag{20.43}
$$

As we saw in the discussion of energy-based models, the score function does not require the associated probability density to be normalized, because the normalization constant is removed by the gradient operator, and so there is considerable flexibility in the choice of model. There are broadly two ways to represent the score function $\mathbf{s}(\mathbf{x}, \mathbf{w})$ using a deep neural network. Each element $s_{i}$ of s corresponds to one of the elements $x_{i}$ of $\mathbf{x},$ so the first approach is to have a network with the same number of outputs as inputs. However, the score function is defined to be the gradient of a scalar function (the log probability density), which is a more restricted class of functions. So an alternative approach is to have a network with a single output $\phi(\mathbf{x})$

and then to compute $\nabla_{\mathbf x} \phi(\mathbf x)$ using automatic differentiation. This second approach, however, requires two backpropagation steps and is therefore computationally more expensive. For this reason, most applications simply adopt the first approach.

## 20.3.2 Modified score loss

One problem with the loss function (20.43) is that we cannot minimize it directly because we do not know the true data score $\nabla_{\mathbf{x}} \ln p(\mathbf{x})$ . All we have is the finite data set $\mathcal{D} =({\bf x}_{1}, \ldots,{\bf x}_{N})$ from which we can construct an empirical distribution:

$$
p_{\mathcal{D}}(\mathbf{x}) = \frac{1}{N} \sum_{n = 1}^{N} \delta(\mathbf{x} - \mathbf{x}_{n}).\tag{20.44}
$$

Here $\delta(\mathbf{x})$ is the Dirac delta function, which can be thought of informally as an infinitely tall ‘spike’ at $\mathbf{x} = \mathbf{0}$ with the properties

$$
\delta({\bf x}) = 0, \quad{\bf x} \neq{\bf 0}\tag{20.45}
$$

$$
\int \delta(\mathbf{x}) d \mathbf{x} = 1.\tag{20.46}
$$

Since (20.44) is not a differentiable function of x, we cannot compute its score function. We can address this by introducing a noise model to ‘smear out’ the data points and give a smooth, differentiable representation of the density. This is known as a Parzen estimator or kernel density estimator and is defined by

$$
q_{\sigma}(\mathbf{z}) = \int q(\mathbf{z} | \mathbf{x}, \sigma) p(\mathbf{x}) d \mathbf{x}\tag{20.47}
$$

where $q(\mathbf{z} | \mathbf{x}, \sigma)$ is the noise kernel. A common choice of kernel is the Gaussian

$$
q(\mathbf{z} | \mathbf{x}, \sigma) = \mathcal{N}(\mathbf{z} | \mathbf{x}, \sigma^{2} \mathbf{I}).\tag{20.48}
$$

Instead of minimizing the loss function (20.43), we then use the corresponding loss with respect to the smoothed Parzen density in the form

$$
J(\mathbf{w}) = \frac{1}{2} \int \left.\left.\mathbf{s}(\mathbf{z}, \mathbf{w}) - \nabla_{\mathbf{z}} \ln q_{\sigma}(\mathbf{z}) \right.\right.^{2} q_{\sigma}(\mathbf{z}) d \mathbf{z}.\tag{20.49}
$$

A key result is that by substituting (20.47) into (20.49) we can rewrite this loss function in an equivalent form given by (Vincent, 2011)

$$
J(\mathbf{w}) = \frac{1}{2} \int \int \| \mathbf{s}(\mathbf{z}, \mathbf{w}) - \nabla_{\mathbf{z}} \ln q(\mathbf{z} | \mathbf{x}, \sigma) \|^{2} q(\mathbf{z} | \mathbf{x}, \sigma) p(\mathbf{x}) \mathrm{{d}} \mathbf{z} \mathrm{{d}} \mathbf{x} + \mathrm{{const}}.\tag{20.50}
$$

If we substitute for $p(\mathbf{x})$ using the empirical density (20.44), we obtain

$$
J(\mathbf{w}) = \frac{1}{2N} \sum_{n = 1}^{N} \int \left\| \mathbf{s}(\mathbf{z}, \mathbf{w}) - \nabla_{\mathbf{z}} \ln q(\mathbf{z} | \mathbf{x}_{n}, \sigma) \right\|^{2} q(\mathbf{z} | \mathbf{x}_{n}, \sigma) d \mathbf{z} + \mathrm{const}.\tag{20.51}
$$

Examples of sampling trajectories obtained using Langevin dynamics defined by (14.61) for the distribution shown in Figure 20.5, showing three trajectories all starting at the centre of the plot.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/14bf34b4646d41a56f09237e4e6adb4b093ef89129322ad6e3fa07a040bfc3a5.jpg)

For the Gaussian Parzen kernel (20.48), the score function becomes

$$
\nabla_{\mathbf{z}} \ln q(\mathbf{z} | \mathbf{x}, \sigma) = - \frac{1}{\sigma} \epsilon\tag{20.52}
$$

where $\boldsymbol{\epsilon} = \mathbf{z} - \mathbf{x}$ is drawn from $\mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I})$ . If we consider the specific noise model (20.6) then we obtain

$$
\nabla_{\mathbf{z}} \ln q(\mathbf{z} | \mathbf{x}, \sigma) = - \frac{1}{\sqrt{1 - \alpha_{t}}} \epsilon.\tag{20.53}
$$

We therefore see that the score loss (20.50) measures the difference between the neural network prediction and the noise $\epsilon$. Therefore, this loss function has the same minimum as the form (20.37) used in the denoising diffusion model, with the score function ${\bf s}({\bf z},{\bf w})$ playing the same role as the noise prediction network ${\bf g}({\bf z},{\bf w})$ up to a constant scaling $- 1 / \sqrt{1 - \alpha_{t}}$ (Song and Ermon, 2019). Minimizing (20.50) is known as denoising score matching, and we see the close connection to denoising diffusion models. There remains the question of how to choose the noise variance $\sigma^{2}$ , and we will return to this shortly.

Having trained a score-based model we then need to draw new samples. Langevin dynamics is well-suited to score-based models because it is based on the score function and therefore does not require a normalized probability distribution, and is illustrated in Figure 20.6.

## 20.3.3 Noise variance

We have seen how to learn the score function from a set of training data and how to generate new samples from the learned distribution using Langevin sampling. However, we can identify three potential problems with this approach (Song and

Ermon, 2019; Luo, 2022). First, if the data distribution lies on a manifold of lower dimensionality than the data space, the probability density will be zero at points off the manifold and here the score function is undefined since ln $p(\mathbf{x})$ is undefined. Second, in regions of low data density, the estimate of the score function may be inaccurate since the loss function (20.43) is weighted by the density. An inaccurate score function can lead to poor trajectories when using Langevin sampling. Third, even with an accurate model of the score function, the Langevin procedure may not sample correctly if the data distribution comprises a mixture of disjoint distributions.

All three problems can be addressed by choosing a sufficiently large value for the noise variance $\sigma^{2}$ used in the kernel function (20.48), because this smears out the data distribution. However, too large a variance will introduce a significant distortion of the original distribution and this itself introduces inaccuracies in the modelling of the score function. This trade-off can be addressed by considering a sequence of variance values $\sigma_{1}^{2} < \sigma_{2}^{2} <...< \sigma_{T}^{2}$ (Song and Ermon, 2019), in which $\sigma_{1}^{2}$ is sufficiently small that the data distribution is accurately represented whereas $\sigma_{T}^{2}$ is sufficiently large that the aforementioned problems are avoided. The score network is then modified to take the variance as an additional input $\mathbf{s}(\mathbf{x}, \mathbf{w}, \sigma^{2})$ and is trained by using a loss function that is a weighted sum of the loss functions of the form (20.51) in which each term represents the error between the associated network and the corresponding perturbed data set. For a data vector ${\bf x}_{n}$ , the loss function then takes the form

$$
\frac{1}{2} \sum_{i = 1}^{L} \lambda(i) \int \left\| \mathbf{s}(\mathbf{z}, \mathbf{w}, \sigma_{i}^{2}) - \nabla_{\mathbf{z}} \ln q(\mathbf{z} | \mathbf{x}_{n}, \sigma_{i}) \right\|^{2} q(\mathbf{z} | \mathbf{x}_{n}, \sigma_{i}) d \mathbf{z}\tag{20.54}
$$

where λ(i) are weighting coefficients. We see that this training procedure precisely mirrors that used to train hierarchical denoising networks.

Once trained, samples can be generated by running a few steps of Langevin sampling from each of the models for $i = L, L - 1, \ldots, 2.$ 1 in turn. This technique is called annealed Langevin dynamics, and is analogous to Algorithm 20.2 used to sample from denoising diffusion models.

## 20.3.4 Stochastic differential equations

We have seen that it is helpful to use a large number of steps, often several thousand, when constructing the noise process for a diffusion model. It is therefore natural to ask what happens if we consider the limit of an infinite number of steps, much as we did for infinitely deep neural networks when we introduced neural differential equations. In taking such a limit, we need to ensure that the noise variance $\beta_{t}$ at each step becomes smaller in keeping with the step size. This leads to a formulation of diffusion models for continuous time as stochastic differential equations or SDEs (Song et al., 2020). Both denoising diffusion probabilistic models and score matching models can then be viewed as a discretization of a continuous-time SDE.

We can write a general SDE as an infinitesimal update to the vector z in the form

$$
d \mathbf{z} = \underbrace{\mathbf{f}(\mathbf{z}, t) d t}_{\mathrm{drift}} + \underbrace{g(t) d \mathbf{v}}_{\mathrm{diffusion}}\tag{20.55}
$$

where the drift term is deterministic, as in an ODE, but the diffusion term is stochastic, for example given by infinitesimal Gaussian steps. Here the parameter t is often called ‘time’ by analogy with physical systems. The forward noise process (20.3) for a diffusion model can be written as an SDE of the form (20.55) by taking the continuous-time limit.

For the SDE (20.55), there is a corresponding reverse SDE (Song et al., 2020) given by

$$
d \mathbf{z} = \{\mathbf{f}(\mathbf{z}, t) - g^{2}(t) \nabla_{\mathbf{z}} \ln p(\mathbf{z})\} ~ d t + g(t) d \mathbf{v}\tag{20.56}
$$

where we recognize $\nabla_{\mathbf{z}}$ ln $p(\mathbf{z})$ as the score function. The SDE given by (20.55) is to be solved in reverse from $t = T$ to $t = 0$

To solve an SDE numerically, we need to discretize the time variable. The simplest approach is to use fixed, equally spaced time steps, which is known as the Euler–Maruyama solver. For the reverse SDE, we then recover a form of the Langevin equation. However, more sophisticated solvers can be employed that use more flexible forms of discretization (Kloeden and Platen, 2013).

For all diffusion processes governed by an SDE, there exists a corresponding deterministic process described by an ODE whose trajectories have the same marginal probability densities $p(\mathbf{z} | t)$ as the SDE (Song et al., 2020). For an SDE of the form (20.56), the corresponding ODE is given by

$$
\frac{d \mathbf{z}}{d t} = \mathbf{f}(\mathbf{z}, t) - \frac{1}{2} g^{2}(t) \nabla_{\mathbf{z}} \ln p(\mathbf{z}).\tag{20.57}
$$

The ODE formulation allows the use of efficient adaptive-step solvers to reduce the number of function evaluations dramatically. Moreover, it allows probabilistic diffusion models to be related to normalizing flow models, from which the changeof-variables formula (18.1) can be used to provide an exact evaluation of the log likelihood.

## 20.4. Guided Diffusion

So far, we have considered diffusion models as a way to represent the unconditional density $p(\mathbf{x})$ learned from a set of training examples $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ drawn independently from $p(\mathbf{x})$ . Once the model has been trained, we can generate new samples from this distribution. We have already seen an example of unconditional sampling from a deep generative model for face images in Figure 1.3, in that case from a GAN model.

In many applications, however, we want to sample from a conditional distribution $p(\mathbf{x} | \mathbf{c})$ where the conditioning variable c could, for example, be a class label or a textual description of the desired content for an image. This also forms the basis for applications such as image super-resolution, image inpainting, video generation, and many others. The simplest approach to achieving this would be to treat c as an additional input into the denoising neural network $\mathbf{g}(\mathbf{z}, \mathbf{w}, t, \mathbf{c})$ and then to train the network using matched pairs $\{\mathbf{x}_{n}, \mathbf{c}_{n}\}$ . The main limitation of this approach is that the network can give insufficient weight to, or even ignore, the conditioning variables, so we need a way to control how much weight is given to the conditioning information and to trade this off against sample diversity. This additional pressure to match the conditioning information is called guidance. There are two main approaches to guidance depending on whether or not a separate classifier model is used.

## 20.4.1 Classifier guidance

Suppose that a trained classifier $p(\mathbf{c} | \mathbf{x})$ is available, and consider a diffusion model from the perspective of the score function. Using Bayes’ theorem we can write the score function for the conditional diffusion model in the form

$$
\begin{array}{l}{\nabla_{\mathbf x} \ln p(\mathbf x | \mathbf c) = \nabla_{\mathbf x} \ln \left\{\displaystyle \frac{p(\mathbf c | \mathbf x) p(\mathbf x)}{p(\mathbf c)} \right\} \qquad} \\{= \nabla_{\mathbf x} \ln p(\mathbf x) + \nabla_{\mathbf x} \ln p(\mathbf c | \mathbf x)} \end{array}\tag{20.58}
$$

where we have used $\nabla_{\mathbf{x}} \ln p(\mathbf{c}) = 0$ since $p(\mathbf{c})$ is independent of $\mathbf{x}.$ The first term on the right-hand side of (20.58) is the usual unconditional score function, whereas the second term pushes the denoising process towards the direction that maximizes the probability of the given label c under the classifier model (Dhariwal and Nichol, 2021). The influence of the classifier can be controlled by introducing a hyperparameter λ, called the guidance scale, which controls the weight given to the classifier gradient. The score function used for sampling then becomes

$$
\operatorname{score}(\mathbf{x}, \mathbf{c}, \lambda) = \nabla_{\mathbf{x}} \ln p(\mathbf{x}) + \lambda \nabla_{\mathbf{x}} \ln p(\mathbf{c} | \mathbf{x}).\tag{20.59}
$$

$\mathrm{H} \lambda = 0$ we recover the original unconditional diffusion model, whereas if $\lambda = 1$ we obtain the score corresponding to the conditional distribution $p(\mathbf{x} | \mathbf{c})$ . For $\lambda > 1$ the model is strongly encouraged to respect the conditioning label, and values of $\lambda \gg 1$ may be used, for example $\lambda = 10$ . However, this comes at the expense of diversity in the samples as the model prefers ‘easy’ examples that the classifier is able to classify correctly.

One problem with the classifier-based approach to guidance is that a separate classifier must be trained. Furthermore, this classifier needs to be able to classify examples with varying degrees of noise, whereas standard classifiers are trained on clean examples. We therefore turn to an alternative approach that avoids the use of a separate classifier.

## 20.4.2 Classifier-free guidance

If we use (20.58) to replace $\nabla_{\mathbf x}$ ln $p(\mathbf{c} | \mathbf{x})$ in (20.59), we can write the score function in the form

$$
\mathrm{score}(\mathbf{x}, \mathbf{c}, \lambda) = \lambda \nabla_{\mathbf{x}} \ln p(\mathbf{x} | \mathbf{c}) +(1 - \lambda) \nabla_{\mathbf{x}} \ln p(\mathbf{x}),\tag{20.60}
$$

which for $0 < \lambda < 1$ represents a convex combination of the conditional log density ln $p(\mathbf{x} | \mathbf{c})$ and the unconditional log density ln $p(\mathbf{x})$ . For $\lambda > 1$ the contribution from the unconditional score becomes negative, meaning the model actively reduces the probability of generating samples that ignore the conditioning information in favour of samples that do.

Furthermore, we can avoid training separate networks to model $p(\mathbf{x} | \mathbf{c})$ and $p(\mathbf{x})$ by training a single conditional model in which the conditioning variable c is set to a null value, for example $\mathbf c = \mathbf 0$ , with some probability during training, typically around $10 \mathrm{-} 20 \%$ . Then $p(\mathbf{x})$ is represented by $p(\mathbf{x} | \mathbf{c} = \mathbf{0})$ . This is somewhat analogous to dropout in which the conditioning inputs are collectively set to zero for a random subset of training vectors.

Once trained, the score function (20.60) is then used to encourage a strong weighting of the conditional information. In practice, classifier-free guidance gives much higher quality results than classifier guidance (Nichol et al., 2021; Saharia et al., 2022). The reason is that a classifier $p(\mathbf{c} | \mathbf{x})$ can ignore most of the input vector x as long as it makes a good prediction of c whereas classifier-free guidance is based on the conditional density $p(\mathbf{x} | \mathbf{c})$ , which must assign a high probability to all aspects of x.

Text-guided diffusion models can leverage techniques from large language models to allow the conditioning input to be a general text sequence, known as a prompt, and not simply a selection from a predefined set of class labels. This allows the text input to influence the denoising process in two ways, first by concatenating the internal representation from a transformer-based language model with the input to the denoising network and second by allowing cross-attention layers within the denoising network to attend to the text token sequence. Classifier-free guidance, conditioned on a text prompt, is illustrated in Figure 20.7.

Another application for conditional diffusion models is image super-resolution in which a low-resolution image is transformed into a corresponding high-resolution image. This is intrinsically an inverse problem, and multiple high-resolution images will be consistent with a given low-resolution image. Super-resolution can be achieved by denoising a high-resolution sample from a Gaussian using the lowresolution image as a conditioning variable (Saharia, Ho, et al., 2021). Examples of this method are shown in Figure 20.8. Such models can be cascaded to achieve very high resolution (Ho et al., 2021), for example going from $64 \times 64$ to $256 \times 256$ and then from $256 \times 256$ to $1024 \times 1024$ . Each stage is typically represented by a U-net architecture, with each U-net conditioned on the final denoised output of the previous one.

This type of cascade can also be used with image-generation diffusion models, in which the image denoising is performed at a lower resolution and the result is subsequently up-sampled using a separate network (which may also take a text prompt as input) to give a final high-resolution output (Nichol et al., 2021; Saharia et al., 2022). This can significantly reduce the computational cost compared to working directly in a high-dimensional space since the denoising process may involve hundreds of passes through the denoising network. Note that these approaches still work within the image space directly but at lower resolution.

A different approach to addressing the high computational cost of applying diffusion models directly in the space of high-resolution images is called latent diffu-

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/471d7ef9b75669420db430014bb552446b451e347d8bb60b044a7af01fabc6de.jpg)

![Figure 20.7](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/2a643e28e201034082242c6726ca1dc706909bfa4331e2102b458c1238aafee6.jpg)  
Figure 20.7 Illustration of classifier-free guidance of diffusion models, generated from a model called GLIDE using the conditioning text A stained glass window of a panda eating bamboo. Examples on the left were generated with λ = 0 (no guidance, just the plain conditional model) whereas examples on the right were generated with λ = 3. [From Nichol et al. (2021) with permission.]

Section 19.1

sion models (Rombach et al., 2021). Here an autoencoder is first trained on noisefree images to obtain a lower-dimensional representation of the images and is then fixed. A U-net architecture is then trained to perform the denoising within the lowerdimensional space, which itself is not directly interpretable as an image. Finally, the denoised representation is mapped into the high-resolution image space using the output half of the fixed autoencoder network. This approach makes more efficient use of the low-dimensional space, which can then focus on image semantics, leaving the decoder to create a corresponding sharp, high-resolution image from the denoised low-dimensional representation.

There are many other applications of conditional image generation including inpainting, un-cropping, restoration, image morphing, style transfer, colourization, de-blurring, and video generation (Yang, Srivastava, and Mandt, 2022). An example of inpainting is shown in Figure 20.9.

Figure 20.8 Two examples of lowresolution images along with associated samples of corresponding highresolution images generated by a diffusion model. The top row shows a $16 \times 16$ input image and the corresponding $128 \times 128$ output image along with the original image from which the input image was generated. The bottom row shows a 64 <sup>×</sup> 64 input image with a 256 <sup>×</sup> 256 output image, again with the original image for comparison. [From Saharia, Ho, et al. (2021) with permission.]  
Figure 20.9 Example of inpainting showing the original image on the left, an image with sections removed in the middle, and the image with inpainting on the right. [From Saharia, Chan, Chang, et al. (2021) with permission.]  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/670a0b970d5dc04c644abfb61a79ef811a9d8efb1fe0c68f185590af1e38e6ea.jpg)

## Exercises 20.1

(?) Using (20.3) write down expressions for the mean and covariance of $\mathbf{z}_{t}$ in terms of the mean and covariance of $\mathbf{z}_{t - 1}$ . Hence, show that for $0 < \beta_{t} < 1$ the mean of the distribution of $\mathbf{z}_{t}$ is closer to zero than the mean of $\mathbf{z}_{t - 1}$ and that the covariance of $\mathbf{z}_{t}$ is closer to the unit matrix I than the covariance of $\mathbf{z}_{t - 1}$

20.2 (?) Show that the transformation (20.1) can be written in the equivalent form (20.2).

20.3 (★★★) In this exercise we use proof by induction to show that the marginal distribution of $\mathbf{x}_{t}$ for the forward process of the diffusion model, as defined by (20.4), is given by $( 2 0 . 6 ) $ where $\alpha_{t}$ is defined by (20.7). First verify that (20.6) holds when $t = 1$ . Now assume that (20.6) is true for some particular value of t and derive the corresponding result for the value $t + 1$ . To do this, it is easiest to write the forward process using the representation (20.3) and to make use of the result (3.212), which shows that the sum of two independent Gaussian random variables is itself a Gaussian in which the means and covariances are additive.

20.4 (?) By using the result (20.6), where $\alpha_{t}$ is defined by (20.7), show that in the limit $T \to \infty$ we obtain (20.9).

20.5 (? ?) Consider two independent random variables a and b along with a fixed scalar λ. Show that

$$
\mathrm{cov}[\mathbf{a} + \mathbf{b}] = \mathrm{cov}[\mathbf{a}] + \mathrm{cov}[\mathbf{b}]\tag{20.61}
$$

$$
\operatorname{cov}[\lambda \mathbf{a}] = \lambda^{2} \operatorname{cov}[\mathbf{a}].\tag{20.62}
$$

Use these results to show that if the distribution of $\mathbf{z}_{t - 1}$ has zero mean and unit covariance, then the distribution of $\mathbf{z}_{t}$ , defined by (20.3), will also have zero mean and unit covariance, irrespective of the value of $\beta_{t}$

20.6 (★★★) In this exercise we will use the technique of completing the square to derive the result (20.15) starting from Bayes’ theorem (20.13). First note that the two terms in the numerator on the right-hand side of (20.13), given by (20.4) and (20.6), both take the form of exponentials of quadratic functions of $\mathbf{z}_{t - 1}$ . The required distribution is therefore a Gaussian, and so we need only to find its mean and covariance. To do this, consider only the terms in the exponentials that depend on $\mathbf{z}_{t - 1}$ and note that the product of two exponentials is the exponential of the sum of the two exponents. Gather together all the terms that are quadratic in $\mathbf{z}_{t - 1}$ as well as those that are linear in $\mathbf{z}_{t - 1}$ and then rearrange them in the form $(\mathbf{z}_{t - 1} - \mathbf{m}_{t})^{\mathrm{T}} \mathbf{S}_{t}^{- 1}(\mathbf{z}_{t - 1} - \mathbf{m}_{t})$ . Then, by inspection, find expressions for $\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t})$ and $\mathbf{S}_{t}$ . Note that additive terms that are independent of $\mathbf{z}_{t - 1}$ can be ignored.

20.7 (★★★) In this exercise we show that the reverse of the conditional distribution $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ for the forward noise process in a diffusion model can be approximated by a Gaussian when the noise variance is small. Consider the inverse conditional distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ given by Bayes’ theorem in the form (20.11) where the forward distribution $q(\mathbf{z}_{t} | \mathbf{z}_{t - 1})$ is given by (20.4). By taking the logarithm of both sides of (20.11) and then making a Taylor expansion of $q(\mathbf{z}_{t - 1})$ centred on the value $\mathbf{z}_{t},$ , show that, for small values of the noise variance $\beta_{t}$ , the distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t})$ is approximately a Gaussian with mean $\mathbf{z}_{t}$ and covariance $\beta_{t} \mathbf{I}.$ Find expressions for the lowest-order corrections to the mean and to the covariance as expansions in powers of $\beta_{t}$

20.8 (? ?) By substituting the product rule of probability in the form (20.24) into the definition (20.22) of the ELBO for the diffusion model and making use of the definition (20.23) of the Kullback–Leibler divergence, verify that the log likelihood function can be written as the sum of a lower bound and a Kullback–Leibler divergence in the form (20.21).

20.9 (? ?) Verify that the ELBO for the diffusion model given by (20.31) can be written in the form (20.32) where the Kullback–Leibler divergence is defined by (20.23).

20.10 (? ?) When we derived the ELBO for the diffusion model given by (20.32), we omitted the first and third terms in (20.26) because they are independent of w. Similarly we omitted the second term in the right-hand side of (20.30) because this is also independent of w. Show that if all of these omitted terms are retained they lead to an additional term in the ELBO $\mathcal{L}(\mathbf{x})$ given by

$$
\begin{array}{r}{\mathrm{KL} \left(q(\mathbf{z}_{T} \vert \mathbf{x}) \vert \vert p(\mathbf{z}_{T}) \right).} \end{array}\tag{20.63}
$$

Note that the noise process is constructed in such a way that the distribution $q(\mathbf{z}_{T} | \mathbf{x})$ is equal to the Gaussian $\mathcal{N}(\mathbf{x} | \mathbf{0}, \mathbf{I})$ . Similarly, the distribution $p(\mathbf{z}_{T})$ is defined to be equal to $\mathcal{N}(\mathbf{x} | \mathbf{0}, \mathbf{I})$ , and hence the two distributions in (20.63) are equal and so the Kullback–Leibler divergence vanishes.

20.11 (? ?) By making use of (20.15) for the distribution $q(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{x})$ and (20.18) for the distribution $p(\mathbf{z}_{t - 1} | \mathbf{z}_{t}, \mathbf{w})$ , show that the Kullback–Leibler divergence appearing in the consistency terms in (20.32) is given by (20.33).

20.12 (? ?) By substituting (20.34) into (20.16) rewrite the mean $\mathbf{m}_{t}(\mathbf{x}, \mathbf{z}_{t})$ in terms of the original data vector x and the noise $\epsilon$ in the form (20.35), where $\alpha_{t}$ is defined by (20.7).

20.13 (? ?) Show that the reconstruction term (20.38) in the ELBO for diffusion models can be written in the form (20.39). To do this, substitute for $\mu(\mathbf{z}_{1}, \mathbf{w}, 1)$ using (20.36) and substitute for x using (20.1), and then make use of $\alpha_{1} =(1 - \beta_{1})$ , which follows from (20.7).

20.14 (?) The score function is defined by $\mathbf{s}(\mathbf{x}) = \nabla_{\mathbf{x}} p(\mathbf{x} | \mathbf{w})$ and is therefore a vector of the same dimensionality as the input vector x. Consider a matrix whose elements are given by

$$
M_{ij} = \frac{\partial s_{i}}{\partial x_{j}} - \frac{\partial s_{j}}{\partial x_{i}}.\tag{20.64}
$$

Show that if the score function is defined by taking the gradient $\mathbf{s} = \nabla_{\mathbf{x}} \phi(\mathbf{x})$ of the output of a neural network with a single output variable $\phi(\mathbf{x})$ , then all the matrix elements $M_{ij} = 0$ for all pairs $i, j$ . Note that if the score function $\mathbf{\boldsymbol{s}}(\mathbf{\boldsymbol{x}}) = \nabla_{\mathbf{\boldsymbol{x}}} p(\mathbf{\boldsymbol{x}} | \mathbf{\boldsymbol{w}})$ is instead represented directly by a deep neural network with the same number of outputs as inputs, then only the diagonal matrix elements $M_{ii} = 0$ , and so the output of the network does not in general correspond to the gradient of any scalar function.

20.15 (? ?) Consider a deep neural network representation $\mathbf{s}(\mathbf{x}, \mathbf{w})$ for the score function defined by (20.42), where x and s have dimensionality D. Compare the computational complexity of evaluating the score for a network with D outputs that represents the score function directly with one that computes a single scalar function $\phi(\mathbf{x}, \mathbf{w})$ in which the score function is computed indirectly through automatic differentiation. Show that the latter approach is typically more computationally expensive.

20.16 (★★★) We cannot minimize the score function (20.43) directly because we do not know the functional form of the true data density $p(\mathbf{x})$ , and therefore we cannot write down an expression for the score function $\nabla_{\mathbf x}$ ln $p(\mathbf{x})$ . However, by using integration by parts (Hyvarinen, 2005), we can rewrite (20.43) in the form ¨

$$
J(\mathbf{w}) = \int \left\{\nabla \cdot \mathbf{s}(\mathbf{x}, \mathbf{w}) + \frac{1}{2} \left\| \mathbf{s}(\mathbf{x}, \mathbf{w}) \right\|^{2} \right\} p(\mathbf{x}) d \mathbf{x} + \mathrm{const}\tag{20.65}
$$

where the constant term is independent of the network parameters w, and the divergence $\nabla \cdot \mathbf{s}(\mathbf{x}, \mathbf{w})$ is defined by

$$
\nabla \cdot \mathbf{s} = \sum_{i = 1}^{D}{\frac{\partial s_{i}}{\partial x_{i}}} = \sum_{i = 1}^{D}{\frac{\partial^{2} \ln p(\mathbf{x})}{\partial x_{i}^{2}}}\tag{20.66}
$$

in which D is the dimensionality of x. Derive the result (20.65) by first expanding the square in (20.43) and noting that the term involving $\| \dot{\mathbf{s}}(\mathbf{x}, \mathbf{w}) \|^{2}$ already appears in (20.43) whereas the term involving $\| \mathbf{s}_{\mathcal{D}} \|^{2}$ can be absorbed into the additive constant, where we have defined $\mathbf{s}_{\mathcal{D}} = \nabla$ ln $p_{\mathcal{D}}(\mathbf{x})$ . Now consider the formula

$$
{\frac{d}{d x}} \left\{p(x) g(x) \right\} ={\frac{d p(x)}{d x}} g(x) + p(x){\frac{d g(x)}{d x}}\tag{20.67}
$$

for the derivative of the product of two functions. Integrate both sides of this formula with respect to x and rearrange to obtain the integration-by-parts formula:

$$
\int_{- \infty}^{\infty}{\frac{d p(x)}{d x}} g(x) d x = - \int_{- \infty}^{\infty}{\frac{d g(x)}{d x}} p(x) d x\tag{20.68}
$$

where we have assumed that $p(\infty) \ = \p(- \infty) \ = \0$ . Apply this result together with the definition $\mathbf{s}_{\mathcal{D}} = \nabla \ln p(\mathbf{x})$ to the term involving $\bar{\mathbf{s}}(\mathbf{x}, \mathbf{w})^{\mathrm{T}} \mathbf{s}_{\mathcal{D}}$ to complete the proof. Note that the evaluation of the second derivatives in (20.66) requires a separate backward propagation pass for each derivative and hence has an overall computational cost that grows quadratically with the dimensionality $D$ of the data space (Martens, Sutskever, and Swersky, 2012). This precludes the direct application of this loss function to spaces of high dimensionality, and so techniques such as sliced score matching (Song et al., 2019) have been developed to help address this inefficiency.

(? ?) In this exercise we show that the score function loss (20.50) is equivalent, up to an additive constant, to the form (20.49). To do this, first expand the square in (20.49) and by using (20.47) show that the term in $\mathbf{s}^{\mathrm{T}} \mathbf{s}$ from (20.49) is the same as the corresponding term obtained by expanding the square in (20.50). Next note that the term in $\parallel \nabla_{\mathbf z}$ ln $q \|^{2}$ in (20.49) is independent of w and likewise that the corresponding term in (20.50) is also independent of w, and so these can be viewed as additive constants in the loss function and play no role in training. Finally, consider the crossterm in (20.49). By substituting for $q(\mathbf{z})$ using (20.47), show that this is equal to the corresponding cross-term from (20.50). Hence, show that the two loss functions are equal up to an additive constant.

20.18 (?) Consider a probability distribution that consists of a mixture of two disjoint distributions (i.e., distributions with the property that when one of them is non-zero the other must be zero) of the form

$$
\begin{array}{r}{p(\mathbf{x}) = \lambda p_{A}(\mathbf{x}) +(1 - \lambda) p_{B}(\mathbf{x}).} \end{array}\tag{20.69}
$$

Show that when the score function, defined by (20.42), is evaluated for any given point x, the mixing coefficient λ does not appear. From this it follows that Langevin dynamics defined by (14.61) will not sample from the two component distributions with the correct proportions. This problem is resolved by adding noise from a broad distribution, as discussed in the text.

(? ?) For discrete steps, the forward noise process in a diffusion model is defined by (20.3). Here we take the continuous-time limit and convert this to an SDE. We first introduce a continuously-changing variance function $\beta(t)$ such that $\beta_{t} = \beta(t) \Delta t$ By making a Taylor expansion of the square root in the first term on the right-handside of (20.3), show that the infinitesimal update can be written in the form

$$
d \mathbf{z} = - \frac{1}{2} \beta(t) \mathbf{z} d t + \sqrt{\beta(t)} d \mathbf{v}.\tag{20.70}
$$

We see that this is a special case of the general SDE (20.55).

(?) By using (20.58) to replace $\nabla_{\mathbf x}$ ln $p(\mathbf{c} | \mathbf{x})$ , show that the score function in (20.59) can be written in the form (20.60).

## Appendix A. Linear Algebra

In this appendix, we gather together some useful properties and identities involving matrices and determinants. This is not intended to be an introductory tutorial, and it is assumed that the reader is already familiar with basic linear algebra. For some results, we indicate how to prove them, whereas in more complex cases we leave the interested reader to refer to standard textbooks on the subject. In all cases, we assume that inverses exist and that matrix dimensions are such that the formulae are correctly defined. A comprehensive discussion of linear algebra can be found in Golub and Van Loan (1996), and an extensive collection of matrix properties is given by Lutkepohl (1996). Matrix derivatives are discussed in Magnus and Neudecker ¨ (1999).

## A.1. Matrix Identities

A matrix A has elements $A_{ij}$ where i indexes the rows and $j$ indexes the columns. We use ${\mathbf{I}}_{N}$ to denote the $N \times N$ identity matrix (also called the unit matrix), and if there is no ambiguity over dimensionality, we simply use I. The transpose matrix ${\bf A}^{\mathrm{T}}$ has elements $(\mathbf{A}^{\mathrm{T}})_{ij} = A_{ji}$ . From the definition of a transpose, we have

$$
(\mathbf{AB})^{\mathrm{T}} = \mathbf{B}^{\mathrm{T}} \mathbf{A}^{\mathrm{T}},\tag{A.1}
$$

which can be verified by writing out the indices. The inverse of A, denoted $\mathbf{A}^{- 1}$ satisfies

$$
\mathbf{A} \mathbf{A}^{- 1} = \mathbf{A}^{- 1} \mathbf{A} = \mathbf{I}.\tag{A.2}
$$

Because $\mathbf{A} \mathbf{B} \mathbf{B}^{- 1} \mathbf{A}^{- 1} = \mathbf{I}$ , we have

$$
(\mathbf{A} \mathbf{B})^{- 1} = \mathbf{B}^{- 1} \mathbf{A}^{- 1}.\tag{A.3}
$$

Also we have

$$
\left(\mathbf{A}^{\mathrm{T}} \right)^{- 1} = \left(\mathbf{A}^{- 1} \right)^{\mathrm{T}},\tag{A.4}
$$

609

which is easily proven by taking the transpose of (A.2) and applying (A.1).

A useful identity involving matrix inverses is the following:

$$
(\mathbb{P}^{- 1} + \mathbf{B}^{\mathrm{T}} \mathbb{R}^{- 1} \mathbf{B})^{- 1} \mathbf{B}^{\mathrm{T}} \mathbb{R}^{- 1} = \mathbb{P} \mathbf{B}^{\mathrm{T}}(\mathbf{B} \mathbb{P} \mathbf{B}^{\mathrm{T}} + \mathbb{R})^{- 1},\tag{A.5}
$$

which is easily verified by right-multiplying both sides by $(\mathbf{BPB^{\mathrm{T}} + R})$ . Suppose that P has dimensionality $N \times N$ and that R has dimensionality $M \times M$ , so that B is $M \times N$ . Then if $M \ll N$ , it will be much cheaper to evaluate the right-hand side of (A.5) than the left-hand side. A special case that sometimes arises is

$$
(\mathbf{I} + \mathbf{A} \mathbf{B})^{- 1} \mathbf{A} = \mathbf{A}(\mathbf{I} + \mathbf{B} \mathbf{A})^{- 1}.\tag{A.6}
$$

Another useful identity involving inverses is the following:

$$
(\mathbf{A} + \mathbf{BD}^{- 1} \mathbf{C})^{- 1} = \mathbf{A}^{- 1} - \mathbf{A}^{- 1} \mathbf{B}(\mathbf{D} + \mathbf{CA}^{- 1} \mathbf{B})^{- 1} \mathbf{CA}^{- 1},\tag{A.7}
$$

which is known as the Woodbury identity. It can be verified by multiplying both sides by $\mathbf{\left(A + BD^{- 1} C \right)}$ . This is useful, for instance, when A is large and diagonal and hence easy to invert, and when B has many rows but few columns (and conversely for C), so that the right-hand side is much cheaper to evaluate than the left-hand side.

A set of vectors $\{\mathbf{a}_{1}, \hdots, \mathbf{a}_{N}\}$ is said to be linearly independent if the relation $\begin{array}{r}{\sum_{n} \alpha_{n} \mathbf{a}_{n} \ = \0} \end{array}$ holds only if all $\alpha_{n} \ = \0$ . This implies that none of the vectors can be expressed as a linear combination of the remainder. The rank of a matrix is the maximum number of linearly independent rows (or equivalently the maximum number of linearly independent columns).

## A.2. Traces and Determinants

Square matrices have traces and determinants. The trace $\operatorname{Tr}(\mathbf{A})$ of a matrix A is defined as the sum of the elements on the leading diagonal. By writing out the indices, we see that

$$
\operatorname{Tr}(\mathbf{A} \mathbf{B}) = \operatorname{Tr}(\mathbf{B} \mathbf{A}).\tag{A.8}
$$

By applying this formula multiple times to the product of three matrices, we see that

$$
\operatorname{Tr}(\mathbf{A} \mathbf{B} \mathbf{C}) = \operatorname{Tr}(\mathbf{C} \mathbf{A} \mathbf{B}) = \operatorname{Tr}(\mathbf{B} \mathbf{C} \mathbf{A}),\tag{A.9}
$$

which is known as the cyclic property of the trace operator. It clearly extends to the product of any number of matrices. The determinant $| \mathbf{A} |$ of an $N \times N$ matrix A is defined by

$$
| \mathbf{A} | = \sum(\pm 1) A_{1i_{1}} A_{2i_{2}} \cdot \cdot \cdot A_{Ni_{N}}\tag{A.10}
$$

in which the sum is taken over all products consisting of precisely one element from each row and one element from each column, with a coefficient +1 or 1 according to whether the permutation $i_{1} i_{2} \dots i_{N}$ is even or odd, respectively. Note that $| \mathbf{I} | = 1$

and that the determinant of a diagonal matrix is given by the product of the elements on the leading diagonal. Thus, for a $2 \times 2$ matrix, the determinant takes the form

$$
| \mathbf{A} | ={\left| \begin{array}{ll}{a_{11}} &{a_{12}} \\{a_{21}} &{a_{22}} \end{array} \right|} = a_{11} a_{22} - a_{12} a_{21}.\tag{A.11}
$$

The determinant of a product of two matrices is given by

$$
| \mathbf{AB} | = | \mathbf{A} | | \mathbf{B} |\tag{A.12}
$$

as can be shown from (A.10). Also, the determinant of an inverse matrix is given by

$$
\left| \mathbf{A}^{- 1} \right| ={\frac{1}{\left| \mathbf{A} \right|}},\tag{A.13}
$$

which can be shown by taking the determinant of (A.2) and applying (A.12).

If A and B are matrices of size $N \times M$ , then

$$
\left| \mathbf{I}_{N} + \mathbf{A} \mathbf{B}^{\mathrm{T}} \right| = \left| \mathbf{I}_{M} + \mathbf{A}^{\mathrm{T}} \mathbf{B} \right|.\tag{A.14}
$$

A useful special case is

$$
\left| \mathbf{I}_{N} + \mathbf{ab}^{\mathrm{T}} \right| = 1 + \mathbf{a}^{\mathrm{T}} \mathbf{b}\tag{A.15}
$$

where a and b are N-dimensional column vectors.

## A.3. Matrix Derivatives

Sometimes we need to consider derivatives of vectors and matrices with respect to scalars. The derivative of a vector a with respect to a scalar x is a vector whose components are given by

$$
{\bigg(}{\frac{\partial \mathbf{a}}{\partial x}}{\bigg)}_{i} ={\frac{\partial a_{i}}{\partial x}}\tag{A.16}
$$

with an analogous definition for the derivative of a matrix. Derivatives with respect to vectors and matrices can also be defined, for instance

$$
\left(\frac{\partial x}{\partial \mathbf{a}} \right)_{i} = \frac{\partial x}{\partial a_{i}}\tag{A.17}
$$

and similarly

$$
\left(\frac{\partial \mathbf{a}}{\partial \mathbf{b}} \right)_{ij} = \frac{\partial a_{i}}{\partial b_{j}}.\tag{A.18}
$$

The following is easily proven by writing out the components:

$$
\frac{\partial}{\partial \mathbf{x}} \left(\mathbf{x}^{\mathrm{T}} \mathbf{a} \right) = \frac{\partial}{\partial \mathbf{x}} \left(\mathbf{a}^{\mathrm{T}} \mathbf{x} \right) = \mathbf{a}.\tag{A.19}
$$

Similarly

$$
{\frac{\partial}{\partial x}} \left(\mathbf{A} \mathbf{B} \right) ={\frac{\partial \mathbf{A}}{\partial x}} \mathbf{B} + \mathbf{A}{\frac{\partial \mathbf{B}}{\partial x}}.\tag{A.20}
$$

The derivative of the inverse of a matrix can be expressed as

$$
{\frac{\partial}{\partial x}} \left(\mathbf{A}^{- 1} \right) = - \mathbf{A}^{- 1}{\frac{\partial \mathbf{A}}{\partial x}} \mathbf{A}^{- 1}\tag{A.21}
$$

as can be shown by differentiating the equation $\mathbf{A}^{- 1} \mathbf{A} = \mathbf{I}$ using (A.20) and then right-multiplying by $\mathbf{A}^{- 1}$ . Also

$$
{\frac{\partial}{\partial x}} \ln \left| \mathbf{A} \right| = \operatorname{Tr} \left(\mathbf{A}^{- 1}{\frac{\partial \mathbf{A}}{\partial x}} \right),\tag{A.22}
$$

which we shall prove later. If we choose x to be one of the elements of A, we have

$$
{\frac{\partial}{\partial A_{ij}}} \mathrm{Tr} \left(\mathbf{AB} \right) = B_{ji}\tag{A.23}
$$

as can be seen by writing out the matrices using index notation. We can write this result more compactly in the form

$$
{\frac{\partial}{\partial \mathbf{A}}} \mathrm{Tr} \left(\mathbf{AB} \right) = \mathbf{B}^{\mathrm{T}}.\tag{A.24}
$$

With this notation, we have the following properties:

$$
\frac{\partial}{\partial \mathbf{A}} \mathrm{Tr} \left(\mathbf{A}^{\mathrm{T}} \mathbf{B} \right) = \mathbf{B},\tag{A.25}
$$

$$
\frac{\partial}{\partial{\bf A}} \mathrm{Tr}({\bf A}) ={\bf I},\tag{A.26}
$$

$$
\begin{array}{rlr}{{\frac{\partial}{\partial{\bf A}}} \mathrm{Tr}({\bf A}{\bf B}{\bf A}^{\mathrm{T}})} &{=} &{{\bf A}({\bf B} +{\bf B}^{\mathrm{T}}),} \end{array}\tag{A.27}
$$

which can again be proven by writing out the matrix indices. We also have

$$
\frac{\partial}{\partial{\bf A}} \ln |{\bf A} | = \left({\bf A}^{- 1} \right)^{\mathrm{T}},\tag{A.28}
$$

which follows from (A.22) and (A.24).

## A.4. Eigenvectors

For a square matrix A of size $M \times M$ , the eigenvector equation is defined by

$$
\mathbf{A} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{i}\tag{A.29}
$$

for $i = 1, \ldots, M$ , where $\mathbf{u}_{i}$ is an eigenvector and $\lambda_{i}$ is the corresponding eigenvalue. This can be viewed as a set of M simultaneous homogeneous linear equations, and the condition for a solution is that

$$
\left| \mathbf{A} - \lambda_{i} \mathbf{I} \right| = 0,\tag{A.30}
$$

which is known as the characteristic equation. Because this is a polynomial of order M in $\lambda_{i}$ , it must have M solutions (though these need not all be distinct). The rank of A is equal to the number of non-zero eigenvalues.

Of particular interest are symmetric matrices, which arise as covariance matrices, kernel matrices, and Hessians. Symmetric matrices have the property that $A_{ij} = A_{ji}$ , or equivalently $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ . The inverse of a symmetric matrix is also symmetric, as can be seen by taking the transpose of $\mathbf{A}^{- 1} \dot{\mathbf{A}} = \mathbf{I}$ and using $\mathbf{A} \mathbf{A}^{- 1} = \mathbf{I}$ together with the symmetry of I.

In general, the eigenvalues of a matrix are complex numbers, but for symmetric matrices, the eigenvalues $\lambda_{i}$ are real. This can be seen by first left-multiplying (A.29) by $(\mathbf{u}_{i}^{\star})^{\mathrm{T}}$ , where ? denotes the complex conjugate, to give

$$
\left(\mathbf{u}_{i}^{\star} \right)^{\mathrm{T}} \mathbf{A} \mathbf{u}_{i} = \lambda_{i} \left(\mathbf{u}_{i}^{\star} \right)^{\mathrm{T}} \mathbf{u}_{i}.\tag{A.31}
$$

Next we take the complex conjugate of (A.29) and left-multiply by ${\bf u}_{i}^{\mathrm{T}}$ to give

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{A} \mathbf{u}_{i}^{\star} = \lambda_{i}^{\star} \mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{i}^{\star}\tag{A.32}
$$

where we have used $\mathbf{A}^{\star} = \mathbf{A}$ because we are considering only real matrices A. Taking the transpose of the second of these equations and using $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ , we see that the left-hand sides of the two equations are equal and hence that ${\lambda}_{i}^{\star} ={\lambda}_{i}$ , and so $\lambda_{i}$ must be real.

The eigenvectors $\mathbf{u}_{i}$ of a real symmetric matrix can be chosen to be orthonormal (i.e., orthogonal and of unit length) so that

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = I_{ij}\tag{A.33}
$$

where $I_{ij}$ are the elements of the identity matrix I. To show this, we first left-multiply (A.29) by $\mathbf{u}_{j}^{\mathrm{T}}$ to give

$$
\mathbf{u}_{j}^{\mathrm{T}} \mathbf{A} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{j}^{\mathrm{T}} \mathbf{u}_{i}\tag{A.34}
$$

and hence, by exchanging the indices, we have

$$
\begin{array}{r}{{\bf u}_{i}^{\mathrm{T}}{\bf A}{\bf u}_{j} = \lambda_{j}{\bf u}_{i}^{\mathrm{T}}{\bf u}_{j}.} \end{array}\tag{A.35}
$$

We now take the transpose of the second equation and make use of the symmetry property $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ , and then subtract the two equations to give

$$
\begin{array}{r}{(\lambda_{i} - \lambda_{j}) \mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = 0.} \end{array}\tag{A.36}
$$

Hence, for $\lambda_{i} \neq \lambda_{j}$ , we have $\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = 0$ so that $\mathbf{u}_{i}$ and $\mathbf{u}_{j}$ are orthogonal. If the two eigenvalues are equal, then any linear combination $\alpha \mathbf{u}_{i} + \beta \mathbf{u}_{j}$ is also an eigenvector with the same eigenvalue, so we can select one linear combination arbitrarily, and then choose the second to be orthogonal to the first (it can be shown that the degenerate eigenvectors are never linearly dependent). Hence, the eigenvectors can be chosen to be orthogonal, and by normalizing can be set to unit length. Because there are M eigenvalues, the corresponding M orthogonal eigenvectors form a complete set and so any M-dimensional vector can be expressed as a linear combination of the eigenvectors.

We can take the eigenvectors $\mathbf{u}_{i}$ to be the columns of an $M \times M$ matrix U, which from orthonormality satisfies

$$
\mathbf{U}^{\mathrm{T}} \mathbf{U} = \mathbf{I}.\tag{A.37}
$$

Such a matrix is said to be orthogonal. Interestingly, the rows of this matrix are also orthogonal, so that $\mathbf{UU}^{\mathrm{T}} = \mathbf{I}.$ To show this, note that (A.37) implies $\begin{array}{r}{{\bf U}^{\mathrm{T}}{\bf U}{\bf U}^{- 1} = \qquad} \end{array}$ $\mathbf{U}^{- 1} = \mathbf{U}^{\mathrm{T}}$ and so $\mathbf{UU}^{- 1} = \mathbf{UU}^{\mathrm{T}} = \mathbf{I}$ . Using (A.12), it also follows that $| \mathbf{U} | = 1$

The eigenvector equation (A.29) can be expressed in terms of U in the form

$$
\mathbf{AU} = \mathbf{U} \mathbf{A}\tag{A.38}
$$

where Λ is an $M \times M$ diagonal matrix whose diagonal elements are given by the eigenvalues $\lambda_{i}$

If we consider a column vector x that is transformed by an orthogonal matrix U to give a new vector

$$
\widetilde{\mathbf{x}} = \mathbf{U} \mathbf{x}\tag{A.39}
$$

then the length of the vector is preserved because

$$
\widetilde{\mathbf{x}}^{\mathrm{T}} \widetilde{\mathbf{x}} = \mathbf{x}^{\mathrm{T}} \mathbf{U}^{\mathrm{T}} \mathbf{U} \mathbf{x} = \mathbf{x}^{\mathrm{T}} \mathbf{x}\tag{A.40}
$$

and similarly the angle between any two such vectors is preserved because

$$
\widetilde{\mathbf{x}}^{\mathrm{T}} \widetilde{\mathbf{y}} = \mathbf{x}^{\mathrm{T}} \mathbf{U}^{\mathrm{T}} \mathbf{U} \mathbf{y} = \mathbf{x}^{\mathrm{T}} \mathbf{y}.\tag{A.41}
$$

Thus, multiplication by U can be interpreted as a rigid rotation of the coordinate system.

From (A.38), it follows that

$$
\mathbf{U}^{\mathrm{T}} \mathbf{A} \mathbf{U} = \mathbf{A}\tag{A.42}
$$

and because Λ is a diagonal matrix, we say that the matrix A is diagonalized by the matrix U. If we left-multiply by U and right-multiply by $\mathbf{U}^{\mathrm{T}}$ , we obtain

$$
\mathbf{A} = \mathbf{U} \mathbf{A} \mathbf{U}^{\mathrm{T}}.\tag{A.43}
$$

Taking the inverse of this equation and using (A.3) together with $\mathbf{U}^{- 1} = \mathbf{U}^{\mathrm{T}}$ , we have

$$
\mathbf{A}^{- 1} = \mathbf{U} \mathbf{A}^{- 1} \mathbf{U}^{\mathrm{T}}.\tag{A.44}
$$

These last two equations can also be written in the form

$$
\mathbf{A} \ \mathbf{\Sigma} = \ \sum_{i = 1}^{M} \lambda_{i} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}}\tag{A.45}
$$

$$
{\mathbf{A}}^{- 1} = \sum_{i = 1}^{M} \frac{1}{\lambda_{i}}{\mathbf{u}}_{i}{\mathbf{u}}_{i}^{\mathrm{T}}.\tag{A.46}
$$

If we take the determinant of (A.43) and use (A.12), we obtain

$$
| \mathbf{A} | = \prod_{i = 1}^{M} \lambda_{i}.\tag{A.47}
$$

Similarly, taking the trace of (A.43), and using the cyclic property (A.8) of the trace operator together with ${\bf U}^{\mathrm{T}}{\bf U} ={\bf I}$ , we have

$$
\operatorname{Tr}(\mathbf{A}) = \sum_{i = 1}^{M} \lambda_{i}.\tag{A.48}
$$

We leave it as an exercise for the reader to verify (A.22) by making use of the results (A.33), (A.45), (A.46), and (A.47).

A matrix A is said to be positive definite, denoted by $\mathbf{A} \succ 0, \mathrm{if} \ \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} > 0$ for all non-zero values of the vector w. Equivalently, a positive definite matrix has $\lambda_{i} >$ 0 for all of its eigenvalues (as can be seen by setting w to each of the eigenvectors in turn and noting that an arbitrary vector can be expanded as a linear combination of the eigenvectors). Note that having all positive elements does not necessarily mean that a matrix is that positive definite. For example, the matrix

$$
\left(\begin{array}{ll}{1} &{2} \\{3} &{4} \end{array} \right)\tag{A.49}
$$

has eigenvalues $\lambda_{1} \simeq 5.37$ and $\lambda_{2} \simeq - 0.37$ . A matrix is said to be positive semidefinite if $\mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} \ \geqslant \0$ holds for all values of w, which is denoted $\textbf{A} \succeq 0$ and is equivalent to $\lambda_{i} \geqslant 0$

The condition number of a matrix is given by

$$
\mathrm{CN} = \left({\frac{\lambda_{\operatorname{max}}}{\lambda_{\operatorname{min}}}} \right)^{1 / 2}\tag{A.50}
$$

where $\lambda_{\mathrm{max}}$ is the largest eigenvalue and $\lambda_{\operatorname{min}}$ is the smallest eigenvalue.

## Appendix B. Calculus of Variations

We can think of a function $y(x)$ as being an operator that, for any input value x, returns an output value $y.$ In the same way, we can define a functional $F[y]$ to be an operator that takes a function $y(x)$ and returns an output value $F.$ An example of a functional is the length of a curve drawn in a two-dimensional plane in which the path of the curve is defined in terms of a function. In the context of machine learning, a widely used functional is the entropy $\mathrm{H}[x]$ for a continuous variable x because, for any choice of probability density function $p(x)$ , it returns a scalar value representing the entropy of x under that density. Thus, the entropy of $p(x)$ could equally well have been written as $\mathrm{H}[p]$

A common problem in conventional calculus is to find a value of $x$ that maximizes (or minimizes) a function $y(x)$ . Similarly, in the calculus of variations we seek a function $y(x)$ that maximizes (or minimizes) a functional $F[y]$ . That is, of all possible functions $y(x)$ , we wish to find the particular function for which the functional $F[y]$ is a maximum (or minimum). The calculus of variations can be used, for instance, to show that the shortest path between two points is a straight line or that the maximum entropy distribution is a Gaussian.

If we were not familiar with the rules of ordinary calculus, we could evaluate a conventional derivative $d y /$ dx by making a small change $\epsilon$ to the variable x and then expanding in powers of $\epsilon$, so that

$$
y(x + \epsilon) = y(x) + \frac{d y}{d x} \epsilon + \mathcal{O}(\epsilon^{2})\tag{B.1}
$$

and finally taking the limit $\epsilon 0$ . Similarly, for a function of several variables $y(x_{1}, \ldots, x_{D})$ , the corresponding partial derivatives are defined by

$$
y(x_{1} + \epsilon_{1}, \ldots, x_{D} + \epsilon_{D}) = y(x_{1}, \ldots, x_{D}) + \sum_{i = 1}^{D}{\frac{\partial y}{\partial x_{i}}} \epsilon_{i} +{\mathcal{O}}(\epsilon^{2}).\tag{B.2}
$$

The analogous definition of a functional derivative arises when we consider how much a functional $F[y]$ changes when we make a small change $\epsilon \eta(x)$ to the function

Figure B.1 A functional derivative can be defined by considering how the value of a functional $F[y]$ changes when the function $y(x)$ is changed to $y(x) + \epsilon \eta(x)$ where $\eta(x)$ is an arbitrary function of x.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/27535df7c4e246e35c54b800226ffc86d7ea9940b0f5017689d38474aee170ed.jpg)

$y(x)$ , where $\eta(x)$ is an arbitrary function of $x,$ as illustrated in Figure B.1. We denote the functional derivative of $F[y]$ with respect to $y(x)$ by $\delta F / \delta y(x)$ and define it by the following relation:

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int \frac{\delta F}{\delta y(x)} \eta(x) d x + \mathcal{O}(\epsilon^{2}).\tag{B.3}
$$

This can be seen as a natural extension of (B.2) in which $F[y]$ now depends on a continuous set of variables, namely the values of $y$ at all points x. Requiring that the functional be stationary with respect to small variations in the function $y(x)$ gives

$$
\int \frac{\delta F}{\delta y(x)} \eta(x) d x = 0.\tag{B.4}
$$

Because this must hold for an arbitrary choice of $\eta(x)$ , it follows that the functional derivative must vanish. To see this, imagine choosing a perturbation $\eta(x)$ that is zero everywhere except in the neighbourhood of a point ${\widehat{x}},$ in which case the functional derivative must be zero at $x ={\widehat{x}}$ However, because this must be true for every choice of $\widehat{x}$ , the functional derivative must vanish for all values of $x.$

Consider a functional that is defined by an integral over a function $G(y, y^{\prime}, x)$ which depends on both $y(x)$ and its derivative $y^{\prime}(x)$ and has a direct dependence on x:

$$
F[y] = \int G \left(y(x), y^{\prime}(x), x \right) d x\tag{B.5}
$$

where the value of $y(x)$ is assumed to be fixed at the boundary of the region of integration (which might be at infinity). If we now consider variations in the function $y(x)$ , we obtain

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int \left\{{\frac{\partial G}{\partial y}} \eta(x) +{\frac{\partial G}{\partial y^{\prime}}} \eta^{\prime}(x) \right\}{d} x +{\mathcal{O}}(\epsilon^{2}).\tag{B.6}
$$

We now have to cast this in the form (B.3). To do so, we integrate the second term by parts and note that $\eta(x)$ must vanish at the boundary of the integral (because $y(x)$ is fixed at the boundary). This gives

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int \left\{{\frac{\partial G}{\partial y}} -{\frac{d}{d x}} \left({\frac{\partial G}{\partial y^{\prime}}} \right) \right\} \eta(x) d x +{\mathcal{O}}(\epsilon^{2})\tag{B.7}
$$

from which we can read off the functional derivative by comparison with (B.3). Requiring that the functional derivative vanishes then gives

$$
\frac{\partial G}{\partial y} - \frac{d}{d x} \left(\frac{\partial G}{\partial y^{\prime}} \right) = 0,\tag{B.8}
$$

which are known as the Euler–Lagrange equations. For example, if

$$
G = y(x)^{2} + \left(y^{\prime}(x) \right)^{2}\tag{B.9}
$$

then the Euler–Lagrange equations take the form

$$
y(x) -{\frac{d^{2} y}{d x^{2}}} = 0.\tag{B.10}
$$

This second-order differential equation can be solved for $y(x)$ by making use of the boundary conditions on $y(x)$

Often, we consider functionals defined by integrals whose integrands take the form $G(y, x)$ and that do not depend on the derivatives of $y(x)$ . In this case, stationarity simply requires that $\partial G / \partial y(x) = 0$ for all values of x.

If we are optimizing a functional with respect to a probability distribution, then we need to maintain the normalization constraint on the probabilities. This is often most conveniently done using a Lagrange multiplier, which then allows an unconstrained optimization to be performed.

The extension of the above results to a multi-dimensional variable x is straightforward. For a more comprehensive discussion of the calculus of variations, see Sagan (1969).

## Appendix C. Lagrange Multipliers

Lagrange multipliers, also sometimes called undetermined multipliers, are used to find the stationary points of a function of several variables subject to one or more constraints.

Consider the problem of finding the maximum of a function $f(x_{1}, x_{2})$ subject to a constraint relating $x_{1}$ and $x_{2}$ , which we write in the form

$$
g(x_{1}, x_{2}) = 0.\tag{C.1}
$$

One approach would be to solve the constraint equation (C.1) and thus express $x_{2}$ as a function of $x_{1}$ in the form $x_{2} = h(x_{1})$ . This can then be substituted into $f(x_{1}, x_{2})$ to give a function of $x_{1}$ alone of the form $f(x_{1}, h(x_{1}))$ . The maximum with respect to $x_{1}$ could then be found by differentiation in the usual way, to give the stationary value $x_{1}^{\star}$ , with the corresponding value of $x_{2}$ given by $x_{2}^{\star} = h(x_{1}^{\star})$

One problem with this approach is that it may be difficult to find an analytic solution of the constraint equation that allows $x_{2}$ to be expressed as an explicit function of $x_{1}$ . Also, this approach treats $x_{1}$ and $x_{2}$ differently and so spoils the natural symmetry between these variables.

A more elegant, and often simpler, approach introduces a parameter $\lambda$ called a Lagrange multiplier. We shall motivate this technique from a geometrical perspective. Consider a D-dimensional variable x with components $x_{1}, \ldots, x_{D}$ . The constraint equation $g(\mathbf{x}) = 0$ then represents a $(D - 1)$ )-dimensional surface in x-space as indicated in Figure C.1.

First note that at any point on the constraint surface, the gradient $\nabla g(\mathbf{x})$ of the constraint function is orthogonal to the surface. To see this, consider a point x that lies on the constraint surface along with a nearby point ${\bf x} + \epsilon$ that also lies on the surface. If we make a Taylor expansion around x, we have

$$
\begin{array}{r}{g(\mathbf{x} + \epsilon) \simeq g(\mathbf{x}) + \epsilon^{\mathrm{T}} \nabla g(\mathbf{x}).} \end{array}\tag{C.2}
$$

Because both x and $\mathbf{x} + \epsilon$ lie on the constraint surface, we have $g(\mathbf{x}) = g(\mathbf{x} + \epsilon)$ and hence $\epsilon^{\mathrm{T}} \nabla g(\mathbf{x}) \simeq 0$ . In the limit $\| \epsilon \| 0$ , we have $\epsilon^{\mathrm{T}} \nabla g(\mathbf{x}) ={\dot{0}}$ , and because $\epsilon$ is

Figure C.1 A geometrical picture of the technique of Lagrange multipliers in which we seek to maximize a function $f(\mathbf{x})$ , subject to the constraint $g(\mathbf{x}) = 0$ . If $\mathbf{x}$ is D dimensional, the constraint $g({\bf x}) = 0 \mathtt{cor} \mathtt{-}$ responds to a subspace of dimensionality $D - 1$ as indicated by the red curve. The problem can be solved by optimizing the Lagrangian function $L(\mathbf{x}, \lambda) = f(\mathbf{x}) \dot{+} \lambda g(\mathbf{x})$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/081a34321ef29d38ed3df55352396396bac46b765f2cb76b9281f5abc9e299c4.jpg)

then parallel to the constraint surface $g(\mathbf{x}) = 0$ , we see that the vector $\nabla g$ is normal to the surface.

Next we seek a point $\mathbf{x}^{\star}$ on the constraint surface such that $f(\mathbf{x})$ is maximized. Such a point must have the property that the vector $\nabla f(\mathbf{x})$ is also orthogonal to the constraint surface, as illustrated in Figure C.1, because otherwise we could increase the value of $f(\mathbf{x})$ by moving a short distance along the constraint surface. Thus, $\nabla f$ and $\nabla g$ are parallel (or anti-parallel) vectors, and so there must exist a parameter λ such that

$$
\nabla f + \lambda \nabla g = 0\tag{C.3}
$$

where $\lambda \neq 0$ is known as a Lagrange multiplier. Note that λ can have either sign.

At this point, it is convenient to introduce the Lagrangian function defined by

$$
L(\mathbf{x}, \lambda) \equiv f(\mathbf{x}) + \lambda g(\mathbf{x}).\tag{C.4}
$$

The constrained stationarity condition (C.3) is obtained by setting $\nabla_{\mathbf x} L = 0$ . Furthermore, the condition $\partial L / \partial \lambda = 0$ leads to the constraint equation $g(\mathbf{x}) = 0$

Thus, to find the maximum of a function $f(\mathbf{x})$ subject to the constraint $g(\mathbf{x}) = 0$ we define the Lagrangian function given by $(\mathbf{C}.4)$ and we then find the stationary point of $L(\mathbf{x}, \lambda)$ with respect to both x and λ. For a D-dimensional vector x, this gives $D + 1$ equations that determine both the stationary point $\mathbf{x}^{\star}$ and the value of λ. If we are interested only in $\mathbf{x}^{\star}$ , then we can eliminate λ from the stationarity equations without needing to find its value (hence, the term ‘undetermined multiplier’).

As a simple example, suppose we wish to find the stationary point of the function $f(x_{1}, x_{2}) = \bar{1} - x_{1}^{2} - x_{2}^{2}$ subject to the constraint $g(x_{1}, x_{2}) = x_{1} + x_{2} - 1 = 0$ , as illustrated in Figure C.2. The corresponding Lagrangian function is given by

$$
L(\mathbf{x}, \lambda) = 1 - x_{1}^{2} - x_{2}^{2} + \lambda(x_{1} + x_{2} - 1).\tag{C.5}
$$

The conditions for this Lagrangian to be stationary with respect to $x_{1}, x_{2}$ , and λ give the following coupled equations:

$$
- 2x_{1} + \lambda = 0\tag{C.6}
$$

$$
- 2x_{2} + \lambda ~ = ~ 0
$$

$$
x_{1} + x_{2} - 1 = 0.\tag{C.7}
$$

(C.8)

Figure C.2 A simple example of the use of Lagrange multipliers in which the aim is to maximize $f(x_{1}, x_{2}) = 1 -$ $x_{1}^{2} - x_{2}^{2}$ subject to the constraint $g(x_{1}, x_{2}) = 0$ where $g(x_{1}, x_{2}) = x_{1} + x_{2} - 1$ . The circles show contours of the function $f(x_{1}, x_{2})$ , and the diagonal line shows the constraint surface $g(x_{1}, x_{2}) = 0$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/fb152b5df4fd211f7a679e38075c3146e414ae079b983bc7202fafafbef5802f.jpg)

Solving these equations then gives the stationary point as $(x_{1}^{\star}, x_{2}^{\star}) =(1 / 2, 1 / 2)$ , and the corresponding value for the Lagrange multiplier is $\lambda = 1$

So far, we have considered the problem of maximizing a function subject to an equality constraint of the form $g(\mathbf{x}) = 0$ . We now consider the problem of maximizing $f(\mathbf{x})$ subject to an inequality constraint of the form $g(\mathbf{x}) \geqslant 0$ , as illustrated in Figure C.3.

There are now two kinds of solution possible, according to whether the constrained stationary point lies in the region where $g(\mathbf{x}) > 0$ , in which case the constraint is inactive, or whether it lies on the boundary $g(\mathbf{x}) = 0;$ , in which case the constraint is said to be active. In the former case, the function $g(\mathbf{x})$ plays no role and so the stationary condition is simply $\nabla f(\mathbf{x}) = 0$ This again corresponds to a stationary point of the Lagrange function $(\mathbf{C}.4)$ but this time with $\lambda = 0$ . The latter case, where the solution lies on the boundary, is analogous to the equality constraint discussed previously and corresponds to a stationary point of the Lagrange function (C.4) with $\lambda \neq 0$ . Now, however, the sign of the Lagrange multiplier is crucial, because the function $f(\mathbf{x})$ is at a maximum only if its gradient is oriented away from the region $g(\mathbf{x}) ~ > ~ 0$ , as illustrated in Figure C.3. We therefore have $\nabla f(\mathbf{x}) = - \lambda \nabla g(\mathbf{x})$ for some value of $\lambda > 0$

For either of these two cases, the product $\lambda g(\mathbf{x}) = 0$ . Thus, the solution to the problem of maximizing $f(\mathbf{x})$ subject to $g(\mathbf{x}) \geqslant 0$ is obtained by optimizing the Lagrange function (C.4) with respect to x and λ subject to the conditions

Figure C.3 Illustration of the problem of maximizing $f(\mathbf{x})$ subject to the inequality constraint $g(\mathbf{x}) \geqslant 0$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/601-656/images/f25fe700200e938e77931f11637982999949ae70e861659d512b302983ca84e2.jpg)

$$
g({\bf x}) \geqslant 0
$$

$$
\lambda \geqslant 0\tag{C.9}
$$

$$
\begin{array}{r}{\lambda g(\mathbf{x}) \ = \0.} \end{array}\tag{C.10}
$$

(C.11)

These are known as the Karush–Kuhn–Tucker (KKT) conditions (Karush, 1939;   
Kuhn and Tucker, 1951).

Note that if we wish to minimize (rather than maximize) the function $f(\mathbf{x})$ subject to an inequality constraint $g(\mathbf{x}) \geqslant 0$ , then we minimize the Lagrangian function $L(\mathbf{x}, \lambda) = f(\mathbf{\bar{x}}) - \lambda g(\mathbf{x})$ with respect to x, again subject to $\lambda \geqslant 0$

Finally, it is straightforward to extend the technique of Lagrange multipliers to cases with multiple equality and inequality constraints. Suppose we wish to maximize $f(\mathbf{x})$ subject to $g_{j}(\mathbf{x}) = 0$ for $j = 1, \dots, J$ , and $h_{k}(\mathbf{x}) \geqslant 0$ for $k = 1, \ldots, K$ We then introduce Lagrange multipliers $\{\lambda_{j}\}$ and $\{\mu_{k}\}$ , and then optimize the Lagrangian function given by

$$
L(\mathbf{x}, \{\lambda_{j}\}, \{\mu_{k}\}) = f(\mathbf{x}) + \sum_{j = 1}^{J} \lambda_{j} g_{j}(\mathbf{x}) + \sum_{k = 1}^{K} \mu_{k} h_{k}(\mathbf{x})\tag{C.12}
$$

subject to $\mu_{k} \geqslant 0$ and $\mu_{k} h_{k}({\bf x}) = 0$ for $k = 1, \ldots, K$ . Extensions to constrained functional derivatives are similarly straightforward. For a more detailed discussion of the technique of Lagrange multipliers, see Nocedal and Wright (1999).

## Bibliography

Abramowitz, M., and I. A. Stegun. 1965. Handbook of Mathematical Functions. Dover.

Adler, S. L. 1981. “Over-relaxation method for the Monte Carlo evaluation of the partition function for multiquadratic actions.” Physical Review D 23:2901–2904.

Aghajanyan, Armen, Bernie Huang, Candace Ross, Vladimir Karpukhin, Hu Xu, Naman Goyal, Dmytro Okhonko, et al. 2022. CM3: A Causal Masked Multimodal Model of the Internet. Technical report. arXiv:2201.07520.

Aghajanyan, Armen, Luke Zettlemoyer, and Sonal Gupta. 2020. Intrinsic Dimensionality Explains the Effectiveness of Language Model Fine-Tuning. Technical report. arXiv:2012.13255.

Ahn, J. H., and J. H. Oh. 2003. “A constrained EM algorithm for principal component analysis.” Neural Computation 15 (1): 57–65.

Alayrac, Jean-Baptiste, Jeff Donahue, Pauline Luc, Antoine Miech, Iain Barr, Yana Hasson, Karel Lenc, et al. 2022. Flamingo: a Visual Language Model for Few-Shot Learning. Technical report. arXiv:2204.14198.

Amari, S., A. Cichocki, and H. H. Yang. 1996. “A new learning algorithm for blind signal separation.” In Advances in Neural Information Processing Systems, edited by D. S. Touretzky,

M. C. Mozer, and M. E. Hasselmo, 8:757–763. MIT Press.

Anderson, J. A., and E. Rosenfeld. 1988. Neurocomputing: Foundations of Research. MIT Press.

Anderson, T. W. 1963. “Asymptotic Theory for Principal Component Analysis.” Annals of Mathematical Statistics 34:122–148.

Arjovsky, M., S. Chintala, and L. Bottou. 2017. Wasserstein GAN. Technical report. arXiv:1701.07875.

Attias, H. 1999. “Independent factor analysis.” Neural Computation 11 (4): 803–851.

Austin, Jacob, Daniel D. Johnson, Jonathan Ho, Daniel Tarlow, and Rianne van den Berg. 2021. “Structured Denoising Diffusion Models in Discrete State-Spaces.” In Advances in Neural Information Processing Systems, 34:17981– 17993.

Ba, Jimmy Lei, Jamie Ryan Kiros, and Geoffrey E Hinton. 2016. Layer Normalization. Technical report. arXiv:1607.06450.

Bach, F. R., and M. I. Jordan. 2002. “Kernel Independent Component Analysis.” Journal of Machine Learning Research 3:1–48.

Badrinarayanan, Vijay, Alex Kendall, and Roberto Cipolla. 2015. SegNet: A Deep Convolu-

tional Encoder-Decoder Architecture for Image Segmentation. Technical report. arXiv:1511.00561.

Bahdanau, Dzmitry, Kyunghyun Cho, and Yoshua Bengio. 2014. Neural Machine Translation by Jointly Learning to Align and Translate. Technical report. arXiv:1409.0473.

Baldi, P., and K. Hornik. 1989. “Neural networks and principal component analysis: learning from examples without local minima.” Neural Networks 2 (1): 53–58.

Balduzzi, David, Marcus Frean, Lennox Leary, JP Lewis, Kurt Wan-Duo Ma, and Brian McWilliams. 2017. The Shattered Gradients Problem: If resnets are the answer, then what is the question? Technical report. arXiv:1702.08591.

Bartholomew, D J. 1987. Latent Variable Models and Factor Analysis. Charles Griffin.

Basilevsky, Alexander. 1994. Statistical Factor Analysis and Related Methods: Theory and Applications. Wiley.

Bather, J. 2000. Decision Theory: An Introduction to Dynamic Programming and Sequential Decisions. Wiley.

Battaglia, Peter W., Jessica B. Hamrick, Victor Bapst, Alvaro Sanchez-Gonzalez, Vinicius Zambaldi, Mateusz Malinowski, Andrea Tacchetti, et al. 2018. Relational inductive biases, deep learning, and graph networks. Technical report. arXiv:1806.01261.

Baydin, A. G., B. A. Pearlmutter, A. A. Radul, and J. M. Siskind. 2018. “Automatic differentiation in machine learning: a survey.” Journal of Machine Learning Research 18:1–43.

Becker, S., and Y. LeCun. 1989. “Improving the convergence of back-propagation learning with second order methods.” In Proceedings of the 1988 Connectionist Models Summer School, edited by D. Touretzky, G. E. Hinton, and T. J. Sejnowski, 29–37. Morgan Kaufmann.

Belkin, Mikhail, Daniel Hsu, Siyuan Ma, and Soumik Mandal. 2019. “Reconciling mod-

ern machine-learning practice and the classical bias-variance trade-off.” Proceedings of the National Academy of Sciences 116 (32): 15849–15854.

Bell, A. J., and T. J. Sejnowski. 1995. “An information maximization approach to blind separation and blind deconvolution.” Neural Computation 7 (6): 1129–1159.

Bellman, R. 1961. Adaptive Control Processes: A Guided Tour. Princeton University Press.

Bengio, Yoshua, Aaron Courville, and Pascal Vincent. 2012. Representation Learning: A Review and New Perspectives. Technical report. arXiv:1206.5538.

Bengio, Yoshua, Nicholas Leonard, and Aaron´ Courville. 2013. Estimating or Propagating Gradients Through Stochastic Neurons for Conditional Computation. Technical report. arXiv:1308.3432.

Berger, J. O. 1985. Statistical Decision Theory and Bayesian Analysis. Second. Springer.

Bernardo, J. M., and A. F. M. Smith. 1994. Bayesian Theory. Wiley.

Bishop, C. M. 1995a. “Regularization and Complexity Control in Feed-forward Networks.” In Proceedings International Conference on Artificial Neural Networks ICANN’95, edited by F. Fougelman-Soulie and P. Gallinari, 1:141– 148. EC2 et Cie.

Bishop, Christopher M. 1992. “Exact Calculation of the Hessian Matrix for the Multilayer Perceptron.” Neural Computation 4 (4): 494–501.

Bishop, Christopher M. 1994. “Novelty Detection and Neural Network Validation.” IEE Proceedings: Vision, Image and Signal Processing 141 (4): 217–222.

Bishop, Christopher M. 1995b. Neural Networks for Pattern Recognition. Oxford University Press.

Bishop, Christopher M. 1995c. “Training with noise is equivalent to Tikhonov regularization.” Neural Computation 7 (1): 108–116.

Bishop, Christopher M. 2006. Pattern Recognition and Machine Learning. Springer.

Bommasani, Rishi, Drew A. Hudson, Ehsan Adeli, Russ Altman, Simran Arora, Sydney von Arx, Michael S. Bernstein, et al. 2021. On the Opportunities and Risks of Foundation Models. Technical report. arXiv:2108.07258.

Bottou, L. 2010. “Large-scale machine learning with stochastic gradient descent.” In Proceedings COMPSTAT 2010, 177–186. Springer.

Bourlard, H., and Y. Kamp. 1988. “Autoassociation by multilayer perceptrons and singular value decomposition.” Biological Cybernetics 59:291–294.

Breiman, L. 1996. “Bagging predictors.” Machine Learning 26:123–140.

Brinker, T. J., A. Hekler, A. H. Enk, C. Berking, S Haferkamp, A. Hauschild, M. Weichenthal, et al. 2019. “Deep neural networks are superior to dermatologists in melanoma image classification.” European Journal of Cancer 119:11– 17.

Brock, Andrew, Jeff Donahue, and Karen Simonyan. 2018. “Large-Scale GAN Training for High Fidelity Natural Image Synthesis.” In Proceedings of the International Conference Learning Representations (ICLR). ArXiv:1809.11096.

Bronstein, Michael M., Joan Bruna, Taco Cohen, and Petar Velickovic. 2021. Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges. Technical report. arXiv:2104.13478.

Bronstein, Michael M., Joan Bruna, Yann Le-Cun, Arthur Szlam, and Pierre Vandergheynst. 2017. “Geometric Deep Learning: Going Beyond Eulcidean Data.” In IEEE Signal Processing Magazine, vol. 34. 4. IEEE, July.

Broomhead, D. S., and D. Lowe. 1988. “Multivariable functional interpolation and adaptive networks.” Complex Systems 2:321–355.

Brown, Tom B., Benjamin Mann, Nick Ryder, Melanie Subbiah, Jared Kaplan, Prafulla Dhariwal, Arvind Neelakantan, et al. 2020. Language Models are Few-Shot Learners. Technical report. arXiv:2005.14165.

Bubeck, Sebastien, Varun Chandrasekaran, Ronen´ Eldan, Johannes Gehrke, Eric Horvitz, Ece Kamar, Peter Lee, et al. 2023. Sparks of Artificial General Intelligence: Early experiments with GPT-4. Technical report. arXiv:2303.12712.

Cardoso, J-F. 1998. “Blind signal separation: statistical principles.” Proceedings of the IEEE 9 (10): 2009–2025.

Caruana, R. 1997. “Multitask learning.” Machine Learning 28:41–75.

Casella, G., and R. L. Berger. 2002. Statistical Inference. Second. Duxbury.

Chan, K., T. Lee, and T. J. Sejnowski. 2003. “Variational Bayesian learning of ICA with missing data.” Neural Computation 15 (8): 1991–2011.

Chen, A. M., H. Lu, and R. Hecht-Nielsen. 1993. “On the geometry of feedforward neural network error surfaces.” Neural Computation 5 (6): 910–927.

Chen, Mark, Alec Radford, Rewon Child, Jeffrey Wu, Heewoo Jun, David Luan, and Ilya Sutskever. 2020. “Generative Pretraining From Pixels.” Proceedings of Machine Learning Research 119:1691–1703.

Chen, R. T. Q., Rubanova Y, J. Bettencourt, and D. Duvenaud. 2018. Neural Ordinary Differential Equations. Technical report. arXiv:1806.07366.

Chen, Ting, Simon Kornblith, Mohammad Norouzi, and Geoffrey Hinton. 2020. A Simple Framework for Contrastive Learning of Visual Representations. Technical report. arXiv:2002.05709.

Cho, Kyunghyun, Bart van Merrienboer, C¸ aglar Gulc¸ehre, Fethi Bougares, Holger Schwenk,¨ and Yoshua Bengio. 2014. Learning Phrase Representations using RNN Encoder-Decoder for Statistical Machine Translations. Technical report. arXiv:1406.1078.

Choudrey, R. A., and S. J. Roberts. 2003. “Variational mixture of Bayesian independent component analyzers.” Neural Computation 15 (1): 213–252.

Christiano, Paul, Jan Leike, Tom B. Brown, Miljan Martic, Shane Legg, and Dario Amodei. 2017. Deep reinforcement learning from human preferences. Technical report. arXiv:1706.03741.

Collobert, R. 2004. “Large Scale Machine Learning.” PhD diss., Universite Paris VI.´

Comon, P., C. Jutten, and J. Herault. 1991. “Blind source separation, 2: problems statement.” Signal Processing 24 (1): 11–20.

Cover, T., and P. Hart. 1967. “Nearest neighbor pattern classification.” IEEE Transactions on Information Theory IT-11:21–27.

Cover, T. M., and J. A. Thomas. 1991. Elements of Information Theory. Wiley.

Cox, R. T. 1946. “Probability, frequency and reasonable expectation.” American Journal of Physics 14 (1): 1–13.

Cybenko, G. 1989. “Approximation by superpositions of a sigmoidal function.” Mathematics of Control, Signals and Systems 2:304–314.

Dawid, A. P. 1979. “Conditional Independence in Statistical Theory (with discussion).” Journal of the Royal Statistical Society, Series B 4:1– 31.

Dawid, A. P. 1980. “Conditional Independence for Statistical Operations.” Annals of Statistics 8:598–617.

Deisenroth, M. P., A. A. Faisal, and C. S. Ong. 2020. Mathematics for Machine Learning. Cambridge University Press.

Dempster, A. P., N. M. Laird, and D. B. Rubin. 1977. “Maximum likelihood from incomplete data via the EM algorithm.” Journal of the Royal Statistical Society, B 39 (1): 1–38.

Deng, Jia, Wei Dong, Richard Socher, Li-Jia Li, Kai Li, and Li Fei-Fei. 2009. “ImageNet: A largescale hierarchical image database.” In IEEE Conference on Computer Vision and Pattern Recognition.

Devlin, Jacob, Ming-Wei Chang, Kenton Lee, and Kristina Toutanova. 2018. BERT: Pretraining of Deep Bidirectional Transformers

for Language Understanding. Technical report. arXiv:1810.04805.

Dhariwal, Prafulla, and Alex Nichol. 2021. Diffusion Models Beat GANs on Image Synthesis. Technical report. arXiv:2105.05233.

Dinh, Laurent, David Krueger, and Yoshua Bengio. 2014. NICE: Non-linear Independent Components Estimation. Technical report. arXiv:1410.8516.

Dinh, Laurent, Jascha Sohl-Dickstein, and Samy Bengio. 2016. Density estimation using Real NVP. Technical report. arXiv:1605.08803.

Dodge, Samuel, and Lina Karam. 2017. A Study and Comparison of Human and Deep Learning Recognition Performance Under Visual Distortions. Technical report. arXiv:1705.02498.

Doersch, C. 2016. Tutorial on Variational Autoencoders. Technical report. arXiv:1606.05908.

Dosovitskiy, Alexey, Lucas Beyer, Alexander Kolesnikov, Dirk Weissenborn, Xiaohua Zhai, Thomas Unterthiner, Mostafa Dehghani, et al. 2020. An Image is Worth 16 16 Words: Transformers for Image Recognition at Scale. Technical report. arXiv:2010.11929.

Duane, S., A. D. Kennedy, B. J. Pendleton, and D. Roweth. 1987. “Hybrid Monte Carlo.” Physics Letters B 195 (2): 216–222.

Duchi, J., E. Hazan, and Y. Singer. 2011. “Adaptive Subgradient Methods for Online Learning and Stochastic Optimization.” Journal of Machine Learning Research 12:2121–2159.

Duda, R. O., and P. E. Hart. 1973. Pattern Classification and Scene Analysis. Wiley.

Dufter, Philipp, Martin Schmitt, and Hinrich Schutze. 2021.¨ Position Information in Transformers: An Overview. Technical report. arXiv:2102.11090.

Dumoulin, Vincent, and Francesco Visin. 2016. A guide to convolution arithmetic for deep learning. Technical report. arXiv:1603.07285.

Elliott, R. J., L. Aggoun, and J. B. Moore. 1995. Hidden Markov Models: Estimation and Control. Springer.

Esser, Patrick, Robin Rombach, and Bjorn Om-¨ mer. 2020. Taming Transformers for High-Resolution Image Synthesis. Technical report. arXiv:2012.09841.

Esteva, A., B. Kuprel, R. A. Novoa, J. Ko, S. M. Swetter, H. M. Blau, and S. Thrun. 2017. “Dermatologist-level classification of skin cancer with deep neural networks.” Nature 542:115–118.

Everitt, B. S. 1984. An Introduction to Latent Variable Models. Chapman / Hall.

Eykholt, Kevin, Ivan Evtimov, Earlence Fernandes, Bo Li, Amir Rahmati, Chaowei Xiao, Atul Prakash, Tadayoshi Kohno, and Dawn Song. 2018. “Robust Physical-World Attacks on Deep Learning Visual Classification.” In Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition (CVPR).

Fawcett, T. 2006. “An introduction to ROC analysis.” Pattern Recognition Letters 27:861–874.

Feller, W. 1966. An Introduction to Probability Theory and its Applications. Second. Vol. 2. Wiley.

Fletcher, R. 1987. Practical Methods of Optimization. Second. Wiley.

Forsyth, D. A., and J. Ponce. 2003. Computer Vision: A Modern Approach. Prentice Hall.

Freund, Y., and R. E. Schapire. 1996. “Experiments with a new boosting algorithm.” In Thirteenth International Conference on Machine Learning, edited by L. Saitta, 148–156. Morgan Kaufmann.

Fukushima, K. 1980. “Neocognitron: A Selforganizing Neural Network Model for a Mechanism of Pattern Recognition Unaffected by Shift in Position.” Biological Cybernetics 36:193–202.

Funahashi, K. 1989. “On the approximate realization of continuous mappings by neural networks.” Neural Networks 2 (3): 183–192.

Fung, R., and K. C. Chang. 1990. “Weighting and Integrating Evidence for Stochastic Simulation in Bayesian Networks.” In Uncertainty in Artificial Intelligence, edited by P. P. Bonissone,

M. Henrion, L. N. Kanal, and J. F. Lemmer, 5:208–219. Elsevier.

Gatys, Leon A., Alexander S. Ecker, and Matthias Bethge. 2015. A Neural Algorithm of Artistic Style. Technical report. arXiv:1508.06576.

Geman, S., and D. Geman. 1984. “Stochastic relaxation, Gibbs distributions, and the Bayesian restoration of images.” IEEE PAMI 6 (1): 721– 741.

Gemmeke, Jort F., Daniel P. W. Ellis, Dylan Freedman, Aren Jansen, Wade Lawrence, R. Channing Moore, Manoj Plakal, and Marvin Ritter. 2017. “Audio Set: An ontology and humanlabeled dataset for audio events.” In Proc. IEEE ICASSP 2017. New Orleans, LA.

Germain, Mathieu, Karol Gregor, Iain Murray, and Hugo Larochelle. 2015. MADE: Masked Autoencoder for Distribution Estimation. Technical report. arXiv:1502.03509.

Gilks, W. R. 1992. “Derivative-free adaptive rejection sampling for Gibbs sampling.” In Bayesian Statistics, edited by J. Bernardo, J. Berger, A. P. Dawid, and A. F. M. Smith, vol. 4. Oxford University Press.

Gilks, W. R., N. G. Best, and K. K. C. Tan. 1995. “Adaptive rejection Metropolis sampling.” Applied Statistics 44:455–472.

Gilks, W. R., S. Richardson, and D. J. Spiegelhalter. 1996. Markov Chain Monte Carlo in Practice. Chapman / Hall.

Gilks, W. R., and P. Wild. 1992. “Adaptive rejection sampling for Gibbs sampling.” Applied Statistics 41:337–348.

Gilmer, Justin, Samuel S. Schoenholz, Patrick F. Riley, Oriol Vinyals, and George E. Dahl. 2017. Neural Message Passing for Quantum Chemistry. Technical report. arXiv:1704.01212.

Girshick, Ross B. 2015. Fast R-CNN. Technical report. arXiv:1504.08083.

Golub, G. H., and C. F. Van Loan. 1996. Matrix Computations. Third. John Hopkins University Press.

Gong, Yuan, Yu-An Chung, and James R. Glass. 2021. AST: Audio Spectrogram Transformer. Technical report. arXiv:2104.01778.

Goodfellow, Ian, Yoshua Bengio, and Aaron Courville. 2016. Deep Learning. MIT Press.

Goodfellow, Ian J., Jean Pouget-Abadie, Mehdi Mirza, Bing Xu, David Warde-Farley, Sherjil Ozair, Aaron Courville, and Yoshua Bengio. 2014. Generative Adversarial Networks. Technical report. arXiv:1406.2661.

Goodfellow, Ian J., Jonathon Shlens, and Christian Szegedy. 2014. Explaining and Harnessing Adversarial Examples. Technical report. arXiv:1412.6572.

Grathwohl, Will, Ricky T. Q. Chen, Jesse Bettencourt, Ilya Sutskever, and David Duvenaud. 2018. FFJORD: Free-form Continuous Dynamics for Scalable Reversible Generative Models. Technical report. arXiv:1810.01367.

Griewank, A., and A Walther. 2008. Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation. Second. SIAM.

Grosse, R. 2018. Automatic Differentiation. CSC321 Lecture 10. University of Toronto.

Gulrajani, I., F. Ahmed, M. Arjovsky, V. Dumoulin, and A. Courville. 2017. Improved training of Wasserstein GANs. Technical report. arXiv:1704.00028.

Gutmann, Michael, and Aapo Hyvarinen. 2010.¨ “Noise-contrastive estimation: A new estimation principle for unnormalized statistical models.” Journal of Machine Learning Research 9:297–304.

Hamilton, W. L. 2020. Graph Representation Learning. Morgan / Claypool.

Hartley, R., and A. Zisserman. 2004. Multiple View Geometry in Computer Vision. Second. Cambridge University Press.

Hassibi, B., and D. G. Stork. 1993. “Second order derivatives for network pruning: optimal brain surgeon.” In Proceedings International Conference on Neural Information Processing Systems (NeurIPS), edited by S. J. Hanson, J. D.

Cowan, and C. L. Giles, 5:164–171. Morgan Kaufmann.

Hastie, T., R. Tibshirani, and J. Friedman. 2009. The Elements of Statistical Learning. Second. Springer.

Hastings, W. K. 1970. “Monte Carlo sampling methods using Markov chains and their applications.” Biometrika 57:97–109.

He, Kaiming, Xinlei Chen, Saining Xie, Yanghao Li, Piotr Dollar, and Ross B. Girshick. 2021.´ Masked Autoencoders Are Scalable Vision Learners. Technical report. arXiv:2111.06377.

He, Kaiming, Haoqi Fan, Yuxin Wu, Saining Xie, and Ross Girshick. 2019. Momentum Contrast for Unsupervised Visual Representation Learning. Technical report. arXiv:1911.05722.

He, Kaiming, Xiangyu Zhang, Shaoqing Ren, and Jian Sun. 2015a. Deep Residual Learning for Image Recognition. Technical report. arXiv:1512.03385.

He, Kaiming, Xiangyu Zhang, Shaoqing Ren, and Jian Sun. 2015b. Delving Deep into Rectifiers: Surpassing Human-Level Performance on ImageNet Classification. Technical report. arXiv:1502.01852.

Henrion, M. 1988. “Propagation of Uncertainty by Logic Sampling in Bayes’ Networks.” In Uncertainty in Artificial Intelligence, edited by J. F. Lemmer and L. N. Kanal, 2:149–164. North Holland.

Higgins, I., L. Matthey, A. Pal, C. Burgess, X. Glorot, M. Botvinik, S. Mohamed, and A. Lerchner. 2017. “β-VAE: learning basic visual concepts with a constrained variational framework.” In Proceedings of the International Conference Learning Representations (ICLR).

Hinton, G. E. 2012. Neural Networks for Machine Learning. Lecture 6.5. Coursera Lectures.

Hinton, G. E., M. Welling, Y. W. Teh, and S Osindero. 2001. “A new view of ICA.” In Proceedings of the International Conference on Independent Component Analysis and Blind Signal Separation, vol. 3.

Hinton, Geoffrey, Oriol Vinyals, and Jeff Dean. 2015. Distilling the Knowledge in a Neural Network. Technical report. arXiv:1503.02531.

Hinton, Geoffrey E. 2002. “Training products of experts by minimizing contrastive divergence.” Neural Computation 14:1771–1800.

Ho, Jonathan, Ajay Jain, and Pieter Abbeel. 2020. Denoising Diffusion Probabilistic Models. Technical report. arXiv:2006.11239.

Ho, Jonathan, Chitwan Saharia, William Chan, David J. Fleet, Mohammad Norouzi, and Tim Salimans. 2021. Cascaded Diffusion Models for High Fidelity Image Generation. Technical report. arXiv:2106.15282.

Hochreiter, S., and J. Schmidhuber. 1997. “Long short-term Memory.” Neural Computation 9 (8): 1735–1780.

Hojen-Sorensen, P. A., O. Winther, and L. K. Hansen. 2002. “Mean field approaches to independent component analysis.” Neural Computation 14 (4): 889–918.

Holtzman, Ari, Jan Buys, Maxwell Forbes, and Yejin Choi. 2019. The Curious Case of Neural Text Degeneration. Technical report. arXiv:1904.09751.

Hornik, K., M. Stinchcombe, and H. White. 1989. “Multilayer feedforward networks are universal approximators.” Neural Networks 2 (5): 359–366.

Hospedales, Timothy, Antreas Antoniou, Paul Micaelli, and Amos Storkey. 2021. “Metalearning in neural networks: A survey.” IEEE Transactions on Pattern Analysis and Machine Intelligence 44 (9): 5149–5169.

Hotelling, H. 1933. “Analysis of a complex of statistical variables into principal components.” Journal of Educational Psychology 24:417– 441.

Hotelling, H. 1936. “Relations between two sets of variables.” Biometrika 28:321–377.

Hu, Anthony, Lloyd Russell, Hudson Yeo, Zak Murez, George Fedoseev, Alex Kendall, Jamie Shotton, and Gianluca Corrado. 2023. GAIA-

1: A Generative World Model for Autonomous Driving. Technical report. arXiv:2309.17080.

Hu, Edward J., Yelong Shen, Phillip Wallis, Zeyuan Allen-Zhu, Yuanzhi Li, Shean Wang, Lu Wang, and Weizhu Chen. 2021. LoRA: Low-Rank Adaptation of Large Language Models. Technical report. arXiv:2106.09685.

Hubel, D. H., and T. N. Wiesel. 1959. “Receptive fields of single neurons in the cat’s striate cortex.” Journal of Physiology 148:574–591.

Hyvarinen, A. 2005. “Estimation of Non-¨ Normalized Statistical Models by Score Matching.” Journal of Machine Learning Research 6:695–709.

Hyvarinen, A., and E. Oja. 1997. “A fast fixed-point¨ algorithm for independent component analysis.” Neural Computation 9 (7): 1483–1492.

Hyvarinen, Aapo, Jarmo Hurri, and Patrick O.¨ Hoyer. 2009. Natural Image Statistics: A Probabilistic Approach to Early Computational Vision. Springer.

Ioffe, S., and C. Szegedy. 2015. “Batch normalization.” In Proceedings of the International Conference on Machine Learning (ICML), 448– 456.

Jacobs, R. A., M. I. Jordan, S. J. Nowlan, and G. E. Hinton. 1991. “Adaptive mixtures of local experts.” Neural Computation 3 (1): 79–87.

Jebara, T. 2004. Machine Learning: Discriminative and Generative. Kluwer.

Jensen, C., A. Kong, and U. Kjaerulff. 1995. “Blocking Gibbs sampling in very large probabilistic expert systems.” International Journal of Human Computer Studies. Special Issue on Real-World Applications of Uncertain Reasoning. 42:647–666.

Jolliffe, I. T. 2002. Principal Component Analysis. Second. Springer.

Jumper, John, Richard Evans, Alexander Pritzel, Tim Green, Michael Figurnov, and Olaf Ronneberger. 2021. “Highly accurate protein structure prediction with AlphaFold.” Nature 596:583–589.

Jutten, C., and J. Herault. 1991. “Blind separation of sources, 1: An adaptive algorithm based on neuromimetic architecture.” Signal Processing 24 (1): 1–10.

Kaplan, Jared, Sam McCandlish, Tom Henighan, Tom B. Brown, Benjamin Chess, Rewon Child, Scott Gray, Alec Radford, Jeffrey Wu, and Dario Amodei. 2020. Scaling Laws for Neural Language Models. Technical report. arXiv:2001.08361.

Karras, Tero, Timo Aila, Samuli Laine, and Jaakko Lehtinen. 2017. Progressive Growing of GANs for Improved Quality, Stability, and Variation. Technical report. arXiv:1710.10196.

Karush, W. 1939. “Minima of functions of several variables with inequalities as side constraints.” Master’s thesis, Department of Mathematics, University of Chicago.

Khosla, Prannay, Piotr Teterwak, Chen Wang, Aaron Sarna, Yonglong Tian, Phillip Isola, Aaron Maschinot, Ce Liu, and Dilip Krishnan. 2020. Supervised Contrastive Learning. Technical report. arXiv:2004.11362.

Kingma, D., and J. Ba. 2014. Adam: A method for stochastic optimization. Technical report. arXiv:1412.6980.

Kingma, D. P., and M. Welling. 2013. “Autoencoding variational Bayes.” In Proceedings of the International Conference on Machine Learning (ICML). ArXiv:1312.6114.

Kingma, Diederik P., and Max Welling. 2019. An Introduction to Variational Autoencoders. Technical report. arXiv:1906.02691.

Kingma, Durk P, Tim Salimans, Rafal Jozefowicz, Xi Chen, Ilya Sutskever, and Max Welling. 2016. “Improved variational inference with inverse autoregressive flow.” Advances in Neural Information Processing Systems 29.

Kipf, Thomas N., and Max Welling. 2016. Semi-Supervised Classification with Graph Convolutional Networks. Technical report. arXiv:1609.02907.

Kloeden, Peter E, and Eckhard Platen. 2013. Numerical solution of stochastic differential

equations. Vol. 23. Stochastic Modelling and Applied Probability. Springer.

Kobyzev, I., S. J. D. Prince, and M. A. Brubaker. 2019. “Normalizing flows: an introduction and review of current methods.” IEEE Transactions on Pattern Analysis and Machine Intelligence 43 (11): 3964–3979.

Krizhevsky, Alex, Ilya Sutskever, and Geoffrey E. Hinton. 2012. “Imagenet classification with deep convolutional neural networks.” In Advances in Neural Information Processing Systems, vol. 25.

Kuhn, H. W., and A. W. Tucker. 1951. “Nonlinear programming.” In Proceedings of the 2nd Berkeley Symposium on Mathematical Statistics and Probabilities, 481–492. University of California Press.

Kullback, S., and R. A. Leibler. 1951. “On information and sufficiency.” Annals of Mathematical Statistics 22 (1): 79–86.

Kurkova, V., and P. C. Kainen. 1994. “Functionally´ Equivalent Feed-forward Neural Networks.” Neural Computation 6 (3): 543–558.

Lasserre, J., Christopher M. Bishop, and T. Minka. 2006. “Principled hybrids of generative and discriminative models.” In Proceedings 2006 IEEE Conference on Computer Vision and Pattern Recognition, New York.

Lauritzen, S. L. 1996. Graphical Models. Oxford University Press.

Lawley, D. N. 1953. “A Modified Method of Estimation in Factor Analysis and Some Large Sample Results.” In Uppsala Symposium on Psychological Factor Analysis, 35–42. Number 3 in Nordisk Psykologi Monograph Series. Uppsala: Almqvist / Wiksell.

Lazarsfeld, P. F., and N. W. Henry. 1968. Latent Structure Analysis. Houghton Mifflin.

LeCun, Y., B. Boser, J. S. Denker, D. Henderson, R. E. Howard, W. Hubbard, and L. D. Jackel. 1989. “Backpropagation Applied to Handwritten ZIP Code Recognition.” Neural Computation 1 (4): 541–551.

LeCun, Y., L. Bottou, Y. Bengio, and P. Haffner. 1998. “Gradient-Based Learning Applied to Document Recognition.” Proceedings of the IEEE 86:2278–2324.

LeCun, Y., J. S. Denker, and S. A. Solla. 1990. “Optimal Brain Damage.” In Proceedings International Conference on Neural Information Processing Systems (NeurIPS), edited by D. S. Touretzky, 2:598–605. Morgan Kaufmann.

LeCun, Yann, Yoshua Bengio, and Geoffrey Hinton. 2015. “Deep Learning.” Nature 512:436–444.

LeCun, Yann, Sumit Chopra, Raia Hadsell, Marc’Aurelio Ranzato, and Fu-Jie Huang. 2006. “A Tutorial on Energy-Based Learning.” In Predicting Structured Data, edited by G. Bakir, T. Hofman, B. Scholkopf, A. Smola,¨ and B. Taskar. MIT Press.

Leen, T. K. 1995. “From data distributions to regularization in invariant learning.” Neural Computation 7:974–981.

Leshno, M., V. Y. Lin, A. Pinkus, and S. Schocken. 1993. “Multilayer feedforward networks with a polynomial activation function can approximate any function.” Neural Networks 6:861– 867.

Li, Hao, Zheng Xu, Gavin Taylor, Christoph Studer, and Tom Goldstein. 2017. Visualizing the Loss Landscape of Neural Nets. Technical report. arXiv:1712.09913.

Li, Junnan, Dongxu Li, Caiming Xiong, and Steven Hoi. 2022. BLIP: Bootstrapping Language-Image Pre-training for Unified Vision-Language Understanding and Generation. Technical report. arXiv:2201.12086.

Lin, Min, Qiang Chen, and Shuicheng Yan. 2013. Network in Network. Technical report. arXiv:1312.4400.

Lin, Tianyang, Yuxin Wang, Xiangyang Liu, and Xipeng Qiu. 2021. A Survey of Transformers. Technical report. arXiv:2106.04554.

Lipman, Yaron, Ricky T. Q. Chen, Heli Ben-Hamu, Maximilian Nickel, and Matt Le. 2022. Flow Matching for Generative Modeling. Technical report arXiv:2210.02747. https://arxiv.org/.

Liu, Pengfei, Weizhe Yuan, Jinlan Fu, Zhengbao Jiang, Hiroaki Hayashi, and Graham Neubig. 2021. Pre-train, Prompt, and Predict: A Systematic Survey of Prompting Methods in Natural Language Processing. Technical report. arXiv:2107.13586.

Lloyd, S. P. 1982. “Least squares quantization in PCM.” IEEE Transactions on Information Theory 28 (2): 129–137.

Long, Jonathan, Evan Shelhamer, and Trevor Darrell. 2014. Fully Convolutional Networks for Semantic Segmentation. Technical report. arXiv:1411.4038.

Luo, Calvin. 2022. Understanding Diffusion Models: A Unified Perspective. Technical report. arXiv:2208.11970.

Lutkepohl, H. 1996.¨ Handbook of Matrices. Wiley.

MacKay, D. J. C. 1992. “A Practical Bayesian Framework for Back-propagation Networks.” Neural Computation 4 (3): 448–472.

MacKay, D. J. C. 2003. Information Theory, Inference and Learning Algorithms. Cambridge University Press.

MacQueen, J. 1967. “Some methods for classification and analysis of multivariate observations.” In Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability, edited by L. M. LeCam and J. Neyman, I:281–297. University of California Press.

Magnus, J. R., and H. Neudecker. 1999. Matrix Differential Calculus with Applications in Statistics and Econometrics. Wiley.

Mallat, S. 1999. A Wavelet Tour of Signal Processing. Second. Academic Press.

Mao, X., Q. Li, H. Xie, R. Lau, Z. Wang, and S. Smolley. 2016. Least Squares Generative Adversarial Networks. Technical report. arXiv:1611.04076.

Mardia, K. V., and P. E. Jupp. 2000. Directional Statistics. Wiley.

Martens, James, Ilya Sutskever, and Kevin Swersky. 2012. “Estimating the Hessian by Backpropagating Curvature.” In Proceedings of the

International Conference on Machine Learning (ICML). ArXiv:1206.6464.

McCullagh, P., and J. A. Nelder. 1989. Generalized Linear Models. Second. Chapman / Hall.

McCulloch, W. S., and W. Pitts. 1943. “A Logical Calculus of the Ideas Immanent in Nervous Activity.” Reprinted in Anderson and Rosenfeld (1988), Bulletin of Mathematical Biophysics 5:115–133.

McLachlan, G. J., and T. Krishnan. 1997. The EM Algorithm and its Extensions. Wiley.

McLachlan, G. J., and D. Peel. 2000. Finite Mixture Models. Wiley.

Meng, X. L., and D. B. Rubin. 1993. “Maximum likelihood estimation via the ECM algorithm: a general framework.” Biometrika 80:267–278.

Mescheder, L., A. Geiger, and S. Nowozin. 2018. Which Training Methods for GANs do actually Converge? Technical report. arXiv:1801.04406.

Metropolis, N., A. W. Rosenbluth, M. N. Rosenbluth, A. H. Teller, and E. Teller. 1953. “Equation of State Calculations by Fast Computing Machines.” Journal of Chemical Physics 21 (6): 1087–1092.

Metropolis, N., and S. Ulam. 1949. “The Monte Carlo method.” Journal of the American Statistical Association 44 (247): 335–341.

Mikolov, Tomas, Kai Chen, Greg Corrado, and Jeffrey Dean. 2013. Efficient Estimation of Word Representations in Vector Space. Technical report. arXiv:1301.3781.

Minsky, M. L., and S. A. Papert. 1969. Perceptrons. Expanded edition 1990. MIT Press.

Mirza, M., and S. Osindero. 2014. Conditional Generative Adversarial Nets. Technical report. arXiv:1411.1784.

Miskin, J. W., and D. J. C. MacKay. 2001. “Ensemble learning for blind source separation.” In Independent Component Analysis: Principles and Practice, edited by S. J. Roberts and R. M. Everson. Cambridge University Press.

Møller, M. 1993. “Efficient Training of Feed-Forward Neural Networks.” PhD diss., Aarhus University, Denmark.

Montufar, G. F., R. Pascanu, K. Cho, and Y.´ Bengio. 2014. “On the number of linear regions of deep neural networks.” In Proceedings of the International Conference on Neural Information Processing Systems (NeurIPS). ArXiv:1402.1869.

Mordvintsev, Alexander, Christopher Olah, and Mike Tyka. 2015. Inceptionism: Going Deeper into Neural Networks. Google AI blog.

Murphy, Kevin P. 2022. Probabilistic Machine Learning: An introduction. MIT Press. probml. ai.

Murphy, Kevin P. 2023. Probabilistic Machine Learning: Advanced Topics. MIT Press. http: //probml.github.io/book2.

Nakkiran, Preetum, Gal Kaplun, Yamini Bansal, Tristan Yang, Boaz Barak, and Ilya Sutskever. 2019. Deep Double Descent: Where Bigger Models and More Data Hurt. Technical report. arXiv:1912.02292.

Neal, R. M. 1993. Probabilistic inference using Markov chain Monte Carlo methods. Technical report CRG-TR-93-1. Department of Computer Science, University of Toronto, Canada.

Neal, R. M. 1999. “Suppressing random walks in Markov chain Monte Carlo using ordered overrelaxation.” In Learning in Graphical Models, edited by Michael I. Jordan, 205–228. MIT Press.

Neal, R. M., and G. E. Hinton. 1999. “A new view of the EM algorithm that justifies incremental and other variants.” In Learning in Graphical Models, edited by M. I. Jordan, 355–368. MIT Press.

Nelder, J. A., and R. W. M. Wedderburn. 1972. “Generalized linear models.” Journal of the Royal Statistical Society, A 135:370–384.

Nesterov, Y. 2004. Introductory Lectures on Convex Optimization: A Basic Course. Kluwer.

Nichol, Alex, and Prafulla Dhariwal. 2021. Improved Denoising Diffusion Probabilistic Models. Technical report. arXiv:2102.09672.

Nichol, Alex, Prafulla Dhariwal, Aditya Ramesh, Pranav Shyam, Pamela Mishkin, Bob Mc-Grew, Ilya Sutskever, and Mark Chen. 2021. GLIDE: Towards Photorealistic Image Generation and Editing with Text-Guided Diffusion Models. Technical report. arXiv:2112.10741.

Nocedal, J., and S. J. Wright. 1999. Numerical Optimization. Springer.

Noh, Hyeonwoo, Seunghoon Hong, and Bohyung Han. 2015. Learning Deconvolution Network for Semantic Segmentation. Technical report. arXiv:1505.04366.

Nowlan, S. J., and G. E. Hinton. 1992. “Simplifying neural networks by soft weight sharing.” Neural Computation 4 (4): 473–493.

Ogden, R. T. 1997. Essential Wavelets for Statistical Applications and Data Analysis. Birkhauser.¨

Oord, Aaron van den, Nal Kalchbrenner, and Koray Kavukcuoglu. 2016. Pixel Recurrent Neural Networks. Technical report. arXiv:1601.06759.

Oord, Aaron van den, Nal Kalchbrenner, Oriol Vinyals, Lasse Espeholt, Alex Graves, and Koray Kavukcuoglu. 2016. Conditional Image Generation with PixelCNN Decoders. Technical report. arXiv:1606.05328.

Oord, Aaron van den, Yazhe Li, and Oriol Vinyals. 2018. Representation Learning with Contrastive Predictive Coding. Technical report. arXiv:1807.03748.

Oord, Aaron van den, Oriol Vinyals, and Koray Kavukcuoglu. 2017. Neural Discrete Representation Learning. Technical report. arXiv:1711.00937.

OpenAI. 2023. GPT-4 Technical Report. Technical report. arXiv:2303.08774.

Opper, M., and O. Winther. 2000. “Gaussian processes and SVM: mean field theory and leaveone-out.” In Advances in Large Margin Classifiers, edited by A. J. Smola, P. L. Bartlett, B.

Scholkopf, and D. Shuurmans, 311–326. MIT¨ Press.

Papamakarios, G., T. Pavlakou, and Iain Murray. 2017. “Masked Autoregressive Flow for Density Estimation.” In Proceedings of the International Conference on Neural Information Processing Systems (NeurIPS), vol. 30.

Papamakarios, George, Eric Nalisnick, Danilo Jimenez Rezende, Shakir Mohamed, and Balaji Lakshminarayanan. 2019. Normalizing Flows for Probabilistic Modeling and Inference. Technical report. arXiv:1912.02762.

Parisi, Giorgio. 1981. “Correlation functions and computer simulations.” Nuclear Physics B 180:378–384.

Pearl, J. 1988. Probabilistic Reasoning in Intelligent Systems. Morgan Kaufmann.

Pearlmutter, B. A. 1994. “Fast exact multiplication by the Hessian.” Neural Computation 6 (1): 147–160.

Pearlmutter, B. A., and L. C. Parra. 1997. “Maximum likelihood source separation: a contextsensitive generalization of ICA.” In Advances in Neural Information Processing Systems, edited by M. C. Mozer, M. I. Jordan, and T. Petsche, 9:613–619. MIT Press.

Pearson, Karl. 1901. “On lines and planes of closest fit to systems of points in space.” The London, Edinburgh and Dublin Philosophical Magazine and Journal of Science, Sixth Series 2:559–572.

Phuong, Mary, and Marcus Hutter. 2022. Formal Algorithms for Transformers. Technical report. arXiv:2207.09238.

Prince, Simon J.D. 2020. Variational autoencoders. Https://www.borealisai.com/researchblogs/tutorial-5-variational-auto-encoders.

Prince, Simon J.D. 2023. Understanding Deep Learning. MIT Press. http://udlbook.com.

Radford, A., L. Metz, and S. Chintala. 2015. Unsupervised representation learning with deep convolutional generative adversarial networks. Technical report. arXiv:1511.06434.

Radford, Alec, Jong Wook Kim, Chris Hallacy, Aditya Ramesh, Gabriel Goh, Sandhini Agarwal, Girish Sastry, et al. 2021. Learning Transferable Visual Models From Natural Language Supervision. Technical report. arXiv:2103.00020.

Radford, Alec, Jeff Wu, Rewon Child, David Luan, Dario Amodei, and Ilya Sutskever. 2019. Language Models are Unsupervised Multitask Learners. Technical report. OpenAI.

Rakhimov, Ruslan, Denis Volkhonskiy, Alexey Artemov, Denis Zorin, and Evgeny Burnaev. 2020. Latent Video Transformer. Technical report. arXiv:2006.10704.

Ramachandran, P., B. Zoph, and Q. V. Le. 2017. Searching for Activation Functions. Technical report. arXiv:1710.05941v2.

Rao, C. R., and S. K. Mitra. 1971. Generalized Inverse of Matrices and Its Applications. Wiley.

Redmon, Joseph, Santosh Kumar Divvala, Ross B. Girshick, and Ali Farhadi. 2015. You Only Look Once: Unified, Real-Time Object Detection. Technical report. arxiv:1506.02640.

Ren, Shaoqing, Kaiming He, Ross B. Girshick, and Jian Sun. 2015. Faster R-CNN: Towards Real-Time Object Detection with Region Proposal Networks. Technical report. arxiv:1506.01497.

Rezende, Danilo J, Shakir Mohamed, and Daan Wierstra. 2014. “Stochastic backpropagation and approximate inference in deep generative models.” In Proceedings of the 31st International Conference on Machine Learning (ICML-14), 1278–1286.

Ricotti, L. P., S. Ragazzini, and G. Martinelli. 1988. “Learning of word stress in a sub-optimal second order backpropagation neural network.” In Proceedings of the IEEE International Conference on Neural Networks, 1:355–361. IEEE.

Robert, C. P., and G. Casella. 1999. Monte Carlo Statistical Methods. Springer.

Rombach, Robin, Andreas Blattmann, Dominik Lorenz, Patrick Esser, and Bjorn Ommer.¨ 2021. High-Resolution Image Synthesis with

Latent Diffusion Models. Technical report. arXiv:2112.10752.

Ronneberger, Olaf, Philipp Fischer, and Thomas Brox. 2015. “U-Net: Convolutional Networks for Biomedical Image Segmentation.” In Medical Image Computing and Computer-Assisted Intervention – MICCAI, edited by N. Navab, J. Hornegger, W. Wells, and A. Frangi. Springer.

Rosenblatt, F. 1962. Principles of Neurodynamics: Perceptrons and the Theory of Brain Mechanisms. Spartan.

Roweis, S. 1998. “EM algorithms for PCA and SPCA.” In Advances in Neural Information Processing Systems, edited by M. I. Jordan, M. J. Kearns, and S. A. Solla, 10:626–632. MIT Press.

Roweis, S., and Z. Ghahramani. 1999. “A unifying review of linear Gaussian models.” Neural Computation 11 (2): 305–345.

Rubin, D. B., and D. T. Thayer. 1982. “EM algorithms for ML factor analysis.” Psychometrika 47 (1): 69–76.

Rumelhart, D. E., G. E. Hinton, and R. J. Williams. 1986. “Learning internal representations by error propagation.” In Parallel Distributed Processing: Explorations in the Microstructure of Cognition, edited by D. E. Rumelhart, J. L. McClelland, and the PDP Research Group, vol. 1: Foundations, 318–362. Reprinted in Anderson and Rosenfeld (1988). MIT Press.

Ruthotto, L., and E. Haber. 2021. An introduction to deep generative modeling. Technical report. arXiv:2103.05180.

Sagan, H. 1969. Introduction to the Calculus of Variations. Dover.

Saharia, Chitwan, William Chan, Huiwen Chang, Chris A. Lee, Jonathan Ho, Tim Salimans, David J. Fleet, and Mohammad Norouzi. 2021. Palette: Image-to-Image Diffusion Models. Technical report. arXiv:2111.05826.

Saharia, Chitwan, William Chan, Saurabh Saxena, Lala Li, Jay Whang, Emily Denton, Seyed Kamyar Seyed Ghasemipour, et al. 2022. Photorealistic Text-to-Image Diffusion Models

with Deep Language Understanding. Technical report. arXiv:2205.11487.

Saharia, Chitwan, Jonathan Ho, William Chan, Tim Salimans, David J. Fleet, and Mohammad Norouzi. 2021. Image Super-Resolution via Iterative Refinement. Technical report. arXiv:2104.07636.

Santurkar, S., D. Tsipras, A. Ilyas, and A. Madry. 2018. How does batch normalization help optimization? Technical report. arXiv:1805.11604.

Satorras, Victor Garcia, Emiel Hoogeboom, and Max Welling. 2021. E(n) Equivariant Graph Neural Networks. Technical report. arXiv:2102.09844.

Scholkopf, B., and A. J. Smola. 2002. ¨ Learning with Kernels. MIT Press.

Schuhmann, Christoph, Richard Vencu, Romain Beaumont, Robert Kaczmarczyk, Clayton Mullis, Aarush Katta, Theo Coombes, Jenia Jitsev, and Aran Komatsuzaki. 2021. LAION-400M: Open Dataset of CLIP-Filtered 400 Million Image-Text Pairs. Technical report. arXiv:2111.02114.

Schuster, Mike, and Kaisuke Nakajima. 2012. “Japanese and Korean voice search.” In 2012 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP), 5149–5152.

Selvaraju, Ramprasaath R., Abhishek Das, Ramakrishna Vedantam, Michael Cogswell, Devi Parikh, and Dhruv Batra. 2016. Grad-CAM: Visual Explanations from Deep Networks via Gradient-based Localization. Technical report. arXiv:1610.02391.

Sennrich, Rico, Barry Haddow, and Alexandra Birch. 2015. Neural Machine Translation of Rare Words with Subword Units. Technical report. arXiv:1508.07909.

Sermanet, Pierre, David Eigen, Xiang Zhang, Michael Mathieu, Rob Fergus, and Yann LeCun. 2013. OverFeat: Integrated Recognition, Localization and Detection using Convolutional Networks. Technical report. arXiv:1312.6229.

Shachter, R. D., and M. Peot. 1990. “Simulation Approaches to General Probabilistic Inference on Belief Networks.” In Uncertainty in Artificial Intelligence, edited by P. P. Bonissone, M. Henrion, L. N. Kanal, and J. F. Lemmer, vol. 5. Elsevier.

Shannon, C. E. 1948. “A mathematical theory of communication.” The Bell System Technical Journal 27 (3): 379–423 and 623–656.

Shen, Sheng, Zhen Dong, Jiayu Ye, Linjian Ma, Zhewei Yao, Amir Gholami, Michael W. Mahoney, and Kurt Keutzer. 2019. Q-BERT: Hessian Based Ultra Low Precision Quantization of BERT. Technical report. arXiv:1909.05840.

Simard, P., B. Victorri, Y. LeCun, and J. Denker. 1992. “Tangent prop – a formalism for specifying selected invariances in an adaptive network.” In Advances in Neural Information Processing Systems, edited by J. E. Moody, S. J. Hanson, and R. P. Lippmann, 4:895–903. Morgan Kaufmann.

Simard, P. Y., D. Steinkraus, and J. Platt. 2003. “Best practice for convolutional neural networks applied to visual document analysis.” In Proceedings International Conference on Document Analysis and Recognition (ICDAR), 958–962. IEEE Computer Society.

Simonyan, Karen, Andrea Vedaldi, and Andrew Zisserman. 2013. “Deep Inside Convolutional Networks: Visualising Image Classification Models and Saliency Maps.” In Computer Vision and Pattern Recognition. ArXiv:1312.6034.

Simonyan, Karen, and Andrew Zisserman. 2014. Very Deep Convolutional Networks for Large-Scale Image Recognition. Technical report. arXiv:1409.1556.

Sirovich, L. 1987. “Turbulence and the Dynamics of Coherent Structures.” Quarterly Applied Mathematics 45 (3): 561–590.

Sohl-Dickstein, Jascha, Eric A. Weiss, Niru Maheswaranathan, and Surya Ganguli. 2015. Deep Unsupervised Learning using Nonequi-

librium Thermodynamics. Technical report. arXiv:1503.03585.

Sønderby, C., J. Caballero, L. Theis, W. Shi, and F. Huszar. 2016.´ Amortised MAP inference for image super-resolution. Technical report. arXiv:1610.04490.

Song, Jiaming, Chenlin Meng, and Stefano Ermon. 2020. Denoising Diffusion Implicit Models. Technical report. arXiv:2010.02502.

Song, Yang, and Stefano Ermon. 2019. “Generative Modeling by Estimating Gradients of the Data Distribution.” In Advances in Neural Information Processing Systems, 11895–11907. ArXiv:1907.05600.

Song, Yang, Sahaj Garg, Jiaxin Shi, and Stefano Ermon. 2019. “Sliced score matching: A scalable approach to density and score estimation.” In Uncertainty in Artificial Intelligence, 204. ArXiv:1905.07088.

Song, Yang, and Diederik P. Kingma. 2021. How to Train Your Energy-Based Models. Technical report. arXiv:2101.03288.

Song, Yang, Jascha Sohl-Dickstein, Diederik P. Kingma, Abhishek Kumar, Stefano Ermon, and Ben Poole. 2020. Score-Based Generative Modeling through Stochastic Differential Equations. Technical report. arXiv:2011.13456.

Srivastava, N., G. Hinton, A. Krizhevsky, I. Sutskever, and R. Salakhutdinov. 2014. “Dropout: A Simple Way to Prevent Neural Networks from Overfitting.” Journal of Machine Learning Research 15:1929–1958.

Stone, J. V. 2004. Independent Component Analysis: A Tutorial Introduction. MIT Press.

Sutskever, I., J. Martens, G. Dahl, and G. E. Hinton. 2013. “On the importance of initialization and momentum in deep learning.” In Proceedings of the International Conference on Machine Learning (ICML).

Sutton, R. 2019. The Bitter Lesson. URL: incompleteideas.net/IncIdeas/BitterLesson.html.

Szegedy, Christian, Wojciech Zaremba, Ilya Sutskever, Joan Bruna, Dumitru Erhan, Ian Goodfellow, and Rob Fergus. 2013. Intriguing properties of neural networks. Technical report. arXiv:1312.6199.

Szeliski, R. 2022. Computer Vision: Algorithms and Applications. Second. Springer.

Tarassenko, L. 1995. “Novelty detection for the identification of masses in mamograms.” In Proceedings of the Fourth IEE International Conference on Artificial Neural Networks, 4:442–447. IEE.

Tay, Yi, Mostafa Dehghani, Dara Bahri, and Donald Metzler. 2020. Efficient Transformers: A Survey. Technical report. arXiv:2009.06732.

Tibshirani, R. 1996. “Regression shrinkage and selection via the lasso.” Journal of the Royal Statistical Society, B 58:267–288.

Tipping, M. E., and Christopher M. Bishop. 1997. Probabilistic Principal Component Analysis. Technical report NCRG/97/010. Neural Computing Research Group, Aston University.

Tipping, M. E., and Christopher M. Bishop. 1999. “Probabilistic Principal Component Analysis.” Journal of the Royal Statistical Society, Series B 21 (3): 611–622.

Vapnik, V. N. 1995. The nature of statistical learning theory. Springer.

Vaswani, Ashish, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, and Illia Polosukhin. 2017. Attention Is All You Need. Technical report. arXiv:1706.03762.

Velickovi ˇ c, Petar. 2023. ´ Everything is Connected: Graph Neural Networks. Technical report. arXiv:2301.08210.

Velickovi ˇ c, Petar, Guillem Cucurull, Arantxa´ Casanova, Adriana Romero, Pietro Lio, and\` Yoshua Bengio. 2017. Graph Attention Networks. Technical report. arXiv:1710.10903.

Vidakovic, B. 1999. Statistical Modelling by Wavelets. Wiley.

Vig, Jesse, Ali Madani, Lav R. Varshney, Caiming Xiong, Richard Socher, and Nazneen Fatema Rajani. 2020. BERTology Meets Biology: Interpreting Attention in Protein Language Models. Technical report. arXiv:2006.15222.

Vincent, P. 2011. “A connection between score matching and denoising autoencoders.” Neural Computation 23:1661–1674.

Vincent, Pascal, Hugo Larochelle, Yoshua Bengio, and Pierre-Antoine Manzagol. 2008. “Extracting and Composing Robust Features with Denoising Autoencoders.” In Proceedings of the International Conference on Machine Learning (ICML).

Walker, A. M. 1969. “On the asymptotic behaviour of posterior distributions.” Journal of the Royal Statistical Society, B 31 (1): 80–88.

Wang, Chengyi, Sanyuan Chen, Yu Wu, Ziqiang Zhang, Long Zhou, Shujie Liu, Zhuo Chen, et al. 2023. Neural Codec Language Models are Zero-Shot Text to Speech Synthesizers. Technical report. arXiv:2301.02111.

Weisstein, E. W. 1999. CRC Concise Encyclopedia of Mathematics. Chapman / Hall, / CRC.

Welling, Max, and Yee Whye Teh. 2011. “Bayesian Learning via Stochastic Gradient Langevin Dynamics.” In Proceedings of the International Conference on Machine Learning (ICML).

Williams, P. M. 1996. “Using neural networks to model conditional multivariate densities.” Neural Computation 8 (4): 843–854.

Williams, R J. 1992. “Simple statistical gradientfollowing algorithms for connectionist reinforcement learning.” Machine Learning 8:229–256.

Winn, J., C. M. Bishop, T. Diethe, J. Guiver, and Y. Zaykov. 2023. Model-Based Machine Learning. Www.mbmlbook.com. Chapman / Hall.

Wolpert, D. H. 1996. “The lack of a-priori distinctions between learning algorithms.” Neural Computation 8:1341–1390.

Wu, Zhirong, Yuanjun Xiong, Stella Yu, and Dahua Lin. 2018. Unsupervised Feature Learning via Non-Parametric Instance-level Discrimination. Technical report. arXiv:1805.01978.

Wu, Zonghan, Shirui Pan, Fengwen Chen, Guodong Long, Chengqi Zhang, and Philip S. Yu. 2019. A Comprehensive Survey on Graph Neural Networks. Technical report. arXiv:1901.00596.

Yan, Wilson, Yunzhi Zhang, Pieter Abbeel, and Aravind Srinivas. 2021. VideoGPT: Video Generation using VQ-VAE and Transformers. Technical report. arXiv:2104.10157.

Yang, Ruihan, Prakhar Srivastava, and Stephan Mandt. 2022. Diffusion Probabilistic Modeling for Video Generation. Technical report. arXiv:2203.09481.

Yilmaz, Fatih Furkan, and Reinhard Heckel. 2022. Regularization-wise double descent: Why it occurs and how to eliminate it. Technical report. arXiv:2206.01378.

Yosinski, Jason, Jeff Clune, Anh Mai Nguyen, Thomas J. Fuchs, and Hod Lipson. 2015. Understanding Neural Networks Through Deep Visualization. Technical report. arXiv:1506.06579.

Yu, Jiahui, Xin Li, Jing Yu Koh, Han Zhang, Ruoming Pang, James Qin, Alexander Ku, Yuanzhong Xu, Jason Baldridge, and Yonghui Wu. 2021. Vector-quantized Image Modeling with Improved VQGAN. Technical report. arXiv:2110.04627.

Yu, Jiahui, Yuanzhong Xu, Jing Yu Koh, Thang Luong, Gunjan Baid, Zirui Wang, Vijay Vasudevan, et al. 2022. Scaling Autoregressive Models for Content-Rich Text-to-Image Generation. Technical report. arXiv:2206.10789.

Yu, Lili, Bowen Shi, Ramakanth Pasunuru, Benjamin Muller, Olga Golovneva, Tianlu Wang, Arun Babu, et al. 2023. Scaling Autoregressive Multi-Modal Models: Pretraining and Instruction Tuning. Technical report. arXiv:2309.02591.

Zaheer, Manzil, Satwik Kottur, Siamak Ravanbakhsh, Barnabas Poczos, Ruslan Salakhutdinov, and Alexander Smola. 2017. Deep Sets. Technical report. arXiv:1703.06114.

Zarchan, P., and H. Musoff. 2005. Fundamentals of Kalman Filtering: A Practical Approach. Second. AIAA.

Zeiler, Matthew D., and Rob Fergus. 2013. Visualizing and Understanding Convolutional Networks. Technical report. arXiv:1311.2901.

Zhang, Chiyuan, Samy Bengio, Moritz Hardt, Benjamin Recht, and Oriol Vinyals. 2016. Understanding deep learning requires rethinking generalization. Technical report. arXiv:1611.03530.

Zhao, Wayne Xin, Kun Zhou, Junyi Li, Tianyi Tang, Xiaolei Wang, Yupeng Hou, Yingqian Min, et al. 2023. A Survey of Large Language Models. Technical report. arXiv:2303.18223.

Zhou, Jie, Ganqu Cui, Shengding Hu, Zhengyan Zhang, Cheng Yang, Zhiyuan Liu, Lifeng Wang, Changcheng Li, and Maosong Sun. 2018. Graph Neural Networks: A Review of Methods and Applications. Technical report. arXiv:1812.08434.

Zhou, Y., and R. Chellappa. 1988. “Computation of optic flow using a neural network.” In International Conference on Neural Networks, 71–78. IEEE.

Zhu, J-Y, T. Park, P. Isola, and A. Efros. 2017. Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks. Technical report. arXiv:1703.10593.

## Index

Page numbers in bold indicate the primary source of information for the corresponding topic.

1 1 convolution, 296   
1-of-K coding, 68, 135, 460   
acceptance criterion, 441, 445, 448   
activation, 17   
activation function, 17, 158, 180, 182   
active constraint, 623   
AdaGrad, 223   
Adam optimization, 224   
adaptive rejection sampling, 435   
adjacency matrix, 410   
adjoint sensitivity method, 556   
adversarial attack, 306   
aggregation, 415   
aleatoric uncertainty, 23   
AlexNet, 300   
alpha family, 61   
amortized inference, 572   
ancestral sampling, 450   
anchor, 191   
annealed Langevin dynamics, 598   
AR model, see autoregressive model   
area under the ROC curve, 149   
artificial intelligence, 1   
attention, 358   
attention head, 366   
audio data, 399   
auto-associative neural network, see au   
autoencoder, 188, 563   
automatic differentiation, 22, 233, 244   
autoregressive flow, 552   
autoregressive model, 5, 350, 379   
average pooling, 297   
backpropagation, 19, 233   
backpropagation through time, 381   
bag of words, 378   
bagging, 278   
base distribution, 547   
basis function, 112, 158, 172, 172   
batch gradient descent, 214   
batch learning, 117   
batch normalization, 227   
Bayes net, 326   
Bayes’ theorem, 28   
Bayesian network, 326   
Bayesian probability, 54   
beam search, 386   
Bernoulli distribution, 66, 94   
Bernoulli mixture model, 481   
BERT, 388   
bi-gram model, 379   
bias, 39, 125   
bias parameter, 112, 132, 180   
bias–variance trade-off, 123   
BigGAN, 539   
bijective function, 548   
binomial distribution, 67   
bits, 46   
blind source separation, 514   
blocked path, 339, 343   
boosting, 279   
bootstrap, 278   
bottleneck, 382   
bounding box, 309   
Box–Muller method, 432   
byte pair encoding, 377   
canonical correlation analysis, 501   
canonical link function, 164   
Cauchy distribution, 432   
causal attention, 384   
causality, 347   
central differences, 239   
central limit theorem, 71   
ChatGPT, 394   
child node, 249, 327   
Cholesky decomposition, 433   
circular normal distribution, 89   
classical probability, 54   
classification, 3   
CLIP, 192   
co-parents, 348   
codebook vector, 398, 465   
collider node, 341   
combining models, 146   
committee, 277   
complete data set, 476   
completing the square, 77   
computer vision, 288   
concave function, 52   
concentration parameter, 92   
condition number, 220   
conditional entropy, 53   
conditional expectation, 35   
conditional independence, 146, 337   
conditional mixture model, 199   
conditional probability, 27   
conditional VAE, 576   
conditioner, 552   
confusion matrix, 147   
continuous bag of words, 375   
continuous normalizing flow, 557   
contrastive divergence, 455   
contrastive learning, 191   
convex function, 51   
convolution, 290, 322   
convolutional network, 287   
correlation matrix, 503   
cost function, 140   
coupling flow, 549   
coupling function, 552   
covariance, 35   
Cox’s axioms, 54   
cross attention, 390   
cross-correlation, 292, 322   
cross-entropy error function, 160, 162, 196   
cross-validation, 14   
cumulative distribution function, 32   
curse of dimensionality, 172   
curve fitting, 6   
CycleGAN, 539   
d-separation, 338, 343, 479   
DAG, see directed acyclic graph   
data augmentation, 192, 257   
data compression, 465   
DDIM, 594   
DDPM, 581   
decision, 120   
decision boundary, 131, 139   
decision region, 131, 139   
decision surface, see decision boundary   
decision theory, 120, 138   
decoder, 563   
deep double descent, 268   
deep learning, 20   
deep neural networks, 20   
deep sets, 417   
DeepDream, 308   
degrees of freedom, 495   
denoising, 581   
denoising autoencoder, 567   
denoising diffusion implicit model, 594   
denoising diffusion probabilistic model, 581   
denoising score matching, 597   
density estimation, 37, 65   
dequantization, 526   
descendant node, 341   
design matrix, 116   
development set, 14   
diagonal covariance matrix, 75   
differential entropy, 50   
diffusion kernel, 583   
diffusion model, 581   
Dirac delta function, 34   
directed acyclic graph, 329   
directed cycle, 329   
directed factorization, 349   
directed graph, 326   
directed graphical model, 326   
discriminant function, 132, 143   
discriminative model, 144, 157, 346   
disentangled representations, 542   
distributed representation, 187   
dot-product attention, 363   
double descent, 268   
dropout, 279   
E step, 472, 476   
early stopping, 266   
earth mover’s distance, 538   
ECM, see expectation conditional maximization   
edge, 326, 410   
edge detection, 292   
ELBO, see evidence lower bound   
EM, see expectation maximization   
embedding space, 188   
embedding vector, 409   
encoder, 563   
energy function, 452   
energy-based models, 452   
ensemble methods, 277   
entropy, 46   
epistemic uncertainty, 23   
epoch, 215   
equality constraint, 623   
equivariance, 259, 292, 296, 371, 412   
erf function, 164   
error backpropagation, see backpropagation   
error function, 8, 55, 194, 210   
Euler–Lagrange equations, 619   
evaluation trace, 247   
evidence lower bound, 485, 516, 570, 588   
expectation, 34   
expectation conditional maximization, 489   
expectation maximization, 470, 474, 517, 519   
expectation step, see E step   
expectations, 430   
explaining away, 343   
exploding gradient, 227, 382   
exponential distribution, 34, 431   
exponential family, 94, 156, 329   
expression swell, 245   
factor analysis, 513   
factor graph, 327   
factor loading, 513   
false negative, 25   
false positive, 25   
fast gradient sign method, 306   
fast R-CNN, 314   
feature extraction, 20, 113   
feature map, 291   
features, 179   
feed-forward network, 172, 193   
feed-forward networks, 19   
few-shot learning, 191, 394   
filter, 291   
fine-tuning, 3, 22, 189, 392   
flow matching, 558   
forward kinematics, 199   
forward problem, 198   
forward propagation, 235   
foundation model, 22, 358, 392, 409   
frequentist probability, 54   
fuel system, 341   
fully connected graphical model, 328   
fully convolutional network, 318   
functional, 617   
Gabor filters, 302   
gamma distribution, 434   
GAN, see generative adversarial network   
gated recurrent unit, 382   
Gaussian, 36, 70   
Gaussian mixture, 86, 200, 271, 466   
GEM, see generalized EM algorithm   
generalization, 6   
generalized EM algorithm, 489   
generalized linear model, 158, 165   
generative adversarial network, 533   
generative AI, 4   
generative model, 4, 144, 346, 533   
generative pre-trained transformer, 6, 383   
geometric deep learning, 424   
Gibbs sampling, 446   
global minimum, 211   
GNN, see graph neural network   
GPT, see generative pre-trained transformer   
GPU, see graphics processing unit   
gradient descent, 209   
graph attention network, 421   
graph convolutional network, 414   
graph neural network, 407   
graph representation learning, 409   
graphical model, 326   
graphical model factorization, 329   
graphics processing unit, 20, 358   
group theory, 256   
guidance, 600   
Hadamard product, 550   
Hamiltonian Monte Carlo, 451   
handwritten digit, 501   
He initialization, 216   
head-to-head path, 341   
head-to-tail path, 340   
Heaviside step function, 161   
Hessian matrix, 211, 242   
Hessian outer product approximation, 243   
heteroscedastic, 200   
hidden Markov model, 380, 480   
hidden unit, 19, 180   
hidden variable, see latent variable   
hierarchical representation, 187   
histogram density estimation, 98   
history of machine learning, 16   
hold-out set, 14   
homogeneous Markov chain, 443   
Hooke’s law, 520   
Hutchinson’s trace estimator, 557   
hybrid Monte Carlo, 451   
hyperparameter, 14   
IAF, see inverse autoregressive flow   
ICA, see independent component analysis   
identifiability, 470   
IID, see independent and identically distributed   
image segmentation, 315   
ImageNet data set, 299   
importance sampling, 437, 450   
importance weight, 437   
improper distribution, 33   
improper prior, 263   
inactive constraint, 623   
incomplete data set, 476   
independent and identically distributed, 37, 344   
independent component analysis, 514   
independent factor analysis, 515   
independent variables, 31   
inductive bias, 19, 254   
inductive learning, 409, 420   
inequality constraint, 623   
inference, 120, 138, 143, 336   
InfoNCE, 191   
information theory, 46   
instance discrimination, 192   
internal covariate shift, 229   
internal representation, 308   
intersection-over-union, 310   
intrinsic dimensionality, 496   
invariance, 256, 256, 297, 412   
inverse autoregressive flow, 553   
inverse kinematics, 199   
inverse problem, 123, 198, 254, 346   
Iris data, 173   
IRLS, see iterative reweighted least squares   
isotropic covariance matrix, 75   
iterative reweighted least squares, 160   
Jacobian matrix, 44, 240   
Jensen’s inequality, 52   
Jensen–Shannon divergence, 544   
K nearest neighbours, 103   
K-means clustering algorithm, 460, 480   
Kalman filter, 353, 515

Karush–Kuhn–Tucker conditions, 624   
kernel density estimator, 100, 596   
kernel function, 101   
kernel image, 291   
KKT, see Karush-Kuhn-Tucker conditions   
KL divergence, see Kullback–Leibler divergence   
Kosambi–Karhunen–Loeve transform, 497\`   
Kullback–Leibler divergence, 51, 486

Lagrange multiplier, 621   
Lagrangian, 622   
Langevin dynamics, 454   
Langevin sampling, 455   
language model, 382   
Laplace distribution, 34   
large language model, 5, 382, 390   
lasso, 264   
latent class analysis, 481   
latent diffusion model, 601   
latent variable, 76, 335, 459, 495   
layer normalization, 229, 369   
LDM, see latent diffusion model   
LDS, see linear dynamical system   
leaky ReLU, 185   
learning curve, 223, 266   
learning rate parameter, 214   
learning to learn, 190   
least-mean-squares algorithm, 118   
least-squares GAN, 537   
leave-one-out, 15   
LeNet convolutional network, 299   
Levenberg–Marquardt approximation, 244   
likelihood function, 38, 468   
likelihood weighted sampling, 451   
linear discriminant, 132   
linear dynamical system, 515   
linear independence, 610   
linear regression, 6, 112   
linear-Gaussian model, 79, 332, 332   
linearly separable, 132   
link, see edge   
link function, 158, 165   
LLM, see large language model   
LMS, see least-mean-squares algorithm   
local minimum, 211

log odds, 151   
logic sampling, 450   
logistic regression, 159   
logistic sigmoid, 95, 113, 151, 159   
logit function, 151   
long short-term memory, 382   
LoRA, see low-rank adaptation   
loss function, 120, 140   
loss matrix, 142   
lossless data compression, 465   
lossy data compression, 465   
low-rank adaptation, 392   
LSGAN, see least-squares GAN   
LSTM, see long short-term memory   
M step, 472, 477   
macrostate, 48   
MAE, see masked autoencoder   
MAF, see masked autoregressive flow   
Mahalanobis distance, 71   
manifold, 177, 522   
MAP, see maximum a posteriori   
marginal probability, 27   
Markov blanket, 347, 449   
Markov boundary, see Markov blanket   
Markov chain, 351, 442   
Markov chain Monte Carlo, 440   
Markov model, 351   
Markov random field, 327   
masked attention, 384   
masked autoencoder, 567   
masked autoregressive flow, 553   
max-pooling, 297   
max-unpooling, 317   
maximization step, see M step   
maximum a posteriori, 56, 477   
maximum likelihood, 38, 84, 115, 153   
MCMC, see Markov chain Monte Carlo   
MDN, see mixture density network   
mean, 36   
mean value theorem, 49   
measure theory, 33   
mel spectrogram, 399   
message-passing, 414   
message-passing neural network, 415

meta-learning, 190   
Metropolis algorithm, 441   
Metropolis–Hastings algorithm, 445   
microstate, 48   
mini-batches, 216   
minimum risk, 145   
Minkowski loss, 122   
missing at random, 477, 519   
missing data, 519   
mixing coefficient, 87   
mixture component, 87   
mixture density network, 198   
mixture distribution, 459   
mixture model, 459   
mixture of Gaussians, 86, 200, 271, 466   
MLP, see multilayer perceptron   
MNIST data, 495   
mode collapse, 536   
model averaging, 277   
model comparison, 9   
model selection, 14   
moment, 37   
momentum, 220   
Monte Carlo dropout, 280   
Monte Carlo sampling, 429   
Moore-Penrose pseudo-inverse, see pseudo-inverse   
MRF, see Markov random field   
multi-class logistic regression, 161   
multi-head attention, 366   
multilayer perceptron, 18, 172   
multimodal transformer, 394   
multimodality, 199   
multinomial distribution, 70, 95   
multiplicity, 48   
multitask learning, 190   
mutual information, 54   
n-gram model, 379   
naive Bayes model, 147, 344, 378   
nats, 47   
natural language processing, 374   
natural parameter, 94   
nearest-neighbours, 103   
neocognitron, 302   
Nesterov momentum, 221   
neural ordinary differential equation, 554   
neuroscience, 302   
NLP, see natural language processing   
no free lunch theorem, 255   
node, 326, 410   
noise, 23   
noiseless coding theorem, 47   
noisy-OR, 354   
non-identifiability, 513   
non-max suppression, 314   
nonparametric methods, 66, 98   
normal distribution, see Gaussian   
normal equations, 116   
normalized exponential, see softmax function   
novelty detection, 144   
object detection, 308   
observed variable, 335   
Old Faithful data, 86   
on-hot encoding, see 1-of-K encoding   
one-shot learning, 191   
one-versus-one classifier, 134   
one-versus-the-rest classifier, 134   
online gradient descent, 215   
online learning, 117   
ordered over-relaxation, 449   
outer product approximation, 244   
outlier, 137, 144, 164   
over-fitting, 10, 123, 470   
over-relaxation, 449   
over-smoothing, 422

padding, 294   
parameter sharing, 270, 331   
parameter shrinkage, 118   
parameter tying, see parameter sharing   
parent node, 247, 327   
partition function, 452   
Parzen estimator, see kernel density estimator   
Parzen window, 101   
PCA, see principal component analysis   
perceptron, 17   
periodic variables, 89   
permutation matrix, 411   
PixelCNN, 397   
PixelRNN, 397

plate, 334   
polynomial curve fitting, 6   
pooling, 296   
positional encoding, 371   
positive definite covariance, 72   
positive definite matrix, 615   
posterior collapse, 577   
posterior probability, 31   
power method, 498   
pre-activation, 17   
pre-processing, 20   
pre-training, 189, 392   
precision matrix, 77   
precision parameter, 36   
predictive distribution, 42, 120   
prefix prompt, 394   
principal component analysis, 497, 506, 565   
principal subspace, 497   
prior, 263   
prior knowledge, 19, 255   
prior probability, 31, 145   
probabilistic graphical model, see graphical model   
probabilistic PCA, 506   
probability, 25   
probability density, 32   
probability theory, 23   
probit function, 164   
probit regression, 163   
product rule of probability, 26, 28, 326   
prompt, 394, 601   
prompt engineering, 394   
proposal distribution, 433, 437, 441   
pseudo-inverse, 116, 136   
pseudo-random numbers, 430

## quadratic discriminant, 153

radial basis functions, 179   
random variable, 26   
raster scan, 397   
readout layer, 419   
real NVP normalizing flow, 549   
receiver operating characteristic, see ROC curve   
receptive field, 290, 416   
recurrent neural network, 380   
regression, 3   
regression function, 121   
regularization, 12, 253   
regularized least squares, 118   
reject option, 142, 145   
rejection sampling, 433   
relative entropy, 51   
reparameterization trick, 574   
representation learning, 22, 188   
residual block, 275   
residual connection, 22, 274   
residual network, 275   
resnet, see residual network   
responsibility, 88, 468   
RLHF, 394   
RMS error, see root-mean-square error   
RMSProp, 223   
RNN, see recurrent neural network   
robot arm, 198   
robustness, 137   
ROC curve, 148   
root-mean-square error, 10   
saliency map, 305   
same convolution, 294   
sample mean, 39   
sample variance, 39   
sampling, 429   
sampling-importance-resampling, 439   
scale invariance, 256   
scaled self-attention, 366   
scaling hypothesis, 358   
Schur complement, 79   
score function, 455, 594   
score matching, 594   
self-attention, 362   
self-supervised learning, 5, 375   
semi-supervised learning, 420   
sequential estimation, 85   
sequential gradient descent, 118   
sequential learning, 117   
SGD, see stochastic gradient descent   
shared parameters, see parameter sharing   
shared weights, 292   
shattered gradients, 274   
shrinkage, 13   
sigmoid, see logistic sigmoid   
singular value decomposition, 117   
SIR, see sampling-importance-resampling   
skip-grams, 375   
skip-layer connections, 274   
sliding window, 311   
smoothing parameter, 100   
soft ReLU, 185   
soft weight sharing, 271   
softmax function, 96, 152, 197, 201, 363   
softplus activation function, 185   
sparse autoencoders, 566   
sparse connections, 292   
sparsity, 264   
sphering, 504   
standard deviation, 36   
standardizing, 462, 503   
state-space model, 352   
statistical bias, see bias   
statistical independence, see independent variables   
steepest descent, 214   
Stein score, see score function   
Stirling’s approximation, 48   
stochastic, 8   
stochastic differential equation, 598   
stochastic gradient descent, 19, 214, 215   
stochastic variable, 26   
strided convolution, 294   
strides, 311   
structured data, 287, 407   
style transfer, 320   
sufficient statistics, 67, 69, 84, 97   
sum rule of probability, 26, 28, 326   
sum-of-squares error, 8, 41, 136   
supervised learning, 3, 420   
support vector machine, 179   
SVD, see singular value decomposition   
SVM, see support vector machine   
swish activation function, 205   
symmetry, 256   
symmetry breaking, 216   
tail-to-tail path, 339   
tangent propagation, 258   
temperature, 387   
tensor, 194, 295   
test set, 10, 14   
text-to-speech, 400   
tied parameters, see parameter sharing   
token, 360   
tokenization, 377   
training set, 3   
transductive, 409, 419   
transductive learning, 420   
transfer learning, 3, 189, 218, 388   
transformers, 357   
transition probability, 443   
translation invariance, 256   
transpose convolution, 318   
tri-gram model, 379   
TTS, see text-to-speech

U-net, 319   
undetermined multiplier, see Lagrange multiplier   
undirected graphical model, 327   
uniquenesses, 513   
universal approximation theorems, 182   
unobserved variable, see latent variable   
unsupervised learning, 4, 188   
utility function, 140   
VAE, see variational autoencoder   
valid convolution, 294   
validation set, 14   
vanishing gradient, 227, 382   
variance, 35, 36, 125   
variational autoencoder, 569   
variational inference, 485   
variational lower bound, see evidence lower bound   
vector quantization, 398, 465   
vertex, see node   
vision transformer, 395   
von Mises distribution, 89   
voxel, 289

Wasserstein distance, 538   
Wasserstein GAN, 538   
wavelets, 114   
weakly supervised, 192   
weight decay, 13, 260   
weight parameter, 17, 180

weight sharing, see parameter sharing   
weight vector, 132   
weight-space symmetry, 185   
WGAN, see Wasserstein GAN   
whitening, 502   
Woodbury identity, 610   
word embedding, 375   
word2vec, 375   
wrapped distribution, 94

Yellowstone National Park, 86

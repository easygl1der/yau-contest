---
title: "Chapter 20 \u2014 Deep Generative Models"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 20
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 10538
source_line_end: 14067
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 15
source_empty_image_alt: 15
non_semantic_image_alt: 4
caption_derived_image_alt: 11
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

# Chapter 20 — Deep Generative Models

> [[../README|本书目录]] · [[19-chapter-19-approximate-inference|上一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 10538–14067。
> - 本章保留 15 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Deep Generative Models

In this chapter, we present several of the specific kinds of generative models that can be built and trained using the techniques presented in chapters 16–19. All these models represent probability distributions over multiple variables in some way. Some allow the probability distribution function to be evaluated explicitly. Others do not allow the evaluation of the probability distribution function but support operations that implicitly require knowledge of it, such as drawing samples from the distribution. Some of these models are structured probabilistic models described in terms of graphs and factors, using the language of graphical models presented in chapter 16. Others cannot be easily described in terms of factors but represent probability distributions nonetheless.

## 20.1 Boltzmann Machines

Boltzmann machines were originally introduced as a general “connectionist” approach to learning arbitrary probability distributions over binary vectors (Fahlman et al., 1983; Ackley et al., 1985; Hinton et al., 1984; Hinton and Sejnowski, 1986). Variants of the Boltzmann machine that include other kinds of variables have long ago surpassed the popularity of the original. In this section we briefly introduce the binary Boltzmann machine and discuss the issues that come up when trying to train and perform inference in the model.

We define the Boltzmann machine over a $d$ -dimensional binary random vector $\mathbf{x} \in \{0,1\}^d$ . The Boltzmann machine is an energy-based model (section 16.2.4), meaning we define the joint probability distribution using an energy function:

$$
P(\boldsymbol{x}) = \frac{\exp(- E(\boldsymbol{x}))}{Z},\tag{20.1}
$$

where $E(\boldsymbol{x})$ is the energy function, and Z is the partition function that ensures that $\sum_{\boldsymbol{x}} P(\boldsymbol{x}) = 1$ . The energy function of the Boltzmann machine is given by

$$
E(\boldsymbol{x}) = - \boldsymbol{x}^{\top} \boldsymbol{U} \boldsymbol{x} - \boldsymbol{b}^{\top} \boldsymbol{x},\tag{20.2}
$$

where U is the “weight” matrix of model parameters and b is the vector of bias parameters.

In the general setting of the Boltzmann machine, we are given a set of training examples, each of which are n-dimensional. Equation 20.1 describes the joint probability distribution over the observed variables. While this scenario is certainly viable, it does limit the kinds of interactions between the observed variables to those described by the weight matrix. Specifically, it means that the probability of one unit being on is given by a linear model (logistic regression) from the values of the other units.

The Boltzmann machine becomes more powerful when not all the variables are observed. In this case, the latent variables can act similarly to hidden units in a multilayer perceptron and model higher-order interactions among the visible units. Just as the addition of hidden units to convert logistic regression into an MLP results in the MLP being a universal approximator of functions, a Boltzmann machine with hidden units is no longer limited to modeling linear relationships between variables. Instead, the Boltzmann machine becomes a universal approximator of probability mass functions over discrete variables (Le Roux and Bengio, 2008).

Formally, we decompose the units x into two subsets: the visible units v and the latent (or hidden) units h. The energy function becomes

$$
E(\boldsymbol{v}, \boldsymbol{h}) = - \boldsymbol{v}^{\top} \mathbb{R} \boldsymbol{v} - \boldsymbol{v}^{\top} \boldsymbol{W} \boldsymbol{h} - \boldsymbol{h}^{\top} \boldsymbol{S} \boldsymbol{h} - \boldsymbol{b}^{\top} \boldsymbol{v} - \boldsymbol{c}^{\top} \boldsymbol{h}.\tag{20.3}
$$

Boltzmann Machine Learning Learning algorithms for Boltzmann machines are usually based on maximum likelihood. All Boltzmann machines have an intractable partition function, so the maximum likelihood gradient must be approximated using the techniques described in chapter 18.

One interesting property of Boltzmann machines when trained with learning rules based on maximum likelihood is that the update for a particular weight connecting two units depends only on the statistics of those two units, collected under different distributions: $P_{\mathrm{model}}(\boldsymbol{v})$ and $\hat{P}_{\mathrm{data}}(\boldsymbol{v})P_{\mathrm{model}}(\boldsymbol{h} \mid \boldsymbol{v})$ . The rest of the network participates in shaping those statistics, but the weight can be updated without knowing anything about the rest of the network or how those statistics were produced. This means that the learning rule is “local,” which makes Boltzmann machine learning somewhat biologically plausible. It is conceivable that if each neuron were a random variable in a Boltzmann machine, then the axons and dendrites connecting two random variables could learn only by observing the firing pattern of the cells that they actually physically touch. In particular, in the positive phase, two units that frequently activate together have their connection strengthened. This is an example of a Hebbian learning rule (Hebb, 1949) often summarized with the mnemonic “fire together, wire together.” Hebbian learning rules are among the oldest hypothesized explanations for learning in biological systems and remain relevant today (Giudice et al., 2009).

Other learning algorithms that use more information than local statistics seem to require us to hypothesize the existence of more machinery than this. For example, for the brain to implement back-propagation in a multilayer perceptron, it seems necessary for the brain to maintain a secondary communication network for transmitting gradient information backward through the network. Proposals for biologically plausible implementations (and approximations) of backpropagation have been made (Hinton, 2007a; Bengio, 2015) but remain to be validated, and Bengio (2015) links back-propagation of gradients to inference in energy-based models similar to the Boltzmann machine (but with continuous latent variables).

The negative phase of Boltzmann machine learning is somewhat harder to explain from a biological point of view. As argued in section 18.2, dream sleep may be a form of negative phase sampling. This idea is more speculative though.

## 20.2 Restricted Boltzmann Machines

Invented under the name harmonium (Smolensky, 1986), restricted Boltzmann machines are some of the most common building blocks of deep probabilistic models. We briefly describe RBMs in section 16.7.1. Here we review the previous information and go into more detail. RBMs are undirected probabilistic graphical models containing a layer of observable variables and a single layer of latent variables. RBMs may be stacked (one on top of the other) to form deeper models. See figure 20.1 for some examples. In particular, figure 20.1a shows the graph structure of the RBM itself. It is a bipartite graph, with no connections permitted between any variables in the observed layer or between any units in the latent layer.

![Figure 20.1](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/c39759135e8e3878108e7a423bc2ecdade7a9c797aac0c417fc3eb32d7428cc9.jpg)  
Figure 20.1: Examples of models that may be built with restricted Boltzmann machines. (a) The restricted Boltzmann machine itself is an undirected graphical model based on a bipartite graph, with visible units in one part of the graph and hidden units in the other part. There are no connections among the visible units, nor any connections among the hidden units. Typically every visible unit is connected to every hidden unit, but it is possible to construct sparsely connected RBMs such as convolutional RBMs. (b) A deep belief network is a hybrid graphical model involving both directed and undirected connections. Like an RBM, it has no intralayer connections. However, a DBN has multiple hidden layers, and thus connections between hidden units are in separate layers. All the local conditional probability distributions needed by the deep belief network are copied directly from the local conditional probability distributions of its constituent RBMs. Alternatively, we could also represent the deep belief network with a completely undirected graph, but it would need intralayer connections to capture the dependencies between parents. (c) A deep Boltzmann machine is an undirected graphical model with several layers of latent variables. Like RBMs and DBNs, DBMs lack intralayer connections. DBMs are less closely tied to RBMs than DBNs are. When initializing a DBM from a stack of RBMs, it is necessary to modify the RBM parameters slightly. Some kinds of DBMs may be trained without first training a set of RBMs.

We begin with the binary version of the restricted Boltzmann machine, but as we see later, there are extensions to other types of visible and hidden units.

More formally, let the observed layer consist of a set of $n_{v}$ binary random variables, which we refer to collectively with the vector v. We refer to the latent, or hidden, layer of $n_{h}$ binary random variables as h.

Like the general Boltzmann machine, the restricted Boltzmann machine is an energy-based model with the joint probability distribution specified by its energy function:

$$
P(\mathbf{v} = \boldsymbol{v}, \mathbf{h} = \boldsymbol{h}) = \frac{1}{Z} \exp(- E(\boldsymbol{v}, \boldsymbol{h})).\tag{20.4}
$$

The energy function for an RBM is given by

$$
E(\boldsymbol{v}, \boldsymbol{h}) = - \boldsymbol{b}^{\top} \boldsymbol{v} - \boldsymbol{c}^{\top} \boldsymbol{h} - \boldsymbol{v}^{\top} \boldsymbol{Wh},\tag{20.5}
$$

and Z is the normalizing constant known as the partition function:

$$
Z = \sum_{v} \sum_{h} \exp \left\{- E(\boldsymbol{v}, \boldsymbol{h}) \right\}.\tag{20.6}
$$

It is apparent from the definition of the partition function Z that the naive method of computing Z (exhaustively summing over all states) could be computationally intractable, unless a cleverly designed algorithm could exploit regularities in the probability distribution to compute Z faster. In the case of restricted Boltzmann machines, Long and Servedio (2010) formally proved that the partition function Z is intractable. The intractable partition function Z implies that the normalized joint probability distribution $P(\boldsymbol{v})$ is also intractable to evaluate.

## 20.2.1 Conditional Distributions

Though $P(\mathbf{v})$ is intractable, the bipartite graph structure of the RBM has the special property of its conditional distributions $P(\mathbf{h} \mid \mathbf{v})$ and $P(\mathbf{v} \mid \mathbf{h})$ being factorial and relatively simple to compute and sample from.

Deriving the conditional distributions from the joint distribution is straightforward:

$$
P(\boldsymbol{h} \mid \boldsymbol{v}) = \frac{P(\boldsymbol{h}, \boldsymbol{v})}{P(\boldsymbol{v})}\tag{20.7}
$$

$$
= \frac{1}{P(\boldsymbol{v})} \frac{1}{Z} \exp \left\{\boldsymbol{b}^{\top} \boldsymbol{v} + \boldsymbol{c}^{\top} \boldsymbol{h} + \boldsymbol{v}^{\top} \boldsymbol{Wh} \right\}\tag{20.8}
$$

$$
= \frac{1}{Z^{\prime}} \exp \left\{\boldsymbol{c}^{\top} \boldsymbol{h} + \boldsymbol{v}^{\top} \boldsymbol{Wh} \right\}\tag{20.9}
$$

$$
\begin{array}{l} = \frac{1}{Z^{\prime}} \exp \left\{\sum_{j = 1}^{n_{h}} c_{j} h_{j} + \sum_{j = 1}^{n_{h}} \boldsymbol{v}^{\top} \boldsymbol{W}_{:, j} \boldsymbol{h}_{j} \right\} \\ = \frac{1}{Z^{\prime}} \prod_{j = 1}^{n_{h}} \exp \left\{c_{j} h_{j} + \boldsymbol{v}^{\top} \boldsymbol{W}_{:, j} \boldsymbol{h}_{j} \right\}.\end{array}\tag{20.10}
$$

(20.11)

Since we are conditioning on the visible units v, we can treat these as constant with respect to the distribution $P(\mathbf{h} \mid \mathbf{v})$ . The factorial nature of the conditional $P(\mathbf{h} \mid \mathbf{v})$ follows immediately from our ability to write the joint probability over the vector h as the product of (unnormalized) distributions over the individual elements, $h_{j}$ . It is now a simple matter of normalizing the distributions over the individual binary $h_{j}$ .

$$
P(h_{j} = 1 \mid \boldsymbol{v}) = \frac{\tilde{P}(h_{j} = 1 \mid \boldsymbol{v})}{\tilde{P}(h_{j} = 0 \mid \boldsymbol{v}) + \tilde{P}(h_{j} = 1 \mid \boldsymbol{v})}\tag{20.12}
$$

$$
= \frac{\exp \left\{c_{j} + \boldsymbol{v}^{\top} \boldsymbol{W}_{:, j} \right\}}{\exp \left\{0 \right\} + \exp \left\{c_{j} + \boldsymbol{v}^{\top} \boldsymbol{W}_{:, j} \right\}}\tag{20.13}
$$

$$
= \sigma \left(c_{j} + \boldsymbol{v}^{\top} \boldsymbol{W}_{:, j}\right).\tag{20.14}
$$

We can now express the full conditional over the hidden layer as the factorial distribution:

$$
P(\boldsymbol{h} \mid \boldsymbol{v}) = \prod_{j = 1}^{n_{h}} \sigma \left((2 \boldsymbol{h} - 1) \odot(\boldsymbol{c} + \boldsymbol{W}^{\top} \boldsymbol{v})\right)_{j}.\tag{20.15}
$$

A similar derivation will show that the other condition of interest to us, $P(\boldsymbol{v} \mid \boldsymbol{h})$ , is also a factorial distribution:

$$
P(\boldsymbol{v} \mid \boldsymbol{h}) = \prod_{i = 1}^{n_{v}} \sigma((2 \boldsymbol{v} - 1) \odot(\boldsymbol{b} + \boldsymbol{Wh}))_{i}.\tag{20.16}
$$

## 20.2.2 Training Restricted Boltzmann Machines

Because the RBM admits efficient evaluation and differentiation of $\tilde{P}(\boldsymbol{v})$ and efficient MCMC sampling in the form of block Gibbs sampling, it can readily be trained with any of the techniques described in chapter 18 for training models that have intractable partition functions. This includes CD, SML (PCD), ratio matching, and so on. Compared to other undirected models used in deep learning, the RBM is relatively straightforward to train because we can compute $P(\mathbf{h} \mid \boldsymbol{v})$

exactly in closed form. Some other deep models, such as the deep Boltzmann machine, combine both the difficulty of an intractable partition function and the difficulty of intractable inference.

## 20.3 Deep Belief Networks

Deep belief networks (DBNs) were one of the first nonconvolutional models to successfully admit training of deep architectures (Hinton et al., 2006; Hinton, 2007b). The introduction of deep belief networks in 2006 began the current deep learning renaissance. Prior to the introduction of deep belief networks, deep models were considered too difficult to optimize. Kernel machines with convex objective functions dominated the research landscape. Deep belief networks demonstrated that deep architectures can be successful by outperforming kernelized support vector machines on the MNIST dataset (Hinton et al., 2006). Today, deep belief networks have mostly fallen out of favor and are rarely used, even compared to other unsupervised or generative learning algorithms, but they are still deservedly recognized for their important role in deep learning history.

Deep belief networks are generative models with several layers of latent variables. The latent variables are typically binary, while the visible units may be binary or real. There are no intralayer connections. Usually, every unit in each layer is connected to every unit in each neighboring layer, though it is possible to construct more sparsely connected DBNs. The connections between the top two layers are undirected. The connections between all other layers are directed, with the arrows pointed toward the layer that is closest to the data. See figure 20.1b for an example.

A DBN with l hidden layers contains l weight matrices: $\boldsymbol{W}^{(1)},\ldots,\boldsymbol{W}^{(l)}$ . It also contains $l+1$ bias vectors $\boldsymbol{b}^{(0)},\ldots,\boldsymbol{b}^{(l)}$ , with $\boldsymbol{b}^{(0)}$ providing the biases for the visible layer. The probability distribution represented by the DBN is given by

$$
P \left(\boldsymbol{h}^{(l)}, \boldsymbol{h}^{(l - 1)}\right) \propto \exp \left(\boldsymbol{b}^{(l)^{\top}} \boldsymbol{h}^{(l)} + \boldsymbol{b}^{(l - 1)^{\top}} \boldsymbol{h}^{(l - 1)} + \boldsymbol{h}^{(l - 1)^{\top}} \boldsymbol{W}^{(l)} \boldsymbol{h}^{(l)}\right),\tag{20.17}
$$

$$
P(h_{i}^{(k)} = 1 \mid \boldsymbol{h}^{(k + 1)}) = \sigma \left(b_{i}^{(k)} + \boldsymbol{W}_{:, i}^{(k + 1) \top} \boldsymbol{h}^{(k + 1)}\right) \forall i, \forall k \in 1, \dots, l - 2,\tag{20.18}
$$

$$
P(v_{i} = 1 \mid \boldsymbol{h}^{(1)}) = \sigma \left(b_{i}^{(0)} + \boldsymbol{W}_{:, i}^{(1) \top} \boldsymbol{h}^{(1)}\right) \forall i.\tag{20.19}
$$

In the case of real-valued visible units, substitute

$$
\mathbf{v} \sim \mathcal{N} \left(\boldsymbol{v}; \boldsymbol{b}^{(0)} + \boldsymbol{W}^{(1) \top} \boldsymbol{h}^{(1)}, \boldsymbol{\beta}^{- 1}\right)\tag{20.20}
$$

with $\beta$ diagonal for tractability. Generalizations to other exponential family visible units are straightforward, at least in theory. A DBN with only one hidden layer is just an RBM.

To generate a sample from a DBN, we first run several steps of Gibbs sampling on the top two hidden layers. This stage is essentially drawing a sample from the RBM defined by the top two hidden layers. We can then use a single pass of ancestral sampling through the rest of the model to draw a sample from the visible units.

Deep belief networks incur many of the problems associated with both directed models and undirected models.

Inference in a deep belief network is intractable because of the explaining away effect within each directed layer and the interaction between the two hidden layers that have undirected connections. Evaluating or maximizing the standard evidence lower bound on the log-likelihood is also intractable, because the evidence lower bound takes the expectation of cliques whose size is equal to the network width.

Evaluating or maximizing the log-likelihood requires confronting not just the problem of intractable inference to marginalize out the latent variables, but also the problem of an intractable partition function within the undirected model of the top two layers.

To train a deep belief network, one begins by training an RBM to maximize $E_{v\sim p_{data}} \log p(v)$ using contrastive divergence or stochastic maximum likelihood. The parameters of the RBM then define the parameters of the first layer of the DBN. Next, a second RBM is trained to approximately maximize

$$
\mathbb{E}_{\mathbf{v} \sim p_{\mathrm{data}}} \mathbb{E}_{\mathbf{h}^{(1)} \sim p^{(1)}(\boldsymbol{h}^{(1)} | \boldsymbol{v})} \log p^{(2)}(\boldsymbol{h}^{(1)}),\tag{20.21}
$$

where $p^{(1)}$ is the probability distribution represented by the first RBM, and $p^{(2)}$ is the probability distribution represented by the second RBM. In other words, the second RBM is trained to model the distribution defined by sampling the hidden units of the first RBM, when the first RBM is driven by the data. This procedure can be repeated indefinitely, to add as many layers to the DBN as desired, with each new RBM modeling the samples of the previous one. Each RBM defines another layer of the DBN. This procedure can be justified as increasing a variational lower bound on the log-likelihood of the data under the DBN (Hinton et al., 2006).

In most applications, no effort is made to jointly train the DBN after the greedy layer-wise procedure is complete. However, it is possible to perform generative fine-tuning using the wake-sleep algorithm.

The trained DBN may be used directly as a generative model, but most of the interest in DBNs arose from their ability to improve classification models. We can take the weights from the DBN and use them to define an MLP:

$$
\boldsymbol{h}^{(1)} = \sigma \left(b^{(1)} + \boldsymbol{v}^{\top} \boldsymbol{W}^{(1)}\right),\tag{20.22}
$$

$$
\boldsymbol{h}^{(l)} = \sigma \left(b_{i}^{(l)} + \boldsymbol{h}^{(l - 1) \top} \boldsymbol{W}^{(l)}\right) \forall l \in 2, \dots, m.\tag{20.23}
$$

After initializing this MLP with the weights and biases learned via generative training of the DBN, we can train the MLP to perform a classification task. This additional training of the MLP is an example of discriminative fine-tuning.

This specific choice of MLP is somewhat arbitrary, compared to many of the inference equations in chapter 19 that are derived from first principles. This MLP is a heuristic choice that seems to work well in practice and is used consistently in the literature. Many approximate inference techniques are motivated by their ability to find a maximally tight variational lower bound on the log-likelihood under some set of constraints. One can construct a variational lower bound on the log-likelihood using the hidden unit expectations defined by the DBN's MLP, but this is true of any probability distribution over the hidden units, and there is no reason to believe that this MLP provides a particularly tight bound. In particular, the MLP ignores many important interactions in the DBN graphical model. The MLP propagates information upward from the visible units to the deepest hidden units, but it does not propagate any information downward or sideways. The DBN graphical model has explaining away interactions between all the hidden units within the same layer as well as in top-down interactions between layers.

While the log-likelihood of a DBN is intractable, it may be approximated with AIS (Salakhutdinov and Murray, 2008). This permits evaluating its quality as a generative model.

The term “deep belief network” is commonly used incorrectly to refer to any kind of deep neural network, even networks without latent variable semantics. The term should refer specifically to models with undirected connections in the deepest layer and directed connections pointing downward between all other pairs of consecutive layers.

The term may also cause some confusion because “belief network” is sometimes used to refer to purely directed models, while deep belief networks contain an undirected layer. Deep belief networks also share the acronym DBN with dynamic Bayesian networks (Dean and Kanazawa, 1989), which are Bayesian networks for representing Markov chains.

## 20.4 Deep Boltzmann Machines

A deep Boltzmann machine, or DBM (Salakhutdinov and Hinton, 2009a) is another kind of deep generative model. Unlike the deep belief network (DBN), it is an entirely undirected model. Unlike the RBM, the DBM has several layers of latent variables (RBMs have just one). But like the RBM, within each layer, each of the variables are mutually independent, conditioned on the variables in the neighboring layers. See figure 20.2 for the graph structure. Deep Boltzmann machines have been applied to a variety of tasks, including document modeling (Srivastava et al., 2013).

Like RBMs and DBNs, DBMs typically contain only binary units -as we assume for simplicity of our presentation of the model -but it is straightforward to include real-valued visible units.

A DBM is an energy-based model, meaning that the joint probability distribution over the model variables is parametrized by an energy function E. In the case of a deep Boltzmann machine with one visible layer, v, and three hidden layers, $\boldsymbol{h}^{(1)}$ , $\boldsymbol{h}^{(2)}$ , and $\boldsymbol{h}^{(3)}$ , the joint probability is given by

$$
P \left(\boldsymbol{v}, \boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)}, \boldsymbol{h}^{(3)}\right) = \frac{1}{Z(\boldsymbol{\theta})} \exp \left(- E(\boldsymbol{v}, \boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)}, \boldsymbol{h}^{(3)}; \boldsymbol{\theta})\right).\tag{20.24}
$$

To simplify our presentation, we omit the bias parameters below. The DBM energy function is then defined as follows:

$$
E(\boldsymbol{v}, \boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)}, \boldsymbol{h}^{(3)}; \boldsymbol{\theta}) = - \boldsymbol{v}^{\top} \boldsymbol{W}^{(1)} \boldsymbol{h}^{(1)} - \boldsymbol{h}^{(1) \top} \boldsymbol{W}^{(2)} \boldsymbol{h}^{(2)} - \boldsymbol{h}^{(2) \top} \boldsymbol{W}^{(3)} \boldsymbol{h}^{(3)}.\tag{20.25}
$$

![Figure 20.2](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/2851bd76d078ba2924204544e03c3c169a98b9538dba31fec6c803014a9100a8.jpg)  
Figure 20.2: The graphical model for a deep Boltzmann machine with one visible layer (bottom) and two hidden layers. Connections are only between units in neighboring layers. There are no intralayer connections.

In comparison to the RBM energy function (equation 20.5), the DBM energy function includes connections between the hidden units (latent variables) in the form of the weight matrices $\left(\boldsymbol{W}^{(2)}\right.$ and $\left.\boldsymbol{W}^{(3)}\right)$ . As we will see, these connections have significant consequences for the model behavior as well as how we go about performing inference in the model.

In comparison to fully connected Boltzmann machines (with every unit connected to every other unit), the DBM offers some advantages that are similar to those offered by the RBM. Specifically, as illustrated in figure 20.3, the DBM layers can be organized into a bipartite graph, with odd layers on one side and even layers on the other. This immediately implies that when we condition on the variables in the even layer, the variables in the odd layers become conditionally independent. Of course, when we condition on the variables in the odd layers, the variables in the even layers also become conditionally independent.

The bipartite structure of the DBM means that we can apply the same equations we have previously used for the conditional distributions of an RBM to determine the conditional distributions in a DBM. The units within a layer are conditionally independent from each other given the values of the neighboring layers, so the distributions over binary variables can be fully described by the Bernoulli parameters, giving the probability of each unit being active. In our example with two hidden layers, the activation probabilities are given by

$$
P(v_{i} = 1 \mid \boldsymbol{h}^{(1)}) = \sigma \left(\boldsymbol{W}_{i,:}^{(1)} \boldsymbol{h}^{(1)}\right),\tag{20.26}
$$

![Figure 20.3](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/9d3ef54256fa16f3882ec3cf5f23378500d46792284b222638f009f842671097.jpg)  
Figure 20.3: A deep Boltzmann machine, rearranged to reveal its bipartite graph structure.

$$
P(h_{i}^{(1)} = 1 \mid \boldsymbol{v}, \boldsymbol{h}^{(2)}) = \sigma \left(\boldsymbol{v}^{\top} \boldsymbol{W}_{:, i}^{(1)} + \boldsymbol{W}_{i,:}^{(2)} \boldsymbol{h}^{(2)}\right),\tag{20.27}
$$

and

$$
P(h_{k}^{(2)} = 1 \mid \boldsymbol{h}^{(1)}) = \sigma \left(\boldsymbol{h}^{(1) \top} \boldsymbol{W}_{:, k}^{(2)}\right).\tag{20.28}
$$

The bipartite structure makes Gibbs sampling in a deep Boltzmann machine efficient. The naive approach to Gibbs sampling is to update only one variable at a time. RBMs allow all the visible units to be updated in one block and all the hidden units to be updated in a second block. One might naively assume that a DBM with l layers requires $l + 1$ updates, with each iteration updating a block consisting of one layer of units. Instead, it is possible to update all the units in only two iterations. Gibbs sampling can be divided into two blocks of updates, one including all even layers (including the visible layer) and the other including all odd layers. Because of the bipartite DBM connection pattern, given the even layers, the distribution over the odd layers is factorial and thus can be sampled simultaneously and independently as a block. Likewise, given the odd layers, the even layers can be sampled simultaneously and independently as a block. Efficient sampling is especially important for training with the stochastic maximum likelihood algorithm.

## 20.4.1 Interesting Properties

Deep Boltzmann machines have many interesting properties.

DBMs were developed after DBNs. Compared to DBNs, the posterior distribution $P(\boldsymbol{h} \mid \boldsymbol{v})$ is simpler for DBMs. Somewhat counterintuitively, the simplicity of this posterior distribution allows richer approximations of the posterior. In the case of the DBN, we perform classification using a heuristically motivated approximate inference procedure, in which we guess that a reasonable value for the mean field expectation of the hidden units can be provided by an upward pass through the network in an MLP that uses sigmoid activation functions and the same weights as the original DBN. Any distribution $Q(\boldsymbol{h})$ can be used to obtain a variational lower bound on the log-likelihood. This heuristic procedure therefore enables us to obtain such a bound. Yet the bound is not explicitly optimized in any way, so it may be far from tight. In particular, the heuristic estimate of Q ignores interactions between hidden units within the same layer as well as the top-down feedback influence of hidden units in deeper layers on hidden units that are closer to the input. Because the heuristic MLP-based inference procedure in the DBN is not able to account for these interactions, the resulting Q is presumably far from optimal. In DBMs, all the hidden units within a layer are conditionally independent given the other layers. This lack of intralayer interaction makes it possible to use fixed-point equations to optimize the variational lower bound and find the true optimal mean field expectations (to within some numerical tolerance).

The use of proper mean field allows the approximate inference procedure for DBMs to capture the influence of top-down feedback interactions. This makes DBMs interesting from the point of view of neuroscience, because the human brain is known to use many top-down feedback connections. Because of this property, DBMs have been used as computational models of real neuroscientific phenomena (Series et al., 2010; Reichert et al., 2011).

One unfortunate property of DBMs is that sampling from them is relatively difficult. DBNs only need to use MCMC sampling in their top pair of layers. The other layers are used only at the end of the sampling process, in one efficient ancestral sampling pass. To generate a sample from a DBM, it is necessary to use MCMC across all layers, with every layer of the model participating in every Markov chain transition.

## 20.4.2 DBM Mean Field Inference

The conditional distribution over one DBM layer given the neighboring layers is factorial. In the example of the DBM with two hidden layers, these distributions are $P(\boldsymbol{v} \mid \boldsymbol{h}^{(1)})$ , $P(\boldsymbol{h}^{(1)} \mid \boldsymbol{v}, \boldsymbol{h}^{(2)})$ , and $P(\boldsymbol{h}^{(2)} \mid \boldsymbol{h}^{(1)})$ . The distribution over all hidden layers generally does not factorize because of interactions between layers. In the example with two hidden layers, $P(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v})$ does not factorize because of the interaction weights $W^{(2)}$ between $h^{(1)}$ and $h^{(2)}$ , which render these variables mutually dependent.

As was the case with the DBN, we are left to seek out methods to approximate the DBM posterior distribution. Unlike the DBN, however, the DBM posterior distribution over their hidden units - while complicated is easy to approximate with a variational approximation (as discussed in section 19.4), specifically a mean field approximation. The mean field approximation is a simple form of variational inference, where we restrict the approximating distribution to fully factorial distributions. In the context of DBMs, the mean field equations capture the bidirectional interactions between layers. In this section we derive the iterative approximate inference procedure originally introduced in Salakhutdinov and Hinton (2009a).

In variational approximations to inference, we approach the task of approximating a particular target distribution—in our case, the posterior distribution over the hidden units given the visible units—by some reasonably simple family of distributions. In the case of the mean field approximation, the approximating family is the set of distributions where the hidden units are conditionally independent.

We now develop the mean field approach for the example with two hidden layers. Let $Q(\pmb{h}^{(1)}, \pmb{h}^{(2)} \mid \pmb{v})$ be the approximation of $P(\pmb{h}^{(1)}, \pmb{h}^{(2)} \mid \pmb{\dot{v}})$ . The mean field assumption implies that

$$
Q(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v}) = \prod_{j} Q(h_{j}^{(1)} \mid \boldsymbol{v}) \prod_{k} Q(h_{k}^{(2)} \mid \boldsymbol{v}).\tag{20.29}
$$

The mean field approximation attempts to find a member of this family of distributions that best fits the true posterior $P(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v})$ . Importantly, the inference process must be run again to find a different distribution Q every time we use a new value of v.

One can conceive of many ways of measuring how well $Q(\pmb{h} \mid \pmb{v})$ fits $P(\pmb{h} \mid \pmb{v})$ . The mean field approach is to minimize

$$
\mathrm{KL}(\dot{Q} \| P) = \sum_{\boldsymbol{h}} Q(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v}) \log \left(\frac{Q(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v})}{P(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v})}\right).\tag{20.30}
$$

In general, we do not have to provide a parametric form of the approximating distribution beyond enforcing the independence assumptions. The variational approximation procedure is generally able to recover a functional form of the approximate distribution. However, in the case of a mean field assumption on binary hidden units (the case we are developing here) there is no loss of generality resulting from fixing a parametrization of the model in advance.

We parametrize $Q$ as a product of Bernoulli distributions; that is, we associate the probability of each element of $\pmb{h}^{(1)}$ with a parameter. Specifically, for each $j$ , $\hat{h}_j^{(1)} = Q(h_j^{(1)} = 1 \mid \pmb{v})$ , where $\hat{h}_j^{(1)} \in[0,1]$ , and for each $k$ , $\hat{h}_k^{(2)} = Q(h_k^{(2)} = 1 \mid \pmb{v})$ , where $\hat{h}_k^{(2)} \in[0,1]$ . Thus we have the following approximation to the posterior:

$$
\begin{array}{l} Q(\boldsymbol{h}^{(1)}, \boldsymbol{h}^{(2)} \mid \boldsymbol{v}) = \prod_{j} Q(h_{j}^{(1)} \mid \boldsymbol{v}) \prod_{k} Q(h_{k}^{(2)} \mid \boldsymbol{v}) \\ = \prod_{j}(\hat{h}_{j}^{(1)})^{h_{j}^{(1)}}(1 - \hat{h}_{j}^{(1)})^{(1 - h_{j}^{(1)})} \times \prod_{k}(\hat{h}_{k}^{(2)})^{h_{k}^{(2)}}(1 - \hat{h}_{k}^{(2)})^{(1 - h_{k}^{(2)})}.\end{array} \tag{20.31}\tag{20.32}
$$

Of course, for DBMs with more layers, the approximate posterior parametrization can be extended in the obvious way, exploiting the bipartite structure of the graph to update all the even layers simultaneously and then to update all the odd layers simultaneously, following the same schedule as Gibbs sampling.

Now that we have specified our family of approximating distributions Q, it remains to specify a procedure for choosing the member of this family that best fits P. The most straightforward way to do this is to use the mean field equations specified by equation 19.56. These equations were derived by solving for where the derivatives of the variational lower bound are zero. They describe in an abstract manner how to optimize the variational lower bound for any model, simply by taking expectations with respect to Q.

Applying these general equations, we obtain the update rules (again, ignoring bias terms):

$$
\hat{h}_{j}^{(1)} = \sigma \left(\sum_{i} v_{i} W_{i, j}^{(1)} + \sum_{k^{\prime}} W_{j, k^{\prime}}^{(2)} \hat{h}_{k^{\prime}}^{(2)}\right), \forall j,\tag{20.33}
$$

$$
\hat{h}_{k}^{(2)} = \sigma \left(\sum_{j^{\prime}} W_{j^{\prime}, k}^{(2)} \hat{h}_{j^{\prime}}^{(1)}\right), \forall k.\tag{20.34}
$$

At a fixed point of this system of equations, we have a local maximum of the variational lower bound $\mathcal{L}(Q)$ . Thus these fixed-point update equations define an iterative algorithm where we alternate updates of $\hat{h}_{j}^{(1)}$ (using equation 20.33) and updates of $\hat{h}_{k}^{(2)}$ (using equation 20.34). On small problems such as MNIST, as few as ten iterations can be sufficient to find an approximate positive phase gradient for learning, and fifty usually suffice to obtain a high-quality representation of a single specific example to be used for high-accuracy classification. Extending approximate variational inference to deeper DBMs is straightforward.

## 20.4.3 DBM Parameter Learning

Learning in the DBM must confront both the challenge of an intractable partition function, using the techniques from chapter 18, and the challenge of an intractable posterior distribution, using the techniques from chapter 19.

As described in section 20.4.2, variational inference allows the construction of a distribution $Q(\boldsymbol{h} \mid \boldsymbol{v})$ that approximates the intractable $P(\boldsymbol{h} \mid \boldsymbol{v})$ . Learning then proceeds by maximizing $\mathcal{L}(\boldsymbol{v}, Q, \boldsymbol{\theta})$ , the variational lower bound on the intractable log-likelihood, $\log P(\boldsymbol{v}; \boldsymbol{\theta})$ .

For a deep Boltzmann machine with two hidden layers, L is given by

$$
\mathcal{L}(Q, \boldsymbol{\theta}) = \sum_{i} \sum_{j^{\prime}} v_{i} W_{i, j^{\prime}}^{(1)} \hat{h}_{j^{\prime}}^{(1)} + \sum_{j^{\prime}} \sum_{k^{\prime}} \hat{h}_{j^{\prime}}^{(1)} W_{j^{\prime}, k^{\prime}}^{(2)} \hat{h}_{k^{\prime}}^{(2)} - \log Z(\boldsymbol{\theta}) + \mathcal{H}(Q).\tag{20.35}
$$

This expression still contains the log partition function, $\log Z(\theta)$ . Because a deep Boltzmann machine contains restricted Boltzmann machines as components, the hardness results for computing the partition function and sampling that apply to restricted Boltzmann machines also apply to deep Boltzmann machines. This means that evaluating the probability mass function of a Boltzmann machine requires approximate methods such as annealed importance sampling. Likewise, training the model requires approximations to the gradient of the log partition function. See chapter 18 for a general description of these methods. DBMs are typically trained using stochastic maximum likelihood. Many of the other techniques described in chapter 18 are not applicable. Techniques such as pseudolikelihood require the ability to evaluate the unnormalized probabilities, rather than merely obtain a variational lower bound on them. Contrastive divergence is slow for deep Boltzmann machines because they do not allow efficient sampling of the hidden units given the visible units instead, contrastive divergence would require burning in a Markov chain every time a new negative phase sample is needed.

The nonvariational version of stochastic maximum likelihood algorithm is discussed in section 18.2. Variational stochastic maximum likelihood as applied to the DBM is given in algorithm 20.1. Recall that we describe a simplified variant of the DBM that lacks bias parameters; including them is trivial.

## 20.4.4 Layer-Wise Pretraining

Unfortunately, training a DBM using stochastic maximum likelihood (as described above) from a random initialization usually results in failure. In some cases, the model fails to learn to represent the distribution adequately. In other cases, the DBM may represent the distribution well, but with no higher likelihood than could be obtained with just an RBM. A DBM with very small weights in all but the first layer represents approximately the same distribution as an RBM.

Various techniques that permit joint training have been developed and are described in section 20.4.5. However, the original and most popular method for overcoming the joint training problem of DBMs is greedy layer-wise pretraining. In this method, each layer of the DBM is trained in isolation as an RBM. The first layer is trained to model the input data. Each subsequent RBM is trained to model samples from the previous RBM's posterior distribution. After all the

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 20.1 The variational stochastic maximum likelihood algorithm for training a DBM with two hidden layers
Set ε, the step size, to a small positive number
Set k, the number of Gibbs steps, high enough to allow a Markov chain of p(v, h$^{(1)}$, h$^{(2)}$; θ + εΔθ) to burn in, starting from samples from p(v, h$^{(1)}$, h$^{(2)}$; θ).

Initialize three matrices, Ṽ, H̃$^{(1)}$, and H̃$^{(2)}$ each with m rows set to random values (e.g., from Bernoulli distributions, possibly with marginals matched to the model's marginals).
while not converged (learning loop) do
    Sample a minibatch of m examples from the training data and arrange them as the rows of a design matrix V.
    Initialize matrices H̃$^{(1)}$ and H̃$^{(2)}$, possibly to the model's marginals.
    while not converged (mean field inference loop) do
    H̃$^{(1)} \leftarrow \sigma \left(VW^{(1)} + \hat{H}^{(2)} W^{(2)\top} \right)$.
    H̃$^{(2)} \leftarrow \sigma \left(\hat{H}^{(1)} W^{(2)} \right)$.
    end while
    ΔW$^{(1)} \leftarrow \frac{1}{m} V^{\top} \hat{H}^{(1)}$
    ΔW$^{(2)} \leftarrow \frac{1}{m} \hat{H}^{(1)\top} \hat{H}^{(2)}$
    for l = 1 to k (Gibbs sampling) do
    Gibbs block 1:
    ∀i, j, Ṽi,j sampled from P(Ṽi,j = 1) = σ (Wj,:$^{(1)}$(H̃i,:$^{(1)}$)$^{\top}$). 
    ∀i, j, H̃i,j$^{(2)}$ sampled from P(H̃i,j = 1) = σ (H̃i,:$^{(1)}$Wɔ:j$^{(2)}$). 
    Gibbs block 2:
    ∀i, j, H̃i,j$^{(1)}$ sampled from P(H̃i,j = 1) = σ (Ṽi,:Wɔ:j$^{(1)}$ + H̃i,:$^{(2)}$Wɔ:j$^{(2)\top}$). 
    end for
    ΔW$^{(1)} \leftarrow \Delta W^{(1)} - \frac{1}{m} V^{\top} \tilde{H}^{(1)}$
    ΔW$^{(2)} \leftarrow \Delta W^{(2)} - \frac{1}{m} \tilde{H}^{(1)\top} \tilde{H}^{(2)}$
    W$^{(1)} \leftarrow W^{(1)} + \epsilon\Delta W^{(1)}$ (this is a cartoon illustration, in practice use a more effective algorithm, such as momentum with a decaying learning rate)
    W$^{(2)} \leftarrow W^{(2)} + \epsilon\Delta W^{(2)}$
end while
</div>

RBMs have been trained in this way, they can be combined to form a DBM. The DBM may then be trained with PCD. Typically PCD training will make only a small change in the model's parameters and in its performance as measured by the log-likelihood it assigns to the data, or its ability to classify inputs. See figure 20.4 for an illustration of the training procedure.

This greedy layer-wise training procedure is not just coordinate ascent. It bears some passing resemblance to coordinate ascent because we optimize one subset of the parameters at each step. The two methods differ because the greedy layer-wise training procedure uses a different objective function at each step.

Greedy layer-wise pretraining of a DBM differs from greedy layer-wise pretraining of a DBN. The parameters of each individual RBM may be copied to the corresponding DBN directly. In the case of the DBM, the RBM parameters must be modified before inclusion in the DBM. A layer in the middle of the stack of RBMs is trained with only bottom-up input, but after the stack is combined to form the DBM, the layer will have both bottom-up and top-down input. To account for this effect, Salakhutdinov and Hinton (2009a) advocate dividing the weights of all but the top and bottom RBM in half before inserting them into the DBM. Additionally, the bottom RBM must be trained using two “copies” of each visible unit and the weights tied to be equal between the two copies. This means that the weights are effectively doubled during the upward pass. Similarly, the top RBM should be trained with two copies of the topmost layer.

Obtaining the state of the art results with the deep Boltzmann machine requires a modification of the standard SML algorithm, which is to use a small amount of mean field during the negative phase of the joint PCD training step (Salakhutdinov and Hinton, 2009a). Specifically, the expectation of the energy gradient should be computed with respect to the mean field distribution in which all the units are independent from each other. The parameters of this mean field distribution should be obtained by running the mean field fixed-point equations for just one step. See Goodfellow et al. (2013b) for a comparison of the performance of centered DBMs with and without the use of partial mean field in the negative phase.

## 20.4.5 Jointly Training Deep Boltzmann Machines

Classic DBMs require greedy unsupervised pretraining and, to perform classification well, require a separate MLP-based classifier on top of the hidden features they extract. This has some undesirable properties. It is hard to track performance during training because we cannot evaluate properties of the full DBM while training the first RBM. Thus, it is hard to tell how well our hyperparameters are working until quite late in the training process. Software implementations of DBMs need to have many different components for CD training of individual RBMs, PCD training of the full DBM, and training based on back-propagation through the MLP. Finally, the MLP on top of the Boltzmann machine loses many of the advantages of the Boltzmann machine probabilistic model, such as being able to perform inference when some input values are missing.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/90a7048eda0e9e5c55dd8c25d957f4cf0a2efb1feefb5f5b49160c248dcff356.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/10017dab1141234df3429c24148b097c4dca51926013afbb2f65a4974e5503f0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/3807036f1d59ca7290ed08b9e3b0fdd5d302284702be9aaa52bef0407b3a0064.jpg)

![Figure 20.4](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/7f0279dd22f48361dcebb7b8fedc3e081d68165b86741e97a0c3e57f9999c12c.jpg)  
Figure 20.4: The deep Boltzmann machine training procedure used to classify the MNIST dataset (Salakhutdinov and Hinton, 2009a; Srivastava et al., 2014). (a)Train an RBM by using CD to approximately maximize $\log P(\mathbf{v})$ . (b)Train a second RBM that models $\pmb{h}^{(1)}$ and target class y by using CD- $k$ to approximately maximize $\log P(\pmb{h}^{(1)},y)$ , where $\pmb{h}^{(1)}$ is drawn from the first RBM's posterior conditioned on the data. Increase $k$ from 1 to 20 during learning. (c)Combine the two RBMs into a DBM. Train it to approximately maximize $\log P(\mathbf{v},y)$ using stochastic maximum likelihood with $k = 5$ . (d)Delete y from the model. Define a new set of features $\pmb{h}^{(1)}$ and $\pmb{h}^{(2)}$ that are obtained by running mean field inference in the model lacking y. Use these features as input to an MLP whose structure is the same as an additional pass of mean field, with an additional output layer for the estimate of y. Initialize the MLP's weights to be the same as the DBM's weights. Train the MLP to approximately maximize $\log P(y|\mathbf{v})$ using stochastic gradient descent and dropout. Figure reprinted from Goodfellow et al. (2013b).

There are two main ways to resolve the joint training problem of the deep Boltzmann machine. The first is the centered deep Boltzmann machine (Montavon and Muller, 2012), which reparametrizes the model in order to make the Hessian of the cost function better conditioned at the beginning of the learning process. This yields a model that can be trained without a greedy layer-wise pretraining stage. The resulting model obtains excellent test set log-likelihood and produces high-quality samples. Unfortunately, it remains unable to compete with appropriately regularized MLPs as a classifier. The second way to jointly train a deep Boltzmann machine is to use a multi-prediction deep Boltzmann machine (Goodfellow et al., 2013b). This model uses an alternative training criterion that allows the use of the back-propagation algorithm to avoid the problems with MCMC estimates of the gradient. Unfortunately, the new criterion does not lead to good likelihood or samples, but, compared to the MCMC approach, it does lead to superior classification performance and ability to reason well about missing inputs.

The centering trick for the Boltzmann machine is easiest to describe if we return to the general view of a Boltzmann machine as consisting of a set of units x with a weight matrix U and biases b. Recall from equation 20.2 that the energy function is given by

$$
E(\boldsymbol{x}) = - \boldsymbol{x}^{\top} \boldsymbol{U} \boldsymbol{x} - \boldsymbol{b}^{\top} \boldsymbol{x}.\tag{20.36}
$$

Using different sparsity patterns in the weight matrix U, we can implement structures of Boltzmann machines, such as RBMs or DBMs with different numbers of layers. This is accomplished by partitioning x into visible and hidden units and zeroing out elements of U for units that do not interact. The centered Boltzmann machine introduces a vector $\mu$ that is subtracted from all the states:

$$
E^{\prime}(\boldsymbol{x}; \boldsymbol{U}, \boldsymbol{b}) = -(\boldsymbol{x} - \boldsymbol{\mu})^{\top} \boldsymbol{U}(\boldsymbol{x} - \boldsymbol{\mu}) -(\boldsymbol{x} - \boldsymbol{\mu})^{\top} \boldsymbol{b}.\tag{20.37}
$$

Typically $\mu$ is a hyperparameter fixed at the beginning of training. It is usually chosen to make sure that $x - \mu \approx 0$ when the model is initialized. This reparametrization does not change the set of probability distributions that the model can represent, but it does change the dynamics of stochastic gradient descent applied to the likelihood. Specifically, in many cases, this reparametrization results in a Hessian matrix that is better conditioned. Melchior et al. (2013) experimentally confirmed that the conditioning of the Hessian matrix improves, and observed that the centering trick is equivalent to another Boltzmann machine learning technique, the enhanced gradient (Cho et al., 2011). The improved conditioning of the Hessian matrix enables learning to succeed, even in difficult cases like training a deep Boltzmann machine with multiple layers.

The other approach to jointly training deep Boltzmann machines is the multi-prediction deep Boltzmann machine (MP-DBM), which works by viewing the mean field equations as defining a family of recurrent networks for approximately solving every possible inference problem (Goodfellow et al., 2013b). Rather than training the model to maximize the likelihood, the model is trained to make each recurrent network obtain an accurate answer to the corresponding inference problem. The training process is illustrated in figure 20.5. It consists of randomly sampling a training example, randomly sampling a subset of inputs to the inference network, and then training the inference network to predict the values of the remaining units.

This general principle of back-propagating through the computational graph for approximate inference has been applied to other models (Stoyanov et al., 2011; Brakel et al., 2013). In these models and in the MP-DBM, the final loss is not the lower bound on the likelihood. Instead, the final loss is typically based on the approximate conditional distribution that the approximate inference network imposes over the missing values. This means that the training of these models is somewhat heuristically motivated. If we inspect the $p(\boldsymbol{v})$ represented by the Boltzmann machine learned by the MP-DBM, it tends to be somewhat defective, in the sense that Gibbs sampling yields poor samples.

Back-propagation through the inference graph has two main advantages. First, it trains the model as it is really used—with approximate inference. This means that approximate inference, for example, to fill in missing inputs or to perform classification despite the presence of missing inputs, is more accurate in the MP-DBM than in the original DBM. The original DBM does not make an accurate classifier on its own; the best classification results with the original DBM were based on training a separate classifier to use features extracted by the DBM, rather than by using inference in the DBM to compute the distribution over the class labels. Mean field inference in the MP-DBM performs well as a classifier without special modifications. The other advantage of back-propagating through approximate inference is that back-propagation computes the exact gradient of the loss. This is better for optimization than the approximate gradients of SML training, which suffer from both bias and variance. This probably explains why MP-DBMs may be trained jointly while DBMs require a greedy layer-wise pretraining. The disadvantage of back-propagating through the approximate inference graph is that it does not provide a way to optimize the log-likelihood, but rather gives a heuristic approximation of the generalized pseudolikelihood.

The MP-DBM inspired the NADE-k (Raiko et al., 2014) extension to the NADE framework, which is described in section 20.10.10.

The MP-DBM has some connections to dropout. Dropout shares the same parameters among many different computational graphs, with the difference between each graph being whether it includes or excludes each unit. The MP-DBM also shares parameters across many computational graphs. In the case of the MP-DBM, the difference between the graphs is whether each input unit is observed or not. When a unit is not observed, the MP-DBM does not delete it entirely as dropout does. Instead, the MP-DBM treats it as a latent variable to be inferred. One could imagine applying dropout to the MP-DBM by additionally removing some units rather than making them latent.

![Figure 20.5](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/afe598e79d040edf1c1cdb81b32982d699c089ac25a819933f05cba81578e124.jpg)  
Figure 20.5: An illustration of the multiprediction training process for a deep Boltzmann machine. Each row indicates a different example within a minibatch for the same training step. Each column represents a time step within the mean field inference process. For each example, we sample a subset of the data variables to serve as inputs to the inference process. These variables are shaded black to indicate conditioning. We then run the mean field inference process, with arrows indicating which variables influence which other variables in the process. In practical applications, we unroll mean field for several steps. In this illustration, we unroll for only two steps. Dashed arrows indicate how the process could be unrolled for more steps. The data variables that were not used as inputs to the inference process become targets, shaded in gray. We can view the inference process for each example as a recurrent network. We use gradient descent and back-propagation to train these recurrent networks to produce the correct targets given their inputs. This trains the mean field process for the MP-DBM to produce accurate estimates. Figure adapted from Goodfellow et al. (2013b).

## 20.5 Boltzmann Machines for Real-Valued Data

While Boltzmann machines were originally developed for use with binary data, many applications such as image and audio modeling seem to require the ability to represent probability distributions over real values. In some cases, it is possible to treat real-valued data in the interval $[0, 1]$ as representing the expectation of a binary variable. For example, Hinton (2000) treats grayscale images in the training set as defining $[0, 1]$ probability values. Each pixel defines the probability of a binary value being 1, and the binary pixels are all sampled independently from each other. This is a common procedure for evaluating binary models on grayscale image datasets. Nonetheless, it is not a particularly theoretically satisfying approach, and binary images sampled independently in this way have a noisy appearance. In this section, we present Boltzmann machines that define a probability density over real-valued data.

## 20.5.1 Gaussian-Bernoulli RBMs

Restricted Boltzmann machines may be developed for many exponential family conditional distributions (Welling et al., 2005). Of these, the most common is the RBM with binary hidden units and real-valued visible units, with the conditional distribution over the visible units being a Gaussian distribution whose mean is a function of the hidden units.

There are many ways of parametrizing Gaussian-Bernoulli RBMs. One choice is whether to use a covariance matrix or a precision matrix for the Gaussian distribution. Here we present the precision formulation. The modification to obtain the covariance formulation is straightforward. We wish to have the conditional distribution

$$
p(\boldsymbol{v} \mid \boldsymbol{h}) = \mathcal{N}(\boldsymbol{v}; \boldsymbol{Wh}, \boldsymbol{\beta}^{- 1}).\tag{20.38}
$$

We can find the terms we need to add to the energy function by expanding the unnormalized log conditional distribution:

$$
\log \mathcal{N}(\boldsymbol{v}; \boldsymbol{Wh}, \beta^{- 1}) = - \frac{1}{2}(\boldsymbol{v} - \boldsymbol{Wh})^{\top} \beta(\boldsymbol{v} - \boldsymbol{Wh}) + f(\beta).\tag{20.39}
$$

Here f encapsulates all the terms that are a function only of the parameters and not the random variables in the model. We can discard f because its only role is to normalize the distribution, and the partition function of whatever energy function we choose will carry out that role.

If we include all the terms (with their sign flipped) involving v from equation 20.39 in our energy function and do not add any other terms involving v, then our energy function will represent the desired conditional $p(\boldsymbol{v} \mid \boldsymbol{h})$ .

We have some freedom regarding the other conditional distribution, $p(\boldsymbol{h} \mid \boldsymbol{v})$ . Note that equation 20.39 contains a term

$$
\frac{1}{2} \boldsymbol{h}^{\top} \boldsymbol{W}^{\top} \beta \boldsymbol{W} \boldsymbol{h}.\tag{20.40}
$$

This term cannot be included in its entirety because it includes $h_{i}h_{j}$ terms. These correspond to edges between the hidden units. If we included these terms, we would have a linear factor model instead of a restricted Boltzmann machine. When designing our Boltzmann machine, we simply omit these $h_{i}h_{j}$ cross terms. Omitting them does not change the conditional $p(\boldsymbol{v} \mid \boldsymbol{h})$ , so equation 20.39 is still respected. We still have a choice, however, about whether to include the terms involving only a single $h_{i}$ . If we assume a diagonal precision matrix, we find that for each hidden unit $h_{i}$ , we have a term

$$
\frac{1}{2} h_{i} \sum_{j} \beta_{j} W_{j, i}^{2}.\tag{20.41}
$$

In the above, we used the fact that $h_{i}^{2}=h_{i}$ because $h_{i}\in\{0,1\}$ . If we include this term (with its sign flipped) in the energy function, then it will naturally bias $h_{i}$ to be turned off when the weights for that unit are large and connected to visible units with high precision. The choice of whether to include this bias term does not affect the family of distributions that the model can represent (assuming that we include bias parameters for the hidden units), but it does affect the learning dynamics of the model. Including the term may help the hidden unit activations remain reasonable even when the weights rapidly increase in magnitude.

One way to define the energy function on a Gaussian-Bernoulli RBM is thus:

$$
E(\boldsymbol{v}, \boldsymbol{h}) = \frac{1}{2} \boldsymbol{v}^{\top}(\boldsymbol{\beta} \odot \boldsymbol{v}) -(\boldsymbol{v} \odot \boldsymbol{\beta})^{\top} \boldsymbol{Wh} - \boldsymbol{b}^{\top} \boldsymbol{h},\tag{20.42}
$$

but we may also add extra terms or parametrize the energy in terms of the variance rather than precision if we choose.

In this derivation, we have not included a bias term on the visible units, but one could easily be added. One final source of variability in the parametrization of a Gaussian-Bernoulli RBM is the choice of how to treat the precision matrix. It may be either fixed to a constant (perhaps estimated based on the marginal precision of the data) or learned. It may also be a scalar times the identity matrix, or it may be a diagonal matrix. Typically we do not allow the precision matrix to be nondiagonal in this context, because some operations on the Gaussian distribution require inverting the matrix, and a diagonal matrix can be inverted trivially. In the sections ahead, we will see that other forms of Boltzmann machines permit modeling the covariance structure, using various techniques to avoid inverting the precision matrix.

## 20.5.2 Undirected Models of Conditional Covariance

While the Gaussian RBM has been the canonical energy model for real-valued data, Ranzato et al. (2010a) argue that the Gaussian RBM inductive bias is not well suited to the statistical variations present in some types of real-valued data, especially natural images. The problem is that much of the information content present in natural images is embedded in the covariance between pixels rather than in the raw pixel values. In other words, it is the relationships between pixels and not their absolute values where most of the useful information in images resides. Since the Gaussian RBM only models the conditional mean of the input given the hidden units, it cannot capture conditional covariance information. In response to these criticisms, alternative models have been proposed that attempt to better account for the covariance of real-valued data. These models include the mean and covariance RBM (mcRBM $^{1}$ ), the mean product of Student t-distribution (mPoT) model, and the spike and slab RBM (ssRBM).

Mean and Covariance RBM The mcRBM uses its hidden units to independently encode the conditional mean and covariance of all observed units. The mcRBM hidden layer is divided into two groups of units: mean units and covariance units. The group that models the conditional mean is simply a Gaussian RBM. The other half is a covariance RBM (Ranzato et al., 2010a), also called a cRBM, whose components model the conditional covariance structure, as described below.

Specifically, with binary mean units $\boldsymbol{h}^{(m)}$ and binary covariance units $\boldsymbol{h}^{(c)}$ , the mcRBM model is defined as the combination of two energy functions:

$$
E_{\mathrm{mc}}(\pmb{x}, \pmb{h}^{(m)}, \pmb{h}^{(c)}) = E_{m}(\pmb{x}, \pmb{h}^{(m)}) + E_{c}(\pmb{x}, \pmb{h}^{(c)}),\tag{20.43}
$$

where $E_{m}$ is the standard Gaussian-Bernoulli RBM energy function, $^{2}$

$$
E_{m}(\boldsymbol{x}, \boldsymbol{h}^{(m)}) = \frac{1}{2} \boldsymbol{x}^{\top} \boldsymbol{x} - \sum_{j} \boldsymbol{x}^{\top} \boldsymbol{W}_{:, j} h_{j}^{(m)} - \sum_{j} b_{j}^{(m)} h_{j}^{(m)},\tag{20.44}
$$

and $E_{c}$ is the cRBM energy function that models the conditional covariance information:

$$
E_{c}(\boldsymbol{x}, \boldsymbol{h}^{(c)}) = \frac{1}{2} \sum_{j} h_{j}^{(c)} \left(\boldsymbol{x}^{\top} \boldsymbol{r}^{(j)}\right)^{2} - \sum_{j} b_{j}^{(c)} h_{j}^{(c)}.\tag{20.45}
$$

The parameter $\boldsymbol{r}^{(j)}$ corresponds to the covariance weight vector associated with $h_{j}^{(c)}$ , and $\boldsymbol{b}^{(c)}$ is a vector of covariance offsets. The combined energy function defines a joint distribution,

$$
p_{\mathrm{mc}}(\boldsymbol{x}, \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)}) = \frac{1}{Z} \exp \left\{- E_{\mathrm{mc}}(\boldsymbol{x}, \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)}) \right\},\tag{20.46}
$$

and a corresponding conditional distribution over the observations given $\boldsymbol{h}^{(m)}$ and $\boldsymbol{h}^{(c)}$ as a multivariate Gaussian distribution:

$$
p_{\mathrm{mc}}(\boldsymbol{x} \mid \boldsymbol{h}^{(m)}, h^{(c)}) = \mathcal{N} \left(\boldsymbol{x}; C_{\boldsymbol{x} | \boldsymbol{h}}^{\mathrm{mc}} \left(\sum_{j} \boldsymbol{W}_{:, j} h_{j}^{(m)}\right), C_{\boldsymbol{x} | \boldsymbol{h}}^{\mathrm{mc}}\right).\tag{20.47}
$$

Note that the covariance matrix $C_{\boldsymbol{x}|\boldsymbol{h}}^{\mathrm{mc}} = \left(\sum_{j} h_{j}^{(c)} \boldsymbol{r}^{(j)} \boldsymbol{r}^{(j) \top} + \boldsymbol{I} \right)^{-1}$ is nondiagonal and that W is the weight matrix associated with the Gaussian RBM modeling the conditional means. It is difficult to train the mcRBM via contrastive divergence or persistent contrastive divergence because of its nondiagonal conditional covariance structure. CD and PCD require sampling from the joint distribution of $x, h^{(m)}, h^{(c)}$ , which, in a standard RBM, is accomplished by Gibbs sampling over the conditionals. However, in the mcRBM, sampling from $p_{\mathrm{mc}}(\boldsymbol{x} \mid \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)})$ requires computing $(\boldsymbol{C}^{\mathrm{mc}})^{-1}$ at every iteration of learning. This can be an impractical computational burden for larger observations. Ranzato and Hinton (2010) avoid direct sampling from the conditional $p_{\mathrm{mc}}(\boldsymbol{x} \mid \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)})$ by sampling directly from the marginal $p(\boldsymbol{x})$ using Hamiltonian (hybrid) Monte Carlo (Neal, 1993) on the mcRBM free energy.

Mean Product of Student t-distributions The mean product of Student t-distribution (mPoT) model (Ranzato et al., 2010b) extends the PoT model (Welling et al., 2003a) in a manner similar to how the mcRBM extends the cRBM. This is achieved by including nonzero Gaussian means by the addition of Gaussian RBM-like hidden units. Like the mcRBM, the PoT conditional distribution over the observation is a multivariate Gaussian (with nondiagonal covariance) distribution; however, unlike the mcRBM, the complementary conditional distribution over the hidden variables is given by conditionally independent Gamma distributions. The Gamma distribution $\mathcal{G}(k,\theta)$ is a probability distribution over positive real numbers, with mean $k\theta$ . It is not necessary to have a more detailed understanding of the Gamma distribution to understand the basic ideas underlying the mPoT model.

The mPoT energy function is

$$
\begin{array}{l} E_{\mathrm{mPoT}}(\boldsymbol{x}, \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)}) \\ = E_{\tau_{j}^{(c)}}(\boldsymbol{x}, \boldsymbol{h}^{(m)}) + \sum_{j} \left(h_{j}^{(c)} \left(1 + \frac{1}{2} \left(\boldsymbol{r}^{(j) \top} \boldsymbol{x}\right)^{2}\right) +(1 - \gamma_{j}) \log h_{j}^{(c)}\right), \end{array} \tag{20.48}\tag{20.49}
$$

where $\boldsymbol{r}^{(j)}$ is the covariance weight vector associated with unit $h_{j}^{(c)}$ , and $E_{m}(\boldsymbol{x},\boldsymbol{h}^{(m)})$ is as defined in equation 20.44.

Just as with the mcRBM, the mPoT model energy function specifies a multivariate Gaussian, with a conditional distribution over x that has nondiagonal covariance. Learning in the mPoT model—again, like the mcRBM—is complicated by the inability to sample from the nondiagonal Gaussian conditional $p_{\mathrm{mPoT}}(\boldsymbol{x} \mid \boldsymbol{h}^{(m)}, \boldsymbol{h}^{(c)})$ , so Ranzato et al. (2010b) also advocate direct sampling of $p(\boldsymbol{x})$ via Hamiltonian (hybrid) Monte Carlo.

Spike and Slab Restricted Boltzmann Machines Spike and slab restricted Boltzmann machines (Courville et al., 2011) or ssRBMs provide another means of modeling the covariance structure of real-valued data. Compared to mcRBMs, ssRBMs have the advantage of requiring neither matrix inversion nor Hamiltonian Monte Carlo methods. Like the mcRBM and the mPoT model, the ssRBM's binary hidden units encode the conditional covariance across pixels through the use of auxiliary real-valued variables.

The spike and slab RBM has two sets of hidden units: binary spike units h and real-valued slab units s. The mean of the visible units conditioned on the hidden units is given by $(\boldsymbol{h} \odot \boldsymbol{s})\boldsymbol{W}^{\top}$ . In other words, each column $W_{:,i}$ defines a component that can appear in the input when $h_{i}=1$ . The corresponding spike variable $h_{i}$ determines whether that component is present at all. The corresponding slab variable $s_{i}$ determines the intensity of that component, if it is present. When a spike variable is active, the corresponding slab variable adds variance to the input along the axis defined by $W_{:,i}$ . This allows us to model the covariance of the inputs. Fortunately, contrastive divergence and persistent contrastive divergence with Gibbs sampling are still applicable. There is no need to invert any matrix.

Formally, the ssRBM model is defined via its energy function:

$$
\begin{array}{rl} & E_{\mathrm{ss}}(\boldsymbol{x}, \boldsymbol{s}, \boldsymbol{h}) = - \sum_{i} \boldsymbol{x}^{\top} \boldsymbol{W}_{:, i} s_{i} h_{i} + \frac{1}{2} \boldsymbol{x}^{\top} \left(\boldsymbol{\Lambda} + \sum_{i} \boldsymbol{\Phi}_{i} h_{i}\right) \boldsymbol{x} \\ & \qquad + \frac{1}{2} \sum_{i} \alpha_{i} s_{i}^{2} - \sum_{i} \alpha_{i} \mu_{i} s_{i} h_{i} - \sum_{i} b_{i} h_{i} + \sum_{i} \alpha_{i} \mu_{i}^{2} h_{i}, \end{array}\tag{20.50}
$$

(20.51)

where $b_{i}$ is the offset of the spike $h_{i}$ , and $\Lambda$ is a diagonal precision matrix on the observations x. The parameter $\alpha_{i} > 0$ is a scalar precision parameter for the real-valued slab variable $s_{i}$ . The parameter $\Phi_{i}$ is a nonnegative diagonal matrix that defines an h-modulated quadratic penalty on x. Each $\mu_{i}$ is a mean parameter for the slab variable $s_{i}$ .

With the joint distribution defined via the energy function, deriving the ssRBM conditional distributions is relatively straightforward. For example, by marginalizing out the slab variables s, the conditional distribution over the observations given the binary spike variables h is given by

$$
p_{\mathrm{ss}}(\boldsymbol{x} \mid \boldsymbol{h}) = \frac{1}{P(\boldsymbol{h})} \frac{1}{Z} \int \exp \left\{- E(\boldsymbol{x}, \boldsymbol{s}, \boldsymbol{h}) \right\} d \boldsymbol{s}\tag{20.52}
$$

$$
= \mathcal{N} \left(\boldsymbol{x}; C_{\boldsymbol{x} | \boldsymbol{h}}^{\mathrm{ss}} \sum_{i} \boldsymbol{W}_{:, i} \mu_{i} h_{i}, C_{\boldsymbol{x} | \boldsymbol{h}}^{\mathrm{ss}}\right)\tag{20.53}
$$

where $C_{\boldsymbol{x}|\boldsymbol{h}}^{\mathrm{ss}} = \left(\Lambda + \sum_{i} \Phi_ih_i - \sum_{i} \alpha_i^{-1} h_i \boldsymbol{W}_{:,i} \boldsymbol{W}_{:,i}^\top\right)^{-1}$ . The last equality holds only if the covariance matrix $C_{\boldsymbol{x}|\boldsymbol{h}}^{\mathrm{ss}}$ is positive definite.

Gating by the spike variables means that the true marginal distribution over $h \otimes s$ is sparse. This is different from sparse coding, where samples from the model “almost never” (in the measure theoretic sense) contain zeros in the code, and MAP inference is required to impose sparsity.

Comparing the ssRBM to the mcRBM and the mPoT models, the ssRBM parametrizes the conditional covariance of the observation in a significantly different way. The mcRBM and mPoT both model the covariance structure of the observation as $\left(\sum_{j}h_{j}^{(c)}\boldsymbol{r}^{(j)}\boldsymbol{r}^{(j)\top}+\boldsymbol{I}\right)^{-1}$ , using the activation of the hidden units $h_{j}>0$ to enforce constraints on the conditional covariance in the direction $\boldsymbol{r}^{(j)}$ . In contrast, the ssRBM specifies the conditional covariance of the observations using the hidden spike activations $h_{i}=1$ to pinch the precision matrix along the direction specified by the corresponding weight vector. The ssRBM conditional covariance is similar to that given by a different model: the product of probabilistic principal components analysis (PoPPCA) (Williams and Agakov, 2002). In the overcomplete setting, sparse activations with the ssRBM parametrization permit significant variance (above the nominal variance given by $\Lambda^{-1}$ ) only in the selected directions of the sparsely activated $h_{i}$ . In the mcRBM or mPoT models, an overcomplete representation would mean that to capture variation in a particular direction in the observation space would require removing potentially all constraints with positive projection in that direction. This would suggest that these models are less well suited to the overcomplete setting.

The primary disadvantage of the spike and slab restricted Boltzmann machine is that some setting of the parameters can correspond to a covariance matrix that is not positive definite. Such a covariance matrix places more unnormalized probability on values that are farther from the mean, causing the integral over all possible outcomes to diverge. Generally this issue can be avoided with simple heuristic tricks. There is not yet any theoretically satisfying solution. Using constrained optimization to explicitly avoid the regions where the probability is undefined is difficult to do without being overly conservative and also preventing the model from accessing high-performing regions of parameter space.

Qualitatively, convolutional variants of the ssRBM produce excellent samples of natural images. Some examples are shown in figure 16.1.

The ssRBM allows for several extensions. Including higher-order interactions and average-pooling of the slab variables (Courville et al., 2014) enables the model to learn excellent features for a classifier when labeled data is scarce. Adding a term to the energy function that prevents the partition function from becoming undefined results in a sparse coding model, spike and slab sparse coding (Goodfellow et al., 2013d), also known as S3C.

## 20.6 Convolutional Boltzmann Machines

As we discuss in chapter 9, extremely high-dimensional inputs such as images place great strain on the computation, memory and statistical requirements of machine learning models. Replacing matrix multiplication by discrete convolution with a small kernel is the standard way of solving these problems for inputs that have translation invariant spatial or temporal structure. Desjardins and Bengio (2008) showed that this approach works well when applied to RBMs.

Deep convolutional networks usually require a pooling operation so that the spatial size of each successive layer decreases. Feedforward convolutional networks often use a pooling function such as the maximum of the elements to be pooled. It is unclear how to generalize this to the setting of energy-based models. We could introduce a binary pooling unit p over n binary detector units d and enforce $p = \max_{i} d_{i}$ by setting the energy function to be $\infty$ whenever that constraint is violated. This does not scale well though, as it requires evaluating $2^{n}$ different energy configurations to compute the normalization constant. For a small $3 \times 3$ pooling region this requires $2^{9} = 512$ energy function evaluations per pooling unit!

Lee et al. (2009) developed a solution to this problem called probabilistic max pooling (not to be confused with “stochastic pooling,” which is a technique for implicitly constructing ensembles of convolutional feedforward networks). The strategy behind probabilistic max pooling is to constrain the detector units so at most one may be active at a time. This means there are only $n + 1$ total states (one state for each of the n detector units being on, and an additional state corresponding to all the detector units being off). The pooling unit is on if and only if one of the detector units is on. The state with all units off is assigned energy zero. We can think of this as describing a model with a single variable that has $n + 1$ states, or equivalently as a model that has $n + 1$ variables that assigns energy $\infty$ to all but $n + 1$ joint assignments of variables.

While efficient, probabilistic max pooling does force the detector units to be mutually exclusive, which may be a useful regularizing constraint in some contexts or a harmful limit on model capacity in other contexts. It also does not support overlapping pooling regions. Overlapping pooling regions are usually required to obtain the best performance from feedforward convolutional networks, so this constraint probably greatly reduces the performance of convolutional Boltzmann machines.

Lee et al. (2009) demonstrated that probabilistic max pooling could be used to build convolutional deep Boltzmann machines. $^{3}$ This model is able to perform operations such as filling in missing portions of its input. While intellectually appealing, this model is challenging to make work in practice, and usually does not perform as well as a classifier as traditional convolutional networks trained with supervised learning.

Many convolutional models work equally well with inputs of many different spatial sizes. For Boltzmann machines, it is difficult to change the input size for various reasons. The partition function changes as the size of the input changes. Moreover, many convolutional networks achieve size invariance by scaling up the size of their pooling regions proportional to the size of the input, but scaling Boltzmann machine pooling regions is awkward. Traditional convolutional neural networks can use a fixed number of pooling units and dynamically increase the size of their pooling regions to obtain a fixed-size representation of a variably sized input. For Boltzmann machines, large pooling regions become too expensive for the naive approach. The approach of Lee et al. (2009) of making each of the detector units in the same pooling region mutually exclusive solves the computational problems but still does not allow variably size pooling regions. For example, suppose we learn a model with $2 \times 2$ probabilistic max pooling over detector units that learn edge detectors. This enforces the constraint that only one of these edges may appear in each $2 \times 2$ region. If we then increase the size of the input image by 50 percent in each direction, we would expect the number of edges to increase correspondingly. Instead, if we increase the size of the pooling regions by 50 percent in each direction to $3 \times 3$ , then the mutual exclusivity constraint now specifies that each of these edges may appear only once in a $3 \times 3$ region. As we grow a model's input image in this way, the model generates edges with less density. Of course, these issues only arise when the model must use variable amounts of pooling in order to emit a fixed-size output vector. Models that use probabilistic max pooling may still accept variably sized input images as long as the output of the model is a feature map that can scale in size proportional to the input image.

Pixels at the boundary of the image also pose some difficulty, which is exacerbated by the fact that connections in a Boltzmann machine are symmetric. If we do not implicitly zero pad the input, there will be fewer hidden units than visible units, and the visible units at the boundary of the image will not be modeled well because they lie in the receptive field of fewer hidden units. However, if we do implicitly zero pad the input, then the hidden units at the boundary will be driven by fewer input pixels and may fail to activate when needed.

## 20.7 Boltzmann Machines for Structured or Sequential Outputs

In the structured output scenario, we wish to train a model that can map from some input x to some output y, and the different entries of y are related to each other and must obey some constraints. For example, in the speech synthesis task, y is a waveform, and the entire waveform must sound like a coherent utterance.

A natural way to represent the relationships between the entries in y is to use a probability distribution $p(\mathbf{y} \mid \mathbf{x})$ . Boltzmann machines, extended to model conditional distributions, can supply this probabilistic model.

The same tool of conditional modeling with a Boltzmann machine can be used not just for structured output tasks, but also for sequence modeling. In the latter case, rather than mapping an input x to an output y, the model must estimate a probability distribution over a sequence of variables, $p(\mathbf{x}^{(1)},\ldots,\mathbf{x}^{(\tau)})$ . Conditional Boltzmann machines can represent factors of the form $p(\mathbf{x}^{(t)} \mid \mathbf{x}^{(1)},\ldots,\mathbf{x}^{(t-1)})$ in order to accomplish this task.

An important sequence modeling task for the video game and film industry is modeling sequences of joint angles of skeletons used to render 3-D characters. These sequences are often collected using motion capture systems to record the movements of actors. A probabilistic model of a character's movement allows the generation of new, previously unseen, but realistic animations. To solve this sequence modeling task, Taylor et al. (2007) introduced a conditional RBM modeling $p(\boldsymbol{x}^{(t)} \mid \boldsymbol{x}^{(t-1)}, \ldots, \boldsymbol{x}^{(t-m)})$ for small $m$ . The model is an RBM over $p(\boldsymbol{x}^{(t)})$ whose bias parameters are a linear function of the preceding $m$ values of $\boldsymbol{x}$ . When we condition on different values of $\boldsymbol{x}^{(t-1)}$ and earlier variables, we get a new RBM over $\boldsymbol{x}$ . The weights in the RBM over $\boldsymbol{x}$ never change, but by conditioning on different past values, we can change the probability of different hidden units in the RBM being active. By activating and deactivating different subsets of hidden units, we can make large changes to the probability distribution induced on $\boldsymbol{x}$ . Other variants of conditional RBM (Mnih et al., 2011) and other variants of sequence modeling using conditional RBMs are possible (Taylor and Hinton, 2009; Sutskever et al., 2009; Boulanger-Lewandowski et al., 2012).

Another sequence modeling task is to model the distribution over sequences of musical notes used to compose songs. Boulanger-Lewandowski et al. (2012) introduced the RNN-RBM sequence model and applied it to this task. The RNN-RBM is a generative model of a sequence of frames $\boldsymbol{x}^{(t)}$ consisting of an RNN that emits the RBM parameters for each time step. Unlike previous approaches in which only the bias parameters of the RBM varied from one time step to the next, the RNN-RBM uses the RNN to emit all the parameters of the RBM, including the weights. To train the model, we need to be able to back-propagate the gradient of the loss function through the RNN. The loss function is not applied directly to the RNN outputs. Instead, it is applied to the RBM. This means that we must approximately differentiate the loss with respect to the RBM parameters using contrastive divergence or a related algorithm. This approximate gradient may then be back-propagated through the RNN using the usual back-propagation through time algorithm.

## 20.8 Other Boltzmann Machines

Many other variants of Boltzmann machines are possible.

Boltzmann machines may be extended with different training criteria. We have focused on Boltzmann machines trained to approximately maximize the generative criterion $\log p(\boldsymbol{v})$ . It is also possible to train discriminative RBMs that aim to maximize $\log p(y \mid \boldsymbol{v})$ instead (Larochelle and Bengio, 2008). This approach often performs the best when using a linear combination of both the generative and the discriminative criteria. Unfortunately, RBMs do not seem to be as powerful supervised learners as MLPs, at least using existing methodology.

Most Boltzmann machines used in practice have only second-order interactions in their energy functions, meaning that their energy functions are the sum of many terms, and each individual term includes only the product between two random variables. An example of such a term is $v_{i}W_{i,j}h_{j}$ . It is also possible to train higher-order Boltzmann machines (Šejnowski, 1987) whose energy function terms involve the products between many variables. Three-way interactions between a hidden unit and two different images can model spatial transformations from one frame of video to the next (Memisevic and Hinton, 2007, 2010). Multiplication by a one-hot class variable can change the relationship between visible and hidden units depending on which class is present (Nair and Hinton, 2009). One recent example of the use of higher-order interactions is a Boltzmann machine with two groups of hidden units, one group that interacts with both the visible units v and the class label y, and another group that interacts only with the v input values (Luo et al., 2011). This can be interpreted as encouraging some hidden units to learn to model the input using features that are relevant to the class, but also to learn extra hidden units that explain nuisance details necessary for the samples of v to be realistic without determining the class of the example. Another use of higher-order interactions is to gate some features. Sohn et al. (2013) introduced a Boltzmann machine with third-order interactions and binary mask variables associated with each visible unit. When these masking variables are set to zero, they remove the influence of a visible unit on the hidden units. This allows visible units that are not relevant to the classification problem to be removed from the inference pathway that estimates the class.

More generally, the Boltzmann machine framework is a rich space of models permitting many more model structures than have been explored so far. Developing a new form of Boltzmann machine requires some more care and creativity than developing a new neural network layer, because it is often difficult to find an energy function that maintains tractability of all the different conditional distributions needed to use the Boltzmann machine. Despite this required effort, the field remains open to innovation.

## 20.9 Back-Propagation through Random Operations

Traditional neural networks implement a deterministic transformation of some input variables x. When developing generative models, we often wish to extend neural networks to implement stochastic transformations of x. One straightforward way to do this is to augment the neural network with extra inputs z that are sampled from some simple probability distribution, such as a uniform or Gaussian distribution. The neural network can then continue to perform deterministic computation internally, but the function $f(\boldsymbol{x}, \boldsymbol{z})$ will appear stochastic to an observer who does not have access to z. Provided that f is continuous and differentiable, we can then compute the gradients necessary for training using back-propagation as usual.

As an example, let us consider the operation consisting of drawing samples y from a Gaussian distribution with mean $\mu$ and variance $\sigma^{2}$ :

$$
y \sim \mathcal{N}(\mu, \sigma^{2}).\tag{20.54}
$$

Because an individual sample of y is produced not by a function, but rather by a sampling process whose output changes every time we query it, it may seem counterintuitive to take the derivatives of y with respect to the parameters of its distribution, $\mu$ and $\sigma^{2}$ . However, we can rewrite the sampling process as transforming an underlying random value $z \sim \mathcal{N}(z;0,1)$ to obtain a sample from the desired distribution:

$$
y = \mu + \sigma z.\tag{20.55}
$$

We are now able to back-propagate through the sampling operation, by regarding it as a deterministic operation with an extra input z. Crucially, the extra input is a random variable whose distribution is not a function of any of the variables whose derivatives we want to calculate. The result tells us how an infinitesimal change in $\mu$ or $\sigma$ would change the output if we could repeat the sampling operation again with the same value of z.

Being able to back-propagate through this sampling operation allows us to incorporate it into a larger graph. We can build elements of the graph on top of the output of the sampling distribution. For example, we can compute the derivatives of some loss function $J(y)$ . We can also build elements of the graph whose outputs are the inputs or the parameters of the sampling operation. For example, we could build a larger graph with $\mu = f(\boldsymbol{x}; \boldsymbol{\theta})$ and $\sigma = g(\boldsymbol{x}; \boldsymbol{\theta})$ . In this augmented graph, we can use back-propagation through these functions to derive $\nabla_{\boldsymbol{\theta}} J(y)$ .

The principle used in this Gaussian sampling example is more generally applicable. We can express any probability distribution of the form $p(y; \boldsymbol{\theta})$ or $p(y \mid x; \boldsymbol{\theta})$ as $p(y \mid \omega)$ , where $\omega$ is a variable containing both parameters $\theta$ , and if applicable, the inputs x. Given a value y sampled from distribution $p(y \mid \omega)$ , where $\omega$ may in turn be a function of other variables, we can rewrite

$$
\mathbf{y} \sim p(\mathbf{y} \mid \boldsymbol{\omega})\tag{20.56}
$$

as

$$
\boldsymbol{y} = f(\boldsymbol{z}; \boldsymbol{\omega}),\tag{20.57}
$$

where z is a source of randomness. We may then compute the derivatives of y with respect to $\omega$ using traditional tools such as the back-propagation algorithm applied to f, as long as f is continuous and differentiable almost everywhere. Crucially, $\omega$ must not be a function of z, and z must not be a function of $\omega$ . This technique is often called the reparametrization trick, stochastic back-propagation, or perturbation analysis.

The requirement that f be continuous and differentiable of course requires y to be continuous. If we wish to back-propagate through a sampling process that produces discrete-valued samples, it may still be possible to estimate a gradient on $\omega$ , using reinforcement learning algorithms such as variants of the REINFORCE algorithm (Williams, 1992), discussed in section 20.9.1.

In neural network applications, we typically choose z to be drawn from some simple distribution, such as a unit uniform or unit Gaussian distribution, and achieve more complex distributions by allowing the deterministic portion of the network to reshape its input.

The idea of propagating gradients or optimizing through stochastic operations dates back to the mid-twentieth century (Price, 1958; Bonnet, 1964) and was first used for machine learning in the context of reinforcement learning (Williams, 1992). More recently, it has been applied to variational approximations (Opper and Archambeau, 2009) and stochastic and generative neural networks (Bengio et al., 2013b; Kingma, 2013; Kingma and Welling, 2014b,a; Rezende et al., 2014; Goodfellow et al., 2014c). Many networks, such as denoising autoencoders or networks regularized with dropout, are also naturally designed to take noise as an input without requiring any special reparametrization to make the noise independent from the model.

## 20.9.1 Back-Propagating through Discrete Stochastic Operations

When a model emits a discrete variable y, the reparametrization trick is not applicable. Suppose that the model takes inputs x and parameters $\theta$ , both encapsulated in the vector $\omega$ , and combines them with random noise z to produce y:

$$
\boldsymbol{y} = f(\boldsymbol{z}; \omega).\tag{20.58}
$$

Because y is discrete, f must be a step function. The derivatives of a step function are not useful at any point. Right at each step boundary, the derivatives are undefined, but that is a small problem. The large problem is that the derivatives are zero almost everywhere on the regions between step boundaries. The derivatives of any cost function $J(y)$ therefore do not give any information for how to update the model parameters $\theta$ .

The REINFORCE algorithm (REward Increment - nonnegative Factor $\times$ Offset Reinforcement $\times$ Characteristic Eligibility) provides a framework defining a family of simple but powerful solutions (Williams, 1992). The core idea is that even though $J(f(z;\omega))$ is a step function with useless derivatives, the expected cost $\mathbb{E}_{\mathbf{z}\sim p(\mathbf{z})}J(f(z;\omega))$ is often a smooth function amenable to gradient descent. Although that expectation is typically not tractable when $\pmb{y}$ is high-dimensional (or is the result of the composition of many discrete stochastic decisions), it can be estimated without bias using a Monte Carlo average. The stochastic estimate of the gradient can be used with SGD or other stochastic gradient-based optimization techniques.

The simplest version of REINFORCE can be derived by simply differentiating the expected cost:

$$
\mathbb{E}_{z}[J(\boldsymbol{y})] = \sum_{\boldsymbol{y}} J(\boldsymbol{y}) p(\boldsymbol{y}),\tag{20.59}
$$

$$
\frac{\partial \mathbb{E}[J(\boldsymbol{y})]}{\partial \boldsymbol{\omega}} = \sum_{y} J(\boldsymbol{y}) \frac{\partial p(\boldsymbol{y})}{\partial \boldsymbol{\omega}}.\tag{20.60}
$$

$$
= \sum_{y} J(\boldsymbol{y}) p(\boldsymbol{y}) \frac{\partial \log p(\boldsymbol{y})}{\partial \omega}\tag{20.61}
$$

$$
\approx \frac{1}{m} \sum_{\mathbf{y}^{(i)} \sim p(\mathbf{y}), i = 1}^{m} J(\mathbf{y}^{(i)}) \frac{\partial \log p(\mathbf{y}^{(i)})}{\partial \boldsymbol{\omega}}.\tag{20.62}
$$

Equation 20.60 relies on the assumption that J does not reference $\omega$ directly. It is trivial to extend the approach to relax this assumption. Equation 20.61 exploits the derivative rule for the logarithm, $\frac{\partial\log p(\boldsymbol{y})}{\partial\boldsymbol{\omega}}=\frac{1}{p(\boldsymbol{y})}\frac{\partial p(\boldsymbol{y})}{\partial\boldsymbol{\omega}}$ . Equation 20.62 gives an unbiased Monte Carlo estimator of the gradient.

Anywhere we write $p(\pmb{y})$ in this section, one could equally write $p(\pmb{y} \mid \pmb{x})$ . This is because $p(\pmb{y})$ is parametrized by $\omega$ , and $\omega$ contains both $\theta$ and $\pmb{x}$ , if $\pmb{x}$ is present.

One issue with the simple REINFORCE estimator is that it has a very high variance, so that many samples of y need to be drawn to obtain a good estimator of the gradient, or equivalently, if only one sample is drawn, SGD will converge very slowly and will require a smaller learning rate. It is possible to considerably reduce the variance of that estimator by using variance reduction methods (Wilson, 1984; L'Ecuyer, 1994). The idea is to modify the estimator so that its expected value remains unchanged but its variance gets reduced. In the context of REINFORCE, the proposed variance reduction methods involve the computation of a baseline that is used to offset $J(\mathbf{y})$ . Note that any offset $b(\omega)$ that does not depend on y would not change the expectation of the estimated gradient because

$$
E_{p(\boldsymbol{y})} \left[\frac{\partial \log p(\boldsymbol{y})}{\partial \boldsymbol{\omega}} \right] = \sum_{\boldsymbol{y}} p(\boldsymbol{y}) \frac{\partial \log p(\boldsymbol{y})}{\partial \boldsymbol{\omega}}\tag{20.63}
$$

$$
.= \sum_{\boldsymbol{y}} \frac{\partial p(\boldsymbol{y})}{\partial \omega}\tag{20.64}
$$

$$
= \frac{\partial}{\partial \boldsymbol{\omega}} \sum_{\boldsymbol{y}} p(\boldsymbol{y}) = \frac{\partial}{\partial \boldsymbol{\omega}} 1 = 0,\tag{20.65}
$$

which means that

$$
E_{p(\boldsymbol{y})} \left[(J(\boldsymbol{y}) - b(\boldsymbol{\omega})) \frac{\partial \log p(\boldsymbol{y})}{\partial \boldsymbol{\omega}} \right] = E_{p(\boldsymbol{y})} \left[J(\boldsymbol{y}) \frac{\partial \log p(\boldsymbol{y})}{\partial \boldsymbol{\omega}} \right] - b(\boldsymbol{\omega}) E_{p(\boldsymbol{y})} \left[\frac{\partial \log p(\boldsymbol{y})}{\partial \boldsymbol{\omega}} \right]\tag{20.66}
$$

$$
= E_{p(\boldsymbol{y})} \left[J(\boldsymbol{y}) \frac{\partial \log p(\boldsymbol{y})}{\partial \omega} \right].\tag{20.67}
$$

Furthermore, we can obtain the optimal $b(\omega)$ by computing the variance of $(J(\boldsymbol{y}) - b(\omega))\frac{\partial\log p(\boldsymbol{y})}{\partial\omega}$ under $p(\boldsymbol{y})$ and minimizing with respect to $b(\omega)$ . What we find is that this optimal baseline $b^{*}(\omega)_i$ is different for each element $\omega_i$ of the vector $\omega$ :

$$
b^{*}(\boldsymbol{\omega})_{i} = \frac{E_{p(\boldsymbol{y})} \left[J(\boldsymbol{y}) \frac{\partial \log p(\boldsymbol{y})^{2}}{\partial \omega_{i}} \right]}{E_{p(\boldsymbol{y})} \left[\frac{\partial \log p(\boldsymbol{y})^{2}}{\partial \omega_{i}} \right]}.\tag{20.68}
$$

The gradient estimator with respect to $\omega_{i}$ then becomes

$$
(J(\boldsymbol{y}) - b(\boldsymbol{\omega})_{i}) \frac{\partial \log p(\boldsymbol{y})}{\partial \omega_{i}},\tag{20.69}
$$

where $b(\boldsymbol{\omega})_{i}$ estimates the above $b^{*}(\boldsymbol{\omega})_{i}$ . The estimate b is usually obtained by adding extra outputs to the neural network and training the new outputs to estimate $E_{p(\boldsymbol{y})}[J(\boldsymbol{y})\frac{\partial\log p(\boldsymbol{y})^{2}}{\partial\omega_{i}}]$ and $E_{p(\boldsymbol{y})}\left[\frac{\partial\log p(\boldsymbol{y})^{2}}{\partial\omega_{i}}\right]$ for each element of $\omega$ . These extra outputs can be trained with the mean squared error objective, using respectively $J(\boldsymbol{y})\frac{\partial\log p(\boldsymbol{y})^{2}}{\partial\omega_{i}}$ and $\frac{\partial\log p(\boldsymbol{y})^{2}}{\partial\omega_{i}}$ as targets when y is sampled from $p(\boldsymbol{y})$ , for a given $\omega$ . The estimate b may then be recovered by substituting these estimates into equation 20.68. Mnih and Gregor (2014) preferred to use a single shared output (across all elements i of $\omega$ ) trained with the target $J(\boldsymbol{y})$ , using as baseline $b(\boldsymbol{\omega}) \approx E_{p(\boldsymbol{y})}[J(\boldsymbol{y})]$ .

Variance reduction methods have been introduced in the reinforcement learning context (Sutton et al., 2000; Weaver and Tao, 2001), generalizing previous work on the case of binary reward by Dayan (1990). See Bengio et al. (2013b), Mnih and Gregor (2014), Ba et al. (2014), Mnih et al. (2014), or Xu et al. (2015) for examples of modern uses of the REINFORCE algorithm with reduced variance in the context of deep learning. In addition to the use of an input-dependent baseline $b(\omega)$ , Mnih and Gregor (2014) found that the scale of $(J(\mathbf{y}) - b(\omega))$ could be adjusted during training by dividing it by its standard deviation estimated by a moving average during training, as a kind of adaptive learning rate, to counter the effect of important variations that occur during the course of training in the magnitude of this quantity. Mnih and Gregor (2014) called this heuristic variance normalization.

REINFORCE-based estimators can be understood as estimating the gradient by correlating choices of y with corresponding values of $J(\mathbf{y})$ . If a good value of y is unlikely under the current parametrization, it might take a long time to obtain it by chance and get the required signal that this configuration should be reinforced.

## 20.10 Directed Generative Nets

As discussed in chapter 16, directed graphical models make up a prominent class of graphical models. While directed graphical models have been very popular within the greater machine learning community, within the smaller deep learning community they have until roughly 2013 been overshadowed by undirected models such as the RBM.

In this section we review some of the standard directed graphical models that have traditionally been associated with the deep learning community.

We have already described deep belief networks, which are a partially directed model. We have also already described sparse coding models, which can be thought of as shallow directed generative models. They are often used as feature learners in the context of deep learning, though they tend to perform poorly at sample generation and density estimation. We now describe a variety of deep, fully directed models.

## 20.10.1 Sigmoid Belief Networks

Sigmoid belief networks (Neal, 1990) are a simple form of directed graphical model with a specific kind of conditional probability distribution. In general, we can think of a sigmoid belief network as having a vector of binary states $s$ , with each element of the state influenced by its ancestors:

$$
p(s_{i}) = \sigma \left(\sum_{j < i} W_{j, i} s_{j} + b_{i}\right).\tag{20.70}
$$

The most common structure of sigmoid belief network is one that is divided into many layers, with ancestral sampling proceeding through a series of many hidden layers and then ultimately generating the visible layer. This structure is very similar to the deep belief network, except that the units at the beginning of the sampling process are independent from each other, rather than sampled from a restricted Boltzmann machine. Such a structure is interesting for a variety of reasons. One is that the structure is a universal approximator of probability distributions over the visible units, in the sense that it can approximate any probability distribution over binary variables arbitrarily well, given enough depth, even if the width of the individual layers is restricted to the dimensionality of the visible layer (Sutskever and Hinton, 2008).

While generating a sample of the visible units is very efficient in a sigmoid belief network, most other operations are not. Inference over the hidden units given the visible units is intractable. Mean field inference is also intractable because the variational lower bound involves taking expectations of cliques that encompass entire layers. This problem has remained difficult enough to restrict the popularity of directed discrete networks.

One approach for performing inference in a sigmoid belief network is to construct a different lower bound that is specialized for sigmoid belief networks (Saul et al., 1996). This approach has only been applied to very small networks. Another approach is to use learned inference mechanisms as described in section 19.5. The Helmholtz machine (Dayan et al., 1995; Dayan and Hinton, 1996) is a sigmoid belief network combined with an inference network that predicts the parameters of the mean field distribution over the hidden units. Modern approaches (Gregor et al., 2014; Mnih and Gregor, 2014) to sigmoid belief networks still use this inference network approach. These techniques remain difficult because of the discrete nature of the latent variables. One cannot simply back-propagate through the output of the inference network, but instead must use the relatively unreliable machinery for back-propagating through discrete sampling processes, as described in section 20.9.1. Recent approaches based on importance sampling, reweighted wake-sleep (Bornschein and Bengio, 2015) and bidirectional Helmholtz machines (Bornschein et al., 2015) make it possible to quickly train sigmoid belief networks and reach state-of-the-art performance on benchmark tasks.

A special case of sigmoid belief networks is the case where there are no latent variables. Learning in this case is efficient, because there is no need to marginalize latent variables out of the likelihood. A family of models called auto-regressive networks generalize this fully visible belief network to other kinds of variables besides binary variables and other structures of conditional distributions besides log-linear relationships. Auto-regressive networks are described in section 20.10.7.

## 20.10.2 Differentiable Generator Networks

Many generative models are based on the idea of using a differentiable generator network. The model transforms samples of latent variables z to samples x or to distributions over samples x using a differentiable function $g(z;\boldsymbol{\theta}^{(g)})$ , which is typically represented by a neural network. This model class includes variational autoencoders, which pair the generator net with an inference net; generative adversarial networks, which pair the generator network with a discriminator network; and techniques that train generator networks in isolation.

Generator networks are essentially just parametrized computational procedures for generating samples, where the architecture provides the family of possible distributions to sample from and the parameters select a distribution from within that family.

As an example, the standard procedure for drawing samples from a normal distribution with mean $\mu$ and covariance $\Sigma$ is to feed samples z from a normal distribution with zero mean and identity covariance into a very simple generator network. This generator network contains just one affine layer:

$$
\boldsymbol{x} = g(\boldsymbol{z}) = \mu + L \boldsymbol{z},\tag{20.71}
$$

where L is given by the Cholesky decomposition of $\Sigma$ .

Pseudorandom number generators can also use nonlinear transformations of simple distributions. For example, inverse transform sampling (Devroye, 2013)

draws a scalar z from $U(0,1)$ and applies a nonlinear transformation to a scalar x. In this case $g(z)$ is given by the inverse of the cumulative distribution function $F(x)=\int_{-\infty}^{x}p(v)dv$ . If we are able to specify $p(x)$ , integrate over x, and invert the resulting function, we can sample from $p(x)$ without using machine learning.

To generate samples from more complicated distributions that are difficult to specify directly, difficult to integrate over, or whose resulting integrals are difficult to invert, we use a feedforward network to represent a parametric family of nonlinear functions g, and use training data to infer the parameters selecting the desired function.

We can think of g as providing a nonlinear change of variables that transforms the distribution over z into the desired distribution over x.

Recall from equation 3.47 that, for invertible, differentiable, continuous g,

$$
p_{z}(\boldsymbol{z}) = p_{x}(g(\boldsymbol{z})) \left| \det \left(\frac{\partial g}{\partial \boldsymbol{z}}\right) \right|.\tag{20.72}
$$

This implicitly imposes a probability distribution over x:

$$
p_{x}(\boldsymbol{x}) = \frac{p_{z}(g^{- 1}(\boldsymbol{x}))}{\left| \det(\frac{\partial g}{\partial \boldsymbol{z}}) \right|}.\tag{20.73}
$$

Of course, this formula may be difficult to evaluate, depending on the choice of g, so we often use indirect means of learning g, rather than trying to maximize $\log p(\boldsymbol{x})$ directly.

In some cases, rather than using g to provide a sample of x directly, we use g to define a conditional distribution over x. For example, we could use a generator net whose final layer consists of sigmoid outputs to provide the mean parameters of Bernoulli distributions:

$$
p \left(x_{i} = 1 \mid z\right) = g(z)_{i}.\tag{20.74}
$$

In this case, when we use $g$ to define $p(\pmb{x} \mid \pmb{z})$ , we impose a distribution over $\pmb{x}$ by marginalizing $\pmb{z}$ :

$$
p(\boldsymbol{x}) = \mathbb{E}_{\boldsymbol{z}} p(\boldsymbol{x} \mid \boldsymbol{z}).\tag{20.75}
$$

Both approaches define a distribution $p_{g}(\boldsymbol{x})$ and allow us to train various criteria of $p_{g}$ using the reparametrization trick of section 20.9.

The two different approaches to formulating generator nets emitting the parameters of a conditional distribution versus directly emitting samples—have complementary strengths and weaknesses. When the generator net defines a conditional distribution over x, it is capable of generating discrete data as well as continuous data. When the generator net provides samples directly, it is capable of generating only continuous data (we could introduce discretization in the forward propagation, but doing so would mean the model could no longer be trained using back-propagation). The advantage to direct sampling is that we are no longer forced to use conditional distributions whose form can be easily written down and algebraically manipulated by a human designer.

Approaches based on differentiable generator networks are motivated by the success of gradient descent applied to differentiable feedforward networks for classification. In the context of supervised learning, deep feedforward networks trained with gradient-based learning seem practically guaranteed to succeed given enough hidden units and enough training data. Can this same recipe for success transfer to generative modeling?

Generative modeling seems to be more difficult than classification or regression because the learning process requires optimizing intractable criteria. In the context of differentiable generator nets, the criteria are intractable because the data does not specify both the inputs z and the outputs x of the generator net. In the case of supervised learning, both the inputs x and the outputs y were given, and the optimization procedure needs only to learn how to produce the specified mapping. In the case of generative modeling, the learning procedure needs to determine how to arrange z space in a useful way and additionally how to map from z to x.

Dosovitskiy et al. (2015) studied a simplified problem, where the correspondence between z and x is given. Specifically, the training data is computer-rendered imagery of chairs. The latent variables z are parameters given to the rendering engine describing the choice of which chair model to use, the position of the chair, and other configuration details that affect the rendering of the image. Using this synthetically generated data, a convolutional network is able to learn to map z descriptions of the content of an image to x approximations of rendered images. This suggests that contemporary differentiable generator networks have sufficient model capacity to be good generative models, and that contemporary optimization algorithms have the ability to fit them. The difficulty lies in determining how to train generator networks when the value of z for each x is not fixed and known ahead of each time.

The following sections describe several approaches to training differentiable generator nets given only training samples of x.

## 20.10.3 Variational Autoencoders

The variational autoencoder, or VAE (Kingma, 2013; Rezende et al., 2014), is a directed model that uses learned approximate inference and can be trained purely with gradient-based methods.

To generate a sample from the model, the VAE first draws a sample z from the code distribution $p_{\mathrm{model}}(z)$ . The sample is then run through a differentiable generator network $g(z)$ . Finally, x is sampled from a distribution $p_{\mathrm{model}}(x; g(z)) = p_{\mathrm{model}}(x \mid z)$ . During training, however, the approximate inference network (or encoder) $q(z \mid x)$ is used to obtain z, and $p_{\mathrm{model}}(x \mid z)$ is then viewed as a decoder network.

The key insight behind variational autoencoders is that they can be trained by maximizing the variational lower bound $\mathcal{L}(q)$ associated with data point x:

$$
\mathcal{L}(q) = \mathbb{E}_{\boldsymbol{z} \sim q(\boldsymbol{z} | \boldsymbol{x})} \log p_{\mathrm{model}}(\boldsymbol{z}, \boldsymbol{x}) + \mathcal{H}(q(\boldsymbol{z} \mid \boldsymbol{x}))\tag{20.76}
$$

$$
= \mathbb{E}_{\boldsymbol{z} \sim q(\boldsymbol{z} | \boldsymbol{x})} \log p_{\text{model}}(\boldsymbol{x} \mid \boldsymbol{z}) - D_{\mathrm{KL}}(q(\boldsymbol{z} \mid \boldsymbol{x}) | | p_{\text{model}}(\boldsymbol{z}))\tag{20.77}
$$

$$
\leq \log p_{\mathrm{model}}(\boldsymbol{x}).\tag{20.78}
$$

In equation 20.76, we recognize the first term as the joint log-likelihood of the visible and hidden variables under the approximate posterior over the latent variables (just as with EM, except that we use an approximate rather than the exact posterior). We recognize also a second term, the entropy of the approximate posterior. When q is chosen to be a Gaussian distribution, with noise added to a predicted mean value, maximizing this entropy term encourages increasing the standard deviation of this noise. More generally, this entropy term encourages the variational posterior to place high probability mass on many z values that could have generated x, rather than collapsing to a single point estimate of the most likely value. In equation 20.77, we recognize the first term as the reconstruction log-likelihood found in other autoencoders. The second term tries to make the approximate posterior distribution $q(\mathbf{z} \mid \mathbf{x})$ and the model prior $p_{\mathrm{model}}(\mathbf{z})$ approach each other.

Traditional approaches to variational inference and learning infer q via an optimization algorithm, typically iterated fixed-point equations (section 19.4). These approaches are slow and often require the ability to compute $\mathbb{E}_{z\sim q}\log p_{\mathrm{model}}(z,x)$ in closed form. The main idea behind the variational autoencoder is to train a parametric encoder (also sometimes called an inference network or recognition model) that produces the parameters of q. As long as z is a continuous variable, we can then back-propagate through samples of z drawn from $q(z|x)=q(z;f(x;\theta))$ to obtain a gradient with respect to $\theta$ . Learning then consists solely of maximizing

L with respect to the parameters of the encoder and decoder. All the expectations in L may be approximated by Monte Carlo sampling.

The variational autoencoder approach is elegant, theoretically pleasing, and simple to implement. It also obtains excellent results and is among the state-of-the-art approaches to generative modeling. Its main drawback is that samples from variational autoencoders trained on images tend to be somewhat blurry. The causes of this phenomenon are not yet known. One possibility is that the blurriness is an intrinsic effect of maximum likelihood, which minimizes $D_{\mathrm{KL}}(p_{\mathrm{data}}||p_{\mathrm{model}})$ . As illustrated in figure 3.6, this means that the model will assign high probability to points that occur in the training set but may also assign high probability to other points. These other points may include blurry images. Part of the reason that the model would choose to put probability mass on blurry images rather than some other part of the space is that the variational autoencoders used in practice usually have a Gaussian distribution for $p_{\mathrm{model}}(\boldsymbol{x};g(\boldsymbol{z}))$ . Maximizing a lower bound on the likelihood of such a distribution is similar to training a traditional autoencoder with mean squared error, in the sense that it has a tendency to ignore features of the input that occupy few pixels or that cause only a small change in the brightness of the pixels that they occupy. This issue is not specific to VAEs and is shared with generative models that optimize a log-likelihood, or equivalently, $D_{\mathrm{KL}}(p_{\mathrm{data}}||p_{\mathrm{model}})$ , as argued by Theis et al. (2015) and by Huszar (2015). Another troubling issue with contemporary VAE models is that they tend to use only a small subset of the dimensions of z, as if the encoder were not able to transform enough of the local directions in input space to a space where the marginal distribution matches the factorized prior.

The VAE framework is straightforward to extend to a wide range of model architectures. This is a key advantage over Boltzmann machines, which require extremely careful model design to maintain tractability. VAEs work very well with a diverse family of differentiable operators. One particularly sophisticated VAE is the deep recurrent attention writer (DRAW) model (Gregor et al., 2015). DRAW uses a recurrent encoder and recurrent decoder combined with an attention mechanism. The generation process for the DRAW model consists of sequentially visiting different small image patches and drawing the values of the pixels at those points. VAEs can also be extended to generate sequences by defining variational RNNs (Chung et al., 2015b) by using a recurrent encoder and decoder within the VAE framework. Generating a sample from a traditional RNN involves only nondeterministic operations at the output space. Variational RNNs also have random variability at the potentially more abstract level captured by the VAE latent variables.

The VAE framework has been extended to maximize not just the traditional variational lower bound, but also the importance-weighted autoencoder (Burda et al., 2015) objective:

$$
\mathcal{L}_{k}(\boldsymbol{x}, q) = \mathbb{E}_{\mathbf{z}^{(1)}, \dots, \mathbf{z}^{(k)} \sim q(\boldsymbol{z} | \boldsymbol{x})} \left[\log \frac{1}{k} \sum_{i = 1}^{k} \frac{p_{\mathrm{model}}(\boldsymbol{x}, \boldsymbol{z}^{(i)})}{q(\boldsymbol{z}^{(i)} \mid \boldsymbol{x})} \right].\tag{20.79}
$$

This new objective is equivalent to the traditional lower bound L when k = 1. However, it may also be interpreted as forming an estimate of the true $\log p_{\mathrm{model}}(\boldsymbol{x})$ using importance sampling of z from proposal distribution $q(\boldsymbol{z} \mid \boldsymbol{x})$ . The importance-weighted autoencoder objective is also a lower bound on $\log p_{\mathrm{model}}(\boldsymbol{x})$ and becomes tighter as k increases.

Variational autoencoders have some interesting connections to the MP-DBM and other approaches that involve back-propagation through the approximate inference graph (Goodfellow et al., 2013b; Stoyanov et al., 2011; Brakel et al., 2013). These previous approaches required an inference procedure such as mean field fixed-point equations to provide the computational graph. The variational autoencoder is defined for arbitrary computational graphs, which makes it applicable to a wider range of probabilistic model families because there is no need to restrict the choice of models to those with tractable mean field fixed-point equations. The variational autoencoder also has the advantage of increasing a bound on the log-likelihood of the model, while the criteria for the MP-DBM and related models are more heuristic and have little probabilistic interpretation beyond making the results of approximate inference accurate. One disadvantage of the variational autoencoder is that it learns an inference network for only one problem, inferring z given x. The older methods are able to perform approximate inference over any subset of variables given any other subset of variables, because the mean field fixed-point equations specify how to share parameters between the computational graphs for all these different problems.

One very nice property of the variational autoencoder is that simultaneously training a parametric encoder in combination with the generator network forces the model to learn a predictable coordinate system that the encoder can capture. This makes it an excellent manifold learning algorithm. See figure 20.6 for examples of low-dimensional manifolds learned by the variational autoencoder. In one of the cases demonstrated in the figure, the algorithm discovered two independent factors of variation present in images of faces: angle of rotation and emotional expression.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/9c97676fbf10c30657383ca76c0e3add29965130055a0cd6f984930c1658742d.jpg)

6 6 6 6 6 6 0 0 0 0 0 0 0 0 0 0 0 0 0
4 4 4 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0
4 2 2 2 2 2 2 2 2 3 5 5 5 5 5 5 5 5 5 5
4 9 2 2 2 2 2 2 2 3 3 5 5 5 5 5 5 5
9 9 9 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
9 9 9 4 2 2 2 2 3 3 3 3 3 3 3
9 9 9 9 9 9 9 9 9 9 9
7 9 9 9 9 9 9 9
7 9 9 9 9 9
7 9
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7
7

Figure 20.6: Examples of 2-D coordinate systems for high-dimensional manifolds, learned by a variational autoencoder (Kingma and Welling, 2014a). Two dimensions may be plotted directly on the page for visualization, so we can gain an understanding of how the model works by training a model with a 2-D latent code, even if we believe the intrinsic dimensionality of the data manifold is much higher. The images shown are not examples from the training set but images x actually generated by the model $p(\boldsymbol{x} \mid \boldsymbol{z})$ , simply by changing the 2-D “code” z (each image corresponds to a different choice of “code” z on a 2-D uniform grid). (Left) The 2-D map of the Frey faces manifold. One dimension that has been discovered (horizontal) mostly corresponds to a rotation of the face, while the other (vertical) corresponds to the emotional expression. (Right) The 2-D map of the MNIST manifold.

## 20.10.4 Generative Adversarial Networks

Generative adversarial networks, or GANs (Goodfellow et al., 2014c), are another generative modeling approach based on differentiable generator networks.

Generative adversarial networks are based on a game theoretic scenario in which the generator network must compete against an adversary. The generator network directly produces samples $\boldsymbol{x} = g(\boldsymbol{z}; \boldsymbol{\theta}^{(g)})$ . Its adversary, the discriminator network, attempts to distinguish between samples drawn from the training data and samples drawn from the generator. The discriminator emits a probability value given by $d(\boldsymbol{x}; \boldsymbol{\theta}^{(d)})$ , indicating the probability that x is a real training example rather than a fake sample drawn from the model.

The simplest way to formulate learning in generative adversarial networks is as a zero-sum game, in which a function $v(\boldsymbol{\theta}^{(g)}, \boldsymbol{\theta}^{(d)})$ determines the payoff of the discriminator. The generator receives $-v(\boldsymbol{\theta}^{(g)}, \boldsymbol{\theta}^{(d)})$ as its own payoff. During learning, each player attempts to maximize its own payoff, so that at convergence

$$
g^{*} = \underset{g}{\arg \min} \underset{d}{\max} v(g, d).\tag{20.80}
$$

The default choice for $v$ is

$$
v(\pmb{\theta}^{(g)}, \pmb{\theta}^{(d)}) = \mathbb{E}_{\mathbf{x} \sim p_{\mathrm{data}}} \log d(\pmb{x}) + \mathbb{E}_{\pmb{x} \sim p_{\mathrm{model}}} \log \left(1 - d(\pmb{x})\right).\tag{20.81}
$$

This drives the discriminator to attempt to learn to correctly classify samples as real or fake. Simultaneously, the generator attempts to fool the classifier into believing its samples are real. At convergence, the generator's samples are indistinguishable from real data, and the discriminator outputs $\frac{1}{2}$ everywhere. The discriminator may then be discarded.

The main motivation for the design of GANs is that the learning process requires neither approximate inference nor approximation of a partition function gradient. When $\alpha x_{d} v(g, d)$ is convex in $\boldsymbol{\theta}^{(g)}$ (such as the case where optimization is performed directly in the space of probability density functions), the procedure is guaranteed to converge and is asymptotically consistent.

Unfortunately, learning in GANs can be difficult in practice when g and d are represented by neural networks and $\max_{d} v(g,d)$ is not convex. Goodfellow (2014) identified nonconvergence as an issue that may cause GANs to underfit. In general, simultaneous gradient descent on two players' costs is not guaranteed to reach an equilibrium. Consider, for example, the value function $v(a,b)=ab$ , where one player controls a and incurs cost ab, while the other player controls b and receives a cost -ab. If we model each player as making infinitesimally small gradient steps, each player reducing their own cost at the expense of the other player, then a and b go into a stable, circular orbit, rather than arriving at the equilibrium point at the origin. Note that the equilibria for a minimax game are not local minima of v. Instead, they are points that are simultaneously minima for both players' costs. This means that they are saddle points of v that are local minima with respect to the first player's parameters and local maxima with respect to the second player's parameters. It is possible for the two players to take turns increasing then decreasing v forever, rather than landing exactly on the saddle point, where neither player is capable of reducing its cost. It is not known to what extent this nonconvergence problem affects GANs.

Goodfellow (2014) identified an alternative formulation of the payoffs, in which the game is no longer zero-sum, that has the same expected gradient as maximum likelihood learning whenever the discriminator is optimal. Because maximum likelihood training converges, this reformulation of the GAN game should also converge, given enough samples. Unfortunately, this alternative formulation does not seem to improve convergence in practice, possibly because of suboptimality of the discriminator or high variance around the expected gradient.

In realistic experiments, the best-performing formulation of the GAN game is a different formulation that is neither zero-sum nor equivalent to maximum likelihood, introduced by Goodfellow et al. (2014c) with a heuristic motivation. In this best-performing formulation, the generator aims to increase the log-probability that the discriminator makes a mistake, rather than aiming to decrease the log-probability that the discriminator makes the correct prediction. This reformulation is motivated solely by the observation that it causes the derivative of the generator's cost function with respect to the discriminator's logits to remain large even in the situation when the discriminator confidently rejects all generator samples.

Stabilization of GAN learning remains an open problem. Fortunately, GAN learning performs well when the model architecture and hyperparameters are carefully selected. Radford et al. (2015) crafted a deep convolutional GAN (DCGAN) that performs very well for image synthesis tasks, and showed that its latent representation space captures important factors of variation, as shown in figure 15.9. See figure 20.7 for examples of images generated by a DCGAN generator.

The GAN learning problem can also be simplified by breaking the generation process into many levels of detail. It is possible to train conditional GANs (Mirza and Osindero, 2014) that learn to sample from a distribution $p(\boldsymbol{x} \mid \boldsymbol{y})$ rather than simply sampling from a marginal distribution $p(\boldsymbol{x})$ . Denton et al. (2015) showed that a series of conditional GANs can be trained to first generate a very low-resolution version of an image, then incrementally add details to the image. This technique is called the LAPGAN model, due to the use of a Laplacian pyramid to generate the images containing varying levels of detail. LAPGAN generators are able to fool not only discriminator networks but also human observers, with experimental subjects identifying up to 40 percent of the outputs of the network as being real data. See figure 20.7 for examples of images generated by a LAPGAN generator.

One unusual capability of the GAN training procedure is that it can fit probability distributions that assign zero probability to the training points. Rather than maximizing the log-probability of specific points, the generator net learns to trace out a manifold whose points resemble training points in some way. Somewhat paradoxically, this means that the model may assign a log-likelihood of negative infinity to the test set, while still representing a manifold that a human observer judges to capture the essence of the generation task. This is not clearly an advantage or a disadvantage, and one may also guarantee that the generator network assigns nonzero probability to all points simply by making the last layer of the generator network add Gaussian noise to all the generated values. Generator networks that add Gaussian noise in this manner sample from the same distribution that one obtains by using the generator network to parametrize the mean of a conditional Gaussian distribution.

![Figure 20.7](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/0a6554f71d1e74eb17181502c7f63dfeb8f2b7c8d49ae93e533f3798af815e04.jpg)  
Figure 20.7: Images generated by GANs trained on the LSUN dataset. (Left)Images of bedrooms generated by a DCGAN model, reproduced with permission from Radford et al. (2015). (Right)Images of churches generated by a LAPGAN model, reproduced with permission from Denton et al. (2015).

Dropout seems to be important in the discriminator network. In particular, units should be stochastically dropped while computing the gradient for the generator network to follow. Following the gradient of the deterministic version of the discriminator with its weights divided by two does not seem to be as effective. Likewise, never using dropout seems to yield poor results.

While the GAN framework is designed for differentiable generator networks, similar principles can be used to train other kinds of models. For example, self-supervised boosting can be used to train an RBM generator to fool a logistic regression discriminator (Welling et al., 2002).

## 20.10.5 Generative Moment Matching Networks

Generative moment matching networks (Li et al., 2015; Dziugaite et al., 2015) are another form of generative model based on differentiable generator networks. Unlike VAEs and GANs, they do not need to pair the generator network with any other network—neither an inference network, as used with VAEs, nor a discriminator network, as used with GANs.

Generative moment matching networks are trained with a technique called moment matching. The basic idea behind moment matching is to train the generator in such a way that many of the statistics of samples generated by the model are as similar as possible to those of the statistics of the examples in the training set. In this context, a moment is an expectation of different powers of a random variable. For example, the first moment is the mean, the second moment is the mean of the squared values, and so on. In multiple dimensions, each element of the random vector may be raised to different powers, so that a moment may be any quantity of the form

$$
\mathbb{E}_{\pmb{x}} \Pi_{i} x_{i}^{n_{i}},\tag{20.82}
$$

where $n =[n_{1}, n_{2}, \ldots, n_{d}]^{\top}$ is a vector of nonnegative integers.

Upon first examination, this approach seems to be computationally infeasible. For example, if we want to match all the moments of the form $x_{i}x_{j}$ , then we need to minimize the difference between a number of values that is quadratic in the dimension of x. Moreover, even matching all the first and second moments would only be sufficient to fit a multivariate Gaussian distribution, which captures only linear relationships between values. Our ambitions for neural networks are to capture complex nonlinear relationships, which would require far more moments. GANs avoid this problem of exhaustively enumerating all moments by using a dynamically updated discriminator which automatically focuses its attention on whichever statistic the generator network is matching the least effectively.

Instead, generative moment matching networks can be trained by minimizing a cost function called maximum mean discrepancy, or MMD (Schölkopf and Smola, 2002; Gretton et al., 2012). This cost function measures the error in the first moments in an infinite-dimensional space, using an implicit mapping to feature space defined by a kernel function to make computations on infinite-dimensional vectors tractable. The MMD cost is zero if and only if the two distributions being compared are equal.

Visually, the samples from generative moment matching networks are somewhat disappointing. Fortunately, they can be improved by combining the generator network with an autoencoder. First, an autoencoder is trained to reconstruct the training set. Next, the encoder of the autoencoder is used to transform the entire training set into code space. The generator network is then trained to generate code samples, which may be mapped to visually pleasing samples via the decoder.

Unlike GANs, the cost function is defined only with respect to a batch of examples from both the training set and the generator network. It is not possible to make a training update as a function of only one training example or only one sample from the generator network. This is because the moments must be computed as an empirical average across many samples. When the batch size is too small, MMD can underestimate the true amount of variation in the distributions being sampled. No finite batch size is sufficiently large to eliminate this problem entirely, but larger batches reduce the amount of underestimation. When the batch size is too large, the training procedure becomes infeasibly slow, because many examples must be processed in order to compute a single small gradient step.

As with GANs, it is possible to train a generator net using MMD even if that generator net assigns zero probability to the training points.

## 20.10.6 Convolutional Generative Networks

When generating images, it is often useful to use a generator network that includes a convolutional structure (see, for example, Goodfellow et al. [2014c] or Dosovitskiy et al. [2015]). To do so, we use the “transpose” of the convolution operator, described in section 9.5. This approach often yields more realistic images and does so using fewer parameters than using fully connected layers without parameter sharing.

Convolutional networks for recognition tasks have information flow from the image to some summarization layer at the top of the network, often a class label. As this image flows upward through the network, information is discarded as the representation of the image becomes more invariant to nuisance transformations. In a generator network, the opposite is true. Rich details must be added as the representation of the image to be generated propagates through the network, culminating in the final representation of the image, which is of course the image itself, in all its detailed glory, with object positions and poses and textures and lighting. The primary mechanism for discarding information in a convolutional recognition network is the pooling layer. The generator network seems to need to add information. We cannot put the inverse of a pooling layer into the generator network because most pooling functions are not invertible. A simpler operation is to merely increase the spatial size of the representation. An approach that seems to perform acceptably is to use an “un-pooling” as introduced by Dosovitskiy et al. (2015). This layer corresponds to the inverse of the max-pooling operation under certain simplifying conditions. First, the stride of the max-pooling operation is constrained to be equal to the width of the pooling region. Second, the maximum input within each pooling region is assumed to be the input in the upper-left corner. Finally, all nonmaximal inputs within each pooling region are assumed to be zero. These are very strong and unrealistic assumptions, but they do allow the max-pooling operator to be inverted. The inverse un-pooling operation allocates a tensor of zeros, then copies each value from spatial coordinate i of the input to spatial coordinate $i \times k$ of the output. The integer value k defines the size of the pooling region. Even though the assumptions motivating the definition of the un-pooling operator are unrealistic, the subsequent layers are able to learn to compensate for its unusual output, so the samples generated by the model as a whole are visually pleasing.

## 20.10.7 Auto-Regressive Networks

Auto-regressive networks are directed probabilistic models with no latent random variables. The conditional probability distributions in these models are represented by neural networks (sometimes extremely simple neural networks, such as logistic regression). The graph structure of these models is the complete graph. They decompose a joint probability over the observed variables using the chain rule of probability to obtain a product of conditionals of the form $P(x_{d} \mid x_{d-1}, \ldots, x_{1})$ . Such models have been called fully-visible Bayes networks (FVBNs) and used successfully in many forms, first with logistic regression for each conditional distribution (Frey, 1998), and then with neural networks with hidden units (Bengio and Bengio, 2000b; Larochelle and Murray, 2011). In some forms of auto-regressive networks, such as NADE (Larochelle and Murray, 2011), described in section 20.10.10, we can introduce a form of parameter sharing that brings both a statistical advantage (fewer unique parameters) and a computational advantage (less computation). This is one more instance of the recurring deep learning motif of reuse of features.

## 20.10.8 Linear Auto-Regressive Networks

The simplest form of auto-regressive network has no hidden units and no sharing of parameters or features. Each $P(x_{i} \mid x_{i-1}, \ldots, x_{1})$ is parametrized as a linear model (linear regression for real-valued data, logistic regression for binary data, softmax regression for discrete data). This model was introduced by Frey (1998) and has $O(d^{2})$ parameters when there are d variables to model. It is illustrated in figure 20.8.

If the variables are continuous, a linear auto-regressive model is merely another way to formulate a multivariate Gaussian distribution, capturing linear pairwise interactions between the observed variables.

Linear auto-regressive networks are essentially the generalization of linear classification methods to generative modeling. They therefore have the same advantages and disadvantages as linear classifiers. Like linear classifiers, they may be trained with convex loss functions and sometimes admit closed form solutions (as in the Gaussian case). Like linear classifiers, the model itself does not offer a way of increasing its capacity, so capacity must be raised using techniques like basis expansions of the input or the kernel trick.

![Figure 20.8](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/b822739c86471db057801904e1354dd21a23dffd6ed1ed56ed3e173e9c7890c3.jpg)  
Figure 20.8: A fully visible belief network predicts the i-th variable from the i-1 previous ones. (Top)The directed graphical model for an FVBN. (Bottom)Corresponding computational graph for the logistic FVBN, where each prediction is made by a linear predictor.

## 20.10.9 Neural Auto-Regressive Networks

Neural auto-regressive networks (Bengio and Bengio, 2000a,b) have the same left-to-right graphical model as logistic auto-regressive networks (figure 20.8) but employ a different parametrization of the conditional distributions within that graphical model structure. The new parametrization is more powerful in the sense that its capacity can be increased as much as needed, allowing approximation of any joint distribution. The new parametrization can also improve generalization by introducing a parameter sharing and feature sharing principle common to deep learning in general. The models were motivated by the objective of avoiding the curse of dimensionality arising out of traditional tabular graphical models, sharing the same structure as figure 20.8. In tabular discrete probabilistic models, each conditional distribution is represented by a table of probabilities, with one entry and one parameter for each possible configuration of the variables involved. By using a neural network instead, two advantages are obtained:

1. The parametrization of each $P(x_{i} \mid x_{i-1}, \ldots, x_{1})$ by a neural network with $(i-1) \times k$ inputs and k outputs (if the variables are discrete and take k values, encoded one-hot) enables one to estimate the conditional probability without requiring an exponential number of parameters (and examples), yet still is able to capture high-order dependencies between the random variables.

2. Instead of having a different neural network for the prediction of each $x_{i}$ , a left-to-right connectivity, illustrated in figure 20.9, allows one to merge all the neural networks into one. Equivalently, it means that the hidden layer features computed for predicting $x_{i}$ can be reused for predicting $x_{i+k}$ (k > 0). The hidden units are thus organized in groups that have the particularity that all the units in the i-th group only depend on the input values $x_{1}, \ldots, x_{i}$ . The parameters used to compute these hidden units are jointly optimized to improve the prediction of all the variables in the sequence. This is an instance of the reuse principle that recurs throughout deep learning in scenarios ranging from recurrent and convolutional network architectures to multitask and transfer learning.

Each $P(x_{i} \mid x_{i-1}, \ldots, x_{1})$ can represent a conditional distribution by having outputs of the neural network predict parameters of the conditional distribution of $x_{i}$ , as discussed in section 6.2.1.1. Although the original neural auto-regressive networks were initially evaluated in the context of purely discrete multivariate data (with a sigmoid output for a Bernoulli variable or softmax output for a multinoulli variable), it is natural to extend such models to continuous variables or joint distributions involving both discrete and continuous variables.

![Figure 20.9](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/c469344d9b07b694fc586e1211309bf356bba5f38099d6833f726e90a89f03d0.jpg)  
Figure 20.9: A neural auto-regressive network predicts the i-th variable $x_{i}$ from the i-1 previous ones, but is parametrized so that features (groups of hidden units denoted $h_{i}$ ) that are functions of $x_{1},\ldots,x_{i}$ can be reused in predicting all the subsequent variables $x_{i+1},x_{i+2},\ldots,x_{d}$ .

## 20.10.10 NADE

The neural auto-regressive density estimator (NADE) is a very successful recent form of neural auto-regressive network (Larochelle and Murray, 2011). The connectivity is the same as for the original neural auto-regressive network of Bengio and Bengio (2000b), but NADE introduces an additional parameter sharing scheme, as illustrated in figure 20.10. The parameters of the hidden units of different groups j are shared.

The weights $W_{j,k,i}^{\prime}$ from the i-th input $x_{i}$ to the k-th element of the j-th group of hidden unit $h_{j}^{(j)}$ ( $j \geq i$ ) are shared among the groups:

$$
W_{j, k, i}^{\prime} = W_{k, i}.\tag{20.83}
$$

The remaining weights, where j < i, are zero.

![Figure 20.10](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/2952f6372c690ce826a6f1010a61f66875d098de5db39d2e5a902d602116d3a4.jpg)  
Figure 20.10: An illustration of the neural autoregressive density estimator (NADE). The hidden units are organized in groups $\pmb{h}^{(j)}$ so that only the inputs $x_{1},\ldots,x_{i}$ participate in computing $\pmb{h}^{(i)}$ and predicting $P(x_{j}\mid x_{j - 1},\dots,x_{1})$ , for $j > i$ . NADE is differentiated from earlier neural auto-regressive networks by the use of a particular weight sharing pattern: $W_{j,k,i}^{\prime} = W_{k,i}$ is shared (indicated in the figure by the use of the same line pattern for every instance of a replicated weight) for all the weights going out from $x_{i}$ to the $k$ -th unit of any group $j\geq i$ . Recall that the vector $(W_{1,i},W_{2,i},\dots,W_{n,i})$ is denoted $W_{i,i}$ .

Larochelle and Murray (2011) chose this sharing scheme so that forward propagation in a NADE model would loosely resemble the computations performed in mean field inference to fill in missing inputs in an RBM. This mean field inference corresponds to running a recurrent network with shared weights, and the first step of that inference is the same as in NADE. The only difference is that with NADE, the output weights connecting the hidden units to the output are parametrized independently from the weights connecting the input units to the hidden units. In the RBM, the hidden-to-output weights are the transpose of the input-to-hidden weights. The NADE architecture can be extended to mimic not just one time step of the mean field recurrent inference but k steps. This approach is called NADE-k (Raiko et al., 2014).

As mentioned previously, auto-regressive networks may be extended to process continuous-valued data. A particularly powerful and generic way of parametrizing a continuous density is as a Gaussian mixture (introduced in section 3.9.6) with mixture weights $\alpha_{i}$ (the coefficient or prior probability for component i), per-component conditional mean $\mu_{i}$ and per-component conditional variance $\sigma_{i}^{2}$ . A model called RNADE (Uria et al., 2013) uses this parametrization to extend NADE to real values. As with other mixture density networks, the parameters of this distribution are outputs of the network, with the mixture weight probabilities produced by a softmax unit, and the variances parametrized so that they are positive. Stochastic gradient descent can be numerically ill-behaved due to the interactions between the conditional means $\mu_{i}$ and the conditional variances $\sigma_{i}^{2}$ . To reduce this difficulty, Uria et al. (2013) use a pseudogradient that replaces the gradient on the mean, in the back-propagation phase.

Another very interesting extension of the neural auto-regressive architectures gets rid of the need to choose an arbitrary order for the observed variables (Murray and Larochelle, 2014). In auto-regressive networks, the idea is to train the network to be able to cope with any order by randomly sampling orders and providing the information to hidden units specifying which of the inputs are observed (on the right side of the conditioning bar) and which are to be predicted and are thus considered missing (on the left side of the conditioning bar). This is nice because it allows one to use a trained auto-regressive network to perform any inference problem (i.e., predict or sample from the probability distribution over any subset of variables given any subset) extremely efficiently. Finally, since many orders of variables are possible ( $n!$ for $n$ variables) and each order $o$ of variables yields a different $p(\mathbf{x} \mid o)$ , we can form an ensemble of models for many values of $o$ :

$$
p_{\text{ensemble}}(\mathbf{x}) = \frac{1}{k} \sum_{i = 1}^{k} p(\mathbf{x} \mid o^{(i)}).\tag{20.84}
$$

This ensemble model usually generalizes better and assigns higher probability to the test set than does an individual model defined by a single ordering.

In the same paper, the authors propose deep versions of the architecture, but unfortunately that immediately makes computation as expensive as in the original neural auto-regressive network (Bengio and Bengio, 2000b). The first layer and the output layer can still be computed in $O(nh)$ multiply-add operations, as in the regular NADE, where h is the number of hidden units (the size of the groups $h_{i}$ , in figures 20.10 and 20.9), whereas it is $O(n^{2}h)$ in Bengio and Bengio (2000b). For the other hidden layers, however, the computation is $O(n^{2}h^{2})$ if every “previous” group at layer l participates in predicting the “next” group at layer $l+1$ , assuming n groups of h hidden units at each layer. Making the i-th group at layer $l+1$ only depend on the i-th group, as in Murray and Larochelle (2014), at layer l reduces it to $O(nh^{2})$ , which is still h times worse than the regular NADE.

## 20.11 Drawing Samples from Autoencoders

In chapter 14, we saw that many kinds of autoencoders learn the data distribution. There are close connections between score matching, denoising autoencoders, and contractive autoencoders. These connections demonstrate that some kinds of autoencoders learn the data distribution in some way. We have not yet seen how to draw samples from such models.

Some kinds of autoencoders, such as the variational autoencoder, explicitly represent a probability distribution and admit straightforward ancestral sampling. Most other kinds of autoencoders require MCMC sampling.

Contractive autoencoders are designed to recover an estimate of the tangent plane of the data manifold. This means that repeated encoding and decoding with injected noise will induce a random walk along the surface of the manifold (Rifai et al., 2012; Mesnil et al., 2012). This manifold diffusion technique is a kind of Markov chain.

There is also a more general Markov chain that can sample from any denoising autoencoder.

## 20.11.1 Markov Chain Associated with Any Denoising Autoencoder

The above discussion left open the question of what noise to inject and where to obtain a Markov chain that would generate from the distribution estimated by the autoencoder. Bengio et al. (2013c) showed how to construct such a Markov chain for generalized denoising autoencoders. Generalized denoising autoencoders are specified by a denoising distribution for sampling an estimate of the clean input given the corrupted input.

Each step of the Markov chain that generates from the estimated distribution consists of the following substeps, illustrated in figure 20.11:

1. Starting from the previous state x, inject corruption noise, sampling $\tilde{x}$ from $C(\tilde{x} \mid x)$ .

2. Encode $\tilde{x}$ into $\boldsymbol{h}=f(\tilde{\boldsymbol{x}})$ .

3. Decode $\pmb{h}$ to obtain the parameters $\omega = g(\pmb{h})$ of $p(\mathbf{x} \mid \omega = g(\pmb{h})) = p(\mathbf{x} \mid \tilde{\pmb{x}})$ .

4. Sample the next state x from $p(\mathbf{x} \mid \boldsymbol{\omega} = g(\boldsymbol{h})) = p(\mathbf{x} \mid \tilde{\boldsymbol{x}})$ .

![Figure 20.11](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/d95bbb70f83017a302d5ff5116b98384c290d2919de3d4f9a24a8a07f5cecb01.jpg)  
Figure 20.11: Each step of the Markov chain associated with a trained denoising autoencoder, which generates the samples from the probabilistic model implicitly trained by the denoising log-likelihood criterion. Each step consists in (a) injecting noise via corruption process C in state x, yielding $\tilde{x}$ , (b) encoding it with function f, yielding $\boldsymbol{h} = f(\tilde{\boldsymbol{x}})$ , (c) decoding the result with function g, yielding parameters $\omega$ for the reconstruction distribution, and (d) given $\omega$ , sampling a new state from the reconstruction distribution $p(\mathbf{x} \mid \boldsymbol{\omega} = g(f(\tilde{\boldsymbol{x}})))$ . In the typical squared reconstruction error case, $g(\boldsymbol{h}) = \hat{\boldsymbol{x}}$ , which estimates $E[x \mid \tilde{x}]$ , corruption consists of adding Gaussian noise, and sampling from $p(\mathbf{x} \mid \boldsymbol{\omega})$ consists of adding Gaussian noise a second time to the reconstruction $\hat{x}$ . The latter noise level should correspond to the mean squared error of reconstructions, whereas the injected noise is a hyperparameter that controls the mixing speed as well as the extent to which the estimator smooths the empirical distribution (Vincent, 2011). In the example illustrated here, only the C and p conditionals are stochastic steps (f and g are deterministic computations), although noise can also be injected inside the autoencoder, as in generative stochastic networks (Bengio et al., 2014).

Bengio et al. (2014) showed that if the autoencoder $p(\mathbf{x} \mid \tilde{\mathbf{x}})$ forms a consistent estimator of the corresponding true conditional distribution, then the stationary distribution of the above Markov chain forms a consistent estimator (albeit an implicit one) of the data-generating distribution of x.

## 20.11.2 Clamping and Conditional Sampling

Similarly to Boltzmann machines, denoising autoencoders and their generalizations (such as GSNs, described below) can be used to sample from a conditional distribution $p(\mathbf{x}_{f} \mid \mathbf{x}_{o})$ , simply by clamping the observed units $x_{f}$ and only resampling the free units $x_{o}$ given $x_{f}$ and the sampled latent variables (if any). For example, MP-DBMs can be interpreted as a form of denoising autoencoder and are able to sample missing inputs. GSNs later generalized some of the ideas present in MP-DBMs to perform the same operation (Bengio et al., 2014). Alain et al. (2015) identified a missing condition from Proposition 1 of Bengio et al. (2014), which is that the transition operator (defined by the stochastic mapping going from one state of the chain to the next) should satisfy a property called detailed balance, which specifies that a Markov chain at equilibrium will remain in equilibrium whether the transition operator is run in forward or reverse.

An experiment in clamping half of the pixels (the right part of the image) and running the Markov chain on the other half is shown in figure 20.12.

## 20.11.3 Walk-Back Training Procedure

The walk-back training procedure was proposed by Bengio et al. (2013c) as a way to accelerate the convergence of generative training of denoising autoencoders. Instead of performing a one-step encode-decode reconstruction, this procedure consists of alternative multiple stochastic encode-decode steps (as in the generative Markov chain), initialized at a training example (just as with the contrastive divergence algorithm, described in section 18.2), and penalizing the last probabilistic reconstructions (or all the reconstructions along the way).

Training with k steps is equivalent (in the sense of achieving the same stationary distribution) as training with one step but practically has the advantage that spurious modes further from the data can be removed more efficiently.

![Figure 20.12](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-004-pages-601-800/images/4b94756b40ed89c35fc9c26f9c6031d2c6285521c5e41fdc53f12bb38d1af195.jpg)  
Figure 20.12: Illustration of clamping the right half of the image and running the Markov chain by resampling only the left half at each step. These samples come from a GSN trained to reconstruct MNIST digits at each time step using the walk-back procedure.

## 20.12 Generative Stochastic Networks

Generative stochastic networks, or GSNs (Bengio et al., 2014) are generalizations of denoising autoencoders that include latent variables h in the generative Markov chain, in addition to the visible variables (usually denoted x).

A GSN is parametrized by two conditional probability distributions that specify one step of the Markov chain:

1. $p(\mathbf{x}^{(k)} \mid \mathbf{h}^{(k)})$ tells how to generate the next visible variable given the current latent state. Such a “reconstruction distribution” is also found in denoising autoencoders, RBMs, DBNs and DBMs.

2. $p(\mathbf{h}^{(k)} \mid \mathbf{h}^{(k-1)}, \mathbf{x}^{(k-1)})$ tells how to update the latent state variable, given the previous latent state and visible variable.

Denoising autoencoders and GSNs differ from classical probabilistic models (directed or undirected) in that they parametrize the generative process itself rather than the mathematical specification of the joint distribution of visible and latent variables. Instead, the latter is defined implicitly, if it exists, as the stationary distribution of the generative Markov chain. The conditions for existence of the stationary distribution are mild and are the same conditions required by standard MCMC methods (see section 17.3). These conditions are necessary to guarantee that the chain mixes, but they can be violated by some choices of the transition distributions (for example, if they are deterministic).

One could imagine different training criteria for GSNs. The one proposed and evaluated by Bengio et al. (2014) is simply reconstruction log-probability on the visible units, just as for denoising autoencoders. This is achieved by clamping $\mathbf{x}^{(0)} = \mathbf{x}$ to the observed example and maximizing the probability of generating x at some subsequent time steps, that is, maximizing $\log p(\mathbf{x}^{(k)} = \mathbf{x} \mid \mathbf{h}^{(k)})$ , where $\mathbf{h}^{(k)}$ is sampled from the chain, given $\mathbf{x}^{(0)} = \mathbf{x}$ . In order to estimate the gradient of $\log p(\mathbf{x}^{(k)} = \mathbf{x} \mid \mathbf{h}^{(k)})$ with respect to the other pieces of the model, Bengio et al. (2014) use the reparametrization trick, introduced in section 20.9.

The walk-back training procedure (described in section 20.11.3) was used (Bengio et al., 2014) to improve training convergence of GSNs.

## 20.12.1 Discriminant GSNs

The original formulation of GSNs (Bengio et al., 2014) was meant for unsupervised learning and implicitly modeling $p(\mathbf{x})$ for observed data x, but it is possible to modify the framework to optimize $p(\mathbf{y} \mid \mathbf{x})$ .

For example, Zhou and Troyanskaya (2014) generalize GSNs in this way, by only back-propagating the reconstruction log-probability over the output variables, keeping the input variables fixed. They applied this successfully to model sequences (protein secondary structure) and introduced a (one-dimensional) convolutional structure in the transition operator of the Markov chain. It is important to remember that, for each step of the Markov chain, one generates a new sequence for each layer, and that sequence is the input for computing other layer values (say the one below and the one above) at the next time step.

Hence, the Markov chain is really over the output variable (and associated higher-level hidden layers), and the input sequence only serves to condition that chain, with back-propagation enabling it to learn how the input sequence can condition the output distribution implicitly represented by the Markov chain. It is therefore a case of using the GSN in the context of structured outputs.

Zöhrer and Pernkopf (2014) introduced a hybrid model that combines a supervised objective (as in the above work) and an unsupervised objective (as in the original GSN work) by simply adding (with a different weight) the supervised and unsupervised costs, that is, the reconstruction log-probabilities of y and x respectively. Such a hybrid criterion had previously been introduced for RBMs by Larochelle and Bengio (2008). They show improved classification performance using this scheme.

## 20.13 Other Generation Schemes

The methods we have described so far use either MCMC sampling, ancestral sampling, or some mixture of the two to generate samples. While these are the most popular approaches to generative modeling, they are by no means the only approaches.

Sohl-Dickstein et al. (2015) developed a diffusion inversion training scheme for learning a generative model, based on nonequilibrium thermodynamics. The approach is based on the idea that the probability distributions we wish to sample from have structure. This structure can gradually be destroyed by a diffusion process that incrementally changes the probability distribution to have more entropy. To form a generative model, we can run the process in reverse, by training a model that gradually restores the structure to an unstructured distribution. By iteratively applying a process that brings a distribution closer to the target one, we can gradually approach that target distribution. This approach resembles MCMC methods in the sense that it involves many iterations to produce a sample. However, the model is defined to be the probability distribution produced by the final step of the chain. In this sense, there is no approximation induced by the iterative procedure. The approach introduced by Sohl-Dickstein et al. (2015) is also very close to the generative interpretation of the denoising autoencoder (section 20.11.1). As with the denoising autoencoder, diffusion inversion trains a transition operator that attempts to probabilistically undo the effect of adding some noise. The difference is that diffusion inversion requires undoing only one step of the diffusion process, rather than traveling all the way back to a clean data point. This addresses the following dilemma present with the ordinary reconstruction log-likelihood objective of denoising autoencoders: with small levels of noise the learner only sees configurations near the data points, while with large levels of noise it is asked to do an almost impossible job (because the denoising distribution is highly complex and multimodal). With the diffusion inversion objective, the learner can learn the shape of the density around the data points more precisely as well as remove spurious modes that could show up far from the data points.

Another approach to sample generation is the approximate Bayesian computation (ABC) framework (Rubin et al., 1984). In this approach, samples are rejected or modified to make the moments of selected functions of the samples match those of the desired distribution. While this idea uses the moments of the samples as in moment matching, it is different from moment matching because it modifies the samples themselves, rather than training the model to automatically emit samples with the correct moments. Bachman and Precup (2015) showed how to use ideas from ABC in the context of deep learning, by using ABC to shape the MCMC trajectories of GSNs.

We expect that many other possible approaches to generative modeling await discovery.

## 20.14 Evaluating Generative Models

Researchers studying generative models often need to compare one generative model to another, usually in order to demonstrate that a newly invented generative model is better at capturing some distribution than the pre-existing models.

This can be a difficult and subtle task. Often, we cannot actually evaluate the log-probability of the data under the model, but can evaluate only an approximation. In these cases, it is important to think and communicate clearly about what exactly is being measured. For example, suppose we can evaluate a stochastic estimate of the log-likelihood for model A, and a deterministic lower bound on the log-likelihood for model B. If model A gets a higher score than model B, which is better? If we care about determining which model has a better internal representation of the distribution, we actually cannot tell, unless we have some way of determining how loose the bound for model B is. However, if we care about how well we can use the model in practice, for example to perform anomaly detection, then it is fair to say that a model is preferable based on a criterion specific to the practical task of interest, for example, based on ranking test examples and ranking criteria such as precision and recall.

Another subtlety of evaluating generative models is that the evaluation metrics are often hard research problems in and of themselves. It can be very difficult to establish that models are being compared fairly. For example, suppose we use AIS to estimate $\log Z$ in order to compute $\log \tilde{p}(\boldsymbol{x}) - \log Z$ for a new model we have just invented. A computationally economical implementation of AIS may fail to find several modes of the model distribution and underestimate Z, which will result in us overestimating $\log p(\boldsymbol{x})$ . It can thus be difficult to tell whether a high likelihood estimate is the result of a good model or a bad AIS implementation.

Other fields of machine learning usually allow for some variation in the preprocessing of the data. For example, when comparing the accuracy of object recognition algorithms, it is usually acceptable to preprocess the input images slightly differently for each algorithm based on what kind of input requirements it has. Generative modeling is different because changes in preprocessing, even very small and subtle ones, are completely unacceptable. Any change to the input data changes the distribution to be captured and fundamentally alters the task. For example, multiplying the input by 0.1 will artificially increase likelihood by a factor of 10.

Issues with preprocessing commonly arise when benchmarking generative models on the MNIST dataset, one of the more popular generative modeling benchmarks. MNIST consists of grayscale images. Some models treat MNIST images as points in a real vector space, while others treat them as binary. Yet others treat the grayscale values as probabilities for binary samples. It is essential to compare real-valued models only to other real-valued models and binary-valued models only to other binary-valued models. Otherwise the likelihoods measured are not on the same space. For binary-valued models, the log-likelihood can be at most zero, while for real-valued models, it can be arbitrarily high, since it is the measurement of a density. Among binary models, it is important to compare models using exactly the same kind of binarization. For example, we might binarize a gray pixel to 0 or 1 by thresholding at 0.5, or by drawing a random sample whose probability of being 1 is given by the gray pixel intensity. If we use the random binarization, we might binarize the whole dataset once, or we might draw a different random example for each step of training and then draw multiple samples for evaluation. Each of these three schemes yields wildly different likelihood numbers, and when comparing different models it is important that both models use the same binarization scheme for training and for evaluation. In fact, researchers who apply a single random binarization step share a file containing the results of the random binarization, so that there is no difference in results based on different outcomes of the binarization step.

Because being able to generate realistic samples from the data distribution is one of the goals of a generative model, practitioners often evaluate generative models by visually inspecting the samples. In the best case, this is done not by the researchers themselves, but by experimental subjects who do not know the source of the samples (Denton et al., 2015). Unfortunately, it is possible for a very poor probabilistic model to produce very good samples. A common practice to verify if the model only copies some of the training examples is illustrated in figure 16.1. The idea is to show for some of the generated samples their nearest neighbor in the training set, according to Euclidean distance in the space of x. This test is intended to detect the case where the model overfits the training set and just reproduces training instances. It is even possible to simultaneously underfit and overfit yet still produce samples that individually look good. Imagine a generative model trained on images of dogs and cats that simply learns to reproduce the training images of dogs. Such a model has clearly overfit, because it does not produce images that were not in the training set, but it has also underfit, because it assigns no probability to the training images of cats. Yet a human observer would judge each individual image of a dog to be high quality. In this simple example, it would be easy for a human observer who can inspect many samples to determine that the cats are absent. In more realistic settings, a generative model trained on data with tens of thousands of modes may ignore a small number of modes, and a human observer would not easily be able to inspect or remember enough images to detect the missing variation.

Since the visual quality of samples is not a reliable guide, we often also evaluate the log-likelihood that the model assigns to the test data, when this is computationally feasible. Unfortunately, in some cases the likelihood seems not to measure any attribute of the model that we really care about. For example, real-valued models of MNIST can obtain arbitrarily high likelihood by assigning arbitrarily low variance to background pixels that never change. Models and algorithms that detect these constant features can reap unlimited rewards, even though this is not a very useful thing to do. The potential to achieve a cost approaching negative infinity is present for any kind of maximum likelihood problem with real values, but it is especially problematic for generative models of MNIST because so many of the output values are trivial to predict. This strongly suggests a need for developing other ways of evaluating generative models.

Theis et al. (2015) review many of the issues involved in evaluating generative models, including many of the ideas described above. They highlight the fact that there are many different uses of generative models and that the choice of metric must match the intended use of the model. For example, some generative models are better at assigning high probability to most realistic points, while other generative models are better at rarely assigning high probability to unrealistic points. These differences can result from whether a generative model is designed to minimize $D_{\mathrm{KL}}(p_{\mathrm{data}}||p_{\mathrm{model}})$ or $D_{\mathrm{KL}}(p_{\mathrm{model}}||p_{\mathrm{data}})$ , as illustrated in figure 3.6. Unfortunately, even when we restrict the use of each metric to the task it is most suited for, all the metrics currently in use continue to have serious weaknesses. One of the most important research topics in generative modeling is therefore not just how to improve generative models, but in fact, designing new techniques to measure our progress.

## 20.15 Conclusion

Training generative models with hidden units is a powerful way to make models understand the world represented in the given training data. By learning a model $p_{\mathrm{model}}(\boldsymbol{x})$ and a representation $p_{\mathrm{model}}(\boldsymbol{h} \mid \boldsymbol{x})$ , a generative model can provide answers to many inference problems about the relationships between input variables in x and can offer many different ways of representing x by taking expectations of h at different layers of the hierarchy. Generative models hold the promise to provide AI systems with a framework for all the many different intuitive concepts they need to understand, giving them the ability to reason about these concepts in the face of uncertainty. We hope that our readers will find new ways to make these approaches more powerful and continue the journey to understanding the principles that underlie learning and intelligence.

## Bibliography

Abadi, M., Agarwal, A., Barham, P., Brevdo, E., Chen, Z., Citro, C., Corrado, G. S., Davis, A., Dean, J., Devin, M., Ghemawat, S., Goodfellow, I., Harp, A., Irving, G., Isard, M., Jia, Y., Jozefowicz, R., Kaiser, L., Kudlur, M., Levenberg, J., Mané, D., Monga, R., Moore, S., Murray, D., Olah, C., Schuster, M., Shlens, J., Steiner, B., Sutskever, I., Talwar, K., Tucker, P., Vanhoucke, V., Vasudevan, V., Viégas, F., Vinyals, O., Warden, P., Wattenberg, M., Wicke, M., Yu, Y., and Zheng, X. (2015). TensorFlow: Large-scale machine learning on heterogeneous systems. Software available from tensorflow.org.

Ackley, D. H., Hinton, G. E., and Sejnowski, T. J. (1985). A learning algorithm for Boltzmann machines. Cognitive Science, 9, 147–169.

Alain, G. and Bengio, Y. (2013). What regularized auto-encoders learn from the data generating distribution. In ICLR'2013, arXiv:1211.4246.

Alain, G., Bengio, Y., Yao, L., Éric Thibodeau-Laufer, Yosinski, J., and Vincent, P. (2015). GSNs: Generative stochastic networks. arXiv:1503.05571.

Allen, R. B. (1987). Several studies on natural language and back-propagation. In IEEE First International Conference on Neural Networks, volume 2, pages 335–341, San Diego. http://boballen.info/RBA/PAPERS/NL-BP/nl-bp.pdf.

Anderson, E. (1935). The Irises of the Gaspé Peninsula. Bulletin of the American Iris Society, 59, 2–5.

Ba, J., Mnih, V., and Kavukcuoglu, K. (2014). Multiple object recognition with visual attention. arXiv:1412.7755.

Bachman, P. and Precup, D. (2015). Variational generative stochastic networks with collaborative shaping. In Proceedings of the 32nd International Conference on Machine Learning, ICML 2015, Lille, France, 6-11 July 2015, pages 1964–1972.

Bacon, P.-L., Bengio, E., Pineau, J., and Precup, D. (2015). Conditional computation in neural networks using a decision-theoretic approach. In 2nd Multidisciplinary Conference on Reinforcement Learning and Decision Making (RLDM 2015).

Bagnell, J. A. and Bradley, D. M. (2009). Differentiable sparse coding. In D. Koller, D. Schuurmans, Y. Bengio, and L. Bottou, editors, Advances in Neural Information Processing Systems 21 (NIPS'08), pages 113–120.

Bahdanau, D., Cho, K., and Bengio, Y. (2015). Neural machine translation by jointly learning to align and translate. In ICLR'2015, arXiv:1409.0473.

Bahl, L. R., Brown, P., de Souza, P. V., and Mercer, R. L. (1987). Speech recognition with continuous-parameter hidden Markov models. Computer, Speech and Language, 2, 219–234.

Baldi, P. and Hornik, K. (1989). Neural networks and principal component analysis: Learning from examples without local minima. Neural Networks, 2, 53–58.

Baldi, P., Brunak, S., Frasconi, P., Soda, G., and Pollastri, G. (1999). Exploiting the past and the future in protein secondary structure prediction. Bioinformatics, 15(11), 937–946.

Baldi, P., Sadowski, P., and Whiteson, D. (2014). Searching for exotic particles in high-energy physics with deep learning. Nature communications, 5.

Ballard, D. H., Hinton, G. E., and Sejnowski, T. J. (1983). Parallel vision computation. Nature.

Barlow, H. B. (1989). Unsupervised learning. Neural Computation, 1, 295–311.

Barron, A. E. (1993). Universal approximation bounds for superpositions of a sigmoidal function. IEEE Trans. on Information Theory, 39, 930–945.

Bartholomew, D. J. (1987). Latent variable models and factor analysis. Oxford University Press.

Basilevsky, A. (1994). Statistical Factor Analysis and Related Methods: Theory and Applications. Wiley.

Bastien, F., Lamblin, P., Pascanu, R., Bergstra, J., Goodfellow, I. J., Bergeron, A., Bouchard, N., and Bengio, Y. (2012). Theano: new features and speed improvements. Deep Learning and Unsupervised Feature Learning NIPS 2012 Workshop.

Basu, S. and Christensen, J. (2013). Teaching classification boundaries to humans. In AAAI'2013.

Baxter, J. (1995). Learning internal representations. In Proceedings of the 8th International Conference on Computational Learning Theory (COLT'95), pages 311–320, Santa Cruz, California. ACM Press.

Bayer, J. and Osendorfer, C. (2014). Learning stochastic recurrent networks. ArXiv e-prints.

Becker, S. and Hinton, G. (1992). A self-organizing neural network that discovers surfaces in random-dot stereograms. Nature, 355, 161–163.

Behnke, S. (2001). Learning iterative image reconstruction in the neural abstraction pyramid. Int. J. Computational Intelligence and Applications, 1(4), 427–438.

Beiu, V., Quintana, J. M., and Avedillo, M. J. (2003). VLSI implementations of threshold logic-a comprehensive survey. Neural Networks, IEEE Transactions on, 14(5), 1217–1243.

Belkin, M. and Niyogi, P. (2002). Laplacian eigenmaps and spectral techniques for embedding and clustering. In T. Dietterich, S. Becker, and Z. Ghahramani, editors, Advances in Neural Information Processing Systems 14 (NIPS'01), Cambridge, MA. MIT Press.

Belkin, M. and Niyogi, P. (2003). Laplacian eigenmaps for dimensionality reduction and data representation. Neural Computation, 15(6), 1373–1396.

Bengio, E., Bacon, P.-L., Pineau, J., and Precup, D. (2015a). Conditional computation in neural networks for faster models. arXiv:1511.06297.

Bengio, S. and Bengio, Y. (2000a). Taking on the curse of dimensionality in joint distributions using neural networks: IEEE Transactions on Neural Networks, special issue on Data Mining and Knowledge Discovery, 11(3), 550–557.

Bengio, S., Vinyals, O., Jaitly, N., and Shazeer, N. (2015b). Scheduled sampling for sequence prediction with recurrent neural networks. Technical report, arXiv:1506.03099.

Bengio, Y. (1991). Artificial Neural Networks and their Application to Sequence Recognition. Ph.D. thesis, McGill University, (Computer Science), Montreal, Canada.

Bengio, Y. (2000). Gradient-based optimization of hyperparameters. Neural Computation, 12(8), 1889–1900.

Bengio, Y. (2002). New distributed probabilistic language models. Technical Report 1215, Dept. IRO, Université de Montréal.

Bengio, Y. (2009). Learning deep architectures for AI. Now Publishers.

Bengio, Y. (2013). Deep learning of representations: looking forward. In Statistical Language and Speech Processing, volume 7978 of Lecture Notes in Computer Science, pages 1–37. Springer, also in arXiv at http://arxiv.org/abs/1305.0445.

Bengio, Y. (2015). Early inference in energy-based models approximates back-propagation. Technical Report arXiv:1510.02777, Universite de Montreal.

Bengio, Y. and Bengio, S. (2000b). Modeling high-dimensional discrete data with multilayer neural networks. In NIPS 12, pages 400-406. MIT Press.

Bengio, Y. and Delalleau, O. (2009). Justifying and generalizing contrastive divergence. Neural Computation, 21(6), 1601–1621.

Bengio, Y. and Grandvalet, Y. (2004). No unbiased estimator of the variance of k-fold cross-validation. In S. Thrun, L. Saul, and B. Schölkopf, editors, Advances in Neural Information Processing Systems 16 (NIPS'03), Cambridge, MA. MIT Press, Cambridge.

Bengio, Y. and LeCun, Y. (2007). Scaling learning algorithms towards AI. In Large Scale Kernel Machines.

Bengio, Y. and Monperrus, M. (2005). Non-local manifold tangent learning. In L. Saul, Y. Weiss, and L. Bottou, editors, Advances in Neural Information Processing Systems 17 (NIPS'04), pages 129–136. MIT Press.

Bengio, Y. and Sénécal, J.-S. (2003). Quick training of probabilistic neural nets by importance sampling. In Proceedings of AISTATS 2003.

Bengio, Y. and Sénécal, J.-S. (2008). Adaptive importance sampling to accelerate training of a neural probabilistic language model. IEEE Trans. Neural Networks, 19(4), 713–722.

Bengio, Y., De Mori, R., Flammia, G., and Kompe, R. (1991). Phonetically motivated acoustic parameters for continuous speech recognition using artificial neural networks. In Proceedings of EuroSpeech'91.

Bengio, Y., De Mori, R., Flammia, G., and Kompe, R. (1992). Neural network-Gaussian mixture hybrid for speech recognition or density estimation. In NIPS 4, pages 175–182. Morgan Kaufmann.

Bengio, Y., Frasconi, P., and Simard, P. (1993). The problem of learning long-term dependencies in recurrent networks. In IEEE International Conference on Neural Networks, pages 1183-1195, San Francisco. IEEE Press. (invited paper).

Bengio, Y., Simard, P., and Frasconi, P. (1994). Learning long-term dependencies with gradient descent is difficult. IEEE Tr. Neural Nets.

Bengio, Y., Latendresse, S., and Dugas, C. (1999). Gradient-based learning of hyperparameters. Learning Conference, Snowbird.

Bengio, Y., Ducharme, R., and Vincent, P. (2001). A neural probabilistic language model. In T. K. Leen, T. G. Dietterich, and V. Tresp, editors, NIPS'2000, pages 932–938. MIT Press.

Bengio, Y., Ducharme, R., Vincent, P., and Jauvin, C. (2003). A neural probabilistic language model. JMLR, 3, 1137–1155.

Bengio, Y., Le Roux, N., Vincent, P., Delalleau, O., and Marcotte, P. (2006a). Convex neural networks. In NIPS'2005, pages 123–130.

Bengio, Y., Delalleau, O., and Le Roux, N. (2006b). The curse of highly variable functions for local kernel machines. In NIPS'2005.

Bengio, Y., Larochelle, H., and Vincent, P. (2006c). Non-local manifold Parzen windows. In NIPS'2005. MIT Press.

Bengio, Y., Lamblin, P., Popovici, D., and Larochelle, H. (2007). Greedy layer-wise training of deep networks. In NIPS'2006.

Bengio, Y., Louradour, J., Collobert, R., and Weston, J. (2009). Curriculum learning. In ICML'09.

Bengio, Y., Mesnil, G., Dauphin, Y., and Rifai, S. (2013a). Better mixing via deep representations. In ICML'2013.

Bengio, Y., Léonard, N., and Courville, A. (2013b). Estimating or propagating gradients through stochastic neurons for conditional computation. arXiv:1308.3432.

Bengio, Y., Yao, L., Alain, G., and Vincent, P. (2013c). Generalized denoising autoencoders as generative models. In NIPS'2013.

Bengio, Y., Courville, A., and Vincent, P. (2013d). Representation learning: A review and new perspectives. IEEE Trans. Pattern Analysis and Machine Intelligence (PAMI), 35(8), 1798–1828.

Bengio, Y., Thibodeau-Laufer, E., Alain, G., and Yosinski, J. (2014). Deep generative stochastic networks trainable by backprop. In ICML'2014.

Bennett, C. (1976). Efficient estimation of free energy differences from Monte Carlo data. Journal of Computational Physics, 22(2), 245–268.

Bennett, J. and Lanning, S. (2007). The Netflix prize.

Berger, A. L., Della Pietra, V. J., and Della Pietra, S. A. (1996). A maximum entropy approach to natural language processing. Computational Linguistics, 22, 39–71.

Berglund, M. and Raiko, T. (2013). Stochastic gradient estimate variance in contrastive divergence and persistent contrastive divergence. CoRR, abs/1312.6002.

Bergstra, J. (2011). Incorporating Complex Cells into Neural Networks for Pattern Classification. Ph.D. thesis, Université de Montréal.

Bergstra, J. and Bengio, Y. (2009). Slow, decorrelated features for pretraining complex cell-like networks. In NIPS'2009.

Bergstra, J. and Bengio, Y. (2012). Random search for hyper-parameter optimization. J. Machine Learning Res., 13, 281–305.

Bergstra, J., Breuleux, O., Bastien, F., Lamblin, P., Pascanu, R., Desjardins, G., Turian, J., Warde-Farley, D., and Bengio, Y. (2010). Theano: a CPU and GPU math expression compiler. In Proc. SciPy.

Bergstra, J., Bardenet, R., Bengio, Y., and Kégl, B. (2011). Algorithms for hyper-parameter optimization. In NIPS'2011.

Berkes, P. and Wiskott, L. (2005). Slow feature analysis yields a rich repertoire of complex cell properties. Journal of Vision, 5(6), 579–602.

Bertsekas, D. P. and Tsitsiklis, J. (1996). Neuro-Dynamic Programming. Athena Scientific.

Besag, J. (1975). Statistical analysis of non-lattice data. The Statistician, 24(3), 179–195.

Bishop, C. M. (1994). Mixture density networks.

Bishop, C. M. (1995a). Regularization and complexity control in feed-forward networks. In Proceedings International Conference on Artificial Neural Networks ICANN'95, volume 1, page 141–148.

Bishop, C. M. (1995b). Training with noise is equivalent to Tikhonov regularization. Neural Computation, 7(1), 108–116.

Bishop, C. M. (2006). Pattern Recognition and Machine Learning. Springer.

Blum, A. L. and Rivest, R. L. (1992). Training a 3-node neural network is NP-complete.

Blumer, A., Ehrenfeucht, A., Haussler, D., and Warmuth, M. K. (1989). Learnability and the Vapnik–Chervonenkis dimension. Journal of the ACM, 36(4), 929–865.

Bonnet, G. (1964). Transformations des signaux aléatoires à travers les systèmes non linéaires sans mémoire. Annales des Télécommunications, 19(9–10), 203–220.

Bordes, A., Weston, J., Collobert, R., and Bengio, Y. (2011). Learning structured embeddings of knowledge bases. In AAAI 2011.

Bordes, A., Glorot, X., Weston, J., and Bengio, Y. (2012). Joint learning of words and meaning representations for open-text semantic parsing. AISTATS'2012.

Bordes, A., Glorot, X., Weston, J., and Bengio, Y. (2013a). A semantic matching energy function for learning with multi-relational data. Machine Learning: Special Issue on Learning Semantics.

Bordes, A., Usunier, N., Garcia-Duran, A., Weston, J., and Yakhnenko, O. (2013b). Translating embeddings for modeling multi-relational data. In C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Weinberger, editors, Advances in Neural Information Processing Systems 26, pages 2787–2795. Curran Associates, Inc.

Bornschein, J. and Bengio, Y. (2015). Reweighted wake-sleep. In ICLR'2015, arXiv:1406.2751.

Bornschein, J., Shabanian, S., Fischer, A., and Bengio, Y. (2015). Training bidirectional Helmholtz machines. Technical report, arXiv:1506.03877.

Boser, B. E., Guyon, I. M., and Vapnik, V. N. (1992). A training algorithm for optimal margin classifiers. In COLT '92: Proceedings of the fifth annual workshop on Computational learning theory, pages 144–152, New York, NY, USA. ACM.

Bottou. L. (1998). Online algorithms and stochastic approximations. In D. Saad, editor, Online Learning in Neural Networks. Cambridge University Press, Cambridge, UK.

Bottou, L. (2011). From machine learning to machine reasoning. Technical report, arXiv.1102.1808.

Bottou, L. (2015). Multilayer neural networks. Deep Learning Summer School.

Bottou, L. and Bousquet, O. (2008). The tradeoffs of large scale learning. In NIPS'2008.

Boulanger-Lewandowski, N., Bengio, Y., and Vincent, P. (2012). Modeling temporal dependencies in high-dimensional sequences: Application to polyphonic music generation and transcription. In ICML'12.

Boureau, Y., Ponce, J., and LeCun, Y. (2010). A theoretical analysis of feature pooling in vision algorithms. In Proc. International Conference on Machine learning (ICML'10).

Boureau, Y., Le Roux, N., Bach, F., Ponce, J., and LeCun, Y. (2011). Ask the locals: multi-way local pooling for image recognition. In Proc. International Conference on Computer Vision (ICCV'11). IEEE.

Bourlard, H. and Kamp, Y. (1988). Auto-association by multilayer perceptrons and singular value decomposition. Biological Cybernetics, 59, 291–294.

Bourlard, H. and Wellekens, C. (1989). Speech pattern discrimination and multi-layered perceptrons. Computer Speech and Language, 3, 1–19.

Boyd, S. and Vandenberghe, L. (2004). Convex Optimization. Cambridge University Press, New York, NY, USA.

Brady, M. L., Raghavan, R., and Slawny, J. (1989). Back-propagation fails to separate where perceptrons succeed. IEEE Transactions on Circuits and Systems, 36, 665–674.

Brakel, P., Stroobandt, D., and Schrauwen, B. (2013). Training energy-based models for time-series imputation. Journal of Machine Learning Research, 14, 2771–2797.

Brand, M. (2003). Charting a manifold. In NIPS'2002, pages 961–968. MIT Press.

Breiman, L. (1994). Bagging predictors. Machine Learning, 24(2), 123-140.

Breiman, L., Friedman, J. H., Olshen, R. A., and Stone, C. J. (1984). Classification and Regression Trees. Wadsworth International Group, Belmont, CA.

Bridle, J. S. (1990). Alphanets: a recurrent ‘neural’ network architecture with a hidden Markov model interpretation. Speech Communication, 9(1), 83–92.

Briggman, K., Denk, W., Seung, S., Helmstaedter, M. N., and Turaga, S. C. (2009). Maximin affinity learning of image segmentation. In NIPS'2009, pages 1865–1873.

Brown, P. F., Cocke, J., Pietra, S. A. D., Pietra, V. J. D., Jelinek, F., Lafferty, J. D., Mercer, R. L., and Roossin, P. S. (1990). A statistical approach to machine translation. Computational linguistics, 16(2), 79–85.

Brown, P. F., Pietra, V. J. D., DeSouza, P. V., Lai, J. C., and Mercer, R. L. (1992). Class-based n-gram models of natural language. Computational Linguistics, 18, 467–479.

Bryson, A. and Ho, Y. (1969). Applied optimal control: optimization, estimation, and control. Blaisdell Pub. Co.

Bryson, Jr., A. E. and Denham, W. F. (1961). A steepest-ascent method for solving optimum programming problems. Technical Report BR-1303, Raytheon Company, Missile and Space Division.

Buciluă, C., Caruana, R., and Niculescu-Mizil, A. (2006). Model compression. In Proceedings of the 12th ACM SIGKDD international conference on Knowledge discovery and data mining, pages 535–541. ACM.

Burda, Y., Grosse, R., and Salakhutdinov, R. (2015). Importance weighted autoencoders. arXiv preprint arXiv:1509.00519.

Cai, M., Shi, Y., and Liu, J. (2013). Deep maxout neural networks for speech recognition. In Automatic Speech Recognition and Understanding (ASRU), 2013 IEEE Workshop on, pages 291–296. IEEE.

Carreira-Perpiñan, M. A. and Hinton, G. E. (2005). On contrastive divergence learning. In R. G. Cowell and Z. Ghahramani, editors, Proceedings of the Tenth International Workshop on Artificial Intelligence and Statistics (AISTATS'05), pages 33–40. Society for Artificial Intelligence and Statistics.

Caruana, R. (1993). Multitask connectionist learning. In Proc. 1993 Connectionist Models Summer School, pages 372-379.

Cauchy, A. (1847). Méthode générale pour la résolution de systèmes d'équations simultanées. In Compte rendu des séances de l'académie des sciences, pages 536–538.

Cayton, L. (2005). Algorithms for manifold learning. Technical Report CS2008-0923, UCSD.

Chandola, V., Banerjee, A., and Kumar, V. (2009). Anomaly detection: A survey. ACM computing surveys (CSUR), 41(3), 15.

Chapelle, O., Weston, J., and Schölkopf, B. (2003). Cluster kernels for semi-supervised learning. In S. Becker, S. Thrun, and K. Obermayer, editors, Advances in Neural Information Processing Systems 15 (NIPS'02), pages 585–592, Cambridge, MA. MIT Press.

Chapelle, O., Schölkopf, B., and Zien, A., editors (2006). Semi-Supervised Learning. MIT Press, Cambridge, MA.

Chellapilla, K., Pu-, S., and Simard, P. (2006). High Performance Convolutional Neural Networks for Document Processing. In Guy Lorette, editor, Tenth International Workshop on Frontiers in Handwriting Recognition, La Baule (France). Université de Rennes 1, Suvisoft. http://www.suvisoft.com.

Chen, B., Ting, J.-A., Marlin, B. M., and de Freitas, N. (2010). Deep learning of invariant spatio-temporal features from video. NIPS\*2010 Deep Learning and Unsupervised Feature Learning Workshop.

Chen, S. F. and Goodman, J. T. (1999). An empirical study of smoothing techniques for language modeling. Computer, Speech and Language, 13(4), 359–393.

Chen, T., Du, Z., Sun, N., Wang, J., Wu, C., Chen, Y., and Temam, O. (2014a). DianNao: A small-footprint high-throughput accelerator for ubiquitous machine-learning. In Proceedings of the 19th international conference on Architectural support for programming languages and operating systems, pages 269–284. ACM.

Chen, T., Li, M., Li, Y., Lin, M., Wang, N., Wang, M., Xiao, T., Xu, B., Zhang, C., and Zhang, Z. (2015). MXNet: A flexible and efficient machine learning library for heterogeneous distributed systems. arXiv preprint arXiv:1512.01274.

Chen, Y., Luo, T., Liu, S., Zhang, S., He, L., Wang, J., Li, L., Chen, T., Xu, Z., Sun, N., et al. (2014b). DaDianNao: A machine-learning supercomputer. In Microarchitecture (MICRO), 2014 47th Annual IEEE/ACM International Symposium on, pages 609-622. IEEE.

Chilimbi, T., Suzue, Y., Apacible, J., and Kalyanaraman, K. (2014). Project Adam: Building an efficient and scalable deep learning training system. In 11th USENIX Symposium on Operating Systems Design and Implementation (OSDI'14).

Cho, K., Raiko, T., and Ilin, A. (2010). Parallel tempering is efficient for learning restricted Boltzmann machines. In IJCNN'2010.

Cho, K., Raiko, T., and Ilin, A. (2011). Enhanced gradient and adaptive learning rate for training restricted Boltzmann machines. In ICML'2011, pages 105-112.

Cho, K., van Merriënboer, B., Gulcehre, C., Bougares, F., Schwenk, H., and Bengio, Y. (2014a). Learning phrase representations using RNN encoder-decoder for statistical machine translation. In Proceedings of the Empirical Methods in Natural Language Processing (EMNLP 2014).

Cho, K., Van Merriënboer, B., Bahdanau, D., and Bengio, Y. (2014b). On the properties of neural machine translation: Encoder-decoder approaches. ArXiv e-prints, abs/1409.1259.

Choromanska, A., Henaff, M., Mathieu, M., Arous, G. B., and LeCun, Y. (2014). The loss surface of multilayer networks.

Chorowski, J., Bahdanau, D., Cho, K., and Bengio, Y. (2014). End-to-end continuous speech recognition using attention-based recurrent NN: First results. arXiv:1412.1602.

Chrisman, L. (1991). Learning recursive distributed representations for holistic computation. Connection Science, 3(4), 345–366. http://repository.cmu.edu/cgi/viewcontent.cgi?article=3061&context=compsci.

Christianson, B. (1992). Automatic Hessians by reverse accumulation. IMA Journal of Numerical Analysis, 12(2), 135–150.

Chrupala, G., Kadar, A., and Alishahi, A. (2015). Learning language through pictures. arXiv 1506.03694.

Chung, J., Gulcehre, C., Cho, K., and Bengio, Y. (2014). Empirical evaluation of gated recurrent neural networks on sequence modeling. NIPS'2014 Deep Learning workshop, arXiv 1412.3555.

Chung, J., Gülçehre, Ç., Cho, K., and Bengio, Y. (2015a). Gated feedback recurrent neural networks. In ICML'15.

Chung, J., Kastner, K., Dinh, L., Goel, K., Courville, A., and Bengio, Y. (2015b). A recurrent latent variable model for sequential data. In NIPS'2015.

Ciresan, D., Meier, U., Masci, J., and Schmidhuber, J. (2012). Multi-column deep neural network for traffic sign classification. Neural Networks, 32, 333–338.

Ciresan, D. C., Meier, U., Gambardella, L. M., and Schmidhuber, J. (2010). Deep big simple neural nets for handwritten digit recognition. Neural Computation, 22, 1–14.

Coates, A. and Ng, A. Y. (2011). The importance of encoding versus training with sparse coding and vector quantization. In ICML'2011.

Coates, A., Lee, H., and Ng, A. Y. (2011). An analysis of single-layer networks in unsupervised feature learning. In Proceedings of the Thirteenth International Conference on Artificial Intelligence and Statistics (AISTATS 2011).

Coates, A., Huval, B., Wang, T., Wu, D., Catanzaro, B., and Andrew, N. (2013). Deep learning with COTS HPC systems. In S. Dasgupta and D. McAllester, editors, Proceedings of the 30th International Conference on Machine Learning (ICML-13), volume 28 (3), pages 1337–1345. JMLR Workshop and Conference Proceedings.

Cohen, N., Sharir, O., and Shashua, A. (2015). On the expressive power of deep learning: A tensor analysis. arXiv:1509.05009.

Collobert, R. (2004). Large Scale Machine Learning. Ph.D. thesis, Université de Paris VI, LIP6.

Collobert, R. (2011). Deep learning for efficient discriminative parsing. In AISTATS'2011.

Collobert, R. and Weston, J. (2008a). A unified architecture for natural language processing: Deep neural networks with multitask learning. In ICML'2008.

Collobert, R. and Weston, J. (2008b). A unified architecture for natural language processing: Deep neural networks with multitask learning. In ICML'2008.

Collobert, R., Bengio, S., and Bengio, Y. (2001). A parallel mixture of SVMs for very large scale problems. Technical Report IDIAP-RR-01-12, IDIAP.

Collobert, R., Bengio, S., and Bengio, Y. (2002). Parallel mixture of SVMs for very large scale problems. Neural Computation, 14(5), 1105–1114.

Collobert, R., Weston, J., Bottou, L., Karlen, M., Kavukcuoglu, K., and Kuksa, P. (2011a). Natural language processing (almost) from scratch. The Journal of Machine Learning Research, 12, 2493–2537.

Collobert, R., Kavukcuoglu, K., and Farabet, C. (2011b). Torch7: A Matlab-like environment for machine learning. In BigLearn, NIPS Workshop.

Comon, P. (1994). Independent component analysis - a new concept? Signal Processing, 36, 287–314.

Cortes, C. and Vapnik, V. (1995). Support vector networks. Machine Learning, 20, 273–297.

Couprie, C., Farabet, C., Najman, L., and LeCun, Y. (2013). Indoor semantic segmentation using depth information. In International Conference on Learning Representations (ICLR2013).

Courbariaux, M., Bengio, Y., and David, J.-P. (2015). Low precision arithmetic for deep learning. In Arxiv:1412.7024, ICLR'2015 Workshop.

Courville, A., Bergstra, J., and Bengio, Y. (2011). Unsupervised models of images by spike-and-slab RBMs. In ICML'11.

Courville, A., Desjardins, G., Bergstra, J., and Bengio, Y. (2014). The spike-and-slab RBM and extensions to discrete and sparse data distributions. Pattern Analysis and Machine Intelligence, IEEE Transactions on, 36(9), 1874–1887.

Cover, T. M. and Thomas, J. A. (2006). Elements of Information Theory, 2nd Edition. Wiley-Interscience.

Cox, D. and Pinto, N. (2011). Beyond simple features: A large-scale feature search approach to unconstrained face recognition. In Automatic Face & Gesture Recognition and Workshops (FG 2011), 2011 IEEE International Conference on, pages 8–15. IEEE.

Cramér, H. (1946). Mathematical methods of statistics. Princeton University Press.

Crick, F. H. C. and Mitchison, G. (1983). The function of dream sleep. Nature, 304, 111–114.

Cybenko, G. (1989). Approximation by superpositions of a sigmoidal function. Mathematics of Control, Signals, and Systems, 2, 303–314.

Dahl, G. E., Ranzato, M., Mohamed, A., and Hinton, G. E. (2010). Phone recognition with the mean-covariance restricted Boltzmann machine. In NIPS'2010.

Dahl, G. E., Yu, D., Deng, L., and Acero, A. (2012). Context-dependent pre-trained deep neural networks for large vocabulary speech recognition. IEEE Transactions on Audio, Speech, and Language Processing, 20(1), 33–42.

Dahl, G. E., Sainath, T. N., and Hinton, G. E. (2013). Improving deep neural networks for LVCSR using rectified linear units and dropout. In ICASSP'2013.

Dahl, G. E., Jaitly, N., and Salakhutdinov, R. (2014). Multi-task neural networks for QSAR predictions. arXiv:1406.1231.

Dauphin, Y. and Bengio, Y. (2013). Stochastic ratio matching of RBMs for sparse high-dimensional inputs. In NIPS26. NIPS Foundation.

Dauphin, Y., Glorot, X., and Bengio, Y. (2011). Large-scale learning of embeddings with reconstruction sampling. In ICML'2011.

Dauphin, Y., Pascanu, R., Gulcehre, C., Cho, K., Ganguli, S., and Bengio, Y. (2014). Identifying and attacking the saddle point problem in high-dimensional non-convex optimization. In NIPS'2014.

Davis, A., Rubinstein, M., Wadhwa, N., Mysore, G., Durand, F., and Freeman, W. T. (2014). The visual microphone: Passive recovery of sound from video. ACM Transactions on Graphics (Proc. SIGGRAPH), 33(4), 79:1–79:10.

Dayan, P. (1990). Reinforcement comparison. In Connectionist Models: Proceedings of the 1990 Connectionist Summer School, San Mateo, CA.

Dayan, P. and Hinton, G. E. (1996). Varieties of Helmholtz machine. Neural Networks, 9(8), 1385–1403.

Dayan, P., Hinton, G. E., Neal, R. M., and Zemel, R. S. (1995). The Helmholtz machine. Neural computation, 7(5), 889–904.

Dean, J., Corrado, G., Monga, R., Chen, K., Devin, M., Le, Q., Mao, M., Ranzato, M., Senior, A., Tucker, P., Yang, K., and Ng, A. Y. (2012). Large scale distributed deep networks. In NIPS'2012.

Dean, T. and Kanazawa, K. (1989). A model for reasoning about persistence and causation. Computational Intelligence, 5(3), 142–150.

Deerwester, S., Dumais, S. T., Furnas, G. W., Landauer, T. K., and Harshman, R. (1990). Indexing by latent semantic analysis. Journal of the American Society for Information Science, 41(6), 391–407.

Delalleau, O. and Dengio, Y. (2011). Shallow vs. deep sum-product networks. In NIPS.

Deng, J., Dong, W., Socher, R., Li, L.-J., Li, K., and Fei-Fei, L. (2009). ImageNet: A Large-Scale Hierarchical Image Database. In CVPR09.

Deng, J., Berg, A. C., Li, K., and Fei-Fei, L. (2010a). What does classifying more than 10,000 image categories tell us? In Proceedings of the 11th European Conference on Computer Vision: Part V, ECCV'10, pages 71–84, Berlin, Heidelberg. Springer-Verlag.

Deng, L. and Yu, D. (2014). Deep learning – methods and applications. Foundations and Trends in Signal Processing.

Deng, L., Seltzer, M., Yu, D., Acero, A., Mohamed, A., and Hinton, G. (2010b). Binary coding of speech spectrograms using a deep auto-encoder. In Interspeech 2010, Makuhari, Chiba, Japan.

Denil, M., Bazzani, L., Larochelle, H., and de Freitas, N. (2012). Learning where to attend with deep architectures for image tracking. Neural Computation, 24(8), 2151–2184.

Denton, E., Chintala, S., Szlam, A., and Fergus, R. (2015). Deep generative image models using a Laplacian pyramid of adversarial networks. NIPS.

Desjardins, G. and Bengio, Y. (2008). Empirical evaluation of convolutional RBMs for vision. Technical Report 1327, Département d'Informatique et de Recherche Opérationnelle, Université de Montréal.

Desjardins, G., Courville, A. C., Bengio, Y., Vincent, P., and Delalleau, O. (2010). Tempered Markov chain Monte Carlo for training of restricted Boltzmann machines. In International Conference on Artificial Intelligence and Statistics, pages 145–152.

Desjardins, G., Courville, A., and Bengio, Y. (2011). On tracking the partition function. In NIPS'2011.

Desjardins, G., Simonyan, K., Pascanu, R., et al. (2015). Natural neural networks. In Advances in Neural Information Processing Systems, pages 2062–2070.

Devlin, J., Zbib, R., Huang, Z., Lamar, T., Schwartz, R., and Makhoul, J. (2014). Fast and robust neural network joint models for statistical machine translation. In Proc. ACL'2014.

Devroye, L. (2013). Non-Uniform Random Variate Generation. SpringerLink : Bücher. Springer New York.

DiCarlo, J. J. (2013). Mechanisms underlying visual object recognition: Humans vs. neurons vs. machines. NIPS Tutorial.

Dinh, L., Krueger, D., and Bengio, Y. (2014). NICE: Non-linear independent components estimation. arXiv:1410.8516.

Donahue, J., Hendricks, L. A., Guadarrama, S., Rohrbach, M., Venugopalan, S., Saenko, K., and Darrell, T. (2014). Long-term recurrent convolutional networks for visual recognition and description. arXiv:1411.4389.

Donoho, D. L. and Grimes, C. (2003). Hessian eigenmaps: new locally linear embedding techniques for high-dimensional data. Technical Report 2003-08, Dept. Statistics, Stanford University.

Dosovitskiy, A., Springenberg, J. T., and Brox, T. (2015). Learning to generate chairs with convolutional neural networks. In Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition, pages 1538–1546.

Doya, K. (1993). Bifurcations of recurrent neural networks in gradient descent learning. IEEE Transactions on Neural Networks, 1, 75–80.

Dreyfus, S. E. (1962). The numerical solution of variational problems. Journal of Mathematical Analysis and Applications, 5(1), 30–45.

Dreyfus, S. E. (1973). The computational solution of optimal control problems with time lag. IEEE Transactions on Automatic Control, 18(4), 383–385.

Drucker, H. and LeCun, Y. (1992). Improving generalisation performance using double back-propagation. IEEE Transactions on Neural Networks, 3(6), 991–997.

Duchi, J., Hazan, E., and Singer, Y. (2011). Adaptive subgradient methods for online learning and stochastic optimization. Journal of Machine Learning Research.

Dudik, M., Langford, J., and Li, L. (2011). Doubly robust policy evaluation and learning. In Proceedings of the 28th International Conference on Machine learning, ICML '11.

Dugas, C., Bengio, Y., Bélisle, F., and Nadeau, C. (2001). Incorporating second-order functional knowledge for better option pricing. In T. Leen, T. Dietterich, and V. Tresp, editors, Advances in Neural Information Processing Systems 13 (NIPS'00), pages 472-478. MIT Press.

Dziugaite, G. K., Roy, D. M., and Ghahramani, Z. (2015). Training generative neural networks via maximum mean discrepancy optimization. arXiv preprint arXiv:1505.03906.

El Hihi, S. and Bengio, Y. (1996). Hierarchical recurrent neural networks for long-term dependencies. In NIPS'1995.

Elkahky, A. M., Song, Y., and He, X. (2015). A multi-view deep learning approach for cross domain user modeling in recommendation systems. In Proceedings of the 24th International Conference on World Wide Web, pages 278–288.

Elman, J. L. (1993). Learning and development in neural networks: The importance of starting small. Cognition, 48, 781–799.

Erhan, D., Manzagol, P.-A., Bengio, Y., Bengio, S., and Vincent, P. (2009). The difficulty of training deep architectures and the effect of unsupervised pre-training. In Proceedings of AISTATS'2009.

Erhan, D., Bengio, Y., Courville, A., Manzagol, P., Vincent, P., and Bengio, S. (2010). Why does unsupervised pre-training help deep learning? J. Machine Learning Res.

Fahlman, S. E., Hinton, G. E., and Sejnowski, T. J. (1983). Massively parallel architectures for AI: NETL, thistle, and Boltzmann machines. In Proceedings of the National Conference on Artificial Intelligence AAAI-83.

Fang, H., Gupta, S., Iandola, F., Srivastava, R., Deng, L., Dollár, P., Gao, J., He, X., Mitchell, M., Platt, J. C., Zitnick, C. L., and Zweig, G. (2015). From captions to visual concepts and back. arXiv:1411.4952.

Farabet, C., LeCun, Y., Kavukcuoglu, K., Culurciello, E., Martini, B., Akselrod, P., and Talay, S. (2011). Large-scale FPGA-based convolutional networks. In R. Bekkerman, M. Bilenko, and J. Langford, editors, Scaling up Machine Learning: Parallel and Distributed Approaches. Cambridge University Press.

Farabet, C., Couprie, C., Najman, L., and LeCun, Y. (2013). Learning hierarchical features for scene labeling. IEEE Transactions on Pattern Analysis and Machine Intelligence, 35(8), 1915–1929.

Fei-Fei, L., Fergus, R., and Perona, P. (2006). One-shot learning of object categories. IEEE Transactions on Pattern Analysis and Machine Intelligence, 28(4), 594–611.

Finn, C., Tan, X. Y., Duan, Y., Darrell, T., Levine, S., and Abbeel, P. (2015). Learning visual feature spaces for robotic manipulation with deep spatial autoencoders. arXiv preprint arXiv:1509.06113.

Fisher, R. A. (1936). The use of multiple measurements in taxonomic problems. Annals of Eugenics, 7, 179-188.

Földiák, P. (1989). Adaptive network for optimal linear feature extraction. In International Joint Conference on Neural Networks (IJCNN), volume 1, pages 401–405, Washington 1989. IEEE, New York.

Forcada, M., and Neco. R. (1997). Recursive hetero-associative memories for translation. In Biological and Artificial Computation: From Neuroscience to Technology, pages 453–462. http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.43.1968.

Franzius, M., Sprekeler, H., and Wiskott, L. (2007). Slowness and sparseness lead to place, head-direction, and spatial-view cells.

Franzius, M., Wilbert, N., and Wiskott, L. (2008). Invariant object recognition with slow feature analysis. In Artificial Neural Networks-ICANN 2008, pages 961–970. Springer.

Frasconi, P., Gori, M., and Sperduti, A. (1997). On the efficient classification of data structures by neural networks. In Proc. Int. Joint Conf. on Artificial Intelligence.

Frasconi, P., Gori, M., and Sperduti, A. (1998). A general framework for adaptive processing of data structures. IEEE Transactions on Neural Networks, 9(5), 768–786.

Freund, Y. and Schapire, R. E. (1996a). Experiments with a new boosting algorithm. In Machine Learning: Proceedings of Thirteenth International Conference, pages 148–156, USA. ACM.

Freund, Y. and Schapire, R. E. (1996b). Game theory, on-line prediction and boosting. In Proceedings of the Ninth Annual Conference on Computational Learning Theory, pages 325–332.

Frey, B. J. (1998). Graphical models for machine learning and digital communication. MIT Press.

Frey, B. J., Hinton, G. E., and Dayan, P. (1996). Does the wake-sleep algorithm learn good density estimators? In D. Touretzky, M. Mozer, and M. Hasselmo, editors, Advances in Neural Information Processing Systems 8 (NIPS'95), pages 661–670. MIT Press, Cambridge, MA.

Frobenius, G. (1908). Über matrizen aus positiven elementen, s. B. Preuss. Akad. Wiss. Berlin, Germany.

Fukushima, K. (1975). Cognitron: A self-organizing multilayered neural network. Biological Cybernetics, 20, 121–136.

Fukushima, K. (1980). Neocognitron: A self-organizing neural network model for a mechanism of pattern recognition unaffected by shift in position. Biological Cybernetics, 36, 193–202.

Gal, Y. and Ghahramani, Z. (2015). Bayesian convolutional neural networks with Bernoulli approximate variational inference. arXiv preprint arXiv:1506.02158.

Gallinari, P., LeCun, Y., Thiria, S., and Fogelman-Soulie, F. (1987). Memoires associatives distribuees. In Proceedings of COGNITIVA 87, Paris, La Villette.

Garcia-Duran, A., Bordes, A., Usunier, N., and Grandvalet, Y. (2015). Combining two and three-way embeddings models for link prediction in knowledge bases. arXiv preprint arXiv:1506.00999.

Garofolo, J. S., Lamel, L. F., Fisher, W. M., Fiscus, J. G., and Pallett, D. S. (1993). Darpa timit acoustic-phonetic continuous speech corpus cd-rom. nist speech disc 1-1.1. NASA STI/Recon Technical Report N, 93, 27403.

Garson, J. (1900). The metric system of identification of criminals, as used in Great Britain and Ireland. The Journal of the Anthropological Institute of Great Britain and Ireland, (2), 177–227.

Gers, F. A., Schmidhuber, J., and Cummins, F. (2000). Learning to forget: Continual prediction with STM. Neural computation, 12(10), 2451–2471.

Ghahramani, Z. and Hinton, G. E. (1996). The EM algorithm for mixtures of factor analyzers. Technical Report CRG-TR-96-1, Dpt. of Comp. Sci., Univ. of Toronto.

Gillick, D., Brunk, C., Vinyals, O., and Subramanya, A. (2015). Multilingual language processing from bytes. arXiv preprint arXiv:1512.00103.

Girshick, R., Donahue, J., Darrell, T., and Malik, J. (2015). Region-based convolutional networks for accurate object detection and segmentation.

Giudice, M. D., Manera, V., and Keysers, C. (2009). Programmed to learn? The ontogeny of mirror neurons. Dev. Sci., 12(2), 350—363.

Glorot, X. and Bengio, Y. (2010). Understanding the difficulty of training deep feedforward neural networks. In AISTATS'2010.

Glorot, X., Bordes, A., and Bengio, Y. (2011a). Deep sparse rectifier neural networks. In AISTATS'2011.

Glorot, X., Bordes, A., and Bengio, Y. (2011b). Domain adaptation for large-scale sentiment classification: A deep learning approach. In ICML'2011.

Goldberger, J., Roweis, S., Hinton, G. E., and Salakhutdinov, R. (2005). Neighbourhood components analysis. In L. Saul, Y. Weiss, and L. Bottou, editors, Advances in Neural Information Processing Systems 17 (NIPS'04). MIT Press.

Gong, S., McKenna, S., and Psarrou, A. (2000). Dynamic Vision: From Images to Face Recognition. Imperial College Press.

Goodfellow, I., Le, Q., Saxe, A., and Ng, A. (2009). Measuring invariances in deep networks. In NIPS'2009, pages 646–654.

Goodfellow, I., Koenig, N., Muja, M., Pantofaru, C., Sorokin, A., and Takayama, L. (2010). Help me help you: Interfaces for personal robots. In Proc. of Human Robot Interaction (HRI), Osaka, Japan. ACM Press, ACM Press.

Goodfellow, I. J. (2010). Technical report: Multidimensional, downsampled convolution for autoencoders. Technical report, Université de Montréal.

Goodfellow, I. J. (2014). On distinguishability criteria for estimating generative models. In International Conference on Learning Representations, Workshops Track.

Goodfellow, I. J., Courville, A., and Bengio, Y. (2011). Spike-and-slab sparse coding for unsupervised feature discovery. In NIPS Workshop on Challenges in Learning Hierarchical Models.

Goodfellow, I. J., Warde-Farley, D., Mirza, M., Courville, A., and Bengio, Y. (2013a). Maxout networks. In S. Dasgupta and D. McAllester, editors, ICML'13, pages 1319–1327.

Goodfellow, I. J., Mirza, M., Courville, A., and Bengio, Y. (2013b). Multi-prediction deep Boltzmann machines. In NIPS26. NIPS Foundation.

Goodfellow, I. J., Warde-Farley, D., Lamblin, P., Dumoulin, V., Mirza, M., Pascanu, R., Bergstra, J., Bastien, F., and Bengio, Y. (2013c). Pylearn2: a machine learning research library. arXiv preprint arXiv:1308.4214.

Goodfellow, I. J., Courville, A., and Bengio, Y. (2013d). Scaling up spike-and-slab models for unsupervised feature learning. IEEE Transactions on Pattern Analysis and Machine Intelligence, 35(8), 1902–1914.

Goodfellow, I. J., Mirza, M., Xiao, D., Courville, A., and Bengio, Y. (2014a). An empirical investigation of catastrophic forgetting in gradient-based neural networks. In ICLR'2014.

Goodfellow, I. J., Shlens, J., and Szegedy, C. (2014b). Explaining and harnessing adversarial examples. CoRR, abs/1412.6572.

Goodfellow, I. J., Pouget-Abadie, J., Mirza, M., Xu, B., Warde-Farley, D., Ozair, S., Courville, A., and Bengio, Y. (2014c). Generative adversarial networks. In NIPS'2014.

Goodfellow, I. J., Bulatov, Y., Ibarz, J., Arnoud, S., and Shet, V. (2014d). Multi-digit number recognition from Street View imagery using deep convolutional neural networks. In International Conference on Learning Representations.

Goodfellow, I. J., Vinyals, O., and Saxe, A. M. (2015). Qualitatively characterizing neural network optimization problems. In International Conference on Learning Representations.

Goodman, J. (2001). Classes for fast maximum entropy training. In International Conference on Acoustics, Speech and Signal Processing (ICASSP), Utah.

Gori, M. and Tesi, A. (1992). On the problem of local minima in backpropagation. IEEE Transactions on Pattern Analysis and Machine Intelligence, PAMI-14(1), 76–86.

Gosset, W. S. (1908). The probable error of a mean. Biometrika, 6(1), 1-25. Originally published under the pseudonym “Student”.

Gouws, S., Bengio, Y., and Corrado, G. (2014). BilBOWA: Fast bilingual distributed representations without word alignments. Technical report, arXiv:1410.2455.

Graf, H. P. and Jackel, L. D. (1989). Analog electronic neural network circuits. Circuits and Devices Magazine, IEEE, 5(4), 44–49.

Graves, A. (2011). Practical variational inference for neural networks. In NIPS'2011.

Graves, A. (2012). Supervised Sequence Labelling with Recurrent Neural Networks. Studies in Computational Intelligence. Springer.

Graves, A. (2013). Generating sequences with recurrent neural networks. Technical report, arXiv:1308.0850.

Graves, A. and Jaitly, N. (2014). Towards end-to-end speech recognition with recurrent neural networks. In ICML'2014.

Graves, A. and Schmidhuber, J. (2005). Framewise phoneme classification with bidirectional LSTM and other neural network architectures. Neural Networks, 18(5), 602–610.

Graves, A. and Schmidhuber, J. (2009). Offline handwriting recognition with multidimensional recurrent neural networks. In D. Koller, D. Schuurmans, Y. Bengio, and L. Bottou, editors, NIPS'2008, pages 545–552.

Graves, A., Fernández, S., Gomez, F., and Schmidhuber, J. (2006). Connectionist temporal classification: Labelling unsegmented sequence data with recurrent neural networks. In ICML'2006, pages 369–376, Pittsburgh, USA.

Graves, A., Liwicki, M., Bunke, H., Schmidhuber, J., and Fernández, S. (2008). Unconstrained on-line handwriting recognition with recurrent neural networks. In J. Platt, D. Koller, Y. Singer, and S. Roweis, editors, NIPS'2007, pages 577–584.

Graves, A., Liwicki, M., Fernández, S., Bertolami, R., Bunke, H., and Schmidhuber, J. (2009). A novel connectionist system for unconstrained handwriting recognition. Pattern Analysis and Machine Intelligence, IEEE Transactions on, 31(5), 855–868.

Graves, A., Mohamed, A., and Hinton, G. (2013). Speech recognition with deep recurrent neural networks. In ICASSP'2013, pages 6645–6649.

Graves, A., Wayne, G., and Danihelka, I. (2014a). Neural Turing machines. arXiv:1410.5401.

Graves, A., Wayne, G., and Danihelka, I. (2014b). Neural Turing machines. arXiv preprint arXiv:1410.5401.

Grefenstette. E., Hermann, K. M., Suleyman, M., and Blunsom, P. (2015). Learning to transduce with unbounded memory. In NIPS'2015.

Greff, K., Srivastava, R. K., Koutník, J., Steunebrink, B. R., and Schmidhuber, J. (2015). LSTM: a search space odyssey. arXiv preprint arXiv:1503.04069.

Gregor, K. and LeCun, Y. (2010a). Emergence of complex-like cells in a temporal product network with local receptive fields. Technical report, arXiv:1006.0448.

Gregor, K. and LeCun, Y. (2010b). Learning fast approximations of sparse coding. In L. Bottou and M. Littman, editors, Proceedings of the Twenty-seventh International Conference on Machine Learning (ICML-10). ACM.

Gregor, K., Danihelka, I., Mnih, A., Blundell, C., and Wierstra, D. (2014). Deep autoregressive networks. In International Conference on Machine Learning (ICML'2014).

Gregor, K., Danihelka, I., Graves, A., and Wierstra, D. (2015). DRAW: A recurrent neural network for image generation. arXiv preprint arXiv:1502.04623.

Gretton, A., Borgwardt, K. M., Rasch, M. J., Schölkopf, B., and Smola, A. (2012). A kernel two-sample test. The Journal of Machine Learning Research, 13(1), 723–773.

Gülçehre, Ç. and Bengio, Y. (2013). Knowledge matters: Importance of prior information for optimization. In International Conference on Learning Representations (ICLR'2013).

Guo, H. and Gelfand, S. B. (1992). Classification trees with neural network feature extraction. Neural Networks, IEEE Transactions on, 3(6), 923–933.

Gupta, S., Agrawal, A., Gopalakrishnan, K., and Narayanan, P. (2015). Deep learning with limited numerical precision. CoRR, abs/1502.02551.

Gutmann, M. and Hyvarinen, A. (2010). Noise-contrastive estimation: A new estimation principle for unnormalized statistical models. In Proceedings of The Thirteenth International Conference on Artificial Intelligence and Statistics (AISTATS'10).

Hadsell, R., Sermanet, P., Ben, J., Erkan, A., Han, J., Muller, U., and LeCun, Y. (2007). Online learning for offroad robots: Spatial label propagation to learn long-range traversability. In Proceedings of Robotics: Science and Systems, Atlanta, GA, USA.

Hajnal, A., Maass, W., Pudlak, P., Szegedy, M., and Turan, G. (1993). Threshold circuits of bounded depth. J. Comput. System. Sci., 46, 129-154.

Håstad, J. (1986). Almost optimal lower bounds for small depth circuits. In Proceedings of the 18th annual ACM Symposium on Theory of Computing, pages 6–20, Berkeley, California. ACM Press.

Håstad, J. and Goldmann, M. (1991). On the power of small-depth threshold circuits. Computational Complexity, 1, 113–129.

Hastie, T., Tibshirani, R., and Friedman, J. (2001). The elements of statistical learning: data mining, inference and prediction. Springer Series in Statistics. Springer Verlag.

He, K., Zhang, X., Ren, S., and Sun, J. (2015). Delving deep into rectifiers: Surpassing human-level performance on ImageNet classification. arXiv preprint arXiv:1502.01852.

Hebb, D. O. (1949). The Organization of Behavior. Wiley, New York.

Henaff, M., Jarrett, K., Kavukcuoglu, K., and LeCun, Y. (2011). Unsupervised learning of sparse features for scalable audio classification. In ISMIR'11.

Henderson, J. (2003). Inducing history representations for broad coverage statistical parsing. In HL1-NAACL, pages 103–110.

Henderson, J. (2004). Discriminative training of a neural network statistical parser. In Proceedings of the 42nd Annual Meeting on Association for Computational Linguistics, page 95.

Henniges, M., Puertas, G., Bornschein, J., Eggert, J., and Lücke, J. (2010). Binary sparse coding. In Latent Variable Analysis and Signal Separation, pages 450–457. Springer.

Herault, J. and Ans, B. (1984). Circuits neuronaux à synapses modifiables: Décodage de messages composites par apprentissage non supervisé. Comptes Rendus de l'Académie des Sciences, 299(III-13), 525–528.

Hinton, G. (2012). Neural networks for machine learning. Coursera, video lectures.

Hinton, G., Deng, L., Dahl, G. E., Mohamed, A., Jaitly, N., Senior, A., Vanhoucke, V., Nguyen, P., Sainath, T., and Kingsbury, B. (2012a). Deep neural networks for acoustic modeling in speech recognition. IEEE Signal Processing Magazine, 29(6), 82–97.

Hinton, G., Vinyals, O., and Dean, J. (2015). Distilling the knowledge in a neural network. arXiv preprint arXiv:1503.02531.

Hinton, G. E. (1989). Connectionist learning procedures. Artificial Intelligence, 40, 185-234.

Hinton, G. E. (1990). Mapping part-whole hierarchies into connectionist networks. Artificial Intelligence, 46(1), 47–75.

Hinton, G. E. (1999). Products of experts. In ICANN'1999.

Hinton, G. E. (2000). Training products of experts by minimizing contrastive divergence. Technical Report GCNU TR 2000-004, Gatsby Unit, University College London.

Hinton, G. E. (2006). To recognize shapes, first learn to generate images. Technical Report UTML TR 2006-003, University of Toronto.

Hinton, G. E. (2007a). How to do backpropagation in a brain. Invited talk at the NIPS'2007 Deep Learning Workshop.

Hinton, G. E. (2007b). Learning multiple layers of representation. Trends in cognitive sciences, 11(10), 428–434.

Hinton, G. E. (2010). A practical guide to training restricted Boltzmann machines. Technical Report UTML TR 2010-003, Department of Computer Science, University of Toronto.

Hinton, G. E. and Ghahramani, Z. (1997). Generative models for discovering sparse distributed representations. Philosophical Transactions of the Royal Society of London.

Hinton, G. E. and McClelland, J. L. (1988). Learning representations by recirculation. In NIPS'1987, pages 358–366.

Hinton, G. E. and Roweis, S. (2003). Stochastic neighbor embedding. In NIPS'2002.

Hinton, G. E. and Salakhutdinov, R. (2006). Reducing the dimensionality of data with neural networks. Science, 313(5786), 504–507.

Hinton, G. E. and Sejnowski, T. J. (1986). Learning and relearning in Boltzmann machines. In D. E. Rumelhart and J. L. McClelland, editors, Parallel Distributed Processing, volume 1, chapter 7, pages 282–317. MIT Press, Cambridge.

Hinton, G. E. and Sejnowski, T. J. (1999). Unsupervised learning: foundations of neural computation. MIT press.

Hinton, G. E. and Shallice, T. (1991). Lesioning an attractor network: investigations of acquired dyslexia. Psychological review, 98(1), 74.

Hinton, G. E. and Zemel, R. S. (1994). Autoencoders, minimum description length, and Helmholtz free energy. In NIPS'1993.

Hinton, G. E., Sejnowski, T. J., and Ackley, D. H. (1984). Boltzmann machines: Constraint satisfaction networks that learn. Technical Report TR-CMU-CS-84-119, Carnegie-Mellon University, Dept. of Computer Science.

Hinton, G. E., McClelland, J., and Rumelhart, D. (1986). Distributed representations. In D. E. Rumelhart and J. L. McClelland, editors, Parallel Distributed Processing: Explorations in the Microstructure of Cognition, volume 1, pages 77–109. MIT Press, Cambridge.

Hinton, G. E., Revow, M., and Dayan, P. (1995a). Recognizing handwritten digits using mixtures of linear models. In G. Tesauro, D. Touretzky, and T. Leen, editors, Advances in Neural Information Processing Systems 7 (NIPS'94), pages 1015–1022. MIT Press, Cambridge, MA.

Hinton, G. E., Dayan, P., Frey, B. J., and Neal, R. M. (1995b). The wake-sleep algorithm for unsupervised neural networks. Science, 268, 1558–1161.

Hinton, G. E., Dayan, P., and Revow, M. (1997). Modelling the manifolds of images of handwritten digits. IEEE Transactions on Neural Networks, 8, 65–74.

Hinton, G. E., Welling, M., Teh, Y. W., and Osindero, S. (2001). A new view of ICA. In Proceedings of 3rd International Conference on Independent Component Analysis and Blind Signal Separation (ICA'01), pages 746–751, San Diego, CA.

Hinton, G. E., Osindero, S., and Teh, Y. (2006). A fast learning algorithm for deep belief nets. Neural Computation, 18, 1527–1554.

Hinton, G. E., Deng, L., Yu, D., Dahl, G. E., Mohamed, A., Jaitly, N., Senior, A., Vanhoucke, V., Guyen, P., Sainath, T. N., and Kingsbury, B. (2012b). Deep neural networks for acoustic modeling in speech recognition: The shared views of four research groups. IEEE Signal Process. Mag., 29(6), 82–97.

Hinton, G. E., Srivastava, N., Krizhevsky, A., Sutskever, I., and Salakhutdinov, R. (2012c). Improving neural networks by preventing co-adaptation of feature detectors. Technical report, arXiv:1207.0580.

Hinton, G. E., Vinyals, O., and Dean, J. (2014). Dark knowledge. Invited talk at the BayLearn Bay Area Machine Learning Symposium.

Hochreiter, S. (1991). Untersuchungen zu dynamischen neuronalen Netzen. Diploma thesis, T.U. München.

Hochreiter, S. and Schmidhuber, J. (1995). Simplifying neural nets by discovering flat minima. In Advances in Neural Information Processing Systems 7, pages 529–536. MIT Press.

Hochreiter, S. and Schmidhuber, J. (1997). Long short-term memory. Neural Computation, 9(8), 1735–1780.

Hochreiter, S., Bengio, Y., and Frasconi, P. (2001). Gradient flow in recurrent nets: the difficulty of learning long-term dependencies. In J. Kolen and S. Kremer, editors, Field Guide to Dynamical Recurrent Networks. IEEE Press.

Holi, J. L. and Hwang, J.-N. (1993). Finite precision error analysis of neural network hardware implementations. Computers, IEEE Transactions on, 42(3), 281–290.

Holt, J. L. and Baker, T. E. (1991). Back propagation simulations using limited precision calculations. In Neural Networks, 1991., IJCNN-91-Seattle International Joint Conference on, volume 2, pages 121–126. IEEE.

Hornik, K., Stinchcombe, M., and White, H. (1989). Multilayer feedforward networks are universal approximators. Neural Networks, 2, 359–366.

Hornik, K., Stinchcombe, M., and White, H. (1990). Universal approximation of an unknown mapping and its derivatives using multilayer feedforward networks. Neural networks, 3(5), 551-560.

Hsu, F.-H. (2002). Behind Deep Blue: Building the Computer That Defeated the World Chess Champion. Princeton University Press, Princeton, NJ, USA.

Huang, F. and Ogata, Y. (2002). Generalized pseudo-likelihood estimates for Markov random fields on lattice. Annals of the Institute of Statistical Mathematics, 54(1), 1–18.

Huang, P.-S., He, X., Gao, J., Deng, L., Acero, A., and Heck, L. (2013). Learning deep structured semantic models for web search using clickthrough data. In Proceedings of the 22nd ACM international conference on Conference on information & knowledge management, pages 2333-2338. ACM.

Hubel, D. and Wiesel, T. (1968). Receptive fields and functional architecture of monkey striate cortex. Journal of Physiology (London), 195, 215–243.

Hubel, D. H. and Wiesel, T. N. (1959). Receptive fields of single neurons in the cat's striate cortex. Journal of Physiology, 148, 574–591.

Hubel, D. H. and Wiesel, T. N. (1962). Receptive fields, binocular interaction, and functional architecture in the cat's visual cortex. Journal of Physiology (London), 160, 106–154.

Huszar, F. (2015). How (not) to train your generative model: schedule sampling, likelihood, adversary? arXiv:1511.05101.

Hutter, F., Hoos, H., and Leyton-Brown, K. (2011). Sequential model-based optimization for general algorithm configuration. In LION-5. Extended version as UBC Tech report TR-2010-10.

Hyotyniemi, H. (1996). Turing machines are recurrent neural networks. In $STeP'96$ , pages 13-24.

Hyvärinen, A. (1999). Survey on independent component analysis. Neural Computing Surveys, 2, 94–128.

Hyvärinen. A. (2005). Estimation of non-normalized statistical models using score matching. Journal of Machine Learning Research, 6, 695–709.

Hyvärinen, A. (2007a). Connections between score matching, contrastive divergence, and pseudolikelihood for continuous-valued variables. IEEE Transactions on Neural Networks, 18, 1529–1531.

Hyvärinen, A. (2007b). Some extensions of score matching. Computational Statistics and Data Analysis, 51, 2499–2512.

Hyvärinen, A. and Hoyer, P. O. (1999). Emergence of topography and complex cell properties from natural images using extensions of ica. In NIPS, pages 827–833.

Hyvärinen, A. and Pajunen, P. (1999). Nonlinear independent component analysis: Existence and uniqueness results. Neural Networks, 12(3), 429–439.

Hyvärinen, A., Karhunen, J., and Oja, E. (2001a). Independent Component Analysis. Wiley-Interscience.

Hyvärinen, A., Hoyer, P. O., and Inki, M. O. (2001b). Topographic independent component analysis. Neural Computation, 13(7), 1527–1558.

Hyvärinen, A., Hurri, J., and Hoyer, P. O. (2009). Natural Image Statistics: A probabilistic approach to early computational vision. Springer-Verlag.

Iba, Y. (2001). Extended ensemble Monte Carlo. International Journal of Modern Physics, C12, 623–656.

Inayoshi, H. and Kurita, T. (2005). Improved generalization by adding both auto-association and hidden-layer noise to neural-network-based-classifiers. IEEE Workshop on Machine Learning for Signal Processing, pages 141–146.

Ioffe, S. and Szegedy, C. (2015). Batch normalization: Accelerating deep network training by reducing internal covariate shift.

Jacobs, R. A. (1988). Increased rates of convergence through learning rate adaptation. Neural networks, 1(4), 295–307.

Jacobs, R. A., Jordan, M. I., Nowlan, S. J., and Hinton, G. E. (1991). Adaptive mixtures of local experts. Neural Computation, 3, 79–87.

Jaeger, H. (2003). Adaptive nonlinear system identification with echo state networks. In Advances in Neural Information Processing Systems 15.

Jaeger, H. (2007a). Discovering multiscale dynamical features with hierarchical echo state networks. Technical report, Jacobs University.

Jaeger, H. (2007b). Echo state network. \*Scholarpedia\*, 2(9), 2330.

Jaeger, H. (2012). Long short-term memory in echo state networks: Details of a simulation study. Technical report, Technical report, Jacobs University Bremen.

Jaeger, H. and Haas, H. (2004). Harnessing nonlinearity: Predicting chaotic systems and saving energy in wireless communication. Science, 304(5667), 78–80.

Jaeger, H., Lukosevicius, M., Popovici, D., and Siewert, U. (2007). Optimization and applications of echo state networks with leaky-integrator neurons. Neural Networks, 20(3), 335–352.

Jain, V., Murray, J. F., Roth, F., Turaga, S., Zhigulin, V., Briggman, K. L., Helmstaedter, M. N., Denk, W., and Seung, H. S. (2007). Supervised learning of image restoration with convolutional networks. In Computer Vision, 2007. ICCV 2007. IEEE 11th International Conference on, pages 1–8. IEEE.

Jaitly, N. and Hinton, G. (2011). Learning a better representation of speech soundwaves using restricted Boltzmann machines. In Acoustics, Speech and Signal Processing (ICASSP), 2011 IEEE International Conference on, pages 5884–5887. IEEE.

Jaitly, N. and Hinton, G. E. (2013). Vocal tract length perturbation (VTLP) improves speech recognition. In ICML'2013.

Jarrett, K., Kavukcuoglu, K., Ranzato, M., and LeCun, Y. (2009). What is the best multi-stage architecture for object recognition? In ICCV'09.

Jarzynski, C. (1997). Nonequilibrium equality for free energy differences. Phys. Rev. Lett., 78, 2690–2693.

Jaynes, E. T. (2003). Probability Theory: The Logic of Science. Cambridge University Press.

Jean, S., Cho, K., Memisevic, R., and Bengio, Y. (2014). On using very large target vocabulary for neural machine translation. arXiv:1412.2007.

Jelinek, F. and Mercer, R. L. (1980). Interpolated estimation of Markov source parameters from sparse data. In E. S. Gelsema and L. N. Kanal, editors, Pattern Recognition in Practice. North-Holland, Amsterdam.

Jia, Y. (2013). Caffe: An open source convolutional architecture for fast feature embedding. http://caffe.berkeleyvision.org/.

Jia, Y., Huang, C., and Darrell, T. (2012). Beyond spatial pyramids: Receptive field learning for pooled image features. In Computer Vision and Pattern Recognition (CVPR), 2012 IEEE Conference on, pages 3370–3377. IEEE.

Jim, K.-C., Giles, C. L., and Horne, B. G. (1996). An analysis of noise in recurrent neural networks: convergence and generalization. IEEE Transactions on Neural Networks, 7(6), 1424–1438.

Jordan, M. I. (1998). Learning in Graphical Models. Kluwer, Dordrecht, Netherlands.

Joulin, A. and Mikolov, T. (2015). Inferring algorithmic patterns with stack-augmented recurrent nets. arXiv preprint arXiv:1503.01007.

Jozefowicz, R., Zaremba, W., and Sutskever, I. (2015). An empirical evaluation of recurrent network architectures. In ICML'2015.

Judd, J. S. (1989). Neural Network Design and the Complexity of Learning. MIT press.

Jutten, C. and Herault, J. (1991). Blind separation of sources, part I: an adaptive algorithm based on neuromimetic architecture. Signal Processing, 24, 1–10.

Kahou, S. E., Pal, C., Bouthillier, X., Froumenty, P., Gülçehre, c., Memisevic, R., Vincent, P., Courville, A., Bengio, Y., Ferrari, R. C., Mirza, M., Jean, S., Carrier, P. L., Dauphin, Y., Boulanger-Lewandowski, N., Aggarwal, A., Zumer, J., Lamblin, P., Raymond, J.-P., Desjardins, G., Pascanu, R., Warde-Farley, D., Torabi, A., Sharma, A., Bengio, E., Côté, M., Konda, K. R., and Wu, Z. (2013). Combining modality specific deep neural networks for emotion recognition in video. In Proceedings of the 15th ACM on International Conference on Multimodal Interaction.

Kalchbrenner, N. and Blunsom, P. (2013). Recurrent continuous translation models. In EMNLP'2013.

Kalchbrenner, N., Danihelka, I., and Graves, A. (2015). Grid long short-term memory. arXiv preprint arXiv:1507.01526.

Kamyshanska, H. and Memisevic, R. (2015). The potential energy of an autoencoder. IEEE Transactions on Pattern Analysis and Machine Intelligence.

Karpathy, A. and Li, F.-F. (2015). Deep visual-semantic alignments for generating image descriptions. In CVPR'2015. arXiv:1412.2306.

Karpathy, A., Toderici, G., Shetty, S., Leung, T., Sukthankar, R., and Fei-Fei, L. (2014). Large-scale video classification with convolutional neural networks. In CVPR.

Karush, W. (1939). Minima of Functions of Several Variables with Inequalities as Side Constraints. Master's thesis, Dept. of Mathematics, Univ. of Chicago.

Katz, S. M. (1987). Estimation of probabilities from sparse data for the language model component of a speech recognizer. IEEE Transactions on Acoustics, Speech, and Signal Processing, ASSP-35(3), 400-401.

Kavukcuoglu, K., Ranzato, M., and LeCun, Y. (2008). Fast inference in sparse coding algorithms with applications to object recognition. Technical report, Computational and Biological Learning Lab, Courant Institute, NYU. Tech Report CBLL-TR-2008-12-01.

Kavukcuoglu, K., Ranzato, M.-A., Fergus, R., and LeCun, Y. (2009). Learning invariant features through topographic filter maps. In CVPR'2009.

Kavukcuoglu, K., Sermanet, P., Boureau, Y.-L., Gregor, K., Mathieu, M., and LeCun, Y. (2010). Learning convolutional feature hierarchies for visual recognition. In NIPS'2010.

Kelley, H. J. (1960). Gradient theory of optimal flight paths. ARS Journal, 30(10), 947–954.

Khan, F., Zhu, X., and Mutlu, B. (2011). How do humans teach: On curriculum learning and teaching dimension. In Advances in Neural Information Processing Systems 24 (NIPS'11), pages 1449–1457.

Kim, S. K., McAfee, L. C., McMahon, P. L., and Olukotun, K. (2009). A highly scalable restricted Boltzmann machine FPGA implementation. In Field Programmable Logic and Applications. 2009. FPL 2009. International Conference on, pages 367-372. IEEE.

Kindermann, R. (1980). Markov Random Fields and Their Applications (Contemporary Mathematics; V. 1). American Mathematical Society.

Kingma, D. and Ba, J. (2014). Adam: A method for stochastic optimization. arXiv preprint arXiv:1412.6980.

Kingma, D. and LeCun, Y. (2010). Regularized estimation of image statistics by score matching. In NIPS'2010.

Kingma, D., Rezende, D., Mohamed, S., and Welling, M. (2014). Semi-supervised learning with deep generative models. In NIPS'2014.

Kingma, D. P. (2013). Fast gradient-based inference with continuous latent variable models in auxiliary form. Technical report, arxiv:1306.0733.

Kingma, D. P. and Welling, M. (2014a). Auto-encoding variational bayes. In Proceedings of the International Conference on Learning Representations (ICLR).

Kingma, D. P. and Welling, M. (2014b). Efficient gradient-based inference through transformations between bayes nets and neural nets. Technical report, arxiv:1402.0480.

Kirkpatrick, S., Jr., C. D. G., and Vecchi, M. P. (1983). Optimization by simulated annealing. Science, 220, 671–680.

Kiros, R., Salakhutdinov, R., and Zemel, R. (2014a). Multimodal neural language models. In ICML'2014.

Kiros, R., Salakhutdinov, R., and Zemel, R. (2014b). Unifying visual-semantic embeddings with multimodal neural language models. arXiv:1411.2539 [cs.LG].

Klementiev, A., Titov, I., and Bhattarai, B. (2012). Inducing crosslingual distributed representations of words. In Proceedings of COLING 2012.

Knowles-Barley, S., Jones, T. R., Morgan, J., Lee, D., Kasthuri, N., Lichtman, J. W., and Pfister, H. (2014). Deep learning for the connectome. GPU Technology Conference.

Koller, D. and Friedman, N. (2009). Probabilistic Graphical Models: Principles and Techniques. MIT Press.

Konig, Y., Bourlard, H., and Morgan, N. (1996). REMAP: Recursive estimation and maximization of a posteriori probabilities application to transition-based connectionist speech recognition. In D. Touretzky, M. Mozer, and M. Hasselmo, editors, Advances in Neural Information Processing Systems 8 (NIPS'95). MIT Press, Cambridge, MA.

Koren, Y. (2009). The BellKor solution to the Netflix grand prize.

Kotzias, D., Denil, M., de Freitas, N., and Smyth, P. (2015). From group to individual labels using deep features. In ACM SIGKDD.

Koutnik, J., Greff, K., Gomez, F., and Schmidhuber, J. (2014). A clockwork RNN. In ICML'2014.

Kočiský, T., Hermann, K. M., and Blunsom, P. (2014). Learning Bilingual Word Representations by Marginalizing Alignments. In Proceedings of ACL.

Krause, O., Fischer, A., Glasmachers, T., and Igel, C. (2013). Approximation properties of DBNs with binary hidden units and real-valued visible units. In ICML'2013.

Krizhevsky, A. (2010). Convolutional deep belief networks on CIFAR-10. Technical report. University of Toronto. Unpublished Manuscript: http://www.cs.utoronto.ca kriz conv-cifar10-aug2010.pdf.

Krizhevsky, A. and Hinton, G. (2009). Learning multiple layers of features from tiny images. Technical report, University of Toronto.

Krizhevsky, A. and Hinton, G. E. (2011). Using very deep autoencoders for content-based image retrieval. In ESANN.

Krizhevsky, A., Sutskever, I., and Hinton, G. (2012). ImageNet classification with deep convolutional neural networks. In NIPS'2012.

Krueger, K. A. and Dayan, P. (2009). Flexible shaping: how learning in small steps helps. Cognition, 110, 380–394.

Kuhn, H. W. and Tucker, A. W. (1951). Nonlinear programming. In Proceedings of the Second Berkeley Symposium on Mathematical Statistics and Probability, pages 481–492, Berkeley, Calif. University of California Press.

Kumar, A., Irsoy, O., Su, J., Bradbury, J., English, R., Pierce, B., Ondruska, P., Iyyer, M., Gulrajani, I., and Socher, R. (2015). Ask me anything: Dynamic memory networks for natural language processing. arXiv:1506.07285.

Kumar, M. P., Packer, B., and Koller, D. (2010). Self-paced learning for latent variable models. In NIPS'2010.

Lang, K. J. and Hinton, G. E. (1988). The development of the time-delay neural network architecture for speech recognition. Technical Report CMU-CS-88-152, Carnegie-Mellon University.

Lang, K. J., Waibel, A. H., and Hinton, G. E. (1990). A time-delay neural network architecture for isolated word recognition. Neural networks, 3(1), 23–43.

Langford, J. and Zhang, T. (2008). The epoch-greedy algorithm for contextual multi-armed bandits. In NIPS'2008, pages 1096—1103.

Lappalainen, H., Giannakopoulos, X., Honkela, A., and Karhunen, J. (2000). Nonlinear independent component analysis using ensemble learning: Experiments and discussion. In Proc. ICA. Citeseer.

Larochelle, H. and Bengio, Y. (2008). Classification using discriminative restricted Boltzmann machines. In ICML'2008.

Larochelle, H. and Hinton, G. E. (2010). Learning to combine foveal glimpses with a third-order Boltzmann machine. In Advances in Neural Information Processing Systems 23, pages 1243–1251.

Larochelle, H. and Murray, I. (2011). The Neural Autoregressive Distribution Estimator. In AISTATS'2011.

Larochelle, H., Erhan, D., and Bengio, Y. (2008). Zero-data learning of new tasks. In AAAI Conference on Artificial Intelligence.

Larochelle, H., Bengio, Y., Louradour, J., and Lamblin, P. (2009). Exploring strategies for training deep neural networks. Journal of Machine Learning Research, 10, 1–40.

Lasserre, J. A., Bishop, C. M., and Minka, T. P. (2006). Principled hybrids of generative and discriminative models. In Proceedings of the Computer Vision and Pattern Recognition Conference (CVPR'06), pages 87–94, Washington, DC, USA. IEEE Computer Society.

Le, Q., Ngiam, J., Chen, Z., hao Chia, D. J., Koh, P. W., and Ng, A. (2010). Tiled convolutional neural networks. In J. Lafferty, C. K. I. Williams, J. Shawe-Taylor, R. Zemel, and A. Culotta, editors, Advances in Neural Information Processing Systems 23 (NIPS'10), pages 1279–1287.

Le, Q., Ngiam, J., Coates, A., Lahiri, A., Prochnow, B., and Ng, A. (2011). On optimization methods for deep learning. In Proc. ICML'2011. ACM.

Le, Q., Ranzato, M., Monga, R., Devin, M., Corrado, G., Chen, K., Dean, J., and Ng. A. (2012). Building high-level features using large scale unsupervised learning. In ICML'2012.

Le Roux, N. and Bengio, Y. (2008). Representational power of restricted Boltzmann machines and deep belief networks. Neural Computation, 20(6), 1631–1649.

Le Roux, N. and Bengio, Y. (2010). Deep belief networks are compact universal approximators. Neural Computation, 22(8), 2192-2207.

LeCun, Y. (1985). Une procédure d'apprentissage pour Réseau à seuil assymétrique. In Cognitiva 85: A la Frontière de l'Intelligence Artificielle, des Sciences de la Connaissance et des Neurosciences, pages 599–604, Paris 1985. CESTA, Paris.

LeCun, Y. (1986). Learning processes in an asymmetric threshold network. In F. Fogelman-Soulié, E. Bienenstock, and G. Weisbuch, editors, Disordered Systems and Biological Organization, pages 233–240. Springer-Verlag, Les Houches, France.

LeCun, Y. (1987). Modèles connexionistes de l'apprentissage. Ph.D. thesis, Université de Paris VI.

LeCun, Y. (1989). Generalization and network design strategies. Technical Report CRG-TR-89-4, University of Toronto.

LeCun, Y., Jackel, L. D., Boser, B., Denker, J. S., Graf, H. P., Guyon, I., Henderson, D., Howard, R. E., and Hubbard, W. (1989). Handwritten digit recognition: Applications of neural network chips and automatic learning. IEEE Communications Magazine, 27(11), 41–46.

LeCun, Y., Bottou, L., Orr, G. B., and Müller, K.-R. (1998a). Efficient backprop. In Neural Networks, Tricks of the Trade, Lecture Notes in Computer Science LNCS 1524. Springer Verlag.

LeCun, Y., Bottou, L., Bengio, Y., and Haffner, P. (1998b). Gradient based learning applied to document recognition. Proc. IEEE.

LeCun, Y., Kavukcuoglu, K., and Farabet, C. (2010). Convolutional networks and applications in vision. In Circuits and Systems (ISCAS), Proceedings of 2010 IEEE International Symposium on, pages 253–256. IEEE.

L'Ecuyer, P. (1994). Efficiency improvement and variance reduction. In Proceedings of the 1994 Winter Simulation Conference, pages 122–132.

Lee, C.-Y., Xie, S., Gallagher, P., Zhang, Z., and Tu, Z. (2014). Deeply-supervised nets. arXiv preprint arXiv:1409.5185.

Lee, H., Battle, A., Raina, R., and Ng, A. (2007). Efficient sparse coding algorithms. In B. Schölkopf, J. Platt, and T. Hoffman, editors, Advances in Neural Information Processing Systems 19 (NIPS'06), pages 801–808. MIT Press.

Lee, H., Ekanadham, C., and Ng, A. (2008). Sparse deep belief net model for visual area V2. In NIPS'07.

Lee, H., Grosse, R., Ranganath, R., and Ng, A. Y. (2009). Convolutional deep belief networks for scalable unsupervised learning of hierarchical representations. In L. Bottou and M. Littman, editors. Proceedings of the Twenty-sixth International Conference on Machine Learning (ICML'09). ACM, Montreal, Canada.

Lee, Y. J. and Grauman, K. (2011). Learning the easy things first: self-paced visual category discovery. In CVPR'2011.

Leibniz, G. W. (1676). Memoir using the chain rule. (Cited in TMME 7:2&3 p 321–332, 2010).

Lenat, D. B. and Guha, R. V. (1989). Building large knowledge-based systems; representation and inference in the Cyc project. Addison-Wesley Longman Publishing Co., Inc.

Leshno, M., Lin, V. Y., Pinkus, A., and Schocken, S. (1993). Multilayer feedforward networks with a nonpolynomial activation function can approximate any function. Neural Networks. 6, 861–867.

Levenberg, K. (1944). A method for the solution of certain non-linear problems in least squares. Quarterly Journal of Applied Mathematics, II(2), 164–168.

L'Hôpital, G. F. A. (1696). Analyse des infiniment petits, pour l'intelligence des lignes courbes. Paris: L'Imprimerie Royale.

Li, Y., Swersky, K., and Zemel, R. S. (2015). Generative moment matching networks. CoRR, abs/1502.02761.

Lin. T., Horne, B. G., Tino, P., and Giles, C. L. (1996). Learning long-term dependencies is not as difficult with NARX recurrent neural networks. IEEE Transactions on Neural Networks, 7(6), 1329–1338.

Lin, Y., Liu, Z., Sun, M., Liu, Y., and Zhu, X. (2015). Learning entity and relation embeddings for knowledge graph completion. In Proc. AAAI'15.

Linde. N. (1992). The machine that changed the world, episode 3. Documentary miniseries.

Lindsey, C. and Lindblad, T. (1994). Review of hardware neural networks: a user's perspective. In Proc. Third Workshop on Neural Networks: From Biology to High Energy Physics, pages 195–202, Isola d'Elba, Italy.

Linnainmaa, S. (1976). Taylor expansion of the accumulated rounding error. BIT Numerical Mathematics, 16(2), 146-160.

LISA (2008). Deep learning tutorials: Restricted Boltzmann machines. Technical report, LISA Lab, Université de Montréal.

Long, P. M. and Servedio, R. A. (2010). Restricted Boltzmann machines are hard to approximately evaluate or simulate. In Proceedings of the 27th International Conference on Machine Learning (ICML'10).

Lotter, W., Kreiman, G., and Cox, D. (2015). Unsupervised learning of visual structure using predictive generative networks. arXiv preprint arXiv:1511.06380.

Lovelace, A. (1842). Notes upon L. F. Menabrea's "Sketch of the Analytical Engine invented by Charles Babbage".

Lu, L., Zhang, X., Cho, K., and Renals, S. (2015). A study of the recurrent neural network encoder-decoder for large vocabulary speech recognition. In Proc. Interspeech.

Lu, T., Pál, D., and Pál, M. (2010). Contextual multi-armed bandits. In International Conference on Artificial Intelligence and Statistics, pages 485–492.

Luenberger, D. G. (1984). Linear and Nonlinear Programming. Addison Wesley.

Lukoševičius, M. and Jaeger, H. (2009). Reservoir computing approaches to recurrent neural network training. Computer Science Review, 3(3), 127–149.

Luo, H., Shen, R., Niu, C., and Ullrich, C. (2011). Learning class-relevant features and class-irrelevant features via a hybrid third-order RBM. In International Conference on Artificial Intelligence and Statistics, pages 470–478.

Luo, H., Carrier, P. L., Courville, A., and Bengio, Y. (2013). Texture modeling with convolutional spike-and-slab RBMs and deep extensions. In AISTATS'2013.

Lyu, S. (2009). Interpretation and generalization of score matching. In Proceedings of the Twenty-fifth Conference in Uncertainty in Artificial Intelligence (UAI'09).

Ma, J., Sheridan, R. P., Liaw, A., Dahl, G. E., and Svetnik, V. (2015). Deep neural nets as a method for quantitative structure activity relationships. J. Chemical information and modeling.

Maas, A. L., Hannun, A. Y., and Ng, A. Y. (2013). Rectifier nonlinearities improve neural network acoustic models. In ICML Workshop on Deep Learning for Audio. Speech. and Language Processing.

Maass, W. (1992). Bounds for the computational power and learning complexity of analog neural nets (extended abstract). In Proc. of the 25th ACM Symp. Theory of Computing, pages 335–344.

Maass, W., Schnitger, G., and Sontag, E. D. (1994). A comparison of the computational power of sigmoid and Boolean threshold circuits. Theoretical Advances in Neural Computation and Learning, pages 127–151.

Maass, W., Natschlaeger, T., and Markram, H. (2002). Real-time computing without stable states: A new framework for neural computation based on perturbations. Neural Computation, 14(11), 2531–2560.

MacKay, D. (2003). Information Theory, Inference and Learning Algorithms. Cambridge University Press.

Maclaurin, D., Duvenaud, D., and Adams, R. P. (2015). Gradient-based hyperparameter optimization through reversible learning. arXiv preprint arXiv:1502.03492.

Mao, J., Xu, W., Yang, Y., Wang, J., Huang, Z., and Yuille, A. L. (2015). Deep captioning with multimodal recurrent neural networks. In ICLR'2015. arXiv:1410.1090.

Marcotte, P. and Savard, G. (1992). Novel approaches to the discrimination problem. Zeitschrift für Operations Research (Theory), 36, 517–545.

Marlin, B. and de Freitas, N. (2011). Asymptotic efficiency of deterministic estimators for discrete energy-based models: Ratio matching and pseudolikelihood. In UAI'2011.

Marlin, B., Swersky, K., Chen, B., and de Freitas, N. (2010). Inductive principles for restricted Boltzmann machine learning. In Proceedings of The Thirteenth International Conference on Artificial Intelligence and Statistics (AISTATS'10), volume 9, pages 509–516.

Marquardt, D. W. (1963). An algorithm for least-squares estimation of non-linear parameters. Journal of the Society of Industrial and Applied Mathematics, 11(2), 431–441.

Marr, D. and Poggio, T. (1976). Cooperative computation of stereo disparity. Science, 194.

Martens, J. (2010). Deep learning via Hessian-free optimization. In L. Bottou and M. Littman, editors, Proceedings of the Twenty-seventh International Conference on Machine Learning (ICML-10), pages 735-742. ACM.

Martens, J. and Medabalimi, V. (2014). On the expressive efficiency of sum product networks. arXiv:1411.7717.

Martens, J. and Sutskever, I. (2011). Learning recurrent neural networks with Hessian-free optimization. In Proc. ICML'2011. ACM.

Mase, S. (1995). Consistency of the maximum pseudo-likelihood estimator of continuous state space Gibbsian processes. The Annals of Applied Probability, 5(3), pp. 603–612.

McClelland, J., Rumelhart, D., and Hinton, G. (1995). The appeal of parallel distributed processing. In Computation & intelligence, pages 305–341. American Association for Artificial Intelligence.

McCulloch, W. S. and Pitts, W. (1943). A logical calculus of ideas immanent in nervous activity. Bulletin of Mathematical Biophysics, 5, 115–133.

Mead, C. and Ismail, M. (2012). Analog VLSI implementation of neural systems, volume 80. Springer Science & Business Media.

Melchior, J., Fischer, A., and Wiskott, L. (2013). How to center binary deep Boltzmann machines. arXiv preprint arXiv:1311.1354.

Memisevic, R. and Hinton, G. E. (2007). Unsupervised learning of image transformations. In Proceedings of the Computer Vision and Pattern Recognition Conference (CVPR'07).

Memisevic, R. and Hinton, G. E. (2010). Learning to represent spatial transformations with factored higher-order Boltzmann machines. Neural Computation, 22(6), 1473–1492.

Mesnil, G., Dauphin, Y., Glorot, X., Rifai, S., Bengio, Y., Goodfellow, I., Lavoie, E., Muller, X., Desjardins, G., Warde-Farley, D., Vincent, P., Courville, A., and Bergstra, J. (2011). Unsupervised and transfer learning challenge: a deep learning approach. In JMLR W&CP: Proc. Unsupervised and Transfer Learning, volume 7.

Mesnil, G., Rifai, S., Dauphin, Y., Bengio, Y., and Vincent, P. (2012). Surfing on the manifold. Learning Workshop, Snowbird.

Miikkulainen, R. and Dyer, M. G. (1991). Natural language processing with modular PDP networks and distributed lexicon. Cognitive Science, 15, 343–399.

Mikolov, T. (2012). Statistical Language Models based on Neural Networks. Ph.D. thesis, Brno University of Technology.

Mikolov, T., Deoras, A., Kombrink, S., Burget, L., and Cernocky, J. (2011a). Empirical evaluation and combination of advanced language modeling techniques. In Proc. 12th annual conference of the international speech communication association (INTERSPEECH 2011).

Mikolov, T., Deoras, A., Povey, D., Burget, L., and Cernocky, J. (2011b). Strategies for training large scale neural network language models. In Proc. ASRU'2011.

Mikolov, T., Chen, K., Corrado, G., and Dean, J. (2013a). Efficient estimation of word representations in vector space. In International Conference on Learning Representations: Workshops Track.

Mikolov, T., Le, Q. V., and Sutskever, I. (2013b). Exploiting similarities among languages for machine translation. Technical report, arXiv:1309.4168.

Minka, T. (2005). Divergence measures and message passing. Microsoft Research Cambridge UK Tech Rep MSRTR2005173, 72(TR-2005-173).

Minsky, M. L. and Papert, S. A. (1969). Perceptrons. MIT Press, Cambridge.

Mirza, M. and Osindero, S. (2014). Conditional generative adversarial nets. arXiv preprint arXiv:1411.1784.

Mishkin, D. and Matas, J. (2015). All you need is a good init. arXiv preprint arXiv:1511.06422.

Misra, J. and Saha, I. (2010). Artificial neural networks in hardware: A survey of two decades of progress. Neurocomputing, 74(1), 239–255.

Mitchell, T. M. (1997). Machine Learning. McGraw-Hill, New York.

Miyato, T., Maeda, S., Koyama, M., Nakae, K., and Ishii, S. (2015). Distributional smoothing with virtual adversarial training. In ICLR. Preprint: arXiv:1507.00677.

Mnih, A. and Gregor, K. (2014). Neural variational inference and learning in belief networks. In ICML'2014.

Mnih, A. and Hinton, G. E. (2007). Three new graphical models for statistical language modelling. In Z. Ghahramani, editor, Proceedings of the Twenty-fourth International Conference on Machine Learning (ICML'07), pages 641-648. ACM.

Mnih, A. and Hinton, G. E. (2009). A scalable hierarchical distributed language model. In D. Koller, D. Schuurmans, Y. Bengio, and L. Bottou, editors, Advances in Neural Information Processing Systems 21 (NIPS'08), pages 1081–1088.

Mnih, A. and Kavukcuoglu, K. (2013). Learning word embeddings efficiently with noise-contrastive estimation. In C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Weinberger, editors. Advances in Neural Information Processing Systems 26, pages 2265–2273. Curran Associates, Inc.

Mnih, A. and Teh, Y. W. (2012). A fast and simple algorithm for training neural probabilistic language models. In ICML'2012, pages 1751–1758.

Mnih, V. and Hinton, G. (2010). Learning to detect roads in high-resolution aerial images. In Proceedings of the 11th European Conference on Computer Vision (ECCV).

Mnih, V., Larochelle, H., and Hinton, G. (2011). Conditional restricted Boltzmann machines for structure output prediction. In Proc. Conf. on Uncertainty in Artificial Intelligence (UAI).

Mnih, V., Kavukcuoglo, K., Silver, D., Graves, A., Antonoglou, I., and Wierstra, D. (2013). Playing Atari with deep reinforcement learning. Technical report, arXiv:1312.5602.

Mnih, V., Heess, N., Graves, A., and Kavukcuoglu, K. (2014). Recurrent models of visual attention. In Z. Ghahramani, M. Welling, C. Cortes, N. Lawrence, and K. Weinberger, editors, NIPS'2014, pages 2204–2212.

Mnih, V.. Kavukcuoglo, K., Silver, D., Rusu, A. A., Veness, J., Bellemare, M. G., Graves, A.. Riedmiller, M., Fidgeland, A. K., Ostrovski, G., Petersen, S., Beattie, C., Sadik, A., Antonoglou, I.. King, H.. Kumaran, D., Wierstra, D., Legg, S., and Hassabis, D. (2015). Human-level control through deep reinforcement learning. Nature, 518, 529–533.

Mobahi, H. and Fisher, III, J. W. (2015). A theoretical analysis of optimization by Gaussian continuation. In AAAI'2015.

Mobahi, H., Collobert, R., and Weston, J. (2009). Deep learning from temporal coherence in video. In L. Bottou and M. Littman, editors, Proceedings of the 26th International Conference on Machine Learning, pages 737–744, Montreal. Omnipress.

Mohamed, A., Dahl, G., and Hinton, G. (2009). Deep belief networks for phone recognition.

Mohamed, A., Sainath, T. N., Dahl, G., Ramabhadran, B., Hinton, G. E., and Picheny, M. A. (2011). Deep belief networks using discriminative features for phone recognition. In Acoustics, Speech and Signal Processing (ICASSP), 2011 IEEE International Conference on, pages 5060–5063. IEEE.

Mohamed, A., Dahl, G., and Hinton, G. (2012a). Acoustic modeling using deep belief networks. IEEE Trans. on Audio, Speech and Language Processing, 20(1), 14–22.

Mohamed, A., Hinton, G., and Penn, G. (2012b). Understanding how deep belief networks perform acoustic modelling. In Acoustics, Speech and Signal Processing (ICASSP), 2012 IEEE International Conference on, pages 4273–4276. IEEE.

Moller, M. F. (1993). A scaled conjugate gradient algorithm for fast supervised learning. Neural Networks, 6, 525–533.

Montavon, G. and Muller, K.-R. (2012). Deep Boltzmann machines and the centering trick. In G. Montavon, G. Orr, and K.-R. Müller, editors, Neural Networks: Tricks of the Trade, volume 7700 of Lecture Notes in Computer Science, pages 621–637. Preprint: http://arxiv.org/abs/1203.3783.

Montúfar, G. (2014). Universal approximation depth and errors of narrow belief networks with discrete units. Neural Computation, 26.

Montúfar, G. and Ay, N. (2011). Refinements of universal approximation results for deep belief networks and restricted Boltzmann machines. Neural Computation, 23(5), 1306–1319.

Montufar, G. F., Pascanu, R., Cho, K., and Bengio, Y. (2014). On the number of linear regions of deep neural networks. In NIPS'2014.

Mor-Yosef, S., Samueloff, A., Modan, B., Navot, D., and Schenker, J. G. (1990). Ranking the risk factors for cesarean: logistic regression analysis of a nationwide study. Obstet Gynecol, 75(6), 944–7.

Morin, F. and Bengio, Y. (2005). Hierarchical probabilistic neural network language model. In AISTATS'2005.

Mozer, M. C. (1992). The induction of multiscale temporal structure. In J. M. S. Hanson and R. Lippmann, editors, Advances in Neural Information Processing Systems 4 (NIPS'91), pages 275–282, San Mateo, CA. Morgan Kaufmann.

Murphy, K. P. (2012). Machine Learning: a Probabilistic Perspective. MIT Press, Cambridge, MA, USA.

Murray, B. U. I. and Larochelle, H. (2014). A deep and tractable density estimator. In ICML'2014.

Nair, V. and Hinton, G. (2010). Rectified linear units improve restricted Boltzmann machines. In ICML'2010.

Nair, V. and Hinton, G. E. (2009). 3d object recognition with deep belief nets. In Y. Bengio, D. Schuurmans, J. D. Lafferty, C. K. I. Williams, and A. Culotta, editors, Advances in Neural Information Processing Systems 22, pages 1339–1347. Curran Associates, Inc.

Narayanan, H. and Mitter, S. (2010). Sample complexity of testing the manifold hypothesis. In NIPS'2010.

Naumann, U. (2008). Optimal Jacobian accumulation is NP-complete. Mathematical Programming, 112(2), 427-441.

Navigli, R. and Velardi, P. (2005). Structural semantic interconnections: a knowledge-based approach to word sense disambiguation. IEEE Trans. Pattern Analysis and Machine Intelligence, 27(7), 1075—1086.

Neal, R. and Hinton, G. (1999). A view of the EM algorithm that justifies incremental, sparse, and other variants. In M. I. Jordan, editor, Learning in Graphical Models. MIT Press, Cambridge, MA.

Neal, R. M. (1990). Learning stochastic feedforward networks. Technical report.

Neal, R. M. (1993). Probabilistic inference using Markov chain Monte-Carlo methods. Technical Report CRG-TR-93-1, Dept. of Computer Science, University of Toronto.

Neal, R. M. (1994). Sampling from multimodal distributions using tempered transitions. Technical Report 9421, Dept. of Statistics, University of Toronto.

Neal, R. M. (1996). Bayesian Learning for Neural-Networks. Lecture Notes in Statistics. Springer.

Neal, R. M. (2001). Annealed importance sampling. Statistics and Computing, 11(2), 125-139.

Neal, R. M. (2005). Estimating ratios of normalizing constants using linked importance sampling.

Nesterov, Y. (1983). A method of solving a convex programming problem with convergence rate $O(1/k^{2})$ . Soviet Mathematics Doklady, 27, 372–376.

Nesterov, Y. (2004). Introductory lectures on convex optimization: a basic course. Applied optimization. Kluwer Academic Publ., Boston, Dordrecht, London.

Netzer, Y., Wang, T., Coates, A., Bissacco, A., Wu, B., and Ng, A. Y. (2011). Reading digits in natural images with unsupervised feature learning. Deep Learning and Unsupervised Feature Learning Workshop, NIPS.

Ney, H. and Kneser, R. (1993). Improved clustering techniques for class-based statistical language modelling. In European Conference on Speech Communication and Technology (Eurospeech), pages 973–976, Berlin.

Ng, A. (2015). Advice for applying machine learning. https://see.stanford.edu/materials/aimlcs229/ML-advice.pdf.

Niesler, T. R., Whittaker, E. W. D., and Woodland, P. C. (1998). Comparison of part-of-speech and automatically derived category-based language models for speech recognition. In International Conference on Acoustics, Speech and Signal Processing (ICASSP), pages 177–180.

Ning, F., Delhomme, D., LeCun, Y., Piano, F., Bottou, L., and Barbano, P. E. (2005). Toward automatic phenotyping of developing embryos from videos. Image Processing, IEEE Transactions on, 14(9), 1360–1371.

Nocedal, J. and Wright, S. (2006). Numerical Optimization. Springer.

Norouzi, M. and Fleet, D. J. (2011). Minimal loss hashing for compact binary codes. In ICML'2011.

Nowlan, S. J. (1990). Competing experts: An experimental investigation of associative mixture models. Technical Report CRG-TR-90-5, University of Toronto.

Nowlan, S. J. and Hinton, G. E. (1992). Simplifying neural networks by soft weight-sharing. Neural Computation, 4(4), 473–493.

Olshausen, B. and Field, D. J. (2005). How close are we to understanding V1? Neural Computation, 17, 1665–1699.

Olshausen, B. A. and Field, D. J. (1996). Emergence of simple-cell receptive field properties by learning a sparse code for natural images. Nature, 381, 607–609.

Olshausen, B. A., Anderson, C. H., and Van Essen, D. C. (1993). A neurobiological model of visual attention and invariant pattern recognition based on dynamic routing of information. J. Neurosci., 13(11), 4700–4719.

Opper, M. and Archambeau, C. (2009). The variational Gaussian approximation revisited. Neural computation, 21(3), 786–792.

Oquab, M., Bottou, L., Laptev, I., and Sivic, J. (2014). Learning and transferring mid-level image representations using convolutional neural networks. In Computer Vision and Pattern Recognition (CVPR), 2014 IEEE Conference on, pages 1717-1724. IEEE.

Osindero, S. and Hinton, G. E. (2008). Modeling image patches with a directed hierarchy of Markov random fields. In J. Platt, D. Koller, Y. Singer, and S. Roweis, editors, Advances in Neural Information Processing Systems 20 (NIPS'07), pages 1121–1128, Cambridge, MA. MIT Press.

Ovid and Martin, C. (2004). Metamorphoses. W.W. Norton.

Paccanaro, A. and Hinton, G. E. (2000). Extracting distributed representations of concepts and relations from positive and negative propositions. In International Joint Conference on Neural Networks (IJCNN), Como, Italy. IEEE, New York.

Paine, T. L., Khorrami, P., Han, W., and Huang, T. S. (2014). An analysis of unsupervised pre-training in light of recent advances. arXiv preprint arXiv:1412.6597.

Palatucci, M., Pomerleau, D., Hinton, G. E., and Mitchell, T. M. (2009). Zero-shot learning with semantic output codes. In Y. Bengio, D. Schuurmans, J. D. Lafferty, C. K. I. Williams, and A. Culotta, editors, Advances in Neural Information Processing Systems 22, pages 1410–1418. Curran Associates, Inc.

Parker, D. B. (1985). Learning-logic. Technical Report TR-47, Center for Comp. Research in Economics and Management Sci., MIT.

Pascanu, R., Mikolov, T., and Bengio, Y. (2013). On the difficulty of training recurrent neural networks. In ICML'2013.

Pascanu, R., Gülçehre, Ç., Cho, K., and Bengio, Y. (2014a). How to construct deep recurrent neural networks. In ICLR'2014.

Pascanu, R., Montufar, G., and Bengio, Y. (2014b). On the number of inference regions of deep feed forward networks with piece-wise linear activations. In ICLR'2014.

Pati, Y., Rezaiifar, R., and Krishnaprasad, P. (1993). Orthogonal matching pursuit: Recursive function approximation with applications to wavelet decomposition. In Proceedings of the 27th Annual Asilomar Conference on Signals, Systems, and Computers, pages 40–44.

Pearl, J. (1985). Bayesian networks: A model of self-activated memory for evidential reasoning. In Proceedings of the 7th Conference of the Cognitive Science Society, University of California, Irvine, pages 329–334.

Pearl, J. (1988). Probabilistic Reasoning in Intelligent Systems: Networks of Plausible Inference. Morgan Kaufmann.

Perron, O. (1907). Zur theorie der matrices. Mathematische Annalen, 64(2), 248-263.

Petersen, K. B. and Pedersen, M. S. (2006). The matrix cookbook. Version 20051003.

Peterson, G. B. (2004). A day of great illumination: B. F. Skinner's discovery of shaping. Journal of the Experimental Analysis of Behavior, 82(3), 317–328.

Pham, D.-T., Garat, P., and Jutten, C. (1992). Separation of a mixture of independent sources through a maximum likelihood approach. In EUSIPCO, pages 771–774.

Pham, P.-H., Jelaca, D., Farabet, C., Martini, B., LeCun, Y., and Culurciello, E. (2012). NeuFlow: dataflow vision processing system-on-a-chip. In Circuits and Systems (MWS-CAS), 2012 IEEE 55th International Midwest Symposium on, pages 1044-1047. IEEE.

Pinheiro, P. H. O. and Collobert, R. (2014). Recurrent convolutional neural networks for scene labeling. In ICML'2014.

Pinheiro, P. H. O. and Collobert, R. (2015). From image-level to pixel-level labeling with convolutional networks. In Conference on Computer Vision and Pattern Recognition (CVPR).

Pinto, N., Cox, D. D., and DiCarlo, J. J. (2008). Why is real-world visual object recognition hard? PLoS Comput Biol, 4.

Pinto, N., Stone, Z., Zickler, T., and Cox, D. (2011). Scaling up biologically-inspired computer vision: A case study in unconstrained face recognition on facebook. In Computer Vision and Pattern Recognition Workshops (CVPRW), 2011 IEEE Computer Society Conference on, pages 35–42. IEEE.

Pollack, J. B. (1990). Recursive distributed representations. Artificial Intelligence, 46(1), 77–105.

Polyak, B. and Juditsky, A. (1992). Acceleration of stochastic approximation by averaging. SIAM J. Control and Optimization, 30(4), 838–855.

Polyak, B. T. (1964). Some methods of speeding up the convergence of iteration methods. USSR Computational Mathematics and Mathematical Physics, 4(5), 1–17.

Poole, B., Sohl-Dickstein, J., and Ganguli, S. (2014). Analyzing noise in autoencoders and deep networks. CoRR, abs/1406.1831.

Poon, H. and Domingos, P. (2011). Sum-product networks: A new deep architecture. In Proceedings of the Twenty-seventh Conference in Uncertainty in Artificial Intelligence (UAI), Barcelona, Spain.

Presley, R. K. and Haggard, R. L. (1994). A fixed point implementation of the backpropagation learning algorithm. In Southeastcon'94. Creative Technology Transfer-A Global Affair., Proceedings of the 1994 IEEE, pages 136–138. IEEE.

Price, R. (1958). A useful theorem for nonlinear devices having Gaussian inputs. IEEE Transactions on Information Theory, 4(2), 69-72.

Quiroga, R. Q., Reddy, L., Kreiman, G., Koch, C., and Fried, I. (2005). Invariant visual representation by single neurons in the human brain. Nature, 435(7045), 1102–1107.

Radford, A., Metz, L., and Chintala, S. (2015). Unsupervised representation learning with deep convolutional generative adversarial networks. arXiv preprint arXiv:1511.06434.

Raiko, T., Yao, L., Cho, K., and Bengio, Y. (2014). Iterative neural autoregressive distribution estimator (NADE-k). Technical report, arXiv:1406.1485.

Raina, R., Madhavan, A., and Ng, A. Y. (2009). Large-scale deep unsupervised learning using graphics processors. In L. Bottou and M. Littman, editors, Proceedings of the Twenty-sixth International Conference on Machine Learning (ICML'09), pages 873–880, New York, NY, USA. ACM.

Ramsey, F. P. (1926). Truth and probability. In R. B. Braithwaite, editor, The Foundations of Mathematics and other Logical Essays, chapter 7, pages 156–198. McMaster University Archive for the History of Economic Thought.

Ranzato, M. and Hinton, G. H. (2010). Modeling pixel means and covariances using factorized third-order Boltzmann machines. In CVPR'2010, pages 2551–2558.

Ranzato, M., Poultney, C., Chopra, S., and LeCun, Y. (2007a). Efficient learning of sparse representations with an energy-based model. In NIPS'2006.

Ranzato, M., Huang, F., Boureau, Y., and LeCun, Y. (2007b). Unsupervised learning of invariant feature hierarchies with applications to object recognition. In Proceedings of the Computer Vision and Pattern Recognition Conference (CVPR'07). IEEE Press.

Ranzato, M., Boureau, Y., and LeCun, Y. (2008). Sparse feature learning for deep belief networks. In NIPS'2007.

Ranzato, M., Krizhevsky, A., and Hinton, G. E. (2010a). Factored 3-way restricted Boltzmann machines for modeling natural images. In Proceedings of AISTATS 2010.

Ranzato, M., Mnih, V., and Hinton, G. (2010b). Generating more realistic images using gated MRFs. In NIPS'2010.

Rao, C. (1945). Information and the accuracy attainable in the estimation of statistical parameters. Bulletin of the Calcutta Mathematical Society, 37, 81–89.

Rasmus, A., Valpola, H., Honkala, M., Berglund, M., and Raiko, T. (2015). Semi-supervised learning with ladder network. arXiv preprint arXiv:1507.02672.

Recht, B., Re, C., Wright, S., and Niu, F. (2011). Hogwild: A lock-free approach to parallelizing stochastic gradient descent. In NIPS'2011.

Reichert, D. P., Seriès, P., and Storkey, A. J. (2011). Neuronal adaptation for sampling-based probabilistic inference in perceptual bistability. In Advances in Neural Information Processing Systems, pages 2357–2365.

Rezende, D. J., Mohamed, S., and Wierstra, D. (2014). Stochastic backpropagation and approximate inference in deep generative models. In ICML'2014. Preprint: arXiv:1401.4082.

Rifai, S., Vincent, P., Muller, X., Glorot, X., and Bengio, Y. (2011a). Contractive auto-encoders: Explicit invariance during feature extraction. In ICML'2011.

Rifai, S., Mesnil, G., Vincent, P., Muller, X., Bengio, Y., Dauphin, Y., and Glorot, X. (2011b). Higher order contractive auto-encoder. In ECML PKDD.

Rifai, S., Dauphin, Y., Vincent, P., Bengio, Y., and Muller, X. (2011c). The manifold tangent classifier. In NIPS'2011.

Rifai, S., Bengio, Y., Dauphin, Y., and Vincent, P. (2012). A generative process for sampling contractive auto-encoders. In ICML'2012.

Ringach, D. and Shapley, R. (2004). Reverse correlation in neurophysiology. Cognitive Science, 28(2), 147–166.

Roberts, S. and Everson, R. (2001). Independent component analysis: principles and practice. Cambridge University Press.

Robinson, A. J. and Fallside, F. (1991). A recurrent error propagation network speech recognition system. Computer Speech and Language, 5(3), 259–274.

Rockafellar, R. T. (1997). Convex analysis. princeton landmarks in mathematics.

Romero, A., Ballas, N., Ebrahimi Kahou, S., Chassang, A., Gatta, C., and Bengio, Y. (2015). Fitnets: Hints for thin deep nets. In ICLR'2015, arXiv:1412.6550.

Rosen, J. B. (1960). The gradient projection method for nonlinear programming. part i. linear constraints. Journal of the Society for Industrial and Applied Mathematics, 8(1), pp. 181–217.

Rosenblatt, F. (1958). The perceptron: A probabilistic model for information storage and organization in the brain. Psychological Review, 65, 386–408.

Rosenblatt, F. (1962). Principles of Neurodynamics. Spartan, New York.

Roweis, S. and Saul, L. K. (2000). Nonlinear dimensionality reduction by locally linear embedding. Science, 290(5500).

Roweis, S., Saul, L., and Hinton, G. (2002). Global coordination of local linear models. In T. Dietterich, S. Becker, and Z. Ghahramani, editors, Advances in Neural Information Processing Systems 14 (NIPS'01), Cambridge, MA. MIT Press.

Rubin, D. B. et al. (1984). Bayesianly justifiable and relevant frequency calculations for the applied statistician. The Annals of Statistics, 12(4), 1151–1172.

Rumelhart, D., Hinton, G., and Williams, R. (1986a). Learning representations by back-propagating errors. Nature, 323, 533–536.

Rumelhart, D. E., Hinton, G. E., and Williams, R. J. (1986b). Learning internal representations by error propagation. In D. E. Rumelhart and J. L. McClelland, editors, Parallel Distributed Processing, volume 1, chapter 8, pages 318-362. MIT Press, Cambridge.

Rumelhart, D. E., McClelland, J. L., and the PDP Research Group (1986c). Parallel Distributed Processing: Explorations in the Microstructure of Cognition. MIT Press, Cambridge.

Russakovsky, O., Deng, J., Su, H., Krause, J., Satheesh, S., Ma, S., Huang, Z., Karpathy, A., Khosla, A., Bernstein, M., Berg, A. C., and Fei-Fei, L. (2014a). ImageNet Large Scale Visual Recognition Challenge.

Russakovsky, O., Deng, J., Su, H., Krause, J., Satheesh, S., Ma, S., Huang, Z., Karpathy, A., Khosla, A., Bernstein, M., et al. (2014b). Imagenet large scale visual recognition challenge. arXiv preprint arXiv:1409.0575.

Russel, S. J. and Norvig, P. (2003). Artificial Intelligence: a Modern Approach. Prentice Hall.

Rust, N., Schwartz, O., Movshon, J. A., and Simoncelli, E. (2005). Spatiotemporal elements of macaque V1 receptive fields. Neuron, 46(6), 945–956.

Sainath, T., Mohamed, A., Kingsbury, B., and Ramabhadran, B. (2013). Deep convolutional neural networks for LVCSR. In ICASSP 2013.

Salakhutdinov, R. (2010). Learning in Markov random fields using tempered transitions. In Y. Bengio, D. Schuurmans, C. Williams, J. Lafferty, and A. Culotta, editors, Advances in Neural Information Processing Systems 22 (NIPS'09).

Salakhutdinov, R. and Hinton, G. (2009a). Deep Boltzmann machines. In Proceedings of the International Conference on Artificial Intelligence and Statistics, volume 5, pages 448–455.

Salakhutdinov, R. and Hinton, G. (2009b). Semantic hashing. In International Journal of Approximate Reasoning.

Salakhutdinov, R. and Hinton, G. E. (2007a). Learning a nonlinear embedding by preserving class neighbourhood structure. In Proceedings of the Eleventh International Conference on Artificial Intelligence and Statistics (AISTATS'07), San Juan, Porto Rico. Omnipress.

Salakhutdinov, R. and Hinton, G. E. (2007b). Semantic hashing. In SIGIR'2007.

Salakhutdinov, R. and Hinton, G. E. (2008). Using deep belief nets to learn covariance kernels for Gaussian processes. In J. Platt, D. Koller, Y. Singer, and S. Roweis, editors, Advances in Neural Information Processing Systems 20 (NIPS'07), pages 1249–1256, Cambridge, MA. MIT Press.

Salakhutdinov, R. and Larochelle, H. (2010). Efficient learning of deep Boltzmann machines. In Proceedings of the Thirteenth International Conference on Artificial Intelligence and Statistics (AISTATS 2010), JMLR W&CP, volume 9, pages 693–700.

Salakhutdinov, R. and Mnih, A. (2008). Probabilistic matrix factorization. In NIPS'2008.

Salakhutdinov, R. and Murray, I. (2008). On the quantitative analysis of deep belief networks. In W. W. Cohen, A. McCallum, and S. T. Roweis, editors, Proceedings of the Twenty-fifth International Conference on Machine Learning (ICML'08), volume 25, pages 872–879. ACM.

Salakhutdinov, R., Mnih, A., and Hinton, G. (2007). Restricted Boltzmann machines for collaborative filtering. In ICML.

Sanger, T. D. (1994). Neural network learning control of robot manipulators using gradually increasing task difficulty. IEEE Transactions on Robotics and Automation, 10(3).

Saul, L. K. and Jordan, M. I. (1996). Exploiting tractable substructures in intractable networks. In D. Touretzky, M. Mozer, and M. Hasselmo, editors, Advances in Neural Information Processing Systems 8 (NIPS'95). MIT Press, Cambridge, MA.

Saul, L. K., Jaakkola, T., and Jordan, M. I. (1996). Mean field theory for sigmoid belief networks. Journal of Artificial Intelligence Research, 4, 61–76.

Savich, A. W., Moussa, M., and Areibi, S. (2007). The impact of arithmetic representation on implementing mlp-bp on fpgas: A study. Neural Networks, IEEE Transactions on, 18(1), 240–252.

Saxe, A. M., Koh, P. W., Chen, Z., Bhand, M., Suresh, B., and Ng, A. (2011). On random weights and unsupervised feature learning. In Proc. ICML'2011. ACM.

Saxe, A. M., McClelland, J. L., and Ganguli, S. (2013). Exact solutions to the nonlinear dynamics of learning in deep linear neural networks. In ICLR.

Schaul, T., Antonoglou, I., and Silver, D. (2014). Unit tests for stochastic optimization. In International Conference on Learning Representations.

Schmidhuber, J. (1992). Learning complex, extended sequences using the principle of history compression. Neural Computation, 4(2), 234–242.

Schmidhuber, J. (1996). Sequential neural text compression. IEEE Transactions on Neural Networks, 7(1), 142–146.

Schmidhuber, J. (2012). Self-delimiting neural networks. arXiv preprint arXiv:1210.0118.

Schölkopf, B. and Smola, A. J. (2002). Learning with kernels: Support vector machines, regularization, optimization, and beyond. MIT Press.

Schölkopf, B., Smola, A., and Müller, K.-R. (1998). Nonlinear component analysis as a kernel eigenvalue problem. Neural Computation, 10, 1299–1319.

Schölkopf, B., Burges, C. J. C., and Smola, A. J. (1999). Advances in Kernel Methods Support Vector Learning. MIT Press, Cambridge, MA.

Schölkopf, B., Janzing, D., Peters, J., Sgouritsa, E., Zhang, K., and Mooij, J. (2012). On causal and anticausal learning. In ICML'2012, pages 1255–1262.

Schuster. M. (1999). On supervised learning from sequential data with applications for speech recognition.

Schuster, M. and Paliwal, K. (1997). Bidirectional recurrent neural networks. IEEE Transactions on Signal Processing, 45(11), 2673-2681.

Schwenk, H. (2007). Continuous space language models. Computer speech and language, 21, 492–518.

Schwenk, H. (2010). Continuous space language models for statistical machine translation. The Prague Bulletin of Mathematical Linguistics, 93, 137-146.

Schwenk, H. (2014). Cleaned subset of WMT '14 dataset.

Schwenk, H. and Bengio, Y. (1998). Training methods for adaptive boosting of neural networks. In M. Jordan, M. Kearns, and S. Solla, editors, Advances in Neural Information Processing Systems 10 (NIPS'97), pages 647–653. MIT Press.

Schwenk, H. and Gauvain, J.-L. (2002). Connectionist language modeling for large vocabulary continuous speech recognition. In International Conference on Acoustics, Speech and Signal Processing (ICASSP), pages 765–768, Orlando, Florida.

Schwenk, H., Costa-jussà, M. R., and Fonollosa, J. A. R. (2006). Continuous space language models for the IWSLT 2006 task. In International Workshop on Spoken Language Translation, pages 166–173.

Seide, F., Li, G., and Yu, D. (2011). Conversational speech transcription using context-dependent deep neural networks. In Interspeech 2011, pages 437–440.

Sejnowski, T. (1987). Higher-order Boltzmann machines. In AIP Conference Proceedings 151 on Neural Networks for Computing, pages 398–403. American Institute of Physics Inc.

Series, P., Reichert, D. P., and Storkey, A. J. (2010). Hallucinations in Charles Bonnet syndrome induced by homeostasis: a deep Boltzmann machine model. In Advances in Neural Information Processing Systems, pages 2020–2028.

Sermanet, P., Chintala, S., and LeCun, Y. (2012). Convolutional neural networks applied to house numbers digit classification. CoRR, abs/1204.3968.

Sermanet, P., Kavukcuoglu, K., Chintala, S., and LeCun, Y. (2013). Pedestrian detection with unsupervised multi-stage feature learning. In Proc. International Conference on Computer Vision and Pattern Recognition (CVPR'13). IEEE.

Shilov, G. (1977). Linear Algebra. Dover Books on Mathematics Series. Dover Publications.

Siegelmann, H. (1995). Computation beyond the Turing limit. Science, 268(5210), 545-548.

Siegelmann, H. and Sontag, E. (1991). Turing computability with neural nets. Applied Mathematics Letters, 4(6), 77–80.

Siegelmann, H. T. and Sontag, E. D. (1995). On the computational power of neural nets. Journal of Computer and Systems Sciences, 50(1), 132–150.

Sietsma, J. and Dow, R. (1991). Creating artificial neural networks that generalize. Neural Networks, 4(1), 67–79.

Simard, D., Steinkraus, P. Y., and Platt, J. C. (2003). Best practices for convolutional neural networks. In ICDAR'2003.

Simard, P. and Graf, H. P. (1994). Backpropagation without multiplication. In Advances in Neural Information Processing Systems, pages 232–239.

Simard, P., Victorri, B., LeCun, Y., and Denker, J. (1992). Tangent prop - A formalism for specifying selected invariances in an adaptive network. In NIPS'1991.

Simard, P. Y., LeCun, Y., and Denker, J. (1993). Efficient pattern recognition using a new transformation distance. In NIPS'92.

Simard, P. Y., LeCun, Y. A., Denker, J. S., and Victorri, B. (1998). Transformation invariance in pattern recognition — tangent distance and tangent propagation. Lecture Notes in Computer Science, 1524.

Simons, D. J. and Levin, D. T. (1998). Failure to detect changes to people during a real-world interaction. Psychonomic Bulletin & Review, 5(4), 644–649.

Simonyan, K. and Zisserman, A. (2015). Very deep convolutional networks for large-scale image recognition. In ICLR.

Sjöberg, J. and Ljung, L. (1995). Overtraining, regularization and searching for a minimum, with application to neural networks. International Journal of Control, 62(6), 1391–1407.

Skinner, B. F. (1958). Reinforcement today. American Psychologist, 13, 94–99.

Smolensky, P. (1986). Information processing in dynamical systems: Foundations of harmony theory. In D. E. Rumelhart and J. L. McClelland, editors, Parallel Distributed Processing, volume 1, chapter 6, pages 194–281. MIT Press, Cambridge.

Snoek, J., Larochelle, H., and Adams, R. P. (2012). Practical Bayesian optimization of machine learning algorithms. In NIPS'2012.

Socher, R., Huang, E. H., Pennington, J., Ng, A. Y., and Manning, C. D. (2011a). Dynamic pooling and unfolding recursive autoencoders for paraphrase detection. In NIPS'2011.

Socher, R., Manning, C., and Ng, A. Y. (2011b). Parsing natural scenes and natural language with recursive neural networks. In Proceedings of the Twenty-Eighth International Conference on Machine Learning (ICML'2011).

Socher, R., Pennington, J., Huang, E. H., Ng, A. Y., and Manning, C. D. (2011c). Semi-supervised recursive autoencoders for predicting sentiment distributions. In EMNLP'2011.

Socher, R., Perelygin, A., Wu, J. Y., Chuang, J., Manning, C. D., Ng, A. Y., and Potts, C. (2013a). Recursive deep models for semantic compositionality over a sentiment treebank. In EMNLP'2013.

Socher, R., Ganjoo, M., Manning, C. D., and Ng, A. Y. (2013b). Zero-shot learning through cross-modal transfer. In 27th Annual Conference on Neural Information Processing Systems (NIPS 2013).

Sohl-Dickstein, J., Weiss, E. A., Maheswaranathan, N., and Ganguli, S. (2015). Deep unsupervised learning using nonequilibrium thermodynamics.

Sohn, K., Zhou, G., and Lee, H. (2013). Learning and selecting features jointly with point-wise gated Boltzmann machines. In ICML'2013.

Solomonoff, R. J. (1989). A system for incremental learning based on algorithmic probability.

Sontag, E. D. (1998). VC dimension of neural networks. NATO ASI Series F Computer and Systems Sciences, 168, 69–96.

Sontag, E. D. and Sussman, H. J. (1989). Backpropagation can give rise to spurious local minima even for networks without hidden layers. Complex Systems, 3, 91–106.

Sparkes, B. (1996). The Red and the Black: Studies in Greek Pottery. Routledge.

Spitkovsky, V. I., Alshawi, H., and Jurafsky, D. (2010). From baby steps to leapfrog: how “less is more” in unsupervised dependency parsing. In HLT'10.

Squire, W. and Trapp, G. (1998). Using complex variables to estimate derivatives of real functions. SIAM Rev., 40(1), 110—112.

Srebro, N. and Shraibman, A. (2005). Rank, trace-norm and max-norm. In Proceedings of the 18th Annual Conference on Learning Theory, pages 545–560. Springer-Verlag.

Srivastava, N. (2013). Improving Neural Networks With Dropout. Master's thesis, U. Toronto.

Srivastava, N. and Salakhutdinov, R. (2012). Multimodal learning with deep Boltzmann machines. In NIPS'2012.

Srivastava, N., Salakhutdinov, R. R., and Hinton, G. E. (2013). Modeling documents with deep Boltzmann machines. arXiv preprint arXiv:1309.6865.

Srivastava, N., Hinton, G., Krizhevsky, A., Sutskever, I., and Salakhutdinov, R. (2014). Dropout: A simple way to prevent neural networks from overfitting. Journal of Machine Learning Research, 15, 1929–1958.

Srivastava, R. K., Greff, K., and Schmidhuber, J. (2015). Highway networks. arXiv:1505.00387.

Steinkrau, D., Simard, P. Y., and Buck, I. (2005). Using GPUs for machine learning algorithms. 2013 12th International Conference on Document Analysis and Recognition, 0, 1115-1119.

Stoyanov, V., Ropson, A., and Eisner, J. (2011). Empirical risk minimization of graphical model parameters given approximate inference, decoding, and model structure. In Proceedings of the 14th International Conference on Artificial Intelligence and Statistics (AISTATS), volume 15 of JMLR Workshop and Conference Proceedings, pages 725–733, Fort Lauderdale. Supplementary material (4 pages) also available.

Sukhbaatar, S., Szlam, A., Weston, J., and Fergus, R. (2015). Weakly supervised memory networks. arXiv preprint arXiv:1503.08895.

Supancic, J. and Ramanan, D. (2013). Self-paced learning for long-term tracking. In CVPR'2013.

Sussillo, D. (2014). Random walks: Training very deep nonlinear feed-forward networks with smart initialization. CoRR, abs/1412.6558.

Sutskever, I. (2012). Training Recurrent Neural Networks. Ph.D. thesis, Department of computer science, University of Toronto.

Sutskever, I. and Hinton, G. E. (2008). Deep narrow sigmoid belief networks are universal approximators. Neural Computation, 20(11), 2629–2636.

Sutskever, I. and Tieleman, T. (2010). On the Convergence Properties of Contrastive Divergence. In Y. W. Teh and M. Titterington, editors, Proc. of the International Conference on Artificial Intelligence and Statistics (AISTATS), volume 9, pages 789-795.

Sutskever, I., Hinton, G., and Taylor, G. (2009). The recurrent temporal restricted Boltzmann machine. In NIPS'2008.

Sutskever, I., Martens, J., and Hinton, G. E. (2011). Generating text with recurrent neural networks. In ICML'2011, pages 1017–1024.

Sutskever, I., Martens, J., Dahl, G., and Hinton, G. (2013). On the importance of initialization and momentum in deep learning. In ICML.

Sutskever, I., Vinyals, O., and Le, Q. V. (2014). Sequence to sequence learning with neural networks. In NIPS'2014, arXiv:1409.3215.

Sutton, R. and Barto, A. (1998). Reinforcement Learning: An Introduction. MIT Press.

Sutton, R. S., Mcallester, D., Singh, S., and Mansour, Y. (2000). Policy gradient methods for reinforcement learning with function approximation. In NIPS'1999, pages 1057-1063. MIT Press.

Swersky, K., Ranzato, M., Buchman, D., Marlin, B., and de Freitas, N. (2011). On autoencoders and score matching for energy based models. In ICML'2011. ACM.

Swersky, K., Snoek, J., and Adams, R. P. (2014). Freeze-thaw Bayesian optimization. arXiv preprint arXiv:1406.3896.

Szegedy, C., Liu, W., Jia, Y., Sermanet, P., Reed, S., Anguelov, D., Erhan, D., Vanhoucke, V., and Rabinovich, A. (2014a). Going deeper with convolutions. Technical report, arXiv:1409.4842.

Szegedy, C., Zaremba, W., Sutskever, I., Bruna, J., Erhan, D., Goodfellow, I. J., and Fergus, R. (2014b). Intriguing properties of neural networks. ICLR, abs/1312.6199.

Szegedy, C., Vanhoucke, V., Ioffe, S., Shlens, J., and Wojna, Z. (2015). Rethinking the Inception Architecture for Computer Vision. ArXiv e-prints.

Taigman, Y., Yang, M., Ranzato, M., and Wolf, L. (2014). DeepFace: Closing the gap to human-level performance in face verification. In CVPR'2014.

Tandy, D. W. (1997). Works and Days: A Translation and Commentary for the Social Sciences. University of California Press.

Tang, Y. and Eliasmith, C. (2010). Deep networks for robust visual recognition. In Proceedings of the 27th International Conference on Machine Learning, June 21-24, 2010, Haifa, Israel.

Tang, Y., Salakhutdinov, R., and Hinton, G. (2012). Deep mixtures of factor analysers. arXiv preprint arXiv:1206.4635.

Taylor, G. and Hinton, G. (2009). Factored conditional restricted Boltzmann machines for modeling motion style. In L. Bottou and M. Littman, editors, Proceedings of the Twenty-sixth International Conference on Machine Learning (ICML'09), pages 1025–1032, Montreal, Quebec, Canada. ACM.

Taylor, G., Hinton, G. E., and Roweis, S. (2007). Modeling human motion using binary latent variables. In B. Schölkopf, J. Platt, and T. Hoffman, editors, Advances in Neural Information Processing Systems 19 (NIPS'06), pages 1345–1352. MIT Press, Cambridge, MA.

Teh, Y., Welling, M., Osindero, S., and Hinton, G. E. (2003). Energy-based models for sparse overcomplete representations. Journal of Machine Learning Research, 4, 1235–1260.

Tenenbaum, J., de Silva, V., and Langford, J. C. (2000). A global geometric framework for nonlinear dimensionality reduction. Science, 290(5500), 2319–2323.

Theis, L., van der Jord, A., and Bethge, M. (2015). A note on the evaluation of generative models. arXiv:1511.01844.

Thompson, J., Jain, A., LeCun, Y., and Bregler, C. (2014). Joint training of a convolutional network and a graphical model for human pose estimation. In NIPS'2014.

Thrun, S. (1995). Learning to play the game of chess. In NIPS'1994.

Tibshirani, R. J. (1995). Regression shrinkage and selection via the lasso. Journal of the Royal Statistical Society B, 58, 267–288.

Tieleman, T. (2008). Training restricted Boltzmann machines using approximations to the likelihood gradient. In W. W. Cohen, A. McCallum, and S. T. Roweis, editors, Proceedings of the Twenty-fifth International Conference on Machine Learning (ICML'08), pages 1064–1071. ACM.

Tieleman, T. and Hinton, G. (2009). Using fast weights to improve persistent contrastive divergence. In L. Bottou and M. Littman, editors, Proceedings of the Twenty-sixth International Conference on Machine Learning (ICML '09), pages 1033–1040. ACM.

Tipping, M. E. and Bishop, C. M. (1999). Probabilistic principal components analysis. Journal of the Royal Statistical Society B, 61(3), 611–622.

Torralba, A., Fergus, R., and Weiss, Y. (2008). Small codes and large databases for recognition. In Proceedings of the Computer Vision and Pattern Recognition Conference (CVPR'08), pages 1–8.

Touretzky, D. S. and Minton, G. E. (1985). Symbols among the neurons: Details of a connectionist inference architecture. In Proceedings of the 9th International Joint Conference on Artificial Intelligence - Volume 1, IJCAI'85, pages 238–243, San Francisco, CA, USA. Morgan Kaufmann Publishers Inc.

Töscher, A., Jahrer, M., and Bell, R. M. (2009). The BigChaos solution to the Netflix grand prize.

Tu, K. and Honavar, V. (2011). On the utility of curricula in unsupervised learning of probabilistic grammars. In IJCAI'2011.

Turaga, S. C., Murray, J. F., Jain, V., Roth, F., Helmstaedter, M., Briggman, K., Denk, W., and Seung, H. S. (2010). Convolutional networks can learn to generate affinity graphs for image segmentation. Neural Computation, 22(2), 511–538.

Turian, J., Ratinov, L., and Bengio, Y. (2010). Word representations: A simple and general method for semi-supervised learning. In Proc. ACL'2010, pages 384-394.

Uria, B., Murray, I., and Larochelle, H. (2013). Rnade: The real-valued neural autoregressive density-estimator. In NIPS'2013.

van den Oörd, A., Dieleman, S., and Schrauwen, B. (2013). Deep content-based music recommendation. In NIPS'2013.

van der Maaten, L. and Hinton, G. E. (2008). Visualizing data using t-SNE. J. Machine Learning Res., 9.

Vanhoucke, V., Senior, A., and Mao, M. Z. (2011). Improving the speed of neural networks on CPUs. In Proc. Deep Learning and Unsupervised Feature Learning NIPS Workshop.

Vapnik, V. N. (1982). Estimation of Dependences Based on Empirical Data. Springer-Verlag, Berlin.

Vapnik, V. N. (1995). The Nature of Statistical Learning Theory. Springer, New York.

Vapnik, V. N. and Chervonenkis, A. Y. (1971). On the uniform convergence of relative frequencies of events to their probabilities. Theory of Probability and Its Applications, 16, 264–280.

Vincent, P. (2011). A connection between score matching and denoising autoencoders. Neural Computation, 23(7).

Vincent, P. and Bengio, Y. (2003). Manifold Parzen windows. In NIPS'2002. MIT Press.

Vincent, P., Larochelle, H., Bengio, Y., and Manzagol, P.-A. (2008). Extracting and composing robust features with denoising autoencoders. In ICML 2008.

Vincent, P., Larochelle, H., Lajoie, I., Bengio, Y., and Manzagol, P.-A. (2010). Stacked denoising autoencoders: Learning useful representations in a deep network with a local denoising criterion. J. Machine Learning Res., 11.

Vincent, P., de Brébisson, A., and Bouthillier, X. (2015). Efficient exact gradient update for training deep networks with very large sparse targets. In C. Cortes, N. D. Lawrence, D. D. Lee, M. Sugiyama, and R. Garnett, editors, Advances in Neural Information Processing Systems 28, pages 1108–1116. Curran Associates, Inc.

Vinyals, O., Kaiser, L., Koo, T., Petrov, S., Sutskever, I., and Hinton, G. (2014a). Grammar as a foreign language. Technical report, arXiv:1412.7449.

Vinyals, O., Toshev, A., Bengio, S., and Erhan, D. (2014b). Show and tell: a neural image caption generator. arXiv 1411.4555.

Vinyals, O., Fortunato, M., and Jaitly, N. (2015a). Pointer networks. arXiv preprint arXiv:1506.03134.

Vinyals, O., Toshev, A., Bengio, S., and Erhan, D. (2015b). Show and tell: a neural image caption generator. In CVPR'2015. arXiv:1411.4555.

Viola, P. and Jones, M. (2001). Robust real-time object detection. In International Journal of Computer Vision.

Visin, F., Kastner, K., Cho, K., Matteucci, M., Courville, A., and Bengio, Y. (2015). ReNet: A recurrent neural network based alternative to convolutional networks. arXiv preprint arXiv:1505.00393.

Von Melchner, L., Pallas, S. L., and Sur, M. (2000). Visual behaviour mediated by retinal projections directed to the auditory pathway. Nature, 404(6780), 871–876.

Wager, S., Wang, S., and Liang, P. (2013). Dropout training as adaptive regularization. In Advances in Neural Information Processing Systems 26, pages 351–359.

Waibel, A., Hanazawa, T., Hinton, G. E., Shikano, K., and Lang, K. (1989). Phoneme recognition using time-delay neural networks. IEEE Transactions on Acoustics, Speech, and Signal Processing, 37, 328–339.

Wan, L., Zeiler, M., Zhang, S., LeCun, Y., and Fergus, R. (2013). Regularization of neural networks using dropconnect. In ICML'2013.

Wang, S. and Manning, C. (2013). Fast dropout training. In ICML'2013.

Wang, Z., Zhang, J., Feng, J., and Chen, Z. (2014a). Knowledge graph and text jointly embedding. In Proc. EMNLP'2014.

Wang, Z., Zhang, J., Feng, J., and Chen, Z. (2014b). Knowledge graph embedding by translating on hyperplanes. In Proc. AAAI'2014.

Warde-Farley, D., Goodfellow, I. J., Courville, A., and Bengio, Y. (2014). An empirical analysis of dropout in piecewise linear networks. In ICLR'2014.

Wawrzynek, J., Asanovic, K., Kingsbury, B., Johnson, D., Beck, J., and Morgan, N. (1996). Spert-II: A vector microprocessor system. Computer, 29(3), 79–86.

Weaver, L. and Tao, N. (2001). The optimal reward baseline for gradient-based reinforcement learning. In Proc. UAI'2001, pages 538–545.

Weinberger, K. Q. and Saul, L. K. (2004). Unsupervised learning of image manifolds by semidefinite programming. In CVPR'2004, pages 988–995.

Weiss, Y., Torralba, A., and Fergus, R. (2008). Spectral hashing. In NIPS, pages 1753–1760.

Welling, M., Zemel, R. S., and Hinton, G. E. (2002). Self supervised boosting. In Advances in Neural Information Processing Systems, pages 665–672.

Welling, M., Hinton, G. E., and Osindero, S. (2003a). Learning sparse topographic representations with products of Student t-distributions. In NIPS'2002.

Welling, M., Zemel, R., and Hinton, G. E. (2003b). Self-supervised boosting. In S. Becker, S. Thrun, and K. Obermayer, editors, Advances in Neural Information Processing Systems 15 (NIPS'02), pages 665–672. MIT Press.

Welling, M., Rosen-Zvi, M., and Hinton, G. E. (2005). Exponential family harmoniums with an application to information retrieval. In L. Saul, Y. Weiss, and L. Bottou, editors, Advances in Neural Information Processing Systems 17 (NIPS'04), volume 17, Cambridge, MA. MIT Press.

Werbos, P. J. (1981). Applications of advances in nonlinear sensitivity analysis. In Proceedings of the 10th IFIP Conference, 31.8 - 4.9, NYC, pages 762-770.

Weston, J., Bengio, S., and Usunier, N. (2010). Large scale image annotation: learning to rank with joint word-image embeddings. Machine Learning, 81(1), 21–35.

Weston, J., Chopra, S., and Bordes, A. (2014). Memory networks. arXiv preprint arXiv:1410.3916.

Widrow, B. and Hoff, M. E. (1960). Adaptive switching circuits. In 1960 IRE WESCON Convention Record, volume 4, pages 96–104. IRE, New York.

Wikipedia (2015). List of animals by number of neurons — Wikipedia, the free encyclopedia. [Online; accessed 4-March-2015].

Williams, C. K. I. and Agakov, F. V. (2002). Products of Gaussians and Probabilistic Minor Component Analysis. Neural Computation, 14(5), 1169–1182.

Williams, C. K. I. and Rasmussen, C. E. (1996). Gaussian processes for regression. In D. Touretzky, M. Mozer, and M. Hasselmo, editors, Advances in Neural Information Processing Systems 8 (NIPS'95), pages 514–520. MIT Press, Cambridge, MA.

Williams, R. J. (1992). Simple statistical gradient-following algorithms connectionist reinforcement learning. Machine Learning, 8, 229–256.

Williams, R. J. and Zipser, D. (1989). A learning algorithm for continually running fully recurrent neural networks. Neural Computation, 1, 270–280.

Wilson, D. R. and Martinez, T. R. (2003). The general inefficiency of batch training for gradient descent learning. Neural Networks, 16(10), 1429–1451.

Wilson, J. R. (1984). Variance reduction techniques for digital simulation. American Journal of Mathematical and Management Sciences, 4(3), 277–312.

Wiskott, L. and Sejnowski, T. J. (2002). Slow feature analysis: Unsupervised learning of invariances. Neural Computation, 14(4), 715–770.

Wolpert, D. and MacReady, W. (1997). No free lunch theorems for optimization. IEEE Transactions on Evolutionary Computation, 1, 67–82.

Wolpert, D. H. (1996). The lack of a priori distinction between learning algorithms. Neural Computation, 8(7), 1341-1390.

Wu, R., Yan, S., Shan, Y., Dang, Q., and Sun, G. (2015). Deep image: Scaling up image recognition. arXiv:1501.02876.

Wu, Z. (1997). Global continuation for distance geometry problems. SIAM Journal of Optimization, 7, 814–836.

Xiong, H. Y., Barash, Y., and Frey, B. J. (2011). Bayesian prediction of tissue-regulated splicing using RNA sequence and cellular context. Bioinformatics, 27(18), 2554–2562.

Xu, K., Ba, J. L., Kiros, R., Cho, K., Courville, A., Salakhutdinov, R., Zemel, R. S., and Bengio, Y. (2015). Show, attend and tell: Neural image caption generation with visual attention. In ICML'2015, arXiv:1502.03044.

Yildiz, I. B., Jaeger, H., and Kiebel, S. J. (2012). Re-visiting the echo state property. Neural networks, 35, 1–9.

Yosinski, J., Clune, J., Bengio, Y., and Lipson, H. (2014). How transferable are features in deep neural networks? In NIPS'2014.

Younes, L. (1998). On the convergence of Markovian stochastic algorithms with rapidly decreasing ergodicity rates. In Stochastics and Stochastics Models, pages 177–228.

Yu, D., Wang, S., and Deng, L. (2010). Sequential labeling using deep-structured conditional random fields. IEEE Journal of Selected Topics in Signal Processing.

Zaremba, W. and Sutskever, I. (2014). Learning to execute. arXiv 1410.4615.

Zaremba, W. and Sutskever, I. (2015). Reinforcement learning neural Turing machines. arXiv:1505.00521.

Zaslavsky, T. (1975). Facing Up to Arrangements: Face-Count Formulas for Partitions of Space by Hyperplanes. Number no. 154 in Memoirs of the American Mathematical Society. American Mathematical Society.

Zeiler, M. D. and Fergus, R. (2014). Visualizing and understanding convolutional networks. In ECCV'14.

Zeiler, M. D., Ranzato, M., Monga, R., Mao, M., Yang, K., Le, Q., Nguyen, P., Senior, A., Vanhoucke, V., Dean, J., and Hinton, G. E. (2013). On rectified linear units for speech processing. In ICASSP 2013.

Zhou, B., Khosla, A., Lapedriza, A., Oliva, A., and Torralba, A. (2015). Object detectors emerge in deep scene CNNs. ICLR'2015, arXiv:1412.6856.

Zhou, J. and Troyanskaya, O. G. (2014). Deep supervised and convolutional generative stochastic network for protein secondary structure prediction. In ICML'2014.

Zhou, Y. and Chellappa, R. (1988). Computation of optical flow using a neural network. In Neural Networks, 1988., IEEE International Conference on, pages 71–78. IEEE.

Zöhrer, M. and Pernkopf, F. (2014). General stochastic networks for classification. In NIPS'2014.

## Index

0-1 loss, 101, 269

Absolute value rectification, 187  
Accuracy, 411  
Activation function, 166  
Active constraint, 91  
AdaGrad, 299  
ADALINE, see adaptive linear element  
Adam, 301, 413  
Adaptive linear element, 14, 22, 23  
Adversarial example, 261  
Adversarial training, 262, 265, 521  
Affine, 107  
AIS, see annealed importance sampling  
Almost everywhere, 69  
Almost sure convergence, 126  
Ancestral sampling, 570, 586  
ANN, see Artificial neural network  
Annealed importance sampling, 617, 659, 707  
Approximate Bayesian computation, 706  
Approximate inference, 573  
Artificial intelligence, 1  
Artificial neural network, see Neural network  
ASR, see automatic speech recognition  
Asymptotically unbiased, 121  
Audio, 99, 348, 446

Autoencoder, 4, 345, 493
Automatic speech recognition, 446

Back-propagation, 197
Back-propagation through time,
374
Backprop, see back-propagation
Bag of words, 458
Bagging, 249
Batch normalization, 260, 413
Bayes error, 114
Bayes' rule, 68
Bayesian hyperparameter optimization,
423
Bayesian network, see directed
graphical model
Bayesian probability, 53
Bayesian statistics, 132
Belief network, see directed graphical
model
Bernoulli distribution, 60
BFGS, 307
Bias, 121, 222
Bias parameter, 107
Biased importance sampling, 584
Bigram, 449
Binary relation, 470
Block Gibbs sampling, 590
Boltzmann distribution, 561
Boltzmann machine, 561, 645

BPTT, see back-propagation through time
Broadcasting, 32
Burn-in, 589

CAE, see contractive autoencoder  
Calculus of variations, 174  
Categorical distribution, see multinoulli distribution  
CD, see contrastive divergence  
Centering trick (DBM), 664  
Central limit theorem, 62  
Chain rule (calculus), 199  
Chain rule of probability, 57  
Chess, 2  
Chord, 569  
Chordal graph, 569  
Class-based language models, 451  
Classical dynamical system, 365  
Classification, 97  
Clique potential, see factor (graphical model)  
CNN, see convolutional neural network  
Collaborative Filtering, 466  
Collider, see explaining away  
Color images, 348  
Complex cell, 354  
Computational graph, 198  
Computer vision, 440  
Concept drift, 528  
Condition number, 272  
Conditional computation, see dynamic structure  
Conditional independence, 58  
Conditional probability, 57  
Conditional RBM, 676  
Connectionism, 16, 431  
Connectionist temporal classification, 448  
Consistency, 126, 503

Constrained optimization, 89, 230  
Content-based addressing, 407  
Content-based recommender systems, 467  
Context-specific independence, 564  
Contextual bandits, 468  
Continuation methods, 318  
Contractive autoencoder, 510  
Contrast, 442  
Contrastive divergence, 283, 601, 663  
Convex optimization, 138  
Convolution, 321, 673  
Convolutional network, 15  
Convolutional neural network, 247, 321, 413, 448  
Coordinate descent, 312, 662  
Correlation, 59  
Cost function, see objective function  
Covariance, 59  
Covariance matrix, 60  
Coverage, 412  
Critical temperature, 594  
Cross-correlation, 323  
Cross-entropy, 73, 129  
Cross-validation, 119  
CTC, see connectionist temporal classification  
Curriculum learning, 319  
Curse of dimensionality, 151  
Cyc,-2  
D-separation, 563  
DAE, see denoising autoencoder  
Data-generating distribution, 108, 128  
Data-generating process, 108  
Data parallelism, 435  
Dataset, 101  
Dataset augmentation, 265, 445  
DBM, see deep Boltzmann machine  
DCGAN, 542, 692

Decision tree, 140, 537  
Decoder, 4  
Deep belief network, 23, 520, 623, 648, 651, 674, 682  
Deep Blue, 2  
Deep Boltzmann machine, 22, 23, 520, 623, 644, 648, 654, 663, 674  
Deep feedforward network, 163, 413  
Deep learning, 2, 5  
Denoising autoencoder, 501, 679  
Denoising score matching, 611  
Density estimation, 100  
Derivative, 80  
Design matrix, 103  
Detector layer, 330  
Diagonal matrix, 38  
Differential entropy, 71, 638  
Dirac delta function, 63  
Directed graphical model, 74, 498, 554, 682  
Directional derivative, 82  
Discriminative fine-tuning, see supervised fine-tuning  
Discriminative RBM, 677  
Distributed representation, 16, 147, 536  
Domain adaptation, 526  
Dot product, 32, 137  
Double backprop, 265  
Doubly block circulant matrix, 324  
Dream sleep, 601, 644  
DropConnect, 259  
Dropout, 251, 413, 418, 419, 663, 679  
Dynamic structure, 436  
E-step, 626  
Early stopping, 239, 240, 242, 243, 413  
EBM, see energy-based model  
Echo state network, 22, 23, 393  
Effective capacity, 111  
Eigendecomposition, 39

Eigenvalue, 40  
Eigenvector, 40  
ELBO, see evidence lower bound  
Element-wise product, see Hadamard product  
EM, see expectation maximization  
Embedding, 508  
Empirical distribution, 64  
Empirical risk, 269  
Empirical risk minimization, 269  
Encoder, 4  
Energy function, 560  
Energy-based model, 560, 586, 645, 654  
Ensemble methods, 249  
Epoch, 239  
Equality constraint, 90  
Equivariance, 329  
Error function, see objective function  
ESN, see echo state network  
Euclidean norm, 37  
Euler-Lagrange equation, 637  
Evidence lower bound, 624, 652  
Example, 96  
Expectation, 58  
Expectation maximization, 626  
Expected value, see expectation  
Explaining away, 565, 623, 636  
Exploitation, 469  
Exploration, 469  
Exponential distribution, 63  
F-score, 411  
Factor (graphical model), 558  
Factor analysis, 480  
Factor graph, 569  
Factors of variation, 4  
Feature, 96  
Feature selection, 229  
Feedforward neural network, 163  
Fine-tuning, 314

Finite differences, 427  
Forget gate, 297  
Forward propagation, 197  
Fourier transform, 348, 351  
Fovea, 355  
FPCD, 606  
Free energy, 562, 670  
Freebase, 471  
Frequentist probability, 53  
Frequentist statistics, 132  
Frobenius norm, 44  
Fully-visible Bayes network, 696  
Functional derivatives, 637  
FVBN, see fully-visible Bayes network  
Gabor function, 357  
GANs, see generative adversarial networks  
Gated recurrent unit, 413  
Gaussian distribution, see normal distribution  
Gaussian kernel, 139  
Gaussian mixture, 65, 183  
GCN, see global contrast normalization  
GeneOntology, 471  
Generalization, 107  
Generalized Lagrange function, see generalized Lagrangian  
Generalized Lagrangian, 90  
Generative adversarial networks, 679, 690  
Generative moment matching networks, 693  
Generator network, 684  
Gibbs distribution, 559  
Gibbs sampling, 571, 590  
Global contrast normalization, 442  
GPU, see graphics processing unit  
Gradient, 82  
Gradient clipping, 281, 403

Gradient descent, 80, 82  
Graphical model, see structured probabilistic model  
Graphics processing unit, 432  
Greedy algorithm, 314  
Greedy layer-wise unsupervised pretraining, 519  
Greedy supervised pretraining, 315  
Grid search, 420  

Hadamard product, 32  
Hard tanh, 191  
Harmonium, see restricted Boltzmann machine  
Harmony theory, 562  
Helmholtz free energy, see evidence lower bound  
Hessian, 217  
Hessian matrix, 83  
Heteroscedastic, 182  
Hidden layer, 6, 163  
Hill climbing, 82  
Hyperparameter optimization, 420  
Hyperparameters, 117, 418  
Hypothesis space, 109, 115  

i.i.d. assumptions, 108, 119, 261  
Identity matrix, 34  
ILSVRC, see ImageNet Large Scale Visual Recognition Challenge  
ImageNet Large Scale Visual Recognition Challenge, 22  
Immorality, 567  
Importance sampling, 583, 615, 688  
Importance weighted autoencoder, 688  
Independence, 58  
Independent and identically distributed, see i.i.d. assumptions  
Independent component analysis, 481  
Independent subspace analysis, 483

Inequality constraint, 90  
Inference, 553, 573, 623, 624, 627, 629, 639, 642  
Information retrieval, 515  
Initialization, 292  
Invariance, 330  
Isotropic, 63  
Jacobian matrix, 70, 83  
Joint probability, 55  
k-means, 352, 537  
k-nearest neighbors, 140, 537  
Karush-Kuhn-Tucker conditions, 91, 230  
Karush-Kuhn-Tucker, 89  
Kernel (convolution), 322, 323  
Kernel machine, 537  
Kernel trick, 138  
KKT, see Karush-Kuhn-Tucker  
KKT conditions, see Karush-Kuhn-Tucker conditions  
KL divergence, see Kullback-Leibler divergence  
Knowledge base, 2, 471  
Krylov methods, 217  
Kullback-Leibler divergence, 72  
Label smoothing, 236  
Lagrange multipliers, 89, 638  
Lagrangian, see generalized Lagrangian  
LAPGAN, 692  
Laplace distribution, 63, 486, 487  
Latent variable, 65  
Layer (neural network), 163  
LCN, see local contrast normalization  
Leaky ReLU, 187  
Leaky units, 396  
Learning rate, 82

Line search, 82, 89  
Linear combination, 35  
Linear dependence, 36  
Linear factor models, 479  
Linear regression, 104, 107, 137  
Link prediction, 472  
Lipschitz constant, 88  
Lipschitz continuous, 88  
Liquid state machine, 393  
Local conditional probability distribution, 555  
Local contrast normalization, 444  
Logistic regression, 3, 137, 137  
Logistic sigmoid, 7, 65  
Long short-term memory, 17, 24, 297, 399, 413  
Loop, 569  
Loopy belief propagation, 576  
Loss function, see objective function $L^p$ norm, 36  
LSTM, see long short-term memory  
M-step, 626  
Machine learning, 2  
Machine translation, 98  
Main diagonal, 31  
Manifold, 156  
Manifold hypothesis, 157  
Manifold learning, 156  
Manifold tangent classifier, 265  
MAP approximation, 135, 496  
Marginal probability, 56  
Markov chain, 586  
Markov chain Monte Carlo, 586  
Markov network, see undirected model  
Markov random field, see undirected model  
Matrix, 30  
Matrix inverse, 34  
Matrix product, 32

Max norm, 38

Max pooling, 330

Maximum likelihood, 128

Maxout, 188, 413

MCMC, see Markov chain Monte Carlo

Mean field, 630, 631, 663

Mean squared error, 105

Measure theory, 68

Measure zero, 69

Memory network, 405, 406

Method of steepest descent, see gradient descent

Minibatch, 272

Missing inputs, 97

Mixing (Markov chain), 592

Mixture density networks, 183

Mixture distribution, 64

Mixture model, 183, 501

Mixture of experts, 437, 537

MLP, see multilayer perception

MNIST, 19, 20, 663

Model averaging, 249

Model compression, 436

Model identifiability, 277

Model parallelism, 435

Moment matching, 693

Moore-Penrose pseudoinverse, 43, 232

Moralized graph, 567

MP-DBM, see multi-prediction DBM

MRF (Markov Random Field), see undirected model

MSE, see mean squared error

Multi-modal learning, 530

Multi-prediction DBM, 664

Multi-task learning, 237, 528

Multilayer perception, 5

Multilayer perceptron, 23

Multinomial distribution, 60

Multinoulli distribution, 60

$n$ -gram, 449

NADE, 699

Naive Bayes, 3

Nat, 71

Natural image, 550

Natural language processing, 448

Nearest neighbor regression, 112

Negative definite, 86

Negative phase, 458, 598, 600

Neocognitron, 15, 22, 23, 356

Nesterov momentum, 291

Netflix Grand Prize, 251, 467

Neural language model, 451, 464

Neural network, 13

Neural Turing machine, 406

Neuroscience, 14

Newton's method, 87, 303

NLM, see neural language model

NLP, see natural language processing

No free lunch theorem, 113

Noise-contrastive estimation, 612

nonparametric model, 111

Norm, 36, 37

Normal distribution, 61, 62, 122

Normal equations, 106, 106, 109, 227

Normalized initialization, 295

Numerical differentiation, see finite differences

Object detection, 440

Object recognition, 440

Objective function, 79

OMP- $k$ , see orthogonal matching pursuit

One-shot learning, 529

Operation, 198

Optimization, 77, 79

Orthodox statistics, see frequentist statistics

Orthogonal matching pursuit, 23, 248

Orthogonal matrix, 39  
Orthogonality, 39  
Output layer, 163  

Parallel distributed processing, 16  
Parameter initialization, 292, 395  
Parameter sharing, 246, 326, 363, 365, 378  

Parameter tying, see Parameter sharing  
Parametric model, 111  
Parametric ReLU, 187  
Partial derivative, 82  
Partition function, 559, 597, 660  
PCA, see principal components analysis  
PCD, see stochastic maximum likelihood  
Perceptron, 14, 23  
Persistent contrastive divergence, see stochastic maximum likelihood  
Perturbation analysis, see reparametrization trick  
Point estimator, 119  
Policy, 468  
Pooling, 321, 674  
Positive definite, 86  
Positive phase, 458, 598, 600, 647, 659  
Precision, 411  
Precision (of a normal distribution), 61, 63  

Predictive sparse decomposition, 514  
Preprocessing, 441  
Pretraining, 314, 519  
Primary visual cortex, 353  
Principal components analysis, 45, 143, 144, 480, 623  

Prior probability distribution, 132  
Probabilistic max pooling, 674  
Probabilistic PCA, 480, 481, 624  
Probability density function, 56  
Probability distribution, 54

Probability mass function, 54  
Probability mass function estimation, 100  
Product of experts, 561  
Product rule of probability, see chain rule of probability  
PSD, see predictive sparse decomposition  
Pseudolikelihood, 607  
Quadrature pair, 359  
Quasi-Newton methods, 308  
Radial basis function, 191  
Random search, 422  
Random variable, 54  
Ratio matching, 610  
RBF, 191  
RBM, see restricted Boltzmann machine  
Recall, 411  
Receptive field, 327  
Recommender Systems, 465  
Rectified linear unit, 167, 187, 413, 498  
Recurrent network, 23  
Recurrent neural network, 368  
Regression, 98  
Regularization, 117, 117, 172, 221, 418  
Regularizer, 116  
REINFORCE, 680  
Reinforcement learning, 25, 103, 468, 679  
Relational database, 471  
Relations, 470  
Reparametrization trick, 679  
Representation learning, 3  
Representational capacity, 111  
Restricted Boltzmann machine, 345, 447, 467, 577, 623, 647, 648, 663, 667, 669, 671, 674

Ridge regression, see weight decay  
Risk, 268  
RNN-RBM, 676  
Saddle points, 278  
Sample mean, 122  
Scalar, 29  
Score matching, 503, 609  
Second derivative, 83  
Second derivative test, 85  
Self-information, 71  
Semantic hashing, 515  
Semi-supervised learning, 236  
Separable convolution, 351  
Separation (probabilistic modeling), 562  
SGD, see stochastic gradient descent  
Shannon entropy, 71  
Shortlist, 454  
Sigmoid, see logistic sigmoid  
Sigmoid belief network, 23  
Simple cell, 354  
Singular value, see singular value decomposition  
Singular value decomposition, 42, 144, 467  
Singular vector, see singular value decomposition  
Slow feature analysis, 484  
SML, see stochastic maximum likelihood  
Softmax, 178, 406, 437  
Softplus, 66, 191  
Spam detection, 3  
Sparse coding, 313, 345, 486, 623, 682  
Sparse initialization, 296, 395  
Sparse representation, 142, 220, 247, 496, 547  
Spearmint, 423  
Spectral radius, 393

Speech recognition, see automatic speech recognition

Sphering, see whitening

Spike and slab restricted Boltzmann machine, 671

SPN, see sum-product network

Square matrix, 36

ssRBM, see spike and slab restricted Boltzmann machine

Standard deviation, 59

Standard error, 124

Standard error of the mean, 124, 271

Statistic, 119

Statistical learning theory, 107

Steepest descent, see gradient descent

Stochastic back-propagation, see reparametrization trick

Stochastic gradient descent, 14, 147, 272, 286, 663

Stochastic maximum likelihood, 604, 663

Stochastic pooling, 259

Structure learning, 573

Structured output, 98, 675

Structured probabilistic model, 74, 549

Sum rule of probability, 56

Sum-product network, 544

Supervised fine-tuning, 520, 653

Supervised learning, 102

Support vector machine, 137

Surrogate loss function, 269

SVD, see singular value decomposition

Symmetric matrix, 39, 40

Tangent distance, 263

Tangent plane, 506

Tangent prop, 263

TDNN, see time-delay neural network

Teacher forcing, 372, 373

Tempering, 594


<!-- MinerU pages 801-808 -->

Template matching, 138  
Tensor, 31  
Test set, 107  
Tikhonov regularization, see weight decay  
Tiled convolution, 341  
Time-delay neural network, 356, 364  
Toeplitz matrix, 324  
Topographic ICA, 483  
Trace operator, 44  
Training error, 107  
Transcription, 98  
Transfer learning, 526  
Transpose, 31  
Triangle inequality, 37  
Triangulated graph, see chordal graph  
Trigram, 449

Unbiased, 121
Undirected graphical model, 74, 498
Undirected model, 556
Uniform distribution, 55
Unigram, 449
Unit norm, 39
Unit vector, 39
Universal approximation theorem, 192
Universal approximator, 544
Unnormalized probability distribution, 558
Unsupervised learning, 102, 142
Unsupervised pretraining, 447, 519

V-structure, see explaining away

V1, 353

VAE, see variational autoencoder

Vapnik-Chervonenkis dimension, 111

Variance, 59, 222

Variational autoencoder, 679, 687

Variational derivatives, see functional derivatives

Variational free energy, see evidence lower bound

VC dimension, see Vapnik-Chervonenkis dimension

Vector, 30

Virtual adversarial examples, 262

Visible layer, 6

Volumetric data, 348

Wake-sleep, 643, 652  
Weight decay, 115, 172, 224, 419  
Weight space symmetry, 277  
Weights, 14, 104  
Whitening, 444  
Wikibase, 471  
Wikibase, 471  
Word embedding, 452  
Word-sense disambiguation, 472  
WordNet, 471

Zero-data learning, see zero-shot learning  
Zero-shot learning, 529

# Adaptive Computation and Machine Learning

Thomas Dietterich, Editor

Christopher Bishop, David Heckerman, Michael Jordan, and Michael Kearns, Associate Editors

Bioinformatics: The Machine Learning Approach, Pierre Baldi and Søren Brunak

Reinforcement Learning: An Introduction, Richard S. Sutton and Andrew G. Barto

Graphical Models for Machine Learning and Digital Communication, Brendan J. Frey

Learning in Graphical Models, Michael I. Jordan

Causation, Prediction, and Search, second edition, Peter Spirtes, Clark Glymour, and Richard Scheines

Principles of Data Mining, David Hand, Heikki Mannila, and Padhraic Smyth

Bioinformatics: The Machine Learning Approach, second edition, Pierre Baldi and Søren Brunak

Learning Kernel Classifiers: Theory and Algorithms, Ralf Herbrich

Learning with Kernels: Support Vector Machines, Regularization, Optimization, and Beyond, Bernhard Schölkopf and Alexander J. Smola

Introduction to Machine Learning, Ethem Alpaydin

Gaussian Processes for Machine Learning, Carl Edward Rasmussen and Christopher K.I. Williams

Semi-Supervised Learning, Olivier Chapelle, Bernhard Schölkopf, and Alexander Zien, Eds.

The Minimum Description Length Principle, Peter D. Grünwald

Introduction to Statistical Relational Learning, Lise Getoor and Ben Taskar, Eds.

Probabilistic Graphical Models: Principles and Techniques, Daphne Koller and Nir Friedman

Introduction to Machine Learning, second edition, Ethem Alpaydin

Machine Learning in Non-Stationary Environments: Introduction to Covariate Shift Adaptation, Masashi Sugiyama and Motoaki Kawanabe

Boosting: Foundations and Algorithms, Robert E. Schapire and Yoav Freund

Machine Learning: A Probabilistic Perspective, Kevin P. Murphy

Foundations of Machine Learning, Mehryar Mohri, Afshin Rostami, and Ameet Talwalker

Introduction to Machine Learning, third edition, Ethem Alpaydin

Deep Learning, Ian Goodfellow, Yoshua Bengio, and Aaron Courville

computer science/machine learning

DEEP LEARNING

Ian Goodfellow, Yoshua Bengio, and Aaron Courville

Deep learning is a form of machine learning that enables computers to learn from experience and understand the world in terms of a hierarchy of concepts. Because the computer gathers knowledge from experience, there is no need for a human computer operator to formally specify all the knowledge that the computer needs. The hierarchy of concepts allows the computer to learn complicated concepts by building them out of simpler ones; a graph of these hierarchies would be many layers deep. This book introduces a broad range of topics in deep learning.

The text offers mathematical and conceptual background, covering relevant concepts in linear algebra, probability theory and information theory, numerical computation, and machine learning. It describes deep learning techniques used by practitioners in industry, including deep feedforward networks, regularization, optimization algorithms, convolutional networks, sequence modeling, and practical methodology; and it surveys such applications as natural language processing, speech recognition, computer vision, online recommendation systems, bioinformatics, and video games. Finally, the book offers research perspectives, covering such theoretical topics as linear factor models, autoencoders, representation learning, structured probabilistic models, Monte Carlo methods, the partition function, approximate inference, and deep generative models.

Deep Learning can be used by undergraduate or graduate students planning careers in either industry or research, and by software engineers who want to begin using deep learning in their products or platforms. A website offers supplementary material for both readers and instructors.

Ian Goodfellow is Research Scientist at OpenAI. Yoshua Bengio is Professor of Computer Science at the Université de Montréal. Aaron Courville is Assistant Professor of Computer Science at the Université de Montréal.

## Adaptive Computation and Machine Learning series

"Written by three experts in the field, Deep Learning is the only comprehensive book on the subject. It provides much-needed broad perspective and mathematical preliminaries for software engineers and students entering the field, and serves as a reference for authorities."

—Elon Musk, cochair of OpenAI; cofounder and CEO of Tesla and SpaceX

"This is the definitive textbook on deep learning. Written by major contributors to the field, it is clear, comprehensive, and authoritative. If you want to know where deep learning came from, what it is good for, and where it is going, read this book."

—Geoffrey Hinton FRS, Emeritus Professor, University of Toronto; Distinguished Research Scientist, Google

"Deep learning has taken the world of technology by storm since the beginning of the decade. There was a need for a textbook for students, practitioners, and instructors that includes basic concepts, practical aspects, and advanced research topics. This is the first comprehensive textbook on the subject, written by some of the most innovative and prolific researchers in the field. This will be a reference for years to come."

—Yann LeCun, Director of AI Research, Facebook; Silver Professor of Computer Science, Data Science, and Neuroscience, New York University

Cover image: Central Park Azalea Walk Dreamscape by Daniel Ambrosi (danielambrosi.com)

Daniel Ambrosi's "Dreamscapes" are created by applying a version of Google's DeepDream open source software modified by Joseph Smarr (Google) and Chris Lamb (NVIDIA) to operate successfully on Ambrosi's multi-hundred megapixel panoramic images.


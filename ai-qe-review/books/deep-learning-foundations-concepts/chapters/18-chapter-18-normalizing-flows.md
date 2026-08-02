---
title: "Chapter 18 \u2014 Normalizing Flows"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 18
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 13513
source_line_end: 13841
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 17
source_empty_image_alt: 17
non_semantic_image_alt: 15
caption_derived_image_alt: 2
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 5
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 18 — Normalizing Flows

> [[../README|本书目录]] · [[17-chapter-17-generative-adversarial-networks|上一章]] · [[19-chapter-19-autoencoders|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 13513–13841。
> - 本章保留 17 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5；PDF-confirmed exercise difficulty marker (PDF p.572) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 18.1. Coupling Flows

Our goal is to design a single invertible function layer, so that we can compose many of them together to define a highly flexible class of invertible functions. Consider first a linear transformation of the form

$$
\mathbf{x} = a \mathbf{z} + \mathbf{b}.\tag{18.8}
$$

This is easy to invert, giving

$$
{\mathbf z} = \frac{1}{a}({\mathbf x} -{\mathbf b}).\tag{18.9}
$$

However, linear transformations are closed under composition, meaning that a sequence of linear transformations is equivalent to a single overall linear transformation. Moreover, a linear transformation of a Gaussian distribution is again Gaussian. So even if we have many such ‘layers’ of linear transformation, we will only ever have a Gaussian distribution. The question is whether we can retain the invertability of a linear transformation while allowing additional flexibility so that the resulting distribution can be non-Gaussian.

One solution to this problem is given by a form of normalizing flow model called real NVP (Dinh, Krueger, and Bengio, 2014; Dinh, Sohl-Dickstein, and Bengio, 2016), which is short for ‘real-valued non-volume-preserving’. The idea is to partition the latent-variable vector z into two parts $\mathbf{z} =(\mathbf{z}_{A}, \mathbf{z}_{B})$ , so that if z has dimension $D$ and $\mathbf{z}_{A}$ has dimension d, then $\mathbf{z}_{B}$ has dimension $D - d.$ . We similarly

Figure 18.1 A single layer of the real NVP normalizing flow model. Here the network NN1 computes the function $\exp(\mathbf{s}(\mathbf{z}_{A}, \mathbf{w}))$ ) and the network NN2 computes the function ${\bf b}({\bf z}_{A},{\bf w})$ The output vector is then defined by (18.10) and (18.11).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/778d35a0d6c97ee449a71ab74f13481ff466124b71cde28eb024a7b10e17b5bb.jpg)

partition the output vector $\mathbf{x} =(\mathbf{x}_{A}, \mathbf{x}_{B})$ where $\mathbf{x}_{A}$ has dimension $d$ and $\mathbf{x}_{B}$ has dimension $D - d.$ . For the first part of the output vector, we simply copy the input:

$$
\mathbf{x}_{A} = \mathbf{z}_{A}.\tag{18.10}
$$

The second part of the vector undergoes a linear transformation, but now the coefficients in the linear transformation are given by nonlinear functions of $\mathbf{z}_{A}$ :

$$
\mathbf{x}_{B} = \exp(\mathbf{s}(\mathbf{z}_{A}, \mathbf{w})) \odot \mathbf{z}_{B} + \mathbf{b}(\mathbf{z}_{A}, \mathbf{w})\tag{18.11}
$$

where $\mathbf{s}(\mathbf{z}_{A}, \mathbf{w})$ and ${\bf b}({\bf z}_{A},{\bf w})$ are the real-valued outputs of neural networks, and the exponential ensures that the multiplicative term is non-negative. Here denotes the Hadamard product involving an element-wise multiplication of the two vectors. Similarly, the exponential in (18.11) is taken element-wise. Note that we have shown the same vector w in both network functions. In practice, these may be implemented as separate networks with their own parameters, or as one network with two sets of outputs.

Due to the use of neural network functions, the value of $\mathbf{x}_{B}$ can be a very flexible function of $\mathbf{x}_{A}$ . Nevertheless, the overall transformation is easily invertible: given a value for $\mathbf{x} =(\mathbf{x}_{A}, \mathbf{x}_{B})$ we first compute

$$
\mathbf{z}_{A} = \mathbf{x}_{A},\tag{18.12}
$$

then we evaluate $\mathbf{s}(\mathbf{z}_{A}, \mathbf{w})$ and ${\mathbf b}({\mathbf z}_{A},{\mathbf w})$ , and finally we compute $\mathbf{z}_{B}$ using

$$
\mathbf{z}_{B} = \exp(- \mathbf{s}(\mathbf{z}_{A}, \mathbf{w})) \odot(\mathbf{x}_{B} - \mathbf{b}(\mathbf{z}_{A}, \mathbf{w})).\tag{18.13}
$$

The overall transformation is illustrated in Figure 18.1. Note that there is no requirement for the individual neural network functions $\mathbf{s}(\mathbf{z}_{A}, \mathbf{w})$ and ${\mathbf b}({\mathbf z}_{A},{\mathbf w})$ to be invertible.

Now consider the evaluation of the Jacobian defined by (18.2) and its determinant. We can divide the Jacobian matrix into blocks, corresponding to the partitioning of z and $\mathbf{x},$ giving

$$
\mathbf{J} = \left[\begin{array}{cc}{\mathbf{I}_{d}} &{\mathbf{0}} \\{\partial \mathbf{z}_{B}} &{\operatorname{diag}(\exp(- \mathbf{s}))} \end{array} \right].\tag{18.14}
$$

![Figure 18.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/5d10fa25fd1a1248afff0bccfa95e963db437950e8340fe692dd620faf6e09db.jpg)  
Figure 18.2 By composing two layers of the form shown in Figure 18.1, we obtain a more flexible, but still invertible, nonlinear layer. Each sub-layer is invertible and has an easily evaluated Jacobian, and hence the overall double layer has the same properties.

The top left block corresponds to the derivatives of $\mathbf{z}_{A}$ with respect to $\mathbf{x}_{A}$ and hence from (18.12) is given by the $d{\times} d$ identity matrix. The top right block corresponds to the derivatives of $\mathbf{z}_{A}$ with respect to $\mathbf{x}_{B}$ and these terms vanish, again from (18.12). The bottom left block corresponds to the derivatives of $\mathbf{z}_{B}$ with respect to $\mathbf{x}_{A}$ . From (18.13), these are complicated expressions involving the neural network functions. Finally, the bottom right block corresponds to the derivatives of $\mathbf{z}_{B}$ with respect to $\mathbf{x}_{B}$ , which from (18.13) are given by a diagonal matrix whose diagonal elements are given by the exponentials of the negative elements of $\mathbf{s}(\mathbf{z}_{A}, \mathbf{w})$ . We therefore see that the Jacobian matrix (18.14) is a lower triangular matrix, meaning that all elements above the leading diagonal are zero. For such a matrix, the determinant is just the product of the elements along the leading diagonal, and therefore it does not depend on the complicated expressions in the lower left block. Consequently, the determinant of the Jacobian is simply given by the product of the elements of $\exp(- \mathbf{s}(\mathbf{z}_{A}, \mathbf{w}))$ .

A clear limitation of this approach is that the value of $\mathbf{z}_{A}$ is unchanged by the transformation. This is easily resolved by adding another layer in which the roles of $\mathbf{z}_{A}$ and $\mathbf{z}_{B}$ are reversed, as illustrated in Figure 18.2. This double-layer structure can then be repeated multiple times to facilitate a very flexible class of generative models.

The overall training procedure involves creating mini-batches of data points, in which the contribution of each data point to the log likelihood function is obtained from (18.4). For a latent distribution of the form $\mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I})$ , the log density is simply $- \| \mathbf{z} \|^{2} / 2$ up to an additive constant. The inverse transformation ${\bf z} ={\bf g}({\bf x})$ is calculated using a sequence of inverse transformations of the form (18.13). Similarly, the log of the Jacobian determinant is given by a sum of log determinants for each layer where each term is itself a sum of terms of the form $- s_{i}(\mathbf{x}, \mathbf{w})$ . Gradients of the log likelihood can be evaluated using automatic differentiation, and the network parameters updated by stochastic gradient descent.

The real NVP model belongs to a broad class of normalizing flows called coupling flows, in which the linear transformation (18.11) is replaced by a more general

Illustration of the real NVP normalizing flow model applied to the two-moons data set showing (a) the Gaussian base distribution, (b) the distribution after a transformation of the vertical axis only, (c) the distribution after a subsequent transformation of the horizontal axis, (d) the distribution after a second transformation of the vertical axis, (e) the distribution after a second transformation of the horizontal axis, and (f) the data set on which the model was trained.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/9a02830137d52d49e9cd5ca5d3cd6d3bf9c6c92b27dc679eb8ccb96e49b81811.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/88caae7ca38b6e3089d0f2be1e299e56573d52fb17d26623d9c12c7bd5f52d05.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/ab0fa32370e88a71f215287f29132e5d8cd83ab986b122d8a79f6ac06230fce9.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/23aadc313395dc4fcd5d77944a815787a872e89ce9ca7f5d179aedb5105ae9f2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/919a9920b57d71eb64ac8c4d52f7f3861a4d935989088bb6fa9603c3b32709a0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/0548aa3657414c0fb727c757e57bdc0e6ee328c66aeca25d7f9ca3f129481d3d.jpg)

form:

$$
\mathbf{x}_{B} = \mathbf{h}(\mathbf{z}_{B}, \mathbf{g}(\mathbf{z}_{A}, \mathbf{w}))\tag{18.15}
$$

where $\mathbf{h}(\mathbf{z}_{B}, \mathbf{g})$ is a function of $\mathbf{z}_{B}$ that is efficiently invertible for any given value of g and is called the coupling function. The function $\mathbf{g}(\mathbf{z}_{A}, \mathbf{w})$ is called a conditioner and is typically represented by a neural network.

We can illustrate the real NVP normalizing flow using a simple data set, sometimes known as ‘two moons’, as shown in Figure 18.3. Here a two-dimensional Gaussian distribution is transformed into a more complex distribution by using two successive layers each of which consists of alternate transformations on each of the two dimensions.

## 18.2. Autoregressive Flows

Section 11.1

A related formulation of normalizing flows can be motivated by noting that the joint distribution over a set of variables can always be written as the product of conditional distributions, one for each variable. We first choose an ordering of the variables in

Figure 18.4 Illustration of two alternative structures for autoregressive normalizing flows. The masked autoregressive flow shown in (a) allows efficient evaluation of the likelihood function, whereas the alternative inverse autoregressive flow shown in (b) allows for efficient sampling.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/ef6da2ac43157e2c94bc04f526462e460e0ea638e9553bdca562931aa90edd1e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/c425fba700da39ea329d489b0ff33d98152f44c5efc1c09a0bcec8684f7fe007.jpg)  
the vector x, from which we can write, without loss of generality,

$$
p(x_{1}, \dots, x_{D}) = \prod_{i = 1}^{D} p(x_{i} | \mathbf{x}_{1 : i - 1})\tag{18.16}
$$

where $\mathbf{x}_{1 : i - 1}$ denotes $x_{1}, \ldots, x_{i - 1}$ . This factorization can be used to construct a class of normalizing flow called a masked autoregressive flow, or MAF (Papamakarios, Pavlakou, and Murray, 2017), given by

$$
x_{i} = h(z_{i}, \mathbf{g}_{i}(\mathbf{x}_{1 : i - 1}, \mathbf{w}_{i}))\tag{18.17}
$$

which is illustrated in Figure 18.4(a). Here $h(z_{i}, \cdot)$ is the coupling function, which is chosen to be easily invertible with respect to $z_{i},$ , and ${\bf g}_{i}$ is the conditioner, which is typically represented by a deep neural network. The term masked refers to the use of a single neural network to implement a set of equations of the form (18.17) along with a binary mask (Germain et al., 2015) that force a subset of the network weights to be zero to implement the autoregressive constraint (18.16).

In this case the reverse calculations needed to evaluate the likelihood function are given by

$$
z_{i} = h^{- 1}(x_{i}, \mathbf{g}_{i}(\mathbf{x}_{1 : i - 1}, \mathbf{w}_{i}))\tag{18.18}
$$

and hence can be performed efficiently on modern hardware since the individual functions in (18.18) needed to evaluate $z_{1}, \dots, z_{D}$ can be evaluated in parallel. The Jacobian matrix corresponding to the set of transformations (18.18) has elements $\partial z_{i} / \partial x_{j}$ , which form an upper-triangular matrix whose determinant is given by the product of the diagonal elements and can therefore also be evaluated efficiently. However, sampling from this model must be done by evaluating (18.17), which is intrinsically sequential and therefore slow because the values of $x_{1}, \ldots, x_{i - 1}$ must be evaluated before $x_{i}$ can be computed.

To avoid this inefficient sampling, we can instead define an inverse autoregressive flows, or IAF (Kingma et al., 2016), given by

$$
x_{i} = h(z_{i}, \widetilde{\mathbf{g}}_{i}(\mathbf{z}_{1 : i - 1}, \mathbf{w}_{i}))\tag{18.19}
$$

as illustrated in Figure 18.4(b). Sampling is now efficient since, for a given choice of z, the evaluation of the elements $x_{1}, \ldots, x_{D}$ using (18.19) can be performed in parallel. However, the inverse function, which is needed to evaluate the likelihood, requires a series of calculations of the form

$$
z_{i} = h^{- 1}(x_{i}, \widetilde{\mathbf{g}}_{i}(\mathbf{z}_{1 : i - 1}, \mathbf{w}_{i})),\tag{18.20}
$$

which are intrinsically sequential and therefore slow. Whether a masked autoregressive flow or an inverse autoregressive flow is preferred will depend on the specific application.

We see that coupling flows and autoregressive flows are closely related. Although autoregressive flows introduce considerable flexibility, this comes with a computational cost that grows linearly in the dimensionality D of the data space due to the need for sequential ancestral sampling. Coupling flows can be viewed as a special case of autoregressive flows in which some of this generality is sacrificed for efficiency by dividing the variables into two groups instead of D groups.

## 18.3. Continuous Flows

The final approach to normalizing flows that we consider in this chapter will make use of deep neural networks defined in terms of an ordinary differential equation, or ODE. This can be thought of as a deep network with an infinite number of layers. We first introduce the concept of a neural ODE then we see how this can be applied to the formulation of a normalizing flow model.

## 18.3.1 Neural differential equations

We have seen that neural networks are especially useful when they comprise many layers of processing, and so we can ask what happens if we explore the limit of an infinitely large number of layers. Consider a residual network where each layer of processing generates an output given by the input vector with the addition of some parameterized nonlinear function of that input vector:

$$
\mathbf{z}^{(t + 1)} = \mathbf{z}^{(t)} + \mathbf{f} \left(\mathbf{z}^{(t)}, \mathbf{w} \right)\tag{18.21}
$$

where $t = 1, \dots, T$ labels the layers in the network. Note that we have used the same function at each layer, with a shared parameter vector w, because this allows us to consider an arbitrarily large number of such layers while keeping the number of parameters bounded. Imagine that we increase the number of layers while ensuring that the changes introduced at each layer become correspondingly smaller. In the limit, the hidden-unit activation vector becomes a function ${\bf z}(t)$ of a continuous variable t, and we can express the evolution of this vector through the network as a differential equation:

$$
\frac{d \mathbf{z}(\mathbf{t})}{d t} = \mathbf{f}(\mathbf{z}(t), \mathbf{w})\tag{18.22}
$$

where t is often referred to as ‘time’. The formulation in (18.22) is known as a neural ordinary differential equation or neural ODE (Chen et al., 2018). Here ‘ordinary

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/e68957a54128893fb0195e01bcaf5de1b440dcc28dd8dcbab888f72770ce6ce2.jpg)

![Figure 18.5](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/9c0b83eb6700e6e9b8e1a712124555e327058bc2239660fa3f4bbf51066c16a2.jpg)  
Figure 18.5 Comparison of a conventional layered network with a neural differential equation. The diagram on the left corresponds to a residual network with five layers and shows trajectories for several starting values of a single scalar input. The diagram on the right shows the result of numerical integration of a continuous neural ODE, again for several starting values of the scalar input, in which we see that the function is not evaluated at uniformly-spaced time intervals, but instead the evaluation points are chosen adaptively by the numerical solver and depend on the choice of input value. [From Chen et al. (2018) with permission.]

means that there is a single variable t. If we denote the input to the network by the vector ${\bf z}(0)$ , then the output ${\mathbf z}(T)$ is obtained by integration of the differential equation

$$
\mathbf{z}(T) = \int_{0}^{T} \mathbf{f} \left(\mathbf{z}(t), \mathbf{w} \right) d t.\tag{18.23}
$$

This integral can be evaluated using standard numerical integration packages. The simplest method for solving differential equations is Euler’s forward integration method, which corresponds to the expression (18.21). In practice, more powerful numerical integration algorithms can adapt their function evaluation to achieve. In particular, they can adaptively choose values of t that typically are not uniformly spaced. The number of such evaluations replaces the concept of depth in a conventional layered network. A comparison of a standard layered neural network and a neural differential equation are shown in Figure 18.5.

## 18.3.2 Neural ODE backpropagation

We now need to address the challenge of how to train a neural ODE, that is how to determine the value of w by optimizing a loss function. Let us assume that we are given a data set comprising values of the input vector ${\bf z}(0)$ along with an associated output target vector and a loss function $L(\cdot)$ that depends on the output vector ${\mathbf z}(T)$ One approach would be to use automatic differentiation to differentiate through all of the operations performed by the ODE solver during the forward pass. Although this is straightforward to do, it is costly from a memory perspective and is not optimal in terms of controlling numerical error. Instead, Chen et al. (2018) treat the ODE solver as a black box and use a technique called the adjoint sensitivity method, which can be viewed as the continuous analogue of explicit backpropagation. Recall that backpropagation involves, for each data point, three successive phases: first a forward propagation to evaluate the activation vectors at each layer of the network, second the evaluation of the derivatives of the loss with respect to the activations at each layer starting at the output and propagating backwards through the network by exploiting the chain rule of calculus, and third the evaluation of the derivatives with respect to network parameters by forming products of activations from the forward pass and gradients from the backward pass. We will see that there are analogous steps when computing the gradients for a neural ODE.

To apply backpropagation to neural ODEs, we define a quantity called the adjoint given by

$$
\mathbf{a}(t) ={\frac{d L}{d \mathbf{z}(t)}}.\tag{18.24}
$$

We see that ${\mathbf a}(T)$ corresponds to the usual derivative of the loss with respect to the output vector. The adjoint satisfies its own differential equation given by

$$
\frac{d \mathbf{a}(t)}{d t} = - \mathbf{a}(t)^{\mathrm{T}} \nabla_{\mathbf{z}} f(\mathbf{z}(t), \mathbf{w}),\tag{18.25}
$$

which is a continuous version of the chain rule of calculus. This can be solved by integrating backwards starting from ${\mathbf a}(T)$ , which again can be done using a blackbox ODE solver. In principle, this requires that we have stored the trajectory ${\bf z}(t)$ computed during the forward phase, which could be problematic as the inverse solver might wish to evaluate ${\bf z}(t)$ at different values of t compared to the forward solver. Instead we simply allow the backwards solver to recompute any required values of ${\bf z}(t)$ by integrating (18.22) alongside (18.25) starting with the output value ${\mathbf z}(T)$

The third step in the backpropagation method is to evaluate derivatives of the loss with respect to network parameters by forming appropriate products of activations and gradients. When a parameter value is shared across multiple connections in a network, the total derivative is formed from the sum of derivatives for each of the connections. For our neural ODE, in which the same parameter vector w is shared throughout the network, this summation becomes an integration over $t,$ which takes the form

$$
\nabla_{\mathbf{w}} L = - \int_{0}^{T} \mathbf{a}(t)^{\mathrm{T}} \nabla_{\mathbf{w}} f(\mathbf{z}(t), \mathbf{w}) d t.\tag{18.26}
$$

The derivatives $\nabla_{\mathbf{z}} f$ in (18.25) and $\nabla_{\mathbf{w}} f$ in (18.26) can be evaluated efficiently using automatic differentiation. Note that the above results can equally be applied to a more general neural network function $\mathbf{f}(\mathbf{z}(t), t, \mathbf{w})$ that has an explicit dependence on t in addition to the implicit dependence through ${\bf z}(t)$

One benefit of neural ODEs trained using the adjoint method, compared to conventional layered networks, is that there is no need to store the intermediate results of the forward propagation, and hence the memory cost is constant. Furthermore, neural ODEs can naturally handle continuous-time data in which observations occur at arbitrary times. If the error function L depends on values of ${\bf z}(t)$ other than the output value, then multiple runs of the reverse-model solver are required, with one run for each consecutive pair of outputs, so that the single solution is broken down into multiple consecutive solutions in order to access the intermediate states (Chen et al., 2018). Note that a high level of accuracy in the solver can be used during training, with a lower accuracy, and hence fewer function evaluations, during inference in applications for which compute resources are limited.

## 18.3.3 Neural ODE flows

We can make use of a neural ordinary differential equation to define an alternative approach to the construction of tractable normalizing flow models. A neural ODE defines a highly flexible transformation from an input vector ${\bf z}(0)$ to an output vector ${\mathbf z}(T)$ in terms of a differential equation of the form

$$
\frac{d{\mathbf{z}}(t)}{d t} = \mathbf{f}({\mathbf{z}}(t),{\mathbf{w}}).\tag{18.27}
$$

If we define a base distribution over the input vector $p(\mathbf{z}(0))$ then the neural ODE propagates this forward through time to give a distribution $p(\mathbf{z}(t))$ for each value of t, leading to a distribution over the output vector $p(\mathbf{z}(T))$ . Chen et al. (2018) showed that for neural ODEs, the transformation of the density can be evaluated by integrating a differential equation given by

$$
\frac{d \ln p(\mathbf{z}(t))}{d t} = - \mathrm{Tr} \left(\frac{\partial \mathbf{f}}{\partial \mathbf{z}(t)} \right)\tag{18.28}
$$

where $\partial \mathbf{f} / \partial \mathbf{z}$ represents the Jacobian matrix with elements $\partial f_{i} / \partial z_{j}$ . This integration can be performed using standard ODE solvers. Likewise, samples from this density can be obtained by sampling from the base density $p(\mathbf{z}(0))$ , which is chosen to be a simple distribution such as a Gaussian, and propagating the values to the output by integrating (18.27) again using the ODE solver. The resulting framework is known as a continuous normalizing flow and is illustrated in Figure 18.6. Continuous normalizing flows can be trained using the adjoint sensitivity method used for neural ODEs, which can be viewed as the continuous time equivalent of backpropagation.

Since (18.28) involves the trace of the Jacobian rather than the determinant, which arises in discrete normalizing flows, it might appear to be more computationally efficient. In general, evaluating the determinant of a $D \times D$ matrix requires $\mathcal{O} \dot{(} D^{3})$ operations, whereas evaluating the trace requires $\mathcal{O}(D)$ operations. However, if the determinant is lower diagonal, as in many forms of normalizing flow, then the determinant is the product of the diagonal terms and therefore also involves $\mathcal{O}(D)$ operations. Since evaluating the individual elements of the Jacobian matrix requires a separate forward propagation, which itself requires $\mathcal{O}(D)$ operations, evaluating the trace or the determinant (for a lower triangular matrix) takes $\mathcal{O}(D^{2})$ operations overall. However, the cost of evaluating the trace can be reduced to $\mathcal{O}(D)$ by using Hutchinson’s trace estimator (Grathwohl et al., 2018), which for a matrix

Figure 18.6 Illustration of a continuous normalizing flow showing a simple Gaussian distribution at $t ~ = ~ 0$ that is continuously transformed into a multimodal distribution at $t \ = \T$ The flow lines show how points along the z-axis evolve as a function of t. Where the flow lines spread apart the density is reduced, and where they move together the density is increased.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/66f6cf85cdcb6db0dcd2b58051b397bcb4d3978a9318aec0c5e129a217b677d5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b4ea71dd15d5db8d2e69120fffca4a6f0ec719dd543df25761884e9cf317852d.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/94453f62a87c711261b53c38b5ee6544540b66395295149469c119798c82571f.jpg)

A takes the form

$$
\operatorname{Tr}(\mathbf{A}) = \mathbb{E}_{\epsilon} \left[\epsilon^{\mathrm{T}} \mathbf{A} \epsilon \right]\tag{18.29}
$$

where $\epsilon$ is a random vector whose distribution has zero mean and unit covariance, for example, a Gaussian $\mathcal{N}(\mathbf{0}, \mathbf{I})$ . For a specific $\epsilon$, the matrix-vector product A$\epsilon$ can be evaluated efficiently in a single pass using reverse-mode automatic differentiation. We can then approximate the trace using a finite number of samples in the form

$$
\mathrm{Tr}(\mathbf{A}) \simeq \frac{1}{M} \sum_{m = 1}^{M} \epsilon_{m}^{\mathrm{T}} \mathbf{A} \epsilon_{m}.\tag{18.30}
$$

In practice we can set $M = 1$ and just use a single sample, which is refreshed for each new data point. Although this is a noisy estimate, this might not be too significant since it forms part of a noisy stochastic gradient descent procedure. Importantly it is unbiased, meaning that the expectation of the estimator is equal to the true value.

Significant improvements in training efficiency for continuous normalizing flows can be achieved using a technique called flow matching (Lipman et al., 2022). This brings normalizing flows closer to diffusion models and avoids the need for backpropagation through the integrator while significantly reducing memory requirements and enabling faster inference and more stable training.

## Exercises

18.1 (? ?) Consider a transformation $\textbf{x} = \textbf{f}(\textbf z)$ along with its inverse ${\textbf{z}} ={\bf g}({\bf x})$ . By differentiating $\mathbf{x} = \mathbf{f}(\mathbf{g}(\mathbf{x}))$ , show that

$$
\mathbf{J} \mathbf{K} = \mathbf{I}\tag{18.31}
$$

where I is the identity matrix, and J and K are matrices with elements

$$
J_{ij} = \frac{\partial g_{i}}{\partial x_{j}}, \qquad K_{ij} = \frac{\partial f_{i}}{\partial z_{j}}.\tag{18.32}
$$

Using the result that the determinant of a product of matrices is the product of their determinants, show that

$$
\operatorname{det}(\mathbf{J}) ={\frac{1}{\operatorname{det}(\mathbf{K})}}.\tag{18.33}
$$

Hence, show that the formula (18.1) for the transformation of a density under a change of variables can be rewritten as

$$
p_{\mathbf{x}}(\mathbf{x}) = p_{\mathbf{z}}(\mathbf{g}(\mathbf{x})) \left| \operatorname{det} \mathbf{K} \right|^{- 1}\tag{18.34}
$$

where K is evaluated at ${\bf z} ={\bf g}({\bf x})$

18.2 (?) Consider a sequence of invertible transformations of the form

$$
\mathbf{x} = \mathbf{f}_{1}(\mathbf{f}_{2}(\cdot \cdot \cdot \mathbf{f}_{M - 1}(\mathbf{f}_{M}(\mathbf{z})) \cdot \cdot \cdot)).\tag{18.35}
$$

Show that the inverse function is given by

$$
\mathbf{z} = \mathbf{f}_{M}^{- 1}(\mathbf{f}_{M - 1}^{- 1}(\cdot \cdot \cdot \mathbf{f}_{2}^{- 1}(\mathbf{f}_{1}^{- 1}(\mathbf{x})) \cdot \cdot \cdot)).\tag{18.36}
$$

18.3 (?) Consider a linear change of variables of the form

$$
{\mathbf{x}} ={\mathbf{z}} +{\mathbf{b}}.\tag{18.37}
$$

Show that the Jacobian of this transformation is the identity matrix. Interpret this result by comparing the volume of a small region of z-space with the volume of the corresponding region of x-space.

18.4 (? ?) Show that the Jacobian of the autoregressive normalizing flow transformation given by (18.18) is a lower triangular matrix. The determinant of such a matrix is given by the product of the terms on the leading diagonal and is therefore easily evaluated.

18.5 (?) Consider the forward propagation equation for a residual network given by (18.21) in which we consider a small increment $\epsilon$ in the ‘time’ variable t:

$$
\begin{array}{r}{{\bf z}^{(t + \epsilon)} ={\bf z}^{(t)} + \epsilon{\bf f}({\bf z}^{(t)},{\bf w}).} \end{array}\tag{18.38}
$$

Here the additive contribution from the neural network is scaled by $\epsilon$. Note that (18.21) corresponds to the case $\epsilon = 1$ . By taking the limit $\epsilon \to 0$ , derive the forward propagation differential equation given by (18.22).

18.6 (? ?) In this exercise and the next we provide an informal derivation of the backpropagation and gradient evaluation equations for a neural ODE. A more formal derivation of these results can be found in Chen et al. (2018). Write down the backpropagation equation corresponding to the forward equation (18.38). By taking the limit $\epsilon 0$ derive the backward propagation equation (18.25), where ${\bf a}(t)$ is defined by (18.24).

18.7 (? ?) By making use of the result (8.10), write down an expression for the gradient of a loss function $L(\mathbf{z}(T))$ for a multilayered residual network defined by (18.38) in which all layers share the same parameter vector w. By taking the limit $\epsilon 0$ derive the equation (18.26) for the derivative of the loss function.

18.8 (★★★) In this exercise we give an informal derivation of (18.28) for one-dimensional distributions. Consider a distribution $q(z)$ at time t that is transformed to a new distribution $p(x)$ at time $t + \delta t$ as a result of a transformation from $z \ \mathrm{to} \x.$ . Also consider nearby values z and $z + \Delta z$ along with corresponding values x and $x +$ $\Delta x$ as shown in Figure 18.7. First, write down an equation that expresses that the probability mass in the interval $\Delta z$ is the same as that in the interval $\Delta x$ . Second, write down an equation that shows how the probability density changes in going from t to $t + \delta t$ , expressed in terms of the derivative $d q(t) / d t$ . Third, write down an equation for $\Delta x$ in terms of $\Delta z$ by introducing the function $f(z) = d z / d t$ . Finally, by combining these three equations and taking the limit $\delta t \to 0$ , show that

$$
\frac{d}{d t} \ln q(z) = - f^{\prime}(z),\tag{18.39}
$$

which is the one-dimensional version of (18.28).

Figure 18.7 Schematic illustration of the transformation of probability densities used to derive the equation for continuous normalizing flows in one dimension.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/c8637b4a39cff55f4fb890b37a2230e2b5876a2de53cf871f337b11d46dbb03a.jpg)

18.9 (? ?) The flow lines in Figure 18.6 were plotted by taking a set of equally spaced values and using the inverse of the cumulative distribution function at each value of t to plot the corresponding points in z-space. Show that this is equivalent to using the differential equation (18.27) to compute the flow lines where $f$ is defined by (18.28).

18.10 (? ?) Using the differential equation (18.27) write down an expression for the base density of a continuous normalizing flow in terms of the output density, expressed as an integral over t. Hence, by making use of the fact that changing the sign of a definite integral is equivalent to swapping the limits on that integral, show that the computational cost of inverting a continuous normalizing flow is the same as that needed to evaluate the forward flow.

18.11 (?) Show that the expectation of the right-hand side in the Hutchinson trace estimator (18.30) is equal to Tr(A) for any value of M . This shows that the estimator is unbiased.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b7817ea6573e1a42dcaffe37d0a522e6246f08bb9fb572da66de38cbc2c4e6f0.jpg)

A central goal of deep learning is to discover representations of data that are useful for one or more subsequent applications. One well-established approach to learning internal representations is called the auto-associative neural network or autoencoder. This consists of a neural network having the same number of output units as inputs and which is trained to generate an output y that is close to the input x. Once trained, an internal layer within the neural network gives a representation z(x) for each new input. Such a network can be viewed as having two parts. The first is an encoder, which maps the input x into a hidden representation z(x), and the second is a decoder, which maps the hidden representation onto the output y(z).

If an autoencoder is to find non-trivial solutions, it is necessary to introduce some form of constraint, otherwise the network can simply copy the input values to the outputs. This constraint might be achieved, for example, by restricting the dimensionality of z relative to that of x or by requiring z to have a sparse representation. Alternatively, the network can be forced to discover non-trivial solutions by modifying the training process such that the network has to learn to undo corruptions to the input vectors such as additive noise or missing values. These kinds of constraint encourage the network to discover interesting structure within the data to achieve good training performance.

In this chapter, we start with deterministic autoencoders and then later generalize to stochastic models that learn an encoder distribution $p(\mathbf{z} | \mathbf{x})$ together with a decoder distribution $p(\mathbf{y} \vert \mathbf{z})$ . These probabilistic models are known as variational autoencoders and represent the third of our four approaches to learning nonlinear latent variable models.


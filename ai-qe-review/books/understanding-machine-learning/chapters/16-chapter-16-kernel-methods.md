---
title: "Chapter 16 \u2014 Kernel Methods"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 16
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 5386
source_line_end: 5711
source_pdf_page_range: null
review_status: machine-verified
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
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
  - machine-learning
  - official-syllabus
---

# Chapter 16 — Kernel Methods

> [[../README|本书目录]] · [[15-chapter-15-support-vector-machines|上一章]] · [[17-chapter-17-multiclass-ranking-and-complex-prediction-problems|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 5386–5711。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 2；sufficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 16.1 Embeddings into Feature Spaces

The expressive power of halfspaces is rather restricted – for example, the following training set is not separable by a halfspace.

Let the domain be the real line; consider the domain points $\{- 10, - 9, - 8, \ldots, 0.$ $1, \ldots, 9, 10\}$ where the labels $\mathrm{are} + 1$ for all x such that $| x | > 2$ and −1 otherwise.

To make the class of halfspaces more expressive, we can first map the original instance space into another space (possibly of a higher dimension) and then learn a halfspace in that space. For example, consider the example mentioned previously. Instead of learning a halfspace in the original representation let us first define a mapping $\psi : \mathbb{R} \to \mathbb{R}^{2}$ as follows:

$$
\psi(x) =(x, x^{2}).
$$

We use the term feature space to denote the range of $\psi.$ After applying ψ the data can be easily explained using the halfspace $h(x) = \mathrm{sign}(\langle \mathbf{w}, \psi(x) \rangle - b)$ where $\mathbf{w} =(0, 1)$ and $b = 5$

The basic paradigm is as follows:

1. Given some domain set $\mathcal{X}$ and a learning task, choose a mapping $\psi : \mathcal{X} \mathcal{F},$ for some feature space ${\mathcal{F}}_{:}$ , that will usually be $\mathbb{R}^{n}$ for some n (however, the range of such a mapping can be any Hilbert space, including such spaces of infinite dimension, as we will show later).

2. Given a sequence of labeled examples, $S =(\mathbf{x}_{1}, y_{1}), \dots,(\mathbf{x}_{m}, y_{m})$ , create the image sequence $\hat{S} =(\psi(\mathbf{x}_{1}), y_{1}), \ldots,(\psi(\mathbf{x}_{m}), y_{m})$

3. Train a linear predictor h over $\hat{S}.$

4. Predict the label of a test point, $\mathbf{x},$ to be $h(\psi(\mathbf{x}))$ .

Note that, for every probability distribution D over $\mathcal{X} \times \mathcal{V}$ , we can readily define its image probability distribution $\mathcal{D}^{\psi}$ over $\mathcal{F} \times \mathcal{V}$ by setting, for every subset $A \subseteq{\mathcal{F}} \times{\mathcal{Y}},{\mathcal{D}}^{\psi}(A) ={\mathcal{D}}(\psi^{- 1}(A)).$ .<sup>1</sup> It follows that for every predictor h over the feature space, $L_{\mathcal{D}^{\psi}}(h) = L_{\mathcal{D}}(h \circ \psi)$ , where $h \circ \psi$ is the composition of h onto ψ.

The success of this learning paradigm depends on choosing a good $\psi$ for a given learning task: that is, $\mathrm{~ a ~} \psi$ that will make the image of the data distribution (close to being) linearly separable in the feature space, thus making the resulting algorithm a good learner for a given task. Picking such an embedding requires prior knowledge about that task. However, often some generic mappings that enable us to enrich the class of halfspaces and extend its expressiveness are used. One notable example is polynomial mappings, which are a generalization of the ψ we have seen in the previous example.

Recall that the prediction of a standard halfspace classifier on an instance x is based on the linear mapping $\mathbf{x} \mapsto \langle \mathbf{w}, \mathbf{x} \rangle$ . We can generalize linear mappings to a polynomial mapping, $\mathbf{x} \mapsto p(\mathbf{x})$ , where $p$ is a multivariate polynomial of degree k. For simplicity, consider first the case in which x is 1 dimensional. In that case, $\begin{array}{r}{p(x) = \sum_{j = 0}^{k} w_{j} x^{j}} \end{array}$ , where $\mathbf{w} \in \mathbb{R}^{k + 1}$ is the vector of coeficients of the polynomial we need to learn. We can rewrite $p(x) = \langle \mathbf{w}, \psi(x) \rangle$ i where $\psi : \mathbb{R} \to \mathbb{R}^{k + 1}$ is the mapping $x \mapsto(1, \x, \x^{2}, \x^{3}, \ldots, x^{k})$ . It follows that learning a k degree polynomial over <sup>R</sup> can be done by learning a linear mapping in the $(k + 1)$ dimensional feature space.

More generally, a degree k multivariate polynomial from $\mathbb{R}^{n}$ to <sup>R</sup> can be written as

$$
p(\mathbf{x}) = \sum_{J \in[n]^{r}: r \leq k} w_{J} \prod_{i = 1}^{r} x_{J_{i}}.\tag{16.1}
$$

As before, we can rewrite $p(\mathbf{x}) = \langle \mathbf{w}, \psi(\mathbf{x}) \rangle$ where now $\psi : \mathbb{R}^{n} \mathbb{R}^{d}$ is such that for every $J \in[n]^{r}, r \leq k$ , the coordinate of $\psi(\mathbf{x})$ associated with J is the monomial $\Pi_{i = 1}^{r} x_{J_{i}}$

Naturally, polynomial-based classifiers yield much richer hypothesis classes than halfspaces. We have seen at the beginning of this chapter an example in which the training set, in its original domain $(\mathcal{X} = \mathbb{R})$ , cannot be separable by a halfspace, but after the embedding $x \mapsto(x, \x^{2})$ it is perfectly separable. So, while the classifier is always linear in the feature space, it can have highly nonlinear behavior on the original space from which instances were sampled.

In general, we can choose any feature mapping ψ that maps the original instances into some Hilbert space.<sup>2</sup> The Euclidean space $\mathbb{R}^{d}$ is a Hilbert space for any finite d. But there are also infinite dimensional Hilbert spaces (as we shall see later on in this chapter).

The bottom line of this discussion is that we can enrich the class of halfspaces by first applying a nonlinear mapping, $\psi_{:}$ that maps the instance space into some feature space, and then learning a halfspace in that feature space. However, if the range of ψ is a high dimensional space we face two problems. First, the VCdimension of halfspaces in $\mathbb{R}^{n}$ is $n + 1$ , and therefore, if the range of $\psi$ is very large, we need many more samples in order to learn a halfspace in the range of ψ. Second, from the computational point of view, performing calculations in the high dimensional space might be too costly. In fact, even the representation of the vector w in the feature space can be unrealistic. The first issue can be tackled using the paradigm of large margin (or low norm predictors), as we already discussed in the previous chapter in the context of the SVM algorithm. In the following section we address the computational issue.

## 16.2 The Kernel Trick

We have seen that embedding the input space into some high dimensional feature space makes halfspace learning more expressive. However, the computational complexity of such learning may still pose a serious hurdle – computing linear separators over very high dimensional data may be computationally expensive. The common solution to this concern is kernel based learning. The term “kernels” is used in this context to describe inner products in the feature space. Given an embedding $\psi$ of some domain space X into some Hilbert space, we define the kernel function $K(\mathbf{x}, \mathbf{x}^{\prime}) = \langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle$ i. One can think of $K$ as specifying similarity between instances and of the embedding ψ as mapping the domain set

X into a space where these similarities are realized as inner products. It turns out that many learning algorithms for halfspaces can be carried out just on the basis of the values of the kernel function over pairs of domain points. The main advantage of such algorithms is that they implement linear separators in high dimensional feature spaces without having to specify points in that space or expressing the embedding ψ explicitly. The remainder of this section is devoted to constructing such algorithms.

In the previous chapter we saw that regularizing the norm of w yields a small sample complexity even if the dimensionality of the feature space is high. Interestingly, as we show later, regularizing the norm of w is also helpful in overcoming the computational problem. To do so, first note that all versions of the SVM optimization problem we have derived in the previous chapter are instances of the following general problem:

$$
\min_{\mathbf{w}} \left(f \left(\langle \mathbf{w}, \psi(\mathbf{x}_{1}) \rangle, \dots, \langle \mathbf{w}, \psi(\mathbf{x}_{m}) \rangle\right) + R(\| \mathbf{w} \|)\right),\tag{16.2}
$$

where $f : \mathbb{R}^{m} \mathbb{R}$ is an arbitrary function and $R : \mathbb{R}_{+} \to \mathbb{R}$ is a monotonically nondecreasing function. For example, Soft-SVM for homogenous halfspaces (Equation (15.6)) can be derived from Equation (16.2) by letting $R(a) = \lambda a^{2}$ and $\begin{array}{r}{f(a_{1}, \ldots, a_{m}) = \frac{1}{m} \sum_{i}} \end{array}$ max $\{0, 1 - y_{i} a_{i}\}$ . Similarly, Hard-SVM for nonhomogenous halfspaces (Equation (15.2)) can be derived from Equation (16.2) by letting $\begin{array}{l}{{\displaystyle R(a) ~ = ~ a^{2}}} \end{array}$ and letting $f(a_{1}, \ldots, a_{m})$ be 0 if there exists b such that $y_{i}(a_{i} + b) \geq 1$ for all $i,$ and $f(a_{1}, \dots, a_{m}) = \infty$ otherwise.

The following theorem shows that there exists an optimal solution of Equation (16.2) that lies in the span of $\{\psi(\mathbf{x}_{1}), \hdots, \psi(\mathbf{x}_{m})\}$

<sup>theorem</sup> 16.1 (Representer Theorem) Assume that ψ is a mapping from X to a Hilbert space. Then, there exists a vector $\pmb{\alpha} \in \mathbb{R}^{m}$ such that $\begin{array}{r}{\mathbf{w} = \sum_{i = 1}^{m} \alpha_{i} \psi(\mathbf{x}_{i})} \end{array}$ is an optimal solution of Equation (16.2).

Proof Let $\mathbf{w}^{\star}$ be an optimal solution of Equation (16.2). Because $\mathbf{w}^{\star}$ is an element of a Hilbert space, we can rewrite $\mathbf{w}^{\star}$ as

$$
\mathbf{w}^{\star} = \sum_{i = 1}^{m} \alpha_{i} \psi(\mathbf{x}_{i}) + \mathbf{u},
$$

where $\langle{\bf u}, \psi({\bf x}_{i}) \rangle = 0$ for all i. Set $\mathbf{w} = \mathbf{w}^{\star} - \mathbf{u}$ . Clearly, $\| \mathbf{w}^{\star} \|^{2} = \| \mathbf{w} \|^{2} + \| \mathbf{u} \|^{2}$ thus $\| \mathbf{w} \| \leq \| \mathbf{w}^{\star} \|$ . Since R is nondecreasing we obtain that $R(\| \mathbf{w} \|) \leq R(\| \mathbf{w}^{\star} \|)$ Additionally, for all i we have that

$$
\langle \mathbf{w}, \psi(\mathbf{x}_{i}) \rangle = \langle \mathbf{w}^{\star} - \mathbf{u}, \psi(\mathbf{x}_{i}) \rangle = \langle \mathbf{w}^{\star}, \psi(\mathbf{x}_{i}) \rangle,
$$

hence

$$
f \left(\langle \mathbf{w}, \psi(\mathbf{x}_{1}) \rangle, \dots, \langle \mathbf{w}, \psi(\mathbf{x}_{m}) \rangle\right) = f \left(\langle \mathbf{w}^{\star}, \psi(\mathbf{x}_{1}) \rangle, \dots, \langle \mathbf{w}^{\star}, \psi(\mathbf{x}_{m}) \rangle\right).
$$

We have shown that the objective of Equation (16.2) at w cannot be larger than the objective at $\mathbf{w}^{\star}$ and therefore w is also an optimal solution. Since $\begin{array}{r}{\mathbf{w} = \sum_{i = 1}^{m} \alpha_{i} \psi(\mathbf{x}_{i})} \end{array}$ we conclude our proof. □

On the basis of the representer theorem we can optimize Equation (16.2) with respect to the coeficients α instead of the coeficients w as follows. Writing $\begin{array}{r}{\mathbf{w} = \sum_{j = 1}^{m} \alpha_{j} \psi(\mathbf{x}_{j})} \end{array}$ we have that for all i

$$
\langle \mathbf{w}, \psi(\mathbf{x}_{i}) \rangle = \left\langle \sum_{j} \alpha_{j} \psi(\mathbf{x}_{j}), \psi(\mathbf{x}_{i}) \right\rangle = \sum_{j = 1}^{m} \alpha_{j} \langle \psi(\mathbf{x}_{j}), \psi(\mathbf{x}_{i}) \rangle.
$$

Similarly,

$$
\| \mathbf{w} \|^{2} = \left\langle \sum_{j} \alpha_{j} \psi(\mathbf{x}_{j}), \sum_{j} \alpha_{j} \psi(\mathbf{x}_{j}) \right\rangle = \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} \langle \psi(\mathbf{x}_{i}), \psi(\mathbf{x}_{j}) \rangle.
$$

Let $K(\mathbf{x}, \mathbf{x}^{\prime}) = \langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle$ be a function that implements the kernel function with respect to the embedding ψ. Instead of solving Equation (16.2) we can solve the equivalent problem

$$
\begin{array}{l} \underset{\boldsymbol{\alpha} \in \mathbb{R}^{m}}{\min} f \left(\sum_{j = 1}^{m} \alpha_{j} K(\mathbf{x}_{j}, \mathbf{x}_{1}), \ldots, \sum_{j = 1}^{m} \alpha_{j} K(\mathbf{x}_{j}, \mathbf{x}_{m})\right) \\ + R \left(\sqrt{\sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} K(\mathbf{x}_{j}, \mathbf{x}_{i})}\right).\end{array}\tag{16.3}
$$

To solve the optimization problem given in Equation (16.3), we do not need any direct access to elements in the feature space. The only thing we should know is how to calculate inner products in the feature space, or equivalently, to calculate the kernel function. In fact, to solve Equation (16.3) we solely need to know the value of the $m \times m$ matrix G s.t. $G_{i, j} = K(\mathbf{x}_{i}, \mathbf{x}_{j})$ , which is often called the Gram matrix.

In particular, specifying the preceding to the Soft-SVM problem given in Equation (15.6), we can rewrite the problem as

$$
\min_{\boldsymbol{\alpha} \in \mathbb{R}^{m}} \left(\lambda \boldsymbol{\alpha}^{T} G \boldsymbol{\alpha} + \frac{1}{m} \sum_{i = 1}^{m} \max \left\{0, 1 - y_{i}(G \boldsymbol{\alpha})_{i} \right\}\right),\tag{16.4}
$$

where $(G \pmb{\alpha})_{i}$ is the i’th element of the vector obtained by multiplying the Gram matrix G by the vector α. Note that Equation (16.4) can be written as quadratic programming and hence can be solved eficiently. In the next section we describe an even simpler algorithm for solving Soft-SVM with kernels.

Once we learn the coeficients α we can calculate the prediction on a new instance by

$$
\langle \mathbf{w}, \psi(\mathbf{x}) \rangle = \sum_{j = 1}^{m} \alpha_{j} \langle \psi(\mathbf{x}_{j}), \psi(\mathbf{x}) \rangle = \sum_{j = 1}^{m} \alpha_{j} K(\mathbf{x}_{j}, \mathbf{x}).
$$

The advantage of working with kernels rather than directly optimizing w in the feature space is that in some situations the dimension of the feature space is extremely large while implementing the kernel function is very simple. A few examples are given in the following.

Example 16.1 (Polynomial Kernels) The k degree polynomial kernel is defined to be

$$
K(\mathbf{x}, \mathbf{x}^{\prime}) =(1 + \langle \mathbf{x}, \mathbf{x}^{\prime} \rangle)^{k}.
$$

Now we will show that this is indeed a kernel function. That is, we will show that there exists a mapping ψ from the original space to some higher dimensional space for which $K(\mathbf{x}, \mathbf{x}^{\prime}) = \langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle$ i. For simplicity, denote $x_{0} = x_{0}^{\prime} = 1$ Then, we have

$$
\begin{array}{l} K(\mathbf{x}, \mathbf{x}^{\prime}) =(1 + \langle \mathbf{x}, \mathbf{x}^{\prime} \rangle)^{k} =(1 + \langle \mathbf{x}, \mathbf{x}^{\prime} \rangle) \cdot \dots \cdot(1 + \langle \mathbf{x}, \mathbf{x}^{\prime} \rangle) \\ \qquad = \left(\sum_{j = 0}^{n} x_{j} x_{j}^{\prime}\right) \cdot \dots \cdot \left(\sum_{j = 0}^{n} x_{j} x_{j}^{\prime}\right) \\ \qquad = \sum_{J \in \{0, 1, \ldots, n\}^{k}} \prod_{i = 1}^{k} x_{J_{i}} x_{J_{i}}^{\prime} \\ \qquad = \sum_{J \in \{0, 1, \ldots, n\}^{k}} \prod_{i = 1}^{k} x_{J_{i}} \prod_{i = 1}^{k} x_{J_{i}}^{\prime}.\end{array}
$$

Now, if we define $\psi : \mathbb{R}^{n} \mathbb{R}^{(n + 1)^{k}}$ such that for $J \in \{0, \1, \ldots, n\}^{k}$ there is an element of $\psi(\mathbf{x})$ that equals $\textstyle \prod_{i = 1}^{k} x_{J_{i}}$ , we obtain that

$$
K(\mathbf{x}, \mathbf{x}^{\prime}) = \langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle.
$$

Since $\psi$ contains all the monomials up to degree k, a halfspace over the range of $\psi$ corresponds to a polynomial predictor of degree k over the original space. Hence, learning a halfspace with a k degree polynomial kernel enables us to learn polynomial predictors of degree k over the original space.

Note that here the complexity of implementing K is $O(n)$ while the dimension of the feature space is on the order of $n^{k}$

Example 16.2 (Gaussian Kernel) Let the original instance space be <sup>R</sup> and consider the mapping $\psi$ where for each nonnegative integer $n \geq 0$ there exists an element $\psi(x)_{\uparrow}$ <sub>n</sub> that equals ${\frac{1}{\sqrt{n !}}} e^{-{\frac{x^{2}}{2}}} x^{n}$ . Then,

$$
\begin{array}{rl} &{\langle \psi(x), \psi(x^{\prime}) \rangle = \sum_{n = 0}^{\infty} \left(\frac{1}{\sqrt{n !}} e^{- \frac{x^{2}}{2}} x^{n}\right) \left(\frac{1}{\sqrt{n !}} e^{- \frac{(x^{\prime})^{2}}{2}}(x^{\prime})^{n}\right)} \\ &{\qquad = e^{- \frac{x^{2} +(x^{\prime})^{2}}{2}} \sum_{n = 0}^{\infty} \left(\frac{(xx^{\prime})^{n}}{n !}\right)} \\ &{\qquad = e^{- \frac{\| x - x^{\prime} \|^{2}}{2}}.} \end{array}
$$

Here the feature space is of infinite dimension while evaluating the kernel is very simple. More generally, given a scalar $\sigma > 0$ , the Gaussian kernel is defined to be

$$
K(\mathbf{x}, \mathbf{x}^{\prime}) = e^{- \frac{\| \mathbf{x} - \mathbf{x}^{\prime} \|^{2}}{2 \sigma}}.
$$

Intuitively, the Gaussian kernel sets the inner product in the feature space between $\mathbf{x}, \mathbf{x}^{\prime}$ to be close to zero if the instances are far away from each other (in the original domain) and close to 1 if they are close. $\sigma$ is a parameter that controls the scale determining what we mean by “close.” It is easy to verify that K implements an inner product in a space in which for any n and any monomial of order k there exists an element of $\psi(\mathbf{x})$ that equals $\begin{array}{r}{{\frac{1}{\sqrt{n !}}} e^{-{\frac{\| \mathbf{x} \|^{\angle}}{2}}} \prod_{i = 1}^{n} x_{J_{i}}} \end{array}$ Hence, we can learn any polynomial predictor over the original space by using a Gaussian kernel.

Recall that the VC-dimension of the class of all polynomial predictors is infinite (see Exercise 12). There is no contradiction, because the sample complexity required to learn with Gaussian kernels depends on the margin in the feature space, which will be large if we are lucky, but can in general be arbitrarily small.

The Gaussian kernel is also called the RBF kernel, for “Radial Basis Functions.”

## 16.2.1 Kernels as a Way to Express Prior Knowledge

As we discussed previously, a feature mapping, ψ, may be viewed as expanding the class of linear classifiers to a richer class (corresponding to linear classifiers over the feature space). However, as discussed in the book so far, the suitability of any hypothesis class to a given learning task depends on the nature of that task. One can therefore think of an embedding $\psi$ as a way to express and utilize prior knowledge about the problem at hand. For example, if we believe that positive examples can be distinguished by some ellipse, we can define ψ to be all the monomials up to order 2, or use a degree 2 polynomial kernel.

As a more realistic example, consider the task of learning to find a sequence of characters (“signature”) in a file that indicates whether it contains a virus or not. Formally, let $\mathcal{X}_{d}$ be the set of all strings of length at most d over some alphabet set Σ. The hypothesis class that one wishes to learn is $\mathcal{H} = \{h_{v} : v \in \mathcal{X}_{d}\}$ , where, for a string $x \in \mathcal{X}_{d}, h_{v}(x)$ is 1 if v is a substring of x (and $h_{v}(x) = - 1$ otherwise). Let us show how using an appropriate embedding this class can be realized by linear classifiers over the resulting feature space. Consider a mapping ψ to a space $\mathbb{R}^{s}$ where $\boldsymbol{s} = | \mathcal{X}_{d} |$ , so that each coordinate of $\psi(x)$ corresponds to some string v and indicates whether v is a substring of x (that is, for every $x \in \mathcal{X}_{d}, \psi(x)$ is a vector in $\{0, 1\}^{| \mathcal{X}_{d} |})$ . Note that the dimension of this feature space is exponential in d. It is not hard to see that every member of the class H can be realized by composing a linear classifier over $\psi(x)$ , and, moreover, by such a halfspace whose norm is 1 and that attains a margin of 1 (see Exercise 1). Furthermore, for every $x \in{\mathcal{X}}, \| \psi(x) \| = O(d)$ . So, overall, it is learnable using SVM with a sample complexity that is polynomial in d. However, the dimension of the feature space is exponential in d so a direct implementation of SVM over the feature space is problematic. Luckily, it is easy to calculate the inner product in the feature space $({\mathrm{i.e.}}$ , the kernel function) without explicitly mapping instances into the feature space. Indeed, $K(x, x^{\prime})$ is simply the number of common substrings of x and $x^{\prime}{\mathrm{.}}$ which can be easily calculated in time polynomial in $d.$

This example also demonstrates how feature mapping enables us to use halfspaces for nonvectorial domains.

## 16.2.2 Characterizing Kernel Functions\*

As we have discussed in the previous section, we can think of the specification of the kernel matrix as a way to express prior knowledge. Consider a given similarity function of the form $K : \mathcal{X} \times \mathcal{X} \mathbb{R}$ . Is it a valid kernel function? That is, does it represent an inner product between $\psi(\mathbf{x})$ and $\psi(\mathbf{x}^{\prime})$ for some feature mapping $\psi ?$ The following lemma gives a sufficient and necessary condition.

<sup>lemma</sup> 16.2 A symmetric function $K : \mathcal{X} \times \mathcal{X} \mathbb{R}$ implements an inner product in some Hilbert space if and only if it is positive semidefinite; namely, for all $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ , the Gram matrix, $G_{i, j} = K(\mathbf{x}_{i}, \mathbf{x}_{j})$ , is a positive semidefinite matrix.

Proof It is trivial to see that if K implements an inner product in some Hilbert space then the Gram matrix is positive semidefinite. For the other direction, define the space of functions over X as $\mathbb{R}^{\mathcal{X}} = \{f : \mathcal{X} \mathbb{R}\}$ . For each $\mathbf{x} \in \mathcal{X}$ let $\psi(\mathbf{x})$ be the function $\mathbf{x} \mapsto K(\cdot, \mathbf{x})$ . Define a vector space by taking all linear combinations of elements of the form $K(\cdot, \mathbf{x})$ . Define an inner product on this vector space to be

$$
\left\langle \sum_{i} \alpha_{i} K(\cdot, \mathbf{x}_{i}), \sum_{j} \beta_{j} K(\cdot, \mathbf{x}_{j}^{\prime}) \right\rangle = \sum_{i, j} \alpha_{i} \beta_{j} K(\mathbf{x}_{i}, \mathbf{x}_{j}^{\prime}).
$$

This is a valid inner product since it is symmetric (because K is symmetric), it is linear (immediate), and it is positive definite (it is easy to see that $K(\mathbf{x}, \mathbf{x}) \geq 0$ with equality only for $\psi(\mathbf{x})$ being the zero function). Clearly,

$$
\langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle = \langle K(\cdot, \mathbf{x}), K(\cdot, \mathbf{x}^{\prime}) \rangle = K(\mathbf{x}, \mathbf{x}^{\prime}),
$$

which concludes our proof.

## 16.3 Implementing Soft-SVM with Kernels

Next, we turn to solving Soft-SVM with kernels. While we could have designed an algorithm for solving Equation (16.4), there is an even simpler approach that directly tackles the Soft-SVM optimization problem in the feature space,

$$
\min_{\mathbf{w}} \left(\frac{\lambda}{2} \| \mathbf{w} \|^{2} + \frac{1}{m} \sum_{i = 1}^{m} \max \{0, 1 - y \langle \mathbf{w}, \psi(\mathbf{x}_{i}) \rangle\}\right),\tag{16.5}
$$

while only using kernel evaluations. The basic observation is that the vector $\mathbf{w}^{(t)}$ maintained by the SGD procedure we have described in Section 15.5 is always in the linear span of $\{\psi(\mathbf{x}_{1}), \hdots, \psi(\mathbf{x}_{m})\}$ . Therefore, rather than maintaining $\mathbf{w}^{(t)}$ we can maintain the corresponding coeficients $_{\pmb{\alpha}}$

Formally, let K be the kernel function, namely, for all $\begin{array}{r}{\mathbf{x}, \mathbf{x}^{\prime}, \K(\mathbf{x}, \mathbf{x}^{\prime}) \ =} \end{array}$ $\langle \psi(\mathbf{x}), \psi(\mathbf{x}^{\prime}) \rangle$ i. We shall maintain two vectors in $\mathbb{R}^{m}$ , corresponding to two vectors ${\pmb \theta}^{(t)}$ and $\mathbf{w}^{(t)}$ defined in the SGD procedure of Section 15.5. That is, $\beta^{(t)}$ will be a vector such that

$$
\pmb{\theta}^{(t)} = \sum_{j = 1}^{m} \beta_{j}^{(t)} \psi(\mathbf{x}_{j})\tag{16.6}
$$

and $\mathbf{\alpha}_{\alpha}(t)$ be such that

$$
\mathbf{w}^{(t)} = \sum_{j = 1}^{m} \alpha_{j}^{(t)} \psi(\mathbf{x}_{j}).\tag{16.7}
$$

The vectors $\beta$ and α are updated according to the following procedure.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
SGD for Solving Soft-SVM with Kernels
Goal: Solve Equation (16.5)
parameter: T
Initialize:  $\boldsymbol{\beta}^{(1)} = \mathbf{0}$ 
for  $t = 1, \ldots, T$ 
    Let  $\boldsymbol{\alpha}^{(t)} = \frac{1}{\lambda t} \boldsymbol{\beta}^{(t)}$ 
    Choose i uniformly at random from [m]
    For all  $j \neq i$  set  $\beta_{j}^{(t+1)} = \beta_{j}^{(t)}$ 
    If  $(y_{i} \sum_{j=1}^{m} \alpha_{j}^{(t)} K(\mathbf{x}_{j}, \mathbf{x}_{i}) &lt; 1)$ 
    Set  $\beta_{i}^{(t+1)} = \beta_{i}^{(t)} + y_{i}$ 
    Else
    Set  $\beta_{i}^{(t+1)} = \beta_{i}^{(t)}$ 
Output:  $\bar{\mathbf{w}} = \sum_{j=1}^{m} \bar{\alpha}_{j} \psi(\mathbf{x}_{j})$  where  $\bar{\alpha} = \frac{1}{T} \sum_{t=1}^{T} \boldsymbol{\alpha}^{(t)}$
</div>

The following lemma shows that the preceding implementation is equivalent to running the SGD procedure described in Section 15.5 on the feature space.

<sup>lemma</sup> 16.3 Let wˆ be the output of the SGD procedure described in Section 15.5, when applied on the feature space, and let $\begin{array}{r}{\bar{\bf w} = \sum_{j = 1}^{m} \bar{\boldsymbol{\alpha}}_{j} \psi({\bf x}_{j})} \end{array}$ be the output of applying SGD with kernels. Then $\bar{\bf w} = \hat{\bf w}$

Proof We will show that for every t Equation (16.6) holds, where ${\pmb \theta}^{(t)}$ is the result of running the SGD procedure described in Section 15.5 in the feature space. By the definition of $\begin{array}{r}{\pmb{\alpha}^{(t)} = \frac{1}{\lambda t} \pmb{\beta}^{(t)}} \end{array}$ and $\begin{array}{r}{\mathbf{w}^{(t)} = \frac{1}{\lambda t} \pmb{\theta}^{(t)}} \end{array}$ , this claim implies that Equation (16.7) also holds, and the proof of our lemma will follow. To prove that Equation (16.6) holds we use a simple inductive argument. For $t = 1$ the claim trivially holds. Assume it holds for $t \geq 1$ . Then,

$$
y_{i} \left\langle \mathbf{w}^{(t)}, \psi(\mathbf{x}_{i}) \right\rangle = y_{i} \left\langle \sum_{j} \alpha_{j}^{(t)} \psi(\mathbf{x}_{j}), \psi(\mathbf{x}_{i}) \right\rangle = y_{i} \sum_{j = 1}^{m} \alpha_{j}^{(t)} K(\mathbf{x}_{j}, \mathbf{x}_{i}).
$$

Hence, the condition in the two algorithms is equivalent and if we update θ we have

$$
\boldsymbol{\theta}^{(t + 1)} = \boldsymbol{\theta}^{(t)} + y_{i} \psi(\mathbf{x}_{i}) = \sum_{j = 1}^{m} \beta_{j}^{(t)} \psi(\mathbf{x}_{j}) + y_{i} \psi(\mathbf{x}_{i}) = \sum_{j = 1}^{m} \beta_{j}^{(t + 1)} \psi(\mathbf{x}_{j}),
$$

which concludes our proof.

## 16.4 Summary

Mappings from the given domain to some higher dimensional space, on which a halfspace predictor is used, can be highly powerful. We benefit from a rich and complex hypothesis class, yet need to solve the problems of high sample and computational complexities. In Chapter 10, we discussed the AdaBoost algorithm, which faces these challenges by using a weak learner: Even though we’re in a very high dimensional space, we have an “oracle” that bestows on us a single good coordinate to work with on each iteration. In this chapter we introduced a different approach, the kernel trick. The idea is that in order to find a halfspace predictor in the high dimensional space, we do not need to know the representation of instances in that space, but rather the values of inner products between the mapped instances. Calculating inner products between instances in the high dimensional space without using their representation in that space is done using kernel functions. We have also shown how the SGD algorithm can be implemented using kernels.

The ideas of feature mapping and the kernel trick allow us to use the framework of halfspaces and linear predictors for nonvectorial data. We demonstrated how kernels can be used to learn predictors over the domain of strings.

We presented the applicability of the kernel trick in SVM. However, the kernel trick can be applied in many other algorithms. A few examples are given as exercises.

This chapter ends the series of chapters on linear predictors and convex problems. The next two chapters deal with completely different types of hypothesis classes.

## 16.5 Bibliographic Remarks

In the context of SVM, the kernel-trick has been introduced in Boser et al. (1992). See also Aizerman, Braverman & Rozonoer (1964). The observation that the kernel-trick can be applied whenever an algorithm only relies on inner products was first stated by Sch¨olkopf, Smola & M¨uller (1998). The proof of the representer theorem is given in (Sch¨olkopf, Herbrich, Smola & Williamson 2000, Sch¨olkopf, Herbrich & Smola 2001). The conditions stated in Lemma 16.2 are simplification of conditions due to Mercer. Many useful kernel functions have been introduced in the literature for various applications. We refer the reader to Sch¨olkopf & Smola (2002).

## 16.6 Exercises

1. Consider the task of finding a sequence of characters in a file, as described in Section 16.2.1. Show that every member of the class H can be realized by composing a linear classifier over $\psi(x)$ , whose norm is 1 and that attains a margin of 1.

2. Kernelized Perceptron: Show how to run the Perceptron algorithm while only accessing the instances via the kernel function. Hint: The derivation is similar to the derivation of implementing SGD with kernels.

3. Kernel Ridge Regression: The ridge regression problem, with a feature mapping ψ, is the problem of finding a vector w that minimizes the function

$$
f(\mathbf{w}) = \lambda \left\| \mathbf{w} \right\|^{2} + \frac{1}{2m} \sum_{i = 1}^{m}(\langle \mathbf{w}, \psi(\mathbf{x}_{i}) \rangle - y_{i})^{2},\tag{16.8}
$$

and then returning the predictor

$$
h(\mathbf{x}) = \langle \mathbf{w}, \mathbf{x} \rangle.
$$

Show how to implement the ridge regression algorithm with kernels.

Hint: The representer theorem tells us that there exists a vector ${\pmb{\alpha}} \in \mathbb{R}^{m}$ such that $\scriptstyle \sum_{i = 1}^{m} \alpha_{i} \psi(\mathbf{x}_{i})$ is a minimizer of Equation (16.8).

1. Let G be the Gram matrix with regard to S and K. That is, $G_{ij} \ =$ $K(\mathbf{x}_{i}, \mathbf{x}_{j})$ . Define $g : \mathbb { R } ^ { m } $ <sup>R</sup> by

$$
g(\boldsymbol{\alpha}) = \lambda \cdot \boldsymbol{\alpha}^{T} G \boldsymbol{\alpha} + \frac{1}{2m} \sum_{i = 1}^{m}(\langle \boldsymbol{\alpha}, G_{\cdot, i} \rangle - y_{i})^{2},\tag{16.9}
$$

where $G_{\cdot, i}$ is the i’th column of G. Show that if $\alpha^{*}$ minimizes Equation (16.9) then $\begin{array}{r}{\mathbf{w}^{*} = \sum_{i = 1}^{m} \alpha_{i}^{*} \boldsymbol{\psi}(\mathbf{x}_{i})} \end{array}$ is a minimizer of $f.$ .

2. Find a closed form expression for $\alpha^{*}$ .

4. Let N be any positive integer. For every $x, x^{\prime} \in \{1, \ldots, N\}$ define

$$
K(x, x^{\prime}) = \min \{x, x^{\prime}\}.
$$

Prove that K is a valid kernel; namely, find a mapping $\psi : \{1, \dots, N\} \to H$ where H is some Hilbert space, such that

$$
\forall x, x^{\prime} \in \{1, \dots, N\}, K(x, x^{\prime}) = \langle \psi(x), \psi(x^{\prime}) \rangle.
$$

5. A supermarket manager would like to learn which of his customers have babies on the basis of their shopping carts. Specifically, he sampled i.i.d. customers, where for customer $i,$ let $x_{i} \subset \{1,..., d\}$ denote the subset of items the customer bought, and let $y_{i} \in \{\pm 1\}$ be the label indicating whether this customer has a baby. As prior knowledge, the manager knows that there are $k$ items such that the label is determined to be 1 if the customer bought at least one of these k items. Of course, the identity of these k items is not known (otherwise, there was nothing to learn). In addition, according to the store regulation, each customer can buy at most s items. Help the manager to design a learning algorithm such that both its time complexity and its sample complexity are polynomial in $s, k,$ , and $1 / \epsilon$

6. Let X be an instance set and let ψ be a feature mapping of $\mathcal{X}$ into some Hilbert feature space V . Let $K : \mathcal{X} \times \mathcal{X} \to \mathbb{R}$ be a kernel function that implements inner products in the feature space $V.$

Consider the binary classification algorithm that predicts the label of an unseen instance according to the class with the closest average. Formally, given a training sequence $S =(\mathbf{x}_{1}, y_{1}), \dots,(\mathbf{x}_{m}, y_{m})$ , for every $y \in \{\pm 1\}$ we define

$$
c_{y} = \frac{1}{m_{y}} \sum_{i: y_{i} = y} \psi(\mathbf{x}_{i}).
$$

where $m_{y} = | \{i : y_{i} = y\} |$ |. We assume that $m_{+}$ and m are nonzero. Then, the algorithm outputs the following decision rule:

$$
h(\mathbf{x}) = \left\{\begin{array}{ll} 1 & \| \psi(\mathbf{x}) - c_{+} \| \leq \| \psi(\mathbf{x}) - c_{-} \| \\ 0 & \text{otherwise.} \end{array} \right.
$$

1. Let $\mathbf{w} = c_{+} - c_{-}$ <sub>−</sub> and let $b = \textstyle{\frac{1}{2}}(\| c_{-} \|^{2} - \| c_{+} \|^{2})$ . Show that

$$
h(\mathbf{x}) = \mathrm{sign}(\langle \mathbf{w}, \psi(\mathbf{x}) \rangle + b).
$$

2. Show how to express $h(\mathbf{x})$ on the basis of the kernel function, and without accessing individual entries of $\psi(\mathbf{x})$ or w.


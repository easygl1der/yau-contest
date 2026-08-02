---
title: "Chapter 11 \u2014 Regression"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 11
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 6743
source_line_end: 7461
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 7
source_empty_image_alt: 7
non_semantic_image_alt: 3
caption_derived_image_alt: 4
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 27
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 11 — Regression

> [[../README|本书目录]] · [[10-chapter-10-ranking|上一章]] · [[12-chapter-12-maximum-entropy-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 6743–7461。
> - 本章保留 7 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 27；Affine × 3；different × 2；efficient × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 11.1 The problem of regression

We first introduce the learning problem of regression. Let X denote the input space and Y a measurable subset of <sup>R</sup>. Here, we will adopt the stochastic scenario and will denote by D a distribution over $\mathcal{X} \times \mathcal{Y}$ . As discussed in section 2.4.1, the deterministic scenario is a straightforward special case where input points admit a unique label determined by a target function $f \colon{\mathcal{X}} \mathcal{Y}$

As in all supervised learning problems, the learner receives a labeled sample $S = \bigl((x_{1}, y_{1}), \ldots,(x_{m}, y_{m}) \bigr) \in(\Sigma \times \mathbb{Y})^{m}$ drawn i.i.d. according to D. Since the labels are real numbers, it is not reasonable to hope that the learner could predict precisely the correct label when it is unique, or precisely its average label. Instead, we can require that its predictions be close to the correct ones. This is the key diference between regression and classification: in regression, the measure of error is based on the magnitude of the diference between the real-valued label predicted and the true or correct one, and not based on the equality or inequality of these two values. We denote by $L \colon \mathcal{Y} \times \mathcal{Y} \mathbb{R}_{+}$ the loss function used to measure the magnitude of error. The most common loss function used in regression is the squared loss $L_{2}$ defined by $L(y, y^{\prime}) = | y^{\prime} - y |^{2}$ for all $y, y^{\prime} \in \mathcal{Y}$ , or, more generally, an $L_{p}$ loss defined by $L(y, y^{\prime}) = | y^{\prime} - y |^{p}$ , for some $p \geq 1$ and all $y, y^{\prime} \in \mathcal{Y}$

Given a hypothesis set H of functions mapping X to Y, the regression problem consists of using the labeled sample S to find a hypothesis $h \in \mathcal{H}$ with small expected loss or generalization error $R(h)$ with respect to the target $f \colon$

$$
R(h) = \underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[L \bigl(h(x), y \bigr) \right].\tag{11.1}
$$

As in the previous chapters, the empirical loss or error of $h \in{\mathcal{H}}$ is denoted by $\widehat{R}_{S}(h)$ and defined by

$$
\widehat{R}_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m} L \bigl(h(x_{i}), y_{i} \bigr).\tag{11.2}
$$

In the common case where L is the squared loss, this represents the mean squared error of h on the sample S.

When the loss function L is bounded by some $M > 0$ , that is $L(y^{\prime}, y) \leq M$ for all $y, y^{\prime} \in \y$ or, more strictly, $L(h(x), y) \leq M$ for all $h \in \mathcal{H}$ and $(x, y) \in$ $\mathcal{X} \times \mathcal{Y}$ , the problem is referred to as a bounded regression problem. Much of the theoretical results presented in the following sections are based on that assumption. The analysis of unbounded regression problems is technically more elaborate and typically requires some other types of assumptions.

## 11.2 Generalization bounds

This section presents learning guarantees for bounded regression problems. We start with the simple case of a finite hypothesis set.

## 11.2.1 Finite hypothesis sets

In the case of a finite hypothesis, we can derive a generalization bound for regression by a straightforward application of Hoefding’s inequality and the union bound.

Theorem 11.1 Let L be a bounded loss function. Assume that the hypothesis set H is finite. Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following inequality

holds for all $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S}(h) + M \sqrt{\frac{\log | \mathcal{H} | + \log \frac{1}{\delta}}{2m}}.
$$

Proof: By Hoefding’s inequality, since L takes values in [0, M], for any $h \in{\mathcal{H}}$ , the following holds:

$$
\mathbb{P} \left[R(h) - \widehat{R}_{S}(h) > \epsilon \right] \leq e^{- \frac{2m \epsilon^{2}}{M^{2}}}.
$$

Thus, by the union bound, we can write

$$
\mathbb{P} \left[\exists h \in \mathcal{H} \colon R(h) - \widehat{R}_{S}(h) > \epsilon \right] \leq \sum_{h \in \mathcal{H}} \mathbb{P} \left[R(h) - \widehat{R}_{S}(h) > \epsilon \right] \leq | \mathcal{H} | e^{- \frac{2m \epsilon^{2}}{M^{2}}}.
$$

Setting the right-hand side to be equal to δ yields the statement of the theorem. $\square$ With the same assumptions and using the same proof, a two-sided bound can be derived: with probability at least $1 - \delta$ , for all $h \in{\mathcal{H}}$ ,

$$
| R(h) - \widehat{R}_{S}(h) | \leq M \sqrt{\frac{\log | \mathcal{H} | + \log \frac{2}{\delta}}{2m}}.
$$

These learning bounds are similar to those derived for classification. In fact, they coincide with the classification bounds given in the inconsistent case when $M = 1$ Thus, all the remarks made in that context apply identically here. In particular, a larger sample size m guarantees better generalization; the bound increases as a function of log H and suggests selecting, for the same empirical error, a smaller hypothesis set. This is an instance of Occam’s razor principle for regression. In the next sections, we present other instances of this principle for the general case of infinite hypothesis sets using the notions of Rademacher complexity and pseudodimension.

## 11.2.2 Rademacher complexity bounds

Here, we show how the Rademacher complexity bounds of theorem 3.3 can be used to derive generalization bounds for regression in the case of the family of $L_{p}$ loss functions. We first show an upper bound for the Rademacher complexity of a relevant family of functions.

Proposition 11.2 (Rademacher complexity of µ-Lipschitz loss functions) Let $L \colon \mathcal { Y } \times \mathcal { Y } $ <sup>R</sup> be a non-negative loss upper bounded by $M > 0 \(L(y, y^{\prime}) \leq M$ for all $y, y^{\prime} \in \mathcal{Y})$ and such that for any fixed $y^{\prime} \in \mathcal{Y}, \y \mapsto L(y, y^{\prime})$ is µ-Lipschitz for some $\mu > 0$ Then, for any sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ , the Rademacher complexity of the family $\mathcal{G} = \{(x, y) \mapsto L(h(x), y) \colon h \in{\mathcal{H}}\}$ is upper bounded as follows:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{G}) \leq \mu \widehat{\mathfrak{R}}_{S}(\mathcal{H}).
$$

Proof: Since for any fixed $y_{i}, y \mapsto L(y, y_{i})$ is µ-Lipschitz, by Talagrand’s contraction lemma (lemma 5.7), we can write

$$
\widehat{R}_{S}(\mathcal{G}) = \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sum_{i = 1}^{m} \sigma_{i} L(h(x_{i}), y_{i}) \right] \leq \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sum_{i = 1}^{m} \sigma_{i} \mu h(x_{i}) \right] = \mu \widehat{\mathfrak{R}}_{S}(\mathcal{H}),
$$

which completes the proof.

Theorem 11.3 (Rademacher complexity regression bounds) Let $L \colon \mathcal{Y} \times \mathcal{Y} \mathbb{R}$ be a nonnegative loss upper bounded by $M > 0 \(L(y, y^{\prime}) \leq M$ for all $y, y^{\prime} \in \mathcal{Y})$ and such that for any fixed $y^{\prime} \in \mathcal{Y}, y \mapsto L(y, y^{\prime})$ is µ-Lipschitz for some $\mu > 0$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[L(x, y) \right] \leq \frac{1}{m} \sum_{i = 1}^{m} L(x_{i}, y_{i}) + 2 \mu \mathfrak{R}_{m}(\mathcal{H}) + M \sqrt{\frac{\log \frac{1}{\delta}}{2m}}
$$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[L(x, y) \right] \leq \frac{1}{m} \sum_{i = 1}^{m} L(x_{i}, y_{i}) + 2 \mu \widehat{\mathfrak{R}}_{S}(\mathcal{H}) + 3M \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

Proof: Since for any fixed $y_{i}, y \mapsto L(y, y_{i})$ is µ-Lipschitz, by Talagrand’s contraction lemma (lemma 5.7), we can write

$$
\widehat{R}_{S}(\mathcal{G}) = \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sum_{i = 1}^{m} \sigma_{i} L(h(x_{i}), y_{i}) \right] \leq \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sum_{i = 1}^{m} \sigma_{i} \mu h(x_{i}) \right] = \mu \widehat{\mathfrak{R}}_{S}(\mathcal{H}).
$$

Combining this inequality with the general Rademacher complexity learning bound of theorem 3.3 completes the proof. $\square$

Let $p \geq 1$ and assume that $| h(x) - y | \leq M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ and $h \in{\mathcal{H}}$ . Then, since for any $y^{\prime}$ the function $y \mapsto | y - y^{\prime} |^{p}$ is $pM^{p - 1}.$ -Lipschitz for $(y - y^{\prime}) \in[- M, M]$ 2 the theorem applies to any $L_{p}{\mathrm{-}} \mathrm{loss}$ . As an example, for any $\delta > 0$ , with probability at least $1 - \delta$ over a sample S of size $m$ , each of the following inequalities holds for all $h \in{\mathcal{H}}.$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[\left| h(x) - y \right|^{p} \right] \leq \frac{1}{m} \sum_{i = 1}^{m} \left| h(x_{i}) - y_{i} \right|^{p} + 2pM^{p - 1} \Re_{m}(\mathcal{H}) + M^{p} \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

As in the case of classification, these generalization bounds suggest a trade-of between reducing the empirical error, which may require more complex hypothesis sets, and controlling the Rademacher complexity of H, which may increase the empirical error. An important benefit of the last learning bound of the theorem is that it is data-dependent. This can lead to more accurate learning guarantees. The upper bounds on $\Re_{m}(\mathcal{H})$ or $\Re_{S}(\mathcal{H})$ for kernel-based hypotheses (theorem 6.12) can be used directly here to derive generalization bounds in terms of the trace of the kernel matrix or the maximum diagonal entry.

![Figure 11.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/6d163dc6ce8ca6c340de779a364d6eacee1a22e603228d2de46a24c46845a9b8.jpg)  
Figure 11.1  
Illustration of the shattering of a set of two points $\{z_{1}, z_{2}\}$ with witnesses $t_{1}$ and $t_{2}$ .

## 11.2.3 Pseudo-dimension bounds

As previously discussed in the case of classification, it is sometimes computationally hard to estimate the empirical Rademacher complexity of a hypothesis set. In chapter 3, we introduce other measures of the complexity of a hypothesis set such as the VC-dimension, which are purely combinatorial and typically easier to compute or upper bound. However, the notion of shattering or that of VC-dimension introduced for binary classification are not readily applicable to real-valued hypothesis classes.

We first introduce a new notion of shattering for families of real-valued functions. As in previous chapters, we will use the notation G for a family of functions, whenever we intend to later interpret it (at least in some cases) as the family of loss functions associated to some hypothesis set H: $\mathcal{G} = \{z =(x, y) \mapsto L(h(x), y) \colon h \in \mathcal{H}\}$

Definition 11.4 (Shattering) Let G be a family of functions from a set Z to <sup>R</sup>. A set $\{z_{1}, \ldots, z_{m}\} \subseteq{\mathcal{X}}$ is said to be shattered by G if there exist $t_{1}, \ldots, t_{m} \in \mathbb{R}$ such that,

$$
\left| \left\{\left[\begin{array}{c} \operatorname{sgn} \left(g(z_{1}) - t_{1}\right) \\ \vdots \\ \operatorname{sgn} \left(g(z_{m}) - t_{m}\right) \end{array} \right]: g \in \mathcal{G} \right\} \right| = 2^{m}.
$$

When they exist, the threshold values $t_{1}, \ldots, t_{m}$ are said to witness the shattering. Thus, $\{z_{1}, \ldots, z_{m}\}$ is shattered if for some witnesses $t_{1}, \ldots, t_{m}$ , the family of functions G is rich enough to contain a function going above a subset A of the set of points $\mathcal{I} = \{(z_{i}, t_{i}) \colon i \in[m]\}$ and below the others $({\mathcal{I}} -{\mathcal{A}})$ , for any choice of the subset A. Figure 11.1 illustrates this shattering in a simple case. The notion of shattering naturally leads to the following definition.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/27774548380da0fed412bb8c6f74bd03351e3d2e247d23773ea8b9a715b31df9.jpg)  
A function $g \colon z =(x, y) \mapsto L(h(x), y)$ (in blue) defined as the loss of some fixed hypothesis $h \in{\mathcal{H}}.$ and its thresholded version $(x, y) \mapsto 1_{L(h(x), y) > t}$ (in red) with respect to the threshold t (in yellow).

Definition 11.5 (Pseudo-dimension) Let G be a family of functions mapping from X to <sup>R</sup>. Then, the pseudo-dimension of G, denoted by Pdim(G), is the size of the largest set shattered by G.

By definition of the shattering just introduced, the notion of pseudo-dimension of a family of real-valued functions G coincides with that of the VC-dimension of the corresponding thresholded functions mapping X to 0, 1 :

$$
\mathrm{Pdim}(\mathcal{G}) = \mathrm{VCdim} \left(\left\{(x, t) \mapsto 1_{(g(x) - t) > 0}: g \in \mathcal{G} \right\}\right).\tag{11.3}
$$

Figure 11.2 illustrates this interpretation. In view of this interpretation, the following two results follow directly the properties of the VC-dimension.

Theorem 11.6 The pseudo-dimension of hyperplanes in $\mathbb{R}^{N}$ is given by

$$
\mathrm{Pdim}(\{\mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} + b \colon \mathbf{w} \in \mathbb{R}^{N}, b \in \mathbb{R}\}) = N + 1.
$$

Theorem 11.7 The pseudo-dimension of a vector space of real-valued functions H is equal to the dimension of the vector space:

$$
\operatorname{Pdim}(\mathcal{H}) = \dim(\mathcal{H}).
$$

The following theorem gives a generalization bound for bounded regression in terms of the pseudo-dimension of a family of loss function ${ \mathfrak { G } } = \{ z = ( x , y ) \mapsto $ $L(h(x), y) \colon h \in{\mathcal{H}}\}$ associated to a hypothesis set H. The key technique to derive these bounds consists of reducing the problem to that of classification by making use of the following general identity for the expectation of a random variable X:

$$
\mathbb{E}[X] = - \int_{- \infty}^{0} \mathbb{P}[X < t] dt + \int_{0}^{+ \infty} \mathbb{P}[X > t] dt,\tag{11.4}
$$

which holds by definition of the Lebesgue integral. In particular, for any distribution D and any non-negative measurable function $f,$ we can write

$$
\underset{z \sim \mathcal{D}}{\mathbb{E}}[f(z)] = \int_{0}^{\infty} \underset{z \sim \mathcal{D}}{\mathbb{P}}[f(z) > t] dt.\tag{11.5}
$$

Theorem 11.8 Let H be a family of real-valued functions and ${\mathfrak{G}} = \{(x, y) \mapsto L(h(x)$ ， $y) \colon h \in{\mathcal{H}}\}$ the family of loss functions associated to H. Assume that ${\mathrm{Pdim}}({\mathcal{G}}) = d$ and that the loss function L is non-negative and bounded by M. Then, for any $\delta > 0$ , with probability at least $1 - \delta$ over the choice of am i.i.d. sample S of size m drawn from $\Phi^{m}$ , the following inequality holds for all $h \in{\mathcal{H}}.$

$$
R(h) \leq \widehat{R}_{S}(h) + M \sqrt{\frac{2d \log \frac{em}{d}}{m}} + M \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{11.6}
$$

Proof: Let $S$ be a sample of size m drawn i.i.d. according to D and let $\widehat{\Phi}$ denote the empirical distribution defined by S. For any $h \in{\mathcal{H}}$ and $t \geq 0$ , we denote by $c(h, t)$ the classifier defined by $c(h, t) \colon(x, y) \mapsto 1_{L(h(x), y) > t}$ . The error of $c(h, t)$ can be defined by

$$
R(c(h, t)) = \underset{(x, y) \sim \mathcal{D}}{\mathbb{P}}[c(h, t)(x, y) = 1] = \underset{(x, y) \sim \mathcal{D}}{\mathbb{P}}[L(h(x), y) > t],
$$

and, similarly, its empirical error is $\widehat{R}_{S}(c(h, t)) = \mathbb{P}_{(x, u) \sim \widehat{\mathbb{D}}}[L(h(x), y) > t].$

Now, in view of the identity (11.5) and the fact that the loss function $L$ is bounded by $M$ , we can write:

$$
\begin{array}{l} | R(h) - \widehat{R}_{S}(h) | = \Big | \underset{(x, y) \sim \mathcal{D}}{\mathbb{E}}[L(h(x), y)] - \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}}[L(h(x), y)] \Big | \\ = \left| \int_{0}^{M} \left(\underset{(x, y) \sim \mathcal{D}}{\mathbb{P}}[L(h(x), y) > t] - \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{P}}[L(h(x), y) > t]\right) dt \right| \\ \leq M \sup_{t \in[0, M]} \left| \underset{(x, y) \sim \mathcal{D}}{\mathbb{P}}[L(h(x), y) > t] - \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{P}}[L(h(x), y) > t] \right| \\ = M \sup_{t \in[0, M]} \left| R(c(h, t)) - \widehat{R}_{S}(c(h, t)) \right|.\end{array}
$$

This implies the following inequality:

$$
\mathbb{P}\left[\sup_{h\in \mathcal{H}}|R(h) - \widehat{R}_{S}(h)| > \epsilon \right]\leq \mathbb{P}\left[\sup_{\substack{h\in \mathcal{H}\\ t\in[0,M]}}\Big|R(c(h,t)) - \widehat{R}_{S}(c(h,t))\Big| > \frac{\epsilon}{M}\right].
$$

The right-hand side can be bounded using a standard generalization bound for classification (corollary 3.19) in terms of the VC-dimension of the family of hypotheses $\{c(h, t) \colon h \in{\mathcal{H}}, t \in[0, M]\}$ , which, by definition of the pseudo-dimension, is precisely ${\mathrm{Pdim}}({\mathcal{G}}) = d$ . The resulting bound coincides with (11.6). $\square$

![Figure 11.3](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/6d9679a67dc1f2314b450c6e7c2d6d8ddb1f0e42c03b9841616036d665077d59.jpg)  
Figure 11.3  
For $N = 1$ , linear regression consists of finding the line of best fit, measured in terms of the squared loss.

The notion of pseudo-dimension is suited to the analysis of regression as demonstrated by the previous theorem; however, it is not a scale-sensitive notion. There exists an alternative complexity measure, the fat-shattering dimension, that is scalesensitive and that can be viewed as a natural extension of the pseudo-dimension. Its definition is based on the notion of γ-shattering.

Definition 11.9 (γ-shattering) Let G be a family of functions from Z to <sup>R</sup> and let $\gamma > 0$ A set $\{z_{1}, \ldots, z_{m}\} \subseteq{\mathcal{X}}$ is said to be γ-shattered by G if there exist $t_{1}, \ldots, t_{m} \in \mathbb{R}$ such that for all $\mathbf{y} \in \{- 1, + 1\}^{m}$ , there exists $g \in{\mathcal{G}}$ such that:

$$
\forall i \in[m], \quad y_{i}(g(z_{i}) - t_{i}) \geq \gamma.
$$

Thus, $\{z_{1}, \ldots, z_{m}\}$ is γ-shattered if for some witnesses $t_{1}, \ldots, t_{m}$ , the family of functions G is rich enough to contain a function going at least $\gamma$ above a subset A of the set of points $\mathfrak{I} = \{(z_{i}, t_{i}) \colon i \in[m]\}$ and at least $\gamma$ below the others $({\mathfrak{J}} -{\mathcal{A}})$ 2 for any choice of the subset A.

Definition 11.10 (γ-fat-dimension) The γ-fat-dimension $of{\mathcal{G}}, \operatorname{fat}_{\gamma}({\mathcal{G}})$ , is the size of the largest set that is γ-shattered by G.

Finer generalization bounds than those based on the pseudo-dimension can be derived in terms of the γ-fat-dimension. However, the resulting learning bounds, are not more informative than those based on the Rademacher complexity, which is also a scale-sensitive complexity measure. Thus, we will not detail an analysis based on the γ-fat-dimension.

## 11.3 Regression algorithms

The results of the previous sections show that, for the same empirical error, hypothesis sets with smaller complexity measured in terms of the Rademacher complexity or in terms of pseudo-dimension benefit from better generalization guarantees. One family of functions with relatively small complexity is that of linear hypotheses. In this section, we describe and analyze several algorithms based on that hypothesis set: linear regression, kernel ridge regression (KRR), support vector regression (SVR), and Lasso. These algorithms, in particular the last three, are extensively used in practice and often lead to state-of-the-art performance results.

## 11.3.1 Linear regression

We start with the simplest algorithm for regression known as linear regression. Let Φ: $\mathcal{X} \to \mathbb{R}^{N}$ be a feature mapping from the input space $\mathcal{X}$ to $\mathbb{R}^{N}$ and consider the family of linear hypotheses

$$
\mathcal{H} = \left\{x \mapsto \mathbf{w} \cdot \boldsymbol{\Phi}(x) + b \colon \mathbf{w} \in \mathbb{R}^{N}, b \in \mathbb{R} \right\}.\tag{11.7}
$$

Linear regression consists of seeking a hypothesis in H with the smallest empirical mean squared error. Thus, for a sample $S = \bigl((x_{1}, y_{1}), \ldots,(x_{m}, y_{m}) \bigr) \in(\Sigma \times \mathbb{Y})^{m}$ the following is the corresponding optimization problem:

$$
\min_{\mathbf{w}, b} \frac{1}{m} \sum_{i = 1}^{m} \left(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b - y_{i}\right)^{2}.\tag{11.8}
$$

Figure 11.3 illustrates the algorithm in the simple case where $N = 1$ . The optimization problem admits the simpler formulation:

$$
\min_{\mathbf{W}} F(\mathbf{W}) = \frac{1}{m} \| \mathbf{X}^{\top} \mathbf{W} - \mathbf{Y} \|^{2},\tag{11.9}
$$

using the notation $\mathbf{X} = \left[{\begin{array}{ccc}{\Phi(x_{1})} &{\dots \Phi(x_{m})} \\{1} &{\dots} &{1} \end{array}} \right]$ ， $\mathbf{W} = \left[\ddot{\vdots}_{i_{N}} \right]$ and $\mathbf{Y} = \left[\begin{array}{c}{y_{1}} \\{\vdots} \\{y_{m}} \end{array} \right]$ . The objective function F is convex, by composition of the convex function $\mathbf{u} \mapsto \| \mathbf{u} \|^{2}$ with the Affine function $\mathbf{W} \mapsto \mathbf{X}^{\top} \mathbf{W} - \mathbf{Y}$ , and it is diferentiable. Thus, F admits a global minimum at W if and only if $\nabla F(\mathbf{W}) = 0$ , that is if and only if

$$
\frac{2}{m} \mathbf{X}(\mathbf{X}^{\top} \mathbf{W} - \mathbf{Y}) = 0 \Leftrightarrow \mathbf{X} \mathbf{X}^{\top} \mathbf{W} = \mathbf{X} \mathbf{Y}.\tag{11.10}
$$

When $\mathbf{\mathbf{XX}^{\top}}$ is invertible, this equation admits a unique solution. Otherwise, the equation admits a family of solutions that can be given in terms of the pseudo-inverse of matrix $\mathbf{\mathbf{XX}^{\top}}$ (see appendix A) by $\mathbf{W} =(\mathbf{X} \mathbf{X}^{\top})^{\dagger} \mathbf{X} \mathbf{Y} +(I -$ $(\mathbf{X} \mathbf{X}^{\top})^{\dag}(\mathbf{X} \mathbf{X}^{\top})) \mathbf{W}_{0}$ , where $\mathbf{W}_{0}$ is an arbitrary matrix in $\mathbb{R}^{N \times N}$ . Among these, the solution $\mathbf{W} =(\mathbf{X} \mathbf{X}^{\top})^{\top} \mathbf{X} \mathbf{Y}$ is the one with the minimal norm and is often preferred for that reason. Thus, we will write the solutions as

$$
\mathbf{W} = \left\{\begin{array}{ll}(\mathbf{XX}^{\top})^{- 1} \mathbf{XY} & \text{if \mathbf{XX}^{\top} isinvertible}, \\(\mathbf{XX}^{\top})^{\dagger} \mathbf{XY} & \text{otherwise}.\end{array} \right.\tag{11.11}
$$

The matrix $\mathbf{\mathbf{XX}^{\top}}$ can be computed in $O(mN^{2})$ . The cost of its inversion or that of computing its pseudo-inverse is in $O(N^{3})$ .<sup>19</sup> Finally, the multiplication with X and Y takes $O(mN^{2})$ . Therefore, the overall complexity of computing the solution W is in $O(mN^{2} + N^{3})$ . Thus, when the dimension of the feature space N is not too large, the solution can be computed eficiently.

While linear regression is simple and admits a straightforward implementation, it does not benefit from a strong generalization guarantee, since it is limited to minimizing the empirical error without controlling the norm of the weight vector and without any other regularization. Its performance is also typically poor in most applications. The next sections describe algorithms with both better theoretical guarantees and improved performance in practice.

## 11.3.2 Kernel ridge regression

We first present a learning guarantee for regression with bounded linear hypotheses in a feature space defined by a PDS kernel. This will provide a strong theoretical support for the kernel ridge regression algorithm presented in this section. The learning bounds of this section are given for the squared loss. Thus, in particular, the generalization error of a hypothesis h is defined by $R(h) = \mathbb{E}_{(x, y) \sim \mathcal{D}} \left[(h(x) - \right.$ $y)^{2}]$

Theorem 11.11 Let $K \colon \mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel, $\Phi \colon \mathcal{X} \mathbb{H}$ a feature mapping associated to K, and $\mathcal{H} = \left\{x \mapsto \mathbf{w} \cdot \pmb{\Phi}(x) \colon \lVert \mathbf{w} \rVert_{\mathbb{H}} \leq \Lambda \right\}$ . Assume that there exists $r \ > \0$ such that $K(x, x) ~ \le ~ r^{2}$ and $M \ > \0$ such that $| h(x) - y | < M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following inequalities holds for all $h \in{\mathcal{H}}$ :

$$
\begin{array}{rl} &{R(h) \leq \widehat{R}_{S}(h) + 4M \sqrt{\frac{r^{2} \Lambda^{2}}{m}} + M^{2} \sqrt{\frac{\log \frac{1}{\delta}}{2m}}} \\ &{R(h) \leq \widehat{R}_{S}(h) + \frac{4M \Lambda \sqrt{\mathrm{Tr}[\mathbf{K}]}}{m} + 3M^{2} \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.} \end{array}
$$

Proof: By the bound on the empirical Rademacher complexity of kernel-based hypotheses (theorem 6.12), the following holds for any sample $S$ of size m:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}) \leq \frac{\Lambda \sqrt{\mathrm{Tr}[\mathbf{K}]}}{m} \leq \sqrt{\frac{r^{2} \Lambda^{2}}{m}},
$$

which implies that $\Re_{m}(\mathcal{H}) \leq \sqrt{\frac{r^{2} \Lambda^{2}}{m}}$ . Combining these inequalities with the learning bounds of Theorem 11.3 yield immediately the inequalities claimed. $\square$

The learning bounds of the theorem suggests minimizing a trade-of between the empirical squared loss (first term on the right-hand side), and the norm of the weight vector (upper bound Λ on the norm appearing in the second term), or equivalently the norm squared. Kernel ridge regression is defined by the minimization of an objective function that has precisely this form and thus is directly motivated by the theoretical analysis just presented:

$$
\min_{\mathbf{w}} F(\mathbf{w}) = \lambda \| \mathbf{w} \|^{2} + \sum_{i = 1}^{m} \left(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) - y_{i}\right)^{2}.\tag{11.12}
$$

Here, λ is a positive parameter determining the trade-of between the regularization term $\| \mathbf{w} \|^{2}$ and the empirical mean squared error. The objective function difers from that of linear regression only by the first term, which controls the norm of w. $\mathrm{As}$ in the case of linear regression, the problem can be rewritten in a more compact form as

$$
\min_{\mathbf{W}} F(\mathbf{W}) = \lambda \| \mathbf{W} \|^{2} + \| \mathbf{X}^{\top} \mathbf{W} - \mathbf{Y} \|^{2},\tag{11.13}
$$

where $\mathbf{X} \in \mathbb{R}^{N \times m}$ is the matrix formed by the feature vectors, $\mathbf{X} = \left[\Phi(x_{1}) \dots \Phi(x_{m}) \right]$ $\mathbf{W} = \mathbf{w}$ , and $\mathbf{Y} =(y_{1}, \ldots, y_{m})^{\top}$ . Here too, $F$ is convex, by the convexity of $\mathbf{w} \mapsto \| \mathbf{w} \|^{2}$ and that of the sum of two convex functions, and is diferentiable. Thus $F$ admits a global minimum at W if and only if

$$
\nabla F(\mathbf{W}) = 0 \Leftrightarrow(\mathbf{XX}^{\top} + \lambda \mathbf{I}) \mathbf{W} = \mathbf{XY} \Leftrightarrow \mathbf{W} =(\mathbf{XX}^{\top} + \lambda \mathbf{I})^{- 1} \mathbf{XY}.\tag{11.14}
$$

Note that the matrix $\mathbf{X} \mathbf{X}^{\top} + \lambda \mathbf{I}$ is always invertible, since its eigenvalues are the sum of the non-negative eigenvalues of the symmetric positive semidefinite matrix $\mathbf{\mathbf{XX}^{\top}}$ and $\lambda > 0$ . Thus, kernel ridge regression admits a closed-form solution.

An alternative formulation of the optimization problem for kernel ridge regression equivalent to (11.12) is

$$
\min_{\mathbf{w}} \sum_{i = 1}^{m}(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) - y_{i})^{2} \quad \text{subject to:} \| \mathbf{w} \|^{2} \leq \Lambda^{2}.
$$

This makes the connection with the bounded linear hypothesis set of theorem 11.11 even more evident. Using slack variables $\xi_{i}$ , for all $i \in[m]$ , the problem can be

equivalently written as

$$
\min_{\mathbf{w}} \sum_{i = 1}^{m} \xi_{i}^{2} \quad \text{subject to:}(\| \mathbf{w} \|^{2} \leq \Lambda^{2}) \wedge \big(\forall i \in[m], \xi_{i} = y_{i} - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) \big).
$$

This is a convex optimization problem with diferentiable objective function and constraints. To derive the equivalent dual problem, we introduce the Lagrangian $\mathcal{L}.$ , which is defined for all $\boldsymbol{\xi}, \mathbf{w}, \boldsymbol{\alpha}^{\prime}$ , and $\lambda \geq 0$ by

$$
\mathcal{L}(\boldsymbol{\xi}, \mathbf{w}, \boldsymbol{\alpha}^{\prime}, \lambda) = \sum_{i = 1}^{m} \xi_{i}^{2} + \sum_{i = 1}^{m} \alpha_{i}^{\prime}(y_{i} - \xi_{i} - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i})) + \lambda(\| \mathbf{w} \|^{2} - \Lambda^{2}).
$$

The KKT conditions lead to the following equalities:

$$
\begin{array}{ll} \nabla_{\mathbf{w}} \mathcal{L} = - \sum_{i = 1}^{m} \alpha_{i}^{\prime} \Phi(x_{i}) + 2 \lambda \mathbf{w} = 0 & \Longrightarrow \qquad \mathbf{w} = \frac{1}{2 \lambda} \sum_{i = 1}^{m} \alpha_{i}^{\prime} \Phi(x_{i}) \\ \nabla_{\xi_{i}} \mathcal{L} = 2 \xi_{i} - \alpha_{i}^{\prime} = 0 & \Longrightarrow \qquad \xi_{i} = \alpha_{i}^{\prime} / 2 \\ \forall i \in[m], \alpha_{i}^{\prime}(y_{i} - \xi_{i} - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i})) = 0 \\ \lambda(\| \mathbf{w} \|^{2} - \Lambda^{2}) = 0.\end{array}
$$

Plugging in the expressions of w and $\xi_{i} s$ in that of $\mathcal{L}$ gives

$$
\begin{array}{l} \mathcal{L} = \sum_{i = 1}^{m} \frac{\alpha_{i}^{\prime 2}}{4} + \sum_{i = 1}^{m} \alpha_{i}^{\prime} y_{i} - \sum_{i = 1}^{m} \frac{\alpha_{i}^{\prime 2}}{2} - \frac{1}{2 \lambda} \sum_{i, j = 1}^{m} \alpha_{i}^{\prime} \alpha_{j}^{\prime} \Phi(x_{i})^{\top} \Phi(x_{j}) \\ \qquad + \lambda \Big(\frac{1}{4 \lambda^{2}} \| \sum_{i = 1}^{m} \alpha_{i}^{\prime} \Phi(x_{i}) \|^{2} - \Lambda^{2} \Big) \\ = - \frac{1}{4} \sum_{i = 1}^{m} \alpha_{i}^{\prime 2} + \sum_{i = 1}^{m} \alpha_{i}^{\prime} y_{i} - \frac{1}{4 \lambda} \sum_{i, j = 1}^{m} \alpha_{i}^{\prime} \alpha_{j}^{\prime} \Phi(x_{i})^{\top} \Phi(x_{j}) - \lambda \Lambda^{2} \\ = - \lambda \sum_{i = 1}^{m} \alpha_{i}^{2} + 2 \sum_{i = 1}^{m} \alpha_{i} y_{i} - \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} \Phi(x_{i})^{\top} \Phi(x_{j}) - \lambda \Lambda^{2}, \end{array}
$$

with $\alpha_{i}^{\prime} = 2 \lambda \alpha_{i}$ . Thus, the equivalent dual optimization problem for KRR can be written as follows:

$$
\max_{\boldsymbol{\alpha} \in \mathbb{R}^{m}} - \lambda \boldsymbol{\alpha}^{\top} \boldsymbol{\alpha} + 2 \boldsymbol{\alpha}^{\top} \mathbf{Y} - \boldsymbol{\alpha}^{\top}(\mathbf{X}^{\top} \mathbf{X}) \boldsymbol{\alpha},\tag{11.15}
$$

or, more compactly, as

$$
\max_{\boldsymbol{\alpha} \in \mathbb{R}^{m}} G(\boldsymbol{\alpha}) = - \boldsymbol{\alpha}^{\top}(\mathbf{K} + \lambda \mathbf{I}) \boldsymbol{\alpha} + 2 \boldsymbol{\alpha}^{\top} \mathbf{Y},\tag{11.16}
$$

where ${\bf K} ={\bf X}^{\top}{\bf X}$ is the kernel matrix associated to the training sample. The objective function G is concave and diferentiable. The optimal solution is obtained by diferentiating the function and setting it to zero:

$$
\nabla G(\boldsymbol{\alpha}) = 0 \iff 2(\mathbf{K} + \lambda \mathbf{I}) \boldsymbol{\alpha} = 2 \mathbf{Y} \iff \boldsymbol{\alpha} =(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{Y}.\tag{11.17}
$$

Note that $(\mathbf{K}{+} \lambda \mathbf{I})$ is invertible, since its eigenvalues are the sum of the eigenvalues of the SPSD matrix K and $\lambda > 0$ . Thus, as in the primal case, the dual optimization problem admits a closed-form solution. By the first KKT equation, w can be determined from α by

$$
\mathbf{w} = \sum_{i = 1}^{m} \alpha_{i} \boldsymbol{\Phi}(\mathbf{x}_{i}) = \mathbf{X} \boldsymbol{\alpha} = \mathbf{X}(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{Y}.\tag{11.18}
$$

The hypothesis h solution can be given as follows in terms of α:

$$
\forall x \in \mathcal{X}, \quad h(x) = \mathbf{w} \cdot \boldsymbol{\Phi}(x) = \sum_{i = 1}^{m} \alpha_{i} K(x_{i}, x).\tag{11.19}
$$

Note that the form of the solution, $\begin{array}{r}{h = \sum_{i = 1}^{m} \alpha_{i} K(x_{i}, \cdot)} \end{array}$ , could be immediately predicted using the Representer theorem, since the objective function minimized by KRR falls within the general framework of theorem 6.11. This also could show that w could be written as $\mathbf{w} = \mathbf{X} \alpha$ . This fact, combined with the following simple lemma, can be used to determine α in a straightforward manner, without the intermediate derivation of the dual problem.

Lemma 11.12 The following identity holds for any matrix X:

$$
(\mathbf{X} \mathbf{X}^{\top} + \lambda \mathbf{I})^{- 1} \mathbf{X} = \mathbf{X}(\mathbf{X}^{\top} \mathbf{X} + \lambda \mathbf{I})^{- 1}.
$$

Proof: Observe that $(\mathbf{X} \mathbf{X}^{\top} + \lambda \mathbf{I}) \mathbf{X} = \mathbf{X}(\mathbf{X}^{\top} \mathbf{X} + \lambda \mathbf{I})$ . Left-multiplying by $(\mathbf{XX^{\top}} +$ $\lambda \mathbf{I})^{- 1}$ this equality and right-multiplying it by $(\mathbf{X}^{\top} \mathbf{X} + \lambda \mathbf{I})^{- 1}$ yields the statement of the lemma. $\square$

Now, using this lemma, the primal solution of w can be rewritten as follows:

$$
\mathbf{w} =(\mathbf{XX}^{\top} + \lambda \mathbf{I})^{- 1} \mathbf{XY} = \mathbf{X}(\mathbf{X}^{\top} \mathbf{X} + \lambda \mathbf{I})^{- 1} \mathbf{Y} = \mathbf{X}(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{Y}.
$$

Comparing with $\mathbf{w} = \mathbf{X} \alpha$ gives immediately $\pmb{\alpha} =(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{Y}$

Our presentation of the KRR algorithm was given for linear hypotheses with no ofset, that is we implicitly assumed $b = 0$ . It is common to use this formulation and to extend it to the general case by augmenting the feature vector $\Phi(x)$ with an extra component equal to one for all $x \in \mathcal{X}$ and the weight vector w with an extra component $b \in \mathbb{R}$ . For the augmented feature vector $\Phi^{\prime}(x) \in \mathbb{R}^{N + 1}$ and weight vector $\mathbf{w}^{\prime} \in \mathbb{R}^{N + 1}$ , we have $\mathbf{w^{\prime}} \cdot \pmb{\Phi^{\prime}}(x) = \mathbf{w} \cdot \pmb{\Phi}(x) + b$ . Nevertheless, this formulation does not coincide with the general KRR algorithm where a solution of the form $x \mapsto{\textbf{w}} \cdot \Phi(x) + b$ is sought. This is because for the general KRR, the regularization term is $\lambda \| \mathbf{w} \|$ , while for the extension just described it is $\lambda \| \mathbf{w}^{\prime} \|$

Table 11.1  
Comparison of the running-time complexity of KRR for computing the solution or the prediction value of a point in both the primal and the dual case. κ denotes the time complexity of computing a kernel value; for polynomial and Gaussian kernels, $\kappa = O(N)$

<table><tr><td></td><td>Solution</td><td>Prediction</td></tr><tr><td>Primal</td><td> $O(mN^{2} + N^{3})$ </td><td> $O(N)$ </td></tr><tr><td>Dual</td><td> $O(\kappa m^{2} + m^{3})$ </td><td> $O(\kappa m)$ </td></tr></table>

In both the primal and dual cases, KRR admits a closed-form solution. Table 11.1 gives the time complexity of the algorithm for computing the solution and the one for determining the prediction value of a point in both cases. In the primal case, determining the solution w requires computing matrix $\mathbf{\mathbf{XX}^{\top}}$ , which takes $O(mN^{2})$ , the inversion of $(\mathbf{X} \mathbf{X}^{\top} + \lambda \mathbf{I})$ , which is in $O(N^{3})$ , and multiplication with X, which is in $O(mN^{2})$ . Prediction requires computing the inner product of w with a feature vector of the same dimension that can be achieved in $O(N)$ . The dual solution first requires computing the kernel matrix K. Let κ be the maximum cost of computing $K(x, x^{\prime})$ for all pairs $(x, x^{\prime}) \in \mathcal{X} \times \mathcal{X}$ . Then, K can be computed in $O(\kappa m^{2})$ . The inversion of matrix $\mathbf{K} + \lambda \mathbf{I}$ can be achieved in $O(m^{3})$ and multiplication with Y takes $O(m^{2})$ . Prediction requires computing the vector $(K(x_{1}, x), \ldots, K(x_{m}, x))^{\top}$ for some $x \in{\mathcal{X}}$ , which requires $O(\kappa m)$ , and the inner product with α, which is in $O(m)$

Thus, in both cases, the main step for computing the solution is a matrix inversion, which takes $O(N^{3})$ in the primal case, $O(m^{3})$ in the dual case. When the dimension of the feature space is relatively small, solving the primal problem is advantageous, while for high-dimensional spaces and medium-sized training sets, solving the dual is preferable. Note that for relatively large matrices, the space complexity could also be an issue: the size of relatively large matrices could be prohibitive for memory storage and the use of external memory could significantly afect the running time of the algorithm.

For sparse matrices, there exist several techniques for faster computations of the matrix inversion. This can be useful in the primal case where the features can be relatively sparse. On the other hand, the kernel matrix K is typically dense; thus, there is less hope for benefiting from such techniques in the dual case. In such cases, or, more generally, to deal with the time and space complexity issues arising when m and N are large, approximation methods using low-rank approximations via the Nystr¨om method or the partial Cholesky decomposition can be used very efectively.

The KRR algorithm admits several advantages: it benefits from favorable theoretical guarantees since it can be derived directly from the generalization bound we presented; it admits a closed-form solution, which can make the analysis of many of its properties convenient; and it can be used with PDS kernels, which extends its use to non-linear regression solutions and more general features spaces. KRR also admits favorable stability properties that we discuss in chapter 14.

![Figure 11.4](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/6ee3bb9d2277ebe1e0d0319324bec39a6ec98bae1af84565065e948909324a2e.jpg)  
Figure 11.4  
SVR attempts to fit a “tube” with width $\epsilon$ to the data. Training data within the “epsilon tube” (blue points) incur no loss.

The algorithm can be generalized to learning a mapping from X to $\mathbb{R}^{p}, p > 1$ This can be done by formulating the problem as p independent regression problems, each consisting of predicting one of the $p$ target components. Remarkably, the computation of the solution for this generalized algorithm requires only a single matrix inversion, $\mathrm{e.g., ~}(\mathbf{K} + \lambda \mathbf{I})^{- 1}$ in the dual case, regardless of the value of $p.$

One drawback of the KRR algorithm, in addition to the computational issues for determining the solution for relatively large matrices, is the fact that the solution it returns is typically not sparse. The next two sections present two sparse algorithms for linear regression.

## 11.3.3 Support vector regression

In this section, we present the support vector regression (SVR) algorithm, which is inspired by the SVM algorithm presented for classification in chapter 5. The main idea of the algorithm consists of fitting a tube of width $\epsilon > 0$ to the data, as illustrated by figure 11.4. As in binary classification, this defines two sets of points: those falling inside the tube, which are $\epsilon$-close to the function predicted and thus not penalized, and those falling outside, which are penalized based on their distance to the predicted function, in a way that is similar to the penalization used by SVMs in classification.

Using a hypothesis set H of linear functions: ${\mathcal{H}} = \{x \mapsto \mathbf{w} \cdot{\pmb{\Phi}}(x) + b \colon \mathbf{w} \in$ $\mathbb{R}^{N}, b \in \mathbb{R}\}$ , where Φ is the feature mapping corresponding some PDS kernel $K.$ the optimization problem for SVR can be written as follows:

$$
\min_{\mathbf{w}, b} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \left| y_{i} -(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b) \right|_{\epsilon},\tag{11.20}
$$

where $| \cdot |_{\epsilon}$ denotes the $\epsilon$-insensitive loss:

$$
\forall y, y^{\prime} \in \mathcal{Y}, | y^{\prime} - y |_{\epsilon} = \max(0, | y^{\prime} - y | - \epsilon).\tag{11.21}
$$

The use of this loss function leads to sparse solutions with a relatively small number of support vectors. Using slack variables $\xi_{i} \geq 0$ and $\xi_{i}^{\prime} \ge 0, i \in[m]$ , the optimization problem can be equivalently written as

$$
\begin{array}{c} \min_{\mathbf{w}, b, \boldsymbol{\xi}, \boldsymbol{\xi}^{\prime}} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m}(\xi_{i} + \xi_{i}^{\prime}) \\ \text{subject to}(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b) - y_{i} \leq \epsilon + \xi_{i} \\ y_{i} -(\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b) \leq \epsilon + \xi_{i}^{\prime} \\ \xi_{i} \geq 0, \xi_{i}^{\prime} \geq 0, \forall i \in[m].\end{array}\tag{11.22}
$$

This is a convex quadratic program (QP) with Affine constraints. Introducing the Lagrangian and applying the KKT conditions leads to the following equivalent dual problem in terms of the kernel matrix K:

$$
\max_{\boldsymbol{\alpha}, \boldsymbol{\alpha}^{\prime}} - \epsilon(\boldsymbol{\alpha}^{\prime} + \boldsymbol{\alpha})^{\top} \mathbf{1} +(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})^{\top} \mathbf{y} - \frac{1}{2}(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})^{\top} \mathbf{K}(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})\tag{11.23}
$$

subject to: $(\mathbf{0} \leq \alpha \leq \mathbf{C}) \wedge(\mathbf{0} \leq \alpha^{\prime} \leq \mathbf{C}) \wedge((\alpha^{\prime} - \alpha)^{\top} \mathbf{1} = 0)$

Any PDS kernel K can be used with SVR, which extends the algorithm to nonlinear regression solutions. Problem (11.23) is a convex QP similar to the dual problem of SVMs and can be solved using similar optimization techniques. The solutions α and $\mathbf{{\boldsymbol{\alpha}}^{\prime}}$ define the hypothesis h returned by SVR as follows:

$$
\forall x \in \mathcal{X}, \quad h(x) = \sum_{i = 1}^{m}(\alpha_{i}^{\prime} - \alpha_{i}) K(\mathbf{x}_{i}, \mathbf{x}) + b,\tag{11.24}
$$

where the ofset b can be obtained from a point $x_{j}$ with $0 < \alpha_{j} < C$ by

$$
b = - \sum_{i = 1}^{m}(\alpha_{i}^{\prime} - \alpha_{i}) K(x_{i}, x_{j}) + y_{j} + \epsilon,\tag{11.25}
$$

or from a point $x_{j}$ with $0 < \alpha_{j}^{\prime} < C$ via

$$
b = - \sum_{i = 1}^{m}(\alpha_{i}^{\prime} - \alpha_{i}) K(x_{i}, x_{j}) + y_{j} - \epsilon.\tag{11.26}
$$

By the complementarity conditions, for all $i \in[m]$ , the following equalities hold:

$$
\begin{array}{rl} &{\alpha_{i} \big((\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b) - y_{i} - \epsilon - \xi_{i} \big) = 0} \\ &{\alpha_{i}^{\prime} \big((\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) + b) - y_{i} + \epsilon + \xi_{i}^{\prime} \big) = 0.} \end{array}
$$

Thus, if $\alpha_{i} \neq 0$ or $\alpha_{i}^{\prime} \neq 0$ , that is if $x_{i}$ is a support vector, then, either $(\mathbf{w} \cdot \pmb{\Phi}(x_{i}) +$ $b) - y_{i} - \epsilon = \xi_{i}$ holds or $y_{i} -(\mathbf{w} \cdot \pmb{\Phi}(x_{i}) + b) - \epsilon = \xi_{i}^{\prime}$ . This shows that support vectors points lying outside the $\epsilon$-tube. Of course, at most one of $\alpha_{i}$ or $\alpha_{i}^{\prime}$ is non-zero for any point $x_{i} \colon$ the hypothesis either overestimates or underestimates the true label by more than $\epsilon$. For the points within the $\epsilon$-tube, we have $\alpha_{j} = \alpha_{j}^{\prime} = 0;$ thus, these points do not contribute to the definition of the hypothesis returned by SVR. Thus, when the number of points inside the tube is relatively large, the hypothesis returned by SVR is relatively sparse. The choice of the parameter $\epsilon$ determines a trade-of between sparsity and accuracy: larger $\epsilon$ values provide sparser solutions, since more points can fall within the $\epsilon$-tube, but may ignore too many key points for determining an accurate solution.

The following generalization bounds hold for the $\epsilon$-insensitive loss and kernelbased hypotheses and thus for the SVR algorithm. We denote by D the distribution according to which sample points are drawn and by $\widehat{\Phi}$ the empirical distribution defined by a training sample of size m.

Theorem 11.13 Let $K \colon \mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel, let $\Phi \colon \mathcal{X} \mathbb{H}$ be a feature mapping associated to K and let $\mathcal{H} = \left\{x \mapsto \mathbf{w} \cdot \pmb{\Phi}(x) \colon \lVert \mathbf{w} \rVert_{\mathbb{H}} \leq \Lambda \right\}$ . Assume that there exists $r > 0$ such that $K(x, x) \leq r^{2}$ and $M > 0$ such that $| h(x) - y | \leq M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ . Fix $\epsilon > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following inequalities holds for all $h \in{\mathcal{H}}$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon} \right] \leq \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon} \right] + 2 \sqrt{\frac{r^{2} \Lambda^{2}}{m}} + M \sqrt{\frac{\log \frac{1}{\delta}}{2m}}
$$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon} \right] \leq \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon} \right] + \frac{2 \Lambda \sqrt{\operatorname{Tr}[\mathbf{K}]}}{m} + 3M \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

Proof: Since for any $y^{\prime} \in \mathcal{Y}$ , the function $y \mapsto | y - y^{\prime} |_{\epsilon}$ is 1-Lipschitz, the result follows Theorem 11.3 and the bound on the empirical Rademacher complexity of H. $\square$

These results provide theoretical guarantees for the SVR algorithm. Notice, however, that the theorem does not provide guarantees for the expected loss of the hypotheses in terms of the squared loss. For $0 < \epsilon < 1 / 4.$ the inequality $| x |^{2} \leq | x |,$ $\epsilon$ holds for all x in $[- \eta_{\epsilon}^{\prime}, - \eta_{\epsilon}] \cup[\eta_{\epsilon}, \eta_{\epsilon}^{\prime}]$ with $\begin{array}{r}{\eta_{\epsilon} = \frac{1 - \sqrt{1 - 4 \epsilon}}{2}} \end{array}$ and $\begin{array}{r}{\eta_{\epsilon}^{\prime} = \frac{1 + \sqrt{1 - 4 \epsilon}}{2}} \end{array}$ . For small values of $\epsilon, \eta_{\epsilon} \approx 0$ and $\eta_{\epsilon}^{\prime} \approx 1$ , thus, if $M = 2r \lambda \leq 1$ , then, the squared loss can be upper bounded by the $\epsilon$-insensitive loss for almost all values of $(h(x) - y)$ in $[- 1, 1]$ and the theorem can be used to derive a useful generalization bound for the squared loss.

More generally, if the objective is to achieve a small squared loss, then, SVR can be modified by using the quadratic $\epsilon$-insensitive loss, that is the square of the $\epsilon$- insensitive loss, which also leads to a convex QP. We will refer by quadratic SVR to this version of the algorithm. Introducing the Lagrangian and applying the KKT conditions leads to the following equivalent dual optimization problem for quadratic SVR in terms of the kernel matrix K:

$$
\max_{\boldsymbol{\alpha}, \boldsymbol{\alpha}^{\prime}} - \epsilon(\boldsymbol{\alpha}^{\prime} + \boldsymbol{\alpha})^{\top} \mathbf{1} +(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})^{\top} \mathbf{y} - \frac{1}{2}(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})^{\top} \Bigl(\mathbf{K} + \frac{1}{C} \mathbf{I} \Bigr)(\boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha})\tag{11.27}
$$

subject to: $({\pmb \alpha} \geq{\bf 0}) \wedge({\pmb \alpha}^{\prime} \geq{\bf 0}) \wedge({\pmb \alpha}^{\prime} -{\pmb \alpha})^{\top}{\bf 1} = 0)$

Any PDS kernel K can be used with quadratic SVR, which extends the algorithm to non-linear regression solutions. Problem (11.27) is a convex QP similar to the dual problem of SVMs in the separable case and can be solved using similar optimization techniques. The solutions α and $\mathbf{{\boldsymbol{\alpha}}^{\prime}}$ define the hypothesis h returned by SVR as follows: m

$$
h(x) = \sum_{i = 1}^{m}(\alpha_{i}^{\prime} - \alpha_{i}) K(\mathbf{x}_{i}, \mathbf{x}) + b,\tag{11.28}
$$

where the ofset b can be obtained from a point $x_{j}$ with $0 < \alpha_{j} < C$ or $0 < \alpha_{j}^{\prime} < C$ exactly as in the case of SVR with (non-quadratic) $\epsilon$-insensitive loss. Note that for $\epsilon = 0$ , the quadratic SVR algorithm coincides with KRR as can be seen from the dual optimization problem (the additional constraint $({\pmb \alpha}^{\prime} -{\pmb \alpha})^{\top}{\bf 1} = 0$ appears here due to use of an ofset b). The following generalization bound holds for quadratic SVR. It can be shown in a way that is similar to the proof of theorem 11.13 using the fact that the quadratic $\epsilon$-insensitive function $x \mapsto | x |_{\epsilon}^{2}$ is 2M-Lipschitz over the interval $[- M, + M]$

Theorem 11.14 Let $K \colon \mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel, let $\Phi \colon \mathcal{X} \mathbb{H}$ be a feature mapping associated to K and let $\mathcal{H} = \left\{x \mapsto \mathbf{w} \cdot \pmb{\Phi}(x) \colon \lVert \mathbf{w} \rVert_{\mathbb{H}} \leq \Lambda \right\}$ . Assume that there exists $r > 0$ such that $K(x, x) \leq r^{2}$ and $M > 0$ such that $| h(x) - y | \leq M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ . Fix $\epsilon > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following inequalities holds for all $h \in{\mathcal{H}}$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon}^{2} \right] \leq \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon}^{2} \right] + 4M \sqrt{\frac{r^{2} \Lambda^{2}}{m}} + M^{2} \sqrt{\frac{\log \frac{1}{\delta}}{2m}}
$$

$$
\underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon}^{2} \right] \leq \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[| h(x) - y |_{\epsilon}^{2} \right] + \frac{4M \Lambda \sqrt{\mathrm{Tr}[\mathbf{K}]}}{m} + 3M^{2} \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

This theorem provides a strong justification for the quadratic SVR algorithm. Alternative convex loss functions can be used to define regression algorithms, in particular the Huber loss (see figure 11.5), which penalizes smaller errors quadratically and larger ones only linearly.

SVR admits several advantages: the algorithm is based on solid theoretical guarantees, the solution returned is sparse, and it allows a natural use of PDS kernels, which extend the algorithm to non-linear regression solutions. SVR also admits favorable stability properties that we discuss in chapter 14. However, one drawback of the algorithm is that it requires the selection of two parameters, C and $\epsilon$. These can be selected via cross-validation, as in the case of SVMs, but this requires a relatively larger validation set. Some heuristics are often used to guide the search for their values: C is searched near the maximum value of the labels in the absence of an ofset (b = 0) and for a normalized kernel, and $\epsilon$ is chosen close to the average diference of the labels. As already discussed, the value of $\epsilon$ determines the number of support vectors and the sparsity of the solution. Another drawback of SVR is that, as in the case of SVMs or KRR, it may be computationally expensive when dealing with large training sets. One efective solution in such cases, as for KRR, consists of approximating the kernel matrix using low-rank approximations via the Nystr¨om method or the partial Cholesky decomposition. In the next section, we discuss an alternative sparse algorithm for regression.

![Figure 11.5](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/e4c980abcdc9b9b6386f817902568f3550ec9f1dbc07269b2827f4fe14efd158.jpg)  
Figure 11.5  
Alternative loss functions that can be used in conjunction with SVR.

## 11.3.4 Lasso

Unlike the KRR and SVR algorithms, the Lasso (least absolute shrinkage and selection operator) algorithm does not admit a natural use of PDS kernels. Thus, here, we assume that the input space X is a subset of <sup>RN</sup> and consider a family of linear hypotheses ${\mathcal{H}} = \left\{x \mapsto \mathbf{w} \cdot \mathbf{x} + b \colon \mathbf{w} \in \mathbb{R}^{N}, b \in \mathbb{R} \right\}$

Let $S = \bigl((\mathbf{x}_{1}, y_{1}), \ldots,(\mathbf{x}_{m}, y_{m}) \bigr) \in(\Sigma \times \mathbb{Y})^{m}$ be a labeled training sample. Lasso is based on the minimization of the empirical squared error on S with a regularization term depending on the norm of the weight vector, as in the case of the ridge regression, but using the $L_{1}$ norm instead of the $L_{2}$ norm and without squaring the

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/45d213aff2a5e512c0ec8b01c1f713ddd3fb1141492da4bc175d14c1c51517f8.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/216bb805c2b8160a275cbeb29b6790d6744f47d6c863a9d09c3edca36b0d6b79.jpg)  
Figure 11.6

Comparison of the Lasso and ridge regression solutions.

norm:

$$
\min_{\mathbf{w}, b} F(\mathbf{w}, b) = \lambda \| \mathbf{w} \|_{1} + \sum_{i = 1}^{m} \left(\mathbf{w} \cdot \mathbf{x}_{i} + b - y_{i}\right)^{2}.\tag{11.29}
$$

Here λ denotes a positive parameter as for ridge regression. This is a convex optimization problem, since $\lVert \cdot \rVert_{1}$ is convex as with all norms and since the empirical error term is convex, as already discussed for linear regression. The optimization for Lasso can be written equivalently as

$$
\min_{\mathbf{w}, b} \sum_{i = 1}^{m} \left(\mathbf{w} \cdot \mathbf{x}_{i} + b - y_{i}\right)^{2} \quad \text{subject to:} \| \mathbf{w} \|_{1} \leq \Lambda_{1},\tag{11.30}
$$

where $\Lambda_{1}$ is a positive parameter.

The key property of Lasso as in the case of other algorithms using the $L_{1}$ norm constraint is that it leads to a sparse solution w, that is one with few non-zero components. Figure 11.6 illustrates the diference between the $L_{1}$ and $L_{2}$ regularizations in dimension two. The objective function of (11.30) is a quadratic function, thus its contours are ellipsoids, as illustrated by the figure (in blue). The areas corresponding to $L_{1}$ and $L_{2}$ balls of a fixed radius $\Lambda_{1}$ are also shown in the left and right panel (in red). The Lasso solution is the point of intersection of the contours with the $L_{1}$ ball. As can be seen form the figure, this can typically occur at a corner of the $L_{1}$ ball where some coordinates are zero. In contrast, the ridge regression solution is at the point of intersection of the contours and the $L_{2}$ ball, where none of the coordinates is typically zero.

The following results show that Lasso also benefits from strong theoretical guarantees. We first give a general upper bound on the empirical Rademacher complexity of $L_{1}$ norm-constrained linear hypotheses .

Theorem 11.15 (Rademacher complexity of linear hypotheses with bounded $L_{1}$ norm) Let $\mathcal{X} \subseteq \mathbb{R}^{N}$ and let $S = \bigl((\mathbf{x}_{1}, y_{1}), \ldots,(\mathbf{x}_{m}, y_{m}) \bigr) \in(\Sigma \times \mathbb{Y})^{m}$ be a sample of size m. Assume that for all $i \in[m], \ \| \mathbf{x}_{i} \|_{\infty} \leq r_{\infty}$ for some $r_{\infty} > 0$ , and let $\mathcal{H} = \{\mathbf{x} \in$ $\mathcal{X} \mapsto \mathbf{w} \cdot \mathbf{x} \colon \| \mathbf{w} \|_{1} \leq \Lambda_{1} \big\}$ . Then, the empirical Rademacher complexity of H can be bounded as follows:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}) \leq \sqrt{\frac{2r_{\infty}^{2} \Lambda_{1}^{2} \log(2N)}{m}}.\tag{11.31}
$$

Proof: For any $i \in[m]$ we denote by $x_{ij}$ the jth component of $\mathbf{x}_{i}$ .

$$
\begin{array}{ll} \widehat{\mathfrak{R}}_{S}(\mathcal{H}) = \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\| \mathbf{w} \|_{1} \leq \Lambda_{1}} \sum_{i = 1}^{m} \sigma_{i} \mathbf{w} \cdot \mathbf{x}_{i} \right] \\ = \frac{\Lambda_{1}}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|_{\infty} \right] & \text{(by definition of the dual norm)} \\ = \frac{\Lambda_{1}}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\max_{j \in[N]} \left| \sum_{i = 1}^{m} \sigma_{i} x_{ij} \right| \right] & \text{(by definition of} \| \cdot \|_{\infty}) \\ = \frac{\Lambda_{1}}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\max_{j \in[N]} \max_{s \in \{- 1, + 1\}} s \sum_{i = 1}^{m} \sigma_{i} x_{ij} \right] & \text{(by definition of} \| \cdot \|_{\infty}) \\ = \frac{\Lambda_{1}}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{z} \in A} \sum_{i = 1}^{m} \sigma_{i} z_{i} \right], & \end{array}
$$

where A denotes the set of N vectors $\{s(x_{1j}, \hdots, x_{mj})^{\top} : j \in[N], s \in \{- 1, + 1\}\}$ For any $\textbf{z} \in{\A}$ , we have $\| \mathbf{z} \|_{2} \leq \sqrt{mr_{\infty}^{2}} = r_{\infty} \sqrt{m}$ . Thus, by Massart’s lemma (theorem 3.7), since A contains at most 2N elements, the following inequality holds:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}) \leq \Lambda_{1} r_{\infty} \sqrt{m} \frac{\sqrt{2 \log(2N)}}{m} = r_{\infty} \Lambda_{1} \sqrt{\frac{2 \log(2N)}{m}},
$$

which concludes the proof.

Note that dependence of the bound on the dimension N is only logarithmic, which suggests that using very high-dimensional feature spaces does not significantly afect generalization.

Combining the Rademacher complexity bound just proven and the general result of Theorem 11.3 yields the following generalization bound for the hypothesis set used by Lasso, using the squared loss.

Theorem 11.16 Let $\mathcal{X} \subseteq \mathbb{R}^{N}$ and ${\mathcal{H}} = \{\mathbf{x} \in{\mathcal{X}} \mapsto \mathbf{w} \cdot \mathbf{x} \colon \| \mathbf{w} \|_{1} \leq \Lambda_{1}\}$ . Assume that there exists $r_{\infty} > 0$ such for all $\mathbf{x} \in \mathcal{X}, \ \| \mathbf{x} \|_{\infty} \leq r_{\infty}$ and $M > 0$ such that $| h(x) - y | \leq M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following inequalities holds for all $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S}(h) + 2r_{\infty} \Lambda_{1} M \sqrt{\frac{2 \log(2N)}{m}} + M^{2} \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{11.32}
$$

As in the case of ridge regression, we observe that the objective function minimized by Lasso has the same form as the right-hand side of this generalization bound.

There exist a variety of different methods for solving the optimization problem of Lasso, including an efficient algorithm (LARS) for computing the entire regularization path of solutions, that is, the Lasso solutions for all values of the regularization parameter $\lambda,$ and other on-line solutions that apply more generally to optimization problems with an $L_{1}$ norm constraint.

Here, we show that the Lasso problems (11.29) or (11.30) are equivalent to a quadratic program (QP), and therefore that any $\mathrm{QP}$ solver can be used to compute the solution. Observe that any weight vector w can be written as $\mathbf{w} = \mathbf{w}^{+} - \mathbf{w}^{-}$ ， with $\mathbf{w}^{+} \geq 0, \mathbf{w}^{-} \geq 0$ , and $w_{j}^{+} = 0$ or $w_{j}^{-} = 0$ for any $j \in[N]$ , which implies $\begin{array}{r}{\| \mathbf{w} \|_{1} = \sum_{j = 1}^{N} w_{j}^{+} + w_{j}^{-}} \end{array}$ . This can be done by defining the jth component of $\mathbf{w}^{+}$ as $w_{j}$ if $w_{j} \geq 0, 0$ otherwise, and similarly the jth component of $\mathbf{w}^{-} \mathrm{~ as ~} - w_{j} \mathrm{~ if ~} w_{j} \leq 0$ 0 otherwise, for any $j \in[N]$ . With the replacement $\mathbf{w} = \mathbf{w}^{+} - \mathbf{w}^{-}$ , with $\mathbf{w}^{+} \geq 0$ $\mathbf{w}^{-} \geq 0$ , and $\begin{array}{r}{\| \mathbf{w} \|_{1} = \sum_{j = 1}^{N} w_{j}^{+} + w_{j}^{-}} \end{array}$ , the Lasso problem (11.29) becomes

$$
\min_{\mathbf{w}^{+} \geq 0, \mathbf{w}^{-} \geq 0, b} \lambda \sum_{j = 1}^{N}(w_{j}^{+} + w_{j}^{-}) + \sum_{i = 1}^{m} \left((\mathbf{w}^{+} - \mathbf{w}^{-}) \cdot \mathbf{x}_{i} + b - y_{i}\right)^{2}.\tag{11.33}
$$

Conversely, a solution $\mathbf{w} = \mathbf{w}^{+} - \mathbf{w}^{-}$ of (11.33) verifies the condition $w_{j}^{+} = 0$ or $w_{j}^{-} = 0$ for any $j \in[N]$ , thus $w_{j} = w_{j}^{+}$ when $w_{j} \geq 0$ and $w_{j} = - w_{j}^{-}$ when $w_{j} \leq 0$ This is because if $\delta_{j} = \operatorname{min}(w_{j}^{+}, w_{j}^{-}) > 0$ for some $j \in[N]$ , replacing $\boldsymbol{w}_{j}^{+}$ with $(w_{j}^{+} - \delta_{j})$ and $\boldsymbol{w}_{j}^{-}$ with $(w_{j}^{-} - \delta_{j})$ would not afect $w_{j}^{+} - w_{j}^{-} =(w_{j}^{+} - \delta) -(\stackrel{}{w_{j}^{-}} - \delta)$ 2 but would reduce the term $(w_{j}^{+} + w_{j}^{-})$ in the objective function by $2 \delta_{j} > 0$ and provide a better solution. In view of this analysis, problems (11.29) and (11.33) admit the same optimal solution and are equivalent. Problem (11.33) is a QP since the objective function is quadratic in $\mathbf{w}^{+}, \ \mathbf{w}^{-}$ , and $b,$ and since the constraints are Affine. With this formulation, the problem can be straightforwardly shown to admit a natural online algorithmic solution (exercise 11.10).<sup>20</sup>

Thus, Lasso has several advantages: it benefits from strong theoretical guarantees and returns a sparse solution, which is advantageous when there are accurate solutions based on few features. The sparsity of the solution is also computationally attractive; sparse feature representations of the weight vector can be used to make the inner product with a new vector more efficient. The algorithm’s sparsity can also be used for feature selection. The main drawback of the algorithm is that it does not admit a natural use of PDS kernels and thus an extension to non-linear regression, unlike KRR and SVR. One solution is then to use empirical kernel maps, as discussed in chapter 6. Also, Lasso’s solution does not admit a closed-form solution. This is not a critical property from the optimization point of view but one that can make some mathematical analyses very convenient.

## 11.3.5 Group norm regression algorithms

Other types of regularization aside from the $L_{1}$ or $L_{2}$ norm can be used to define regression algorithms. For instance, in some situations, the feature space may be naturally partitioned into subsets, and it may be desirable to find a sparse solution that selects or omits entire subsets of features. A natural norm in this setting is the group or mixed norm $L_{2, 1}$ , which is a combination of the $L_{1}$ and $L_{2}$ norms. Imagine that we partition w $\mathbf{\Psi} \in \mathbb{R}^{N}$ as $\mathbf{w}_{1}, \ldots, \mathbf{w}_{k}$ , where $\mathbf{w}_{j} \in \mathbb{R}^{N_{j}}$ for $1 \leq j \leq k$ and $\textstyle \sum_{j} N_{j} = N$ , and define $\mathbf{W} =(\mathbf{w}_{1}^{\top}, \ldots, \mathbf{w}_{k}^{\top})^{\top}$ . Then the $L_{2, 1}$ norm of W is defined as

$$
\| \mathbf{W} \|_{2, 1} = \sum_{j = 1}^{k} \| \mathbf{w}_{j} \|.
$$

Combining the $L_{2, 1}$ norm with the empirical mean squared error leads to the Group Lasso formulation. More generally, an $\boldsymbol{L}_{q, p}$ group norm regularization can be used for $q, p \geq 1$ (see appendix A for the definition of group norms).

## 11.3.6 On-line regression algorithms

The regression algorithms presented in the previous sections admit natural online versions. Here, we briefly present two examples of these algorithms. These algorithms are particularly useful for applications to very large data sets for which a batch solution can be computationally too costly to derive and more generally in all of the on-line learning settings discussed in chapter 8.

Our first example is known as the Widrow-Hof algorithm and coincides with the application of stochastic gradient descent techniques to the linear regression objective function. Figure 11.7 gives the pseudocode of the algorithm. A similar algorithm can be derived by applying the stochastic gradient technique to ridge regression. At each round, the weight vector is augmented with a quantity that depends on the prediction error $\left(\mathbf{w}_{t} \cdot \mathbf{x}_{t} - y_{t} \right)$ .

Our second example is an online version of the SVR algorithm, which is obtained by application of stochastic gradient descent to the dual objective function of SVR. Figure 11.8 gives the pseudocode of the algorithm for an arbitrary PDS kernel K

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
$\mathrm{WIDROWHOFF}(\mathbf{w}_0)$   
1 $\mathbf{w}_1\gets \mathbf{w}_0$ ▷typically $\mathbf{w}_0 = \mathbf{0}$   
2 for $t\gets 1$ to $T$ do   
3 $\mathrm{RECEIVE}(\mathbf{x}_t)$   
4 $\widehat{y}_t\gets \mathbf{w}_t\cdot \mathbf{x}_t$   
5 $\mathrm{RECEIVE}(y_t)$   
6 $\mathbf{w}_{t + 1}\gets \mathbf{w}_t + 2\eta(\mathbf{w}_t\cdot \mathbf{x}_t - y_t)\mathbf{x}_t$ ▷learning rate $\eta &gt;0$   
7 return $\mathbf{w}_{T + 1}$
</div>

## Figure 11.7

The Widrow-Hof algorithm.

in the absence of any ofset $(b = 0)$ . Another on-line regression algorithm is given by exercise 11.10 for Lasso.

## 11.4 Chapter notes

The generalization bounds presented in this chapter are for bounded regression problems. When $\{x \mapsto L(h(x), y) \colon h \in{\mathcal{H}}\}$ , the family of losses of the hypotheses, is not bounded, a single function can take arbitrarily large values with arbitrarily small probabilities. This is the main issue for deriving uniform convergence bounds for unbounded losses. This problem can be avoided either by assuming the existence of an envelope, that is a single non-negative function with a finite expectation lying above the absolute value of the loss of every function in the hypothesis set [Dudley, 1984, Pollard, 1984, Dudley, 1987, Pollard, 1989, Haussler, 1992], or by assuming that some moment of the loss functions is bounded [Vapnik, 1998, 2006]. Cortes, Greenberg, and Mohri [2013] (see also [Cortes et al., 2010a]) give two-sided generalization bounds for unbounded losses with finite second moments. The onesided version of their bounds coincides with that of Vapnik [1998, 2006] modulo a constant factor, but the proofs given by Vapnik in both books seem to be incomplete and incorrect.

The notion of pseudo-dimension is due to Pollard [1984]. Its equivalent definition in terms of VC-dimension is discussed by Vapnik [2000]. The notion of fat-shattering was introduced by Kearns and Schapire [1990]. The linear regression algorithm is a classical algorithm in statistics that dates back at least to the nine-

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
ONLINEDUALSVR()
1  $\alpha \leftarrow 0$ 
2  $\alpha' \leftarrow 0$ 
3 for  $t \leftarrow 1$  to T do
4  $\text{RECEIVE}(x_t)$ 
5  $\widehat{y}_t \leftarrow \sum_{s=1}^t(\alpha_s' - \alpha_s) K(x_s, x_t)$ 
6  $\text{RECEIVE}(y_t)$ 
7  $\alpha'_{t+1} \leftarrow \alpha'_t + \min(\max(\eta(y_t - \widehat{y}_t - \epsilon), -\alpha'_t), C - \alpha'_t)$ 
8  $\alpha_{t+1} \leftarrow \alpha_t + \min(\max(\eta(\widehat{y}_t - y_t - \epsilon), -\alpha_t), C - \alpha_t)$ 
9 return  $\sum_{t=1}^T(\alpha'_t - \alpha_t) K(x_t, \cdot)$
</div>

## Figure 11.8

An on-line version of dual SVR.

teenth century. The ridge regression algorithm is due to Hoerl and Kennard [1970]. Its kernelized version (KRR) was introduced and discussed by Saunders, Gammerman, and Vovk [1998]. An extension of KRR to outputs in $\mathbb{R}^{p}$ with $p > 1$ with possible constraints on the regression is presented and analyzed by Cortes, Mohri, and Weston [2007c]. The support vector regression (SVR) algorithm is discussed in Vapnik [2000]. Lasso was introduced by Tibshirani [1996]. The LARS algorithm for solving its optimization problem was later presented by Efron et al. [2004]. The Widrow-Hof on-line algorithm is due to Widrow and Hof [1988]. The dual on-line SVR algorithm was first introduced and analyzed by Vijayakumar and Wu [1999]. The kernel stability analysis of exercise 10.3 is from Cortes et al. [2010b].

For large-scale problems where a straightforward batch optimization of a primal or dual objective function is intractable, general iterative stochastic gradient descent methods similar to those presented in section 11.3.6, or quasi-Newton methods such as the limited-memory BFGS (Broyden-Fletcher-Goldfard-Shanno) algorithm [Nocedal, 1980] can be practical alternatives in practice.

In addition to the linear regression algorithms presented in this chapter and their kernel-based non-linear extensions, there exist many other algorithms for regression, including decision trees for regression (see chapter 9), boosting trees for regression, and artificial neural networks.

## 11.5 Exercises

11.1 Pseudo-dimension and monotonic functions.

Assume that $\phi$ is a strictly monotonic function and let $\phi \circ{\mathcal{H}}$ be the family of functions defined by $\phi \circ \mathcal{H} = \{\phi(h(\cdot)) : h \in \mathcal{H}\}$ , where H is some set of real-valued functions. Show that $\mathrm{Pdim}(\phi \circ \mathcal{H}) = \mathrm{Pdim}(\mathcal{H})$

11.2 Pseudo-dimension of linear functions. Let H be the set of all linear functions in dimension $d,$ i.e. $h(\mathbf{x}) = \mathbf{w}^{\top} \mathbf{x}$ for some $\mathbf{w} \in \mathbb{R}^{d}$ . Show that $\mathrm{Pdim}(\mathcal{H}) = d.$

11.3 Linear regression.

(a) What condition is required on the data X in order to guarantee that $\mathbf{\mathbf{XX}^{\top}}$ is invertible?

(b) Assume the problem is under-determined. Then, we can choose a solution w such that the equality $\mathbf{X}^{\top} \mathbf{w} = \mathbf{X}^{\top}(\mathbf{X} \mathbf{X}^{\top})^{\top} \mathbf{X} \mathbf{y}$ (which can be shown to equal $\mathbf{X}^{\dagger} \mathbf{X} \mathbf{y})$ holds. One particular choice that satisfies this equality is $\mathbf{w}^{*} =(\mathbf{XX}^{\top})^{\dagger} \mathbf{Xy}$ . However, this is not the unique solution. As a function of $\mathbf{w}^{*}$ , characterize all choices of w that satisfy $\mathbf{X}^{\top} \mathbf{w} = \mathbf{X}^{\top} \mathbf{X} \mathbf{y}$ (Hint: use the fact that $\mathbf{X} \mathbf{X}^{\dagger} \mathbf{X} = \mathbf{X})$

11.4 Perturbed kernels. Suppose two different kernel matrices, K and $\mathbf{K}^{\prime}$ , are used to train two kernel ridge regression hypothesis with the same regularization parameter λ. In this problem, we will show that the diference in the optimal dual variables, α and $\mathbf{{\boldsymbol{\alpha}}^{\prime}}$ respectively, is bounded by a quantity that depends on $\| \mathbf{K}^{\prime} - \mathbf{K} \|_{2}$

(a) Show $\alpha^{\prime} - \alpha = \left((\mathbf{K}^{\prime} + \lambda \mathbf{I})^{- 1}(\mathbf{K}^{\prime} - \mathbf{K})(\mathbf{K} + \lambda \mathbf{I})^{- 1} \right) \mathbf{y}$ . (Hint: Show that for any invertible matrix M, $\mathbf{M}^{\prime 1} - \mathbf{M}^{1} = - \mathbf{M}^{\prime - 1}(\mathbf{M}^{\prime} - \mathbf{M}) \mathbf{M}^{- 1}.)$

(b) Assuming $\forall y \in \mathcal{Y}, | y | \leq M$ , show that

$$
\left\| \boldsymbol{\alpha}^{\prime} - \boldsymbol{\alpha} \right\| \leq \frac{\sqrt{m} M \left\| \mathbf{K}^{\prime} - \mathbf{K} \right\|_{2}}{\lambda^{2}}.
$$

11.5 Huber loss. Derive the primal and dual optimization problem used to solve the SVR problem with the Huber loss:

$$
L_{c}(\xi_{i}) = \left\{\begin{array}{ll} \frac{1}{2} \xi_{i}^{2}, & \text{if | \xi_{i}| \leq c} \\ c \xi_{i} - \frac{1}{2} c^{2}, & \text{otherwise} \end{array} \right.,
$$

where $\xi_{i} = \mathbf{w} \cdot \Phi(\mathbf{x}_{i}) + b - y_{i}$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
ONLINELASSO($\mathbf{w}_0^+$, $\mathbf{w}_0^-$)
1 $\mathbf{w}_1^+ \leftarrow \mathbf{w}_0^+$ $\triangleright \mathbf{w}_0^+ \geq 0$
2 $\mathbf{w}_1^- \leftarrow \mathbf{w}_0^-$ $\triangleright \mathbf{w}_0^- \geq 0$
3 for $t \leftarrow 1$ to $T$ do
4    RECEIVE($\mathbf{x}_t, y_t$)
5    for $j \leftarrow 1$ to $N$ do
6    $w_{t+1j}^+ \leftarrow \max \left(0, w_{tj}^+ - \eta \left[\lambda -[y_t -(\mathbf{w}_t^+ - \mathbf{w}_t^-) \cdot \mathbf{x}_t] \mathbf{x}_{tj} \right]\right)$
7    $w_{t+1j}^-\leftarrow \max \left(0, w_{tj}^- - \eta \left[\lambda +[y_t -(\mathbf{w}_t^+ - \mathbf{w}_t^-) \cdot \mathbf{x}_t] \mathbf{x}_{tj} \right]\right)$
8 return $\mathbf{w}_{T+1}^+ - \mathbf{w}_{T+1}^-$
</div>

## Figure 11.9

On-line algorithm for Lasso.

11.6 SVR and squared loss. Assuming that $2r \Lambda \leq 1$ , use theorem 11.13 to derive a generalization bound for the squared loss.

11.7 SVR dual formulations. Give a detailed and carefully justified derivation of the dual formulations of the SVR algorithm both for the $\epsilon$-insensitive loss and the quadratic $\epsilon$-insensitive loss.

11.8 Optimal kernel matrix. Suppose in addition to optimizing the dual variables $\alpha \in \mathbb{R}^{m}$ , as in (11.16), we also wish to optimize over the entries of the PDS kernel matrix $\mathbf{K} \in \mathbb{R}^{m \times m}$

$$
\min_{\mathbf{K} \succeq 0} \max_{\boldsymbol{\alpha}} - \lambda \boldsymbol{\alpha}^{\top} \boldsymbol{\alpha} - \boldsymbol{\alpha}^{\top} \mathbf{K} \boldsymbol{\alpha} + 2 \boldsymbol{\alpha}^{\top} \mathbf{y}, \text{s.t.} \| \mathbf{K} \|_{2} \leq 1
$$

(a) What is the closed-form solution for the optimal K for the joint optimization?

(b) Optimizing over the choice of kernel matrix will provide a better value of the objective function. Explain, however, why the resulting kernel matrix is not useful in practice.

11.9 Leave-one-out error. In general, the computation of the leave-one-out error can be very costly since, for a sample of size m, it requires training the algorithm m times. The objective of this problem is to show that, remarkably, in the case of kernel ridge regression, the leave-one-out error can be computed eficiently by training the algorithm only once.

Let $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ denote a training sample of size m and for any $i \in[m]$ , let $S_{i}$ denote the sample of size $m - 1$ obtained from S by removing $(x_{i}, y_{i}) \colon S_{i} = S - \{(x_{i}, y_{i})\}$ . For any sample $T_{\cdot}$ , let $h_{T}$ denote a hypothesis obtained by training $T$ . By definition (see definition 5.2), for the squared loss, the leave-one-out error with respect to S is defined by

$$
\widehat{R}_{\mathrm{LOO}}(\mathrm{KRR}) = \frac{1}{m} \sum_{i = 1}^{m}(h_{S_{i}}(x_{i}) - y_{i})^{2}.
$$

(a) Let $S_{i}^{\prime} =((x_{1}, y_{1}), \dots,(x_{i}, h_{S_{i}}(y_{i})), \dots,(x_{m}, y_{m}))$ . Show that $h_{S_{i}} = h_{S_{i}^{\prime}}$

(b) Define ${\bf y}_{i} ={\bf y} - y_{i}{\pmb e}_{i} + h_{S_{i}}(x_{i}){\pmb e}_{i}$ , that is the vector of labels with the ith component replaced with $h_{S_{i}}(x_{i})$ . Prove that for KRR $h_{S_{i}}(x_{i}) = \mathbf{y}_{i}^{\top}(\mathbf{K} +$ $\lambda \mathbf{I})^{- 1} \mathbf{K} e_{i}$

(c) Prove that the leave-one-out error admits the following simple expression in terms of $h_{S}$ :

$$
\widehat{R}_{\mathrm{LOO}}(\mathrm{KRR}) = \frac{1}{m} \sum_{i = 1}^{m} \left[\frac{h_{S}(x_{i}) - y_{i}}{\pmb{e}_{i}^{\top}(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{K} \pmb{e}_{i}} \right]^{2}.\tag{11.34}
$$

(d) Suppose that the diagonal entries of matrix $\mathbf{M} =(\mathbf{K} + \lambda \mathbf{I})^{- 1} \mathbf{K}$ are all equal to $\gamma$ . How do the empirical error $\widehat{R}_{S}$ of the algorithm and the leave-one-out error $\widehat{R}_{\mathrm{LOO}}$ relate? Is there any value of $\gamma$ for which the two errors coincide?

11.10 On-line Lasso. Use the formulation (11.33) of the optimization problem of Lasso and stochastic gradient descent (see section 8.3.1) to show that the problem can be solved using the on-line algorithm of figure 11.9.

11.11 On-line quadratic SVR. Derive an on-line algorithm for the quadratic SVR algorithm (provide the full pseudocode).

In this chapter, we introduce and discuss maximum entropy models, also known as Maxent models, a widely used family of algorithms for density estimation that can exploit rich feature sets. We first introduce the standard density estimation problem and briefly describe the Maximum Likelihood and Maximum a Posteriori solutions. Next, we describe a richer density estimation problem where the learner additionally has access to features. This is the problem addressed by Maxent models.

We introduce the key principle behind Maxent models and formulate their primal optimization problem. Next, we prove a duality theorem showing that Maxent models coincide with Gibbs distribution solutions of a regularized Maximum Likelihood problem. We present generalization guarantees for these models and also give an algorithm for solving their dual optimization problem using a coordinate descent technique. We further extend these models to the case where an arbitrary Bregman divergence is used with other norms, and prove a general duality theorem leading to an equivalent optimization problem with alternative regularizations. We also give a specific theoretical analysis of Maxent models with L -regularization, which are commonly used in applications.


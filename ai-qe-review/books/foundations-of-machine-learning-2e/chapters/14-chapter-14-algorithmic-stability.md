---
title: "Chapter 14 \u2014 Algorithmic Stability"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 14
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 8402
source_line_end: 8763
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 0
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 7
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 14 — Algorithmic Stability

> [[../README|本书目录]] · [[13-chapter-13-conditional-maximum-entropy-models|上一章]] · [[15-chapter-15-dimensionality-reduction|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 8402–8763。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 7；different × 2；sufficient × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Algorithmic Stability

In chapters 2–5 and several subsequent chapters, we presented a variety of generalization bounds based on different measures of the complexity of the hypothesis set H used for learning, including the Rademacher complexity, the growth function, and the VC-dimension. These bounds ignore the specific algorithm used, that is, they hold for any algorithm using H as a hypothesis set.

One may ask if an analysis of the properties of a specific algorithm could lead to finer guarantees. Such an algorithm-dependent analysis could have the benefit of a more informative guarantee. On the other hand, it could be inapplicable to other algorithms using the same hypothesis set. Alternatively, as we shall see in this chapter, a more general property of the learning algorithm could be used to incorporate algorithm-specific properties while extending the applicability of the analysis to other learning algorithms with similar properties.

This chapter uses the property of algorithmic stability to derive algorithm-dependent learning guarantees. We first present a generalization bound for any algorithm that is suficiently stable. Then, we show that the wide class of kernel-based regularization algorithms enjoys this property and derive a general upper bound on their stability coeficient. Finally, we illustrate the application of these results to the analysis of several algorithms both in the regression and classification settings, including kernel ridge regression (KRR), SVR, and SVMs.

## 14.1 Definitions

We start by introducing the notation and definitions relevant to our analysis of algorithmic stability. We denote by z a labeled example $(x, y) \in{\mathcal{X}} \times \mathcal{Y}$ . The hypotheses h we consider map X to a set $\mathcal{Y}^{\prime}$ sometimes different from Y. In particular, for classification, we may have $\mathcal{Y} = \{- 1, + 1\}$ while the hypothesis h learned takes values in <sup>R</sup>. The loss functions L we consider are therefore defined over $\mathcal{Y}^{\prime} \times \mathcal{Y}$ , with $\mathcal{Y}^{\prime} = \mathcal{Y}$ in most cases. For a loss function $L \colon \mathcal{Y}^{\prime} \times \mathcal{Y} \mathbb{R}_{+}$ , we denote the loss of a hypothesis h at point z by $L_{z}(h) = L(h(x), y)$ . We denote by D the distribution according to which samples are drawn and by H the hypothesis set. The empirical error or loss of $h \in{\mathcal{H}}$ on a sample $S =(z_{1}, \dots, z_{m})$ and its generalization error are defined, respectively, by

$$
\widehat{R}_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m} L_{z_{i}}(h) \quad \text{and} \quad R(h) = \underset{z \sim \mathcal{D}}{\mathbb{E}}[L_{z}(h)].
$$

Given an algorithm , we denote by $h_{S}$ the hypothesis $h_{S} \in \mathcal{H}$ returned by when trained on sample S. We will say that the loss function L is bounded by $M \geq 0$ if for all $h \in{\mathcal{H}}$ and $z \in \mathcal{X} \times \mathcal{Y}, L_{z}(h) \leq M$ . For the results presented in this chapter, a weaker condition sufices, namely that $L_{z}(h_{S}) \leq M$ for all hypotheses $h_{S}$ returned by the algorithm .

We are now able to define the notion of uniform stability, the algorithmic property used in the analyses of this chapter.

Definition 14.1 (Uniform stability) Let S and $S^{\prime}$ be any two training samples that differ by a single point. Then, a learning algorithm  is uniformly β-stable if the hypotheses it returns when trained on any such samples S and $S^{\prime}$ satisfy

$$
\forall z \in \mathcal{Z}, \quad | L_{z}(h_{S}) - L_{z}(h_{S^{\prime}}) | \leq \beta.
$$

The smallest such $\beta$ satisfying this inequality is called the stability coeficient of .

In other words, when is trained on two similar training sets, the losses incurred by the corresponding hypotheses returned by should not difer by more than $\beta.$ . Note that a uniformly β-stable algorithm is often referred to as being β-stable or even just stable (for some unspecified $\beta)$ . In general, the coeficient $\beta$ depends on the sample size $m$ . We will see in section 14.2 that $\beta = o(1 / \sqrt{m})$ is necessary for the convergence of the stability-based learning bounds presented in this chapter. In section 14.3, we will show that a more favorable condition holds, that is, $\beta =$ $O(1 / m)$ , for a wide family of algorithms.

## 14.2 Stability-based generalization guarantee

In this section, we show that exponential bounds can be derived for the generalization error of stable learning algorithms. The main result is presented in theorem 14.2.

Theorem 14.2 Assume that the loss function L is bounded by $M \geq 0$ . Let be a β-stable learning algorithm and let S be a sample of m points drawn i.i.d. according to distribution D. Then, with probability at least $1 - \delta$ over the sample $S$ drawn, the following holds:

$$
R(h_{S}) \leq \widehat{R}_{S}(h_{S}) + \beta +(2m \beta + M) \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Proof: The proof is based on the application of McDiarmid’s inequality (theorem D.8) to the function $\Phi$ defined for all samples S by $\Phi(S) = R(h_{S}) - \widehat{R}_{S}(h_{S})$ Let $S^{\prime}$ be another sample of size m with points drawn i.i.d. according to D that difers from $S$ by exactly one point. We denote that point by $z_{m}$ in $S, z_{m}^{\prime}$ in $S^{\prime}$ i.e.,

$$
S =(z_{1}, \dots, z_{m - 1}, z_{m}) \quad \text{and} \quad S^{\prime} =(z_{1}, \dots, z_{m - 1}, z_{m}^{\prime}).
$$

By definition of $\Phi_{;}$ , the following inequality holds:

$$
| \Phi(S^{\prime}) - \Phi(S) | \leq | R(h_{S^{\prime}}) - R(h_{S}) | + | \widehat{R}_{S^{\prime}}(h_{S^{\prime}}) - \widehat{R}_{S}(h_{S}) |.\tag{14.1}
$$

We bound each of these two terms separately. By the $\beta{\mathrm{- stability}}$ of ${\mathcal{A}},$ we have

$$
| R(h_{S}) - R(h_{S^{\prime}}) | = | \underset{z}{\mathbb{E}}[L_{z}(h_{S})] - \underset{z}{\mathbb{E}}[L_{z}(h_{S^{\prime}})] | \leq \underset{z}{\mathbb{E}}[| L_{z}(h_{S}) - L_{z}(h_{S^{\prime}}) |] \leq \beta.
$$

Using the boundedness of L along with $\beta{\mathrm{- stability}}$ of ${\mathcal{A}},$ we also have

$$
\begin{array}{l} | \widehat{R}_{S}(h_{S}) - \widehat{R}_{S^{\prime}}(h_{S^{\prime}}) | = \frac{1}{m} \Bigg | \bigg(\sum_{i = 1}^{m - 1} L_{z_{i}}(h_{S}) - L_{z_{i}}(h_{S^{\prime}}) \bigg) + L_{z_{m}}(h_{S}) - L_{z_{m}^{\prime}}(h_{S^{\prime}}) \Bigg | \\ \leq \frac{1}{m} \Bigg[\bigg(\sum_{i = 1}^{m - 1} | L_{z_{i}}(h_{S}) - L_{z_{i}}(h_{S^{\prime}}) | \bigg) + | L_{z_{m}}(h_{S}) - L_{z_{m}^{\prime}}(h_{S^{\prime}}) | \Bigg] \\ \leq \frac{m - 1}{m} \beta + \frac{M}{m} \leq \beta + \frac{M}{m}.\end{array}
$$

Thus, in view of (14.1), Φ satisfies the condition $\begin{array}{r}{| \Phi(S) - \Phi(S^{\prime}) | \le 2 \beta + \frac{M}{m}} \end{array}$ . By applying McDiarmid’s inequality to $\Phi(S)$ , we can bound the deviation of $\Phi$ from its mean as 0

$$
\mathbb{P} \left[\Phi(S) \geq \epsilon + \underset{S}{\mathbb{E}}[\Phi(S)] \right] \leq \exp \left(\frac{- 2m \epsilon^{2}}{(2m \beta + M)^{2}}\right),
$$

or, equivalently, with probability $1 - \delta$ 4

$$
\Phi(S) < \epsilon + \underset{S}{\mathbb{E}}[\Phi(S)],\tag{14.2}
$$

where $\begin{array}{r}{\delta = \exp \left(\frac{- 2m \epsilon^{2}}{(2m \beta + M)^{2}} \right)} \end{array}$ . If we solve for $\epsilon$ in this expression for $\delta,$ plug into (14.2) and rearrange terms, then, with probability $1 - \delta.$ , we have

$$
\Phi(S) \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\Phi(S)] +(2m \beta + M) \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{14.3}
$$

We now bound the expectation term, first noting that by linearity of expectation $\mathbb{E}_{S}[\Phi(S)] = \mathbb{E}_{S}[R(h_{S})] - \mathbb{E}_{S}[\widehat{R}_{S}(h_{S})]$ . By definition of the generalization error,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[R(h_{S})] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\underset{z \sim \mathcal{D}}{\mathbb{E}}[L_{z}(h_{S})] \right] = \underset{S, z \sim \mathcal{D}^{m + 1}}{\mathbb{E}}[L_{z}(h_{S})].\tag{14.4}
$$

By the linearity of expectation,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\widehat{R}_{S}(h_{S})] = \frac{1}{m} \sum_{i = 1}^{m} \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{z_{i}}(h_{S})] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{z_{1}}(h_{S})],\tag{14.5}
$$

where the second equality follows from the fact that the $z_{i}$ are drawn i.i.d. and thus the expectations $\mathbb{E}_{S \sim \mathcal{D}^{m}}[L_{z_{i}}(h_{S})], i \in[m]$ , are all equal. The last expression in (14.5) is the expected loss of a hypothesis on one of its training points. We can rewrite it as $\mathbb{E}_{S \sim D^{m}}[L_{z_{1}}(h_{S})] = \mathbb{E}_{S, z \sim \mathcal{D}^{m + 1}}[L_{z}(h_{S^{\prime}})]$ , where $S^{\prime}$ is a sample of $m$ points containing z extracted from the $m + 1$ points formed by $S$ and $z.$ Thus, in view of (14.4) and by the $\beta{\mathrm{- stability}}$ of ${\mathcal{A}},$ it follows that

$$
\begin{array}{l} | \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\Phi(S)] | = \big | \underset{S, z \sim \mathcal{D}^{m + 1}}{\mathbb{E}}[L_{z}(h_{S})] - \underset{S, z \sim \mathcal{D}^{m + 1}}{\mathbb{E}}[L_{z}(h_{S^{\prime}})] \big | \\ \qquad \leq \underset{S, z \sim \mathcal{D}^{m + 1}}{\mathbb{E}} \big[| L_{z}(h_{S}) - L_{z}(h_{S^{\prime}}) | \big] \\ \qquad \leq \underset{S, z \sim \mathcal{D}^{m + 1}}{\mathbb{E}}[\beta] = \beta.\end{array}
$$

We can thus replace $\mathbb{E}_{S}[\Phi(S)]$ by $\beta$ in (14.3), which completes the proof. $\square$ The bound of the theorem converges for $(m \beta) / \sqrt{m} = o(1)$ , that is $\beta = o(1 / \sqrt{m})$ In particular, when the stability coeficient $\beta$ is in $O(1 / m)$ , the theorem guarantees that $R(h_{S}) - \widehat{R}_{S}(h_{S}) = O(1 / \sqrt{m})$ with high probability. In the next section, we show that kernel-based regularization algorithms precisely admit this property under some general assumptions.

## 14.3 Stability of kernel-based regularization algorithms

Let K be a positive definite symmetric kernel, <sup>H</sup> the reproducing kernel Hilbert space associated to $K$ , and $\| \cdot \|_{K}$ the norm induced by K in <sup>H</sup>. A kernel-based regularization algorithm is defined by the minimization over <sup>H</sup> of an objective function $F_{S}$ based on a training sample $S =(z_{1}, \dots, z_{m})$ and defined for all $h \in \mathbb{H}$ by:

$$
F_{S}(h) = \widehat{R}_{S}(h) + \lambda \| h \|_{K}^{2}.\tag{14.6}
$$

In this equation, $\begin{array}{r}{\widehat{R}_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m} L_{z_{i}}(h)} \end{array}$ is the empirical error of hypothesis h with respect to a loss function L and $\lambda \geq 0$ a trade-of parameter balancing the emphasis on the empirical error versus the regularization term $\| h \|_{K}^{2}$ . The hypothesis set H is the subset of <sup>H</sup> formed by the hypotheses possibly returned by the algorithm. Algorithms such as KRR, SVR and SVMs all fall under this general model.

We first introduce some definitions and tools needed for a general proof of an upper bound on the stability coeficient of kernel-based regularization algorithms. Our analysis will assume that the loss function $L$ is convex and that it further verifies the following Lipschitz-like smoothness condition.

Definition 14.3 (σ-admissibility) A loss function L is σ-admissible with respect to the hypothesis class H if there exists $\sigma \in \mathbb{R}_{+}$ such that for any two hypotheses h, $h^{\prime} \in \mathcal{H}$ and for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ ，

$$
\left| L \left(h^{\prime}(x), y\right) - L(h(x), y) \right| \leq \sigma \left| h^{\prime}(x) - h(x) \right|.\tag{14.7}
$$

This assumption holds for the quadratic loss and most other loss functions where the hypothesis set and the set of output labels are bounded by some $M \in \mathbb{R}_{+}$ : $\forall h \in \mathcal{H}, \forall x \in \mathcal{X}, | h(x) | \leq M$ and $\forall y \in \mathcal{Y}, | y | \leq M$

We will use the notion of Bregman divergence, $B_{F}$ which can be defined for any convex and diferentiable function $F \colon \mathbb{H} \mathbb{R}$ as follows: for all $f, g \in \mathbb{H}$ 5

$$
B_{F}(f \| g) = F(f) - F(g) - \langle f - g, \nabla F(g) \rangle.
$$

Section E.4 presents the properties of the Bregman divergence in more detail and also contains figure E.2 which illustrates the geometric interpretation of the Bregman divergence. We generalize the definition of Bregman divergence to cover the case of convex but non-diferentiable loss functions F by using the notion of subgradient. For a convex function $F \colon \mathbb{H} \mathbb{R}$ , we denote by $\partial F(h)$ the subdiferential of F at $h,$ which is defined as follows:

$$
\partial F(h) = \{g \in \mathbb{H} \colon \forall h^{\prime} \in \mathbb{H}, F(h^{\prime}) - F(h) \geq \langle h^{\prime} - h, g \rangle\}.
$$

Thus, $\partial F(h)$ is the set of vectors g defining a hyperplane supporting function F at point h (see figure 14.1). Elements of the subdiferential are called subgradients (see section B.4.1 for more discussion). Note, the subgradient found in $\partial F(h)$ coincides with $\nabla F(h)$ when F is diferentiable at h, i.e. $\partial F(h) = \{\nabla F(h)\}$ . Furthermore, at a point h where F is minimal, 0 is an element of $\partial F(h)$ The subgradient is additive, that is, for two convex function $F_{1}$ and $F_{2}, \partial(F_{1} + F_{2})(h) = \{g_{1} + g_{2} \colon g_{1} \in$ $\partial F_{1}(h), g_{2} \in \partial F_{2}(h)\}$ . For any $h \in \mathbb{H}$ , we fix $\delta F(h)$ to be an (arbitrary) element of $\partial F(h)$ . For any such choice of $\delta F$ , we can define the generalized Bregman divergence associated to $F$ by:

$$
\forall h^{\prime}, h \in \mathbb{H}, B_{F}(h^{\prime} \| h) = F(h^{\prime}) - F(h) - \langle h^{\prime} - h, \delta F(h) \rangle.\tag{14.8}
$$

Note that by definition of the subgradient, $B_{F}(h^{\prime} \parallel h) \ge 0$ for all $h^{\prime}, h \in \mathbb{H}$

Starting from (14.6), we can now define the generalized Bregman divergence of $F_{S}$ . Let N denote the convex function $h \| h \|_{K}^{2}$ . Since N is diferentiable, $\delta N(h) = \nabla N(h)$ for all $h \in \mathbb{H}$ , and thus $\delta N$ (as well as $B_{N})$ is uniquely defined. To make the definition of the Bregman divergences for $F_{S}$ and $\widehat{R}_{S}$ compatible so that $B_{F_{S}} = B_{\widehat{R}_{S}} + \lambda B_{N}$ , we define $\delta \widehat{R}_{S}$ in terms of $\delta F_{S}$ by: $\delta \widehat{R}_{S}(h) = \delta F_{S}(h) - \lambda \nabla N(h)$ for all $h \in \mathbb{H}$ . Furthermore, we choose $\delta F_{S}(h)$ to be 0 for any point h where $F_{S}$ is minimal and let $\delta F_{S}(h)$ be an arbitrary element of $\partial F_{S}(h)$ for all other $h \in \mathbb{H}$ We proceed in a similar way to define the Bregman divergences for $F_{S^{\prime}}$ and ${\widehat{R}}_{S^{\prime}}$ so that $B_{F_{S^{\prime}}} = B_{\widehat{R}_{S^{\prime}}} + \lambda B_{N}$

![Figure 14.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/d08b2fede77599a9df72f2f984ecda807bbdbe051e10936b52156af1b78c64dd.jpg)  
Figure 14.1  
Illustration of the notion of subgradient: supporting hyperplanes (shown in red, orange and green) for the function F (shown in blue) at point h are defined by elements of the subdiferential $\bar{\partial{\cal F}}(h)$

We will use the notion of generalized Bregman divergence for the proof of the following general upper bound on the stability coeficient of kernel-based regularization algorithms.

Proposition 14.4 Let K be a positive definite symmetric kernel such that for all $x \in \mathfrak{X}, \K(x, x) \ \leq \r^{2}$ for some $r \in \mathbb{R}_{+}$ and let L be a convex and σ-admissible loss function. Then, the kernel-based regularization algorithm defined by the minimization (14.6) is $\beta$ -stable with the following upper bound on $\beta$ :

$$
\beta \leq \frac{\sigma^{2} r^{2}}{m \lambda}.
$$

Proof: Let h be a minimizer of $F_{S}$ and $h^{\prime}$ a minimizer of $F_{S^{\prime}}$ , where samples S and $S^{\prime}$ difer exactly by one point, $z_{m}$ in $S$ and $z_{m}^{\prime}$ in $S^{\prime}$ . Since the generalized Bregman divergence is non-negative and since $B_{F_{S}} = B_{\widehat{R}_{S}} + \lambda B_{N}$ and $B_{F_{S^{\prime}}} = B_{\widehat{R}_{S^{\prime}}} + \lambda B_{N}$ • we can write

$$
B_{F_{S}}(h^{\prime} \| h) + B_{F_{S^{\prime}}}(h \| h^{\prime}) \geq \lambda \big(B_{N}(h^{\prime} \| h) + B_{N}(h \| h^{\prime}) \big).
$$

Observe that $B_{N}(h^{\prime} | \| h) + B_{N}(h \| h^{\prime}) = - \left.h^{\prime} - h, 2h \right.- \left.h - h^{\prime}, 2h^{\prime} \right.= 2 \| h^{\prime} - h \|_{K}^{2}.$ Let $\Delta h$ denote $h^{\prime} - h$ , then we can write

$$
\begin{array}{rl} &{2 \lambda | | \Delta h | |_{K}^{2}} \\ &{\quad \leq B_{F_{S}}(h^{\prime} \| h) + B_{F_{S^{\prime}}}(h \| h^{\prime})} \\ &{\quad = F_{S}(h^{\prime}) - F_{S}(h) - \langle h^{\prime} - h, \delta F_{S}(h) \rangle + F_{S^{\prime}}(h) - F_{S^{\prime}}(h^{\prime}) - \langle h - h^{\prime}, \delta F_{S^{\prime}}(h^{\prime}) \rangle} \\ &{\quad = F_{S}(h^{\prime}) - F_{S}(h) + F_{S^{\prime}}(h) - F_{S^{\prime}}(h^{\prime})} \\ &{\quad = \widehat{R}_{S}(h^{\prime}) - \widehat{R}_{S}(h) + \widehat{R}_{S^{\prime}}(h) - \widehat{R}_{S^{\prime}}(h^{\prime}).} \end{array}
$$

The second equality follows from the definition of $h^{\prime}$ and $h$ as minimizers and our choice of the subgradients for minimal points which together imply $\delta F_{S^{\prime}}(h^{\prime}) = 0$ and $\delta F_{S}(h) = 0$ . The last equality follows from the definitions of $F_{S}$ and $F_{S^{\prime}}$ . Next, we express the resulting inequality in terms of the loss function L and use the fact that $S$ and $S^{\prime}$ difer by only one point along with the σ-admissibility of $L$ to get

$$
\begin{array}{rl} & 2 \lambda \| \Delta h \|_{K}^{2} \leq \frac{1}{m}[L_{z_{m}}(h^{\prime}) - L_{z_{m}}(h) + L_{z_{m}^{\prime}}(h) - L_{z_{m}^{\prime}}(h^{\prime})] \\ & \qquad \leq \frac{\sigma}{m}[| \Delta h(x_{m}) | + | \Delta h(x_{m}^{\prime}) |].\end{array}\tag{14.9}
$$

By the reproducing kernel property and the Cauchy-Schwarz inequality, for all $x \in{\mathfrak{X}}$ 2

$$
\Delta h(x) = \langle \Delta h, K(x, \cdot) \rangle \leq \| \Delta h \|_{K} \| K(x, \cdot) \|_{K} = \sqrt{K(x, x)} \| \Delta h \|_{K} \leq r \| \Delta h \|_{K}.
$$

In view of (14.9), this implies $\begin{array}{r}{\| \Delta h \|_{K} \le \frac{\sigma r}{\lambda m}} \end{array}$ . By the σ-admissibility of $L$ and the reproducing property, the following holds:

$$
\forall z \in \mathcal{X} \times \mathcal{Y}, | L_{z}(h^{\prime}) - L_{z}(h) | \leq \sigma | \Delta h(x) | \leq r \sigma \| \Delta h \|_{K},
$$

which gives

$$
\forall z \in \mathcal{X} \times \mathcal{Y}, | L_{z}(h^{\prime}) - L_{z}(h) | \leq \frac{\sigma^{2} r^{2}}{m \lambda},
$$

and concludes the proof.

Thus, under the assumptions of the proposition, for a fixed $\lambda,$ the stability coeficient of kernel-based regularization algorithms is in $O(1 / m)$

## 14.3.1 Application to regression algorithms: SVR and KRR

Here, we analyze more specifically two widely used regression algorithms, Support Vector Regression (SVR) and Kernel Ridge Regression (KRR), which are both special instances of the family of kernel-based regularization algorithms.

SVR is based on the $\epsilon$-insensitive loss $L_{\epsilon}$ defined for all $(y, y^{\prime}) \in \mathcal{Y} \times \mathcal{Y}$ by:

$$
L_{\epsilon}(y^{\prime}, y) = \left\{\begin{array}{ll} 0 & \text{if |y^{\prime} -y|\leq\epsilon;} \\ | y^{\prime} - y | - \epsilon & \text{otherwise.} \end{array} \right.\tag{14.10}
$$

We now present a stability-based bound for SVR assuming that $L_{\epsilon}$ is bounded for the hypotheses returned by SVR (which, as we shall later see in lemma 14.7, is indeed the case when the label set Y is bounded).

Corollary 14.5 (Stability-based learning bound for SVR) Assume that $K(x, x) \le r^{2}$ for all $x \in \mathcal{X}$ for some $r \geq 0$ and that $L_{\epsilon}$ is bounded by $M \geq 0$ . Let $h_{S}$ denote the hypothesis returned $by$ SVR when trained on an i.i.d. sample S of size m. Then, for any $\delta > 0$ , the following inequality holds with probability at least $1 - \delta.$

$$
R(h_{S}) \leq \widehat{R}_{S}(h_{S}) + \frac{r^{2}}{m \lambda} + \Big(\frac{2r^{2}}{\lambda} + M \Big) \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Proof: We first show that $L_{\epsilon}(\cdot) = L_{\epsilon}(\cdot, y)$ is 1-Lipschitz for any $y \in \mathcal Y$ . For any $y^{\prime}, y^{\prime \prime} \in \mathcal{Y}$ , we must consider four cases. First, if $| y^{\prime} - y | \leq \epsilon$ and $| y^{\prime \prime} - y | \leq \epsilon$ , then $| L_{\epsilon}(y^{\prime \prime}) - L_{\epsilon}(y^{\prime}) | = 0$ . Second, if $| y^{\prime} - y | > \epsilon$ and $| y^{\prime \prime} - y | > \epsilon$ , then $| L_{\epsilon}(y^{\prime \prime}) - L_{\epsilon}(y^{\prime}) | =$ $| | y^{\prime \prime} - y | - | y^{\prime} - y | | \leq | y^{\prime \prime} - y^{\prime} |$ , by the triangle inequality. Third, if $| y^{\prime} - y | \leq \epsilon$ and $| y^{\prime \prime} - y | > \epsilon$ , then $\left| L_{\epsilon}(y^{\prime \prime}) - L_{\epsilon}(y^{\prime}) \right| = | | y^{\prime \prime} - y | - \epsilon | = | y^{\prime \prime} - y | - \epsilon \leq | y^{\prime \prime} - y | - | y^{\prime} - y | \leq$ $| y^{\prime \prime} - y^{\prime} |$ . Fourth, if $| y^{\prime \prime} - y | \leq \epsilon$ and $\left| y^{\prime} - y \right| > \epsilon$ , by symmetry the same inequality is obtained as in the previous case.

Thus, in all cases, $| L_{\epsilon}(y^{\prime \prime}, y) - L_{\epsilon}(y^{\prime}, y) | \le | y^{\prime \prime} - y^{\prime} |$ . This implies in particular that $L_{\epsilon}$ is σ-admissible with $\sigma = 1$ for any hypothesis set H. By proposition 14.4, under the assumptions made, SVR is β-stable with $\begin{array}{r}{\beta \le \frac{r^{2}}{m \lambda}} \end{array}$ . Plugging this expression into the bound of theorem 14.2 yields the result. $\square$

We next present a stability-based bound for KRR, which is based on the square loss $L_{2}$ defined for all $y^{\prime}, y \in \mathcal{Y}$ by:

$$
L_{2}(y^{\prime}, y) =(y^{\prime} - y)^{2}.\tag{14.11}
$$

As in the SVR setting, we assume in our analysis that $L_{2}$ is bounded for the hypotheses returned by KRR (which, as we shall later see again in lemma 14.7, is indeed the case when the label set Y is bounded).

Corollary 14.6 (Stability-based learning bound for KRR) Assume that $K(x, x) \le r^{2}$ for all $x \in \mathcal{X}$ for some $r \geq 0$ and that $L_{2}$ is bounded by $M \geq 0$ . Let $h_{S}$ denote the hypothesis returned by KRR when trained on an i.i.d. sample S of size m. Then, for any $\delta > 0$ , the following inequality holds with probability at least $1 - \delta$

$$
R(h_{S}) \leq \widehat{R}_{S}(h_{S}) + \frac{4Mr^{2}}{\lambda m} + \Bigl(\frac{8Mr^{2}}{\lambda} + M \Bigr) \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Proof: For any $(x, y) \in \mathcal{X} \times \mathcal{Y}$ and $h, h^{\prime} \in \mathcal{K}$

$$
\begin{array}{rl} &{| L_{2}(h^{\prime}(x), y) - L_{2}(h(x), y) | = \big |(h^{\prime}(x) - y)^{2} -(h(x) - y)^{2} \big |} \\ &{\qquad = \Big | \big[h^{\prime}(x) - h(x)][(h^{\prime}(x) - y) +(h(x) - y)] \Big |} \\ &{\qquad \leq(| h^{\prime}(x) - y | + | h(x) - y |) | h(x) - h^{\prime}(x) |} \\ &{\qquad \leq 2 \sqrt{M} | h(x) - h^{\prime}(x) |,} \end{array}
$$

where we used the M-boundedness of the loss. Thus, $L_{2}$ is σ-admissible with $\sigma = 2 \sqrt{M}$ . Therefore, by proposition 14.4, KRR is β-stable with $\beta \ \leq \{\frac{4r^{2} M}{m \lambda}}$ Plugging this expression into the bound of theorem 14.2 yields the result. $\square$

The previous two corollaries assumed bounded loss functions. We now present a lemma that implies in particular that the loss functions used by SVR and KRR are bounded when the label set is bounded.

Lemma 14.7 Assume that $K(x, x) \le r^{2}$ for all $x \in \mathcal{X}$ for some $r \geq 0$ and that for all $y \in \mathbb{Y}, \L(0, y) \leq B$ for some $B \geq 0$ . Then, the hypothesis $h_{S}$ returned by a kernel-based regularization algorithm trained on a sample S is bounded as follows:

$$
\forall x \in \mathcal{X}, | h_{S}(x) | \leq r \sqrt{B / \lambda}.
$$

Proof: By the reproducing kernel property and the Cauchy-Schwarz inequality, we can write

$$
\forall x \in \mathcal{X}, | h_{S}(x) | = \langle h_{S}, K(x, \cdot) \rangle \leq \| h_{S} \|_{K} \sqrt{K(x, x)} \leq r \| h_{S} \|_{K}.\tag{14.12}
$$

The minimization (14.6) is over <sup>H</sup>, which includes 0. Thus, by definition of $F_{S}$ and $h_{S}$ , the following inequality holds:

$$
F_{S}(h_{S}) \leq F_{S}(0) = \frac{1}{m} \sum_{i = 1}^{m} L(0, y_{i}) \leq B.
$$

Since the loss L is non-negative, we have $\lambda \| h_{S} \|_{K}^{2} \leq F_{S}(h_{S})$ and thus $\lambda \| h_{S} \|_{K}^{2} \leq B$ Combining this inequality with (14.12) yields the result. $\square$

## 14.3.2 Application to classification algorithms: SVMs

This section presents a generalization bound for SVMs, when using the standard hinge loss defined for all $y \in \mathbb{Y} = \{- 1, + 1\}$ and $y^{\prime} \in \mathbb{R}$ by

$$
L_{\text{hinge}}(y^{\prime}, y) = \left\{\begin{array}{ll} 0 & \text{if} 1 - yy^{\prime} \leq 0; \\ 1 - yy^{\prime} & \text{otherwise.} \end{array} \right.\tag{14.13}
$$

Corollary 14.8 (Stability-based learning bound for SVMs) Assume that $K(x, x) \leq r^{2}$ for all $x \in \mathcal{X}$ for some $r \geq 0$ . Let $h_{S}$ denote the hypothesis returned by SVMs when trained on an i.i.d. sample S of size m. Then, for any $\delta > 0$ , the following inequality holds with probability at least $1 - \delta.$

$$
R(h_{S}) \leq \widehat{R}_{S}(h_{S}) + \frac{r^{2}}{m \lambda} + \Big(\frac{2r^{2}}{\lambda} + \frac{r}{\sqrt{\lambda}} + 1 \Big) \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Proof: It is straightforward to verify that $L_{\mathrm{hinge}}(\cdot, y)$ is 1-Lipschitz for any $y \in \mathcal{Y}$ and therefore that it is σ-admissible with $\sigma = 1$ . Therefore, by proposition 14.4, SVMs is β-stable with $\begin{array}{r}{\beta \le \frac{r^{2}}{m \lambda}} \end{array}$ . Since $| L_{\mathrm{hinge}}(0, y) | \le 1$ for any $y \in \mathcal Y$ , by lemma 14.7, $\forall x \in \mathcal{X}, | h_{S}(x) | \leq r / \sqrt{\lambda}$ . Thus, for any sample S and any $x \in \mathcal{X}$ and $y \in \mathcal{Y}$ , the loss is bounded as follows: $L_{\mathrm{hinge}}(h_{S}(x), y) \leq r / \sqrt{\lambda} + 1$ . Plugging this value of M and the one found for $\beta$ into the bound of theorem 14.2 yields the result. $\square$

Since the hinge loss upper bounds the binary loss, the bound of the corollary 14.8 also applies to the generalization error of $h_{S}$ measured in terms of the standard binary loss used in classification.

## 14.3.3 Discussion

Note that the learning bounds presented for kernel-based regularization algorithms are of the form $\begin{array}{r}{R(h_{S}) - \widehat{R}_{S}(h_{S}) \leq O \big(\frac{1}{\lambda \sqrt{m}} \big)} \end{array}$ . Thus, these bounds are informative only when $\lambda \gg 1 / \sqrt{m}$ . The regularization parameter λ is a function of the sample size m: for larger values of $m_{;}$ , it is expected to be smaller, decreasing the emphasis on regularization. The magnitude of λ afects the norm of the linear hypotheses used for prediction, with a larger value of λ implying a smaller hypothesis norm. In this sense, λ is a measure of the complexity of the hypothesis set and the condition required for λ can be interpreted as stating that a less complex hypothesis set guarantees better generalization.

Note also that our analysis of stability in this chapter assumed a fixed $\lambda{\vdots}$ the regularization parameter is assumed to be invariant to the change of one point of the training sample. While this is a mild assumption, it may not hold in general.

## 14.4 Chapter notes

The notion of algorithmic stability was first used by Devroye, Rogers and Wagner [Rogers and Wagner, 1978, Devroye and Wagner, 1979a,b] for the k-nearest neighbor algorithm and other k-local rules. Kearns and Ron [1999] later gave a formal definition of stability and used it to provide an analysis of the leave-oneout error. Much of the material presented in this chapter is based on Bousquet and Elisseef [2002]. Our proof of proposition 14.4 is novel and generalizes the results of Bousquet and Elisseef [2002] to the case of non-diferentiable convex losses. Moreover, stability-based generalization bounds have been extended to ranking algorithms [Agarwal and Niyogi, 2005, Cortes et al., 2007b], as well as to the non-i.i.d.

scenario of stationary Φ- and β-mixing processes [Mohri and Rostamizadeh, 2010], and to the transductive setting [Cortes et al., 2008a]. Additionally, exercise 14.5 is based on Cortes et al. [2010b], which introduces and analyzes stability with respect to the choice of the kernel function or kernel matrix.

Note that while, as shown in this chapter, uniform stability is sufficient for deriving generalization bounds, it is not a necessary condition. Some algorithms may generalize well in the supervised learning scenario but may not be uniformly stable, for example, the Lasso algorithm [Xu et al., 2008]. Shalev-Shwartz et al. [2009] have used the notion of stability to provide necessary and sufficient conditions for a technical condition of learnability related to PAC-learning, even in general scenarios where learning is possible only by using non-ERM rules.

## 14.5 Exercises

## 14.1 Tighter stability bounds

(a) Assuming the conditions of theorem 14.2 hold, can one hope to guarantee a generalization with slack better than $O(1 / \sqrt{m})$ even if the algorithm is very stable, i.e. $\beta \to 0 ?$

(b) Can you show an ${\cal O}(1 / m)$ generalization guarantee if L is bounded by $C / \sqrt{m}$ (a very strong condition)? If so, how stable does the learning algorithm need to be?

14.2 Quadratic hinge loss stability. Let L denote the quadratic hinge loss function defined for all $y \in \{+ 1, - 1\}$ and $y^{\prime} \in \mathbb{R}$ by

$$
L(y^{\prime}, y) = \left\{\begin{array}{ll} 0 & \text{if} 1 - y^{\prime} y \leq 0; \\(1 - y^{\prime} y)^{2} & \text{otherwise}.\end{array} \right.
$$

Assume that $L(h(x), y)$ is bounded by M, $1 \leq M < \infty,$ for all $h \in{\mathcal{H}}, x \in{\mathcal{X}}$ , and $y \in \{+ 1, - 1\}$ , which also implies a bound on $| h(x) |$ for all $h \in{\mathcal{H}}$ and $x \in{\mathfrak{X}}$ Derive a stability-based generalization bound for SVMs with the quadratic hinge loss.

## 14.3 Stability of linear regression.

(a) How does the stability bound in corollary 14.6 for ridge regression (i.e. kernel ridge regression with a linear kernel) behave as $\lambda \to 0 ?$

(b) Can you show a stability bound for linear regression (i.e. ridge regression with $\lambda = 0) ?$ If not, show a counter-example.

14.4 Kernel stability. Suppose an approximation of the kernel matrix K, denoted $\mathbf{K}^{\prime}.$ is used to train the hypothesis $h^{\prime}$ (and let h denote the non-approximate hypothesis). At test time, no approximation is made, so if we let $\mathbf{k}_{x} = \lceil K(x, x_{1}), \dots,$ $K(x, x_{m}) \big |^{\top}$ we can write $h(x) \ = \ \alpha^{\top}{\bf k}_{x}$ and $h^{\prime}(x) \ = \ \alpha^{\prime \top}{\bf k}_{x}$ . Show that if $\forall x, x^{\prime} \in \mathcal{X}, K(x, x^{\prime}) \leq r$ then

$$
| h^{\prime}(x) - h(x) | \leq \frac{rmM}{\lambda^{2}} \| \mathbf{K}^{\prime} - \mathbf{K} \|_{2}.
$$

(Hint: Use exercise 10.3)

14.5 Stability of relative-entropy regularization.

(a) Consider an algorithm that selects a distribution g over a hypothesis class which is parameterized by $\theta \in \Theta$ . Given a point $z =(x, y)$ the expected loss is defined as

$$
H(g, z) = \int_{\Theta} L(h_{\theta}(x), y) g(\theta) d \theta,
$$

with respect to a base loss function L. Assuming the loss function L is bounded by M, show that the expected loss H is M-admissible, i.e. show $\begin{array}{r}{| H(g, z) - H(g^{\prime}, z) | \leq M \int_{\Theta} | g(\theta) - g^{\prime}(\theta) | d \theta.} \end{array}$

(b) Consider an algorithm that minimizes the entropy regularized objective over the choice of distribution $g \colon$

$$
F_{S}(g) = \underbrace{\frac{1}{m} \sum_{i = 1}^{m} H(g, z_{i})}_{\widehat{R}_{S}(g)} + \lambda K(g, f_{0}).
$$

Here, K is the Kullback-Leibler divergence (or relative entropy) between two distributions,

$$
K(g, f_{0}) = \int_{\Theta} g(\theta) \log \frac{g(\theta)}{f_{0}(\theta)} d \theta,\tag{14.14}
$$

and $f_{0}$ is some fixed distribution. Show that such an algorithm is stable by performing the following steps:

i. First use the fact $\begin{array}{r}{\frac{1}{2}(\int_{\Theta} | g(\theta) - g^{\prime}(\theta) | d \theta)^{2} \leq K(g, g^{\prime})} \end{array}$ (Pinsker’s inequality), to show

$$
\left(\int_{\Theta} | g_{S}(\theta) - g_{S^{\prime}}(\theta) | d \theta\right)^{2} \leq B_{K(., f_{0})}(g \| g^{\prime}) + B_{K(., f_{0})}(g^{\prime} \| g).
$$

ii. Next, let $g$ be the minimizer of $F_{S}$ and $g^{\prime}$ the minimizer of $F_{S^{\prime}}$ , where $S$ and $S^{\prime}$ difer only at the index m. Show that

$$
\begin{array}{rl} & B_{K(., f_{0})}(g \| g^{\prime}) + B_{K(., f_{0})}(g^{\prime} \| g) \\ & \quad \leq \frac{1}{m \lambda} \big | H(g^{\prime}, z_{m}) - H(g, z_{m}) + H(g, z_{m}^{\prime}) - H(g^{\prime}, z_{m}^{\prime}) \big | \\ & \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \leq \frac{2M}{m \lambda} \int_{\Theta} | g(\theta) - g^{\prime}(\theta) | d \theta.\end{array}
$$

iii. Finally, combine the results above to show that the entropy regularized algorithm is $\frac{2M^{2}}{m \lambda}$ -stable.


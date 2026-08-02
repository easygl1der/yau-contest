---
title: "Chapter 7 \u2014 Boosting"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 7
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 3885
source_line_end: 4616
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 13
source_empty_image_alt: 13
non_semantic_image_alt: 8
caption_derived_image_alt: 5
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 7 — Boosting

> [[../README|本书目录]] · [[06-chapter-6-kernel-methods|上一章]] · [[08-chapter-8-on-line-learning|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 3885–4616。
> - 本章保留 13 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；Affine × 1；different × 8；efficient × 2；sufficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 7.1 Introduction

It is often dificult, for a non-trivial learning task, to directly devise an accurate algorithm satisfying the strong PAC-learning requirements of chapter 2. But, there can be more hope for finding simple predictors guaranteed only to perform slightly better than random. The following gives a formal definition of such weak learners. As in the PAC-learning chapter, we let n be a number such that the computational cost of representing any element $x \in{\mathcal{X}}$ is at most $O(n)$ and denote by size(c) the maximal cost of the computational representation of $c \in \mathcal{C}$

Definition 7.1 (Weak learning) A concept class C is said to be weakly PAC-learnable if there exists an algorithm $\mathcal{A}, \gamma > 0$ , and a polynomial function $poly(\cdot, \cdot, \cdot)$ such that $for$ any $\delta > 0$ , for all distributions D on X and for any target concept $c \in \mathcal{C}$ ,

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
$\mathrm{ADABOOST}(S =((x_1, y_1), \ldots,(x_m, y_m)))$  
1 for $i \gets 1$ to $m$ do  
2 $\mathcal{D}_1(i) \gets \frac{1}{m}$  
3 for $t \gets 1$ to $T$ do  
4 $h_t \gets$ base classifier in $\mathcal{H}$ with small error $\epsilon_t = \mathbb{P}_{i \sim \mathcal{D}_t}[h_t(x_i) \neq y_i]$  
5 $\alpha_t \gets \frac{1}{2} \log \frac{1 - \epsilon_t}{\epsilon_t}$  
6 $Z_t \gets 2[\epsilon_t(1 - \epsilon_t)]^{\frac{1}{2}} \triangleright$ normalization factor  
7 for $i \gets 1$ to $m$ do  
8 $\mathcal{D}_{t+1}(i) \gets \frac{\mathcal{D}_t(i) \exp(-\alpha_ty_ih_t(x_i))}{Z_t}$  
9 $f \gets \sum_{t=1}^{T} \alpha_th_t$  
10 return $f$
</div>

## Figure 7.1

AdaBoost algorithm for a base classifier set $\mathcal{H} \subseteq \{- 1, + 1\}^{\mathcal{X}}$

the following holds for any sample size $m \geq poly(1 / \delta, n, size(c))$

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[R(h_{S}) \leq \frac{1}{2} - \gamma \right] \geq 1 - \delta,\tag{7.1}
$$

where $h_{S}$ is the hypothesis returned by algorithm when trained on sample S. When such an algorithm exists, it is called a weak learning algorithm for C or a weak learner. The hypotheses returned by a weak learning algorithm are called base classifiers.

The key idea behind boosting techniques is to use a weak learning algorithm to build a strong learner, that is, an accurate PAC-learning algorithm. To do so, boosting techniques use an ensemble method: they combine different base classifiers returned by a weak learner to create a more accurate predictor. But which base classifiers should be used and how should they be combined? The next section addresses these questions by describing in detail one of the most prevalent and successful boosting algorithms, AdaBoost.

## 7.2 AdaBoost

We denote by H the hypothesis set out of which the base classifiers are selected, which we will sometimes refer to as the base classifier set. Figure 7.1 gives the t = 1 updated weights

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/d09b01329e2ab886b484349c8d34e14ebd76dcc71687521451f3c99a9c44c425.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/f8df89eb929fde75e6fb4f5a10428bdfb6caf4b5462fffbad244d207edd87910.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/170cde45f083e43f3a5201159a447a52074414f2f17badb69d0316f80fd93244.jpg)  
decision boundary

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/4d5f89217bdc2ab13b54ddc5024f23114f9e1b12ccc4035d0f5b8ca4839f0be1.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/3dec263b6f6126e014a39704e51778d47f9a66b592b7ff76e4be63852541eec4.jpg)  
t = 2

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/7577cdcbe815a7db170a2df6f2a3f32006aca6e9fb160b4745ba7c428c520c4c.jpg)

(a)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/8f686885927ab44047c90f755dcc6ce74cdbbb9bf1777bfe3478a891fa5bf008.jpg)  
(b)

![Figure 7.2](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/48ed6d961ac24be8cdad9c28978ab6f6aec0047656f0813ba0ed69b3ee4966d0.jpg)  
Figure 7.2  
Example of AdaBoost with axis-aligned hyperplanes as base classifiers. (a) The top row shows decision boundaries at each boosting round. The bottom row shows how weights are updated at each round, with incorrectly (resp., correctly) points given increased (resp., decreased) weights. (b) Visualization of final classifier, constructed as a non-negative linear combination of base classifiers.

pseudocode of AdaBoost in the case where the base classifiers are functions mapping from X to $\{- 1, + 1\}$ , thus ${\mathcal{H}} \subseteq \{- 1, + 1\}^{\mathcal{X}}$

The algorithm takes as input a labeled sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ , with $(x_{i}, y_{i}) \in \mathcal{X} \times \{- 1, + 1\}$ for all $i \in[m]$ , and maintains a distribution over the indices $\{1, \ldots, m\}$ . Initially (lines 1-2), the distribution is uniform $\left(\mathcal{D}_{1} \right)$ . At each round of boosting, that is each iteration $t \in[T]$ of the loop 3–8, a new base classifier $h_{t} \in \mathcal{H}$ is selected that minimizes the error on the training sample weighted by the distribution $\mathcal{D}_{t}$

$$
h_{t} \in \underset{h \in \mathcal{H}}{\operatorname{argmin}} \underset{i \sim \mathcal{D}_{t}}{\mathbb{P}} \left[h(x_{i}) \neq y_{i} \right] = \underset{h \in \mathcal{H}}{\operatorname{argmin}} \sum_{i = 1}^{m} \mathcal{D}_{t}(i) 1_{h(x_{i}) \neq y_{i}}.
$$

$Z_{t}$ is simply a normalization factor to ensure that the weights $\mathscr{D}_{t + 1}(i)$ sum to one. The precise reason for the definition of the coeficient $\alpha_{t}$ will become clear later. For now, observe that if $\epsilon_{t}.$ , the error of the base classifier, is less than ${\frac{1}{2}}.$ , then $\begin{array}{r}{\frac{1 - \epsilon_{t}}{\epsilon_{t}} > 1} \end{array}$ and $\alpha_{t}$ is positive $\left(\alpha_{t} > 0 \right)$ . Thus, the new distribution $\mathscr{D}_{t + 1}$ is defined from $\mathcal{D}_{t}$ by substantially increasing the weight on i if point $x_{i}$ is incorrectly classified $(y_{i} h_{t}(x_{i}) < 0)$ , and, on the contrary, decreasing it if $x_{i}$ is correctly classified. This has the efect of focusing more on the points incorrectly classified at the next round of boosting, less on those correctly classified by $h_{t}$

After $T$ rounds of boosting, the classifier returned by AdaBoost is based on the sign of function $f,$ which is a non-negative linear combination of the base classifiers $h_{t}$ . The weight $\alpha_{t}$ assigned to $h_{t}$ in that sum is a logarithmic function of the ratio of the accuracy $1 - \epsilon_{t}$ and error $\epsilon_{t}$ of $h_{t}$ . Thus, more accurate base classifiers are assigned a larger weight in that sum. Figure 7.2 illustrates the AdaBoost algorithm. The size of the points represents the distribution weight assigned to them at each boosting round.

For any $t \in[T]$ , we will denote by $f_{t}$ the linear combination of the base classifiers after t rounds of boosting: $\begin{array}{r}{f_{t} = \sum_{s = 1}^{t} \alpha_{s} h_{s}} \end{array}$ . In particular, we have $f_{T} = f.$ . The distribution $\boldsymbol{\mathcal{D}}_{t + 1}$ can be expressed in terms of $f_{t}$ and the normalization factors $Z_{s}$ $s \in[t]$ , as follows:

$$
\forall i \in[m], \quad \mathcal{D}_{t + 1}(i) = \frac{e^{- y_{i} f_{t}(x_{i})}}{m \prod_{s = 1}^{t} Z_{s}}.\tag{7.2}
$$

We will make use of this identity several times in the proofs of the following sections. It can be shown straightforwardly by repeatedly expanding the definition of the distribution over the point $x_{i}$ :

$$
\begin{array}{c} \mathcal{D}_{t + 1}(i) = \frac{\mathcal{D}_{t}(i) e^{- \alpha_{t} y_{i} h_{t}(x_{i})}}{Z_{t}} = \frac{\mathcal{D}_{t - 1}(i) e^{- \alpha_{t - 1} y_{i} h_{t - 1}(x_{i})} e^{- \alpha_{t} y_{i} h_{t}(x_{i})}}{Z_{t - 1} Z_{t}} \\ = \frac{e^{- y_{i} \sum_{s = 1}^{t} \alpha_{s} h_{s}(x_{i})}}{m \prod_{s = 1}^{t} Z_{s}}.\end{array}
$$

The AdaBoost algorithm can be generalized in several ways:

Instead of a hypothesis with minimal weighted error, $h_{t}$ can be more generally the base classifier returned by a weak learning algorithm trained on $\begin{array}{r}{\mathbf{\mathcal{D}}_{t};} \end{array}$

<sub>•</sub> The range of the base classifiers could be $[- 1, + 1]$ , or more generally a bounded subset of <sup>R</sup>. The coeficients $\alpha_{t}$ can then be different and may not even admit a closed form. In general, they are chosen to minimize an upper bound on the empirical error, as discussed in the next section. Of course, in that general case, the hypotheses $h_{t}$ are not binary classifiers, but their sign could define the label, and their magnitude could be interpreted as a measure of confidence.

In rest of this chapter, the range of the base classifiers in H will be assumed to be included in $[- 1, + 1]$ . We now further analyze the properties of AdaBoost and discuss its typical use in practice.

## 7.2.1 Bound on the empirical error

We first show that the empirical error of AdaBoost decreases exponentially fast as a function of the number of rounds of boosting.

Theorem 7.2 The empirical error of the classifier returned by AdaBoost verifies:

$$
\widehat{R}_{S}(f) \leq \exp \left[- 2 \sum_{t = 1}^{T} \left(\frac{1}{2} - \epsilon_{t}\right)^{2} \right].\tag{7.3}
$$

Furthermore, if for all $t \in[T], \gamma \leq \left(\frac{1}{2} - \epsilon_{t} \right)$ , then

$$
\widehat{R}_{S}(f) \leq \exp(- 2 \gamma^{2} T).\tag{7.4}
$$

Proof: Using the general inequality $1_{u \le 0} \le \exp(- u)$ valid for all $u \in \mathbb{R}$ and identity 7.2, we can write:

$$
\widehat{R}_{S}(f) = \frac{1}{m} \sum_{i = 1}^{m} 1_{y_{i} f(x_{i}) \leq 0} \leq \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} f(x_{i})} = \frac{1}{m} \sum_{i = 1}^{m} \left[m \prod_{t = 1}^{T} Z_{t} \right] \mathcal{D}_{T + 1}(i) = \prod_{t = 1}^{T} Z_{t}.
$$

Since for all $t \in[T], Z_{t}$ is a normalization factor, it can be expressed in terms of $\epsilon_{t}$ by:

$$
\begin{array}{l} Z_{t} = \sum_{i = 1}^{m} \mathcal{D}_{t}(i) e^{- \alpha_{t} y_{i} h_{t}(x_{i})} = \sum_{i: y_{i} h_{t}(x_{i}) = + 1} \mathcal{D}_{t}(i) e^{- \alpha_{t}} + \sum_{i: y_{i} h_{t}(x_{i}) = - 1} \mathcal{D}_{t}(i) e^{\alpha_{t}} \\ \qquad =(1 - \epsilon_{t}) e^{- \alpha_{t}} + \epsilon_{t} e^{\alpha_{t}} \\ \qquad =(1 - \epsilon_{t}) \sqrt{\frac{\epsilon_{t}}{1 - \epsilon_{t}}} + \epsilon_{t} \sqrt{\frac{1 - \epsilon_{t}}{\epsilon_{t}}} = 2 \sqrt{\epsilon_{t}(1 - \epsilon_{t})}.\end{array}
$$

Thus, the product of the normalization factors can be expressed and upper bounded as follows:

$$
\begin{array}{c} \prod_{t = 1}^{T} Z_{t} = \prod_{t = 1}^{T} 2 \sqrt{\epsilon_{t}(1 - \epsilon_{t})} = \prod_{t = 1}^{T} \sqrt{1 - 4 \left(\frac{1}{2} - \epsilon_{t}\right)^{2}} \leq \prod_{t = 1}^{T} \exp \left[- 2 \left(\frac{1}{2} - \epsilon_{t}\right)^{2} \right] \\ = \exp \left[- 2 \sum_{t = 1}^{T} \left(\frac{1}{2} - \epsilon_{t}\right)^{2} \right], \end{array}
$$

where the inequality follows from the inequality $1 - x \leq e^{- x}$ valid for all $x \in \mathbb{R}.\sqsubseteq$ Note that the value of $\gamma,$ which is known as the edge, and the accuracy of the base classifiers do not need to be known to the algorithm. The algorithm adapts to their accuracy and defines a solution based on these values. This is the source of the extended name of AdaBoost: adaptive boosting.

![Figure 7.3](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/330a50c6f816d68bee1de8ee05ba756ae411ac5f383f1d6f22e095e3bed10ed0.jpg)  
Figure 7.3  
Visualization of the zero-one loss (blue) and the convex and diferentiable upper bound on the zero-one loss (red) that is optimized by AdaBoost.

The proof of theorem 7.2 reveals several other important properties. First, observe that $\alpha_{t}$ is the minimizer of the function $\varphi \colon \alpha \mapsto(1 - \epsilon_{t}) e^{- \alpha} + \epsilon_{t} e^{\alpha}$ . Indeed, $\varphi$ is convex and diferentiable, and setting its derivative to zero yields:

$$
\varphi^{\prime}(\alpha) = -(1 - \epsilon_{t}) e^{- \alpha} + \epsilon_{t} e^{\alpha} = 0 \Leftrightarrow(1 - \epsilon_{t}) e^{- \alpha} = \epsilon_{t} e^{\alpha} \Leftrightarrow \alpha = \frac{1}{2} \log \frac{1 - \epsilon_{t}}{\epsilon_{t}}.\tag{7.5}
$$

Thus, $\alpha_{t}$ is chosen to minimize $Z_{t} = \varphi(\alpha_{t})$ and, in light of the bound $\widehat{R}_{S}(f) \leq$ $\textstyle \prod_{t = 1}^{T} Z_{t}$ shown in the proof, these coeficients are selected to minimize an upper bound on the empirical error. In fact, for base classifiers whose range is [ 1, +1] or <sup>R</sup>, $\alpha_{t}$ can be chosen in a similar fashion to minimize $Z_{t}$ , and this is the way AdaBoost is extended to these more general cases.

Observe also that the equality $\begin{array}{r}{(1 - \epsilon_{t}) e^{- \alpha_{t}} = \epsilon_{t} e^{\alpha_{t}}} \end{array}$ just shown in (7.5) implies that at each iteration, AdaBoost assigns equal distribution mass to correctly and incorrectly classified instances, since $(1 - \epsilon_{t}) e^{- \alpha_{t}}$ is the total distribution assigned to correctly classified points and $\boldsymbol{\epsilon}_{t} \boldsymbol{e}^{\alpha_{t}}$ that of incorrectly classified ones. This may seem to contradict the fact that AdaBoost increases the weights of incorrectly classified points and decreases that of others, but there is in fact no inconsistency: the reason is that there are always fewer incorrectly classified points, since the base classifier’s accuracy is better than random.

## 7.2.2 Relationship with coordinate descent

AdaBoost was originally designed to address the theoretical question of whether a weak learning algorithm could be used to derive a strong learning one. Here, we will show that it coincides in fact with a very simple algorithm, which consists of applying a general coordinate descent technique to a convex and diferentiable objective function.

For simplicity, in this section, we assume that the base classifier set H is finite, with cardinality N: $\mathcal{H} = \{h_{1}, \ldots, h_{N}\}$ . An ensemble function $f$ such as the one returned by AdaBoost can then be written as $\begin{array}{r}{f = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ , with $\bar{\alpha}_{j} \geq 0$ . Given a labeled sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ , let $F$ be the objective function defined for all $\bar{\pmb{\alpha}} =(\bar{\alpha}_{1}, \dots, \bar{\alpha}_{N}) \in \mathbb{R}^{N}$ by

$$
F(\bar{\alpha}) = \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} f(x_{i})} = \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}(x_{i})}.\tag{7.6}
$$

Since the exponential loss $u \mapsto e^{- u}$ is an upper bound on the zero-one loss $u \mapsto 1_{u \leq 0}$ (see figure 7.3), F is an upper bound on the empirical error:

$$
\widehat{R}_{S}(f) = \frac{1}{m} \sum_{i = 1}^{m} 1_{y_{i} f(x_{i}) \leq 0} \leq \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} f(x_{i})}.\tag{7.7}
$$

$F$ is a convex function of $\bar{\alpha}$ since it is a sum of convex functions, each obtained by composition of the (convex) exponential function with an Affine function of α¯ . $F$ is also diferentiable since the exponential function is diferentiable. We will show that $F$ is the objective function minimized by AdaBoost.

different convex optimization techniques can be used to minimize F . Here, we will use a variant of the coordinate descent technique. Coordinate descent is applied over $T$ rounds. Let $\bar{\mathbf{alpha}}_{0} = \mathbf{0}$ and let $\bar{\alpha}_{t}$ denote the parameter vector at the end of iteration t. At each round $t \in[T]$ , a direction $\mathbf{e}_{k}$ corresponding to the kth coordinate of $\bar{\alpha}$ in $\mathbb{R}^{N}$ is selected, as well as a step size $\eta$ along that direction. $\bar{\alpha}_{t}$ is obtained from $\bar{\alpha}_{t - 1}$ according to the update $\bar{\alpha}_{t} = \bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k}$ , where $\eta$ is the step size chosen along the direction $\mathbf{e}_{k}$ . Observe that if we denote by $\bar{g}_{t}$ the ensemble function defined by $\bar{\alpha}_{t}.$ , that is $\begin{array}{r}{\bar{g}_{t} = \sum_{j = 1}^{N} \bar{\alpha}_{t, j} h_{j}} \end{array}$ , then the coordinate descent update coincides with the update $\bar{g}_{t} = \bar{g}_{t - 1} + \eta h_{k}$ , which is also the AdaBoost update. Thus, since both algorithms start with $\bar{g}_{0} = 0$ , to show that AdaBoost coincides with coordinate descent applied to $F_{;}$ it sufices to show at every iteration $t,$ coordinate descent selects the same base hypothesis $h_{k}$ and step $\eta$ as AdaBoost. We will assume by induction that this holds up to iteration $t{-} 1$ , which implies the equality $\bar{g}_{t - 1} = f_{t - 1}$ , and will show then that it also holds at iteration t.

The variant of coordinate descent we consider here consists of selecting, at each iteration, the maximum descent direction, that is the direction $\mathbf{e}_{k}$ along which the derivative of $F$ is the largest in absolute value, and of selecting the best step along that direction, that is of choosing $\eta$ to minimize $F(\bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k})$ . To give the expressions of the direction and the step at each iteration, we first introduce similar quantities to those appearing in the analysis of the boosting algorithm. For any $t \in[T]$ , we define a distribution $\bar{\mathcal{D}}_{t}$ over the indices $\{1, \ldots, m\}$ as follows:

$$
\bar{\mathcal{D}}_{t}(i) = \frac{e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{t - 1, j} h_{j}(x_{i})}}{\bar{Z}_{t}} = \frac{e^{- y_{i} \bar{g}_{t - 1}(x_{i})}}{\bar{Z}_{t}},
$$

where ${\bar{Z}}_{t}$ is the normalization factor $\begin{array}{r}{\bar{Z}_{t} = \sum_{i = 1}^{m} e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{t - 1, j} h_{j} \left(x_{i} \right)}} \end{array}$ . Observe that, since $\bar{g}_{t - 1} = f_{t - 1}, \bar{\mathcal{D}}_{t}$ coincides with $\mathrm{{\mathcal{D}}}_{t}$ . We also define for any base hypothesis $h_{j}$ $j \in[N]$ , its expected error $\bar{\epsilon}_{t, j}$ with respect to the distribution $\bar{\mathcal{D}}_{t} \mathrm{:}$

$$
\bar{\epsilon}_{t, j} = \underset{i \sim \bar{\mathcal{D}}_{t}}{\mathbb{E}} \left[1_{y_{i} h_{j}(x_{i}) \leq 0} \right].
$$

The directional derivative of $F$ at $\bar{\alpha}_{t - 1}$ along $\mathbf{e}_{k}$ is denoted by $F^{\prime}(\bar{\alpha}_{t - 1},{\bf e}_{k})$ and defined by

$$
F^{\prime}(\bar{\boldsymbol{\alpha}}_{t - 1}, \mathbf{e}_{k}) = \lim_{\eta \rightarrow 0} \frac{F(\bar{\boldsymbol{\alpha}}_{t - 1} + \eta \mathbf{e}_{k}) - F(\bar{\boldsymbol{\alpha}}_{t - 1})}{\eta}.
$$

Since $\begin{array}{r}{F(\bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k}) = \sum_{i = 1}^{m} e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{t - 1, j} h_{j}(x_{i}) - \eta y_{i} h_{k}(x_{i})}} \end{array}$ , the directional derivative along $\mathbf{e}_{k}$ can be expressed as follows:

$$
\begin{array}{rl} & F^{\prime}(\bar{\boldsymbol{\alpha}}_{t - 1}, \mathbf{e}_{k}) = - \frac{1}{m} \sum_{i = 1}^{m} y_{i} h_{k}(x_{i}) e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{t - 1, j} h_{j}(x_{i})} \\ & \qquad = - \frac{1}{m} \sum_{i = 1}^{m} y_{i} h_{k}(x_{i}) \bar{\mathcal{D}}_{t}(i) \bar{Z}_{t} \\ & \qquad = - \bigg[\sum_{i = 1}^{m} \bar{\mathcal{D}}_{t}(i) 1_{y_{i} h_{k}(x_{i}) = + 1} - \sum_{i = 1}^{m} \bar{\mathcal{D}}_{t}(i) 1_{y_{i} h_{k}(x_{i}) = - 1} \bigg] \frac{\bar{Z}_{t}}{m} \\ & \qquad = - \Big[(1 - \bar{\epsilon}_{t, k}) - \bar{\epsilon}_{t, k} \Big] \frac{\bar{Z}_{t}}{m} = \Big[2 \bar{\epsilon}_{t, k} - 1 \Big] \frac{\bar{Z}_{t}}{m}.\end{array}
$$

Since $\frac{{\bar{Z}}_{t}}{m}$ does not depend on $k,$ the maximum descent direction k is the one minimizing $\bar{\epsilon}_{t, k}$ . Thus, the hypothesis $h_{k}$ selected by coordinate descent at iteration t is the one with the smallest expected error on the sample $S_{\mathrm{{;}}}$ where the expectation is taken with respect to $\bar{\mathcal D}_{t} = \mathcal D_{t}$ . This matches exactly the choice made by AdaBoost at the tth round.

The step size $\eta$ is selected to minimize the function along the direction $\mathbf{e}_{k}$ chosen: argmin $\cdot \mathrm{~}_{\eta} F(\bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k})$ . Since $F(\bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k})$ is a convex function of $\eta,$ to find the minimum, it sufices to set its derivative to zero:

![Figure 7.4](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/bfa1f0aff9556186ea6ac76526a9951b01639a311ae0a90734dd94a878b04547.jpg)  
Figure 7.4  
Examples of several convex upper bounds on the zero-one loss.

$$
\begin{array}{rl} &{\frac{dF(\bar{\alpha}_{t - 1} + \eta \mathbf{e}_{k})}{d \eta} = 0 \Leftrightarrow - \sum_{i = 1}^{m} y_{i} h_{k}(x_{i}) e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{t - 1, j} h_{j}(x_{i})} e^{- \eta y_{i} h_{k}(x_{i})} = 0} \\ &{\qquad \Leftrightarrow - \sum_{i = 1}^{m} y_{i} h_{k}(x_{i}) \bar{\mathcal{D}}_{t}(i) \bar{Z}_{t} e^{- \eta y_{i} h_{k}(x_{i})} = 0} \\ &{\qquad \Leftrightarrow - \sum_{i = 1}^{m} y_{i} h_{k}(x_{i}) \bar{\mathcal{D}}_{t}(i) e^{- \eta y_{i} h_{k}(x_{i})} = 0} \\ &{\qquad \Leftrightarrow - \left[(1 - \bar{\epsilon}_{t, k}) e^{- \eta} - \bar{\epsilon}_{t, k} e^{\eta} \right] = 0} \\ &{\qquad \Leftrightarrow \eta = \frac{1}{2} \log \frac{1 - \bar{\epsilon}_{t, k}}{\bar{\epsilon}_{t, k}}.} \end{array}
$$

This proves that the step size chosen by coordinate descent coincides with the weight $\alpha_{t}$ assigned by AdaBoost to the classifier chosen in the tth round. Thus, coordinate descent applied to exponential objective F precisely coincides with AdaBoost and $F$ can be viewed as the objective function that AdaBoost seeks to minimize.

In light of this relationship, one may wish to consider similar applications of coordinate descent to other convex and diferentiable functions of α¯ upper-bounding the zero-one loss. In particular, the logistic loss $x \mapsto \log_{2}(1 + e^{- x})$ is convex and diferentiable and upper bounds the zero-one loss. Figure 7.4 shows other examples of alternative convex loss functions upper-bounding the zero-one loss. Using the logistic loss, instead of the exponential loss used by AdaBoost, leads to an objective that coincides with logistic regression.

## 7.2.3 Practical use

Here, we briefly describe the standard practical use of AdaBoost. An important requirement for the algorithm is the choice of the base classifiers or that of the weak learner. The family of base classifiers typically used with AdaBoost in practice is that of decision trees, which are equivalent to hierarchical partitions of the space (see chapter 9, section 9.3.3). Among decision trees, those of depth one, also known as stumps, are by far the most frequently used base classifiers.

Boosting stumps are threshold functions associated to a single feature. Thus, a stump corresponds to a single axis-aligned partition of the space, as illustrated in figure 7.2. If the data is in $\mathbb{R}^{N}$ , we can associate a stump to each of the N components. Thus, to determine the stump with the minimal weighted error at each round of boosting, the best component and the best threshold for each component must be computed.

To do so, we can first presort each component in $O(m \log m)$ time with a total computational cost of $O(mN \log m)$ . For a given component, there are only $m + 1$ possible distinct thresholds, since two thresholds between the same consecutive component values are equivalent. To find the best threshold at each round of boosting, all of these possible $m + 1$ values can be compared, which can be done in $O(m)$ time. Thus, the total computational complexity of the algorithm for T rounds of boosting is $O(mN$ log $m + mNT)$

Observe, however, that while boosting stumps are widely used in combination with AdaBoost and can perform well in practice, the algorithm that returns the stump with the minimal (weighted) empirical error is not a weak learner (see definition 7.1)! Consider, for example, the simple XOR example with four data points lying in $\mathbb{R}^{2}$ (see figure 6.3a), where points in the second and fourth quadrants are labeled positively and those in the first and third quadrants negatively. Then, no decision stump can achieve an accuracy better than $\textstyle{\frac{1}{2}}$

## 7.3 Theoretical results

In this section we present a theoretical analysis of the generalization properties of AdaBoost.

## 7.3.1 VC-dimension-based analysis

We start with an analysis of AdaBoost based on the VC-dimension of its hypothesis set. The family of functions $\mathcal{F}_{T}$ out of which AdaBoost selects its output after T rounds of boosting is

$$
\mathcal{F}_{T} = \Bigg \{\operatorname{sgn} \left(\sum_{t = 1}^{T} \alpha_{t} h_{t}\right): \alpha_{t} \geq 0, h_{t} \in \mathcal{H}, t \in[T] \Bigg\}.\tag{7.8}
$$

## 7.3 Theoretical results

![Figure 7.5](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/9800e3c35bb37d7253a79b84e33d3c1836943619da156ee2789014f3e4ebb2ef.jpg)  
Figure 7.5  
An empirical result using AdaBoost with C4.5 decision trees as base learners. In this example, the training error goes to zero after about 5 rounds of boosting $(T \approx 5)$ , yet the test error continues to decrease for larger values of T .

The VC-dimension of $\mathcal{F}_{T}$ can be bounded as follows in terms of the VC-dimension d of the family of base hypothesis H (exercise 7.1):

$$
\mathrm{VCdim}(\mathcal{F}_{T}) \leq 2(d + 1)(T + 1) \log_{2}((T + 1) e).\tag{7.9}
$$

The upper bound grows as $O(dT \log T)$ , thus, the bound suggests that AdaBoost could overfit for large values of T , and indeed this can occur. However, in many cases, it has been observed empirically that the generalization error of AdaBoost decreases as a function of the number of rounds of boosting T , as illustrated in figure 7.5! How can these empirical results be explained? The following sections present a margin-based analysis in support of AdaBoost that can serve as a theoretical explanation for these empirical observations.

## 7.3.2 L<sub>1</sub>-geometric margin

In chapter 5, we introduced the definition of confidence margin and presented a series of general learning bounds based on that notion which, in particular, provided strong learning guarantees for SVMs. Here, we will similarly derive general learning bounds based on that same notion of confidence margin for ensemble methods, which we will use, in particular, to derive learning guarantees for AdaBoost.

Recall that the confidence margin of a real-valued function f at a point x labeled with y is the quantity $yf(x)$ . For SVMs, we also defined the notion of geometric margin which, in the separable case, is a lower bound on the confidence margin of a linear hypothesis with a normalized weighted vector w, $\| \mathbf{w} \|_{2} = 1$ . Here, we will also define a notion of geometric margin for linear hypotheses with a norm-1 constraint, such as the ensemble hypotheses returned by AdaBoost, and similarly relate that notion to that of confidence margin. This will also serve as an opportunity for us to point out the connection between several concepts and terminology used in the context of SVMs and those used in the context of boosting.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/6660f7e8239c0a2b8e002ddd923a9f452800fdacccf9e064978905d7d144b0aa.jpg)

![Figure 7.6](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/74121f7b611f456d28e49dd3899d6cba05619a02dcda7d266bb42a2fd31c6d34.jpg)  
Figure 7.6  
Maximum margin hyperplanes for norm-2 and norm-∞.

First note that a function $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ that is a linear combination of base hypotheses $h_{1}, \ldots, h_{T}$ can be equivalently expressed as an inner product $f = \alpha \cdot \mathbf{h}$ , where ${\pmb{\alpha}} =(\alpha_{1}, \dots, \alpha_{T})^{\top}$ and $\mathbf{h} =[h_{1}, \ldots, h_{T}]^{\top}$ . This makes the similarity between the linear hypotheses considered in this chapter and those of chapter 5 and chapter 6 evident: the vector of base hypothesis values $\mathbf{h}(x)$ can be viewed as a feature vector associated to $x,$ which was denoted by $\Phi(x)$ in previous chapters, and α is the weight vector that was denoted by w. For ensemble linear combinations such as those returned by AdaBoost, additionally, the weight vector is non-negative: $\alpha \geq 0$ Next, we introduce a notion of geometric margin for such ensemble functions which difers from the one introduced for SVMs only by the norm-1 used instead of norm-2, using the notation just introduced.

Definition 7.3 (L -geometric margin) The L -geometric margin $\rho_{f}(x)$ of a linear function $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ with $\alpha \neq 0$ at a point $x \in{\mathcal{X}}$ is defined by

$$
\rho_{f}(x) = \frac{| f(x) |}{\| \boldsymbol{\alpha} \|_{1}} = \frac{| \sum_{t = 1}^{T} \alpha_{t} h_{t}(x) |}{\| \boldsymbol{\alpha} \|_{1}} = \frac{| \boldsymbol{\alpha} \cdot \mathbf{h}(x) |}{\| \boldsymbol{\alpha} \|_{1}}.\tag{7.10}
$$

The L -margin of f over a sample $S =(x_{1}, \dots, x_{m})$ is its minimum margin at the points in that sample:

$$
\rho_{f} = \min_{i \in[m]} \rho_{f}(x_{i}) = \min_{i \in[m]} \frac{\left| \boldsymbol{\alpha} \cdot \mathbf{h}(x_{i}) \right|}{\left\| \boldsymbol{\alpha} \right\|_{1}}.\tag{7.11}
$$

This definition of geometric margin difers from definition 5.1 given in the context of the SVM algorithm only by the norm used for the weight vector: $L_{\mathrm{1}} \mathrm{- norm}$ here, $L_{2}.$ -norm in definition 5.1. To distinguish them in the discussion that follows, let $\rho_{1}(x)$ denote the $L_{1}$ -margin and $\rho_{2}(x)$ the $L_{2}.$ -margin at point x (definition 5.1):

$$
\rho_{1}(x) = \frac{| \boldsymbol{\alpha} \cdot \mathbf{h}(x) |}{\| \boldsymbol{\alpha} \|_{1}} \quad \text{and} \quad \rho_{2}(x) = \frac{| \boldsymbol{\alpha} \cdot \mathbf{h}(x) |}{\| \boldsymbol{\alpha} \|_{2}}.
$$

$\rho_{2}(x)$ is then the norm-2 distance of the vector $\mathbf{h}(x)$ to the hyperplane of equation ${\bf{\alpha}} \cdot{\bf{x}} = 0 \mathrm{~ in ~} \mathbb{R}^{T}$ . Similarly, $\rho_{1}(x)$ is the norm- distance of $\mathbf{h}(x)$ to that hyperplane. This geometric diference is illustrated by figure 7.6.<sup>8</sup>

We will denote by

$$
\bar{f} = \frac{f}{\sum_{t = 1}^{T} \alpha_{t}} = \frac{f}{\| \pmb{\alpha} \|_{1}}
$$

the normalized version of the function f returned by AdaBoost. Note that if a point x with label y is correctly classified by $f \(\mathrm{or} \ \bar{f})$ , then the confidence margin of $\bar{f}$ at x coincides with the L -geometric margin of $\begin{array}{r}{f \colon y \bar{f}(x) = \frac{yf(x)}{\| \alpha \|_{1}} = \rho_{f}(x)} \end{array}$ . Observe that, since the coeficients $\alpha_{t}$ are non-negative, $\rho_{f}(x)$ is then a convex combination of the base hypothesis values $h_{t}(x)$ . In particular, if the base hypotheses $h_{t}$ take values in $[- 1, + 1]$ , then $\rho_{f}(x)$ is in $[- 1, + 1]$

## 7.3.3 Margin-based analysis

To analyze the generalization properties of AdaBoost, we start by examining the Rademacher complexity of convex linear ensembles. For any hypothesis set H of real-valued functions, we denote by conv(H) its convex hull defined by

$$
\operatorname{conv}(\mathcal{H}) = \left\{\sum_{k = 1}^{p} \mu_{k} h_{k} \colon p \geq 1, \forall k \in[p], \mu_{k} \geq 0, h_{k} \in \mathcal{H}, \sum_{k = 1}^{p} \mu_{k} \leq 1 \right\}.\tag{7.12}
$$

The following lemma shows that, remarkably, the empirical Rademacher complexity of conv(H), which in general is a strictly larger set including H, coincides with that of H.

Lemma 7.4 Let H be a set of functions mapping from X to $\mathbb{R}$ . Then, for any sample $S,$ we have

$$
\widehat{\mathfrak{R}}_{S} \big(\operatorname{conv}(\mathcal{H}) \big) = \widehat{\mathfrak{R}}_{S}(\mathcal{H}).
$$

Proof: The proof follows from a straightforward series of equalities:

$$
\begin{array}{l} \widehat{\mathfrak{R}}_{S} \big(\operatorname{conv}(\mathcal{H}) \big) = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{h_{1}, \ldots, h_{p} \in \mathcal{H}, \boldsymbol{\mu} \geq 0, \| \boldsymbol{\mu} \|_{1} \leq 1} \sum_{i = 1}^{m} \sigma_{i} \sum_{k = 1}^{p} \mu_{k} h_{k}(x_{i}) \right] \\ = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{h_{1}, \ldots, h_{p} \in \mathcal{H}} \sup_{\boldsymbol{\mu} \geq 0, \| \boldsymbol{\mu} \|_{1} \leq 1} \sum_{k = 1}^{p} \mu_{k} \sum_{i = 1}^{m} \sigma_{i} h_{k}(x_{i}) \right] \\ = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{h_{1}, \ldots, h_{p} \in \mathcal{H}} \max_{k \in[p]} \sum_{i = 1}^{m} \sigma_{i} h_{k}(x_{i}) \right] \\ = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \right] = \widehat{\mathfrak{R}}_{S}(\mathcal{H}), \end{array}
$$

where the third equality follows the definition of the dual norm (see section A.1.2) or the observation that the maximizing vector $\pmb{\mu}$ for a convex combination of $p$ terms is the one placing all the weight on the largest term. $\square$

This theorem can be used directly in combination with theorem 5.8 to derive the following Rademacher complexity generalization bound for convex combination ensembles of hypotheses. Recall that $\widehat{R}_{S, \rho}(h)$ denotes the empirical margin loss with margin $\rho.$

Corollary 7.5 (Ensemble Rademacher margin bound) Let H denote a set of real-valued functions. Fix $\rho > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following holds for all $h \in \mathrm{conv}(\mathcal{H})$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \mathfrak{R}_{m}(\mathcal{H}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}\tag{7.13}
$$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \widehat{\mathfrak{R}}_{S}(\mathcal{H}) + 3 \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{7.14}
$$

Using corollary 3.8 and corollary 3.18 to bound the Rademacher complexity in terms of the VC-dimension yields immediately the following VC-dimension-based generalization bounds for convex combination ensembles of hypotheses.

Corollary 7.6 (Ensemble VC-Dimension margin bound) Let H be a family of functions taking values in $\{+ 1, - 1\}$ with VC-dimension d. Fix $\rho > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following holds for all $h \in \mathrm{conv}(\mathcal{H})$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \sqrt{\frac{2d \log \frac{em}{d}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{7.15}
$$

These bounds can be generalized to hold uniformly for all $\rho \in(0, 1]$ , at the price of an additional term of the form $\sqrt{\frac{\log \log_{2}{\frac{2}{\delta}}}{m}}$ as in theorem 5.9. They cannot be directly applied to the function f returned by AdaBoost, since it is not a convex combination of base hypotheses, but they can be applied to its normalized version, $\begin{array}{r}{\bar{f} = \frac{\sum_{t = 1}^{T} \alpha_{t} h_{t}}{\| \pmb{\alpha} \|_{1}} \in \mathrm{conv}(\bar{\mathcal{H}})} \end{array}$ . Notice that from the point of view of binary classification, $f$ and $\bar{f}$ are equivalent since $\begin{array}{r}{\operatorname{sgn}(f) = \operatorname{sgn} \left(\frac{f}{\| \alpha \|_{1}} \right)} \end{array}$ , thus $\begin{array}{r}{R(f) = R \big(\frac{f}{\| \alpha \|_{1}} \big)} \end{array}$ , but their empirical margin losses are distinct.

Let $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ denote the function defining the classifier returned by $\mathrm{Ad} -$ aBoost after $T$ rounds of boosting when trained on sample S. Then, in view of (7.13), for any $\delta > 0$ , the following holds with probability at least $1 - \delta \colon$

$$
R(f) \leq \widehat{R}_{S, \rho}(\bar{f}) + \frac{2}{\rho} \mathfrak{R}_{m}(\mathcal{H}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{7.16}
$$

Similar bounds can be derived from (7.14) and (7.15). Remarkably, the number of rounds of boosting $T$ does not appear in the generalization bound (7.16). The bound depends only on the confidence margin $\rho,$ the sample size $m,$ and the Rademacher complexity of the family of base classifiers H. Thus, the bound guarantees an efective generalization if the margin loss $R_{\rho}(\bar{f})$ is small for a relatively large $\rho.$ Recall that the margin loss can be upper bounded by the fraction of the points x labeled with $y$ in the training sample with confidence margin at most $\rho,$ that is ${\frac{yf(x)}{\| \alpha \|_{1}}} \leq \rho$ (see (5.38)). With our definition of $L_{\mathrm{1}} \mathrm{- margin}$ , this can also be written as follows:

$$
\widehat{R}_{S, \rho}(\bar{f}) \leq \frac{| \{i \in[m] : y_{i} \rho_{f}(x_{i}) \leq \rho\} |}{m}.\tag{7.17}
$$

Additionally, the following theorem provides a bound on the empirical margin loss, which decreases with T under conditions discussed later.

Theorem 7.7 Let $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ denote the function returned by AdaBoost after T rounds of boosting and assume for all $t \in[T]$ that $\epsilon_{t} < \frac{1}{2}$ , which implies $\alpha_{t} > 0$ Then, for any $\rho > 0$ , the following holds:

$$
\widehat{R}_{S, \rho}(\bar{f}) \leq 2^{T} \prod_{t = 1}^{T} \sqrt{\epsilon_{t}^{1 - \rho}(1 - \epsilon_{t})^{1 + \rho}}.
$$

Proof: Using the general inequality $1_{u \le 0} \le \exp(- u)$ valid for all $u \in \mathbb{R}$ , identity 7.2, that is $\begin{array}{r}{\begin{array}{r}{\mathrm{\mathcal{D}}_{t + 1} \big(i \big) = \frac{}{} e^{- y_{i} f(x_{i})}} \end{array}} \end{array}$ , the equality $Z_{t} ~ = ~ 2 \sqrt{\epsilon_{t}(1 - \epsilon_{t})}$ from the proof of theorem 7.2, and the definition of $\begin{array}{r}{\alpha_{t} = \frac{1}{2} \log(\frac{1 - \epsilon_{t}}{\epsilon_{t}})} \end{array}$ in AdaBoost, we can write:

$$
\begin{array}{l} \frac{1}{m} \sum_{i = 1}^{m} 1_{y_{i} f(x_{i}) - \rho \| \boldsymbol{\alpha} \|_{1} \leq 0} \leq \frac{1}{m} \sum_{i = 1}^{m} \exp(- y_{i} f(x_{i}) + \rho \| \boldsymbol{\alpha} \|_{1}) \\ \qquad = \frac{1}{m} \sum_{i = 1}^{m} e^{\rho \| \boldsymbol{\alpha} \|_{1}} \bigg[m \prod_{t = 1}^{T} Z_{t} \bigg] \mathcal{D}_{T + 1}(i) \\ \qquad = e^{\rho \| \boldsymbol{\alpha} \|_{1}} \prod_{t = 1}^{T} Z_{t} = e^{\rho \sum_{t^{\prime}} \alpha_{t^{\prime}}} \prod_{t = 1}^{T} Z_{t} \\ \qquad = 2^{T} \prod_{t = 1}^{T} \left[\sqrt{\frac{1 - \epsilon_{t}}{\epsilon_{t}}} \right]^{\rho} \sqrt{\epsilon_{t}(1 - \epsilon_{t})}, \end{array}
$$

which concludes the proof.

Moreover, if for all $t \in[T]$ we have $\gamma \leq(\frac{1}{2} - \epsilon_{t})$ and $\rho \leq 2 \gamma$ , then the expression $4 \epsilon_{t}^{1 - \rho}(1 - \epsilon_{t})^{1 + \rho}$ is maximized at $\epsilon_{t} ={\textstyle{\frac{1}{2}}} - \gamma.^{9}$ Thus, the upper bound on the empirical margin loss can then be bounded by

$$
\widehat{R}_{S, \rho}(\bar{f}) \leq \left[(1 - 2 \gamma)^{1 - \rho}(1 + 2 \gamma)^{1 + \rho} \right]^{\frac{T}{2}}.\tag{7.18}
$$

Observe that $\textstyle(1 - 2 \gamma)^{1 - \rho}(1 + 2 \gamma)^{1 + \rho} =(1 - 4 \gamma^{2}) \bigl(\frac{1 + 2 \gamma}{1 - 2 \gamma} \bigr)^{\rho}$ . This is an increasing function of $\rho$ since we have $\textstyle{\left({\frac{1 + 2 \gamma}{1 - 2 \gamma}} \right)} > 1$ as a consequence of $\gamma > 0$ . Thus, if $\rho < \gamma$ it can be strictly upper bounded as follows

$$
(1 - 2 \gamma)^{1 - \rho}(1 + 2 \gamma)^{1 + \rho} <(1 - 2 \gamma)^{1 - \gamma}(1 + 2 \gamma)^{1 + \gamma}.
$$

The function $\gamma \mapsto(1 - 2 \gamma)^{1 - \gamma}(1 + 2 \gamma)^{1 + \gamma}$ is strictly upper bounded by 1 over the interval $(0, 1 / 2)$ , thus, if $\rho < \gamma$ , then $(1 - 2 \gamma)^{1 - \rho}(1 + 2 \gamma)^{1 + \rho} < 1$ and the right-hand side of (7.18) decreases exponentially with $T.$ . Since the condition $\rho \gg O(1 / \sqrt{m})$ is necessary in order for the given margin bounds to converge, this places a condition of $\gamma \gg O(1 / \sqrt{m})$ on the edge value. In practice, the error $\epsilon_{t}$ of the base classifier at round t may increase as a function of $t.$ Informally, this is because boosting presses the weak learner to concentrate on instances that are harder and harder to classify, for which even the best base classifier could not achieve an error significantly better than random. If $\epsilon_{t}$ becomes close to $\frac{1}{2}$ relatively fast as a function of $t,$ then the bound of theorem 7.7 becomes uninformative.

## 7.3 Theoretical results

The analysis and discussion that precede show that if AdaBoost admits a positive edge $(\gamma > 0)$ , then, for $\rho < \gamma$ , the empirical margin loss $\widehat{R}_{S, \rho}(\bar{f})$ becomes zero for $T$ suficiently large (it decreases exponentially fast). Thus, AdaBoost achieves an L -geometric margin of $\gamma$ over the training sample. In section 7.3.5, we will see that the edge $\gamma$ is positive if and only if the training sample is separable. In that case, the edge can be chosen to be as large as half the maximum L<sub>1</sub>-geometric margin $\rho_{\mathrm{max}}$ that can be achieved on the sample: $\gamma = \frac{\rho_{\mathrm{max}}}{2}$ . Thus, for a separable data set, AdaBoost can asymptotically achieve a geometric margin that is at least half the maximum geometric margin, $\frac{\rho_{\mathrm{max}}}{2}$

This analysis can serve as a theoretical explanation of the empirical observation that, in some tasks, the generalization error decreases as a function of $T$ even after the error on the training sample is zero: the geometric margin continues to increase when the training sample is separable. In (7.16), for the ensemble function $f$ determined by AdaBoost after $T$ rounds, as $T$ increases, $\rho$ can be chosen as a larger quantity for which the first term on the right-hand side vanishes $(\widehat{R}_{S, \rho}(\bar{f}) = 0)$ while the second term becomes more favorable since it decreases as $\textstyle{\frac{1}{\rho}}.$

But, does AdaBoost achieve the maximum L -geometric margin $\dot{\rho}_{\mathrm{max}} ?$ No. It has been shown that AdaBoost may converge, for a linearly separable sample, to a geometric margin that is significantly smaller than the maximum margin $(\mathrm{e.g., ~} \frac{1}{3}$ instead of $\frac{3}{8} \bigg)$ .

## 7.3.4 Margin maximization

In view of these results, several algorithms have been devised with the explicit goal of maximizing the L -geometric margin. These algorithms correspond to different methods for solving a linear program (LP).

By definition of the $L_{\mathrm{1}} \mathrm{-} \mathrm{margin}$ , the maximum margin for a linearly separable sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ is given by

$$
\rho = \max_{\boldsymbol{\alpha}} \min_{i \in[m]} \frac{y_{i}(\boldsymbol{\alpha} \cdot \mathbf{h}(x_{i}))}{\| \boldsymbol{\alpha} \|_{1}}.\tag{7.19}
$$

By definition of the maximization, the optimization problem can be written as:

$$
\begin{array}{c} \max_{\boldsymbol{\alpha}} \rho \\ \text{subject to:} \frac{y_{i}(\boldsymbol{\alpha} \cdot \mathbf{h}(x_{i}))}{\| \boldsymbol{\alpha} \|_{1}} \geq \rho, \forall i \in[m].\end{array}
$$

Since $\frac{\pmb{\alpha} \cdot \mathbf{h}(\pmb{x}_{i})}{\| \pmb{\alpha} \|_{1}}$ is invariant to the scaling of $\alpha.$ we can restrict ourselves to $\| \pmb{\alpha} \|_{1} = 1$ Further seeking a non-negative α as in the case of AdaBoost leads to the following

optimization:

$$
\begin{array}{l} \underset{\boldsymbol{\alpha}}{\max} \rho \\ \text{subject to:} y_{i} \big(\boldsymbol{\alpha} \cdot \mathbf{h}(x_{i}) \big) \geq \rho, \forall i \in[m]; \\ \left(\sum_{t = 1}^{T} \alpha_{t} = 1\right) \wedge \Big(\alpha_{t} \geq 0, \forall t \in[T] \Big).\end{array}
$$

This is a linear program (LP), that is, a convex optimization problem with a linear objective function and linear constraints. There are several different methods for solving relative large LPs in practice, using the simplex method, interior-point methods, or a variety of special-purpose solutions.

Note that the solution of this algorithm difers from the margin-maximization defining SVMs in the separable case only by the definition of the geometric margin used $(L_{1}$ versus $L_{2})$ and the non-negativity constraint on the weight vector. Figure 7.6 illustrates the margin-maximizing hyperplanes found using these two distinct margin definitions in a simple case. The left figure shows the SVM solution, where the distance to the closest points to the hyperplane is measured with respect to the norm $\| \cdot \|_{2}$ . The right figure shows the solution for the $L_{\mathrm{1}} \mathrm{-} \mathrm{margin}$ 2 where the distance to the closest points to the hyperplane is measured with respect to the norm $\| \cdot \|_{\infty}$

By definition, the solution of the LP just described admits an $L_{\mathrm{1}} \mathrm{-} \mathrm{margin}$ that is larger or equal to that of the AdaBoost solution. However, empirical results do not show a systematic benefit for the solution of the LP. In fact, it appears that in many cases, AdaBoost outperforms that algorithm. The margin theory described does not seem sufficient to explain that performance.

## 7.3.5 Game-theoretic interpretation

In this section, we show that AdaBoost admits a natural game-theoretic interpretation. The application of von Neumann’s theorem then helps us relate the maximum margin and the optimal edge and clarify the connection of AdaBoost’s weak-learning assumption with the notion of $L_{\mathrm{1}} \mathrm{-} \mathrm{margin}$ . We first introduce the definition of the edge of a base classifier for a particular distribution.

Definition 7.8 The edge of a base classifier $h_{t}$ for a distribution D over the training sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ is defined by

$$
\gamma_{t}(\mathcal{D}) = \frac{1}{2} - \epsilon_{t} = \frac{1}{2} \sum_{i = 1}^{m} y_{i} h_{t}(x_{i}) \mathcal{D}(i).\tag{7.20}
$$

AdaBoost’s weak learning condition can now be formulated as follows: there exists $\gamma > 0$ such that for any distribution D over the training sample and any base

## Table 7.1

The loss matrix for the standard rock-paper-scissors game.

<table><tr><td></td><td>rock</td><td>paper</td><td>scissors</td></tr><tr><td>rock</td><td>0</td><td>+1</td><td>-1</td></tr><tr><td>paper</td><td>-1</td><td>0</td><td>+1</td></tr><tr><td>scissors</td><td>+1</td><td>-1</td><td>0</td></tr></table>

classifier $h_{t}$ , the following holds:

$$
\gamma_{t}(\mathcal{D}) \geq \gamma.\tag{7.21}
$$

This condition is required for the analysis of theorem 7.2 and the non-negativity of the coeficients $\alpha_{t}$ . We will frame boosting as a two-person zero-sum game.

Definition 7.9 (Zero-sum game) A finite two-person zero-sum game consists of a loss matrix $\mathbf{M} \in \mathbb{R}^{m \times n}$ , where m is the number of possible actions (or pure strategies) for the row player and n the number of possible actions for the column player. The entry $M_{ij}$ is the loss for the row player (or equivalently the payof for the column payer) when the row player takes action i and the column player takes action j.<sup>10</sup>

An example of a loss matrix for the familiar “rock-paper-scissors” game is shown in table 7.1.

Definition 7.10 (Mixed strategy) A mixed strategy for the row player is a distribution p over the m possible row actions; a mixed strategy for the column player is a distribution q over the n possible column actions. The expected loss for the row player (expected payof for the column player) with respect to the mixed strategies p and q is

$$
\mathop{\mathbb{E}}_{\substack{i\sim p\\ j\sim q}}[M_{ij}] = \sum_{i = 1}^{m}\sum_{j = 1}^{n}p_{i}M_{ij}q_{j} = \mathbf{p}^{\top}\mathbf{M}\mathbf{q}.
$$

The following is a fundamental result in game theory proven in chapter 8.

Theorem 7.11 (Von Neumann’s minimax theorem) For any finite two-person zero-sum game defined by the matrix M, the following equality holds:

$$
\min_{\mathbf{p}} \max_{\mathbf{q}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} = \max_{\mathbf{q}} \min_{\mathbf{p}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q}.\tag{7.22}
$$

The common value in (7.22) is called the value of the game. The theorem states that for any two-person zero-sum game, there exists a mixed strategy for each player such that the expected loss for one is the same as the expected payof for the other, both of which are equal to the value of the game.

Note that, given the row player’s strategy, the column player can choose a pure strategy optimizes their payof. That is, the column player can choose the single strategy corresponding the largest coordinate of the vector $ { \mathbf { p } } ^ { \top }  { \mathbf { M } }$ . A similar comment applies to the reverse. Thus, an alternative and equivalent form of the minimax theorem is

$$
\min_{\mathbf{p}} \max_{j \in[n]} \mathbf{p}^{\top} \mathbf{Me}_{j} = \max_{\mathbf{q}} \min_{i \in[m]} \mathbf{e}_{i}^{\top} \mathbf{Mq},\tag{7.23}
$$

where $\mathbf{e}_{i}$ denotes the ith unit vector.

We can now view AdaBoost as a zero-sum game, where an action of the row player is the selection of a training instance $x_{i}, ~ i ~ \in ~[m]$ , and an action of the column player the selection of a base learner $h_{t}, t \in[T]$ . A mixed strategy for the row player is thus a distribution D over the training points’ indices [m]. A mixed strategy for the column player is a distribution over the based classifiers’ indices [T ]. This can be defined from a non-negative vector $\alpha \geq 0;$ : the weight assigned to $t \in[T]$ is $\alpha_{t} / \lVert \mathbf{\alpha} \rVert_{1}$ . The loss matrix $\mathbf{M} \in \{- 1, + 1\}^{m \times T}$ for AdaBoost is defined by ${M}_{it} = y_{i}{h}_{t}(x_{i})$ for all $(i, t) \in[m] \times[T]$ . By von Neumann’s theorem (7.23), the following holds:

$$
\min_{\mathcal{D} \in \mathcal{D}} \max_{t \in[T]} \sum_{i = 1}^{m} \mathcal{D}(i) y_{i} h_{t}(x_{i}) = \max_{\boldsymbol{\alpha} \geq 0} \min_{i \in[m]} \sum_{t = 1}^{T} \frac{\alpha_{t}}{\| \boldsymbol{\alpha} \|_{1}} y_{i} h_{t}(x_{i}),\tag{7.24}
$$

where denotes the set of all distributions over the training sample. Let $\rho_{\alpha}(x)$ denote the margin of point x for the classifier defined by $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ . The result can be rewritten as follows in terms of the margins and edges:

$$
2 \gamma^{*} = 2 \min_{\mathcal{D}} \max_{t \in[T]} \gamma_{t}(\mathcal{D}) = \max_{\boldsymbol{\alpha}} \min_{i \in[m]} \rho_{\boldsymbol{\alpha}}(x_{i}) = \rho^{*},\tag{7.25}
$$

where $\rho^{*}$ is the maximum margin of a classifier and $\gamma^{*}$ the best possible edge. This result has several implications. First, it shows that the weak learning condition $(\gamma^{*} > 0)$ implies $\rho^{*} > 0$ and thus the existence of a classifier with positive margin, which motivates the search for a non-zero margin. AdaBoost can be viewed as an algorithm seeking to achieve such a non-zero margin, though, as discussed earlier, AdaBoost does not always achieve an optimal margin and is thus suboptimal in that respect. Furthermore, we see that the “weak learning” assumption, which originally appeared to be the weakest condition one could require for an algorithm (that of performing better than random), is in fact a strong condition: it implies that the training sample is linearly separable with margin $2 \gamma^{*} > 0$ . Linear separability often does not hold for the data sets found in practice.

## 7.4 $\mathbf{L_{1}}$ -regularization

In practice, the training sample may not be linearly separable and AdaBoost may not admit a positive edge, in which case the weak learning condition does not hold. It may also be that AdaBoost does admit a positive edge but with $\gamma$ very small. In such cases, running AdaBoost may result in large total mixture weights for some base classifiers $h_{j}$ . This can be because the algorithm increasingly concentrates on a few examples that are hard to classify and whose weights keep growing. Only a few base classifiers might achieve the best performance for those examples and the algorithm keeps selecting them, thereby increasing their total mixture weights. These base classifiers with relatively large total mixture weight end up dominating in an ensemble $f$ and therefore solely dictating the classification decision. The performance of the resulting ensemble is typically poor since it almost entirely hinges on that of a few base classifiers.

There are several methods for avoiding such situations. One consists of limiting the number of rounds of boosting $T,$ which is also known as early-stopping. Another one consists of controlling the magnitude of the mixture weights. This can be done by augmenting the objective function of AdaBoost with a regularization term based on a norm of the vector of mixture weights. Using a norm-1 regularization leads to an algorithm that we will refer to as $L_{1}$ -regularized AdaBoost. Given a labeled sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ , the objective function G minimized by $L_{1^{-}}$ regularized AdaBoost is defined for all $\bar{\pmb{\alpha}} =(\bar{\alpha}_{1}, \dots, \bar{\alpha}_{N}) \in \mathbb{R}^{N}$ by

$$
G(\bar{\boldsymbol{\alpha}}) = \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} f(x_{i})} + \lambda \| \bar{\boldsymbol{\alpha}} \|_{1} = \frac{1}{m} \sum_{i = 1}^{m} e^{- y_{i} \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}(x_{i})} + \lambda \| \bar{\boldsymbol{\alpha}} \|_{1},\tag{7.26}
$$

where, as for AdaBoost, $f$ is an ensemble function defined by $\begin{array}{r}{f = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ , with $\bar{\alpha}_{j} \geq 0$ . The objective function $G$ is a convex function of $\bar{\alpha}$ as the sum of the convex objective of AdaBoost and the norm-1 of $\bar{\bf \alpha}$ . L -regularized AdaBoost consists of applying coordinate-descent to the objective function $G.$

We now show that the algorithm can be directed derived from the margin-based guarantee for ensemble methods of Corollary 7.5 or Corollary 7.6. Thus, in that way, $L_{\mathrm{1 - regularized}}$ AdaBoost benefits from a more favorable and natural theoretical guarantee than AdaBoost.

By the generalization of Corollary 7.5 to a uniform convergence bound over $\rho,$ for any $\delta > 0$ , with probability at least $1 - \delta$ , the following holds for all ensemble functions $\begin{array}{r}{f = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ with $\| \bar{\pmb{\alpha}} \|_{1} \le 1$ and all $\rho \in(0, 1]$ :

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} 1_{f(x_{i}) \leq \rho} + \frac{2}{\rho} \Re_{m}(\mathcal{H}) + \sqrt{\frac{\log \log_{2} \frac{2}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{7.27}
$$

The inequality also trivially holds for $\rho > 1$ since, in that case, the first term on the right-hand side of the bound is equal to one. Indeed, in that case, by H¨older’s inequality, for any $x \in{\mathcal{X}}$ , we have $\begin{array}{r}{f(x) = \sum_{j = 1}^{N} \bar{\alpha}_{i} h_{j}(x) \leq \| \bar{\pmb{\alpha}} \|_{1} \operatorname{max}_{j \in[N]} | h_{j}(x) | \leq} \end{array}$ $| | \bar{\boldsymbol{\alpha}} | |_{1} \leq 1 < \rho.$

Now, in view of the general upper bound $1_{u \le 0} \le e^{- u}$ valid for all $u \in \mathbb{R}$ , with probability at least $1 - \delta.$ , the following holds for all $\begin{array}{r}{f = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ with $\| \bar{\pmb{\alpha}} \|_{1} \le 1$ and all $\rho > 0$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} e^{1 - \frac{f(x_{i})}{\rho}} + \frac{2}{\rho} \Re_{m}(\mathcal{H}) + \sqrt{\frac{\log \log_{2} \frac{2}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{7.28}
$$

Since for any $\rho > 0, f / \rho$ admits the same generalization error as $f,$ with probability at least $1 - \rho,$ the following inequality holds for all $\begin{array}{r}{f = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ with $\| \bar{\alpha} \|_{1} \leq 1 / \rho$ and all $\rho > 0$ :

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} e^{1 - f(x_{i})} + \frac{2}{\rho} \mathfrak{R}_{m}(\mathcal{H}) + \sqrt{\frac{\log \log_{2} \frac{2}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{7.29}
$$

This inequality can be used to derive an algorithm that selects $\bar{\alpha}$ and $\rho > 0$ to minimize the right-hand side. The minimization with respect to $\rho$ does not lead to a convex optimization and depends on theoretical constant factors afecting the second and third terms, which may not be optimal. Thus, instead, $\rho$ is left as a free parameter of the algorithm, typically determined via cross-validation.

Now, since only the first term of the right-hand side depends on $\bar{\alpha},$ the bound suggests selecting α¯ as the solution of the following optimization problem:

$$
\min_{\| \bar{\alpha} \|_{1} \leq \frac{1}{\rho}} \frac{1}{m} \sum_{i = 1}^{m} e^{- f(x_{i})} = \frac{1}{m} \sum_{i = 1}^{m} e^{- \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}(x_{i})}.\tag{7.30}
$$

Introducing a Lagrange variable $\lambda \geq 0$ , the optimization problem can be written equivalently as

$$
\min_{\| \bar{\boldsymbol{\alpha}} \|_{1} \leq \frac{1}{\rho}} \frac{1}{m} \sum_{i = 1}^{m} e^{- \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}(x_{i})} + \lambda \| \bar{\boldsymbol{\alpha}} \|_{1}.\tag{7.31}
$$

Since for any choice of $\rho$ in the constraint of (7.30) there exists an equivalent dual variable $\lambda$ in the formulation (7.31) that achieves the same optimal α¯ , $\lambda \geq 0$ can be freely selected via cross-validation. The resulting objective function therefore precisely coincides with that of L -regularized AdaBoost.

## 7.5 Discussion

AdaBoost ofers several advantages: it is simple, its implementation is straightforward, and the time complexity of each round of boosting as a function of the sample size is rather favorable. As already discussed, when using decision stumps, the time complexity of each round of boosting is in $O(mN)$ . Of course, if the dimension of the feature space N is very large, then the algorithm could become in fact quite slow.

AdaBoost additionally benefits from a rich theoretical analysis. Nevertheless, there are still many theoretical questions related to the algorithm. For example, as we saw, the algorithm in fact does not maximize the margin, and yet algorithms that do maximize the margin do not always outperform it. This suggests that perhaps a finer analysis based on a notion different from that of minimal margin could shed more light on the properties of the algorithm.

A minor drawback of the algorithm is the need to select the parameter T and the base classifier set. The choice of the number of rounds of boosting T (stopping criterion) is crucial to the performance of the algorithm. As suggested by the VCdimension analysis, larger values of T can lead to overfitting. In practice, T is typically determined via cross-validation. The choice of the base classifiers is also crucial. The complexity of the family of base classifiers H appeared in all the bounds presented and it is important to control it in order to guarantee generalization. On the other hand, insuficiently complex hypothesis sets could lead to low margins.

Probably the most serious disadvantage of AdaBoost is its performance in the presence of noise, at least in some tasks. The distribution weight assigned to examples that are harder to classify substantially increases with the number of rounds of boosting, by the nature of the algorithm. These examples may end up dominating the selection of the base classifiers, which, with a large enough number of rounds, will play a detrimental role in the definition of the linear combination defined by AdaBoost. Several solutions have been proposed to address these issues. One consists of using a “less aggressive” objective function than the exponential function of AdaBoost, such as the logistic loss, to penalize less incorrectly classified points. Another solution is based on a regularization, e.g., the L -regularized AdaBoost described in the previous section.

An empirical study of AdaBoost has shown that uniform noise severely damages its accuracy. This has also been corroborated by recent theoretical results showing that boosting algorithms based on convex potentials do not tolerate even low levels of random noise. Moreover, these issues have been shown to persist even when using L -regularization or early stopping. However, the uniform noise model used in those experiments or analysis is rather unrealistic and seems unlikely to appear in practice. The model assumes that a label corruption with some fixed probability afects all instances uniformly. Clearly, the performance of any algorithm should degrade in the presence of such noise. Empirical results suggest, however, that the performance of AdaBoost tends to degrade more than that of other algorithms for this uniform noise model.

Finally, notice that the behavior of AdaBoost in the presence of noise can be used, in fact, as a useful feature for detecting outliers, that is, examples that are incorrectly labeled or that are hard to classify. Examples with large weights after a certain number of rounds of boosting can be identified as outliers.

## 7.6 Chapter notes

The question of whether a weak learning algorithm could be boosted to derive a strong learning algorithm was first posed by Kearns and Valiant [1988, 1994], who also gave a negative proof of this result for a distribution-dependent setting. The first positive proof of this result in a distribution-independent setting was given by Schapire [1990], and later by Freund [1990].

These early boosting algorithms, boosting by filtering [Schapire, 1990] or boosting by majority [Freund, 1990, 1995] were not practical. The AdaBoost algorithm introduced by Freund and Schapire [1997] solved several of these practical issues. Freund and Schapire [1997] further gave a detailed presentation and analysis of the algorithm including the bound on its empirical error, a VC-dimension analysis, and its applications to multi-class classification and regression.

Early experiments with AdaBoost were carried out by Drucker, Schapire, and Simard [1993], who gave the first implementation in OCR with weak learners based on neural networks and Drucker and Cortes [1995], who reported the empirical performance of AdaBoost combined with decision trees, in particular decision stumps.

The fact that AdaBoost coincides with coordinate descent applied to an exponential objective function was later shown by Dufy and Helmbold [1999], Mason et al. [1999], and Friedman [2000]. Friedman, Hastie, and Tibshirani [2000] also gave an interpretation of boosting in terms of additive models. They also pointed out the close connections between AdaBoost and logistic regression, in particular the fact that their objective functions have a similar behavior near zero or the fact that their expectation admit the same minimizer, and derived an alternative boosting algorithm, LogitBoost, based on the logistic loss. Laferty [1999] showed how an incremental family of algorithms, including LogitBoost, can be derived from Bregman divergences and designed to closely approximate AdaBoost when varying a parameter. Kivinen and Warmuth [1999] gave an equivalent view of AdaBoost as an entropy projection. They showed that the distribution over the sample found by Adaboost at each round is approximately the solution to the problem of finding the closest distribution to the one at the previous round, subject to the constraint that it be orthogonal to the vector of errors of the current base hypotheses. Here, closeness is measured by a Bregman divergence, which, for AdaBoost is the unnormalized relative entropy. Collins, Schapire, and Singer [2002] later showed that boosting and logistic regression were special instances of a common framework based on Bregman divergences and used that to give the first convergence proof of AdaBoost. Another direct relationship between AdaBoost and logistic regression is given by Lebanon and Laferty [2001] who showed that the two algorithms minimize the same extended relative entropy objective function subject to the same feature constraints, except from an additional normalization constraint for logistic regression.

A margin-based analysis of AdaBoost was first presented by Schapire, Freund, Bartlett, and Lee [1997], including theorem 7.7 which gives a bound on the empirical margin loss. Our presentation is based on the elegant derivation of margin bounds by Koltchinskii and Panchenko [2002] using the notion of Rademacher complexity. Rudin et al. [2004] gave an example showing that, in general, AdaBoost does not maximize the $L_{\mathrm{1}} \mathrm{- margin}$ . R¨atsch and Warmuth [2002] provided asymptotic lower bounds for the margin achieved by AdaBoost under some conditions. The $L_{1^{-}}$ margin maximization based on an LP is due to Grove and Schuurmans [1998]. R¨atsch, Onoda, and M¨uller [2001] suggested a modification of that algorithm using a soft-margin instead and pointed out its connections with SVMs. The gametheoretic interpretation of boosting and the application of von Neumann’s minimax theorem [von Neumann, 1928] in that context were pointed out by Freund and Schapire [1996, 1999b]; see also Grove and Schuurmans [1998] and Breiman [1999].

The L<sub>1</sub>-regularized AdaBoost algorithm described in Section 7.4 is presented and analyzed by R¨atsch, Mika, and Warmuth [2001]. Cortes, Mohri, and Syed [2014] introduced a new boosting algorithm, DeepBoost, which they proved to benefit from finer learning guarantees, including favorable ones even when using as base classifier set relatively rich families, for example a family of very deep decision trees, or other similarly complex families. In DeepBoost, the decisions in each iteration of which classifier to add to the ensemble and which weight to assign to that classifier, depend on the (data-dependent) complexity of the sub-family to which the classifier belongs. Cortes, Mohri, and Syed [2014] further showed that empirically DeepBoost achieves a better performance than AdaBoost, Logistic Regression, and their $L_{1} -$ regularized variants. Both AdaBoost and L -regularized AdaBoost can be viewed as special instances of DeepBoost.

Dietterich [2000] provided extensive empirical evidence for the fact that uniform noise can severely damage the accuracy of AdaBoost. This has been reported by a number of other authors since then. Long and Servedio [2010] further recently showed the failure of boosting algorithms based on convex potentials to tolerate random noise, even with L<sub>1</sub>-regularization or early stopping.

There are several excellent surveys and tutorials related to boosting [Schapire, 2003, Meir and R¨atsch, 2002, Meir and R¨atsch, 2003], including the recent book of Schapire and Freund [2012] fully dedicated to this topic, with an extensive list of references and a detailed presentation.

## 7.7 Exercises

7.1 VC-dimension of the hypothesis set of AdaBoost. Prove the upper bound on the VC-dimension of the hypothesis set $\mathcal{F}_{T}$ of AdaBoost after T rounds of boosting, as stated in equation (7.9).

7.2 Alternative objective functions. This problem studies boosting-type algorithms defined with objective functions different from that of AdaBoost. We assume that the training data are given as m labeled examples $(x_{1}, y_{1}), \dotsc,(x_{m}, y_{m}) \in$ ${\mathcal{X}} \times \{- 1, + 1\}$ . We further assume that Φ is a strictly increasing convex and diferentiable function over <sup>R</sup> such that: $\forall x \geq 0, \Phi(x) \geq 1$ and $\forall x < 0, \Phi(x) > 0$

(a) Consider the loss function $\begin{array}{r}{L(\alpha) = \sum_{i = 1}^{m} \Phi(- y_{i} f(x_{i}))} \end{array}$ where f is a linear combination of base classifiers, i.e., $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ (as in AdaBoost). Derive a new boosting algorithm using the objective function L. In particular, characterize the best base classifier $h_{u}$ to select at each round of boosting if we use coordinate descent.

(b) Consider the following functions: (1) zero-one loss $\begin{array}{r}{\Phi_{1}(- u) = 1_{u \leq 0};} \end{array}$ (2) least squared loss $\Phi_{2}(- u) =(1 - u)^{2}$ ; (3) SVM loss $\Phi_{3}(- u) = \operatorname{max} \{0, 1 - u\}$ ; and (4) logistic loss $\Phi_{4}(- u) = \log(1 + e^{- u})$ . Which functions satisfy the assumptions on Φ stated earlier in this problem?

(c) For each loss function satisfying these assumptions, derive the corresponding boosting algorithm. How do the algorithm(s) difer from AdaBoost?

7.3 Update guarantee. Assume that the main weak learner assumption of AdaBoost holds. Let $h_{t}$ be the base learner selected at round t. Show that the base learner $h_{t + 1}$ selected at round t + 1 must be different from $h_{t}$

7.4 Weighted instances. Let the training sample be $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ Suppose we wish to penalize diferently errors made on $x_{i}$ versus $x_{j}$ . To do that, we associate some non-negative importance weight $w_{i}$ to each point $x_{i}$ and define the objective function $\begin{array}{r}{F(\pmb{\alpha}) = \sum_{i = 1}^{m} w_{i} e^{- y_{i} f(x_{i})}} \end{array}$ , where $\begin{array}{r}{f = \sum_{t = 1}^{T} \alpha_{t} h_{t}} \end{array}$ . Show that this function is convex and diferentiable and use it to derive a boostingtype algorithm.

7.5 Define the unnormalized correlation of two vectors x and $\mathbf{x}^{\prime}$ as the inner product between these vectors. Prove that the distribution vector $(\mathcal{D}_{t + 1}(1), \dots, \mathcal{D}_{t + 1}(m))$ defined by AdaBoost and the vector of components $y_{i} h_{t}(x_{i})$ are uncorrelated.

7.6 Fix $\epsilon \in(0, 1 / 2)$ . Let the training sample be defined by m points in the plane with $\frac{m}{4}$ negative points all at coordinate (1, 1), another $\frac{m}{4}$ negative points all at coordinate $(- 1, - 1), \frac{m(1 - \epsilon)}{4}$ positive points all at coordinate $(1, - 1)$ , and $\frac{m(1 + \epsilon)}{4}$ positive points all at coordinate ( 1, +1). Describe the behavior of AdaBoost when run on this sample using boosting stumps. What solution does the algorithm return after T rounds?

7.7 Noise-tolerant AdaBoost. AdaBoost may be significantly overfitting in the presence of noise, in part due to the high penalization of misclassified examples. To reduce this efect, one could use instead the following objective function:

$$
F = \sum_{i = 1}^{m} G(- y_{i} f(x_{i})),\tag{7.32}
$$

where G is the function defined on <sup>R</sup> by

$$
G(x) = \left\{\begin{array}{ll} e^{x} & \text{if x\leq 0} \\ x + 1 & \text{otherwise.} \end{array} \right.\tag{7.33}
$$

(a) Show that the function G is convex and diferentiable.

(b) Use F and greedy coordinate descent to derive an algorithm similar to AdaBoost.

(c) Compare the reduction of the empirical error rate of this algorithm with that of AdaBoost.

7.8 Simplified AdaBoost. Suppose we simplify AdaBoost by setting the parameter $\alpha_{t}$ to a fixed value $\alpha_{t} = \alpha > 0$ , independent of the boosting round t.

(a) Let $\gamma$ be such that $\begin{array}{r}{\left(\frac{1}{2} - \epsilon_{t} \right) \geq \gamma > 0} \end{array}$ . Find the best value of α as a function of $\gamma$ by analyzing the empirical error.

(b) For this value of $\alpha,$ , does the algorithm assign the same probability mass to correctly classified and misclassified examples at each round? If not, which set is assigned a higher probability mass?

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
$\mathrm{ADABOOST}(\mathbf{M}, t_{\max})$  
1 $\lambda_{1,j} \leftarrow 0$ for $i = 1, \ldots, m$  
2 for $t \leftarrow 1$ to $t_{\max}$ do  
3 $d_{t,i} \leftarrow \frac{\exp(-(\mathbf{M}\pmb{\lambda}_t)_i)}{\sum_{k=1}^{m} \exp(-(M\pmb{\lambda}_t)_k)}$ for $i = 1, \ldots, m$  
4 $j_t \leftarrow \operatorname{argmax}_j(\mathbf{d}_t^\top \mathbf{M})_j$  
5 $r_t \leftarrow(\mathbf{d}_t^\top \mathbf{M})_{j_t}$  
6 $\alpha_t \leftarrow \frac{1}{2} \log \left(\frac{1 + r_t}{1 - r_t}\right)$  
7 $\pmb{\lambda}_{t+1} \leftarrow \pmb{\lambda}_t + \alpha_t \mathbf{e}_{j_t}$, where $\mathbf{e}_{j_t}$ is 1 in position $j_t$ and 0 elsewhere.  
8 return $\frac{\pmb{\lambda}_{t\max}}{\|\pmb{\lambda}_{t\max}\|_1}$
</div>

## Figure 7.7

AdaBoost defined with respect to a matrix M, which encodes the accuracy of each weak classifier on each training point.

(c) Using the previous value of $\alpha,$ give a bound on the empirical error of the algorithm that depends only on $\gamma$ and the number of rounds of boosting $T$

(d) Using the previous bound, show that for $\begin{array}{r}{T > \frac{\log m}{2 \gamma^{2}}} \end{array}$ , the resulting hypothesis is consistent with the sample of size $m$

(e) Let s be the VC-dimension of the base learners used. Give a bound on the generalization error of the consistent hypothesis obtained after $\begin{array}{r}{T = \left\lfloor \frac{\log m}{2 \gamma^{2}} \right\rfloor +} \end{array}$ 1 rounds of boosting. (Hint: Use the fact that the VC-dimension of the family of functions $\{\mathrm{sgn}(\sum_{t = 1}^{T} \alpha_{t} h_{t}) : \alpha_{t} \in \mathbb{R}\}$ is bounded by $2(s + 1) T \log_{2}(eT))$ . Suppose now that $\gamma$ varies with m. Based on the bound derived, what can be said ${\mathrm{if ~}} \gamma(m) = O(\sqrt{\frac{\log m}{m}}) ?)$

## 7.9 AdaBoost example.

In this exercise we consider a concrete example that consists of eight training points and eight weak classifiers.

(a) Define an $m \times n$ matrix M where $\mathbf{M}_{ij} = y_{i} h_{j}(\mathbf{x}_{i}), \mathrm{i.e.,} \mathbf{M}_{ij} = + 1$ if training example i is classified correctly by weak classifier $h_{j}$ , and 1 otherwise. Let $\mathbf{d}_{t}, \boldsymbol{\lambda}_{t} \in \mathbb{R}^{n}, \| \mathbf{d}_{t} \|_{1} = 1$ and $d_{t, i}$ (respectively $\lambda_{t, i})$ equal the $i^{th}$ component of $\mathbf{d}_{t}$ (respectively $\lambda_{t})$ . Now, consider AdaBoost as described in figure 7.7 and define M as below with eight training points and eight weak classifiers.

$$
\mathbf{M} = \left(\begin{array}{cccccccc} - 1 & 1 & 1 & 1 & 1 & - 1 & - 1 & 1 \\ - 1 & 1 & 1 & - 1 & - 1 & 1 & 1 & 1 \\ 1 & - 1 & 1 & 1 & 1 & - 1 & 1 & 1 \\ 1 & - 1 & 1 & 1 & - 1 & 1 & 1 & 1 \\ 1 & - 1 & 1 & - 1 & 1 & 1 & 1 & - 1 \\ 1 & 1 & - 1 & 1 & 1 & 1 & 1 & - 1 \\ 1 & 1 & - 1 & 1 & 1 & 1 & - 1 & 1 \\ 1 & 1 & 1 & 1 & - 1 & - 1 & 1 & - 1 \end{array} \right)
$$

Assume that we start with the following initial distribution over the datapoints:

$$
\mathbf{d}_{1} = \left(\frac{3 - \sqrt{5}}{8}, \frac{3 - \sqrt{5}}{8}, \frac{1}{6}, \frac{1}{6}, \frac{1}{6}, \frac{\sqrt{5} - 1}{8}, \frac{\sqrt{5} - 1}{8}, 0\right)^{\top}
$$

Compute the first few steps of the AdaBoost algorithm using M, ${\bf d}_{1}$ , and $t_{max} = 7$ . What weak classifier is picked at each round of boosting? Do you notice any pattern?

(b) What is the $L_{1}$ norm margin produced by AdaBoost for this example?

(c) Instead of using AdaBoost, imagine we combined our classifiers using the following coeficients: $[2, 3, 4, 1, 2, 2, 1, 1] \times \frac{1}{16}$ . What is the margin in this case? Does AdaBoost maximize the margin?

7.10 Boosting in the presence of unknown labels. Consider the following variant of the classification problem where, in addition to the positive and negative labels +1 and 1, points may be labeled with 0. This can correspond to cases where the true label of a point is unknown, a situation that often arises in practice, or more generally to the fact that the learning algorithm incurs no loss for predicting 1 or +1 for such a point. Let X be the input space and let $\mathcal{Y} = \{- 1, 0, + 1\}$ . As in standard binary classification, the loss of $f \colon{\mathcal{X}} \mathbb{R}$ on a pair $(x, y) \in \mathcal{X} \times \mathcal{Y}$ is defined by $1_{yf(x) < 0}$

Consider a sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m})) \in(\mathcal{X} \times \mathcal{Y})^{m}$ and a hypothesis set H of base functions taking values in $\{- 1, 0, + 1\}$ . For a base hypothesis $h_{t} \in \mathcal{H}$ and a distribution $\mathrm{{\mathcal{D}}}_{t}$ over indices $i \in[m]$ , define $\epsilon_{t}^{s}$ for $s \in \{- 1, 0, + 1\}$ by $\epsilon_{t}^{s} = \mathbb{E}_{i \sim \mathcal{D}_{t}} \big[1_{y_{i} h_{t}(x_{i}) = s} \big]$

(a) Derive a boosting-style algorithm for this setting in terms of $\epsilon_{t}^{s} s$ , using the same objective function as that of AdaBoost. You should carefully justify the definition of the algorithm.

(b) What is the weak-learning assumption in this setting?

(c) Write the full pseudocode of the algorithm.

(d) Give an upper bound on the training error of the algorithm as a function of the number of rounds of boosting and $\epsilon_{t}^{s} s$ .

7.11 HingeBoost. As discussed in the chapter, AdaBoost can be viewed as coordinate descent applied to an exponential objective function. Here, we consider an alternative ensemble method algorithm, HingeBoost, that consists of applying coordinate descent to an objective function based on the hinge loss. Consider the function F defined for all ${\pmb{\alpha}} \in \mathbb{R}^{N}$ by

$$
F(\boldsymbol{\alpha}) = \sum_{i = 1}^{m} \max \left(0, 1 - y_{i} \sum_{j = 1}^{N} \alpha_{j} h_{j}(x_{i})\right),\tag{7.34}
$$

where the $h_{j} s$ are base classifiers belonging to a hypothesis set H of functions taking values 1 or +1.

(a) Show that $F$ is convex and admits a right- and left-derivative along any direction.

(b) For any $j \in[N]$ , let $e_{j}$ denote the direction corresponding to the base hypothesis $h_{j}$ . Let $\pmb{\alpha}_{t}$ denote the vector of coeficients $\alpha_{t, j}, j \in[N]$ obtained after $t \geq 0$ iterations of coordinate descent and $\begin{array}{r}{f_{t} = \sum_{j = 1}^{N} \alpha_{t, j} h_{j}} \end{array}$ the predictor obtained after t iterations.

Give the expression of the right-derivative $F_{+}^{\prime}(\pmb{\alpha}_{t - 1}, e_{j})$ and the left-derivative $F_{-}^{\prime}(\alpha_{t - 1}, e_{j})$ after $t - 1$ iterations in terms of $f_{t - 1}$

(c) For any $j \in[N]$ , define the maximum directional derivative $\delta F(\alpha_{t - 1}, e_{j})$ at $\alpha_{t - 1}$ as follows:

$$
\begin{array}{ll} \delta F(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) = \\ \left\{\begin{array}{ll} 0 & \text{if} F_{-}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) \leq 0 \leq F_{+}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) \\ F_{+}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) & \text{if} F_{-}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) \leq F_{+}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) \leq 0 \\ F_{-}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) & \text{if} 0 \leq F_{-}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}) \leq F_{+}^{\prime}(\boldsymbol{\alpha}_{t - 1}, \boldsymbol{e}_{j}).\end{array} \right.\end{array}
$$

The direction $e_{j}$ considered by the coordinate descent considered here is the one maximizing $| \delta F(\pmb{\alpha}_{t - 1}, \pmb{e}_{j}) |$ . Once the best direction $j$ is selected, the step η can be determined by minimizing $F(\pmb{\alpha}_{t - 1} + \eta \pmb{e}_{j})$ using a grid search. Give the pseudocode of HingeBoost.

7.12 Empirical margin loss boosting. As discussed in the chapter, AdaBoost can be viewed as coordinate descent applied to a convex upper bound on the empirical error. Here, we consider an algorithm seeking to minimize the empirical margin loss. For any $0 \leq \rho < 1$ let $\begin{array}{r}{\widehat{R}_{S, \rho}(f) = \frac{1}{m} \sum_{i = 1}^{m} 1_{y_{i} f(x_{i}) \leq \rho}} \end{array}$ denote the empirical margin loss of a function f of the form $\begin{array}{r}{f = \frac{\sum_{t = 1}^{x} \alpha_{t} h_{t}}{\sum_{t = 1}^{T} \alpha_{t}}} \end{array}$ for a labeled sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$

(a) Show that $\widehat{R}_{S, \rho}(f)$ can be upper bounded as follows:

$$
\widehat{R}_{S, \rho}(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \exp \left(- y_{i} \sum_{t = 1}^{T} \alpha_{t} h_{t}(x_{i}) + \rho \sum_{t = 1}^{T} \alpha_{t}\right).
$$

(b) For any $\rho > 0$ , let $G_{\rho}$ be the objective function defined for all $\alpha \geq 0$ by

$$
G_{\rho}(\pmb{\alpha}) = \frac{1}{m} \sum_{i = 1}^{m} \exp \left(- y_{i} \sum_{j = 1}^{N} \alpha_{j} h_{j}(x_{i}) + \rho \sum_{j = 1}^{N} \alpha_{j}\right),
$$

with $h_{j} \in H$ for all $j \in[N]$ , with the notation used in class in the boosting lecture. Show that $G_{\rho}$ is convex and diferentiable.

(c) Derive a boosting-style algorithm $A_{\rho}$ by applying (maximum) coordinate descent to $G_{\rho}$ . You should justify in detail the derivation of the algorithm, in particular the choice of the base classifier selected at each round and that of the step. Compare both to their counterparts in AdaBoost.

(d) What is the equivalent of the weak learning assumption for $A_{\rho}$ (Hint: use non-negativity of the step value)?

(e) Give the full pseudocode of the algorithm $A_{\rho}$ . What can you say about the $\mathcal{A}_{\mathrm{0}}$ algorithm?

(f) Provide a bound on $\widehat{R}_{S, \rho}(f)$

i. Prove the upper bound $\begin{array}{r}{\widehat{R}_{S, \rho}(f) \leq \exp \left(\sum_{t = 1}^{T} \alpha_{t} \rho \right) \prod_{t = 1}^{T} Z_{t}} \end{array}$ , where the normalization factors $Z_{t}$ are defined as in the case of AdaBoost (with $\alpha_{t}$ the step chosen by $A_{\rho}$ at round t).

ii. Give the expression of $Z_{t}$ as a function of $\rho$ and $\epsilon_{t}$ , where $\epsilon_{t}$ is the weighted error of the hypothesis found by $A_{\rho}$ at round t (defined in the same way as for AdaBoost in class). Use that to prove the following upper bound

$$
\widehat{R}_{S, \rho}(f) \leq \left(u^{\frac{1 + \rho}{2}} + u^{- \frac{1 - \rho}{2}}\right)^{T} \prod_{t = 1}^{T} \sqrt{\epsilon_{t}^{1 - \rho}(1 - \epsilon_{t})^{1 + \rho}},
$$

where $\textstyle u ={\frac{1 - \rho}{1 + \rho}}$

iii. Assume that for all $\begin{array}{r}{t \in[T], \frac{1 - \rho}{2} - \epsilon_{t} > \gamma > 0} \end{array}$ . Use the result of the previous question to show that

$$
\widehat{R}_{S, \rho}(f) \leq \exp \left(- \frac{2 \gamma^{2} T}{1 - \rho^{2}}\right).
$$

(Hint: you can use without proof the following identity:

$$
\left(u^{\frac{1 + \rho}{2}} + u^{- \frac{1 - \rho}{2}}\right) \sqrt{\epsilon_{t}^{1 - \rho}(1 - \epsilon_{t})^{1 + \rho}} \leq 1 - 2 \frac{\left(\frac{1 - \rho}{2} - \epsilon_{t}\right)^{2}}{1 - \rho^{2}},
$$

valid for $\begin{array}{r}{\frac{1 - \rho}{2} - \epsilon_{t} > 0.)} \end{array}$ Show that for $\begin{array}{r}{T \geq \frac{(\log m)(1 - \rho^{2})}{2 \gamma^{2}}} \end{array}$ , all points of the training data have margin at least $\rho.$

This chapter presents an introduction to on-line learning, an important area with a rich literature and multiple connections with game theory and optimization that is increasingly influencing the theoretical and algorithmic advances in machine learning. In addition to the intriguing novel learning theory questions that they raise, on-line learning algorithms are particularly attractive in modern applications since they provide an efficient solution for large-scale problems.

These algorithms process one sample at a time with an update per iteration that is often computationally cheap and easy to implement. As a result, they are typically significantly more efficient both in time and space and more practical than batch algorithms, when processing modern data sets of several million or billion points. They are also typically easy to implement. Moreover, on-line algorithms do not require any distributional assumption; their analysis assumes an adversarial scenario. This makes them applicable in a variety of scenarios where the sample points are not drawn i.i.d. or according to a fixed distribution.

We first introduce the general scenario of on-line learning, then present and analyze several key algorithms for on-line learning with expert advice, including the deterministic and randomized weighted majority algorithms for the zero-one loss and an extension of these algorithms for convex losses. We also describe and analyze two standard on-line algorithms for linear classification, the Perceptron and Winnow algorithms, as well as some extensions. While on-line learning algorithms are designed for an adversarial scenario, they can be used, under some assumptions, to derive accurate predictors for a distributional scenario. We derive learning guarantees for this on-line to batch conversion. Finally, we briefly point out the connection of on-line learning with game theory by describing its use to derive a simple proof of von Neumann’s minimax theorem.


---
title: "Chapter 9 \u2014 Multi-Class Classification"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 9
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 5588
source_line_end: 6157
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 1
caption_derived_image_alt: 2
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 9 — Multi-Class Classification

> [[../README|本书目录]] · [[08-chapter-8-on-line-learning|上一章]] · [[10-chapter-10-ranking|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 5588–6157。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.237) × 1；PDF-confirmed book-specific control-codepoint pattern × 1；Affine × 1；different × 7；sufficient × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 9.1 Multi-class classification problem

Let X denote the input space and Y denote the output space, and let D be an unknown distribution over X according to which input points are drawn. We will distinguish between two cases: the mono-label case, where Y is a finite set of classes that we mark with numbers for convenience, $\mathcal{Y} = \{1, \ldots, k\}$ , and the multi-label case where $\mathcal{Y} = \{- 1, + 1\}^{k}$ . In the mono-label case, each example is labeled with a single class, while in the multi-label case it can be labeled with several. The latter can be illustrated by the case of text documents, which can be labeled with several different relevant topics, e.g., sports, business, and society. The positive components of a vector in $\{- 1, + 1\}^{k}$ indicate the classes associated with an example.

In either case, the learner receives a labeled sample $S = \left((x_{1}, y_{1}), \dots,(x_{m}, y_{m}) \right) \in$ $(\mathcal{X} \times \mathcal{Y})^{m}$ with $x_{1}, \ldots, x_{m}$ drawn i.i.d. according to D, and $y_{i} = f(x_{i})$ for all $i \in[m]$ 2 where $f \colon{\mathcal{X}} \mathcal{Y}$ is the target labeling function. Thus, we consider a deterministic scenario, which, as discussed in section 2.4.1, can be straightforwardly extended to a stochastic one that admits a distribution over $\mathcal X \times \mathcal Y$

Given a hypothesis set H of functions mapping X to Y, the multi-class classification problem consists of using the labeled sample S to find a hypothesis $h \in{\mathcal{H}}$ with small generalization error $R(h)$ with respect to the target $f \colon$

$$
R(h) = \underset{x \sim \mathcal{D}}{\mathbb{E}}[1_{h(x) \neq f(x)}]
$$

$$
\mathrm{mono-labelcase}\tag{9.1}
$$

$$
R(h) = \underset{x \sim \mathcal{D}}{\mathbb{E}} \left[\sum_{l = 1}^{k} 1_{[h(x)]_{l} \neq[f(x)]_{l}} \right]
$$

$$
\mathrm{multi-labelcase}.\tag{9.2}
$$

The notion of Hamming distance $d_{H}$ , that is, the number of corresponding components in two vectors that difer, can be used to give a common formulation for both errors:

$$
R(h) = \underset{x \sim \mathcal{D}}{\mathbb{E}} \left[d_{H}(h(x), f(x)) \right].\tag{9.3}
$$

The empirical error of $h \in{\mathcal{H}}$ is denoted by $\widehat{R}_{S}(h)$ and defined by

$$
\widehat{R}_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m} d_{H}(h(x_{i}), y_{i}).\tag{9.4}
$$

Several issues, both computational and learning-related, often arise in the multiclass setting. Computationally, dealing with a large number of classes can be problematic. The number of classes k directly enters the time complexity of the algorithms we will present. Even for a relatively small number of classes such as $k = 100 \ \mathrm{or} \k = 1, 000$ , some techniques may become prohibitive to use in practice. This dependency is even more critical in the case where k is very large or even infinite as in the case of some structured prediction problems.

A learning-related issue that commonly appears in the multi-class setting is the existence of unbalanced classes. Some classes may be represented by less than 5 percent of the labeled sample, while others may dominate a very large fraction of the data. When separate binary classifiers are used to define the multi-class solution, we may need to train a classifier distinguishing between two classes with only a small representation in the training sample. This implies training on a small sample, with poor performance guarantees. Alternatively, when a large fraction of the training instances belong to one class, it may be tempting to propose a hypothesis always returning that class, since its generalization error as defined earlier is likely to be relatively low. However, this trivial solution is typically not the one intended. Instead, the loss function may need to be reformulated by assigning different misclassification weights to each pair of classes.

Another learning-related issue is the relationship between classes, which can be hierarchical. For example, in the case of document classification, the error of misclassifying a document dealing with world politics as one dealing with real estate should naturally be penalized more than the error of labeling a document with sports instead of the more specific label baseball. Thus, a more complex and more useful multi-class classification formulation would take into consideration the hierarchical relationships between classes and define the loss function in accordance with this hierarchy. More generally, there may be a graph relationship between classes as in the case of gene ontology in computational biology. The use of hierarchical relationships between classes leads to a richer and more complex multi-class classification problem.

## 9.2 Generalization bounds

In this section, we present margin-based generalization bounds for multi-class classification in the mono-label case. In the binary setting, classifiers are often defined based on the sign of a scoring function. In the multi-class setting, a hypothesis is defined based on a scoring function $h \colon \mathcal{X} \times \mathcal{Y} \mathbb{R}$ . The label associated to point x is the one resulting in the largest score $h(x, y)$ , which defines the following mapping from X to Y:

$$
x \mapsto \operatorname{argmax}_{y \in \mathcal{Y}} h(x, y).
$$

This naturally leads to the following definition of the margin $\rho_{h}(x, y)$ of the function h at a labeled example $(x, y)$

$$
\rho_{h}(x, y) = h(x, y) - \max_{y^{\prime} \neq y} h(x, y^{\prime}).
$$

Thus, h misclassifies $(x, y)$ if $\rho_{h}(x, y) \le 0$ . For any $\rho > 0$ , we can define the empirical margin loss of a hypothesis h for multi-class classification as

$$
\widehat{R}_{S, \rho}(h) = \frac{1}{m} \sum_{i = 1}^{m} \Phi_{\rho}(\rho_{h}(x_{i}, y_{i})),\tag{9.5}
$$

where $\Phi_{\rho}$ is the margin loss function (definition 5.5). Thus, the empirical margin loss for multi-class classification is upper bounded by the fraction of the training points misclassified by h or correctly classified but with confidence less than or

equal to $\rho \colon$

$$
\widehat{R}_{S, \rho}(h) \leq \frac{1}{m} \sum_{i = 1}^{m} 1_{\rho_{h}(x_{i}, y_{i}) \leq \rho}.\tag{9.6}
$$

The following lemma will be used in the proof of the main result of this section.

Lemma 9.1 Let $\mathcal{F}_{1}, \ldots, \mathcal{F}_{l}$ be l hypothesis sets in $\mathbb{R}^{x}, l \geq 1$ , and let $\mathcal{G} = \{\operatorname{max} \{h_{1},...;$ $h_{l}\} \colon h_{i} \in \mathcal{F}_{i}, i \in[l]\}$ . Then, for any sample S of size $m$ , the empirical Rademacher complexity of $\mathcal{G}$ can be upper bounded as follows:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{G}) \leq \sum_{j = 1}^{l} \widehat{\mathfrak{R}}_{S}(\mathcal{F}_{j}).\tag{9.7}
$$

Proof: Let $S =(x_{1}, \dots, x_{m})$ be a sample of size m. We first prove the result in the case $l = 2$ . By definition of the max operator, for any $h_{1} \in \mathcal{F}_{1}$ and $h_{2} \in \mathcal{F}_{2}$ 2

$$
\max \{h_{1}, h_{2}\} = \frac{1}{2}[h_{1} + h_{2} + | h_{1} - h_{2} |].
$$

Thus, we can write:

$$
\begin{aligned} & \widehat{\mathfrak{R}}_{S}(\mathcal{G}) = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Big[\sup_{\substack{h_{1}\in \mathcal{F}_{1}\\ h_{2}\in \mathcal{F}_{2}}}\sum_{i = 1}^{m}\sigma_{i}\max \{h_{1}(x_{i}),h_{2}(x_{i})\} \Big]\\ & \qquad = \frac{1}{2m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Big[\sup_{\substack{h_{1}\in \mathcal{F}_{1}\\ h_{2}\in \mathcal{F}_{2}}}\sum_{i = 1}^{m}\sigma_{i}\big(h_{1}(x_{i}) + h_{2}(x_{i}) + |(h_{1} - h_{2})(x_{i})|\big)\Big]\\ & \qquad \leq \frac{1}{2}\widehat{\mathfrak{R}}_{S}(\mathcal{F}_{1}) + \frac{1}{2}\widehat{\mathfrak{R}}_{S}(\mathcal{F}_{2}) + \frac{1}{2m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Big[\sup_{\substack{h_{1}\in \mathcal{F}_{1}\\ h_{2}\in \mathcal{F}_{2}}}\sum_{i = 1}^{m}\sigma_{i}|(h_{1} - h_{2})(x_{i})|\Big], \end{aligned}\tag{9.8}
$$

using the sub-additivity of sup. Since $x \mapsto | x |$ is 1-Lipschitz, by Talagrand’s lemma (lemma 5.7), the last term can be bounded as follows

$$
\begin{array}{l} \frac{1}{2m} \mathbb{E}_{\boldsymbol{igma}} \left[\sup_{\substack{h_{1} \in \mathcal{F}_{1} \\ h_{2} \in \mathcal{F}_{2}}} \sum_{i = 1}^{m} \sigma_{i} |(h_{1} - h_{2})(x_{i}) | \right] \leq \frac{1}{2m} \mathbb{E}_{\boldsymbol{igma}} \left[\sup_{\substack{h_{1} \in \mathcal{F}_{1} \\ h_{2} \in \mathcal{F}_{2}}} \sum_{i = 1}^{m} \sigma_{i}(h_{1} - h_{2})(x_{i}) \right] \\ \leq \frac{1}{2} \widehat{\Re}_{S}(\mathcal{F}_{1}) + \frac{1}{2m} \mathbb{E}_{\boldsymbol{igma}} \left[\sup_{h_{2} \in \mathcal{F}_{2}} \sum_{i = 1}^{m} - \sigma_{i} h_{2}(x_{i}) \right] \\ = \frac{1}{2} \widehat{\Re}_{S}(\mathcal{F}_{1}) + \frac{1}{2} \widehat{\Re}_{S}(\mathcal{F}_{2}), \end{array} \tag{9.}\tag{9.9}
$$

where we again use the sub-additivity of sup for the second inequality and the fact that $\sigma_{i}$ and $- \sigma_{i}$ have the same distribution for any $i \in[m]$ for the last equality. Combining (9.8) and (9.9) yields $\widehat{\mathfrak{R}}_{S}(\mathcal{G}) \leq \widehat{\mathfrak{R}}_{S}(\mathcal{F}_{1}) + \widehat{\mathfrak{R}}_{S}(\mathcal{\bar{F}}_{2})$ . The general case can be derived from the case $l = 2$ using max $\{h_{1},..., h_{l}\} = \operatorname{max} \{h_{1}$ , max $\{h_{2}, \ldots, h_{l}\}\}$ and an immediate recurrence. $\square$

For any family of hypotheses mapping $\mathcal X \times \mathcal Y$ to $\mathbb{R}.$ , we define $\Pi_{1}({\mathcal{H}})$ by

$$
\Pi_{1}(\mathcal{H}) = \{x \mapsto h(x, y) \colon y \in \mathcal{Y}, h \in \mathcal{H}\}.
$$

The following theorem gives a general margin bound for multi-class classification.

Theorem 9.2 (Margin bound for multi-class classification) Let $\mathcal{H} \subseteq \mathbb{R}^{\mathcal{X} \times \mathcal{Y}}$ be a hypothesis set with $\mathcal{Y} = \{1, \ldots, k\}$ . Fix $\rho > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following multi-class classification generalization bound holds for all $h \in{\mathcal{H}}.$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{4k}{\rho} \mathfrak{R}_{m}(\Pi_{1}(\mathcal{H})) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{9.10}
$$

Proof: We will need the following definition for this proof:

$$
\rho_{\theta, h}(x, y) = \min_{y^{\prime}}(h(x, y) - h(x, y^{\prime}) + \theta 1_{y^{\prime} = y}),
$$

where $\theta > 0$ is an arbitrary constant. Observe that $\mathbb{E}[1_{\rho_{h}(x, y) \leq 0}] \leq \mathbb{E}[1_{\rho_{\theta, h}(x, y) \leq 0}]$ since the inequality $\rho_{\theta, h}(x, y) \leq \rho_{h}(x, y)$ holds for all $(x, y) \in{\mathfrak{X}} \times{\mathfrak{Y}};$

$$
\begin{array}{l} \rho_{\theta, h}(x, y) = \min_{y^{\prime}} \left(h(x, y) - h(x, y^{\prime}) + \theta 1_{y^{\prime} = y}\right) \\ \qquad \leq \min_{y^{\prime} \neq y} \left(h(x, y) - h(x, y^{\prime}) + \theta 1_{y^{\prime} = y}\right) \\ \qquad = \min_{y^{\prime} \neq y} \left(h(x, y) - h(x, y^{\prime})\right) = \rho_{h}(x, y), \end{array}
$$

where the inequality follows from taking the minimum over a smaller set.

Now, similar to the proof of theorem 5.8, let $\widetilde{\mathcal{H}} = \{(x, y) \mapsto \rho_{\theta, h}(x, y) \colon h \in \mathcal{H}\}$ and $\mathcal{\widetilde{H}} = \{\Phi_{\rho} \circ \widetilde{h} \colon \widetilde{h} \in \widetilde{\mathcal{H}}\}$ . By theorem 3.3, with probability at least $1 - \delta$ , for all $h \in{\mathcal{H}}$ ,

$$
\mathbb{E} \left[\Phi_{\rho}(\rho_{\theta, h}(x, y)) \right] \leq \frac{1}{m} \sum_{i = 1}^{m} \Phi_{\rho}(\rho_{\theta, h}(x_{i}, y_{i})) + 2 \Re_{m}(\widetilde{\mathcal{H}}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Since $1_{u \le 0} \le \Phi_{\rho}(u)$ for all $u \in \mathbb{R}$ , the generalization error $R(h)$ is a lower bound on the left-hand side, $R(h) = \mathbb{E}[1_{\rho_{h}(x, y) \leq 0}] \leq \mathbb{E}[1_{\rho_{\theta, h}(x, y) \leq 0}] \leq \mathbb{E} \left[\Phi_{\rho}(\rho_{\theta, h}(x, y)) \right]$ , and we can write:

$$
R(h) \leq \frac{1}{m} \sum_{i = 1}^{m} \Phi_{\rho}(\rho_{\theta, h}(x_{i}, y_{i})) + 2 \Re_{m}(\widetilde{\mathcal{H}}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Fixing $\theta = 2 \rho,$ we observe that $\Phi_{\rho}(\rho_{\theta, h}(x_{i}, y_{i})) = \Phi_{\rho}(\rho_{h}(x_{i}, y_{i}))$ . Indeed, either $\rho_{\theta, h}(x_{i}, y_{i}) = \rho_{h}(x_{i}, y_{i})$ or $\rho_{\theta, h}(x_{i}, y_{i}) = 2 \rho \le \rho_{h}(x_{i}, y_{i})$ , which implies the desired result. Furthermore, Talagrand’s lemma (lemma 5.7) yields $\Re_{m}(\widetilde{\mathcal{H}}) \leq{\frac{1}{\rho}} \Re_{m}(\widetilde{\mathcal{H}})$ since $\Phi_{\rho}$ is a $\scriptstyle{\frac{1}{\rho}} - \mathrm{Lipschitz}$ function. Therefore, for any $\delta > 0$ , with probability at

least $1 - \delta$ , for all $h \in{\mathcal{H}}.$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \Re_{m}(\widetilde{\mathcal{H}}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

and to complete the proof it sufices to show that $\Re_{m}(\widetilde{\mathcal{H}}) \leq 2k \Re_{m}(\Pi_{1}(\mathcal{H}))$

Here $\mathfrak{R}_{m}(\widetilde{\mathcal{H}})$ can be upper-bounded as follows:

$$
\begin{array}{rl} &{\mathfrak{R}_{m}(\widetilde{\mathcal{H}}) = \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i}(h(x_{i}, y_{i}) - \max_{y}(h(x_{i}, y) - 2 \rho 1_{y = y_{i}})) \right]} \\ &{\qquad \leq \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y_{i}) \right] + \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} \max_{y}(h(x_{i}, y) - 2 \rho 1_{y = y_{i}}) \right].} \end{array}
$$

Now we bound the first term above. Observe that

$$
\begin{array}{rl} &{\frac{1}{m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y_{i}) \right] = \frac{1}{m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sum_{y \in \mathcal{Y}} \sigma_{i} h(x_{i}, y) 1_{y_{i} = y} \right]} \\ &{\qquad \leq \frac{1}{m} \sum_{y \in \mathcal{Y}} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y) 1_{y_{i} = y} \right]} \\ &{\qquad = \sum_{y \in \mathcal{Y}} \frac{1}{m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y) \left(\frac{\epsilon_{i}}{2} + \frac{1}{2}\right) \right],} \end{array}
$$

where $\epsilon_{i} = 2 \cdot 1_{y_{i} = y} - 1$ . Since $\epsilon_{i} \in \{- 1, + 1\}$ , we have that $\sigma_{i}$ and $\sigma_{i} \epsilon_{i}$ admit the same distribution and, for any $y \in \forall$ , each of the terms of the right-hand side can be bounded as follows:

$$
\begin{array}{l} \frac{1}{m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y) \Big(\frac{\epsilon_{i}}{2} + \frac{1}{2} \Big) \right] \\ \leq \frac{1}{2m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} \epsilon_{i} h(x_{i}, y) \right] + \frac{1}{2m} \mathbb{E}_{\sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y) \right] \\ \leq \widehat{\mathfrak{R}}_{m}(\Pi_{1}(\mathcal{H})).\end{array}
$$

Thus, we can write $\begin{array}{r}{\frac{1}{m} \mathbb{E}_{S, \sigma} \left[\operatorname{sup}_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y_{i}) \right] \leq k \Re_{m}(\Pi_{1}(\mathcal{H}))} \end{array}$ . To bound the second term, we first apply lemma 9.1 which immediately yields that

$$
\begin{array}{rlr} & &{\frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} \max_{y}(h(x_{i}, y) - 2 \rho 1_{y = y_{i}}) \right]} \\ & &{\leq \sum_{y \in \mathcal{Y}} \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i}(h(x_{i}, y) - 2 \rho 1_{y = y_{i}}) \right]} \end{array}
$$

and since Rademacher variables are mean zero, we observe that

$$
\begin{array}{c} \mathbb{E}_{S, \sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i}(h(x_{i}, y) - 2 \rho 1_{y = y_{i}}) \right] = \mathbb{E}_{S, \sigma} \left[\sup_{h \in \mathcal{H}} \left(\sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y)\right) - 2 \rho \sum_{i = 1}^{m} \sigma_{i} 1_{y = y_{i}} \right] \\ = \mathbb{E}_{S, \sigma} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}, y) \right] \leq \Re_{m}(\Pi_{1}(\mathcal{H})) \end{array}
$$

which completes the proof.

These bounds can be generalized to hold uniformly for all $\rho > 0$ at the cost of an additional term $\sqrt{(\log \log_{2}(2 / \rho)) / m}$ , as in theorem 5.9 and exercise 5.2. As for other margin bounds presented in previous sections, they show the conflict between two terms: the larger the desired pairwise ranking margin $\rho,$ the smaller the middle term, at the price of a larger empirical multi-class classification margin loss $\widehat{R}_{S, \rho}.$ Note, however, that here there is additionally a dependency on the number of classes k. This suggests either weaker guarantees when learning with a large number of classes or the need for even larger margins $\rho$ for which the empirical margin loss would be small.

For some hypothesis sets, a simple upper bound can be derived for the Rademacher complexity of $\Pi_{1}({\mathcal{H}})$ , thereby making theorem 9.2 more explicit. We will show this for kernel-based hypotheses. Let $K \colon \mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel and let $\Phi \colon \mathcal{X} \mathbb{H}$ be a feature mapping associated to K. In multi-class classification, a kernel-based hypothesis is based on k weight vectors $\mathbf{w}_{1}, \ldots, \mathbf{w}_{k} \in \mathbb{H}$ . Each weight vector $\mathbf{w}_{l}.$ $l \in[k]$ , defines a scoring function $x \mapsto \mathbf{w}_{l} \cdot \pmb{\Phi}(x)$ and the class associated to point $x \in{\mathfrak{X}}$ is given by

$$
\operatorname{argmax}_{y \in \mathcal{Y}} \mathbf{w}_{y} \cdot \boldsymbol{\Phi}(x).
$$

We denote by W the matrix formed by these weight vectors: $\mathbf{W} =(\mathbf{w}_{1}, \ldots, \mathbf{w}_{k})^{\top}$ and for any $p \geq 1$ denote by $\| \mathbf{W} \|_{\mathbb{H}, p}$ the $L_{\mathbb{H}, p}$ group norm of W defined by

$$
\| \mathbf{W} \|_{\mathbb{H}, p} = \big(\sum_{l = 1}^{k} \| \mathbf{w}_{l} \|_{\mathbb{H}}^{p} \big)^{1 / p}.
$$

For any $p \geq 1$ , the family of kernel-based hypotheses we will consider $\mathrm{is^{13}}$

$$
\mathcal{H}_{K, p} = \{(x, y) \in \mathcal{X} \times \{1, \dots, k\} \mapsto \mathbf{w}_{y} \cdot \boldsymbol{\Phi}(x) \colon \mathbf{W} =(\mathbf{w}_{1}, \dots, \mathbf{w}_{k})^{\top}, \| \mathbf{W} \|_{\mathbb{H}, p} \leq \Lambda\}.
$$

Proposition 9.3 (Rademacher complexity of multi-class kernel-based hypotheses) Let $K$ : $\mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel and let $\Phi \colon \mathcal{X} \mathbb{H}$ be a feature mapping associated to

K. Assume that there exists $r > 0$ such that $K(x, x) \leq r^{2}$ for all $x \in{\mathfrak{X}}$ . Then, for any $m \geq 1, \Re_{m}(\Pi_{1}(\mathcal{H}_{K, p}))$ can be bounded as follows:

$$
\mathfrak{R}_{m}(\Pi_{1}(\mathcal{H}_{K, p})) \leq \sqrt{\frac{r^{2} \Lambda^{2}}{m}}.
$$

Proof: Let $\boldsymbol{S} =(x_{1}, \dots, x_{m})$ denote a sample of size m. Observe that for all $l \in[k]$ , the inequality $\begin{array}{r}{\| \mathbf{w}_{l} \|_{\mathbb{H}} \leq \big(\sum_{l = 1}^{k} \| \mathbf{w}_{l} \|_{\mathbb{H}}^{p} \big)^{1 / p} = \| \mathbf{W} \|_{\mathbb{H}, p}} \end{array}$ holds. Thus, the condition $\| \mathbf{W} \|_{\mathbb{H}, p} \leq \Lambda$ implies that $\| \mathbf{w}_{l} \|_{\mathbb{H}} \leq \Lambda$ for all $l \in[k]$ . In view of that, the Rademacher complexity of the hypothesis set $\Pi_{1}(\mathcal{H}_{K, p})$ can be expressed and bounded as follows:

$$
\begin{array}{l}\mathfrak{R}_{m}(\Pi_{1}(\mathcal{H}_{K,p})) = \frac{1}{m}\mathbb{E}_{S,\boldsymbol{igma}}\left[\sup_{\substack{y\in \mathcal{Y}\\ \| \mathbf{W}\| \leq \Lambda}}\Big\langle \mathbf{w}_{y},\sum_{i = 1}^{m}\sigma_{i}\Phi(x_{i})\Big\rangle \right]\\ \leq \frac{1}{m}\mathbb{E}_{S,\boldsymbol{igma}}\left[\sup_{\substack{y\in \mathcal{Y}\\ \| \mathbf{W}\| \leq \Lambda}}\| \mathbf{w}_{y}\|_{\mathbb{H}}\left\| \sum_{i = 1}^{m}\sigma_{i}\Phi(x_{i})\right\|_{\mathbb{H}}\right] \quad(\text{Cauchy - Schwarz ineq.})\\ \leq \frac{\Lambda}{m}\mathbb{E}_{S,\boldsymbol{igma}}\left[\left\| \sum_{i = 1}^{m}\sigma_{i}\Phi(x_{i})\right\|_{\mathbb{H}}\right]\\ \leq \frac{\Lambda}{m}\left[\mathbb{E}_{S,\boldsymbol{igma}}\left[\left\|\sum_{i = 1}^{m}\sigma_{i}\Phi(x_{i})\right\|_{\mathbb{H}}^{2}\right]\right]^{1 / 2}\\ = \frac{\Lambda}{m}\left[\mathbb{E}_{S,\boldsymbol{igma}}\left[\sum_{i = 1}^{m}\| \Phi(x_{i})\|_{\mathbb{H}}^{2}\right]\right]^{1 / 2}\\ = \frac{\Lambda}{m}\left[\mathbb{E}_{S,\boldsymbol{igma}}\left[\sum_{i = 1}^{m}K(x_{i},x_{i})\right]\right]^{1 / 2}\\ \leq \frac{\Lambda\sqrt{mr^{2}}}{m} = \sqrt{\frac{r^{2}\Lambda^{2}}{m}}, \end{array} \tag{Cauchy-Schwarzineq.}
$$

which concludes the proof.

Combining theorem 9.2 and proposition 9.3 yields directly the following result.

## Corollary 9.4 (Margin bound for multi-class classification with kernel-based hypotheses)

Let K : $\mathcal{X} \times \mathcal{X} \mathbb{R}$ be a PDS kernel and let $\Phi \colon \mathcal{X} \mathbb{H}$ be a feature mapping associated to K. Assume that there exists $r > 0$ such that $K(x, x) \leq r^{2}$ for all $x \in{\mathfrak{X}}$ . Fix $\rho > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following multi-class classification generalization bound holds for all $h \in \mathcal{H}_{K, p}$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + 4k \sqrt{\frac{r^{2} \Lambda^{2} / \rho^{2}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{9.11}
$$

In the next two sections, we describe multi-class classification algorithms that belong to two distinct families: uncombined algorithms, which are defined by a single optimization problem, and aggregated algorithms, which are obtained by training multiple binary classifications and by combining their outputs.

## 9.3 Uncombined multi-class algorithms

In this section, we describe three algorithms designed specifically for multi-class classification. We start with a multi-class version of SVMs, then describe a boostingtype multi-class algorithm, and conclude with decision trees, which are often used as base learners in boosting.

## 9.3.1 Multi-class SVMs

We describe an algorithm that can be derived directly from the theoretical guarantees presented in the previous section. Proceeding as in section 5.4 for classification, the guarantee of corollary 9.4 can be expressed as follows: for any $\delta > 0$ with probability at least $1 - \delta.$ for all $h \in \mathcal{H}_{K, 2} = \{(x, y) \to \mathbf{w}_{y} \cdot \Phi(x) \colon \mathbf{W} =$ $\left(\mathbf{w}_{1}, \ldots, \mathbf{w}_{k} \right)^{\top}, \sum_{l = 1}^{k} \| \mathbf{w}_{l} \|^{2} \leq \Lambda^{2}\}$ ,

$$
R(h) \leq \frac{1}{m} \sum_{i = 1}^{m} \xi_{i} + 4k \sqrt{\frac{r^{2} \Lambda^{2}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}},\tag{9.12}
$$

where $\begin{array}{r}{\xi_{i} = \operatorname{max} \left(1 -[{\bf w}_{y_{i}} \cdot \Phi(x_{i}) - \operatorname{max}_{y^{\prime} \ne y_{i}}{\bf w}_{y^{\prime}} \cdot \Phi(x_{i})], 0 \right)} \end{array}$ for all $i \in[m]$

An algorithm based on this theoretical guarantee consists of minimizing the righthand side of (9.12), that is, minimizing an objective function with a term corresponding to the sum of the slack variables $\xi_{i}$ , and another one minimizing $\| \mathbf{W} \|_{\mathbb{H}, 2}$ or equivalently $\scriptstyle \sum_{l = 1}^{k} \| \mathbf{w}_{l} \|^{2}$ . This is precisely the optimization problem defining the multi-class SVM algorithm:

$$
\begin{array}{c} \min_{\mathbf{W}, \boldsymbol{\xi}} \frac{1}{2} \sum_{l = 1}^{k} \| \mathbf{w}_{l} \|^{2} + C \sum_{i = 1}^{m} \xi_{i} \\ \text{subject to:} \forall i \in[m], \forall l \in \mathcal{Y} - \{y_{i}\}, \\ \mathbf{w}_{y_{i}} \cdot \boldsymbol{\Phi}(x_{i}) \geq \mathbf{w}_{l} \cdot \boldsymbol{\Phi}(x_{i}) + 1 - \xi_{i}, \\ \xi_{i} \geq 0.\end{array}
$$

The decision function learned is of the form $x \mapsto \operatorname{argmax}_{l \in \mathcal{Y}} \mathbf{w}_{l} \cdot \pmb{\Phi}(x)$ . As with the primal problem of SVMs, this is a convex optimization problem: the objective function is convex, since it is a sum of convex functions, and the constraints are Affine and thus qualified. The objective and constraint functions are diferentiable, and the KKT conditions hold at the optimum. Defining the Lagrangian and applying these conditions leads to the equivalent dual optimization problem, which can be expressed in terms of the kernel function K alone:

$$
\begin{array}{l} \max_{\boldsymbol{\alpha} \in \mathbb{R}^{m \times k}} \sum_{i = 1}^{m} \boldsymbol{\alpha}_{i} \cdot \mathbf{e}_{y_{i}} - \frac{1}{2} \sum_{i = 1}^{m}(\boldsymbol{\alpha}_{i} \cdot \boldsymbol{\alpha}_{j}) K(x_{i}, x_{j}) \\ \text{subject to:} \forall i \in[m],(0 \leq \alpha_{iy_{i}} \leq C) \land(\forall j \neq y_{i}, \alpha_{ij} \leq 0) \land(\boldsymbol{\alpha}_{i} \cdot \mathbf{1} = 0).\end{array}
$$

Here, $\pmb{\alpha} \in \mathbb{R}^{m \times k}$ is a matrix, $\alpha_{i}$ denotes the ith row of $\alpha,$ and $\mathbf{e}_{l}$ the lth unit vector in $\mathbb{R}^{k}, \l \in[k]$ . Both the primal and dual problems are simple QPs generalizing those of the standard SVM algorithm. However, the size of the solution and the number of constraints for both problems is in $\Omega(mk)$ , which, for a large number of classes $k,$ can make it dificult to solve. However, there exist specific optimization solutions designed for this problem based on a decomposition of the problem into m disjoint sets of constraints.

## 9.3.2 Multi-class boosting algorithms

We describe a boosting algorithm for multi-class classification called AdaBoost.MH , which in fact coincides with a special instance of AdaBoost. An alternative multiclass classification algorithm based on similar boosting ideas, AdaBoost.MR, is described and analyzed in exercise 9.4. AdaBoost.MH applies to the multi-label setting where $\mathcal{Y} = \{- 1, + 1\}^{k}$ . As in the binary case, it returns a convex combination of base classifiers selected from a hypothesis set $\mathcal{H} = \{h_{1}, \ldots, h_{N}\}$ . Let F be the following objective function defined for all samples $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m})) \in$ $({\mathfrak{X}} \times \Y)^{m}$ and $\bar{\pmb{\alpha}} =(\bar{\alpha}_{1}, \dots, \bar{\alpha}_{N}) \in \mathbb{R}^{N}, N \geq 1$ , by

$$
F(\bar{\alpha}) = \sum_{i = 1}^{m} \sum_{l = 1}^{k} e^{- y_{i}[l] f_{N}(x_{i}, l)} = \sum_{i = 1}^{m} \sum_{l = 1}^{k} e^{- y_{i}[l] \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}(x_{i}, l)},\tag{9.13}
$$

where $\begin{array}{r}{f_{N} = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$ and where $y_{i}[l]$ denotes the lth coordinate of $y_{i}$ for any $i \in[m]$ and $l \in[k]$ . F is a convex and diferentiable upper bound on the multi-class multi-label loss:

$$
\sum_{i = 1}^{m} \sum_{l = 1}^{k} 1_{y_{i}[l] \neq f_{N}(x_{i}, l)} \leq \sum_{i = 1}^{m} \sum_{l = 1}^{k} e^{- y_{i}[l] f_{N}(x_{i}, l)},\tag{9.14}
$$

since for any $x \in{\mathfrak{X}}$ with label $y = f(x)$ and any $l \in[k]$ , the inequality $1_{y[l] \neq f_{N}(x, l)} \leq$ $e^{- y[l] f_{N}(x, l)}$ holds. Using the same arguments as in section 7.2.2, we see that $\mathrm{Ad} -$ aBoost.MH coincides exactly with the application of coordinate descent to the objective function F . Figure 9.1 gives the pseudocode of the algorithm in the case where the base classifiers are functions mapping from $\mathcal{X} \times \mathcal{Y}$ to $\{- 1, + 1\}$ . The algorithm takes as input a labeled sample $S =((x_{1}, y_{1}), \ldots,(x_{m}, y_{m})) \in({\mathfrak{X}} \times{\mathfrak{Y}})^{m}$ and maintains a distribution $\mathcal{D}_{t}$ over $\{1, \ldots, m\} \times \mathcal{Y}$ . The remaining details of the

```txt
ADABOOST.MH(S = ((x1, y1), ..., (xm, ym)))
1 for i ← 1 to m do
2    for l ← 1 to k do
3    D1(i, l) ← 1/mk
4 for j ← 1 to N do
5    hj ← base classifier in H with small error εj = P(i, l) ~ Dj[hj(xi, l) ≠ yi[l]]
6    āj ← 1/2 log 1-εj/εj
7    Zt ← 2[εj(1 - εj)]½ ▷ normalization factor
8    for i ← 1 to m do
9    for l ← 1 to k do
10    Dj+1(i, l) ← Dj(i, l) exp(-barj yi[l]hj(xi, l))
11    fN ← ∑j=1N barj hj
12 return h = sgn(fN)
```

## Figure 9.1

AdaBoost.MH algorithm, for $\mathcal{H} \subseteq(\{- 1, + 1\}^{k})^{\mathcal{X} \times \mathcal{Y}}$

algorithm are similar to AdaBoost. In fact, AdaBoost.MH exactly coincides with AdaBoost applied to the training sample derived from S by splitting each labeled point $(x_{i}, y_{i})$ into k labeled examples $((x_{i}, l), y_{i}[l])$ , with each example $(x_{i}, l)$ in $\mathcal{X} \times \mathcal{Y}$ and its label in $\{- 1, + 1\}$ :

$$
(x_{i}, y_{i}) \rightarrow((x_{i}, 1), y_{i}[1]), \dots,((x_{i}, k), y_{i}[k]), i \in[m].
$$

Let $S^{\prime}$ denote the resulting sample, then $S^{\prime} =((x_{1}, 1), y_{1}[1]), \dots,(x_{m}, k), y_{m}[k]))$ $S^{\prime}$ contains mk examples and the expression of the objective function $F$ in (9.13) coincides exactly with that of the objective function of AdaBoost for the sample $S^{\prime}$ In view of this connection, the theoretical analysis along with the other observations we presented for AdaBoost in chapter $7$ also apply here. Hence, we will focus on aspects related to the computational eficiency and to the weak learning condition that are specific to the multi-class scenario.

The complexity of the algorithm is that of AdaBoost applied to a sample of size mk. For $\mathcal{X} \subseteq \mathbb{R}^{d}$ , using boosting stumps as base classifiers, the complexity of the algorithm is therefore in $O((mk) \log(mk) + mkdN)$ . Thus, for a large number of classes $k,$ the algorithm may become impractical using a single processor. The weak learning condition for the application of AdaBoost in this scenario requires that at each round there exists a base classifier $h_{j} \colon{\mathcal{X}} \times{\mathcal{Y}} \{- 1, + 1\}$ such that $\mathbb{P}_{(i, l) \sim \mathcal{D}_{j}}[h_{j}(x_{i}, l) \ \neq \y_{i}[l]] \ < \1 / 2$ . This may be hard to achieve if some classes dificult to distinguish between. It is also more dificult in this context to come up with “rules of thumb” $h_{j}$ defined over $\mathcal X \times \mathcal Y$

![Figure 9.2](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/bb45400e7fae4ec6558b8732ce36b470b34ffdeda0746f671f001cb1885ce98f.jpg)  
Figure 9.2  
Left: example of a decision tree with numerical questions based on two variables $X_{1}$ and $X_{2}$. Here, each leaf is marked with the region it defines. The class labeling for a leaf is obtained via majority vote based on the training points falling in the region it defines. Right: Partition of the two-dimensional space induced by that decision tree.

## 9.3.3 Decision trees

We present and discuss the general learning method of decision trees that can be used in multi-class classification, but also in other learning problems such as regression (chapter 11) and clustering. Although the empirical performance of decision trees often is not state-of-the-art, decision trees can be used as weak learners with boosting to define efective learning algorithms. Decision trees are also typically fast to train and evaluate and relatively easy to interpret.

Definition 9.5 (Binary decision tree) A binary decision tree is a tree representation of a partition of the feature space. Figure 9.2 shows a simple example in the case of a two-dimensional space based on two features $X_{1}$ and $X_{2}$ , as well as the partition it represents. Each interior node of a decision tree corresponds to a question related to the features. It can be a numerical question of the form $X_{i} \ \leq \a$ for a feature variable $X_{i}, ~ i \in[N]$ , and some threshold $a \in \mathbb{R}$ , as in the example of figure 9.2, or a categorical question such as $X_{i} \in \{blue$ , white, red , when feature $X_{i}$ takes a categorical value such as a color. Each leaf is labeled with a label $l \in \mathcal Y$

Decision trees can be defined using more complex node questions, resulting in partitions based on more complex decision surfaces. For example, binary space

```txt
GREEDYDECISIONTREES(S = ((x1, y1), ..., (xm, ym)))
1 tree ← {n0} ▷ root node.
2 for t ← 1 to T do
3 (nt, qt) ← argmax(n,q) F(n, q)
4 SPLIT(tree, nt, qt)
5 return tree
```

## Figure 9.3

Greedy algorithm for building a decision tree from a labeled sample S. The procedure $\mathrm{SPLIT} \big(\mathrm{tree}, \boldsymbol{n}_{t}, \boldsymbol{q}_{t} \big)$ splits node n<sub>t</sub> by making it an internal node with question q<sub>t</sub> and leaf chil dren ${\mathfrak{n}}_{-}({\mathfrak{n}},{\mathfrak{q}})$ and $n_{+}(n, q)$ , each labeled with the dominating class of the region it defines, with ties broken arbitrarily.

partition (BSP) trees partition the space with convex polyhedral regions, based on questions of the form $\textstyle \sum_{i = 1}^{n} \alpha_{i} X_{i} \leq a_{}$ , and sphere trees partition with pieces of spheres based on questions of the form $\| X - a_{0} \| \le a$ , where X is a feature vector, $a_{0}$ a fixed vector, and a is a fixed positive real number. More complex tree questions lead to richer partitions and thus hypothesis sets, which can cause overfitting in the absence of a suficiently large training sample. They also increase the computational complexity of prediction and training. Decision trees can also be generalized to branching factors greater than two, but binary trees are most commonly used due their more limited computational cost.

Prediction/partitioning: To predict the label of any point $x \in \mathcal{X}$ we start at the root node of the decision tree and go down the tree until a leaf is found, by moving to the right child of a node when the response to the node question is positive, and to the left child otherwise. When we reach a leaf, we associate x with the label of this leaf.

Thus, each leaf defines a region of X formed by the set of points corresponding exactly to the same node responses and thus the same traversal of the tree. By definition, no two regions intersect and all points belong to exactly one region. Thus, leaf regions define a partition of X, as shown in the example of figure 9.2. In multi-class classification, the label of a leaf is determined using the training sample: the class with the majority representation among the training points falling in a leaf region defines the label of that leaf, with ties broken arbitrarily.

Learning: We will discuss two different methods for learning a decision tree using a labeled sample. The first method is a greedy technique. This is motivated by the fact that the general problem of finding a decision tree with the smallest error is NP-hard. The method consists of starting with a tree reduced to a single (root) node, which is a leaf whose label is the class that has majority over the entire sample. Next, at each round, a node ${\mathsf n}_{t}$ is split based on some question $q_{t}$ . The pair $\left(n_{t}, q_{t} \right)$ is chosen so that the node impurity is maximally decreased according to some measure of impurity F . We denote by $F({\mathfrak{n}})$ the impurity of n. The decrease in node impurity after a split of node n based on question q is defined as follows. Let $n_{+}(n, q)$ denote the right child of n after the split, ${\mathsf n}_{-}({\mathsf n},{\mathsf q})$ the left child, and $\eta(n, q)$ the fraction of the points in the region defined by n that are moved to ${\mathsf n}_{-}({\mathsf n},{\mathsf q})$ . The total impurity of the leaves ${\mathsf n}_{-}({\mathsf n},{\mathsf q})$ and $n_{+}(n, q)$ is therefore $\eta(n, q) F(n_{-}(n, q)) +(1 - \eta(n, q)) F(n_{+}(n, q))$ . Thus, the decrease in impurity $\widetilde{\cal F}(n,q)$ by that split is given by

$$
\widetilde{F}(n, q) = F(n) -[\eta(n, q) F(n_{-}(n, q)) +(1 - \eta(n, q)) F(n_{+}(n, q))].
$$

Figure 9.3 shows the pseudocode of this greedy construction based on $\widetilde{F}.$ . In practice, the algorithm is stopped once all nodes have reached a sufficient level of purity, when the number of points per leaf has become too small for further splitting or based on some other similar heuristic.

For any node n and class $l \in[k]$ , let $p_{l}(n)$ denote the fraction of points at n that belong to class l. Then, the three most commonly used measures of node impurity $F$ are defined as follows:

$$
F(\mathfrak{n}) = \left\{\begin{array}{ll} 1 - \max_{l \in[k]} p_{l}(\mathfrak{n}) & misclassification; \\ - \sum_{l = 1}^{k} p_{l}(\mathfrak{n}) \log_{2} p_{l}(\mathfrak{n}) & entropy; \\ \sum_{l = 1}^{k} p_{l}(\mathfrak{n})(1 - p_{l}(\mathfrak{n})) & Giniindex.\end{array} \right.
$$

Figure 9.4 illustrates these definitions in the special cases of two classes $\left(k = 2 \right)$ . The entropy and Gini index impurity functions are upper bounds on the misclassification impurity function. All three functions are concave, which ensures that

$$
F(n) -[\eta(n, q) F(n_{-}(n, q)) +(1 - \eta(n, q)) F(n_{+}(n, q))] \geq 0.
$$

However, the misclassification function is piecewise linear, so $\widetilde{\cal F}(n,q)$ is zero if the fraction of positive points remains less than (or more than) half after a split. In some cases, the impurity cannot be decreased by any split using that criterion. In contrast, the entropy and Gini functions are strictly concave, which guarantees a strict decrease in impurity. Furthermore, they are diferentiable which is a useful feature for numerical optimization. Thus, the Gini index and the entropy criteria are typically preferred in practice.

The greedy method just described faces some issues. One issue relates to the greedy nature of the algorithm: a seemingly bad split may dominate subsequent useful splits, which could lead to trees with less impurity overall. This can be addressed to a certain extent by using a look-ahead of some depth d to determine the splitting decisions, but such look-aheads can be computationally very costly. Another issue relates to the size of the resulting tree. To achieve some desired level of impurity, trees of relatively large sizes may be needed. However, larger trees define overly complex hypotheses with high VC-dimensions (see exercise 9.5) and thus could overfit.

![Figure 9.4](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/1ad4cf5606b392e17151615990e2b957eda8f7606d7dd03cf2fab8b6808b363c.jpg)  
Figure 9.4  
Three node impurity definitions plotted as a function of the fraction of positive examples in the binary case: misclassification, entropy (scaled by 0.5 to set the maximum to the same value for all three functions), and the Gini index.

An alternative method for learning decision trees using a labeled training sample is based on the so-called grow-then-prune strategy. First a very large tree is grown until it fully fits the training sample or until no more than a very small number of points are left at each leaf. Then, the resulting tree, denoted as tree, is pruned back to minimize an objective function defined (based on generalization bounds) as the sum of an empirical error and a complexity term. The complexity can be expressed in terms of the size of tree, the set of leaves of tree. The resulting objective is

$$
G_{\lambda}(\text{tree}) = \sum_{\widetilde{n \in \text{tree}}} | n | F(n) + \lambda | \widetilde{\text{tree}} |,\tag{9.15}
$$

where $\lambda \geq 0$ is a regularization parameter determining the trade-of between misclassification, or more generally impurity, versus tree complexity. For any tree tree0, we denote by $\widehat{R}(\mathsf{tree}^{\prime})$ the total empirical error $\scriptstyle \sum_{\mathfrak{n} \in \widetilde{\mathfrak{tree}}^{\prime}} | \mathfrak{n} | F(\mathfrak{n})$ . We seek a sub-tree tree of tree that minimizes $G_{\lambda}$ and that has the smallest size. $\mathtt{tree}_{\lambda}$ can be shown to be unique. To determine tree $: \lambda :$ , the following pruning method is used, which defines a finite sequence of nested sub-trees $\mathsf{tree}^{(0)}, \ldots, \mathsf{tree}^{(n)}$ . We start with the full tree $\mathsf{tree}^{(0)} = \mathsf{tree}$ and for any $i \in \{0, \ldots, n - 1\}$ , define $\mathrm{tree}^{(i + 1)}$ from $\mathrm{tree}^{(i)}$ by collapsing an internal node ${\mathsf n}^{\prime}$ of $\mathrm{tree}^{(i)}$ , that is by replacing the sub-tree rooted at ${\mathsf n}^{\prime}$ with a leaf, or equivalently by combining the regions of all the leaves dominated by ${\mathsf n}^{\prime}, \mathsf n^{\prime}$ is chosen so that collapsing it causes the smallest per node increase in $\hat{R}({\sf tree}^{(i)})$ , that is the smallest $r(\mathrm{tree}^{(i)}, n^{\prime})$ defined by

$$
r(\mathsf{tree}^{(i)}, n^{\prime}) = \frac{| n^{\prime} | F(n^{\prime}) - \widehat{R}(\mathsf{tree}^{\prime})}{| \widetilde{\mathsf{tree}}^{\prime} | - 1},
$$

where ${\mathsf n}^{\prime}$ is an internal node of $\mathrm{tree}^{(i)}$ . If several nodes ${\mathsf n}^{\prime}$ in $\mathrm{tree}^{(i)}$ cause the same smallest increase per node $r(\mathrm{tree}^{(i)}, n^{\prime})$ , then all of them are pruned to define $\mathrm{tree}^{(i + 1)}$ from $\mathrm{tree}^{(i)}$ . This procedure continues until the tree tree<sup>(n)</sup> obtained has a single node. The sub-tree tree can be shown to be among the elements of the sequence $\mathsf{tree}^{(0)}, \ldots, \mathsf{tree}^{(n)}$ . The parameter λ is determined via n-fold crossvalidation.

Decision trees seem relatively easy to interpret, and this is often underlined as one of their most useful features. However, such interpretations should be carried out with care since decision trees are unstable: small changes in the training data may lead to very different splits and thus entirely different trees, as a result of their hierarchical nature. Decision trees can also be used in a natural manner to deal with the problem of missing features, which often appears in learning applications; in practice, some features values may be missing because the proper measurements were not taken or because of some noise source causing their systematic absence. In such cases, only those variables available at a node can be used in prediction. Finally, decision trees can be used and learned from data in a similar way in the regression setting (see chapter 11).<sup>14</sup>

## 9.4 Aggregated multi-class algorithms

In this section, we discuss a different approach to multi-class classification that reduces the problem to that of multiple binary classification tasks. A binary classification algorithm is then trained for each of these tasks independently, and the multi-class predictor is defined as a combination of the hypotheses returned by each of these algorithms. We first discuss two standard techniques for the reduction of multi-class classification to binary classification, and then show that they are both special instances of a more general framework.

## 9.4.1 One-versus-all

Let $S =((x_{1}, y_{1}), \dots, x_{m}, y_{m})) \in(\mathcal{X} \times \mathcal{Y})^{m}$ be a labeled training sample. A straightforward reduction of the multi-class classification to binary classification is based on the so-called one-versus-all (OVA) or one-versus-the-rest technique. This technique consists of learning k binary classifiers $h_{l} \colon \mathcal{X} \{- 1, + 1\}, l \in \mathcal{Y}$ , each seeking to discriminate one class $l \in \mathcal Y$ from all the others. For any $l \in \mathcal{Y}, h_{l}$ is obtained by training a binary classification algorithm on the full sample S after relabeling points in class l with 1 and all others with 1. For $l \in \mathcal Y$ , assume that $h_{l}$ is derived from the sign of a scoring function $f_{l} \colon \mathcal{X} \mathbb{R}$ , that is $h_{l} = \operatorname{sgn}(f_{l})$ , as in the case of many of the binary classification algorithms discussed in the previous chapters. Then, the multi-class hypothesis $h \colon \mathcal{X} \mathcal{Y}$ defined by the OVA technique is given by:

$$
\forall x \in \mathcal{X}, \quad h(x) = \underset{l \in \mathcal{Y}}{\operatorname{argmax}} f_{l}(x).\tag{9.16}
$$

This formula may seem similar to those defining a multi-class classification hypothesis in the case of uncombined algorithms. Note, however, that for uncombined algorithms the functions $f_{l}$ are learned together, while here they are learned independently. Formula (9.16) is well-founded when the scores given by functions $f_{l}$ can be interpreted as confidence scores, that is when $f_{l}(x)$ is learned as an estimate of the probability of x conditioned on class l. However, in general, the scores given by functions $f_{l}, l \in \mathcal{Y}$ , are not comparable and the OVA technique based on (9.16) admits no principled justification. This is sometimes referred to as a calibration problem. Clearly, this problem cannot be corrected by simply normalizing the scores of each function to make their magnitudes uniform, or by applying other similar heuristics. When it is justifiable, the OVA technique is simple and its computational cost is k times that of training a binary classification algorithm, which is similar to the computation costs for many uncombined algorithms.

## 9.4.2 One-versus-one

An alternative technique, known as the one-versus-one $(OVO)$ technique, consists of using the training data to learn (independently), for each pair of distinct classes $(l, l^{\prime}) \in \mathbb{Y}^{2}, \l \neq l^{\prime}$ , a binary classifier $h_{ll^{\prime}} \colon \mathcal{X} \{- 1, 1\}$ discriminating between classes l and $l^{\prime}.$ . For any $(l, l^{\prime}) \in \mathcal{Y}^{2}$ , $h_{ll^{\prime}}$ is obtained by training a binary classification algorithm on the sub-sample containing exactly the points labeled with l or $l^{\prime},$ with the value +1 returned for class $l^{\prime}$ and 1 for class l. This requires training $\binom{k}{2} = k(k - 1) / 2$ classifiers, which are combined to define a multi-class classification hypothesis h via majority vote:

$$
\forall x \in \mathcal{X}, \quad h(x) = \underset{l^{\prime} \in \mathcal{Y}}{\operatorname{argmax}} \left| \left\{l \colon h_{ll^{\prime}}(x) = 1 \right\} \right|.\tag{9.17}
$$

## Table 9.1

Comparison of the time complexity the OVA and OVO techniques for both training and testing. The table assumes a full training sample of size m with each class represented by $m / k$ points. The time for training a binary classification algorithm on a sample of size n is assumed to be in $O(n^{\alpha})$ . Thus, the training time for the OVO technique is in ${\bar{O}}(k^{2}(m / k)^{\alpha}) = O(k^{2 - \alpha} m^{\alpha})$ . c<sub>t</sub> denotes the cost of testing a single classifier.

<table><tr><td></td><td>Training</td><td>Testing</td></tr><tr><td>OVA</td><td> $O(km^{\alpha})$ </td><td> $O(kc_{t})$ </td></tr><tr><td>OVO</td><td> $O(k^{2-\alpha}m^{\alpha})$ </td><td> $O(k^{2}c_{t})$ </td></tr></table>

Thus, for a fixed point $x \in \mathcal{X}$ , if we describe the prediction values $h_{ll^{\prime}}(x)$ as the results of the matches in a tournament between two players l and l0, with $h_{ll^{\prime}}(x) = 1$ indicating l0 winning over l, then the class predicted by h can be interpreted as the one with the largest number of wins in that tournament.

Let $x \in{\mathfrak{X}}$ be a point belonging to class l0. By definition of the OVO technique, if $h_{ll^{\prime}}(x) = 1$ for all ${\mathit{l}} \neq{\mathit{l}}^{\prime}$ , then the class associated to x by OVO is the correct class l0 since $\left| \{l \colon h_{ll^{\prime}}(x) = 1\} \right| = k - 1$ and no other class can reach $\left(k - 1 \right)$ wins. By contraposition, if the OVO hypothesis misclassifies x, then at least one of the $\left(k - 1 \right)$ binary classifiers $h_{ll^{\prime}}, l \neq l^{\prime}$ , incorrectly classifies x. Assume that the generalization error of all binary classifiers $h_{ll^{\prime}}$ used by OVO is at most r, then, in view of this discussion, the generalization error of the hypothesis returned by OVO is at most $(k - 1) r$

The OVO technique is not subject to the calibration problem pointed out in the case of the OVA technique. However, when the size of the sub-sample containing members of the classes l and l0 is relatively small, $h_{ll^{\prime}}$ may be learned without sufficient data or with increased risk of overfitting. Another concern often raised for the use of this technique is the computational cost of training $k(k - 1) / 2$ binary classifiers versus that of the OVA technique.

Taking a closer look at the computational requirements of these two methods reveals, however, that the disparity may not be so great and that in fact under some assumptions the time complexity of training for OVO could be less than that of OVA. Table 9.1 compares the computational complexity of these methods both for training and testing assuming that the complexity of training a binary classifier on a sample of size m is in $O(m^{\alpha})$ and that each class is equally represented in the training set, that is by $m / k$ points. Under these assumptions, if $\alpha \in[2, 3)$ as in the case of some algorithms solving a QP problem, such as SVMs, then the time complexity of training for the OVO technique is in fact more favorable than that of OVA. For $\alpha = 1$ , the two are comparable and it is only for sub-linear algorithms that the OVA technique would benefit from a better complexity. In all cases, at test time, OVO requires $k(k - 1) / 2$ classifier evaluations, which is (k 1)

times more than OVA. However, for some algorithms the evaluation time for each classifier could be much smaller for OVO. For example, in the case of SVMs, the average number of support vectors may be significantly smaller for OVO, since each classifier is trained on a significantly smaller sample. If the number of support vectors is k times smaller and if sparse feature representations are used, then the time complexities of both techniques for testing are comparable.

## 9.4.3 Error-correcting output codes

A more general method for the reduction of multi-class to binary classification is based on the idea of error-correcting output codes $(ECOC)$ . This technique consists of assigning to each class $l \in \mathcal Y$ a code word of length $c \geq 1$ , which in the simplest case is a binary vector $\mathbf{M}_{l} \ \in \ \{- 1, + 1\}^{c}.\quad \mathbf{M}_{l}$ serves as a signature for class $l,$ and together these vectors define a matrix $\mathbf{M} \in \{- 1, + 1\}^{k \times c}$ whose lth row is $\mathbf{M}_{l}.$ , as illustrated by figure 9.5. Next, for each column $j \in[c]$ , a binary classifier $h_{j} \colon \mathcal{X} \{- 1, + 1\}$ is learned using the full training sample $S,$ after all points that belong to a class represented by +1 in column $j$ are labeled with $+ 1$ , while all other points are labeled with 1. For any $x \in{\mathcal{X}}$ , let $\mathbf{h}(x)$ denote the vector $\mathbf{h}(x) =(h_{1}(x), \ldots, h_{c}(x))^{\top}$ . Then, the multi-class hypothesis $h \colon \mathcal{X} \mathcal{Y}$ is defined by

$$
\forall x \in \mathcal{X}, \quad h(x) = \underset{l \in \mathcal{Y}}{\operatorname{argmin}} d_{H} \big(\mathbf{M}_{l}, \mathbf{h}(x) \big).\tag{9.18}
$$

Thus, the class predicted is the one whose signatures is the closest to $\mathbf{h}(x)$ in Hamming distance. Figure 9.5 illustrates this definition: no row of matrix M matches the vector of predictions $\mathbf{h}(x)$ in that case, but the third row shares the largest number of components with $\mathbf{h}(x)$

The success of the ECOC technique depends on the minimal Hamming distance between the class code words. Let d denote that distance, then up to $\begin{array}{r}{r_{0} = \left\lfloor \frac{d - 1}{2} \right\rfloor} \end{array}$ binary classification errors can be corrected by this technique: by definition of $d,$ even if $r \ < \r_{0}$ binary classifiers $h_{l}$ misclassify $x \in \mathcal{X}, \ \mathbf{h}(x)$ is closest to the code word of the correct class of x. For a fixed $c,$ the design of error-correction matrix M is subject to a trade-of, since larger d values may imply substantially more dificult binary classification tasks. In practice, each column may correspond to a class feature determined based on domain knowledge.

The ECOC technique just described can be extended in two ways. First, instead of using only the label predicted by each classifier $h_{j}$ the magnitude of the scores defining $h_{j}$ is used. Thus, if $h_{j} = \operatorname{sgn}(f_{j})$ for some function $f_{j}$ whose values can be interpreted as confidence scores, then the multi-class hypothesis $h \colon \mathcal{X} \mathcal{Y}$ is

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/2a8ed30a913282725737600ba9dcb9b8259d2c3d51535f3a96dfb9892fb54c1e.jpg)  
Figure 9.5

Illustration of error-correcting output codes for multi-class classification. Left: binary code matrix M, with each row representing the code word of length $c = 6$ of a class $l \in[8]$ . Right: vector of predictions h(x) for a test point x. The ECOC classifier assigns label 3 to x, since the binary code for the third class yields the minimal Hamming distance with h(x) (distance of 1).

defined by

$$
\forall x \in \mathcal{X}, \quad h(x) = \underset{l \in \mathcal{Y}}{\operatorname{argmin}} \sum_{j = 1}^{c} L(m_{lj} f_{j}(x)),\tag{9.19}
$$

where $(m_{lj})$ are the entries of M and where $L \colon \mathbb{R} \to \mathbb{R}_{+}$ is a loss function. When L is defined by $\begin{array}{r}{L(x) = \frac{1 - \mathrm{sgn}(x)}{2}} \end{array}$ for all $x \in{\mathcal{X}}$ and $h_{l} = f_{l}$ , we can write:

$$
\sum_{j = 1}^{c} L(m_{lj} f_{j}(x)) = \sum_{j = 1}^{c} \frac{1 - \operatorname{sgn}(m_{lj} h_{j}(x))}{2} = d_{h}(\mathbf{M}_{l}, \mathbf{h}(x)),
$$

and (9.19) coincides with (9.18). Furthermore, ternary codes can be used with matrix entries in $\{- 1, 0, + 1\}$ so that examples in classes labeled with 0 are disregarded when training a binary classifier for each column. With these extensions, both OVA and OVO become special instances of the ECOC technique. The matrix M for OVA is a square matrix, that is $c = k.$ , with all terms equal to 1 except from the diagonal ones which are all equal to +1. The matrix M for OVO has $c = k(k - 1) / 2$ columns. Each column corresponds to a pair of distinct classes $(l, l^{\prime}), l \neq l^{\prime}$ , with all entries equal to 0 except from the one with row $l,$ which is 1, and the one with row $l^{\prime}.$ , which is +1.

Since the values of the scoring functions are assumed to be confidence scores, ${m}_{lj} f_{j}(x)$ can be interpreted as the margin of classifier $j$ on point x and (9.19) is thus based on some loss $L$ defined with respect to the binary classifier’s margin.

A further extension of ECOC consists of extending discrete codes to continuous ones by letting the matrix entries take arbitrary real values and by using the training sample to learn matrix M. Starting with a discrete version of M, c binary classifiers with scoring functions $f_{l}, l \in[c]$ , are first learned as described previously. We will denote by $\mathbf{F}(x)$ the vector $(f_{1}(x), \ldots, f_{c}(x))^{\top}$ for any $x \in{\mathcal{X}}$ . Next, the entries of M are relaxed to take real values and learned from the training sample with the objective of making the row of M corresponding to the class of any point $x \in \mathscr{X}$ more similar to $\mathbf{F}(x)$ than other rows. The similarity can be measured using any PDS kernel K. An example of an algorithm for learning M using a PDS kernel K and the idea just discussed is in fact multi-class SVMs, which, in this context, can be formulated as follows:

$$
\min_{\mathbf{M}, \boldsymbol{\xi}} \| \mathbf{M} \|_{F}^{2} + C \sum_{i = 1}^{m} \xi_{i}
$$

subject to: $\forall(i, l) \in[m] \times \mathcal{Y}$ ,

$$
K(\mathbf{f}(x_{i}), \mathbf{M}_{y_{i}}) \geq K(\mathbf{f}(x_{i}), \mathbf{M}_{l}) + 1 - \xi_{i}.
$$

Similar algorithms can be defined using other matrix norms. The resulting multiclass classification decision function has the following form:

$$
h \colon x \mapsto \operatorname{argmax}_{l \in \{1, \ldots, k\}} K(\mathbf{f}(x), \mathbf{M}_{l}).
$$

## 9.5 Structured prediction algorithms

In this section, we briefly discuss an important class of problems related to multiclass classification that frequently arises in computer vision, computational biology, and natural language processing. These include all sequence labeling problems and complex problems such as parsing, machine translation, and speech recognition.

In these applications, the output labels have a rich internal structure. For example, in part-of-speech tagging the problem consists of assigning a part-of-speech tag such as N (noun), V (verb), or A (adjective), to every word of a sentence. Thus, the label of the sentence $\omega_{1} \ldots.\omega_{n}$ made of the words $\omega_{i}$ is a sequence of part-of-speech tags $t_{1} \ldots t_{n}$ . This can be viewed as a multi-class classification problem where each sequence of tags is a possible label. However, several critical aspects common to such structured output problems make them distinct from the standard multi-class classification.

First, the label set is exponentially large as a function of the size of the output. For example, if Σ denotes the alphabet of part-of-speech tags, for a sentence of length n there are $| \Sigma |^{n}$ possible tag sequences. Second, there are dependencies between the substructures of a label that are important to take into account for an accurate prediction. For example, in part-of-speech tagging, some tag sequences may be ungrammatical or unlikely. Finally, the loss function used is typically not a zero-one loss, but one that depends on the substructures. Let $L \colon \mathcal{Y} \times \mathcal{Y} \mathbb{R}$ denote a loss function such that $L(y^{\prime}, y)$ measures the penalty of predicting the label $y^{\prime} \in \mathcal{Y}$ instead of the correct label $y \in \mathcal{Y}.^{15}$ In part-of-speech tagging, $L(y^{\prime}, y)$ could be for example the Hamming distance between $y^{\prime}$ and $y.$ .

The relevant features in structured output problems often depend on both the input and the output. Thus, we will denote by $\pmb{\Phi}(x, y) \in \mathbb{R}^{N}$ the feature vector associated to a pair $(x, y) \in \mathcal{X} \times \mathcal{Y}$

To model the label structures and their dependency, the label set Y is typically assumed to be endowed with a graphical model structure, that is, a graph giving a probabilistic model of the conditional dependence between the substructures. It is also assumed that both the feature vector $\Phi(x, y)$ associated to an input $x \in{\mathfrak{X}}$ and output $y \in \mathcal{Y}$ and the loss $L(y^{\prime}, y)$ factorize according to the cliques of that graphical model. $^{16} \mathrm{~ A ~}$ detailed treatment of this topic would require a further background in graphical models, and is thus beyond the scope of this section.

The hypothesis set used by most structured prediction algorithms is then defined as the set of functions $h \colon \mathcal{X} \mathcal{Y}$ such that

$$
\forall x \in \mathcal{X}, \quad h(x) = \underset{y \in \mathcal{Y}}{\operatorname{argmax}} \mathbf{w} \cdot \boldsymbol{\Phi}(x, y),\tag{9.20}
$$

for some vector $\mathbf{w} \in \mathbb{R}^{N}$ . Let $S =((x_{1}, y_{1}), \ldots, x_{m}, y_{m})) \in({\mathfrak{X}} \times{\mathfrak{Y}})^{m}$ be an i.i.d. labeled sample. Since the hypothesis set is linear, we can seek to define an algorithm similar to multi-class SVMs. The optimization problem for multi-class SVMs can be rewritten equivalently as follows:

$$
\min_{\mathbf{w}} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \max_{y \neq y_{i}} \max \left(0, 1 - \mathbf{w} \cdot[\boldsymbol{\Phi}(x_{i}, y_{i}) - \boldsymbol{\Phi}(x_{i}, y)]\right),\tag{9.21}
$$

However, here we need to take into account the loss function L, that is $L(y, y_{i})$ for each $i \in[m]$ and $y \in \mathcal{Y}$ , and there are multiple ways to proceed. One possible way is to let the margin violation be penalized additively with $L(y, y_{i})$ . Thus, in that case $L(y, y_{i})$ is added to the margin violation. Another natural method consists of penalizing the margin violation by multiplying it with $L(y, y_{i})$ . A margin violation with a larger loss is then penalized more than one with a smaller loss.

The additive penalization leads to the following algorithm known as Maximum Margin Markov Networks $(M^{3} N)$

$$
\min_{\mathbf{w}} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \max_{y \neq y_{i}} \max \left(0, L(y_{i}, y) - \mathbf{w} \cdot[\boldsymbol{\Phi}(x_{i}, y_{i}) - \boldsymbol{\Phi}(x_{i}, y)]\right).\tag{9.22}
$$

An advantage of this algorithm is that, as in the case of SVMs, it admits a natural use of PDS kernels. As already indicated, the label set Y is assumed to be endowed with a graph structure with a Markov property, typically a chain or a tree, and the loss function is assumed to be decomposable in the same way. Under these assumptions, by exploiting the graphical model structure of the labels, a polynomial-time algorithm can be given to determine its solution.

A multiplicative combination of the loss with the margin leads to the following algorithm known as SVMStruct:

$$
\min_{\mathbf{w}} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \max_{y \neq y_{i}} L(y_{i}, y) \max \Big(0, 1 - \mathbf{w} \cdot[\boldsymbol{\Phi}(x_{i}, y_{i}) - \boldsymbol{\Phi}(x_{i}, y)] \Big).\tag{9.23}
$$

This problem can be equivalently written as a QP with an infinite number of constraints. In practice, it is solved iteratively by augmenting at each round the finite set of constraints of the previous round with the most violating constraint. This method can be applied in fact under very general assumptions and for arbitrary loss definitions. As in the case of $\mathrm{M^{3} N}$ , SVMStruct naturally admits the use of PDS kernels and thus an extension to non-linear models for the solution.

Another standard algorithm for structured prediction problems is Conditional Random Fields (CRFs). We will not describe this algorithm in detail, but point out its similarity with the algorithms just described, in particular $\mathrm{M^{3} N}$ . The optimization problem for CRFs can be written as

$$
\min_{\mathbf{w}} \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \log \sum_{y \in \mathcal{Y}} \exp \Big(L(y_{i}, y) - \mathbf{w} \cdot[\boldsymbol{\Phi}(x_{i}, y_{i}) - \boldsymbol{\Phi}(x_{i}, y)] \Big).\tag{9.24}
$$

Assume for simplicity that Y is finite and has cardinality k and let f denote the function $(x_{1}, \dots, x_{k}) \mapsto \log(\sum_{j = 1}^{k} e^{x_{j}})$ . f is a convex function known as the softmax, since it provides a smooth approximation of $(x_{1}, \dots, x_{k}) \mapsto \operatorname{max}(x_{1}, \dots, x_{k})$ Then, problem (9.24) is similar to (9.22) modulo the replacement of the max operator with the soft-max function just described.

## 9.6 Chapter notes

The margin-based generalization bound for multi-class classification presented in theorem 9.2 is due to Kuznetsov, Mohri, and Syed [2014]. It admits only a linear dependency on the number of classes. This improves over a similar result by Koltchinskii and Panchenko [2002], which admits a quadratic dependency on the number of classes. Proposition 9.3 bounding the Rademacher complexity of multiclass kernel-based hypotheses and corollary 9.4 are new.

An algorithm generalizing SVMs to the multi-class classification setting was first introduced by Weston and Watkins [1999]. The optimization problem for that algorithm was based on $k(k - 1) / 2$ slack variables for a problem with k classes and thus could be ineficient for a relatively large number of classes. A simplification of that algorithm by replacing the sum of the slack variables $\textstyle \sum_{j \neq i} \xi_{ij}$ related to point $x_{i}$ by its maximum $\xi_{i} = \operatorname{max}_{j \neq i} \xi_{ij}$ considerably reduces the number of variables and leads to the multi-class SVM algorithm presented in this chapter [Crammer and Singer, 2001, 2002].

The AdaBoost.MH algorithm is presented and discussed by Schapire and Singer [1999, 2000]. As we showed in this chapter, the algorithm is a special instance of AdaBoost. Another boosting-type algorithm for multi-class classification, AdaBoost.MR, is presented by Schapire and Singer [1999, 2000]. That algorithm is also a special instance of the RankBoost algorithm presented in chapter 10. See exercise 10.5 for a detailed analysis of this algorithm, including generalization bounds.

The most commonly used tools for learning decision trees are CART (classification and regression tree) [Breiman et al., 1984] and C4.5 [Quinlan, 1986, 1993]. The greedy technique we described for learning decision trees benefits in fact from an interesting analysis: remarkably, it has been shown by Kearns and Mansour [1999], Mansour and McAllester [1999] that, under a weak learner hypothesis assumption, such decision tree algorithms produce a strong hypothesis. The grow-then-prune method is from CART. It has been analyzed by a variety of different studies, in particular by Kearns and Mansour [1998] and Mansour and McAllester [2000], who give generalization bounds for the resulting decision trees with respect to the error and size of the best sub-tree of the original tree pruned. Hardness of ERM for decision trees of a fixed size was shown by Grigni et al. [2000].

The idea of the ECOC framework for multi-class classification is due to Dietterich and Bakiri [1995]. Allwein et al. [2000] further extended and analyzed this method to margin-based losses, for which they presented a bound on the empirical error and a generalization bound in the more specific case of boosting. While the OVA technique is in general subject to a calibration issue and does not have any justification, it is very commonly used in practice. Rifkin [2002] reports the results of extensive experiments with several multi-class classification algorithms that are rather favorable to the OVA technique, with performances often very close or better than for those of several uncombined algorithms, unlike what has been claimed by some authors (see also Rifkin and Klautau [2004]).

The CRFs algorithm was introduced by Laferty, McCallum, and Pereira [2001]. $\mathrm{M^{3} N}$ is due to Taskar, Guestrin, and Koller [2003] and StructSVM was presented by Tsochantaridis, Joachims, Hofmann, and Altun [2005]. An alternative technique for tackling structured prediction as a regression problem was presented and analyzed by Cortes, Mohri, and Weston [2007c].

## 9.7 Exercises

9.1 Generalization bounds for multi-label case. Use similar techniques to those used in the proof of theorem 9.2 to derive a margin-based learning bound in the multi-label case.

9.2 Multi-class classification with kernel-based hypotheses constrained by an $L_{p}$ norm. Use corollary 9.4 to define alternative multi-class classification algorithms with kernel-based hypotheses constrained by an $L_{p}$ norm with $p \neq 2$ . For which value of $p \geq 1$ is the bound of proposition 9.3 tightest? Derive the dual optimization of the multi-class classification algorithm defined with $p = \infty$

9.3 Alternative multi-class boosting algorithm. Consider the objective function G defined for any sample $S =((x_{1}, y_{1}), \ldots,(x_{m}, y_{m})) \in({\mathfrak{X}} \times{\mathfrak{Y}})^{m}$ and $\alpha =$ $(\alpha_{1}, \ldots, \alpha_{n}) \in \mathbb{R}^{n}, n \geq 1$ , by

$$
G(\boldsymbol{\alpha}) = \sum_{i = 1}^{m} e^{- \frac{1}{k} \sum_{l = 1}^{k} y_{i}[l] f_{n}(x_{i}, l)} = \sum_{i = 1}^{m} e^{- \frac{1}{k} \sum_{l = 1}^{k} y_{i}[l] \sum_{t = 1}^{n} \alpha_{t} h_{t}(x_{i}, l)}.\tag{9.25}
$$

Use the convexity of the exponential function to compare G with the objective function F defining AdaBoost.MH. Show that G is a convex function upper bounding the multi-label multi-class error. Discuss the properties of G and derive an algorithm defined by the application of coordinate descent to G. Give theoretical guarantees for the performance of the algorithm and analyze its running-time complexity when using boosting stumps.

9.4 Multi-class algorithm based on RankBoost. This problem requires familiarity with the material presented both in this chapter and in chapter 10. An alternative boosting-type multi-class classification algorithm is one based on a ranking criterion. We will define and examine that algorithm in the mono-label setting. Let H be a family of base hypotheses mapping X Y to 1, +1 . Let F be the following objective function defined for all samples $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m})) \in$ $(\mathcal{X} \times \mathcal{Y})^{m}$ and $\bar{\pmb{\alpha}} =(\bar{\alpha}_{1}, \dots, \bar{\alpha}_{N}) \in \mathbb{R}^{N}, N \geq 1$ , by

$$
F(\bar{\alpha}) = \sum_{i = 1}^{m} \sum_{l \neq y_{i}} e^{-(f_{N}(x_{i}, y_{i}) - f_{N}(x_{i}, l))} = \sum_{i = 1}^{m} \sum_{l \neq y_{i}} e^{- \sum_{j = 1}^{N} \bar{\alpha}_{j}(h_{j}(x_{i}, y_{i}) - h_{j}(x_{i}, l))}.
$$

where $\begin{array}{r}{f_{N} = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$

(9.26)

(a) Show that F is convex and diferentiable.

(b) Show that $\begin{array}{r}{\frac{1}{m} \sum_{i = 1}^{m} 1_{\rho_{f_{N}}(x_{i}, y_{i})} \leq \frac{1}{k - 1} F(\bar{\alpha})} \end{array}$ , where $\begin{array}{r}{f_{N} = \sum_{j = 1}^{N} \bar{\alpha}_{j} h_{j}} \end{array}$

(c) Give the pseudocode of the algorithm obtained by applying coordinate descent to F . The resulting algorithm is known as AdaBoost.MR. Show that AdaBoost.MR exactly coincides with the RankBoost algorithm applied to the problem of ranking pairs $(x, y) \in{\mathcal{X}} \times{\mathcal{Y}}$ . Describe exactly the ranking target for these pairs.

(d) Use question (9.4b) and the learning bounds of this chapter to derive marginbased generalization bounds for this algorithm.

(e) Use the connection of the algorithm with RankBoost and the learning bounds of chapter 10 to derive alternative generalization bounds for this algorithm. Compare these bounds with those of the previous question.

9.5 Decision trees. Show that VC-dimension of a binary decision tree with n nodes in dimension N is in O(n log N).

9.6 Give an example where the generalization error of each of the $k(k - 1) / 2$ binary classifiers $h_{ll^{\prime}}, l \neq l^{\prime}$ , used in the definition of the OVO technique is $r$ and that of the OVO hypothesis $(k - 1) r$


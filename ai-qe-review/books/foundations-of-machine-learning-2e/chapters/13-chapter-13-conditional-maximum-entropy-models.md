---
title: "Chapter 13 \u2014 Conditional Maximum Entropy Models"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 13
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 7975
source_line_end: 8401
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 1
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 4
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 13 — Conditional Maximum Entropy Models

> [[../README|本书目录]] · [[12-chapter-12-maximum-entropy-models|上一章]] · [[14-chapter-14-algorithmic-stability|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 7975–8401。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 4；Affine × 1；different × 4；efficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 13.1 Learning problem

We consider a multi-class classification problem with c classes, $c \geq 1$ . Let $\y =$ $\{1, \ldots, c\}$ denote the output space and D a distribution over $\mathcal X \times \mathcal Y$ . The learner receives a labeled training sample $S =((x_{1}, y_{1}), \ldots,(x_{m}, y_{m})) \in({\mathfrak{X}} \times{\mathfrak{Y}})^{m}$ drawn i.i.d. according to D. As in Chapter 12, we assume that, additionally, the learner has access to a feature mapping $\Phi \colon \mathcal{X} \times \mathcal{Y} \to \mathbb{R}^{N}$ with $\mathbb{R}^{N}$ a normed vector space and with $\| \Phi \|_{\infty} \leq r$ . We will denote by H a family of real-valued functions containing the component feature functions $\Phi_{j}$ with $j \in[N]$ . Note that in the most general case, we may have $N = + \infty$ . The problem consists of using the training sample S to learn an accurate conditional probability $p[\cdot | x]$ , for any $x \in{\mathfrak{X}}$

## 13.2 Conditional Maxent principle

As for Maxent models, conditional Maxent or logistic regression models can be derived from a key concentration inequality. By the general Rademacher complexity bound (Theorem 3.3), for any $\delta > 0$ , the following inequality holds with probability at least $1 - \delta$ over the choice of a sample of size m:

$$
\left\| \underset{(x, y) \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x, y)] - \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x, y)] \right\|_{\infty} \leq 2 \Re_{m}(\mathcal{H}) + \sqrt{\frac{\log \frac{2}{\delta}}{2m}},\tag{13.1}
$$

where we denote by $\widehat{\Phi}$ the empirical distribution defined by the sample $S.$ . We will also denote by $\widehat{\mathbb{D}}^{1}(x)$ the empirical distribution of x in the sample S. For any $x \in{\mathcal{X}}$ , let $p_{0}[\cdot | x]$ denote a conditional probability, often chosen to be the uniform distribution. Then, the conditional Maxent principle consists of seeking conditional probabilities $p[\cdot | x]$ that are as agnostic as possible, that is as close as possible to the uniform distribution, or, more generally, to priors $p_{0}[\cdot | x]$ ], while verifying an inequality similar to (13.1):

$$
\left\| \underset{\begin{array}{c} x \sim \widehat{\mathcal{D}}^{1} \\ y \sim p[\cdot | x] \end{array}}{\mathbb{E}} \left[\Phi(x, y) \right] - \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\Phi(x, y) \right] \right\|_{\infty} \leq \lambda,\tag{13.2}
$$

where $\lambda \geq 0$ is a parameter. Here, closeness is defined via the conditional relative entropy (appendix E) based on the empirical marginal distribution $\widehat{\mathbb{D}}^{1}$ of input points. Choosing $\lambda = 0$ corresponds to standard conditional Maxent or unregularized conditional Maxent and to requiring the expectation of the features based on $\mathrm{\mathcal{D}}^{1}$ and the conditional probabilities $p[\cdot | x]$ to precisely match the empirical averages. As we will see later, its relaxation, that is the inequality case $(\lambda \neq 0)$ 2 translates into a regularization. Notice that the conditional Maxent principle does not require specifying a family of conditional probability distributions $\mathcal{P}$ to choose from.

## 13.3 Conditional Maxent models

Let $\Delta$ denote the simplex of the probability distributions over Y, $\mathcal{X}_{1} = \operatorname{supp}(\widehat{\mathcal{D}}^{1})$ the support of $\widehat{\mathbb{D}}^{1}$ , and $\bar{\mathsf p} \in \Delta^{x_{1}}$ the family of conditional probabilities, $\bar{p} =(p[\cdot | x])_{x \in \mathcal{X}_{1}}$ Then, the conditional Maxent principle can be formulated as the following optimiza-

tion problem:

$$
\min_{\widehat{p}\in \Delta^{x_{1}}}\sum_{x\in \mathcal{X}_{1}}\widehat{\mathcal{D}}^{1}(x) \mathrm{D}\big(p[\cdot |x]\parallel p_{0}[\cdot |x]\big)\\ \text{s.t.}\left\| \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p[\cdot |x] \end{array}}{\mathbb{E}}\big[\Phi(x,y)\big] - \underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\big[\Phi(x,y)\big]\right\|_{\infty}\leq \lambda.\tag{13.3}
$$

This defines a convex optimization problem since the objective is a positive sum of relative entropies and since the relative entropy D is convex with respect to its arguments (appendix E), since the constraints are Affine functions of ${\bar{p}},$ and since $\Delta^{\mathcal{X}_{1}}$ is a convex set. The solution is in fact unique, since the objective is strictly convex as a positive sum of relative entropies, each strictly convex. The empirical conditional probabilities $\widehat{\mathbb{D}}^{1}(\cdot | x), x \in \mathcal{X}_{1}$ , clearly form a feasible solution, thus problem (12.7) is feasible.

For uniform priors $p_{0}[\cdot | x]$ , problem (13.3) can be equivalently formulated as a conditional entropy maximization, which explains the name given to these models. Let $\begin{array}{r}{\bar{H}(\bar{p}) = - \mathbb{E}_{{x} \sim \widehat{\mathbb{D}}^{1}} \left[\sum_{y \in \mathbb{Y}} p[y | x] \log p[y | x] \right]} \end{array}$ denote the conditional entropy of p with respect to the marginal $\widehat{\mathbb{D}}^{1}$ . Then, the objective function of (12.7) can be rewritten as follows:

$$
\begin{array}{l} D \big(p[\cdot | x] \mid \mid p_{0}[\cdot | x] \big) = \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\sum_{y \in \mathcal{Y}} p[y | x] \log \frac{p[y | x]}{p_{0}[y | x]} \right] \\ = \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[- \sum_{y \in \mathcal{Y}} p[y | x] \log(1 / c) + \sum_{y \in \mathcal{Y}} p[y | x] \log p[y | x] \right] \\ = \log(c) - \bar{H}(\bar{p}).\end{array}
$$

Thus, since log(c) is a constant, minimizing the objective is then equivalent to maximizing $\bar{H}(\bar{p})$

Conditional Maxent models are the solutions of the optimization problem just described. As in the non-conditional case, they admit two important benefits: they are based on a fundamental theoretical guarantee of closeness of empirical and true feature averages, and they do not require specifying a particular family of distributions $\mathcal{P}_{\cdot}$ . In the next sections, we will further analyze the properties of conditional Maxent models.

## 13.4 Dual problem

Here, we derive an equivalent dual problem for (13.3) which, as we will show, can be formulated as a regularized conditional maximum likelihood problem over the family of Gibbs distributions.

The Maxent optimization problem (13.3) can be equivalently expressed as the unconstrained optimization problem $\mathrm{min}_{\bar{p}} F(\bar{p})$ with, for all $\bar{p} =(p[\cdot | x] \in(\mathbb{R}^{\mathfrak{Y}})^{\mathcal{X}_{1}}$ ,

$$
F(\bar{p}) = \underset{x\sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}}\left[\widetilde{D}\big(p[\cdot |x]\parallel p_{0}[\cdot |x]\big)\right] + I_{\mathcal{C}}\Bigg(\underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p[\cdot |x] \end{array}}{\mathbb{E}}\big[\Phi(x,y)\big]\Bigg),\tag{13.4}
$$

with $\widetilde{D} \bigl(p[\cdot | x] \| p_{0}[\cdot | x] \bigr) = D \bigl(p[\cdot | x] \| p_{0}[\cdot | x] \bigr)$ if $p[\cdot | x]$ is in $\Delta, \widetilde{D} \big(p[\cdot | x] \| p_{0}[\cdot | x] \big) = + \infty$ otherwise, and with $\mathcal{C} = \left\{\mathbf{u} \in \mathbb{R}^{N} \colon \left\| \mathbf{u} - \mathbb{E}_{\left(x, y \right) \sim \widehat{\boldsymbol{\Phi}}}[\Phi(x, y)] \right\|_{\infty} \leq \lambda \right\}$ , which is a convex set.

Let G be the function defined for al $\mathbf{w} \in \mathbb{R}^{N}$ by

$$
G(\mathbf{w}) = \frac{1}{m} \sum_{i = 1}^{m} \log \left[\frac{p_{\mathbf{w}}[y_{i} | x_{i}]}{p_{0}[y_{i} | x_{i}]} \right] - \lambda \| \mathbf{w} \|_{1},\tag{13.5}
$$

with, for all $x \in \mathcal{X}_{1}$ and $y \in \mathcal{Y}$

$$
p_{\mathbf{w}}[y | x] = \frac{p_{0}[y | x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)}}{Z(\mathbf{w}, x)} \quad \text{and} \quad Z(\mathbf{w}, x) = \sum_{y \in \mathcal{Y}} p_{0}[y | x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)}.\tag{13.6}
$$

Then, the following theorem gives a result similar to the duality theorem presented in the non-conditional case (Theorem 12.2, Section 12.5).

Theorem 13.1 Problem (13.3) is equivalent to the dual optimization problem $\mathrm{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w})$

$$
\sup_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) = \min_{\bar{\mathfrak{p}} \in(\mathbb{R}^{\mathcal{Y}})^{\mathcal{X}_{1}}} F(\bar{\mathfrak{p}}).\tag{13.7}
$$

Furthermore, let $\bar{p}^{*} = \operatorname{argmin}_{\bar{p}} F(\bar{p})$ . Then, for any $\epsilon > 0$ and any w such that $| G(\mathbf{w}) - \operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) | < \epsilon$ , we have $\mathbb{E}_{\boldsymbol{x} \sim \widehat{\mathfrak{D}}^{1}} \left[D \big(\bar{p}^{*}[\cdot | \boldsymbol{x}] \| p_{0}[\cdot | \boldsymbol{x}] \big) \right] \le \epsilon$

The proof is similar to that of Theorem 12.2 and is given at the end of this chapter since it is somewhat longer (Section 13.9).

In view of the theorem, if w is an $\epsilon$-solution of the dual optimization problem, then $\mathbb{E}_{{x} \sim \widehat{\mathfrak{D}}^{1}} \left[D \big({p}^{*}[\cdot |{x}] \|{p}_{0}[\cdot |{x}] \big) \right] \le \epsilon$ , which, by Jensen’s inequality and Pinsker’s inequality (Proposition E.7) implies that

$$
\underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\left\| p^{*}[\cdot | x] - p_{\mathbf{w}}[\cdot | x] \right\|_{1} \right] \leq \sqrt{\underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\left\| p^{*}[\cdot | x] - p_{\mathbf{w}}[\cdot | x] \right\|_{1}^{2} \right]} \leq \sqrt{2 \epsilon}.
$$

Thus, $p_{\mathbf{w}}[\cdot | x]$ is then $\sqrt{2 \epsilon} \mathrm{- close}$ in $\widehat{\Phi}^{1}$ -averaged $L_{\mathrm{1}} \mathrm{- norm}$ to the optimal solution of the primal and the theorem suggests that the solution of the conditional Maxent problem can be determined by solving the dual problem, which can be written equivalently as follows for a uniform prior:

$$
\inf_{\mathbf{w}} \lambda \| \mathbf{w} \|_{1} - \frac{1}{m} \sum_{i = 1}^{m} \log \left[p_{\mathbf{w}}[y_{i} | x_{i}] \right].\tag{13.8}
$$

## 13.5 Properties

Similar remarks to those made for non-conditional Maxent models apply here. In particular, the solution may not be achieved for any finite w for $\lambda = 0$ , which is why the infimum is needed. Also, this result may seem surprising since it shows that conditional Maxent coincides with conditional Maximum Likelihood $(\lambda = 0)$ or regularized conditional Maximum Likelihood $(\lambda > 0)$ using for the family $\mathcal{P}$ of conditional probabilities to choose from that of Gibbs distributions, while the conditional Maxent principle does not explicitly specify any family of conditional probabilities $\mathcal{P}$ . The reason is the specific choice of the conditional relative entropy as the measure of closeness of $p[\cdot | x]$ to the prior conditional distributions $p_{0}[\cdot | x]$ Other measures of closeness between distributions lead to different forms for the solution. Thus, in some sense, the choice of the measure of closeness is the (dual) counterpart of that of the family of conditional distributions in maximum likelihood. Also, as already mentioned in the standard Maxent case, Gibbs distributions form a very rich family.

Notice that both the primal and the dual optimization problems for conditional Maxent involve only conditional probabilities $p[\cdot | x]$ for x in $\mathcal{X}_{1}$ , that is for x in the training sample. Thus, they do not provide us with any information about other conditional probabilities. However, the dual shows that, for $x$ in $\mathcal{X}_{1}$ , the solution admits the same general form $p_{\mathbf{w}}[\cdot | x]$ , which only depends on the weight vector w. In view of that, we extend the definition of Maxent conditional probabilities to all $x \in{\mathfrak{X}}$ by using the same general form $p_{\mathbf{w}}[\cdot | x]$ and the same vector w for all $x.$

Observe also that in the definition of the primal or dual problems we could have used some other distribution Q over X in lieu of $\widehat{\mathbb{D}}^{1}$ . It is straightforward to verify that the duality theorem would continue to hold in that case using the same proof. In fact, ideally, we would have chosen Q to be $\mathrm{\mathcal{D}}^{1}$ . However, that optimization problem would require knowledge of the feature vectors for all $x \in \operatorname{supp}(\mathbb{D}^{1})$ , which of course is not accessible to us given a finite sample. The weighted vector w found when using $\widehat{\Phi}^{1}$ can be viewed as an approximation of the one obtained if using $\mathrm{\mathcal{D}}^{1}$

## 13.5 Properties

In this section, we discuss several aspects of conditional Maxent models, including the form of the dual optimization problems, the feature vectors used, and prediction with these models.

## 13.5.1 Optimization problem

L<sub>1</sub>-regularized conditional Maxent models are therefore conditional probability models solutions of the primal problem (13.3) or, equivalently, models defined by

$$
p_{\mathbf{w}}[y | x] = \frac{e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)}}{Z(x)} \quad \text{and} \quad Z(x) = \sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)},\tag{13.9}
$$

where w is solution of the dual problem

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{1} - \frac{1}{m} \sum_{i = 1}^{m} \log p_{\mathbf{w}}[y_{i} | x_{i}],
$$

with $\lambda \geq 0$ is a parameter. Using the expression of the conditional probabilities, this optimization problem can be written more explicitly as

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{1} + \frac{1}{m} \sum_{i = 1}^{m} \log \left[\sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})} \right].\tag{13.10}
$$

or, equivalently, as

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{1} - \mathbf{w} \cdot \frac{1}{m} \sum_{i = 1}^{m} \boldsymbol{\Phi}(x_{i}, y_{i}) + \frac{1}{m} \sum_{i = 1}^{m} \log \left[\sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y)} \right].\tag{13.11}
$$

By definition of the dual problem, this is an unconstrained convex optimization problem in w. This can be also seen from the fact that the log-sum function $\begin{array}{r}{\mathbf{w} \mapsto \log \left[\sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \Phi(x, y)} \right]} \end{array}$ is convex for any $x \in{\mathfrak{X}}$

There are many optimization solutions available for this problem, including several special-purpose algorithms, general first-order and second-order solutions, and special-purpose distributed solutions. One common method is simply to use stochastic gradient descent (SGD), which has been reported to be more efficient than most special-purpose methods in applications. When the dimension of the feature vectors Φ (or the cardinality of the family of feature functions H) is very large, these methods are typically ineficient. An alternative method then consists of applying coordinate descent to solve this problem. In that case, the resulting algorithm coincides with the version of L -regularized boosting where, instead of the exponential function, the logistic function is used.

## 13.5.2 Feature vectors

Using feature vectors $\Phi(x, y)$ depending on both the input x and the output $y$ is often important in applications. For example, in machine translation, it is convenient to use features whose values may depend on the presence of some words in the input sentence and some others in the output sequence. A common choice of the feature vector is however one where the column vectors $\Phi(x, y)$ and w admit c blocks of equal size and where only the block in $\Phi(x, y)$ corresponding to the class y is non-zero and equal to a feature vector $\Gamma(x)$ independent of the class labels:

$$
\boldsymbol{\Phi}(x, y) = \left[\begin{array}{c} 0 \\ \vdots \\ 0 \\ \boldsymbol{\Gamma}(x) \\ 0 \\ \vdots \\ 0 \end{array} \right] \qquad \mathbf{w} = \left[\begin{array}{c} \mathbf{w}_{1} \\ \vdots \\ \mathbf{w}_{y - 1} \\ \mathbf{w}_{y} \\ \mathbf{w}_{y + 1} \\ \vdots \\ \mathbf{w}_{c} \end{array} \right].
$$

In view of that, the inner product of w and $\Phi(x, y)$ can be expressed in terms of the feature vector $\Gamma(x)$ , which only depends on $x,$ but with a distinct parameter vector ${ \bf w } _ { y } \colon $

$$
\mathbf{w} \cdot \boldsymbol{\Phi}(x, y) = \mathbf{w}_{y} \cdot \boldsymbol{\Gamma}(x).
$$

The optimization problem for $L_{\mathrm{{1}^{- regulariz}}}$ ed conditional Maxent can then be written in terms of the vectors $\mathbf{w}_{y}$ as follows:

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \sum_{y \in \mathcal{Y}} \| \mathbf{w}_{y} \|_{1} + \frac{1}{m} \sum_{i = 1}^{m} \log \left[\sum_{y \in \mathcal{Y}} e^{\mathbf{w}_{y} \cdot \boldsymbol{\Gamma}(x_{i}) - \mathbf{w}_{y_{i}} \cdot \boldsymbol{\Gamma}(x_{i})} \right].\tag{13.12}
$$

Notice that, if the vectors $\mathbf{w}_{y}$ were not correlated via the second term of the objective function (for example if, instead of the log of the sum, this term were replaced by the sum of the logs), then the problem would be reduced to c separate optimization functions learning a distinct weight vector for each class, as in the one-vs-all setup of multi-class classification.

## 13.5.3 Prediction

Finally, note that the class ${\widehat{y}}(x)$ predicted by a conditional Maxent model with parameter w is given by

$$
\widehat{y}(x) = \underset{y \in \mathcal{Y}}{\operatorname{argmax}} p_{\mathbf{w}}[y | x] = \underset{y \in \mathcal{Y}}{\operatorname{argmax}} \mathbf{w} \cdot \boldsymbol{\Phi}(x, y).\tag{13.13}
$$

Thus, conditional Maxent models define linear classifiers. Conditional Maxent models are also sometimes referred to as log-linear models.

## 13.6 Generalization bounds

In this section, we will present learning guarantees for conditional Maxent models in two different settings: one where the dimension of the feature vectors $\Phi$ (or the cardinality of the family of feature functions H) is infinite or extremely large and where a coordinate-descent or boosting-type algorithm is more suitable, and another one where the dimension of the feature vectors $\Phi$ is finite and not too large.

We start with the case where the dimension of the feature vectors Φ is very large. The following margin-based guarantee holds in that case.

Theorem 13.2 For any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an $i.i.d.$ sample S of size m, the following holds for all $\rho > 0$ and $f \in \mathcal { F } = \{ ( x , y ) \mapsto $ $\mathbf{w} \cdot \pmb{\Phi}(x, y) \colon \| \mathbf{w} \|_{1} \leq 1\}$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \log_{u_{0}} \bigg(\sum_{y \in \mathcal{Y}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}} \bigg) + \frac{8c}{\rho} \Re_{m}(\Pi_{1}(\mathcal{H})) + \sqrt{\frac{\log \log_{2} \frac{4r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}},
$$

where $u_{0} = \log(1 + 1 / e)$ and $\Pi_{1}({\mathcal{H}}) = \{x \mapsto \phi(x, y) \colon \phi \in{\mathcal{H}}, y \in \mathcal{V}\}$

Proof: For any $f \colon(x, y) \mapsto \mathbf{w} \cdot \Phi(x, y)$ and $i \in[m]$ , let $\rho_{f}(x_{i}, y_{i})$ denote the margin of f at $(x_{i}, y_{i})$

$$
\rho_{f}(x_{i}, y_{i}) = \min_{y \neq y_{i}} f(x_{i}, y_{i}) - f(x_{i}, y) = \min_{y \neq y_{i}} \mathbf{w} \cdot(\boldsymbol{\Phi}(x_{i}, y_{i}) - \boldsymbol{\Phi}(x_{i}, y)).
$$

Fix $\rho > 0$ . Then, by Theorem 9.2, for any $\delta > 0$ , with probability at least $1 - \delta.$ the following inequality holds for all $f \in{\mathcal{H}}$ and $\rho \in(0, 2r]$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} 1_{\rho_{f}(x_{i}, y_{i}) \leq \rho} + \frac{4c}{\rho} \mathfrak{R}_{m}(\Pi_{1}(\mathcal{F})) + \sqrt{\frac{\log \log_{2} \frac{4r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}},
$$

where $\Pi_{1}({\mathcal F}) ~ = ~ \{x ~ \mapsto ~ f(x, y) \colon y ~ \in ~ \mathfrak{Y}, f ~ \in ~{\mathcal{H}}\}$ . The inequality trivially holds for all $\rho > 0$ since for $\rho \geq 2r$ , by H¨older’s inequality, we have $| \mathbf{w} \cdot \pmb{\Phi}(x, y) | \ \leq$ $\| \mathbf{w} \|_{1} \| \Phi(x, y) \|_{\infty} \leq r$ for $\| \mathbf{w} \|_{1} \leq 1$ , and thus $\begin{array}{r}{\operatorname{min}_{y \neq y_{i}} f(x_{i}, y_{i}) - f(x_{i}, y) \leq 2r \leq \rho} \end{array}$ for all $i \in[m]$ and $y \in \mathcal Y$ . Now, for any $\rho > 0$ , the ρ-margin loss can be upper bounded by the ρ-logistic loss:

$$
\forall u \in \mathbb{R}, 1_{u \leq \rho} = 1_{\frac{u}{\rho} - 1 \leq 0} \leq \log_{u_{0}}(1 + e^{- \frac{u}{\rho}}).
$$

Thus, the ρ-margin loss of f at $(x_{i}, y_{i})$ can be upper bounded as follows:

$$
\begin{array}{rl} & 1_{\rho_{f}(x_{i}, y_{i}) \leq \rho} \leq \log_{u_{0}}(1 + e^{- \frac{\rho(f, x_{i}, y_{i})}{\rho}}) \\ & \quad = \log_{u_{0}}(1 + \max_{y \neq y_{i}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}}) \\ & \quad \leq \log_{u_{0}} \left(1 + \sum_{y \neq y_{i}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}}\right) = \log_{u_{0}} \left(\sum_{y \in \mathcal{Y}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}}\right).\end{array}
$$

Thus, with probability at least $1 - \delta.$ , the following inequality holds for all $f \in \mathcal{H}$ and $\rho > 0 \colon$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \log_{u_{0}} \bigg(\sum_{y \in \mathcal{Y}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}} \bigg) + \frac{4c}{\rho} \mathfrak{R}_{m}(\Pi_{1}(\mathcal{F})) + \sqrt{\frac{\log \log_{2} \frac{4r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

For any sample $S =(x_{1}, \dots, x_{m})$ of size $m,$ the empirical Rademacher complexity of $\Pi_{1}({\mathcal{F}})$ can be bounded as follows:

$$
\begin{array}{l}\widehat{\mathfrak{R}}_{S}(\Pi_{1}(\mathcal{F})) = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{\| \mathbf{w}\|_{1}\leq 1\\ y\in \mathcal{Y}}}\sum_{i = 1}^{m}\sigma_{i}\sum_{j = 1}^{N}w_{j}\Phi_{j}(x_{i},y)\right]\\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{\| \mathbf{w}\|_{1}\leq 1\\ y\in \mathcal{Y}}}\sum_{j = 1}^{N}w_{j}\sum_{i = 1}^{m}\sigma_{i}\Phi_{j}(x_{i},y)\right]\\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{j\in[N]\\ y\in \mathcal{Y}}}\bigg|\sum_{i = 1}^{m}\sigma_{i}\Phi_{j}(x_{i},y)\bigg|\right]\\ \leq \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{\Phi \in \mathcal{H}\\ y\in \mathcal{Y}}}\bigg|\sum_{i = 1}^{m}\sigma_{i}\Phi(x_{i},y)\bigg|\right]\leq 2\widehat{\mathfrak{R}}_{S}(\Pi_{1}(\mathcal{H})), \end{array}
$$

which completes the proof.

The learning guarantee of the theorem is remarkable since it does not depend on the dimension $N$ and since it only depends on the complexity of the family H of feature functions (or base hypotheses). Since for any $\rho > 0, f / \rho$ admits the same generalization error as $f,$ the theorem implies that with probability at least $1 - \delta.$ δ, the following inequality holds for all $f \in \{(x, y) \mapsto \mathbf{w} \cdot \pmb{\Phi}(x, y) \colon \| \mathbf{w} \|_{1} \leq \frac{1}{\rho}\}$ and $\rho > 0 \colon$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \log_{u_{0}} \biggl(\sum_{y \in \mathcal{Y}} e^{f(x_{i}, y) - f(x_{i}, y_{i})} \biggr) + \frac{8c}{\rho} \Re_{m}(\Pi_{1}(\mathcal{H})) + \sqrt{\frac{\log \log_{2} \frac{4r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

This inequality can be used to derive an algorithm that selects w and $\rho > 0$ to minimize the right-hand side. The minimization with respect to $\rho$ does not lead to a convex optimization and depends on theoretical constant factors afecting the second and third term. Thus, instead, $\rho$ is left as a free parameter of the algorithm, typically determined via cross-validation.

Now, since only the first term of the right-hand side depends on w, for any $\rho > 0$ , the bound suggests selecting w as the solution of the following optimization problem:

$$
\min_{\| \mathbf{w} \|_{1} \leq \frac{1}{\rho}} \frac{1}{m} \sum_{i = 1}^{m} \log \left(\sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})}\right).\tag{13.14}
$$

Introducing a Lagrange variable $\lambda \geq 0$ , the optimization problem can be written equivalently as

$$
\min_{\mathbf{w}} \lambda \| \mathbf{w} \|_{1} + \frac{1}{m} \sum_{i = 1}^{m} \log \left(\sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})}\right).\tag{13.15}
$$

Since for any choice of $\rho$ in the constraint of (13.14), there exists an equivalent dual variable λ in the formulation of (13.15) that achieves the same optimal w, λ can be freely selected via cross-validation. The resulting algorithm precisely coincides with conditional Maxent.

When the dimension N of the feature vectors Φ is finite, the following marginbased guarantee holds.

Theorem 13.3 For any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an i.i.d. sample S of size m, the following holds for all $\rho > 0$ and $f \in \mathcal { F } = \{ ( x , y ) \mapsto $ $\mathbf{w} \cdot \pmb{\Phi}(x, y) \colon \| \mathbf{w} \|_{1} \leq 1\}$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \log_{u_{0}} \left(\sum_{y \in \mathcal{Y}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}}\right) + \frac{4cr \sqrt{2 \log(2cN)}}{\rho} + \sqrt{\frac{\log \log_{2} \frac{4r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}},
$$

where $u_{0} = \log(1 + 1 / e)$

Proof: The proof coincides with that of Theorem 13.2, modulo the upper bound on $\Re_{m}(\Pi_{1}({\mathcal{F}}))$ . For any sample $S =(x_{1}, \dots, x_{m})$ of size m, the empirical Rademacher complexity of $\Pi_{1}({\mathcal{F}})$ can be bounded as follows:

$$
\begin{array}{l}\widehat{\mathfrak{R}}_{S}(\Pi_{1}(\mathcal{F})) = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{\| \mathbf{w}\|_{1}\leq 1\\ y\in \mathcal{Y}}}\sum_{i = 1}^{m}\sigma_{i}\mathbf{w}\cdot \boldsymbol{\Phi}(x_{i},y)\right]\\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{\| \mathbf{w}\|_{1}\leq 1\\ y\in \mathcal{Y}}}\mathbf{w}\cdot \sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y)\right]\\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{y\in \mathcal{Y}}\left\| \sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y)\right\|_{\infty}\right]\\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\sup_{\substack{j\in[N]\\ y\in \mathcal{Y},s\in \{-1, + 1\}}}s\sum_{i = 1}^{m}\sigma_{i}\Phi_{j}(x_{i},y)\right]\\ \leq r\sqrt{2\log(2cN)}, \end{array}
$$

where the third equality holds by definition of the dual norm, and the last inequality by the maximal inequality (Corollary D.11), since the supremum is taken over $2cN$ choices. $\square$

This learning guarantee of the theorem is very favorable even for relatively highdimensional problems since its dependency on the dimension N is only logarithmic.

## 13.7 Logistic regression

The binary case of conditional Maxent models $(c = 2)$ is known as logistic regression and is one of the most well-known algorithms for binary classification.

## 13.7.1 Optimization problem

In the binary case, the sum appearing in the optimization problem of conditional Maxent models can be simplified as follows:

$$
\begin{array}{rl} \sum_{y \in \mathcal{Y}} e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})} & = e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, + 1) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})} + e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, - 1) - \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})} \\ & = 1 + e^{- y_{i} \mathbf{w} \cdot[\boldsymbol{\Phi}(x_{i}, + 1) - \boldsymbol{\Phi}(x_{i}, - 1)]} \\ & = 1 + e^{- y_{i} \mathbf{w} \cdot \boldsymbol{\Psi}(x_{i})}, \end{array}
$$

where for all $x \in \mathcal{X}, \ \Psi(x) = \Phi(x, + 1) - \Phi(x, - 1)$ . This leads to the following optimization problem, which defines $L_{1}$ -regularized logistic regression:

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{1} + \frac{1}{m} \sum_{i = 1}^{m} \log \left[1 + e^{- y_{i} \mathbf{w} \cdot \boldsymbol{\Psi}(x_{i})} \right].\tag{13.16}
$$

As discussed in the general case, this is a convex optimization problem which admits a variety of different solutions. A common solution is SGD, another one is coordinate descent. When coordinate descent is used, then the algorithm coincides with the alternative to AdaBoost where the logistic loss is used instead of the exponential loss $(\phi(- u) = \log_{2}(1 + e^{- u}) \geq 1_{u \leq 0})$

## 13.7.2 Logistic model

In the binary case, the conditional probability defined by the weight vector w can be expressed as follows:

$$
p_{\mathbf{w}}[y = + 1 \mid x] = \frac{e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, + 1)}}{Z(x)},\tag{13.17}
$$

with $Z(x) = e^{\mathbf{w} \cdot \Phi(x, + 1)} + e^{\mathbf{w} \cdot \Phi(x, - 1)}$ . Thus, prediction is based on a linear decision rule defined by the sign of log-odds ratio:

$$
\log \frac{p_{\mathbf{w}}[y = + 1 \mid x]}{p_{\mathbf{w}}[y = - 1 \mid x]} = \mathbf{w} \cdot \big(\boldsymbol{\Phi}(x, + 1) - \boldsymbol{\Phi}(x, - 1) \big) = \mathbf{w} \cdot \boldsymbol{\Psi}(x).
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/9eac49f225d2f0f7b377fab4b9f71dc9d60c9984ebba681931b06f341975d645.jpg)  
Figure 13.1

Plot of the logistic function $f_{\mathrm{logistic}}.$

This is why logistic regression is also known as a log-linear model. Observe also that the conditional probability admits the following logistic form:

$$
p_{\mathbf{w}}[y = + 1 \mid x] = \frac{1}{1 + e^{- \mathbf{w} \cdot[\boldsymbol{\Phi}(x, + 1) - \boldsymbol{\Phi}(x, - 1)]}} = \frac{1}{1 + e^{- \mathbf{w} \cdot \boldsymbol{\Psi}(x)}} = f_{\mathrm{logistic}} \big(\mathbf{w} \cdot \boldsymbol{\Psi}(x) \big),
$$

where $f_{\mathrm{logistic}}$ is the function defined over <sup>R</sup> by $\begin{array}{r}{f_{\mathrm{logistic}} \colon x \mapsto \frac{1}{1 + e^{- x}}} \end{array}$ . Figure 13.1 shows the plot of this function. The logistic function maps the images of the linear function $x \mapsto \Psi(x)$ to the interval [0, 1], which makes them interpretable as probabilities.

L -regularized logistic regression benefits from the strong learning guarantees already presented for conditional maxent models, in the special case of two classes $\left(c \ = \2 \right)$ . The learning guarantees for $L_{\mathrm{2^{- regularized}}}$ logistic regression will be similarly special cases of those presented in the next section.

## 13.8 L<sub>2</sub>-regularization

A common variant of conditional Maxent models is one where the dimension N is finite and where the regularization is based on the norm-2 squared of the weight vector w. The optimization problem is thus given by

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{2}^{2} - \frac{1}{m} \sum_{i = 1}^{m} \log p_{\mathbf{w}}[y_{i} | x_{i}],
$$

where for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$

$$
p_{\mathbf{w}}[y | x] = \frac{\exp(\mathbf{w} \cdot \boldsymbol{\Phi}(x, y))}{Z(x)} \quad \text{and} \quad Z(x) = \sum_{y \in \mathcal{Y}} \exp(\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)).\tag{13.18}
$$

As for the norm-1 regularization, there are many optimization solutions available for this problem, including special-purpose algorithms, general first-order and secondorder solutions, and special-purpose distributed solutions. Here, the objective is additionally diferentiable. A common optimization method is simply stochastic gradient descent (SGD).

In contrast to norm-1-regularized conditional Maxent models, which lead to sparser weight vectors, norm-2 conditional Maxent models lead to non-sparse solutions, which may be preferable and lead to more accurate solutions in some applications such as natural language processing. The following margin-based guarantee holds for norm-2 regularized conditional Maxent, assuming that the norm-2 of the feature vector is bounded.

Theorem 13.4 For any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an $i.i.d.$ sample S of size m, the following holds for all $\rho > 0$ and $f \in \mathcal { F } = \{ ( x , y ) \mapsto $ $\mathbf{w} \cdot \Phi(x, y) \colon \| \mathbf{w} \|_{2} \leq 1\}$

$$
R(f) \leq \frac{1}{m} \sum_{i = 1}^{m} \log_{u_{0}} \biggl(\sum_{y \in \mathcal{Y}} e^{\frac{f(x_{i}, y) - f(x_{i}, y_{i})}{\rho}} \biggr) + \frac{4r_{2} c^{2}}{\rho \sqrt{m}} + \sqrt{\frac{\log \log_{2} \frac{4r_{2}}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}},
$$

where $u_{0} = \log(1 + 1 / e)$ and $\begin{array}{r}{r_{2} = \operatorname{sup}_{(x, y)} \| \Phi(x, y) \|_{2}} \end{array}$

Proof: The proof is similar to that of Theorem 13.3, modulo the observation that here $| \mathbf{w} \cdot \Phi(x, y) | \leq \| \mathbf{w} \|_{2} \| \Phi(x, y) \|_{2} \leq r_{2}$ and modulo the upper bound on $\Re_{m}(\Pi_{1}({\mathcal{F}}))$ . For any sample $S =(x_{1}, \dots, x_{m})$ of size $m_{\colon}$ , the empirical Rademacher complexity of $\Pi_{1}({\mathcal{F}})$ can be bounded as follows:

$$
\begin{array}{l}\widehat{\mathfrak{R}}_{S}(\Pi_{1}(\mathcal{F})) = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Bigg[\sup_{\substack{\| \mathbf{w}\|_{2}\leq 1\\ y\in \mathcal{Y}}}\sum_{i = 1}^{m}\sigma_{i}\mathbf{w}\cdot \boldsymbol{\Phi}(x_{i},y) \Bigg]\\ \\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Bigg[\sup_{\substack{\| \mathbf{w}\|_{2}\leq 1\\ y\in \mathcal{Y}}}\mathbf{w}\cdot \sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y) \Bigg]\\ \\ = \frac{1}{m}\underset{\boldsymbol{igma}}{\mathbb{E}}\Bigg[\sup_{y\in \mathcal{Y}}\bigg\| \sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y)\bigg\|_{2}\Bigg]\\ \\ \leq \frac{1}{m}\sum_{y\in \mathcal{Y}}\underset{\boldsymbol{igma}}{\mathbb{E}}\Bigg[\bigg\| \sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y)\bigg\|_{2}\Bigg]\\ \\ \leq \frac{1}{m}\sum_{y\in \mathcal{Y}}\sqrt{\underset{\boldsymbol{igma}}{\mathbb{E}}\left[\bigg\|\sum_{i = 1}^{m}\sigma_{i}\boldsymbol{\Phi}(x_{i},y)\bigg\|_{2}^{2}\right]}\\ \\ = \frac{1}{m}\sum_{y\in \mathcal{Y}}\sqrt{\sum_{i = 1}^{m}\|\boldsymbol{\Phi}(x_{i},y)\|_{2}^{2}}\Bigg]\leq \frac{r_{2}c}{\sqrt{m}}, \end{array}
$$

where the third equality holds by definition of the dual norm, and the second inequality by Jensen’s inequality. $\square$

The learning guarantee of the theorem for $L_{\mathrm{2}} \mathrm{- regularized}$ conditional maxent models admits the advantage that the bound does not depend on the dimension. It can be very favorable for $r_{2}$ relatively small. The algorithm can then be very efective, provided that a small error can be achieved by a non-sparse weight vector.

## 13.9 Proof of the duality theorem

In this section, we give the full proof of Theorem 13.1.

Proof: The proof is similar to that of Theorem 12.2 and follows by application of the Fenchel duality theorem (theorem B.39) to the optimization problem (13.4) with the functions f and g defined for all $\bar{p} \in(\mathbb{R}^{y})^{\mathcal{X}_{1}}$ and $\mathbf{u} \in \mathbb{R}^{N}$ by $f({\bar{p}}) =$ $\begin{array}{r}{\mathbb{E}_{\boldsymbol{x} \sim \widehat{\boldsymbol{\mathcal{D}}}^{1}} \left[\widetilde{D} \big(p[\cdot | \boldsymbol{x}] \| p_{0}[\cdot | \boldsymbol{x}] \big) \right], g(\mathbf{u}) = I_{\mathcal{C}}(\mathbf{u})} \end{array}$ and $\begin{array}{r}{A p = \sum_{x \in \mathcal{X}} \sum_{y \in \mathcal{Y}} \widehat{\mathfrak{D}}^{1}(x) p[y | x] \Phi(x, y)} \end{array}$ <sup>b</sup>A is a bounded linear map since we have $\begin{array}{r}{\| A \bar{\mathsf p} \| \leq \| \bar{\mathsf p} \|_{1} \operatorname{sup}_{x \in \mathcal{X}, y \in \mathcal{Y}} \| \Phi(x, y) \|_{\infty} \leq} \end{array}$ $r \| \bar{p} \|_{1}$ for any $\bar{p} \in(\mathbb{R}^{y})^{\mathcal{X}_{1}}$ . Also, notice that the conjugate of A is given for all $\mathbf{w} \in \mathbb{R}^{N}$ and $(x, y) \in \mathcal{X}_{1} \times \mathcal{Y}$ by $(A^{*} \mathbf{w})(x, y) = \mathbf{w} \cdot \bigl(\widehat{\mathbb{D}}^{1}(x) \Phi(x, y) \bigr)$

Consider ${\bf u}_{0} \in \mathbb{R}^{N}$ defined by $\mathbf{u}_{0} = \mathbb{E}_{(x, y) \sim \widehat{\mathbb{D}}}[\Phi(x, y)] = A \bar{p}_{0}$ with $\bar{p}_{0} =(\mathcal{D}(\cdot | x))_{x \in \mathcal{X}_{1}}$ Since $\bar{\mathsf p}_{0}$ is in dom $(f) = \Delta^{x_{1}}$ , u<sub>0</sub> is in $A(\operatorname{dom}(f))$ . Furthermore, since λ is positive, $\mathbf{u}_{0}$ is contained in int $({\mathcal{C}}).~ g = I_{\mathcal{C}}$ equals zero over int(C) and is therefore continuous over int(C), thus g is continuous at $\mathbf{u}_{0}$ and we have $\mathbf{u}_{0} \in A(\operatorname{dom}(f)) \cap \operatorname{cont}(g)$ Thus, the assumptions of Theorem B.39 hold.

The conjugate function of f is defined for all $\bar{q} =(q[\cdot | x])_{x \in \mathcal{X}_{1}} \in(\mathbb{R}^{\mathfrak{Y}})^{\mathcal{X}_{1}}$ <sup>1</sup> by

$$
\begin{array}{l} f^{*}(\bar{\mathfrak{q}}) = \sup_{\bar{\mathfrak{p}} \in(\mathbb{R}^{y})^{\mathfrak{x}_{1}}} \bigg \{\langle \mathfrak{p}, \mathfrak{q} \rangle - \sum_{x \in \mathfrak{X}} \widehat{\mathcal{D}}^{1}(x) \widetilde{\mathrm{D}}(\mathfrak{p}[\cdot | x] \parallel \mathfrak{p}_{0}[\cdot | x]) \bigg\} \\ = \sup_{\bar{\mathfrak{p}} \in(\mathbb{R}^{y})^{\mathfrak{x}_{1}}} \bigg \{\sum_{x \in \mathfrak{X}_{1}} \widehat{\mathcal{D}}^{1}[x] \sum_{y \in \mathfrak{Y}} \frac{\mathfrak{p}[y | x] \mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}[x]} - \sum_{x \in \mathfrak{X}_{1}} \widehat{\mathcal{D}}^{1}[x] \widetilde{\mathrm{D}}(\mathfrak{p}[\cdot | x] \parallel \mathfrak{p}_{0}[\cdot | x]) \bigg\} \\ = \sum_{x \in \mathfrak{X}_{1}} \widehat{\mathcal{D}}^{1}(x) \sup_{\bar{\mathfrak{p}} \in(\mathbb{R}^{y})^{\mathfrak{x}_{1}}} \bigg \{\sum_{y \in \mathfrak{Y}} \mathfrak{p}[y | x] \left[\frac{\mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}(x)} \right] - \widetilde{\mathrm{D}}(\mathfrak{p}[\cdot | x] \parallel \mathfrak{p}_{0}[\cdot | x]) \bigg\} \\ = \sum_{x \in \mathfrak{X}_{1}} \widehat{\mathcal{D}}^{1}(x) f_{x}^{*} \bigg(\frac{\mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}(x)} \bigg), \end{array}
$$

where, for all $x \in \mathcal{X}_{1}$ and $p \in \mathbb{R}^{\mathcal{X}_{1}}, f_{x}$ is defined by $f_{x}(\bar{p}) = \widetilde{D}(p[\cdot | x] \| p_{0}[\cdot | x])$ . By Lemma B.37, the conjugate function $f_{x}^{*}$ is given for all $\bar{q} \in(\mathbb{R}^{y})^{\mathcal{X}_{1}}$ <sup>1</sup> by $f_{x}^{*} \left(\frac{\mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}(x)} \right) =$ log $\begin{array}{r}{\left(\sum_{y \in \mathfrak{y}} \mathfrak{p}_{0}[y | x] e^{\frac{\mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}(x)}} \right)} \end{array}$ . Thus, $f^{*}$ is given for all $\bar{q} \in(\mathbb{R}^{y})^{\mathcal{X}_{1}}$ by

$$
f^{*}(\mathfrak{q}) = \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\log \left(\sum_{y \in \mathcal{Y}} \mathfrak{p}_{0}[y | x] e^{\frac{\mathfrak{q}[y | x]}{\widehat{\mathcal{D}}^{1}(x)}}\right) \right].
$$

As in the proof of Theorem 12.2, the conjugate function of $g = I_{\mathcal{C}}$ is given for all $\mathbf{w} \in \mathbb{R}^{N}$ by $g^{\ast}(\mathbf{w}) = \mathbb{E}_{(x, y) \sim \widehat{\mathrm{\mathcal{D}}}}[\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)] + \lambda \| \mathbf{w} \|_{1}$ . In view of these identities, we can write, for all $\mathbf{w} \in \mathbb{R}^{N}$ ，

$$
\begin{array}{l} - f^{*}(A^{*} \mathbf{w}) - g^{*}(- \mathbf{w}) \\ = - \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\log \left(\sum_{y \in \mathcal{Y}} p_{0}[y | x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)}\right) \right] + \underset{(x, y) \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\mathbf{w} \cdot \boldsymbol{\Phi}(x, y)] - \lambda \| \mathbf{w} \|_{1} \\ = - \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}}[\log Z(\mathbf{w}, x)] + \frac{1}{m} \sum_{i = 1}^{m} \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i}) - \lambda \| \mathbf{w} \|_{1} \\ = \frac{1}{m} \sum_{i = 1}^{m} \log \frac{e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}, y_{i})}}{Z(\mathbf{w}, x_{i})} - \lambda \| \mathbf{w} \|_{1} \\ = \frac{1}{m} \sum_{i = 1}^{m} \log \left[\frac{p_{\mathbf{w}}[y_{i} | x_{i}]}{p_{0}[y_{i} | x_{i}]} \right] - \lambda \| \mathbf{w} \|_{1} = G(\mathbf{w}), \end{array}
$$

which proves that $\begin{array}{r}{\operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) = \operatorname{min}_{\bar{\mathfrak{p}} \in(\mathbb{R}^{\mathfrak{y}})^{\mathcal{X}_{1}}} F(\bar{\mathfrak{p}})} \end{array}$

The second part of the proof is similar to that of Theorem 12.2. For any $\mathbf{w} \in \mathbb{R}^{N}$ ， we can write

$$
\begin{aligned} & G(\mathbf{w}) - \underset{x\sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}}\left[\mathrm{D}(p^{*}[\cdot |x]\parallel p_{0}[\cdot |x])\right] + \underset{x\sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}}\left[\mathrm{D}(p^{*}[\cdot |x]\parallel p_{\mathbf{w}}[\cdot |x])\right]\\ & = \underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\left[\log \frac{p_{\mathbf{w}}[y|x]}{p_{0}[y|x]}\right] - \lambda \| \mathbf{w}\|_{1} - \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\log \frac{p^{*}[y|x]}{p_{0}[y|x]}\right] + \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\log \frac{p^{*}[y|x]}{p_{\mathbf{w}}[y|x]}\right]\\ & = -\lambda \| \mathbf{w}\|_{1} + \underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\left[\log \frac{p_{\mathbf{w}}[y|x]}{p_{0}[y|x]}\right] - \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\log \frac{p_{\mathbf{w}}[y|x]}{p_{0}[y|x]}\right]\\ & = -\lambda \| \mathbf{w}\|_{1} + \underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\left[\mathbf{w}\cdot \boldsymbol{\Phi}(x,y) - \log Z(\mathbf{w},x)\right] - \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\mathbf{w}\cdot \boldsymbol{\Phi}(x,y) - \log Z(\mathbf{w},x)\right]\\ & = -\lambda \| \mathbf{w}\|_{1} + \mathbf{w}\cdot \left[\underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\left[\boldsymbol{\Phi}(x,y)\right] - \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\boldsymbol{\Phi}(x,y)\right]\right].\end{aligned}
$$

As the solution of the primal optimization, $\bar{p}^{*}$ verifies $I_{\mathcal{C}} \bigg(\mathbb{E}_{\underset{y \sim p^{*}[\cdot | x |}{x \sim \widehat{\mathbb{D}}^{1}}}[\Phi(x, y)] \bigg) = 0,$ that is $\begin{array}{r}{\left\| \mathbb E_{\mathbf{\Phi}_{y \sim \widehat{\mathbb{p}}^{1} \cdot | x |}} \left[\Phi(x, y) \right] - \mathbb E_{(x, y) \sim \widehat{\mathbb{D}}}[\Phi(x, y)] \right\|_{\infty} \leq \lambda} \end{array}$ . By H¨older’s inequality, this implies the following inequality:

$$
-\| \mathbf{w}\|_{1} + \mathbf{w}\cdot \left[\underset{(x,y)\sim \widehat{\mathcal{D}}}{\mathbb{E}}\left[\mathbf{w}\cdot \boldsymbol{\Phi}(x,y) \right] - \underset{\begin{array}{c}x\sim \widehat{\mathcal{D}}^{1}\\ y\sim p^{*}[\cdot |x] \end{array}}{\mathbb{E}}\left[\mathbf{w}\cdot \boldsymbol{\Phi}(x,y)\right]\right]\leq -\| \mathbf{w}\|_{1} + \| \mathbf{w}\|_{1} = 0.
$$

Thus, we can write, for any $\mathbf{w} \in \mathbb{R}^{N}$ 2

$$
\underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\mathrm{D}(p^{*}[\cdot | x] \mid \mid p_{\mathbf{w}}[\cdot | x]) \right] \leq \underset{x \sim \widehat{\mathcal{D}}^{1}}{\mathbb{E}} \left[\mathrm{D}(p^{*}[\cdot | x] \mid \mid p_{0}[\cdot | x]) \right] - G(\mathbf{w}).
$$

Now, assume that w verifies $| G(\mathbf{w}) - \operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) | \leq \epsilon$ for some $\epsilon > 0$ . Then, $\begin{array}{r}{\mathbb{E}_{x \sim \widehat{\mathbb{D}}^{1}}[D(p^{*}[\cdot | x] \parallel p_{0}[\cdot | x])] - G(\mathbf{w}) =(\operatorname{sup}_{\mathbf{w}} G(\mathbf{w})) - G(\mathbf{w}) \le \epsilon} \end{array}$ implies the inequality $\mathbb{E}_{\boldsymbol{x} \sim \widehat{\mathfrak{D}}^{1}}[D(p^{*}[\cdot | \boldsymbol{x}] \parallel p_{\mathbf{w}}[\cdot | \boldsymbol{x}])] \le \epsilon$ . This concludes the proof of the theorem. $\square$

## 13.10 Chapter notes

The logistic regression model is a classical model in statistics. The term logistic was introduced by the Belgian mathematician Verhulst [1838, 1845]. An early reference for logistic regression is the publication of Berkson [1944] who advocated the use of the logistic function, instead of the cumulative distribution function of the standard normal distribution (probit model).

Conditional maximum entropy models in natural language processing were introduced by Berger et al. [1996] and were widely adopted for a variety of different tasks, including part-of-speech tagging, parsing, machine translation, and text categorization (see tutorial by Manning and Klein [2003]). Our presentation of the conditional Maxent principle, including their regularized variants, the duality theorem for conditional Maxent models (Theorem 13.1) and their theoretical justifications are based on [Cortes, Kuznetsov, Mohri, and Syed, 2015]. This chapter provided two types of justification for these models: one based on the conditional Maxent principle, another based on standard generalization bounds.

As in the case of Maxent models for density estimation, conditional Maxent models can be extended by using other Bregman divergences [Laferty, Pietra, and Pietra, 1997] and other regularizations. Laferty [1999] presented a general framework for incremental algorithms based on Bregman divergences that admits logistic regression as as special case, see also [Collins et al., 2002] who showed that boosting and logistic regression were special instances of a common framework based on Bregman divergences. The regularized conditional Maxent models presented in this chapter can be extended similarly using other Bregman divergences. In the binary classification case, when coordinate descent is used to solve the optimization problem of regularized conditional Maxent models, the algorithm coincides with $L_{\mathrm{1 - regularized}}$ AdaBoost modulo the use of the logistic loss instead of the exponential loss.

Cortes, Kuznetsov, Mohri, and Syed [2015] presented a more general family of conditional probability models, conditional structural Maxent models, for which they also presented a duality theorem and gave strong learning guarantees. These Maxent models are based on feature functions selected from a union of possibly very complex sub-families. The resulting algorithms coincide with the DeepBoost algorithms of Cortes, Mohri, and Syed [2014] in the binary classification case or the multi-class DeepBoost algorithm of Kuznetsov, Mohri, and Syed [2014] in the multiclass classification case, when the logistic function is used as a convex surrogate loss function.

## 13.11 Exercises

13.1 Extension to Bregman divergences.

(a) Show how conditional Maxent models can be extended by using arbitrary Bregman divergences instead of the (unnormalized) relative entropy.

(b) Prove a duality theorem similar to Theorem 13.1 for theses extensions.

(c) Derive theoretical guarantees for these extensions. What additional property is needed for the Bregman divergence so that your learning guarantees hold?

13.2 Stability analysis for L -regularized conditional Maxent.

(a) Give an upper bound on the stability of the $L_{\mathrm{2^{- regularized}}}$ conditional Maxent in terms of the sample size and λ (Hint: use the techniques and results of Chapter 14).

(b) Use the previous question to derive a stability-based generalization guarantee for the algorithm.

13.3 Maximum conditional Maxent. An alternative measure of closeness, instead of the conditional relative entropy, is the maximum relative entropy over all $x \in \mathcal{X}_{1}$

(a) Write the primal optimization problem for this maximum conditional Maxent formulation. Show that it is a convex optimization problem, and discuss its feasibility and the uniqueness of its solution.

(b) Prove a duality theorem for maximum conditional Maxent and write the equivalent dual problem.

(c) Analyze the properties of maximum conditional Maxent and give a general ization bound for the algorithm.

13.4 Conditional Maxent with other marginal distributions: discuss and analyze conditional Maxent models when using a distribution Q over X instead of $\widehat{\mathbb{D}}^{1}$ . Prove that a duality theorem similar to Theorem 13.1 holds.


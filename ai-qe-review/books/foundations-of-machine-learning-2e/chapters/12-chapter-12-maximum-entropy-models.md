---
title: "Chapter 12 \u2014 Maximum Entropy Models"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 12
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 7462
source_line_end: 7974
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 2
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

# Chapter 12 — Maximum Entropy Models

> [[../README|本书目录]] · [[11-chapter-11-regression|上一章]] · [[13-chapter-13-conditional-maximum-entropy-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 7462–7974。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 4；Affine × 1；different × 5。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 12.1 Density estimation problem

Let $S = ( x _ { 1 } , \dots , x _ { m } ) $ be a sample of size m drawn i.i.d. from an unknown distribution D. Then, the density estimation problem consists of using that sample to select out of a family of possible distributions a distribution p that is close to D.

The choice of the family is critical. A relatively small family may not contain D or even any distribution close to D. On the other hand, a very rich family defined by a large set of parameters may make the task of selecting p very dificult if only a sample of a relatively modest size m is available.

## 12.1.1 Maximum Likelihood (ML) solution

One common solution adopted for selecting a distribution p is based on the maximum likelihood principle. This consists of choosing a distribution out of the family $\mathcal{P}$ that assigns the largest probability to the sample $S$ observed. Thus, using the fact that the sample is drawn i.i.d., the solution p<sub>ML</sub> selected by maximum likelihood is defined by

$$
p_{\mathrm{ML}} = \underset{p \in \mathcal{P}}{\operatorname{argmax}} \prod_{i = 1}^{m} p(x_{i}) = \underset{p \in \mathcal{P}}{\operatorname{argmax}} \sum_{i = 1}^{m} \log p(x_{i}).\tag{12.1}
$$

The maximum likelihood principle can be equivalently formulated in terms of the relative entropy. Let $\widehat{\Phi}$ denote the empirical distribution corresponding to the sample $S.$ Then, p<sub>ML</sub> coincides with the distribution p with respect to which the empirical distribution $\widehat{\Phi}$ admits the smallest relative entropy:

$$
p_{\mathrm{ML}} = \underset{p \in \mathcal{P}}{\operatorname{argmin}} D(\widehat{\mathcal{D}} \| p).\tag{12.2}
$$

This can be seen straightforwardly from the following:

$$
\begin{array}{l} D(\widehat{\mathcal{D}} \parallel p) = \sum_{x} \widehat{\mathcal{D}}(x) \log \widehat{\mathcal{D}}(x) - \sum_{x} \widehat{\mathcal{D}}(x) \log p(x) \\ \qquad = - H(\widehat{\mathcal{D}}) - \sum_{x} \frac{\sum_{i = 1}^{m} 1_{x = x_{i}}}{m} \log p(x) \\ \qquad = - H(\widehat{\mathcal{D}}) - \sum_{i = 1}^{m} \sum_{x} \frac{1_{x = x_{i}}}{m} \log p(x) \\ \qquad = - H(\widehat{\mathcal{D}}) - \sum_{i = 1}^{m} \frac{\log p(x_{i})}{m}, \end{array}
$$

since the first term of the last expression, the negative entropy of the empirical distribution, does not vary with p.

As an example of application of the maximum likelihood principle, suppose we wish to estimate the bias $p_{0}$ of a coin from an i.i.d. sample $S =(x_{1}, \dots, x_{m})$ where $x_{i} \in \{{h},{t}\}$ with h denoting heads and t tails. $p_{0} \in[0, 1]$ is the probability of h according to the unknown distribution D. Let be the family of all distributions ${\mathsf p} =(p, 1 - p)$ where $p \in[0, 1]$ is an arbitrary possible bias value. Let $n_{h}$ denote the number of occurrences of h in $S.$ . Then, choosing $p =(\widehat{p}_{S}, 1 - \widehat{p}_{S}) = \widehat{\mathcal{D}}$ where ${\widehat{p}} s ={\frac{n_{h}}{m}}$ leads to $D(\widehat{\boldsymbol{\mathscr{D}}} \parallel p) = 0$ , which, by (12.2), shows that ${p}_{\mathrm{ML}} ={\dot{\mathbb{D}}}$ . Thus, the maximum likelihood estimate $p_{\mathrm{ML}}$ of the bias is the empirical value

$$
p_{\mathrm{ML}} = \frac{n_{h}}{m}.\tag{12.3}
$$

## 12.1.2 Maximum a Posteriori (MAP) solution

An alternative solution based on the so-called Maximum a Posteriori solution consists of selecting a distribution ${p} \in{\mathcal{P}}$ that is the most likely, given the observed sample $S$ and a prior $\mathbb{P}[\mathfrak{p}]$ over the distributions ${p} \in{\mathcal{P}}$ . By the Bayes rule, the problem can be formulated as follows:

$$
p_{\text{MAP}} = \underset{p \in \mathcal{P}}{\operatorname{argmax}} \mathbb{P}[p | S] = \underset{p \in \mathcal{P}}{\operatorname{argmax}} \frac{\mathbb{P}[S | p] \mathbb{P}[p]}{\mathbb{P}[S]} = \underset{p \in \mathcal{P}}{\operatorname{argmax}} \mathbb{P}[S | p] \mathbb{P}[p].\tag{12.4}
$$

Notice that, for a uniform prior, $\mathbb{P}[p]$ is a constant and the Maximum a Posteriori solution then coincides with the Maximum Likelihood solution. The following is a standard example illustrating the MAP solution and its diference with the ML solution.

Example 12.1 (Application of the MAP solution) Suppose we need to determine if a patient has a rare disease, given a laboratory test of that patient. We consider a set of two simple distributions: d (disease with probability one) and <sup>¯</sup>d (no disease with probability one), thus $\mathcal{P} = \{d,{\bar{d}}\}$ . The laboratory test is either pos (positive) or neg (negative), thus $S \in \{\mathrm{pos}, \mathrm{neg}\}$

Suppose that the disease is rare, say $\mathbb{P}[d] =.005$ and that the laboratory is relatively accurate: $\mathbb{P}[\mathrm{pos} | d] =.98$ , and $\mathbb{P}[\mathrm{neg} | \bar{d}] =.95$ . Then, if the test is positive, what should be the diagnosis? We can compute the right-hand side of (12.4) for both outcomes, given the positive test result, to determine the MAP estimate:

$$
\mathbb{P}[\mathrm{pos} | d] \mathbb{P}[d] =.98 \times.005 =.0049
$$

$$
\mathbb{P}[\mathrm{pos} | \bar{d}] \mathbb{P}[\bar{d}] =(1 -.95) \times(1 -.005) =.04975 >.0049.
$$

Thus, in this case, the MAP prediction is no disease: according to the MAP solution, with the values indicated, a patient with a positive test result is nonetheless more likely not to have the disease!

We will not analyze the properties of the Maximum Likelihood and Maximum a Posteriori solutions here, which depend on the size of the sample and the choice of the family $\mathcal{P}.$ Instead, we will consider a richer density estimation problem where the learner has access to features, which is the learning problem addressed by Maximum Entropy (Maxent) models.

## 12.2 Density estimation problem augmented with features

As with the standard density estimation problem, we consider a scenario where the learner receives a sample $S =(x_{1}, \ldots, x_{m}) \subseteq \mathcal{X}$ of size m drawn i.i.d. according to some distribution D. But, here, additionally, we assume that the learner has access to a feature mapping Φ from X to $\mathbb{R}^{N}$ with $\| \Phi \|_{\infty} \leq r$ . In the most general case, we may have $N = + \infty$ . We will denote by H a family of real-valued functions containing the component feature functions $\Phi_{j}$ with $j \in[N]$ . different feature functions can be considered in practice. H may be the family of threshold functions $\mathbf{x} \mapsto 1_{x_{i} \leq \theta}, \mathbf{x} \in \mathbb{R}^{n}, \theta \in \mathbb{R}$ , defined over n variables as for boosting stumps, or it may be a family of functions defined by more complex decision trees or regression trees. Other features often used in practice are monomials of degree k based on the input variables. To simplify the presentation, in what follows, we will assume that the input set X is finite.

## 12.3 Maxent principle

Maxent models are derived from a principle based on the key property that, with high probability, the empirical average of any feature is close to its true average. By the Rademacher complexity bound, for any $\delta > 0$ , the following inequality holds with probability at least $1 - \delta$ over the choice of a sample $S$ of size m:

$$
\Big \| \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \Big \|_{\infty} \leq 2 \Re_{m}(\mathcal{H}) + r \sqrt{\frac{\log \frac{2}{\delta}}{2m}},\tag{12.5}
$$

where we denote by $\widehat{\Phi}$ the empirical distribution defined by the sample S. This is the theoretical guarantee that guides the definition of the Maxent principle.

Let ${\mathsf p}_{0}$ be a distribution over X with $\mathsf p_{0}(x) > 0$ for all $x \in{\mathfrak{X}}$ , which is often chosen to be the uniform distribution. Then, the Maxent principle consists of seeking a distribution p that is as agnostic as possible, that is as close as possible to the uniform distribution or, more generally, to a prior ${\mathsf p}_{0}$ , while verifying an inequality similar to (12.5):

$$
\left\| \underset{x \sim \mathfrak{p}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right\|_{\infty} \leq \lambda,\tag{12.6}
$$

where $\lambda \geq 0$ is a parameter. Here, closeness is measured using the relative entropy. Choosing $\lambda = 0$ corresponds to standard Maxent or unregularized Maxent and to requiring the expectation of the features with respect to p to precisely match the empirical averages. As we will see later, its relaxation, that is the inequality case $(\lambda \neq 0)$ , translates into a regularization. Notice that, unlike Maximum likelihood, the Maxent principle does not require specifying a family of probability distributions $\mathcal{P}$ to choose from.

## 12.4 Maxent models

Let $\Delta$ denote the simplex of all distributions over ${\mathcal{X}},$ then, the Maxent principle can be formulated as the following optimization problem:

$$
\begin{array}{c} \underset{p \in \Delta}{\min} \mathrm{D}(p \parallel p_{0}) \\ \text{subject to:} \left\| \underset{x \sim p}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] \right\|_{\infty} \leq \lambda.\end{array}\tag{12.7}
$$

This defines a convex optimization problem since the relative entropy D is convex with respect to its arguments (appendix E), since the constraints are Affine, and since $\Delta$ is a convex set. The solution is in fact unique since the relative entropy is strictly convex. The empirical distribution is clearly a feasible point, thus problem (12.7) is feasible.

For a uniform prior ${p}_{0}.$ problem (12.7) can be equivalently formulated as an entropy maximization, which explains the name given to these models. Let ${H}({p}) =$ $- \textstyle \sum_{x \in{\mathcal{X}}}{p}(x)$ log p(x) denote the entropy of ${p}.$ Then, the objective function of (12.7) can be rewritten as follows:

$$
\begin{array}{l} D(p \| p_{0}) = \sum_{x \in \mathcal{X}} p(x) \log \frac{p(x)}{p_{0}(x)} \\ \qquad = - \sum_{x \in \mathcal{X}} p(x) \log p_{0}(x) + \sum_{x \in \mathcal{X}} p(x) \log p(x) \\ \qquad = \log | \mathcal{X} | - H(p).\end{array}
$$

Thus, since log X is a constant, minimizing the relative entropy $D(p \parallel p_{0})$ is then equivalent to maximizing H(p).

Maxent models are the solutions of the optimization problem just described. As already discussed, they admit two important benefits: they are based on a fundamental theoretical guarantee of closeness of empirical and true feature averages, and they do not require specifying a particular family of distributions $\mathcal{P}.$ . In the next sections, we will further analyze the properties of Maxent models.

## 12.5 Dual problem

Here, we derive an equivalent dual problem for (12.7) which, as we will show, can be formulated as a regularized maximum likelihood problem over the family of Gibbs distributions.

For any convex set $K,$ , let $I_{K}$ denote the function defined by $I_{K}(x) = 0{\mathrm{~ if ~}} x \in K$ 2 $I_{K}(x) = + \infty$ otherwise. Then, the Maxent optimization problem (12.7) can be equivalently expressed as the unconstrained optimization problem $\mathrm{min}_{p} F({p})$ with,

for all $p \in \mathbb{R}^{\mathcal{X}}$ ,

$$
F(p) = \widetilde{\mathrm{D}}(p \parallel p_{0}) + I_{\mathcal{C}}(\underset{p}{\mathbb{E}}[\boldsymbol{\Phi}]),\tag{12.8}
$$

with $\widetilde{D}(p \| p_{0}) = D(p \| p_{0})$ ) if p is in the simplex $\Delta, \widetilde{D}(p \| p_{0}) = + \infty$ otherwise, and with $\mathcal{C} \subseteq \mathbb{R}^{N}$ the convex set defined by $\mathcal{C} = \{\mathbf{u} \colon \| \mathbf{u} - \mathbb{E}_{(x, u) \sim \widehat{\mathbb{D}}}[\Phi(x, y)] \|_{\infty} \leq \lambda\}$

The general form of a Gibbs distribution $p_{\mathbf{w}}$ with prior p , parameter w, and feature vector $\Phi$ is

$$
p_{\mathbf{w}}[x] = \frac{p_{0}[x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x)}}{Z(\mathbf{w})}\tag{12.9}
$$

where $\begin{array}{r}{Z(\mathbf{w}) = \sum_{x \in \mathcal{X}} p_{0}[x] e^{\mathbf{w} \cdot \Phi(x)}} \end{array}$ is a normalization factor also known as the partition function. Let G be the function defined for all $\mathbf{w} \in \mathbb{R}^{N}$ by

$$
G(\mathbf{w}) = \frac{1}{m} \sum_{i = 1}^{m} \log \left[\frac{\mathsf{p_{w}}[x_{i}]}{p_{0}[x_{i}]} \right] - \lambda \| \mathbf{w} \|_{1}.\tag{12.10}
$$

Then, the following theorem shows the equivalence of the primal problem (12.7) or (12.8) and a dual problem based on $G.$

Theorem 12.2 (Maxent duality) Problems (12.7) or (12.8) are equivalent to the optimization problem $\mathrm{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w})$ :

$$
\sup_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) = \min_{\mathfrak{p}} F(\mathfrak{p}).\tag{12.11}
$$

Furthermore, let $p^{*} = \operatorname{argmin}_{p} F(p)$ and $d^{*} = \operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w})$ , then, for any $\epsilon > 0$ and any w such that $| G(\mathbf{w}) - d^{*} | < \epsilon$ , the following inequality holds: $D(p^{\ast} \parallel p_{\mathbf{w}}) \leq \epsilon$

Proof: The first part of the proof follows by application of the Fenchel duality theorem (theorem B.39) to the optimization problem (12.8) with the functions f, $^{g,}$ and A defined for all $p \in \mathbb{R}^{\mathcal{X}}$ and $\mathbf{u} \in \mathbb{R}^{N}$ by $f(\mathfrak{p}) = \widetilde{D}(\mathfrak{p} \| \mathfrak{p}_{0}), g(\mathbf{u}) = I_{\mathcal{C}}(\mathbf{u})$ and $\begin{array}{r}{A p = \sum_{x \in \mathcal{X}} p(x) \Phi(x)} \end{array}$ . A is a bounded linear map since for any p, we have $\| A{p} \| \leq$ $\begin{array}{r}{\| p \|_{1} \operatorname{sup}_{x} \| \Phi(x) \|_{\infty} \leq r \| p \|_{1}} \end{array}$ . Also, notice that for all $\mathbf{w} \in \mathbb{R}^{N}, A^{*} \mathbf{w} = \mathbf{w} \cdot \pmb{\Phi}$

Consider ${\bf u}_{0} \in \mathbb{R}^{N}$ defined by $\mathbf{u}_{0} = \mathbb{E}_{\boldsymbol{x} \sim \widehat{\boldsymbol{\mathcal{D}}}}[\Phi(\boldsymbol{x})] = A \boldsymbol{\widehat{\mathcal{D}}}$ . Since D is in $\Delta = \operatorname{dom}(f)$ 2 u is in $A(\operatorname{dom}(f))$ . Furthermore, since $\lambda > 0,{\bf u}_{0}$ is in int(C). $g = I_{\mathcal{C}}$ equals zero over int(C) and is therefore continuous over int(C), thus g is continuous at u<sub>0</sub> and we have $\mathbf{u}_{0} \in A(\operatorname{dom}(f)) \cap \operatorname{cont}(g)$ . Thus, the assumptions of Theorem B.39 hold. By Lemma B.37, the conjugate of f is the function $f^{*} \colon \mathbb{R}^{\mathcal{X}} \mathbb{R}$ defined by $\begin{array}{r}{f^{*}(\mathbf{q}) = \log \big(\sum_{x \in \mathcal{X}} p_{0}[x] e^{q[x]} \big)} \end{array}$ for all $q \in \mathbb{R}^{\mathcal{X}}$ . The conjugate function of $g = I_{\mathcal{C}}$ is the function $g^{*}$ defined for all $\mathbf{w} \in \mathbb{R}^{N}$ by

$$
\begin{array}{l} g^{*}(\mathbf{w}) = \sup_{\mathbf{u}} \left(\mathbf{w} \cdot \mathbf{u} - I_{\mathcal{C}}(\mathbf{u})\right) = \sup_{\mathbf{u} \in \mathcal{C}}(\mathbf{w} \cdot \mathbf{u}) \\ = \sup_{\| \mathbf{u} - \mathbb{E}_{\widehat{\mathcal{D}}}[\boldsymbol{\Phi}] \|_{\infty} \leq \lambda}(\mathbf{w} \cdot \mathbf{u}) \\ = \mathbf{w} \cdot \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] + \sup_{\| \mathbf{u} \|_{\infty} \leq \lambda}(\mathbf{w} \cdot \mathbf{u}) \\ = \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\mathbf{w} \cdot \boldsymbol{\Phi}] + \lambda \| \mathbf{w} \|_{1}, \end{array}
$$

where the last equality holds by definition of the dual norm. In view of these identities, we can write

$$
\begin{array}{l} - f^{*}(A^{*} \mathbf{w}) - g^{*}(- \mathbf{w}) = - \log \big(\sum_{x \in \mathcal{X}} p_{0}[x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x)} \big) + \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\mathbf{w} \cdot \boldsymbol{\Phi}] - \lambda \| \mathbf{w} \|_{1} \\ \qquad = - \log Z(\mathbf{w}) + \frac{1}{m} \sum_{i = 1}^{m} \mathbf{w} \cdot \boldsymbol{\Phi}(x_{i}) - \lambda \| \mathbf{w} \|_{1} \\ \qquad = \frac{1}{m} \sum_{i = 1}^{m} \log \frac{e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x_{i})}}{Z(\mathbf{w})} - \lambda \| \mathbf{w} \|_{1} \\ \qquad = \frac{1}{m} \sum_{i = 1}^{m} \log \left[\frac{p_{\mathbf{w}}[x_{i}]}{p_{0}[x_{i}]} \right] - \lambda \| \mathbf{w} \|_{1} = G(\mathbf{w}), \end{array}
$$

which proves that $\begin{array}{r}{\operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) = \operatorname{min}_{\mathfrak{p}} F(\mathfrak{p})} \end{array}$

Now, for any $\mathbf{w} \in \mathbb{R}^{N}$ , we can write

$$
\begin{array}{l} G(\mathbf{w}) - D(p^{*} \parallel p_{0}) + D(p^{*} \parallel p_{\mathbf{w}}) \\ = \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\log \frac{p_{\mathbf{w}}[x]}{p_{0}[x]} \right] - \lambda \| \mathbf{w} \|_{1} - \underset{x \sim p^{*}}{\mathbb{E}} \left[\log \frac{p^{*}[x]}{p_{0}[x]} \right] + \underset{x \sim p^{*}}{\mathbb{E}} \left[\log \frac{p^{*}[x]}{p_{\mathbf{w}}[x]} \right] \\ = - \lambda \| \mathbf{w} \|_{1} + \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\log \frac{p_{\mathbf{w}}[x]}{p_{0}[x]} \right] - \underset{x \sim p^{*}}{\mathbb{E}} \left[\log \frac{p_{\mathbf{w}}(x)}{p_{0}(x)} \right] \\ = - \lambda \| \mathbf{w} \|_{1} + \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\mathbf{w} \cdot \boldsymbol{\Phi}(x) - \log Z(\mathbf{w}) \right] - \underset{x \sim p^{*}}{\mathbb{E}} \left[\mathbf{w} \cdot \boldsymbol{\Phi}(x) - \log Z(\mathbf{w}) \right] \\ = - \lambda \| \mathbf{w} \|_{1} + \mathbf{w} \cdot \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\boldsymbol{\Phi}(x) \right] - \underset{x \sim p^{*}}{\mathbb{E}} \left[\boldsymbol{\Phi}(x) \right] \right].\end{array}
$$

The solution of the primal optimization, $p^{*}$ , verifies the constraint $I_{\mathcal{C}} \big(\mathbb{E}_{p^{\ast}}[\Phi] \big) = 0$ that is $\| \mathbb{E}_{x \sim \widehat{\mathcal{D}}}[\Phi(x)] - \mathbb{E}_{x \sim{p}^{*}}[\Phi(x)] \|_{\infty} \leq \lambda$ . By H¨older’s inequality, this implies the following inequality:

$$
- \lambda \| \mathbf{w} \|_{1} + \mathbf{w} \cdot \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim p^{*}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] \leq - \lambda \| \mathbf{w} \|_{1} + \lambda \| \mathbf{w} \|_{1} = 0.
$$

Thus, we can write, for any $\mathbf{w} \in \mathbb{R}^{N}$ ,

$$
D \left(p^{*} \| p_{w}\right) \leq D \left(p^{*} \| p_{0}\right) - G(w).
$$

Now, assume that w verifies $| G(\mathbf{w}) - \operatorname{sup}_{\mathbf{w} \in \mathbb{R}^{N}} G(\mathbf{w}) | \leq \epsilon$ for some $\epsilon > 0$ . Then, $\begin{array}{r}{D(p^{*} \parallel p_{0}) - G(\mathbf{w}) =(\mathsf{sup}_{\mathbf{w}} G(\mathbf{w})) - G(\mathbf{w}) \le \epsilon} \end{array}$ implies $D(p^{\ast} \parallel p_{\mathbf{w}}) \leq \epsilon.$ . This concludes the proof of the theorem. $\square$

In view of the theorem, if w is an $\epsilon$-solution of the dual optimization problem, then $D(p^{\ast} \parallel p_{\bf w}) \leq \epsilon$ , which, by Pinsker’s inequality (Proposition E.7) implies that $p_{\mathbf{w}}$ is $\sqrt{2 \epsilon} \mathrm{- close}$ in $L_{\mathrm{1}} \mathrm{- norm}$ to the optimal solution of the primal: $\| p^{*} - p_{\mathbf{w}} \|_{1} \leq \sqrt{2 \epsilon}$ Thus, the solution of our Maxent problem can be determined by solving the dual problem, which can be written equivalently as follows:

$$
\inf_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{1} - \frac{1}{m} \sum_{i = 1}^{m} \log p_{\mathbf{w}}[x_{i}].\tag{12.12}
$$

Notice that the solution may not be achieved for any finite w for $\lambda = 0$ , which is why the infimum is needed. This result may seem surprising since it shows that Maxent coincides with Maximum Likelihood $(\lambda = 0)$ or regularized Maximum Likelihood $(\lambda > 0)$ over a specific family $\mathcal{P}$ of distributions, that of Gibbs distributions, while, as pointed out earlier, the Maxent principle does not explicitly specify any family $\mathcal{P}_{\cdot}$ What can then explain that the solution of Maxent belongs to the specific family of Gibbs distributions? The reason is the specific choice of the relative entropy as the measure of closeness of $p$ to the prior distribution ${\mathsf p}_{0}$ . Other measures of closeness between distributions lead to different forms for the solution. Thus, in some sense, the choice of the measure of closeness is the (dual) counterpart of that of the family of distributions $\mathcal{P}$ in maximum likelihood.

Gibbs distributions form a very rich family. In particular, when X is a subset of a vector space and the features $\Phi_{j}(\mathbf{x})$ associated to $\mathbf{x} =(x_{1}, \ldots, x_{n}) \in{\mathfrak{X}}$ are monomials of degree at most 2 based on the input variables $x_{j}$ , that is $x_{j} x_{k}, \x_{j}$ or the constant $a \in \mathbb{R}$ , then $\mathbf{w} \cdot \pmb{\Phi}(x)$ is a quadratic form as a function of the $x_{j} s$ . Thus, Gibbs distributions include the family of distributions defined by the normalized exponential of a quadratic form, which includes as a special case Gaussian distributions but also bi-modal distributions and normalized exponentials of non-positive definite quadratic forms. More complex multi-modal distributions can be further defined using higher-order monomials or more complex functions of the input variables. Figure 12.1 shows two examples of Gibbs distributions illustrating the richness of this family.

Figure 12.1  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/38333a7dace35e64cc96d515568bebf4d1b0fae6ed17d279e2b7c84a926947e8.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/ea67a6fcda17bcc625978deda0170afb9aff3d19591fcc38e3136a862dace124.jpg)  
(b)  
Examples of Gibbs distributions in $\mathbb{R}^{2}$ . (a) Unimodal Gaussian distribution $p[(x_{1}, x_{2})] ~ =$ $\frac{e^{-(x_{1}^{2} + x_{2}^{2})}}{Z}$ ; (b) Bimodal distribution $p[(x_{1}, x_{2})] = \frac{e^{-(x_{1}^{4} + x_{2}^{4}) + x_{1}^{2} - x_{2}^{2}}}{Z}$ . In each case, Z is a nor malization factor.

## 12.6 Generalization bound

Let $\mathcal{L}_{\mathcal{D}}(\mathbf{w})$ denote the log-loss of the distribution $p_{\mathbf{w}}$ with respect to a distribution D, $\mathcal{L}_{\mathcal{D}}(\mathbf{w}) = \mathbb{E}_{x \sim \mathcal{D}}[- \log{p_{\mathbf{w}}[x]}]$ , and similarly $\mathcal{L}_{S}(\mathbf{w})$ its log-loss with respect to the empirical distribution defined by a sample S.

Theorem 12.3 Fix $\delta > 0$ . Let $\widehat{\bf w}$ be a solution of the optimization (12.12) for $\lambda =$ $2 \Re_{m}(\mathcal{H}) + r \sqrt{\frac{\log \frac{2}{\delta}}{2m}}$ . Then, with probability at least $1 - \delta$ over the draw of an i.i.d. sample S of size m from D, the following inequality holds:

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \inf_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + 2 \| \mathbf{w} \|_{1} \left[2 \Re_{m}(\mathcal{H}) + r \sqrt{\frac{\log \frac{2}{\delta}}{2m}} \right].
$$

Proof: Using the definition of $\mathcal{L}_{\mathcal{D}}(\mathbf{w})$ and $\mathcal{L}_{S}(\mathbf{w})$ , H¨older’s inequality, and inequality (12.5), with probability at least $1 - \delta$ the following holds:

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) - \mathcal{L}_{S}(\widehat{\mathbf{w}}) = \widehat{\mathbf{w}} \cdot[\underset{\widetilde{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] - \underset{\mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}]] \leq \| \widehat{\mathbf{w}} \|_{1} \| \underset{\widetilde{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] - \underset{\mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}] \|_{\infty} \leq \lambda \| \widehat{\mathbf{w}} \|_{1}.
$$

Thus, since $\widehat{\bf w}$ is a minimizer, we can write, for any w,

$$
\begin{array}{rl} &{\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}) = \mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) - \mathcal{L}_{S}(\widehat{\mathbf{w}}) + \mathcal{L}_{S}(\widehat{\mathbf{w}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w})} \\ &{\qquad \leq \lambda \| \widehat{\mathbf{w}} \|_{1} + \mathcal{L}_{S}(\widehat{\mathbf{w}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w})} \\ &{\qquad \leq \lambda \| \mathbf{w} \|_{1} + \mathcal{L}_{S}(\mathbf{w}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}) \leq 2 \lambda \| \mathbf{w} \|_{1},} \end{array}
$$

where we used for the last inequality the left inequality counterpart of inequality (12.5). This concludes the proof. $\square$

Assume that $\mathbf{w}^{*}$ achieves the infimum of the loss, that is $\begin{array}{r}{\mathcal{L}_{\mathcal{D}} \big(\mathbf{w}^{*} \big) = \operatorname{inf}_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w})} \end{array}$ and that $\Re_{m}(\mathcal{H}) =(1 / \sqrt{m})$ . Then, the theorem shows that, with high probability, the following inequality holds:

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \inf_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + O \left(\frac{\| \mathbf{w}^{*} \|_{1}}{\sqrt{m}}\right).
$$

## 12.7 Coordinate descent algorithm

The dual objective function in the optimization (12.12) is convex since the Lagrange dual is always concave (appendix B). Ignoring the constant term $\begin{array}{r}{- \frac{1}{m} \sum_{i = 1}^{m} \log p_{0}[x_{i}]} \end{array}$ the optimization problem (12.12) can be rewritten as in $f_{\mathbf{w}} J(\mathbf{w})$ with

$$
J(\mathbf{w}) = \lambda \| \mathbf{w} \|_{1} - \mathbf{w} \cdot \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] + \log \left[\sum_{x \in \mathcal{X}} p_{0}[x] e^{\mathbf{w} \cdot \boldsymbol{\Phi}(x)} \right].
$$

Note in particular that the function w log $\begin{array}{r}{\big[\sum_{x \in \mathcal{X}} p_{0}[x] e^{\mathbf{w} \cdot \Phi(x)} \big]} \end{array}$ is convex as the conjugate function $f^{*}$ of the function f defined in the proof of Theorem 12.2.

different optimization techniques can be used to solve this convex optimization problem, including standard stochastic gradient descent and several special-purpose techniques. In this section, we will describe a solution based on coordinate descent which is particularly advantageous in presence of a very large number of features.

Function J is not diferentiable but since it is convex, it admits a subdiferential at any point. The Maxent algorithm we describe consists of applying coordinate descent to the objective function (12.12).

Direction Let $\mathbf{w}_{t - 1}$ denote the weight vector defined after $(t - 1)$ iterations. At each iteration $t \in[T]$ , the direction $\mathbf{e}_{j}, j \in[N]$ considered by coordinate descent is $\delta J(\mathbf{w}_{t - 1}, \mathbf{e}_{j})$ . If $w_{t - 1, j} \neq 0$ , then J admits a directional derivative along $\mathbf{e}_{j}$ given by

$$
J^{\prime}(\mathbf{w}_{t - 1}, \mathbf{e}_{j}) = \lambda \mathrm{sgn}(w_{t - 1, j}) + \epsilon_{t - 1, j}.
$$

where $\epsilon_{t - 1, j} = \mathbb{E}_{\mathfrak{p}_{\mathbf{w}_{t - 1}}}[\Phi_{j}] - \mathbb{E}_{\widehat{\mathcal{D}}}[\Phi_{j}]$ . If $w_{t - 1, j} = 0$ , J admits right and left directional derivatives along $\mathbf{e}_{j}$

$$
J_{+}^{\prime}(\mathbf{w}_{t - 1}, \mathbf{e}_{j}) = \lambda + \epsilon_{t - 1, j} J_{-}^{\prime}(\mathbf{w}_{t - 1}, \mathbf{e}_{j}) = - \lambda + \epsilon_{t - 1, j}.
$$

```txt
CDMAXENT(S = (x1, . . . , xm))
1 for t ← 1 to T do
2    for j ← 1 to N do
3    if (wt-1,j ≠ 0) then
4    dj ← λ sgn(wt-1,j) + εt-1,j
5    elseif |εt-1,j| ≤ λ then
6    dj ← 0
7    else dj ← -λ sgn(εt-1,j) + εt-1,j
8    j ← argmax|dj|
j∈[N]
9    if (|wt-1,jr² - εt-1,j| ≤ λ) then
10    η ← -wt-1,j
11    elseif (wt-1,jr² - εt-1,j > λ) then
12    η ← 1/r²[-λ - εt-1,j]
13    else η ← 1/r²[λ - εt-1,j]
14    wt ← wt-1 + ηe_j
15    pwt ← ρ0[x]e^wt·Φ(x)/∑x∈X p0[x]e^wt·Φ(x)
16 return pwt
```

## Figure 12.2

Pseudocode of the Coordinate Descent Maxent algorithm. For all $j \in[N], \epsilon_{t - 1, j} = \mathbb{E}_{\mathbf{p}_{\mathbf{w}_{t - 1}}[\Phi_{j}]} -$ $\mathbb{E}_{\widehat{\mathcal{D}}}[\Phi_{j}]$

Thus, in summary, we can define, for all $j \in[N]$

$$
\delta J(\mathbf{w}_{t - 1}, \mathbf{e}_{j}) = \left\{\begin{array}{ll} \lambda \operatorname{sgn}(w_{t - 1, j}) + \epsilon_{t - 1, j} & \text{if(w_{t - 1,j} \neq 0)} \\ 0 & \text{elseif | \epsilon_{t - 1,j}| \leq\lambda} \\ - \lambda \operatorname{sgn}(\epsilon_{t - 1, j}) + \epsilon_{t - 1, j} & \text{otherwise.} \end{array} \right.
$$

The coordinate descent algorithm selects the direction $\mathbf{e}_{j}$ with the largest absolute value of $\delta J(\mathbf{w}_{t - 1}, \mathbf{e}_{j})$

Step size Given the direction $\mathbf{e}_{j}$ , the optimal step value $\eta$ is given by argmin $J(\mathbf{w}_{t - 1} + \eta \mathbf{e}_{j})$ . η can be found via a line search or other numerical methods. A closed-form expression for the step can also be derived by minimizing an upper bound on $J(\mathbf{w}_{t - 1} + \eta \mathbf{e}_{j})$ . Notice that we can write

$$
J(\mathbf{w}_{t - 1} + \eta \mathbf{e}_{j}) - J(\mathbf{w}_{t - 1}) = \lambda(| w_{j} + \eta | - | w_{j} |) - \eta \underset{S}{\mathbb{E}}[\Phi_{j}] + \log \left[\underset{p_{\mathbf{w}_{t - 1}}}{\mathbb{E}} \left[e^{\eta \Phi_{j}} \right] \right].\tag{12.13}
$$

In view of $\Phi_{j} \in[- r, + r]$ , by Hoefding’s lemma, the following inequality holds:

$$
\log \underset{\mathsf{p_{w}}_{t - 1}}{\mathbb{E}} \left[e^{\eta \Phi_{j}} \right] \leq \eta \underset{\mathsf{p_{w}}_{t - 1}}{\mathbb{E}} \left[\Phi_{j} \right] + \frac{\eta^{2} r^{2}}{2}.
$$

Combining this inequality with (12.13) and disregarding constant terms, minimizing the resulting upper bound on $J(\mathbf{w}_{t - 1} + \eta \mathbf{e}_{j}) - J(\mathbf{w}_{t - 1})$ becomes equivalent to minimizing $\varphi(\eta)$ defined for all $\eta \in \mathbb{R}$ by

$$
\varphi(\eta) = \lambda | w_{j} + \eta | + \eta \epsilon_{t - 1, j} + \frac{\eta^{2} r^{2}}{2}.
$$

Let $\eta^{*}$ denote the minimizer of $\varphi(\eta)$ . If $w_{t - 1, j} + \eta^{*} = 0$ , then the subdiferential of $| w_{t - 1, j} + \eta |$ at $\eta^{*}$ is the set $\{\nu \colon \nu \in[- 1, + 1]\}$ . Thus, in that case, the subdiferential $\partial \varphi(\eta^{*})$ contains 0 if there exists $\nu \in[- 1, + 1]$ such that

$$
\lambda \nu + \epsilon_{t - 1, j} + \eta^{*} r^{2} = 0 \Leftrightarrow w_{t - 1, j} r^{2} - \epsilon_{t - 1, j} = \lambda \nu.
$$

The condition is therefore equivalent to $| w_{t - 1, j} r^{2} - \epsilon_{t - 1, j} | \le \lambda$ . If $w_{t - 1, j} + \eta^{*} > 0$ then $\varphi$ is diferentiable at $\eta^{*}$ and $\varphi^{\prime}(\eta^{*}) = 0$ , that is

$$
\lambda + \epsilon_{t - 1, j} + \eta^{*} r^{2} = 0 \Leftrightarrow \eta^{*} = \frac{1}{r^{2}}[- \lambda - \epsilon_{t - 1, j}].
$$

In view of that expression, the condition $w_{t - 1, j} + \eta^{*} > 0$ is equivalent to $w_{t - 1, j} r^{2} -$ $\epsilon_{t - 1, j} > \lambda$ . Similarly, if $w_{t - 1, j} + \eta^{\ast} < 0,$ , ϕ is diferentiable at $\eta^{*}$ and $\varphi^{\prime}(\eta^{*}) = 0.$ 4 which gives

$$
\eta^{*} = \frac{1}{r^{2}}[\lambda - \epsilon_{t - 1, j}].
$$

Figure 12.2 shows the pseudocode of the Coordinate Descent Maxent algorithm using the closed-form solution for the step size just presented. Note that we do not need to update distribution $p_{\mathbf{w}_{t}}$ at every iteration of the algorithm (line 15) and we only need to be able to compute $\mathbb{E}_{\mathfrak{p}_{\mathbf{w}_{t}}}[\Phi_{j}]$ which defines $\epsilon_{t, j}$ . Various approximation strategies can be used to do this eficiently, including for instance rejection sampling techniques.

## 12.8 Extensions

As already pointed out, the Gibbs distribution form of the Maxent models is tightly related to the choice of the divergence (relative entropy) used to measure closeness in the Maxent principle. For distributions, the relative entropy coincides with the unnormalized relative entropy, which is a Bregman divergence. Maxent models can be generalized by using an arbitrary Bregman divergence $B_{\Psi}$ instead (appendix E), where $\Psi$ is a convex function. Moreover, other norms $\| \cdot \|$ can be used to bound the diference of the empirical and true average feature vectors. This leads to the following general primal optimization problem for Maxent models:

$$
\begin{array}{c} \underset{p \in \Delta}{\min} B_{\Psi}(p \parallel p_{0}) \\ \text{subject to:} \left\| \underset{x \sim p}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] \right\| \leq \lambda, \end{array}\tag{12.14}
$$

which, as with (12.7), is a convex optimization problem since $B_{\Psi}$ is convex with respect to its first argument and in fact strictly convex if Ψ is strictly convex. The following general duality theorem gives the form of the dual problem equivalent to (12.14) in terms of the conjugate function $\Psi^{*}$ of $\Psi.$ . Here, $\| \cdot \|$ is an arbitrary norm over $\mathbb{R}^{N}$ and $\| \cdot \|.$ its conjugate. We will assume here that $\begin{array}{r}{\operatorname{sup}_{x} \| \Phi(x) \| \leq r} \end{array}$

Theorem 12.4 Let Ψ be a convex function defined over $\mathbb{R}^{\mathcal{X}}$ . Then, problem (12.14) admits the following equivalent dual:

$$
\begin{array}{l} \underset{\mathfrak{p} \in \Delta}{\min} B_{\Psi}(\mathfrak{p} \| \mathfrak{p}_{0}) \\ \text{subject to:} \left\| \underset{x \sim \mathfrak{p}}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] \right\| \leq \lambda \\ = \sup_{\mathbf{w} \in \mathbb{R}^{N}} - \Psi^{*}(\mathbf{w} \cdot \boldsymbol{\Phi} + \nabla \Psi(\mathfrak{p}_{0})) + \mathbf{w} \cdot \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] - \lambda \| \mathbf{w} \|_{*} - C(\mathfrak{p}_{0}), \end{array}
$$

where $C({p}_{0}) = \Psi({p}_{0}) - \langle \nabla \Psi({p}_{0}),{p}_{0} \rangle$

Proof: The proof is similar to that of Theorem 12.2 and follows by application of the Fenchel duality theorem (Theorem B.39) to the following optimization problem:

$$
\min_{\mathfrak{p}} f(\mathfrak{p}) + g(A \mathfrak{p}),\tag{12.15}
$$

with the functions $f, g,$ and A defined for all $p \in \mathbb{R}^{\mathcal{X}}$ and $\mathbf{u} \in \mathbb{R}^{N}$ by $f(p) =$ $B_{\Psi}(p \| p_{0}) + I_{\Delta}(p), g(\mathbf{u}) = I_{\mathcal{C}}(\mathbf{u})$ , and $\begin{array}{r}{A p = \sum_{x \in \mathcal{X}} p(x) \Phi(x)} \end{array}$ . Given these definitions, problem (12.15) is equivalent to (12.14). A is a bounded linear map since for any p, we have $\| A p \| \leq \| p \|_{1} \operatorname{sup}_{x} \| \Phi(x) \| \leq r \| p \|_{1}$ . Also, notice that for all $\mathbf{w} \in \mathbb{R}^{N}, A^{*} \mathbf{w} = \mathbf{w} \cdot \pmb{\Phi}$

Consider ${\bf u}_{0} \in \mathbb{R}^{N}$ defined by $\mathbf{u}_{0} = \mathbb{E}_{\boldsymbol{x} \sim \widehat{\boldsymbol{\mathrm{D}}}}[\Phi(\boldsymbol{x})] = A \boldsymbol{\widehat{\mathrm{D}}}$ . Since D is in $\Delta = \operatorname{dom}(f)$ $\mathbf{u}_{0}$ is in $A(\operatorname{dom}(f))$ . Furthermore, since $\lambda > 0,{\bf u}_{0}$ is in int $({\mathcal{C}}).~ g = I_{\mathcal{C}}$ equals zero over int(C) and is therefore continuous over int(C), thus $g$ is continuous at $\mathbf{u}_{0}$ and we have $\mathbf{u}_{0} \in A(\operatorname{dom}(f)) \cap \operatorname{cont}(g)$ . Thus, the assumptions of Theorem B.39 hold.

The conjugate function of f is defined for all $q \in \mathbb{R}^{\mathcal{X}}$ by

$$
\begin{array}{l} f^{*}(\mathfrak{q}) = \sup_{\mathfrak{p}} \langle \mathfrak{p}, \mathfrak{q} \rangle - B_{\Psi}(\mathfrak{p} \| \mathfrak{p}_{0}) - I_{\Delta}(\mathfrak{p}) \\ \quad = \sup_{\mathfrak{p} \in \Delta} \langle \mathfrak{p}, \mathfrak{q} \rangle - B_{\Psi}(\mathfrak{p} \| \mathfrak{p}_{0}) \\ \quad = \sup_{\mathfrak{p} \in \Delta} \langle \mathfrak{p}, \mathfrak{q} \rangle - \Psi(\mathfrak{p}) + \Psi(\mathfrak{p}_{0}) + \langle \nabla \Psi(\mathfrak{p}_{0}), \mathfrak{p} - \mathfrak{p}_{0} \rangle \\ \quad = \sup_{\mathfrak{p} \in \Delta} \langle \mathfrak{p}, \mathfrak{q} + \nabla \Psi(\mathfrak{p}_{0}) \rangle - \Psi(\mathfrak{p}) + \Psi(\mathfrak{p}_{0}) - \langle \nabla \Psi(\mathfrak{p}_{0}), \mathfrak{p}_{0} \rangle \\ \quad = \Psi^{*}(\mathfrak{q} + \nabla \Psi(\mathfrak{p}_{0})) + \Psi(\mathfrak{p}_{0}) - \langle \nabla \Psi(\mathfrak{p}_{0}), \mathfrak{p}_{0} \rangle.\end{array}
$$

The conjugate function of $g = I_{\mathcal{C}}$ is defined for all $\mathbf{w} \in \mathbb{R}^{N}$ by

$$
\begin{array}{l} g^{*}(\mathbf{w}) = \underset{\mathbf{u}}{\sup} \langle \mathbf{w}, \mathbf{u} \rangle - I_{\mathcal{C}}(\mathbf{u}) \\ \qquad = \underset{\mathbf{u} \in \mathcal{C}}{\sup} \langle \mathbf{w}, \mathbf{u} \rangle \\ \qquad = \underset{\| \mathbf{u} - \mathbb{E}_{\widehat{\mathcal{D}}}[\boldsymbol{\Phi}] \| \leq \lambda}{\sup} \langle \mathbf{w}, \mathbf{u} \rangle \\ \qquad = \langle \mathbf{w}, \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] \rangle + \underset{\| \mathbf{u} \| \leq \lambda}{\sup} \langle \mathbf{w}, \mathbf{u} \rangle = \langle \mathbf{w}, \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] \rangle + \lambda \| \mathbf{w} \|_{*}, \end{array}
$$

where the last equality holds by definition of the dual norm. In view of these identities, by Theorem B.39, we have

$$
\begin{array}{l} \min_{\mathfrak{p}} f(\mathfrak{p}) + g(A \mathfrak{p}) = \sup_{\mathbf{w} \in \mathbb{R}^{N}} - f^{*}(A^{*} \mathbf{w}) - g^{*}(\mathbf{w}) \\ \qquad = \sup_{\mathbf{w} \in \mathbb{R}^{N}} - \Psi^{*}(\mathbf{w} \cdot \boldsymbol{\Phi} + \nabla \Psi(\mathfrak{p}_{0})) + \mathbf{w} \cdot \underset{\widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}] - \lambda \| \mathbf{w} \|_{*} \\ \qquad - \Psi(\mathfrak{p}_{0}) + \langle \nabla \Psi(\mathfrak{p}_{0}), \mathfrak{p}_{0} \rangle, \end{array}
$$

which completes the proof.

Note, the previous proof and its use of Fenchel duality holds even when considering norms that are not inner product norms and, more generally, Banach spaces are considered (as mentioned in section B.4).

Much of the analysis and theoretical guarantees presented in previous sections in the special case of the unnormalized relative entropy straightforwardly extend to a broad family of Bregman divergences.

## 12.9 L -regularization

In this section, we study a common variant of the Maxent algorithm where a regularization based on the norm-2 squared of the weight vector w is used. Observe that this is not covered by the general framework discussed in the previous section where the regularization was based on some norm of $\mathbf{w}$ . The corresponding (dual) optimization problem is the following:

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{2}^{2} - \frac{1}{m} \sum_{i = 1}^{m} \log p_{\mathbf{w}}[x_{i}].\tag{12.16}
$$

Let $\mathcal{L}_{\mathcal{D}}(\mathbf{w})$ denote the log-loss of the distribution $p_{\mathbf{w}}$ with respect to a distribution D, $\mathcal{L}_{\mathcal{D}}(\mathbf{w}) = \mathbb{E}_{x \sim \mathcal{D}}[- \log{p_{\mathbf{w}}[x]}]$ , and similarly $\mathcal{L}_{S}(\mathbf{w})$ its log-loss with respect to the empirical distribution defined by a sample S. Then, the algorithm admits the following guarantee.

Theorem 12.5 Let $\widehat{\mathbf{w}}$ be a solution of the optimization problem (12.16). Then, for any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an i.i.d. sample S of size m from D, the following inequality holds:

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \inf_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \lambda \| \mathbf{w} \|_{2}^{2} + \frac{r^{2}}{\lambda m} \left(1 + \sqrt{\log \frac{1}{\delta}}\right)^{2}.
$$

Proof: Let $\widehat{D}$ denote the empirical distribution defined by the sample S. Then, the optimization problem (12.16) can be formulated as follows:

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{2}^{2} - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\log p_{\mathbf{w}}[x] \right] = \lambda \| \mathbf{w} \|_{2}^{2} - \mathbf{w} \cdot \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}} \left[\Phi(x) \right] + \log Z(\mathbf{w}),
$$

where $\begin{array}{r}{Z(\mathbf{w}) = \big(\sum_{x} \exp(\mathbf{w} \cdot \Phi(x)) \big)} \end{array}$ . Similarly, let ${\bf w}_{\mathrm{2D}}$ denote the solution of the minimization problem with the distribution D:

$$
\min_{\mathbf{w} \in \mathbb{R}^{N}} \lambda \| \mathbf{w} \|_{2}^{2} - \underset{x \sim \mathcal{D}}{\mathbb{E}} \left[\log p_{\mathbf{w}}[x] \right] = \lambda \| \mathbf{w} \|_{2}^{2} - \mathbf{w} \cdot \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] + \log Z(\mathbf{w}).
$$

We first give an upper-bound on $\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}})$ valid for all $\mathbf{w} \in \mathbb{R}^{N}$ , starting with a decomposition of $\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}})$ as a sum of terms, next using the expression of $\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) - \mathcal{L}_{S}(\widehat{\mathbf{w}})$ in terms of average feature values, then the optimality of $\widehat{\mathbf{w}}$ , next the expression of $\mathcal{L}_{S}(\mathbf{w}_{\mathcal{D}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}})$ in terms of average feature values, and finally the Cauchy-Schwarz inequality and the optimality of ${\bf w}_{\mathrm{2D}}$ :

$$
\begin{array}{rl} &{\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}})} \\ &{= \mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) - \mathcal{L}_{S}(\widehat{\mathbf{w}}) + \mathcal{L}_{S}(\widehat{\mathbf{w}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \lambda \| \widehat{\mathbf{w}} \|_{2}^{2} - \lambda \| \widehat{\mathbf{w}} \|_{2}^{2}} \\ &{= \widehat{\mathbf{w}} \cdot \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] + \mathcal{L}_{S}(\widehat{\mathbf{w}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \lambda \| \widehat{\mathbf{w}} \|_{2}^{2} + \lambda \| \widehat{\mathbf{w}} \|_{2}^{2}} \\ &{\leq \widehat{\mathbf{w}} \cdot \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] + \mathcal{L}_{S}(\mathbf{w}_{\mathcal{D}}) - \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \lambda \| \mathbf{w}_{\mathcal{D}} \|_{2}^{2} - \lambda \| \widehat{\mathbf{w}} \|_{2}^{2}} \\ &{\leq[\widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}}] \cdot \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] + \mathcal{L}_{\mathcal{D}}(\mathbf{w}_{\mathcal{D}}) + \lambda \| \mathbf{w}_{\mathcal{D}} \|_{2}^{2} - \lambda \| \widehat{\mathbf{w}} \|_{2}^{2}} \\ &{\leq \| \widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}} \|_{2} \left\| \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right\|_{2} + \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \lambda \| \mathbf{w} \|_{2}^{2}.} \end{array}
$$

Next, we bound $\| \widehat{\mathbf{w}} - \mathbf{w}_{\mathrm{2}} \|_{2}$ using the fact that $\widehat{\bf w}$ and ${\bf w}_{\mathrm{2}}$ are solutions of the minimization of convex and diferentiable objectives functions, whose gradients must be zero at the minimizing values:

$$
\begin{array}{rl} & 2 \lambda \widehat{\mathbf{w}} - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] + \nabla \log Z(\widehat{\mathbf{w}}) = 0 \\ & 2 \lambda \mathbf{w}_{\mathcal{D}} - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] + \nabla \log Z(\mathbf{w}_{\mathcal{D}}) = 0, \end{array}
$$

which implies

$$
2 \lambda(\widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}}) = \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] + \nabla \log Z(\mathbf{w}_{\mathcal{D}}) - \nabla \log Z(\widehat{\mathbf{w}}).
$$

Multiplying both sides by $\left(\widehat{\mathbf{w}} - \mathbf{w}_{\mathbf{\mathcal{D}}} \right)$ gives

$$
\begin{array}{rl} &{2 \lambda \| \widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}} \|_{2}^{2}} \\ &{= \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] \cdot[\widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}}] -[\nabla \log Z(\widehat{\mathbf{w}}) - \nabla \log Z(\mathbf{w}_{\mathcal{D}})] \cdot[\widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}}]} \\ &{\leq \left[\underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\boldsymbol{\Phi}(x)] \right] \cdot[\widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}}],} \end{array}
$$

in view of the convexity of $\mathbf{w} \mapsto$ log $Z(\mathbf{w})$ . Using the Cauchy-Schwarz inequality and simplifying, we obtain

$$
\| \widehat{\mathbf{w}} - \mathbf{w}_{\mathcal{D}} \|_{2} \leq \frac{\left\| \mathbb{E}_{x \sim \widehat{\mathcal{D}}}[\boldsymbol{\Phi}(x)] - \mathbb{E}_{x \sim \mathcal{D}}[\boldsymbol{\Phi}(x)] \right\|_{2}}{2 \lambda}.
$$

Plugging this back in the upper bound previously derived for $\mathcal{L}_{\mathfrak{D}}(\widehat{\mathbf{w}})$ yields

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \frac{\left\| \mathbb{E}_{x \sim \widehat{\mathcal{D}}}[\boldsymbol{\Phi}(x)] - \mathbb{E}_{x \sim \mathcal{D}}[\boldsymbol{\Phi}(x)] \right\|_{2}^{2}}{2 \lambda} + \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \lambda \| \mathbf{w} \|_{2}^{2}.
$$

We now use McDiarmid’s inequality to bound $\begin{array}{r}{\Big \| \mathbb{E}_{{x} \sim \widehat{\mathfrak{D}}}[\Phi({x})] - \mathbb{E}_{{x} \sim \mathcal{D}}[\Phi({x})] \Big \|_{2}} \end{array}$ . Let $\Psi(S)$ denote this quantity for a sample S. Let $S^{\prime}$ be a sample difering from S by one point, say $x_{m}$ for $S, x_{m}^{\prime}$ for $S^{\prime}$ . Then, by the triangle inequality,

$$
\begin{array}{rl} &{| \Psi(S^{\prime}) - \Psi(S) | = \left| \left\| \underset{x \sim \widehat{\mathcal{D}}^{\prime}}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\Phi(x)] \right\|_{2} - \left\| \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \mathcal{D}}{\mathbb{E}}[\Phi(x)] \right\|_{2} \right|} \\ &{\qquad \leq \left\| \underset{x \sim \widehat{\mathcal{D}}^{\prime}}{\mathbb{E}}[\Phi(x)] - \underset{x \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\Phi(x)] \right\|_{2}} \\ &{\qquad \leq \left\| \frac{\Phi(x_{m}^{\prime}) - \Phi(x_{m})}{m} \right\|_{2} \leq \frac{2r}{m}.} \end{array}
$$

Thus, for any $\delta > 0$ , with probability at least $1 - \delta.$ , the following inequality holds

$$
\Psi(S) \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\Psi(S)] + 2r \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

For any $i \in[m]$ , let $\mathbf{Z}_{i}$ denote the random variable $\mathbb{E}_{{x} \sim \widehat{\mathcal{D}}}[\pmb{\Phi}({x}_{i})] - \mathbb{E}_{{x} \sim \mathcal{D}}[\pmb{\Phi}({x})]$ Then, by Jensen’s inequality, $\mathbb{E}_{S \sim \mathcal{D}^{m}}[\Psi(S)]$ can be upper-bounded as follows:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\Psi(S)] = \mathbb{E} \left[\left\| \frac{1}{m} \sum_{i = 1}^{m} \mathbf{Z}_{i} \right\|_{2} \right] \leq \sqrt{\mathbb{E} \left[\left\| \frac{1}{m} \sum_{i = 1}^{m} \mathbf{Z}_{i} \right\|_{2}^{2} \right]}.
$$

Since the random variables $\mathbf{Z}_{i} s$ are i.i.d. and centered $\left(\mathbb{E}[\mathbf{Z}_{i}] = 0 \right)$ , we have

$$
\begin{array}{rl} &{\mathbb{E} \left[\left\| \frac{1}{m} \sum_{i = 1}^{m} \mathbf{Z}_{i} \right\|^{2} \right] = \frac{1}{m^{2}} \bigg[\sum_{i = 1}^{m} \mathbb{E} \left[\| \mathbf{Z}_{i} \|^{2} \right] + \sum_{i \neq j} \mathbb{E}[\mathbf{Z}_{i}] \cdot \mathbb{E}[\mathbf{Z}_{j}] \bigg]} \\ &{\qquad = \frac{\mathbb{E} \left[\| \mathbf{Z}_{1} \|^{2} \right]}{m}} \\ &{\qquad = \frac{\mathbb{E} \left[\| \mathbf{Z}_{1} \|^{2} + \| \mathbf{Z}_{2} \|^{2} \right]}{2m}} \\ &{\qquad = \frac{\mathbb{E} \left[\| \mathbf{Z}_{1} - \mathbf{Z}_{2} \|^{2} \right]}{2m}.} \end{array}
$$

where, for the last equality, we used the fact that $\mathbb{E}[\mathbf{Z}_{1} \cdot \mathbf{Z}_{2}] = \mathbb{E}[\mathbf{Z}_{1}] \cdot \mathbb{E}[\mathbf{Z}_{2}] = 0$ . This shows that $\begin{array}{r}{\mathbb{E}[\Psi(S)] \le \frac{2r}{\sqrt{2m}}} \end{array}$ and that, with probability at least $1 - \delta$ , the following holds

$$
\Psi(S) \leq \frac{2r}{\sqrt{2m}} \bigg(1 + \sqrt{\log \frac{1}{\delta}} \bigg),
$$

and therefore also

$$
\begin{array}{l} \mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \frac{1}{2 \lambda} \frac{2r^{2}}{m} \bigg(1 + \sqrt{\log \frac{1}{\delta}} \bigg)^{2} + \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \lambda \| \mathbf{w} \|_{2}^{2} \\ \quad \leq \frac{r^{2}}{\lambda m} \bigg(1 + \sqrt{\log \frac{1}{\delta}} \bigg)^{2} + \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \lambda \| \mathbf{w} \|_{2}^{2}, \end{array}
$$

which ends the proof.

Assume that $\mathbf{w}^{*}$ achieves the infimum of the loss, that is $\begin{array}{r}{\mathcal{L}_{\mathcal{D}} \big(\mathbf{w}^{*} \big) = \operatorname{inf}_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w})} \end{array}$ and that we are given an upper bound $\Lambda_{2}$ on its norm: $\lVert \mathbf{w}^{*} \rVert_{2} \leq \Lambda_{2}$ . Then, we can use that upper bound and choose $\lambda$ to minimize the two terms containing λ: $\begin{array}{r}{\lambda \Lambda_{2}^{2} = \frac{r^{2}}{\lambda m}} \end{array}$ , that is $\begin{array}{r}{\lambda = \frac{r}{\Lambda_{2} \sqrt{m}}} \end{array}$ and the theorem would then guarantee the following inequality with probability $1 - \delta$ for $\widehat{\mathbf{w}}$ :

$$
\mathcal{L}_{\mathcal{D}}(\widehat{\mathbf{w}}) \leq \inf_{\mathbf{w}} \mathcal{L}_{\mathcal{D}}(\mathbf{w}) + \frac{r \Lambda_{2}}{\sqrt{m}} \left[1 + \left(1 + \sqrt{\log \frac{1}{\delta}}\right)^{2} \right].
$$

## 12.10 Chapter notes

The Maxent principle was first explicitly advocated by Jaynes [1957] (see also Jaynes [1983]) who referred to Shannon’s notion of entropy (appendix E) to support this principle. As seen in Section 12.5, standard Maxent models coincide with Gibbs distributions, as in the original Boltzmann models in statistical mechanics. In fact, Jaynes [1957] argued that statistical mechanics could be viewed as a form of statistical inference, as opposed to a physical theory, and that the thermodynamic notion of entropy could be replaced by the information-theoretical notion. The justification of the Maxent principle presented in this chapter is instead based upon learning theory arguments.

Maximum entropy models, commonly referred to as Maxent models, are used in a variety of tasks in natural language processing [Berger et al., 1996, Rosenfeld, 1996, Pietra et al., 1997, Malouf, 2002, Manning and Klein, 2003, Ratnaparkhi, 2010] and in many other applications, including species habitat modeling [Phillips et al., 2004, 2006, Dud´ık et al., 2007, Elith et al., 2011]. One key benefit of Maxent models is that they allow the use of diverse features that can be selected and augmented by the user. The richness of the features used in many tasks as well as small sample sizes have motivated the use of regularized Maxent models where the $L_{\mathrm{1}} \mathrm{- norm}$ [Kazama and Tsujii, 2003] or the $L_{\mathrm{{2}}} \mathrm{{- norm}}$ [Chen and Rosenfeld, 2000, Lebanon and Laferty, 2001] of the parameter vector defining the Gibbs distribution is controlled. This can be shown to be equivalent to the introduction of a Laplacian or Gaussian prior over the parameter vectors in a Bayesian interpretation [Williams, 1994, Goodman, 2004], thereby making Maxent models coincide with Maximum a Posteriori solutions with specific choices of the prior.

An extensive theoretical study of these regularizations and the introduction of other more general ones were given by Dud´ık, Phillips, and Schapire [2007] and by Altun and Smola [2006] who studied the extensions to arbitrary Bregman divergences and norms (Section 12.8) using Fenchel duality (see also [Laferty, Pietra, and Pietra, 1997]). Cortes, Kuznetsov, Mohri, and Syed [2015] give a more general family of density estimation models, Structural Maxent models, with feature functions selected from a union of possibly very complex sub-families for which they also give a duality theorem, strong learning guarantees, and algorithms. These models can also be viewed as Maxent with a more general type of regularization.

The Maxent duality theorem is due to Pietra, Pietra, and Laferty [1997] (see also [Dud´ık et al., 2007] and [Altun and Smola, 2006]). Theorem 12.2 is a slight extension giving a guarantee for an $\epsilon$-solution of the dual and is a special instance of a more general theorem given for Structural Maxent models [Cortes et al., 2015]. The generalization bounds of Sections 12.6 and 12.9 and their proofs are variants of results due to Dud´ık et al. [2007]. The stability analysis used in the proof of Theorem 12.5 is equivalent to the one described in Chapter 14 using Bregman divergences.

A variety of different techniques have been suggested to solve the Maxent optimization problem including standard gradient descent and stochastic gradient descent. Some specific algorithms were introduced for this problem, including generalized iterative scaling (GIS) [Darroch and Ratclif, 1972] and improved iterative scaling (IIS) [Pietra et al., 1997]. It was shown by Malouf [2002] that these algorithms perform poorly in several natural language processing tasks in comparison with conjugate gradient techniques and limited-memory BFGS methods (see also [Andrew and Gao, 2007]). The coordinate descent solution presented in this chapter is due to Cortes et al. [2015]. It is a simpler version of an algorithm of Dud´ık et al. [2007] which uses a tighter upper bound on $J(\mathbf{w}_{t - 1} + \eta \mathbf{e}_{j})$ but which is subject to various technical conditions. Both algorithms benefit from a similar asymptotic convergence rate [Cortes et al., 2015] and are particularly adapted to cases where the number of features is very large and where updating all feature weights is impractical. A sequential greedy approximation due to Zhang [2003b] is also advocated by Altun and Smola [2006] as a general algorithm for general forms of the Maxent problem.

## 12.11 Exercises

12.1 Convexity. Prove directly that the function $\begin{array}{r}{\mathbf{w} \mapsto \log Z(\mathbf{w}) = \log(\sum_{x \in \mathcal{X}} e^{\mathbf{w} \cdot \Phi(x)})} \end{array}$ is convex (Hint: compute its Hessian).

12.2 Lagrange duality. Derive the dual problem of the Maxent problem and justify it carefully in the case of the stricter constraint of positivity for the distribution p: $p(x) > 0$ for all $x \in{\mathfrak{X}}$

12.3 Dual of norm-2 squared regularized Maxent. Derive the dual formulation of the norm-2 squared regularized Maxent optimization shown in equation (12.16).

12.4 Extension to Bregman divergences. Derive theoretical guarantees for the extensions discussed in Section 12.8. What additional property is needed for the Bregman divergence so that your learning guarantees hold?

12.5 L -regularization. Let w be the solution of Maxent with a norm-2 squared regularization.

(a) Prove the following inequality: $\begin{array}{r}{\left\| \mathbf{w} \right\|_{2} \leq ~ \frac{2r}{\lambda}} \end{array}$ (Hint: you could compare the values of the objective function at w and 0.). Generalize this result to other <sup>p</sup>-regularizations with $p > 1$

(b) Use the previous question to derive an explicit learning guarantee for Maxent with norm-2 squared regularization (Hint: you could use the last inequality given in Section 12.9 and derive an explicit expression for $\boldsymbol{\Lambda}_{2})$

#

This chapter presents algorithms for estimating the conditional probability of a class given an example, rather than only predicting the class label for that example. This is motivated by several applications where confidence values are sought, in addition to the class prediction. The algorithms discussed, conditional Maxent models, also known as multinomial logistic regression algorithms, are among the most well-known and most widely used multi-class classification algorithms. In the special case of two classes, the algorithm is known as logistic regression.

As suggested by their name, these algorithms can be viewed as Maxent models for conditional probabilities. To introduce them, we will extend the ideas discussed in the previous chapter (Chapter 12), starting from an extension of the Maxent principle to the conditional case. Next, we will prove a duality theorem leading to an equivalent dual optimization problem for conditional Maxent. We will specifically discuss different aspects of multi-class classification using conditional Maxent and reserve a special section to the analysis of logistic regression.


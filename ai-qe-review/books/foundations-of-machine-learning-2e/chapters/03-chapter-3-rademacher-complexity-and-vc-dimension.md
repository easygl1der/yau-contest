---
title: "Chapter 3 \u2014 Rademacher Complexity and VC-Dimension"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 3
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 940
source_line_end: 1799
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 9
source_empty_image_alt: 9
non_semantic_image_alt: 4
caption_derived_image_alt: 5
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 13
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 3 — Rademacher Complexity and VC-Dimension

> [[../README|本书目录]] · [[02-chapter-2-the-pac-learning-framework|上一章]] · [[04-chapter-4-model-selection|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 940–1799。
> - 本章保留 9 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.66) × 1；PDF-confirmed book-specific control-codepoint pattern × 12；different × 4；sufficient × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 3.1 Rademacher complexity

We will continue to use H to denote a hypothesis set as in the previous chapters. Many of the results of this section are general and hold for an arbitrary loss function $L \colon \mathcal{Y} \times \mathcal{Y} \mathbb{R}$ . In what follows, G will generally be interpreted as the family of loss functions associated to H mapping from $\mathcal{Z} = \mathcal{X} \times \mathcal{Y}$ to <sup>R</sup>:

$$
\mathcal{G} = \{g \colon(x, y) \mapsto L(h(x), y) \colon h \in \mathcal{H}\}.
$$

However, the definitions are given in the general case of a family of functions G mapping from an arbitrary input space Z to <sup>R</sup>.

The Rademacher complexity captures the richness of a family of functions by measuring the degree to which a hypothesis set can fit random noise. The following states the formal definitions of the empirical and average Rademacher complexity.

Definition 3.1 (Empirical Rademacher complexity) Let G be a family of functions mapping from Z to $[a, b]$ and $S =(z_{1}, \dots, z_{m})$ a fixed sample of size m with elements in Z. Then, the empirical Rademacher complexity of G with respect to the sample S is defined as:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{G}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} g(z_{i}) \right],\tag{3.1}
$$

where $\pmb{\sigma} =(\sigma_{1}, \ldots, \sigma_{m})^{\top}$ , with $\sigma_{i} s$ independent uniform random variables taking values in $\{- 1, + 1\}.^{3}$ The random variables $\sigma_{i}$ are called Rademacher variables.

Let g<sub>S</sub> denote the vector of values taken by function g over the sample $S \colon{\bf g}_{S} =$ $(g(z_{1}), \ldots, g(z_{m}))^{\top}$ . Then, the empirical Rademacher complexity can be rewritten as

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{G}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{\boldsymbol{igma} \cdot \mathbf{g}_{S}}{m} \right].
$$

The inner product $\pmb{\sigma} \cdot \mathbf{g}_{S}$ measures the correlation of g with the vector of random noise $\sigma.$ . The supremum $\operatorname{sup}_{g \in{\mathcal{G}}}{\frac{\pmb{\sigma} \cdot \mathbf{g}_{S}}{m}}$ is a measure of how well the function class G correlates with $\sigma$ over the sample S. Thus, the empirical Rademacher complexity measures on average how well the function class $\mathcal{G}$ correlates with random noise on $S.$ This describes the richness of the family ${\mathcal{G}} \colon$ richer or more complex families G can generate more vectors g and thus better correlate with random noise, on average.

Definition 3.2 (Rademacher complexity) Let D denote the distribution according to which samples are drawn. For any integer m $\geq 1$ , the Rademacher complexity of G is the expectation of the empirical Rademacher complexity over all samples of size m drawn according to D:

$$
\mathfrak{R}_{m}(\mathcal{G}) = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\widehat{\mathfrak{R}}_{S}(\mathcal{G})].\tag{3.2}
$$

We are now ready to present our first generalization bounds based on Rademacher complexity.

Theorem 3.3 Let G be a family of functions mapping from Z to $[0, 1]$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an i.i.d. sample S of size $m,$ each of the following holds for all $g \in{\mathcal{G}}$

$$
\mathbb{E}[g(z)] \leq \frac{1}{m} \sum_{i = 1}^{m} g(z_{i}) + 2 \Re_{m}(\mathcal{G}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}\tag{3.3}
$$

$$
\text{and} \quad \mathbb{E}[g(z)] \leq \frac{1}{m} \sum_{i = 1}^{m} g(z_{i}) + 2 \widehat{\mathfrak{R}}_{S}(\mathcal{G}) + 3 \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{3.4}
$$

Proof: For any sample $S =(z_{1}, \dots, z_{m})$ and any $g \in{\mathcal{G}}$ , we denote by ${\widehat{\mathbb E}}_{S}[g]$ the empirical average of $g$ over S: $\begin{array}{r}{\widehat{\mathbb{E}}_{S}[g] = \frac{1}{m} \sum_{i = 1}^{m} g(z_{i})} \end{array}$ . The proof consists of applying McDiarmid’s inequality to function Φ defined for any sample $S$ by

$$
\Phi(S) = \sup_{g \in \mathcal{G}} \Big(\mathbb{E}[g] - \widehat{\mathbb{E}}_{S}[g] \Big).\tag{3.5}
$$

Let $S$ and $S^{\prime}$ be two samples difering by exactly one point, say $z_{m}$ in $S$ and $z_{m}^{\prime}$ in $S^{\prime}$ . Then, since the diference of suprema does not exceed the supremum of the diference, we have

$$
\Phi(S^{\prime}) - \Phi(S) \leq \sup_{g \in \mathcal{G}} \left(\widehat{\mathbb{E}}_{S}[g] - \widehat{\mathbb{E}}_{S^{\prime}}[g]\right) = \sup_{g \in \mathcal{G}} \frac{g(z_{m}) - g(z_{m}^{\prime})}{m} \leq \frac{1}{m}.\tag{3.6}
$$

Similarly, we can obtain $\Phi(S) - \Phi(S^{\prime}) \leq 1 / m$ , thus $| \Phi(S) - \Phi(S^{\prime}) | \leq 1 / m$ . Then, by McDiarmid’s inequality, for any $\delta > 0$ , with probability at least $1 - \delta / 2$ , the following holds:

$$
\Phi(S) \leq \underset{S}{\mathbb{E}}[\Phi(S)] + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{3.7}
$$

We next bound the expectation of the right-hand side as follows:

$$
\begin{array}{r} \underset{S}{\mathbb{E}}[\Phi(S)] = \underset{S}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \left(\mathbb{E}[g] - \widehat{\mathbb{E}}_{S}(g)\right) \right] \\ = \underset{S}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \underset{S^{\prime}}{\mathbb{E}} \left[\widehat{\mathbb{E}}_{S^{\prime}}(g) - \widehat{\mathbb{E}}_{S}(g) \right] \right] \end{array}\tag{3.8}
$$

$$
\leq \underset{S, S^{\prime}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \left(\widehat{\mathbb{E}}_{S^{\prime}}(g) - \widehat{\mathbb{E}}_{S}(g)\right) \right]\tag{3.9}
$$

$$
= \underset{S, S^{\prime}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m}(g(z_{i}^{\prime}) - g(z_{i})) \right]\tag{3.10}
$$

$$
= \underset{\pmb{\sigma}, S, S^{\prime}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i}(g(z_{i}^{\prime}) - g(z_{i})) \right]\tag{3.11}
$$

$$
\leq \underset{\boldsymbol{igma}, S^{\prime}}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} g(z_{i}^{\prime}) \right] + \underset{\boldsymbol{igma}, S}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m} - \sigma_{i} g(z_{i}) \right]\tag{3.12}
$$

$$
= 2 \underset{\pmb{\sigma}, S}{\mathbb{E}} \left[\sup_{g \in \mathcal{G}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} g(z_{i}) \right] = 2 \Re_{m}(\mathcal{G}).\tag{3.13}
$$

Equation (3.8) uses the fact that points in $S^{\prime}$ are sampled in an i.i.d. fashion and thus $\mathbb{E}[g] = \mathbb{E}_{S^{\prime}}[\widehat{\mathbb{E}}_{S^{\prime}}(g)]$ , as in (2.3). Inequality 3.9 holds due to the sub-additivity of the supremum function.

In equation (3.11), we introduce Rademacher variables $\sigma_{i}$ , which are uniformly distributed independent random variables taking values in $\{- 1, + 1\}$ as in definition 3.2. This does not change the expectation appearing in (3.10): when $\sigma_{i} = 1$ , the associated summand remains unchanged; when $\sigma_{i} = - 1$ , the associated summand flips signs, which is equivalent to swapping $z_{i}$ and $z_{i}^{\prime}$ between $S$ and $S^{\prime}$ . Since we are taking the expectation over all possible $S$ and $S^{\prime}$ , this swap does not afect the overall expectation; we are simply changing the order of the summands within the expectation.

Equation (3.12) holds by the sub-additivity of the supremum function, that is the inequality sup $\operatorname{\rho}(U + V) \leq \operatorname{sup}(U) + \operatorname{sup}(V)$ . Finally, (3.13) stems from the definition of Rademacher complexity and the fact that the variables $\sigma_{i}$ and $- \sigma_{i}$ are distributed in the same way.

The reduction to $\Re_{m}(\mathcal{G})$ in equation (3.13) yields the bound in equation (3.3), using $\delta$ instead of $\delta / 2$ . To derive a bound in terms of ${\widehat{\mathfrak{R}}}_{S}({\mathfrak{G}})$ , we observe that, by definition 3.1, changing one point in $S$ changes ${\widehat{\mathfrak{R}}}_{S}({\mathfrak{G}})$ by at most $1 / m$ . Then, using again McDiarmid’s inequality, with probability $1 - \delta / 2$ the following holds:

$$
\mathfrak{R}_{m}(\mathcal{G}) \leq \widehat{\mathfrak{R}}_{S}(\mathcal{G}) + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{3.14}
$$

Finally, we use the union bound to combine inequalities 3.7 and 3.14, which yields with probability at least $1 - \delta \colon$

$$
\Phi(S) \leq 2 \widehat{\mathfrak{R}}_{S}(\mathcal{G}) + 3 \sqrt{\frac{\log \frac{2}{\delta}}{2m}},\tag{3.15}
$$

which matches (3.4).

The following result relates the empirical Rademacher complexities of a hypothesis set H and to the family of loss functions G associated to H in the case of binary loss (zero-one loss).

Lemma 3.4 Let H be a family of functions taking values in $\{- 1, + 1\}$ and let G be the family of loss functions associated to H for the zero-one loss: $\mathcal{G} = \{(x, y) \mapsto$ $1_{h(x) \neq y} \colon h \in{\mathcal{H}}\}$ . For any sample $S \ = \((x_{1}, y_{1}), \ldots,(x_{m}, y_{m}))$ of elements in ${\mathcal{X}} \times \{- 1, + 1\}$ , let $Sx$ denote its projection over X: $Sx \ = \(x_{1}, \ldots, x_{m})$ Then, the following relation holds between the empirical Rademacher complexities of G and H: 1

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{G}) = \frac{1}{2} \widehat{\mathfrak{R}}_{S_{\mathcal{X}}}(\mathcal{H}).\tag{3.16}
$$

Proof: For any sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ of elements in ${\mathcal{X}} \times \{- 1, + 1\}$ by definition, the empirical Rademacher complexity of G can be written as:

$$
\begin{array}{l} \widehat{\mathfrak{R}}_{S}(\mathcal{G}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \Big[\sup_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} 1_{h(x_{i}) \neq y_{i}} \Big] \\ \qquad = \underset{\boldsymbol{igma}}{\mathbb{E}} \Big[\sup_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} \frac{1 - y_{i} h(x_{i})}{2} \Big] \\ \qquad = \frac{1}{2} \underset{\boldsymbol{igma}}{\mathbb{E}} \Big[\sup_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} - \sigma_{i} y_{i} h(x_{i}) \Big] \\ \qquad = \frac{1}{2} \underset{\boldsymbol{igma}}{\mathbb{E}} \Big[\sup_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \Big] = \frac{1}{2} \widehat{\mathfrak{R}}_{S_{\mathcal{X}}}(\mathcal{H}), \end{array}
$$

where we used the fact that $1_{h(x_{i}) \neq y_{i}} =(1 - y_{i} h(x_{i})) / 2$ and the fact that for a fixed $y_{i} \in \{- 1, + 1\}, \sigma_{i}$ and $- y_{i} \sigma_{i}$ are distributed in the same way. $\square$

Note that the lemma implies, by taking expectations, that for any $m \geq 1, \Re_{m}(\mathcal{G}) =$ $ { \frac { 1 } { 2 } } \mathfrak { R } _ { m } ( \mathcal { H } )$ . These connections between the empirical and average Rademacher complexities can be used to derive generalization bounds for binary classification in terms of the Rademacher complexity of the hypothesis set H.

Theorem 3.5 (Rademacher complexity bounds – binary classification ) Let H be a family of functions taking values in $\{- 1, + 1\}$ and let D be the distribution over the input space X. Then, for any $\delta > 0$ , with probability at least $1 - \delta$ over a sample S of size m drawn according to D, each of the following holds for any $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S}(h) + \mathfrak{R}_{m}(\mathcal{H}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}\tag{3.17}
$$

$$
{and}{R(h) \leq \widehat{R}_{S}(h) + \widehat{\mathfrak{R}}_{S}(\mathcal{H}) + 3 \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.}\tag{3.18}
$$

Proof: The result follows immediately by theorem 3.3 and lemma 3.4.

The theorem provides two generalization bounds for binary classification based on the Rademacher complexity. Note that the second bound, (3.18), is data-dependent: the empirical Rademacher complexity $\widehat{\Re}_{S}(\mathcal{H})$ is a function of the specific sample S drawn. Thus, this bound could be particularly informative if we could compute $\widehat{\Re}_{S}(\mathcal{H})$ . But, how can we compute the empirical Rademacher complexity? Using again the fact that $\sigma_{i}$ and $- \sigma_{i}$ are distributed in the same way, we can write

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} - \sigma_{i} h(x_{i}) \right] = - \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\inf_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \right].
$$

Now, for a fixed value of $\sigma,$ computing in $\begin{array}{r}{\dot{\mathbf{\Omega}}_{h \in \mathcal{H}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} h(x_{i})} \end{array}$ is equivalent to an empirical risk minimization problem, which is known to be computationally hard for some hypothesis sets. Thus, in some cases, computing $\widehat{\Re}_{S}(\mathcal{H})$ could be computationally hard. In the next sections, we will relate the Rademacher complexity to combinatorial measures that are easier to compute and also of independent interest for their usefulness in the analysis of learning in many contexts.

## 3.2 Growth function

Here we will show how the Rademacher complexity can be bounded in terms of the growth function.

Definition 3.6 (Growth function) The growth function $\Pi_{\mathcal{H}} \colon \mathbb{N} \mathbb{N}$ for a hypothesis set H is defined by:

$$
\forall m \in \mathbb{N}, \Pi_{\mathcal{H}}(m) = \max_{\{x_{1}, \ldots, x_{m}\} \subseteq X} \Big | \big \{\big(h(x_{1}), \ldots, h(x_{m}) \big) \colon h \in \mathcal{H} \big\} \Big |.\tag{3.19}
$$

In other words, $\Pi_{\mathcal{H}}(m)$ is the maximum number of distinct ways in which m points can be classified using hypotheses in H. Each one of these distinct classifications is called a dichotomy and, thus, the growth function counts the number of dichotomies that are realized by the hypothesis. This provides another measure of the richness of the hypothesis set H. However, unlike the Rademacher complexity, this measure does not depend on the distribution, it is purely combinatorial.

To relate the Rademacher complexity to the growth function, we will use Massart’s lemma.

Theorem 3.7 (Massart’s lemma) Let ${\mathcal{A}} \subseteq \mathbb{R}^{m}$ be a finite set, with $r = \operatorname{max}_{\mathbf{x} \in \mathcal{A}} \| \mathbf{x} \|_{2}$ then the following holds:

$$
\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\frac{1}{m} \sup_{\mathbf{x} \in \mathcal{A}} \sum_{i = 1}^{m} \sigma_{i} x_{i} \right] \leq \frac{r \sqrt{2 \log | \mathcal{A} |}}{m},\tag{3.20}
$$

where $\sigma_{i} s$ are independent uniform random variables taking values in $\{- 1, + 1\}$ and $x_{1}, \ldots, x_{m}$ are the components of vector x.

Proof: The result follows immediately from the bound on the expectation of a maximum given by Corollary D.11 since the random variables $\sigma_{i} x_{i}$ are independent and each $\sigma_{i} x_{i}$ takes values in $[- | x_{i} |, | x_{i} |]$ with $\textstyle{\sqrt{\sum_{i = 1}^{m} x_{i}^{2}}} \leq r^{2}$ $\square$

Using this result, we can now bound the Rademacher complexity in terms of the growth function.

Corollary 3.8 Let G be a family of functions taking values in $\{- 1, + 1\}$ . Then the following holds:

$$
\mathfrak{R}_{m}(\mathcal{G}) \leq \sqrt{\frac{2 \log \Pi_{\mathcal{G}}(m)}{m}}.\tag{3.21}
$$

Proof: For a fixed sample $S = ( x _ { 1 } , \dots , x _ { m } ) $ , we denote by $\mathcal{G}_{\vert S}$ the set of vectors of function values $(g(x_{1}), \ldots, g(x_{m}))^{\top}$ where g is in G. Since $g \in{\mathcal{G}}$ takes values in $\{- 1, + 1\}$ , the norm of these vectors is bounded by $\sqrt{m}$ . We can then apply Massart’s lemma as follows:

$$
\mathfrak{R}_{m}(\mathcal{G}) = \underset{S}{\mathbb{E}} \left[\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{u \in \mathcal{G}_{| S}} \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i} u_{i} \right] \right] \leq \underset{S}{\mathbb{E}} \left[\frac{\sqrt{m} \sqrt{2 \log | \mathcal{G}_{| S} |}}{m} \right].
$$

By definition, $| \mathcal{G}_{| S} |$ is bounded by the growth function, thus,

$$
\mathfrak{R}_{m}(\mathcal{G}) \leq \underset{S}{\mathbb{E}} \left[\frac{\sqrt{m} \sqrt{2 \log \Pi_{\mathcal{G}}(m)}}{m} \right] = \sqrt{\frac{2 \log \Pi_{\mathcal{G}}(m)}{m}},
$$

which concludes the proof.

Combining the generalization bound (3.17) of theorem 3.5 with corollary 3.8 yields immediately the following generalization bound in terms of the growth function.

Corollary 3.9 (Growth function generalization bound) Let H be a family of functions taking values in $\{- 1, + 1\}$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ for any $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S}(h) + \sqrt{\frac{2 \log \Pi_{\mathcal{H}}(m)}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{3.22}
$$

![Figure 3.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/bd7d74c900b5230340e78d25cb62c4c062280c1cd394ab98b50c8253f661f96a.jpg)  
Figure 3.1  
VC-dimension of intervals on the real line. (a) Any two points can be shattered. (b) No sample of three points can be shattered as the $(+, -, +)$ labeling cannot be realized.

Growth function bounds can be also derived directly (without using Rademacher complexity bounds first). The resulting bound is then the following:

$$
\mathbb{P} \left[\left| R(h) - \widehat{R}_{S}(h) \right| > \epsilon \right] \leq 4 \Pi_{\mathcal{H}}(2m) \exp \left(- \frac{m \epsilon^{2}}{8}\right),\tag{3.23}
$$

which only difers from (3.22) by constants.

The computation of the growth function may not be always convenient since, by definition, it requires computing $\Pi_{\mathcal{H}}(m)$ for all $m \geq 1$ . The next section introduces an alternative measure of the complexity of a hypothesis set H that is based instead on a single scalar, which will turn out to be in fact deeply related to the behavior of the growth function.

## 3.3 VC-dimension

Here, we introduce the notion of VC-dimension (Vapnik-Chervonenkis dimension). The VC-dimension is also a purely combinatorial notion but it is often easier to compute than the growth function (or the Rademacher Complexity). As we shall see, the VC-dimension is a key quantity in learning and is directly related to the growth function.

To define the VC-dimension of a hypothesis set H, we first introduce the concept of shattering. Recall from the previous section, that given a hypothesis set H, a dichotomy of a set S is one of the possible ways of labeling the points of S using a hypothesis in H. A set S of $m \geq 1$ points is said to be shattered by a hypothesis set H when H realizes all possible dichotomies of S, that is when $\Pi_{\mathcal{H}}(m) = 2^{m}$

Definition 3.10 (VC-dimension) The VC-dimension of a hypothesis set H is the size of the largest set that can be shattered by H:

$$
\operatorname{VCdim}(\mathcal{H}) = \max \{m \colon \Pi_{\mathcal{H}}(m) = 2^{m}\}.\tag{3.24}
$$

Note that, by definition, if ${\mathrm{VCdim}}({\mathcal{H}}) = d.$ there exists a set of size d that can be shattered. However, this does not imply that all sets of size d or less are shattered and, in fact, this is typically not the case.

![Figure 3.2](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/cedc05de8af8f7334a5551f688b37d14d86e815fd24a35ce83dc2b8c01bdce03.jpg)  
Figure 3.2  
Unrealizable dichotomies for four points using hyperplanes in $\mathbb{R}^{2}$ . (a) All four points lie on the convex hull. (b) Three points lie on the convex hull while the remaining point is interior.

To further illustrate this notion, we will examine a series of examples of hypothesis sets and will determine the VC-dimension in each case. To compute the VC-dimension we will typically show a lower bound for its value and then a matching upper bound. To give a lower bound d for VCdim(H), it sufices to show that a set S of cardinality d can be shattered by H. To give an upper bound, we need to prove that no set $S$ of cardinality $d + 1$ can be shattered by H, which is typically more dificult.

Example 3.11 (Intervals on the real line) Our first example involves the hypothesis class of intervals on the real line. It is clear that the VC-dimension is at least two, since all four dichotomies $(+, +),(-, -),(+, -),(-, +)$ can be realized, as illustrated in figure $3.1(a)$ . In contrast, by the definition of intervals, no set of three points can be shattered since the $(+, -, +)$ labeling cannot be realized. Hence, VCdim(intervals in $\mathbb{R}) = 2$

Example 3.12 (Hyperplanes) Consider the set of hyperplanes in $\mathbb{R}^{2}$ . We first observe that any three non-collinear points in $\mathbb{R}^{2}$ can be shattered. To obtain the first three dichotomies, we choose a hyperplane that has two points on one side and the third point on the opposite side. To obtain the fourth dichotomy we have all three points on the same side of the hyperplane. The remaining four dichotomies are realized by simply switching signs. Next, we show that four points cannot be shattered by considering two cases: (i) the four points lie on the convex hull defined by the four points, and (ii) three of the four points lie on the convex hull and the remaining point is internal. In the first case, a positive labeling for one diagonal pair and a negative labeling for the other diagonal pair cannot be realized, as illustrated in figure 3.2(a). In the second case, a labeling which is positive for the points on the convex hull and negative for the interior point cannot be realized, as illustrated in figure 3.2(b). Hence, VCdim(hyperplanes in $\mathbb{R}^{2}) = 3$

More generally in $\mathbb{R}^{d}$ , we derive a lower bound by starting with a set of $d{+ 1}$ points in $\mathbb{R}^{d}.$ , setting $\mathbf{x}_{\mathrm{0}}$ to be the origin and defining $\mathbf{x}_{i},$ for $i \in \{1, \ldots, d\}$ , as the point whose ith coordinate is 1 and all others are 0. Let $y_{0}, y_{1}, \dotsc, y_{d} \in \{- 1, + 1\}$ be an arbitrary set of labels for $\mathbf{x}_{0}, \mathbf{x}_{1}, \ldots, \mathbf{x}_{d}$ . Let w be the vector whose ith coordinate is $y_{i}$ . Then the classifier defined by the hyperplane of equation ${\bf w} \cdot{\bf x} + \frac{y_{0}}{2} = 0$ shatters $\mathbf{x}_{0}, \mathbf{x}_{1}, \ldots, \mathbf{x}_{d}$ since for any $i \in \{0, \ldots, d\}$

$$
\operatorname{sgn} \left(\mathbf{w} \cdot \mathbf{x}_{i} + \frac{y_{0}}{2}\right) = \operatorname{sgn} \left(y_{i} + \frac{y_{0}}{2}\right) = y_{i}.\tag{3.25}
$$

To obtain an upper bound, it sufices to show that no set of $d + 2$ points can be shattered by halfspaces. To prove this, we will use the following general theorem.

Theorem 3.13 (Radon’s theorem) Any set X of $d + 2$ points in $\mathbb{R}^{d}$ can be partitioned into two subsets $\mathcal{X}_{1}$ and $\mathcal{X}_{2}$ such that the convex hulls of $\mathcal{X}_{1}$ and $\mathcal{X}_{2}$ intersect.

Proof: Let $\mathcal{X} = \{\mathbf{x}_{1}, \dots, \mathbf{x}_{d + 2}\} \subset \mathbb{R}^{d}$ . The following is a system of $d + 1$ linear equations in $\alpha_{1}, \ldots, \alpha_{d + 2} \colon$

$$
\sum_{i = 1}^{d + 2} \alpha_{i} \mathbf{x}_{i} = 0 \qquad \mathrm{and} \qquad \sum_{i = 1}^{d + 2} \alpha_{i} = 0,\tag{3.26}
$$

since the first equality leads to d equations, one for each component. The number of unknowns, $d + 2$ , is larger than the number of equations, $d + 1$ , therefore the system admits a non-zero solution $\beta_{1}, \ldots, \beta_{d + 2}$ . Since $\textstyle \sum_{i = 1}^{d + 2} \beta_{i} \ = \0$ , both $\mathcal{I}_{1} ~ =$ $\{i \in[d + 2] \colon \beta_{i} \ > \0\}$ and $\mathcal{I}_{2} ~ = ~ \{i ~ \in ~[d + 2] \colon \beta_{i} ~ \leq ~ 0\}$ are non-empty sets and $\mathcal{X}_{1} ~ = ~ \{\mathbf{x}_{i} \colon i ~ \in \mathrm{\mathcal{I}}_{1}\}$ and $\mathcal{X}_{2} ~ = ~ \{\mathbf{x}_{i} : i ~ \in ~ \mathfrak{I}_{2}\}$ form a partition of X. By the last equation of (3.26), $\begin{array}{r}{\sum_{i \in \mathcal{I}_{1}} \beta_{i} = - \sum_{i \in \mathcal{I}_{2}} \beta_{i}} \end{array}$ . Let $\beta = \textstyle \sum_{i \in{\mathcal{I}}_{1}} \beta_{i}$ . Then, the first part of (3.26) implies

$$
\sum_{i \in \mathcal{I}_{1}} \frac{\beta_{i}}{\beta} \mathbf{x}_{i} = \sum_{i \in \mathcal{I}_{2}} \frac{- \beta_{i}}{\beta} \mathbf{x}_{i},
$$

with $\begin{array}{r}{\sum_{i \in \mathcal I_{1}} \frac{\beta_{i}}{\beta} = \sum_{i \in \mathcal I_{2}} \frac{- \beta_{i}}{\beta} = 1} \end{array}$ , and $\begin{array}{r}{\frac{\beta_{i}}{\beta} \geq 0} \end{array}$ for $i \in \mathcal{I}_{1}$ and $\frac{- \beta_{i}}{\beta} \geq 0$ for $i \in \mathcal{I}_{2}$ . By definition of the convex hulls (B.6), this implies that $\textstyle \sum_{i \in \mathcal{I}_{1}} \frac{\beta_{i}}{\beta} \mathbf{X}_{i}$ belongs both to the convex hull of $\mathcal{X}_{1}$ and to that of $\mathcal{X}_{2}$ $\square$

Now, let X be a set of $d + 2$ points. By Radon’s theorem, it can be partitioned into two sets $\mathcal{X}_{1}$ and $\mathcal{X}_{2}$ such that their convex hulls intersect. Observe that when two sets of points $\mathcal{X}_{1}$ and $\mathcal{X}_{2}$ are separated by a hyperplane, their convex hulls are also separated by that hyperplane. Thus, $\mathcal{X}_{1}$ and $\mathcal{X}_{2}$ cannot be separated by a hyperplane and X is not shattered. Combining our lower and upper bounds, we have proven that VCdim(hyperplanes in $\mathbb{R}^{d}) = d + 1$

Example 3.14 (Axis-aligned Rectangles) We first show that the VC-dimension is at least four, by considering four points in a diamond pattern. Then, it is clear that all 16 dichotomies can be realized, some of which are illustrated in figure 3.3(a). In contrast, for any set of five distinct points, if we construct the minimal axisaligned rectangle containing these points, one of the five points is in the interior of this rectangle. Imagine that we assign a negative label to this interior point and a positive label to each of the remaining four points, as illustrated in figure 3.3(b). There is no axis-aligned rectangle that can realize this labeling. Hence, no set of five distinct points can be shattered and VCdim(axis-aligned rectangles) = 4.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/c8ab23118e46739c2172cf17b6d73f01f88a2b6a1a71d7e27be4257022277585.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/dfff8329b952e3deaddb8e988beded8a5ecb2746da35f71fe12096589e576469.jpg)  
(b)  
Figure 3.3  
VC-dimension of axis-aligned rectangles. (a) Examples of realizable dichotomies for four points in a diamond pattern. (b) No sample of five points can be realized if the interior point and the remaining points have opposite labels.

Example 3.15 (Convex Polygons) We focus on the class of convex d-gons in the plane. To get a lower bound, we show that any set of 2d+1 points can be shattered. To do this, we select 2d+1 points that lie on a circle, and for a particular labeling, if there are more negative than positive labels, then the points with the positive labels are used as the polygon’s vertices, as in figure 3.4(a). Otherwise, the tangents of the negative points serve as the edges of the polygon, as shown in (3.4)(b). To derive an upper bound, it can be shown that choosing points on the circle maximizes the number of possible dichotomies, and thus VCdim(convex $d \mathrm{- gons}) = 2d + 1$ . Note also that VCdim(convex $\mathrm{polygons}) = + \infty$

Example 3.16 (Sine Functions) The previous examples could suggest that the VCdimension of H coincides with the number of free parameters defining H. For example, the number of parameters defining hyperplanes matches their VC-dimension. However, this does not hold in general. Several of the exercises in this chapter illustrate this fact. The following provides a striking example from this point of view. Consider the following family of sine functions: $\{t \mapsto \sin(\omega t) \colon \omega \in \mathbb{R}\}$ . One instance of this function class is shown in figure 3.5. These sine functions can be used to classify the points on the real line: a point is labeled positively if it is above the curve, negatively otherwise. Although this family of sine functions is defined via a single parameter, ω, it can be shown that VCdim(sine functions) = + (exercise 3.20).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/d3defd3538dbd027694458d1ec8826036cc50d160baef12338cb1d43423245b7.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/b9c886fcd4af2aebd382ca5902717bcfcfeac3fbe4b6f98e3f6b8314ed429f02.jpg)  
(b)

Figure 3.4  
Convex d-gons in the plane can shatter 2d + 1 points. (a) d-gon construction when there are more negative labels. (b) d-gon construction when there are more positive labels.  
![Figure 3.5](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/0b695aa842bb573d3d9eb576c5a73460d079454a56d7e42a75784576f135303c.jpg)  
Figure 3.5  
An example of a sine function (with ω = 50) used for classification.

The VC-dimension of many other hypothesis sets can be determined or upperbounded in a similar way (see this chapter’s exercises). In particular, the VCdimension of any vector space of dimension $r < \infty$ can be shown to be at most r (exercise 3.19). The next result, known as $Sauer{'} s$ lemma, clarifies the connection between the notions of growth function and VC-dimension.

![Figure 3.6](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/ae50f44bfa70a3a82abbf0f0112504936ffbf40b4449374a6e0254ff10ec6c6a.jpg)  
Figure 3.6  
Illustration of how $\mathcal{G}_{1}$ and $\mathcal{G}_{2}$ are constructed in the proof of Sauer’s lemma.

Theorem 3.17 (Sauer’s lemma) Let H be a hypothesis set with VCdim $({\mathcal{H}}) = d$ . Then, for all $m \in \mathbb{N}$ , the following inequality holds:

$$
\Pi_{\mathcal{H}}(m) \leq \sum_{i = 0}^{d} \binom{m}{i}.\tag{3.27}
$$

Proof: The proof is by induction on $m + d.$ . The statement clearly holds for $m = 1$ and $d = 0$ or $d = 1$ . Now, assume that it holds for $(m - 1, d - 1)$ and $(m - 1, d)$ Fix a set $\mathcal{S} = \{x_{1}, \ldots, x_{m}\}$ with $\Pi_{\mathcal{H}}(m)$ dichotomies and let $\mathcal{G} = \mathcal{H}_{| \mathcal{S}}$ be the set of concepts H induced by restriction to S.

Now consider the following families over $\mathcal{S}^{\prime} = \{x_{1}, \ldots, x_{m - 1}\}$ . We define $\mathcal{G}_{1} = \mathcal{G}_{| \mathcal{S}^{\prime}}$ as the set of concepts H induced by restriction to $S^{\prime}.$ . Next, by identifying each concept as the set of points (in $\mathcal{S}^{\prime} \mathrm{~ or ~} \mathcal{S})$ for which it is non-zero, we can define $^2$ as

$$
\mathcal{G}_{2} = \{g^{\prime} \subseteq \mathcal{S}^{\prime} \colon(g^{\prime} \in \mathcal{G}) \land(g^{\prime} \cup \{x_{m}\} \in \mathcal{G})\}.
$$

Since $g^{\prime} \subseteq \mathcal{S}^{\prime}, g^{\prime} \in \mathcal{G}$ means that without adding $x_{m}$ it is a concept of G. Further, the constraint $g^{\prime} \cup \{x_{m}\} \in \mathcal{G}$ means that adding $x_{m}$ to $g^{\prime}$ also makes it a concept of G. The construction of $\mathcal{G}_{1}$ and $\mathcal{G}_{2}$ is illustrated pictorially in figure 3.6. Given our definitions of $\mathcal{G}_{1}$ and $\mathcal{G}_{2}$ , observe that $| \mathcal{G}_{1} | + | \mathcal{G}_{2} | = | \mathcal{G} |$

Since VCdim $\begin{array}{r}{\iota(\mathcal{G}_{1}) \leq \mathrm{VCdim}(\mathcal{G}) \leq d.} \end{array}$ , then by definition of the growth function and using the induction hypothesis,

$$
| \mathcal{G}_{1} | \leq \Pi_{\mathcal{G}_{1}}(m - 1) \leq \sum_{i = 0}^{d} \binom{m - 1}{i}.
$$

Further, by definition of $\mathcal{G}_{2}$ , if a set $\mathcal{Z} \subseteq \mathcal{S}^{\prime}$ is shattered by $\mathcal{G}_{2}$ , then the set ${\mathfrak{Z}} \cup \{x_{m}\}$ is shattered by G. Hence,

$$
\operatorname{VCdim} \left(\mathcal{G}_{2}\right) \leq \operatorname{VCdim}(\mathcal{G}) - 1 = d - 1,
$$

and by definition of the growth function and using the induction hypothesis,

$$
| \mathcal{G}_{2} | \leq \Pi_{\mathcal{G}_{2}}(m - 1) \leq \sum_{i = 0}^{d - 1} \binom{m - 1}{i}.
$$

Thus,

$$
| \mathcal{G} | = | \mathcal{G}_{1} | + | \mathcal{G}_{2} | \leq \sum_{i = 0}^{d} \binom{m - 1}{i} + \sum_{i = 0}^{d - 1} \binom{m - 1}{i} = \sum_{i = 0}^{d} \binom{m - 1}{i} + \binom{m - 1}{i - 1} = \sum_{i = 0}^{d} \binom{m}{i},
$$

which completes the inductive proof.

The significance of Sauer’s lemma can be seen by corollary 3.18, which remarkably shows that growth function only exhibits two types of behavior: either ${\mathrm{VCdim}}({\mathcal{H}}) =$ $d < + \infty$ , in which case $\Pi_{\mathcal{H}}(m) = O(m^{d})$ , or $\mathrm{VCdim}(\mathcal{H}) = + \infty$ , in which case $\Pi_{\mathcal{H}}(m) = 2^{m}$

Corollary 3.18 Let H be a hypothesis set with VCdim $({\mathcal{H}}) = d$ . Then for all $m \geq d,$

$$
\Pi_{\mathcal{H}}(m) \leq \left(\frac{em}{d}\right)^{d} = O(m^{d}).\tag{3.28}
$$

Proof: The proof begins by using Sauer’s lemma. The first inequality multiplies each summand by a factor that is greater than or equal to one since $m \geq d,$ while the second inequality adds non-negative summands to the summation.

$$
\begin{array}{l} \Pi_{\mathcal{H}}(m) \leq \sum_{i = 0}^{d} \binom{m}{i} \\ \quad \leq \sum_{i = 0}^{d} \binom{m}{i} \left(\frac{m}{d}\right)^{d - i} \\ \quad \leq \sum_{i = 0}^{m} \binom{m}{i} \left(\frac{m}{d}\right)^{d - i} \\ \quad = \left(\frac{m}{d}\right)^{d} \sum_{i = 0}^{m} \binom{m}{i} \left(\frac{d}{m}\right)^{i} \\ \quad = \left(\frac{m}{d}\right)^{d} \left(1 + \frac{d}{m}\right)^{m} \leq \left(\frac{m}{d}\right)^{d} e^{d}.\end{array}
$$

After simplifying the expression using the binomial theorem, the final inequality follows using the general inequality $(1 - x) \leq e^{- x}$ $\square$

The explicit relationship just formulated between VC-dimension and the growth function combined with corollary 3.9 leads immediately to the following generalization bounds based on the VC-dimension.

Corollary 3.19 (VC-dimension generalization bounds) Let H be a family of functions taking values in $\{- 1, + 1\}$ with VC-dimension d. Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following holds for all $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S}(h) + \sqrt{\frac{2d \log \frac{em}{d}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{3.29}
$$

Thus, the form of this generalization bound is

$$
R(h) \leq \widehat{R}_{S}(h) + O \left(\sqrt{\frac{\log(m / d)}{(m / d)}}\right),\tag{3.30}
$$

which emphasizes the importance of the ratio $m / d$ for generalization. The theorem provides another instance of Occam’s razor principle where simplicity is measured in terms of smaller VC-dimension.

VC-dimension bounds can be derived directly without using an intermediate Rademacher complexity bound, as for (3.23): combining Sauer’s lemma with (3.23) leads to the following high-probability bound

$$
R(h) \leq \widehat{R}_{S}(h) + \sqrt{\frac{8d \log \frac{2em}{d} + 8 \log \frac{4}{\delta}}{m}},
$$

which has the general form of (3.30). The log factor plays only a minor role in these bounds. A finer analysis can be used in fact to eliminate that factor.

## 3.4 Lower bounds

In the previous section, we presented several upper bounds on the generalization error. In contrast, this section provides lower bounds on the generalization error of any learning algorithm in terms of the VC-dimension of the hypothesis set used.

These lower bounds are shown by finding for any algorithm a ‘bad’ distribution. Since the learning algorithm is arbitrary, it will be dificult to specify that particular distribution. Instead, it sufices to prove its existence non-constructively. At a high level, the proof technique used to achieve this is the probabilistic method of Paul Erd¨os. In the context of the following proofs, first a lower bound is given on the expected error over the parameters defining the distributions. From that, the lower bound is shown to hold for at least one set of parameters, that is one distribution.

Theorem 3.20 (Lower bound, realizable case) Let H be a hypothesis set with $VC -$ dimension $d > 1$ . Then, for any $m \geq 1$ and any learning algorithm ${\mathcal{A}},$ there exist a distribution D over X and a target function $f \in{\mathcal{H}}$ such that

$$
\mathbb{P}_{S \sim \mathcal{D}^{m}} \left[R_{\mathcal{D}}(h_{S}, f) > \frac{d - 1}{32m} \right] \geq 1 / 100.\tag{3.31}
$$

Proof: Let $\overline{{\mathcal{X}}} = \{x_{0}, x_{1}, \hdots, x_{d - 1}\} \subseteq \mathcal{X}$ be a set that is shattered by H. For any $\epsilon > 0$ , we choose D such that its support is reduced to $\overline{{\mathcal{X}}}$ and so that one point $\left(x_{0} \right)$

has very high probability $(1 - 8 \epsilon)$ , with the rest of the probability mass distributed uniformly among the other points:

$$
\underset{\mathcal{D}}{\mathbb{P}}[x_{0}] = 1 - 8 \epsilon \quad \text{and} \quad \forall i \in[d - 1], \underset{\mathcal{D}}{\mathbb{P}}[x_{i}] = \frac{8 \epsilon}{d - 1}.\tag{3.32}
$$

With this definition, most samples would contain $x_{0}$ and, since X is shattered, can essentially do no better than tossing a coin when determining the label of a point $x_{i}$ not falling in the training set.

We assume without loss of generality that $\mathcal{A}$ makes no error on $x_{0}$ . For a sample $S_{☉}$ , we let $\overline{S}$ denote the set of its elements falling in $\{x_{1}, \dotsc, x_{d - 1}\}$ , and let S be the set of samples $S$ of size $m$ such that $| \overline{{S}} | \le(d - 1) / 2$ . Now, fix a sample $S \in{\mathcal{S}}$ , and consider the uniform distribution U over all labelings $f \colon{\overline{{\mathcal{X}}}} \{0, 1\}$ , which are all in H since the set is shattered. Then, the following lower bound holds:

$$
\begin{array}{l} \underset{f \sim \mathcal{U}}{\mathbb{E}}[R_{\mathcal{D}}(h_{S}, f)] = \sum_{f} \sum_{x \in \overline{{\mathcal{X}}}} 1_{h_{S}(x) \neq f(x)} \mathbb{P}[x] \mathbb{P}[f] \\ \qquad \qquad \qquad \geq \sum_{f} \sum_{x \not \in \overline{{S}}} 1_{h_{S}(x) \neq f(x)} \mathbb{P}[x] \mathbb{P}[f] \\ \qquad \qquad \qquad = \sum_{x \not \in \overline{{S}}} \Big(\sum_{f} 1_{h_{S}(x) \neq f(x)} \mathbb{P}[f] \Big) \mathbb{P}[x] \\ \qquad \qquad \qquad = \frac{1}{2} \sum_{x \not \in \overline{{S}}} \mathbb{P}[x] \geq \frac{1}{2} \frac{d - 1}{2} \frac{8 \epsilon}{d - 1} = 2 \epsilon.\end{array}\tag{3.33}
$$

The first lower bound holds because we remove non-negative terms from the summation when we only consider $x \not \in{\overline{{S}}}$ instead of all $x$ in ${\overline{{\mathcal{X}}}}.$ . After rearranging terms, the subsequent equality holds since we are taking an expectation over $f \in{\mathcal{H}}$ with uniform weight on each $f$ and H shatters ${\overline{{\mathcal{X}}}}.$ The final lower bound holds due to the definitions of D and ${\overline{{S}}}.$ the latter which implies that $| \overline{{\mathcal{X}}} - \overline{{S}} | \geq(d - 1) / 2$

Since (3.33) holds for all $S \ \in \ \mathcal{S}$ , it also holds in expectation over all $S \ \in \{\mathcal{S}};$ $\mathbb{E}_{S \in \mathcal{S}} \left[\mathbb{E}_{f \sim \mathcal{U}}[R_{\mathrm{\mathcal{D}}}(h_{S}, f)] \right] \geq 2 \epsilon$ . By Fubini’s theorem, the expectations can be permuted, thus,

$$
\underset{f \sim \mathcal{U}}{\mathbb{E}} \left[\underset{S \in \mathcal{S}}{\mathbb{E}}[R_{\mathcal{D}}(h_{S}, f)] \right] \geq 2 \epsilon.\tag{3.34}
$$

This implies that $\mathbb{E}_{S \in \mathcal{S}}[R_{\mathrm{\mathcal{D}}}(h_{S}, f_{0})] \geq 2 \epsilon$ for at least one labeling $f_{0} \in \mathcal{H}$ . Decomposing this expectation into two parts and using $R_{\mathfrak{D}}(h_{S}, f_{0}) \leq \mathbb{P}_{\mathfrak{D}}[\overline{{\mathfrak{X}}} - \{x_{0}\}]$ , we obtain:

$$
\begin{array}{l}\mathop{\mathbb{E}}_{S\in \mathcal{S}}[R_{\mathcal{D}}(h_{S},f_{0})] = \sum_{S:R_{\mathcal{D}}(h_{S},f_{0})\geq \epsilon}R_{\mathcal{D}}(h_{S},f_{0}) \mathbb{P}[R_{\mathcal{D}}(h_{S},f_{0})] + \sum_{S:R_{\mathcal{D}}(h_{S},f_{0}) < \epsilon}R_{\mathcal{D}}(h_{S},f_{0}) \mathbb{P}[R_{\mathcal{D}}(h_{S},f_{0})]\\ \leq \mathop{\mathbb{P}}_{\mathcal{D}}[\overline{\mathcal{X}} -\{x_{0}\}] \mathop{\mathbb{P}}_{S\in \mathcal{S}}[R_{\mathcal{D}}(h_{S},f_{0})\geq \epsilon] + \epsilon \mathop{\mathbb{P}}_{S\in \mathcal{S}}[R_{\mathcal{D}}(h_{S},f_{0}) < \epsilon]\\ \leq 8\epsilon \mathop{\mathbb{P}}_{S\in \mathcal{S}}[R_{\mathcal{D}}(h_{S},f_{0})\geq \epsilon] + \epsilon \big(1 - \mathop{\mathbb{P}}_{S\in \mathcal{S}}[R_{\mathcal{D}}(h_{S},f_{0})\geq \epsilon]\big).\end{array}
$$

Collecting terms in $\mathbb{P}_{S \in \mathcal{S}}[R_{\mathrm{\mathcal{D}}}(h_{S}, f_{0}) \geq \epsilon]$ yields

$$
\mathbb{P}_{S \in \mathcal{S}}[R_{\mathcal{D}}(h_{S}, f_{0}) \geq \epsilon] \geq \frac{1}{7 \epsilon}(2 \epsilon - \epsilon) = \frac{1}{7}.\tag{3.35}
$$

Thus, the probability over all samples S (not necessarily in S) can be lower bounded as

$$
\mathbb{P}_{S}[R_{\mathcal{D}}(h_{S}, f_{0}) \geq \epsilon] \geq \mathbb{P}_{S \in \mathcal{S}}[R_{\mathcal{D}}(h_{S}, f_{0}) \geq \epsilon] \mathbb{P}[\mathcal{S}] \geq \frac{1}{7} \mathbb{P}[\mathcal{S}].\tag{3.36}
$$

This leads us to find a lower bound for $\mathbb{P}[\mathcal{S}]$ . By the multiplicative Chernof bound (Theorem D.4), for any $\gamma > 0$ , the probability that more than $(d - 1) / 2$ points are drawn in a sample of size m verifies:

$$
1 - \mathbb{P}[\mathcal{S}] = \mathbb{P}[S_{m} \geq 8 \epsilon m(1 + \gamma)] \leq e^{- 8 \epsilon m \frac{\gamma^{2}}{3}}.\tag{3.37}
$$

Therefore, for $\epsilon =(d - 1) /(32m)$ and $\gamma = 1$

$$
\mathbb{P}[S_{m} \geq \frac{d - 1}{2}] \leq e^{-(d - 1) / 12} \leq e^{- 1 / 12} \leq 1 - 7 \delta,\tag{3.38}
$$

for $\delta \leq.01$ . Thus $\mathbb{P}[\mathcal{S}] \geq 7 \delta$ and $\mathbb{P}_{S}[R_{\mathfrak{D}}(h_{S}, f_{0}) \geq \epsilon] \geq \delta.$

The theorem shows that for any algorithm ${\mathcal{A}},$ there exists a ‘bad’ distribution over $\mathcal{X}$ and a target function $f$ for which the error of the hypothesis returned by is a constant times $\frac{d}{m}$ with some constant probability. This further demonstrates the key role played by the VC-dimension in learning. The result implies in particular that PAC-learning in the realizable case is not possible when the VC-dimension is infinite.

Note that the proof shows a stronger result than the statement of the theorem: the distribution D is selected independently of the algorithm ${\mathcal{A}}.$ We now present a theorem giving a lower bound in the non-realizable case. The following two lemmas will be needed for the proof.

Lemma 3.21 Let α be a uniformly distributed random variable taking values in $\{\alpha_{-}, \alpha_{+}\}$ , where $\begin{array}{r}{\alpha_{-} = \frac{1}{2} - \frac{\epsilon}{2}} \end{array}$ and $\alpha_{+} = \textstyle{\frac{1}{2}} + \frac{\epsilon}{2}$ , and let S be a sample of $m \geq 1$ random variables $X_{1}, \ldots, X_{m}$ taking values in $\{0, 1\}$ and drawn i.i.d. according to the distribution $\mathcal{D}_{\alpha}$ defined by $\mathbb{P}_{\mathcal{D}_{\alpha}}[X = 1] = \alpha$ . Let h be a function from $\mathcal{X}^{m}$ to $\{\alpha_{-}, \alpha_{+}\}$ , then the following holds:

$$
\underset{\alpha}{\mathbb{E}} \left[\underset{S \sim \mathcal{D}_{\alpha}^{m}}{\mathbb{P}}[h(S) \neq \alpha] \right] \geq \Phi(2 \lceil m / 2 \rceil, \epsilon),\tag{3.39}
$$

where $\begin{array}{r}{\Phi(m, \epsilon) = \frac{1}{4} \Bigl(1 - \sqrt{1 - \exp \big(- \frac{m \epsilon^{2}}{1 - \epsilon^{2}} \big)} \Bigr)} \end{array}$ for all m and $\epsilon$.

Proof: The lemma can be interpreted in terms of an experiment with two coins with biases $\alpha_{-}$ and $\alpha_{+}$ . It implies that for a discriminant rule $h(S)$ based on a sample $S$ drawn from $\mathrm{\mathcal{D}}_{\alpha_{-}}$ or $\mathcal{D}_{\alpha_{+}}$ , to determine which coin was tossed, the sample size m must be at least $\Omega(1 / \epsilon^{2})$ . The proof is left as an exercise (exercise D.3). $\square$

We will make use of the fact that for any fixed $\epsilon$ the function $m \mapsto \Phi(m, x)$ is convex, which is not hard to establish.

Lemma 3.22 Let Z be a random variable taking values in [0, 1]. Then, for any $\gamma \in[0, 1)$ 2

$$
\mathbb{P}[z > \gamma] \geq \frac{\mathbb{E}[Z] - \gamma}{1 - \gamma} > \mathbb{E}[Z] - \gamma.\tag{3.40}
$$

Proof: Since the values taken by $Z$ are in [0, 1],

$$
\begin{array}{l} \mathbb{E}[Z] = \sum_{z \leq \gamma} \mathbb{P}[Z = z] z + \sum_{z > \gamma} \mathbb{P}[Z = z] z \\ \qquad \leq \sum_{z \leq \gamma} \mathbb{P}[Z = z] \gamma + \sum_{z > \gamma} \mathbb{P}[Z = z] \\ \qquad = \gamma \mathbb{P}[Z \leq \gamma] + \mathbb{P}[Z > \gamma] \\ \qquad = \gamma(1 - \mathbb{P}[Z > \gamma]) + \mathbb{P}[Z > \gamma] \\ \qquad =(1 - \gamma) \mathbb{P}[Z > \gamma] + \gamma, \end{array}
$$

which concludes the proof.

Theorem 3.23 (Lower bound, non-realizable case) Let H be a hypothesis set with VCdimension $d > 1$ . Then, for any $m \geq 1$ and any learning algorithm , there exists a distribution D over ${\mathcal{X}} \times \{0, 1\}$ such that:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[R_{\mathcal{D}}(h_{S}) - \inf_{h \in \mathcal{H}} R_{\mathcal{D}}(h) > \sqrt{\frac{d}{320m}} \right] \geq 1 / 64.\tag{3.41}
$$

Equivalently, for any learning algorithm, the sample complexity verifies

$$
m \geq \frac{d}{320 \epsilon^{2}}.\tag{3.42}
$$

Proof: Let ${\overline{{\mathcal{X}}}} = \{x_{1}, \dots, x_{d}\} \subseteq{\mathcal{X}}$ be a set shattered by H. For any $\alpha \in[0, 1]$ and any vector $\pmb{\sigma} =(\sigma_{1},..., \sigma_{d})^{\top} \in \{- 1, + 1\}^{d}$ , we define a distribution $\mathrm{{\mathcal{D}}}_{\sigma}$ with support $\overline{{\mathcal{X}}} \times \{0, 1\}$ as follows:

$$
\forall i \in[d], \quad \mathbb{P}_{\mathcal{D}_{\sigma}}[(x_{i}, 1)] = \frac{1}{d} \Bigl(\frac{1}{2} + \frac{\sigma_{i} \alpha}{2} \Bigr).\tag{3.43}
$$

Thus, the label of each point $x_{i}, i \in[d]$ , follows the distribution $\mathbb{P}_{\mathcal{D}_{\sigma}}[\cdot | x_{i}]$ , that of a biased coin where the bias is determined by the sign of $\sigma_{i}$ and the magnitude of α. To determine the most likely label of each point $x_{i}$ , the learning algorithm will therefore need to estimate $\mathbb{P}_{\mathcal{D}_{\sigma}}[1 | x_{i}]$ with an accuracy better than α. To make this further dificult, α and $\sigma$ will be selected based on the algorithm, requiring, as in lemma 3.21, $\Omega(1 / \alpha^{2})$ instances of each point $x_{i}$ in the training sample.

## 3.4 Lower bounds

Clearly, the Bayes classifier $h_{\mathbf{\Phi}_{\mathcal{D}_{\sigma}}}^{*}$ is defined by $\begin{array}{r}{h_{\mathcal{D}_{\sigma}}^{*}(x_{i}) = \operatorname{argmax}_{y \in \{0, 1\}} \mathbb{P}[y | x_{i}] =} \end{array}$ $1_{\sigma_{i} > 0}$ for all $i \in[d].~ h_{\mathrm{\mathcal{D}}_{\sigma}}^{*}$ is in H since $\overline{{\mathcal{X}}}$ is shattered. For all $h \in{\mathcal{H}}$

$$
R_{\mathcal{D}_{\sigma}}(h) - R_{\mathcal{D}_{\sigma}}(h_{\mathcal{D}_{\sigma}}^{*}) = \frac{1}{d} \sum_{x \in \overline{{\mathcal{X}}}} \Bigl(\frac{\alpha}{2} + \frac{\alpha}{2} \Bigr) 1_{h(x) \neq h_{\mathcal{D}_{\sigma}}^{*}(x)} = \frac{\alpha}{d} \sum_{x \in \overline{{\mathcal{X}}}} 1_{h(x) \neq h_{\mathcal{D}_{\sigma}}^{*}(x)}.\tag{3.44}
$$

Let $h_{S}$ denote the hypothesis returned by the learning algorithm after receiving a labeled sample S drawn according to $\mathcal{D}_{\sigma}$ . We will denote by $| S |_{x}$ the number of occurrences of a point x in S. Let U denote the uniform distribution over $\{- 1, + 1\}^{d}$ Then, in view of (3.44), the following holds:

$$
\begin{array}{l}\underset{\substack{\boldsymbol{igma}\sim \mathcal{U}\\ S\sim \mathcal{D}_{\boldsymbol{igma}}^{m}}}{\mathbb{E}}\left[\frac{1}{\alpha}\big[R_{\mathcal{D}_{\boldsymbol{igma}}}(h_{S}) - R_{\mathcal{D}_{\boldsymbol{igma}}}(h_{\mathcal{D}_{\boldsymbol{igma}}}^{*})\big]\right]\\ = \frac{1}{d}\sum_{x\in \overline{\mathcal{X}}}\underset{\substack{\boldsymbol{igma}\sim \mathcal{U}\\ S\sim \mathcal{D}_{\boldsymbol{igma}}^{m}}}{\mathbb{E}}\left[1_{h_{S}(x)\neq h_{\mathcal{D}_{\boldsymbol{igma}}}^{*}(x)}\right]\\ = \frac{1}{d}\sum_{x\in \overline{\mathcal{X}}}\underset{\boldsymbol{igma}\sim \mathcal{U}}{\mathbb{E}}\left[\underset{S\sim \mathcal{D}_{\boldsymbol{igma}}^{m}}{\mathbb{P}}\left[h_{S}(x)\neq h_{\mathcal{D}_{\boldsymbol{igma}}}^{*}(x)\right]\right]\\ = \frac{1}{d}\sum_{x\in \overline{\mathcal{X}}}\sum_{n = 0}^{m}\underset{\boldsymbol{igma}\sim \mathcal{U}}{\mathbb{E}}\left[\underset{S\sim \mathcal{D}_{\boldsymbol{igma}}^{m}}{\mathbb{P}}\left[h_{S}(x)\neq h_{\mathcal{D}_{\boldsymbol{igma}}}^{*}(x) \big| |S|_{x} = n\right] \mathbb{P}[|S|_{x} = n]\right]\\ \geq \frac{1}{d}\sum_{x\in \overline{\mathcal{X}}}\sum_{n = 0}^{m}\Phi(n + 1,\alpha)\mathbb{P}[|S|_{x} = n]\\ \text{(lemma 3.21)}\\ \geq \frac{1}{d}\sum_{x\in \overline{\mathcal{X}}}\Phi(m / d + 1,\alpha)\qquad(\text{convexity of $\Phi(\cdot,\alpha)$ and Jensen's ineq.)}\\ = \Phi(m / d + 1,\alpha).\end{array}
$$

Since the expectation over $\pmb{\sigma}$ is lower-bounded by $\Phi(m / d + 1, \alpha)$ , there must exist some ${\pmb{\sigma}} \in \{- 1, + 1\}^{d}$ for which

$$
\underset{S \sim \mathcal{D}_{\sigma}^{m}}{\mathbb{E}} \left[\frac{1}{\alpha} \big[R_{\mathcal{D}_{\sigma}}(h_{S}) - R_{\mathcal{D}_{\sigma}}(h_{\mathcal{D}_{\sigma}}^{*}) \big] \right] > \Phi(m / d + 1, \alpha).\tag{3.45}
$$

Then, by lemma 3.22, for that $\sigma_{:}$ , for any $\gamma \in[0, 1]$ •

$$
\underset{S \sim \mathcal{D}_{\sigma}^{m}}{\mathbb{P}} \left[\frac{1}{\alpha} \big[R_{\mathcal{D}_{\sigma}}(h_{S}) - R_{\mathcal{D}_{\sigma}}(h_{\mathcal{D}_{\sigma}}^{*}) \big] > \gamma u \right] >(1 - \gamma) u,\tag{3.46}
$$

where $u = \Phi(m / d + 1, \alpha)$ . Selecting $\delta$ and $\epsilon$ such that $\delta \leq(1 - \gamma) u$ and $\epsilon \leq \gamma \alpha u$ gives

$$
\underset{S \sim \mathcal{D}_{\sigma}^{m}}{\mathbb{P}} \left[R_{\mathcal{D}_{\sigma}}(h_{S}) - R_{\mathcal{D}_{\sigma}}(h_{\mathcal{D}_{\sigma}}^{*}) > \epsilon \right] > \delta.\tag{3.47}
$$

To satisfy the inequalities defining $\epsilon$ and $\delta,$ let $\gamma = 1 - 8 \delta$ . Then,

$$
\delta \leq(1 - \gamma) u \iff u \geq \frac{1}{8}\tag{3.48}
$$

$$
\Longleftrightarrow \frac{1}{4} \left(1 - \sqrt{1 - \exp \left(- \frac{(m / d + 1) \alpha^{2}}{1 - \alpha^{2}}\right)}\right) \geq \frac{1}{8}\tag{3.49}
$$

$$
\Longleftrightarrow \frac{(m / d + 1) \alpha^{2}}{1 - \alpha^{2}} \leq \log{\frac{4}{3}}\tag{3.50}
$$

$$
\Longleftrightarrow \frac{m}{d} \leq \left(\frac{1}{\alpha^{2}} - 1\right) \log \frac{4}{3} - 1.\tag{3.51}
$$

Selecting $\alpha = 8 \epsilon /(1 - 8 \delta)$ gives $\epsilon = \gamma \alpha / 8$ and the condition

$$
\frac{m}{d} \leq \left(\frac{(1 - 8 \delta)^{2}}{64 \epsilon^{2}} - 1\right) \log \frac{4}{3} - 1.\tag{3.52}
$$

Let $f(1 / \epsilon^{2})$ denote the right-hand side. We are seeking a sufficient condition of the form $m / d \le \omega / \epsilon^{2}$ . Since $\epsilon \leq 1 / 64$ , to ensure that $\omega / \epsilon^{2} \le f(1 / \epsilon^{2})$ , it sufices to impose $\begin{array}{r}{\frac{\omega}{(1 / 64)^{2}} = f \big(\frac{1}{(1 / 64)^{2}} \big)} \end{array}$ . This condition gives

$$
\omega =(7 / 64)^{2} \log(4 / 3) -(1 / 64)^{2}(\log(4 / 3) + 1) \approx.003127 \geq 1 / 320 =.003125.
$$

Thus, $\begin{array}{r}{\epsilon^{2} \le \frac{1}{320(m / d)}} \end{array}$ is sufficient to ensure the inequalities.

The theorem shows that for any algorithm $\mathcal{A}.$ , in the non-realizable case, there exists a ‘bad’ distribution over ${\mathcal{X}} \times \{0, 1\}$ such that the error of the hypothesis returned by $\mathcal{A}$ is a constant times $\textstyle{\sqrt{\frac{d}{m}}}$ with some constant probability. The VCdimension appears as a critical quantity in learning in this general setting as well. In particular, with an infinite VC-dimension, agnostic PAC-learning is not possible.

## 3.5 Chapter notes

The use of Rademacher complexity for deriving generalization bounds in learning was first advocated by Koltchinskii [2001], Koltchinskii and Panchenko [2000], and Bartlett, Boucheron, and Lugosi [2002a], see also [Koltchinskii and Panchenko, 2002, Bartlett and Mendelson, 2002]. Bartlett, Bousquet, and Mendelson [2002b] introduced the notion of local Rademacher complexity, that is the Rademacher complexity restricted to a subset of the hypothesis set limited by a bound on the variance. This can be used to derive better guarantees under some regularity assumptions about the noise.

Theorem 3.7 is due to Massart [2000]. The notion of VC-dimension was introduced by Vapnik and Chervonenkis [1971] and has been since extensively studied [Vapnik, 2006, Vapnik and Chervonenkis, 1974, Blumer et al., 1989, Assouad, 1983, Dudley,

1999]. In addition to the key role it plays in machine learning, the VC-dimension is also widely used in a variety of other areas of computer science and mathematics (e.g., see Shelah [1972], Chazelle [2000]). Theorem 3.17 is known as Sauer’s lemma in the learning community, however the result was first given by Vapnik and Chervonenkis [1971] (in a somewhat different version) and later independently by Sauer [1972] and Shelah [1972].

In the realizable case, lower bounds for the expected error in terms of the VCdimension were given by Vapnik and Chervonenkis [1974] and Haussler et al. [1988]. Later, a lower bound for the probability of error such as that of theorem 3.20 was given by Blumer et al. [1989]. Theorem 3.20 and its proof, which improves upon this previous result, are due to Ehrenfeucht, Haussler, Kearns, and Valiant [1988]. Devroye and Lugosi [1995] gave slightly tighter bounds for the same problem with a more complex expression. Theorem 3.23 giving a lower bound in the non-realizable case and the proof presented are due to Anthony and Bartlett [1999]. For other examples of application of the probabilistic method demonstrating its full power, consult the reference book of Alon and Spencer [1992].

There are several other measures of the complexity of a family of functions used in machine learning, including covering numbers, packing numbers, and some other complexity measures discussed in chapter 11. A covering number $\mathcal{N}_{p}(\mathcal{G}, \epsilon)$ is the minimal number of $L_{p}$ balls of radius $\epsilon > 0$ needed to cover a family of loss functions G. A packing number $\mathcal{M}_{p}(\mathcal{G}, \epsilon)$ is the maximum number of non-overlapping $L_{p}$ balls of radius $\epsilon$ centered in G. The two notions are closely related, in particular it can be shown straightforwardly that $\mathcal{M}_{p}(\mathfrak{G}, 2 \epsilon) \le \mathcal{N}_{p}(\mathfrak{G}, \epsilon) \le \mathcal{M}_{p}(\mathfrak{G}, \epsilon)$ for G and $\epsilon > 0$ . Each complexity measure naturally induces a different reduction of infinite hypothesis sets to finite ones, thereby resulting in generalization bounds for infinite hypothesis sets. Exercise 3.31 illustrates the use of covering numbers for deriving generalization bounds using a very simple proof. There are also close relationships between these complexity measures: for example, by Dudley’s theorem, the empirical Rademacher complexity can be bounded in terms of $\mathcal{N}_{2}(\mathcal{G}, \epsilon)$ [Dudley, 1967, 1987] and the covering and packing numbers can be bounded in terms of the VC-dimension [Haussler, 1995]. See also [Ledoux and Talagrand, 1991, Alon et al., 1997, Anthony and Bartlett, 1999, Cucker and Smale, 2001, Vidyasagar, 1997] for a number of upper bounds on the covering number in terms of other complexity measures.

## 3.6 Exercises

3.1 Growth function of intervals in <sup>R</sup>. Let H be the set of intervals in <sup>R</sup>. The VC-dimension of H is 2. Compute its shattering coeficient $\Pi_{{\mathcal{H}}}(m), m \geq 0$ Compare your result with the general bound for growth functions.

3.2 Growth function and Rademacher complexity of thresholds in <sup>R</sup>. Let H be the family of threshold functions over the real line: ${ \mathcal { H } } = \{ x \mapsto 1 _ { x \leq \theta } : \theta \in \mathbb { R } \} \cup \{ x \mapsto $ $1_{x \geq \theta} : \theta \in \mathbb{R}\}$ . Give an upper bound on the growth function $\Pi_{m}(\mathcal{\mathrm{H}})$ . Use that to derive an upper bound on $\Re_{m}(\mathcal{H})$

3.3 Growth function of linear combinations. A linearly separable labeling of a set X of vectors in $\mathbb{R}^{d}$ is a classification of X into two sets ${\mathcal X}^{+}$ and $\mathcal{X}^{-}$ with $\mathcal{X}^{+} =$ $\left\{\mathbf{x} \in \mathcal{X} \colon \mathbf{w} \cdot \mathbf{x} > 0 \right\}$ and $\mathcal{X}^{-} = \left.\mathbf{x} \in \mathcal{X} \colon \mathbf{w} \cdot \mathbf{x} < 0 \right.$ for some $\mathbf{w} \in \mathbb{R}^{d}$

Let $\mathcal{X} = \{\mathbf{x}_{1}, \dots, \mathbf{x}_{m}\}$ be a subset of $\mathbb{R}^{d}$

(a) Let $\{\mathcal X^{+}, \mathcal X^{-}\}$ be a dichotomy of X and let $\mathbf{x}_{m + 1} \in \mathbb{R}^{d}$ . Show that $\{\mathcal{X}^{+} \cup$ $\{\mathbf{x}_{m + 1}\}, \mathcal{X}^{-}\}$ and $\{\mathcal{X}^{+}, \mathcal{X}^{-} \cup \{\mathbf{x}_{m + 1}\}\}$ are linearly separable by a hyperplane going through the origin if and only if $\{\mathcal X^{+}, \mathcal X^{-}\}$ is linearly separable by a hyperplane going through the origin and $\mathbf{x}_{m + 1}$

(b) Let $\mathcal{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}\}$ be a subset of $\mathbb{R}^{d}$ such that any k-element subset of X with $k \leq d$ is linearly independent. Then, show that the number of linearly separable labelings of X is $\begin{array}{r}{C(m, d) = 2 \sum_{k = 0}^{d - 1}{\binom{m - 1}{k}}} \end{array}$ . (Hint: prove by induction that $C(m + 1, d) = C(m, d) + C(m, d - 1)$

(c) Let $f_{1}, \ldots, f_{p}$ be p functions mapping $\mathbb{R}^{d}$ to <sup>R</sup>. Define $\mathcal{F}$ as the family of classifiers based on linear combinations of these functions:

$$
\mathcal{F} = \left\{x \mapsto \operatorname{sgn} \left(\sum_{k = 1}^{p} a_{k} f_{k}(x)\right): a_{1}, \dots, a_{p} \in \mathbb{R} \right\}.
$$

Define Ψ by $\Psi(x) =(f_{1}(x), \ldots, f_{p}(x))$ . Assume that there exists $x_{1}, \ldots, x_{m} \in$ $\mathbb{R}^{d}$ such that every p-subset of $\{\Psi(x_{1}), \ldots, \Psi(x_{m})\}$ is linearly independent. Then, show that

$$
\Pi_{\mathcal{F}}(m) = 2 \sum_{i = 0}^{p - 1} \binom{m - 1}{i}.
$$

3.4 Lower bound on growth function. Prove that Sauer’s lemma (theorem 3.17) is tight, i.e., for any set X of $m > d$ elements, show that there exists a hypothesis class H of VC-dimension d such that $\begin{array}{r}{\Pi_{\mathcal{H}}(m) = \sum_{i = 0}^{d} \binom{m}{i}} \end{array}$

## 3.6 Exercises

3.5 Finer Rademacher upper bound. Show that a finer upper bound on the Rademacher complexity of the family G can be given in terms of $\mathbb{E}_{S}[\Pi(\mathcal{G}, S)]$ where $\Pi(\mathcal{G}, S)$ is the number of ways to label the points in sample S.

3.6 Singleton hypothesis class. Consider the trivial hypothesis set $\mathcal{H} = \{h_{0}\}$

(a) Show that $\Re_{m}(\mathcal{H}) = 0$ for any $m > 0.$

(b) Use a similar construction to show that Massart’s lemma (theorem 3.7) is tight.

3.7 Two function hypothesis class. Let H be a hypothesis set reduced to two functions: $\mathcal{H} = \{h_{- 1}, h_{+ 1}\}$ and let $S =(x_{1}, \dots, x_{m}) \subseteq \mathcal{X}$ be a sample of size $m.$

(a) Assume that $h_{- 1}$ is the constant function taking value 1 and $h_{+ 1}$ the constant function taking the value +1. What is the VC-dimension d of H? Upper bound the empirical Rademacher complexity $\widehat{\mathfrak{R}}_{S}(\mathcal{H})$ (Hint: express $\widehat{\mathfrak{R}}_{S}(\mathcal{H})$ in terms of the absolute value of a sum of Rademacher variables and apply Jensen’s inequality) and compare your bound with $\sqrt{d / m}$

(b) Assume that $h_{- 1}$ is the constant function taking value 1 and $h_{+ 1}$ the function taking value 1 everywhere except at $x_{1}$ where it takes the value +1. What is the VC-dimension d of H? Compute the empirical Rademacher complexity $\widehat{\Re}_{S}(\mathcal{H})$

3.8 Rademacher identities. Fix $m \geq 1$ . Prove the following identities for any $\alpha \in \mathbb{R}$ and any two hypothesis sets H and $\mathcal{H}^{\prime}$ of functions mapping from $\mathcal{X}$ to <sup>R</sup>:

(a) $\Re_{m}(\alpha \mathcal{H}) = | \alpha | \Re_{m}(\mathcal{H})$

(b) $\Re_{m}(\mathcal{H} + \mathcal{H}^{\prime}) = \Re_{m}(\mathcal{H}) + \Re_{m}(\mathcal{H}^{\prime}).$

$$
\mathfrak{R}_{m} \left(\left\{\max \left(h, h^{\prime}\right): h \in \mathcal{H}, h^{\prime} \in \mathcal{H}^{\prime} \right\}\right) \leq \mathfrak{R}_{m}(\mathcal{H}) + \mathfrak{R}_{m} \left(\mathcal{H}^{\prime}\right).
$$

where $\operatorname{max}(h, h^{\prime})$ denotes the function $x \mapsto \operatorname{max}_{x \in{\mathcal{X}}}(h(x), h^{\prime}(x))$ (Hint: you could use the identity max $\begin{array}{r}{\mathrm{{\Omega}}(a, b) = \frac{1}{2}[a + b + | a - b |]} \end{array}$ valid for all $a, b \in \mathbb{R}$ and Talagrand’s contraction lemma (see lemma 5.7)).

3.9 Rademacher complexity of intersection of concepts. Let $\mathcal{H}_{1}$ and $\mathcal{H}_{2}$ be two families of functions mapping X to $\{0, 1\}$ and let $\mathcal{H} = \left\{h_{1} h_{2} \colon h_{1} \in \mathcal{H}_{1}, h_{2} \in \right.$ $\mathcal{H}_{2}\}$ . Show that the empirical Rademacher complexity of H for any sample S of size m can be bounded as follows:

$$
\widehat{\mathfrak{R}}_{S}(H) \leq \widehat{\mathfrak{R}}_{S}(\mathcal{H}_{1}) + \widehat{\mathfrak{R}}_{S}(\mathcal{H}_{2}).
$$

Hint: use the Lipschitz function $x \mapsto \operatorname{max}(0, x - 1)$ and Talagrand’s contraction lemma.

Use that to bound the Rademacher complexity $\Re_{m}(\mathfrak{U})$ of the family U of intersections of two concepts $c_{1}$ and $c_{2}$ with $c_{1} \in \mathcal{C}_{1}$ and $c_{2} \in \mathcal{C}_{2}$ in terms of the Rademacher complexities of ${\mathcal{C}}_{1}$ and ${\mathcal{C}}_{2}$ .

3.10 Rademacher complexity of prediction vector. Let $S =(x_{1}, \dots, x_{m})$ be a sample of size m and fix $h \colon \mathcal{X} \mathbb{R}$

(a) Denote by u the vector of predictions of h for S: $\mathbf{u} ~ = ~ \left[\begin{array}{l}{h(x_{1})} \\{\vdots} \\{h(x_{m})} \end{array} \right]$ . Give an upper bound on the empirical Rademacher complexity $\mathfrak{R}_{S}(\mathcal{H})$ of $\mathcal{H} =$ $\{h, - h\}$ in terms of $\| \mathbf{u} \|_{2}$ (Hint: express $\widehat{\mathfrak{R}}_{S}(\mathcal{H})$ in terms of the expectation of an absolute value and apply Jensen’s inequality). Suppose that $h(x_{i}) \in$ $\{0, - 1, + 1\}$ for all $i \in[m]$ . Express the bound on the Rademacher complexity in terms of the sparsity measure $n = | \{i \ | \h(x_{i}) \neq 0\} |$ . What is that upper bound for the extreme values of the sparsity measure?

(b) Let F be a family of functions mapping X to <sup>R</sup>. Give an upper bound on the empirical Rademacher complexity of $\mathcal{F} + h = \{f + h \colon f \in \mathcal{F}\}$ and that of $\mathcal{F} \pm h =(\mathcal{F} + h) \cup(\mathcal{F} - h)$ in terms of $\widehat{\mathfrak{R}}_{S}({\mathcal F})$ and $\| \mathbf{u} \|_{2}$

3.11 Rademacher complexity of regularized neural networks. Let the input space be $\mathcal{X} = \mathbb{R}^{n_{1}}$ . In this problem, we consider the family of regularized neural networks defined by the following set of functions mapping $\mathcal{X}$ to <sup>R</sup>:

$$
\mathcal{H} = \left\{\mathbf{x} \mapsto \sum_{j = 1}^{n_{2}} w_{j} \sigma(\mathbf{u}_{j} \cdot \mathbf{x}) \colon \| \mathbf{w} \|_{1} \leq \Lambda^{\prime}, \| \mathbf{u}_{j} \|_{2} \leq \Lambda, \forall j \in[n_{2}] \right\},
$$

where $\sigma$ is an L-Lipschitz function. As an example, $\sigma$ could be the sigmoid function which is 1-Lipschitz.

(a) Show that $\begin{array}{r}{\widehat{\mathfrak{R}}_{S}(\mathcal{H}) = \frac{\Lambda^{\prime}}{m} \mathbb{E}_{\pmb{\sigma}} \left[\operatorname{sup}_{\| \mathbf{u} \|_{2} \leq \Lambda} | \sum_{i = 1}^{m} \sigma_{i} \sigma(\mathbf{u} \cdot \mathbf{x}_{i}) | \right].} \end{array}$

(b) Use the following form of Talagrand’s lemma valid for all hypothesis sets H and L-Lipschitz function Φ:

$$
\frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \left| \sum_{i = 1}^{m} \sigma_{i}(\Phi \circ h)(x_{i}) \right| \right] \leq \frac{L}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \left| \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \right| \right],
$$

to upper bound $\widehat{\mathfrak{R}}_{S}(\mathcal{H})$ in terms of the empirical Rademacher complexity of $\mathcal{H}^{\prime}$ , where $\mathcal{H}^{\prime}$ is defined by

$$
\mathcal{H}^{\prime} = \left\{\mathbf{x} \mapsto s(\mathbf{u} \cdot \mathbf{x}) \colon \| \mathbf{u} \|_{2} \leq \Lambda, s \in \{- 1, + 1\} \right\}.
$$

(c) Use the Cauchy-Schwarz inequality to show that

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}^{\prime}) = \frac{\Lambda}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|_{2} \right].
$$

(d) Use the inequality $\mathbb{E}_{\mathbf{v}}[\| \mathbf{v} \|_{2}] \le \sqrt{\mathbb{E}_{\mathbf{v}}[\| \mathbf{v} \|_{2}^{2}]}$ , which holds by Jensen’s inequality to upper bound $\Re_{S}(\mathcal{H}^{\prime})$

(e) Assume that for all $\mathbf{x} \in S, \ \| \mathbf{x} \|_{2} \leq r$ for some $r > 0$ . Use the previous questions to derive an upper bound on the Rademacher complexity of H in terms of $r.$

3.12 Rademacher complexity. Professor Jesetoo claims to have found a better bound on the Rademacher complexity of any hypothesis set $H$ of functions taking values in $\{-1, +1\}$, in terms of its VC-dimension $\mathrm{VCdim}(H)$. His bound is of the form $\mathring{\Re}_{m}(\mathcal{H}) \leq O\big(\frac{\mathrm{VCdim}(\mathcal{H})}{m}\big)$. Can you show that Professor Jesetoo’s claim cannot be correct? (Hint: consider a hypothesis set $H$ reduced to just two simple functions.)

3.13 VC-dimension of union of k intervals. What is the VC-dimension of subsets of the real line formed by the union of k intervals?

3.14 VC-dimension of finite hypothesis sets. Show that the VC-dimension of a finite hypothesis set H is at most $\log_{2} | \mathcal{H} |$

3.15 VC-dimension of subsets. What is the VC-dimension of the set of subsets $I_{\alpha}$ of the real line parameterized by a single parameter α: $I_{\alpha} =[\alpha, \alpha + 1] \cup[\alpha + 2, + \infty) \ ?$

3.16 VC-dimension of axis-aligned squares and triangles.

(a) What is the VC-dimension of axis-aligned squares in the plane?

(b) Consider right triangles in the plane with the sides adjacent to the right angle both parallel to the axes and with the right angle in the lower left corner. What is the VC-dimension of this family?

3.17 VC-dimension of closed balls in $\mathbb{R}^{n}$ . Show that the VC-dimension of the set of all closed balls in $\mathbb{R}^{n}$ , i.e., sets of the form $\{x \in \mathbb{R}^{n} \colon \| x - x_{0} \|^{2} \leq r\}$ for some $x_{0} \in \mathbb{R}^{n}$ and $r \geq 0$ , is less than or equal to $n + 2$

3.18 VC-dimension of ellipsoids. What is the VC-dimension of the set of all ellipsoids in $\mathbb{R}^{n} ?$

3.19 VC-dimension of a vector space of real functions. Let F be a finite-dimensional vector space of real functions on $\mathbb{R}^{n}$ , dim $.(F) = r < \infty$ . Let H be the set of hypotheses:

$$
\mathcal{H} = \{\{x: f(x) \geq 0\}: f \in F\}.
$$

Show that $d,$ the VC-dimension of H, is finite and that $d \leq r$ . (Hint: select an arbitrary set of $m = r + 1$ points and consider linear mapping u: $F \to \mathbb{R}^{m}$ defined by: $u(f) =(f(x_{1}), \dots, f(x_{m})).)$

3.20 VC-dimension of sine functions. Consider the hypothesis family of sine functions (Example 3.16): $\{x \to \sin(\omega x) \colon \omega \in \mathbb{R}\}$

(a) Show that for any $x \in \mathbb{R}$ the points x, 2x, 3x and 4x cannot be shattered by this family of sine functions.

(b) Show that the VC-dimension of the family of sine functions is infinite. (Hint: show that $\{2^{- i} \colon i \leq m\}$ can be shattered for any $m > 0.)$ 0

3.21 VC-dimension of union of halfspaces. Provide an upper bound on the $\mathrm{VC} -$ dimension of the class of hypotheses described by the unions of k halfspaces.

3.22 VC-dimension of intersection of halfspaces. Consider the class ${{\mathcal{C}}_{k}}$ of convex intersections of k halfspaces. Give lower and upper bound estimates for $\mathrm{VCdim}(\mathcal{C}_{k})$

3.23 VC-dimension of intersection concepts.

(a) Let ${\mathcal{C}}_{1}$ and ${\mathcal{C}}_{2}$ be two concept classes. Show that for any concept class ${\mathfrak{C}} = \left\{c_{1} \cap c_{2} \colon c_{1} \in{\mathfrak{C}}_{1}, c_{2} \in{\mathfrak{C}}_{2} \right\}$ ,

$$
\Pi_{\mathcal{C}}(m) \leq \Pi_{\mathcal{C}_{1}}(m) \Pi_{\mathcal{C}_{2}}(m).\tag{3.53}
$$

(b) Let C be a concept class with VC-dimension d and let ${\mathcal{C}}_{s}$ be the concept class formed by all intersections of s concepts from $\mathcal{C}, s \geq 1$ . Show that the VC-dimension of ${\mathcal{C}}_{s}$ is bounded by $2ds \log_{2}(3s)$ . (Hint: show that $\log_{2}(3x) <$ $9x /(2e)$ for any $x \geq 2.)$

## 3.6 Exercises

3.24 VC-dimension of union of concepts. Let A and B be two sets of functions mapping from X into $\{0, 1\}$ , and assume that both A and B have finite VCdimension, with $\mathrm{VCdim}(\mathcal{A}) = d_{\mathcal{A}}$ and $\mathrm{VCdim}({\mathcal{B}}) = d_{\mathcal{B}}$ . Let ${\mathcal{C}} ={\mathcal{A}} \cup{\mathcal{B}}$ be the union of A and B.

(a) Prove that for all $m, \Pi_{\mathcal{C}}(m) \leq \Pi_{\mathcal{A}}(m) + \Pi_{\mathcal{B}}(m)$

(b) Use Sauer’s lemma to show that for $m \geq d_{\mathcal{A}} + d_{\mathcal{B}} + 2, \Pi_{\mathcal{C}}(m) < 2^{m}$ , and give a bound on the VC-dimension of C.

3.25 VC-dimension of symmetric diference of concepts. For two sets A and B, let ${\mathcal{A}} \Delta{\mathcal{B}}$ denote the symmetric diference of A and $\mathfrak{B}, \mathrm{i.e., \} \mathcal{A} \Delta \mathcal{B} =(\mathcal{A} \cup \mathcal{B}) -(\mathcal{A} \cap \mathcal{B})$ Let H be a non-empty family of subsets of X with finite VC-dimension. Let A be an element of H and define $\mathcal{H} \Delta \mathcal{A} = \left\{X \Delta \mathcal{A} \colon X \in \mathcal{H} \right\}$ . Show that

$$
\operatorname{VCdim}(\mathcal{H} \Delta \mathcal{A}) = \operatorname{VCdim}(\mathcal{H}).
$$

3.26 Symmetric functions. A function $h \colon \{0, 1\}^{n} \to \{0, 1\}$ is symmetric if its value is uniquely determined by the number of 1’s in the input. Let C denote the set of all symmetric functions.

(a) Determine the VC-dimension of C.

(b) Give lower and upper bounds on the sample complexity of any consistent PAC learning algorithm for C.

(c) Note that any hypothesis $h \in \mathcal{C}$ can be represented by a vector $\left(y_{0}, y_{1}, \ldots, y_{n} \right)$ $\in \{0, 1\}^{n + 1}$ , where $y_{i}$ is the value of h on examples having precisely i 1’s. Devise a consistent learning algorithm for C based on this representation.

## 3.27 VC-dimension of neural networks.

Let C be a concept class over $\mathbb{R}^{r}$ with VC-dimension d. A C-neural network with one intermediate layer is a concept defined over $\mathbb{R}^{n}$ that can be represented by a directed acyclic graph such as that of Figure 3.7, in which the input nodes are those at the bottom and in which each other node is labeled with a concept $c \in \mathcal{C}.$

The output of the neural network for a given input vector $(x_{1}, \ldots, x_{n})$ is obtained as follows. First, each of the n input nodes is labeled with the corresponding value $x_{i} \in \mathbb{R}$ . Next, the value at a node u in the higher layer and labeled with c is obtained by applying c to the values of the input nodes admitting an edge ending in u. Note that since c takes values in $\{0, 1\}$ , the value at u is in $\{0, 1\}$ . The value at the top or output node is obtained similarly by applying the corresponding concept to the values of the nodes admitting an edge to the output node.

![Figure 3.7](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/b00adb713757169bb7d6e7583d360f65666876914a7c4b47499a5f8a28d17666.jpg)  
Figure 3.7  
A neural network with one intermediate layer.

(a) Let H denote the set of all neural networks defined as above with $k \geq 2$ internal nodes. Show that the growth function $\Pi_{\mathcal{H}}(m)$ can be upper bounded in terms of the product of the growth functions of the hypothesis sets defined at each intermediate layer.

(b) Use that to upper bound the VC-dimension of the C-neural networks (Hint: you can use the implication $m = 2x \log_{2}(xy) \Rightarrow m > x \log_{2}(ym)$ valid for $m \geq 1$ , and $x, y > 0$ with $xy > 4)$

(c) Let C be the family of concept classes defined by threshold functions ${\mathcal{C}} =$ $\left\{\operatorname{sgn}(\sum_{j = 1}^{r} w_{j} x_{j}) \colon \mathbf{w} \in \mathbb{R}^{r} \right\}$ . Give an upper bound on the VC-dimension of H in terms of k and r.

3.28 VC-dimension of convex combinations. Let H be a family of functions mapping from an input space X to $\{- 1, + 1\}$ and let T be a positive integer. Give an upper bound on the VC-dimension of the family of functions $\mathcal{F}_{T}$ defined by

$$
\mathcal{F} = \left\{\operatorname{sgn} \left(\sum_{t = 1}^{T} \alpha_{t} h_{t}\right): h_{t} \in \mathcal{H}, \alpha_{t} \geq 0, \sum_{t = 1}^{T} \alpha_{t} \leq 1 \right\}.
$$

(Hint: you can use exercise 3.27 and its solution).

3.29 Infinite VC-dimension.

## 3.6 Exercises

(a) Show that if a concept class C has infinite VC-dimension, then it is not PAC-learnable.

(b) In the standard PAC-learning scenario, the learning algorithm receives all examples first and then computes its hypothesis. Within that setting, PAClearning of concept classes with infinite VC-dimension is not possible as seen in the previous question.

Imagine now a different scenario where the learning algorithm can alternate between drawing more examples and computation. The objective of this problem is to prove that PAC-learning can then be possible for some concept classes with infinite VC-dimension.

Consider for example the special case of the concept class C of all subsets of natural numbers. Professor Vitres has an idea for the first stage of a learning algorithm L PAC-learning C. In the first stage, L draws a sufficient number of points m such that the probability of drawing a point beyond the maximum value M observed be small with high confidence. Can you complete Professor Vitres’ idea by describing the second stage of the algorithm so that it PAClearns C? The description should be augmented with the proof that L can PAC-learn C.

3.30 VC-dimension generalization bound – realizable case. In this exercise we show that the bound given in corollary 3.19 can be improved to $O \big(\frac{d \log(m / d)}{m} \big)$ in the realizable setting. Assume we are in the realizable scenario, i.e. the target concept is included in our hypothesis class H. We will show that if a hypothesis h is consistent with a sample $S \sim \mathcal{D}^{m}$ then for any $\epsilon > 0$ such that $m \in \geq 8$

$$
\mathbb{P}[R(h) > \epsilon] \leq 2 \Bigl[\frac{2em}{d} \Bigr]^{d} 2^{- m \epsilon / 2}.\tag{3.54}
$$

(a) Let $\mathcal{H}_{S} \subseteq \mathcal{H}$ be the subset of hypotheses consistent with the sample S, let $\widehat{R}_{S}(h)$ denote the empirical error with respect to the sample S and define $S^{\prime}$ as another independent sample drawn from $\Phi^{m}$ . Show that the following inequality holds for any $h_{0} \in \mathcal{K}_{S}$

$$
\mathbb{P} \left[\sup_{h \in \mathcal{H}_{S}} | \widehat{R}_{S}(h) - \widehat{R}_{S^{\prime}}(h) | > \frac{\epsilon}{2} \right] \geq \mathbb{P} \left[B(m, \epsilon) > \frac{m \epsilon}{2} \right] \mathbb{P}[R(h_{0}) > \epsilon],
$$

where $B(m, \epsilon)$ is a binomial random variable with parameters $(m, \epsilon)$ . (Hint : prove and use the fact that $\begin{array}{r}{\mathbb{P}[\widehat{R}_{S}(h) \geq \frac{\epsilon}{2}] \geq \mathbb{P}[\widehat{R}_{S}(h) > \frac{\epsilon}{2} \land R(h) > \epsilon].)} \end{array}$

(b) Prove that $\begin{array}{r}{\mathbb{P} \left\lceil B(m, \epsilon) > \frac{m \epsilon}{2} \right\rceil \geq \frac{1}{2}} \end{array}$ . Use this inequality along with the result from (a) to show that for any $h_{0} \in \mathcal{K}_{S}$

$$
\mathbb{P} \left[R(h_{0}) > \epsilon \right] \leq 2 \mathbb{P} \left[\sup_{h \in \mathcal{H}_{S}} | \widehat{R}_{S}(h) - \widehat{R}_{S^{\prime}}(h) | > \frac{\epsilon}{2} \right].
$$

(c) Instead of drawing two samples, we can draw one sample T of size 2m then uniformly at random split it into S and $S^{\prime}$ . The right hand side of part (b) can then be rewritten as:

$$
\mathbb{P}\left[\sup_{h\in \mathcal{H}_{S}}|\widehat{R}_{S}(h) - \widehat{R}_{S^{\prime}}(h)| > \frac{\epsilon}{2}\right] = \mathop{\mathbb{P}}_{\substack{T\sim \mathcal{D}^{2m}:\\ T\to[S,S^{\prime}]}}\Big[\exists h\in \mathcal{H}\colon \widehat{R}_{S}(h) = 0\land \widehat{R}_{S^{\prime}}(h) > \frac{\epsilon}{2}\Big].
$$

Let $h_{0}$ be a hypothesis such that $\widehat{R}_{T}(h_{0}) > \frac{\epsilon}{2}$ and let $l > \frac{m \epsilon}{2}$ be the total number of errors $h_{0}$ makes on T . Show that the probability of all l errors falling into $S^{\prime}$ is upper bounded by $2^{- l}$

(d) Part (b) implies that for any $h \in{\mathcal{H}}$

$$
\mathbb{P}_{\substack{T\sim \mathcal{D}^{2m}:\\ T\to(S,S^{\prime})}}\Big[\widehat{R}_{S}(h) = 0 \wedge \widehat{R}_{S^{\prime}}(h) > \frac{\epsilon}{2} \Big|\ \widehat{R}_{T}(h_{0}) > \frac{\epsilon}{2}\Big]\leq 2^{-l}.
$$

Use this bound to show that for any $h \in{\mathcal{H}}$

$$
\mathbb{P}_{\substack{T\sim \mathcal{D}^{2m}:\\ T\to(S,S^{\prime})}}\Bigl[\widehat{R}_{S}(h) = 0 \land \widehat{R}_{S^{\prime}}(h) > \frac{\epsilon}{2}\Bigr]\leq 2^{-\frac{\epsilon m}{2}}.
$$

(e) Complete the proof of inequality (3.54) by using the union bound to upper bound $\mathbb{P}_{T \sim \mathfrak{D}^{2m};} \Big[\exists h \in \mathfrak{H} \colon \widehat{R}_{S}(h) = 0 \land \widehat{R}_{S^{\prime}}(h) > \frac{\epsilon}{2} \Big]$ . Show that we can achieve a high probability generalization bound that is of the order $O \big(\frac{d \log(m / d)}{m} \big)$

3.31 Generalization bound based on covering numbers. Let H be a family of functions mapping X to a subset of real numbers $\y \subseteq \mathbb{R}$ . For any $\epsilon > 0$ , the covering number $\mathcal{N}(\mathcal{\hat{H}}, \epsilon)$ of H for the $L_{\infty}$ norm is the minimal $k \in \mathbb N$ such that H can be covered with k balls of radius $\epsilon$, that is, there exists $\{h_{1}, \ldots, h_{k}\} \subseteq{\mathcal{H}}$ such that, for all $h \in{\mathcal{H}}$ , there exists $i \leq k$ with $\begin{array}{r}{\| h - h_{i} \|_{\infty} = \operatorname{max}_{x \in \mathcal{X}} | h(x) - h_{i}(x) | \le \epsilon.} \end{array}$ In particular, when H is a compact set, a finite covering can be extracted from a covering of H with balls of radius $\epsilon$ and thus $\mathcal{N}(\mathcal{\hat{H}}, \epsilon)$ is finite.

Covering numbers provide a measure of the complexity of a class of functions: the larger the covering number, the richer is the family of functions. The objective of this problem is to illustrate this by proving a learning bound in the case of the squared loss. Let D denote a distribution over $\mathcal X \times \mathcal Y$ according to which labeled examples are drawn. Then, the generalization error of $h \in{\mathcal{H}}$ for the squared loss is defined by $R(h) = \mathbb{E}_{(x, y) \sim \mathcal{D}}[(h(x) - y)^{2}]$ and its empirical error for a labeled sample $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m}))$ by $\begin{array}{r}{\widehat{R}_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m}(h(x_{i}) - y_{i})^{2}} \end{array}$ We will assume that H is bounded, that is there exists $M \ > \0$ such that $| h(x) - y | \leq M$ for all $(x, y) \in \mathcal{X} \times \mathcal{Y}$ . The following is the generalization bound proven in this problem:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\sup_{h \in \mathcal{H}} | R(h) - \widehat{R}_{S}(h) | \geq \epsilon \right] \leq \mathcal{N} \Big(\mathcal{H}, \frac{\epsilon}{8M} \Big) 2 \exp \left(\frac{- m \epsilon^{2}}{2M^{4}}\right).\tag{3.55}
$$

The proof is based on the following steps.

(a) Let $L_{S} = R(h) - \widehat{R}_{S}(h)$ , then show that for all $h_{1}, h_{2} \in \mathcal{H}$ and any labeled sample S, the following inequality holds:

$$
| L_{S}(h_{1}) - L_{S}(h_{2}) | \leq 4M \| h_{1} - h_{2} \|_{\infty}.
$$

(b) Assume that H can be covered by k subsets $\mathcal{B}_{1}, \ldots, \mathcal{B}_{k}$ , that is $\mathcal{H} = \mathcal{B}_{1} \cup$ $\ldots \cup \mathcal{B}_{k}$ . Then, show that, for any $\epsilon > 0$ , the following upper bound holds:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\sup_{h \in \mathcal{H}} | L_{S}(h) | \geq \epsilon \right] \leq \sum_{i = 1}^{k} \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\sup_{h \in \mathcal{B}_{i}} | L_{S}(h) | \geq \epsilon \right].
$$

(c) Finally, let $\begin{array}{r}{k = \mathcal{N}(\mathcal{H}, \frac{\epsilon}{8M})} \end{array}$ and let $\mathcal{B}_{1}, \ldots, \mathcal{B}_{k}$ be balls of radius $\epsilon /(8M)$ centered at $h_{1}, \ldots, h_{k}$ covering H. Use part (a) to show that for all $i \in[k]$ ，

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\sup_{h \in \mathcal{B}_{i}} | L_{S}(h) | \geq \epsilon \right] \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[| L_{S}(h_{i}) | \geq \frac{\epsilon}{2} \right],
$$

and apply Hoefding’s inequality (theorem D.2) to prove (3.55).

A key problem in the design of learning algorithms is the choice of the hypothesis set H. This is known as the model selection problem. How should the hypothesis set H be chosen? A rich or complex enough hypothesis set could contain the ideal Bayes classifier. On the other hand, learning with such a complex family becomes a very dificult task. More generally, the choice of H is subject to a trade-of that can be analyzed in terms of the estimation and approximation errors.

Our discussion will focus on the particular case of binary classification but much of what is discussed can be straightforwardly extended to different tasks and loss functions.


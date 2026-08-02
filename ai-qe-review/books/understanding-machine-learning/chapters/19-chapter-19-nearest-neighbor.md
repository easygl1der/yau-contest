---
title: "Chapter 19 \u2014 Nearest Neighbor"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 19
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 6592
source_line_end: 6939
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 1
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 3
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 19 — Nearest Neighbor

> [[../README|本书目录]] · [[18-chapter-18-decision-trees|上一章]] · [[20-chapter-20-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 6592–6939。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 3；different × 1；efficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 19.1 k Nearest Neighbors

Throughout the entire chapter we assume that our instance domain, $x,$ , is endowed with a metric function $\rho.$ That is, $\rho : \mathcal{X} \times \mathcal{X} \mathbb{R}$ is a function that returns the distance between any two elements of X . For example, if $\mathcal{X} = \mathbb{R}^{d}$ then $\rho$ can be the Euclidean distance, $\begin{array}{r}{\rho(\mathbf{x}, \mathbf{x}^{\prime}) = \| \mathbf{x} - \mathbf{x}^{\prime} \| = \sqrt{\sum_{i = 1}^{d}(x_{i} - x_{i}^{\prime})^{2}}} \end{array}$

Let $S =(\mathbf{x}_{1}, y_{1}), \dots,(\mathbf{x}_{m}, y_{m})$ be a sequence of training examples. For each $\textbf{x} \in \mathcal{X}$ , let $\pi_{1}(\mathbf{x}), \ldots, \pi_{m}(\mathbf{x})$ be a reordering of $\{1, \ldots, m\}$ according to their distance to $\mathbf{x}, \rho(\mathbf{x}, \mathbf{x}_{i})$ . That is, for all $i < m$ ,

$$
\rho(\mathbf{x}, \mathbf{x}_{\pi_{i}(\mathbf{x})}) \leq \rho(\mathbf{x}, \mathbf{x}_{\pi_{i + 1}(\mathbf{x})}).
$$

For a number k, the k-NN rule for binary classification is defined as follows:

![Figure 19.1](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/f4c4c1087a7a5c65daeca65dc4e129ca19ee4f79448b07b4db24677561928fa7.jpg)  
Figure 19.1 An illustration of the decision boundaries of the 1-NN rule. The points depicted are the sample points, and the predicted label of any new point will be the label of the sample point in the center of the cell it belongs to. These cells are called a Voronoi Tessellation of the space.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
k-NN
input: a training sample  $S =(\mathbf{x}_{1}, y_{1}), \ldots,(\mathbf{x}_{m}, y_{m})$ 
output: for every point  $x \in X$ ,
return the majority label among  $\{y_{\pi_{i}(\mathbf{x})}: i \leq k\}$
</div>

When $k = 1$ , we have the 1-NN rule:

$$
h_{S}(\mathbf{x}) = y_{\pi_{1}(\mathbf{x})}.
$$

A geometric illustration of the 1-NN rule is given in Figure 19.1.

For regression problems, namely, $\mathcal{V} = \mathbb{R}$ , one can define the prediction to be the average target of the k nearest neighbors. That is, $\begin{array}{r}{h_{S}(\mathbf{x}) = \frac{1}{k} \sum_{i = 1}^{k} y_{\pi_{i}(\mathbf{x})}} \end{array}$ More generally, for some function $\phi :(\mathcal{X} \times \mathcal{Y})^{k} \mathcal{Y}$ , the k-NN rule with respect to φ is:

$$
h_{S}(\mathbf{x}) = \phi \left((\mathbf{x}_{\pi_{1}(\mathbf{x})}, y_{\pi_{1}(\mathbf{x})}), \ldots,(\mathbf{x}_{\pi_{k}(\mathbf{x})}, y_{\pi_{k}(\mathbf{x})})\right).\tag{19.1}
$$

It is easy to verify that we can cast the prediction by majority of labels (for classification) or by the averaged target (for regression) as in Equation (19.1) by an appropriate choice of φ. The generality can lead to other rules; for example, if $\mathcal{V} = \mathbb{R}$ , we can take a weighted average of the targets according to the distance from x:

$$
h_{S}(\mathbf{x}) = \sum_{i = 1}^{k} \frac{\rho(\mathbf{x}, \mathbf{x}_{\pi_{i}(\mathbf{x})})}{\sum_{j = 1}^{k} \rho(\mathbf{x}, \mathbf{x}_{\pi_{j}(\mathbf{x})})} y_{\pi_{i}(\mathbf{x})}.
$$

## 19.2 Analysis

Since the NN rules are such natural learning methods, their generalization properties have been extensively studied. Most previous results are asymptotic consistency results, analyzing the performance of NN rules when the sample size, m, goes to infinity, and the rate of convergence depends on the underlying distribution. $\mathrm{As}$ we have argued in Section 7.4, this type of analysis is not satisfactory. One would like to learn from finite training samples and to understand the generalization performance as a function of the size of such finite training sets and clear prior assumptions on the data distribution. We therefore provide a finitesample analysis of the 1-NN rule, showing how the error decreases as a function of m and how it depends on properties of the distribution. We will also explain how the analysis can be generalized to k-NN rules for arbitrary values of k. In particular, the analysis specifies the number of examples required to achieve a true error of $2L_{{\mathcal{D}}}(h^{\star}) + \epsilon.$ , where $h^{\star}$ is the Bayes optimal hypothesis, assuming that the labeling rule is “well behaved” (in a sense we will define later).

## 19.2.1 A Generalization Bound for the 1-NN Rule

We now analyze the true error of the 1-NN rule for binary classification with the 0-1 loss, namely, $\mathcal{V} = \{0, 1\}$ and $\ell(h,(\mathbf{x}, y)) = \mathbb{1}_{[h(\mathbf{x}) \neq y]}$ . We also assume throughout the analysis that $\mathcal{X} =[0, 1]^{d}$ and $\rho$ is the Euclidean distance.

We start by introducing some notation. Let $\mathcal{D}$ be a distribution over $\mathcal{X} \times \mathcal{V}$ Let $\mathcal{D}_{\mathcal{X}}$ denote the induced marginal distribution over $\mathcal{X}$ and let $\eta : \mathbb{R}^{d} \mathbb{R}$ be the conditional probability<sup>1</sup> over the labels, that is,

$$
\eta(\mathbf{x}) = \mathbb{P}[y = 1 | \mathbf{x}].
$$

Recall that the Bayes optimal rule (that is, the hypothesis that minimizes $L_{\mathcal{D}}(h)$ over all functions) is

$$
h^{\star}(\mathbf{x}) = \mathbb{1}_{[\eta(\mathbf{x}) > 1 / 2]}.
$$

We assume that the conditional probability function η is c-Lipschitz for some $c > 0 :$ Namely, for all $\mathbf{x}, \mathbf{x}^{\prime} \in \mathcal{X}, | \eta(\mathbf{x}) - \eta(\mathbf{x}^{\prime}) | \leq c \| \mathbf{x} - \mathbf{x}^{\prime} \|$ . In other words, this assumption means that if two vectors are close to each other then their labels are likely to be the same.

The following lemma applies the Lipschitzness of the conditional probability function to upper bound the true error of the 1-NN rule as a function of the expected distance between each test instance and its nearest neighbor in the training set.

<sup>lemma</sup> 19.1 Let $\mathcal{X} =[0, 1]^{d}, \mathcal{Y} = \{0, 1\}$ , and $\mathcal{D}$ be a distribution over $\mathcal{X} \times \mathcal{V}$ for which the conditional probability function, η, is a c-Lipschitz function. Let $S =(\mathbf{x}_{1}, y_{1}), \dots,(\mathbf{x}_{m}, y_{m})$ be an i.i.d. sample and let $h_{S}$ be its corresponding 1-NN hypothesis. Let $h^{\star}$ be the Bayes optimal rule for η. Then,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{\mathcal{D}}(h_{S})] \leq 2L_{\mathcal{D}}(h^{\star}) + c \underset{S \sim \mathcal{D}^{m}, \mathbf{x} \sim \mathcal{D}}{\mathbb{E}}[\| \mathbf{x} - \mathbf{x}_{\pi_{1}(\mathbf{x})} \|].
$$

<sup>1</sup> Formally, $\begin{array}{r}{\mathbb{P}[y = 1 | \mathbf{x}] = \operatorname{lim}_{\delta 0} \frac{\mathcal{D}(\{(\mathbf{x}^{\prime}, 1) : \mathbf{x}^{\prime} \in B(\mathbf{x}, \delta)\})}{\mathcal{D}(\{(\mathbf{x}^{\prime}, y) : \mathbf{x}^{\prime} \in B(\mathbf{x}, \delta), y \in \mathcal{V}\})}} \end{array}$ , where $B(\mathbf{x}, \delta)$ is a ball of radius δ centered around x.

Proof Since $L_{\mathcal{D}}(h_{S}) = \mathbb{E}_{(\mathbf{x}, y) \sim \mathcal{D}}[\mathbb{1}_{[h_{S}(\mathbf{x}) \neq y]}]$ , we obtain that $\mathbb{E}_{S}[L_{\mathcal{D}}(h_{S})]$ is the probability to sample a training set S and an additional example $\left(\mathbf{x}, y \right)$ , such that the label of $\pi_{1}(\mathbf{x})$ is different from y. In other words, we can first sample m unlabeled examples, $S_{x} =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m})$ , according to $\mathcal{D}_{\mathcal{X}}$ , and an additional unlabeled example, $\mathbf{x} \sim \mathcal{D}_{\mathcal{X}}$ , then find $\pi_{1}(\mathbf{x})$ to be the nearest neighbor of $\mathbf{x}$ in $S_{x}$ , and finally sample $y \sim \eta(\mathbf{x})$ and $y_{\pi_{1}(\mathbf x)} \sim \eta(\pi_{1}(\mathbf x))$ . It follows that

$$
\begin{array}{c} \mathbb{E}[L_{\mathcal{D}}(h_{S})] = \underset{S_{x} \sim \mathcal{D}_{\mathcal{X}}^{m}, \mathbf{x} \sim \mathcal{D}_{\mathcal{X}}, y \sim \eta(\mathbf{x}), y^{\prime} \sim \eta(\pi_{1}(\mathbf{x}))}{\mathbb{E}}[\mathbb{1}_{[y \neq y^{\prime}]}] \\ = \underset{S_{x} \sim \mathcal{D}_{\mathcal{X}}^{m}, \mathbf{x} \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\underset{y \sim \eta(\mathbf{x}), y^{\prime} \sim \eta(\pi_{1}(\mathbf{x}))}{\mathbb{P}}[y \neq y^{\prime}] \right].\end{array}\tag{19.2}
$$

We next upper bound $\mathbb{P}_{y \sim \eta(\mathbf{x}), y^{\prime} \sim \eta(\mathbf{x}^{\prime})}[y \neq y^{\prime}]$ for any two domain points $\mathbf{x}, \mathbf{x}^{\prime}{\mathrm{:}}$

$$
\begin{array}{rl} \mathbb{P}_{y \sim \eta(\mathbf{x}), y^{\prime} \sim \eta(\mathbf{x}^{\prime})}[y \neq y^{\prime}] & = \eta(\mathbf{x}^{\prime})(1 - \eta(\mathbf{x})) +(1 - \eta(\mathbf{x}^{\prime})) \eta(\mathbf{x}) \\ & =(\eta(\mathbf{x}) - \eta(\mathbf{x}) + \eta(\mathbf{x}^{\prime}))(1 - \eta(\mathbf{x})) \\ & \quad +(1 - \eta(\mathbf{x}) + \eta(\mathbf{x}) - \eta(\mathbf{x}^{\prime})) \eta(\mathbf{x}) \\ & = 2 \eta(\mathbf{x})(1 - \eta(\mathbf{x})) +(\eta(\mathbf{x}) - \eta(\mathbf{x}^{\prime}))(2 \eta(\mathbf{x}) - 1).\end{array}
$$

Using $| 2 \eta(\mathbf{x}) - 1 | \leq 1$ and the assumption that $\eta$ is c-Lipschitz, we obtain that the probability is at most:

$$
\underset{y \sim \eta(\mathbf{x}), y^{\prime} \sim \eta(\mathbf{x}^{\prime})}{\mathbb{P}}[y \neq y^{\prime}] \leq 2 \eta(\mathbf{x})(1 - \eta(\mathbf{x})) + c \| \mathbf{x} - \mathbf{x}^{\prime} \|.
$$

Plugging this into Equation (19.2) we conclude that

$$
\underset{S}{\mathbb{E}}[L_{\mathcal{D}}(h_{S})] \leq \underset{\mathbf{x}}{\mathbb{E}}[2 \eta(\mathbf{x})(1 - \eta(\mathbf{x}))] + c \underset{S, \mathbf{x}}{\mathbb{E}}[\| \mathbf{x} - \mathbf{x}_{\pi_{1}(\mathbf{x})} \|].
$$

Finally, the error of the Bayes optimal classifier is

$$
L_{\mathcal{D}}(h^{\star}) = \underset{\mathbf{x}}{\mathbb{E}}[\min \{\eta(\mathbf{x}), 1 - \eta(\mathbf{x})\}] \geq \underset{\mathbf{x}}{\mathbb{E}}[\eta(\mathbf{x})(1 - \eta(\mathbf{x}))].
$$

Combining the preceding two inequalities concludes our proof.

The next step is to bound the expected distance between a random x and its closest element in S. We first need the following general probability lemma. The lemma bounds the probability weight of subsets that are not hit by a random sample, as a function of the size of that sample.

<sup>lemma</sup> 19.2 Let $C_{1}, \ldots, C_{r}$ be a collection of subsets of some domain set, $\mathcal{X}$ Let S be a sequence of m points sampled i.i.d. according to some probability distribution, D over X . Then,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sum_{i: C_{i} \cap S = \emptyset} \mathbb{P}[C_{i}] \right] \leq \frac{r}{me}.
$$

Proof From the linearity of expectation, we can rewrite:

$$
\mathbb{E}_{S} \left[\sum_{i: C_{i} \cap S = \emptyset} \mathbb{P}[C_{i}] \right] = \sum_{i = 1}^{r} \mathbb{P}[C_{i}] \mathbb{E}_{S} \left[\mathbb{1}_{[C_{i} \cap S = \emptyset]} \right].
$$

Next, for each i we have

$$
\underset{S}{\mathbb{E}} \left[\mathbb{1}_{[C_{i} \cap S = \emptyset]} \right] = \underset{S}{\mathbb{P}}[C_{i} \cap S = \emptyset] =(1 - \mathbb{P}[C_{i}])^{m} \leq e^{- \mathbb{P}[C_{i}] m}.
$$

Combining the preceding two equations we get

$$
\mathbb{E}_{S} \left[\sum_{i: C_{i} \cap S = \emptyset} \mathbb{P}[C_{i}] \right] \leq \sum_{i = 1}^{r} \mathbb{P}[C_{i}] e^{- \mathbb{P}[C_{i}] m} \leq r \max_{i} \mathbb{P}[C_{i}] e^{- \mathbb{P}[C_{i}] m}.
$$

Finally, by a standard calculus, ma $\begin{array}{r}{x_{a} ae^{- ma} \leq \frac{1}{me}} \end{array}$ and this concludes the proof. □

Equipped with the preceding lemmas we are now ready to state and prove the main result of this section – an upper bound on the expected error of the 1-NN learning rule.

theorem 19.3 Let $\mathcal{X} =[0, 1]^{d}, \mathcal{Y} = \{0, 1\}$ , and D be a distribution over $\mathcal{X} \times \mathcal{V}$ for which the conditional probability function, η, is a c-Lipschitz function. Let $h_{S}$ denote the result of applying the $1{-} NN$ rule to a sample $S \sim \mathcal{D}^{m}$ . Then,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{\mathcal{D}}(h_{S})] \leq 2L_{\mathcal{D}}(h^{\star}) + 4c \sqrt{d} m^{- \frac{1}{d + 1}}.
$$

Proof Fix some $\epsilon = 1 / T$ , for some integer $T$ , let $r = T^{d}$ and let $C_{1}, \ldots, C_{r}$ be the cover of the set X using boxes of length $\epsilon$: Namely, for every $(\alpha_{1}, \dots, \alpha_{d}) \in[T]^{d}$ ， there exists a set $C_{i}$ of the form $\{\mathbf{x} : \forall j, x_{j} \in[(\alpha_{j} - 1) / T, \alpha_{j} / T]\}$ . An illustration for $d = 2, T = 5$ and the set corresponding to $\alpha =(2, 4)$ is given in the following.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/f64ff083c2b2965dfb8738cc5de4d3854d63eb64b1cd32446439db3946f89bda.jpg)

For each $\mathbf{x}, \mathbf{x}^{\prime}$ in the same box we have $\| \mathbf{x} - \mathbf{x}^{\prime} \| \leq \sqrt{d} \epsilon$ . Otherwise, $\| \mathbf{x} - \mathbf{x}^{\prime} \| \leq{\sqrt{d}}.$ Therefore,

$$
\underset{\mathbf{x}, S}{\mathbb{E}} \left[\| \mathbf{x} - \mathbf{x}_{\pi_{1}(\mathbf{x})} \| \right] \leq \underset{S}{\mathbb{E}} \left[\mathbb{P} \left[\bigcup_{i: C_{i} \cap S = \emptyset} C_{i} \right] \sqrt{d} + \mathbb{P} \left[\bigcup_{i: C_{i} \cap S \neq \emptyset} C_{i} \right] \epsilon \sqrt{d} \right],
$$

and by combining Lemma 19.2 with the trivial bound $\begin{array}{r}{\mathbb{P}[\bigcup_{i : C_{i} \cap S \neq \emptyset} C_{i}] \le 1} \end{array}$ we get that

$$
\underset{\mathbf{x}, S}{\mathbb{E}} \left[\left\| \mathbf{x} - \mathbf{x}_{\pi_{1}(\mathbf{x})} \right\| \right] \leq \sqrt{d} \left(\frac{r}{me} + \epsilon\right).
$$

Since the number of boxes is $r =(1 / \epsilon)^{d}$ we get that

$$
\underset{S, \mathbf{x}}{\mathbb{E}} \left[\left\| \mathbf{x} - \mathbf{x}_{\pi_{1}(\mathbf{x})} \right\| \right] \leq \sqrt{d} \left(\frac{2^{d} \epsilon^{- d}}{me} + \epsilon\right).
$$

Combining the preceding with Lemma 19.1 we obtain that

$$
\underset{S}{\mathbb{E}}[L_{\mathcal{D}}(h_{S})] \leq 2L_{\mathcal{D}}(h^{\star}) + c \sqrt{d} \left(\frac{2^{d} \epsilon^{- d}}{me} + \epsilon\right).
$$

Finally, setting $\epsilon = 2m^{- 1 /(d + 1)}$ and noting that

$$
\begin{array}{c} \frac{2^{d} \epsilon^{- d}}{me} + \epsilon = \frac{2^{d} 2^{- d} m^{d /(d + 1)}}{me} + 2m^{- 1 /(d + 1)} \\ = m^{- 1 /(d + 1)}(1 / e + 2) \leq 4m^{- 1 /(d + 1)} \end{array}
$$

we conclude our proof.

The theorem implies that if we first fix the data-generating distribution and then let m $_\mathrm{go}$ to infinity, then the error of the 1-NN rule converges to twice the Bayes error. The analysis can be generalized to larger values of $k,$ showing that the expected error of the k-NN rule converges to $(1 +{\sqrt{8 / k}})$ times the error of the Bayes classifier. This is formalized in Theorem 19.5, whose proof is left as a guided exercise.

## 19.2.2 The “Curse of Dimensionality”

The upper bound given in Theorem 19.3 grows with c (the Lipschitz coeficient of $\eta)$ and with $d,$ the Euclidean dimension of the domain set X . In fact, it is easy to see that a necessary condition for the last term in Theorem 19.3 to be smaller than $\epsilon$ is that $m \ge(4c \sqrt{d} / \epsilon)^{d + 1}$ . That ${\mathrm{is}},$ , the size of the training set should increase exponentially with the dimension. The following theorem tells us that this is not just an artifact of our upper bound, but, for some distributions, this amount of examples is indeed necessary for learning with the NN rule.

<sup>theorem</sup> 19.4 For any $c > 1$ , and every learning rule, L, there exists a distribution over $[0, 1]^{d} \times \{0, 1\}$ , such that $\eta(\mathbf{x})$ is c-Lipschitz, the Bayes error of the distribution is $0_{i}$ , but $for$ sample sizes $m \leq(c + 1)^{d} / 2$ , the true error of the rule L is greater than $1 / 4$

Proof Fix any values of c and d. Let $G_{c}^{d}$ be the grid on $[0, 1]^{d}$ with distance of $1 / c$ between points on the grid. That is, each point on the grid is of the form $(a_{1} / c, \dots, a_{d} / c)$ where $a_{i}$ is in $\{0, \ldots, c - 1, c\}$ . Note that, since any two distinct points on this grid are at least $1 / c$ apart, any function $\eta : G_{C}^{D} \to[0, 1]$ is a c-Lipschitz function. It follows that the set of all c-Lipschitz functions over $G_{c}^{d}$ contains the set of $all$ binary valued functions over that domain. We can therefore invoke the No-Free-Lunch result (Theorem 5.1) to obtain a lower bound on the needed sample sizes for learning that class. The number of points on the grid is $(c + 1)^{d};$ ; hence, if $m <(c + 1)^{d} / 2$ , Theorem 5.1 implies the lower bound we are after. □

The exponential dependence on the dimension is known as the curse of dimensionality. As we saw, the 1-NN rule might fail if the number of examples is smaller than $\Omega((c + 1)^{d})$ . Therefore, while the 1-NN rule does not restrict itself to a predefined set of hypotheses, it still relies on some prior knowledge – its success depends on the assumption that the dimension and the Lipschitz constant of the underlying distribution, η, are not too high.

## 19.3 efficient Implementation\*

Nearest Neighbor is a learning-by-memorization type of rule. It requires the entire training data set to be stored, and at test time, we need to scan the entire data set in order to find the neighbors. The time of applying the NN rule is therefore $\Theta(dm)$ . This leads to expensive computation at test time.

When d is small, several results from the field of computational geometry have proposed data structures that enable to apply the NN rule in time $o \big(d^{O(1)} \log(m) \big)$ . However, the space required by these data structures is roughly $m^{O(d)}$ , which makes these methods impractical for larger values of d.

To overcome this problem, it was suggested to improve the search method by allowing an approximate search. Formally, an r-approximate search procedure is guaranteed to retrieve a point within distance of at most r times the distance to the nearest neighbor. Three popular approximate algorithms for NN are the kd-tree, balltrees, and locality-sensitive hashing (LSH). We refer the reader, for example, to (Shakhnarovich, Darrell & Indyk 2006).

## 19.4 Summary

The k-NN rule is a very simple learning algorithm that relies on the assumption that “things that look alike must be alike.” We formalized this intuition using the Lipschitzness of the conditional probability. We have shown that with a sufficiently large training set, the risk of the 1-NN is upper bounded by twice the risk of the Bayes optimal rule. We have also derived a lower bound that shows the “curse of dimensionality” – the required sample size might increase exponentially with the dimension. As a result, NN is usually performed in practice after a dimensionality reduction preprocessing step. We discuss dimensionality reduction techniques later on in Chapter 23.

## 19.5 Bibliographic Remarks

Cover & Hart (1967) gave the first analysis of 1-NN, showing that its risk converges to twice the Bayes optimal error under mild conditions. Following a lemma due to Stone (1977), Devroye & Gy¨orfi (1985) have shown that the k-NN rule is consistent (with respect to the hypothesis class of all functions from $\mathbb{R}^{d}$ to {0, 1}). A good presentation of the analysis is given in the book of Devroye et al. (1996). Here, we give a finite sample guarantee that explicitly underscores the prior assumption on the distribution. See Section 7.4 for a discussion on consistency results. Finally, Gottlieb, Kontorovich & Krauthgamer (2010) derived another finite sample bound for NN that is more similar to VC bounds.

## 19.6 Exercises

In this exercise we will prove the following theorem for the k-NN rule.

theorem 19.5 Let $\mathcal{X} =[0, 1]^{d}, \mathcal{Y} = \{0, 1\}$ , and D be a distribution over $\mathcal{X} \times \mathcal{V}$ for which the conditional probability function, η, is a c-Lipschitz function. Let $h_{S}$ denote the result of applying the k-NN rule to a sample $S \sim \mathcal{D}^{m}$ , where $k \geq 10$ Let $h^{\star}$ be the Bayes optimal hypothesis. Then,

$$
\mathbb{E}_{S}[L_{\mathcal{D}}(h_{S})] \leq \left(1 + \sqrt{\frac{8}{k}}\right) L_{\mathcal{D}}(h^{\star}) + \left(6c \sqrt{d} + k\right) m^{- 1 /(d + 1)}.
$$

1. Prove the following lemma.

<sup>lemma</sup> 19.6 Let $C_{1}, \ldots, C_{r}$ be a collection of subsets of some domain set, X . Let S be a sequence of m points sampled i.i.d. according to some probability distribution, D over X . Then, for every $k \geq 2$

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sum_{i: | C_{i} \cap S | < k} \mathbb{P}[C_{i}] \right] \leq \frac{2rk}{m}.
$$

Hints:

- Show that

$$
\mathbb{E}_{S} \left[\sum_{i: | C_{i} \cap S | < k} \mathbb{P}[C_{i}] \right] = \sum_{i = 1}^{r} \mathbb{P}[C_{i}] \mathbb{P}_{S} \left[| C_{i} \cap S | < k \right].
$$

- Fix some i and suppose that $k < \mathbb{P}[C_{i}] m / 2$ . Use Chernof’s bound to show that

$$
\mathbb{P}_{S} \left[| C_{i} \cap S | < k \right] \leq \mathbb{P}_{S} \left[| C_{i} \cap S | < \mathbb{P}[C_{i}] m / 2 \right] \leq e^{- \mathbb{P}[C_{i}] m / 8}.
$$

- Use the inequality ma $x_{a} ae^{- ma} \leq{\frac{1}{me}}$ to show that for such i we have

$$
\mathbb{P}[C_{i}] \underset{S}{\mathbb{P}}[| C_{i} \cap S | < k] \leq \mathbb{P}[C_{i}] e^{- \mathbb{P}[C_{i}] m / 8} \leq \frac{8}{me}.
$$

- Conclude the proof by using the fact that for the case $k \ge \mathbb{P}[C_{i}] m / 2$ we clearly have:

$$
\mathbb{P}[C_{i}] \underset{S}{\mathbb{P}}[| C_{i} \cap S | < k] \leq \mathbb{P}[C_{i}] \leq \frac{2k}{m}.
$$

2. We use the notation $y \sim p$ as a shorthand for $^{66} y$ is a Bernoulli random variable with expected value $p.{\overset{\underset{\mathrm{~ \tiny ~ 5 ~}}{}}{}}$ Prove the following lemma:

<sup>lemma</sup> 19.7 Let $k \geq 10$ and let $Z_{1}, \ldots, Z_{k}$ be independent Bernoulli random variables with $\mathbb{P}[Z_{i} = 1] = p_{i}$ . Denote $\begin{array}{r}{p = \frac{1}{k} \sum_{i} p_{i}} \end{array}$ and $\begin{array}{r}{p^{\prime} = \frac{1}{k} \sum_{i = 1}^{k} Z_{i}} \end{array}$ . Show that

$$
\underset{Z_{1}, \ldots, Z_{k}}{\mathbb{E}} \underset{y \sim p}{\mathbb{P}}[y \neq \mathbb{1}_{[p^{\prime} > 1 / 2]}] \leq \left(1 + \sqrt{\frac{8}{k}}\right) \underset{y \sim p}{\mathbb{P}}[y \neq \mathbb{1}_{[p > 1 / 2]}].
$$

Hints:

W. $\operatorname{l.o.g.}$ assume that $p \leq 1 / 2$ . Then, $\mathbb{P}_{y \sim p}[y \neq \mathbb{1}_{[p > 1 / 2]}] = p.$ . Let $y^{\prime} = \mathbb{1}_{[p^{\prime} > 1 / 2]}$ • Show that

$$
\underset{Z_{1}, \ldots, Z_{k}}{\mathbb{E}} \underset{y \sim p}{\mathbb{P}}[y \neq y^{\prime}] - p = \underset{Z_{1}, \ldots, Z_{k}}{\mathbb{P}}[p^{\prime} > 1 / 2](1 - 2p).
$$

- Use Chernof’s bound (Lemma B.3) to show that

$$
\mathbb{P}[p^{\prime} > 1 / 2] \leq e^{- kph \left(\frac{1}{2p} - 1\right)},
$$

where

$$
h(a) =(1 + a) \log(1 + a) - a.
$$

- To conclude the proof of the lemma, you can rely on the following inequality (without proving it): For every $p \in[0, 1 / 2]$ and $k \geq 10 :$

$$
(1 - 2p) e^{- kp + \frac{k}{2}(\log(2p) + 1)} \leq \sqrt{\frac{8}{k}} p.
$$

3. Fix some $p, p^{\prime} \in[0, 1]$ and $y^{\prime} \in \{0, 1\}$ . Show that

$$
\underset{y \sim p}{\mathbb{P}}[y \neq y^{\prime}] \leq \underset{y \sim p^{\prime}}{\mathbb{P}}[y \neq y^{\prime}] + | p - p^{\prime} |.
$$

4. Conclude the proof of the theorem according to the following steps:

- As in the proof of Theorem 19.3, six some $\epsilon > 0$ and let $C_{1}, \ldots, C_{r}$ be the cover of the set X using boxes of length $\epsilon$. For each $\mathbf{x}, \mathbf{x}^{\prime}$ in the same box we have $\| \mathbf{x} - \mathbf{x}^{\prime} \| \leq \sqrt{d} \epsilon$ . Otherwise, $\| \mathbf{x} - \mathbf{x}^{\prime} \| \leq 2{\sqrt{d}}$ . Show that

$$
\begin{array}{l} \mathbb{E}_{S}[L_{\mathcal{D}}(h_{S})] \leq \mathbb{E}_{S} \left[\sum_{i: | C_{i} \cap S | < k} \mathbb{P}[C_{i}] \right] \\ + \max_{i} \mathbb{P}_{S,(\mathbf{x}, y)} \left[h_{S}(\mathbf{x}) \neq y \mid \forall j \in[k], \| \mathbf{x} - \mathbf{x}_{\pi_{j}(\mathbf{x})} \| \leq \epsilon \sqrt{d} \right].\end{array}\tag{19.3}
$$

- Bound the first summand using Lemma 19.6.

- To bound the second summand, let us fix $S |_{x}$ and x such that all the k neighbors of x in $S |_{x}$ are at distance of at most $\epsilon \sqrt{d}$ from x. W.l.o.g assume that the k NN are $\mathbf{x}_{1}, \ldots, \mathbf{x}_{k}$ . Denote $p_{i} = \eta(\mathbf{x}_{i})$ and let $p =$ ${\frac{1}{k}} \sum_{i} p_{i}$ . Use Exercise 3 to show that

$$
\underset{y_{1}, \ldots, y_{j}}{\mathbb{E}} \underset{y \sim \eta(\mathbf{x})}{\mathbb{P}}[h_{S}(\mathbf{x}) \neq y] \leq \underset{y_{1}, \ldots, y_{j}}{\mathbb{E}} \underset{y \sim p}{\mathbb{P}}[h_{S}(\mathbf{x}) \neq y] + | p - \eta(\mathbf{x}) |.
$$

W.l.o.g. assume that $p \leq 1 / 2$ . Now use Lemma 19.7 to show that

$$
\mathbb{P}_{y_{1}, \dots, y_{j}} \mathbb{P}_{y \sim p}[h_{S}(\mathbf{x}) \neq y] \leq \left(1 + \sqrt{\frac{8}{k}}\right) \mathbb{P}_{y \sim p}[\mathbb{1}_{[p > 1 / 2]} \neq y].
$$

- Show that

$$
\underset{y \sim p}{\mathbb{P}}[\mathbb{1}_{[p > 1 / 2]} \neq y] = p = \min \{p, 1 - p\} \leq \min \{\eta(\mathbf{x}), 1 - \eta(\mathbf{x})\} + | p - \eta(\mathbf{x}) |.
$$

- Combine all the preceding to obtain that the second summand in Equation (19.3) is bounded by

$$
\left(1 + \sqrt{\frac{8}{k}}\right) L_{\mathcal{D}}(h^{\star}) + 3c \epsilon \sqrt{d}.
$$

- Use $r =(2 / \epsilon)^{d}$ to obtain that:

$$
\mathbb{E}_{S} \left[L_{\mathcal{D}} \left(h_{S}\right) \right] \leq \left(1 + \sqrt{\frac{8}{k}}\right) L_{\mathcal{D}} \left(h^{\star}\right) + 3c \epsilon \sqrt{d} + \frac{2(2 / \epsilon)^{d} k}{m}.
$$

Set $\epsilon = 2m^{- 1 /(d + 1)}$ and use

$$
6cm^{- 1 /(d + 1)} \sqrt{d} + \frac{2k}{e} m^{- 1 /(d + 1)} \leq \left(6c \sqrt{d} + k\right) m^{- 1 /(d + 1)}
$$

to conclude the proof.

An artificial neural network is a model of computation inspired by the structure of neural networks in the brain. In simplified models of the brain, it consists of a large number of basic computing devices (neurons) that are connected to each other in a complex communication network, through which the brain is able to carry out highly complex computations. Artificial neural networks are formal computation constructs that are modeled after this computation paradigm.

Learning with neural networks was proposed in the mid-20th century. It yields an efective learning paradigm and has recently been shown to achieve cuttingedge performance on several learning tasks.

A neural network can be described as a directed graph whose nodes correspond to neurons and edges correspond to links between them. Each neuron receives as input a weighted sum of the outputs of the neurons connected to its incoming edges. We focus on feedforward networks in which the underlying graph does not contain cycles.

In the context of learning, we can define a hypothesis class consisting of neural network predictors, where all the hypotheses share the underlying graph structure of the network and difer in the weights over edges. As we will show in Section 20.3, every predictor over n variables that can be implemented in time T (n) can also be expressed as a neural network predictor of size $O(T(n)^{2})$ , where the size of the network is the number of nodes in it. It follows that the family of hypothesis classes of neural networks of polynomial size can sufice for all practical learning tasks, in which our goal is to learn predictors which can be implemented eficiently. Furthermore, in Section 20.4 we will show that the sample complexity of learning such hypothesis classes is also bounded in terms of the size of the network. Hence, it seems that this is the ultimate learning paradigm we would want to adapt, in the sense that it both has a polynomial sample complexity and has the minimal approximation error among all hypothesis classes consisting of eficiently implementable predictors.

The caveat is that the problem of training such hypothesis classes of neural network predictors is computationally hard. This will be formalized in Section 20.5. A widely used heuristic for training neural networks relies on the SGD framework we studied in Chapter 14. There, we have shown that SGD is a successful learner if the loss function is convex. In neural networks, the loss function is highly nonconvex. Nevertheless, we can still implement the SGD algorithm and hope it will find a reasonable solution (as happens to be the case in several practical tasks). In Section 20.6 we describe how to implement SGD for neural networks. In particular, the most complicated operation is the calculation of the gradient of the loss function with respect to the parameters of the network. We present the backpropagation algorithm that eficiently calculates the gradient.


---
title: "Chapter 7 \u2014 Nonuniform Learnability"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 7
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 1831
source_line_end: 2236
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
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 7 — Nonuniform Learnability

> [[../README|本书目录]] · [[06-chapter-6-the-vc-dimension|上一章]] · [[08-chapter-8-the-runtime-of-learning|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 1831–2236。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 12；sufficient × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Nonuniform Learnability

The notions of PAC learnability discussed so far in the book allow the sample sizes to depend on the accuracy and confidence parameters, but they are uniform with respect to the labeling rule and the underlying data distribution. Consequently, classes that are learnable in that respect are limited (they must have a finite VC-dimension, as stated by Theorem 6.7). In this chapter we consider more relaxed, weaker notions of learnability. We discuss the usefulness of such notions and provide characterization of the concept classes that are learnable using these definitions.

We begin this discussion by defining a notion of “nonuniform learnability” that allows the sample size to depend on the hypothesis to which the learner is compared. We then provide a characterization of nonuniform learnability and show that nonuniform learnability is a strict relaxation of agnostic PAC learnability. We also show that a sufficient condition for nonuniform learnability is that H is a countable union of hypothesis classes, each of which enjoys the uniform convergence property. These results will be proved in Section 7.2 by introducing a new learning paradigm, which is called Structural Risk Minimization (SRM). In Section 7.3 we specify the SRM paradigm for countable hypothesis classes, which yields the Minimum Description Length (MDL) paradigm. The MDL paradigm gives a formal justification to a philosophical principle of induction called Occam’s razor. Next, in Section 7.4 we introduce consistency as an even weaker notion of learnability. Finally, we discuss the significance and usefulness of the different notions of learnability.

## 7.1 Nonuniform Learnability

“Nonuniform learnability” allows the sample size to be nonuniform with respect to the different hypotheses with which the learner is competing. We say that a hypothesis h is $(\epsilon, \delta)$ -competitive with another hypothesis h<sup>0</sup> if, with probability higher than (1 − δ),

$$
L_{\mathcal{D}}(h) \leq L_{\mathcal{D}}(h^{\prime}) + \epsilon.
$$

In PAC learnability, this notion of “competitiveness” is not very useful, as we are looking for a hypothesis with an absolute low risk (in the realizable case) or with a low risk compared to the minimal risk achieved by hypotheses in our class (in the agnostic case). Therefore, the sample size depends only on the accuracy and confidence parameters. In nonuniform learnability, however, we allow the sample size to be of the form $m_{\mathcal{H}}(\epsilon, \delta, h)$ ; namely, it depends also on the h with which we are competing. Formally,

<sup>definition</sup> 7.1 A hypothesis class H is nonuniformly learnable if there exist a learning algorithm, A, and a function $m_{\mathcal{H}}^{\mathrm{{NUL}}} :(0, 1)^{2} \times \mathcal{H} \mathbb{N}$ such that, for every $\epsilon, \delta \in(0, 1)$ and for every $h \in \mathcal H$ , if $m \ge m_{\mathcal{H}}^{\mathrm{vUL}}(\epsilon, \delta, h)$ then for every distribution D, with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ , it holds that

$$
L_{\mathcal{D}}(A(S)) \leq L_{\mathcal{D}}(h) + \epsilon.
$$

At this point it might be useful to recall the definition of agnostic PAC learnability (Definition 3.3):

A hypothesis class H is agnostically PAC learnable if there exist a learning algorithm, A, and a function $m_{\mathscr{H}} :(0, 1)^{2} \to$ <sup>N</sup> such that, for every $\epsilon, \delta \in(0, 1)$ and for every distribution D, if $m \ge m_{\mathcal{H}}(\epsilon, \delta)$ , then with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ it holds that

$$
L_{\mathcal{D}}(A(S)) \leq \min_{h^{\prime} \in \mathcal{H}} L_{\mathcal{D}}(h^{\prime}) + \epsilon.
$$

Note that this implies that for every $h \in \mathcal H$

$$
L_{\mathcal{D}}(A(S)) \leq L_{\mathcal{D}}(h) + \epsilon.
$$

In both types of learnability, we require that the output hypothesis will be $(\epsilon, \delta)$ -competitive with every other hypothesis in the class. But the diference between these two notions of learnability is the question of whether the sample size m may depend on the hypothesis h to which the error of $A(S)$ is compared. Note that that nonuniform learnability is a relaxation of agnostic PAC learnability. That is, if a class is agnostic PAC learnable then it is also nonuniformly learnable.

## 7.1.1 Characterizing Nonuniform Learnability

Our goal now is to characterize nonuniform learnability. In the previous chapter we have found a crisp characterization of PAC learnable classes, by showing that a class of binary classifiers is agnostic PAC learnable if and only if its VCdimension is finite. In the following theorem we find a different characterization for nonuniform learnable classes for the task of binary classification.

<sup>theorem</sup> 7.2 A hypothesis class H of binary classifiers is nonuniformly learnable if and only if it is a countable union of agnostic PAC learnable hypothesis classes.

The proof of Theorem 7.2 relies on the following result of independent interest:

<sup>theorem</sup> 7.3 Let H be a hypothesis class that can be written as a countable union of hypothesis classes, $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ , where each ${\mathcal{H}}_{n}$ enjoys the uniform convergence property. Then, H is nonuniformly learnable.

Recall that in Chapter 4 we have shown that uniform convergence is sufficient for agnostic PAC learnability. Theorem 7.3 generalizes this result to nonuniform learnability. The proof of this theorem will be given in the next section by introducing a new learning paradigm. We now turn to proving Theorem 7.2.

Proof of Theorem 7.2 First assume that $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ where each ${\mathcal{H}}_{n}$ is agnostic PAC learnable. Using the fundamental theorem of statistical learning, it follows that each ${\mathcal{H}}_{n}$ has the uniform convergence property. Therefore, using Theorem 7.3 we obtain that H is nonuniform learnable.

For the other direction, assume that H is nonuniform learnable using some algorithm A. For every $n \in \mathbb{N}$ , let $\mathcal{H}_{n} = \{h \in \mathcal{H} : m_{\mathcal{H}}^{\mathrm{NUL}}(1 / 8, 1 / 7, h) \leq n\}$ Clearly, $\mathcal{H} = \cup_{n \in \mathbb{N}} \mathcal{H}_{n}$ . In addition, using the definition of $m_{\mathcal{H}}^{\mathrm{NUL}}$ we know that for any distribution D that satisfies the realizability assumption with respect to ${\mathcal{H}}_{n}$ , with probability of at least $6 / 7$ over $S \sim \mathcal{D}^{n}$ we have that $L_{\mathcal{D}}(A(S)) \leq 1 / 8$ Using the fundamental theorem of statistical learning, this implies that the VCdimension of ${\mathcal{H}}_{n}$ must be finite, and therefore ${\mathcal{H}}_{n}$ is agnostic PAC learnable.

The following example shows that nonuniform learnability is a strict relaxation of agnostic PAC learnability; namely, there are hypothesis classes that are nonuniform learnable but are not agnostic PAC learnable.

Example 7.1 Consider a binary classification problem with the instance domain being $\chi = \mathbb{R}$ . For every $n \in \mathbb N$ let ${\mathcal{H}}_{n}$ be the class of polynomial classifiers of degree n; namely, ${\mathcal{H}}_{n}$ is the set of all classifiers of the form $h(x) = \mathrm{sign}(p(x))$ where $p : \mathbb{R} \mathbb{R}$ is a polynomial of degree n. Let $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ . Therefore, H is the class of all polynomial classifiers over <sup>R</sup>. It is easy to verify that ${\mathrm{VCdim}}(\mathcal{H}) =$ ∞ while $\mathrm{VCdim}(\mathcal{H}_{n}) = n + 1$ (see Exercise 12). Hence, H is not PAC learnable, while on the basis of Theorem 7.3, H is nonuniformly learnable.

## 7.2 Structural Risk Minimization

So far, we have encoded our prior knowledge by specifying a hypothesis class $\mathcal{H}.$ , which we believe includes a good predictor for the learning task at hand. Yet another way to express our prior knowledge is by specifying preferences over hypotheses within H. In the Structural Risk Minimization (SRM) paradigm, we do so by first assuming that H can be written as $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ and then specifying a weight function, $w : \mathbb{N}[0, 1]$ , which assigns a weight to each hypothesis class, ${\mathcal{H}}_{n}$ , such that a higher weight reflects a stronger preference for the hypothesis class. In this section we discuss how to learn with such prior knowledge. In the next section we describe a couple of important weighting schemes, including Minimum Description Length.

Concretely, let H be a hypothesis class that can be written as $\begin{array}{r}{\mathcal{H} = \bigcup_{n \in \mathbb{N}} \mathcal{H}_{n}.} \end{array}$ For example, H may be the class of all polynomial classifiers where each ${\mathcal{H}}_{n}$ is the class of polynomial classifiers of degree n (see Example 7.1). Assume that for each $n_{\mathrm{:}}$ the class ${\mathcal{H}}_{n}$ enjoys the uniform convergence property (see Definition 4.3 in Chapter 4) with a sample complexity function $m_{\mathcal{H}_{n}}^{\mathrm{UC}}(\epsilon, \delta)$ . Let us also define the function $\epsilon_{n} : \mathbb{N} \times(0, 1) \to(0, 1)$ ) by

$$
\epsilon_{n}(m, \delta) = \min \{\epsilon \in(0, 1): m_{\mathcal{H}_{n}}^{\mathrm{UC}}(\epsilon, \delta) \leq m\}.\tag{7.1}
$$

In words, we have a fixed sample size $m,$ , and we are interested in the lowest possible upper bound on the gap between empirical and true risks achievable by using a sample of m examples.

From the definitions of uniform convergence and $\epsilon_{n}.$ , it follows that for every m and $\delta,$ with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ we have that

$$
\forall h \in \mathcal{H}_{n}, | L_{\mathcal{D}}(h) - L_{S}(h) | \leq \epsilon_{n}(m, \delta).\tag{7.2}
$$

Let $w : \mathbb{N}[0, 1]$ be a function such that $\textstyle \sum_{n = 1}^{\infty} w(n) \leq 1$ . We refer to w as a weight function over the hypothesis classes $\mathcal{H}_{1}, \mathcal{H}_{2}, \dotsc \dotsc \mathrm{S}$ uch a weight function can reflect the importance that the learner attributes to each hypothesis class, or some measure of the complexity of different hypothesis classes. If H is a finite union of N hypothesis classes, one can simply assign the same weight of $1 / N$ to all hypothesis classes. This equal weighting corresponds to no a priori preference to any hypothesis class. Of course, if one believes (as prior knowledge) that a certain hypothesis class is more likely to contain the correct target function, then it should be assigned a larger weight, reflecting this prior knowledge. When H is $a$ (countable) infinite union of hypothesis classes, a uniform weighting is not possible but many other weighting schemes may work. For example, one can choose $\begin{array}{r}{w(n) ={\frac{6}{\pi^{2} n^{2}}} \operatorname{or} w(n) = 2^{- n}} \end{array}$ . Later in this chapter we will provide another convenient way to define weighting functions using description languages.

The SRM rule follows a “bound minimization” approach. This means that the goal of the paradigm is to find a hypothesis that minimizes a certain upper bound on the true risk. The bound that the SRM rule wishes to minimize is given in the following theorem.

theorem <sub>7.4 Let</sub> $w : \mathbb{N}[0, 1]$ be a function such that $\textstyle \sum_{n = 1}^{\infty} w(n) \leq 1$ . Let H be a hypothesis class that can be written as $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ , where for each $n_{\colon}$ , ${\mathcal{H}}_{n}$ satisfies the uniform convergence property with a sample complexity function m $\mathbf{\mathcal{H}}_{n}^{C}$ . Let $\epsilon_{n}$ be as defined in Equation (7.1). Then, for every $\delta \in(0, 1)$ and distribution D, with probability of at least $1 - \delta$ over the choice $ofS \sim \mathcal{D}^{m}$ , the following bound holds (simultaneously) for every n $, \in \mathbb{N}$ and $h \in \mathcal{H}_{n}$

$$
\left| L_{\mathcal{D}}(h) - L_{S}(h) \right| \leq \epsilon_{n}(m, w(n) \cdot \delta).
$$

Therefore, for every $\delta \in(0, 1)$ and distribution $\mathcal{D}_{\mathrm{:}}$ , with probability of at least

1 − δ it holds that

$$
\forall h \in \mathcal{H}, L_{\mathcal{D}}(h) \leq L_{S}(h) + \min_{n: h \in \mathcal{H}_{n}} \epsilon_{n}(m, w(n) \cdot \delta).\tag{7.3}
$$

Proof For each n define $\delta_{n} \ : = \ : w(n) \delta$ . Applying the assumption that uniform convergence holds for all n with the rate given in Equation (7.2), we obtain that if we fix n in advance, then with probability of at least $1 - \delta_{n}$ over the choice of $S \sim \mathcal{D}^{m}$ 2

$$
\forall h \in \mathcal{H}_{n}, | L_{\mathcal{D}}(h) - L_{S}(h) | \leq \epsilon_{n}(m, \delta_{n}).
$$

Applying the union bound over $n = 1, 2,...,$ we obtain that with probability of at least $\begin{array}{r}{1 - \sum_{n} \delta_{n} = 1 - \delta \sum_{n} w(n) \geq 1 - \delta} \end{array}$ , the preceding holds for all $n,$ which concludes our proof. □

Denote

$$
n(h) = \min \{n: h \in \mathcal{H}_{n}\},\tag{7.4}
$$

and then Equation (7.3) implies that

$$
L_{\mathcal{D}}(h) \leq L_{S}(h) + \epsilon_{n(h)}(m, w(n(h)) \cdot \delta).
$$

The SRM paradigm searches for h that minimizes this bound, as formalized in the following pseudocode:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Structural Risk Minimization (SRM)

prior knowledge:
 $H = \bigcup_{n} H_{n}$  where  $H_{n}$  has uniform convergence with  $m_{H_{n}}^{UC}$ $w : N \to[0,1]$  where  $\sum_{n} w(n) \leq 1$ 

define:  $\epsilon_{n}$  as in Equation (7.1);  $n(h)$  as in Equation (7.4)

input: training set  $S \sim D^{m}$ , confidence  $\delta$ 

output:  $h \in \arg\min_{h \in H} \left[L_{S}(h) + \epsilon_{n(h)}(m, w(n(h)) \cdot \delta) \right]$
</div>

Unlike the ERM paradigm discussed in previous chapters, we no longer just care about the empirical risk, $L_{S}(h)$ , but we are willing to trade some of our bias toward low empirical risk with a bias toward classes for which $\epsilon_{n(h)}(m, w(n(h)){\cdot} \delta)$ is smaller, for the sake of a smaller estimation error.

Next we show that the SRM paradigm can be used for nonuniform learning of every class, which is a countable union of uniformly converging hypothesis classes.

<sup>theorem</sup> 7.5 Let H be a hypothesis class such that $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ , where each ${\mathcal{H}}_{n}$ has the uniform convergence property with sample complexity m $\mathcal{H}_{n}$ . Let $w : \mathbb{N}[0, 1]$ be such that $\begin{array}{r}{w(n) = \frac{6}{n^{2} \pi^{2}}} \end{array}$ . Then, H is nonuniformly learnable using the SRM rule with rate

$$
m_{\mathcal{H}}^{NUL}(\epsilon, \delta, h) \leq m_{\mathcal{H}_{n(h)}}^{UC} \left(\epsilon / 2, \frac{6 \delta}{(\pi n(h))^{2}}\right).
$$

Proof Let A be the SRM algorithm with respect to the weighting function w. For every $h \in{\mathcal{H}}, \epsilon$ , and δ, let $m \ge \mathnormal{m}_{\mathcal{H}_{n(h)}}^{\mathrm{UC}}(\epsilon, w(n(h)) \delta)$ . Using the fact that $\begin{array}{r}{\sum_{n} w(n) = 1} \end{array}$ , we can apply Theorem 7.4 to get that, with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ , we have that for every $h^{\prime} \in \mathcal{H}$

$$
L_{\mathcal{D}}(h^{\prime}) \leq L_{S}(h^{\prime}) + \epsilon_{n(h^{\prime})}(m, w(n(h^{\prime})) \delta).
$$

The preceding holds in particular for the hypothesis $A(S)$ returned by the SRM rule. By the definition of SRM we obtain that

$$
L_{\mathcal{D}}(A(S)) \leq \min_{h^{\prime}} \left[L_{S}(h^{\prime}) + \epsilon_{n(h^{\prime})}(m, w(n(h^{\prime})) \delta) \right] \leq L_{S}(h) + \epsilon_{n(h)}(m, w(n(h)) \delta).
$$

Finally, if m $\ge m_{\mathcal{H}_{n(h)}}^{\mathrm{UC}}(\epsilon / 2, w(n(h)) \delta)$ then clearly $\epsilon_{n(h)}(m, w(n(h)) \delta) \leq \epsilon / 2$ . In addition, from the uniform convergence property of each ${\mathcal{H}}_{n}$ we have that with probability of more than $1 - \delta$

$$
L_{S}(h) \leq L_{\mathcal{D}}(h) + \epsilon / 2.
$$

Combining all the preceding we obtain that $L_{\mathcal{D}}(A(S)) \le L_{\mathcal{D}}(h) + \epsilon$ , which concludes our proof. □

Note that the previous theorem also proves Theorem 7.3.

Remark 7.2 (No-Free-Lunch for Nonuniform Learnability) We have shown that any countable union of classes of finite VC-dimension is nonuniformly learnable. It turns out that, for any infinite domain set, X , the class of all binary valued functions over $\mathcal{X}$ is not a countable union of classes of finite VC-dimension. We leave the proof of this claim as a (nontrivial) exercise (see Exercise 5). It follows that, in some sense, the no free lunch theorem holds for nonuniform learning as well: namely, whenever the domain is not finite, there exists no nonuniform learner with respect to the class of all deterministic binary classifiers (although for each such classifier there exists a trivial algorithm that learns it – ERM with respect to the hypothesis class that contains only this classifier).

It is interesting to compare the nonuniform learnability result given in Theorem 7.5 to the task of agnostic PAC learning any specific ${\mathcal{H}}_{n}$ separately. The prior knowledge, or bias, of a nonuniform learner for H is weaker – it is searching for a model throughout the entire class ${\mathcal{H}},$ rather than being focused on one specific ${\mathcal{H}}_{n}$ . The cost of this weakening of prior knowledge is the increase in sample complexity needed to compete with any specific $h \in \mathcal{H}_{n}$ . For a concrete evaluation of this gap, consider the task of binary classification with the zero-one loss. Assume that for all $\mathbf{\xi}_{l}, \operatorname{VCdim}(\mathcal{H}_{n}) = n$ . Since $\begin{array}{r}{m_{\mathcal{H}_{n}}^{\mathrm{UC}}(\epsilon, \delta) = C \frac{n + \log(1 / \delta)}{\epsilon^{2}}} \end{array}$ (where C is the contant appearing in Theorem 6.8), a straightforward calculation shows that

$$
m_{\mathcal{H}}^{\mathrm{NUL}}(\epsilon, \delta, h) - m_{\mathcal{H}_{n}}^{\mathrm{UC}}(\epsilon / 2, \delta) \leq 4C \frac{2 \log(2n)}{\epsilon^{2}}.
$$

That is, the cost of relaxing the learner’s prior knowledge from a specific ${\mathcal{H}}_{n}$ that contains the target h to a countable union of classes depends on the log of the index of the first class in which h resides. That cost increases with the index of the class, which can be interpreted as reflecting the value of knowing a good priority order on the hypotheses in H.

## 7.3 Minimum Description Length and Occam’s Razor

Let H be a countable hypothesis class. Then, we can write H as a countable union of singleton classes, namely, $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}} \{h_{n}\}$ . By Hoefding’s inequality (Lemma 4.5), each singleton class has the uniform convergence property with rate $\begin{array}{r}{m^{\mathrm{{vc}}}(\epsilon, \tilde{\delta}) = \frac{\log(2 \breve{/} \delta)}{2 \epsilon^{2}}} \end{array}$ . Therefore, the function $\epsilon_{n}$ given in Equation (7.1) becomes $\begin{array}{r}{\epsilon_{n}(m, \delta) = \sqrt{\frac{\log(2 / \delta)}{2m}}} \end{array}$ and the SRM rule becomes

$$
\underset{h_{n} \in \mathcal{H}}{\operatorname{argmin}} \left[L_{S}(h) + \sqrt{\frac{- \log(w(n)) + \log(2 / \delta)}{2m}} \right].
$$

Equivalently, we can think of w as a function from $\mathcal{H} \mathrm{~ to ~}[0, 1]$ , and then the SRM rule becomes

$$
\underset{h \in \mathcal{H}}{\operatorname{argmin}} \left[L_{S}(h) + \sqrt{\frac{- \log(w(h)) + \log(2 / \delta)}{2m}} \right].
$$

It follows that in this case, the prior knowledge is solely determined by the weight we assign to each hypothesis. We assign higher weights to hypotheses that we believe are more likely to be the correct one, and in the learning algorithm we prefer hypotheses that have higher weights.

In this section we discuss a particular convenient way to define a weight function over H, which is derived from the length of descriptions given to hypotheses. Having a hypothesis class, one can wonder about how we describe, or represent, each hypothesis in the class. We naturally fix some description language. This can be English, or a programming language, or some set of mathematical formulas. In any of these languages, a description consists of finite strings of symbols (or characters) drawn from some fixed alphabet. We shall now formalize these notions.

Let H be the hypothesis class we wish to describe. Fix some finite set Σ of symbols (or “characters”), which we call the alphabet. For concreteness, we let $\Sigma = \{0, 1\}$ . A string is a finite sequence of symbols from $\Sigma;$ for example, $\pmb{\sigma} =(0, 1, 1, 1, 0)$ is a string of length 5. We denote by $| \sigma |$ the length of a string. The set of all finite length strings is denoted Σ<sup>∗</sup>. A description language for H is a function d : $\mathcal{H} \to \Sigma^{*}$ , mapping each member h of H to a string $d(h).\d(h)$ is called “the description of $h,^{\dag}$ and its length is denoted by |h|.

We shall require that description languages be prefix-free; namely, for every distinct $h, h^{\prime}, \d(h)$ is not a prefix of $d(h^{\prime})$ . That is, we do not allow that any string $d(h)$ is exactly the first |h| symbols of any longer string $d(h^{\prime})$ . Prefix-free collections of strings enjoy the following combinatorial property:

<sup>lemma</sup> 7.6 (Kraft Inequality) $IfS \subseteq \{0, 1\}^{*}$ is a prefix-free set of strings, then

$$
\sum_{\sigma \in \mathcal{S}} \frac{1}{2^{| \sigma |}} \leq 1.
$$

Proof Define a probability distribution over the members of $s$ as follows: Repeatedly toss an unbiased coin, with faces labeled 0 and 1, until the sequence of outcomes is a member of $s;$ at that point, stop. For each $\pmb{\sigma} \in \mathcal{S}$ , let $P(\pmb{\sigma})$ be the probability that this process generates the string $\pmb{\sigma}.$ . Note that since $s$ is prefix-free, for every $\sigma \in S,$ , if the coin toss outcomes follow the bits of $\pmb{\sigma}$ then we will stop only once the sequence of outcomes equals $\pmb{\sigma}.$ . We therefore get that, for every $\begin{array}{r}{\pmb{\sigma} \in \mathcal{S}, P(\pmb{\sigma}) = \frac{1}{2^{| \pmb{\sigma} |}}} \end{array}$ . Since probabilities add up to at most 1, our proof is concluded. □

In light of Kraft’s inequality, any prefix-free description language of a hypothesis class, H, gives rise to a weighting function w over that hypothesis class – we will simply set $\begin{array}{r}{w(h) = \frac{1}{2^{| h |}}} \end{array}$ . This observation immediately yields the following:

<sup>theorem</sup> 7.7 Let H be a hypothesis class and let d : $\mathcal{H} \to \{0, 1\}^{*}$ be a prefixfree description language for H. Then, for every sample size, m, every confidence parameter, $\delta > 0$ , and every probability distribution, $\mathcal{D}_{\mathrm{:}}$ , with probability greater than $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ we have that,

$$
\forall h \in \mathcal{H}, L_{\mathcal{D}}(h) \leq L_{S}(h) + \sqrt{\frac{| h | + \ln(2 / \delta)}{2m}},
$$

where |h| is the length of d(h).

Proof Choose $w(h) = 1 / 2^{| h |}$ , apply Theorem 7.4 with $\begin{array}{r}{\epsilon_{n}(m, \delta) = \sqrt{\frac{\ln(2 / \delta)}{2m}}} \end{array}$ , and note that ln $\mathfrak{i}(2^{| h |}) = | h | \ln(2) < | h |$ □

As was the case with Theorem 7.4, this result suggests a learning paradigm for H – given a training set, $S,$ search for a hypothesis $h \in \mathcal H$ that minimizes the bound, $\begin{array}{r}{L_{S}(h) + \sqrt{\frac{| h | + \ln(2 / \delta)}{2m}}} \end{array}$ . In particular, it suggests trading of empirical risk for saving description length. This yields the Minimum Description Length learning paradigm.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Minimum Description Length (MDL)

prior knowledge:
H is a countable hypothesis class
H is described by a prefix-free language over  $\{0,1\}$ 
For every  $h \in H$ ,  $|h|$  is the length of the representation of h
input: A training set  $S \sim D^{m}$ , confidence  $\delta$ 
output:  $h \in \arg\min_{h \in H} \left[L_{S}(h) + \sqrt{\frac{|h| + \ln(2/\delta)}{2m}} \right]$
</div>

Example 7.3 Let H be the class of all predictors that can be implemented using some programming language, say, C++. Let us represent each program using the

binary string obtained by running the gzip command on the program (this yields a prefix-free description language over the alphabet {0, 1}). Then, |h| is simply the length (in bits) of the output of gzip when running on the C++ program corresponding to $h.$

## 7.3.1 Occam’s Razor

Theorem 7.7 suggests that, having two hypotheses sharing the same empirical risk, the true risk of the one that has shorter description can be bounded by a lower value. Thus, this result can be viewed as conveying a philosophical message:

A short explanation (that $is,$ a hypothesis that has a short length) tends to be more valid than a long explanation.

This is a well known principle, called Occam’s razor, after William of Ockham, a 14th-century English logician, who is believed to have been the first to phrase it explicitly. Here, we provide one possible justification to this principle. The inequality of Theorem 7.7 shows that the more complex a hypothesis h is (in the sense of having a longer description), the larger the sample size it has to fit to guarantee that it has a small true risk, $L_{\mathcal{D}}(h)$

At a second glance, our Occam razor claim might seem somewhat problematic. In the context in which the Occam razor principle is usually invoked in science, the language according to which complexity is measured is a natural language, whereas here we may consider any arbitrary abstract description language. Assume that we have two hypotheses such that $| h^{\prime} |$ is much smaller than |h|. By the preceding result, if both have the same error on a given training set, $S,$ then the true error of h may be much higher than the true error of $h^{\prime}$ , so one should prefer $h^{\prime}$ over $h.$ . However, we could have chosen a different description language, say, one that assigns a string of length 3 to h and a string of length 100000 to $h^{\prime}$ Suddenly it looks as if one should prefer h over $h^{\prime}.$ . But these are the same h and $h^{\prime}$ for which we argued two sentences ago that h<sup>0</sup> should be preferable. Where is the catch here?

Indeed, there is no inherent generalizability diference between hypotheses. The crucial aspect here is the dependency order between the initial choice of language (or, preference over hypotheses) and the training set. As we know from the basic Hoefding’s bound (Equation (4.2)), if we commit to any hypothesis before seeing the data, then we are guaranteed a rather small estimation error term $\begin{array}{r}{L_{\mathcal{D}}(h) \le L_{S}(h) + \sqrt{\frac{\ln(2 / \delta)}{2m}}} \end{array}$ . Choosing a description language (or, equivalently, some weighting of hypotheses) is a weak form of committing to a hypothesis. Rather than committing to a single hypothesis, we spread out our commitment among many. As long as it is done independently of the training sample, our generalization bound holds. Just as the choice of a single hypothesis to be evaluated by a sample can be arbitrary, so is the choice of description language.

## 7.4 Other Notions of Learnability – Consistency

The notion of learnability can be further relaxed by allowing the needed sample sizes to depend not only on $\epsilon, \delta,$ and h but also on the underlying data-generating probability distribution D (that is used to generate the training sample and to determine the risk). This type of performance guarantee is captured by the notion of consistency<sup>1</sup> of a learning rule.

<sup>definition</sup> 7.8 (Consistency) Let Z be a domain set, let $\mathcal{P}$ be a set of probability distributions over $Z,$ and let H be a hypothesis class. A learning rule $A$ is consistent with respect to H and $\mathcal{P}$ if there exists a function $m _ { \mathcal { H } } ^ { \mathrm { c o v } } : ( 0 , 1 ) ^ { 2 } \times \mathcal { H } \times \mathcal { P } $ <sup>N</sup> such that, for every $\epsilon, \delta \in(0, 1)$ , every $h \in{\mathcal{H}}.$ , and every $\mathcal{D} \in \mathcal{P}$ , if m $\iota \geq m_{\mathcal{H}}^{\mathrm{NUL}}(\epsilon, \delta, h, \mathcal{D})$ then with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ it holds that

$$
L_{\mathcal{D}}(A(S)) \leq L_{\mathcal{D}}(h) + \epsilon.
$$

If $\mathcal{P}$ is the set of all distributions,<sup>2</sup> we say that A is universally consistent with respect to H.

The notion of consistency is, of course, a relaxation of our previous notion of nonuniform learnability. Clearly if an algorithm nonuniformly learns a class H it is also universally consistent for that class. The relaxation is strict in the sense that there are consistent learning rules that are not successful nonuniform learners. For example, the algorithm Memorize defined in Example 7.4 later is universally consistent for the class of all binary classifiers over <sup>N</sup>. However, as we have argued before, this class is not nonuniformly learnable.

Example 7.4 Consider the classification prediction algorithm Memorize defined as follows. The algorithm memorizes the training examples, and, given a test point x, it predicts the majority label among all labeled instances of x that exist in the training sample (and some fixed default label if no instance of x appears in the training set). It is possible to show (see Exercise 6) that the Memorize algorithm is universally consistent for every countable domain X and a finite label set Y (w.r.t. the zero-one loss).

Intuitively, it is not obvious that the Memorize algorithm should be viewed as a learner, since it lacks the aspect of generalization, namely, of using observed data to predict the labels of unseen examples. The fact that Memorize is a consistent algorithm for the class of all functions over any countable domain set therefore raises doubt about the usefulness of consistency guarantees. Furthermore, the sharp-eyed reader may notice that the “bad learner” we introduced in Chapter $^{2,}$ which led to overfitting, is in fact the Memorize algorithm. In the next section we discuss the significance of the different notions of learnability and revisit the No-Free-Lunch theorem in light of the different definitions of learnability.

## 7.5 Discussing the different Notions of Learnability

We have given three definitions of learnability and we now discuss their usefulness. As is usually the case, the usefulness of a mathematical definition depends on what we need it for. We therefore list several possible goals that we aim to achieve by defining learnability and discuss the usefulness of the different definitions in light of these goals.

## What Is the Risk of the Learned Hypothesis?

The first possible goal of deriving performance guarantees on a learning algorithm is bounding the risk of the output predictor. Here, both PAC learning and nonuniform learning give us an upper bound on the true risk of the learned hypothesis based on its empirical risk. Consistency guarantees do not provide such a bound. However, it is always possible to estimate the risk of the output predictor using a validation set (as will be described in Chapter 11).

## How Many Examples Are Required to Be as Good as the Best Hypothesis in H?

When approaching a learning problem, a natural question is how many examples we need to collect in order to learn it. Here, PAC learning gives a crisp answer. However, for both nonuniform learning and consistency, we do not know in advance how many examples are required to learn H. In nonuniform learning this number depends on the best hypothesis in H, and in consistency it also depends on the underlying distribution. In this sense, PAC learning is the only useful definition of learnability. On the flip side, one should keep in mind that even if the estimation error of the predictor we learn is small, its risk may still be large if H has a large approximation error. So, for the question “How many examples are required to be as good as the Bayes optimal predictor?” even PAC guarantees do not provide us with a crisp answer. This reflects the fact that the usefulness of PAC learning relies on the quality of our prior knowledge.

PAC guarantees also help us to understand what we should do next if our learning algorithm returns a hypothesis with a large risk, since we can bound the part of the error that stems from estimation error and therefore know how much of the error is attributed to approximation error. If the approximation error is large, we know that we should use a different hypothesis class. Similarly, if a nonuniform algorithm fails, we can consider a different weighting function over (subsets of) hypotheses. However, when a consistent algorithm fails, we have no idea whether this is because of the estimation error or the approximation error. Furthermore, even if we are sure we have a problem with the estimation

degree 2

error term, we do not know how many more examples are needed to make the estimation error small.

## How to Learn? How to Express Prior Knowledge?

Maybe the most useful aspect of the theory of learning is in providing an answer to the question of “how to learn.” The definition of PAC learning yields the limitation of learning (via the No-Free-Lunch theorem) and the necessity of prior knowledge. It gives us a crisp way to encode prior knowledge by choosing a hypothesis class, and once this choice is made, we have a generic learning rule – ERM. The definition of nonuniform learnability also yields a crisp way to encode prior knowledge by specifying weights over (subsets of) hypotheses of H. Once this choice is made, we again have a generic learning rule – SRM. The SRM rule is also advantageous in model selection tasks, where prior knowledge is partial. We elaborate on model selection in Chapter 11 and here we give a brief example.

Consider the problem of fitting a one dimensional polynomial to data; namely, our goal is to learn a function, $h : \mathbb{R} \mathbb{R}$ , and as prior knowledge we consider the hypothesis class of polynomials. However, we might be uncertain regarding which degree d would give the best results for our data set: A small degree might not fit the data well (i.e., it will have a large approximation error), whereas a high degree might lead to overfitting (i.e., it will have a large estimation error). In the following we depict the result of fitting a polynomial of degrees 2, 3, and 10 to the same training set.

degree 3  
degree 10  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/d29f46e7949cb87bfe47171337a7c328dbeb69c4fb75779029e47daa3bcd02fe.jpg)

It is easy to see that the empirical risk decreases as we enlarge the degree. Therefore, if we choose H to be the class of all polynomials up to degree 10 then the ERM rule with respect to this class would output a 10 degree polynomial and would overfit. On the other hand, if we choose too small a hypothesis class, say, polynomials up to degree 2, then the ERM would sufer from underfitting (i.e., a large approximation error). In contrast, we can use the SRM rule on the set of all polynomials, while ordering subsets of H according to their degree, and this will yield a 3rd degree polynomial since the combination of its empirical risk and the bound on its estimation error is the smallest. In other words, the SRM rule enables us to select the right model on the basis of the data itself. The price we pay for this flexibility (besides a slight increase of the estimation error relative to PAC learning w.r.t. the optimal degree) is that we do not know in advance how many examples are needed to compete with the best hypothesis in H.

Unlike the notions of PAC learnability and nonuniform learnability, the definition of consistency does not yield a natural learning paradigm or a way to encode prior knowledge. In fact, in many cases there is no need for prior knowledge at all. For example, we saw that even the Memorize algorithm, which intuitively should not be called a learning algorithm, is a consistent algorithm for any class defined over a countable domain and a finite label set. This hints that consistency is a very weak requirement.

## Which Learning Algorithm Should We Prefer?

One may argue that even though consistency is a weak requirement, it is desirable that a learning algorithm will be consistent with respect to the set of all functions from X to Y, which gives us a guarantee that for enough training examples, we will always be as good as the Bayes optimal predictor. Therefore, if we have two algorithms, where one is consistent and the other one is not consistent, we should prefer the consistent algorithm. However, this argument is problematic for two reasons. First, maybe it is the case that for most “natural” distributions we will observe in practice that the sample complexity of the consistent algorithm will be so large so that in every practical situation we will not obtain enough examples to enjoy this guarantee. Second, it is not very hard to make any PAC or nonuniform learner consistent with respect to the class of all functions from X to Y. Concretely, consider a countable domain, X , a finite label set Y, and a hypothesis class, H, of functions from X to Y. We can make any nonuniform learner for H be consistent with respect to the class of all classifiers from X to Y using the following simple trick: Upon receiving a training set, we will first run the nonuniform learner over the training set, and then we will obtain a bound on the true risk of the learned predictor. If this bound is small enough we are done. Otherwise, we revert to the Memorize algorithm. This simple modification makes the algorithm consistent with respect to all functions from X to Y. Since it is easy to make any algorithm consistent, it may not be wise to prefer one algorithm over the other just because of consistency considerations.

## 7.5.1 The No-Free-Lunch Theorem Revisited

Recall that the No-Free-Lunch theorem (Theorem 5.1 from Chapter 5) implies that no algorithm can learn the class of all classifiers over an infinite domain. In contrast, in this chapter we saw that the Memorize algorithm is consistent with respect to the class of all classifiers over a countable infinite domain. To understand why these two statements do not contradict each other, let us first recall the formal statement of the No-Free-Lunch theorem.

Let X be a countable infinite domain and let $\mathcal{V} = \{\pm 1\}$ . The No-Free-Lunch theorem implies the following: For any algorithm, A, and a training set size, m, there exist a distribution over X and a function $h^{\star} : \mathcal{X} \mathcal{Y}$ , such that if A will get a sample of m i.i.d. training examples, labeled by $h^{\star}$ , then A is likely to return a classifier with a larger error.

The consistency of Memorize implies the following: For every distribution over $\mathcal{X}$ and a labeling function $h^{\star} : \mathcal{X} \mathcal{Y}$ , there exists a training set size m (that depends on the distribution and on $h^{\star})$ such that if Memorize receives at least m examples it is likely to return a classifier with a small error.

We see that in the No-Free-Lunch theorem, we first fix the training set size, and then find a distribution and a labeling function that are bad for this training set size. In contrast, in consistency guarantees, we first fix the distribution and the labeling function, and only then do we find a training set size that sufices for learning this particular distribution and labeling function.

## 7.6 Summary

We introduced nonuniform learnability as a relaxation of PAC learnability and consistency as a relaxation of nonuniform learnability. This means that even classes of infinite VC-dimension can be learnable, in some weaker sense of learnability. We discussed the usefulness of the different definitions of learnability.

For hypothesis classes that are countable, we can apply the Minimum Description Length scheme, where hypotheses with shorter descriptions are preferred, following the principle of Occam’s razor. An interesting example is the hypothesis class of all predictors we can implement in C++ (or any other programming language), which we can learn (nonuniformly) using the MDL scheme.

Arguably, the class of all predictors we can implement in C++ is a powerful class of functions and probably contains all that we can hope to learn in practice. The ability to learn this class is impressive, and, seemingly, this chapter should have been the last chapter of this book. This is not the case, because of the computational aspect of learning: that is, the runtime needed to apply the learning rule. For example, to implement the MDL paradigm with respect to all C++ programs, we need to perform an exhaustive search over all C++ programs, which will take forever. Even the implementation of the ERM paradigm with respect to all C++ programs of description length at most 1000 bits requires an exhaustive search over $2^{1000}$ hypotheses. While the sample complexity of learning this class is just $\frac{1000 + \log(2 / \delta)}{\epsilon^{2}}$ , the runtime is $\geq 2^{1000}$ . This is a huge number – much larger than the number of atoms in the visible universe. In the next chapter we formally define the computational complexity of learning. In the second part of this book we will study hypothesis classes for which the ERM or SRM schemes can be implemented eficiently.

## 7.7 Bibliographic Remarks

Our definition of nonuniform learnability is related to the definition of an Occamalgorithm in Blumer, Ehrenfeucht, Haussler & Warmuth (1987). The concept of SRM is due to (Vapnik & Chervonenkis 1974, Vapnik 1995). The concept of MDL is due to (Rissanen 1978, Rissanen 1983). The relation between SRM and MDL is discussed in Vapnik (1995). These notions are also closely related to the notion of regularization (e.g. Tikhonov (1943)). We will elaborate on regularization in the second part of this book.

The notion of consistency of estimators dates back to Fisher (1922). Our presentation of consistency follows Steinwart & Christmann (2008), who also derived several no-free-lunch theorems.

## 7.8 Exercises

1. Prove that for any finite class H, and any description language $d : \mathcal { H } $ $\{0, 1\}^{*}$ , the VC-dimension of H is at most $2 \operatorname{sup} \{| d(h) | : h \in \mathcal{H}\} -$ the maximum description length of a predictor in H. Furthermore, if d is a prefix-free description then $\operatorname{VCdim}(H) \leq \operatorname{sup} \{| d(h) | : h \in{\mathcal{H}}\}$

2. Let $\mathcal{H} = \{h_{n} : n \in \mathbb{N}\}$ be an infinite countable hypothesis class for binary classification. Show that it is impossible to assign weights to the hypotheses in H such that

- H could be learnt nonuniformly using these weights. That is, the weighting function $w : \mathcal{H} \to[0, 1]$ should satisfy the condition $\begin{array}{r}{\sum_{h \in \mathcal{H}} w(h) \ \leq \1} \end{array}$

- The weights would be monotonically nondecreasing. That is, if $i < j$ , then $w(h_{i}) \leq w(h_{j})$

3. • Consider a hypothesis class $\textstyle{\mathcal{H}} = \bigcup_{n = 1}^{\infty}{\mathcal{H}}_{n}$ , where for every $n \in{\mathbb{N}},{\mathcal{H}}_{n}$ is finite. Find a weighting function w $\colon \mathcal{H}[0, 1]$ such that $\begin{array}{r}{\sum_{h \in \mathcal{H}} w(h) \le} \end{array}$ 1 and so that for all $h \in \mathcal{H}, w(h)$ is determined by $n(h) = \operatorname{min} \{n : h \in$ $\mathcal{H}_{n}\}$ and by $|{\mathcal{H}}_{n(h)} |$

- (\*) Define such a function w when for all $n \ \mathcal{H}_{n}$ is countable (possibly infinite).

4. Let H be some hypothesis class. For any $h \in \mathcal H$ , let |h| denote the description length of $h,$ according to some fixed description language. Consider the MDL learning paradigm in which the algorithm returns:

$$
h_{S} \in \arg \min_{h \in \mathcal{H}} \left[L_{S}(h) + \sqrt{\frac{| h | + \ln(2 / \delta)}{2m}} \right],
$$

where $S$ is a sample of size m. For any $B > 0$ , let $\mathcal{H}_{B} = \left\{h \in \mathcal{H} : | h | \leq B \right\}$ , and define

$$
h_{B}^{*} = \arg \min_{h \in \mathcal{H}_{B}} L_{\mathcal{D}}(h).
$$

Prove a bound on $L_{\mathcal{D}}(h_{S}) - L_{\mathcal{D}}(h_{B}^{*})$ in terms of $B_{:}$ the confidence parameter $\delta,$ and the size of the training set m.

- Note: Such bounds are known as oracle inequalities in the literature: We wish to estimate how good we are compared to a reference classifier (or $\mathrm{\v{e}^{\omega} oracle^{\prime 3}}) \h_{B}^{*}$

5. In this question we wish to show a No-Free-Lunch result for nonuniform learnability: namely, that, over any infinite domain, the class of all functions is not learnable even under the relaxed nonuniform variation of learning.

Recall that an algorithm, A, nonuniformly learns a hypothesis class H if there exists a function m $\imath _ { \mathcal { H } } ^ { \mathrm { { N U L } } } : ( 0 , 1 ) ^ { 2 } \times \mathcal { H } $ <sup>N</sup> such that, for every $\epsilon, \delta \in(0, 1)$ and for every $h \in \mathcal H$ , if m $\ge m_{\mathcal{H}}^{\mathrm{NUL}}(\epsilon, \delta, h)$ then for every distribution $\mathcal{D}_{\ell}$ , with probability of at least $1 - \delta$ over the choice of $S \sim D^{m}$ , it holds that

$$
L_{\mathcal{D}}(A(S)) \leq L_{\mathcal{D}}(h) + \epsilon.
$$

If such an algorithm exists then we say that H is nonuniformly learnable. 1. Let A be a nonuniform learner for a class H. For each $n \in \mathbb{N}$ define $\mathcal{H}_{n}^{A} =$ $\{h \in{\mathcal{H}} : m^{\operatorname{NUL}}(0.1, 0.1, h) \leq n\}$ . Prove that each such class ${\mathcal{H}}_{n}$ has a finite VC-dimension.

2. Prove that if a class H is nonuniformly learnable then there are classes ${\mathcal{H}}_{n}$ so that $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ and, for every $n \in \mathbb{N}$ 2 $\mathrm{VCdim}(\mathscr{H}_{n})$ is finite.

3. Let H be a class that shatters an infinite set. Then, for every sequence of classes $(\mathcal{H}_{n} : n \in \mathbb{N})$ such that $\textstyle{\mathcal{H}} = \bigcup_{n \in \mathbb{N}}{\mathcal{H}}_{n}$ , there exists some n for which VCdim $(\mathcal{H}_{n}) = \infty$

Hint: Given a class H that shatters some infinite set $K,$ and a sequence of classes $(\mathcal{H}_{n} : n \in \mathbb{N})$ , each having a finite VC-dimension, start by defining subsets $K_{n} \subseteq K$ such that, for all $n, \ | K_{n} | > \operatorname{VCdim}(\mathcal{H}_{n})$ and for any $n \neq m, K_{n} \cap K_{m} = \emptyset$ . Now, pick for each such $K_{n}$ a function $f_{n} : K_{n} \to$ $\{0, 1\}$ so that no $h \in \mathcal{H}_{n}$ agrees with $f_{n}$ on the domain $K_{n}.\Finally,$ , define $f : X \{0, 1\}$ by combining these $f_{n} \ : s$ and prove that $f \in \left(\mathcal{H} \setminus \bigcup_{n \in \mathbb{N}} \mathcal{H}_{n} \right)$

4. Construct a class $\mathcal{H}_{1}$ of functions from the unit interval [0, 1] to {0, 1} that is nonuniformly learnable but not PAC learnable.

5. Construct a class $\mathcal{H}_{2}$ of functions from the unit interval [0, 1] to {0, 1} that is not nonuniformly learnable.

6. In this question we wish to show that the algorithm Memorize is a consistent learner for every class of (binary-valued) functions over any countable domain. Let X be a countable domain and let $\mathcal{D}$ be a probability distribution over $\mathcal{X}$

1. Let $\{x_{i} : i \in \mathbb{N}\}$ be an enumeration of the elements of X so that for all $i \leq j, \mathcal{D}(\{x_{i}\}) \leq \mathcal{D}(\{x_{j}\})$ . Prove that

$$
\lim_{n \to \infty} \sum_{i \geq n} \mathcal{D}(\{x_{i}\}) = 0.
$$

2. Given any $\epsilon > 0$ prove that there exists $\epsilon_{D} > 0$ such that

$$
\mathcal{D}(\{x \in \mathcal{X}: \mathcal{D}(\{x\}) < \epsilon_{D}\}) < \epsilon.
$$

3. Prove that for every $\eta > 0$ , if n is such that $\mathcal{D}(\{x_{i}\}) < \eta$ for all $i > n$ , then for every $m \in \mathbb{N}.$ ,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\exists x_{i}:(D(\{x_{i}\}) > \eta \text{and} x_{i} \notin S) \right] \leq ne^{- \eta m}.
$$

4. Conclude that if X is countable then for every probability distribution D over X there exists a function $m _ { \mathscr D } : ( 0 , 1 ) \times ( 0 , 1 ) $ <sup>N</sup> such that for every $\epsilon, \delta > 0 \mathrm{if} m > m_{\mathcal{D}}(\epsilon, \delta)$ then

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[\mathcal{D}(\{x: x \notin S\}) > \epsilon \right] < \delta.
$$

5. Prove that Memorize is a consistent learner for every class of (binaryvalued) functions over any countable domain.

So far in the book we have studied the statistical perspective of learning, namely, how many samples are needed for learning. In other words, we focused on the amount of information learning requires. However, when considering automated learning, computational resources also play a major role in determining the complexity of a task: that is, how much computation is involved in carrying out a learning task. Once a sufficient training sample is available to the learner, there is some computation to be done to extract a hypothesis or figure out the label of a given test instance. These computational resources are crucial in any practical application of machine learning. We refer to these two types of resources as the sample complexity and the computational complexity. In this chapter, we turn our attention to the computational complexity of learning.

The computational complexity of learning should be viewed in the wider context of the computational complexity of general algorithmic tasks. This area has been extensively investigated; see, for example, (Sipser 2006). The introductory comments that follow summarize the basic ideas of that general theory that are most relevant to our discussion.

The actual runtime (in seconds) of an algorithm depends on the specific machine the algorithm is being implemented on (e.g., what the clock rate of the machine’s CPU is). To avoid dependence on the specific machine, it is common to analyze the runtime of algorithms in an asymptotic sense. For example, we say that the computational complexity of the merge-sort algorithm, which sorts a list of n items, is $O(n \log(n))$ . This implies that we can implement the algorithm on any machine that satisfies the requirements of some accepted abstract model of computation, and the actual runtime in seconds will satisfy the following: there exist constants c and $n_{0}.$ , which can depend on the actual machine, such that, for any value of $n > n_{0}$ , the runtime in seconds of sorting any n items will be at most c n log(n). It is common to use the term feasible or eficiently computable for tasks that can be performed by an algorithm whose running time is $O(p(n))$ for some polynomial function $p.$ One should note that this type of analysis depends on defining what is the input size n of any instance to which the algorithm is expected to be applied. For “purely algorithmic” tasks, as discussed in the common computational complexity literature, this input size is clearly defined; the algorithm gets an input instance, say, a list to be sorted, or an arithmetic operation to be calculated, which has a well defined size (say, the number of bits in its representation). For machine learning tasks, the notion of an input size is not so clear. An algorithm aims to detect some pattern in a data set and can only access random samples of that data.

We start the chapter by discussing this issue and define the computational complexity of learning. For advanced students, we also provide a detailed formal definition. We then move on to consider the computational complexity of implementing the ERM rule. We first give several examples of hypothesis classes where the ERM rule can be eficiently implemented, and then consider some cases where, although the class is indeed eficiently learnable, ERM implementation is computationally hard. It follows that hardness of implementing ERM does not imply hardness of learning. Finally, we briefly discuss how one can show hardness of a given learning task, namely, that no learning algorithm can solve it eficiently.


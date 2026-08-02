---
title: "Chapter 4 \u2014 Learning via Uniform Convergence"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 4
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 1020
source_line_end: 1181
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 5
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 4 — Learning via Uniform Convergence

> [[../README|本书目录]] · [[03-chapter-3-a-formal-learning-model|上一章]] · [[05-chapter-5-the-bias-complexity-tradeoff|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 1020–1181。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5；sufficient × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 4.1 Uniform Convergence Is sufficient for Learnability

The idea behind the learning condition discussed in this chapter is very simple. Recall that, given a hypothesis class, H, the ERM learning paradigm works as follows: Upon receiving a training sample, $S,$ the learner evaluates the risk (or error) of each h in H on the given sample and outputs a member of $\mathcal{H}$ that minimizes this empirical risk. The hope is that an h that minimizes the empirical risk with respect to $S$ is a risk minimizer (or has risk close to the minimum) with respect to the true data probability distribution as well. For that, it sufices to ensure that the empirical risks of all members of $\mathcal{H}$ are good approximations of their true risk. Put another way, we need that uniformly over all hypotheses in the hypothesis class, the empirical risk will be close to the true risk, as formalized in the following.

<sup>definition</sup> 4.1 ($\epsilon$-representative sample) A training set $S$ is called $\epsilon$-representative (w.r.t. domain $Z,$ hypothesis class ${\mathcal{H}},$ loss function $\ell,$ and distribution D) if

$$
\forall h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | \leq \epsilon.
$$

The next simple lemma states that whenever the sample is $(\epsilon / 2)$ -representative, the ERM learning rule is guaranteed to return a good hypothesis.

<sup>lemma</sup> 4.2 Assume that a training set $S$ is $\frac{\epsilon}{2}$ -representative (w.r.t. domain $Z,$ hypothesis class $\mathcal{H}$ , loss function $\ell,$ and distribution $\mathcal{D} \big)$ . Then, any output $of$ $\mathrm{ERM}_{\mathcal{H}}(S)$ , name $: ly,$ any $h_{S} \in \operatorname{argmin}_{h \in \mathcal{H}} L_{S}(h)$ , satisfies

$$
L_{\mathcal{D}}(h_{S}) \leq \min_{h \in \mathcal{H}} L_{\mathcal{D}}(h) + \epsilon.
$$

Proof For every $h \in \mathcal H$

$$
L_{\mathcal{D}}(h_{S}) \leq L_{S}(h_{S}) + \frac{\epsilon}{2} \leq L_{S}(h) + \frac{\epsilon}{2} \leq L_{\mathcal{D}}(h) + \frac{\epsilon}{2} + \frac{\epsilon}{2} = L_{\mathcal{D}}(h) + \epsilon,
$$

where the first and third inequalities are due to the assumption that S is $\frac{\epsilon}{2} -$ representative (Definition 4.1) and the second inequality holds since $h_{S}$ is an ERM predictor. □

The preceding lemma implies that to ensure that the ERM rule is an agnostic PAC learner, it sufices to show that with probability of at least $1 - \delta$ over the random choice of a training set, it will be an $\epsilon$-representative training set. The uniform convergence condition formalizes this requirement.

<sup>definition</sup> 4.3 (Uniform Convergence) We say that a hypothesis class H has the uniform convergence property (w.r.t. a domain $Z$ and a loss function \`) if there exists a function $m_{\mathcal{H}}^{\mathrm{UC}} :(0, 1)^{2} \to$ <sup>N</sup> such that for every $\epsilon, \delta \in(0, 1)$ and for every probability distribution $\mathcal{D}$ over Z, if S is a sample of $m \ge m_{\mathcal{H}}^{\mathrm{UC}}(\epsilon, \delta)$ examples drawn i.i.d. according to D, then, with probability of at least $1 - \delta, S$ is $\epsilon$-representative.

Similar to the definition of sample complexity for PAC learning, the function $m_{\mathcal{H}}^{\mathrm{uc}}$ measures the (minimal) sample complexity of obtaining the uniform convergence property, namely, how many examples we need to ensure that with probability of at least $1 - \delta$ the sample would be $\epsilon$-representative.

The term uniform here refers to having a fixed sample size that works for all members of H and over all possible probability distributions over the domain.

The following corollary follows directly from Lemma 4.2 and the definition of uniform convergence.

<sup>corollary</sup> 4.4 If a class H has the uniform convergence property with a function $m_{\mathcal{H}}^{UC}$ then the class is agnostically PAC learnable with the sample complexity $m_{\mathcal{H}}(\epsilon, \delta) \leq m_{\mathcal{H}}^{UC}(\epsilon / 2, \delta)$ . Furthermore, in that case, the $\mathrm{ERM}_{\mathcal{H}}$ paradigm is a successful agnostic PAC learner for H.

## 4.2 Finite Classes Are Agnostic PAC Learnable

In view of Corollary 4.4, the claim that every finite hypothesis class is agnostic PAC learnable will follow once we establish that uniform convergence holds for a finite hypothesis class.

To show that uniform convergence holds we follow a two step argument, similar to the derivation in Chapter 2. The first step applies the union bound while the second step employs a measure concentration inequality. We now explain these two steps in detail.

Fix some $\epsilon, \delta.$ . We need to find a sample size m that guarantees that for any $\mathcal{D}_{\ell}$ , with probability of at least $1 - \delta$ of the choice of $S = ( z _ { 1 } , \dots , z _ { m } ) $ sampled i.i.d. from D we have that for all $h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | \leq \epsilon$ . That is,

$$
\mathcal{D}^{m}(\{S: \forall h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | \leq \epsilon\}) \geq 1 - \delta.
$$

Equivalently, we need to show that

$$
\mathcal{D}^{m}(\{S: \exists h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\}) < \delta.
$$

Writing

$$
\{S: \exists h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\} = \cup_{h \in \mathcal{H}} \{S: | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\},
$$

and applying the union bound (Lemma 2.2) we obtain

$$
\mathcal{D}^{m}(\{S: \exists h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\}) \leq \sum_{h \in \mathcal{H}} \mathcal{D}^{m}(\{S: | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\}).\tag{4.1}
$$

Our second step will be to argue that each summand of the right-hand side of this inequality is small enough (for a suficiently large m). That is, we will show that for any fixed hypothesis, h, (which is chosen in advance prior to the sampling of the training set), the gap between the true and empirical risks, $| L_{S}(h) - L_{\mathcal{D}}(h) |$ |, is likely to be small.

Recall that $L_{\mathcal{D}}(h) = \mathbb{E}_{z \sim \mathcal{D}}[\ell(h, z)]$ and that $\begin{array}{r}{L_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m} \ell(h, z_{i})} \end{array}$ . Since each $z_{i}$ is sampled i.i.d. from D, the expected value of the random variable $\ell(h, z_{i})$ is $L_{\mathcal{D}}(h)$ . By the linearity of expectation, it follows that $L_{\mathcal{D}}(h)$ is also the expected value of $L_{S}(h)$ . Hence, the quantity $| L_{\mathcal{D}}(h) - L_{S}(h)$ | is the deviation of the random variable $L_{S}(h)$ from its expectation. We therefore need to show that the measure of $L_{S}(h)$ is concentrated around its expected value.

A basic statistical fact, the law of large numbers, states that when m goes to infinity, empirical averages converge to their true expectation. This is true for $L_{S}(h)$ , since it is the empirical average of m i.i.d random variables. However, since the law of large numbers is only an asymptotic result, it provides no information about the gap between the empirically estimated error and its true value for any given, finite, sample size.

Instead, we will use a measure concentration inequality due to Hoefding, which quantifies the gap between empirical averages and their expected value.

<sup>lemma</sup> 4.5 (Hoefding’s Inequality) Let $\theta_{1}, \ldots, \theta_{m}$ be a sequence of $i.i.d.$ random variables and assume that for all $i, \mathbb{E}[\theta_{i}] = \mu$ and $\mathbb{P}[a \leq \theta_{i} \leq b] = 1$ . Then, for any $\epsilon > 0$

$$
\mathbb{P} \left[\left| \frac{1}{m} \sum_{i = 1}^{m} \theta_{i} - \mu \right| > \epsilon \right] \leq 2 \exp \left(- 2m \epsilon^{2} /(b - a)^{2}\right).
$$

The proof can be found in Appendix B.

Getting back to our problem, let $\theta_{i}$ be the random variable $\ell(h, z_{i})$ . Since h is fixed and $z_{1}, \ldots, z_{m}$ are sampled i.i.d., it follows that $\theta_{1}, \ldots, \theta_{m}$ are also i.i.d. random variables. Furthermore, $\begin{array}{r}{L_{S}(h) \ = \ \frac{1}{m} \sum_{i = 1}^{m} \theta_{i}} \end{array}$ and $L_{\mathcal{D}}(h) = \mu$ . Let us further assume that the range of \` is [0, 1] and therefore $\theta_{i} \in[0, 1]$ . We therefore obtain that

$$
\mathcal{D}^{m}(\{S: | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\}) = \mathbb{P} \left[\left| \frac{1}{m} \sum_{i = 1}^{m} \theta_{i} - \mu \right| > \epsilon \right] \leq 2 \exp(- 2m \epsilon^{2}).\tag{4.2}
$$

Combining this with Equation (4.1) yields

$$
\begin{array}{c} \mathcal{D}^{m}(\{S: \exists h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\}) \leq \sum_{h \in \mathcal{H}} 2 \exp \left(- 2m \epsilon^{2}\right) \\ = 2 | \mathcal{H} | \exp \left(- 2m \epsilon^{2}\right).\end{array}
$$

Finally, if we choose

$$
m \geq \frac{\log(2 | \mathcal{H} | / \delta)}{2 \epsilon^{2}}
$$

then

$$
\mathcal{D}^{m} \big(\{S: \exists h \in \mathcal{H}, | L_{S}(h) - L_{\mathcal{D}}(h) | > \epsilon\} \big) \leq \delta.
$$

<sup>corollary</sup> 4.6 Let H be a finite hypothesis class, let $Z$ be a domain, and let $\ell : \mathcal{H} \times Z \to[0, 1]$ be a loss function. Then, H enjoys the uniform convergence property with sample complexity

$$
m_{\mathcal{H}}^{UC}(\epsilon, \delta) \leq \left\lceil \frac{\log(2 | \mathcal{H} | / \delta)}{2 \epsilon^{2}} \right\rceil.
$$

Furthermore, the class is agnostically PAC learnable using the ERM algorithm with sample complexity

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq m_{\mathcal{H}}^{UC}(\epsilon / 2, \delta) \leq \left\lceil \frac{2 \log(2 | \mathcal{H} | / \delta)}{\epsilon^{2}} \right\rceil.
$$

Remark $\it 4.1$ (The “Discretization Trick”) While the preceding corollary only applies to finite hypothesis classes, there is a simple trick that allows us to get a very good estimate of the practical sample complexity of infinite hypothesis classes. Consider a hypothesis class that is parameterized by d parameters. For example, let $\mathcal{X} = \mathbb{R}, \mathcal{Y} = \{\pm 1\}$ , and the hypothesis class, H, be all functions of the form $h_{\theta}(x) = \mathrm{sign}(x - \theta)$ . That is, each hypothesis is parameterized by one parameter, $\theta \in \mathbb{R}$ , and the hypothesis outputs 1 for all instances larger than θ and outputs −1 for instances smaller than θ. This is a hypothesis class of an infinite size. However, if we are going to learn this hypothesis class in practice, using a computer, we will probably maintain real numbers using floating point representation, say, of 64 bits. It follows that in practice, our hypothesis class is parameterized by the set of scalars that can be represented using a 64 bits floating point number. There are at most $2^{64}$ such numbers; hence the actual size of our hypothesis class is at most $2^{64}$ . More generally, if our hypothesis class is parameterized by d numbers, in practice we learn a hypothesis class of size at most $2^{64d}$ . Applying Corollary 4.6 we obtain that the sample complexity of such classes is bounded by $\frac{128d + 2 \log(2 / \delta)}{\epsilon^{2}}$ . This upper bound on the sample complexity has the deficiency of being dependent on the specific representation of real numbers used by our machine. In Chapter 6 we will introduce a rigorous way to analyze the sample complexity of infinite size hypothesis classes. Nevertheless, the discretization trick can be used to get a rough estimate of the sample complexity in many practical situations.

## 4.3 Summary

If the uniform convergence property holds for a hypothesis class H then in most cases the empirical risks of hypotheses in H will faithfully represent their true risks. Uniform convergence sufices for agnostic PAC learnability using the ERM rule. We have shown that finite hypothesis classes enjoy the uniform convergence property and are hence agnostic PAC learnable.

## 4.4 Bibliographic Remarks

Classes of functions for which the uniform convergence property holds are also called Glivenko-Cantelli classes, named after Valery Ivanovich Glivenko and Francesco Paolo Cantelli, who proved the first uniform convergence result in the 1930s. See (Dudley, Gine & Zinn 1991). The relation between uniform convergence and learnability was thoroughly studied by Vapnik – see (Vapnik 1992, Vapnik 1995, Vapnik 1998). In fact, as we will see later in Chapter 6, the fundamental theorem of learning theory states that in binary classification problems, uniform convergence is not only a sufficient condition for learnability but is also a necessary condition. This is not the case for more general learning problems (see (Shalev-Shwartz, Shamir, Srebro & Sridharan 2010)).

## 4.5 Exercises

1. In this exercise, we show that the $(\epsilon, \delta)$ requirement on the convergence of errors in our definitions of PAC learning, is, in fact, quite close to a simpler looking requirement about averages (or expectations). Prove that the following two statements are equivalent (for any learning algorithm $A,$ any probability distribution D, and any loss function whose range is [0, 1]): 1. For every $\epsilon, \delta > 0$ , there exists $m(\epsilon, \delta)$ such that ∀m $\ge m(\epsilon, \delta)$

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}} \left[L_{\mathcal{D}}(A(S)) > \epsilon \right] < \delta
$$

2.

$$
\lim_{m \to \infty} \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}}(A(S)) \right] = 0
$$

2. Bounded loss functions: In Corollary 4.6 we assumed that the range of the loss function is [0, 1]. Prove that if the range of the loss function is $[a, b]$ then the sample complexity satisfies

(where $\mathbb{E}_{S \sim{\mathcal{D}}^{m}}$ denotes the expectation over samples S of size m).

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq m_{\mathcal{H}}^{\mathrm{UC}}(\epsilon / 2, \delta) \leq \left\lceil \frac{2 \log(2 | \mathcal{H} | / \delta)(b - a)^{2}}{\epsilon^{2}} \right\rceil.
$$

In Chapter 2 we saw that unless one is careful, the training data can mislead the learner, and result in overfitting. To overcome this problem, we restricted the search space to some hypothesis class H. Such a hypothesis class can be viewed as reflecting some prior knowledge that the learner has about the task – a belief that one of the members of the class H is a low-error model for the task. For example, in our papayas taste problem, on the basis of our previous experience with other fruits, we may assume that some rectangle in the color-hardness plane predicts (at least approximately) the papaya’s tastiness.

Is such prior knowledge really necessary for the success of learning? Maybe there exists some kind of universal learner, that is, a learner who has no prior knowledge about a certain task and is ready to be challenged by any task? Let us elaborate on this point. A specific learning task is defined by an unknown distribution D over $\mathcal{X} \times \mathcal{V}.$ , where the goal of the learner is to find a predictor $h : \mathcal{X} \to \mathcal{Y}$ , whose risk, $L_{\mathcal{D}}(h)$ , is small enough. The question is therefore whether there exist a learning algorithm A and a training set size $m,$ such that for every distribution D, if A receives m i.i.d. examples from $\mathcal{D},$ , there is a high chance it outputs a predictor h that has a low risk.

The first part of this chapter addresses this question formally. The No-Free-Lunch theorem states that no such universal learner exists. To be more precise, the theorem states that for binary classification prediction tasks, for every learner there exists a distribution on which it fails. We say that the learner fails if, upon receiving i.i.d. examples from that distribution, its output hypothesis is likely to have a large risk, say, $\geq 0.3$ , whereas for the same distribution, there exists another learner that will output a hypothesis with a small risk. In other words, the theorem states that no learner can succeed on all learnable tasks – every learner has tasks on which it fails while other learners succeed.

Therefore, when approaching a particular learning problem, defined by some distribution D, we should have some prior knowledge on D. One type of such prior knowledge is that D comes from some specific parametric family of distributions. We will study learning under such assumptions later on in Chapter 24. Another type of prior knowledge on D, which we assumed when defining the PAC learning model, is that there exists h in some predefined hypothesis class H, such that $L_{\mathcal{D}}(h) = 0.$ . A softer type of prior knowledge on D is assuming that mi $\mathsf{1}_{h \in \mathcal{H}} L_{\mathcal{D}}(h)$ is small. In a sense, this weaker assumption on D is a prerequisite for using the agnostic PAC model, in which we require that the risk of the output hypothesis will not be much larger than $\mathrm{min}_{h \in \mathcal{H}} L_{\mathcal{D}}(h)$

In the second part of this chapter we study the benefits and pitfalls of using a hypothesis class as a means of formalizing prior knowledge. We decompose the error of an ERM algorithm over a class H into two components. The first component reflects the quality of our prior knowledge, measured by the minimal risk of a hypothesis in our hypothesis class, min $._{h \in \mathcal{H}} L_{\mathcal{D}}(h)$ . This component is also called the approximation error, or the bias of the algorithm toward choosing a hypothesis from H. The second component is the error due to overfitting, which depends on the size or the complexity of the class H and is called the estimation error. These two terms imply a tradeof between choosing a more complex H (which can decrease the bias but increases the risk of overfitting) or a less complex H (which might increase the bias but decreases the potential overfitting).


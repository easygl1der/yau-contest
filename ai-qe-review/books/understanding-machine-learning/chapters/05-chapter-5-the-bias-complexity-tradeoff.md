---
title: "Chapter 5 \u2014 The Bias-Complexity Tradeoff"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 5
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 1182
source_line_end: 1321
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
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 5 — The Bias-Complexity Tradeoff

> [[../README|本书目录]] · [[04-chapter-4-learning-via-uniform-convergence|上一章]] · [[06-chapter-6-the-vc-dimension|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 1182–1321。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；different × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 5.1 The No-Free-Lunch Theorem

In this part we prove that there is no universal learner. We do this by showing that no learner can succeed on all learning tasks, as formalized in the following theorem:

<sup>theorem</sup> 5.1 (No-Free-Lunch) Let A be any learning algorithm for the task of binary classification with respect to $the \mathrm{~ 0 ~ - ~ 1 ~}$ loss over a domain X . Let m be any number smaller than $| \mathcal{X} | / 2_{;}$ , representing a training set size. Then, there exists a distribution D over $\mathcal{X} \times \{0, 1\}$ such that:

1. There exists a function $f : \mathcal{X} \{0, 1\}$ with $L_{\mathcal{D}}(f) = 0$

2. With probability of at least $1 / 7$ over the choice of $S \sim \mathcal{D}^{m}$ we have that $L_{\mathcal{D}}(A(S)) \ge 1 / 8$

This theorem states that for every learner, there exists a task on which it fails, even though that task can be successfully learned by another learner. Indeed, a trivial successful learner in this case would be an ERM learner with the hypothesis class $\mathcal{H} = \{f\}$ , or more generally, ERM with respect to any finite hypothesis class that contains $f$ and whose size satisfies the equation m $\geq 8 \log(7 | \mathcal{H} | / 6)$ (see Corollary 2.3).

Proof Let C be a subset of X of size 2m. The intuition of the proof is that any learning algorithm that observes only half of the instances in $C$ has no information on what should be the labels of the rest of the instances in $C.$ Therefore, there exists a “reality,” that is, some target function $f,$ , that would contradict the labels that $A(S)$ predicts on the unobserved instances in $C.$

Note that there are $T = 2^{2m}$ possible functions from C to {0, 1}. Denote these functions by $f_{1}, \ldots, f_{T}$ . For each such function, let $\mathcal{D}_{i}$ be a distribution over

$C \times \{0, 1\}$ defined by

$$
\mathcal{D}_{i}(\{(x, y)\}) = \left\{\begin{array}{ll} 1 / | C | & \text{if} y = f_{i}(x) \\ 0 & \text{otherwise.} \end{array} \right.
$$

That is, the probability to choose a pair $(x, y)$ is $1 / | C |$ if the label y is indeed the true label according to $f_{i}$ , and the probability is 0 if $y \ne f_{i}(x)$ . Clearly, $L_{\mathcal{D}_{i}}(f_{i}) = 0$

We will show that for every algorithm, A, that receives a training set of m examples from $C \times \{0, 1\}$ } and returns a function $A(S) : C \{0, 1\}$ , it holds that

$$
\max_{i \in[T]} \underset{S \sim \mathcal{D}_{i}^{m}}{\mathbb{E}}[L_{\mathcal{D}_{i}}(A(S))] \geq 1 / 4.\tag{5.1}
$$

Clearly, this means that for every algorithm, $A^{\prime}$ , that receives a training set of m examples from $\mathcal{X} \times \{0, 1\}$ there exist a function $f : \mathcal{X} \{0, 1\}$ and a distribution $\mathcal{D}$ over $\mathcal{X} \times \{0, 1\}$ , such that $L_{\mathcal{D}}(f) = 0$ and

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \big[L_{\mathcal{D}}(A^{\prime}(S)) \big] \geq 1 / 4.\tag{5.2}
$$

It is easy to verify that the preceding sufices for showing that $\mathbb{P}[L_{\mathcal{D}}(A^{\prime}(S)) \geq$ $1 / 8] \geq 1 / 7$ , which is what we need to prove (see Exercise 1).

We now turn to proving that Equation (5.1) holds. There are $k =(2m)^{m}$ possible sequences of m examples from $C.$ Denote these sequences by $S_{1}, \ldots, S_{k}$ Also, if $S_{j} =(x_{1}, \dots, x_{m})$ we denote by $S_{j}^{i}$ the sequence containing the instances in $S_{j}$ labeled by the function $f_{i},$ , namely, $\overset{\cdot}{S_{j}^{i}} = \left((x_{1}, f_{i}(x_{1})), \ldots,(x_{m}, f_{i}(x_{m})) \right)$ . If the distribution is $\mathcal{D}_{i}$ then the possible training sets A can receive are $S_{1}^{i}, \ldots, S_{k}^{i}$ and all these training sets have the same probability of being sampled. Therefore,

$$
\underset{S \sim \mathcal{D}_{i}^{m}}{\mathbb{E}}[L_{\mathcal{D}_{i}}(A(S))] = \frac{1}{k} \sum_{j = 1}^{k} L_{\mathcal{D}_{i}}(A(S_{j}^{i})).\tag{5.3}
$$

Using the facts that “maximum” is larger than “average” and that “average” is larger than “minimum,” we have

$$
\begin{array}{rl} \max_{i \in[T]} \frac{1}{k} \sum_{j = 1}^{k} L_{\mathcal{D}_{i}}(A(S_{j}^{i})) & \geq \frac{1}{T} \sum_{i = 1}^{T} \frac{1}{k} \sum_{j = 1}^{k} L_{\mathcal{D}_{i}}(A(S_{j}^{i})) \\ & = \frac{1}{k} \sum_{j = 1}^{k} \frac{1}{T} \sum_{i = 1}^{T} L_{\mathcal{D}_{i}}(A(S_{j}^{i})) \\ & \geq \min_{j \in[k]} \frac{1}{T} \sum_{i = 1}^{T} L_{\mathcal{D}_{i}}(A(S_{j}^{i})).\end{array}\tag{5.4}
$$

Next, fix some $j ~ \in ~[k]$ . Denote $S_{j} ~ = ~(x_{1}, \ldots, x_{m})$ and let $v_{1}, \ldots, v_{p}$ be the examples in $C$ that do not appear in $S_{j}$ . Clearly, $p \geq m$ . Therefore, for every function $h : C \to \{0, 1\}$ and every i we have

$$
\begin{array}{rl} & L_{\mathcal{D}_{i}}(h) = \frac{1}{2m} \sum_{x \in C} \mathbb{1}_{[h(x) \neq f_{i}(x)]} \\ & \quad \geq \frac{1}{2m} \sum_{r = 1}^{p} \mathbb{1}_{[h(v_{r}) \neq f_{i}(v_{r})]} \\ & \quad \geq \frac{1}{2p} \sum_{r = 1}^{p} \mathbb{1}_{[h(v_{r}) \neq f_{i}(v_{r})]}.\end{array}\tag{5.5}
$$

Hence,

$$
\begin{array}{rl} \frac{1}{T} \sum_{i = 1}^{T} L_{\mathcal{D}_{i}}(A(S_{j}^{i})) & \geq \frac{1}{T} \sum_{i = 1}^{T} \frac{1}{2p} \sum_{r = 1}^{p} \mathbb{1}_{[A(S_{j}^{i})(v_{r}) \neq f_{i}(v_{r})]} \\ & = \frac{1}{2p} \sum_{r = 1}^{p} \frac{1}{T} \sum_{i = 1}^{T} \mathbb{1}_{[A(S_{j}^{i})(v_{r}) \neq f_{i}(v_{r})]} \\ & \geq \frac{1}{2} \cdot \min_{r \in[p]} \frac{1}{T} \sum_{i = 1}^{T} \mathbb{1}_{[A(S_{j}^{i})(v_{r}) \neq f_{i}(v_{r})]}.\end{array}\tag{5.6}
$$

Next, fix some $r \in[p]$ . We can partition all the functions in $f_{1}, \ldots, f_{T}$ into $T / 2$ disjoint pairs, where for a pair $(f_{i}, f_{i^{\prime}})$ we have that for every $c \in C, f_{i}(c) \neq f_{i^{\prime}}(c)$ if and only if $c = v_{r}$ . Since for such a pair we must have $S_{j}^{i} = S_{j}^{i^{\prime}}$ , it follows that

$$
\mathbb{1}_{[A(S_{j}^{i})(v_{r}) \neq f_{i}(v_{r})]} + \mathbb{1}_{[A(S_{j}^{i^{\prime}})(v_{r}) \neq f_{i^{\prime}}(v_{r})]} = 1,
$$

which yields

$$
\frac{1}{T} \sum_{i = 1}^{T} \mathbb{1}_{[A(S_{j}^{i})(v_{r}) \neq f_{i}(v_{r})]} = \frac{1}{2}.
$$

Combining this with Equation (5.6), Equation (5.4), and Equation (5.3), we obtain that Equation (5.1) holds, which concludes our proof. □

## 5.1.1 No-Free-Lunch and Prior Knowledge

How does the No-Free-Lunch result relate to the need for prior knowledge? Let us consider an ERM predictor over the hypothesis class H of all the functions $f$ from $X$ to $\{0, 1\}$ . This class represents lack of prior knowledge: Every possible function from the domain to the label set is considered a good candidate. According to the No-Free-Lunch theorem, any algorithm that chooses its output from hypotheses in ${\mathcal{H}},$ and in particular the ERM predictor, will fail on some learning task. Therefore, this class is not PAC learnable, as formalized in the following corollary:

<sup>corollary</sup> 5.2 Let X be an infinite domain set and let H be the set of all functions from X to {0, 1}. Then, H is not PAC learnable.

Proof Assume, by way of contradiction, that the class is learnable. Choose some $\epsilon < 1 / 8$ and $\delta < 1 / 7$ . By the definition of PAC learnability, there must be some learning algorithm A and an integer $m = m(\epsilon, \delta)$ , such that for any data-generating distribution over $\mathcal{X} \times \{0, 1\}$ , if for some function $f : \mathcal{X} \{0, 1\}$ $L _ { \mathcal { D } } ( f ) = 0 $ , then with probability greater than $1 - \delta$ when A is applied to samples $S$ of size $m$ , generated i.i.d. by D, $L_{\mathcal{D}}(A(S)) \le \epsilon$ . However, applying the No-Free-Lunch theorem, since $|{\mathcal{X}} | > 2m$ , for every learning algorithm (and in particular for the algorithm $A)$ , there exists a distribution D such that with probability greater than $1 / 7 > \delta, L_{\mathcal{D}}(A(S)) > 1 / 8 > \epsilon$ , which leads to the desired contradiction. □

How can we prevent such failures? We can escape the hazards foreseen by the No-Free-Lunch theorem by using our prior knowledge about a specific learning task, to avoid the distributions that will cause us to fail when learning that task. Such prior knowledge can be expressed by restricting our hypothesis class.

But how should we choose a good hypothesis class? On the one hand, we want to believe that this class includes the hypothesis that has no error at all (in the PAC setting), or at least that the smallest error achievable by a hypothesis from this class is indeed rather small (in the agnostic setting). On the other hand, we have just seen that we cannot simply choose the richest class – the class of all functions over the given domain. This tradeof is discussed in the following section.

## 5.2 Error Decomposition

To answer this question we decompose the error of an $\mathrm{ERM}_{\mathcal{H}}$ predictor into two components as follows. Let $h_{S}$ be an $\mathrm{ERM}_{\mathcal{H}}$ hypothesis. Then, we can write

$$
L_{\mathcal{D}}(h_{S}) = \epsilon_{\mathrm{app}} + \epsilon_{\mathrm{est}} \quad \text{where:} \epsilon_{\mathrm{app}} = \min_{h \in \mathcal{H}} L_{\mathcal{D}}(h), \epsilon_{\mathrm{est}} = L_{\mathcal{D}}(h_{S}) - \epsilon_{\mathrm{app}}.\tag{5.7}
$$

- The Approximation Error – the minimum risk achievable by a predictor in the hypothesis class. This term measures how much risk we have because we restrict ourselves to a specific class, namely, how much inductive bias we have. The approximation error does not depend on the sample size and is determined by the hypothesis class chosen. Enlarging the hypothesis class can decrease the approximation error.

Under the realizability assumption, the approximation error is zero. In the agnostic case, however, the approximation error can be large.<sup>1</sup>

- The Estimation Error – the diference between the approximation error and the error achieved by the ERM predictor. The estimation error results because the empirical risk (i.e., training error) is only an estimate of the true risk, and so the predictor minimizing the empirical risk is only an estimate of the predictor minimizing the true risk.

The quality of this estimation depends on the training set size and on the size, or complexity, of the hypothesis class. As we have shown, for a finite hypothesis class, $\epsilon$<sub>est</sub> increases (logarithmically) with |H| and decreases with m. We can think of the size of H as a measure of its complexity. In future chapters we will define other complexity measures of hypothesis classes.

Since our goal is to minimize the total risk, we face a tradeof, called the biascomplexity tradeof. On one hand, choosing H to be a very rich class decreases the approximation error but at the same time might increase the estimation error, as a rich H might lead to overfitting. On the other hand, choosing H to be a very small set reduces the estimation error but might increase the approximation error or, in other words, might lead to underfitting. Of course, a great choice for H is the class that contains only one classifier – the Bayes optimal classifier. But the Bayes optimal classifier depends on the underlying distribution D, which we do not know (indeed, learning would have been unnecessary had we known D).

Learning theory studies how rich we can make H while still maintaining reasonable estimation error. In many cases, empirical research focuses on designing good hypothesis classes for a certain domain. Here, “good” means classes for which the approximation error would not be excessively high. The idea is that although we are not experts and do not know how to construct the optimal classifier, we still have some prior knowledge of the specific problem at hand, which enables us to design hypothesis classes for which both the approximation error and the estimation error are not too large. Getting back to our papayas example, we do not know how exactly the color and hardness of a papaya predict its taste, but we do know that papaya is a fruit and on the basis of previous experience with other fruit we conjecture that a rectangle in the color-hardness space may be a good predictor.

## 5.3 Summary

The No-Free-Lunch theorem states that there is no universal learner. Every learner has to be specified to some task, and use some prior knowledge about that task, in order to succeed. So far we have modeled our prior knowledge by restricting our output hypothesis to be a member of a chosen hypothesis class. When choosing this hypothesis class, we face a tradeof, between a larger, or more complex, class that is more likely to have a small approximation error, and a more restricted class that would guarantee that the estimation error will be small. In the next chapter we will study in more detail the behavior of the estimation error. In Chapter 7 we will discuss alternative ways to express prior knowledge.

## 5.4 Bibliographic Remarks

(Wolpert & Macready 1997) proved several no-free-lunch theorems for optimization, but these are rather different from the theorem we prove here. The theorem we prove here is closely related to lower bounds in VC theory, as we will study in the next chapter.

## 5.5 Exercises

1. Prove that Equation (5.2) sufices for showing that $\mathbb{P}[L_{\mathcal{D}}(A(S)) \geq 1 / 8] \geq 1 / 7$ Hint: Let θ be a random variable that receives values in $[0, 1]$ and whose expectation satisfies $\mathbb{E}[\theta] \ge 1 / 4$ . Use Lemma B.1 to show that $\mathbb{P}[\theta \ge 1 / 8] \ge$ $1 / 7$

2. Assume you are asked to design a learning algorithm to predict whether patients are going to sufer a heart attack. Relevant patient features the algorithm may have access to include blood pressure (BP), body-mass index (BMI), age (A), level of physical activity (P), and income (I).

You have to choose between two algorithms; the first picks an axis aligned rectangle in the two dimensional space spanned by the features BP and BMI and the other picks an axis aligned rectangle in the five dimensional space spanned by all the preceding features.

1. Explain the pros and cons of each choice.

2. Explain how the number of available labeled training samples will afect your choice.

3. Prove that if $|{\mathcal{X}} | \geq$ km for a positive integer $k \geq 2.$ , then we can replace the lower bound of $1 / 4$ in the No-Free-Lunch theorem with $\textstyle{\frac{k - 1}{2k}} ={\frac{1}{2}} -{\frac{1}{2k}}$ Namely, let A be a learning algorithm for the task of binary classification. Let m be any number smaller than $|{\mathcal{X}} | / k$ , representing a training set size. Then, there exists a distribution D over $\mathcal{X} \times \{0, 1\}$ such that:

- There exists a function $f : \mathcal{X} \{0, 1\}$ with $L_{\mathcal{D}}(f) = 0$

$\begin{array}{r}{\mathbb{E}_{S \sim \mathcal{D}^{m}}[L_{\mathcal{D}}(A(S))] \ge \frac{1}{2} - \frac{1}{2k}} \end{array}$

In the previous chapter, we decomposed the error of the $\mathrm{ERM}_{\mathcal{H}}$ rule into approximation error and estimation error. The approximation error depends on the fit of our prior knowledge (as reflected by the choice of the hypothesis class H) to the underlying unknown distribution. In contrast, the definition of PAC learnability requires that the estimation error would be bounded uniformly over all distributions.

Our current goal is to figure out which classes H are PAC learnable, and to characterize exactly the sample complexity of learning a given hypothesis class. So far we have seen that finite classes are learnable, but that the class of all functions (over an infinite size domain) is not. What makes one class learnable and the other unlearnable? Can infinite-size classes be learnable, and, if so, what determines their sample complexity?

We begin the chapter by showing that infinite classes can indeed be learnable, and thus, finiteness of the hypothesis class is not a necessary condition for learnability. We then present a remarkably crisp characterization of the family of learnable classes in the setup of binary valued classification with the zero-one loss. This characterization was first discovered by Vladimir Vapnik and Alexey Chervonenkis in 1970 and relies on a combinatorial notion called the Vapnik-Chervonenkis dimension (VC-dimension). We formally define the VC-dimension, provide several examples, and then state the fundamental theorem of statistical learning theory, which integrates the concepts of learnability, VC-dimension, the ERM rule, and uniform convergence.


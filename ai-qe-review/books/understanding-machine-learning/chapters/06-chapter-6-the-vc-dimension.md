---
title: "Chapter 6 \u2014 The VC-Dimension"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 6
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 1322
source_line_end: 1830
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
  source_control_characters: 1
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 6 — The VC-Dimension

> [[../README|本书目录]] · [[05-chapter-5-the-bias-complexity-tradeoff|上一章]] · [[07-chapter-7-nonuniform-learnability|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 1322–1830。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；different × 1；sufficient × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 6.1 Infinite-Size Classes Can Be Learnable

In Chapter 4 we saw that finite classes are learnable, and in fact the sample complexity of a hypothesis class is upper bounded by the log of its size. To show that the size of the hypothesis class is not the right characterization of its sample complexity, we first present a simple example of an infinite-size hypothesis class that is learnable.

Example 6.1 Let H be the set of threshold functions over the real line, namely, $\mathcal{H} = \{h_{a} : a \in \mathbb{R}\}$ , where $h_{a} : \mathbb{R} \{0, 1\}$ is a function such that $h_{a}(x) = \mathbb{1}_{[x < a]}$ To remind the reader, $\mathbb{1}_{[x < a]}$ is 1 if x < a and 0 otherwise. Clearly, H is of infinite size. Nevertheless, the following lemma shows that H is learnable in the PAC model using the ERM algorithm.

Lemma 6.1 Let H be the class of thresholds as defined earlier. Then, H is PAC learnable, using the ERM rule, with sample complexity of $m_{\mathcal{H}}(\epsilon, \delta) \ \leq$ $\lceil \log(2 / \delta) / \epsilon \rceil$

Proof Let $a^{\star}$ be a threshold such that the hypothesis $h^{\star}(x) = \mathbb{1}_{[x < a^{\star}]}$ achieves $L_{\mathcal{D}}(h^{\star}) = 0$ . Let $\mathcal{D}_{x}$ be the marginal distribution over the domain X and let $a_{0} < a^{\star} < a_{1}$ be such that

$$
\underset{x \sim \mathcal{D}_{x}}{\mathbb{P}} \left[x \in(a_{0}, a^{\star}) \right] = \underset{x \sim \mathcal{D}_{x}}{\mathbb{P}} \left[x \in(a^{\star}, a_{1}) \right] = \epsilon.
$$

$(\mathrm{If} ~{\mathcal{D}}_{x}(- \infty, a^{\star}) \leq \epsilon$ we set $a_{0} = - \infty$ and similarly for $a_{1})$ . Given a training set $S_{☉}$ , let $b_{0} = \operatorname{max} \{x :(x, 1) \in S\}$ and $b_{1} = \operatorname{min} \{x :(x, 0) \in S\}$ (if no example in $S$ is positive we set $b_{0} = - \infty$ and if no example in S is negative we set $b_{1} = \infty)$ Let $b_{S}$ be a threshold corresponding to an ERM hypothesis, $h_{S}.$ which implies that $b_{S} \in(b_{0}, b_{1})$ . Therefore, a sufficient condition for $L_{\mathcal{D}}(h_{S}) \leq \epsilon$ is that both $b_{0} \geq a_{0}$ and $b_{1} \leq a_{1}$ . In other words,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[L_{\mathcal{D}}(h_{S}) > \epsilon] \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[b_{0} < a_{0} \vee b_{1} > a_{1}],
$$

and using the union bound we can bound the preceding by

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[L_{\mathcal{D}}(h_{S}) > \epsilon] \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[b_{0} < a_{0}] + \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[b_{1} > a_{1}].\tag{6.1}
$$

The event $b_{0} < a_{0}$ happens if and only if all examples in S are not in the interval $(a_{0}, a^{*})$ , whose probability mass is defined to be $\epsilon,$ namely,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[b_{0} < a_{0}] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{P}}[\forall(x, y) \in S, x \not \in(a_{0}, a^{\star})] =(1 - \epsilon)^{m} \leq e^{- \epsilon m}.
$$

Since we assume m $> \log(2 / \delta) / \epsilon$ it follows that the equation is at most $\delta / 2$ In the same way it is easy to see that $\mathbb{P}_{S \sim \mathcal{D}^{m}}[b_{1} > a_{1}] \le \delta / 2$ . Combining with Equation (6.1) we conclude our proof. □

## 6.2 The VC-Dimension

We see, therefore, that while finiteness of H is a sufficient condition for learnability, it is not a necessary condition. As we will show, a property called the VC-dimension of a hypothesis class gives the correct characterization of its learnability. To motivate the definition of the VC-dimension, let us recall the No-Free-Lunch theorem (Theorem 5.1) and its proof. There, we have shown that without restricting the hypothesis class, for any learning algorithm, an adversary can construct a distribution for which the learning algorithm will perform poorly, while there is another learning algorithm that will succeed on the same distribution. To do so, the adversary used a finite set $C \subset{\mathcal{X}}$ and considered a family of distributions that are concentrated on elements of C. Each distribution was derived from a “true” target function from C to $\{0, 1\}$ . To make any algorithm fail, the adversary used the power of choosing a target function from the set of all possible functions from $C$ to {0, 1}.

When considering PAC learnability of a hypothesis class H, the adversary is restricted to constructing distributions for which some hypothesis $h \in{\mathcal{H}}$ achieves a zero risk. Since we are considering distributions that are concentrated on elements of $C,$ , we should study how H behaves on $C,$ which leads to the following definition.

<sup>definition</sup> 6.2 (Restriction of H to C) Let H be a class of functions from X to {0, 1} and let $C = \{c_{1}, \ldots, c_{m}\} \subset \mathcal{X}$ . The restriction of H to $C$ is the set of functions from C to $\{0, 1\}$ that can be derived from H. That is,

$$
\mathcal{H}_{C} = \{(h(c_{1}), \dots, h(c_{m})): h \in \mathcal{H}\},
$$

where we represent each function from C to $\{0, 1\}$ as a vector in $\{0, 1\}^{| C |}$

If the restriction of H to C is the set of all functions from C to $\{0, 1\}$ , then we say that H shatters the set C. Formally:

<sup>definition</sup> 6.3 (Shattering) A hypothesis class H shatters a finite set $C \subset{\mathcal{X}}$ if the restriction of H to $C$ is the set of all functions from C to $\{0, 1\}$ . That is, $| \mathcal{H}_{C} | = 2^{| C |}$

Example 6.2 Let H be the class of threshold functions over <sup>R</sup>. Take a set $C = \{c_{1}\}$ }. Now, if we take $a = c_{1} + 1$ , then we have $h_{a}(c_{1}) = 1$ , and if we take $a = c_{1} - 1$ , then we have $h_{a}(c_{1}) = 0$ . Therefore, $\mathcal{H}_{C}$ is the set of all functions from C to $\{0, 1\}$ , and H shatters C. Now take a set $C = \{c_{1}, c_{2}\}$ , where $c_{1} \leq c_{2}$ No $h \in \mathcal H$ can account for the labeling $(0, 1)$ , because any threshold that assigns the label 0 to c must assign the label 0 to $c_{2}$ as well. Therefore not all functions from C to $\{0, 1\}$ are included in $\mathcal{H}_{C};$ hence C is not shattered by H.

Getting back to the construction of an adversarial distribution as in the proof of the No-Free-Lunch theorem (Theorem 5.1), we see that whenever some set C is shattered by ${\mathcal{H}},$ the adversary is not restricted by ${\mathcal{H}},$ as they can construct a distribution over C based on any target function from C to $\{0, 1\}$ , while still maintaining the realizability assumption. This immediately yields:

<sup>corollary</sup> 6.4 Let H be a hypothesis class of functions from X to $\{0, 1\}$ . Let m be a training set size. Assume that there exists a set $C \subset{\mathcal{X}}$ of size 2m that is shattered by H. Then, for any learning algorithm, $A,$ there exist a distribution D over $\mathcal{X} \times \{0, 1\}$ and a predictor $h \in \mathcal H$ such that $L_{\mathcal{D}}(h) = 0$ but with probability of at least $1 / 7$ over the choice of $S \sim \mathcal{D}^{m}$ we have that $L_{\mathcal{D}}(A(S)) \ge 1 / 8$

Corollary 6.4 tells us that if H shatters some set C of size 2m then we cannot learn H using m examples. Intuitively, if a set C is shattered by H, and we receive a sample containing half the instances of C, the labels of these instances give us no information about the labels of the rest of the instances in C – every possible labeling of the rest of the instances can be explained by some hypothesis in H. Philosophically,

If someone can explain every phenomenon, his explanations are worthless.

This leads us directly to the definition of the VC dimension.

<sup>definition</sup> 6.5 (VC-dimension) The VC-dimension of a hypothesis class H, denoted VCdim(H), is the maximal size of a set $C \subset{\mathcal{X}}$ that can be shattered by H. If H can shatter sets of arbitrarily large size we say that H has infinite VC-dimension.

A direct consequence of Corollary 6.4 is therefore:

<sup>theorem</sup> 6.6 Let H be a class of infinite VC-dimension. Then, H is not PAC learnable.

Proof Since H has an infinite VC-dimension, for any training set size m, there exists a shattered set of size 2m, and the claim follows by Corollary 6.4. □

We shall see later in this chapter that the converse is also true: A finite VCdimension guarantees learnability. Hence, the VC-dimension characterizes PAC learnability. But before delving into more theory, we first show several examples.

## 6.3 Examples

In this section we calculate the VC-dimension of several hypothesis classes. To show that VCdim(H) = d we need to show that

1. There exists a set C of size d that is shattered by H.

2. Every set C of size d + 1 is not shattered by H.

## 6.3.1 Threshold Functions

Let H be the class of threshold functions over <sup>R</sup>. Recall Example 6.2, where we have shown that for an arbitrary set $C \ = \ \{c_{1}\}$ , H shatters C; therefore $\mathrm{VCdim}(\mathscr{H}) \geq 1$ . We have also shown that for an arbitrary set $C = \{c_{1}, c_{2}\}$ where $c_{1} \leq c_{2}$ , H does not shatter C. We therefore conclude that ${\mathrm{VCdim}}({\mathcal{H}}) = 1$

## 6.3.2 Intervals

Let H be the class of intervals over $\mathbb{R},$ namely, $\mathcal{H} = \{h_{a, b} : a, b \in \mathbb{R}, a < b\}$ ， where $h_{a, b} : \mathbb{R} \{0, 1\}$ is a function such that $h_{a, b}(x) = \mathbb{1}_{[x \in(a, b)]}$ . Take the set $C = \{1, 2\}$ . Then, H shatters $C$ (make sure you understand why) and therefore VCdim $\left(\mathcal{H} \right) \ge ~ 2$ . Now take an arbitrary set $C = \{c_{1}, c_{2}, c_{3}\}$ and assume without loss of generality that $c_{1} \leq c_{2} \leq c_{3}$ . Then, the labeling $(1, 0, 1)$ cannot be obtained by an interval and therefore H does not shatter C. We therefore conclude that ${\mathrm{VCdim}}({\mathcal{H}}) = 2$

## 6.3.3 Axis Aligned Rectangles

Let H be the class of axis aligned rectangles, formally:

$$
\mathcal{H} = \left\{h_{\left(a_{1}, a_{2}, b_{1}, b_{2}\right)}: a_{1} \leq a_{2} \text{and} b_{1} \leq b_{2} \right\}
$$

where

$$
h_{(a_{1}, a_{2}, b_{1}, b_{2})}(x_{1}, x_{2}) = \left\{\begin{array}{ll} 1 & \text{if} a_{1} \leq x_{1} \leq a_{2} \text{and} b_{1} \leq x_{2} \leq b_{2} \\ 0 & \text{otherwise} \end{array} \right.\tag{6.2}
$$

We shall show in the following that $\mathrm{VCdim}(\mathcal{H}) = 4$ . To prove this we need to find a set of 4 points that are shattered by H, and show that no set of 5 points can be shattered by H. Finding a set of 4 points that are shattered is easy (see Figure 6.1). Now, consider any set $C \subset \mathbb{R}^{2}$ of 5 points. In $C,$ , take a leftmost point (whose first coordinate is the smallest in $C)$ , a rightmost point (first coordinate is the largest), a lowest point (second coordinate is the smallest), and a highest point (second coordinate is the largest). Without loss of generality, denote $C = \{c_{1}, \ldots, c_{5}\}$ and let $c_{5}$ be the point that was not selected. Now, define the labeling (1, 1, 1, 1, 0). It is impossible to obtain this labeling by an axis aligned rectangle. Indeed, such a rectangle must contain $c_{1}, \ldots, c_{4};$ but in this case the rectangle contains $c_{5}$ as well, because its coordinates are within the intervals defined by the selected points. So, $C$ is not shattered by $H,$ , and therefore ${\mathrm{VCdim}}(H) = 4$

![Figure 6.1](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/08066b109a5665c1ebf271f61c554da92c6086bf5576364f7fd6ed3ae10a1d54.jpg)  
Figure 6.1 Left: 4 points that are shattered by axis aligned rectangles. Right: Any axis aligned rectangle cannot label $c_{5}$ by 0 and the rest of the points by 1.

## 6.3.4 Finite Classes

Let H be a finite class. Then, clearly, for any set C we have $| \mathcal{H}_{C} | \leq | \mathcal{H} |$ and thus C cannot be shattered if $| \mathcal{H} | < 2^{| C |}$ . This implies that VCdim $(\mathcal{H}) \leq \log_{2}(| \mathcal{H} |)$ . This shows that the PAC learnability of finite classes follows from the more general statement of PAC learnability of classes with finite VC-dimension, which we shall see in the next section. Note, however, that the VC-dimension of a finite class H can be significantly smaller than $\log_{2}(| \mathscr{H} |)$ . For example, let $\mathcal{X} = \{1, \ldots, k\}$ for some integer k, and consider the class of threshold functions (as defined in Example 6.2). Then, $| \mathcal{H} | = k$ but $\mathrm{VCdim}(\mathscr{H}) = 1$ . Since k can be arbitrarily large, the gap between $\log_{2}(| \mathscr{H} |)$ and VCdim(H) can be arbitrarily large.

## 6.3.5 VC-Dimension and the Number of Parameters

In the previous examples, the VC-dimension happened to equal the number of parameters defining the hypothesis class. While this is often the case, it is not always true. Consider, for example, the domain $\chi = \mathbb{R}$ , and the hypothesis class $\mathcal{H} = \{h_{\theta} : \theta \in \mathbb{R}\}$ where $h_{\theta} : \mathcal{X} \{0, 1\}$ is defined by $h_{\theta}(x) = \lceil 0.5 \sin(\theta x) \rceil$ e. It is possible to prove that VCdim $\begin{array}{r}{(\mathcal{H}) = \infty,} \end{array}$ namely, for every d, one can find d points that are shattered by H (see Exercise 8).

## 6.4 The Fundamental Theorem of PAC learning

We have already shown that a class of infinite VC-dimension is not learnable. The converse statement is also true, leading to the fundamental theorem of statistical learning theory:

<sup>theorem</sup> 6.7 (The Fundamental Theorem of Statistical Learning) Let H be a hypothesis class of functions from a domain X to {0, 1} and let the loss function be the 0 − 1 loss. Then, the following are equivalent:

1. H has the uniform convergence property.

2. Any ERM rule is a successful agnostic PAC learner for H.

3. H is agnostic PAC learnable.

4. H is PAC learnable.

5. Any ERM rule is a successful PAC learner for H.

6. H has a finite VC-dimension.

The proof of the theorem is given in the next section.

Not only does the VC-dimension characterize PAC learnability; it even determines the sample complexity.

<sup>theorem</sup> 6.8 (The Fundamental Theorem of Statistical Learning – Quantitative Version) Let H be a hypothesis class of functions from a domain X to {0, 1} and let the loss function be the $0 - 1$ loss. Assume that VCdim(H) = d < ∞. Then, there are absolute constants $C_{1}, C_{2}$ such that:

1. H has the uniform convergence property with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon^{2}} \leq m_{\mathcal{H}}^{UC}(\epsilon, \delta) \leq C_{2} \frac{d + \log(1 / \delta)}{\epsilon^{2}}
$$

2. H is agnostic PAC learnable with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon^{2}} \leq m_{\mathcal{H}}(\epsilon, \delta) \leq C_{2} \frac{d + \log(1 / \delta)}{\epsilon^{2}}
$$

3. H is PAC learnable with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon} \leq m_{\mathcal{H}}(\epsilon, \delta) \leq C_{2} \frac{d \log(1 / \epsilon) + \log(1 / \delta)}{\epsilon}
$$

The proof of this theorem is given in Chapter 28.

Remark 6.3 We stated the fundamental theorem for binary classification tasks. A similar result holds for some other learning problems such as regression with the absolute loss or the squared loss. However, the theorem does not hold for all learning tasks. In particular, learnability is sometimes possible even though the uniform convergence property does not hold (we will see an example in Chapter 13, Exercise 2). Furthermore, in some situations, the ERM rule fails but learnability is possible with other learning rules.

## 6.5 Proof of Theorem 6.7

We have already seen that $12$ in Chapter 4. The implications $23$ and $34$ are trivial and so is $25$ . The implications $46$ and $5 $ 6 follow from the No-Free-Lunch theorem. The dificult part is to show that $61$ . The proof is based on two main claims:

- If ${\mathrm{VCdim}}({\mathcal{H}}) = d,$ then even though H might be infinite, when restricting it to a finite set $C \subset{\mathcal{X}}$ , its “efective” size, $| \mathcal{H}_{C} |$ , is only $O(| C |^{d})$ . That is, the size of $\mathcal{H}_{C}$ grows polynomially rather than exponentially with |C|. This claim is often referred to as Sauer’s lemma, but it has also been stated and proved independently by Shelah and by Perles. The formal statement is given in Section 6.5.1 later.

- In Section 4 we have shown that finite hypothesis classes enjoy the uniform convergence property. In Section 6.5.2 later we generalize this result and show that uniform convergence holds whenever the hypothesis class has a “small efective size.” By “small efective size” we mean classes for which $| \mathcal{H}_{C} |$ grows polynomially with |C|.

## 6.5.1 Sauer’s Lemma and the Growth Function

We defined the notion of shattering, by considering the restriction of H to a finite set of instances. The growth function measures the maximal “efective” size of H on a set of m examples. Formally:

<sup>definition</sup> 6.9 (Growth Function) Let H be a hypothesis class. Then the growth function of ${\mathcal{H}},$ denoted $\tau_{\mathcal{H}} : \mathbb{N} \to \mathbb{N}$ , is defined as

$$
\tau_{\mathcal{H}}(m) = \max_{C \subset \mathcal{X}: | C | = m} \left| \mathcal{H}_{C} \right|.
$$

In words, $\tau_{H}(m)$ is the number of different functions from a set $C$ of size m to {0, 1} that can be obtained by restricting H to C.

Obviously, if ${\mathrm{VCdim}}(\mathcal{H}) = d$ then for any m $\leq d$ we have $\tau_{\mathcal{H}}(m) = 2^{m}$ . In such cases, H induces all possible functions from $C$ to $\{0, 1\}$ . The following beautiful lemma, proposed independently by Sauer, Shelah, and Perles, shows that when m becomes larger than the VC-dimension, the growth function increases polynomially rather than exponentially with m.

<sup>lemma</sup> 6.10 (Sauer-Shelah-Perles) Let H be a hypothesis class with VCdim $({\mathcal{H}}) \leq$ $d < \infty.\Then,$ for all m, $\begin{array}{r}{\tau_{\mathcal{H}}(m) \leq \sum_{i = 0}^{d}{\binom{m}{i}}} \end{array}$ . In particular, if $m > d + 1$ then $\tau_{\mathcal{H}}(m) \leq(em / d)^{d}$

## Proof of Sauer’s Lemma \*

To prove the lemma it sufices to prove the following stronger claim: For any $C = \{c_{1}, \ldots, c_{m}\}$ we have

$$
\forall \mathcal{H}, \quad | \mathcal{H}_{C} | \leq | \{B \subseteq C: \mathcal{H} \text{shatters} B\} |.\tag{6.3}
$$

The reason why Equation (6.3) is sufficient to prove the lemma is that if ${\mathrm{VCdim}}(\mathscr{H}) \leq$ d then no set whose size is larger than d is shattered by H and therefore

$$
| \{B \subseteq C: \mathcal{H} \text{shatters} B\} | \leq \sum_{i = 0}^{d} \binom{m}{i}.
$$

When $m > d + 1$ the right-hand side of the preceding is at most $(em / d)^{d}$ (see Lemma A.5 in Appendix A).

We are left with proving Equation (6.3) and we do it using an inductive argument. For $m = 1$ , no matter what H is, either both sides of Equation (6.3) equal 1 or both sides equal 2 (the empty set is always considered to be shattered by H). Assume Equation (6.3) holds for sets of size $k < m$ and let us prove it for sets of size m. Fix H and $C = \{c_{1}, \ldots, c_{m}\}$ . Denote $C^{\prime} = \{c_{2}, \ldots, c_{m}\}$ and in addition, define the following two sets:

$$
Y_{0} = \left\{\left(y_{2}, \dots, y_{m}\right): \left(0, y_{2}, \dots, y_{m}\right) \in \mathcal{H}_{C} \vee \left(1, y_{2}, \dots, y_{m}\right) \in \mathcal{H}_{C} \right\},
$$

and

$$
Y_{1} = \left\{\left(y_{2}, \dots, y_{m}\right): \left(0, y_{2}, \dots, y_{m}\right) \in \mathcal{H}_{C} \wedge \left(1, y_{2}, \dots, y_{m}\right) \in \mathcal{H}_{C} \right\}.
$$

It is easy to verify that $| \mathcal{H}_{C} | = | Y_{0} | + | Y_{1} |$ . Additionally, since $Y_{0} = \mathcal{H}_{C^{\prime}}$ , using the induction assumption (applied on H and C<sup>0</sup>) we have that

$| Y_{0} | = | \mathcal{H}_{C^{\prime}} | \leq | \{B \subseteq C^{\prime}$ : H shatters $B\} | = | \{B \subseteq C : c_{1} \notin B \land \mathcal{H}$ shatters $B\}$

Next, define $\mathcal{H}^{\prime} \subseteq \mathcal{H}$ to be

$$
\begin{array}{rl} &{\mathcal{H}^{\prime} = \{h \in \mathcal{H}: \exists h^{\prime} \in \mathcal{H} \text{s.t.}(1 - h^{\prime}(c_{1}), h^{\prime}(c_{2}), \ldots, h^{\prime}(c_{m}))} \\ &{\qquad =(h(c_{1}), h(c_{2}), \ldots, h(c_{m})\},} \end{array}
$$

namely, $\mathcal{H}^{\prime}$ contains pairs of hypotheses that agree on $C^{\prime}$ and difer on $c_{1}$ . Using this definition, it is clear that if $\mathcal{H}^{\prime}$ shatters a set $B \subseteq C^{\prime}$ then it also shatters the set $B \cup \{c_{1}\}$ and vice versa. Combining this with the fact that $Y_{1} = \mathcal{H}_{C^{\prime}}^{\prime}$ and using the inductive assumption (now applied on $\mathcal{H}^{\prime}$ and $C^{\prime})$ we obtain that

$$
\begin{array}{c} | Y_{1} | = | \mathcal{H}_{C^{\prime}}^{\prime} | \leq | \{B \subseteq C^{\prime}: \mathcal{H}^{\prime} \text{shatters} B\} | = | \{B \subseteq C^{\prime}: \mathcal{H}^{\prime} \text{shatters} B \cup \{c_{1}\}\} | \\ = | \{B \subseteq C: c_{1} \in B \land \mathcal{H}^{\prime} \text{shatters} B\} | \leq | \{B \subseteq C: c_{1} \in B \land \mathcal{H} \text{shatters} B\} |.\end{array}
$$

Overall, we have shown that

$$
\begin{array}{l} | \mathcal{H}_{C} | = | Y_{0} | + | Y_{1} | \\ \quad \leq | \{B \subseteq C: c_{1} \not \in B \land \mathcal{H} \text{shatters} B\} | + | \{B \subseteq C: c_{1} \in B \land \mathcal{H} \text{shatters} B\} | \\ \quad = | \{B \subseteq C: \mathcal{H} \text{shatters} B\} |, \end{array}
$$

which concludes our proof.

## 6.5.2 Uniform Convergence for Classes of Small Efective Size

In this section we prove that if H has small efective size then it enjoys the uniform convergence property. Formally,

<sup>theorem</sup> 6.11 Let H be a class and let $\tau_{\mathcal{H}}$ be its growth function. Then, for every D and every $\delta \in(0, 1)$ , with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ we have

$$
| L_{\mathcal{D}}(h) - L_{S}(h) | \leq \frac{4 + \sqrt{\log(\tau_{\mathcal{H}}(2m))}}{\delta \sqrt{2m}}.
$$

Before proving the theorem, let us first conclude the proof of Theorem 6.7.

Proof of Theorem 6.7 It sufices to prove that if the VC-dimension is finite then the uniform convergence property holds. We will prove that

$$
m_{\mathcal{H}}^{\mathrm{uc}}(\epsilon, \delta) \leq 4 \frac{16d}{(\delta \epsilon)^{2}} \log \left(\frac{16d}{(\delta \epsilon)^{2}}\right) + \frac{16d \log(2e / d)}{(\delta \epsilon)^{2}}.
$$

From Sauer’s lemma we have that for $m > d, \tau_{\mathcal{H}}(2m) \leq(2em / d)^{d}$ . Combining this with Theorem 6.11 we obtain that with probability of at least $1 - \delta$ ,

$$
| L_{S}(h) - L_{\mathcal{D}}(h) | \leq \frac{4 + \sqrt{d \log(2em / d)}}{\delta \sqrt{2m}}.
$$

For simplicity assume that ${\sqrt{d \log(2em / d)}} \geq 4;$ hence,

$$
| L_{S}(h) - L_{\mathcal{D}}(h) | \leq \frac{1}{\delta} \sqrt{\frac{2d \log(2em / d)}{m}}.
$$

To ensure that the preceding is at most $\epsilon$ we need that

$$
m \geq \frac{2d \log(m)}{(\delta \epsilon)^{2}} + \frac{2d \log(2e / d)}{(\delta \epsilon)^{2}}.
$$

Standard algebraic manipulations (see Lemma $\mathrm{A.2}$ in Appendix A) show that a sufficient condition for the preceding to hold is that

$$
m \geq 4 \frac{2d}{(\delta \epsilon)^{2}} \log \left(\frac{2d}{(\delta \epsilon)^{2}}\right) + \frac{4d \log(2e / d)}{(\delta \epsilon)^{2}}.
$$

Remark $6.4$ The upper bound on $m_{\mathcal{H}}^{\mathrm{UC}}$ we derived in the proof Theorem 6.7 is not the tightest possible. A tighter analysis that yields the bounds given in Theorem 6.8 can be found in Chapter 28.

## Proof of Theorem 6.11 \*

We will start by showing that

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) | \right] \leq \frac{4 + \sqrt{\log(\tau_{\mathcal{H}}(2m))}}{\sqrt{2m}}.\tag{6.4}
$$

Since the random variable $\begin{array}{r}{\operatorname{sup}_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) |} \end{array}$ is nonnegative, the proof of the theorem follows directly from the preceding using Markov’s inequality (see Section B.1).

To bound the left-hand side of Equation (6.4) we first note that for every $h \in \mathcal H$ , we can rewrite $L_{\mathcal{D}}(h) = \mathbb{E}_{S^{\prime} \sim \mathcal{D}^{m}}[L_{S^{\prime}}(h)]$ , where $S^{\prime} = z_{1}^{\prime}, \ldots, z_{m}^{\prime}$ is an additional i.i.d. sample. Therefore,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) | \right] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \left| \underset{S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} L_{S^{\prime}}(h) - L_{S}(h) \right| \right].
$$

A generalization of the triangle inequality yields

$$
\Big | \underset{S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{S^{\prime}}(h) - L_{S}(h)] \Big | \leq \underset{S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} | L_{S^{\prime}}(h) - L_{S}(h) |,
$$

and the fact that supermum of expectation is smaller than expectation of supremum yields

$$
\sup_{h \in \mathcal{H}} \underset{S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} | L_{S^{\prime}}(h) - L_{S}(h) | \leq \underset{S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \sup_{h \in \mathcal{H}} | L_{S^{\prime}}(h) - L_{S}(h) |.
$$

Formally, the previous two inequalities follow from Jensen’s inequality. Combin ing all we obtain

$$
\begin{array}{rl} &{\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) | \right] \leq \underset{S, S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} | L_{S^{\prime}}(h) - L_{S}(h) | \right]} \\ &{\qquad = \underset{S, S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \left| \sum_{i = 1}^{m}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right].} \end{array}\tag{6.5}
$$

The expectation on the right-hand side is over a choice of two i.i.d. samples $S = z_{1}, \dots, z_{m}$ and $S^{\prime} = z_{1}^{\prime}, \ldots, z_{m}^{\prime}$ . Since all of these 2m vectors are chosen i.i.d., nothing will change if we replace the name of the random vector $z_{i}$ with the name of the random vector $z_{i}^{\prime}$ . If we do it, instead of the term $(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i}))$ in Equation (6.5) we will have the term $-(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i}))$ ). It follows that for every $\pmb{\sigma} \in \{\pm 1\}^{m}$ we have that Equation (6.5) equals

$$
\underset{S, S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \left| \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right]
$$

Since this holds for every $\pmb{\sigma} \in \{\pm 1\}^{m}$ , it also holds if we sample each component of $\sigma$ uniformly at random from the uniform distribution over {±1}, denoted $U_{\pm}$ Hence, Equation (6.5) also equals

$$
\underset{\boldsymbol{igma} \sim U_{\pm}^{m}}{\mathbb{E}} \underset{S, S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \left| \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right],
$$

and by the linearity of expectation it also equals

$$
\underset{S, S^{\prime} \sim \mathcal{D}^{m}}{\mathbb{E}} \underset{\boldsymbol{igma} \sim U_{\pm}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \left| \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right].
$$

Next, fix $S$ and $S^{\prime},$ , and let $C$ be the instances appearing in $S$ and $S^{\prime}.$ . Then, we can take the supremum only over $h \in{\mathcal{H}}_{C}$ . Therefore,

$$
\begin{array}{l} \underset{\boldsymbol{igma} \sim U_{\pm}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \frac{1}{m} \left| \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right] \\ = \underset{\boldsymbol{igma} \sim U_{\pm}^{m}}{\mathbb{E}} \left[\max_{h \in \mathcal{H}_{C}} \frac{1}{m} \left| \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i})) \right| \right].\end{array}
$$

Fix some $h \in{\mathcal{H}}_{C}$ and denote $\begin{array}{r}{\theta_{h} = \frac{1}{m} \sum_{i = 1}^{m} \sigma_{i}(\ell(h, z_{i}^{\prime}) - \ell(h, z_{i}))} \end{array}$ . Since $\mathbb{E}[\theta_{h}] = 0$ and $\theta_{h}$ is an average of independent variables, each of which takes values in $[- 1, 1]$ , we have by Hoefding’s inequality that for every $\rho > 0$ 2

$$
\mathbb{P}[| \theta_{h} | > \rho] \leq 2 \exp(- 2m \rho^{2}).
$$

Applying the union bound over $h \in{\mathcal{H}}_{C}$ , we obtain that for any $\rho > 0$

$$
\mathbb{P} \left[\max_{h \in \mathcal{H}_{C}} | \theta_{h} | > \rho \right] \leq 2 | \mathcal{H}_{C} | \exp(- 2m \rho^{2}).
$$

Finally, Lemma A.4 in Appendix $\mathrm{A}$ tells us that the preceding implies

$$
\mathbb{E} \left[\max_{h \in \mathcal{H}_{C}} | \theta_{h} | \right] \leq \frac{4 + \sqrt{\log(| \mathcal{H}_{C} |)}}{\sqrt{2m}}.
$$

Combining all with the definition of $\tau_{\mathcal{H}}$ , we have shown that

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) | \right] \leq \frac{4 + \sqrt{\log(\tau_{\mathcal{H}}(2m))}}{\sqrt{2m}}.
$$

## 6.6 Summary

The fundamental theorem of learning theory characterizes PAC learnability of classes of binary classifiers using VC-dimension. The VC-dimension of a class is a combinatorial property that denotes the maximal sample size that can be shattered by the class. The fundamental theorem states that a class is PAC learnable if and only if its VC-dimension is finite and specifies the sample complexity required for PAC learning. The theorem also shows that if a problem is at all learnable, then uniform convergence holds and therefore the problem is learnable using the ERM rule.

## 6.7 Bibliographic remarks

The definition of VC-dimension and its relation to learnability and to uniform convergence is due to the seminal work of Vapnik & Chervonenkis (1971). The relation to the definition of PAC learnability is due to Blumer, Ehrenfeucht, Haussler & Warmuth (1989).

Several generalizations of the VC-dimension have been proposed. For example, the fat-shattering dimension characterizes learnability of some regression problems (Kearns, Schapire & Sellie 1994, Alon, Ben-David, Cesa-Bianchi & Haussler 1997, Bartlett, Long & Williamson 1994, Anthony & Bartlet 1999), and the Natarajan dimension characterizes learnability of some multiclass learning problems (Natarajan 1989). However, in general, there is no equivalence between learnability and uniform convergence. See (Shalev-Shwartz, Shamir, Srebro & Sridharan 2010, Daniely, Sabato, Ben-David & Shalev-Shwartz 2011).

Sauer’s lemma has been proved by Sauer in response to a problem of Erdos (Sauer 1972). Shelah (with Perles) proved it as a useful lemma for Shelah’s theory of stable models (Shelah 1972). Gil Kalai tells<sup>1</sup> us that at some later time, Benjy Weiss asked Perles about such a result in the context of ergodic theory, and Perles, who forgot that he had proved it once, proved it again. Vapnik and Chervonenkis proved the lemma in the context of statistical learning theory.

## 6.8 Exercises

1. Show the following monotonicity property of VC-dimension: For every two hypothesis classes if $\mathcal{H}^{\prime} \subseteq \mathcal{H}$ then $\mathrm{VCdim}(\mathcal{H}^{\prime}) \leq \mathrm{VCdim}(\mathcal{H})$

2. Given some finite domain set, X , and a number $k \leq | \mathcal{X} |$ , figure out the VCdimension of each of the following classes (and prove your claims):

1. $\mathcal H_{= k}^{\mathcal X} = \{h \in \{0, 1\}^{\mathcal X} : | \{x : h(x) = 1\} | = k\}$ . That is, the set of all functions that assign the value 1 to exactly k elements of X .

$$
2.\mathcal{H}_{at - most - k} = \{h \in \{0, 1\}^{\mathcal{X}}: | \{x: h(x) = 1\} | \leq k \text{or} | \{x: h(x) = 0\} | \leq k\}.
$$

3. Let X be the Boolean hypercube $\{0, 1\}^{n}$ . For a set $I \subseteq \{1, 2, \ldots, n\}$ we define a parity function $h_{I}$ as follows. On a binary vector $\mathbf{x} =(x_{1}, x_{2}, \ldots, x_{n}) \in$ $\{0, 1\}^{n}$ ，

$$
h_{I}(\mathbf{x}) = \left(\sum_{i \in I} x_{i}\right) \bmod 2.
$$

(That is, $h_{I}$ computes parity of bits in $I.)$ What is the VC-dimension of the class of all such parity functions, $\mathcal{H}_{n \mathrm{- parity}} = \{h_{I} ~ : ~ I \subseteq \{1, 2, \dots, n\}\} ?$

4. We proved Sauer’s lemma by proving that for every class H of finite VCdimension $d,$ and every subset A of the domain,

$$
| \mathcal{H}_{A} | \leq | \{B \subseteq A : \mathcal{H} \text{shatters} B\} | \leq \sum_{i = 0}^{d} \binom{| A |}{i}.
$$

Show that there are cases in which the previous two inequalities are strict (namely, the $\leq$ can be replaced by $<)$ and cases in which they can be replaced by equalities. Demonstrate all four combinations of = and $<$

5. VC-dimension of axis aligned rectangles in $\mathbb{R}^{d}{\mathrm{:}}$ : Let $\mathcal{H}_{\mathrm{rec}}^{d}$ be the class of axis aligned rectangles in $\mathbb{R}^{d}$ . We have already seen that VCdim $(\mathcal{H}_{\mathrm{rec}}^{2}) = 4$ Prove that in general, VCdim $(\mathcal{H}_{\mathrm{rec}}^{d}) = 2d$

6. VC-dimension of Boolean conjunctions: Let $\mathcal{H}_{con}^{d}$ be the class of Boolean conjunctions over the variables $x_{1}, \ldots, x_{d} \(d \geq 2)$ . We already know that this class is finite and thus (agnostic) PAC learnable. In this question we calculate VCdim $(\mathcal{H}_{con}^{d})$

1. Show that $| \mathcal{H}_{con}^{d} | \leq 3^{d} + 1$

2. Conclude that $\mathrm{VCdim}(\mathcal{H}) \leq d \log 3$

3. Show that $\mathcal{H}_{con}^{d}$ shatters the set of unit vectors $\{\mathbf{e}_{i} : i \leq d\}$

4. (\*\*) Show that $\mathrm{VCdim}(\mathcal{H}_{con}^{d}) \leq d.$

Hint: Assume by contradiction that there exists a set $C = \{c_{1}, \ldots, c_{d + 1}\}$ that is shattered by $\mathcal{H}_{con}^{d}$ . Let $h_{1}, \ldots, h_{d + 1}$ be hypotheses in $\mathcal{H}_{con}^{d}$ that satisfy

$$
\forall i, j \in[d + 1], h_{i}(c_{j}) = \left\{\begin{array}{ll} 0 & i = j \\ 1 & \text{otherwise} \end{array} \right.
$$

For each $i \in[d + 1], h_{i}$ (or more accurately, the conjunction that corresponds to $h_{i})$ contains some literal $\ell_{i}$ which is false on $c_{i}$ and true on $c_{j}$ for each $j \neq i$ . Use the Pigeonhole principle to show that there must be a pair $i < j \le d + 1$ such that $\ell_{i}$ and $\ell_{j}$ use the same $x_{k}$ and use that fact to derive a contradiction to the requirements from the conjunctions $h_{i}, h_{j}$

5. Consider the class ${\mathcal{H}}_{mcon}^{d}$ of monotone Boolean conjunctions over $\{0, 1\}^{d}.$ Monotonicity here means that the conjunctions do not contain negations.

As in $\mathcal{H}_{con}^{d}$ , the empty conjunction is interpreted as the all-positive hypothesis. We augment ${\mathcal{H}}_{mcon}^{d}$ with the all-negative hypothesis $h^{-}$ . Show that VCdim $(\mathcal{H}_{mcon}^{d}) = d.$

7. We have shown that for a finite hypothesis class H, VCdim $(\mathcal{H}) \leq \lfloor \log(| \mathcal{H} |) \rfloor$ However, this is just an upper bound. The VC-dimension of a class can be much lower than that:

1. Find an example of a class H of functions over the real interval $\mathcal{X} =[0, 1]$ such that H is infinite while ${\mathrm{VCdim}}({\mathcal{H}}) = 1$

2. Give an example of a finite hypothesis class H over the domain $\mathcal{X} =[0, 1]$ , where VCdim $({\mathcal{H}}) = \lfloor \log_{2}(|{\mathcal{H}} |) \rfloor$

8. (\*) It is often the case that the VC-dimension of a hypothesis class equals (or can be bounded above $\mathrm{by)}$ the number of parameters one needs to set in order to define each hypothesis in the class. For instance, if H is the class of axis aligned rectangles in $\mathbb{R}^{d}$ , then VCdim $({\mathcal{H}}) = 2d,$ which is equal to the number of parameters used to define a rectangle in $\mathbb{R}^{d}$ . Here is an example that shows that this is not always the case. We will see that a hypothesis class might be very complex and even not learnable, although it has a small number of parameters.

Consider the domain $\chi = \mathbb{R}$ , and the hypothesis class

$$
\mathcal{H} = \{x \mapsto \lceil \sin(\theta x) \rceil : \theta \in \mathbb{R}\}
$$

(here, we take $\lceil - 1 \rceil = 0)$ . Prove that $\mathrm{VCdim}(\mathcal{H}) = \infty.$

Hint: There is more than one way to prove the required result. One option is by applying the following lemma: If $0.x_{1} x_{2} x_{3} \ldots$ is the binary expansion of $x \in(0, 1)$ , then for any natural number m, $\lceil \sin(2^{m} \pi x) \rceil =(1 - x_{m})$ , provided that $\exists k \geq m$ s.t. $x_{k} = 1$

9. Let H be the class of signed intervals, that is,

$\mathcal{H} = \{h_{a, b, s} : a \leq b, s \in \{- 1, 1\}\}$ where

$$
h_{a, b, s}(x) = \left\{\begin{array}{ll} s & \text{if} x \in[a, b] \\ - s & \text{if} x \notin[a, b] \end{array} \right.
$$

Calculate VCdim(H).

10. Let H be a class of functions from X to $\{0, 1\}$

1. Prove that if $\mathrm{VCdim}(\mathscr{H}) \geq d.$ , for any $d,$ then for some probability distribution $\mathcal{D}$ over $\mathcal{X} \times \{0, 1\}$ , for every sample size, m,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[L_{\mathcal{D}}(A(S))] \geq \min_{h \in \mathcal{H}} L_{\mathcal{D}}(h) + \frac{d - m}{2d}
$$

Hint: Use Exercise 3 in Chapter 5.

2. Prove that for every H that is PAC learnable, $\mathrm{VCdim}(\mathcal{H}) < \infty$ . (Note that this is the implication $36$ in Theorem 6.7.)

11. VC of union: Let $\mathcal{H}_{1}, \ldots, \mathcal{H}_{i}$ <sub>r</sub> be hypothesis classes over some fixed domain set X . Let $d = \operatorname{max}_{i}{\mathrm{VCdim}(\mathcal{H}_{i})}$ and assume for simplicity that $d \geq 3$

## 1. Prove that

$$
\operatorname{VCdim} \left(\cup_{i = 1}^{r} \mathcal{H}_{i}\right) \leq 4d \log(2d) + 2 \log(r).
$$

Hint: Take a set of k examples and assume that they are shattered by the union class. Therefore, the union class can produce all $2^{k}$ possible labelings on these examples. Use Sauer’s lemma to show that the union class cannot produce more than $rk^{d}$ labelings. Therefore, $2^{k} < rk^{d}$ . Now use Lemma A.2.

2. (\*) Prove that for $r = 2$ it holds that

$$
\operatorname{VCdim} \left(\mathcal{H}_{1} \cup \mathcal{H}_{2}\right) \leq 2d + 1.
$$

12. Dudley classes: In this question we discuss an algebraic framework for defining concept classes over $\mathbb{R}^{n}$ and show a connection between the VC dimension of such classes and their algebraic properties. Given a function $f : \mathbb{R}^{n} \mathbb{R}$ we define the corresponding function, $POS(f)(x) = \mathbb{1}_{[f(x) > 0]}$ . For a class $\mathcal{F}$ of real valued functions we define a corresponding class of functions $POS({\mathcal{F}}) = \{POS(f) : f \in{\mathcal{F}}\}$ . We say that a family, ${\mathcal F},$ of real valued functions is linearly closed if for all $f, g \in{\mathcal{F}}$ and $r \in \mathbb{R},(f + rg) \in \mathcal{F}$ (where addition and scalar multiplication of functions are defined point wise, namely, for all $x \in \mathbb{R}^{n},(f + rg)(x) = f(x) + rg(x))$ ). Note that if a family of functions is linearly closed then we can view it as a vector space over the reals. For a function $g : \mathbb { R } ^ { n } $ <sup>R</sup> and a family of functions ${\mathcal{F}},$ , let ${\mathcal{F}} + g \{\stackrel{\mathrm{def}}{=}} \ \{f + g : f \in{\mathcal{F}}\}$ Hypothesis classes that have a representation as $POS({\mathcal{F}} + g)$ for some vector space of functions $\mathcal{F}$ and some function g are called Dudley classes.

1. Show that for every $g : \mathbb { R } ^ { n } $ <sup>R</sup> and every vector space of functions $\mathcal{F}$ as defined earlier, VCdim $(POS(\mathcal{F} + g)) = \operatorname{VCdim}(POS(\mathcal{F}))$ ).

2. $(^{* *})$ For every linearly closed family of real valued functions ${\mathcal F},$ the $\mathrm{VC} -$ dimension of the corresponding class $POS({\mathcal{F}})$ equals the linear dimension of $\mathcal{F}$ (as a vector space). Hint: Let $f_{1}, \ldots, f_{d}$ be a basis for the vector space ${\mathcal F}.$ Consider the mapping $x \mapsto(f_{1}(x), \ldots, f_{d}(x))$ (from $\mathbb{R}^{n}$ to $\mathbb{R}^{d})$ ). Note that this mapping induces a matching between functions over $\mathbb{R}^{n}$ of the form $POS(f)$ and homogeneous linear halfspaces in $\mathbb{R}^{d}$ (the VC-dimension of the class of homogeneous linear halfspaces is analyzed in Chapter 9).

3. Show that each of the following classes can be represented as a Dudley class:

1. The class $HS_{n}$ of halfspaces over $\mathbb{R}^{n}$ (see Chapter 9).

2. The class $HHS_{n}$ of all homogeneous halfspaces over $\mathbb{R}^{n}$ (see Chapter 9).

3. The class $B_{d}$ of all functions defined by (open) balls in $\mathbb{R}^{d}$ . Use the Dudley representation to figure out the VC-dimension of this class.

4. Let $P_{n}^{d}$ denote the class of functions defined by polynomial inequalities of degree $\leq d$ , namely,

$P_{n}^{d} = \{h_{p} : p$ is a polynomial of degree $\leq d$ in the variables $x_{1}, \ldots, x_{n}\}$ , where, for $\mathbf x =(x_{1}...., x_{n}), h_{p}(\mathbf x) = \mathbb{1}_{[p(\mathbf x) \geq 0]}$ (the degree of a multivariable polynomial is the maximal sum of variable exponents over all of its terms. For example, the degree of $p(\mathbf{x}) = 3x_{1}^{3} x_{2}^{2} + 4x_{3} x_{7}^{2}$ is 5).

1. Use the Dudley representation to figure out the VC-dimension of the class $P_{1}^{d} -$ the class of all d-degree polynomials over <sup>R</sup>.

2. Prove that the class of all polynomial classifiers over <sup>R</sup> has infinite VC-dimension.

3. Use the Dudley representation to figure out the VC-dimension of the class $P_{n}^{d}$ (as a function of d and n).


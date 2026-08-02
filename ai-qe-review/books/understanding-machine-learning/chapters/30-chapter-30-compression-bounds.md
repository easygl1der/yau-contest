---
title: "Chapter 30 \u2014 Compression Bounds"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 30
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 11043
source_line_end: 11146
source_pdf_page_range: null
review_status: machine-verified
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
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

# Chapter 30 — Compression Bounds

> [[../README|本书目录]] · [[29-chapter-29-multiclass-learnability|上一章]] · [[31-chapter-31-pac-bayes|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 11043–11146。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 30.1 Compression Bounds

To motivate the results, let us first consider the following learning protocol. First, we sample a sequence of k examples denoted T . On the basis of these examples, we construct a hypothesis denoted $h_{T}$ . Now we would like to estimate the performance of $h_{T}$ so we sample a fresh sequence of m−k examples, denoted $V,$ , and calculate the error of $h_{T}$ on $V.$ . Since $V$ and $T$ are independent, we immediately get the following from Bernstein’s inequality (see Lemma B.10).

<sup>lemma</sup> 30.1 Assume that the range of the loss function is [0, 1]. Then,

$$
\mathbb{P} \left[L_{\mathcal{D}}(h_{T}) - L_{V}(h_{T}) \geq \sqrt{\frac{2L_{V}(h_{T}) \log(1 / \delta)}{| V |}} + \frac{4 \log(1 / \delta)}{| V |} \right] \leq \delta.
$$

To derive this bound, all we needed was independence between $T$ and $V.$ Therefore, we can redefine the protocol as follows. First, we agree on a sequence of k indices $I =(i_{1}, \dots, i_{k}) \in[m]^{k}$ . Then, we sample a sequence of m examples $\boldsymbol{S} =(z_{1}, \dots, z_{m})$ . Now, define $T = S_{I} = \left(z_{i_{1}}, \dots, z_{i_{k}} \right)$ and define $V$ to be the rest of the examples in S. Note that this protocol is equivalent to the protocol we defined before – hence Lemma 30.1 still holds.

Applying a union bound over the choice of the sequence of indices we obtain the following theorem.

<sup>theorem</sup> 30.2 Let k be an integer and let $B : Z^{k} \to \mathcal{H}$ be a mapping from sequences of k examples to the hypothesis class. Let $m \geq 2k$ be a training set size and let $A : Z^{m} \to \mathcal{H}$ be a learning rule that receives a training sequence S of size m and returns a hypothesis such that $A(S) = B(z_{i_{1}}, \dots, z_{i_{k}})$ for some $(i_{1}, \dots, i_{k}) \in[m]^{k}$ . Let $V = \{z_{j} : j \not \in(i_{1}, \ldots, i_{k})\}$ be the set of examples which were not selected for defining $A(S)$ . Then, with probability of at least $1 - \delta$ over the choice of S we have

$$
L_{\mathcal{D}}(A(S)) \leq L_{V}(A(S)) + \sqrt{L_{V}(A(S)) \frac{4k \log(m / \delta)}{m}} + \frac{8k \log(m / \delta)}{m}.
$$

Proof For any $I \in[m]^{k}$ let $h_{I} = B(z_{i_{1}}, \dots, z_{i_{k}})$ . Let $n = m - k$ . Combining Lemma 30.1 with the union bound we have

$$
\begin{array}{l} \mathbb{P} \left[\exists I \in[m]^{k} \text{s.t.} L_{\mathcal{D}}(h_{I}) - L_{V}(h_{I}) \geq \sqrt{\frac{2L_{V}(h_{I}) \log(1 / \delta)}{n}} + \frac{4 \log(1 / \delta)}{n} \right] \\ \leq \sum_{I \in[m]^{k}} \mathbb{P} \left[L_{\mathcal{D}}(h_{I}) - L_{V}(h_{I}) \geq \sqrt{\frac{2L_{V}(h_{I}) \log(1 / \delta)}{n}} + \frac{4 \log(1 / \delta)}{n} \right] \\ \leq m^{k} \delta.\end{array}
$$

Denote $\delta^{\prime} \ = \m^{k} \delta$ . Using the assumption $k \ \leq \m / 2$ , which implies that $n =$ $m - k \geq m / 2$ , the above implies that with probability of at least $1 - \delta^{\prime}$ we have that

$$
L_{\mathcal{D}}(A(S)) \leq L_{V}(A(S)) + \sqrt{L_{V}(A(S)) \frac{4k \log(m / \delta^{\prime})}{m}} + \frac{8k \log(m / \delta^{\prime})}{m},
$$

which concludes our proof.

As a direct corollary we obtain:

<sup>corollary</sup> 30.3 Assuming the conditions of Theorem 30.2, and further assuming that $L_{V}(A(S)) = 0$ , then, with probability of at least $1 - \delta$ over the choice $ofS$ we have

$$
L_{\mathcal{D}}(A(S)) \leq \frac{8k \log(m / \delta)}{m}.
$$

These results motivate the following definition:

<sup>definition</sup> 30.4 (Compression Scheme) Let H be a hypothesis class of functions from $\mathcal{X}$ to Y and let k be an integer. We say that H has a compression scheme of size k if the following holds:

For all m there exists $A : Z^{m}[m]^{k}$ and $B : Z^{k} \to \mathcal{H}$ such that for all $h \in \mathcal H$ , if we feed any training set of the form $(x_{1}, h(x_{1})), \ldots,(x_{m}, h(x_{m}))$ into A and then feed $(x_{i_{1}}, h(x_{i_{1}})), \dots,(x_{i_{k}}, h(x_{i_{k}}))$ into $B_{;}$ , where $(i_{1}, \dots, i_{k})$ is the output of $A,$ , then the output of $B,$ denoted $h^{\prime}$ , satisfies $L_{S}(h^{\prime}) = 0$

It is possible to generalize the definition for unrealizable sequences as follows.

<sup>definition</sup> 30.5 (Compression Scheme for Unrealizable Sequences) Let H be a hypothesis class of functions from X to Y and let k be an integer. We say that H has a compression scheme of size k if the following holds: For all m there exists $A : Z^{m}[m]^{k}$ and $B : Z^{k} \to \mathcal{H}$ such that for all $h \in \mathcal H$ 4 if we feed any training set of the form $(x_{1}, y_{1}), \dots,(x_{m}, y_{m})$ into A and then feed $(x_{i_{1}}, y_{i_{1}}), \dots,(x_{i_{k}}, y_{i_{k}})$ into $B,$ , where $(i_{1}, \dots, i_{k})$ is the output of $A.$ , then the output of B, denoted h<sup>0</sup>, satisfies $L_{S}(h^{\prime}) \leq L_{S}(h)$

The following lemma shows that the existence of a compression scheme for the realizable case also implies the existence of a compression scheme for the unrealizable case.

<sup>lemma</sup> 30.6 Let H be a hypothesis class for binary classification, and assume it has a compression scheme of size k in the realizable case. Then, it has a compression scheme of size k for the unrealizable case as well.

Proof Consider the following scheme: First, find an ERM hypothesis and denote it by h. Then, discard all the examples on which h errs. Now, apply the realizable compression scheme on the examples that have not been removed. The output of the realizable compression scheme, denoted $h^{\prime},$ must be correct on the examples that have not been removed. Since h errs on the removed examples it follows that the error of $h^{\prime}$ cannot be larger than the error of h; hence $h^{\prime}$ is also an ERM hypothesis. □

## 30.2 Examples

In the examples that follows, we present compression schemes for several hypothesis classes for binary classification. In light of Lemma 30.6 we focus on the realizable case. Therefore, to show that a certain hypothesis class has a compression scheme, it is necessary to show that there exist A, B, and k for which $L_{S}(h^{\prime}) = 0$

## 30.2.1 Axis Aligned Rectangles

Note that this is an uncountable infinite class. We show that there is a simple compression scheme. Consider the algorithm A that works as follows: For each dimension, choose the two positive examples with extremal values at this dimension. Define B to be the function that returns the minimal enclosing rectangle. Then, for $k = 2d$ , we have that in the realizable case, $L_{S}(B(A(S))) = 0$

## 30.2.2 Halfspaces

Let $\chi = \mathbb{R}^{d}$ and consider the class of homogenous halfspaces, $\{\mathbf{x} \mapsto \mathrm{sign}(\langle \mathbf{w}, \mathbf{x} \rangle)$ $\mathbf{w} \in \mathbb{R}^{d}\}$

## A Compression Scheme:

W.l.o.g. assume all labels are positive (otherwise, replace $\mathbf{x}_{i}$ by $y_{i} \mathbf{x}_{i})$ . The compression scheme we propose is as follows. First, A finds the vector w which is in the convex hull of $\{\mathbf{x}_{1}, \hdots, \mathbf{x}_{m}\}$ and has minimal norm. Then, it represents it as a convex combination of d points in the sample (it will be shown later that this is always possible). The output of A are these d points. The algorithm B receives these d points and set w to be the point in their convex hull of minimal norm.

Next we prove that this indeed is a compression sceme. Since the data is linearly separable, the convex hull of $\{\mathbf{x}_{1}, \hdots, \mathbf{x}_{m}\}$ does not contain the origin. Consider the point w in this convex hull closest to the origin. (This is a unique point which is the Euclidean projection of the origin onto this convex hull.) We claim that w separates the data.<sup>1</sup> To see this, assume by contradiction that $\left.\mathbf{w}, \mathbf{x}_{i} \right.\leq 0$ for some i. Take $\mathbf{w}^{\prime} =(1 - \alpha) \mathbf{w} + \alpha \mathbf{x}_{i}$ <sub>i</sub> for $\begin{array}{r}{\alpha = \frac{\| \mathbf{w} \|^{2}}{\| \mathbf{x}_{i} \|^{2} + \| \mathbf{w} \|^{2}} \in(0, 1)} \end{array}$ Then $\mathbf{w}^{\prime}$ is also in the convex hull and

$$
\begin{array}{rl} &{\| \mathbf{w}^{\prime} \|^{2} =(1 - \alpha)^{2} \| \mathbf{w} \|^{2} + \alpha^{2} \| \mathbf{x}_{i} \|^{2} + 2 \alpha(1 - \alpha) \langle \mathbf{w}, \mathbf{x}_{i} \rangle} \\ &{\quad \leq(1 - \alpha)^{2} \| \mathbf{w} \|^{2} + \alpha^{2} \| \mathbf{x}_{i} \|^{2}} \\ &{\quad = \frac{\| \mathbf{x}_{i} \|^{4} \| \mathbf{w} \|^{2} + \| \mathbf{x}_{i} \|^{2} \| \mathbf{w} \|^{4}}{(\| \mathbf{w} \|^{2} + \| \mathbf{x}_{i} \|^{2})^{2}}} \\ &{\quad = \frac{\| \mathbf{x}_{i} \|^{2} \| \mathbf{w} \|^{2}}{\| \mathbf{w} \|^{2} + \| \mathbf{x}_{i} \|^{2}}} \\ &{\quad = \| \mathbf{w} \|^{2} \cdot \frac{1}{\| \mathbf{w} \|^{2} / \| \mathbf{x}_{i} \|^{2} + 1}} \\ &{\quad < \| \mathbf{w} \|^{2},} \end{array}
$$

which leads to a contradiction.

We have thus shown that w is also an ERM. Finally, since w is in the convex hull of the examples, we can apply Caratheodory’s theorem to obtain that w is also in the convex hull of a subset of $d + 1$ points of the polygon. Furthermore, the minimality of w implies that w must be on a face of the polygon and this implies it can be represented as a convex combination of d points.

It remains to show that w is also the projection onto the polygon defined by the d points. But this must be true: On one hand, the smaller polygon is a subset of the larger one; hence the projection onto the smaller cannot be smaller in norm. On the other hand, w itself is a valid solution. The uniqueness of projection concludes our proof.

## 30.2.3 Separating Polynomials

Let $\chi = \mathbb{R}^{d}$ and consider the class $\mathbf{x} \mapsto{\mathrm{sign}}(p(x))$ where $p$ is a degree r polynomial.

<sup>1</sup> It can be shown that w is the direction of the max-margin solution.

Note that $p(x)$ can be rewritten as $\langle \mathbf{w}, \psi(\mathbf{x}) \rangle$ where the elements of $\psi(x)$ are all the monomials of x up to degree r. Therefore, the problem of constructing a compression scheme for $p(\mathbf{x})$ reduces to the problem of constructing a compression scheme for halfspaces in $\mathbb{R}^{d^{\prime}}$ where $d^{\prime} = O(d^{r})$ .

## 30.2.4 Separation with Margin

Suppose that a training set is separated with margin γ. The Perceptron algorithm guarantees to make at most $1 / \gamma^{2}$ updates before converging to a solution that makes no mistakes on the entire training set. Hence, we have a compression scheme of size $k \le 1 / \gamma^{2}$

## 30.3 Bibliographic Remarks

Compression schemes and their relation to learning were introduced by Littlestone & Warmuth (1986). As we have shown, if a class has a compression scheme then it is learnable. For binary classification problems, it follows from the fundamental theorem of learning that the class has a finite VC dimension. The other direction, namely, whether every hypothesis class of finite VC dimension has a compression scheme of finite size, is an open problem posed by Manfred Warmuth and is still open (see also (Floyd 1989, Floyd & Warmuth 1995, Ben-David & Litman 1998, Livni & Simon 2013).

The Minimum Description Length (MDL) and Occam’s razor principles allow a potentially very large hypothesis class but define a hierarchy over hypotheses and prefer to choose hypotheses that appear higher in the hierarchy. In this chapter we describe the PAC-Bayesian approach that further generalizes this idea. In the PAC-Bayesian approach, one expresses the prior knowledge by defining prior distribution over the hypothesis class.


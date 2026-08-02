---
title: "Chapter 29 \u2014 Multiclass Learnability"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 29
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 10746
source_line_end: 11042
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

# Chapter 29 — Multiclass Learnability

> [[../README|本书目录]] · [[28-chapter-28-proof-of-the-fundamental-theorem-of-learning-theory|上一章]] · [[30-chapter-30-compression-bounds|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 10746–11042。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；different × 3；sufficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 29.1 The Natarajan Dimension

In this section we define the Natarajan dimension, which is a generalization of the VC dimension to classes of multiclass predictors. Throughout this section, let H be a hypothesis class of multiclass predictors; namely, each $h \in \mathcal H$ is a function from X to [k].

To define the Natarajan dimension, we first generalize the definition of shattering.

<sup>definition</sup> 29.1 (Shattering (Multiclass Version)) We say that a set $C \subset{\mathcal{X}}$ is shattered by H if there exist two functions $f_{0}, f_{1} : C \to[k]$ such that

- For every $x \in C, f_{0}(x) \neq f_{1}(x)$

- For every $B \subset C$ , there exists a function $h \in \mathcal H$ such that

$$
\forall x \in B, h(x) = f_{0}(x) \text{and} \forall x \in C \setminus B, h(x) = f_{1}(x).
$$

<sup>definition</sup> 29.2 (Natarajan Dimension) The Natarajan dimension of H, denoted Ndim(H), is the maximal size of a shattered set $C \subset{\mathcal{X}}$

It is not hard to see that in the case that there are exactly two classes, $\mathrm{Ndim}(\mathcal{H}) = \mathrm{VCdim}(\mathcal{H})$ . Therefore, the Natarajan dimension generalizes the VC dimension. We next show that the Natarajan dimension allows us to generalize the fundamental theorem of statistical learning from binary classification to multiclass classification.

## 29.2 The Multiclass Fundamental Theorem

<sup>theorem</sup> 29.3 (The Multiclass Fundamental Theorem) There exist absolute constants $C_{1}, C_{2} > 0$ such that the following holds. For every hypothesis class H of functions from X to [k], such that the Natarajan dimension of H is d, we have

1. H has the uniform convergence property with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon^{2}} \leq m_{\mathcal{H}}^{\mathrm{UC}}(\epsilon, \delta) \leq C_{2} \frac{d \log(k) + \log(1 / \delta)}{\epsilon^{2}}.
$$

2. H is agnostic PAC learnable with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon^{2}} \leq m_{\mathcal{H}}(\epsilon, \delta) \leq C_{2} \frac{d \log(k) + \log(1 / \delta)}{\epsilon^{2}}.
$$

3. H is PAC learnable (assuming realizability) with sample complexity

$$
C_{1} \frac{d + \log(1 / \delta)}{\epsilon} \leq m_{\mathcal{H}}(\epsilon, \delta) \leq C_{2} \frac{d \log \left(\frac{kd}{\epsilon}\right) + \log(1 / \delta)}{\epsilon}.
$$

## 29.2.1 On the Proof of Theorem 29.3

The lower bounds in Theorem 29.3 can be deduced by a reduction from the binary fundamental theorem (see Exercise 5).

The upper bounds in Theorem 29.3 can be proved along the same lines of the proof of the fundamental theorem for binary classification, given in Chapter 28 (see Exercise 4). The sole ingredient of that proof that should be modified in a nonstraightforward manner is Sauer’s lemma. It applies only to binary classes and therefore must be replaced. An appropriate substitute is Natarajan’s lemma:

<sup>lemma</sup> 29.4 (Natarajan) |H| ≤ |X |<sup>Ndim(H)</sup> · k<sup>2Ndim(H)</sup>.

The proof of Natarajan’s lemma shares the same spirit of the proof of Sauer’s lemma and is left as an exercise (see Exercise 3).

## 29.3 Calculating the Natarajan Dimension

In this section we show how to calculate (or estimate) the Natarajan dimension of several popular classes, some of which were studied in Chapter 17. As these calculations indicate, the Natarajan dimension is often proportional to the number of parameters required to define a hypothesis.

## 29.3.1 One-versus-All Based Classes

In Chapter 17 we have seen two reductions of multiclass categorization to binary classification: One-versus-All and All-Pairs. In this section we calculate the Natarajan dimension of the One-versus-All method.

Recall that in One-versus-All we train, for each label, a binary classifier that distinguishes between that label and the rest of the labels. This naturally suggests considering multiclass hypothesis classes of the following form. Let $\mathcal{H}_{\mathrm{bin}} \subset$ $\{0, 1\}^{\mathcal{X}}$ be a binary hypothesis class. For every $\bar{h} =(h_{1}, \dots, h_{k}) \in(\mathcal{H}_{\mathrm{bin}})^{k}$ define $T(\bar{h}) : \mathcal{X} \to[k]$ by

$$
T(\bar{h})(x) = \underset{i \in[k]}{\operatorname{argmax}} h_{i}(x).
$$

If there are two labels that maximize $h_{i}(x)$ , we choose the smaller one. Also, let

$$
\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA,k}} = \left\{T(\bar{h}): \bar{h} \in \left(\mathcal{H}_{\mathrm{bin}}\right)^{k} \right\}.
$$

What “should” be the Natarajan dimension of $\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k_{2}}}$ Intuitively, to specify a hypothesis in $\mathcal{H}_{\mathrm{bin}}$ we need $d = \operatorname{VCdim}(\mathcal{H}_{\mathrm{bin}})$ parameters. To specify a hypothesis in $\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k}}$ , we need to specify k hypotheses in $\mathcal{H}_{\mathrm{bin}}$ . Therefore, kd parameters should sufice. The following lemma establishes this intuition.

lemma <sub>29.5</sub> $Ifd = \mathrm{VCdim}(\mathcal{H}_{\mathrm{bin}})$ then

$$
\mathrm{Ndim}(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA,k}}) \leq 3kd \log(kd).
$$

Proof Let $C \subset{\mathcal{X}}$ be a shattered set. By the definition of shattering (for multiclass hypotheses)

$$
\left| \left(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA,k}}\right)_{C} \right| \geq 2^{| C |}.
$$

On the other hand, each hypothesis in $\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k}}$ is determined by using k hypotheses from $\mathcal{H}_{\mathrm{bin}}$ . Therefore,

$$
\left| \left(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA,k}}\right)_{C} \right| \leq |(\mathcal{H}_{\mathrm{bin}})_{C} |^{k}.
$$

By Sauer’s lemma, $| \left(\mathcal{H}_{\mathrm{bin}} \right)_{C} | \leq | C |^{d}$ . We conclude that

$$
2^{| C |} \leq \left| \left(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA,k}}\right)_{C} \right| \leq | C |^{dk}.
$$

The proof follows by taking the logarithm and applying Lemma $\mathrm{A.1}$

How tight is Lemma 29.5? It is not hard to see that for some classes, Ndim $\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k}})$ can be much smaller than dk (see Exercise 1). However there are several natural binary classes, ${\mathcal{H}}_{\mathrm{bin}} \(\mathrm{e.g.}$ , halfspaces), for which Ndim $(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k}}) = \Omega(dk)$ (see Exercise 6).

## 29.3.2 General Multiclass-to-Binary Reductions

The same reasoning used to establish Lemma 29.5 can be used to upper bound the Natarajan dimension of more general multiclass-to-binary reductions. These reductions train several binary classifiers on the data. Then, given a new instance, they predict its label by using some rule that takes into account the labels predicted by the binary classifiers. These reductions include One-versus-All and All-Pairs.

Suppose that such a method trains l binary classifiers from a binary class $\mathcal{H}_{\mathrm{bin}}$ ， and $r : \{0, 1\}^{l} \to[k]$ is the rule that determines the (multiclass) label according to the predictions of the binary classifiers. The hypothesis class corresponding to this method can be defined as follows. For every $\bar{h} =(h_{1}, \dots, h_{l}) \in(\mathcal{H}_{\mathrm{bin}})^{l}$ define $R(\bar{h}) : \mathcal{X} \to[k]$ by

$$
R(\bar{h})(x) = r \left(h_{1}(x), \dots, h_{l}(x)\right).
$$

Finally, let

$$
\mathcal{H}_{\mathrm{bin}}^{r} = \{R(\bar{h}): \bar{h} \in \left(\mathcal{H}_{\mathrm{bin}}\right)^{l}\}.
$$

Similarly to Lemma 29.5 it can be proven that:

<sup>lemma</sup> 29.6 If $d = \operatorname{VCdim}(\mathcal{H}_{\mathrm{bin}})$ then

$$
\mathrm{Ndim}(\mathcal{H}_{\text{bin}}^{r}) \leq 3ld \log(ld).
$$

The proof is left as Exercise 2.

## 29.3.3 Linear Multiclass Predictors

Next, we consider the class of linear multiclass predictors (see Section 17.2). Let $\Psi : \mathcal{X} \times[k] \to \mathbb{R}^{d}$ be some class-sensitive feature mapping and let

$$
\mathcal{H}_{\Psi} = \left\{x\mapsto \operatorname{argmax}_{\substack{i\in[k]}}\langle \mathbf{w},\Psi(x,i)\rangle : \mathbf{w}\in \mathbb{R}^{d}\right\}.\tag{29.1}
$$

Each hypothesis in ${\mathcal{H}}_{\Psi}$ is determined by d parameters, namely, a vector ${\textbf{w}} \in$ $\mathbb{R}^{d}$ . Therefore, we would expect that the Natarajan dimension would be upper bounded by d. Indeed:

theorem <sub>29.7</sub> $\mathrm{Ndim}(\mathcal{H}_{\Psi}) \leq d$

Proof Let $C \subset{\mathcal{X}}$ be a shattered set, and let $f_{0}, f_{1} : C \to[k]$ be the two functions that witness the shattering. We need to show that $| C | \leq d.$ For every $x \in C$ let $\rho(x) = \Psi(x, f_{0}(x)) - \Psi(x, f_{1}(x))$ . We claim that the set $\rho(C) \{\stackrel{\mathrm{def}}{=}}$ $\{\rho(x) \ : \x \in C\}$ consists of |C| elements $({\mathrm{i.e., ~}} \rho$ is one to one) and is shattered by the binary hypothesis class of homogeneous linear separators on $\mathbb{R}^{d}$

$$
\mathcal{H} = \{\mathbf{x} \mapsto \mathrm{sign}(\langle \mathbf{w}, \mathbf{x} \rangle): \mathbf{w} \in \mathbb{R}^{d}\}.
$$

Since ${\mathrm{VCdim}}({\mathcal{H}}) = d,$ it will follow that $| C | = | \rho(C) | \leq d,$ as required.

To establish our claim it is enough to show that $| \mathcal{H}_{\rho(C)} | = 2^{| C |}$ . Indeed, given a subset $B \subset C$ by the definition of shattering, there exists $h_{B} \in \mathcal{H}_{\Psi}$ for which

$$
\forall x \in B, h_{B}(x) = f_{0}(x) \quad \text{and} \quad \forall x \in C \setminus B, h_{B}(x) = f_{1}(x).
$$

Let ${\bf w}_{B} \in \mathbb{R}^{d}$ be a vector that defines $h_{B}$ . We have that, for every $x \in B$ +

$$
\langle \mathbf{w}, \Psi(x, f_{0}(x)) \rangle > \langle \mathbf{w}, \Psi(x, f_{1}(x)) \rangle \Rightarrow \langle \mathbf{w}, \rho(x) \rangle > 0.
$$

Similarly, for every $x \in C \setminus B$ •

$$
\langle \mathbf{w}, \rho(x) \rangle < 0.
$$

It follows that the hypothesis $g_{B} \in \mathcal{H}$ defined by the same $\mathbf{w} \in \mathbb{R}^{d}$ label the points in $\rho(B)$ by 1 and the points in $\rho(C \backslash B)$ by 0. Since this holds for every $B \subseteq C$ we obtain that $| C | = | \rho(C) |$ and $| \mathcal{H}_{\rho(C)} | = 2^{| C |}$ , which concludes our proof. □

The theorem is tight in the sense that there are mappings Ψ for which Ndim $\begin{array}{rl}{\mathcal{H}_{\Psi}) =} \end{array}$ $\Omega(d)$ . For example, this is true for the multivector construction (see Section 17.2 and the Bibliographic Remarks at the end of this chapter). We therefore conclude:

corollary <sub>29.8 Let</sub> $\mathcal{X} = \mathbb{R}^{n}$ and let $\Psi : \mathcal{X} \times[k] \to \mathbb{R}^{nk}$ be the class sensitive feature mapping for the multi-vector construction:

$$
\Psi(\mathbf{x}, y) =[\underbrace{0, \ldots, 0}_{\in \mathbb{R}^{(y - 1) n}}, \underbrace{x_{1}, \ldots, x_{n}}_{\in \mathbb{R}^{n}}, \underbrace{0, \ldots, 0}_{\in \mathbb{R}^{(k - y) n}}].
$$

Let $\mathcal{H}_{\Psi}$ be as defined in Equation $(29.1)$ . Then, the Natarajan dimension of $\mathcal{H}_{\Psi}$ satisfies

$$
(k - 1)(n - 1) \leq \mathrm{Ndim}(\mathcal{H}_{\Psi}) \leq kn.
$$

## 29.4 On Good and Bad ERMs

In this section we present an example of a hypothesis class with the property that not all ERMs for the class are equally successful. Furthermore, if we allow an infinite number of labels, we will also obtain an example of a class that is learnable by some ERM, but other ERMs will fail to learn it. Clearly, this also implies that the class is learnable but it does not have the uniform convergence property. For simplicity, we consider only the realizable case.

The class we consider is defined as follows. The instance space X will be any finite or countable set. Let $P_{f}(\mathcal X)$ be the collection of all finite and cofinite subsets of X (that is, for each $A \in P_{f}(\mathcal X)$ , either A or $\mathcal{X} \backslash A$ must be finite). Instead of $[k]$ , the label set is $\mathcal{V} = P_{f}(\mathcal{X}) \cup \{*\}$ , where ∗ is some special label. For every $A \in P_{f}(\mathcal X)$ define $h_{A} : \mathcal{X} \mathcal{Y}$ by

$$
h_{A}(x) = \left\{\begin{array}{ll} A & x \in A \\ * & x \notin A \end{array} \right.
$$

Finally, the hypothesis class we take is

$$
\mathcal{H} = \{h_{A}: A \in P_{f}(\mathcal{X})\}.
$$

Let A be some ERM algorithm for H. Assume that A operates on a sample labeled by $h_{A} \in{\mathcal{H}}$ . Since $h_{A}$ is the only hypothesis in H that might return the label A, if A observes the label $A,$ , it “knows” that the learned hypothesis is $h_{A}$ , and, as an ERM, must return it (note that in this case the error of the returned hypothesis is 0). Therefore, to specify an ERM, we should only specify the hypothesis it returns upon receiving a sample of the form

$$
S = \{(x_{1}, *), \dots,(x_{m}, *)\}.
$$

We consider two ERMs: The first, $\mathcal{A}_{good}.$ , is defined by

$$
\mathcal{A}_{good}(S) = h_{\emptyset};
$$

that is, it outputs the hypothesis which predicts $\mathbf{\nabla} \cdot \ast \mathbf{\nabla} \cdot$ for every $x \in \mathcal{X}$ . The second $\mathrm{ERM}, A_{bad}.$ is defined by

$$
\mathcal{A}_{bad}(S) = h_{\{x_{1}, \ldots x_{m}\}^{c}}.
$$

The following claim shows that the sample complexity of $\mathcal{A}_{bad}$ is about |X |-times larger than the sample complexity of $\mathcal{A}_{good}$ . This establishes a gap between different ERMs. If X is infinite, we even obtain a learnable class that is not learnable by every ERM.

## claim <sub>29.9</sub>

1. Let $\epsilon, \delta > 0,{\mathcal{D}}$ a distribution over X and $h_{A} \in{\mathcal{H}}$ . Let S be an i.i.d. sample consisting of $m \geq \frac{1}{\epsilon} \log \left(\frac{1}{\delta} \right)$ examples, sampled according to D and labeled by $h_{A}$ . Then, with probability of at least $1 - \delta$ , the hypothesis returned by $\mathcal{A}_{good}$ will have an error of at most $\epsilon$.

2. There exists a constant $a > 0$ such that for every $0 < \epsilon < a$ there exists a distribution D over X and $h_{A} \in{\mathcal{H}}$ such that the following holds. The hypothesis returned by $\mathcal{A}_{bad}$ upon receiving a sample of size $\begin{array}{r}{\dot{m} \le \frac{| X | - 1}{6 \epsilon}} \end{array}$ , sampled according to D and labeled by $h_{A}$ , will have error $\geq \epsilon$ with $probability \ge e^{- \frac{1}{6}}$

Proof Let D be a distribution over X and suppose that the correct labeling is $h_{A}$ . For any sample, $\mathcal{A}_{good}$ returns either $h_{\emptyset}$ or $h_{A}$ . If it returns $h_{A}$ then its true error is zero. Thus, it returns a hypothesis with error $\geq \epsilon$ only if all the m examples in the sample are from $\mathcal{X} \setminus A$ while the error of $h_{\varnothing}, L_{\mathcal{D}}(h_{\varnothing}) = \mathbb{P}_{\mathcal{D}}[A]$ is $\geq \epsilon.$ . Assume m $\geq \frac{1}{\epsilon} \log(\frac{1}{\delta})$ ; then the probability of the latter event is no more than $(1 - \epsilon)^{m} \leq e^{- \epsilon m} \leq \delta$ . This establishes item 1.

Next we prove item 2. We restrict the proof to the case that $| \mathcal{X} | = d < \infty$ The proof for infinite X is similar. Suppose that $\mathcal{X} = \{x_{0}, \dots, x_{d - 1}\}$

Let $a > 0$ be small enough such that $1 - 2 \epsilon \geq e^{- 4 \epsilon}$ for every $\epsilon < a$ and fix some $\epsilon < a$ . Define a distribution on X by setting $\mathbb{P}[x_{0}] = 1 - 2 \epsilon$ and for all $\begin{array}{r}{1 \leq i \leq d - 1, \mathbb{P}[x_{i}] = \frac{2 \epsilon}{d - 1}} \end{array}$ . Suppose that the correct hypothesis is $h_{\emptyset}$ and let the sample size be m. Clearly, the hypothesis returned by $\mathcal{A}_{bad}$ will err on all the examples from X which are not in the sample. By Chernof’s bound, if m $\leq \frac{d - 1}{6 \epsilon}$ then with probability $\geq e^{- \frac{1}{6}}$ , the sample will include no more than $\scriptstyle{\frac{d - 1}{2}}$ examples from X . Thus the returned hypothesis will have error $\geq \epsilon$ □

The conclusion of the example presented is that in multiclass classification, the sample complexity of different ERMs may difer. Are there “good” ERMs for every hypothesis class? The following conjecture asserts that the answer is yes.

<sup>conjecture</sup> 29.10 The realizable sample complexity of every hypothesis class $\mathcal{H} \subset[k]^{\mathcal{X}}$ is

$$
m_{\mathcal{H}}(\epsilon, \delta) = \tilde{O} \left(\frac{\mathrm{Ndim}(\mathcal{H})}{\epsilon}\right).
$$

We emphasize that the $\tilde{O}$ notation may hide only poly-log factors of $\epsilon, \delta$ , and Ndim $({\mathcal{H}})$ , but no factor $ofk$

## 29.5 Bibliographic Remarks

The Natarajan dimension is due to Natarajan (1989). That paper also established the Natarajan lemma and the generalization of the fundamental theorem. Generalizations and sharper versions of the Natarajan lemma are studied in Haussler & Long (1995). Ben-David, Cesa-Bianchi, Haussler & Long (1995) defined a large family of notions of dimensions, all of which generalize the VC dimension and may be used to estimate the sample complexity of multiclass classification.

The calculation of the Natarajan dimension, presented here, together with calculation of other classes, can be found in Daniely et al. (2012). The example of good and bad ERMs, as well as conjecture 29.10, are from Daniely et al. (2011).


<!-- MinerU source pages 401-439 -->

## 29.6 Exercises

1. Let d, $, k > 0$ . Show that there exists a binary hypothesis $\mathcal{H}_{\mathrm{bin}}$ of VC dimension d such that Ndim $(\mathcal{H}_{\mathrm{bin}}^{\mathrm{OvA, k}}) = d$

2. Prove Lemma 29.6.

3. Prove Natarajan’s lemma.

Hint: Fix some $x_{0} \in \mathcal{X}$ . For $i, j \in[k]$ , denote by $\mathcal{H}_{ij}$ all the functions $f$ : $\mathcal{X} \setminus \{x_{0}\}[k]$ that can be extended to a function in H both by defining $f(x_{0}) = i$ and by defining $f(x_{0}) = j$ . Show that $\begin{array}{r}{| \mathcal{H} | \leq | \mathcal{H}_{\mathcal{X} \backslash \{x_{0}\}} | + \sum_{i \neq j} | \mathcal{H}_{ij} |} \end{array}$ and use induction.

4. Adapt the proof of the binary fundamental theorem and Natarajan’s lemma to prove that, for some universal constant $C > 0$ and for every hypothesis class of Natarajan dimension $d,$ the agnostic sample complexity of $\mathcal{H}$ is

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq C \frac{d \log \left(\frac{kd}{\epsilon}\right) + \log(1 / \delta)}{\epsilon^{2}}.
$$

5. Prove that, for some universal constant $C > 0$ and for every hypothesis class of Natarajan dimension $d,$ the agnostic sample complexity of H is

$$
m_{\mathcal{H}}(\epsilon, \delta) \geq C \frac{d + \log(1 / \delta)}{\epsilon^{2}}.
$$

Hint: Deduce it from the binary fundamental theorem.

6. Let H be the binary hypothesis class of (nonhomogenous) halfspaces in $\mathbb{R}^{d}$ The goal of this exercise is to prove that Ndim $\begin{array}{r}{.(\mathcal{H}^{\mathrm{OvA, k}}) \ge(d - 1) \cdot(k - 1)} \end{array}$

1. Let $\mathcal{H}_{\mathrm{discrete}}$ be the class of all functions $f :[k - 1] \times[d - 1] \to \{0, 1\}$ for which there exists some $i_{0}$ such that, for every $j \in[d - 1]$

$$
\forall i < i_{0}, f(i, j) = 1 \text{while} \forall i > i_{0}, f(i, j) = 0.
$$

Show that Ndim $(\mathcal{H}_{\mathrm{discrete}}^{\mathrm{OvA, k}}) =(d - 1) \cdot(k - 1)$

2. Show that H<sub>discrete</sub> can be realized by H. That is, show that there exists a mapping $\psi :[k - 1] \times[d - 1] \to \mathbb{R}^{d}$ such that

$$
\mathcal{H}_{\text{discrete}} \subset \left\{h \circ \psi : h \in \mathcal{H} \right\}.
$$

Hint: You can take $\psi(i, j)$ to be the vector whose jth coordinate is 1, whose last coordinate is i and the rest are zeros.

3. Conclude that Ndim $\begin{array}{r}{(\mathcal{H}^{\mathrm{OvA, k}}) \ge(d - 1) \cdot(k - 1)} \end{array}$

Throughout the book, we have tried to characterize the notion of learnability using different approaches. At first we have shown that the uniform convergence property of a hypothesis class guarantees successful learning. Later on we introduced the notion of stability and have shown that stable algorithms are guaranteed to be good learners. Yet there are other properties which may be sufficient for learning, and in this chapter and its sequel we will introduce two approaches to this issue: compression bounds and the PAC-Bayes approach.

In this chapter we study compression bounds. Roughly speaking, we shall see that if a learning algorithm can express the output hypothesis using a small subset of the training set, then the error of the hypothesis on the rest of the examples estimates its true error. In other words, an algorithm that can “compress” its output is a good learner.


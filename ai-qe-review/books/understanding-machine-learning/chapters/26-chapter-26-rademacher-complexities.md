---
title: "Chapter 26 \u2014 Rademacher Complexities"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 26
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 9776
source_line_end: 10227
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
  source_control_characters: 4
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 26 — Rademacher Complexities

> [[../README|本书目录]] · [[25-chapter-25-feature-selection-and-generation|上一章]] · [[27-chapter-27-covering-numbers|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 9776–10227。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 4；different × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 26.1 The Rademacher Complexity

Recall the definition of an $\epsilon$-representative sample from Chapter 4, repeated here for convenience.

<sup>definition</sup> 26.1 ($\epsilon$-Representative Sample) A training set $S$ is called $\epsilon$-representative (w.r.t. domain $Z,$ hypothesis class $\mathcal{H}.$ loss function $\ell,$ and distribution D) if

$$
\sup_{h \in \mathcal{H}} | L_{\mathcal{D}}(h) - L_{S}(h) | \leq \epsilon.
$$

We have shown that if S is an $\epsilon / 2$ representative sample then the ERM rule is $\epsilon$-consistent, namely, $\begin{array}{r}{L_{\mathcal{D}}(\mathrm{ERM}_{\mathcal{H}}(S)) \le \operatorname{min}_{h \in \mathcal{H}} L_{\mathcal{D}}(h) + \epsilon} \end{array}$

To simplify our notation, let us denote

$$
\mathcal{F} \stackrel{{\text{def}}}{{=}} \ell \circ \mathcal{H} \stackrel{{\text{def}}}{{=}} \{z \mapsto \ell(h, z): h \in \mathcal{H}\},
$$

and given $f \in{\mathcal{F}}$ , we define

$$
L_{\mathcal{D}}(f) = \underset{z \sim \mathcal{D}}{\mathbb{E}}[f(z)] \quad, \quad L_{S}(f) = \frac{1}{m} \sum_{i = 1}^{m} f(z_{i}).
$$

We define the representativeness of $S$ with respect to $\mathcal{F}$ as the largest gap between the true error of a function $f$ and its empirical error, namely,

$$
\operatorname{Rep}_{\mathcal{D}}(\mathcal{F}, S) \stackrel{{\text{def}}}{{=}} \sup_{f \in \mathcal{F}} \bigl(L_{\mathcal{D}}(f) - L_{S}(f) \bigr).\tag{26.1}
$$

Now, suppose we would like to estimate the representativeness of $S$ using the sample S only. One simple idea is to split S into two disjoint sets, $S = S_{1} \cup S_{2};$ refer to $S_{1}$ as a validation set and to $S_{2}$ as a training set. We can then estimate the representativeness of S by

$$
\sup_{f \in \mathcal{F}} \left(L_{S_{1}}(f) - L_{S_{2}}(f)\right).\tag{26.2}
$$

This can be written more compactly by defining ${\pmb{\sigma}} =(\sigma_{1}, \ldots, \sigma_{m}) \in \{\pm 1\}^{m}$ to be a vector such that $S_{1} = \{z_{i} : \sigma_{i} = 1\}$ and $S_{2} = \{z_{i} : \sigma_{i} = - 1\}$ . Then, if we further assume that $| S_{1} | = | S_{2} |$ then Equation (26.2) can be rewritten as

$$
\frac{2}{m} \sup_{f \in \mathcal{F}} \sum_{i = 1}^{m} \sigma_{i} f(z_{i}).\tag{26.3}
$$

The Rademacher complexity measure captures this idea by considering the expectation of the above with respect to a random choice of $\pmb{\sigma}$ . Formally, let ${\mathcal{F}} \circ S$ be the set of all possible evaluations a function $f \in{\mathcal{F}}$ can achieve on a sample $S_{;}$ , namely,

$$
\mathcal{F} \circ S = \{(f(z_{1}), \dots, f(z_{m})): f \in \mathcal{F}\}.
$$

Let the variables in $\pmb{\sigma}$ be distributed i.i.d. according to $\mathbb{P}[\sigma_{i} = 1] = \mathbb{P}[\sigma_{i} = - 1] =$ $\begin{array}{l}{{\frac{1}{2}}} \end{array}$ . Then, the Rademacher complexity of $\mathcal{F}$ with respect to $S$ is defined as follows:

$$
R(\mathcal{F} \circ S) \stackrel{{\text{def}}}{{=}} \frac{1}{m} \underset{\boldsymbol{igma} \sim \{\pm 1\}^{m}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \sum_{i = 1}^{m} \sigma_{i} f(z_{i}) \right].\tag{26.4}
$$

More generally, given a set of vectors, $A \subset \mathbb{R}^{m}$ , we define

$$
R(A) \stackrel{{\mathrm{def}}}{{=}} \frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in A} \sum_{i = 1}^{m} \sigma_{i} a_{i} \right].\tag{26.5}
$$

The following lemma bounds the expected value of the representativeness of S by twice the expected Rademacher complexity.

## lemma <sub>26.2</sub>

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\operatorname{Rep}_{\mathcal{D}}(\mathcal{F}, S) \right] \leq 2 \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} R(\mathcal{F} \circ S).
$$

Proof Let $S^{\prime} = \{z_{1}^{\prime}, \ldots, z_{m}^{\prime}\}$ be another i.i.d. sample. Clearly, for all $f \in{\mathcal{F}}$ $L_{\mathcal{D}}(f) = \mathbb{E}_{S^{\prime}}[L_{S^{\prime}}(f)]$ . Therefore, for every $f \in{\mathcal{F}}$ we have

$$
L_{\mathcal{D}}(f) - L_{S}(f) = \underset{S^{\prime}}{\mathbb{E}}[L_{S^{\prime}}(f)] - L_{S}(f) = \underset{S^{\prime}}{\mathbb{E}}[L_{S^{\prime}}(f) - L_{S}(f)].
$$

Taking supremum over $f \in{\mathcal{F}}$ of both sides, and using the fact that the supremum of expectation is smaller than expectation of the supremum we obtain

$$
\begin{array}{ll} \sup_{f \in \mathcal{F}} \big(L_{\mathcal{D}}(f) - L_{S}(f) \big) = & \sup_{f \in \mathcal{F}} \underset{S^{\prime}}{\mathbb{E}}[L_{S^{\prime}}(f) - L_{S}(f)] \\ \leq & \underset{S^{\prime}}{\mathbb{E}} \Bigg[\sup_{f \in \mathcal{F}} \big(L_{S^{\prime}}(f) - L_{S}(f) \big) \Bigg].\end{array}
$$

Taking expectation over $S$ on both sides we obtain

$$
\begin{array}{rl} \underset{S}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \left(L_{\mathcal{D}}(f) - L_{S}(f)\right) \right] \leq & \underset{S, S^{\prime}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \left(L_{S^{\prime}}(f) - L_{S}(f)\right) \right] \\ = & \frac{1}{m} \underset{S, S^{\prime}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \sum_{i = 1}^{m}(f(z_{i}^{\prime}) - f(z_{i})) \right].\end{array}\tag{26.6}
$$

Next, we note that for each $j, z_{j}$ and $z_{j}^{\prime}$ are i.i.d. variables. Therefore, we can replace them without afecting the expectation:

$$
\begin{array}{l} \mathbb{E}_{S, S^{\prime}} \left[\sup_{f \in \mathcal{F}} \left((f(z_{j}^{\prime}) - f(z_{j})) + \sum_{i \neq j}(f(z_{i}^{\prime}) - f(z_{i}))\right) \right] = \\ \mathbb{E}_{S, S^{\prime}} \left[\sup_{f \in \mathcal{F}} \left((f(z_{j}) - f(z_{j}^{\prime})) + \sum_{i \neq j}(f(z_{i}^{\prime}) - f(z_{i}))\right) \right].\end{array}\tag{26.7}
$$

Let $\sigma_{j}$ be a random variable such that $\mathbb{P}[\sigma_{j} = 1] = \mathbb{P}[\sigma_{j} = - 1] = 1 / 2$ . From Equation (26.7) we obtain that

$$
\begin{array}{l} \mathbb{E}_{S, S^{\prime}, \sigma_{j}} \left[\sup_{f \in \mathcal{F}} \left(\sigma_{j}(f(z_{j}^{\prime}) - f(z_{j})) + \sum_{i \neq j}(f(z_{i}^{\prime}) - f(z_{i}))\right) \right] \\ = \frac{1}{2}(\text{l.h.s.of Equation (26.7))} + \frac{1}{2}(\text{r.h.s.of Equation (26.7))} \\ = \mathbb{E}_{S, S^{\prime}} \left[\sup_{f \in \mathcal{F}} \left((f(z_{j}^{\prime}) - f(z_{j})) + \sum_{i \neq j}(f(z_{i}^{\prime}) - f(z_{i}))\right) \right].\end{array}\tag{26.8}
$$

Repeating this for all j we obtain that

$$
\underset{S, S^{\prime}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \sum_{i = 1}^{m}(f(z_{i}^{\prime}) - f(z_{i})) \right] = \underset{S, S^{\prime}, \boldsymbol{igma}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \sum_{i = 1}^{m} \sigma_{i}(f(z_{i}^{\prime}) - f(z_{i})) \right].\tag{26.9}
$$

Finally,

$$
\sup_{f \in \mathcal{F}} \sum_{i} \sigma_{i}(f(z_{i}^{\prime}) - f(z_{i})) \leq \sup_{f \in \mathcal{F}} \sum_{i} \sigma_{i} f(z_{i}^{\prime}) + \sup_{f \in \mathcal{F}} \sum_{i} - \sigma_{i} f(z_{i})
$$

and since the probability of σ is the same as the probability o $\therefore - \sigma$ , the right-hand side of Equation (26.9) can be bounded by

$$
\begin{array}{rl} &{\underset{S, S^{\prime}, \pmb{\sigma}}{\mathbb{E}} \left[\sup_{f \in \mathcal{F}} \sum_{i} \sigma_{i} f(z_{i}^{\prime}) + \sup_{f \in \mathcal{F}} \sum_{i} \sigma_{i} f(z_{i}) \right]} \\ &{\quad = m \underset{S^{\prime}}{\mathbb{E}}[R(\mathcal{F} \circ S^{\prime})] + m \underset{S}{\mathbb{E}}[R(\mathcal{F} \circ S)] = 2m \underset{S}{\mathbb{E}}[R(\mathcal{F} \circ S)].} \end{array}
$$

The lemma immediately yields that, in expectation, the ERM rule finds a hypothesis which is close to the optimal hypothesis in H.

<sup>theorem</sup> 26.3 We have

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}}(\mathrm{ERM}_{\mathcal{H}}(S)) - L_{S}(\mathrm{ERM}_{\mathcal{H}}(S)) \right] \leq 2 \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} R(\ell \circ \mathcal{H} \circ S).
$$

Furthermore, for any $h^{\star} \in{\mathcal{H}}$

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}}(\mathrm{ERM}_{\mathcal{H}}(S)) - L_{\mathcal{D}}(h^{\star}) \right] \leq 2 \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} R(\ell \circ \mathcal{H} \circ S).
$$

Furthermore, $\begin{array}{r}{\begin{array}{r}{ifh^{\star} = \operatorname{argmin}_{h} L_{\mathcal{D}}(h)} \end{array}} \end{array}$ then for each $\delta \in(0, 1)$ with probability of at least $1 - \delta$ over the choice of S we have

$$
L_{\mathcal{D}} \left(\operatorname{ERM}_{\mathcal{H}}(S)\right) - L_{\mathcal{D}} \left(h^{\star}\right) \leq \frac{2 \mathbb{E}_{S^{\prime} \sim \mathcal{D}^{m}} R \left(\ell \circ \mathcal{H} \circ S^{\prime}\right)}{\delta}.
$$

Proof The first inequality follows directly from Lemma 26.2. The second inequality follows because for any fixed $h^{\star}$

$$
L_{\mathcal{D}}(h^{\star}) = \underset{S}{\mathbb{E}}[L_{S}(h^{\star})] \geq \underset{S}{\mathbb{E}}[L_{S}(\mathrm{ERM}_{\mathcal{H}}(S))].
$$

The third inequality follows from the previous inequality by relying on Markov’s inequality (note that the random variable $L_{\mathcal{D}}(\mathrm{ERM}_{\mathcal{H}}(S)) - L_{\mathcal{D}}(h^{\star})$ is nonnegative). □

Next, we derive bounds similar to the bounds in Theorem 26.3 with a better dependence on the confidence parameter δ. To do so, we first introduce the following bounded diferences concentration inequality.

<sup>lemma</sup> 26.4 (McDiarmid’s Inequality) Let V be some set and let $f : V^{m} \to$ R be a function of m variables such that for some $c > 0_{;}$ , for all $i \in[m]$ and for all $x_{1}, \ldots, x_{m}, x_{i}^{\prime} \in V$ we have

$$
\left| f \left(x_{1}, \dots, x_{m}\right) - f \left(x_{1}, \dots, x_{i - 1}, x_{i}^{\prime}, x_{i + 1}, \dots, x_{m}\right) \right| \leq c.
$$

Let $X_{1}, \ldots, X_{m}$ be m independent random variables taking values in V . Then, with probability of at least $1 - \delta$ we have

$$
\left| f \left(X_{1}, \dots, X_{m}\right) - \mathbb{E} \left[f \left(X_{1}, \dots, X_{m}\right) \right] \right| \leq c \sqrt{\ln \left(\frac{2}{\delta}\right) m / 2}.
$$

On the basis of the McDiarmid inequality we can derive generalization bounds with a better dependence on the confidence parameter.

<sup>theorem</sup> 26.5 Assume that for all z and $h \in \mathcal H$ we have that $| \ell(h, z) | \leq c$ Then,

1. With probability of at least $1 - \delta,$ , for all $h \in \mathcal H$

$$
L_{\mathcal{D}}(h) - L_{S}(h) \leq 2 \underset{S^{\prime} \sim D^{m}}{\mathbb{E}} R(\ell \circ \mathcal{H} \circ S^{\prime}) + c \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

In particular, this holds for $h = \mathrm{ERM}_{\mathcal{H}}(S)$

2. With probability of at least 1 − δ, for all $h \in \mathcal H$

$$
L_{\mathcal{D}}(h) - L_{S}(h) \leq 2R(\ell \circ \mathcal{H} \circ S) + 4c \sqrt{\frac{2 \ln(4 / \delta)}{m}}.
$$

In particular, this holds for $h = \mathrm{ERM}_{\mathcal{H}}(S)$

3. For any h<sup>?</sup>, with probability of at least $1 - \delta$

$$
L_{\mathcal{D}}(\mathrm{ERM}_{\mathcal{H}}(S)) - L_{\mathcal{D}}(h^{\star}) \leq 2R(\ell \circ \mathcal{H} \circ S) + 5c \sqrt{\frac{2 \ln(8 / \delta)}{m}}.
$$

Proof First note that the random variable $\begin{array}{r}{\mathrm{Rep}_{\mathcal D}(\mathcal F, S) = \operatorname{sup}_{h \in \mathcal H} \left(L_{\mathcal D}(h) - L_{S}(h) \right)} \end{array}$ satisfies the bounded diferences condition of Lemma 26.4 with a constant $2c / m$ Combining the bounds in Lemma 26.4 with Lemma 26.2 we obtain that with probability of at least $1 - \delta$ 1

$$
\mathrm{Rep}_{\mathcal{D}}(\mathcal{F}, S) \leq \mathbb{E} \mathrm{Rep}_{\mathcal{D}}(\mathcal{F}, S) + c \sqrt{\frac{2 \ln(2 / \delta)}{m}} \leq 2 \underset{S^{\prime}}{\mathbb{E}} R(\ell \circ \mathcal{H} \circ S^{\prime}) + c \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

The first inequality of the theorem follows from the definition of $\mathrm{Rep}_{\mathscr D}(\mathscr F, S)$ For the second inequality we note that the random variable $R(\ell \circ \mathcal H \circ S)$ also satisfies the bounded diferences condition of Lemma 26.4 with a constant $2c / m$ Therefore, the second inequality follows from the first inequality, Lemma 26.4, and the union bound. Finally, for the last inequality, denote $h_{S} = \mathrm{ERM}_{\mathcal{H}}(S)$ and note that

$$
\begin{array}{rl} & L_{\mathcal{D}}(h_{S}) - L_{\mathcal{D}}(h^{\star}) \\ & \quad = L_{\mathcal{D}}(h_{S}) - L_{S}(h_{S}) + L_{S}(h_{S}) - L_{S}(h^{\star}) + L_{S}(h^{\star}) - L_{\mathcal{D}}(h^{\star}) \\ & \quad \leq(L_{\mathcal{D}}(h_{S}) - L_{S}(h_{S})) +(L_{S}(h^{\star}) - L_{\mathcal{D}}(h^{\star})).\end{array}\tag{26.10}
$$

The first summand on the right-hand side is bounded by the second inequality of the theorem. For the second summand, we use the fact that $h^{\star}$ does not depend on $S;$ hence by using Hoefding’s inequality we obtain that with probaility of at least $1 - \delta / 2$ ,

$$
L_{S}(h^{\star}) - L_{\mathcal{D}}(h^{\star}) \leq c \sqrt{\frac{\ln(4 / \delta)}{2m}}.\tag{26.11}
$$

Combining this with the union bound we conclude our proof.

□

The preceding theorem tells us that if the quantity $R(\ell \circ{\mathcal{H}} \circ S)$ is small then it is possible to learn the class $\mathcal{H}$ using the ERM rule. It is important to emphasize that the last two bounds given in the theorem depend on the specific training set S. That is, we use S both for learning a hypothesis from H as well as for estimating the quality of it. This type of bound is called a data-dependent bound.

## 26.1.1 Rademacher Calculus

Let us now discuss some properties of the Rademacher complexity measure. These properties will help us in deriving some simple bounds on $R(\ell \circ{\mathcal{H}} \circ S)$ for specific cases of interest.

The following lemma is immediate from the definition.

<sup>lemma</sup> 26.6 For any $A \subset \mathbb{R}^{m}$ , scalar $c \in \mathbb{R}$ , and vector $\mathbf{a}_{0} \in \mathbb{R}^{m}$ , we have

$$
R(\{c \mathbf{a} + \mathbf{a}_{0}: \mathbf{a} \in A\}) \leq | c | R(A).
$$

The following lemma tells us that the convex hull of A has the same complexity as A.

<sup>lemma</sup> 26.7 Let A be a subset of $\mathbb{R}^{m}$ and let $\begin{array}{r}{A^{\prime} = \{\sum_{j = 1}^{N} \alpha_{j} \mathbf{a}^{(j)} : N \in \{\sum_{j = 1}^{N} \alpha_{j} \mathbf{a}^{(j)} : N \in \{\sum_{j = 1}^{N} \alpha_{j} \mathbf{a}^{(j)} : N\} \} \end{array}$ $\mathbb{N}, \forall j, \mathbf{a}^{(j)} \in A, \alpha_{j} \geq 0, \| \pmb{\alpha} \|_{1} = 1\}$ . Then, $R(A^{\prime}) = R(A)$

Proof The main idea follows from the fact that for any vector v we have

$$
\sup_{\boldsymbol{\alpha} \geq \mathbf{0}: \| \boldsymbol{\alpha} \|_{1} = 1} \sum_{j = 1}^{N} \alpha_{j} v_{j} = \max_{j} v_{j}.
$$

Therefore,

$$
\begin{array}{l} mR(A^{\prime}) = \mathbb{E}_{\boldsymbol{igma}} \sup_{\boldsymbol{\alpha} \geq \boldsymbol{0}: \| \boldsymbol{\alpha} \|_{1} = 1} \sup_{\mathbf{a}^{(1)}, \ldots, \mathbf{a}^{(N)}} \sum_{i = 1}^{m} \sigma_{i} \sum_{j = 1}^{N} \alpha_{j} a_{i}^{(j)} \\ = \mathbb{E}_{\boldsymbol{igma}} \sup_{\boldsymbol{\alpha} \geq \boldsymbol{0}: \| \boldsymbol{\alpha} \|_{1} = 1} \sum_{j = 1}^{N} \alpha_{j} \sup_{\mathbf{a}^{(j)}} \sum_{i = 1}^{m} \sigma_{i} a_{i}^{(j)} \\ = \mathbb{E}_{\boldsymbol{igma}} \sup_{\mathbf{a} \in A} \sum_{i = 1}^{m} \sigma_{i} a_{i} \\ = mR(A), \end{array}
$$

and we conclude our proof.

The next lemma, due to Massart, states that the Rademacher complexity of a finite set grows logarithmically with the size of the set.

<sup>lemma</sup> 26.8 (Massart lemma) Let $A = \{\mathbf{a}_{1}, \dots, \mathbf{a}_{N}\}$ be a finite set of vectors in $\mathbb{R}^{m}$ . Define $\begin{array}{r}{\bar{\mathbf{a}} = \frac{1}{N} \sum_{i = 1}^{N} \mathbf{a}_{i}} \end{array}$ . Then,

$$
R(A) \leq \max_{\mathbf{a} \in A} \| \mathbf{a} - \bar{\mathbf{a}} \| \frac{\sqrt{2 \log(N)}}{m}.
$$

Proof Based on Lemma 26.6, we can assume without loss of generality that $\bar{\mathbf{a}} = \mathbf{0}$ . Let $\lambda > 0$ and let $A^{\prime} = \{\lambda{\bf a}_{1}, \ldots, \lambda{\bf a}_{N}\}$ . We upper bound the Rademacher complexity as follows:

$$
\begin{array}{l} mR(A^{\prime}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\max_{\mathbf{a} \in A^{\prime}} \langle \boldsymbol{igma}, \mathbf{a} \rangle \right] = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\log \left(\max_{\mathbf{a} \in A^{\prime}} e^{\langle \boldsymbol{igma}, \mathbf{a} \rangle}\right) \right] \\ \leq \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\log \left(\sum_{\mathbf{a} \in A^{\prime}} e^{\langle \boldsymbol{igma}, \mathbf{a} \rangle}\right) \right] \\ \leq \log \left(\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sum_{\mathbf{a} \in A^{\prime}} e^{\langle \boldsymbol{igma}, \mathbf{a} \rangle} \right]\right) / / \text{Jensen's inequality} \\ = \log \left(\sum_{\mathbf{a} \in A^{\prime}} \prod_{i = 1}^{m} \underset{\sigma_{i}}{\mathbb{E}}[e^{\sigma_{i} a_{i}}]\right), \end{array}
$$

where the last equality occurs because the Rademacher variables are indepen dent. Next, using Lemma A.6 we have that for all $a_{i} \in \mathbb{R}$ ,

$$
\underset{\sigma_{i}}{\mathbb{E}} e^{\sigma_{i} a_{i}} = \frac{\exp(a_{i}) + \exp(- a_{i})}{2} \leq \exp(a_{i}^{2} / 2),
$$

and therefore

$$
\begin{array}{l} mR(A^{\prime}) \leq \log \left(\sum_{\mathbf{a} \in A^{\prime}} \prod_{i = 1}^{m} \exp \left(\frac{a_{i}^{2}}{2}\right)\right) = \log \left(\sum_{\mathbf{a} \in A^{\prime}} \exp \left(\| \mathbf{a} \|^{2} / 2\right)\right) \\ \leq \log \left(| A^{\prime} | \max_{\mathbf{a} \in A^{\prime}} \exp \left(\| \mathbf{a} \|^{2} / 2\right)\right) = \log(| A^{\prime} |) + \max_{\mathbf{a} \in A^{\prime}}(\| \mathbf{a} \|^{2} / 2).\end{array}
$$

Since $\begin{array}{r}{R(A) = \frac{1}{\lambda} R(A^{\prime})} \end{array}$ we obtain from the equation that

$$
R(A) \leq \frac{\log(| A |) + \lambda^{2} \max_{\mathbf{a} \in A}(\| \mathbf{a} \|^{2} / 2)}{\lambda m}.
$$

Setting $\begin{array}{r}{\lambda = \sqrt{2 \log(\lvert A \rvert) / \operatorname{max}_{\mathbf{a} \in A} \| \mathbf{a} \|^{2}}} \end{array}$ and rearranging terms we conclude our proof. □

The following lemma shows that composing A with a Lipschitz function does not blow $\mathrm{up}$ the Rademacher complexity. The proof is due to Kakade and Tewari.

<sup>lemma</sup> 26.9 (Contraction lemma) For each $i \in[m]$ , let $\phi_{i} : \mathbb{R} \mathbb{R}$ be $a \rho \cdot$ Lipschitz function, namely for all $\alpha, \beta \in \mathbb{R}$ we have $| \phi_{i}(\alpha) - \phi_{i}(\beta) | \le \rho | \alpha - \beta |$ For $\mathbf{a} \in \mathbb{R}^{m}$ let $\phi(\mathbf{a})$ denote the vector $(\phi_{1}(a_{1}), \dots, \phi_{m}(y_{m}))$ . Let φ◦ $A = \{\phi(\mathbf{a})$ $a \in A\}$ . Then,

$$
R(\phi \circ A) \leq \rho R(A).
$$

Proof For simplicity, we prove the lemma for the case $\rho = 1$ . The case $\rho \neq$ 1 will follow by defining $\begin{array}{rl}{\phi^{\prime} \ = \} &{{} \frac{1}{\rho} \phi} \end{array}$ and then using Lemma 26.6. Let $A_{i} \ =$ $\{(a_{1}, \dots, a_{i - 1}, \phi_{i}(a_{i}), a_{i + 1}, \dots, a_{m}) : \mathbf{a} \in A\}$ . Clearly, it sufices to prove that for any set A and all i we have $R(A_{i}) \leq R(A)$ . Without loss of generality we will prove the latter claim for $i = 1$ and to simplify notation we omit the subscript from $\phi_{1}$ . We have

$$
\begin{array}{l} mR(A_{1}) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in A_{1}} \sum_{i = 1}^{m} \sigma_{i} a_{i} \right] \\ = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in A} \sigma_{1} \phi(a_{1}) + \sum_{i = 2}^{m} \sigma_{i} a_{i} \right] \\ = \frac{1}{2} \underset{\sigma_{2}, \dots, \sigma_{m}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in A} \left(\phi(a_{1}) + \sum_{i = 2}^{m} \sigma_{i} a_{i}\right) + \sup_{\mathbf{a} \in A} \left(- \phi(a_{1}) + \sum_{i = 2}^{m} \sigma_{i} a_{i}\right) \right] \\ = \frac{1}{2} \underset{\sigma_{2}, \dots, \sigma_{m}}{\mathbb{E}} \left[\sup_{\mathbf{a}, \mathbf{a}^{\prime} \in A} \left(\phi(a_{1}) - \phi(a_{1}^{\prime}) + \sum_{i = 2}^{m} \sigma_{i} a_{i} + \sum_{i = 2}^{m} \sigma_{i} a_{i}^{\prime}\right) \right] \\ \leq \frac{1}{2} \underset{\sigma_{2}, \dots, \sigma_{m}}{\mathbb{E}} \left[\sup_{\mathbf{a}, \mathbf{a}^{\prime} \in A} \left(| a_{1} - a_{1}^{\prime} | + \sum_{i = 2}^{m} \sigma_{i} a_{i} + \sum_{i = 2}^{m} \sigma_{i} a_{i}^{\prime}\right) \right], \end{array} \tag{26.15}
$$

where in the last inequality we used the assumption that $\phi$ is Lipschitz. Next, we note that the absolute value on $| a_{1} - a_{1}^{\prime} |$ in the preceding expression can be omitted since both a and $\mathbf{a}^{\prime}$ are from the same set $A$ and the rest of the expression in the supremum is not afected by replacing a and $\mathbf{a}^{\prime}.$ . Therefore,

$$
mR(A_{1}) \leq \frac{1}{2} \underset{\sigma_{2}, \dots, \sigma_{m}}{\mathbb{E}} \left[\sup_{\mathbf{a}, \mathbf{a}^{\prime} \in A} \left(a_{1} - a_{1}^{\prime} + \sum_{i = 2}^{m} \sigma_{i} a_{i} + \sum_{i = 2}^{m} \sigma_{i} a_{i}^{\prime}\right) \right].\tag{26.13}
$$

But, using the same equalities as in Equation (26.12), it is easy to see that the right-hand side of Equation (26.13) exactly equals m $R(A)$ , which concludes our proof. □

## 26.2 Rademacher Complexity of Linear Classes

In this section we analyze the Rademacher complexity of linear classes. To sim-$\mathrm{plify}$ the derivation we first define the following two classes:

$$
\mathcal{H}_{1} = \left\{\mathbf{x} \mapsto \langle \mathbf{w}, \mathbf{x} \rangle : \| \mathbf{w} \|_{1} \leq 1 \right\}, \quad \mathcal{H}_{2} = \left\{\mathbf{x} \mapsto \langle \mathbf{w}, \mathbf{x} \rangle : \| \mathbf{w} \|_{2} \leq 1 \right\}.\tag{26.14}
$$

The following lemma bounds the Rademacher complexity of $\mathcal{H}_{2}$ . We allow the $\mathbf{x}_{i}$ to be vectors in any Hilbert space (even infinite dimensional), and the bound does not depend on the dimensionality of the Hilbert space. This property becomes useful when analyzing kernel methods.

<sup>lemma</sup> 26.10 Let $S =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m})$ be vectors in a Hilbert space. Define: $\mathcal{H}_{2} \circ$ $S = \left\{(\langle \mathbf{w}, \mathbf{x}_{1} \rangle, \ldots, \langle \mathbf{w}, \mathbf{x}_{m} \rangle) : \| \mathbf{w} \|_{2} \leq 1 \right\}$ . Then,

$$
R(\mathcal{H}_{2} \circ S) \leq \frac{\max_{i} \| \mathbf{x}_{i} \|_{2}}{\sqrt{m}}.
$$

Proof Using Cauchy-Schwartz inequality we know that for any vectors w, v we have $\langle \mathbf{w}, \mathbf{v} \rangle \leq \| \mathbf{w} \| \| \mathbf{v} \|$ . Therefore,

$$
\begin{array}{l} mR(\mathcal{H}_{2} \circ S) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in \mathcal{H}_{2} \circ S} \sum_{i = 1}^{m} \sigma_{i} a_{i} \right] \\ \qquad = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{w}: \| \mathbf{w} \| \leq 1} \sum_{i = 1}^{m} \sigma_{i} \big \langle \mathbf{w}, \mathbf{x}_{i} \big \rangle \right] \\ \qquad = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{w}: \| \mathbf{w} \| \leq 1} \big \langle \mathbf{w}, \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \big \rangle \right] \\ \qquad \leq \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \|_{2} \right].\end{array}\tag{26.15}
$$

Next, using Jensen’s inequality we have that

$$
\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|_{2} \right] = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left(\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|_{2}^{2}\right)^{1 / 2} \right] \leq \left(\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|_{2}^{2} \right]\right)^{1 / 2}(\tag{26.16}
$$

Finally, since the variables $\sigma_{1}, \ldots, \sigma_{m}$ are independent we have

$$
\begin{array}{rl} &{\underset{\pmb{\sigma}}{\mathbb{E}} \left[\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \|_{2}^{2} \right] = \underset{\pmb{\sigma}}{\mathbb{E}} \left[\sum_{i, j} \sigma_{i} \sigma_{j} \langle \mathbf{x}_{i}, \mathbf{x}_{j} \rangle \right]} \\ &{\qquad = \sum_{i \neq j} \langle \mathbf{x}_{i}, \mathbf{x}_{j} \rangle \underset{\pmb{\sigma}}{\mathbb{E}}[\sigma_{i} \sigma_{j}] + \sum_{i = 1}^{m} \langle \mathbf{x}_{i}, \mathbf{x}_{i} \rangle \underset{\pmb{\sigma}}{\mathbb{E}}[\sigma_{i}^{2}]} \\ &{\qquad = \sum_{i = 1}^{m} \| \mathbf{x}_{i} \|_{2}^{2} \leq m \max_{i} \| \mathbf{x}_{i} \|_{2}^{2}.} \end{array}
$$

Combining this with Equation (26.15) and Equation (26.16) we conclude our proof. □

Next we bound the Rademacher complexity of $\mathcal{H}_{1} \circ S$

<sup>lemma</sup> 26.11 Let $S =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m})$ be vectors in $\mathbb{R}^{n}$ . Then,

$$
R(\mathcal{H}_{1} \circ S) \leq \max_{i} \| \mathbf{x}_{i} \|_{\infty} \sqrt{\frac{2 \log(2n)}{m}}.
$$

Proof Using Holder’s inequality we know that for any vectors $\mathbf{w}, \mathbf{v}$ we have $\langle \mathbf{w}, \mathbf{v} \rangle \leq \| \mathbf{w} \|_{1} \| \mathbf{v} \|_{\infty}$ . Therefore,

$$
\begin{array}{l} mR(\mathcal{H}_{1} \circ S) = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{a} \in H_{1} \circ S} \sum_{i = 1}^{m} \sigma_{i} a_{i} \right] \\ = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{w}: \| \mathbf{w} \|_{1} \leq 1} \sum_{i = 1}^{m} \sigma_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle \right] \\ = \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{\mathbf{w}: \| \mathbf{w} \|_{1} \leq 1} \langle \mathbf{w}, \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \rangle \right] \\ \leq \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \|_{\infty} \right].\end{array}\tag{26.17}
$$

For each $j \in[n]$ , let $\mathbf{v}_{j} =(x_{1, j}, \hdots, x_{m, j}) \in \mathbb{R}^{m}$ . Note that $\| \mathbf{v}_{j} \|_{2} \leq \sqrt{m}$ max $\operatorname{i} \left\| \mathbf{x}_{i} \right\|_{\infty}.$ Let $V = \left\{\mathbf{v}_{1}, \ldots, \mathbf{v}_{n}, - \mathbf{v}_{1}, \ldots, - \mathbf{v}_{n} \right\}$ . The right-hand side of Equation (26.17) is m $R(V)$ . Using Massart lemma (Lemma 26.8) we have that

$$
R(V) \leq \max_{i} \| \mathbf{x}_{i} \|_{\infty} \sqrt{2 \log(2n) / m},
$$

which concludes our proof.

## 26.3 Generalization Bounds for SVM

In this section we use Rademacher complexity to derive generalization bounds for generalized linear predictors with Euclidean norm constraint. We will show how this leads to generalization bounds for hard-SVM and soft-SVM.

We shall consider the following general constraint-based formulation. Let $\mathcal{H} =$ $\{\mathbf{w} : \| \mathbf{w} \|_{2} \leq B\}$ be our hypothesis class, and let $Z = \mathcal{X} \times \mathcal{Y}$ be the examples domain. Assume that the loss function $\ell : \mathcal{H} \times Z \to$ <sup>R</sup> is of the form

$$
\ell(\mathbf{w},(\mathbf{x}, y)) = \phi(\langle \mathbf{w}, \mathbf{x} \rangle, y),\tag{26.18}
$$

where $\phi : \mathbb{R} \times \mathcal{V} \to \mathbb{R}$ is such that for all $y \in \mathcal{V}$ , the scalar function $a \mapsto \phi(a, y)$ is ρ-Lipschitz. For example, the hinge-loss function, $\ell(\mathbf{w},(\mathbf{x}, y)) = \operatorname{max} \{0, 1 -$ $y \langle \mathbf{w}, \mathbf{x} \rangle\}$ , can be written as in Equation (26.18) using $\phi(a, y) = \operatorname{max} \{0, 1 -$ $ya\}$ , and note that $\phi$ is 1-Lipschitz for all $y \in \{\pm 1\}$ . Another example is the absolute loss function, $\ell(\mathbf{w},(\mathbf{x}, y)) = | \langle \mathbf{w}, \mathbf{x} \rangle - y |$ , which can be written as in Equation (26.18) using $\phi(a, y) = | a - y |$ , which is also 1-Lipschitz for all $y \in \mathbb R$

The following theorem bounds the generalization error of all predictors in H using their empirical error.

<sup>theorem</sup> 26.12 Suppose that D is a distribution over $\mathcal{X} \times \mathcal{V}$ such that with probability 1 we have that $\| \mathbf{x} \|_{2} ~ \leq ~ R$ . Let $\mathcal{H} \ = \ \left\{\mathbf{w} \ : \ \| \mathbf{w} \|_{2} \ \leq \B \right\}$ and let $\ell : \mathcal{H} \times Z \to \mathbb{R}$ be a loss function of the form given in Equation (26.18) such that for all $y \in \mathcal{y}, \a \mapsto \phi(a, y)$ is a ρ-Lipschitz function and such that $\begin{array}{r}{\operatorname{max}_{a \in[- BR, BR]} | \phi(a, y) | \leq c} \end{array}$ . Then, for any $\delta \in(0, 1)$ , with probability of at least $1 - \delta$ over the choice of an i.i.d. sample of size $m_{:}$

$$
\forall \mathbf{w} \in \mathcal{H}, L_{\mathcal{D}}(\mathbf{w}) \leq L_{S}(\mathbf{w}) + \frac{2 \rho BR}{\sqrt{m}} + c \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

Proof Let $F = \{(\mathbf{x}, y) \mid \mapsto \phi(\langle \mathbf{w}, \mathbf{x} \rangle, y) : \mathbf{w} \in \#\}$ . We will show that with probability 1, $R(F \circ S) \ : \leq \ : \rho BR / \sqrt{m}$ and then the theorem will follow from Theorem 26.5. Indeed, the set $F \circ S$ can be written as

$$
F \circ S = \{(\phi(\langle \mathbf{w}, \mathbf{x}_{1} \rangle, y_{1}), \dots, \phi(\langle \mathbf{w}, \mathbf{x}_{m} \rangle, y_{m})): \mathbf{w} \in \mathcal{H}\},
$$

and the bound on $R(F{\circ} S)$ follows directly by combining Lemma 26.9, Lemma 26.10, and the assumption that $\| \mathbf{x} \|_{2} \leq R$ with probability 1. □

We next derive a generalization bound for hard-SVM based on the previous theorem. For simplicity, we do not allow a bias term and consider the hard-SVM problem:

$$
\underset{\mathbf{w}}{\operatorname{argmin}} \| \mathbf{w} \|^{2} \quad \text{s.t.} \quad \forall i, y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle \geq 1\tag{26.19}
$$

<sup>theorem</sup> 26.13 Consider a distribution D over $\mathcal{X} \times \{\pm 1\}$ such that there exists some vector $\mathbf{w}^{\star}$ with $\begin{array}{r}{\mathbb{P}_{(\mathbf{x}, y) \sim \mathcal{D}}[y \langle \mathbf{w}^{\star}, \mathbf{x} \rangle \geq 1] = 1} \end{array}$ and such that $\| \mathbf{x} \|_{2} \leq R$ with probability 1. Let $\mathbf{w}_{S}$ be the output of Equation (26.19). Then, with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ , we have that

$$
\underset{(\mathbf{x}, y) \sim \mathcal{D}}{\mathbb{P}}[y \neq sign(\langle \mathbf{w}_{S}, \mathbf{x} \rangle)] \leq \frac{2R \| \mathbf{w}^{\star} \|}{\sqrt{m}} +(1 + R \| \mathbf{w}^{\star} \|) \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

Proof Throughout the proof, let the loss function be the ramp loss (see Section 15.2.3). Note that the range of the ramp loss is [0, 1] and that it is a 1-Lipschitz function. Since the ramp loss upper bounds the zero-one loss, we have that

$$
\underset{(\mathbf{x}, y) \sim \mathcal{D}}{\mathbb{P}}[y \neq \mathrm{sign}(\langle \mathbf{w}_{S}, \mathbf{x} \rangle)] \leq L_{\mathcal{D}}(\mathbf{w}_{S}).
$$

Let $B = \| \mathbf{w}^{\star} \|_{2}$ and consider the set $\mathcal{H} = \left\{\mathbf{w} : \| \mathbf{w} \|_{2} \leq B \right\}$ . By the definition of hard-SVM and our assumption on the distribution, we have that ${\mathbf w}_{S} \in \mathcal H$ with probability 1 and that $L_{S}(\mathbf{w}_{S}) = 0$ . Therefore, using Theorem 26.12 we have that

$$
L_{\mathcal{D}}(\mathbf{w}_{S}) \leq L_{S}(\mathbf{w}_{S}) + \frac{2BR}{\sqrt{m}} + \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

Remark 26.1 Theorem 26.13 implies that the sample complexity of hard-SVM grows like $\frac{\mathbb{R}^{2} \left\| \mathbf{w}^{\star} \right\|^{2}}{\epsilon^{2}}$ . Using a more delicate analysis and the separability assumption, it is possible to improve the bound to an order of $\frac{\mathbb{R}^{2} \ \lVert \mathbf{w}^{\star} \rVert^{2}}{\epsilon}$

The bound in the preceding theorem depends on $\| \mathbf{w}^{\star} \|$ , which is unknown. In the following we derive a bound that depends on the norm of the output of SVM; hence it can be calculated from the training set itself. The proof is similar to the derivation of bounds for structure risk minimization (SRM).

<sup>theorem</sup> 26.14 Assume that the conditions of Theorem 26.13 hold. Then, with probability of at least $1 - \delta$ over the choice of $S \sim \mathcal{D}^{m}$ , we have that

$$
\mathop{\mathbb{P}}_{(\mathbf{x},y)\sim \mathcal{D}}[y\neq sign(\langle \mathbf{w}_{S},\mathbf{x}\rangle)]\leq \frac{4R\|\mathbf{w}_{S}\|}{\sqrt{m}} +\sqrt{\frac{\ln(\frac{4\log_{2}(\|\mathbf{w}_{S}\|)}{\delta})}{m}}.
$$

Proof For any integer $i,$ let $B_{i} = 2^{i}, \mathcal{H}_{i} = \left\{\mathbf{w} : \left\| \mathbf{w} \right\| \leq B_{i} \right\}$ , and let $\begin{array}{r}{\delta_{i} = \frac{\delta}{2i^{2}}} \end{array}$ Fix $i,$ then using Theorem 26.12 we have that with probability of at least $1 - \delta_{i}$

$$
\forall \mathbf{w} \in \mathcal{H}_{i}, L_{\mathcal{D}}(\mathbf{w}) \leq L_{S}(\mathbf{w}) + \frac{2B_{i} R}{\sqrt{m}} + \sqrt{\frac{2 \ln(2 / \delta_{i})}{m}}
$$

Applying the union bound and using $\textstyle \sum_{i = 1}^{\infty} \delta_{i} \leq \delta$ we obtain that with probability of at least $1 - \delta$ this holds for all i. Therefore, for all $\mathbf{w}_{\mathrm{:}}$ , if we let $i = \lceil \log_{2}(\| \mathbf{w} \|) \rceil$ then $\mathbf{w} \in \mathcal{H}_{i}, B_{i} \leq 2 \| \mathbf{w} \|$ , and $\begin{array}{r}{\frac{2}{\delta_{i}} = \frac{(2i)^{2}}{\delta} \leq \frac{(4 \log_{2}(| |{\bf w} | |))^{2}}{\delta}} \end{array}$ . Therefore,

$$
\begin{array}{l} L_{\mathcal{D}}(\mathbf{w}) \leq L_{S}(\mathbf{w}) + \frac{2B_{i} R}{\sqrt{m}} + \sqrt{\frac{2 \ln(2 / \delta_{i})}{m}} \\ \leq L_{S}(\mathbf{w}) + \frac{4 \| \mathbf{w} \| R}{\sqrt{m}} + \sqrt{\frac{4(\ln(4 \log_{2}(\| \mathbf{w} \|)) + \ln(1 / \delta))}{m}}.\end{array}
$$

In particular, it holds for $\mathbf{w}_{S}.$ which concludes our proof.

Remark 26.2 Note that all the bounds we have derived do not depend on the dimension of w. This property is utilized when learning SVM with kernels, where the dimension of w can be extremely large.

## 26.4 Generalization Bounds for Predictors with Low $\ell_{1}$ Norm

In the previous section we derived generalization bounds for linear predictors with an $\ell_{2}.$ -norm constraint. In this section we consider the following general $\ell_{1} -$ norm constraint formulation. Let $\mathcal{H} = \left\{\mathbf{w} : \| \mathbf{w} \|_{1} \leq B \right\}$ be our hypothesis class, and let $Z = \mathcal{X} \times \mathcal{Y}$ be the examples domain. Assume that the loss function, $\ell : \mathcal{H} \times Z \to \mathbb{R}.$ , is of the same form as in Equation (26.18), with $\phi : \mathbb { R } \times \mathcal { V } $ R being ρ-Lipschitz w.r.t. its first argument. The following theorem bounds the generalization error of all predictors in H using their empirical error.

<sup>theorem</sup> 26.15 Suppose that D is a distribution over $\mathcal{X} \times \mathcal{V}$ such that with probability 1 we have that $\| \mathbf{x} \|_{\infty} \leq R$ . Let $\mathcal{H} = \left\{\mathbf{w} \in \mathbb{R}^{d} : \| \mathbf{w} \|_{1} \leq B \right\}$ and let $\ell : \mathcal{H} \times Z \to \mathbb{R}$ be a loss function of the form given in Equation $(26.18)$ such that for all $y \in \mathcal{y}, a \mapsto \phi(a, y)$ is an ρ-Lipschitz function and such that max<sub>a∈[−BR,BR]</sub> $| \phi(a, y) | \leq c$ . Then, for any $\delta \in(0, 1)$ , with probability of at least $1 - \delta$ over the choice of an i.i.d. sample of size m,

$$
\forall \mathbf{w} \in \mathcal{H}, L_{\mathcal{D}}(\mathbf{w}) \leq L_{S}(\mathbf{w}) + 2 \rho BR \sqrt{\frac{2 \log(2d)}{m}} + c \sqrt{\frac{2 \ln(2 / \delta)}{m}}.
$$

Proof The proof is identical to the proof of Theorem 26.12, while relying on Lemma 26.11 instead of relying on Lemma 26.10. □

It is interesting to compare the two bounds given in Theorem 26.12 and Theorem 26.15. Apart from the extra $\log(d)$ factor that appears in Theorem 26.15, both bounds look similar. However, the parameters B, R have different meanings in the two bounds. In Theorem 26.12, the parameter B imposes an $\ell_{2}$ constraint on w and the parameter $R$ captures a low \` -norm assumption on the instances. In contrast, in Theorem 26.15 the parameter B imposes an $\ell_{1}$ constraint on w (which is stronger than an $\ell_{2}$ constraint) while the parameter R captures a low $\ell_{\infty}{\mathrm{- norm}}$ assumption on the instance (which is weaker than a low \` -norm assumption). Therefore, the choice of the constraint should depend on our prior knowledge of the set of instances and on prior assumptions on good predictors.

## 26.5 Bibliographic Remarks

The use of Rademacher complexity for bounding the uniform convergence is due to (Koltchinskii & Panchenko 2000, Bartlett & Mendelson 2001, Bartlett & Mendelson 2002). For additional reading see, for example, (Bousquet 2002, Boucheron, Bousquet & Lugosi 2005, Bartlett, Bousquet & Mendelson 2005).

Our proof of the concentration lemma is due to Kakade and Tewari lecture notes. Kakade, Sridharan & Tewari (2008) gave a unified framework for deriving bounds on the Rademacher complexity of linear classes with respect to different assumptions on the norms.

In this chapter we describe another way to measure the complexity of sets, which is called covering numbers.


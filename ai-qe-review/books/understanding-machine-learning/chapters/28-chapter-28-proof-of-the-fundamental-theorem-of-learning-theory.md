---
title: "Chapter 28 \u2014 Proof of the Fundamental Theorem of Learning Theory"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 28
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 10350
source_line_end: 10745
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
  source_control_characters: 10
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 28 — Proof of the Fundamental Theorem of Learning Theory

> [[../README|本书目录]] · [[27-chapter-27-covering-numbers|上一章]] · [[29-chapter-29-multiclass-learnability|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 10350–10745。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 10；different × 1；sufficient × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# 28 Proof of the Fundamental Theorem of Learning Theory

In this chapter we prove Theorem 6.8 from Chapter 6. We remind the reader the conditions of the theorem, which will hold throughout this chapter: H is a hypothesis class of functions from a domain X to $\{0, 1\}$ , the loss function is the $0 - 1$ loss, and VCdim $(\mathcal{H}) = d < \infty$

We shall prove the upper bound for both the realizable and agnostic cases and shall prove the lower bound for the agnostic case. The lower bound for the realizable case is left as an exercise.

## 28.1 The Upper Bound for the Agnostic Case

For the upper bound we need to prove that there exists C such that H is agnostic PAC learnable with sample complexity

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq C \frac{d + \ln(1 / \delta)}{\epsilon^{2}}.
$$

We will prove the slightly looser bound:

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq C \frac{d \log(d / \epsilon) + \ln(1 / \delta)}{\epsilon^{2}}.\tag{28.1}
$$

The tighter bound in the theorem statement requires a more involved proof, in which a more careful analysis of the Rademacher complexity using a technique called “chaining” should be used. This is beyond the scope of this book.

To prove Equation (28.1), it sufices to show that applying the ERM with a sample size

$$
m \geq 4 \frac{32d}{\epsilon^{2}} \cdot \log \left(\frac{64d}{\epsilon^{2}}\right) + \frac{8}{\epsilon^{2}} \cdot(8d \log(e / d) + 2 \log(4 / \delta))
$$

yields an $\epsilon$, δ-learner for H. We prove this result on the basis of Theorem 26.5. Let $(\mathbf{x}_{1}, y_{1}), \dotsc,(\mathbf{x}_{m}, y_{m})$ be a classification training set. Recall that the Sauer-Shelah lemma tells us that if ${\mathrm{VCdim}}({\mathcal{H}}) = d$ then

$$
\left| \left\{\left(h(\mathbf{x}_{1}), \dots, h(\mathbf{x}_{m})\right): h \in \mathcal{H} \right\} \right| \leq \left(\frac{em}{d}\right)^{d}.
$$

Denote A = $\{(\mathbb{1}_{[h(\mathbf{x}_{1}) \neq y_{1}]}, \dots, \mathbb{1}_{[h(\mathbf{x}_{m}) \neq y_{m}]}) : h \in \mathcal{H}\}$ . This clearly implies that

$$
| A | \leq \left(\frac{em}{d}\right)^{d}.
$$

Combining this with Lemma 26.8 we obtain the following bound on the Rademacher complexity:

$$
R(A) \leq \sqrt{\frac{2d \log(em / d)}{m}}.
$$

Using Theorem 26.5 we obtain that with probability of at least $1 - \delta.$ , for every $h \in \mathcal H$ we have that

$$
L_{\mathcal{D}}(h) - L_{S}(h) \leq \sqrt{\frac{8d \log(em / d)}{m}} + \sqrt{\frac{2 \log(2 / \delta)}{m}}.
$$

Repeating the previous argument for minus the zero-one loss and applying the union bound we obtain that with probability of at least $1 - \delta.$ , for every $h \in \mathcal H$ it holds that

$$
\begin{array}{c} | L_{\mathcal{D}}(h) - L_{S}(h) | \leq \sqrt{\frac{8d \log(em / d)}{m}} + \sqrt{\frac{2 \log(4 / \delta)}{m}} \\ \leq 2 \sqrt{\frac{8d \log(em / d) + 2 \log(4 / \delta)}{m}}.\end{array}
$$

To ensure that this is smaller than $\epsilon$ we need

$$
m \geq \frac{4}{\epsilon^{2}} \cdot(8d \log(m) + 8d \log(e / d) + 2 \log(4 / \delta)).
$$

Using Lemma ${\mathrm{A.2}}.$ a sufficient condition for the inequality to hold is that

$$
m \geq 4 \frac{32d}{\epsilon^{2}} \cdot \log \left(\frac{64d}{\epsilon^{2}}\right) + \frac{8}{\epsilon^{2}} \cdot(8d \log(e / d) + 2 \log(4 / \delta)).
$$

## 28.2 The Lower Bound for the Agnostic Case

Here, we prove that there exists C such that H is agnostic PAC learnable with sample complexity

$$
m_{\mathcal{H}}(\epsilon, \delta) \geq C \frac{d + \ln(1 / \delta)}{\epsilon^{2}}.
$$

We will prove the lower bound in two parts. First, we will show that $m(\epsilon, \delta) \geq$ $0.5 \log(1 /(4 \delta)) / \epsilon^{2}$ , and second we will show that for every $\delta \leq 1 / 8$ we have that $m(\epsilon, \delta) \ge 8d / \epsilon^{2}$ . These two bounds will conclude the proof.

## 28.2.1 Showing That $m(\epsilon, \delta) \geq 0.5 \log(1 /(4 \delta)) / \epsilon^{2}$

We first show that for any $\epsilon < 1 / \sqrt{2}$ and any $\delta \in(0, 1)$ , we have that $m(\epsilon, \delta) \geq$ $0.5 \log(1 /(4 \delta)) / \epsilon^{2}$ . To do so, we show that for $m \le 0.5 \log(1 /(4 \delta)) / \epsilon^{2}$ , H is not learnable.

Choose one example that is shattered by H. That is, let c be an example such that there are $h_{+}, h_{-} \in \mathcal{H}$ for which $h_{+}(c) = 1$ and $h_{-}(c) = - 1$ . Define two distributions, $\mathcal{D}_{+}$ and $\mathcal{D}_{-}$ , such that for $b \in \{\pm 1\}$ we have

$$
\mathcal{D}_{b}(\{(x, y)\}) = \left\{\begin{array}{ll} \frac{1 + yb \epsilon}{2} & \text{if} x = c \\ 0 & \text{otherwise.} \end{array} \right.
$$

That is, all the distribution mass is concentrated on two examples $(c, 1)$ and $(c, - 1)$ , where the probability of $(c, b)$ is $\textstyle { \frac { 1 + b \epsilon } { 2 } } $ and the probability of $(c, - b)$ is $\frac{1 - b \epsilon}{2}$

Let A be an arbitrary algorithm. Any training set sampled from $\mathcal{D}_{b}$ has the form $S =(c, y_{1}), \dots,(c, y_{m})$ . Therefore, it is fully characterized by the vector $\mathbf{y} =(y_{1}, \dots, y_{m}) \in \{\pm 1\}^{m}$ . Upon receiving a training set S, the algorithm A returns a hypothesis $h : \mathcal{X} \to \{\pm 1\}$ . Since the error of A w.r.t. $\mathcal{D}_{b}$ only depends on $h(c)$ , we can think of A as a mapping from $\{\pm 1\}^{m}$ into $\{\pm 1\}$ . Therefore, we denote by $A(\mathbf{y})$ the value in $\{\pm 1\}$ corresponding to the prediction of $h(c)$ where h is the hypothesis that A outputs upon receiving the training set $S =$ $(c, y_{1}), \ldots,(c, y_{m})$

Note that for any hypothesis h we have

$$
L_{\mathcal{D}_{b}}(h) = \frac{1 - h(c) b \epsilon}{2}.
$$

In particular, the Bayes optimal hypothesis is $h_{b}$ and

$$
L_{\mathcal{D}_{b}}(A(\mathbf{y})) - L_{\mathcal{D}_{b}}(h_{b}) = \frac{1 - A(\mathbf{y}) b \epsilon}{2} - \frac{1 - \epsilon}{2} = \left\{\begin{array}{ll} \epsilon & \text{if} A(\mathbf{y}) \neq b \\ 0 & \text{otherwise.} \end{array} \right.
$$

Fix A. For $b \in \{\pm 1\}$ , let $Y^{b} = \{\mathbf{y} \in \{0, 1\}^{m} : A(\mathbf{y}) \neq b\}$ . The distribution $\mathcal{D}_{b}$ induces a probability $P_{b}$ over $\{\pm 1\}^{m}$ . Hence,

$$
\mathbb{P} \left[L_{\mathcal{D}_{b}}(A(\mathbf{y})) - L_{\mathcal{D}_{b}}(h_{b}) = \epsilon \right] = \mathcal{D}_{b}(Y^{b}) = \sum_{\mathbf{y}} P_{b}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq b]}.
$$

Denote $N^{+} = \{\mathbf{y} : | \{i : y_{i} = 1\} | \geq m / 2\}$ and $N^{-} = \{\pm 1\}^{m} \backslash N^{+}$ . Note that for any $\mathbf{y} \in N^{+}$ we have $P_{+}[\mathbf{y}] \geq P_{-}[\mathbf{y}]$ and for any $\mathbf{y} \in N^{-}$ we have $P_{-}[\mathbf{y}] \geq P_{+}[\mathbf{y}]$

Therefore,

$$
\begin{array}{l} \max_{b \in \{\pm 1\}} \mathbb{P} \left[L_{\mathcal{D}_{b}}(A(\mathbf{y})) - L_{\mathcal{D}_{b}}(h_{b}) = \epsilon \right] \\ = \max_{b \in \{\pm 1\}} \sum_{\mathbf{y}} P_{b}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq b]} \\ \geq \frac{1}{2} \sum_{\mathbf{y}} P_{+}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq +]} + \frac{1}{2} \sum_{\mathbf{y}} P_{-}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq -]} \\ = \frac{1}{2} \sum_{\mathbf{y} \in N^{+}} \left(P_{+}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq +]} + P_{-}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq -]}\right) + \frac{1}{2} \sum_{\mathbf{y} \in N^{-}} \left(P_{+}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq +]} + P_{-}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq -]}\right) \\ \geq \frac{1}{2} \sum_{\mathbf{y} \in N^{+}} \left(P_{-}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq +]} + P_{-}[\mathbf{y}] \mathbb{1}_{[A(\mathbf{y}) \neq -]}\right) + \frac{1}{2} \sum_{\mathbf{y} \in N^{-}} \left(P_{+}[\mathcal{Y}] \mathbb{1}_{[A(\mathcal{Y}) \neq +]} + P_{+}[\mathcal{Y}] \mathbb{1}_{[A(\mathcal{Y}) \neq -]}\right) \\ = \frac{1}{2} \sum_{\mathbf{y} \in N^{+}} P_{-}[\mathbf{y}] + \frac{1}{2} \sum_{\mathbf{y} \in N^{-}} P_{+}[\mathbf{y}].\end{array}
$$

Next note that $\begin{array}{r}{\sum_{\mathbf{y} \in N^{+}} P_{-}[\mathbf{y}] = \sum_{\mathbf{y} \in N^{-}} P_{+}[\mathbf{y}]} \end{array}$ , and both values are the probability that a Binomial $(m,(1 - \epsilon) / 2)$ random variable will have value greater than $m / 2$ . Using Lemma B.11, this probability is lower bounded by

$$
\frac{1}{2} \left(1 - \sqrt{1 - \exp(- m \epsilon^{2} /(1 - \epsilon^{2}))}\right) \geq \frac{1}{2} \left(1 - \sqrt{1 - \exp(- 2m \epsilon^{2})}\right),
$$

where we used the assumption that $\epsilon^{2} \le 1 / 2$ . It follows that if $m \leq 0.5 \log(1 /(4 \delta)) / \epsilon^{2}$ then there exists b such that

$$
\begin{array}{l} \mathbb{P} \left[L_{\mathcal{D}_{b}}(A(\mathbf{y})) - L_{\mathcal{D}_{b}}(h_{b}) = \epsilon \right] \\ \qquad \geq \frac{1}{2} \left(1 - \sqrt{1 - \sqrt{4 \delta}}\right) \geq \delta, \end{array}
$$

where the last inequality follows by standard algebraic manipulations. This concludes our proof.

## 28.2.2 Showing That $m(\epsilon, 1 / 8) \ge 8d / \epsilon^{2}$

We shall now prove that for every $\epsilon < 1 /(8 \sqrt{2})$ we have that $\begin{array}{r}{m(\epsilon, \delta) \ge \frac{8d}{\epsilon^{2}}} \end{array}$

Let $\rho = 8 \epsilon$ and note that $\rho \in(0, 1 / \sqrt{2})$ . We will construct a family of distributions as follows. First, let $C = \{c_{1}, \ldots, c_{d}\}$ be a set of d instances which are shattered by H. Second, for each vector $(b_{1}, \ldots, b_{d}) \in \{\pm 1\}^{d}$ , define a distribution $\mathcal{D}_{b}$ such that

$$
\mathcal{D}_{b}(\{(x, y)\}) = \left\{\begin{array}{ll} \frac{1}{d} \cdot \frac{1 + yb_{i} \rho}{2} & \text{if} \exists i: x = c_{i} \\ 0 & \text{otherwise.} \end{array} \right.
$$

That is, to sample an example according to $\mathcal{D}_{b}$ , we first sample an element $c_{i} \in C$ uniformly at random, and then set the label to be $b_{i}$ with probability $(1 + \rho) / 2$ $\mathrm{or} - b_{i}$ with probability $(1 - \rho) / 2$

It is easy to verify that the Bayes optimal predictor for $\mathcal{D}_{b}$ is the hypothesis $h \in \mathcal H$ such that $h(c_{i}) = b_{i}$ for all $i \in[d]$ , and its error is $\scriptstyle{\frac{1 - \rho}{2}}$ . In addition, for any other function $f : \mathcal{X} \to \{\pm 1\}$ , it is easy to verify that

$$
L_{\mathcal{D}_{b}}(f) = \frac{1 + \rho}{2} \cdot \frac{| \{i \in[d] : f(c_{i}) \neq b_{i}\} |}{d} + \frac{1 - \rho}{2} \cdot \frac{| \{i \in[d] : f(c_{i}) = b_{i}\} |}{d}.
$$

Therefore,

$$
L_{\mathcal{D}_{b}}(f) - \min_{h \in \mathcal{H}} L_{\mathcal{D}_{b}}(h) = \rho \cdot \frac{| \{i \in[d] : f(c_{i}) \neq b_{i}\} |}{d}.\tag{28.2}
$$

Next, fix some learning algorithm A. As in the proof of the No-Free-Lunch theorem, we have that

$$
\max_{\mathcal{D}_{b}: b \in \{\pm 1\}^{d}} \underset{S \sim \mathcal{D}_{b}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}_{b}}(A(S)) - \min_{h \in \mathcal{H}} L_{\mathcal{D}_{b}}(h) \right]\tag{28.3}
$$

$$
\geq \underset{\mathcal{D}_{b}: b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{S \sim \mathcal{D}_{b}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}_{b}}(A(S)) - \min_{h \in \mathcal{H}} L_{\mathcal{D}_{b}}(h) \right]\tag{28.4}
$$

$$
= \underset{\mathcal{D}_{b}: b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{S \sim \mathcal{D}_{b}^{m}}{\mathbb{E}} \left[\rho \cdot \frac{| \{i \in[d] : A(S)(c_{i}) \neq b_{i} |}{d} \right]\tag{28.5}
$$

$$
= \frac{\rho}{d} \sum_{i = 1}^{d} \underset{\mathcal{D}_{b}: b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{S \sim \mathcal{D}_{b}^{m}}{\mathbb{E}} \mathbb{1}_{[A(S)(c_{i}) \neq b_{i}]},\tag{28.6}
$$

where the first equality follows from Equation (28.2). In addition, using the definition of $\mathcal{D}_{b}$ , to sample $S \sim \mathcal{D}_{b}$ we can first sample $(j_{1}, \ldots, j_{m}) \sim U([d])^{m}$ , set $x_{r} = c_{j_{i}}$ , and finally sample $y_{r}$ such that $\mathbb{P}[y_{r} = b_{j_{i}}] =(1 + \rho) / 2$ . Let us simplify the notation and use $y \sim b$ to denote sampling according to $\mathbb{P}[y = b] =(1 + \rho) / 2$ Therefore, the right-hand side of Equation (28.6) equals

$$
\frac{\rho}{d} \sum_{i = 1}^{d} \underset{j \sim U([d])^{m}}{\mathbb{E}} \underset{b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{\forall r, y_{r} \sim b_{j_{r}}}{\mathbb{E}} \mathbb{1}_{[A(S)(c_{i}) \neq b_{i}]}.\tag{28.7}
$$

We now proceed in two steps. First, we show that among all learning algorithms, $A,$ , the one which minimizes Equation (28.7) (and hence also Equation (28.4)) is the Maximum-Likelihood learning rule, denoted $A_{ML}$ . Formally, for each i, $A_{ML}(S)(c_{i})$ is the majority vote among the set $\{y_{r} : r \in[m], x_{r} = c_{i}\}$ . Second, we lower bound Equation (28.7) for $A_{ML}$

<sup>lemma</sup> 28.1 Among all algorithms, Equation $(28.4)$ is minimized for A being the Maximum-Likelihood algorithm, $A_{ML}$ , defined as

$$
\forall i, A_{ML}(S) \left(c_{i}\right) = \operatorname{sign} \left(\sum_{r: x_{r} = c_{i}} y_{r}\right).
$$

Proof Fix some $j \in[d]^{m}$ . Note that given $j$ and $y \in \{\pm 1\}^{m}$ , the training set $S$ is fully determined. Therefore, we can write $A(j, y)$ instead of $A(S)$ . Let us also fix $i \in[d]$ ]. Denote $b^{\lnot i}$ the sequence $(b_{1}, \hdots, b_{i - 1}, b_{i + 1}, \hdots, b_{m})$ . Also, for any $y \in \{\pm 1\}^{m}$ , let $y^{I}$ denote the elements of $y$ corresponding to indices for which $j_{r} = i$ and let $y^{\lnot I}$ be the rest of the elements of $y.$ . We have

$$
\begin{array}{l} \underset{b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{\forall r, y_{r} \sim b_{j_{r}}}{\mathbb{E}} \mathbb{1}_{[A(S)(c_{i}) \neq b_{i}]} \\ = \frac{1}{2} \sum_{b_{i} \in \{\pm 1\}} \underset{b^{\neg i} \sim U(\{\pm 1\}^{d - 1})}{\mathbb{E}} \sum_{y} P[y | b^{\neg i}, b_{i}] \mathbb{1}_{[A(j, y)(c_{i}) \neq b_{i}]} \\ = \underset{b^{\neg i} \sim U(\{\pm 1\}^{d - 1})}{\mathbb{E}} \sum_{y^{\neg I}} P[y^{\neg I} | b^{\neg i}] \frac{1}{2} \sum_{y^{I}} \left(\sum_{b_{i} \in \{\pm 1\}} P[y^{I} | b_{i}] \mathbb{1}_{[A(j, y)(c_{i}) \neq b_{i}]}\right).\end{array}
$$

The sum within the parentheses is minimized when $A(j, y)(c_{i})$ is the maximizer of $P[y^{I} | b_{i}]$ over $b_{i} \in \{\pm 1\}$ , which is exactly the Maximum-Likelihood rule. Repeating the same argument for all i we conclude our proof. □

Fix i. For every $j,$ let $n_{i}(j) = \{| t : j_{t} = i |\}$ be the number of instances in which the instance is $c_{i}$ . For the Maximum-Likelihood rule, we have that the quantity

$$
\underset{b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{\forall r, y_{r} \sim b_{j_{r}}}{\mathbb{E}} \mathbb{1}_{[A_{ML}(S)(c_{i}) \neq b_{i}]}
$$

is exactly the probability that a binomial $(n_{i}(j),(1 - \rho) / 2)$ random variable wil be larger than $n_{i}(j) / 2$ . Using Lemma B.11, and the assumption $\rho^{2} \le 1 / 2$ , we have that

$$
P[B \geq n_{i}(j) / 2] \geq \frac{1}{2} \left(1 - \sqrt{1 - e^{- 2n_{i}(j) \rho^{2}}}\right).
$$

We have thus shown that

$$
\begin{array}{l} \frac{\rho}{d} \sum_{i = 1}^{d} \underset{j \sim U([d])^{m}}{\mathbb{E}} \underset{b \sim U(\{\pm 1\}^{d})}{\mathbb{E}} \underset{\forall r, y_{r} \sim b_{j_{r}}}{\mathbb{E}} \mathbb{1}_{[A(S)(c_{i}) \neq b_{i}]} \\ \geq \frac{\rho}{2d} \sum_{i = 1}^{d} \underset{j \sim U([d])^{m}}{\mathbb{E}} \left(1 - \sqrt{1 - e^{- 2 \rho^{2} n_{i}(j)}}\right) \\ \geq \frac{\rho}{2d} \sum_{i = 1}^{d} \underset{j \sim U([d])^{m}}{\mathbb{E}} \left(1 - \sqrt{2 \rho^{2} n_{i}(j)}\right), \end{array}
$$

where in the last inequality we used the inequality $1 - e^{- a} \leq a.$

Since the square root function is concave, we can apply Jensen’s inequality to obtain that the above is lower bounded by

$$
\begin{array}{rl} &{\geq \frac{\rho}{2d} \sum_{i = 1}^{d} \left(1 - \sqrt{2 \rho^{2} \underset{j \sim U([d])^{m}}{\mathbb{E}} n_{i}(j)}\right)} \\ &{= \frac{\rho}{2d} \sum_{i = 1}^{d} \left(1 - \sqrt{2 \rho^{2} m / d}\right)} \\ &{= \frac{\rho}{2} \left(1 - \sqrt{2 \rho^{2} m / d}\right).} \end{array}
$$

As long as $\begin{array}{r}{m < \frac{d}{8 \rho^{2}}} \end{array}$ , this term would be larger than $\rho / 4$

In summary, we have shown that if m $< \frac{d}{8 \rho^{2}}$ then for any algorithm there exists a distribution such that

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[L_{\mathcal{D}}(A(S)) - \min_{h \in \mathcal{H}} L_{\mathcal{D}}(h) \right] \geq \rho / 4.
$$

Finally, Let $\begin{array}{r}{\Delta = \frac{1}{\rho}(L_{\mathcal{D}}(A(S)) - \operatorname{min}_{h \in \mathcal{H}} L_{\mathcal{D}}(h))} \end{array}$ and note that $\Delta \in[0, 1]$ (see Equation (28.5)). Therefore, using Lemma B.1, we get that

$$
\begin{array}{c} \mathbb{P}[L_{\mathcal{D}}(A(S)) - \underset{h \in \mathcal{H}}{\min} L_{\mathcal{D}}(h) > \epsilon] = \mathbb{P} \left[\Delta > \frac{\epsilon}{\rho} \right] \geq \mathbb{E}[\Delta] - \frac{\epsilon}{\rho} \\ \geq \frac{1}{4} - \frac{\epsilon}{\rho}.\end{array}
$$

Choosing $\rho = 8 \epsilon$ we conclude that if $\begin{array}{r}{m < \frac{d}{512 \epsilon^{2}}} \end{array}$ , then with probability of at least $1 / 8$ we will have $L_{\mathcal{D}}(A(S)) - \operatorname{min}_{h \in \mathcal{H}} L_{\mathcal{D}}(h) \geq \epsilon$

## 28.3 The Upper Bound for the Realizable Case

Here we prove that there exists C such that H is PAC learnable with sample complexity

$$
m_{\mathcal{H}}(\epsilon, \delta) \leq C \frac{d \ln(1 / \epsilon) + \ln(1 / \delta)}{\epsilon}.
$$

We do so by showing that for $m \ge C \frac{d \ln(1 / \epsilon) + \ln(1 / \delta)}{\epsilon}$ , H is learnable using the ERM rule. We prove this claim based on the notion of $\epsilon$-nets.

<sup>definition</sup> 28.2 ($\epsilon$-net) Let X be a domain. $S \subset{\mathcal{X}}$ is an $\epsilon$-net for $\mathcal{H} \subset 2^{\mathcal{X}}$ with respect to a distribution D over X if

$$
\forall h \in \mathcal{H}: \mathcal{D}(h) \geq \epsilon \Rightarrow h \cap S \neq \emptyset.
$$

theorem 28.3 Let $\mathcal{H} \subset 2^{\mathcal{X}}$ with VCdim(H) = d. Fix $\epsilon \in(0, 1)$ ), δ ∈ (0, 1/4) and let

$$
m \geq \frac{8}{\epsilon} \left(2d \log \left(\frac{16e}{\epsilon}\right) + \log \left(\frac{2}{\delta}\right)\right).
$$

Then, with probability of at least $1 - \delta$ over a choice of $S \sim \mathcal{D}^{m}$ we have that S is an $\epsilon$-net for H.

Proof Let

$$
B = \{S \subset \mathcal{X}: | S | = m, \exists h \in \mathcal{H}, \mathcal{D}(h) \geq \epsilon, h \cap S = \emptyset\}
$$

be the set of sets which are not $\epsilon$-nets. We need to bound $\mathbb{P}[S \in B]$ . Define

$$
B^{\prime} = \{(S, T) \subset \mathcal{X}: | S | = | T | = m, \exists h \in \mathcal{H}, \mathcal{D}(h) \geq \epsilon, h \cap S = \emptyset, | T \cap h | > \frac{\epsilon m}{2}\}.
$$

Claim 1

$$
\mathbb{P}[S \in B] \leq 2 \mathbb{P}[(S, T) \in B^{\prime}].
$$

Proof of Claim 1 : Since S and T are chosen independently we can write

$$
\mathbb{P}[(S, T) \in B^{\prime}] = \underset{(S, T) \sim \mathcal{D}^{2m}}{\mathbb{E}} \left[\mathbb{1}_{[(S, T) \in B^{\prime}]} \right] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\underset{T \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\mathbb{1}_{[(S, T) \in B^{\prime}]} \right] \right].
$$

Note that $(S, T) \in B^{\prime}$ implies $S \in B$ and therefore $\mathbb{1}_{[(S, T) \in B^{\prime}]} = \mathbb{1}_{[(S, T) \in B^{\prime}]} \mathbb{1}_{[S \in B]}$ which gives

$$
\begin{array}{rl} &{\mathbb{P}[(S, T) \in B^{\prime}] = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \underset{T \sim \mathcal{D}^{m}}{\mathbb{E}} \mathbb{1}_{[(S, T) \in B^{\prime}]} \mathbb{1}_{[S \in B]}} \\ &{\qquad = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \mathbb{1}_{[S \in B]} \underset{T \sim \mathcal{D}^{m}}{\mathbb{E}} \mathbb{1}_{[(S, T) \in B^{\prime}]}.} \end{array}
$$

Fix some S. Then, either $\mathbb{1}_{[S \in B]} = 0$ or $S \in B$ and then $\exists h_{S}$ such that $\mathcal{D}(h_{S}) \geq \epsilon$ and $| h_{S} \cap S | = 0$ . It follows that a sufficient condition for $(S, T) \in B^{\prime}$ is that $\left| T \cap h_{S} \right| >{\frac{\epsilon m}{2}}$ . Therefore, whenever $S \in B$ we have

$$
\underset{T \sim \mathcal{D}^{m}}{\mathbb{E}} \mathbb{1}_{[(S, T) \in B^{\prime}]} \geq \underset{T \sim \mathcal{D}^{m}}{\mathbb{P}}[| T \cap h_{S} | > \frac{\epsilon m}{2}].
$$

But, since we now assume $S \in B$ we know that $\mathcal{D}(h_{S}) ~ = ~ \rho ~ \ge ~ \epsilon$ . Therefore, $| T \cap h_{S} |$ is a binomial random variable with parameters ρ (probability of success for a single try) and m (number of tries). Chernof’s inequality implies

$$
\mathbb{P}[| T \cap h_{S} | \leq \frac{\rho m}{2}] \leq e^{- \frac{2}{m \rho}(m \rho - m \rho / 2)^{2}} = e^{- m \rho / 2} \leq e^{- m \epsilon / 2} \leq e^{- d \log(1 / \delta) / 2} = \delta^{d / 2} \leq 1 / 2.
$$

$$
\mathbb{P}[| T \cap h_{S} | > \frac{\epsilon m}{2}] = 1 - \mathbb{P}[| T \cap h_{S} | \leq \frac{\epsilon m}{2}] \geq 1 - \mathbb{P}[| T \cap h_{S} | \leq \frac{\rho m}{2}] \geq 1 / 2.
$$

Combining all the preceding we conclude the proof of Claim 1.

Claim 2 (Symmetrization):

$$
\mathbb{P}[(S, T) \in B^{\prime}] \leq e^{- \epsilon m / 4} \tau_{\mathcal{H}}(2m).
$$

Proof of Claim 2 : To simplify notation, let $\alpha = m \epsilon / 2$ and for a sequence $A =$ $(x_{1}, \ldots, x_{2m})$ let $A_{0} =(x_{1}, \ldots, x_{m})$ . Using the definition of $B^{\prime}$ we get that

$$
\begin{array}{l} \mathbb{P}[A \in B^{\prime}] = \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \max_{h \in \mathcal{H}} \mathbb{1}_{[\mathcal{D}(h) \geq \epsilon]} \mathbb{1}_{[| h \cap A_{0} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]} \\ \qquad \leq \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \max_{h \in \mathcal{H}} \mathbb{1}_{[| h \cap A_{0} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]}.\end{array}
$$

Now, let us define by $\mathcal{H}_{A}$ the efective number of different hypotheses on A, namely, $\mathcal{H}_{A} = \{h \cap A : h \in \mathcal{H}\}$ . It follows that

$$
\begin{array}{c} \mathbb{P}[A \in B^{\prime}] \leq \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \max_{h \in \mathcal{H}_{A}} \mathbb{1}_{[| h \cap A_{0} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]} \\ \leq \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \sum_{h \in \mathcal{H}_{A}} \mathbb{1}_{[| h \cap A_{0} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]}.\end{array}
$$

Let $J = \{\mathbf{j} \subset[2m] : | \mathbf{j} | = m\}$ . For any $\mathbf{j} \in J$ and $A = ( x _ { 1 } , \dots , x _ { 2 m } ) $ define $A_{\mathbf{j}} =(x_{j_{1}}, \dots, x_{j_{m}})$ . Since the elements of A are chosen $\mathrm{i.i.d.}$ , we have that for any $\textbf{j} \in \J$ and any function $f(A, A_{0})$ it holds that $\mathbb{E}_{A \sim \mathcal{D}^{2m}}[f(A, A_{0})] ~ =$ $\mathbb{E}_{A \sim \mathcal{D}^{2m}}[f(A, A_{\mathbf{j}})]$ . Since this holds for any j it also holds for the expectation of $\mathbf{j}$ chosen at random from J. In particular, it holds for the function $f(A, A_{0}) =$ $\begin{array}{r}{\sum_{h \in \mathcal{H}_{A}} \mathbb{1}_{[| h \cap A_{0} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]}} \end{array}$ . We therefore obtain that

$$
\begin{array}{c} \mathbb{P}[A \in B^{\prime}] \leq \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \underset{j \sim J}{\mathbb{E}} \sum_{h \in \mathcal{H}_{A}} \mathbb{1}_{[| h \cap A_{\mathbf{j}} | = 0]} \mathbb{1}_{[| h \cap A | \geq \alpha]} \\ = \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \sum_{h \in \mathcal{H}_{A}} \mathbb{1}_{[| h \cap A | \geq \alpha]} \underset{j \sim J}{\mathbb{E}} \mathbb{1}_{[| h \cap A_{\mathbf{j}} | = 0]}.\end{array}
$$

Now, fix some A s.t. $| h \cap A | \geq \alpha$ . Then, $\mathbb{E}_{j} \mathbb{1}_{[| h \cap A_{\mathbf{j}} | = 0]}$ is the probability that when choosing m balls from a bag with at least α red balls, we will never choose a red ball. This probability is at most

$$
(1 - \alpha /(2m))^{m} =(1 - \epsilon / 4)^{m} \leq e^{- \epsilon m / 4}.
$$

We therefore get that

$$
\mathbb{P}[A \in B^{\prime}] \leq \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} \sum_{h \in \mathcal{H}_{A}} e^{- \epsilon m / 4} \leq e^{- \epsilon m / 4} \underset{A \sim \mathcal{D}^{2m}}{\mathbb{E}} | \mathcal{H}_{A} |.
$$

Using the definition of the growth function we conclude the proof of Claim 2. Completing the Proof: By Sauer’s lemma we know that $\tau_{\mathcal{H}}(2m) \leq(2em / d)^{d}$ Combining this with the two claims we obtain that

$$
\mathbb{P}[S \in B] \leq 2(2em / d)^{d} e^{- \epsilon m / 4}.
$$

We would like the right-hand side of the inequality to be at most $\delta;$ that is,

$$
2(2em / d)^{d} e^{- \epsilon m / 4} \leq \delta.
$$

Rearranging, we obtain the requirement

$$
m \geq \frac{4}{\epsilon}(d \log(2em / d) + \log(2 / \delta)) = \frac{4d}{\epsilon} \log(m) + \frac{4}{\epsilon}(d \log(2e / d) + \log(2 / \delta).
$$

Using Lemma A.2, a sufficient condition for the preceding to hold is that

$$
m \geq \frac{16d}{\epsilon} \log \left(\frac{8d}{\epsilon}\right) + \frac{8}{\epsilon}(d \log(2e / d) + \log(2 / \delta).
$$

A sufficient condition for this is that

$$
\begin{array}{l} m \geq \frac{16d}{\epsilon} \log \left(\frac{8d}{\epsilon}\right) + \frac{16}{\epsilon}(d \log(2e / d) + \frac{1}{2} \log(2 / \delta) \\ = \frac{16d}{\epsilon} \left(\log \left(\frac{8d2e}{d \epsilon}\right)\right) + \frac{8}{\epsilon} \log(2 / \delta) \\ = \frac{8}{\epsilon} \left(2d \log \left(\frac{16e}{\epsilon}\right) + \log \left(\frac{2}{\delta}\right)\right).\end{array}
$$

and this concludes our proof.

## 28.3.1 From $\epsilon$-Nets to PAC Learnability

<sup>theorem</sup> 28.4 Let H be a hypothesis class over X with ${\mathrm{VCdim}}(\mathcal{H}) = d.$ . Let D be a distribution over X and let $c \in \mathcal H$ be a target hypothesis. Fix $\epsilon, \delta \in(0, 1)$ and let m be as defined in Theorem 28.3. Then, with probability of at least $1 - \delta$ over a choice of m i.i.d. instances from X with labels according to c we have that any ERM hypothesis has a true error of at most $\epsilon$.

Proof Define the class $\mathcal{H}^{c} = \{c \Delta h : h \in \mathcal{H}\}$ , where c $\Delta h =(h \setminus c) \cup(c \setminus h)$ . It is easy to verify that if some $A \subset{\mathcal{X}}$ is shattered by H then it is also shattered by $\mathcal{H}^{c}$ and vice versa. Hence, VCdim $(\mathcal{H}) = \operatorname{VCdim}(\mathcal{H}^{c})$ ). Therefore, using Theorem 28.3 we know that with probability of at least $1 - \delta.$ , the sample S is an $\epsilon$-net for $\mathcal{H}^{c}$ Note that $\begin{array}{r}{L_{\mathcal{D}}(h) = \mathcal{D}(h \Delta c)} \end{array}$ . Therefore, for any $h \in \mathcal H$ with $L_{\mathcal{D}}(h) \ge \epsilon$ we have that $|(h \Delta c) \cap S | > 0$ , which implies that h cannot be an ERM hypothesis, which concludes our proof. □

In Chapter 17 we have introduced the problem of multiclass categorization, in which the goal is to learn a predictor h : X → [k]. In this chapter we address PAC learnability of multiclass predictors with respect to the 0-1 loss. As in Chapter 6, the main goal of this chapter is to:

- Characterize which classes of multiclass hypotheses are learnable in the (multiclass) PAC model.

- Quantify the sample complexity of such hypothesis classes.

In view of the fundamental theorem of learning theory (Theorem 6.8), it is natural to seek a generalization of the VC dimension to multiclass hypothesis classes. In Section 29.1 we show such a generalization, called the Natarajan dimension, and state a generalization of the fundamental theorem based on the Natarajan dimension. Then, we demonstrate how to calculate the Natarajan dimension of several important hypothesis classes.

Recall that the main message of the fundamental theorem of learning theory is that a hypothesis class of binary classifiers is learnable (with respect to the 0-1 loss) if and only if it has the uniform convergence property, and then it is learnable by any ERM learner. In Chapter 13, Exercise 2, we have shown that this equivalence breaks down for a certain convex learning problem. The last section of this chapter is devoted to showing that the equivalence between learnability and uniform convergence breaks down even in multiclass problems with the 0-1 loss, which are very similar to binary classification. Indeed, we construct a hypothesis class which is learnable by a specific ERM learner, but for which other ERM learners might fail and the uniform convergence property does not hold.


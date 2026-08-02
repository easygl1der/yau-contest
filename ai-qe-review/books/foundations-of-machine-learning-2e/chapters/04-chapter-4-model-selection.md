---
title: "Chapter 4 \u2014 Model Selection"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 4
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 1800
source_line_end: 2208
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 3
caption_derived_image_alt: 3
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

# Chapter 4 — Model Selection

> [[../README|本书目录]] · [[03-chapter-3-rademacher-complexity-and-vc-dimension|上一章]] · [[05-chapter-5-support-vector-machines|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 1800–2208。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 1；different × 1；Differentiability × 1；efficient × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 4.1 Estimation and approximation errors

Let H be a family of functions mapping X to $\{- 1, + 1\}$ . The excess error of a hypothesis h chosen from H, that is the diference between its error $R(h)$ and the Bayes error $R^{*}$ , can be decomposed as follows:

$$
R(h) - R^{*} = \underbrace{\left(R(h) - \inf_{h \in \mathcal{H}} R(h)\right)}_{\text{estimation}} + \underbrace{\left(\inf_{h \in \mathcal{H}} R(h) - R^{*}\right)}_{\text{approximation}}.\tag{4.1}
$$

The first term is called the estimation error , the second term the approximation error. The estimation error depends on the hypothesis h selected. It measures the error of h with respect to the infimum of the errors achieved by hypotheses in H, or that of the best-in-class hypothesis $h^{*}$ when that infimum is reached. Note that the definition of agnostic PAC-learning is precisely based on the estimation error.

The approximation error measures how well the Bayes error can be approximated using H. It is a property of the hypothesis set H, a measure of its richness. For a more complex or richer hypothesis H, the approximation error tends to be smaller at the price of a larger estimation error. This is illustrated by Figure 4.1.

![Figure 4.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/dedb8ca9520a35cb8ce026eb007a5a7f26366fd0c0d81418a92e3a23f50b006b.jpg)  
Figure 4.1  
Illustration of the estimation error (in green) and approximation error (in orange). Here, it is assumed that there exists a best-in-class hypothesis, that is $h^{*}$ such that $R(h^{*}) = \operatorname{inf}_{h \in{\mathcal{H}}} R(h)$

Model selection consists of choosing H with a favorable trade-of between the approximation and estimation errors. Note, however, that the approximation error is not accessible, since in general the underlying distribution D needed to determine $R^{*}$ is not known. Even with various noise assumptions, estimating the approximation error is dificult. In contrast, the estimation error of an algorithm ${\mathcal{A}},$ that is, the estimation error of the hypothesis $h_{S}$ returned after training on a sample $S,$ can sometimes be bounded using generalization bounds as shown in the next section.

## 4.2 Empirical risk minimization (ERM)

A standard algorithm for which the estimation error can be bounded is Empirical Risk Minimization (ERM). ERM seeks to minimize the error on the training sample:<sup>4</sup>

$$
h_{S}^{\mathrm{ERM}} = \underset{h \in \mathcal{H}}{\operatorname{argmin}} \widehat{R}_{S}(h).\tag{4.2}
$$

Proposition 4.1 For any sample S, the following inequality holds for the hypothesis returned by ERM:

$$
\mathbb{P} \left[R(h_{S}^{\mathrm{ERM}}) - \inf_{h \in \mathcal{H}} R(h) > \epsilon \right] \leq \mathbb{P} \left[\sup_{h \in \mathcal{H}} | R(h) - \widehat{R}_{S}(h) | > \frac{\epsilon}{2} \right].\tag{4.3}
$$

Proof: By definition of ${\mathrm{inf}}_{h \in{\mathcal{H}}} R(h)$ , for any $\epsilon > 0$ , there exists $h_{\epsilon}$ such that $\begin{array}{r}{R(h_{\epsilon}) \leq \operatorname{inf}_{h \in \mathcal{H}} R(h) + \epsilon.} \end{array}$ Thus, using $\widehat{R}_{S}(h_{S}^{\mathrm{ERM}}) \leq \widehat{R}_{S}(h_{\epsilon})$ , which holds by the

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/292adb398f7a0c74fb1392407900008db76c713c72be756d22deff9917c906d6.jpg)  
Figure 4.2

Illustration of the decomposition of a rich family $\textstyle{\mathcal{H}} = \bigcup_{\gamma \in \Gamma}{\mathcal{H}}_{\gamma}$

definition of the algorithm, we can write

$$
\begin{array}{l} R(h_{S}^{\text{ERM}}) - \inf_{h \in \mathcal{H}} R(h) = R(h_{S}^{\text{ERM}}) - R(h_{\epsilon}) + R(h_{\epsilon}) - \inf_{h \in \mathcal{H}} R(h) \\ \qquad \leq R(h_{S}^{\text{ERM}}) - R(h_{\epsilon}) + \epsilon \\ \qquad = R(h_{S}^{\text{ERM}}) - \widehat{R}_{S}(h_{S}^{\text{ERM}}) + \widehat{R}_{S}(h_{S}^{\text{ERM}}) - R(h_{\epsilon}) + \epsilon \\ \qquad \leq R(h_{S}^{\text{ERM}}) - \widehat{R}_{S}(h_{S}^{\text{ERM}}) + \widehat{R}_{S}(h_{\epsilon}) - R(h_{\epsilon}) + \epsilon \\ \qquad \leq 2 \sup_{h \in \mathcal{H}} | R(h) - \widehat{R}_{S}(h) | + \epsilon.\end{array}
$$

Since the inequality holds for all $\epsilon > 0$ , it implies the following:

$$
R(h_{S}^{\mathrm{ERM}}) - \inf_{h \in \mathcal{H}} R(h) \leq 2 \sup_{h \in \mathcal{H}} | R(h) - \widehat{R}_{S}(h) |,
$$

which concludes the proof.

The right-hand side of (4.3) can be upper-bounded using the generalization bounds presented in the previous chapter in terms of the Rademacher complexity, the growth function, or the VC-dimension of H. In particular, it can be bounded by $\bar{2} e^{- 2m[\epsilon - \Re_{m}(\mathcal{H})]^{2}}$ . Thus, when H admits a favorable Rademacher complexity, for example a finite VC-dimension, for a suficiently large sample, with high probability, the estimation error is guaranteed to be small. Nevertheless, the performance of ERM is typically very poor. This is because the algorithm disregards the complexity of the hypothesis set H: in practice, either H is not complex enough, in which case the approximation error can be very large, or H is very rich, in which case the bound on the estimation error becomes very loose. Additionally, in many cases, determining the ERM solution is computationally intractable. For example, finding a linear hypothesis with the smallest error on the training sample is NP-hard, as a function of the dimension of the space.

![Figure 4.3](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/918e3800ef3adfbe6eb5b9e0f62c71056c10a929cdd5f5450b723293e5c07892.jpg)  
Figure 4.3  
Choice of $\gamma^{*}$ with the most favorable trade-of between estimation and approximation errors.

## 4.3 Structural risk minimization (SRM)

In the previous section, we showed that the estimation error can be sometimes bounded or estimated. But, since the approximation error cannot be estimated, how should we choose H? One way to proceed is to choose a very complex family H with no approximation error or a very small one. H may be too rich for generalization bounds to hold for H, but suppose we can decompose $\mathcal{H}$ as a union of increasingly complex hypothesis sets $\mathcal{H}_{\gamma}$ , that is $\begin{array}{r}{\mathcal{H} = \bigcup_{\gamma \in \Gamma} \mathcal{H}_{\gamma}} \end{array}$ , with the complexity of $\mathcal{\mathrm{H}}_{\gamma}$ increasing with $\gamma_{:}$ , for some set Γ. Figure 4.2 illustrates this decomposition. The problem then consists of selecting the parameter $\gamma^{\ast} \in \Gamma$ and thus the hypothesis set $\mathcal{\mathcal{H}}_{\gamma^{*}}$ with the most favorable trade-of between estimation and approximation errors. Since these quantities are not known, instead, as illustrated by Figure 4.3, a uniform upper bound on their sum, the excess error (also called excess risk), can be used.

This is precisely the idea behind the Structural Risk Minimization (SRM) method. For SRM, H is assumed to be decomposable into a countable set, thus, we will write its decomposition as $\begin{array}{r}{\mathcal{H} = \bigcup_{k > 1} \mathcal{H}_{k}} \end{array}$ . Additionally, the hypothesis sets $\mathcal{H}_{k}$ are assumed to be nested: $\mathcal{H}_{k} \subset \mathcal{H}_{k + 1}^{-}$ for all $k \geq 1$ . However, many of the results presented in this section also hold for non-nested hypothesis sets. Thus, we will not make use of that assumption, unless explicitly specified. SRM consists of choosing the index $k^{*} \geq 1$ and the ERM hypothesis $h$ in $\mathcal{H}_{k}$ that minimize an upper bound on the excess error.

![Figure 4.4](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/69e53739db3d1217be37a1ef7ce6390d57387cd98ff4c5952636c2c22b2c6226.jpg)  
Figure 4.4  
Illustration of structural risk minimization. The plots of three errors are shown as a function of the index k. Clearly, as $k,$ or equivalently the complexity the hypothesis set $\mathcal{H}_{k}$ , increases, the training error decreases, while the penalty term increases. SRM selects the hypothesis minimizing a bound on the generalization error, which is a sum of the empirical error and the penalty term.

As we shall see, the following learning bound holds for all $h \in{\mathcal{H}}.$ : for any $\delta > 0.$ with probability at least $1 - \delta$ over the draw of a sample $S$ of size $m$ from $\Phi^{m}$ , for all $h \in \mathcal{H}_{k}$ and $k \geq 1$ ，

$$
R(h) \leq \widehat{R}_{S}(h) + \mathfrak{R}_{m}(\mathcal{H}_{k(h)}) + \sqrt{\frac{\log k}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

Thus, to minimize the resulting bound on the excess error $(R(h) - R^{*})$ , the index k and the hypothesis $h \in \mathcal{H}_{k}$ should be chosen to minimize the following objective function:

$$
F_{k}(h) = \widehat{R}_{S}(h) + \mathfrak{R}_{m}(\mathcal{H}_{k}) + \sqrt{\frac{\log k}{m}}.
$$

This is precisely the definition of the SRM solution $h_{S}^{\mathrm{SRM}}$

$$
h_{S}^{\mathrm{SRM}} = \underset{k \geq 1, h \in \mathcal{H}_{k}}{\operatorname{argmin}} F_{k}(h) = \underset{k \geq 1, h \in \mathcal{H}_{k}}{\operatorname{argmin}} \widehat{R}_{S}(h) + R_{m}(\mathcal{H}_{k}) + \sqrt{\frac{\log k}{m}}.\tag{4.4}
$$

Thus, SRM identifies an optimal index $k^{*}$ and therefore hypothesis set $\mathcal{H}_{k^{*}}$ , and returns the ERM solution based on that hypothesis set. Figure 4.4 further illustrates the selection of the index $k^{*}$ and hypothesis set $\mathcal{H}_{k}.$ <sub>∗</sub> by SRM by minimizing an upper bound on the sum of the training error and the penalty term $R_{m}(\mathcal{H}_{k}) + \sqrt{\log k / m}$ The following theorem shows that the SRM solution benefits from a strong learning guarantee. For any $h \in{\mathcal{H}}$ , we will denote by $\mathcal{H}_{k(h)}$ the least complex hypothesis set among the $\mathcal{H}_{k} s$ that contain $h.$

Theorem 4.2 (SRM Learning guarantee) For any $\delta > 0$ , with probability at least $1 - \delta$ over the draw of an i.i.d. sample S of size m from $\Phi^{m}$ , the generalization error of the hypothesis $h_{S}^{\mathrm{SRM}}$ returned by the SRM method is bounded as follows:

$$
R(h_{S}^{\mathrm{SRM}}) \leq \inf_{h \in \mathcal{H}} \left(R(h) + 2 \Re_{m}(\mathcal{H}_{k(h)}) + \sqrt{\frac{\log k(h)}{m}}\right) + \sqrt{\frac{2 \log \frac{3}{\delta}}{m}}.
$$

Proof: Observe first that, by the union bound, the following general inequality holds:

$$
\begin{array}{l} \mathbb{P} \left[\sup_{h \in \mathcal{H}} R(h) - F_{k(h)}(h) > \epsilon \right] \\ \qquad = \mathbb{P} \left[\sup_{k \geq 1} \sup_{h \in \mathcal{H}_{k}} R(h) - F_{k}(h) > \epsilon \right] \\ \qquad \leq \sum_{k = 1}^{\infty} \mathbb{P} \left[\sup_{h \in \mathcal{H}_{k}} R(h) - F_{k}(h) > \epsilon \right] \\ \qquad = \sum_{k = 1}^{\infty} \mathbb{P} \left[\sup_{h \in \mathcal{H}_{k}} R(h) - \widehat{R}_{S}(h) - \mathfrak{R}_{m}(\mathcal{H}_{k}) > \epsilon + \sqrt{\frac{\log k}{m}} \right] \\ \qquad \leq \sum_{k = 1}^{\infty} \exp \left(- 2m \Big[\epsilon + \sqrt{\frac{\log k}{m}} \Big]^{2}\right) \\ \qquad \leq \sum_{k = 1}^{\infty} e^{- 2m \epsilon^{2}} e^{- 2 \log k} \\ \qquad = e^{- 2m \epsilon^{2}} \sum_{k = 1}^{\infty} \frac{1}{k^{2}} = \frac{\pi^{2}}{6} e^{- 2m \epsilon^{2}} \leq 2e^{- 2m \epsilon^{2}}.\end{array}\tag{4.5}
$$

Next, for any two random variables $X_{1}$ and $X_{2}$ , if $X_{1} + X_{2} > \epsilon.$ , then either $X_{1}$ or $X_{2}$ must be larger than $\epsilon / 2$ . In view of that, by the union bound, $\mathbb{P}[X_{1} + X_{2} > \epsilon] \le$ $\mathbb{P}[X_{1} > \frac{\epsilon}{2}] + \mathbb{P}[X_{2} > \frac{\epsilon}{2}]$ . Using this inequality, inequality (4.5), and the inequality $F_{k(h_{S}^{\mathrm{SRM}})}(h_{S}^{\mathrm{SRM}}) \leq F_{k(h)}(h)$ , which holds for all $h \in{\mathcal{H}}$ , by definition of $h_{S}^{\mathrm{SRM}}$ , we

can write, for any $h \in{\mathcal{H}}$

$$
\begin{array}{rl} &{\mathbb{P} \left[R(h_{S}^{\mathrm{SRM}}) - R(h) - 2 \Re_{m}(\mathcal{H}_{k(h)}) - \sqrt{\frac{\log k(h)}{m}} > \epsilon \right]} \\ &{\quad \leq \mathbb{P} \left[R(h_{S}^{\mathrm{SRM}}) - F_{k(h_{S}^{\mathrm{SRM}})}(h_{S}^{\mathrm{SRM}}) > \frac{\epsilon}{2} \right]} \\ &{\qquad + \mathbb{P} \left[F_{k(h_{S}^{\mathrm{SRM}})}(h_{S}^{\mathrm{SRM}}) - R(h) - 2 \Re_{m}(\mathcal{H}_{k(h)}) - \sqrt{\frac{\log k(h)}{m}} > \frac{\epsilon}{2} \right]} \\ &{\quad \leq 2e^{- \frac{m \epsilon^{2}}{2}} + \mathbb{P} \left[F_{k(h)}(h) - R(h) - 2 \Re_{m}(\mathcal{H}_{k(h)}) - \sqrt{\frac{\log k(h)}{m}} > \frac{\epsilon}{2} \right]} \\ &{\quad = 2e^{- \frac{m \epsilon^{2}}{2}} + \mathbb{P} \left[\widehat{R}_{S}(h) - R(h) - \Re_{m}(\mathcal{H}_{k(h)}) > \frac{\epsilon}{2} \right]} \\ &{\quad = 2e^{- \frac{m \epsilon^{2}}{2}} + e^{- \frac{m \epsilon^{2}}{2}} = 3e^{- \frac{m \epsilon^{2}}{2}}.} \end{array}
$$

Setting the right-hand side to be equal to $\delta$ completes the proof.

The learning guarantee just proven for SRM is remarkable. To simplify its discussion, let us assume that there exists $h^{*}$ such that $R(h^{*}) = \operatorname{inf}_{h \in{\mathcal{H}}} R(h)$ , that is, that there exists a best-in-class classifier $h^{\ast} \in \mathcal{H}$ . Then, the theorem implies in particular that, with probability at least $1 - \delta$ , the following inequality holds for all $h \in{\mathcal{H}}$

$$
R(h_{S}^{\mathrm{SRM}}) \leq R(h^{*}) + 2 \mathfrak{R}_{m}(\mathcal{H}_{k(h^{*})}) + \sqrt{\frac{\log k(h^{*})}{m}} + \sqrt{\frac{2 \log \frac{3}{\delta}}{m}}.\tag{4.6}
$$

Observe that, remarkably, this bound is similar to the estimation error bound for $\mathcal{H}_{k(h^{*})}$ : it difers from it only by the term $\sqrt{\log{k(h^{*})} / m}$ . Thus, modulo that term, the guarantee for SRM is as favorable as the one we would have obtained, had an oracle informed us of the index $k(h^{*})$ of the best-in-class classifier’s hypothesis set.

Furthermore, observe that when H is rich enough that $R(h^{*})$ is close to the Bayes error, the learning bound (4.6) is approximately a bound on the excess error of the SRM solution. Note that, if for some $k_{0}$ , the empirical error of the ERM solution for $\mathcal{\mathrm{H}}_{k_{0}}$ is zero, which holds in particular if $\mathcal{H}_{k_{0}}$ contains the Bayes error, then, we have $\begin{array}{r}{\operatorname{min}_{h \in \mathcal{H}_{k}} F_{k_{0}}(h) \le \operatorname{min}_{h \in \mathcal{H}_{k}} F_{k}(h)} \end{array}$ for all $k > k_{0}$ and only finitely many indices need to be considered in SRM.

Assume more generally that if $\begin{array}{r}{\operatorname{min}_{h \in \mathcal{H}_{k}} F_{k}(h) \le \operatorname{min}_{h \in \mathcal{H}_{k + 1}} F_{k}(h)} \end{array}$ for some $k,$ then indices beyond $k + 1$ need not be inspected. This property may hold for example if the empirical error cannot be further improved after some index k. In that case, the minimizing index $k^{*}$ can be determined via a binary search in the interval $[1, k_{\mathrm{max}}]$ , given some maximum value $k_{\operatorname{max}}.\quad k_{\operatorname{max}}$ itself can be found by inspecting min $\mathfrak{l}_{h \in \mathcal{H}_{2^{n}}} F_{k}(h)$ for exponentially growing indices $2^{n}, n \geq 1$ , and setting $k_{\operatorname{max}{}} = 2^{n}$ for n such that mi $\begin{array}{r}{n_{h \in \mathcal{H}_{2^{n}}} F_{k}(h) \le \operatorname{min}_{h \in \mathcal{H}_{2^{n + 1}}} F_{k}(h)} \end{array}$ . The number of ERM computations needed to find $k_{\mathrm{max}}$ is in $O(n) = O(\log k_{\operatorname{max}})$ and similarly the number of ERM computations due to the binary search is in $O(\log k_{\mathrm{max}})$ . Thus, if n is the smallest integer such that $k^{*} < 2^{n}$ , the overall number of ERM computations is in $O(\log k^{*})$

While it benefits from a very favorable guarantee, SRM admits several drawbacks. First, the decomposability of H into countably many hypothesis sets, each with a converging Rademacher complexity, remains a strong assumption. As an example, the family of all measurable functions cannot be written as a union of countably many hypothesis sets with finite VC-dimension. Thus, the choice of H or that of the hypothesis sets $\mathcal{H}_{k}$ is a key component of SRM. Second, and this is the main disadvantage of SRM, the method is typically computationally intractable: for most hypothesis sets, finding the solution of ERM is NP-hard and in general SRM requires determining that solution for a large number of indices k.

## 4.4 Cross-validation

An alternative method for model selection, cross-validation, consists of using some fraction of the training sample as a validation set to select a hypothesis set $\mathcal{H}_{k}$ This is in contrast with the SRM model which relies on a theoretical learning bound assigning a penalty to each hypothesis set. In this section, we analyze the crossvalidation method and compare its performance to that of SRM.

As in the previous section, let $(\mathcal{H}_{k})_{k \geq 1}$ be a countable sequence of hypothesis sets with increasing complexities. The cross-validation (CV) solution is obtained as follows. Let S be an i.i.d. labeled sample of size m. S is divided into a sample $S_{1}$ of size $(1 - \alpha)$ m and a sample $S_{2}$ of size αm, with $\alpha \in(0, 1)$ typically chosen to be relatively small. $S_{1}$ is reserved for training, $S_{2}$ for validation. For any $k \in \mathbb N$ , let $h_{S_{1}, k}^{\mathrm{ERM}}$ denote the solution of ERM run on $S_{1}$ using the hypothesis set $\mathcal{H}_{k}$ . The hypothesis $h_{S}^{\mathrm{CV}}$ returned by cross-validation is the ERM solution $h_{S_{1}, k}^{\mathrm{ERM}}$ with the best performance on $S_{2}$ :

$$
h_{S}^{\mathrm{CV}} = \operatorname{argmin}_{h \in \left\{h_{S_{1}, k}^{\mathrm{ERM}}: k \geq 1 \right\}} \widehat{R}_{S_{2}}(h).\tag{4.7}
$$

The following general result will help us derive learning guarantees for cross-validation.

Proposition 4.3 For any $\alpha > 0$ and any sample size $m \geq 1$ , the following general inequality holds:

$$
\mathbb{P} \left[\sup_{k \geq 1} \left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \right] \leq 4e^{- 2 \alpha m \epsilon^{2}}.
$$

## 4.4 Cross-validation

Proof: By the union bound, we can write

$$
\begin{array}{l} \mathbb{P} \left[\sup_{k \geq 1} \left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \right] \\ \leq \sum_{k = 1}^{\infty} \mathbb{P} \left[\left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \right] \\ = \sum_{k = 1}^{\infty} \mathbb{E} \left[\mathbb{P} \left[\left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \bigg | S_{1} \right] \right].\end{array}\tag{4.8}
$$

The hypothesis $h_{S_{1}, k}^{\mathrm{ERM}}$ is fixed conditioned on $S_{1}$ . Furthermore, the sample $S_{2}$ is independent from $S_{1}$ . Therefore, by Hoefding’s inequality, we can bound the conditional probability as follows:

$$
\begin{array}{rl} \mathbb{P} \left[\left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \bigg | S_{1} \right] & \leq 2e^{- 2 \alpha m \left(\epsilon + \sqrt{\frac{\log k}{\alpha m}}\right)^{2}}.\\ & \leq 2e^{- 2 \alpha m \epsilon^{2} - 2 \log k} \\ & = \frac{2}{k^{2}} e^{- 2 \alpha m \epsilon^{2}}.\end{array}
$$

Plugging in the right-hand side of this bound in (4.8) and summing over k yields

$$
\mathbb{P} \left[\sup_{k \geq 1} \left| R(h_{S_{1}, k}^{\mathrm{ERM}}) - \widehat{R}_{S_{2}}(h_{S_{1}, k}^{\mathrm{ERM}}) \right| > \epsilon + \sqrt{\frac{\log k}{\alpha m}} \right] \leq \frac{\pi^{2}}{3} e^{- 2 \alpha m \epsilon^{2}} < 4e^{- 2 \alpha m \epsilon^{2}},
$$

which completes the proof.

Let $R \big(h_{S_{1}}^{\mathrm{SRM}} \big)$ be the generalization error of the SRM solution using a sample $S_{1}$ of size $(1 - \alpha m)$ and $R(h_{S}^{\mathrm{CV}}, S)$ the generalization error of the cross-validation solution using a sample S of size m. Then, using Proposition 4.3, the following learning guarantee can be derived which compares the error of the CV method to that of SRM.

Theorem 4.4 (Cross-validation versus SRM) For any $\delta > 0$ , with probability at least $1 - \delta$ , the following holds:

$$
R(h_{S}^{\mathrm{CV}}) - R(h_{S_{1}}^{\mathrm{SRM}}) \leq 2 \sqrt{\frac{\log \max(k(h_{S}^{\mathrm{CV}}), k(h_{S_{1}}^{\mathrm{SRM}}))}{\alpha m}} + 2 \sqrt{\frac{\log \frac{4}{\delta}}{2 \alpha m}},
$$

where, for any $h, k(h)$ denotes the smallest index of a hypothesis set containing $h$ . Proof: By Proposition 4.3 and Theorem 4.2, using the property of $h_{S}^{\mathrm{CV}}$ as a minimizer, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following inequalities

hold:

$$
\begin{array}{l} R(h_{S}^{\mathrm{CV}}) \leq \widehat{R}_{S_{2}}(h_{S}^{\mathrm{CV}}) + \sqrt{\frac{\log(k(h_{S}^{\mathrm{CV}}))}{\alpha m}} + \sqrt{\frac{\log \frac{4}{\delta}}{2 \alpha m}} \\ \quad \leq \widehat{R}_{S_{2}}(h_{S_{1}}^{\mathrm{SRM}}) + \sqrt{\frac{\log(k(h_{S}^{\mathrm{CV}}))}{\alpha m}} + \sqrt{\frac{\log \frac{4}{\delta}}{2 \alpha m}} \\ \quad \leq R(h_{S_{1}}^{\mathrm{SRM}}) + \sqrt{\frac{\log(k(h_{S}^{\mathrm{CV}}))}{\alpha m}} + \sqrt{\frac{\log(k(h_{S_{1}}^{\mathrm{SRM}}))}{\alpha m}} + 2 \sqrt{\frac{\log \frac{4}{\delta}}{2 \alpha m}} \\ \quad \leq R(h_{S_{1}}^{\mathrm{SRM}}) + 2 \sqrt{\frac{\log(\max(k(h_{S}^{\mathrm{CV}}), k(h_{S_{1}}^{\mathrm{SRM}}))}{\alpha m}} + 2 \sqrt{\frac{\log \frac{4}{\delta}}{2 \alpha m}}, \end{array}
$$

which completes the proof.

The learning guarantee just proven shows that, with high probability, the generalization error of the CV solution for a sample of size m is close to that of the SRM solution for a sample of size $(1 - \alpha) m$ . For α relatively small, this suggests a guarantee similar to that of SRM, which, as previously discussed, is very favorable. However, in some unfavorable regimes, an algorithm (here SRM) trained on $(1 - \alpha) m$ points may have a significantly worse performance than when trained on m points (avoiding this phase transition issue is one of the main motivations behind the use of the n-fold cross-validation method in practice, see section 4.5). Thus, the bound suggests in fact a trade-of: α should be chosen suficiently small to avoid the unfavorable regimes just mentioned and yet suficiently large for the right-hand side of the bound to be small and thus informative.

The learning bound for CV can be made more explicit in some cases in practice. Assume for example that the hypothesis sets $\mathcal{H}_{k}$ are nested and that the empirical errors of the ERM solutions $h_{S_{1}, k}^{\mathrm{ERM}}$ are decreasing before reaching zero: for any k, $\widehat{R}_{S_{1}}(h_{S_{1}, k + 1}^{\mathrm{ERM}}) < \widehat{R}_{S_{1}}(h_{S_{1}, k}^{\mathrm{ERM}})$ for all k such that $\widehat{R}_{S_{1}}(h_{S_{1}, k}^{\mathrm{ERM}}) > 0$ and $\widehat{R}_{S_{1}}(h_{S_{1}, k + 1}^{\mathrm{ERM}}) \leq$ $\widehat{R}_{S_{1}}(h_{S_{1}, k}^{\mathrm{ERM}})$ otherwise. Observe that $\widehat{R}_{S_{1}}(h_{S_{1}, k}^{\mathrm{ERM}}) > 0$ implies at least one error for $h_{S_{1}, k}^{\mathrm{ERM}}$ , therefore $\widehat{R}_{S_{1}}(h_{S_{1}, k}^{\mathrm{ERM}}) > \frac{1}{m}$ . In view of that, we must then have $\widehat{R}_{S_{1}}(h_{S_{1}, n}^{\mathrm{ERM}}) =$ 0 for all $n \geq m + 1$ . Thus, we have $h_{S_{1}, n}^{\mathrm{ERM}} = h_{S_{1}, m + 1}^{\mathrm{ERM}}$ for all $n \geq m + 1$ and we can assume that $k(f_{CV}) \leq m + 1$ . Since the complexity of $\mathcal{H}_{k}$ increases with k we also have $k(f_{SRM}) \leq m + 1$ . In view of that, we obtain the following more explicit learning bound for cross-validation:

$$
R(f_{CV}, S) - R(f_{SRM}, S_{1}) \leq 2 \sqrt{\frac{\log(\frac{4}{\delta})}{2 \alpha m}} + 2 \sqrt{\frac{\log(m + 1)}{\alpha m}}.
$$

## 4.5 n-Fold cross-validation

In practice, the amount of labeled data available is often too small to set aside a validation sample since that would leave an insuficient amount of training data. Instead, a widely adopted method known as $\n - fold$ cross-validation is used to exploit the labeled data both for model selection and for training.

Let θ denote the vector of free parameters of the algorithm. For a fixed value of $\theta,$ the method consists of first randomly partitioning a given sample $S$ of m labeled examples into n subsamples, or folds. The ith fold is thus a labeled sample $((x_{i1}, y_{i1}), \dots,(x_{im_{i}}, y_{im_{i}}))$ of size $m_{i}$ . Then, for any $i \in[n]$ , the learning algorithm is trained on all but the ith fold to generate a hypothesis $h_{i}$ , and the performance of $h_{i}$ is tested on the ith fold, as illustrated in figure 4.5a. The parameter value $\pmb{\theta}$ is evaluated based on the average error of the hypotheses $h_{i}$ , which is called the cross-validation error . This quantity is denoted by $\widehat{R}_{\mathrm{CV}}(\pmb{\theta})$ and defined by

$$
\widehat{R}_{\mathrm{CV}}(\pmb{\theta}) = \frac{1}{n} \sum_{i = 1}^{n} \underbrace{\frac{1}{m_{i}} \sum_{j = 1}^{m_{i}} L(h_{i}(x_{ij}), y_{ij})}_{\text{errorofh_{i} ontheithfold}}.
$$

The folds are generally chosen to have equal size, that is $m_{i} = m / n$ for all $i \in[n]$ How should $n$ be chosen? The appropriate choice is subject to a trade-of. For a large n, each training sample used in n-fold cross-validation has size $m - m / n =$ $m(1 - 1 / n)$ (illustrated by the right vertical red line in figure 4.5b), which is close to m, the size of the full sample, and also implies all training samples are quite similar. At the same time, the ith fold used to measure the error is relatively small and thus the cross-validation error tends to have a small bias but a large variance. In contrast, smaller values of n lead to more diverse training samples but their size (shown by the left vertical red line in figure 4.5b) is significantly less than m. In this regime, the ith fold is relatively large and thus the cross-validation error tends to have a smaller variance but a larger bias.

In applications, n is typically chosen to be 5 or 10. n-fold cross-validation is used as follows in model selection. The full labeled data is first split into a training and a test sample. The training sample of size m is then used to compute the $n -$ fold cross-validation error $\widehat{R}_{\mathrm{CV}}(\pmb{\theta})$ for a small number of possible values of $\pmb{\theta}.$ . The free parameter $\pmb \theta$ is next set to the value $\pmb{\theta}_{0}$ for which $\widehat{R}_{\mathrm{CV}}(\pmb{\theta})$ is smallest and the algorithm is trained with the parameter setting $\pmb{\theta}_{0}$ over the full training sample of size m. Its performance is evaluated on the test sample as already described in the previous section.

The special case of n-fold cross-validation where $n = m$ is called leave-one-out cross-validation, since at each iteration exactly one instance is left out of the training sample. As shown in chapter 5, the average leave-one-out error is an approximately unbiased estimate of the average error of an algorithm and can be used to derive simple guarantees for some algorithms. In general, the leave-one-out error is very costly to compute, since it requires training m times on samples of size m 1, but for some algorithms it admits a very efficient computation (see exercise 11.9).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/7be1d75b14de9d6c14bdfc56d3b68160ada8df6f1008987ce30471b8396da85d.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/f5d59bed963b8a29271b94880e5de166f310b3445bf2bffc97976f6c97a5d9c5.jpg)  
(b)  
Figure 4.5  
n-fold cross-validation. (a) Illustration of the partitioning of the training data into 5 folds. (b) Typical plot of a classifier’s prediction error as a function of the size of the training sample m: the error decreases as a function of the number of training points. The red line on the left side marks the region for small values of n, while the red line on the right side marks the region for large values of n.

In addition to model selection, n-fold cross-validation is also commonly used for performance evaluation. In that case, for a fixed parameter setting θ, the full labeled sample is divided into n random folds with no distinction between training and test samples. The performance reported is the n-fold cross-validation error on the full sample as well as the standard deviation of the errors measured on each fold.

## 4.6 Regularization-based algorithms

A broad family of algorithms inspired by the SRM method is that of regularizationbased algorithm. This consists of selecting a very complex family H that is an uncountable union of nested hypothesis sets $\begin{array}{r}{\mathcal{H}_{\gamma} \colon \mathcal{H} = \bigcup_{\gamma > 0} \mathcal{H}_{\gamma}} \end{array}$ . H is often chosen to be dense in the space of continuous functions over X. For example, H may be chosen to be the set of all linear functions in some high-dimensional space and $\mathcal{\mathrm{H}}_{\gamma}$ the subset of those functions whose norm is bounded by $\gamma \colon { \mathcal { H } } _ { \gamma } = \{ x \mapsto $ $\mathbf{w} \cdot \pmb{\Phi}(x) \colon \| \mathbf{w} \| \leq \gamma\}$ . For some choices of Φ and the high-dimensional space, it can be shown that H is indeed dense in the space of continuous functions over X.

Given a labeled sample $S,$ the extension of the SRM method to an uncountable union would then suggest selecting h based on the following optimization problem:

$$
\operatorname{argmin}_{\gamma > 0, h \in H_{\gamma}} \widehat{R}_{S}(h) + \mathfrak{R}_{m}(\mathcal{H}_{\gamma}) + \sqrt{\frac{\log \gamma}{m}},
$$

where other penalty terms $\mathrm{pen}(\gamma, m)$ can be chosen in lieu of the specific choice $\begin{array}{r}{\mathrm{pen}(\gamma, m) = \Re_{m}(\mathcal{H}_{\gamma}) + \sqrt{\frac{\log{\gamma}}{m}}} \end{array}$ . Often, there exists a function $\mathcal{R} \colon \mathcal{H} \mathbb{R}$ such that, for any $\gamma > 0$ , the constrained optimization problem argmin $\gamma > 0, h \in H_{\gamma} \ \widehat{R}_{S}(h) +$ $\mathrm{pen}(\gamma, m)$ can be equivalently written as the unconstrained optimization problem

$$
\operatorname{argmin}_{h \in \mathcal{H}} \widehat{R}_{S}(h) + \lambda \mathcal{R}(h),
$$

for some $\lambda > 0.\ \mathcal{R}(h)$ is called a regularization term and $\lambda > 0$ is treated as a hyperparameter since its optimal value is often not known. For most algorithms, the regularization term $\mathcal{R}(h)$ is chosen to be an increasing function of $\| h \|$ for some choice of the norm , when H is the subset of a Hilbert space. The variable λ is often called a regularization parameter . Larger values of λ further penalize more complex hypotheses, while, for λ close or equal to zero, the regularization term has no efect and the algorithm coincides with ERM. In practice, λ is typically selected via cross-validation or using n-fold cross-validation.

When the regularization term is chosen to be $\| h \|_{p}$ for some choice of the norm and $p \geq 1$ , then it is a convex function of h, since any norm is convex. However, for the zero-one loss, the first term of the objective function is non-convex, thereby making the optimization problem computationally hard. In practice, most regularization-based algorithms instead use a convex upper bound on the zero-one loss and replace the empirical zero-one term with the empirical value of that convex surrogate. The resulting optimization problem is then convex and therefore admits more efficient solutions than SRM. The next section studies the properties of such convex surrogate losses.

## 4.7 Convex surrogate losses

The guarantees for the estimation error that we presented in previous sections hold either for ERM or for SRM, which itself is defined in terms of ERM. However, as already mentioned, for many choices of the hypothesis set H, including that of linear functions, solving the ERM optimization problem is NP-hard mainly because the zero-one loss function is not convex. One common method for addressing this problem consists of using a convex surrogate loss function that upper bounds the zero-one loss. This section analyzes learning guarantees for such surrogate losses in terms of the original loss.

The hypotheses we consider are real-valued functions $h \colon \mathcal{X} \mathbb{R}$ . The sign of h defines a binary classifier $f_{h} \colon \mathcal{X} \to \{- 1, + 1\}$ defined for all $x \in{\mathfrak{X}}$ by

$$
f_{h}(x) = \left\{\begin{array}{ll} + 1 & \text{if h(x)\geq 0} \\ - 1 & \text{if h(x)< 0.} \end{array} \right.
$$

The loss or error of h at point $(x, y) \in \mathcal{X} \times \{- 1, + 1\}$ is defined as the binary classification error of $f_{h}$ :

$$
1_{f_{h}(x) \neq y} = 1_{yh(x) < 0} + 1_{h(x) = 0 \land y = - 1} \leq 1_{yh(x) \leq 0}.
$$

We will denote by $R(h)$ the expected error of h: $R(h) = \mathbb{E}_{(x, y) \sim \mathbb{D}} \left[1_{f_{h}(x) \neq y} \right]$ . For any $x \in{\mathcal{X}}$ , let $\eta(x)$ denote $\eta(x) = \mathbb{P}[y = + 1 | x]$ and let $\mathcal{D}_{\mathcal{X}}$ denote the marginal distribution over X. Then, for any h, we can write

$$
\begin{array}{rl} & R(h) = \underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[1_{f_{h}(x) \neq y} \right] \\ & \quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\eta(x) 1_{h(x) < 0} +(1 - \eta(x)) 1_{h(x) > 0} +(1 - \eta(x)) 1_{h(x) = 0} \right] \\ & \quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\eta(x) 1_{h(x) < 0} +(1 - \eta(x)) 1_{h(x) \geq 0} \right].\end{array}
$$

In view of that, the Bayes classifier can be defined as assigning label +1 to x when $\eta(x) \geq{\textstyle \frac{1}{2}}, - 1$ otherwise. It can therefore be induced by the function $h^{*}$ defined by

$$
h^{*}(x) = \eta(x) - \frac{1}{2}.\tag{4.9}
$$

We will refer to $h^{*} \colon \mathcal{X} \mathbb{R}$ as the Bayes scoring function and will denote by $R^{*}$ the error of the Bayes classifier or Bayes scoring function: $R^{*} = R(h^{*})$

Lemma 4.5 The excess error of any hypothesis $h \colon \mathcal{X} \mathbb{R}$ can be expressed as follows in terms $of \eta$ and the Bayes scoring function $h^{*}$ :

$$
R(h) - R^{*} = 2 \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[| h^{*}(x) | 1_{h(x) h^{*}(x) \leq 0} \right].
$$

Proof: For any $h,$ we can write

$$
\begin{array}{rl} &{R(h) = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\eta(x) 1_{h(x) < 0} +(1 - \eta(x)) 1_{h(x) \geq 0} \right]} \\ &{\quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\eta(x) 1_{h(x) < 0} +(1 - \eta(x))(1 - 1_{h(x) < 0}) \right]} \\ &{\quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[[2 \eta(x) - 1] 1_{h(x) < 0} +(1 - \eta(x)) \right]} \\ &{\quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[2h^{*}(x) 1_{h(x) < 0} +(1 - \eta(x)) \right],} \end{array}
$$

where we used for the last step equation (4.9). In view of that, for any h, the following holds:

$$
\begin{array}{rl} & R(h) - R(h^{*}) = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[2[h^{*}(x)](1_{h(x) \leq 0} - 1_{h^{*}(x) \leq 0}) \right] \\ & \quad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[2[h^{*}(x)] \mathrm{sgn}(h^{*}(x)) 1_{(h(x) h^{*}(x) \leq 0) \land((h(x), h^{*}(x)) \neq(0, 0))} \right] \\ & \quad = 2 \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[| h^{*}(x) | 1_{h(x) h^{*}(x) \leq 0} \right], \end{array}
$$

which completes the proof, since $R(h^{*}) = R^{*}$

Let $\Phi \colon \mathbb{R} \mathbb{R}$ be a convex and non-decreasing function so that for any $u \in \mathbb{R}$ 4 $1_{u \le 0} \le \Phi(- u)$ . The Φ-loss of a function $h \colon \mathcal{X} \mathbb{R}$ at point $(x, y) \in \mathcal{X} \times \{- 1, + 1\}$ is defined as $\Phi(- yh(x))$ and its expected loss given by

$$
\begin{array}{rl} &{\mathcal{L}_{\Phi}(h) = \underset{(x, y) \sim \mathcal{D}}{\mathbb{E}} \left[\Phi(- yh(x)) \right]} \\ &{\qquad = \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\eta(x) \Phi(- h(x)) +(1 - \eta(x)) \Phi(h(x)) \right].} \end{array}\tag{4.10}
$$

Notice that since $1_{yh(x) \leq 0} \leq \Phi(- yh(x))$ , we have $R(h) \leq \mathcal{L}_{\Phi}(h)$ . For any $x \in{\mathcal{X}}$ let $u \mapsto L_{\Phi}(x, u)$ be the function defined for all $u \in \mathbb{R}$ by

$$
L_{\Phi}(x, u) = \eta(x) \Phi(- u) +(1 - \eta(x)) \Phi(u).
$$

Then, $\begin{array}{r}{\mathcal{L}_{\Phi}(h) = \mathbb{E}_{x \sim \mathcal{D}_{\mathcal{X}}}[L_{\Phi}(x, h(x))]} \end{array}$ . Since Φ is convex, $u \mapsto L_{\Phi}(x, u)$ is convex as a sum of two convex functions. Define $h_{\Phi}^{*} \colon \mathcal{X} \to[- \infty, + \infty]$ as the Bayes solution $for$ the loss function $L_{\Phi}$ . That is, for any x, $h_{\Phi}^{*}(x)$ is a solution of the following convex optimization problem:

$$
\begin{array}{l} h_{\Phi}^{*}(x) = \underset{u \in[- \infty, + \infty]}{\text{argmin}} L_{\Phi}(x, u) \\ = \underset{u \in[- \infty, + \infty]}{\text{argmin}} \eta(x) \Phi(- u) +(1 - \eta(x)) \Phi(u).\end{array}
$$

The solution of this optimization is in general not unique. When $\eta(x) = 0, h_{\Phi}^{*}(x)$ is a minimizer of $u \mapsto \Phi(u)$ and since Φ is non-decreasing, we can choose $h_{\Phi}^{*}(x) = - \infty$ in that case. Similarly, when $\eta(x) = 1$ , we can choose $h_{\Phi}^{*}(x) = + \infty$ . When $\begin{array}{r}{\eta(x) = \frac{1}{2}} \end{array}$ <sub>2</sub> , $\begin{array}{r}{L_{\Phi}(x, u) = \frac{1}{\Omega}[\Phi(- u) + \Phi(u)]} \end{array}$ , thus, by convexity, $\begin{array}{r}{L_{\Phi}(x, u) \ge \Phi(- \frac{u}{2} + \frac{u}{2}) = \Phi(0)} \end{array}$ Thus, we can choose $h_{\Phi}^{*}(x) = 0$ in that case. For all other values of $\eta(x)$ , in case of non-uniqueness, an arbitrary minimizer is chosen in this definition. We will denote by $\mathcal{L}_{\Phi}^{*}$ the Φ-loss of h∗ : $\mathcal{L}_{\Phi}^{*} = \mathbb{E}_{(x, y) \sim \mathcal{D}} \left[\Phi(- yh_{\Phi}^{*}(x)) \right]$

Proposition 4.6 Let Φ be a convex and non-decreasing function that is diferentiable at 0 with $\Phi^{\prime}(0) > 0$ . Then, the minimizer of Φ defines the Bayes classifier: for any $x \in \mathcal{X}, h_{\Phi}^{*}(x) > 0iffh^{*}(x) > 0$ and $h^{\ast}(x) = 0 \iff \h_{\Phi}^{\ast}(x) = 0$ , which implies $\mathcal{L}_{\Phi}^{*} = R^{*}$

Proof: Fix $x \in \mathcal{X}$ . If $\eta(x) = 0$ , then $\begin{array}{r}{h^{*}(x) = - \frac{1}{2}} \end{array}$ and $h_{\Phi}^{*}(x) = - \infty$ , thus $h^{\ast}(x)$ and $h_{\Phi}^{*}(x)$ admit the same sign. Similarly, if $\eta(x) = 1$ , then $h^{*}(x) = + \frac{1}{2}$ and $h_{\Phi}^{*}(x) = + \infty$ , and $h^{\ast}(x)$ and $h_{\Phi}^{*}(x)$ admit the same sign.

Let $u^{*}$ denote the minimizer defining $h_{\Phi}^{*}(x).\u^{*}$ is a minimizer of $u \mapsto L_{\Phi}(x, u)$ if the subdiferential of that function at $u^{*}$ contains 0, that is, since $\partial L_{\Phi}(x, u^{*}) =$ $- \eta(x) \partial \Phi(- u^{*}) +(1 - \eta(x)) \partial \Phi(u^{*})$ , if there exist $v_{1} \in \partial \Phi(- u^{*})$ and $v_{2} \in \partial \Phi(u^{*})$ such that

$$
\eta(x) v_{1} =(1 - \eta(x)) v_{2}.\tag{4.11}
$$

If $u^{*} = 0$ , by the Differentiability of Φ at 0 we have $v_{1} = v_{2} = \Phi^{\prime}(0) > 0$ and thus $\begin{array}{r}{\eta({\boldsymbol x}) = \frac{1}{2}} \end{array}$ , that is $h^{*}(x) = 0$ . Conversely, If $h^{*}(x) = 0$ , that is $\begin{array}{r}{\eta(\boldsymbol{x}) = \frac{1}{2}.} \end{array}$ , then, by definition, we have $h_{\Phi}^{*}(x) = 0$ . Thus, $h^{*}(x) = 0$ if $\begin{array}{r}{h_{\Phi}^{*}(x) = 0 \mathrm{iff} \eta(x) = \frac{1}{2}} \end{array}$

We can assume now that $\eta(x)$ is not in $\{0, 1, \frac{1}{2}\}$ . We first show that for any $u_{1}, u_{2} \in \mathbb{R}$ with $u_{1} < u_{2}$ , and any two choices of the subgradients at $u_{1}$ and $u_{2}$ $v_{1} \in \partial \Phi(u_{1})$ and $v_{2} \in \partial \Phi(u_{2})$ , we have $v_{1} \leq v_{2}$ . By definition of the subgradients at $u_{1}$ and $u_{2}$ , the following inequalities hold:

$$
\Phi(u_{2}) - \Phi(u_{1}) \geq v_{1}(u_{2} - u_{1}) \quad \Phi(u_{1}) - \Phi(u_{2}) \geq v_{2}(u_{1} - u_{2}).
$$

Summing up these inequalities yields $v_{2}(u_{2} - u_{1}) \geq v_{1}(u_{2} - u_{1})$ and thus $v_{2} \geq v_{1}$ • since $u_{1} < u_{2}$

Now, if $u^{*} > 0$ , then we have $- u^{*} < u^{*}$ . By the property shown above, this implies $v_{1} ~ \leq ~ v_{2}$ . We cannot have $v_{1} = v_{2} \neq 0$ since (4.11) would then imply $\begin{array}{r}{\eta({\boldsymbol{x}}) = \frac{1}{2}} \end{array}$ . We also cannot have $v_{1} = v_{2} = 0$ since by the property shown above, we must have $\Phi^{\prime}(0) \le v_{2}$ and thus $v_{2} > 0$ . Thus, we must have $v_{1} < v_{2}$ with $v_{2} > 0$ , which, by (4.11), implies $\eta(x) > 1 - \eta(x)$ , that is $h^{\ast}(x) > 0$

Conversely, if $h^{*}(x) > 0$ then $\eta(x) > 1 - \eta(x)$ . We cannot have $v_{1} = v_{2} = 0$ or $v_{1} = v_{2} \neq 0$ as already shown. Thus, since $\eta(x) \neq 1$ , by (4.11), this implies $v_{1} < v_{2}$ . We cannot have $u^{*} < - u^{*}$ since, by the property shown above, this would imply $v_{2} \leq v_{1}$ . Thus, we must have $- u^{*} \leq u^{*}$ , that is $u^{*} \geq 0$ , and more specifically $u^{*} > 0$ since, as already shown above, $u^{*} = 0$ implies $h^{*}(x) = 0$ $\square$

Theorem 4.7 Let Φ be a convex and non-decreasing function. Assume that there exists $s \geq 1$ and $c > 0$ such that the following holds for all $x \in{\mathfrak{X}}$

$$
\left| h^{*}(x) \right|^{s} = \left| \eta(x) - \frac{1}{2} \right|^{s} \leq c^{s} \left[L_{\Phi}(x, 0) - L_{\Phi}(x, h_{\Phi}^{*}(x)) \right].
$$

Then, for any hypothesis h, the excess error of h is bounded as follows:

$$
R(h) - R^{*} \leq 2c \left[\mathcal{L}_{\Phi}(h) - \mathcal{L}_{\Phi}^{*} \right]^{\frac{1}{s}}
$$

## 4.8 Chapter notes

Proof: We will use the following inequality which holds by the convexity of Φ:

$$
\begin{array}{rl} &{\Phi \bigl(- 2h^{*}(x) h(x) \bigr) = \Phi \bigl((1 - 2 \eta(x)) h(x) \bigr)} \\ &{\qquad = \Phi \bigl(\eta(x)(- h(x)) +(1 - \eta(x)) h(x) \bigr)} \\ &{\qquad \leq \eta(x) \Phi((- h(x))) +(1 - \eta(x)) \Phi(h(x)) = L_{\Phi}(x, h(x)).} \end{array}\tag{4.12}
$$

By Lemma 4.5, Jensen’s inequality, and $\begin{array}{r}{h^{*}(x) = \eta(x) - \frac{1}{2}} \end{array}$ , we can write

$$
\begin{array}{rlr} &{R(h) - R(h^{*})} \\ &{= \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[| 2 \eta(x) - 1 | 1_{h(x) h^{*}(x) \leq 0} \right]} \\ &{\leq \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[| 2 \eta(x) - 1 |^{s} 1_{h(x) h^{*}(x) \leq 0} \right]^{\frac{1}{s}}} &{\mathrm{(Jensen^{\prime} sineq.)}} \\ &{\leq 2c \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\left[\Phi(0) - L_{\Phi}(x, h_{\Phi}^{*}(x)) \right] 1_{h(x) h^{*}(x) \leq 0} \right]^{\frac{1}{s}}} &{\mathrm{(assumption)}} \\ &{\leq 2c \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[\left[\Phi(- 2h^{*}(x) h(x)) - L_{\Phi}(x, h_{\Phi}^{*}(x)) \right] 1_{h(x) h^{*}(x) \leq 0} \right]^{\frac{1}{s}}} &{\mathrm{(} \Phi \mathrm{non-decreasing)} \quad} \\ &{\leq 2c \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[[L_{\Phi}(x, h(x)) - L_{\Phi}(x, h_{\Phi}^{*}(x))] 1_{h(x) h^{*}(x) \leq 0} \right]^{\frac{1}{s}}} &{\mathrm{(convexityineq.(4.12))}} \\ &{\leq 2c \underset{x \sim \mathcal{D}_{\mathcal{X}}}{\mathbb{E}} \left[L_{\Phi}(x, h(x)) - L_{\Phi}(x, h_{\Phi}^{*}(x)) \right]^{\frac{1}{s}},} \end{array}
$$

which completes the proof, since $\mathbb{E}_{x \sim \mathcal{D}_{\mathcal{X}}}[L_{\Phi}(x, h_{\Phi}^{*}(x))] = L_{\Phi}^{*}$

The theorem shows that, when the assumption holds, the excess error of h can be upper bounded in terms of the excess Φ-loss. The assumption of the theorem holds in particular for the following convex loss functions:

Hinge loss, where $\Phi(u) = \operatorname{max}(0, 1 + u)$ , with s = 1 and $\begin{array}{r}{c = \frac{1}{2}.} \end{array}$

Exponential loss, where $\Phi(u) = \exp(u)$ , with s = 2 and $\begin{array}{r}{c = \frac{1}{\sqrt{2}}.} \end{array}$

<sub>•</sub> Logistic loss, where $\Phi(u) = \log_{2}(1 + e^{u})$ , with $s = 2$ and $\begin{array}{r}{c = \frac{1}{\sqrt{2}}} \end{array}$

They also hold for the square loss and the squared Hinge loss (see Exercises 4.2 and 4.3).

## 4.8 Chapter notes

The structural risk minimization (SRM) technique is due to Vapnik [1998]. The original penalty term used by Vapnik [1998] is based on the VC-dimension of the hypothesis set. The version of SRM with Rademacher complexity-based penalties that we present here leads to finer data-dependent learning guarantees. Penalties based on alternative complexity measures can be used similarly leading to learning bounds in terms of the corresponding complexity measure [Bartlett et al., 2002a].

An alternative model selection theory of Voted Risk Minimization (VRM) has been recently developed by Cortes, Mohri, and Syed [2014] and other related publications [Kuznetsov et al., 2014, DeSalvo et al., 2015, Cortes et al., 2015].

Theorem 4.7 is due to Zhang [2003a]. The proof given here is somewhat different and simpler.

## 4.9 Exercises

4.1 For any hypothesis set H, show that the following inequalities hold:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[\widehat{R}_{S} \left(h_{S}^{\mathrm{ERM}}\right) \right] \leq \inf_{h \in \mathcal{H}} R(h) \leq \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}} \left[R \left(h_{S}^{\mathrm{ERM}}\right) \right].\tag{4.13}
$$

4.2 Show that for the squared loss, $\Phi(u) =(1 + u)^{2}$ , the statement of Theorem 4.7 holds with $s = 2$ and $\begin{array}{r}{c = \frac{1}{2}} \end{array}$ and therefore that the excess error can be upper bounded as follows:

$$
R(h) - R^{*} \leq \left[\mathcal{L}_{\Phi}(h) - \mathcal{L}_{\Phi}^{*} \right]^{\frac{1}{2}}.
$$

4.3 Show that for the squared Hinge loss, $\Phi(u) = \operatorname{max}(0, 1 + u)^{2}$ , the statement of Theorem 4.7 holds with $s = 2$ and $\begin{array}{r}{c = \frac{1}{2}} \end{array}$ and therefore that the excess error can be upper bounded as follows:

$$
R(h) - R^{*} \leq \left[\mathcal{L}_{\Phi}(h) - \mathcal{L}_{\Phi}^{*} \right]^{\frac{1}{2}}.
$$

4.4 In this problem, the loss of $h \colon \mathcal{X} \mathbb{R}$ at point $(x, y) \in \mathcal{X} \times \{- 1, + 1\}$ is defined to be $1_{yh(x) \leq 0}$

(a) Define the Bayes classifier and a Bayes scoring function $h^{*}$ for this loss.

(b) Express the excess error of $h$ in terms of $h^{*}$ (counterpart of Lemma 4.5, for loss considered here).

(c) Give a counterpart of the result of Theorem 4.7 for this loss.

4.5 Same questions as in Exercise 4.5 with the loss of $h \colon \mathcal{X} \mathbb{R}$ at point $(x, y) \in$ $\mathcal{X} \times \{- 1, + 1\}$ defined instead to be $1_{yh(x) < 0}$

This chapter presents one of the most theoretically well motivated and practically most efective classification algorithms in modern machine learning: Support Vector Machines (SVMs). We first introduce the algorithm for separable datasets, then present its general version designed for non-separable datasets, and finally provide a theoretical foundation for SVMs based on the notion of margin. We start with the description of the problem of linear classification.


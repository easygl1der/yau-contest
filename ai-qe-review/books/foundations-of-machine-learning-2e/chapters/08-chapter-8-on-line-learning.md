---
title: "Chapter 8 \u2014 On-Line Learning"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 8
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 4617
source_line_end: 5587
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 0
caption_derived_image_alt: 2
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 10
  latex_environment_mismatches: 2
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 8 — On-Line Learning

> [[../README|本书目录]] · [[07-chapter-7-boosting|上一章]] · [[09-chapter-9-multi-class-classification|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 4617–5587。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 10；different × 6；efficient × 1；sufficient × 1；PDF-page fallback for unrecoverable formula (PDF p.198) × 1；PDF-page fallback for unrecoverable formula (PDF p.216) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 8.1 Introduction

The learning framework for on-line algorithms is in stark contrast to the PAC learning or stochastic models discussed up to this point. First, instead of learning from a training set and then testing on a test set, the on-line learning scenario mixes the training and test phases. Second, PAC learning follows the key assumption that the distribution over data points is fixed over time, both for training and test points, and that points are sampled in an i.i.d. fashion. Under this assumption, the natural goal is to learn a hypothesis with a small expected loss or generalization error. In contrast, with on-line learning, no distributional assumption is made, and thus there is no notion of generalization. Instead, the performance of on-line learning algorithms is measured using a mistake model and the notion of regret. To derive guarantees in this model, theoretical analyses are based on a worst-case or adversarial assumption.

The general on-line setting involves T rounds. At the tth round, the algorithm receives an instance $x_{t} ~ \in ~ \mathcal{X}$ and makes a prediction $\widehat{y}_{t} \in \mathcal{Y}$ . It then receives the true label $y_{t} ~ \in ~ \mathcal Y$ and incurs a loss $L(\widehat{y}_{t}, y_{t})$ , where $L \colon \mathbb{Y} \times \mathbb{y} \to \mathbb{R}_{+}$ is a loss function. More generally, the prediction domain for the algorithm may be $\mathcal{Y}^{\prime} \neq \mathcal{Y}$ and the loss function defined over $\mathcal{Y}^{\prime} \times \mathcal{Y}$ . For classification problems, we often have $\forall \ : = \ : \{0, 1\}$ and $L(y, y^{\prime}) \ = \ | y^{\prime} - y |$ , while for regression $\y \subseteq \mathbb{R}$ and typically $L(y, y^{\prime}) =(y^{\prime} - y)^{2}$ . The objective in the on-line setting is to minimize the cumulative loss: $\textstyle \sum_{t = 1}^{T} L({\widehat{y}}_{t}, y_{t})$ over T rounds.

## 8.2 Prediction with expert advice

We first discuss the setting of online learning with expert advice, and the associated notion of regret. In this setting, at the tth round, in addition to receiving $x_{t} \in{\mathcal{X}}.$ the algorithm also receives advice $y_{t, i} \in \mathcal{Y}, i \in[N]$ , from N experts. Following the general framework of on-line algorithms, it then makes a prediction, receives the true label, and incurs a loss. After T rounds, the algorithm has incurred a cumulative loss. The objective in this setting is to minimize the regret $R_{T}$ , also called external regret, which compares the cumulative loss of the algorithm to that of the best expert in hindsight after $T$ rounds:

$$
R_{T} = \sum_{t = 1}^{T} L(\widehat{y}_{t}, y_{t}) - \min_{i = 1}^{N} \sum_{t = 1}^{T} L(\widehat{y}_{t, i}, y_{t}).\tag{8.1}
$$

![Figure 8.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/ecb53d73d9cd7dc9de2dcb57e37ac6ec9b2b0c092af816c3aa88c6a066812f85.jpg)  
Figure 8.1  
Weather forecast: an example of a prediction problem based on expert advice.

This problem arises in a variety of different domains and applications. Figure 8.1 illustrates the problem of predicting the weather using several forecasting sources as experts.

## 8.2.1 Mistake bounds and Halving algorithm

Here, we assume that the loss function is the standard zero-one loss used in classification. To analyze the expert advice setting, we first consider the realizable case, that is the setting where at least one of the experts makes no errors. As such, we discuss the mistake bound model, which asks the simple question “How many mistakes before we learn a particular concept?” Since we are in the realizable case, after some number of rounds $T_{:}$ we will learn the concept and no longer make errors in subsequent rounds. For any fixed concept $c,$ we define the maximum number of mistakes a learning algorithm makes as

$$
M_{\mathcal{A}}(c) = \max_{x_{1}, \dots, x_{T}} | \text{mistakes}(\mathcal{A}, c) |.\tag{8.2}
$$

Further, for any concept in a concept class ${\mathcal{C}},$ the maximum number of mistakes a learning algorithm makes is

$$
M_{\mathcal{A}}(\mathcal{C}) = \max_{c \in \mathcal{C}} M_{\mathcal{A}}(c).\tag{8.3}
$$

Our goal in this setting is to derive mistake bounds, that is, a bound M on $M_{A}(\mathcal{C})$ We will first do this for the Halving algorithm, an elegant and simple algorithm for which we can guarantee surprisingly favorable mistake bounds. At each round, the Halving algorithm makes its prediction by taking the majority vote over all active experts. After any incorrect prediction, it deactivates all experts that gave faulty advice. Initially, all experts are active, and by the time the algorithm has converged to the correct concept, the active set contains only those experts that are consistent with the target concept. The pseudocode for this algorithm is shown in figure 8.2. We also present straightforward mistake bounds in theorems 8.1 and 8.2, where the former deals with finite hypothesis sets and the latter relates mistake bounds to VC-dimension. Note that the hypothesis complexity term in theorem 8.1 is identical to the corresponding complexity term in the PAC model bound of theorem 2.5.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
HALVING(H)
1  $H_{1} \leftarrow H$ 
2 for  $t \leftarrow 1$  to T do
3  $\text{RECEIVE}(x_{t})$ 
4  $\widehat{y}_{t} \leftarrow \text{MAJORITYVOTE}(\mathcal{H}_{t}, x_{t})$ 
5  $\text{RECEIVE}(y_{t})$ 
6 if  $(\widehat{y}_{t} \neq y_{t})$  then
7  $H_{t+1} \leftarrow \{c \in H_{t} : c(x_{t}) = y_{t}\}$ 
8 else  $H_{t+1} \leftarrow H_{t}$ 
9 return  $H_{T+1}$
</div>

## Figure 8.2

Halving algorithm.

Theorem 8.1 Let H be a finite hypothesis set. Then

$$
M_{\mathrm{HALVING}}(\mathcal{H}) \leq \log_{2} | \mathcal{H} |.\tag{8.4}
$$

Proof: Since at each round the algorithm makes predictions using majority vote from the active set, at each mistake, the active set is reduced by at least half. Hence, after $\log_{2} | \mathcal{H} |$ mistakes, there can only remain one active hypothesis, and since we are in the realizable case, this hypothesis must coincide with the target concept. $\square$

Theorem 8.2 Let opt(H) be the optimal mistake bound for H. Then,

$$
\operatorname{VCdim}(\mathcal{H}) \leq opt(\mathcal{H}) \leq M_{\text{HALVING}}(\mathcal{H}) \leq \log_{2} | \mathcal{H} |.\tag{8.5}
$$

Proof: The second inequality is true by definition and the third inequality holds based on theorem 8.1. To prove the first inequality, we let $d = \operatorname{VCdim}({\mathcal{H}})$ . Then there exists a shattered set of $d$ points, for which we can form a complete binary tree of the mistakes with height $d,$ and we can choose labels at each round of learning to ensure that $d$ mistakes are made. Note that this adversarial argument is valid since the on-line setting makes no statistical assumptions about the data. $\square$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
WEIGHTED-MAJORITY(N)

1 for  $i \leftarrow 1$  to N do
2    $w_{1,i} \leftarrow 1$ 
3 for  $t \leftarrow 1$  to T do
4    $\text{RECEIVE}(x_t)$ 
5    if  $\sum_{i: y_{t,i}=1} w_{t,i} \geq \sum_{i: y_{t,i}=0} w_{t,i}$  then
6    $\widehat{y}_t \leftarrow 1$ 
7    else  $\widehat{y}_t \leftarrow 0$ 
8    $\text{RECEIVE}(y_t)$ 
9    if  $(\widehat{y}_t \neq y_t)$  then
10    for  $i \leftarrow 1$  to N do
11    if  $(y_{t,i} \neq y_t)$  then
12    $w_{t+1,i} \leftarrow \beta w_{t,i}$ 
13    else  $w_{t+1,i} \leftarrow w_{t,i}$ 
14 return  $w_{T+1}$
</div>

## Figure 8.3

Weighted majority algorithm, $y_{t}, y_{t, i} \in \{0, 1\}$

## 8.2.2 Weighted majority algorithm

In the previous section, we focused on the realizable setting in which the Halving algorithm simply discarded experts after a single mistake. We now move to the nonrealizable setting and use a more general and less extreme algorithm, the Weighted Majority (WM) algorithm, that weights the importance of experts as a function of their mistake rate. The WM algorithm begins with uniform weights over all N experts. At each round, it generates predictions using a weighted majority vote. After receiving the true label, the algorithm then reduces the weight of each incorrect expert by a factor of $\beta \in[0, 1)$ . Note that this algorithm reduces to the Halving algorithm when $\beta = 0$ . The pseudocode for the WM algorithm is shown in figure 8.3.

Since we are not in the realizable setting, the mistake bounds of theorem 8.1 cannot apply. However, the following theorem presents a bound on the number of mistakes $m_{T}$ made by the WM algorithm after $T \geq 1$ rounds of on-line learning as a function of the number of mistakes made by the best expert, that is the expert who achieves the smallest number of mistakes for the sequence $y_{1}, \ldots, y_{T}$ . Let us emphasize that this is the best expert in hindsight.

Theorem 8.3 Fix $\beta \in(0, 1)$ . Let $m_{T}$ be the number of mistakes made by algorithm WM after $T \geq 1$ rounds, and $m_{T}^{*}$ be the number of mistakes made by the best of the N experts. Then, the following inequality holds:

$$
m_{T} \leq \frac{\log N + m_{T}^{*} \log \frac{1}{\beta}}{\log \frac{2}{1 + \beta}}.\tag{8.6}
$$

Proof: To prove this theorem, we first introduce a potential function. We then derive upper and lower bounds for this function, and combine them to obtain our result. This potential function method is a general proof technique that we will use throughout this chapter.

For any $t \geq 1$ , we define our potential function as $\begin{array}{r}{W_{t} = \sum_{i = 1}^{N} w_{t, i}} \end{array}$ . Since predictions are generated using weighted majority vote, if the algorithm makes an error at round t, this implies that

$$
W_{t + 1} \leq \left[1 / 2 +(1 / 2) \beta \right] W_{t} = \left[\frac{1 + \beta}{2} \right] W_{t}.\tag{8.7}
$$

Since $W_{1} = N$ and $m_{T}$ mistakes are made after T rounds, we thus have the following upper bound:

$$
W_{T} \leq \left[\frac{1 + \beta}{2} \right]^{m_{T}} N.\tag{8.8}
$$

Next, since the weights are all non-negative, it is clear that for any expert i, $W_{T} \geq$ $w_{T, i} = \beta^{m_{T, i}}$ , where $m_{T, i}$ is the number of mistakes made by the ith expert after $T$ rounds. Applying this lower bound to the best expert and combining it with the upper bound in (8.8) gives us:

$$
\begin{array}{c} \beta^{m_{T}^{*}} \leq W_{T} \leq \left[\frac{1 + \beta}{2} \right]^{m_{T}} N \\ \Rightarrow m_{T}^{*} \log \beta \leq \log N + m_{T} \log \left[\frac{1 + \beta}{2} \right] \\ \Rightarrow m_{T} \log \left[\frac{2}{1 + \beta} \right] \leq \log N + m_{T}^{*} \log \frac{1}{\beta}, \end{array}
$$

which concludes the proof.

Thus, the theorem guarantees a bound of the following form for algorithm WM:

$$
m_{T} \leq O(\log N) + \text{constant} \times | \text{mistakes of best expert} |.
$$

Since the first term varies only logarithmically as a function of N, the theorem guarantees that the number of mistakes is roughly a constant times that of the best expert in hindsight. This is a remarkable result, especially because it requires no assumption about the sequence of points and labels generated. In particular, the sequence could be chosen adversarially. In the realizable case where $m_{T}^{*} = 0$ , the bound reduces to $m_{T} \le{\cal O}(\log N)$ as for the Halving algorithm.

## 8.2.3 Randomized weighted majority algorithm

In spite of the guarantees just discussed, the WM algorithm admits a drawback that afects all deterministic algorithms in the case of the zero-one loss: no deterministic algorithm can achieve a regret $R_{T} = o(T)$ over all sequences. Clearly, for any deterministic algorithm $\mathcal{A}$ and any $t \in[T]$ , we can adversarially select $y_{t}$ to be 1 if the algorithm predicts $0,$ and choose it to be 0 otherwise. Thus, $\mathcal{A}$ errs at every point of such a sequence and its cumulative mistake is $m_{T} = T$ . Assume for example that $N = 2$ and that one expert always predicts $0,$ the other one always 1. The error of the best expert over that sequence (and in fact any sequence of that length) is then at most $m_{T}^{*} \le T / 2$ . Thus, for that sequence, we have

$$
R_{T} = m_{T} - m_{T}^{*} \geq T / 2,
$$

which shows that $R_{T} = o(T)$ cannot be achieved in general. Note that this does not contradict the bound proven in the previous section, since for any $\beta \in(0, 1)$ , $\frac{\log{\frac{1}{\beta}}}{\log{\frac{2}{1 + \beta}}} \geq 2$ . As we shall see in the next section, this negative result does not hold for any loss that is convex with respect to one of its arguments. But for the zero-one loss, this leads us to consider randomized algorithms instead.

In the randomized scenario of on-line learning, we assume that a set $\mathcal{A} = \{1, \ldots, N\}$ of N actions is available. At each round $t \in[T]$ , an on-line algorithm selects a distribution $\mathbf{p}_{t}$ over the set of actions, receives a loss vector ${\bf l}_{t},$ whose ith component $l_{t, i} ~ \in ~[0, 1]$ is the loss associated with action $i,$ and incurs the expected loss $\begin{array}{r}{L_{t} = \sum_{i = 1}^{N} p_{t, i} l_{t, i}} \end{array}$ . The total loss incurred by the algorithm over $T$ rounds is $\begin{array}{r}{\mathcal{L}_{T} = \sum_{t = 1}^{T} L_{t}} \end{array}$ . The total loss associated to action $i$ is $\begin{array}{r}{\mathcal{L}_{T, i} = \sum_{t = 1}^{T} l_{t, i}} \end{array}$ . The minimal loss of a single action is denoted by $\begin{array}{r}{\mathcal{L}_{T}^{\operatorname{min}} = \operatorname{min}_{i \in \mathcal{A}} \mathcal{L}_{T, i}} \end{array}$ . The regret $R_{T}$ of the algorithm after $T$ rounds is then typically defined by the diference of the loss of the algorithm and that of the best single action:<sup>11</sup>

$$
R_{T} = \mathcal{L}_{T} - \mathcal{L}_{T}^{\mathrm{min}}.
$$

Here, we consider specifically the case of zero-one losses and assume that $l_{t, i} \in \{0, 1\}$ for all $t \in[T]$ and $i \in \mathcal A$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
RANDOMIZED-WEIGHTED-MAJORITY (N)

1 for  $i \leftarrow 1$  to N do
2  $w_{1,i} \leftarrow 1$ 
3  $p_{1,i} \leftarrow 1/N$ 
4 for  $t \leftarrow 1$  to T do
5  $\text{RECEIVE}(l_t)$ 
6 for  $i \leftarrow 1$  to N do
7 if  $(l_{t,i} = 1)$  then
8  $w_{t+1,i} \leftarrow \beta w_{t,i}$ 
9 else  $w_{t+1,i} \leftarrow w_{t,i}$ 
10  $W_{t+1} \leftarrow \sum_{i=1}^{N} w_{t+1,i}$ 
11 for  $i \leftarrow 1$  to N do
12  $p_{t+1,i} \leftarrow w_{t+1,i}/W_{t+1}$ 
13 return  $w_{T+1}$
</div>

## Figure 8.4

Randomized weighted majority algorithm.

The WM algorithm admits a straightforward randomized version, the randomized weighted majority (RWM) algorithm. The pseudocode of this algorithm is given in figure 8.4. The algorithm updates the weight $w_{t, i}$ of expert i as in the case of the WM algorithm by multiplying it by $\beta.$ . The following theorem gives a strong guarantee on the regret $R_{T}$ of the RWM algorithm, showing that it is in $O({\sqrt{T \log N}})$

Theorem 8.4 Fix $\beta \in[1 / 2, 1)$ . Then, for any $T \geq 1$ , the loss of algorithm RWM on any sequence can be bounded as follows:

$$
\mathcal{L}_{T} \leq \frac{\log N}{1 - \beta} +(2 - \beta) \mathcal{L}_{T}^{\min}.\tag{8.9}
$$

In particular, for $\beta = \operatorname{max} \{1 / 2, 1 - \sqrt{(\log N) / T}\}$ , the loss can be bounded as:

$$
\mathcal{L}_{T} \leq \mathcal{L}_{T}^{\mathrm{min}} + 2 \sqrt{T \log N}.\tag{8.10}
$$

Proof: As in the proof of theorem 8.3, we derive upper and lower bounds for the potential function $\begin{array}{r}{W_{t} = \sum_{i = 1}^{N} w_{t, i}, t \in[T]} \end{array}$ , and combine these bounds to obtain the result. By definition of the algorithm, for any $t \in[T], W_{t + 1}$ can be expressed as follows in terms of $W_{t}$ :

> [!warning] PDF 公式回退
> 此公式块的 OCR 转录已截断、重复或乱码，不能安全重写为 LaTeX。以下嵌入的是已核验的原 PDF 第 198 页；本章仍需人工转写后才可标为 `reviewed`。
>
> ![[../../../transcripts/mineru/foundations-of-machine-learning-2e/source.pdf#page=198]]

Thus, since $W_{1} = N$ , it follows that $\begin{array}{r}{W_{T + 1} = N \prod_{t = 1}^{T}(1 -(1 - \beta) L_{t})} \end{array}$ . On the other hand, the following lower bound clearly holds: $\begin{array}{r}{W_{T + 1} \geq \operatorname{max}_{i \in[N]} w_{T + 1, i} = \beta^{\mathcal{L}_{T}^{\mathrm{min}}}} \end{array}$ This leads to the following inequality and series of derivations after taking the log and using the inequalities log $(1 - x) \leq - x$ valid for all $x < 1$ , and $- \log(1 - x) \leq$ $x + x^{2}$ valid for all $x \in[0, 1 / 2]$

$$
\begin{array}{rl} \beta^{\mathcal{L}_{T}^{\min}} \leq N \prod_{t = 1}^{T}(1 -(1 - \beta) L_{t}) & \Longrightarrow \mathcal{L}_{T}^{\min} \log \beta \leq \log N + \sum_{t = 1}^{T} \log(1 -(1 - \beta) L_{t}) \\ & \Longrightarrow \mathcal{L}_{T}^{\min} \log \beta \leq \log N -(1 - \beta) \sum_{t = 1}^{T} L_{t} \\ & \Longrightarrow \mathcal{L}_{T}^{\min} \log \beta \leq \log N -(1 - \beta) \mathcal{L}_{T} \\ & \Longrightarrow \mathcal{L}_{T} \leq \frac{\log N}{1 - \beta} - \frac{\log \beta}{1 - \beta} \mathcal{L}_{T}^{\min} \\ & \Longrightarrow \mathcal{L}_{T} \leq \frac{\log N}{1 - \beta} - \frac{\log(1 -(1 - \beta))}{1 - \beta} \mathcal{L}_{T}^{\min} \\ & \Longrightarrow \mathcal{L}_{T} \leq \frac{\log N}{1 - \beta} +(2 - \beta) \mathcal{L}_{T}^{\min}.\end{array}
$$

This shows the first statement. Since $\mathcal{L}_{T}^{\mathrm{min}} \leq T$ , this also implies

$$
\mathcal{L}_{T} \leq \frac{\log N}{1 - \beta} +(1 - \beta) T + \mathcal{L}_{T}^{\min}.\tag{8.11}
$$

Diferentiating the upper bound with respect to $\beta$ and setting it to zero gives $\frac{\log N}{(1 - \beta)^{2}} - T = 0$ , that is $\beta = 1 - \sqrt{(\log N) / T} < 1$ . Thus, if $1 - \sqrt{(\log N) / T} \geq 1 / 2$ , $\beta_{0} = 1 - \sqrt{(\log N) / T}$ is the minimizing value of $\beta_{;}$ , otherwise the boundary value $\beta_{0} = 1 / 2$ is the optimal value. The second statement follows by replacing $\beta$ with $\beta_{0}$ in (8.11). $\square$

The bound (8.10) assumes that the algorithm additionally receives as a parameter the number of rounds T . As we shall see in the next section, however, there exists a general doubling trick that can be used to relax this requirement at the price of a small constant factor increase. Inequality 8.10 can be written directly in terms of the regret $R_{T}$ of the RWM algorithm:

$$
R_{T} \leq 2 \sqrt{T \log N}.\tag{8.12}
$$

Thus, for N constant, the regret verifies $R_{T} = O({\sqrt{T}})$ and the average regret or regret per round $R_{T} / T$ decreases as $O(1 / \sqrt{T})$ . These results are optimal, as shown by the following theorem.

Theorem 8.5 Let $N = 2$ . There exists a stochastic sequence of losses for which the regret of any on-line learning algorithm verifies $\mathbb{E}[R_{T}] \geq \sqrt{T / 8}$

Proof: For any $t \in[T]$ , let the vector of losses ${\mathbf l}_{t}$ take the values $\mathbf{l}_{01} =(0, 1)^{\top}$ and ${\mathbf{l}_{10}} =(1, 0)^{\top}$ with equal probability. Then, the expected loss of any randomized algorithm $\mathcal{A}$ is

$$
\mathbb{E} \left[\mathcal{L}_{T} \right] = \mathbb{E} \left[\sum_{t = 1}^{T} \mathbf{p}_{t} \cdot \mathbf{l}_{t} \right] = \sum_{t = 1}^{T} \mathbf{p}_{t} \cdot \mathbb{E} \left[\mathbf{l}_{t} \right] = \sum_{t = 1}^{T} \frac{1}{2} p_{t, 1} + \frac{1}{2}(1 - p_{t, 1}) = T / 2,
$$

where we denoted by $\mathbf{p}_{t}$ the distribution selected by $\mathcal{A}$ at round t. By definition, $\mathcal{L}_{T}^{\mathrm{min}}$ can be written as follows:

$$
\mathcal{L}_{T}^{\mathrm{min}} = \mathrm{min} \{\mathcal{L}_{T, 1}, \mathcal{L}_{T, 2}\} = \frac{1}{2}(\mathcal{L}_{T, 1} + \mathcal{L}_{T, 2} - | \mathcal{L}_{T, 1} - \mathcal{L}_{T, 2} |) = T / 2 - | \mathcal{L}_{T, 1} - T / 2 |,
$$

using the fact that $\mathcal{L}_{T, 1} + \mathcal{L}_{T, 2} = T$ . Thus, the expected regret of $\mathcal{A}$ is

$$
\mathbb{E}[R_{T}] = \mathbb{E}[\mathcal{L}_{T}] - \mathbb{E}[\mathcal{L}_{T}^{\mathrm{min}}] = \mathbb{E}[| \mathcal{L}_{T, 1} - T / 2 |].
$$

Let $\sigma_{t}, t \in[T]$ , denote Rademacher variables taking values in $\{- 1, + 1\}$ , then $\mathcal{L}_{T, 1}$ can be rewritten as $\begin{array}{r}{\mathcal{L}_{T, 1} = \sum_{t = 1}^{T} \frac{1 + \sigma_{t}}{2} = T / 2 + \frac{1}{2} \sum_{t = 1}^{T} \sigma_{t}} \end{array}$ . Thus, introducing scalars $x_{t} = 1 / 2, t \in[T]$ , by the Khintchine-Kahane inequality, (D.24) we have:

$$
\mathbb{E}[R_{T}] = \mathbb{E} \left[| \sum_{t = 1}^{T} \sigma_{t} x_{t} | \right] \geq \sqrt{\frac{1}{2} \sum_{t = 1}^{T} x_{t}^{2}} = \sqrt{T / 8},
$$

which concludes the proof.

More generally, for $T \geq N$ , a lower bound of $R_{T} = \Omega(\sqrt{T \log N})$ can be proven for the regret of any algorithm.

## 8.2.4 Exponential weighted average algorithm

The WM algorithm can be extended to other loss functions L taking values in [0, 1]. The Exponential Weighted Average algorithm presented here can be viewed as that extension for the case where L is convex in its first argument. Note that this algorithm is deterministic and yet, as we shall see, admits a very favorable regret

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
EXPONENTIAL-WEIGHTED-AVERAGE (N)

1 for  $i \leftarrow 1$  to N do
2    $w_{1,i} \leftarrow 1$ 
3 for  $t \leftarrow 1$  to T do
4    $\text{RECEIVE}(x_t)$ 
5    $\widehat{y}_t \leftarrow \frac{\sum_{i=1}^Nw_{t,i} y_{t,i}}{\sum_{i=1}^Nw_{t,i}}$ 
6    $\text{RECEIVE}(y_t)$ 
7    for  $i \leftarrow 1$  to N do
8    $w_{t+1,i} \leftarrow w_{t,i} e^{-\eta L(\widehat{y}_{t,i}, y_t)}$ 
9 return  $w_{T+1}$
</div>

## Figure 8.5

Exponential weighted average, $L(\widehat{y}_{t, i}, y_{t}) \in[0, 1]$

guarantee. Figure 8.5 gives its pseudocode. At round $t \in[T]$ , the algorithm’s prediction is A

$$
\widehat{y}_{t} = \frac{\sum_{i = 1}^{N} w_{t, i} y_{t, i}}{\sum_{i = 1}^{N} w_{t, i}},\tag{8.13}
$$

where $y_{t, i}$ is the prediction by expert i and $w_{t, i}$ the weight assigned by the algorithm to that expert. Initially, all weights are set to one. The algorithm then updates the weights at the end of round t according to the following rule:

$$
w_{t + 1, i} \leftarrow w_{t, i} e^{- \eta L(\widehat{y}_{t, i}, y_{t})} = e^{- \eta L_{t, i}},\tag{8.14}
$$

where $L_{t, i}$ is the total loss incurred by expert i after t rounds. Note that this algorithm, as well as the others presented in this chapter, are simple, since they do not require keeping track of the losses incurred by each expert at all previous rounds but only of their cumulative performance. Furthermore, this property is also computationally advantageous. The following theorem presents a regret bound for this algorithm.

Theorem 8.6 Assume that the loss function L is convex in its first argument and takes values in [0, 1]. Then, for any $\eta > 0$ and any sequence $y_{1}, \dotsc, y_{T} \in \mathcal{Y}$ , the regret of the Exponential Weighted Average algorithm after T rounds satisfies

$$
R_{T} \leq \frac{\log N}{\eta} + \frac{\eta T}{8}.\tag{8.15}
$$

In particular, for $\eta = \sqrt{8 \log N / T}$ , the regret is bounded as

$$
R_{T} \leq \sqrt{(T / 2) \log N}.\tag{8.16}
$$

Proof: We apply the same potential function analysis as in previous proofs but using as potential $\begin{array}{r}{\Phi_{t} = \log{\sum_{i = 1}^{N} w_{t, i}}, t \in[T]} \end{array}$ . Let $\mathbf{p}_{t}$ denote the distribution over $\{1, \ldots, N\}$ with $\begin{array}{r}{p_{t, i} = \frac{w_{t, i}}{\sum_{i = 1}^{N} w_{t, i}}} \end{array}$ . To derive an upper bound on $\Phi_{t}$ , we first examine the diference of two consecutive potential values:

$$
\Phi_{t + 1} - \Phi_{t} = \log \frac{\sum_{i = 1}^{N} w_{t, i} e^{- \eta L(\widehat{y}_{t, i}, y_{t})}}{\sum_{i = 1}^{N} w_{t, i}} = \log \big(\underset{\mathbf{p}_{t}}{\mathbb{E}}[e^{\eta X}] \big),
$$

with $X = - L(\widehat{y}_{t, i}, y_{t}) \in[- 1, 0]$ . To upper bound the expression appearing in the right-hand side, we apply Hoefding’s lemma (lemma D.1) to the centered random variable $X - \mathbb{E}_{\mathbf{p}_{t}}[X]$ , then Jensen’s inequality (theorem B.20) using the convexity of L with respect to its first argument:

$$
\begin{array}{ll} \Phi_{t + 1} - \Phi_{t} = \log \big(\underset{\mathbf{p}_{t}}{\mathbb{E}} \left[e^{\eta(X - \mathbb{E}[X]) + \eta \mathbb{E}[X]} \right] \big) \\ \leq \frac{\eta^{2}}{8} + \eta \underset{\mathbf{p}_{t}}{\mathbb{E}}[X] = \frac{\eta^{2}}{8} - \eta \underset{\mathbf{p}_{t}}{\mathbb{E}}[L(\widehat{y}_{t, i}, y_{t})] & \text{(Hoeffding's lemma)} \\ \leq - \eta L \big(\underset{\mathbf{p}_{t}}{\mathbb{E}}[\widehat{y}_{t, i}], y_{t} \big) + \frac{\eta^{2}}{8} & \text{(convexity of first arg. of L)} \\ = - \eta L(\widehat{y}_{t}, y_{t}) + \frac{\eta^{2}}{8}.\end{array}
$$

Summing up these inequalities yields the following upper bound:

$$
\Phi_{T + 1} - \Phi_{1} \leq - \eta \sum_{t = 1}^{T} L(\widehat{y}_{t}, y_{t}) + \frac{\eta^{2} T}{8}.\tag{8.17}
$$

We obtain a lower bound for the same quantity as follows:

$$
\Phi_{T + 1} - \Phi_{1} = \log \sum_{i = 1}^{N} e^{- \eta L_{T, i}} - \log N \geq \log \max_{i = 1}^{N} e^{- \eta L_{T, i}} - \log N = - \eta \min_{i = 1}^{N} L_{T, i} - \log N.
$$

Combining the upper and lower bounds yields:

$$
\begin{array}{l} - \eta \underset{i = 1}{\overset{N}{\min}} L_{T, i} - \log N \leq - \eta \sum_{t = 1}^{T} L(\widehat{y}_{t}, y_{t}) + \frac{\eta^{2} T}{8} \\ \Longrightarrow \sum_{t = 1}^{T} L(\widehat{y}_{t}, y_{t}) - \underset{i = 1}{\overset{N}{\min}} L_{T, i} \leq \frac{\log N}{\eta} + \frac{\eta T}{8}, \end{array}
$$

and concludes the proof.

The optimal choice of η in theorem 8.6 requires knowledge of the horizon $T_{:}$ , which is an apparent disadvantage of this analysis. However, we can use a standard doubling trick to eliminate this requirement, at the price of a small constant factor. This consists of dividing time into periods $[2^{k}, 2^{k + 1} - 1]$ of length $2^{k}$ with $k = 0, \ldots, n$ and $T \geq 2^{n} - 1$ , and then choosing $\begin{array}{r}{\eta_{k} = \sqrt{\frac{8 \log N}{2^{k}}}} \end{array}$ in each period. The following theorem presents a regret bound when using the doubling trick to select η. A more general method consists of interpreting η as a function of time, i.e., $\eta_{t} ={\sqrt{(8 \log N) / t}}$ which can lead to a further constant factor improvement over the regret bound of the following theorem.

Theorem 8.7 Assume that the loss function L is convex in its first argument and takes values in [0, 1]. Then, for any $T \geq 1$ and any sequence $y_{1}, \dotsc, y_{T} \in \mathcal{Y}$ , the regret of the Exponential Weighted Average algorithm after $T$ rounds is bounded as follows:

$$
R_{T} \leq \frac{\sqrt{2}}{\sqrt{2} - 1} \sqrt{(T / 2) \log N} + \sqrt{\log N / 2}.\tag{8.18}
$$

Proof: Let $T \geq 1$ and let $\mathcal{I}_{k} =[2^{k}, 2^{k + 1} - 1]$ , for $k \in[0, n]$ , with $n = \lfloor \log(T + 1) \rfloor$ Let $L_{\mathfrak{I}_{k}}$ denote the loss incurred in the interval $\mathcal{I}_{k}$ . By theorem 8.6 (8.16), for any $k \in \{0, \ldots, n\}$ , we have

$$
L_{\mathcal{I}_{k}} - \min_{i = 1}^{N} L_{\mathcal{I}_{k}, i} \leq \sqrt{2^{k} / 2 \log N}.\tag{8.19}
$$

Thus, we can bound the total loss incurred by the algorithm after T rounds as:

$$
\begin{array}{l} L_{T} = \sum_{k = 0}^{n} L_{\mathcal{I}_{k}} \leq \sum_{k = 0}^{n} \min_{i = 1}^{N} L_{\mathcal{I}_{k}, i} + \sum_{k = 0}^{n} \sqrt{2^{k}(\log N) / 2} \\ \qquad \leq \min_{i = 1}^{N} L_{T, i} + \sqrt{(\log N) / 2} \cdot \sum_{k = 0}^{n} 2^{\frac{k}{2}}, \end{array}\tag{8.20}
$$

where the second inequality follows from the super-additivity of min, that is min $\begin{array}{r}{\mathrm{~.~} X_{i} + \operatorname{min}_{i} Y_{i} \leq \operatorname{min}_{i}(X_{i} + Y_{i})} \end{array}$ for any sequences $(X_{i})_{i}$ and $(Y_{i})_{i}$ , which implies $\begin{array}{r}{\sum_{k = 0}^{n} \operatorname{min}_{i = 1}^{N} L_{\mathcal{I}_{k}, i} \leq \operatorname{min}_{i = 1}^{N} \sum_{k = 0}^{n} L_{\mathcal{I}_{k}, i}} \end{array}$ . The geometric sum appearing in the righthand side of (8.20) can be expressed as follows:

$$
\sum_{k = 0}^{n} 2^{\frac{k}{2}} = \frac{2^{(n + 1) / 2} - 1}{\sqrt{2} - 1} \leq \frac{\sqrt{2} \sqrt{T + 1} - 1}{\sqrt{2} - 1} \leq \frac{\sqrt{2}(\sqrt{T} + 1) - 1}{\sqrt{2} - 1} = \frac{\sqrt{2} \sqrt{T}}{\sqrt{2} - 1} + 1.
$$

Plugging back into (8.20) and rearranging terms yields (8.18).

The $O(\sqrt{T})$ dependency on $T$ presented in this bound cannot be improved for general loss functions.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
PERCEPTRON($\mathbf{w}_0$)
1 $\mathbf{w}_1 \leftarrow \mathbf{w}_0$ ▷ typically $\mathbf{w}_0 = \mathbf{0}$
2 for $t \leftarrow 1$ to $T$ do
3 RECEIVE($\mathbf{x}_t$)
4 $\widehat{y}_t \leftarrow \text{sgn}(\mathbf{w}_t \cdot \mathbf{x}_t)$
5 RECEIVE($y_t$)
6 if ($\widehat{y}_t \neq y_t$) then
7 $\mathbf{w}_{t+1} \leftarrow \mathbf{w}_t + y_t\mathbf{x}_t$ ▷ more generally $\eta y_t\mathbf{x}_t, \eta &gt; 0$.
8 else $\mathbf{w}_{t+1} \leftarrow \mathbf{w}_t$
9 return $\mathbf{w}_{T+1}$
</div>

## Figure 8.6

Perceptron algorithm.

## 8.3 Linear classification

This section presents two well-known on-line learning algorithms for linear classification: the Perceptron and Winnow algorithms.

## 8.3.1 Perceptron algorithm

The Perceptron algorithm is one of the earliest machine learning algorithms. It is an on-line linear classification algorithm. Thus, it learns a decision function based on a hyperplane by processing training points one at a time. Figure 8.6 gives its pseudocode.

The algorithm maintains a weight vector ${\mathbf w}_{t} ~ \in ~ \mathbb{R}^{N}$ defining the hyperplane learned, starting with an arbitrary vector $\mathbf{w}_{0}$ . At each round $t \in[T]$ , it predicts the label of the point $\mathbf{x}_{t} \in \mathbb{R}^{N}$ received, using the current vector $\mathbf{w}_{t}$ (line 4). When the prediction made does not match the correct label (lines 6-7), it updates $\mathbf{w}_{t}$ by adding $y_{t} \mathbf{x}_{t}$ . More generally, when a learning rate $\eta > 0$ is used, the vector added is $\eta y_{t} \mathbf{x}_{t}$ . This update can be partially motivated by examining the inner product of the current weight vector with $y_{t} \mathbf{x}_{t}$ , whose sign determines the classification of $\mathbf{x}_{t}$ Just before an update, $\mathbf{x}_{t}$ is misclassified and thus $y_{t} \mathbf{w}_{t} \cdot \mathbf{x}_{t}$ is negative; afterward, $y_{t} \mathbf{w}_{t + 1} \cdot \mathbf{x}_{t} = y_{t} \mathbf{w}_{t} \cdot \mathbf{x}_{t} + \eta \| \mathbf{x}_{t} \|^{2}$ , thus, the update corrects the weight vector in the direction of making the inner product $y_{t} \mathbf{w}_{t} \cdot \mathbf{x}_{t}$ positive by augmenting it with the quantity $\eta \| \mathbf{x}_{t} \|^{2} > 0$

![Figure 8.7](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/281859f3e856a8ab7aca4e9316fd662ab94495d3bcb358ff6f9327494fcd6d7c.jpg)  
Figure 8.7  
An example path followed by the iterative stochastic gradient descent technique. Each inner contour indicates a region of lower elevation.

The Perceptron algorithm can be shown in fact to seek a weight vector w minimizing an objective function $F$ precisely based on the quantities $(- y_{t} \mathbf{w} \cdot \mathbf{x}_{t}), t \in[T]$ Since $\left(- y_{t} \mathbf{w} \cdot \mathbf{x}_{t} \right)$ is positive when $\mathbf{x}_{t}$ is misclassified by w, F is defined for all $\mathbf{w} \in \mathbb{R}^{N}$ by

$$
F(\mathbf{w}) = \frac{1}{T} \sum_{t = 1}^{T} \max \Big(0, - y_{t}(\mathbf{w} \cdot \mathbf{x}_{t}) \Big) = \underset{\mathbf{x} \sim \widehat{\mathcal{D}}}{\mathbb{E}}[\widetilde{F}(\mathbf{w}, \mathbf{x})],\tag{8.21}
$$

where $\widetilde F(\mathbf w, \mathbf x) = \operatorname{max} \big(0, - f(\mathbf x)(\mathbf w \cdot \mathbf x) \big)$ with $f(\mathbf{x})$ denoting the label of $\mathbf{x},$ and $\widehat{\Phi}$ is the empirical distribution associated with the sample $\big(\mathbf{x}_{1}, \ldots, \mathbf{x}_{T} \big)$ . For any $t \in[T]$ , $\mathbf{w} \mapsto - y_{t}(\mathbf{w} \cdot \mathbf{x}_{t})$ is linear and thus convex. Since the max operator preserves convexity, this shows that $F$ is convex. However, $F$ is not diferentiable. Nevertheless, the Perceptron algorithm coincides with the application of the stochastic subgradient descent technique to $F$

The stochastic (or on-line) subgradient descent technique examines one point $\mathbf{x}_{t}$ at a time. Note, the function $\widetilde{F}(\cdot, \mathbf{x}_{t})$ is non-diferentiable for any $\mathbf{w}_{t}$ where ${\bf w}_{t} \cdot{\bf x}_{t} = 0$ . In such a case any subgradient of $\widetilde{F}.$ , i.e. any vector in the convex hull of 0 and $- y_{t} \mathbf{x}_{t}$ , may be used for the update step (see B.4.1). Choosing the subgradient $- y_{t} \mathbf{x}_{t}$ , we arrive at the following general update for each point $\mathbf{x}_{t} \mathbf{:}$

$$
\mathbf{w}_{t + 1} \leftarrow \left\{\begin{array}{ll} \mathbf{w}_{t} - \eta \nabla_{\mathbf{w}} \widetilde{F}(\mathbf{w}_{t}, \mathbf{x}_{t}) & \text{if} \mathbf{w}_{t} \cdot \mathbf{x}_{t} \neq 0 \\ \mathbf{w}_{t} + \eta y_{t} \mathbf{x}_{t} & \text{otherwise}, \end{array} \right.\tag{8.22}
$$

where $\eta > 0$ is a learning rate parameter. Figure 8.7 illustrates an example path the gradient descent follows. In the specific case we are considering, w $\mathbf{\xi} \cdot \mapsto \widetilde{F}(\mathbf{w}, \mathbf{x}_{t})$ is diferentiable at any w such that $y_{t}(\mathbf{w} \cdot \mathbf{x}_{t}) \neq 0$ with $\nabla_{\mathbf{w}} \widetilde{F}(\mathbf{w}, \mathbf{x}_{t}) = - y \mathbf{x}_{t}$ if $y_{t}(\mathbf{w} \cdot \mathbf{x}_{t}) < 0$ and $\nabla_{\mathbf{w}} \widetilde{F}(\mathbf{w}, \mathbf{x}_{t}) = 0 \mathrm{~ if ~} y_{t}(\mathbf{w} \cdot \mathbf{x}_{t}) > 0$ . Thus, the stochastic gradient

descent update becomes

$$
\mathbf{w}_{t + 1} \leftarrow \left\{\begin{array}{ll} \mathbf{w}_{t} + \eta y_{t} \mathbf{x}_{t} & \text{if} y_{t}(\mathbf{w}_{t} \cdot \mathbf{x}_{t}) \leq 0; \\ \mathbf{w}_{t} & \text{if} y_{t}(\mathbf{w}_{t} \cdot \mathbf{x}_{t}) > 0, \end{array} \right.\tag{8.23}
$$

which coincides exactly with the update of the Perceptron algorithm.

The following theorem gives a margin-based upper bound on the number of mistakes or updates made by the Perceptron algorithm when processing a sequence of T points that can be linearly separated by a hyperplane with margin $\rho > 0$

Theorem 8.8 Let $\mathbf{x}_{1}, \dots, \mathbf{x}_{T} \in \mathbb{R}^{N}$ be a sequence of T points with $\| \mathbf{x}_{t} \| \leq r$ for all $t \in[T]$ , for some $r > 0$ . Assume that there exist $\rho > 0$ and $\mathbf{v} \in \mathbb{R}^{N}$ such that for all $\begin{array}{r}{t \in[T], \rho \leq \frac{y_{t}(\mathbf v \cdot \mathbf x_{t})}{\| \mathbf v \|}} \end{array}$ . Then, the number of updates made by the Perceptron algorithm when processing $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ is bounded by $r^{2} / \rho^{2}$

Proof: Let I be the subset of the T rounds at which there is an update, and let M be the total number of updates, i.e., $|{\mathcal{I}} | = M$ . Summing up the assumption inequalities yields:

$$
\begin{array}{l} M \rho \leq \frac{\mathbf{v} \cdot \sum_{t \in \mathcal{I}} y_{t} \mathbf{x}_{t}}{\| \mathbf{v} \|} \leq \left\| \sum_{t \in \mathcal{I}} y_{t} \mathbf{x}_{t} \right\| \\ = \left\| \sum_{t \in \mathcal{I}}(\mathbf{w}_{t + 1} - \mathbf{w}_{t}) \right\| \\ = \| \mathbf{w}_{T + 1} \| \\ = \sqrt{\sum_{t \in \mathcal{I}} \| \mathbf{w}_{t + 1} \|^{2} - \| \mathbf{w}_{t} \|^{2}} \\ = \sqrt{\sum_{t \in \mathcal{I}} \| \mathbf{w}_{t} + y_{t} \mathbf{x}_{t} \|^{2} - \| \mathbf{w}_{t} \|^{2}} \\ = \sqrt{\sum_{t \in \mathcal{I}} 2 \underbrace{y_{t} \mathbf{w}_{t} \cdot \mathbf{x}_{t}}_{\leq 0} + \| \mathbf{x}_{t} \|^{2}} \\ \leq \sqrt{\sum_{t \in \mathcal{I}} \| \mathbf{x}_{t} \|^{2}} \leq \sqrt{Mr^{2}}.\end{array}\tag{definitionofupdates}
$$

Comparing the left- and right-hand sides gives $\sqrt{M} \leq r / \rho$ , that is, $M \le r^{2} / \rho^{2}$ . $\square$

By definition of the algorithm, the weight vector ${\bf w}_{T}$ after processing T points is a linear combination of the vectors $\mathbf{x}_{t}$ at which an update was made: $\begin{array}{r}{\mathbf{w}_{T} = \sum_{t \in \mathcal{I}} y_{t} \mathbf{x}_{t}} \end{array}$ Thus, as in the case of SVMs, these vectors can be referred to as support vectors for the Perceptron algorithm.

The bound of theorem 8.8 is remarkable, since it depends only on the normalized margin $\rho / r$ and not on the dimension N of the space. This bound can be shown to be tight, that is the number of updates can be equal to $r^{2} / \rho^{2}$ in some instances (see exercise 8.3 to show the upper bound is tight).

The theorem required no assumption about the sequence of points $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ . A standard setting for the application of the Perceptron algorithm is one where a finite sample S of size $m < T$ is available and where the algorithm makes multiple passes over these m points. The result of the theorem implies that when S is linearly separable, the Perceptron algorithm converges after a finite number of updates and thus passes. For a small margin $\rho,$ the convergence of the algorithm can be quite slow, however. In fact, for some samples, regardless of the order in which the points in S are processed, the number of updates made by the algorithm is in $\Omega(2^{N})$ (see exercise 8.1). Of course, if S is not linearly separable, the Perceptron algorithm does not converge. In practice, it is stopped after some number of passes over $S.$

There are many variants of the standard Perceptron algorithm which are used in practice and have been theoretically analyzed. One notable example is the voted Perceptron algorithm, which predicts according to the rule sgn $\begin{array}{r}{\big((\sum_{t \in \mathbb{J}} c_{t} \mathbf{w}_{t}) \cdot \mathbf{x} \big)} \end{array}$ , where $c_{t}$ is a weight proportional to the number of iterations that $\mathbf{w}_{t}$ survives, i.e., the number of iterations between $\mathbf{w}_{t}$ and $\mathbf{w}_{t + 1}$

For the following theorem, we consider the case where the Perceptron algorithm is trained via multiple passes till convergence over a finite sample that is linearly separable. In view of theorem 8.8, convergence occurs after a finite number of updates.

For a linearly separable sample S, we denote by $r_{S}$ the radius of the smallest origin-centered sphere containing all points in S and by $\rho_{S}$ the largest margin of a separating hyperplane for S. We also denote by $M(S)$ the number of updates made by the algorithm after training over S.

Theorem 8.9 Assume that the data is linearly separable. Let $h_{S}$ be the hypothesis returned by the Perceptron algorithm after training over a sample S of size m drawn according to some distribution D. Then, the expected error of $h_{S}$ is bounded as follows:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[R(h_{S})] \leq \underset{S \sim \mathcal{D}^{m + 1}}{\mathbb{E}} \left[\frac{\min \left(M(S), r_{S}^{2} / \rho_{S}^{2}\right)}{m + 1} \right].
$$

Proof: Let S be a linearly separable sample of size $m + 1$ drawn i.i.d. according to D and let x be a point in S. If $h_{S - \{{\bf x}\}}$ misclassifies $\mathbf{x},$ then x must be a support vector for $h_{S}$ . Thus, the leave-one-out error of the Perceptron algorithm on sample

S is at most $\frac{M(S)}{m + 1}$ . The result then follows lemma 5.3, which relates the expected leave-one-out error to the expected error, along with the upper bound on $M(S)$ given by theorem 8.8. $\square$

This result can be compared with a similar one given for the SVM algorithm (with no ofset) in the following theorem, which is an extension of theorem 5.4. We denote by $N_{\mathrm{SV}}(S)$ the number of support vectors that define the hypothesis $h_{S}$ returned by SVMs when trained on a sample S.

Theorem 8.10 Assume that the data is linearly separable. Let $h_{S}$ be the hypothesis returned by SVMs used with no ofset $(b = 0)$ after training over a sample S of size m drawn according to some distribution D. Then, the expected error of $h_{S}$ is bounded as follows:

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[R(h_{S})] \leq \underset{S \sim \mathcal{D}^{m + 1}}{\mathbb{E}} \left[\frac{\min \left(N_{SV}(S), r_{S}^{2} / \rho_{S}^{2}\right)}{m + 1} \right].
$$

Proof: The fact that the expected error can be upper bounded by the average fraction of support vectors $(N_{\mathrm{SV}}(S) /(m + 1))$ was already shown by theorem $5.4.$ Thus, it sufices to show that it is also upper bounded by the expected value of $(r_{S}^{2} / \rho_{S}^{2}) /(m + 1)$ . To do so, we will bound the leave-one-out error of the SVM algorithm for a sample $S$ of size $m + 1$ by $(r_{S}^{2} / \rho_{S}^{2}) /(m + 1)$ . The result will then follow by lemma 5.3, which relates the expected leave-one-out error to the expected error.

Let $S =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m + 1})$ be a linearly separable sample drawn i.i.d. according to D and let x be a point in $S$ that is misclassified by $h_{S - \{{\bf x}\}}$ . We will analyze the case where $\mathbf{x} = \mathbf{x}_{m + 1}$ , the analysis of other cases is similar. We denote by $S^{\prime}$ the sample $\left(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m} \right)$

For any $q \in[m + 1]$ , let $G_{q}$ denote the function defined over $\mathbb{R}^{q}$ by $G_{q} \colon \alpha \mapsto$ $\begin{array}{r}{\sum_{i = 1}^{q} \alpha_{i} - \frac{1}{2} \sum_{i, j = 1}^{q} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j})} \end{array}$ . Then, $G_{m + 1}$ is the objective function of the dual optimization problem for SVMs associated to the sample $S$ and $G_{m}$ the one for the sample $S^{\prime}$ . Let $\pmb{\alpha} \in \mathbb{R}^{m + 1}$ denote a solution of the dual SVM problem $\operatorname{max}_{\alpha \geq 0} G_{m + 1}(\alpha)$ and $\pmb{\alpha}^{\prime} \in \mathbb{R}^{m + 1}$ the vector such that $(\alpha_{1}^{\prime}, \ldots, \alpha_{m}^{\prime})^{\top} \in \mathbb{R}^{m}$ is a solution of ma ${\mathrm{\bf \hat{\alpha}}}_{\bf \Delta}_{\bf \hat{\alpha}}{\geq} 0 \G_{m}(\alpha)$ and $\alpha_{m + 1}^{\prime} = 0$ . Let $\mathbf{e}_{m + 1}$ denote the $(m + 1)$ th unit vector in $\mathbb{R}^{m + 1}$ . By definition of α and $\mathbf{{\boldsymbol{\alpha}}^{\prime}}$ as maximizers, max ${\bf \sigma}_{; \beta \geq 0} G_{m + 1}(\pmb{\alpha}^{\prime} +$ $\beta \mathbf{e}_{m + 1}) \leq G_{m + 1}(\alpha)$ and $G_{m + 1}(\alpha - \alpha_{m + 1} \mathbf{e}_{m + 1}) \leq G_{m}(\alpha^{\prime})$ . Thus, the quantity $A = G_{m + 1}(\pmb{\alpha}) - G_{m}(\pmb{\alpha}^{\prime})$ admits the following lower and upper bounds:

$$
\max_{\beta \geq 0} G_{m + 1}(\boldsymbol{\alpha}^{\prime} + \beta \mathbf{e}_{m + 1}) - G_{m}(\boldsymbol{\alpha}^{\prime}) \leq A \leq G_{m + 1}(\boldsymbol{\alpha}) - G_{m + 1}(\boldsymbol{\alpha} - \alpha_{m + 1} \mathbf{e}_{m + 1}).
$$

Let $\begin{array}{r}{\mathbf{w} = \sum_{i = 1}^{m + 1} y_{i} \alpha_{i} \mathbf{x}_{i}} \end{array}$ denote the weight vector returned by SVMs for the sample $S.$ Since $h_{S^{\prime}}$ misclassifies $\mathbf{x}_{m + 1}, \ \mathbf{x}_{m + 1}$ must be a support vector for $h_{S}$ , thus $y_{m + 1} \mathbf{w} \cdot \mathbf{x}_{m + 1} = 1$ . In view of that, the upper bound can be rewritten as follows:

$$
\begin{array}{l} G_{m + 1}(\boldsymbol{\alpha}) - G_{m + 1}(\boldsymbol{\alpha} - \alpha_{m + 1} \mathbf{e}_{m + 1}) \\ \qquad = \alpha_{m + 1} - \sum_{i = 1}^{m + 1}(y_{i} \alpha_{i} \mathbf{x}_{i}) \cdot(y_{m + 1} \alpha_{m + 1} \mathbf{x}_{m + 1}) + \frac{1}{2} \alpha_{m + 1}^{2} \| \mathbf{x}_{m + 1} \|^{2} \\ \qquad = \alpha_{m + 1}(1 - y_{m + 1} \mathbf{w} \cdot \mathbf{x}_{m + 1}) + \frac{1}{2} \alpha_{m + 1}^{2} \| \mathbf{x}_{m + 1} \|^{2} \\ \qquad = \frac{1}{2} \alpha_{m + 1}^{2} \| \mathbf{x}_{m + 1} \|^{2}.\end{array}
$$

Similarly, let $\begin{array}{r}{\mathbf{w}^{\prime} = \sum_{i = 1}^{m} y_{i} \alpha_{i}^{\prime} \mathbf{x}_{i}} \end{array}$ . Then, for any $\beta \geq 0$ , the quantity maximized in the lower bound can be written as

$$
\begin{array}{rl} & G_{m + 1}(\pmb{\alpha}^{\prime} + \beta \mathbf{e}_{m + 1}) - G_{m}(\pmb{\alpha}^{\prime}) \\ & \qquad = \beta \big(1 - y_{m + 1}(\mathbf{w}^{\prime} + \beta y_{m + 1} \mathbf{x}_{m + 1}) \cdot \mathbf{x}_{m + 1} \big) + \frac{1}{2} \beta^{2} \| \mathbf{x}_{m + 1} \|^{2} \\ & \qquad = \beta(1 - y_{m + 1} \mathbf{w}^{\prime} \cdot \mathbf{x}_{m + 1}) - \frac{1}{2} \beta^{2} \| \mathbf{x}_{m + 1} \|^{2}.\end{array}
$$

The right-hand side is maximized for the following value of $\begin{array}{rl}{\beta \colon} &{{} \frac{1 - y_{m + 1} \mathbf w^{\prime} \cdot \mathbf x_{m + 1}}{\| \mathbf x_{m + 1} \|^{2}}} \end{array}$ Plugging in this value in the right-hand side gives $\begin{array}{r}{\frac{1}{2} \frac{\left(1 - y_{m + 1} \mathbf{w}^{\prime} \cdot \mathbf{x}_{m + 1} \right)^{2}}{\left\| \mathbf{x}_{m + 1} \right\|^{2}}} \end{array}$ . Thus,

$$
A \geq \frac{1}{2} \frac{(1 - y_{m + 1} \mathbf{w}^{\prime} \cdot \mathbf{x}_{m + 1})^{2}}{\| \mathbf{x}_{m + 1} \|^{2}} \geq \frac{1}{2 \| \mathbf{x}_{m + 1} \|^{2}},
$$

using the fact that $y_{m + 1} \mathbf{w}^{\prime}{\cdot} \mathbf{x}_{m + 1} < 0$ , since $\mathbf{x}_{m + 1}$ is misclassified by $\mathbf{w}^{\prime}$ . Comparing this lower bound on A with the upper bound previously derived leads to $\frac{1}{2 \| \mathbf{x}_{m + 1} \|^{2}} \leq$ $\begin{array}{rl}{{\frac{1}{2} \alpha_{m + 1}^{2} \Vert \mathbf{x}_{m + 1} \Vert^{2}} \quad} &{{}} \end{array}$ , that is

$$
\alpha_{m + 1} \geq \frac{1}{\| \mathbf{x}_{m + 1} \|^{2}} \geq \frac{1}{r_{S}^{2}}.
$$

The analysis carried out in the case ${\bf x} ={\bf x}_{m + 1}$ holds similarly for any $\mathbf{x}_{i}$ in $S$ that is misclassified by $h_{S - \left\{\mathbf{x}_{i} \right\}}$ . Let I denote the set of such indices i. Then, we can write:

$$
\sum_{i \in \mathcal{I}} \alpha_{i} \geq \frac{| \mathcal{I} |}{r_{S}^{2}}.
$$

By (5.19), the following simple expression holds for the margin: $\begin{array}{r}{\sum_{i = 1}^{m + 1} \alpha_{i} = 1 / \rho_{S}^{2}} \end{array}$ Using this identity leads to

$$
| \mathcal{I} | \leq r_{S}^{2} \sum_{i \in \mathcal{I}} \alpha_{i} \leq r_{S}^{2} \sum_{i = 1}^{m + 1} \alpha_{i} = \frac{r_{S}^{2}}{\rho_{S}^{2}}.
$$

Since by definition I is the total number of leave-one-out errors, this concludes the proof. $\square$

Thus, the guarantees given by theorem 8.9 and theorem 8.10 in the separable case have a similar form. These bounds do not seem sufficient to distinguish the effectiveness of the SVM and Perceptron algorithms. Note, however, that while the same margin quantity $\rho_{S}$ appears in both bounds, the radius $r_{S}$ can be replaced by a finer quantity that is different for the two algorithms: in both cases, instead of the radius of the sphere containing all sample points, $r_{S}$ can be replaced by the radius of the sphere containing the support vectors, as can be seen straightforwardly from the proof of the theorems. Thus, the position of the support vectors in the case of SVMs can provide a more favorable guarantee than that of the support vectors (update vectors) for the Perceptron algorithm. Finally, the guarantees given by these theorems are somewhat weak. These are not high probability bounds, they hold only for the expected error of the hypotheses returned by the algorithms and in particular provide no information about the variance of their error.

The following two theorems give bounds on the number of updates or mistakes made by the Perceptron algorithm in the more general scenario of a non-linearly separable sample in terms of the $\rho{\mathrm{- Hinge}}$ losses of an arbitrary weight vector v.

Theorem 8.11 Let I denote the set of indices $t \in[T]$ at which the Perceptron algorithm makes an update when processing a sequence $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ with $\| \mathbf{x}_{t} \| \leq r$ for some $r > 0$ . Then, the number of updates $M = | \mathcal{I} |$ made by the algorithm can be bounded as follows:

$$
M \leq \inf_{\rho > 0, \| \mathbf{v} \|_{2} \leq 1} \left[\frac{\frac{r}{\rho} + \sqrt{\frac{r^{2}}{\rho^{2}} + 4 \| \mathbf{l}_{\rho} \|_{1}}}{2} \right]^{2} \leq \inf_{\rho > 0, \| v \|_{2} \leq 1} \left(\frac{r}{\rho} + \sqrt{\| \mathbf{l}_{\rho} \|_{1}}\right)^{2},
$$

where $\mathbf{l}_{\rho} =(l_{t})_{t \in \mathcal{I}}$ with $\begin{array}{r}{l_{t} = \operatorname{max} \left\{0, 1 - \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\rho} \right\}} \end{array}$

Proof: Fix $\rho > 0$ and v with $\| \mathbf{v} \|_{2} = 1$ . By definition of $l_{t}$ , for any t, we have $\begin{array}{r}{1 - \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\rho} \dot{\leq} l_{t}} \end{array}$ . Summing up these inequalities over all $t \in{\mathcal{I}}$ yields

$$
\begin{array}{rl} & M \leq \sum_{t \in \mathcal{I}} l_{t} + \sum_{t \in \mathcal{I}} \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\rho} \\ & \quad = \| \mathbf{l}_{\rho} \|_{1} + \sum_{t \in \mathcal{I}} \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\rho} \leq \| \mathbf{l}_{\rho} \|_{1} + \frac{\sqrt{Mr^{2}}}{\rho}, \end{array}\tag{8.24}
$$

where the last inequality holds by the bound shown in the proof of the separable case (theorem 8.8): $\begin{array}{r}{\frac{\mathbf{v} \cdot \sum_{t \in \mathcal{I}}^{\mathbf{v}} y_{t} \mathbf{x}_{t}}{\| \mathbf{v} \|} \leq^{\mathbf{^{\prime}}} \sqrt{Mr^{2}}} \end{array}$ . Now, solving the resulting second-degree inequality $\begin{array}{r}{M \leq \| \mathbf{l}_{\rho} \|_{1} + \frac{\sqrt{Mr^{2}}}{\rho}} \end{array}$ gives $\begin{array}{r}{\sqrt{M} \le \frac{1}{2} \big(\frac{r}{\rho} + \sqrt{\frac{r^{2}}{\rho^{2}} + 4 \| \mathbf{l}_{\rho} \|_{1}} \big)} \end{array}$ , which proves the first inequality. The second inequality follows from the sub-additivity of the square-root function. $\square$

Theorem 8.12 Let I denote the set of indices $t \in[T]$ at which the Perceptron algorithm makes an update when processing a sequence $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ with $\| \mathbf{x}_{t} \| \leq r$ for some $r > 0$ . Then, the number of updates $M = | \mathcal{I} |$ made by the algorithm can be bounded as follows:

$$
M \leq \inf_{\rho > 0, \| v \|_{2} \leq 1} \left(\frac{r}{\rho} + \| \mathbf{l}_{\rho} \|_{2}\right)^{2},
$$

where $\mathbf{l}_{\rho} =(l_{t})_{t \in \mathcal{I}}$ with $\begin{array}{r}{l_{t} = \operatorname{max} \left\{0, 1 - \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\rho} \right\}} \end{array}$

Proof: Fix $\rho > 0$ and v with $\| \mathbf{v} \|_{2} = 1$ . Starting with line (8.24) of theorem 8.11 and using $\| \mathbf{l}_{\rho} \|_{1} \leq \sqrt{M} \| \mathbf{l}_{\rho} \|_{2}$ , which holds by the Cauchy-Schwarz inequality, give

$$
M \leq \| \mathbf{l}_{\rho} \|_{1} + \frac{\sqrt{Mr^{2}}}{\rho} \leq \sqrt{M} \| \mathbf{l}_{\rho} \|_{2} + \frac{\sqrt{Mr^{2}}}{\rho}.
$$

This implies $\begin{array}{r}{\sqrt{M} \le \| \mathbf{l}_{\rho} \|_{2} + \frac{\sqrt{r^{2}}}{\rho}} \end{array}$ and proves the statement.

These bounds strictly generalize the bounds given in the separable case (theorem 8.8) since in that case the vector v can be chosen to be that of a maximummargin hyperplane with no Hinge loss at any point. The main diference between the two bounds is the $L_{\mathrm{1}} \mathrm{- norm}$ of the vector of Hinge losses in Theorem 8.11 versus the $L_{\mathrm{{2}}} \mathrm{{- norm}}$ in Theorem 8.12. Note that, since the $L_{\mathrm{{2}}} \mathrm{{- norm}}$ bound follows from upper bounding inequality (8.24), which is equivalent to the first inequality of Theorem 8.11, the first $L_{\mathrm{1}} \mathrm{- norm}$ bound of Theorem 8.11 is always tighter than the $L_{\mathrm{{2}}} \mathrm{{- norm}}$ bound of Theorem 8.12.

The Perceptron algorithm can be generalized, as in the case of SVMs, to define a linear separation in a high-dimensional space. It admits an equivalent dual form, the dual Perceptron algorithm, which is presented in figure 8.8. The dual Perceptron algorithm maintains a vector ${\pmb{\alpha}} \in \mathbb{R}^{T}$ of coeficients assigned to each point $\mathbf{x}_{t}$ $t \in[T]$ . The label of a point $\mathbf{x}_{t}$ is predicted according to the rule $\operatorname{sgn}(\mathbf{w} \cdot \mathbf{x}_{t})$ , where $\begin{array}{r}{\mathbf{w} = \sum_{s = 1}^{T} \alpha_{s} y_{s} \mathbf{x}_{s}} \end{array}$ . The coeficient $\alpha_{t}$ is incremented by one when this prediction does not match the correct label. Thus, an update for $\mathbf{x}_{t}$ is equivalent to augmenting the weight vector w with $y_{t} \mathbf{x}_{t}$ , which shows that the dual algorithm matches exactly the standard Perceptron algorithm. The dual Perceptron algorithm can be written solely in terms of inner products between training instances. Thus, as in the case of SVMs, instead of the inner product between points in the input space, an arbitrary PDS kernel can be used, which leads to the kernel Perceptron algorithm detailed in figure 8.9. The kernel Perceptron algorithm and its average variant, i.e., voted Perceptron with uniform weights $c_{t}$ , are commonly used algorithms in a variety of applications.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
DUALPERCEPTRON( $\alpha_{0}$ )

1  $\alpha \leftarrow \alpha_{0}$  ▷ typically  $\alpha_{0} = 0$ 

2 for  $t \leftarrow 1$  to T do

3 RECEIVE( $x_{t}$ )

4  $\widehat{y}_{t} \leftarrow \text{sgn}(\sum_{s=1}^{T} \alpha_{s} y_{s}(x_{s} \cdot x_{t}))$ 

5 RECEIVE( $y_{t}$ )

6 if ( $\widehat{y}_{t} \neq y_{t}$ ) then

7  $\alpha_{t} \leftarrow \alpha_{t} + 1$ 

8 else  $\alpha_{t} \leftarrow \alpha_{t}$ 

9 return  $\alpha$
</div>

## Figure 8.8

Dual Perceptron algorithm.

## 8.3.2 Winnow algorithm

This section presents an alternative on-line linear classification algorithm, the Winnow algorithm. Thus, it learns a weight vector defining a separating hyperplane by sequentially processing the training points. As suggested by the name, the algorithm is particularly well suited to cases where a relatively small number of dimensions or experts can be used to define an accurate weight vector. Many of the other dimensions may then be irrelevant.

The Winnow algorithm is similar to the Perceptron algorithm, but, instead of the additive update of the weight vector in the Perceptron case, Winnow’s update is multiplicative. The pseudocode of the algorithm is given in figure 8.10. The algorithm takes as input a learning parameter $\eta > 0$ . It maintains a non-negative weight vector $\mathbf{w}_{t}$ with components summing to one $(\| \mathbf{w}_{t} \|_{1} = 1)$ starting with the uniform weight vector (line 1). At each round $t \in[T]$ , if the prediction does not match the correct label (line 6), each component $w_{t, i}, i \in[N]$ , is updated by multiplying it by $\exp(\eta y_{t} x_{t, i})$ and dividing by the normalization factor $Z_{t}$ to ensure that the weights sum to one (lines 7–9). Thus, if the label $y_{t}$ and $\boldsymbol{x}_{t, i}$ share the same sign, then $w_{t, i}$ is increased, while, in the opposite case, it is significantly decreased.

The Winnow algorithm is closely related to the WM algorithm: when $\mathbf{x}_{t, i} ~ \in$ $\{- 1, + 1\}, \mathrm{sgn}(\mathbf{w}_{t} \cdot \mathbf{x}_{t})$ coincides with the majority vote, since multiplying the weight of correct or incorrect experts by $e^{\eta}$ or $e^{- \eta}$ is equivalent to multiplying the weight

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
KERNELPERCEPTRON( $\alpha_{0}$ )

1  $\alpha \leftarrow \alpha_{0}$  ▷ typically  $\alpha_{0} = 0$ 

2 for  $t \leftarrow 1$  to T do

3  $\text{RECEIVE}(x_{t})$ 

4  $\widehat{y}_{t} \leftarrow \text{sgn}(\sum_{s=1}^{T} \alpha_{s} y_{s} K(x_{s}, x_{t}))$ 

5  $\text{RECEIVE}(y_{t})$ 

6 if ( $\widehat{y}_{t} \neq y_{t}$ ) then

7  $\alpha_{t} \leftarrow \alpha_{t} + 1$ 

8 else  $\alpha_{t} \leftarrow \alpha_{t}$ 

9 return  $\alpha$
</div>

## Figure 8.9

Kernel Perceptron algorithm for PDS kernel K.

of incorrect ones by $\beta = e^{- 2 \eta}$ . The multiplicative update rule of Winnow is of course also similar to that of AdaBoost.

The following theorem gives a mistake bound for the Winnow algorithm in the separable case, which is similar in form to the bound of theorem 8.8 for the Perceptron algorithm.

Theorem 8.13 Let $\mathbf{x}_{1}, \dots, \mathbf{x}_{T} \in \mathbb{R}^{N}$ be a sequence of T points with $\| x_{t} \|_{\infty} \leq r_{\infty}$ for all $t \in[T]$ , for some $r_{\infty} > 0, \A$ ssume that there exist $\mathbf{v} \in \mathbb{R}^{N}, \mathbf{v} \geq 0$ , and $\rho_{\infty} > 0$ such that for all $\begin{array}{r}{t \in[T], \rho_{\infty} \leq \frac{y_{t}(\mathbf{v} \cdot \mathbf{x}_{t})}{\| \mathbf{v} \|_{1}}} \end{array}$ . Then, for $\begin{array}{r}{\eta = \frac{\rho_{\infty}}{r_{\infty}^{2}}} \end{array}$ , the number of updates made by the Winnow algorithm when processing $\mathbf{x}_{1}, \ldots, \mathbf{x}_{T}$ is upper bounded by $2 \left(r_{\infty}^{2} / \rho_{\infty}^{2} \right)$ log N.

Proof: Let $\mathcal{I} \subseteq[T]$ be the set of iterations at which there is an update, and let M be the total number of updates, $\mathrm{i.e., ~} | \mathcal{I} | = M$ . The potential function $\Phi_{t}, t \in[T]$ , used for this proof is the relative entropy of the distribution defined by the normalized weights $v_{i} / \| \mathbf{v} \|_{1} \geq 0, i \in[N]$ , and the one defined by the components of the weight vector $w_{t, i}, i \in[N]$ :

$$
\Phi_{t} = \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} \log \frac{v_{i} / \| \mathbf{v} \|_{1}}{w_{t, i}}.
$$

To derive an upper bound on $\Phi_{t}.$ we analyze the diference of the potential functions at two consecutive rounds. For all $t \in J$ , this diference can be expressed and

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
WINNOW(η)
1  $w_{1} \leftarrow 1/N$ 
2 for  $t \leftarrow 1$  to T do
3  $\text{RECEIVE}(\mathbf{x}_{t})$ 
4  $\widehat{y}_{t} \leftarrow \text{sgn}(\mathbf{w}_{t} \cdot \mathbf{x}_{t})$ 
5  $\text{RECEIVE}(y_{t})$ 
6 if ( $\widehat{y}_{t} \neq y_{t}$ ) then
7  $Z_{t} \leftarrow \sum_{i=1}^{N} w_{t,i} \exp(\eta y_{t} x_{t,i})$ 
8 for  $i \leftarrow 1$  to N do
9  $w_{t+1,i} \leftarrow \frac{w_{t,i} \exp(\eta y_{t} x_{t,i})}{Z_{t}}$ 
10 else  $w_{t+1} \leftarrow w_{t}$ 
11 return  $w_{T+1}$
</div>

## Figure 8.10

Winnow algorithm, with $y_{t} \in \{- 1, + 1\}$ for all $t \in[T]$

bounded as follows:

$$
\begin{array}{rl} &{\Phi_{t + 1} - \Phi_{t} = \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} \log \frac{w_{t, i}}{w_{t + 1, i}}} \\ &{\qquad = \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} \log \frac{Z_{t}}{\exp(\eta y_{t} x_{t, i})}} \\ &{\qquad = \log Z_{t} - \eta \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} y_{t} x_{t, i}} \\ &{\qquad \leq \log \left[\sum_{i = 1}^{N} w_{t, i} \exp(\eta y_{t} x_{t, i}) \right] - \eta \rho_{\infty}} \\ &{\qquad = \log \underset{i \sim \mathbf{w}_{t}}{\mathbb{E}} \left[\exp(\eta y_{t} x_{t, i}) \right] - \eta \rho_{\infty}} \\ &{\qquad = \log \underset{i \sim \mathbf{w}_{t}}{\mathbb{E}} \left[\exp(\eta y_{t} x_{t, i} - \eta y_{t} \mathbf{w}_{t} \cdot x_{t} + \eta y_{t} \mathbf{w}_{t} \cdot x_{t}) \right] - \eta \rho_{\infty}} \\ &{\qquad \leq \log \left[\exp(\eta^{2}(2r_{\infty})^{2} / 8) \right] + \underbrace{\eta y_{t}(\mathbf{w}_{t} \cdot x_{t})}_{\leq 0} - \eta \rho_{\infty}} \\ &{\qquad \leq \eta^{2} r_{\infty}^{2} / 2 - \eta \rho_{\infty}.} \end{array}
$$

The first inequality follows the definition of $\rho_{\infty}$ . The subsequent equality rewrites the summation as an expectation over the distribution defined by $\mathbf{w}_{t}$ . The next inequality uses Hoefding’s lemma (lemma D.1) and the last one the fact that there has been an update at $t,$ which implies $y_{t}(\mathbf{w}_{t} \cdot x_{t}) \leq 0$ . Summing up these inequalities over all $t \in{\mathcal{I}}$ yields:

$$
\Phi_{T + 1} - \Phi_{1} \leq M(\eta^{2} r_{\infty}^{2} / 2 - \eta \rho_{\infty}).
$$

Next, we derive a lower bound by noting that

$$
\Phi_{1} = \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} \log \frac{v_{i} / \| \mathbf{v} \|_{1}}{1 / N} = \log N + \sum_{i = 1}^{N} \frac{v_{i}}{\| \mathbf{v} \|_{1}} \log \frac{v_{i}}{\| \mathbf{v} \|_{1}} \leq \log N.
$$

Additionally, since the relative entropy is always non-negative, we have $\Phi_{T + 1} \geq 0$ This yields the following lower bound:

$$
\Phi_{T + 1} - \Phi_{1} \geq 0 - \log N = - \log N.
$$

Combining the upper and lower bounds we see that  log $N \leq M(\eta^{2} r_{\infty}^{2} / 2 - \eta \rho_{\infty})$ Setting $\begin{array}{r}{\eta = \frac{\rho_{\infty}}{r_{\infty}^{2}}} \end{array}$ yields the statement of the theorem. $\square$

The margin-based mistake bounds of theorem 8.8 and theorem 8.13 for the Perceptron and Winnow algorithms have a similar form, but they are based on different norms. For both algorithms, the norm $\| \cdot \|_{p}$ used for the input vectors $\mathbf{x}_{t}, t \in[T]$ , is the dual of the norm $\| \cdot \|_{q}$ used for the margin vector $\mathbf{v},$ that is $p$ and q are conjugate: $1 / p + 1 / q = 1$ : in the case of the Perceptron algorithm $p = q = 2$ , while for Winnow $p = \infty$ and $q = 1$

These bounds imply different types of guarantees. The bound for Winnow is favorable when a sparse set of the experts $i \in[N]$ can predict well. For example, if $\mathbf{v} = \mathbf{e}_{1}$ where $\mathbf{e}_{1}$ is the unit vector along the first axis in $\mathbb{R}^{N}$ and if $\mathbf{x}_{t} \in \{- 1, + 1\}^{N}$ for all t, then the upper bound on the number of mistakes given for Winnow by theorem 8.13 is only 2 log $N_{:}$ , while the upper bound of theorem 8.8 for the Perceptron algorithm is N. The guarantee for the Perceptron algorithm is more favorable in the opposite situation, where sparse solutions are not efective.

## 8.4 On-line to batch conversion

The previous sections presented several algorithms for the scenario of on-line learning, including the Perceptron and Winnow algorithms, and analyzed their behavior within the mistake model, where no assumption is made about the way the training sequence is generated. Can these algorithms be used to derive hypotheses with small generalization error in the standard stochastic setting? How can the intermediate hypotheses they generate be combined to form an accurate predictor? These are the questions addressed in this section.

Let H be a hypothesis of functions mapping X to $\mathcal{Y}^{\prime}.$ , and let $L \colon \mathcal{Y}^{\prime} \times \mathcal{Y} \mathbb{R}_{+}$ be a bounded loss function, that is $L \leq M$ for some $M \geq 0$ . We assume a standard supervised learning setting where a labeled sample $S =((x_{1}, y_{1}), \dotsc,(x_{T}, y_{T})) \in$ $(\mathcal{X} \times \mathcal{Y})^{T}$ is drawn i.i.d. according to some fixed but unknown distribution D. The sample is sequentially processed by an on-line learning algorithm . The algorithm starts with an initial hypothesis $h_{1} \in \mathcal{H}$ and generates a new hypothesis $h_{t + 1} \in \mathcal{H},$ after processing pair $(x_{t}, y_{t}), t \in[m]$ . The regret of the algorithm is defined as before by

$$
R_{T} = \sum_{t = 1}^{T} L(h_{t}(x_{t}), y_{t}) - \min_{h \in \mathcal{H}} \sum_{t = 1}^{T} L(h(x_{t}), y_{t}).\tag{8.25}
$$

The generalization error of a hypothesis $h \in{\mathcal{H}}$ is its expected loss $R(h) =$ $\mathbb{E}_{(x, y) \sim \mathcal{D}}[L(h(x), y)]$

The following lemma gives a bound on the average of the generalization errors of the hypotheses generated by in terms of its average loss $\begin{array}{r}{\frac{1}{T} \sum_{t = 1}^{T} L(h_{t}(x_{t}), y_{t})} \end{array}$

Lemma 8.14 Let $S =((x_{1}, y_{1}), \ldots,(x_{T}, y_{T})) \in(\mathfrak{X} \times \mathfrak{Y})^{T}$ be a labeled sample drawn i.i.d. according to D, L a loss bounded by M and $h_{1}, \ldots, h_{T}$ the sequence of hypotheses generated by an on-line algorithm sequentially processing S. Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , the following holds:

$$
\frac{1}{T} \sum_{t = 1}^{T} R(h_{t}) \leq \frac{1}{T} \sum_{t = 1}^{T} L(h_{t}(x_{t}), y_{t}) + M \sqrt{\frac{2 \log \frac{1}{\delta}}{T}}.\tag{8.26}
$$

Proof: For any $t \in[T]$ , let $V_{t}$ be the random variable defined by $V_{t} = R(h_{t}) \ : - \ :$ $L(h_{t}(x_{t}), y_{t})$ . Observe that for any $t \in[T]$

$$
\mathbb{E}[V_{t} | x_{1}, \dots, x_{t - 1}] = R(h_{t}) - \mathbb{E}[L(h_{t}(x_{t}), y_{t}) | h_{t}] = R(h_{t}) - R(h_{t}) = 0.
$$

Since the loss is bounded by M, $V_{t}$ takes values in the interval $[- M, + M]$ for all $t \in[T]$ Thus, by Azuma’s inequality (theorem D.7), $\begin{array}{r}{\mathbb{P}[\frac{1}{T} \sum_{t = 1}^{\bar{T}} V_{t} \geq \bar{\epsilon}] \leq} \end{array}$ $\exp(- 2T \epsilon^{2} /(2M)^{2})\}$ ). Setting the right-hand side to be equal to $\delta > 0$ yields the statement of the lemma. $\square$

When the loss function is convex with respect to its first argument, the lemma can be used to derive a bound on the generalization error of the average of the hypotheses generated by $A, \{\frac{1}{T}} \sum_{t = 1}^{T} h_{t}$ , in terms of the average loss of on S, or in terms of the regret $R_{T}$ and the infimum error of hypotheses in H.

Theorem 8.15 Let $S =((x_{1}, y_{1}), \ldots,(x_{T}, y_{T})) \in(\mathbb{X} \times \mathbb{Y})^{T}$ be a labeled sample drawn i.i.d. according to D, L a loss bounded by M and convex with respect to its first argument, and $h_{1}, \ldots, h_{T}$ the sequence of hypotheses generated by an on-line algorithm sequentially processing S. Then, for any $\delta > 0$ , with probability at least

$1 - \delta$ , each of the following holds:

$$
R \left(\frac{1}{T} \sum_{t = 1}^{T} h_{t}\right) \leq \frac{1}{T} \sum_{t = 1}^{T} L(h_{t}(x_{t}), y_{t}) + M \sqrt{\frac{2 \log \frac{1}{\delta}}{T}}\tag{8.27}
$$

$$
R \bigg(\frac{1}{T} \sum_{t = 1}^{T} h_{t} \bigg) \leq \inf_{h \in \mathcal{H}} R(h) + \frac{R_{T}}{T} + 2M \sqrt{\frac{2 \log \frac{2}{\delta}}{T}}.\tag{8.28}
$$

Proof: By the convexity of L with respect to its first argument, for any $(x, y) \in \mathcal{X} \times$ Y, we have $\begin{array}{r}{L(\frac{1}{T} \sum_{t = 1}^{T} \dot{h}_{t}(x), y) \le \frac{1}{T} \sum_{t = 1}^{T} L(h_{t}(x), y)} \end{array}$ . Taking the expectation gives $\begin{array}{r}{R(\frac{1}{T} \sum_{t = 1}^{T} h_{t}) \dot{\leq} \frac{1}{T} \sum_{t = 1}^{T} R(h_{t})} \end{array}$ . The first inequality then follows by lemma 8.14. Thus, by definition of the regret $R_{T}$ , for any $\delta > 0$ , the following holds with probability at least $1 - \delta / 2 $

$$
\begin{array}{l} R \bigg(\frac{1}{T} \sum_{t = 1}^{T} h_{t} \bigg) \leq \frac{1}{T} \sum_{t = 1}^{T} L(h_{t}(x_{t}), y_{t}) + M \sqrt{\frac{2 \log \frac{2}{\delta}}{T}} \\ \qquad \leq \min_{h \in \mathcal{H}} \frac{1}{T} \sum_{t = 1}^{T} L(h(x_{t}), y_{t}) + \frac{R_{T}}{T} + M \sqrt{\frac{2 \log \frac{2}{\delta}}{T}}.\end{array}
$$

By definition of in $f_{h \in \mathcal{H}} R(h)$ , for any $\epsilon > 0$ , there exists $h^{\ast} \in \mathcal{H}$ with $R(h^{*}) \leq$ $\operatorname{inf}_{h \in \mathcal{H}} R(h) + \epsilon$ . By Hoefding’s inequality, for any $\delta > 0$ , with probability at least $\begin{array}{r}{1 - \delta / 2, \frac{1}{T} \sum_{t = 1}^{T} L(h^{*}(x_{t}), y_{t}) \leq R(h^{*}) + M \sqrt{\frac{2 \log \frac{2}{\delta}}{T}}} \end{array}$ . Thus, for any $\epsilon > 0$ , by the union bound, the following holds with probability at least $1 - \delta \colon$

> [!warning] PDF 公式回退
> 此公式块的 OCR 转录已截断、重复或乱码，不能安全重写为 LaTeX。以下嵌入的是已核验的原 PDF 第 216 页；本章仍需人工转写后才可标为 `reviewed`。
>
> ![[../../../transcripts/mineru/foundations-of-machine-learning-2e/source.pdf#page=216]]

Since this inequality holds for all $\epsilon > 0$ , it implies the second statement of the theorem. $\square$

The theorem can be applied to a variety of on-line regret minimization algorithms, for example when $R_{T} / T = O(1 / \sqrt{T})$ . In particular, we can apply the theorem to the exponential weighted average algorithm. Assuming that the loss $L$ is bounded by $M = 1$ and that the number of rounds T is known to the algorithm, we can use the regret bound of theorem 8.6. The doubling trick (used in theorem 8.7) can be used to derive a similar bound if T is not known in advance. Thus, for any $\delta > 0.$ with probability at least $1 - \delta.$ , the following holds for the generalization error of the average of the hypotheses generated by exponential weighted average:

$$
R \bigg(\frac{1}{T} \sum_{t = 1}^{T} h_{t} \bigg) \leq \inf_{h \in \mathcal{H}} R(h) + \sqrt{\frac{\log N}{2T}} + 2 \sqrt{\frac{2 \log \frac{2}{\delta}}{T}},
$$

where N is the number of experts, or the dimension of the weight vectors.

## 8.5 Game-theoretic connection

The existence of regret minimization algorithms can be used to give a simple proof of von Neumann’s theorem. For any $m \geq 1$ , we will denote by $\Delta_{m}$ the set of all distributions over $\{1, \ldots, m\}$ , that is $\Delta_{m} = \{\mathbf{p} \in \mathbb{R}^{m} \colon \mathbf{p} \geq 0 \land \| \mathbf{p} \|_{1} = 1\}$

Theorem 8.16 (Von Neumann’s minimax theorem) Let $m, n \geq 1$ . Then, for any twoperson zero-sum game defined by matrix $\mathbf{M} \in \mathbb{R}^{m \times n}$

$$
\min_{\mathbf{p} \in \Delta_{m}} \max_{\mathbf{q} \in \Delta_{n}} \mathbf{p}^{\top} \mathbf{Mq} = \max_{\mathbf{q} \in \Delta_{n}} \min_{\mathbf{p} \in \Delta_{m}} \mathbf{p}^{\top} \mathbf{Mq}.\tag{8.29}
$$

Proof: The inequality ma $\begin{array}{r}{\mathrm{{c}}_{\mathbf{q}} \operatorname{min}_{\mathbf{p}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} \leq \operatorname{min}_{\mathbf{p}} \operatorname{max}_{\mathbf{q}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q}} \end{array}$ is straightforward, since by definition of min, for all $\mathbf{p} \in \Delta_{m}, \mathbf{q} \in \Delta_{n}$ , we have mi $\mathbf{1_{p}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} \leq \mathbf{p}^{\top} \mathbf{M} \mathbf{q}.$ Taking the maximum over q of both sides gives: max $\begin{array}{r}{\mathbf{q} \operatorname{min}_{\mathbf{p}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} \leq \operatorname{max}_{\mathbf{q}} \mathbf{p}^{\top}} \end{array}$ Mq for all p, subsequently taking the minimum over p proves the inequality.<sup>12</sup>

To show the reverse inequality, consider an on-line learning setting where at each round $t \in[T]$ , algorithm returns $\mathbf{p}_{t}$ and incurs loss $\mathbf{M} \mathbf{q}_{t}$ . We can assume that $\mathbf{q}_{t}$ is selected in the optimal adversarial way, that is $\mathbf{q}_{t} \in \mathrm{\argmax}_{q \in \Delta_{m}} \mathbf{p}_{t}^{\top} \mathbf{M} \mathbf{q}$ 2 and that is a regret minimization algorithm, that is $R_{T} / T \to 0$ , where $R_{T} =$ $\begin{array}{r}{\sum_{t = 1}^{T} \mathbf{p}_{t}^{\top} \mathbf{M} \mathbf{q}_{t} - \operatorname{min}_{\mathbf{p} \in \Delta_{m}} \sum_{t = 1}^{T} \mathbf{p}^{\top} \mathbf{M} \mathbf{q}_{t}} \end{array}$ . Then, the following holds:

$$
\min_{\mathbf{p} \in \Delta_{m}} \max_{\mathbf{q} \in \Delta_{n}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} \leq \max_{\mathbf{q}} \left(\frac{1}{T} \sum_{t = 1}^{T} \mathbf{p}_{t}\right)^{\top} \mathbf{M} \mathbf{q} \leq \frac{1}{T} \sum_{t = 1}^{T} \max_{\mathbf{q}} \mathbf{p}_{t}^{\top} \mathbf{M} \mathbf{q} = \frac{1}{T} \sum_{t = 1}^{T} \mathbf{p}_{t}^{\top} \mathbf{M} \mathbf{q}_{t}.
$$

By definition of regret, the right-hand side can be expressed and bounded as follows:

$$
\begin{array}{c} \frac{1}{T} \sum_{t = 1}^{T} \mathbf{p}_{t}^{\top} \mathbf{M} \mathbf{q}_{t} = \min_{\mathbf{p} \in \Delta_{m}} \frac{1}{T} \sum_{t = 1}^{T} \mathbf{p}^{\top} \mathbf{M} \mathbf{q}_{t} + \frac{R_{T}}{T} = \min_{\mathbf{p} \in \Delta_{m}} \mathbf{p}^{\top} \mathbf{M} \Big(\frac{1}{T} \sum_{t = 1}^{T} \mathbf{q}_{t} \Big) + \frac{R_{T}}{T} \\ \leq \max_{\mathbf{q} \in \Delta_{n}} \min_{\mathbf{p} \in \Delta_{m}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} + \frac{R_{T}}{T}.\end{array}
$$

This implies that the following bound holds for the minmax for all $T \geq 1$

$$
\min_{\mathbf{p} \in \Delta_{m}} \max_{\mathbf{q} \in \Delta_{n}} \mathbf{p}^{\top} \mathbf{Mq} \leq \max_{\mathbf{q} \in \Delta_{n}} \min_{\mathbf{p} \in \Delta_{m}} \mathbf{p}^{\top} \mathbf{Mq} + \frac{R_{T}}{T}
$$

Since lim $\begin{array}{r}{T \to + \infty \ \frac{R_{T}}{T} = 0} \end{array}$ , this shows that min<sub>p</sub> max $\begin{array}{r}{\mathbf{q} \mathbf{\Lambda} \mathbf{p}^{\top} \mathbf{M} \mathbf{q} \leq \operatorname{max}_{\mathbf{q}} \operatorname{min}_{\mathbf{p}} \mathbf{p}^{\top} \mathbf{M} \mathbf{q}.\bigsqcup} \end{array}$

## 8.6 Chapter notes

Algorithms for regret minimization were initiated with the pioneering work of Hannan [1957] who gave an algorithm whose regret decreases as $O(\sqrt{T})$ as a function of T but whose dependency on N is linear. The weighted majority algorithm and the randomized weighted majority algorithm, whose regret is only logarithmic in N, are due to Littlestone and Warmuth [1989]. The exponential weighted average algorithm and its analysis, which can be viewed as an extension of the WM algorithm to convex non-zero-one losses is due to the same authors [Littlestone and Warmuth, 1989, 1994]. The analysis we presented follows Cesa-Bianchi [1999] and Cesa-Bianchi and Lugosi [2006]. The doubling trick technique appears in Vovk [1990] and Cesa-Bianchi et al. [1997]. The algorithm of exercise 8.7 and the analysis leading to a second-order bound on the regret are due to Cesa-Bianchi et al. [2005]. The lower bound presented in theorem 8.5 is from Blum and Mansour [2007].

While the regret bounds presented are logarithmic in the number of the experts N, when N is exponential in the size of the input problem, the computational complexity of an expert algorithm could be exponential. For example, in the online shortest paths problem, N is the number of paths between two vertices of a directed graph. However, several computationally efficient algorithms have been presented for broad classes of such problems by exploiting their structure [Takimoto and Warmuth, 2002, Kalai and Vempala, 2003, Zinkevich, 2003].

The notion of regret (or external regret) presented in this chapter can be generalized to that of internal regret or even swap regret, by comparing the loss of the algorithm not just to that of the best expert in retrospect, but to that of any modification of the actions taken by the algorithm by replacing each occurrence of some specific action with another one (internal regret), or even replacing actions via an arbitrary mapping (swap regret) [Foster and Vohra, 1997, Hart and Mas-Colell, 2000, Lehrer, 2003]. Several algorithms for low internal regret have been given [Foster and Vohra, 1997, 1998, 1999, Hart and Mas-Colell, 2000, Cesa-Bianchi and Lugosi, 2001, Stoltz and Lugosi, 2003], including a conversion of low external regret to low swap regret by Blum and Mansour [2005].

The Perceptron algorithm was introduced by Rosenblatt [1958]. The algorithm raised a number of reactions, in particular by Minsky and Papert [1969], who objected that the algorithm could not be used to recognize the XOR function. Of course, the kernel Perceptron algorithm already given by Aizerman et al. [1964] could straightforwardly succeed to do so using second-degree polynomial kernels. The margin bound for the Perceptron algorithm was proven by Novikof [1962] and is one of the first results in learning theory. We presented two extensions of Novikof’s result which hold in the more general non-separable case: Theorem 8.12 due to Freund and Schapire [1999a] and Theorem 8.11 due to Mohri and Rostamizadeh [2013]. Our proof of Theorem 8.12 is significantly more concise that the original proof given by Freund and Schapire [1999a] and shows that the bound of Theorem 8.11 is always tighter than that of Theorem 8.12. See [Mohri and Rostamizadeh, 2013] for other more general data-dependent upper bounds on the number of updates made by the Perceptron algorithm in the non-separable case. The leave-one-out analysis for SVMs is described by Vapnik [1998]. The Winnow algorithm was introduced by Littlestone [1987].

The analysis of the on-line to batch conversion and exercises 8.10 and 8.11 are from Cesa-Bianchi et al. [2001, 2004] (see also Littlestone [1989]). Von Neumann’s minimax theorem admits a number of different generalizations. See Sion [1958] for a generalization to quasi-concave-convex functions semi-continuous in each argument and the references therein. The simple proof of von Neumann’s theorem presented here is entirely based on learning-related techniques. A proof of a more general version using multiplicative updates was presented by Freund and Schapire [1999b].

On-line learning is a very broad and fast-growing research area in machine learning. The material presented in this chapter should be viewed only as an introduction to the topic, but the proofs and techniques presented should indicate the flavor of most results in this area. For a more comprehensive presentation of on-line learning and related game theory algorithms and techniques, the reader could consult the book of Cesa-Bianchi and Lugosi [2006].

## 8.7 Exercises

8.1 Perceptron lower bound. Let $S$ be a labeled sample of m points in $\mathbb{R}^{N}$ with

$$
x_{i} =(\underbrace{(- 1)^{i}, \ldots,(- 1)^{i},(- 1)^{i + 1}}_{}, 0, \ldots, 0) \quad \text{and} \quad y_{i} =(- 1)^{i + 1}.\tag{8.30}
$$

i first components

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
ON-LINE-SVM($\mathbf{w}_0$)
1 $\mathbf{w}_1 \leftarrow \mathbf{w}_0$ ▷ typically $\mathbf{w}_0 = \mathbf{0}$
2 for $t \leftarrow 1$ to $T$ do
3    RECEIVE($\mathbf{x}_t, y_t$)
4    if $y_t(\mathbf{w}_t \cdot \mathbf{x}_t) &lt; 1$ then
5    $\mathbf{w}_{t+1} \leftarrow \mathbf{w}_t - \eta(\mathbf{w}_t - Cy_t\mathbf{x}_t)$
6    elseif $y_t(\mathbf{w}_t \cdot \mathbf{x}_t) &gt; 1$ then
7    $\mathbf{w}_{t+1} \leftarrow \mathbf{w}_t - \eta\mathbf{w}_t$
8    else $\mathbf{w}_{t+1} \leftarrow \mathbf{w}_t$
9 return $\mathbf{w}_{T+1}$
</div>

## Figure 8.11

On-line SVM algorithm.

Show that the Perceptron algorithm makes $\Omega(2^{N})$ updates before finding a separating hyperplane, regardless of the order in which it receives the points.

8.2 Generalized mistake bound. Theorem 8.8 presents a margin bound on the maximum number of updates for the Perceptron algorithm for the special case $\eta = 1$ Consider now the general Perceptron update $\mathbf{w}_{t + 1} \mathbf{w}_{t} + \eta y_{t} \mathbf{x}_{t}$ , where $\eta > 0$ Prove a bound on the maximum number of mistakes. How does η afect the bound?

8.3 Sparse instances. Suppose each input vector $\mathbf{x}_{t}, t \in[T]$ , coincides with the tth unit vector of $\mathbb{R}^{T}$ . How many updates are required for the Perceptron algorithm to converge? Show that the number of updates matches the margin bound of theorem 8.8.

8.4 Tightness of lower bound. Is the lower bound of theorem 8.5 tight? Explain why or show a counter-example.

8.5 On-line SVM algorithm. Consider the algorithm described in figure 8.11. Show that this algorithm corresponds to the stochastic gradient descent technique applied to the SVM problem (5.24) with hinge loss and no ofset (i.e., fix $p = 1$ and $b = 0)$ .

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
MARGINPERCEPTRON()
1  $w_{1} \leftarrow 0$ 
2 for  $t \leftarrow 1$  to T do
3  $\text{RECEIVE}(\mathbf{x}_{t})$ 
4  $\text{RECEIVE}(y_{t})$ 
5 if  $\left((\mathbf{w}_{t}=0)\mathbf{or}\left(\frac{y_{t}\mathbf{w}_{t}\cdot\mathbf{x}_{t}}{\|\mathbf{w}_{t}\|}&lt;\frac{\rho}{2}\right)\right)$  then
6  $w_{t+1} \leftarrow w_{t} + y_{t}x_{t}$ 
7 else  $w_{t+1} \leftarrow w_{t}$ 
8 return  $w_{T+1}$
</div>

## Figure 8.12

Margin Perceptron algorithm.

8.6 Margin Perceptron. Given a training sample S that is linearly separable with a maximum margin $\rho > 0$ , theorem 8.8 states that the Perceptron algorithm run cyclically over S is guaranteed to converge after at most $\mathbb{R}^{2} / \rho^{2}$ updates, where R is the radius of the sphere containing the sample points. However, this theorem does not guarantee that the hyperplane solution of the Perceptron algorithm achieves a margin close to $\rho.$ Suppose we modify the Perceptron algorithm to ensure that the margin of the hyperplane solution is at least $\rho / 2$ . In particular, consider the algorithm described in figure 8.12. In this problem we show that this algorithm converges after at most $16\mathbb{R}^{2} / \rho^{2}$ updates. Let I denote the set of times $t \in[T]$ at which the algorithm makes an update and let $M = | \mathcal{I} |$ be the total number of updates.

(a) Using an analysis similar to the one given for the Perceptron algorithm, show that $M \rho \leq \| \mathbf{w}_{T + 1} \|$ . Conclude that if $\begin{array}{r}{\left\| \mathbf{w}_{T + 1} \right\| <{\frac{4R^{\widehat{2}}}{\rho}}} \end{array}$ , then $M < 4\mathbb{R}^{2} / \rho^{2}$ (For the remainder of this problem, we will assume that $\begin{array}{r}{\left\| \mathbf{w}_{T + 1} \right\| \geq \frac{4\mathbb{R}^{2}}{\rho}.)} \end{array}$

(b) Show that for any $t \in \mathcal{I}$ (including $t = 0)$ , the following holds:

$$
\left\| \mathbf{w}_{t + 1} \right\|^{2} \leq \left(\left\| \mathbf{w}_{t} \right\| + \rho / 2\right)^{2} + \mathbb{R}^{2}.
$$

(c) From (b), infer that for any $t \in{\mathcal{I}}$ we have

$$
\| \mathbf{w}_{t + 1} \| \leq \| \mathbf{w}_{t} \| + \rho / 2 + \frac{\mathbb{R}^{2}}{\| \mathbf{w}_{t} \| + \| \mathbf{w}_{t + 1} \| + \rho / 2}.
$$

(d) Using the inequality from $\mathrm{(c)}$ , show that for any $t \in \mathsf{~ \mathbb{J} ~}$ such that either $\begin{array}{r}{\| \mathbf{w}_{t} \| \geq \frac{4\mathbb{R}^{2}}{\rho} \mathrm{or} \left\| \mathbf{w}_{t + 1} \right\| \geq \frac{4\mathbb{R}^{2}}{\rho}} \end{array}$ , we have

$$
\left\| \mathbf{w}_{t + 1} \right\| \leq \left\| \mathbf{w}_{t} \right\| + \frac{3}{4} \rho.
$$

(e) Show that $\left\| \mathbf{w}_{1} \right\| \le R \le{4\mathbb{R}^{2}} /{\rho}.$ . Since by assumption we have $\begin{array}{r}{\left\| \mathbf{w}_{T + 1} \right\| \geq \frac{4\mathbb{R}^{2}}{\rho}} \end{array}$ , conclude that there must exist a largest time $t_{0} \in \mathcal{I}$ such that $\begin{array}{r}{\left\| \mathbf{w}_{t_{0}} \right\| \leq{\frac{\dot{4} \mathbb{R}^{2}}{\rho}}} \end{array}$ and $\begin{array}{r}{\left\| \mathbf{w}_{t_{0} + 1} \right\| \geq \frac{4\mathbb{R}^{2}}{\rho}} \end{array}$

(f) Show that $\begin{array}{r}{\| \mathbf{w}_{T + 1} \| \leq \| \mathbf{w}_{t_{0}} \| + \frac{3}{4} M \rho} \end{array}$ . Conclude that $M \leq 16\mathbb{R}^{2} / \rho^{2}$

8.7 Second-order regret bound. Consider the randomized algorithm that difers from the RWM algorithm only by the weight update, i.e., $w_{t + 1, i} \gets(1 -(1 - \beta) l_{t, i}) w_{t, i},$ $t \in[T]$ , which is applied to all $i \in[N]$ with $1 / 2 \le \beta < 1$ . This algorithm can be used in a more general setting than RWM since the losses $l_{t, i}$ are only assumed to be in [0, 1]. The objective of this problem is to show that a similar upper bound can be shown for the regret.

(a) Use the same potential $W_{t}$ as for the RWM algorithm and derive a simple upper bound for log $W_{T + 1}$

$$
\log W_{T + 1} \leq \log N -(1 - \beta) \mathcal{L}_{T}.
$$

(Hint: Use the inequality log $(1 - x) \leq - x$ for $x \in[0, 1 / 2].)$

(b) Prove the following lower bound for the potential for all $i \in[N]$

$$
\log W_{T + 1} \geq -(1 - \beta) \mathcal{L}_{T, i} -(1 - \beta)^{2} \sum_{t = 1}^{T} l_{t, i}^{2}.
$$

(Hint: Use the inequality log $(1 - x) \geq - x - x^{2}$ , which is valid for all $x \in$ $[0, 1 / 2].)$

(c) Use upper and lower bounds to derive the following regret bound for the algorithm: $R_{T} \leq 2 \sqrt{T \log N}$

8.8 Polynomial weighted algorithm. The objective of this problem is to show how another regret minimization algorithm can be defined and studied. Let L be a loss function convex in its first argument and taking values in [0, M].

We will assume $N > e^{2}$ and then for any expert $i \in[N]$ , we denote by $r_{t, i}$ the instantaneous regret of that expert at time $t \in[T], r_{t, i} = L(\widehat{y}_{t}, y_{t}) - L(y_{t, i}, y_{t})$ ， and by $R_{t, i}$ its cumulative regret up to time t: $\begin{array}{r}{R_{t, i} = \sum_{s = 1}^{t} r_{t, i}} \end{array}$ . For convenience, we also define $R_{0, i} = 0$ for all $i \in[N]$ . For any $x \in \mathbb{R},(x)_{+}$ denotes max $\left[\left(x, 0 \right) \right.$ , that is the positive part of $x,$ and for $\mathbf{x} =(x_{1}, \ldots, x_{N})^{\top} \in \mathbb{R}^{N}$ • $(\mathbf{x})_{+} =((x_{1})_{+}, \ldots,(x_{N})_{+})^{\top}$

Let $\alpha > 2$ and consider the algorithm that predicts at round $t \in[T]$ according to $\begin{array}{r}{\widehat{y}_{t} = \frac{\sum_{i = 1}^{n} w_{t, i} y_{t, i}}{\sum_{i = 1}^{n} w_{t, i}}} \end{array}$ , with the weight $w_{t, i}$ defined based on the αth power of the regret up to time $(t - 1) \colon w_{t, i} =(R_{t - 1, i})_{+}^{\alpha - 1}$ . The potential function we use to analyze the algorithm is based on the function $\Phi$ defined over $\mathbb{R}^{N}$ by $\begin{array}{r}{\Phi \colon \mathbf{x} \mapsto \|(\mathbf{x})_{+} \|_{\alpha}^{2} = \big[\sum_{i = 1}^{N}(x_{i})_{+}^{\alpha} \big]^{\frac{2}{\alpha}}} \end{array}$

(a) Show that $\Phi$ is twice diferentiable over $\mathbb{R}^{N} - B$ , where B is defined as follows:

$$
B = \{\mathbf{u} \in \mathbb{R}^{N}:(\mathbf{u})_{+} = 0\}.
$$

(b) For any $t \in[T]$ , let $\mathbf{r}_{t}$ denote the vector of instantaneous regrets, $\begin{array}{rl}{\mathbf{r}_{t}} &{{} =} \end{array}$ $(r_{t, 1}, \ldots, r_{t, N})^{\top}$ , and similarly $\mathbb{R}_{t} =(R_{t, 1},..., R_{t, N})^{\top}$ . We define the potential function as $\Phi({\mathbb{R}}_{t}) = \|({\mathbb{R}}_{t})_{+} \|_{\alpha}^{2}$ . Compute $\nabla \Phi(\mathbb{R}_{t - 1})$ for $\mathbb{R}_{t - 1} \notin B$ and show that $\nabla \Phi(\mathbb{R}_{t - 1}) \cdot \mathbf{r}_{t} \leq 0$ (Hint: use the convexity of the loss with respect to the first argument).

(c) Prove the inequality $\mathbf{r}^{\top}[\nabla^{2} \Phi(\mathbf{u})] \mathbf{r} \leq 2(\alpha - 1) \| \mathbf{r} \|_{\alpha}^{2}$ valid for all $\mathbf{r} \in \mathbb{R}^{N}$ and $\mathbf{u} \in \mathbb{R}^{N} - B$ (Hint: write the Hessian $\nabla^{2} \Phi(\mathbf{u})$ as a sum of a diagonal matrix and a positive semidefinite matrix multiplied by $(2 - \alpha)$ . Also, use H¨older’s inequality generalizing Cauchy-Schwarz: for any $p > 1$ and $q > 1$ with $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$ and $\mathbf{u}, \mathbf{v} \in \mathbb{R}^{N}, | \mathbf{u} \cdot \mathbf{v} | \leq \| \mathbf{u} \|_{p} \| \mathbf{v} \|_{q})$

(d) Using the answers to the two previous questions and Taylor’s formula, show that for all $t \geq 1, \Phi(\mathbb{R}_{t}) - \Phi(\mathbb{R}_{t - 1}) \leq(\alpha - 1) \Vert \mathbf{r}_{t} \Vert_{\alpha}^{2}, \mathrm{if} \ \gamma \mathbb{R}_{t - 1} +(1 - \gamma) \mathbb{R}_{t} \not \in B$ for all $\gamma \in[0, 1]$

(e) Suppose there exists $\gamma \in[0, 1]$ such that $(1 - \gamma) \mathbb{R}_{t - 1} + \gamma \mathbb{R}_{t} \in B$ . Show that $\Phi(\mathbb{R}_{t}) \leq(\alpha - 1) \| \mathbf{r}_{t} \|_{\alpha}^{2}$

(f) Using the two previous questions, derive an upper bound on $\Phi({\bf R}_{T})$ expressed in terms of $T, N,$ , and M.

(g) Show that $\Phi({\bf R}_{T})$ admits as a lower bound the square of the regret $R_{T}$ of the algorithm.

(h) Using the two previous questions give an upper bound on the regret $R_{T}$ . For what value of α is the bound the most favorable? Give a simple expression of the upper bound on the regret for a suitable approximation of that optimal value.

8.9 General inequality. In this exercise we generalize the result of exercise 8.7 by using a more general inequality: $\log(1 - \stackrel{\textstyle -}{x}) \geq - x - \frac{x^{2}}{\alpha}$ for some $0 < \alpha < 2$

(a) First prove that the inequality is true for $x \in[0, 1 - \textstyle{\frac{\alpha}{2}}]$ . What does this imply about the valid range of $\beta ?$

(b) Give a generalized version of the regret bound derived in exercise $8.7$ in terms of $\alpha,$ which shows:

$$
R_{T} \leq \frac{\log N}{1 - \beta} + \frac{1 - \beta}{\alpha} T.
$$

What is the optimal choice of $\beta$ and the resulting bound in this case?

(c) Explain how α may act as a regularization parameter. What is the optimal choice of $\alpha ?$

## 8.10 On-line to batch — non-convex loss.

The on-line to batch result of theorem 8.15 heavily relies on the fact that the loss is convex in order to provide a generalization guarantee for the uniformly averaged hypothesis $\textstyle{\frac{1}{T}} \sum_{i = 1}^{T} h_{i}$ . For general losses, instead of using the averaged hypothesis we will use a different strategy and try to estimate the best single base hypothesis and show the expected loss of this hypothesis is bounded.

Let $m_{i}$ denote the cumulative loss of hypothesis $h_{i}$ on the points $(x_{i}, \ldots, x_{T})$ ， that is $\begin{array}{r}{m_{i} = \sum_{t = i}^{T} L(h_{i}(x_{t}), y_{t})} \end{array}$ . Then we define the penalized risk estimate of hypothesis $h_{i}$ as,

$$
\frac{m_{i}}{T - i + 1} + c_{\delta}(T - i + 1) \text{where} c_{\delta}(x) = \sqrt{\frac{1}{2x} \log \frac{T(T + 1)}{\delta}}.
$$

The term $c_{\delta}$ penalizes the empirical error when the test sample is small. Define $\widehat{h} = h_{i}$ where i∗ = argmin $m_{i} /(T - i + 1) + c_{\delta}(T - i + 1)$ . We will then show under the same conditions of theorem 8.15 (with $M = 1$ for simplicity), but without requiring the convexity of $L,$ that the following holds with probability at least $1 - \delta \colon$

$$
R(\widehat{h}) \leq \frac{1}{T} \sum_{i = 1}^{T} L(h_{i}(x_{i}), y_{i}) + 6 \sqrt{\frac{1}{T} \log \frac{2(T + 1)}{\delta}}.\tag{8.31}
$$

(a) Prove the following inequality:

$$
\min_{i \in[T]}(R(h_{i}) + 2c_{\delta}(T - i + 1)) \leq \frac{1}{T} \sum_{i = 1}^{T} R(h_{i}) + 4 \sqrt{\frac{1}{T} \log \frac{T + 1}{\delta}}.
$$

(b) Use part (a) to show that with probability at least $1 - \delta.$ ,

$$
\begin{array}{l} \min_{i \in[T]}(R(h_{i}) + 2c_{\delta}(T - i + 1)) \\ < \sum_{i = 1}^{T} L(h_{i}(x_{i}), y_{i}) + \sqrt{\frac{2}{T} \log \frac{1}{\delta}} + 4 \sqrt{\frac{1}{T} \log \frac{T + 1}{\delta}}.\end{array}
$$

(c) By design, the definition of $c_{\delta}$ ensures that with probability at least $1 - \delta$

$$
R(\widehat{h}) \leq \min_{i \in[T]}(R(h_{i}) + 2c_{\delta}(T - i + 1)).
$$

Use this property to complete the proof of (8.31).

8.11 On-line to batch — kernel Perceptron margin bound. In this problem, we give a margin-based generalization guarantee for the kernel Perceptron algorithm. Let $h_{1}, \ldots, h_{T}$ be the sequence of hypotheses generated by the kernel Perceptron algorithm and let $\widehat{h}$ be defined as in exercise 8.10. Finally, let L denote the zero-one loss. We now wish to more precisely bound the generalization error of $\widehat{h}$ in this setting.

(a) First, show that

$$
\sum_{i = 1}^{T} L(h_{i}(x_{i}), y_{i}) \leq \inf_{h \in \mathbb{H}: \| h \| \leq 1} \sum_{i = 1}^{T} \max \left(0, 1 - \frac{y_{i} h(x_{i})}{\rho}\right) + \frac{1}{\rho} \sqrt{\sum_{i \in I} K(x_{i}, x_{i})},
$$

where $I$ is the set of indices where the kernel Perceptron makes an update and where $\delta$ and $\rho$ are defined as in theorem 8.12.

(b) Now, use the result of exercise 8.10 to derive a generalization guarantee for $\widehat{h}$ in the case of kernel Perceptron, which states that for any $0 < \delta \leq 1$ , the following holds with probability at least $1 - \delta \colon$

$$
R(\widehat{h}) \leq \inf_{h \in \mathbb{H}: \| h \| \leq 1} \widehat{R}_{S, \rho}(h) + \frac{1}{\rho T} \sqrt{\sum_{i \in I} K(x_{i}, x_{i})} + 6 \sqrt{\frac{1}{T} \log \frac{2(T + 1)}{\delta}},
$$

where $\begin{array}{r}{\widehat{R}_{S, \rho}(h) = \frac{1}{T} \sum_{i = 1}^{T}} \end{array}$ max $\begin{array}{r}{{\small \left(0, 1 - \frac{y_{i} h(x_{i})}{\rho} \right)}} \end{array}$ . Compare this result with the margin bounds for kernel-based hypotheses given by corollary 6.13.

The classification problems we examined in the previous chapters were all binary. However, in most real-world classification problems the number of classes is greater than two. The problem may consist of assigning a topic to a text document, a category to a speech utterance or a function to a biological sequence. In all of these tasks, the number of classes may be on the order of several hundred or more.

In this chapter, we analyze the problem of multi-class classification. We first introduce the multi-class classification learning problem and discuss its multiple settings, and then derive generalization bounds for it using the notion of Rademacher complexity. Next, we describe and analyze a series of algorithms for tackling the multi-class classification problem. We will distinguish between two broad classes of algorithms: uncombined algorithms that are specifically designed for the multiclass setting such as multi-class SVMs, decision trees, or multi-class boosting, and aggregated algorithms that are based on a reduction to binary classification and require training multiple binary classifiers. We will also briefly discuss the problem of structured prediction, which is a related problem arising in a variety of applications.


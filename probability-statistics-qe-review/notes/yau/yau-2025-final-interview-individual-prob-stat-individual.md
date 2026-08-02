# 2025 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-individual-prob-stat-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-final-interview-individual-prob-stat-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-final-interview-individual-prob-stat-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Individual: Probability and statistics

## 题 1

^yau-2025-final-interview-individual-prob-stat-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-final-interview-individual-prob-stat-individual-solutions.md#^yau-2025-final-interview-individual-prob-stat-individual-s1)。

Suppose you are buying an item that is needed for your factory. There are three stores nearby. Each store will tell you the price $X_{i} ~(i = 1, 2, 3)$ . After you ask around, you will buy from the shop with the lowest price. Suppose that you believe $X_{i} \sim$ Uniform(100, 150) for all $i ={1, 2, 3},$ , independently of one another.

a Suppose you will always ask the first two stores for quotes (for free), but it costs \$3 to ask the third quote. Show that the expected saving due to asking for the third quote is strictly positive.

b Suppose when you reported your results in part (a) to your factory director, he was confused as to whether you were recommending that one should always go for the third quote. In order to provide him with better guideline for a stepwise decision making, present your decision rule as (let $Y =$ min $\{X_{1}, X_{2}\}) \colon{\mathrm{If ~}} Y \geq c,$ then we should get the third quote; find c.

c What is the probability that you end up not saving money at all when asking the third quote?

## 题 2

^yau-2025-final-interview-individual-prob-stat-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-final-interview-individual-prob-stat-individual-solutions.md#^yau-2025-final-interview-individual-prob-stat-individual-s2)。

Assume there are N short fragments, each of length L, sampled randomly from a long sequence of length $G \left(G > > L \right)$ . Specifically, ignoring boundary effects, we assume the left-hand ends of the fragments are independently distributed according to a uniform distribution over $(0, G)$

These N fragments may overlap. Overlapping fragments can be merged to form longer contiguous stretches of sequence. A contig is one such assembled stretch (that cannot be further extended) in which all the fragments connect unambiguously (i.e., with no unresolved gaps or uncertainties within the sequence). Given N random fragments of length $L,$ the sequencing coverage is defined as $\begin{array}{r}{a = \frac{NL}{G}} \end{array}$

![](parts/images/8b38f8b6f7dbc144af1532b89732ee730f0aea47e4a25c3bd5f7db993e6d4ba1.jpg)  
Figure 1: There are four Contigs in the above long sequence

a To ensure that the mean proportion of the long sequence covered by at least one fragment is 0.99, what is the approximate minimum coverage a required?

b What is the mean number of contigs that can be formed for the long sequence?

c Prove that the mean contig size is $\frac{L(e^{a} - 1)}{a}$ with $\begin{array}{r}{a = \frac{NL}{G}} \end{array}$

## 题 3

^yau-2025-final-interview-individual-prob-stat-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2025-final-interview-individual-prob-stat-individual-solutions.md#^yau-2025-final-interview-individual-prob-stat-individual-s3)。

Let $(X_{n})_{n \geq 0}{};$ , with $X_{0} = 0 \phantom{.0}$ , be a discrete time simple random walk on <sup>Z</sup> in a dynamic random environment defined as follows. Fix $a > 0$ . At each time $n \geq 0$ , every undirected edge $e : = \{i, i + 1\}$ is assigned a conductance $C_{n}(e)$ with $C_{n}(e) = 1$ if e has not been crossed by time $n,$ and $C_{n}(e) = a$ if e has been crossed before. Given $X_{n} = x \in \mathbb{Z}$ and the conductance configuration $C_{n}(\cdot)$ at time $n_{\colon}$ , the random walk jumps to either $x + 1$ or $x - 1$ with probability

$$
P(X_{n + 1} = x \pm 1 | X_{n} = x, C_{n}) = \frac{C_{n}(\{x, x \pm 1\})}{C_{n}(\{x, x + 1\}) + C_{n}(\{x, x - 1\})}.
$$

Show that, almost surely, X will return to 0 infinitely many times.

## 题 4

^yau-2025-final-interview-individual-prob-stat-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2025-final-interview-individual-prob-stat-individual-solutions.md#^yau-2025-final-interview-individual-prob-stat-individual-s4)。

Let $\epsilon_{i}, x_{ij}, i = 1, \ldots, n, j = 1, \ldots, n$ be i.i.d. N(0, 1) random variables. Define

$$
y_{i} = \beta_{1} x_{i1} + \beta_{2} x_{i2} + \dots + \beta_{n} x_{in} + \epsilon_{i}, i = 1, \ldots, n.
$$

Suppose we only observe $(y_{1}, x_{11}),(y_{2}, x_{21}, x_{22}), \dots,(y_{n}, x_{n1}, \dots, x_{nn})$ . Obtain estimators of $\beta_{1}, \ldots, \beta_{n}$ . What desirable properties do these estimators possess? Are they optimal in some sense? If yes, why; if no, do you have any suggestions on how to improve, especially when n is large? Hint: You may consider estimation individual $\beta_{j}$ separately.

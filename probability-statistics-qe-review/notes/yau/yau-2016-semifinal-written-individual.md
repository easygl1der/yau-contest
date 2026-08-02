# 2016 丘赛 半决赛笔试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2016-semifinal-written-individual.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2016-semifinal-written-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Probability and Statistics Individual (5 problems)

## 题 1

^yau-2016-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s1)。

A random walker moves on the lattice $\mathbb{Z}^{2}$ according to the following rule: in the first step it moves to one of its neighbors with probability $1 / 4$ , and then in step $n > 1$ it moves to one of the neighbors that it didn’t visit in the step $n - 1$ with equal probability. Let $T$ be the time when the random walker steps on a site that it already visited. Please show that the expectation of T is less than 35.

## 题 2

^yau-2016-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s2)。

Let X be a $N \times N$ random matrix with i.i.d. random entries, and

$$
\mathbb{P}(X_{11} = 1) = \mathbb{P}(X_{11} = - 1) = 1 / 2
$$

Define

$$
\| X \|_{op} = \sup_{\mathbf{v} \in \mathbb{C}^{N}: \| \mathbf{v} \|_{2} = 1} \| X \mathbf{v} \|_{2}
$$

Please show that for any fixed $\delta > 0$

$$
\lim_{N \to \infty} \mathbb{P}(\| X \|_{op} \geq N^{1 / 2 + \delta}) = 0
$$

Hint: $\| X \|_{op}^{2} \leq \mathrm{tr} | X |^{2}$

## 题 3

^yau-2016-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s3)。

Suppose that 2016 balls are put into 2016 boxes with each ball independently being put into box i with probability $\frac{1}{3{\times} 1008}$ for $i \leq$ 1008 and $\frac{2}{3{\times} 1008}$ for $i >$ 1008. Let T be the number of boxes containing exactly 2 balls. Please find the variance of $T$ .

## 题 4

^yau-2016-semifinal-written-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s4)。

Let $b > a > 0$ be real numbers. Let X be a random variable taking values in $[a, b]$ , and let $\textstyle Y ={\frac{1}{X}}$ . Determine the set of all possible values of $\mathbb{E}(X) \times \mathbb{E}(Y)$

## 题 5

^yau-2016-semifinal-written-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s5)。

Let $X_{1}, X_{2},...$ . be independent and identically distributed real-valued random variables such that $\mathbb{E}(X_{1}) = - 1$ . Let $S_{n} = X_{1} + \cdots + X_{n}$ for all $n \geq 1$ , and let $T$ be the total number of $n \geq 1$ satisfying $S_{n} \geq 0$ . Compute $P(T = \infty)$

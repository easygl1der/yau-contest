# 2018 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2018-final-interview-individual-probability-and-statistics-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2018-final-interview-individual-probability-and-statistics-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2018-final-interview-individual-probability-and-statistics-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Problem 1 (Probabability) Suppose that for each n, the $(n \times n)$ random matrix $X^{n}$ has the uniform distribution on the orthogonal group $O(n)$

(1) What is the distribution of the first row vector

$$
X_{1}^{n} =(X_{11}^{n}, X_{12}^{n}, \ldots X_{1n}^{n})?
$$

(2) Show that in distribution

$$
X_{11}^{n} \sim \frac{Z_{1}}{\sqrt{\sum_{i = 1}^{n} Z_{i}^{2}}},
$$

where $Z_{i}$ are independent, identically distributed random variables with the standard normal distribution.

(3) Find the limit in distribution of the random variables $\sqrt{n} X_{11}^{n}$ as $n \to \infty$

Problem 2 (Statistics) Suppose we toss an unbiased coin and record $K_{1}$ , the number of tosses needed to obtain the first head. Then, we draw $X_{1}$ from a normal distribution with mean $K_{1} \mu$ and variance $K_{1} \sigma^{2}$ , and record the pair $(K_{1}, X_{1})$ . By repeating the experiment $n - 1$ times, we obtain the pairs $(K_{2}, X_{2}), \ldots,(K_{n}, X_{n})$ . Using all the n data pairs $(K_{1}, X_{1}), \ldots,(K_{n}, X_{n})$

(1) How would you best estimate $\mu$ and $\sigma^{2} ?$

(2) Can you give a 95% confidence interval for $\mu ?$

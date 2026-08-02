# 2019 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2019-final-interview-team-stat-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2019-final-interview-team-stat-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## May 2019

## 题 1

^yau-2019-final-interview-team-stat-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s1)。

Consider the simple linear regression

$$
Y_{i} = \alpha + \beta X_{i} + \epsilon_{i}, \qquad i = 1, \ldots, 2n.
$$

(i) Suppose that only the first half of $Y \mathrm{{} s}$ are observed, i.e. only $Y_{i}, i = 1, \dots, n$ are observed and $Y_{i}, \i = n + 1, \dots, 2n$ are missing, while all $X \mathrm{{s}}$ are observed. What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid?

(ii) Suppose for the second half of $Y \mathrm{{} s}$ , their absolute values are observed, i.e. we observe $| Y_{i} |$ $i = n + 1, \ldots, 2n$ . What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid? Any good properties for your estimator?

## 题 2

^yau-2019-final-interview-team-stat-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s2)。

Suppose that $X =(X_{1}, \ldots, X_{n})^{\prime}$ is an observation from the n-dimensional multivariate normal distribution $N_{n}(\theta, I)$ with unknown parameter $\theta \in \mathbb{R}^{n}$ , that is, $X_{i}^{,}$ s are independent of each other with $X_{i} \ \sim \N(\theta_{i}, 1)$ for $i = 1, \ldots, n$ . (i). Derive the maximum likelihood estimator (MLE) of $\begin{array}{r}{\| \theta \|^{2} = \sum_{i = 1}^{n} \theta_{i}^{2}} \end{array}$

(ii). Show that the MLE is a biased estimator.

(iii). Find the distribution of the MLE and describe how to use this distribution to construct exact confidence intervals.

## 题 3

^yau-2019-final-interview-team-stat-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s3)。

Suppose that $X_{1}, \cdots, X_{n}$ is a sample of size n from the Student-t distribution $t_{\nu}(\mu, 1)$ with known degrees of freedom $\nu \geq 1$ , unit scale, and known center $\mu.$ The Student-t distribution $t_{\nu}(\mu, 1)$ has density function of the form

$$
f_{X}(x; \mu, \nu) = \frac{\Gamma(\frac{\nu + 1}{2})}{\sqrt{\pi \nu} \Gamma(\frac{\nu}{2})} \left(1 + \frac{(x - \mu)^{2}}{\nu}\right)^{- \frac{\nu + 1}{2}},(x \in \mathcal{R}^{1}).
$$

(i). Write $X_{i} = \mu + U_{i}$ , where $U_{i}$ are independently and identically distributed (iid) with $t_{\nu}(0, 1)$ for $i = 1, \cdots, n$ . Find the conditional distribution of $U_{1}$ given $U_{i} - U_{1} = X_{i} - X_{1}$ for $i = 2, \cdots, n$

(ii). Describe a method to construct confidence intervals by making use of the above result, and argue for its eficiency and coverage probability.

(iii). Use the limiting case of $\nu \to \infty$ to verify your answers.

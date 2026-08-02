# 2023 丘赛 半决赛笔试 written

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2023-semifinal-written-written.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2023-semifinal-written-written/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Solve every problem.

## 题 1

^yau-2023-semifinal-written-written-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s1)。

The sequence $(X_{1}, X_{2}, \ldots, X_{n}, \ldots)$ is a Dirichlet process with base distribution $G_{0}$ and concentration parameter $\alpha_{0} > 0$ if $G_{0}$ is a probability distribution on R and satisfies:

$X_{1} \sim G_{0}$

• Conditional on $X_{1}, X_{2}, \ldots, X_{n}.$ , the distribution of $X_{n + 1}$ is $\textstyle \alpha_{0} G_{0} + \sum_{i = 1}^{n} \delta_{X_{i}}$ , appropriately normalized, where $\delta_{x}$ is the Dirac measure with probability 1 on singleton $\{x\}$

Assume that $G_{0}$ has finite first and second moments.

(a) Derive the distribution of $X_{n}, n \geq 1$

(b) Let $Y_{n} = I(X_{n} > 0)$ . Prove or disprove $(Y_{n})_{n \geq 1}$ forms a Dirichlet Process. If $(Y_{n})_{n \geq 1}$ forms a Dirichlet Process, determine its concentration parameter and its base distribution.

## 题 2

^yau-2023-semifinal-written-written-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s2)。

Suppose X and Y are non-negative random variables on a probability space $(\Omega,{\mathcal{F}}, P)$ Let $H(x, y)$ be a function on $[0, \infty)^{2}$ such that $E(| H(X, Y) |) < \infty$ . Define function $\phi(u) = u /(1 + u)$ for $u \geq 0$ . For integer $n = 0, 1, 2,...,$ let

$$
U_{n} = \sum_{j = 1}^{2^{n}} \frac{j - 1}{2^{n}} I \left(\frac{j - 1}{2^{n}} \leq \phi(X) < \frac{j}{2^{n}}\right), V_{n} = E(H(X, Y) | U_{n}).
$$

Prove or disprove that there exists a random variable Z such that as $n \infty$ $V_{n}$ converges to Z almost surely. If there exists such a $Z,$ show the expression of Z (in the sense of almost surely).

## 题 3

^yau-2023-semifinal-written-written-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s3)。

Let $X_{1}, X_{2}, \ldots, X_{n}$ be a sequence of i.i.d. random variables with a uniform distribution on (0, 1). Define the events $A_{1}, A_{2}, \ldots$ by

$$
A_{n} = \{X_{n} = \max(X_{1}, \dots, X_{n})\}.
$$

Define $\begin{array}{r}{R_{n} \ = \ \sum_{k = 1}^{n} I(A_{k})} \end{array}$ . Let $(m_{n})$ be a sequence of positive numbers such that $\scriptstyle \operatorname{lim}_{n \to \infty} m_{n} = \infty$ . Compute the following limit

$$
\lim_{n \to \infty} P \Big(| R_{n} - \log n | > m_{n} \sqrt{\log n} \Big)
$$

## 题 4

^yau-2023-semifinal-written-written-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s4)。

Denote by B the Borel sigma field on the real line $R,$ and let $(\Omega,{\mathcal{F}})$ be a measurable space. Define a mapping $Q(t, A)$ for $t \in R$ and $A \in{\mathcal{F}}$ such that $Q(t, \cdot)$ is a probability measure on $(\Omega,{\mathcal{F}})$ for each $t \in R$ , and $Q(\cdot, A)$ is a Borel function for each $A \in{\mathcal{F}}$

Denote by Π a probability measure on $(R, B)$ , P a probability measure on $(\Omega,{\mathcal{F}})$ , and $T$ a random variable on $(\Omega,{\mathcal{F}}, P)$ . Assume that Π, P and $T$ satisfy $\Pi = P \circ T^{- 1}$ , and for $A \in F$ .

$$
P(A) = \int_{R} Q(t, A) \Pi(dt),
$$

where $P \circ T^{- 1}$ denotes the induced probability measure by $T.$ . Prove or disprove the following statement:

$$
\text{For any} A \in \mathcal{F}, P(A | T) = Q(T, A) \text{almost surely.}
$$

## 题 5

^yau-2023-semifinal-written-written-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s5)。

Four statisticians I, II, III and IV play a sequence of games. For each game, the winning probabilities of I, II, III and IV are $(1 - \theta) / 2,(1 - \theta) / 2, \theta / 2$ and $\theta / 2$ , respectively, where $0 < \theta < 1$ . There is only one winner in each game and no tie is allowed. Assume that outcomes of games are independent of each other. For a fixed integer $r \geq 2$ , the stopping rule is to terminate as soon as one of the following conditions hold: (1) I and II together win r games; (2) III and IV together win $r + 1$ games. At the time of termination, let $X_{1}, X_{2}, X_{3}$ and $X_{4}$ denote the numbers of games won by I, II, III and IV, respectively.

(a) Prove or disprove the statistic $T = \left(X_{1} + X_{2}, X_{3} + X_{4} \right)$ is complete.

(b) Find a uniformly minimum variance unbiased estimator of $\theta.$ .

## 题 6

^yau-2023-semifinal-written-written-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s6)。

A system of interest involves three random variables, $X, ~ Y$ , and $S,$ where $S$ has a Poisson distribution with mean $2 \lambda,$ for a parameter $\lambda > 0$ , and where $X$ and $Y$ are conditionally independent Bernoulli variables, given $S = s,$ , with

$$
P(X = 1 | S = s) = \frac{1}{2^{s + 1}} \mathrm{and} P(Y = 1 | S = s) = \frac{\theta}{2^{s}},
$$

where $\theta \in(0, 1)$ is a second parameter. The random variable $S$ is unobservable.

We have n i.i.d. copies $(X_{i}, Y_{i})$ of $(X, Y)$

(a) An intuitive estimator for θ is $\hat{\theta}_{n} = \bar{Y}_{n} /(2 \bar{X}_{n})$ , where $\begin{array}{r}{\bar{X}_{n} = \frac{1}{n} \sum_{i = 1}^{n} X_{i}} \end{array}$ and $\bar{Y}_{n} =$ $\textstyle{\frac{1}{n}} \sum_{i = 1}^{n} Y_{i}$ . Derive its asymptotic distribution.

(b) Consider the hypothesis testing problem

$$
H_{0}: \theta = 1 / 2 \quad \text{versus} \quad H_{1}: \theta \neq 1 / 2.
$$

Construct an exact test statistic. As $\theta$ moves away from $1 / 2$ , describe all sources of increasing power that you can think of.

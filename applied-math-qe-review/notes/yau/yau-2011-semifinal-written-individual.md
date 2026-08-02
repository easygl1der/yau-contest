# 2011 丘赛 半决赛笔试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2011-semifinal-written-individual.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2011-semifinal-written-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

# Applied Math., Computational Math., Probability and Statistics

Individual 6:30–9:00 pm, July 9, 2011 (Please select 5 problems to solve)

## 题 1

^yau-2011-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s1)。

Given a weight function $\rho(x) > 0$ , let the inner-product corresponding to $\rho(x)$ be defined as follows:

$$
(f, g) := \int_{a}^{b} \rho(x) f(x) g(x) d x,
$$

and let $\| f \| : =(f, f)$

(1) Define a sequence of polynomials as follows:

$$
\begin{array}{rcl}{p_{0}(x)} & = &{1, \quad p_{1}(x) = x - a_{1},} \\{p_{n}(x)} & = &{(x - a_{n}) p_{n - 1}(x) - b_{n} p_{n - 2}(x), \quad n = 2, 3, \dots} \end{array}
$$

where

$$
\begin{array}{rcl} a_{n} & = & \frac{(xp_{n - 1}, p_{n - 1})}{(p_{n - 1}, p_{n - 1})}, \quad n = 1, 2, \dots \\ b_{n} & = & \frac{(xp_{n - 1}, p_{n - 2})}{(p_{n - 2}, p_{n - 2})}, \quad n = 2, 3, \dots.\end{array}
$$

Show that $\{p_{n}(x)\}$ is an orthogonal sequence of monic polynomials.

(2) Let $\{q_{n}(x)\}$ be an orthogonal sequence of monic polynomials corresponding to the $\rho$ inner product. (A polynomial is called monic if its leading coeficient is 1.) Show that $\{q_{n}(x)\}$ is unique and it minimizes $\| q_{n} \|$ amongst all monic polynomials of degree $n.$

(3) Hence or otherwise, show that if $\rho(x) = 1 / \sqrt{1 - x^{2}}$ and $[a, b] =$ $[- 1, 1]$ , then the corresponding orthogonal sequence is the Chebyshev polynomials:

$$
T_{n}(x) = \cos(n \arccos x), \quad n = 0, 1, 2, \dots.
$$

and the following recurrent formula holds:

$$
T_{n + 1}(x) = 2xT_{n}(x) - T_{n - 1}(x), \quad n = 1, 2, \dots.
$$

(4) Find the best quadratic approximation to $f(x) = x^{3}$ on $[- 1, 1]$ using $\rho(x) = 1 / \sqrt{1 - x^{2}}$

## 题 2

^yau-2011-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s2)。

If two polynomials $p(x)$ and $q(x)$ , both of fifth degree, satisfy

$$
p(i) = q(i) = \frac{1}{i}, \qquad i = 2, 3, 4, 5, 6,
$$

and

$$
p(1) = 1, \qquad q(1) = 2,
$$

find $p(0) - q(0)$

## 题 3

^yau-2011-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s3)。

Lay aside m black balls and n red balls in a jug. Supposes $1 \leq r \leq$ $k \leq n$ . Each time one draws a ball from the jug at random.

## 题 1

^yau-2011-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s1)。

If each time one draws a ball without return, what is the probability that in the k-th time of drawing one obtains exactly the r-th red ball?

## 题 2

^yau-2011-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s2)。

If each time one draws a ball with return, what is the probability that in the first k times of drawings one obtained totally an odd number of red balls?

## 题 4

^yau-2011-semifinal-written-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s4)。

Let X and $Y$ be independent and identically distributed random variables. Show that

$$
E[| X + Y |] \geq E[| X |].
$$

Hint: Consider separately two cases: $E[X^{+}] \geq E[X^{-}]$ and $E[X^{+}] <$ $E[X^{-}]$

## 题 5

^yau-2011-semifinal-written-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s5)。

Suppose that $X_{1}, \cdots, X_{n}$ are a random sample from the Bernoulli distribution with probability of success $p_{1}$ and $Y_{1}, \cdots, Y_{n}$ be an independent random sample from the Bernoulli distribution with probability of success $p_{2}$

(a) Give a minimum suficient statistic and the UMVU (uniformly minimum variance unbiased) estimator for $\theta = p_{1} - p_{2}$

(b) Give the Cramer-Rao bound for the variance of the unbiased estimators for $v(p_{1}) = p_{1}(1 - p_{1})$ or the UMVU estimator for $v(p_{1})$

(c) Compute the asymptotic power of the test with critical region

$$
| \sqrt{n}(\hat{p}_{1} - \hat{p}_{2}) / \sqrt{2 \hat{p} \hat{q}} | \geq z_{1 - \alpha}
$$

when $p_{1} = p$ and $p_{2} = p + n^{- 1 / 2} \Delta$ , where $\hat{p} = 0.5 \hat{p}_{1} + 0.5 \hat{p}_{2}$

## 题 6

^yau-2011-semifinal-written-individual-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2011-semifinal-written-individual-solutions.md#^yau-2011-semifinal-written-individual-s6)。

Suppose that an experiment is conducted to measure a constant $\theta.$ Independent unbiased measurements y of $\theta$ can be made with either of two instruments, both of which measure with normal errors: for $i = 1, 2$ , instrument i produces independent errors with a $N(0, \sigma_{i}^{2})$ distribution. The two error variances $\stackrel{\cdot}{\sigma_{1}^{2}}$ and $\sigma_{2}^{2}$ are known. When a measurement y is made, a record is kept of the instrument used so that after n measurements the data is $(a_{1}, y_{1}), \dotsc,(a_{n}, y_{n})$ , where $a_{m} = i$ if $y_{m}$ is obtained using instrument i. The choice between instruments is made independently for each observation in such a way that

$$
P(a_{m} = 1) = P(a_{m} = 2) = 0.5, \quad 1 \leq m \leq n.
$$

Let $x$ denote the entire set of data available to the statistician, in this case $(a_{1}, y_{1}), \dotsc,(a_{n}, y_{n})$ , and let $l_{\theta}(x)$ denote the corresponding log likelihood function for θ. Let $a = \sum_{m = 1}^{n}(2 - a_{m})$

(a) Show that the maximum likelihood estimate of θ is given by

$$
\hat{\theta} = \left(\sum_{m = 1}^{n} 1 / \sigma_{a_{m}}^{2}\right)^{- 1} \left(\sum_{m = 1}^{n} y_{m} / \sigma_{a_{m}}^{2}\right).
$$

(b) Express the expected Fisher information $I_{\theta}$ and the observed Fisher information $I_{x}$ in terms of $n, \sigma_{1}^{2}, \sigma_{2}^{2}$ , and $a.$ . What happens to the quantity $I_{\theta} / I_{x}$ as $n \to \infty ?$

(c) Show that a is an ancillary statistic, and that the conditional variance of $\hat{\theta}$ given a equals $1 / I_{x}$ . Of the two approximations

$$
\hat{\theta} \dot{\sim} N(\theta, 1 / I_{\theta})
$$

and

$$
\hat{\theta} \dot{\sim} N(\theta, 1 / I_{x}),
$$

which (if either) would you use for the purposes of inference, and why?

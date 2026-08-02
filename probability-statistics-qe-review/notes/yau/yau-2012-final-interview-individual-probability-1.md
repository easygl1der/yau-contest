# 2012 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2012-final-interview-individual-probability-1.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2012-final-interview-individual-probability-1/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2012-final-interview-individual-probability-1-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 4, morning

Problem. Take two points ξ and η randomly and independently with respect to the uniform distribution from the unit interval [0, 1]. Then in general these two points divide the interval [0, 1] into three subintervals with lengths X, Y and Z, respectively.

(1) What is the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane?

(2) What are the probability distributions of X, Y and Z?

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

August 4, afternoon

Problem. Suppose that $\{\xi_{k}\}$ are independent and identically distributed random variables with uniform distribution on the interval [0, 1]. Let

$$
Y = \max_{1 \leq k \leq n} \xi_{k}.
$$

(1) What is the joint distribution of $(\xi_{1}, Y) ?$

(2) Evaluate the probability $\mathbb{P}(\xi_{1} = Y)$ .

(3) Evaluate the conditional expectation $\mathbb{E}(\xi_{1} | Y)$

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 5, morning

Problem. Discuss the following issue by constructing an appropriate probability model. You may make some further reasonable assumptions.

Suppose that there are 1000 persons, and only one of them is your ideal friend. Suppose that when you meet a person which is your ideal friend, you can identify whether he/she is your ideal friend with a success probability 99/100, and when you meet a person who is not your ideal friend, you may wrongly identify him/her as your ideal friend with a probability 1/100. Now if you have already met a person that you regard as an ideal friend, what is the probability that this person REALLY is your ideal friend?

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

August 5, afternoon

Problem. Let $\{X_{n}\}$ be independent and identically distributed random variables with expectation EX, variance DX < ∞ and characteristic function $\phi_{X}(t)$ , respectively. Let N be a non-negative integer valued random variable with expectation EN, variance $\Ḋ \mathrm ḊNḌḌ < \infty$ and characteristic function $\phi_{N}(t)$ , respectively. Furthermore, $\{X_{n}\}$ and N are independent. Let $\begin{array}{r}{Y = \sum_{k = 1}^{N} X_{k}} \end{array}$

(1) What is the characteristic function of $Y ?$

(2) Evaluate the variance of Y.

## Solutions to 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 4, morning

Problem. Take two points ξ and η randomly and independently with respect to the uniform distribution from the unit interval [0, 1]. Then in general these two points divide the interval [0, 1] into three subintervals with lengths X, Y and Z, respectively.

(1) What is the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane?

(2) What are the probability distributions of X, Y and $Z ?$

## Solution

(1) If $0 \leq \xi < \eta.$ , then the lengths of the three subintervals are $\xi, \eta - \xi$ and $1 - \eta$ , respectively. These constitute the lengths of three sides of a triangle is equivalent to

$$
\begin{array}{rcl} \xi +(\eta - \xi) & > & 1 - \eta, \\(\eta - \xi) +(1 - \eta) & > & \xi, \\ \xi +(1 - \eta) & > & \eta - \xi, \end{array}
$$

which are further equivalent to

$$
\xi < \frac{1}{2}, \quad \eta - \xi < \frac{1}{2}, \quad \eta > \frac{1}{2}.
$$

These constraints form a region with area $1 / 8.$

By symmetry, the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane is $1 / 8 + 1 / 8 = 1 / 4$

(2) We have

$$
X = \min \{\xi, \eta\}, Y = | \xi - \eta |, Z = 1 - \max \{\xi, \eta\}.
$$

The distribution of X is

$$
\begin{array}{rcl} F_{X}(x) & := & \mathbb{P}(\min \{\xi, \eta\} \leq x) \\ & = & 1 - \mathbb{P}(\min \{\xi, \eta\} > x) \\ & = & 1 - \mathbb{P}(\xi > x) \mathbb{P}(\eta > x) \\ & = & 1 -(1 - x)^{2}, \quad x \in[0, 1].\end{array}
$$

The distribution of Y is

$$
\begin{array}{rcl} F_{Y}(y) & := & \mathbb{P}(| \xi - \eta | \leq y) \\ & = & \int \int_{- y \leq t - s \leq y} dtds \\ & = & 1 -(1 - y)^{2}, \quad y \in[0, 1].\end{array}
$$

The distribution of Z is

$$
\begin{array}{rcl} F_{Z}(z) & := & \mathbb{P}(1 - \max \{\xi, \eta\} \leq z) \\ & = & \mathbb{P}(\max \{\xi, \eta\} \geq 1 - z) \\ & = & 1 - \mathbb{P}(\max \{\xi, \eta\} < 1 - z) \\ & = & 1 - \mathbb{P}(\xi < 1 - z) \mathbb{P}(\eta < 1 - z) \\ & = & 1 -(1 - z)^{2}, \quad z \in[0, 1].\end{array}
$$

## August 4, afternoon

Problem. Suppose that $\{\xi_{k}\}$ are independent and identically distributed random variable with uniform distribution on the interval [0, 1]. Let

$$
Y = \max_{1 \leq k \leq n} \xi_{k}.
$$

(1) What is the joint distribution of $(\xi_{1}, Y) ?$

(2) Evaluate the probability $\mathbb{P}(\xi_{1} = Y)$ .

(3) Evaluate the conditional expectation $\operatorname{E}(\xi_{1} | Y)$

## Solution

(1) The joint distribution of $(\xi_{1}, Y)$ is

$$
\begin{array}{rcl} F_{\xi_{1}, Y}(x, y) & := & \mathbb{P}(\xi_{1} \leq x, \max_{1 \leq k \leq n} \xi_{k} \leq y) \\ & = & \mathbb{P}(\xi_{1} \leq x, \xi_{2} \leq y, \dots, \xi_{n} \leq y) \\ & = & xy^{n - 1}, \qquad 0 \leq x \leq y \leq 1.\end{array}
$$

(2) By symmetry, we have $\operatorname{P}(\xi_{1} = Y) = \operatorname{P}(\xi_{2} = Y) = \dots = \operatorname{P}(\xi_{n} = Y)$ . But

$$
\sum_{k = 1}^{n} \mathbb{P}(\xi_{k} = Y) = 1.
$$

Therefore $\begin{array}{r}{\mathbb{P}(\xi_{1} = Y) = \frac{1}{n}} \end{array}$

(3) The distribution of Y is $F_{Y}(y) : ={\mathbb{P}}(\operatorname{max}_{1 \leq k \leq n} \xi_{k} \leq y) = y^{n}, \quad y \in[0,$ , 1]. The conditional distribution of $\xi_{1}$ under Y is $\begin{array}{r}{F(x | y) = \frac{n - 1}{n} \cdot \frac{x}{y}} \end{array}$ for $0 < x < y$ , and $F(x | y) = 1$ for $1 \geq x \geq y \geq 0$ Therefore

$$
\begin{array}{rcl} E(\xi_{1} | Y = y) & = & \frac{1}{n} y + \int_{0}^{y} x \cdot \frac{n - 1}{n} \cdot \frac{1}{y} dx \\ & = & \frac{1}{n} y + \frac{n - 1}{2n} y \\ & = & \frac{n + 1}{2n} y, \end{array}
$$

and $\begin{array}{r}{\operatorname{E}(\xi_{1} | Y) = \frac{n + 1}{2n} Y.} \end{array}$

## August 5, morning

Problem. Discuss the following issue by constructing an appropriate probability model. You may make some further reasonable assumptions.

Suppose that there are 1000 persons, and only one of them is your ideal friend. Suppose that when you meet a person which is your ideal friend, you can identify whether he/she is your ideal friend with a success probability 99/100, and when you meet a person who is not your ideal friend, you may wrongly identify him/her as your ideal friend with a probability 1/100. Now if you have already met a person that you regard as an ideal friend, what is the probability that this person REALLY is your ideal friend?

## Solution

Let P(+) denote the probability that you meet an ideal friend, P(−) the probability that the person you meet is not your ideal friend, then

$$
\mathbb{P}(+) = 1 / 1000, \quad \mathbb{P}(-) = 999 / 1000.
$$

Let $\mathbb{P}(^{66} +^{77})$ denote the probability that you meet a person and identify him/her as your ideal friend and $\mathbb{P}(^{66} -{}^{79})$ denote the probability that you meet a person and do not regard him/her as an ideal friend. Let $\mathbb{P}(^{\ast} +{}^{\ast} | -)$ denote the conditional probability that you regard a person as your ideal friend while in fact he/she is not, and other conditional probabilities are defined similarly. Then

$$
\mathbb{P} \left(^{\prime \prime} +^{\prime \prime} | +\right) = 99 / 100, \quad \mathbb{P} \left(^{\prime \prime} -^{\prime \prime} | +\right) = 1 / 100.
$$

$$
\mathbb{P} \left(^{\prime \prime} +^{\prime \prime} | -\right) = 1 / 100, \quad \mathbb{P} \left(^{\prime \prime} -^{\prime \prime} | -\right) = 99 / 100.
$$

What we need to calculate is in fact the conditional probability $\mathbb{P}(+ |^{66} +^{77})$ , that is, the probability that the person you identify as an ideal friend is really your ideal friend. This can be evaluated by the Bayesian formula as follows:

$$
\begin{array}{rcl} \mathbb{P}(+ | “ + ”) & = & \frac{\mathbb{P}(+, “ + ”)}{\mathbb{P}(“ + ”)} \\ & = & \frac{\mathbb{P}(+) \mathbb{P}(“ + ” | +)}{\mathbb{P}(+) \mathbb{P}(“ + ” | +) + \mathbb{P}(-) \mathbb{P}(“ + ” | -)} \\ & = & \frac{\frac{1}{1000} \times \frac{99}{100}}{\frac{1}{1000} \times \frac{99}{100} + \frac{999}{1000} \times \frac{1}{100}} \\ & = & 11 / 122 \approx 0.090.\end{array}
$$

August $5,$ afternoon

Problem. Let $\{X_{n}\}$ be independent and identically distributed random variables with expectation EX, variance $\mathrm ḊXḌ < \infty Ḍ$ and characteristic function $\phi_{X}(t)$ , respectively. Let N be a non-negative integer valued random variable with expectation EN, variance $\Ḋ \mathrm ḊNḌḌ < \infty$ and characteristic function $\phi_{N}(t)$ , respectively. Furthermore, $\{X_{n}\}$ and N are independent. Let $\begin{array}{r}{Y = \sum_{k = 1}^{N} X_{k}} \end{array}$

(1) What is the characteristic function of Y?

(2) Evaluate the variance of Y.

## Solution

(1) The characteristic function of Y is

$$
\begin{array}{rcl} \phi_{Y}(t) & := & \mathbb{E} e^{it \sum_{k = 1}^{N} X_{k}} \\ & = & \mathbb{E}(\mathbb{E}(e^{it \sum_{k = 1}^{N} X_{k}} | N)) \\ & = & \mathbb{E}((\phi_{X}(t))^{N}).\end{array}
$$

(2) We have

$$
\begin{array}{r} \phi_{Y}^{\prime}(t) = \mathbb{E} \{N(\phi_{X}(t))^{N - 1} \phi_{X}^{\prime}(t)\}, \\ \phi_{Y}^{\prime \prime}(t) = \mathbb{E} \{N(N - 1)(\phi_{X}(t))^{N - 2}(\phi_{X}^{\prime}(t))^{2} + N(\phi_{X}(t))^{N - 1} \phi_{X}^{\prime \prime}(t)\}.\end{array}
$$

Therefore, buy putting $t = 0$ , we have

$$
\mathbb{E} Y = \mathbb{E} N \cdot \mathbb{E} X,
$$

and

$$
\mathbb{E} Y^{2} = \mathbb{E} \{N(N - 1)(\mathbb{E} X)^{2} + N \mathbb{E} X^{2}\},
$$

from which we obtain

$$
D Y = \mathbb{E} Y^{2} -(\mathbb{E} Y)^{2} = D N \cdot(\mathbb{E} X)^{2} + \mathbb{E} N \cdot D X.
$$

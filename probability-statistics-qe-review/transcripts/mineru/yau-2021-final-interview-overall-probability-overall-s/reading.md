# Yau College Math Competition 2021 Final Probability and Statistics Individual Overall Exam Problems (May 30, 2021)

Problem 1. Let $X_{1}, X_{2}, \cdots, X_{n}$ be independent exponential random variables with parameter 1, and $X_{(1)}, X_{(2)}, \cdots, X_{(n)}$ be their order statistics. Let $X_{(0)} = 0$

(1) Find the joint density function of

$$
Y_{k} =(n + 1 - k) \left(X_{(k)} - X_{(k - 1)}\right), \quad k = 1, 2, \dots, n.
$$

(2) Find the limit

$$
\lim_{n \to \infty} \mathbb{P} \left(X_{(n)} - \ln n \leq x\right).
$$

(3) Find the limit

$$
\lim_{n \to \infty} \int_{0}^{\infty} \mathbb{P} \left(X_{(n)} - \ln n > x\right) d x.
$$

Solution

(1) Notice that the joint density function of $X_{(1)}, X_{(2)}, \cdots, X_{(n)}$ is

$$
h(x_{1}, \dots, x_{n}) = \left\{\begin{array}{ll} n! e^{- \sum_{i = 1}^{n} x_{i}}, & \text{if} \quad x_{1} \leq x_{2} \leq \dots \leq x_{n}, \\ 0, & \text{otherwise}.\end{array} \right.
$$

Let $x_{0} = 0$ and define

$$
y_{k} =(n + 1 - k) \left(x_{k} - x_{k - 1}\right), \quad k = 1, 2, \dots, n,
$$

then

$$
x_{k} = \sum_{i = 1}^{k} \frac{y_{i}}{n - i + 1}, \qquad k = 1, 2, \dots, n,
$$

and the Jacobian is $1 / n !$ . So the density function of $Y_{1}, \cdots, Y_{n}$ is $e^{- \sum_{i = 1}^{n} y_{i}}$

(2) Since

$$
\mathbb{P}(X_{(n)} \leq x) =(1 - e^{- x})^{n},
$$

we have

$$
\mathbb{P}(X_{(n)} \leq x + \ln n) = \left(1 - \frac{e^{- x}}{n}\right)^{n} \stackrel{{n \to \infty}}{{\longrightarrow}} e^{- e^{- x}}.
$$

(3) According to the above two steps and the lack-of-memory property, we have

$$
\mathbb{E}(X_{(n)}) = 1 + \frac{1}{2} + \dots + \frac{1}{n}.
$$

Consequently,

$$
\lim_{n \rightarrow \infty} \int_{0}^{\infty} \mathbb{P}(X_{(n)} - \ln n > x) dx = \lim_{n \rightarrow \infty} \mathbb{E}(X_{(n)} - \ln n) = \lim_{n \rightarrow \infty} \left(1 + \frac{1}{2} + \dots + \frac{1}{n} - \ln n\right) = \gamma.
$$

Problem 2. Let $\{X_{n}\}_{n \geq 1}$ be i.i.d. random variables such that $\mathbb{P}(X_{1} ~ = ~ 1) ~ = ~ 1 -$ $\mathbb{P}(X_{1} = - 1) = p > \frac{1}{2}$ . Let $S_{0} = 0, S_{n} = \textstyle \sum_{i = 1}^{n} X_{i}$ . Define the range of $\{S_{n}\}_{n \ge 0}$ by ${R_{n}} = \# \{S_{0}, S_{1}, S_{2}, \cdot \cdot \cdot, S_{n}\}$ , which is the number of distinct points visited by the random walk $\{S_{n}\}_{n \ge 0}$ up to time n.

(1) Prove $\mathbb{E}(R_{n}) = \mathbb{E}(R_{n - 1}) + P(S_{1} S_{2} \cdot \cdot \cdot S_{n} \neq 0), \quad n = 1, 2, \cdot \cdot \cdot$

(2) Find $\begin{array}{r}{\operatorname{lim}_{n \to \infty} \frac{1}{n} \mathbb{E}(R_{n})} \end{array}$

Solutions

(1)

$$
\begin{array}{l} P(R_{n} = R_{n - 1} + 1) = P(S_{n} \notin \{S_{0}, S_{1}, \dots S_{n - 1}\}) \\ \qquad = P(S_{n} \neq S_{0}, S_{n} \neq S_{1}, \dots, S_{n} \neq S_{n - 1}) \\ \qquad = P(X_{1} + X_{2} + \dots + X_{n} \neq 0, X_{2} + X_{3} + \dots + X_{n} \neq 0, \dots, X_{n} \neq 0) \\ \qquad = P(X_{1} \neq 0, X_{1} + X_{2} \neq 0, \dots, X_{1} + X_{2} + \dots + X_{n} \neq 0) \quad(\text{by i.i.d}) \\ \qquad = P(S_{1} S_{2} \dots S_{n} \neq 0).\end{array}
$$

Thus

$$
\mathbb{E}(R_{n}) = \mathbb{E}(R_{n - 1}) + P(S_{1} S_{2} \dots S_{n} \neq 0).
$$

(2) Using the above relation recursively, one has

$$
\frac{1}{n} \mathbb{E}(R_{n}) = \frac{1}{n} + \frac{1}{n} \sum_{k = 1}^{n} P(S_{1} S_{2} \dots S_{k} \neq 0) \stackrel{{n \rightarrow \infty}}{{\longrightarrow}} P(S_{k} \neq 0, \forall k \geq 1).
$$

On the other hand, according to law of large numbers,

$$
\lim_{n \to \infty} \frac{S_{n}}{n} = 2p - 1 > 0, \quad \mathrm{a.s.}
$$

Thus

$$
\begin{array}{c} P(S_{k} \neq 0, \forall k \geq 1) = P(S_{k} > 0, \forall k \geq 1) \\ = \lim_{n \to \infty} P(S_{k} > 0, k = 1, 2, \dots, n) \end{array}
$$

By the reflection principle,

$$
P(S_{k} > 0, k = 1, 2, \dots, n) = \frac{1}{n} \mathbb{E}(S_{n} \vee 0) \stackrel{n \to \infty}{\longrightarrow} 2p - 1.
$$

Thus $\begin{array}{r}{\operatorname{lim}_{n \to \infty} \frac{1}{n} \mathbb{E}(R_{n}) = 2p - 1} \end{array}$
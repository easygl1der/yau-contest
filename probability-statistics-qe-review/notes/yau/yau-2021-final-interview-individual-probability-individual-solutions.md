# 2021 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2021-final-interview-individual-probability-individual-solutions.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2021-final-interview-individual-probability-individual-solutions/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2021-final-interview-individual-probability-individual-solutions-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2021-final-interview-individual-probability-individual-solutions-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2021-final-interview-individual-probability-individual-solutions-solutions.md#^yau-2021-final-interview-individual-probability-individual-solutions-s1)。

Let $\{X_{n}\}_{n \geq 1}$ be a sequence of real valued, nonnegative random variables. Assume that there are constants $C > 0$ and $\lambda > 0$ such that $\mathbb{E} X_{n} \leq Ce^{- \lambda n}, \ \forall n \geq 1$ Prove that

$$
P \Big(\limsup_{n \to \infty} \frac{1}{n} \ln X_{n} \leq - \lambda \Big) = 1.
$$

## Solution

For any $\lambda_{0} \in(0, \lambda)$ , define the events

$$
A_{n} = \{\omega \in \Omega : X_{n}(\omega) > e^{- \lambda_{0} n}\}, \quad n \geq 1.
$$

$\mathrm{By}$ Chebyshev’s inequality,

$$
\mathbb{P}(A_{n}) \leq e^{\lambda_{0} n} \mathbb{E} X_{n} \leq Ce^{(\lambda_{0} - \lambda) n}, \quad \forall n \geq 1.
$$

Since $\lambda_{0} < \lambda$ , we have

$$
\sum_{n = 1}^{\infty} \mathbb{P}(A_{n}) \leq \sum_{n = 1}^{\infty} Ce^{(\lambda_{0} - \lambda) n} < + \infty.
$$

Borel-Cantelli’s lemma implies that for $\mathbb{P} \mathrm{- a.s.} \ \omega \in \Omega$ , there exists $n(\omega) \in \mathbb{N}$ such that for all $n \geq n(\omega)$ , we have $\omega \in A_{n}^{c}$ , that is $X_{n}(\omega) \leq e^{- \lambda_{0} n}$ . Therefore,

$$
\frac{1}{n} \ln X_{n}(\omega) \leq - \lambda_{0}, \quad \forall n \geq n(\omega).
$$

This implies the desired result since $\lambda_{0}$ is an arbitrary number less than λ.

## 题 2

^yau-2021-final-interview-individual-probability-individual-solutions-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2021-final-interview-individual-probability-individual-solutions-solutions.md#^yau-2021-final-interview-individual-probability-individual-solutions-s2)。

Assume that $X_{1}, \dots, X_{n} \sim U[0, 1]$ (uniform distribution) are i.i.d. Denote $\begin{array}{r}{X_{(1)} = \operatorname{min}_{1 \leq k \leq n} X_{k}} \end{array}$ and $X_{(n)} = \operatorname{max}_{1 \leq k \leq n} X_{k}$ . Let $R = X_{(n)} - X_{(1)}$ be the sample range and $V =(X_{(1)} + X_{(n)}) / 2$ be the sample midvalue.

(1). Find the joint density of $(X_{(1)}, X_{(n)})$

(2). Find the joint density of $(R, V)$

(3). Find the density of R and the density of $V$ .

## Solution

(1). Denote $F(x_{1}, x_{n}) = P(X_{(1)} \leq x_{1}, X_{(n)} \leq x_{n})$ , then $F(x_{1}, x_{n}) = 0$ for $x_{1} \notin[0, 1]$ or $x_{n} \notin[0, 1]$ . If $x_{1} \geq x_{n}$ , then $\{X_{(n)} \leq x_{n}\} \subset \{X_{(1)} \leq x_{1}\}$ , and therefore

$$
F(x_{1}, x_{n}) = P(X_{(n)} \leq x_{n}).
$$

If $0 \leq x_{1} \leq x_{n} \leq 1$ , then

$$
\begin{array}{c} P(X_{(1)} \geq x_{1}, X_{(n)} \leq x_{n}) = P(\cup_{k = 1}^{n} \{x_{1} \leq X_{k} \leq x_{n}) \\ = \prod_{k = 1}^{n} P(x_{1} \leq X_{k} \leq x_{n}) \\ =(x_{n} - x_{1})^{n}, \end{array}
$$

which implies that

$$
\begin{array}{c} F(x_{1}, x_{n}) = P(X_{(n)} \leq x_{n}) - P(X_{(1)} \geq x_{1}, X_{(n)} \leq x_{n}) \\ = P(X_{(n)} \leq x_{n}) -(x_{n} - x_{1})^{n}.\end{array}
$$

Thus,

$$
\begin{array}{l} f(x_{1}, x_{n}) = \frac{\partial^{2} F(x_{1}, x_{n})}{\partial x_{1} \partial x_{n}} \\ \qquad = \left\{\begin{array}{ll} n(n - 1)(x_{n} - x_{1})^{n - 2}, & \text{if} 0 \leq x_{1} \leq x_{n} \leq 1, \\ 0, & \text{elsewhere}.\end{array} \right.\end{array}
$$

(2). Note that

$$
\binom{X_{(1)}}{X_{(n)}} = \left(\begin{array}{cc} - \frac{1}{2} & 1 \\ \frac{1}{2} & 1 \end{array} \right) \binom{R}{V} \equiv A \binom{R}{V},
$$

thus the joint density of (R, V ) is

$$
\begin{array}{c} f_{R, V}(r, v) = f(x_{1}, x_{n}) \times | \det A | \\ = f \Big(v - \frac{r}{2}, v + \frac{r}{2} \Big) \\ = n(n - 1) r^{n - 2}, \end{array}
$$

where $(r, v) \in D \equiv \{(r, v) : 0 \leq v -{\frac{r}{2}} \leq v +{\frac{r}{2}} \leq 1\}$ and

$$
f_{R, V}(r, v) = 0,
$$

if $(r, v) \notin D.$

(3) The density of R is

$$
\begin{array}{l} f_{R}(r) = \int_{- \infty}^{+ \infty} f_{R, V}(r, v) dv \\ = \int_{r / 2}^{1 - r / 2} f_{R, V}(r, v) dv = n(n - 1) r^{n - 2}(1 - r), \quad 0 \leq r \leq 1.\end{array}
$$

For the density of V , if $v \in[0, 1 / 2]$ ], then

$$
f_{V}(v) = \int_{- \infty}^{+ \infty} f_{R, V}(r, v) dr = \int_{0}^{2v} n(n - 1) r^{n - 2} dr = n(2v)^{n - 1},
$$

if $v \in[1 / 2, 1]$ , then

$$
f_{V}(v) = \int_{- \infty}^{+ \infty} f_{R, V}(r, v) dr = \int_{0}^{2(1 - v)} n(n - 1) r^{n - 2} dr = n(2(1 - v))^{n - 1}.
$$

## 题 3

^yau-2021-final-interview-individual-probability-individual-solutions-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2021-final-interview-individual-probability-individual-solutions-solutions.md#^yau-2021-final-interview-individual-probability-individual-solutions-s3)。

A binary tree is a tree in which each node has exactly two descendants. Suppose that each node of the tree is coloured black with probability p, and white otherwise, independently of all other nodes. For any path π containing n nodes beginning at the root of the tree, let $B(\pi)$ be the number of black nodes in π, and let $X_{n}(k)$ be the number of such paths π for which $B(\pi) \geq k$

(1) Show that there exists $\beta_{c}$ such that

$$
\lim_{n \to \infty} \mathbb{E}(X_{n}(\beta n)) = \left\{\begin{array}{ll} 0, & \text{if} \beta > \beta_{c}, \\ \infty, & \text{if} \beta < \beta_{c}.\end{array} \right.
$$

How to determine the value of $\beta_{c} ?$

(2) For $\beta \neq \beta_{c}$ , find the limit li $\operatorname{1}_{n \to \infty} \mathbb{P} \big(X_{n} \bigl(\beta n \bigr) \geq 1 \bigr)$

## Solution

The number of paths π containing exactly n nodes is $2^{n - 1}$ , and each such π satisfies $\mathbb{P}(B(\pi) \geq k) = \mathbb{P} \left(S_{n} \geq k \right)$ where $S_{n} = Y_{1} + Y_{2} + \cdot \cdot \cdot + Y_{n}$ is the sum of n independent Bernoulli variables having parameter p. Therefore $\mathbb{E}(X_{n}(k)) = 2^{n - 1} \mathbb{P} \left(S_{n} \geq k \right)$ . We set $k = n \beta$ , and need to estimate P $(S_{n} \geq n \beta)$ . It is a consequence of the large deviation theorem that, if $p \leq \beta < 1$

$$
\mathbb{P} \left(S_{n} \geq n \beta\right)^{1 / n} \stackrel{n \to \infty}{\longrightarrow} \inf_{t > 0} \left\{e^{- t \beta} M(t) \right\}
$$

where $M(t) = \mathbb{E} \left(e^{tY_{1}} \right) = q + pe^{t}, q = 1 - p$ . With some calculus, we find that

$$
\mathbb{P} \left(S_{n} \geq n \beta\right)^{1 / n} \stackrel{{n \rightarrow \infty}}{{\longrightarrow}} \left(\frac{p}{\beta}\right)^{\beta} \left(\frac{1 - p}{1 - \beta}\right)^{1 - \beta}, \quad p \leq \beta < 1
$$

Hence

$$
\mathbb{E}(X_{n}(\beta n)) \stackrel{{n \to \infty}}{{\longrightarrow}} \left\{\begin{array}{ll} 0, & \text{if} \gamma(\beta) < 1 \\ \infty, & \text{if} \gamma(\beta) > 1 \end{array} \right.
$$

where

$$
\gamma(\beta) = 2 \left(\frac{p}{\beta}\right)^{\beta} \left(\frac{1 - p}{1 - \beta}\right)^{1 - \beta}
$$

is a decreasing function of $\beta.$ . If $\begin{array}{r}{p <{\frac{1}{2}}} \end{array}$ , there is a unique $\beta_{c} \in[p, 1)$ such that $\gamma \left(\beta_{c} \right) = 1$ ; if $\begin{array}{r}{p \geq \frac{1}{2}} \end{array}$ then $\gamma(\beta) > 1$ for all $\beta \in[p, 1)$ so that we may take $\beta_{c} = 1$

Turning to the final part,

$$
\mathbb{P} \left(X_{n}(\beta n) \geq 1\right) \leq \mathbb{E}(X_{n}(\beta n)) \stackrel{{n \rightarrow \infty}}{{\longrightarrow}} 0, \quad \text{if} \beta > \beta_{c}.
$$

As for the other case, we will use the Payley-Zygmund inequality

$$
\mathbb{P}(N \neq 0) \geq \frac{\mathbb{E}(N)^{2}}{\mathbb{E} \left(N^{2}\right)}
$$

for nonnegative random variable N.

We have that $\begin{array}{r}{\mathbb{E}(X_{n}(\beta n)^{2}) = \sum_{\pi, \rho} \mathbb{E} \left(I_{\pi} I_{\rho} \right)} \end{array}$ , where the sum is over all such paths $\pi, \rho_{;}$ and $I_{\pi}$ is the indicator function of the event $\{B(\pi) \geq \beta n\}$ . Hence

$$
\mathbb{E}(X_{n}(\beta n)^{2}) = \sum_{\pi} \mathbb{E}(I_{\pi}) + \sum_{\pi \neq \rho} \mathbb{E}(I_{\pi} I_{\rho}) = \mathbb{E}(X_{n}(\beta n)) + 2^{n - 1} \sum_{\rho \neq L} \mathbb{E}(I_{L} I_{\rho})
$$

where $L$ is the path which always takes the left fork (there are $2^{n - 1}$ choices for $\pi,$ and by symmetry each provides the same contribution to the sum). We divide up the last sum according to the number of nodes in common to $\rho$ and $L,$ obtaining $\begin{array}{r}{\sum_{m = 1}^{n - 1} 2^{n - m - 1} \mathbb{E} \left(I_{L} I_{M} \right)} \end{array}$ where M is a path having exactly m nodes in common with $L$ . Now

$$
\mathbb{E} \left(I_{L} I_{M}\right) = \mathbb{E} \left(I_{M} \mid I_{L} = 1\right) \mathbb{E} \left(I_{L}\right) \leq \mathbb{P} \left(T_{n - m} \geq \beta n - m\right) \mathbb{E} \left(I_{L}\right),
$$

where $T_{n - m}$ has the Binomial $(n - m, p)$ distribution (the ’most value’ to $I_{M}$ of the event $\{I_{L} = 1\}$ is obtained when all m nodes in $L \cap M$ are black). However

$$
\mathbb{E} \left(I_{M}\right) = \mathbb{P} \left(T_{n} \geq \beta n\right) \geq p^{m} \mathbb{P} \left(T_{n - m} \geq \beta n - m\right),
$$

so that E $\left(I_{L} I_{M} \right) \leq p^{- m} \mathbb{E} \left(I_{L} \right) \mathbb{E} \left(I_{M} \right)$ . It follows that $N = X_{n}(\beta n)$ satisfies

$$
\mathbb{E} \left(N^{2}\right) \leq \mathbb{E}(N) + 2^{n - 1} \sum_{m = 1}^{n - 1} 2^{n - m - 1} \cdot \frac{1}{p^{m}} \mathbb{E} \left(I_{L}\right) \mathbb{E} \left(I_{M}\right) = \mathbb{E}(N) + \frac{1}{2}(\mathbb{E}(N))^{2} \sum_{m = 1}^{n - 1} \left(\frac{1}{2p}\right)^{m}
$$

whence, by the Payley-Zygmund inequality,

$$
\mathbb{P}(N \neq 0) \geq \frac{1}{\mathbb{E}(N)^{- 1} + \frac{1}{2} \sum_{m = 1}^{n - 1}(2p)^{- m}}.
$$

If $\beta < \beta_{c}$ then $\mathbb{E}(N) \to \infty$ as $n \infty$ . It is immediately evident that $\mathbb{P}(N \neq 0) \to 1$ if $\begin{array}{r}{p \leq \frac{1}{2}} \end{array}$ . Suppose finally that $\begin{array}{r}{p > \frac{1}{2}} \end{array}$ and $\beta < \beta_{c}$ . By the above inequality,

$$
\mathbb{P} \left(X_{n}(\beta n) > 0\right) \geq c(\beta), \quad \forall n\tag{0.1}
$$

where $c(\beta)$ is some positive constant. Take $\epsilon > 0$ such that $\beta + \epsilon < \beta_{c}$ . Fix a positive integer $m,$ and let $\mathcal{P}_{m}$ be a collection of $2^{m}$ disjoint paths each of length $n - m$ starting from depth m in the tree. Now

$$
\mathbb{P} \left(X_{n}(\beta n) = 0\right) \leq \mathbb{P}(B(v) < \beta n \text{for all} v \in \mathcal{P}_{m}) = \mathbb{P}(B(v) < \beta n)^{2^{m}},
$$

where $v \in \mathcal{P}_{m}$ . However

$$
\mathbb{P}(B(v) < \beta n) \leq \mathbb{P}(B(\nu) <(\beta + \epsilon)(n - m))
$$

if $\beta n <(\beta + \epsilon)(n - m)$ , which is to say that $n \ge(\beta + \epsilon) m / \epsilon$ . Hence, for all large $n,$

$$
\mathbb{P} \left(X_{n}(\beta n) = 0\right) \leq(1 - c(\beta + \epsilon))^{2^{m}}
$$

by (0.1). We let $n \infty$ and $m \infty$ in that order, to obtain $\mathbb{P}(X_{n}(\beta n) = 0) 0$ as $n \to \infty$ . In summary,

$$
\mathbb{P}(X_{n}(\beta n) \geq 1) \stackrel{{n \to \infty}}{{\longrightarrow}} \left\{\begin{array}{ll} 0, & \text{if} \beta > \beta_{c}, \\ 1, & \text{if} \beta < \beta_{c}.\end{array} \right.
$$

# 2012 丘赛 半决赛笔试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2012-semifinal-written-individual.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2012-semifinal-written-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Applied Math. and Computational Math.

Please solve 4 out of the following 5 problems, or highest scores of 4 problems will be counted.

## 题 1

^yau-2012-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s1)。

In the numerical integration formula

$$
\int_{- 1}^{1} f(x) dx \approx af(- 1) + bf(c),\tag{1}
$$

if the constants $a, b, c$ can be chosen arbitrarily, what is the highest degree k such that the formula is exact for all polynomials of degree up to $k ?$ Find the constants $a, b, c$ for which the formula is exact for all polynomials of degree up to this k.

## 题 2

^yau-2012-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s2)。

Here is the definition of a moving least square approximation of a function $f(x)$ near a point $\textstyle{\overline{{x}}}$ given K points $x_{k}$ around $\textstyle{\overline{{x}}}$ in $\mathbb{R}, k \in$ $[1, \cdots, K]$

$$
\min_{P_{\overline{{x}}} \in \Pi_{m}} \sum_{k = 1}^{K} | P_{\overline{{x}}}(x_{k}) - f_{k} |^{2}\tag{2}
$$

where $f_{k} = f(x_{k})$ $\Pi_{m}$ is the space of polynomials of degree less or equal to m, i.e.

$$
P_{\overline{{x}}}(x) = \mathbf{b}_{\overline{{x}}}(x)^{T} \mathbf{c}(\overline{{x}}),
$$

$\mathbf{c}(\overline{{x}}) = \left[c_{0}, c_{1}, \cdots, c_{m} \right]^{T}$ is the coeficient vector to be determined by (2), ${\bf b}_{\overline{{x}}}(x)$ is the polynomial basis vector, $\mathbf{b}_{\overline{{x}}}(x) = \left[1, x - \overline{{x}},(x - \overline{{x}})^{2}, \ldots,(x - \overline{{x}})^{m} \right]^{T}$ Assume that there are $K > m$ diferent points $x_{k}$ and $f(x)$ is smooth, (a) prove that there is a unique solution $\overline{{P}}_{\overline{{x}}}(x)$ to (2)

(b) denote $h = \operatorname{max}_{k} \ \left| x_{k} -{\overline{{x}}} \right|$ , prove

$$
| c_{i} - \frac{1}{i !} f^{(i)}(\overline{{x}}) | = C(f, i) h^{m + 1 - i}, i = 0, 1, \ldots, m,
$$

where $f^{(i)}(\cdot)$ is the i-th derivative of $f$ and $C(f, i)$ denote some constant depending on $f, i.$

(c) if $S = \{x_{k} | k = 1, 2, \ldots, K\}$ are symmetrically distributed around ${\overline{{x}}},$ that is, if $x_{k} \in S$ then $2 \overline{{x}} - x_{k} \in S$ , prove that

$$
| c_{i} - \frac{1}{i !} f^{(i)}(\overline{{x}}) | = C(f, i) h^{m + 2 - i}, i = 0, 1, \ldots, m,
$$

for $i \(\in \{0, 1, \cdots, m\})$ with the same parity of $m$ .

## 题 3

^yau-2012-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s3)。

Describe the forward-in-time and center-in-space finite diference scheme for the one-wave wave equation:

$$
u_{t} + u_{x} = 0.
$$

(i). Conduct the von Neumann stability analysis and comment on their stability property.

(ii). Under what condition on $\Delta t$ and $\Delta x$ would this scheme be stable and convergent?

(iii). How many ways you can modify this scheme to make it stable when the CFL condition is satisfied.

## 题 4

^yau-2012-semifinal-written-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s4)。

Let $C$ and $D$ in $\mathbb{C}^{n \times n}$ be Hermitian matrices. Denote their eigenvalues by

$$
\lambda_{1} \geq \lambda_{2} \geq \dots \geq \lambda_{n} \quad \text{and} \quad \mu_{1} \geq \mu_{2} \geq \dots \geq \mu_{n},
$$

respectively. Then it is known that

$$
\sum_{i = 1}^{n}(\lambda_{i} - \mu_{i})^{2} \leq \| C - D \|_{F}^{2}.
$$

## 题 1

^yau-2012-semifinal-written-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s1)。

Let A and B be in $\mathbb{C}^{n \times n}$ . Denote their singular values by

$$
\sigma_{1} \geq \sigma_{2} \geq \dots \geq \sigma_{n} \quad \text{and} \quad \tau_{1} \geq \tau_{2} \geq \dots \geq \tau_{n},
$$

respectively. Prove that the following inequality holds:

$$
\sum_{i = 1}^{n}(\sigma_{i} - \tau_{i})^{2} \leq \| A - B \|_{F}^{2}.
$$

## 题 2

^yau-2012-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s2)。

Given $A \ \in \ \mathbb{R}^{n \times n}$ and its SVD is $A \ = \U \Sigma V^{T}$ , where $U =$ $(\mathbf{u}_{1}, \mathbf{u}_{2}, \ldots, \mathbf{u}_{n}), V =(\mathbf{v}_{1}, \mathbf{v}_{2}, \ldots, \mathbf{v}_{n})$ are orthogonal matrices, and

$$
\Sigma = \operatorname{diag} \left(\sigma_{1}, \sigma_{2}, \dots, \sigma_{n}\right), \quad \sigma_{1} \geq \sigma_{2} \geq \dots \geq \sigma_{n} \geq 0.
$$

Suppose rank $(A) >$ k and denote by

$$
U_{k} = \left(\mathbf{u}_{1}, \mathbf{u}_{2}, \dots, \mathbf{u}_{k}\right), \quad V_{k} = \left(\mathbf{v}_{1}, \mathbf{v}_{2}, \dots, \mathbf{v}_{k}\right), \quad \Sigma_{k} = \operatorname{diag} \left(\sigma_{1}, \sigma_{2}, \dots, \sigma_{k}\right),
$$

and

$$
A_{k} = U_{k} \Sigma_{k} V_{k}^{T} = \sum_{i = 1}^{k} \sigma_{i} \mathbf{u}_{i} \mathbf{v}_{i}^{T}.
$$

Prove that

$$
\min_{\operatorname{rank}(B) = k} \| A - B \|_{F}^{2} = \| A - A_{k} \|_{F}^{2} = \sum_{i = k + 1}^{n} \sigma_{i}^{2}.
$$

## 题 3

^yau-2012-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s3)。

Let the vectors $\mathbf{x}_{i} \in \mathbb{R}^{n}, i = 1, 2, \dotsc, n$ , be in the space W with dimension d, where $d \ll n$ . Let the orthonormal basis of W be $W \in \mathbb{R}^{n \times d}$ . Then we can represent $\mathbf{x}_{i}$ by

$$
\mathbf{x}_{i} = \mathbf{c} + W \mathbf{r}_{i} + \mathbf{e}_{i}, i = 1, 2, \dots, n,
$$

where $\mathbf{c} \in \mathbb{R}^{n}$ is a constant vector, $\mathbf{r}_{i} \in \mathbb{R}^{d}$ is the coordinate of the point $\mathbf{x}_{i}$ in the space $\mathcal{W},$ and $\mathbf{e}_{i}$ is the error. Denote $R = \left(\mathbf{r}_{1}, \mathbf{r}_{2}, \ldots, \mathbf{r}_{n} \right)$ and $E =(\mathbf{e}_{1}, \mathbf{e}_{2}, \ldots, \mathbf{e}_{n})$ . Find W , R and c such that the error $\| E \|_{F}$ is minimized.

$$
(Hint: \text{write} X =[\mathbf{x}_{1}, \mathbf{x}_{2}, \dots, \mathbf{x}_{n}] = \mathbf{c}(1, 1, \dots, 1) + WR + E.)
$$

## 题 5

^yau-2012-semifinal-written-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2012-semifinal-written-individual-solutions.md#^yau-2012-semifinal-written-individual-s5)。

Two primes p and q are called twin primes if $q \ = \p + 2$ . For example, 5 and 7, 11 and 13, 29 and 31 are twin primes. There is a still unproven (but extensively numerically verified) conjecture that there are infinitely many twin primes and that they are rather common. Show how to factor an integer N which is a product of two twin primes.

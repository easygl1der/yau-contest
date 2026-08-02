# 2025 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-team-acm-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-final-interview-team-acm-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-final-interview-team-acm-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2025-final-interview-team-acm-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-final-interview-team-acm-team-solutions.md#^yau-2025-final-interview-team-acm-team-s1)。

Given a bounded Lipschitz domain $\Omega \subset \mathbb{R}^{n}$ with piecewise hyperplanar boundary $\partial \Omega$ . For $p \geq 1$ let $\mathscr{A}_{p} : = \ : W_{0}^{1, p}(\Omega; \mathbb{R})$ denote the standard Sobolev space, and ${V_{h}} \subset{\mathcal{A}}_{p}$ denote the subspace of all piecewise afine finite element functions with respect to a shape-regular and quasi-uniform triangulation $\mathcal{T}_{h}$ parametrized by the mesh size h. Consider the minimization of an energy $E : \mathcal{A}_{p} \mathbb{R} \cup \{+ \infty\}$ :

$$
\inf E(\mathcal{A}_{p}) := \inf_{v \in \mathcal{A}_{p}} E(v), \text{where} E(v) := \int_{\Omega} W(x, v(x), \nabla v(x)) dx, \forall v \in \mathcal{A}_{\infty},
$$

associated with a continuous energy density function $W \colon \overline{{\Omega}} \times \mathbb{R} \times \mathbb{R}^{n} \to \mathbb{R}$ , and its finite element approximation:

$$
E_{h} := \inf_{v^{h} \in V_{h}} E(v^{h}).
$$

(a) Show that if W is continuous, then

$$
\lim_{h \to 0} E_{h} = \inf_{v \in \mathcal{A}_{\infty}} E(v).
$$

(b) Find an example of W on $\Omega =(0, 1)$ such that

$$
\lim_{h \to 0} E_{h} \neq \inf_{v \in \mathcal{A}_{1}} E(v).
$$

## 题 2

^yau-2025-final-interview-team-acm-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-final-interview-team-acm-team-solutions.md#^yau-2025-final-interview-team-acm-team-s2)。

The softmax function $p = \operatorname{softmax}(z)$ is defined as

$$
p_{i} = \frac{e^{z_{i}}}{\sum_{j} e^{z_{j}}}, \quad \text{for} z \in \mathbb{R}^{K}.
$$

Let $\begin{array}{r}{S^{K - 1} : = \left\{p \in \mathbb{R}^{K} \vert p_{i} \geq 0, \sum_{i} p_{i} = 1 \right\}} \end{array}$ be the probability simplex.

(a) Define the log-sum-exp function

$$
\operatorname{lse}(\boldsymbol{z}) := \log \left(\sum_{i = 1}^{K} e^{z_{i}}\right).
$$

Prove that lse(z) is convex.

(b) Show that the convex conjugate (Fenchel-Legendre transform) is:

$$
\operatorname{lse}^{*}(\boldsymbol{y}) = \left\{\begin{array}{ll} \sum_{i = 1}^{K} y_{i} \log y_{i} & \text{if} \boldsymbol{y} \in \mathcal{S}^{K - 1}, \\ \infty & \text{otherwise}.\end{array} \right.
$$

(c) Derive the biconjugate lse<sup>∗∗</sup> and verify that it equals lse.

(d) Prove that

$$
\operatorname{softmax}(\boldsymbol{z}) = \underset{\boldsymbol{p} \in \mathcal{S}^{K - 1}}{\arg \max} \left(\boldsymbol{z} \cdot \boldsymbol{p} - \boldsymbol{p} \cdot \log \boldsymbol{p}\right).
$$

## 题 3

^yau-2025-final-interview-team-acm-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2025-final-interview-team-acm-team-solutions.md#^yau-2025-final-interview-team-acm-team-s3)。

Let $A = \lambda I + N \in \mathbb{C}^{n \times n}$ , where N is nilpotent of index m, i.e., $N^{m} = 0$ , and $\lambda \in \mathbb{C}$ . Let f be analytic near λ.

(a) Derive a general expression for $f(A)$ in terms of the derivatives of f at λ and powers of N .

(b) Specialize to the case $f(z) = e^{z}$ , and compute $e^{A}$ explicitly.

(d) Let $A ={\left(\begin{array}{ll}{0} &{1} \\{- 1} &{0} \end{array} \right)}$ . Compute $e^{\boldsymbol{A} t}$ and interpret the result.

(c) If $A \in \mathbb{R}^{n \times n}$ is real but has complex eigenvalues, explain how to compute $e^{\boldsymbol{A} t} \in \mathbb{R}^{n \times n}$ eficiently.

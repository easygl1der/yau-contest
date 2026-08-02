# 2024 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2024-final-interview-overall-acm-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2024-final-interview-overall-acm-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2024-final-interview-overall-acm-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2024-final-interview-overall-acm-overall-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2024-final-interview-overall-acm-overall-solutions.md#^yau-2024-final-interview-overall-acm-overall-s1)。

Consider the following optimization problem

$$
\min_{\boldsymbol{x} \in \mathbb{R}^{n}} \| \boldsymbol{x} \|_{1} \text{s.t.} \boldsymbol{A} \boldsymbol{x} = \boldsymbol{A} \boldsymbol{x}_{0},\tag{1}
$$

where $\begin{array}{r}{\| \pmb{x} \|_{1} = \sum_{i = 1}^{n} | x_{i} |, \pmb{A} \in \mathbb{R}^{m \times n}} \end{array}$ with $m \leq n, \pmb{x}_{0} \in \mathbb{R}^{n}$ , and $\pmb{b} \in \mathbb{R}^{m}$ . Let $s < n$ be an integer. Define the set

$$
\mathcal{C}_{s} = \left\{\boldsymbol{\eta} \in \mathbb{R}^{n} \mid \exists S \subset \{1, 2, \dots, n\}, \text{s.t.} | S | \leq s \text{and} \| \boldsymbol{\eta}_{S} \|_{1} \geq \| \boldsymbol{\eta}_{S^{c}} \|_{1}, \right\}.
$$

Here $\pmb{\eta}_{S} \in \mathbb{R}^{n}$ is the vector whose components are the same as η on S and 0 on $S^{c} : = \{1, \ldots, n\} \setminus S.$

(a) Prove that every s-sparse vector $\scriptstyle{\mathbf{{\mathit{x}}}}_{0}$ is the unique solution of (1) if and only if

$$
\operatorname{Ker}(\boldsymbol{A}) \cap \mathcal{C}_{s} = \{\boldsymbol{0}\}.\tag{2}
$$

(A vector is called s-sparse if it contains at most s nonzero entries.)

(b) Prove that there exists a universal constant $C > 0$ such that

$$
\mathcal{C}_{s} \cap \{\boldsymbol{x} \mid \| \boldsymbol{x} \|_{2} \leq 1\} \subseteq \{\boldsymbol{x} \mid \| \boldsymbol{x} \|_{s} \leq C\},
$$

where $\| \pmb{x} \|_{(s)}$ is defined as

$$
\| \boldsymbol{x} \|_{(s)} := \min \left\{\sum_{i} \| \boldsymbol{x}_{i} \|_{2} \mid \boldsymbol{x} = \sum_{i} \boldsymbol{x}_{i}, \text{where} \boldsymbol{x}_{i} \in \mathbb{R}^{n} \text{is s - sparse for all} i.\right\}
$$

(Since in the general case $\|{\pmb x} \|_{(s)} \le \sqrt{n / s} \|{\pmb x} \|_{2}$ , the above result implies that $\mathcal{C}_{s}$ restricted to the 2-norm ball is very small, indicating that even if A is a wide matrix, the large $\operatorname{Ker}(A)$ can still miss the small $\mathcal{C}_{s}.$ Consequently, sparse recovery through 1-norm minimization is possible even if m is very small.)

2. (a) Consider the random walk of a particle along the real line. At each time step of size $\tau > 0$ , the particle jumps left or right with a distance $h > 0$ with equal probability $1 / 2$ . Let x and t denote the space and time variables, respectively. Derive an equation for the probability density of the particle at $(x, t)$ , as the time/space steps $\tau, h \searrow 0$ in the limit $h^{2} / \tau \to d.$

(b) Consider a particle moving randomly in a 2-dimensional space, where it can move up/down/left/right with a distance $h > 0$ with equal probability $\begin{array}{r}{p \leq \frac{1}{4}} \end{array}$ . Let $(x, y)$ and t denote the space and time variables, respectively. Derive an equation for the probability density of the particle at $(x, y, t)$ as the time/space steps $\tau, h \searrow 0$ in the limit $h^{2} / \tau \to d.$

(c) Consider the problem in item $(2)$ over a finite time interval $(0, T)$ with $T > 0$ signifying the terminal time. Let $u(\mathbf{z}, t), \ \mathbf{z} =(x, y)$ , denote the probability density and let $p$ and d be both positive constants. Assume the initial distribution of u is given by $f(\mathbf{z})$ . Derive the system to model the particle’s motion in terms of u. We further assumed that $f$ is compactly supported, i.e. there is a bounded domain $\Omega \Subset \mathbb{R}^{2}$ such that $\operatorname{supp}(f) \Subset \Omega$ . Let us consider the problem of finding the initial distribution f by monitoring the motion of the particle on the boundary ∂Ω. To that end, we introduce

$$
\mathcal{M}_{f} = u(\mathbf{z}, t) |_{(\mathbf{z}, t) \in \partial \Omega \times(0, T)}.
$$

(c-i). Can we uniquely determine $f$ by knowledge of $\boldsymbol{\mathcal{M}}_{f} \boldsymbol{?}$ That is, is the correspondence between $f$ and $\mathcal{M}_{f}$ one-to-one?

(c-ii). Suppose that $f$ is a delta distribution of the form $\alpha_{0} \delta({\bf z} -{\bf z_{0}})$ , with ${\mathbf z}_{\mathbf{0}} \in \Omega$ and $\alpha_{0} \in \mathbb{R}_{+}$ Here, δ is the Kronecker delta function. Can one determine the initial distribution $f$ by knowledge of $\boldsymbol{\mathcal{M}}_{f} ?$ If so, can you describe a numerical scheme of locating $\mathbf{z_{0}}$ , independent of $\alpha_{0} ?$

(c-iii). If f is a collection of sparsely distributed point distributions, namely,

$$
f(x) = \sum_{j = 1}^{N} \alpha_{j} \delta(\mathbf{z} - \mathbf{z_{j}}), \alpha_{j} \in \mathbb{R}, \mathbf{z_{j}} \in \Omega,
$$

$| \mathbf{z_{j}} - \mathbf{z_{j^{\prime}}} | \gg 1, 1 \leq j \neq j^{\prime} \leq N$ , can you sketch an idea of extending your result in item $(b) \mathrm{?}$

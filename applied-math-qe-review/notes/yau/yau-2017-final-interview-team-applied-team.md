# 2017 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2017-final-interview-team-applied-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2017-final-interview-team-applied-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2017-final-interview-team-applied-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Oral Exam for Teams: Applied and Computational Mathematics 2017

![](parts/images/7895fdec7a505083c42161a478c24eedbfc77fde4e1a2923a2b936384b0c9617.jpg)  
Figure 1: reference triangle.

## 题 1

^yau-2017-final-interview-team-applied-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2017-final-interview-team-applied-team-solutions.md#^yau-2017-final-interview-team-applied-team-s1)。

Given a Euclidean triangle $[v_{i}, v_{j}, v_{k}]$ with edge lengths $l_{i}, l_{j}, l_{k}$ and corner angles $\theta_{i}, \theta_{j}, \theta_{k}$ (see Figure 1), we treat the angles as the functions of edge lengths, namely, $\theta_{i} = \theta_{i}(l_{i}, l_{j}, l_{k})$

(a) Show that

$$
\frac{\partial \theta_{i}}{\partial l_{i}} = \frac{l_{i}}{2A}, \frac{\partial \theta_{i}}{\partial l_{j}} = - \frac{l_{i}}{2A} \cos \theta_{k},
$$

where A is the area of the triangle.

(b) Suppose the initial edge lengths are $(l_{i}^{0}, l_{j}^{0}, l_{k}^{0})$ , the conformal factor $(u_{i}, u_{j}, u_{k})$ are three real numbers associated with the vertices, the vertex scaling operator changes each edge length by multiplying the exponential of conformal factors at its two end vertces, namely:

$$
l_{i} = e^{u_{j}} l_{i}^{0} e^{u_{k}}, l_{j} = e^{u_{k}} l_{j}^{0} e^{u_{i}}, l_{k} = e^{u_{i}} l_{k}^{0} e^{u_{j}},
$$

Show that

$$
\frac{\partial \theta_{i}}{\partial u_{j}} = \frac{\partial \theta_{j}}{\partial u_{i}} = \cot \theta_{k}, \quad \frac{\partial \theta_{i}}{\partial u_{i}} = - \cot \theta_{j} - \cot \theta_{k}
$$

(c) If the initial triangle is an acute triangle, then in a neighborhood of $(u_{i}, u_{j}, u_{k}) =(0, 0, 0)$ , the mapping $\varphi : \{(u_{i}, u_{j}, u_{k}) | u_{i} + u_{j} + u_{k} = 0\} \to \{(\theta_{i}, \theta_{j}, \theta_{k}) | \theta_{i} + \theta_{j} + \theta_{k} = \pi\}$ is difeomorphic.

## 题 2

^yau-2017-final-interview-team-applied-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2017-final-interview-team-applied-team-solutions.md#^yau-2017-final-interview-team-applied-team-s2)。

Let $A \in \mathbb{R}^{n \times n}$ be symmetric and let $\| q_{1} \|_{2} = 1$ . Consider the following Lanczos iteration:

$$
r_{0} = q_{1}, \quad \beta_{0} = 1, \quad q_{0} = 0, \quad k := 0
$$

$$
\mathrm{while} \beta_{k} \neq 0
$$

$$
q_{k + 1} := r_{k} / \beta_{k}
$$

$$
k := k + 1
$$

$$
\alpha_{k} := q_{k}^{T} Aq_{k}
$$

$$
r_{k} :=(A - \alpha_{k} I) q_{k} - \beta_{k - 1} q_{k - 1}
$$

$$
\beta_{k} := \| r_{k} \|_{2}
$$

end

Let $K_{n} = \operatorname{span} \{q_{1}, Aq_{1}, \cdots, A^{n - 1} q_{1}\}$

(a) Show that

$$
AQ_{k} = Q_{k} T_{k} + r_{k} e_{k}^{T}
$$

where $e_{k}$ is the k-th unit vector, $Q_{k} =[q_{1} \cdots q_{k}]$ and

$$
T_{k} = \left[\begin{array}{ccccc} \alpha_{1} & \beta_{1} & & \dots & 0 \\ \beta_{1} & \alpha_{2} & \ddots & & \vdots \\ & \ddots & \ddots & \ddots & \\ \vdots & & \ddots & \ddots & \beta_{k - 1} \\ 0 & \dots & & \beta_{k - 1} & \alpha_{k} \end{array} \right]
$$

(b) Assume that the iteration does not terminate. Show that $Q_{k}$ has orthonormal columns, and that they span $K_{k}$

(c) Show that the Lanczos iteration will stop when $k = m$ , where $m ={\operatorname{rank}}(K_{n})$

(d) What is the purpose of this algorithm? Briefly justify your answer.

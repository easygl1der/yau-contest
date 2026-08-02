# 2016 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2016-final-interview-individual-applmath-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2016-final-interview-individual-applmath-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2016-final-interview-individual-applmath-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2016-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2016-final-interview-individual-applmath-individual-solutions.md#^yau-2016-final-interview-individual-applmath-individual-s1)。

Given a vector $\mathbf{b} \in \mathbb{R}^{m}$ and $A \in \mathbb{R}^{m \times m}$ , the Arnoldi process is a systematic way of constructing an orthonormal bases for the sucessive Krylov subspaces

$$
\mathcal{K}_{n} = \langle \mathbf{b}, A \mathbf{b}, \dots, A^{n - 1} \mathbf{b} \rangle, \quad n = 1, 2, \dots.
$$

It gives

$$
AQ_{n} = Q_{n + 1} \tilde{H}_{n},
$$

where $Q_{n} \in \mathbb{R}^{m \times n}, Q_{n + 1} \in \mathbb{R}^{m \times(n + 1)}$ are with orthonormal columns and $\tilde{H}_{n} \in \mathbb{R}^{(n + 1) \times n}$ is upper-Hessenberg. Let $H_{n} \in \mathbb{R}^{n \times n}$ be obtained by deleting the last row of ${\tilde{H}}_{n}$

(a) Write out the Arnoldi algorithm.

(b) Assume that at step n, the $(n + 1, n){\mathrm{- th}}$ entry of ${\tilde{H}}_{n}$ is zero.

i. Show that $\textstyle{\boldsymbol{\mathcal{K}}}_{n}$ is an invariant subspace of A and that $K_{n} = K_{n + 1} = K_{n + 2} =$

ii. Show that each eigenvalue of $H_{n}$ is an eigenvalue of A for $n > 1$

(c) Let $P_{n}$ be the set of monic polynomials of degree n. Show that the minimizer of

$$
\min_{p_{n} \in P_{n}} \| p_{n}(A) \mathbf{b} \|_{2}
$$

is given by the characteristic polynomial of $H_{n}$

## 题 2

^yau-2016-final-interview-individual-applmath-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2016-final-interview-individual-applmath-individual-solutions.md#^yau-2016-final-interview-individual-applmath-individual-s2)。

The following FitzHugh-Nagumo model is a simplified version of the Hodgkin-Huxley model (1963 Nobel Prize in Physiology or Medicine) which models in a detailed manner activation and deactivation dynamics of a spiking neuron.

$$
\epsilon \dot{v} = v - \frac{1}{3} v^{3} - w + I_{\mathrm{ext}}
$$

$$
\dot{w} = v + a - bw
$$

where v is the membrane voltage, w is a linear recovery variable, $I_{\mathrm{ext}}$ is the external stimulus. It contains the van der Pol oscillator as a special case for $a = b = I_{\mathrm{ext}} = 0.$ . Fig 1 gives a qualtitative description of the four-stage structure of FitzHugh-Nagumo limit cycle solution and Fig 2 sketchs the time-profile illustrating the four stages in the limit cycle.

![](parts/images/9919ad3aaba3392becb26031c7c873e2fc2484c832466d8467b448a58399a91c.jpg)

![](parts/images/f3d7dfe596d8e51a04f3a9bb23362737846565b2756a0083f911c184825afe3e.jpg)  
Figure 1: (a) The blue line is the trajectory of the FHN model in phase space. The pink line is the cubic nullcline $w = v -{\textstyle{\frac{1}{3}}} v^{3} + I_{\mathrm{ext}}$ and the yellow line is the linear nullcline $w = a / b + v / b$ . (b) Graph of v with parameters $I_{\mathrm{ext}} = 0.5, a = 0.7, b = 0.8,$ , and $\epsilon = 1 / 12.5$

(a) (10 pts) Use the expansions $v(t) = v_{0}(t) + \epsilon v_{0}(t) + O(\epsilon^{2}), w(t) = w_{0}(t) + \epsilon w_{0}(t) + O(\epsilon^{2})$ to determine the equations for the leading order slow solution. Point out the slow manifold $(w_{0}$ as a function of $v_{0})$ in Fig 1(a) and indicate the direction of the motion on each part, and identify the two attracting points on the curve.

(b) (5 pts) Use the expansion $v(t) = V_{0}(T) + \epsilon V_{1}(T) + O(\epsilon^{2}), w(t) = W_{0}(T) + \epsilon W_{1}(T) + O(\epsilon^{2})$ with $T = t / \epsilon$ to obtain the equations for the leading order fast solution.

(c) (5 pts) Use the phase plane to determine the maximum and the minimum values of $v(t)$ during an oscillation. Point out in Fig 1(a) and Fig 1 (b) the part of slow dynamics and fast dynamics, estimate the period for v(t) as a function of time.

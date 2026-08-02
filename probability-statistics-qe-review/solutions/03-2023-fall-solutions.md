# 2023 秋季 Probability & Statistics 博资考参考解

> [!info] 题源与使用方式
> - 题源：[官方原卷](../sources/exams/qzc-qe-probability-statistics-2023-fall.pdf)，2023 秋季，第 1--3 页；题面转录见 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-probability-statistics-2023-fall/reading.md)。
> - 本文件是教学性参考解，不是官方评分答案。每题先给决定性思路，再保留取得主要分数所需的计算。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：相关标准高斯与极坐标

**动机。** 先把指数中的二次型认成二维正态的协方差逆矩阵；极坐标部分的关键是不要漏掉 Jacobian $r$。

设 $-1<\rho<1$，并令 $\Sigma=\begin{pmatrix}1&\rho\\\rho&1\end{pmatrix}$。则 $\det\Sigma=1-\rho^2>0$，且

$$
\Sigma^{-1}=\frac{1}{1-\rho^2}\begin{pmatrix}1&-\rho\\-\rho&1\end{pmatrix}.
$$

因此题给密度正是 $N_2(0,\Sigma)$ 的密度。由二维高斯密度的正规化，$\iint f(x,y)\,dx\,dy=1$。也可先对 $y$ 配方：

$$
x^2-2\rho xy+y^2=(y-\rho x)^2+(1-\rho^2)x^2,
$$

积分掉 $y$ 后得到 $f_X(x)=(2\pi)^{-1/2}e^{-x^2/2}$；对称地 $Y\sim N(0,1)$。联合正态变量独立当且仅当协方差为零，故 $X\perp Y$ 当且仅当 $\rho=0$。

写 $x=r\cos\phi,y=r\sin\phi$，其中 $r>0,0\leq\phi<2\pi$。因为 $|\partial(x,y)/\partial(r,\phi)|=r$，

$$
f_{R,\Phi}(r,\phi)=\frac{r}{2\pi\sqrt{1-\rho^2}}
\exp\left[-\frac{r^2(1-\rho\sin 2\phi)}{2(1-\rho^2)}\right].
$$

再用 $\int_0^\infty r e^{-ar^2/2}\,dr=a^{-1}$，得到

$$
f_\Phi(\phi)=\frac{\sqrt{1-\rho^2}}{2\pi(1-\rho\sin2\phi)},\qquad 0\leq\phi<2\pi.
$$

**考点与易错点。** 协方差矩阵必须正定；$\rho=\pm1$ 时题给二维 Lebesgue 密度并不存在。极坐标转换不可漏乘 $r$。参见 Durrett, *Probability: Theory and Examples*, Gaussian vectors 一节。

## 题 2：Laplace 分布的指数鞅

**动机。** 对独立增量的部分和，指数鞅的补偿项就是每一步对数矩母函数的累加。

对 $|\theta|<1$，直接积分得

$$
\mathbb E e^{\theta X_1}
=\frac12\left(\int_0^\infty e^{-(1-\theta)x}\,dx+
\int_{-\infty}^0e^{(1+\theta)x}\,dx\right)
=\frac{1}{1-\theta^2}.
$$

故取

$$
A_n(\theta)=n\log\frac{1}{1-\theta^2}.
$$

确实，利用 $X_{n+1}\perp\mathcal F_n$，

$$
\mathbb E[M_{n+1}(\theta)\mid\mathcal F_n]
=M_n(\theta)e^{-\{A_{n+1}(\theta)-A_n(\theta)\}}
\mathbb E e^{\theta X_{n+1}}
=M_n(\theta).
$$

**考点与易错点。** 不要只写“独立所以是鞅”：必须显式消去一增量的矩母函数。$|\theta|<1$ 是矩母函数有限的必要条件。参见 Durrett, martingale exponential transforms。

## 题 3：翻硬币的 Ehrenfest 链

**动机。** 给定当前正面数 $k$，下一步只取决于抽到的是正面还是反面，因此微观状态可压缩为一维 Markov 链。

按通常“翻转”含义，状态空间为 $\{0,\ldots,N\}$，且

$$
P(k,k+1)=\frac{N-k}{N},\qquad P(k,k-1)=\frac{k}{N},
$$

其余转移概率为零。因为条件分布只由 $X_n=k$ 决定，$X_n$ 是 Markov 链。

令

$$
\mu(k)=\binom Nk2^{-N}.
$$

则对相邻状态，

$$
\mu(k)P(k,k+1)=\binom Nk2^{-N}\frac{N-k}{N}
=\binom N{k+1}2^{-N}\frac{k+1}{N}
=\mu(k+1)P(k+1,k).
$$

详细平衡给出平稳性。该有限链不可约，故平稳分布唯一，结论即 $\mathrm{Binomial}(N,1/2)$。

**易错点。** 若把“flip”误读为“重新均匀抽样”，会额外出现自环；本题原文的翻转是把被抽硬币的面反过来。参见 Norris, *Markov Chains*, detailed balance。

## 题 4：保留成功骰子的最优策略

**动机。** 已出现的 $6$ 是已经完成的目标坐标；再掷它只会以 $5/6$ 的概率损失进度，所以最优策略是每轮保留全部 $6$，只重掷非 $6$ 的骰子。

对每个骰子，达到 $6$ 的等待轮数 $G_i$ 独立且满足

$$
\mathbb P(G_i>t)=\left(\frac56\right)^t,\qquad t=0,1,\ldots.
$$

在该策略下 $T=\max(G_1,G_2,G_3)$。尾和公式给出

$$
\begin{aligned}
\mathbb ET
&=\sum_{t\geq0}\mathbb P(T>t)\\
&=\sum_{t\geq0}\left[1-\left(1-\left(\frac56\right)^t\right)^3\right]\\
&=\frac{3}{1-5/6}-\frac{3}{1-25/36}+\frac{1}{1-125/216}
=\frac{962}{91}.
\end{aligned}
$$

保留 $6$ 的策略逐坐标支配任何重掷已得 $6$ 的策略，故其最优。

**考点。** 动态规划的单调性、几何分布与尾和公式。参见 Ross, *Introduction to Probability Models*, geometric waiting times。

## 题 5：正则树渗流

**动机。** 从根的一条已打开边进入子树后，每个后代有 $d-1$ 个向前邻居，因此连通簇由均值 $(d-1)p$ 的 Galton--Watson 过程控制。

非根顶点的开放子代数为 $\mathrm{Binomial}(d-1,p)$，其均值为 $m=(d-1)p$。分枝过程存活概率为正当且仅当 $m>1$，因此

$$
p_c=\frac{1}{d-1}.
$$

根只有有限个 $d$ 条初始边，不改变正概率存活与否，故 $p>p_c$ 时 $\theta(p)>0$，$p<p_c$ 时 $\theta(p)=0$。

现在令 $p<p_c$。子代概率生成函数为

$$
g(s)=(1-p+ps)^{d-1},\qquad g'(1)=m<1.
$$

由 $g'(1)<1$ 及 $g$ 的解析性，可取某个 $s>1$ 使相应总子孙数 $W$ 的生成函数在 $s$ 的邻域有限；等价地，存在 $a>0$ 使 $\mathbb Ee^{aW}<\infty$。根簇至多是一条根加上 $d$ 个独立此类家族之和，故亦有 $\mathbb Ee^{a|\mathcal C(o)|}<\infty$。Markov 不等式遂给出

$$
\mathbb P(|\mathcal C(o)|\geq k)
\leq \mathbb Ee^{a|\mathcal C(o)|}e^{-ak}
=Ce^{-ck},
$$

其中 $c=a$、$C=\mathbb Ee^{a|\mathcal C(o)|}$。

**易错点。** 根的子代是 $\mathrm{Binomial}(d,p)$，但临界值由后续世代的 $d-1$ 决定。参见 Grimmett, *Percolation*, tree percolation。

## 题 6：高斯矩阵、卡方变量与 CLT

**动机。** 高斯矩阵向量化后是 $N(0,I_{n^2})$；正交变换保持该分布。随后把二次型转成独立标准正态的平方和。

对任意矩阵 $A$，$\operatorname{vec}(UAV)=(V^\mathsf{T}\otimes U)\operatorname{vec}(A)$。当 $U,V$ 正交时，$V^\mathsf{T}\otimes U$ 也正交。因此 $\operatorname{vec}(UXV)$ 与 $\operatorname{vec}(X)$ 同为 $N(0,I_{n^2})$，从而 $UXV\overset d=X$。

取正交矩阵把单位向量 $u$ 送到第一标准基向量。由不变性，$Xu$ 的 $n$ 个分量独立且皆为 $N(0,1)$。于是

$$
Y_n=u^\mathsf{T}X^\mathsf{T}Xu=\sum_{i=1}^nG_i^2\sim\chi_n^2,
$$

其中 $G_i\overset{\mathrm{iid}}\sim N(0,1)$。故

$$
\mathbb EY_n=n,\qquad \operatorname{var}(Y_n)=2n,\qquad
\frac{Y_n-n}{\sqrt{2n}}\xrightarrow{d}N(0,1).
$$

对 (c)，令 $a=u^\mathsf{T}v$、$b=\sqrt{1-a^2}$。先在右侧把 $u$ 化为第一基向量，再在其正交补中旋转，使 $v$ 的右侧坐标为 $ae_1+be_2$；随后在左侧把 $v$ 化为第一基向量。正交不变性说明变换后的矩阵仍有独立标准正态条目，于是可写成

$$
u^\mathsf{T}X^\mathsf{T}Xu=\sum_{i=1}^nG_i^2,
\qquad v^\mathsf{T}Xv=aG_1+bH,
$$

其中 $G_1,G_2,\ldots,H$ 独立且均为标准正态。因此

$$
Z_n=\sum_{i=1}^nG_i^2+\sqrt n\,(aG_1+bH),\qquad
\mathbb EZ_n=n,\qquad \operatorname{var}(Z_n)=3n.
$$

并且

$$
\frac{Z_n-n}{\sqrt{3n}}
=\frac{\sum_{i=2}^n(G_i^2-1)}{\sqrt{3n}}
+\frac{aG_1+bH}{\sqrt3}+o_{\mathbb P}(1)
\xrightarrow{d}N\left(0,\frac23\right)+N\left(0,\frac13\right)=N(0,1).
$$

这里两个极限项独立，因为第一项只含 $G_2,G_3,\ldots$，而 $aG_1+bH\sim N(0,1)$。

**考点。** 正交不变性、$\chi^2$ 矩与 Slutsky 定理。参见 Vershynin, *High-Dimensional Probability*, Gaussian matrices。

## 题 7：正态样本的 Neyman--Pearson 检验

**动机。** 三问都是单参数正态族的似然比单调性：均值变大看 $\bar X$，方差变大看离均差平方和。

令 $z_q$ 为 $N(0,1)$ 的 $q$ 分位数，$\chi^2_{n,q}$ 为 $\chi_n^2$ 的 $q$ 分位数。

**(a)** 当 $\sigma_0^2=\sigma_1^2=\sigma^2$ 且 $\mu_1>\mu_0$ 时，

$$
\log\frac{L_1}{L_0}
=\frac{n(\mu_1-\mu_0)}{\sigma^2}\bar X
-\frac{n(\mu_1^2-\mu_0^2)}{2\sigma^2},
$$

故似然比随 $\bar X$ 增大。大小为 $\alpha$ 的最强检验是

$$
\phi=\mathbb I\left\{\bar X>\mu_0+\frac{\sigma}{\sqrt n}z_{1-\alpha}\right\}.
$$

**(b)** 当均值同为 $\mu_0$ 且 $\sigma_1^2>\sigma_0^2$ 时，似然比随

$$
S_0=\sum_{i=1}^n(X_i-\mu_0)^2
$$

增大。$H_0$ 下 $S_0/\sigma_0^2\sim\chi_n^2$，所以拒绝域为 $S_0>\sigma_0^2\chi^2_{n,1-\alpha}$。

**(c)** 方差已知为 $1$。对每个 $\mu<1$，似然比相对 $\mu=1$ 随 $\bar X$ 减小；复合零假设中拒绝概率在边界 $\mu=1$ 最大。因此 UMP level-$\alpha$ 检验为

$$
\phi=\mathbb I\left\{\bar X<1+\frac{z_\alpha}{\sqrt n}\right\}.
$$

**考点。** Neyman--Pearson 引理与单调似然比；“UMP”在 (a)、(b) 的简单对简单语境就是 NP 最强检验。参见 Casella--Berger, Chapters 8--9。

## 题 8：Cauchy 位置族

**动机。** Cauchy 密度的支持集不随位置参数移动，但乘积似然通常不能压缩为有限维低维和统计量；两样本 MLE 则可由一个一元四次式的极值解决。

样本似然为

$$
L(\theta;x)=\pi^{-n}\prod_{i=1}^n\frac{1}{1+(x_i-\theta)^2}.
$$

若两个样本 $x,y$ 的似然比对 $\theta$ 为常数，则多项式

$$
\prod_i[1+(x_i-\theta)^2]
\quad\text{与}\quad
\prod_i[1+(y_i-\theta)^2]
$$

只能相差常数；两者首项系数皆为 $1$，故相等。它们在复数域的根分别为 $x_i\pm i$ 与 $y_i\pm i$，从而两样本的无序多重集相同。故最小充分统计量可取排序样本

$$
T(X)=(X_{(1)},\ldots,X_{(n)}).
$$

对 (b)、(c)，令 $m=(x_1+x_2)/2$、$\Delta=(x_1-x_2)/2$、$t=\theta-m$。最大化 $L$ 等价于最小化

$$
D(t)=[1+(t-\Delta)^2][1+(t+\Delta)^2]
=(1+t^2+\Delta^2)^2-4t^2\Delta^2.
$$

微分得

$$
D'(t)=4t(1+t^2-\Delta^2).
$$

若 $|\Delta|\leq1$，唯一的全局最小点为 $t=0$，因此

$$
\widehat\theta=m=\frac{x_1+x_2}{2}.
$$

若 $|\Delta|>1$，$t=0$ 是局部最大点，而两个全局最小点为 $t=\pm\sqrt{\Delta^2-1}$，因此全部 MLE 为

$$
\widehat\theta=m\pm\sqrt{\Delta^2-1}.
$$

**易错点。** 中点 $m$ 只在 $|\Delta|\leq1$ 时是 MLE；样本距离过大时 MLE 必须有两个。参见 Lehmann--Casella, *Theory of Point Estimation*, minimal sufficiency 与 likelihood analysis。

## 参考文献

- 清华大学求真书院，[2023 秋季 Probability & Statistics 博士生资格考试原卷](../sources/exams/qzc-qe-probability-statistics-2023-fall.pdf)。
- R. Durrett, *Probability: Theory and Examples*, 4th ed., Cambridge University Press, 2010：高斯向量、鞅、分枝过程与弱收敛。
- G. Grimmett, *Percolation*, 2nd ed., Springer, 1999：正则树上的 Bernoulli 渗流。
- G. Casella and R. L. Berger, *Statistical Inference*, 2nd ed., Duxbury, 2002：似然比检验、充分性与 MLE。

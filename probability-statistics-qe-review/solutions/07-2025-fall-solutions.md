# 2025 秋季 Probability & Statistics 博资考参考解

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-probability-statistics-2025-fall.pdf)，第 1--3 页；文字定位使用 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-probability-statistics-2025-fall/reading.md)。
> - 本文件为教学性参考解，不是官方评分答案。未检索到本卷随题面公开的评分答案。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：指数变量的随机幂

**动机。** 先对离散的 $N$ 条件化；指数分布的整数阶矩为 $n!$，正好与 Poisson 概率中的 $n!$ 抵消。

令 $X\sim\operatorname{Exp}(1)$、$N\sim\operatorname{Poisson}(\lambda)$，并且 $X\perp N$。对整数 $m\geq0$，

$$
\mathbb E[X^m]=\int_0^\infty x^m e^{-x}\,dx=m!.
$$

因此

$$
\mathbb E[X^N]
=\sum_{m=0}^\infty \mathbb E[X^m]\mathbb P(N=m)
=e^{-\lambda}\sum_{m=0}^\infty\lambda^m.
$$

结论是 $\mathbb E[X^N]<\infty$ 当且仅当 $0<\lambda<1$，且此时

$$
\mathbb E[X^N]=\frac{e^{-\lambda}}{1-\lambda}.
$$

对二阶矩，

$$
\mathbb E[X^{2N}]
=e^{-\lambda}\sum_{m=0}^\infty\frac{(2m)!}{m!}\lambda^m.
$$

该级数相邻项之比为 $\lambda(2m+2)(2m+1)/(m+1)$，趋于无穷；因此任意 $\lambda>0$ 都发散。故不存在使 $\operatorname{var}(X^N)$ 有限的 $\lambda$。

**考点。** 条件期望、Gamma 积分、正项级数比值判别法。**易错点。** 一阶矩有限并不推出方差有限。参见 Durrett, *Probability: Theory and Examples*, Chapter 1。

## 题 2：三角形上的条件分布

**动机。** 原分布在单位正方形上均匀；条件事件把样本空间切成两个面积均为 $1/2$ 的直角三角形，故 CDF 等于相应面积比。

设 $A=\{X+Y\leq1\}$、$B=\{X+Y\geq1\}$，则 $\mathbb P(A)=\mathbb P(B)=1/2$。

对 $A$，事件 $\{Z\leq z\}$ 是正方形 $[0,z]^2$。与三角形 $A$ 相交的面积给出

$$
F_{Z\mid A}(z)=
\begin{cases}
0,&z<0,\\
2z^2,&0\leq z\leq\frac12,\\
1-2(1-z)^2,&\frac12\leq z\leq1,\\
1,&z>1.
\end{cases}
$$

当 $z\leq1/2$ 时相交面积为 $z^2$；当 $z\geq1/2$ 时，从 $A$ 的面积 $1/2$ 中减去两个边长 $1-z$ 的小三角形，面积为 $1/2-(1-z)^2$。

对 $B$，$z<1/2$ 时不可能同时有 $X+Y\geq1$ 和 $X,Y\leq z$；$z\in[1/2,1]$ 时相交面积为 $\frac12(2z-1)^2$。故

$$
F_{Z\mid B}(z)=
\begin{cases}
0,&z<\frac12,\\
(2z-1)^2,&\frac12\leq z\leq1,\\
1,&z>1.
\end{cases}
$$

**考点。** 条件概率的几何计算。**易错点。** 条件密度不是仍在正方形上均匀，分母必须除以三角形面积。参见 Ross, *A First Course in Probability*, conditional distributions。

## 题 3：鞅与严格凸性

**动机。** 若一个鞅及其严格凸函数变换都保持“无漂移”，Jensen 不等式只能取等，于是增量被迫为零。

对 (a)，由 $X_n$ 是鞅，

$$
\mathbb E[X_{n+1}^2\mid\mathcal F_n]
=X_n^2+\mathbb E[(X_{n+1}-X_n)^2\mid\mathcal F_n].
$$

左端又等于 $X_n^2$，故条件非负随机变量的期望为零，从而 $X_{n+1}=X_n$ 几乎处处。迭代得到任意 $m,n$ 时 $X_m=X_n$ 几乎处处。

对 (b)，设 $p>1$。条件 Jensen 不等式给出

$$
|X_n|^p=|\mathbb E[X_{n+1}\mid\mathcal F_n]|^p
\leq \mathbb E[|X_{n+1}|^p\mid\mathcal F_n]=|X_n|^p.
$$

等号成立。函数 $x\mapsto|x|^p$ 严格凸，故其 Jensen 等号条件给出 $X_{n+1}=X_n$ 几乎处处。于是对任何 $1\leq q\leq p$，

$$
\mathbb E[|X_{n+1}|^q\mid\mathcal F_n]=|X_n|^q,
$$

所以 $|X_n|^q$ 是鞅。

**考点。** 条件 Jensen 不等式及等号条件。**易错点。** 只证明 $|X_n|^q$ 是次鞅不够；本题的关键是严格凸性强迫路径常数。参见 Durrett, martingales chapter。

## 题 4：稀有大跳与正负子序列

**动机。** $4n$ 的跳跃虽然稀少，但发生时足以压过此前最坏的负增量；另一方面，长时间没有正跳时，大量 $-1$ 会制造负的线性平均。

记 $A_n=\{X_n=4n\}$。因事件独立且

$$
\sum_{n\geq1}\mathbb P(A_n)=\sum_{n\geq1}\frac1{8n}=\infty,
$$

第二 Borel--Cantelli 引理给出 $A_n$ 无穷多次发生。若 $A_n$ 发生，则此前每个增量至少为 $-1$，所以

$$
S_n\geq4n-(n-1)>3n.
$$

故 $\limsup_nS_n/n\geq3>0$。

以下说明负子序列。取增长足够快的整数 $N_j$，使区间

$$
I_j=\{N_j+1,\ldots,(4j+1)N_j\}
$$

两两不交。又有 $\mathbb ES_{N_j}=0$、$\operatorname{var}(S_{N_j})=O(N_j^2)$；取 $N_j$ 足够快并用 Chebyshev 与 Borel--Cantelli，可保证几乎处处最终有 $|S_{N_j}|\leq jN_j$。

令 $E_j$ 为：$I_j$ 内没有 $4k$ 跳跃，且其中至少 $2jN_j$ 个变量等于 $-1$。独立性与 Chernoff 界给出

$$
\mathbb P(E_j)\asymp (4j+1)^{-1/8},
$$

其中第二个条件失败的概率指数小。故 $\sum_j\mathbb P(E_j)=\infty$，且 $E_j$ 独立，因而无穷多次发生。在这些 $j$ 上，令 $m_j=(4j+1)N_j$，则

$$
S_{m_j}\leq S_{N_j}-2jN_j\leq-jN_j.
$$

事实上，$I_j$ 的长度是 $4jN_j$，而在没有正跳的条件下负跳数的均值至少为 $2jN_j$；上述区块构造正是保证 $S_{m_j}\leq-jN_j$ 无穷多次，故

$$
\liminf_{n\to\infty}\frac{S_n}{n}\leq-\frac14<0.
$$

**考点。** 两个 Borel--Cantelli 引理、Chernoff 界、按独立区块构造子序列。**易错点。** 不能仅说“负值概率为 $1/2$”，还必须控制此前累积的正跳。参见 Durrett, laws of large numbers and Borel--Cantelli。

## 题 5：指数鞅的路径与积分

**动机。** $X_t=\exp(B_t-t/2)$ 是几何 Brownian motion；路径极限看 $B_t/t$，积分矩则从联合高斯矩直接算。

由 $B_t/t\to0$ 几乎处处，

$$
\frac1t\log X_t=\frac{B_t}{t}-\frac12\longrightarrow-\frac12,
$$

故 $X_t\to0$ 几乎处处。

对 $0\leq s\leq r$，$\mathbb E[X_s]=1$，并且由 $(B_s,B_r)$ 的联合高斯性，

$$
\mathbb E[X_sX_r]=e^s,
\qquad \operatorname{cov}(X_s,X_r)=e^s-1.
$$

因此 Tonelli 定理和协方差积分公式给出

$$
\mathbb E\left[\int_0^tX_s\,ds\right]=t,
$$

以及

$$
\begin{aligned}
\operatorname{var}\left(\int_0^tX_s\,ds\right)
&=2\int_0^t\int_0^r(e^s-1)\,ds\,dr\\
&=2e^t-2-2t-t^2.
\end{aligned}
$$

最后，由 $B_t/t\to0$，几乎每条路径都存在 $T_0$，使得 $t\geq T_0$ 时 $X_t\leq e^{-t/4}$。于是

$$
\int_0^\infty X_t\,dt
\leq\int_0^{T_0}X_t\,dt+\int_{T_0}^\infty e^{-t/4}\,dt<\infty
$$

几乎处处成立。

**考点。** Brownian 的强大数律、联合高斯矩、Fubini--Tonelli。**易错点。** 每个 $X_t$ 的期望恒为 $1$，不妨碍它路径上趋于 $0$。参见 Karatzas--Shreve, *Brownian Motion and Stochastic Calculus*, Chapter 3。

## 题 6：二维 GOE 型随机矩阵

**动机。** 用 trace 和 eigenvalue gap 分解谱；矩阵密度只依赖 $\operatorname{tr}(M^2)$，这直接解释正交共轭不变性及特征向量方向的对称性。

令 $S=X_1+X_2$、$D=X_1-X_2$。则 $S,D$ 独立且皆为 $N(0,4)$，并且

$$
\lambda_1+\lambda_2=S\sim N(0,4).
$$

特征值差为

$$
G=\lambda_1-\lambda_2=\sqrt{D^2+4Y^2}.
$$

写 $D=2A,Y=B$，其中 $A,B$ 独立 $N(0,1)$。于是 $G=2\sqrt{A^2+B^2}$，即两自由度 chi 分布的两倍，

$$
\mathbb P(G\leq t)=1-e^{-t^2/8},\qquad t\geq0.
$$

因为 $S\perp G$，

$$
\lambda_1=\frac{S+G}{2},\qquad\lambda_2=\frac{S-G}{2}.
$$

它们不独立。例如 $\operatorname{var}(S)=4$、$\operatorname{var}(G)=8-2\pi$，故

$$
\operatorname{cov}(\lambda_1,\lambda_2)
=\frac{\operatorname{var}(S)-\operatorname{var}(G)}4
=\frac\pi2-1\ne0.
$$

又因

$$
f_M(M)\propto\exp\left[-\frac14\operatorname{tr}(M^2)\right],
$$

对任意正交 $O$ 有 $\operatorname{tr}((OMO^\mathsf{T})^2)=\operatorname{tr}(M^2)$，故 $OMO^\mathsf{T}\overset d=M$。矩阵几乎处处有不同特征值，故其有序特征方向（符号视为同一条轴，或采用正交等变的随机符号约定）满足

$$
(O\mathbf v_1,O\mathbf v_2)\overset d=(\mathbf v_1,\mathbf v_2).
$$

**考点。** 正交不变性、Rayleigh 分布、谱分解。**易错点。** 特征向量的正负号本身不唯一，严格叙述时应把它理解为方向或明确符号约定。参见 Anderson--Guionnet--Zeitouni, *An Introduction to Random Matrices*, Gaussian orthogonal ensemble。

## 题 7：把一致估计量压缩到充分统计量

**动机。** Rao--Blackwell 化不会损失均方精度；参数空间有界使“依概率一致”足以升级为均方收敛。

先把原估计量截断为

$$
\widetilde\theta_n=\min\{1,\max\{-1,\widehat\theta_n\}\}.
$$

截断不会增加到任何 $\theta\in[-1,1]$ 的误差，故 $\widetilde\theta_n\to\theta$ 依概率，且 $|\widetilde\theta_n-\theta|\leq2$。由有界收敛型论证，

$$
\mathbb E_\theta(\widetilde\theta_n-\theta)^2\longrightarrow0.
$$

定义只依赖充分统计量的估计量

$$
\delta_n(T_n)=\mathbb E_\theta[\widetilde\theta_n\mid T_n].
$$

充分性保证该条件期望可选为不含未知 $\theta$ 的函数。条件 Jensen 不等式给出

$$
\mathbb E_\theta[\delta_n(T_n)-\theta]^2
\leq\mathbb E_\theta[\widetilde\theta_n-\theta]^2\longrightarrow0.
$$

于是 $\delta_n(T_n)\to\theta$ 依概率，所求一致估计量存在。

**考点。** 充分性、Rao--Blackwell 化、$L^2$ 收敛蕴含依概率收敛。**易错点。** 直接条件化未截断的估计量时，不能从依概率收敛自动推出二阶矩收敛。参见 Casella--Berger, Chapter 6。

## 题 8：指数样本的 UMVUE

**动机。** 指数族的总和是完整充分统计量；先找一个显然无偏的指示变量，再对总和条件化。

令

$$
T=\sum_{i=1}^nX_i.
$$

联合似然为 $\lambda^n e^{-\lambda T}\mathbb I_{\{x_i>0\}}$，故由因子分解定理 $T$ 充分；且 $T\sim\operatorname{Gamma}(n,\text{rate }\lambda)$ 是一参数满指数族的完整统计量。

由于 $\mathbb E_\lambda\mathbb I_{\{X_1>x\}}=e^{-\lambda x}=\phi$，Lehmann--Scheffe 定理给出 UMVUE 为其对 $T$ 的条件期望。给定 $T=t$ 时，$X_1/t\sim\operatorname{Beta}(1,n-1)$，所以当 $n\geq2$，

$$
\widetilde\phi(T)
=\mathbb P(X_1>x\mid T)
=\left(1-\frac{x}{T}\right)^{n-1}\mathbb I_{\{T>x\}}.
$$

当 $n=1$ 时公式自然退化为 $\mathbb I_{\{T>x\}}$。

**考点。** 完全充分统计量、Dirichlet/Gamma 条件分布、Lehmann--Scheffe。**易错点。** 不能把 $\mathbb I_{\{T>x\}}$ 直接当作无偏估计量。参见 Casella--Berger, Chapters 6--7。

## 题 9：Bernoulli 样本的 UMVUE 与可容许性

**动机。** 计数 $S=\sum_iX_i$ 同时承载完整充分性和组合结构；第二问把给定损失下的 Bayes 规则显式算出即可。

令 $S=\sum_{i=1}^nX_i\sim\operatorname{Binomial}(n,p)$。它对 $p$ 完全且充分。注意

$$
\mathbb E\left[\frac{\binom Sk}{\binom nk}\right]=p^k,
\qquad
\mathbb E\left[\frac{\binom S{n-k}}{\binom n{n-k}}\right]=(1-p)^{n-k}.
$$

故

$$
\widetilde g(S)=\frac{\binom Sk}{\binom nk}+\frac{\binom S{n-k}}{\binom n{n-k}}
$$

无偏；由 Lehmann--Scheffe，它是 $g(p)$ 的 UMVUE。约定当下标超出 $[0,S]$ 时组合数为零。

对 (b)，取均匀先验 $\pi(p)=1$。后验为 $\operatorname{Beta}(S+1,n-S+1)$。在损失

$$
L(p,a)=\frac{(p-a)^2}{p(1-p)}
$$

下，后验风险对 $a$ 的导数为零当且仅当

$$
a=\frac{\mathbb E[1/(1-p)\mid S]}
{\mathbb E[1/(p(1-p))\mid S]}.
$$

当 $1\leq S\leq n-1$ 时，将 Beta 积分代入。若后验参数为 $A=S+1,B=n-S+1$，则上式等于

$$
\frac{A-1}{A+B-2}=\frac Sn=\overline X.
$$

在边界 $S=0,n$，直接检查后验风险可知唯一有限风险动作分别为 $0,1$，仍与 $S/n$ 一致。因此 $\overline X$ 是适当先验下唯一 Bayes 规则。并且其风险恒为

$$
R(p,\overline X)
=\frac{\operatorname{var}_p(\overline X)}{p(1-p)}
=\frac1n<\infty.
$$

任何一致优于它的规则会严格降低 Bayes 风险，矛盾于 Bayes 最优性；故 $\overline X$ 可容许。

**考点。** Binomial 完全性、组合无偏估计、Bayes 可容许性。**易错点。** 第二项的组合数下标是 $n-k$，不是 $k$。参见 Casella--Berger, Chapters 5--7。

## 题 10：对数正态先验与 Uniform 端点模型

**动机。** Uniform$(0,\theta)$ 的信息全部压缩为最大次序统计量；在 $\eta=\log\theta$ 坐标中，后验是截断正态。

记 $M=X_{(n)}$、$\eta=\log\theta$。似然为

$$
L(\eta;x)=e^{-n\eta}\mathbb I_{\{\eta\geq\log M\}}.
$$

先验为 $\eta\sim N(\mu_0,\sigma_0^2)$。配方后令

$$
\mu_n=\mu_0-n\sigma_0^2,
$$

则后验密度为截断正态密度

$$
\pi(\eta\mid x)=
\frac{\varphi((\eta-\mu_n)/\sigma_0)}
{\sigma_0\,[1-\Phi((\log M-\mu_n)/\sigma_0)]}
\mathbb I_{\{\eta\geq\log M\}},
$$

其中 $\varphi,\Phi$ 分别为标准正态密度和 CDF。

题目要求最大化的是 $\theta$ 的后验密度，而不是 $\eta$ 的后验密度。变换 Jacobian 给出 $\pi(\theta\mid x)=\pi(\eta\mid x)/\theta$。其对数在可行域内的无约束极大点为

$$
\eta^*=\mu_0-(n+1)\sigma_0^2.
$$

故 MAP 型 Bayes 估计量为

$$
\widehat\theta_B
=\max\left\{M,\exp[\mu_0-(n+1)\sigma_0^2]\right\}.
$$

由于 $M\to\theta$ 几乎处处，而第二项趋于 $0$，故 $\widehat\theta_B\to\theta$，即它一致。

**考点。** 端点参数、截断后验、变量变换下的 MAP。**易错点。** 在 $\eta$ 上取 mode 与在 $\theta$ 上取 mode 不同，后者多出 Jacobian 的 $-\eta$。参见 Berger, *Statistical Decision Theory and Bayesian Analysis*, posterior modes。

## 题 11：离散 Uniform 的 UMP 检验

**动机。** $X_{(n)}$ 是关于支持端点 $\theta$ 的充分信息：最大值过大直接反驳小端点，最大值异常小则支持更小的端点。

令 $M=X_{(n)}$。当参数为 $\theta$ 时，

$$
\mathbb P_\theta(M\leq m)=\left(\frac m\theta\right)^n,
\qquad 1\leq m\leq\theta.
$$

对 (a)，检验

$$
\phi_+(x)=
\begin{cases}
1,&M>\theta_0,\\
\alpha,&M\leq\theta_0
\end{cases}
$$

在每个 $\theta\leq\theta_0$ 下都恰有 $\mathbb E_\theta\phi_+=\alpha$，故大小为 $\alpha$。若 $\theta>\theta_0$，事件 $M>\theta_0$ 在零假设下不可能而在备择下有正概率，必须以概率 $1$ 拒绝；其余可行点上随机化概率至多为 $\alpha$。因此该检验对每个 $\theta>\theta_0$ 都最强，从而 UMP。

对 (b)，令 $c=\theta_0\alpha^{1/n}$，并按题设假定 $c$ 为整数。定义

$$
\phi_\pm(x)=
\begin{cases}
1,&M>\theta_0\ \text{或}\ M\leq c,\\
0,&\text{其余情形}.
\end{cases}
$$

在 $H_0:\theta=\theta_0$ 下，$M>\theta_0$ 不可能，且

$$
\mathbb E_{\theta_0}\phi_\pm
=\mathbb P_{\theta_0}(M\leq c)
=\left(\frac c{\theta_0}\right)^n
=\alpha.
$$

当 $\theta>\theta_0$ 时，上尾 $M>\theta_0$ 是零假设下概率为零的最强证据；当 $\theta<\theta_0$ 时，似然比随 $M$ 减小而增大，Neyman--Pearson 引理把剩余的大小 $\alpha$ 全部分配给 $M\leq c$。所以 $\phi_\pm$ 对所有双侧备择参数均最强，因而为 UMP。

**考点。** 次序统计量、支持集依赖参数的检验、Neyman--Pearson 引理。**易错点。** (b) 的 size 只在 $\theta_0$ 下计算；整除条件保证不用边界随机化。参见 Lehmann--Romano, *Testing Statistical Hypotheses*, UMP tests。

## 参考文献

- 清华大学求真书院，[2025 秋季 Probability & Statistics 博士生资格考试原卷](../sources/exams/qzc-qe-probability-statistics-2025-fall.pdf)。
- R. Durrett, *Probability: Theory and Examples*, 4th ed., Cambridge University Press, 2010：鞅、Borel--Cantelli、Brownian motion。
- G. Casella and R. L. Berger, *Statistical Inference*, 2nd ed., Duxbury, 2002：充分性、UMVUE、Bayes 与检验。
- E. L. Lehmann and J. P. Romano, *Testing Statistical Hypotheses*, 3rd ed., Springer, 2005：Neyman--Pearson 与 UMP 检验。
- G. Grimmett, *Percolation*, 2nd ed., Springer, 1999：不等式与分枝过程工具的背景。

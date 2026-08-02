# 2024 春季概率统计博资考逐题参考解

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-probability-statistics-2024-spring.pdf)（2 页、11 题）与 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-probability-statistics-2024-spring/reading.md)。公式、题号与条件以官方 PDF 为准。
> - 未发现官方公布的评分答案。本文是教学性参考解：每一个外部定理都说明其在本题中为何可用；引用置于相应题目末尾。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：无穷方差下的正态极限

**动机。** 普通中心极限定理要求有限方差；本题恰好处在尾部为 $x^{-3}$ 的临界情形。正确的归一化比 $\sqrt n$ 多一个 $\sqrt{\log n}$ 因子。

记特征函数为 $\phi(t)=\mathbb E e^{itX_1}$，且 $S_n=\sum_{j=1}^nX_j$。

### (a) 二阶矩

密度是偶函数，先核对其归一化：

$$
\int_{\mathbb R}f(x)\,dx
=2\int_1^\infty x^{-3}\,dx=1.
$$

但

$$
\mathbb E X_1^2
=2\int_1^\infty x^2x^{-3}\,dx
=2\int_1^\infty\frac{dx}{x}=\infty.
$$

### (b) 归一化与极限

取 $a_n=\sqrt{n\log n}$。对固定 $t$，题设给出

$$
1-\phi(t/a_n)
\sim \frac{t^2}{a_n^2}\log\frac{a_n}{|t|}.
$$

因为 $\log a_n/\log n\to\tfrac12$，所以

$$
n\bigl(1-\phi(t/a_n)\bigr)
\to \frac{t^2}{2}.
$$

令 $z_n=1-\phi(t/a_n)$。上式蕴含 $z_n\to0$，故 $\log(1-z_n)=-z_n+o(z_n)$；于是

$$
\log\mathbb E e^{itS_n/a_n}
=n\log\phi(t/a_n)
\to-\frac{t^2}{2}.
$$

故特征函数收敛到 $e^{-t^2/2}$。由 Lévy 连续性定理，$S_n/\sqrt{n\log n}\Rightarrow N(0,1)$。

**考点。** 临界重尾、特征函数法、Lévy 连续性定理。

**易错点。** 不能把此题直接套有限方差 CLT；$\sqrt n$ 归一化会给出退化的尺度。

**参考。** Durrett, *Probability: Theory and Examples*, 5th ed., §§3.3, 3.9；Feller, *An Introduction to Probability Theory*, Vol. II, Ch. XVII.

## 题 2：指数样本的极端值

设 $X_j\sim\operatorname{Exp}(1)$，故 $\mathbb P(X_j>x)=e^{-x}$，$M_n=\max_{j\le n}X_j$。

### (a) $\limsup X_n/\log n=1$

给定 $\varepsilon>0$，

$$
\sum_{n\ge2}\mathbb P\{X_n>(1+\varepsilon)\log n\}
=\sum_{n\ge2}n^{-(1+\varepsilon)}<\infty.
$$

第一 Borel--Cantelli 引理说明该事件只发生有限次，故上极限至多为 $1+\varepsilon$。另一方面，

$$
\sum_{n\ge2}\mathbb P\{X_n>(1-\varepsilon)\log n\}
=\sum_{n\ge2}n^{-(1-\varepsilon)}=\infty.
$$

这些事件独立，第二 Borel--Cantelli 引理说明其无穷多次发生，故上极限至少为 $1-\varepsilon$。令 $\varepsilon\downarrow0$ 即得结论。

### (b) $\liminf M_n/\log n=1$

上界来自 (a)：几乎处处最终有 $X_j\le(1+\varepsilon)\log j$，从而 $M_n\le(1+\varepsilon)\log n$。

为取下界，令 $n_m=2^m$。独立性给出

$$
\mathbb P\{M_{n_m}\le(1-\varepsilon)\log n_m\}
=\left(1-n_m^{-(1-\varepsilon)}\right)^{n_m}
\le e^{-n_m^\varepsilon}.
$$

右端对 $m$ 可和，故几乎处处最终 $M_{2^m}>(1-\varepsilon)m\log2$。若 $2^m\le n<2^{m+1}$，单调性给出

$$
\frac{M_n}{\log n}\ge
\frac{M_{2^m}}{(m+1)\log2}
\ge(1-\varepsilon)\frac m{m+1}.
$$

令 $m\to\infty$ 后再令 $\varepsilon\downarrow0$。

**考点。** 两个 Borel--Cantelli 引理、稀疏子序列与单调性补全。

**易错点。** 对 $M_n$ 的下界不能只证明某个固定 $n$ 的高概率事件；需要可和估计以得到几乎处处结论。

**参考。** Durrett, §§2.3, 2.5；Resnick, *Extreme Values, Regular Variation and Point Processes*, Ch. 1.

## 题 3：概率收敛与乘法

### (a) 乘积保持概率收敛

**定义。** $W_n\xrightarrow{\mathbb P}W$ 指对每个 $\eta>0$，$\mathbb P(|W_n-W|>\eta)\to0$。

由 $X_n\to X$ 与 $Y_n\to Y$ 的概率收敛，四个随机变量族 $X_n,Y_n,X,Y$ 都是 tight。对任意 $\eta,\delta>0$，先取 $K$ 使

$$
\sup_n\mathbb P(|X_n|>K)+\mathbb P(|Y|>K)<\delta.
$$

在 $|X_n|,|Y|\le K$ 上，

$$
|X_nY_n-XY|
\le |X_n||Y_n-Y|+|Y||X_n-X|
\le K|Y_n-Y|+K|X_n-X|.
$$

因此

$$
\mathbb P(|X_nY_n-XY|>\eta)
\le2\delta+\mathbb P\left(|Y_n-Y|>\frac\eta{2K}\right)
+\mathbb P\left(|X_n-X|>\frac\eta{2K}\right),
$$

取极限后再令 $\delta\downarrow0$，即得 $X_nY_n\to XY$ 依概率收敛。

### (b) $L^1$ 版本为假

取一个事件 $A_n$，满足 $\mathbb P(A_n)=n^{-2}$，并令

$$
X_n=Y_n=n\mathbb I_{A_n},\qquad X=Y=0.
$$

则 $\mathbb E|X_n|=\mathbb E|Y_n|=n^{-1}\to0$，所以两者均 $L^1$ 收敛到零；但

$$
\mathbb E|X_nY_n-XY|=n^2\mathbb P(A_n)=1.
$$

故乘积不必 $L^1$ 收敛。

**考点。** Slutsky 型闭包性质、tightness、反例构造。

**易错点。** 不能写 $\mathbb E|X_n(Y_n-Y)|\le\mathbb E|X_n|\mathbb E|Y_n-Y|$，两项一般并不独立。

**参考。** Billingsley, *Convergence of Probability Measures*, Ch. 1；Durrett, §2.2.

## 题 4：有漂移随机游走的首达问题

令 $q=1-p$，$S_n=\sum_{j=1}^nX_j$，且 $T_k=\inf\{n\ge1:S_n=k\}$。

### (a) 指数鞅与可选停止

定义

$$
M(t)=\mathbb E e^{tX_1}=pe^t+qe^{-t},\qquad
L_n=e^{tS_n}M(t)^{-n}.
$$

利用 $X_{n+1}$ 独立于 $\mathcal F_n$，

$$
\mathbb E(L_{n+1}\mid\mathcal F_n)
=L_nM(t)^{-1}\mathbb E e^{tX_{n+1}}=L_n,
$$

故 $L_n$ 是鞅。当 $p\ge\tfrac12$ 时，随机游走无负漂移，故 $T_k<\infty$ 几乎处处。对有界停时 $T_k\wedge N$ 应用可选停止：$\mathbb EL_{T_k\wedge N}=1$。又 $t>0$ 时 $M(t)>1$，而在 $T_k>N$ 上 $S_N\le k-1$，故余项被 $e^{t(k-1)}M(t)^{-N}$ 控制并趋于零。令 $N\to\infty$：

$$
\mathbb E\left[e^{tS_{T_k}}M(t)^{-T_k}\right]=1.
$$

### (b) 下漂移时的命中概率

若 $p<q$，令 $r=p/q<1$。函数 $h(i)=r^{k-i}$ 满足 $h(k)=1$ 且 $h(i)=ph(i+1)+qh(i-1)$。因此 $h(S_{n\wedge T_k})$ 是有界鞅。令 $n\to\infty$，在未命中时 $S_n\to-\infty$ 而 $h(S_n)\to0$，所以

$$
\mathbb P(T_k<\infty)=h(0)=\left(\frac pq\right)^k.
$$

### (c) 最高点的分布

令 $Y=1+\sup_{n\ge0}S_n$。对 $m\ge1$，

$$
\mathbb P(Y\ge m)=\mathbb P(T_{m-1}<\infty)=r^{m-1}.
$$

故

$$
\mathbb P(Y=m)=(1-r)r^{m-1},\qquad m=1,2,\ldots.
$$

即 $Y$ 是参数 $1-p/q$ 的几何分布。

**考点。** 指数鞅、可选停止、调和函数与赌博破产。

**易错点。** 本题 $T_k$ 不有界；先停在 $T_k\wedge N$ 才能直接调用可选停止。

**参考。** Durrett, §§5.2, 5.3；Williams, *Probability with Martingales*, Chs. 10--12.

## 题 5：由噪声驱动的马尔可夫链

### (a) 马尔可夫性

对 $x,y\in S$ 定义

$$
P(x,y)=\mathbb P\{f(x,Z_1)=y\}.
$$

给定 $X_{n-1}=x$ 及全部过去，$Z_n$ 仍独立并与 $Z_1$ 同分布。因此

$$
\mathbb P(X_n=y\mid X_0,\ldots,X_{n-1})
=\mathbb P(f(x,Z_n)=y)=P(x,y).
$$

右侧只依赖现态 $x$，故这是时齐马尔可夫链，转移核正是 $P$。

### (b) 任意时齐链都可如此表示

把可数状态空间枚举为 $S=\{s_1,s_2,\ldots\}$。令 $Z_n\stackrel{\mathrm{iid}}\sim\operatorname{Unif}(0,1)$，并记

$$
f(s_i,u)=s_j\quad\text{当}\quad
\sum_{\ell<j}P(s_i,s_\ell)\le u<\sum_{\ell\le j}P(s_i,s_\ell).
$$

每个 $f(s_i,\cdot)$ 都是可测的，且区间长度为 $P(s_i,s_j)$，从而 $\mathbb P(f(s_i,Z_n)=s_j)=P(s_i,s_j)$。这恰好重建给定的转移矩阵。

**考点。** 随机递推表示、逆变换抽样、转移核。

**易错点。** 证明马尔可夫性时必须条件于整个过去，而不只是条件于 $X_{n-1}$。

**参考。** Norris, *Markov Chains*, §§1.1--1.2；Kallenberg, *Foundations of Modern Probability*, Ch. 6.

## 题 6：布朗运动首达时

设 $T_a=\inf\{t>0:B_t\ge a\}$，其中 $a>0$。

### (a) 停时性质

路径连续性给出

$$
\{T_a\le t\}=\left\{\sup_{0\le s\le t}B_s\ge a\right\}.
$$

右侧由 $\{B_r:r\in\mathbb Q\cap[0,t]\}$ 生成，因而属于 $\mathcal F_t$。这正是停时定义。

### (b) Laplace 变换

取 $u=\sqrt{2\lambda}$。指数过程

$$
N_t=\exp\left(uB_t-\frac{u^2t}{2}\right)
$$

是均值为一的正鞅。为避免无界停时，先在 $T_a\wedge T_{-b}$ 停止并用可选停止，再令 $b\to\infty$；负边界项消失，得到

$$
1=\mathbb E\left[e^{u a-\lambda T_a};T_a<\infty\right].
$$

故

$$
\mathbb E e^{-\lambda T_a}=e^{-a\sqrt{2\lambda}}.
$$

令 $\lambda\downarrow0$，由单调收敛，左端趋于 $\mathbb P(T_a<\infty)$，右端趋于 $1$，所以 $T_a<\infty$ 几乎处处。

**考点。** 停时可测性、指数鞅、局部化后的可选停止。

**易错点。** 不能在未验证可选停止条件时直接把 $t$ 换成 $T_a$。

**参考。** Karatzas and Shreve, *Brownian Motion and Stochastic Calculus*, Ch. 3；Øksendal, *Stochastic Differential Equations*, Ch. 7.

## 题 7：正态位置模型中的 minimax 估计

**动机。** 估计器 $\delta(\mathbf X)=\mathbf X$ 对每个参数的风险都相同；要证 minimax，还须排除任何其他规则把最大风险压到该常数以下的可能。

在 $X_i\sim N(\mu_i,1)$ 且平方损失下，

$$
R(\boldsymbol\mu,\delta)
=\mathbb E_{\boldsymbol\mu}\sum_{i=1}^n(X_i-\mu_i)^2=n.
$$

为给出下界，取先验 $\mu_i\stackrel{\mathrm{iid}}\sim N(0,\tau^2)$。共轭计算给出 Bayes 规则 $\delta_\tau(\mathbf X)=\frac{\tau^2}{1+\tau^2}\mathbf X$，其 Bayes 风险为

$$
r_\tau=\frac{n\tau^2}{1+\tau^2}.
$$

任何规则的最大风险不小于其 Bayes 风险，故 minimax 值 $R^*$ 满足 $R^*\ge r_\tau$。令 $\tau\to\infty$，得 $R^*\ge n$；而 $\delta(\mathbf X)=\mathbf X$ 的最大风险正好为 $n$。因此它 minimax。

**考点。** 风险函数、Bayes 下界、共轭正态更新。

**易错点。** “风险常数”本身不足以推出 minimax；必须再建立所有规则共有的下界。

**参考。** Lehmann and Casella, *Theory of Point Estimation*, 2nd ed., §§5.1--5.2；Berger, *Statistical Decision Theory*, Ch. 4.

## 题 8：均匀位置模型与 Slutsky 定理

令 $X_i\sim\operatorname{Unif}(\theta,\theta+10)$，$\theta>0$，且 $\hat\theta=X_{(1)}$。

### (a) 一致性

对 $0<\varepsilon<10$，

$$
\mathbb P(\hat\theta-\theta>\varepsilon)
=\mathbb P(X_1>\theta+\varepsilon,\ldots,X_n>\theta+\varepsilon)
=\left(1-\frac\varepsilon{10}\right)^n\to0.
$$

又 $\hat\theta\ge\theta$，故 $\hat\theta\xrightarrow{\mathbb P}\theta$。

### (b) 渐近分布

均匀分布的均值为 $\theta+5$、方差为 $100/12$，故 CLT 给出

$$
\sqrt{12n}\bigl(\bar X-5-\theta\bigr)
\Rightarrow N(0,100).
$$

由 (a)，$1/\hat\theta\to1/\theta$ 依概率收敛。Slutsky 定理因此给出

$$
\sqrt{12n}\frac{\bar X-5-\theta}{\hat\theta}
\Rightarrow N\left(0,\frac{100}{\theta^2}\right).
$$

**考点。** 次序统计量、一致性、CLT、Slutsky 定理。

**易错点。** 分母 $\hat\theta$ 的极限是参数 $\theta$，不可误替为 $1$。

**参考。** Casella and Berger, *Statistical Inference*, 2nd ed., §§5.5, 5.9；van der Vaart, *Asymptotic Statistics*, Ch. 2.

## 题 9：均值和方差共同依赖参数的正态模型

令 $Y_i=\log X_i$，则 $Y_i\sim N(\theta,\theta)$，$\theta>0$，并令 $A=\sum_{i=1}^nY_i^2$。

### (a) MLE

忽略与 $\theta$ 无关的常数，log-likelihood 为

$$
\ell(\theta)=-\frac n2\log\theta-\frac{1}{2\theta}\sum_{i=1}^n(Y_i-\theta)^2
=-\frac n2\log\theta-\frac{A}{2\theta}-\frac{n\theta}{2}+\sum_iY_i.
$$

求导并乘以 $2\theta^2$：

$$
2\theta^2\ell'(\theta)=-n\theta+A-n\theta^2.
$$

唯一正根为

$$
\hat\theta=\frac{-1+\sqrt{1+4A/n}}{2}.
$$

该导数在根的左侧为正、右侧为负，故该点是全局极大值。

### (b) 渐近正态性

正态模型中均值 $m(\theta)=\theta$、方差 $v(\theta)=\theta$。每个观测的信息量为

$$
I_1(\theta)=\frac{[m'(\theta)]^2}{v(\theta)}
+\frac12\left[\frac{v'(\theta)}{v(\theta)}\right]^2
=\frac1\theta+\frac1{2\theta^2}.
$$

模型在 $\theta>0$ 的内部满足正则性条件，因此

$$
\sqrt n(\hat\theta-\theta)
\Rightarrow N\left(0,I_1(\theta)^{-1}\right)
=N\left(0,\frac{2\theta^2}{2\theta+1}\right).
$$

**考点。** MLE、Fisher 信息、参数同时控制均值与方差。

**易错点。** 不可把 $N(\theta,\theta)$ 当成方差固定的普通位置族；第二个信息项不能漏掉。

**参考。** Casella and Berger, §§7.2--7.5；van der Vaart, Ch. 5.

## 题 10：Pareto 均值假设的 UMP 检验

Pareto 密度为 $f(x\mid\theta)=100^\theta\theta x^{-1-\theta}$，$x>100$，$\theta>1$。直接积分可得

$$
\mu(\theta)=\mathbb EX=\frac{100\theta}{\theta-1}.
$$

此函数严格递减，故 $H_0:\mu=\mu_0$ 等价于 $\theta=\theta_0$，其中

$$
\theta_0=\frac{\mu_0}{\mu_0-100},
$$

并且 $H_1:\mu>\mu_0$ 等价于 $\theta<\theta_0$。令

$$
T=\sum_{i=1}^n\log(X_i/100).
$$

变量 $\log(X_i/100)$ 独立且服从率为 $\theta$ 的指数分布，所以 $T\sim\operatorname{Gamma}(n,\text{rate }\theta)$。似然中关于参数的部分为 $\theta^ne^{-\theta T}$，对 $T$ 有单调似然比；较小的 $T$ 支持较小的 $\theta$。因此由 Karlin--Rubin 定理，UMP 水平 $\alpha$ 的拒绝域为

$$
\boxed{\;T\le c_\alpha,\qquad
\mathbb P_{\theta_0}(T\le c_\alpha)=\alpha.\;}
$$

**考点。** 参数重写、充分统计量、单调似然比、Karlin--Rubin 定理。

**易错点。** 均值随 $\theta$ **递减**；若方向没有先转换，拒绝域会写反。

**参考。** Casella and Berger, Ch. 8；Lehmann and Romano, *Testing Statistical Hypotheses*, 3rd ed., §3.4.

## 题 11：约束正态模型的 UMVUE

**动机。** 直接使用 $\bar X_1$ 虽无偏，但忽略了已知约束 $\theta_1+\theta_2+\theta_3=1$。把它对完整充分统计量条件化，可以降低方差。

令

$$
D_1=\bar X_1-\bar X_3,\qquad D_2=\bar X_2-\bar X_3,
$$

并令 $W=\bar X_1+\bar X_2+\bar X_3$。由正态性和正交分解，$(D_1,D_2)$ 与 $W$ 独立；又由约束 $\mathbb EW=1$。恒等式

$$
\bar X_1=\frac{W+2D_1-D_2}{3}
$$

给出

$$
\mathbb E(\bar X_1\mid D_1,D_2)
=\frac{1+2D_1-D_2}{3}.
$$

因此候选估计量是

$$
\boxed{\;
\delta^*=\frac{1+2(\bar X_1-\bar X_3)-(\bar X_2-\bar X_3)}{3}
=\frac{1+2\bar X_1-\bar X_2-\bar X_3}{3}.
\;}
$$

它无偏，因为 $\mathbb ED_1=\theta_1-\theta_3$、$\mathbb ED_2=\theta_2-\theta_3$，并且

$$
\frac{1+2(\theta_1-\theta_3)-(\theta_2-\theta_3)}3
=\theta_1.
$$

$(D_1,D_2)$ 是此二维正态指数族的充分统计量；参数集合的内部 $\{\theta_i>0,\sum_i\theta_i=1\}$ 在自然参数空间中含开集，故该统计量完整。由 Rao--Blackwell 和 Lehmann--Scheffé 定理，$\delta^*$ 是 $\theta_1$ 的 UMVUE。

**考点。** 线性约束、充分性与完全性、Rao--Blackwell、Lehmann--Scheffé。

**易错点。** 不能仅因 $\bar X_1$ 无偏便称其 UMVUE；约束信息确实能降低方差。

**参考。** Lehmann and Casella, Chs. 1--2；Casella and Berger, §§6.2--6.3.

## 参考文献

- Rick Durrett, *Probability: Theory and Examples*, 5th ed., Cambridge University Press, 2019.
- Patrick Billingsley, *Convergence of Probability Measures*, 2nd ed., Wiley, 1999.
- J. R. Norris, *Markov Chains*, Cambridge University Press, 1997.
- Ioannis Karatzas and Steven Shreve, *Brownian Motion and Stochastic Calculus*, 2nd ed., Springer, 1991.
- George Casella and Roger L. Berger, *Statistical Inference*, 2nd ed., Duxbury, 2002.
- Erich Lehmann and George Casella, *Theory of Point Estimation*, 2nd ed., Springer, 1998.
- Aad van der Vaart, *Asymptotic Statistics*, Cambridge University Press, 1998.

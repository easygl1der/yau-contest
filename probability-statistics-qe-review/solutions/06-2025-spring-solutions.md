# 2025 春季概率统计博资考逐题参考解

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-probability-statistics-2025-spring.pdf)，共 3 页；题面转录见 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-probability-statistics-2025-spring/reading.md)。
> - 本文给出全部 11 题的教学性参考解。原卷要求考生选做 8 题；本文完整覆盖是为了复习使用，并非官方评分答案。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：均匀样本的极值与条件期望

**动机。** 最小值和最大值把 $n$ 个样本压缩成两个顺序统计量。给定最大值后，其余样本仍具有缩放后的均匀结构。

**符号。** $X_n=\min_iU_i$，$Y_n=\max_iU_i$，且 $U_i\stackrel{\mathrm{iid}}{\sim}U(0,1)$。

**考点。** 顺序统计量、条件分布。参考 Casella--Berger, *Statistical Inference*, Sec. 2.5。

对 $0<x<y<1$，事件 $X_n>x,Y_n\le y$ 等价于所有样本落在 $(x,y]$，故其概率为 $(y-x)^n$。对 $x$ 与 $y$ 求偏导，得到联合密度

$$
f_{X_n,Y_n}(x,y)=n(n-1)(y-x)^{n-2}\mathbf 1_{\{0<x<y<1\}}.
$$

另一方面，$Y_n$ 的密度是 $f_{Y_n}(y)=ny^{n-1}\mathbf 1_{(0,1)}(y)$。因此

$$
f_{X_n\mid Y_n=y}(x)
=\frac{(n-1)(y-x)^{n-2}}{y^{n-1}}\mathbf 1_{(0,y)}(x).
$$

也可作更直观的解释：给定 $Y_n=y$ 后，其余 $n-1$ 个点像 $U(0,y)$ 的独立样本，$X_n$ 是它们的最小值。于是

$$
\mathbb E[X_n\mid Y_n=y]
=\int_0^x\mathbb P(X_n>t\mid Y_n=y)dt
=\int_0^y\left(1-\frac ty\right)^{n-1}dt
=\frac yn.
$$

故

$$
\mathbb E[X_n\mid\sigma(Y_n)]=\frac{Y_n}{n}\quad\text{a.s.}
$$

**易错点。** 条件于 $Y_n=y$ 后，不应把所有 $n$ 个变量仍当成独立 $U(0,y)$；其中一个变量已经等于最大值 $y$。

## 题 2：三维高斯向量的线性分解

**动机。** 高斯回归把 $X$ 拆为由 $(Y,Z)$ 线性解释的部分和独立噪声；协方差矩阵正定性决定剩余噪声的方差是否非负。

**符号。** 协方差矩阵为

$$
\Sigma=
\begin{pmatrix}1&\rho&\tau\\\rho&1&0\\\tau&0&1\end{pmatrix}.
$$

**考点。** 半正定矩阵、正态回归、零协方差蕴含独立。参考 Kallenberg, *Foundations of Modern Probability*, Ch. 5。

协方差矩阵必须半正定，故其行列式非负：

$$
\det\Sigma=1-\rho^2-\tau^2\ge0.
$$

所以 $\rho^2+\tau^2\le1$。

令

$$
R=X-\rho Y-\tau Z.
$$

直接计算协方差：

$$
\operatorname{cov}(R,Y)=\rho-\rho=0,qquad
\operatorname{cov}(R,Z)=\tau-\tau=0,
$$

以及

$$
\operatorname{var}(R)=1-\rho^2-\tau^2.
$$

$(R,Y,Z)$ 仍为联合高斯，且 $R$ 与 $(Y,Z)$ 零协方差，故二者独立。若 $c=\sqrt{1-\rho^2-\tau^2}>0$，取 $W=R/c$，则 $W\sim N(0,1)$ 且独立于 $(Y,Z)$，从而

$$
X=\rho Y+\tau Z+\sqrt{1-\rho^2-\tau^2}\,W.
$$

所以 $a=\rho,b=\tau,c=\sqrt{1-\rho^2-\tau^2}$。当 $c=0$ 时，$X=\rho Y+\tau Z$ a.s.；可在扩充概率空间上另取任意独立标准高斯 $W$，其系数为零。

**易错点。** “零协方差即独立”只在联合高斯的前提下成立。

## 题 3：对称随机游走的矩母函数与出界时间

**动机。** 生成函数把随机时刻 $\tau$ 的分布问题变成一个二阶差分边值问题。

**符号。** $S_n=\sum_{j=1}^n\xi_j$，其中 $\mathbb P(\xi_j=\pm1)=1/2$；

$$
\tau=\min\{n:S_n=-a\ \text{或}\ S_n=b\},\qquad a,b\in\mathbb Z_{>0}.
$$

**考点。** 独立增量、停时、差分方程。参考 Durrett, *Probability: Theory and Examples*, Ch. 5。

独立性给出

$$
\mathbb E[e^{\lambda S_n}]
=\prod_{j=1}^n\mathbb E[e^{\lambda\xi_j}]
=\left(\frac{e^\lambda+e^{-\lambda}}2\right)^n
=(\cosh\lambda)^n.
$$

为求 $\mathbb E[s^\tau]$，令 $g(i)=\mathbb E_i[s^\tau]$，其中起点为 $S_0=i$。第一步分析给出

$$
g(i)=\frac s2g(i-1)+\frac s2g(i+1),\qquad -a<i<b,
$$

并有边界条件 $g(-a)=g(b)=1$。特征方程为

$$
r^2-\frac2s r+1=0.
$$

令 $\gamma=\operatorname{arcosh}(1/s)>0$，则两个根为 $e^\gamma,e^{-\gamma}$。将坐标平移为 $m=i+a$、区间长度 $L=a+b$，满足两端皆为 $1$ 的解为

$$
g(i)=\frac{\cosh\left(\gamma\left(m-\frac L2\right)\right)}
{\cosh(\gamma L/2)}.
$$

从 $i=0$ 出发，即 $m=a$，所以

$$
\mathbb E[s^\tau]
=\frac{\cosh\left(\gamma(a-b)/2\right)}
{\cosh\left(\gamma(a+b)/2\right)},
\qquad \cosh\gamma=\frac1s.
$$

**易错点。** $g(-a)=g(b)=1$，不是 $0$；因为一旦已在边界，剩余停时为零，$s^0=1$。

## 题 4：二进制权重鞅与首次正增量

**动机。** 这里的权重使首次出现 $+1$ 前的所有负项恰好和最后一个正项抵消，因而停时值可以直接算出。

**符号。**

$$
X_n=\sum_{j=1}^n2^{j-1}\xi_j,qquad
T=\min\{j\ge1:\xi_j=1\}.
$$

**考点。** 几何分布、鞅、停时值。参考 Williams, *Probability with Martingales*, Ch. 12。

事件 $\{T=k\}$ 是前 $k-1$ 次均为 $-1$、第 $k$ 次为 $+1$，故

$$
\mathbb P(T=k)=2^{-k},\qquad k=1,2,\ldots.
$$

因此 $T$ 是成功概率 $1/2$ 的几何随机变量，

$$
\mathbb E[T]=\sum_{k\ge1}k2^{-k}=2.
$$

对自然滤过 $\mathcal F_n=\sigma(\xi_1,\ldots,\xi_n)$，

$$
\mathbb E[X_{n+1}\mid\mathcal F_n]
=X_n+2^n\mathbb E[\xi_{n+1}\mid\mathcal F_n]
=X_n,
$$

故 $(X_n)$ 是鞅。更强地，在 $T=k$ 上，

$$
X_T=-\sum_{j=1}^{k-1}2^{j-1}+2^{k-1}
=-(2^{k-1}-1)+2^{k-1}=1.
$$

所以

$$
\mathbb E[X_T]=1.
$$

这里无需不加验证地套可选停时定理；直接逐路径计算已经给出结果。

**易错点。** $X_T$ 不是 $0$：几何级数 $1+2+\cdots+2^{k-2}=2^{k-1}-1$ 少了一个 $1$。

## 题 5：Brownian motion 的首次离开与出口方向

**动机。** 对称 Brownian motion 从区间离开的时间不携带“向左还是向右离开”的偏好；反射对称将这一直觉变成条件独立性。

**符号。**

$$
T_a=\inf\{t\ge0:|B_t|=a\},\qquad a>0.
$$

**考点。** 停止布朗运动、二次鞅、路径反射。参考 Karatzas--Shreve, *Brownian Motion and Stochastic Calculus*, Ch. 3。

$B_t^2-t$ 是鞅。对有界停时 $T_a\wedge t$ 使用可选停时，

$$
\mathbb E[T_a\wedge t]=\mathbb E[B_{T_a\wedge t}^2]\le a^2.
$$

不等式成立是因为若尚未离开，则 $|B_t|<a$；若已离开，连续性给出 $|B_{T_a}|=a$。令 $t\to\infty$，单调收敛给出

$$
\mathbb E[T_a]\le a^2<\infty,
$$

因此 $T_a<\infty$ a.s.

现在令 $A\in\sigma(T_a)$。路径变换 $B\mapsto-B$ 保持 Wiener 测度，并且保持 $T_a$ 不变，却交换事件 $\{B_{T_a}=a\}$ 与 $\{B_{T_a}=-a\}$。故

$$
\mathbb P(A,B_{T_a}=a)=\mathbb P(A,B_{T_a}=-a).
$$

两事件合并为 $A$（忽略零概率的 $T_a=\infty$），所以每一项均为 $\mathbb P(A)/2$。又 $\mathbb P(B_{T_a}=a)=1/2$，故

$$
\mathbb P(A,B_{T_a}=a)=\mathbb P(A)\mathbb P(B_{T_a}=a).
$$

这证明 $T_a$ 与 $\mathbf1_{\{B_{T_a}=a\}}$ 独立。

**易错点。** 对称性只先给出出口概率为 $1/2$；要证明独立性，必须对任意 $A\in\sigma(T_a)$ 使用同一个反射论证。

## 题 6：条件方差恒定刻画正态分布

**动机。** 条件式说明“和 $X+Y$ 并不改变差 $X-Y$ 的二次波动”。配合独立同分布，这强迫特征函数满足高斯的微分方程。

**符号。** 令 $S=X+Y$、$D=X-Y$，并令 $\phi(t)=\mathbb E[e^{\mathrm itX}]$。

**考点。** 特征函数、条件期望、正态刻画。参考 Lukacs, *Characteristic Functions*, Ch. 6。

题设给出 $\mathbb E[D^2\mid S]=2$。两边乘 $e^{\mathrm itS}$ 后取期望，

$$
\mathbb E[D^2e^{\mathrm itS}]=2\mathbb E[e^{\mathrm itS}]=2\phi(t)^2.
$$

利用 $X,Y$ 独立，且

$$
\mathbb E[Xe^{\mathrm itX}]=\frac{\phi'(t)}{\mathrm i},
\qquad
\mathbb E[X^2e^{\mathrm itX}]=-\phi''(t),
$$

左端展开为

$$
\begin{aligned}
\mathbb E[(X-Y)^2e^{\mathrm it(X+Y)}]
&=-2\phi''(t)\phi(t)+2\phi'(t)^2.
\end{aligned}
$$

所以

$$
-\phi''(t)\phi(t)+\phi'(t)^2=\phi(t)^2.
$$

在 $\phi(t)\ne0$ 的区间上，除以 $\phi(t)^2$，得到

$$
-(\log\phi(t))''=1.
$$

由 $\phi(0)=1$、$\phi'(0)=\mathrm i\mathbb E[X]=0$，两次积分得

$$
\log\phi(t)=-\frac{t^2}{2},
\qquad \phi(t)=e^{-t^2/2}.
$$

该解在所有有限 $t$ 非零，故可由连通延拓覆盖整个实线。它是 $N(0,1)$ 的特征函数，因此 $X\sim N(0,1)$；同分布和独立性给出 $X,Y$ 为独立标准高斯。

**易错点。** 不能只由 $\mathbb E[D^2]=2$ 推出正态性；决定性信息是对整个 $\sigma(S)$ 的条件等式。

## 题 7：均匀端点模型的广义 Bayes 规则

**动机。** 对 $U(0,\theta)$，样本最大值 $M=X_{(n)}$ 包含关于上端点的全部似然信息；平坦先验会给出 Pareto 型后验。

**符号。** $M=\max_iX_i$，且 $X_i\stackrel{\mathrm{iid}}{\sim}U(0,\theta)$。

**考点。** 后验均值、广义 Bayes、相合性。参考 Berger, *Statistical Decision Theory and Bayesian Analysis*, Ch. 4。

似然为

$$
L(\theta;x)=\theta^{-n}\mathbf1_{\{\theta\ge M\}}.
$$

平坦先验 $\pi(\theta)=1$ 下，归一化后验（$n>1$）为

$$
\pi(\theta\mid x)=(n-1)M^{n-1}\theta^{-n}\mathbf1_{\{\theta\ge M\}}.
$$

平方损失下 Bayes 规则是后验均值。对 $n>2$，

$$
\delta_B(x)=\mathbb E[\theta\mid x]
=(n-1)M^{n-1}\int_M^\infty\theta^{1-n}d\theta
=\frac{n-1}{n-2}M.
$$

题目只假定 $n\ge2$，故应补充：当 $n=2$ 时该后验均值发散，平方损失下不存在有限的此类广义 Bayes 规则。

对随样本量增长的一列问题，$M_n\to\theta$ a.s.，且 $(n-1)/(n-2)\to1$，故

$$
\delta_{B,n}=\frac{n-1}{n-2}M_n\longrightarrow\theta\quad\text{a.s.}
$$

所以它一致。

**易错点。** “不适当先验”不表示后验一定没有意义；本题后验可归一化，但 $n=2$ 时其一阶矩不存在。

## 题 8：Gamma 尺度参数的检验与估计

**动机。** 已知形状参数的 Gamma 族是一参数指数族；自然参数 $1/\theta$ 的 MLE 和 Fisher 信息都直接可得，而双侧备择破坏单调似然比所给出的单侧 UMP 结构。

**符号。** 记 $k=2025$，$X_i\sim\operatorname{Gamma}(k,\theta)$，以尺度 $\theta$ 参数化；$S=\sum_iX_i$。

**考点。** 单调似然比、UMP 不存在性、MLE 渐近正态。参考 Lehmann--Romano, *Testing Statistical Hypotheses*, Ch. 3；van der Vaart, *Asymptotic Statistics*, Ch. 5。

似然中与 $\theta$ 有关的部分为

$$
L(\theta)\propto\theta^{-nk}\exp\left(-\frac S\theta\right).
$$

当备择限制为 $\theta>1$ 时，似然比随 $S$ 增大而增大，最强检验拒绝域为 $S$ 大；当备择限制为 $\theta<1$ 时，最强检验拒绝域为 $S$ 小。一个同时对两侧均最强的非平凡检验必须同时采用这两个互斥的单侧结构，因而

$$
H_0:\theta=1\quad\text{vs.}\quad H_1:\theta\ne1
$$

不存在 UMP level $0.05$ 检验。可构造双侧水平检验，但它至多是无偏或似然比意义下的自然选择，不是 UMP。

令 $\eta=1/\theta$。对数似然为

$$
\ell(\eta)=nk\log\eta-\eta S+\text{const}.
$$

求导 $nk/\eta-S=0$，得到

$$
\hat\eta=\widehat{\frac1\theta}=\frac{nk}{S}=\frac{k}{\bar X}.
$$

单个观测对 $\eta$ 的 Fisher 信息为 $I_1(\eta)=k/\eta^2$，因此

$$
\sqrt n(\hat\eta-\eta)\ \Longrightarrow\ N\left(0,\frac{\eta^2}{k}\right)
=N\left(0,\frac{1}{2025\theta^2}\right).
$$

**易错点。** 题中 $\alpha=0.05$ 表示显著性水平；不要和 Gamma 形状参数混淆。

## 题 9：样本相关系数的极限与充分性

**动机。** 相关系数是几个样本矩的光滑函数，因此其极限分布由多元 CLT 加 Delta 方法得到；正态子模型中，似然揭示哪两个二次统计量保留了全部信息。

**符号。** 令 $\mu_X=\mathbb EX$、$\mu_Y=\mathbb EY$，$U=X-\mu_X$、$V=Y-\mu_Y$，$\sigma_X^2=\mathbb EU^2$、$\sigma_Y^2=\mathbb EV^2$，$\rho=\mathbb EUV/(\sigma_X\sigma_Y)$。

**考点。** 多元 CLT、影响函数、因子分解、完全性。参考 van der Vaart, *Asymptotic Statistics*, Ch. 3；Lehmann--Casella, *Theory of Point Estimation*, Ch. 1。

在四阶矩存在时，样本均值、二阶矩和协方差满足联合 CLT。对相关系数泛函作一阶展开，得到影响函数

$$
\psi(X,Y)=\frac{UV-\rho\sigma_X\sigma_Y}{\sigma_X\sigma_Y}
-\frac\rho2\left(\frac{U^2-\sigma_X^2}{\sigma_X^2}
+\frac{V^2-\sigma_Y^2}{\sigma_Y^2}\right).
$$

样本中心化所带来的余项为 $o_p(n^{-1/2})$，所以

$$
\sqrt n(\hat\rho-\rho)
=\frac1{\sqrt n}\sum_{i=1}^n\psi(X_i,Y_i)+o_p(1).
$$

由 CLT，

$$
\sqrt n(\hat\rho-\rho)\Longrightarrow N(0,c),
\qquad c=\mathbb E[\psi(X,Y)^2].
$$

这已按题意以矩形式识别 $c$，无需展开四阶混合矩。

现在假设均值为零、方差为一的二元正态模型。记

$$
A=\sum_{i=1}^n(X_i^2+Y_i^2),\qquad C=\sum_{i=1}^nX_iY_i.
$$

联合似然可写成

$$
L(\rho;x,y)
\propto(1-\rho^2)^{-n/2}
\exp\left\{-\frac{A-2\rho C}{2(1-\rho^2)}\right\}.
$$

因子分解定理说明 $(A,C)$ 充分。对两组样本取似然比；该比对所有 $\rho\in(-1,1)$ 为常数，当且仅当两组的 $A$ 与 $C$ 分别相同，故似然比判别准则给出

$$
T=(A,C)
$$

为最小充分统计量。

它不完全：$A-2n$ 是 $T$ 的非零可测函数，且对每个 $\rho$，

$$
\mathbb E_\rho[A-2n]=0,
$$

因为每个 $X_i,Y_i$ 的边际方差都为 $1$。所以存在非平凡的零均值函数，违反完全性。

**易错点。** $C$ 单独不足以在该模型中充分，因为归一化指数中还出现 $A$；同时，最小充分不意味着完全。

## 题 10：正态尺度的绝对偏差估计

**动机。** 绝对值将正态尺度线性化：$|X|$ 的均值正比于 $\sigma$。但无偏并不自动意味着可容许。

**符号。** $X_i\sim N(0,\sigma^2)$，

$$
W=\frac1n\sum_{i=1}^n|X_i|.
$$

**考点。** 正态绝对矩、CLT、风险函数、可容许性。参考 Lehmann--Casella, *Theory of Point Estimation*, Chs. 1--2。

若 $Z\sim N(0,1)$，则 $\mathbb E|Z|=\sqrt{2/\pi}$、$\mathbb E|Z|^2=1$。所以

$$
\mathbb E[W]=\sigma\sqrt{\frac2\pi},
$$

从而基于 $W$ 的无偏估计量为

$$
\delta_0=\sqrt{\frac\pi2}\,W.
$$

又

$$
\operatorname{var}(|X|)=\sigma^2\left(1-\frac2\pi\right),
$$

故 CLT 给出

$$
\sqrt n(\delta_0-\sigma)
\Longrightarrow N\left(0,\sigma^2\left(\frac\pi2-1\right)\right).
$$

为判断可容许性，比较同类估计量 $\delta_a=aW$。令 $m=\sqrt{2/\pi}$，则

$$
\frac{\mathbb E[W^2]}{\sigma^2}
=A_n=\frac1n+\frac{n-1}{n}m^2.
$$

因此其归一化风险为

$$
\frac{R(\sigma,\delta_a)}{\sigma^2}=a^2A_n-2am+1.
$$

它在

$$
a_*=\frac{m}{A_n}
$$

处唯一最小。由于 $A_n>m^2$，有 $a_*<1/m=\sqrt{\pi/2}$；严格凸二次式说明对每个 $\sigma>0$，

$$
R(\sigma,\delta_{a_*})<R(\sigma,\delta_0).
$$

故无偏估计量 $\delta_0$ 在平方损失下**不可容许**。

**易错点。** 无偏性是一个矩条件，不是最小风险性质；本题中适当收缩 $W$ 同时降低所有 $\sigma$ 的风险。

## 题 11：双参数移位指数分布的 MLE 与非正则极限

**动机。** 支撑集端点 $\alpha$ 未知使模型不正则：样本最小值以 $n$ 而不是 $\sqrt n$ 的速度收敛，因而会产生“正态变量除以指数变量”的非常规极限。

**符号。**

$$
f(x;\lambda,\alpha)=\lambda e^{-\lambda(x-\alpha)}\mathbf1_{\{x\ge\alpha\}},
\qquad \lambda>0.
$$

记 $X_{(1)}=\min_iX_i$，$S=\sum_{i=1}^n(X_i-X_{(1)})$。

**考点。** 含参数支撑的 MLE、指数间隔、联合极限。参考 Cox--Hinkley, *Theoretical Statistics*, Ch. 9；David--Nagaraja, *Order Statistics*, Ch. 2。

当 $\alpha\le X_{(1)}$ 时，似然为

$$
L(\lambda,\alpha)=\lambda^n\exp\{-\lambda\sum_{i=1}^n(X_i-\alpha)\}.
$$

固定 $\lambda$，它随 $\alpha$ 增大而增大，故最大点为

$$
\hat\alpha=X_{(1)}.
$$

代入后，对数似然为 $n\log\lambda-\lambda S$，求导得

$$
\hat\lambda=\frac nS
=\frac{n}{\sum_{i=1}^n(X_i-X_{(1)})}.
$$

写 $X_i=\alpha+E_i$，其中 $E_i\stackrel{\mathrm{iid}}{\sim}\operatorname{Exp}(\lambda)$。指数分布的无记忆性给出：

$$
X_{(1)}-\alpha\sim\operatorname{Exp}(n\lambda),
$$

并且它与

$$
S\sim\operatorname{Gamma}(n-1,\text{rate }\lambda)
$$

独立。因此

$$
n(\hat\alpha-\alpha)\sim\operatorname{Exp}(\lambda)
$$

对每个 $n$ 都成立，而由 Gamma CLT 或 Delta 方法，

$$
\sqrt n(\hat\lambda-\lambda)\Longrightarrow N(0,\lambda^2).
$$

两部分独立，故令 $Z\sim N(0,\lambda^2)$、$E\sim\operatorname{Exp}(\lambda)$ 且独立，则

$$
\frac{\sqrt n(\hat\lambda-\lambda)}{n(\hat\alpha-\alpha)}
\Longrightarrow\frac ZE.
$$

等价地，若 $G\sim N(0,1)$、$H\sim\operatorname{Exp}(1)$ 独立，极限可写为 $\lambda^2G/H$。

**易错点。** 分母不收敛到常数，而是收敛到非退化指数变量；不能直接使用普通 Slutsky 定理把它替换为其均值。

# 2024 秋季 概率统计博资考解答

> [!info] 题源与答案性质
> - 题面已按[官方原卷](../sources/exams/qzc-qe-probability-statistics-2024-fall.pdf)逐页核对，并与 MinerU 的[阅读转录](../transcripts/mineru/qzc-qe-probability-statistics-2024-fall/reading.md)交叉复核。
> - 以下均为自撰、可逐步审阅的参考解，不是官方评分答案。
> - 本文件的数学一律使用 Obsidian 定界符：行内 `$...$`，行间 `$$...$$`。

## 题 1

### (a) 计算 $\mathbb E[S_n^4]$

**动机。** 直接把四次方完全展开，并按一个单项式中出现了几个不同指标分类；独立性随后将期望分解为各阶矩的乘积。

**符号。** 令 $m_r=\mathbb E[U_1^r]=1/(r+1)$，故 $m_1=1/2,m_2=1/3,m_3=1/4,m_4=1/5$。

**推导。** 多项式展开的指标型依次为 $4$、$3+1$、$2+2$、$2+1+1$、$1+1+1+1$，故

$$
\begin{aligned}
\mathbb E[S_n^4]
={}&nm_4+4n(n-1)m_3m_1+3n(n-1)m_2^2\\
&+6n(n-1)(n-2)m_2m_1^2\\
&+n(n-1)(n-2)(n-3)m_1^4.
\end{aligned}
$$

其中第四项的系数为 $12\binom{n-1}{2}=6(n-1)(n-2)$：固定平方项的指标后，其余两个单次指标无序选取，而每个此类单项式的多项式系数是 $12$。代入均匀分布矩得

$$
\boxed{\mathbb E[S_n^4]
=\frac n5+\frac{n(n-1)}2+\frac{n(n-1)}3
+\frac{n(n-1)(n-2)}2
+\frac{n(n-1)(n-2)(n-3)}{16}.}
$$

**结论。** 上式对所有 $n\geq1$ 成立。

**考点与易错点。** 考查独立随机变量和的高阶矩。不要把 $\mathbb E[U_i^2U_j^2]$ 错写成 $\mathbb E[U_i^4]$，也不要遗漏 $2+1+1$ 型单项式。

**教材引用。** Durrett, *Probability: Theory and Examples*, 4th ed., 独立性与矩的基本性质。

### (b) $S_3$ 的分布

**动机。** $S_3$ 是三个独立 $\operatorname{Unif}[0,1]$ 的卷积，即 Irwin--Hall 分布。用截断幂公式可一次写出全部分段。

**推导与结论。** $S_3$ 的密度为

$$
f_{S_3}(s)=
\begin{cases}
\dfrac{s^2}{2},&0\leq s\leq1,\\
\dfrac{s^2-3(s-1)^2}{2},&1\leq s\leq2,\\
\dfrac{(3-s)^2}{2},&2\leq s\leq3,\\
0,&\text{其他 }s.
\end{cases}
$$

等价地，$S_3$ 的支撑为 $[0,3]$，且关于 $3/2$ 对称。

**考点与易错点。** 考查连续变量卷积。中段必须扣去超过上界 $1$ 的部分；不能把三个均匀变量之和误认为均匀分布。

**教材引用。** Durrett, 连续随机变量的卷积公式。

## 题 2

### (a) Delta method

**动机。** 已知 $Y_n$ 在 $a$ 附近的波动量级是 $n^{-1/2}$；可微函数在该点的一阶线性近似决定变换后的极限分布。

**符号。** 可微性给出 $g(y)-g(a)=g'(a)(y-a)+r(y)$，其中 $r(y)/(y-a)\to0$ 当 $y\to a$。

**推导。** 由 $\sqrt n(Y_n-a)\Rightarrow\mathcal N(0,\sigma^2)$ 可知 $Y_n\to a$ 依概率，且 $\sqrt n(Y_n-a)=O_p(1)$。于是

$$
\sqrt n\{g(Y_n)-g(a)\}
=g'(a)\sqrt n(Y_n-a)
+\sqrt n(Y_n-a)\frac{r(Y_n)}{Y_n-a}.
$$

第二项是 $O_p(1)o_p(1)=o_p(1)$。由 Slutsky 定理，

$$
\boxed{\sqrt n\{g(Y_n)-g(a)\}\Rightarrow
\mathcal N\bigl(0,[g'(a)]^2\sigma^2\bigr).}
$$

**考点与易错点。** 必须先说明余项在 $n^{-1/2}$ 尺度下消失；只写泰勒展开而不控制余项不完整。$g'(a)\ne0$ 使一阶项给出非退化正态极限。

**教材引用。** van der Vaart, *Asymptotic Statistics*, Chapter 3；Casella--Berger, 渐近正态性与 Delta method。

### (b) 对二项样本比例取对数

**动机。** 这是 (a) 的直接应用：二项比例 $Z_n/n$ 有 CLT，而 $\log$ 在 $p>0$ 处可微。

**推导。** 二项 CLT 给出

$$
\sqrt n\left(\frac{Z_n}{n}-p\right)
\Rightarrow\mathcal N\bigl(0,p(1-p)\bigr).
$$

取 $g(x)=\log x$，则 $g'(p)=1/p$，所以

$$
\boxed{\sqrt n\left\{\log\left(\frac{Z_n}{n}\right)-\log p\right\}
\Rightarrow\mathcal N\left(0,\frac{1-p}{p}\right).}
$$

严格地说，$Z_n=0$ 时对数未定义；但 $\mathbb P(Z_n=0)=(1-p)^n\to0$，可在该事件任意定义该统计量而不改变弱极限。

**考点与易错点。** 方差不是 $p(1-p)$，还要乘 $[g'(p)]^2=p^{-2}$。忽略 $Z_n=0$ 的定义域问题会留下形式漏洞。

**教材引用。** Casella--Berger, Chapter 5；van der Vaart, Chapter 3。

## 题 3

**动机。** 三个条件都是“指数型尾部”或 sub-exponential 尺度的不同表述。只需证明 $(a)\Rightarrow(b)\Rightarrow(c)\Rightarrow(a)$，并跟踪常数。

### $(a)\Rightarrow(b)$

对非负随机变量 $V$，层析公式给出 $\mathbb E[V^p]=\int_0^\infty pt^{p-1}\mathbb P(V\geq t)\,dt$。令 $V=|X|$，则

$$
\mathbb E|X|^p
\leq2p\int_0^\infty t^{p-1}e^{-t/K_1}\,dt
=2K_1^p p!\leq(2K_1p)^p.
$$

故可取 $K_2=2K_1$。

### $(b)\Rightarrow(c)$

**推导。** 展开指数函数，并用题给 Stirling 下界 $p!\geq e(p/e)^p$：

$$
\begin{aligned}
\mathbb E e^{|X|/K_3}
&=1+\sum_{p=1}^\infty\frac{\mathbb E|X|^p}{K_3^p p!}\\
&\leq1+\sum_{p=1}^\infty\frac{(K_2p)^p}{K_3^p p!}\\
&\leq1+\frac1e\sum_{p=1}^\infty\left(\frac{eK_2}{K_3}\right)^p.
\end{aligned}
$$

取 $K_3=4eK_2$，右端小于 $2$，故 (c) 成立。

### $(c)\Rightarrow(a)$

对 $e^{|X|/K_3}$ 用 Markov 不等式：

$$
\mathbb P(|X|\geq t)
=\mathbb P\left(e^{|X|/K_3}\geq e^{t/K_3}\right)
\leq2e^{-t/K_3}.
$$

故可取 $K_1=K_3$。

**结论。** 三个性质等价，且可按 $K_2\leq2K_1$、$K_3\leq4eK_2$、$K_1\leq K_3$ 选择常数，故它们至多相差绝对常数因子。

**考点与易错点。** 考查尾界、矩界、指数矩的互推。层析公式的系数是 $p$；由矩展开指数函数时必须验证级数收敛并选取足够大的 $K_3$。

**教材引用。** Vershynin, *High-Dimensional Probability*, sub-exponential random variables；Durrett, 矩母函数与 Markov 不等式。

## 题 4

### (a) 无穷 $d$-正则树上的随机游走

**动机。** 只跟踪到初始点 $o$ 的图距离 $R_n=d(X_n,o)$。离开 $o$ 后，这是一维有偏随机游走：向外的邻居有 $d-1$ 个，向内的邻居仅一个。

当 $d=2$ 时，$\mathbb T_2$ 同构于整数线 $\mathbb Z$，简单对称随机游走常返。

现设 $d\geq3$，从距离 $i\geq1$ 出发，令 $h_i$ 为最终打到 $0$ 的概率。则

$$
h_i=\frac1d h_{i-1}+\frac{d-1}{d}h_{i+1},\qquad h_0=1,
$$

且有界解为

$$
h_i=\left(\frac1{d-1}\right)^i.
$$

特别地，从根走一步后回根的概率为 $h_1=1/(d-1)<1$，故根不是常返态，游走暂留。

**结论。** $X_n$ 在 $d=2$ 时常返，在每个 $d\geq3$ 时暂留。

**考点与易错点。** 图的“节点数指数增长”本身不是证明；应计算返回概率或构造电网络。解差分方程时要排除发散的根 $(d-1)^i$。

**教材引用。** Norris, *Markov Chains*, recurrence/transience；Lyons--Peres, *Probability on Trees and Networks*。

### (b) $b$-叉树上的随机游走

**推导。** 若 $b=1$，树是一条从根开始的半无限直线，根处反射的一维对称游走常返。若 $b\geq2$，对非根节点，到根的概率为 $1/(b+1)$，到子节点的总概率为 $b/(b+1)$。与 (a) 中 $d=b+1$ 的距离链完全相同，因此从距离 $1$ 回根的概率为

$$
\frac{1/(b+1)}{b/(b+1)}=\frac1b<1.
$$

**结论。** $Y_n$ 在 $b=1$ 时常返，在每个 $b\geq2$ 时暂留。

**考点与易错点。** 根的度数为 $b$，非根节点的度数为 $b+1$；不能把整棵 $b$-叉树误称为 $b$-正则树。

**教材引用。** 同 (a)。

## 题 5

### (a) $M_n-\log n$ 的几乎处处收敛

**动机。** 将每个指数变量拆成均值 $1$ 与中心化部分；后者带有可求和方差，前者正好给出调和和。

令 $H_n=\sum_{k=1}^n1/k$。则

$$
M_n-\log n
=\sum_{k=1}^n\frac{X_k-1}{k}+H_n-\log n.
$$

由于 $\operatorname{Var}[(X_k-1)/k]=1/k^2$ 且 $\sum_{k\geq1}k^{-2}<\infty$，独立中心化级数 $\sum_{k\geq1}(X_k-1)/k$ 几乎处处收敛（事实上也在 $L^2$ 收敛）。又 $H_n-\log n\to\gamma$，其中 $\gamma$ 是 Euler 常数。因此

$$
\boxed{M_n-\log n\ \longrightarrow\ Y:=\gamma+\sum_{k=1}^\infty\frac{X_k-1}{k}\quad\text{a.s.}}
$$

**考点与易错点。** 不能仅由 $\mathbb E[M_n]\sim\log n$ 推出几乎处处收敛；关键是中心化后方差可和。

**教材引用。** Durrett, 独立随机变量级数与 Kolmogorov 收敛准则。

### (b) $L^1$ 收敛

**动机。** (a) 已给出几乎处处极限，余下只需一致可积性。指数分布的矩母函数可精确控制高阶矩。

令

$$
A_n=\frac{e^{pM_n}}{n^p}=e^{p(M_n-\log n)}.
$$

由 (a)，$A_n\to Z:=e^{pY}$ 几乎处处。选择 $q>1$ 使 $pq<1$。因 $\mathbb E[e^{sX_1}]=(1-s)^{-1}$ 对 $s<1$，

$$
\mathbb E[A_n^q]
=n^{-pq}\prod_{k=1}^n\left(1-\frac{pq}{k}\right)^{-1}.
$$

该乘积与常数倍 $n^{pq}$ 同阶，例如可由 Gamma 函数乘积公式或对数展开得到；故 $\sup_n\mathbb E[A_n^q]<\infty$。于是 $(A_n)$ 一致可积。Vitali 收敛定理给出

$$
\boxed{\frac{e^{pM_n}}{n^p}\longrightarrow e^{pY}\quad\text{in }L^1.}
$$

**考点与易错点。** 几乎处处收敛本身不推出 $L^1$ 收敛；条件 $p<1$ 正是使某个 $q>1$ 满足 $pq<1$ 的原因。

**教材引用。** Durrett, 一致可积性、Vitali 收敛及 Gamma 分布矩母函数。

## 题 6

### (a) 条件于未碰到零的 Brownian motion

**动机。** 反射原理将“路径在 $[0,t]$ 内碰到零”的密度，变为从 $-x$ 出发到终点的无条件热核密度。

记

$$
\phi_t(u)=\frac1{\sqrt{2\pi t}}e^{-u^2/(2t)},
\qquad \tau_0=\inf\{s\geq0:X_s=0\}.
$$

对 $y>0$，杀死于零的转移密度为

$$
\mathbb P_x(X_t\in dy,\tau_0>t)
=\bigl\{\phi_t(y-x)-\phi_t(y+x)\bigr\}\,dy.
$$

积分得生存概率 $\mathbb P_x(\tau_0>t)=2\Phi(x/\sqrt t)-1$。因此

$$
\boxed{
\mathbb P_x(X_t\in[a,b]\mid\tau_0>t)
=\frac{\Phi\!\left(\frac{b-x}{\sqrt t}\right)-\Phi\!\left(\frac{a-x}{\sqrt t}\right)-\Phi\!\left(\frac{b+x}{\sqrt t}\right)+\Phi\!\left(\frac{a+x}{\sqrt t}\right)}{2\Phi\!\left(\frac{x}{\sqrt t}\right)-1}.}
$$

**考点与易错点。** 条件概率的分子是“未碰零且终点落入区间”，不可只用无条件正态分布。反射项是 $\phi_t(y+x)$，符号为减号。

**教材引用。** Karatzas--Shreve, *Brownian Motion and Stochastic Calculus*, reflection principle。

### (b) Brownian bridge 与零边界一维 GFF

**动机。** 两个过程都是中心高斯过程。中心高斯过程的所有有限维分布由协方差函数唯一决定，因此只需比对协方差。

对 $0\leq s,t\leq1$，高斯条件协方差公式给出

$$
\begin{aligned}
\operatorname{Cov}(W_t,W_s)
&=\operatorname{Cov}(B_t,B_s)
-\frac{\operatorname{Cov}(B_t,B_1)\operatorname{Cov}(B_s,B_1)}{\operatorname{Var}(B_1)}\\
&=\min(s,t)-st.
\end{aligned}
$$

另一方面，固定 $s$，函数

$$
G(t,s)=\min(t,s)-ts
=\begin{cases}t(1-s),&t\leq s,\\s(1-t),&t\geq s\end{cases}
$$

在端点为零、在 $t=s$ 连续，其一阶导数的跳跃为 $-1$；分部积分即得题设的 Green 函数恒等式。因此 $G(t,s)=\operatorname{Cov}(W_t,W_s)$。

**结论。** $W$ 与 $h$ 具有相同均值和协方差函数，故对任意有限个时刻，其联合高斯分布相同；这正是题目要求的过程同分布。

**考点与易错点。** “同协方差”只足以推出高斯过程同分布，必须点出二者均为中心高斯过程。Green 函数的变量是 $t$，在 $t=s$ 处不是二阶可微。

**教材引用。** Durrett, Gaussian processes；Sheffield, *Gaussian Free Fields for Mathematicians*, 一维 Green 函数观点。

## 题 7

**动机。** 丢失原始 $X_i$ 后，仍保留了符号信息。$Y_i$ 是成功概率随 $\mu$ 单调变化的 Bernoulli 观测，充分统计量为成功个数 $S=\sum_iY_i$。

令 $q(\mu)=\mathbb P_\mu(X_i<0)=\Phi(-\mu)$，则 $S\sim\operatorname{Bin}(n,q(\mu))$，且 $q(\mu)$ 严格递减。

### (a) MLE

似然函数为 $L(\mu)=q(\mu)^S[1-q(\mu)]^{n-S}$。Bernoulli 似然对 $q$ 的 MLE 是 $\widehat q=S/n$，故

$$
\boxed{\widehat\mu=-\Phi^{-1}(S/n).}
$$

若 $S=0$，上式解释为 $\widehat\mu=+\infty$；若 $S=n$，解释为 $-\infty$。这是参数空间为实数时的扩展实数 MLE，反映了完全分离而非计算错误。

### (b) 大小为 $\alpha$ 的 UMP 检验

备择 $\mu>\mu_0$ 等价于 $q(\mu)<q_0:=\Phi(-\mu_0)$。二项族对 $S$ 有单调似然比，故由 Karlin--Rubin 定理，拒绝域应取小的 $S$。选取整数 $k$ 与 $0\leq\gamma\leq1$，使

$$
\mathbb P_{\mu_0}(S\leq k-1)+\gamma\mathbb P_{\mu_0}(S=k)=\alpha.
$$

检验为：当 $S<k$ 拒绝，当 $S=k$ 以概率 $\gamma$ 拒绝，否则不拒绝。其在 $\mu=\mu_0$ 的大小恰为 $\alpha$；单调性保证在整个 $\mu\leq\mu_0$ 上大小不超过 $\alpha$，且为 UMP。

### (c) $(1-\alpha)$ 置信区间

先对二项参数 $q$ 构造精确置信区间 $[q_L(S),q_U(S)]$，例如 Clopper--Pearson 等尾区间，使覆盖率至少 $1-\alpha$。映射 $\mu=-\Phi^{-1}(q)$ 严格递减，故反演得到

$$
\boxed{\left[-\Phi^{-1}(q_U(S)),\ -\Phi^{-1}(q_L(S))\right].}
$$

**考点与易错点。** $Y_i=1$ 表示 $X_i<0$，所以较大的 $\mu$ 对应较小的 $S$，检验方向很容易写反。离散二项分布一般需随机化才能恰好达到大小 $\alpha$。

**教材引用。** Casella--Berger, Chapters 7--9，MLE、单调似然比、检验反演与置信区间。

## 题 8

### (a) $\theta=b^T\beta$ 的 BLUE

**动机。** 先把 OLS 写成线性估计量，再将任意线性无偏估计量与它的差分解为垂直于设计空间的部分。

设 $Z$ 满列秩，令

$$
c_0=Z(Z^TZ)^{-1}b,
\qquad \widehat\theta=b^T\widehat\beta=c_0^TY.
$$

由于 $\mathbb E[Y]=Z\beta$、$\operatorname{Var}(Y)=\sigma^2I_n$，

$$
\mathbb E[\widehat\theta]=b^T\beta=\theta,
\qquad
\operatorname{Var}(\widehat\theta)=\sigma^2b^T(Z^TZ)^{-1}b.
$$

现在令 $c^TY$ 是任一线性无偏估计量。对每个 $\beta$ 无偏等价于 $Z^Tc=b$。所以写 $c=c_0+d$ 后有 $Z^Td=0$；而 $c_0\in\operatorname{col}(Z)$，故 $c_0^Td=0$。因此

$$
\operatorname{Var}(c^TY)
=\sigma^2\|c\|^2
=\sigma^2\bigl(\|c_0\|^2+\|d\|^2\bigr)
\geq\operatorname{Var}(\widehat\theta).
$$

**结论。** $\widehat\theta$ 是所有线性无偏估计量中方差最小者，即 $\theta$ 的 BLUE。

**考点与易错点。** 无偏约束是 $Z^Tc=b$，不是 $Zc=b$。Gauss--Markov 定理只断言在线性无偏类中最优，并不需要误差正态。

**教材引用。** Seber--Lee, *Linear Regression Analysis*；Casella--Berger, 线性模型与 Gauss--Markov 定理。

### (b) Fisher 信息矩阵

正态误差下，忽略与 $\beta$ 无关的常数，

$$
\ell(\beta)=-\frac1{2\sigma^2}(Y-Z\beta)^T(Y-Z\beta).
$$

故

$$
-\frac{\partial^2\ell}{\partial\beta\,\partial\beta^T}
=\frac1{\sigma^2}Z^TZ,
\qquad
\boxed{I(\beta)=\frac1{\sigma^2}Z^TZ.}
$$

**考点与易错点。** 信息矩阵是 $d\times d$；已知 $\sigma^2$ 时没有额外的方差参数行列。

**教材引用。** Casella--Berger, Fisher information；Seber--Lee, Gaussian linear model。

## 题 9

令 $p_t=\mathbb P(X_1\leq t)=t/\theta$。

### (a) 两个估计量的渐近分布

**动机。** $F_n(t)$ 是 Bernoulli 样本均值；$T_n(t)$ 是样本均值经过光滑函数 $g(x)=t/(2x)$ 的变换。

对 $F_n(t)$，CLT 给出

$$
\boxed{\sqrt n\{F_n(t)-t/\theta\}
\Rightarrow\mathcal N\left(0,\frac t\theta\left(1-\frac t\theta\right)\right).}
$$

又 $\mathbb E[X_1]=\theta/2$、$\operatorname{Var}(X_1)=\theta^2/12$，且 $g'(\theta/2)=-2t/\theta^2$。Delta method 给出

$$
\boxed{\sqrt n\{T_n(t)-t/\theta\}
\Rightarrow\mathcal N\left(0,\frac{t^2}{3\theta^2}\right).}
$$

**考点与易错点。** 两者估计的是同一个 $t/\theta$。$T_n(t)$ 的极限方差应同时包含 $g'$ 的平方和 $\bar X$ 的方差。

**教材引用。** Casella--Berger, CLT 与 Delta method。

### (b) 渐近方差比较

令 $x=t/\theta\in(0,1)$。$F_n(t)$ 的渐近方差较小当且仅当

$$
x(1-x)<\frac{x^2}{3}
\quad\Longleftrightarrow\quad x>\frac34.
$$

**结论。**

$$
\boxed{F_n(t)\text{ 的渐近方差较小当且仅当 }t>\frac{3\theta}{4}.}
$$

**易错点。** $t=3\theta/4$ 时两者相等，不应写入严格“小于”的范围。

### (c) 稀有事件的计数

**动机。** 此时阈值随 $n$ 改变，不能直接套 (a) 的固定 $t$ CLT。

在 $\theta=1$ 时，令

$$
N_n=\sum_{i=1}^n\mathbf1\{X_i\leq n^{-1/2}\}
\sim\operatorname{Bin}(n,n^{-1/2}).
$$

题中统计量正是 $N_n-\sqrt n$。其均值为 $0$，方差为 $\sqrt n-1$，因此未经缩放时不收敛到任何有限的非退化分布。正确的标准化渐近分布是

$$
\boxed{\frac{nF_n(n^{-1/2})-\sqrt n}{\sqrt{\sqrt n-1}}
\Rightarrow\mathcal N(0,1).}
$$

等价地，分母可替换为 $n^{1/4}$。故原统计量的波动阶为 $n^{1/4}$；题面若要求其“asymptotic distribution”，应明确说明这一自然标准化。

**考点与易错点。** 这是三角阵列二项 CLT；Poisson 近似不适用作极限，因为均值 $\sqrt n\to\infty$。

**教材引用。** Durrett, triangular-array CLT；Casella--Berger, binomial asymptotics。

## 题 10

令 $\nu=n-1$，并采用 $S^2=(n-1)^{-1}\sum_i(X_i-\bar X)^2$。

### (a) $\bar X$ 与 $S^2$ 的独立性

**动机。** 正态样本正交分解后，均值方向与残差子空间是独立高斯分量。

令 $X=(X_1,\ldots,X_n)^T$，取正交矩阵 $Q$ 的第一行是 $n^{-1/2}(1,\ldots,1)$。则 $QX$ 为协方差矩阵 $\sigma^2I_n$ 的高斯向量，故其坐标独立；第一坐标是 $\sqrt n\bar X$，其余坐标平方和为 $(n-1)S^2$。因此

$$
\boxed{\bar X\ \perp\ S^2,\qquad \frac{(n-1)S^2}{\sigma^2}\sim\chi^2_{n-1}.}
$$

**考点与易错点。** 此独立性是正态族的特殊性质，不能在一般 iid 样本中使用。

**教材引用。** Casella--Berger, normal sample theory；Lehmann--Casella, normal family。

### (b) $\mu/\sigma$ 的 UMVUE

**动机。** 由独立性，$\bar X/S$ 的期望可分解为 $\mu\,\mathbb E(1/S)$；用常数校正即可无偏。

当 $n\geq3$，由 $V=\nu S^2/\sigma^2\sim\chi^2_\nu$，

$$
\mathbb E\left[\frac1S\right]
=\frac1\sigma\sqrt{\frac\nu2}\,
\frac{\Gamma((\nu-1)/2)}{\Gamma(\nu/2)}.
$$

所以

$$
\boxed{
\delta(X)=
\sqrt{\frac2{n-1}}\,
\frac{\Gamma((n-1)/2)}{\Gamma((n-2)/2)}\,
\frac{\bar X}{S}}
$$

满足 $\mathbb E[\delta]=\mu/\sigma$。$(\bar X,S^2)$ 是正态两参数族的完全充分统计量；将参数空间限制为 $\mu\geq0$ 不破坏这里的完备性结论（可由关于 $\mu$ 的解析延拓得到）。故由 Lehmann--Scheffe 定理，$\delta$ 是 UMVUE。

当 $n=2$，$\mathbb E(1/S)=\infty$，上述候选量没有有限期望；标准正态族无偏估计存在性判别表明此时不存在具有有限一阶矩的 $\mu/\sigma$ 的无偏估计量，因而没有通常意义下的 UMVUE。

**考点与易错点。** 不能漏掉 Gamma 比值校正；$\bar X/S$ 本身不是无偏的。$n=2$ 是自由度为 $1$ 的边界情形，必须单独处理。

**教材引用。** Lehmann--Casella, *Theory of Point Estimation*, complete sufficiency and Lehmann--Scheffe；Casella--Berger, normal-family completeness。

### (c) $\bar X$ 的可容许性

**动机。** 参数受限于 $\mu\geq0$，可把任何估计值投影回参数空间。投影在平方损失下逐点不增误差。

定义 $\delta_+(X)=\max\{\bar X,0\}$。对每个 $\mu\geq0$ 和每个实数 $x$，

$$
|\max\{x,0\}-\mu|^2\leq|x-\mu|^2,
$$

且在 $x<0$ 时严格成立。因为 $\mathbb P_\mu(\bar X<0)>0$ 对所有有限 $\mu\geq0$ 成立，

$$
R(\mu,\delta_+)<R(\mu,\bar X).
$$

**结论。**

$$
\boxed{\bar X\text{ 在平方误差损失下不可容许。}}
$$

**考点与易错点。** 此支配论证不依赖 $\sigma$ 已知；关键是参数空间有凸约束 $[0,\infty)$。

**教材引用。** Lehmann--Casella, admissibility and restricted parameter spaces。

## 题 11

**动机。** 参数符号决定支撑区间：$\theta>0$ 时为 $[\theta,2\theta]$，$\theta<0$ 时为 $[\theta,0]$。样本几乎处处全正或全负，因此先按符号分情形是最清楚的路线。

### (a) 矩估计

若 $\theta>0$，$\mathbb E[X]=3\theta/2$；若 $\theta<0$，$\mathbb E[X]=\theta/2$。样本均值与 $\theta$ 同号，故矩估计为

$$
\boxed{
\widehat\theta_{\rm MM}=
\begin{cases}
\dfrac{2\bar X}{3},&\bar X>0,\\
2\bar X,&\bar X<0.
\end{cases}}
$$

事件 $\bar X=0$ 的概率为零。

### (b) MLE

记 $X_{(1)}=\min_iX_i$、$X_{(n)}=\max_iX_i$。

当样本全正时，必有 $\theta>0$，似然正比于 $\theta^{-n}$，可行约束为

$$
\frac{X_{(n)}}2\leq\theta\leq X_{(1)}.
$$

故最大化点是左端点。当样本全负时，必有 $\theta<0$，似然正比于 $|\theta|^{-n}$，可行约束为 $\theta\leq X_{(1)}<0$，最大化点为 $X_{(1)}$。因此

$$
\boxed{
\widehat\theta_{\rm MLE}=
\begin{cases}
X_{(n)}/2,&X_{(1)}>0,\\
X_{(1)},&X_{(n)}<0.
\end{cases}}
$$

### (c) 一致性

若 $\theta>0$，则 $X_{(n)}\to2\theta$ 几乎处处；若 $\theta<0$，则 $X_{(1)}\to\theta$ 几乎处处。于是两种情形下都有

$$
\boxed{\widehat\theta_{\rm MLE}\to\theta\quad\text{a.s.，因而也依概率。}}
$$

**考点与易错点。** 支撑依赖参数时，似然不仅有密度高度，还必须保留指示函数给出的可行域。对 $\theta>0$，MLE 由样本最大值而非最小值决定；对 $\theta<0$ 则相反。

**教材引用。** Casella--Berger, parameter-dependent support and order statistics；Lehmann--Casella, likelihood analysis。

## 统一教材索引

- R. Durrett, *Probability: Theory and Examples*, 4th ed., Cambridge University Press, 2010：弱收敛、独立级数、Brownian motion 与高斯过程。
- G. Casella and R. L. Berger, *Statistical Inference*, 2nd ed., Duxbury, 2002：MLE、检验、置信区间、线性模型与正态样本理论。
- E. L. Lehmann and G. Casella, *Theory of Point Estimation*, 2nd ed., Springer, 1998：完备充分性、UMVUE 与可容许性。
- R. Vershynin, *High-Dimensional Probability*, Cambridge University Press, 2018：指数尾界、矩界与指数矩的等价刻画。

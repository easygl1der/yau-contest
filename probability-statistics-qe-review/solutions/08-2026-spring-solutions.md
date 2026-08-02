# 2026 春季概率统计博资考解答

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-probability-statistics-2026-spring.pdf)，第 1 页，题 1。
> - 本文为基于官方题面撰写的教学性参考解；未发现随原卷一并公开的官方评分答案。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：高斯向量的指数倾斜

### 问题与思路

在原测度 $\mathbb{P}$ 下，随机向量 $X\in\mathbb{R}^n$ 服从均值 $\boldsymbol{\mu}$、协方差矩阵 $V$ 的高斯分布。新测度 $\mathbb{Q}$ 由

$$
\frac{\mathrm{d}\mathbb{Q}}{\mathrm{d}\mathbb{P}}
=\frac{\exp(\boldsymbol{\alpha}^{\mathsf{T}}X)}
{\mathbb{E}_{\mathbb{P}}[\exp(\boldsymbol{\alpha}^{\mathsf{T}}X)]}
$$

定义，其中 $\boldsymbol{\alpha}\in\mathbb{R}^n$ 是给定向量。分母的作用是把右侧正规化为均值为 $1$ 的 Radon--Nikodym 导数。

目标不是重新积分高斯密度。更稳妥的方式是计算 $\mathbb{Q}$ 下的矩母函数（moment generating function, MGF）；若它仍是高斯 MGF，就同时读出了均值与协方差。

### 第一步：原测度下的 MGF

任取 $t\in\mathbb{R}^n$。高斯向量的 MGF 是

$$
M_{\mathbb{P}}(t)
=\mathbb{E}_{\mathbb{P}}\left[\exp(t^{\mathsf{T}}X)\right]
=\exp\left(t^{\mathsf{T}}\boldsymbol{\mu}+\frac12t^{\mathsf{T}}Vt\right).
$$

特别地，令 $t=\boldsymbol{\alpha}$，得到

$$
\mathbb{E}_{\mathbb{P}}\left[\exp(\boldsymbol{\alpha}^{\mathsf{T}}X)\right]
=\exp\left(\boldsymbol{\alpha}^{\mathsf{T}}\boldsymbol{\mu}
+\frac12\boldsymbol{\alpha}^{\mathsf{T}}V\boldsymbol{\alpha}\right).
$$

它有限，故 $\mathbb{Q}$ 的定义有效。

### 第二步：把 $\mathbb{Q}$ 下的期望写回 $\mathbb{P}$

根据 Radon--Nikodym 导数，对于任意可积函数 $g$，

$$
\mathbb{E}_{\mathbb{Q}}[g(X)]
=\mathbb{E}_{\mathbb{P}}\left[
g(X)\frac{\mathrm{d}\mathbb{Q}}{\mathrm{d}\mathbb{P}}
\right].
$$

取 $g(X)=\exp(t^{\mathsf{T}}X)$，便有

$$
M_{\mathbb{Q}}(t)
=\frac{\mathbb{E}_{\mathbb{P}}
\left[\exp((t+\boldsymbol{\alpha})^{\mathsf{T}}X)\right]}
{\mathbb{E}_{\mathbb{P}}
\left[\exp(\boldsymbol{\alpha}^{\mathsf{T}}X)\right]}.
$$

把上一步的高斯 MGF 代入分子和分母，

$$
M_{\mathbb{Q}}(t)
=\exp\left(
(t+\boldsymbol{\alpha})^{\mathsf{T}}\boldsymbol{\mu}
+\frac12(t+\boldsymbol{\alpha})^{\mathsf{T}}V(t+\boldsymbol{\alpha})
-\boldsymbol{\alpha}^{\mathsf{T}}\boldsymbol{\mu}
-\frac12\boldsymbol{\alpha}^{\mathsf{T}}V\boldsymbol{\alpha}
\right).
$$

展开中间的二次型。由于协方差矩阵 $V$ 对称，

$$
(t+\boldsymbol{\alpha})^{\mathsf{T}}V(t+\boldsymbol{\alpha})
=t^{\mathsf{T}}Vt+2t^{\mathsf{T}}V\boldsymbol{\alpha}
+\boldsymbol{\alpha}^{\mathsf{T}}V\boldsymbol{\alpha}.
$$

因此

$$
M_{\mathbb{Q}}(t)
=\exp\left(
t^{\mathsf{T}}(\boldsymbol{\mu}+V\boldsymbol{\alpha})
+\frac12t^{\mathsf{T}}Vt
\right).
$$

### 结论

最后一式正是均值 $\boldsymbol{\mu}+V\boldsymbol{\alpha}$、协方差 $V$ 的高斯 MGF。因此

$$
X\sim\mathcal{N}(\boldsymbol{\mu}+V\boldsymbol{\alpha},V)
\quad\text{under }\mathbb{Q}.
$$

指数倾斜只平移均值，并不改变协方差。这是 importance sampling、指数族和 Cameron--Martin 型测度变换的有限维原型。

### 易错点

- 不能把 $\mathbb{Q}$ 下的均值写成 $\boldsymbol{\mu}+\boldsymbol{\alpha}$；位移必须是 $V\boldsymbol{\alpha}$。
- 分母不可省略，否则定义的不是概率测度。
- 二次型展开中的两个交叉项合并为 $2t^{\mathsf{T}}V\boldsymbol{\alpha}$ 使用了 $V=V^{\mathsf{T}}$。
+

## 题 2：三角阵列中心极限定理

**动机与符号。** 先计算方差，而不是直接以总方差标准化。$X_j$ 对称，故 $\mathbb E X_j=0$，并且

$$
\operatorname{Var}(X_j)=\frac{j^2}{3}+\frac{j^2}{3}=\frac{2j^2}{3}.
$$

其中第一项来自罕见的 $\pm j^2$ 跳跃。令常规部分为 $Y_j=X_jI_{\{|X_j|\leq j\}}$，则

$$
\operatorname{Var}(Y_j)=\frac{j^2}{3},\qquad
b_n^2=\sum_{j=1}^n\operatorname{Var}(Y_j)
=\frac16n(n+1)(2n+1).
$$

因 $\max_{j\leq n}|Y_j|/b_n\leq n/b_n\to0$，$Y_j$ 满足 Lindeberg 条件，故 $\sum_{j\leq n}Y_j/b_n\Rightarrow N(0,1)$。

剩余项 $R_n=\sum_jX_jI_{\{|X_j|=j^2\}}$ 满足：对任意 $\varepsilon>0$，大于 $\varepsilon b_n$ 的跳跃只可能来自 $j\gtrsim n^{3/4}$，其总概率至多

$$
\sum_{j\geq c n^{3/4}}\frac{1}{3j^2}=O(n^{-3/4})\to0.
$$

其余稀有跳跃经 Chebyshev 不等式也有 $R_n/b_n\to0$ 依概率。因此由 Slutsky 定理，

$$
\frac{S_n}{b_n}\Rightarrow N(0,1).
$$

**结论。** 可取 $b_n=\sqrt{n(n+1)(2n+1)/6}$。**易错点：** 不能用全部方差标准化；那会把概率上消失的巨大跳跃误当作有效高斯方差。[Billingsley, Ch. 27]

## 题 3：随机配对的环数

**动机与符号。** 还剩 $m$ 条未闭合链时有 $2m$ 个自由端。下一次随机配对恰把同一条链的两端相连的概率为

$$
\frac{m}{\binom{2m}{2}}=\frac1{2m-1}.
$$

令 $I_m$ 为此时产生一个新环的指标变量。每次操作后未闭合链数减一，故总环数 $L=\sum_{m=1}^{100}I_m$。线性期望给出

$$
\mathbb E L=\sum_{m=1}^{100}\frac1{2m-1}
=H_{200}-\frac12H_{100}.
$$

**结论。** 上式即所求期望。**易错点：** $I_m$ 不必独立，线性期望仍然可用。[Grimmett--Stirzaker, Ch. 6]

## 题 4：指数 Brownian 泛函

令 $t=T^2s$。Brownian 缩放性给出 $B_{T^2s}\overset{d}=TB_s$，因此

$$
\frac1T\log\int_0^{T^2}e^{B_t}dt
\overset{d}=\frac{2\log T}{T}
+\frac1T\log\int_0^1e^{TB_s}ds.
$$

对连续函数 $g$，Laplace 原理为 $T^{-1}\log\int_0^1e^{Tg(s)}ds\to\sup_sg(s)$；它可由最大点邻域的下界和 $e^{T\sup g}$ 的上界直接证明。故极限为 $\sup_{0\leq s\leq1}B_s$。反射原理给出

$$
\sup_{0\leq s\leq1}B_s\overset{d}=|Z|,\qquad Z\sim N(0,1).
$$

**结论。**

$$
\left[\int_0^{T^2}e^{B_t}dt\right]^{1/T}\Rightarrow e^{|Z|}.
$$

**易错点：** 积分时间缩放带来 $T^2$，但其对数除以 $T$ 后消失。[Karatzas--Shreve, Ch. 3]

## 题 5：Galton--Watson 过程

**符号。** 后代 pgf 为 $f(s)=\mathbb E s^X$，均值为 $m=f'(1)$。条件独立给出

$$
\mathbb E[Z_{n+1}\mid\mathcal F_n]=mZ_n,\qquad
\mathbb E Z_n=m^n,
$$

以及

$$
\mathbb E[s^{Z_{n+1}}\mid\mathcal F_n]=f(s)^{Z_n},
\qquad
\mathbb E s^{Z_n}=f^{\circ n}(s).
$$

$f$ 凸，$f(1)=1$，且题设排除了退化线性情形。因此 $f(s)=s$ 在 $[0,1]$ 中有一个或两个解；最小解记作 $q$。由于 $\{Z_n=0\}$ 递增，

$$
\mathbb P(\tau<\infty)=\lim_n\mathbb P(Z_n=0)
=\lim_nf^{\circ n}(0)=q.
$$

更具体地，$m\leq1$ 时 $q=1$，$m>1$ 时 $q\in(0,1)$。

**易错点：** $f^{\circ n}$ 是函数复合，不是幂。[Athreya--Ney, Ch. I]

## 题 6：继承性质与渗流阈值

设 $r=\mathbb P(T\notin A)$。继承性和分枝独立性意味着：若根树不具备 $A$，其子树中必须有不具备 $A$ 的部分；结合所有有限树具备 $A$，可推出 $r\leq f(r)$。题给提示说明满足 $s\leq f(s)$ 的 $s$ 只能落在 $[0,q]\cup\{1\}$。在非灭绝条件下，若 $A$ 的条件概率介于 $0$ 与 $1$，则会导出一个位于 $(q,1)$ 的此类 $r$，矛盾。因此

$$
\mathbb P(A\mid |T|=\infty)\in\{0,1\}.
$$

对密度 $p$ 的边渗流，每名原始子代独立以概率 $p$ 被保留，故开放簇是后代均值 $pm$ 的 Galton--Watson 过程。它存活当且仅当 $pm>1$。上述零一律将此退火结论升级为在非灭绝树上几乎必然的淬火结论：

$$
p_c(T)=\frac1m\quad\text{a.s. on }\{|T|=\infty\}.
$$

**易错点：** 条件在原树非灭绝上；不应把随机树的淬火概率与无条件概率混为一谈。[Lyons--Peres, Ch. 5]

## 题 7：单调似然比与 UMP 检验

令 $Y_i=\sqrt{X_i}$。变量变换显示 $Y_i\sim\operatorname{Exp}(\theta)$，故充分统计量为

$$
T=\sum_{i=1}^n\sqrt{X_i},
\qquad
L(\theta;x)\propto\theta^{-n}e^{-T/\theta}.
$$

当 $\theta_2>\theta_1$ 时，$L(\theta_2;x)/L(\theta_1;x)$ 随 $T$ 增大而增大，故在 $T$ 中有 MLR。对左侧备择，Karlin--Rubin 定理给出拒绝小 $T$ 的 UMP 检验。原假设下最不利边界为 $\theta=1$，且

$$
2T\sim\chi^2_{2n}.
$$

**结论。** 拒绝域为

$$
\left\{2\sum_{i=1}^n\sqrt{X_i}\leq\chi^2_{2n,\alpha}\right\}.
$$

**易错点：** 尺度参数越小，$T$ 越小。[Lehmann--Romano, Ch. 4]

## 题 8：离散分布的样本分位数

对 Bernoulli$(\theta)$，$F(0)=1-\theta$、$F(1)=1$，因此

$$
\xi_p=\begin{cases}0,&p\leq1-\theta,\\1,&p>1-\theta.\end{cases}
$$

若 $p\ne1-\theta$，大数定律使 $F_n(0)$ 最终以高概率位于 $p$ 的正确一侧，故 $\hat\xi_p\to\xi_p$。但 $p=1-\theta$ 时，

$$
\mathbb P(\hat\xi_p=0)=\mathbb P(F_n(0)\geq1-\theta)\to\frac12
$$

（非退化 CLT），故不收敛于 $0$。

一般非退化离散分布也不可能对所有 $p$ 一致成立：取任一有正质量的原子 $x$，令 $p=F(x)$；经验 CDF 在其均值两侧的波动使 $\mathbb P(F_n(x)\geq p)$ 不趋于 $1$，从而分位数在该 $p$ 失效。

**易错点：** Glivenko--Cantelli 不自动推出跳点处的分位数一致性。[van der Vaart, Sec. 21]

## 题 9：两点先验的 Bayes 与 minimax

Bayes 公式给出

$$
\mathbb P(\mu=1\mid Y=y)=\frac{e^{-(y-1)^2/2}}
{e^{-(y-1)^2/2}+e^{-(y+1)^2/2}}
=\frac1{1+e^{-2y}}.
$$

在动作集 $\{-1,1\}$ 与绝对损失下，后验风险较小者是后验概率较大的值，故

$$
\delta(y)=\begin{cases}1,&y\geq0,\\-1,&y<0.\end{cases}
$$

其在 $\mu=1$ 和 $\mu=-1$ 的风险都为 $\Phi(-1)$。均匀先验下的 Bayes 风险亦为 $\Phi(-1)$，任何规则的最大风险至少为其 Bayes 风险；本规则达到这个下界，故为 minimax。

**易错点：** 平局 $y=0$ 的选择不影响风险。[Berger, Ch. 4]

## 题 10：Poisson 的 UMVUE 与 MLE

令 $T=\sum_iX_i\sim\operatorname{Poisson}(n\sqrt\lambda)$。Poisson 阶乘矩满足 $\mathbb E[T(T-1)]=(n\sqrt\lambda)^2$，故

$$
\widetilde\lambda=\frac{T(T-1)}{n^2}
$$

无偏，且 $T$ 对 $\sqrt\lambda$ 完备充分，故由 Lehmann--Scheffe 定理它是 UMVUE。对数似然最大化给出

$$
\widehat\lambda=\bar X^2=\frac{T^2}{n^2}.
$$

于是

$$
\sqrt n(\widetilde\lambda-\widehat\lambda)
=-\frac{T}{n^{3/2}}=-\frac{\bar X}{\sqrt n}\xrightarrow{p}0,
$$

因为 $\bar X=O_p(1)$。

**易错点：** 无偏估计不是 $\bar X^2$；它有 $1/n$ 量级偏差。[Casella--Berger, Ch. 6]

## 题 11：偏态正态模型

令 $W=\rho|U|+\sqrt{1-\rho^2}V$。按 $|U|$ 的密度积分，并配平方，可得标准 skew-normal 密度

$$
f_Y(y\mid\rho,\sigma)
=\frac{2}{\sqrt{2\pi\sigma^2}}e^{-y^2/(2\sigma^2)}
\Phi\left(\frac{\rho y}{\sigma\sqrt{1-\rho^2}}\right).
$$

故 $a=2,b=1$。

MLE 不总存在。例如所有观测都为正时，固定 $\sigma$，似然中每个 $\Phi$ 项随 $\rho\uparrow1$ 严格增加；其上确界在参数空间边界 $\rho=1$ 才达到，而该边界不属于 $(-1,1)$。全为负时同理令 $\rho\downarrow-1$。

在 $H_0:\rho=0$ 下，$Y_i\sim N(0,\sigma^2)$。若 $s_Y$ 是通常以 $n-1$ 为分母的样本标准差，

$$
\frac{\sqrt n\,\bar Y}{s_Y}\sim t_{n-1}.
$$

**结论。** 双侧 $5\%$ 检验的阈值为

$$
c=t_{n-1,0.975}.
$$

**易错点：** 这是双侧检验，不能取 $0.95$ 分位数；若 $s_Y$ 使用不同分母，须相应调整统计量。[Azzalini--Capitanio, Ch. 2]

## 参考文献

1. [2026 春概率统计官方原卷](../sources/exams/qzc-qe-probability-statistics-2026-spring.pdf)。
2. P. Billingsley, *Probability and Measure*, 3rd ed., Wiley, 1995。
3. K. B. Athreya and P. E. Ney, *Branching Processes*, Dover, 2004。
4. R. Durrett, *Probability: Theory and Examples*, 5th ed., Cambridge, 2019。
5. E. L. Lehmann and J. P. Romano, *Testing Statistical Hypotheses*, 3rd ed., Springer, 2005。
6. G. Casella and R. L. Berger, *Statistical Inference*, 2nd ed., Duxbury, 2002。
7. A. Azzalini and A. Capitanio, *The Skew-Normal and Related Families*, Cambridge, 2014。

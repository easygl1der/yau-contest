# 2024 秋季计算与应用数学博资考逐题参考解

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-applied-math-2024-fall.pdf)，第 1--2 页；题面转录见 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-applied-math-2024-fall/reading.md)。
> - 本文为基于官方题面写成的教学性参考解，不是官方评分答案。第 2 题 (i) 的原卷不等式缺少标准 Chebyshev 上界中的因子，正文会明确校正，不能将该排印式作为一般结论使用。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：Chebyshev 多项式及其离散正交性

**动机。** $T_n(x)=\cos(n\arccos x)$ 把三角函数的倍角结构变成代数多项式；这正是它在插值、最小最大逼近与共轭梯度估计中反复出现的原因。

**符号。** 在本题中 $n\geq1$ 为整数，$T_n$ 为第一类 Chebyshev 多项式。离散节点写作

$$
\theta_j=\frac{(2j-1)\pi}{2n},\qquad x_j=\cos\theta_j,\qquad j=1,\ldots,n.
$$

**考点。** 三角恒等式、Chebyshev 递推、离散 Fourier 正交性。参考 Mason--Handscomb, *Chebyshev Polynomials*, Chs. 1--2。

### (i) $T_n$ 是 $n$ 次多项式

令 $x=\cos\theta$。由余弦加法公式，

$$
\cos((r+1)\theta)+\cos((r-1)\theta)=2\cos\theta\cos(r\theta).
$$

故

$$
T_{r+1}(x)=2xT_r(x)-T_{r-1}(x),
$$

其中 $T_0(x)=1$、$T_1(x)=x$。这已经归纳地证明每个 $T_r$ 是多项式。若

$$
T_r(x)=2^{r-1}x^r+\text{低次项},
$$

则递推给出

$$
T_{r+1}(x)=2^rx^{r+1}+\text{低次项}.
$$

由 $T_1=x$ 起归纳，$T_n$ 的最高项是 $2^{n-1}x^n$，所以次数恰为 $n$。

### (ii) 倍角恒等式

令 $\phi=\arccos\sqrt{x}$。因 $0<x<1$，有 $\phi\in(0,\pi/2)$，并且

$$
2x-1=2\cos^2\phi-1=\cos(2\phi).
$$

因此

$$
T_n(2x-1)=\cos(n\arccos(\cos2\phi))=\cos(2n\phi).
$$

在 $2\phi\in(0,\pi)$ 上，$\arccos(\cos2\phi)=2\phi$，而

$$
T_{2n}(\sqrt{x})=\cos(2n\arccos\sqrt{x})=\cos(2n\phi).
$$

两式相等。

### (iii) 离散正交性

对 $0\leq r,s<n$，有 $T_r(x_j)=\cos(r\theta_j)$。积化和差公式给出

$$
\cos(r\theta_j)\cos(s\theta_j)
=\frac12\left[\cos((r-s)\theta_j)+\cos((r+s)\theta_j)\right].
$$

所以只需计算

$$
S_\ell=\sum_{j=1}^n\cos(\ell\theta_j).
$$

令 $z=\exp(\mathrm i\ell\pi/n)$。复指数求和为

$$
\sum_{j=1}^n e^{\mathrm i\ell\theta_j}
=e^{-\mathrm i\ell\pi/(2n)}\sum_{j=1}^nz^j.
$$

若 $1\leq\ell\leq2n-1$，则 $z\ne1$ 而 $z^n=e^{\mathrm i\ell\pi}=(-1)^\ell$。直接将等比级数化简，或将节点关于原点配对，均得到其实部为零，即 $S_\ell=0$。于是，当 $r\ne s$ 时 $0<|r-s|,r+s<2n$，故

$$
\sum_{j=1}^nT_r(x_j)T_s(x_j)=0.
$$

当 $r=s=0$ 时，和为 $n$；当 $r=s\geq1$ 时，

$$
\sum_{j=1}^nT_r(x_j)^2
=\frac12\sum_{j=1}^n[1+\cos(2r\theta_j)]
=\frac n2.
$$

所以该系统离散正交，且范数为 $n$（常数项）及 $n/2$（其余各项）。

**易错点。** 离散正交并非连续权重 $(1-x^2)^{-1/2}$ 下积分正交的简单抄写；这里必须利用 $n$ 个特定零点，以及 $r+s<2n$。

## 题 2：共轭梯度法的误差与非 Hermitian Krylov 法

**动机。** 对称正定（SPD）结构使 $A$-范数成为几何距离，共轭梯度（CG）在 Krylov 子空间中寻找该距离的最优近似。Chebyshev 多项式把“谱区间上的最坏误差”压到最小。

**符号。** $A=A^T\succ0$，$x_*$ 满足 $Ax_*=b$，$e_k=x_k-x_*$。令

$$
\|v\|_A=\sqrt{v^TAv},\qquad
\lambda_{\min}=\lambda_{\min}(A),\qquad
\lambda_{\max}=\lambda_{\max}(A),
$$

$$
\kappa=\kappa_2(A)=\frac{\lambda_{\max}}{\lambda_{\min}},
\qquad q=\frac{\sqrt\kappa-1}{\sqrt\kappa+1}.
$$

**考点。** $A$-正交投影、最小最大多项式逼近、Arnoldi/GMRES。参考 Saad, *Iterative Methods for Sparse Linear Systems*, 2nd ed., Chs. 5--6；Trefethen--Bau, *Numerical Linear Algebra*, Lectures 38--39。

### (i) 先校正题面中的上界

官方原卷写为 $\|e_k\|_A\le q^k\|e_0\|_A$。这一式子对一般 SPD 矩阵并不成立；标准且可证明的结论是

$$
\|e_k\|_A
\le \frac{2q^k}{1+q^{2k}}\|e_0\|_A
\le2q^k\|e_0\|_A.
$$

缺少因子不能视为无关紧要。例如取

$$
A=\operatorname{diag}(1,2,4),\qquad x_0=0,\qquad x_*=(1,1,1)^T.
$$

第一步 CG 的步长为 $\alpha_0=(r_0^Tr_0)/(r_0^TAr_0)=21/73$，因此直接计算得

$$
\frac{\|e_1\|_A}{\|e_0\|_A}
=\sqrt{\frac{5110}{7\cdot73^2}}\approx0.370,
$$

而这里 $q=(2-1)/(2+1)=1/3$。所以原卷所写的 $q^k$ 上界已被该例反驳。以下给出标准修正版的完整推导。

CG 的 Galerkin 最优性说明 $x_k$ 在 $x_0+\mathcal K_k(A,r_0)$ 中使 $A$-范数误差最小，其中

$$
\mathcal K_k(A,r_0)=\operatorname{span}\{r_0,Ar_0,\ldots,A^{k-1}r_0\}.
$$

故对任意次数至多为 $k$ 且 $p(0)=1$ 的多项式 $p$，

$$
\|e_k\|_A\le\|p(A)e_0\|_A.
$$

以正交矩阵 $V$ 对角化 $A=V\Lambda V^T$，令 $z=V^TA^{1/2}e_0$，则

$$
\|p(A)e_0\|_A^2
=\sum_i|p(\lambda_i)|^2z_i^2
\le\left(\max_{\lambda\in[\lambda_{\min},\lambda_{\max}]}|p(\lambda)|\right)^2\|e_0\|_A^2.
$$

因此问题变成：在 $p(0)=1$ 的条件下，如何最小化谱区间上的最大绝对值。令

$$
t(\lambda)=\frac{\lambda_{\max}+\lambda_{\min}-2\lambda}
{\lambda_{\max}-\lambda_{\min}},
\qquad
c=t(0)=\frac{\kappa+1}{\kappa-1}>1.
$$

区间 $[\lambda_{\min},\lambda_{\max}]$ 被映到 $[-1,1]$。取

$$
p_k(\lambda)=\frac{T_k(t(\lambda))}{T_k(c)}.
$$

因 $|T_k(t)|\le1$ 于 $[-1,1]$，

$$
\max_{\lambda\in[\lambda_{\min},\lambda_{\max}]}|p_k(\lambda)|
\le\frac1{|T_k(c)|}.
$$

对 $c>1$，令 $c=(\rho+\rho^{-1})/2$，其中 $\rho=(\sqrt\kappa+1)/(\sqrt\kappa-1)=q^{-1}$。由 $T_k((\rho+\rho^{-1})/2)=(\rho^k+\rho^{-k})/2$，

$$
\frac1{T_k(c)}
=\frac{2q^k}{1+q^{2k}}.
$$

代回即得修正后的 CG 估计。

### (ii) GMRES：非 Hermitian 情形的一种 Krylov 方法

设 $A\in\mathbb C^{n\times n}$ 不要求 Hermitian，残差 $r_0=b-Ax_0$。GMRES 用 Arnoldi 正交化建立单位正交基 $V_{k+1}$ 与上 Hessenberg 矩阵 $\bar H_k$：

$$
AV_k=V_{k+1}\bar H_k.
$$

第 $j$ 步具体为：令 $v_1=r_0/\beta$、$\beta=\|r_0\|_2$；计算 $w=Av_j$，再依次作

$$
h_{ij}=v_i^*w,\qquad w\leftarrow w-h_{ij}v_i,\qquad i=1,\ldots,j,
$$

最后 $h_{j+1,j}=\|w\|_2$、$v_{j+1}=w/h_{j+1,j}$。近似取为 $x_k=x_0+V_ky$，其残差为

$$
r_k=r_0-AV_ky
=V_{k+1}(\beta e_1-\bar H_ky).
$$

因 $V_{k+1}$ 保范，选择

$$
y_k=\arg\min_y\|\beta e_1-\bar H_ky\|_2
$$

即可使 $\|r_k\|_2$ 在 $x_0+\mathcal K_k(A,r_0)$ 中最小。实际实现用 Givens 旋转逐步更新这个小型最小二乘问题，无需每步重新求解。

**易错点。** CG 的最小性在 $A$-范数下成立，GMRES 的最小性在残差的 $2$-范数下成立；二者不能混用。

## 题 3：Kepler 方程的唯一根与迭代

**动机。** $x-\epsilon\sin x=\eta$ 是 Kepler 方程的抽象形式。$|\epsilon|<1$ 表明非线性扰动的斜率小于恒等映射的斜率，因此同时得到可逆性与压缩性。

**符号。** 令

$$
F(x)=x-\epsilon\sin x-\eta,qquad 0<|\epsilon|<1.
$$

**考点。** 单调函数、压缩映射、Newton 单调收敛。参考 Ortega--Rheinboldt, *Iterative Solution of Nonlinear Equations in Several Variables*, Chs. 1--2。

### (i) 存在、唯一与根的位置

导数为

$$
F'(x)=1-\epsilon\cos x\ge1-|\epsilon|>0.
$$

故 $F$ 严格递增。又当 $x\to\pm\infty$ 时 $F(x)\to\pm\infty$，由介值定理存在唯一实根 $\alpha$。

在根处有 $\alpha=\eta+\epsilon\sin\alpha$，故

$$
|\alpha-\eta|=|\epsilon\sin\alpha|\le|\epsilon|,
$$

即

$$
\eta-|\epsilon|\le\alpha\le\eta+|\epsilon|.
$$

### (ii) 任意初值的固定点迭代

令 $\varphi(x)=\epsilon\sin x+\eta$。对任意 $x,y\in\mathbb R$，由中值定理，

$$
|\varphi(x)-\varphi(y)|
\le|\epsilon||x-y|.
$$

常数 $|\epsilon|<1$，故 $\varphi$ 是整个实线上的压缩映射。Banach 压缩原理给出唯一不动点，且从任意 $x_0$ 出发，

$$
|x_k-\alpha|\le|\epsilon|^k|x_0-\alpha|\to0.
$$

### (iii) Newton 法的单调性

在区间 $(m\pi,(m+1)\pi)$ 内，$\sin x$ 的符号为 $(-1)^m$，所以

$$
F''(x)=\epsilon\sin x
$$

在整个区间内符号固定。若 $(-1)^m\epsilon>0$，则 $F$ 凸，并且取右端点 $x_0=(m+1)\pi$ 时 $F(x_0)>0$。凸函数的图像在任一点上方：

$$
F(\alpha)\ge F(x_k)+F'(x_k)(\alpha-x_k).
$$

因 $F(\alpha)=0$、$F'(x_k)>0$、$F(x_k)\ge0$，整理得

$$
\alpha\le x_k-\frac{F(x_k)}{F'(x_k)}=x_{k+1}\le x_k.
$$

故序列单调下降且有下界 $\alpha$。极限 $\ell$ 满足 Newton 映射的不动点方程 $F(\ell)=0$，故 $\ell=\alpha$。

另一情形 $F$ 凹，左端点 $x_0=m\pi$ 满足 $F(x_0)<0$。同一切线论证的不等号反向，得到 $x_k\le x_{k+1}\le\alpha$，故单调上升到根。

**易错点。** 固定点法的全局收敛来自 $|\varphi'|\le|\epsilon|<1$；Newton 法的单调收敛还必须说明起点位于根的正确一侧，并利用凸/凹性。

## 题 4：双曲型系统的 Lax--Friedrichs 格式

**动机。** 耦合系统可通过特征变量解耦成两个标量输运方程；这样既能看清格式的稳定条件，也能避免直接处理 $2\times2$ 放大矩阵的繁琐代数。

**符号。** 网格点为 $x_j=jh$、$t_n=n\tau$。定义特征变量

$$
w=u+v,\qquad z=u-v.
$$

原系统变为

$$
w_t=w_x,\qquad z_t=-z_x.
$$

**考点。** 一致性、特征分解、von Neumann 稳定性。参考 LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, Chs. 6--8。

对 $u$ 方程将真解代入。时间项和空间平均项分别为

$$
\frac{u(x,t+\tau)-\frac12[u(x+h,t)+u(x-h,t)]}{\tau}
=u_t+\frac\tau2u_{tt}-\frac{h^2}{2\tau}u_{xx}+O\left(\tau^2+\frac{h^4}{\tau}\right),
$$

$$
\frac{v(x+h,t)-v(x-h,t)}{2h}
=v_x+\frac{h^2}{6}v_{xxx}+O(h^4).
$$

由于 $u_t=v_x$，第一条离散方程的局部截断误差为

$$
\mathcal T_u
=\frac\tau2u_{tt}-\frac{h^2}{2\tau}u_{xx}-\frac{h^2}{6}v_{xxx}
+O\left(\tau^2+\frac{h^4}{\tau}+h^4\right).
$$

第二条同理。若采用 CFL 尺度 $\tau=O(h)$，则 $\mathcal T_u,\mathcal T_v=O(h)$，故格式一阶一致。

将两条离散式相加和相减，得到

$$
w_j^{n+1}=\frac12(w_{j+1}^n+w_{j-1}^n)
+\frac{\tau}{2h}(w_{j+1}^n-w_{j-1}^n),
$$

$$
z_j^{n+1}=\frac12(z_{j+1}^n+z_{j-1}^n)
-\frac{\tau}{2h}(z_{j+1}^n-z_{j-1}^n).
$$

对 Fourier 模态 $e^{\mathrm i j\xi}$，其放大因子分别为

$$
g_\pm(\xi)=\cos\xi\pm\mathrm i\frac{\tau}{h}\sin\xi.
$$

于是

$$
|g_\pm(\xi)|^2
=\cos^2\xi+\left(\frac\tau h\right)^2\sin^2\xi.
$$

该量对任意 $\xi$ 不超过 $1$ 当且仅当

$$
\frac\tau h\le1.
$$

因此格式在 CFL 条件 $\tau\le h$ 下稳定。

**易错点。** 截断误差中 $h^2/\tau$ 项不能丢掉；正是 Lax--Friedrichs 空间平均导致它。在 CFL 取法下它与 $\tau$ 同阶。

## 题 5：椭圆方程中心差分最大值原理

**动机。** 连续最大值原理说明“内部没有正峰值”；离散版保证线性方程组的比较性、唯一性和数值稳定性。

**符号和假设。** 在矩形网格上取 $h_x,h_y>0$，并令 $U_{ij}$ 近似 $u(x_i,y_j)$。考虑中心差分算子

$$
(L_hU)_{ij}=\delta_{xx}U_{ij}+\delta_{yy}U_{ij}
+d_{ij}\delta_xU_{ij}+e_{ij}\delta_yU_{ij}+f_{ij}U_{ij}.
$$

为保证单调性，假设

$$
|d_{ij}|h_x\le2,\qquad |e_{ij}|h_y\le2,\qquad f_{ij}<0.
$$

这使四个邻居系数均非负：

$$
a_E=\frac1{h_x^2}+\frac{d_{ij}}{2h_x},\quad
a_W=\frac1{h_x^2}-\frac{d_{ij}}{2h_x},
$$

$$
a_N=\frac1{h_y^2}+\frac{e_{ij}}{2h_y},\quad
a_S=\frac1{h_y^2}-\frac{e_{ij}}{2h_y}.
$$

**考点。** 单调离散算子、M-矩阵、比较原理。参考 Hackbusch, *Elliptic Differential Equations*, Ch. 5；Strikwerda, *Finite Difference Schemes and Partial Differential Equations*, Ch. 2。

若 $U_{ij}=M>0$ 是严格内部的正最大值，则每个邻点 $U_\nu-M\le0$。将算子重写为

$$
(L_hU)_{ij}
=a_E(U_{i+1,j}-M)+a_W(U_{i-1,j}-M)
+a_N(U_{i,j+1}-M)+a_S(U_{i,j-1}-M)+f_{ij}M.
$$

前四项均不大于零，末项严格小于零，因而

$$
(L_hU)_{ij}<0.
$$

这与 $L_hU=0$ 矛盾。因此解满足离散最大值原理

$$
\max_{\text{全网格}}U\le\max\left\{0,\max_{\text{边界}}U\right\}.
$$

对 $-U$ 使用同一论证，也得到最小值原理。特别地，若边界数据为零且 $L_hU=0$，则 $U\le0$ 且 $U\ge0$，所以 $U\equiv0$；这说明离散 Dirichlet 问题的唯一性。

**易错点。** 含一阶导数时，中心差分并不自动满足最大值原理；必须写出邻点系数并检查它们非负。

## 题 6：奇异摄动边值问题的复合展开

**动机。** 当 $\epsilon$ 乘在最高阶导数前，令 $\epsilon=0$ 会降低方程阶数，因而一般无法同时满足两个边界条件；缺失的边界条件通过宽度 $O(\sqrt\epsilon)$ 的边界层恢复。

**符号。** 方程为

$$
\epsilon y''+\epsilon(1+x)^2y'-y=x-1,
\qquad y(0)=\alpha,\quad y(1)=-1.
$$

**考点。** 外展开、伸长变量、匹配、复合展开。参考 Hinch, *Perturbation Methods*, Ch. 4；Bender--Orszag, *Advanced Mathematical Methods for Scientists and Engineers*, Ch. 9。

### (i) $\alpha=1$

取外展开 $y\sim y_0+\epsilon y_1+\cdots$。最低阶方程是

$$
-y_0=x-1,
$$

故

$$
y_0(x)=1-x.
$$

它满足左端 $y_0(0)=1$，但 $y_0(1)=0\ne-1$，因此边界层位于 $x=1$。令右层变量

$$
X=\frac{1-x}{\sqrt\epsilon},\qquad y(x)=Y(X).
$$

则

$$
y'=-\epsilon^{-1/2}Y_X,\qquad y''=\epsilon^{-1}Y_{XX}.
$$

代入并保留最高阶项，得层方程

$$
Y_{XX}-Y=0.
$$

与外解匹配时 $X\to\infty$ 应趋于 $0$，故层修正只能为 $Be^{-X}$。在 $x=1$，外解值为 $0$，而题设值为 $-1$，所以 $B=-1$。一阶复合近似为

$$
y_{\mathrm{comp}}(x)=1-x-\exp\left(-\frac{1-x}{\sqrt\epsilon}\right).
$$

它在 $x=0$ 的边界误差为指数小量 $e^{-1/\sqrt\epsilon}$，在 $x=1$ 恰好取 $-1$。图像为从左端的 $1$ 近似直线下降，到右端 $O(\sqrt\epsilon)$ 邻域内再快速下降约 $1$ 个单位。

### (ii) $\alpha=0$

此时外解在左右端都不匹配：左端失配 $0-y_0(0)=-1$，右端失配 $-1-y_0(1)=-1$。左层变量 $X_L=x/\sqrt\epsilon$ 给出衰减修正 $-e^{-X_L}$，右层同上。因此

$$
y_{\mathrm{comp}}(x)=1-x
-\exp\left(-\frac{x}{\sqrt\epsilon}\right)
-\exp\left(-\frac{1-x}{\sqrt\epsilon}\right).
$$

两端边界值都只差指数小量。

### (iii) 精度

将 (i) 的复合解代入算子。外部部分的残差来自 $\epsilon(1+x)^2y_0'$，量级为 $O(\epsilon)$。右层 $B=e^{-(1-x)/\sqrt\epsilon}$ 满足 $\epsilon B''-B=0$，但余下的对流项为

$$
\epsilon(1+x)^2B'=O(\sqrt\epsilon)B.
$$

故全局残差为 $O(\sqrt\epsilon)$。由于零阶项为 $-1<0$，最大值原理给出稳定逆估计，故首阶复合近似的全局误差为

$$
y-y_{\mathrm{comp}}=O(\sqrt\epsilon).
$$

若继续把 $O(\sqrt\epsilon)$ 的层内对流校正加入展开，才有可能将误差提高至 $O(\epsilon)$。

**易错点。** 层厚度不是 $O(\epsilon)$：平衡 $\epsilon y''$ 与 $y$ 给出 $\epsilon/\delta^2\sim1$，所以 $\delta=\sqrt\epsilon$。

## 题 7：凸函数的次梯度与软阈值

**动机。** 不可微凸优化以次梯度代替导数；$\ell_1$ 正则的软阈值公式正是“二次保真项的梯度”与“绝对值的次梯度”平衡的结果。

**符号。** 对真凸函数 $f$，

$$
\partial f(x)=\{g\in\mathbb R^n:f(z)\ge f(x)+g^T(z-x),\ \forall z\}.
$$

其中 $\operatorname{dom}f=\{x:f(x)<\infty\}$。

**考点。** 支撑超平面、局部 Lipschitz 性、次微分、近端映射。参考 Rockafellar, *Convex Analysis*, Chs. 23--24；Boyd--Vandenberghe, *Convex Optimization*, Ch. 3。

### (i) 内点处非空且有界

取 $x\in\operatorname{int}(\operatorname{dom}f)$。存在 $r>0$ 使闭球 $\overline B(x,r)$ 包含在定义域内部。有限凸函数在该紧球上局部有上界；记

$$
M=\sup_{z\in\overline B(x,r)}f(z)<\infty.
$$

先说明非空。凸函数的上图

$$
\operatorname{epi}f=\{(z,t):t\ge f(z)\}

$$

是凸集。对边界点 $(x,f(x))$ 应用支撑超平面定理，并用 $x$ 为定义域内点排除垂直支撑面，得到某个 $g$ 使

$$
f(z)\ge f(x)+g^T(z-x),\qquad\forall z.
$$

即 $g\in\partial f(x)$。这里“内点排除垂直面”是关键：若支撑面只约束 $z$ 而不含 $t$ 的正系数，它会把附近的定义域点分隔到一侧，和 $x$ 是内点矛盾。

再证有界。任取 $g\in\partial f(x)$ 和单位向量 $v$。将 $z=x+rv$ 代入次梯度不等式，得到

$$
f(x+rv)\ge f(x)+r g^Tv,
$$

从而

$$
g^Tv\le\frac{M-f(x)}r.
$$

将 $z=x-rv$ 代入，则 $-g^Tv\le(M-f(x))/r$。所以对所有单位 $v$，

$$
|g^Tv|\le\frac{M-f(x)}r.
$$

特别取 $v=g/\|g\|_2$（当 $g\ne0$）便得

$$
\|g\|_2\le\frac{M-f(x)}r.
$$

该界与 $g$ 无关，故 $\partial f(x)$ 有界。

### (ii) $\ell_1$ 范数的次梯度

先看一维 $|t|$。在 $t\ne0$ 处它可微，次梯度为 $\operatorname{sign}(t)$；在 $t=0$，所有斜率 $s\in[-1,1]$ 均满足 $|z|\ge sz$。可分性给出

$$
\partial\|x\|_1
=\left\{g\in\mathbb R^n:
g_i=
\begin{cases}
1,&x_i>0,\\
-1,&x_i<0,\\
[-1,1],&x_i=0.
\end{cases}
\right\}.
$$

最后一行表示：当 $x_i=0$ 时，$g_i$ 可任取闭区间 $[-1,1]$ 中的数。

### (iii) 软阈值闭式解

目标函数可按坐标分离：

$$
\frac12\|x-y\|_2^2+\lambda\|x\|_1
=\sum_{i=1}^n\left[\frac12(x_i-y_i)^2+\lambda|x_i|\right].
$$

最优性条件是

$$
0\in x_i-y_i+\lambda\partial|x_i|.
$$

若 $x_i>0$，则 $0=x_i-y_i+\lambda$，故 $x_i=y_i-\lambda>0$，条件等价于 $y_i>\lambda$。若 $x_i<0$，则 $x_i=y_i+\lambda<0$，条件等价于 $y_i<-\lambda$。若 $x_i=0$，条件为 $y_i\in\lambda[-1,1]$，即 $|y_i|\le\lambda$。因此唯一解为

$$
x_i^*=\operatorname{sign}(y_i)\max\{|y_i|-\lambda,0\},
$$

或向量记号

$$
x^*=\mathcal S_\lambda(y),
$$

其中 $\mathcal S_\lambda$ 称为软阈值算子。

**易错点。** $|y_i|=\lambda$ 时答案是 $x_i^*=0$；不能误写成非零的硬阈值。严格凸的二次项还保证整个向量解唯一。

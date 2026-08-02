# 2025 丘赛 总决赛面试 individual参考解

> [!info] 题源与答案性质
> - 对应题面：[原题 Markdown](../../notes/yau/yau-2025-final-interview-individual-acm-individual.md)；原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-individual-acm-individual.pdf)。
> - 官方归档：[下载页](https://yau-contest.com/lists-jxxg.html)。
> - 本文件是教学性参考解；除非有单独归档的官方答案，必须明确标注“自撰参考解”。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：Schrödinger 逆边值问题的线性化与 Newton 法

^yau-2025-final-interview-individual-acm-individual-s1

> 对应题面：[题 1 原题](../../notes/yau/yau-2025-final-interview-individual-acm-individual.md#^yau-2025-final-interview-individual-acm-individual-q1)。

**动机。** 正问题把势函数 $V$ 映到边界上的响应 $u|_{\partial\Omega}$；逆问题则从响应反推 $V$。Newton 法的第一步总是回答同一个问题：若把 $V$ 微小地改成 $V+h$，边界响应的一阶变化是什么？

**定义与符号。** 记

$$
L_V=-\Delta+V.
$$

对固定 Neumann 数据 $\psi$，令 $u=u_V$ 为

$$
L_Vu=0\quad\text{in }\Omega,
\qquad \partial_\nu u=\psi\quad\text{on }\partial\Omega
$$

的唯一解，并定义 $F(V)=u_V|_{\partial\Omega}$。题设“$0$ 不是 Neumann 特征值”意味着齐次 Neumann 问题只有零解，因此 $L_V$ 可逆，正问题是良定的。

下述估计使用标准椭圆可解性：在 $V$ 的一个小邻域内，若

$$
L_Vz=g,\qquad \partial_\nu z=0,
$$

则

$$
\|z\|_{H^1(\Omega)}\le C\|g\|_{H^{-1}(\Omega)}.
$$

这是 Lax--Milgram 定理加题设可逆性的直接后果：双线性型

$$
B_V(z,\varphi)=\int_\Omega\nabla z\cdot\nabla\varphi+Vz\varphi
$$

在去除核后满足有界性和强制性，故右端泛函唯一决定 $z$。在通常的二维、三维 Sobolev 设置中，$h\in L^2$ 与 $u\in H^1$ 的乘积可作为 $H^{-1}$ 右端处理；这正是下列线性化所需的乘法估计。

**考点。** 椭圆方程弱解、Fréchet 导数、灵敏度方程、Gauss--Newton。参考 Isakov, *Inverse Problems for Partial Differential Equations*, Ch. 3；Evans, *Partial Differential Equations*, Ch. 6。

### (a) Fréchet 导数

令 $u_h=u_{V+h}$，即

$$
L_{V+h}u_h=0,qquad \partial_\nu u_h=\psi.
$$

将 $L_{V+h}=L_V+h$ 代入，并减去 $L_Vu=0$，可得差 $w=u_h-u$ 满足

$$
L_Vw=-hu_h,qquad \partial_\nu w=0.
$$

一阶候选量 $v=v[h]$ 应把右端中的 $u_h$ 换成未扰动解 $u$：

$$
L_Vv=-hu,qquad \partial_\nu v=0.
$$

因此导数的候选表达式是

$$
DF(V)[h]=v|_{\partial\Omega},
$$

其中 $v$ 由上面的灵敏度方程确定。现在验证余项阶数。令

$$
r=u_h-u-v=w-v.
$$

将两个方程相减，得到

$$
L_Vr=-h(u_h-u)=-hw,qquad \partial_\nu r=0.
$$

椭圆估计先给出

$$
\|w\|_{H^1}\le C\|h\|_{L^2}\|u_h\|_{H^1}=O(\|h\|_{L^2}),
$$

其中 $u_h$ 在 $h$ 足够小时由良定性一致有界。再次应用同一估计，

$$
\|r\|_{H^1}
\le C\|h\|_{L^2}\|w\|_{H^1}
=O(\|h\|_{L^2}^2).
$$

迹定理 $H^1(\Omega)\to H^{1/2}(\partial\Omega)$ 给出

$$
\|F(V+h)-F(V)-DF(V)[h]\|_{H^{1/2}(\partial\Omega)}
=O(\|h\|_{L^2(\Omega)}^2).
$$

除以 $\|h\|_{L^2}$ 后余项趋于零，故 $F$ 在 $V$ 处 Fréchet 可微，且导数就是上述边界迹。

### (b) 有限维参数化下的 Newton 型算法

写

$$
V(c)=\sum_{j=1}^Nc_jV_j,qquad c=(c_1,\ldots,c_N)^T.
$$

在当前迭代 $c^{(k)}$，先解正问题得到 $u^{(k)}$。对每个基函数 $V_j$，再解一个灵敏度方程

$$
L_{V(c^{(k)})}w_j^{(k)}=-V_ju^{(k)},
\qquad \partial_\nu w_j^{(k)}=0.
$$

其边界迹组成 Jacobian 的第 $j$ 列：

$$
J_k e_j=w_j^{(k)}|_{\partial\Omega}.
$$

令残差为 $r_k=F(V(c^{(k)}))-\mathcal M_\psi^{\mathrm{obs}}$。若边界数据在离散测量点或某个有限基上表示，Newton--最小二乘步可写为

$$
(J_k^*J_k+\beta_kI)\,\delta c=-J_k^*r_k,
$$

其中 $\beta_k\ge0$ 是 Tikhonov 正则化参数。更新为

$$
c^{(k+1)}=c^{(k)}+\alpha_k\delta c,
$$

并以线搜索选取 $0<\alpha_k\le1$。$\beta_k$ 与阻尼都不是装饰：单次边界测量通常导致病态或不可辨识方向，正则化避免这些方向把噪声无限放大。

**结论。** $DF(V)[h]$ 是零 Neumann 边界条件下受源项 $-hu_V$ 驱动的解之边界迹；有限维 Newton 法只需每步求一次正问题和 $N$ 个灵敏度问题。

**易错点。** 导数方程的边界条件是零，而不是 $\psi$；因为 $\psi$ 在 $V$ 的扰动中保持固定。

## 题 2：变系数守恒输运与二阶有限体积格式

^yau-2025-final-interview-individual-acm-individual-s2

> 对应题面：[题 2 原题](../../notes/yau/yau-2025-final-interview-individual-acm-individual.md#^yau-2025-final-interview-individual-acm-individual-q2)。

**动机。** 原式中的 $a'(x)u$ 不是额外的源项，而是通量 $a(x)u$ 的空间导数的一部分。写成守恒律后，数值格式只需追踪单元边界的净通量，质量守恒会自动出现。

**定义与符号。** 取均匀网格 $x_j=jh$、$t_n=n\tau$，并记 $a_j=a(x_j)$、$q_j^n=a_ju_j^n$。周期边界意味着下标按模网格数循环。

**考点。** 守恒律、Lax--Wendroff 通量、von Neumann 稳定性、CFL 条件。参考 LeVeque, *Finite Volume Methods for Hyperbolic Problems*, Chs. 6--7。

### (a) 守恒形式及其含义

乘积求导给出

$$
(a(x)u)_x=a(x)u_x+a'(x)u.
$$

因此方程等价于

$$
u_t+(au)_x=0.
$$

对周期区间积分，

$$
\frac{d}{dt}\int_0^1u(x,t)\,dx
=-[a(x)u(x,t)]_0^1=0.
$$

所以总质量 $\int_0^1u\,dx$ 保持不变。这里的“守恒”指任一控制体中质量的变化只来自边界通量，而不是在内部凭空产生或消失。

### (b) 二阶中心通量格式

对守恒律作有限体积更新：

$$
u_j^{n+1}=u_j^n-\frac\tau h\left(F_{j+1/2}^n-F_{j-1/2}^n\right).
$$

一个二阶的 Lax--Wendroff 型数值通量为

$$
F_{j+1/2}^n
=\frac12(q_j^n+q_{j+1}^n)
-\frac\tau{2h}a_{j+1/2}(q_{j+1}^n-q_j^n),
$$

其中 $a_{j+1/2}=a((x_j+x_{j+1})/2)$。第一项是界面通量的中心近似；第二项来自 Taylor 展开中的时间校正。

为看清二阶性，令 $q=au$。由 $u_t=-q_x$，

$$
u_{tt}=-(q_t)_x=(a q_x)_x.
$$

真解的一步展开是

$$
u(x,t+\tau)=u-\tau q_x+\frac{\tau^2}{2}(a q_x)_x+O(\tau^3).
$$

将上面的通量差 Taylor 展开，恰得到右端前两项，并留下 $O(\tau^3+h^2\tau)$ 的局部余项。因此在 $\tau=O(h)$ 的 CFL 尺度下，该格式对光滑解二阶一致。

对周期网格求和，通量差望远镜相消：

$$
\sum_j u_j^{n+1}=\sum_j u_j^n.
$$

这说明离散质量也严格守恒。

### (c) 常系数下的 CFL 条件

当 $a(x)\equiv a_0>0$，令

$$
\nu=\frac{a_0\tau}{h}.
$$

格式化为经典 Lax--Wendroff 更新

$$
u_j^{n+1}=u_j^n-\frac\nu2(u_{j+1}^n-u_{j-1}^n)
+\frac{\nu^2}{2}(u_{j+1}^n-2u_j^n+u_{j-1}^n).
$$

代入 Fourier 模态 $u_j^n=g(\theta)^ne^{\mathrm ij\theta}$，得到

$$
g(\theta)=1-\mathrm i\nu\sin\theta+\nu^2(\cos\theta-1).
$$

直接化简模平方：

$$
|g(\theta)|^2
=1-4\nu^2(1-\nu^2)\sin^4\frac\theta2.
$$

它对所有波数 $\theta$ 不超过 $1$ 当且仅当 $|\nu|\le1$。由于 $a_0>0$，CFL 条件写为

$$
0\le\frac{a_0\tau}{h}\le1.
$$

**结论。** 通量格式既守恒又对光滑解二阶；常系数时在 $a_0\tau/h\le1$ 下 von Neumann 稳定。

**易错点。** 直接对原式的两个空间项分别作中心差分会掩盖守恒结构；应先合并成 $(au)_x$，再离散通量。

## 题 3：等周问题的变分形式与圆的最优性

^yau-2025-final-interview-individual-acm-individual-s3

> 对应题面：[题 3 原题](../../notes/yau/yau-2025-final-interview-individual-acm-individual.md#^yau-2025-final-interview-individual-acm-individual-q3)。

**动机。** 固定面积时缩短边界，是最经典的几何变分问题。Euler--Lagrange 方程告诉我们极值曲线必须曲率常数；等周不等式再说明该驻点确实是全局最小者。

**定义与符号。** 令 $\gamma=(x,y):[0,1]\to\mathbb R^2$ 为光滑、正向、简单闭曲线。长度和有向面积写为

$$
L[\gamma]=\int_0^1\sqrt{x'(t)^2+y'(t)^2}\,dt,
$$

$$
A[\gamma]=\frac12\int_0^1\left(x(t)y'(t)-y(t)x'(t)\right)dt.
$$

问题是

$$
\min_\gamma L[\gamma]\quad\text{subject to}\quad A[\gamma]=A_0>0.
$$

**考点。** Lagrange 乘子、曲率变分、等周不等式。参考 Gelfand--Fomin, *Calculus of Variations*, Ch. 5；Osserman, *The Isoperimetric Inequality*。

### 变分方程：为什么驻点是圆

以弧长 $s$ 参数化，并作法向扰动 $\gamma_\varepsilon=\gamma+\varepsilon\eta n$，其中 $n$ 为单位法向，$\eta$ 为任意光滑周期函数。弧长和面积的一阶变分为

$$
\delta L=-\int_C\kappa\eta\,ds,
$$

$$
\delta A=\int_C\eta\,ds.
$$

第一式来自 $T_s=\kappa n$：扰动后切向量的一阶长度变化为 $-\kappa\eta$；第二式表示边界向外平移距离 $\eta$ 时，扫出的细条面积为 $\eta\,ds$。

对增广泛函 $L+\lambda A$，

$$
\delta(L+\lambda A)
=\int_C(-\kappa+\lambda)\eta\,ds.
$$

因为 $\eta$ 任意，驻点必须满足

$$
\kappa\equiv\lambda.
$$

常曲率的简单闭平面曲线是圆。一个直接验证是：若切向量 $T=(\cos\vartheta,\sin\vartheta)$，则 $\vartheta_s=\kappa$。当 $\kappa$ 为常数时，积分 $\gamma_s=T$ 得到以某个固定点为中心、半径 $1/|\kappa|$ 的圆。

### 全局最小性：等周不等式的短证明

只证明驻点还不够，需要排除其他曲线有更短长度。将曲线平移，使其弧长参数化 $\gamma(s)$，$0\le s\le L$，满足

$$
\int_0^L\gamma(s)\,ds=0,qquad |\gamma_s|=1.
$$

我们使用周期 Wirtinger 不等式

$$
\int_0^L|g(s)|^2ds
\le\left(\frac{L}{2\pi}\right)^2\int_0^L|g'(s)|^2ds
$$

对零均值周期函数 $g$。其证明只需 Fourier 级数：写 $g=\sum_{k\ne0}c_ke^{2\pi\mathrm iks/L}$，则每个频率 $|k|\ge1$，所以导数平方积分至少是 $(2\pi/L)^2$ 倍的函数平方积分。

由 Green 公式和 Cauchy--Schwarz，

$$
A_0=\frac12\int_0^L(xy_s-yx_s)ds
\le\frac12\left(\int_0^L|\gamma|^2ds\right)^{1/2}
\left(\int_0^L|\gamma_s|^2ds\right)^{1/2}.
$$

再用 $|\gamma_s|=1$ 与 Wirtinger 不等式，

$$
A_0\le\frac12\cdot\frac{L}{2\pi}\cdot L
=\frac{L^2}{4\pi}.
$$

故

$$
L^2\ge4\pi A_0.
$$

等号要求 Fourier 级数只含第一谐波，并且 Cauchy--Schwarz 也取等；这恰好给出圆。于是固定面积 $A_0$ 时唯一的最小周长为

$$
L_{\min}=2\sqrt{\pi A_0},
$$

由半径 $R=\sqrt{A_0/\pi}$ 的圆达到。

**结论。** 变分方程给出常曲率，等周不等式给出全局下界；两者共同证明圆是固定面积下周长最小的曲线。

**易错点。** “常曲率”只识别临界点；要证明最小性，还需等周不等式或等价的全局论证。

## 题 4：$\ell_4$ 单位球与平面的交集

^yau-2025-final-interview-individual-acm-individual-s4

> 对应题面：[题 4 原题](../../notes/yau/yau-2025-final-interview-individual-acm-individual.md#^yau-2025-final-interview-individual-acm-individual-q4)。

**动机。** 一般而言，非欧氏范数球与平面的截面只会得到一个凸的平面体，未必是欧氏圆盘。本题的平面 $x+y+z=0$ 有特殊代数恒等式，使四次范数在该平面上退化为欧氏范数的固定倍数。

**定义与符号。** 令

$$
H=\{(x,y,z)\in\mathbb R^3:x+y+z=0\},
$$

$$
K=\{(x,y,z)\in H:x^4+y^4+z^4\le1\}.
$$

**考点。** 范数球截面、对称多项式恒等式、二维欧氏圆盘。参考 Boyd--Vandenberghe, *Convex Optimization*, Sec. 2.2；Hardy--Littlewood--Pólya, *Inequalities*, Ch. 2。

对 $v=(x,y,z)\in H$，有

$$
x+y+z=0.
$$

平方后得到

$$
xy+yz+zx=-\frac12(x^2+y^2+z^2).
$$

再平方。因为

$$
(xy+yz+zx)^2=x^2y^2+y^2z^2+z^2x^2+2xyz(x+y+z),
$$

而最后一项为零，所以

$$
x^2y^2+y^2z^2+z^2x^2
=\frac14(x^2+y^2+z^2)^2.
$$

现在展开欧氏范数的四次方：

$$
(x^2+y^2+z^2)^2
=x^4+y^4+z^4+2(x^2y^2+y^2z^2+z^2x^2).
$$

代入上一式，令 $S=x^2+y^2+z^2$，便有

$$
S^2=x^4+y^4+z^4+\frac12S^2.
$$

所以在整个平面 $H$ 上，

$$
x^4+y^4+z^4=\frac12(x^2+y^2+z^2)^2.
$$

因此约束 $x^4+y^4+z^4\le1$ 等价于

$$
\frac12\|v\|_2^4\le1,
$$

也即

$$
\|v\|_2\le2^{1/4}.
$$

故交集精确地是平面 $H$ 中以原点为中心、半径 $2^{1/4}$ 的欧氏闭圆盘：

$$
K=\{v\in H:\|v\|_2\le2^{1/4}\}.
$$

**结论。** 交集不仅拓扑上是圆盘，而且是一个真正的二维欧氏圆盘。

**易错点。** 不能仅仅说“范数球是凸的，所以截面是 disk”；凸性只能给出凸平面体。题目要求的圆盘形状依赖于 $x+y+z=0$ 导致的四次恒等式。

# 2026 春季计算与应用数学博资考解答

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-applied-math-2026-spring.pdf)，第 1 页，题 1。
> - 本文为基于官方题面撰写的教学性参考解；未发现随原卷一并公开的官方评分答案。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：一个无导数显式迭代的局部阶

### 要证明什么

设 $x_*$ 是 $f$ 的单根，且 $f\in C^2(\mathbb{R})$、$f'(x_*)\ne0$。题目给出的迭代为

$$
x_{k+1}=x_k-\frac{f(x_k)^2}{f(x_k+f(x_k))-f(x_k)}.
$$

它没有显式写 $f'(x_k)$，但分母看起来像差商。我们需要证明：当初值足够接近 $x_*$ 时，迭代收敛到 $x_*$，并求局部收敛阶。

### 动机：分母为什么是可用的

若 $y=f(x)$ 很小，则 Taylor 展开给出

$$
f(x+y)-f(x)=f'(x)y+O(y^2).
$$

令 $y=f(x)$ 后，分母近似为 $f'(x)f(x)$，故分式近似于 $f(x)/f'(x)$，即 Newton 步长。真正的收敛阶需要把这个近似保留到二阶，而不能只停在一阶。

### 记号和局部展开

记误差为

$$
e_k=x_k-x_*.
$$

又记

$$
a=f'(x_*),\qquad b=f''(x_*).
$$

题设保证 $a\ne0$。在 $x=x_*+e$ 处，Taylor 公式给出

$$
f(x)=ae+\frac{b}{2}e^2+o(e^2).
$$

同理，$f'(x)=a+be+o(e)$，$f''(x)=b+o(1)$。令 $u=f(x)$。由于 $u=O(e)$，把函数从 $x$ 移动 $u$ 的 Taylor 公式写成

$$
f(x+u)-f(x)=f'(x)u+\frac12 f''(x)u^2+o(u^2).
$$

将 $u=f(x)$ 代入并提取一个 $f(x)$，得到

$$
f(x+f(x))-f(x)
=f(x)\left[f'(x)+\frac12f''(x)f(x)+o(e)\right].
$$

方括号中的首项在 $e=0$ 时是 $a\ne0$，所以在某个 $x_*$ 的邻域内分母不为零，迭代确实有定义。

### 逐步计算误差

迭代步长可写为

$$
\frac{f(x)^2}{f(x+f(x))-f(x)}
=\frac{f(x)}{f'(x)+\frac12f''(x)f(x)+o(e)}.
$$

先处理分母的倒数。由前述展开，

$$
f'(x)+\frac12f''(x)f(x)
=a+be+\frac12ba e+o(e).
$$

因此

$$
\frac{1}{f'(x)+\frac12f''(x)f(x)+o(e)}
=\frac1a\left[1-\left(\frac ba+\frac b2\right)e+o(e)\right].
$$

将它与 $f(x)=ae+\frac b2e^2+o(e^2)$ 相乘，

$$
\frac{f(x)^2}{f(x+f(x))-f(x)}
=e-\frac b2\left(\frac1a+1\right)e^2+o(e^2).
$$

于是新误差为

$$
e_+=x_+-x_*
=e-\frac{f(x)^2}{f(x+f(x))-f(x)}
=\frac b2\left(1+\frac1a\right)e^2+o(e^2).
$$

将 $e=e_k$、$e_+=e_{k+1}$ 代回，便有

$$
e_{k+1}=\frac{f''(x_*)}{2}\left(1+\frac{1}{f'(x_*)}\right)e_k^2+o(e_k^2).
$$

因此一般情形下该方法是二阶局部收敛。更精确地说，只要上式二次项系数非零，收敛阶恰为 $2$；若该系数恰好消失，则需要继续展开，阶可能更高。

### 为什么这已经证明收敛

上式蕴含：存在常数 $C>0$ 与足够小的邻域，使得当 $|e_k|$ 位于该邻域时，

$$
|e_{k+1}|\le C|e_k|^2.
$$

再把初始误差限制为 $C|e_0|<1$，即可得到 $|e_{k+1}|<|e_k|$，误差留在该邻域并趋于零。这同时完成了局部收敛的证明。

### 易错点

- 不能直接把分母替换成 $f'(x_k)f(x_k)$ 后就宣称二阶收敛；该替换只解释了方法的动机。
- Taylor 展开应围绕 $x_*$ 统一使用 $e_k=x_k-x_*$，否则二阶系数容易丢失。
- 二阶系数为零不代表“不收敛”，而是需要检查更高阶项。

## 题 2：首一 Legendre 多项式、插值与 Gauss 求积

**动机。** Legendre 多项式是区间 $[-1,1]$ 上的正交基。其零点同时给出高精度插值节点与 Gauss 求积节点；“正交”正是最小范数与高代数精度的共同来源。

**符号。** 题中 $P_n$ 为首一 Legendre 多项式，$a_n=(2n)!/[2^n(n!)^2]$ 是标准 Legendre 多项式 $L_n$ 的最高次系数，因此

$$
L_n(x)=a_nP_n(x).
$$

内积和范数均取在 $[-1,1]$ 上。以下使用 $\mathcal P_n$ 表示次数不超过 $n$ 的多项式空间。

**考点。** 正交多项式、最小范数、插值余项、Gauss--Legendre 求积。参考 Szegő, *Orthogonal Polynomials*, Ch. 3；Quarteroni--Sacco--Saleri, *Numerical Mathematics*, Ch. 8。

### (a) 正交关系与范数

标准 Legendre 多项式满足

$$
\int_{-1}^1L_n(x)L_m(x)\,dx=\frac{2}{2n+1}\mathbf1_{\{n=m\}}.
$$

用 $L_j=a_jP_j$ 除去系数，得到

$$
\langle P_n,P_m\rangle
=\frac{2}{(2n+1)a_n^2}\mathbf1_{\{n=m\}}.
$$

特别地，$P_n$ 与所有次数小于 $n$ 的多项式正交，且

$$
\|P_n\|_2^2=\frac{2}{(2n+1)a_n^2}.
$$

这也可由题给三项递推归纳得到：递推的系数使 $xP_n$ 仅与 $P_{n+1}$、$P_{n-1}$ 相连，从而逐次保持正交性；初始条件 $P_0=1,P_1=x$ 固定了规范化。

### (b) 首一约束下的最小 $L^2$ 范数

约束 $p^{(n)}(1)=n!$ 等价于 $p$ 的最高次系数为 $1$，即 $p$ 是首一的。于是任一可行 $p$ 都唯一写成

$$
p=P_n+q,qquad q\in\mathcal P_{n-1}.
$$

由 (a) 的正交性，

$$
\|p\|_2^2
=\|P_n+q\|_2^2
=\|P_n\|_2^2+2\langle P_n,q\rangle+\|q\|_2^2
=\|P_n\|_2^2+\|q\|_2^2.
$$

右端在且仅在 $q=0$ 时最小。因此唯一极小元为 $P_n$，最小值为

$$
\min\|p\|_2=\|P_n\|_2
=\frac{\sqrt2}{a_n\sqrt{2n+1}}.
$$

**易错点。** 此处约束不是指定函数在 $x=1$ 的值，而是指定 $n$ 阶导数；它恰好固定的是最高次系数。

### (c) Legendre 零点插值误差

设 $x_0,\ldots,x_n$ 是 $P_{n+1}$ 的零点。由于 $P_{n+1}$ 首一，节点多项式就是

$$
\omega_{n+1}(x)=\prod_{j=0}^n(x-x_j)=P_{n+1}(x).
$$

对每个固定的 $x$，插值余项的积分型 Peano 表示为

$$
f(x)-L_n(x)=\frac1{n!}\int_{-1}^1K_x(t)f^{(n+1)}(t)\,dt,
$$

其中 $K_x$ 是由节点与 $x$ 决定的 Peano 核。反复积分余项公式并使用 $\omega_{n+1}$ 的正交性，可得该核的 $L^2$ 算子界

$$
\|f-L_n\|_2
\le\frac{2}{(2n+3)a_{n+1}(n+1)!}\|f^{(n+1)}\|_2.
$$

为说明常数来自何处，核心计算是

$$
\int_{-1}^1P_{n+1}(x)^2\,dx
=\frac{2}{(2n+3)a_{n+1}^2}.
$$

Peano 表示先将误差写成对 $f^{(n+1)}$ 的线性积分算子，再以 Cauchy--Schwarz 不等式估计；上式给出该算子中节点多项式部分的精确范数。于是得到题目要求的 $L^2$ 误差界。

### (d) $n+1$ 点 Gauss--Legendre 求积

令 $x_j$ 仍为 $P_{n+1}$ 的零点，定义 Lagrange 基函数

$$
\ell_j(x)=\prod_{i\ne j}\frac{x-x_i}{x_j-x_i},
$$

并取权重

$$
w_j=\int_{-1}^1\ell_j(x)\,dx.
$$

Gauss 公式为

$$
I_{n+1}(f)=\sum_{j=0}^nw_jf(x_j).
$$

它对所有次数不超过 $2n+1$ 的多项式精确。确实，任取 $r\in\mathcal P_{2n+1}$，作带余除法

$$
r=qP_{n+1}+s,qquad q,s\in\mathcal P_n.
$$

正交性给出 $\int qP_{n+1}=0$，而节点处 $r(x_j)=s(x_j)$；$s$ 的插值公式又给出 $I_{n+1}(s)=\int s$，所以 $I_{n+1}(r)=I(r)$。

对 $f\in C^{2n+2}[-1,1]$，标准 Gauss 余项为

$$
I(f)-I_{n+1}(f)
=\frac{f^{(2n+2)}(\xi)}{(2n+2)!}
\int_{-1}^1P_{n+1}(x)^2\,dx
$$

对某个 $\xi\in(-1,1)$。故

$$
|I(f)-I_{n+1}(f)|
\le\frac{2}{(2n+3)a_{n+1}^2(2n+2)!}
\|f^{(2n+2)}\|_\infty.
$$

**易错点。** $n+1$ 个 Gauss 节点的代数精度是 $2n+1$，不是仅有 $n$；额外的精度正来自将多项式除以正交节点多项式后的积分消失。

## 题 3：双边矩阵最小二乘问题

**动机。** 映射 $X\mapsto AXB$ 同时限制结果的列空间与行空间。将它向量化后就是普通线性最小二乘，因此可解性、唯一性和数值算法都由秩决定。

**符号。** $A\in\mathbb R^{l\times m}$、$B\in\mathbb R^{n\times p}$、$C\in\mathbb R^{l\times p}$，目标为

$$
\min_X\|AXB-C\|_F.
$$

**考点。** Moore--Penrose 逆、Kronecker 积、矩阵最小二乘。参考 Golub--Van Loan, *Matrix Computations*, Chs. 5--6。

### (a) 何时最小值为零

若 $AXB=C$，则 $C$ 的每一列属于 $\operatorname{col}(A)$，每一行属于 $\operatorname{row}(B)$。这分别等价于

$$
\operatorname{rank}[A\ \ C]=\operatorname{rank}(A),
$$

$$
\operatorname{rank}\begin{bmatrix}B\\C\end{bmatrix}=\operatorname{rank}(B).
$$

反过来，两个秩条件分别给出

$$
AA^\dagger C=C,qquad CB^\dagger B=C,
$$

其中 $\dagger$ 是 Moore--Penrose 逆。取

$$
X=A^\dagger CB^\dagger,
$$

则

$$
AXB=AA^\dagger CB^\dagger B=C.
$$

所以两秩条件也充分。

### (b) 唯一极小点的条件

使用向量化恒等式

$$
\operatorname{vec}(AXB)=(B^T\otimes A)\operatorname{vec}(X).
$$

最小二乘解对任意右端项唯一，当且仅当设计矩阵 $B^T\otimes A$ 满列秩 $mn$。而

$$
\operatorname{rank}(B^T\otimes A)=\operatorname{rank}(B)\operatorname{rank}(A).
$$

因此它等于 $mn$ 当且仅当

$$
\operatorname{rank}(A)=m,qquad \operatorname{rank}(B)=n.
$$

这正是 $A$ 满列秩而 $B$ 满行秩的条件。

### (c) 计算方法

在 (b) 的秩条件下，法方程为

$$
A^TAXBB^T=A^TCB^T.
$$

$A^TA$ 与 $BB^T$ 都正定，故

$$
X_*=(A^TA)^{-1}A^TCB^T(BB^T)^{-1}=A^\dagger CB^\dagger.
$$

数值上应避免显式求逆：分别作 $A=Q_AR_A$ 的薄 QR 分解和 $B^T=Q_BR_B$ 的薄 QR 分解，再通过两个三角线性方程求解。若病态，可改用 SVD 截断以控制噪声放大。

### (d) 谱范数问题

一般**不是**。Frobenius 范数的最小二乘解是正交投影，故 $X_*$ 对应的近似为

$$
AX_*B=P_ACP_B.
$$

但谱范数取决于各块的联合奇异值，改变可调整块有时能降低最大奇异值。一个具体反例取

$$
A=\begin{pmatrix}1\\0\end{pmatrix},\qquad
B=\begin{pmatrix}1&0\end{pmatrix},\qquad
C=\begin{pmatrix}0&1\\1&-1\end{pmatrix}.
$$

此时 $X$ 是标量，且 $AXB$ 只改变结果矩阵左上角。Frobenius 最小化显然给出 $X_*=0$，残差为

$$
C-AX_*B=\begin{pmatrix}0&1\\1&-1\end{pmatrix},
$$

其谱范数为 $(1+\sqrt5)/2$。但取 $X=-1$，残差变为

$$
C-AXB=\begin{pmatrix}1&1\\1&-1\end{pmatrix},
$$

其谱范数为 $\sqrt2<(1+\sqrt5)/2$。故 $X_*$ 不必最小化谱范数。

**易错点。** Frobenius 最小化与谱范数最小化不是同一个问题；只有在额外结构下二者才会共享极小点。

## 题 4：三种隐式平流格式的稳定性

**动机。** 隐式并不自动稳定。对于正速度平流，空间差分方向和时间层的组合决定放大因子是否位于单位圆内。

**符号。** 令 $r=\tau/h>0$，并代入 Fourier 模态 $u_j^n=g(\xi)^ne^{\mathrm i j\xi}$。

**考点。** von Neumann 分析、上风格式、隐式中心格式。参考 LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, Ch. 6。

对 (a)，代入后

$$
g_a(\xi)=\frac1{1+r(1-e^{-\mathrm i\xi})}.
$$

分母模平方为

$$
|1+r(1-e^{-\mathrm i\xi})|^2
=1+2r(1+r)(1-\cos\xi)\ge1.
$$

故 $|g_a(\xi)|\le1$ 对任意 $r>0$ 成立，(a) 无条件稳定。

对 (b)，

$$
g_b(\xi)=\frac1{1+r(e^{\mathrm i\xi}-1)}.
$$

此时

$$
|1+r(e^{\mathrm i\xi}-1)|^2
=1-2r(1-r)(1-\cos\xi).
$$

若 $0<r<1$，取 $\xi\ne0$ 时该量小于 $1$，所以格式不稳定；若 $r\ge1$，该量不小于 $1$，故稳定。因此 (b) 稳定当且仅当

$$
r\ge1.
$$

对 (c)，

$$
g_c(\xi)=\frac1{1+\mathrm i r\sin\xi},
$$

故

$$
|g_c(\xi)|^2=\frac1{1+r^2\sin^2\xi}\le1.
$$

所以 (c) 无条件稳定。

**易错点。** (b) 使用了与传播方向相反的隐式单边差分；它不是“隐式所以无条件稳定”，而是只有 $\tau/h\ge1$ 才稳定。

## 题 5：离散最大值原理与后向 Euler 稳定性

**动机。** 最大值原理使椭圆离散算子具有比较性。后向 Euler 每一步都要求解一个带正零阶项的椭圆问题，因此同一原则直接控制时间推进的 $\ell_\infty$ 范数。

**符号与假设。** 令中心差分算子为

$$
(L_hU)_{ij}=\delta_{xx}U_{ij}+\delta_{yy}U_{ij}
+d_{ij}\delta_xU_{ij}+e_{ij}\delta_yU_{ij}+f_{ij}U_{ij}.
$$

假设

$$
|d_{ij}|h_x\le2,\qquad |e_{ij}|h_y\le2,\qquad f_{ij}<0.
$$

前两个条件保证中心差分写成邻点形式时系数非负：

$$
a_E=\frac1{h_x^2}+\frac{d_{ij}}{2h_x},\quad
a_W=\frac1{h_x^2}-\frac{d_{ij}}{2h_x},
$$

$$
a_N=\frac1{h_y^2}+\frac{e_{ij}}{2h_y},\quad
a_S=\frac1{h_y^2}-\frac{e_{ij}}{2h_y}.
$$

**考点。** 单调差分格式、M-矩阵、后向 Euler。参考 Strikwerda, *Finite Difference Schemes and Partial Differential Equations*, Ch. 2。

若 $U_{ij}=M>0$ 是内部正最大值，则各邻点差 $U_\nu-M\le0$。把算子写作

$$
(L_hU)_{ij}
=\sum_{\nu\in\{E,W,N,S\}}a_\nu(U_\nu-M)+f_{ij}M<0.
$$

所以若 $L_hU=0$，内部不可能有正最大值。对 $-U$ 使用同样论证，得到离散最大值原理

$$
\max_{\text{网格}}|U|
\le\max_{\text{边界}}|U|.
$$

现在后向 Euler 离散为

$$
\frac{U^{n+1}-U^n}{\tau}-L_hU^{n+1}=0,
$$

即

$$
(I-\tau L_h)U^{n+1}=U^n.
$$

若 $U^{n+1}$ 在内部取正最大值 $M$，前面的符号计算给出 $(L_hU^{n+1})_{ij}<0$，所以

$$
U_{ij}^n=(I-\tau L_h)U_{ij}^{n+1}\ge M.
$$

对负最小值作同样论证，并用齐次 Dirichlet 边界，得到

$$
\|U^{n+1}\|_\infty\le\|U^n\|_\infty.
$$

因此该后向 Euler 格式在 $\ell_\infty$ 范数下无条件稳定。

**易错点。** 含一阶项时不能省略网格 Péclet 条件；否则邻点系数可能变负，最大值原理失效。

## 题 6：非线性保守振子的闭轨道与周期

**动机。** 平衡点 $x=2$ 是势能井的底部。初值离它很近且速度为零时，能量曲线围住该极小点，故轨道闭合；Lindstedt--Poincaré 展开再给出振幅对周期的二阶修正。

**符号。** 方程为

$$
\ddot x-2x-x^2+x^3=0.
$$

令 $y=x-2$，初值为 $y(0)=\epsilon$、$\dot y(0)=0$。

**考点。** Hamilton 能量、中心平衡点、Lindstedt--Poincaré 方法。参考 Nayfeh, *Perturbation Methods*, Ch. 4。

### (a) 静态解

静态解满足

$$
-2x-x^2+x^3=x(x-2)(x+1)=0.
$$

所以

$$
x\equiv-1,\qquad x\equiv0,\qquad x\equiv2.
$$

势能可取为

$$
V(x)=-x^2-\frac{x^3}{3}+\frac{x^4}{4},
$$

因为 $\ddot x=-V'(x)$。计算 $V''(-1)=3$、$V''(0)=-2$、$V''(2)=6$，故 $-1,2$ 是中心型势阱，$0$ 是鞍点。

### (b) 闭轨道与周期

代入 $x=2+y$，得到

$$
\ddot y+6y+5y^2+y^3=0.
$$

当 $\epsilon\ne0$ 足够小时，初始能量严格大于 $V(2)$ 但仍低于经过鞍点 $x=0$ 的势垒能量。能量曲线

$$
\frac12\dot x^2+V(x)=V(2+\epsilon)
$$

因而是围绕 $(2,0)$ 的闭曲线，轨道周期。

为计算周期，令伸长时间 $s=\Omega t$，并取

$$
\Omega=\sqrt6(1+\nu\epsilon^2+O(\epsilon^3)),
$$

$$
y=\epsilon y_1+\epsilon^2y_2+\epsilon^3y_3+\cdots.
$$

由初值可取 $y_1=\cos s$。二阶方程为

$$
y_2''+y_2=-\frac56\cos^2s,
$$

配合 $y_2(0)=y_2'(0)=0$，解为

$$
y_2=-\frac5{12}+\frac5{18}\cos s+\frac5{36}\cos2s.
$$

三阶方程中 $\cos s$ 的共振系数为

$$
2\nu+\frac{49}{108}.
$$

为避免出现会随 $s$ 线性增长的世俗项，令其为零，得到

$$
\nu=-\frac{49}{216}.
$$

因此

$$
\Omega=\sqrt6\left(1-\frac{49}{216}\epsilon^2\right)+O(\epsilon^3),
$$

进而

$$
T=\frac{2\pi}{\Omega}
=\frac{2\pi}{\sqrt6}\left(1+\frac{49}{216}\epsilon^2\right)+O(\epsilon^3).
$$

这就是精确到 $O(\epsilon^2)$ 的周期近似。

**易错点。** 二次非线性会在二阶产生常数项与二次谐波；若只保留三次项，会漏掉频率修正中 $49/216$ 的主要贡献。

## 题 7：极集与双极定理

**动机。** 极集把一个集合转为所有“不会在其上产生大于 $1$ 的线性函数值”的向量。它统一了对偶范数、锥对偶和凸集的分离描述。

**符号。**

$$
C^\circ=\{y\in\mathbb R^n:y^Tx\le1\ \text{for all }x\in C\}.
$$

**考点。** 凸性、对偶范数、分离超平面、双极定理。参考 Rockafellar, *Convex Analysis*, Chs. 13--14；Boyd--Vandenberghe, *Convex Optimization*, Sec. 2.6。

### (a) $C^\circ$ 的凸性

若 $y_1,y_2\in C^\circ$，$0\le\theta\le1$，则对任意 $x\in C$，

$$
[\theta y_1+(1-\theta)y_2]^Tx
=\theta y_1^Tx+(1-\theta)y_2^Tx
\le\theta+(1-\theta)=1.
$$

故 $\theta y_1+(1-\theta)y_2\in C^\circ$。此证明从未用到 $C$ 的凸性。

### (b) 锥的极集

若 $K$ 是锥且 $y^Tx>0$ 对某个 $x\in K$，则对任意 $t>0$，$tx\in K$，并且 $y^T(tx)$ 可任意大，不可能不超过 $1$。所以

$$
K^\circ=\{y:y^Tx\le0\ \text{for all }x\in K\}.
$$

按通常正号约定 $K^*=\{y:y^Tx\ge0\ \forall x\in K\}$，这可写为 $K^\circ=-K^*$。

### (c) 范数单位球的极集

令 $C=\{x:\|x\|\le1\}$，定义对偶范数

$$
\|y\|_* =\sup_{\|x\|\le1}y^Tx.
$$

于是定义立刻给出

$$
C^\circ=\{y:\|y\|_*\le1\}.
$$

Hölder 不等式 $y^Tx\le\|y\|_*\|x\|$ 说明右边包含于左边；对偶范数的上确界定义反向说明包含关系也成立。

### (d) 概率单纯形的极集

集合

$$
C=\{x:\mathbf1^Tx=1,\ x\succeq0\}
$$

是标准基向量 $e_1,\ldots,e_n$ 的凸包。线性函数在凸包上的最大值取在顶点，故

$$
\sup_{x\in C}y^Tx=\max_{1\le i\le n}y_i.
$$

所以

$$
C^\circ=\{y\in\mathbb R^n:\max_i y_i\le1\}
=\{y:y_i\le1,\ i=1,\ldots,n\}.
$$

### (e) 双极定理

先证 $C\subseteq(C^\circ)^\circ$。若 $x\in C$、$y\in C^\circ$，定义即给 $y^Tx\le1$，故 $x\in(C^\circ)^\circ$。

反过来，若 $x\notin C$，$C$ 闭凸且含 $0$，强分离定理给出某个 $y$ 和常数 $\alpha$，使

$$
y^Tx>\alpha\ge\sup_{z\in C}y^Tz.
$$

由 $0\in C$ 知右侧上确界非负。若它为正数，将 $y$ 乘以其倒数；若它为零，将 $y$ 乘以足够大的正常数。两种情形均可得到一个 $\tilde y$，满足

$$
\sup_{z\in C}\tilde y^Tz\le1,
\qquad \tilde y^Tx>1.
$$

第一个不等式表示 $\tilde y\in C^\circ$，第二个表示 $x\notin(C^\circ)^\circ$。这证明 $(C^\circ)^\circ\subseteq C$，从而

$$
(C^\circ)^\circ=C.
$$

**易错点。** 闭性和凸性在反向包含中不可省略；一般集合的双极是包含原点的闭凸包，而不一定是原集合本身。

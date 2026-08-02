# 2023 秋季计算与应用数学博资考逐题参考解

> [!info] 题源与答案性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-applied-math-2023-fall.pdf)，共 3 页；题面转录见 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-applied-math-2023-fall/reading.md)。
> - 本文是依据题面撰写的教学性参考解，不是官方评分答案。原卷未随附评分细则或标准解。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：Newton 法与割线法的局部收敛

**考点：** Taylor 展开、单根、局部二阶收敛。可参见 Stoer--Bulirsch, *Introduction to Numerical Analysis*, Ch. 5。

### (1) Newton 法

设 $e_k=x_k-x_*$，并记 $a=f'(x_*)$、$b=f''(x_*)$。题设给出 $a\ne0$。在 $x_*$ 处展开：

$$
f(x_*+e)=ae+\frac b2e^2+o(e^2),
$$

$$
f'(x_*+e)=a+be+o(e).
$$

因此

$$
\frac{f(x_*+e)}{f'(x_*+e)}
=\frac{ae+\frac b2e^2+o(e^2)}{a+be+o(e)}.
$$

先将分母倒数写为

$$
\frac1{a+be+o(e)}
=\frac1a\left(1-\frac ba e+o(e)\right).
$$

相乘后得到

$$
\frac{f(x_*+e)}{f'(x_*+e)}
=e-\frac{b}{2a}e^2+o(e^2).
$$

Newton 更新 $x_{k+1}=x_k-f(x_k)/f'(x_k)$ 遂给出

$$
e_{k+1}=\frac{b}{2a}e_k^2+o(e_k^2).
$$

这说明在足够小的邻域内存在常数 $C>0$ 使 $|e_{k+1}|\le C|e_k|^2$。若初值小到 $C|e_0|<1$，误差递减且始终留在该邻域，故 $x_k\to x_*$。此外，若 $b\ne0$，

$$
\lim_{k\to\infty}\frac{x_{k+1}-x_*}{(x_k-x_*)^2}
=\frac{f''(x_*)}{2f'(x_*)},
$$

即 Newton 法二阶收敛。若该系数恰为零，不能说方法失效，而应继续展开以判断是否出现更高阶收敛。

### (2) 割线法

割线更新为

$$
x_{k+1}=x_k-
\frac{x_k-x_{k-1}}{f(x_k)-f(x_{k-1})}f(x_k).
$$

对任意靠近 $x_*$ 的 $x,y$，令 $e=x-x_*$、$d=y-x_*$。由同一个 Taylor 展开，

$$
f(x)-f(y)=a(e-d)+\frac b2(e^2-d^2)+o(|e-d|\max\{|e|,|d|\}).
$$

因而

$$
\frac{f(x)-f(y)}{x-y}
=a+\frac b2(e+d)+o(\max\{|e|,|d|\}).
$$

将其代回割线步，并用 $f(x)=ae+b e^2/2+o(e^2)$，得到

$$
e_+=e-
\frac{ae+\frac b2e^2+o(e^2)}
{a+\frac b2(e+d)+o(\max\{|e|,|d|\})}
=\frac{b}{2a}ed+o(ed).
$$

取 $x=x_k,y=x_{k-1}$，便有

$$
e_{k+1}=\frac{f''(x_*)}{2f'(x_*)}e_ke_{k-1}+o(e_ke_{k-1}).
$$

由此可用“小邻域不变性”论证 $e_k\to0$，并得到题目所要求的极限。割线法不需要显式导数；代价是它一般不是二阶，而是 $p=(1+\sqrt5)/2$ 阶收敛。这里的二元误差式正是该阶数分析的起点。

**易错点：** 不能把 $f(x_k)-f(x_{k-1})$ 直接替换成 $f'(x_k)(x_k-x_{k-1})$ 后宣称结论成立；二阶项依赖于两个误差同时保留。

## 题 2：带位移 QR 迭代

**考点：** Hessenberg 约化、QR 相似变换、非降阶与收敛。参见 Golub--Van Loan, *Matrix Computations*, Chs. 7--8。

记 $H_k-\mu_kI=Q_kR_k$，其中 $Q_k$ 酉、$R_k$ 上三角。更新可改写为

$$
H_{k+1}=R_kQ_k+\mu_kI
=Q_k^*(H_k-\mu_kI)Q_k+\mu_kI
=Q_k^*H_kQ_k.
$$

所以每一步均为酉相似变换，特征值不变。

### (1) Hessenberg 结构保持

设 $H_k$ 为上 Hessenberg。由于 $H_k-\mu_kI$ 仍是上 Hessenberg，其 QR 分解可以依次用 $n-1$ 个相邻 Givens 旋转完成。第 $j$ 个旋转只作用于第 $j,j+1$ 行；消去第 $j+1,j$ 元时，不会在第二条次对角线以下填入元素。因此所得 $R_k$ 上三角，而反向累积的 $Q_k$ 具有相同的带状传播性质。

更直接地，将 $H_k=Q_kR_k+\mu_kI$ 代入上式：$R_kQ_k$ 的第 $i$ 行只可能由 $Q_k$ 的前 $i+1$ 行贡献，故 $(R_kQ_k)_{ij}=0$ 当 $i>j+1$。加上对角矩阵 $\mu_kI$ 不改变此零结构，故 $H_{k+1}$ 仍为上 Hessenberg。归纳即得全部 $H_i$ 都有该结构。

### (2) 为什么先约化为 $H_0$

一般稠密矩阵的一次 QR 分解约需 $O(n^3)$ 运算。上 Hessenberg 矩阵只有一条非零次对角线，用 $n-1$ 个 Givens 旋转即可完成一次 QR 步，代价为 $O(n^2)$。Householder 约化 $A=U_0H_0U_0^H$ 只做一次，代价 $O(n^3)$；随后每次迭代都维持 $O(n^2)$。又因 $A$ 与 $H_0$ 酉相似，二者特征值完全相同。

### (3) 不可约性

上 Hessenberg 矩阵称为不可约，是指所有次对角元 $h_{j+1,j}$ 非零。若某个 $h_{j+1,j}=0$，矩阵可分块上三角化：

$$
H=\begin{bmatrix}H_{11}&H_{12}\\0&H_{22}\end{bmatrix}.
$$

在无位移 QR 步中，块上三角结构保持；带位移时 $H-\mu I$ 仍有同一分块形式，QR 分解也可按对角块进行。因此一旦某一步可约，之后不会“重新耦合”两个块。

题设 $A$ 有 $n$ 个互异特征值，且所有 $\mu_i$ 都不是 $A$ 的特征值，于是 $H_i-\mu_iI$ 可逆。若在某个最早的步骤产生零次对角元，则相应 QR 分解会出现一个可分离的不变子空间；反推到 $H_0$，将得到由该不变子空间引起的精确 deflation。对于不可约 Hessenberg 起点，这与“最早产生”矛盾。故每个 $H_i$ 均不可约。

这里使用的关键是 $H_i-\mu_iI$ 可逆：若位移恰为特征值，最后一个对角枢轴可以为零，deflation 正是可能且通常希望发生的现象。

### (4) 尾部次对角元的估计

写

$$
H_k-\mu_kI=
\begin{bmatrix}
G_k-\mu_kI&u_k\\
\varepsilon_ke^T&\alpha_k-\mu_k
\end{bmatrix}.
$$

设 $B=G_k-\mu_kI$，$\rho_k=\|B^{-1}\|_2$。先做块消元：

$$
\begin{bmatrix}I&0\\-\varepsilon_ke^TB^{-1}&1\end{bmatrix}
\begin{bmatrix}B&u_k\\\varepsilon_ke^T&\alpha_k-\mu_k\end{bmatrix}
=
\begin{bmatrix}B&u_k\\0&s_k\end{bmatrix},
$$

其中

$$
s_k=\alpha_k-\mu_k-\varepsilon_ke^TB^{-1}u_k.
$$

随后以 Givens 旋转对左下行作 QR 消去。每次旋转把该行的大小至多乘以其与上方枢轴之比；由 $\|B^{-1}\|_2=\rho_k$，这一比的线性主项不超过 $\rho_k|\varepsilon_k|$。最后一项还携带 $|s_k|$，并且

$$
|s_k|\le |\alpha_k-\mu_k|+\rho_k\|u_k\|_2|\varepsilon_k|.
$$

故新尾部元满足

$$
|\varepsilon_{k+1}|
\le \rho_k|\varepsilon_k||s_k|
\le \rho_k^2\|u_k\|_2|\varepsilon_k|^2
+\rho_k|\alpha_k-\mu_k||\varepsilon_k|.
$$

这揭示了位移的作用：若 $\mu_k$ 接近尾部 Ritz 值 $\alpha_k$，第二项变小；当 $\varepsilon_k$ 也很小时，主导项变为二次量，产生快速 deflation。

## 题 3：Chebyshev 节点上的微分矩阵

**考点：** Lagrange 插值、谱微分。参见 Trefethen, *Spectral Methods in MATLAB*, Ch. 6。

令

$$
\ell_j(x)=\prod_{m\ne j}\frac{x-x_m}{x_j-x_m},\qquad j=0,\ldots,n.
$$

插值多项式为 $p(x)=\sum_{j=0}^np(x_j)\ell_j(x)$。逐项求导并取 $x=x_i$，

$$
p'(x_i)=\sum_{j=0}^np(x_j)\ell'_j(x_i).
$$

与微分矩阵的定义比较，立即得到

$$
D_{ij}=\ell'_j(x_i).
$$

现在取 $x_j=\cos(j\pi/n)$。令 $c_0=c_n=2$，其余 $c_j=1$。对 $i\ne j$，将乘积形式的 $\ell_j$ 在 $x_i$ 处求导可得

$$
D_{ij}=\frac{c_i}{c_j}\frac{(-1)^{i+j}}{x_i-x_j}.
$$

对角元须由“每行导数作用于常数为零”来确定，即 $\sum_jD_{ij}=0$。化简后为

$$
D_{00}=\frac{2n^2+1}{6},\qquad
D_{nn}=-\frac{2n^2+1}{6},
$$

$$
D_{ii}=-\frac{x_i}{2(1-x_i^2)},\qquad 1\le i\le n-1.
$$

**易错点：** 端点权重 $c_0,c_n$ 不能漏掉；若节点按相反顺序编号，所有矩阵行列会相应重排，但表示的线性算子不变。

## 题 4：二阶段 Runge--Kutta 法

**考点：** 显式梯形法、相容性、绝对稳定域。参见 Hairer--Nørsett--Wanner, *Solving Ordinary Differential Equations I*, Ch. II。

Butcher 表给出阶段量

$$
K_1=f(t_n,u_n),qquad K_2=f(t_n+h,u_n+hK_1),
$$

并更新

$$
u_{n+1}=u_n+\frac h2(K_1+K_2).
$$

所以题目要求的函数为

$$
F(t,u,h;f)=\frac12\left[f(t,u)+f\bigl(t+h,u+hf(t,u)\bigr)\right].
$$

为求阶数，记真解在 $(t_n,u(t_n))$ 处的全导数为 $D_tf=f_t+f_yf$。Taylor 展开给出

$$
f(t_n+h,u_n+hf(t_n,u_n))=f+hD_tf+O(h^2).
$$

故数值一步为

$$
u_{n+1}=u_n+hf+\frac{h^2}{2}D_tf+O(h^3).
$$

而真解满足

$$
u(t_n+h)=u(t_n)+hf+\frac{h^2}{2}D_tf+O(h^3).
$$

局部截断误差为 $O(h^3)$。Lipschitz 条件保证一步映射对初值稳定；离散 Gronwall 不等式遂将 $O(h^3)$ 的局部误差累积为区间上的 $O(h^2)$ 全局误差。因此方法二阶收敛。

对测试方程 $y'=\lambda y$，令 $z=h\lambda$。由 $K_1=\lambda u_n$、$K_2=\lambda(1+z)u_n$，

$$
u_{n+1}=R(z)u_n,qquad R(z)=1+z+\frac{z^2}{2}.
$$

绝对稳定域为

$$
\mathcal S=\left\{z\in\mathbb C:\left|1+z+\frac{z^2}{2}\right|\le1\right\}.
$$

在负实轴上它包含 $[-2,0]$；这给出刚性问题常用的步长限制。

## 题 5：三阶色散方程的 Lax--Friedrichs 型格式

**考点：** 一致性与 von Neumann 稳定性。参见 LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, Chs. 8--10。

令 $u_m^n=u(x_m,t_n)$，$x_m=mh$、$t_n=nk$。将真解代入格式。中心平均满足

$$
\frac{u(x+h,t)+u(x-h,t)}2
=u+\frac{h^2}{2}u_{xx}+\frac{h^4}{24}u_{xxxx}+O(h^6).
$$

五点组合为

$$
u_{m+2}-2u_{m+1}+2u_{m-1}-u_{m-2}
=2h^3u_{xxx}+\frac{h^5}{2}u_{xxxxx}+O(h^7).
$$

再用 $u(t+k)=u+ku_t+k^2u_{tt}/2+O(k^3)$ 及 $u_t=-au_{xxx}$，得到残差的首项

$$
\mathcal T
=-\frac{k}{2}u_{tt}+\frac{h^2}{2k}u_{xx}
+O\left(k^2+\frac{h^4}{k}+h^2\right).
$$

因此该格式的人工平均项带来 $h^2/k$ 量级的耗散误差；一致性至少要求 $h^2/k\to0$。

作 Fourier 模态 $u_m^n=g^ne^{\mathrm i m\xi}$。代入后

$$
g=\cos\xi+2\mathrm i\,a\frac{k}{h^3}\sin\xi(1-\cos\xi).
$$

于是

$$
|g|^2=\cos^2\xi
+4a^2\frac{k^2}{h^6}\sin^2\xi(1-\cos\xi)^2.
$$

令 $c=\cos\xi$，则稳定性要求对所有 $c\in[-1,1]$ 有

$$
4a^2\frac{k^2}{h^6}(1-c^2)(1-c)^2\le1-c^2.
$$

当 $c\ne\pm1$ 时约去 $1-c^2$，最坏情形是 $1-c=2$，故

$$
\frac{|a|k}{h^3}\le\frac14.
$$

这就是 von Neumann 稳定条件。

## 题 6：标准型线性规划的顶点与对偶

**考点：** 基可行解、弱/强对偶。参见 Bertsimas--Tsitsiklis, *Introduction to Linear Optimization*, Chs. 2--4。

可行域为

$$
P=\{x\in\mathbb R^n:Ax=b,\ x\ge0\},
$$

其中 $A$ 满行秩。

### (1) 基可行解等价于顶点

取 $m$ 个列构成可逆矩阵 $A_B$，令非基变量 $x_N=0$，并令

$$
x_B=A_B^{-1}b\ge0.
$$

这称为基可行解。若 $x=(y+z)/2$，其中 $y,z\in P$，则对所有满足 $x_i=0$ 的非基指标有 $y_i=z_i=0$，因为 $y_i,z_i\ge0$。因此

$$
A_B(y_B-z_B)=A(y-z)=0.
$$

由 $A_B$ 可逆，$y_B=z_B$，故 $y=z=x$；所以 $x$ 是顶点。

反过来，若可行点 $x$ 的正分量对应列不线性无关，则存在非零向量 $d$，满足 $Ad=0$ 且 $d_i=0$ 于 $x_i=0$ 的位置。取足够小的 $t>0$，可使 $x\pm td\ge0$，从而 $x\pm td\in P$ 且

$$
x=\frac12(x+td)+\frac12(x-td),
$$

与顶点性矛盾。因此正分量列线性无关，可补成一个基，$x$ 正是基可行解。

### (2) 对偶与强对偶

对 $Ax=b$ 引入乘子 $y\in\mathbb R^m$。若 $A^Ty\ge c$，则任意原可行 $x$ 均有

$$
b^Ty=y^TAx=x^TA^Ty\ge x^Tc.
$$

所以对偶问题为

$$
\min_{y\in\mathbb R^m}b^Ty
\quad\text{s.t.}\quad A^Ty\ge c.
$$

上式已经证明弱对偶。若原问题有最优解，则线性规划基本定理保证存在最优基可行解 $x^*$，设其基为 $B$。定义

$$
y^*=A_B^{-T}c_B.
$$

最优基的约化成本条件是 $A_N^Ty^*\ge c_N$；加上 $A_B^Ty^*=c_B$，即 $A^Ty^*\ge c$，所以 $y^*$ 对偶可行。又

$$
b^Ty^*=x_B^{*T}A_B^Ty^*=x_B^{*T}c_B=c^Tx^*.
$$

弱对偶给出的不等式在此取等，故 $y^*$ 对偶最优且两者目标值相等。

## 题 7：小参数 Sturm--Liouville 特征值问题

**考点：** 正则摄动、可解性条件。参见 Hinch, *Perturbation Methods*, Ch. 2。

问题为

$$
u''+(\lambda+\epsilon f(x))u=0,qquad u(0)=0,\quad u'(1)=0,
$$

其中 $0<\epsilon\ll1$。取展开

$$
u=u_0+\epsilon u_1+O(\epsilon^2),qquad
\lambda=\lambda_0+\epsilon\lambda_1+O(\epsilon^2).
$$

零阶问题为

$$
u_0''+\lambda_0u_0=0,qquad u_0(0)=0,\quad u_0'(1)=0.
$$

令 $\omega=\sqrt{\lambda_0}$。非零解必须是 $u_0(x)=C\sin(\omega x)$，而 $u_0'(1)=C\omega\cos\omega=0$，故

$$
\omega_n=\left(n+\frac12\right)\pi,qquad
\lambda_{0,n}=\left(n+\frac12\right)^2\pi^2,qquad n=0,1,2,\ldots.
$$

为一阶方程代入展开并收集 $\epsilon$：

$$
u_1''+\lambda_{0,n}u_1=-(\lambda_{1,n}+f(x))u_0.
$$

左边算子自伴，边界条件同为 $u_1(0)=0,u_1'(1)=0$。将上式乘以 $u_0$ 后积分，并两次分部积分；边界项因两函数满足同一边界条件而为零。因此右端必须与 $u_0$ 正交：

$$
0=-\int_0^1(\lambda_{1,n}+f(x))u_0(x)^2\,dx.
$$

故

$$
\lambda_{1,n}
=-\frac{\int_0^1 f(x)\sin^2(\omega_nx)\,dx}
{\int_0^1\sin^2(\omega_nx)\,dx}
=-2\int_0^1f(x)\sin^2\left(\left(n+\frac12\right)\pi x\right)dx.
$$

最终，至 $O(\epsilon)$ 的特征值近似为

$$
\lambda_n=
\left(n+\frac12\right)^2\pi^2
-2\epsilon\int_0^1f(x)\sin^2\left(\left(n+\frac12\right)\pi x\right)dx
+O(\epsilon^2).
$$

**易错点：** 一阶方程不能任意求一个 $u_1$ 就结束；必须先施加 Fredholm 可解性条件。它正是决定一阶特征值修正的方程。

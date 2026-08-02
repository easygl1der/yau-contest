# 2025 秋季 计算与应用数学博资考参考解

> [!info] 题源与答案性质
> - 题面以[官方原卷](../sources/exams/qzc-qe-applied-math-2025-fall.pdf)为准；[MinerU 转录](../transcripts/mineru/qzc-qe-applied-math-2025-fall/reading.md)用于检索和交叉核对。
> - 以下均为自撰教学性参考解，不是官方评分答案。
> - 题 5 后的说明是“第 6、7 题二选一，取较高分”；为复习完整性，本文件两题都解答。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1（10 分）：Newton--Schulz 矩阵求逆迭代

### 动机

把 $X_k$ 看作 $A^{-1}$ 的近似，残量 $I-AX_k$ 衡量 $AX_k$ 距离单位阵有多远。题给迭代正是使这个残量平方的 Newton--Schulz 迭代；残量一旦小于 $1$，便会以平方速度衰减。

### 符号与前提

记

$$
E_k=I-AX_k.
$$

这里 $\|\cdot\|$ 取任一相容（特别是次乘性）的矩阵范数，即 $\|UV\|\leq\|U\|\,\|V\|$。题目的条件为 $\|E_0\|<1$。

### (a) 证明可逆性与二次收敛

先直接代入迭代式：

$$
\begin{aligned}
E_{k+1}
&=I-A(2X_k-X_kAX_k)\\
&=I-2AX_k+(AX_k)^2\\
&=(I-AX_k)^2\\
&=E_k^2.
\end{aligned}
$$

因此

$$
E_k=E_0^{2^k},
\qquad
\|E_k\|\leq\|E_0\|^{2^k}\longrightarrow0.
$$

这已给出残量的二次关系：

$$
\|E_{k+1}\|\leq\|E_k\|^2.
$$

再证明 $A$ 可逆。由 $\|E_0\|<1$，Neumann 级数给出

$$
(AX_0)^{-1}=(I-E_0)^{-1}=\sum_{j=0}^{\infty}E_0^j.
$$

故 $AX_0$ 可逆。因为 $A,X_0$ 都是方阵，$AX_0$ 可逆蕴含 $A$ 可逆。于是

$$
X_k=A^{-1}(I-E_k),
$$

从而

$$
X_k-A^{-1}=-A^{-1}E_k,
\qquad
\|X_k-A^{-1}\|\leq\|A^{-1}\|\,\|E_0\|^{2^k}\to0.
$$

所以 $X_k\to A^{-1}$；相对于误差 $X_k-A^{-1}$，也有

$$
\|X_{k+1}-A^{-1}\|
\leq
\|A\|\,\|X_k-A^{-1}\|^2,
$$

这就是二次收敛。

### (b) 初值存在性的充要条件

若存在 $X_0$ 使 $\|I-AX_0\|<1$，上面的论证已经证明 $A$ 可逆。

反过来，若 $A$ 可逆，直接取

$$
X_0=A^{-1}.
$$

则 $I-AX_0=0$，故其范数严格小于 $1$。因此条件与 $A$ 非奇异等价。

### 结论

满足 $\|I-AX_0\|<1$ 时，$A$ 必可逆，且残量满足精确恒等式 $E_{k+1}=E_k^2$；故 $X_k$ 二次收敛到 $A^{-1}$。这样的初值存在当且仅当 $A$ 可逆。

### 考点

- Neumann 级数与“距单位阵足够近则可逆”。
- 矩阵迭代的误差递推。
- 残量二次收敛如何转换为近似逆的二次收敛。

### 易错点

- 只写 $E_k\to0$ 而不说明为什么这推出 $A$ 可逆。
- 使用 $\|UV\|\leq\|U\|\,\|V\|$ 却没有说明范数需相容。
- 将 $I-X_kA$ 与 $I-AX_k$ 混用；本题的直接递推针对后者。

### 教材引用

- N. J. Higham, *Accuracy and Stability of Numerical Algorithms*, 2nd ed., SIAM, 2002, Chapter 6（矩阵函数与逆的迭代）。
- G. H. Golub and C. F. Van Loan, *Matrix Computations*, 4th ed., Johns Hopkins University Press, 2013, Chapter 2（矩阵范数、可逆性）。

## 题 2（20 分）：Chebyshev 多项式、插值与 Gauss--Chebyshev 求积

### 动机

Chebyshev 多项式把三角函数的等振荡性质带到多项式逼近中。它的零点既给出小误差插值节点，也给出带权积分 $1/\sqrt{1-x^2}$ 的 Gaussian 求积节点。

### 符号

令 $\mathcal P_n$ 为次数不超过 $n$ 的实多项式空间。对 $x\in[-1,1]$，写 $x=\cos\theta$，其中 $\theta\in[0,\pi]$。第 $n+1$ 个 Chebyshev 多项式的零点为

$$
x_j=\cos\frac{(2j+1)\pi}{2(n+1)},
\qquad j=0,\ldots,n.
$$

### (a) 闭式表达

当 $x=\cos\theta$ 时，递推式变为

$$
T_{n+1}(\cos\theta)
=2\cos\theta\,T_n(\cos\theta)-T_{n-1}(\cos\theta).
$$

而余弦满足相同递推：

$$
\cos((n+1)\theta)
=2\cos\theta\cos(n\theta)-\cos((n-1)\theta).
$$

又 $T_0(\cos\theta)=1$、$T_1(\cos\theta)=\cos\theta$，由递推唯一性得到

$$
T_n(x)=\cos(n\arccos x),
\qquad |x|\leq1.
$$

当 $|x|>1$ 时，先令 $x=\cosh s$，$s=\operatorname{arccosh}x$。双曲余弦的递推同样给出

$$
T_n(x)=\cosh(n\operatorname{arccosh}x),
\qquad x>1.
$$

对 $x<-1$，由递推可知 $T_n(-x)=(-1)^nT_n(x)$；题面将该部分简记为双曲函数表达时，应结合此奇偶性理解。特别地，后续只在 $[-1,1]$ 上使用 $T_n$。

### (b) 极小一致范数

对任意满足 $p(1)=1$ 的 $p\in\mathcal P_n$，都有

$$
\|p\|_\infty
=\max_{x\in[-1,1]}|p(x)|
\geq |p(1)|=1.
$$

另一方面，由 (a) 知 $|T_n(x)|\leq1$（$x\in[-1,1]$），且 $T_n(1)=1$。所以

$$
\|T_n\|_\infty=1.
$$

上下界相同，故

$$
\min_{\substack{p\in\mathcal P_n\\p(1)=1}}\|p\|_\infty=1,
$$

并由 $p=T_n$ 取到。

### (c) Chebyshev 零点插值的误差界

设

$$
\omega_{n+1}(x)=\prod_{j=0}^{n}(x-x_j).
$$

因为 $T_{n+1}$ 的首项系数为 $2^n$，所以

$$
\omega_{n+1}(x)=2^{-n}T_{n+1}(x).
$$

标准 Lagrange 插值余项说明：对每个 $x\in[-1,1]$，存在 $\xi_x\in(-1,1)$，使

$$
f(x)-L_n(x)
=\frac{f^{(n+1)}(\xi_x)}{(n+1)!}\omega_{n+1}(x).
$$

由 $|T_{n+1}(x)|\leq1$，有

$$
|\omega_{n+1}(x)|\leq2^{-n}.
$$

代回并取上确界：

$$
\|f-L_n\|_\infty
\leq
\frac{\|f^{(n+1)}\|_\infty}{(n+1)!2^n}.
$$

### (d) Gauss--Chebyshev 求积公式与误差

作变量代换 $x=\cos\theta$。由于

$$
\frac{dx}{\sqrt{1-x^2}}=-d\theta,
$$

故

$$
I(f)=\int_0^\pi f(\cos\theta)\,d\theta.
$$

取等距中点

$$
\theta_j=\frac{(2j+1)\pi}{2(n+1)},
\qquad j=0,\ldots,n,
$$

对应节点正是上面的 $x_j=\cos\theta_j$。对次数至多 $2n+1$ 的多项式，Gaussian 求积精确，因此公式为

$$
I_{n+1}(f)
=\frac{\pi}{n+1}\sum_{j=0}^{n}f(x_j).
$$

说明误差常数。令 $H_{2n+1}$ 为在每个 $x_j$ 处作一次函数值和一次导数值匹配的 Hermite 插值多项式。则存在随 $x$ 变化的 $\xi_x\in(-1,1)$，使

$$
f(x)-H_{2n+1}(x)
=\frac{f^{(2n+2)}(\xi_x)}{(2n+2)!}\omega_{n+1}(x)^2.
$$

由于 $I_{n+1}$ 对 $H_{2n+1}$ 精确，且 $H_{2n+1}(x_j)=f(x_j)$，

$$
I(f)-I_{n+1}(f)
=I(f-H_{2n+1}).
$$

又

$$
\int_{-1}^{1}\frac{\omega_{n+1}(x)^2}{\sqrt{1-x^2}}\,dx
=2^{-2n}\int_{-1}^{1}\frac{T_{n+1}(x)^2}{\sqrt{1-x^2}}\,dx
=\frac{\pi}{2^{2n+1}}.
$$

于是

$$
|I(f)-I_{n+1}(f)|
\leq
\frac{\pi\|f^{(2n+2)}\|_\infty}{(2n+2)!2^{2n+1}}.
$$

### 结论

Chebyshev 节点同时给出插值误差界和 $(n+1)$ 节点 Gauss--Chebyshev 求积：

$$
I_{n+1}(f)=\frac{\pi}{n+1}\sum_{j=0}^n
f\!\left(\cos\frac{(2j+1)\pi}{2(n+1)}\right).
$$

### 考点

- 三角递推与 Chebyshev 多项式。
- Lagrange 插值余项及首项系数。
- 正交多项式零点、Gaussian 求积和 Hermite 余项。

### 易错点

- (b) 不必使用等振荡定理：$p(1)=1$ 立刻给出下界。
- $T_{n+1}$ 的首项系数是 $2^n$，不是 $2^{n+1}$。
- 求积权重是 $\pi/(n+1)$；节点是余弦的中点角，而非端点角。
- $|x|>1$ 的负半轴需保留 $T_n(-x)=(-1)^nT_n(x)$ 的奇偶性。

### 教材引用

- L. N. Trefethen, *Approximation Theory and Approximation Practice*, SIAM, 2013, Chapters 4--5。
- J. Stoer and R. Bulirsch, *Introduction to Numerical Analysis*, 3rd ed., Springer, 2002, Chapters 3 and 5。

## 题 3（20 分）：广义特征值与 QZ 分解

### 动机与符号

矩阵对 $(A,B)$ 的广义特征值问题为

$$
\mu Ax=\lambda Bx,
\qquad x\ne0,
\qquad |\lambda|^2+|\mu|^2=1.
$$

将 $(\lambda,\mu)$ 视为齐次坐标很重要：当 $\mu=0$ 时，对应无穷远广义特征值。酉等价变换（UET）

$$
Q^H(A,B)Z=(Q^HAZ,Q^HBZ)
$$

不改变该问题的结构，并且数值上保持 2-范数稳定。

### (a) 多于 $n$ 个特征值的例子

取

$$
A=I_n,
\qquad B=0.
$$

若取任意满足 $|\lambda|=1$ 的 $\lambda$ 并令 $\mu=0$，则对任意非零 $x$ 有

$$
\mu Ax=0=\lambda Bx.
$$

所以按照题面把归一化的 $(\lambda,\mu)$ 本身称为特征值的约定，该矩阵对有无穷多个特征值，因而多于 $n$ 个。这也说明奇异 pencil 与通常“恰有 $n$ 个有限特征值”的正则情形不同。

### (b) 同时上三角化

这是复数域上的广义 Schur 定理（QZ 分解）。下面给出归纳证明的构造核心。

对 $n=1$ 显然。设结论对 $n-1$ 阶成立。齐次多项式

$$
\det(\mu A-\lambda B)
$$

要么恒为零，要么在复射影直线中有根；两种情形都可找到一组 $(\lambda_1,\mu_1)$ 及非零向量 $x_1$，满足

$$
\mu_1Ax_1=\lambda_1Bx_1.
$$

令 $z_1=x_1/\|x_1\|_2$。上式说明 $Az_1$ 和 $Bz_1$ 共线（其中一个可为零）。取单位向量 $q_1$ 沿着这个公共方向；若二者都为零，则任取 $q_1$。将 $q_1,z_1$ 分别补全为酉矩阵 $Q_1,Z_1$ 的第一列。于是

$$
Q_1^HAZ_1=
\begin{bmatrix}
\ast&\ast\\
0&A_1
\end{bmatrix},
\qquad
Q_1^HBZ_1=
\begin{bmatrix}
\ast&\ast\\
0&B_1
\end{bmatrix}.
$$

对尾部矩阵对 $(A_1,B_1)$ 使用归纳假设，得到尾部酉矩阵 $\widehat Q,\widehat Z$ 将其同时化为上三角。令

$$
Q=Q_1\operatorname{diag}(1,\widehat Q),
\qquad
Z=Z_1\operatorname{diag}(1,\widehat Z),
$$

便得到

$$
Q^H(A,B)Z=(S,T),
$$

其中 $S,T$ 均为上三角。

### (c) 如何由 $(S,T)$ 读取特征值

因为

$$
\det(\mu S-\lambda T)
=\prod_{i=1}^{n}(\mu s_{ii}-\lambda t_{ii}),
$$

第 $i$ 个对角对给出齐次广义特征值

$$
(\lambda_i,\mu_i)
=\frac{(s_{ii},t_{ii})}{\sqrt{|s_{ii}|^2+|t_{ii}|^2}},
$$

只要 $(s_{ii},t_{ii})\ne(0,0)$。若 $t_{ii}\ne0$，其通常的有限特征值比值为

$$
\frac{\lambda_i}{\mu_i}=\frac{s_{ii}}{t_{ii}}.
$$

若 $t_{ii}=0$ 而 $s_{ii}\ne0$，则对应无穷特征值。若出现 $(s_{ii},t_{ii})=(0,0)$，该 pencil 是奇异的，不能把该位置解释为唯一的孤立特征值。

### (d) 构造 Hessenberg--triangular 形式

这是 QZ 算法的预处理步骤。对 $n=4$ 可按以下 Householder 变换执行。

1. 对 $B$ 作 QR 分解：取酉矩阵 $Q_B$，使 $Q_B^HB=R$ 上三角；将 $(A,B)$ 变为 $(Q_B^HA,R)$。
2. 在第 1 列，对 $A$ 的第 $2:4$ 行作左 Householder 变换 $H_1$，消去 $a_{31},a_{41}$，仅保留 $a_{21}$。此时 $A$ 的第 1 列满足 Hessenberg 形。
3. $H_1^HR$ 一般不再上三角。对其右下 $3\times3$ 块作右侧 Householder 或 RQ 变换 $G_1$，使 $H_1^HRG_1$ 再次上三角。右乘 $G_1$ 不改变 $A$ 第 1 列已经形成的零元。
4. 对第 2 列的第 $3:4$ 行重复：左乘 $H_2^H$ 消去 $a_{42}$，再右乘 $G_2$ 恢复 $B$ 的上三角性。

累计左右变换：

$$
Q_0=Q_BH_1H_2,
\qquad
Z_0=G_1G_2,
$$

其中每个嵌入式 Householder 只作用于尚未处理的尾部子空间。最终

$$
Q_0^H(A,B)Z_0=(A_0,B_0),
$$

且 $A_0$ 上 Hessenberg、$B_0$ 上三角。一般 $n$ 时，对 $k=1,\ldots,n-2$ 重复这个“左消元、右恢复三角”的 bulge-chasing 过程。

### 考点

- 齐次广义特征值与无穷特征值。
- 广义 Schur（QZ）分解。
- Householder 变换在结构保持算法中的左右配合。

### 易错点

- 不能在 $B$ 奇异时贸然改写成 $AB^{-1}$ 的普通特征值问题。
- 有限特征值比值是 $s_{ii}/t_{ii}$，前提是 $t_{ii}\ne0$。
- 同时上三角化需左右两个酉矩阵；它不是通常的相似变换。

### 教材引用

- G. H. Golub and C. F. Van Loan, *Matrix Computations*, 4th ed., Sections 7.7--7.8。
- L. N. Trefethen and D. Bau III, *Numerical Linear Algebra*, SIAM, 1997, Lecture 28。

## 题 4（15 分）：二维 Du Fort--Frankel 格式

### 动机与网格记号

对扩散方程

$$
u_t=u_{xx}+u_{yy},
$$

令 $u_{j,\ell}^n\approx u(jh_x,\ell h_y,n\tau)$。Du Fort--Frankel 的思路是：保留时间中心差分，但把空间二阶差分中的中心点 $u_{j,\ell}^n$ 用时间层 $n+1,n-1$ 的平均替换，从而得到显式可解且无条件稳定的三层格式。

### 格式构造

二维格式写为

$$
\frac{u_{j,\ell}^{n+1}-u_{j,\ell}^{n-1}}{2\tau}
=\frac{u_{j+1,\ell}^{n}-u_{j,\ell}^{n+1}-u_{j,\ell}^{n-1}+u_{j-1,\ell}^{n}}{h_x^2}
+\frac{u_{j,\ell+1}^{n}-u_{j,\ell}^{n+1}-u_{j,\ell}^{n-1}+u_{j,\ell-1}^{n}}{h_y^2}.
$$

解出新时间层，令

$$
\sigma=\frac{1}{h_x^2}+\frac{1}{h_y^2},
$$

则

$$
\begin{aligned}
\left(1+2\tau\sigma\right)u_{j,\ell}^{n+1}
&=\frac{2\tau}{h_x^2}\left(u_{j+1,\ell}^{n}+u_{j-1,\ell}^{n}\right)\\
&\quad+\frac{2\tau}{h_y^2}\left(u_{j,\ell+1}^{n}+u_{j,\ell-1}^{n}\right)\\
&\quad+\left(1-2\tau\sigma\right)u_{j,\ell}^{n-1}.
\end{aligned}
$$

右端只含已知层，故内部点更新是显式的。

### 一致性

把精确光滑解代入。时间中心差分为

$$
\frac{u^{n+1}-u^{n-1}}{2\tau}
=u_t+O(\tau^2).
$$

例如 $x$ 方向右端项满足

$$
\frac{u_{j+1,\ell}^{n}-u_{j,\ell}^{n+1}-u_{j,\ell}^{n-1}+u_{j-1,\ell}^{n}}{h_x^2}
=u_{xx}+O(h_x^2)+O\!\left(\frac{\tau^2}{h_x^2}\right),
$$

$y$ 方向同理。因此局部截断误差为

$$
O\!\left(
\tau^2+h_x^2+h_y^2+
\frac{\tau^2}{h_x^2}+\frac{\tau^2}{h_y^2}
\right).
$$

所以该格式在 $h_x,h_y,\tau\to0$ 且

$$
\frac{\tau}{h_x}\to0,
\qquad
\frac{\tau}{h_y}\to0
$$

时一致。它并非在任意独立趋零路径上都一致；这正是 Du Fort--Frankel 的经典代价。

### von Neumann 稳定性

代入 Fourier 模态

$$
u_{j,\ell}^n=G^n e^{\mathrm i(j\xi+\ell\eta)}.
$$

设

$$
S=\frac{1}{h_x^2}+\frac{1}{h_y^2},
\qquad
C=\frac{\cos\xi}{h_x^2}+\frac{\cos\eta}{h_y^2}.
$$

得到放大因子方程

$$
(1+2\tau S)G^2-4\tau C G+(2\tau S-1)=0.
$$

因为 $|C|\leq S$，该二次多项式的两个根满足 $|G|\leq1$；边界 Fourier 模态可能有 $G=1$。等价地，对归一化二次多项式使用二阶 Jury 判据即可验证三个 Schur 条件对任意 $\tau>0$ 均成立。因此该格式 von Neumann 无条件稳定。

### 结论

二维 Du Fort--Frankel 格式显式且无条件稳定，但一致性要求较强的网格关系 $\tau/h_x\to0$、$\tau/h_y\to0$。无条件稳定不等于可以任意取大时间步而仍保持准确。

### 考点

- 三层差分格式的构造与整理。
- 截断误差中 $\tau^2/h^2$ 项的来源。
- Fourier 放大因子与稳定性、精度的区分。

### 易错点

- 把“无条件稳定”误写成“无条件一致”。
- 漏掉二维中两个方向各自的 $\tau^2/h_d^2$ 项。
- 写成隐式格式；解出 $u^{n+1}_{j,\ell}$ 后应看出内部更新不要求解线性方程组。

### 教材引用

- R. J. LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, SIAM, 2007, Chapters 8--9。
- G. D. Smith, *Numerical Solution of Partial Differential Equations: Finite Difference Methods*, 3rd ed., Oxford University Press, 1985。

## 题 5（15 分）：隐式时间平均波动格式的稳定性

### 动机与重写

右端是空间二阶差分在三个时间层的加权平均。记

$$
\delta_{xx}u_j^n
=\frac{u_{j+1}^n-2u_j^n+u_{j-1}^n}{h^2}.
$$

题给格式可简写为

$$
\frac{u_j^{n+1}-2u_j^n+u_j^{n-1}}{\tau^2}
=\frac14\delta_{xx}u_j^{n+1}
+\frac12\delta_{xx}u_j^n
+\frac14\delta_{xx}u_j^{n-1}.
$$

### von Neumann 分析

取 Fourier 模态

$$
u_j^n=G^n e^{\mathrm i j\theta}.
$$

由于

$$
\delta_{xx}e^{\mathrm i j\theta}
=-\frac{4\sin^2(\theta/2)}{h^2}e^{\mathrm i j\theta},
$$

令

$$
q=\frac{\tau^2}{h^2}\sin^2\frac{\theta}{2}\geq0.
$$

代入并约去公共因子，得到

$$
G+G^{-1}-2
=-q\left(G+2+G^{-1}\right).
$$

故

$$
G+G^{-1}
=2\frac{1-q}{1+q}.
$$

右端属于区间 $[-2,2]$，因为

$$
-1\leq\frac{1-q}{1+q}\leq1
\qquad(q\geq0).
$$

于是可写

$$
G=e^{\pm\mathrm i\varphi},
\qquad
\cos\varphi=\frac{1-q}{1+q},
$$

并得到 $|G|=1$。该结论对任意 $\tau/h$ 和任意 Fourier 波数都成立。

### 结论

该差分格式 von Neumann 无条件稳定，且为中性稳定：无粘性波动的每个 Fourier 模态不发生数值振幅增长或衰减。它仍可能存在相速度误差，稳定性本身不保证色散精度。

### 考点

- Fourier 模态代入三层格式。
- 离散 Laplacian 的特征值。
- 放大因子 $|G|=1$ 与无条件稳定。

### 易错点

- 将右端的 $1/4,1/2,1/4$ 权重漏合并为 $(G+2+G^{-1})/4$。
- 看到波动方程便机械套显式中心格式的 CFL 条件；本题格式含 $n+1$ 层空间差分，结论不同。

### 教材引用

- R. D. Richtmyer and K. W. Morton, *Difference Methods for Initial-Value Problems*, 2nd ed., Wiley, 1967, Chapters 3--4。
- R. J. LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, SIAM, 2007, Chapter 10。

## 题 6（20 分）：Rayleigh 振子的多重尺度近似

### 动机

直接设 $y=y_0+\epsilon y_1+\cdots$ 会在 $t=O(\epsilon^{-1})$ 产生随 $t$ 增长的共振项，不能描述题目要求的“大时间”行为。引入慢时间 $T=\epsilon t$，让振幅在慢尺度上演化，可以消去该世俗项。

### 符号与展开

令

$$
T=\epsilon t,
\qquad
y(t;\epsilon)=y_0(t,T)+\epsilon y_1(t,T)+O(\epsilon^2).
$$

导数展开为

$$
\frac{d}{dt}=D_0+\epsilon D_1+O(\epsilon^2),
\qquad
\frac{d^2}{dt^2}=D_0^2+2\epsilon D_0D_1+O(\epsilon^2),
$$

其中 $D_0=\partial/\partial t$、$D_1=\partial/\partial T$。取满足初始相位的主项

$$
y_0=R(T)\sin t.
$$

### (a) 消除世俗项并构造近似

$O(1)$ 方程为

$$
D_0^2y_0+y_0=0,
$$

已由上述 $y_0$ 满足。$O(\epsilon)$ 方程为

$$
D_0^2y_1+y_1
=-2D_0D_1y_0-
\left[\frac13(D_0y_0)^3-D_0y_0\right].
$$

计算

$$
D_0D_1y_0=R_T\cos t,
\qquad
\cos^3t=\frac{3\cos t+\cos3t}{4}.
$$

于是右端化为

$$
\left(R-2R_T-\frac{R^3}{4}\right)\cos t
-\frac{R^3}{12}\cos3t.
$$

其中 $\cos t$ 与齐次解共振，必须令其系数为零：

$$
R_T=\frac{R}{2}\left(1-\frac{R^2}{4}\right).
$$

初始条件给出 $R(0)=2a$。令 $z=R^2/4$，则

$$
z_T=z(1-z),
\qquad
z(0)=a^2,
$$

故

$$
R(T)=\frac{2}{\sqrt{1+(a^{-2}-1)e^{-T}}}.
$$

非共振方程的一组解为

$$
y_1=\frac{R(T)^3}{96}\left(\cos3t-\cos t\right).
$$

这里附加的 $-\cos t$ 齐次项用于使 $y_1(0)=0$；也有 $\partial_ty_1(0)=0$。因此满足给定初值并在 $t=O(\epsilon^{-1})$ 时间尺度上有效的一阶近似为

$$
y_{\mathrm{app}}(t)
=R(\epsilon t)\sin t
+\epsilon\frac{R(\epsilon t)^3}{96}
\left(\cos3t-\cos t\right).
$$

若只保留主导慢振幅近似，则为

$$
y_{\mathrm{lead}}(t)=R(\epsilon t)\sin t.
$$

### (b) 精度

代入 $y_{\mathrm{app}}$ 后，方程残量为 $O(\epsilon^2)$。在固定时间区间上，通常可得到解误差 $O(\epsilon^2)$；在本题关心的长时间区间 $0\leq t\leq T_*/\epsilon$ 上，一阶多重尺度/平均法近似一般保证为 $O(\epsilon)$ 量级。

关键结论是：该近似在慢时间 $T=\epsilon t=O(1)$ 内保持一致有效，而普通正则摄动展开会出现 $\epsilon t\sin t$ 型世俗增长，在同一时间尺度上失效。

### (c) 相平面轨道

主导阶下

$$
y\approx R(\epsilon t)\sin t,
\qquad
y'\approx R(\epsilon t)\cos t.
$$

故相平面近似满足

$$
y^2+(y')^2\approx R(\epsilon t)^2.
$$

由振幅方程可知：

- 若 $0<a<1$，则 $R(0)=2a<2$，振幅增大，轨道由内向外螺旋。
- 若 $a>1$，则 $R(0)>2$，振幅减小，轨道由外向内螺旋。
- 若 $a=1$，则 $R\equiv2$，主导轨道为半径 $2$ 的闭轨道。

因此 $R=2$ 是稳定极限环；$O(\epsilon)$ 的三次谐波修正只会使圆发生很小的形变。

### 考点

- 多重尺度法与慢时间。
- 共振项（世俗项）的消除条件。
- Rayleigh 振子的稳定极限环与平均振幅方程。

### 易错点

- 把 $R_T$ 当成对快时间 $t$ 的导数。
- 忘记 $\cos^3t=(3\cos t+\cos3t)/4$，导致振幅方程常数错误。
- 将残量 $O(\epsilon^2)$ 直接说成对 $t=O(\epsilon^{-1})$ 的解误差也是 $O(\epsilon^2)$。

### 教材引用

- A. H. Nayfeh, *Perturbation Methods*, Wiley, 1973, Chapters 4--6。
- J. Kevorkian and J. D. Cole, *Multiple Scale and Singular Perturbation Methods*, Springer, 1996, Chapters 2--3。

## 题 7（20 分）：二范数残量加一范数正则的对偶与稀疏性

### 动机与符号

原问题是平方根 LASSO 型凸优化：

$$
\min_{x\in\mathbb R^n}\|Ax-b\|_2+\gamma\|x\|_1.
$$

它用 $\ell_1$ 项鼓励稀疏，同时没有把残量平方。引入 $y=Ax-b$ 后，两个范数的共轭约束会分别产生单位 2-范数球和 $\ell_\infty$ 球。

### (a) Lagrange 对偶

考虑等价问题

$$
\min_{x,y}\ \|y\|_2+\gamma\|x\|_1
\quad\text{s.t.}\quad Ax-b-y=0.
$$

令 $r\in\mathbb R^m$ 为该约束的乘子，Lagrangian 为

$$
\mathcal L(x,y,r)
=\|y\|_2+\gamma\|x\|_1+r^T(Ax-b-y).
$$

先对 $y$ 取下确界。由范数的共轭关系，

$$
\inf_y\left(\|y\|_2-r^Ty\right)
=\begin{cases}
0,&\|r\|_2\leq1,\\
-\infty,&\|r\|_2>1.
\end{cases}
$$

再对 $x$ 取下确界：

$$
\inf_x\left(\gamma\|x\|_1+(A^Tr)^Tx\right)
=\begin{cases}
0,&\|A^Tr\|_\infty\leq\gamma,\\
-\infty,&\text{否则}.
\end{cases}
$$

所以对偶问题为

$$
\begin{aligned}
\max_{r\in\mathbb R^m}\quad&-b^Tr\\
\text{s.t.}\quad&\|r\|_2\leq1,\\
&\|A^Tr\|_\infty\leq\gamma.
\end{aligned}
$$

原问题始终可行且目标连续凸；例如取 $x=0,y=-b$ 即可满足约束。因此标准凸对偶条件下可用 KKT 条件刻画最优性。

### (b) KKT 条件推出两个等式

设 $x^*$ 最优且 $y^*=Ax^*-b\ne0$。对 $y$ 的驻点条件给出

$$
r=\frac{y^*}{\|y^*\|_2}
=\frac{Ax^*-b}{\|Ax^*-b\|_2}.
$$

这正是题目定义的 $r$，并且 $\|r\|_2=1$。对 $x$ 的驻点条件为

$$
0\in A^Tr+\gamma\,\partial\|x^*\|_1.
$$

即存在 $z\in\partial\|x^*\|_1$ 使

$$
A^Tr+\gamma z=0.
$$

由于任何此类 $z$ 都满足 $\|z\|_\infty\leq1$，立刻得到

$$
\|A^Tr\|_\infty\leq\gamma.
$$

再左乘 $(x^*)^T$。利用次梯度恒等式 $z^Tx^*=\|x^*\|_1$，有

$$
r^TAx^*+\gamma\|x^*\|_1=0.
$$

这就是所需结论。

### (c) 严格列范数阈值导致零系数

设 $a_i$ 是 $A$ 的第 $i$ 列，且 $\|a_i\|_2<\gamma$。由 (b) 的对偶可行性和 Cauchy--Schwarz 不等式，

$$
|(A^Tr)_i|
=|a_i^Tr|
\leq\|a_i\|_2\|r\|_2
<\gamma.
$$

若反设 $x_i^*\ne0$，则 $\ell_1$ 范数在该坐标的次梯度唯一：

$$
z_i=\operatorname{sign}(x_i^*).
$$

驻点条件的第 $i$ 个分量变成

$$
(A^Tr)_i=-\gamma\operatorname{sign}(x_i^*),
$$

从而 $|(A^Tr)_i|=\gamma$，与严格不等式矛盾。因此

$$
x_i^*=0.
$$

### 结论

对偶变量 $r$ 是归一化残量，并同时受两个球约束：$\|r\|_2\leq1$ 和 $\|A^Tr\|_\infty\leq\gamma$。若某列 $a_i$ 的长度严格小于正则参数 $\gamma$，它不可能支撑一个非零最优系数。

### 考点

- 范数与对偶范数：$\ell_2$ 对偶于 $\ell_2$，$\ell_1$ 对偶于 $\ell_\infty$。
- Lagrange 对偶函数的有限性条件。
- KKT、次梯度与稀疏阈值论证。

### 易错点

- 对偶目标的符号由约束写法决定；若把约束写成 $y-Ax+b=0$，可通过 $r\mapsto-r$ 得到等价形式。
- $Ax^*-b=0$ 时不能定义题中的归一化 $r$；本小问明确排除了该情况。
- (c) 需要严格不等式 $\|a_i\|_2<\gamma$；等号时不能推出 $x_i^*=0$。

### 教材引用

- S. Boyd and L. Vandenberghe, *Convex Optimization*, Cambridge University Press, 2004, Chapters 5--6。
- S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing*, Birkhauser, 2013, Chapter 4。

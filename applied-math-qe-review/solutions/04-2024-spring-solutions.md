# 2024 春季计算与应用数学博资考逐题参考解

> [!info] 题源与性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-applied-math-2024-spring.pdf)；并参照 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-applied-math-2024-spring/reading.md) 核对。
> - 本文为教学性参考解，非官方评分答案。Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：最佳秩 $k$ 逼近

**考点：** SVD、谱范数和 Frobenius 范数。

令 $A=U\Sigma V^*$ 为奇异值分解，且 $\sigma_1\geq\cdots\geq\sigma_n\geq0$。取截断 SVD

$$
X_k=U(:,1:k)\operatorname{diag}(\sigma_1,\ldots,\sigma_k)V(:,1:k)^*.
$$

则 $\operatorname{rank}(X_k)\leq k$，并且

$$
\|A-X_k\|_2=\sigma_{k+1},\qquad
\|A-X_k\|_F^2=\sum_{j=k+1}^n\sigma_j^2.
$$

证明谱范数最优：令 $E=\operatorname{span}\{v_1,\ldots,v_{k+1}\}$。任取秩至多 $k$ 的 $B$，则 $B|_E$ 有非零核向量 $z$；规范化为 $\|z\|_2=1$，于是

$$
\|(A-B)z\|_2=\|Az\|_2\geq\sigma_{k+1}.
$$

故 $\|A-B\|_2\geq\sigma_{k+1}$。将同一论证在正交奇异方向上的平方长度相加，得到 Frobenius 下界 $\sum_{j>k}\sigma_j^2$。因此 $X_k$ 同时是两种范数下的最优解。

**易错点：** 当 $\sigma_k=\sigma_{k+1}$ 时最优矩阵未必唯一，但最小误差仍由上式给出。

## 题 2：Gauss--Seidel 迭代

**考点：** 矩阵分裂、严格对角占优和 SPD。

原题逐分量公式的分母应为 $a_{ii}$。写 $A=D-L-U$，逐行更新移项即得

$$
(D-L)x^{(k+1)}=Ux^{(k)}+b,
$$

即

$$
x^{(k+1)}=(D-L)^{-1}Ux^{(k)}+(D-L)^{-1}b.
$$

令 $x_*=A^{-1}b$、$e^{(k)}=x^{(k)}-x_*$。则

$$
e_i^{(k+1)}
=-\frac{1}{a_{ii}}\left(\sum_{j<i}a_{ij}e_j^{(k+1)}
+\sum_{j>i}a_{ij}e_j^{(k)}\right).
$$

若 $A$ 严格对角占优，$Av=0$ 且 $|v_i|=\|v\|_\infty$ 会导致

$$
|a_{ii}||v_i|
\leq\sum_{j\ne i}|a_{ij}||v_j|
<|a_{ii}||v_i|,
$$

故 $A$ 可逆。对上述误差式按 $i=1,\ldots,n$ 归纳，可得某个 $q<1$ 使 $\|e^{(k+1)}\|_\infty\leq q\|e^{(k)}\|_\infty$，从而收敛。

若 $A=A^\top\succ0$，令 $\Phi(x)=\frac12x^\top Ax-b^\top x$。一次 GS 更新恰是对单个坐标精确极小化；若改变量为 $s_i$，则

$$
\Phi(x+s_ie_i)-\Phi(x)=-\frac12a_{ii}s_i^2\leq0.
$$

又 $\Phi(x)-\Phi(x_*)=\frac12\|x-x_*\|_A^2$。能量下降且严格凸，任意极限点均满足 $Ax=b$；解唯一，故全序列收敛。

## 题 3：Hilbert 矩阵

**考点：** Gram 矩阵、Rayleigh 商、Hilbert 不等式。

对非零 $c\in\mathbb R^n$，

$$
c^\top H_nc
=\int_0^1\left(\sum_{i=1}^nc_it^{i-1}\right)^2dt>0.
$$

故 $H_n\succ0$。把 $H_n$ 嵌入为 $H_{n+1}$ 左上主块。取 $H_n$ 的正 Perron 特征向量 $v$，向量 $(v,\varepsilon)^\top$ 的 Rayleigh 商含有正交叉项 $2\varepsilon\sum_i v_i/(i+n)$，故对小的 $\varepsilon>0$ 严格大于 $\rho(H_n)$，于是 $\rho(H_{n+1})>\rho(H_n)$。

Hilbert 不等式给出

$$
\sum_{i,j\geq1}\frac{c_ic_j}{i+j-1}\leq\pi\sum_{i\geq1}c_i^2.
$$

因此 $\rho(H_n)\leq\pi$。以截断的 $c_i\approx i^{-1/2}$ 代入并与相应二重积分比较，归一化 Rayleigh 商可任意接近 $\pi$。单调有界序列遂满足 $\rho(H_n)\uparrow\pi$。

## 题 4：三步热方程格式

**考点：** 截断误差与 Von Neumann 稳定性。

把精确解代入并在 $t_n$ 展开，再用 $u_t=a^2u_{xx}$，残量为

$$
\tau_j^n=(\theta-\tfrac12)k u_{tt}
-\tfrac13k^2u_{ttt}
-\frac{a^2h^2}{12}u_{xxxx}
+O(k^3+kh^2+h^4).
$$

所以一般为 $O(k+h^2)$；$\theta=\frac12$ 时一阶时间项消失，达到 $O(k^2+h^2)$。

令 $u_j^n=g^ne^{\mathrm i j\xi h}$，记 $\mu=4a^2kh^{-2}\sin^2(\xi h/2)\geq0$，得到

$$
(1+\theta+\mu)g^2-(1+2\theta)g+\theta=0.
$$

Jury 条件中的量为 $\mu$、$2+4\theta+\mu$、$1+\mu$，均非负。因此对 $\theta\geq0$，格式无条件稳定。

## 题 5：离散最大值原理

**考点：** 单调差分算子与 $\ell_\infty$ 稳定性。

若 $u_r=M>0$ 为内点最大值，则 $u_{r\pm1}\leq M$，故

$$
(Lu)_r\geq(b_r-a_r-c_r+q_r)M=d_rM\geq0.
$$

若同时 $Lu\leq0$，只能取等；等号迫使相邻值同为 $M$，沿网格传播可知除常数情形外不可能在内部取得正最大值。

对 $Lu=\varphi$ 且边界为零，若 $M=\max_j|u_j|$ 在正最大内点取得，则

$$
d_rM\leq\varphi_r\leq\max_j|\varphi_j|.
$$

对 $-u$ 再作一次同样论证，便有

$$
\|u\|_\infty\leq\max_{1\leq j\leq M-1}\frac{|\varphi_j|}{d_j}.
$$

## 题 6：强凸子水平集

**考点：** Hessian 下界与强凸性。

子水平集是凸集 $S$ 与凸函数 $f$ 的子水平集，故凸；由 $S$ 闭和 $f$ 连续也知其闭。对 $x$ 在子水平集内，线段 $[x^0,x]$ 仍在其中。沿该线段积分 Hessian 条件，得

$$
f(x)\geq f(x^0)+\nabla f(x^0)^\top(x-x^0)
+\frac m2\|x-x^0\|_2^2.
$$

又 $f(x)\leq f(x^0)$。令 $r=\|x-x^0\|_2$，Cauchy--Schwarz 给出

$$
\frac m2r^2\leq\|\nabla f(x^0)\|_2r,
\qquad
r\leq\frac{2\|\nabla f(x^0)\|_2}{m}.
$$

因此该子水平集包含在有限半径球内，故有界。

## 题 7：线性规划

**考点：** 松弛变量与最优性上界。

加入 $s_1,s_2\geq0$ 后，标准等式形式为

$$
\max\ 3x_1+2x_2+15x_3,
$$

$$
x_1+x_2+x_3+s_1=12,\qquad
2x_1+x_2+5x_3+s_2=18,
$$

且全部变量非负。由第二个约束，

$$
3x_1+2x_2+15x_3
=3(2x_1+x_2+5x_3)-3x_1-x_2
\leq54.
$$

取 $x_1=x_2=0$、$x_3=18/5$ 可行且目标值为 $54$。因此

$$
x_*=(0,0,18/5)^\top,\qquad f_*=54.
$$

## 参考文献

1. [官方原卷](../sources/exams/qzc-qe-applied-math-2024-spring.pdf)。
2. G. H. Golub and C. F. Van Loan, *Matrix Computations*, 4th ed., 2013：SVD、迭代法与 Hilbert 矩阵。
3. R. J. LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, 2007：截断误差、稳定性与最大值原理。
4. D. P. Bertsekas, *Nonlinear Programming*, 3rd ed., 2016：强凸性与子水平集。

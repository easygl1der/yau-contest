# 2025 春季计算与应用数学博资考参考解

> [!info] 题源与性质
> - 题源：[官方原卷](../sources/exams/qzc-qe-applied-math-2025-spring.pdf)，并与 [MinerU 阅读稿](../transcripts/mineru/qzc-qe-applied-math-2025-spring/reading.md) 逐页核对。
> - 本文是教学性参考解；未发现随题面公开的官方评分答案。
> - 只覆盖原卷第 1--6 题。Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：周期梯形公式

**动机、符号与考点。** 等距周期节点会消去多数 Fourier 模态。设

$$
f(x)=\sum_{\ell\in\mathbb Z}\widehat f_\ell e^{\mathrm i\ell x},
\qquad
\widehat f_\ell=\frac1{2\pi}\int_0^{2\pi}f(x)e^{-\mathrm i\ell x}\,dx.
$$

有限等比和给出 $h\sum_{j=1}^ne^{\mathrm i\ell jh}=2\pi$（当 $n\mid\ell$）或 $0$（否则），故

$$
I_h^{\mathrm{Tr}}(f)-I(f)=2\pi\sum_{q\ne0}\widehat f_{qn}.
$$

若 $f\in C^m$，并且导数满足周期端点匹配，分部积分 $m$ 次得

$$
\widehat f_\ell=\frac{1}{2\pi(\mathrm i\ell)^m}
\int_0^{2\pi}f^{(m)}(x)e^{-\mathrm i\ell x}\,dx.
$$

于是 $|\widehat f_\ell|\leq C|\ell|^{-m}$，代入别名和（$m>1$）：

$$
|I-I_h^{\mathrm{Tr}}|\leq 2\pi Cn^{-m}\sum_{q\ne0}|q|^{-m}=O(h^m).
$$

$ m=1 $ 时由小区间积分余项可得 $O(h)$。若 $f$ 能解析延拓到 $|\operatorname{Im}z|<\rho$，则 $|\widehat f_\ell|\leq Ce^{-\rho|\ell|}$，从而

$$
|I-I_h^{\mathrm{Tr}}|\leq4\pi C\frac{e^{-\rho n}}{1-e^{-\rho n}},
$$

即指数收敛。

**结论与易错点。** 周期性不可省略；非周期端点会留下边界误差项。[LeVeque, Ch. 12]

## 题 2：重根与 Newton 法

**动机、定义与考点。** 写 $m$ 重根为

$$
f(x)=(x-\alpha)^m g(x),\qquad g(\alpha)\ne0,
$$

并令 $e_k=x_k-\alpha$。于是

$$
f'(x)=(x-\alpha)^{m-1}[mg(x)+(x-\alpha)g'(x)].
$$

普通 Newton 法的误差精确满足

$$
e_{k+1}=
\frac{(m-1)g(\alpha+e_k)+e_kg'(\alpha+e_k)}
{mg(\alpha+e_k)+e_kg'(\alpha+e_k)}e_k.
$$

所以 $m=1$ 时 $e_{k+1}=O(e_k^2)$；$m>1$ 时

$$
e_{k+1}=\frac{m-1}{m}e_k+O(e_k^2),
$$

只有线性收敛。已知重数时，修正步 $x_{k+1}=x_k-mf(x_k)/f'(x_k)$ 给出

$$
e_{k+1}=-\frac{e_k^2g'(\alpha+e_k)}
{mg(\alpha+e_k)+e_kg'(\alpha+e_k)}=O(e_k^2).
$$

未知 $m$ 时可用 Schröder 型步

$$
x_{k+1}=x_k-\frac{f(x_k)f'(x_k)}
{[f'(x_k)]^2-f(x_k)f''(x_k)},
$$

其主误差项消失，故二次、特别是超线性收敛。

**易错点。** 普通 Newton 在重根处的线性因子是 $(m-1)/m$，不是 $1/m$。[Ortega--Rheinboldt, Ch. 10]

## 题 3：Sherman--Morrison 公式

**动机与符号。** 令 $c=1+v^\top A^{-1}u$。直接相乘：

$$
(A+uv^\top)\left(A^{-1}-\frac{A^{-1}uv^\top A^{-1}}{c}\right)
=I+\frac{uv^\top A^{-1}}c-\frac{uv^\top A^{-1}}c=I.
$$

故 $c\ne0$ 时公式成立。

题中 $\cos(t_j-s_k)=\cos t_j\cos s_k+\sin t_j\sin s_k$。令 $U=[p\ q]$、$V=[r\ w]$，其中 $p_j=\cos t_j,q_j=\sin t_j,r_j=\cos s_j,w_j=\sin s_j$，则

$$
A=4nI+UV^\top,\qquad G=I_2+(4n)^{-1}V^\top U.
$$

Woodbury 与行列式引理给出

$$
A^{-1}=\frac1{4n}I-\frac1{(4n)^2}UG^{-1}V^\top,
\qquad
\det A=(4n)^n\det G.
$$

并且 $Ab=4nb+U(V^\top b)$。所有所需内积以及 $2\times2$ 的逆都只需 $O(n)$。

**易错点。** $A^{-1}$ 应以低秩表示或“作用于向量”的方式输出；显式打印稠密逆矩阵需 $O(n^2)$。[Golub--Van Loan, Sec. 2.1]

## 题 4：耦合 Crank--Nicolson 格式

**定义与动机。** 令 $\delta_{xx}w_j=(w_{j+1}-2w_j+w_{j-1})/h^2$。题给格式是

$$
\frac{u^{n+1}-u^n}{\tau}=-\delta_{xx}\frac{v^{n+1}+v^n}{2},
\qquad
\frac{v^{n+1}-v^n}{\tau}=\delta_{xx}\frac{u^{n+1}+u^n}{2}.
$$

时间中心差分与空间中心差分分别为二阶，故局部截断误差为 $O(\tau^2+h^2)$。

对 Fourier 模，令 $\lambda=-4h^{-2}\sin^2(\xi h/2)\leq0$，$z^n=(\widehat u^n,\widehat v^n)^\top$。则

$$
\left(I-\frac{\tau\lambda}{2}J\right)z^{n+1}
=\left(I+\frac{\tau\lambda}{2}J\right)z^n,
\qquad
J=\begin{pmatrix}0&-1\\1&0\end{pmatrix}.
$$

因 $J^\top=-J$，该 Cayley 变换满足 $G^\ast G=I$。每个频率的 $|\widehat u|^2+|\widehat v|^2$ 守恒，因此无条件稳定。

**易错点。** 空间符号 $\lambda$ 非正；不能据此错误地判定隐式项“放大”。[LeVeque, Ch. 8]

## 题 5：Lax--Wendroff 能量与边界

**动机与符号。** 令 $\nu=a\tau/h$。用移位算子展开题给格式，并在 $\ell^2$ 内积中使用移位不变性，得到

$$
\|u^{n+1}\|_2^2
=\|u^n\|_2^2-\frac12\nu^2(1-\nu^2)
\left(\|\delta_x^+u^n\|_2^2-
\langle\delta_x^+u^n,\delta_x^-u^n\rangle\right).
$$

Fourier 表示表明括号非负；故 $|\nu|\leq1$ 时能量不增，格式稳定。

当 $a>0$，$x=1$ 为出流端。取简单的零阶外推

$$
u_{M+1}^n=u_M^n,
$$

再与入流边界 $u_0^n=0$ 联用，不会由出流端注入能量，并与 $0\leq\nu\leq1$ 的稳定估计相容。

**易错点。** $a>0$ 的入流端是左端，而非右端。[Gustafsson--Kreiss--Oliger, Ch. 5]

## 题 6：三次阻尼振子

**动机、定义与考点。** 取快慢时间 $t_0=t,T=\epsilon t$，并设

$$
y=y_0(t_0,T)+\epsilon y_1(t_0,T)+O(\epsilon^2),
\qquad y_0=A(T)\cos t_0.
$$

$O(\epsilon)$ 方程为

$$
(D_0^2+1)y_1=-2D_0D_1y_0-(D_0y_0)^3.
$$

利用 $D_0y_0=-A\sin t_0$ 及 $\sin^3t_0=(3\sin t_0-\sin3t_0)/4$，消去共振项得到

$$
A'(T)=-\frac38A(T)^3,\qquad A(0)=1.
$$

故

$$
A(T)=\left(1+\frac34T\right)^{-1/2},
$$

而非共振部分可取 $y_1=A^3\sin(3t_0)/32$。主要渐近解是

$$
y(t)=\left(1+\frac34\epsilon t\right)^{-1/2}\cos t+O(\epsilon).
$$

**结论与易错点。** 该近似在 $t=O(\epsilon^{-1})$ 上一致有效，并给出正确的 $t^{-1/2}$ 振幅衰减。慢时间必须是 $T=\epsilon t$，否则会遗留世俗项。[Nayfeh, Ch. 3]

## 参考文献

1. [2025 春官方原卷](../sources/exams/qzc-qe-applied-math-2025-spring.pdf)。
2. R. J. LeVeque, *Finite Difference Methods for Ordinary and Partial Differential Equations*, SIAM, 2007。
3. G. H. Golub and C. F. Van Loan, *Matrix Computations*, 4th ed., Johns Hopkins, 2013。
4. J. M. Ortega and W. C. Rheinboldt, *Iterative Solution of Nonlinear Equations in Several Variables*, SIAM, 2000。
5. B. Gustafsson, H.-O. Kreiss, and J. Oliger, *Time Dependent Problems and Difference Methods*, 2nd ed., Wiley, 2013。
6. A. H. Nayfeh, *Perturbation Methods*, Wiley, 2000。

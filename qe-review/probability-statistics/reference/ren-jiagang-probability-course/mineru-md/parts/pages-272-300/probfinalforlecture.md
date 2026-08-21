## 10 中心极限定理中的余项估计

本章恒设 $\xi_{1}, \xi_{2}, \cdots$ 独立同分布, 且

$$
E[\xi_{1}] = 0, E[\xi_{1}^{2}] = 1.
$$

令

$$
S_{n} := \sum_{k = 1}^{n} \xi_{k}.
$$

则由中心极限定理, 对任意 $\varphi \in C_{b}$ , 有

$$
\lim_{n \to \infty} E[\varphi(n^{- \frac{1}{2}} S_{n})] = \frac{1}{\sqrt{2 \pi}} \int_{\mathbb{R}} \varphi(x) e^{- \frac{x^{2}}{2}} dx.
$$

或者, 用分布函数的语言, 就是

$$
\lim_{n \to \infty} F_{n}(y) = \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{y} e^{- \frac{x^{2}}{2}} dx \forall y,
$$

其中 $F_{n}$ 是 $n^{- \frac{1}{2}} S_{n}$ 的分布函数. 但无论哪一种表述, 我们都没有得到收敛速度的定量估计. 本章我们就做出这样一些估计.

## 10.1 Lindeberg定理

我们曾经使用特征函数证明了中心极限定理. 本节我们将不使用特征函数而证明类似的结果. 为突出思想, 我们将只考虑独立同分布情形, 但实际上将定理的叙述和证明方法略加修改后, 本节的结果可推广到独立但不同分布的情形. 此外, 同样是为了突出思想, 同时也是为了得到简洁的收敛速度, 我们将假定三阶矩存在, 记 $\tau : = E[| \xi_{1} |^{3}]$ , 并假设 $\varphi \in C^{3}(\mathbb{R}, \mathbb{R})$ 且

$$
\begin{array}{c} \sup_{x \in \mathbb{R}} \frac{| \varphi(x) | + | \varphi^{\prime}(x) | + | \varphi^{\prime \prime}(x) |}{1 + | x |^{3}} < \infty, \\ C := \sup_{x \in \mathbb{R}} | \varphi^{\prime \prime \prime}(x) | < \infty.\end{array}
$$

这些条件在更细致的分析下可以减弱, 但我们不展开讨论了.

我们将证明下面的:

定理 10.1.1 (Lindeberg<sup>1</sup>定理). 设 $\tau : = E[| \xi_{1} |^{3}] < \infty,$ , 则

$$
\left| E[\varphi(n^{- \frac{1}{2}} S_{n})] - \frac{1}{\sqrt{2 \pi}} \int_{\mathbb{R}} \varphi(x) e^{- \frac{x^{2}}{2}} dx \right| \leqslant \frac{1}{3} \left(\sqrt{\frac{2}{\pi}} + \frac{1}{2} \tau\right) Cn^{- \frac{1}{2}}.
$$

证明. 取 $\eta_{1}, \cdot \cdot \cdot, \eta_{n} \sim N(0, 1), \eta_{1}, \cdot \cdot \cdot, \eta_{n}$ 独立, 且 $\{\eta_{1}, \cdots, \eta_{n}\}$ 与 $\{\xi_{1}, \cdots, \xi_{n}\}$ 独立. 令

$$
Z := n^{- \frac{1}{2}} \sum_{k = 1}^{n} \eta_{k}.
$$

则 $Z \sim N(0, 1)$ . 因此

$$
E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(Z)] = E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(n^{- \frac{1}{2}}(\eta_{1} + \dots + \eta_{n}))].
$$

为估计右边, 我们采用标准的逐项替换法. 这里的关键是用到 ${\vec{\Gamma}} Z.$ 与 $\dot{\eta}_{1}$ 服从同一个分布, 因此正态分布是该分布的唯一选项, 见习题1.

现在我们就具体实施证明. 令

$$
\zeta_{j} := n^{- \frac{1}{2}} \left(\sum_{k = 1}^{n - j} \xi_{k} + \sum_{k = n - j + 2}^{n} \eta_{k}\right),
$$

其中规定

$$
\sum_{k = 1}^{0} = \sum_{k = n + 1}^{n} = 0.
$$

则

$$
\begin{array}{rcl} I: & = & E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(Z)] \\ & = & \sum_{j = 1}^{n} \left\{E[\varphi(\zeta_{j} + n^{- \frac{1}{2}} \xi_{n - j + 1})] - E[\varphi(\zeta_{j} + n^{- \frac{1}{2}} \eta_{n - j + 1})] \right\} \\ & = & \sum_{j = 1}^{n} \left\{\left[E[\varphi(\zeta_{j} + n^{- \frac{1}{2}} \xi_{n - j + 1})] - \varphi(\zeta_{j}) \right] - \left[E[\varphi(\zeta_{j} + n^{- \frac{1}{2}} \eta_{n - j + 1})] - \varphi(\zeta_{j}) \right] \right\} \\ & = & : \sum_{j = 1}^{n} I_{j}.\end{array}
$$

由Taylor公式,

$$
\varphi(\zeta_{j} + y) - \varphi(\zeta_{j}) = \varphi^{\prime}(\zeta_{j}) y + \frac{1}{2} \varphi^{\prime \prime}(\zeta_{j}) y^{2} + r,
$$

其中

$$
| r | \leqslant \frac{1}{6} C | y |^{3}.
$$

由独立性,

$$
E[\xi_{n - j + 1} \varphi^{\prime}(\zeta_{j})] = E[\eta_{n - j + 1} \varphi^{\prime}(\zeta_{j})] = 0,
$$

$$
E[\xi_{n - j + 1}^{2} \varphi^{\prime \prime}(\zeta_{j})] = E[\eta_{n - j + 1}^{2} \varphi^{\prime \prime}(\zeta_{j})] = E[\varphi^{\prime \prime}(\zeta_{j})].
$$

所以

$$
\left| I_{j} \right| \leqslant I_{j}^{1} + I_{j}^{2},
$$

其中

$$
I_{j}^{1} \leqslant \frac{1}{6} CE[| \xi_{1} |^{3}] n^{- \frac{3}{2}},
$$

$$
I_{j}^{2} \leqslant \frac{1}{6} CE[| \eta_{1} |^{3}] n^{- \frac{3}{2}} = \frac{1}{3} \sqrt{\frac{2}{\pi}} Cn^{- \frac{3}{2}}.
$$

由此立即得到要证的不等式.

## 习题

1. 设 $E[\xi] = 0, E[\xi^{2}] = 1$ , 且存在 $n > 1$ , 使得 $\xi_{1}, \cdots, \xi_{n}$ 独立且均与ξ同分布, 而 $n^{- \frac{1}{2}}(\xi_{1} +$ $\cdots + \xi_{n})$ 也与ξ同分布. 证明ξ服从标准正态分布.

2. 设 $\xi_{1}, \xi_{2}, \cdot \cdot$ · 独立同分布, $E[\xi_{1}] = 0, E[\xi_{1}^{2}] = 1, E[| \xi_{1} |^{3}] < \infty$ . 设 $\varphi \in C(\mathbb{R}, \mathbb{R})$ 且存在常数C使得

$$
| \varphi(x) | \leqslant C(1 + | x |^{3}), \forall x.
$$

(a) 证明存在 $: \rho \in C^{\infty}(R, R), \rho \geqslant 0.$ , 且 $\rho(x) = 0, \forall | x | \geqslant 1$

(b) 设k为正整数. 令

$$
\varphi_{k}(x) = k \int_{- \infty}^{\infty} \rho(k(x - y)) \varphi(y) dy.
$$

证明: 存在不依赖于k的常数C使得

$$
| \varphi_{k}(x) - \varphi(x) | \leqslant C(1 + | x |^{3}).
$$

(c) 令

$$
\psi_{R}(x) :=(1 + | x |^{3}) \alpha(xR^{- 1}),
$$

其中 $\begin{array}{r}{\vert \alpha \in C_{b}^{\infty}(\mathbb{R},[0, 1]), \alpha(x) = 0, \forall \vert x \vert \leqslant \frac{1}{2}, \alpha(x) = 1, \forall \vert x \vert \geqslant 1} \end{array}$ . 证明:

$$
\lim_{n \to \infty} E[\psi_{R}(n^{- \frac{1}{2}} S_{n}] = \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{\infty} \psi_{R}(x) e^{- \frac{x^{2}}{2}} dx.
$$

(d) 证明

$$
\limsup_{n \to \infty} E \left[(1 + | n^{- \frac{1}{2}} S_{n} |^{3}) \right] = 0.
$$

(e) 证明

$$
E[|(\varphi - \varphi_{k}) |(n^{- \frac{1}{2}} S_{n})]
$$

(f) 证明

$$
\lim_{k \to \infty} \int_{- \infty}^{\infty} |(\varphi - \varphi_{k})(x) | e^{- \frac{x^{2}}{2}} dx \leqslant C \int_{| x | \geqslant R}(1 + x^{2}) e^{- \frac{x^{2}}{2}} dx.
$$

## 10.2 几个分析引理

前节所介绍的Lindeberg定理给出 ${\vec{\J}} \varphi(n^{-{\frac{1}{2}}} S_{n})$ 与 $\textstyle{\frac{1}{\sqrt{2 \pi}}} \int \varphi(x) e^{-{\frac{1}{2}} x^{2}} dx$ 的差距的估计, 但没有给出 $S_{n}$ 的分布函数和正态分布函数的差距的估计. 本章余下的篇幅就来估计这后一种估计. 本节做些准备工作, 证明几个分析方面的结果.

令

$$
\gamma(x) := \frac{1}{\sqrt{2 \pi}} e^{- \frac{x^{2}}{2}}
$$

是标准正态的密度函数.

10.2 几个分析引理

引理 10.2.1. $\forall x > 0$

$$
{\frac{x}{1 + x^{2}}} \gamma(x) \leqslant \int_{x}^{\infty} \gamma(y) dy \leqslant{\frac{1}{x}} \gamma(x).
$$

证明. 由分部积分有

$$
\int_{x}^{\infty} e^{- \frac{y^{2}}{2}} dy = \frac{1}{x} e^{- \frac{x^{2}}{2}} - \int_{x}^{\infty} \frac{1}{y^{2}} e^{- \frac{y^{2}}{2}} dy.
$$

所以

$$
\int_{x}^{\infty} e^{- \frac{y^{2}}{2}} dy \leqslant \frac{1}{x} e^{- \frac{x^{2}}{2}}.
$$

由此得到第二个不等式.

同时又有

$$
\begin{array}{rcl} \int_{x}^{\infty} e^{- \frac{y^{2}}{2}} dy & = & \frac{1}{x} e^{- \frac{x^{2}}{2}} - \int_{x}^{\infty} \frac{1}{y^{2}} e^{- \frac{y^{2}}{2}} dy \\ & \geqslant & \frac{1}{x} e^{- \frac{x^{2}}{2}} - \frac{1}{x^{2}} \int_{x}^{\infty} e^{- \frac{y^{2}}{2}} dy, \end{array}
$$

移项即得

$$
\frac{1 + x^{2}}{x^{2}} \int_{x}^{\infty} e^{- \frac{y^{2}}{2}} dy \geqslant \frac{1}{x} e^{- \frac{x^{2}}{2}},
$$

这就是第一个不等式.

推论 10.2.2. 设 $\xi \sim N(0, 1)$ . 则 $\forall x > 0, E[\xi 1_{\xi > x}] = \gamma(x)$ , 且 $\begin{array}{r}{P(\xi > x) \leqslant \sqrt{\frac{\pi}{2}} \gamma(x)} \end{array}$ 证明. 第一个等式直接计算可得, 即

$$
E[\xi 1_{\xi > x}] = \int_{x}^{+ \infty} y \gamma(y) dy = \gamma(x).
$$

为证明第二个不等式, 令

$$
f(x) := \gamma^{- 1}(x) \int_{x}^{+ \infty} \gamma(y) dy, x \geqslant 0,
$$

则由引理10.2.1的第二个不等式, $\forall x \geqslant 0$

$$
f^{\prime}(x) = x \gamma^{- 1}(x) \int_{x}^{+ \infty} \gamma(y) dy - 1 \leqslant 0.
$$

因此 $\begin{array}{r}{f(x) \leqslant f(0) = \sqrt{\frac{\pi}{2}}, \forall x \geqslant 0.} \end{array}$

下面的结果给了γ一个刻画.

引理 10.2.3. 设f二次连续可微, 且

$$
\lim_{x \to \infty} f(x) \gamma(x) = 0, \int_{- \infty}^{\infty} | f(x) | \gamma(x) dx < \infty,
$$

则

$$
\int_{- \infty}^{\infty} xf(x) \gamma(x) dx = \int_{- \infty}^{\infty} f^{\prime}(x) \gamma(x) dx.
$$

反之, 若 $\dot{\boldsymbol{g}}$ 为R上的非负Borel函数, 满足

$$
\int_{- \infty}^{\infty} g(x) dx = 1, \quad \int_{- \infty}^{\infty} | x | g(x) dx < \infty
$$

且对任意 $f \in C_{b}^{\infty}(\mathbb{R})$ 有

$$
\int_{- \infty}^{\infty} xf(x) g(x) dx = \int_{- \infty}^{\infty} f^{\prime}(x) g(x) dx,
$$

则 $g \equiv \gamma$

证明. 第一部分是一个简单的分部积分. 至于第二部分, 设ξ是具有密度函数g的随机变量.取 $f(x) = e^{itx}$ , 则由定理5.7.3和假设, 有

$$
\begin{array}{rcl} \frac{d}{dt} E[e^{it \xi}] & = & iE[\xi e^{it \xi}] \\ & = & i \int_{- \infty}^{\infty} xf(x) g(x) dx \\ & = & - t \int_{- \infty}^{\infty} f(x) g(x) dx.\end{array}
$$

即ξ的特征函数φ满足微分方程

$$
\varphi^{\prime}(t) = - t \varphi(t), \varphi(0) = 1.
$$

因此

$$
\varphi(t) = e^{- \frac{t^{2}}{2}}.
$$

所以 $\xi \sim N(0, 1)$ , 从而 ${\dot{| g |}} \equiv \gamma$

引理 10.2.4. 设h是连续函数, h几乎处处可导, 存在常数A使得 $| h^{\prime}(x) | \leqslant A \a.e.$ , 且

$$
h(x) - h(y) = \int_{y}^{x} h^{\prime}(t) dt, \forall x, y.\tag{2.1}
$$

设 $\xi \sim N(0, 1)$ 令

$$
c_{0} := E[h(\xi)],
$$

$$
f(x) := \gamma^{- 1}(x) E[(h(\xi) - c_{0}) 1_{\xi \leqslant x}],\tag{2.2}
$$

则

$$
f^{\prime}(x) - xf(x) = h(x) - c_{0},\tag{2.3}
$$

$$
| f(x) | \leqslant 2A, | f^{\prime}(x) | \leqslant 4A, | f^{\prime \prime}(x) | \leqslant 2A.\tag{2.4}
$$

注. 这里由于只假定h是连续函数, h<sup>′</sup>几乎处处存在, 所以(2.1)中的积分及下面的许多积分应理解为Lebesgue积分. 同样是由于h<sup>′</sup>只是Borel可测, 并不一定连续, 所以f并不见得是处处可导的, 而只是几乎处处可导(在Lebbesgue测度的意义下). 因此上面涉及到f<sup>′</sup>与f<sup>′′</sup>的不等式也只是几乎处处成立. 这里大家在现阶段可以把h<sup>′</sup>当成连续的, 就先这么混着, 等熟悉实变函数以后, 就会知道这里的一切和下面证明中所有的推理都是严格的, 都是正确的.

证明. 对(2.1)求导即得(2.3).

显然用 $\tilde{h}(t) : = h(t) - h(0)$ 代替h而定义出来的 $\mid f$ 与用h本身定义出来的f是一样的, 所以必要时以h<sup>˜</sup>代替 $^{\cdot} h,$ 我们不妨假定 $h(0) = 0$ . 这样就有

$$
| h(x) | \leqslant \int_{0}^{| x |} | h^{\prime}(t) | dt \leqslant A | x |.
$$

因此

$$
| c_{0} | = | E[h(\xi)] | \leqslant AE[| \xi |] = \sqrt{\frac{2}{\pi}} A.
$$

又由于

$$
E[h(\xi) - c_{0}] = 0,
$$

所以

$$
f(x) = - \gamma^{- 1}(x) E[(h(\xi) - c_{0}) 1_{\xi > x}].\tag{2.5}
$$

对 $\cdot x < 0,$ 用(2.2), 对 $x \geqslant 0,$ 用(2.5), 由推论10.2.2得

$$
| f(x) | \leqslant \gamma^{- 1}(x) E \left[A \left(| \xi | + \sqrt{\frac{2}{\pi}}\right) 1_{\xi > | x |} \right] \leqslant 2A.
$$

对(2.3)求导即得

$$
f^{\prime \prime}(x) = xf^{\prime}(x) + f(x) + h^{\prime}(x),\tag{2.6}
$$

因此

$$
(\gamma(x) f^{\prime}(x))^{\prime} = \gamma(x)(f^{\prime \prime}(x) - xf^{\prime}(x)) = \gamma(x)(f(x) + h^{\prime}(x)).\tag{2.7}
$$

又由(2.3) 知

$$
\left| f^{\prime}(x) \right| \leqslant 3A | x | + c_{0},
$$

因此

$$
\lim_{x \to \infty} \gamma(x) f^{\prime}(x) = 0.
$$

对(2.7)两边在区间 $(- \infty, x]$ 上积分得

$$
f^{\prime}(x) = \gamma^{- 1}(x) E[(f(\xi) + h^{\prime}(\xi)) 1_{\xi \leqslant x}],
$$

又对(2.7)两边在区间 $(- \infty, + \infty)$ 上积分得

$$
E[f(\xi) + h^{\prime}(\xi)] = 0.
$$

所以又有

$$
f^{\prime}(x) = - \gamma^{- 1}(x) E[(f(\xi) + h^{\prime}(\xi)) 1_{\xi > x}].
$$

因此, 由推论10.2.2有

$$
\begin{array}{rcl} | f^{\prime}(x) | & \leqslant & \gamma^{- 1}(x) E[(| f(\xi) | + | h^{\prime}(\xi) |) 1_{\xi > x}] \\ & \leqslant &(2A + A) \gamma^{- 1}(x) P(\xi > x) \\ & \leqslant & 3A \sqrt{\frac{\pi}{2}} \leqslant 4A.\end{array}
$$

下面估计 $\cdot f^{\prime \prime}$ . 将(2.3)代入(2.6), 我们有

$$
\begin{array}{rcl} | f^{\prime \prime}(x) | & = & | f(x) + xf^{\prime}(x) + h^{\prime}(x) | \\ & = & |(1 + x^{2}) f(x) + x(h(x) - c_{0}) + h^{\prime}(x) |.\end{array}
$$

然后注意到

$$
\begin{array}{rcl} h(x) - c_{0} & = & h(x) - \int_{- \infty}^{\infty} h(s) \gamma(s) ds \\ & = & \int_{- \infty}^{\infty}(h(x) - h(s)) \gamma(s) ds \\ & = & \int_{- \infty}^{x} \gamma(s) ds \int_{s}^{x} h^{\prime}(t) dt - \int_{x}^{\infty} \gamma(s) ds \int_{x}^{s} h^{\prime}(t) dt \\ & = & \int_{- \infty}^{x} h^{\prime}(t) \int_{- \infty}^{t} \gamma(s) ds - \int_{x}^{\infty} h^{\prime}(t) \int_{t}^{\infty} \gamma(s) ds \\ & = & \int_{- \infty}^{x} h^{\prime}(t) P(\xi \leqslant t) dt - \int_{x}^{\infty} h^{\prime}(t) P(\xi > t) dt.\end{array}
$$

类似地有

$$
P(\xi \leqslant x) h(x) - E[h(\xi) 1_{\xi \leqslant x}] = \int_{- \infty}^{x} h^{\prime}(t) P(\xi \leqslant t) dt,
$$

$$
P(\xi > x) h(x) - E[h(\xi) 1_{\xi > x}] = - \int_{x}^{\infty} h^{\prime}(t) P(\xi > t) dt.
$$

注意到 $E[h(\xi) 1_{\xi \leqslant x}] = c_{0} - E[h(\xi) 1_{\xi > x}]$ , 前一式乘以 $P(\xi > x)$ , 后一式乘以 $P(\xi \leqslant x)$ , 然后两式相减, 即得

$$
E[(h(\xi) - c_{0}) 1_{\xi > x}] = P(\xi > x) \int_{- \infty}^{x} h^{\prime}(t) P(\xi \leqslant t) dt + P(\xi \leqslant x) \int_{x}^{\infty} h^{\prime}(t) P(\xi > t) dt.
$$

由(2.5), 所以

$$
f(x) = - \gamma^{- 1}(x) \left(P(\xi > x) \int_{- \infty}^{x} h^{\prime}(t) P(\xi \leqslant t) dt + P(\xi \leqslant x) \int_{x}^{\infty} h^{\prime}(t) P(\xi > t) dt\right).
$$

此式代入到 $f^{\prime \prime}$ 的表达式, 并注意到引理10.2.1的第一个不等式, 有

$$
\begin{array}{rcl} | f^{\prime \prime}(x) | & \leqslant & | h^{\prime}(x) | + |(1 + x^{2}) f(x) + x(h(x) - c_{0}) | \\ & \leqslant & A + A \Big | x -(1 + x^{2}) P(\xi > x) \gamma^{- 1}(x) \Big | \cdot \int_{- \infty}^{x} P(\xi \leqslant t) dt \\ & & + A \Big |(1 + x^{2}) P(\xi \leqslant x) \gamma^{- 1}(x) + x \Big | \cdot \int_{x}^{\infty} P(\xi > t) dt \\ & = & A + A \Big(- x +(1 + x^{2}) P(\xi > x) \gamma^{- 1}(x) \Big) \Big(xP(\xi \leqslant x) + \gamma(x) \Big) \\ & & + A \Big(x +(1 + x^{2}) P(\xi \leqslant x) \gamma^{- 1}(x) \Big) \Big(- xP(\xi > x) + \gamma(x) \Big) \\ & = & 2A, \end{array}
$$

其中倒数第二个等式是因为由Fubini定理有

$$
\begin{array}{rcl} \int_{- \infty}^{x} P(\xi \leqslant t) dt & = & xP(\xi \leqslant x) + \gamma(x), \\ \int_{x}^{\infty} P(\xi > t) dt & = & - xP(\xi > x) + \gamma(x).\end{array}
$$

□

## 10.3 分布余项的积分估计

以F表N(0, 1)的分布函数, 即

$$
F(x) := \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy.
$$

所谓分布余项的积分估计是指估计

$$
\int_{- \infty}^{\infty} | F_{n}(x) - F(x) | dx.
$$

为此我们先证明一个引理.

引理 10.3.1. 设 $\xi_{1}, \xi_{2}$ 是可积随机变量, $G_{1}, G_{2}$ 分别是其分布函数. 令

$$
\varphi(x) := \int_{0}^{x} \operatorname{sgn}(G_{1}(y) - G_{2}(y)) dy.
$$

则

$$
\int_{- \infty}^{\infty} | G_{1}(x) - G_{2}(x) | dx = E[\varphi(\xi_{2}) - \varphi(\xi_{1})].\tag{3.8}
$$

证明. (1) 先设 $\cdot \xi_{1}$ 与 $\xi_{2}$ 均有界, 比如 $| \xi_{1} | \vee | \xi_{2} | \leqslant n,$ 其中n为常数. 此时, 由于当 $| x | > n$ 时 $G_{1}(x) -$ $G_{2}(x) = 0$ , 因此 $| \varphi(x) | \leqslant n$

设 ${}_{; \rho, \vec{\rho}, \vec{\rho}}$ 为R上的磨光函数(见附录11.4). 对 $\varepsilon > 0.$ , 令 $\rho(x) : = \varepsilon^{- 1} \rho(\varepsilon^{- 1} x)$ 2

$$
\varphi_{\varepsilon}(x) := \int_{\mathbb{R}} \varphi(y) \rho_{\varepsilon}(x - y) dy.
$$

则

(i)

$$
\varphi_{\varepsilon} \in C_{b}^{1}, \sup_{x \in \mathbb{R}} | \varphi_{\varepsilon}^{\prime}(x) | \leqslant 1;
$$

(ii)当ε ↓ 0时,

$$
\varphi_{\varepsilon}(x) \rightarrow \varphi(x) \forall x, \varphi_{\varepsilon}^{\prime}(x) \rightarrow \varphi^{\prime}(x) a.e.Lebesgue \text{测度}.
$$

由 5.8 节习题8, 我们有

$$
\int_{- n}^{n} \varphi_{\varepsilon}^{\prime}(x)(G_{1}(x) - G_{2}(x)) dx = E[\varphi_{\varepsilon}(\xi_{2}) - \varphi_{\varepsilon}(\xi_{1})].
$$

令 $\varepsilon \downarrow 0,$ 由有界收敛定理有

$$
\int_{- n}^{n} \varphi^{\prime}(x)(G_{1}(x) - G_{2}(x)) dx = E[\varphi(\xi_{2}) - \varphi(\xi_{1})].
$$

即

$$
\int_{- n}^{n} | G_{1}(x) - G_{2}(x) | dx = E[\varphi(\xi_{2}) - \varphi(\xi_{1})].
$$

(2) 一般地, 令 $\begin{array}{r}{\cdot \xi_{i}^{n} : =(- n) \vee \xi_{i} \wedge n, i = 1, 2} \end{array}$ . 则由上一步有

$$
\int_{- n}^{n} | G_{1}(x) - G_{2}(x) | dx = E[\varphi(\xi_{2}^{n}) - \varphi(\xi_{1}^{n})].
$$

令 $\cdot n \infty,$ 左边用单调收敛定理, 右边用控制收敛定理 $(\forall \mathbb{\dot{E}} \mathbb{\dot{E}} | \varphi(x) | \leqslant | x |)$ , 得

$$
\int_{\mathbb{R}} | G_{1}(x) - G_{2}(x) | dx = E[\varphi(\xi_{2}) - \varphi(\xi_{1})].
$$

□

所以为估计(3.8)的左边, 只要估计其右边就行. 设f由(2.2)给出, 其中h代之以 $\cdot \varphi,$ 此时 $A =$ 1. 则由(2.3)有

$$
\varphi(x) - \varphi(y) = f^{\prime}(x) - xf(x) -[f^{\prime}(y) - yf(y)].
$$

因此

$$
E[\varphi(\xi_{2}) - \varphi(\xi_{1})] = E \left[f^{\prime}(\xi_{1}) - \xi_{1} f(\xi_{1}) -[f^{\prime}(\xi_{2}) - \xi_{2} f(\xi_{2})] \right].
$$

现在, 取 $\xi_{1} \sim N(0, 1), \xi_{2} : = n^{- \frac{1}{2}} S_{n}$ . 由引理2.1知

$$
E \left[f^{\prime} \left(\xi_{1}\right) - \xi_{1} f \left(\xi_{1}\right) \right] = 0,
$$

所以

$$
E \left[\varphi(n^{- \frac{1}{2}} S_{n}) \right] - E[\varphi(\xi_{1})] = - E \left[f^{\prime}(n^{- \frac{1}{2}} S_{n}) - n^{- \frac{1}{2}} S_{n} f(n^{- \frac{1}{2}} S_{n}) \right].
$$

下面我们就来估计该式右边. 我们用I表示它. 于是

$$
I = \sum_{m = 1}^{n} \left(n^{- 1} E \left[f^{\prime}(n^{- \frac{1}{2}} S_{n}) \right] - n^{- \frac{1}{2}} E \left[\xi_{m} f(n^{- \frac{1}{2}} S_{n}) \right]\right).
$$

## 10.3 分布余项的积分估计

令

$$
\begin{array}{c} \eta_{m}(t) := n^{- \frac{1}{2}}[S_{n} +(t - 1) \xi_{m}], \\ g(t) := f(\eta_{m}(t)).\end{array}
$$

用公式

$$
g(1) = g(0) + g^{\prime}(0) + \int_{0}^{1}(g^{\prime}(t) - g^{\prime}(0)) dt,
$$

并注意 $: \xi_{m}$ 与 $S_{n} - \xi_{m}$ 即 $\eta_{m}(0)$ 独立, 从而

$$
E[\xi_{m} g(0)] = E[\xi_{m}] E[g(0)] = 0,
$$

$$
E[\xi_{m} g^{\prime}(0)] = n^{- \frac{1}{2}} E[\xi_{m}^{2} f^{\prime}(\eta_{m}(0))] = n^{- \frac{1}{2}} E[\xi_{m}^{2}] E[f^{\prime}(\eta_{m}(0))] = n^{- \frac{1}{2}} E[f^{\prime}(\eta_{m}(0))],
$$

我们有

$$
I = \frac{1}{n} \sum_{m = 1}^{n} A_{m} - \frac{1}{n} \int_{0}^{1} \sum_{m = 1}^{n} B_{m}(t) dt,
$$

其中

$$
A_{m} := E \left[f^{\prime}(\eta_{m}(1)) - f^{\prime}(\eta_{m}(0)) \right],
$$

$$
B_{m}(t) = E \left[\xi_{m}^{2}[f^{\prime}(\eta_{m}(t)) - f^{\prime}(\eta_{m}(0))] \right].
$$

由(2.4)和H¨older不等式有

$$
\begin{array}{rcl} | A_{m} | & \leqslant & E[| f^{\prime}(n^{- \frac{1}{2}} S_{n}) - f^{\prime}(n^{- \frac{1}{2}}(S_{n} - \xi_{m})) |] \\ & \leqslant & n^{- \frac{1}{2}} \| f^{\prime \prime} \| E[| \xi_{m} |] \leqslant 2n^{- \frac{1}{2}}.\end{array}
$$

对 $B_{m}$ 则有

$$
\begin{array}{rcl} | B_{m}(t) | & \leqslant & E[\xi_{m}^{2} | f^{\prime}(\eta_{m}(t)) - f^{\prime}(\eta_{m}(0)) |] \\ & \leqslant & n^{- \frac{1}{2}} t \| f^{\prime \prime} \| E[| \xi_{m} |^{3}] \leqslant n^{- \frac{1}{2}} 2 \tau t, \end{array}
$$

其中 $\begin{array}{r}{{\bf \Phi}^{\mathrm{I}} \tau : = E[| \xi_{1} |^{3}]} \end{array}$ . 所以

$$
\int_{0}^{1} B_{m}(t) dt \leqslant n^{- \frac{1}{2}} \tau.
$$

总结起来, 我们便证明了:

定理 10.3.2. 设 $\tau : = E[| \xi_{1} |^{3}] < \infty$ , 则

$$
\int_{\mathbb{R}} | F_{n}(x) - F(x) | dx \leqslant n^{- \frac{1}{2}}(2 + \tau).
$$

习题

1. 证明:

$$
\int_{\mathbb{R}} \left| e^{- n} \sum_{k = 0}^{[n^{\frac{1}{2}} x + n]} - \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy \right| dx \leqslant 7n^{- \frac{1}{2}}.
$$

2. 证明:

$$
\int_{\mathbb{R}} \left| \frac{1}{\Gamma(\frac{n}{2})} \sqrt{\left(\frac{n}{2}\right)^{n}} \int_{0}^{1 + x \sqrt{\frac{2}{n}}} y^{\frac{n}{2} - 1} e^{- \frac{ny}{2}} dy - \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy \right| dx \leqslant 17n^{- \frac{1}{4}}.
$$

## 10.4 余项的一致估计

上节我们取特殊的 $\varphi$ 得到了余项的积分估计. 本节我们说明取另一种 $\varphi{\overline{{\Pi}}}$ 以得到余项的一致估计.

现在, 沿用上节的记号, 我们来证明:

定理 10.4.1.

$$
\sup_{x \in \mathbb{R}} | F_{n}(x) - F(x) | \leqslant 2 \sqrt{2 + \tau} n^{- \frac{1}{4}}.
$$

证明. $\forall \varepsilon > 0, x \in$ R, 取

$$
\varphi(y) := \varphi_{\varepsilon, x}(y) := 1_{(- \infty, x]}(y) + \frac{1}{\varepsilon}(x + \varepsilon - y) 1_{(x, x + \varepsilon]}(y).
$$

因为

$$
P(n^{- \frac{1}{2}} S_{n} \leqslant x) \leqslant E[\varphi(n^{- \frac{1}{2}} S_{n})],
$$

所以

$$
\begin{array}{ll} & P(n^{- \frac{1}{2}} S_{n} \leqslant x) - P(\xi \leqslant x) \\ \leqslant & E[\varphi(n^{- \frac{1}{2}} S_{n})] - P(\xi \leqslant x) \\ = & E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(\xi)] + E[\varphi(\xi)] - P(\xi \leqslant x) \\ \leqslant & \left| E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(\xi)] \right| + P(x \leqslant \xi \leqslant x + \varepsilon).\end{array}
$$

因为

$$
P(x \leqslant \xi \leqslant x + \varepsilon) = \int_{x}^{x + \varepsilon} \gamma(y) dy \leqslant \varepsilon,
$$

由5.8节的习题8和定理10.3.2有

$$
\begin{array}{rcl} \left| E[\varphi(n^{- \frac{1}{2}} S_{n})] - E[\varphi(\xi)] \right| & = & \left| \int_{\mathbb{R}} \varphi^{\prime}(y)(F_{n}(y) - F(y)) dy \right| \\ & \leqslant & \varepsilon^{- 1} \int_{\mathbb{R}} | F_{n}(y) - F(y) | dy \\ & \leqslant & \varepsilon^{- 1} n^{- \frac{1}{2}}(2 + \tau).\end{array}
$$

所以

$$
\sup_{x \in \mathbb{R}} \left(P(n^{- \frac{1}{2}} S_{n} \leqslant x) - P(\xi \leqslant x)\right) \leqslant \varepsilon^{- 1} n^{- \frac{1}{2}}(2 + \tau) + \varepsilon.
$$

同理

$$
\begin{array}{rl} & P(\xi \leqslant x) - P(n^{- \frac{1}{2}} S_{n} \leqslant x) \\ \leqslant & P(\xi \leqslant x) - E[\varphi(\xi + \varepsilon)] + E[\varphi(\xi + \varepsilon)] - E[\varphi(n^{- \frac{1}{2}} S_{n} + \varepsilon)] \\ = & \left| E[\varphi(n^{- \frac{1}{2}} S_{n} + \varepsilon)] - E[\varphi(\xi + \varepsilon)] \right| + P(x \leqslant \xi \leqslant x + \varepsilon) \\ \leqslant & \varepsilon^{- 1} n^{- \frac{1}{2}}(2 + \tau) + \varepsilon.\end{array}
$$

于是

$$
\sup_{x \in \mathbb{R}} \left| P(n^{- \frac{1}{2}} S_{n} \leqslant x) - P(\xi \leqslant x) \right| \leqslant \varepsilon^{- 1} n^{- \frac{1}{2}}(2 + \tau) + \varepsilon.
$$

因此,

$$
\begin{array}{rcl} \sup_{x \in \mathbb{R}} \Big | P(n^{- \frac{1}{2}} S_{n} \leqslant x) - P(\xi \leqslant x) \Big | & \leqslant & \inf_{\varepsilon > 0} \Big \{\varepsilon^{- 1} n^{- \frac{1}{2}}(2 + \tau) + \varepsilon \Big\} \\ & = & 2 \sqrt{2 + \tau} n^{- \frac{1}{4}}.\end{array}
$$

最后我们着重指出, 本章的各个结果只要求 $\xi_{1}, \xi_{2}, \cdot \cdot$ ·独立同分布, 再加上一些矩条件, 而与具体是何种分布无关. 这种无关性通常被称为”不变性原理”, 表示不管 $\dot{\boldsymbol{\xi}}_{i}$ 的分布如何变化,最后的极限分布都是标准正态分布, 恒古不变.

## 习题

1. 证明:

$$
\sup_{x \in \mathbb{R}} \left| e^{- n} \sum_{k = 0}^{[n^{\frac{1}{2}} x + n]} - \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy \right| \leqslant 2 \sqrt{7} n^{- \frac{1}{4}}.
$$

2. 证明:

$$
\sup_{x \in \mathbb{R}} \left| \frac{1}{\Gamma(\frac{n}{2})} \sqrt{\left(\frac{n}{2}\right)^{n}} \int_{0}^{1 + x \sqrt{\frac{2}{n}}} y^{\frac{n}{2} - 1} e^{- \frac{ny}{2}} dy - \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy \right| \leqslant 2 \sqrt{17} n^{- \frac{1}{4}}.
$$

3. 设 $\xi_{1}, \cdots, \xi_{100}$ 独立,且均服从 $B(p)$ . 分别用Poisson定理和本节结果近似计算 $P(\xi_{1} + \cdot \cdot +$ $\xi_{n} \leqslant k)$ . 比较两种方法的优劣.

## 11 附录

## 11.1 Stirling公式

$$
\lim_{n \to \infty} \frac{n !}{e^{- n} n^{n + 1 / 2}} = \sqrt{2 \pi}.
$$

证明可见例如[5, p.382]. 下面给一个概率方法的证明.

证明. ${i}{\frac{n}{X}} \xi_{1}, \xi_{2}, \cdots$ 独立同分布, 分布为 $E(1)$ . 令 $\eta_{k} = \xi_{k} - 1$ , 则 $\eta_{1}, \eta_{2}, \cdots$ 也独立同分布, 且

$$
E[\eta_{k}] = 0, E[\eta_{k}^{2}] = 1.
$$

令

$$
S_{n} := \sum_{k = 1}^{n} \eta_{k} = \sum_{k = 1}^{n} \xi_{k} - n,
$$

由中心极限定理, $n^{- \frac{1}{2}} S_{n} \stackrel{w}{\longrightarrow} N(0, 1)$

由Skorokhod表现定理, 存在概率空间 $(\Omega,{\mathcal{F}}, P)$ 及定义在其上的随机变量 $X_{n}, X$ , 使得 $\cdot n^{- \frac{1}{2}} S_{n}$ 与 $X_{n}$ 同分布, $X \sim N(0, 1)$ , 且 $X_{n} \xrightarrow{a.s.} X.$ 又因为

$$
E[X_{n}^{2}] = E \left[n^{- 1} S_{n}^{2} \right] = 1,
$$

所以

$$
E[(X_{n} - X)^{2}] \leqslant 2 \left(E[X_{n}^{2}] + E[X^{2}]\right) = 4,
$$

因此,

$$
\begin{array}{rcl} E[| X_{n} - X |] & \leqslant & E[1_{\{| X_{n} - X | > \varepsilon\}} | X_{n} - X |] + E[1_{\{| X_{n} - X | \leqslant \varepsilon\}} | X_{n} - X |] \\ & \leqslant & 2 \sqrt{P(| X_{n} - X | > \varepsilon)} + \varepsilon.\end{array}
$$

令 $n \to \infty$ , 并由ε的任意性, 有 $\boldsymbol{X}_{n} \stackrel{L^{1}}{\longrightarrow} \boldsymbol{X}$ . 特别地,

$$
\lim_{n \to \infty} E[| X_{n} |] = E[| X |] = \sqrt{\frac{2}{\pi}}.
$$

另外, 用归纳法易知, $\textstyle \sigma_{n} : = \sum_{k = 1}^{n} \xi_{k}$ 的密度函数为 (见第6章例2)

$$
\rho_{n}(x) = \left\{\begin{array}{ll} \frac{x^{n - 1}}{(n - 1) !} e^{- x}, & x \geqslant 0, \\ 0, & x < 0.\end{array} \right.
$$

直接计算得

$$
\begin{array}{lll} E[| S_{n} |] & = & E[| \sigma_{n} - n |] \\ & = & \int_{0}^{\infty} | x - n | \frac{x^{n - 1}}{(n - 1) !} e^{- x} dx \\ & = & \frac{n}{(n - 1) !} \int_{0}^{\infty} \left| \frac{x}{n} - 1 \right| x^{n - 1} e^{- x} dx \\ & = & \frac{n}{(n - 1) !} n^{n} \int_{0}^{\infty} | u - 1 | u^{n - 1} e^{- nu} du \\ & = & \frac{n}{(n - 1) !} n^{n} \left(\int_{0}^{1}(1 - u) u^{n - 1} e^{- nu} du + \int_{1}^{\infty}(u - 1) u^{n - 1} e^{- nu} du\right) \\ & = & \frac{1}{(n - 1) !} n^{n} \left(u^{n} e^{- nu} \Big |_{0}^{1} - u^{n} e^{- nu} \Big |_{1}^{\infty}\right) \\ & = & \frac{2}{(n - 1) !} n^{n} e^{- n}.\end{array}
$$

因此

$$
\lim_{n \to \infty} E[| X_{n} |] = \lim_{n \to \infty} n^{- \frac{1}{2}} E[| S_{n} |] = \lim_{n \to \infty} \frac{2}{n !} n^{n + \frac{1}{2}} e^{- n} = \sqrt{\frac{2}{\pi}}.
$$

## 11.2 Bihari–LaSalle不等式及其推论

定理 11.2.1. $(Bihari^{1} - LaSalle^{2}$ 不等式) 设 $\varphi$ 与ψ是R<sub>+</sub>上的非负连续函数(ψLebesgue可积即可), h是 $\mathbb{R}_{+}$ 上的递增函数, $h(0) = 0$ , 且 $t >$ 0时 $h(t) > 0$ . 设 $x \geqslant 0.$ 且

$$
\varphi(t) \leqslant x + \int_{0}^{t} \psi(s) h(\varphi(s)) ds \forall t \geqslant 0.
$$

$$
H(t) = \int_{t_{0}}^{t} h^{- 1}(s) dst \geqslant 0.
$$

这里 $t_{0} \geqslant 0$ , 且当

$$
\int_{0 +} h^{- 1}(s) ds < \infty
$$

时可取 ${\bf \nabla}.t_{0} = 0$ , 否则 $t_{0} > 0$ . 则

$$
\varphi(s) \leqslant H^{- 1}(H(x) + \int_{0}^{t} \psi(s) ds).
$$

证明. 首先注意 $H$ : R $\mathbf{\Sigma}_{+} \mapsto \left[- \infty, \infty \right)$ 是连续递增函数.

设 $x > 0.$ . 令

$$
f(t) := x + \int_{0}^{t} \psi(s) h(\varphi(s)) ds.
$$

由h的单调性有

$$
h(\varphi(t)) \leqslant h(f(t)),
$$

即

$$
\frac{h(\varphi(t)) \psi(t)}{h(f(t))} \leqslant \psi(t),
$$

也即

$$
H^{\prime}(f(t)) \leqslant \psi(t).
$$

从0到t积分得

$$
H(f(t)) - H(f(0)) \leqslant \int_{0}^{t} \psi(s) ds.
$$

但 $f(0) = x,$ , 故

$$
H(f(t)) \leqslant x + \int_{0}^{t} \psi(s) ds.
$$

所以

$$
\varphi(t) \leqslant f(t) \leqslant H^{- 1}(x + \int_{0}^{t} \psi(s) ds).
$$

$x >$ 0的情况获证. 若 $x = 0$ , 则对任意 $x >$ 0均有

$$
\varphi(t) \leqslant x + \int_{0}^{t} \psi(s) h(\varphi(s)) ds \forall t \geqslant 0.
$$

故

$$
\varphi(t) \leqslant f(t) \leqslant H^{- 1}(H(x) + \int_{0}^{t} \psi(s) ds).
$$

取 $.x \downarrow$ 0即得

$$
\varphi(t) \leqslant f(t) \leqslant H^{- 1}(H(0) + \int_{0}^{t} \psi(s) ds).
$$

细心的读者可能已经注意到, 此定理中 $^{\mathnormal{\Gamma}} t_{0}$ 可以有无穷多种选择. 但实际上所有的选择最终给出的界其实是一样的, 你可以自己验证一下.

很多熟知的结果都是Bihari不等式的推论. 例如我们有:

(1) 取 $h(t) = t, t_{0} = 1($ (例如). 则得到Gr¨onwall<sup>3</sup>不等式.

推论 11.2.2. (Gr¨onwall不等式) 若

$$
\varphi(t) \leqslant x + \int_{0}^{t} \psi(s) \varphi(s) ds \forall t \geqslant 0,
$$

则

$$
\varphi(t) \leqslant x \exp \{\int_{0}^{t} \psi(s) ds\}.
$$

(2) 取 $\begin{array}{r}{\langle h(t) = t^{1 - \alpha}, \alpha \in(0, 1), t_{0} = 0} \end{array}$ , 则得到Zakai不等式.

推论 11.2.3 (Zakai<sup>4</sup>不等式). 设 $\varphi_{s}$ 是[0, T]上的非负连续函数, $\psi_{s}$ 为非负Lebesgue可积函数,$\alpha \in(0, 1)$ . 若

$$
\varphi_{t} \leqslant \beta + \int_{0}^{t} \psi_{s} \varphi_{s}^{1 - \alpha} ds,
$$

则

$$
\varphi_{t} \leqslant(\beta^{\alpha} + \alpha \int_{0}^{t} \psi_{s} ds)^{1 / \alpha}.
$$

下面是Zakai不等式的进一步推论：

推论 11.2.4. $\varphi, \psi, \alpha \mathcal{k} \beta \mathcal{k} \mathbf{a}.$ 上. 若

$$
\varphi_{t} \leqslant \beta + \int_{0}^{t} ds \int_{0}^{s} \psi_{u} \varphi_{u}^{1 - \alpha} du,
$$

则

$$
\varphi_{t} \leqslant(\beta^{\alpha} + \alpha \int_{0}^{t} ds \int_{0}^{s} \psi_{u} du)^{1 / \alpha}.
$$

证明. 令

$$
h_{t} := \max_{0 \leqslant s \leqslant t} \varphi_{s}.
$$

则h是盖住 $\overline{{J}} \varphi$ 的最小增函数. 由于 $\begin{array}{r}{\int_{0}^{t} ds \int_{0}^{s} \psi_{u} \varphi_{u}^{1 - \alpha} du} \end{array}$ 是增函数, 因此

$$
{h_{t}} \leqslant{\beta + \int_{0}^{t} ds \int_{0}^{s} \psi_{u} \varphi_{u}^{1 - \alpha} du}
$$

$$
\leqslant \beta + \int_{0}^{t} ds \int_{0}^{s} \psi_{u} h_{u}^{1 - \alpha} du
$$

$$
\leqslant \beta + \int_{0}^{t} h_{s}^{1 - \alpha} ds \int_{0}^{s} \psi_{u} du.
$$

然后用上面推论即可.

□

3.此外还有

推论 11.2.5. 若

$$
\varphi(t) \leqslant \int_{0}^{t} \psi(s) h(\varphi(s)) ds \forall t \geqslant 0,
$$

且

$$
\int_{0 +} h^{- 1}(s) ds = \infty,
$$

则 $\varphi \equiv 0$

事实上, 此时(随便取 $t_{0} > 0) H(0) = - \infty.$ , 故

$$
H(0) + \int_{0}^{t} \psi(s) ds = - \infty \forall t \geqslant 0,
$$

而 $H^{- 1}(- \infty) = 0.$

## 11.3 绝对连续函数

设f是定义在R上的函数. 若 $\forall \varepsilon > 0, \exists \delta > 0$ , 使得

$$
x_{1} < x_{2} < \dots, \sum_{n = 1}^{\infty} | x_{n + 1} - x_{n} | < \delta \Longrightarrow \sum_{n = 1}^{\infty} | f(x_{n + 1} - f(x_{n}) | < \varepsilon,
$$

则称f为绝对连续函数.

我们有下面的

定理 11.3.1 $\mathrm{(Newton^{5}{-} Leibnitz^{6}}$ 公式). 设f是绝对连续函数, 则在Lebesgue测度意义下, $f^{\prime}{\mathcal{T}}$ 乎处处存在, 且

$$
f(x) - f(y) = \int_{y}^{x} f^{\prime}(t) dt.
$$

这个结果的证明可见任何一本实变函数教材, 例如[20].

我们还可证明

定理 11.3.2. 设f是绝对连续函数, 且 $\left| f^{\prime} \right| \leqslant C \a.e.$ , 则

$$
| f(x) - f(y) | \leqslant C | x - y |.
$$

若 $f^{\prime}$ 是绝对连续函数, $\mathbb{E} | f^{\prime \prime} | \leqslant C \a.e.$ , 则

$$
| f(y) -[f(x) + f^{\prime}(x)(y - x)] | \leqslant \frac{C}{2} | y - x |^{2}.
$$

证明. 第一式直接由Newton-Leibnitz公式得到. 由于

$$
\begin{array}{rcl} f(y) - f(x) & = & \int_{x}^{y} f^{\prime}(t) dt \\ & = & \int_{x}^{y} \left(f^{\prime}(x) + \int_{x}^{t} f^{\prime \prime}(s) ds\right) dt \\ & = & f^{\prime}(x)(y - x) + \int_{x}^{y} dt \int_{x}^{t} f^{\prime \prime}(s) ds, \end{array}
$$

而

$$
\left| \int_{x}^{y} dt \int_{x}^{t} f^{\prime \prime}(s) ds \right| \leqslant \int_{x}^{y} dt \int_{x}^{t} Cds = \frac{C}{2} | y - x |^{2},
$$

所以第二式成立.

## 11.4 函数的磨光

在R<sup>d</sup>上定义函数:

$$
\varphi(x) = \left\{\begin{array}{ll} c^{- 1} e^{- \frac{1}{1 - | x |^{2}}}, & | x | < 1, \\ 0, & | x | \geqslant 1.\end{array} \right.
$$

其中 $\begin{array}{r}{c : = \int_{| x | < 1} e^{- \frac{1}{1 - | x |^{2}}} dx} \end{array}$

设R<sup>d</sup>上的函数f满足

$$
\int_{\mathbb{R}^{d}} | f(x) | dx < \infty.
$$

$$
f_{n}(x) = n^{d} \int_{\mathbb{R}^{d}} f(y) \varphi(n(x - y)) dy.
$$

易见当 $f(x)$ 在某个有界集外为零时, $f_{n}$ 也在某个有界集(不是前面那个, 可能大一点)外也为零, $f_{n}$ 无穷次可微, 且对f的任意连续点x有

$$
\lim_{n \to \infty} f_{n}(x) = f(x).
$$

## 11.5 指数函数的逼近

对于实数a,

$$
\lim_{n \to \infty} \left(1 + \frac{a}{n}\right)^{n} = e^{a},
$$

下面证明, 上面等式中的实数a换为复数z结论仍成立, 即 $\forall z \in \mathbb{C}$

$$
\lim_{n \to \infty} \left(1 + \frac{z}{n}\right)^{n} = e^{z}.
$$

为此, 设 $z = a + ib$ . 则 $e^{z} = e^{a}(\cos b + i \sin b)$ , 且

$$
\begin{array}{rcl} \left(1 + \frac{z}{n}\right)^{n} & = & \left(1 + \frac{a + ib}{n}\right)^{n} \\ & = & \left(\left(1 + \frac{a}{n}\right) + i \frac{b}{n}\right)^{n} \\ & = & r_{n}(\cos \theta_{n} + i \sin \theta_{n}), \end{array}
$$

其中

$$
r_{n} = \left(\left(1 + \frac{a}{n}\right)^{2} + \left(\frac{b}{n}\right)^{2}\right)^{\frac{n}{2}},
$$

$$
\theta_{n} = n \arctan{\frac{\frac{b}{n}}{1 + \frac{a}{n}}}, n > | a |.
$$

对 $\cdot \theta_{n}$ , 极限

$$
\begin{array}{rcl} \lim_{n \to \infty} \theta_{n} & = & \lim_{n \to \infty} n \arctan \frac{\frac{b}{n}}{1 + \frac{a}{n}} \\ & = & \lim_{n \to \infty} n \frac{\frac{b}{n}}{1 + \frac{a}{n}} = b.\end{array}
$$

对 $\cdot_{r_{n}},$ 取对数后的极限为

$$
\begin{array}{rcl} \lim_{n \to \infty} \ln r_{n} & = & \lim_{n \to \infty} \frac{n}{2} \ln \left(1 + \frac{2a}{n} + \frac{a^{2} + b^{2}}{n}\right) \\ & = & \lim_{n \to \infty} \frac{n}{2} \left(\frac{2a}{n} + \frac{a^{2} + b^{2}}{n}\right) = a.\end{array}
$$

因此

$$
\lim_{n \to \infty} \left(1 + \frac{a + ib}{n}\right)^{n} = e^{a}(\cos b + i \sin b).
$$

命题 11.5.1. 设 $z_{n}.$ ,z是复数, $\mathbb{H} | z_{n} | = o(n^{- 1})$ . 则

$$
\lim_{n \to \infty} \left(1 + \frac{z}{n} + z_{n}\right)^{n} = e^{z}.
$$

证明. 对任意复数 $x, y$ 有

$$
x^{n} - y^{n} = n(x - y) \int_{0}^{1}(x + u(y - x))^{n - 1} du.
$$

而

$$
| x + u(y - x) | \leqslant | x | + | y - x |.
$$

所以当n充分大时

$$
\begin{array}{rcl} \left| \left(1 + \frac{t}{n} + z_{n}\right)^{n} - \left(1 + \frac{z}{n}\right)^{n} \right| & \leqslant & n | z_{n} | \int_{0}^{1} \left(1 + 2 \frac{| z |}{n}\right)^{n - 1} du \\ & \leqslant & n | z_{n} | e^{2 | z |} \to 0,(n \to \infty).\end{array}
$$

因此

$$
\lim_{n \to \infty} \left(1 + \frac{z}{n} + z_{n}\right)^{n} = \lim_{n \to \infty} \left(1 + \frac{z}{n}\right)^{n} = e^{z}.
$$

□

下面考虑实变量的复值函数

$$
f(t) =: e^{zt} = e^{(a + ib) t}, t \in \mathbb{R}.
$$

则

$$
\begin{array}{rcl} f^{\prime}(t) & = &(e^{at} \cos(bt) + ie^{at} \sin(bt))^{\prime} \\ & = & e^{at}(a \cos(bt) - b \sin(bt)) + ie^{at}(a \sin(bt) + b \cos(bt)) \\ & = &(a + ib) e^{(a + ib) t} \\ & = & ze^{zt}.\end{array}
$$

由此可得

$$
\int_{c}^{d} e^{zt} dt = \frac{1}{z} e^{zt} \bigg |_{c}^{d}, \forall c, d \in \mathbb{R}..
$$

这个公式是说, 对实变量复值的指数函数积分时, 你可以形式上将 $z$ 看作实参数来积分就行,与分成实部和虚部分开积分的结果是一致的.

## 11.6 常用分布

1. 离散均匀分布.

分布列:

$$
P(\xi = k) = \frac{1}{N}, k = 1, 2, \dots, N.
$$

2. Bernoulli分布

$$
P(\xi = 1) = p, P(\xi = 0) = q, 0 \leqslant p \leqslant 1, q = 1 - p.
$$

3. 二项分布

$$
P(\xi = k) = C_{n}^{k} p^{k} q^{n - k}, k = 1, 2, \dots, n, 0 \leqslant p \leqslant 1, q = 1 - p, n = 1, 2, \dots
$$

4. Poisson分布

$$
P(\xi = k) = e^{- \lambda} \frac{\lambda^{k}}{k !}, k = 0, 1, 2, \dots, \lambda > 0.
$$

5. 几何分布

$$
P(\xi = k) = pq^{k - 1}, k = 1, 2, \dots, 0 \leqslant p \leqslant 1, q = 1 - p.
$$

6. 负二项分布

$$
P(\xi = k) = C_{k - 1}^{r - 1} p^{r} q^{k - r}, k = r, r + 1, \dots, 0 \leqslant p \leqslant 1, q = 1 - p, r = 1, 2, \dots
$$

7. 均匀分布. 设 $a, b \in \mathbb{R}, a < b.$ 令

$$
f(x) ={\left\{\begin{array}{ll}{{\frac{1}{b - a}},} &{x \in[a, b],} \\{0,} &{{\text{其它}}.} \end{array} \right.}
$$

8. 正态分布. 设 ${\mathbf{}}_{\mathcal{\mu}}, \sigma \in$ R, $\sigma > 0$ . 令

$$
f(x) = \frac{1}{\sqrt{2 \pi \sigma^{2}}} e^{- \frac{(x - \mu)^{2}}{2 \sigma^{2}}}, x \in \mathbb{R}, \mu \in \mathbb{R}, \sigma > 0.
$$

这个分布我们记为 $N(\mu, \sigma^{2}).\(\mu, \sigma) =(0, 1)$ 时称为标准正态分布.

为了方便, 往往将 $\cdot \sigma = 0$ 的情况也认为是正态分布, 是退化正态分布, 因为这时相当于$\xi \equiv 0$

9. 指数分布

$$
f(x) = \lambda e^{- \lambda x}, x \geqslant 0, \lambda > 0.
$$

10. Gamma分布

$$
f(x) = \frac{1}{\Gamma(\alpha) \beta^{\alpha}} x^{\alpha - 1} e^{- \frac{x}{\beta}}, x \geqslant 0, \alpha, \beta > 0.
$$

11. Beta分布

$$
f(x) = \frac{1}{B(r, s)} x^{r - 1}(1 - x)^{s - 1}, 0 \leqslant x \leqslant 1, r, s > 0.
$$

## 12. 双侧指数分布

$$
f(x) = \frac{1}{2} \lambda e^{- \lambda | x - \alpha |}, x \in \mathbb{R}, \lambda > 0, \alpha \in \mathbb{R}.
$$

13. $\chi^{2}$ 分布

$$
f(x) = \frac{1}{\Gamma \left(\frac{n}{2}\right)} 2^{- \frac{n}{2}} x^{\frac{n}{2} - 1} e^{- \frac{x}{2}}, x \geqslant 0, n \geqslant 1.
$$

## 14. Student分布

$$
f(x) = \frac{\Gamma \left(\frac{1}{2}(n + 1)\right)}{\sqrt{n \pi} \Gamma \left(\frac{n}{2}\right)} \left(1 + \frac{x^{2}}{n}\right)^{- \frac{n + 1}{2}}, x \in \mathbb{R}, n \geqslant 1.
$$

15. F分布

$$
f(x) = \frac{\left(\frac{m}{n}\right)^{\frac{m}{2}}}{B \left(\frac{m}{2}, \frac{n}{2}\right)} \cdot \frac{x^{\frac{m}{2} - 1}}{\left(1 + \frac{mx}{n}\right)^{\frac{m + n}{2}}}, x \geqslant 0, m, n \geqslant 1.
$$

16. Cauchy分布

$$
f(x) = \frac{a}{\pi(x^{2} + a^{2})}, x \in \mathbb{R}, a > 0.
$$

容易看出, 指数分布是α = 1, $\begin{array}{r}{\beta = \frac{1}{\lambda}} \end{array}$ 的Gamma分布, 自由度为n的 $\chi^{2}$ 分布是 $\begin{array}{r}{\alpha = \frac{n}{2}, \beta = 2} \end{array}$ 的Gamma 分布.

## 11.6 常用分布

表 11.1: 常见离散型分布表

<table><tr><td>分布名称</td><td>分布列</td><td>期望</td><td>方差</td><td>特征函数</td></tr><tr><td>离散均匀分布 $U(1,2,...,n)$ </td><td> $p_k = \frac{1}{n}, k = 1,2,\cdots,n$ </td><td> $\frac{n+1}{2}$ </td><td> $\frac{n^2-1}{12}$ </td><td> $\frac{e^{it}-e^{i(n+1)t}}{n(1-e^{it})}$ </td></tr><tr><td>二项分布 $B(n,p)$ </td><td> $p_k = C_n^kp^kq^{n-k}, k = 1,2,\cdots,n,$  $0 < p < 1, q = 1 - p$ </td><td> $np$ </td><td> $npq$ </td><td> $(pe^{it} + q)^n$ </td></tr><tr><td>Poisson分布 $P(\lambda)$ </td><td> $p_k = e^{-\lambda \frac{\lambda^k}{k!}}, k = 0,1,\cdots,$  $\lambda > 0$ </td><td> $\lambda$ </td><td> $\lambda$ </td><td> $e^{\lambda(e^{it}-1)}$ </td></tr><tr><td>几何分布 $Ge(p)$ </td><td> $p_k = pq^{k-1}, k = 1,2,\cdots,$  $0 < p < 1, q = 1 - p$ </td><td> $\frac{1}{p}$ </td><td> $\frac{q}{p^2}$ </td><td> $\frac{pe^{it}}{1-qe^{it}}$ </td></tr><tr><td>负二项分布 $NB(r,p)$ </td><td> $p_k = C_{k+r-1}^{r-1} p^rq^k, k = 0,1,\cdots,$  $r = 1,2,\cdots, 0 < p < 1, q = 1 - p$ </td><td> $\frac{rq}{p}$ </td><td> $\frac{rq}{p^2}$ </td><td> $\left(\frac{p}{1-qe^{it}} \right)^r$ </td></tr></table>

表 11.2: 常见连续型分布表

<table><tr><td>分布名称</td><td>密度函数</td><td>期望</td><td>方差</td><td>特征函数</td></tr><tr><td>均匀分布 $U(a,b)$ </td><td> $p(x)=\frac{1}{b-a}, x\in[a,b],$  $a,b\in\mathbb{R}, a< b$ </td><td> $\frac{a+b}{2}$ </td><td> $\frac{(b-a)^2}{12}$ </td><td> $\frac{e^{itb}-e^{ita}}{it(b-a)}$ </td></tr><tr><td>指数分布 $E(\lambda)$ </td><td> $p(x)=\lambda e^{-\lambda x}, x\geqslant 0,$  $\lambda>0$ </td><td> $\frac{1}{\lambda}$ </td><td> $\frac{1}{\lambda^2}$ </td><td> $(1-\frac{it}{\lambda})^{-1}$ </td></tr><tr><td>正态分布 $N(\mu,\sigma^2)$ </td><td> $p(x)=\frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}, x\in\mathbb{R},$  $\mu\in\mathbb{R}, \sigma>0$ </td><td> $\mu$ </td><td> $\sigma^2$ </td><td> $e^{i\mu t-\frac{\sigma^2t^2}{2}}$ </td></tr><tr><td>Gamma分布 $\Gamma(\alpha,\beta)$ </td><td> $p(x)=\frac{\Gamma(\alpha)\beta^\alpha}{x}{}^\alpha-1e^{-\beta x}, x\geqslant 0,$  $\alpha,\beta>0$ </td><td> $\frac{\alpha}{\beta}$ </td><td> $\frac{\alpha}{\beta^2}$ </td><td> $(1-\frac{it}{\beta})^{-\alpha}$ </td></tr><tr><td>Beta分布 $Be(r,s)$ </td><td> $p(x)=\frac{1}{B(r,s)}x^{r-1}(1-x)^{s-1},$  $x\in[0,1],r,s>0$ </td><td> $\frac{r}{r+s}$ </td><td> $\frac{rs}{(r+s)^2(r+s+1)}$ </td><td> $\varphi_{Be}(t)$ </td></tr><tr><td>双侧指数分布 $Laplace(\alpha,\lambda)$ </td><td> $p(x)=\frac{1}{2}\lambda e^{-\lambda|x-\alpha|}, x\in\mathbb{R}$  $a\in\mathbb{R}, \lambda>0$ </td><td> $\alpha$ </td><td> $\frac{2}{\lambda^2}$ </td><td> $\frac{e^{i\alpha t}}{1+\lambda^{-2}t^2}$ </td></tr><tr><td> $\chi^2分布$  $\chi^2(n)$ </td><td> $p(x)=\frac{1}{\Gamma(\frac{n}{2})}2^{-\frac{n}{2}}x^{\frac{n}{2}-1}e^{-\frac{x}{2}},$  $x\geqslant 0,n\geqslant 1$ </td><td> $n$ </td><td> $2n$ </td><td> $(1-2it)^{-\frac{n}{2}}$ </td></tr><tr><td>Student分布 $t(n)$ </td><td> $p(x)=\frac{\Gamma\left(\frac{1}{2}(n+1)\right)}{\sqrt{n\pi}\Gamma\left(\frac{n}{2}\right)}\left(1+\frac{x^2}{n}\right)^{-\frac{n+1}{2}},$  $x\in\mathbb{R}, n\geqslant 1$ </td><td> $0$ </td><td> $\frac{n}{n-2}, n>2$ </td><td> $\varphi_S(t)$ </td></tr><tr><td> $F分布$  $F(m,n)$ </td><td> $p(x)=\frac{\left(\frac{m}{n}\right)^{\frac{m}{2}}}{B\left(\frac{m}{2},\frac{n}{2}\right)}\cdot\frac{x^{\frac{m}{2}-1}}{\left(1+\frac{mx}{n}\right)^{\frac{m+n}{2}}},$  $x\geqslant 0, n\geqslant 1$ </td><td> $\frac{n}{n-2},$  $n>2$ </td><td> $\frac{2n^2(m+n-2)}{m(n-2)^2(n-4)},$  $n>4$ </td><td> $\varphi_F(t)$ </td></tr><tr><td>Cauchy分布 $C(a)$ </td><td> $p(x)=\frac{a}{\pi(x^2+a^2)}, x\in\mathbb{R},$  $a>0$ </td><td>不存在</td><td>不存在</td><td> $e^{a|t|}$ </td></tr></table>

其中

$$
\varphi_{Be}(t) = \frac{\Gamma(r + s)}{\Gamma(s)} \sum_{k = 0}^{\infty} \frac{\Gamma(r + k)(it)^{k}}{\Gamma(r + s + k) \Gamma(k + 1)},
$$

$$
\varphi_{S}(t) = \frac{\Gamma(\frac{n + 1}{2})}{\sqrt{n \pi} \Gamma(\frac{n}{2})}(1 + t^{2})^{- \frac{n + 1}{2}},
$$

$$
\varphi_{F}(t) = \frac{\Gamma(\frac{m + n}{2})}{\Gamma(\frac{m}{2}) \Gamma(\frac{n}{2})} \left(\frac{n}{m}\right)^{\frac{n}{2}} \frac{\Gamma(\frac{m + n}{2} - it)}{\Gamma(\frac{m}{2} - it) \Gamma(\frac{n}{2} - it)}.
$$

## 参考文献

[1] J. Bernoulli: Ars Conjectandi, Impensis Thurnisiorum, Fratrum,1973. (英译: On the law of Large Numbers, O. Sheynin译, Berlin 2005; 中译: 猜度术, 应坚刚译, 上海 2019.)

[2] 崔尚斌: 偏微分方程现代理论引论, 科学出版社, 北京 2016.

[3] R. Courant and D. Hilbert: Methods of Mathematical Physics. V. 1. Wiley Classics. 1989.

[4] W. Feller: An Introduction to Probability Theory and Its Applications, Vol. 2, 2nd ed., New York: Wiley, 1971.

[5] 华罗庚: 高等数学引论, 第一册. 高等教育出版社, 北京 2009.

[6] 华罗庚: 高等数学引论, 第二册. 高等教育出版社, 北京 2009.

[7] 伊藤清: 概率论, 闫理坦译, 人民邮电出版社, 北京 2021.

[8] 柯嘉琪: Hajek-Renyi不等式的推广及其应用, 中山大学学士论文, 2024.

[9] A.N.Kolmogorov: Foundations of the Theory of Probability. 2nd ed., translation edited by Nathan Morrison, with an added bibliography by A. T. Bharucha-Reid. Dover Publications, Inc., Mineola, New York 2020.

[10] 柯尔莫戈洛夫, 佛明:函数论与泛函分析初步. 段虞荣、郑洪深、郭思旭译, 高等教育出版社, 2006.

[11] P. L´evy: Calcul des Probabilit´es, R´eimpression autoris´ee de l’´edition originale publi´ee par Gauthier-Villars en 1925. 2004, 2006(2<sup>e</sup> tirage), Editions Jaques Gabay.<sup>´</sup>

[12] P. Malliavin: Integration and Probability, Springer, 1995.

[13] 李贤平: 概率论基础, 第三版. 高等教育出版社, 北京 2010.

[14] 毛泽东: 论十大关系. 人民日报, 1976年12月26日.

[15] Shafer,G. and Vovk,V.： The origins and legacy of Kolmogorov’s Grundbegrife, https://arxiv.org/abs/1802.06071

[16] D.W.Stroock: Probability Theory: An Analytic View. Cambridge Univ. Press, 1993.

[17] 苏淳: 概率论(第二版), 科学出版社, 北京 2010.

[18] 王蒙: 暗杀3322, 人民文学出版社, 北京 2003.

[19] 王梓坤: 概率论基础及其应用, 北京师范大学出版社, 北京 1996.

[20] 杨力华: 实变函数论教程, 科学出版社, 北京 2017.

[21] 应坚刚, 何萍: 概率论(第二版), 复旦大学出版社, 上海 2016.

## 索引

## A

a.s., 81

## B

Bayes公式, 38, 43, 87 Bayes公式(可列概型), 59 Bernoulli分布, 33, 109 Bernoulli概型, 19, 28 Bernoulli概型(n重), 19 Borel σ-代数, 97 Borel σ-代数(n-维), 101 Borel σ-代数(一维), 97 Borel σ-代数(二维), 100 Borelσ-代数, 80 Borel(可测)函数, 101 Borel集, 80 不相关, 179 不相容, 12 不等式 Bihari-LaSalle, 285 Cauchy-Schwarz, 186 Chatterji, 207 Chebyshev, 141 Doob, 210 Gronwall, 286 H¨older, 186 Jensen, 185 Kolmogorov, 210 Minkowski, 186, 228 Ottaviani, 206 Rio, 207 Zakai, 287 广义Hajek-Renyi, 221 并, 12 必然事件, 12

边沿分布, 120闭集, 97

## C

C(F), 245$C_{0},$ 170$C_{0}^{\infty}$ , 170C<sub>b</sub>, 170乘法公式, 37乘积概率空间, 85差, 12抽样无放回无顺序, 21无放回有顺序, 21有放回无顺序, 23有放回有顺序, 21次可列可加性, 58次可列可加性(可列概型), 59

## D

De Morgan原理, 15Dirichlet积分, 239Helly第二, 259代数, 51单调类, 77多项概型, 28大数定律, 217Bernoulli, 218Chebyshev, 217Markov, 217定理π − λ, 79π − λ , 52Fubini, 162, 164Glivenko-Cantelli, 224Helly第一, 248

Helly第二, 246Lindeberg, 272Skorokhod表现定理, 258Weierstrass, 218单调类1, 78单调类2, 79控制收敛, 159随机变量的存在性, 127对称差, 12独立古典概型, 26有限概型, 46独立性, 25事件, 88离散概型, 66随机变量, 191集类, 89

## E

二项分布, 33, 109二项概型, 28

## F

分割, 44, 64分布函数, 60, 106, 107分布函数(二维), 117分布函数(多维), 117分布列, 108分布列(可列概型), 59反演公式(d-维), 254反演公式初级版, 240反演公式完整版, 243复随机变量, 227方差, 63, 177

## G

公式全概率, 40古典概型, 19概率, 81概率分布, 106概率空间, 81规范性, 81

## H

互不相容, 12

## J

交, 12几乎必然收敛, 151几乎必然相等, 107几何分布, 110几何概型, 84加法公式, 20, 29, 58, 59, 81加法原理, 20均匀分布, 291矩, 178简单Borel函数, 103

## K

Kolmogorov0 − 1律, 95 Kronecker引理, 220 可列可加性, 58, 81 可列可加性(可列概型), 59 可列概型, 57 可略, 81 可积(可列概型), 61 可积(简单随机变量), 135 开集, 97

## L

λ-类, 78λ -类, 49Lebesgue基本定理, 158Lebesgue测度, 84离散型分布, 108离散型随机变量, 108离散型随机变量(多维), 119离散概型, 57联合分布, 120联合分布列, 60连续型分布, 110连续型分布(多维), 119连续型随机变量, 110连续型随机变量(多维), 119

## M

密度函数, 110

## 索引

母函数, 69

## N

Newton-Leibnitz公式, 288逆事件, 13

## P

P(λ, a), 59 π-类, 49 π − λ定理, 79 p-阶矩, 178 Poisson分布, 59, 110 Poisson分布(跳为a), 59

## Q

全排列, 21全期望公式, 45全概率公式, 45, 88全概率公式(可列概型), 59强大数定律, 223Kolmogorov, 223期望一般情形, 139关于参数的可微性, 165关于参数的连续性, 164简单随机变量, 135非负随机变量, 138期望(可列概型), 61期望(有限概型), 30期望(非负简单随机变量), 134

## R

Riemann-Stieltjes积分, 166 弱收敛, 245

## S

σ-代数, 76 Stein-Chen方法, 70 上极限, 13 上连续, 82 事件域, 81 实值随机变量, 103 生成的λ<sub>0</sub>-类, 52 生成的代数, 52

示性函数, 15随机变量, 103随机变量(可列概型), 59随机变量(多维), 104随机变量(有限概型), 30

## T

Toeplitz引理, 220停时, 211凸函数, 184条件分布列(给定事件), 60条件分布列(给定随机变量), 60条件期望, 64, 188条件期望(给定分割), 45条件概率, 37, 87条件概率(可列概型), 58条件概率(给定分割), 44, 64条件独立, 89特征函数, 228特征函数(多维), 252

## W

Wald等式, 212 尾概率, 183

## X

下极限, 13下连续, 82协方差, 179相互独立事件, 88选排列, 21

## Y

一致可积, 161余集, 13依分布收敛, 245依概率收敛, 152原像, 96引理Borel-Cantelli第一, 86Borel-Cantelli第二, 95Fatou, 159Pratt, 161

有限可加性, 29 有限概型, 27 样本点, 9 样本空间, 9

Z

中心极限定理, 267

中心极限定理

Laplace, 268

再生性(分布的), 263

指数分布, 111, 112

正态分布, 113, 291

多维, 120
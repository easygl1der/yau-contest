命题 5.1.4. 简单随机变量

$$
\xi := \sum_{n = 1}^{\infty} x_{n} 1_{A_{n}}
$$

可积的充要条件是

$$
\sum_{n = 1}^{\infty} | x_{n} | P(A_{n}) < \infty,
$$

且此时

$$
E[\xi] = \sum_{n = 1}^{\infty} x_{n} P(A_{n}).
$$

简单随机变量的期望有以下性质:

命题 5.1.5. (i) 线性性: 设 $a, b \in \mathbb{R}, \xi, \eta$ 可积, 则 $a \xi + b \eta$ 也可积, 且

$$
E[\alpha \xi + b \eta] = aE[\xi] + bE[\eta];
$$

(ii) 单调性: 设ξ, η可积, 则:

$$
\xi \leqslant \eta \Longrightarrow E[\xi] \leqslant E[\eta];
$$

(iii) 设ξ可积, 则

$$
| E[\xi] | \leqslant E[| \xi |].
$$

证明. (i) 设

$$
\xi = \sum_{n = 1}^{\infty} c_{n} 1_{A_{n}},
$$

$$
\eta = \sum_{n = 1}^{\infty} d_{n} 1_{B_{n}},
$$

其中 $\textstyle \sum_{n = 1}^{\infty} A_{n} = \sum_{n = 1}^{\infty} B_{n} = \Omega$ . 将它们各自改写为

$$
\xi = \sum_{m, n = 1}^{\infty} c_{n} 1_{B_{m} A_{n}},
$$

$$
\eta = \sum_{m, n = 1}^{\infty} d_{m} 1_{B_{m} A_{n}}.
$$

则

$$
a \xi + b \eta = \sum_{m, n = 1}^{\infty}(ac_{n} + bd_{m}) 1_{B_{m} A_{n}}.
$$

## 5.1 简单随机变量情形

因此 $a \xi + b \eta$ 也是简单随机变量, 且

$$
\begin{array}{rcl} E[a \xi + b \eta] & = & \sum_{m, n = 1}^{\infty}(ac_{n} + bd_{m}) P(B_{m} A_{n}) \\ & = & a \sum_{m, n = 1}^{\infty} c_{n} P(B_{m} A_{n}) + b \sum_{m, n = 1}^{\infty} d_{m} P(B_{m} A_{n}) \\ & = & a \sum_{n = 1}^{\infty} c_{n} \sum_{m = 1}^{\infty} P(B_{m} A_{n}) + b \sum_{m = 1}^{\infty} d_{m} \sum_{n = 1}^{\infty} P(B_{m} A_{n}) \\ & = & a \sum_{n = 1}^{\infty} c_{n} P \left(\left(\bigcup_{m = 1}^{\infty} B_{m}\right) A_{n}\right) + b \sum_{m = 1}^{\infty} d_{m} P \left(B_{m} \left(\bigcup_{n = 1}^{\infty} A_{n}\right)\right) \\ & = & a \sum_{n = 1}^{\infty} c_{n} P(A_{n}) + b \sum_{m = 1}^{\infty} d_{m} P(B_{m}) \\ & = & aE[\xi] + bE[\eta].\end{array}
$$

注意上述运算之所以畅通无阻, 是因为我们假定了可积性, 即

$$
\sum_{n = 1}^{\infty} | c_{n} | P(A_{n}) < \infty, \sum_{n = 1}^{\infty} | d_{n} | P(B_{n}) < \infty.
$$

(见习题2.)

(ii) 首先注意若 $\xi \geqslant 0,$ , 则 $E[\xi] \geqslant 0.$ . 其次, 因 $\eta - \xi \geqslant 0.$ , 由(i),

$$
E[\eta] - E[\xi] = E[\eta - \xi] \geqslant 0.
$$

(iii) 因 $- | \xi | \leqslant \xi \leqslant | \xi |$ , 由(1)和(ii),

$$
- E[| \xi |] \leqslant E[\xi] \leqslant E[| \xi |].
$$

## 习题

1. 设 $\xi_{i}, i = 1, \cdots$ ,n是简单随机变量, f : R<sup>n</sup> 7→ R是函数. 证明 $f(\xi_{1}, \cdots, \xi_{n})$ 仍然是简单随 机变量.

2. 证明简单随机变量 $\begin{array}{r}{{\bf \Phi} \cdot \xi : = \sum_{n = 1}^{\infty} x_{n} \boldsymbol{1}_{A_{\prime}}} \end{array}$ 可积的充要条件是

$$
\sum_{n = 1}^{\infty} | x_{n} | P(A_{n}) < \infty.
$$

3. 设简单随机变量 $\begin{array}{r}{\xi : = \sum_{n = 1}^{\infty} x_{n} 1_{A_{r}}} \end{array}$ 可积. 证明

$$
E[\xi] := \sum_{n = 1}^{\infty} x_{n} P(A_{n}).
$$

## 5.2 一般情形

现在我们要对一般的随机变量也定义期望. 定义的方法是通过离散逼近. 具体地说就是:定义 5.2.1. (i) 设ξ是非负实值随机变量, $\xi_{n}$ 是简单随机变量列, 且

$$
\xi_{n}(\omega) \rightrightarrows \xi(\omega) a.s.,
$$

即 $\mid \xi_{n}$ 在一个可略集外, 关于ω一致收敛于 $\cdot \xi,$ 则定义

$$
E[\xi] := \lim_{n \to \infty} E[\xi_{n}].
$$

(ii) 设 $\xi$ 是非负随机变量, 且 $P(\xi = \infty) > 0$ , 则定义

$$
E[\xi] = \infty.
$$

为使这个定义合理, 我们要说明两件事情. 第一是对任意非负实值随机变量, 至少有一个简单随机变量序列 $| \xi_{n}$ 使得 $\xi_{n} \implies \xi ~ \mathrm{a.s.}$ .. 这的确是可以做到的, 例如可令

$$
j_{n}(\xi) = \sum_{k = 0}^{\infty} k2^{- n} 1_{[k2^{- n},(k + 1) 2^{- n})}(\xi).
$$

则除非 $\xi(\omega) = \infty$ (这样的ω全体构成一个可略集), 否则均有

$$
| j_{n}(\xi)(\omega) - \xi(\omega) | < 2^{- n}.
$$

所以 $j_{n}(\xi) \overset{}{} \xi \mathrm{a.s}$

第二是对一致收敛于ξ的 $\xi_{n}$ , 极限 $\scriptstyle \operatorname{lim}_{n \to \infty} E[\xi_{n}]$ 的确存在且不依赖于 $\xi_{n}$ 的选择.

因为 $| \xi_{n} \xi \mathrm{a.s.}$ , 所以∀ε $> 0, \exists N_{\varepsilon},$ 当 $m, n$ ⩾ $N_{\varepsilon}$ 有

$$
\left| \xi_{n} - \xi_{m} \right| \leqslant \varepsilon, a.s.\omega.
$$

故

$$
E[| \xi_{n} - \xi_{m} |] \leqslant \varepsilon.
$$

因此当 $n \geqslant N_{1}$ 时, 所有的 $| \xi_{n}$ 要么同时可积, 要么同时不可积, 且当它们可积时, 对 $m, n > N_{\varepsilon}$ 有

$$
\left| E \left[\xi_{n} \right] - E \left[\xi_{m} \right] \right| \leqslant E \left[\left| \xi_{n} - \xi_{m} \right| \right] \leqslant \varepsilon.
$$

所以极限的确存在.

若 $\xi_{n} \implies \xi ~{\mathrm{a.s.}}, \eta_{n} \implies \xi ~{\mathrm{a.s.}}$ ., 令

$$
\zeta_{n} = \left\{\begin{array}{ll} \xi_{k} & n = 2k - 1 \\ \eta_{k} & n = 2k.\end{array} \right.
$$

则 $\zeta_{n} \xi \mathrm{a.s.}$ .. 所以 $\scriptstyle \operatorname{lim}_{n \to \infty} E[\zeta_{n}]$ 存在. 因此

$$
\lim_{n \to \infty} E[\xi_{n}] = \lim_{n \to \infty} E[\eta_{n}].
$$

所以这个极限不依赖于 $\dot{\cdot} \xi_{n}$ 的选择.

现在我们可以对一般的随机变量定义期望.

定义 5.2.2. 对一般的 $\xi,$ 若下面两式中至少之一成立:

$$
E[\xi^{+}] < \infty, E[\xi^{-}] < \infty,
$$

则定义

$$
E[\xi] := E[\xi^{+}] - E[\xi^{-}].
$$

若 $E[\xi^{+}] + E[\xi^{-}] < \infty$ , 则称ξ可积.

注. 1. 按定义, 非负实值随机变量的数学期望总是存在的, 它要么是实数, 要么是无穷大. 并且, 因为

$$
E[j_{n}(\xi)] \leqslant E[j_{n + 1}(\xi)] \leqslant E[j_{n}(\xi)] + 2^{- n},
$$

所以 $E[\xi]$ 是无穷大的充分必要条件是每个 $E[j_{n}(\xi)]$ 都是无穷大.

若 $\dot{\boldsymbol{\varsigma}}$ 为可积随机变量, 定义

$$
j_{n}(\xi) := j_{n} \left(\xi^{+}\right) - j_{n} \left(\xi^{-}\right).
$$

因 $j_{n}(\xi^{+}) \xi^{+} \a.s., \j_{n}(\xi^{-}) \xi^{-} \a.s$ , 故 $: j_{n}(\xi) : \Longrightarrow \xi^{+} - \xi^{-} = \xi \{a.s.}$ , 且 $\begin{array}{rl}{\operatorname{lim}_{n \infty} E[j_{n}(\xi)] =} \end{array}$ E[ξ].

而且, 若ξ可积且

$$
\xi_{n}(\omega) \Longrightarrow \xi(\omega) a.s.,
$$

则总有

$$
E[\xi] = \lim_{n \to \infty} E[\xi_{n}].
$$

特别地,

$$
\xi = \eta a.s.\Longrightarrow E[\xi] = E[\eta].
$$

2. 同样是按定义, 当 $\xi$ 可积时, 必有 $P(\xi = \infty) = 0$

3. 对一般的随机变量ξ, 之所以要求 $E[\xi^{+}]$ 与 $E[\xi^{-}]$ 中至少一个是有限的, 是因为要避免出$\operatorname{\mathbb{E}} \mathbb{\infty} - \infty$ 这样一个没有意义的情况.

4. ξ可积时, $| E[\xi] | \leqslant E[| \xi |] < \infty$

5. 由定义, 期望是一种和的极限, 因此是积分, 故也常常用积分符号表示期望, 即用

$$
\int_{\Omega} \xi(\omega) P(d \omega), \int_{\Omega} \xi(\omega) dP(\omega), \text{或} \int \xi dP
$$

表示 $E[\xi]$

注意, 如果取 $\Omega =[0, 1], \mathcal{F} = \mathcal{B}([0, 1]), P = \mathrm{{Lebesgue}}$ 测度, 则上面定义的积分就是所谓的Lebesgue积分. 而将所有区间 $[n, n + 1)$ 合并起来, 则得到R上的Lebesgue积分. 根据实变函数论, 一个非负函数如果是Riemann可积的, 则一定是Lebesgue可积的, 且两个积分相等. 所以, 此后我们将不加区别地使用

$$
\int_{\mathbb{R}} f(t) dt
$$

代表这个积分, 并默认它首先是Lebesgue积分, 但如果它是Riemann可积的(比如说f分段连续时), 也可理解为Riemann积分.

根据定义易见, 当ξ是离散型的时候, $E[\xi]^{\mathrm{criptsize \equiv}}$ 以通过ξ的分布列进行计算. 自然的期待是,当ξ 为连续型时, $E[\xi]^{\cdot}$ 可以通过ξ的密度函数来计算. 这就是下面的:

命题 5.2.3. (i) 设ξ是离散型随机变量, 分布列为 $(x_{n}, p_{n})$ . 若 $\begin{array}{r}{\sum_{n} | x_{n} | p_{n} < \infty} \end{array}$ , 则

$$
E[\xi] = \sum_{n} x_{n} p_{n}.
$$

(ii) 设ξ为连续型随机变量, 密度函数为 $p(x)$ . 若

$$
\int_{- \infty}^{\infty} | x | p(x) dx < \infty,
$$

则 $E[\xi]$ 存在且

$$
E[\xi] = \int_{- \infty}^{\infty} xp(x) dx.
$$

证明. (i) 此时ξ可表示为

$$
\xi = \sum_{n} x_{n} 1_{A_{n}},
$$

其中 $A_{n} = \{\xi = x_{n}\}$ . 因此 $P(A_{n}) = p_{n}$ . 于是 $\begin{array}{r}{\sum_{n} | x_{n} | p_{n} < \infty} \end{array}$ 时有

$$
E[\xi] = \sum_{n} x_{n} p_{n}.
$$

(ii) 只要注意

$$
\begin{array}{rcl} \left| E \left[j_{n}(\xi^{+}) \right] - \int_{0}^{\infty} xf(x) dx \right| & = & \left| \sum_{k = 0}^{\infty} k2^{- n} P(j_{n}(\xi) = k2^{- n}) - \int_{0}^{\infty} xf(x) dx \right| \\ & = & \left| \sum_{k = 0}^{\infty} \int_{k2^{- n}}^{(k + 1) 2^{- n}}(k2^{- n} - x) f(x) dx \right| \\ & \leqslant & 2^{- n} \int_{0}^{\infty} f(x) dx \\ & \leqslant & 2^{- n} \end{array}
$$

和

$$
\left| E \left[j_{n}(\xi^{-}) \right] + \int_{- \infty}^{0} xf(x) dx \right| \leqslant 2^{- n}.
$$

□

现在我们研究期望的基本性质. 首先我们有:

引理 5.2.4. 设 $\xi, \eta$ 可积, $a, b$ 是常数, 则

$$
E[a \xi + b \eta] = aE[\xi] + bE[\eta].
$$

这个结果称为期望的线性性.

证明. 设 $\xi_{n} \setminus \eta_{n}$ 是简单随机变量,且

$$
\xi_{n} \rightrightarrows \xi a.s., \eta_{n} \rightrightarrows \eta a.s..
$$

## 5.2 一般情形

则 $a \xi_{n} + b \eta_{n}$ 也是简单随机变量且

$$
a \xi_{n} + b \eta_{n} \Longrightarrow a \xi + b \eta a.s..
$$

于是, 用命题5.1.5之(i), 我们有

$$
\begin{array}{rcl} E[a \xi + b \eta] & = & \lim_{n \to \infty} E[a \xi_{n} + b \eta_{n}] \\ & = & a \lim_{n \to \infty} E[\xi_{n}] + b \lim_{n \to \infty} E[\eta_{n}] \\ & = & aE[\xi] + bE[\eta].\end{array}
$$

推论 5.2.5. 设ξ与η期望均存在, 则 (i)

$$
\xi \geqslant 0 \Longrightarrow E[\xi] \geqslant 0;
$$

(ii)

$$
\xi \leqslant \eta \Longrightarrow E[\xi] \leqslant E[\eta];
$$

(iii)

$$
| E[\xi] | \leqslant E[| \xi |].
$$

证明. (i)直接由期望的定义.

(ii) 若ξ, η可积, 直接由(i)及线性性有

$$
E[\eta] - E[\xi] = E[\eta - \xi] \geqslant 0.
$$

若ξ不可积, 因为 $jj_{n}(\xi) \leqslant j_{n}(\eta)$ , 则 $\eta$ 也不可积, 结论也成立.

(iii) 因为

$$
- | \xi | \leqslant \xi \leqslant | \xi |,
$$

所以

$$
- E[| \xi |] \leqslant E[\xi] \leqslant E[| \xi |].
$$

□

我们由此可以得到Chebyshev<sup>1</sup>不等式:

定理 5.2.6. (Chebyshev不等式) 设 $\xi \geqslant 0$ 是随机变量, $a > 0 \#$ 常数. 则

$$
P(\xi \geqslant a) \leqslant \frac{E[\xi]}{a}.
$$

证明. 我们有

$$
aP(\xi \geqslant a) = aE[1_{\xi \geqslant a}] \leqslant E[\xi 1_{\xi \geqslant a}] \leqslant E[\xi].
$$

此不等式很少有直接使用的, 使用得更多的是它的一些变体. 这里的总体想法是, 如果f是定义在 $[0, \infty)$ 上的单调上升函数, 且 $x > 0 \forall \forall f(x) > 0,$ 那么对任意(即不管是否非负)ξ有

$$
P(| \xi | \geqslant a) = P(f(| \xi |) \geqslant f(a)) \leqslant \frac{E[f(| \xi |)]}{f(a)}.
$$

以下是几种常用的取法: 取 $f(x) = x^{\alpha}, \alpha >$ 0就有

$$
P(| \xi | \geqslant a) \leqslant \frac{E[| \xi |^{\alpha}]}{a^{\alpha}};
$$

对 $| \xi - E[\xi] |$ 用上式则有

$$
P(| \xi - E[\xi] | \geqslant a) \leqslant \frac{E[| \xi - E[\xi] |^{\alpha}]}{a^{\alpha}};
$$

取 $f(x) = \exp \{\lambda x\}, \lambda \in I$ , 其中 ${}^{1} I \subset \mathbb{R}_{+}$ , 则有

$$
P(| \xi | \geqslant a) \leqslant e^{- \lambda a} E[\exp \{\lambda | \xi |\}];
$$

等等. 在最后一个不等式中, 因为λ可以跑遍 $^{! I,}$ 故

$$
P(| \xi | \geqslant a) \leqslant \inf_{\lambda \in I} e^{- \lambda a} E[\exp \{\lambda | \xi |\}].
$$

这么做的好处是对不同的 $| a,$ , 使得右边接近最小值的λ可能不一样的, 因此需要对不同的a取最合适的λ, 以得到最佳估计.

由此可以得到:

推论 5.2.7. $E[| \boldsymbol{\xi} |] = 0$ 当且仅当 $P(\xi = 0) = 1$

证明. $\forall n$ , 由Chebyshev不等式有

$$
P(| \xi | \geqslant \frac{1}{n}) \leqslant nE[| \xi |] = 0.
$$

由于

$$
\{\xi \neq 0\} = \bigcup_{n = 1}^{\infty} \left\{| \xi | \geqslant \frac{1}{n} \right\},
$$

所以由概率的下连续性有

$$
P(\xi \neq 0) = \lim_{n \rightarrow \infty} P \left(\left\{| \xi | \geqslant \frac{1}{n} \right\}\right) = 0.
$$

我们还可以得到:

命题 5.2.8. 设 $\xi^{2}, \eta^{2}$ 可积, 则成 $\yen 123,456,78$ 不等式

$$
(E[\xi \eta])^{2} \leqslant E[\xi^{2}] E[\eta^{2}].
$$

当 $E[\xi^{2}]$ 和 $E[\eta^{2}]$ 都为零时, 显然等式成立; 当E[ξ<sup>2</sup>]和 $E[\eta^{2}]$ 有一个不为零, 比如当 $E [ \xi ^ { 2 } ] > 0 \forall $ 等式成立的充要条件是存在 $.t_{0} \in$ R, 使 $P(\eta = t_{0} \xi) = 1$

## 5.3 计算期望的例子

证明. 因为 $| 2 \xi \eta \leqslant \xi^{2} + \eta^{2}$ , 显然ξη可积. 记

$$
f(t) := E[(t \xi - \eta)^{2}],
$$

则 $f(t) \geqslant 0;$ , 且

$$
f(t) = t^{2} E[\xi^{2}] - 2tE[\xi \eta] + E[\eta^{2}].
$$

当 $E[\xi^{2}] = 0$ , 则 $P(\xi = 0) = 1$ . 因此不等式显然成立. 当 $E[\xi^{2}] > 0 \mathbb{H}\}, f(t)$ 为关于t的非负一元二次函数, 因而其判别式

$$
\Delta = 4(E[\xi \eta])^{2} - 4E[\xi^{2}] E[\eta^{2}] \leqslant 0,
$$

即Cauchy不等式成立.

当 $E[\xi^{2}] >$ 0时, 若等式成立, 则存在 $t_{0} \in \mathbb{R}.$ , 使 $f(t_{0}) = E[(t_{0} \xi - \eta)^{2}] = 0$ . 由推论5.2.7, 因此 $P(\eta = t_{0} \xi) = 1$ . 若 $P(\eta = t_{0} \xi) = 1$ , 显然等式成立. □

## 习题

1. 将引理5.2.4推广到期望存在的情景, 即证明：当 $aE[\xi] + bE[\eta]$ 有意义时, $E[a \xi + b \eta]$ 也存在且两者相等；反之, 当 $E[a \xi + b \eta]$ 存在时, $aE[\xi] + bE[\eta]$ 有意义且两者相等.

2. 证明: ξ可积的充要条件为

$$
\sum_{n = 0}^{\infty} P(| \xi | \geqslant n) < \infty.
$$

## 5.3 计算期望的例子

前面我们定义了随机变量的期望并研究了它的一些基本性质. 至于它的计算, 在有些情况下该随机变量的分布是已知的, 此时期望就是一个级数或者是一个积分, 因此问题是比较明确的(明确地难或者明确地易); 另外一些情况则是其分布并不清楚, 此时就要利用期望的性质, 而不是死算; 还有一些情况应用中的问题, 这样的问题更具有挑战性, 当然也就更有趣.

我们来看一些例子.

1. 设 $\xi \sim B(p)$ , 即参数为p的Bernoulli分布.

我们有

$$
E[\xi] = 0 \cdot q + 1 \cdot p = p.
$$

2. 设 $\xi_{i} \sim B(p_{i}), i = 1, \cdot \cdot \cdot, n$ . 令

$$
\xi := \sum_{i = 1}^{n} \xi_{i}.
$$

求E[ξ].

ξ显然是值域为 $\{0, 1, \cdots, n\}$ 的离散型随机变量. 如果直接按定义计算, 为求 $E[\xi]$ , 得知道ξ的分布列, 但不幸的是我们并不知道它. 注意, 我们并没有假定ξ 们独立(这是下一章将介绍的概念). 当 $I \xi_{i}$ 们独立时倒是能计算出ξ 的分布列, 但计算会比较繁琐, 因而容易出错, 并且是毫无必要的.

好在我们注意到, 在引理5.2.4中, 并不要求ξ和η独立. 所以有

$$
E[\xi] = \sum_{i = 1}^{n} E[\xi_{i}] = \sum_{i = 1}^{n} p_{i}.
$$

特别地, 当 $| p_{i} = p, \forall i = 1, 2, \cdot \cdot \cdot, n$ 时, 上式等于np.

所以你一定要记牢 $\vec{J}$ , 在公式

$$
E[\xi + \eta] = E[\xi] + E[\eta]
$$

中, 不需要ξ与η独 ${\dot{\overline{{\mathbf{\Gamma}}}}},$ 这会省掉很多麻烦.

把这个例子应用到二项分布. 设 $\xi \sim B(n, p)$ , 由2.3节例2, 则

$$
\xi = \sum_{i = 1}^{n} \xi_{i},
$$

其中 $\xi_{i} \sim B(p)$ . 所以 $E[\xi] = np$ . 注意我们这里并不需要用到 $\xi_{1}, \cdots, \xi_{n}$ 的独立性, 尽管它们的确是独立的.

再看一个例子:

3. 在 $\{1, 2, \cdots, n\}$ 中无放回地取k个数 $(k \leqslant n)_{i}$ , 求取出的数字之和ξ的期望.

设第i次取出的是 $\xi_{i},$ , 显然 $\xi_{i}$ 与 $\xi_{1}$ 同分布, ∀i. 因此由期望的线性性有

$$
E[\xi] = \sum_{i = 1}^{k} E[\xi_{i}] = kE[\xi_{1}].
$$

因为

$$
P(\xi_{1} = j) = \frac{1}{n}, \forall j = 1, \dots, n,
$$

所以

$$
E[\xi_{1}] = \frac{1}{n} \sum_{j = 1}^{n} j = \frac{n + 1}{2}.
$$

由此

$$
E[\xi] = \frac{k(n + 1)}{2}.
$$

我们注意到, 当k = n时, $\begin{array}{r}{E[\xi] = \frac{n(n + 1)}{2}} \end{array}$ . 这当然是必须的, 否则公式就错了.4. 设 $\xi \sim P(\lambda)$ , 即参数为λ的 $Poisson \Re$ 布.

我们有

$$
\begin{array}{rcl} E[\xi] & = & \sum_{k = 0}^{\infty} k \frac{\lambda^{k}}{k !} e^{- \lambda} = \sum_{k = 1}^{\infty} k \frac{\lambda^{k}}{k !} e^{- \lambda} = \lambda \sum_{k = 1}^{\infty} \frac{\lambda^{k - 1}}{(k - 1) !} e^{- \lambda} \\ & = & \lambda \sum_{k = 0}^{\infty} \frac{\lambda^{k}}{k !} e^{- \lambda} = \lambda.\end{array}
$$

5. 设ξ服从几何分布.

此时

$$
P(\xi = k) = q^{k - 1} p, k = 1, 2, \dots, q = 1 - p, 0 < p < 1.
$$

## 5.3 计算期望的例子

所以

$$
\begin{array}{rcl} E[\xi] & = & \sum_{k = 1}^{\infty} kq^{k - 1} p = p \frac{d}{dq} \sum_{k = 1}^{\infty} q^{k} \\ & = & p \frac{d}{dq}[\frac{q}{1 - q}] = p \frac{1}{(1 - q)^{2}} = \frac{1}{p}, \end{array}
$$

其中第二个等式是因为幂级数在收敛半径内求导和级数可以换序.

6. 设天上有n架飞机, 地下有m架高炮, 每门高炮独立瞄准射击. 某门高炮瞄准了某架飞机时命中率是 $_{.} \alpha;$ 没有瞄准时, 命中率是 $.0 / \sharp \sharp$ 瞎撞上的概率是0). 求一次齐射之后,命中飞机的平均数.

V.I.Arnold<sup>4</sup> 讲过一个故事:二战期间, 德军兵临莫斯科城下时,斯大林为城市防空问题请教过Kolmogorov, 问怎样协调各门高炮瞄准的目标才能达到最好效果. Kolmogorov的回答是:乱打(即各打各的).本题试图给Kolmogorov的回答一个解释.

令C 表示第i架飞机被击中, 再令

$$
\xi_{i} := 1_{C_{i}}.
$$

则被击中的飞机数为ξ $\textstyle : = \sum_{i = 1}^{n} \xi_{i}$ . 所以

$$
E[\xi] = E[\sum_{i = 1}^{n} \xi_{i}] = \sum_{i = 1}^{n} E[\xi_{i}].
$$

由于每架飞机的地位相同, 所以 $E[\xi_{1}] = \cdot \cdot \cdot = E[\xi_{n}]$ . 因此 $E[\xi] = nE[\xi_{1}]$

下面求 $E[\xi_{1}]$ . 令

A<sub>k</sub> := {第k门炮瞄准第1架飞机},

$$
B_{k} := \{\text{第} k \text{门炮命中第1架飞机}\},
$$

则

$$
P(A_{k}) = \frac{1}{n}, P(B_{k} | A_{k}) = \alpha, k = 1, 2, \dots, m.
$$

注意 $A_{1} B_{1}, A_{2} B_{2}, \dotsb, A_{m} B_{m}$ 独立, 因此 $(A_{1} B_{1})^{c},(A_{2} B_{2})^{c}, \cdot \cdot \cdot,(A_{m} B_{m})^{\bullet}$ <sup>c</sup>也独立. 且

$$
C_{1} = \bigcup_{k = 1}^{m} A_{k} B_{k}, P(C_{1}^{c}) = \bigcap_{k = 1}^{m}(A_{k} B_{k})^{c}
$$

所以

$$
\begin{array}{rcl} P(C_{1}) & = & 1 - P(C_{1}^{c}) \\ & = & 1 - P(\bigcap_{k = 1}^{m}(A_{k} B_{k})^{c}) \\ & = & 1 - \prod_{k = 1}^{m} P((A_{k} B_{k})^{c}) \\ & = & 1 - \prod_{k = 1}^{m}(1 - P(A_{k} B_{k})) \\ & = & 1 - \prod_{k = 1}^{m}(1 - P(A_{k}) P(B_{k} | A_{k})) \\ & = & 1 -(1 - \frac{\alpha}{n})^{m}.\end{array}
$$

所以

$$
E[\xi_{1}] = 1 -(1 - \frac{\alpha}{n})^{m}.
$$

于是

$$
E[\xi] = n \left(1 -(1 - \frac{\alpha}{n})^{m}\right).
$$

因为当n大时

$$
(1 - \frac{\alpha}{n})^{m} \approx 1 - m \frac{\alpha}{n},
$$

所以当n大时,

$$
E[\xi] \approx m \alpha.
$$

而理想的情况是, 通过相互协调, 安排每门高炮瞄准不同的飞机,击中飞机数的期望最好也是mα架. 所以各自为战和相互协调的最好效果差不多. 况且相互协调是需要时间的, 因此协调过程中很可能贻误战机. 所以Kolmogorov的答案是各自为战.

当然, 现在的情况不同了, 伟大如Kolmogorov的结论也可能已经过时. 比如爱国者防空导弹系统, 对空域的严密监控和火炮的协同指挥是计算机系统自动执行和瞬间完成的, 且α接近于1. 这时候应该就是逐个消灭, 而不是乱打了. 这也许可以作为随着科技的进步, 概率论的作用逐渐式微的一个例证吧.

7. 设一个班有两个组, A组有n个学生, B组有m个学生. 教师每次从学生中随机抽查一个人的作业. 问: 若要抽查到A组中r个不同学生的作业, 需要抽查的总次数的期望是多少?

以 $\xi_{1}, \xi_{2}, \cdots, \xi_{r}$ 记依次抽查到A组中第1, $2, \cdots$ ,r新学生需要的次数 (即: $\xi_{i}$ 表示在A组中抽到第i−1个学生开始算起, 再抽到第i个新学生需要的次数). 则抽查出r个学生需要的次数为

$$
\xi = \xi_{1} + \xi_{2} + \dots + \xi_{r}.
$$

令

$$
p_{i} := \frac{n - i + 1}{m + n}, q_{i} := 1 - p_{i}, i = 1, 2, \dots, r,
$$

则 $| p_{i}$ 表示A组中抽到第i−1个学生后, 下次再从A组中抽第i个学生的概率. 因此

$$
P(\xi_{1} = k) = q_{1}^{k - 1} p_{1}, k = 1, 2, \dots,
$$

## 5.3 计算期望的例子

一般地有

$$
P(\xi_{i} = k) = q_{i}^{k - 1} p_{i}, k = 1, 2, \dots.
$$

所以 $\cdot \xi_{i}$ 服从参数为 $\eta_{i}$ 的几何分布, 且

$$
E[\xi_{i}] = \frac{1}{p_{i}}.
$$

所以

$$
\begin{array}{rcl} E[\xi] & = & E[\xi_{1} + \dots + \xi_{r}] \\ & = & \sum_{i = 1}^{r} \frac{m + n}{n - i + 1} \\ & = &(m + n) \sum_{i = 1}^{r} \frac{1}{n - i + 1}.\end{array}
$$

我们看一个特殊情况.

若 $\dot{\boldsymbol{r}} = n($ (即要抽查到A组所有同学), 则

$$
E[\xi] =(m + n) \sum_{i = 1}^{n} \frac{1}{i}.
$$

由于

$$
1 + \frac{1}{2} + \dots + \frac{1}{n} = \ln n + C + \varepsilon_{n},
$$

其中C是Euler常数:

$$
C = 0.5772 \cdot \cdot \cdot,
$$

而

$$
\lim_{n \to \infty} \varepsilon_{n} = 0.
$$

于是

$$
\lim_{n \rightarrow \infty} \frac{1}{\ln n} \left(1 + \frac{1}{2} + \dots + \frac{1}{n}\right) = 1.
$$

所以对大的 $n,$ ,

$$
E[\xi] \approx(m + n) \ln n.
$$

若 $m = n, r = n.$ , 则对大 $\cdot n,$ ,

$$
E[\xi] \approx 2n \cdot \ln n.
$$

8. 设ξ的分布列为

$$
P \left(\xi =(- 1)^{k} \frac{2^{k}}{k}\right) = \frac{1}{2^{k}}, k = 1, 2, \dots,
$$

求E[ξ].

我们有

$$
P \left(\xi^{+} = \frac{2^{2k}}{2k}\right) = \frac{1}{2^{2k}},
$$

$$
P \left(\xi^{-} = \frac{2^{2k + 1}}{2k + 1}\right) = \frac{1}{2^{2k + 1}}.
$$

虽然

$$
\sum_{k = 1}^{\infty}(- 1)^{k} \frac{2^{k}}{k} \frac{1}{2^{k}} = \sum_{k = 1}^{\infty}(- 1)^{k} \frac{1}{k} = - \ln 2,
$$

但由于

$$
E[\xi^{+}] = \sum_{k = 1}^{\infty} \frac{1}{2k} = \infty,
$$

$$
E[\xi^{-}] = \sum_{k = 1}^{\infty} \frac{1}{2k + 1} = \infty,
$$

故E[ξ]不存在.

9. 设 $x \sim U(a, b)$ 为均匀分布, 密度函数为

$$
p(x) = \frac{1}{b - a} 1_{[a, b]}(x).
$$

此时

$$
E[\xi] = \int_{a}^{b}{\frac{1}{b - a}} xdx = \frac{a + b}{2}.
$$

10. 设 $\xi \sim N(\mu, \sigma^{2})$ 为正态分布.

我们知道, 此时密度函数为

$$
p(x) = \frac{1}{\sqrt{2 \pi} \sigma} e^{- \frac{(x - \mu)^{2}}{2 \sigma^{2}}},
$$

所以

$$
\begin{array}{rcl} E[\xi] & = & \int_{- \infty}^{\infty} xp(x) dx \\ & = & \int_{- \infty}^{\infty} x \frac{1}{\sqrt{2 \pi} \sigma} e^{- \frac{(x - \mu)^{2}}{2 \sigma^{2}}} dx \\ & = & \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{\infty}(\sigma z + \mu) e^{- \frac{z^{2}}{2}} dz \\ & = & \mu \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{\infty} e^{- \frac{z^{2}}{2}} dz \\ & = & \mu, \end{array}
$$

亦即 $N(a, \sigma^{2})$ 中的µ就是期望.

11. 设 $\xi \sim N(0, 1)$ . 对任意 $t \in \mathbb{R},$ , 求 $E[\xi^{n}]$

## 5.3 计算期望的例子

我们有

$$
\begin{array}{rcl}{E[\exp(t \xi)]} & = &{\frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{\infty} e^{tx} e^{- \frac{x^{2}}{2}} dx} \\ & = &{e^{\frac{t^{2}}{2}} \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{\infty} e^{- \frac{1}{2}(x - t)^{2}} dx} \\ & = &{e^{\frac{t^{2}}{2}} = \sum_{n = 0}^{\infty} \frac{t^{2n}}{2^{n} n !}.} \end{array}
$$

由于

$$
E[\exp(t \xi)] = \sum_{n = 0}^{\infty} \frac{t^{n}}{n !} E[\xi^{n}],
$$

比较t<sup>n</sup>的系数即得

$$
E[\xi^{n}] ={\left\{\begin{array}{ll}{0,} &{n{\text{为奇数}}} \\{(2n - 1)!!,} &{n{\text{为偶数}}.} \end{array} \right.}
$$

12. $\xi \sim E(\lambda)$ 为指数分布, 密度函数为

$$
p(x) = \lambda e^{- \lambda x} 1_{x \geqslant 0}.
$$

所以

$$
E[\xi] = \int_{0}^{\infty} \lambda xe^{- \lambda x} dx = - \int_{0}^{\infty} xde^{- \lambda x} = \int_{0}^{\infty} e^{- \lambda x} dx = \frac{1}{\lambda}.
$$

而对 $\cdot t \in(0, \lambda)$

$$
E[e^{t \xi}] = \int_{0}^{\infty} \lambda e^{-(\lambda - t) x} dx = \frac{\lambda}{\lambda - t}.
$$

同样比较系数即得

$$
E[\xi^{n}] = \lambda^{- n}.
$$

13. ξ服从Cauchy分布, 密度函数为

$$
p(x) = \frac{1}{\pi} \frac{1}{1 + x^{2}}.
$$

因为

$$
E[\xi^{+}] = E[\xi^{-}] = \int_{0}^{\infty} | x | \frac{1}{\pi(1 + x^{2})} dx = \infty.
$$

所以ξ的期望不存在.

$1 \not \angle.$ 设ξ的分布密度为

$$
p(x) = \left\{\begin{array}{ll} \frac{1}{\pi(1 + x^{2})} & x \geqslant 0, \\ \frac{1}{2} e^{x} & x < 0, \end{array} \right.
$$

求E[ξ]

此时,

$$
E[\xi^{+}] = \infty, E[\xi^{-}] = \frac{1}{2}.
$$

所以

$$
E[\xi] = \infty.
$$

习题

1. 证明:对任意n,

$$
\sum_{k = - \infty}^{\infty} k2^{- n} P(\xi \in[k2^{- n},(k + 1) 2^{- n}))
$$

$$
\leqslant E[\xi] \leqslant \sum_{k = - \infty}^{\infty}(k + 1) 2^{- n} P(\xi \in[k2^{- n},(k + 1) 2^{- n})),
$$

且

$$
\left| E[\xi] - \sum_{k = - \infty}^{\infty} k2^{- n} P(\xi \in[k2^{- n},(k + 1) 2^{- n})) \right| \leqslant 2^{- n},
$$

$$
\left| E[\xi] - \sum_{k = - \infty}^{\infty}(k + 1) 2^{- n} P(\xi \in[k2^{- n},(k + 1) 2^{- n})) \right| \leqslant 2^{- n}.
$$

2. 一个班级有50个学生, 某次课后依次随机地取回作业本.

(a) 一共会有多少种不同的结果?

(b) 假设所有结果都是等可能的. 如果最后一个学生发现取回的作业本不是自己的, 他或她就设法找到那个拿了他或她作业本的人, 要求交换; 如果这个被要求交换的人发现交换到的作业本不是自己的, 也同样设法找到拿了他或她作业本的人, 要求交换. 这样逐次进行下去, 直到某次被要求交换的人刚好拿到了自己的作业本为止.求交换总次数的数学期望.

3. 有两桶酒一样多, 一桶白酒, 一桶红酒. 一个大妈从红酒桶里舀出一满瓢倒入白酒桶中,用瓢在桶里一转悠, 然后再从白酒桶里舀出一满瓢倒入红酒桶中, 再一转悠. 最后, 从两只酒桶里各舀出一瓢. 问:红酒桶里舀出的那一瓢中的白酒成分的期望值和白酒桶里舀出的那一瓢中的红酒成分的期望值谁大谁小?

4. 设 $p_{n} \geqslant 0.$ . 令 $\textstyle r_{n} : = \sum_{k = n}^{\infty} p_{k}$ . 证明:

$$
\sum_{n = 1}^{\infty} np_{n} = \sum_{n = 1}^{\infty} r_{n},
$$

即两边同时收敛或同时发散, 且收敛时收敛到同一极限. 由此证明若ξ是取非负整数值 的随机变量, 则

$$
E[\xi] = \sum_{n = 1}^{\infty} P(\xi \geqslant n).
$$

5. 设 $\left\{c_{n} \right\}$ 是单调上升到正无穷的正数列,且存在c使得 $c_{n + 1}$ ⩽ $cc_{n}$ , ∀n. 设 $\xi \geqslant 0,$ , 证明 $E[\xi]$ 有限等价于

$$
\sum_{n = 1}^{\infty} c_{n} P(\xi \in[c_{n}, c_{n + 1})) < \infty,
$$

又等价于

$$
\sum_{n = 1}^{\infty} P(\xi \geqslant c_{n}) < \infty.
$$

6. 设 $\mathrm{{\dot{\cdot}}} p > 0$ 且

$$
\lim_{x \to + \infty} x^{p} P(| \xi | > x) = 0.
$$

证明 $E[| \xi |^{r}] < \infty, \forall r \in[0, p)$ , 并举例说明r不能等于 $p.$

7. 赌注加倍问题. 一个人参加一场赌博, 他的计划是: 赢了就离开, 输了就将赌注加倍继续赌, 直到赌资不够用(即不到上一盘赌资的2 倍)为止. 如果他手上有250元钱, 从1元钱起赌. 假设每盘他赢的概率都是 $\frac{1}{2}$ . 问他在这场赌博中的预期收益是多少?

8. 从 $.0, 1, \cdots, n^{\sharp}$ 随机取一个数, 每数被取到的概率依次为 $| p_{0}, p_{1}, \cdots, p_{n}$ . 不放回地连续取k次. 求取到的数之和的期望.

9. 设一个城市有1千万人. 现在怀疑其中有1000人感染了新冠而进行全员核酸. 问: 在第一次查到感染者之前, 预期要做多少人的核酸? 为查出所有的感染者, 预期有要做多少人的核酸?

10. 袋中装了N个编号为1,2,··· ,N的球, 摸出一个, 记下号码, 再放回去. 这样进行下去.求:

(a) 第一次取出的那个球, 预期还需要摸多少次才能再次取出?

(b) 预期需要摸多少次, 才会出现一个球被摸到了两次的情况?

(c) 设摸了n次. 求摸到的最大号码和最小号码的联合概率分布.

(d) 改为无放回地摸了n次, 求摸到的最大号码和最小号码的联合概率分布.

## 5.4 随机变量列的收敛性

下节我们将研究积分号下取极限, 即极限和期望的交换顺序问题. 由于期望就是积分, 所以这个问题我们在数学分析里已经有所接触 但那时的条件一般都是被积函数一致收敛 这无疑是太强了. 实际上对随机变量来说, 逐点收敛都太强了, 所以我们将在本节寻找一些较弱的条件. 考察一下随机变量序列的各种不同的收敛性.

设 $\{\xi_{n}\}$ 是定义在概率空间 $(\Omega,{\mathcal{F}}, P)$ 上的随机变量列. 在考察其收敛性时, 最容易想到的收敛性就是移植数学分析里面的逐点收敛, 即对每个ω, $\xi_{n}(\omega)$ 都收敛. 但由于在概率论中,我们可以忽略概率为零的事件(可略集), 所以可以允许在某个可略集上不收敛. 因此, 我们有下面的定义:

定义 5.4.1. 设 $\xi_{n}, \xi, n = 1, 2, \cdots$ 为随机变量. 若存在 $A \in{\mathcal{F}}, P(A) = 0$ , 使得

$$
\lim_{n \to \infty} \xi_{n}(\omega) = \xi(\omega), \forall \omega \notin A,
$$

则称 $\cdot \xi_{n}$ 几乎必然收敛于 $^{\cdot} \xi,$ 记为 $\operatorname{lim}_{n \to \infty} \xi_{n} = \xi \a.s.$ , 或 $\xi_{n} \xrightarrow{a.s.} \xi$

几乎必然收敛当然是一件很美好的事情, 不过这个要求非常苛刻,往往难以达到. 再说概率论里面关心的往往不是每个样本的性质, 而是全局的性质. 这样, 就出现了下面的概念.

定义 5.4.2. 设 $\xi_{n}, \xi, n = 1, 2, \cdot$ · · 为随机变量. 若∀ε > 0,

$$
\lim_{n \to \infty} P(| \xi_{n} - \xi | > \varepsilon) = 0,
$$

则称 $\cdot \xi_{n}$ 依概率收敛于 $\cdot \xi,$ 记为l $m_{n \infty} \xi_{n} = \xi(P)$ , 或 $\xi_{n} \overset{P}{\to} \xi$

几乎必然收敛序列的极限无疑是几乎必然唯一的. 即若同时有 $\xi_{n} \xrightarrow{a.s.} \xi, \xi_{n} \xrightarrow{a.s.} \xi^{\prime};$ 则 $| \xi = \xi^{\prime} \ \mathrm{a.s.}$ , 这是因为

$$
\{\omega : \xi(\omega) \neq \xi^{\prime}(\omega)\} \subset \{\omega : \xi_{n}(\omega) \nrightarrow \xi(\omega)\} \cup \{\omega : \xi_{n}(\omega) \nrightarrow \xi^{\prime}(\omega)\},
$$

所以

$$
P(\{\omega : \xi(\omega) \neq \xi^{\prime}(\omega)\}) \leqslant P(\{\omega : \xi_{n}(\omega) \nrightarrow \xi(\omega)\}) + P(\{\omega : \xi_{n}(\omega) \nrightarrow \xi^{\prime}(\omega)\}) = 0.
$$

那么, 依概率收敛的极限是否也是几乎必然唯一的呢? 答案也是肯定的, 因为若同时有 $\xi_{n} \overset{P}{}$ $\xi, \xi_{n} \overset{P}{\to} \xi^{\prime}$ , 则 $\forall n \in \mathbb{N}_{+ +}, \varepsilon >($ 0有

$$
\begin{array}{rcl} \{| \xi - \xi^{\prime} | > \varepsilon\} & \subset & \{| \xi - \xi_{n} | + | \xi^{\prime} - \xi_{n} | > \varepsilon\} \\ & \subset & \left\{| \xi - \xi_{n} | > \frac{\varepsilon}{2} \right\} \cup \left\{| \xi^{\prime} - \xi_{n} | > \frac{\varepsilon}{2} \right\}.\end{array}
$$

所以

$$
P \left(\left| \xi - \xi^{\prime} \right| > \varepsilon\right) \leqslant P \left(\left| \xi - \xi_{n} \right| > \frac{\varepsilon}{2}\right) + P \left(\left| \xi^{\prime} - \xi_{n} \right| > \frac{\varepsilon}{2}\right).
$$

因此

$$
P(| \xi - \xi^{\prime} | > \varepsilon) \leqslant \lim_{n \rightarrow \infty} P \left(| \xi - \xi_{n} | > \frac{\varepsilon}{2}\right) + \lim_{n \rightarrow \infty} P \left(| \xi^{\prime} - \xi_{n} | > \frac{\varepsilon}{2}\right) = 0.
$$

这样就有

$$
P(| \xi - \xi^{\prime} | \neq 0) = P \left(\bigcup_{k = 1}^{\infty} \{| \xi - \xi^{\prime} | > k^{- 1}\}\right) \leqslant \sum_{k = 1}^{\infty} P(| \xi - \xi^{\prime} | > k^{- 1}) = 0.
$$

这两种收敛性是什么关系呢?

ω固定时, $\xi_{n}(\omega)$ 收敛到 $| \xi(\omega)$ , 用ε − δ语言来描述, 就是说: $\forall m, \ \exists n,$ , 使得∀k $\geqslant ~ n$ 均有 $\begin{array}{r}{| \xi_{n}(\omega) - \xi(\omega) | \leqslant \frac{1}{m}} \end{array}$ . 所以

$$
\{\omega : \xi_{n}(\omega) \rightarrow \xi(\omega)\} = \bigcap_{m = 1}^{\infty} \bigcup_{n = 1}^{\infty} \bigcap_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | \leqslant \frac{1}{m} \right\}.
$$

于是由De Morgan原理

$$
\{\omega : \xi_{n}(\omega) \nrightarrow \xi(\omega)\} = \bigcup_{m = 1}^{\infty} \bigcap_{n = 1}^{\infty} \bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}.
$$

所以由概率的下连续性有

$$
P(\{\omega : \xi_{n}(\omega) \nrightarrow \xi(\omega)\}) = \lim_{m \to \infty} P \left(\bigcap_{n = 1}^{\infty} \bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}\right).
$$

## 5.4 随机变量列的收敛性

由于

$$
P \left(\bigcap_{n = 1}^{\infty} \bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}\right)
$$

随m递增, 故 $P(\{\omega : \xi_{n}(\omega) \not \to \xi(\omega)\}) = 0$ 就等价于

$$
P \left(\bigcap_{n = 1}^{\infty} \bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}\right) = 0, \forall m,
$$

再由概率的上连续性, 这又等价于

$$
\lim_{n \to \infty} P \left(\bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}\right) = 0, \forall m.\tag{4.1}
$$

这个当然意味着

$$
\lim_{n \to \infty} P \left(\omega : | \xi_{n}(\omega) - \xi(\omega) | > \frac{1}{m}\right) = 0, \forall m,\tag{4.2}
$$

而这就是 $\xi_{n} \overset{P}{\to} \xi$ . 所以我们证明了:

命题 5.4.3.

$$
\xi_{n} \xrightarrow{a.s.} \xi \Longrightarrow \xi_{n} \xrightarrow{P} \xi.
$$

那么这两者是否实际上是等价的呢? 答案是否定的, 例子如下.

例1. 设 $\sharp \Omega =[0, 1), \mathcal{F} = \mathrm{Borel} \sigma.$ -代数, P =Lebesgue测度. 令

$$
\begin{array}{c} \xi_{1, 1} \equiv 1; \\ \xi_{2, k} = 1_{[k2^{- 1},(k + 1) 2^{- 1})}, k = 0, 1; \\ \xi_{n, k} = 1_{[k2^{- n + 1},(k + 1) 2^{- n + 1})}, k = 0, 1, \dots, 2^{n} - 1; \\ \dots \dots.\end{array}
$$

再将这些随机变量按从上到下, 从左到右的次序排成一列, 记为 $| \xi_{n}$ . 则 $\xi_{n}$ 对每个ω都有收敛到0和1的两个不同子列, 因此不收敛. 但因为 $\forall 0 < \delta < 1, P(| \xi_{n, k} - 0 | > \delta) \leqslant 2^{- n}$ , 因此却是依概率收敛于零的.

(4.2)与(4.1)差多远呢?

首先注意, 如果将(4.2)加强为: $\forall m \geqslant 1$ , 有

$$
\sum_{n = 1}^{\infty} P \left(| \xi_{n} - \xi | > \frac{1}{m}\right) < \infty,\tag{4.3}
$$

那么

$$
P \left(\bigcup_{k = n}^{\infty} \left\{\omega : | \xi_{k}(\omega) - \xi(\omega) | > \frac{1}{m} \right\}\right) \leqslant \sum_{k = n}^{\infty} P \left(| \xi_{k} - \xi | > \frac{1}{m}\right) < \infty.
$$

于是(4.1)满足. 所以, 如果一个依概率收敛的随机变量列收敛的速度足够快, 那么它就是几乎必然收敛的.

现在, 若 $\xi_{n} \overset{P}{\to} \xi,$ 那么由(4.2), ∀k $\geqslant 1$ , 可找到 $n_{k}$ , 且 $n_{k}$ 随k而递增, 使得

$$
P \left(\left| \xi_{n_{k}} - \xi \right| > \frac{1}{k}\right) < 2^{- k}.
$$

因此, $\forall m \geqslant 1$

$$
\sum_{k = m}^{\infty} P \left(| \xi_{n_{k}} - \xi | > \frac{1}{m}\right) \leqslant \sum_{k = m}^{\infty} P \left(| \xi_{n_{k}} - \xi | > \frac{1}{k}\right) < \infty.
$$

于是 $\xi_{n_{k}} J$ 几乎必然收敛 $\operatorname{\mathbb{F}} \xi.$ 这样我们就证明了:

定理 5.4.4. 若 $\xi_{n} \overset{P}{\to} \xi,$ 那么一定存在子列 $\xi_{n_{k}}$ , 使得 $\xi_{n_{k}} \xrightarrow{a.s.} \xi$

我们顺便得到:

推论 5.4.5. 设 $\xi_{n} \overset{P}{\to} \xi,$ 且存在随机变量 $\eta \cdot$ 使得 $| \xi_{n} | \leqslant \eta a.s., \forall n.$ . 则|ξ| $\leqslant \eta \a.s.$ .. 特别地,当 $\eta \equiv C$ , 则 $\xi \leqslant C$

证明. 因 $\xi_{n} \overset{P}{}$ ξ和定理5.4.4, 存在子列 $\xi_{n_{k}}$ , 使得 $\xi_{n_{k}} \xrightarrow{a.s.} \xi.$ 又因为 $| \xi_{n_{k}} | \leqslant \eta \a.s., \ \forall k$ , 因此 $| \xi | \leqslant \eta \a.s.$ □

显然, (4.1)等价于

$$
\lim_{N \to \infty} P \left(\sup_{n \geqslant N} | \xi_{n} - \xi | > \varepsilon\right) = 0, \forall \varepsilon > 0.\tag{4.4}
$$

类似于(4.1), 我们给出一个几乎必然收敛的Cauchy准则.

引理 5.4.6. 设{ξ<sub>i</sub>}, ξ是随机变量, 则 $\xi_{i} \xrightarrow{a.s.} \quad$ 的充要条件是

$$
P \left(\bigcap_{N = 1}^{\infty} \bigcup_{m, n = N}^{\infty} \{| \xi_{m} - \xi_{n} | > \varepsilon\}\right) = 0, \forall \varepsilon > 0;\tag{4.5}
$$

这又等价于

$$
\lim_{N \to \infty} P \left(\sup_{m, n \geqslant N} | \xi_{m} - \xi_{n} | > \varepsilon\right) = 0, \forall \varepsilon > 0.\tag{4.6}
$$

证明. 因为

$$
\begin{array}{rcl}{{\{\omega : \xi_{n}(\omega) \to\}}} &{{=}} &{{\left\{\omega : \forall k > 0, \exists N, \text{使得} | \xi_{m}(\omega) - \xi_{n}(\omega) | \leqslant k^{- 1}, \forall m, n \geqslant N \right\}}} \\ &{{=}} &{{\bigcap_{k = 1}^{\infty} \bigcup_{N = 1}^{\infty} \bigcap_{m, n = N}^{\infty} \left\{| \xi_{m}(\omega) - \xi_{n}(\omega) | \leqslant k^{- 1} \right\},}} \end{array}
$$

所以, $\xi_{n} \xrightarrow{a.s.}$ 的充要条件是

$$
P \left(\bigcap_{k = 1}^{\infty} \bigcup_{N = 1}^{\infty} \bigcap_{m, n = N}^{\infty} \left\{\left| \xi_{m}(\omega) - \xi_{n}(\omega) \right| \leqslant k^{- 1} \right\}\right) = 1,
$$

即

$$
P \left(\bigcup_{k = 1}^{\infty} \bigcap_{N = 1}^{\infty} \bigcup_{m, n = N}^{\infty} \left\{| \xi_{m}(\omega) - \xi_{n}(\omega) | > k^{- 1} \right\}\right) = 0.
$$

## 5.5 积分(期望)号下取极限

显然,此式满足的充要条件是

$$
P \left(\bigcap_{N = 1}^{\infty} \bigcup_{m, n = N}^{\infty} \left\{\left| \xi_{m}(\omega) - \xi_{n}(\omega) \right| > k^{- 1} \right\}\right) = 0, \forall k > 0.
$$

这又等价于

$$
P \left(\bigcap_{N = 1}^{\infty} \bigcup_{m, n = N}^{\infty} \left\{\left| \xi_{m}(\omega) - \xi_{n}(\omega) \right| > \varepsilon \right\}\right) = 0, \forall \varepsilon > 0.
$$

## 5.5 积分(期望)号下取极限

现在我们就开始考虑积分号和极限的交换问题. 我们固定一个概率空间 $(\Omega,{\mathcal{F}}, P)$ , 所有的随机变量均定义在这个空间上.

首先我们证明一个预备结果.

引理 5.5.1. 若 $\xi \geqslant 0$ , 则

$$
\lim_{M \uparrow \infty} E[\xi \wedge M] = E[\xi].
$$

证明. 若 $P(\xi = \infty) > 0$ , 则 $E[\xi] = \infty$ , 而

$$
E[\xi \wedge M] \geqslant MP(\xi = \infty) \rightarrow \infty,
$$

所以结论成 $\begin{array}{r}{\vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec{\bf \Phi} \vec \bf \Phi \Theta \pm \vec \bf \Phi \Theta \Theta \Theta \bf \Theta \Theta \Theta \c}_\bf \bf \Theta \Theta \Theta \bf \Theta \Theta \Theta \c \bf \Theta \Theta \c \bf \bf \Theta \Theta \Theta \c \bf \c \bf \c \c \bf \end{array}$ .

下面设 $P(\xi = \infty) = 0$ . 由于 $E[\xi \wedge M]$ 是M的单调上升函数, 故

$$
\lim_{M \uparrow \infty} E[\xi \wedge M] = \lim_{m \uparrow \infty} E[\xi \wedge m] \leqslant E[\xi],
$$

这里m取整数. 因为∀m ⩾ 1,

$$
\sum_{k = 0}^{m} k1_{[k, k + 1)}(\xi) \leqslant \xi \wedge m \leqslant \sum_{k = 0}^{m}(k + 1) 1_{[k, k + 1)}(\xi),
$$

所以

$$
\sum_{k = 0}^{m} kP(\xi \in[k, k + 1)) \leqslant E[\xi \wedge m] \leqslant \sum_{k = 0}^{m} kP(\xi \in[k, k + 1)) + 1.
$$

因此

$$
\sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) \leqslant \lim_{m \rightarrow \infty} E[\xi \wedge m] \leqslant \sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) + 1.
$$

再注意

$$
\sum_{k = 0}^{\infty} k1_{[k, k + 1)}(\xi) \leqslant \xi \leqslant \sum_{k = 0}^{\infty}(k + 1) 1_{[k, k + 1)}(\xi),
$$

所以

$$
\sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) \leqslant E[\xi] \leqslant \sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) + 1,
$$

若 $E[\xi] = \infty$ , 则

$$
\sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) = \infty.
$$

从而

$$
\lim_{m \to \infty} E[\xi \wedge m] = \infty.
$$

若 $E[\xi] < \infty,$ , 则

$$
\sum_{k = 0}^{\infty}(k + 1) P(\xi \in[k, k + 1)) \leqslant \sum_{k = 0}^{\infty} kP(\xi \in[k, k + 1)) + 1 < \infty.
$$

用

$$
0 \leqslant \xi - \xi \wedge m \leqslant \sum_{k = m}^{\infty}(k + 1 - m) 1_{\xi \in[k, k + 1)},
$$

得到

$$
\lim_{m \rightarrow \infty}(E[\xi] - E[\xi \wedge m]) \leqslant \lim_{m \rightarrow \infty} \sum_{k = m}^{\infty} kP(\xi \in[k, k + 1)) = 0.
$$

为书写方便, 以后将使用记号:

$$
E[\xi; A] := E[\xi 1_{A}].
$$

首先我们可证明下面简单的

命题 5.5.2 (有界收敛定理). 设 $\xi_{n}$ 依概率收敛到 $\xi,$ 且存在常数C使得

$$
| \xi_{n} | \leqslant Ca.s., \forall n.
$$

则

$$
E[\xi_{n}] \to E[\xi].
$$

证明. 由推论5.4.5, $\left| \xi_{n} - \xi \right| \leqslant \left| \xi_{n} \right| + \left| \xi \right| \leqslant 2C \a.s.$ . 因此 $\forall \varepsilon > 0$ 2

$$
\begin{array}{rcl} | E[\xi_{n}] - E[\xi] | & \leqslant & E[| \xi_{n} - \xi |] \\ & = & E[| \xi_{n} - \xi |; | \xi_{n} - \xi | > \varepsilon] + E[| \xi_{n} - \xi |; | \xi_{n} - \xi | \leqslant \varepsilon] \\ & \leqslant & 2CP(| \xi_{n} - \xi | > \varepsilon) + \varepsilon.\end{array}
$$

所以

$$
\limsup_{n \to \infty} | E[\xi_{n}] - E[\xi] | \leqslant \varepsilon.
$$

由ε的任意性结论即得结论.

## 5.5 积分(期望)号下取极限

另外一种简单情况是关于非负单调上升序列的

命题 5.5.3 (单调收敛定理). 设 $.0 \leqslant \xi_{n}$ ↑ $\xi \a.s.$ , 则 $E[\xi] = \mathrm{lim}_{n \infty} E[\xi_{n}]$

证明. 若 $\operatorname{sup}_{n} E[\xi_{n}] = \infty$ . 由于 $\cdot E[\xi_{n}]$ 单调上升, 所以必有

$$
\lim_{n \to \infty} E[\xi_{n}] = \infty.
$$

因 $\xi_{n} \leqslant \xi,$ 所以 $E[\xi] = \infty$

下面设 $\operatorname{sup}_{n} E[\xi_{n}] < \infty$ . 先证

$$
E[\xi] < \infty.
$$

若否, 则由引理5.5.1有

$$
\lim_{m \to \infty} E[\xi \wedge m] = \infty.
$$

但由有界收敛定理, ∀m ⩾ 1,

$$
\lim_{n \to \infty} E[\xi_{n} \wedge m] = E[\xi \wedge m].
$$

所以必有 $\cdot_{n}$ 使得

$$
E[\xi_{n}] \geqslant E[\xi_{n} \wedge m] > E[\xi \wedge m] - 1.
$$

由于 $m$ 是任意的, 这 $\exists \mathrm{sup}_{n} E[\xi_{n}] < \infty$ 矛盾, 于是 $E[\xi] < \infty$

由于 $E[\xi_{n} \wedge m]$ 关于 $m, n$ 都是单调上升的, 且有上界, 故全面极限

$$
\lim_{m, n \to \infty} E[\xi_{n} \wedge m]
$$

存在且有限. 于是, 由引理5.5.1, 两个累次极限可换序以及有界收敛定理有

$$
\begin{array}{rcl} \lim_{n \to \infty} E[\xi_{n}] & = & \lim_{n \to \infty} \lim_{m \to \infty} E[\xi_{n} \wedge m] \\ & = & \lim_{m \to \infty} \lim_{n \to \infty} E[\xi_{n} \wedge m] \\ & = & \lim_{m \to \infty} E[\xi \wedge m] \\ & = & E[\xi].\end{array}
$$

由此可以立即得到:

推论 5.5.4. 设 $\{\xi_{n}\}$ 单调, $\xi_{1}$ 可积. 令 $\xi = \operatorname{lim}_{n \to \infty} \xi_{n}$ . 则

$$
E[\xi] = \lim_{n \to \infty} E[\xi_{n}].
$$

证明. 不妨设 $\{\xi_{n}\}$ 单调上升(单调下降时考虑 $\left\{- \xi_{n} \right\}$ 即可).

因为 $\xi_{n} - \xi_{1} \geqslant 0$ , 所以 $E[\xi_{n} - \xi_{1}]$ 存在. 又因为 $| \xi_{1}$ 可积, $\xi_{n} =(\xi_{n} - \xi_{1}) + \xi_{1}$ , 所以 $E[\xi_{n}]$ 也存在, 且

$$
E[\xi_{n} - \xi_{1}] = E[\xi_{n}] - E[\xi_{1}].
$$

于是

$$
\begin{array}{rcl} \lim_{n \to \infty} E[\xi_{n}] - E[\xi_{1}] & = & \lim_{n \to \infty} E[\xi_{n} - \xi_{1}] \\ & = & E[\xi - \xi_{1}] \\ & = & E[\xi] - E[\xi_{1}].\end{array}
$$

所以 $\begin{array}{r}{\operatorname{lim}_{n \infty} E[\xi_{n}] = E[\xi]} \end{array}$

由这个结果可以推出许多有用的结果.

推论 5.5.5 (Lebesgue基本定理). 设 $\xi_{n}, n = 1, 2, \cdots$ 是随机变量, 且

$$
\sum_{n = 1}^{\infty} E[| \xi_{n} |] < \infty.
$$

则 $\begin{array}{r}{\xi : = \sum_{n = 1}^{\infty} \xi_{n} \pi} \end{array}$ 乎必然收敛, $\xi$ 可积, 且

$$
\lim_{n \to \infty} E \left[\left| \xi - \sum_{i = 1}^{n} \xi_{i} \right| \right] = 0.
$$

特别地,

$$
E[\xi] = \sum_{n = 1}^{\infty} E[\xi_{n}].
$$

证明. 令

$$
\eta_{n} := \sum_{i = 1}^{n} | \xi_{i} |, \eta := \sum_{i = 1}^{\infty} | \xi_{i} |.
$$

则 $\eta$ 可积且 $\eta_{n}$ ↑ $\eta$ . 因此

$$
E \left[\sum_{n = 1}^{\infty} | \xi_{n} | \right] = \sum_{n = 1}^{\infty} E[| \xi_{n} |].
$$

所以

$$
\sum_{n = 1}^{\infty} | \xi_{n} | < \infty a.s..
$$

于是 $\textstyle \xi : = \sum_{n = 1}^{\infty} \xi_{n}$ 几乎必然收敛且可积, 满足

$$
\begin{array}{rcl} E \left[\left| \xi - \sum_{i = 1}^{n} \xi_{i} \right| \right] & \leqslant & E \left[\left| \sum_{i = n + 1}^{\infty} \xi_{i} \right| \right] \\ & \leqslant & E \left[\sum_{i = n + 1}^{\infty} | \xi_{i} | \right] \\ & = & \sum_{i = n + 1}^{\infty} E[| \xi_{i} |] \to 0, n \to \infty.\end{array}
$$

## 5.5 积分(期望)号下取极限

我们曾经证明过, 若 $\{A_{n}, n = 1, 2, \cdot \cdot \cdot\}$ 互不相交,

$$
\xi := \sum_{n = 1}^{\infty} x_{n} 1(A_{n}),
$$

且 $\textstyle \sum_{n = 1}^{\infty} | x_{n} | P(A_{n}) < \infty$ , 则

$$
E[\xi] = \sum_{n = 1}^{\infty} x_{n} P(A_{n}).
$$

然而, 运用上面的结果, 现在易见 $\{A_{n}, n = 1, 2, \cdot \cdot \cdot\}$ 不必互不相交, 结论依然成立.

我们还可以得到:

推论 5.5.6 (Fatou引理). (i) 设 $\eta$ 可积, $\mathbb{E} \forall n, \xi_{n} \geqslant \eta a.s.$ . 则

$$
E \left[\operatorname{liminf}_{n \to \infty} \xi_{n} \right] \leqslant \operatorname{liminf}_{n \to \infty} E[\xi_{n}].
$$

(ii) 设η可积, 且∀n, $\xi_{n} \leqslant \eta \a.s.$ . 则

$$
E \left[\operatorname{limsup}_{n \to \infty} \xi_{n} \right] \geqslant \operatorname{limsup}_{n \to \infty} E[\xi_{n}].
$$

证明. 我们只证(i), (ii)的证明是类似的.

令 $\begin{array}{r}{\cdot \eta_{1} = \eta, \eta_{n} : = \operatorname{inf}_{k \geqslant n} \xi_{k}, n \geqslant 2.} \end{array}$ . 则 $\{\eta_{n}\}$ 单调上升. 于是

$$
\begin{array}{rcl} E[\liminf_{n} \xi_{n}] & = & E[\lim_{n} \eta_{n}] = \lim_{n} E[\eta_{n}] \\ & \leqslant & \liminf_{n} \inf_{k \geqslant n} E[\xi_{k}] = \liminf_{n} E[\xi_{n}].\end{array}
$$

使用这个推论的第二个结论就可以得到下面十分重要的

推论 5.5.7 (控制收敛定理). 设 $\xi_{n} \ \overset{P}{\to} \ \xi,$ 且存在 $\eta \geqslant 0, E[\eta] < \infty$ , 使得对任意 $n, \ | \xi_{n} | \leqslant \eta$ $a.s.$ . 则

$$
\lim_{n \to \infty} E[| \xi - \xi_{n}]] = 0.
$$

特别地, 若 $\cdot \xi_{n} \overset{P}{\right.} \xi \overset{\mathtt{E}}{\left.}$ 存在常数 $C >$ 0使得 $\left| \xi_{n} \right| \leqslant C \a.s., \forall n,$ 则

$$
\lim_{n \to \infty} E[| \xi - \xi_{n}]] = 0.
$$

证明. 先设li $\begin{array}{r}{n_{n \infty} \xi_{n} = \xi \mathrm{a.s.}} \end{array}$ .. 因为

$$
\left| \xi_{n} - \xi \right| \leqslant 2 \eta.
$$

所以由Fatou引理

$$
\operatorname{limsup}_{n \to \infty} E[| \xi_{n} - \xi |] \leqslant E \left[\operatorname{limsup}_{n \to \infty} | \xi_{n} - \xi | \right] = 0.
$$

再看一般情况. 用反证法. 设有子列 $\{n_{k}\}$ 及正常数ε使得

$$
E[| \xi - \xi_{n_{k}}]] \geqslant \varepsilon, \forall k.\tag{5.7}
$$

在 $\{n_{k}\}$ 中再取子列 $\{m_{k}\}$ 使得 $\operatorname{lim}_{k \infty} \xi_{m_{k}} = \xi \mathrm{a.s.}$ .则

$$
\lim_{k \to \infty} E[| \xi - \xi_{m_{k}}]] = 0,
$$

而这与(5.7)矛盾.

从上面的证明中可以看出, 当条件是 $\xi_{n} \xrightarrow{a.s.}$ ξ时, 控制收敛定理就是Fatou引理第二个结论的直接结果. 但因为给的条件是 $\xi_{n} \overset{P}{\to} \xi,$ 因此需要通过反证法选取矛盾子列过渡一下. 同理, 一样的技巧用于Fatou引理的第一个结论, 就可以得到下面常常是相当有用的推论.

推论 5.5.8. 设 $\xi_{n} \geqslant 0, \xi_{n} \overset{P}{\to} \xi,$ 且

$$
\liminf_{n \to \infty} E[\xi_{n}] < \infty,
$$

则ξ可积且

$$
E[\xi] \leqslant \liminf_{n \to \infty} E[\xi_{n}].
$$

习题

1. 设 $E[| \xi |] < \infty$ . 证明:

$$
\lim_{x \to \infty} xP(| \xi | \geqslant x) = 0.
$$

2. 设 $\displaystyle \langle \xi_{n} \overset{P}{}$ ξ且

$$
\lim_{m, n \to \infty} E[| \xi_{n} - \xi_{m} |] = 0.
$$

证明

$$
\lim_{n \to \infty} E[| \xi_{n} - \xi |] = 0.
$$

3. 设ξ可积. 证明: $\forall \varepsilon > 0, \exists \delta > 0$ , 使得

$$
P(A) < \delta \Rightarrow E[| \xi | 1_{A}] < \varepsilon.
$$

4. 举例说明, 在推论5.5.8中, $\xi_{n} \geqslant$ 0这个条件不能去掉.

5. 设 $\left\{A_{n} \right\}$ 是一列事件. 证明:

$$
P(\operatorname{liminf}_{n \to \infty} A_{n}) \leqslant \operatorname{liminf}_{n \to \infty} P(A_{n}) \leqslant \operatorname{limsup}_{n \to \infty} P(A_{n}) \leqslant P(\operatorname{limsup}_{n \to \infty} A_{n}).
$$

6. 设 $\xi, \xi_{n}, n = 1, 2, \cdot \cdot$ · 是随机变量, $\varepsilon_{n}, n = 1, 2, \cdots$ 是正数, 使得

$$
\lim_{n \to \infty} \varepsilon_{n} = 0,
$$

$$
\sum_{n = 1}^{\infty} P(| \xi_{n} - \xi | \geqslant \varepsilon_{n}) < \infty.
$$

证明: $\xi_{n} \xrightarrow{a.s.} \xi.$

7. 设 $\xi_{n} \overset{P}{\to} \xi.$ 证明存在子列 $\{\xi_{n_{k}}\}$ 使得 $\xi_{n_{k}} \xrightarrow{a.s.} \xi.$

## 5.5 积分(期望)号下取极限

8. 设 $\xi_{n}.$ , ξ为 $|(\Omega,{\mathcal{F}}, P)$ 上的非负可积随机变量. 利用

$$
(\xi - \xi_{n})^{+} \leqslant \xi,
$$

证明: $E | \xi_{n} - \xi | 0$ 当且仅当

$$
\xi_{n} \stackrel{P}{\longrightarrow} \xi \quad \text{且} \quad E \xi_{n} \to E \xi.
$$

9. 证明如下的Pratt引理： 设 $\xi_{n}, \eta_{n}, \zeta_{n}, \xi, \eta.$ ζ均为可积随机变量. 若

$$
\xi_{n} \stackrel{P}{\longrightarrow} \xi, \eta_{n} \stackrel{P}{\longrightarrow} \eta, \zeta_{n} \stackrel{P}{\longrightarrow} \zeta,
$$

$$
\xi_{n} \leqslant \eta_{n} \leqslant \zeta_{n},
$$

$$
E \xi_{n} \rightarrow E \xi, E \zeta_{n} \rightarrow E \zeta,
$$

则

(a)

$$
E \eta_{n} \rightarrow E \eta.
$$

(b)

$$
\xi_{n} \leqslant 0 \leqslant \zeta_{n} \Longrightarrow E | \eta_{n} - \eta | \rightarrow 0.
$$

10. 对每个定理, 逐一构造反例, 说明定理的条件遭到破坏时, 结论不再成立.

11. 构造非负随机变量列 $| \xi_{n},$ 使得

$$
E[\operatorname{liminf}_{n \to \infty} \xi_{n}] < \operatorname{liminf}_{n \to \infty} E[\xi_{n}].
$$

12. 设 $\xi_{n}$ 是非负随机变量, $\xi_{n} \stackrel{P}{\longrightarrow} \xi, E[\xi_{n}] E[\xi]$

(a) 证明：

$$
E[\xi_{n} \wedge \xi] \rightarrow E[\xi].
$$

(b) 证明：

$$
E[\xi_{n} \vee \xi] \rightarrow E[\xi].
$$

(c) 证明：

$$
E[| \xi_{n} - \xi |] \to 0.
$$

13. 设 $\left\{\xi_{n} \right\}$ 一致可积的随机变量, 即满足:

$$
\lim_{c \to \infty} \sup_{n} E[| \xi_{n} | 1_{| \xi_{n} | \geqslant c}] = 0.
$$

再设 $\xi_{n} \overset{P}{\to} \xi.$ 证明:

(a)

$$
\sup_{n} E[| \xi_{n} |] < \infty;
$$

(b)

$$
E[\operatorname{liminf}_{n} \xi_{n}] \leqslant \operatorname{liminf}_{n} E[\xi_{n}] \leqslant \operatorname{limsup}_{n} E[\xi_{n}] \leqslant E[\operatorname{limsup}_{n} \xi_{n}];\tag{c}
$$

$$
E[| \xi |] < \infty;
$$

(d) $\forall \varepsilon > 0, \exists \delta > 0$ , 使得

$$
P(A) < \delta \Longrightarrow \sup_{n} E[| \xi_{n} | 1_{A}] < \varepsilon;
$$

(e) $\{\xi_{n} - \xi\}$ 一致可积;

(f)

$$
\lim_{n} E[| \xi_{n} - \xi |] = 0.
$$

14. 设 $\varphi : \mathbb{R}_{+} \mapsto \mathbb{R}_{+}$ , 且 $\begin{array}{r}{\operatorname{lim}_{x \infty} x^{- 1} \varphi(x) = \infty} \end{array}$ . 证明: 若

$$
\sup_{n} E[\varphi(| \xi_{n} |)] < \infty,
$$

则 $\{\xi_{n}\}$ 一致可积.

## 5.6 Fubini定理

设 $\left(\Omega_{i}, \mathcal{F}_{i}, P_{i} \right)$ 为概率空间, i = 1, 2. 令

$$
(\Omega, \mathcal{F}, P) =(\Omega_{1}, \mathcal{F}_{1}, P_{1}) \times(\Omega_{2}, \mathcal{F}_{2}, P_{2}).
$$

就像数学分析里重积分可以化为累次积分进行计算一样, 期望也有这样的性质. 即我们有下面的

定理 5.6.1 (Fubini<sup>5</sup>定理). 设 $f_{\mathcal{K}}^{\it p}(\Omega, \mathcal{F}, P)$ 上的可积随机变量. 则

$$
E[f(\omega_{1}, \omega_{2})] = E[E[f(x, \omega_{2})] |_{x = \omega_{1}}].\tag{6.8}
$$

证明. 只需对非负随机变量证明, 一般情形可分别考虑正负部.

(i)若

$$
f = 1_{A_{1} \times A_{2}},
$$

其中 $A_{i} \in{\mathcal{F}}_{i}$ . 则

$$
\begin{array}{rcl}{(6.8) \text{的左端}} &{=} &{P(A_{1} \times A_{2}) = P_{1}(A_{1}) \times P_{2}(A_{2})} \\ &{=} &{E[1_{A}(\omega_{1})] P(A_{2}) = E[1_{A}(\omega_{1}) P(A_{2})]} \\ &{=} &{E[E[1_{A_{1} \times A_{2}}(x, \omega_{2})] |_{x = \omega_{1}}] = \text{右端}.} \end{array}
$$

(ii) 令

$$
\mathcal{G} := \{B \in \mathcal{F}:(6.8) \text{对} f := 1_{B} \text{成立}.\}
$$

则由(i), G包含所有形如 $A_{1} \times A_{2}$ 的集合, 而这些集合全体构成 $\pi -$ 类. 由期望的线性性知G对真差封闭, 由单调收敛定理知G对单调上升的序列封闭. 因此G为λ-类. 于是由 $\pi - \lambda -$ 定理,$\mathcal{G} = \mathcal{F}$

(iii) 由期望的线性性, 知对任何有限个取值的简单随机变量 $\cdot f,$ (6.8)成立.

(iv) 由于任何非负随机变量可由非负简单随机变量单调上升地逼近, 由单调收敛定理知(6.8)对任意非负简单随机变量 $\cdot f.$ 成立. □

特别地, 设 $(\Omega,{\mathcal{F}}, P)$ 为任一概率空间, $\Omega^{\prime} =[0, 1]$ $\mathcal{F}^{\prime} = \mathcal{B}([0, 1])$ , $P^{\prime} = \mathrm{Lebesgue}$ 测度.在此两空间的乘积空间上用上述定理, 就有

$$
\int_{0}^{1} E[\xi(t)] dt = E \int_{0}^{1} \xi(t) dt.
$$

完全类似地, 考虑整个R上的Lebesgue测度, 就有

定理 5.6.2. 设 $\xi(t, \omega)$ 为 $(t, \omega)$ 的非负二元可测函数, 则

$$
\int_{\mathbb{R}} E[\xi(t)] dt = E \left[\int_{\mathbb{R}} \xi(t) dt \right].
$$

习题

1. 设 $(\xi, \eta)$ 是二维连续型随机变量, 密度函数为 $p(x, y)$ . 用Fubini定理重新证明: $\xi -$ 与η的也为连续型随机变量, 密度函数分别为

$$
p_{1}(x) := \int_{- \infty}^{\infty} p(x, y) dy,
$$

与

$$
p_{2}(y) := \int_{- \infty}^{\infty} p(x, y) dx.
$$

2. 设数列 $\{x_{ij}\}$ 满足 $\textstyle \sum_{i, j} | x_{ij} | < \infty$ . 用Fubini定理证明

$$
\sum_{i, j} x_{ij} = \sum_{i} \sum_{j} x_{ij} = \sum_{j} \sum_{i} x_{ij}.
$$

并举例说明 $\textstyle \sum_{i, j} | x_{ij} | = \infty$ 结论不成立.

## 5.7 带参数的期望

设 $I =(t_{0} - \varepsilon, t_{0} + \varepsilon)$ 是R上的开区间, 而对任意 $t \in I, \xi(t)$ 是随机变量, 且

$$
E[| \xi(t) |] < \infty, \forall t \in I.\tag{7.9}
$$

我们将研究函数

$$
f(t) := E[\xi(t)]
$$

在 $t_{0}$ 处的连续性与可微性问题.

我们先看连续性.

定理 5.7.1. 设

(i) 对任意 $t_{n} \to t_{0}, \xi(t_{n}) \xrightarrow{P} \xi(t_{0})$

(ii) 存在可积随机变量 $\eta \cdot$ 使得

$$
| \xi(t) | \leqslant \eta a.s., \forall t \in I.
$$

则 $f(t) \neq t \pm t_{0}$ 处连续.

证明. 为证 $f(t) \not \equiv t_{0}$ 处连续, 由 ${\mathrm{Heine}}^{6}$ 定理, 只需证明对任意 $: t_{n} \to t_{0}, f(t_{n}) \to f(t_{0})$ . 但这可以直接从控制收敛定理得到. □

由此可以得到积分与期望交换顺序的条件, 即Fubini定理的另一种形式. 注意这里涉及的对t的积分为普通的Riemann积分.

定理 5.7.2 (Fubini定理). 设 $- \infty < a < b < \infty$ , 且

(i) 对几乎所有的ω, $[a, b] \ni t \mapsto \xi(t)$ 连续;

(ii) 存在可积随机变量 $\eta$ 使得

$$
| \xi(t) | \leqslant \eta a.s., \forall t \in[a, b].
$$

则

$$
E \int_{a}^{b} \xi(t) dt = \int_{a}^{b} f(t) dt.
$$

证明. 为简化记号, 不妨设 $[a, b] =[0, 1]$ . 令

$$
\xi_{n}(t) = \xi(2^{- n}[2^{n} t]).
$$

由Riemann积分之定义, 有

$$
\int_{0}^{1} \xi(t) dt = \lim_{n \rightarrow \infty} \int_{0}^{1} \xi_{n}(t) dta.s.,
$$

所以 $\textstyle \int_{0}^{1} \xi(t) dt$ 为随机变量. 而

$$
\left| \int_{0}^{1} \xi_{n}(t) dt \right| \leqslant \int_{0}^{1} | \xi_{n}(t) | dt \leqslant \eta.
$$

所以由控制收敛定理,

$$
\begin{array}{rcl} E \left[\int_{0}^{1} \xi(t) dt \right] & = & \lim_{n \to \infty} E \left[\int_{0}^{1} \xi_{n}(t) dt \right] \\ & = & \lim_{n \to \infty} \int_{0}^{1} E[\xi_{n}(t)] dt \\ & = & \lim_{n \to \infty} \int_{0}^{1} f(2^{- n}[2^{n} t]) dt \\ & = & \int_{0}^{1} f(t) dt.\end{array}
$$

这里最后一个等式成立是因为f连续(由上一定理)

如果ξ(t)具有更好的光滑性, 那么f(t)也具有更好的光滑性:

## 定理 5.7.3. 设

(i) 对几乎所有的ω, $\begin{array}{r}{\xi^{\prime}(t) : = \frac{\partial \xi(t)}{\partial t}} \end{array}$ 存在, $\forall t \in I{\mathrm{;}}$

(ii) 存在可积随机变量 $\eta_{;}$ 使得

$$
\sup_{t \in I} | \xi^{\prime}(t) | \leqslant \eta a.s..
$$

则f在 $\mathbf{\nabla}.t_{0}$ 处可微, 且

$$
f^{\prime}(t_{0}) = E[\xi^{\prime}(t_{0})].
$$

证明. 由Heine定理, 只需证明: 任取 ${{\varepsilon}_{n}} \to 0$

$$
\lim_{n \to \infty} \frac{f(t_{0} + \varepsilon_{n}) - f(t_{0})}{\varepsilon_{n}} = E[\xi^{\prime}(t_{0})].\tag{7.10}
$$

注意

$$
\frac{1}{\varepsilon_{n}} \left(f(t_{0} + \varepsilon_{n}) - f(t_{0})\right) = E \left[\frac{1}{\varepsilon_{n}}(\xi(t_{0} + \varepsilon_{n}) - \xi(t_{0})) \right],
$$

由(i), 对几乎所有的 $\omega$ ,

$$
\frac{1}{\varepsilon_{n}}(\xi(t_{0} + \varepsilon_{n}) - \xi(t_{0})) \to \xi^{\prime}(t_{0}).
$$

又因为对几乎所有的 $\omega,$ 由微分中值定理,

$$
\frac{1}{\varepsilon_{n}}(\xi(t_{0} + \varepsilon_{n}) - \xi(t_{0})) = \xi^{\prime}(t_{0} + \delta_{n}(\omega)), 0 \leqslant \delta_{n}(\omega) \leqslant \varepsilon_{n},
$$

所以

$$
\left| \frac{1}{\varepsilon_{n}}(\xi(t_{0} + \varepsilon_{n}) - \xi(t_{0})) \right| = | \xi^{\prime}(t_{0} + \delta_{n}(\omega)) | \leqslant \eta,
$$

所以由控制收敛定理即得(7.10).

## 习题

1. 证明定理5.7.2中, 条件(ii)可用 $\{\xi(t), t \in I\}$ 一致可积代替.

## 5.8 Riemann-Stieltjes积分

设F是R上的单调上升右连续函数, $\varphi$ 是R上的函数. 我们将仿照Riemann积分定义所谓Riemann-Stieltjes积分. 这个积分粗略地说, 是以Riemann-Stieltjes和

$$
I_{n}(\mathscr{P}, \Theta) := \sum \varphi(\theta_{i})(F(x_{i}) - F(x_{i - 1}))
$$

代替Riemann和

$$
\sum \varphi(\theta_{i})(x_{i} - x_{i - 1}),
$$

然后取分割的步长趋于零时的极限得到的量, 其中 $\theta_{i} \in[x_{i - 1}, x_{i}]$ , 且这个极限必须不依赖于 $\cdot \theta_{i}$ 和 $\lvert x_{i}$ 的具体选择.

为了不陷入复杂的可积性问题, 我们假设 $\varphi$ 是连续函数.

先看有限区间上的积分.

设 $- \infty < a < b < \infty$ . 考虑 $(a, b]$ 的分割 $\mathcal{P} : = \{x_{0}, x_{1}, \cdot \cdot \cdot, x_{n}\}$ , 即

$$
a = x_{0} < x_{1} < \dots < x_{n} = b.
$$

以 $\Delta = \mathrm{max}_{i = 1, \cdots, n} | x_{i} - x_{i - 1} |$ |表示 $\mathcal{P}$ 的步长, $\Theta = \{\{\theta_{1}, \cdot \cdot \cdot, \theta_{n}\}, \theta_{i} \in[x_{i - 1}, x_{i}]\}$ 为介点集.做Riemann-Stieltjes和

$$
I_{n}(\mathcal{P}, \Theta) := \sum \varphi(\theta_{i})(F(x_{i}) - F(x_{i - 1})),
$$

以及Darboux上和与下和

$$
\overline{{S}}_{\mathcal{P}} := \sum_{i = 1}^{n} \max_{x_{i - 1} \leqslant x \leqslant x_{i}} \varphi(x)(F(x_{i}) - F(x_{i - 1})),
$$

$$
\underline{{S}}_{\mathscr{P}} := \sum_{i = 1}^{n} \min_{x_{i - 1} \leqslant x \leqslant x_{i}} \varphi(x)(F(x_{i}) - F(x_{i - 1})).
$$

因为 $\scriptstyle | \varphi{\widehat{\mathcal{M}}}[a, b]$ 上一致连续, 故 $\forall \varepsilon > 0,$ 当 $\Delta$ 充分小时就有

$$
0 \leqslant \overline{{S}}_{\mathscr{P}} - \underline{{S}}_{\mathscr{P}} < \varepsilon.
$$

所以下列极限存在

$$
\int_{(a, b]} \varphi(x) dF(x) := \lim_{\Delta \to 0} \overline{{S}}_{\mathcal{P}} = \lim_{\Delta \to 0} I_{n}(\mathcal{P}, \theta) = \lim_{\Delta \to 0} \underline{{S}}_{\mathcal{P}},
$$

称为 $\varphi$ 对F的Riemann-Stieltjes积分. 注意我们这里用的记号是

$$
\int_{(a, b]} \varphi(x) dF(x),
$$

而非

$$
\int_{a}^{b} \varphi(x) dF(x),
$$

是因为在单点集 $\{a\}$ 上的积分可能并不为零. 事实上, 在单点集 $\{a\}$ 上的积分定义为

$$
\int_{\{a\}} \varphi(x) dF(x) := \lim_{\varepsilon \rightarrow 0} \int_{(a - \varepsilon, a]} \varphi(x) dF(x) = \varphi(a)(F(a) - F(a -)),
$$

所以只有当F在a连续时, ${\mathrm{~}} \# \{a\}$ 上的积分才为零. 若 $\varphi \#(a, b)$ 上连续, 则定义

$$
\int_{(a, b)} \varphi(x) dF(x) := \lim_{\varepsilon \rightarrow 0} \int_{(a, b - \varepsilon]} \varphi(x) dF(x),
$$

如果右边的极限存在的话. 易见当 $\varphi \overleftarrow{\mathcal{H}}(a, b]$ 上连续时有

$$
\int_{(a, b)} \varphi(x) dF(x) = \int_{(a, b]} \varphi(x) dF(x) - \int_{\{b\}} \varphi(x) dF(x).
$$

在整个R上的积分则定义为

$$
\int_{\mathbb{R}}\varphi(x)dF(x):= \lim_{\substack{x\to -\infty \\ y\to \infty}}\int_{(x,y]} \varphi(u)dF(u),
$$

只要右边的极限存在.

我们有:

命题 5.8.1. 设ξ为随机变量, $F$ 为其分布函数, $\varphi$ : R 7→ R为连续函数. 则 $E[\varphi(\xi)]$ 存在的充要条件是 $\mathcal{S}$ 对F的Riemann-Stieltjes积分存在, 且此时有

$$
E[\varphi(\xi)] = \int_{\mathbb{R}} \varphi(x) dF(x).
$$

证明. 不妨设 $\varphi \geqslant 0$ , 一般情况可分解为正负部分开讨论.

$$
\varphi_{n}(x) := \varphi(x) 1(- n < x \leqslant n),
$$

由单调收敛定理有

$$
E[\varphi(\xi)] = \lim_{n \to \infty} E[\varphi_{n}(\xi)].
$$

令

$$
\varphi_{n, k}(x) := \varphi_{n}(2^{- k}([2^{k} x])).
$$

故

$$
0 \leqslant x - 2^{- k}[2^{k} x] \leqslant 2^{- k}.
$$

从而由φ的连续性有

$$
\lim_{k \to \infty} \varphi_{n, k}(x) = \varphi_{n}(x).
$$

于是由控制收敛定理,

$$
E[\varphi_{n}(\xi)] = \lim_{k \to \infty} E[\varphi_{n, k}(\xi)].
$$

但

$$
E[\varphi_{n, k}(\xi)] = \sum_{i = - n2^{k}}^{n2^{k} - 1} \varphi(i2^{- k})[F((i + 1) 2^{- k}) - F(i2^{- k})],
$$

所以

$$
E[\varphi_{n}(\xi)] = \lim_{k \rightarrow \infty} E[\varphi_{n, k}(\xi)] = \int_{(- n, n]} \varphi(x) dF(x).
$$

于是,

$$
\lim_{n \to \infty} \int_{(- n, n]} \varphi(x) dF(x) = \lim_{n \to \infty} E[\varphi_{n}(\xi)] = E[\varphi(\xi)].
$$

但 $\begin{array}{r}{\int_{(a, b]} \varphi(x) dF(x)} \end{array}$ 无论是作为a的函数还是b的函数都是单调的, 所以

$$
\lim_{a \to - \infty, b \to \infty} \int_{(a, b]} \varphi(x) dF(x) = E[\varphi(\xi)],
$$

即

$$
\int_{\mathbb{R}} \varphi(x) dF(x) = E[\varphi(\xi)].
$$

在上面这个命题中, 我们假定 $\vec{\boldsymbol{\jmath}}_{\varphi}$ 连续. 这是由Riemann-Stieltjes积分的定义决定的, 因为 $\varphi$ 不连续时, $\begin{array}{r}{\int_{\mathbb{R}} \varphi(x) dF(x)} \end{array}$ 有可能不存在. 例如, 若ξ服从集中于0点的单点分布, 即

$$
F(x) = \left\{\begin{array}{ll} 0, & x < 0, \\ 1, & x \geqslant 0, \end{array} \right.
$$

若 $\varphi \equiv F$ , 则易见 $\begin{array}{r}{\int_{\mathbb{R}} \varphi(x) dF(x)} \end{array}$ 不存在. 这时如果把这个积分理解为Lebesgue-Stieltjies积分,即理解为

$$
\int_{\mathbb{R}} \varphi(x) \mu(dx),
$$

其中 $\dot{\mu}$ 是ξ的分布, 命题对任意非负Borel可测函数就仍然是成立的, 见下节的讨论. 不过从计算的角度看, 至少当 $\varphi$ 分段连续时, $E[\varphi(\xi)]$ 有更直接因而更实用的公 $\mathbb{R},$ 见习题4.

这个命题是非常有用的. 它告诉我们如果只是计算 $\dot{\varphi}(\xi)$ 的期望, 可不计算 $\dot{\varphi}(\xi)$ 的分布, 而直接由ξ的分布来得到, 这会使计算量大大减少.

我们看两种特殊情况.

## 一. 离散型分布.

设ξ是离散型分布, 分布列为 $\{(x_{i}, p_{i}), i = 1, 2, \cdot \cdot \cdot\}$ . 设

$$
\sum_{i = 1}^{\infty} | \varphi(x_{i}) | p_{i} < \infty.
$$

任意固定n. 令 $I_{n} : = \{i : x_{i} \in(- n, n]\}$ $\forall \varepsilon > 0$ , 由于φ在 $[- n, n]$ 上一致连续, 所以当m充分大时,

$$
\max_{x \in[k2^{- m},(k + 1) 2^{- m}]} | \varphi(k2^{- m}) - \varphi(x) | < \varepsilon, \forall k = - n2^{m}, \dots, n2^{m} - 1.
$$

记 $\Delta_{k}^{m} : =(k2^{- m},(k + 1) 2^{- m}]$ , 因此

$$
\left| \sum_{x_{i} \in \Delta_{k}^{m}} \varphi(x_{i}) p_{i} - \varphi(k2^{- m})(F((k + 1) 2^{- m}) - F(k2^{- m})) \right| < \varepsilon \sum_{x_{i} \in \Delta_{k}^{m}} p_{i}.
$$

于是

$$
\left| \sum_{i \in I_{n}} \varphi(x_{i}) p_{i} - \int_{(- n, n]} \varphi(2^{- m}[2^{m} x]) dF(x) \right| < \varepsilon \sum_{i \in I_{n}} p_{i} \leqslant \varepsilon.
$$

令 $m \to \infty$ 得

$$
\left| \sum_{i \in I_{n}} \varphi(x_{i}) p_{i} - \int_{(- n, n]} \varphi(x) dF(x) \right| \leqslant \varepsilon
$$

再令 $n \to \infty$ 得

$$
\left| \sum_{i = 1}^{\infty} \varphi(x_{i}) p_{i} - \int_{\mathbb{R}} \varphi(x) dF(x) \right| \leqslant \varepsilon.
$$

由ε的任意性得

$$
\int_{\mathbb{R}} \varphi(x) dF(x) = \sum_{i = 1}^{\infty} \varphi(x_{i}) p_{i}.
$$

二. 连续型分布.

设ξ是连续型的, 密度函数为 $\displaystyle f, \varphi.$ 为一连续函数, 且 $\begin{array}{r}{\int_{- \infty}^{\infty} | \varphi(x) | f(x) dx < \infty.\mathrm{~} \forall \mathrm{~} a < b,} \end{array}$ 令

$$
x_{i}^{n} := a + \frac{i}{n}(b - a), i = 0, 1, \dots, n.
$$

则

$$
\sum_{i = 0}^{n - 1} \varphi(x_{i}^{n})(F(x_{i + 1}^{n}) - F(x_{i}^{n})) = \sum_{i = 0}^{n - 1} \varphi(x_{i}^{n}) \int_{x_{i}^{n}}^{x_{i + 1}^{n}} f(x) dx
$$

$\forall \varepsilon > 0.$ , 当 $n_{\ast}$ 足够大时有

$$
\left| \varphi \left(x_{i}^{n}\right) - \varphi(x) \right| < \varepsilon, \forall x \in \left[x_{i}^{n}, x_{i + 1}^{n} \right].
$$

对 $x \in[x_{i}^{n}, x_{i + 1}^{n})$ , 令 $h_{n}(x) = x_{i}^{n}$ , 则有

$$
\begin{array}{ll} & \left| \int_{a}^{b} \varphi(x) f(x) dx - \sum_{i = 0}^{n - 1} \varphi(x_{i}^{n})(F(x_{i + 1}^{n}) - F(x_{i}^{n})) \right| \\ = & \left| \int_{a}^{b} \varphi(x) f(x) dx - \sum_{i = 0}^{n - 1} \varphi(x_{i}^{n}) \int_{x_{i}^{n}}^{x_{i + 1}^{n}} f(x) dx \right| \\ \leqslant & \int_{a}^{b} | \varphi(x) - \varphi(h_{n}(x)) | f(x) dx \\ \leqslant & \varepsilon \int_{a}^{b} f(x) dx \\ \leqslant & \varepsilon.\end{array}
$$

令 $n \to \infty$ 得

$$
\left| \int_{a}^{b} \varphi(x) f(x) dx - \int_{(a, b]} \varphi(x) dF(x) \right| \leqslant \varepsilon.
$$

所以由ε的任意性有

$$
\int_{(a, b]} \varphi(x) dF(x) = \int_{a}^{b} \varphi(x) f(x) dx.
$$

最后, 令 $a \to - \infty, b \to \infty$ 得

$$
\int_{\mathbb{R}} \varphi(x) dF(x) = \int_{- \infty}^{\infty} \varphi(x) f(x) dx.
$$

也就是说, 此时 $\varphi$ 对F的Riemann-Stieltjes积分可转化为 $\boldsymbol{\varphi}$ 的普通Riemann积分.

多维情况时有类似的理论. 首先, 若 $F$ 是 $(\xi_{1}, \xi_{2}, \cdots, \xi_{n})$ 的分布函数, $\varphi^{\sharp}{\mathbb{R}}^{n}$ 上的连续函数, 则可定义Riemann-Stieltjes积分:

$$
\int_{- \infty}^{\infty} \dots \int_{- \infty}^{\infty} \varphi(x_{1}, x_{2}, \dots, x_{n}) dF(x_{1}, x_{2}, \dots, x_{n}).
$$

类似可证明, 当 $E[\varphi(\xi_{1}, \cdots, \xi_{n})]$ 存在的充要条件是上述积分也存在, 且此时两者相等:

$$
E[\varphi(\xi_{1}, \dots, \xi_{n})] = \int_{- \infty}^{\infty} \dots \int_{- \infty}^{\infty} \varphi(x_{1}, x_{2}, \dots, x_{n}) dF(x_{1}, x_{2}, \dots, x_{n}).
$$

特别地, 当 $\left(\xi_{1}, \cdots, \xi_{n} \right)$ 是离散型且分布列为 $\{(x_{i_{1}}^{1}, x_{i_{2}}^{2}, \cdot \cdot \cdot, x_{i_{n}}^{n}), p_{i_{1}, \cdot \cdot \cdot, i_{n}}\}$ 时,

$$
E[\varphi(\xi_{1}, \dots, \xi_{n})] = \sum_{i_{1}, \dots, i_{n}} \varphi(x_{i_{1}}^{1}, \dots, x_{i_{n}}^{n}) p_{i_{1}, \dots, i_{n}},
$$

当然, 此时不需要 $\varphi.$ 连续, 而只要满足

$$
\sum_{i_{1}, \dots, i_{n}} | \varphi(x_{i_{1}}^{1}, \dots, x_{i_{n}}^{n}) | p_{i_{1}, \dots, i_{n}} < \infty
$$

便足矣. 而当 $\left(\xi_{1}, \cdots, \xi_{n} \right)$ 是连续型且有密度函数f时, 我们有

$$
E[\varphi(\xi_{1}, \dots, \xi_{n})] = \int_{- \infty}^{\infty} \dots \int_{- \infty}^{\infty} \varphi(x_{1}, x_{2}, \dots, x_{n}) f(x_{1}, x_{2}, \dots, x_{n}) dx_{1} \dots dx_{n}.
$$

从上面的结果可以看出, 如果两个随机变量ξ和 $\lvert \eta$ 同分布, 那么对任意连续函数 $\varphi, \varphi(\xi)$ 与$\varphi(\eta)$ 都有相同的期望. 反过来, 我们也可以证明, 如果对足够多的 $f, f(\xi)$ 与 $f(\eta)$ 的期望仍然相等, 那么 $\xi$ 和η 就没得选择, 必须同分布. 为精确地阐述这一结果, 我们引进函数类:

$C_{0}^{\infty}(\mathbb{R}^{m}) : = \{f : \mathbb{R}^{m} \mapsto \quad$ R : f无穷次可微且在某个有界集外恒等于零}.

$m = 1$ 时, 简记 $C_{0}^{\infty} : = C_{0}^{\infty}(\mathbb{R})$ . 同时, 令

$C _ { 0 } ( \mathbb { R } ^ { m } ) : = \{ f : \mathbb { R } ^ { m } \mapsto $ R : f连续且在某个有界集外恒等于零},

$$
C_{b}(\mathbb{R}^{m}) := \{f: \mathbb{R}^{m} \mapsto \mathbb{R}: f \text{有界连续}\}.
$$

无混淆危险时, 我们常常省略R<sup>m</sup>. 显然

$$
C_{0}^{\infty} \subset C_{0} \subset C_{b}.
$$

这样的函数是存在的,很多的. 例如, 令

$$
\rho(x) := \left\{\begin{array}{ll} k \exp \{- \frac{1}{1 - | x |^{2}}\} & | x | < 1, \\ 0 & | x | \geqslant 1, \end{array} \right.
$$

其中k是常数. 则 $\rho \in C_{0}^{\infty}(\mathbb{R}^{m})$ . 下面我们固定k使得

$$
\int_{\mathbb{R}^{m}} \rho(x) dx = 1.
$$

对任意n, 令

$$
\rho_{n}(x) = n^{m} \rho(nx).
$$

则仍有 $\rho_{n} \in C_{0}^{\infty}(\mathbb{R}^{m})$

∀ $f \in C_{0}(\mathbb{R}^{m})$ , 令

$$
f_{n}(x) := f * \rho_{n}(x) := \int_{\mathbb{R}^{m}} \rho_{n}(x - y) f(y) dy,
$$

一般称 $f * g$ 为 $f{\stackrel{\underset{\mathbb{E}}{}}{\F}} g$ 的卷积. 显然 $f * g = g * f.$

由习题3, $f_{n} \in C_{0}^{\infty}(\mathbb{R}^{m})$ 且 $f_{n} f$

我们有:

![](images/adf5c6ea47650f747d7faccbc600bf1d71e0755312e911ea300bac814f8063f0.jpg)  
图 5.1: 函数ρ(x)的图像

定理 5.8.2. 设对任意 $f \in C_{0}^{\infty}(\mathbb{R}^{m}), E[f(\xi)] = E[f(\eta)]$ , 那么ξ与η同分布.

证明. 设 $f \in C_{0},$ 令

$$
f_{n} := f * \rho_{n}.
$$

则 $f_{n} \in C_{0}^{\infty}$ 且 $f_{n}(x) \to f(x)$ , ∀x. 因此由控制收敛定理,

$$
E[f(\xi)] = \lim_{n \to \infty} E[f_{n}(\xi)] = \lim_{n \to \infty} E[f_{n}(\eta)] = E[f(\eta)].
$$

设 $a, b \in \mathbb{R}^{m}$ 且 $a < b($ (即 $\displaystyle a_{i} < b_{i}, \forall i = 1, \cdots, m)$ , 取一列 $f_{n} \in C_{0}$ 使得 $f_{n}(x) \to 1_{(a, b]}(x)$ , ∀x,且 $| f_{n}(x) | \leqslant 1, \forall n \geqslant 1$ . 以F和G分别记ξ和η的分布函数, 则由控制收敛定理

$$
\begin{array}{rcl} F(b) - F(a) & = & E[1_{(a, b]}(\xi)] \\ & = & \lim_{n \to \infty} E[f_{n}(\xi)] \\ & = & \lim_{n \to \infty} E[f_{n}(\eta)] \\ & = & E[1_{(a, b]}(\eta)] \\ & = & G(b) - G(a).\end{array}
$$

再令 $\cdot a - \infty$ 即可.

习题

1. 设ξ,η,ζ是随机变量, 且绝对值均小于1. 证明:

$$
\left| E \left[\xi \zeta - \eta \zeta \right] \right| \leqslant 1 - E[\xi \eta].
$$

2. 令

$$
\varphi(x) := \frac{1}{\sqrt{2 \pi}} e^{- \frac{x^{2}}{2}},
$$

$$
\Phi(x) := \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{x} e^{- \frac{y^{2}}{2}} dy.
$$

证明:

$$
{\frac{x}{1 + x^{2}}} \varphi(x) < 1 - \Phi(x) <{\frac{1}{x}} \varphi(x), \forall x > 0.
$$

3. $\forall f \in C_{0}(\mathbb{R}^{m})$ ), 令

$$
f_{n}(x) := \rho_{n} * f(x) := \int_{\mathbb{R}^{m}} \rho_{n}(x - y) f(y) dy.
$$

证明 $f_{n} \in C_{0}^{\infty}(\mathbb{R}^{m})$ 且 $f_{n} f.$

4. 设ξ的分布函数为F, φ为R上的非负Borel函数. 设有

$$
- \infty < \dots < x_{- n} < \dots < x_{- 1} < x_{0} < x_{1} < \dots x_{n} < \dots < \infty
$$

使得 $\varphi$ 与F在所有 $(x_{n}, x_{n + 1})$ 内都是连续的. 证明:

$$
E[\varphi(\xi)] = \sum_{n = - \infty}^{\infty} \varphi(x_{n})(F(x_{n}) - F(x_{n} -)) + \sum_{n = - \infty}^{\infty} \int_{(x_{n}, x_{n + 1})} \varphi(x) dF(x).
$$

5. 设ξ, η是m-维随机变量, 且

$$
E[f(\xi)] = E[f(\eta)] \forall f \in C_{0}^{\infty}(\mathbb{R}^{m}).
$$

证明ξ与η同分布.

6. 设ξ,η的期望存在. 证明:

$$
E[\xi - \eta] = \int_{- \infty}^{\infty}[P(\eta < x \leqslant \xi) - P(\xi < x \leqslant \eta)] dx.
$$

7. 设ξ是可积随机变量. 证明:

(a) $\forall a \geqslant 0,$

$$
E[\xi 1_{\xi \geqslant a}] = aP(\xi \geqslant a) + \int_{a}^{\infty} P(\xi \geqslant x) dx;
$$

(b) $\forall a \leqslant 0,$

$$
E[\xi 1_{\xi \leqslant a}] = aP(\xi \leqslant a) + \int_{- \infty}^{a} P(\xi \leqslant x) dx;
$$

(c)

$$
\lim_{| a | \rightarrow \infty} \left(| a | P(| \xi | \geqslant | a |) + \int_{| a |}^{\infty} P(| \xi | \geqslant x) dx\right) = 0.
$$

8. 设 $\cdot \xi$ 是可积随机变量, F是其分布函数, $\varphi.$ 是R上有界的分段连续可微函数. 证明

$$
E[\varphi(\xi)] = - \int_{\mathbb{R}} \varphi^{\prime}(x) F(x) dx.
$$

## 5.9 Lebesgue-Stieltjes积分

回顾4.2节中分布的概念. 设 $(\Omega,{\mathcal{F}}, P)$ 为概率空间, ξ为其上的R<sup>m</sup>-值随机变量. 对 $A \in{\mathcal{B}}$ 令

$$
\mu(A) := P(\xi^{- 1}(A)),
$$

则容易验证, $\mu \mathcal{H}(\mathbb{R}^{m}, \mathcal{B}^{m})$ 上的概率, 因此 $(\mathbb{R}^{m}, \mathcal{B}^{m}, \mu)$ 为概率空间.

在概率空间 $\mathbb{J}(\mathbb{R}^{m}, \mathcal{B}^{m}, \mu)$ 上, 随机变量就是Borel函数. 因此对 $f \in \mathcal{B}^{m}$ , 可定义

$$
\int_{\mathbb{R}} f(x) d \mu := E^{0}[f].
$$

这里 $E^{0}$ 表示概率空间 $(\mathbb{R}^{m}, \mathcal{B}^{m}, \mu)$ 上的期望. 这样定义出来的积分称为F的 Lebesgue-Stieltjes积分.

我们有

命题 5.9.1.

$$
E[f(\xi)] = E^{0}[f], \forall f \in \mathcal{B}^{m},
$$

即上述等式两边要么都有意义, 要么都没意义, 且有意义时两者相等.

证明. 第一步, 设 $f = 1_{A}, A \in \mathcal{B}^{m}$ , 则由定义, 等式成立.

第二步, 对 $\begin{array}{r}{\mathbf{\mathcal{f}} = \sum_{i = 1}^{n} a_{i} \mathbf{1}_{A_{i}}, A_{i} \in \mathcal{B}^{m}} \end{array}$ , 由期望的线性性和第一步, 知等式仍然成立.

第三步, 对 $f \in \mathcal{B}_{+}^{m}$ , 取一列有限取值的简单函数 $f_{n} \uparrow f.$ . 则由第二步和单调收敛定理, 知等式成立.

第四步, 对一般的 $f \in \mathcal{B}^{m}$ , 有 $f = f^{+} - f^{-}$ . 所以由上一步,

$$
E[f(\xi)] = E[f^{+}(\xi)] - E[f^{-}(\xi)] = E^{0}[f^{+}] - E^{0}[f^{-}] = E^{0}[f].
$$

因为R<sup>m</sup>上的连续函数是Borel函数, 所以是 $(\mathbb{R}^{m}, \mathcal{B}^{m}, \mu)$ 上的随机变量. 因此上面的命题对连续函数成立. 但对连续函数f, 由命题5.8.1又有

$$
E[f(\xi)] = \int_{\mathbb{R}^{m}} f(x) dF(x),
$$

所以

$$
\int_{\mathbb{R}^{m}} f(x) d \mu = \int_{\mathbb{R}^{m}} f(x) dF(x).
$$

进一步可以证明, 若f为Borel函数, 且|f|:Riemann-Stieltjes可积, 则f为Lebesgue-Stieltjes可积(这是实变函数的重要结论, 例如可见[20, 定理4.7.3]). 因此为方便及记号简单起见, 我们以后对Borel函数f, 把上式左边的积分通通记为右边, 并约定: 当Riemman-Stieljes积分存在时, 它就是Riemman-Stieljes积分; 当Riemman-Stieljes积分不存在时, 它就是Lebesgue-Stieltjes积分.

为什么要在Riemman-Stieltjes积分和Lebesgue-Stieltjes积分间换来换去?这难道不是多 余的吗?

不, 不是多余的. 这是因为, Riemman-Stieltjes积分里可积性的条件比较苛刻, 因而可积函数比较少,且积分号下取极限的条件比较苛刻, 因此运算起来受到很多限制, 很不方便. 这时候Lebesgue-Stieltjes积分就显示出它的优势了——我们看到过的, 此时任何非负Borel函数的积分都是存在的, 并且积分号和极限号交换的条件要宽松许多. 而一旦交换成功后, 我们又往往可以用Riemman-Stieltjes积分进行实际计算(如果只从定义出发, Lebesgue-Stieltjes积分除了平凡的情况外, 几乎都是不能算的). 所以Riemman-Stieltjes积分与Lebesgue-Stieltjes积分的关系就像普通公路与高速公路的关系: 你离不开高速公路跨越千山万水, 但也离不开普通公路开回家门口.

为用说明实例说明这一点, 也因为其本身就是一个重要的结果, 我们来证明:

定理 5.9.2. 设ξ为n维随机变量, 分布函数为F, $D \in \mathcal{B}^{n}$ . 则

$$
P(\xi \in D) = \int_{D} dF := \int 1_{D}(x) dF(x).
$$

当 $\xi$ 是连续型随机变量, 密度函数为 $p,$ 且D为有限条简单曲面围成的区域(开或闭均可)时, <sup>7</sup>上式右边可理解为Riemman 积分 $\scriptstyle \int_{D} p(x) dx$

我们先做一点准备工作. 设D为R<sup>n</sup>中一区域. 令

$$
d(x, D) := \inf \{d(x, y): y \in D\},
$$

其中

$$
d(x, y) := \sqrt{\sum_{i = 1}^{n}(x_{i} - y_{i})^{2}}.
$$

显然有

$$
| d(x, D) - d(y, D) | \leqslant | x - y |.
$$

特别地, d是连续函数.

证明. 在上一命题中取 $f = 1_{D}$ 即得到第一个结论.

设ξ是连续型的, 密度函数为 $\mathsf{Ip.}$ . 则

$$
\int e^{- nd(x, D)} dF(x) = \int e^{- nd((x_{1}, \dots, x_{n}), D)} p(x_{1}, \dots, x_{n}) dx_{1} \dots dx_{n}.
$$

因为 $\scriptstyle | e^{- nd(x, D)}$ 是连续函数, 且收敛到1 $.\mathbf{\Gamma}_{D}, \dx \mathbf{-} \mathbf{a.s.}$ , 故由控制收敛定理,

$$
\int 1_{D}(x) dF(x) = \int 1_{D}(x_{1}, \dots, x_{n}) p(x_{1}, \dots, x_{n}) dx_{1} \dots dx_{n}.
$$

当D为满足条件的区域时, 上述右端的被积函数只在有限条简单曲面上不连续(原来p的不连续点加上D的边界), 因而是Riemman可积的, 所以第二个结论成立. □

理论上, 设 $\varphi : \mathbb { R } ^ { n } \mapsto \qquad $ R是连续函数, 且 $\forall x.$ 区域 $D_{x} : = \{\varphi \leqslant x\}$ 的边界是由有限条简单曲面构成的, 那么可以通过这个定理求出 $\varphi(\xi)$ 的分布, 因为

$$
P(\varphi(\xi) \leqslant x) = \int_{y \in D_{x}} dF(y) = \int 1_{D_{x}}(y_{1}, \dots, y_{n}) p(y_{1}, \dots, y_{n}) dy_{1} \dots dy_{n},
$$

其中右边的积分为Riemman积分. 这个公式是计算随机变量的函数的分布的理论依据.

## 习题

1. 设一维分布函数F对应的概率为µ. 证明:

$$
\mu(\{x\}) = F(x) - F(x -),
$$

$$
\mu((x, y]) = F(y) - F(x),
$$

$$
\mu((x, y)) = F(y -) - F(x),
$$

$$
\mu([x, y]) = F(y) - F(x -),
$$

$$
\mu(([x, y)) = F(y -) - F(x -).
$$

2. 设 $\xi, \eta$ 是随机变量, $F(x, y)$ 是其联合分布函数, $F_{1}$ 与 $F_{2}$ 是其两个边沿分布函数. 判断下列命题的正确性, 正确的给予证明, 不正确的给予反例.

(a) 设 $(x, y) \in \mathbb{R}^{2}.\P((\xi, \eta) =(x, y)) = 0$ 的充分必要条件是 ${\mathit{F}}{\mathit{\overleftrightarrow{\mathbb{E}}}}(x, y)$ 处连续;

(b) ${\mathit{F}}{\mathit{\overleftrightarrow{\mathbb{E}}}}(x, y)$ 处连续时, $F_{1}$ 在x处连续, $F_{2}$ 在y处连续;

(c) $F_{1} \# \mathbb{E} x$ 处连续, $F_{2} \# \mathbb{E} y$ 处连续时, $ { \boldsymbol { F } } \not \equiv ( { \boldsymbol { x } } , { \boldsymbol { y } } )$ 处连续;

(d) F在 $(x, y)$ 处连续的充分必要条件是: $F_{1}$ 在x处连续与 $F_{2}$ 在 $: y$ 处连续两者中至少有一 个成立.

3. 以V表示正立方体的体积. 设V服从参数为λ的指数分布. 求其边长l 的分布.

4. 分别举出连续型与离散型随机变量ξ, η的例 ${\vec{\operatorname{f}}},$ , 满足 $F_{\xi} = F_{\eta},$ 但 $P(\xi \neq \eta) = 1$

5. 分别举出连续型与离散型随机变量 $\xi, \eta, \zeta$ 的例子, 满足 $F_{\xi} = F_{\eta},$ 但 $F_{\xi \zeta} \neq F_{\eta \zeta}$

6. 设半径r的密度函数为 $\mid f,$ 求半径为r的圆的面积的分布和半径为r的球的体积的分布.

7. 设 $\xi \sim N(0, 1)$ . 求 $e^{\xi}, \xi^{n}.$ , |ξ|<sup>n</sup>的分布. 它们是连续型的吗?

8. 设(ξ, η)服从[0, 1]<sup>2</sup>上的均匀分布. 计算ξ + η的分布.

9. 设 $\xi =(\xi_{1}, \cdot \cdot \cdot, \xi_{n}) \sim N(\mu, \Sigma)$ . 计算 $\textstyle \sum_{i = 1}^{n} a_{i} \xi_{i}$ 的分布, 其中 $^{\mathfrak{I}} a_{i}$ 是常数.

10. 设(ξ,η)服从单位圆盘上的均匀分布. 计算 $\cdot \xi^{2} + \eta^{2}$ 的分布.

11. 设(ξ, η)服从区域 $\left\{(x, y) : 0 \leqslant x \leqslant y \leqslant 1 \right\}$ 上的均匀分布. 计算 $\xi^{n}$ 的分布.

12. 设X,Y,Z为随机变量. 判断下面说法是否正确, 证明或给出反例.

(a) X, Y 同分布时, $X + Z^{\sqcup} Y + Z$ 同分布;

(b) X, Y 不同分布时, X + Z与Y + Z不同分布;

(c) X, Y 同分布时, XZ与Y Z同分布.

13. 设(ξ, η)服从[0, 1]<sup>2</sup>上的均匀分布. 令 $X : = \xi \vee \eta, Y : = \xi \wedge \eta.$ . 求 $P(X \leqslant x | Y \leqslant y)$

14. 设ξ服从[0, 2π]上的均匀分布. 求 $(\xi, \sin \xi),(\sin \xi, \cos \xi)$ 的联合分布.

15. 设r服从[0, 1]上的均匀分布, θ服从 $[0, 2 \pi]$ 上的均匀分布, r与θ独立. 令X $: = r \cos \theta, Y =$ r sin θ. 求(X, Y)的联合分布.

16. 设(X,Y)服从单位圆盘上的均匀分布. 令 $\cdot r ={\sqrt{X^{2} + Y^{2}}}, \theta : = \operatorname{Arg}(X, Y)$ . 求 $(r, \theta)$ 的联合分布.

17. 设ξ, η独立同分布, 期望存在. 证明:

$$
E[| \xi + \eta | - | \xi - \eta |] = \int_{- \infty}^{\infty}(1 - F(x) - F(- x))^{2} dx,
$$

其中F是ξ和η的公共分布函数.

18. 设ξ是非负随机变量, $r > 1$ . 证明:

$$
\int_{0}^{\infty} \frac{E[\xi \wedge x^{r}]}{x^{r}} dx = \frac{r}{r - 1} E[\xi^{1 / r}].
$$

19. 设分布函数为

$$
F(x) = \left\{\begin{array}{ll} 0 & x \leqslant 0, \\ x & 0 < x \leqslant 1, \\ 1 & x \geqslant 1.\end{array} \right.
$$

$$
f(x) ={\left\{\begin{array}{ll}{0} &{x \text{为有理数}} \\{1} &{x \text{为无理数}.} \end{array} \right.}
$$

证明Riemann积分

$$
\int_{0}^{1} f(x) dF(x)
$$

不存在, 但Lebesgue积分

$$
\int_{0}^{1} f(x) d \mu
$$

存在, 且等于1.

## 5.10 方差与矩

随机变量的期望直观上是反映随机变量取值的平均大小的数字特征, 基于随机变量函数的期望可以定义出反映随机变量其他特征的量. 比如方差, 协方差, 相关系数和各种矩.

我们先看一个简单的例子.

$n \lambda(\omega_{1}, \cdots, \omega_{n})$ 参加满分为100分的考试, $\omega_{i}$ 的成绩为 $\xi(\omega_{i})$ , 则平均成绩为

$$
a = \frac{1}{n} \sum_{i = 1}^{n} \xi(\omega_{i})
$$

每 ${\bf \Gamma}^{-} \omega_{i}$ 的成绩偏离这个成绩的偏差为

$$
| \xi(\omega_{i}) - a |
$$

这引导我们考虑量

$$
\frac{1}{n} \sum_{i = 1}^{n}(\xi(\omega_{i}) - a)^{2}
$$

## 5.10 方差与矩

又可写为

$$
\sum_{k = 0}^{100}(k - a)^{2} \frac{n_{k}}{n},
$$

其中 $n_{k}$ 是得k分的人数. 因此上式等于

$$
\sum_{k = 0}^{100}(k - a)^{2} P(\xi = k) = E[(\xi - E \xi)^{2}]
$$

这就引导出一般的方差概念.

定义 5.10.1. 设随机变量 $\boldsymbol{\xi}$ 的期望有限, 方差定义为

$$
D[\xi] := E[(\xi - E \xi)^{2}].
$$

标准差定义为 $\sqrt{D[\xi]}$

方差的另一个计算公式是:

$$
D[\xi] = E[\xi^{2}] -(E[\xi])^{2}.
$$

事实上

$$
\begin{array}{rcl} D[\xi] & = & E[(\xi - E[\xi])^{2}] \\ & = & E[\xi^{2} - 2 \xi E[\xi] +(E[\xi])^{2}] \\ & = & E[\xi^{2}] - 2(E[\xi])^{2} +(E[\xi])^{2} \\ & = & E[\xi^{2}] -(E[\xi])^{2} \end{array}
$$

我们常常用平均值来衡量一个随机变量的大小: 例如用平均身高衡量一个国家国民的高度, 用平均分数衡量一个班的学习成绩, 等等. 这样做的依据是什么呢? 依据就是下面的:

定理 5.10.2. 随机变量ξ, 若期望和方差均有限, 则期望是常数中最接近ξ的, 在下面的意义下:

$$
D[\xi] \leqslant E[(\xi - c)^{2}] \forall c \in \mathbb{R}.
$$

证明. 令

$$
f(c) = E[(\xi - c)^{2}].
$$

然后你立即得到 $E[\xi]$ 为f的最小值点(直接求导求极值也可以, 展开之后用一元二次函数的顶点也可以). □

方差还有如下基本性质:

命题 5.10.3. (i) 设 $\xi = c \frac{\Theta}{\Lambda}$ 常数,则

$$
D[\xi] = 0.
$$

(ii) 设c是常数,则

$$
D[\xi + c] = D[\xi]
$$

(iii) 设c是常数,则

$$
D[c \xi] = c^{2} D[\xi].
$$

证明. (i) 若ξ = c是常数, 则

$$
E[\xi] = c.
$$

所以

$$
\xi - E[\xi] = 0.
$$

于是

$$
D[\xi] = 0.
$$

(ii) 因为

$$
E[\xi + c] = E[\xi] + c,
$$

所以

$$
\xi + c -(E[\xi] + c) = \xi - E[\xi].
$$

从而

$$
D[\xi + c] = E[(\xi + c -(E[\xi] + c))^{2}] = E[(\xi - E[\xi])^{2}] = D[\xi].
$$

(iii)

$$
\begin{array}{rcl}{D[c \xi]} & = &{E[(c \xi - cE[\xi])^{2}]} \\ & = &{c^{2} E[(\xi - E[\xi])^{2}]} \\ & = &{c^{2} D[\xi].} \end{array}
$$

注. 1. 设ξ的分布函数为 $F_{;}$ , 那么根据上节的结果, 我们有:

$$
D[\xi] = \int_{- \infty}^{\infty}(x - E[\xi])^{2} dF(x).
$$

2. 自然的问题是: 为什么不考虑用 $E[| \xi - E[\xi] |]$ 来衡量偏差? 回答是：因为 $D[\xi]$ 更方便数学处理, 这跟R<sup>n</sup>中的常用距离是 $\sqrt{| x_{1} - y_{1} |^{2} + \cdot \cdot \cdot + | x_{n} - y_{n} |^{2}}$ 而不是 $| x_{1} - y_{1} | + \cdot \cdot \cdot + | x_{n} -right.$ $y_{n} \vert$ |是一个道理.

3. 方差中的“方”, 是平方的方.

对p ⩾ 1, $E[| \boldsymbol{\xi} |^{p}]$ 称为ξ的p-阶矩. 由命题5.9.1, 我们有

$$
E[| \xi |^{p}] = \int_{- \infty}^{\infty} | x |^{p} dF(x).
$$

我们看几个具体的例子.

例1. Bernoulli分布ξ $\sim B(p)$

$$
\begin{array}{c}{E[\xi] = p,} \\{E[\xi^{2}] = 1^{2} \times p + 0^{2} \times(1 - p) = p,} \\{D[\xi] = p - p^{2} = pq.} \end{array}
$$

例2. Poisson分布 $\xi \sim P(\lambda)$ .

$$
E[\xi] = \lambda
$$

$$
\begin{array}{rcl} E[\xi^{2}] & = & \sum_{k = 1}^{\infty} k^{2} \times \frac{\lambda^{k}}{k !} e^{- \lambda} \\ & = & \sum_{k = 1}^{\infty} k \times \frac{\lambda^{k}}{(k - 1) !} e^{- \lambda} \\ & = & \lambda \sum_{k = 0}^{\infty}(k + 1) \times \frac{\lambda^{k}}{k !} e^{- \lambda} \\ & = & \lambda^{2} + \lambda.\end{array}
$$

$$
D[\xi] = E[\xi^{2}] -(E[\xi])^{2} = \lambda.
$$

例3. 均匀分布 $\xi \sim U[a, b]$

$$
E[\xi] = \frac{b + a}{2},
$$

$$
E[\xi^{2}] = \int_{a}^{b} x^{2} \frac{1}{b - a} dx = \frac{b^{2} + ab + a^{2}}{3},
$$

$$
D[\xi] = \frac{(b - a)^{2}}{12}.
$$

例4. 正态分布 $N(\mu, \sigma^{2})$

$$
\begin{array}{rcl}{D[\xi]} & = &{E[(\xi - \mu)^{2}] = \int_{- \infty}^{\infty}(x - \mu)^{2} \frac{1}{\sqrt{2 \pi} \sigma} e^{-(x - \mu)^{2} /(2 \sigma^{2})} dx} \\ & = &{\frac{\sigma^{2}}{\sqrt{2 \pi}} \int_{- \infty}^{\infty} z^{2} e^{- z^{2} / 2} dz} \\ & = &{\sigma^{2}.} \end{array}
$$

如果说方差是衡量一个随机变量波动的指标的话, 那么衡量两个随机变量联动的指标则是协方差. 具体地说, 二维随机变量 $(\xi, \eta)$ 的协方差定义为.

$$
\operatorname{Cov}(\xi, \eta) := E[(\xi - E \xi)(\eta - E \eta)] = \int_{\mathbb{R}^{2}}(x - E[\xi])(y - E[\eta]) dF(x, y),
$$

其中 $F$ 是 $(\xi, \eta)$ 的分布函数. 将 $(\xi - E \xi)(\eta - E \eta)$ 乘开后分别对每项求期望, 易见

$$
\operatorname{Cov}(\xi, \eta) = E[\xi \eta] - E[\xi] E[\eta].
$$

若 $D[\xi] \cdot D[\eta] > 0$ , 则ξ和η的相关系数定义为

$$
\rho(\xi, \eta) := \frac{Cov(\xi, \eta)}{\sqrt{D \xi D \eta}}.
$$

由Cauchy-Schwartz不等式, 我们有

$$
| \rho | \leqslant 1.
$$

若 $\operatorname{Cov}(\xi, \eta) = 0.$ , 称ξ, $\eta^{\mathrm{~ ~}}$ 不相关. 易见 $\xi, \eta$ 不相关的充要条件是

$$
E[\xi \eta] = E[\xi] E[\eta].
$$

例5. 设 $(\xi, \eta) \sim N(\mu_{1}, \mu_{2}, \sigma_{1}^{2}, \sigma_{2}^{2}, \rho)$ , 则ξ $\mathbf{\Sigma}^{\cdot} \sim N(\mu_{1}, \sigma_{1}^{2})$ 和η $\sim N(\mu_{2}, \sigma_{2}^{2})$ . 所以 $E[\xi] = \mu_{1}$ $D \xi = \sigma_{1}^{2}, E[\eta] = \mu_{2}, D \eta = \sigma_{2}^{2}$ . 它们的协方差

$$
\operatorname{Cov}(\xi, \eta) = E[(\xi - E \xi)(\eta - E \eta)] = \int_{\mathbb{R}^{2}}(x - \mu_{1})(y - \mu_{2}) p(x, y) dxdy,
$$

其中 $^{\mathnormal{\lceil} p \mathnormal{\rceil}}$ 为密度函数

$$
\begin{array}{rcl} p(x, y) & = & \frac{1}{2 \pi \sigma_{1} \sigma_{2} \sqrt{1 - \rho^{2}}} \exp \bigg \{- \frac{1}{2(1 - \rho^{2})} \\ & & \cdot \Big[\frac{(x - \mu_{1})^{2}}{\sigma_{1}^{2}} - \frac{2 \rho(x - \mu_{1})(y - \mu_{2})}{\sigma_{1} \sigma_{2}} + \frac{(y - \mu_{2})^{2}}{\sigma_{2}^{2}} \Big] \bigg\}.\end{array}
$$

对积分进行变量替换得

$$
\begin{array}{rcl} \operatorname{Cov}(\xi, \eta) & = & \sigma_{1} \sigma_{2} \int_{\mathbb{R}^{2}} st \frac{1}{2 \pi \sqrt{1 - \rho^{2}}} \exp \left\{- \frac{1}{2(1 - \rho^{2})}[s^{2} - 2 \rho st + t^{2}] \right\} dsdt \\ & = & \sigma_{1} \sigma_{2} \int_{\mathbb{R}} \frac{s}{\sqrt{2 \pi}} e^{- \frac{s^{2}}{2}} ds \int_{\mathbb{R}} \frac{t}{\sqrt{2 \pi(1 - \rho^{2})}} \exp \left\{- \frac{(t - \rho s)^{2}}{2(1 - \rho^{2})} \right\} dt \\ & = & \rho \sigma_{1} \sigma_{2} \int_{\mathbb{R}} \frac{s^{2}}{\sqrt{2 \pi}} e^{- \frac{s^{2}}{2}} ds \\ & = & \rho \sigma_{1} \sigma_{2}.\end{array}
$$

因此

$$
\rho(\xi, \eta) = \rho.
$$

现在我们终于知道二维正态分布的密度函数中的那个 $\cdot \rho |$ 的意义了: 它代表两个分量之间的相关关系!

也可以用下面的方式计算协方差. 回顾

$$
\begin{array}{rcl} p(x, y) & = & \frac{1}{\sqrt{2 \pi} \sigma_{1}} \exp \left\{- \frac{(x - \mu_{1})^{2}}{2 \sigma_{1}^{2}} \right\} \\ & & \cdot \frac{1}{\sqrt{2 \pi(1 - \rho^{2})} \sigma_{2}} \exp \left\{- \frac{\left[y -(\mu_{2} + \rho \frac{\sigma_{2}}{\sigma_{1}}(x - \mu_{1})) \right]^{2}}{2 \sigma_{2}^{2}(1 - \rho^{2})} \right\} \\ & =: & \phi(x) \psi(x, y).\end{array}
$$

则

$$
\begin{array}{rcl} \operatorname{Cov}(\xi, \eta) & = & \int_{\mathbb{R}^{2}}(x - \mu_{1})(y - \mu_{2}) \phi(x) \psi(x, y) dxdy \\ & = & \int_{\mathbb{R}}(x - \mu_{1}) \phi(x) dx \int_{\mathbb{R}}(y - \mu_{2}) \psi(x, y) dy \\ & = & \int_{\mathbb{R}}(x - \mu_{1}) \left(\rho \frac{\sigma_{2}}{\sigma_{1}}(x - \mu_{1})\right) \phi(x) dx \\ & = & \rho \sigma_{1} \sigma_{2}.\end{array}
$$

协方差和相关系数的意义是什么呢? 注意与方差不同, 相关系数是可正可负的. 我们来大概想象一下, 设ξ代表语文成绩, η代表数学成绩. 如果它们的相关系数是正的, 那么就是说 $\xi - E[\xi] \overset{}{} \eta - E[\eta]$ 同号的情况比较多, 也就是说, 对于个人来说, 其语文与数学同时高于平均分或同时低于平均分的情况比较多, 所以是正向关联的, 因此叫做正相关;反之, 如果它们的相关系数是负的, 就表明 $\xi - E[\xi] \overset{}{\Finv} \eta - E[\eta]$ 异号的情况比较多, 因此叫做负相关. 正相关说明语文和数学或者都好或者都差的情况比较多, 负相关说明数学好语文就差, 或者语文好数学就差的同学比较多. 所以说相关系数是衡量偏科情况的一个指标, 不是吗?

你能大约估计出吗, 你们班不同功课的成绩是正相关还是负相关呢? 你自己呢?

我们有下面的结果:

命题 5.10.4. 设 $\xi_{1}, \cdots, \xi_{n}$ 为随机变量. 那么

$$
D \left[\sum_{i = 1}^{n} \xi_{i} \right] = \sum_{i = 1}^{n} D[\xi_{i}] + 2 \sum_{1 \leqslant i < j \leqslant n} Cov(\xi_{i}, \xi_{j}).
$$

特别地, 若 $i \neq j$ 时 $\cdot \xi_{i}$ 与 $\xi_{j} \pi$ 相关, 则

$$
D \left[\sum_{i = 1}^{n} \xi_{i} \right] = \sum_{i = 1}^{n} D[\xi_{i}].
$$

证明是直接展开了计算.

例6. 设 $\xi \sim B(n, p)$ , 求 $D[\xi]$

这个是可以直接计算的(你试试看). 但我们注意到

$$
\xi = \xi_{1} + \dots + \xi_{n},
$$

其中 $\xi_{i} \sim B(p)$ 且相互独立. 因为 $E[\xi_{i}] = p, E[\xi_{i} \xi_{j}] = p^{2}$ , 因此 $\xi_{i}$ 与 $\xi_{j}$ 是不相关的, $\forall i \neq j$ . 因此

$$
D[\xi] = \sum_{i = 1}^{n} D[\xi_{i}] = npq.
$$

上述命题的一个直接推论是:

推论 5.10.5. 设 $\left(\xi_{1}, \cdots, \xi_{n} \right)$ 是n维随机变量, 且 $\.\xi_{i}$ 与 $\xi_{j}$ 不相关, $\forall i \neq j$ . 则

$$
D \left[\frac{1}{n} \sum_{i = 1}^{n} \xi_{i} \right] = \frac{1}{n^{2}} \sum_{i = 1}^{n} D[\xi_{i}].
$$

我们可以把这个结果尝试地用到投资理财. 假设有 $\setminus n.$ 种股票, $\xi_{1}, \cdots, \xi_{n},$ 其预期收益都一样, 即

$$
E[\xi_{i}] = a, \forall i = 1, \dots, n.
$$

其波动也一样, 即

$$
D[\xi_{i}] = \sigma^{2}, \forall i = 1, \dots, n.
$$

再假设这些股票是互不相关的(例如, $\xi_{1}$ 是地 $\vec{\cal P}$ , $\xi_{2}$ 是医疗 $, \cdots)$ . 如果你把资金平均分散到这 $\cdot n$ 种股票上, 则预期收益是不变的, 即

$$
E \left[\frac{1}{n} \sum_{i = 1}^{n} \xi_{i} \right] = a,
$$

而波动为

$$
D \left[\frac{1}{n} \sum_{i = 1}^{n} \xi_{i} \right] = \frac{\sigma^{2}}{n},
$$

降低为原来的 ${\frac{1}{n}}.$ 所以对厌恶风险的人来说, 他会选择把资金分散到各个行业进行投资, 叫做不把鸡蛋放在一个篮子里.

类似地, 还可以应用到测量的误差. 多次测量的算数平均的期望不变, 方差降低为原来的 $\frac{1}{n}$ , 以此来减小误差.

## 习题

1. 证明: 若 $D[\xi] = 0$ , 则 $\xi = E[\xi] \ \mathrm{a.s.}$

2. 证明：当 $D[\xi]$ 与 $D[\eta]$ 均存在时, $| \rho | = 1$ 的充要条件是存在常数 $[a, b$ 使得 $P(\eta = a \xi + b) = 1$

3. 设 $\xi, \eta$ 为随机变量, $\begin{array}{r}{E[\xi] = E[\eta] = 0, D[\xi] = D[\eta] = 1,} \end{array}$ , ξ与η的相关系数为 $\mid \rho.$ . 证明:

$$
E[\max(\xi^{2}, \eta^{2})] \leqslant 1 + \sqrt{1 - \rho^{2}}.
$$

4. 设 $\xi, \eta$ 为随机变量, $\xi \cdot$ 与η的相关系数为 $| \rho . $ 证明: $\forall \varepsilon > 0$

$$
P(\{| \xi - E[\xi] | \geqslant \varepsilon \sqrt{D[\xi]}\} \bigcup \{| \eta - E[\eta] | \geqslant \varepsilon \sqrt{D[\eta]}\}) \leqslant \frac{1}{\varepsilon^{2}}(1 + \sqrt{1 - \rho^{2}}).
$$

5. 设 $\cdot \xi$ 是取值 $\mp[0, 1]$ 的随机变量. ξ的方差可能取得的最大值是多少? 什么情况下能达到这个值?

6. 设ξ是随机变量, $a, b$ 是常数, 且 $P(\xi \in[a, b]) = 1$ 令 $m = E[\xi], \sigma^{2} = D[\xi]$ . 证明:$\sigma^{2} \leqslant(m - a)(b - m)$ , 且等式成立的充要条件是 $P(\xi = a) + P(\xi = b) = 1$

7. 在上题中, 设 $0 < a < b$ . 证明:

$$
E[\xi] \cdot E[\xi^{- 1}] \leqslant \frac{(a + b)^{2}}{4ab}.
$$

8. 分别构造离散型分布与连续型分布, 使得

(a) 期望不存在;

(b) 期望存在, 但r阶矩不存在, $r > 1$

9. 设 $\boldsymbol{\xi} =(\xi_{1}, \cdots, \xi_{d})$ . 定义ξ的协方差矩阵为

$$
\operatorname{Cov}(\xi) := \left(\operatorname{Cov} \left(\xi_{i}, \xi_{j}\right)\right)_{1 \leqslant i, j \leqslant d}.
$$

证明 $\operatorname{Cov}(\xi)$ 为非负定矩阵.

## 5.11 几个等式与不等式

除了几个极少数的典型例子外, 一般来说具体算出期望是不可能的. 这时, 估计其值就是退而求其次的选择了. 因此, 不管理论上还是应用上, 我们都需要了解并娴熟地掌握估计期望值的基本工具.

下面是我们要建立的第一个等式. 它的意义在于, 直观上|ξ|比较小时, $E[| \boldsymbol{\xi} |^{p}]$ 应该会比较小. 而什么叫|ξ|比较小呢? 似乎应该是当 $x$ 比较大时, $P(| \boldsymbol{\xi} | \geqslant x)$ 比较小. 因此, 如果直接用

$$
E[| \xi |^{p}] = \int_{- \infty}^{\infty} | x |^{p} dF(x)
$$

难以直接估计 $\textdegree -$ 阶矩的话(这个确实比较难, 因为不可能通过估计 $F(x)$ 即 $P(\xi \leqslant x)$ 来估计它),那么可以尝试通过估计尾概率 $P(| \boldsymbol{\xi} | \geqslant x)$ 来估计它. 之所以这是可能的, 是因为有下面的

命题 5.11.1. 设ξ是非负随机变量, $p \geqslant 1$ . 则

$$
E[\xi^{p}] = p \int_{0}^{\infty} r^{p - 1} P(\xi \geqslant r) dr.
$$

证明. 令

$$
\begin{array}{l} D := \{(x, r): 0 \leqslant r \leqslant x\}, \\ f(x, r) := | r |^{p - 1} 1_{D}(x, r).\end{array}
$$

则由Fubini定理,

$$
E \int_{0}^{\infty} r^{p - 1} 1_{D}(\xi, r) dr = \int_{0}^{\infty} r^{p - 1} E[1_{D}(\xi, r)] dr.
$$

即

$$
E \int_{0}^{\infty} r^{p - 1} 1(r \leqslant \xi) dr = \int_{0}^{\infty} r^{p - 1} E[1(r \leqslant \xi)] dr,
$$

即

$$
E \int_{0}^{\xi} r^{p - 1} dr = \int_{0}^{\infty} r^{p - 1} P(\xi \geqslant r) dr.
$$

因此

$$
E[\xi^{p}] = pE \int_{0}^{\xi} r^{p - 1} dr = p \int_{0}^{\infty} r^{p - 1} P(\xi \geqslant r) dr.
$$

$P(| \boldsymbol{\xi} | \geqslant x)$ 称为ξ的尾概率, 而估计尾概率常用的工具是前面证明了的Chebyshev不等式.也即我们有

$$
P(| \xi | \geqslant r) \leqslant \frac{E[f(| \xi |)]}{f(r)},
$$

其中 $f{\mathrm{:}}$ 是R 上的正的单调上升函数. 由此得到

$$
E[| \xi |^{p}] \leqslant pE[f(| \xi |)] \int_{0}^{\infty} r^{p - 1} f^{- 1}(r) dr.
$$

为得到更多的不等式, 我们需要凸函数的概念.

定义 5.11.2. 设I是区间, $\varphi : I \mapsto$ R为连续函数, 且

$$
\varphi(\alpha x + \beta y) \leqslant \alpha \varphi(x) + \beta \varphi(y), \forall x, y \in I, \alpha, \beta \geqslant 0, \alpha + \beta = 1,
$$

则称 $\varphi$ 为凸函数.

从定义看出, 凸函数的直观意思是∀x, $y \in I$ , 曲线 $\varphi$ 在[x, y]上的这一段, 在过 $(x, \varphi(x))$ 和$(y, \varphi(y))$ 两点的直线的下方. 即 $\forall x, y \in I$

$$
\varphi(z) \leqslant \frac{\varphi(y) - \varphi(x)}{y - x}(z - x) + \varphi(x), \forall z \in[x, y].
$$

利用归纳法不难证明,若 $\dot{\varphi}$ 为 $\ntrianglerighteq$ 函数,则 $\begin{array}{r}{\forall n, \forall x_{i} \in I, \lambda_{i} \in(0, 1), i = 1, 2, \cdots, n, \sum_{i = 1}^{n} \lambda_{i} =} \end{array}$ 1, 有

$$
\varphi \left(\sum_{i = 1}^{n} \lambda_{i} x_{i}\right) \leqslant \sum_{i = 1}^{n} \lambda_{i} \varphi(x_{i}).
$$

这个不等式引起的自然猜测是, 既然它对任意凸组合都成立, 而期望也是一种凸组合(的极限), 所以它对期望也应该成立. 事实也的确如此, 这就是所谓的 $\mathrm{Jensen}^{8}$ 不等式, 并且它也的确可以按照 $\ntrianglerighteq$ 组合取极限这样的思路证明. 不过, 这个逼近过程太麻烦, 我们可以通过考察凸函数的性质找到一个简洁的证明.

由定义不难推得, 若x, $y, z \in I, x < y < z$ , 则

$$
{\frac{\varphi(x) - \varphi(y)}{x - y}} \leqslant{\frac{\varphi(x) - \varphi(z)}{x - z}} \leqslant{\frac{\varphi(y) - \varphi(z)}{y - z}}.
$$

因此对任意 $x \in I, \varphi_{-}^{\prime}(x) \varphi_{+}^{\prime}(x)$ 都存在(当x是I的端点时, 只有一种单边导数, 当然), 单调上升, 左导数左连续, 右导数右连续, 且对 $x < y$

$$
\varphi_{-}^{\prime}(x) \leqslant \varphi_{+}^{\prime}(x) \leqslant \frac{\varphi(y) - \varphi(x)}{y - x} \leqslant \varphi_{-}^{\prime}(y) \leqslant \varphi_{+}^{\prime}(y).\tag{11.11}
$$

反之我们有:

命题 5.11.3. 若 $\varphi$ 是定义在I上的连续函数, $\varphi$ 处处右可导且 $\varphi_{+}^{\prime}$ 单调上升, 则 $\varphi$ 为凸函数.

为证明这个结果,我们需要下面的:

引理 5.11.4. 若 $\varphi$ 是定义在I上的连续函数, $\varphi_{+}^{\prime}(x) \geqslant 0, \forall x \in I$ , 则 $\varphi$ 单调上升.

证明. 首先证明若 $\varphi_{+}^{\prime}(x) > 0, \forall x$ , 则 $\varphi$ 单调上升.

事实上, 设存在 $x_{1} < x_{2}$ 使得 $\varphi(x_{1}) > \varphi(x_{2})$ . 令 $x_{3}$ 是 $\varphi$ 在 $[x_{1}, x_{2}]$ 上的极大值点, 则 $x_{3} < x_{2}$ 于是显然有 $\varphi_{+}^{\prime}(x_{3}) \leqslant 0;$ 矛盾.

一般地,对 $\delta > 0,$ 令

$$
\psi(x) := \varphi(x) + \delta x.
$$

则 ${\psi}_{+}^{\prime} > 0$ , 因此 $\psi$ 单升. 令δ → 0得到 $\varphi$ 单调上升.

现在我们可以给出命题5.11.3的证明了.

## 5.11 几个等式与不等式

证明. 设 $x_{1}, x_{2} \in I$ 且 $x_{1} < x_{2}$ $\begin{array}{r}{\mathfrak{H} \psi(x) : = \varphi(x) + ax + b.} \end{array}$ , 其中 $^{\mathnormal{\Gamma}} a,$ b为满足 $\psi(x_{1}) = \psi(x_{2}) = 0$ 的常数. 则只需证

$$
\psi(x) \leqslant 0, \forall x \in[x_{1}, x_{2}].
$$

设存在 $x_{0} ~ \in ~ \left(x_{1}, x_{2} \right)$ 使得 $\psi(x_{0}) \ = \ \operatorname{max}_{x_{1} < x < x_{2}} \psi(x) \ > \0$ . 此时一定存在 $\mathbf{\dot{\boldsymbol{x}}}_{3} ~ \in ~ \left[\boldsymbol{x}_{1}, \boldsymbol{x}_{0} \right)$ 使得 $\psi(x_{3}) = 0$ 且

$$
\psi(x) > 0, \forall x \in(x_{3}, x_{0}].
$$

于是 $\begin{array}{r} \left.{\mathcal{V}_{+}^{\prime}(x_{3}) \right.\geqslant 0.} \end{array}$ . 由于 $\varphi_{+}^{\prime}$ 单升, 故 $\mathrm{~ \AE ~}[x_{3}, x_{2}) \mathrm{~ \rvert ~} \mathrm{.~} \psi_{+}^{\prime} \geqslant 0$ , 因此由刚刚证明的引理, $\psi$ 在 $[x_{3}, x_{2})$ 上单升, 又由于 $\psi(\underline{{\mathcal{k}}})$ 连续, 因此 $\psi(x_{2}) > 0$ . 这与 $\psi(x_{2}) = 0;$ 矛盾. □

由命题5.11.3, 下面的函数均为凸函数：

$$
x^{+}, | x |^{p}(p \geqslant 1), e^{cx}(c > 0), - \ln(x)(x > 0),
$$

等等.

我们都知道下面两个著名的结果. 第一个是几何平均小于算术平均, 即

$$
\sqrt{st} \leqslant \frac{s + t}{2}, \forall s, t \geqslant 0;
$$

第二个是第一个的一个推论, 即

$$
(s + t)^{2} \leqslant 2(s^{2} + t^{2}).
$$

我们可以利用凸函数推广这两个不等式, 得到:

命题 5.11.5. 设 $s, t \geqslant 0, \alpha, \beta$ ⩾ $0 \mathbb{H} \alpha + \beta = 1, p \geqslant 1$ . 则

$$
s^{\alpha} t^{\beta} \leqslant \alpha s + \beta t;\tag{11.12}
$$

$$
(\alpha s + \beta t)^{p} \leqslant \alpha s^{p} + \beta t^{p}.\tag{11.13}
$$

证明. (11.12)、(11.13)分别是由 $\mathbb{F} - \log(t)$ 、t<sup>p</sup>是R $^{\cdot + +}$ 上的 $\ntrianglerighteq$ 函数之故.

现在我们可以叙述前面预报了的Jensen不等式了.

定理 5.11.6 (Jensen不等式). 设 $\varphi$ 为R上的凸 $i \vec{\Sigma}_{I}$ 数. 则

$$
\varphi(E[\xi]) \leqslant E[\varphi(\xi)].
$$

证明. 注意 $\forall u, v \in \mathbb{R}$ , 由(11.11)有

$$
\varphi(u) - \varphi(v) \geqslant \varphi_{+}^{\prime}(v)(u - v).
$$

因此, 取 $u = \xi, v = E[\xi]$ 得

$$
\varphi(\xi) - \varphi(E[\xi]) \geqslant \varphi_{+}^{\prime}(E[\xi])(\xi - E[\xi]).
$$

两边取期望即可.

借助于此引理, 我们可以证明两个重要的不等式. 为此引进记号: 对 $\mathbf{\Delta}_{p}$ ⩾ 1,

$$
\| \xi \|_{p} :=(E[| \xi |^{p}])^{\frac{1}{p}}.
$$

定理 5.11.7. 设ξ, η是随机变量.

(i) $(H \ddot{o} lder^{9},$ 不等式)设 $.1 < p, q < \infty$ 满足 $p^{- 1} + q^{- 1} = 1$ , 则

$$
\| \xi \eta \|_{1} \leqslant \| \xi \|_{p} \| \eta \|_{q};
$$

(ii) (Minkowvski<sup>10</sup>不等式 $\rangle \forall p \geqslant 1$ 2

$$
\| \xi + \eta \|_{p} \leqslant \| \xi \|_{p} + \| \eta \|_{p}.
$$

正如我们早在命题5.2.8就证明了的, H¨older不等式在 $p = q =$ 2的特殊情形又称为Cauchy-Schwarz不等式.

证明. 如果上面不等式右边中有一个为0或 $\infty,$ 则两个不等式都是显然的, 因此我们假定他们都为大于0的实数.

(i) 由(11.12)有

$$
\left| \frac{\xi}{\| \xi \|_{p}} \cdot \frac{\eta}{\| \eta \|_{q}} \right| \leqslant \frac{1}{p} | \xi |^{p} \| \xi \|_{p}^{- p} + \frac{1}{q} | \eta |^{q} \| \eta \|_{q}^{- q},
$$

两边取期望即得

$$
\| \xi \|_{p}^{- 1} \| \eta \|_{q}^{- 1} \| \xi \eta \|_{1} \leqslant \frac{1}{p} + \frac{1}{q} = 1.
$$

(ii) 由(11.13)有

$$
\begin{array}{rcl} | \xi + \eta |^{p} & \leqslant &(| \xi | + | \eta |)^{p} \\ & = & \left| \frac{\| \xi \|_{p}}{\| \xi \|_{p} + \| \eta \|_{p}} \Big(| \xi | \| \xi \|_{p}^{- 1} \Big) + \frac{\| \eta \|_{p}}{\| \xi \|_{p} + \| \eta \|_{p}} \Big(| \eta | \| \eta \|_{p}^{- 1} \Big) \right|^{p}(\| \xi \|_{p} + \| \eta \|_{p})^{p} \\ & \leqslant &(\| \xi \|_{p} + \| \eta \|_{p})^{p} \left(\frac{\| \xi \|_{p}}{\| \xi \|_{p} + \| \eta \|_{p}} \Big(| \xi | \| \xi \|_{p}^{- 1} \Big)^{p} + \frac{\| \eta \|_{p}}{\| \xi \|_{p} + \| \eta \|_{p}} \Big(| \eta | \| \eta \|_{p}^{- 1} \Big)^{p}\right), \end{array}
$$

两边取期望即得

$$
\| \xi + \eta \|_{p}^{p} \leqslant(\| \xi \|_{p} + \| \eta \|_{p})^{p},
$$

再两边开 $\dot{\mathbf{\rho}}_{p}$ 次方即可.

## 习题

1. 设 $\xi, \eta;$ 是非负随机变量, f是R上的非负连续函数. 令

$$
F(x) := \int_{0}^{x} f(y) dy.
$$

证明

$$
\int_{0}^{\infty} E[\xi f(x) 1_{\eta \geqslant x}] dx = E[\xi F(\eta)].
$$

## 5.11 几个等式与不等式

2. 设ξ, η是非负随机变量, $\boxdot{\mathrm{H}} \boxed{\lambda} > 0$ 有

$$
P(\xi \geqslant \lambda) \leqslant \frac{1}{\lambda} E[\eta 1_{\xi \geqslant \lambda}].
$$

证明

$$
E[\xi^{p}] \leqslant q^{p} E[\eta^{p}], \forall p > 1,
$$

其中 $\textstyle{^{\mathtt{I}} q : ={\frac{p}{p - 1}}}$

3. 设ξ $\sim N(0, 1)$ . 用Chebyshev不等式证明: 对任意 $a >$ 0有

$$
P(| \xi | > a) \leqslant 2e^{- \frac{a^{2}}{2}}.
$$

4. 证明:

$$
1 \leqslant p < q \Longrightarrow \| \xi \|_{p} \leqslant \| \xi \|_{q}.
$$

5. 设ξ是取值于 $\{x_{1}, \cdots, x_{n}\}$ 的离散型随机变量. 证明:

$$
\lim_{p \rightarrow \infty} \left(E[| \xi |^{p}]\right)^{1 / p} = \max \{| x_{1} |, \dots, | x_{n} |\}.
$$

6. 设ξ是对称随机变量. 证明: $E[e^{\xi}] \geqslant 1$ . 所谓ξ是对称随机变量是指

$$
P(\xi \in A) = P(\xi \in - A), \forall A \in \mathscr{B},
$$

其中− $\cdot A : = \{- x : x \in A\}$

7. 设 $\varphi : \mathbb{R}_{+}[0, 1]$ 为增函数. 证明: $\forall x \geqslant 0.$ 7

$$
E[\varphi(| \xi |)] - \varphi(x) \leqslant P(| \xi | \geqslant x) \leqslant \frac{E[\varphi(| \xi |)]}{\varphi(x)}.
$$

8. 证明: 若存在常数 $\alpha, \beta, \gamma > 0$ 使得

$$
P(| \xi | > r) \leqslant \alpha e^{- \beta r^{\gamma}},
$$

则ξ的任意阶矩存在.

9. 证明: 若存 $\textstyle{\overleftrightarrow{\mathrm{1E}}} \alpha > 1$ 使

$$
\lim_{n \to \infty} \frac{P(| \xi | > \alpha n)}{P(| \xi | > n)} = 0,
$$

则ξ的任意阶矩均存在.

10. 设 $P(\xi > 0) = 1$ . 证明:

$$
E[\xi^{- 1}] \geqslant(E[\xi])^{- 1},
$$

$$
E[\ln \xi] \leqslant \ln E[\xi],
$$

$$
E[\xi \ln \xi] \geqslant E[\xi] E[\ln \xi].
$$

11. 设ξ是随机变量, $r \in \mathbb{R}.$ . 证明: 当 $rE[\xi] < 0 \sharp \Psi, E[\exp \{r \xi\}] < 1$

12. 设 $a_{i} \in \mathbb{R}, i = 1, 2, \cdot \cdot \cdot, n, r \geqslant 1$ . 证明:

$$
\left| \sum_{i = 1}^{n} a_{i} \right|^{r} \leqslant n^{r - 1} \sum_{i = 1}^{n} | a_{i} |^{r}.
$$

13. 证明, 对p ⩾ 1, E[|ξ|<sup>p</sup>] < ∞的充要条件是

$$
\sum_{n = 0}^{\infty} n^{p - 1} P(| \xi | \geqslant n) < \infty.
$$

14. 设 $\cdot p, q \geqslant 1, p^{- 1} + q^{- 1} = 1$ , ξ是非负随机变量, $\| \xi \|_{p} \leqslant \infty$

(a) 证明: 对 $a \in(0, 1)$ ,

$$
(1 - a) E[\xi] \leqslant E[\xi 1_{[aE[\xi], \infty});
$$

(b) 证明:

$$
P(\xi \geqslant aE[\xi]) \geqslant(1 - a)^{q} \frac{E[\xi]^{q}}{\| \xi \|_{p}^{q}}.
$$

## 5.12 条件期望

设

$$
\mathcal{P} = \{A_{1}, A_{2}, \dots\}
$$

为Ω的一个分割. 任给 $A \in{\mathcal{F}}$ , 有

$$
P(A | \mathcal{P})(\omega) = \sum_{n = 1}^{\infty} P(A | A_{n}) 1_{A_{n}}(\omega).
$$

由于对任意固定的 $\omega, P(\cdot | \mathcal{P})(\omega)$ 是一个概率, 所以可以定义关于这个概率的期望. 具体地说,设ξ为随机变量, 定义

$$
E[\xi | \mathcal{P}](\omega) =: E[\xi(\omega^{\prime}) | \mathcal{P}](\omega) =: \int_{\Omega} \xi(\omega^{\prime}) P(d \omega^{\prime} | \mathcal{P})(\omega).
$$

当ω固定后, 它拥有普通期望的一切性质; 而当ξ固定后, 它是一个随机变量. 我们有:

命题 5.12.1.

$$
E[\xi] = E[E[\xi | \mathcal{P}]].
$$

证明. 任给 $A \in{\mathcal{F}}$ , 有

$$
E[1_{A} | \mathcal{P}](\omega) = \sum_{n = 1}^{\infty} P(A | A_{n}) 1_{A_{n}}(\omega).
$$

两边取期望得

$$
\begin{array}{rcl} E[E[1_{A} | \mathcal{P}]] & = & \sum_{n = 1}^{\infty} P(A | A_{n}) P(A_{n}) = \sum_{n = 1}^{\infty} P(AA_{n}) \\ & = & P(A) = E[1_{A}].\end{array}
$$

因此当 $\xi = 1_{A}$ 时, 结论成立.

## 5.12 条件期望

其次, 当ξ是简单随机变量, 即ξ具有形式 $\begin{array}{r}{\xi = \sum_{k = 1}^{m} c_{k} \boldsymbol{1}_{A_{k}}} \end{array}$ , 其中 $c_{k}$ 是常数, $A_{k} \in{\mathcal{F}}$ 时, 由期望的线性性, 结论成立.

再次, 当ξ为非负随机变量时, 存在一列取有限值的简单随机变量 $\xi_{m} \uparrow \xi,$ 因此由单调收敛定理, 结论依然成立.

最后, 对一般的ξ, 利用分解 $\xi = \xi^{+} - \xi^{-}$ 及期望的线性性, 结论照样成立. □

为叙述下一个结果, 我们需要先引进两个概念.

定义 5.12.2. 设 $\mathcal{P} = \{A_{i}, i = 1, 2, \cdot \cdot \cdot\}$ 为一个分割, $\xi$ 为随机变量.

(i) 若

$$
\xi = \sum_{i} c_{i} 1_{A_{i}},
$$

其中 $c_{i}$ 们为常数, 则称ξ为 ${\mathcal P}.$ -可测;

(ii) 若

$$
P(\{\xi \in B\} \cap A_{i}) = P(\xi \in B) P(A_{i}) \forall B \in \mathcal{B}, i,
$$

则称ξ与 $\mathcal{P}$ 独立.

然后我们有:

命题 5.12.3. 设ξ, η为随机变量, η为 $\mathcal{P}_{-} \overline{{\mathbf{J}}}$ 测. 则对 $\mathbb{R}^{2}$ 上的任意非负Borel函数f有

$$
E[f(\xi, \eta) | \mathcal{P}] = E[f(\xi, x) | \mathcal{P}] |_{x = \eta}.
$$

特别地, 若还有ξ与 $\mathcal{P}$ 独立, 则

$$
E[f(\xi, \eta) | \mathscr{P}] = E[f(\xi, x)] |_{x = \eta}.
$$

证明. 令

$$
\mathscr{G} := \{A \in \mathscr{B}^{2}: E[1_{A}(\xi, \eta) | \mathscr{P}] = E[1_{A}(\xi, x) | \mathscr{P}] |_{x = \eta}\}.
$$

则

$$
\mathcal{C} \subset \mathcal{G},
$$

其中

$$
\mathscr{C} := \{(a, b] \times(c, d]: a < b, c < d\}.
$$

显然C为π-类, 又易证G为λ-类. 因此由π −λ定理,

$$
\mathcal{G} \supset \sigma(\mathcal{C}) = \mathcal{B}^{2}.
$$

所以对任意 $A \in \mathcal{B}^{2}$ 有

$$
E[1_{A}(\xi, \eta) | \mathcal{P}] = E[1_{A}(\xi, x)] |_{x = \eta}.
$$

由此易见(利用期望的线性性), 对R<sup>2</sup>上的任意简单Borel函数 $f,$ 都有

$$
E[f(\xi, \eta) | \mathcal{P}] = E[f(\xi, x) | \mathcal{P}] |_{x = \eta}.
$$

现设f $\u : \in \mathcal{B}^{2}$ 为任一非负Borel函数. 由命题4.1.13, 存在一列简单 $f_{n} \in \mathcal{B}^{2}$ 使得 $f_{n}(x, y)$ ↑$f(x, y), \forall x, y \in \mathbb{R}^{2}$ . 因此单调收敛定理

$$
\begin{array}{rcl} E[f(\xi, \eta) | \mathcal{P}] & = & \lim_{n \to \infty} E[f_{n}(\xi, \eta) | \mathcal{P}] \\ & = & \lim_{n \to \infty} E[f_{n}(\xi, x) | \mathcal{P}] |_{x = \eta} \\ & = & E[f(\xi, x) | \mathcal{P}] |_{x = \eta} \end{array}
$$

如果 $\xi.$ 与 $\mathcal{P}$ 独立, 则

$$
E[f(\xi, x) | \mathcal{P}] = E[f(\xi, x)].
$$

因此第二个结论成立.

## 习题

1. 设 $\mathcal{P}_{1}, \mathcal{P}_{2}$ 是两个分割, 且 $\mathcal{P}_{1}$ 是 $\mathcal{P}_{2}$ 的加细. 证明:

$$
E[E[\xi | \mathcal{P}_{1}] | \mathcal{P}_{2}] = E[E[\xi | \mathcal{P}_{2}] | \mathcal{P}_{1}] = E[\xi | \mathcal{P}_{2}].
$$

2. 设 $\mathcal{P}$ 为分割, ξ为随机变量, $\eta.$ 为离散型随机变量, 且 $\eta \mathrm{.}$ 为P-可测(即 $\eta^{j}$ 在P的任何一个元素上均为常数). 证明: 对任意有界Borel可测函数f, 有

$$
E[f(\xi, \eta) | \mathcal{P}] = E[f(\xi, x) | \mathcal{P}] |_{x = \eta}.
$$

3. 一个人乘飞机出行. 设当天天晴的概率为 $^{Ip,}$ , 下雨的概率为q, $p + q = 1$ . 在天晴的情况下,飞机晚点的时间服从参数为α的指数分布; 在下雨的情况 $\sf{F}$ , 晚点的时间服从参数为β的指数分布. 求飞机晚点的平均时间.

4. 一个养殖户养了 $n_{1}$ 只鸡, $n_{2}$ 只鸭, $n_{3}$ 只鹅, 期望年末时每只鸡卖 $y_{1} \mathcal{\vec{x}}$ , 每只鸭卖 $y_{2}{\widehat{\pi}}$ , 每只鹅卖 $y_{3}{\widehat{\mathcal{T}}}$ . 正常年份时, 每只家禽病死的概率分别为 $p_{1}, p_{2}, p_{3};$ 但如果有瘟疫, 相应的概率会增加到 $[q_{1}, q_{2}, q_{3}$ . 设有瘟疫发生的可能性为 $\jmath p$ . 问

(a) 他的期望收益是多少?

(b) 如果有个保险公司向他推销保险, 每只家禽保费分别为 $r_{1}, r_{2}, r_{3}$ , 死亡赔偿分别为 $s_{1}, s_{2}, s_{3}$ . 你是否建议他买保险?
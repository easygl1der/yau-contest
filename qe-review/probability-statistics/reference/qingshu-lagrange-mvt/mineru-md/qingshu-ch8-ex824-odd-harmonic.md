证明 利用二元函数的 Taylor 中值定理,积分中值定理和二重积分定义有

$$
\begin{array}{rl} &{\operatorname{lim}_{t \infty}[\frac{1}{\kappa} \frac{\hat{\kappa}}{2} \frac{\hat{\kappa}}{\kappa - \kappa}(\frac{\hat{\kappa}^{2}}{\omega^{2}}, \frac{\hat{\kappa}}{\omega^{2}})] \int_{t}^{t} \hat{\mathcal{F}}^{(1, \infty, y), \pm ddy} \Bigg]} \\ &{= - \frac{2 \ln \omega}{\omega}[\frac{\kappa}{2} \frac{\hat{\kappa}}{\omega^{2}} \frac{\hat{\kappa}}{\omega^{2}} \int_{t}^{t} \int \int_{\omega}^{t} \int \Bigg(\frac{\hat{\kappa}^{2}}{\omega^{2}} \Bigg) d \omega \omega \Bigg] \frac{\hat{\kappa}}{\omega^{2}} \frac{\hat{\kappa}}{\omega^{2}} \int_{t}^{t} \int \int_{\omega}^{\frac{\hat{\kappa}}{\omega^{2}}} \hat{\kappa} \Bigg \langle \hat{\kappa} \cdot \hat{\kappa} \Bigg \vert \omega \times \hat{\kappa} \Bigg \vert} \\ &{= \frac{2 \ln \omega}{\omega}[\frac{\kappa}{2} \frac{\hat{\kappa}}{\omega^{2}} \int_{t}^{t} \int_{\omega}^{\frac{\hat{\kappa}}{\omega^{2}}} \Bigg(\hat{\kappa}(\frac{\hat{\kappa}}{\omega^{2}} \frac{\hat{\kappa}}{\omega^{2}}, \frac{\hat{\kappa}}{\omega^{2}})) dy \Bigg]} \\ & = - \frac{1}{\log \omega}[\frac{1}{\kappa} \Bigg[\frac{\hat{\kappa}}{2} \frac{\hat{\kappa}}{\omega^{2}} \int_{t}^{t} \int_{\omega}^\frac \hat \end{array}
$$

## 8.6渐近分析方法

## 8.6.1 迭代方法,

例题8.18Lampert W的 $n \to \infty$ 设 $x_{n} > 0$ 满足 $x_{n} e^{x_{n}} = n, n = 1, 2, \cdot \cdot \cdot$ ，证明

$$
x_{n} = \ln n - \ln \ln n +{\frac{\ln \ln n}{\ln n}} + o \left({\frac{\ln \ln n}{\ln n}} \right), n \to \infty.
$$

证明注意到

$$
1 \leqslant x_{n} = \ln n - \ln x_{n} \leqslant \ln n \Rightarrow x_{n} = O \left(\ln n \right), n = 3, 4, \cdot \cdot \cdot
$$

于是

$$
{\begin{array}{rl} &{\ln x_{n} = \ln \ln n + \ln \left(1 -{\frac{\ln x_{n}}{\ln n}} \right) = \ln \ln n -{\frac{\ln x_{n}}{\ln n}} + o \left({\frac{\ln x_{n}}{\ln n}} \right) = \ln \ln n -{\frac{\ln Q \left(\ln n \right)}{\ln n}} + o \left({\frac{\ln Q \left(\ln n \right)}{\ln n}} \right)} \\ &{\qquad = \ln \ln n -{\frac{\ln \ln n + \ln Q \left(1 \right)}{\ln n}} + o \left({\frac{\ln \ln n + \ln Q \left(1 \right)}{\ln n}} \right)} \\ &{\qquad = \ln \ln n -{\frac{\ln \ln n}{\ln n}} + o \left({\frac{\ln \ln n}{\ln n}} \right),} \end{array}}
$$

即

$$
x_{n} = \ln n - \ln \ln n +{\frac{\ln \ln n}{\ln n}} + o \left({\frac{\ln \ln n}{\ln n}} \right).
$$

## 定义8.2(LempertW函数）

因为 $xe^{x} \not \equiv[- 1, + \infty) \not{p}^{\pm}$ 格递增,且值域为 $[- \frac{1}{e}, + \infty)$ .由于 $\left(xe^{x} \right)^{\prime} \neq 0, \forall x \in \left(- 1, + \infty \right)$ ，由反函数定理12.8,我们确定了 $W_{0} \in C^{\infty} \left(- 1, + \infty \right)$ 是 $xe^{x}$ 反函数．又由导数极限定理11.2容易证明 $W_{0} \in C^{\infty} \left[- 1, + \infty \right)$ .由

于 $xe^{x}$ 实解析,故 $W_{0}$ Wo 也实解析.且在 $x = 0$ 附近有

$$
W_{0} \left(x \right) \overset{\scriptscriptstyle{4 \div 4 \notin \beta \notin \mathbb{R}}}{=} \frac{\beta}{\alpha} \underset{n = 1}{\overset{\scriptscriptstyle{\infty}}{\operatorname{\operatorname{\operatorname*{\operatorname*{\operatorname*{\operatorname*{\operatorname{\operatorname*}{\operatorname{\operatorname*}{\operatorname \operatorname*{\operatorname{\operatorname*}{\operatorname*}{\operatorname \operatorname*{\operatorname{\operatorname*}{\operatorname \operatorname{\operatorname*}{\operatorname*}}}}}}}}}}}}}}} \left[\frac{\zeta}{\left(\zeta e \zeta \right)^{n}} \right]^{\left(n - 1 \right)} \big \rvert_{\zeta = 0} x^{n} = \sum_{n = 1}^{\infty} \frac{\left(- n \right)^{n - 1}}{n !} x^{n}.\tag{8.52}
$$

注因为(8.52)两边都定义的实解析函数且在 $x = 0$ 附近恒等，由实解析函数零点孤立性17.7,我们知道(8.52)左右两端在有意义的情况下是恒等的，而

$$
\varlimsup_{n \to \infty} \sqrt[n]{\frac{n^{n - 1}}{n !}} = \varlimsup_{n \to \infty} \frac{n}{\sqrt[n]{n !}} \stackrel{\zeta_{\sharp}^{\pm} \sharp_{\sharp}^{\pm} \zeta_{\cdot} 2}{\overline{{\diamond}} \overline{{n}} !} e,
$$

我们知道 $\sum_{n = 1}^{\infty}{\frac{(- n)^{n - 1}}{n !}} x^{n}$ 收敛半径为 $\frac{1}{e}$ ，又由8.4,我们知道

$$
\sum_{n = 1}^{\infty} \left|{\frac{\left(- n \right)^{n - 1}}{n !}} \left(\pm{\frac{1}{e}} \right)^{n} \right| = \sum_{n = 1}^{\infty}{\frac{n^{n - 1}}{n !}} \left({\frac{1}{e}} \right)^{n} \sim - \sum_{n = 1}^{\infty}{\frac{1}{n{\sqrt{2 \pi n}}}},
$$

从而我们有(8.52)在 $x \in[- \frac{1}{e}, \frac{1}{e}]$ 恒成立.

## 8.6.2 幂级数方法

核心是利用幂级数系数的阶蕴含和函数的阶，即定理17.1.

例题8.19

1.证明

$$
\sum_{n = 1}^{\infty} \ln n \cdot x^{n} \sim{\frac{\ln{\frac{1}{1 - x}}}{1 - x}}, x1^{-}.\tag{8.53}
$$

2.证明

$$
\sum_{n = 2}^{\infty}{\frac{x^{n}}{\ln n}} \sim{\frac{1}{(1 - x) \ln{\frac{1}{1 - x}}}}, x \to 1^{-}.\tag{8.54}
$$

证明

1．由例题7.5,我们有

$$
\ln n \sim 1 +{\frac{1}{2}} + \cdots +{\frac{1}{n}}, n \to \infty.
$$

现在用 $\frac{\overrightarrow{EF}}{11N}$ 级数系数的阶蕴含和函数的阶17.1得

$$
\sum_{n = 1}^{\infty} \ln n \cdot x^{n} \sim \sum_{n = 1}^{\infty}(1 +{\frac{1}{2}} + \cdot \cdot \cdot +{\frac{1}{n}}) x^{n} = -{\frac{\ln(1 - x)}{1 - x}}, x1^{-},
$$

这就证明了(8.53).

2.不方便直接寻找可以计算出和函数的 $\frac{1}{\ln n}$ 的等价量，于是我们考虑

$$
- \ln \left(1 - x \right) \cdot \sum_{n = 2}^{\infty}{\frac{x^{n}}{\ln n}} = \sum_{n = 3}^{\infty} \left(\sum_{k = 2}^{n - 1}{\frac{1}{\left(n - k \right) \ln k}} \right) x^{n}.
$$

一方面

$$
\sum_{k = 2}^{n - 1} \frac{1}{(n - k) \ln k} \geqslant \sum_{k = 2}^{n - 1} \frac{1}{(n - k) \ln(n - 1)} \overset{\# | \vec{\pi} \vec{\pi} \vec{} \cdot 5}{\approx} \frac{\ln \left(n - 2 \right)}{\ln \left(n - 1 \right)} \sim 1, n \to \infty.
$$

另外一方面,对任何 $\epsilon > 0,$ 我们考虑

$$
\begin{array}{l}{\displaystyle \sum_{k = 2}^{n - 1} \frac{1}{(n - k) \ln k} = \sum_{2 \leqslant k \leqslant n} \frac{1}{(n - k) \ln k} + \sum_{\alpha \leqslant k \leqslant n - 1} \frac{1}{(n - k) \ln k}} \\{\displaystyle \leqslant \frac{1}{(1 - \epsilon) n} \sum_{2 \leqslant k \leqslant \epsilon n} \frac{1}{\ln k} + \sum_{\epsilon = \leqslant k \leqslant n - 1} \frac{1}{(n - k) \ln(\epsilon n)}} \\{\displaystyle \leqslant \frac{1}{(1 - \epsilon) n} \frac{\epsilon n}{\ln 2} + \sum_{0 \leqslant k \leqslant n - 1} \frac{1}{(n - k) \ln(\epsilon n)}} \\{\displaystyle \# \underset{\smile}{\mathbb{R}} \frac{\epsilon}{\overbrace{\mathbf{\pi}}, \bar{\mathbf{\pi}}, \bar{\mathbf{\pi}}} \frac{\epsilon}{1 - \epsilon} \frac{\epsilon}{\ln 2} + \frac{\ln n}{\ln(\epsilon n)} \to \frac{1}{\ln 2} \frac{\epsilon}{1 - \epsilon} + 1, n \to \infty.} \end{array}
$$

于是我们由ε任意性有

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n - 1}{\frac{1}{(n - k) \ln k}} = 1.
$$

从而由幂级数系数的阶蕴含和函数的阶17.1得(8.54).

例题8.20证明:

$$
\operatorname{lim}_{y \to 1^{-}}{\frac{1}{\ln \left(1 - y \right)}} \int_{0}^{1}{\frac{dx}{\sqrt{\left(1 - x^{2} \right) \left(1 - y^{2} x^{2} \right)}}} = -{\frac{1}{2}}.\tag{8.55}
$$

证明利用 ${\scriptstyle{\frac{1}{\sqrt{1 + x}}}} = 1 + \sum_{k = 1}^{\infty}{\frac{(- 1)^{k}(2k - 1) ! !}{2^{k} k !}} x^{k}$ ，我们有

$$
\begin{array}{rl} &{\int_{0}^{1} \frac{dx}{\sqrt{(1 - x^{2})(1 - y^{2} x^{2})}} = \displaystyle \int_{0}^{1} \frac{1 + \frac{\mathrm{S}}{2 \kappa \mathrm{H}^{- 1}} \frac{(2 \kappa - 1) !}{x^{2}} x^{2k} y^{2k} dx}{\sqrt{1 - x^{2}}}} \\ &{\quad = \displaystyle \int_{0}^{1} \frac{1}{\sqrt{1 - x^{2}}} dx + \displaystyle \sum_{k = 1}^{\infty} y^{2k} \int_{0}^{1} \frac{(2k - 1) ! | \cdot | x^{2k} |}{2^{k} k ! \sqrt{1 - x^{2}}} dx} \\ &{\quad = \displaystyle \int_{0}^{1} \frac{1}{\sqrt{1 - x^{2}}} dx + \displaystyle \sum_{k = 1}^{\infty} y^{2k} \int_{0}^{\frac{1}{\kappa}} \frac{(2k - 1) ! |}{(2k) ! |} \sin^{2k} \theta d \theta} \\ &{\quad = \displaystyle \frac{\pi}{2} + \frac{\pi}{2} \sum_{k = 1}^{\infty}(\frac{(2k - 1) ! |}{(2k) ! |})^{2} y^{2k} \star \frac{\pi}{2} + \displaystyle \frac{\pi}{2} \sum_{k = 1}^{\infty} \frac{1}{x^{k}} y^{2k}} \\ &{\quad \sim - \frac{1}{2} \ln(1 - y^{2}) \sim - \frac{1}{2} \ln(1 - y), y1^{- 1},} \end{array}
$$

这里★来自Wallis公式8.18和幂级数系数的阶蕴含和函数的阶17.1.

例题8.21设

$$
a_{0} = 1, a_{1} ={\frac{5}{4}}, a_{n} ={\frac{\left(2n + 3 \right) a_{n - 1} + \left(2n - 3 \right) a_{n - 2}}{4n}}, n = 2, 3, \cdots.
$$

求 $\operatorname{lim}_{n \to \infty} a_{n}$

<!-- image-->

笔记从证明可以看到本题实质上是通过幂级数法求出了 $a_{n}$ 的通项.此外考虑 ${\frac{1}{1 - x}} f \left(x \right)$ 的幂级数并用Cauchy积可以导出 $\sum_{k = 0}^{n} a_{k}$ 的信息.

证明 注意到递推是多项式系数，因此生成级数法一定适用.考虑 $f \left(x \right) = \sum_{n = 0}^{\infty} a_{n} x^{n}$ ，则有

$$
\sum_{n = 2}^{\infty} 4na_{n} x^{n} = \sum_{n = 2}^{\infty} \left[\left(2n + 3 \right) a_{n - 1} + \left(2n - 3 \right) a_{n - 2} \right] x^{n}.
$$

整理得10

$$
\left(2x^{2} + 2x^{3} - 4x \right) f^{\prime} \left(x \right) + \left(5x + x^{2} \right) f \left(x \right) = 0, f \left(0 \right) = 1, f^{\prime} \left(0 \right) = \frac{5}{4}.
$$

解可分离变量微分方程得

$$
f \left(x \right) ={\frac{1}{\sqrt{2}}}{\frac{\sqrt{x + 2}}{1 - x}} ={\frac{1}{\sqrt{2}}} \sum_{n = 0}^{\infty} x^{n} \cdot \sum_{n = 0}^{\infty} b_{n} x^{n} ={\frac{1}{\sqrt{2}}} \sum_{n = 0}^{\infty} \left(\sum_{j = 0}^{n} b_{j} \right) x^{n},
$$

这里用到了幂级数的Cauchy积17.1以及11

$$
{\sqrt{x + 2}} = \sum_{n = 0}^{\infty} b_{n} x^{n} \Rightarrow{\sqrt{3}} = \sum_{n = 0}^{\infty} b_{n}.
$$

于是

$$
\operatorname{lim}_{n \infty} a_{n} = \operatorname{lim}_{n \infty}{\frac{1}{\sqrt{2}}} \sum_{n = 0}^{\infty} b_{n} ={\sqrt{\frac{3}{2}}}.
$$

现在我们关心我们很难求出f的幂级数的系数情况.

例题8.22设 $\begin{array}{r}{a_{1} = 0, a_{2} = 1, a_{n + 2} = a_{n + 1} + \frac{a_{n}}{2n}, n = 1, 2, \cdot \cdot \cdot} \end{array}$ ，证明 $\operatorname{lim}_{n \to \infty}{\frac{a_{n}}{\sqrt{n}}} ={\frac{2}{\sqrt{\pi e}}}$ 注 本过程缺乏 $\operatorname{lim}_{n \to \infty}{\frac{a_{n}}{\sqrt{n}}}$ 存在性.

证明 事实上考虑 $f \left(x \right) = \sum_{n = 1}^{\infty} a_{n} x^{n}$ ，则

$$
\sum_{n = 1}^{\infty} a_{n + 2} x^{n} = \sum_{n = 1}^{\infty} a_{n + 1} x^{n} + \sum_{n = 1}^{\infty}{\frac{a_{n}}{2n}} x^{n},
$$

从而

$$
{\frac{f \left(x \right)}{x^{2}}} - 1 ={\frac{f \left(x \right)}{x}} +{\frac{1}{2}} \int_{0}^{x}{\frac{f \left(y \right)}{y}} dy.
$$

即转化为微分方程

$$
\left(2x^{2} - 2x \right) f^{\prime} \left(x \right) = \left(- x^{2} + 2x - 4 \right) f \left(x \right), f^{\prime \prime} \left(0 \right) = 2.
$$

解得

$$
f \left(x \right) = \frac{x^{2} e^{- \frac{x}{2}}}{\left(1 - x \right)^{\frac{3}{2}}}.
$$

我们知道

$$
\operatorname{lim}_{x1^{-}}(1 - x)^{\frac{3}{2}} f(x) = \operatorname{lim}_{x1^{-}} x^{2} e^{- \frac{x}{2}} = e^{- \frac{1}{2}},(1 - x)^{- \frac{3}{2}} = 1 + \sum_{n = 1}^{\infty} \frac{(2n + 1) ! !}{(2n) ! !} x^{n}.
$$

运用幂级数系数的阶蕴含和函数的阶17.1和Wallis公式8.18,我们知道

$$
\frac{\left(2n + 1 \right) ! !}{\left(2n \right) ! !} \sim \frac{2n + 1}{\sqrt{\pi n}} \sim \frac{2}{\sqrt{\pi}} \sqrt{n}, f \left(x \right) \sim e^{- \frac{1}{2}} \left(1 - x \right)^{- \frac{3}{2}}, a_{n} \sim \frac{2}{\sqrt{\pi e}} \sqrt{n}.
$$

那么如何严格说明这件事情呢？实际上这并非总是可以做到的，本题就只能继续硬着头皮展开f而得到 $a_{n}$ 通项来严格证明.不管如何这也是一个猜答案的绝佳方法.

我们来看一个绝对严格的例子.

例题8.23\*设 $a_{1} = 1$ ，对于 $n > 1$ ,有递推

$$
a_{n} ={\frac{1}{n !}} +{\frac{a_{1}}{(n - 1) !}} +{\frac{a_{2}}{(n - 2) !}} + \cdots +{\frac{a_{n - 1}}{1 !}},
$$

证明:

$$
\operatorname{lim}_{n \to \infty} \ln^{n} 2 \cdot a_{n} ={\frac{1}{2 \ln 2}}.
$$

<!-- image-->

笔记核心想法即减去奇项来变得解析,从而可以用收敛半径公式.

$$
a_{n}
$$

$$
a_{0} ={\overset{\cdot}{1}}, f \left(x \right) = \sum_{k = 0}^{\infty} a_{k} x^{k}
$$

$$
f \left(x \right) \left(e^{x} - 1 \right) =
$$

$f \left(x \right) - 1$ ，即 $\begin{array}{r}{f \left(x \right) = \frac{1}{2 - e^{x}}} \end{array}$ ，注意到f在 $| z | < \ln 2$ 解析且除 $z = \ln 2$ 外，在 $| z | = \ln 2$ 没有其他奇点,我们由

$$
\frac{1}{2 - e^{z}} = \frac{1}{2 \left(\ln 2 - z \right)} + \frac{1}{4} + \cdot \cdot \cdot,
$$

以及

$$
{\frac{1}{2 \left(\ln 2 - z \right)}} ={\frac{1}{2 \ln 2}} \sum_{n = 0}^{\infty}{\frac{z^{n}}{\ln^{n} 2}},
$$

知存在 $\epsilon > 0.$ 使得 $\begin{array}{r}{f \left(z \right) - \frac{1}{2 \left(\ln{2 - z} \right)}} \end{array}$ 在 $| z | < \ln 2 + \epsilon$ 解析,因此

$$
\operatorname{lim}_{n \to \infty} \sqrt[n]{\left| a_{n} - \frac{1}{2 \ln 2} \cdot \frac{1}{\ln^{n} 2} \right|} \leqslant \frac{1}{\ln 2 + \epsilon},
$$

从而对任何 $\eta > 0$ ，当n充分大，我们有

$$
\left| \ln^{n} 2 \cdot a_{n} -{\frac{1}{2 \ln 2}} \right| \leqslant({\frac{\ln 2}{\ln 2 + \epsilon}} + \ln 2 \cdot \eta)^{n},
$$

选取 $\eta > 0$ 使得 $\begin{array}{r}{\frac{\ln 2}{\ln 2 + \epsilon} + \ln 2 \cdot \eta < 1} \end{array}$ ，我们就证明了

$$
\operatorname{lim}_{n \to \infty} \ln^{n} 2 \cdot a_{n} ={\frac{1}{2 \ln 2}}.
$$

## 8.6.3 傅立叶型积分渐近方法

## 8.6.4正常傅立叶积分渐近方法

对于正常的函数f的积分 $\begin{array}{r}{\int_{a}^{b} f \left(x \right) \sin{nx} dx} \end{array}$ 渐近展开可以通过反复分部积分来完成.于是我们不作讨论.对于其余情况，我们先来看两个特例,他们都可以求通项.

例题8.24

1.证明 $\begin{array}{r}{\int_{0}^{\pi} \frac{\sin^{2}(nx)}{\sin x} dx = \ln n + 2 \ln 2 + \gamma + o \left(1 \right), n \to \infty} \end{array}$

2.证明 $\begin{array}{r}{\int_{0}^{\pi} \frac{\sin^{2}(nx)}{\sin^{2} x} dx = n \pi + o(1), n \infty.} \end{array}$

证明

$$
\sin^{2} x - \sin^{2} y = \sin \left(x - y \right) \sin \left(x + y \right).\tag{8.56}
$$

1．利用公式(8.56),我们有

$$
\int_{0}^{\pi} \frac{\sin^{2} \left(\left(n + 1 \right) x \right)}{\sin x} dx - \int_{0}^{\pi} \frac{\sin^{2} \left(nx \right)}{\sin x} dx = \int_{0}^{\pi} \sin \left[\left(2n + 1 \right) x \right] dx = \frac{2}{2n + 1}, n \in \mathbb{N}_{0}.
$$

于是利用欧拉常数定义7.5,我们有

$$
\begin{array}{l}{\displaystyle \int_{0}^{\pi} \frac{\sin^{2} \left(nx \right)}{\sin x} dx = \sum_{k = 1}^{n} \frac{2}{2k - 1} = 2 \sum_{k = 1}^{2n} \frac{1}{k} - 2 \sum_{k = 1}^{n} \frac{1}{2k}} \\{\displaystyle \quad = 2 \ln \left(2n \right) + 2 \gamma - \ln n - \gamma + o \left(1 \right) = \ln n + 2 \ln 2 + \gamma + o \left(1 \right).} \end{array}
$$

2.利用公式(8.56),我们有

$$
\int_{0}^{\pi}{\frac{\sin^{2} \left(nx \right)}{\sin^{2} x}} dx - \int_{0}^{\pi}{\frac{\sin^{2} \left(\left(n - 1 \right) x \right)}{\sin^{2} x}} dx = \int_{0}^{\pi}{\frac{\sin \left(\left(2n - 1 \right) x \right)}{\sin x}} dx.
$$

又

$$
\int_{0}^{\pi} \frac{\sin \left(\left(2n + 1 \right) x \right)}{\sin x} dx - \int_{0}^{\pi} \frac{\sin \left(\left(2n - 1 \right) x \right)}{\sin x} dx = \int_{0}^{\pi} 2 \cos \left(2nx \right) dx = 0, n \in \mathbb{N}.
$$

故

$$
\int_{0}^{\pi}{\frac{\sin \left(\left(2n - 1 \right) x \right)}{\sin x}} dx = \int_{0}^{\pi}{\frac{\sin x}{\sin x}} dx = \pi,
$$

从而

$$
\int_{0}^{\pi}{\frac{\sin^{2} \left(nx \right)}{\sin^{2} x}} dx - \int_{0}^{\pi}{\frac{\sin^{2} \left(\left(n - 1 \right) x \right)}{\sin^{2} x}} dx = \pi, n \in \mathbb{N}.
$$

我们就有

$$
\int_{0}^{\pi} \frac{\sin^{2} \left(nx \right)}{\sin^{2} x} dx = n \pi.
$$

例题 8.25证明

$$
\begin{array}{r}{1.\ \int_{0}^{x} \frac{\sin^{2} y}{y} dy = \frac{1}{2} \ln x + \frac{\gamma + \ln 2}{2} + o(1), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{2.\ \int_{0}^{x} \frac{\sin y}{y} dy = \frac{\pi}{2} - \frac{\cos x}{x} + O(\frac{1}{x^{2}}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{3.\ \int_{0}^{x} \frac{\sin^{2} y}{y^{2}} dy = \frac{\pi}{2} - \frac{1}{2x} + O(\frac{1}{x^{2}}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{4.\ \int_{0}^{x} \frac{\sin^{4} y}{y_{.}} dy = \frac{3}{8} \ln x + \frac{3 \gamma + 2 \ln 2}{8} + o(1), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{5.\ \int_{0}^{x} \frac{\sin^{4} y}{y^{2}} dy = \frac{\pi}{4} - \frac{3}{8x} + O(\frac{1}{x^{2}}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{6.\ \int_{0}^{x} \frac{\sin^{4} y}{y^{4}} dy = \frac{\pi}{3} - \frac{1}{8x^{3}} + O(\frac{1}{x^{4}}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{7.\ \int_{0}^{x} \frac{\sin^{3} y}{y^{3}} dy = \frac{3 \pi}{8} + O(\frac{1}{x^{3}}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{8.\ \int_{0}^{x} \frac{\sin^{3} y}{y} dy = \frac{\pi}{4} + O(\frac{1}{x}), x + \infty.} \end{array}
$$

$$
\begin{array}{r}{9.\ \int_{0}^{x} \frac{\sin^{4} y}{y^{3}} dy = \ln 2 - \frac{3}{16x^{2}} + O(\frac{1}{x^{3}}), x + \infty.} \end{array}
$$

10. $\begin{array}{r}{\int_{0}^{x} \frac{\sin^{3} y}{y^{2}} dy = \frac{3 \ln 3}{4} + O(\frac{1}{x^{2}}), x + \infty.} \end{array}$

$$
\begin{array}{r}{\int_{0}^{x} \frac{1 - e^{- y}}{y} dy = \ln x + \gamma + O \left(\frac{1}{xe^{x}} \right), x \to + \infty.} \end{array}
$$

<!-- image-->

笔记证明的想法就是把奇点分开之后分部积分.不必纠结具体积分计算,主要是知道个阶的估计即可.证明

1．读者可以计算12有

$$
\int_{0}^{1} \frac{\sin^{2} y}{y} dy + \frac{\sin 2}{4} - \frac{1}{4} \int_{1}^{\infty} \frac{\sin \left(2y \right)}{y^{2}} dy = \frac{\ln 2 + \gamma}{2},
$$

因此

$$
\begin{array}{rl}{\displaystyle \int_{0}^{x} \frac{\sin^{2} y}{y} dy = \int_{0}^{1} \frac{\sin^{2} y}{y} dy + \int_{1}^{x} \frac{\sin^{2} y}{y} dy} \\{\displaystyle} &{= \int_{0}^{1} \frac{\sin^{2} y}{y} dy + \frac 12 \int_{1}^{x} \frac{1 - \cos(2y)}{y} dy} \\ &{= \int_{0}^{1} \frac{\sin^{2} y}{y} dy + \frac 12 \ln x - \frac 1{4} \int_{1}^{x} \frac{1}{y} d \sin{(2y)}} \\ &{= \int_{0}^{1} \frac{\sin^{2} y}{y} dy + \frac 12 \ln x - \frac{\sin(2x)}{4x} + \frac{\sin 2}{4} - \frac 14 \int_{1}^{x} \frac{\sin{(2y)}}{y^{2}} dy} \\ &{= \int_{0}^{1} \frac{\sin^{2} y}{y} dy + \frac 12 \ln x + \frac{\sin 2}{4} - \frac 1{4} \int_{1}^{\infty} \frac{\sin{(2y)}}{y^{2}} dy + o(1)} \\ &{= \frac{\ln(2x)}{2} + \gamma + o(1).} \end{array}
$$

因此我们证明了

$$
\operatorname{lim}_{x \to + \infty} \left(\int_{0}^{x}{\frac{\sin^{2} y}{y}} dy - \ln{\sqrt{x}} \right) ={\frac{\ln 2 + \gamma}{2}}.
$$

2.随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

3．随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

4.随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

5．随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

6．随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几

个的计算.

7．随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

8.随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

9.随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问,我们略去中间几个的计算.

10．随着次数增高，计算越来越复杂，思想上就是降次之后分部积分来得到阶．方法同第一问，我们略去中间几个的计算.

11．我们有

$$
{\begin{array}{rl} &{\int_{0}^{x}{\frac{1 - e^{- y}}{y}} dy = \int_{0}^{1}{\frac{1 - e^{- y}}{y}} dy + \int_{1}^{x}{\frac{1 - e^{- y}}{y}} dy} \\ &{\qquad = \ln x + \int_{0}^{1}{\frac{1 - e^{- y}}{y}} dy - \int_{1}^{x}{\frac{e^{- y}}{y}} dy} \\ &{\qquad = \ln x + \int_{0}^{1}{\frac{1 - e^{- y}}{y}} dy - \int_{1}^{\infty}{\frac{e^{- y}}{y}} dy + \int_{x}^{\infty}{\frac{e^{- y}}{y}} dy} \\ &{\qquad = \ln x + \gamma + O \left({\frac{1}{xe^{x}}} \right),} \end{array}}
$$

其中

$$
\gamma = \int_{0}^{1} \frac{1 - e^{- y}}{y} dy - \int_{1}^{\infty} \frac{e^{- y}}{y} dy.
$$

例题8.26\*证明

$$
\int_{0}^{\frac{\pi}{2}} x \frac{\sin^{4} \left(nx \right)}{\sin^{4} x} dx = \ln 2 \cdot n^{2} + \frac{1}{4} \ln n + \frac{6 \gamma + 4 \ln 2 + 5}{24} + o \left(1 \right), n \to \infty.
$$

<!-- image-->

笔记诚然,读者可以通过 Stolz或者直接求出积分值的方法来估计本题的阶,但是我们这里想呈现一般方法.具体考试中往往直接stolz或者求出积分就够用了．一句话来说,就是把 $\frac{1}{\sin^{4} x}$ 在 $x = 0$ 洛朗展开13，展开的阶数越高，我们得到的阶越高.

证明 运用

$$
\operatorname{lim}_{x \to 0} \left|{\frac{x}{\sin^{4} x}} -{\frac{1}{x^{3}}} -{\frac{2}{3x}} \right| ={\frac{11}{45}},
$$

对充分小的 $c > 0,$ 我们有

$$
\left|{\frac{x}{\sin^{4} x}} -{\frac{1}{x^{3}}} -{\frac{2}{3x}} \right| \leqslant 1, x \in[0, c].
$$

由黎曼引理8.2,我们有

$$
\operatorname{lim}_{n \infty} \int_{c}^{\frac{\pi}{2}} x \frac{\sin^{4}(nx)}{\sin^{4} x} dx = \frac{3}{8} \int_{c}^{\frac{\pi}{2}} \frac{x}{\sin^{4} x} dx,
$$

以及

$$
\begin{array}{rl}{\displaystyle \int_{0}^{c} x \frac{\sin^{4}(nx)}{\sin^{4} x} dx \leqslant \int_{0}^{c} \frac{\sin^{4}(nx)}{x^{3}} dx + \frac{2}{3} \int_{0}^{c} \frac{\sin^{4}(nx)}{x} dx + \int_{0}^{c} \sin^{4}(nx) dx} \\{\displaystyle} &{\leqslant n^{2} \int_{0}^{nc} \frac{\sin^{4}(x)}{x^{3}} dx + \frac{2}{3} \int_{0}^{nc} \frac{\sin^{4}(x)}{x} dx + c} \\{\displaystyle} &{\frac{8 \frac{25}{4} n^{2}}{n^{2}} \left(\ln 2 - \int_{nc}^{\infty} \frac{\sin^{4}(x)}{x^{3}} dx \right) + \frac{2}{3} \left(\frac{3}{8} \ln \left(nc \right) + \frac{3 \gamma + 2 \ln 2}{8} \right) + c + o \left(1 \right)} \\{\displaystyle} &{= \ln 2 \cdot n^{2} - \int_{c}^{\infty} \frac{\sin^{4}(nx)}{x^{3}} dx + \left(\frac{1}{4} \ln \left(nc \right) + \frac{\gamma + \frac{210}{3}}{4} \right) + c + o \left(1 \right)} \\{\displaystyle} &{= \ln 2 \cdot n^{2} - \frac{3}{16c^{2}} + \left(\frac{1}{4} \ln \left(nc \right) + \frac{\gamma + \frac{2182}{4}}{4} \right) + c + o \left(1 \right),} \end{array}
$$

利用

$$
\int_{c}^{\frac{\pi}{2}} \frac{x}{\sin^{4} x} dx = c \left(\frac{\cot^{3} \left(c \right)}{3} + \cot \left(c \right) \right) + \frac{\cot^{2} \left(c \right)}{6} - \frac{2}{3} \ln \frac{\sin \left(c \right)}{c} - \frac{2}{3} \ln c,
$$

我们有

$$
\operatorname{lim}_{c \to 0^{+}} \left(-{\frac{3}{16c^{2}}} +{\frac{\ln c}{4}} +{\frac{3}{8}} \int_{c}^{\frac{\pi}{2}}{\frac{x}{\sin^{4} x}} dx \right) ={\frac{5}{24}}.
$$

因此

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} x \frac{\sin^{4} \left(nx \right)}{\sin^{4} x} dx - \ln 2 \cdot n^{2} - \frac{1}{4} \ln n \right) \leqslant \frac{\gamma + \frac{2 \ln 2}{3}}{4} + \frac{5}{24},
$$

类似的

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} x \frac{\sin^{4} \left(nx \right)}{\sin^{4} x} dx - \ln 2 \cdot n^{2} - \frac{1}{4} \ln n \right) \geqslant \frac{\gamma + \frac{2 \ln 2}{3}}{4} + \frac{5}{24},
$$

因此

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} x \frac{\sin^{4} \left(nx \right)}{\sin^{4} x} dx - \ln 2 \cdot n^{2} - \frac{1}{4} \ln n \right) = \frac{6 \gamma + 4 \ln 2 + 5}{24}.
$$

例题8.27\*设 $f \in C^{2} \left[0,{\frac{\pi}{2}} \right]$ ,计算

$$
\operatorname{lim}_{c \to 0^{+}} \left(- \frac{f \left(0 \right)}{2c} + \frac{f^{\prime} \left(0 \right)}{2} \ln c + \frac{1}{2} \int_{c}^{\frac{\pi}{2}} \frac{f \left(x \right)}{\sin^{2} x} dx \right).
$$

证明 记 $a = f(0), b = f^{\prime}(0)$ ，我们有

$$
{\frac{1}{2}} \left(\int_{c}^{{\frac{\pi}{2}}}{\frac{a + bx}{\sin^{2} x}} dx \right) ={\frac{1}{4}} \left(2 \left(a + bc \right) \cot c - 2b \ln \left(\sin c \right) \right) = -{\frac{b}{2}} \ln c +{\frac{b}{2}} +{\frac{a}{2c}} + O \left(c \right).
$$

因此

$$
\operatorname{lim}_{c \to 0^{+}} \left(-{\frac{f \left(0 \right)}{2c}} +{\frac{f^{\prime} \left(0 \right)}{2}} \ln c +{\frac{1}{2}} \int_{c}^{\frac{2}{2}}{\frac{f \left(x \right)}{\sin^{2} x}} dx \right) ={\frac{1}{2}} \int_{0}^{\frac{\pi}{2}}{\frac{f \left(x \right) - a - bx}{\sin^{2} x}} dx +{\frac{b}{2}} ={\frac{1}{2}} \int_{0}^{\frac{\pi}{2}}{\frac{f \left(x \right) - f \left(0 \right) - f^{\prime} \left(0 \right) x}{\sin^{2} x}} dx +{\frac{f^{\prime} \left(0 \right)}{2}}.
$$

例题 8.28\*设 $f \left(x \right) \in C^{2} \left[0, \frac{\pi}{2} \right]$ ,证明

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} \frac{\sin^{2} \left(nx \right)}{\sin^{2} x} f \left(x \right) dx - \frac{\pi f \left(0 \right)}{2} n - \frac{f^{\prime} \left(0 \right)}{2} \ln n \right) = \frac{1}{2} \int_{0}^{\frac{\pi}{2}} \frac{f \left(x \right) - f \left(0 \right) - f^{\prime} \left(0 \right) x}{\sin^{2} x} dx + \frac{f^{\prime} \left(0 \right)}{2} \left(1 + \gamma + \ln 2 \right).
$$

证明 对任意 $\epsilon > 0.$ ，存在充分小的 $c \in(0, \frac{\pi}{2})$ ，我们

$$
\left| \frac{f \left(x \right)}{\sin^{2} x} - \frac{f \left(0 \right)}{x^{2}} - \frac{f^{\prime} \left(0 \right)}{x} - \frac{f \left(0 \right)}{3} - \frac{f^{\prime \prime} \left(0 \right)}{2} \right| \leqslant \epsilon, x \in \left[0, c \right],
$$

现在我们有

$$
\int_{c}^{\frac{\pi}{2}} \sin^{2} \left(nx \right) \frac{f \left(x \right)}{\sin^{2} x} dx = \frac{1}{2} \int_{c}^{\frac{\pi}{2}} \frac{f \left(x \right)}{\sin^{2} x} dx + o \left(1 \right),
$$

$$
\begin{array}{rl} &{\int_{0}^{\infty} \frac{\sin^{2} \left(n \Omega \right)}{\sin^{2} \gamma} f \left(z \right) dz} \\ &{\quad \leqslant \int_{0}^{\infty} \sin^{2} \left(\frac{f \left(0 \right)}{z} \right) \left(\frac{f \left(0 \right)}{z^{2}} + \frac{f^{\prime} \left(0 \right)}{z} + \frac{f \left(0 \right)}{3} + \frac{f^{\prime \prime} \left(0 \right)}{2} \right) dz + \frac{\pi}{2} t} \\ &{\quad = \int_{0}^{\infty} \sin^{2} \left(z \right) \left(\frac{f \left(0 \right)}{f \left(0 \right)} + \frac{f^{\prime} \left(0 \right)}{z} \right) dz + \frac{1}{2} \left(\frac{f \left(0 \right)}{3} \right) + \frac{f^{\prime \prime} \left(0 \right)}{2} \right) dz + \frac{\pi}{2} t < o \left(1 \right)} \\ &{\quad = nf \left(0 \right) \int_{0}^{\infty} \frac{\sin^{2} \left(n \Omega \right)}{z^{2}} dx + \frac{f^{\prime} \left(0 \right)}{z} \right) \int_{0}^{\infty} \frac{\sin^{2} \pi}{x} dx + \frac{1}{2} \left(\frac{f \left(0 \right)}{3} + \frac{f^{\prime \prime} \left(0 \right)}{2} \right) c + \frac{\pi}{2} c + o \left(1 \right)} \\ & \quad = \frac{\pi f \left(0 \right)}{2} \sin - nf^{\prime} \left(0 \right) \int_{0}^{\infty} \frac{\sin^{2} \pi}{z^{2}} dx + \frac{f^{\prime} \left(0 \right)}{2} \int_{0}^{\infty} \frac{\sin^{2} \pi}{z} dx + \frac{1}{2} \left(\frac{f \left(0 \right)}{3} + \frac f^{\prime} \left(\end{array}
$$

类似的我们有

$$
\int_{0}^{c}{\frac{\sin^{2} \left(nx \right)}{\sin^{2} x}} f \left(x \right) dx \geqslant{\frac{\pi f \left(0 \right)}{2}} n -{\frac{f \left(0 \right)}{2c}} +{\frac{f^{\prime} \left(0 \right)}{2}} \left(\ln \left(2nc \right) + \gamma \right) +{\frac{1}{2}}({\frac{f \left(0 \right)}{3}} +{\frac{f^{\prime \prime} \left(0 \right)}{2}}) c -{\frac{\pi}{2}} \epsilon + o \left(1 \right),
$$

即

$$
\begin{array}{l}{{\displaystyle \operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac \pi 2}{\sin^{2}{n} x} f \left(x \right) dx - \frac{\pi f \left(0 \right)}{2} n - \frac{f^{\prime} \left(0 \right)}{2} \ln{\left(2n \right)} \right)}} \\{{\displaystyle \quad \leqslant - \frac{f \left(0 \right)}{2c} + \frac{f^{\prime} \left(0 \right)}{2} \left(\ln{\left(c \right)} + \gamma \right) + \frac{1}{2}(\frac{f \left(0 \right)}{3} + \frac{f^{\prime \prime} \left(0 \right)}{2}) c + \frac{1}{2} \int_{c}^{\frac \pi 2} \frac{f \left(x \right)}{\sin^{2}{x}} dx + \frac{\pi}{2} \epsilon},} \end{array}
$$

令

$$
\operatorname{lim}_{c \to 0^{+}} \left(-{\frac{f \left(0 \right)}{2c}} +{\frac{f^{\prime} \left(0 \right)}{2}} \ln c +{\frac{1}{2}} \int_{c}^{{\frac{\pi}{2}}}{\frac{f \left(x \right)}{\sin^{2} x}} dx \right) = A,
$$

则

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}}{\frac{\sin^{2} \left(nx \right)}{\sin^{2} x}} f \left(x \right) dx -{\frac{\pi f \left(0 \right)}{2}} n -{\frac{f^{\prime} \left(0 \right)}{2}} \ln \left(2n \right) \right) \leqslant{\frac{f^{\prime} \left(0 \right)}{2}} \gamma + A,
$$

容易由另外一个不等式得到下极限的不等式，因此

$$
\operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} \frac{\sin^{2} \left(nx \right)}{\sin^{2} x} f \left(x \right) dx - \frac{\pi f \left(0 \right)}{2} n - \frac{f^{\prime} \left(0 \right)}{2} \ln \left(2n \right) \right) = \frac{f^{\prime} \left(0 \right)}{2} \gamma + A.
$$

应用例题8.27,我们有

$$
\begin{array}{l}{{\displaystyle \operatorname{lim}_{n \to \infty} \left(\int_{0}^{\frac{\pi}{2}} \frac{\sin^{2} \left(nx \right)}{\sin^{2} x} f \left(x \right) dx - \frac{\pi f \left(0 \right)}{2} n - \frac{f^{\prime} \left(0 \right)}{2} \ln n \right)} \ ~} \\{{\displaystyle = \frac{1}{2} \int_{0}^{\frac{\pi}{2}} \frac{f \left(x \right) - f \left(0 \right) - f^{\prime} \left(0 \right) x}{\sin^{2} x} dx + \frac{f^{\prime} \left(0 \right)}{2} \left(1 + \gamma + \ln 2 \right).}} \end{array}
$$

这样就完成了证明.

来看奇异形傅立叶型积分的渐近方法,我们仅援引北京大学期中数学分析全军覆没的例子.

## 8.6.5奇异型傅立叶积分渐近方法 \*

例题8.29一个特殊函数 对任何[a,b],存在函数 $v \in C^{\infty}[a, b]$ 使得

1. $v \left(a \right) = 1, v \left(b \right) = 0;$

2. $v^{(j)} \left(a \right) = v^{(j)} \left(b \right) = 0, \forall j \in \mathbb{N}$

证明 例如 $v \left(x \right) = 1 + \left(e^{\frac{1}{x - b}} - 1 \right) e^{-{\frac{e^{\frac{1}{x - b}}}{x - a}}}$

例题8.30\*对 $0 \leqslant \alpha <{\frac{i}{2}}, \rho \in$ R,定义函数

$$
I_{\alpha} \left(\rho \right) = \int_{- 1}^{1} e^{i \rho t} \left(1 - t^{2} \right)^{\alpha -{\frac{1}{2}}} dt.
$$

证明存在只依赖α 的常数C,使得

$$
\left| I_{\alpha} \left(\rho \right) \right| \leqslant C \left(1 + | \rho | \right)^{- \alpha - \frac{1}{2}}.
$$

<!-- image-->

笔记处理奇异型傅立叶积分,需要引入中和函数,即例8.29.中和函数的边界性态非常好.

证明利用被积函数的奇偶性质，我们知道

$$
I_{\alpha} \left(\rho \right) = \int_{- 1}^{1} e^{i \rho t} \left(1 - t^{2} \right)^{\alpha - \frac 12} dt = 2 \int_{0}^{1} \cos \left(\left| \rho \right| t \right) \left(1 - t^{2} \right)^{\alpha - \frac 12} dt,
$$

于是不妨假设 $\rho > 0.$ 当 $\textstyle 0 \leqslant \alpha <{\frac{1}{2}}$ 对 $[a, b] =[0, 1]$ ，引入U如例(8.29),注意到

$$
2 \int_{0}^{1} \cos \left(\rho t \right) \left(1 - t^{2} \right)^{\alpha - \frac{1}{2}} \left(1 - v \left(t \right) \right) dt + 2 \int_{0}^{1} \cos \left(\rho t \right) \left(1 - t^{2} \right)^{\alpha - \frac{1}{2}} v \left(t \right) dt = 2A + 2B.
$$

记

$$
\varphi \left(t \right) = \left(1 + t \right)^{\alpha - \frac{1}{2}} \left(1 - v \left(t \right) \right), \phi \left(t \right) = \left(1 - t^{2} \right)^{\alpha - \frac{1}{2}} v \left(t \right).
$$

注意到

$$
\left| B \right| = \left| \int_{0}^{1} \cos \left(\rho t \right) \phi \left(t \right) dt \right| = \left| \frac{1}{\rho} \int_{0}^{1} \sin \left(\rho t \right) \phi^{\prime} \left(t \right) dt \right|,
$$

因此

$$
| B | \leqslant \frac{1}{\rho} \int_{0}^{1} | \phi^{\prime} \left(t \right) | dt = O \left(\frac{1}{\rho} \right).\tag{8.57}
$$

以及

$$
\begin{array}{l}{\displaystyle{A = \int_{0}^{1} \cos \left(\rho t \right) \left(1 - t \right)^{\alpha - \frac{1}{2}} \varphi \left(t \right) dt = \int_{0}^{1} \varphi \left(t \right) d \left(\int_{- \infty}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right)}} \\{\displaystyle{= \left(\int_{- \infty}^{1} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right) \varphi \left(1 \right) - \int_{0}^{1} \varphi^{\prime} \left(t \right) \left(\int_{- \infty}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right) dt}} \\{\displaystyle{= \left(\int_{- \infty}^{1} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right) 2^{\alpha - \frac{1}{2}} - \int_{0}^{1} \varphi^{\prime} \left(t \right) \left(\int_{- \infty}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right) dt,}} \end{array}
$$

然后由第二积分中值定理积分中值定理,我们知道

$$
\begin{array}{rl} &{\left| \displaystyle \int_{- \infty}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right| = \displaystyle \operatorname{lim}_{c \to - \infty} \left| \int_{c}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right|} \\ &{\quad = \displaystyle \operatorname{lim}_{c \to - \infty} \left| \left(1 - t \right)^{\alpha - \frac{1}{2}} \int_{\theta(c)}^{t} \cos \left(\rho x \right) dx \right| \leqslant \frac{2 \left(1 - t \right)^{\alpha - \frac{1}{2}}}{\rho}.} \end{array}
$$

于是我们有

$$
\left| \int_{0}^{1} \varphi^{\prime} \left(t \right) \left(\int_{- \infty}^{t} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right) dt \right| \leqslant \frac{2}{\rho} \int_{0}^{1} \left| \varphi^{\prime} \left(t \right) \right| \left(1 - t \right)^{\alpha - \frac{1}{2}} dt = O \left(\frac{1}{\rho} \right).\tag{8.58}
$$

此外

$$
\int_{- \infty}^{1} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx = \int_{0}^{\infty} \frac{\cos \left(\rho - \rho x \right)}{x^{\frac{1}{2} - \alpha}} dx = \rho^{- \alpha - \frac{1}{2}} \int_{0}^{\infty} \frac{\cos \left(\rho - x \right)}{x^{\frac{1}{2} - \alpha}} dx,
$$

于是我们有

$$
\left| \int_{- \infty}^{1} \cos \left(\rho x \right) \left(1 - x \right)^{\alpha - \frac{1}{2}} dx \right| \leqslant \rho^{- \alpha - \frac{1}{2}} \int_{0}^{\infty} \frac{1}{x^{\frac{1}{2} - \alpha}} dx = O \left(\rho^{- \alpha - \frac{1}{2}} \right), \rho \to + \infty.\tag{8.59}
$$
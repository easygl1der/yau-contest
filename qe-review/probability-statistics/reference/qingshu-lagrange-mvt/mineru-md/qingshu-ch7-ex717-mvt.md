证明由幂平均不等式7.2我们知 $a_{n}$ $b_{n} \geqslant c_{n}, n = 1, 2, \cdot \cdot$ ·以及

$$
\begin{array}{r}{a_{n + 1} = \frac{a_{n} + b_{n} + c_{n}}{3} \leqslant \frac{a_{n} + a_{n} + a_{n}}{3} = a_{n}.} \end{array}
$$

$$
\begin{array}{r}{c_{n + 1} ={\frac{3}{{\frac{1}{a_{n}}} +{\frac{1}{b_{n}}} +{\frac{1}{c_{n}}}}} \geqslant{\frac{3}{{\frac{1}{c_{n}}} +{\frac{1}{c_{n}}} +{\frac{1}{c_{n}}}}} = c_{n}.} \end{array}
$$

现在

$$
a_{n + 1} - c_{n + 1} \leqslant \frac{a_{n} + b_{n} + c_{n}}{3} - c_{n} = \frac{a_{n} - c_{n} + b_{n} - c_{n}}{3} \leqslant \frac{2}{3} \left(a_{n} - c_{n} \right),
$$

所以

$$
0 \leqslant \operatorname{lim}_{n \to \infty} \left| a_{n} - c_{n} \right| \leqslant \operatorname{lim}_{n \to \infty} \left({\frac{2}{3}} \right)^{n - 1} \left| a_{1} - c_{1} \right| = 0.
$$

注意到 $\left[c_{n}, a_{n} \right], n = 1, 2, \cdot \cdot$ ：构成区间套，由区间套定理1.我们知道

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} c_{n},
$$

夹逼准则知

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} c_{n} = \operatorname{lim}_{n \to \infty} b_{n}.
$$

练习7.14设 $a_{1}, b_{1}, c_{1} > 0, a_{1} + b_{1} + c_{1} = 1$ 定义

$$
a_{n + 1} = a_{n}^{2} + 2b_{n} c_{n}, b_{n + 1} = b_{n}^{2} + 2a_{n} c_{n}, c_{n + 1} = c_{n}^{2} + 2a_{n} b_{n},
$$

计算

$$
\operatorname{lim}_{n \to \infty} a_{n}, \operatorname{lim}_{n \to \infty} b_{n}, \operatorname{lim}_{n \to \infty} c_{n}.
$$

证明显然 $a_{n}, b_{n}, c_{n} > 0$ 且

$$
\left(a_{n + 1} + b_{n + 1} + c_{n + 1} \right) = \left(a_{n} + b_{n} + c_{n} \right)^{2}, n = 1, 2, \cdots,
$$

于是我们有

$$
a_{n} + b_{n} + c_{n} \equiv 1, n = 1, 2, \cdot \cdot \cdot.\tag{7.36}
$$

考虑

$$
T_{n} = \operatorname{max} \left\{a_{n}, b_{n}, c_{n} \right\}, S_{n} = \operatorname{min} \left\{a_{n}, b_{n}, c_{n} \right\}, n = 1, 2, \cdots,
$$

则对n时设 $a_{n}$ ≥ $b_{n}$ ≥ $c_{n}.$ 那么有

$$
\begin{array}{r}{a_{n + 1} = a_{n}^{2} + 2b_{n} c_{n} \leqslant a_{n}^{2} + a_{n} c_{n} + b_{n} a_{n} \overset{(7, 36)}{=} a_{n},} \\{b_{n + 1} = b_{n}^{2} + 2a_{n} c_{n} \leqslant a_{n} b_{n} + a_{n} c_{n} + a_{n} a_{n} \overset{(7, 36)}{=} a_{n},} \\{c_{n + 1} = c_{n}^{2} + 2a_{n} b_{n} \leqslant c_{n} a_{n} + a_{n} b_{n} + a_{n} a_{n} \overset{(7, 36)}{=} a_{n}.} \end{array}
$$

于是我们就有 $T_{n + 1} \leqslant T_{n}$

还有

$$
a_{n + 1} = a_{n}^{2} + 2b_{n} c_{n} \geqslant a_{n} c_{n} + b_{n} c_{n} + c_{n} c_{n} \stackrel{(7.36)}{=} c_{n},
$$

$$
b_{n + 1} = b_{n}^{2} + 2a_{n} c_{n} \geqslant b_{n} c_{n} + a_{n} c_{n} + c_{n} c_{n} \stackrel{(7.36)}{=} c_{n},
$$

$$
c_{n + 1} = c_{n}^{2} + 2a_{n} b_{n} \geqslant c_{n}^{2} + a_{n} c_{n} + b_{n} c_{n} \stackrel{(7.36)}{=} c_{n}.
$$

于是我们就有 $S_{n + 1} \geqslant S_{n}$

还有

$$
\left| a_{n + 1} - c_{n + 1} \right| = \left| a_{n}^{2} + 2b_{n} c_{n} - c_{n}^{2} - 2a_{n} b_{n} \right| = \left| a_{n} - c_{n} \right| \cdot \left| a_{n} - b_{n} -(b_{n} - c_{n}) \right| \leqslant \left| a_{n} - c_{n} \right|^{2},
$$

$$
\begin{array}{r}{\left| b_{n + 1} - c_{n + 1} \right| = \left| a_{n} - b_{n} - \left(a_{n} - c_{n} \right) \right| \cdot \left| a_{n} - b_{n} + a_{n} - c_{n} \right| = \left(a_{n} - c_{n} \right)^{2} - \left(a_{n} - b_{n} \right)^{2} \leqslant \left(a_{n} - c_{n} \right)^{2},} \end{array}
$$

$$
\left| a_{n + 1} - b_{n + 1} \right| = \left| a_{n} - c_{n} - \left(b_{n} - c_{n} \right) \right| \cdot \left| a_{n} - c_{n} + b_{n} - c_{n} \right| = \left(a_{n} - c_{n} \right)^{2} - \left(b_{n} - c_{n} \right)^{2} \leqslant \left(a_{n} - c_{n} \right)^{2}.
$$

于是我们就有

$$
T_{n + 1} - S_{n + 1} \leqslant \left(T_{n} - S_{n} \right)^{2} \leqslant \cdots \leqslant \left(T_{1} - S_{1} \right)^{2^{n}} \leqslant T_{1}^{2^{n}},
$$

即 $\operatorname{lim}_{n \infty}(T_{n} - S_{n}) = 0 \mathrm{{,}}$ 现在 $\left[S_{n}, T_{n} \right], n = 1, 2, \cdot \cdot \cdot$ 构成长度趋于0的区间套，因此由区间套定理1.和夹逼准则知

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} c_{n} = \operatorname{lim}_{n \to \infty} b_{n}.
$$

因此

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} b_{n} = \operatorname{lim}_{n \to \infty} c_{n} = \operatorname{lim}_{n \to \infty} T_{n} = \operatorname{lim}_{n \to \infty} S_{n} = x,
$$

现在由等式(7.36)知

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} b_{n} = \operatorname{lim}_{n \to \infty} c_{n} ={\frac{1}{3}}.
$$

练习7.15

$$
a_{n + 1} = \int_{0}^{1} \operatorname{min} \left(x, b_{n}, c_{n} \right) dx, b_{n + 1} = \int_{0}^{1} \operatorname{mid} \left(x, a_{n}, c_{n} \right) dx, c_{n + 1} = \int_{0}^{1} \operatorname{max} \left(x, a_{n}, b_{n} \right) dx, n = 1, 2, \cdots,
$$

这里mid 表示取中间值.

证明 注意到

$$
a_{n + 1} \leqslant \int_{0}^{1} xdx = \frac{1}{2}, c_{n + 1} \geqslant \int_{0}^{1} xdx = \frac{1}{2},
$$

于是不妨设

$$
a_{n} \leqslant \frac{1}{2}, c_{n} \geqslant \frac{1}{2}, \forall n \in \mathbb{N}.\tag{7.37}
$$

读者可以直接分类讨论并注意到

$$
\begin{array}{r}{\operatorname{max} \left(x, a_{n}, b_{n} \right) \geqslant \operatorname{mid} \left(x, a_{n}, c_{n} \right) \geqslant \operatorname{min} \left(x, b_{n}, c_{n} \right),} \end{array}
$$

于是 $c_{n + 1}$ M $b_{n + 1}$ $a_{n + 1}$ ，因此不妨设

$$
c_{n} \geqslant b_{n} \geqslant a_{n}, \forall n \in \mathbb{N}.
$$

显然归纳可得 $a_{n}, b_{n}, c_{n}, n = 3, 4, \cdot \cdot \cdot$ 非负,不妨设 $a_{n}, b_{n}, c_{n}, n = 1, 2, \cdot \cdot \cdot$ 非负.

于是就有

$$
\begin{array}{l}{{b_{n + 1} = \displaystyle \int_{0}^{1} \operatorname{mid} \left(x, a_{n}, c_{n} \right) dx = \displaystyle \int_{0}^{\frac 12} \operatorname{max} \left(x, a_{n} \right) dx + \displaystyle \int_{\frac 12}^{1} \operatorname{min} \left(x, c_{n} \right) dx}} \\{{\displaystyle \quad = \int_{0}^{a_{n}} a_{n} dx + \displaystyle \int_{a_{n}}^{\frac 12} xdx + \displaystyle \int_{\frac 12}^{c_{n}} xdx + \displaystyle \int_{c_{n}}^{1} c_{n} dx}} \\{{\displaystyle \quad = \frac 12a_{n}^{2} + c_{n} - \frac 12c_{n}^{2} \leqslant \frac 18 + \frac 12 = \frac 58.}} \end{array}
$$

以及

$$
\begin{array}{r}{a_{n + 1} = \int_{0}^{1} \operatorname{min} \left(x, b_{n} \right) dx = \int_{0}^{b_{n}} xdx + \int_{b_{n}}^{1} b_{n} dx = b_{n} - \frac{1}{2} b_{n}^{2}.} \\{c_{n + 1} = \int_{0}^{1} \operatorname{max} \left(x, b_{n} \right) dx = \int_{0}^{b_{n}} b_{n} dx + \int_{b_{n}}^{1} xdx = \frac{1}{2} b_{n}^{2} + \frac{1}{2}.} \end{array}\tag{7.38}
$$

现在

$$
b_{n + 2} = \frac{\left(\frac{2b_{n} - b_{n}^{2}}{2} \right)^{2} - \left(\frac{1 + b_{n}^{2}}{2} \right)^{2} + b_{n}^{2} + 1}{2} = \frac{3 + 6b_{n}^{2} - 4b_{n}^{3}}{8}.
$$

不妨设 $b_{1} \in[0, \frac{5}{8}]$ ．注意到上述递推函数在[0,]单调递增，所以由结论7.3.1我们知道 $b_{n}$ 的奇偶子列都趋于唯一不动点 ${\frac{1}{2}},$ ，因此

$$
\operatorname{lim}_{n \to \infty} a_{n} ={\frac{3}{8}}, \operatorname{lim}_{n \to \infty} c_{n} ={\frac{5}{8}}, \operatorname{lim}_{n \to \infty} b_{n} ={\frac{1}{2}}.
$$

练习7.16设 $f_{n} \left(x \right) = e^{nx} + x - e^{n}, n = 1, 2, \cdot \cdot \cdot$ ,证明对任何 $n \in \mathbb{N},$ 都存在唯一的 $r_{n} \in(0, 1)$ 使得 $f_{n} \left(r_{n} \right) = 0.$ 并证明 $\operatorname{lim}_{n \to \infty} r_{n}$ 存在和计算 $\operatorname{lim}_{n \to \infty}{r_{n}}.$

证明 事实上因为 $f_{n}$ 是[0,1]上的 $\overline{{\mathtt{j}^{\mathtt{N}}}}$ 格递增函数和 $f_{n}(0) = 1 - e^{n} < 0, f_{n}(1) = 1 > 0$ ，由零点定理我们知道存在唯一的 $r_{n} \in(0, 1)$ 使得 $f_{n} \left(r_{n} \right) = 0.$ ，显然这是n可以解出来的类型，所以

$$
e^{nr_{n}} + r_{n} - e^{n} = 0 \Rightarrow r_{n} ={\frac{\ln \left(e^{n} - r_{n} \right)}{n}} = 1 +{\frac{\ln \left(1 -{\frac{r_{n}}{e^{n}}} \right)}{n}}.
$$

又因为 $r_{n} \in(0, 1)$ ，所以 $\operatorname{lim}_{n \to \infty}{\frac{\ln \left(1 -{\frac{r_{n}}{e^{n}}} \right)}{n}} = 0,$ 从而直接导出 $\operatorname{lim}_{n \to \infty} r_{n} = 1.$

()我们同样希望给出 $r_{n}$ 渐近估计,我们运用标准的迭代法：注意到

$$
\ln \left(1 - x \right) = O \left(x \right) \Rightarrow r_{n} = 1 + \frac{\ln \left(1 - \frac{r_{n}}{e^{n}} \right)}{n} = 1 + O \left(\frac{e^{- n}}{n} \right),
$$

于是由 $\ln \left(1 - x \right) = - x + O \left(x^{2} \right)$ 得

$$
r_{n} = 1 +{\frac{\ln \left(1 -{\frac{r_{n}}{e^{n}}} \right)}{n}} = 1 -{\frac{r_{n}}{ne^{n}}} + O \left({\frac{e^{- 2n}}{n}} \right) = 1 -{\frac{1}{ne^{n}}} + O \left({\frac{e^{- 2n}}{n}} \right).
$$

运用 $\begin{array}{r}{\ln{(1 - x)} = - x - \frac{x^{2}}{2} + O \left(x^{3} \right)} \end{array}$ ，我们有

$$
r_{n} = 1 +{\frac{\ln \left(1 -{\frac{\tau_{n}}{n \epsilon}} \right)}{n}} = 1 -{\frac{r_{n}}{n \epsilon^{n}}} -{\frac{r_{n}^{2}}{2 \epsilon^{2n}}} + O \left({\frac{\epsilon^{- 3n}}{n}} \right) = 1 -{\frac{1 -{\frac{1}{n \epsilon^{n}}} + O \left({\frac{\epsilon^{- 2n}}{n}} \right)}{n \epsilon^{n}}} -{\frac{\left(1 -{\frac{1}{n \epsilon^{n}}} + O \left({\frac{\epsilon^{- 2n}}{n}} \right) \right)^{2}}{2 \epsilon^{2n}}} + O \left({\frac{\epsilon^{- 3n}}{n}} \right)
$$

因为余项展开出来会被吸收进末尾的余项 $1 -{\frac{1 -{\frac{1}{ne^{n}}}}{ne^{n}}} -{\frac{\left(1 -{\frac{1}{ne^{n}}} \right)^{2}}{2e^{2n}}} + O \left({\frac{e^{- 3n}}{n}} \right) = 1 -{\frac{1}{ne^{n}}} -{\frac{1}{2e^{2n}}} +{\frac{1}{n^{2} e^{2n}}} + O \left({\frac{e^{- 3n}}{n}} \right)$

于是我们证明了

$$
\operatorname{lim}_{n \infty} n^{2}[\frac{e^{n}}{n}[ne^{n}(1 - r_{n}) - 1] - \frac{1}{2}] = - 1.
$$

练习7.17设二阶可微函数 $f :[1, + \infty) \to(0, + \infty)$ 满足

$$
f^{\prime \prime}(x) \leqslant 0, \operatorname{lim}_{x + \infty} f(x) = + \infty.\tag{7.39}
$$

求极限

$$
\operatorname{lim}_{s0^{+}} \sum_{n = 1}^{\infty} \frac{(- 1)^{n}}{f^{s}(n)}.
$$

笔记 本例非常经典,深刻体现了“拉格朗日中值定理保持阶不变”和“和式和积分”转化的思想。

证明 Step1先做一些简单的函数性态分析,条件(7.39)告诉我们f在趋于+o的上凸函数,而上凸函数只能递增，递减，先增后减这三个中发生一个，因此我们知道f一定在[1,+0)递增.

Step2接下来我们就可以专注于求极限了.事实上我们容易知道

$$
\operatorname{lim}_{s0^{+}} \sum_{n = 1}^{\infty} \frac{(- 1)^{n}}{f^{s}(n)} = \operatorname{lim}_{s0^{+}} \sum_{n = 1}^{\infty}[\frac{1}{f^{s}(2n)} - \frac{1}{f^{s}(2n - 1)}] = \operatorname{lim}_{s0^{+}} - s \sum_{n = 1}^{\infty} \frac{f^{\prime}(\theta_{n})}{f^{s + 1}(\theta_{n})},
$$

这里 $\theta_{n} \in \left(2n - 1, 2n \right), n = 1, 2, \cdot \cdot \cdot$ 来自拉格朗日中值定理，然后利用 $f^{\prime}$ 是递减函数，于是我们由拉格朗日中值定理保持阶不变的思想，严格来说即利用夹逼

$$
\operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty} \frac{f^{\prime} \left(2n - 1 \right)}{f^{s + 1} \left(2n - 1 \right)} \leqslant \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty} \frac{f^{\prime} \left(\theta_{n} \right)}{f^{s + 1} \left(\theta_{n} \right)} \leqslant \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty} \frac{f^{\prime} \left(2n \right)}{f^{s + 1} \left(2n \right)}.\tag{7.40}
$$

然后分别计算(7.40)中左边右边的极限即可发现他们是相等的10.所谓拉格朗日中值定理保持阶不变的思想，即可提前猜测

$$
\operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty}{\frac{f^{\prime} \left(\theta_{n} \right)}{f^{s + 1} \left(\theta_{n} \right)}} = \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty}{\frac{f^{\prime} \left(2n \right)}{f^{s + 1} \left(2n \right)}}.
$$

Step3现在我们注意到

$$
{\frac{d}{dx}}{\frac{f^{\prime} \left(x \right)}{f^{s + 1} \left(x \right)}} ={\frac{f^{\prime \prime} \left(x \right) f \left(x \right) - \left(s + 1 \right) f^{\prime} \left(x \right)}{f^{s + 2} \left(x \right)}} \leqslant 0.
$$

于是就有

$$
\operatorname{lim}_{s \to 0^{+}} - \frac{s}{2} \sum_{n = 2}^{\infty} \int_{2 \pi - 2}^{2n} \frac{f^{\prime}(x)}{f^{s + 1}(x)} dx - \operatorname{lim}_{s \to 0^{+}} s \frac{f^{\prime}(2)}{f^{s + 1}(2)} \leqslant \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty} \frac{f^{\prime}(2n)}{f^{s + 1}(2n)} \leqslant \operatorname{lim}_{s \to 0^{+}} - \frac{s}{2} \sum_{n = 1}^{\infty} \int_{2n}^{2n + 2} \frac{f^{\prime}(x)}{f^{s + 1}(x)} dx.
$$

因此

$$
\begin{array}{l}{{\displaystyle \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 2}^{\infty} \int_{2n - 2}^{2n} \frac{f^{\prime} \left(x \right)}{f^{s + 1} \left(x \right)} dx = \displaystyle \operatorname{lim}_{s \to 0^{+}} - s \sum_{n = 1}^{\infty} \int_{2n}^{2n + 2} \frac{f^{\prime} \left(x \right)}{f^{s + 1} \left(x \right)} dx = - \operatorname{lim}_{s \to 0^{+}} s \int_{2}^{\infty} \frac{f^{\prime} \left(x \right)}{f^{s + 1} \left(x \right)} dx}} \\{{= - \displaystyle \operatorname{lim}_{s \to 0^{+}} s \int_{f \left(2 \right)}^{\infty} \frac{1}{y^{s + 1}} dy = - 1,}} \end{array}
$$

于是我们证明了

$$
\operatorname{lim}_{s0^{+}} \sum_{n = 1}^{\infty} \frac{(- 1)^{n}}{f^{s}(n)} = - \frac{1}{2}.
$$

练习7.18设f是[0,+00）上的正值单调递减函数且 $\textstyle \int_{0}^{\infty} f(x) dx$ 收敛,证明

$$
\operatorname{lim}_{h0^{+}} h \sum_{n = 1}^{\infty} f(nh) = \int_{0}^{\infty} f(x) dx.
$$

<!-- image-->

笔记证明的想法是同样的,通过积分和和式关系得到.

证明 一方面,我们有

$$
h \sum_{n = 1}^{\infty} f \left(nh \right) \geqslant h \sum_{n = 1}^{\infty} \int_{n}^{n + 1} f \left(xh \right) dx = h \int_{1}^{\infty} f \left(xh \right) dx = \int_{h}^{\infty} f \left(y \right) dy.
$$

另外一方面,我们有

$$
h \sum_{n = 1}^{\infty} f \left(nh \right) \leqslant h \sum_{n = 1}^{\infty} \int_{n - 1}^{n} f \left(xh \right) dx = h \int_{0}^{\infty} f \left(xh \right) dx = \int_{0}^{\infty} f \left(y \right) dy.
$$

于是

$$
\int_{0}^{\infty} f(x) dx \geqslant \operatorname{lim}_{h0^{+}} h \sum_{n = 1}^{\infty} f(nh) \geqslant \operatorname{lim}_{h0^{+}} \int_{h}^{\infty} f(x) dx = \int_{0}^{\infty} f(x) dx,
$$

由夹逼准则即得

$$
\operatorname{lim}_{h0^{+}} h \sum_{n = 1}^{\infty} f(nh) = \int_{0}^{\infty} f(x) dx.
$$

例题7.44计算

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n}{\frac{n + 1}{2^{k} \left(n + 1 - k \right)}}.
$$

证明由 Stolz 定理8.1就有

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n}{\frac{n + 1}{2^{k} \left(n + 1 - k \right)}}{\overset{\ast \ast \ast}{=}} \operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n}{\frac{n + 1}{2^{n - k + 1} k}} = \operatorname{lim}_{n \to \infty}{\frac{n + 1}{2^{n + 1}}} \sum_{k = 1}^{n}{\frac{2^{k}}{k}} = \operatorname{lim}_{n \to \infty}{\frac{{\frac{2^{n}}{n}}}{{\frac{2^{n + 1}}{n + 1}} -{\frac{2^{n}}{n}}}} = \operatorname{lim}_{n \to \infty}{\frac{1}{{\frac{2n}{n + 1}} - 1}} = 1.
$$

例题7.45设 $x_{n}$ 是x=tanx从小到大排列的全部正根,设

$$
\operatorname{lim}_{n \infty} n(x_{n} - An - B) = C,
$$

求 A,B,C.

证明 事实上在有意义的时候必然有

$$
(\tan x - x)^{\prime} = \tan^{2} x \geqslant 0.
$$

结合

$$
\operatorname{lim}_{x \to(n \pi)^{+}}(\tan x - x) = - n \pi, \operatorname{lim}_{x \to \left({\frac{\pi}{2}} + n \pi \right)^{-}}(\tan x - x) = + \infty,
$$

我们知道

$$
x_{n} \in \left(n \pi,{\frac{\pi}{2}} + n \pi \right), n = 1, 2, \cdots.
$$

注意到

$$
x_{n} = \tan x_{n} = \tan \left(x_{n} - n \pi \right) \Rightarrow x_{n} = \arctan x_{n} + n \pi, n = 1, 2, \cdots.
$$

显然 $\operatorname{lim}_{n \to \infty}$ arctan $\begin{array}{r}{x_{n} = \frac{\pi}{2}} \end{array}$ ，于是

$$
x_{n} = \arctan{x_{n} + n \pi} ={\frac{\pi}{2}} + o \left(1 \right) + n \pi.
$$

进一步

$$
{\begin{array}{rl} &{x_{n} = \arctan x_{n} + n \pi ={\frac{\pi}{2}} + n \pi - \arctan{\frac{1}{x_{n}}} ={\frac{\pi}{2}} + n \pi - \arctan{\frac{1}{n \pi +{\frac{\pi}{2}} + o \left(1 \right)}}} \\ &{\quad ={\frac{\pi}{2}} + n \pi - \arctan \left({\frac{1}{n \pi}}{\frac{1}{1 +{\frac{1}{2n}} + o \left({\frac{1}{n}} \right)}} \right) ={\frac{\pi}{2}} + n \pi - \arctan \left({\frac{1}{n \pi}} + O \left({\frac{1}{n^{2}}} \right) \right)} \\ &{\quad ={\frac{\pi}{2}} + n \pi -{\frac{1}{n \pi}} + O \left({\frac{1}{n^{2}}} \right).} \end{array}}
$$

于是

$$
\operatorname{lim}_{n \infty} n(x_{n} -{\frac{\pi}{2}} - n \pi) = -{\frac{1}{\pi}},
$$

即 $\begin{array}{r}{A = \pi, B = \frac{\pi}{2}, C = - \frac{1}{\pi}} \end{array}$

我们来看函数 Stolz题型．注意函数Stolz题型可以直接运用定理12.9,但实际考试中可能针对具体题目进行书写过程反而会更容易些.我们仅举一例该如何书写,其余情况直接引用定理.

例题7.46解决如下问题

1.设 $\alpha > - 1$ ，计算 $\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} | \sin t | dt}{x^{\alpha + 1}}}$

2.计算 $\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x}{\frac{| \sin t |}{t}} dt}{\ln x}}$

3.计算 $\operatorname{lim}_{x + \infty}{\frac{1}{x}} \int_{0}^{x}(t -[t]) dt.$ ，这里[]表示向下取整函数.

注 注意第一题如果直接洛必达得

$$
\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} \left| \sin t \right| dt}{x^{\alpha + 1}}} = \operatorname{lim}_{x \to + \infty}{\frac{\left| \sin x \right|}{\alpha + 1}}{\mathcal{K}}{\mathcal{H}}{\widehat{\ddag}} \mathbb{\hat{\ddag}},
$$

因此无法运用洛必达,但也无法判断原本的极限,而需要其他方法确定其极限.

证明

1.Method1我们展示函数 Stolz 在具体题目中的细节书 $\Xi$ .对每个 $x \geqslant 0,$ ，存在唯一的 $n \in \mathbb{N},$ 使得

$$
\left(n - 1 \right) \pi \leqslant x < n \pi.\tag{7.41}
$$

于是由(7.41)夹逼得

$$
\operatorname{lim}_{n \to + \infty}{\frac{\int_{0}^{n \pi} t^{\alpha} \left| \sin t \right| dt}{(n - 1)^{\alpha + 1} \pi^{\alpha + 1}}} \geqslant \operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} \left| \sin t \right| dt}{x^{\alpha + 1}}} \geqslant \operatorname{lim}_{n \to + \infty}{\frac{\int_{0}^{(n - 1) \pi} t^{\alpha} \left| \sin t \right| dt}{n^{\alpha + 1} \pi^{\alpha + 1}}}.
$$

注意 $n^{\alpha + 1} \sim(n - 1)^{\alpha + 1}, n \to \infty$ ，故只需计算

$$
{\frac{1}{\pi^{\alpha + 1}}} \operatorname{lim}_{n \to + \infty}{\frac{\int_{0}^{n \pi} t^{\alpha} \left| \sin t \right| dt}{n^{\alpha + 1}}}.
$$

注意到

$$
\begin{array}{rl}{} &{\frac{1}{\pi^{\alpha + 1}} \underset{n + \infty}{\operatorname{lim}} \underset{n^{\alpha + 1}}{\iint} \frac{\int_{0}^{n \pi} t^{\alpha} | \sin t | dt}{\pi^{\alpha + 1}} = \frac{1}{\pi^{\alpha + 1}} \underset{n + \infty}{\operatorname{lim}} \underset{k = 1}{\overset{n}{\sum}} \frac{\int_{(k - 1) \pi}^{k \pi} | \sin t | dt}{\pi^{\alpha + 1}} = \frac{1}{\pi^{\alpha + 1}} \underset{n + \infty}{\operatorname{lim}} \underset{k = 1}{\overset{n}{\sum}} \frac{\int_{0}^{\pi}[t +(k - 1) \pi]^{\alpha} | \sin t | dt}{\pi^{\alpha + 1}}} \\{\geqslant} &{\frac{1}{\pi^{\alpha + 1}} \underset{n + \infty}{\operatorname{lim}} \underset{k = 1}{\overset{n}{\sum}} \frac{\int_{0}^{\pi}[(k - 1) \pi]^{\alpha} | \sin t | dt}{\pi^{\alpha + 1}} = \frac{2}{\pi} \underset{n + \infty}{\operatorname{lim}} \underset{k = 1}{\overset{n}{\sum}} \frac{(k - 1)^{\alpha}}{n^{\alpha + 1}}} \\ &{\mathrm{Sol}_{\alpha \geq \infty}^{\infty} \underset{\pi}{\overset{\alpha}{\sum}} \frac{\mathrm{lim}}{\pi} \underset{n + \infty}{\operatorname{lim}} \frac{n^{\alpha}}{(n + 1)^{\alpha + 1} - n^{\alpha + 1}} = \frac{2}{\pi(\alpha + 1)},} \end{array}
$$

以及

$$
\begin{array}{rl} &{\displaystyle \frac{1}{\pi^{\alpha + 1}} \operatorname{lim}_{n \to + \infty} \sum_{k = 1}^{n} \frac{\int_{0}^{\pi} \left[t +(k - 1) \pi \right]^{\alpha} \left| \sin t \right| dt}{n^{\alpha + 1}} \leqslant \frac{1}{\pi^{\alpha + 1}} \displaystyle \operatorname{lim}_{n \to + \infty} \sum_{k = 1}^{n} \frac{\int_{0}^{\pi} \left[\pi +(k - 1) \pi \right]^{\alpha} \left| \sin t \right| dt}{n^{\alpha + 1}}} \\ &{\quad = \frac{2}{\pi} \displaystyle \operatorname{lim}_{n \to + \infty} \sum_{k = 1}^{n} \frac{k^{\alpha}}{n^{\alpha + 1}} = \frac{2}{\pi} \displaystyle \operatorname{lim}_{n \to + \infty} \frac{n^{\alpha}}{n^{\alpha + 1} -(n - 1)^{\alpha + 1}} = \frac{2}{\pi \left(\alpha + 1 \right)},} \end{array}
$$

由夹逼定理就知道

$$
\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} \left| \sin t \right| dt}{x^{\alpha + 1}}} ={\frac{2}{\pi \left(\alpha + 1 \right)}}.
$$

Method2我们直接运用定理12.9,注意到有限区间不影响极限值，因此广义积分没什么好担心的，于是

$$
\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} \left| \sin t \right| dt}{x^{\alpha + 1}}} = \operatorname{lim}_{x \to + \infty}{\frac{\int_{x}^{x + \pi} t^{\alpha} \left| \sin t \right| dt}{\left(x + \pi \right)^{\alpha + 1} - x^{\alpha + 1}}} ={\frac{1}{\pi \left(\alpha + 1 \right)}} \operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{\pi} \left(x + \pi \right)^{\alpha} \left| \sin t \right| dt}{x^{\alpha}}},
$$

这里最后一个等号替换分母可以通过拉格朗日中值定理得到11.显然类似Method1我们可以通过把x放大放小为积分上下限来夹逼证明

$$
\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x} t^{\alpha} \left| \sin t \right| dt}{x^{\alpha + 1}}} ={\frac{2}{\pi \left(\alpha + 1 \right)}}.
$$

2．类似的，运用函数Stolz12.9和夹逼准则得

$$
\operatorname{lim}_{x \to + \infty}{\frac{\int_{0}^{x}{\frac{\left| \sin t \right|}{t}} dt}{\ln x}} = \operatorname{lim}_{x \to + \infty}{\frac{\int_{x}^{x + \pi}{\frac{\left| \sin t \right|}{t}} dt}{\ln \left(x + \pi \right) - \ln x}} ={\frac{1}{\pi}} \operatorname{lim}_{x \to + \infty} x \int_{0}^{\pi}{\frac{\sin t}{t + x}} dt ={\frac{2}{\pi}}.
$$

3．由函数 Stolz 定理12.9得

$$
\operatorname{lim}_{x \to + \infty}{\frac{1}{x}} \int_{0}^{x} \left(t - \left[t \right] \right) dt = \operatorname{lim}_{x \to + \infty}{\frac{1}{x + 1 - x}} \int_{x}^{x + 1} \left(t - \left[t \right] \right) dt = \int_{0}^{1} \left(t - \left[t \right] \right) dt ={\frac{1}{2}}.
$$

例题7.47设数列 $\left\{a_{n} \right\}$ 满足 $\operatorname{lim}_{n \to \infty} a_{2n}, \operatorname{lim}_{n \to \infty} a_{2n - 1} \operatorname{lim}_{n \to \infty} a_{3n}$ 收敛,证明 $\operatorname{lim}_{n \to \infty} a_{n}$ 收敛.

<!-- image-->

笔记证明的想法就是考虑公共子列.

证明注意到12

$$
\operatorname{lim}_{n \to \infty} a_{6n} = \operatorname{lim}_{n \to \infty} a_{2n} = \operatorname{lim}_{n \to \infty} a_{3n},
$$

以及

$$
\operatorname{lim}_{n \to \infty} a_{6n + 3} = \operatorname{lim}_{n \to \infty} a_{2n - 1} = \operatorname{lim}_{n \to \infty} a_{3n}.
$$

这就证明了

$$
\operatorname{lim}_{n \to \infty} a_{2n} = \operatorname{lim}_{n \to \infty} a_{2n - 1} = \operatorname{lim}_{n \to \infty} a_{3n},
$$

于是由命题6.4的第二个结论我们知道 $\operatorname{lim}_{n \to \infty} a_{n}$ 收敛.

例题7.48设 $f \left(x \right) \in C \left[0, 1 \right], f \left(x \right) > 0,$ 证明

$$
\operatorname{lim}_{n \to \infty}{\frac{\int_{0}^{1} f^{n + 1} \left(x \right) dx}{\int_{0}^{1} f^{n} \left(x \right) dx}} = \operatorname{max}_{\left[0, 1 \right]} f.
$$

证明回忆 Stolz 定理8.1的推论7.1.

$$
\begin{array}{c}{{\frac{a_{n + 1}}{a_{n}} = \displaystyle \frac{\int_{0}^{1} f^{n + 2} \left(x \right) dx \int_{0}^{1} f^{n} \left(x \right) dx}{\left(\int_{0}^{1} f^{n + 1} \left(x \right) dx \right)^{2}}}} \\{{= \displaystyle \frac{\int_{0}^{1} | f^{\frac{n + 2}{2}} \left(x \right) |^{2} dx \int_{0}^{1} | f^{\frac{n}{2}} \left(x \right) |^{2} dx}{\left(\int_{0}^{1} f^{n + 1} \left(x \right) dx \right)^{2}}}} \\{{\geqslant \displaystyle \frac{\left(\int_{0}^{1} f^{n + 1} \left(x \right) dx \right)^{2}}{\left(\int_{0}^{1} f^{n + 1} \left(x \right) dx \right)^{2}} = 1,}} \end{array}
$$

即 $a_{n}$ 递增，因此 $\operatorname{lim}_{n \to \infty} a_{n}$ 存在或为o，因此我们可以逆用 Stolz 定理8.1,即

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty} \sqrt[n]{\int_{0}^{1} f^{n} \left(x \right) dx}.
$$

设13

$$
\operatorname{argmax} f \left(x \right) = f \left(x_{0} \right), x_{0} \in \left[0, 1 \right],
$$

不失一般性，我们设 $x_{0} \in(0, 1)$ ，因此

$$
\left(\frac{1}{2n} \right)^{\frac{1}{n}} f \left(\theta_{n} \right) = \sqrt[n]{\int_{x_{0} - \frac{1}{n}}^{x_{0} + \frac{1}{n}} f^{n} \left(x \right) dx} \leqslant \sqrt[n]{\int_{0}^{1} f^{n} \left(x \right) dx} \leqslant \sqrt[n]{\int_{0}^{1} f^{n} \left(x_{0} \right) dx} = f \left(x_{0} \right).
$$

于是我们证明了

$$
\operatorname{lim}_{n \to \infty}{\frac{\int_{0}^{1} f^{n + 1} \left(x \right) dx}{\int_{0}^{1} f^{n} \left(x \right) dx}} = \operatorname{max}_{\left[0, 1 \right]} f.
$$

来看一些稍微复杂的例子,其来自美国数学月刊.

例题7.49设 $\operatorname{lim}_{n \to \infty} a_{n} \sum_{k = 1}^{n} a_{k}^{2} = 1$ ,计算 $\operatorname{lim}_{n \to \infty} \sqrt[3]{n} a_{n}$

证明 因为n充分大时 $a_{n} \sum_{k = 1}^{n} a_{k}^{2} > \frac{1}{2}$ ，所以不妨设 $a_{n} > 0$ 如果 $\operatorname{lim}_{n \to \infty} a_{n} \neq 0.$ 则 $\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n} a_{k}^{2} = \infty,$ 故 $\operatorname{lim}_{n \to \infty} a_{n} = 0.$ 矛盾！因此 $\operatorname{lim}_{n \to \infty} a_{n} = 0.$

注意到我们有替换

$$
a_{n} \sim \frac{1}{\displaystyle \sum_{k = 1}^{n} a_{k}^{2}}.\tag{7.42}
$$

于是

$$
\begin{array}{rl} &{\underset{n \infty}{\operatorname{lim}} \frac{1}{na_{n}^{3}} \overset{(\prime, 4^{2})}{=} \underset{n \infty}{\operatorname{lim}} \frac{(\displaystyle \sum_{k = 1}^{n} a_{k}^{2})^{3}}{n} st \underset{n \infty}{\operatorname{lim}}[(\displaystyle \sum_{k = 1}^{n + 1} a_{k}^{2})^{3} -(\displaystyle \sum_{k = 1}^{n} a_{k}^{2})^{3}] = \underset{n \infty}{\operatorname{lim}}(\displaystyle \sum_{k = 1}^{n} a_{k}^{2})^{3}[(\frac{a_{n + 1}^{2}}{\underset{k = 1}{\overset{\ldots}{\prod}}} + 1)^{3} - 1]} \\ &{\overset{\mathrm{if}}{=} \overset{\underset{n \infty}{\operatorname{lim}}} \frac{1}{n \infty}(\displaystyle \sum_{k = 1}^{n} a_{k}^{2})^{3} \frac{3a_{n + 1}^{2}}{\underset{k = 1}{\overset{\ldots}{\sum}}} = 3 \underset{n \infty}{\operatorname{lim}}(\displaystyle \sum_{k = 1}^{n} a_{k}^{2})^{2} a_{n + 1}^{2} = 3 \underset{n \infty}{\operatorname{lim}}(\displaystyle \sum_{k = 1}^{n + 1} a_{k}^{2} - a_{n + 1}^{2})^{2} a_{n + 1}^{2}} \\ & = 3 \underset{n \infty}{\operatorname{lim}}[(\displaystyle \sum_{k = 1}^{n + 1} a_{k}^{2})^{2} a_{n + 1}^{2} - 2a_{n + 1}^{4} \displaystyle \sum \end{array}
$$

因此我们有

$$
\operatorname{lim}_{n \infty} \sqrt[3]{n} a_{n} = \frac{1}{\sqrt[3]{3}}.
$$

我们来看一个类似的训练

练习7.19设 $a_{1} = 1, a_{n + 1} = a_{n} + \frac{1}{S_{n}}, S_{n} = \sum_{k = 1}^{n} a_{k},$ 计算 $\operatorname{lim}_{n \to \infty}{\frac{a_{n}}{\sqrt{\ln n}}}$

证明 显然 $a_{n}$ 正值递增,于是 $a_{n + 1}$ $a_{n} \geqslant 1 \Rightarrow S_{n} \geqslant n.$ 设 $\operatorname{lim}_{n \to \infty} a_{n} = A$ 故

$$
a_{n} \leqslant A \Rightarrow S_{n} \leqslant An \Rightarrow a_{n + 1} \geqslant a_{n} +{\frac{1}{An}} \Rightarrow a_{n + 1} \geqslant a_{1} +{\frac{1}{A}} \sum_{k = 1}^{n}{\frac{1}{k}} \to \infty,
$$

这里最后一个趋于见定义7.5.这是一个矛盾！因此 $\operatorname{lim}_{n \to \infty} a_{n} = + \infty$

由 Stolz8.1,我们知道

$$
\operatorname{lim}_{n \to \infty} \frac{a_{n}^{2}}{\ln n} = \operatorname{lim}_{n \to \infty} \frac{a_{n + 1}^{2} - a_{n}^{2}}{\frac{1}{n}} = \operatorname{lim}_{n \to \infty} n \left(a_{n + 1}^{2} - a_{n}^{2} \right).\tag{7.43}
$$

又

$$
\operatorname{lim}_{n \infty} \frac{a_{n + 1}}{a_{n}} = \operatorname{lim}_{n \infty}(1 + \frac{1}{a_{n} S_{n}}) = 1,
$$

故

$$
\begin{array}{rl}{(7.43)} &{= \underset{n \infty}{\operatorname{lim}} n \frac{a_{n + 1} + a_{n}}{S_{n}} = 2 \underset{n \infty}{\operatorname{lim}} n \frac{a_{n}}{S_{n}} \overset{\mathrm{Stolz}}{=} \overset{3}{=} 2 \underset{n \infty}{\operatorname{lim}} \frac{(n + 1) a_{n + 1} - na_{n}}{a_{n + 1}}} \\ &{\qquad = 2 \underset{n \infty}{\operatorname{lim}}(n + 1 - \frac{na_{n}}{a_{n + 1}}) = 2 + 2 \underset{n \infty}{\operatorname{lim}} n(1 - \frac{a_{n}}{a_{n + 1}}).} \end{array}\tag{7.44}
$$

利用

$$
n(1 - \frac{a_{n}}{a_{n + 1}}) = n(1 - \frac{1}{1 + \frac{1}{a_{n} S_{n}}}) = \frac{n}{1 + a_{n} S_{n}} \stackrel{S_{n} \geqslant n}{\leqslant} \frac{n}{1 + na_{n}} = \frac{1}{\frac{1}{n} + a_{n}} 0,
$$

我们有

$$
(7.44) = 2 + 2 \operatorname{lim}_{n \infty} n(1 -{\frac{a_{n}}{a_{n + 1}}}) = 2.
$$

因此我们得到 $\begin{array}{r}{\vec{\bigtriangledown} \underset{n \infty}{\operatorname{lim}} \frac{a_{n}}{\sqrt{\ln n}} = \sqrt{2}.} \end{array}$

例题7.50设 $k \in \mathbb N$ 且整数 $0 \leqslant p \leqslant k - 1$ 求

$$
\operatorname{lim}_{n \to \infty}{\frac{C_{kn}^{p} + C_{kn}^{p + k} + \cdots + C_{kn}^{p +(n - 1) k}}{2^{kn}}}.
$$

证明 我们记k次单位根全体为 $w_{j} = e^{\frac{2 \pi ij}{k}}, j = 0, 1, 2, \cdot \cdot \cdot, k - 1$ ．由二项式定理,对每个j,我们有

$$
(1 + w_{j})^{kn} = \sum_{i = 0}^{kn} C_{kn}^{i} w_{j}^{i} = 1 + \sum_{t = 0}^{k - 1} \sum_{s = 0}^{n - 1} C_{kn}^{t + sk} w_{j}^{t + sk} = 1 + \sum_{t = 0}^{k - 1} w_{j}^{t} \sum_{s = 0}^{n - 1} C_{kn}^{t + sk}.
$$

于是我们写成

$$
\left(\begin{array}{lllll}{w_{0}^{0}} &{w_{0}^{1}} &{w_{0}^{2}} &{\cdots} &{w_{0}^{k - 1}} \\{w_{1}^{0}} &{w_{1}^{1}} &{w_{1}^{2}} &{\cdots} &{w_{1}^{k - 1}} \\{\vdots} &{\vdots} &{\vdots} &{\ddots} &{\vdots} \\{w_{k - 1}^{0}} &{w_{k - 1}^{1}} &{w_{k - 1}^{2}} &{\cdots} &{w_{k - 1}^{k - 1}} \end{array} \right) \left(\begin{array}{l}{\displaystyle \sum_{s = 0}^{n - 1} C_{kn}^{sk}} \\{\displaystyle \sum_{s = 0}^{1} C_{kn}^{1 + sk}} \\{\vdots} \\{\displaystyle \sum_{s = 0}^{1} C_{kn}^{1 - 1}} \\{\displaystyle \sum_{s = 0}^{k - 1} C_{kn}^{k - 1 + sk}} \end{array} \right) = \left(\begin{array}{l}{\left(1 + w_{0} \right)^{kn} - 1} \\{\left(1 + w_{1} \right)^{kn} - 1} \\{\vdots} \\{\left(1 + w_{k - 1} \right)^{kn} - 1} \end{array} \right),
$$

即

$$
\frac{1}{2^{kn}} \left(\begin{array}{c}{\sum_{s = 0}^{n - 1} C_{kn}^{sk}} \\{\sum_{s = 0}^{n - 1} C_{kn}^{1 + sk}} \\{\vdots} \\{\sum_{s = 0}^{n} \zeta_{kn}^{k - 1 + sk}} \\{\vdots} \end{array} \right) = \left(\begin{array}{cccccc}{w_{0}^{0}} &{w_{0}^{1}} &{w_{0}^{2}} &{\cdots} &{w_{0}^{k - 1}} \\{w_{1}^{0}} &{w_{1}^{1}} &{w_{1}^{2}} &{\cdots} &{w_{1}^{k - 1}} \\{\vdots} &{\vdots} &{\vdots} &{\ddots} &{\vdots} \\{w_{k - 1}^{0}} &{w_{k - 1}^{1}} &{w_{k - 1}^{2}} &{\cdots} &{w_{k - 1}^{k - 1}} \end{array} \right)^{- 1} \left(\begin{array}{c}{\frac{(1 + w_{0})^{kn} - 1}{2^{kn}}} \\{\frac{(1 + w_{1})^{kn} - 1}{2^{kn}}} \\{\vdots} \\{\frac{(1 + w_{k - 1})^{kn} - 1}{2^{kn}}} \end{array} \right).
$$

于是

$$
\begin{array}{rl}{\underset{n \right.\infty}{\operatorname{lim}} \frac{1}{2^{kn}} \left(\begin{array}{l}{n - 1} \\{n - 2} \\{\kappa - 1} \\{\kappa - 1} \\{\kappa - 2} \\{\kappa - 1} \\{\hdots} \end{array} \right)} & = \frac{\left(\begin{array}{lllll}{w_{0}^{(1)}} &{w_{0}^{[1]}} &{w_{0}^{[2]}} &{\cdots} &{w_{0}^{[k - 1]}} \\{w_{1}^{[1]}} &{w_{1}^{[1]}} &{w_{1}^{[2]}} &{\cdots} &{w_{1}^{[k - 1]}} \\{\vdots} &{\vdots} &{\vdots} &{\ddots} &{\vdots} \\{w_{k - 1}^{[k]}} &{w_{k - 1}^{[k]}} &{w_{k - 1}^{[2]}} &{\cdots} &{w_{k - 1}^{[k - 1]}} \end{array} \right)^{- 1} \left(\begin{array}{l}{\frac{(\lambda + w_{0})^{k - 1}}{2^{k + 1}} - 1} \\{\frac{(\lambda + w_{1})^{k - 1}}{2^{k + 1}} - 1} \\{\vdots} \\{\frac{(\lambda + w_{k - 1})^{k - 1}}{2^{k + 1}}} \\{\frac{(\lambda + w_{k - 1})^{k - 1}}{2^{k + 1}} - 1} \end{array} \right)} \\ & = \left(\begin{array}{lllll}{w_{0}^{(1)}} &{w_{0}^{[1]}} &{w_{0}^{2}} &{\cdots} &{w_{0}^{[k - 1]}} \\{w_{1}^{[1]}} &{w_{1}^{[1]}} &{w_{1}^{[2]}} & \end{array} \end{array}
$$

又

$$
\left(\begin{array}{cccccc}{w_{0}^{0}} &{w_{0}^{1}} &{w_{0}^{2}} &{\cdots} &{w_{0}^{k - 1}} \\{w_{1}^{0}} &{w_{1}^{1}} &{w_{1}^{2}} &{\cdots} &{w_{1}^{k - 1}} \\{\vdots} &{\vdots} &{\vdots} &{\ddots} &{\vdots} \\{w_{k - 1}^{0}} &{w_{k - 1}^{1}} &{w_{k - 1}^{2}} &{\cdots} &{w_{k - 1}^{k - 1}} \end{array} \right) \left(\begin{array}{c}{\frac{1}{k}} \\{\frac{1}{k}} \\{\vdots} \\{\frac{1}{k}} \end{array} \right) = \left(\begin{array}{c}{\frac{1}{k} \sum_{j = 0}^{k - 1} w_{0}^{j}} \\{\frac{1}{k} \sum_{j = 0}^{k - 1}} \\{\vdots} \\{\vdots} \\{\frac{k}{k}} \end{array} \right) = \left(\begin{array}{c}{\frac{1}{k} \cdot k} \\{\frac{1}{k} \cdot \frac{1 - w_{1}^{k}}{1 - w_{1}}} \\{\vdots} \\{\frac{1}{k} \cdot \frac{1}{1 - w_{k - 1}^{k}}} \\{\vdots} \end{array} \right) = \left(\begin{array}{c}{1} \\{0} \\{\vdots} \\{0} \\{0} \end{array} \right),
$$

于是

$$
\operatorname{lim}_{n \to \infty} \frac{1}{2^{kn}} \left(\begin{array}{c}{\underset{s = 0}{\overset{n - 1}{\sum_{s = 0}^{n}}} C_{kn}^{sk}} \\{\underset{s = 0}{\overset{n - 1}{\sum_{s = 0}^{n}}} C_{kn}^{1 + sk}} \\{\vdots} \\{\underset{s = 0}{\overset{n - 1}{\sum_{s = 0}^{n}}} C_{kn}^{k - 1 + sk}} \end{array} \right) = \left(\begin{array}{c}{\frac{1}{k}} \\{\frac{1}{k}} \\{\vdots} \\{\frac{1}{k}} \end{array} \right) \Rightarrow \operatorname{lim}_{n \to \infty} \frac{C_{kn}^{p} + C_{kn}^{p + k} + \dots + C_{kn}^{p +(n - 1) k}}{2^{kn}} = \frac{1}{k}, \forall 0 \leqslant p \leqslant k - 1.
$$

## 第7章练习

1. (1.)计算

$$
\operatorname{lim}_{n \to \infty} \left({\frac{1}{n + 1}} +{\frac{1}{n + 2^{x}}} + \cdots +{\frac{1}{n + n^{x}}} \right), x \in(- \infty, + \infty).
$$

2. (2.)求 $\begin{array}{r}{\underset{n \infty}{\operatorname{lim}} \int_{0}^{\pi} \frac{| \sin((n + \frac{1}{2}) t) |}{t} dt} \end{array}$ 等价量.

3.(3.)设正值函数 $f \in C \left[0, 1 \right]$ ，证明

(1)：对每一个 $n \in{\mathbb{N}},$ 存在唯一的 $x_{0} < x_{1} < x_{2} < \dots < x_{n} \in[0, 1]$ ，使得

$$
\int_{x_{k - 1}}^{x_{k}} f \left(x \right) dx = \frac{1}{n} \int_{0}^{1} f \left(x \right) dx, \forall k = 1, 2, \cdot \cdot \cdot, n.
$$

(2):设 $\{x_{k}\}_{k = 0}^{n}$ 如(1)所定义，证明

$$
\operatorname{lim}_{n \infty}{\frac{1}{n}} \sum_{k = 0}^{n} f(x_{k}) ={\frac{\int_{0}^{1} f^{2}(x) dx}{\int_{0}^{1} f(x) dx}}.
$$

4.(4.)求 $\operatorname{lim}_{x \to 0}{\frac{\int_{0}^{x} \left[e^{\left(x - t \right)^{2}} - 1 \right] \sin tdt}{x \tan^{3} x}},$

5.(5.)计算极限

$$
\operatorname{lim}_{n \to \infty}{\frac{n + n^{\frac{1}{2}} + \cdots \cdot + n^{\frac{1}{n}}}{n}}.
$$

6.(6.)设非负数列 $x_{n}$ 满足

$$
2x_{n + 2} \leqslant x_{n + 1} + x_{n}, \forall n \in \mathbb{N},
$$

证明 $\operatorname{lim}_{n \to \infty} x_{n}$ 存在.

7. (7.,\*)计算

$$
\operatorname{lim}_{x \to 0^{+}}{\frac{x^{(\sin x)^{x}} - \left(\sin x \right)^{x^{\sin x}}}{x^{3}}}.
$$

8.(8.,\*)设 $x_{1} \in \left(0, 3 \right), x_{n + 1} = \sqrt{6 + x_{n}},$ 求极限 $\operatorname{lim}_{n \to \infty} 6^{n} \left(x_{n} - 3 \right)$

9. (9.) $a _ { n + 1 } = a _ { n } + \ln a _ { n } , a _ { 1 } = 2 $ 求极限 $\operatorname{lim}_{n \to \infty}{\frac{a_{n} - n \ln n}{n \ln \ln n}}$

10.(10.）设非负函数 $f, g \in C \left[a, b \right]$ 且 $g(x) > 0, \forall x \in[a, b]$ 则

$$
\operatorname{lim}_{n + \infty} \sqrt[n]{\int_{a}^{b} f^{n}(x) g(x) dx} = \operatorname{max}_{x \in[a, b]} f(x).\tag{7.45}
$$

且

$$
\operatorname{lim}_{n + \infty} \frac{\int_{a}^{b} f^{n + 1}(x) g(x) dx}{\int_{a}^{b} f^{n}(x) g(x) dx} = \operatorname{max}_{x \in[a, b]} f(x).\tag{7.46}
$$

此外如果 $g$ 非负且只可能有孤立的零点14,则(7.45)，(7.46)也成立.

11. (11.)证明

$$
\operatorname{lim}_{n \to \infty}{\frac{\displaystyle \sum_{k = 1}^{n} \sin{\sqrt{k}}}{n}} = \operatorname{lim}_{n \to \infty}{\frac{\displaystyle \sum_{k = 1}^{n} \cos{\sqrt{k}}}{n}} = 0.
$$

12.(12.)计算

$$
\operatorname{lim}_{x \to 0}{\frac{\tan \cdots \cdot \tan x - \underbrace{\sin \sin \cdots \cdot \sin x}_{{\widetilde{\Xi}} \widehat{\Xi} n \gg \varnothing \varnothing} x}{x^{3}}}.
$$

13.(13.)计算

$$
\operatorname{lim}_{x \to 0}{\frac{x - \arcsin \arcsin \cdot \cdot \cdot \arcsin{x}}{x \overbrace{x} \overbrace{z}}}.
$$

14. (14.)设

$$
\theta_{1} = 1, \theta_{2} = 2, \theta_{n + 1} = \theta_{n} - \frac{1}{n + 1} \theta_{n - 1}, n = 2, 3, \cdots,
$$

证明

$$
0 < n \theta_{n} - 3 < \frac{6}{n - 1}, \forall n \geqslant 3.
$$

15. (15.)设 $\operatorname{lim}_{n \to \infty}{\frac{1}{n}} \sum_{k = 1}^{n} a_{k} = A,$ 证明

$$
\operatorname{lim}_{n \to \infty}{\frac{1}{\ln n}} \sum_{k = 1}^{n}{\frac{a_{k}}{k}} = A.
$$

16.(16.)计算

$$
\operatorname{lim}_{k \to \infty}{\frac{1}{k^{m + 2}}} \sum_{i = 1}^{k} \sum_{j = 1}^{k} \left| i - j \right|^{m}.
$$

17.(17.)证明如下定理

14即 $g$ 零点处存在一个去心邻域没有零点.
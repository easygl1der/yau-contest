的定义.我们完成了定理6.7的证明.

## 6.6换序常用手法

下面的定理十分有趣．他严重超出非数学类大纲要求，但却能在你实在无奈的时候救你一命.他给出了一些合理的换序定理.实际做题中你无脑换序了．也不会扣多少分，如果不会证明换序,在带上下面一嘴，就有可能不丢分.第十届竞赛班学员在书写第十五届大学生数学竞赛非专业组的时候,第四个极限大题采用的控制收敛定理，但不符合规范的没有写出控制函数就得了9分，可以看到如果规范写出控制函数,说不定只会扣1-2分或者根本不扣分.

## 定理6.8(控制收敛定理)

设 $f \left(x, y \right) \in L^{1} \left(E \right), \forall y \in \Omega$ ，这里Ω是某个给定集合.若极限 $\operatorname{lim}_{y} \left| f \left(x, y \right) \right|, \forall x \in E$ 存在且存在 $g \in L^{1}(E)$ 使得

$$
\left| f \left(x, y \right) \right| \leqslant g \left(x \right), \forall x \in E, y \in \Omega.\tag{6.7}
$$

则

$$
\operatorname{lim}_{y} \int_{E} \left| f \left(x, y \right) \right| dx = \int_{E} \operatorname{lim}_{y} \left| f \left(x, y \right) \right| dx.\tag{6.8}
$$

注 $\operatorname{lim}_{u} | f \left(x, y \right) |$ 表示对y取任何一种极限.式(6.8)即积分极限交换顺序.注意到除去至多可数个点外9,不影响积分收敛性和数值,因此定理中的条件允许对至多可数个点不必满足.

笔记控制收敛定理的重点是找到绝对可积的控制函数g.这一步必须写出.

## 定理6.9 (fubini定理)

设 $f(x, y)$ 是集合 $E \times F$ 上的可测函数a,然后若f满足下列条件之一：

1. f(x,y)≥0,∀x,y∈E× F;

2. $f \in L^{1} \left(E \times F \right)$

则

$$
\int_{E} dx \int_{F} f \left(x, y \right) dy = \int_{F} dy \int_{E} f \left(x, y \right) dx = \int_{E \times F} f \left(x, y \right) dxdy.
$$

“非数学类无需理解名词”可测”只需知道这样的函数可以拿去做积分.

笔记 非数学无需阅读定理6.9，只需要记住非负函数和绝对可积函数无脑交换积分顺序即可．同样的至多可数个10f的点不影响积分.

## 定理6.10 (levi定理)

设 $f_{n} \left(x \right) \geqslant 0, n = 1, 2,$ .．是E上可测函数,若 $f_{n} \left(x \right) \leqslant f_{n + 1} \left(x \right)$ ,则有

$$
\operatorname{lim}_{n \infty} \int_{E} f_{n}(x) dx = \int_{E} \operatorname{lim}_{n \infty} f_{n}(x) dx.\tag{3}
$$

笔记非负递增可无脑换序,哪怕积分不收敛也无所谓.

8即和自然数集之间存在一一映射.

9实际上,可以除去0测集,非数学不必掌握.

10更完整的，除去0测集.

## 定理6.11(法图定理

设 $f_{n} \left(x \right)$ ≥0,𝑛＝1,2,是E上可测函数,则有

$$
\int_{E}{\frac{\operatorname{lim}}{n \to \infty}} f_{n} \left(x \right) dx \leqslant{\frac{\operatorname{lim}}{n \to \infty}} \int_{E} f_{n} \left(x \right) dx.\tag{}
$$

笔记用的比较少.

但是上述定理的离散版本却很容易直接在非数学框架下证明,并且极度适合作为基本的高等数学训练题．我们将内容后置.

## 第6章练习

1.(1.）利用单调有界定理证明闭区间套定理．即设 $\left[a_{n}, b_{n} \right] \supset \left[a_{n + 1}, b_{n + 1} \right], n = 1, 2, \cdot \cdot \cdot$ ，则存在唯一的二元对 $(c, d)$ ，使得 $a_{1} \leqslant c \leqslant d \leqslant b_{1}$ 且 $[c, d] = \bigcap_{n = 1}^{\infty}[a_{n}, b_{n}]$ ．特别的若 $\operatorname{lim}_{n \infty}(b_{n} - a_{n}) > 0.$ 则 $c < d.$ 若$\operatorname* { l i m } _ { n \to \infty } \left( b _ { n } - a _ { n } \right) = 0 \qquad $ 则 $c = d.$

2.(2.)本题命题6.3的更为一般的形式,对任何 $\epsilon > 0,$ 存在 $N \in \mathbb N$ ，使得

$$
f_{1} \left(n, \epsilon \right) \leqslant a_{n} \leqslant f_{2} \left(n, \epsilon \right), \forall n \geqslant N,\tag{6.9}
$$

这里

$$
\operatorname{lim}_{\epsilon 0^{+}} \operatorname{lim}_{n \infty} f_{2}(n, \epsilon) = \operatorname{lim}_{\epsilon 0^{+}} \operatorname{lim}_{n \infty} f_{1}(n, \epsilon) = A \in \mathbb{R}.
$$

证明 $\operatorname{lim}_{n \to \infty} a_{n} = A.$

# 第7章极限和渐近分析方法非数学类

## 内容提要

□余项的分析和计算7.1

Stolz 定理的应用 7.2

□递推数列方法7.3

□杂题7.4

## 7.1 余项的分析和计算

## 定义7.1（阶的比较）

1.称 $\begin{array}{r}{f = o(g), \# \# \operatorname{lim} \frac{f}{g} = 0.} \end{array}$

2.称 $f = O(g),{\mathcal{\downarrow}}{\mathfrak{a}}{\mathfrak{R}} | f | \leqslant C | g |.$

注 余项只能回到定义上操作,不能积分不能求导.余项不提供解决问题的方法,只简化书写.余项只能在你知道如何不用余项书写时才能用余项书写．余项表述有时候会产生歧义.初学者用余项的时候,每时每刻都必须验证余项是否正确.

## 定理7.1(Taylor 公式的 peano 余项)

设f在 $x = a$ 是n阶右可微的a.则

$$
\begin{array}{lll}{f \left(x \right)} &{=} &{\displaystyle \sum_{k = 0}^{n} \frac{f^{\left(k \right)} \left(a \right)}{k !} \left(x - a \right)^{k} + o \left(\left(x - a \right)^{n} \right), x \to a^{+}.} \end{array}\tag{7.1}
$$

$$
f \left(x \right) = \sum_{k = 0}^{n - 1}{\frac{f^{\left(k \right)} \left(a \right)}{k !}} \left(x - a \right)^{k} + O \left(\left(x - a \right)^{n} \right), x \to a^{+}.\tag{7.2}
$$

“即只考虑单侧的各阶导数，这也是为了实际运用需要.

注式(7.1),(7.2)的证明只能回到定义，即证存在 $\delta > 0$ 和 $C > 0,$ 使得

$$
\operatorname{lim}_{x \to a^{+}}{\frac{f \left(x \right) - \sum_{k = 0}^{n}{\frac{f^{\left(k \right)} \left(a \right)}{k !}} \left(x - a \right)^{k}}{\left(x - a \right)^{n}}} = 0.
$$

和

$$
\left| \frac{f \left(x \right) - \displaystyle \sum_{k = 0}^{n - 1} \frac{f^{\left(k \right)} \left(a \right)}{k !} \left(x - a \right)^{k}}{\left(x - a \right)^{n}} \right| \leqslant C, x \in \left[a, a + \delta \right].
$$

证明 反复洛必达得

$$
\begin{array}{rl}{\displaystyle \operatorname{lim}_{x \to a +} \frac{f \left(x \right) - \sum_{k = 0}^{n} \frac{f^{(k)} \left(a \right)}{k !} \left(x - a \right)^{k}}{\left(x - a \right)^{n}} = \displaystyle \operatorname{lim}_{x \to a +} \frac{f^{\prime} \left(x \right) - \frac{1}{k = 1} \frac{f^{(k)} \left(a \right)}{\left(k - 1 \right) !} \left(x - a \right)^{k - 1}}{n \left(x - a \right)^{n - 1}}} & \\{\displaystyle \quad} &{= \displaystyle \operatorname{lim}_{x \to a^{+}} \frac{f^{\prime \prime} \left(x \right) - \sum_{k = 2}^{n} \frac{f^{(k)} \left(a \right)}{\left(k - 2 \right) !} \left(x - a \right)^{k - 2}}{n \left(n - 1 \right) \left(x - a \right)^{n - 2}}} \\ &{\displaystyle \quad \cdots} \\ &{= \displaystyle \operatorname{lim}_{x \to a^{+}} \frac{f^{(n - 1)} \left(x \right) - f^{(n - 1)} \left(a \right) - f^{(n)} \left(a \right) \left(x - a \right)}{n ! \left(x - a \right)}} \\ &{= 0,} \end{array}
$$

这里最后一个等号不来自洛必达而是导数定义.这就完成了式(7.1)的证明.

又

$$
\left| \frac{f \left(x \right) - \sum_{k = 0}^{n - 1} \frac{f^{\left(k \right)} \left(a \right)}{k !} \left(x - a \right)^{k}}{\left(x - a \right)^{n}} \right| \leqslant \left| \frac{f \left(x \right) - \sum_{k = 0}^{n} \frac{f^{\left(k \right)} \left(a \right)}{k !} \left(x - a \right)^{k}}{\left(x - a \right)^{n}} \right| + \frac{\left| f^{\left(n \right)} \left(a \right) \right|}{n !}.
$$

因为收敛必有界和(7.1),我们知道 $\left|{\frac{f(x) - \sum_{k = 0}^{n}{\frac{f^{(k)}(a)}{k !}}(x - a)^{k}}{(x - a)^{n}}} \right|$ 在α的右邻域有界，因此这就证明了式(7.2).我们完成了定理7.1的证明.

<!-- image-->

笔记使用 taylor公式时,O余项可以把阶增大一点，有时候写出来会更简洁好看.

读者应该自行阅读和积累常用函数的taylor公式A.0.1.

例题 7.1计算

1.

2.

$$
\begin{array}{c}{{\displaystyle \operatorname{lim}_{x0} \frac{\cos \sin x - \cos x}{x^{4}}.}} \\{{\displaystyle}} \\{{\displaystyle \operatorname{lim}_{x + \infty}[(x^{3} - x^{2} + \frac{x}{2}) e^{\frac{1}{x}} - \sqrt{1 + x^{6}}].}} \end{array}
$$

3.设 $a > 0.$ 计算

$$
\operatorname{lim}_{n \infty} n^{2}[\sqrt[n]{a} - \sqrt[n + 1]{a}].
$$

4.设 $\operatorname{lim}_{x \to 0} f \left(x \right) = \operatorname{lim}_{x \to 0} g \left(x \right) = a > 0$ 计算

$$
\operatorname{lim}_{x \to 0}{\frac{\left[f \left(x \right) \right]^{g \left(x \right)} - \left[g \left(x \right) \right]^{f \left(x \right)}}{f \left(x \right) - g \left(x \right)}}.
$$

注此类初等求极限问题我们不再赘述.

证明

1.注意到

$$
\begin{array}{l}{\displaystyle \cosh x = \cos \left(x - \frac{1}{6} x^{3} + O \left(x^{5} \right) \right)} \\{= 1 - \frac{\left[x - \frac{1}{6} x^{3} + O \left(x^{5} \right) \right]^{2}}{2} + \frac{\left[x - \frac{1}{6} x^{3} + O \left(x^{5} \right) \right]^{4}}{24} + o \left[\left(x - \frac{1}{6} x^{3} + O \left(x^{5} \right) \right)^{4} \right]} \\{= 1 - \displaystyle \frac{x^{2}}{2} + \frac{x^{4}}{6} + \frac{x^{4}}{24} + o \left(x^{4} \right).} \end{array}
$$

以及

$$
\cos x = 1 -{\frac{x^{2}}{2}} +{\frac{x^{4}}{24}} + o \left(x^{4} \right).
$$

这就给出了

$$
\operatorname{lim}_{x \to 0}{\frac{\cos \sin x - \cos x}{x^{4}}} = \operatorname{lim}_{x \to 0}{\frac{{\frac{1}{6}} x^{4} + o \left(x^{4} \right)}{x^{4}}} ={\frac{1}{6}}.
$$

<!-- image-->

笔记第一次做题的时候一定记得检查余项哟～，熟练之后直接按代 $\bar{\lambda} \bar{\underline{{{\lambda}}}} \mathrm{taylor}((\cos(\sin(x)) \ – \cos(x)))$ 即可.

2.本题目标是展开到常数项，注意到为了运用 $\begin{array}{r}{\sqrt{1 + x} \ = \1 + \ \frac{x}{2} + o \left(\frac{x}{2} \right), x \ \to \0,} \end{array}$ ，我们需要提出 $x^{6}$ 使得对$\sqrt{1 + \frac{1}{x^{6}}}$ 展开，某种意义上来说本题是对 $x = \infty$ 进行展开.

$$
{\begin{array}{rl} &{\underset{x + \infty}{\operatorname{lim}}[(x^{3} - x^{2} +{\frac{x}{2}}) e^{\frac{1}{x}} -{\sqrt{1 + x^{6}}}]} \\ &{= \underset{x + \infty}{\operatorname{lim}}[(x^{3} - x^{2} +{\frac{x}{2}}) e^{\frac{1}{x}} - x^{3}{\sqrt{1 +{\frac{1}{x^{6}}}}}]} \\ &{= \underset{x + \infty}{\operatorname{lim}}[(x^{3} - x^{2} +{\frac{x}{2}})(1 +{\frac{1}{x}} +{\frac{1}{2x^{2}}} +{\frac{1}{6x^{3}}} + o({\frac{1}{x^{3}}})) - x^{3}(1 +{\frac{1}{2x^{6}}} + o({\frac{1}{x^{6}}}))]} \\ &{= \underset{x + \infty}{\operatorname{lim}}[(x^{3} - x^{2} +{\frac{x}{2}})(1 +{\frac{1}{x}} +{\frac{1}{2x^{2}}} +{\frac{1}{6x^{3}}}) - x^{3} -{\frac{1}{2x^{3}}} + o(1)]} \\ &{= \underset{x + \infty}{\operatorname{lim}}({\frac{1}{6}} +{\frac{1}{12x}} -{\frac{1}{2x^{3}}})} \\ &{={\frac{1}{6}}.} \end{array}}
$$

<!-- image-->

3．笔记 看到拉中结构可以使用拉中,此外积累想法，中值定理可能保持阶不变.

由拉格朗日中值定理,存在 $\textstyle \theta_{n} \in \left({\frac{1}{n + 1}},{\frac{1}{n}} \right)$ ，使得

$$
a^{\frac{1}{n}} - a^{\frac{1}{n + 1}} = \ln a \cdot a^{\theta_{n}} \cdot \left({\frac{1}{n}} -{\frac{1}{n + 1}} \right) ={\frac{\ln a \cdot a^{\theta_{n}}}{n \left(n + 1 \right)}}.
$$

于是

$$
\operatorname{lim}_{n \to \infty} n^{2} \left(a^{\frac{1}{n}} - a^{\frac{1}{n + 1}} \right) = \operatorname{lim}_{n \to \infty} n^{2} \cdot \frac{\ln a \cdot a^{\theta_{n}}}{n \left(n + 1 \right)} = \ln a,
$$

这里用到了

$$
0 = \operatorname{lim}_{n \to \infty} \frac{1}{n + 1} \leqslant \operatorname{lim}_{n \to \infty} \theta_{n} \leqslant \operatorname{lim}_{n \to \infty} \frac{1}{n} = 0 \Rightarrow \operatorname{lim}_{n \to \infty} \theta_{n} = 0.
$$

4.事实上

$$
\begin{array}{rl}{\underset{j = 1}{\overset{\mathrm{inim}}{\mathop{:}}} \frac{\left[f \left(x \right) \right]^{\left(\alpha + 1 \right)} - \left[\beta \left(x \right) \right]^{\left(\ell + 1 \right)}}{j \left(z \right) - y \left(z \right)} = \underset{x = s - 1}{\overset{\mathrm{inim}}{\operatorname{inim}}} \frac{f \left(x \right)^{\left(\alpha + 1 \right)} H^{\left(\alpha + 1 \right)} \left(x^{\alpha + 1}}{j \\right)left(z \right) - y} e^{\left(i \alpha \right)}} \\ & \quad - \underset{x = s - 1}{\overset{\mathrm{inim}}{\operatorname{inim}}} e^{\left(i \left(\frac{1}{\alpha} \right) \right) \cdot \frac{\left(1 \right)}{\alpha} \cdot \frac{\left(1 \right)}{\alpha} \cdot \frac{\left(1 \right)}{\alpha} \cdot \frac{\left(1 \right)}{\alpha} \cdot \left(\frac{1}{\alpha} \right) \cdot \left(\frac{1}{\alpha} \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right)} \\ &{\quad - e^{\left(\alpha + 1 \right)} \frac{\mathrm{inim}}{\alpha} g \left(z \right) \ln \left(x^{\alpha + 1} \int \left(x \right)^{\alpha} f \left(x \right)} \\ & \right) \quad - e^{\left(\alpha + 1 \right)} \frac \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right) \cdot \left(1 \right.\end{array}
$$

## 命题7.1(a”型估计)

设 $\begin{array}{r}{a_{n} = 1 + \frac{a}{n} + \frac{b}{n^{2}} + o \left(\frac{1}{n^{2}} \right)} \end{array}$ ，证明

$$
a_{n}^{n} = e^{a} +{\frac{e^{a} \left(b -{\frac{a^{2}}{2}} \right)}{n}} + o \left({\frac{1}{n}} \right).
$$

<!-- image-->

笔记本结果主要为后续简化计算服务.本结果即表明

$$
\operatorname{lim}_{n \infty} n(a_{n}^{n} - e^{a}) = e^{a}(b -{\frac{a^{2}}{2}}).
$$

证明利用 $\begin{array}{r}{a_{n} - 1 \sim \frac{a}{n}, \ln{(1 + x)} \sim x} \end{array}$ ，我们有

$$
\operatorname{lim}_{n \to \infty} a_{n}^{n} = \operatorname{lim}_{n \to \infty} e^{n \ln a_{n}} = \operatorname{lim}_{n \to \infty} e^{n{\frac{a}{n}}} = e^{a}.
$$

进一步，我们考虑

$$
\begin{array}{rl}{\underset{n \to \infty}{\operatorname{lim}} ~ n(n_{n}^{*} - c^{2}) = \underset{n \to \infty}{\operatorname{lim}} ~ n(e^{i \pi \mathrm{I}(1 + \frac{c}{2} + \frac{b}{n} + \sigma_{n}^{2} +(\frac{1}{n^{2}})) - c^{\alpha}})} \\ &{= \underset{n \to \infty}{\operatorname{lim}} ~ e^{i \pi \mathrm{I}(1 - \frac{c}{2} + \frac{b}{n} + \sigma_{n}^{2} +(\frac{1}{n^{2}})) - \omega} - 1)} \\ &{= \underset{n \to \infty}{\operatorname{lim}} ~ e^{\mathrm{in} \pi \mathrm{I}[\pi \mathrm{I}[1 + \frac{a}{2} + \frac{b}{n^{2}} + \sigma(\frac{1}{n^{2}})] - a]}} \\ &{= \underset{n \to \infty}{\operatorname{lim}} ~ e^{\mathrm{in} \pi^{*} \mathrm{I}[\pi^{2} \mathrm{I}[1 + \frac{a}{2} + \frac{b}{n^{2}} + \sigma(\frac{1}{n^{2}})] - a]} \cdot} \\ & = \underset{n \to \infty}{\operatorname{lim}} ~ e^{\mathrm{in} \pi^{*} \mathrm{I}[\pi^{2}[\frac{a}{n} + \frac{b}{n^{2}} + \sigma(\frac{1}{n^{2}}) - 1][\frac{a}{n^{2}} + \frac{b}{n^{2}} + \sigma(\frac{1}{n^{2}})]^{2} + o(\frac{1}{n^{2}})] - on]} \\ & = \underset{n \to \infty}{\operatorname{lim}} ~ e^\mathrm \end{array}
$$

我们来看一组要处理余项的求极限题.

例题7.2

1.

$$
\operatorname{lim}_{x \to 0}{\frac{x - \underbrace{\sin \sin \cdot \cdot \cdot \sin}_{n \nmid \mathrm{\hat{x}} \mathrm{\hat{z}}}}{x^{3}}}.
$$

2.

$$
\operatorname{lim}_{x \to 0}{\frac{1 - \cos x \cos(2x) \cdot \cdot \cdot \cos(nx)}{x^{2}}}.
$$

3.考虑 $f_{n} \left(x \right) = \underbrace{\sin \sin \cdot \cdot \cdot \sin}_{n \mathrm{\uparrow \uparrow} \mathrm{\uparrow \uparrow}} x$ ，证明

$$
\sqrt{f_{n} \left(x \right)} = \sqrt{x} - \frac{nx^{\frac{5}{2}}}{12} + o \left(x^{\frac{5}{2}} \right).
$$

证明

1.考虑 $f_{n} \left(x \right) = \underbrace{\sin \sin \cdot \cdot \cdot \sin}_{n \rangle \mathrm{\mathcal{K}} \mathrm{\mathcal{E}}} x$ ，我们先证明

$$
f_{n} \left(x \right) = x - \frac{n}{6} x^{3} + o \left(x^{3} \right).\tag{7.3}
$$

当n=1显然成立,设n=k成立,则

$$
\begin{array}{l}{f_{k + 1} \left(x \right) = \sin \left(x - \displaystyle \frac{k}{6} x^{3} + o \left(x^{3} \right) \right)} \\{\displaystyle = x - \displaystyle \frac{k}{6} x^{3} + o \left(x^{3} \right) - \displaystyle \frac{1}{6} \left(x - \displaystyle \frac{k}{6} x^{3} + o \left(x^{3} \right) \right)^{3} + o \left(\left(x - \displaystyle \frac{k}{6} x^{3} + o \left(x^{3} \right) \right)^{3} \right)} \\{\displaystyle = x - \displaystyle \frac{k}{6} x^{3} - \displaystyle \frac{1}{6} x^{3} + o \left(x^{3} \right)} \\{\displaystyle = x - \displaystyle \frac{k + 1}{6} x^{3} + o \left(x^{3} \right),} \end{array}
$$

这样我们就证明了(7.3).

于是

$$
\operatorname{lim}_{x \to 0}{\frac{x - \underbrace{\sin \sin \cdots \cdot \sin}_{n \gg k} x}{x^{3}}} ={\frac{n}{6}}.
$$

2.注意到 $\begin{array}{r}{\cos{(kx)} = 1 - \frac{k^{2} x^{2}}{2} + o \left(x^{2} \right)} \end{array}$ ,k∈N,我们有

$$
\prod_{k = 1}^{n} \cos \left(kx \right) = 1 - \frac{\displaystyle \sum_{k = 1}^{n} k^{2}}{2} x^{2} + o \left(x^{2} \right) = 1 - \frac{n \left(n + 1 \right) \left(2n + 1 \right)}{12} x^{2} + o \left(x^{2} \right),\tag{7.4}
$$

于是

$$
\operatorname{lim}_{x \to 0}{\frac{1 - \cos x \cos \left(2x \right) \cdot \cdot \cdot \cos \left(nx \right)}{x^{2}}} ={\frac{n \left(n + 1 \right) \left(2n + 1 \right)}{12}}.
$$

笔记 仔细理解式(7.4),乘积中每个括号各取一项,除去都取常数，或者仅有一项取二次项,其余全部取常数外,其余取法的阶都会被吸收进余项.如果还是不知道怎么来的，不妨试试cOSxCos 2x,COsxcCos 2x cos 4x无脑打开括号看看长什么样子.

3．现在运用(7.3),我们就有

$$
\begin{array}{l}{\sqrt{f_{n} \left(x \right)} = \sqrt{x - \displaystyle \frac{n}{6} x^{3} + o \left(x^{3} \right)} = \sqrt{x} \cdot \sqrt{1 - \displaystyle \frac{n}{6} x^{2} + o \left(x^{2} \right)}} \\{= \sqrt{x} \cdot \left(1 + \displaystyle \frac{1}{2} \left(- \displaystyle \frac{n}{6} x^{2} + o \left(x^{2} \right) \right) + o \left(- \displaystyle \frac{n}{6} x^{2} + o \left(x^{2} \right) \right) \right)} \\{= \sqrt{x} \cdot \left(1 - \displaystyle \frac{n}{12} x^{2} + o \left(x^{2} \right) \right)} \\{= \sqrt{x} - \displaystyle \frac{nx^{\frac{5}{2}}}{12} + o \left(x^{\frac{5}{2}} \right),} \end{array}
$$

于是

$$
\operatorname{lim}_{x0}{\frac{\sqrt{f_{n}(x)} - \sqrt{x}}{x^{\frac{5}{2}}}} = -{\frac{n}{12}}.
$$

我们来看个全国大学生数学竞赛真题的证明.

例题7.3计算

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n - 1} \left(1 +{\frac{k}{n}} \right) \sin{\frac{k \pi}{n^{2}}}.
$$

注 有读者给出了如下证明方法：他不知道为什么是 $\begin{array}{r}{\sin \frac{k \pi}{n^{2}} = \frac{k \pi}{n^{2}} + o \left(\frac{1}{n^{2}} \right)} \end{array}$ ，因为用到的是 $\sin x = x + o(x)$ ，而$k = n - 1$ 的时候是

$$
o \left(\frac{\left(n - 1 \right) \pi}{n^{2}} \right) = o \left(\frac{1}{n} \right) \neq o \left(\frac{1}{n^{2}} \right).
$$

【例1.9】（首届全国大学生数学竞赛决赛试题）求极限

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n - 1} \left(1 +{\frac{k}{n}} \right) \sin{\frac{k \pi}{n^{2}}}.
$$

解析利用泰勒展开式和定积分定义

$$
\begin{array}{rl}{{\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{\lfloor + \frac{k}{n} \rfloor} \Big(1 + \frac{k}{n} \Big) \sin \frac{k \pi}{n^{2}} = \operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n - 1} \Big(1 + \frac{k}{n} \Big) \Big[\frac{k \pi}{n^{2}} + o \Big(\frac{1}{n^{2}} \Big) \Big]} \quad ~} &{} \\ &{= \operatorname{lim}_{n \to \infty} \Big[\pi \sum_{k = 1}^{\pi - 1} \Big(1 + \frac{k}{n} \Big) \cdot \frac{k}{n} \cdot \frac{1}{n} + o \Big(\frac{1}{n} \Big) \Big]} \\ &{= \operatorname{lim}_{n \to \infty} \sum_{k = 0}^{\pi - 1} \Big(1 + \frac{k}{n} \Big) \cdot \frac{k}{n} \cdot \frac{1}{n} = \pi \Big]_{0}^{1}(1 + x) xdx = \frac{5 \pi}{6}.} \end{array}
$$

评注：本题若直接用定积分定义，将很难分离出代表区间长度的项 $\frac{1}{n}$ ，故先用泰勒展

14

其实这里用到的是 $\sin x = x + 0x^{2} + o \left(x^{2} \right)$ ,因此

$$
o \left(\frac{\left(n - 1 \right)^{2} \pi}{n^{4}} \right) = o \left(\frac{1}{n^{2}} \right).
$$

<!-- image-->

笔记有读者猜到本题可以直接把 $\sin x \sim x,$ 但这样没有任何定理可以保证你在本题这么做.注意使用余项书写的人一定知道不用余项该怎么书写,否则你就不能使用余项,余项是简写手段而非解决问题的技术.证明 注意到 $\sin x = x + o \left(x^{2} \right)$ ，由余项的定义,对任何 $\epsilon > 0,$ 存在 $\delta > 0,$ 使得

$$
x - \epsilon x^{2} \leqslant \sin x \leqslant x + \epsilon x^{2}, \forall x \in[- \delta, \delta].\tag{7.5}
$$

现在当 $\begin{array}{r}{n >{\frac{\pi}{\delta}}} \end{array}$ ，我们有 $\begin{array}{r}{\frac{k \pi}{n^{2}} \in \left[- \delta, \delta \right], \forall k = 1, 2, \cdot \cdot \cdot, n - 1} \end{array}$ ，因此运用不等式(7.5)夹逼得

$$
\begin{array}{rl}{\displaystyle \sum_{k = 1}^{n - 1} \left(1 + \frac{k}{n} \right) \sin \frac{k \pi}{n^{2}} \leqslant \displaystyle \sum_{k = 1}^{n - 1} \left(1 + \frac{k}{n} \right) \left(\frac{k \pi}{n^{2}} + \epsilon \frac{k^{2} \pi^{2}}{n^{4}} \right)} &{} \\{\displaystyle \leqslant \displaystyle \sum_{k = 1}^{n} \left(1 + \frac{k}{n} \right) \left(\frac{k \pi}{n^{2}} + \epsilon \frac{\pi^{2}}{n^{2}} \right)} &{} \\{\displaystyle \leqslant \frac{\pi}{n} \sum_{k = 1}^{n} \left(1 + \frac{k}{n} \right) \frac{k}{n} + \frac{\epsilon \pi^{2}}{n^{2}} \sum_{k = 1}^{n} \left(1 + \frac{n}{n} \right)} &{} \\{\displaystyle = \frac{\pi}{n} \sum_{k = 1}^{n} \left(1 + \frac{k}{n} \right) \frac{k}{n} + \frac{2 \epsilon \pi^{2}}{n}.} \end{array}
$$

以及

$$
\begin{array}{rl}{{\sum_{k = 1}^{n - 1}(1 + \frac{k}{n}) \sin \frac{k \pi}{n^{2}} \geqslant \sum_{k = 1}^{n - 1}(1 + \frac{k}{n})(\frac{k \pi}{n^{2}} - \epsilon \frac{k^{2} \pi^{2}}{n^{4}})}} \\ &{\geqslant \sum_{k = 1}^{n - 1}(1 + \frac{k}{n})(\frac{k \pi}{n^{2}} - \epsilon \frac{\pi^{2}}{n^{2}})} \\ &{= \frac{\pi}{n} \sum_{k = 1}^{n - 1}(1 + \frac{k}{n}) \frac{k}{n} - \frac{\epsilon \pi^{2}}{n^{2}} \sum_{k = 1}^{n - 1}(1 + \frac{k}{n})} \\ &{\geqslant \frac{\pi}{n} \sum_{k = 1}^{n - 1}(1 + \frac{k}{n}) \frac{k}{n} - \frac{2 \epsilon \pi^{2}}{n}.} \end{array}
$$

于是我们有

$$
\begin{array}{r}{\displaystyle \operatorname{lim}_{n \infty} \sum_{k = 1}^{n - 1}(1 + \frac{k}{n}) \sin \frac{k \pi}{n^{2}} \leqslant \pi \int_{0}^{1} x(1 + x) dx = \frac{5 \pi}{6}.} \end{array}\tag{7.6}
$$

$$
\begin{array}{r}{\underset{n \infty}{\operatorname{lim}} \overset{n^{- 1}}{\sum}(1 + \frac{k}{n}) \sin \frac{k \pi}{n^{2}} \geqslant \pi \int_{0}^{1} x(1 + x) dx = \frac{5 \pi}{6}.} \end{array}\tag{7.7}
$$

结合式(7.6)和(7.7)和夹逼准则，我们有

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n - 1} \left(1 +{\frac{k}{n}} \right) \sin{\frac{k \pi}{n^{2}}} = \pi \int_{0}^{1} x \left(1 + x \right) dx ={\frac{5 \pi}{6}}.
$$

接下来我们可以随意使用余项来计算基础极限题.

## 例题7.4

1.计算

$$
\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{n +{\sqrt{k}}}} \right)^{n}.
$$

2.计算

$$
\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{\sqrt{n^{2} + k}}} \right)^{n}.
$$

证明

<!-- image-->

.笔记注意到 $\begin{array}{r}{\frac{\sqrt{k}}{n} \leqslant \frac{1}{\sqrt{n}} 0} \end{array}$ ，所以可以走Taylor公式.

注意到

$$
\begin{array}{rl}{\frac{\partial}{\partial x_{i}} - \frac{1}{\hbar + \sqrt{\hbar}}} &{= \frac{1}{8} \sum_{i = 1}^{N} \frac{1}{2 + 4^{N} \hbar}} \\ &{= \frac{1}{\hbar} \sum_{i = 1}^{N} \Bigg(1 - \frac{\frac{\partial}{\partial x_{i}}}{\partial x_{i}} + \frac{\partial}{\partial x_{i}}(\frac{\partial \langle \Psi \Psi \rangle}{\partial x_{i}}) \Bigg)} \\ &{= - \frac{1}{8} \sum_{i = 2}^{N} \Bigg(1 - \frac{\frac{\partial}{\partial x_{i}}}{\partial x_{i}}(\begin{array}{lll}{1} &{\frac{\partial}{\partial x_{i}}} &{0} \\{1} &{\frac{\partial}{\partial x_{i}}} &{0} \\{1} &{\frac{\partial}{\partial x_{i}}} &{0} \end{array}) \Bigg)} \\ &{= - \frac{1}{8} \sum_{i = 3}^{N} \Bigg(1 - \frac{\frac{\partial}{\partial x_{i}}}{\partial x_{i}}(1 - \frac{\partial}{\partial x_{i}})(\begin{array}{l}{1} \\{\partial x_{i}} &{0} \end{array})} \\ &{= \frac{1}{8}(\begin{array}{lll}{1} &{\frac{\partial}{\partial x_{i}}(1 - \frac{\partial}{\partial x_{i}})} &{0} \\{0} &{\frac{\partial}{\partial x_{i}}(1 - \frac{\partial}{\partial x_{i}})} &{0} \end{array})} \\ & = \frac{1}{8}(\begin{array}{l}{1 - \frac{\frac{\partial}{\partial x_{i}} \sqrt{\partial x_{i}}}{\partial x_{i}} + \frac{\partial}{\partial x_{i}}} \end{array} \end{array}
$$

这里倒数第二个等号如果用 Stolz定理8.1:

$$
\operatorname{lim}_{n \to \infty}{\frac{\displaystyle{\sum_{k = 1}^{n} \sqrt{k}}}{n \sqrt{n}}} = \operatorname{lim}_{n \to \infty}{\frac{\sqrt{n}}{n^{\frac{3}{2}} - \left(n - 1 \right)^{\frac{3}{2}}}} ={\frac{2}{3}} \Leftrightarrow \sum_{k = 1}^{n}{\sqrt{k}} ={\frac{2}{3}} n{\sqrt{n}} + o \left(n{\sqrt{n}} \right),
$$

但这样阶不够精 $\yen 1$ ，我们需要更强的工具,即定理8.9,有

$$
\operatorname{lim}_{n \to \infty} n \left(\frac{\sum_{k = 1}^{n} \sqrt{k}}{n \sqrt{n}} - \int_{0}^{1} \sqrt{x} dx \right) = \frac{\sqrt{1} - \sqrt{0}}{2} = \frac{1}{2} \Rightarrow \sum_{k = 1}^{n} \sqrt{k} = \frac{2}{3} n \sqrt{n} + \frac{\sqrt{n}}{2} + o \left(\sqrt{n} \right).
$$

因此

$$
\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{n +{\sqrt{k}}}} \right)^{n} = \operatorname{lim}_{n \to \infty} e^{n \ln \left(1 -{\frac{2}{3{\sqrt{n}}}} +{\cal O} \left({\frac{1}{n^{\frac{3}{2}}}} \right) \right)} = \operatorname{lim}_{n \to \infty} e^{-{\frac{2}{3}}{\sqrt{n}} +{\cal O} \left({\frac{1}{n^{\frac{1}{2}}}} \right)} = 0.
$$

2.利用

$$
\frac{1}{\sqrt{1 + x}} = 1 - \frac{x}{2} + O \left(x^{2} \right),
$$

我们有

$$
\sum_{k = 1}^{n}{\frac{1}{\sqrt{n^{2} + k}}} ={\frac{1}{n}} \sum_{k = 1}^{n}{\frac{1}{\sqrt{1 +{\frac{k}{n^{2}}}}}} ={\frac{1}{n}} \sum_{k = 1}^{n} \left(1 -{\frac{k}{2n^{2}}} + O \left({\frac{k^{2}}{n^{4}}} \right) \right) = 1 -{\frac{n + 1}{4n^{2}}} + O \left({\frac{1}{n^{2}}} \right) = 1 -{\frac{1}{4n}} + O \left({\frac{1}{n^{2}}} \right).
$$

因此

$$
\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{\sqrt{n^{2} + k}}} \right)^{n} = \operatorname{lim}_{n \to \infty} e^{n \ln \left[1 -{\frac{1}{4n}} + O \left({\frac{1}{n^{2}}} \right) \right]} = e^{-{\frac{1}{4}}}.
$$

我们给一个用余项判断收敛性的例子.回忆课本结论 $\sum_{k = 1}^{\infty} \left| a_{k} \right| < \infty$ 则 $\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n} a_{k} = \sum_{k = 1}^{\infty} a_{k}$ 收敛.

例题7.5证明 $\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{k}} - \ln n \right)$ 存在.

笔记我们称 $\gamma \triangleq \operatorname{lim}_{n \infty}(\sum_{k = 1}^{n}{\frac{1}{k}} - \ln n)$ 为欧拉常数.

证明运用Taylor公式7.1,我们有

$$
x + \ln(1 - x) = O(x^{2}), x0.
$$

于是

$$
\begin{array}{l}{{\displaystyle \operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n} \frac 1k - \ln n \right) = 1 + \operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n} \left(\frac 1k - \ln \frac k{k - 1} \right) = 1 + \operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n} \left(\frac 1k + \ln \left(1 - \frac 1k \right) \right)}} \\{{\displaystyle = 1 + \operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n} O \left(\frac 1k \right).}} \end{array}
$$

现在由命题7.4知

$$
\sum_{k = 2}^{n} \left| O \left({\frac{1}{k^{2}}} \right) \right| \leqslant M \sum_{k = 2}^{\infty}{\frac{1}{k^{2}}} < \infty.
$$

我们知道 $\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{k}} - \ln n \right)$ 存在.

1虽然也能算出答案.

## 7.2 Stolz 定理的应用

笔记正如定理8.1的笔记所说,stolz定理有着很强降阶作用,他是洛必达法则的离散版本.和洛必达有着类似的效果.

例题7.6设 $\operatorname{lim}_{n \infty} n(a_{n} - 100) = 100$ 计算

$$
\operatorname{lim}_{n \infty} n(\frac{\displaystyle \sum_{j = 1}^{n} j^{2} a_{j}}{n^{3}} - \frac{100}{3}) = 100.
$$

证明 运用 Stolz 定理8.1,我们知道

$$
{\begin{array}{rl} &{\underbrace{{\sum_{n}^{2}} j^{2} a_{j} -{\frac{100}{3}} n^{3}}_{n \to \infty} = \operatorname{lim}_{n \to \infty} \frac{\left(n + 1 \right)^{2} a_{n + 1} -{\frac{100}{3}} \left(n + 1 \right)^{3} +{\frac{100}{3}} n^{3}}{\left(n + 1 \right)^{2} - n^{2}}} \\ &{\qquad = \operatorname{lim}_{n \to \infty} \frac{\left(n + 1 \right) a_{n + 1} -{\frac{100}{3}} \left(n + 1 \right)^{2} +{\frac{100}{3}} \frac{n^{3}}{\left(n + 1 \right)}}{\frac{2n + 1}{n + 1}}} \\ &{\qquad = \operatorname{lim}_{n \to \infty} \frac{\left(n + 1 \right) \left(a_{n + 1} - 100 \right) + 100 \left(n + 1 \right) -{\frac{100}{3}} \left(n + 1 \right)^{2} +{\frac{100}{3}} \frac{n^{3}}{\left(n + 1 \right)}}{2}} \\ &{\qquad = \operatorname{lim}_{n \to \infty} \frac{100 +{\frac{100}{3}} \frac{3n + 2}{n + 1}}{2}} \\ &{\qquad = \operatorname{lim}_{n \to \infty} \frac{100}{2}.} \end{array}}
$$

例题7.7计算

$$
\operatorname{lim}_{n \infty} \frac{\displaystyle \sum_{k = 1}^{n} \ln C_{n}^{k}}{n^{2}}.
$$

笔记注意到,分子求和时,不是单纯的 $\sum_{k = 0}^{n + 1} \ln C_{n}^{k} - \sum_{k = 0}^{n} \ln C_{n}^{k},$ 而是 $\sum_{k = 0}^{n + 1} \ln C_{n + 1}^{k} - \sum_{k = 0}^{n} \ln C_{n}^{k}.$

笔记组合数的定义和性质可以参考BinomialCoefficient.

证明 事实上，直接运用 Stolz定理8.1两次，就有

$$
\begin{array}{rl}{\frac{\sin \bigtriangleup}{\cos t} \frac{\bigtriangleup}{\sin t}} &{= \frac{\sin \bigtriangleup}{\sin t} \frac{\sin \bigtriangleup}{\sin t} + \frac{\sin \bigtriangleup}{\sin t} - \frac{\bigtriangleup}{\sin t} \ln \bigtriangleup} \\ &{= - \frac{\sin \bigtriangleup}{\sin t} \frac{\bigtriangleup}{\sin t} \bigtriangleup(1 + 1)^{2},} \\ &{\quad - \frac{\sin \bigtriangleup}{\sin t} \frac{\bigtriangleup}{\sin t} \frac{\bigtriangleup}{\sin t} + \frac{\bigtriangleup}{\bigtriangleup} \frac{\bigtriangleup}{\big{\sin t}}} \\ &{\quad - \frac{\bigtriangleup}{\big{\sin t}} \frac{\bigtriangleup}{\big{\sin t}} \frac{\bigtriangleup}{\big{\sin t}} + \frac{\bigtriangleup}{\big{\big{\sin t}}} - \frac{\bigtriangleup}{2} \frac{\sin \bigtriangleup}{\big{\sin t}} \frac{\bigtriangleup}{\big{\big{\sin t}}} - \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}}} \\ &{\quad - \frac{\bigtriangleup}{\big{\sin t}} \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}}} \\ &{= - \frac{\sin \bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup}{\big{\big{\sin t}}}} \\ &{\quad - \frac{\bigtriangleup}{\big{\sin t}} \frac{\bigtriangleup(1 + 1)^{2}}{2}} \\ &{= - \frac{\sin \bigtriangleup}{\big{\big{\sin t}}} \frac{\bigtriangleup(1 + 1)^{2}}{2}} \\ & \end{array}
$$

我们来看数学类真题,在第十二届大学生数学竞赛数学类中,竞赛班三届元老云佬失利之题2.例题 7.8计算

$$
\operatorname{lim}_{n \to \infty}{\frac{\ln n}{\ln \sum_{k = 1}^{n} k^{2020}}}.
$$

证明直接运用 Stolz 定理8.1,就有

$$
\begin{array}{rl} &{\displaystyle \operatorname{lim}_{n \to \infty} \frac{\ln n}{\ln \sum_{k = 1}^{n} k^{2020}} = \operatorname{lim}_{n \to \infty} \frac{\ln \left(n + 1 \right) - \ln n}{\ln \sum_{k = 1}^{n + 1} k^{2020} - \ln \sum_{k = 1}^{n} k^{2020}} = \operatorname{lim}_{n \to \infty} \frac{\ln \left(1 + \frac{1}{n} \right)}{\ln \left(1 + \frac{(n + 1)^{2020}}{\frac{n}{k - 1} k^{2020}} \right)}} \\ &{\quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad = \operatorname{lim}_{n \to \infty} \frac{1}{n \ln \left(1 + \frac{\left(1 + \frac{1}{n} \right)^{2020}}{\frac{\sum_{k = 1}^{n} \left(\frac{k}{n} \right)^{2020}}} \right)} = \displaystyle \operatorname{lim}_{n \to \infty} \frac{1}{\frac{1}{n} \frac{\frac{n}{k}}{k = 1} \left({{k}}^{2020} \right)^{202}} = \int_{0}^{1} x^{2020} dx = \frac{1}{2021}.} \end{array}
$$

为了解决更多问题,我们引入一个重要恒等式,他是离散的分部积分.

## 命题7.2(Abel变换4)

设 $\left\{a_{n} \right\}_{n = 1}^{N}, \left\{b_{n} \right\}_{n = 1}^{N}$ 是数列,则有恒等式

$$
\begin{array}{rcl}{\displaystyle \sum_{k = 1}^{N} a_{k} b_{k}} &{=} &{\displaystyle \left(a_{1} - a_{2} \right) b_{1} + \cdots + \left(a_{N - 1} - a_{N} \right) \left(b_{1} + b_{2} + \cdots + b_{N - 1} \right) + a_{N} \left(b_{1} + b_{2} + \cdots + b_{N} \right)} \\ & &{=} &{\displaystyle \sum_{j = 1}^{N - 1} \left(a_{j} - a_{j + 1} \right) \sum_{i = 1}^{j} b_{i} + a_{N} \sum_{i = 1}^{N} b_{i}.} \end{array}\tag{7.8}
$$

笔记命题7.2的证明想法”强行裂项”一种很重要的思想.

证明 为了计算 $\sum_{j = 1}^{N - 1} \left(a_{j} - a_{j + 1} \right) \sum_{i = 1}^{j} b_{i} + a_{N} \sum_{i = 1}^{N} b_{i}$ ，我们来强行构造裂项，差什么就给他补上去再补回来，即：

$$
\begin{array}{rl}{\displaystyle \sum_{j = 1}^{N - 1} \left(a_{j} - a_{j + 1} \right) \displaystyle \sum_{i = 1}^{j} b_{i} + a_{N} \sum_{i = 1}^{N} b_{i} = \sum_{j = 1}^{N - 1} \left(a_{j} \sum_{i = 1}^{j} b_{i} - a_{j + 1} \sum_{i = 1}^{j} b_{i} \right) + a_{N} \sum_{i = 1}^{N} b_{i}} &{} \\ &{= \displaystyle \sum_{j = 1}^{N - 1} \left(a_{j} \sum_{i = 1}^{j} b_{i} - a_{j + 1} \sum_{i = 1}^{j + 1} b_{i} \right) + \sum_{j = 1}^{N - 1} \left(a_{j + 1} \sum_{i = 1}^{j + 1} b_{i} - a_{j + 1} \sum_{i = 1}^{j} b_{i} \right) + a_{N} \sum_{i = 1}^{N} b_{i}} \\ &{= a_{1} b_{1} - a_{N} \displaystyle \sum_{i = 1}^{N} b_{i} + \sum_{j = 1}^{N - 1} a_{j + 1} b_{j + 1} + a_{N} \sum_{i = 1}^{N} b_{i}} \\ &{= \displaystyle \sum_{j = 1}^{N} a_{j} b_{j}.} \end{array}
$$

我们知道 $\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n} a_{k}$ 存在是推不出 $\operatorname{lim}_{n \to \infty} na_{n} = 0$ ，但是我们有更弱的均值极限成立

## 命题7.3

设 $\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n} a_{k}$ 存在,则

$$
\operatorname{lim}_{n \infty}{\frac{\displaystyle \sum_{k = 1}^{n} ka_{k}}{n}} = 0.
$$

笔记命题7.3是一个重要的需要记忆的结论，在很多难题时可能是一个很微不足道的中间步骤，但却会把人狠狠的卡住.此外,此类问题还不是直接应用 Stolz定理8.1就可以的.

笔记如果我们直接使用 Stolz定理8.1,就有

$$
\operatorname{lim}_{n \to \infty}{\frac{\displaystyle \sum_{k = 1}^{n} ka_{k}}{n}} = \operatorname{lim}_{n \to \infty}{\frac{na_{n}}{n -(n - 1)}} = \operatorname{lim}_{n \to \infty} na_{n}.
$$

遗憾的是，上式最后的极限可能不存在,而 Stolz定理8.1不可以逆用.

证明 使用abel变换7.2,我们有

$$
\begin{array}{rl} &{\underset{n \infty}{\overset{n}{\sum}} ka_{k}} \\ &{\underset{n \infty}{\overset{n}{\sum}} \frac{k = 1}{n} = \underset{n \infty}{\overset{n - 1}{\sum}} \frac{(k -(k + 1)) \underset{j = 1}{k}^{k} a_{j} + n \underset{k = 1}{\overset{n}{\sum}} a_{k}}{n}} \\ &{\qquad = \underset{n \infty}{\overset{\quad - \sum}} \frac{k^{- 1}}{n} + \underset{n \infty}{\overset{n}{\sum}} \sum_{k = 1}^{n} a_{k}} \\ &{\qquad = \underset{n \infty}{\overset{\quad - \sum}} \frac{a_{j}}{n + 1 - n} + \underset{n \infty}{\overset{n}{\sum}} \frac{a_{k}}{k - 1}} \\ &{\qquad = \underset{n \infty}{\overset{n}{\sum}} \frac{j - 1}{n + 1 - n} + \underset{n \infty}{\overset{n}{\sum}} \frac{a_{k}}{k - 1}} \\ &{\qquad = 0.} \end{array}
$$

## 推论7.1

设 $a_{n} > 0$ 且 $\operatorname{lim}_{n \to \infty}{\frac{a_{n + 1}}{a_{n}}}$ 存在或者为确定符号的0,那么我们有

$$
\operatorname{lim}_{n \to \infty} \sqrt[n]{a_{n}} = \operatorname{lim}_{n \to \infty} \frac{a_{n + 1}}{a_{n}}.\tag{7.9}
$$

证明 由 Stolz 定理8.1,我们知道

$$
\operatorname{lim}_{n \to \infty} \sqrt[n]{a_{n}} = \operatorname{lim}_{n \to \infty} e^{\frac{\ln a_{n}}{n}} = \operatorname{lim}_{n \to \infty} e^{\frac{\ln a_{n + 1} - \ln a_{n}}{n + 1 - n}} = \operatorname{lim}_{n \to \infty} e^{\ln \frac{a_{n + 1}}{a_{n}}} = \operatorname{lim}_{n \to \infty} \frac{a_{n + 1}}{a_{n}},
$$

这就证明了极限(7.9).

## 引理7.1(经典级数收敛性)

数列极限 $\operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k$ 存在的充分必要条件是 $\alpha < - 1$ ，或者 $\alpha = - 1, \beta < - 1$

<!-- image-->

笔记数列 $\sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k$ ：显然递增，由单调收敛定理知这个极限存在的充分必要条件是 $\sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k$ 有上界.本结果应该牢记于心,证明的想法是标准的单调时积分与和式等价的思想.

证明 当 $\beta = 0, \alpha \geqslant 0,$ 由 $\sum_{k = 2}^{n} k^{\alpha} \geqslant \sum_{k = 2}^{n} 1 = n - 2$ 知极限发散.

当 $\beta = 0, - 1$ 八 $\alpha < 0,$ 我们有

$$
\sum_{k = 2}^{n} k^{\alpha} = \sum_{k = 2}^{n}{\frac{1}{k^{- \alpha}}} = \sum_{k = 2}^{n}{\frac{1}{k^{- \alpha}}} \int_{k}^{k + 1} 1dx = \sum_{k = 2}^{n} \int_{k}^{k + 1}{\frac{1}{k^{- \alpha}}} dx \geqslant \sum_{k = 2}^{n} \int_{k}^{k + 1}{\frac{1}{x^{- \alpha}}} dx = \int_{2}^{n + 1} x^{\alpha} dx ={\frac{(n + 1)^{\alpha + 1} - 2^{\alpha + 1}}{\alpha + 1}},
$$

于是原极限发散.

当 $\beta = 0, \alpha < - 1$ ，我们有

$$
\sum_{k = 2}^{n} k^{\alpha} = \sum_{k = 2}^{n}{\frac{1}{k^{- \alpha}}} = \sum_{k = 2}^{n}{\frac{1}{k^{- \alpha}}} \int_{k - 1}^{k} 1dx = \sum_{k = 2}^{n} \int_{k - 1}^{k}{\frac{1}{k^{- \alpha}}} dx \leqslant \sum_{k = 2}^{n} \int_{k - 1}^{k}{\frac{1}{x^{- \alpha}}} dx = \int_{1}^{n} x^{\alpha} dx ={\frac{n^{\alpha + 1} - 1}{\alpha + 1}},
$$

于是原极限收敛.

<!-- image-->

笔记即证完了所谓p级数的收敛性.

当 $\alpha > - 1$ ，由于

$$
\operatorname{lim}_{k \to \infty} \ln k = + \infty, \operatorname{lim}_{k \to \infty} k^{- \frac{\alpha + 1}{2}} = 0,
$$

因此存在 $C > 0, N \in \mathbb{N}$ 使得 $\ln^{\beta} k \geqslant Ck^{- \frac{\alpha + 1}{2}}$ ,∀k ≥N.此时 $\textstyle{\frac{\alpha - 1}{2}} > - 1$ ，因此

$$
\sum_{k = N}^{n} k^{\alpha} \ln^{\beta} k \geqslant C \sum_{k = N}^{n}{\frac{1}{k^{- \alpha +{\frac{\alpha + 1}{2}}}}} = C \sum_{k = N}^{n}{\frac{1}{k^{-{\frac{\alpha - 1}{2}}}}},
$$

于是原极限发散.

当 $\alpha < - 1.$ ，由于对数的阶慢于幂函数的阶5，因此存在 $C > 0, N \in \mathbb{N}$ 使得lnβk≤Ck-¹,∀k $\geqslant N.$ 此时$\begin{array}{rlr}{{\frac{\alpha - 1}{2} < - 1}} \end{array}$ ，因此

$$
\sum_{k = N}^{n} k^{\alpha} \ln^{\beta} k \leqslant C \sum_{k = N}^{n}{\frac{1}{k^{- \alpha +{\frac{\alpha + 1}{2}}}}} = C \sum_{k = N}^{n}{\frac{1}{k^{-{\frac{\alpha - 1}{2}}}}},
$$

于是原极限收敛.

<!-- image-->

笔记证明的想法在于α不在临界点α=-1,而In的阶无法影响幂函数的阶,所以可以对α微调使得仍然在需要的范围内.

当 $\alpha = - 1$ ，我们希望读者可以自行类比思想完成证明.熟练之后,我们会如下书写

$$
\sum_{k = N}^{n}{\frac{\ln^{\beta} k}{k}} \sim \int_{N}^{n}{\frac{\ln^{\beta} x}{x}} dx = \int_{\ln N}^{\ln n} y^{\beta} dy,
$$

显然上式最后的积分极限存在等价于 $\beta < - 1$

## 命题7.4（一些重要等价式）

我们有

5例如 $\ln k \leqslant \sqrt{k}, k \infty.$

1.

$$
\sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k ={\left\{\begin{array}{ll}{{\frac{1}{\alpha + 1}} n^{\alpha + 1} \ln^{\beta} n + o \left(n^{\alpha + 1} \ln^{\beta} n \right),} &{\alpha > - 1, \beta \in \mathbb{R}} \\{{\frac{1}{\beta + 1}} \ln^{\beta + 1} n + o \left(\ln^{\beta + 1} n \right),} &{\alpha = - 1, \beta > - 1} \\{\ln \ln n + o \left(\ln \ln n \right),} &{\alpha = - 1, \beta = - 1} \end{array} \right.}.
$$

$$
\sum_{k = n}^{\infty} k^{\alpha} \ln^{\beta} k ={\left\{\begin{array}{ll}{-{\frac{1}{\alpha + 1}} n^{\alpha + 1} \ln^{\beta} n + o \left(n^{\alpha + 1} \ln^{\beta} n \right),} &{\alpha < - 1, \beta \in \mathbb{R}} \\{-{\frac{1}{\beta + 1}} \ln^{\beta + 1} n + o \left(\ln^{\beta + 1} n \right),} &{\alpha = - 1, \beta < - 1} \end{array} \right.}.
$$

注 本题主要是给出结论方便以后查阅.

笔记大部分情况下,拉中保持阶不变，本题为了书写简便将会灵活运用这一点，读者务必严格证明一次.考试的时候也需要严格证明.

证明 当 $\alpha < - 1, \beta \in \mathbb{R}$ 或者 $\alpha = - 1, \beta < - 1$ ，由引理7.1,我们知道 $\operatorname{lim}_{n \to \infty} \sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k = \sum_{k = 2}^{\infty} k^{\alpha} \ln^{\beta} k$ 收敛.

当 $\alpha < - 1, \beta \in \mathbb{R}$ ，由 Stolz 定理8.1,我们有

$$
\begin{array}{cl}{\displaystyle \sum_{n \to \infty}^{\infty} k^{\alpha} \ln^{\beta} k} &{~} \\{\displaystyle \operatorname{lim}_{n \to \infty} \frac{k^{- n}}{n^{\alpha + 1} \ln^{\beta} n} = - \operatorname{lim}_{n \to \infty} \frac{n^{\alpha} \ln^{\beta} n}{(n + 1)^{\alpha + 1} \ln^{\beta}(n + 1) - n^{\alpha + 1} \ln^{\beta} n}} \\{\displaystyle} &{\displaystyle \# \frac{n^{\alpha}}{n^{\beta}} \mathbb{E} \frac{\mathbb{I}_{n}^{\alpha}}{\mathbb{E}^{\frac{\beta + \pi}{2} \Re \mathcal{H} \cdot \mathbb{K}}} - \operatorname{lim}_{n \to \infty} \frac{n^{\alpha} \ln^{\beta} n}{(\alpha + 1) n^{\alpha} \ln^{\beta} n + \beta n^{\alpha} \ln^{\beta - 1} n}} \\{\displaystyle} &{= - \operatorname{lim}_{n \to \infty} \frac{\ln n}{(\alpha + 1) \ln n + \beta}} \\{\displaystyle} &{= - \frac{1}{\alpha + 1}.} \end{array}
$$

即得

$$
\sum_{k = n}^{\infty} k^{\alpha} \ln^{\beta} k = -{\frac{1}{\alpha + 1}} n^{\alpha + 1} \ln^{\beta} n + o \left(n^{\alpha + 1} \ln^{\beta} n \right).
$$

当 $\alpha = - 1, \beta < - 1$ ，由 Stolz 定理8.1,我们有

$$
\begin{array}{l}{{\displaystyle \operatorname{lim}_{n \to \infty} \displaystyle \sum_{\mathbf{k} = n}^{\infty} k^{- 1} \ln^{\beta} k} = - \operatorname{lim}_{n \to \infty} \displaystyle \frac{n^{- 1} \ln^{\beta} n}{\ln^{\beta + 1}(n + 1) - \ln^{\beta} n}} \\{{\displaystyle \quad \operatorname{lim}_{\mathbf{k} \neq \mathbf{m}} \displaystyle \frac{\ln^{\beta} n}{\ln^{\beta + 1} \ln^{\beta} \mathbf{k}} \displaystyle \frac{\ln^{\alpha + \mathbf{k}} \ln^{\beta} n}{\ln^{\beta + \mathbf{k}} \mathbf{\to \infty}} \displaystyle \frac{n^{- 1} \ln^{\beta} n}{(\beta + 1) n^{- 1} \ln^{\beta} n}}} \\{{= - \displaystyle \frac{1}{\beta + 1}.}} \end{array}
$$

即得

$$
\sum_{k = n}^{\infty} k^{- 1} \ln^{\beta} k = -{\frac{1}{\beta + 1}} \ln^{\beta + 1} n + o \left(\ln^{\beta + 1} n \right).
$$

当 $\alpha = - 1, \beta > - 1$ ，此时由 Stolz 定理8.1,我们有

$$
\begin{array}{rl}{\underset{n \infty}{\operatorname{lim}} \frac{\displaystyle \sum_{k = 2}^{n} k^{- 1} \ln^{\beta} k}{\ln^{\beta + 1} n} = \underset{n \infty}{\operatorname{lim}} \frac{n^{- 1} \ln^{\beta} n}{\ln^{\beta + 1} n - \ln^{\beta + 1}(n - 1)}} &{} \\ \frac \displaystyle \frac{i \ast \ast}{\ln^{\beta} \ln^{\beta} \Vert} \frac{i \ast \ast}{\underset{\beta \neq}{\underbrace{i \ast \ast\}} \Vert^{\beta} \ast \ast \ast \Vert^{\alpha}} \underset{n \infty}{\operatorname{lim}} \frac{n^{- 1} \ln^{\beta} n}{(\beta + 1) n^{- 1} \ln^{\beta} n}} &{} \\{= \frac{1}{\beta + 1}.} &{} \end{array}
$$

于是得

$$
\sum_{k = 2}^{n} k^{- 1} \ln^{\beta} k ={\frac{1}{\beta + 1}} \ln^{\beta + 1} n + o \left(\ln^{\beta + 1} n \right).
$$

当 $\alpha = - 1, \beta = - 1$ ，此时由 Stolz 定理8.1,我们有

$$
\operatorname{lim}_{n \to \infty} \frac{\sum_{k = 2}^{n} k^{- 1} \ln^{- 1} k}{\ln \ln n} = \operatorname{lim}_{n \to \infty} \frac{n^{- 1} \ln^{- 1} n}{\ln \ln n - \ln \ln(n - 1)} \overset{\neq \Psi}{\underset{n \to \infty}{\operatorname{min}}} \mathbb{E} \mathbb{\underset{n \to \infty}{\underbrace{\mathcal{R} \mathbb{Z}} \mathbb{H} \mathbb{Z}} \mathbb{H} \mathbb{Z} \mathbb{\stackrel{\Psi}{\ast}} \mathbb{W}} \underset{n \to \infty}{\operatorname{lim}} \frac{n^{- 1} \ln^{- 1} n}{\frac{1}{n \ln n}} = 1.
$$

于是得

$$
\sum_{k = 2}^{n} k^{- 1} \ln^{- 1} k = \ln \ln n + o \left(\ln \ln n \right).
$$

当 $\alpha > - 1, \beta \in \mathbb{R}$ ，由 Stolz 定理8.1,我们有

$$
\begin{array}{c}{{\displaystyle \operatorname{lim}_{n \to \infty} \frac{n}{n^{\alpha + 1} \ln^{\beta} n} = \operatorname{lim}_{n \to \infty} \frac{n^{\alpha} \ln^{\beta} n}{n^{\alpha + 1} \ln^{\beta} n - \left(n - 1 \right)^{\alpha + 1} \ln^{\beta} \left(n - 1 \right)}}} \\{{\displaystyle \operatorname{lim}_{n \to \infty} \frac{k^{\alpha}}{n^{\alpha + 1} \ln^{\beta} n} \frac{\left[\frac{n}{\alpha + 1} \ln^{\beta} \mathcal{H} \right]^{\ast}}{\frac{n - \alpha + 1}{\alpha + 1} \ln^{\beta} \left(\alpha + 1 \right)} \frac{n^{\alpha} \ln^{\beta} n}{\left(\alpha + 1 \right) n^{\alpha} \ln^{\beta} n + \beta n^{\alpha} \ln^{\beta - 1} n}}} \\{{\displaystyle = \operatorname{lim}_{n \to \infty} \frac{\ln n}{\left(\alpha + 1 \right) \ln n + \beta}}} \\{{\displaystyle = \frac{1}{\alpha + 1}.}} \end{array}
$$

于是得

$$
\sum_{k = 2}^{n} k^{\alpha} \ln^{\beta} k ={\frac{1}{\alpha + 1}} n^{\alpha + 1} \ln^{\beta} n + o \left(n^{\alpha + 1} \ln^{\beta} n \right).
$$

这就完成了证明.

我们知道 Stolz定理8.1不可逆用，因此下面给一个可以逆用的最简单的条件，更深刻的逆用条件我们留到数学类完成.

例题7.9设

$$
\operatorname{lim}_{n \infty}{\frac{1}{n}} \sum_{i = 1}^{n} a_{i} = A, \operatorname{lim}_{n \infty} n(a_{n} - a_{n - 1}) = 0.\tag{7.10}
$$

证明 $\operatorname{lim}_{n \to \infty} a_{n} = A$

证明 事实上由 Abel变换7.2,我们有

$$
\sum_{k = 1}^{n} a_{k} \cdot 1 = \sum_{k = 1}^{n - 1} k \left(a_{k} - a_{k + 1} \right) + na_{n}.
$$

于是利用 Stolz定理8.1和条件(7.10),我们就有

$$
\operatorname{lim}_{n \to \infty} a_{n} = \operatorname{lim}_{n \to \infty}{\frac{1}{n}} \sum_{k = 1}^{n} a_{k} - \operatorname{lim}_{n \to \infty}{\frac{1}{n}} \sum_{k = 1}^{n - 1} k \left(a_{k} - a_{k + 1} \right) = A - \operatorname{lim}_{n \to \infty} n \left(a_{n} - a_{n + 1} \right) = A.
$$

这就完成了证明.

我们运用 Stolz 定理来处理一些竞赛真题的例子,当然其可能会结合起来知识点,我们剥离出来 Stolz 定理部分

例题7.10

1.计算

$$
\operatorname{lim}_{n \to \infty} n \left(\sum_{k = 1}^{n}{\frac{1}{k}} - \ln n - \gamma \right).
$$

2.计算

$$
\operatorname{lim}_{n \to \infty} n \left(\sum_{k = 1}^{n}{\frac{1}{n + k}} - \ln 2 \right).
$$

证明

1．由例7.5知

$$
\operatorname{lim}_{n \to \infty} \left(\sum_{k = 1}^{n}{\frac{1}{k}} - \ln n - \gamma \right) = 0.
$$

运用 Stolz 定理8.1我们有

$$
\begin{array}{rl} &{\underset{n \to \infty}{\operatorname{lim}} n(\displaystyle \sum_{k = 1}^{n} \frac{1}{k} - \ln n - \gamma) = \underset{n \to \infty}{\operatorname{lim}} \frac{\displaystyle \sum_{k = 1}^{n} \frac{1}{k} - \ln n - \gamma}{\frac{1}{n}} \overset{S_{\lfloor \omega \rfloor \omega}}{=} \underset{n \to \infty}{\operatorname{lim}} \frac{\displaystyle \frac{1}{n + 1} - \ln(n + 1) + \ln n}{\displaystyle \frac{1}{n + 1} - \frac{1}{n}}} \\ &{\overset{(*) \sharp}{=} \pi \frac{\displaystyle(\sum_{k = 1}^{n} - \ln(n + 1) - \ln(1 + \frac{1}{n}))}{\displaystyle n \to \infty} = - \underset{n \to \infty}{\operatorname{lim}} n^{2}(\frac{1}{n + 1} - \frac{1}{n} + \frac{1}{2n^{2}} + o(\frac{1}{n^{2}}))} \\ &{= \frac{1}{\hat{\omega}}.} \end{array}
$$

2．注意到定积分定义

$$
\operatorname{lim}_{n \to \infty} \sum_{k = 1}^{n}{\frac{1}{n + k}} = \operatorname{lim}_{n \to \infty}{\frac{1}{n}} \sum_{k = 1}^{n}{\frac{1}{1 +{\frac{k}{n}}}} = \int_{0}^{1}{\frac{1}{1 + x}} dx = \ln 2.
$$

运用 Stolz 定理8.1我们有

$$
\begin{array}{l}{\displaystyle \operatorname{lim}_{n \to \infty} n \left(\sum_{k = 1}^{n} \frac{1}{n + k} - \ln 2 \right) \overset{Stolz}{=} \displaystyle \operatorname{lim}_{n \to \infty} \frac{\displaystyle \sum_{k = 1}^{n + 1} \frac{1}{n + 1 + k} - \sum_{k = 1}^{n} \frac{1}{n + k}}{\displaystyle \frac{1}{n + 1} - \frac{1}{n}}} \\{\displaystyle \overset{\ast \ast}{\mathop{=}} \displaystyle \Lambda \mu \frac{\displaystyle \sum_{j}^{n} \chi \mu \frac{1}{\mathop{=}} \frac{1}{\mathscr{R}}}{\displaystyle n \to \infty} \left(\sum_{k = 1}^{n + 1} \frac{1}{n + 1 + k} - \sum_{k = 1}^{n} \frac{1}{n + k} \right)} \\{\displaystyle = - n^{2} \operatorname{lim}_{n \to \infty} \left(- \frac{1}{n + 1} + \frac{1}{2n + 1} + \frac{1}{2n + 2} \right) = - \frac{1}{4}.} \end{array}
$$

来看经典跨项 Stolz 定理运用题.

例题 7.11 设 $a \in \mathbb{R}$ 且对某个 $p \in \mathbb{N},$ 成立 $\operatorname{lim}_{n \infty}(x_{n} - x_{n - p}) = a.$ 计算 $\operatorname{lim}_{n \to \infty}{\frac{x_{n}}{n}}$

<!-- image-->

笔记觉得本题证明抽象的可以先考虑 $p = 2$

证明对 $p \in \mathbb{N},$ ，我们知道对每个 $n \in \mathbb{N},$ ，存在唯一的 $k \in{\mathbb{N}}_{0}, r \in \{0, 1, 2, \cdots, p - 1\}$ 使得 $n = kp + r$ .于是运用Stolz 定理8.1,我们有

$$
\operatorname{lim}_{k \to \infty}{\frac{x_{kp + r}}{kp + r}} = \operatorname{lim}_{k \to \infty}{\frac{x_{(k + 1) p + r} - x_{kp + r}}{p}} ={\frac{a}{p}}.
$$

于是由命题6.4的 (b)我们知道

$$
\operatorname{lim}_{n \to \infty}{\frac{x_{n}}{n}} ={\frac{a}{p}}.
$$

例题7.12 设正值函数f满足 $\operatorname{lim}_{n \to \infty} \frac{f(n)}{n} = a > 0.$ 计算

$$
\operatorname{lim}_{n \to \infty} \left[\sqrt[n + 1]{\prod_{k = 1}^{n + 1} f \left(k \right)} - \sqrt[n]{\prod_{k = 1}^{n} f \left(k \right)} \right].
$$

证明

因为 $\operatorname{lim}_{n \to \infty} \frac{f(n)}{n} = a > 0$ ，我们知道 $f(n) = an + o(n), n \infty,$ ，于是不妨设α=1,否则af替换f即.事实上,

注意到

$$
\begin{array}{rl} &{\begin{array}{rl} &{\frac{n + 1}{n} \ln f \left(k \right)} \\ &{\frac{k = 1}{n + 1} - \frac{k = 1}{n} \ln f \left(k \right) = \frac{k + 1}{\ln{n}} \ln \left(k + o(k) \right) \quad \underbrace{\sum_{n = 1}^{n} \ln \left(k + o(k) \right)}_{n + 1}} \\ &{\qquad \quad \underbrace{\sum_{n = 1}^{1} \left[\ln k + \ln \left(1 + o(1) \right) \right]}_{n + 1} \underbrace{\frac{n}{n} \left[\ln k + \ln \left(1 + o(1) \right) \right]}_{n}} \\ &{\qquad \quad \underbrace{\sum_{n = 1}^{1} \left[\ln k + \ln \left(1 + o(1) \right) \right]}_{n + 1} \underbrace{\sum_{n = 1}^{\frac{n}{2}} \ln k + \ln \left(1 + o(1) \right)}_{n}} \\ &{\qquad \quad \underbrace{\sum_{n = 1}^{1} \ln k}_{n + 1} + \underbrace{o(n + 1)}_{n + 1} \underbrace{\sum_{n = 1}^{\frac{n}{2} \ln k}}_{n} - \frac{o(n)}{n}} \\ &{\qquad \quad \underbrace{\ln \left(n + 1 \right)}_{n + 1} + o(1) \quad} \\ &{\qquad = o(1).} \end{array}} \end{array}
$$

于是

$$
\begin{array}{rl}{\mathbb{E} \mathbb{E} \mathbb{E} \Bigg[\Bigg | \frac{\hat{\eta}}{\hat{\eta}} \Bigg |_{\Delta} \Bigg |^{2} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}}} &{\Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}}} \\ &{\quad \quad - \mathbb{E} \Bigg[\Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg |^{2} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}}} \\ &{\quad \quad \quad + \mathbb{E} \Bigg[\Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg |^{2} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}}} \\ & \quad \quad - \mathbb{E} \Bigg[\Bigg | \hat{\eta}_{\Delta}^{\mathrm{in}} \Bigg |^{2} \Bigg \end{array}
$$

等价替换，即结论7.2.可对左边指数部分用Stolz8.1进行证明 $\frac{1}{e} \operatorname{lim}_{n \to \infty} n \left[\frac{\ln \left(n + 1 \right)}{n} - \frac{\displaystyle \sum_{k = 1}^{n + 1} \ln k}{n \left(n + 1 \right)} + o \left(\frac{1}{n} \right) \right]$

$$
\begin{array}{l}{{\displaystyle = \frac{1}{\epsilon} \operatorname{lim}_{n \to \infty} \left[\ln(n + 1) - \frac{\underset{k = 1}{\overset{n + 1}{\sum}} \ln k}{\frac{\underset{k = 1}{\overset{n + 1}{\sum}}}{n + 1}} \right]}} \\{{\displaystyle = \frac{1}{\epsilon} \operatorname{lim}_{n \to \infty} \left[\frac{(n + 1) \ln(n + 1) - \underset{k = 1}{\overset{n + 1}{\sum}} \ln k}{n + 1} \right]}} \\{{\displaystyle \operatorname{siot}_{n \to \infty} \left[\frac{1}{\epsilon} \operatorname{lim}_{n \to \infty} \left[\frac{(n + 1) \ln(n + 1) - n \ln n - \ln(n + 1)}{1} \right] = \frac{1}{\epsilon} \right]}} \end{array}
$$

因此我们就证明了

$$
\operatorname{lim}_{n \to \infty} \left[{\mathit{n}} + 1 \sqrt{\prod_{k = 1}^{n + 1} f \left(k \right)} - \sqrt[n]{\prod_{k = 1}^{n} f \left(k \right)} \right] = \frac{a}{e}.
$$

笔记 在证明中有个非常重要的技1 ${\mathfrak{x}}{\mathfrak{z}}, f \left(k \right) = k + o \left(k \right)$ ，很多同学说,这个等式不是对充分大的k才对吗？实则不

然,这个等式的意义是 $f \left(k \right) = k + g \left(k \right), k = 1, 2, \cdot \cdot \cdot$ ,其中g满足 $\operatorname{lim}_{k \to \infty}{\frac{g(k)}{k}} = 0$ 所以等式 $f \left(k \right) = k + o \left(k \right)$ 对k比较小的时候也成立.此外余项方法本来就是简化书写的作用,完全可以不被余项代替,但读者可以看到，在本题证明中，余项的出现让我们清晰的看到了极限的阶的结构.

从证明中可以看到,我们得到了一个经典结论

结论 $\textstyle{\sqrt[n]{n !}} \sim{\frac{n}{e}}, n \to \infty]$ 我们有

$$
\operatorname{lim}_{n \to \infty}{\frac{\sqrt[n]{n !}}{n}} ={\frac{1}{e}}.
$$

<!-- image-->

笔记完整的 String公式见数学类定理8.4.本公式在非数学类可以直接使用而无需掌握证明.

## 7.3递推数列方法

本节大多采用固定操作的方法，在竞赛课程中，固定操作都视为基础问题，不会像基础课程那样带着大家反复训练.因此我们只一种方法列举一个题即可.

## 7.3.1单调性分析法

<!-- image-->

笔记 本节思想十分固定,单调性分析法只适用于

$$
x_{n + 1} = f \left(x_{n} \right), n \in \mathbb{N}.\tag{7.11}
$$

f是递增或者递减的类型，且大多数情况只适用于f递增情况，其余情况不如压缩映像思想方便快捷．显然递推数列(7.11)确定的 $x_{n}$ 如果收敛于 $x \in \mathbb{R}.$ ，则当f连续时一定有 $f \left(x \right) = x,$ ，此时我们也把这个x称为f的不动点.因此 $f \left(x \right) = x$ 是 $x_{n}$ 收敛于 $x \in$ R 的必要条件.

结论[递增函数递推数列]设f是递增函数,则递推(7.11)确定的 $x_{n} - \vec{\mathbb{x}}$ 单调,且和不动点大小关系恒定.

笔记本结论表明由递增递推(7.11)确定的数列的单调性和有界性,完全由其 $x_{2} - x_{1}$ 和 $x_{1}$ 与不动点的大小关系确定

证明 我们只证一种情况,其余情况是完全类似的.设 $x_{0}$ 是f的不动点且 $x_{1}$ 八 $x_{0}, x_{2}$ ≥ $x_{1}$ ，则若 $x_{n}$ 八 $x_{n + 1}, x_{n}$ 八$x_{0}, n \in \mathbb{N},$ 运用f递增性有

$$
x_{n + 1} = f \left(x_{n} \right) \leqslant f \left(x_{0} \right) = x_{0}, x_{n + 2} = f \left(x_{n + 1} \right) \geqslant f \left(x_{n} \right) = x_{n + 1}.
$$

由数学归纳法即证明了结论7.3.1.

类似的我们可以给出

$$
x_{n}
$$

笔记我们注意到 $f \circ f$ 递增就能把f递减转化递增的情况，本结论无需记忆或证明,只记得思想即可.

例题7.13

1.设 $x_{1} > - 6, x_{n + 1} ={\sqrt{6 + x_{n}}}, n = 1, 2, \cdot \cdot \cdot$ ,计算 $\operatorname{lim}_{n \to \infty} x_{n}$

2.设 $\begin{array}{r}{x_{1}, a > 0, x_{n + 1} = \frac{1}{4} \left(3x_{n} + \frac{a}{x_{n}^{3}} \right), n = 1, 2, \cdot \cdot \cdot} \end{array}$ ,求极限 $\operatorname{lim}_{n \to \infty} x_{n}.$

3.设 $x_{1} = 2, x_{n} +(x_{n} - 4) x_{n - 1} = 3,(n = 2, 3, \cdot \cdot \cdot)$ ,求极限 $\operatorname{lim}_{n \to \infty} x_{n}$

4.设 $x_{1} > 0, x_{n} e^{x_{n + 1}} = e^{x_{n}} - 1, n = 1, 2, \cdot \cdot \cdot$ ,求极限 $\operatorname{lim}_{n \to \infty} x_{n}$

5.设 $\begin{array}{r}{x_{1} > - 1, x_{n + 1} = \frac{1}{1 + x_{n}}, n = 1, 2, \cdot \cdot \cdot} \end{array}$ ,求极限 $\operatorname{lim}_{n \to \infty} x_{n}.$ 证明

1．因为极限不受 $x_{n}$ 有限项影响可不妨设 $x_{1} > 0,$ ，显然递推函数递增且有不动点3.又

$$
x_{2} - x_{1} ={\sqrt{6 + x_{1}}} - x_{1} ={\frac{\left(3 - x_{1} \right) \left(2 + x_{1} \right)}{{\sqrt{6 + x_{1}}} + x_{1}}},
$$

于是当 $x_{1} > 3$ 有 $x_{n}$ 递减且大于不动点，因此 $\operatorname{lim}_{n \to \infty} x_{n} = 3.$ 于是当 $x_{1}$ ≤3有 $x_{n}$ 递增且小于等于不动点，因此无论如何 $\operatorname{lim}_{n \to \infty} x_{n} = 3$
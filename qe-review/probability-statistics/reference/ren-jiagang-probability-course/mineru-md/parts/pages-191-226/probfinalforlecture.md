## 6 随机变量的独立性

什么叫独立? 在通常的理解中, 独立就是不依赖, 不受制. 国家的独立自由意味着摆脱了别的国家的欺凌, 个人的独立意味着不受他人奴役. 那么什么叫随机变量的独立? 简言之, 就是随机变量的取值不受制于其它随机变量取值的影响, 在概率的意义下. 这是一个在客观世界里常见的现象. 小到掷骰子的游戏, 大到悬浮在液体中的微粒所受到的液体分子运动在不同的时间区间内带来的冲击力. 另一方面, 独立性会给数学上的处理带来极大的方便, 是我们考虑概率问题时必须用好用尽的一个性质.

我们曾经对离散型随机变量定义了独立性. 现在把这个概念拓广到一般情况并对它进行系统的研究.

## 6.1 基本定义及性质

我们从最简单的情况即两个随机变量的情况开始.

定义 6.1.1. 设ξ, η是随机变量. 若

$$
P(\xi \leqslant a, \eta \leqslant b) = P(\xi \leqslant a) P(\eta \leqslant b), \quad \forall a, b \in \mathbb{R},
$$

则称ξ, η独立.

用分布函数表示, 独立性就是

$$
F(x, y) = F_{\xi}(x) F_{\eta}(y), \forall x, y \in \mathbb{R},
$$

其中F是(ξ,η)的联合分布函数, $F_{\xi}$ 与 $F_{\eta}$ 分别是 $: \xi.$ 与η的分布函数. 容易验证, 此条件等价于:$\forall x_{1} < x_{2}, y_{1} < y_{2}$

$$
F(x_{2}, y_{2}) - F(x_{1}, y_{2}) - F(x_{2}, y_{1}) + F(x_{1}, y_{1}) =[F_{\xi}(x_{2}) - F_{\xi}(x_{1})][F_{\eta}(y_{2}) - F_{\eta}(y_{1})].
$$

或等价地, $\forall a < b, c < d,$ , 有

$$
P(a < \xi \leqslant b, c < \eta \leqslant d) = P(a < \xi \leqslant b) P(c < \eta \leqslant d).
$$

我们需要说明, 对离散型随机变量, 这个定义和以前的定义是一致的.

设(ξ,η)的分布列为 $\{(x_{i}, y_{j}), p_{ij}\}$ . 则两个边沿分布列分别为 $\{ x _ { i } , p _ { i } ^ { \xi } \} \stackrel { \vartriangle } { \left. \xi { \left\{ y _ { j } , p _ { j } ^ { \eta } \right\} } \right.} $ , 其 $\begin{array}{r}{\mathbb{H} p_{i}^{\xi} =} \end{array}$ $\begin{array}{r}{\sum_{j} p_{ij}, p_{j}^{\eta} = \sum_{i} p_{ij}} \end{array}$ . 按以前的定义, 独立性是指

$$
p_{ij} = p_{i}^{\xi} \cdot p_{j}^{\eta}, \forall i, j.\tag{1.1}
$$

如果此式成立, 那么∀x, y,

$$
\begin{array}{rcl} F(x, y) & = & \sum_{x_{i} \leqslant x, y_{j} \leqslant y} p_{ij} \\ & = & \sum_{x_{i} \leqslant x, y_{j} \leqslant y} p_{i}^{\xi} p_{j}^{\eta} \\ & = & \sum_{x_{i} \leqslant x} p_{i}^{\xi} \cdot \sum_{y_{j} \leqslant y} p_{j}^{\eta} \\ & = & F_{\xi}(x) F_{\eta}(y).\end{array}
$$

所以按现在的定义是独立的. 反之, 若按现在的定义是独立的, 那么∀i, j,

$$
\begin{array}{rcl} p_{ij} & = & P(\xi = x_{i}, \eta = y_{j}) \\ & = & \lim_{n \to \infty} P \left(x_{i} - \frac{1}{n} < \xi \leqslant x_{i}, y_{j} - \frac{1}{n} < \eta \leqslant y_{j}\right) \\ & = & \lim_{n \to \infty} P \left(x_{i} - \frac{1}{n} < \xi \leqslant x_{i}\right) P \left(y_{j} - \frac{1}{n} < \eta \leqslant y_{j}\right) \\ & = & P(\xi = x_{i}) P(\eta = y_{j}) \\ & = & p_{i}^{\xi} p_{j}^{\eta}.\end{array}
$$

所以按原来的定义也是独立的. 因此, 对离散型随机变量, 现在的定义和原来的定义是等价的.

另一种特殊情况是连续型随机变量. 设 $(\xi, \eta)$ 的密度函数为 $p(x, y)$ , 那么两个边沿密度分别为 $| p_{\xi}(x)$ 与 ${i p}_{\eta}(y)$ , 其中

$$
p_{\xi}(x) = \int_{\mathbb{R}} p(x, y) dy, p_{\eta}(y) = \int_{\mathbb{R}} p(x, y) dx.
$$

因此独立性意味着

$$
\begin{array}{rcl} F(x, y) & = & F_{\xi}(x) F_{\eta}(y) \\ & = & \int_{- \infty}^{x} p_{\xi}(u) du \int_{- \infty}^{y} p_{\eta}(v) dv \\ & = & \int_{- \infty}^{x} \int_{- \infty}^{y} p_{\xi}(u) p_{\eta}(v) dudv.\end{array}
$$

所以

$$
p(x, y) = p_{\xi}(x) p_{\eta}(y),
$$

只要 $(x, y)$ 是p们的连续点. 反之, 若此式成立, 那么也容易证明ξ与η独立. 所以我们有

命题 6.1.2. 设 $(\xi, \eta)$ 是离散型随机变量, 那么它们独立的充要条件是联合分布列等于两个边沿分布列的乘积.

设(ξ,η)是连续型随机变量, 那么它们独立的充要条件是联合密度函数在其连续点上等于两个边沿密度函数的乘积.

现在考虑下面的问题: 如果ξ,η是随机变量, $f \in \mathcal{B}^{2}$ . 问: 在求期望 $E[f(\xi, \eta)]$ 时, 能否先固定一个, 即先求 $E[f(x, \eta)]$ , 得到x的函数, 再将ξ代入到这个函数中去, 得到一个随机变量,然后求这个随机变量的期望?

## 6.1 基本定义及性质

回答一般是否定的. 例如, 取 $f(x, y) = xy$ . 此时, 对任意两个随机变量 $\xi, \eta,$ 上面公式成立意味着 $E[\xi \eta] = E[\xi] E[\eta]$ , 即ξ, η不相关. 这显然一般是不对的. 比如, $\xi = \eta$ , ξ是对称随机变量 $(\xi \overleftrightarrow{\mathcal{I}} - \xi \overrightarrowH / \种 \mathcal{H})$ , $E[\xi] = 0($ 例如 $\xi \sim N(0, 1))$ . 则

$$
\varphi(x) := E[x \eta] = 0, \forall x,
$$

于是

$$
E[\varphi(\xi)] = 0.
$$

但显然

$$
E[f(\xi, \eta)] = E[\xi^{2}] \neq 0.
$$

但在独立的情况, 这样做是可以的, 即我们有下面的定理:

定理 6.1.3. 设 $f : \mathbb{R}^{2} \mapsto \mathbb{\mapsto}$ R为非负Borel可测, (ξ, η)为二维随机变量. 令

$$
\varphi(x) := E[f(x, \eta)].
$$

则 $\varphi$ : R 7→ R为非负Borel可测, 且 $.\xi, \eta$ 为独立的充要条件对任意这样的 $f,$

$$
E[f(\xi, \eta)] = E[\varphi(\xi)].
$$

证明. 先证 $\dot{\varphi} \vert$ 的Borel可测性. 由于非负可测函数可由非负简单函数单调上升地逼近, 所以由单调收敛定理只需对f是非负简单函数证明. 而由期望的线性性, 这又归结为对示性函数证明. 因此我们设

$$
f = 1_{A}, A \in \mathcal{B}^{2}.
$$

令

$$
\mathcal{G} := \{A \in \mathcal{B}^{2}: \varphi(x) := E[1_{A}(x, \eta)] \text{为Borel可测}\}.
$$

则易证G 为λ-类, 且包含了π-类:

$$
\Pi := \{(- \infty, a] \times(- \infty, b], a, b \in \mathbb{R}\}.
$$

因此由单调类定理有 $\mathcal{G} = \boldsymbol{igma}(\Pi) = \mathcal{B}^{2}$

下面证第二个结论. 充分性显然, 因为取

$$
f(x, y) := 1_{(- \infty, a]}(x) \cdot 1_{(- \infty, b]}(y),
$$

则

$$
E[f(\xi, \eta)] = E[\varphi(\xi)]
$$

就变为

$$
P(\xi \leqslant a, \eta \leqslant b) = P(\xi \leqslant a) P(\eta \leqslant b).
$$

往证必要性. 令

$\mathcal{G} : = \{A \in \mathcal{B}^{2}$ : 定理对函数 $f : = 1_{A}$ 成立}.

$$
\mathscr{C} := \{(a, b] \times(c, d]: a < b, c < d\}.
$$

则C 为 $\mid \pi -$ 类, 且 ${\mathcal B}^{2} = \sigma(\mathcal{C})$ . 对 $A : =(a, b] \times(c, d] \in \mathcal{C}$ , 令

$$
f := 1_{A}.
$$

则

$$
\varphi(x) = E[1_{A}(x, \eta)] = 1_{(a, b]}(x) E[1_{(c, d]}(\eta)] = 1_{(a, b]}(x) P(c < \eta \leqslant d).
$$

所以

$$
E[\varphi(\xi)] = E[1_{(a, b]}(\xi)] P(c < \eta \leqslant d) = P(a < \xi \leqslant b) P(c < \eta \leqslant d).
$$

而由独立性也有

$$
\begin{array}{rcl} E[f(\xi, \eta)] & = & E[1_{(a, b] \times(c, d]}(\xi, \eta)] \\ & = & P(a < \xi \leqslant b, c < \eta \leqslant d) \\ & = & P(a < \xi \leqslant b) P(c < \eta \leqslant d).\end{array}
$$

所以, $\mathcal{C} \subset \mathcal{G}$

往证G为λ-类. 显然 $\mathbb{R}^{2} \in \mathcal{G}$ . 设A, $B \in{\mathcal{G}}, A \subset B$ . 对任意 $C \subset \mathcal{B}^{2}$ , 令

$$
\varphi_{C}(x) := E[1_{C}(x, \eta)],
$$

则

$$
E[\varphi_{B}(\xi)] - E[\varphi_{A}(\xi)] = E[\varphi_{B \setminus A}(\xi)].
$$

因此

$$
\begin{array}{rcl} E[1_{B \setminus A}(\xi, \eta)] & = & E[1_{B}(\xi, \eta) - 1_{A}(\xi, \eta)] \\ & = & E[1_{B}(\xi, \eta)] - E[1_{A}(\xi, \eta)] \\ & = & E[\varphi_{B}(\xi)] - E[\varphi_{A}(\xi)] \\ & = & E[\varphi_{B \setminus A}(\xi)].\end{array}
$$

所以 $B - A \in{\mathcal{G}}$ . 再设 $A_{n} \in{\mathcal{G}}, A_{n} \uparrow A$ . 则由单调收敛定理有

$$
\begin{array}{rcl} E[1_{A}(\xi, \eta)] & = & \lim_{n \to \infty} E[1_{A_{n}}(\xi, \eta)] \\ & = & \lim_{n \to \infty} E[\varphi_{A_{n}}(\xi)] \\ & = & E[\lim_{n \to \infty} \varphi_{A_{n}}(\xi)] \\ & = & E[\varphi_{A}(\xi)].\end{array}
$$

所以 $A \in{\mathcal{G}}$ . 这样, 由 $\lambda - \pi$ 定理, $\mathcal{G}$ 为σ-代数. 于是 $\mathcal{G} = \mathcal{B}^{2}$

现在, 若 $f.$ 是简单函数:

$$
f := \sum_{k = 1}^{n} a_{k} 1_{A_{k}}, a_{k} \in \mathbb{R}, A_{k} \in \mathscr{B}^{2},
$$

则有

$$
\begin{array}{rcl} E[f(\xi, \eta)] & = & \sum_{k = 1}^{n} a_{k} E[1_{A_{k}}(\xi, \eta)] \\ & = & \sum_{k = 1}^{n} a_{k} E[\varphi_{A_{k}}(\xi)] \\ & = & E[\sum_{k = 1}^{n} a_{k} \varphi_{A_{k}}(\xi)] \\ & = & E[\varphi(\xi)].\end{array}
$$

## 6.1 基本定义及性质

最后, 设 $f \geqslant 0, f \in{\mathcal{B}}^{2}$ . 于是, 存在简单函数 $f_{n}$ ↑ $f$ . 以 $\varphi_{n}$ 表示 $f_{n}$ 对应的 $\varphi,$ 则由单调收敛定理, 有

$$
\begin{array}{rcl} E[f(\xi, \eta)] & = & \lim_{n \to \infty} E[f_{n}(\xi, \eta)] \\ & = & \lim_{n \to \infty} E[\varphi_{n}(\xi)] \\ & = & E[\varphi(\xi)].\end{array}
$$

分别考虑正负部, 我们有

推论 6.1.4. 将上定理中的条件 $^{\ast} f \geqslant 0^{\prime \prime}$ 换为“f使得 $f(\xi, \eta)$ 可积 $^{\dag},$ 结论依然成立.

我们还有:

推论 6.1.5. 记号与假设同推论 $6.1.4 \cdot$ 令 $\zeta : = f(\xi, \eta), A \in \mathcal{B}(\mathbb{R})$ . 则

$$
P(\zeta \in A) = E[g(\eta)] = \int_{- \infty}^{\infty} g(x) dF_{\eta}(x),
$$

其中

$$
g(x) = P(f(\xi, x) \in A).
$$

特别地, 若 $\eta$ 有密度函数 $.\rho,$ 则

$$
P(\zeta \in A) = \int_{A} g(x) \rho(x) dx.
$$

证明. 用 $1_{A} \circ f$ 代替f用上一推论.

下面是上面推论的一个重要特例.

推论 6.1.6. 设ξ, η是独立随机变量, $\zeta : = \xi + \eta$ . 则

$$
F_{\zeta}(y) = \int_{- \infty}^{\infty} F_{\xi}(y - x) dF_{\eta}(x) = \int_{- \infty}^{\infty} F_{\eta}(y - x) dF_{\xi}(x).
$$

这里当 $F_{\xi}$ 或 $F_{\eta}$ 不连续时, 中间和右边的积分理解为Lebesgue-Stieltjes积分; 当它们分段连续时, 按第四节习题4的意义理解.

特别地, 当 $\xi.$ 是连续型随机变量, 且有密度函数 $\mathbf{\nabla} \cdot \rho \varepsilon$ , 则 $\zeta$ 也是连续型 ${\dot{H}}{\dot{H}},$ , 且密度函数为

$$
\rho_{\zeta}(y) := \int_{- \infty}^{\infty} \rho_{\xi}(y - x) dF_{\eta}(x).
$$

证明. 取 $A =(- \infty, y], f(u, v) = u + v$ . 则

$$
g(x) = P(\xi + x \leqslant y) = P(\xi \leqslant y - x) = F_{\xi}(y - x).
$$

所以

$$
P(\zeta \leqslant y) = E[g(\eta)] = \int_{- \infty}^{\infty} F_{\xi}(y - x) dF_{\eta}(x).
$$

若ξ有密度函数 $\cdot \rho_{\xi}$ , 则上式右端成为

$$
\begin{array}{rcl} \int_{- \infty}^{\infty} dF_{\eta}(x) \int_{- \infty}^{y - x} \rho_{\xi}(u) du & = & \int_{- \infty}^{\infty} dF_{\eta}(x) \int_{- \infty}^{y} \rho_{\xi}(u - x) du \\ & = & \int_{- \infty}^{y} du \int_{- \infty}^{\infty} \rho_{\xi}(u - x) dF_{\eta}(x).\end{array}
$$

因此ζ是连续型的, 且密度函数为

$$
\rho_{\zeta}(y) = \int_{- \infty}^{\infty} \rho_{\xi}(y - x) dF_{\eta}(x).
$$

我们还有一个推论:

推论 6.1.7. 设 $\xi, \eta$ 独立, 且皆可积, 则 $\xi \eta$ 亦可积, 且

$$
E[\xi \eta] = E[\xi] E[\eta].
$$

证明. 取 $f(x, y) : = | xy |$ , 我们有

$$
E[| \xi \eta |] = E[| \xi |] E[| \eta |] < \infty.
$$

因此 $\xi \eta^{\mathrm{{\scriptsize ~ H}}}$ 积. 再取 $f(x, y) = xy$ 就得到所要的等式.

设ξ为随机变量, 称

$$
\sigma(\xi) := \xi^{- 1}(\mathcal{B})
$$

为ξ生成的σ-代数. 即 $\sigma(\boldsymbol{\xi})$ 为使ξ可测的最小σ-代数. 类似地, 设I是任一指标集, 定义 $\sigma(\xi_{i}, i \in$ I)为使所有 $\xi_{i}, i \in I$ , 可测的最小σ-代数.

命题 6.1.8. 设ξ, η独立, 那么 $\sigma(\boldsymbol{\xi})$ 与 $\sigma(\eta)$ 独立. $\sharp \eta \forall A, B \in{\mathcal{B}}$

$$
P(\xi \in A, \eta \in B) = P(\xi \in A) P(\eta \in B).
$$

证明. 记 ${\mathcal{A}} = \{(- \infty, x], x \in \mathbb{R}\}$ , 则 $\mathcal{B} = \sigma(\mathcal{A})$ . 因为ξ, η独立, 所以集类

$$
\xi^{- 1}(\mathcal{A}) = \{\{\xi \leqslant x\}, x \in \mathbb{R}\} \text{与} \eta^{- 1}(\mathcal{A}) = \{\{\eta \leqslant x\}, x \in \mathbb{R}\}
$$

独立, 且它们都是π-类. 由命题4.1.1有

$$
\sigma(\xi) = \xi^{- 1}(\mathcal{B}) = \xi^{- 1}(\sigma(\mathcal{A})) = \sigma(\xi^{- 1}(\mathcal{A})).
$$

同理 $\sigma(\eta) = \sigma(\eta^{- 1}(\mathcal{A}))$ . 所以由命题3.4.3, $\sigma(\xi) \varXi \sigma(\eta)$ 独立.

由此我们可以得到:

推论 6.1.9. 设ξ, η独立, 则对任意Borel函数 $f, g, f(\xi)$ 与 $g(\eta)$ 独立.

证明. 对任意 $x, y \in \mathbb{R}, f^{- 1}((- \infty, x]), g^{- 1}((- \infty, y]) \in \mathcal{B}$ . 所以

$$
\{f(\xi) \leqslant x\} \in \sigma(\xi), \{g(\eta) \leqslant y\} \in \sigma(\eta).
$$

再用上一命题即可.

## 6.1 基本定义及性质

因为上面的命题, 所以可以把

$$
P(\xi \in A, \eta \in B) = P(\xi \in A) P(\eta \in B), \forall A, B \in \mathcal{B}
$$

作为独立性的定义.

下面是独立的一系列充分必要条件.

定理 6.1.10. 下列论断等价：

(i) $\xi, \eta$ 独立;

(ii)对任意有界Borel函数 $f, g$ 有

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)].
$$

(iii) 对任意 $f, g \in C_{b}$ 有

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)].
$$

(iv) 对任意 $f, g \in C_{0}$ 有

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)].
$$

(v) 对任意 $f, g \in C_{0}^{\infty}$ 有

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)].
$$

证明. $(i) \Longrightarrow(ii){:}$ : 由上一推论.

(ii) $\implies(iii) \implies(iv) \implies(v)$ 显然.

以下反推.

(ii) $\begin{array}{r}{\mapsto(i) \colon \forall x, y.} \end{array}$ 取 $f(z) = 1_{(- \infty, x]}(z), g(z) = 1_{(- \infty, y]}(z)$ , 显然.

(iii) =⇒ (i): 设对任意 $f, g \in C_{b}$ 有

$$
E[f(\xi) g(\eta)] = E[f(\xi) g(\eta)].\tag{1.2}
$$

$\forall x, y,$ 取

$$
f_{n}(z) = 1_{(- \infty, x]}(z) + n \left(\frac{1}{n} + x - z\right) 1_{(x, x + \frac{1}{n}]},
$$

$$
g_{n}(z) = 1_{(- \infty, y]}(z) + n \left(\frac{1}{n} + y - z\right) 1_{(y, y + \frac{1}{n}]}.
$$

则

$$
E[f_{n}(\xi) g_{n}(\eta)] = E[f_{n}(\xi)] E[g_{n}(\eta)].
$$

令 $n \to \infty$ 得

$$
P(\xi \leqslant x, \eta \leqslant y) = P(\xi \leqslant x) P(\eta \leqslant y).
$$

$(iv) \implies(iii)$ : 现在, 设(1.2)对任意 $f, g \in C_{0}$ 成立. 对任意 $f, g \in C_{b}$ , 取 $f_{n}, g_{n} \in C_{0}$ 使得 $f_{n} \to f, g_{n} \to g$ (可选取 $f_{n}(x) = f(x) 1_{[- n, n]}$ 在 $x = \pm n$ 两点线性连续一下即可). 由于

$$
E[f_{n}(\xi) g_{n}(\eta)] = E[f_{n}(\xi)] E[g_{n}(\eta)],
$$

所以由有界收敛定理, 知

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)],
$$

即(1.2)对任意 $f, g \in C_{b}$ 成立.

$(v) \Longrightarrow(iv)$ : 最后, 设(1.2)对任意 $f, g \in C_{0}^{\infty}$ 成立. 对任意 $f, g \in C_{0}$ , 取 $f_{n}, g_{n} \in C_{0}^{\infty}$ 使得 $f_{n} \to f, g_{n} \to g$ (见附录11.4), 且

$$
\sup_{n} \sup_{x} | f_{n}(x) | \leqslant \sup | f(x) |, \sup_{n} \sup_{x} | g_{n}(x) | \leqslant \sup | g(x) |.
$$

因此, 同样由有界收敛定理, 有

$$
E[f(\xi) g(\eta)] = E[f(\xi)] E[g(\eta)],
$$

即(1.2)对任意 $f, g \in C_{0}$ 成立.

关于独立性的概念和结果可以很容易有以下推广.

第一, 推广到多个乃至无穷个随机变量的情形. 我们给出

定义 6.1.11. 设 $\xi_{1}, \xi_{2}, \cdots, \xi_{n}$ 为随机变量. 若对任意 $A_{i} \in \mathcal{B}, i = 1, 2, \cdot \cdot \cdot, n$

$$
P \left(\xi_{1} \in A_{1}, \dots, \xi_{n} \in A_{n}\right) = \prod_{i = 1}^{n} P \left(\xi_{i} \in A_{i}\right),
$$

$$
\xi_{1}, \dots, \xi_{n}
$$

设 $\xi_{1}, \xi_{2}, \cdots$ 为随机变量. 若对任意 $n, \xi_{1}, \xi_{2}, \cdots, \xi_{n}$ 独立, 则称 $\xi_{1}, \xi_{2}, \cdots$ 独立.

这样推广之后, 除了涉及两个分布函数卷积的结论之外, 其它都有相应的推广, 结果的叙述和证明都和两个时相似, 恕不一一叙述. 因为没有多个分布函数的卷积这个概念, 所以涉及卷积的结论没有直接的对应物, 但理论上可从两个出发, 逐个推进, 求出多个独立随机变量和的分布函数.

我们还可以证明下面的结论:

命题 6.1.12. 设 $\{\xi_{i}, i \in \mathbb{N}_{+ +}\}$ 独立, $I, J \subset N_{+ +}, I \cap J = \emptyset$ , 则 $\sigma(\xi_{i}, i \in I) \varXi \sigma(\xi_{i}, i \in J)$ 独立.证明. 令

$$
\Pi_{1} := \left\{\bigcap_{i \in I_{0}} \xi_{i}^{- 1}(A_{i}): I_{0} \subset I \text{为有限集}, A_{i} \in \mathcal{B} \right\},
$$

$$
\Pi_{2} := \left\{\bigcap_{j \in J_{0}} \xi_{j}^{- 1}(A_{j}): J_{0} \subset J \text{为有限集}, A_{j} \in \mathcal{B} \right\}.
$$

易见 $\Pi_{1}$ 与 $\Pi_{2}$ 独立且它们均为π-类. 所以由命题3.4.3, 它们所分别生成的σ-代数, 即 $\vert \sigma(\xi_{i}, i \in$ I)与 $\mathfrak{i} \sigma(\xi_{i}, i \in J)$ , 也独立. □

这个结果自然可推广到多个情形, 即我们有:

命题 6.1.13. 设 $\{\xi_{i}, i ~ \in ~ \mathbb{N}_{+ +}\}$ 独立, $I_{k} \subset N_{+ +}, k = 1, 2, \cdot \cdot \cdot$ , 且两两不交, 则 $\{\mathcal{G}_{k}, k =$ $1, 2 \cdots\}$ 独立, 其中 $\mathcal{G}_{k} : = \sigma(\xi_{i}, i \in I_{k})$ ).

由此立即得到:

命题 6.1.14. 设 $\{\xi_{i}, i \in \mathbb{N}_{+ +}\}$ 独立, $0 = n_{0} < n_{1} < n_{2} < \cdots$ $\hat{\ ?} r_{i} : = n_{i} - n_{i - 1}$ . 则对 $f_{i} \in \mathcal{B}^{r_{i}}, f_{1}(\xi_{1}, \cdot \cdot \cdot, \xi_{n_{1}}), f_{2}(\xi_{n_{1} + 1}, \cdot \cdot \cdot, \xi_{n_{2}}), f_{k}(\xi_{n_{k - 1} + 1}, \cdot \cdot \cdot, \xi_{n_{k}}), \cdot \cdot \cdot$ 独立.

我们看两个应用例子.

例1. $i \frac{\pi}{X} \xi_{1}, \xi_{2}, \cdots$ 是独立随机变量序列. 令

$$
S_{n} := \sum_{k = 1}^{n} \xi_{k}.
$$

设 $D \in{\mathcal{B}}$ . 令τ表示 $S_{n}$ 首次落入D的时刻:

$$
\tau := \inf \{n: S_{n} \in D\},
$$

即

$$
\{\tau = n\} = \{S_{k} \notin D, k = 1, 2, \dots, n - 1; S_{n} \in D\}.
$$

则 $\{\tau = n\} \in \sigma(\xi_{1}, \cdot \cdot \cdot, \xi_{n})$ , 因此它与 $\sigma(\xi_{k}, k \geqslant n + 1)$ 独立.

例2. 设 $\tau_{1}, \tau_{2}, \cdots$ 为独立同分布随机变量, 公共的分布是参数为λ的指数分布. 令

$$
\sigma_{n} := \sum_{i = 1}^{n} \tau_{i},
$$

求 $\scriptstyle{\mathcal{igma}}_{n}$ 的分布.

解. $\sigma_{1} = \tau_{1}$ , 所以 $\sigma_{1}$ 的密度函数为

$$
\rho_{1}(x) = \left\{\begin{array}{ll} \lambda e^{- \lambda x}, & x \geqslant 0, \\ 0, & x < 0.\end{array} \right.
$$

用上述推论和归纳法易证 $\sigma_{n}$ 的密度函数为

$$
\rho_{n}(x) = \left\{\begin{array}{ll} \frac{\lambda^{n} x^{n - 1}}{(n - 1) !} e^{- \lambda x}, & x \geqslant 0, \\ 0, & x < 0.\end{array} \right.
$$

$$
\xi_{t} := \sum_{n = 1}^{\infty} 1_{[\sigma_{n}, \infty)}(t),
$$

则对任意t, $\xi_{t}$ 为取非负整数值的随机变量, 表示的是有多少个 $\sigma_{n}$ 小于t. 其分布为

$$
P(\xi_{t} = n) = P(\sigma_{n} \leqslant t) - P(\sigma_{n + 1} > t) = \frac{(\lambda t)^{n}}{n !} e^{- \lambda t}.
$$

所以 $\xi_{t} \sim P(\lambda t)$

还记得那个找星星的小朋友吗? 设 $\cdot \sigma_{1}$ 为捕捉到第一个星星的时刻, 那么

$$
P(\sigma_{1} > t) = e^{- \lambda t}.
$$

记 $\sigma_{2}$ 为捕捉到第二个星星的时刻. 由于是重新开始了捕捉, 所以 $\sigma_{2} - \tau_{1}$ 与 $\sigma_{1}$ 独立, 且与 $\scriptstyle{\overline{{\sigma}}}_{1}$ 同分布. 依次下去, 可定义一列 $\sigma_{n} - \sigma_{n - 1}{\underline{{\Sigma}}} \sigma_{1}$ 同分布, 且

$$
\sigma_{1}, \sigma_{2} - \sigma_{1}, \dots, \sigma_{n} - \sigma_{n - 1}, \dots
$$

相互独立. 这样就可以对 $\sigma_{1}, \sigma_{2} - \sigma_{1}, \cdot \cdot \cdot, \sigma_{n} - \sigma_{n - 1}, \cdot \cdot \cdot$ 用上述结果. 于是我们明白了:

哦, 却原来他在[0,t)时段内找到的星星个数服从参数为λt的Poisson分布!

第二个方面的推广是可以推广到每个 $\cdot \xi_{i}$ 都是多维随机变量的情形, 并且值空间的维数可以不同. 此时概念和结果的叙述与证明都可以通过对上面数值情形做明显的修改得到, 就不一一写出了.

## 习题

1. 构造一个概率空间及其上的独立同分布随机变量列 $\xi_{1}, \xi_{2}, \cdots$ , 使得 $P(\xi_{1} = 1) = P(\xi_{1} =$ $\textstyle - 1) ={\frac{1}{2}}$

2. 设 $\xi, \eta$ 是独立随机变量, $E[| \xi + \eta |] < \infty$ . 问是否有 $E[| \xi |] < \infty ?$ 证明或给出反例.

3. (a) 设ξ与自己独立, 证明存在常数c使得 $P(\xi = c) = 1$

(b) 设 $\xi_{1}, \xi_{2}, \cdots$ 独立, $\xi_{n} \xrightarrow{a.s.} \xi.$ . 证明存在常数c使得 $P(\xi = c) = 1$

4. 设 $\langle \xi, \eta,$ θ是随机变量, $\xi \Xi \eta$ 同分布. 判断下列命题的真伪, 证明或给出反例.

(a) $\xi + \theta \Xi \eta + \theta$ 同分布;

(b) 在ξ与η独立的条件下, $\xi + \theta.$ 与 $\eta + \theta$ 同分布;

(c) 在三个随机变量独立的条件下, $\xi + \theta \Xi \eta + \theta$ 同分布;

5. 设(X,Y)的密度函数f具有形式 $f(x, y) = f_{1}(x) f_{2}(y)$ . 证明X与Y独立.

6. 设 $\xi_{1}, \xi_{2}, \eta$ 相互独立, $\begin{array}{r}{P(\eta = 1) = P(\eta = - 1) = \frac{1}{2}} \end{array}$ . 证明 $\cos(\xi_{1} + \eta \xi_{2})(\xi_{2} + \eta \xi_{1})$ 同分布.

7. 设X, Y, Z, ξ, η独立, $\begin{array}{r}{P(\xi = \pm 1) = P(\eta = \pm 1) = \frac{1}{2}} \end{array}$ . 证明 $| X + \xi | Y + \eta Z | | \xi | | X + \xi Y | +$ $\eta Z |$ 同分布.

8. 问: 是否存在一个二维随机向量 $(X_{1}, X_{2})$ 及两个随机变量 $X_{3}, X_{4}$ , 使得 $(X_{1}, X_{2}), X_{3}, X_{4}$ 不独立, 但 $X_{1}, X_{3}, X_{4}$ 独立, $X_{2}, X_{3}, X_{4}$ 也独立.

9. 问: 是否存在两个独立的, 均取值于[0, 1]的随机变量 $\xi, \eta,$ 使得 $\xi + \eta$ 服从[0, 2]上的均匀分布?

10. 设ξ服从[0, 1]上的均匀分布, η是Bernoulli随机变量, $\begin{array}{r}{P(\eta = 1) = P(\eta = - 1) = \frac{1}{2}} \end{array}$ , ξ与η独立. 求 $\xi^{- 1 / 2} \eta$ 的分布.

11. 设 $\begin{array}{r}{{P}(\xi = 1) = P(\xi = - 1) = \frac{1}{2}} \end{array}$ , ξ与η独立. 证明 $\xi \eta.$ 与ξ 独立的充要条件是 $\eta$ 是对称随机变量.

12. 设 $(\Omega,{\mathcal{F}}, P)$ 为离散概率空间, $\xi, \eta$ 是其上的随机变量, 且满足

$$
\omega \neq \omega^{\prime} \Longrightarrow \xi(\omega) \neq \xi(\omega^{\prime}), \eta(\omega) \neq \eta(\omega^{\prime}).
$$

证明: 除非有一个元素 $\omega_{0}$ 使得 $P(\{\omega_{0}\}) = 1$ , 否则ξ与η不可能独立.

## 6.1 基本定义及性质

13. 设ξ为连续型随机变量, 密度函数为f; η与ξ独立. 证明 $\xi + \eta$ 也是连续型随机变量, 密度函数为

$$
g(x) = E[f(x - \eta)].
$$

14. 设 $\xi, \eta$ 是有界随机变量, 且对任意非负整数 $m, n$ 有

$$
E[\xi^{m} \eta^{n}] = E[\xi^{m}] E[\eta^{n}].
$$

证明ξ, η独立.

15. 设ξ与η独立, 且 $\xi + \eta = 0$ . 证明ξ服从单点分布.

16. 设 $(\xi, \eta)$ 为连续型随机变量, A为R<sup>2</sup>中的一条简单曲线. 证明

$$
P((\xi, \eta) \in A) = 0.
$$

17. 设 $\xi, \eta$ 是独立同分布随机变量, 且是连续型的. 证明:

$$
P(\xi > \eta) = P(\xi < \eta) = \frac{1}{2}.
$$

18. 设 $\xi_{n}, n = 1, 2, \cdots$ 是独立同分布连续型随机变量序列. 令

$$
A_{n} := \{\omega : \xi_{m}(\omega) < \xi_{n}(\omega), \forall m < n\}, n \geqslant 2.
$$

证明 $A_{n}, n \geqslant$ 2独立且 $\textstyle P(A_{n}) ={\frac{1}{n}}$

19. 设 $\xi, \eta$ 独 $\begin{array}{r}{\dot{\overline{{\mathbf{\Gamma}}}} \dot{\mathbf{\Gamma}},} \end{array}$ 且η是连续型的. 证明 $\xi + \eta$ 也是连续型的. 去掉独立性条件之后该结论仍然成立吗? 证明或举出反例.

20. 设对任意 $i = 1, \cdots, n,$

$$
\xi_{i} = \sum_{j = 1}^{n_{i}} a_{ij} 1_{A_{ij}},
$$

其中 $\mathcal{A}_{i} : = \{A_{ij}, j = 1, \cdot \cdot \cdot n_{i}\}$ 为Ω的一个分割, a 是常数. 证明: $a_{ij}$ $\xi_{1}, \cdots, \xi_{n}$ 独立的充要条件是 $\mathcal{A}_{1}, \cdots, \mathcal{A}_{n}$ 独立.

21. 设 $\xi, \eta$ 为取值于R的独立同分布随机变量, 密度函数为 $f,$ 且方差存在. 令 $X : = | \xi - \eta |$ 求X的分布, 期望与方差.

22. 设 $\xi, \eta$ 是取值 $\mp[0, 1]$ 的独立同分布随机变量, 都服从均匀分布. 以d表示 (ξ, η)离点 $\left({\frac{1}{2}},{\frac{1}{2}} \right)$ 的距离, $d^{\prime}$ 表示它离四个顶点的距离的最小值. 求 $P(d \leqslant d^{\prime})$

23. 设 $\xi_{1}, \cdots, \xi_{n}$ 为独立同分布随机变量, 服从[0,1]上的均匀分布. 令

$$
X := \min \{\xi_{1}, \dots, \xi_{n}\}, Y := \max \{\xi_{1}, \dots, \xi_{n}\}.
$$

设0 $\leqslant a \leqslant b$ ⩽ 1, $x_{1}, \cdots, x_{n} \in[0, 1]$ . 计算 $P(\xi_{1} \leqslant x_{1}, \cdot \cdot \cdot, \xi_{n} \leqslant x_{n} | a \leqslant X \leqslant Y \leqslant b)$

24. 设 $\xi, \eta$ 是独立同分布随机变量, F是其公共的分布函数. 证明

$$
P(\xi \neq \eta) = \sum_{x \in \mathbb{R}} | F(x) - F(x -) |^{2}.
$$

25. 设(ξ,η)服从单位圆盘上的均匀分布. 令 $X : = \xi^{2} + \eta^{2}$ 2

$$
Y := \xi \sqrt{- \frac{2 \ln X}{X}}, Z := \eta \sqrt{- \frac{2 \ln X}{X}}.
$$

证明Y与Z独立同分布, 其共同的分布为 $N(0, 1)$

26. 设(ξ, η)服从[0, 1]<sup>2</sup>上的均匀分布. 令

$$
X := \sqrt{- 2 \ln \xi} \cos(2 \pi \eta), Y := \sqrt{- 2 \ln \xi} \sin(2 \pi \eta).
$$

证明X与Y 独立同分布, 其共同的分布为N(0, 1).

27. 设 ${\boldsymbol{\xi}} =(\xi_{1}, \cdots, \xi_{n})$ 是连续型随机向量, 密度函数具有形式 $\ ` f(x_{1}^{2} + \cdots + x_{n}^{2})$

(a) 设 $\mathrm{~ : ~} n \geqslant 2.$ 以 $(r, \theta_{1}, \cdot \cdot \cdot, \theta_{n - 1})$ 表示R<sup>n</sup>上的某个球极坐标. 证明 $r(\xi), \theta_{1}(\xi), \cdot \cdot \cdot, \theta_{n - 1}(\xi)$ 相互独立;

(b) 设A是n阶正交阵, 证明Aξ与ξ同分布.

28. 设ξ $\sim P(\lambda), \eta \sim P(\mu)$ , 且ξ与η独立. 计算 $\xi + \eta \Xi \xi - \eta$ 的分布列.

29. 设ξ, η是独立随机变量.

(a) 令

$$
\mathscr{F} := \{A \in \mathscr{B}^{2}: E[1_{A}(\xi, \eta)] = E[E[1_{A}(\xi, x)] |_{x = \eta}].
$$

证明 $\mathcal{F} = \mathcal{B}^{2}$

(b) 证明对R<sup>2</sup>上的任意简单Borel函数f,

$$
E[f(\xi, \eta)] = E[E[f(\xi, x)] |_{x = \eta}].
$$

(c) 证明对R<sup>2</sup>上的任意非负Borel函数f,

$$
E[f(\xi, \eta)] = E[E[f(\xi, x)] |_{x = \eta}].
$$

## 6.2 不相关与独立的关系

我们曾经证明, 当 $\xi, \eta$ 独立时, 只要 $E[\xi]$ 与 $E[\eta]$ 均存在, 那么就有 $E[\xi \eta] = E[\xi] E[\eta]$ , 而这就是不相关. 所以在期望存在时, 独立意味着不相关 (但要注意独立性对任意随机变量, 而不只是对期望存在的随机变量, 均可定义; 而不相关性则只有对期望存在的随机变量才能定义).

自然的问题是, 不相关是否意味着独立?

即使简单地从定义来看, 这个问题的答案也是否定的, 因为不相关是个整体的概念(求期望是整体概念), 但独立是局部概念, 因为ξ和η独立就意味着对任何 $A, B \in{\mathcal{B}}$ , 都有

$$
P(\xi \in A, \eta \in B) = P(\xi \in A) P(\eta \in B).
$$

顺着这个思路, 可以很容易找出反例.

例1. 设

$$
\Omega := \{\omega_{1}, \omega_{2}, \omega_{3}\}, P(\omega_{i}) = \frac{1}{3}, i = 1, 2, 3;
$$

## 6.2 不相关与独立的关系

$$
\xi(\omega_{1}) = 3, \xi(\omega_{2}) = - 2, \xi(\omega_{3}) = - 1;
$$

$$
\eta(\omega_{1}) = \frac{1}{3}, \eta(\omega_{2}) = \frac{1}{6}, \eta(\omega_{3}) = \frac{2}{3}.
$$

则

$$
E[\xi] = 0, E[\xi \eta] = 0.
$$

所以ξ与η不相关. 但

$$
P(\xi = 3, \eta = \frac{1}{3}) = P(\omega_{1}) = \frac{1}{3} \neq P(\xi = 3) P(\eta = \frac{1}{3}) = P(\omega_{1})^{2} = \frac{1}{9}.
$$

例2. 设η是随机变量, 值域为 $\{0,{\frac{\pi}{2}}, \pi\}$ , 且

$$
P(\eta = 0) = P(\eta = \frac{\pi}{2}) = P(\eta = \pi) = \frac{1}{3}.
$$

$$
\xi_{1} = \cos \eta, \xi_{2} = \sin \eta.
$$

则 $\xi_{1} \xi_{2} \equiv 0.$ . 故

$$
E[\xi_{1} \xi_{2}] = 0.
$$

又

$$
E[\xi_{1}] = 1 \times \frac{1}{3} + 0 \times \frac{1}{3} +(- 1) \times \frac{1}{3} = 0
$$

所以ξ<sub>1</sub>与 $\mathsf{\Pi}_{\vec{I}} \xi_{2}$ 不相关. 但由于

$$
\xi_{1}^{2} + \xi_{2}^{2} \equiv 1
$$

所以 $\xi_{1} \overset{\vartriangle}{\Finv} \xi_{2}$ 不可能独立. 例如我们有

$$
P(\xi_{1} = 0, \xi_{2} = 0) = 0,
$$

但

$$
P(\xi_{1} = 0) = \frac{1}{3}, P(\xi_{2} = 0) = \frac{2}{3},
$$

所以

$$
P(\xi_{1} = 0, \xi_{2} = 0) \neq P(\xi_{1} = 0) P(\xi_{2} = 0).
$$

但在一个重要的特殊情形, 不相关和独立是等价的, 这就是 $(\xi, \eta)$ 服从二维正态分布的情况.

设 $(\xi, \eta)$ 服从二维正态分布, 即 $(\xi, \eta) \sim N(\mu_{1}, \mu_{2}, \sigma_{1}^{2}, \sigma_{2}^{2}, \rho)$ , 其密度函数为

$$
\begin{array}{rcl} p(x, y) & = & \frac{1}{2 \pi \sigma_{1} \sigma_{2} \sqrt{1 - \rho^{2}}} \exp \bigg \{- \frac{1}{2(1 - \rho^{2})} \\ & & \cdot \left[\frac{(x - \mu_{1})^{2}}{\sigma_{1}^{2}} - \frac{2 \rho(x - \mu_{1})(y - \mu_{2})}{\sigma_{1} \sigma_{2}} + \frac{(y - \mu_{2})^{2}}{\sigma_{2}^{2}} \right] \bigg\}.\end{array}
$$

我们曾经证明

$$
\xi \sim N(\mu_{1}, \sigma_{1}), \eta \sim N(\mu_{2}, \sigma_{2}).
$$

而它们的协方差为

$$
\operatorname{Cov}(\xi, \eta) = \rho \sigma_{1} \sigma_{2}.
$$

所 $\downarrow \downarrow$ 就是相关系数. $\xi, \eta^{\mathrm{~ ~}}$ 不相关时 $\dot{\rho} = 0$ , 于是

$$
p(x, y) = p_{\xi}(x) p_{\eta}(y).
$$

从而ξ与η独立. 所以, 我们有

定理 6.2.1. 如果(ξ, η)服从二维正态分布, 那么ξ与η独立的充要条件是它们不相关.

注意这里的前提条件： $(\xi, \eta)$ 服从二维正态分布. 注意即使 $(\xi, \eta)$ 不服从二维正态分布, ξ,η的边沿分布仍然有可能是正态分布, 此时定理不再成立.

从另一个角度看, 也可以这样说：两个独立的正态分布的联合分布是二维正态分布, 两个不相关的正态分布的联合分布未必是二维正态分布.

例3. 令

$$
\varphi(x) := \frac{1}{\sqrt{2 \pi}} e^{- x^{2} / 2}.
$$

设 $g$ 为连续偶函数, 满足

$$
| g(x) | \leqslant \varphi(x),
$$

$$
\int_{- \infty}^{\infty} g(x) dx = 0.
$$

定义

$$
p(x, y) := \varphi(x) \varphi(y) + g(x) g(y),
$$

因为 $p(x, y) \geqslant 0$ , 且

$$
\int_{- \infty}^{\infty} p(x, y) dy := \int_{- \infty}^{\infty} \varphi(x) \varphi(y) dy + \int_{- \infty}^{\infty} g(x) g(y) dy = \varphi(x),
$$

$$
\int_{- \infty}^{\infty} p(x, y) dx = \varphi(y),
$$

则 $p(x, y)$ 是二维密度函数.

设 $(\xi, \eta)$ 的联合密度函数为 $\scriptstyle{Ip(x, y)}$ , 则ξ的边沿密度函数为 $\varphi(x)$ , η的边沿密度函数为 $\varphi(y)$ 所以我们有:

(i) (ξ,η)的两个边沿分布都是正态分布;

(ii) ξ与η不相关, 因为

$$
\begin{array}{rcl} E[\xi \eta] & = & \iint xyp(x, y) dxdy \\ & = & \iint xy \varphi(x) \varphi(y) dxdy + \iint xyg(x) g(y) dxdy \\ & = & 0 = E[\xi] E[\eta]; \end{array}
$$

(iii) $\xi \Xi \eta \mathcal{K}$ 独立, 因为存在 $x, y, p(x, y) \neq \varphi(x) \varphi(y)$ ;

(iv) $(\xi, \eta)$ 不服从二维正态分布, 因为 $| p(x, y)$ 不是正态分布的密度函数.

所以你不能贸然说：两个服从正态分布的随机变量如果不相关, 则一定独立. 在下这个结论的时候, 一定要注意前提是否满足, 即联合分布是否为正态分布.

我们可以把这个例子的方法一般化: 设 ${\bf \dot{\boldsymbol{p}}}(x, y)$ 为密度函数, $q(x, y)$ 是Riemann可积函数,满足:

$$
| q(x, y) | \leqslant p(x, y),
$$

$$
\int_{R} q(x, y) dx = \int_{R} q(x, y) dy = 0.
$$

则

$$
p(x, y) + q(x, y)
$$

也是密度函数, 且 ${\vec{\jmath}} p(x, y)$ 有相同的边沿分布.

这又一次说明了, 不同的联合分布可以对应同样的边沿分布.

习题

1. 设 $\begin{array}{r}{\mathrm{~ : ~} \sim N(0, 1), P(\eta = 1) = P(\eta = - 1) = \frac{1}{2}} \end{array}$ , η与ξ独立. 令 $\zeta = \xi \eta$

(a) 求ζ的分布;

(b) 求(ξ, ζ)的协方差矩阵;

(c) (ξ,ζ)是否服从正态分布? 证明你的结论.

2. 举例说明两个正态随机变量之和未必是正态随机变量.

3. (a) 设ξ与自己不相关, 证明ξ为常数;

(b) 设ξ与自己独立, 证明ξ为常数;

4. 设 $\xi_{i} \overset \vartriangle{\Finv} \eta_{j}$ 不相关, $c_{i}, d_{j}$ 为常数, $i = 1, \cdots, n, j = 1, \cdots, m$ . 证明 $\textstyle \sum_{i = 1}^{n} c_{i} \xi_{i}$ 与 $\Sigma_{j = 1}^{m} d_{j} \eta_{j}$ 不相关.

5. 设 $\xi, \eta.$ 是随机变量, 且 ${\xi - \eta}$ 既与ξ不相关也与η不相关. 证明 $\xi - \eta$ 为常数.

6. 设ξ, η为随机变量, $E[\xi] = E[\eta] = 0, D[\xi] = D[\eta] = 1$ , ξ与η的相关系数为ρ. 证明:

$$
E[\max(\xi^{2}, \eta^{2})] \leqslant 1 + \sqrt{1 - \rho^{2}}.
$$

7. 设 $\xi, \eta$ 为随机变量, ξ与η的相关系数为 $I \rho.$ 证明: $\forall \varepsilon > 0$

$$
P(\{| \xi - E[\xi] | \leqslant \varepsilon\} \cup \{| \eta - E[\eta] | \leqslant \varepsilon\}) \leqslant \frac{1}{\varepsilon^{2}}(1 + \sqrt{1 - \rho^{2}}).
$$

8. 设ξ和η均为只取两个不同值的随机变量. 证明ξ与 $i \eta \mathrm{\cdot}$ 独立的充要条件是它们不相关.

## 6.3 独立随机变量之和

本节我们研究独立随机变量之和的收敛性. 具体地说, 假设{ξ }是独立随机变量序列. 我们要研究

$$
S_{n} := \sum_{i = 1}^{n} \xi_{i}
$$

的收敛性问题.

有别于一般的随机级数, 这个由独立随机变量组成的级数有许多独特的性质, 其中第一个就是:

命题 6.3.1. $\textstyle S_{n} \mathcal{\Pi}$ 乎必然收敛和依概率收敛是等价的.

这个命题得以成立的道理是我们有下面的Ottaviani不等式:

引理 6.3.2 (Ottaviani不等式). 设有正常数a, b使得对任意1 $.\leqslant k \leqslant n$ 有

$$
P(| S_{n} - S_{k} | \leqslant b) \geqslant a.
$$

则对任意 $c > 0$

$$
P \left(\max_{1 \leqslant k \leqslant n} | S_{k} | > b + c\right) \leqslant \frac{1}{a} P(| S_{n} | > c).
$$

证明. 令

$$
\tau := \inf \{k: | S_{k} | > b + c\},
$$

$$
A_{k} := \left\{\left| S_{n} - S_{k} \right| \leqslant b \right\}.
$$

则 $\{\tau = k\}, k = 1, \cdots$ , n互不相交, 且

$$
\sum_{k = 1}^{n} \{\tau = k\} = \left\{\max_{1 \leqslant k \leqslant n} | S_{k} | > b + c \right\},
$$

$$
\sum_{k = 1}^{n} \{\tau = k\} A_{k} \subset \{| S_{n} | > c\}.
$$

由于 $\{\tau = k\} \in \sigma(\xi_{1}, \cdot \cdot \cdot, \xi_{k}), A_{k} \in \sigma(\xi_{k + 1}, \cdot \cdot \cdot, \xi_{n})$ , 所以 $\{\tau = k\}$ 与 $A_{k}$ 独立, $\forall k$ . 因此

$$
\begin{array}{rcl} P(| S_{n} | > c) & \geqslant & P \left(\sum_{k = 1}^{n} \{\tau = k\} A_{k}\right) \\ & = & \sum_{k = 1}^{n} P(\tau = k) P(A_{k}) \\ & \geqslant & a \sum_{k = 1}^{n} P(\tau = k) \\ & = & aP \left(\max_{1 \leqslant k \leqslant n} | S_{k} | > b + c\right).\end{array}
$$

下面我们证明:

定理 6.3.3. $S_{n}$ 依概率收敛与几乎必然收敛等价.

证明. 只需证明前者蕴含后者. $\forall \varepsilon > 0, \delta > 0$ , 取整数N使得 $m, n \geqslant$ N时

$$
P(| S_{n} - S_{m} | > \varepsilon) < \delta, P(| S_{n} - S_{m} | \leqslant \varepsilon) > 1 - \delta.
$$

于是由上一引理

$$
P \left(\max_{1 \leqslant k \leqslant n} | S_{N + k} - S_{N} | > 2 \varepsilon\right) \leqslant \frac{1}{1 - \delta} P(| S_{N + n} - S_{N} | > \varepsilon) < \frac{\delta}{1 - \delta}.
$$

因为

$$
\left\{\max_{m, n > N} | S_{m} - S_{n} | > 4 \varepsilon \right\} \subset \left\{\max_{m > N} | S_{m} - S_{N} | > 2 \varepsilon \right\} \bigcup \left\{\max_{n > N} | S_{n} - S_{N} | > 2 \varepsilon \right\},
$$

因此

$$
P \left(\max_{m, n > N} | S_{m} - S_{n} | > 4 \varepsilon\right) < \frac{2 \delta}{1 - \delta}.
$$

由ε, δ的任意性和(4.6), 知 $S_{n} \Pi_{\mathfrak{u}}$ 乎必然收敛.

□

为得到 $S_{n}$ 依概率收敛的条件, 我们需要下面的不等式.

定理 6.3.4. 记号和条件同上. 设 $E[\xi_{n}] = 0, \forall n$ , 则

(i) $(Chatterji \mathcal{K}$ 等式)设1 $\leqslant p < 2$ , 则

$$
\| S_{n} \|_{p}^{p} \leqslant 2^{2 - p} \sum_{i = 1}^{n} \| \xi_{i} \|_{p}^{p}.
$$

(ii) $(Rio \mathcal{K}$ 等式)设 $_{\perp p} \geqslant 2$ . 则

$$
\| S_{n} \|_{p}^{2} \leqslant(p - 1) \sum_{i = 1}^{n} \| \xi_{i} \|_{p}^{2}.
$$

我们先证明下述引理, 第二个结果的证明需要它.

引理 6.3.5. 设 $p \geqslant 2, \xi, \eta$ 为独立随机变量, $E[| \xi |^{p}] < \infty, E[| \eta |^{p}] < \infty$ , 且 $E[\eta] = 0$ . 则

$$
\| \xi + \eta \|_{p}^{2} \leqslant \| \xi \|_{p}^{2} +(p - 1) \| \eta \|_{p}^{2}.
$$

证明. $\sharp p = 2 \sharp \cdot \boldsymbol{\mathrm{J}}$ , 只需对平方项展开后利用独立性和 $E[\eta] = 0$ 消除交叉项, 便可得到等式.因此下面假设 $p > 2.$ . 令

$$
\varphi_{t} := \| \xi + t \eta \|_{p}^{p}.
$$

设 $x, y \in \mathbb{R}$ . Taylor展开到二阶项, 得

$$
| x + ty |^{p} = | x |^{p} + pt | x |^{p - 2} xy + p(p - 1) \int_{0}^{t} ds \int_{0}^{s} | x + uy |^{p - 2} y^{2} du.
$$

将x, y用ξ, η代入, 取期望, 用Fubini定理并注意

$$
E[| \xi |^{p - 2} \xi \eta] = E[\eta] E[| \xi |^{p - 2} \xi] = 0,
$$

及(由H¨older不等式)

$$
E \left[| \xi + u \eta |^{p - 2} \eta^{2} \right] \leqslant \| \xi + u \eta \|_{p}^{p - 2} \| \eta \|_{p}^{2},
$$

我们有

$$
\varphi_{t} \leqslant \| \xi \|_{p}^{p} + p(p - 1) \| \eta \|_{p}^{2} \int_{0}^{t} ds \int_{0}^{s} \varphi_{u}^{1 - 2 / p} du.
$$

于是由附录推论11.2.4有

$$
\varphi_{t} \leqslant \left(\| \xi \|_{p}^{2} +(p - 1) t^{2} \| \eta \|_{p}^{2}\right)^{p / 2}.
$$

取t = 1并在两边开 $\dot{p} / 2$ 次方即完成证明.

有了这个引理, 定理6.3.4第二个结果的证明就呼之即出了. 实际上, 我们有：

$$
\begin{array}{rcl} \| S_{n} \|_{p}^{2} & = & \| S_{n - 1} + \xi_{n} \|_{p}^{2} \\ & \leqslant & \| S_{n - 1} \|_{p}^{2} +(p - 1) \| \xi_{n} \|_{p}^{2} \\ & \leqslant & \dots \dots \\ & \leqslant &(p - 1) \sum_{i = 1}^{n} \| \xi_{i} \|_{p}^{2}.\end{array}
$$

现在我们证明第一个结论. 首先注意 $p = 1$ 时对任意 $\cdot \xi_{i}$ 均成立, 且不等式后面的常数是1.因此下面假设1 $< p < 2$ . 此时, 先证明下面的引理.

引理 6.3.6. 设 $\xi, \eta$ 为两个独立的随机变量, $E[\eta] = 0, 1 < p < 2$ . 则

$$
E[| \xi + \eta |^{p}] \leqslant E[| \xi |^{p}] + 2^{2 - p} E[| \eta |^{p}].
$$

证明. 令

$$
C_{p} := \sup_{x \in \mathbb{R}} \frac{| 1 + x |^{p} - 1 - px}{| x |^{p}} \leqslant 2^{2 - p}.
$$

则对任意x, $y \in$ R有

$$
| x + y |^{p} \leqslant | x |^{p} + p | x |^{p - 1} \mathrm{sgn}(x) y + C_{p} | y |^{p}.
$$

以 $x = \xi, y = \eta \mathbb{\mathrm{\#}}$ 入并取期望, 仍注意到

$$
E[| \xi |^{p - 1} \mathrm{sgn}(\xi) \eta] = E[| \xi |^{p - 1} \mathrm{sgn}(\xi)] E[\eta] = 0,
$$

即得

$$
E[| \xi + \eta |^{p}] \leqslant E[| \xi |^{p}] + C_{p} E[| \eta |^{p}].
$$

对 $\xi = S_{n - 1}, \eta = \xi_{n}$ 用上面的引理有

$$
E[| S_{n - 1} + \xi_{n} |^{p}] \leqslant E[| S_{n - 1} |^{p}] + 2^{2 - p} E[| \xi_{n} |^{p}].
$$

递推下去便得到定理6.3.4的第一个结论.

下面我们证明:

定理 6.3.7. 设1 $\leqslant p < \infty$ , 且

$$
\sum_{n = 1}^{\infty} \| \xi_{i} \|_{p}^{p \wedge 2} < \infty,
$$

则 $S_{n}$ <sup>a.s.</sup> −−→ 且 $S_{n}$ 在 $L^{p}$ 中收敛.

证明. 注意对 $n > m$ , 由引理6.3.4有

$$
\| S_{n} - S_{m} \|_{p}^{p \wedge 2} \leqslant C \sum_{i = m + 1}^{n} \| \xi_{i} \|_{p}^{p \wedge 2} \to 0,
$$

所以 $S_{n}$ 在 $L^{p}.$ 是Cauchy列, 因此是依概率的Cauchy列, 于是 $S_{n} \stackrel{P}{}$ . 再由上一定理知 $S_{n} \xrightarrow{a.s.}$ 设这个极限是 ${\cal S},$ 则由Fatou引理

$$
E[| S_{n} - S |^{p}] \leqslant \operatorname{liminf}_{m \to \infty} E[| S_{n} - S_{m} |^{p}] \leqslant C \left(\sum_{i = n + 1}^{\infty} \| \xi_{i} \|_{p}^{p \wedge 2}\right)^{\frac{p}{p \wedge 2}}.
$$

所以

$$
\lim_{n \to \infty} E[| S_{n} - S |^{p}] = 0.
$$

习题

1. 设 $\xi, \eta_{1}, \eta_{2}$ 是随机变量, $\sigma(\xi) \varXi \sigma(\eta_{1}, \eta_{2})$ 独立. 设 $f : \mathbb{R}^{3} \mapsto \mapsto$ R为有界Borel函数. 证明

$$
E[f(\xi, \eta_{1}, \eta_{2})] = E[\varphi(\eta_{1}, \eta_{2})],
$$

其中

$$
\varphi(x, y) := E[f(\xi, x, y)].
$$

2. 设 $\varphi$ 是凸函数, $\xi, \eta$ 是独立随机变量, $E[\xi] = 0.$ . 设 $\zeta \in \sigma(\eta)$ 且下式中涉及的随机变量均可积. 证明

$$
E[\varphi(\xi + \eta) \zeta] \geqslant E[\varphi(\eta) \zeta].
$$

3. 设 $\xi_{1}, \xi_{2}, \cdots, \xi_{n}$ 是独立随机变量, $E[\xi_{k}] = 0, \forall k$ . 设 $\cdot \varphi$ 是 $\ntrianglerighteq$ 函数且下面涉及到的期望均有 限. 令

$$
\begin{array}{c} S_{n} := \sum_{k = 1}^{n} \xi_{k}, \\ \tau := \inf \{k: | S_{k} | \geqslant C\}.\end{array}
$$

证明:

$$
E[\varphi(S_{n}) 1_{\tau = k} |] \geqslant E[\varphi(S_{k}) 1_{\tau = k}].
$$

4. 记号同上. 证明: $\forall p > 1$

$$
\sum_{k = 1}^{n} E[\varphi(S_{k}) 1_{\tau = k}] \leqslant E[\varphi(S_{n})],
$$

5. 设 $\xi_{1}, \xi_{2}, \cdots, \xi_{n}$ 是相互独立随机变量， $E[\xi_{i}] ~ = ~ 0$ , ∀i. 记 $S_{k} : = \xi_{1} + \cdot \cdot \cdot + \xi_{k}$ . 证明Kolmogorov不等式

$$
P \left(\max_{1 \leqslant k \leqslant n} | S_{k} | \geqslant C\right) \leqslant \frac{E[S_{n}^{2}]}{C^{2}}.
$$

6. 条件和符号与上一题相同. 证明:若 $\varphi$ 还是非负偶函数, 且在正半轴上是递增的, 则

$$
P \left(\max_{1 \leqslant k \leqslant n} \varphi(S_{k}) \geqslant \varepsilon\right) \leqslant \frac{1}{\varphi(\varepsilon)} E[\varphi(S_{n})], \forall \varepsilon > 0.
$$

这就是广义Kolmogorov不等式 $(\mathbb{H} \mathbb{X} \varphi(x) : = x^{2}$ 则得到本来的Kolmogorov不等式).

7. 从(广义)Kolmogorov不等式出发, 你可以在什么条件下得到 $S_{n},$ 几乎一致收敛的结论?

8. 证明: $\mathbb{X} \mathbb{I} p >$ 1有

$$
E \left[\left(\max_{1 \leqslant k \leqslant n} | S_{k} |\right)^{p} \right] \leqslant q^{p} E[| S_{n} |^{p}],
$$

其中 $1 / p + 1 / q = 1$ . 此不等式称为Doob不等式.

9. 设 $\xi_{1}, \cdots, \xi_{n}$ 独立, $p \geqslant 1, E[| \xi_{i} |^{p}] < \infty, E \xi_{i} = 0, \forall i$ . 再设 $\eta_{1}, \cdots, \eta_{n}$ 是有界随机变量,$\eta_{1}$ 是常数, $\eta_{k} \in \sigma(\xi_{1}, \cdots, \xi_{k - 1})$ , ∀k > 2. 令

$$
S_{k} := \eta_{1} \xi_{1} + \dots + \eta_{k} \xi_{k}.
$$

证明 $\forall c > 0$

$$
P \left(\sup_{1 \leqslant k \leqslant n} | S_{k} | \geqslant c\right) \leqslant \frac{1}{c^{p}} E[| S_{n} |^{p}].
$$

## 6.4 随机游动

上节我们研究了独立随机变量之和 $S_{n}$ 的收敛问题. 从收敛的条件可以看出, 为保证 $S_{n}$ 收敛, 基本上是需要 $\| \xi_{n} \|_{p}$ 随n的增加而变小. 现在考虑另一种情况, 即 $\xi_{n}$ 们同分布的情况. 此时$\| \xi_{n} \|$ 是常数, 因此除非它等于零(这种情况毫无必要研究), 否则不可能收敛. 但这时有别的问题需要研究.

这种情况称为随机游动, 因为直观上, 如果一个醉鬼在大街上失去控制地、踉跄地游动,那基本上就是一个随机游动. 当然, 随机游动还可以作为其它许多实际问题的数学模型, 例如金融市场上股价的模型. 基于其立足的背景, 就需要研究各种各样的问题. 例如对于股价, 股民们关心什么? 无非是股价的波动, 预期的收益, 买卖的时机等等. 这些问题就构成了随机游动理论丰富的研究内容 当然这些远远地超出了本课程的范围 本节将介绍一些最初等的概念和结果. 我们先从数学上严格界定随机游动.

定义 6.4.1. 设 $\xi_{1}, \xi_{2}, \cdots$ 是独立同分布随机变量列, $E[\xi_{1}] = 0, E[\xi_{1}^{2}] = 1$ . 则

$$
S_{0} := 0, S_{n} := \sum_{k = 1}^{n} \xi_{k}
$$

称为随机游动.

## 6.4 随机游动

最简单的随机游动的例子当然是

$$
P(\xi_{1} = 1) = P(\xi_{1} = - 1) = \frac{1}{2}.
$$

我们称之为简单随机游动.

我们有

命题 6.4.2.

$$
E[S_{n}] = 0, E[S_{n}^{2}] = n, \forall n.
$$

证明. (i) 用期望的线性性有(注意这里不需要独立性)

$$
E[S_{n}] = \sum_{k = 1}^{n} E[\xi_{k}] = 0.
$$

(ii) 利用独立性有(独立性派上用场了)

$$
\begin{array}{rcl} E[S_{n}^{2}] & = & \sum_{k = 1}^{n} E[\xi_{k}^{2}] + \sum_{i \neq j} E[\xi_{i} \xi_{j}] \\ & = & n + \sum_{i \neq j} E[\xi_{i}] E[\xi_{j}] \\ & = & n.\end{array}
$$

下面我们把这个结果做一个重要推广, 即由确定性时刻n推广到一类随机时刻, 即所谓停时. 为说明什么是停时, 我们先引进记号

$$
\mathcal{F}_{n} := \sigma(S_{k}, k \leqslant n) = \sigma(\xi_{1}, \dots, \xi_{n}).
$$

$\mathcal{F}_{n}$ 的直观含义是, 它代表了序列 $\{S_{0}, S_{1}, S_{2}, \cdot \cdot \cdot\}$ 在时刻n之前(包含n) 所包含的全部信息.

现在我们可以给出:

定义 6.4.3. 设 $\tau : \Omega \mapsto \mathbb{N}_{+} \cup \{\infty\}$ . 若∀n, $\{\tau \leqslant n\} \in{\mathcal{F}}_{n}$ , 那么 τ就称为停时.

设τ为停时. 若存在常数 $C, \tau \leqslant C{\mathrm{~ a.s.}}$ , 称τ为有界停时; 若 $\tau < + \infty \mathrm{a.s.}$ ., 称τ为有限停时.

可以这样来理解停时: 如果τ代表某件事发生的时刻, 那么这件事 $\not \Eup n$ 之前是否发生(即是否τ $\leqslant n)$ , 可以由到n时刻为止这个序列提供的全部信息 $(\mathbb{E} | \mathcal{F}_{n})$ 来判断. 换一种说法, 这就是 $\{\tau \leqslant n\} \in \mathcal F_{n}$

比如说, 你驾车从甲地去丙地, 中间要经过乙地. 公路上每隔10公里有一个标志, 说明此地何地. 那么, 若以τ表示你第一次看到乙地地标的时间, 那么τ就是一个停时;相反, 如果θ表示你最后一次看到乙地地标的时间, θ就不是一个停时, 因为你必须看到下一个地标才能判断上一次看到的是不是最后一个乙地地标.

如果你初到一个国家, 得到一本日历, 且该日历上注明了所有的节假日, 说明今夕何夕.那么, 你过第一个节日的时刻,是一个停时,但你过最后一个节日的时间,就不是停时. 当然,下这个结论的前提是, 你不会把日历往前翻, 也不会有人告诉你一年到底有几个节假日.

因为 $\{\tau \leqslant k\} \in \mathcal{F}_{k}$ , 而 $\mathcal{F}_{k} \overset{\_}{} \xi_{k + 1}, \xi_{k + 2}, \cdot \cdot \cdot$ 独立, 所以 $\{\tau \leqslant k\}$ 与 $\xi_{k + 1}, \xi_{k + 2}, \cdot \cdot$ ·独立. 这一事实将起到非常重要的作用. 例如我们利用它就可以证明:

定理 6.4.4 (Wald等式). 设 $S_{n}$ 是随机游动, τ是有界停时, 则

$$
E[S_{\tau}] = 0, E[S_{\tau}^{2}] = E[\tau].
$$

证明. 设 $\tau \leqslant n.$ 此时 $\textstyle \cdot \sum_{k = 0}^{n} 1_{\tau = k} = 1$ . 我们有

$$
\begin{array}{rcl} E[S_{\tau}] & = & E \left[\sum_{k = 0}^{n} S_{k} 1_{\tau = k} \right] \\ & = & \sum_{k = 0}^{n}(E[S_{k}; \tau = k] + E[S_{n} - S_{k}] E[1_{\tau = k}]) \\ & = & \sum_{k = 0}^{n}(E[S_{k}; \tau = k] + E[(S_{n} - S_{k}) 1_{\tau = k}]) \\ & = & \sum_{k = 0}^{n} E[S_{n} 1_{\tau = k}] \\ & = & E \left[S_{n} \sum_{k = 0}^{n} 1_{\tau = k} \right] \\ & = & E[S_{n}] = 0, \end{array}
$$

以及

$$
\begin{array}{rcl} E[S_{\tau}^{2}] & = & E[(S_{\tau} - S_{n} + S_{n})^{2}] \\ & = & E[(S_{\tau} - S_{n})^{2}] + 2E[(S_{\tau} - S_{n}) S_{n}] + E[S_{n}^{2}] \\ & = & \sum_{k = 0}^{n} E[(S_{k} - S_{n})^{2}; \tau = k] + E[S_{n}^{2}] \\ & & - 2 \sum_{k = 0}^{n} E[(S_{n} - S_{k})(S_{k} + S_{n} - S_{k}); \tau = k] \\ & = & \sum_{k = 0}^{n}(n - k) P(\tau = k) + n - 2 \sum_{k = 0}^{n}(n - k) P(\tau = k) \\ & = & n - \sum_{k = 0}^{n}(n - k) P(\tau = k) \\ & = & \sum_{k = 0}^{n} kP(\tau = k) \\ & = & E[\tau].\end{array}
$$

若τ仅为有限停时, 这个结论不一定成立, 但附加上一定的条件后是可以成立的. 即我们有下面的:

推论 6.4.5. 设τ是有限停时, 且有常数C使

$$
\sup_{n} | S_{\tau \wedge n} | \leqslant C,
$$

则上面结果依然成立, $\Sigma E[\tau] \leqslant C^{2}$

证明. 令 $\tau_{n} : = \tau \wedge n$ , 易证 $\tau_{n}$ 是停时, 且有界. 因此

$$
E[S_{\tau_{n}}] = 0, E[S_{\tau_{n}}^{2}] = E[\tau_{n}].
$$

由有界收敛定理,

$$
E[S_{\tau}] = \lim_{n \to \infty} E[S_{\tau_{n}}] = 0,
$$

$$
E[S_{\tau}^{2}] = \lim_{n \to \infty} E[S_{\tau_{n}}^{2}] = \lim_{n \to \infty} E[\tau_{n}] \leqslant C^{2}.
$$

再由单调收敛定理,

$$
\lim_{n \to \infty} E[\tau_{n}] = E[\lim_{n \to \infty} \tau_{n}] = E[\tau].
$$

□

于是我们有：

推论 6.4.6. 设 $S_{n}$ 是简单随机游动, a,b是整数且 $a < 0 < b$ . 令

$$
\tau := \inf \{n: S_{n} \notin(a, b)\}.
$$

则

$$
E[S_{\tau}] = 0, E[S_{\tau}^{2}] = E[\tau].
$$

特别地,

$$
\begin{array}{c}{E[\tau] < \infty,} \\{P(S_{\tau} = a) = \frac{b}{b - a}, P(S_{\tau} = b) = \frac{- a}{b - a}.} \end{array}
$$

证明. 令 $\cdot \tau_{a} : = \operatorname{inf} \{n : S_{n} = a\}, \tau_{b} : = \operatorname{inf} \{n : S_{n} = b\}$ , 则 $\tau = \tau_{a} \wedge \tau_{b}$ . 由习题1, $\tau_{a}, \tau_{b}$ 为有限停时. 因为 $\{\tau > n\} = \{\tau_{a} > n\} \cap \{\tau_{b} > n\}$ , 因此 τ也为停时, 且 $\begin{array}{r}{.\operatorname{sup}_{n} \left| S_{\tau \wedge n} \right| \leqslant(- a) \vee b,} \end{array}$ 所以可以用上面的结果.

又

$$
\begin{array}{rcl} 0 = E[S_{\tau}] & = & E[a1_{S_{\tau} = a}] + E[b1_{S_{\tau} = b}] \\ & = & aP(S_{\tau} = a) + bP(S_{\tau} = b), \end{array}
$$

$$
P(S_{\tau} = a) + P(S_{\tau} = b) = 1,
$$

解出得

$$
P(S_{\tau} = a) = \frac{b}{b - a}, P(S_{\tau} = b) = \frac{- a}{b - a}.
$$

这个结果告诉我们, 从零点出发的随机游动先到达a的可能性与先到达b的可能性之比,恰好是起点离它们的距离之比的倒数——这是符合直觉的.

习题

1. 设 $\{S_{n}\}$ 是简单随机游动.

(a) 证明: $\forall k \in \mathbb{N}_{+}$ •

$$
\lim_{n \to \infty} P(S_{2n} = 2k) = 0.
$$

(提示: 利用Stirling公式)

(b) $\forall k \geqslant 0,$ 令

$$
A_{k} := \{\operatorname{limsup}_{n \to \infty} S_{n} \geqslant k\}.
$$

证明 $\begin{array}{r}{P(A_{k}) \geqslant \frac{1}{2}} \end{array}$ . (提示: 利用Fatou引理)

(c) 证明

$$
P(\{\limsup_{n \to \infty} S_{n} = \infty\}) = 1,
$$

$$
P(\{\operatorname{liminf}_{n \to \infty} S_{n} = - \infty\}) = 1.
$$

(提示: 利用Kolmogorov0 − 1律.)

(d) 设 $a \in \mathbb{N}.$ 令 $\tau_{a} : = \operatorname{inf} \{n : S_{n} = a\}$ . 证明 $\tau_{a}$ 为有限停时.

2. 举例说明, 在推论6.4.5中, 条件 $\begin{array}{c}{{\operatorname{sup}_{n} | S_{\tau \wedge n} | \leqslant C}} \end{array}$ 不能去掉.

## 6.5 条件独立性

正如事件之间的关系一样, 随机变量之间, 除了独立性, 还有条件独立性的概念.

定义 6.5.1. 设 $\xi, \eta \mathcal{\hat{H}}$ 别是 $\textit{m}$ 维和n维随机变量.

(i) 设C是事件, $P(C) > 0$ . 若

$$
P(\xi \in A, \eta \in B | C) = P(\xi \in A | C) P(\eta \in B | C) \forall A \in \mathcal{B}^{m}, B \in \mathcal{B}^{n},
$$

则称给定C时, $\xi \xrightarrow{\vartriangle} \eta$ 条件独立.

(ii) 设 $\mathcal{P} : = \{C_{i}, i = 1, 2, \cdot \cdot \cdot\}$ 为分割. 若

$$
P(\xi \in A, \eta \in B | C_{i}) = P(\xi \in A | C_{i}) P(\eta \in B | C_{i}) \forall A \in \mathscr{B}^{m}, B \in \mathscr{B}^{n}, i = 1, 2, \dots,
$$

则称给定 $\mathcal{P} |$ 时, $\xi.$ 与 $\eta$ 条件独立.

(iii) 设ζ为离散随机变量, 值域为 $\{c_{i}, i = 1, 2, \cdot \cdot \cdot\}$ . 令 ${\cal \cdot C}_{i} : = \{\zeta = c_{i}\} \mathcal{P} : = \{C_{i}, i =$ $1, 2, \cdots\}$ . 若给定 $\mathcal{P} \mathrm{:}$ 时, ξ与 $\eta$ 条件独立, 则称给定 $\zeta$ 时, $\xi \xrightarrow{\vartriangle}{\v{D}} \eta$ 条件独立. 此时, 条件 $C_{i}$ 记为 $\zeta = c_{i}$

回忆给定分割时的条件概率记号:

$$
P(\cdot | \mathcal{P})(\omega) = \sum_{i = 1}^{\infty} P(\cdot | C_{i}) 1_{C_{i}}(\omega).
$$

利用此记号, 给定 $\mathcal{P}$ 时, $\xi \Xi \eta$ 独立可写成

$$
P(\xi \in A, \eta \in B | \mathscr{P}) = P(\xi \in A | \mathscr{P}) P(\eta \in B | \mathscr{P}).
$$

再引进记号:

$$
P(\cdot | \zeta)(\omega) := \sum_{i = 1}^{\infty} P(\cdot | \zeta = c_{i}) 1_{\zeta = c_{i}}(\omega).
$$

## 6.5 条件独立性

则给定ζ时, $\xi.$ 与η条件独立可写成

$$
P(\xi \in A, \eta \in B | \zeta) = P(\xi \in A | \zeta) P(\eta \in B | \zeta).
$$

与无条件时的情形相似, 我们有

命题 6.5.2. 给定 $\mathcal{P}$ 时, $\xi$ 与 $\eta$ 条件独立的充要条件是: 对任意 $f \in b \mathcal{B}^{m + n}$

$$
E[f(\xi, \eta) | \mathcal{P}] = E[E[f(\xi, x) | \mathcal{P}] |_{x = \eta} | \mathcal{P}].
$$

证明也是相似的, 留给读者.

## 习题

1. 设 $\xi_{1}, \xi_{2}, \cdots$ 是独立的离散随机变量序列, $h_{n}$ 为Borel函数, $n = 1, 2, \cdots$ . 递归地定义

$$
S_{1} := \xi_{1}, S_{n + 1} = S_{n} + h_{n}(S_{n}) \xi_{n + 1}, n = 1, 2, \dots.
$$

证明:

(a) $S_{n} \in \sigma(\xi_{1}, \cdot \cdot \cdot, \xi_{n})$ );

(b) 给定 $S_{n}$ 时, $\sigma(\xi_{1}, \xi_{2}, \cdots, \xi_{n})$ 与 $S_{n + 1}$ 条件独立;

(c) 给定 $S_{n}$ 时, $\sigma(\xi_{1}, \xi_{2}, \cdots, \xi_{n})$ 与 $S_{n + 1}, S_{n + 2}, \cdot \cdot \cdot$ 条件独立.

(d) 设 $E[\xi_{i}] = 0, E[\xi_{i}^{2}] = 1$ . 证明:

$$
E \left[S_{n + 1} \mid \sigma \left(\xi_{1}, \xi_{2}, \dots, \xi_{n}\right) \right] = S_{n},
$$

$$
E \left[S_{n + 1}^{2} - \sum_{i = 1}^{n} h_{i}^{2}(S_{i}) \bigg | \sigma(\xi_{1}, \xi_{2}, \dots, \xi_{n}) \right] = S_{n}^{2} - \sum_{i = 1}^{n - 1} h_{i}^{2}(S_{i}).
$$

## 7 大数定律

扔一枚硬币, 我们说正面出现的概率为p, 反面出现的概率为 $\begin{array}{r}{| q : = 1 - p,} \end{array}$ 根据在哪里? 为什么合理? 对这个问题, 物理学家和数学家的思维是不同的.

物理学家的办法是, 做几次试验, 每次扔它成千上万次, 如果每次正反面出现的次数之比都接近于 $p : q,$ 那么就代表这个假设是正确的, 合理的. 然后再给个误差范围, 基本上就可以了. 事实上, 实际操作中也只能是这个办法.

而数学家无法接受这种思维方式, 这简直是岂有此理嘛! 按这种方式, $\mathrm{Goldbach^{1}}$ (哥德巴赫)猜想早就证明了嘛, 孪生素数猜想也早就证明了嘛, Bieberbach<sup>2</sup> 猜想至迟在1972年已经证明了嘛, 还需要等待De Branges<sup>3</sup>几乎搞疯了才在1983年证明?!

所以需要证明, 数学家认为.

第一个给出严格证明的是Jacob Bernoulli. 他的证明实际上是说明了用频率(的极限)来定义概率的合理性, 即当重复试验的次数足够大时, 正反两面出现的次数之比会稳定在p : q附近. 这就是所谓的大数定理, 而这里的“大数”指的就是试验的次数很大. Bernoulli的证明是纯分析的, 相当繁琐与困难, 并且是历史上首次意识到极限的概念([1]). 他的这个工作是概率论历史的名副其实的发令枪和起跑线.

我们现在就介绍大数定律, 但不必沿着Bernoulli的道路. 我们使用的是概率方法. 如果说Bernoulli当年走的是羊肠小道的话, 今天我们可是有高铁可以坐喽!

## 7.1 Markov大数定律

现在持续地抛上面的那枚硬币,当第n次出现正面时记 $\xi_{n}$ 为1,反面时记为0. 则 $\xi_{1}, \cdots, \xi_{n}$ · · · 独立, 且 $\xi_{n} \sim B(p)$ . 进行n次实验后, 正面出现的总次数为 $\mu_{n} = \xi_{1} + \cdot \cdot \cdot + \xi_{n}$ , 正面出现的频率为 $\begin{array}{r}{\frac{\mu_{n}}{n} = \frac{1}{n} \sum_{k = 1}^{n} \xi_{k}} \end{array}$ . 上面的问题就是在问 $\textstyle{\frac{1}{n}} \sum_{k = 1}^{n} \xi_{k}$ 收敛吗? 以什么方式收敛? 如果收敛, 极限是 $_{p}$ 吗?

这种问题其实非常普遍.

再设想一下, 我们有m个球, 每个球上有一个数字 $\cdot l_{k}, k = 1, \cdots, m$ . 现在把球从袋中摸出来, 记录下球上的数字, 再放回袋中, 充分混合后在摸出来, 记录数字. 如此重复下去, 我们便得到一列随机变量ξ , $i = 1, 2, 3, \cdots$ . 这些随机变量是相互独立且同分布的. 考虑它们的部分和的平均值：

$$
\eta_{n} := \frac{1}{n} \sum_{i = 1}^{n} \xi_{i}.
$$

因为每个球每次都被等可能地取到, 所以当n趋于无穷大时, 该和直观上应该趋于其均值, 即

$$
a := \frac{1}{m} \sum_{k = 1}^{m} l_{k}.
$$

那么, 这个猜想对吗?

诸如此类的问题构成了所谓大数定律的研究范畴. 由于随机变量序列收敛的方式有很多, 本节先从依概率收敛的大数定律讲起.

我们先明确什么是大数定律.

定义 7.1.1. 设 $\{\xi_{n}\}$ 是一列随机变量. $\begin{array}{r}{i \vec{\mathbb{C}} S_{n} : = \sum_{k = 1}^{n} \xi_{k}.} \end{array}$ , 若

$$
\frac{S_{n} - E[S_{n}]}{n} \xrightarrow{P} 0,
$$

则说 $\left\{\xi_{n} \right\}$ 服从大数定律.

下面是 $\mathrm{\cdot Markov^{4}}$ 大数定律. 这个定理的证明现在看起来是如此直接和简短, 以致于我们会怀疑它配得上Markov的大名吗? 不是阿猫阿狗都会证吗? 但实际上, 谁知道在他那个时代,在许多概念都是模糊不清, 许多工具都是残缺不全的年代, Markov为得到这个结果受过怎样的折磨?

定理 7.1.2 (Markov大数定律). 若 $\{\xi_{n}, n \geqslant 1\}$ 是一列随机变量序列, $D[\xi_{n}] < \infty, \forall n \geqslant 1$ 且

$$
\lim_{n \to \infty} \frac{D[S_{n}]}{n^{2}} = 0,\tag{1.1}
$$

则 $\{\xi_{n}\}$ 服从大数定律.

证明. 由Chebyshev不等式有, $\forall \varepsilon > 0$

$$
P \left(\left| \frac{S_{n} - E[S_{n}]}{n} \right| \geqslant \varepsilon\right) \leqslant \frac{D[S_{n}]}{n^{2} \varepsilon^{2}} \rightarrow 0.
$$

□

那么, 什么时候(1.1)满足呢?

首先, 设 $\{\xi_{n}\}$ 两两不相关(特别地, 若它们相互独立), 且有 $\alpha < 1$ 使

$$
\limsup_{n \to \infty} D[\xi_{n}] n^{- \alpha} < \infty.
$$

则有常数C使得

$$
D[S_{n}] = \sum_{k = 1}^{n} D[\xi_{k}] \leqslant n^{1 + \alpha} C.
$$

因此(1.1)满足. 特别地, 当 $\alpha = 0$ 时, 定理7.1.2称为 Chebyshev大数定律.

推论 7.1.3 (Chebyshev大数定律). 设 $\{\xi_{n}, n \geqslant 1\}$ 是一列两两不相关的随机变量序列, 且 $D[\xi_{n}] \leqslant$ $C, \forall n \geqslant 1$ , 则 $\{\xi_{n}, n \geqslant 1\}$ 服从大数定律.

在Chebyshev大数定律中, 取 $\xi_{k} \sim B(p_{k})$ , {ξ<sub>k</sub>}相互独立, 则

$$
D[\xi_{k}] = p_{k}(1 - p_{k}) \leqslant \frac{1}{4},
$$

所以条件(1.1)满足. 特别地,当 $| p_{k} = p |$ 时, 就退化为Bernoulli原来的结果, 因此称为Bernoulli大 数定律.

推论 7.1.4 (Bernoulli大数定律). 设 ${\boldsymbol{\mu}}_{n}$ 是事件A在n次独立试验中出现的次数, p是A在每次试验中发生的概率, 则

$$
\frac{\mu_{n}}{n} \xrightarrow{P} p.
$$

证明. 只需定义

$$
\xi_{k} := \left\{\begin{array}{ll} 1, & \text{第} k \text{次实验中} A \text{出现}, \\ 0, & \text{否则}, \end{array} \right.
$$

则 $\begin{array}{r}{\mu_{n} = \sum_{k = 1}^{n} \xi_{k}, \xi_{k} \sim B(p)} \end{array}$ 且相互独立. 因此条件(1.1)满足, 由Chebyshev大数定律结论成立. □

不过, 如果我们面对的是独立随机变量序列, 则上面有关方差的条件可以放宽.

定理 7.1.5. 设 $\left\{\xi_{n} \right\}$ 是独立随机变量序列, $E[\xi_{n}] = 0, \forall n \geqslant 1$ , 且下列条件之一满足:

(i) $1 \leqslant p < 2,$

$$
\frac{1}{n^{p}} \sum_{i = 1}^{n} \| \xi_{i} \|_{p}^{p} \to 0;
$$

(ii) $p \geqslant$ 2且

$$
\frac{1}{n^{2}} \sum_{i = 1}^{n} \| \xi_{i} \|_{p}^{2} \to 0.
$$

则大数定律成立.

证明. 注意

$$
P \left(\frac{| S_{n} |}{n} \geqslant \varepsilon\right) \leqslant \frac{E[| S_{n} |^{p}]}{n^{p} \varepsilon^{p}}.
$$

再利用定理6.3.4即可.

最后, 我们来看看Bernoulli大数定律的一个有趣的应用, 即Weierstrass<sup>5</sup>定理的概率证明.定理 7.1.6 (Weierstrass定理). 设 $f = f(x)$ 为[0, 1]上的连续函数, 则Bernstein<sup>6</sup>多项式函数

$$
B_{n}(x) = \sum_{k = 0}^{n} f \left(\frac{k}{n}\right) C_{n}^{k} x^{k}(1 - x)^{n - k}
$$

在[0, 1]上一致收敛于f.

证明. 固定 $x \in[0, 1]$ , 设一列独立同分布随机变量序列 $\xi_{n}, n = 1, 2, \cdots$ · , 其中 $P(\xi_{1} = 1) = x$ $P(\xi_{1} = 0) = 1 - x$ . 记 $\textstyle S_{n} = \sum_{k = 1}^{n} \xi_{k}$ , 则 $S_{n} \sim B(n, x)$ . 因此

$$
E \left[f \left(\frac{S_{n}}{n}\right) \right] = B_{n}(x).
$$

由Bernoulli大数定律, $\frac{S_{n}}{n} \ \overset{P}{} x$ . 因f连续, 因此 $\textstyle f \left({\frac{S_{n}}{n}} \right){\overset{P}{\longrightarrow}} f(x)$ . 又因为f有界, 由有界收敛定理知, $B_{n}(x) \to f(x), n \to \infty, \forall x \in[0, 1]$

下面证明该收敛也是一致的. 一方面, 因f有界, 存在常数M, 使 $| f(x) | \leqslant M$ . 另一方面,因 $f \not \in[0, 1]$ 上一致连续, 因此对任意的 $\varepsilon > 0$ , 存 $\ddagger{\delta} > 0$ 当 $| x - y | < \delta \mathbb{H}\}, | f(x) - f(y) | \leqslant \varepsilon$

由Chebshev不等式, 有

$$
P \left(\left| \frac{S_{n}}{n} - x \right| > \delta\right) \leqslant \frac{1}{\delta^{2} n^{2}} E \left[(S_{n} - nx)^{2} \right] = \frac{nx(1 - x)}{\delta^{2} n^{2}} \leqslant \frac{1}{4n \delta^{2}}, \forall x.
$$

于是对任意的 $\varepsilon > 0, \forall x.$ , 有

$$
\begin{array}{rcl} | B_{n}(x) - f(x) | & \leqslant & E \left[\left| f \left(\frac{S_{n}}{n}\right) - f(x) \right| \right] \\ & = & E \left[\left| f \left(\frac{S_{n}}{n}\right) - f(x) \right| 1_{\{| \frac{S_{n}}{n} - x | > \delta\}} \right] \\ & & + E \left[\left| f \left(\frac{S_{n}}{n}\right) - f(x) \right| 1_{\{| \frac{S_{n}}{n} - x | \leqslant \delta\}} \right] \\ & \leqslant & 2MP \left(\left| \frac{S_{n}}{n} - x \right| > \delta\right) + \varepsilon \\ & \leqslant & \frac{M}{2n \delta^{2}} + \varepsilon.\end{array}
$$

因此

$$
\lim_{n \to \infty} \sup_{x \in[0, 1]} | B_{n}(x) - f(x) | \leqslant \varepsilon.
$$

由ε的任意性结论得证.

习题

1. 设 $\{\xi_{n}\}$ 是随机变量序列. 令 $X_{n} =(\xi_{1}, \cdot \cdot \cdot, \xi_{n})$ . 设有常数C及 $\alpha < 1$ 使得

$$
\operatorname{Cov} \left(X_{n}, X_{n}\right) \leqslant n^{1 + \alpha} CI_{n}, \forall n.
$$

证明 $\{\xi_{n}\}$ 服从大数定律.

## 7.2 强大数定律

如果把大数定律的结论

$$
\frac{S_{n} - E[S_{n}]}{n} \xrightarrow{P} 0
$$

加强为

$$
\frac{S_{n} - E[S_{n}]}{\varphi(n)} \xrightarrow{a.s.} 0,
$$

其中 $\varphi(n) ={\cal O}(n)$ 或最好是 $o(n)$ , 则称为强大数定律.

本节恒设 $\xi_{1}, \xi_{2}, \cdot \cdot$ ·独立同分布, 且 $E[\xi_{1}] = 0$ . 记 $\textstyle S_{n} : = \sum_{k = 1}^{n} \xi_{k}$ . 为得到强大数定律, 我们先准备两个分析引理. 第一个是:

引理 7.2.1 (Toeplitz引理). 设 $\left\{a_{n} \right\}$ 是非负数列, $\textstyle a_{1} > 0, \b_{n} : = \sum_{i = 1}^{n} a_{i} \ \uparrow \infty, \ \{x_{n}\}$ 是数列且 $.x_{n} \to x$ . 则

$$
\frac{1}{b_{n}} \sum_{i = 1}^{n} a_{i} x_{i} \rightarrow x.
$$

证明. $\forall \varepsilon > 0.$ , 取N使得

$$
\left| x_{n} - x \right| < \frac{\varepsilon}{2}, \forall n \geqslant N.
$$

再取 $M \geqslant N$ 使得

$$
\frac{1}{b_{M}} \sum_{i = 1}^{N} a_{i} | x_{i} - x | < \frac{\varepsilon}{2}.
$$

则当 $n \geqslant M$ 时

$$
\begin{array}{lll} \left| \frac{1}{b_{n}} \sum_{i = 1}^{n} a_{i} x_{i} - x \right| & \leqslant & \frac{1}{b_{n}} \sum_{i = 1}^{n} a_{i} | x_{i} - x | \\ & \leqslant & \frac{1}{b_{n}} \sum_{i = 1}^{N} a_{i} | x_{i} - x | + \frac{1}{b_{n}} \sum_{i = N + 1}^{n} a_{i} | x_{i} - x | \\ & \leqslant & \frac{1}{b_{M}} \sum_{i = 1}^{N} a_{i} | x_{i} - x | + \frac{1}{b_{n}} \sum_{i = N + 1}^{n} a_{i} | x_{i} - x | \\ & < & \frac{\varepsilon}{2} + \frac{b_{n} - b_{N}}{b_{n}} \frac{\varepsilon}{2} \\ & < & \varepsilon.\end{array}
$$

第二个是:

引理 7.2.2 (Kronecker引理). 设 $\{x_{n}\}$ 是数列, $b_{n} > 0$ 且 $.b_{n}$ ↑ $\infty$ . 若

$$
\sum_{n = 1}^{\infty} \frac{x_{n}}{b_{n}}
$$

收敛, 则

$$
\lim_{n \to \infty} \frac{1}{b_{n}} \sum_{i = 1}^{n} x_{i} = 0.
$$

证明. 令 $\cdot b_{0} = c_{0} : = 0$

$$
c_{n} := \sum_{i = 1}^{n} \frac{x_{i}}{b_{i}}.
$$

则 $x_{n} = b_{n}(c_{n} - c_{n - 1})$ . 于是由Abel分部求和公式有

$$
\begin{array}{rcl} \frac{1}{b_{n}} \sum_{i = 1}^{n} x_{i} & = & \frac{1}{b_{n}} \sum_{i = 1}^{n} b_{i}(c_{i} - c_{i - 1}) \\ & = & c_{n} - \frac{1}{b_{n}} \sum_{i = 1}^{n - 1} c_{i}(b_{i + 1} - b_{i}).\end{array}
$$

## 7.2 强大数定律

于是由Toeplitz引理有

$$
\lim_{n \to \infty} \frac{1}{b_{n}} \sum_{i = 1}^{n} x_{i} = 0.
$$

我们还需要下面的不等式:

引理 7.2.3. 设 $\xi_{1}, \xi_{2}, \eta$ 为随机变量, $E[\eta] = 0$ , 且 $\xi_{1}, \xi_{2}$ 与η独立, $p \geqslant 1$ . 则

$$
E[| \xi_{1} + \eta \xi_{2} |^{p}] \geqslant E[| \xi_{1} |^{p}].
$$

证明. 由独立性, 定理6.1.3及Jensen不等式有

$$
\begin{array}{rcl} E[| \xi_{1} + \eta \xi_{2} |^{p}] & = & E \left[E[| x + y \eta |^{p}] |_{x = \xi_{1}, y = \xi_{2}} \right] \\ & \geqslant & E \left[| E[x + y \eta] |^{p} |_{x = \xi_{1}, y = \xi_{2}} \right] \\ & = & E[| \xi_{1} |^{p}].\end{array}
$$

下面这个不等式取自[8](在p = 2时是由Hajek-Renyi证明的).

引理 7.2.4 (广义 $\mathrm{Hajek^{7} - Renyi^{8}}$ 不等式). 设 $\left\{a_{n} \right\}$ 是递增正数列, $m < n, \varepsilon > 0$ . 令

$$
A := \left\{\max_{m \leqslant i \leqslant n} a_{i}^{- 1} | S_{i} | \geqslant \varepsilon \right\}.
$$

(i) 若1 ⩽ $p \leqslant 2$ , 则

$$
\varepsilon^{p} P(A) \leqslant 2^{2 - p} a_{m}^{- p} \sum_{k = 1}^{m} E[| \xi_{k} |^{p}] + 2^{2 - p} \sum_{k = m + 1}^{n} a_{k}^{- p} E[| \xi_{k} |^{p}].
$$

(ii) 若 $p > 2_{\cdot}$ , 且有常数 $0 < \alpha < 1, C > 0$ 使得

$$
k^{\frac{1}{2} - \frac{1}{p}} \leqslant Ca_{k}^{\alpha}, \forall k.
$$

则

$$
\varepsilon^{p} P(A) \leqslant C_{1} a_{m}^{\alpha p - p} \sum_{k = 1}^{m} E[| \xi_{k} |^{p}] + C_{1} \sum_{k = m + 1}^{n - 1} a_{k}^{\alpha p - p} E[| \xi_{k} |^{p}] + C_{1} a_{n}^{\alpha p - p} \sum_{k = 1}^{n} E[| \xi_{k} |^{p}],
$$

其中 $C_{1} = C^{p}(1 - \alpha)^{- 1}$

证明. 令

$$
\tau := \inf \left\{i \geqslant m: a_{i}^{- 1} | S_{i} | \geqslant \varepsilon \right\}.
$$

则对i $\geqslant k \geqslant m$ , 在引理7.2.3中取 $\xi_{1} = S_{k} 1_{\tau = k}, \xi_{2} = 1_{\tau = k}, \eta = S_{i} - S_{k}$ , 有

$$
E[| S_{i} |^{p} 1_{\tau = k}] \geqslant E[| S_{k} |^{p} 1_{\tau = k}].
$$

因此, 对k $\geqslant m$ 有

$$
\begin{array}{rcl} \varepsilon^{p} P(\tau = k) & \leqslant & a_{k}^{- p} E[| S_{k} |^{p} 1_{\tau = k}] \\ & = & \left(\sum_{i = k}^{n - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) + a_{n}^{- p}\right) E[| S_{k} |^{p} 1_{\tau = k}] \\ & = & \left(\sum_{i = k}^{n - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) E[| S_{k} |^{p} 1_{\tau = k}] + a_{n}^{- p} E[| S_{k} |^{p} 1_{\tau = k}]\right) \\ & \leqslant & \sum_{i = k}^{n - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) E[| S_{i} |^{p} 1_{\tau = k}] + a_{n}^{- p} E[| S_{n} |^{p} 1_{\tau = k}].\end{array}
$$

于是

$$
\begin{array}{rcl} \varepsilon^{p} P \left(\max_{m \leqslant i \leqslant n} a_{i}^{- 1} | S_{i} | \geqslant \varepsilon\right) & = & \varepsilon^{p} \sum_{k = m}^{n} P(\tau = k) \\ & \leqslant & \sum_{i = m}^{n - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) E[| S_{i} |^{p}] + a_{n}^{- p} E[| S_{n} |^{p}] \\ & = & a_{m}^{- p} E[| S_{m} |^{p}] + \sum_{k = m + 1}^{n} a_{k}^{- p} \left(E[| S_{k} |^{p}] - E[| S_{k - 1} |^{p}]\right) \\ & =: & E[\eta].\end{array}
$$

下面估计 $\cdot E[\eta]$

(i) 当 $1 \leqslant p \leqslant$ 2时, 由定理6.3.4中的Chatterji不等式有

$$
E[| S_{k} |^{p}] \leqslant 2^{2 - p} \sum_{i = 1}^{k} E[| \xi_{i} |^{p}],
$$

以及由引理6.3.6又有

$$
E[| S_{k} |^{p}] - E[| S_{k - 1} |^{p}] \leqslant 2^{2 - p} E[| \xi_{k} |^{p}],
$$

因此

$$
\begin{array}{rcl} E[\eta] & = & a_{m}^{- p} E[| S_{m} |^{p}] + \sum_{k = m + 1}^{n} a_{k}^{- p} \Big(E[| S_{k} |^{p}] - E[| S_{k - 1} |^{p}] \Big) \\ & \leqslant & 2^{2 - p} a_{m}^{- p} \sum_{k = 1}^{m} E[| \xi_{k} |^{p}] + 2^{2 - p} \sum_{k = m + 1}^{n} a_{k}^{- p} E[| \xi_{k} |^{p}], \end{array}
$$

完成证明.

(ii) 设 $p > 2$ . 此时, 由定理6.3.4中的Rio不等式

$$
\| S_{i} \|_{p}^{2} \leqslant(p - 1) \sum_{k = 1}^{i} \| \xi_{k} \|_{p}^{2},
$$

和H¨older不等式有

$$
\begin{array}{rcl} E[| S_{i} |^{p}] & = & \big(\| S_{i} \|_{p}^{2} \big)^{p / 2} \\ & \leqslant & \left((p - 1) \sum_{k = 1}^{i} \| \xi_{k} \|_{p}^{2}\right)^{p / 2} \\ & \leqslant &(p - 1)^{p / 2} i^{\frac{p}{2} - 1} \sum_{k = 1}^{i} E[| \xi_{k} |^{p}].\end{array}
$$

所以

$$
\begin{array}{rcl}(p - 1)^{- p / 2} E[\eta] & \leqslant & \sum_{i = m}^{n - 1} \left(i^{\frac{p}{2} - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) \sum_{k = 1}^{i} E[\xi_{k} |^{p}]\right) + a_{n}^{- p} n^{\frac{p}{2} - 1} \sum_{k = 1}^{n} E[| \xi_{k} |^{p}] \\ & = & \sum_{k = 1}^{n - 1} \left(E[| \xi_{k} |^{p}] \sum_{i = m \vee k}^{n - 1} i^{\frac{p}{2} - 1}(a_{i}^{- p} - a_{i + 1}^{- p})\right) + a_{n}^{- p} n^{\frac{p}{2} - 1} \sum_{k = 1}^{n} E[| \xi_{k} |^{p}].\end{array}
$$

又

$$
\begin{array}{rcl} \sum_{i = m \vee k}^{n - 1} i^{\frac{p}{2} - 1}(a_{i}^{- p} - a_{i + 1}^{- p}) & = & \sum_{i = m \vee k}^{n - 1} i^{\frac{p}{2} - 1} \int_{a_{i}}^{a_{i + 1}} \frac{p}{x^{p + 1}} dx \\ & \leqslant & C^{p} \sum_{i = m \vee k}^{n - 1} \int_{a_{i}}^{a_{i + 1}} \frac{p}{x^{p - \alpha p + 1}} dx \\ & \leqslant & C^{p}(1 - \alpha)^{- 1} a_{m \vee k}^{\alpha p - p}, \end{array}
$$

所以

$$
E[\eta] \leqslant C_{1} a_{m}^{\alpha p - p} \sum_{k = 1}^{m} E[| \xi_{k} |^{p}] + C_{1} \sum_{k = m + 1}^{n - 1} a_{k}^{\alpha p - p} E[| \xi_{k} |^{p}] + C_{1} a_{n}^{\alpha p - p} \sum_{k = 1}^{n} E[| \xi_{k} |^{p}],
$$

其中 $C_{1} = C^{p}(1 - \alpha)^{- 1}$ . 至此证明全部完成.

□

下面是本节的主要结果:

定理 7.2.5 (强大数定律). 保持 $\vert - \frac{7}{9} \vert$ 理的记号及条件, 并设存在 $_{\cdot p \geqslant 1}$ 满足

(i) $1 \leqslant p \leqslant$ 2时

$$
\sum_{n = 1}^{\infty} a_{n}^{- p} E[| \xi_{n} |^{p}] < \infty;
$$

(ii) $p > 2$ 时

$$
\sum_{n = 1}^{\infty} a_{n}^{\alpha p - p} E[| \xi_{n} |^{p}] < \infty.
$$

则

$$
\lim_{n \to \infty} \frac{S_{n}}{a_{n}} = 0a.s..
$$

注. $p = 2, a_{n} = n$ 时称为Kolmogorov强大数定律.

证明. (i) 当 $1 \leqslant p \leqslant$ 2时,

$$
\varepsilon^{p} P \left(\max_{m \leqslant i \leqslant n} a_{i}^{- 1} | S_{i} | \geqslant \varepsilon\right) \leqslant 2^{2 - p} a_{m}^{- p} \sum_{i = 1}^{m} E[| \xi_{i} |^{p}] + 2^{2 - p} \sum_{i = m + 1}^{n} a_{i}^{- p} E[| \xi_{i} |^{p}].
$$

令 $n \to \infty$ 得

$$
\varepsilon^{p} P \left(\max_{i \geqslant m} a_{i}^{- 1} | S_{i} | \geqslant \varepsilon\right) \leqslant 2^{2 - p} a_{m}^{- p} \sum_{i = 1}^{m} E[| \xi_{i} |^{p}] + 2^{2 - p} \sum_{i = m + 1}^{\infty} a_{i}^{- p} E[| \xi_{i} |^{p}].
$$

再令 $\cdot m \infty,$ , 并用Kronecker引理即得

$$
\lim_{m \to \infty} P \left(\max_{i \geqslant m} a_{i}^{- 1} | S_{i} | \geqslant \varepsilon\right) = 0.
$$

(ii) $p >$ 2时, 用对应的不等式, 证明类似, 请自行完成.

推论 7.2.6 (Borel强大数定律). 设 ${\bf \nabla} \cdot{\bf \nabla} \mu_{n}$ 是事件A在n次独立试验中出现的次数, p是A在每次试验中发生的概率, 则

$$
\frac{\mu_{n}}{n} \xrightarrow{a.s.} p.
$$

证明. 回顾 $\textstyle \mu_{n} = \sum_{k = 1}^{n} \xi_{k}$ , 其中 $\xi_{k} \sim B(p)$ 且相互独立. 因为 $D[\xi_{k}] = p(1 - p)$ , 因此

$$
\sum_{n = 1}^{\infty} \frac{1}{n^{2}} E[| \xi_{n} - p |^{2}] = p(1 - p) \sum_{n = 1}^{\infty} \frac{1}{n^{2}} < \infty.
$$

由上一定理的(i), 结论成 $\vec{\underline{{\ : \gamma}}}$ .

下面我们来看强大数定律的一个应用. 设 $\xi_{1}, \xi_{2}, \cdots$ 是概率空间 $(\Omega,{\mathcal{F}}, P)$ 上的一列独立同分布的随机变量, $F(x)$ 为它们共同的分布函数. 对每个 $\cdot_{n \geqslant 1}$ , 定义它们的经验分布函数为

$$
F_{n}(x) := \frac{1}{n} \sum_{k = 1}^{n} 1_{\{\xi_{k} \leqslant x\}}, x \in \mathbb{R}.
$$

则 $F_{n}(x)$ 单调递增,右连续. 它表示随机变量 $\xi_{1}, \xi_{2}, \cdots, \xi_{n}$ 中小于等于x的个数的频率,且 $E[F_{n}(x)] =$ $F(x)$ . 由 Bernoulli 大数定律知, $\forall x \in \mathbb{R}$

$$
F_{n}(x) \stackrel{P}{\longrightarrow} F(x), n \to \infty.
$$

由Borel强大数定律知, $\forall x \in \mathbb{R}$

$$
F_{n}(x) \xrightarrow{a.s.} F(x), n \to \infty.
$$

事实上, 我们能证明上面的几乎必然收敛也是关于 $x \in$ R一致收敛的. 这为用经验分布函数来近似分布函数 $F(x)$ 提供了理论依据.

定理 7.2.7 (Gl $\mathrm{\Delta \venko^{9} - Cantelli^{10}}$ 定理). 符号和条件同上, 则

$$
\sup_{x \in \mathbb{R}} | F_{n}(x) - F(x) | \stackrel{{a.s.}}{{\longrightarrow}} 0, n \to \infty.
$$

证明. 任给 $m \geqslant 2.$ 定义 $x_{m, 0} = - \infty$

$$
x_{m, k} = \inf \left\{x \in \mathbb{R}; F(x) \geqslant \frac{k}{m} \right\}, k = 1, 2, \dots, m - 1
$$

和 $\boldsymbol{1} \boldsymbol{x}_{m, m} = + \infty$ . 则对 $\cdot k = 0, 1, \cdots, m - 1$ ，

$$
\begin{array}{rcl} F(x_{m, k + 1} -) - F(x_{m, k}) & = & \lim_{\delta \downarrow 0}[F(x_{m, k + 1} - \delta) - F(x_{m, k} + \delta)] \\ & \leqslant & \frac{k + 1}{m} - \frac{k}{m} \\ & \leqslant & \frac{1}{m}.\end{array}
$$

因此, 对任意的 $\qquad | x \in \mathbb{R},$ , 存在 $0 \leqslant k \leqslant m - 1$ , 使 $x \in[x_{m, k}, x_{m, k + 1})$ , 且由 $F_{n}(x)$ 和 $F(x)$ 关于x的单调性有

$$
\begin{array}{rcl} F_{n}(x) - F(x) & \leqslant & F_{n}(x_{m, k + 1} -) - F(x_{m, k}) \\ & = &[F_{n}(x_{m, k + 1} -) - F(x_{m, k + 1} -)] +[F(x_{m, k + 1} -) - F(x_{m, k})] \\ & \leqslant &[F_{n}(x_{m, k + 1} -) - F(x_{m, k + 1} -)] + \frac{1}{m}.\end{array}
$$

同理

$$
\begin{array}{rcl} F_{n}(x) - F(x) & \geqslant & F_{n}(x_{m, k}) - F(x_{m, k + 1} -) \\ & = &[F_{n}(x_{m, k}) - F(x_{m, k})] -[F(x_{m, k + 1} -) - F(x_{m, k})] \\ & \geqslant &[F_{n}(x_{m, k}) - F(x_{m, k})] - \frac{1}{m}.\end{array}
$$

结合上面两个不等式有

$$
\begin{array}{l} \sup_{x \in \mathbb{R}} | F_{n}(x) - F(x) | \\ \leqslant \max_{0 \leqslant k \leqslant m - 1} \{| F_{n}(x_{m, k + 1} -) - F(x_{m, k + 1} -) |, | F_{n}(x_{m, k}) - F(x_{m, k}) |\} + \frac{1}{m}.\end{array}
$$

由Borel强大数定律知, $\forall k = 0, 1, \cdots, m - 1$

$$
F_{n}(x_{m, k}) \stackrel{a.s.}{\longrightarrow} F(x_{m, k}), n \to \infty.
$$

同理, 因为

$$
F_{n}(x -) := \frac{1}{n} \sum_{k = 1}^{n} 1_{\{\xi_{k} < x\}}, x \in \mathbb{R}
$$

和 $E[F_{n}(x -)] = F(x -)$ , 由Borel强大数定律也知, $\forall x \in$ R,

$$
F_{n}(x -) \xrightarrow{a.s.} F(x -), n \to \infty.
$$

因此, $\forall k = 1, 2, \cdots, m$

$$
F_{n}(x_{m, k} -) \xrightarrow{a.s.} F(x_{m, k} -), n \to \infty.
$$

综上, $\forall m \geqslant 2.$ , 有

$$
\zeta := \lim_{n \to \infty} \sup_{x \in \mathbb{R}} | F_{n}(x) - F(x) | \leqslant \frac{1}{m}, a.s..
$$

最后, 因为 $F_{n}(x)$ 和 $F(x)$ 右连续, 故

$$
\lim_{n \to \infty} \sup_{x \in \mathbb{R}} | F_{n}(x) - F(x) | = \lim_{n \to \infty} \sup_{x \in \mathbb{Q}} | F_{n}(x) - F(x) |,
$$

所以 $\zeta.$ 为随机变量. 再由概率的连续性有

$$
P(\zeta \neq 0) = P \left(\bigcup_{m} \left\{\zeta \geqslant \frac{1}{m} \right\}\right) = \lim_{m \rightarrow \infty} P \left(\zeta \geqslant \frac{1}{m}\right) = 0,
$$

定理得证.

□

## 习题

1. 设1 $\leqslant p \leqslant 2.$ . 设 $\dot{.} \varphi$ 为R 上的正函数, 且存在 $N > 0$ 使得

$$
\varphi^{\prime}(x) \geqslant 1, x \in[N, \infty),
$$

$$
\int_{N}^{\infty} \frac{dx}{\varphi(x)} < \infty.
$$

$$
a_{n} := \varphi \left(\sum_{k = 1}^{n} E[| \xi_{k} |^{p}]\right)^{1 / p}.
$$

证明: 若 $a_{n} \to \infty$ , 则

$$
\lim_{n \to \infty} \frac{S_{n}}{a_{n}} = 0a.s..
$$

2. 设 $p \geqslant 2.$ , 且

$$
\sum_{n = 1}^{\infty} \frac{E[| \xi_{n} |^{p}]}{n^{\frac{p}{2} + 1}} < \infty.
$$

证明

$$
\lim_{n \to \infty} \frac{S_{n}}{n} = 0a.s..
$$
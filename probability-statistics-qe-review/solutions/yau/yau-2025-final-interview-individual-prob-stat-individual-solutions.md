# 2025 丘赛总决赛面试 individual 参考解

> [!info] 题源与答案性质
> - 对应题面：[原题 Markdown](../../notes/yau/yau-2025-final-interview-individual-prob-stat-individual.md)；原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-individual-prob-stat-individual.pdf)。
> - 官方归档：[下载页](https://yau-contest.com/lists-jxxg.html)。
> - 本文为自撰教学性参考解；未发现随原卷归档的官方评分答案。
> - Obsidian 数学定界符：行内使用 `$...$`，行间使用 `$$...$$`。

## 题 1：最小报价与信息价值

^yau-2025-final-interview-individual-prob-stat-individual-s1

### 动机和符号

先问两家后，当前价格为 $Y=\min(X_1,X_2)$。第三家只有在其期望降价大于询价成本 $3$ 时才值得问。令 $U=Y-100$。独立均匀性给出

$$
\mathbb P(U>u)=\left(1-\frac{u}{50}\right)^2,
\qquad 0\leq u\leq50,
$$

所以

$$
f_U(u)=\frac{2(50-u)}{2500}.
$$

### 推导

给定 $Y=y$，第三家带来的毛节省为 $(y-X_3)_+$，故

$$
\mathbb E[(y-X_3)_+\mid Y=y]
=\frac1{50}\int_{100}^y(y-x)\,dx
=\frac{(y-100)^2}{100}.
$$

又

$$
\mathbb E U^2
=\int_0^{50}u^2\frac{2(50-u)}{2500}\,du
=\frac{1250}{3}.
$$

故无条件毛节省为 $25/6$，净节省为

$$
\frac{25}{6}-3=\frac76>0.
$$

逐步决策应比较条件净收益：

$$
\frac{(Y-100)^2}{100}\geq3.
$$

因此

$$
Y\geq c,\qquad c=100+10\sqrt3.
$$

令 $r=(c-100)/50=\sqrt3/5$。按此规则，询问却没有价格节省的概率为

$$
\mathbb P(Y\geq c,X_3\geq Y)
=2\int_r^1(1-z)^2\,dz
=\frac23(1-r)^3.
$$

条件在已经询问第三家下，该概率为 $2(1-r)/3$。若总是问第三家，则“不降价”的概率是 $2/3$。

### 结论、考点与易错点

考点是条件期望和信息价值。易错点是把无条件净收益为正误读为每个当前报价都值得询问；$Y$ 很低时应停止。参见 Ross, *Introduction to Probability Models*, Ch. 4。

## 题 2：覆盖度与 contig

^yau-2025-final-interview-individual-prob-stat-individual-s2

### 动机和符号

把长度为 $G$ 的序列视为圆周，忽略边界。片段左端均匀独立，覆盖度为

$$
a=\frac{NL}{G}.
$$

在 $G\gg L$ 的极限中，任一点左侧长度 $L$ 窗口内的片段数近似为 Poisson$(a)$。

### 推导

固定位置不被任何片段覆盖的概率为

$$
\left(1-\frac{L}{G}\right)^N\approx e^{-a}.
$$

所以平均覆盖比例是 $1-e^{-a}$。令其等于 $0.99$，

$$
a=-\log(0.01)=\log100\approx4.605.
$$

一个片段成为 contig 最左端的条件是此前长度 $L$ 内没有片段起点；该概率为 $e^{-a}$。于是

$$
\mathbb E(\text{contig 数})\approx Ne^{-a}.
$$

平均被覆盖总长度为 $G(1-e^{-a})$，故平均 contig 长度为

$$
\frac{G(1-e^{-a})}{Ne^{-a}}
=\frac{L(e^a-1)}{a}.
$$

### 结论、考点与易错点

考点是稀疏二项到 Poisson 的近似及 Palm 计数。易错点是把 contig 数写成已覆盖片段数；一个 contig 可由多个重叠片段组成。参见 Durbin et al., *Biological Sequence Analysis*, Sec. 5.2。

## 题 3：动态环境中的一维回归

^yau-2025-final-interview-individual-prob-stat-individual-s3

### 动机和扩张状态

位置过程 $X_n$ 单独并非齐次 Markov 链，因为下一步还取决于哪些边已被走过。把状态写为位置与已访问边区间 $[L_n,R_n]$ 后，过程才是 Markov 的。

### 所需引理和适用性

一维一次增强随机游走引理说：在 $\mathbb Z$ 上，初始边权为常数，且每条边第一次通过后变为任意固定正权 $a$，则游走几乎必然无穷次访问每个已访问顶点。

本题满足该引理。为说明其机制，已访问边始终是连通区间；区间内部两方向权重同为 $a$，故内部运动对称。只有端点处会在“走回旧区间”和“扩张一条新边”之间选择。对任意有限区间，赌徒破产计算给出从端点回到 $0$ 的严格正概率；按区间依次扩张并用强 Markov 性，永远不回到 $0$ 的概率为零。每次从 $0$ 离开后重复此论证，得到无穷次回返。

因此

$$
\mathbb P(X_n=0\text{ infinitely often})=1.
$$

### 结论、考点与易错点

考点是动态环境的状态扩张、强 Markov 性和一维回返。易错点是把 $X_n$ 当作普通简单随机游走，或把权重更新误认为产生固定方向漂移。完整引理见 Davis, “Reinforced random walk,” 1990, Proposition 1。

## 题 4：三角观测的回归估计

^yau-2025-final-interview-individual-prob-stat-individual-s4

### 动机和符号

估计 $\beta_j$ 时，只有行 $i=j,\ldots,n$ 观测到 $x_{ij}$。把其余协变量合并为误差：

$$
y_i=\beta_jx_{ij}+\eta_{ij},
\qquad
\eta_{ij}=\sum_{k\ne j}\beta_kx_{ik}+\epsilon_i.
$$

独立高斯性保证 $x_{ij}$ 与 $\eta_{ij}$ 独立，且

$$
\eta_{ij}\sim N(0,\sigma_j^2),
\qquad
\sigma_j^2=1+\sum_{k\ne j}\beta_k^2.
$$

### 推导

在可用样本上最小化无截距平方损失

$$
Q_j(b)=\sum_{i=j}^n(y_i-bx_{ij})^2.
$$

一阶条件为

$$
0=Q_j'(b)=-2\sum_{i=j}^nx_{ij}(y_i-bx_{ij}),
$$

从而

$$
\widehat\beta_j
=\frac{\sum_{i=j}^nx_{ij}y_i}{\sum_{i=j}^nx_{ij}^2}.
$$

条件在设计变量上，

$$
\mathbb E(\widehat\beta_j\mid x)=\beta_j,
\qquad
\operatorname{var}(\widehat\beta_j\mid x)
=\frac{\sigma_j^2}{\sum_{i=j}^nx_{ij}^2}.
$$

因此它无偏。在该一元高斯子模型中，Gauss--Markov 定理适用，因为误差独立、零均值且同方差；所以该估计量在线性无偏类中具有最小条件方差，也是子模型的极大似然估计。

### 是否整体最优

它并非原高维问题的全局最优策略：$\beta_j$ 只有 $n-j+1$ 个有效样本，$\beta_n$ 甚至只有一个样本，方差会很大。可改用带结构的联合正则化，例如 ridge：

$$
\min_\beta\sum_{i=1}^n
\left(y_i-\sum_{j=1}^i\beta_jx_{ij}\right)^2
+\lambda\|\beta\|_2^2.
$$

若 $\beta$ 稀疏，可用 lasso。两者以小偏差换取低方差，尤其适合 $n$ 大时。

### 结论、考点与易错点

考点是缺失设计下的可识别子样本、条件无偏性和偏差方差权衡。易错点是声称逐坐标 OLS 对全部参数联合最优；它只在相应的一元子模型中最优。参见 Wasserman, *All of Statistics*, Ch. 13；Hastie et al., *The Elements of Statistical Learning*, Ch. 3。

## 参考文献

1. [2025 总决赛个人概率统计题面](../../sources/yau-contest/final-interview/yau-2025-final-interview-individual-prob-stat-individual.pdf)。
2. S. M. Ross, *Introduction to Probability Models*, 12th ed., Academic Press, 2019。
3. R. Durbin et al., *Biological Sequence Analysis*, Cambridge University Press, 1998。
4. B. Davis, “Reinforced random walk,” *Probability Theory and Related Fields*, 84 (1990), 203--229。
5. L. Wasserman, *All of Statistics*, Springer, 2004。
6. T. Hastie, R. Tibshirani, and J. Friedman, *The Elements of Statistical Learning*, 2nd ed., Springer, 2009。

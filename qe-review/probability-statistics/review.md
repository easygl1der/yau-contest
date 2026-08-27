# 概统博资考复习清单

缺口复习的 LaTeX 版（全英文：概念、联系、考法、来龙去脉；含线性模型推断公式、估计剩余块、Poisson 三推导）在子目录里，从该目录编译：

- 源：[review/review.tex](review/review.tex)
- PDF：[review/review.pdf](review/review.pdf)
- 编译：`cd review && xelatex -synctex=1 -interaction=nonstopmode review.tex`

对照对象：

- 大纲：[syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md](syllabus/qzc-qe-probability-statistics-syllabus-2026-06.md)
- 已掌握（默认全部勾掉）：2025 春、2025 秋、2026 春
- 尚未过手：2023 秋、2024 春、2024 秋，以及大纲上近三年零曝光的知识点

卷面源文件在 [`transcribed_exams/`](transcribed_exams/)。勾选约定：`[x]` = 已掌握或已补做；`[ ]` = 还没过。

---

## 已掌握的三套卷

### 2025 春

源：[transcribed_exams/2025-spring/qzc-qe-probstat-2025-spring.tex](transcribed_exams/2025-spring/qzc-qe-probstat-2025-spring.tex)

- [x] P1 — 均匀次序统计量 \((X_n,Y_n)\)，条件期望 \(\mathbb{E}[X_n\mid\sigma(Y_n)]\)
- [x] P2 — 三维零均值正态，协方差正定约束，线性表示
- [x] P3 — 对称随机游走击中 \(\{-a,b\}\)，矩母函数与 \(\mathbb{E}[s^\tau]\)
- [x] P4 — 加权随机游走鞅，可选停时 \(\mathbb{E}[X_T]\)
- [x] P5 — 布朗运动双边击中 \(T_a=\inf\{t:|B_t|=a\}\)，与符号独立
- [x] P6 — 由 \(\mathbb{E}[(X-Y)^2\mid\sigma(X+Y)]=2\) 推独立标准正态
- [x] P7 — \(U(0,\theta)\) 广义 Bayes（不当先验 \(\pi=1\)）与相合性
- [x] P8 — Gamma 双边检验无 UMP；\(1/\theta\) 的 MLE 与渐近
- [x] P9 — 样本相关系数的 delta method；二元正态 \(\rho\) 的最小充分统计与完备性
- [x] P10 — 基于 \(\frac1n\sum|X_i|\) 的 \(\sigma\) 无偏估计、极限分布、可容许性
- [x] P11 — 移位指数 \((\lambda,\alpha)\) 的 MLE 与非正则渐近

### 2025 秋

源：[transcribed_exams/2025-fall/qzc-qe-probstat-2025-fall.tex](transcribed_exams/2025-fall/qzc-qe-probstat-2025-fall.tex)

- [x] P1 — 指数 \(\times\) Poisson：\(\mathbb{E}[X^N]\)、方差是否有限
- [x] P2 — 两个均匀的 \(\max\) 在 \(\{X+Y\in[0,1]\}\) / \([1,2]\) 上的条件分布
- [x] P3 — 鞅：若 \(X^2\) 也是鞅则常数；\(|X|^p\) 鞅 \(\Rightarrow\) \(|X|^q\) 鞅
- [x] P4 — 非 i.i.d. 和：\(\liminf S_n/n<0<\limsup S_n/n\) a.s.
- [x] P5 — 几何布朗 \(X_t=e^{B_t-t/2}\)：a.s. 收敛、积分的矩、\(\int_0^\infty X_t\,dt<\infty\)
- [x] P6 — \(2\times 2\) GOE：特征值分布、独立性、特征向量正交不变
- [x] P7 — 相合估计 + 充分统计 \(\Rightarrow\) 存在基于充分统计的相合估计
- [x] P8 — 指数族完备充分统计，生存函数 \(\phi=e^{-\lambda x}\) 的 UMVUE
- [x] P9 — Bernoulli 的 \(g(p)\) 的 UMVUE；加权平方损失下 \(\bar X\) 可容许
- [x] P10 — \(U(0,\theta)\) + 对数正态先验：后验、MAP、相合性
- [x] P11 — 离散均匀的单边 / 双边 UMP（含随机化）

### 2026 春

源：[transcribed_exams/2026-spring/qzc-qe-probstat-2026-spring.tex](transcribed_exams/2026-spring/qzc-qe-probstat-2026-spring.tex)

- [x] P1 — 高斯向量指数倾斜变测度，均值 / 协方差
- [x] P2 — 非 i.i.d. 和的 CLT，找 \(b_n\) 使 \(S_n/b_n\Rightarrow N(0,1)\)
- [x] P3 — 面条连端点：环的个数的期望
- [x] P4 — \(\bigl(\int_0^{T^2}e^{B_t}\,dt\bigr)^{1/T}\) 的依分布极限
- [x] P5 — Galton–Watson：条件期望、pgf、灭绝概率
- [x] P6 — GW 树的 inherited property 0–1 律；树上渗流 \(p_c(T)=1/m\)
- [x] P7 — 单调似然比 + 单边 UMP（Karlin–Rubin 型）
- [x] P8 — 样本分位数对离散分布是否相合
- [x] P9 — 两点先验、绝对误差 Bayes 规则、是否 minimax
- [x] P10 — \(\mathrm{Poisson}(\sqrt\lambda)\) 的 UMVUE，与 MLE 的 \(\sqrt n\) 差 \(\to_P 0\)
- [x] P11 — 偏斜正态型密度、MLE 是否存在、\(t\) 型检验的 size

这三套已经覆盖：条件期望、多元正态、鞅与可选停时、简单随机游走停时、布朗运动击中 / 指数鞅、GW 与树上渗流、次序统计量、充分 / 完备 / UMVUE、MLE 与渐近正态、MLR–UMP、不当先验与两点先验的 Bayes / minimax、可容许性。

---

## 大纲覆盖：近三年已够 vs 仍缺

| 大纲条目 | 近三年 | 还要补什么 |
| --- | --- | --- |
| RV / 期望 / 独立 | 已够 | — |
| 方差、协方差、矩 | 已够 | — |
| 常见分布 | 已够（正态、指数、伽马、Poisson、均匀、Bernoulli） | \(t\), \(F\), Beta, 多项, 负二项只是点名，卷面几乎没单独考 |
| 多元分布 | 已够 | — |
| 特征函数 / 母函数 | 部分（停时生成函数、GW 的 pgf） | 用 \(\phi(t)\) 做无穷方差 CLT |
| 收敛模式 | 部分（a.s. / 依分布 / 相合） | 依概率乘积、\(L^1\) 乘积反例 |
| 条件概率 / Bayes 公式 | 已够 | — |
| 对 \(\sigma\)-代数的条件期望 | 已够 | — |
| 大数律 | 边界（2025 秋 P4 是 SLLN 失败） | 标准 SLLN / WLLN 证明可扫一眼，不是洞 |
| CLT | 已够一种（非 i.i.d. truncation） | 特征函数路线、无穷方差正规化 |
| 鞅 | 已够 | Laplace 指数鞅构造仍可补一题 |
| 马氏链 | 只有 GW | 有限状态平稳分布、一般表示定理、树上 RW |
| Poisson 过程 | **零曝光** | 整块要看书 |
| 布朗运动 | 已够 basic | 单边击中 Laplace 变换；桥 / GFF 是加分 |
| 随机游走 | 已够对称停时 | 有偏 RW 破产；树上常返 / 瞬逝 |
| 分布族 / 变换 | 部分 | 指数族点名、\(t/F\) 推导 |
| 样本性质 / delta method | 已够 | 中位数精确分布不是洞 |
| 充分 / 最小充分 / 完备 | 已够 | ancillary、Basu 没点名 |
| 估计（矩估计、MLE、Fisher、CI） | MLE / UMVUE 已够 | 矩估计、Fisher 信息矩阵、置信区间 |
| 检验（NP、UMP、KR、LRT） | UMP / MLR 已够 | **LRT / Wilks**；简单对简单 NP 原题 |
| Bayes | 不当先验、对数正态 MAP、两点先验 | **共轭先验**（Beta–Binomial 等） |
| 大样本 | 相合、渐近正态已够 | \(\chi^2\) 逼近 LRT（Wilks） |
| **线性模型（大纲红字）** | **零曝光** | 整块优先；卷面锚点是 2024 秋 P8、2024 春 P11 |

---

## 优先补的知识点（不是具体题）

卷里没有对应真题、或近三年完全没碰到的大纲块。做完打勾。

- [ ] **线性模型整块（最高优先级，大纲红字）**  
  最小二乘、可估性、Gauss–Markov、参数的点 / 区间 / 检验、预测、置信域与同时置信区间、模型比较与选择、正态误差下 GOF。  
  教材：吴密霞、王松桂《线性模型引论》。卷面最低完成线见下面 2024 秋 P8、2024 春 P11。  
  `review/sec-lm.tex` 里已有 \(t\) 区间、Scheffé、ESS \(F\) 的可默写公式；勾选表示闭卷能写。
- [ ] **Poisson 过程基本性质**  
  独立增量、平稳增量、到达时间 \(\sim\mathrm{Gamma}\)、与指数的关系、条件均匀性。六套卷都没有独立大题。
- [ ] **似然比检验 + Wilks \(\chi^2\)**  
  \(\Lambda=2\log(L_{\hat\theta}/L_{\hat\theta_0})\)，简单 / 复合、广义 LRT。近三年全是 NP / MLR / UMP。
- [ ] **共轭 Bayes**  
  Beta–Binomial、Gamma–Poisson、正态–正态；后验均值（\(L_2\)）与后验中位数（\(L_1\)）。  
  看 [reference/gelman-bda3](reference/gelman-bda3/structure.md) Ch. 1–2、9；Hogg Ch. 11；[yau-final-prep](reference/yau-final-prep/README.md) 的 `yau-stat.pdf` Ch. 5。
- [ ] **ancillary + Basu**  
  2025 春 P9 问过完备性，但没有点名 Basu。
- [ ] **指数族的形式定义**  
  自然形式、充分统计、Cramér–Rao / 完备性从指数族直接读出。
- [ ] **矩估计 / Fisher 矩阵 / Wald 区间**  
  可默写对象在 `review/sec-est.tex`。锚点：2024 秋 P11（跳跃支撑 MoM）、2024 秋 P7（符号反演区间）。
- [ ] **\(t\) / \(F\) / Beta 点名演算**  
  高斯二次型比；线性模型区间用，不是新定理。

---

## 往年题：必须补

近三年没有同构，且堵住的是大纲真实缺口。

### 线性模型

- [x] **2024 秋 P8** — Gauss–Markov：\(\hat\theta=\mathbf{b}^T\hat\beta\) 的均值方差，BLUE，再加 \(I(\beta)\)。稿在 `transcribed_exams/2024-fall/p8-gauss-markov.tex`。  
  源：[transcribed_exams/2024-fall/qzc-qe-probstat-2024-fall.tex](transcribed_exams/2024-fall/qzc-qe-probstat-2024-fall.tex)
- [ ] **2024 春 P11** — \(\theta_1+\theta_2+\theta_3=1\) 的正态线性模型，\(\theta_1\) 的 UMVUE。  
  源：[transcribed_exams/2024-spring/qzc-qe-probstat-2024-spring.tex](transcribed_exams/2024-spring/qzc-qe-probstat-2024-spring.tex)

### 经典马氏链

- [ ] **2023 秋 P3** — \(N\) 枚硬币随机翻：马氏链 + 唯一平稳分布。  
  源：[transcribed_exams/2023-fall/qzc-qe-probstat-2023-fall.tex](transcribed_exams/2023-fall/qzc-qe-probstat-2023-fall.tex)
- [ ] **2024 春 P5** — \(X_n=f(X_{n-1},Z_n)\) 是马氏链；反之任意时齐链都能写成这形式。

### 假设检验（NP / UMP 的另一套设定）

- [ ] **2023 秋 P7** — 正态简单对简单 UMP（改均值 / 改方差），再加单边复合 \(H_0:\mu\ge 1\)。
- [ ] **2024 春 P10** — Pareto 对均值的 UMP（再练一遍非指数族外观下的 MLR）。

---

## 往年题：概率侧建议补

近三年没做过的题型。按性价比大致排序。

- [ ] **2024 春 P6** — BM 单边击中 \(T_a\) 的 Laplace 变换，用 \(e^{uB_t-u^2t/2}\)。（2025 春 P5 是双边 + 符号独立，没有变换。）
- [ ] **2024 秋 P4** — 正则树 / \(b\) 叉树上简单随机游走的常返与瞬逝。
- [ ] **2024 春 P1** — \(\mathbb{E}X^2=\infty\)，用特征函数做 \(S_n/a_n\Rightarrow N(0,1)\)。
- [ ] **2024 春 P3** — \(X_n\xrightarrow{P}X\) 时乘积封闭；\(L^1\) 乘积给反例。
- [ ] **2024 春 P4** — 有偏随机游走：指数鞅、\(\mathbb{P}(T_k<\infty)\)、\(\sup S_n\) 的分布。
- [ ] **2024 春 P2** — 指数样本 \(\limsup X_n/\ln n=1\) 与 \(M_n/\ln n\to 1\) a.s.
- [ ] **2023 秋 P2** — Laplace 密度上构造指数鞅 \(M_n(\theta)\)。
- [ ] **2023 秋 P1** — 二维正态密度、边缘、独立性，再变到 \((R,\Phi)\)。
- [ ] **2023 秋 P5** — \(d\) 正则树 Bernoulli 渗流 \(p_c=1/(d-1)\) 与亚临界指数尾。（2026 春 P6 是随机 GW 树，论证不同。）
- [ ] **2024 秋 P3** — 指数尾 \(\Leftrightarrow\) 矩界 \(\Leftrightarrow\) MGF 在某点有限。
- [x] **2024 秋 P1** — \(\mathbb{E}S_n^4\) 与 \(S_3\) 的 Irwin–Hall 精确分布。稿在 `transcribed_exams/2024-fall/p1-irwin-hall.tex`。
- [x] **2024 秋 P5** — \(M_n=\sum X_k/k\)，\(M_n-\ln n\) a.s. 收敛，\(e^{pM_n}/n^p\) 的 \(L^1\) 收敛。稿在 `transcribed_exams/2024-fall/p5-harmonic-exp.tex`。
- [ ] **2023 秋 P4** — 三颗骰子重掷的最优策略与 \(\mathbb{E}T\)。
- [ ] **2023 秋 P6** — \(n\times n\) 高斯矩阵正交不变、二次型 CLT；提示 Stein / 矩方法。（2025 秋 P6 只是 \(2\times 2\)。）
- [x] **2024 秋 P6** — BM 不击中 0 的条件分布；Brownian bridge = 一维 GFF。大纲只写 basic BM，这是加分难度。稿在 `transcribed_exams/2024-fall/p6-bm-gff.tex`。

---

## 往年题：统计侧建议补

- [ ] **2024 春 P7** — 独立 \(N(\mu_i,1)\)，平方损失下 \(\delta(X)=X\) 是 minimax。（2026 春 P9 是两点参数空间，推不过去。）
- [ ] **2023 秋 P8** — Cauchy 位置族：最小充分统计是整个次序统计量；\(n=2\) 时 MLE 何时唯一。
- [x] **2024 秋 P7** — 只观测 \(Y_i=\mathbf{1}_{\{X_i<0\}}\)：MLE、UMP、置信区间。稿在 `transcribed_exams/2024-fall/p7-signs-mle.tex`。
- [x] **2024 秋 P10** — \(N(\mu,\sigma^2)\)、\(\mu\ge 0\)：\(\bar X\perp S^2\)，\(\mu/\sigma\) 的 UMVUE，\(\bar X\) 可容许性。稿在 `transcribed_exams/2024-fall/p10-normal-mean-var.tex`。
- [ ] **2024 春 P8** — \(\mathrm{Uniform}(\theta,\theta+10)\)：\(\min X_i\) 相合，再对比值做 delta method。
- [ ] **2024 春 P9** — \(\log X_i\sim N(\theta,\theta)\) 的 MLE 与渐近。
- [x] **2024 秋 P11** — \(\mathrm{Uniform}[\theta,\theta+|\theta|]\)：矩估计、MLE、相合性。稿在 `transcribed_exams/2024-fall/p11-uniform-mom.tex`。
- [ ] **2024 秋 P9** — \(U[0,\theta]\) 上 \(F_n(t)\) 对 \(t/(2\bar X)\) 的渐近方差，再加边界 \(nF_n(n^{-1/2})\)。
- [x] **2024 秋 P2** — 标准 delta method + \(\sqrt n(\log(Z_n/n)-\log p)\)。稿在 `transcribed_exams/2024-fall/p2-delta-method.tex`。

---

## 建议顺序

先堵大纲洞，再刷加分题。

1. 线性模型：看书（吴–王）+ **2024 秋 P8** + **2024 春 P11**
2. Poisson 过程：Durrett / Brzeźniak–Zastawniak 基本性质（无真题可对）
3. 马氏链：**2023 秋 P3**、**2024 春 P5**、**2024 秋 P4**
4. 检验：LRT / Wilks（看书）+ **2023 秋 P7** + **2024 春 P10**
5. 共轭 Bayes：BDA Ch. 2 + Hogg Ch. 11（无完全对应真题）
6. 特征函数 CLT / 收敛模式 / 单边 BM：**2024 春 P1、P3、P6**

其余往年题（Cauchy MLE、骰子策略、GFF、Stein、极值、奇异构均匀族）是加分，不是大纲没覆盖。

---

## 按年份总表

| 试卷 | 状态 | 备注 |
| --- | --- | --- |
| [2023 秋](transcribed_exams/2023-fall/qzc-qe-probstat-2023-fall.tex)（8 题全做） | 未过手 | P3 / P7 必须；其余建议补 |
| [2024 春](transcribed_exams/2024-spring/qzc-qe-probstat-2024-spring.tex)（11 选 8） | 未过手 | P5 / P10 / P11 必须 |
| [2024 秋](transcribed_exams/2024-fall/qzc-qe-probstat-2024-fall.tex)（11 选 8） | 未过手 | P8 必须 |
| [2025 春](transcribed_exams/2025-spring/qzc-qe-probstat-2025-spring.tex) | 已掌握 | — |
| [2025 秋](transcribed_exams/2025-fall/qzc-qe-probstat-2025-fall.tex) | 已掌握 | — |
| [2026 春](transcribed_exams/2026-spring/qzc-qe-probstat-2026-spring.tex) | 已掌握 | — |

前提若变了（某套其实没掌握、或后来补做了），改上面的勾选即可。

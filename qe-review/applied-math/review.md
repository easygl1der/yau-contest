# 计算与应用数学博资考复习清单

对照对象：

- 大纲：[syllabus/qzc-qe-applied-math-syllabus-2026-06.md](syllabus/qzc-qe-applied-math-syllabus-2026-06.md)
- 判断「已复习」的依据：对应卷或分题 `.tex` 是否有大量增补（定义、定理、完整解答）。只有题目复述的主文件不算。
- 参考书架：[reference/README.md](reference/README.md)

勾选约定：`[x]` = 已掌握或已补做；`[ ]` = 还没过。

| 试卷 | LaTeX 体量 | 判定 |
| --- | --- | --- |
| [2026 春](transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex) | 主文件约 6.1k 行，P1–P7 都有定理 + 解答 | **整卷已复习** |
| [2025 秋](transcribed_exams/2025-fall/qzc-qe-cam-2025-fall.tex) | 主文件约 360 行（转录）；另有 `p1` `p2` `p4` `p5` `p6` `p7` 分题稿 | **P3 未做**；其余已复习 |
| [2025 春](transcribed_exams/2025-spring/qzc-qe-cam-2025-spring.tex) | 主文件约 300 行；另有 [`p2-newton.tex`](transcribed_exams/2025-spring/p2-newton.tex)、[`p5-cauchy.tex`](transcribed_exams/2025-spring/p5-cauchy.tex) | **只复习了 P2、P5** |
| [2024 秋](transcribed_exams/2024-fall/qzc-qe-cam-2024-fall.tex) | 约 250 行，只有题目复述 | **未过手** |
| [2024 春](transcribed_exams/2024-spring/qzc-qe-cam-2024-spring.tex) | 约 210 行，只有题目复述 | **未过手** |
| [2023 秋](transcribed_exams/2023-fall/qzc-qe-cam-2023-fall.tex) | 约 280 行，只有题目复述 | **未过手** |

---

## 已掌握

### 2026 春（整卷）

源：[transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex](transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex)

- [x] P1 — 无导数迭代（Steffensen 型）求根，局部收敛阶
- [x] P2 — 勒让德正交、最小 \(\|\cdot\|_2\) 多项式、Legendre 节点插值误差、Gauss 求积
- [x] P3 — \(\min\|AXB-C\|_F\)：可解性、唯一性、算法、与谱范数
- [x] P4 — 对流方程三条隐式格式的稳定性
- [x] P5 — 椭圆中心差的最大值原理；抛物 backward Euler 稳定性
- [x] P6 — \(\ddot x-2x-x^2+x^3=0\) 静平衡；小扰动闭轨与周期到 \(O(\epsilon^2)\)
- [x] P7 — 集合的极：凸性、锥、单位球、单形、双极定理

### 2025 秋（有分题稿的）

源：主卷 [qzc-qe-cam-2025-fall.tex](transcribed_exams/2025-fall/qzc-qe-cam-2025-fall.tex)

- [x] P1 — Schulz / Newton 迭代求 \(A^{-1}\)（[`p1-factorization-inversion.tex`](transcribed_exams/2025-fall/p1-factorization-inversion.tex)）
- [x] P2 — Chebyshev 最小 \(\|\cdot\|_\infty\)、Chebyshev 节点插值、带权 Gauss 求积（[`p2-quadrature.tex`](transcribed_exams/2025-fall/p2-quadrature.tex)）
- [x] P4 — 二维热方程 Du Fort–Frankel：相容与稳定（[`p4-dufort-defs.tex`](transcribed_exams/2025-fall/p4-dufort-defs.tex)）
- [x] P5 — 波动方程隐式三点格式稳定（[`p5-wave-stability.tex`](transcribed_exams/2025-fall/p5-wave-stability.tex)）
- [x] P6 — Rayleigh 振子：多尺度 / 大时间近似（[`p6-rayleigh.tex`](transcribed_exams/2025-fall/p6-rayleigh.tex)）
- [x] P7 — LASSO 等价约束、Lagrange 对偶、最优性与列范数 \(\Rightarrow x_i^*=0\)（[`p7-lasso-dual.tex`](transcribed_exams/2025-fall/p7-lasso-dual.tex)）

### 2025 春（只有两题写成稿）

- [x] P2 — Newton：单根二次、重根线性、未知重数的超线性修法（[`p2-newton.tex`](transcribed_exams/2025-spring/p2-newton.tex)）
- [x] P5 — Lax–Wendroff 的 \(\ell_2\) 能量恒等式；有界区间出流边界（[`p5-cauchy.tex`](transcribed_exams/2025-spring/p5-cauchy.tex)）

已覆盖：正交多项式 / Gauss 求积、Newton 族求根、若干矩阵迭代与 \(AXB\) 最小二乘、差分格式 von Neumann / 最大值原理 / 能量法、弱非线性振子、凸极与 LASSO 对偶。

---

## 半套卷里还没写的题

### 2025 秋

- [ ] **P3** — 广义特征值 \(\mu Ax=\lambda Bx\)：多于 \(n\) 个特征值的例子、UET 上三角化、从 \((S,T)\) 读特征值、化成 Hessenberg–三角。  
  大纲「特征值问题的数值方法」里，已复习卷只做了 Schulz 求逆和 \(AXB\)，**没有 QR / 广义特征**。

### 2025 春

- [ ] P1 — 周期函数复合梯形：\(C^m\) 达 \(m\) 阶、解析达指数阶（三角插值 / FFT 圈）
- [ ] P3 — Sherman–Morrison–Woodbury；结构化矩阵 \(Ab,A^{-1},|A|\) 的 \(O(n)\) 算法
- [ ] P4 — 一阶系统 \(u_t=-v_{xx},\,v_t=u_{xx}\) 的截断误差与稳定
- [ ] P6 — \(y''+y+\epsilon(y')^3=0\) 多尺度（与 2025 秋 / 2026 春振子同家族，可扫）
- [ ] P7 — 凸集投影 \(\Pi_K\) 变分不等式；\(\Theta(z)=\tfrac12\|z-\Pi_K(z)\|^2\) 可微

---

## 往年整卷未过手

### 2024 秋

源：[transcribed_exams/2024-fall/qzc-qe-cam-2024-fall.tex](transcribed_exams/2024-fall/qzc-qe-cam-2024-fall.tex)

- [ ] P1 — Chebyshev：是多项式、倍角恒等式、离散正交
- [ ] P2 — **CG 的 \(A\)-范数误差** \(\bigl((\sqrt\kappa-1)/(\sqrt\kappa+1)\bigr)^k\)；非 Hermite 的一条 Krylov 法
- [ ] P3 — Kepler 方程：唯一根、不动点迭代全局收敛、指定初值的 Newton 单调收敛
- [ ] P4 — \(u_t=v_x,\,v_t=u_x\) 的 Lax–Friedrichs 型格式：截断与稳定
- [ ] P5 — 变系数椭圆中心差最大值原理（2026 春 P5 常系数版已做）
- [ ] P6 — \(\epsilon y''+\epsilon(1+x)^2 y'-y=x-1\) 的 **边界层复合展开**
- [ ] P7 — 次梯度非空有界、\(\partial\|x\|_1\)、soft-threshold（与 2025 秋 P7 相邻）

### 2024 春

源：[transcribed_exams/2024-spring/qzc-qe-cam-2024-spring.tex](transcribed_exams/2024-spring/qzc-qe-cam-2024-spring.tex)

- [ ] P1 — **Eckart–Young**：谱范数 / Frobenius 下的最优秩-\(k\) 逼近（SVD）
- [ ] P2 — Gauss–Seidel：矩阵形式；对角占优 / SPD \(\Rightarrow\) 收敛
- [ ] P3 — Hilbert 矩阵：正定、\(\rho(H_n)\) 单调、\(\rho\to\pi\)
- [ ] P4 — 热方程三层格式（参数 \(\theta\)）：截断阶与稳定
- [ ] P5 — 一维变系数差分最大值原理与 \(L^\infty\) 估计
- [ ] P6 — 水平集 \(L(f(x^0))\) 在一致强凸下有界闭凸
- [ ] P7 — 具体 LP：标准化、求最优解（单纯形）

### 2023 秋

源：[transcribed_exams/2023-fall/qzc-qe-cam-2023-fall.tex](transcribed_exams/2023-fall/qzc-qe-cam-2023-fall.tex)

- [ ] P1 — Newton 二次极限；**割线法** 的乘积误差（2025 春 P2 没有割线）
- [ ] P2 — **带位移显式 QR**：Hessenberg 保持、unreduced、次对角衰减
- [ ] P3 — 微分矩阵 \(D_{ij}=l_j'(x_i)\)；**Chebyshev 网格显式公式**（谱方法入口）
- [ ] P4 — **Heun / 显式 RK**：写成一步、收敛阶、绝对稳定域
- [ ] P5 — \(u_t+a u_{xxx}=0\) 的 Lax–Friedrichs 型格式：截断与稳定
- [ ] P6 — LP：基本可行解 = 顶点；对偶 + 强对偶
- [ ] P7 — \(u''+(\lambda+\epsilon f)u=0\) 的特征值 **正则扰动** 到 \(O(\epsilon)\)

---

## 大纲覆盖：已够 vs 仍缺

| 大纲条目 | 已复习卷里 | 还要补什么 |
| --- | --- | --- |
| 三角插值 / FFT | 2025 春 P1 未做 | 周期梯形 \(\leftrightarrow\) 三角插值；**FFT 零曝光** |
| 有理逼近 | **零曝光** | Padé 等，六套都没出 |
| 多项式 / 样条插值 | 正交多项式插值已够 | **样条零曝光** |
| 最小二乘逼近 | 2026 春 P2/P3 | — |
| 非线性方程迭代 | Newton、无导数一步、Schulz | 二分；**拟 Newton / 割线**（2023 秋 P1）；多项式求根 |
| 线性方程组直接 / 迭代 | Schulz、SMW 未做 | **GS**（2024 春 P2）、**CG**（2024 秋 P2）；LU/QR 作为工具出现过 |
| 特征值数值方法 | 没有做成稿 | **2025 秋 P3（广义特征 / UET）、2023 秋 P2（QR）** |
| 条件数 | 2024 秋 P2 的 \(\kappa_2\) 未做 | Hilbert（2024 春 P3） |
| SVD | 2024 春 P1 未做 | Eckart–Young 是大纲锚点 |
| 大型稀疏迭代 | 无独立大题 | CG / Krylov 即此条 |
| 单步 / 多步 ODE | **已复习卷为零** | **2023 秋 P4（RK、绝对稳定）**；多步、刚性 |
| 绝对稳定 / 刚性 | 只有 PDE 格式的稳定 | ODE 绝对稳定域、刚性方法 |
| 有限差分 PDE | 已够一批（对流、热、波、最大值原理） | 2024 春 P4、2024 秋 P4、2023 秋 P5、2025 春 P4 |
| 有限元 | **零曝光** | 大纲书 Brenner–Scott；六套没出 |
| 谱方法 | 2023 秋 P3 未做 | Chebyshev 微分矩阵 |
| Lax 等价 | 差分稳定里用过 | 需要能陈述「相容 + 稳定 \(\Leftrightarrow\) 收敛」 |
| 量纲分析 | **零曝光** | — |
| 渐近 / 驻相 / 边界层 | 振子多尺度已够 | **边界层 2024 秋 P6**；驻相零曝光 |
| Monte-Carlo | **零曝光** | — |
| 单纯形 / 对偶 | 2025 秋 P7 是 LASSO 对偶 | **2023 秋 P6、2024 春 P7** |
| 内点 / 罚函数 / 同伦 / DP | **零曝光** | 大纲有，卷面近年没出 |
| 牛顿 / 不动点（优化语境） | 求根 Newton 已够 | 同伦、DP 仍缺 |

---

## 优先补的知识点（不是具体题）

大纲上你自己标过「不太熟悉」的，对照已复习卷之后仍然空的：

- [ ] **常微分方程数值解整块**（单步 / 多步、绝对稳定、刚性）。已复习卷全是 PDE 差分或解析振子，没有一张 RK 表。锚点：**2023 秋 P4**。
- [ ] **特征值算法**：QR 与广义特征。锚点：**2023 秋 P2、2025 秋 P3**。
- [ ] **SVD / 低秩逼近 / CG / Gauss–Seidel**。锚点：2024 春 P1–P2、2024 秋 P2。
- [ ] **边界层**（不是多尺度振子）。锚点：**2024 秋 P6**。
- [ ] **有限元、谱方法、FFT、样条、有理逼近、Monte-Carlo、量纲、驻相**。卷面很少或没有，但大纲在。
- [ ] **单纯形 + LP 对偶**（LASSO 对偶不能代替）。锚点：2023 秋 P6、2024 春 P7。
- [ ] 内点、罚函数、同伦、动态规划：扫定义即可，近年没出独立大题。

---

## 建议顺序

1. 补完半套卷缺口：**2025 秋 P3**（广义特征），然后 2025 春 P1 / P3 / P7（P4、P6 可放后）。
2. 数值线性代数往年必做：**2024 春 P1（SVD）、P2（GS）**；**2024 秋 P2（CG）**；**2023 秋 P2（QR）**。
3. ODE 数值唯一的真题锚点：**2023 秋 P4**，再按 Hairer / 大纲补多步与刚性。
4. 建模缺口：**2024 秋 P6 边界层**；2023 秋 P7 正则扰动。
5. LP：**2023 秋 P6、2024 春 P7**。
6. 其余往年差分题（2024 春 P4、2024 秋 P4/P5、2023 秋 P5、2025 春 P4）当稳定性手法的复述，优先级低于上面几块。
7. FEM / FFT / 样条 / 有理逼近 / MC：看书，不要等下一套卷才第一次见名词。

# 大二 ODE 笔记（grade-2 / 王高雄）

Support for QE CAM 2026 Spring Problem 6: conservative second-order ODE, closed orbit, period to \(O(\epsilon^{2})\).

The Qiuzhen problem is *not* an elementary first-order quadrature. The useful pieces from the sophomore notes are:

1. **降阶 / 不显含 \(t\)** in [`ode.tex`](./ode.tex) \(\Rightarrow\) energy integral \(\frac12\dot x^{2}+V(x)=E\).
2. **奇点分类** (center vs saddle from linearization) in the same file.
3. **闭轨 / 周期性** in [`ode-periodicity.tex`](./ode-periodicity.tex): energy bounds + uniqueness \(\Rightarrow\) periodic.
4. The remaining catalogue (分离变量、积分因子、Bernoulli、常数变易、Euler、Laplace、Picard、极限环) is a lookup table, not the engine of this problem.

Do **not** `\input{ode.tex}` into the exam `article`: it is a kaobook chapter. The exam notes restate the catalogue and work Problem 6 in

`qe-review/applied-math/transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex` (Problem 6).

## How to read

1. Exam notes first (method map \(\to\) energy/center \(\to\) Lindstedt period).
2. [`ode.tex`](./ode.tex) if you need the original 王高雄 worked examples.
3. [`ode-periodicity.tex`](./ode-periodicity.tex) for the closed-orbit uniqueness pattern (written there for \(\ddot x+x+x^{3}=0\); 2026 P6 is the same with a different \(V\)).
4. Provenance: [SOURCE.md](./SOURCE.md).

## `ode.tex` chapter map

| Section | Methods |
| --- | --- |
| 一阶线性 | 分离变量、齐次 \(y/x\)、Bernoulli、积分因子、恰当方程、隐式/参数、不显含 \(x\) 或 \(y\) |
| 存在唯一性 | Picard 迭代、对初值/参数的依赖、奇解、Clairaut |
| 高阶 | 齐次猜解、常数变易、常系数特征根、Euler \(x=e^{t}\)、比较系数、Laplace、**降阶（本题）**、幂级数 / Bessel |
| 线性系统 | 矩阵指数 / 几何、非齐次变易、Laplace |
| 非线性稳定性 | Lyapunov \(V\)、线性化 |
| 数值 | Picard 逐步逼近 |
| 极限环 | Poincaré–Bendixson 型叙述、范例 \(r'=r(1-r^{2})\) |
| 奇点 | 结点 / 鞍点 / 焦点 / 中心（本题平衡点分类） |

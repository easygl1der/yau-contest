# Agent F 风险审查报告：概率统计、应用、数学物理

日期：2026-07-08

## 输入与范围

- 已读取基线审计：`latex-project/audit/solution_risk_audit.csv`
- 已读取基线说明：`latex-project/audit/solution_risk_audit.md`
- 写入范围限于：
  - `latex-project/content/split_probability/*.tex`
  - `latex-project/content/split_applied/*.tex`
  - `latex-project/content/split_physics/*.tex`
  - `latex-project/audit/agent_probability_applied_physics_report.md`
- 本工作区是多 agent 脏树。本报告只记录 Agent F 本轮审查、修补和结论，不回滚或覆盖其他 agent 的改动。

## 基线风险规模

审计 CSV 中属于本 Agent 范围的行共 315 行，原始风险类型分布如下。

| 原始 risk_type | 行数 |
|---|---:|
| OK | 100 |
| THEOREM_DEP | 93 |
| THEOREM_DEP+SOURCE_ALIGN_RISK | 62 |
| SOURCE_ALIGN_RISK | 52 |
| STATEMENT_RISK+THEOREM_DEP | 4 |
| STATEMENT_RISK+THEOREM_DEP+SOURCE_ALIGN_RISK | 4 |

## 分类口径

- `OK`：原始审计为 OK，或本轮复核后未发现需要修改的风险。
- `THEOREM_DEP_ACCEPTABLE`：依赖的是竞赛解答中可接受的标准定理或通用工具，本轮未发现该依赖本身是考点或导致错误。
- `THEOREM_DEP_EXPANDED`：本轮补充了本题特例证明、有限样本推导、直接计算或不再只引用外部定理。
- `STATEMENT_RISK_FIXED`：题面、模型、结论或原解答表述存在错配或假命题，本轮已在解答中修正或加限定。
- `SOURCE_ALIGN_REVIEWED`：已对照本地年份源 PDF 复核。该状态只表示被点名题目的源文核对，不表示整份年份文件完成全量源文审计。
- `RESIDUAL_RISK`：仍需后续 agent 或人工继续核对，主要包括未全量源文对照的 `SOURCE_ALIGN_RISK` 行、未处理的 `STATEMENT_RISK` 行，以及本轮发现但未全面改写的源文/题面不一致。

组合风险行可同时带有多个结论，例如 `SOURCE_ALIGN_REVIEWED + THEOREM_DEP_EXPANDED`。

## 本轮修改文件

| 文件 | 处理内容 |
|---|---|
| `latex-project/content/split_probability/probability_2016.tex` | 对 `probability:2016:10` 补充圆周切割、spacing simplex 与 Dirichlet/Beta 特例推导，避免只引用 order-statistic 结论。 |
| `latex-project/content/split_probability/probability_2021.tex` | 修正 `probability:2021:5` 中 Basu 归因，把独立性改为正交正态分解直接证明；扩展 `probability:2021:6` least favorable prior/minimax 下界证明。 |
| `latex-project/content/split_probability/probability_2024.tex` | 对照 2024 statistics 源 PDF，重写 `probability:2024:3` 小数位题与 `probability:2024:5` 矩阵 max-min 中位数估计题。 |
| `latex-project/content/split_applied/applied_2010.tex` | 扩展 `applied:2010:7` order statistic/Beta 证明；扩展 `applied:2010:9` affine minimax 证明；按源 PDF 修正 `applied:2010:10` 的 “1 and 1” 投篮模型、MLE 与 delta method 渐近方差。 |
| `latex-project/content/split_applied/applied_2011.tex` | 对 `applied:2011:12` 补充 conditional binomial model 中 complete sufficient statistic 的有限样本多项式证明，并保留 zero-total event 限定。 |
| `latex-project/content/split_applied/applied_2017.tex` | 对 `applied:2017:10` 给出三对角矩阵逆的显式公式，并指出源题 “iff \(\gamma\geq1\)” 对固定 \(n\) 不成立；补充 \(n=2,\gamma=3/4\) 反例与正确固定 \(n\) 条件。 |
| `latex-project/content/split_physics/physics_2026.tex` | 未改写；已复核 `physics:2026:2/5/6` 的单位制、MS/\(\overline{\mathrm{MS}}\) convention 和曲率符号约定。 |

## 点名题目分类

| 行 | 原始审计风险 | 本轮分类 | 结论 |
|---|---|---|---|
| `probability_2016:10` | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED, THEOREM_DEP_EXPANDED | 源 PDF 对齐为圆上随机点弧长题；补充 Dirichlet spacing 本题推导。 |
| `probability_2024:3` | THEOREM_DEP | SOURCE_ALIGN_REVIEWED, STATEMENT_RISK_FIXED, THEOREM_DEP_EXPANDED | 原文件题目与源 PDF 不一致；已改为 \(X^k\) 小数位题并给出必要充分条件。 |
| `probability_2024:5` | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED, STATEMENT_RISK_FIXED, THEOREM_DEP_EXPANDED | 原文件为 unrelated multinomial/UMVUE 题；已改为矩阵 max-min 中位数估计题并推导极限分布。 |
| `applied_2010:10` | OK | SOURCE_ALIGN_REVIEWED, STATEMENT_RISK_FIXED, THEOREM_DEP_EXPANDED | 原审计漏报；源题是 “1 and 1” 随机投篮次数模型，已修正 MLE 分母与 delta method 渐近分布。 |
| `applied_2011:12` | THEOREM_DEP | THEOREM_DEP_EXPANDED | 补 finite-sample binomial completeness 证明；仍明确 unconditional zero-total event 限定。 |
| `applied_2017:10` | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED, STATEMENT_RISK_FIXED, THEOREM_DEP_EXPANDED | 源文核对后确认题面照录，但 “fixed \(n\) iff \(\gamma\geq1\)” 不成立；解答中已写清正确固定 \(n\) 条件和 uniform sufficient interpretation。 |
| `physics_2026:2` | OK | OK, SOURCE_ALIGN_REVIEWED | SI units 已显式声明；磁场和感应电场量纲一致。 |
| `physics_2026:5` | OK | OK, SOURCE_ALIGN_REVIEWED | 已写明 metric、counterterm 符号、MS 与 \(\overline{\mathrm{MS}}\) finite convention 差异。 |
| `physics_2026:6` | OK | OK, SOURCE_ALIGN_REVIEWED | 已写明 Riemann tensor convention；问题式 (11) 下 \(K=1\)，标准符号下曲率为 \(-1\)。 |

## 额外消解的重点风险

| 行 | 分类 | 结论 |
|---|---|---|
| `probability_2021:5` | THEOREM_DEP_EXPANDED | 去掉不合适的 Basu 归因，改用投影正交性和 joint normality 证明 \(P_XY\) 与 residual 独立。 |
| `probability_2021:6` | THEOREM_DEP_EXPANDED | least favorable Gaussian prior sequence 的 minimax 下界已写成正式不等式链。 |
| `applied_2010:7` | THEOREM_DEP_EXPANDED | order statistic 的 CDF 求和与求导得到 Beta density。 |
| `applied_2010:8` | THEOREM_DEP_EXPANDED, RESIDUAL_RISK | 当前解答已有 kernel CLT 推导；但源题印刷归一化与标准 kernel CLT 不一致，见残留风险。 |
| `applied_2010:9` | THEOREM_DEP_EXPANDED | affine minimax 证明已从 general affine estimator 化约到 shrinkage estimator 并显式优化。 |

## THEOREM_DEP_ACCEPTABLE 分组

以下纯 `THEOREM_DEP` 行未在本轮逐题改写，但按当前审计信息分类为 `THEOREM_DEP_ACCEPTABLE`：它们依赖的是常规竞赛解答可接受工具，且没有同时挂 `SOURCE_ALIGN_RISK` 或未处理的 `STATEMENT_RISK`。不包括上文已扩展、已修复或下文列入残留风险的行。

- `applied`: 2010:4,6; 2011:5,9; 2012:1,7; 2014:2,7,8,9; 2015:5,6,8,9,10; 2019:1,3,8,9; 2020:1,2; 2021:1,3,4,6; 2024:1,3,5,6; 2025:3,4; 2026:1,2,4.
- `physics`: 2022:1,3,4; 2024:3,5; 2025:2,3,4,6.
- `probability`: 2010:2,4,6,7,8,9,11; 2011:1,5,9,10; 2012:2,7; 2014:1,2,3,4,5,6,7,8,9; 2015:1,4; 2019:1,2,3,5; 2020:2,3,6; 2021:1,2,3,4; 2022:1,3,4,5; 2025:1; 2026:5.

## SOURCE_ALIGN_REVIEWED 分组

本轮实际对照源 PDF 的题目如下。

- `probability`: 2016:10; 2024:3,5.
- `applied`: 2010:10; 2011:12; 2017:10.
- `physics`: 2026:2,5,6.

已使用的本地源文件包括：

- `2016/2016-team.pdf`
- `2024/2024 statistics.pdf`
- `2010/Applied, Computational, Probability and Statistics-team.pdf`
- `2011/6.AppliedMathProb-Team-2011.pdf`
- `2017/2017-team.pdf`
- `2026/2026 physics.pdf`

## RESIDUAL_RISK

以下风险未在本轮完全消解。

### 明确残留

- `probability_2024:1/2/4/6`：本轮对照 2024 statistics 源 PDF 时发现当前 `probability_2024.tex` 并非整份文件源文对齐；本轮只按点名要求修复 3 和 5。1、2、4、6 需要下一轮全量源文重建。
- `applied_2010:8`：当前解答给出标准 kernel density estimator CLT；但源题中分母形如 \((b_n\sum_i Y_{n,i})^{1/2}\) 的归一化与标准 CLT 标度不一致，可能是印刷/OCR 或题面理解问题。建议后续对照高清源文后决定是否改题面或加注。
- 未处理的 `STATEMENT_RISK` 行：`applied_2010:12`, `applied_2011:4`, `applied_2026:5`, `probability_2010:12`, `probability_2013:12`, `probability_2016:9`, `probability_2019:4`, `probability_2025:2`。
- `physics_2026:3`：原始审计为 `THEOREM_DEP+SOURCE_ALIGN_RISK`，不在本轮点名 2/5/6 范围内，未源文复核。

### 剩余 SOURCE_ALIGN_RISK 分组

除上文 `SOURCE_ALIGN_REVIEWED` 已列出的题目外，审计 CSV 中其余带 `SOURCE_ALIGN_RISK` 的行均保留为 `RESIDUAL_RISK`。

- `applied`: 2013:1,2,3,4,5,6,7,8,9,10,11; 2016:1,2,3,4,5,6,7,8,9,10; 2017:1,2,3,4,5,6,7,8,9; 2018:1,2,3,4,5,6,7,8,9,10; 2022:6; 2023:1,2,3,4,5,6; 2025:5.
- `physics`: 2022:2,6; 2023:1,2,3,4,5,6; 2026:3.
- `probability`: 2010:1,3,12; 2011:7; 2012:1; 2013:1,2,3,4,5,6,7,8,9,10,11,12; 2014:10; 2015:3,8; 2016:1,2,3,4,5,6,7,8,9; 2017:1,2,3,4,5,6,7,8,9,10; 2018:1,2,3,4,5,6,7,8,9,10; 2019:4,6; 2023:1,2,3,4,5,6; 2024:2,4,6.

## 物理约定复核

- `physics_2026:2`：采用 SI units；磁场公式中的整体因子为 \(\mu_0 I\)。报告中保留了不同单位制只需替换整体 magnetostatic normalization 的说明。
- `physics_2026:5`：采用 metric \((- ,+,+,+)\)；\(\phi^4\) vertex 为 \(-ig\)；counterterm 取 \(\mathcal L_{\mathrm{ct}}=-\delta g\,\phi^4/4!\)，因此 vertex 为 \(-i\delta g\)。MS 去 pole，\(\overline{\mathrm{MS}}\) 可同时去有限常数，beta function 符号为正。
- `physics_2026:6`：显式采用解答中的 Riemann convention。题面式 (11) 使用 \(g_{\mu\sigma}g_{\nu\rho}-g_{\mu\rho}g_{\nu\sigma}\) 的顺序，因此 Klein disk 的题面 \(K=1\) 对应标准常曲率 \(-1\)，scalar curvature 为 \(-2\)。

## 结构检查

已对以下目录内所有 `.tex` 文件做轻量结构检查：

- `latex-project/content/split_probability/*.tex`
- `latex-project/content/split_applied/*.tex`
- `latex-project/content/split_physics/*.tex`

检查项：每个文件中 `\begin{exercise}`, `\end{exercise}`, `\begin{solution}`, `\end{solution}` 数量是否一致。

结果：未发现不匹配文件。

未运行整份 LaTeX 编译；当前仓库为多 agent 并行修改状态，整编结果可能受到非 Agent F 写入范围影响。

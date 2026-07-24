# Agent Statement Risk Follow-up Report

日期：2026-07-08

## 输入与范围

已读取：

- `latex-project/audit/agent_probability_applied_physics_report.md`
- `latex-project/audit/solution_risk_audit.csv`

本轮只处理 Agent F 报告中列出的 8 个残留 `STATEMENT_RISK`。工作区为多 agent 脏树，本轮未回滚或覆盖其它 agent 的改动，写入仅限用户指定文件。

## 逐题处理结果

| 题号 | status | 修改文件 | 处理说明 |
|---|---|---|---|
| `applied_2010:12` | `STATEMENT_RISK_FIXED` | `latex-project/content/split_applied/applied_2010.tex` | 保留原题面；在 solution 中显式说明按字面两个 guarantee 问题为否。补充 \(A+B\) 非双曲 PDE 反例，并给出两个 separately stable 更新矩阵乘积不稳定的离散反例；同时写明若有共同 \(L^2\) 收缩条件则可成立。 |
| `applied_2011:4` | `FALSE_POSITIVE_CLARIFIED` | `latex-project/content/split_applied/applied_2011.tex` | 题目结论在 \(E|X|<\infty\) 的通常解释下为真。原 Jensen 路线不足，已改为用 iid 对称性证明 \(E|X-Y|\leq E|X+Y|\)，再由三角不等式推出结论。 |
| `applied_2026:5` | `FALSE_POSITIVE_CLARIFIED` | `latex-project/content/split_applied/applied_2026.tex` | 题面本身一致：(b) 明确要求去掉 \(\sigma_1(A)\leq1\) 后的反例，(a) 与 (c) 是两个不同充分条件。solution 中加入 statement-risk note，原证明结构保留。 |
| `probability_2010:12` | `STATEMENT_RISK_FIXED` | `latex-project/content/split_probability/probability_2010.tex` | 保留原题面；按第 12 个 exercise/solution 块定位。补充同类 PDE 非双曲反例与稳定子步乘积不稳定反例，并写明额外共同收缩条件下的可成立版本。 |
| `probability_2013:12` | `FALSE_POSITIVE_CLARIFIED` | `latex-project/content/split_probability/probability_2013.tex` | 题面不是假命题：第二问本来要求 prove or disprove，正确处理是反例；第三问中的 full rank 澄清为 full column rank。solution 中加入澄清说明。 |
| `probability_2016:9` | `FALSE_POSITIVE_CLARIFIED` | `latex-project/content/split_probability/probability_2016.tex` | 审计中的 counterexample 风险为误报。已删除原 solution 中先猜反例再自我纠正的段落，改为直接证明：若尾和发散，则对任意 \(M>1\) 有 \(|X_n|\geq Mn\) infinitely often，从而 limsup 为无穷，矛盾。 |
| `probability_2019:4` | `STATEMENT_RISK_FIXED` | `latex-project/content/split_probability/probability_2019.tex` | 原“大样本会近似 Gaussian”按字面缺少正则条件。已加入 dominant unit 反例说明，并给出 finite-population Lindeberg 条件下的 Hajek CLT 可成立版本。 |
| `probability_2025:2` | `STATEMENT_RISK_FIXED` | `latex-project/content/split_probability/probability_2025.tex` | 原反例为有限支持，未满足 \(\nu(X)\)、\(\nu(Y)\) unbounded。已替换为 countable unbounded-support 分布，保持有限期望且满足 \(E_1\nu(X)>E_2\nu(Y)\)，但正确选择概率仍小于 \(1/2\)。 |

## 状态汇总

| status | 数量 |
|---|---:|
| `STATEMENT_RISK_FIXED` | 4 |
| `FALSE_POSITIVE_CLARIFIED` | 4 |
| `RESIDUAL_RISK` | 0 |

## 结构检查

已对 8 个目标 `.tex` 文件运行轻量结构计数，检查 `\begin{exercise}` / `\end{exercise}` 与 `\begin{solution}` / `\end{solution}` 是否匹配。

| 文件 | exercise | solution |
|---|---:|---:|
| `latex-project/content/split_applied/applied_2010.tex` | 12/12 | 12/12 |
| `latex-project/content/split_applied/applied_2011.tex` | 12/12 | 12/12 |
| `latex-project/content/split_applied/applied_2026.tex` | 6/6 | 6/6 |
| `latex-project/content/split_probability/probability_2010.tex` | 12/12 | 12/12 |
| `latex-project/content/split_probability/probability_2013.tex` | 12/12 | 12/12 |
| `latex-project/content/split_probability/probability_2016.tex` | 10/10 | 10/10 |
| `latex-project/content/split_probability/probability_2019.tex` | 8/8 | 8/8 |
| `latex-project/content/split_probability/probability_2025.tex` | 4/4 | 4/4 |

结果：结构计数未发现不匹配。

未运行整份 LaTeX 编译；当前仓库存在多 agent 并行改动，整编结果可能受到本轮范围外文件影响。

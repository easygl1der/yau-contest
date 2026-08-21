# 人工智能博资考复习清单

对照对象：

- 大纲：[syllabus/qzc-qe-ai-syllabus-2026-06.md](syllabus/qzc-qe-ai-syllabus-2026-06.md)
- 判断「已复习」的依据：对应卷的 LaTeX 是否有大量增补（完整解答、study guide、universal review）。`structure/*.md` 里 `study_status: not started` 只是导航脚手架，**不**算已复习。
- 本仓库只有三套 AI 卷：2025 春、2025 秋、2026 春。没有 2023 / 2024 转录。

卷面源文件在 [`transcribed_exams/`](transcribed_exams/)。勾选约定：`[x]` = 已掌握或已补做；`[ ]` = 还没过。

| 试卷 | LaTeX 体量 | 判定 |
| --- | --- | --- |
| [2025 春](transcribed_exams/2025-spring/qzc-qe-ai-2025-spring.tex) | 主文件约 12k 行 + 四份 `*-universal-review.tex` | **整卷已复习** |
| [2025 秋](transcribed_exams/2025-fall/qzc-qe-ai-2025-fall.tex) | 约 1750 行，每题都有 Study guide；有 verification report | **整卷已复习**（guide 深度，不是 2025 春那种长解答） |
| [2026 春](transcribed_exams/2026-spring/qzc-qe-ai-2026-spring.tex) | 约 850 行，solutions 段基本是题目复述；structure 全是 `scaffold-only` | **未过手** |

---

## 已掌握：2025 春

源：[transcribed_exams/2025-spring/qzc-qe-ai-2025-spring.tex](transcribed_exams/2025-spring/qzc-qe-ai-2025-spring.tex)

旁路讲义：[`ml-universal-review.tex`](transcribed_exams/2025-spring/ml-universal-review.tex)、[`dl-universal-review.tex`](transcribed_exams/2025-spring/dl-universal-review.tex)、[`opt-universal-review.tex`](transcribed_exams/2025-spring/opt-universal-review.tex)、[`nlp-universal-review.tex`](transcribed_exams/2025-spring/nlp-universal-review.tex)

### A. 机器学习理论

- [x] A1 — 经验损失方差 \(= p(1-p)/m\)
- [x] A2 — 非 i.i.d. 有限类、可实现 PAC 型界
- [x] A3 — \(\mathrm{VCdim}(\mathcal{H}\cup\mathcal{H}')\)；矩形 \(\cup\) 三角形
- [x] A4 — replace-one 稳定性 \(\Rightarrow\) 泛化；正则化 ERM  excess-risk 界

### B. 深度学习与强化学习

- [x] B1 — 监督 DL 管线：假设空间、交叉熵 + SGD、BN、表达力 / 过拟合
- [x] B2 — VP-SDE 分数扩散：反向 SDE、score matching 等价、条件高斯与 DSM 损失

### C. 优化

- [x] C1–C6 — \(L\)-光滑 / \(\mu\)-强凸、合成不等式、prox-SGD 一步、方差分解、线性收缩 + noise floor、复杂度

### D. 自然语言处理

- [x] D1 — trigram 估计与稀疏上下文平滑
- [x] D2 — representation learning
- [x] D3 — top-\(P\) vs greedy / beam / top-\(K\)
- [x] D4 — 当前 LLM 有效的关键点
- [x] D5 — Transformer 相对 RNN 的优势
- [x] D6 — data scaling law 的统计学习解释
- [x] D7 — 已有 reward model 之后的 RLHF（数据、损失、梯度）
- [x] D8 — 无标注 QA 对的领域问答系统设计（embedding / RAG）

---

## 已掌握：2025 秋

源：[transcribed_exams/2025-fall/qzc-qe-ai-2025-fall.tex](transcribed_exams/2025-fall/qzc-qe-ai-2025-fall.tex)

### A. 机器学习理论

- [x] A1 — bias–variance（选择）
- [x] A2 — No Free Lunch（选择）
- [x] A3 — Rademacher complexity（选择）
- [x] A4 — ERM 最小化什么（选择）
- [x] A5 — VC 维（选择）
- [x] A6 — agnostic PAC（选择）
- [x] A7 — SGD 递减步长（选择）
- [x] A8 — Sauer 引理（bonus）
- [x] A9 — 带符号区间的 VC 维
- [x] A10 — 强凸性质
- [x] A11 — 同心圆的 PAC 可学习
- [x] A12 — projected SGD 一步不等式
- [x] A13 — 神经网络构造性万能逼近

### B. 深度学习与强化学习

- [x] B1 — CNN / self-attention / 混合视觉模型
- [x] B2 — 似然、flow、VAE、diffusion
- [x] B3 — policy gradient 定理与 baseline

### C. 优化

- [x] C1–C9 — 定义、唯一最小点、无偏梯度、expected smoothness、importance sampling、最优点方差 / minibatch、AC 不等式、步长与收敛

### D. 自然语言处理

- [x] D1 — 文本与图 embedding
- [x] D2 — scaling law 与 LSTM vs Transformer 的架构偏差
- [x] D3 — Markov Logic Network
- [x] D4 — topic–ontology LDA
- [x] D5 — 文生图扩散系统设计

这两套已经覆盖：PAC / VC / Sauer / Rademacher、稳定性泛化、prox-SGD 与 importance-sampling SGD、分数扩散 + flow/VAE、policy gradient、trigram / Transformer / scaling / RLHF / MLN / LDA / RAG 设计。

---

## 未过手：2026 春

源：[transcribed_exams/2026-spring/qzc-qe-ai-2026-spring.tex](transcribed_exams/2026-spring/qzc-qe-ai-2026-spring.tex)

structure 全是脚手架，主 tex 没有写成解答。下面标了和 2025 的重叠，避免重复劳动。

### A. 机器学习理论

- [ ] MQ1 — agnostic PAC 比较对象（与 2025 秋 A6 同构，可扫）
- [ ] MQ2 — 增长函数 / Sauer（与 2025 秋 A8 同构，可扫）
- [ ] MQ3 — ReLU 的学习论陈述
- [ ] MQ4 — ERM 与 PAC（与 2025 秋 A4/A6 近）
- [ ] MQ5 — No Free Lunch（与 2025 秋 A2 同构，可扫）
- [ ] MQ6 — **核 / 特征映射**（2025 没做过；对上大纲「SVM，核方法」）
- [ ] A1 — 经验损失 MSE（与 2025 春 A1 几乎同一题）
- [ ] A2 — \(\lambda\)-强凸 \(\Rightarrow\) 唯一最小点（2025 秋 A10 附近）
- [ ] A3 — 区间 \(\lor\) 射线 的增长函数与 VC（2025 秋 A9 的变体，建议做）
- [ ] A4 — **multivector 可分 / 多类几何间隔**（2025 没有同构）
- [ ] A5 — **ReLU 网与 sigmoid 网表示同一函数 \(\Rightarrow\) 常数**（2025 没有）

### B. 深度学习与强化学习

- [ ] B1 — 反传复杂度、sigmoid 消失梯度、**动量 SGD**、attention 的 \(1/\sqrt{d_k}\)、RNN vs Transformer
- [ ] B2 — **flow matching**：条件速度、连续性方程、回归目标、带 score 的 SDE / Fokker–Planck（2025 春是 VP-SDE 分数扩散，不是这条）
- [ ] B3 — Bellman、策略迭代、actor–critic、RLHF 或 DPO（PG / RLHF 2025 做过；Bellman + PI + AC 建议补）

### C. 优化

- [ ] C1–C8 — prox-SGD 主链（与 2025 春 C 高度同构：光滑 / 强凸、prox 最优性、次微分单调、非扩张、一步、方差、收缩）
- [ ] C9–C10 — **iterate averaging 降方差** 与 \(\mathcal{O}(\log k/k)\)（2025 春停在 last-iterate + noise floor，这两问是新的）

### D. 自然语言处理

- [ ] D1 — **InfoNCE 梯度**与高维假负例（大纲「对比学习」；2025 没推过梯度）
- [ ] D2 — 监督 LDA（与 2025 秋 D4 近，建议过一遍生成过程）
- [ ] D3 — **超长序列 Transformer**（稀疏 / 窗口 / 线性 / 记忆；2025 没有设计题）
- [ ] D4 — MLN 信息抽取（与 2025 秋 D3 同家族，规则 + 消歧是新包装）
- [ ] D5 — RAG 外部记忆的 \(\Delta>0\) 条件 + 写成 MDP（2025 春 D8 是系统设计，没有这条不等式）

---

## 大纲覆盖：已够 vs 仍缺

| 大纲条目 | 已复习卷里 | 还要补什么 |
| --- | --- | --- |
| 监督学习 / PAC | 2025 春 A2、2025 秋 A6 | — |
| VC / Sauer / 样本复杂度 | 2025 春 A3、2025 秋 A5/A8/A9/A11 | 2026 春 A3 做变体即可 |
| 模型选择、偏差–方差 | 2025 秋 A1 | 没有独立的 CV / 结构风险大题 |
| 线性回归 / 逻辑回归 | 未单独出题 | 大纲点名，建议手推一次 MLE / 凸性 |
| 决策树 | **零曝光** | 信息增益 / 过拟合，看书 |
| 最近邻 | **零曝光** | \(k\)-NN 一致性或样本复杂度 |
| SVM / 核方法 | 几乎没有 | **2026 春 MQ6、A4**；再补核 SVM 对偶 |
| 压缩感知 | **零曝光** | RIP / \(\ell_1\) 恢复，三套卷都没出 |
| DL 基础：框架 / 训练 / 逼近 / 泛化 | 2025 春 B1、2025 秋 A13/B1 | 2026 春 B1 的动量与 \(1/\sqrt{d_k}\) |
| 视觉任务（特征、恢复、三维、光流、识别分割） | 只有 CNN/Transformer 架构 | **整块视觉任务零大题** |
| 无监督：AE / 对比 / 隐式正则 / 迁移元学习 | 对比只在 2026 春 D1（未做） | AE、迁移、元学习没做过 |
| 生成：GAN / VAE / 扩散 / 流 / 表达力 | 2025 春 B2、2025 秋 B2 | GAN 没做过；**flow matching 在 2026 春 B2** |
| RL：Bellman / Q-learning / PG | 2025 秋 B3（PG）、2025 春 D7（RLHF） | **Q-learning 零曝光**；Bellman / PI 在 2026 春 B3 |
| 凸集 / 凸函数 | 强凸用得很多 | 凸集几何本身很少 |
| 次微分 | 2025 春用 prox，没单独证单调 | **2026 春 C2–C5** |
| GD / SGD / 随机坐标下降 | GD/SGD 已够 | **坐标下降零曝光** |
| 动量 / 自适应学习率 | 选择里提过递减步长 | **动量、Adam 类没有推导**；2026 春 B1(c) |
| NLP 统计建模假设 | trigram、LDA、MLN | — |
| Word2vec 数学 | 2025 春 D2 概念层 | 负采样 / skip-gram 目标式没推 |
| self-attention | 2025 秋 B1、2025 春 D5 | 2026 春 B1(d) 的缩放 |
| 预训练对齐 | 2025 春 D7 RLHF | DPO 在 2026 春 B3，未做 |
| Scaling Law | 2025 春 D6、2025 秋 D2 | — |
| Embedding 知识库推理 | 2025 春 D8、2025 秋 D1 | 2026 春 D5 更形式 |

---

## 优先补的知识点（不是具体题）

- [ ] **SVM + 核方法 + 压缩感知**（大纲点名，已复习卷几乎空白）
- [ ] **决策树、\(k\)-NN、线性 / 逻辑回归** 的可考写法（定义、训练、复杂度 / 一致性各一页）
- [ ] **Q-learning** 与 Bellman 最优性（PG / RLHF 已经有了）
- [ ] **GAN**；视觉任务名词（光流、三维重构、分割）能写清输入输出与损失
- [ ] **动量与自适应学习率**（Nesterov / Adam 更新式 + 直觉）
- [ ] **随机坐标下降**
- [ ] **Word2vec** 的 skip-gram + 负采样目标
- [ ] 自编码器、迁移学习、元学习（大纲有，卷面没出过）

---

## 建议顺序

1. 先做 **2026 春** 里 2025 没有同构的题：A4、A5、MQ6、B2、B3、C9–C10、D1、D3、D5。
2. 2026 春里和 2025 高度重复的（A1、MQ1/2/5、C1–C8）当计时复述，不必重新写长稿。
3. 再补大纲零曝光：压缩感知、决策树 / \(k\)-NN、Q-learning、GAN、坐标下降、Word2vec 公式。
4. 视觉任务、AE / 迁移 / 元学习：按大纲扫定义即可，三套卷都没出独立大题。

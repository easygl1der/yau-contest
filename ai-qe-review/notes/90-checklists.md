# 考前 Checklist 与增量路线

本章不是新的理论章，而是把第 [[01-syllabus|考试大纲与考点地图]] 章的官方考纲、第 [[02-primer|从零开始的理论预备]] 章的理论闭包，以及第 [[03-2025-spring|2025 春季 QE-AI 真题解答]]--[[05-2026-spring|2026 春季 QE-AI 真题解答]] 章的公开真题解答压缩成一份考前执行手册。读法很简单：先用覆盖表确认没有漏考点，再用四门课的闭卷 checklist 做自测，最后按增量路线把错题回写到理论章或真题章。

**来源定位：** 路线依据：求真书院 AI 方向博士生资格考试大纲 [@qzc-ai-syllabus-2026]，公开卷 [@qzc-ai-2025-spring; @qzc-ai-2025-fall; @qzc-ai-2026-spring]，以及第 [[02-primer|从零开始的理论预备]] 章的理论预备。

本章的蓝色概念词可直接跳回第 [[02-primer|从零开始的理论预备]] 章的定义、推导或比较表。若某个 checklist 条目只能链接到概念名而没有推导背景，应按 C0 标签补第三章，而不是把背景塞在第七章里。

## 使用原则

考前复习最容易出现两种失误：一是只背公式但不会说明公式从哪里来；二是只看真题答案但没有形成可迁移模板。本章采用三个判定标准。

1.  能闭卷写出对象、假设、公式和推导骨架。

2.  能把每个考点映射到至少一道公开卷题或一个可能题型。

3.  能在错题后判断应该补第 [[02-primer|从零开始的理论预备]] 章、真题章，还是只补计算熟练度。

每个条目按三档自评：$0$ 表示只认得名词；$1$ 表示能复述定义或公式；$2$ 表示能在新题中独立完成推导或设计。考前最后一轮只追 $0\to1$ 和高频 $1\to2$，不要把所有低频知识点平均用力。

## 考纲覆盖总表

下面的表用于确认第七章的路线覆盖，而不是替代第 [[02-primer|从零开始的理论预备]] 章的教学内容。若某一行自评低于 $1$，先回读第 [[02-primer|从零开始的理论预备]] 章对应小节；若自评为 $1$ 但真题仍错，再回到第 [[03-2025-spring|2025 春季 QE-AI 真题解答]]--[[05-2026-spring|2026 春季 QE-AI 真题解答]] 章重做相近题。

| 考纲方向 | 必须闭卷掌握 | 回查位置 |
| --- | --- | --- |
| 机器学习理论 | [[02-primer#PAC 学习|PAC]]/[[02-primer#Agnostic PAC 与统一收敛|agnostic PAC]]、[[02-primer#VC 维、增长函数与 Sauer 引理|VC/Sauer]]、[[02-primer#模型选择与偏差方差|模型选择]]、线性/逻辑回归、树、最近邻、[[02-primer#SVM、margin 与核方法|SVM/核]]、[[02-primer#压缩感知|压缩感知]] | 第 [[02-primer|从零开始的理论预备]] 章学习理论和经典模型；2025 春/秋与 2026 春 A 卷 |
| 深度学习和强化学习 | MLP/CNN/Transformer、[[02-primer#反向传播|反向传播]]、逼近和泛化、视觉任务、无监督学习、[[02-primer#生成模型|生成模型]]、[[02-primer#Bellman 方程|Bellman]]/[[02-primer#Q-learning|Q-learning]]/[[02-primer#Policy gradient 与 baseline|policy gradient]] | 第 [[02-primer|从零开始的理论预备]] 章深度学习、生成模型、RL；三套 B 卷 |
| 人工智能中的优化方法 | [[02-primer#凸集、凸函数与一阶条件|凸集/凸函数]]、次微分、GD/[[02-primer#GD、SGD 与随机坐标下降|SGD]]/随机坐标下降、动量、自适应学习率、[[02-primer#Proximal operator 与复合优化|prox 递推]] | 第 [[02-primer|从零开始的理论预备]] 章优化；三套 C 卷 |
| 自然语言处理 | [[02-primer#统计语言模型|统计建模]]、[[02-primer#Word2vec、GloVe 与 embedding|Word2vec]]、[[02-primer#Transformer self-attention|self-attention]]、[[02-primer#LLM 预训练、指令微调与对齐|预训练对齐]]、[[02-primer#Scaling Law|scaling law]]、[[02-primer#Embedding 知识库推理、RAG 与 MLN|embedding 知识库推理]] | 第 [[02-primer|从零开始的理论预备]] 章 NLP/LLM；三套 D 卷 |

## 机器学习理论

**来源定位：** 本节对应考纲 Machine Learning Theory。基础理论回查 [@shalev2014uml; @mohri2018foundations]，压缩感知回查 [@candes2006compressive]。

##### 闭卷自测

- 能把固定 $h$ 的 $0$-$1$ 误差写成 Bernoulli 平均，并快速得到均值、方差、Hoeffding/Chernoff 型界，回查 [[02-primer#PAC 学习|PAC 集中界推导]]。

- 能区分 realizable PAC 与 [[02-primer#Agnostic PAC 与统一收敛|agnostic PAC]]：前者寻找零训练误差假设，后者与 $\inf_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$ 竞争。

- 能从固定假设的集中不等式过渡到有限类 union bound，再过渡到 [[02-primer#VC 维、增长函数与 Sauer 引理|VC/Sauer]] 的无限类控制。

- 能定义 shattering、增长函数 $\tau_{\mathcal{H}}(m)$、[[02-primer#VC 维、增长函数与 Sauer 引理|VC 维]]，并用 Sauer 引理解释样本复杂度和 VC 维的关系。

- 能求一维几何类的 VC 维：先构造 shatter 下界，再找一个不可实现 pattern 做上界。

- 能解释 [[02-primer#模型选择与偏差方差|模型选择中的 approximation error、estimation error、bias squared 和 variance]]。

- 能推线性回归正规方程、岭回归一阶条件、逻辑回归负对数似然和梯度。

- 能说明决策树的信息增益或 Gini 指标为什么会过拟合，以及剪枝或验证集如何控制复杂度。

- 能比较 $1$-NN 与 $k$-NN 的 bias-variance 和距离尺度敏感性。

- 能写 [[02-primer#SVM、margin 与核方法|hard/soft margin SVM]] 的 primal、hinge loss、对偶变量直觉和 kernel PSD 条件。

- 能解释 [[02-primer#压缩感知|压缩感知]] 中的稀疏性、欠定测量、$\ell_1$ 松弛和 RIP 为什么相关。

##### 推导模板

学习理论题通常不是问"记不记得结论"，而是问能否把概率界从单个对象扩展到整个类。最常用模板是：

$$
\text{固定 } h
  \Longrightarrow
  \text{集中不等式}
  \Longrightarrow
  \text{union bound}
  \Longrightarrow
  \text{增长函数或复杂度替换}.
$$

其中 $h\in\mathcal{H}$ 是假设，$\mathcal{H}$ 是假设类，$m$ 是样本量。若题目出现 agnostic PAC，还要补上 ERM 三行证明：

$$
L_{\mathcal{D}}(h_S)
  \le
  L_S(h_S)+\varepsilon
  \le
  L_S(h^*)+\varepsilon
  \le
  L_{\mathcal{D}}(h^*)+2\varepsilon.
$$

这里 $h_S$ 是 ERM 输出，$h^*\in\operatorname*{arg\,min}_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$。第一步和第三步来自统一收敛，第二步来自 ERM 定义。

##### 常见失分点

- 只写 Hoeffding，不写对 $\mathcal{H}$ 的 [[02-primer#PAC 学习|union bound]]。

- 把 [[02-primer#VC 维、增长函数与 Sauer 引理|VC 维]]和参数个数等同，而不说明 shattering。

- 忘记 [[02-primer#Agnostic PAC 与统一收敛|agnostic 情形]]要和类内最优竞争，而不是和 Bayes rule 直接竞争。

- [[02-primer#SVM、margin 与核方法|SVM 对偶]]中只写 kernel trick，不检查 kernel 是否 symmetric positive semidefinite。

- [[02-primer#压缩感知|压缩感知]]题只背"少量测量可恢复"，不说明稀疏性和 RIP 是恢复保证的条件。

## 深度学习与强化学习

**来源定位：** 本节对应考纲 Advanced Deep Learning。神经网络和生成模型回查 [@goodfellow2016deep; @bishop2023deep; @bishop2006prml]，视觉任务回查 [@szeliski2022vision]，强化学习回查 [@sutton2018rl]。

##### 闭卷自测

- 能写 MLP、CNN、[[02-primer#Transformer self-attention|Transformer]] 的输入、输出、参数量和损失函数。

- 能推导 [[02-primer#反向传播|backprop]] 的链式法则形式，并说明复杂度为何与 forward 同阶。

- 能解释 sigmoid 饱和、ReLU 死亡、batch normalization 训练/测试统计量差异、residual connection 的梯度通路。

- 能区分逼近能力、优化可达性和泛化能力；不会把 universal approximation 当成泛化定理。

- 能按输出对象区分特征提取、图像恢复、三维重构、光流估计、识别和分割。

- 能写 autoencoder 重构目标和 contrastive learning/InfoNCE 的正负样本结构。

- 能说明隐式正则化、迁移学习和元学习分别回答什么问题。

- 能写 [[02-primer#Normalizing flow|normalizing flow 的 change-of-variables log-likelihood]]。

- 能写 [[02-primer#VAE|VAE ELBO]]、GAN minimax 目标、DDPM 或 [[02-primer#Diffusion 与 score|score-based diffusion]] 的核心训练信号。

- 能写 [[02-primer#MDP、return 与值函数|MDP 五元组]]、[[02-primer#Bellman 方程|Bellman 方程]]、[[02-primer#Q-learning|Q-learning 更新]]和 [[02-primer#Policy gradient 与 baseline|policy gradient theorem]]。

- 能说明 baseline 为什么不改变 [[02-primer#Policy gradient 与 baseline|policy gradient]] 的期望。

##### 生成模型比较模板

生成模型比较题优先按数学对象比较，而不是按"效果好不好"比较。

| 模型 | 优化对象 | 优势 | 主要风险 |
| --- | --- | --- | --- |
| Flow | [[02-primer#Normalizing flow|显式 likelihood 和 Jacobian determinant]] | 可精确求密度 | 可逆结构限制表达形式 |
| VAE | [[02-primer#VAE|ELBO、近似后验和先验匹配]] | 概率图清晰，可采样 | posterior collapse、样本模糊 |
| GAN | 生成器和判别器的 minimax game | 样本锐利 | 训练不稳定、mode collapse、无显式 likelihood |
| Diffusion | [[02-primer#Diffusion 与 score|多步去噪或 score matching]] | 训练稳定，质量高 | 采样成本高，依赖噪声日程 |

##### RL 推导模板

[[02-primer#MDP、return 与值函数|RL 题]]先定义状态 $s\in\mathcal{S}$、动作 $a\in\mathcal{A}$、策略 $\pi_\theta(a\mid s)$、奖励 $r(s,a)$ 和折扣因子 $\gamma\in[0,1)$。若问 value function，先写 [[02-primer#Bellman 方程|Bellman 分解]]；若问策略梯度，先写 [[02-primer#Policy gradient 与 baseline|trajectory likelihood 的 log-derivative trick]]。

$$
\nabla_\theta J(\theta)
  =
  \mathbb{E}_{\tau\sim\pi_\theta}
  \left[
    R(\tau)
    \sum_t
    \nabla_\theta\log \pi_\theta(a_t\mid s_t)
  \right].
$$

其中 $\tau$ 是轨迹，$R(\tau)$ 是轨迹回报。baseline $b(s_t)$ 可减方差，因为

$$
\mathbb{E}_{a_t\sim\pi_\theta(\cdot\mid s_t)}
  \left[
    b(s_t)\nabla_\theta\log \pi_\theta(a_t\mid s_t)
  \right]
  =
  b(s_t)\nabla_\theta
  \sum_{a_t}\pi_\theta(a_t\mid s_t)
  =
  0.
$$

##### 常见失分点

- 把 [[02-primer#反向传播|backprop]] 写成口号，不写 [[02-primer#反向传播|局部 Jacobian 或 adjoint 递推]]。

- 只说 Transformer 能并行，不说 。

- [[02-primer#VAE|VAE/ELBO]]、[[02-primer#Normalizing flow|flow likelihood]]、[[02-primer#Diffusion 与 score|diffusion score matching]] 混用符号。

- [[02-primer#MDP、return 与值函数|RL 题]]忘记说明策略、转移、奖励和折扣因子，导致 [[02-primer#Bellman 方程|Bellman 方程]]没有定义域。

- [[02-primer#LLM 偏好对齐|DPO/RLHF]] 题只背名称，不说明偏好数据、reference policy 或 KL regularization 的作用。

## 优化方法

**来源定位：** 本节对应考纲 Optimization Methods for AI。凸优化与一阶方法回查 [@nesterov2018convex; @beck2017first]，SGD 与学习理论接口回查 [@shalev2014uml]。

##### 闭卷自测

- 能写 [[02-primer#凸集、凸函数与一阶条件|凸集、凸函数]]、[[02-primer#Smoothness、强凸性与下降引理|$L$-smooth、$\mu$-strong convex]]、subdifferential、[[02-primer#Proximal operator 与复合优化|proximal operator]] 的定义。

- 能从 [[02-primer#凸集、凸函数与一阶条件|一阶条件]]推出凸函数全局最优性。

- 能写 Fermat rule $0\in\partial f(x^*)$、sum rule 和仿射复合规则。

- 能用 [[02-primer#Smoothness、强凸性与下降引理|descent lemma]] 推 GD 的下降不等式。

- 能用 [[02-primer#Smoothness、强凸性与下降引理|强凸性和光滑性]]得到梯度映射收缩或线性收敛。

- 能从 [[02-primer#Proximal operator 与复合优化|prox optimality]] 推 fixed point。

- 能用 [[02-primer#prox 最优性、单调性与非扩张|prox 非扩张]]推出 one-step inequality。

- 能在条件期望下展开 variance decomposition，识别零均值噪声的交叉项为零。

- 能解释常数步长 [[02-primer#GD、SGD 与随机坐标下降|SGD]] 的 noise floor，以及 minibatch/importance sampling 如何降低方差或 expected smoothness 常数。

- 能写 momentum、Nesterov acceleration、AdaGrad、Adam 的状态变量，并说明它们分别改变了哪一部分更新。

##### prox 题核心链条

若目标是

$$
\min_{x\in\mathbb{R}^d}
  F(x)=f(x)+R(x),
$$

其中 $f$ 光滑、$R$ 凸但可能不可微，[[02-primer#Proximal operator 与复合优化|proximal gradient]] 的一步是

$$
x_{k+1}
  =
  \operatorname{prox}_{\gamma R}(x_k-\gamma g_k),
$$

其中 $\gamma>0$ 是步长，$g_k$ 是梯度或随机梯度估计。最优点 $x^*$ 满足

$$
x^*
  =
  \operatorname{prox}_{\gamma R}(x^*-\gamma\nabla f(x^*)).
$$

考试推导一般沿着下面的链条，其中 prox 最优性与非扩张的完整证明回查 [[02-primer#prox 最优性、单调性与非扩张|第三章 prox 非扩张推导]]。

$$
\text{prox 最优性}
  \Longrightarrow
  \text{fixed point}
  \Longrightarrow
  \text{非扩张}
  \Longrightarrow
  \text{平方距离递推}
  \Longrightarrow
  \text{收敛率或噪声地板}.
$$

##### 常见失分点

- 把 [[02-primer#Smoothness、强凸性与下降引理|$L$-smooth 和 $\mu$-strong convex]] 的不等式方向写反。

- 只写 [[02-primer#Proximal operator 与复合优化|prox 定义]]，不写对应 [[02-primer#prox 最优性、单调性与非扩张|最优性条件]]。

- [[02-primer#GD、SGD 与随机坐标下降|随机梯度题]]不区分条件期望和全期望。

- 证明收敛率时漏掉 [[02-primer#Smoothness、强凸性与下降引理|强凸性]]提供的误差下界。

- Adam/AdaGrad 题只写名称，不写一阶矩、二阶矩或累积梯度变量。

## 自然语言处理

**来源定位：** 本节对应考纲 Natural Language Understanding。统计语言模型、embedding、Transformer、LLM 与 RAG 回查 [@jurafsky2026slp; @goldberg2017nnnlp; @vaswani2017attention; @kaplan2020scaling; @hoffmann2022training; @lewis2020rag; @rafailov2023dpo]。

##### 闭卷自测

- 能写 [[02-primer#统计语言模型|$n$-gram MLE]]、Markov 假设、backoff/interpolation smoothing 的基本形式。

- 能比较 GloVe、[[02-primer#Word2vec、GloVe 与 embedding|Skip-gram]]、Node2Vec、TransE 的数据信号、目标函数和归纳偏置。

- 能推 [[02-primer#Word2vec、GloVe 与 embedding|Word2vec skip-gram 或 negative sampling]] 目标，并解释 embedding 的语义来源。

- 能写 [[02-primer#Transformer self-attention|self-attention 的 $Q,K,V$ 公式]]，说明矩阵维度和 $1/\sqrt{d_k}$ 缩放。

- 能解释 causal mask、长上下文 attention mask、时间复杂度和显存复杂度。

- 能解释 top-$p$ 相比 greedy、beam、top-$k$ 的优势和风险。

- 能写 [[02-primer#LLM 预训练、指令微调与对齐|next-token pretraining、SFT]]、[[02-primer#LLM 偏好对齐|RLHF、DPO]] 的目标差异。

- 能说明 [[02-primer#Scaling Law|scaling law]] 的经验幂律形式和 compute-optimal trade-off。

- 能写 supervised LDA 或 [[02-primer#Embedding 知识库推理、RAG 与 MLN|MLN 的 joint/log-linear probability]]。

- 能把 [[02-primer#Embedding 知识库推理、RAG 与 MLN|RAG/memory 系统]]拆成写入、检索、重排、生成、引用校验和评估闭环。

##### attention 题最小答案

给输入 $X\in\mathbb{R}^{N\times d_{\mathrm{model}}}$，其中 $N$ 是 token 数，$d_{\mathrm{model}}$ 是隐藏维度。完整定义和缩放动机回查 [[02-primer#Transformer self-attention|Transformer self-attention]]。令

$$
Q=XW_Q,\qquad
  K=XW_K,\qquad
  V=XW_V.
$$

若 $Q,K\in\mathbb{R}^{N\times d_k}$，$V\in\mathbb{R}^{N\times d_v}$，则 scaled dot-product attention 为

$$
\operatorname{Attention}(Q,K,V)
  =
  \operatorname{softmax}\left(\frac{QK^\top}{\sqrt{d_k}}\right)V.
$$

这里 $QK^\top\in\mathbb{R}^{N\times N}$ 是 token 间相似度矩阵。除以 $\sqrt{d_k}$ 的 motivation 是让点积方差保持常数量级，避免 softmax 过早饱和 [@vaswani2017attention]。

##### RAG 系统题模板

[[02-primer#Embedding 知识库推理、RAG 与 MLN|RAG]] 题不要只写"加一个向量数据库"。最小可靠闭环是：

1.  写入：清洗文档，分块，记录来源、时间、权限和版本。

2.  检索：用 embedding 召回候选块，并保留 query rewriting 或 hybrid search 的接口。

3.  重排：用 cross-encoder、规则或多路信号筛掉噪声块。

4.  生成：把证据块和任务指令组织成 prompt，限制模型不得编造引用。

5.  校验：检查答案中的 claim 是否被检索证据支持。

6.  评估：分别看 recall、faithfulness、answer quality、latency 和 cost。

##### 常见失分点

- [[02-primer#统计语言模型|$n$-gram]] 题只写频率，不说明平滑解决 unseen events。

- [[02-primer#Word2vec、GloVe 与 embedding|Word2vec]] 题只说"相似词接近"，不写预测上下文或负采样目标。

- [[02-primer#Transformer self-attention|attention]] 题漏写矩阵维度，导致复杂度解释不可检查。

- [[02-primer#Scaling Law|Scaling law]] 题把经验规律写成严格定理，不说明数据、模型和 compute 的条件。

- [[02-primer#Embedding 知识库推理、RAG 与 MLN|RAG]] 题没有错误模式：检索失败、检索噪声、上下文污染、引用不忠实、权限泄漏。

## 三轮复习路线

##### 第一轮：理论闭包

目标是把第 [[02-primer|从零开始的理论预备]] 章读成可调用的公式库。每个小节结束时，用一张卡片写下四件事：问题 motivation、核心对象、推导入口、考试提醒。若某张卡片只能写出名词，说明还没有真正掌握。

| 阶段 | 任务 | 退出标准 |
| --- | --- | --- |
| T-21 至 T-15 | 通读第 [[02-primer|从零开始的理论预备]] 章，按四门课建立公式卡片 | 每门课至少能闭卷写出 8 个核心对象和 4 个推导入口 |
| T-14 至 T-8 | 重做三套公开卷，不看答案先写 skeleton | 每道题能定位到第 [[02-primer|从零开始的理论预备]] 章的具体概念链接或标记为新增 gap |
| T-7 至 T-3 | 只处理错题和 $0/1$ 自评项 | 每个错题都有原因标签和回写位置 |
| T-2 至 T-1 | 做一轮限时模拟和公式口述 | 不再新增大段理论，只修符号、边界条件和常见失分点 |

##### 第二轮：真题闭环

每道真题按以下结构重做：

1.  不看答案写题意定位：属于哪门课、哪类题型、调用第 [[02-primer|从零开始的理论预备]] 章哪个工具。

2.  写最小解题骨架：对象、假设、目标、关键不等式或目标函数。

3.  对照本书解答，标出缺失的推导步骤。

4.  把缺失步骤归类为概念缺口、代数缺口、符号缺口、时间管理缺口或题意误读。

5.  回写到第 [[02-primer|从零开始的理论预备]] 章 margin note 或自己的错题账。

##### 第三轮：压缩输出

最后一轮只训练可输出性。每门课准备一页纸，包含：

- 五个最可能考的对象定义；

- 三个最可能考的推导模板；

- 三个最容易犯的符号错误；

- 两个可迁移的系统设计框架；

- 一个遇到陌生题时的 fallback 策略。

## 错题账与增量生成路线

每个错题都要有原因标签。没有标签的错题只会变成"再看一遍答案"，不会形成增量。

| 标签 | 含义 | 增量动作 |
| --- | --- | --- |
| C0 | 官方考纲内，但第 [[02-primer|从零开始的理论预备]] 章没有讲清 | 补理论章：motivation、定义、推导、引用、考试提醒 |
| C1 | 理论章有，但真题中不会调用 | 在第七章或错题账加入调用模板和相邻真题链接 |
| C2 | 会公式但推导断裂 | 补中间代数步骤，标明每步使用的定理或假设 |
| C3 | 符号或维度错误 | 更新符号约定，加入维度表或变量定义句 |
| C4 | 新公开卷引入新主题 | 先新增 source，再决定补理论章、真题章还是附录 |
| C5 | 系统设计题输出不完整 | 加入 pipeline、failure modes、evaluation metrics 和 trade-offs |

增量生成时遵循最小改动原则：

1.  新增官方 PDF、网页链接和抽取文本，不覆盖旧卷。

2.  新增一个年份章节，保持"题意定位 + 解答 + 考试提醒"格式。

3.  若新题引入新知识点，优先补第 [[02-primer|从零开始的理论预备]] 章，而不是在解答里重复大段背景。

4.  若只是常见题型变化，优先补本章 checklist 或错题标签。

5.  每次修改后编译 PDF，检查页数、目录、引用、日志和 PDF 文本抽取。

6.  对有歧义题目，保留严格数学结论与考试语境解读，避免把猜测写成定理。

## 考前四十八小时

最后两天不适合大规模学习新材料，只做可控修补。

- 重新写一遍六个骨架：[[02-primer#VC 维、增长函数与 Sauer 引理|PAC/VC]]、[[02-primer#Proximal operator 与复合优化|prox]]-[[02-primer#GD、SGD 与随机坐标下降|SGD]]、[[02-primer#Diffusion 与 score|diffusion]]/[[02-primer#VAE|ELBO]]、[[02-primer#Policy gradient 与 baseline|policy gradient]]、[[02-primer#Transformer self-attention|self-attention]]、[[02-primer#Embedding 知识库推理、RAG 与 MLN|RAG/MLN]]。

- 每门课各挑一道错题限时重做，超过十五分钟仍无骨架就回看第 [[02-primer|从零开始的理论预备]] 章对应小节。

- 检查所有常用符号：样本量 $m$、维度 $d$、序列长度 $N$、假设类 $\mathcal{H}$、分布 $\mathcal{D}$、参数 $\theta$。

- 练习把"我知道"改写成"我能证明"：每个结论至少说出一个假设和一个推导入口。

- 系统题只记模板：输入、模块、目标函数或 scoring、failure modes、evaluation。

**考点。** 第七章的通过标准不是"看完"，而是能在闭卷状态下把任意 checklist 条目展开成一个可评分答案。若只能说概念名，回第 [[02-primer|从零开始的理论预备]] 章；若会理论但不会套题，回第 [[03-2025-spring|2025 春季 QE-AI 真题解答]]--[[05-2026-spring|2026 春季 QE-AI 真题解答]] 章；若同类题反复错，按 C0--C5 标签增量修书。

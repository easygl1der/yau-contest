# 指定教材章节导览

### Understanding Machine Learning: From Theory to Algorithms

[@shalev2014uml] 是本课程从学习问题形式化到可学习性证明的主线教材。尤其应把第 2--7 章连成 ERM--PAC--uniform convergence--VC--SRM 的证明链。

| 原书章节群                              | 讲什么                                       | 对应考纲/考点                            |
| ---------------------------------- | ----------------------------------------- | ---------------------------------- |
| 第 1--2 章：学习问题与 ERM                 | 统计学习框架、经验风险、过拟合、归纳偏置、有限假设类。               | 监督学习、经验/真实风险。                      |
| 第 3--4 章：PAC 与 uniform convergence | realizable/agnostic PAC、样本复杂度，以及有限类的泛化保证。 | PAC 定义、Hoeffding/union bound 证明套路。 |
| 第 5--7 章：No-Free-Lunch、VC 与模型选择    | 误差分解、VC 维、Sauer 引理、基本学习定理、SRM 与 MDL。      | VC/Sauer、偏差--方差、模型选择。              |
| 第 8--14 章：可计算学习与算法例子               | ERM 的计算复杂度、半空间、线性回归、正则化、核方法、决策树和最近邻。      | 回归、SVM/核、树、$k$-NN。                 |

### Foundations of Machine Learning, 2nd ed.

[@mohri2018foundations] 提供更偏理论和算法的补充视角；对于 Rademacher complexity、margin、kernel 和 online learning，它比前书更适合作为证明细节的回查来源。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--2 章：学习任务与 PAC | 学习阶段、泛化、有限假设集的可实现/不可实现保证、噪声与 Bayes error。 | PAC 框架与统计假设。 |
| 第 3--4 章：复杂度与模型选择 | Rademacher complexity、growth function、VC 维下界、ERM/SRM、交叉验证、正则化和 surrogate loss。 | VC 泛化界、模型选择。 |
| 第 5--6 章：margin 与核 | 线性分类、support vector、对偶问题、margin theory、RKHS、representer theorem、sequence kernel。 | SVM、kernel trick、正定性。 |
| 第 7 章以后：boosting 与在线学习 | AdaBoost、$\ell_1$ 正则、专家建议、mistake/regret 类保证及后续学习算法专题。 | 了解泛化保证如何连接算法。 |

### Deep Learning

[@goodfellow2016deep] 的三部分结构依次给出数学与 ML 基础、深度网络训练、表示与生成模型，是神经网络、优化和生成模型的统一参考。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--5 章：基础 | 线性代数、概率/信息论、数值计算、容量与泛化、MLE/MAP、SGD。 | 损失、梯度、泛化、概率建模。 |
| 第 6--8 章：深网络与训练 | 前馈网络、反向传播、正则化、优化、初始化、batch normalization。 | MLP、训练方法、稳定性。 |
| 第 9--12 章：结构与实践 | CNN、序列模型、practical methodology、应用。 | 视觉特征、序列/注意力的前置知识。 |
| 第 13--20 章：表示和生成 | 自编码器、结构化概率模型、Monte Carlo、近似推断、深度生成模型。 | 表征学习、VAE/GAN/flow 的理论背景。 |

### Deep Learning: Foundations and Concepts

[@bishop2023deep] 以概率建模贯穿回归、分类、深网络、视觉、Transformer 与生成模型；其第 17--20 章尤其适合对照大纲中的视觉生成模型。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--5 章：概率与单层网络 | 深度学习概览、概率/信息论、分布、线性回归、判别/生成分类。 | 似然、交叉熵、回归/分类基础。 |
| 第 6--9 章：深网络训练 | 多层网络、gradient descent、backpropagation、正则化与 residual connection。 | 网络训练、泛化与归纳偏置。 |
| 第 10--13 章：视觉、序列和 Transformer | CNN、检测/分割/风格迁移、图模型和序列、attention/Transformer、图网络。 | 视觉任务、Transformer 实现。 |
| 第 14--20 章：采样和生成 | MCMC、离散/连续隐变量、GAN、normalizing flow、autoencoder/VAE、diffusion/score matching。 | 生成模型的目标、ELBO、采样。 |

### Pattern Recognition and Machine Learning

[@bishop2006prml] 的目录从概率分布、线性模型扩展到图模型与近似推断；它是把概率模型、优化目标和推断算法连起来的经典参考。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--2 章：概率与决策 | 曲线拟合、Bayes 决策、信息论、指数族、非参数密度和最近邻。 | 概率建模、模型选择。 |
| 第 3--4 章：线性回归和分类 | 最小二乘、bias--variance、Bayesian regression、logistic regression、Laplace approximation。 | 回归、逻辑回归、泛化。 |
| 第 5--7 章：神经网络与核 | 反向传播、正则化、CNN、Gaussian process、SVM/RVM。 | MLP、核方法、margin。 |
| 第 8--14 章：概率图模型与推断 | 图模型、EM、mixture、变分推断、sampling、序列模型、模型组合。 | 隐变量、EM、推断和生成建模。 |

### Computer Vision: Algorithms and Applications, 2nd ed.

[@szeliski2022vision] 是视觉任务的结构化目录：每一类任务都可按输入、几何/统计假设、输出以及评价指标复述。当前本库保留作者官方访问入口；表中目录按该版正式目录归并。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 导论与成像 | 相机/图像形成、颜色、几何变换和视觉系统的基本假设。 | 视觉问题的输入、坐标和观测模型。 |
| 特征、匹配与对齐 | 特征检测/描述、匹配、鲁棒估计、image alignment。 | 特征提取、配准、恢复。 |
| 三维和运动 | 多视几何、structure from motion、dense motion/optical flow。 | 三维重构、光流估计。 |
| 分割、识别和计算摄影 | 图像分割、目标/场景识别、深度视觉、computational photography。 | 识别、分割及评价指标。 |

### Lectures on Convex Optimization

[@nesterov2018convex] 强调凸优化的几何、复杂度和一阶方法；与真题相连时，应优先抓住光滑/强凸不等式、oracle 模型与收敛率之间的逻辑。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 凸分析基础 | 凸集/凸函数、次梯度、分离与最优性条件。 | 凸性判别、次微分。 |
| 复杂度与 oracle | 一阶 oracle、下界与不同函数类的可达到复杂度。 | 为什么要区分 smooth/strongly convex。 |
| 一阶与加速方法 | gradient、accelerated gradient、mirror/prox 思想及收敛率。 | GD、动量/Nesterov 加速。 |
| 约束与随机专题 | 约束处理、随机梯度和大规模优化的理论视角。 | SGD、随机/自适应优化的边界。 |

### First-Order Methods in Optimization

[@beck2017first] 的前六章给出本课程最常用的分析语言；第 8--15 章再把这些语言落实到 projected/subgradient、mirror、proximal、block、Frank--Wolfe 和 ADMM。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--4 章：凸分析工具箱 | 向量空间、凸函数、subgradient、共轭函数和 Fenchel duality。 | 凸集/函数、次微分及性质。 |
| 第 5--6 章：光滑性与 proximal | descent lemma、strong convexity、prox、Moreau envelope/decomposition。 | GD 收敛、复合优化。 |
| 第 8--10 章：一阶核心算法 | projected/stochastic subgradient、mirror descent、proximal gradient、FISTA。 | SGD、随机坐标、动量加速。 |
| 第 11--15 章：分块与分裂 | block proximal gradient、dual proximal、conditional gradient、alternating minimization、ADMM。 | 大规模优化的算法比较。 |

### Speech and Language Processing

[@jurafsky2026slp] 覆盖从统计 NLP 到现代大模型系统；针对本考纲，优先顺着"语言模型--embedding--Transformer--对齐/检索"的主线阅读。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--5 章：统计 NLP 基础 | 文本规范化、edit distance、$n$-gram、smoothing、Naive Bayes、logistic regression。 | 统计建模假设、MLE/smoothing。 |
| 第 6--10 章：向量和序列网络 | word vectors、神经语言模型、序列标注、RNN/LSTM 与 encoder--decoder。 | Word2vec、表示学习。 |
| Transformer 与大模型章节群 | attention、Transformer LM、预训练、instruction/alignment、评估和风险。 | self-attention、预训练对齐。 |
| 语义、检索、对话与语音章节群 | 信息抽取、问答、dialogue、speech recognition/TTS 及应用系统。 | embedding 知识库、RAG 的任务背景。 |

### Neural Network Methods in Natural Language Processing

[@goldberg2017nnnlp] 是神经 NLP 的紧凑实现导向教材：从线性分类和计算图出发，逐步推到 embedding、CNN、RNN、attention 和条件生成。

| 原书章节群 | 讲什么 | 对应考纲/考点 |
| --- | --- | --- |
| 第 1--2 章：任务和线性模型 | NLP 的离散结构、监督分类、one-hot/dense representation、损失、正则和 SGD。 | 统计假设、训练目标。 |
| 第 3--5 章：MLP 与训练 | 非线性、前馈网络、embedding layer、computation graph、backprop、初始化和梯度问题。 | 神经网络实现、反向传播。 |
| 第 6--10 章：文本表示与序列 | 特征到输入、language model、pretrained embeddings、CNN n-gram detector、RNN。 | Word2vec、序列建模。 |
| 第 11--21 章：条件生成与结构 | encoder--decoder、attention、recursive network、multi-task/semi-supervised learning。 | attention、迁移和系统设计。 |

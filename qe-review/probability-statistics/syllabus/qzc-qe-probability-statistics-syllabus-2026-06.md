# Probability & Statistics

> Qiuzhen College, Tsinghua University  
> 清华大学 求真书院  
> Source: `qzc-qe-probability-statistics-syllabus-2026-06.pdf`（视觉转写；原稿中红色强调项已标注）

## Syllabus

### Probability

- Random variable, Expectation, Independence
- Variance and covariance, correlation, moment
- Various distribution functions
- Multivariate distribution
- Characteristic function, Generating function
- Various modes of convergence of random variables
- Bayes formula, Conditional probability
- Conditional expectation given a sigma-algebra
- Laws of large numbers
- Central limit theorems
- Martingales
- Markov chains
- Basic properties of Poisson processes
- Basic properties of Brownian motion
- Basic properties of random walks

### Statistics

- Distribution Theory. Families of continuous distributions: normal, chi-sq, t, F, gamma, beta; Families of discrete distributions: multinomial, Poisson, negative binomial; Exponential Families; Distributions of functions of a Random Variable.
- Properties of a Random Sample: order statistics, sample mean, variance, median and quantiles; the Delta Method.
- Data Reduction: sufficient statistics, minimal sufficient statistics, ancillary statistics, complete statistics, Basu’s Theorem.
- Estimation: Parameter estimation, method of moments, maximum likelihood estimation, criteria for evaluation of estimators, Fisher information and its use, confidence interval.
- Testing: Null and alternative hypotheses, simple and composite hypotheses, type I and type II errors, power, uniformly most powerful test, likelihood ratio test, Neyman-Pearson Lemma, Karlin-Rubin Theorem, generalized likelihood ratio test.
- Bayesian Statistics: Prior, posterior, conjugate priors, Bayesian estimator.
- Large sample properties: Consistency, asymptotic normality, chi-sq approximation to likelihood ratio statistic.
- <span style="color:#ee0000">Linear model theory: least squares estimation, estimability, Gauss-Markov, inference on parameters (point and interval estimations and testing), prediction, confidence region and simultaneous confidence intervals, model comparison and selection, and goodness of fitness test under normal errors.</span>

### Written examination

（原卷此处留空）

### Reference

1. Rick Durrett: Probability: Theory and Examples, Cambridge University Press, 2010.
2. Kai-Lai Chung: A Course in Probability Theory, New York, 1968.
3. G. Casella and R.L. Berger: Statistical Inference (2nd Ed.), Duxbury Press, 2002.
4. 茆诗松，程依明，濮晓龙: 概率论与数理统计教程（第二版），高等教育出版社，2008.
5. 陈家鼎，孙山泽，李东风，刘力平: 数理统计学讲义，高等教育出版社，2006.
6. 郑明，陈子毅，汪嘉冈: 数理统计讲义，复旦大学出版社，2006.
7. 陈希孺，倪国熙: 数理统计学教程，中国科学技术大学出版社，2009.
8. <span style="color:#ee0000">吴密霞、王松桂：线性模型引论（第二版），科学出版社，2024.</span>

## 个人标注：不太熟悉、需要学习

以下条目目前较生疏，复习时应优先补学：

**Probability**

- Martingales（Galton–Watson 均值鞅 \(Z_n/m^n\) 在 Durrett 4.1 \S5.3.4。）
- Markov chains（含 Galton–Watson 世代计数；灭绝概率见 Durrett 4.1 Theorem~5.3.9。工作教材 Brzeźniak–Zastawniak 无独立分枝过程章节。）
- Basic properties of Poisson processes
- Basic properties of Brownian motion（工作教材：Brzeźniak–Zastawniak, *Basic Stochastic Processes*, Springer SUMS 1999，黄封面；中文影印书名《随机过程基础》。本地 PDF + MinerU 转录：`qe-review/probability-statistics/reference/brzezniak-zastawniak-basic-stochastic-processes/`。QE 大纲书仍是 Durrett Ch.~8。）
- Basic properties of random walks

**Statistics**

- Testing: Null and alternative hypotheses, simple and composite hypotheses, type I and type II errors, power, uniformly most powerful test, likelihood ratio test, Neyman-Pearson Lemma, Karlin-Rubin Theorem, generalized likelihood ratio test.
- Bayesian Statistics: Prior, posterior, conjugate priors, Bayesian estimator.
- 工作教材：Hogg, McKean, Craig, *Introduction to Mathematical Statistics* (8th ed., Pearson 2019)。本地包：[`reference/hogg-mckean-craig-ims`](../reference/hogg-mckean-craig-ims/structure.md)。QE 大纲书仍是 Casella–Berger / 茆诗松等；Hogg 覆盖大纲 Statistics 的主体，Bayesian 在 Hogg Ch. 11（尚无 aca-reader 讲义）。
- 丘赛 / final 备考笔记（`~/Downloads/`）：[`reference/yau-final-prep`](../reference/yau-final-prep/README.md)。`yau-stat.pdf` Ch. 5 是 Bayes 步骤（Def. 5.1 / 5.4，Thm. 5.5：\(L_1\) → 后验中位数）；`stat-final.pdf` 只覆盖 Hogg Ch. 1–9，没有 Ch. 11；minimax 不在这套笔记里，看 Hogg §7.1。
- 贝叶斯核心教材：Gelman, Carlin, Stern, Dunson, Vehtari, Rubin, *Bayesian Data Analysis* (3rd ed., CRC 2013)。本地包：[`reference/gelman-bda3`](../reference/gelman-bda3/structure.md)（PDF + MinerU 分章 + aca-reader 讲义 Ch. 0–23）。QE 用 Ch. 1 后验 / Ch. 2 共轭 / Ch. 9 决策（\(L_1\) → 后验中位数）。频率派 risk / minimax 仍看 Hogg Ch. 7，不是 BDA 的主线。


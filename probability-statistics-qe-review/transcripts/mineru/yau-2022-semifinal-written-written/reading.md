# S.-T. Yau College Student Mathematics Contests 2022

# Probability and Statistics

Solve every problem.

Problem 1. Let $\{X_{n}\}$ be a sequence of Gaussian random variables. Suppose that ?? is a random variable such that $X_{n}$ converges to ?? in distribution as $n \infty$ . Show that ?? is also a (possibly degenerate, i.e., variance zero) Gaussian random variable.

Problem 2. For two probability measures $\mu$ and ?? on the real line ??, the total variation distance $\| \mu - \nu \|_{TV}$ is defined as

$$
\| \mu - \nu \|_{TV} = \sup \left\{\mu(C) - \nu(C): C \in \mathcal{B}(\mathbb{R}) \right\},
$$

where $\mathcal B({\bf R})$ is the ??-algebra of Borel sets on ??. Let $\mathcal{C}(\mu, \nu)$ be the space of couplings of the probability measures $\mu$ and ??, i.e., the space of $\mathbb{R}^{2}$ valued random variables $(X, Y)$ defined on some (not necessarily same) probability space $(\varOmega, \mathcal{F}, \mathbb{P})$ such that the marginal distributions of ?? and ?? are $\mu$ and $\nu,$ respectively. Show that

$$
\| \mu - \nu \|_{TV} = \inf \{\mathbb{P}(X \neq Y):(X, Y) \in \mathcal{C}(\mu, \nu)\}.
$$

For simplicity you may assume that $\mu$ and ?? are absolutely continuous with respect to the Lebesgue measure on ??.

Problem 3. We throw a fair die repeatedly and independently. Let $\tau_{11}$ be the first time the pattern 11 (two consecutive 1’s) appears and $\tau_{12}$ the first time the pattern 12 (1 followed by 2) appears.

(a) Calculate the expected value $\mathbb{E} \tau_{11}$

(b) Which is larger, $\mathbb{E} \tau_{11}$ or $\mathbb{E} \tau_{12} ?$ It is sufficient to give an intuitive argument to justify your answer. You can also calculate $\mathbb{E} \tau_{12}$ if you wish.

Problem 4. Let $\{X_{n}\}$ be a Markov chain on a discrete state space $s$ with transition function $p(x, y), x, y \in S.$ Suppose that there is a state $y_{0} \in S$ and a positive number $\boldsymbol{\theta}$ such that $p(x, y_{0}) \ge \theta$ for all $x \in S.$

(a) Show that is a positive constant $\lambda < 1$ such that for any two initial distribution $\mu$ and $\nu,$

$$
\sum_{y \in S} \left| \mathbb{P}_{\mu} \{X_{1} = y\} - \mathbb{P}_{\nu} \{X_{1} = y\} \right| \leq \lambda \sum_{y \in S} | \mu(y) - \nu(y) |.
$$

(b) Show that the Markov chain has a unique stationary distribution ?? and

$$
\sum_{y \in S} \left| \mathbb{P}_{\mu} \{X_{n} = y\} - \pi(y) \right| \leq 2 \lambda^{n}.
$$

Problem 5. Consider a linear regression model with ?? predictors and ?? observations:

$$
\mathbf{Y} = X \boldsymbol{\beta} + \mathbf{e},
$$

where $X_{n \times p}$ is the design matrix, $\beta$ is the unknown coefficient vector, and the random error vector ?? has a multivariate normal distribution with mean zero and $\operatorname{Var}(\mathbf{e}) = \sigma^{2} I_{n} \left(\sigma^{2} > 0 \right.$ unknown and $I_{n}$ is the identity matrix).

Here ran $\u \b \mathrm{\mathfrak{s}}(X) = \boldsymbol{k} \leq \boldsymbol{p}, \boldsymbol{p}$ may or may not be greater than ??, but we assume $n - k > 1$ . Let $\mathbf{x}_{1} =(x_{1, 1}, \hdots, x_{1, p})$ be the first row of ?? and define

$$
\gamma = \frac{\mathbf{x}_{1} \beta}{\sigma}.
$$

Find the uniformly minimum variance unbiased estimator (UMVUE) of ?? or prove it does not exist.

Problem 6. Let $X_{1}, \dots, X_{2022}$ be independent random variables with $X_{i} \sim \N(\ \theta_{i}, i^{2}), 1 \leq i \leq 2022$ . For estimating the unknown mean vector $\theta \in \mathbb{R}^{2022}$ , consider the loss function $\begin{array}{r}{L(\boldsymbol{\theta}, \mathbf{d}) = \sum_{i = 1}^{2022}(d_{i} - \theta_{i})^{2} / i^{2}} \end{array}$ Prove that $\mathbf{X} =$ $(X_{1}, \dots, X_{2022})$ is a minimax estimator of ??.

Recall: $\begin{array}{rl}{IfY | \mu} &{\sim N(\mu, \sigma^{2}) and \mu \sim ~ N(\mu_{0}, \sigma_{0}^{2}) then \mu | Y = y \sim N \Big(\frac{\mu_{0} / \sigma_{0}^{2} + y / \sigma^{2}}{1 / \sigma_{0}^{2} + 1 / \sigma^{2}}, \frac{1}{1 / \sigma_{0}^{2} + 1 / \sigma^{2}} \Big).} \end{array}$
# 2024 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2024-semifinal-written-written.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2024-semifinal-written-written/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

## S.-T. Yau College Student Mathematics Contests 2024

## Probability and Statistics

## Question 1

^yau-2024-semifinal-written-written-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md#^yau-2024-semifinal-written-written-s1).

There are r players, with player i initially having $n_{i}$ units, $n_{i} > 0, i =$ $1, \ldots, r$ At each stage, two of the players are chosen to play a game, with the winner of the game receiving 1 unit from the loser. Any player whose fortune drops to 0 is eliminated, and this continues until a single player has all $\textstyle n = \sum_{i = 1}^{r} n_{i}$ units, with that player designated as the winner. Note that the mechanism to choose two players at each stage is unknown. It can be either deterministic or random. Assume that the results of successive games are independent and that each game is equally likely to be won by either of its two players.

For any set of players $S \subseteq \{1, \ldots, r\}$ , let $X(S)$ denote the number of games involving only members of S. Does $E(X(S))$ ) depend on the player selection mechanism? If you think it doesn’t depend, calculate the expectation. If you think it depends, give two mechanisms leading to diferent expectations.

## Question 2

^yau-2024-semifinal-written-written-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md#^yau-2024-semifinal-written-written-s2).

Let $X_{1}, X_{2},...$ . be independent Bernoulli random variables satisfying $P(X_{i} =$ $1) \ = \p$ and $P(X_{i} = - 1) = q = 1 - p$ for some $p \in \mathsf{\Gamma}(0, 1)$ . Let $S_{n} ~ =$ $X_{1} + \ldots + X_{n}$ and $M = \operatorname{sup}_{n \geq 1}(S_{n} / n)$

(a) Calculate $P(M = 0)$

(b) Show that $P(p - q < M \leq 1) = 1$ . For any rational number $x \in$ $(p - q, 1].$ , is $P(M = x) > 0 ?$ If so, prove it. If not, find a point with zero probability.

## Question 3

^yau-2024-semifinal-written-written-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md#^yau-2024-semifinal-written-written-s3).

Let X have a uniform distribution on the interval [0,1] and let $N_{m, k}$ be the digit in the mth place to the right of the decimal point in $X^{k}$

(a) Find lim $\boldsymbol{\mathrm{1}}_{m \to \infty} \mathbb{P}(N_{m, m} = i)$ for $i = 0, 1, 2, \ldots, 9.$

(b) Let $k(m)$ be a function of $m_{;}$ , taking values greater than 1. Find a necessary and suficient condition on $k(m)$ such that lim ${\L}_{\cdot m \to \infty} P(N_{m, k(m)} =$ $\begin{array}{r}{i) = \frac{1}{10} \mathrm{~ for ~} i = 0, 1, 2, \dotsc, 9.} \end{array}$

## Question 4

^yau-2024-semifinal-written-written-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md#^yau-2024-semifinal-written-written-s4).

Assume we have n observations: $(Y_{i}, \pmb{x}_{i})$ $i = 1, \ldots, n.$ , where $Y_{i}$ is the random response and $\pmb{x}_{i} =(x_{i1}, \cdots, x_{ip})^{T}$ is a vector of $p$ fixed covariates for the ith observation. Denote $\beta =(\beta_{1}, \cdots, \beta_{p})$ be a unknown p-length vector of regression coeficients. Let $\begin{array}{r}{\theta_{i} = \sum_{i = 1}^{p} \bar{x}_{ij} \beta_{j}, \mu_{i} = E(Y_{i})} \end{array}$ and $\sigma_{i}^{2} =$ $Var(Y_{i})$ . Assume the density of $Y_{i}$ belongs to the following exponential family:

$$
f(y_{i}; \theta_{i}) = \exp \{\theta_{i} y_{i} - b(\theta_{i})\},\tag{1}
$$

where $b^{\prime}(\theta_{i}) = \mu_{i}, \b^{\prime \prime}(\theta_{i}) = \sigma_{i}^{2}$ . Suppose that all $\theta_{i}$ ’s are contained in a compact subset of a space Θ. Let $\ell_{n}(\beta)$ be the log-likelihood function of the data, and let $\begin{array}{r}{H_{n}(\beta) = - \frac{\partial^{2} \ell_{n}(\beta)}{\partial \beta \partial \beta^{T}}} \end{array}$

Let X be the set of all $p$ covariates under consideration. Let $\alpha_{0} \subset{\mathcal{X}}$ be the subset that contains and only contains all the important covariates afecting $\mathrm{Y}$ (the corresponding $\beta_{j} \mathrm{^{*} s}$ are nonzero). Let $\alpha$ be any subset of $\mathcal{X}.$ , and let $\beta(\alpha)$ be the vector of the components in $\beta$ that correspond to the covariates in $\alpha.$ . Let $A = \{\alpha : \alpha_{0} \subset \alpha\}$ be the collection of models that including all important covariates. We assume:

(I) There exist positive constants $C_{1}, C_{2}$ such that for all suficiently large $n_{\mathrm{:}}$

$$
C_{1} < \lambda_{\min} \Bigl \{\frac{1}{n} H_{n}(\boldsymbol{\beta}) \Bigr\} < \lambda_{\max} \Bigl \{\frac{1}{n} H_{n}(\boldsymbol{\beta}) \Bigr\} < C_{2},
$$

where $\lambda_{\mathrm{min}} \Big \{{\textstyle \frac{1}{n}} H_{n}(\beta) \Big\}$ and $\begin{array}{r}{\lambda_{\operatorname{max}} \bigg \{\frac{1}{n} H_{n}(\beta) \bigg\}} \end{array}$ are the smallest and largest eigenvalues of $\textstyle{\frac{1}{n}} H_{n}({\dot{\boldsymbol{\beta}}})$ .

(II) For any given $\epsilon > 0$ , there exists a constant $\delta > 0$ such that, when n is suficiently large,

$$
(1 - \epsilon) H_{n}(\boldsymbol{\beta}(\alpha)) \leq H_{n}(\tilde{\boldsymbol{\beta}}) \leq(1 + \epsilon) H_{n}(\boldsymbol{\beta}(\alpha))
$$

for all $\alpha \in A$ and $\tilde{\beta}$ satisfying $\|{\tilde{\beta}} - \beta(\alpha) \| \leq \delta.$

For any model $\alpha,$ let $\hat{\boldsymbol{\beta}}_{\alpha}$ be the MLE of $\beta(\alpha)$ based on this model. Show that

$$
\max_{\alpha \in A} \| \hat{\boldsymbol{\beta}}_{\alpha} - \boldsymbol{\beta}(\alpha) \| = O_{p}(n^{- 1 / 3}).
$$

## Question 5

^yau-2024-semifinal-written-written-q5

> Corresponding solution: [Reference solution for Question 5](../../solutions/yau/yau-2024-semifinal-written-written-solutions.md#^yau-2024-semifinal-written-written-s5).

Consider a random sample of size $n,$ and write the data as an $\boldsymbol{r} = \boldsymbol{r}_{n}$ by $c = c_{n}$ matrix, $\{X_{ij} : i = 1, \ldots, r_{n}; j = 1, \ldots, c_{n}\}$ with $\boldsymbol{n} = \boldsymbol{r}_{n} \boldsymbol{c}_{n}$ . To specify notation, $\{X_{ij}\}$ are i.i.d. with c.d.f. $F(x)$ and continuous density $f(x)$ ). Let $\beta$ denote the median, i.e., $F(\beta) = 0.5$ . Define an estimator by

$$
\hat{\beta}_{n} = \min_{j} \left\{\max_{i} \{X_{ij}\} \right\}.
$$

(a) What is the condition on $r_{n}$ when $n \to \infty$ for median-unbiasedness, $\mathrm{i.e., ~} \beta$ is also the median for the distribution of ${\hat{\beta}}_{n} ?$

(b) We further assume $F$ is diferentiable in an open neighborhood of $\beta$ and has a positive derivative at $\beta.$ . For $r_{n}$ in $\mathrm{(a)}$ , show that $r_{n}({\hat{\beta}}_{n} - \beta)$ converges in distribution, and find the limiting distribution function.

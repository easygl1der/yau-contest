# 2026 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2026-semifinal-written-written.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2026-semifinal-written-written/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.


## Question 1

^yau-2026-semifinal-written-written-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s1).

A copula is a multivariate cumulative distribution function with uniform marginals on [0, 1]. By Sklar’s Theorem, any joint distribution can be decomposed into its marginal distributions and a copula that captures the dependence structure between variables. That is, for random variables U and V with marginal CDFs $F_{U}$ and $F_{V}$ , their joint CDF can be written as $H(u, v) = C \{F_{U}(u), F_{V}(v)\}$ for some copula C. The copula parameter $\rho$ indexes the strength and shape of dependence, independently of the marginals.

Let $Y_{a} \in \{0, 1, \ldots, L - 1\}$ be an ordinal outcome observed in treatment group $a \in \{0, 1\}$

(1). Define $\psi = \mathrm{Pr}(Y_{1} > Y_{0})$ as the probability that the outcome in the treatment group exceeds that in the control group. Suppose the joint CDF satisfies $\operatorname{Pr}(Y_{1} \leq k, Y_{0} \leq j) = C \{F_{1}(k), F_{0}(j)\}$ with the convention $F _ { a } ( - 1 ) = 0 \mathrm { { } } $ , where $C$ is a pre-specified copula. Derive a closed-form expression for $\psi$ in terms of $C, F_{1}$ , and $F_{0}$

(2). Suppose $Y_{a}$ arises from a latent continuous variable $Y_{a}^{*}$ through the threshold model

$$
Y_{a}^{*} = \mu_{a} + \varepsilon_{a}, \quad Y_{a} = \ell \iff \tau_{\ell - 1} < Y_{a}^{*} \leq \tau_{\ell},
$$

with shared thresholds $- \infty = \tau_{- 1} < \tau_{0} < \cdot \cdot \cdot < \tau_{L - 2} < \tau_{L - 1} = + \infty$ and $\mu_{a}$ a constant for group a. Also, suppose the joint distribution of the latent residuals satisfies

$$
\operatorname{Pr}(\varepsilon_{1} \leq e_{1}, \varepsilon_{0} \leq e_{0}) = C \{F_{\varepsilon_{1}}(e_{1}), F_{\varepsilon_{0}}(e_{0})\},
$$

where $C$ is a pre-specified copula and $F_{\varepsilon_{a}}(e) = \operatorname{Pr}(\varepsilon_{a} \leq e)$ . Prove that this implies

$$
\operatorname{Pr}(Y_{1} \leq k, Y_{0} \leq j) = C \{F_{1}(k), F_{0}(j)\}.
$$

## Question 2

^yau-2026-semifinal-written-written-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s2).

Consider the partitioned linear regression model

$$
Y = X_{1} \beta_{1} + X_{2} \beta_{2} + \varepsilon,
$$

where $Y \in \mathbb{R}^{n}, X_{1} \in \mathbb{R}^{n \times k_{1}}, X_{2} \in \mathbb{R}^{n \times k_{2}}, k_{1}, k_{2} \geq 1$ , and $[X_{1} \X_{2}]$ have full column rank. Define the annihilator matrix

$$
M_{1} = I_{n} - X_{1}(X_{1}^{\top} X_{1})^{- 1} X_{1}^{\top},
$$

which projects onto the orthogonal complement of the column space of $X_{1}$ . Recall that for a generic regression of a response $\tilde{Y}$ on a predictor matrix $\tilde{X}$ with full column rank, the OLS estimator is

$$
\hat{\beta} =(\tilde{X}^{\top} \tilde{X})^{- 1} \tilde{X}^{\top} \tilde{Y}.
$$

Prove: the OLS estimator ${\hat{\beta}}_{2}$ obtained from the full regression of Y on $[X_{1} \X_{2}]$ is identical to the OLS estimator obtained from regressing $M_{1} Y$ on $M_{1} X_{2}$

## Question 3

^yau-2026-semifinal-written-written-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s3).

Let $\phi$ and Φ be the density and distribution functions of the standard normal, and $a > 0$ is a constant.

(a) Show that $f(x) = 2 \phi(x) \Phi(ax)$ is the density of some random variable (denoted by Y ).

(b) Calculate <sup>E</sup>(Y ).

## Question 4

^yau-2026-semifinal-written-written-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s4).

Let $\{B_{t}, t \ge 0\}$ be a standard Brownian motion. For $a > 0$ , define the first exit time from the interval $(- a, a)$ :

$$
\tau_{a} = \inf \{t \geq 0: | B_{t} | = a\}.
$$

Compute $\mathbb{E}[\tau_{a}^{2}]$

## Question 5

^yau-2026-semifinal-written-written-q5

> Corresponding solution: [Reference solution for Question 5](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s5).

Let $X_{1}, X_{2},...$ . be i.i.d. random variables. Suppose that for some integer $n \geq 2$ , there exist constants $a > 0$ and $b \in \mathbb{R}$ such that

$$
X_{1} + \dots + X_{n} \stackrel{d}{=} aX_{1} + b.\tag{U1}
$$

Let $\begin{array}{r}{\alpha = \frac{\ln n}{\ln a}} \end{array}$

(a). Prove: In the case $\alpha = 1$ and $b = 0$ , the characteristic function of $X_{k}$ is

$$
\phi(t) = \exp \{i \mu t - \gamma | t |\}.
$$

(b). Prove: If we additionally assume $\mathbb{E} | X_{1} | < \infty$ , prove that excluding the degenerate case, it is impossible to satisfy (U1) and $\alpha \leq 1$

## Question 6

^yau-2026-semifinal-written-written-q6

> Corresponding solution: [Reference solution for Question 6](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s6).

Let $\xi$ and $\eta$ be independent random variables. If the sum $S = \xi + \eta$ and the diference $D = \xi - \eta$ are also independent, then $\xi$ and $\eta$ must follow normal distributions.

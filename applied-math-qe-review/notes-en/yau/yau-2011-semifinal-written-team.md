# 2011 Yau Mathematical Contest Semifinal Written Examination team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2011-semifinal-written-team.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2011-semifinal-written-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

# Applied Math., Computational Math., Probability and Statistics

Team 9:00–12:00 am, July 9, 2011 (Please select 5 problems to solve)

## Problem 1

^yau-2011-semifinal-written-team-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s1).

Let A be an N-by-N symmetric positive definite matrix. The conjugate gradient method can be described as follows:

$$
\begin{array}{l} \mathbf{r}_{0} = \mathbf{b} - A \mathbf{x}_{0}, \mathbf{p}_{0} = \mathbf{r}_{0}, \mathbf{x}_{0} = 0 \\ \text{FOR n = 0,1,\ldots} \\ \alpha_{n} = \| \mathbf{r}_{n} \|_{2}^{2} /(\mathbf{p}_{n}^{T} A \mathbf{p}_{n}) \\ \mathbf{x}_{n + 1} = \mathbf{x}_{n} + \alpha_{n} \mathbf{p}_{n} \\ \mathbf{r}_{n + 1} = \mathbf{r}_{n} - \alpha_{n} A \mathbf{p}_{n} \\ \beta_{n} = - \mathbf{r}_{k + 1}^{T} A \mathbf{p}_{k} / \mathbf{p}_{k}^{T} A \mathbf{p}_{k} \\ \mathbf{p}_{n + 1} = \mathbf{r}_{n + 1} + \beta_{n} \mathbf{p}_{n} \\ \text{END FOR} \end{array}
$$

Show

(a) $\alpha_{n}$ minimizes $f(\mathbf{x}_{n} + \alpha \mathbf{p}_{n})$ for all $\alpha \in \mathbb{R}$ where

$$
f(\mathbf{x}) \equiv \frac{1}{2} \mathbf{x}^{T} A \mathbf{x} - \mathbf{b}^{T} \mathbf{x}.
$$

(b) $\mathbf{p}_{i}^{T} \mathbf{r}_{n} = 0$ for $i < n$ and $\mathbf{p}_{i}^{T} A \mathbf{p}_{j} = 0 \ \mathrm{if} \i \neq j.$

(c) Span $\left\{\mathbf{p}_{0}, \mathbf{p}_{1}, \ldots, \mathbf{p}_{n - 1} \right\}$ = Span $\left\{\mathbf{r}_{0}, \mathbf{r}_{1}, \ldots, \mathbf{r}_{n - 1} \right\} \equiv K_{n}$

(d) $\mathbf{r}_{n}$ is orthogonal to $K_{n}$ .

## Problem 2

^yau-2011-semifinal-written-team-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s2).

We use the following scheme to solve the PDE $u _ { t } + u _ { x } = 0 $

$$
u_{j}^{n + 1} = au_{j - 2}^{n} + bu_{j - 1}^{n} + cu_{j}^{n}
$$

where $a, b,$ , c are constants which may depend on the CFL number $\lambda =$ $\frac{\Delta t}{\Delta x}$ . Here $x_{j} = j \Delta x, t^{n} = n \Delta t$ and $u_{j}^{n}$ is the numerical approximation to the exact solution $u(x_{j}, t^{n})$ , with periodic boundary conditions.

(i) Find $a, b, c$ so that the scheme is second order accurate.

(ii) Verify that the scheme you derived in Part (i) is exact (i.e. $u_{j}^{n} =$ $u(x_{j}, t^{n}))$ if $\lambda = 1$ or $\lambda = 2$ . Does this imply that the scheme is stable for $\lambda \leq 2 ?$ If not, find $\lambda_{0}$ such that the scheme is stable for $\lambda \le \lambda_{0}$ Recall that a scheme is stable if there exist constants M and $C$ , which are independent of the mesh sizes $\Delta x$ and $\Delta t,$ such that

$$
\| u^{n} \| \leq Me^{CT} \| u^{0} \|
$$

for all $\Delta x, \ \Delta t$ and n such that $t^{n} \leq T$ . You can use either the $L^{\infty}$ norm or the $L^{2}$ norm to prove stability.

## Problem 3

^yau-2011-semifinal-written-team-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s3).

Let X and Y be independent random variables, identically distributed according to the Normal distribution with mean 0 and variance 1, N (0, 1).

(a) Find the joint probability density function of $(R, \theta)$ , where

$$
R =(X^{2} + Y^{2})^{1 / 2} \quad \text{and} \quad \theta = \arctan(Y / X).
$$

(b) Are R and θ independent? Why, or why not?

(c) Find a function U of R which has the uniform distribution on (0, 1), Unif(0, 1).

(d) Find a function V of θ which is distributed as Unif(0,1).

(e) Show how to transform two independent observations U and V from Unif(0,1) into two independent observations X, Y from $N(0, 1)$

## Problem 4

^yau-2011-semifinal-written-team-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s4).

Let X be a random variable such that $E[| X |] < \infty$ . Show that

$$
E[| X - a |] = \inf_{x \in R} E[| X - x |],
$$

if and only if a is a median of $X$ .

## Problem 5

^yau-2011-semifinal-written-team-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s5).

Let $Y_{1}, \dots, Y_{n}$ be iid observations from the distribution $f(x - \theta)$ where θ is unknown and $f(\mathbf{\xi})$ is probability density function symmetric about zero.

Suppose a priori that θ has the improper prior $\theta \sim$ Lebesgue (flat) on $(- \infty, \infty)$ . Write down the posterior distribution of θ.

Provides some arguments to show that this flat prior is noninformative.

Show that with the posterior distribution in (a), a 95% probability interval is also a 95% confidence interval.

## Problem 6

^yau-2011-semifinal-written-team-q6

> Corresponding solutions: [Problem 6 Reference Solution](../../solutions/yau/yau-2011-semifinal-written-team-solutions.md#^yau-2011-semifinal-written-team-s6).

Suppose we have two independent random samples $\{Y_{1}, i = 1, \dots, n\}$ from Poisson with (unknown) mean $\lambda_{1}$ and $\{Y_{i}, \i = n + 1, \dots, 2n\}$ from Poisson with (unknown) mean $\lambda_{2}$ Let $\theta = \lambda_{1} /(\lambda_{1} + \lambda_{2})$

(a) Find an unbiased estimator of θ

(b) Does your estimator have the minimum variance among all unbiased estimators? If yes, prove it. If not, find one that has the minimum variance (and prove it).

(c) Does the unbiased minimum variance estimator you found attain the Fisher information bound? If yes, show it. If no, why not?

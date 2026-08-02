# INDIVIDUAL TEST S.-T YAU COLLEGE MATH CONTESTS 2012

## Probability and Statistics

Please solve 5 out of the following 6 problems, or highest scores of 5 problems will be counted.

1. Solve the following two problems:

1) An urn contains b black balls and r red balls. One of the balls was drawn at random, and putted back in the urn with $a$ additional balls of the same color. Now suppose that the second ball drawn at random is red. What is the probability that the first ball drawn was black?

2) Let $(X_{n})$ be a sequence of random variables satisfying

$$
\lim_{a \to \infty} \sup_{n \geq 1} P(| X_{n} | > a) = 0.
$$

Assume that sequence of random variables $(Y_{n})$ converges to 0 in probability. Prove that $(X_{n} Y_{n})$ converges to 0 in probability.

2. Solve the following two problems:

1) Let $(\Omega,{\mathcal{F}}, P)$ be a probability space, $\mathcal{G}$ be a sub-algebra of $\mathcal{F}$ Assume that X is a non-negative integrable random variable. Set $Y =$ $E[X |{\mathcal{G}}]$ . Prove that

$$
(a)[X > 0] \subset[Y > 0], a.s.;
$$

$$
(b)[Y > 0] = \operatorname{ess.inf} \{A: A \in \mathcal{G},[X > 0] \subset A\}.
$$

2) Let X and Y have a bivariate normal distribution with zero means, variances $\sigma^{2}$ and $\tau^{2}.$ , respectively, and correlation $\rho.$ Find the conditional expectation $E(X | X + Y)$

3. Suppose that $\{p(i, j) : i = 1, 2, \cdots, m; j = 1, 2, \cdots, n\}$ is a finite bivariate joint probability distribution, that is,

$$
p(i, j) > 0, \sum_{i = 1}^{m} \sum_{j = 1}^{n} p(i, j) = 1.
$$

(i) Can $\{p(i, j)\}$ be always expressed as

$$
p(i, j) = \sum_{k} \lambda_{k} a_{k}(i) b_{k}(j)
$$

for some finite $\begin{array}{r}{\lambda_{k} \geq 0, ~ \sum_{k} \lambda_{k} = 1, \ : a_{k}(i) \geq 0, ~ \sum_{i = 1}^{m} a_{k}(i) = 1, ~ b_{k}(j) \geq} \end{array}$ $0, \ \sum_{j = 1}^{n} b_{k}(j) = 1 ?$

(ii) Prove or disprove the above relation by use of conditional probability.

4. Let $X_{1}, \cdots, X_{m}$ be an independent and identically distributed $\mathrm{(i.i.d.)}$ random sample from a cumulative distribution function (CDF) F , and $Y_{1}, \cdots, Y_{n}$ an i.i.d. random sample from a CDF G. We want to test $H_{0} : F = G$ versus $H_{1} : F \neq G$ . The total sample size is $N = m + n$ Consider the following two nonparametric tests.

• The Wilcoxon rank sum tests. The test proceeds by first ranking the pooled X and Y samples and then taking the sum of the ranks associated with the Y sample. Let $R_{y_{1}}, \cdots, R_{y_{n}}$ be the rankings of the sample $y_{1} < \cdots < y_{n}$ from the pooled sample in increasing order. The Wilcoxon rank sum statistic is defined as $\begin{array}{r}{W = \sum_{j = 1}^{n} R_{y_{j}}} \end{array}$

• The Mann-Whitney U-test. Let $U_{ij} ~ = ~ 1$ if $X_{i} ~ < ~ Y_{j}$ , and $U_{ij} = 0$ otherwise. The Mann-Whitney U-statistic is defined as $\begin{array}{r}{U = \sum_{i = 1}^{m} \sum_{j = 1}^{n} U_{ij}} \end{array}$ . The probability $\gamma = P(X < Y)$ can be estimated as $U{\big /}(mn)$ . The decision rule is based on assessing if $\gamma = 0.5$

Assume that there are no tied data values.

(a) Show that $\begin{array}{r}{W = U + \frac{1}{2} n(n + 1)} \end{array}$ , which shows that the two test statistics difer only by a constant and yield exactly the same p-values.

(b) Using the central limit theorem, the Wilcoxon rank sum statistic W can be converted to a Z-variable, which provides an easyto-use approximation. The transformation is

$$
Z_{W} = \frac{W - \mu_{W}}{\sigma_{W}},
$$

where $\mu_{W}$ and $\sigma_{W}^{2}$ are the mean and variance of W under $H_{0}$ . Show that $\begin{array}{r}{\mu_{W} = \frac{1}{2} n(N + 1)} \end{array}$ and $\begin{array}{r}{\sigma_{W}^{2} = \frac{1}{12} mn(N + 1)} \end{array}$

5. Let X be a random variable with $EX^{2} < \infty$ , and $Y = | X |$ . Assume that X has a Lebesgue density symmetric about 0. Show that random variables X and Y are uncorrelated, but they are not independent.

6. Let $E_{1}, \cdots, E_{n}$ be i.i.d. random variables with $E_{i} \sim \mathrm{Exponential}(1)$ Let $U_{1}, \cdots, U_{n}$ be i.i.d. uniformly (on [0,1]) distributed random variables. Further, assume that $E_{1}, \cdots, E_{n}$ and $U_{1}, \cdots, U_{n}$ are independent.

(a) Find the density of $X =(E_{1} + \cdot \cdot \cdot + E_{m}) /(E_{1} + \cdot \cdot \cdot + E_{n})$ , where $m < n$

(b) Show that $\begin{array}{r}{Y = \frac{(n - m) X}{m(1 - X)}} \end{array}$ is distributed as the F-distribution with degrees of freedom $(2m, 2(n - m))$

(c) Find the density of $(U_{1} \cdot \cdot \cdot U_{n})^{- X}$
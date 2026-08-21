---
title: "Appendix A — Standard Probability Distributions"
source: Gelman, Carlin, Stern, Dunson, Vehtari, Rubin, Bayesian Data Analysis, 3rd ed., CRC 2013
kind: mineru-transcript-chapter
part: appendix
canonical_pdf: ../Bayesian-Data-Analysis-3rd.pdf
---

# Appendix A — Standard Probability Distributions

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 23 Dirichlet Processes](./23-dirichlet-process-models.md) · [App. B Proofs →](./b-outline-of-proofs.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Appendix A

# Standard probability distributions

Tables A.1 and A.2 present notation, probability density functions, parameter descriptions, means, modes, and standard deviations for several standard probability distributions. We use the standard notation $\theta$ for the random variable (or random vector), except in the case of the Wishart and inverse-Wishart, for which we use $W$ for the random matrix, and LKJ correlation, for which we use $\Sigma$ for a correlation matrix.

Realistic distributions for complicated multivariate models, including hierarchical and mixture models, can typically be constructed using, as building blocks, the simple distributions listed here. In our own work we use preprogrammed random number routines (many available in R, for example), but it can be valuable to understand where these numbers come from.

The starting point for any simulations are functions that draw pseudorandom samples from the uniform distribution on the unit interval. Much research has been done to ensure that the pseudorandom numbers are appropriate for realistic applied tasks. For example, a sequence may appear uniform in one dimension while $m$ -tuples are not randomly scattered in $m$ dimensions.

# A.1 Continuous distributions

# Uniform

The uniform distribution is used to represent a variable that is known to lie in an interval and equally likely to be found anywhere in the interval. A noninformative distribution is obtained in the limit as $a \to -\infty$ , $b \to \infty$ . If $u$ is drawn from a standard uniform distribution $\mathrm{U}(0,1)$ , then $\theta = a + (b - a)u$ is a draw from $\mathrm{U}(a,b)$ .

# Univariate normal

The normal, or Gaussian, distribution is ubiquitous in statistics. Sample averages are approximately normally distributed by the central limit theorem. A noninformative or flat distribution is obtained in the limit as the variance $\sigma \to \infty$ . The variance is usually restricted to be positive; $\sigma = 0$ corresponds to a point mass at $\theta$ . The density function is always finite, the integral is finite as long as $\sigma$ is finite. If $z$ is a random deviate from the standard normal distribution, then $\theta = \mu + \sigma z$ is a draw from $\mathrm{N}(\mu, \sigma^2)$ .

Two properties of the normal distribution that play a large role in model building and Bayesian computation are the addition and mixture properties.

The sum of two independent normal random variables is normally distributed. If $\theta_{1}$ and $\theta_{2}$ are independent with $\mathrm{N}(\mu_1,\sigma_1^2)$ and $\mathrm{N}(\mu_2,\sigma_2^2)$ distributions, then $\theta_{1} + \theta_{2}\sim \mathrm{N}(\mu_{1}+$ $\mu_{2},\sigma_{1}^{2} + \sigma_{2}^{2})$ . The mixture property states that if $\theta_{1}|\theta_{2}\sim \mathrm{N}(\theta_{2},\sigma_{1}^{2})$ and $\theta_{2}\sim \mathrm{N}(\mu_{2},\sigma_{2}^{2})$ , then $\theta_{1}\sim \mathrm{N}(\mu_{2},\sigma_{1}^{2} + \sigma_{2}^{2})$ . This is useful in the analysis of hierarchical normal models.

Table A.1 Continuous distributions   

<table><tr><td>Distribution</td><td>Notation</td><td>Parameters</td></tr><tr><td rowspan="2">Uniform</td><td>θ ~ U(α,β)</td><td>boundaries α,β</td></tr><tr><td>p(θ) = U(θ|α,β)</td><td>with β &gt; α</td></tr><tr><td rowspan="2">Normal</td><td>θ ~ N(μ,σ2)</td><td>location μ</td></tr><tr><td>p(θ) = N(θ|μ,σ2)</td><td>scale σ &gt; 0</td></tr><tr><td rowspan="2">Lognormal</td><td>θ ~ lognormal(μ,σ2)</td><td>location μ</td></tr><tr><td>p(θ) = lognormal(θ|μ,σ2)</td><td>log-scale σ &gt; 0</td></tr><tr><td>Multivariate</td><td>θ ~ N(μ,Σ)</td><td rowspan="3">symmetric, pos. definite, d × d variance matrix Σ</td></tr><tr><td rowspan="2">normal</td><td>p(θ) = N(θ|μ,Σ)</td></tr><tr><td>(implicit dimension d)</td></tr><tr><td rowspan="2">Gamma</td><td>θ ~ Gamma(α,β)</td><td>shape α &gt; 0</td></tr><tr><td>p(θ) = Gamma(θ|α,β)</td><td>inverse scale β &gt; 0</td></tr><tr><td rowspan="2">Inverse-gamma</td><td>θ ~ Inv-gamma(α,β)</td><td>shape α &gt; 0</td></tr><tr><td>p(θ) = Inv-gamma(θ|α,β)</td><td>scale β &gt; 0</td></tr><tr><td rowspan="2">Chi-square</td><td>θ ~ χ2ν</td><td rowspan="2">degrees of freedom ν &gt; 0</td></tr><tr><td>p(θ) = χ2ν(θ)</td></tr><tr><td rowspan="2">Inverse-chi-square</td><td>θ ~ Inv-χ2ν</td><td rowspan="2">degrees of freedom ν &gt; 0</td></tr><tr><td>p(θ) = Inv-χ2ν(θ)</td></tr><tr><td rowspan="2">Scaled inverse-chi-square</td><td>θ ~ Inv-χ2(ν, s2)</td><td>degrees of freedom ν &gt; 0</td></tr><tr><td>p(θ) = Inv-χ2(θ|ν, s2)</td><td>scale s &gt; 0</td></tr><tr><td rowspan="2">Exponential</td><td>θ ~ Expon(β)</td><td rowspan="2">inverse scale β &gt; 0</td></tr><tr><td>p(θ) = Expon(θ|β)</td></tr><tr><td rowspan="2">Laplace (double-exponential)</td><td>θ ~ Laplace(μ,σ)</td><td>location μ</td></tr><tr><td>p(θ) = Laplace(θ|μ,σ)</td><td>scale σ &gt; 0</td></tr><tr><td rowspan="2">Weibull</td><td>θ ~ Weibull(α,β)</td><td>shape α &gt; 0</td></tr><tr><td>p(θ) = Weibull(θ|α,β)</td><td>scale β &gt; 0</td></tr><tr><td rowspan="3">Wishart</td><td>W ~ Wishartν(S)</td><td>degrees of freedom ν</td></tr><tr><td>p(W) = Wishartν(W|S)</td><td rowspan="2">symmetric, pos. definite k × k scale matrix S</td></tr><tr><td>(implicit dimension k × k)</td></tr><tr><td rowspan="3">Inverse-Wishart</td><td>W ~ Inv-Wishartν(S-1)</td><td>degrees of freedom ν</td></tr><tr><td>p(W) = Inv-Wishartν(W|S-1)</td><td rowspan="2">symmetric, pos. definite k × k scale matrix S</td></tr><tr><td>(implicit dimension k × k)</td></tr><tr><td rowspan="3">LKJ correlation</td><td>Σ ~ LkjCorr(η)</td><td rowspan="3">shape η &gt; 0</td></tr><tr><td>p(Σ) = LkjCorr(Σ|η)</td></tr><tr><td>(implicit dimension k × k)</td></tr></table>

# Density function

Mean, variance, and mode

<table><tr><td>p(θ) = 1/β-α, θ ∈ [α,β]</td><td>E(θ) = α+β/2
var(θ) = (β-α)2/12
no mode</td></tr><tr><td>p(θ) = 1/√2πσ exp(-1/2σ2(θ-μ)2)</td><td>E(θ) = μ
var(θ) = σ2
mode(θ) = μ</td></tr><tr><td>p(θ) = (√2πσθ)-1 exp(-1/2σ2(log θ-μ)2)</td><td>E(θ) = exp(μ+1/2σ2), var(θ) = exp(2μ+σ2)(exp(σ2)-1)
mode(θ) = exp(μ-σ2)</td></tr><tr><td>p(θ) = (2π)-d/2|Σ|-1/2
× exp(-1/2(θ-μ)TΣ-1(θ-μ))</td><td>E(θ) = μ
var(θ) = Σ
mode(θ) = μ</td></tr><tr><td>p(θ) = βα/Γ(α)θα-1e-βθ, θ&gt;0</td><td>E(θ) = α/β
var(θ) = α/β2
mode(θ) = α-1/β, for α≥1</td></tr><tr><td>p(θ) = βα/Γ(α)θ-(α+1)e-β/θ, θ&gt;0</td><td>E(θ) = β/α-1, for α&gt;1
var(θ) = β2/(α-1)2(α-2), α&gt;2
mode(θ) = β/α+1</td></tr><tr><td>p(θ) = 2-ν/2/Γ(ν/2)θν/2-1e-θ/2, θ&gt;0
same as Gamma(α=ν/2,β=1/2)</td><td>E(θ) = ν
var(θ) = 2ν
mode(θ) = ν-2, for ν≥2</td></tr><tr><td>p(θ) = 2-ν/2/Γ(ν/2)θ-(ν/2+1)e-νs2/(2θ), θ&gt;0
same as Inv-gamma(α=ν/2,β=1/2)</td><td>E(θ) = 1/ν-2, for ν&gt;2
var(θ) = 2/(ν-2)2(ν-4), ν&gt;4
mode(θ) = 1/ν+2</td></tr><tr><td>p(θ) = (ν/2)ν/2sνθ-(ν/2+1)e-νs2/(2θ), θ&gt;0
same as Inv-gamma(α=ν/2,β=ν/2s2)</td><td>E(θ) = ν/ν-2s2
var(θ) = 2ν2/(ν-2)2(ν-4)s4
mode(θ) = ν/ν+2s2</td></tr><tr><td>p(θ) = βe-βθ, θ&gt;0
same as Gamma(α=1,β)</td><td>E(θ) = 1/β
var(θ) = 1/β2
mode(θ) = 0</td></tr><tr><td>p(θ) = 1/2σ exp(-|x-μ|/σ)</td><td>E(θ) = μ
var(θ) = 2σ2
mode(θ) = μ</td></tr><tr><td>p(θ) = α/βαθα-1exp(-(θ/β)α), θ&gt;0</td><td>E(θ) = βΓ(1+1/α)
var(θ) = β2[Γ(1+2/α)-(Γ(1+1/α))2]
mode(θ) = β(1-1/α)1/α</td></tr><tr><td>p(W) = (2νk/2πk(k-1)/4 ∏i=1k(ν+1-i)/2 × |S|−ν/2|W| (ν-k-1)/2 × exp(-1/2 tr(S-1W)), W pos. definite</td><td>E(W) = νS</td></tr><tr><td>p(W) = (2νk/2πk(k-1)/4 ∏i=1k(ν+1-i)/2 × |S|ν/2|W|-(ν+k+1)/2 × exp(-1/2 tr(SW-1)), W pos. definite</td><td>E(W) = (ν-k-1)^-1S</td></tr><tr><td>p(Σ) = det(Σ)η-1
×2∑i=1k(2η-2+k-i)(k-i)
×Πi=1k(B(i+1/2,i+1/2))k</td><td>E(Σ) = Ik,</td></tr></table>

Table A.1 Continuous distributions continued   

<table><tr><td>Distribution</td><td>Notation</td><td>Parameters</td></tr><tr><td rowspan="3">t</td><td>θ ~ tv(μ,σ2)</td><td>degrees of freedomν &gt; 0</td></tr><tr><td>p(θ) = tv(θ|μ, σ2)</td><td>location μ</td></tr><tr><td>tν is short for tv(0,1)</td><td>scale σ &gt; 0</td></tr><tr><td rowspan="3">Multivariate t</td><td>θ ~ tv(μ, Σ)</td><td>degrees of freedomν &gt; 0</td></tr><tr><td>p(θ) = tv(θ|μ, Σ)</td><td>location μ = (μ1, . . ., μd)</td></tr><tr><td>(implicit dimension d)</td><td>symmetric, pos. definite d × d scale matrix Σ</td></tr><tr><td rowspan="2">Beta</td><td>θ ~ Beta(α, β)</td><td>‘prior sample sizes’</td></tr><tr><td>p(θ) = Beta(θ|α, β)</td><td>α &gt; 0, β &gt; 0</td></tr><tr><td rowspan="2">Dirichlet</td><td>θ ~ Dirichlet(α1, . . ., αk)</td><td>‘prior sample sizes’</td></tr><tr><td>p(θ) = Dirichlet(θ|α1, . . ., αk)</td><td>αj &gt; 0; α0 ≈ ∑j=1k αj</td></tr><tr><td rowspan="2">Logistic</td><td>θ ~ Logistic(μ, σ)</td><td>location μ</td></tr><tr><td>p(θ) = Logistic(θ|μ, σ)</td><td>scale σ &gt; 0</td></tr><tr><td rowspan="2">Log-logistic</td><td>θ ~ Log-logistic(α, β)</td><td>scale α &gt; 0</td></tr><tr><td>p(θ) = Log-logistic(θ|α, β)</td><td>shape β &gt; 0</td></tr></table>

Table A.2 Discrete distributions   

<table><tr><td>Distribution</td><td>Notation</td><td>Parameters</td></tr><tr><td>Poisson</td><td>θ ~ Poisson(λ)p(θ) = Poisson(θ|λ)</td><td>‘rate’ λ &gt; 0</td></tr><tr><td>Binomial</td><td>θ ~ Bin(n,p)p(θ) = Bin(θ|n,p)</td><td>‘sample size’n (positive integer)‘probability’ p ∈ [0,1]</td></tr><tr><td>Multinomial</td><td>θ ~ Multin(n; p1, . . ., pk)p(θ) = Multin(θ|n; p1, . . ., pk)</td><td>‘sample size’n (positive integer)‘probabilities’ pj ∈ [0,1]; ∑j=1k pj=1</td></tr><tr><td>Negative binomial</td><td>θ ~ Neg-bin(α,β)p(θ) = Neg-bin(θ|α,β)</td><td>shape α &gt; 0inverse scale β &gt; 0</td></tr><tr><td>Beta-binomial</td><td>θ ~ Beta-bin(n, α, β)p(θ) = Beta-bin(θ|n, α, β)</td><td>‘sample size’n (positive integer)‘prior sample sizes’α &gt; 0, β &gt; 0</td></tr></table>

# Density function

Mean, variance, and mode

<table><tr><td>p(θ) = Γ((ν+1)/2)/Γ(ν/2)√νπσ(1 + 1/ν(θ-μ)/σ)2-(ν+1)/2</td><td>E(θ) = μ, for ν&gt;1
var(θ) = ν/ν-2σ2, for ν&gt;2
mode(θ) = μ</td></tr><tr><td>p(θ) = Γ((ν+d)/2)/Γ(ν/2)νd/2πd/2|Σ|-1/2
×(1 + 1/ν(θ-μ)TΣ-1(θ-μ))-(ν+d)/2</td><td>E(θ) = μ, for ν&gt;1
var(θ) = ν/ν-2Σ, for ν&gt;2
mode(θ) = μ</td></tr><tr><td>p(θ) = Γ(α+β)/Γ(α)Γ(β)θα-1(1-θ)β-1
θ ∈ [0,1]</td><td>E(θ) = α/α+β
var(θ) = αβ/(α+β)2(α+β+1)
mode(θ) = α-1/α+β-2</td></tr><tr><td>p(θ) = Γ(α1+···+αk)/Γ(α1)···Γ(αk)θ1α1-1···θk-1
θ1,.,θk≥0; Σj=1kθj=1</td><td>E(θj) = αj/α0
var(θj) = αj(α0-αj)/α02(α0+1)
cov(θi,θj) = -αiαj/α02(α0+1)
mode(θj) = αj-1/α0-k</td></tr><tr><td>p(θ) = exp(-x-μ/σ)/σ(1+exp(-x-μ/σ))</td><td>E(θ) = μ
var(θ) = 1/3σ2π2
mode(θ) = μ</td></tr><tr><td>p(θ) = β/α(x/α)β-1/[1+(x/α)β]2, θ&gt;0</td><td>E(θ) = 1/1+(x/α)-β
var(θ) = α2/2π/βsin(2π/β), β&gt;2
mode(θ) = α(β-1/β+1)1/β, β&gt;1</td></tr></table>

# Density function

Mean, variance, and mode

$$
\begin{array}{l} \overline {{p (\theta)}} = \frac {1}{\theta !} \lambda^ {\theta} \exp (- \lambda) \\ \theta = 0, 1, 2, \ldots \\ \end{array}
$$

$$
\begin{array}{l} p (\theta) = \left( \begin{array}{c} n \\ \theta \end{array} \right) p ^ {\theta} (1 - p) ^ {n - \theta} \\ \theta = 0, 1, 2, \ldots , n \\ \end{array}
$$

$$
\begin{array}{l} p (\theta) = \left( \begin{array}{c c} & n \\ \theta_ {1} & \theta_ {2} \dots \theta_ {k} \end{array} \right) p _ {1} ^ {\theta_ {1}} \dots p _ {k} ^ {\theta_ {k}} \\ \theta_ {j} = 0, 1, 2, \dots , n; \sum_ {j = 1} ^ {k} \theta_ {j} = n \\ \end{array}
$$

$$
\begin{array}{l} \overline {{p (\theta) = \binom {\theta + \alpha - 1} {\alpha - 1} \left(\frac {\beta}{\beta + 1}\right) ^ {\alpha} \left(\frac {1}{\beta + 1}\right) ^ {\theta}}} \\ \theta = 0, 1, 2, \ldots \\ \end{array}
$$

$$
\begin{array}{l} p (\theta) = \frac {\Gamma (n + 1)}{\Gamma (\theta + 1) \Gamma (n - \theta + 1)} \frac {\Gamma (\alpha + \theta) \Gamma (n + \beta - \theta)}{\Gamma (\alpha + \beta + n)} \\ \times \frac {\Gamma (\alpha + \beta)}{\Gamma (\alpha) \Gamma (\beta)}, \quad \theta = 0, 1, 2, \dots , n \\ \end{array}
$$

$$
\begin{array}{l} \overline {{\operatorname {E} (\theta)}} = \lambda , \operatorname {v a r} (\theta) = \lambda \\ \operatorname {m o d e} (\theta) = \lfloor \lambda \rfloor \\ \end{array}
$$

$$
\begin{array}{l} \mathrm {E} (\theta) = n p \\ \operatorname {v a r} (\theta) = n p (1 - p) \\ \operatorname {m o d e} (\theta) = \lfloor (n + 1) p \rfloor \\ \end{array}
$$

$$
\begin{array}{l} \mathrm {E} (\theta_ {j}) = n p _ {j} \\ \operatorname {v a r} \left(\theta_ {j}\right) = n p _ {j} \left(1 - p _ {j}\right) \\ \operatorname {c o v} \left(\theta_ {i}, \theta_ {j}\right) = - n p _ {i} p _ {j} \\ \end{array}
$$

$$
\begin{array}{l} \operatorname {E} (\theta) = \frac {\alpha}{\beta} \\ \operatorname {v a r} (\theta) = \frac {\alpha}{\beta^ {2}} (\beta + 1) \\ \end{array}
$$

$$
\begin{array}{l} \operatorname {E} (\theta) = n \frac {\alpha}{\alpha + \beta} \\ \operatorname {v a r} (\theta) = n \frac {\alpha \beta (\alpha + \beta + n)}{(\alpha + \beta) ^ {2} (\alpha + \beta + 1)} \\ \end{array}
$$

# Lognormal

If $\theta$ is a random variable that is restricted to be positive, and $\log \theta \sim \mathrm{N}(\mu, \sigma^2)$ , then $\theta$ is said to have a lognormal distribution. Using the Jacobian of the log transformation, one can directly determine that the density is $p(\theta) = (\sqrt{2\pi}\sigma\theta)^{-1}\exp(-\frac{1}{2\sigma^2}(\log\theta - \mu)^2)$ , the mean is $\exp(\mu + \frac{1}{2}\sigma^2)$ , the variance is $\exp(2\mu)\exp(\sigma^2)(\exp(\sigma^2) - 1)$ , and the mode is $\exp(\mu - \sigma^2)$ . The geometric mean and geometric standard deviation of a lognormally distributed random variable $\theta$ are simply $e^\mu$ and $e^\sigma$ .

# Multivariate normal

The multivariate normal density is always finite; the integral is finite as long as $\operatorname{det}(\Sigma^{-1}) > 0$ . A noninformative distribution is obtained in the limit as $\operatorname{det}(\Sigma^{-1}) \to 0$ ; this limit is not uniquely defined. A random draw from a multivariate normal distribution can be obtained using the Cholesky decomposition of $\Sigma$ and a vector of univariate normal draws. The Cholesky decomposition of $\Sigma$ produces a lower-triangular matrix $A$ (the 'Cholesky factor') for which $AA^T = \Sigma$ . If $z = (z_1, \ldots, z_d)$ are $d$ independent standard normal random variables, then $\theta = \mu + Az$ is a random draw from the multivariate normal distribution with covariance matrix $\Sigma$ .

The marginal distribution of any subset of components (for example, $\theta_{i}$ or $(\theta_{i},\theta_{j}))$ is also normal. Any linear transformation of $\theta$ , such as the projection of $\theta$ onto a linear subspace, is also normal, with dimension equal to the rank of the transformation. The conditional distribution of $\theta$ , constrained to lie on any linear subspace, is also normal. The addition property holds: if $\theta_{1}$ and $\theta_{2}$ are independent with $\mathrm{N}(\mu_1,\Sigma_1)$ and $\mathrm{N}(\mu_2,\Sigma_2)$ distributions, then $\theta_{1} + \theta_{2}\sim \mathrm{N}(\mu_{1} + \mu_{2},\Sigma_{1} + \Sigma_{2})$ as long as $\theta_{1}$ and $\theta_{2}$ have the same dimension. We discuss the generalization of the mixture property shortly.

The conditional distribution of any subvector of $\theta$ given the remaining elements is once again multivariate normal. If we partition $\theta$ into subvectors $\theta = (U,V)$ , then $p(U|V)$ is (multivariate) normal:

$$
\operatorname {E} (U | V) = \operatorname {E} (U) + \operatorname {c o v} (U, V) \operatorname {v a r} (V) ^ {- 1} (V - \operatorname {E} (V)),
$$

$$
\operatorname {v a r} (U | V) = \operatorname {v a r} (U) - \operatorname {c o v} (U, V) \operatorname {v a r} (V) ^ {- 1} \operatorname {c o v} (V, U), \tag {A.1}
$$

where $\operatorname{cov}(V,U)$ is a rectangular matrix (submatrix of $\Sigma$ ) of the appropriate dimensions, and $\operatorname{cov}(U,V) = \operatorname{cov}(V,U)^T$ . In particular, if we define the matrix of conditional coefficients,

$$
C = I - \left[ \operatorname {d i a g} \left(\Sigma^ {- 1}\right) \right] ^ {- 1} \Sigma^ {- 1},
$$

then

$$
\left(\theta_ {i} \mid \theta_ {j}, \text {a l l} j \neq i\right) \sim \mathrm {N} \left(\mu_ {i} + \sum_ {j \neq i} c _ {i j} \left(\theta_ {j} - \mu_ {j}\right), \left[ \left(\Sigma^ {- 1}\right) _ {i i} \right] ^ {- 1}\right). \tag {A.2}
$$

Conversely, if we parameterize the distribution of $U$ and $V$ hierarchically:

$$
U | V \sim \mathrm {N} (X V, \Sigma_ {U | V}), \quad V \sim \mathrm {N} (\mu_ {V}, \Sigma_ {V}),
$$

then the joint distribution of $\theta$ is the multivariate normal,

$$
\theta = \left( \begin{array}{c} U \\ V \end{array} \right) \sim \mathrm {N} \left(\left( \begin{array}{c} X \mu_ {V} \\ \mu_ {V} \end{array} \right), \left( \begin{array}{c c} X \Sigma_ {V} X ^ {T} + \Sigma_ {U | V} & X \Sigma_ {V} \\ \Sigma_ {V} X ^ {T} & \Sigma_ {V} \end{array} \right)\right).
$$

This generalizes the mixture property of univariate normals.

The 'weighted sum of squares,' $SS = (\theta - \mu)^T \Sigma^{-1} (\theta - \mu)$ , has a $\chi_d^2$ distribution. For any matrix $A$ for which $AA^T = \Sigma$ , the conditional distribution of $A^{-1} (\theta - \mu)$ , given $SS$ , is uniform on a $(d-1)$ -dimensional sphere.

# Gamma

The gamma distribution is the conjugate prior distribution for the inverse of the normal variance and for the mean parameter of the Poisson distribution. The gamma integral is finite if $\alpha > 0$ ; the density function is finite if $\alpha \geq 1$ . Many computer packages generate gamma random variables directly; otherwise, it is possible to obtain draws from a gamma random variable using draws from a uniform as input. The most effective method depends on the parameter $\alpha$ ; see the references for details.

There is an addition property for independent gamma random variables with the same inverse scale parameter. If $\theta_{1}$ and $\theta_{2}$ are independent with $\mathrm{Gamma}(\alpha_1,\beta)$ and $\mathrm{Gamma}(\alpha_2,\beta)$ distributions, then $\theta_{1} + \theta_{2}\sim \mathrm{Gamma}(\alpha_{1} + \alpha_{2},\beta)$ . The logarithm of a gamma random variable is approximately normal; raising a gamma random variable to the one-third power provides an even better normal approximation.

# Inverse-gamma

If $\theta^{-1}$ has a gamma distribution with parameters $\alpha, \beta$ , then $\theta$ has the inverse-gamma distribution. The density is finite always; its integral is finite if $\alpha > 0$ . The inverse-gamma is the conjugate prior distribution for the normal variance. A noninformative distribution is obtained as $\alpha, \beta \to 0$ .

# Chi-square

The $\chi^2$ distribution is a special case of the gamma distribution, with $\alpha = \nu / 2$ and $\beta = \frac{1}{2}$ . The addition property holds since the inverse scale parameter is fixed: if $\theta_1$ and $\theta_2$ are independent with $\chi_{\nu_1}^2$ and $\chi_{\nu_2}^2$ distributions, then $\theta_1 + \theta_2 \sim \chi_{\nu_1 + \nu_2}^2$ .

# Inverse chi-square

The inverse- $\chi^2$ is a special case of the inverse-gamma distribution, with $\alpha = \nu / 2$ and $\beta = \frac{1}{2}$ . We also define the scaled inverse chi-square distribution, which is useful for variance parameters in normal models. To obtain a simulation draw $\theta$ from the $\mathrm{Inv} - \chi^2(\nu, s^2)$ distribution, first draw $X$ from the $\chi_{\nu}^2$ distribution and then let $\theta = \nu s^2 / X$ .

# Exponential

The exponential distribution is the distribution of waiting times for the next event in a Poisson process and is a special case of the gamma distribution with $\alpha = 1$ . Simulation of draws from the exponential distribution is straightforward. If $U$ is a draw from the uniform distribution on $[0,1]$ , then $-\log (U) / \beta$ is a draw from the exponential distribution with parameter $\beta$ .

# Weibull

If $\theta$ is a random variable that is restricted to be positive, and $(\theta/\beta)^{\alpha}$ has an Expon(1) distribution, then $\theta$ is said to have a Weibull distribution with shape parameter $\alpha > 0$ and scale parameter $\beta > 0$ . The Weibull is often used to model failure times in reliability analysis. Using the Jacobian of the log transformation, one can directly determine that the density is $p(\theta) = \frac{\alpha}{\beta^{\alpha}}\theta^{\alpha - 1}\exp(-(\theta/\beta)^{\alpha})$ , the mean is $\beta \Gamma(1 + \frac{1}{\alpha})$ , the variance is $\beta^{2}[\Gamma(1 + \frac{2}{\alpha}) - (\Gamma(1 + \frac{1}{\alpha}))^{2}]$ , and the mode is $\beta (1 - \frac{1}{\alpha})^{1 / \alpha}$ .

# Wishart

The Wishart is the conjugate prior distribution for the inverse covariance matrix in a multivariate normal distribution. It is a multivariate generalization of the gamma distribution. The integral is finite if the degrees of freedom parameter, $\nu$ , is greater than or equal to the dimension, $k$ . The density is finite if $\nu \geq k + 1$ . A noninformative distribution is obtained as $\nu \rightarrow 0$ . The sample covariance matrix for independent and identically distributed multivariate normal data has a Wishart distribution. In fact, multivariate normal simulations can be used to simulate a draw from the Wishart distribution, as follows. Simulate $\alpha_{1}, \ldots, \alpha_{\nu}$ , $\nu$ independent samples from a $k$ -dimensional multivariate $\mathrm{N}(0, S)$ distribution, then let $\theta = \sum_{i=1}^{\nu} \alpha_{i} \alpha_{i}^{T}$ . This only works when the distribution is proper; that is, $\nu \geq k$ .

# Inverse-Wishart

If $W^{-1} \sim \mathrm{Wishart}_{\nu}(S)$ then $W$ has the inverse-Wishart distribution. The inverse-Wishart is the conjugate prior distribution for the multivariate normal covariance matrix. The inverse-Wishart density is always finite, and the integral is always finite. A degenerate form occurs when $\nu < k$ .

# LKJ correlation

The LKJ distribution (Lewandowski, Kurowicka, and Joe, 2009) is a distribution over positive-definite symmetric matrices with unit diagonals—that is, correlation matrices. If $\Sigma$ is a correlation matrix, $\mathrm{LkjCorr}(\Sigma |\eta)\propto \operatorname *{det}(\Sigma)^{\eta -1}$ , for with the parameter $\eta$ required to be positive. The shape parameter $\eta$ can be interpreted like the shape parameter of a symmetric beta distribution. If $\eta = 1$ , then the density is uniform over all correlation matrices of a given order. If $\eta >1$ , the modal correlation matrix is the identity, with the distribution being more concentrated about this mode as $\eta$ becomes large. For $0 < \eta < 1$ , the density has a trough at the identity matrix.

t

The $t$ (or Student- $t$ ) is the marginal posterior for the normal mean with unknown variance and conjugate prior and can be interpreted as a mixture of normals with common mean and variances that follow an inverse-gamma distribution. The $t$ is also the ratio of a normal random variable and the square root of an independent gamma random variable. To simulate $t$ , simulate $z$ from a standard normal and $x$ from a $\chi_{\nu}^{2}$ , then let $\theta = \mu + \sigma z \sqrt{\nu / x}$ . The $t$ density is always finite; the integral is finite if $\nu > 0$ and $\sigma$ is finite. In the limit $\nu \to \infty$ , the $t$ distribution approaches $\mathrm{N}(\mu, \sigma^2)$ . The case of $\nu = 1$ is called the Cauchy distribution. The $t$ distribution can be used in place of a normal in a robust analysis.

To draw from the multivariate $t_{\nu}(\mu, \Sigma)$ distribution, generate a vector $z \sim \mathrm{N}(0, I)$ and a scalar $x \sim \chi_{\nu}^{2}$ , then compute $\mu + A z \sqrt{\nu / x}$ , where $A$ satisfies $AA^T = \Sigma$ .

# Beta

The beta is the conjugate prior distribution for the binomial probability. The density is finite if $\alpha, \beta \geq 1$ , and the integral is finite if $\alpha, \beta > 0$ . The choice $\alpha = \beta = 1$ gives the standard uniform distribution; $\alpha = \beta = 0.5$ and $\alpha = \beta = 0$ are also sometimes used as noninformative densities. To simulate $\theta$ from the beta distribution, first simulate $x_{\alpha}$ and $x_{\beta}$ from $\chi_{2\alpha}^{2}$ and $\chi_{2\beta}^{2}$ distributions, respectively, then let $\theta = \frac{x_{\alpha}}{x_{\alpha} + x_{\beta}}$ .

It is sometimes useful to estimate quickly the parameters of the beta distribution using

the method of moments:

$$
\alpha + \beta = \frac {\operatorname {E} (\theta) (1 - \operatorname {E} (\theta))}{\operatorname {v a r} (\theta)} - 1
$$

$$
\alpha = (\alpha + \beta) \mathrm {E} (\theta), \quad \beta = (\alpha + \beta) (1 - \mathrm {E} (\theta)). \tag {A.3}
$$

The $k$ th order statistic from a sample of $n$ independent $\mathrm{U}(0,1)$ variables has the $\mathrm{Beta}(k,n - k + 1)$ distribution.

# Dirichlet

The Dirichlet is the conjugate prior distribution for the parameters of the multinomial distribution. The Dirichlet is a multivariate generalization of the beta distribution. As with the beta, the integral is finite if all of the $\alpha$ 's are positive, and the density is finite if all are greater than or equal to one.

The marginal distribution of a single $\theta_{j}$ is $\mathrm{Beta}(\alpha_j,\alpha_0 - \alpha_j)$ . The marginal distribution of a subvector of $\theta$ is Dirichlet; for example $(\theta_i,\theta_j,1 - \theta_i - \theta_j)\sim \mathrm{Dirichlet}(\alpha_i,\alpha_j,\alpha_0 - \alpha_i - \alpha_j)$ . The conditional distribution of a subvector given the remaining elements is Dirichlet under the condition $\sum_{j = 1}^{k}\theta_{j} = 1$ .

There are two standard approaches to sampling from a Dirichlet distribution. The fastest method generalizes the method used to sample from the beta distribution: draw $x_{1},\ldots ,x_{k}$ from independent gamma distributions with common scale and shape parameters $\alpha_{1},\ldots ,\alpha_{k}$ , and for each $j$ , let $\theta_{j} = x_{j} / \sum_{i = 1}^{k}x_{i}$ . A less efficient algorithm relies on the univariate marginal and conditional distributions being beta and proceeds as follows. Simulate $\theta_{1}$ from a $\mathrm{Beta}(\alpha_1,\sum_{i = 2}^k\alpha_i)$ distribution. Then simulate $\theta_{2},\dots ,\theta_{k - 1}$ in order, as follows. For $j = 2,\dots ,k - 1$ , simulate $\phi_j$ from a $\mathrm{Beta}(\alpha_j,\sum_{i = j + 1}^k\alpha_i)$ distribution, and let $\theta_{j} = (1 - \sum_{i = 1}^{j - 1}\theta_{i})\phi_{j}$ . Finally, set $\theta_{k} = 1 - \sum_{i = 1}^{k - 1}\theta_{i}$ .

# Constrained distributions

We sometimes use notation such as $\mathbf{N}^{+}$ to convey the normal distribution constrained to be positive; that is, the truncated normal distribution. We also have occasion to use the half- $t$ distribution, which is the right half of the $t$ distribution.

# A.2 Discrete distributions

# Poisson

The Poisson distribution is commonly used to represent count data, such as the number of arrivals in a fixed time period. The Poisson distribution has an addition property: if $\theta_{1}$ and $\theta_{2}$ are independent with $\mathrm{Poisson}(\lambda_1)$ and $\mathrm{Poisson}(\lambda_2)$ distributions, then $\theta_{1} + \theta_{2} \sim \mathrm{Poisson}(\lambda_{1} + \lambda_{2})$ . Simulation for the Poisson distribution (and most discrete distributions) can be cumbersome. Table lookup can be used to invert the cumulative distribution function. Simulation texts describe other approaches.

# Binomial

The binomial distribution is commonly used to represent the number of 'successes' in a sequence of $n$ independent and identically distributed Bernoulli trials, with probability of success $p$ in each trial. A binomial random variable with large $n$ is approximately normal. If $\theta_{1}$ and $\theta_{2}$ are independent with $\mathrm{Bin}(n_1,p)$ and $\mathrm{Bin}(n_2,p)$ distributions, then $\theta_{1} + \theta_{2} \sim \mathrm{Bin}(n_{1} + n_{2},p)$ . For small $n$ , a binomial random variable can be simulated by obtaining $n$

independent standard uniforms and setting $\theta$ equal to the number of uniform deviates less than or equal to $p$ . For larger $n$ , more efficient algorithms are often available in computer packages. When $n = 1$ , the binomial is called the Bernoulli distribution.

# Multinomial

The multinomial distribution is a multivariate generalization of the binomial distribution. The marginal distribution of a single $\theta_{i}$ is binomial. The conditional distribution of a subvector of $\theta$ is multinomial with 'sample size' parameter reduced by the fixed components of $\theta$ and 'probability' parameters rescaled to have sum equal to one. We can simulate a multivariate draw using a sequence of binomial draws. Draw $\theta_{1}$ from a $\operatorname{Bin}(n, p_1)$ distribution. Then draw $\theta_{2}, \ldots, \theta_{k-1}$ in order, as follows. For $j = 2, \ldots, k-1$ , draw $\theta_{j}$ from a $\operatorname{Bin}(n - \sum_{i=1}^{j-1} \theta_{i}, p_{j} / \sum_{i=j}^{k} p_{i})$ distribution. Finally, set $\theta_{k} = n - \sum_{i=1}^{k-1} \theta_{i}$ . If at any time in the simulation the binomial sample size parameter equals zero, use the convention that a $\operatorname{Bin}(0, p)$ variable is identically zero.

# Negative binomial

The negative binomial distribution is the marginal distribution for a Poisson random variable when the rate parameter has a Gamma $(\alpha, \beta)$ prior distribution. The negative binomial can also be used as a robust alternative to the Poisson distribution, because it has the same sample space, but has an additional parameter. To simulate a negative binomial random variable, draw $\lambda \sim \mathrm{Gamma}(\alpha, \beta)$ and then draw $\theta \sim \mathrm{Poisson}(\lambda)$ . In the limit $\alpha \to \infty$ and $\alpha / \beta \to \mathrm{constant}$ , the distribution approaches a Poisson with parameter $\alpha / \beta$ . Under the alternative parameterization, $p = \frac{\beta}{\beta + 1}$ , the random variable $\theta$ can be interpreted as the number of Bernoulli failures obtained before the $\alpha$ successes, where the probability of success is $p$ .

# Beta-binomial

The beta-binomial arises as the marginal distribution of a binomial random variable when the probability of success has a $\mathrm{Beta}(\alpha, \beta)$ prior distribution. It can also be used as a robust alternative to the binomial distribution. The mixture definition gives an algorithm for simulating from the beta-binomial: draw $\phi \sim \mathrm{Beta}(\alpha, \beta)$ and then draw $\theta \sim \mathrm{Bin}(n, \phi)$ .

# A.3 Bibliographic note

Many software packages contain subroutines to simulate draws from these distributions. Texts on simulation typically include information about many of these distributions; for example, Gentle (2003) discusses simulation of all of these in detail, except for the LKJ distribution. Ripley (1987) is another helpful general book on simulation. Johnson and Kotz (1972) give more detail, such as the characteristic functions, for the distributions. Fortran and C programs for uniform, normal, gamma, Poisson, and binomial distributions are available in Press et al. (1986).


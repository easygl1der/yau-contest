## All-around: Probability and statistics

Problem 1. Suppose that a study has N subjects, divided into two groups. For subject $i(i = 1,..., N)$ , let $Z_{i}$ be the group assignment, with $Z_{i} = 1$ being the treatment group and $Z_{i} = 0$ being the control group, and $X_{i}$ be the covariates. The propensity score of subject i is the probability of that subject being in the treatment group: $e(X_{i}) = P(Z_{i} = 1 \mid X_{i})$ ). A metric for the similarity of the covariates distribution between the groups is the Bhattacharyya coefficient:

$$
\phi \equiv \int_{0}^{1} \sqrt{f_{1}(u) f_{0}(u)} d u,
$$

where $f_{z}(u)$ is the density of the propensity score in $\mathrm{group} z(\mathrm{for} z = 0, 1)$ . Assume $e(X) \sim{\mathsf{Beta}}(a, b)$ , derive the Bhattacharyya coefficient ϕ as a function of $(a, b)$ . (Note: The pdf of Beta distribution: $\frac{\Gamma(a + b)}{\Gamma(a) \Gamma(b)} \dot{x^{a - 1}(1 - x)^{b - 1}}$ where $\textstyle \Gamma(z) = \int_{0}^{\infty} t^{z - 1} e^{- t} dt$ is the Gamma function).

Problem 2. Let $X_{t} : = e^{B_{t} - \frac{t}{2}}$ , where $(B_{t})_{t \geq 0}$ is a standard Brownian motion with $B_{0} = 0$ . Find the distribution of $M : = \operatorname{sup}_{t \geq 0} X_{t}$
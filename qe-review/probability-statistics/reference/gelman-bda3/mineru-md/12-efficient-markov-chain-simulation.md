---
title: "Computationally Efficient Markov Chain Simulation"
source: Gelman, Carlin, Stern, Dunson, Vehtari, Rubin, Bayesian Data Analysis, 3rd ed., CRC 2013
kind: mineru-transcript-chapter
part: chapter
canonical_pdf: ../Bayesian-Data-Analysis-3rd.pdf
---

# Computationally Efficient Markov Chain Simulation

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 11 MCMC Basics](./11-basics-of-markov-chain-simulation.md) · [Ch. 13 Approximations →](./13-modal-and-distributional-approximations.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Chapter 12

# Computationally efficient Markov chain simulation

The basic Gibbs sampler and Metropolis algorithm can be seen as building blocks for more advanced Markov chain simulation algorithms that can work well for a wide range of problems. In Sections 12.1 and 12.2, we discuss reparameterizations and settings of tuning parameters to make Gibbs and Metropolis more efficient. Section 12.4 presents Hamiltonian Monte Carlo, a generalization of the Metropolis algorithm that includes 'momentum' variables so that each iteration can move farther in parameter space, thus allowing faster mixing, especially in high dimensions. We follow up in Sections 12.5 and 12.6 with an application to a hierarchical model and a discussion of our program Stan, which implements HMC for general models.

# 12.1 Efficient Gibbs samplers

# Transformations and reparameterization

The Gibbs sampler is most efficient when parameterized in terms of independent components; Figure 11.2 shows an example with highly dependent components that create slow convergence. The simplest way to reparameterize is by a linear transformation of the parameters, but posterior distributions that are not approximately normal may require special methods.

The same arguments apply to Metropolis jumps. In a normal or approximately normal setting, the jumping kernel should ideally have the same covariance structure as the target distribution, which can be approximately estimated based on the normal approximation at the mode (as we discussed in Chapter 13). Markov chain simulation of a distribution with multiple modes can be greatly improved by allowing jumps between modes.

# Auxiliary variables

Gibbs sampler computations can often be simplified or convergence accelerated by adding auxiliary variables, for example indicators for mixture distributions, as described in Chapter 22. The idea of adding variables is also called data augmentation and is often a useful conceptual and computational tool, both for the Gibbs sampler and for the EM algorithm (see Section 13.4).

# Example. Modeling the $t$ distribution as a mixture of normals

A simple but important example of auxiliary variables arises with the $t$ distribution, which can be expressed as a mixture of normal distributions, as noted in Chapter 3 and discussed in more detail in Chapter 17. We illustrate with the example of inference for the parameters $\mu, \sigma^2$ given $n$ independent data points from the $t_\nu(\mu, \sigma^2)$ distribution, where for simplicity we assume $\nu$ is known. We also assume a uniform

prior distribution on $\mu, \log \sigma$ . The $t$ likelihood for each data point is equivalent to the model,

$$
y _ {i} \sim \mathrm {N} (\mu , V _ {i})
$$

$$
V _ {i} \sim \operatorname {I n v} - \chi^ {2} (\nu , \sigma^ {2}), \tag {12.1}
$$

where the $V_{i}$ 's are auxiliary variables that cannot be directly observed. If we perform inference using the joint posterior distribution, $p(\mu, \sigma^2, V|y)$ , and then just consider the simulations for $\mu, \sigma$ , these will represent the posterior distribution under the original $t$ model.

There is no direct way to sample the parameters $\mu, \sigma^2$ in the $t$ model, but it is straightforward to perform the Gibbs sampler on $V, \mu, \sigma^2$ in the augmented model:

1. Conditional posterior distribution of each $V_{i}$ . Conditional on the data $y$ and the other parameters of the model, each $V_{i}$ is a normal variance parameter with a scaled inverse- $\chi^2$ prior distribution, and so its posterior distribution is also inverse- $\chi^2$ (see Section 2.6):

$$
V _ {i} | \mu , \sigma^ {2}, \nu , y \sim \mathrm {I n v -} \chi^ {2} \left(\nu + 1, \frac {\nu \sigma^ {2} + (y _ {i} - \mu) ^ {2}}{\nu + 1}\right).
$$

The $n$ parameters $V_{i}$ are independent in their conditional posterior distribution, and we can directly apply the Gibbs sampler by sampling from their scaled inverse- $\chi^2$ distributions.

2. Conditional posterior distribution of $\mu$ . Conditional on the data $y$ and the other parameters of the model, information about $\mu$ is supplied by the $n$ data points $y_{i}$ , each with its own variance. Combining with the uniform prior distribution on $\mu$ yields,

$$
\mu | \sigma^ {2}, V, \nu , y \sim \mathrm {N} \left(\frac {\sum_ {i = 1} ^ {n} \frac {1}{V _ {i}} y _ {i}}{\sum_ {i = 1} ^ {n} \frac {1}{V _ {i}}}, \frac {1}{\sum_ {i = 1} ^ {n} \frac {1}{V _ {i}}}\right).
$$

3. Conditional posterior distribution of $\sigma^2$ . Conditional on the data $y$ and the other parameters of the model, all the information about $\sigma$ comes from the variances $V_i$ . The conditional posterior distribution is,

$$
\begin{array}{l} p \left(\sigma^ {2} \mid \mu , V, \nu , y\right) \propto \sigma^ {- 2} \prod_ {i = 1} ^ {n} \sigma^ {\nu} e ^ {- \nu \sigma^ {2} / \left(2 V _ {i}\right)} \\ = \left(\sigma^ {2}\right) ^ {n \nu / 2 - 1} \exp \left(- \frac {\nu}{2} \sum_ {i = 1} ^ {n} \frac {1}{V _ {i}} \sigma^ {2}\right) \\ \propto \quad \text {G a m m a} \left(\sigma^ {2} \left| \frac {n \nu}{2}, \frac {\nu}{2} \sum_ {i = 1} ^ {n} \frac {1}{V _ {i}}\right), \right. \\ \end{array}
$$

from which we can sample directly.

# Parameter expansion

For some problems, the Gibbs sampler can be slow to converge because of posterior dependence among parameters that cannot simply be resolved with a linear transformation. Paradoxically, adding an additional parameter—thus performing the random walk in a larger space—can improve the convergence of the Markov chain simulation. We illustrate with the $t$ example above.

# Example. Fitting the $t$ model (continued)

In the latent-parameter form (12.1) of the $t$ model, convergence will be slow if a simulation draw of $\sigma$ is close to zero, because the conditional distributions will then cause the $V_{i}$ 's to be sampled with values near zero, and then the conditional distribution of $\sigma$ will be near zero, and so on. Eventually the simulations will get unstuck but it can be slow for some problems. We can fix things by adding a new parameter whose only role is to allow the Gibbs sampler to move in more directions and thus avoid getting stuck. The expanded model is,

$$
y _ {i} \sim \mathrm {N} (\mu , \alpha^ {2} U _ {i})
$$

$$
U _ {i} \sim \operatorname {I n v} - \chi^ {2} (\nu , \tau^ {2}),
$$

where $\alpha > 0$ can be viewed as an additional scale parameter. In this new model, $\alpha^2 U_i$ plays the role of $V_i$ in (12.1) and $\alpha \tau$ plays the role of $\sigma$ . The parameter $\alpha$ has no meaning on its own and we can assign it a noninformative uniform prior distribution on the logarithmic scale.

The Gibbs sampler on this expanded model now has four steps:

1. For each $i$ , $U_{i}$ is updated much as $V_{i}$ was before:

$$
U _ {i} | \alpha , \mu , \tau^ {2}, \nu , y \sim \operatorname {I n v -} \chi^ {2} \left(\nu + 1, \frac {\nu \tau^ {2} + ((y _ {i} - \mu) / \alpha) ^ {2}}{\nu + 1}\right).
$$

2. The mean, $\mu$ , is updated as before:

$$
\mu | \alpha , \tau^ {2}, U, \nu , y \sim \mathrm {N} \left(\frac {\sum_ {i = 1} ^ {n} \frac {1}{\alpha^ {2} U _ {i}} y _ {i}}{\sum_ {i = 1} ^ {n} \frac {1}{\alpha^ {2} U _ {i}}}, \frac {1}{\sum_ {i = 1} ^ {n} \frac {1}{\alpha^ {2} U _ {i}}}\right).
$$

3. The variance parameter $\tau^2$ , is updated much as $\sigma^2$ was before:

$$
\tau^ {2} | \alpha , \mu , U, \nu , y \sim \mathrm {G a m m a} \left(\frac {n \nu}{2}, \frac {\nu}{2} \sum_ {i = 1} ^ {n} \frac {1}{U _ {i}}\right).
$$

4. Finally, we must update $\alpha^2$ , which is easy since conditional on all the other parameters in the model it is simply a normal variance parameter:

$$
\alpha^ {2} | \mu , \tau^ {2}, U, \nu , y \sim \operatorname {I n v} - \chi^ {2} \left(n, \frac {1}{n} \sum_ {i = 1} ^ {n} \frac {(y _ {i} - \mu) ^ {2}}{U _ {i}}\right).
$$

The parameters $\alpha^2, U, \tau$ in this expanded model are not identified in that the data do not supply enough information to estimate each of them. However, the model as a whole is identified as long as we monitor convergence of the summaries $\mu$ , $\sigma = \alpha \tau$ , and $V_i = \alpha^2 U_i$ for $i = 1, \ldots, n$ . (Or, if the only goal is inference for the original $t$ model, we can simply save $\mu$ and $\sigma$ from the simulations.)

The Gibbs sampler under the expanded parameterizations converges more reliably because the new parameter $\alpha$ breaks the dependence between $\tau$ and the $V_{i}$ 's.

We discuss parameter expansion for hierarchical models in Section 15.5 and illustrate in Appendix C.

# 12.2 Efficient Metropolis jumping rules

For any given posterior distribution, the Metropolis-Hastings algorithm can be implemented in an infinite number of ways. Even after reparameterizing, there are still endless choices in

the jumping rules, $J_{t}$ . In many situations with conjugate families, the posterior simulation can be performed entirely or in part using the Gibbs sampler, which is not always efficient but generally is easy to program, as we illustrated with the hierarchical normal model in Section 11.6. For nonconjugate models we must rely on Metropolis-Hastings algorithms (either within a Gibbs sampler or directly on the multivariate posterior distribution). The choice of jumping rule then arises.

There are two main classes of simple jumping rules. The first are essentially random walks around the parameter space. These jumping rules are often normal jumping kernels with mean equal to the current value of the parameter and variance set to obtain efficient algorithms. The second approach uses proposal distributions that are constructed to closely approximate the target distribution (either the conditional distribution of a subset in a Gibbs sampler or the joint posterior distribution). In the second case the goal is to accept as many draws as possible with the Metropolis-Hastings acceptance step being used primarily to correct the approximation. There is no natural advantage to altering one parameter at a time except for potential computational savings in evaluating only part of the posterior density at each step.

It is hard to give general advice on efficient jumping rules, but some results have been obtained for random walk jumping distributions that have been useful in many problems. Suppose there are $d$ parameters, and the posterior distribution of $\theta = (\theta_{1},\dots,\theta_{d})$ , after appropriate transformation, is multivariate normal with known variance matrix $\Sigma$ . Further suppose that we will take draws using the Metropolis algorithm with a normal jumping kernel centered on the current point and with the same shape as the target distribution: that is, $J(\theta^{*}|\theta^{t - 1}) = \mathrm{N}(\theta^{*}|\theta^{t - 1},c^{2}\Sigma)$ . Among this class of jumping rules, the most efficient has scale $c\approx 2.4 / \sqrt{d}$ , where efficiency is defined relative to independent sampling from the posterior distribution. The efficiency of this optimal Metropolis jumping rule for the $d$ -dimensional normal distribution can be shown to be about $0.3 / d$ (by comparison, if the $d$ parameters were independent in their posterior distribution, the Gibbs sampler would have efficiency $1 / d$ , because after every $d$ iterations, a new independent draw of $\theta$ would be created). Which algorithm is best for any particular problem also depends on the computation time for each iteration, which in turn depends on the conditional independence and conjugacy properties of the posterior density.

A Metropolis algorithm can also be characterized by the proportion of jumps that are accepted. For the multivariate normal random walk jumping distribution with jumping kernel the same shape as the target distribution, the optimal jumping rule has acceptance rate around 0.44 in one dimension, declining to about 0.23 in high dimensions (roughly $d > 5$ ). This result suggests an adaptive simulation algorithm:

1. Start the parallel simulations with a fixed algorithm, such as a version of the Gibbs sampler, or the Metropolis algorithm with a normal random walk jumping rule shaped like an estimate of the target distribution (using the covariance matrix computed at the joint or marginal posterior mode scaled by the factor $2.4 / \sqrt{d}$ ).

2. After some number of simulations, update the Metropolis jumping rule as follows.

(a) Adjust the covariance of the jumping distribution to be proportional to the posterior covariance matrix estimated from the simulations.   
(b) Increase or decrease the scale of the jumping distribution if the acceptance rate of the simulations is much too high or low, respectively. The goal is to bring the jumping rule toward the approximate optimal value of 0.44 (in one dimension) or 0.23 (when many parameters are being updated at once using vector jumping).

This algorithm can be improved in various ways, but even in its simple form, we have found it useful for drawing posterior simulations for some problems with $d$ ranging from 1 to 50.

# Adaptive algorithms

When an iterative simulation algorithm is 'tuned'—that is, modified while it is running—care must be taken to avoid converging to the wrong distribution. If the updating rule depends on previous simulation steps, then the transition probabilities are more complicated than as stated in the Metropolis-Hastings algorithm, and the iterations will not in general converge to the target distribution. To see the consequences, consider an adaptation that moves the algorithm more quickly through flat areas of the distribution and moves more slowly when the posterior density is changing rapidly. This would make sense as a way of exploring the target distribution, but the resulting simulations would spend disproportionately less time in the flat parts of the distribution and more time in variable parts; the resulting simulation draws would not match the target distribution unless some sort of correction is applied.

To be safe, we typically run any adaptive algorithm in two phases: first, the adaptive phase, where the parameters of the algorithm can be tuned as often as desired to increase the simulation efficiency, and second, a fixed phase, where the adapted algorithm is run long enough for approximate convergence. Only simulations from the fixed phase are used in the final inferences.

# 12.3 Further extensions to Gibbs and Metropolis

# Slice sampling

A random sample of $\theta$ from the $d$ -dimensional target distribution, $p(\theta |y)$ , is equivalent to a random sample from the area under the distribution (for example, the shaded area under the curve in the illustration of rejection sampling in Figure 10.1 on page 264). Formally, sampling is performed from the $d + 1$ -dimensional distribution of $(\theta ,u)$ , where, for any $\theta$ , $p(\theta ,u|y)\propto 1$ for $u\in [0,p(\theta |y)]$ and 0 otherwise. Slice sampling refers to the application of iterative simulation algorithms on this uniform distribution. The details of implementing an effective slice sampling procedure can be complicated, but the method can be applied in great generality and can be especially useful for sampling one-dimensional conditional distributions in a Gibbs sampling structure.

# Reversible jump sampling for moving between spaces of differing dimensions

In a number of settings it is desirable to carry out a trans-dimensional Markov chain simulation, in which the dimension of the parameter space can change from one iteration to the next. One example where this occurs is in model averaging where a single Markov chain simulation is constructed that includes moves among a number of plausible models (perhaps regression models with different sets of predictors). The 'parameter space' for such a Markov chain simulation includes the traditional parameters along with an indication of the current model. A second example includes finite mixture models (see Chapter 22) in which the number of mixture components is allowed to vary.

It is still possible to perform the Metropolis algorithm in such settings, using the method of reversible jump sampling. We use notation corresponding to the case where a Markov chain moves among a number of candidate models. Let $M_{k}, k = 1,\dots ,K$ , denote the candidate models and $\theta_{k}$ the parameter vector for model $k$ with dimension $d_{k}$ . A key aspect of the reversible jump approach is the introduction of additional random variables that enable the matching of parameter space dimensions across models. Specifically if a move from $k$ to $k^{*}$ is being considered, then an auxiliary random variable $u$ with jumping distribution $J(u|k,k^{*},\theta_{k})$ is generated. A series of one-to-one deterministic functions are defined that do the dimension-matching with $(\theta_{k^*},u^*) = g_{k,k^*}(\theta_k,u)$ and $d_{k} + \dim (u) =$

$d_{k^{*}} + \dim (u^{*})$ . The dimension matching ensures that the balance condition needed to prove the convergence of the Metropolis-Hastings algorithm in Chapter 11 continues to hold here.

We present the reversible jump algorithm in general terms followed by an example. For the general description, let $\pi_k$ denote the prior probability on model $k$ , $p(\theta_k|M_k)$ the prior distribution for the parameters in model $k$ , and $p(y|\theta_k,M_k)$ the sampling distribution under model $k$ . Reversible jump Markov chain simulation generates samples from $p(k,\theta_k|y)$ using the following three steps at each iteration:

1. Starting in state $(k,\theta_{k})$ (that is, model $M_{k}$ with parameter vector $\theta_{k}$ ), propose a new model $M_{k^{*}}$ with probability $J_{k,k^{*}}$ and generate an augmenting random variable $u$ from proposal density $J(u|k,k^{*},\theta_{k})$ .

2. Determine the proposed model's parameters, $(\theta_{k^*},u^*) = g_{k,k^*}(\theta_k,u)$

3. Define the ratio

$$
r = \frac {p \left(y \mid \theta_ {k ^ {*}} , M _ {k ^ {*}}\right) p \left(\theta_ {k ^ {*}} \mid M _ {k ^ {*}}\right) \pi_ {k ^ {*}}}{p \left(y \mid \theta_ {k} , M _ {k}\right) p \left(\theta_ {k} \mid M _ {k}\right) \pi_ {k}} \frac {J _ {k ^ {*} , k} J \left(u ^ {*} \mid k ^ {*} , k , \theta_ {k ^ {*}}\right)}{J _ {k , k ^ {*}} J \left(u \mid k , k ^ {*} , \theta_ {k}\right)} \left| \frac {\nabla g _ {k , k ^ {*}} \left(\theta_ {k} , u\right)}{\nabla \left(\theta_ {k} , u\right)} \right| \tag {12.2}
$$

and accept the new model with probability $\min (r,1)$

The resulting posterior draws provide inference about the posterior probability for each model as well as the parameters under that model.

# Example. Testing a variance component in a logistic regression

The application of reversible jump sampling, especially the use of the auxiliary random variables $u$ , is seen most easily through an example.

Consider a probit regression for survival of turtles in a natural selection experiment. Let $y_{ij}$ denote the binary response for turtle $i$ in family $j$ with $\operatorname{Pr}(y_{ij} = 1) = p_{ij}$ for $i = 1, \ldots, n_j$ and $j = 1, \ldots, J$ . The weight $x_{ij}$ of the turtle is known to affect survival probability, and it is likely that familial factors also play a role. This suggests the model, $p_{ij} = \Phi(\alpha_0 + \alpha_1 x_{ij} + b_j)$ . It is natural to model the $b_j$ 's as exchangeable family effects, $b_j \sim N(0, \tau^2)$ . The prior distribution $p(\alpha_0, \alpha_1, \tau)$ is not central to this discussion so we do not discuss it further here.

Suppose for the purpose of this example that we seek to test whether the variance component $\tau$ is needed by running a Markov chain that considers the model with and without the varying intercepts, $b_{j}$ . As emphasized in Chapters 6-7, we much prefer to fit the model with the variance parameter and assess its importance by examining its posterior distribution. However, it might be of interest to consider the model that allows $\tau = 0$ as a discrete possibility, and we choose this example to illustrate the reversible jump algorithm.

Let $M_0$ denote the model with $\tau = 0$ (no variance component) and $M_1$ denote the model including the variance component. We use numerical integration to compute the marginal likelihood $p(y|\alpha_0,\alpha_1,\tau)$ for model $M_1$ . Thus the $b_j$ 's are not part of the iterative simulation under model $M_1$ . The reversible jump algorithm takes $\pi_0 = \pi_1 = 0.5$ and $J_{0,0} = J_{0,1} = J_{1,0} = J_{1,1} = 0.5$ . At each step we either take a Metropolis step within the current model (with probability 0.5) or propose a jump to the other model. If we are in model 0 and are proposing a jump to model 1, then the auxiliary random variable is $u\sim J(u)$ (scaled inverse- $\chi^2$ in this case) and we define the parameter vector for model 1 by setting $\tau^2 = u$ and leaving $\alpha_0$ and $\alpha_{1}$ as they were in the previous iteration. The ratio (12.2) is then

$$
r = \frac {p (y | \alpha_ {0} , \alpha_ {1} , \tau^ {2} , M _ {1}) p (\tau^ {2})}{p (y | \alpha_ {0} , \alpha_ {1} , M _ {0}) J (\tau^ {2})},
$$

because the prior distributions on $\alpha$ and the models cancel, and the Jacobian of the transformation is 1. The candidate model is accepted with probability $\min(r, 1)$ .

There is no auxiliary random variable for going from model 1 to model 0. In that case we merely set $\tau = 0$ , and the acceptance probability is the reciprocal of the above. In the example we chose $J(\tau^2)$ based on a pilot analysis of model $M_1$ (an inverse- $\chi^2$ distribution matching the posterior mean and variance).

# Simulated tempering and parallel tempering

Multimodal distributions can pose special problems for Markov chain simulation. The goal is to sample from the entire posterior distribution and this requires sampling from each of the modes with significant posterior probability. Unfortunately it is easy for Markov chain simulations to remain in the neighborhood of a single mode for a long period of time. This occurs primarily when two (or more) modes are separated by regions of extremely low posterior density. Then it is difficult to move from one mode to the other because, for example, Metropolis jumps to the region between the two modes are rejected.

Simulated tempering is one strategy for improving Markov chain simulation performance in this case. As usual, we take $p(\theta | y)$ to be the target density. The algorithm works with a set of $K + 1$ distributions $p_{k}(\theta | y), k = 0, 1, \ldots, K$ , where $p_{0}(\theta | u) = p(\theta | y)$ , and $p_{1}, \ldots, p_{K}$ are distributions with the same basic shape but with improved opportunities for mixing across the modes, and each of these distributions comes with its own sampler (which might, for example, be a separately tuned Metropolis or HMC algorithm). As usual, the distributions $p_{k}$ need not be fully specified; it is only necessary that the user can compute unnormalized density functions $q_{k}$ , where $q_{k}(\theta) = p_{k}(\theta | y)$ multiplied by a constant which can depend on $y$ and $k$ but not on the parameters $\theta$ . (We write $q_{k}(\theta)$ , but with the understanding that, since the $q_{k}$ 's are built for a particular posterior distribution $p(\theta | y)$ , they can in general depend on $y$ .)

One choice for the ladder of unnormalized densities $q_{k}$ is

$$
q _ {k} (\theta) = p (\theta) ^ {1 / T _ {k}},
$$

for a set of 'temperature' parameters $T_{k} > 0$ . Setting $T_{k} = 1$ reduces to the original density, and large values of $T_{k}$ produce less highly peaked modes. (That is, 'high temperatures' add 'thermal noise' to the system.) A single composite Markov chain simulation is then developed that randomly moves across the $K + 1$ distributions, with $T_{0}$ set to 1 so that $q_{0}(\theta) \propto p(\theta | y)$ . The state of the composite Markov chain at iteration $t$ is represented by the pair $(\theta^t, s^t)$ , where $s^t$ is an integer identifying the distribution used at iteration $t$ . Each iteration of the composite Markov chain simulation consists of two steps:

1. A new value $\theta^{t + 1}$ is selected using the Markov chain simulation with stationary distribution $q_{s^t}$ .   
2. A jump from the current sampler $s^t$ to an alternative sampler $j$ is proposed with probability $J_{s^t,j}$ . We accept the move with probability $\min(r,1)$ , where

$$
r = \frac {c _ {j} q _ {j} (\theta^ {t + 1}) J _ {j , s ^ {t}}}{c _ {s ^ {t}} q _ {s ^ {t}} (\theta^ {t + 1}) J _ {s ^ {t} , j}}.
$$

The constants $c_k$ for $k = 0,1,\ldots ,K$ are set adaptively (that is, assigned initial values and then altered after the simulation has run a while) to approximate the inverses of the normalizing constants for the distributions defined by the unnormalized densities $q_{k}$ . The chain will then spend an approximately equal amount of time in each sampler.

At the end of the Markov chain simulation, only those values of $\theta$ simulated from the target distribution $(q_0)$ are used to obtain posterior inferences.

Parallel tempering is a variant of the above algorithm in which $K + 1$ parallel chains

are simulated, one for each density $q_{k}$ in the ladder. Each chain moves on its own but with occasional flipping of states between chains, with a Metropolis accept-reject rule similar to that in simulated tempering. At convergence, the simulations from chain 0 represent draws from the target distribution.

Other auxiliary variable methods have been developed that are tailored to particular structures of multivariate distributions. For example, highly correlated variables such as arise in spatial statistics can be simulated using multigrid sampling, in which computations are done alternately on the original scale and on coarser scales that do not capture the local details of the target distribution but allow faster movement between states.

# Particle filtering, weighting, and genetic algorithms

Particle filtering describes a class of simulation algorithms involving parallel chains, in which existing chains are periodically tested and allowed to die, live, or split, with the rule set up so that chains in lower-probability areas of the posterior distribution are more likely to die and those in higher-probability areas are more likely to split. The idea is that a large number of chains can explore the parameter space, with the birth/death/splitting steps allowing the ensemble of chains to more rapidly converge to the target distribution. The probabilities of the different steps are set up so that the stationary distribution of the entire process is the posterior distribution of interest.

A related idea is weighting, in which a simulation is performed that converges to a specified but wrong distribution, $g(\theta)$ , and then the final draws are weighted by $p(\theta | y) / g(\theta)$ . In more sophisticated implementations, this reweighting can be done throughout the simulation process. It can sometimes be difficult or expensive to sample from $p(\theta | y)$ and faster to work with a good approximation $g$ if available. Weighting can be combined with particle filtering by using the weights in the die/live/split probabilities.

Genetic algorithms are similar to particle filtering in having multiple chains that can live or die, but with the elaboration that the updating algorithms themselves can change ('mutate') and combine ('sexual reproduction'). Many of these ideas are borrowed from the numerical analysis literature on optimization but can also be effective in a posteriori simulation setting in which the goal is to converge to a distribution rather than to a single best value.

# 12.4 Hamiltonian Monte Carlo

An inherent inefficiency in the Gibbs sampler and Metropolis algorithm is their random walk behavior—as illustrated in Figures 11.1 and 11.2 on pages 276 and 277, the simulations can take a long time zigging and zagging while moving through the target distribution. Reparameterization and efficient jumping rules can improve the situation (see Sections 12.1 and 12.2), but for complicated models this local random walk behavior remains, especially for high-dimensional target distributions.

Hamiltonian Monte Carlo (HMC) borrows an idea from physics to suppress the local random walk behavior in the Metropolis algorithm, thus allowing it to move much more rapidly through the target distribution. For each component $\theta_{j}$ in the target space, Hamiltonian Monte Carlo adds a 'momentum' variable $\phi_{j}$ . Both $\theta$ and $\phi$ are then updated together in a new Metropolis algorithm, in which the jumping distribution for $\theta$ is determined largely by $\phi$ . Each iteration of HMC proceeds via several steps, during which the position and momentum evolve based on rules imitating the behavior of position the steps can move rapidly where possible through the space of $\theta$ and even can turn corners in parameter space to preserve the total 'energy' of the trajectory. Hamiltonian Monte Carlo is also called hybrid Monte Carlo because it combines MCMC and deterministic simulation methods.

In HMC, the posterior density $p(\theta | y)$ (which, as usual, needs only be computed up

to a multiplicative constant) is augmented by an independent distribution $p(\phi)$ on the momenta, thus defining a joint distribution, $p(\theta, \phi | y) = p(\phi) p(\theta | y)$ . We simulate from the joint distribution but we are only interested in the simulations of $\theta$ ; the vector $\phi$ is thus an auxiliary variable, introduced only to enable the algorithm to move faster through the parameter space.

In addition to the posterior density (which, as usual, needs to be computed only up to a multiplicative constant), HMC also requires the gradient of the log-posterior density. In practice the gradient must be computed analytically; numerical differentiation requires too many function evaluations to be computationally effective. If $\theta$ has $d$ dimensions, this gradient is $\frac{d\log p(\theta|y)}{d\theta} = \left(\frac{d\log p(\theta|y)}{d\theta_1},\dots,\frac{d\log p(\theta|y)}{d\theta_d}\right)$ . For most of the models we consider in this book, this vector is easy to determine analytically and then program. When writing and debugging the program, we recommend also programming the gradient numerically (using finite differences of the log-posterior density) as a check on the programming of the analytic gradients. If the two subroutines do not return identical results to several decimal places, there is likely a mistake somewhere.

# The momentum distribution, $p(\phi)$

It is usual to give $\phi$ a multivariate normal distribution (recall that $\phi$ has the same dimension as $\theta$ ) with mean 0 and covariance set to a prespecified 'mass matrix' $M$ (so called by analogy to the physical model of Hamiltonian dynamics). To keep it simple, we commonly use a diagonal mass matrix, $M$ . If so, the components of $\phi$ are independent, with $\phi_j \sim \mathrm{N}(0, M_{jj})$ for each dimension $j = 1, \ldots, d$ . It can be useful for $M$ to roughly scale with the inverse covariance matrix of the posterior distribution, $(\mathrm{var}(\theta | y))^{-1}$ , but the algorithm works in any case; better scaling of $M$ will merely make HMC more efficient.

# The three steps of an HMC iteration

HMC proceeds by a series of iterations (as in any Metropolis algorithm), with each iteration having three parts:

1. The iteration begins by updating $\phi$ with a random draw from its posterior distribution—which, as specified, is the same as its prior distribution, $\phi \sim \mathrm{N}(0,M)$ .   
2. The main part of the Hamiltonian Monte Carlo iteration is a simultaneous update of $(\theta, \phi)$ , conducted in an elaborate but effective fashion via a discrete mimicking of physical dynamics. This update involves $L$ 'leapfrog steps' (to be defined in a moment), each scaled by a factor $\epsilon$ . In a leapfrog step, both $\theta$ and $\phi$ are changed, each in relation to the other. The $L$ leapfrog steps proceed as follows:

Repeat the following steps $L$ times:

(a) Use the gradient (the vector derivative) of the log-posterior density of $\theta$ to make a half-step of $\phi$ :

$$
\phi \gets \phi + \frac {1}{2} \epsilon \frac {d \log p (\theta | y)}{d \theta}.
$$

(b) Use the 'momentum' vector $\phi$ to update the 'position' vector $\theta$ :

$$
\theta \gets \theta + \epsilon M ^ {- 1} \phi .
$$

Again, $M$ is the mass matrix, the covariance of the momentum distribution $p(\phi)$ . If $M$ is diagonal, the above step amounts to scaling each dimension of the $\theta$ update. (It might seem redundant to include $\epsilon$ in the above expression: why not simply absorb it into $M$ , which can itself be set by the user? The reason is that it can be convenient in tuning the algorithm to alter $\epsilon$ while keeping $M$ fixed.)

(c) Again use the gradient of $\theta$ to half-update $\phi$ :

$$
\phi \gets \phi + \frac {1}{2} \epsilon \frac {d \log p (\theta | y)}{d \theta}.
$$

Except at the first and last step, updates (c) and (a) above can be performed together. The stepping thus starts with a half-step of $\phi$ , then alternates $L - 1$ full steps of the parameter vector $\theta$ and the momentum vector $\phi$ , and concludes with a half-step of $\phi$ . This algorithm (called a 'leapfrog' because of the splitting of the momentum updates into half steps) is a discrete approximation to physical Hamiltonian dynamics in which both position and momentum evolve in continuous time.

In the limit of $\epsilon$ near zero, the leapfrog algorithm preserves the joint density $p(\theta, \phi | y)$ . We will not give the proof, but here is some intuition. Suppose the current value of $\theta$ is at a flat area of the posterior. Then $\frac{d \log p(\theta | y)}{d\theta}$ will be zero, and in step 2 above, the momentum will remain constant. Thus the leapfrog steps will skate along in $\theta$ -space with constant velocity. Now suppose the algorithm moves toward an area of low posterior density. Then $\frac{d \log p(\theta | y)}{d\theta}$ will be negative in this direction, thus in step 2 inducing a decrease in the momentum in the direction of movement. As the leapfrog steps continue to move into an area of lower density in $\theta$ -space, the momentum continues to decrease. The decrease in $\log p(\theta | y)$ is matched (in the limit $\epsilon \to 0$ , exactly so) by a decrease in the 'kinetic energy,' $\log p(\phi)$ . And if iterations continue to move in the direction of decreasing density, the leapfrog steps will slow to zero and then back down or curve around the dip. Now consider the algorithm heading in a direction in which the posterior density is increasing. Then $\frac{d \log p(\theta | y)}{d\theta}$ will be positive in that direction, leading in step 2 to an increase in momentum in that direction. As $\log p(\theta | y)$ increases, $\log p(\phi)$ increases correspondingly until the trajectory eventually moves past or around the mode and then starts to slow down.

For finite $\epsilon$ , the joint density $p(\theta, \phi | y)$ does not remain entirely constant during the leapfrog steps but it will vary only slowly if $\epsilon$ is small. For reasons we do not discuss here, the leapfrog integrator has the pleasant property that combining $L$ steps of error $\delta$ does not produce $L\delta$ error, because the dynamics of the algorithm tend to send the errors weaving back and forth around the exact value that would be obtained by a continuous integration. Keeping the discretization error low is important because of the next part of the HMC algorithm, the accept/reject step.

3. Label $\theta^{t - 1},\phi^{t - 1}$ as the value of the parameter and momentum vectors at the start of the leapfrog process and $\theta^{*},\phi^{*}$ as the value after the $L$ steps. In the accept-reject step, we compute

$$
r = \frac {p \left(\theta^ {*} \mid y\right) p \left(\phi^ {*}\right)}{p \left(\theta^ {t - 1} \mid y\right) p \left(\phi^ {t - 1}\right)}. \tag {12.3}
$$

4. Set

$$
\theta^ {t} = \left\{ \begin{array}{l l} \theta^ {*} & \text {w i t h p r o b a b i l i t y m i n} (r, 1) \\ \theta^ {t - 1} & \text {o t h e r w i s e .} \end{array} \right.
$$

Strictly speaking it would be necessary to set $\phi^t$ as well, but since we do not care about $\phi$ in itself, and it gets immediately updated at the beginning of the next iteration (see step 1 above), so there is no need to keep track of it after the accept/reject step.

As with any other MCMC algorithm, we repeat these iterations until approximate convergence, as assessed by $\hat{R}$ being near 1 and the effective sample size being large enough for all quantities of interest; see Section 11.4.

Restricted parameters and areas of zero posterior density

HMC is designed to work with all-positive target densities. If at any point during an iteration the algorithm reaches a point of zero posterior density (for example, if the steps go below zero when updating a parameter that is restricted to be positive), we stop the stepping and give up, spending another iteration at the previous value of $\theta$ . The resulting algorithm preserves detailed balance and stays in the positive zone.

An alternative is 'bouncing,' where again the algorithm checks that the density is positive after each step and, if not, changes the sign of the momentum to return to the direction in which it came. This again preserves detailed balance and is typically more efficient than simply rejecting the iteration, for example with a hard boundary for a parameter that is restricted to be positive.

Another way to handle bounded parameters is via transformation, for example taking the logarithm of a parameter constrained to be positive or the logit for a parameter constrained to fall between 0 and 1, or more complicated joint transformations for sets of parameters that are constrained (for example, if $\theta_{1} < \theta_{2} < \theta_{3}$ or if $\alpha_{1} + \alpha_{2} + \alpha_{3} + \alpha_{4} = 1$ ). One must then work out the Jacobian of the transformation and use it to determine the log posterior density and its gradient in the new space.

# Setting the tuning parameters

HMC can be tuned in three places: (i) the probability distribution for the momentum variables $\phi$ (which, in our implementation requires specifying the diagonal elements of a covariance matrix, that is, a scale parameter for each of the $d$ dimensions of the parameter vector), (ii) the scaling factor $\epsilon$ of the leapfrog steps, and (iii) the number of leapfrog steps $L$ per iteration.

As with the Metropolis algorithm in general, these tuning parameters can be set ahead of time, or they can be altered completely at random (a strategy which can sometimes be helpful in keeping an algorithm from getting stuck), but one has to take care when altering them given information from previous iterations. Except in some special cases, adaptive updating of the tuning parameters alters the algorithm so that it no longer converges to the target distribution. So when we set the tuning parameters, we do so during the warm-up period: that is, we start with some initial settings, then run HMC for a while, then reset the tuning parameters based on the iterations so far, then discard the early iterations that were used for warm-up. This procedure can be repeated if necessary, as long as the saved iterations use only simulations after the last setting of the tuning parameters.

How, then, to set the parameters that govern HMC? We start by setting the scale parameters for the momentum variables to some crude estimate of the scale of the target distribution. (One can also incorporate covariance information but here we will assume a diagonal covariance matrix so that all that is required is the vector of scales.) By default we could simply use the identity matrix.

We then set the product $\epsilon L$ to 1. This roughly calibrates the HMC algorithm to the 'radius' of the target distribution; that is, $L$ steps, each of length $\epsilon$ times the already-chosen scale of $\phi$ , should roughly take you from one side of the distribution to the other. A default starting point could be $\epsilon = 0.1$ , $L = 10$ .

Finally, theory suggests that HMC is optimally efficient when its acceptance rate is approximately $65\%$ (based on an analysis similar to that which finds an optimal $23\%$ acceptance rate for the multidimensional Metropolis algorithm). The theory is based on all sorts of assumptions but seems like a reasonable guideline for optimization in practice. For now we recommend a simple adaptation in which HMC is with its initial settings and then adapted if the average acceptance probability (as computed from the simulations so far) is not close to $65\%$ . If the average acceptance probability is lower, then the leapfrog jumps

are too ambitious and you should lower $\epsilon$ and correspondingly increase $L$ (so their product remains 1). Conversely, if the average acceptance probability is much higher than $65\%$ , then the steps are too cautious and we recommend raising $\epsilon$ and lowering $L$ (not forgetting that $L$ must be an integer). These rules do not solve all problems, and it should be possible to develop diagnostics to assess the efficiency of HMC to allow for more effective adaptation of the tuning parameters.

# Varying the tuning parameters during the run

As with MCMC tuning more generally, any adaptation can go on during the warm-up period, but adaptation performed later on, during the simulations that will be used for inference, can cause the algorithm to converge to the wrong distribution. For example, suppose we were to increase the step size $\epsilon$ after high-probability jumps and decrease $\epsilon$ when the acceptance probability is low. Such an adaptation seems appealing but would destroy the detailed balance (that is, the property of the algorithm that the flow of probability mass from point A to B is the same as from B to A, for any points A and B in the posterior distribution) that is used to prove that the posterior distribution of interest is the stationary distribution of the Markov chain.

Completely random variation of $\epsilon$ and $L$ , however, causes no problems with convergence and can be useful. If we randomly vary the tuning parameters (within specified ranges) from iteration to iteration while the simulation is running, the algorithm has a chance to take long tours through the posterior distribution when possible and make short movements where the iterations are stuck in a cramped part of the space. The price for this variation is some potential loss of optimality, as the algorithm will also take short steps where long tours would be feasible and try for long steps where the space is too cramped for such jumps to be accepted.

# Locally adaptive HMC

For difficult HMC problems, it would be desirable for the tuning parameters to vary as the algorithm moves through the posterior distribution, with the mass matrix $M$ scaling to the local curvature of the log density, the step size $\epsilon$ getting smaller in areas where the curvature is high, and the number of steps $L$ being large enough for the trajectory to move far through the posterior distribution without being so large that the algorithm circles around and around. To this end, researchers have developed extensions of HMC that adapt without losing detailed balance. These algorithms are more complicated and can require more computations per iteration but can converge more effectively for complicated distributions. We describe two such algorithms here but without giving the details.

The no-U-turn sampler. In the no-U-turn sampler, the number of steps is determined adaptively at each iteration. Instead of running for a fixed number of steps, $L$ , the trajectory in each iteration continues until it turns around (more specifically, until we reach a negative value of the dot product between the momentum variable $\phi$ and the distance traveled from the position $\theta$ at the start of the iteration). This rule essentially sends the trajectory as far as it can go during that iteration. If such a rule is applied alone, the simulations will not converge to the desired target distribution. The full no-U-turn sampler is more complicated, going backward and forward along the trajectory in a way that satisfies detailed balance. Along with this algorithm comes a procedure for adaptively setting the mass matrix $M$ and step size $\epsilon$ ; these parameters are tuned during the warm-up phase and then held fixed during the later iterations which are kept for the purpose of posterior inference.

Riemannian adaptation. Another approach to optimization is Riemannian adaptation, in which the mass matrix $M$ is set to conform with the local curvature of the log posterior

density at each step. Again, the local adaptation allows the sampler to move much more effectively but the steps of the algorithm need to become more complicated to maintain detailed balance. Riemannian adaptation can be combined with the no-U-turn sampler.

Neither of the above extensions solves all the problems with HMC. The no-U-turn sampler is self-tuning and computationally efficient but, like ordinary Hamiltonian Monte Carlo, has difficulties with very short-tailed and long-tailed distributions, in both cases having difficulties transitioning from the center to the tails, even in one dimension. Riemannian adaptation handles varying curvature and non-exponentially tailed distributions but is impractical in high dimensions.

# Combining HMC with Gibbs sampling

There are two ways in which ideas of the Gibbs sampler fit into Hamiltonian Monte Carlo. First, it can make sense to partition variables into blocks, either to simplify computation or to speed convergence. Consider a hierarchical model with $J$ groups, with parameter vector $\theta = (\eta^{(1)},\eta^{(2)},\dots,\eta^{(J)},\phi)$ , where each of the $\eta^{(j)}$ 's is itself a vector of parameters corresponding to the model for group $j$ and $\phi$ is a vector of hyperparameters, and for which the posterior distribution can be factored as, $p(\theta |y)\propto p(\phi)\prod_{j = 1}^{J}p(\eta^{(j)}|\phi)p(y^{(j)}|\eta^{(j)})$ . In this case, even if it is possible to update the entire vector $\theta$ at once using HMC, it may be more effective—in computation speed or convergence—to cycle through $J + 1$ updating steps, altering each $\eta^{(j)}$ and then $\phi$ during each cycle. This way we only have to work with at most one of the likelihood factors, $p(y^{(j)}|\eta^{(j)})$ , at each step. Parameter expansion can be used to facilitate quicker mixing through the joint distribution.

The second way in which Gibbs sampler principles can enter HMC is through the updating of discrete variables. Hamiltonian dynamics are only defined on continuous distributions. If some of the parameters in a model are defined on discrete spaces (for example, latent indicators for mixture components, or a parameter that follows a continuous distribution but has a positive probability of being exactly zero), they can be updated using Gibbs steps or, more generally, one-dimensional updates such as Metropolis or slice sampling (see Section 12.3). The simplest approach is to partition the space into discrete and continuous parameters, then alternate HMC updates on the continuous subspace and Gibbs, Metropolis, or slice updates on the discrete components.

# 12.5 Hamiltonian dynamics for a simple hierarchical model

We illustrate the tuning of Hamiltonian Monte Carlo with the model for the educational testing experiments described in Chapter 5. HMC is not necessary in this problem—the Gibbs sampler works just fine, especially after the parameter expansion which allows more efficient movement of the hierarchical variance parameter (see Section 12.1)—but it is helpful to understand the new algorithm in a simple example. Here we go through all the steps of the algorithm. The code appears in Section C.4, starting on page 601.

In order not to overload our notation, we label the eight school effects (defined as $\theta_{j}$ in Chapter 5) as $\alpha_{j}$ ; the full vector of parameters $\theta$ then has $d = 10$ dimensions, corresponding to $\alpha_{1},\ldots ,\alpha_{8},\mu ,\tau$ .

Gradients of the log posterior density. For HMC we need the gradients of the log posterior density for each of the ten parameters, a set of operations that are easily performed with the normal distributions of this model:

$$
\frac {d \log p (\theta | y)}{d \alpha_ {j}} = - \frac {\alpha_ {j} - y _ {j}}{\sigma_ {j} ^ {2}} - \frac {\alpha_ {j} - \mu}{\tau^ {2}}, \mathrm {f o r} j = 1, \ldots , 8,
$$

$$
\frac {d \log p (\theta | y)}{d \mu} = - \sum_ {j = 1} ^ {J} \frac {\mu - \alpha_ {j}}{\tau^ {2}},
$$

$$
\frac {d \log p (\theta | y)}{d \tau} = - \frac {J}{\tau} + \sum_ {j = 1} ^ {J} \frac {(\mu - \alpha_ {j}) ^ {2}}{\tau^ {3}}.
$$

As a debugging step we also compute the gradients numerically using finite differences of $\pm 0.0001$ on each component of $\theta$ . Once we have checked that the two gradient routines yield identical results, we use the analytic gradient in the algorithm as it is faster to compute.

The mass matrix for the momentum distribution. As noted above, we want to scale the mass matrix to roughly match the posterior distribution. That said, we typically only have a vague idea of the posterior scale before beginning our computation; thus this scaling is primarily intended to forestall the problems that would arise if there are gross disparities in the scaling of different dimensions. In this case, after looking at the data in Table 5.2 we assign a rough scale of 15 for each of the parameters in the model and crudely set the mass matrix to $\mathrm{Diag}(15,\ldots ,15)$ .

Starting values. We run 4 chains of HMC with starting values drawn at random to crudely match the scale of the parameter space, in this case following the idea above and drawing the ten parameters in the model from independent $\mathrm{N}(0,15^2)$ distributions.

Tuning $\epsilon$ and $L$ . To give the algorithm more flexibility, we do not set $\epsilon$ and $L$ to fixed values. Instead we choose central values $\epsilon_0, L_0$ and then at each step draw $\epsilon$ and $L$ independently from uniform distributions on $(0, 2\epsilon_0)$ and $[1, 2L_0]$ , respectively (with the distribution for $L$ being discrete uniform, as $L$ must be an integer). We have no reason to think this particular jittering is ideal; it is just a simple way to vary the tuning parameters in a way that does not interfere with convergence of the algorithm. Following the general advice given above, we start by setting $\epsilon_0 L_0 = 1$ and $L_0 = 10$ . We simulate 4 chains for 20 iterations just to check that the program runs without crashing.

We then do some experimentation. We first run 4 chains for 100 iterations and see that the inferences are reasonable (no extreme values, as can sometimes happen when there is poor convergence or a bug in the program) but not yet close to convergence, with several values of $\widehat{R}$ that are more than 2. The average acceptance probabilities of the 4 chains are 0.23, 0.59, 0.02, and 0.57, well below $65\%$ , so we suspect the step size is too large.

We decrease $\epsilon_0$ to 0.05, increase $L_{0}$ to 20 (thus keeping $\epsilon_0 L_0$ constant), and rerun the 4 chains for 100 iterations, now getting acceptance rates of 0.72,, 0.87, 0.33, and 0.55, with chains still far from mixing. At this point we increase the number of simulations to 1000. The simulations now are close to convergence, with $\widehat{R}$ less than 1.2 for all parameters, and average acceptance probabilities are more stable, at 0.52, 0.68, 0.75, and 0.51. We then run 4 chains at 10,000 simulations at these tuning parameters and achieve approximate convergence, with $\widehat{R}$ less than 1.1 for all parameters.

In this particular example, HMC is unnecessary, as the Gibbs sampler works fine on an appropriately transformed scale. In larger and more difficult problems, however, Gibbs and Metropolis can be too slow, while HMC can move effectively efficiently move through high-dimensional parameter spaces.

# Transforming to $\log \tau$

When running HMC on a model with constrained parameters, the algorithm can go outside the boundary, thus wasting some iterations. One remedy is to transform the space to be unconstrained. In this case, the simplest way to handle the constraint $\tau > 0$ is to transform to $\log \tau$ . We then must alter the algorithm in the following ways:

1. We redefine $\theta$ as $(\alpha_{1},\dots ,\alpha_{8},\mu ,\log \tau)$ and do all jumping on this new space.   
2. The (unnormized) posterior density $p(\theta | y)$ is multiplied by the Jacobian, $\tau$ , so we add $\log \tau$ to the log posterior density used in the calculations.   
3. The gradient of the log posterior density changes in two ways: first, we need to account for the new term added just above; second, the derivative for the last component of the gradient is now with respect to $\log \tau$ rather than $\tau$ and so must be multiplied by the Jacobian, $\tau$ :

$$
\frac {d \log p (\theta | y)}{d \log \tau} = - (J - 1) + \sum_ {j = 1} ^ {J} \frac {(\mu - \alpha_ {j}) ^ {2}}{\tau^ {2}}.
$$

4. We change the mass matrix to account for the transformation. We keep $\alpha_{1},\ldots ,\alpha_{8},\mu$ with masses of 15 (roughly corresponding to a posterior distribution with a scale of 15 in each of these dimensions) but set the mass of $\log \tau$ to 1.   
5. We correspondingly change the initial values by drawing the first nine parameters from independent $\mathrm{N}(0,15^2)$ distributions and $\log \tau$ from $\mathrm{N}(0,1)$ .

HMC runs as before. Again, we start with $\epsilon = 0.1$ and $L = 10$ and then adjust to get a reasonable acceptance rate.

# 12.6 Stan: developing a computing environment

Hamiltonian Monte Carlo takes a bit of effort to program and tune. In more complicated settings, though, we have found HMC to be faster and more reliable than basic Markov chain simulation algorithms.

To mitigate the challenges of programming and tuning, we have developed a computer program, Stan (Sampling through adaptive neighborhoods) to automatically apply HMC given a Bayesian model. The key steps of the algorithm are data and model input, computation of the log posterior density (up to an arbitrary constant that cannot depend on the parameters in the model) and its gradients, a warm-up phase in which the tuning parameters are set, an implementation of the no-U-turn sampler to move through the parameter space, and convergence monitoring and inferential summaries at the end.

We briefly describe how each of these steps is done in Stan. Instructions and examples for running the program appear in Appendix C.

# Entering the data and model

Each line of a Stan model goes into defining the log probability density of the data and parameters, with code for looping, conditioning, computation of intermediate quantities, and specification of terms of the log joint density. Standard distributions such as the normal, gamma, binomial, Poisson, and so forth, are preprogrammed, and arbitrary distributions can be entered by directly programming the log density. Algebraic manipulations and functions such as exp and logit can also be included in the specification; it is all just sent into $\mathrm{C}++$ .

To compute gradients, Stan uses automatic analytic differentiation, using an algorithm that parses arbitrary $\mathrm{C}++$ expressions and then applies basic rules of differential calculus to construct a $\mathrm{C}++$ program for the gradient. For computational efficiency, we have preprogrammed the gradients for various standard statistical expressions to make up some of this difference. We use special scalar variable classes that evaluate the function and at the same time construct the full expression tree used to generate the log probability. Then the reverse pass walks backward down the expression tree (visiting every dependent node before any node it depends on), propagating partial derivatives by the chain rule. The walk over the expression tree implicitly employs dynamic programming to minimize the number of

calculations. The resulting autodifferentiation is typically much faster than computing the gradient numerically via finite differences.

In addition to the data, parameters, and model statements, a Stan call also needs the number of chains, the number of iterations per chain, and various control parameters that can be set by default. Starting values can be supplied or else they are generated from preset default random variables.

# Setting tuning parameters in the warm-up phase

As noted above, it can be tricky to tune Hamiltonian Monte Carlo for any particular example. The no-U-turn sampler helps with this, as it eliminates the need to assign the number of steps $L$ , but we still need to set the mass matrix $M$ and step size $\epsilon$ . During a prespecified warm-up phase of the simulation, Stan adaptively alters $M$ and $\epsilon$ using ideas from stochastic optimization in numerical analysis. This adaptation will not always work—for distributions with varying curvature, there will not in general be any single good set of tuning parameters—and if the simulation is having difficulty converging, it can make sense to look at the values of $M$ and $\epsilon$ chosen for different chains to better understand what is happening. Convergence can sometimes be improved by reparameterization. More generally, it could make sense to have different tuning parameters for different areas of the distribution—this is related to ideas such as Riemannian adaptation, which at the time of this writing we are incorporating into Stan.

# No-U-turn sampler

Stan runs HMC using the no-U-turn sampler, preprocessing where possible by transforming bounded variables to put them on an unconstrained scale. For complicated constraints this cannot always be done automatically and then it can make sense for the user to reparameterize in writing the model. While running, Stan keeps track of acceptance probabilities (as well as the simulations themselves), which can be helpful in getting inside the algorithm if there are problems with mixing of the chains.

# Inferences and postprocessing

Stan produces multiple sequences of simulations. For our posterior inferences we discard the iterations from the warm-up period (but we save them as possibly of diagnostic use if the algorithm is not mixing well) and compute $\widehat{R}$ and $n_{\mathrm{eff}}$ as described in Section 11.4.

# 12.7 Bibliographic note

For the relatively simple ways of improving simulation algorithms mentioned in Sections 12.1 and 12.2, Tanner and Wong (1987) discuss data augmentation and auxiliary variables, and Hills and Smith (1992) and Roberts and Sahu (1997) discuss different parameterizations for the Gibbs sampler. Higdon (1998) discusses some more complicated auxiliary variable methods, and Liu and Wu (1999), van Dyk and Meng (2001), and Liu (2003) present different approaches to parameter expansion. The results on acceptance rates for efficient Metropolis jumping rules appear in Gelman, Roberts, and Gilks (1995); more general results for Metropolis-Hastings algorithms appear in Roberts and Rosenthal (2001) and Brooks, Giudici, and Roberts (2003).

Gelfand and Sahu (1994) discuss the difficulties of maintaining convergence to the target distribution when adapting Markov chain simulations, as discussed at the end of Section 12.2. Andrieu and Robert (2001) and Andrieu and Thoms (2008) consider adaptive Markov chain Monte Carlo algorithms.

Slice sampling is discussed by Neal (2003), and simulated tempering is discussed by Geyer and Thompson (1993) and Neal (1996b). Besag et al. (1995) and Higdon (1998) review several ideas based on auxiliary variables that have been useful in high-dimensional problems arising in genetics and spatial models.

Reversible jump MCMC was introduced by Green (1995); see also Richardson and Green (1997) and Brooks, Giudici, and Roberts (2003) for more on trans-dimensional MCMC.

Mykland, Tierney, and Yu (1994) discuss an approach to MCMC in which the algorithm has regeneration points, or subspaces of $\theta$ , so that if a finite sequence starts and ends at a regeneration point, it can be considered as an exact (although dependent) sample from the target distribution. Propp and Wilson (1996) and Fill (1998) introduce a class of MCMC algorithms called perfect simulation in which, after a certain number of iterations, the simulations are known to have exactly converged to the target distribution.

The book by Liu (2001) covers a wide range of advanced simulation algorithms including those discussed in this chapter. The monograph by Neal (1993) also overviews many of these methods. Hamiltonian Monte Carlo was introduced by Duane et al. (1987) in the physics literature and Neal (1994) for statistics problems. Neal (2011) reviews HMC, Hoffman and Gelman (2013) introduce the no-U-turn sampler, and Girolami and Calderhead (2011) introduce Riemannian updating; see also Betancourt and Stein (2011) and Betancourt (2012, 2013). Romeel (2011) explains how leapfrog steps tend to reduce discretization error in HMC. Leimkuhler and Reich (2004) discuss the mathematics in more detail. Griewank and Walther (2008) is a standard reference on algorithmic differentiation.

# 12.8 Exercises

1. Efficient Metropolis jumping rules: Repeat the computation for Exercise 11.2 using the adaptive algorithm given in Section 12.2.   
2. Simulated tempering: Consider the Cauchy model, $y_{i} \sim \mathrm{Cauchy}(\theta, 1), i = 1, \ldots, n$ , with two data points, $y_{1} = 1.3, y_{2} = 15.0$ .

(a) Graph the posterior density.   
(b) Program the Metropolis algorithm for this problem using a symmetric Cauchy jumping distribution. Tune the scale parameter of the jumping distribution appropriately.   
(c) Program simulated tempering with a ladder of 10 inverse-temperatures, 0.1, ..., 1.   
(d) Compare your answers in (b) and (c) to the graph in (a).

3. Hamiltonian Monte Carlo: Program HMC in R for the bioassay logistic regression example from Chapter 3.

(a) Code the gradients analytically and numerically and check that the two programs give the same result.   
(b) Pick reasonable starting values for the mass matrix, step size, and number of steps.   
(c) Tune the algorithm to an approximate $65\%$ acceptance rate.   
(d) Run 4 chains long enough so that each has an effective sample size of at least 100. How many iterations did you need?   
(e) Check that your inferences are consistent with those from the direct approach in Chapter 3.

4. Coverage of intervals and rejection sampling: Consider the following model: $y_{j} \sim \mathrm{Binomial}(n_{j},\theta_{j})$ , where $\theta_{j} = \mathrm{logit}^{-1}(\alpha +\beta x_{j})$ , for $j = 1,\ldots ,J$ , and with independent prior distributions, $\alpha \sim t_4(0,2^2)$ and $\beta \sim t_4(0,1)$ . Assume $J = 10$ , the $x_{j}$ values are randomly drawn from a U(1,1) distribution, and $n_j \sim \mathrm{Poisson}^+ (5)$ , where $\mathrm{Poisson}^+$ is the Poisson distribution restricted to positive values.

(a) Sample a dataset at random from the model, estimate $\alpha$ and $\beta$ using Stan, and make a graph simultaneously displaying the data, the fitted model, and uncertainty in the fit (shown via a set of inverse logit curves that are thin and gray (in R, 1wd=.5, col="gray").   
(b) Did Stan's posterior $50\%$ interval for $\alpha$ contain its true value? How about $\beta$ ?   
(c) Use rejection sampling to get 1000 independent posterior draws from $(\alpha, \beta)$ .


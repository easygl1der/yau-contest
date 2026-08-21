---
title: "Appendix B — Outline of Proofs from Chapter 4"
source: Gelman, Carlin, Stern, Dunson, Vehtari, Rubin, Bayesian Data Analysis, 3rd ed., CRC 2013
kind: mineru-transcript-chapter
part: appendix
canonical_pdf: ../Bayesian-Data-Analysis-3rd.pdf
---

# Appendix B — Outline of Proofs from Chapter 4

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← App. A Distributions](./a-standard-probability-distributions.md) · [App. C R and Stan →](./c-computation-in-r-and-stan.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Appendix B

# Outline of proofs of limit theorems

The basic result of large-sample Bayesian inference is that as more and more data arrive, the posterior distribution of the parameter vector approaches multivariate normal. If the likelihood model happens to be correct, then we can also prove that the limiting posterior distribution is centered at the true value of the parameter vector. In this appendix, we outline a proof of the main results. The practical relevance of the theorems is discussed in Chapter 4.

We derive the limiting posterior distribution in three steps. The first step is the convergence of the posterior distribution to a point, for a discrete parameter space. If the data truly come from the hypothesized family of probability models, the point of convergence will be the true value of the parameter. The second step applies the discrete result to regions in continuous parameter space, to show that the mass of the continuous posterior distribution becomes concentrated in smaller and smaller neighborhoods of a particular value of parameter space. Finally, the third step of the proof shows the accuracy of the normal approximation in the vicinity of the posterior mode.

# Mathematical framework

The key assumption for the results presented here is that data are independent and identically distributed: we label the data as $y = (y_{1},\ldots ,y_{n})$ , with probability density $\prod_{i = 1}^{n}f(y_{i})$ . We use the notation $f(\cdot)$ for the true distribution of the data, in contrast to $p(\cdot |\theta)$ , the distribution of our probability model. The data $y$ may be discrete or continuous.

We are interested in a (possibly vector) parameter $\theta$ , defined on a space $\Theta$ , for which we have a prior distribution, $p(\theta)$ , and a likelihood, $p(y|\theta) = \prod_{i=1}^{n} p(y_i|\theta)$ , which assumes the data are independent and identically distributed. As illustrated in the counterexamples discussed in Section 4.3, some conditions are required on the prior distribution and the likelihood, as well as on the space $\Theta$ , for the theorems to hold.

It is necessary to assume a true distribution for $y$ , because the theorems only hold in probability; for almost every problem, it is possible to construct data sequences $y$ for which the posterior distribution of $\theta$ will not have the desired limit. The theorems are of the form, 'The posterior distribution of $\theta$ converges in probability (as $n \to \infty$ ) to ...'; the 'probability' is with respect to $f(y)$ , the true distribution of $y$ .

We label $\theta_0$ as the value of $\theta$ that minimizes the Kullback-Leibler divergence $\mathrm{KL}(\theta)$ of the distribution $p(\cdot|\theta)$ in the model relative to the true distribution, $f(\cdot)$ . The Kullback-Leibler divergence is defined at any value $\theta$ by

$$
\operatorname {K L} (\theta) = \mathrm {E} \left(\log \left(\frac {f (y _ {i})}{p (y _ {i} | \theta)}\right)\right) = \int \log \left(\frac {f (y _ {i})}{p (y _ {i} | \theta)}\right) f (y _ {i}) d y _ {i}. \tag {B.1}
$$

This is a measure of 'discrepancy' between the model distribution $p(y_i|\theta)$ and the true distribution $f(y)$ , and $\theta_0$ may be thought of as the value of $\theta$ that minimizes this distance. We assume that $\theta_0$ is the unique minimizer of $\mathrm{KL}(\theta)$ . It turns out that as $n$ increases, the posterior distribution $p(\theta | y)$ becomes concentrated about $\theta_0$ .

Suppose that the likelihood model is correct; that is, there is some true parameter value $\theta$ for which $f(y_{i}) = p(y_{i}|\theta)$ . In this case, it is easily shown via Jensen's inequality that (B.1) is minimized at the true parameter value, which we can then label as $\theta_0$ without risk of confusion.

Convergence of the posterior distribution for a discrete parameter space

Theorem. If the parameter space $\Theta$ is finite and $\operatorname{Pr}(\theta = \theta_0) > 0$ , then $\operatorname{Pr}(\theta = \theta_0|y) \to 1$ as $n \to \infty$ , where $\theta_0$ is the value of $\theta$ that minimizes the Kullback-Leibler divergence (B.1).

Proof. We will show that $p(\theta | y) \to 0$ as $n \to \infty$ for all $\theta \neq \theta_0$ . Consider the log posterior odds relative to $\theta_0$ :

$$
\log \left(\frac {p (\theta | y)}{p \left(\theta_ {0} | y\right)}\right) = \log \left(\frac {p (\theta)}{p \left(\theta_ {0}\right)}\right) + \sum_ {i = 1} ^ {n} \log \left(\frac {p \left(y _ {i} | \theta\right)}{p \left(y _ {i} | \theta_ {0}\right)}\right). \tag {B.2}
$$

The second term on the right is a sum of $n$ independent identically distributed random variables, if $\theta$ and $\theta_0$ are considered fixed and the $y_i$ 's are random with distributions $f$ . Each term in the summation has a mean of

$$
\operatorname {E} \left(\log \left(\frac {p (y _ {i} | \theta)}{p (y _ {i} | \theta_ {0})}\right)\right) = \operatorname {K L} (\theta_ {0}) - \operatorname {K L} (\theta),
$$

which is zero if $\theta = \theta_0$ and negative otherwise, as long as $\theta_0$ is the unique minimizer of $\mathrm{KL}(\theta)$ .

Thus, if $\theta \neq \theta_0$ , the second term on the right of (B.2) is the sum of $n$ independent identically distributed random variables with negative mean. By the law of large numbers, the sum approaches $-\infty$ as $n \to \infty$ . As long as the first term on the right of (B.2) is finite (that is, as long as $p(\theta_0) > 0$ ), the whole expression approaches $-\infty$ in the limit. Then, $p(\theta | y) / p(\theta_0 | y) \to 0$ , and so $p(\theta | y) \to 0$ . Since all probabilities sum to 1, $p(\theta_0 | y) \to 1$ .

Convergence of the posterior distribution for a continuous parameter space

If $\theta$ has a continuous distribution, then $p(\theta_0|y)$ is always zero for any finite sample, and so the above theorem cannot apply. We can, however, show that the posterior probability distribution of $\theta$ becomes more and more concentrated about $\theta_0$ as $n\to \infty$ . Define a neighborhood of $\theta_0$ as the open set of all points in $\Theta$ within a fixed nonzero distance of $\theta_0$ .

Theorem. If $\theta$ is defined on a compact set and $A$ is a neighborhood of $\theta_0$ with nonzero prior probability, then $\operatorname*{Pr}(\theta \in A|y) \to 1$ as $n \to \infty$ , where $\theta_0$ is the value of $\theta$ that minimizes (B.1).

Proof. The theorem can be proved by placing a small neighborhood about each point in $\Theta$ , with $A$ being the only neighborhood that includes $\theta_0$ , and then covering $\Theta$ with a finite subset of these neighborhoods. If $\Theta$ is compact, such a finite subcovering can always be obtained. The proof of the convergence of the posterior distribution to a point is then adapted to show that the posterior probability for any neighborhood except $A$ approaches zero as $n \to \infty$ , and thus $\operatorname{Pr}(\theta \in A | y) \to 1$ .

# Convergence of the posterior distribution to normality

We just showed that by increasing $n$ , we can put as much of the mass of the posterior distribution as we like in any arbitrary neighborhood of $\theta_0$ . Obtaining the limiting posterior distribution requires two more steps. The first is to show that the posterior mode is consistent; that is, that the mode of the posterior distribution falls within the neighborhood where almost all the mass lies. The second step is a normal approximation centered at the posterior mode.

Theorem. Under some regularity conditions (notably that $\theta_0$ not be on the boundary of $\Theta$ ), as $n \to \infty$ , the posterior distribution of $\theta$ approaches normality with mean $\theta_0$ and variance $(nJ(\theta_0))^{-1}$ , where $\theta_0$ is the value that minimizes the Kullback-Leibler divergence (B.1) and $J$ is the Fisher information (2.20).

Proof. For convenience in exposition, we first derive the result for a scalar $\theta$ . Define $\hat{\theta}$ as the posterior mode. The proof of the consistency of the maximum likelihood estimate (see the bibliographic note at the end of the chapter) can be mimicked to show that $\hat{\theta}$ is also consistent; that is $\hat{\theta} \to \theta_0$ as $n \to \infty$ .

Given the consistency of the posterior mode, we approximate the log posterior density by a Taylor expansion centered about $\hat{\theta}$ , confident that (for large $n$ ) the neighborhood near $\hat{\theta}$ has almost all the mass in the posterior distribution. The normal approximation for $\theta$ is a quadratic approximation for the log posterior distribution of $\theta$ , a form that we derive via a Taylor series expansion of $\log p(\theta | y)$ centered at $\hat{\theta}$ :

$$
\log p (\theta | y) = \log p (\hat {\theta} | y) + \frac {1}{2} (\theta - \hat {\theta}) ^ {2} \frac {d ^ {2}}{d \theta^ {2}} [ \log p (\theta | y) ] _ {\theta = \hat {\theta}} + \frac {1}{6} (\theta - \hat {\theta}) ^ {3} \frac {d ^ {3}}{d \theta^ {3}} [ \log p (\theta | y) ] _ {\theta = \hat {\theta}} + \dots
$$

(The linear term in the expansion is zero because the log posterior density has zero derivative at its interior mode.)

Consider the above equation as a function of $\theta$ . The first term is a constant. The coefficient for the second term can be written as

$$
\frac {d ^ {2}}{d \theta^ {2}} \left[ \log p (\theta | y) \right] _ {\theta = \hat {\theta}} = \frac {d ^ {2}}{d \theta^ {2}} \log p (\hat {\theta}) + \sum_ {i = 1} ^ {n} \frac {d ^ {2}}{d \theta^ {2}} \left[ \log p (y _ {i} | \theta) \right] _ {\theta = \hat {\theta}},
$$

which is a constant plus the sum of $n$ independent identically distributed random variables with negative mean (once again, it is the $y_{i}$ 's that are considered random here). If $f(y) \equiv p(y|\theta_0)$ for some $\theta_0$ , then the terms each have mean $-J(\theta_0)$ . If the true data distribution $f(y)$ is not in the model class, then the mean is $\operatorname{E}_f\left(\frac{d^2}{d\theta^2}\log p(y|\theta)\right)$ evaluated at $\theta = \theta_0$ which is the negative second derivative of the Kullback-Leibler divergence, $\mathrm{KL}(\theta_0)$ , and is thus negative, because $\theta_0$ is defined as the point at which $\mathrm{KL}(\theta)$ is minimized. Thus, the coefficient for the second term in the Taylor expansion increases with order $n$ . A similar argument shows that coefficients for the third- and higher-order terms increase no faster than order $n$ .

We can now prove that the posterior distribution approaches normality. As $n \to \infty$ , the mass of the posterior distribution $p(\theta | y)$ becomes concentrated in smaller and smaller neighborhoods of $\theta_0$ , and the distance $|\hat{\theta} - \theta_0|$ also approaches zero. Thus, in considering the Taylor expansion about the posterior mode, we can focus on smaller and smaller neighborhoods about $\hat{\theta}$ . As $|\theta - \hat{\theta}| \to 0$ , the third-order and succeeding terms of the Taylor expansion fade in importance, relative to the quadratic term, so that the distance between the quadratic approximation and the log posterior distribution approaches 0, and the normal approximation becomes increasingly accurate.

# Multivariate form

If $\theta$ is a vector, the Taylor expansion becomes

$$
\log p (\theta | y) = \log p (\hat {\theta} | y) + \frac {1}{2} (\theta - \hat {\theta}) ^ {T} \frac {d ^ {2}}{d \theta^ {2}} [ \log p (\theta | y) ] _ {\theta = \hat {\theta}} (\theta - \hat {\theta}) + \dots ,
$$

where the second derivative of the log posterior distribution is now a matrix whose expectation is the negative of a positive definite matrix which is the Fisher information matrix (2.20) if $f(y) \equiv p(y|\theta_0)$ for some $\theta_0$ .

# B.1 Bibliographic note

The asymptotic normality of the posterior distribution was known by Laplace (1810) but first proved rigorously by Le Cam (1953); a general survey of previous and subsequent theoretical results in this area is given by Le Cam and Yang (1990). Like the central limit theorem for sums of random variables, the consistency and asymptotic normality of the posterior distribution also hold in far more general conditions than independent and identically distributed data. The key condition is that there be 'replication' at some level, as, for example, if the data come in a time series whose correlations decay to zero.

The Kullback-Leibler divergence comes from Kullback and Leibler (1951). Chernoff (1972, Sections 6 and 9.4) has a clear presentation of consistency and limiting normality results for the maximum likelihood estimate. Both proofs can be adapted to the posterior distribution. DeGroot (1970, Chapter 10) derives the asymptotic distribution for the posterior distribution in more detail; Shen and Wasserman (2001) provide more recent results in this area.


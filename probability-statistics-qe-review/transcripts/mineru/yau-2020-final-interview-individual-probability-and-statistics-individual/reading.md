# Yau College Math Competition 2020 Final Probability and Statistics

Individual Exam Problem Set 1 (Saturday, October 24, 2020)

PROBLEM 1. Suppose that $\left\{X_{n} \right\}$ is a sequence of independent, identically distributed random variables with the uniform distribution on the unit interval [0, 1]. For each $x \in[0, 1]$ , define

$$
X_{n}^{x} = \left\{\begin{array}{ll} 1, & X_{n} \leq x; \\ 0, & X_{n} > x.\end{array} \right.
$$

Let $f :[0, 1] \to \mathbb{R}$ be an nondecreasing continuous function on [0, 1] and

$$
B_{n}(x; f) = \mathbb{E} \left[f \left(\frac{X_{1}^{x} + \cdots + X_{n}^{x}}{n}\right) \right].
$$

Show that

(1) $B_{n}(x; f)$ is a polynomial in x of degree $n;(2) B_{n}(x; f)$ is nondecreasing in x;

(3) $B_{n}(x; f) \to f(x)$ uniformly on [0, 1].

PROBLEM 2. An urn contains N balls marked $1, 2,..., N.$ . A ball is drawn from the urn repeatedly and independently with replacement. Let $T_{N}$ be the first time every ball in the turn has been drawn at least once. Show that $T_{N} / N$ log N converges to 1 in probability.

PROBLEM 3. Suppose $\left\{X_{1}, \ldots, X_{n} \right\}$ is a random sample from an unknown probability distribution with finite mean, variance, and third central moment, denoted by $\mu, \sigma^{2},$ and $\mu_{3} = \mathbb{E}(X_{1} - \mu)^{3}$ , respectively. It is of interest to study the relationship between

$$
\bar{X} = \frac{1}{n} \sum_{i = 1}^{n} X_{i} \quad \text{and} \quad S^{2} = \frac{1}{n - 1} \sum_{i = 1}^{n}(X_{i} - \bar{X})^{2}.
$$

(1) Show that they are independent when the underlying distribution is Gaussian.

(2) For a general distribution, what is $\mathsf{cov} \big(\bar{X}, S^{2} \big) \ ?$ Find an expression.

(3) Suppose the random sample is from Bernoulli(1/2). Show that X<sup>¯</sup> and ${\bar{S}}^{2}$ are uncorrelated, but are not independent by showing that

$$
\mathbb{P}(S^{2} = 0 \mid \bar{X} = 1) \neq \mathbb{P}(S^{2} = 0)
$$

## Yau College Math Competition 2020 Final Probability and Statistics

Individual Exam Problem Set 2 (Sunday, October 25, 2020)

PROBLEM 1. Suppose that $\left\{X_{n} \right\}$ is a sequence of real valued, independent, identically distributed random variables and B is a Borel set in R. Assume that $\mathbb{P} \big(X_{1} \in B \big) > 0$ . Let $T = \operatorname{inf} \{n : X_{n} \in B\}$ be the first time the sequence is in the set B.

(1) Show that $\mathbb{P}(T < \infty) = 1$

(2) Suppose $\mathbb{E} | X_{1} | < \infty$ . Show that E $X_{T} = \mathbb{E}[X_{1} I_{B}(X_{1})] \mathbb{E} T$

PROBLEM 2. We flip a fair coin repeatedly and independently. Let $N_{n}$ be the number of consecutive heads beginning from the $n^{\mathrm{{^{\scriptsize ~ \dot{\th}}}}}$ flip. (For example, $N_{n} = 0$ if the $n^{\mathrm{th}}$ flip is a tail, and $N_{n} = 2$ if the $n^{\mathrm{th}}$ and $(\bar{n} + 1)^{\mathrm{th}}$ flips are heads but the $(n + 2)^{\mathrm{th}}$ flip is a tail. Show that

$$
\operatorname{limsup}_{n \to \infty} \frac{N_{n}}{\log n} = \frac{1}{\log 2}.
$$

PROBLEM 3. Let $\left\{X_{1}, \ldots, X_{n} \right\}$ be independent and identically distributed from the uniform distribution on the interval $(- \theta, \theta)$ with $\theta > 0$

(1) Find a minimal sufficient statistic T for θ.

(2) Define $V ={\bar{X}} / | X |_{(n)},$ , where $| X |_{(n)} = \operatorname{max}(| X_{1} |, \dots, | X_{n} |)$ . Show that V is independent of T.
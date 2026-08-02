S.-T. Yau College Student Mathematics Contests 2014

# Probability and Statistics Problems

Please solve the following 5 problems.

Problem 1. Let X be a real valued random variable such that for all smooth functions $f : RR$ with compact support we have $E[Xf(X)] = E[f^{\prime}(X)]$ ]. Show that X has the standard normal distribution.

Problem 2. Let $(X_{n})$ be a sequence of uncorrelated random variables of mean zero such that

$$
\sum_{n = 1}^{\infty} nE | X_{n} |^{2} < \infty.
$$

Show that $\begin{array}{r}{S_{n} = \sum_{i = 1}^{n} X_{i}} \end{array}$ converges almost surely.

Problem 3. Let $(\Omega,{\mathcal{F}})$ be a measurable space and $\mathcal{G}$ be a sub-σ-field of ${\mathcal F}$ . Let $P$ and $Q$ be two probabilities which are mutually absolutely continuous on $\mathcal{F}$ . We denote by $X_{0}$ the Radon-Nikodym density of $Q$ with respect to $P$ on $\mathcal{F}$ . Show that the following two properties are satisfied:

(a) $0 < E_{P}[X_{0} | \mathcal{G}] < + \infty, P \mathrm{- a.s.;}$

(b) for every ${\mathcal{F}}.$ -measurable non-negative random variable $f,$

$$
E_{P}[fX_{0} | \mathcal{G}] = E_{Q}[f | \mathcal{G}] E_{P}[X_{0} | \mathcal{G}].
$$

Problem 4. Suppose $X_{1}, \dots, X_{n}, \dots.$ is a sequence of random numbers drawn from the uniform distribution $U(0, 1)$ . One observes these numbers sequentially. At time $n_{\mathrm{:}}$ one keeps a record of $Y_{n} \{\overset{def}{=}} \X_{(n)} = \operatorname{max}_{i = 1}^{n} X_{i} = \operatorname{max} \{Y_{n - 1}, X_{n}\}$ and $Z_{n} \stackrel{def}{=} \bar{X}_{n} =$ $\begin{array}{r}{\sum_{i = 1}^{n} X_{i} / n =(n - 1) / nZ_{n - 1} + 1 / nX_{n}} \end{array}$ and discards all previous recordings.

(a) What is the best guess of $X_{1}$ if one only observes $Y_{n} ?$

(b) What is the best guess of $X_{1}$ if one only observes $Z_{n} ?$

(c) Comparing the two guesses of $X_{1}$ , which one is better (and in what sense)?

Give good reasoning to justify your answers.

Problem 5. Suppose we take a random sample of size n from a bag of colored balls (red, blue and yellow balls) with replacement. Let $X_{1}$ denote the number of red balls, $X_{2}$ denote the number of blue balls, and $X_{3}$ denote the number of yellow balls in the sample. Assuming we know that the total number of yellow balls is triple the total number of red balls in the bag. Or in other words, the red, blue and yellow balls occur with probability $p_{1}, p_{2}$ and $p_{3} = 3p_{1}$ , respectively in the bag.

1. Find the aymptotic distribution (after appropriate normalization) for the MLE of $p_{2}$

2. Construct the likelihood ratio test statistic for the null hypothesis that $p_{1} = p_{2} =$ $p_{3} / 3$ (the alternative is that $p_{1} = p_{2} = p_{3} / 3$ is not true). What is the asymptotic distribution of your test statistic under null?
# 2014 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination (Individual)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2014-semifinal-written-individual.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2014-semifinal-written-individual/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

S.-T. Yau College Student Mathematics Contests 2014

# Probability and Statistics Problems

Please solve the following 5 problems.

## Question 1

^yau-2014-semifinal-written-individual-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s1).

Let X be a real valued random variable such that for all smooth functions $f : RR$ with compact support we have $E[Xf(X)] = E[f^{\prime}(X)]$ ]. Show that X has the standard normal distribution.

## Question 2

^yau-2014-semifinal-written-individual-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s2).

Let $(X_{n})$ be a sequence of uncorrelated random variables of mean zero such that

$$
\sum_{n = 1}^{\infty} nE | X_{n} |^{2} < \infty.
$$

Show that $\begin{array}{r}{S_{n} = \sum_{i = 1}^{n} X_{i}} \end{array}$ converges almost surely.

## Question 3

^yau-2014-semifinal-written-individual-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s3).

Let $(\Omega,{\mathcal{F}})$ be a measurable space and $\mathcal{G}$ be a sub-σ-field of ${\mathcal F}$ . Let $P$ and $Q$ be two probabilities which are mutually absolutely continuous on $\mathcal{F}$ . We denote by $X_{0}$ the Radon-Nikodym density of $Q$ with respect to $P$ on $\mathcal{F}$ . Show that the following two properties are satisfied:

(a) $0 < E_{P}[X_{0} | \mathcal{G}] < + \infty, P \mathrm{- a.s.;}$

(b) for every ${\mathcal{F}}.$ -measurable non-negative random variable $f,$

$$
E_{P}[fX_{0} | \mathcal{G}] = E_{Q}[f | \mathcal{G}] E_{P}[X_{0} | \mathcal{G}].
$$

## Question 4

^yau-2014-semifinal-written-individual-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s4).

Suppose $X_{1}, \dots, X_{n}, \dots.$ is a sequence of random numbers drawn from the uniform distribution $U(0, 1)$ . One observes these numbers sequentially. At time $n_{\mathrm{:}}$ one keeps a record of $Y_{n} \{\overset{def}{=}} \X_{(n)} = \operatorname{max}_{i = 1}^{n} X_{i} = \operatorname{max} \{Y_{n - 1}, X_{n}\}$ and $Z_{n} \stackrel{def}{=} \bar{X}_{n} =$ $\begin{array}{r}{\sum_{i = 1}^{n} X_{i} / n =(n - 1) / nZ_{n - 1} + 1 / nX_{n}} \end{array}$ and discards all previous recordings.

(a) What is the best guess of $X_{1}$ if one only observes $Y_{n} ?$

(b) What is the best guess of $X_{1}$ if one only observes $Z_{n} ?$

(c) Comparing the two guesses of $X_{1}$ , which one is better (and in what sense)?

Give good reasoning to justify your answers.

## Question 5

^yau-2014-semifinal-written-individual-q5

> Corresponding solution: [Reference solution for Question 5](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s5).

Suppose we take a random sample of size n from a bag of colored balls (red, blue and yellow balls) with replacement. Let $X_{1}$ denote the number of red balls, $X_{2}$ denote the number of blue balls, and $X_{3}$ denote the number of yellow balls in the sample. Assuming we know that the total number of yellow balls is triple the total number of red balls in the bag. Or in other words, the red, blue and yellow balls occur with probability $p_{1}, p_{2}$ and $p_{3} = 3p_{1}$ , respectively in the bag.

## Question 1

^yau-2014-semifinal-written-individual-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s1).

Find the aymptotic distribution (after appropriate normalization) for the MLE of $p_{2}$

## Question 2

^yau-2014-semifinal-written-individual-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2014-semifinal-written-individual-solutions.md#^yau-2014-semifinal-written-individual-s2).

Construct the likelihood ratio test statistic for the null hypothesis that $p_{1} = p_{2} =$ $p_{3} / 3$ (the alternative is that $p_{1} = p_{2} = p_{3} / 3$ is not true). What is the asymptotic distribution of your test statistic under null?

# 2021 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2021-semifinal-written-written.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2021-semifinal-written-written/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

## Probability and Statistics

Solve every problem.

## Part I: Probability

## Question 1

^yau-2021-semifinal-written-written-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s1).

Suppose that a sequence $\{X_{n}\}$ of real-valued random variables converges to X in distribution and there are positive constants r and C such that $\mathbb{E} | X_{n} |^{r} \leq C$ for all n. Show that

$$
\lim_{n \to \infty} \mathbb{E} | X_{n} |^{s} = \mathbb{E} | X |^{s}
$$

for all $0 < s < r.$

## Question 2

^yau-2021-semifinal-written-written-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s2).

Let $p(x, y)$ be the (one-step) transition function of a Markov chain on a discrete state space S and $p_{n}(x, y)$ be the n-step transition function. Show that for any positive integers L and N and any two states x and y we have

$$
\sum_{n = L}^{N + L} p_{n}(x, y) \leq \sum_{n = 0}^{N} p_{n}(y, y).
$$

## Question 3

^yau-2021-semifinal-written-written-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s3).

Let $\{X_{n}\}$ be an independent, identically distributed sequence of random variables with the symmetric Bernoulli distribution

$$
\mathbb{P} \left\{X = 1 \right\} = \mathbb{P} \left\{X = - 1 \right\} = \frac{1}{2}.
$$

Let $S_{n} = \sum_{i = 1}^{N} X_{i}$ be the partial sum. Show that for all $\begin{array}{r}{\alpha > \frac{1}{2}.} \end{array}$

$$
\mathbb{P} \left\{\lim_{n \to \infty} \frac{S_{n}}{n^{\alpha}} = 0 \right\} = 1.
$$

## Question 4

^yau-2021-semifinal-written-written-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s4).

Let $X^{n} = \left\{X_{ij} \right\}$ be an $n \times n$ random matrix whose entries are independent and identically distributed random variables with the symmetric Bernoulli distribution

$$
\mathbb{P} \left\{X = 0 \right\} = \mathbb{P} \left\{X = 1 \right\} = \frac{1}{2}.
$$

Let $p_{n} = \mathbb{P} \left\{\det X_{N} \right.$ is odd}. Show that $\operatorname{lim}_{n \to \infty} p_{n} > 0.$ .

## Part II: Statistics

## Question 5

^yau-2021-semifinal-written-written-q5

> Corresponding solution: [Reference solution for Question 5](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s5).

You have been asked to help design a randomized trial of a new drug, call it drug A, to be used in place of the current drug, call it drug B, for a particular medical condition. The budget is fixed to have 1000 patients treated with A and 1000 treated with drug B. The issue is how to do the allocation of patients, because we have many pre-randomization measurements on each patient, roughly 200, such as blood pressure recordings, age, sex, and a large collection of genetics measurements. Obviously it is desirable to have the A group similar to the B group with respect to all pre-treatment covariates and non-linear functions of them that are expected to influence the efectiveness of the drugs with respect to the outcome variables.

Complete (or simple) randomization does this in expectation, but with many covariates, some covariates will not be balanced between the A and B groups in any one single randomized allocation. Standard blocking used in traditional experimental design can force balance on a few covariates, but the designer of drug A wants to have an experimental design that creates balance on many covariates, and feels that you, as a modern applied mathematician/statistician, should be able to do this.

Describe a class of methods that achieves this goal where each patient has a positive probability of receiving drug A and a positive probability of receiving drug B. Provide enough detail that you are describing an explicit algorithm.

## Question 6

^yau-2021-semifinal-written-written-q6

> Corresponding solution: [Reference solution for Question 6](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s6).

You are given the results of a randomized experiment of two drugs, A and B. The experiment was not conducted in the usual way, however, but rather by allocating patients by a machine-learning algorithm under which each patient has a positive probability of receiving A and of receiving B; moreover the algorithm is completely specified and is built to create better than random balance on the covariates.

(a) Can unbiased estimates of the causal efect of drug A versus B be found, and if so, show why.

(b) Can exact small sample, non-parametric inferences for the causal efect in part (a) be derived, based solely on the randomization distribution of some statistic? For example, can we find exact significance levels under a sharp null hypothesis? If so, outline how to accomplish this goal.

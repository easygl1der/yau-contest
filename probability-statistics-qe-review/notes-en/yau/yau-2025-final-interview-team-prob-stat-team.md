# 2025 S.-T. Yau College Student Mathematics Competition: Final Interview (Team)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/final-interview/yau-2025-final-interview-team-prob-stat-team.pdf).
> - Source: [Official Question Bank Download Page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2025-final-interview-team-prob-stat-team/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

## Group: Probability and statistics

## Question 1

^yau-2025-final-interview-team-prob-stat-team-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s1).

Let $p \in(0, 1)$ . Suppose you have a coin with probability of “head” unknown. Can you design a game between two persons, which ends in a finite number of tosses of the coin with probability 1, such that one person’s winning probability is exactly $p.$

## Question 2

^yau-2025-final-interview-team-prob-stat-team-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s2).

Let $(p_{1}, p_{2}, p_{3})$ be the probabilities of a discrete random variable, where $0 < p_{k} < 1$ and $p_{1} + p_{2} +$ $p_{3} = 1$ . Let $r_{1}, r_{2}, r_{3}$ be independent random variables, each following a Unif(0, 1) distribution. Define the random variable X as

$$
X = k, \quad \text{if} r_{k}^{1 / p_{k}} = \max \left\{r_{1}^{1 / p_{1}}, r_{2}^{1 / p_{2}}, r_{3}^{1 / p_{3}} \right\}.
$$

You may ignore the case where the maximum is not unique, as it occurs with probability zero. Determine the distribution of X.

## Question 3

^yau-2025-final-interview-team-prob-stat-team-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s3).

Let $(X_{n})_{n \geq 0}$ be a discrete time simple symmetric random walk on $\mathbb{Z}^{d}.$ , whose increments $\left(X_{n + 1} - \right.$ $X_{n})_{n \geq 0}$ are independent and chosen uniformly from the 2d unit vectors $(\pm e_{i})_{1 \leq i \leq d}$ in $\mathbb{Z}^{d}$ with $\| e_{i} \| = 1$ . A function $f :{\mathbb{Z}^{d}} \to{\mathbb{R}}$ is called harmonic for the random walk if $\mathbb{E}[f(X_{1}) | X_{0} = x] = f(x)$ for all $x \in \mathbb{Z}^{d}$ . Show that every bounded harmonic function f is a constant.

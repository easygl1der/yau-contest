# 2024 S.-T. Yau College Student Mathematics Competition: Final Interview (Overall)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/final-interview/yau-2024-final-interview-overall-prob-stat-overall.pdf).
> - Source: [Official Question Bank Download Page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2024-final-interview-overall-prob-stat-overall/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2024-final-interview-overall-prob-stat-overall-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

Choose at least 1 from the following 2 problems.

## Problem 1.

(1) Suppose there is a biased coin with a probability p of landing heads. How can we use this coin to generate a Bernoulli(0.5) random variable?

(2) How many tosses are required on average to generate one random digit using this method?

(3) How can you use this biased coin to generate a uniform distribution on {1, 2, 3} or, in general, a uniform distribution on $\{1, 2, \dots, n\} ?$

## Question 2

^yau-2024-final-interview-overall-prob-stat-overall-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2024-final-interview-overall-prob-stat-overall-solutions.md#^yau-2024-final-interview-overall-prob-stat-overall-s2).

We have n observations $y_{i}, i = 1, \dotsc, n$ , satisfying the simple linear regression model:

$$
y_{i} = \alpha + \beta x_{i} + \epsilon_{i},
$$

where $\epsilon_{i}$ are iid random variables with mean 0 and variance $\sigma^{2}$ . Let $\hat{\beta}$ denote the least squares estimator of $\beta.$

(1) Suppose $x_{i} \ = \i$ . Is $\hat{\beta}$ consistent? Asymptotically normal? Explain your answer.

(2) Answer the same question for $x_{i} = e^{i}$

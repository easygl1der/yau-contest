# 2019 S.-T. Yau College Student Mathematics Competition: Final Interview (Team)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/final-interview/yau-2019-final-interview-team-stat-team.pdf).
> - Source: [Official Question Bank Download Page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2019-final-interview-team-stat-team/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

## May 2019

## Question 1

^yau-2019-final-interview-team-stat-team-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s1).

Consider the simple linear regression

$$
Y_{i} = \alpha + \beta X_{i} + \epsilon_{i}, \qquad i = 1, \ldots, 2n.
$$

(i) Suppose that only the first half of $Y \mathrm{{} s}$ are observed, i.e. only $Y_{i}, i = 1, \dots, n$ are observed and $Y_{i}, \i = n + 1, \dots, 2n$ are missing, while all $X \mathrm{{s}}$ are observed. What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid?

(ii) Suppose for the second half of $Y \mathrm{{} s}$ , their absolute values are observed, i.e. we observe $| Y_{i} |$ $i = n + 1, \ldots, 2n$ . What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid? Any good properties for your estimator?

## Question 2

^yau-2019-final-interview-team-stat-team-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s2).

Suppose that $X =(X_{1}, \ldots, X_{n})^{\prime}$ is an observation from the n-dimensional multivariate normal distribution $N_{n}(\theta, I)$ with unknown parameter $\theta \in \mathbb{R}^{n}$ , that is, $X_{i}^{,}$ s are independent of each other with $X_{i} \ \sim \N(\theta_{i}, 1)$ for $i = 1, \ldots, n$ . (i). Derive the maximum likelihood estimator (MLE) of $\begin{array}{r}{\| \theta \|^{2} = \sum_{i = 1}^{n} \theta_{i}^{2}} \end{array}$

(ii). Show that the MLE is a biased estimator.

(iii). Find the distribution of the MLE and describe how to use this distribution to construct exact confidence intervals.

## Question 3

^yau-2019-final-interview-team-stat-team-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2019-final-interview-team-stat-team-solutions.md#^yau-2019-final-interview-team-stat-team-s3).

Suppose that $X_{1}, \cdots, X_{n}$ is a sample of size n from the Student-t distribution $t_{\nu}(\mu, 1)$ with known degrees of freedom $\nu \geq 1$ , unit scale, and known center $\mu.$ The Student-t distribution $t_{\nu}(\mu, 1)$ has density function of the form

$$
f_{X}(x; \mu, \nu) = \frac{\Gamma(\frac{\nu + 1}{2})}{\sqrt{\pi \nu} \Gamma(\frac{\nu}{2})} \left(1 + \frac{(x - \mu)^{2}}{\nu}\right)^{- \frac{\nu + 1}{2}},(x \in \mathcal{R}^{1}).
$$

(i). Write $X_{i} = \mu + U_{i}$ , where $U_{i}$ are independently and identically distributed (iid) with $t_{\nu}(0, 1)$ for $i = 1, \cdots, n$ . Find the conditional distribution of $U_{1}$ given $U_{i} - U_{1} = X_{i} - X_{1}$ for $i = 2, \cdots, n$

(ii). Describe a method to construct confidence intervals by making use of the above result, and argue for its eficiency and coverage probability.

(iii). Use the limiting case of $\nu \to \infty$ to verify your answers.

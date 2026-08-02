# 2019 S.-T. Yau College Student Mathematics Competition: Final Interview (Overall)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/final-interview/yau-2019-final-interview-overall-stat-personal-overall.pdf).
> - Source: [Official Question Bank Download Page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2019-final-interview-overall-stat-personal-overall/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

## May 2019

## Question 1

^yau-2019-final-interview-overall-stat-personal-overall-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s1).

Consider the multiple linear regression model

$$
\binom{Y_{1}}{Y_{2}} = \binom{X_{1}}{X_{2}} \beta + \binom{\epsilon_{1}}{\epsilon_{2}},
$$

where $Y_{1} \in \mathbb{R}^{n_{1}}, Y_{2} \in \mathbb{R}^{n_{2}}, X_{1}$ is a $(n_{1} \times p)$ matrix, $X_{2}$ is a $(n_{2} \times p)$ matrix, $X ={\left(\begin{array}{l}{X_{1}} \\{X_{2}} \end{array} \right)}$ has rank $p,$ and error terms $\epsilon_{1}$ and $\epsilon_{2}$ are independent of each other with

$$
\epsilon_{1} \sim N_{n_{1}}(0, \sigma^{2} I_{n_{1}}) \text{and} \epsilon_{2} \sim N_{n_{2}}(0, \rho \sigma^{2} I_{n_{2}}) \quad(\rho > 0).
$$

The unknown parameters are $\beta \in \mathbb{R}^{p}$ and $\sigma^{2}$ .

## Question 1

^yau-2019-final-interview-overall-stat-personal-overall-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s1).

Treat $\rho$ as a constant and driver the maximum likelihood estimates of $\beta$ and $\sigma^{2}$ , denoted by $\hat{\beta}_{\rho}$ and $\hat{\sigma}_{\rho}^{2}.$

## Question 2

^yau-2019-final-interview-overall-stat-personal-overall-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s2).

Suppose that $X_{1}$ has full rank $p$ and $X_{2}$ has full rank $n_{2} < p$ . Prove that as $\rho$ goes to zero, $\hat{\beta}_{\rho}$ converges to

$$
\hat{\beta} + \left(X_{1}^{\prime} X_{1}\right)^{- 1} X_{2}^{\prime} \left[X_{2} \left(X_{1}^{\prime} X_{1}\right)^{- 1} X_{2}^{\prime} \right]^{- 1} \left(Y_{2} - X_{2} \hat{\beta}\right)
$$

where $\hat{\beta} =(X_{1}^{\prime} X_{1})^{- 1} X_{1}^{\prime} Y_{1}$

## Question 3

^yau-2019-final-interview-overall-stat-personal-overall-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s3).

Interpret the above limit in some context of multiple linear regression with constraints on $\beta.$

## Question 2

^yau-2019-final-interview-overall-stat-personal-overall-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s2).

Consider the simple linear regression

$$
Y_{i} = \alpha + \beta X_{i} + \epsilon_{i}, \qquad i = 1, \ldots, n.
$$

Define quadratic function

$$
Q(\alpha, \beta) = \sum_{i = 1}^{n}(Y_{i} - \alpha - \beta X_{i})^{2}.
$$

Let ˆα and $\hat{\beta}$ be the estimators of α and $\beta,$ which minimizes $Q(\alpha, \beta)$ . Let $\hat{Y}_{i} = \hat{\alpha} + \hat{\beta} X_{i}$ 1. Find the gradient vector of $\hat{Y_{i}}$ with respect to the vector $Y =(Y_{1} \ldots, Y_{n})^{\prime}$

## Question 2

^yau-2019-final-interview-overall-stat-personal-overall-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2019-final-interview-overall-stat-personal-overall-solutions.md#^yau-2019-final-interview-overall-stat-personal-overall-s2).

The degree of freedom, $d_{LM}$ of the fitted model is defined to be the trace of matrix $\frac{\partial \hat{Y}}{\partial Y}$ , where $\hat{Y} =(\hat{Y}_{1} \ldots, \hat{Y}_{n})^{\prime}$ . Find $d_{LM}$ . How is it related to the model?

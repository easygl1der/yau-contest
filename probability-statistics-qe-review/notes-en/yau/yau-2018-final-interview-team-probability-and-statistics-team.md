# 2018 S.-T. Yau College Student Mathematics Competition: Final Interview (Team)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/final-interview/yau-2018-final-interview-team-probability-and-statistics-team.pdf).
> - Source: [Official Question Bank Download Page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2018-final-interview-team-probability-and-statistics-team/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2018-final-interview-team-probability-and-statistics-team-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

Problem 1 (Probability) Let $\left\{X_{n} \right\}$ be a sequence of independent and identically distributed random variables with the distribution $\mathbb{P} \left\{X_{n} = 1 \right\} = \mathbb{P} \left\{X_{n} = - 1 \right\} = 1 / 2$ . Define

$$
Z = \sqrt{\frac{1}{2} + \frac{X_{1}}{2} \sqrt{\frac{1}{2} + \frac{X_{2}}{2} \sqrt{\frac{1}{2} + \cdots}}}.
$$

(1) Let

$$
Z_{N} = \sqrt{\frac{1}{2} + \frac{X_{1}}{2} \sqrt{\frac{1}{2} + \frac{X_{2}}{2} \sqrt{\frac{1}{2} + \cdots X_{N} \sqrt{\frac{1}{2}}}}}
$$

be the random variable $Z$ truncated at the nth step. Show that

$$
Z_{N} = \sin \left(\frac{\pi}{4} \sum_{n = 0}^{N} \frac{X_{1} X_{2} \cdots X_{n}}{2^{n}}\right).
$$

(2) Let

$$
Y_{n} = X_{1} X_{2} \dots X_{n}, \quad n = 1, 2, \dots.
$$

What is the joint distribution of the random variables $\{Y_{n}\} ?$

(3) Find the distribution function $F_{Z}$ of the random variable $Z.$

Problem 2 (Statistics) For $n \geq 2.$ , let $(X_{1}, Y_{1}), \cdots,(X_{n}, Y_{n})$ be independent, identically distributed random vectors, with a common distribution which is bivariate normal with two component means $\mu_{1}$ and $\mu_{2}$ and the variance-covariance elements

$$
\operatorname{var} \left(X_{1}\right) = \sigma_{1}^{2}, \quad \operatorname{var} \left(X_{2}\right) = \sigma_{2}^{2}, \quad \operatorname{cov} \left(X_{1}, X_{2}\right) = \rho \sigma_{1} \sigma_{2}.
$$

We assume that $\sigma_{1}$ and $\sigma_{2}$ are both positive. Let $\pmb{\theta} =(\mu_{1}, \mu_{2}, \sigma_{1}, \sigma_{2}, \pmb{\rho})^{T}$

(1) Assuming that the parameter $\theta$ is known, show that if one desires to predict $Y_{1}$ by using a function $g(X_{1}, \cdots, X_{n})$ that minimizes $\mathbb{E}_{\pmb{\theta}}(Y_{1} - g(X_{1}, \cdots, X_{n}))^{2}$ , then the solution is given by

$$
g \left(X_{1}, \dots, X_{n}\right) = \beta_{0} + \beta_{1} X_{1}.
$$

Provide expressions for $\beta_{0}$ and $\beta_{1}$ in terms of $\theta$ .

(2) Assuming that the parameter $\theta$ is unknown, how do you predict $Y_{1}$ and how do you measure the uncertainty of your prediction?

# 2013 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination (Individual)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2013-semifinal-written-individual.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2013-semifinal-written-individual/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.

Please solve 5 out of the following 6 problems.

## Question 1

^yau-2013-semifinal-written-individual-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s1).

Let $(X_{n})$ be a sequence of random variables.

(1) Assume that $\textstyle \sum_{n = 0}^{\infty} P(| X_{n} | > n) < \infty$ . Prove that lim $\begin{array}{r}{\operatorname{sup}_{n \infty} \frac{| X_{n} |}{n} \leq 1} \end{array}$

(2) Prove that $(X_{n})$ converges in probability to 0 if and only if for certain $r > 0$ $\begin{array}{r}{E[\frac{| X_{n} |^{r}}{1 + | X_{n} |^{r}}] 0} \end{array}$

## Question 2

^yau-2013-semifinal-written-individual-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s2).

Let X and Y be independent $N(0, 1)$ random variables.

(1) Find $E[X + Y | X \geq 0, Y \geq 0]$ ;

(2) Find the distribution function of $X + Y$ given that $X \geq 0$ and $Y \geq 0$

(Hint: For b) using the fact that $U =(X + Y) / \sqrt{2}$ and $V \ = \(X - Y) / \sqrt{2}$ are independent and $N(0, 1)$ distributed.)

## Question 3

^yau-2013-semifinal-written-individual-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s3).

Let $\{X_{n}\}$ be a sequence of independent and identically distributed continuous real valued random variables, and regard n as time. Let $A_{n}$ be the following event:

$$
A_{n} = \left\{X_{n} = \max \left\{X_{1}, X_{2}, \dots, X_{n} \right\} \right\}.
$$

We say that a maximum record occurs at n in such an event.

(1) Evaluate the probability $P(A_{n})$

(2) Denote by $Y_{n}$ the number of maximum records occurred until time $n, \mathrm{i.e.}$

$$
Y_{n} = \text{the number of} \{1 \leq k \leq n: X_{k} = \max \{X_{1}, X_{2}, \dots, X_{k}\}\}.
$$

Evaluate the expectation $EY_{n}$ and the variance $DY_{n}$

## Question 4

^yau-2013-semifinal-written-individual-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s4).

Let $X =(X_{1}, \cdots, X_{n})$ be an iid sample from an exponential density with mean θ. Consider testing $H_{0} : \theta = \theta_{0}$ vs. $H_{1} : \theta > \theta_{0}$ . Let $P(X) = \operatorname{your}$ p-value for an appropriate test.

(a) What is $E_{\theta_{0}}(P(X)) \ ?$ Derive your answer explicitly.

(b) Derive $E_{\theta}(P(X))$ for $\theta \neq \theta_{0}$ . Specifically, assuming only one sample, i.e. $n = 1$ calculate $E_{\theta}(P(X))$ as explicitly as possible for $\theta \neq \theta_{0}$

(c) When there is only one sample, is $E_{\theta}(P(X))$ a decreasing function of $\theta ?$ In general, can you prove your result for an arbitrary MLR family?

## Question 5

^yau-2013-semifinal-written-individual-q5

> Corresponding solution: [Reference solution for Question 5](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s5).

Let $X_{1}, X_{2}$ be iid uniform on $\theta -{\textstyle \frac{1}{2}}$ to $\theta +{\textstyle \frac{1}{2}}$

(a) Show that for any given $0 < \alpha < 1$ , you can find $c > 0$ such that

$$
P_{\theta} \{\bar{X} - c < \theta < \bar{X} + c\} = 1 - \alpha,
$$

where $\bar{X}$ is the sample mean.

(b) Show that for ϵ positive and suficiently small

$$
P_{\theta} \{\bar{X} - c < \theta < \bar{X} + c \mid | X_{2} - X_{1} | \geq 1 - \epsilon\} = 1
$$

(c) The statement in (a) is used to assert that $\bar{X} \pm c \mathrm{~ is ~ a ~} 100(1 - \alpha) \%$ confidence interval for θ. Does the assertion in (b) contradict this? If your sample observations are $X_{1} = 1, X_{2} = 2$ , would you use the confidence interval in $\mathrm{(a) ?}$

## Question 6

^yau-2013-semifinal-written-individual-q6

> Corresponding solution: [Reference solution for Question 6](../../solutions/yau/yau-2013-semifinal-written-individual-solutions.md#^yau-2013-semifinal-written-individual-s6).

Suppose you want to estimate the total number of enemy tanks in a war on the basis of the captured tanks. Assume without loss of generality that the tank serial numbers are $1, 2, \cdots, N$ , where N is the unknown total number of enemy tanks. Also assume the serial numbers of the n captured tanks are iid uniform on $1, 2, \cdots, N$ . (This is a simplified assumption which provides a good approximation if $n < < N)$ .

(a) Find the complete suficient statistic.

(b) Suggest how you may find the minimum variance unbiased estimate of N.

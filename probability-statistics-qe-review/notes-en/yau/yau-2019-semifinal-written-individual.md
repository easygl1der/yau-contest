# 2019 S.-T. Yau College Student Mathematics Competition: Semifinal Written Examination (Individual)

> [!info] Sources and Transcriptions
> - Original source file: [Local copy](../../sources/yau-contest/semifinal-written/yau-2019-semifinal-written-individual.pdf).
> - Source: local archival question bank; the upstream publication page has yet to be recorded.
> - MinerU reading transcript: [Full transcription](../../transcripts/mineru/yau-2019-semifinal-written-individual/reading.md). The original Markdown, JSON, and image assets are in `parts/`.
> - Corresponding solutions: [Problem-by-problem reference solutions](../../solutions/yau/yau-2019-semifinal-written-individual-solutions.md).
> - Mathematical notation, figures, layout, and any OCR ambiguity are governed by the original source file.


## Question 1

^yau-2019-semifinal-written-individual-q1

> Corresponding solution: [Reference solution for Question 1](../../solutions/yau/yau-2019-semifinal-written-individual-solutions.md#^yau-2019-semifinal-written-individual-s1).

Suppose $(X_{n})_{n \geq 1}$ is a sequence of positive random variables. There exists a constant $C > 0$ such that,

$$
\mathbb{E}[X_{n}] \leq C, \quad \mathbb{E}[\max \{0, - \log X_{n}\}] \leq C, \quad \forall n.
$$

Show that

$$
\limsup_{n \to \infty} X_{n}^{1 / n} = 1.
$$

## Question 2

^yau-2019-semifinal-written-individual-q2

> Corresponding solution: [Reference solution for Question 2](../../solutions/yau/yau-2019-semifinal-written-individual-solutions.md#^yau-2019-semifinal-written-individual-s2).

Suppose $\gamma$ is a probability measure on {0, 1, 2} such that $\gamma(0) > \gamma(2) > 0$ . Let $(\xi_{n})_{n \geq 1}$ be a sequence of i.i.d. random variables with common law $\gamma.$ Define the sequence

$$
Y_{0} = 0, \quad Y_{n + 1} = \max \{0, Y_{n} + \xi_{n + 1} - 1\}, \quad \forall n \geq 0.
$$

Show that $(Y_{n})_{n \geq 0}$ is an irreducible Markov chain on the state space $\mathbb{N} = \{0, 1, 2, \ldots\}$ and it is positive recurrent.

## Question 3

^yau-2019-semifinal-written-individual-q3

> Corresponding solution: [Reference solution for Question 3](../../solutions/yau/yau-2019-semifinal-written-individual-solutions.md#^yau-2019-semifinal-written-individual-s3).

Suppose $(\epsilon_{n})_{n \geq 1}$ is a sequence of i.i.d. random variables and the common law is Bernoulli:

$$
\mathbb{P}[\epsilon_{1} = 1] = \mathbb{P}[\epsilon_{1} = - 1] = 1 / 2.
$$

Consider the random series $\begin{array}{r}{f(x) = \sum_{n = 1}^{\infty} \epsilon_{n} x^{n}} \end{array}$ . Show that the random series attains zero infinitely many times on $x \in[0, 1)$ almost surely.

## Question 4

^yau-2019-semifinal-written-individual-q4

> Corresponding solution: [Reference solution for Question 4](../../solutions/yau/yau-2019-semifinal-written-individual-solutions.md#^yau-2019-semifinal-written-individual-s4).

Consider a randomized experiment with 2N units, half to be randomly assigned an active treatment, and the other half to be assigned the control treatment; the objective is to measure the efect of the active versus control treatments on an outcome, called Y . For example, the units could be people with high blood pressure, where Y is blood pressure one week after receiving the active drug or an inactive drug, a placebo, where the patient is blinded to which drug is being given.

The estimand, the goal of the experiment, is the average value of Y if all 2N units received active minus the average value of Y if all 2N units received control. Assume that these $2 \times 2N$ numbers are fixed quantities (in the statistical literature this assumption is known as SUTVA the stable-unittreatment-value assumption), which means that the outcome Y for the i-th unit receiving a particular treatment is a proper function of that unit and the treatment that unit i received.

Derive the following results in this simple situation.

a) Find the expectation of the estimator, the diference in the observed sample means (between those assigned treatment and those assigned control), in terms of the estimand (defined above), where expectation in this context refers to averaging over all possible random allocations.

b) The variance of the estimator described in part a) (again, with variance defined as averaging over all possible random allocations).

c) Find an unbiased estimator of the variance in part b), assuming additive treatment efects, that is, the treatment minus control values of Y are constant across the 2N units, so that the treatment versus control condition adds a constant value for all 2N units.

d) Find the bias of the estimator in part c) when the treatment efects are non-additive.

e) Generalize the results in parts a),b), c) and d) to the situation where 2N is replaced by $N_{t} + N_{c}$ with $N_{t}$ units getting active treatment and $N_{c}$ units getting control, where these sample sizes are unequal.

f) Argue that the estimator in part c), when the sample sizes are large, will look gaussian, and conduct a small simulation to indicate that this often happens with relatively small sample sizes.

g) Modify the first four parts to consider a diferent randomized experiment, but still with 2N units, half to be allocated to active and half to be allocated to control, but now we have a covariate, X, a background variable that is suspected to be related to $Y.$ . For example, X could be blood pressure today, pre-treatment. In this experiment, many randomized allocations are considered, but all allocations are rejected if the sample X means of the treated and controls are too diferent for example more than a standard deviation apart. Be careful here to note which results generalize and which do not.

h) Finally, consider the randomized experiment in part g) when $N_{t}$ units are treated and Nc are control, where $N_{t}$ and $N_{c}$ are not equal: Which results in parts $^{\mathrm{a), b), c)}}$ and d) generalize without modification? In particular, describe how the conclusion in part f) changes. Note that this is an interesting situation where the asymptotic distributions of sample means are not gaussian. What are these distributions?

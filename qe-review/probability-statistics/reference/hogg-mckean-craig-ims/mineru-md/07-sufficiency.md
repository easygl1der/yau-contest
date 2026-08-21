---
title: "Sufficiency"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: chapter
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Sufficiency

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 6 Maximum Likelihood Methods](./06-maximum-likelihood-methods.md) · [Ch. 8 Optimal Tests of Hypotheses →](./08-optimal-tests-of-hypotheses.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Chapter 7

# Sufficiency

# 7.1 Measures of Quality of Estimators

In Chapters 4 and 6 we presented procedures for finding point estimates, interval estimates, and tests of statistical hypotheses based on likelihood theory. In this and the next chapter, we present some optimal point estimates and tests for certain situations. We first consider point estimation.

In this chapter, as in Chapters 4 and 6, we find it convenient to use the letter $f$ to denote a pmf as well as a pdf. It is clear from the context whether we are discussing the distributions of discrete or continuous random variables.

Suppose $f(x; \theta)$ for $\theta \in \Omega$ is the pdf (pmf) of a continuous (discrete) random variable $X$ . Consider a point estimator $Y_{n} = u(X_{1}, \ldots, X_{n})$ based on a sample $X_{1}, \ldots, X_{n}$ . In Chapters 4 and 5, we discussed several properties of point estimators. Recall that $Y_{n}$ is a consistent estimator (Definition 5.1.2) of $\theta$ if $Y_{n}$ converges to $\theta$ in probability; i.e., $Y_{n}$ is close to $\theta$ for large sample sizes. This is definitely a desirable property of a point estimator. Under suitable conditions, Theorem 6.1.3 shows that the maximum likelihood estimator is consistent. Another property was unbiasedness (Definition 4.1.3), which says that $Y_{n}$ is an unbiased estimator of $\theta$ if $E(Y_{n}) = \theta$ . Recall that maximum likelihood estimators may not be unbiased, although generally they are asymptotically unbiased (see Theorem 6.2.2).

If two estimators of $\theta$ are unbiased, it would seem that we would choose the one with the smaller variance. This would be especially true if they were both approximately normal because the one with the smaller asymptotic variance (and hence asymptotic standard error) would tend to produce shorter asymptotic confidence intervals for $\theta$ . This leads to the following definition:

Definition 7.1.1. For a given positive integer $n$ , $Y = u(X_1, X_2, \ldots, X_n)$ is called a minimum variance unbiased estimator (MVUE) of the parameter $\theta$ if $Y$ is unbiased, that is, $E(Y) = \theta$ , and if the variance of $Y$ is less than or equal to the variance of every other unbiased estimator of $\theta$ .

Example 7.1.1. As an illustration, let $X_1, X_2, \ldots, X_9$ denote a random sample from a distribution that is $N(\theta, \sigma^2)$ , where $-\infty < \theta < \infty$ . Because the statistic

$\overline{X} = (X_{1} + X_{2} + \dots +X_{9}) / 9$ is $N(\theta ,\frac{\sigma^2}{9})$ , $\overline{X}$ is an unbiased estimator of $\theta$ . The statistic $X_{1}$ is $N(\theta ,\sigma^{2})$ , so $X_{1}$ is also an unbiased estimator of $\theta$ . Although the variance $\frac{\sigma^2}{9}$ of $\overline{X}$ is less than the variance $\sigma^2$ of $X_{1}$ , we cannot say, with $n = 9$ , that $\overline{X}$ is the minimum variance unbiased estimator (MVUE) of $\theta$ ; that definition requires that the comparison be made with every unbiased estimator of $\theta$ . To be sure, it is quite impossible to tabulate all other unbiased estimators of this parameter $\theta$ , so other methods must be developed for making the comparisons of the variances. A beginning on this problem is made in this chapter.

Let us now discuss the problem of point estimation of a parameter from a slightly different standpoint. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample of size $n$ from a distribution that has the pdf $f(x; \theta)$ , $\theta \in \Omega$ . The distribution may be of either the continuous or the discrete type. Let $Y = u(X_{1}, X_{2}, \ldots, X_{n})$ be a statistic on which we wish to base a point estimate of the parameter $\theta$ . Let $\delta(y)$ be that function of the observed value of the statistic $Y$ which is the point estimate of $\theta$ . Thus the function $\delta$ decides the value of our point estimate of $\theta$ and $\delta$ is called a decision function or a decision rule. One value of the decision function, say $\delta(y)$ , is called a decision. Thus a numerically determined point estimate of a parameter $\theta$ is a decision. Now a decision may be correct or it may be wrong. It would be useful to have a measure of the seriousness of the difference, if any, between the true value of $\theta$ and the point estimate $\delta(y)$ . Accordingly, with each pair, $[\theta, \delta(y)]$ , $\theta \in \Omega$ , we associate a nonnegative number $\mathcal{L}[\theta, \delta(y)]$ that reflects this seriousness. We call the function $\mathcal{L}$ the loss function. The expected (mean) value of the loss function is called the risk function. If $f_{Y}(y; \theta)$ , $\theta \in \Omega$ , is the pdf of $Y$ , the risk function $R(\theta, \delta)$ is given by

$$
R (\theta , \delta) = E \{\mathcal {L} [ \theta , \delta (y) ] \} = \int_ {- \infty} ^ {\infty} \mathcal {L} [ \theta , \delta (y) ] f _ {Y} (y; \theta) d y
$$

if $Y$ is a random variable of the continuous type. It would be desirable to select a decision function that minimizes the risk $R(\theta, \delta)$ for all values of $\theta$ , $\theta \in \Omega$ . But this is usually impossible because the decision function $\delta$ that minimizes $R(\theta, \delta)$ for one value of $\theta$ may not minimize $R(\theta, \delta)$ for another value of $\theta$ . Accordingly, we need either to restrict our decision function to a certain class or to consider methods of ordering the risk functions. The following example, while very simple, dramatizes these difficulties.

Example 7.1.2. Let $X_{1}, X_{2}, \ldots, X_{25}$ be a random sample from a distribution that is $N(\theta, 1)$ , for $-\infty < \theta < \infty$ . Let $Y = \overline{X}$ , the mean of the random sample, and let $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^2$ . We shall compare the two decision functions given by $\delta_{1}(y) = y$ and $\delta_{2}(y) = 0$ for $-\infty < y < \infty$ . The corresponding risk functions are

$$
R (\theta , \delta_ {1}) = E [ (\theta - Y) ^ {2} ] = \frac {1}{2 5}
$$

and

$$
R (\theta , \delta_ {2}) = E [ (\theta - 0) ^ {2} ] = \theta^ {2}.
$$

If, in fact, $\theta = 0$ , then $\delta_2(y) = 0$ is an excellent decision and we have $R(0,\delta_2) = 0$ . However, if $\theta$ differs from zero by very much, it is equally clear that $\delta_2 = 0$ is a poor decision. For example, if, in fact, $\theta = 2$ , $R(2,\delta_2) = 4 > R(2,\delta_1) = \frac{1}{25}$ . In general, we see that $R(\theta ,\delta_{2}) < R(\theta ,\delta_{1})$ , provided that $-\frac{1}{5} < \theta < \frac{1}{5}$ , and that otherwise $R(\theta ,\delta_2)\geq R(\theta ,\delta_1)$ . That is, one of these decision functions is better than the other for some values of $\theta$ , while the other decision function is better for other values of $\theta$ . If, however, we had restricted our consideration to decision functions $\delta$ such that $E[\delta (Y)] = \theta$ for all values of $\theta$ , $\theta \in \Omega$ , then the decision function $\delta_2(y) = 0$ is not allowed. Under this restriction and with the given $\mathcal{L}[\theta ,\delta (y)]$ , the risk function is the variance of the unbiased estimator $\delta (Y)$ , and we are confronted with the problem of finding the MVUE. Later in this chapter we show that the solution is $\delta (y) = y = \overline{x}$ .

Suppose, however, that we do not want to restrict ourselves to decision functions $\delta$ , such that $E[\delta(Y)] = \theta$ for all values of $\theta$ , $\theta \in \Omega$ . Instead, let us say that the decision function that minimizes the maximum of the risk function is the best decision function. Because, in this example, $R(\theta, \delta_2) = \theta^2$ is unbounded, $\delta_2(y) = 0$ is not, in accordance with this criterion, a good decision function. On the other hand, with $-\infty < \theta < \infty$ , we have

$$
\max _ {\theta} R (\theta , \delta_ {1}) = \max _ {\theta} (\frac {1}{2 5}) = \frac {1}{2 5}.
$$

Accordingly, $\delta_1(y) = y = \overline{x}$ seems to be a very good decision in accordance with this criterion because $\frac{1}{25}$ is small. As a matter of fact, it can be proved that $\delta_1$ is the best decision function, as measured by the minimax criterion, when the loss function is $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^2$ .

In this example we illustrated the following:

1. Without some restriction on the decision function, it is difficult to find a decision function that has a risk function which is uniformly less than the risk function of another decision.   
2. One principle of selecting a best decision function is called the minimax principle. This principle may be stated as follows: If the decision function given by $\delta_0(y)$ is such that, for all $\theta \in \Omega$ ,

$$
\max _ {\theta} R [ \theta , \delta_ {0} (y) ] \leq \max _ {\theta} R [ \theta , \delta (y) ]
$$

for every other decision function $\delta(y)$ , then $\delta_0(y)$ is called a minimax decision function.

With the restriction $E[\delta(Y)] = \theta$ and the loss function $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^2$ , the decision function that minimizes the risk function yields an unbiased estimator with minimum variance. If, however, the restriction $E[\delta(Y)] = \theta$ is replaced by some other condition, the decision function $\delta(Y)$ , if it exists, which minimizes $E\{[\theta - \delta(Y)]^2\}$ uniformly in $\theta$ is sometimes called the minimum mean-squared-error estimator. Exercises 7.1.6-7.1.8 provide examples of this type of estimator.

There are two additional observations about decision rules and loss functions that should be made at this point. First, since $Y$ is a statistic, the decision rule

$\delta(Y)$ is also a statistic, and we could have started directly with a decision rule based on the observations in a random sample, say, $\delta_1(X_1, X_2, \ldots, X_n)$ . The risk function is then given by

$$
\begin{array}{l} R (\theta , \delta_ {1}) = E \{\mathcal {L} [ \theta , \delta_ {1} (X _ {1}, \dots , X _ {n}) ] \} \\ = \int_ {- \infty} ^ {\infty} \dots \int_ {- \infty} ^ {\infty} \mathcal {L} [ \theta , \delta_ {1} (x _ {1}, \dots , x _ {n}) ] f (x _ {1}; \theta) \dots f (x _ {n}; \theta) d x _ {1} \dots d x _ {n} \\ \end{array}
$$

if the random sample arises from a continuous-type distribution. We do not do this, because, as we show in this chapter, it is rather easy to find a good statistic, say $Y$ , upon which to base all of the statistical inferences associated with a particular model. Thus we thought it more appropriate to start with a statistic that would be familiar, like the mle $Y = \overline{X}$ in Example 7.1.2. The second decision rule of that example could be written $\delta_2(X_1, X_2, \ldots, X_n) = 0$ , a constant no matter what values of $X_1, X_2, \ldots, X_n$ are observed.

The second observation is that we have only used one loss function, namely, the squared-error loss function $\mathcal{L}(\theta, \delta) = (\theta - \delta)^2$ . The absolute-error loss function $\mathcal{L}(\theta, \delta) = |\theta - \delta|$ is another popular one. The loss function defined by

$$
\begin{array}{l} \mathcal {L} (\theta , \delta) = 0, | \theta - \delta | \leq a, \\ = b, | \theta - \delta | > a, \\ \end{array}
$$

where $a$ and $b$ are positive constants, is sometimes referred to as the goalpost loss function. The reason for this terminology is that football fans recognize that it is similar to kicking a field goal: There is no loss (actually a three-point gain) if within $a$ units of the middle but $b$ units of loss (zero points awarded) if outside that restriction. In addition, loss functions can be asymmetric as well as symmetric, as the three previous ones have been. That is, for example, it might be more costly to underestimate the value of $\theta$ than to overestimate it. (Many of us think about this type of loss function when estimating the time it takes us to reach an airport to catch a plane.) Some of these loss functions are considered when studying Bayesian estimates in Chapter 11.

Let us close this section with an interesting illustration that raises a question leading to the likelihood principle, which many statisticians believe is a quality characteristic that estimators should enjoy. Suppose that two statisticians, $A$ and $B$ , observe 10 independent trials of a random experiment ending in success or failure. Let the probability of success on each trial be $\theta$ , where $0 < \theta < 1$ . Let us say that each statistician observes one success in these 10 trials. Suppose, however, that $A$ had decided to take $n = 10$ such observations in advance and found only one success, while $B$ had decided to take as many observations as needed to get the first success, which happened on the 10th trial. The model of $A$ is that $Y$ is $b(n = 10, \theta)$ and $y = 1$ is observed. On the other hand, $B$ is considering the random variable $Z$ that has a geometric pmf $g(z) = (1 - \theta)^{z - 1}\theta$ , $z = 1, 2, 3, \ldots$ , and $z = 10$ is observed. In either case, an estimate of $\theta$ could be the relative frequency of success given by

$$
{\frac {y}{n}} = {\frac {1}{z}} = {\frac {1}{1 0}}.
$$

Let us observe, however, that one of the corresponding estimators, $Y / n$ and $1 / Z$ , is biased. We have

$$
E \left(\frac {Y}{1 0}\right) = \frac {1}{1 0} E (Y) = \frac {1}{1 0} (1 0 \theta) = \theta ,
$$

while

$$
\begin{array}{l} E \left(\frac {1}{Z}\right) = \sum_ {z = 1} ^ {\infty} \frac {1}{z} (1 - \theta) ^ {z - 1} \theta \\ = \theta + \frac {1}{2} (1 - \theta) \theta + \frac {1}{3} (1 - \theta) ^ {2} \theta + \dots > \theta . \\ \end{array}
$$

That is, $1 / Z$ is a biased estimator while $Y / 10$ is unbiased. Thus $A$ is using an unbiased estimator while $B$ is not. Should we adjust $B$ 's estimator so that it, too, is unbiased?

It is interesting to note that if we maximize the two respective likelihood functions, namely,

$$
L _ {1} (\theta) = \left( \begin{array}{c} 1 0 \\ y \end{array} \right) \theta^ {y} (1 - \theta) ^ {1 0 - y}
$$

and

$$
L _ {2} (\theta) = (1 - \theta) ^ {z - 1} \theta ,
$$

with $n = 10$ , $y = 1$ , and $z = 10$ , we get exactly the same answer, $\hat{\theta} = \frac{1}{10}$ . This must be the case, because in each situation we are maximizing $(1 - \theta)^9\theta$ . Many statisticians believe that this is the way it should be and accordingly adopt the likelihood principle:

Suppose two different sets of data from possibly two different random experiments lead to respective likelihood ratios, $L_{1}(\theta)$ and $L_{2}(\theta)$ , that are proportional to each other. These two data sets provide the same information about the parameter $\theta$ and a statistician should obtain the same estimate of $\theta$ from either.

In our special illustration, we note that $L_{1}(\theta) \propto L_{2}(\theta)$ , and the likelihood principle states that statisticians $A$ and $B$ should make the same inference. Thus believers in the likelihood principle would not adjust the second estimator to make it unbiased.

# EXERCISES

7.1.1. Show that the mean $\overline{X}$ of a random sample of size $n$ from a distribution having pdf $f(x;\theta) = (1 / \theta)e^{-(x / \theta)}$ , $0 < x < \infty$ , $0 < \theta < \infty$ , zero elsewhere, is an unbiased estimator of $\theta$ and has variance $\theta^2 / n$ .

7.1.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a normal distribution with mean zero and variance $\theta$ , $0 < \theta < \infty$ . Show that $\sum_{1}^{n} X_{i}^{2} / n$ is an unbiased estimator of $\theta$ and has variance $2\theta^{2} / n$ .

7.1.3. Let $Y_{1} < Y_{2} < Y_{3}$ be the order statistics of a random sample of size 3 from the uniform distribution having pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , $0 < \theta < \infty$ , zero elsewhere. Show that $4Y_{1}$ , $2Y_{2}$ , and $\frac{4}{3}Y_{3}$ are all unbiased estimators of $\theta$ . Find the variance of each of these unbiased estimators.

7.1.4. Let $Y_{1}$ and $Y_{2}$ be two independent unbiased estimators of $\theta$ . Assume that the variance of $Y_{1}$ is twice the variance of $Y_{2}$ . Find the constants $k_{1}$ and $k_{2}$ so that $k_{1}Y_{1} + k_{2}Y_{2}$ is an unbiased estimator with the smallest possible variance for such a linear combination.

7.1.5. In Example 7.1.2 of this section, take $\mathcal{L}[\theta, \delta(y)] = |\theta - \delta(y)|$ . Show that $R(\theta, \delta_1) = \frac{1}{5}\sqrt{2/\pi}$ and $R(\theta, \delta_2) = |\theta|$ . Of these two decision functions $\delta_1$ and $\delta_2$ , which yields the smaller maximum risk?

7.1.6. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a Poisson distribution with parameter $\theta$ , $0 < \theta < \infty$ . Let $Y = \sum_{1}^{n} X_{i}$ and let $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^2$ . If we restrict our considerations to decision functions of the form $\delta(y) = b + y/n$ , where $b$ does not depend on $y$ , show that $R(\theta, \delta) = b^2 + \theta / n$ . What decision function of this form yields a uniformly smaller risk than every other decision function of this form? With this solution, say $\delta$ , and $0 < \theta < \infty$ , determine $\max_{\theta} R(\theta, \delta)$ if it exists.

7.1.7. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(\mu, \theta)$ , $0 < \theta < \infty$ , where $\mu$ is unknown. Let $Y = \sum_{1}^{n}(X_{i} - \overline{X})^{2} / n$ and let $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^{2}$ . If we consider decision functions of the form $\delta(y) = by$ , where $b$ does not depend upon $y$ , show that $R(\theta, \delta) = (\theta^{2} / n^{2})[(n^{2} - 1)b^{2} - 2n(n - 1)b + n^{2}]$ . Show that $b = n / (n + 1)$ yields a minimum risk decision function of this form. Note that $nY / (n + 1)$ is not an unbiased estimator of $\theta$ . With $\delta(y) = ny / (n + 1)$ and $0 < \theta < \infty$ , determine $\max_{\theta} R(\theta, \delta)$ if it exists.

7.1.8. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $b(1, \theta)$ , $0 \leq \theta \leq 1$ . Let $Y = \sum_{1}^{n} X_{i}$ and let $\mathcal{L}[\theta, \delta(y)] = [\theta - \delta(y)]^2$ . Consider decision functions of the form $\delta(y) = by$ , where $b$ does not depend upon $y$ . Prove that $R(\theta, \delta) = b^2 n\theta (1 - \theta) + (bn - 1)^2\theta^2$ . Show that

$$
\max  _ {\theta} R (\theta , \delta) = \frac {b ^ {4} n ^ {2}}{4 [ b ^ {2} n - (b n - 1) ^ {2} ]},
$$

provided that the value $b$ is such that $b^{2}n > (bn - 1)^{2}$ . Prove that $b = 1 / n$ does not minimize $\max_{\theta} R(\theta, \delta)$ .

7.1.9. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a Poisson distribution with mean $\theta > 0$ .

(a) Statistician $A$ observes the sample to be the values $x_{1}, x_{2}, \ldots, x_{n}$ with sum $y = \sum x_{i}$ . Find the mle of $\theta$ .   
(b) Statistician $B$ loses the sample values $x_{1}, x_{2}, \ldots, x_{n}$ but remembers the sum $y_{1}$ and the fact that the sample arose from a Poisson distribution. Thus $B$ decides to create some fake observations, which he calls $z_{1}, z_{2}, \ldots, z_{n}$ (as

he knows they will probably not equal the original $x$ -values) as follows. He notes that the conditional probability of independent Poisson random variables $Z_{1}, Z_{2}, \ldots, Z_{n}$ being equal to $z_{1}, z_{2}, \ldots, z_{n}$ , given $\sum z_{i} = y_{1}$ , is

$$
\frac {\frac {\theta^ {z _ {1}} e ^ {- \theta}}{z _ {1} !} \frac {\theta^ {z _ {2}} e ^ {- \theta}}{z _ {2} !} \cdots \frac {\theta^ {z _ {n}} e ^ {- \theta}}{z _ {n} !}}{\frac {(n \theta) ^ {y _ {1}} e ^ {- n \theta}}{y _ {1} !}} = \frac {y _ {1} !}{z _ {1} ! z _ {2} ! \cdots z _ {n} !} \left(\frac {1}{n}\right) ^ {z _ {1}} \left(\frac {1}{n}\right) ^ {z _ {2}} \dots \left(\frac {1}{n}\right) ^ {z _ {n}}
$$

since $Y_{1} = \sum Z_{i}$ has a Poisson distribution with mean $n\theta$ . The latter distribution is multinomial with $y_{1}$ independent trials, each terminating in one of $n$ mutually exclusive and exhaustive ways, each of which has the same probability $1 / n$ . Accordingly, $B$ runs such a multinomial experiment $y_{1}$ independent trials and obtains $z_{1}, z_{2}, \ldots, z_{n}$ . Find the likelihood function using these $z$ -values. Is it proportional to that of statistician $A$ ?

Hint: Here the likelihood function is the product of this conditional pdf and the pdf of $Y_{1} = \sum Z_{i}$ .

# 7.2 A Sufficient Statistic for a Parameter

Suppose that $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a distribution that has pdf $f(x; \theta)$ , $\theta \in \Omega$ . In Chapters 4 and 6, we constructed statistics to make statistical inferences as illustrated by point and interval estimation and tests of statistical hypotheses. We note that a statistic, for example, $Y = u(X_{1}, X_{2}, \ldots, X_{n})$ , is a form of data reduction. To illustrate, instead of listing all of the individual observations $X_{1}, X_{2}, \ldots, X_{n}$ , we might prefer to give only the sample mean $\overline{X}$ or the sample variance $S^{2}$ . Thus statisticians look for ways of reducing a set of data so that these data can be more easily understood without losing the meaning associated with the entire set of observations.

It is interesting to note that a statistic $Y = u(X_{1},X_{2},\ldots ,X_{n})$ really partitions the sample space of $X_{1},X_{2},\ldots ,X_{n}$ . For illustration, suppose we say that the sample was observed and $\overline{x} = 8.32$ . There are many points in the sample space which have that same mean of 8.32, and we can consider them as belonging to the set $\{(x_1,x_2,\dots,x_n):\overline{x} = 8.32\}$ . As a matter of fact, all points on the hyperplane

$$
x _ {1} + x _ {2} + \dots + x _ {n} = (8. 3 2) n
$$

yield the mean of $\overline{x} = 8.32$ , so this hyperplane is the set. However, there are many values that $\overline{X}$ can take, and thus there are many such sets. So, in this sense, the sample mean $\overline{X}$ , or any statistic $Y = u(X_1, X_2, \ldots, X_n)$ , partitions the sample space into a collection of sets.

Often in the study of statistics the parameter $\theta$ of the model is unknown; thus, we need to make some statistical inference about it. In this section we consider a statistic denoted by $Y_{1} = u_{1}(X_{1},X_{2},\ldots ,X_{n})$ , which we call a sufficient statistic and which we find is good for making those inferences. This sufficient statistic partitions the sample space in such a way that, given

$$
\left(X _ {1}, X _ {2}, \ldots , X _ {n}\right) \in \left\{\left(x _ {1}, x _ {2}, \ldots , x _ {n}\right): u _ {1} \left(x _ {1}, x _ {2}, \ldots , x _ {n}\right) = y _ {1} \right\},
$$

the conditional probability of $X_{1},X_{2},\ldots ,X_{n}$ does not depend upon $\theta$ . Intuitively, this means that once the set determined by $Y_{1} = y_{1}$ is fixed, the distribution of another statistic, say $Y_{2} = u_{2}(X_{1},X_{2},\dots ,X_{n})$ , does not depend upon the parameter $\theta$ because the conditional distribution of $X_{1},X_{2},\dots ,X_{n}$ does not depend upon $\theta$ . Hence it is impossible to use $Y_{2}$ , given $Y_{1} = y_{1}$ , to make a statistical inference about $\theta$ . So, in a sense, $Y_{1}$ exhausts all the information about $\theta$ that is contained in the sample. This is why we call $Y_{1} = u_{1}(X_{1},X_{2},\dots ,X_{n})$ a sufficient statistic.

To understand clearly the definition of a sufficient statistic for a parameter $\theta$ , we start with an illustration.

Example 7.2.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from the distribution that has pmf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \theta^ {x} (1 - \theta) ^ {1 - x} & x = 0, 1; 0 <   \theta <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

The statistic $Y_{1} = X_{1} + X_{2} + \dots +X_{n}$ has the pmf

$$
f _ {Y _ {1}} (y _ {1}; \theta) = \left\{ \begin{array}{l l} {\binom {n} {y _ {1}}} \theta^ {y _ {1}} (1 - \theta) ^ {n - y _ {1}} & y _ {1} = 0, 1, \ldots , n \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

What is the conditional probability

$$
P \left(X _ {1} = x _ {1}, X _ {2} = x _ {2}, \dots , X _ {n} = x _ {n} \mid Y _ {1} = y _ {1}\right) = P (A \mid B),
$$

say, where $y_{1} = 0, 1, 2, \ldots, n$ ? Unless the sum of the integers $x_{1}, x_{2}, \ldots, x_{n}$ (each of which equals zero or 1) is equal to $y_{1}$ , the conditional probability obviously equals zero because $A \cap B = \phi$ . But in the case $y_{1} = \sum x_{i}$ , we have that $A \subset B$ , so that $A \cap B = A$ and $P(A|B) = P(A) / P(B)$ ; thus, the conditional probability equals

$$
\begin{array}{l} \frac {\theta^ {x _ {1}} (1 - \theta) ^ {1 - x _ {1}} \theta^ {x _ {2}} (1 - \theta) ^ {1 - x _ {2}} \cdots \theta^ {x _ {n}} (1 - \theta) ^ {1 - x _ {n}}}{\binom {n} {y _ {1}} \theta^ {y _ {1}} (1 - \theta) ^ {n - y _ {1}}} = \frac {\theta^ {\sum x _ {i}} (1 - \theta) ^ {n - \sum x _ {i}}}{\binom {n} {\sum x _ {i}} \theta^ {\sum x _ {i}} (1 - \theta) ^ {n - \sum x _ {i}}} \\ = \frac {1}{\binom {n} {\sum x _ {i}}}. \\ \end{array}
$$

Since $y_{1} = x_{1} + x_{2} + \dots + x_{n}$ equals the number of ones in the $n$ independent trials, this is the conditional probability of selecting a particular arrangement of $y_{1}$ ones and $(n - y_{1})$ zeros. Note that this conditional probability does not depend upon the value of the parameter $\theta$ .

In general, let $f_{Y_1}(y_1;\theta)$ be the pmf of the statistic $Y_{1} = u_{1}(X_{1},X_{2},\ldots ,X_{n})$ , where $X_{1},X_{2},\ldots ,X_{n}$ is a random sample arising from a distribution of the discrete type having pmf $f(x;\theta)$ , $\theta \in \Omega$ . The conditional probability of $X_{1} = x_{1}$ , $X_{2} = x_{2},\ldots ,X_{n} = x_{n}$ , given $Y_{1} = y_{1}$ , equals

$$
\frac {f (x _ {1} ; \theta) f (x _ {2} ; \theta) \cdots f (x _ {n} ; \theta)}{f _ {Y _ {1}} [ u _ {1} (x _ {1} , x _ {2} , \ldots , x _ {n}) ; \theta ]},
$$

provided that $x_{1}, x_{2}, \ldots, x_{n}$ are such that the fixed $y_{1} = u_{1}(x_{1}, x_{2}, \ldots, x_{n})$ , and equals zero otherwise. We say that $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ is a sufficient statistic for $\theta$ if and only if this ratio does not depend upon $\theta$ . While, with distributions of the continuous type, we cannot use the same argument, we do, in this case, accept the fact that if this ratio does not depend upon $\theta$ , then the conditional distribution of $X_{1}, X_{2}, \ldots, X_{n}$ , given $Y_{1} = y_{1}$ , does not depend upon $\theta$ . Thus, in both cases, we use the same definition of a sufficient statistic for $\theta$ .

Definition 7.2.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample of size $n$ from a distribution that has pdf or pmf $f(x; \theta)$ , $\theta \in \Omega$ . Let $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ be a statistic whose pdf or pmf is $f_{Y_{1}}(y_{1}; \theta)$ . Then $Y_{1}$ is a sufficient statistic for $\theta$ if and only if

$$
\frac {f (x _ {1} ; \theta) f (x _ {2} ; \theta) \cdots f (x _ {n} ; \theta)}{f _ {Y _ {1}} [ u _ {1} (x _ {1} , x _ {2} , \ldots , x _ {n}) ; \theta ]} = H (x _ {1}, x _ {2}, \ldots , x _ {n}),
$$

where $H(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\theta \in \Omega$

Remark 7.2.1. In most cases in this book, $X_{1}, X_{2}, \ldots, X_{n}$ represent the observations of a random sample; that is, they are iid. It is not necessary, however, in more general situations, that these random variables be independent; as a matter of fact, they do not need to be identically distributed. Thus, more generally, the definition of sufficiency of a statistic $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ would be extended to read that

$$
\frac {f (x _ {1} , x _ {2} , \ldots , x _ {n} ; \theta)}{f _ {Y _ {1}} [ u _ {1} (x _ {1} , x _ {2} , \ldots , x _ {n}) ; \theta) ]} = H (x _ {1}, x _ {2}, \ldots , x _ {n})
$$

does not depend upon $\theta \in \Omega$ , where $f(x_{1},x_{2},\ldots ,x_{n};\theta)$ is the joint pdf or pmf of $X_{1},X_{2},\ldots ,X_{n}$ . There are even a few situations in which we need an extension like this one in this book.

We now give two examples that are illustrative of the definition.

Example 7.2.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a gamma distribution with $\alpha = 2$ and $\beta = \theta > 0$ . Because the mgf associated with this distribution is given by $M(t) = (1 - \theta t)^{-2}$ , $t < 1 / \theta$ , the mgf of $Y_{1} = \sum_{i=1}^{n} X_{i}$ is

$$
\begin{array}{l} E \left[ e ^ {t \left(X _ {1} + X _ {2} + \dots + X _ {n}\right)} \right] = E \left(e ^ {t X _ {1}}\right) E \left(e ^ {t X _ {2}}\right) \dots E \left(e ^ {t X _ {n}}\right) \\ = \left[ (1 - \theta t) ^ {- 2} \right] ^ {n} = (1 - \theta t) ^ {- 2 n}. \\ \end{array}
$$

Thus $Y_{1}$ has a gamma distribution with $\alpha = 2n$ and $\beta = \theta$ , so that its pdf is

$$
f _ {Y _ {1}} (y _ {1}; \theta) = \left\{ \begin{array}{l l} \frac {1}{\Gamma (2 n) \theta^ {2 n}} y _ {1} ^ {2 n - 1} e ^ {- y _ {1} / \theta} & 0 <   y _ {1} <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Thus we have

$$
\frac {\left[ \frac {x _ {1} ^ {2 - 1} e ^ {- x _ {1} / \theta}}{\Gamma (2) \theta^ {2}} \right] \left[ \frac {x _ {2} ^ {2 - 1} e ^ {- x _ {2} / \theta}}{\Gamma (2) \theta^ {2}} \right] \cdots \left[ \frac {x _ {n} ^ {2 - 1} e ^ {- x _ {n} / \theta}}{\Gamma (2) \theta^ {2}} \right]}{\frac {(x _ {1} + x _ {2} + \cdots + x _ {n}) ^ {2 n - 1} e ^ {- (x _ {1} + x _ {2} + \cdots + x _ {n}) / \theta}}{\Gamma (2 n) \theta^ {2 n}}} = \frac {\Gamma (2 n)}{[ \Gamma (2) ] ^ {n}} \frac {x _ {1} x _ {2} \cdots x _ {n}}{(x _ {1} + x _ {2} + \cdots + x _ {n}) ^ {2 n - 1}},
$$

where $0 < x_{i} < \infty$ , $i = 1,2,\ldots,n$ . Since this ratio does not depend upon $\theta$ , the sum $Y_{1}$ is a sufficient statistic for $\theta$ .

Example 7.2.3. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ denote the order statistics of a random sample of size $n$ from the distribution with pdf

$$
f (x; \theta) = e ^ {- (x - \theta)} I _ {(\theta , \infty)} (x).
$$

Here we use the indicator function of a set $A$ defined by

$$
I _ {A} (x) = \left\{ \begin{array}{l l} 1 & x \in A \\ 0 & x \notin A. \end{array} \right.
$$

This means, of course, that $f(x; \theta) = e^{-(x - \theta)}$ , $\theta < x < \infty$ , zero elsewhere. The pdf of $Y_{1} = \min(X_{i})$ is

$$
f _ {Y _ {1}} (y _ {1}; \theta) = n e ^ {- n (y _ {1} - \theta)} I _ {(\theta , \infty)} (y _ {1}).
$$

Note that $\theta < \min\{x_i\}$ if and only if $\theta < x_i$ , for all $i = 1, \ldots, n$ . Notationally this can be expressed as $I_{(\theta, \infty)}(\min x_i) = \prod_{i=1}^{n} I_{(\theta, \infty)}(x_i)$ . Thus we have that

$$
\frac {\prod_ {i = 1} ^ {n} e ^ {- (x _ {i} - \theta)} I _ {(\theta , \infty)} (x _ {i})}{n e ^ {- n (\min x _ {i} - \theta)} I _ {(\theta , \infty)} (\min x _ {i})} = \frac {e ^ {- x _ {1} - x _ {2} - \cdots - x _ {n}}}{n e ^ {- n \min x _ {i}}}.
$$

Since this ratio does not depend upon $\theta$ , the first order statistic $Y_{1}$ is a sufficient statistic for $\theta$ .

If we are to show by means of the definition that a certain statistic $Y_{1}$ is or is not a sufficient statistic for a parameter $\theta$ , we must first of all know the pdf of $Y_{1}$ , say $f_{Y_1}(y_1;\theta)$ . In many instances it may be quite difficult to find this pdf. Fortunately, this problem can be avoided if we prove the following factorization theorem of Neyman.

Theorem 7.2.1 (Neyman). Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that has pdf or pmf $f(x; \theta)$ , $\theta \in \Omega$ . The statistic $Y_{1} = u_{1}(X_{1}, \ldots, X_{n})$ is a sufficient statistic for $\theta$ if and only if we can find two nonnegative functions, $k_{1}$ and $k_{2}$ , such that

$$
f \left(x _ {1}; \theta\right) f \left(x _ {2}; \theta\right) \dots f \left(x _ {n}; \theta\right) = k _ {1} \left[ u _ {1} \left(x _ {1}, x _ {2}, \dots , x _ {n}\right); \theta \right] k _ {2} \left(x _ {1}, x _ {2}, \dots , x _ {n}\right), \tag {7.2.1}
$$

where $k_{2}(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\theta$

Proof. We shall prove the theorem when the random variables are of the continuous type. Assume that the factorization is as stated in the theorem. In our proof we shall make the one-to-one transformation $y_{1} = u_{1}(x_{1}, x_{2}, \ldots, x_{n})$ , $y_{2} = u_{2}(x_{1}, x_{2}, \ldots, x_{n}), \ldots, y_{n} = u_{n}(x_{1}, x_{2}, \ldots, x_{n})$ having the inverse functions $x_{1} = w_{1}(y_{1}, y_{2}, \ldots, y_{n})$ , $x_{2} = w_{2}(y_{1}, y_{2}, \ldots, y_{n}), \ldots, x_{n} = w_{n}(y_{1}, y_{2}, \ldots, y_{n})$ and Jacobian $J$ ; see the note after the proof. The pdf of the statistic $Y_{1}, Y_{2}, \ldots, Y_{n}$ is then given by

$$
g (y _ {1}, y _ {2}, \dots , y _ {n}; \theta) = k _ {1} (y _ {1}; \theta) k _ {2} (w _ {1}, w _ {2}, \dots , w _ {n}) | J |,
$$

where $w_{i} = w_{i}(y_{1},y_{2},\ldots ,y_{n})$ , $i = 1,2,\dots ,n$ . The pdf of $Y_{1}$ , say $f_{Y_1}(y_1;\theta)$ , is given by

$$
\begin{array}{l} f _ {Y _ {1}} (y _ {1}; \theta) = \int_ {- \infty} ^ {\infty} \dots \int_ {- \infty} ^ {\infty} g (y _ {1}, y _ {2}, \dots , y _ {n}; \theta) d y _ {2} \dots d y _ {n} \\ = k _ {1} \left(y _ {1}; \theta\right) \int_ {- \infty} ^ {\infty} \dots \int_ {- \infty} ^ {\infty} | J | k _ {2} \left(w _ {1}, w _ {2}, \dots , w _ {n}\right) d y _ {2} \dots d y _ {n}. \\ \end{array}
$$

Now the function $k_{2}$ does not depend upon $\theta$ , nor is $\theta$ involved in either the Jacobian $J$ or the limits of integration. Hence the $(n - 1)$ -fold integral in the right-hand member of the preceding equation is a function of $y_{1}$ alone, for example, $m(y_{1})$ . Thus

$$
f _ {Y _ {1}} (y _ {1}; \theta) = k _ {1} (y _ {1}; \theta) m (y _ {1}).
$$

If $m(y_{1}) = 0$ , then $f_{Y_1}(y_1;\theta) = 0$ . If $m(y_{1}) > 0$ , we can write

$$
k _ {1} [ u _ {1} (x _ {1}, x _ {2}, \ldots , x _ {n}); \theta ] = \frac {f _ {Y _ {1}} [ u _ {1} (x _ {1} , \ldots , x _ {n}) ; \theta ]}{m [ u _ {1} (x _ {1} , \ldots , x _ {n}) ]},
$$

and the assumed factorization becomes

$$
f (x _ {1}; \theta) \dots f (x _ {n}; \theta) = f _ {\mathrm {Y} _ {1}} [ u _ {1} (x _ {1}, \ldots , x _ {n}); \theta ] \frac {k _ {2} (x _ {1} , \ldots , x _ {n})}{m [ u _ {1} (x _ {1} , \ldots , x _ {n}) ]}.
$$

Since neither the function $k_{2}$ nor the function $m$ depends upon $\theta$ , then in accordance with the definition, $Y_{1}$ is a sufficient statistic for the parameter $\theta$ .

Conversely, if $Y_{1}$ is a sufficient statistic for $\theta$ , the factorization can be realized by taking the function $k_{1}$ to be the pdf of $Y_{1}$ , namely, the function $f_{Y_1}$ . This completes the proof of the theorem.

Note that the assumption of a one-to-one transformation made in the proof is not needed; see Lehmann (1986) for a more rigorous proof. This theorem characterizes sufficiency and, as the following examples show, is usually much easier to work with than the definition of sufficiency.

Example 7.2.4. Let $X_1, X_2, \ldots, X_n$ denote a random sample from a distribution that is $N(\theta, \sigma^2)$ , $-\infty < \theta < \infty$ , where the variance $\sigma^2 > 0$ is known. If $\overline{x} = \sum_{i=1}^{n} x_i / n$ , then

$$
\sum_ {i = 1} ^ {n} (x _ {i} - \theta) ^ {2} = \sum_ {i = 1} ^ {n} [ (x _ {i} - \overline {{x}}) + (\overline {{x}} - \theta) ] ^ {2} = \sum_ {i = 1} ^ {n} (x _ {i} - \overline {{x}}) ^ {2} + n (\overline {{x}} - \theta) ^ {2}
$$

because

$$
2 \sum_ {i = 1} ^ {n} (x _ {i} - \overline {{x}}) (\overline {{x}} - \theta) = 2 (\overline {{x}} - \theta) \sum_ {i = 1} ^ {n} (x _ {i} - \overline {{x}}) = 0.
$$

Thus the joint pdf of $X_{1},X_{2},\ldots ,X_{n}$ may be written

$$
\begin{array}{l} \left(\frac {1}{\sigma \sqrt {2 \pi}}\right) ^ {n} \exp \left[ - \sum_ {i = 1} ^ {n} (x _ {i} - \theta) ^ {2} / 2 \sigma^ {2} \right] \\ = \left\{\exp \left[ - n (\bar {x} - \theta) ^ {2} / 2 \sigma^ {2} \right] \right\} \left\{\frac {\exp \left[ - \sum_ {i = 1} ^ {n} \left(x _ {i} - \bar {x}\right) ^ {2} / 2 \sigma^ {2} \right]}{(\sigma \sqrt {2 \pi}) ^ {n}} \right\}. \\ \end{array}
$$

Because the first factor of the right-hand member of this equation depends upon $x_{1}, x_{2}, \ldots, x_{n}$ only through $\overline{x}$ , and the second factor does not depend upon $\theta$ , the factorization theorem implies that the mean $\overline{X}$ of the sample is, for any particular value of $\sigma^2$ , a sufficient statistic for $\theta$ , the mean of the normal distribution.

We could have used the definition in the preceding example because we know that $\overline{X}$ is $N(\theta, \sigma^2 / n)$ . Let us now consider an example in which the use of the definition is inappropriate.

Example 7.2.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution with pdf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \theta x ^ {\theta - 1} & 0 <   x <   1 \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

where $0 < \theta$ . The joint pdf of $X_{1}, X_{2}, \ldots, X_{n}$ is

$$
\theta^ {n} \left(\prod_ {i = 1} ^ {n} x _ {i}\right) ^ {\theta - 1} = \left[ \theta^ {n} \left(\prod_ {i = 1} ^ {n} x _ {i}\right) ^ {\theta} \right] \left(\frac {1}{\prod_ {i = 1} ^ {n} x _ {i}}\right),
$$

where $0 < x_{i} < 1$ , $i = 1,2,\ldots,n$ . In the factorization theorem, let

$$
k _ {1} \left[ u _ {1} \left(x _ {1}, x _ {2}, \dots , x _ {n}\right); \theta \right] = \theta^ {n} \left(\prod_ {i = 1} ^ {n} x _ {i}\right) ^ {\theta}
$$

and

$$
k _ {2} (x _ {1}, x _ {2}, \ldots , x _ {n}) = \frac {1}{\prod_ {i = 1} ^ {n} x _ {i}}.
$$

Since $k_{2}(x_{1}, x_{2}, \ldots, x_{n})$ does not depend upon $\theta$ , the product $\prod_{i=1}^{n} X_{i}$ is a sufficient statistic for $\theta$ .

There is a tendency for some readers to apply incorrectly the factorization theorem in those instances in which the domain of positive probability density depends upon the parameter $\theta$ . This is due to the fact that they do not give proper consideration to the domain of the function $k_{2}(x_{1},x_{2},\ldots ,x_{n})$ . This is illustrated in the next example.

Example 7.2.6. In Example 7.2.3 with $f(x; \theta) = e^{-(x - \theta)} I_{(\theta, \infty)}(x)$ , it was found that the first order statistic $Y_1$ is a sufficient statistic for $\theta$ . To illustrate our point about not considering the domain of the function, take $n = 3$ and note that

$$
e ^ {- (x _ {1} - \theta)} e ^ {- (x _ {2} - \theta)} e ^ {- (x _ {3} - \theta)} = [ e ^ {- 3 \max x _ {i} + 3 \theta} ] [ e ^ {- x _ {1} - x _ {2} - x _ {3} + 3 \max x _ {i}} ]
$$

or a similar expression. Certainly, in the latter formula, there is no $\theta$ in the second factor and it might be assumed that $Y_{3} = \max X_{i}$ is a sufficient statistic for $\theta$ . Of course, this is incorrect because we should have written the joint pdf of $X_{1}, X_{2}, X_{3}$ as

$$
\prod_ {i = 1} ^ {3} \left[ e ^ {- (x _ {i} - \theta)} I _ {(\theta , \infty)} (x _ {i}) \right] = \left[ e ^ {3 \theta} I _ {(\theta , \infty)} (\min x _ {i}) \right] \left[ \exp \left\{- \sum_ {i = 1} ^ {3} x _ {i} \right\} \right]
$$

because $I_{(\theta, \infty)}(\min x_i) = I_{(\theta, \infty)}(x_1)I_{(\theta, \infty)}(x_2)I_{(\theta, \infty)}(x_3)$ . A similar statement cannot be made with $\max x_i$ . Thus $Y_1 = \min X_i$ is the sufficient statistic for $\theta$ , not $Y_3 = \max X_i$ .

# EXERCISES

7.2.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ be iid $N(0, \theta)$ , $0 < \theta < \infty$ . Show that $\sum_{1}^{n} X_{i}^{2}$ is a sufficient statistic for $\theta$ .

7.2.2. Prove that the sum of the observations of a random sample of size $n$ from a Poisson distribution having parameter $\theta$ , $0 < \theta < \infty$ , is a sufficient statistic for $\theta$ .

7.2.3. Show that the $n$ th order statistic of a random sample of size $n$ from the uniform distribution having pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , $0 < \theta < \infty$ , zero elsewhere, is a sufficient statistic for $\theta$ . Generalize this result by considering the pdf $f(x; \theta) = Q(\theta) M(x)$ , $0 < x < \theta$ , $0 < \theta < \infty$ , zero elsewhere. Here, of course,

$$
\int_ {0} ^ {\theta} M (x) d x = \frac {1}{Q (\theta)}.
$$

7.2.4. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample of size $n$ from a geometric distribution that has pmf $f(x; \theta) = (1 - \theta)^{x}\theta$ , $x = 0, 1, 2, \ldots$ , $0 < \theta < 1$ , zero elsewhere. Show that $\sum_{1}^{n}X_{i}$ is a sufficient statistic for $\theta$ .

7.2.5. Show that the sum of the observations of a random sample of size $n$ from a gamma distribution that has pdf $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , $0 < \theta < \infty$ , zero elsewhere, is a sufficient statistic for $\theta$ .

7.2.6. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample of size $n$ from a beta distribution with parameters $\alpha = \theta$ and $\beta = 5$ . Show that the product $X_{1}X_{2}\dots X_{n}$ is a sufficient statistic for $\theta$ .

7.2.7. Show that the product of the sample observations is a sufficient statistic for $\theta > 0$ if the random sample is taken from a gamma distribution with parameters $\alpha = \theta$ and $\beta = 6$ .

7.2.8. What is the sufficient statistic for $\theta$ if the sample arises from a beta distribution in which $\alpha = \beta = \theta > 0$ ?

7.2.9. We consider a random sample $X_{1}, X_{2}, \ldots, X_{n}$ from a distribution with pdf $f(x; \theta) = (1 / \theta) \exp(-x / \theta)$ , $0 < x < \infty$ , zero elsewhere, where $0 < \theta$ . Possibly, in a life-testing situation, however, we only observe the first $r$ order statistics $Y_{1} < Y_{2} < \dots < Y_{r}$ .

(a) Record the joint pdf of these order statistics and denote it by $L(\theta)$ .   
(b) Under these conditions, find the mle, $\hat{\theta}$ , by maximizing $L(\theta)$ .   
(c) Find the mgf and pdf of $\hat{\theta}$ .   
(d) With a slight extension of the definition of sufficiency, is $\hat{\theta}$ a sufficient statistic?

# 7.3 Properties of a Sufficient Statistic

Suppose $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample on a random variable with pdf or pmf $f(x; \theta)$ , where $\theta \in \Omega$ . In this section we discuss how sufficiency is used to determine MVUEs. First note that a sufficient estimate is not unique in any sense. For if $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ is a sufficient statistic and $Y_{2} = g(Y_{1})$ is a statistic, where $g(x)$ is a one-to-one function, then

$$
\begin{array}{l} f (x _ {1}; \theta) f (x _ {2}; \theta) \dots f (x _ {n}; \theta) = k _ {1} [ u _ {1} (y _ {1}); \theta ] k _ {2} (x _ {1}, x _ {2}, \dots , x _ {n}) \\ = k _ {1} \left[ u _ {1} \left(g ^ {- 1} \left(y _ {2}\right)\right); \theta \right] k _ {2} \left(x _ {1}, x _ {2}, \dots , x _ {n}\right); \\ \end{array}
$$

hence, by the factorization theorem, $Y_{2}$ is also sufficient. However, as the theorem below shows, sufficiency can lead to a best point estimate.

We first refer back to Theorem 2.3.1 of Section 2.3: If $X_{1}$ and $X_{2}$ are random variables such that the variance of $X_{2}$ exists, then

$$
E \left[ X _ {2} \right] = E \left[ E \left(X _ {2} \mid X _ {1}\right) \right]
$$

and

$$
\operatorname {V a r} \left(X _ {2}\right) \geq \operatorname {V a r} \left[ E \left(X _ {2} \mid X _ {1}\right) \right].
$$

For the adaptation in the context of sufficient statistics, we let the sufficient statistic $Y_{1}$ be $X_{1}$ and $Y_{2}$ , an unbiased statistic of $\theta$ , be $X_{2}$ . Thus, with $E(Y_{2}|y_{1}) = \varphi(y_{1})$ , we have

$$
\theta = E \left(Y _ {2}\right) = E \left[ \varphi \left(Y _ {1}\right) \right]
$$

and

$$
\operatorname {V a r} \left(Y _ {2}\right) \geq \operatorname {V a r} \left[ \varphi \left(Y _ {1}\right) \right].
$$

That is, through this conditioning, the function $\varphi(Y_1)$ of the sufficient statistic $Y_1$ is an unbiased estimator of $\theta$ having a smaller variance than that of the unbiased estimator $Y_2$ . We summarize this discussion more formally in the following theorem, which can be attributed to Rao and Blackwell.

Theorem 7.3.1 (Rao-Blackwell). Let $X_{1}, X_{2}, \ldots, X_{n}$ , $n$ a fixed positive integer, denote a random sample from a distribution (continuous or discrete) that has pdf or pmf $f(x; \theta)$ , $\theta \in \Omega$ . Let $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ be a sufficient statistic for $\theta$ , and let $Y_{2} = u_{2}(X_{1}, X_{2}, \ldots, X_{n})$ , not a function of $Y_{1}$ alone, be an unbiased estimator of $\theta$ . Then $E(Y_{2}|y_{1}) = \varphi(y_{1})$ defines a statistic $\varphi(Y_{1})$ . This statistic $\varphi(Y_{1})$ is a function of the sufficient statistic for $\theta$ ; it is an unbiased estimator of $\theta$ ; and its variance is less than or equal to that of $Y_{2}$ .

This theorem tells us that in our search for an MVUE of a parameter, we may, if a sufficient statistic for the parameter exists, restrict that search to functions of the sufficient statistic. For if we begin with an unbiased estimator $Y_{2}$ alone, then we can always improve on this by computing $E(Y_{2}|y_{1}) = \varphi (y_{1})$ so that $\varphi (Y_1)$ is an unbiased estimator with a smaller variance than that of $Y_{2}$ .

After Theorem 7.3.1, many students believe that it is necessary to find first some unbiased estimator $Y_{2}$ in their search for $\varphi(Y_{1})$ , an unbiased estimator of $\theta$ based upon the sufficient statistic $Y_{1}$ . This is not the case at all, and Theorem 7.3.1 simply convinces us that we can restrict our search for a best estimator to functions of $Y_{1}$ . Furthermore, there is a connection between sufficient statistics and maximum likelihood estimates, as shown in the following theorem:

Theorem 7.3.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that has pdf or pmf $f(x; \theta)$ , $\theta \in \Omega$ . If a sufficient statistic $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ for $\theta$ exists and if a maximum likelihood estimator $\hat{\theta}$ of $\theta$ also exists uniquely, then $\hat{\theta}$ is a function of $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ .

Proof. Let $f_{Y_1}(y_1; \theta)$ be the pdf or pmf of $Y_1$ . Then by the definition of sufficiency, the likelihood function

$$
\begin{array}{l} L (\theta ; x _ {1}, x _ {2}, \dots , x _ {n}) = f (x _ {1}; \theta) f (x _ {2}; \theta) \dots f (x _ {n}; \theta) \\ = f _ {Y _ {1}} \left[ u _ {1} \left(x _ {1}, x _ {2}, \dots , x _ {n}\right); \theta \right] H \left(x _ {1}, x _ {2}, \dots , x _ {n}\right), \\ \end{array}
$$

where $H(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\theta$ . Thus $L$ and $f_{Y_1}$ , as functions of $\theta$ , are maximized simultaneously. Since there is one and only one value of $\theta$ that maximizes $L$ and hence $f_{Y_1}[u_1(x_1,x_2,\dots,x_n);\theta ]$ , that value of $\theta$ must be a function of $u_{1}(x_{1},x_{2},\ldots ,x_{n})$ . Thus the mle $\hat{\theta}$ is a function of the sufficient statistic $Y_{1} = u_{1}(X_{1},X_{2},\ldots ,X_{n})$ .

We know from Chapters 4 and 6 that, generally, mles are asymptotically unbiased estimators of $\theta$ . Hence, one way to proceed is to find a sufficient statistic and then find the mle. Based on this, we can often obtain an unbiased estimator that is a function of the sufficient statistic. This process is illustrated in the following example.

Example 7.3.1. Let $X_{1},\ldots ,X_{n}$ be iid with pdf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \theta e ^ {- \theta x} & 0 <   x <   \infty ,   \theta > 0 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Suppose we want an MVUE of $\theta$ . The joint pdf (likelihood function) is

$$
L (\theta ; x _ {1}, \dots , x _ {n}) = \theta^ {n} e ^ {- \theta \sum_ {i = 1} ^ {n} x _ {i}}, \quad \text {f o r} x _ {i} > 0, i = 1, \dots , n.
$$

Hence, by the factorization theorem, the statistic $Y_{1} = \sum_{i = 1}^{n}X_{i}$ is sufficient. The log of the likelihood function is

$$
l (\theta) = n \log \theta - \theta \sum_ {i = 1} ^ {n} x _ {i}.
$$

Taking the partial with respect to $\theta$ of $l(\theta)$ and setting it to 0 results in the mle of $\theta$ , which is given by

$$
Y _ {2} = \frac {1}{\overline {{X}}}.
$$

Note that $Y_{2} = n / Y_{1}$ is a function of the sufficient statistic $Y_{1}$ . Also, since $Y_{2}$ is the mle of $\theta$ , it is asymptotically unbiased. Hence, as a first step, we shall determine its expectation. In this problem, $X_{i}$ are iid $\Gamma (1,1 / \theta)$ random variables; hence, $Y_{1} = \sum_{i = 1}^{n}X_{i}$ is $\Gamma (n,1 / \theta)$ . Therefore,

$$
E (Y _ {2}) = E \left[ \frac {1}{\overline {{X}}} \right] = n E \left[ \frac {1}{\sum_ {i = 1} ^ {n} X _ {i}} \right] = n \int_ {0} ^ {\infty} \frac {\theta^ {n}}{\Gamma (n)} t ^ {- 1} t ^ {n - 1} e ^ {- \theta t} d t;
$$

making the change of variable $z = \theta t$ and simplifying results in

$$
E (Y _ {2}) = E \left[ \frac {1}{\overline {{X}}} \right] = \theta \frac {n}{(n - 1) !} \Gamma (n - 1) = \theta \frac {n}{n - 1}.
$$

Thus the statistic $[(n - 1)Y_2] / n = (n - 1) / \sum_{i = 1}^n X_i$ is an MVUE of $\theta$ .

In the next two sections, we discover that, in most instances, if there is one function $\varphi(Y_1)$ that is unbiased, $\varphi(Y_1)$ is the only unbiased estimator based on the sufficient statistic $Y_1$ .

Remark 7.3.1. Since the unbiased estimator $\varphi(Y_1)$ , where $\varphi(Y_1) = E(Y_2 | y_1)$ , has a variance smaller than that of the unbiased estimator $Y_2$ of $\theta$ , students sometimes reason as follows. Let the function $\Upsilon(y_3) = E[\varphi(Y_1) | Y_3 = y_3]$ , where $Y_3$ is another statistic, which is not sufficient for $\theta$ . By the Rao-Blackwell theorem, we have $E[\Upsilon(Y_3)] = \theta$ and $\Upsilon(Y_3)$ has a smaller variance than does $\varphi(Y_1)$ . Accordingly, $\Upsilon(Y_3)$ must be better than $\varphi(Y_1)$ as an unbiased estimator of $\theta$ . But this is not true, because $Y_3$ is not sufficient; thus, $\theta$ is present in the conditional distribution of $Y_1$ , given $Y_3 = y_3$ , and the conditional mean $\Upsilon(y_3)$ . So although indeed $E[\Upsilon(Y_3)] = \theta$ , $\Upsilon(Y_3)$ is not even a statistic because it involves the unknown parameter $\theta$ and hence cannot be used as an estimate.

We illustrate this remark in the following example.

Example 7.3.2. Let $X_{1}, X_{2}, X_{3}$ be a random sample from an exponential distribution with mean $\theta > 0$ , so that the joint pdf is

$$
\left(\frac {1}{\theta}\right) ^ {3} e ^ {- (x _ {1} + x _ {2} + x _ {3}) / \theta}, 0 <   x _ {i} <   \infty ,
$$

$i = 1,2,3$ , zero elsewhere. From the factorization theorem, we see that $Y_{1} = X_{1} + X_{2} + X_{3}$ is a sufficient statistic for $\theta$ . Of course,

$$
E \left(Y _ {1}\right) = E \left(X _ {1} + X _ {2} + X _ {3}\right) = 3 \theta ,
$$

and thus $Y_{1} / 3 = \overline{X}$ is a function of the sufficient statistic that is an unbiased estimator of $\theta$ .

In addition, let $Y_{2} = X_{2} + X_{3}$ and $Y_{3} = X_{3}$ . The one-to-one transformation defined by

$$
x _ {1} = y _ {1} - y _ {2}, x _ {2} = y _ {2} - y _ {3}, x _ {3} = y _ {3}
$$

has Jacobian equal to 1 and the joint pdf of $Y_{1},Y_{2},Y_{3}$ is

$$
g \left(y _ {1}, y _ {2}, y _ {3}; \theta\right) = \left(\frac {1}{\theta}\right) ^ {3} e ^ {- y _ {1} / \theta}, \quad 0 <   y _ {3} <   y _ {2} <   y _ {1} <   \infty ,
$$

zero elsewhere. The marginal pdf of $Y_{1}$ and $Y_{3}$ is found by integrating out $y_{2}$ to obtain

$$
g _ {1 3} (y _ {1}, y _ {3}; \theta) = \left(\frac {1}{\theta}\right) ^ {3} (y _ {1} - y _ {3}) e ^ {- y _ {1} / \theta}, 0 <   y _ {3} <   y _ {1} <   \infty ,
$$

zero elsewhere. The pdf of $Y_{3}$ alone is

$$
g _ {3} (y _ {3}; \theta) = \frac {1}{\theta} e ^ {- y _ {3} / \theta}, 0 <   y _ {3} <   \infty ,
$$

zero elsewhere, since $Y_{3} = X_{3}$ is an observation of a random sample from this exponential distribution.

Accordingly, the conditional pdf of $Y_{1}$ , given $Y_{3} = y_{3}$ , is

$$
\begin{array}{l} g _ {1 | 3} (y _ {1} | y _ {3}) = \frac {g _ {1 3} (y _ {1} , y _ {3} ; \theta)}{g _ {3} (y _ {3} ; \theta)} \\ = \left(\frac {1}{\theta}\right) ^ {2} \left(y _ {1} - y _ {3}\right) e ^ {- \left(y _ {1} - y _ {3}\right) / \theta}, \quad 0 <   y _ {3} <   y _ {1} <   \infty , \\ \end{array}
$$

zero elsewhere. Thus

$$
\begin{array}{l} E \left(\frac {Y _ {1}}{3} \mid y _ {3}\right) = E \left(\frac {Y _ {1} - Y _ {3}}{3} \mid y _ {3}\right) + E \left(\frac {Y _ {3}}{3} \mid y _ {3}\right) \\ = \left(\frac {1}{3}\right) \int_ {y _ {3}} ^ {\infty} \left(\frac {1}{\theta}\right) ^ {2} \left(y _ {1} - y _ {3}\right) ^ {2} e ^ {- \left(y _ {1} - y _ {3}\right) / \theta} d y _ {1} + \frac {y _ {3}}{3} \\ = \left(\frac {1}{3}\right) \frac {\Gamma (3) \theta^ {3}}{\theta^ {2}} + \frac {y _ {3}}{3} = \frac {2 \theta}{3} + \frac {y _ {3}}{3} = \Upsilon \left(y _ {3}\right). \\ \end{array}
$$

Of course, $E[\Upsilon(Y_3)] = \theta$ and $\operatorname{var}[\Upsilon(Y_3)] \leq \operatorname{var}(Y_1/3)$ , but $\Upsilon(Y_3)$ is not a statistic, as it involves $\theta$ and cannot be used as an estimator of $\theta$ . This illustrates the preceding remark.

# EXERCISES

7.3.1. In each of Exercises 7.2.1-7.2.4, show that the mle of $\theta$ is a function of the sufficient statistic for $\theta$ .

7.3.2. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4} < Y_{5}$ be the order statistics of a random sample of size 5 from the uniform distribution having pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , $0 < \theta < \infty$ , zero elsewhere. Show that $2Y_{3}$ is an unbiased estimator of $\theta$ . Determine the joint pdf of $Y_{3}$ and the sufficient statistic $Y_{5}$ for $\theta$ . Find the conditional expectation $E(2Y_{3}|y_{5}) = \varphi(y_{5})$ . Compare the variances of $2Y_{3}$ and $\varphi(Y_{5})$ .

7.3.3. If $X_{1}, X_{2}$ is a random sample of size 2 from a distribution having pdf $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , $0 < \theta < \infty$ , zero elsewhere, find the joint pdf of the sufficient statistic $Y_{1} = X_{1} + X_{2}$ for $\theta$ and $Y_{2} = X_{2}$ . Show that $Y_{2}$ is an unbiased estimator of $\theta$ with variance $\theta^{2}$ . Find $E(Y_{2}|y_{1}) = \varphi(y_{1})$ and the variance of $\varphi(Y_{1})$ .

7.3.4. Let $f(x,y) = (2 / \theta^2)e^{-(x + y) / \theta}$ , $0 < x < y < \infty$ , zero elsewhere, be the joint pdf of the random variables $X$ and $Y$ .

(a) Show that the mean and the variance of $Y$ are, respectively, $3\theta /2$ and $5\theta^{2} / 4$ .   
(b) Show that $E(Y|x) = x + \theta$ . In accordance with the theory, the expected value of $X + \theta$ is that of $Y$ , namely, $3\theta /2$ , and the variance of $X + \theta$ is less than that of $Y$ . Show that the variance of $X + \theta$ is in fact $\theta^2 /4$ .

7.3.5. In each of Exercises 7.2.1-7.2.3, compute the expected value of the given sufficient statistic and, in each case, determine an unbiased estimator of $\theta$ that is a function of that sufficient statistic alone.

7.3.6. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a Poisson distribution with mean $\theta$ . Find the conditional expectation $E(X_{1} + 2X_{2} + 3X_{3} \mid \sum_{1}^{n} X_{i})$ .

# 7.4 Completeness and Uniqueness

Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from the Poisson distribution that has pmf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \frac {\theta^ {x} e ^ {- \theta}}{x !} & x = 0, 1, 2, \ldots ; \theta > 0 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

From Exercise 7.2.2, we know that $Y_{1} = \sum_{i = 1}^{n}X_{i}$ is a sufficient statistic for $\theta$ and its pmf is

$$
g _ {1} (y _ {1}; \theta) = \left\{ \begin{array}{l l} \frac {(n \theta) ^ {y _ {1}} e ^ {- n \theta}}{y _ {1} !} & y _ {1} = 0, 1, 2, \ldots \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Let us consider the family $\{g_1(y_1;\theta):\theta >0\}$ of probability mass functions. Suppose that the function $u(Y_{1})$ of $Y_{1}$ is such that $E[u(Y_{1})] = 0$ for every $\theta >0$ . We shall show that this requires $u(y_{1})$ to be zero at every point $y_{1} = 0,1,2,\ldots$ . That is, $E[u(Y_{1})] = 0$ for $\theta >0$ requires

$$
0 = u (0) = u (1) = u (2) = u (3) = \dots .
$$

We have for all $\theta > 0$ that

$$
\begin{array}{l} 0 = E [ u (Y _ {1}) ] = \sum_ {y _ {1} = 0} ^ {\infty} u (y _ {1}) \frac {(n \theta) ^ {y _ {1}} e ^ {- n \theta}}{y _ {1} !} \\ = e ^ {- n \theta} \left[ u (0) + u (1) \frac {n \theta}{1 !} + u (2) \frac {(n \theta) ^ {2}}{2 !} + \dots \right]. \\ \end{array}
$$

Since $e^{-n\theta}$ does not equal zero, we have shown that

$$
0 = u (0) + [ n u (1) ] \theta + \left[ \frac {n ^ {2} u (2)}{2} \right] \theta^ {2} + \dots .
$$

However, if such an infinite (power) series converges to zero for all $\theta > 0$ , then each of the coefficients must equal zero. That is,

$$
u (0) = 0, \quad n u (1) = 0, \quad \frac {n ^ {2} u (2)}{2} = 0, \ldots ,
$$

and thus $0 = u(0) = u(1) = u(2) = \dots$ , as we wanted to show. Of course, the condition $E[u(Y_1)] = 0$ for all $\theta > 0$ does not place any restriction on $u(y_1)$ when $y_1$ is not a nonnegative integer. So we see that, in this illustration, $E[u(Y_1)] = 0$ for all $\theta > 0$ requires that $u(y_1)$ equals zero except on a set of points that has probability zero for each pmf $g_1(y_1; \theta)$ , $0 < \theta$ . From the following definition we observe that the family $\{g_1(y_1; \theta) : 0 < \theta\}$ is complete.

Definition 7.4.1. Let the random variable $Z$ of either the continuous type or the discrete type have a pdf or pmf that is one member of the family $\{h(z;\theta):\theta \in \Omega \}$ . If the condition $E[u(Z)] = 0$ , for every $\theta \in \Omega$ , requires that $u(z)$ be zero except on a set of points that has probability zero for each $h(z;\theta)$ , $\theta \in \Omega$ , then the family $\{h(z;\theta):\theta \in \Omega\}$ is called a complete family of probability density or mass functions.

Remark 7.4.1. In Section 1.8, it was noted that the existence of $E[u(X)]$ implies that the integral (or sum) converges absolutely. This absolute convergence was tacitly assumed in our definition of completeness and it is needed to prove that certain families of probability density functions are complete.

In order to show that certain families of probability density functions of the continuous type are complete, we must appeal to the same type of theorem in analysis that we used when we claimed that the moment generating function uniquely determines a distribution. This is illustrated in the next example.

Example 7.4.1. Consider the family of pdfs $\{h(z;\theta):0 < \theta < \infty\}$ . Suppose $Z$ has a pdf in this family given by

$$
h (z; \theta) = \left\{ \begin{array}{l l} \frac {1}{\theta} e ^ {- z / \theta} & 0 <   z <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Let us say that $E[u(Z)] = 0$ for every $\theta > 0$ . That is,

$$
\frac {1}{\theta} \int_ {0} ^ {\infty} u (z) e ^ {- z / \theta} d z = 0, \quad \theta > 0.
$$

Readers acquainted with the theory of transformations recognize the integral in the left-hand member as being essentially the Laplace transform of $u(z)$ . In that theory we learn that the only function $u(z)$ transforming to a function of $\theta$ that is identically equal to zero is $u(z) = 0$ , except (in our terminology) on a set of points that has probability zero for each $h(z; \theta)$ , $\theta > 0$ . That is, the family $\{h(z; \theta) : 0 < \theta < \infty\}$ is complete.

Let the parameter $\theta$ in the pdf or pmf $f(x;\theta)$ , $\theta \in \Omega$ , have a sufficient statistic $Y_{1} = u_{1}(X_{1},X_{2},\ldots ,X_{n})$ , where $X_{1},X_{2},\ldots ,X_{n}$ is a random sample from this distribution. Let the pdf or pmf of $Y_{1}$ be $f_{Y_1}(y_1;\theta)$ , $\theta \in \Omega$ . It has been seen that if there is any unbiased estimator $Y_{2}$ (not a function of $Y_{1}$ alone) of $\theta$ , then there is at least one function of $Y_{1}$ that is an unbiased estimator of $\theta$ , and our search for a best estimator of $\theta$ may be restricted to functions of $Y_{1}$ . Suppose it has been verified that a certain function $\varphi (Y_1)$ , not a function of $\theta$ , is such that $E[\varphi (Y_1)] = \theta$ for all values of $\theta$ , $\theta \in \Omega$ . Let $\psi (Y_1)$ be another function of the sufficient statistic $Y_{1}$ alone, so that we also have $E[\psi (Y_1)] = \theta$ for all values of $\theta$ , $\theta \in \Omega$ . Hence

$$
E [ \varphi (Y _ {1}) - \psi (Y _ {1}) ] = 0, \quad \theta \in \Omega .
$$

If the family $\{f_{Y_1}(y_1;\theta):\theta \in \Omega \}$ is complete, the function of $\varphi (y_{1}) - \psi (y_{1}) = 0$ except on a set of points that has probability zero. That is, for every other unbiased estimator $\psi (Y_1)$ of $\theta$ , we have

$$
\varphi (y _ {1}) = \psi (y _ {1})
$$

except possibly at certain special points. Thus, in this sense [namely $\varphi(y_1) = \psi(y_1)$ , except on a set of points with probability zero], $\varphi(Y_1)$ is the unique function of $Y_1$ , which is an unbiased estimator of $\theta$ . In accordance with the Rao-Blackwell theorem, $\varphi(Y_1)$ has a smaller variance than every other unbiased estimator of $\theta$ . That is, the statistic $\varphi(Y_1)$ is the MVUE of $\theta$ . This fact is stated in the following theorem of Lehmann and Scheffé.

Theorem 7.4.1 (Lehmann and Scheffé). Let $X_{1}, X_{2}, \ldots, X_{n}$ , $n$ a fixed positive integer, denote a random sample from a distribution that has pdf or pmf $f(x; \theta)$ , $\theta \in \Omega$ , let $Y_{1} = u_{1}(X_{1}, X_{2}, \ldots, X_{n})$ be a sufficient statistic for $\theta$ , and let the family $\{f_{Y_{1}}(y_{1}; \theta) : \theta \in \Omega\}$ be complete. If there is a function of $Y_{1}$ that is an unbiased estimator of $\theta$ , then this function of $Y_{1}$ is the unique MVUE of $\theta$ . Here "unique" is used in the sense described in the preceding paragraph.

The statement that $Y_{1}$ is a sufficient statistic for a parameter $\theta$ , $\theta \in \Omega$ , and that the family $\{f_{Y_1}(y_1;\theta):\theta \in \Omega \}$ of probability density functions is complete is lengthy and somewhat awkward. We shall adopt the less descriptive, but more convenient, terminology that $Y_{1}$ is a complete sufficient statistic for $\theta$ . In the next section, we study a fairly large class of probability density functions for which a complete sufficient statistic $Y_{1}$ for $\theta$ can be determined by inspection.

Example 7.4.2 (Uniform Distribution). Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from the uniform distribution with pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , $\theta > 0$ , and zero elsewhere. As Exercise 7.2.3 shows, $Y_{n} = \max \{X_{1}, X_{2}, \ldots, X_{n}\}$ is a sufficient statistic for $\theta$ . It is easy to show that the pdf of $Y_{n}$ is

$$
g \left(y _ {n}; \theta\right) = \left\{ \begin{array}{l l} \frac {n y _ {n} ^ {n - 1}}{\theta^ {n}} & 0 <   y _ {n} <   \theta \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {7.4.1}
$$

To show that $Y_{n}$ is complete, suppose for any function $u(t)$ and any $\theta$ that $E[u(Y_{n})] = 0$ ; i.e.,

$$
0 = \int_ {0} ^ {\theta} u (t) \frac {n t ^ {n - 1}}{\theta^ {n}} d t.
$$

Since $\theta > 0$ , this equation is equivalent to

$$
0 = \int_ {0} ^ {\theta} u (t) t ^ {n - 1} d t.
$$

Taking partial derivatives of both sides with respect to $\theta$ and using the Fundamental Theorem of Calculus, we have

$$
0 = u (\theta) \theta^ {n - 1}.
$$

Since $\theta > 0$ , $u(\theta) = 0$ , for all $\theta > 0$ . Thus $Y_{n}$ is a complete and sufficient statistic for $\theta$ . It is easy to show that

$$
E (Y _ {n}) = \int_ {0} ^ {\theta} y \frac {n y ^ {n - 1}}{\theta^ {n}} d y = \frac {n}{n + 1} \theta .
$$

Therefore, the MVUE of $\theta$ is $((n + 1) / n)Y_{n}$ .

# EXERCISES

7.4.1. If $az^2 + bz + c = 0$ for more than two values of $z$ , then $a = b = c = 0$ . Use this result to show that the family $\{b(2, \theta) : 0 < \theta < 1\}$ is complete.

7.4.2. Show that each of the following families is not complete by finding at least one nonzero function $u(x)$ such that $E[u(X)] = 0$ , for all $\theta > 0$ .

(a)

$$
f (x; \theta) = \left\{ \begin{array}{l l} \frac {1}{2 \theta} & - \theta <   x <   \theta , \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \quad \text {w h e r e} 0 <   \theta <   \infty
$$

(b) $N(0,\theta)$ , where $0 < \theta < \infty$ .

7.4.3. Let $X_{1}, X_{2}, \ldots, X_{n}$ represent a random sample from the discrete distribution having the pmf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \theta^ {x} (1 - \theta) ^ {1 - x} & x = 0, 1, 0 <   \theta <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Show that $Y_{1} = \sum_{1}^{n}X_{i}$ is a complete sufficient statistic for $\theta$ . Find the unique function of $Y_{1}$ that is the MVUE of $\theta$ .

Hint: Display $E[u(Y_1)] = 0$ , show that the constant term $u(0)$ is equal to zero, divide both members of the equation by $\theta \neq 0$ , and repeat the argument.

7.4.4. Consider the family of probability density functions $\{h(z;\theta):\theta \in \Omega \}$ , where $h(z;\theta) = 1 / \theta$ , $0 < z < \theta$ , zero elsewhere.

(a) Show that the family is complete provided that $\Omega = \{\theta : 0 < \theta < \infty\}$ .

Hint: For convenience, assume that $u(z)$ is continuous and note that the derivative of $E[u(Z)]$ with respect to $\theta$ is equal to zero also.

(b) Show that this family is not complete if $\Omega = \{\theta : 1 < \theta < \infty\}$ .

Hint: Concentrate on the interval $0 < z < 1$ and find a nonzero function $u(z)$ on that interval such that $E[u(Z)] = 0$ for all $\theta > 1$ .

7.4.5. Show that the first order statistic $Y_{1}$ of a random sample of size $n$ from the distribution having pdf $f(x; \theta) = e^{-(x - \theta)}$ , $\theta < x < \infty$ , $-\infty < \theta < \infty$ , zero elsewhere, is a complete sufficient statistic for $\theta$ . Find the unique function of this statistic which is the MVUE of $\theta$ .

7.4.6. Let a random sample of size $n$ be taken from a distribution of the discrete type with pmf $f(x; \theta) = 1 / \theta$ , $x = 1, 2, \ldots, \theta$ , zero elsewhere, where $\theta$ is an unknown positive integer.

(a) Show that the largest observation, say $Y$ , of the sample is a complete sufficient statistic for $\theta$ .

(b) Prove that

$$
[ Y ^ {n + 1} - (Y - 1) ^ {n + 1} ] / [ Y ^ {n} - (Y - 1) ^ {n} ]
$$

is the unique MVUE of $\theta$ .

7.4.7. Let $X$ have the pdf $f_{X}(x;\theta) = 1 / (2\theta)$ , for $-\theta < x < \theta$ , zero elsewhere, where $\theta > 0$ .

(a) Is the statistic $Y = |X|$ a sufficient statistic for $\theta$ ? Why?   
(b) Let $f_{Y}(y;\theta)$ be the pdf of $Y$ . Is the family $\{f_{Y}(y;\theta):\theta >0\}$ complete? Why?

7.4.8. Let $X$ have the pmf $p(x; \theta) = \frac{1}{2} \binom{n}{|x|} \theta^{|x|} (1 - \theta)^{n - |x|}$ , for $x = \pm 1, \pm 2, \ldots, \pm n$ , $p(0, \theta) = (1 - \theta)^n$ , and zero elsewhere, where $0 < \theta < 1$ .

(a) Show that this family $\{p(x;\theta):0 <   \theta <  1\}$ is not complete.

(b) Let $Y = |X|$ . Show that $Y$ is a complete and sufficient statistic for $\theta$ .

7.4.9. Let $X_{1},\ldots ,X_{n}$ be iid with pdf $f(x;\theta) = 1 / (3\theta)$ , $-\theta < x < 2\theta$ , zero elsewhere, where $\theta >0$ .

(a) Find the mle $\widehat{\theta}$ of $\theta$   
(b) Is $\widehat{\theta}$ a sufficient statistic for $\theta$ ? Why?   
(c) Is $(n + 1)\widehat{\theta} / n$ the unique MVUE of $\theta$ ? Why?

7.4.10. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from a distribution with pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , zero elsewhere. By Example 7.4.2, the statistic $Y_{n}$ is a complete sufficient statistic for $\theta$ and it has pdf

$$
g (y _ {n}; \theta) = \frac {n y _ {n} ^ {n - 1}}{\theta^ {n}}, \quad 0 <   y _ {n} <   \theta ,
$$

and zero elsewhere.

(a) Find the distribution function $H_{n}(z;\theta)$ of $Z = n(\theta -Y_{n})$   
(b) Find the $\lim_{n\to \infty}H_n(z;\theta)$ and thus the limiting distribution of $Z$

# 7.5 The Exponential Class of Distributions

In this section we discuss an important class of distributions, called the exponential class. As we show, this class possesses complete and sufficient statistics which are readily determined from the distribution.

Consider a family $\{f(x;\theta):\theta \in \Omega \}$ of probability density or mass functions, where $\Omega$ is the interval set $\Omega = \{\theta :\gamma <  \theta <  \delta \}$ , where $\gamma$ and $\delta$ are known constants (they may be $\pm \infty$ ), and where

$$
f (x; \theta) = \left\{ \begin{array}{l l} \exp [ p (\theta) K (x) + H (x) + q (\theta) ] & x \in \mathcal {S} \\ 0 & \text {e l s e w h e r e ,} \end{array} \right. \tag {7.5.1}
$$

where $\mathcal{S}$ is the support of $X$ . In this section we are concerned with a particular class of the family called the regular exponential class.

Definition 7.5.1 (Regular Exponential Class). A pdf of the form (7.5.1) is said to be a member of the regular exponential class of probability density or mass functions if

1. $\mathcal{S}$ , the support of $X$ , does not depend upon $\theta$

2. $p(\theta)$ is a nontrivial continuous function of $\theta \in \Omega$

3. Finally,

(a) if $X$ is a continuous random variable, then each of $K'(x) \neq 0$ and $H(x)$ is a continuous function of $x \in S$ ,

(b) if $X$ is a discrete random variable, then $K(x)$ is a nontrivial function of $x \in S$ .

For example, each member of the family $\{f(x;\theta):0 < \theta < \infty\}$ , where $f(x;\theta)$ is $N(0,\theta)$ , represents a regular case of the exponential class of the continuous type because

$$
\begin{array}{l} f (x; \theta) = \frac {1}{\sqrt {2 \pi \theta}} e ^ {- x ^ {2} / 2 \theta} \\ = \exp \left(- \frac {1}{2 \theta} x ^ {2} - \log \sqrt {2 \pi \theta}\right), - \infty <   x <   \infty . \\ \end{array}
$$

On the other hand, consider the uniform density function given by

$$
f (x; \theta) = \left\{ \begin{array}{l l} \exp \{- \log \theta \} & x \in (0, \theta) \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

This can be written in the form (7.5.1), but the support is the interval $(0, \theta)$ , which depends on $\theta$ . Hence the uniform family is not a regular exponential family.

Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that represents a regular case of the exponential class. The joint pdf or pmf of $X_{1}, X_{2}, \ldots, X_{n}$ is

$$
\exp \left[ p (\theta) \sum_ {1} ^ {n} K (x _ {i}) + \sum_ {1} ^ {n} H (x _ {i}) + n q (\theta) \right]
$$

for $x_{i} \in S$ , $i = 1,2,\ldots,n$ and zero elsewhere. At points in the $S$ of $X$ , this joint pdf or pmf may be written as the product of the two nonnegative functions

$$
\exp \left[ p (\theta) \sum_ {1} ^ {n} K (x _ {i}) + n q (\theta) \right] \exp \left[ \sum_ {1} ^ {n} H (x _ {i}) \right].
$$

In accordance with the factorization theorem, Theorem 7.2.1, $Y_{1} = \sum_{1}^{n}K(X_{i})$ is a sufficient statistic for the parameter $\theta$ .

Besides the fact that $Y_{1}$ is a sufficient statistic, we can obtain the general form of the distribution of $Y_{1}$ and its mean and variance. We summarize these results in a theorem. The details of the proof are given in Exercises 7.5.5 and 7.5.8. Exercise 7.5.6 obtains the mgf of $Y_{1}$ in the case that $p(\theta) = \theta$ .

Theorem 7.5.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that represents a regular case of the exponential class, with pdf or pmf given by (7.5.1). Consider the statistic $Y_{1} = \sum_{i=1}^{n} K(X_{i})$ . Then

1. The pdf or pmf of $Y_{1}$ has the form

$$
f _ {Y _ {1}} \left(y _ {1}; \theta\right) = R \left(y _ {1}\right) \exp \left[ p (\theta) y _ {1} + n q (\theta) \right], \tag {7.5.2}
$$

for $y_{1}\in \mathcal{S}_{Y_{1}}$ and some function $R(y_{1})$ . Neither $\mathcal{S}_{Y_1}$ nor $R(y_{1})$ depends on $\theta$ .

2. $E(Y_{1}) = -n\frac{q^{\prime}(\theta)}{p^{\prime}(\theta)}$

$$
3. V a r (Y _ {1}) = n \frac {1}{p ^ {\prime} (\theta) ^ {3}} \left\{p ^ {\prime \prime} (\theta) q ^ {\prime} (\theta) - q ^ {\prime \prime} (\theta) p ^ {\prime} (\theta) \right\}.
$$

Example 7.5.1. Let $X$ have a Poisson distribution with parameter $\theta \in (0, \infty)$ . Then the support of $X$ is the set $S = \{0, 1, 2, \ldots\}$ , which does not depend on $\theta$ . Further, the pmf of $X$ on its support is

$$
f (x, \theta) = e ^ {- \theta} \frac {\theta^ {x}}{x !} = \exp \left\{(\log \theta) x + \log (1 / x!) + (- \theta) \right\}.
$$

Hence the Poisson distribution is a member of the regular exponential class, with $p(\theta) = \log (\theta)$ , $q(\theta) = -\theta$ , and $K(x) = x$ . Therefore, if $X_{1},X_{2},\ldots ,X_{n}$ denotes a random sample on $X$ , then the statistic $Y_{1} = \sum_{i = 1}^{n}X_{i}$ is sufficient. But since $p^{\prime}(\theta) = 1 / \theta$ and $q^{\prime}(\theta) = -1$ , Theorem 7.5.1 verifies that the mean of $Y_{1}$ is $n\theta$ . It is easy to verify that the variance of $Y_{1}$ is $n\theta$ also. Finally, we can show that the function $R(y_{1})$ in Theorem 7.5.1 is given by $R(y_{1}) = n^{y_{1}}(1 / y_{1}!)$ .

For the regular case of the exponential class, we have shown that the statistic $Y_{1} = \sum_{i}^{n}K(X_{i})$ is sufficient for $\theta$ . We now use the form of the pdf of $Y_{1}$ given in Theorem 7.5.1 to establish the completeness of $Y_{1}$ .

Theorem 7.5.2. Let $f(x; \theta)$ , $\gamma < \theta < \delta$ , be a pdf or pmf of a random variable $X$ whose distribution is a regular case of the exponential class. Then if $X_1, X_2, \ldots, X_n$ (where $n$ is a fixed positive integer) is a random sample from the distribution of $X$ , the statistic $Y_1 = \sum_{i=1}^{n} K(X_i)$ is a sufficient statistic for $\theta$ and the family $\{f_{Y_1}(y_1; \theta) : \gamma < \theta < \delta\}$ of probability density functions of $Y_1$ is complete. That is, $Y_1$ is a complete sufficient statistic for $\theta$ .

Proof: We have shown above that $Y_{1}$ is sufficient. For completeness, suppose that $E[u(Y_1)] = 0$ . Expression (7.5.2) of Theorem 7.5.1 gives the pdf of $Y_{1}$ . Hence we have the equation

$$
\int_ {\mathcal {S} _ {Y _ {1}}} u (y _ {1}) R (y _ {1}) \exp \{p (\theta) y _ {1} + n q (\theta) \} d y _ {1} = 0
$$

or equivalently since $\exp \{nq(\theta)\} \neq 0$

$$
\int_ {\mathcal {S} _ {Y _ {1}}} u (y _ {1}) R (y _ {1}) \exp \{p (\theta) y _ {1} \} d y _ {1} = 0
$$

for all $\theta$ . However, $p(\theta)$ is a nontrivial continuous function of $\theta$ , and thus this integral is essentially a type of Laplace transform of $u(y_1)R(y_1)$ . The only function of $y_1$ transforming to the 0 function is the zero function (except for a set of points with probability zero in our context). That is,

$$
u (y _ {1}) R (y _ {1}) \equiv 0.
$$

However, $R(y_{1}) \neq 0$ for all $y_{1} \in S_{Y_{1}}$ because it is a factor in the pdf of $Y_{1}$ . Hence $u(y_{1}) \equiv 0$ (except for a set of points with probability zero). Therefore, $Y_{1}$ is a complete sufficient statistic for $\theta$ .

This theorem has useful implications. In a regular case of form (7.5.1), we can see by inspection that the sufficient statistic is $Y_{1} = \sum_{1}^{n}K(X_{i})$ . If we can see how to form a function of $Y_{1}$ , say $\varphi (Y_{1})$ , so that $E[\varphi (Y_1)] = \theta$ , then the statistic $\varphi (Y_{1})$ is unique and is the MVUE of $\theta$ .

Example 7.5.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a normal distribution that has pdf

$$
f (x; \theta) = \frac {1}{\sigma \sqrt {2 \pi}} \exp \left[ - \frac {(x - \theta) ^ {2}}{2 \sigma^ {2}} \right], - \infty <   x <   \infty , - \infty <   \theta <   \infty ,
$$

or

$$
f (x; \theta) = \exp \left(\frac {\theta}{\sigma^ {2}} x - \frac {x ^ {2}}{2 \sigma^ {2}} - \log \sqrt {2 \pi \sigma^ {2}} - \frac {\theta^ {2}}{2 \sigma^ {2}}\right).
$$

Here $\sigma^2$ is any fixed positive number. This is a regular case of the exponential class with

$$
\begin{array}{l} p (\theta) = \frac {\theta}{\sigma^ {2}}, K (x) = x, \\ H (x) = - \frac {x ^ {2}}{2 \sigma^ {2}} - \log \sqrt {2 \pi \sigma^ {2}}, q (\theta) = - \frac {\theta^ {2}}{2 \sigma^ {2}}. \\ \end{array}
$$

Accordingly, $Y_{1} = X_{1} + X_{2} + \dots + X_{n} = n\overline{X}$ is a complete sufficient statistic for the mean $\theta$ of a normal distribution for every fixed value of the variance $\sigma^2$ . Since $E(Y_{1}) = n\theta$ , then $\varphi(Y_{1}) = Y_{1} / n = \overline{X}$ is the only function of $Y_{1}$ that is an unbiased estimator of $\theta$ ; and being a function of the sufficient statistic $Y_{1}$ , it has a minimum variance. That is, $\overline{X}$ is the unique MVUE of $\theta$ . Incidentally, since $Y_{1}$ is a one-to-one function of $\overline{X}$ , $\overline{X}$ itself is also a complete sufficient statistic for $\theta$ .

Example 7.5.3 (Example 7.5.1, Continued). Reconsider the discussion concerning the Poisson distribution with parameter $\theta$ found in Example 7.5.1. Based on this discussion, the statistic $Y_{1} = \sum_{i=1}^{n} X_{i}$ was sufficient. It follows from Theorem 7.5.2 that its family of distributions is complete. Since $E(Y_{1}) = n\theta$ , it follows that $\overline{X} = n^{-1}Y_{1}$ is the unique MVUE of $\theta$ .

# EXERCISES

7.5.1. Write the pdf

$$
f (x; \theta) = \frac {1}{6 \theta^ {4}} x ^ {3} e ^ {- x / \theta}, 0 <   x <   \infty , 0 <   \theta <   \infty ,
$$

zero elsewhere, in the exponential form. If $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from this distribution, find a complete sufficient statistic $Y_{1}$ for $\theta$ and the unique function $\varphi(Y_{1})$ of this statistic that is the MVUE of $\theta$ . Is $\varphi(Y_{1})$ itself a complete sufficient statistic?

7.5.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample of size $n > 1$ from a distribution with pdf $f(x; \theta) = \theta e^{-\theta x}$ , $0 < x < \infty$ , zero elsewhere, and $\theta > 0$ . Then $Y = \sum_{1}^{n} X_{i}$ is a sufficient statistic for $\theta$ . Prove that $(n - 1)/Y$ is the MVUE of $\theta$ .

7.5.3. Let $X_1, X_2, \ldots, X_n$ denote a random sample of size $n$ from a distribution with pdf $f(x; \theta) = \theta x^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere, and $\theta > 0$ .

(a) Show that the geometric mean $(X_{1}X_{2}\dots X_{n})^{1 / n}$ of the sample is a complete sufficient statistic for $\theta$   
(b) Find the maximum likelihood estimator of $\theta$ , and observe that it is a function of this geometric mean.

7.5.4. Let $\overline{X}$ denote the mean of the random sample $X_{1}, X_{2}, \ldots, X_{n}$ from a gamma-type distribution with parameters $\alpha > 0$ and $\beta = \theta > 0$ . Compute $E[X_1|\overline{x}]$ .

Hint: Can you find directly a function $\psi(\overline{X})$ of $\overline{X}$ such that $E[\psi(\overline{X})] = \theta$ ? Is $E(X_1|\overline{x}) = \psi(\overline{x})$ ? Why?

7.5.5. Let $X$ be a random variable with the pdf of a regular case of the exponential class, given by $f(x; \theta) = \exp[\theta K(x) + H(x) + q(\theta)]$ , $a < x < b$ , $\gamma < \theta < \delta$ . Show that $E[K(X)] = -q'(\theta) / p'(\theta)$ , provided these derivatives exist, by differentiating both members of the equality

$$
\int_ {a} ^ {b} \exp [ p (\theta) K (x) + H (x) + q (\theta) ] d x = 1
$$

with respect to $\theta$ . By a second differentiation, find the variance of $K(X)$ .

7.5.6. Given that $f(x; \theta) = \exp[\theta K(x) + H(x) + q(\theta)]$ , $a < x < b$ , $\gamma < \theta < \delta$ , represents a regular case of the exponential class, show that the moment-generating function $M(t)$ of $Y = K(X)$ is $M(t) = \exp[q(\theta) - q(\theta + t)]$ , $\gamma < \theta + t < \delta$ .

7.5.7. In the preceding exercise, given that $E(Y) = E[K(X)] = \theta$ , prove that $Y$ is $N(\theta, 1)$ .

Hint: Consider $M'(0) = \theta$ and solve the resulting differential equation.

7.5.8. If $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a distribution that has a pdf which is a regular case of the exponential class, show that the pdf of $Y_{1} = \sum_{1}^{n} K(X_{i})$ is of the form $f_{Y_1}(y_1; \theta) = R(y_1) \exp[p(\theta) y_1 + n q(\theta)]$ .

Hint: Let $Y_{2} = X_{2}, \ldots, Y_{n} = X_{n}$ be $n - 1$ auxiliary random variables. Find the joint pdf of $Y_{1}, Y_{2}, \ldots, Y_{n}$ and then the marginal pdf of $Y_{1}$ .

7.5.9. Let $Y$ denote the median and let $\overline{X}$ denote the mean of a random sample of size $n = 2k + 1$ from a distribution that is $N(\mu, \sigma^2)$ . Compute $E(Y|\overline{X} = \overline{x})$ .

Hint: See Exercise 7.5.4.

7.5.10. Let $X_1, X_2, \ldots, X_n$ be a random sample from a distribution with pdf $f(x; \theta) = \theta^2 x e^{-\theta x}$ , $0 < x < \infty$ , where $\theta > 0$ .

(a) Argue that $Y = \sum_{1}^{n} X_{i}$ is a complete sufficient statistic for $\theta$ .   
(b) Compute $E(1 / Y)$ and find the function of $Y$ that is the unique MVUE of $\theta$ .

7.5.11. Let $X_{1}, X_{2}, \ldots, X_{n}$ , $n > 2$ , be a random sample from the binomial distribution $b(1, \theta)$ .

(a) Show that $Y_{1} = X_{1} + X_{2} + \dots + X_{n}$ is a complete sufficient statistic for $\theta$ .   
(b) Find the function $\varphi(Y_1)$ that is the MVUE of $\theta$ .   
(c) Let $Y_{2} = (X_{1} + X_{2}) / 2$ and compute $E(Y_{2})$ .   
(d) Determine $E(Y_{2}|Y_{1} = y_{1})$ .

7.5.12. Let $X_1, X_2, \ldots, X_n$ be a random sample from a distribution with pmf $p(x; \theta) = \theta^x (1 - \theta)$ , $x = 0, 1, 2, \ldots$ , zero elsewhere, where $0 \leq \theta \leq 1$ .

(a) Find the mle, $\hat{\theta}$ , of $\theta$ .   
(b) Show that $\sum_{1}^{n}X_{i}$ is a complete sufficient statistic for $\theta$   
(c) Determine the MVUE of $\theta$

# 7.6 Functions of a Parameter

Up to this point we have sought an MVUE of a parameter $\theta$ . Not always, however, are we interested in $\theta$ but rather in a function of $\theta$ . There are several techniques we can use to the find the MVUE. One is by inspection of the expected value of a sufficient statistic. This is how we found the MVUEs in Examples 7.5.2 and 7.5.3 of the last section. In this section and its exercises, we offer more examples of the inspection technique. The second technique is based on the conditional expectation of an unbiased estimate given a sufficient statistic. The third example illustrates this technique.

Recall that in Chapter 6 under regularity conditions, we obtained the asymptotic distribution theory for maximum likelihood estimators (mles). This allows certain asymptotic inferences (confidence intervals and tests) for these estimators. Such a straightforward theory is not available for MVUEs. As Theorem 7.3.2 shows, though, sometimes we can determine the relationship between the mle and the MVUE. In these situations, we can often obtain the asymptotic distribution for the MVUE based on the asymptotic distribution of the mle. Also, as we discuss in Section 7.6.1, we can usually make use of the bootstrap to obtain standard errors for MVUE estimates. We illustrate this for some of the following examples.

Example 7.6.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote the observations of a random sample of size $n > 1$ from a distribution that is $b(1, \theta)$ , $0 < \theta < 1$ . We know that if $Y = \sum_{1}^{n} X_{i}$ , then $Y / n$ is the unique minimum variance unbiased estimator of $\theta$ . Now suppose we want to estimate the variance of $Y / n$ , which is $\theta (1 - \theta) / n$ . Let $\delta = \theta (1 - \theta)$ . Because $Y$ is a sufficient statistic for $\theta$ , it is known that we can restrict our search to functions of $Y$ . The maximum likelihood estimate of $\delta$ , which is given by $\tilde{\delta} = (Y / n)(1 - Y / n)$ , is a function of the sufficient statistic and seems to be a reasonable starting point. The expectation of this statistic is given by

$$
E [ \tilde {\delta} ] = E \left[ \frac {Y}{n} \left(1 - \frac {Y}{n}\right) \right] = \frac {1}{n} E (Y) - \frac {1}{n ^ {2}} E (Y ^ {2}).
$$

Now $E(Y) = n\theta$ and $E(Y^2) = n\theta (1 - \theta) + n^2\theta^2$ . Hence

$$
E \left[ \frac {Y}{n} \left(1 - \frac {Y}{n}\right) \right] = (n - 1) \frac {\theta (1 - \theta)}{n}.
$$

If we multiply both members of this equation by $n / (n - 1)$ , we find that the statistic $\hat{\delta} = (n / (n - 1))(Y / n)(1 - Y / n) = (n / (n - 1))\tilde{\delta}$ is the unique MVUE of $\delta$ . Hence the MVUE of $\delta / n$ , the variance of $Y / n$ , is $\hat{\delta} / n$ .

It is interesting to compare the mle $\tilde{\delta}$ with $\hat{\delta}$ . Recall from Chapter 6 that the mle $\tilde{\delta}$ is a consistent estimate of $\delta$ and that $\sqrt{n} (\tilde{\delta} -\delta)$ is asymptotically normal. Because

$$
\hat {\delta} - \tilde {\delta} = \tilde {\delta} \frac {1}{n - 1} \stackrel {P} {\rightarrow} \delta \cdot 0 = 0,
$$

it follows that $\hat{\delta}$ is also a consistent estimator of $\delta$ . Further,

$$
\sqrt {n} (\hat {\delta} - \delta) - \sqrt {n} (\tilde {\delta} - \delta) = \frac {\sqrt {n}}{n - 1} \tilde {\delta} \xrightarrow {P} 0. \tag {7.6.1}
$$

Hence $\sqrt{n} (\hat{\delta} -\delta)$ has the same asymptotic distribution as $\sqrt{n} (\tilde{\delta} -\delta)$ . Using the $\Delta$ -method, Theorem 5.2.9, we can obtain the asymptotic distribution of $\sqrt{n} (\tilde{\delta} -\delta)$ . Let $g(\theta) = \theta (1 - \theta)$ . Then $g^{\prime}(\theta) = 1 - 2\theta$ . Hence, by Theorem 5.2.9 and (7.6.1), the asymptotic distribution of $\sqrt{n} (\tilde{\delta} -\delta)$ is given by

$$
\sqrt {n} (\hat {\delta} - \delta) \stackrel {D} {\rightarrow} N (0, \theta (1 - \theta) (1 - 2 \theta) ^ {2}),
$$

provided $\theta \neq 1 / 2$ ; see Exercise 7.6.12 for the case $\theta = 1 / 2$ .

In the next example, we consider the uniform $(0,\theta)$ distribution and obtain the MVUE for all differentiable functions of $\theta$ . This example was sent to us by Professor Bradford Crain of Portland State University.

Example 7.6.2. Suppose $X_{1}, X_{2}, \ldots, X_{n}$ are iid random variables with the common uniform $(0, \theta)$ distribution. Let $Y_{n} = \max \{X_{1}, X_{2}, \ldots, X_{n}\}$ . In Example 7.4.2, we showed that $Y_{n}$ is a complete and sufficient statistic of $\theta$ and the pdf of $Y_{n}$ is given by (7.4.1). Let $g(\theta)$ be any differentiable function of $\theta$ . Then the MVUE of $g(\theta)$ is the statistic $u(Y_{n})$ , which satisfies the equation

$$
g (\theta) = \int_ {0} ^ {\theta} u (y) \frac {n y ^ {n - 1}}{\theta^ {n}} d y, \quad \theta > 0,
$$

or equivalently,

$$
g (\theta) \theta^ {n} = \int_ {0} ^ {\theta} u (y) n y ^ {n - 1} d y, \quad \theta > 0.
$$

Differentiating both sides of this equation with respect to $\theta$ , we obtain

$$
n \theta^ {n - 1} g (\theta) + \theta^ {n} g ^ {\prime} (\theta) = u (\theta) n \theta^ {n - 1}.
$$

Solving for $u(\theta)$ , we obtain

$$
u (\theta) = g (\theta) + \frac {\theta g ^ {\prime} (\theta)}{n}.
$$

Therefore, the MVUE of $g(\theta)$ is

$$
u \left(Y _ {n}\right) = g \left(Y _ {n}\right) + \frac {Y _ {n}}{n} g ^ {\prime} \left(Y _ {n}\right). \tag {7.6.2}
$$

For example, if $g(\theta) = \theta$ , then

$$
u (Y _ {n}) = Y _ {n} + \frac {Y _ {n}}{n} = \frac {n + 1}{n} Y _ {n},
$$

which agrees with the result obtained in Example 7.4.2. Other examples are given in Exercise 7.6.5.

A somewhat different but also very important problem in point estimation is considered in the next example. In the example the distribution of a random variable $X$ is described by a pdf $f(x; \theta)$ that depends upon $\theta \in \Omega$ . The problem is to estimate the fractional part of the probability for this distribution, which is at, or to the left of, a fixed point $c$ . Thus we seek an MVUE of $F(c; \theta)$ , where $F(x; \theta)$ is the cdf of $X$ .

Example 7.6.3. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample of size $n > 1$ from a distribution that is $N(\theta, 1)$ . Suppose that we wish to find an MVUE of the function of $\theta$ defined by

$$
P (X \leq c) = \int_ {- \infty} ^ {c} \frac {1}{\sqrt {2 \pi}} e ^ {- (x - \theta) ^ {2} / 2} d x = \Phi (c - \theta),
$$

where $c$ is a fixed constant. There are many unbiased estimators of $\Phi (c - \theta)$ . We first exhibit one of these, say $u(X_{1})$ , a function of $X_{1}$ alone. We shall then compute the conditional expectation, $E[u(X_1)|\overline{X} = \overline{x} ] = \varphi (\overline{x})$ , of this unbiased statistic, given the sufficient statistic $\overline{X}$ , the mean of the sample. In accordance with the theorems of Rao-Blackwell and Lehmann-Scheffé, $\varphi (\overline{X})$ is the unique MVUE of $\Phi (c - \theta)$ .

Consider the function $u(x_{1})$ , where

$$
u (x _ {1}) = \left\{ \begin{array}{l l} 1 & x _ {1} \leq c \\ 0 & x _ {1} > c. \end{array} \right.
$$

The expected value of the random variable $u(X_1)$ is given by

$$
E [ u (X _ {1}) ] = 1 \cdot P [ X _ {1} - \theta \leq c - \theta ] = \Phi (c - \theta).
$$

That is, $u(X_{1})$ is an unbiased estimator of $\Phi (c - \theta)$ .

We shall next discuss the joint distribution of $X_{1}$ and $\overline{X}$ and the conditional distribution of $X_{1}$ , given $\overline{X} = \overline{x}$ . This conditional distribution enables us to compute the conditional expectation $E[u(X_1)|\overline{X} = \overline{x}] = \varphi (\overline{x})$ . In accordance with Exercise

7.6.8, the joint distribution of $X_{1}$ and $\overline{X}$ is bivariate normal with mean vector $(\theta ,\theta)$ , variances $\sigma_1^2 = 1$ and $\sigma_2^2 = 1 / n$ , and correlation coefficient $\rho = 1 / \sqrt{n}$ . Thus the conditional pdf of $X_{1}$ , given $\overline{X} = \overline{x}$ , is normal with linear conditional mean

$$
\theta + \frac {\rho \sigma_ {1}}{\sigma_ {2}} (\overline {{x}} - \theta) = \overline {{x}}
$$

and with variance

$$
\sigma_ {1} ^ {2} (1 - \rho^ {2}) = \frac {n - 1}{n}.
$$

The conditional expectation of $u(X_1)$ , given $\overline{X} = \overline{x}$ , is then

$$
\begin{array}{l} \varphi (\overline {{x}}) = \int_ {- \infty} ^ {\infty} u (x _ {1}) \sqrt {\frac {n}{n - 1}} \frac {1}{\sqrt {2 \pi}} \exp \left[ - \frac {n (x _ {1} - \overline {{x}}) ^ {2}}{2 (n - 1)} \right] d x _ {1} \\ { = } { \int _ { - \infty } ^ { c } \sqrt { \frac { n } { n - 1 } } \frac { 1 } { \sqrt { 2 \pi } } \exp \left[ - \frac { n ( x _ { 1 } - \overline { { x } } ) ^ { 2 } } { 2 ( n - 1 ) } \right] d x _ { 1 } . } \\ \end{array}
$$

The change of variable $z = \sqrt{n} (x_{1} - \overline{x}) / \sqrt{n - 1}$ enables us to write this conditional expectation as

$$
\varphi (\overline {{x}}) = \int_ {- \infty} ^ {c ^ {\prime}} \frac {1}{\sqrt {2 \pi}} e ^ {- z ^ {2} / 2} d z = \Phi (c ^ {\prime}) = \Phi \left[ \frac {\sqrt {n} (c - \overline {{x}})}{\sqrt {n - 1}} \right],
$$

where $c' = \sqrt{n} (c - \overline{x}) / \sqrt{n - 1}$ . Thus the unique MVUE of $\Phi(c - \theta)$ is, for every fixed constant $c$ , given by $\varphi(\overline{X}) = \Phi[\sqrt{n} (c - \overline{X}) / \sqrt{n - 1}]$ .

In this example the mle of $\Phi (c - \theta)$ is $\Phi (c - \overline{X})$ . These two estimators are close because $\sqrt{n / (n - 1)}\to 1$ , as $n\to \infty$ .

Remark 7.6.1. We should like to draw the attention of the reader to a rather important fact. This has to do with the adoption of a principle, such as the principle of unbiasedness and minimum variance. A principle is not a theorem; and seldom does a principle yield satisfactory results in all cases. So far, this principle has provided quite satisfactory results. To see that this is not always the case, let $X$ have a Poisson distribution with parameter $\theta$ , $0 < \theta < \infty$ . We may look upon $X$ as a random sample of size 1 from this distribution. Thus $X$ is a complete sufficient statistic for $\theta$ . We seek the estimator of $e^{-2\theta}$ that is unbiased and has minimum variance. Consider $Y = (-1)^{X}$ . We have

$$
E (Y) = E [ (- 1) ^ {X} ] = \sum_ {x = 0} ^ {\infty} \frac {(- \theta) ^ {x} e ^ {- \theta}}{x !} = e ^ {- 2 \theta}.
$$

Accordingly, $(-1)^{X}$ is the MVUE of $e^{-2\theta}$ . Here this estimator leaves much to be desired. We are endeavoring to elicit some information about the number $e^{-2\theta}$ , where $0 < e^{-2\theta} < 1$ ; yet our point estimate is either $-1$ or $+1$ , each of which is a very poor estimate of a number between 0 and 1. We do not wish to leave the reader with the impression that an MVUE is bad. That is not the case at all. We merely wish to point out that if one tries hard enough, one can find instances where such a statistic is not good. Incidentally, the maximum likelihood estimator of $e^{-2\theta}$ is, in the case where the sample size equals 1, $e^{-2X}$ , which is probably a much better estimator in practice than is the unbiased estimator $(-1)^{X}$ .

# 7.6.1 Bootstrap Standard Errors

Section 6.3 presented the asymptotic theory of maximum likelihood estimators (mles). In many cases, this theory also provides consistent estimators of the asymptotic standard deviation of mles. This allows a simple, but very useful, summary of the estimation process; i.e., $\hat{\theta} \pm \mathrm{SE}(\hat{\theta})$ where $\hat{\theta}$ is the mle of $\theta$ and $\mathrm{SE}(\hat{\theta})$ is the corresponding standard error. For example, these summaries can be used descriptively as labels on plots and tables as well as in the formation of asymptotic confidence intervals for inference. Section 4.9 presented percentile confidence intervals for $\theta$ based on the bootstrap. The bootstrap, though, can also be used to obtain standard errors for estimates including MVUE's.

Consider a random variable $X$ with pdf $f(x;\theta)$ , where $\theta \in \Omega$ . Let $X_{1},\ldots ,X_{n}$ be a random sample on $X$ . Let $\hat{\theta}$ be an estimator of $\theta$ based on the sample. Suppose $x_{1},\ldots ,x_{n}$ is a realization of the sample and let $\hat{\theta} = \hat{\theta} (x_1,\dots,x_n)$ be the corresponding estimate of $\theta$ . Recall in Section 4.9 that the bootstrap uses the empirical cdf $\hat{F}_n$ of the realization. This is the discrete distribution which places mass $1 / n$ at each point $x_{i}$ . The bootstrap procedure samples, with replacement, from $\hat{F}_n$ .

For the bootstrap procedure, we obtain $B$ bootstrap samples. For $i = 1,\dots ,B$ , let the vector $\mathbf{x}_i^* = (x_{i,1}^*,\ldots ,x_{i,n}^*)'$ denote the $i$ th bootstrap sample. Let $\hat{\theta}_i^* = \hat{\theta} (\mathbf{x}_i^*)$ denote the estimate of $\theta$ based on the $i$ th sample. We then have the bootstrap estimates $\hat{\theta}_1^*,\ldots ,\hat{\theta}_B^*$ , which we used in Section 4.9 to obtain the bootstrap percentile confidence interval for $\theta$ . Suppose instead we consider the standard deviation of these bootstrap estimates; that is,

$$
\mathrm {S E} _ {B} = \left[ \frac {1}{B - 1} \sum_ {i = 1} ^ {B} \left(\hat {\theta} _ {1} ^ {*} - \overline {{\hat {\theta} ^ {*}}}\right) ^ {2}, \right] ^ {1 / 2}, \tag {7.6.3}
$$

where $\overline{\hat{\theta}^*} = (1 / B)\sum_{i = 1}^{B}\hat{\theta}_1^*$ . This is the bootstrap estimate of the standard error of $\hat{\theta}$ .

Example 7.6.4. For this example, we consider a data set drawn from a normal distribution, $N(\theta, \sigma^2)$ . In this case the MVUE of $\theta$ is the sample mean $\overline{X}$ and its usual standard error is $s / \sqrt{n}$ , where $s$ is the sample standard deviation. The rounded data<sup>1</sup> are:

27.5 50.9 71.1 43.1 40.4 44.8 36.6 53.5 65.2 47.7

75.7 55.4 61.1 39.8 33.4 57.6 47.9 60.7 27.8 65.2

Assuming the data are in the R vector $\mathbf{x}$ , the mean and standard error are computed as

mean(x); 50.27; sd(x)/sqrt(n); 3.094461

The R function bootse1.R runs the bootstrap for standard errors as described above. Using 3,000 bootstraps, our run of this function estimated the standard error by 3.050878. Thus, the estimate and the bootstrap standard error are summarized as $50.27 \pm 3.05$ .

The bootstrap process described above is often called the nonparametric bootstrap because it makes no assumptions about the pdf $f(x; \theta)$ . In this chapter, though, strong assumptions are made about the model. For instance, in the last example, we assume that the pdf is normal. What if we make use of this information in the bootstrap? This is called the parametric bootstrap. For the last example, instead of sampling from the empirical cdf $\widehat{F}_n$ , we sample randomly from the normal distribution, using as mean $\overline{x}$ and as standard deviation $s$ , the sample standard deviation. The R function bootse2.R performs this parametric bootstrap. For our run on the data set in the example, it computed the standard error as 3.162918. Notice how close the three estimated standard deviations are.

Which bootstrap, nonparametric or parametric, should we use? We recommend the nonparametric bootstrap in general. The strong model assumptions are not needed for its validity. See pages 55-56 of Efron and Tibshirani (1993) for discussion.

# EXERCISES

7.6.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(\theta, 1)$ , $-\infty < \theta < \infty$ . Find the MVUE of $\theta^{2}$ .

Hint: First determine $E(\overline{X}^2)$ .

7.6.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(0, \theta)$ . Then $Y = \sum X_{i}^{2}$ is a complete sufficient statistic for $\theta$ . Find the MVUE of $\theta^{2}$ .

7.6.3. Consider Example 7.6.3 where the parameter of interest is $P(X < c)$ for $X$ distributed $N(\theta, 1)$ . Modify the R function bootse1.R so that for a specified value of $c$ it returns the MVUE of $P(X < c)$ and the bootstrap standard error of the estimate. Run your function on the data in ex763data.rda with $c = 11$ and 3,000 bootstraps. These data are generated from a $N(10,1)$ distribution. Report (a) the true parameter, (b) the MVUE, and (c) the bootstrap standard error.

7.6.4. For Example 7.6.4, modify the R function bootse1.R so that the estimate is the median not the mean. Using 3,000 bootstraps, run your function on the data set discussed in the example and report (a) the estimate and (b) the bootstrap standard error.

7.6.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a uniform $(0, \theta)$ distribution. Continuing with Example 7.6.2, find the MVUEs for the following functions of $\theta$ .

(a) $g(\theta) = \frac{\theta^2}{12}$ , i.e., the variance of the distribution.   
(b) $g(\theta) = \frac{1}{\theta}$ , i.e., the pdf of the distribution.   
(c) For $t$ real, $g(\theta) = \frac{e^{t\theta} - 1}{t\theta}$ , i.e., the mgf of the distribution.

7.6.6. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a Poisson distribution with parameter $\theta > 0$ .

(a) Find the MVUE of $P(X\leq 1) = (1 + \theta)e^{-\theta}$   
Hint: Let $u(x_{1}) = 1$ , $x_{1} \leq 1$ , zero elsewhere, and find $E[u(X_1)|Y = y]$ where $Y = \sum_{1}^{n}X_{i}$ .   
(b) Express the MVUE as a function of the mle of $\theta$   
(c) Determine the asymptotic distribution of the mle of $\theta$   
(d) Obtain the mle of $P(X \leq 1)$ . Then use Theorem 5.2.9 to determine its asymptotic distribution.

7.6.7. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a Poisson distribution with parameter $\theta > 0$ . From Remark 7.6.1, we know that $E[(-1)^{X_1}] = e^{-2\theta}$ .

(a) Show that $E[(-1)^{X_1}|Y_1 = y_1] = (1 - 2/n)^{y_1}$ , where $Y_1 = X_1 + X_2 + \dots + X_n$ . Hint: First show that the conditional pdf of $X_1, X_2, \ldots, X_{n-1}$ , given $Y_1 = y_1$ , is multinomial, and hence that of $X_1$ , given $Y_1 = y_1$ , is $b(y_1, 1/n)$ .   
(b) Show that the mle of $e^{-2\theta}$ is $e^{-2\overline{X}}$   
(c) Since $y_{1} = n\overline{x}$ , show that $(1 - 2 / n)^{y_1}$ is approximately equal to $e^{-2\overline{x}}$ when $n$ is large.

7.6.8. As in Example 7.6.3, let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample of size $n > 1$ from a distribution that is $N(\theta, 1)$ . Show that the joint distribution of $X_{1}$ and $\overline{X}$ is bivariate normal with mean vector $(\theta, \theta)$ , variances $\sigma_{1}^{2} = 1$ and $\sigma_{2}^{2} = 1/n$ , and correlation coefficient $\rho = 1/\sqrt{n}$ .

7.6.9. Let a random sample of size $n$ be taken from a distribution that has the pdf $f(x; \theta) = (1 / \theta) \exp(-x / \theta) I_{(0, \infty)}(x)$ . Find the mle and MVUE of $P(X \leq 2)$ .

7.6.10. Let $X_1, X_2, \ldots, X_n$ be a random sample with the common pdf $f(x) = \theta^{-1} e^{-x / \theta}$ , for $x > 0$ , zero elsewhere; that is, $f(x)$ is a $\Gamma(1, \theta)$ pdf.

(a) Show that the statistic $\overline{X} = n^{-1}\sum_{i=1}^{n} X_i$ is a complete and sufficient statistic for $\theta$ .   
(b) Determine the MVUE of $\theta$   
(c) Determine the mle of $\theta$   
(d) Often, though, this pdf is written as $f(x) = \tau e^{-\tau x}$ , for $x > 0$ , zero elsewhere. Thus $\tau = 1 / \theta$ . Use Theorem 6.1.2 to determine the mle of $\tau$ .   
(e) Show that the statistic $\overline{X} = n^{-1}\sum_{i=1}^{n} X_i$ is a complete and sufficient statistic for $\tau$ . Show that $(n-1)/(n\overline{X})$ is the MVUE of $\tau = 1/\theta$ . Hence, as usual, the reciprocal of the mle of $\theta$ is the mle of $1/\theta$ , but, in this situation, the reciprocal of the MVUE of $\theta$ is not the MVUE of $1/\theta$ .   
(f) Compute the variances of each of the unbiased estimators in parts (b) and (e).

7.6.11. Consider the situation of the last exercise, but suppose we have the following two independent random samples: (1) $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample with the common pdf $f_{X}(x) = \theta^{-1} e^{-x / \theta}$ , for $x > 0$ , zero elsewhere, and (2) $Y_{1}, Y_{2}, \ldots, Y_{n}$ is a random sample with common pdf $f_{Y}(y) = \theta e^{-\theta y}$ , for $y > 0$ , zero elsewhere. The last exercise suggests that, for some constant $c$ , $Z = c \overline{X / Y}$ might be an unbiased estimator of $\theta^2$ . Find this constant $c$ and the variance of $Z$ .

Hint: Show that $\overline{X} /(\theta^2\overline{Y})$ has an $F$ -distribution.

7.6.12. Obtain the asymptotic distribution of the MVUE in Example 7.6.1 for the case $\theta = 1/2$ .

# 7.7 The Case of Several Parameters

In many of the interesting problems we encounter, the pdf or pmf may not depend upon a single parameter $\theta$ , but perhaps upon two (or more) parameters. In general, our parameter space $\Omega$ is a subset of $R^p$ , but in many of our examples $p$ is 2.

Definition 7.7.1. Let $X_1, X_2, \ldots, X_n$ denote a random sample from a distribution that has pdf or pmf $f(x; \pmb{\theta})$ , where $\pmb{\theta} \in \Omega \subset R^p$ . Let $S$ denote the support of $X$ . Let $\mathbf{Y}$ be an $m$ -dimensional random vector of statistics $\mathbf{Y} = (Y_1, \dots, Y_m)'$ , where $Y_i = u_i(X_1, X_2, \dots, X_n)$ , for $i = 1, \dots, m$ . Denote the pdf or pmf of $\mathbf{Y}$ by $f_{\mathbf{Y}}(\mathbf{y}; \pmb{\theta})$ for $\mathbf{y} \in R^m$ . The random vector of statistics $\mathbf{Y}$ is jointly sufficient for $\pmb{\theta}$ if and only if

$$
\frac {\prod_ {i = 1} ^ {n} f (x _ {i} ; \boldsymbol {\theta})}{f _ {\mathbf {Y}} (\mathbf {y} ; \boldsymbol {\theta})} = H (x _ {1}, x _ {2}, \ldots , x _ {n}), \quad \text {f o r a l l} x _ {i} \in \mathcal {S},
$$

where $H(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\pmb{\theta}$ .

In general, $m \neq p$ , i.e., the number of sufficient statistics does not have to be the same as the number of parameters, but in most of our examples this is the case.

As may be anticipated, the factorization theorem can be extended. In our notation it can be stated in the following manner. The vector of statistics $\mathbf{Y}$ is jointly sufficient for the parameter $\pmb{\theta} \in \Omega$ if and only if we can find two nonnegative functions $k_{1}$ and $k_{2}$ such that

$$
\prod_ {i = 1} ^ {n} f \left(x _ {i}; \boldsymbol {\theta}\right) = k _ {1} (\mathbf {y}; \boldsymbol {\theta}) k _ {2} \left(x _ {1}, \dots , x _ {n}\right), \quad \text {f o r a l l} x _ {i} \in \mathcal {S}, \tag {7.7.1}
$$

where the function $k_{2}(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\pmb{\theta}$

Example 7.7.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a distribution having pdf

$$
f (x; \theta_ {1}, \theta_ {2}) = \left\{ \begin{array}{l l} \frac {1}{2 \theta_ {2}} & \theta_ {1} - \theta_ {2} <   x <   \theta_ {1} + \theta_ {2} \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

where $-\infty <  \theta_{1} <   \infty$ $0 <   \theta_{2} <   \infty$ . Let $Y_{1} <   Y_{2} <   \dots <  Y_{n}$ be the order statistics. The joint pdf of $Y_{1}$ and $Y_{n}$ is given by

$$
f _ {Y _ {1}, Y _ {2}} (y _ {1}, y _ {n}; \theta_ {1}, \theta_ {2}) = \frac {n (n - 1)}{(2 \theta_ {2}) ^ {n}} (y _ {n} - y _ {1}) ^ {n - 2}, \quad \theta_ {1} - \theta_ {2} <   y _ {1} <   y _ {n} <   \theta_ {1} + \theta_ {2},
$$

and equals zero elsewhere. Accordingly, the joint pdf of $X_{1},X_{2},\ldots ,X_{n}$ can be written, for all points in its support (all $x_{i}$ such that $\theta_{1} - \theta_{2} < x_{i} < \theta_{1} + \theta_{2}$ ),

$$
\left(\frac {1}{2 \theta_ {2}}\right) ^ {n} = \frac {n (n - 1) [ \max (x _ {i}) - \min (x _ {i}) ] ^ {n - 2}}{(2 \theta_ {2}) ^ {n}} \left(\frac {1}{n (n - 1) [ \max (x _ {i}) - \min (x _ {i}) ] ^ {n - 2}}\right).
$$

Since $\min (x_i)\leq x_j\leq \max (x_i)$ , $j = 1,2,\ldots ,n$ , the last factor does not depend upon the parameters. Either the definition or the factorization theorem assures us that $Y_{1}$ and $Y_{n}$ are joint sufficient statistics for $\theta_{1}$ and $\theta_{2}$ .

The concept of a complete family of probability density functions is generalized as follows: Let

$$
\{f (v _ {1}, v _ {2}, \dots , v _ {k}; \boldsymbol {\theta}): \boldsymbol {\theta} \in \Omega \}
$$

denote a family of pdfs of $k$ random variables $V_{1}, V_{2}, \ldots, V_{k}$ that depends upon the $p$ -dimensional vector of parameters $\pmb{\theta} \in \Omega$ . Let $u(v_{1}, v_{2}, \ldots, v_{k})$ be a function of $v_{1}, v_{2}, \ldots, v_{k}$ (but not a function of any or all of the parameters). If

$$
E [ u (V _ {1}, V _ {2}, \dots , V _ {k}) ] = 0
$$

for all $\theta \in \Omega$ implies that $u(v_{1},v_{2},\ldots ,v_{k}) = 0$ at all points $(v_{1},v_{2},\dots,v_{k})$ , except on a set of points that has probability zero for all members of the family of probability density functions, we shall say that the family of probability density functions is a complete family.

In the case where $\pmb{\theta}$ is a vector, we generally consider best estimators of functions of $\pmb{\theta}$ , that is, parameters $\delta$ , where $\delta = g(\pmb{\theta})$ for a specified function $g$ . For example, suppose we are sampling from a $N(\theta_1, \theta_2)$ distribution, where $\theta_2$ is the variance. Let $\pmb{\theta} = (\theta_1, \theta_2)'$ and consider the two parameters $\delta_1 = g_1(\pmb{\theta}) = \theta_1$ and $\delta_2 = g_2(\pmb{\theta}) = \sqrt{\theta_2}$ . Hence we are interested in best estimates of $\delta_1$ and $\delta_2$ .

The Rao-Blackwell, Lehmann-Scheffé theory outlined in Sections 7.3 and 7.4 extends naturally to this vector case. Briefly, suppose $\delta = g(\pmb{\theta})$ is the parameter of interest and $\mathbf{Y}$ is a vector of sufficient and complete statistics for $\pmb{\theta}$ . Let $T$ be a statistic that is a function of $\mathbf{Y}$ , such as $T = T(\mathbf{Y})$ . If $E(T) = \delta$ , then $T$ is the unique MVUE of $\delta$ .

The remainder of our treatment of the case of several parameters is restricted to probability density functions that represent what we shall call regular cases of the exponential class. Here $m = p$ .

Definition 7.7.2. Let $X$ be a random variable with pdf or pmf $f(x; \theta)$ , where the vector of parameters $\theta \in \Omega \subset R^m$ . Let $S$ denote the support of $X$ . If $X$ is continuous, assume that $S = (a, b)$ , where $a$ or $b$ may be $-\infty$ or $\infty$ , respectively. If $X$ is discrete, assume that $S = \{a_1, a_2, \ldots\}$ . Suppose $f(x; \theta)$ is of the form

$$
f (x; \boldsymbol {\theta}) = \left\{ \begin{array}{l l} \exp \left[ \sum_ {j = 1} ^ {m} p _ {j} (\boldsymbol {\theta}) K _ {j} (x) + H (x) + q \left(\theta_ {1}, \theta_ {2}, \dots , \theta_ {m}\right) \right] & f o r a l l x \in \mathcal {S} \\ 0 & e l s e w h e r e. \end{array} \right. \tag {7.7.2}
$$

Then we say this pdf or pmf is a member of the exponential class. We say it is a regular case of the exponential family if, in addition,

1. the support does not depend on the vector of parameters $\pmb{\theta}$

2. the space $\Omega$ contains a nonempty, $m$ -dimensional open rectangle,

3. the $p_j(\pmb{\theta})$ , $j = 1, \dots, m$ , are nontrivial, functionally independent, continuous functions of $\pmb{\theta}$ ,

4. and, depending on whether $X$ is continuous or discrete, one of the following holds, respectively:

(a) if $X$ is a continuous random variable, then the $m$ derivatives $K_{j}^{\prime}(x)$ , for $j = 1,2,\ldots,m$ , are continuous for $a < x < b$ and no one is a linear homogeneous function of the others, and $H(x)$ is a continuous function of $x$ , $a < x < b$ .   
(b) if $X$ is discrete, the $K_{j}(x)$ , $j = 1,2,\ldots,m$ , are nontrivial functions of $x$ on the support $S$ and no one is a linear homogeneous function of the others.

Let $X_{1},\ldots ,X_{n}$ be a random sample on $X$ where the pdf or pmf of $X$ is a regular case of the exponential class with the same notation as in Definition 7.7.2. It follows from (7.7.2) that the joint pdf or pmf of the sample is given by

$$
\prod_ {i = 1} ^ {n} f (x _ {i}; \boldsymbol {\theta}) = \exp \left[ \sum_ {j = 1} ^ {m} p _ {j} (\boldsymbol {\theta}) \sum_ {i = 1} ^ {n} K _ {j} (x _ {i}) + n q (\boldsymbol {\theta}) \right] \exp \left[ \sum_ {i = 1} ^ {n} H (x _ {i}) \right], \tag {7.7.3}
$$

for all $x_{i} \in S$ . In accordance with the factorization theorem, the statistics

$$
Y _ {1} = \sum_ {i = 1} ^ {n} K _ {1} (x _ {i}), \quad Y _ {2} = \sum_ {i = 1} ^ {n} K _ {2} (x _ {i}), \dots , Y _ {m} = \sum_ {i = 1} ^ {n} K _ {m} (x _ {i})
$$

are joint sufficient statistics for the $m$ -dimensional vector of parameters $\pmb{\theta}$ . It is left as an exercise to prove that the joint pdf of $\mathbf{Y} = (Y_1, \ldots, Y_m)'$ is of the form

$$
R (\mathbf {y}) \exp \left[ \sum_ {j = 1} ^ {m} p _ {j} (\boldsymbol {\theta}) y _ {j} + n q (\boldsymbol {\theta}) \right], \tag {7.7.4}
$$

at points of positive probability density. These points of positive probability density and the function $R(\mathbf{y})$ do not depend upon the vector of parameters $\pmb{\theta}$ . Moreover, in accordance with a theorem in analysis, it can be asserted that in a regular case of the exponential class, the family of probability density functions of these joint sufficient statistics $Y_{1}, Y_{2}, \ldots, Y_{m}$ is complete when $n > m$ . In accordance with a convention previously adopted, we shall refer to $Y_{1}, Y_{2}, \ldots, Y_{m}$ as joint complete sufficient statistics for the vector of parameters $\pmb{\theta}$ .

Example 7.7.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(\theta_{1}, \theta_{2})$ , $-\infty < \theta_{1} < \infty$ , $0 < \theta_{2} < \infty$ . Thus the pdf $f(x; \theta_{1}, \theta_{2})$ of the distribution may be written as

$$
f (x; \theta_ {1}, \theta_ {2}) = \exp \left(\frac {- 1}{2 \theta_ {2}} x ^ {2} + \frac {\theta_ {1}}{\theta_ {2}} x - \frac {\theta_ {1} ^ {2}}{2 \theta_ {2}} - \ln \sqrt {2 \pi \theta_ {2}}\right).
$$

Therefore, we can take $K_{1}(x) = x^{2}$ and $K_{2}(x) = x$ . Consequently, the statistics

$$
Y _ {1} = \sum_ {1} ^ {n} X _ {i} ^ {2} \quad \text {a n d} \quad Y _ {2} = \sum_ {1} ^ {n} X _ {i}
$$

are joint complete sufficient statistics for $\theta_{1}$ and $\theta_{2}$ . Since the relations

$$
Z _ {1} = \frac {Y _ {2}}{n} = \bar {X}, \quad Z _ {2} = \frac {Y _ {1} - Y _ {2} ^ {2} / n}{n - 1} = \frac {\sum (X _ {i} - \bar {X}) ^ {2}}{n - 1}
$$

define a one-to-one transformation, $Z_{1}$ and $Z_{2}$ are also joint complete sufficient statistics for $\theta_{1}$ and $\theta_{2}$ . Moreover,

$$
E (Z _ {1}) = \theta_ {1} \quad \text {a n d} \quad E (Z _ {2}) = \theta_ {2}.
$$

From completeness, we have that $Z_{1}$ and $Z_{2}$ are the only functions of $Y_{1}$ and $Y_{2}$ that are unbiased estimators of $\theta_{1}$ and $\theta_{2}$ , respectively. Hence $Z_{1}$ and $Z_{2}$ are the unique minimum variance estimators of $\theta_{1}$ and $\theta_{2}$ , respectively. The MVUE of the standard deviation $\sqrt{\theta_2}$ is derived in Exercise 7.7.5.

In this section we have extended the concepts of sufficiency and completeness to the case where $\pmb{\theta}$ is a $p$ -dimensional vector. We now extend these concepts to the case where $\mathbf{X}$ is a $k$ -dimensional random vector. We only consider the regular exponential class.

Suppose $\mathbf{X}$ is a $k$ -dimensional random vector with pdf or pmf $f(\mathbf{x};\pmb{\theta})$ , where $\pmb{\theta} \in \Omega \subset R^{p}$ . Let $\mathcal{S} \subset R^{k}$ denote the support of $\mathbf{X}$ . Suppose $f(\mathbf{x};\pmb{\theta})$ is of the form

$$
f (\mathbf {x}; \boldsymbol {\theta}) = \left\{ \begin{array}{l l} \exp \left[ \sum_ {j = 1} ^ {m} p _ {j} (\boldsymbol {\theta}) K _ {j} (\mathbf {x}) + H (\mathbf {x}) + q (\boldsymbol {\theta}) \right] & \text {f o r a l l} \mathbf {x} \in \mathcal {S} \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {7.7.5}
$$

Then we say this pdf or pmf is a member of the exponential class. If, in addition, $p = m$ , the support does not depend on the vector of parameters $\pmb{\theta}$ , and conditions similar to those of Definition 7.7.2 hold, then we say this pdf is a regular case of the exponential class.

Suppose that $\mathbf{X}_1, \ldots, \mathbf{X}_n$ constitute a random sample on $\mathbf{X}$ . Then the statistics,

$$
Y _ {j} = \sum_ {i = 1} ^ {n} K _ {j} \left(\mathbf {X} _ {i}\right), \quad \text {f o r} j = 1, \dots , m, \tag {7.7.6}
$$

are sufficient and complete statistics for $\pmb{\theta}$ . Let $\mathbf{Y} = (Y_1, \dots, Y_m)'$ . Suppose $\delta = g(\pmb{\theta})$ is a parameter of interest. If $T = h(\mathbf{Y})$ for some function $h$ and $E(T) = \delta$ then $T$ is the unique minimum variance unbiased estimator of $\delta$ .

Example 7.7.3 (Multinomial). In Example 6.4.5, we consider the mles of the multinomial distribution. In this example we determine the MVUEs of several of the parameters. As in Example 6.4.5, consider a random trial that can result in one, and only one, of $k$ outcomes or categories. Let $X_{j}$ be 1 or 0 depending on whether the $j$ th outcome does or does not occur, for $j = 1, \ldots, k$ . Suppose the probability

that outcome $j$ occurs is $p_j$ ; hence, $\sum_{j=1}^{k} p_j = 1$ . Let $\mathbf{X} = (X_1, \ldots, X_{k-1})'$ and $\mathbf{p} = (p_1, \ldots, p_{k-1})'$ . The distribution of $\mathbf{X}$ is multinomial and can be found in expression (6.4.18), which can be reexpressed as

$$
f (\mathbf {x}, \mathbf {p}) = \exp \left\{\sum_ {j = 1} ^ {k - 1} \left(\log \left[ \frac {p _ {j}}{1 - \sum_ {i \neq k} p _ {i}} \right]\right) x _ {j} + \log \left(1 - \sum_ {i \neq k} p _ {i}\right) \right\}.
$$

Because this a regular case of the exponential family, the following statistics, resulting from a random sample $\mathbf{X}_1,\ldots ,\mathbf{X}_n$ from the distribution of $\mathbf{X}$ , are jointly sufficient and complete for the parameters $\mathbf{p} = (p_{1},\dots,p_{k - 1})^{\prime}$ :

$$
Y _ {j} = \sum_ {i = 1} ^ {n} X _ {i j}, \quad \mathrm {f o r} j = 1, \ldots , k - 1.
$$

Each random variable $X_{ij}$ is Bernoulli with parameter $p_j$ and the variables $X_{ij}$ are independent for $i = 1, \ldots, n$ . Hence the variables $Y_j$ are binomial $(n, p_j)$ for $j = 1, \ldots, k$ . Thus the MVUE of $p_j$ is the statistic $n^{-1}Y_j$ .

Next, we shall find the MVUE of $p_j p_l$ , for $j \neq l$ . Exercise 7.7.8 shows that the mle of $p_j p_l$ is $n^{-2} Y_j Y_l$ . Recall from Section 3.1 that the conditional distribution of $Y_j$ , given $Y_l$ , is $b[n - Y_l, p_j / (1 - p_l)]$ . As an initial guess at the MVUE, consider the mle, which, as shown by Exercise 7.7.8, is $n^{-2} Y_j Y_l$ . Hence

$$
\begin{array}{l} E [ n ^ {- 2} Y _ {j} Y _ {l} ] = \frac {1}{n ^ {2}} E [ E (Y _ {j} Y _ {l} | Y _ {l}) ] = \frac {1}{n ^ {2}} E [ Y _ {l} E (Y _ {j} | Y _ {l}) ] \\ { = } { \frac { 1 } { n ^ { 2 } } E \left[ Y _ { l } ( n - Y _ { l } ) \frac { p _ { j } } { 1 - p _ { l } } \right] = \frac { 1 } { n ^ { 2 } } \frac { p _ { j } } { 1 - p _ { l } } \{ E [ n Y _ { l } ] - E [ Y _ { l } ^ { 2 } ] \} } \\ = \frac {1}{n ^ {2}} \frac {p _ {j}}{1 - p _ {l}} \{n ^ {2} p _ {l} - n p _ {l} (1 - p _ {l}) - n ^ {2} p _ {l} ^ {2} \} \\ = \frac {1}{n ^ {2}} \frac {p _ {j}}{1 - p _ {l}} n p _ {l} (n - 1) (1 - p _ {l}) = \frac {(n - 1)}{n} p _ {j} p _ {l}. \\ \end{array}
$$

Hence the MVUE of $p_j p_l$ is $\frac{1}{n(n-1)} Y_j Y_l$ .

Example 7.7.4 (Multivariate Normal). Let $\mathbf{X}$ have the multivariate normal distribution $N_{k}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ , where $\boldsymbol{\Sigma}$ is a positive definite $k\times k$ matrix. The pdf of $\mathbf{X}$ is given in expression (3.5.16). In this case $\pmb{\theta}$ is a $\{k + [k(k + 1) / 2]\}$ -dimensional vector whose first $k$ components consist of the mean vector $\pmb{\mu}$ and whose last $\frac{k(k + 1)}{2}$ components consist of the componentwise variances $\sigma_{i}^{2}$ and the covariances $\sigma_{ij}$ , for $j\geq i$ . The density of $\mathbf{X}$ can be written as

$$
f _ {\mathbf {X}} (\mathbf {x}) = \exp \left\{- \frac {1}{2} \mathbf {x} ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} \mathbf {x} + \boldsymbol {\mu} ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} \mathbf {x} - \frac {1}{2} \boldsymbol {\mu} ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} \boldsymbol {\mu} - \frac {1}{2} \log | \boldsymbol {\Sigma} | - \frac {k}{2} \log 2 \pi \right\}, \tag {7.7.7}
$$

for $\mathbf{x} \in R^k$ . Hence, by (7.7.5), the multivariate normal pdf is a regular case of the exponential class of distributions. We need only identify the functions $K(\mathbf{x})$ . The second term in the exponent on the right side of (7.7.7) can be written as $(\boldsymbol{\mu}'\boldsymbol{\Sigma}^{-1})\mathbf{x}$ ;

hence, $K_{1}(\mathbf{x}) = \mathbf{x}$ . The first term is easily seen to be a linear combination of the products $x_{i}x_{j}$ , $i,j = 1,2,\ldots,k$ , which are the entries of the matrix $\mathbf{xx}'$ . Hence we can take $K_{2}(\mathbf{x}) = \mathbf{xx}'$ . Now, let $\mathbf{X}_1,\dots,\mathbf{X}_n$ be a random sample on $\mathbf{X}$ . Based on (7.7.7) then, a set of sufficient and complete statistics is given by

$$
\mathbf {Y} _ {1} = \sum_ {i = 1} ^ {n} \mathbf {X} _ {i} \text {a n d} \mathbf {Y} _ {2} = \sum_ {i = 1} ^ {n} \mathbf {X} _ {i} \mathbf {X} _ {i} ^ {\prime}. \tag {7.7.8}
$$

Note that $\mathbf{Y}_1$ is a vector of $k$ statistics and that $\mathbf{Y}_2$ is a $k \times k$ symmetric matrix. Because the matrix is symmetric, we can eliminate the bottom-half [elements $(i,j)$ with $i > j$ ] of the matrix, which results in $\{k + [k(k + 1)]\}$ complete sufficient statistics, i.e., as many complete sufficient statistics as there are parameters.

Based on marginal distributions, it is easy to show that $\overline{X}_j = n^{-1}\sum_{i=1}^{n} X_{ij}$ is the MVUE of $\mu_j$ and that $(n-1)^{-1}\sum_{i=1}^{n}(X_{ij} - \overline{X}_j)^2$ is the MVUE of $\sigma_j^2$ . The MVUEs of the covariance parameters are obtained in Exercise 7.7.9.

For our last example, we consider a case where the set of parameters is the cdf.

Example 7.7.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample having the common continuous cdf $F(x)$ . Let $Y_{1} < Y_{2} < \dots < Y_{n}$ denote the corresponding order statistics. Note that given $Y_{1} = y_{1}, Y_{2} = y_{2}, \ldots, Y_{n} = y_{n}$ , the conditional distribution of $X_{1}, X_{2}, \ldots, X_{n}$ is discrete with probability $\frac{1}{n!}$ on each of the $n!$ permutations of the vector $(y_{1}, y_{2}, \ldots, y_{n})$ , [because $F(x)$ is continuous, we can assume that each of the values $y_{1}, y_{2}, \ldots, y_{n}$ is distinct]. That is, the conditional distribution does not depend on $F(x)$ . Hence, by the definition of sufficiency, the order statistics are sufficient for $F(x)$ . Furthermore, while the proof is beyond the scope of this book, it can be shown that the order statistics are also complete; see page 72 of Lehmann and Casella (1998).

Let $T = T(x_{1},x_{2},\ldots ,x_{n})$ be any statistic that is symmetric in its arguments; i.e., $T(x_{1},x_{2},\ldots ,x_{n}) = T(x_{i_{1}},x_{i_{2}},\ldots ,x_{i_{n}})$ for any permutation $(x_{i_1},x_{i_2},\dots,x_{i_n})$ of $(x_{1},x_{2},\ldots ,x_{n})$ . Then $T$ is a function of the order statistics. This is useful in determining MVUEs for this situation; see Exercises 7.7.12 and 7.7.13.

# EXERCISES

7.7.1. Let $Y_{1} < Y_{2} < Y_{3}$ be the order statistics of a random sample of size 3 from the distribution with pdf

$$
f (x; \theta_ {1}, \theta_ {2}) = \left\{ \begin{array}{l l} \frac {1}{\theta_ {2}} \exp \left(- \frac {x - \theta_ {1}}{\theta_ {2}}\right) & \theta_ {1} <   x <   \infty , - \infty <   \theta_ {1} <   \infty , 0 <   \theta_ {2} <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Find the joint pdf of $Z_{1} = Y_{1}, Z_{2} = Y_{2}$ , and $Z_{3} = Y_{1} + Y_{2} + Y_{3}$ . The corresponding transformation maps the space $\{(y_{1}, y_{2}, y_{3}) : \theta_{1} < y_{1} < y_{2} < y_{3} < \infty\}$ onto the space

$$
\left\{\left(z _ {1}, z _ {2}, z _ {3}\right): \theta_ {1} <   z _ {1} <   z _ {2} <   \left(z _ {3} - z _ {1}\right) / 2 <   \infty \right\}.
$$

Show that $Z_{1}$ and $Z_{3}$ are joint sufficient statistics for $\theta_{1}$ and $\theta_{2}$ .

7.7.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a distribution that has a pdf of the form (7.7.2) of this section. Show that $Y_{1} = \sum_{i=1}^{n} K_{1}(X_{i}), \ldots, Y_{m} = \sum_{i=1}^{m} K_{m}(X_{i})$ have a joint pdf of the form (7.7.4) of this section.

7.7.3. Let $(X_{1},Y_{1}),(X_{2},Y_{2}),\ldots ,(X_{n},Y_{n})$ denote a random sample of size $n$ from a bivariate normal distribution with means $\mu_{1}$ and $\mu_{2}$ , positive variances $\sigma_1^2$ and $\sigma_2^2$ , and correlation coefficient $\rho$ . Show that $\sum_{1}^{n}X_{i}$ , $\sum_{1}^{n}Y_{i}$ , $\sum_{1}^{n}X_{i}^{2}$ , $\sum_{1}^{n}Y_{i}^{2}$ , and $\sum_{1}^{n}X_{i}Y_{i}$ are joint complete sufficient statistics for the five parameters. Are $\overline{X} = \sum_{1}^{n}X_{i} / n$ , $\overline{Y} = \sum_{1}^{n}Y_{i} / n$ , $S_1^2 = \sum_{1}^{n}(X_i - \overline{X})^2 /(n - 1)$ , $S_2^2 = \sum_{1}^{n}(Y_i - \overline{Y})^2 /(n - 1)$ , and $\sum_{1}^{n}(X_{i} - \overline{X})(Y_{i} - \overline{Y}) / (n - 1)S_{1}S_{2}$ also joint complete sufficient statistics for these parameters?

7.7.4. Let the pdf $f(x; \theta_1, \theta_2)$ be of the form

$$
\exp \left[ p _ {1} \left(\theta_ {1}, \theta_ {2}\right) K _ {1} (x) + p _ {2} \left(\theta_ {1}, \theta_ {2}\right) K _ {2} (x) + H (x) + q _ {1} \left(\theta_ {1}, \theta_ {2}\right) \right], a <   x <   b,
$$

zero elsewhere. Suppose that $K_1'(x) = cK_2'(x)$ . Show that $f(x; \theta_1, \theta_2)$ can be written in the form

$$
\exp \left[ p \left(\theta_ {1}, \theta_ {2}\right) K _ {2} (x) + H (x) + q \left(\theta_ {1}, \theta_ {2}\right) \right], a <   x <   b,
$$

zero elsewhere. This is the reason why it is required that no one $K_{j}^{\prime}(x)$ be a linear homogeneous function of the others, that is, so that the number of sufficient statistics equals the number of parameters.

7.7.5. In Example 7.7.2:

(a) Find the MVUE of the standard deviation $\sqrt{\theta_2}$ .   
(b) Modify the R function bootse1.R so that it returns the estimate in (a) and its bootstrap standard error. Run it on the Bavarian forest data discussed in Example 4.1.3, where the response is the concentration of sulfur dioxide. Using 3,000 bootstraps, report the estimate and its bootstrap standard error.

7.7.6. Let $X_1, X_2, \ldots, X_n$ be a random sample from the uniform distribution with pdf $f(x; \theta_1, \theta_2) = 1 / (2\theta_2)$ , $\theta_1 - \theta_2 < x < \theta_1 + \theta_2$ , where $-\infty < \theta_1 < \infty$ and $\theta_2 > 0$ , and the pdf is equal to zero elsewhere.

(a) Show that $Y_{1} = \min(X_{i})$ and $Y_{n} = \max(X_{i})$ , the joint sufficient statistics for $\theta_{1}$ and $\theta_{2}$ , are complete.   
(b) Find the MVUEs of $\theta_{1}$ and $\theta_{2}$ .

7.7.7. Let $X_{1},X_{2},\ldots ,X_{n}$ be a random sample from $N(\theta_1,\theta_2)$

(a) If the constant $b$ is defined by the equation $P(X \leq b) = p$ where $p$ is specified, find the mle and the MVUE of $b$ .   
(b) Modify the R function bootse1.R so that it returns the MVUE of Part (a) and its bootstrap standard error.   
(c) Run your function in Part (b) on the data set discussed in Example 7.6.4 for $p = 0.75$ and 3,000 bootstraps.

7.7.8. In the notation of Example 7.7.3, show that the mle of $p_j p_l$ is $n^{-2} Y_j Y_l$ .

7.7.9. Refer to Example 7.7.4 on sufficiency for the multivariate normal model.

(a) Determine the MVUE of the covariance parameters $\sigma_{ij}$ .   
(b) Let $g = \sum_{i=1}^{k} a_i \mu_i$ , where $a_1, \ldots, a_k$ are specified constants. Find the MVUE for $g$ .

7.7.10. In a personal communication, LeRoy Folks noted that the inverse Gaussian pdf

$$
f \left(x; \theta_ {1}, \theta_ {2}\right) = \left(\frac {\theta_ {2}}{2 \pi x ^ {3}}\right) ^ {1 / 2} \exp \left[ \frac {- \theta_ {2} \left(x - \theta_ {1}\right) ^ {2}}{2 \theta_ {1} ^ {2} x} \right], \quad 0 <   x <   \infty , \tag {7.7.9}
$$

where $\theta_{1} > 0$ and $\theta_{2} > 0$ , is often used to model lifetimes. Find the complete sufficient statistics for $(\theta_{1},\theta_{2})$ if $X_{1},X_{2},\ldots ,X_{n}$ is a random sample from the distribution having this pdf.

7.7.11. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a $N(\theta_{1}, \theta_{2})$ distribution.

(a) Show that $E[(X_1 - \theta_1)^4] = 3\theta_2^2$ .   
(b) Find the MVUE of $3\theta_2^2$

7.7.12. Let $X_{1},\ldots ,X_{n}$ be a random sample from a distribution of the continuous type with cdf $F(x)$ . Suppose the mean, $\mu = E(X_1)$ , exists. Using Example 7.7.5, show that the sample mean, $\overline{X} = n^{-1}\sum_{i = 1}^{n}X_{i}$ , is the MVUE of $\mu$ .

7.7.13. Let $X_{1}, \ldots, X_{n}$ be a random sample from a distribution of the continuous type with cdf $F(x)$ . Let $\theta = P(X_{1} \leq a) = F(a)$ , where $a$ is known. Show that the proportion $n^{-1} \# \{X_{i} \leq a\}$ is the MVUE of $\theta$ .

# 7.8 Minimal Sufficiency and Ancillary Statistics

In the study of statistics, it is clear that we want to reduce the data contained in the entire sample as much as possible without losing relevant information about the important characteristics of the underlying distribution. That is, a large collection of numbers in the sample is not as meaningful as a few good summary statistics of those data. Sufficient statistics, if they exist, are valuable because we know that the statisticians with those summary measures have as much information as the statistician with the entire sample. Sometimes, however, there are several sets of joint sufficient statistics, and thus we would like to find the simplest one of these sets. For illustration, in a sense, the observations $X_{1}, X_{2}, \ldots, X_{n}$ , $n > 2$ , of a random sample from $N(\theta_{1}, \theta_{2})$ could be thought of as joint sufficient statistics for $\theta_{1}$ and $\theta_{2}$ . We know, however, that we can use $\overline{X}$ and $S^{2}$ as joint sufficient statistics for those parameters, which is a great simplification over using $X_{1}, X_{2}, \ldots, X_{n}$ , particularly if $n$ is large.

In most instances in this chapter, we have been able to find a single sufficient statistic for one parameter or two joint sufficient statistics for two parameters. Possibly the most complicated cases considered so far are given in Example 7.7.3, in

which we find $k + k(k + 1) / 2$ joint sufficient statistics for $k + k(k + 1) / 2$ parameters; or the multivariate normal distribution given in Example 7.7.4; or in the use the order statistics of a random sample for some completely unknown distribution of the continuous type as in Example 7.7.5.

What we would like to do is to change from one set of joint sufficient statistics to another, always reducing the number of statistics involved until we cannot go any further without losing the sufficiency of the resulting statistics. Those statistics that are there at the end of this reduction are called minimal sufficient statistics. These are sufficient for the parameters and are functions of every other set of sufficient statistics for those same parameters. Often, if there are $k$ parameters, we can find $k$ joint sufficient statistics that are minimal. In particular, if there is one parameter, we can often find a single sufficient statistic that is minimal. Most of the earlier examples that we have considered illustrate this point, but this is not always the case, as shown by the following example.

Example 7.8.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from the uniform distribution over the interval $(\theta - 1, \theta + 1)$ having pdf

$$
f (x; \theta) = (\frac {1}{2}) I _ {(\theta - 1, \theta + 1)} (x), \quad \mathrm {w h e r e} - \infty <   \theta <   \infty .
$$

The joint pdf of $X_{1},X_{2},\ldots ,X_{n}$ equals the product of $(\frac{1}{2})^n$ and certain indicator functions, namely,

$$
\left(\frac {1}{2}\right) ^ {n} \prod_ {i = 1} ^ {n} I _ {(\theta - 1, \theta + 1)} (x _ {i}) = \left(\frac {1}{2}\right) ^ {n} \{I _ {(\theta - 1, \theta + 1)} [ \min (x _ {i}) ] \} \{I _ {(\theta - 1, \theta + 1)} [ \max (x _ {i}) ] \},
$$

because $\theta - 1 < \min(x_i) \leq x_j \leq \max(x_i) < \theta + 1$ , $j = 1, 2, \ldots, n$ . Thus the order statistics $Y_1 = \min(X_i)$ and $Y_n = \max(X_i)$ are the sufficient statistics for $\theta$ . These two statistics actually are minimal for this one parameter, as we cannot reduce the number of them to less than two and still have sufficiency.

There is an observation that helps us see that almost all the sufficient statistics that we have studied thus far are minimal. We have noted that the mle $\hat{\theta}$ of $\theta$ is a function of one or more sufficient statistics, when the latter exists. Suppose that this mle $\hat{\theta}$ is also sufficient. Since this sufficient statistic $\hat{\theta}$ is a function of the other sufficient statistics, by Theorem 7.3.2, it must be minimal. For example, we have

1. The mle $\hat{\theta} = \overline{X}$ of $\theta$ in $N(\theta, \sigma^2)$ , $\sigma^2$ known, is a minimal sufficient statistic for $\theta$ .   
2. The mle $\hat{\theta} = \overline{X}$ of $\theta$ in a Poisson distribution with mean $\theta$ is a minimal sufficient statistic for $\theta$ .   
3. The mle $\hat{\theta} = Y_{n} = \max(X_{i})$ of $\theta$ in the uniform distribution over $(0, \theta)$ is a minimal sufficient statistic for $\theta$ .   
4. The maximum likelihood estimators $\hat{\theta}_1 = \overline{X}$ and $\hat{\theta}_2 = [(n - 1) / n]S^2$ of $\theta_{1}$ and $\theta_{2}$ in $N(\theta_1,\theta_2)$ are joint minimal sufficient statistics for $\theta_{1}$ and $\theta_{2}$ .

From these examples we see that the minimal sufficient statistics do not need to be unique, for any one-to-one transformation of them also provides minimal sufficient statistics. The linkage between minimal sufficient statistics and the mle, however, does not hold in many interesting instances. We illustrate this in the next two examples.

Example 7.8.2. Consider the model given in Example 7.8.1. There we noted that $Y_{1} = \min(X_{i})$ and $Y_{n} = \max(X_{i})$ are joint sufficient statistics. Also, we have

$$
\theta - 1 <   Y _ {1} <   Y _ {n} <   \theta + 1
$$

or, equivalently,

$$
Y _ {n} - 1 <   \theta <   Y _ {1} + 1.
$$

Hence, to maximize the likelihood function so that it equals $\left(\frac{1}{2}\right)^n$ , $\theta$ can be any value between $Y_{n} - 1$ and $Y_{1} + 1$ . For example, many statisticians take the mle to be the mean of these two endpoints, namely,

$$
\hat {\theta} = \frac {Y _ {n} - 1 + Y _ {1} + 1}{2} = \frac {Y _ {1} + Y _ {n}}{2},
$$

which is the midrange. We recognize, however, that this mle is not unique. Some might argue that since $\hat{\theta}$ is an mle of $\theta$ and since it is a function of the joint sufficient statistics, $Y_{1}$ and $Y_{n}$ , for $\theta$ , it is a minimal sufficient statistic. This is not the case at all, for $\hat{\theta}$ is not even sufficient. Note that the mle must itself be a sufficient statistic for the parameter before it can be considered the minimal sufficient statistic.

Note that we can model the situation in the last example by

$$
X _ {i} = \theta + W _ {i}, \tag {7.8.1}
$$

where $W_{1}, W_{2}, \ldots, W_{n}$ are iid with the common uniform $(-1, 1)$ pdf. Hence this is an example of a location model. We discuss these models in general next.

Example 7.8.3. Consider a location model given by

$$
X _ {i} = \theta + W _ {i}, \tag {7.8.2}
$$

where $W_{1}, W_{2}, \ldots, W_{n}$ are iid with the common pdf $f(w)$ and common continuous cdf $F(w)$ . From Example 7.7.5, we know that the order statistics $Y_{1} < Y_{2} < \dots < Y_{n}$ are a set of complete and sufficient statistics for this situation. Can we obtain a smaller set of minimal sufficient statistics? Consider the following four situations:

(a) Suppose $f(w)$ is the $N(0,1)$ pdf. Then we know that $\overline{X}$ is both the MVUE and mle of $\theta$ . Also, $\overline{X} = n^{-1}\sum_{i=1}^{n}Y_{i}$ , i.e., a function of the order statistics. Hence $\overline{X}$ is minimal sufficient.   
(b) Suppose $f(w) = \exp \{-w\}$ , for $w > 0$ , zero elsewhere. Then the statistic $Y_{1}$ is a sufficient statistic as well as the mle, and thus is minimal sufficient.

(c) Suppose $f(w)$ is the logistic pdf. As discussed in Example 6.1.2, the mle of $\theta$ exists and it is easy to compute. As shown on page 38 of Lehmann and Casella (1998), though, the order statistics are minimal sufficient for this situation. That is, no reduction is possible.

(d) Suppose $f(w)$ is the Laplace pdf. It was shown in Example 6.1.1 that the median, $Q_{2}$ is the mle of $\theta$ , but it is not a sufficient statistic. Further, similar to the logistic pdf, it can be shown that the order statistics are minimal sufficient for this situation.

In general, the situation described in parts (c) and (d), where the mle is obtained rather easily while the set of minimal sufficient statistics is the set of order statistics and no reduction is possible, is the norm for location models.

There is also a relationship between a minimal sufficient statistic and completeness that is explained more fully in Lehmann and Scheffé (1950). Let us say simply and without explanation that for the cases in this book, complete sufficient statistics are minimal sufficient statistics. The converse is not true, however, by noting that in Example 7.8.1, we have

$$
E \left[ \frac {Y _ {n} - Y _ {1}}{2} - \frac {n - 1}{n + 1} \right] = 0, \quad \text {f o r a l l} \theta .
$$

That is, there is a nonzero function of those minimal sufficient statistics, $Y_{1}$ and $Y_{n}$ , whose expectation is zero for all $\theta$ .

There are other statistics that almost seem opposites of sufficient statistics. That is, while sufficient statistics contain all the information about the parameters, these other statistics, called ancillary statistics, have distributions free of the parameters and seemingly contain no information about those parameters. As an illustration, we know that the variance $S^2$ of a random sample from $N(\theta, 1)$ has a distribution that does not depend upon $\theta$ and hence is an ancillary statistic. Another example is the ratio $Z = X_1 / (X_1 + X_2)$ , where $X_1, X_2$ is a random sample from a gamma distribution with known parameter $\alpha > 0$ and unknown parameter $\beta = \theta$ , because $Z$ has a beta distribution that is free of $\theta$ . There are many examples of ancillary statistics, and we provide some rules that make them rather easy to find with certain models, which we present in the next three examples.

Example 7.8.4 (Location-Invariant Statistics). In Example 7.8.3, we introduced the location model. Recall that a random sample $X_{1},X_{2},\ldots ,X_{n}$ follows this model if

$$
X _ {i} = \theta + W _ {i}, \quad i = 1, \dots , n, \tag {7.8.3}
$$

where $-\infty < \theta < \infty$ is a parameter and $W_{1}, W_{2}, \ldots, W_{n}$ are iid random variables with the pdf $f(w)$ , which does not depend on $\theta$ . Then the common pdf of $X_{i}$ is $f(x - \theta)$ .

Let $Z = u(X_{1},X_{2},\ldots ,X_{n})$ be a statistic such that

$$
u (x _ {1} + d, x _ {2} + d, \dots , x _ {n} + d) = u (x _ {1}, x _ {2}, \dots , x _ {n}),
$$

for all real $d$ . Hence

$$
Z = u \left(W _ {1} + \theta , W _ {2} + \theta , \dots , W _ {n} + \theta\right) = u \left(W _ {1}, W _ {2}, \dots , W _ {n}\right)
$$

is a function of $W_{1}, W_{2}, \ldots, W_{n}$ alone (not of $\theta$ ). Hence $Z$ must have a distribution that does not depend upon $\theta$ . We call $Z = u(X_{1}, X_{2}, \ldots, X_{n})$ a location-invariant statistic.

Assuming a location model, the following are some examples of location-invariant statistics: the sample variance $= S^2$ , the sample range $= \max \{X_i\} - \min \{X_i\}$ , the mean deviation from the sample median $= (1/n) \sum |X_i - \text{median}(X_i)|$ , $X_1 + X_2 - X_3 - X_4$ , $X_1 + X_3 - 2X_2$ , $(1/n) \sum [X_i - \min(X_i)]$ , and so on. To see that the range is location-invariant, note that

$$
\begin{array}{l} \max  \left\{X _ {i} \right\} - \theta = \max  \left\{X _ {i} - \theta \right\} = \max  \left\{W _ {i} \right\} \\ \min  \{X _ {i} \} - \theta = \min  \{X _ {i} - \theta \} = \min  \{W _ {i} \}. \\ \end{array}
$$

So,

range $= \max \{X_{i}\} -\min \{X_{i}\} = \max \{X_{i}\} -\theta -(\min \{X_{i}\} -\theta) = \max \{W_{i}\} -\min \{W_{i}\} .$

Hence the distribution of the range only depends on the distribution of the $W_{i}$ and, thus, it is location-invariant. For the location invariance of other statistics, see Exercise 7.8.4.

Example 7.8.5 (Scale-Invariant Statistics). Consider a random sample $X_{1},\ldots ,X_{n}$ that follows a scale model, i.e., a model of the form

$$
X _ {i} = \theta W _ {i}, \quad i = 1, \dots , n, \tag {7.8.4}
$$

where $\theta > 0$ and $W_{1}, W_{2}, \ldots, W_{n}$ are iid random variables with pdf $f(w)$ , which does not depend on $\theta$ . Then the common pdf of $X_{i}$ is $\theta^{-1} f(x / \theta)$ . We call $\theta$ a scale parameter. Suppose that $Z = u(X_{1}, X_{2}, \ldots, X_{n})$ is a statistic such that

$$
u \left(c x _ {1}, c x _ {2}, \dots , c x _ {n}\right) = u \left(x _ {1}, x _ {2}, \dots , x _ {n}\right)
$$

for all $c > 0$ . Then

$$
Z = u \left(X _ {1}, X _ {2}, \dots , X _ {n}\right) = u \left(\theta W _ {1}, \theta W _ {2}, \dots , \theta W _ {n}\right) = u \left(W _ {1}, W _ {2}, \dots , W _ {n}\right).
$$

Since neither the joint pdf of $W_{1}, W_{2}, \ldots, W_{n}$ nor $Z$ contains $\theta$ , the distribution of $Z$ must not depend upon $\theta$ . We say that $Z$ is a scale-invariant statistic.

The following are some examples of scale-invariant statistics: $X_{1} / (X_{1} + X_{2})$ , $X_{1}^{2} / \sum_{1}^{n}X_{i}^{2}$ , $\min(X_{i}) / \max(X_{i})$ , and so on. The scale invariance of the first statistic follows from

$$
\frac {X _ {1}}{X _ {1} + X _ {2}} = \frac {(\theta X _ {1}) / \theta}{[ (\theta X _ {1}) + (\theta X _ {2}) ] / \theta} = \frac {W _ {1}}{W _ {1} + W _ {2}}.
$$

The scale invariance of the other statistics is asked for in Exercise 7.8.5.

Example 7.8.6 (Location- and Scale-Invariant Statistics). Finally, consider a random sample $X_{1}, X_{2}, \ldots, X_{n}$ that follows a location and scale model as in Example 7.7.5. That is,

$$
X _ {i} = \theta_ {1} + \theta_ {2} W _ {i}, \quad i = 1, \dots , n, \tag {7.8.5}
$$

where $W_{i}$ are iid with the common pdf $f(t)$ which is free of $\theta_{1}$ and $\theta_{2}$ . In this case, the pdf of $X_{i}$ is $\theta_2^{-1}f((x - \theta_1) / \theta_2)$ . Consider the statistic $Z = u(X_{1},X_{2},\ldots ,X_{n})$ , where

$$
u \left(c x _ {1} + d, \dots , c x _ {n} + d\right) = u \left(x _ {1}, \dots , x _ {n}\right).
$$

Then

$$
Z = u \left(X _ {1}, \dots , X _ {n}\right) = u \left(\theta_ {1} + \theta_ {2} W _ {1}, \dots , \theta_ {1} + \theta_ {2} W _ {n}\right) = u \left(W _ {1}, \dots , W _ {n}\right).
$$

Since neither the joint pdf of $W_{1}, \ldots, W_{n}$ nor $Z$ contains $\theta_{1}$ and $\theta_{2}$ , the distribution of $Z$ must not depend upon $\theta_{1}$ nor $\theta_{2}$ . Statistics such as $Z = u(X_{1}, X_{2}, \ldots, X_{n})$ are called location- and scale-invariant statistics. The following are four examples of such statistics:

(a) $T_{1} = [\max (X_{i}) - \min (X_{i})] / S;$   
(b) $T_{2} = \sum_{i = 1}^{n - 1}(X_{i + 1} - X_{i})^{2} / S^{2};$   
(c) $T_{3} = (X_{i} - \overline{X}) / S$ ;   
(d) $T_{4} = |X_{i} - X_{j}| / S_{\cdot \cdot},i\neq j.$

Let $\overline{X} -\theta_{1} = n^{-1}\sum_{i = 1}^{n}(X_{i} - \theta_{1})$ . Then the location and scale invariance of the statistic in (d) follows from the two identities

$$
S ^ {2} = \theta_ {2} ^ {2} \sum_ {i = 1} ^ {n} \left[ \frac {X _ {i} - \theta_ {1}}{\theta_ {2}} - \frac {\overline {{X}} - \theta_ {1}}{\theta_ {2}} \right] ^ {2} = \theta_ {2} ^ {2} \sum_ {i = 1} ^ {n} (W _ {i} - \overline {{W}}) ^ {2}
$$

$$
X _ {i} - X _ {j} = \theta_ {2} \left[ \frac {X _ {i} - \theta_ {1}}{\theta_ {2}} - \frac {X _ {j} - \theta_ {1}}{\theta_ {2}} \right] = \theta_ {2} (W _ {i} - W _ {j}).
$$

See Exercise 7.8.6 for the other statistics.

Thus, these location-invariant, scale-invariant, and location- and scale-invariant statistics provide good illustrations, with the appropriate model for the pdf, of ancillary statistics. Since an ancillary statistic and a complete (minimal) sufficient statistic are such opposites, we might believe that there is, in some sense, no relationship between the two. This is true, and in the next section we show that they are independent statistics.

# EXERCISES

7.8.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from each of the following distributions involving the parameter $\theta$ . In each case find the mle of $\theta$ and show that it is a sufficient statistic for $\theta$ and hence a minimal sufficient statistic.

(a) $b(1,\theta)$ , where $0\leq \theta \leq 1$   
(b) Poisson with mean $\theta > 0$ .   
(c) Gamma with $\alpha = 3$ and $\beta = \theta >0$   
(d) $N(\theta, 1)$ , where $-\infty < \theta < \infty$   
(e) $N(0,\theta)$ , where $0 < \theta < \infty$ .

7.8.2. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from the uniform distribution over the closed interval $[-\theta, \theta]$ having pdf $f(x; \theta) = (1/2\theta) I_{[-\theta, \theta]}(x)$ .

(a) Show that $Y_{1}$ and $Y_{n}$ are joint sufficient statistics for $\theta$   
(b) Argue that the mle of $\theta$ is $\hat{\theta} = \max (-Y_1,Y_n)$   
(c) Demonstrate that the mle $\hat{\theta}$ is a sufficient statistic for $\theta$ and thus is a minimal sufficient statistic for $\theta$ .

7.8.3. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from a distribution with pdf

$$
f (x; \theta_ {1}, \theta_ {2}) = \left(\frac {1}{\theta_ {2}}\right) e ^ {- (x - \theta_ {1}) / \theta_ {2}} I _ {(\theta_ {1}, \infty)} (x),
$$

where $-\infty < \theta_{1} < \infty$ and $0 < \theta_{2} < \infty$ . Find the joint minimal sufficient statistics for $\theta_{1}$ and $\theta_{2}$ .

7.8.4. Continuing with Example 7.8.4, show that the following statistics are location-invariant:

(a) The sample variance $= S^2$ .   
(b) The mean deviation from the sample median $= (1 / n)\sum |X_{i} - \mathrm{median}(X_{i})|$ .   
(c) $(1 / n)\sum [X_i - \min (X_i)]$

7.8.5. In Example 7.8.5, a scale model was presented and scale invariance was defined. Using the notation of this example, show that the following statistics are scale-invariant:

(a) $X_1^2 / \sum_{1}^{n} X_i^2$ .   
(b) $\min \{X_i\} /\max \{X_i\}$

7.8.6. Obtain the location and scale invariance of the other statistics listed in Example 7.8.6, i.e., the statistics

(a) $T_{1} = [\max (X_{i}) - \min (X_{i})] / S.$

(b) $T_{2} = \sum_{i = 1}^{n - 1}(X_{i + 1} - X_{i})^{2} / S^{2}$   
(c) $T_{3} = (X_{i} - \overline{X}) / S.$

7.8.7. With random samples from each of the distributions given in Exercises 7.8.1(d), 7.8.2, and 7.8.3, define at least two ancillary statistics that are different from the examples given in the text. These examples illustrate, respectively, location-invariant, scale-invariant, and location- and scale-invariant statistics.

# 7.9 Sufficiency, Completeness, and Independence

We have noted that if we have a sufficient statistic $Y_{1}$ for a parameter $\theta$ , $\theta \in \Omega$ , then $h(z|y_1)$ , the conditional pdf of another statistic $Z$ , given $Y_{1} = y_{1}$ , does not depend upon $\theta$ . If, moreover, $Y_{1}$ and $Z$ are independent, the pdf $g_{2}(z)$ of $Z$ is such that $g_{2}(z) = h(z|y_{1})$ , and hence $g_{2}(z)$ must not depend upon $\theta$ either. So the independence of a statistic $Z$ and the sufficient statistic $Y_{1}$ for a parameter $\theta$ imply that the distribution of $Z$ does not depend upon $\theta \in \Omega$ . That is, $Z$ is an ancillary statistic.

It is interesting to investigate a converse of that property. Suppose that the distribution of an ancillary statistic $Z$ does not depend upon $\theta$ ; then are $Z$ and the sufficient statistic $Y_{1}$ for $\theta$ independent? To begin our search for the answer, we know that the joint pdf of $Y_{1}$ and $Z$ is $g_{1}(y_{1};\theta)h(z|y_{1})$ , where $g_{1}(y_{1};\theta)$ and $h(z|y_{1})$ represent the marginal pdf of $Y_{1}$ and the conditional pdf of $Z$ given $Y_{1} = y_{1}$ , respectively. Thus the marginal pdf of $Z$ is

$$
\int_ {- \infty} ^ {\infty} g _ {1} (y _ {1}; \theta) h (z | y _ {1}) d y _ {1} = g _ {2} (z),
$$

which, by hypothesis, does not depend upon $\theta$ . Because

$$
\int_ {- \infty} ^ {\infty} g _ {2} (z) g _ {1} (y _ {1}; \theta) d y _ {1} = g _ {2} (z),
$$

if follows, by taking the difference of the last two integrals, that

$$
\int_ {- \infty} ^ {\infty} [ g _ {2} (z) - h (z | y _ {1}) ] g _ {1} (y _ {1}; \theta) d y _ {1} = 0 \tag {7.9.1}
$$

for all $\theta \in \Omega$ . Since $Y_{1}$ is sufficient statistic for $\theta$ , $h(z|y_{1})$ does not depend upon $\theta$ . By assumption, $g_{2}(z)$ and hence $g_{2}(z) - h(z|y_{1})$ do not depend upon $\theta$ . Now if the family $\{g_{1}(y_{1};\theta):\theta \in \Omega\}$ is complete, Equation (7.9.1) would require that

$$
g _ {2} (z) - h (z | y _ {1}) = 0 \quad \text {o r} \quad g _ {2} (z) = h (z | y _ {1}).
$$

That is, the joint pdf of $Y_{1}$ and $Z$ must be equal to

$$
g _ {1} (y _ {1}; \theta) h (z | y _ {1}) = g _ {1} (y _ {1}; \theta) g _ {2} (z).
$$

Accordingly, $Y_{1}$ and $Z$ are independent, and we have proved the following theorem, which was considered in special cases by Neyman and Hogg and proved in general by Basu.

Theorem 7.9.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution having a pdf $f(x; \theta)$ , $\theta \in \Omega$ , where $\Omega$ is an interval set. Suppose that the statistic $Y_{1}$ is a complete and sufficient statistic for $\theta$ . Let $Z = u(X_{1}, X_{2}, \ldots, X_{n})$ be any other statistic (not a function of $Y_{1}$ alone). If the distribution of $Z$ does not depend upon $\theta$ , then $Z$ is independent of the sufficient statistic $Y_{1}$ .

In the discussion above, it is interesting to observe that if $Y_{1}$ is a sufficient statistic for $\theta$ , then the independence of $Y_{1}$ and $Z$ implies that the distribution of $Z$ does not depend upon $\theta$ whether $\{g_{1}(y_{1};\theta):\theta \in \Omega \}$ is or is not complete. Conversely, to prove the independence from the fact that $g_{2}(z)$ does not depend upon $\theta$ , we definitely need the completeness. Accordingly, if we are dealing with situations in which we know that family $\{g_1(y_1;\theta):\theta \in \Omega \}$ is complete (such as a regular case of the exponential class), we can say that the statistic $Z$ is independent of the sufficient statistic $Y_{1}$ if and only if the distribution of $Z$ does not depend upon $\theta$ (i.e., $Z$ is an ancillary statistic).

It should be remarked that the theorem (including the special formulation of it for regular cases of the exponential class) extends immediately to probability density functions that involve $m$ parameters for which there exist $m$ joint sufficient statistics. For example, let $X_{1},X_{2},\ldots ,X_{n}$ be a random sample from a distribution having the pdf $f(x;\theta_1,\theta_2)$ that represents a regular case of the exponential class so that there are two joint complete sufficient statistics for $\theta_{1}$ and $\theta_{2}$ . Then any other statistic $Z = u(X_{1},X_{2},\dots,X_{n})$ is independent of the joint complete sufficient statistics if and only if the distribution of $Z$ does not depend upon $\theta_{1}$ or $\theta_{2}$ .

We present an example of the theorem that provides an alternative proof of the independence of $\overline{X}$ and $S^2$ , the mean and the variance of a random sample of size $n$ from a distribution that is $N(\mu, \sigma^2)$ . This proof is given as if we were unaware that $(n - 1)S^2 / \sigma^2$ is $\chi^2(n - 1)$ , because that fact and the independence were established in Theorem 3.6.1.

Example 7.9.1. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample of size $n$ from a distribution that is $N(\mu, \sigma^2)$ . We know that the mean $\overline{X}$ of the sample is, for every known $\sigma^2$ , a complete sufficient statistic for the parameter $\mu$ , $-\infty < \mu < \infty$ . Consider the statistic

$$
S ^ {2} = \frac {1}{n - 1} \sum_ {i = 1} ^ {n} (X _ {i} - \overline {{X}}) ^ {2},
$$

which is location-invariant. Thus $S^2$ must have a distribution that does not depend upon $\mu$ ; and hence, by the theorem, $S^2$ and $\overline{X}$ , the complete sufficient statistic for $\mu$ , are independent.

Example 7.9.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample of size $n$ from the distribution having pdf

$$
\begin{array}{l} f (x; \theta) = \exp \left\{- (x - \theta) \right\}, \quad \theta <   x <   \infty , \quad - \infty <   \theta <   \infty , \\ = 0 \quad e l s e w h e r e. \\ \end{array}
$$

Here the pdf is of the form $f(x - \theta)$ , where $f(w) = e^{-w}$ , $0 < w < \infty$ , zero elsewhere. Moreover, we know (Exercise 7.4.5) that the first order statistic $Y_{1} = \min(X_{i})$ is a

complete sufficient statistic for $\theta$ . Hence $Y_{1}$ must be independent of each location-invariant statistic $u(X_{1},X_{2},\ldots ,X_{n})$ , enjoying the property that

$$
u \left(x _ {1} + d, x _ {2} + d, \dots , x _ {n} + d\right) = u \left(x _ {1}, x _ {2}, \dots , x _ {n}\right)
$$

for all real $d$ . Illustrations of such statistics are $S^2$ , the sample range, and

$$
\frac {1}{n} \sum_ {i = 1} ^ {n} [ X _ {i} - \min (X _ {i}) ].
$$

Example 7.9.3. Let $X_{1}, X_{2}$ denote a random sample of size $n = 2$ from a distribution with pdf

$$
\begin{array}{l} f (x; \theta) = \frac {1}{\theta} e ^ {- x / \theta}, 0 <   x <   \infty , 0 <   \theta <   \infty , \\ = 0 \quad \text {e l s e w h e r e .} \\ \end{array}
$$

The pdf is of the form $(1 / \theta)f(x / \theta)$ , where $f(w) = e^{-w}$ , $0 < w < \infty$ , zero elsewhere. We know that $Y_{1} = X_{1} + X_{2}$ is a complete sufficient statistic for $\theta$ . Hence, $Y_{1}$ is independent of every scale-invariant statistic $u(X_1,X_2)$ with the property $u(cx_{1},cx_{2}) = u(x_{1},x_{2})$ . Illustrations of these are $X_{1} / X_{2}$ and $X_{1} / (X_{1} + X_{2})$ , statistics that have $F$ - and beta distributions, respectively.

Example 7.9.4. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(\theta_{1}, \theta_{2})$ , $-\infty < \theta_{1} < \infty$ , $0 < \theta_{2} < \infty$ . In Example 7.7.2 it was proved that the mean $\overline{X}$ and the variance $S^{2}$ of the sample are joint complete sufficient statistics for $\theta_{1}$ and $\theta_{2}$ . Consider the statistic

$$
Z = \frac {\sum_ {1} ^ {n - 1} (X _ {i + 1} - X _ {i}) ^ {2}}{\sum_ {1} ^ {n} (X _ {i} - \overline {{X}}) ^ {2}} = u (X _ {1}, X _ {2}, \ldots , X _ {n}),
$$

which satisfies the property that $u(cx_1 + d, \ldots, cx_n + d) = u(x_1, \ldots, x_n)$ . That is, the ancillary statistic $Z$ is independent of both $\overline{X}$ and $S^2$ .

In this section we have given several examples in which the complete sufficient statistics are independent of ancillary statistics. Thus, in those cases, the ancillary statistics provide no information about the parameters. However, if the sufficient statistics are not complete, the ancillary statistics could provide some information as the following example demonstrates.

Example 7.9.5. We refer back to Examples 7.8.1 and 7.8.2. There the first and $n$ th order statistics, $Y_{1}$ and $Y_{n}$ , were minimal sufficient statistics for $\theta$ , where the sample arose from an underlying distribution having pdf $(\frac{1}{2}) I_{(\theta - 1, \theta + 1)}(x)$ . Often $T_{1} = (Y_{1} + Y_{n}) / 2$ is used as an estimator of $\theta$ , as it is a function of those sufficient statistics that is unbiased. Let us find a relationship between $T_{1}$ and the ancillary statistic $T_{2} = Y_{n} - Y_{1}$ .

The joint pdf of $Y_{1}$ and $Y_{n}$ is

$$
g \left(y _ {1}, y _ {n}; \theta\right) = n (n - 1) \left(y _ {n} - y _ {1}\right) ^ {n - 2} / 2 ^ {n}, \quad \theta - 1 <   y _ {1} <   y _ {n} <   \theta + 1,
$$

zero elsewhere. Accordingly, the joint pdf of $T_{1}$ and $T_{2}$ is, since the absolute value of the Jacobian equals 1,

$$
h \left(t _ {1}, t _ {2}; \theta\right) = n (n - 1) t _ {2} ^ {n - 2} / 2 ^ {n}, \quad \theta - 1 + \frac {t _ {2}}{2} <   t _ {1} <   \theta + 1 - \frac {t _ {2}}{2}, \quad 0 <   t _ {2} <   2,
$$

zero elsewhere. Thus the pdf of $T_{2}$ is

$$
h _ {2} \left(t _ {2}; \theta\right) = n (n - 1) t _ {2} ^ {n - 2} \left(2 - t _ {2}\right) / 2 ^ {n}, \quad 0 <   t _ {2} <   2,
$$

zero elsewhere, which, of course, is free of $\theta$ as $T_{2}$ is an ancillary statistic. Thus, the conditional pdf of $T_{1}$ , given $T_{2} = t_{2}$ , is

$$
h _ {1 | 2} (t _ {1} | t _ {2}; \theta) = \frac {1}{2 - t _ {2}}, \quad \theta - 1 + \frac {t _ {2}}{2} <   t _ {1} <   \theta + 1 - \frac {t _ {2}}{2}, \quad 0 <   t _ {2} <   2,
$$

zero elsewhere. Note that this is uniform on the interval $(\theta - 1 + t_2 / 2, \theta + 1 - t_2 / 2)$ ; so the conditional mean and variance of $T_1$ are, respectively,

$$
E (T _ {1} | t _ {2}) = \theta \quad \text {a n d} \quad \operatorname {v a r} (T _ {1} | t _ {2}) = \frac {(2 - t _ {2}) ^ {2}}{1 2}.
$$

Given $T_{2} = t_{2}$ , we know something about the conditional variance of $T_{1}$ . In particular, if that observed value of $T_{2}$ is large (close to 2), then that variance is small and we can place more reliance on the estimator $T_{1}$ . On the other hand, a small value of $t_{2}$ means that we have less confidence in $T_{1}$ as an estimator of $\theta$ . It is extremely interesting to note that this conditional variance does not depend upon the sample size $n$ but only on the given value of $T_{2} = t_{2}$ . As the sample size increases, $T_{2}$ tends to become larger and, in those cases, $T_{1}$ has smaller conditional variance.

While Example 7.9.5 is a special one demonstrating mathematically that an ancillary statistic can provide some help in point estimation, this does actually happen in practice, too. For illustration, we know that if the sample size is large enough, then

$$
T = \frac {\overline {{X}} - \mu}{S / \sqrt {n}}
$$

has an approximate standard normal distribution. Of course, if the sample arises from a normal distribution, $\overline{X}$ and $S$ are independent and $T$ has a $t$ -distribution with $n - 1$ degrees of freedom. Even if the sample arises from a symmetric distribution, $\overline{X}$ and $S$ are uncorrelated and $T$ has an approximate $t$ -distribution and certainly an approximate standard normal distribution with sample sizes around 30 or 40. On the other hand, if the sample arises from a highly skewed distribution (say to the right), then $\overline{X}$ and $S$ are highly correlated and the probability $P(-1.96 < T < 1.96)$ is not necessarily close to 0.95 unless the sample size is extremely large (certainly much greater than 30). Intuitively, one can understand why this correlation exists if

the underlying distribution is highly skewed to the right. While $S$ has a distribution free of $\mu$ (and hence is an ancillary), a large value of $S$ implies a large value of $\overline{X}$ , since the underlying pdf is like the one depicted in Figure 7.9.1. Of course, a small value of $\overline{X}$ (say less than the mode) requires a relatively small value of $S$ . This means that unless $n$ is extremely large, it is risky to say that

$$
\overline {{x}} - \frac {1 . 9 6 s}{\sqrt {n}}, \quad \overline {{x}} + \frac {1 . 9 6 s}{\sqrt {n}}
$$

provides an approximate $95\%$ confidence interval with data from a very skewed distribution. As a matter of fact, the authors have seen situations in which this confidence coefficient is closer to $80\%$ , rather than $95\%$ , with sample sizes of 30 to 40.

![](images/019c7d91ecfdb2705f5ef76e5912a0fc9da4822c4adf7eb8c419bc27fd7c4251.jpg)  
Figure 7.9.1: Graph of a right skewed distribution; see also Exercise 7.9.14.

# EXERCISES

7.9.1. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4}$ denote the order statistics of a random sample of size $n = 4$ from a distribution having pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , zero elsewhere, where $0 < \theta < \infty$ . Argue that the complete sufficient statistic $Y_{4}$ for $\theta$ is independent of each of the statistics $Y_{1} / Y_{4}$ and $(Y_{1} + Y_{2}) / (Y_{3} + Y_{4})$ .   
Hint: Show that the pdf is of the form $(1 / \theta)f(x / \theta)$ , where $f(w) = 1$ , $0 < w < 1$ , zero elsewhere.   
7.9.2. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample from a $N(\theta, \sigma^{2})$ , $-\infty < \theta < \infty$ , distribution. Show that the distribution of $Z = Y_{n} - \overline{X}$ does not depend upon $\theta$ . Thus $\overline{Y} = \sum_{1}^{n} Y_{i} / n$ , a complete sufficient statistic for $\theta$ is independent of $Z$ .   
7.9.3. Let $X_{1}, X_{2}, \ldots, X_{n}$ be iid with the distribution $N(\theta, \sigma^2)$ , $-\infty < \theta < \infty$ . Prove that a necessary and sufficient condition that the statistics $Z = \sum_{1}^{n} a_{i} X_{i}$ and $Y = \sum_{1}^{n} X_{i}$ , a complete sufficient statistic for $\theta$ , are independent is that $\sum_{1}^{n} a_{i} = 0$ .

7.9.4. Let $X$ and $Y$ be random variables such that $E(X^k)$ and $E(Y^k) \neq 0$ exist for $k = 1,2,3,\ldots$ . If the ratio $X / Y$ and its denominator $Y$ are independent, prove that $E[(X / Y)^k] = E(X^k) / E(Y^k), k = 1,2,3,\ldots$ .

Hint: Write $E(X^k) = E[Y^k (X / Y)^k]$ .

7.9.5. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from a distribution that has pdf $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , $0 < \theta < \infty$ , zero elsewhere. Show that the ratio $R = nY_{1} / \sum_{1}^{n}Y_{i}$ and its denominator (a complete sufficient statistic for $\theta$ ) are independent. Use the result of the preceding exercise to determine $E(R^{k})$ , $k = 1, 2, 3, \ldots$ .

7.9.6. Let $X_1, X_2, \ldots, X_5$ be iid with pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere. Show that $(X_1 + X_2) / (X_1 + X_2 + \dots + X_5)$ and its denominator are independent. Hint: The pdf $f(x)$ is a member of $\{f(x; \theta) : 0 < \theta < \infty\}$ , where $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , zero elsewhere.

7.9.7. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample from the normal distribution $N(\theta_1, \theta_2), -\infty < \theta_1 < \infty, 0 < \theta_2 < \infty$ . Show that the joint complete sufficient statistics $\overline{X} = \overline{Y}$ and $S^2$ for $\theta_{1}$ and $\theta_{2}$ are independent of each of $(Y_{n} - \overline{Y}) / S$ and $(Y_{n} - Y_{1}) / S$ .

7.9.8. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample from a distribution with the pdf

$$
f (x; \theta_ {1}, \theta_ {2}) = \frac {1}{\theta_ {2}} \exp \left(- \frac {x - \theta_ {1}}{\theta_ {2}}\right),
$$

$\theta_{1} < x < \infty$ , zero elsewhere, where $-\infty < \theta_{1} < \infty$ , $0 < \theta_{2} < \infty$ . Show that the joint complete sufficient statistics $Y_{1}$ and $\overline{X} = \overline{Y}$ for the parameters $\theta_{1}$ and $\theta_{2}$ are independent of $(Y_{2} - Y_{1}) / \sum_{1}^{n}(Y_{i} - Y_{1})$ .

7.9.9. Let $X_{1}, X_{2}, \ldots, X_{5}$ be a random sample of size $n = 5$ from the normal distribution $N(0, \theta)$ .

(a) Argue that the ratio $R = (X_1^2 + X_2^2) / (X_1^2 + \dots + X_5^2)$ and its denominator $(X_1^2 + \dots + X_5^2)$ are independent.   
(b) Does $5R / 2$ have an $F$ -distribution with 2 and 5 degrees of freedom? Explain your answer.   
(c) Compute $E(R)$ using Exercise 7.9.4.

7.9.10. Referring to Example 7.9.5 of this section, determine $c$ so that

$$
P (- c <   T _ {1} - \theta <   c | T _ {2} = t _ {2}) = 0. 9 5.
$$

Use this result to find a $95\%$ confidence interval for $\theta$ , given $T_{2} = t_{2}$ ; and note how its length is smaller when the range of $t_{2}$ is larger.

7.9.11. Show that $Y = |X|$ is a complete sufficient statistic for $\theta > 0$ , where $X$ has the pdf $f_{X}(x; \theta) = 1 / (2\theta)$ , for $-\theta < x < \theta$ , zero elsewhere. Show that $Y = |X|$ and $Z = \operatorname{sgn}(X)$ are independent.

7.9.12. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample from a $N(\theta, \sigma^2)$ distribution, where $\sigma^2$ is fixed but arbitrary. Then $\overline{Y} = \overline{X}$ is a complete sufficient statistic for $\theta$ . Consider another estimator $T$ of $\theta$ , such as $T = (Y_{i} + Y_{n+1-i}) / 2$ , for $i = 1, 2, \ldots, [n/2]$ , or $T$ could be any weighted average of these latter statistics.

(a) Argue that $T - \overline{X}$ and $\overline{X}$ are independent random variables.   
(b) Show that $\operatorname{Var}(T) = \operatorname{Var}(\overline{X}) + \operatorname{Var}(T - \overline{X})$ .   
(c) Since we know $\operatorname{Var}(\overline{X}) = \sigma^2 / n$ , it might be more efficient to estimate $\operatorname{Var}(T)$ by estimating the $\operatorname{Var}(T - \overline{X})$ by Monte Carlo methods rather than doing that with $\operatorname{Var}(T)$ directly, because $\operatorname{Var}(T) \geq \operatorname{Var}(T - \overline{X})$ . This is often called the Monte Carlo Swindle.

7.9.13. Suppose $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a distribution with pdf $f(x; \theta) = (1/2)\theta^{3}x^{2}e^{-\theta x}$ , $0 < x < \infty$ , zero elsewhere, where $0 < \theta < \infty$ :

(a) Find the mle, $\hat{\theta}$ , of $\theta$ . Is $\hat{\theta}$ unbiased?   
Hint: Find the pdf of $Y = \sum_{1}^{n}X_{i}$ and then compute $E(\hat{\theta})$ .   
(b) Argue that $Y$ is a complete sufficient statistic for $\theta$ .   
(c) Find the MVUE of $\theta$   
(d) Show that $X_{1} / Y$ and $Y$ are independent.   
(e) What is the distribution of $X_{1} / Y$ ?

7.9.14. The pdf depicted in Figure 7.9.1 is given by

$$
f _ {m _ {2}} (x) = e ^ {- x} \left(1 + m _ {2} ^ {- 1} e ^ {- x}\right) ^ {- (m _ {2} + 1)}, - \infty <   x <   \infty , \tag {7.9.2}
$$

where $m_2 > 0$ (the pdf graphed is for $m_2 = 0.1$ ). This is a member of a large family of pdfs, $\log F$ -family, which are useful in survival (lifetime) analysis; see Chapter 3 of Hettmansperger and McKean (2011).

(a) Let $W$ be a random variable with pdf (7.9.2). Show that $W = \log Y$ , where $Y$ has an $F$ -distribution with 2 and $2m_2$ degrees of freedom.   
(b) Show that the pdf becomes the logistic (6.1.8) if $m_2 = 1$   
(c) Consider the location model where

$$
X _ {i} = \theta + W _ {i} \quad i = 1, \ldots , n,
$$

where $W_{1},\ldots ,W_{n}$ are iid with pdf (7.9.2). Similar to the logistic location model, the order statistics are minimal sufficient for this model. Show, similar to Example 6.1.2, that the mle of $\theta$ exists.

This page intentionally left blank


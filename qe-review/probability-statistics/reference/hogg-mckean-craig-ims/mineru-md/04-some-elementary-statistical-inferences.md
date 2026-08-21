---
title: "Some Elementary Statistical Inferences"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: chapter
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Some Elementary Statistical Inferences

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 3 Some Special Distributions](./03-some-special-distributions.md) · [Ch. 5 Consistency and Limiting Distributions →](./05-consistency-and-limiting-distributions.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Chapter 4

# Some Elementary Statistical Inferences

# 4.1 Sampling and Statistics

In Chapter 2, we introduced the concepts of samples and statistics. We continue with this development in this chapter while introducing the main tools of inference: confidence intervals and tests of hypotheses.

In a typical statistical problem, we have a random variable $X$ of interest, but its pdf $f(x)$ or pmf $p(x)$ is not known. Our ignorance about $f(x)$ or $p(x)$ can roughly be classified in one of two ways:

1. $f(x)$ or $p(x)$ is completely unknown.   
2. The form of $f(x)$ or $p(x)$ is known down to a parameter $\theta$ , where $\theta$ may be a vector.

For now, we consider the second classification, although some of our discussion pertains to the first classification also. Some examples are the following:

(a) $X$ has an exponential distribution, $\mathrm{Exp}(\theta)$ , (3.3.6), where $\theta$ is unknown.   
(b) $X$ has a binomial distribution $b(n,p)$ , (3.1.2), where $n$ is known but $p$ is unknown.   
(c) $X$ has a gamma distribution $\Gamma (\alpha ,\beta)$ , (3.3.2), where both $\alpha$ and $\beta$ are unknown.   
(d) $X$ has a normal distribution $N(\mu, \sigma^2)$ , (3.4.6), where both the mean $\mu$ and the variance $\sigma^2$ of $X$ are unknown.

We often denote this problem by saying that the random variable $X$ has a density or mass function of the form $f(x; \theta)$ or $p(x; \theta)$ , where $\theta \in \Omega$ for a specified set $\Omega$ . For example, in (a) above, $\Omega = \{\theta | \theta > 0\}$ . We call $\theta$ a parameter of the distribution. Because $\theta$ is unknown, we want to estimate it.

In this process, our information about the unknown distribution of $X$ or the unknown parameters of the distribution of $X$ comes from a sample on $X$ . The sample observations have the same distribution as $X$ , and we denote them as the random variables $X_{1},X_{2},\ldots ,X_{n}$ , where $n$ denotes the sample size. When the sample is actually drawn, we use lower case letters $x_{1},x_{2},\ldots ,x_{n}$ as the values or realizations of the sample. Often we assume that the sample observations $X_{1},X_{2},\ldots ,X_{n}$ are also mutually independent, in which case we call the sample a random sample, which we now formally define:

Definition 4.1.1. If the random variables $X_{1}, X_{2}, \ldots, X_{n}$ are independent and identically distributed (iid), then these random variables constitute a random sample of size $n$ from the common distribution.

Often, functions of the sample are used to summarize the information in a sample. These are called statistics, which we define as:

Definition 4.1.2. Let $X_1, X_2, \ldots, X_n$ denote a sample on a random variable $X$ . Let $T = T(X_1, X_2, \ldots, X_n)$ be a function of the sample. Then $T$ is called a statistic.

Once the sample is drawn, then $t$ is called the realization of $T$ , where $t = T(x_1, x_2, \ldots, x_n)$ and $x_1, x_2, \ldots, x_n$ is the realization of the sample.

# 4.1.1 Point Estimators

Using the above terminology, the problem we discuss in this chapter is phrased as: Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample on a random variable $X$ with a density or mass function of the form $f(x; \theta)$ or $p(x; \theta)$ , where $\theta \in \Omega$ for a specified set $\Omega$ . In this situation, it makes sense to consider a statistic $T$ , which is an estimator of $\theta$ . More formally, $T$ is called a point estimator of $\theta$ . While we call $T$ an estimator of $\theta$ , we call its realization $t$ an estimate of $\theta$ .

There are several properties of point estimators that we discuss in this book. We begin with a simple one, unbiasedness.

Definition 4.1.3 (Unbiasedness). Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a sample on a random variable $X$ with pdf $f(x; \theta)$ , $\theta \in \Omega$ . Let $T = T(X_{1}, X_{2}, \ldots, X_{n})$ be a statistic. We say that $T$ is an unbiased estimator of $\theta$ if $E(T) = \theta$ .

In Chapters 6 and 7, we discuss several theories of estimation in general. The purpose of this chapter, though, is an introduction to inference, so we briefly discuss the maximum likelihood estimator (MLE) and then use it to obtain point estimators for some of the examples cited above. We expand on this theory in Chapter 6. Our discussion is for the continuous case. For the discrete case, simply replace the pdf with the pmf.

In our problem, the information in the sample and the parameter $\theta$ are involved in the joint distribution of the random sample; i.e., $\prod_{i=1}^{n} f(x_i; \theta)$ . We want to view this as a function of $\theta$ , so we write it as

$$
L (\theta) = L \left(\theta ; x _ {1}, x _ {2}, \dots , x _ {n}\right) = \prod_ {i = 1} ^ {n} f \left(x _ {i}; \theta\right). \tag {4.1.1}
$$

This is called the likelihood function of the random sample. As an estimate of $\theta$ , a measure of the center of $L(\theta)$ seems appropriate. An often-used estimate is the value of $\theta$ that provides a maximum of $L(\theta)$ . If it is unique, this is called the maximum likelihood estimator (MLE), and we denote it as $\widehat{\theta}$ ; i.e.,

$$
\widehat {\theta} = \operatorname {A r g m a x} L (\theta). \tag {4.1.2}
$$

In practice, it is often much easier to work with the log of the likelihood, that is, the function $l(\theta) = \log L(\theta)$ . Because the log is a strictly increasing function, the value that maximizes $l(\theta)$ is the same as the value that maximizes $L(\theta)$ . Furthermore, for most of the models discussed in this book, the pdf (or pmf) is a differentiable function of $\theta$ , and frequently $\widehat{\theta}$ solves the equation

$$
\frac {\partial l (\theta)}{\partial \theta} = 0. \tag {4.1.3}
$$

If $\theta$ is a vector of parameters, this results in a system of equations to be solved simultaneously; see Example 4.1.3. These equations are often referred to as the mle estimating equations, (EE).

As we show in Chapter 6, under general conditions, mles have some good properties. One property that we need at the moment concerns the situation where, besides the parameter $\theta$ , we are also interested in the parameter $\eta = g(\theta)$ for a specified function $g$ . Then, as Theorem 6.1.2 of Chapter 6 shows, the mle of $\eta$ is $\widehat{\eta} = g(\widehat{\theta})$ , where $\widehat{\theta}$ is the mle of $\theta$ . We now proceed with some examples, including data realizations.

Example 4.1.1 (Exponential Distribution). Suppose the common pdf of the random sample $X_{1},X_{2},\ldots ,X_{n}$ is the $\Gamma (1,\theta)$ density $f(x) = \theta^{-1}\exp \{-x / \theta \}$ with support $0 < x < \infty$ ; see expression (3.3.2). This gamma distribution is often called the exponential distribution. The log of the likelihood function is given by

$$
l (\theta) = \log \prod_ {i = 1} ^ {n} \frac {1}{\theta} e ^ {- x _ {i} / \theta} = - n \log \theta - \theta^ {- 1} \sum_ {i = 1} ^ {n} x _ {i}.
$$

The first partial of the log-likelihood with respect to $\theta$ is

$$
\frac {\partial l (\theta)}{\partial \theta} = - n \theta^ {- 1} + \theta^ {- 2} \sum_ {i = 1} ^ {n} x _ {i}.
$$

Setting this partial to 0 and solving for $\theta$ , we obtain the solution $\overline{x}$ . There is only one critical value and, furthermore, the second partial of the log-likelihood evaluated at $\overline{x}$ is strictly negative, verifying that it provides a maximum. Hence, for this example, the statistic $\widehat{\theta} = \overline{X}$ is the mle of $\theta$ . Because $E(X) = \theta$ , we have that $E(\overline{X}) = \theta$ and, hence, $\widehat{\theta}$ is an unbiased estimator of $\theta$ .

Rasmussen (1992), page 92, presents a data set where the variable of interest $X$ is the number of operating hours until the first failure of air-conditioning units for Boeing 720 airplanes. A random sample of size $n = 13$ was obtained and its

realized values are:

359 413 25 130 90 50 50 487 102 194 55 74 97

For instance, 359 hours is the realization of the random variable $X_{1}$ . The data range from 25 to 487 hours. Assuming an exponential model, the point estimate of $\theta$ discussed above is the arithmetic average of this data. Assuming that the data set is stored in the R vector ophrs, this average is computed in R by

mean(ophrs); 163.5385

Hence our point estimate of $\theta$ , the mean of $X$ , is 163.54 hours. How close is 163.54 hours to the true $\theta$ ? We provide an answer to this question in the next section.

Example 4.1.2 (Binomial Distribution). Let $X$ be one or zero if, respectively, the outcome of a Bernoulli experiment is success or failure. Let $\theta$ , $0 < \theta < 1$ , denote the probability of success. Then by (3.1.1), the pmf of $X$ is

$$
p (x; \theta) = \theta^ {x} (1 - \theta) ^ {1 - x}, \quad x = 0 \text {o r} 1.
$$

If $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample on $X$ , then the likelihood function is

$$
L (\theta) = \prod_ {i = 1} ^ {n} p (x _ {i}; \theta) = \theta^ {\sum_ {i = 1} ^ {n} x _ {i}} (1 - \theta) ^ {n - \sum_ {i = 1} ^ {n} x _ {i}}, x _ {i} = 0 \mathrm {o r} 1.
$$

Taking logs, we have

$$
l (\theta) = \sum_ {i = 1} ^ {n} x _ {i} \log \theta + \left(n - \sum_ {i = 1} ^ {n} x _ {i}\right) \log (1 - \theta), \quad x _ {i} = 0 \text {o r} 1.
$$

The partial derivative of $l(\theta)$ is

$$
\frac {\partial l (\theta)}{\partial \theta} = \frac {\sum_ {i = 1} ^ {n} x _ {i}}{\theta} - \frac {n - \sum_ {i = 1} ^ {n} x _ {i}}{1 - \theta}.
$$

Setting this to 0 and solving for $\theta$ , we obtain $\widehat{\theta} = n^{-1}\sum_{i=1}^{n}X_{i} = \overline{X}$ ; i.e., the mle is the proportion of successes in the $n$ trials. Because $E(X) = \theta$ , $\widehat{\theta}$ is an unbiased estimator of $\theta$ .

Devore (2012) discusses a study involving ceramic hip replacements which for some patients can be squeaky; see, also, page 30 of Kloke and McKean (2014). In this study, 28 out of 143 hip replacements squeaked. In terms of the above discussion, we have a realization of a sample of size $n = 143$ from a binomial distribution where success is a hip replacement that squeaks and failure is one that does not squeak. Let $\theta$ denote the probability of success. Then our estimate of $\theta$ based on this sample is $\widehat{\theta} = 28 / 143 = 0.1958$ . This is straightforward to calculate but, for later use, the R code prop.test(28,143) calculates this proportion.

Example 4.1.3 (Normal Distribution). Let $X$ have a $N(\mu, \sigma^2)$ distribution with the pdf given in expression (3.4.6). In this case, $\pmb{\theta}$ is the vector $\pmb{\theta} = (\mu, \sigma)$ . If $X_1, X_2, \ldots, X_n$ is a random sample on $X$ , then the log of the likelihood function simplifies to

$$
l (\mu , \sigma) = - \frac {n}{2} \log 2 \pi - n \log \sigma - \frac {1}{2} \sum_ {i = 1} ^ {n} \left(\frac {x _ {i} - \mu}{\sigma}\right) ^ {2}. \tag {4.1.4}
$$

The two partial derivatives simplify to

$$
\frac {\partial l (\mu , \sigma)}{\partial \mu} = - \sum_ {i = 1} ^ {n} \left(\frac {x _ {i} - \mu}{\sigma}\right) \left(- \frac {1}{\sigma}\right) \tag {4.1.5}
$$

$$
\frac {\partial l (\mu , \sigma)}{\partial \sigma} = - \frac {n}{\sigma} + \frac {1}{\sigma^ {3}} \sum_ {i = 1} ^ {n} (x _ {i} - \mu) ^ {2}. \tag {4.1.6}
$$

Setting these to 0 and solving simultaneously, we see that the mles are

$$
\widehat {\mu} = \bar {X} \tag {4.1.7}
$$

$$
\widehat {\sigma} ^ {2} = n ^ {- 1} \sum_ {i = 1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2}. \tag {4.1.8}
$$

Notice that we have used the property that the mle of $\hat{\sigma}^2$ is the mle of $\sigma$ squared. As we have shown in Chapter 2, (2.8.6), the estimator $\overline{X}$ is an unbiased estimator for $\mu$ . Further, from Example 2.8.7 of Section 2.8 we know that the following statistic

$$
S ^ {2} = \frac {1}{n - 1} \sum_ {i = 1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} \tag {4.1.9}
$$

is an unbiased estimator of $\sigma^2$ . Thus for the mle of $\sigma^2$ , $E(\hat{\sigma}^2) = [n / (n - 1)]\sigma^2$ . Hence, the mle is a biased estimator of $\sigma^2$ . Note, though, that the bias of $\hat{\sigma}^2$ is $E(\hat{\sigma}^2 - \sigma^2) = -\sigma^2 / n$ , which converges to 0 as $n \to \infty$ . In practice, however, $S^2$ is the preferred estimator of $\sigma^2$ .

Rasmussen (1991), page 65, discusses a study to measure the concentration of sulfur dioxide in a damaged Bavarian forest. The following data set is the realization of a random sample of size $n = 24$ measurements (micro grams per cubic meter) of this sulfur dioxide concentration:

33.4 38.6 41.7 43.9 44.4 45.3 46.1 47.6 50.0 52.4 52.7 53.9

54.3 55.1 56.4 56.5 60.7 61.8 62.2 63.4 65.5 66.6 70.0 71.5.

These data are also in the R data file sulfurdio.rda at the site listed in the Preface. Assuming these data are in the R vector sulfurdioxide, the following R segment obtains the estimates of the true mean and variance (both $s^2$ and $\widehat{\sigma}^2$ are computed):

mean(sulfur dioxide);var(sulfur dioxide);(23/24)*var(sulfur dioxide) 53.91667 101.4797 97.25139.

Hence, we estimate the true mean concentration of sulfur dioxide in this damaged Bavarian forest to be 53.92 micro grams per cubic meter. The realization of the statistic $S^2$ is $s^2 = 101.48$ , while the biased estimate of $\sigma^2$ is 97.25. Rasmussen notes that the average concentration of sulfur dioxide in undamaged areas of Bavaria is 20 micro grams per cubic meter. This value appears to be quite distant from the sample values. This will be discussed statistically in later sections.

In all three of these examples, standard differential calculus methods led us to the solution. For the next example, the support of the random variable involves $\theta$ and, hence, it is not surprising that for this case differential calculus is not useful.

Example 4.1.4 (Uniform Distribution). Let $X_{1}, \ldots, X_{n}$ be iid with the uniform $(0, \theta)$ density; i.e., $f(x) = 1 / \theta$ for $0 < x < \theta$ , 0 elsewhere. Because $\theta$ is in the support, differentiation is not helpful here. The likelihood function can be written as

$$
L (\theta) = \theta^ {- n} I (\max  \{x _ {i} \}, \theta),
$$

where $I(a, b)$ is 1 or 0 if $a \leq b$ or $a > b$ , respectively. The function $L(\theta)$ is a decreasing function of $\theta$ for all $\theta \geq \max\{x_i\}$ and is 0 otherwise [sketch the graph of $L(\theta)$ ]. So the maximum occurs at the smallest value that $\theta$ can assume; i.e., the mle is $\widehat{\theta} = \max\{X_i\}$ .

# 4.1.2 Histogram Estimates of pmfs and pdfs

Let $X_{1}, \ldots, X_{n}$ be a random sample on a random variable $X$ with cdf $F(x)$ . In this section, we briefly discuss a histogram of the sample, which is an estimate of the pmf, $p(x)$ , or the pdf, $f(x)$ , of $X$ depending on whether $X$ is discrete or continuous. Other than $X$ being a discrete or continuous random variable, we make no assumptions on the form of the distribution of $X$ . In particular, we do not assume a parametric form of the distribution as we did for the above discussion on maximum likelihood estimates; hence, the histogram that we present is often called a nonparametric estimator. See Chapter 10 for a general discussion of nonparametric inference. We discuss the discrete situation first.

# The Distribution of $X$ Is Discrete

Assume that $X$ is a discrete random variable with pmf $p(x)$ . Let $X_{1},\ldots ,X_{n}$ be a random sample on $X$ . First, suppose that the space of $X$ is finite, say, $\mathcal{D} = \{a_1,\dots ,a_m\}$ . An intuitive estimate of $p(a_j)$ is the relative frequency of $a_{j}$ in the sample. We express this more formally as follows. For $j = 1,2,\ldots ,m$ , define the statistics

$$
I _ {j} (X _ {i}) = \left\{ \begin{array}{l l} 1 & X _ {i} = a _ {j} \\ 0 & X _ {i} \neq a _ {j}. \end{array} \right.
$$

Then our intuitive estimate of $p(a_{j})$ can be expressed by the sample average

$$
\widehat {p} \left(a _ {j}\right) = \frac {1}{n} \sum_ {i = 1} ^ {n} I _ {j} \left(X _ {i}\right). \tag {4.1.10}
$$

These estimators $\{\widehat{p}(a_1), \ldots, \widehat{p}(a_m)\}$ constitute the nonparametric estimate of the pmf $p(x)$ . Note that $I_j(X_i)$ has a Bernoulli distribution with probability of success $p(a_j)$ . Because

$$
E [ \widehat {p} (a _ {j}) ] = \frac {1}{n} \sum_ {i = 1} ^ {n} E [ I _ {j} (X _ {i}) ] = \frac {1}{n} \sum_ {i = 1} ^ {n} p (a _ {j}) = p (a _ {j}), \tag {4.1.11}
$$

$\widehat{p}(a_j)$ is an unbiased estimator of $p(a_j)$ .

Next, suppose that the space of $X$ is infinite, say, $\mathcal{D} = \{a_1, a_2, \ldots\}$ . In practice, we select a value, say, $a_m$ , and make the groupings

$$
\left\{a _ {1} \right\}, \left\{a _ {2} \right\}, \dots , \left\{a _ {m} \right\}, \tilde {a} _ {m + 1} = \left\{a _ {m + 1}, a _ {m + 2}, \dots \right\}. \tag {4.1.12}
$$

Let $\widehat{p}(\tilde{a}_{m+1})$ be the proportion of sample items that are greater than or equal to $a_{m+1}$ . Then the estimates $\{\widehat{p}(a_1), \ldots, \widehat{p}(a_m), \widehat{p}(\tilde{a}_{m+1})\}$ form our estimate of $p(x)$ . For the merging of groups, a rule of thumb is to select $m$ so that the frequency of the category $a_m$ exceeds twice the combined frequencies of the categories $a_{m+1}, a_{m+2}, \ldots$ .

A histogram is a barplot of $\widehat{p}(a_j)$ versus $a_j$ . There are two cases to consider. For the first case, suppose the values $a_j$ represent qualitative categories, for example, hair colors of a population of people. In this case, there is no ordinal information in the $a_j$ s. The usual histogram for such data consists of nonabutting bars with heights $\widehat{p}(a_j)$ that are plotted in decreasing order of the $\widehat{p}(a_1)$ s. Such histograms are usually called bar charts. An example is helpful here.

Example 4.1.5 (Hair Color of Scottish School Children). Kendall and Sturat (1979) present data on the eye and hair color of Scottish schoolchildren in the early 1900s. The data are also in the file scotteyehair.rda at the site listed in the Preface. In this example, we consider hair color. The discrete random variable is the hair color of a Scottish child with categories fair, red, medium, dark, and black. The results that Kendall and Sturat present are based on a sample of $n = 22,361$ Scottish school children. The frequency distribution of this sample and the estimate of the pmf are

<table><tr><td></td><td>Fair</td><td>Red</td><td>Medium</td><td>Dark</td><td>Black</td></tr><tr><td>Count</td><td>5789</td><td>1319</td><td>9418</td><td>5678</td><td>157</td></tr><tr><td>p(aj)</td><td>0.259</td><td>0.059</td><td>0.421</td><td>0.254</td><td>0.007</td></tr></table>

The bar chart of this sample is shown in Figure 4.1.1. Assume that the counts (second row of the table) are in the R vector vec. Then the following R segment computes this bar chart:

n=sum( vec); vecs = sort vec, decreasing=T)/n

nms = c("Medium","Fair","Dark","Red","Black")

barplot(vecs, beside = TRUE, names(arg=nms, ylab="", xlab="Haircolor")

For the second case, assume that the values in the space $\mathcal{D}$ are ordinal in nature; i.e., the natural ordering of the $a_{j}$ s is numerically meaningful. In this case, the usual histogram is an abutting bar chart with heights $\widehat{p}(a_j)$ that are plotted in the natural order of the $a_{j}$ s, as in the following example.

Example 4.1.6 (Simulated Poisson variates). The following 30 data points are simulated values drawn from a Poisson distribution with mean $\lambda = 2$ ; see Example 4.8.2 for the generation of Poisson variates.

<table><tr><td>2</td><td>1</td><td>1</td><td>1</td><td>1</td><td>5</td><td>1</td><td>1</td><td>3</td><td>0</td><td>2</td><td>1</td><td>1</td><td>3</td><td>4</td></tr><tr><td>2</td><td>1</td><td>2</td><td>2</td><td>6</td><td>5</td><td>2</td><td>3</td><td>2</td><td>4</td><td>1</td><td>3</td><td>1</td><td>3</td><td>0</td></tr></table>

![](images/901919d3214485e1ab8a47f30880d99bff8e092132054beda476e8db1a2637a4.jpg)  
Bar Chart of Haircolor of Scottish Schoolchildren   
Figure 4.1.1: Bar chart of the Scottish hair color data discussed in Example 4.1.5.

The nonparametric estimate of the pmf is

<table><tr><td>j</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>≥6</td></tr><tr><td>p(j)</td><td>0.067</td><td>0.367</td><td>0.233</td><td>0.167</td><td>0.067</td><td>0.067</td><td>0.033</td></tr></table>

The histogram for this data set is given in Figure 4.1.2. Note that counts are used for the vertical axis. If the R vector $\mathbf{x}$ contains the 30 data points, then the following R code computes this histogram:

brs=seq(-.5,6.5,1); hist(x,breaks=brs,xlab="Number of events",ylab="")

# The Distribution of $X$ Is Continuous

For this section, assume that the random sample $X_{1},\ldots ,X_{n}$ is from a continuous random variable $X$ with continuous pdf $f(t)$ . We first sketch an estimate for this pdf at a specified value of $x$ . Then we use this estimate to develop a histogram estimate of the pdf. For an arbitrary but fixed point $x$ and a given $h > 0$ , consider the interval $(x - h,x + h)$ . By the mean value theorem for integrals, we have for some $\xi$ , $|x - \xi | < h$ , that

$$
P (x - h <   X <   x + h) = \int_ {x - h} ^ {x + h} f (t) d t = f (\xi) 2 h \approx f (x) 2 h.
$$

The nonparametric estimate of the leftside is the proportion of the sample items that fall in the interval $(x - h, x + h)$ . This suggests the following nonparametric

![](images/824437d8fa4194a68d784027fe56e334952406578dc5805bf5287d9f7a932670.jpg)  
Histogram of Poisson variates   
Figure 4.1.2: Histogram of the Poisson variates of Example 4.1.6.

estimate of $f(x)$ at a given $x$ :

$$
\widehat {f} (x) = \frac {\# \left\{x - h <   X _ {i} <   x + h \right\}}{2 h n}. \tag {4.1.13}
$$

To write this more formally, consider the indicator statistic

$$
I _ {i} (x) = \left\{ \begin{array}{l l} 1 & x - h <   X _ {i} <   x + h \\ 0 & \text {o t h e r w i s e ,} \end{array} \right. \quad i = 1, \ldots , n.
$$

Then a nonparametric estimator of $f(x)$ is

$$
\widehat {f} (x) = \frac {1}{2 h n} \sum_ {i = 1} ^ {n} I _ {i} (x). \tag {4.1.14}
$$

Since the sample items are identically distributed,

$$
E [ \widehat {f} (x) ] = \frac {1}{2 h n} n f (\xi) 2 h = f (\xi) \rightarrow f (x),
$$

as $h \to 0$ . Hence $\widehat{f}(x)$ is approximately an unbiased estimator of the density $f(x)$ . In density estimation terminology, the indicator function $I_{i}$ is called a rectangular kernel with bandwidth $2h$ . See Sheather and Jones (1991) and Chapter 6 of Lehmann (1999) for discussions of density estimation. The R function density provides a density estimator with several options. For the examples in the text, we use the default option as in Example 4.1.7.

The histogram provides a somewhat crude but often used estimator of the pdf, so a few remarks on it are pertinent. Let $x_{1},\ldots ,x_{n}$ be the realized values of the random sample on a continuous random variable $X$ with pdf $f(x)$ . Our histogram estimate of $f(x)$ is obtained as follows. While for the discrete case, there are natural classes for the histogram, for the continuous case these classes must be chosen. One way of doing this is to select a positive integer $m$ , an $h > 0$ , and a value $a$ such that $a < \min x_{i}$ , so that the $m$ intervals

$$
(a - h, a + h ], (a + h, a + 3 h ], (a + 3 h, a + 5 h ], \dots , (a + (2 m - 3) h, a + (2 m - 1) h ] \tag {4.1.15}
$$

cover the range of the sample $[\min x_i, \max x_i]$ . These intervals form our classes. Let $A_j = (a + (2j - 3)h, a + (2j - 1)h]$ for $j = 1, \ldots, m$ .

Let $\widehat{f}_h(x)$ denote our histogram estimate. If $x \leq a - h$ or $x > a + (2m - 1)h$ then define $\widehat{f}_h(x) = 0$ . For $a - h < x \leq a + (2m - 1)h$ , $x$ is in one, and only one, $A_j$ . For $x \in A_j$ , define $\widehat{f}_h(x)$ to be:

$$
\widehat {f} _ {h} (x) = \frac {\# \left\{x _ {i} \in A _ {j} \right\}}{2 h n}. \tag {4.1.16}
$$

Note that $\widehat{f}_h(x) \geq 0$ and that

$$
\begin{array}{l} \int_ {- \infty} ^ {\infty} \widehat {f} _ {h} (x) d x = \int_ {a - h} ^ {a + (2 m - 1) h} \widehat {f} _ {h} (x) d x = \sum_ {j = 1} ^ {m} \int_ {A _ {j}} \frac {\# \{x _ {i} \in A _ {j} \}}{2 h n} d x \\ = \frac {1}{2 h n} \sum_ {j = 1} ^ {m} \# \left\{x _ {i} \in A _ {j} \right\} [ h (2 j - 1 - 2 j + 3) ] = \frac {2 h}{2 h n} n = 1; \\ \end{array}
$$

so, $\widehat{f}_h(x)$ satisfies the properties of a pdf.

For the discrete case, except when classes are merged, the histogram is unique. For the continuous case, though, the histogram depends on the classes chosen. The resulting picture can be quite different if the classes are changed. Unless there is a compelling reason for the class selection, we recommend using the default classes selected by the computational algorithm. The histogram algorithms in most statistical packages such as R are current on recent research for selection of classes. The histogram in the following example is based on default classes.

Example 4.1.7. In Example 4.1.3, we presented a data set involving sulfur dioxide concentrations in a damaged Bavarian forest. The histogram of this data set is found in Figure 4.1.3. There are only 24 data points in the sample which are far too few for density estimation. With this in mind, although the distribution of data is mound shaped, the center appears to be too flat for normality. We have overlaid the histogram with the default R density estimate (solid line) which confirms some caution on normality. Recall that sample mean and standard deviations for this data are 53.91667 and 10.07371, respectively. So we also plotted the normal pdf with this mean and standard deviation (dashed line). The R code assumes that the data are in the R vector sulfurdioxide.

hist(sulfur dioxide,xlab="Sulfur dioxide",ylab=" ",pr=T,ylim=c(0,.04))

lines(density(sulfur dioxide))

y=dnorm(sulfur dioxide,53.91667,10.07371);lines(y~sulfur dioxide,lty=2)

The normal density plot seems to be a poor fit.

![](images/e5851e5e4041e7d018d7f884cd473fb7b4355a5e29c27589090fa6afb1a84135.jpg)  
Figure 4.1.3: Histogram of the sulfur dioxide concentrations in a damaged Bavarian forest overlaid with a density estimate (solid line) and a normal pdf (dashed line) with mean and variance replaced by the sample mean and standard deviations, respectively. Data are given in Example 4.1.3.

# EXERCISES

4.1.1. Twenty motors were put on test under a high-temperature setting. The lifetimes in hours of the motors under these conditions are given below. Also, the data are in the file lifelongemotor.rda at the site listed in the Preface. Suppose we assume that the lifetime of a motor under these conditions, $X$ , has a $\Gamma(1,\theta)$ distribution.

<table><tr><td>1</td><td>4</td><td>5</td><td>21</td><td>22</td><td>28</td><td>40</td><td>42</td><td>51</td><td>53</td></tr><tr><td>58</td><td>67</td><td>95</td><td>124</td><td>124</td><td>160</td><td>202</td><td>260</td><td>303</td><td>363</td></tr></table>

(a) Obtain a histogram of the data and overlay it with a density estimate, using the code hist(x,pr=T); lines(density(x)) where the R vector x contains the data. Based on this plot, do you think that the $\Gamma(1,\theta)$ model is credible?   
(b) Assuming a $\Gamma(1, \theta)$ model, obtain the maximum likelihood estimate $\widehat{\theta}$ of $\theta$ and locate it on your histogram. Next overlay the pdf of a $\Gamma(1, \widehat{\theta})$ distribution on

the histogram. Use the R function dgamma(x, shape=1, scale=0) to evaluate the pdf.

(c) Obtain the sample median of the data, which is an estimate of the median lifetime of a motor. What parameter is it estimating (i.e., determine the median of $X$ )?   
(d) Based on the mle, what is another estimate of the median of $X$ ?

4.1.2. Here are the weights of 26 professional baseball pitchers; [see page 76 of Hettmansperger and McKean (2011) for the complete data set]. The data are in R file bb.rda. Suppose we assume that the weight of a professional baseball pitcher is normally distributed with mean $\mu$ and variance $\sigma^2$ .

<table><tr><td>160</td><td>175</td><td>180</td><td>185</td><td>185</td><td>185</td><td>190</td><td>190</td><td>195</td><td>195</td><td>195</td><td>200</td><td>200</td></tr><tr><td>200</td><td>200</td><td>205</td><td>205</td><td>210</td><td>210</td><td>218</td><td>219</td><td>220</td><td>222</td><td>225</td><td>225</td><td>232</td></tr></table>

(a) Obtain a histogram of the data. Based on this plot, is a normal probability model credible?   
(b) Obtain the maximum likelihood estimates of $\mu$ , $\sigma^2$ , $\sigma$ , and $\mu/\sigma$ . Locate your estimate of $\mu$ on your plot in part (a). Then overlay the normal pdf with these estimates on your histogram in Part (a).   
(c) Using the binomial model, obtain the maximum likelihood estimate of the proportion $p$ of professional baseball pitchers who weigh over 215 pounds.   
(d) Determine the mle of $p$ assuming that the weight of a professional baseball player follows the normal probability model $N(\mu, \sigma^2)$ with $\mu$ and $\sigma$ unknown.

4.1.3. Suppose the number of customers $X$ that enter a store between the hours 9:00 a.m. and 10:00 a.m. follows a Poisson distribution with parameter $\theta$ . Suppose a random sample of the number of customers that enter the store between 9:00 a.m. and 10:00 a.m. for 10 days results in the values

<table><tr><td>9</td><td>7</td><td>9</td><td>15</td><td>10</td><td>13</td><td>11</td><td>7</td><td>2</td><td>12</td></tr></table>

(a) Determine the maximum likelihood estimate of $\theta$ . Show that it is an unbiased estimator.   
(b) Based on these data, obtain the realization of your estimator in part (a). Explain the meaning of this estimate in terms of the number of customers.

4.1.4. For Example 4.1.3, verify equations (4.1.4)-(4.1.8).   
4.1.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a continuous-type distribution.   
(a) Find $P(X_{1}\leq X_{2}),P(X_{1}\leq X_{2},X_{1}\leq X_{3}),\ldots ,P(X_{1}\leq X_{i},i = 2,3,\ldots ,n).$

(b) Suppose the sampling continues until $X_{1}$ is no longer the smallest observation (i.e., $X_{j} < X_{1} \leq X_{i}, i = 2,3,\ldots ,j - 1$ ). Let $Y$ equal the number of trials, not including $X_{1}$ , until $X_{1}$ is no longer the smallest observation (i.e., $Y = j - 1$ ). Show that the distribution of $Y$ is

$$
P (Y = y) = \frac {1}{y (y + 1)}, \quad y = 1, 2, 3, \dots .
$$

(c) Compute the mean and variance of $Y$ if they exist.

4.1.6. Consider the estimator of the pmf in expression (4.1.10). In equation (4.1.11), we showed that this estimator is unbiased. Find the variance of the estimator and its mgf.

4.1.7. The data set on Scottish schoolchildren discussed in Example 4.1.5 included the eye colors of the children also. The frequencies of their eye colors are

<table><tr><td>Blue</td><td>Light</td><td>Medium</td><td>Dark</td></tr><tr><td>2978</td><td>6697</td><td>7511</td><td>5175</td></tr></table>

Use these frequencies to obtain a bar chart and an estimate of the associated pmf.

4.1.8. Recall that for the parameter $\eta = g(\theta)$ , the mle of $\eta$ is $g(\widehat{\theta})$ , where $\widehat{\theta}$ is the mle of $\theta$ . Assuming that the data in Example 4.1.6 were drawn from a Poisson distribution with mean $\lambda$ , obtain the mle of $\lambda$ and then use it to obtain the mle of the pmf. Compare the mle of the pmf to the nonparametric estimate. Note: For the domain value 6, obtain the mle of $P(X \geq 6)$ .

4.1.9. Consider the nonparametric estimator, (4.1.14), of a pdf.

(a) Obtain its mean and determine the bias of the estimator.   
(b) Obtain the variance of the estimator.

4.1.10. This data set was downloaded from the site http://lib.stat.cmu.edu/DASL/ at Carnegie-Melon university. The original source is Willerman et al. (1991). The data consist of a sample of brain information recorded on 40 college students. The variables include gender, height, weight, three IQ measurements, and Magnetic Resonance Imaging (MRI) counts, as a determination of brain size. The data are in the rda file braindata.rda at the sites referenced in the Preface. For this exercise, consider the MRI counts.

(a) Load the rda file braindata.rda and print the MRI data, using the code:  
[ \text{mri} < -\text{braindata}[7]; \text{print}(\text{mri}) ]   
(b) Obtain a histogram of the data, hist(mri,pr=T). Comment on the shape.   
(c) Overlay the default density estimator, lines(density(mri)). Comment on the shape.

(d) Obtain the sample mean and standard deviation and on the histogram overlay the normal pdf with these estimates as parameters, using mris = sort(mri) and lines(dnorm(mris, mean(mris), sd(mris)) ~ mris, lty=2). Comment on the fit.   
(e) Determine the proportions of the data within 1 and 2 standard deviations of the sample mean and compare these with the empirical rule.

4.1.11. This is a famous data set on the speed of light recorded by the scientist Simon Newcomb. The data set was obtained at the Carnegie Melon site given in Exercise 4.1.10 and it can also be found in the rda file speedlight.rda at the sites referenced in the Preface. Stigler (1977) presents an informative discussion of this data set.

(a) Load the rda file and type the command print(speed). As Stigler notes, the data values $\times 10^{-3} + 24.8$ are Newcomb's data values; hence, negative items can occur. Also, in the unit of the data the "true value" is 33.02. Discuss the data.   
(b) Obtain a histogram of the data. Comment on the shape.   
(c) On the histogram overlay the default density estimator. Comment on the shape.   
(d) Obtain the sample mean and standard deviation and on the histogram overlay the normal pdf with these estimates as parameters. Comment on the fit.   
(e) Determine the proportions of the data within 1 and 2 standard deviations of the sample mean and compare these with the empirical rule.

# 4.2 Confidence Intervals

Let us continue with the statistical problem that we were discussing in Section 4.1. Recall that the random variable of interest $X$ has density $f(x; \theta), \theta \in \Omega$ , where $\theta$ is unknown. In that section, we discussed estimating $\theta$ by a statistic $\widehat{\theta} = \widehat{\theta}(X_1, \ldots, X_n)$ , where $X_1, \ldots, X_n$ is a sample from the distribution of $X$ . When the sample is drawn, it is unlikely that the value of $\widehat{\theta}$ is the true value of the parameter. In fact, if $\widehat{\theta}$ has a continuous distribution, then $P_{\theta}(\widehat{\theta} = \theta) = 0$ , where the notation $P_{\theta}$ denotes that the probability is computed when $\theta$ is the true parameter. What is needed is an estimate of the error of the estimation; i.e., by how much did $\widehat{\theta}$ miss $\theta$ ? In this section, we embody this estimate of error in terms of a confidence interval, which we now formally define:

Definition 4.2.1 (Confidence Interval). Let $X_{1}, X_{2}, \ldots, X_{n}$ be a sample on a random variable $X$ , where $X$ has pdf $f(x; \theta)$ , $\theta \in \Omega$ . Let $0 < \alpha < 1$ be specified. Let $L = L(X_{1}, X_{2}, \ldots, X_{n})$ and $U = U(X_{1}, X_{2}, \ldots, X_{n})$ be two statistics. We say that the interval $(L, U)$ is a $(1 - \alpha)100\%$ confidence interval for $\theta$ if

$$
1 - \alpha = P _ {\theta} [ \theta \in (L, U) ]. \tag {4.2.1}
$$

That is, the probability that the interval includes $\theta$ is $1 - \alpha$ , which is called the confidence coefficient or the confidence level of the interval.

Once the sample is drawn, the realized value of the confidence interval is $(l,u)$ , an interval of real numbers. Either the interval $(l,u)$ traps $\theta$ or it does not. One way of thinking of a confidence interval is in terms of a Bernoulli trial with probability of success $1 - \alpha$ . If one makes, say, $M$ independent $(1 - \alpha)100\%$ confidence intervals over a period of time, then one would expect to have $(1 - \alpha)M$ successful confidence intervals (those that trap $\theta$ ) over this period of time. Hence one feels $(1 - \alpha)100\%$ confident that the true value of $\theta$ lies in the interval $(l,u)$ .

A measure of efficiency based on a confidence interval is its expected length. Suppose $(L_1, U_1)$ and $(L_2, U_2)$ are two confidence intervals for $\theta$ that have the same confidence coefficient. Then we say that $(L_1, U_1)$ is more efficient than $(L_2, U_2)$ if $E_{\theta}(U_1 - L_1) \leq E_{\theta}(U_2 - L_2)$ for all $\theta \in \Omega$ .

There are several procedures for obtaining confidence intervals. We explore one of them in this section. It is based on a pivot random variable. The pivot is usually a function of an estimator of $\theta$ and the parameter and, further, the distribution of the pivot is known. Using this information, an algebraic derivation can often be used to obtain a confidence interval. The next several examples illustrate the pivot method. A second way to obtain a confidence interval involves distribution free techniques, as used in Section 4.4.2 to determine confidence intervals for quantiles.

Example 4.2.1 (Confidence Interval for $\mu$ Under Normality). Suppose the random variables $X_{1},\ldots ,X_{n}$ are a random sample from a $N(\mu ,\sigma^2)$ distribution. Let $\overline{X}$ and $S^2$ denote the sample mean and sample variance, respectively. Recall from the last section that $\overline{X}$ is the mle of $\mu$ and $[(n - 1) / n]S^2$ is the mle of $\sigma^2$ . By part (d) of Theorem 3.6.1, the random variable $T = (\overline{X} -\mu) / (S / \sqrt{n})$ has a $t$ -distribution with $n - 1$ degrees of freedom. The random variable $T$ is our pivot variable.

For $0 < \alpha < 1$ , define $t_{\alpha /2,n - 1}$ to be the upper $\alpha /2$ critical point of a $t$ -distribution with $n - 1$ degrees of freedom; i.e., $\alpha /2 = P(T > t_{\alpha /2,n - 1})$ . Using a simple algebraic derivation, we obtain

$$
\begin{array}{l} 1 - \alpha = P (- t _ {\alpha / 2, n - 1} <   T <   t _ {\alpha / 2, n - 1}) \\ = P _ {\mu} \left(- t _ {\alpha / 2, n - 1} <   \frac {\bar {X} - \mu}{S / \sqrt {n}} <   t _ {\alpha / 2, n - 1}\right) \\ = P _ {\mu} \left(- t _ {\alpha / 2, n - 1} \frac {S}{\sqrt {n}} <   \bar {X} - \mu <   t _ {\alpha / 2, n - 1} \frac {S}{\sqrt {n}}\right) \\ = P _ {\mu} \left(\bar {X} - t _ {\alpha / 2, n - 1} \frac {S}{\sqrt {n}} <   \mu <   \bar {X} + t _ {\alpha / 2, n - 1} \frac {S}{\sqrt {n}}\right). \tag {4.2.2} \\ \end{array}
$$

Once the sample is drawn, let $\overline{x}$ and $s$ denote the realized values of the statistics $\overline{X}$ and $S$ , respectively. Then a $(1 - \alpha)100\%$ confidence interval for $\mu$ is given by

$$
\left(\bar {x} - t _ {\alpha / 2, n - 1} s / \sqrt {n}, \bar {x} + t _ {\alpha / 2, n - 1} s / \sqrt {n}\right). \tag {4.2.3}
$$

This interval is often referred to as the $(1 - \alpha)100\%$ $t$ -interval for $\mu$ . The estimate of the standard deviation of $\overline{X}$ , $s / \sqrt{n}$ , is referred to as the standard error of $\overline{X}$ .

In Example 4.1.3, we presented a data set on sulfur dioxide concentrations in a damaged Bavarian forest. Let $\mu$ denote the true mean sulfur dioxide concentration. Recall, based on the data, that our estimate of $\mu$ is $\overline{x} = 53.92$ with sample standard deviation $s = \sqrt{101.48} = 10.07$ . Since the sample size is $n = 24$ , for a $99\%$ confidence interval the $t$ -critical value is $t_{0.005,23} = \mathrm{qt}(.995,23) = 2.807$ . Based on these values, the confidence interval in expression (4.2.3) can be calculated. Assuming that the R vector sulfurdioxide contains the sample, the R code to compute this interval is t.test(sulfurdioxide, conf.level=0.99), which results in the $99\%$ confidence interval (48.14, 59.69). Many scientists write this interval as $53.92 \pm 5.78$ . In this way, we can see our estimate of $\mu$ and the margin of error.

The distribution of the pivot random variable $T = (\overline{X} - \mu) / (s / \sqrt{n})$ of the last example depends on the normality of the sampled items; however, this is approximately true even if the sampled items are not drawn from a normal distribution. The Central Limit Theorem (CLT) shows that the distribution of $T$ is approximately $N(0,1)$ . In order to use this result now, we state the CLT now, leaving its proof to Chapter 5; see Theorem 5.3.1.

Theorem 4.2.1 (Central Limit Theorem). Let $X_{1}, X_{2}, \ldots, X_{n}$ denote the observations of a random sample from a distribution that has mean $\mu$ and finite variance $\sigma^2$ . Then the distribution function of the random variable $W_{n} = (\overline{X} - \mu) / (\sigma / \sqrt{n})$ converges to $\Phi$ , the distribution function of the $N(0,1)$ distribution, as $n \to \infty$ .

As we further show in Chapter 5, the result stays the same if we replace $\sigma$ by the sample standard deviation $S$ ; that is, under the assumptions of Theorem 4.2.1, the distribution of

$$
Z _ {n} = \frac {\bar {X} - \mu}{S / \sqrt {n}} \tag {4.2.4}
$$

is approximately $N(0,1)$ . For the nonnormal case, as the next example shows, with this result we can obtain an approximate confidence interval for $\mu$ .

Example 4.2.2 (Large Sample Confidence Interval for the Mean $\mu$ ). Suppose $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample on a random variable $X$ with mean $\mu$ and variance $\sigma^2$ , but, unlike the last example, the distribution of $X$ is not normal. However, from the above discussion we know that the distribution of $Z_{n}$ , (4.2.4), is approximately $N(0,1)$ . Hence

$$
1 - \alpha \approx P _ {\mu} \left(- z _ {\alpha / 2} <   \frac {\overline {{X}} - \mu}{S / \sqrt {n}} <   z _ {\alpha / 2}\right).
$$

Using the same algebraic derivation as in the last example, we obtain

$$
1 - \alpha \approx P _ {\mu} \left(\bar {X} - z _ {\alpha / 2} \frac {S}{\sqrt {n}} <   \mu <   \bar {X} + z _ {\alpha / 2} \frac {S}{\sqrt {n}}\right). \tag {4.2.5}
$$

Again, letting $\overline{x}$ and $s$ denote the realized values of the statistics $\overline{X}$ and $S$ , respectively, after the sample is drawn, an approximate $(1 - \alpha)100\%$ confidence interval for $\mu$ is given by

$$
\left(\bar {x} - z _ {\alpha / 2} s / \sqrt {n}, \bar {x} + z _ {\alpha / 2} s / \sqrt {n}\right). \tag {4.2.6}
$$

This is called a large sample confidence interval for $\mu$ .

In practice, we often do not know if the population is normal. Which confidence interval should we use? Generally, for the same $\alpha$ , the intervals based on $t_{\alpha / 2, n - 1}$ are larger than those based on $z_{\alpha / 2}$ . Hence the interval (4.2.3) is generally more conservative than the interval (4.2.6). So in practice, statisticians generally prefer the interval (4.2.3).

Occasionally in practice, the standard deviation $\sigma$ is assumed known. In this case, the confidence interval generally used for $\mu$ is (4.2.6) with $s$ replaced by $\sigma$ .

Example 4.2.3 (Large Sample Confidence Interval for $p$ ). Let $X$ be a Bernoulli random variable with probability of success $p$ , where $X$ is 1 or 0 if the outcome is success or failure, respectively. Suppose $X_1, \ldots, X_n$ is a random sample from the distribution of $X$ . Let $\widehat{p} = \overline{X}$ be the sample proportion of successes. Note that $\widehat{p} = n^{-1} \sum_{i=1}^{n} X_i$ is a sample average and that $\operatorname{Var}(\widehat{p}) = p(1 - p)/n$ . It follows immediately from the CLT that the distribution of $Z = (\widehat{p} - p) / \sqrt{p(1 - p)/n}$ is approximately $N(0,1)$ . Referring to Example 5.1.1 of Chapter 5, we replace $p(1 - p)$ with its estimate $\widehat{p}(1 - \widehat{p})$ . Then proceeding as in the last example, an approximate $(1 - \alpha) 100\%$ confidence interval for $p$ is given by

$$
(\widehat {p} - z _ {\alpha / 2} \sqrt {\widehat {p} (1 - \widehat {p}) / n}, \widehat {p} + z _ {\alpha / 2} \sqrt {\widehat {p} (1 - \widehat {p}) / n}), \tag {4.2.7}
$$

where $\sqrt{\widehat{p}(1 - \widehat{p}) / n}$ is called the standard error of $\widehat{p}$ .

In Example 4.1.2 we discussed a data set involving hip replacements, some of which were squeaky. The outcomes of a hip replacement were squeaky and non-squeaky which we labeled as success or failure, respectively. In the sample there were 28 successes out of 143 replacements. Using R, the $99\%$ confidence interval for $p$ , the probability of a squeaky hip replacement, is computed by prop.test(28,143,conf.level=.99), which results in the interval (0.122, 0.298). So with $99\%$ confidence, we estimate the probability of a squeaky hip replacement to be between 0.122 and 0.298.

# 4.2.1 Confidence Intervals for Difference in Means

A practical problem of interest is the comparison of two distributions, that is, comparing the distributions of two random variables, say $X$ and $Y$ . In this section, we compare the means of $X$ and $Y$ . Denote the means of $X$ and $Y$ by $\mu_1$ and $\mu_2$ , respectively. In particular, we obtain confidence intervals for the difference $\Delta = \mu_1 - \mu_2$ . Assume that the variances of $X$ and $Y$ are finite and denote them as $\sigma_1^2 = \operatorname{Var}(X)$ and $\sigma_2^2 = \operatorname{Var}(Y)$ . Let $X_1, \ldots, X_{n_1}$ be a random sample from the distribution of $X$ and let $Y_1, \ldots, Y_{n_2}$ be a random sample from the distribution of $Y$ . Assume that the samples were gathered independently of one another. Let $\overline{X} = n_1^{-1}\sum_{i=1}^{n_1}X_i$ and $\overline{Y} = n_2^{-1}\sum_{i=1}^{n_2}Y_i$ be the sample means. Let $\widehat{\Delta} = \overline{X} - \overline{Y}$ . The statistic $\widehat{\Delta}$ is an unbiased estimator of $\Delta$ . This difference, $\widehat{\Delta} - \Delta$ , is the numerator of the pivot random variable. By independence of the samples,

$$
\mathrm {V a r} (\widehat {\Delta}) = \frac {\sigma_ {1} ^ {2}}{n _ {1}} + \frac {\sigma_ {2} ^ {2}}{n _ {2}}.
$$

Let $S_1^2 = (n_1 - 1)^{-1}\sum_{i=1}^{n_1}(X_i - \overline{X})^2$ and $S_2^2 = (n_2 - 1)^{-1}\sum_{i=1}^{n_2}(Y_i - \overline{Y})^2$ be the sample variances. Then estimating the variances by the sample variances, consider the random variable

$$
Z = \frac {\widehat {\Delta} - \Delta}{\sqrt {\frac {S _ {1} ^ {2}}{n _ {1}} + \frac {S _ {2} ^ {2}}{n _ {2}}}}. \tag {4.2.8}
$$

By the independence of the samples and Theorem 4.2.1, this pivot variable has an approximate $N(0,1)$ distribution. This leads to the approximate $(1 - \alpha)100\%$ confidence interval for $\Delta = \mu_1 - \mu_2$ given by

$$
\left(\left(\bar {x} - \bar {y}\right) - z _ {\alpha / 2} \sqrt {\frac {s _ {1} ^ {2}}{n _ {1}} + \frac {s _ {2} ^ {2}}{n _ {2}}}, \left(\bar {x} - \bar {y}\right) + z _ {\alpha / 2} \sqrt {\frac {s _ {1} ^ {2}}{n _ {1}} + \frac {s _ {2} ^ {2}}{n _ {2}}}\right), \tag {4.2.9}
$$

where $\sqrt{(s_1^2 / n_1) + (s_2^2 / n_2)}$ is the standard error of $\overline{X} -\overline{Y}$ . This is a large sample $(1 - \alpha)100\%$ confidence interval for $\mu_{1} - \mu_{2}$ .

The above confidence interval is approximate. In this situation we can obtain exact confidence intervals if we assume that the distributions of $X$ and $Y$ are normal with the same variance; i.e., $\sigma_1^2 = \sigma_2^2$ . Thus the distributions can differ only in location, i.e., a location model. Assume then that $X$ is distributed $N(\mu_1, \sigma^2)$ and $Y$ is distributed $N(\mu_2, \sigma^2)$ , where $\sigma^2$ is the common variance of $X$ and $Y$ . As above, let $X_1, \ldots, X_{n_1}$ be a random sample from the distribution of $X$ , let $Y_1, \ldots, Y_{n_2}$ be a random sample from the distribution of $Y$ , and assume that the samples are independent of one another. Let $n = n_1 + n_2$ be the total sample size. Our estimator of $\Delta$ is $\overline{X} - \overline{Y}$ . Our goal is to show that a pivot random variable, defined below, has a $t$ -distribution, which is defined in Section 3.6.

Because $\overline{X}$ is distributed $N(\mu_1, \sigma^2 / n_1)$ , $\overline{Y}$ is distributed $N(\mu_2, \sigma^2 / n_2)$ , and $\overline{X}$ and $\overline{Y}$ are independent, we have the result

$$
\frac {(\bar {X} - \bar {Y}) - \left(\mu_ {1} - \mu_ {2}\right)}{\sigma \sqrt {\frac {1}{n _ {1}} + \frac {1}{n _ {2}}}} \text {h a s a} N (0, 1) \tag {4.2.10}
$$

This serves as the numerator of our $T$ -statistic.

Let

$$
S _ {p} ^ {2} = \frac {\left(n _ {1} - 1\right) S _ {1} ^ {2} + \left(n _ {2} - 1\right) S _ {2} ^ {2}}{n _ {1} + n _ {2} - 2}. \tag {4.2.11}
$$

Note that $S_{p}^{2}$ is a weighted average of $S_{1}^{2}$ and $S_{2}^{2}$ . It is easy to see that $S_{p}^{2}$ is an unbiased estimator of $\sigma^2$ . It is called the pooled estimator of $\sigma^2$ . Also, because $(n_{1} - 1)S_{1}^{2} / \sigma^{2}$ has a $\chi^2 (n_1 - 1)$ distribution, $(n_{2} - 1)S_{2}^{2} / \sigma^{2}$ has a $\chi^2 (n_2 - 1)$ distribution, and $S_{1}^{2}$ and $S_{2}^{2}$ are independent, we have that $(n - 2)S_p^2 /\sigma^2$ has a $\chi^2 (n - 2)$ distribution; see Corollary 3.3.1. Finally, because $S_{1}^{2}$ is independent of $\overline{X}$ and $S_{2}^{2}$ is independent of $\overline{Y}$ , and the random samples are independent of each other, it follows that $S_{p}^{2}$ is independent of expression (4.2.10). Therefore, from the

result of Section 3.6.1 concerning Student's $t$ -distribution, we have that

$$
\begin{array}{l} T = \frac {[ (\overline {{X}} - \overline {{Y}}) - (\mu_ {1} - \mu_ {2}) ] / \sigma \sqrt {n _ {1} ^ {- 1} + n _ {2} ^ {- 1}}}{\sqrt {(n - 2) S _ {p} ^ {2} / (n - 2) \sigma^ {2}}} \\ = \frac {(\bar {X} - \bar {Y}) - \left(\mu_ {1} - \mu_ {2}\right)}{S _ {p} \sqrt {\frac {1}{n _ {1}} + \frac {1}{n _ {2}}}} \tag {4.2.12} \\ \end{array}
$$

has a $t$ -distribution with $n - 2$ degrees of freedom. From this last result, it is easy to see that the following interval is an exact $(1 - \alpha)100\%$ confidence interval for $\Delta = \mu_1 - \mu_2$ :

$$
\left(\left(\bar {x} - \bar {y}\right) - t _ {\left(\alpha / 2, n - 2\right)} s _ {p} \sqrt {\frac {1}{n _ {1}} + \frac {1}{n _ {2}}}, \left(\bar {x} - \bar {y}\right) + t _ {\left(\alpha / 2, n - 2\right)} s _ {p} \sqrt {\frac {1}{n _ {1}} + \frac {1}{n _ {2}}}\right). \tag {4.2.13}
$$

A consideration of the difficulty encountered when the unknown variances of the two normal distributions are not equal is assigned to one of the exercises.

Example 4.2.4. To illustrate the pooled $t$ -confidence interval, consider the baseball data presented in Hettmansperger and McKean (2011). It consists of 6 variables recorded on 59 professional baseball players of which 33 are hitters and 26 are pitchers. The data can be found in the file bb.rda located at the site listed in Chapter 1. The height in inches of a player is one of these measurements and in this example we consider the difference in heights between pitchers and hitters. Denote the true mean heights of the pitchers and hitters by $\mu_p$ and $\mu_h$ , respectively, and let $\Delta = \mu_p - \mu_h$ . The sample averages of the heights are 75.19 and 72.67 inches for the pitchers and hitters, respectively. Hence, our point estimate of $\Delta$ is 2.53 inches. Assuming the file bb.rda has been loaded in R, the following R segment computes the 95% confidence interval for $\Delta$ :

```c
hitht=height[hitpitind==1]; pitht=height[hitpitind==0]

t.test(pitht,hihht,var.equal=T)

The confidence interval computes to (1.42, 3.63). Note that all values in the confidence interval are positive, indicating that on the average pitchers are taller than hitters.

Remark 4.2.1. Suppose $X$ and $Y$ are not normally distributed but that their distributions differ only in location. As we show in Chapter 5, the above interval, (4.2.13), is then approximate and not exact.

# 4.2.2 Confidence Interval for Difference in Proportions

Let $X$ and $Y$ be two independent random variables with Bernoulli distributions $b(1, p_1)$ and $b(1, p_2)$ , respectively. Let us now turn to the problem of finding a confidence interval for the difference $p_1 - p_2$ . Let $X_1, \ldots, X_{n_1}$ be a random sample from the distribution of $X$ and let $Y_1, \ldots, Y_{n_2}$ be a random sample from the distribution of $Y$ . As above, assume that the samples are independent of one another and let

$n = n_1 + n_2$ be the total sample size. Our estimator of $p_1 - p_2$ is the difference in sample proportions, which, of course, is given by $\overline{X} -\overline{Y}$ . We use the traditional notation and write $\hat{p}_1$ and $\hat{p}_2$ instead of $\overline{X}$ and $\overline{Y}$ , respectively. Hence, from the above discussion, an interval such as (4.2.9) serves as an approximate confidence interval for $p_1 - p_2$ . Here, $\sigma_1^2 = p_1(1 - p_1)$ and $\sigma_2^2 = p_2(1 - p_2)$ . In the interval, we estimate these by $\hat{p}_1(1 - \hat{p}_1)$ and $\hat{p}_2(1 - \hat{p}_2)$ , respectively. Thus our approximate $(1 - \alpha)100\%$ confidence interval for $p_1 - p_2$ is

$$
\hat {p} _ {1} - \hat {p} _ {2} \pm z _ {\alpha / 2} \sqrt {\frac {\hat {p} _ {1} (1 - \hat {p} _ {1})}{n _ {1}} + \frac {\hat {p} _ {2} (1 - \hat {p} _ {2})}{n _ {2}}}. \tag {4.2.14}
$$

Example 4.2.5. Kloke and McKean (2014), page 33, discuss a data set from the original clinical study of the Salk polio vaccine in 1954. At random, one group of children (Treated) received the vaccine while the other group (Control) received a placebo. Let $p_c$ and $p_T$ denote the true proportions of polio cases for control and treated populations, respectively. The tabled results are:

<table><tr><td>Group</td><td>No. Children</td><td>No. Polio Cases</td><td>Sample Proportion</td></tr><tr><td>Treated</td><td>200,745</td><td>57</td><td>0.000284</td></tr><tr><td>Control</td><td>201,229</td><td>199</td><td>0.000706</td></tr></table>

Note that $\hat{p}_C > \hat{p}_T$ . The following R segment computes the $95\%$ confidence interval for $p_c - p_T$ :

prop.test(c(199,57),c(201229,200745))

The confidence interval is (0.00054, 0.00087). All values in this interval are positive, indicating that the vaccine is effective in reducing the incidence of polio.

# EXERCISES

4.2.1. Let the observed value of the mean $\overline{X}$ and of the sample variance of a random sample of size 20 from a distribution that is $N(\mu, \sigma^2)$ be 81.2 and 26.5, respectively. Find respectively $90\%$ , $95\%$ and $99\%$ confidence intervals for $\mu$ . Note how the lengths of the confidence intervals increase as the confidence increases.

4.2.2. Consider the data on the lifetimes of motors given in Exercise 4.1.1. Obtain a large sample $95\%$ confidence interval for the mean lifetime of a motor.

4.2.3. Suppose we assume that $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a $\Gamma(1, \theta)$ distribution.

(a) Show that the random variable $(2 / \theta)\sum_{i = 1}^{n}X_{i}$ has a $\chi^2$ -distribution with $2n$ degrees of freedom.   
(b) Using the random variable in part (a) as a pivot random variable, find a $(1 - \alpha)100\%$ confidence interval for $\theta$ .   
(c) Obtain the confidence interval in part (b) for the data of Exercise 4.1.1 and compare it with the interval you obtained in Exercise 4.2.2.

4.2.4. In Example 4.2.4, for the baseball data, we found a confidence interval for the mean difference in heights between the pitchers and hitters. In this exercise, find the pooled $t95\%$ confidence interval for the mean difference in weights between the pitchers and hitters.

4.2.5. In the baseball data set discussed in the last exercise, it was found that out of the 59 baseball players, 15 were left-handed. Is this odd, since the proportion of left-handed males in America is about $11\%$ ? Answer by using (4.2.7) to construct a $95\%$ approximate confidence interval for $p$ , the proportion of left-handed professional baseball players.

4.2.6. Let $\overline{X}$ be the mean of a random sample of size $n$ from a distribution that is $N(\mu, 9)$ . Find $n$ such that $P(\overline{X} - 1 < \mu < \overline{X} + 1) = 0.90$ , approximately.

4.2.7. Let a random sample of size 17 from the normal distribution $N(\mu, \sigma^2)$ yield $\overline{x} = 4.7$ and $s^2 = 5.76$ . Determine a 90% confidence interval for $\mu$ .

4.2.8. Let $\overline{X}$ denote the mean of a random sample of size $n$ from a distribution that has mean $\mu$ and variance $\sigma^2 = 10$ . Find $n$ so that the probability is approximately 0.954 that the random interval $(\overline{X} - \frac{1}{2}, \overline{X} + \frac{1}{2})$ includes $\mu$ .

4.2.9. Let $X_{1}, X_{2}, \ldots, X_{9}$ be a random sample of size 9 from a distribution that is $N(\mu, \sigma^2)$ .

(a) If $\sigma$ is known, find the length of a $95\%$ confidence interval for $\mu$ if this interval is based on the random variable $\sqrt{9} (\overline{X} -\mu) / \sigma$   
(b) If $\sigma$ is unknown, find the expected value of the length of a $95\%$ confidence interval for $\mu$ if this interval is based on the random variable $\sqrt{9} (\overline{X} -\mu) / S$ . Hint: Write $E(S) = (\sigma /\sqrt{n - 1})E[(n - 1)S^2 /\sigma^2)^{1 / 2}]$ .   
(c) Compare these two answers.

4.2.10. Let $X_{1}, X_{2}, \ldots, X_{n}, X_{n+1}$ be a random sample of size $n + 1$ , $n > 1$ , from a distribution that is $N(\mu, \sigma^2)$ . Let $\overline{X} = \sum_{1}^{n} X_i / n$ and $S^2 = \sum_{1}^{n} (X_i - \overline{X})^2 / (n - 1)$ . Find the constant $c$ so that the statistic $c(\overline{X} - X_{n+1}) / S$ has a $t$ -distribution. If $n = 8$ , determine $k$ such that $P(\overline{X} - kS < X_9 < \overline{X} + kS) = 0.80$ . The observed interval $(\overline{x} - ks, \overline{x} + ks)$ is often called an $80\%$ prediction interval for $X_9$ .

4.2.11. Let $X_{1},\ldots ,X_{n}$ be a random sample from a $N(0,1)$ distribution. Then the probability that the random interval $\overline{X}\pm t_{\alpha /2,n - 1}(s / \sqrt{n})$ traps $\mu = 0$ is $(1 - \alpha)$ . To verify this empirically, in this exercise, we simulate $m$ such intervals and calculate the proportion that trap 0, which should be "close" to $(1 - \alpha)$ .

(a) Set $n = 10$ and $m = 50$ . Run the R code mat = matrix(rnorm(m*n), ncol=n) which generates $m$ samples of size $n$ from the $N(0,1)$ distribution. Each row of the matrix mat contains a sample. For this matrix of samples, the function below computes the $(1 - \alpha)100\%$ confidence intervals, returning them in a $m \times 2$ matrix. Run this function on your generated matrix mat. What is the proportion of successful confidence intervals?

```txt
getcis <- function(mat, cc = .90) {
numb <- length(mat[,1]); ci <- c()
for(j in 1: numb)
{ci <- rbind(ci, t.test(mat[j], conf.level = cc), $conf.int)}
return(ci)}
This function is also at the site discussed in Section 1.1. 
```

(b) Run the following code which plots the intervals. Label the successful intervals. Comment on the variability of the lengths of the confidence intervals. cis<-getcis(mat); $x<-1:m$ plot(c(cis[,1],cis[,2])~c(x,x),pch="",xlab="Sample",ylab="CI") points(cis[,1]~x,pch="L");points(cis[,2]~x,pch="U");abline(h=0)

4.2.12. In Exercise 4.2.11, the sampling was from the $N(0,1)$ distribution. Show, however, that setting $\mu = 0$ and $\sigma = 1$ is without loss of generality.

Hint: First, $X_{1},\ldots ,X_{n}$ is a random sample from the $N(\mu ,\sigma^2)$ if and only if $Z_{1},\ldots ,Z_{n}$ is a random sample from the $N(0,1)$ , where $Z_{i} = (X_{i} - \mu) / \sigma$ . Then show the confidence interval based on the $Z_{i}$ 's contains 0 if and only if the confidence interval based on the $X_{i}$ 's contains $\mu$ .

4.2.13. Change the code in the R function getcis so that it also returns the vector, ind, where ind[i] = 1 if the $i$ th confidence interval is successful and 0 otherwise. Show that the empirical confidence level is mean(ind).

(a) Run 10,000 simulations for the normal setup in Exercise 4.2.11 and compute the empirical confidence level.   
(b) Run 10,000 simulations when the sampling is from the Cauchy distribution, (1.8.8), and compute the empirical confidence level. Does it differ from (a)? Note that the R code rcauchy(k) returns a sample of size $k$ from this Cauchy distribution.   
(c) Note that these empirical confidence levels are proportions from samples that are independent. Hence, use the $95\%$ confidence interval given in expression (4.2.14) to statistically investigate whether or not the true confidence levels differ. Comment.

4.2.14. Let $\overline{X}$ denote the mean of a random sample of size 25 from a gamma-type distribution with $\alpha = 4$ and $\beta >0$ . Use the Central Limit Theorem to find an approximate 0.954 confidence interval for $\mu$ , the mean of the gamma distribution. Hint: Use the random variable $(\overline{X} -4\beta) / (4\beta^{2} / 25)^{1 / 2} = 5\overline{X} /2\beta -10$   
4.2.15. Let $\overline{x}$ be the observed mean of a random sample of size $n$ from a distribution having mean $\mu$ and known variance $\sigma^2$ . Find $n$ so that $\overline{x} - \sigma / 4$ to $\overline{x} + \sigma / 4$ is an approximate $95\%$ confidence interval for $\mu$ .   
4.2.16. Assume a binomial model for a certain random variable. If we desire a $90\%$ confidence interval for $p$ that is at most 0.02 in length, find $n$ .

Hint: Note that $\sqrt{(y / n)(1 - y / n)}\leq \sqrt{(\frac{1}{2})(1 - \frac{1}{2})}.$

4.2.17. It is known that a random variable $X$ has a Poisson distribution with parameter $\mu$ . A sample of 200 observations from this distribution has a mean equal to 3.4. Construct an approximate $90\%$ confidence interval for $\mu$ .

4.2.18. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from $N(\mu, \sigma^2)$ , where both parameters $\mu$ and $\sigma^2$ are unknown. A confidence interval for $\sigma^2$ can be found as follows. We know that $(n - 1)S^2 / \sigma^2$ is a random variable with a $\chi^2(n - 1)$ distribution. Thus we can find constants $a$ and $b$ so that $P((n - 1)S^2 / \sigma^2 < b) = 0.975$ and $P(a < (n - 1)S^2 / \sigma^2 < b) = 0.95$ . In R, $b = q\mathrm{chisq}(0.975, n-1)$ , while $a = q\mathrm{chisq}(0.025, n-1)$ .

(a) Show that this second probability statement can be written as

$$
P ((n - 1) S ^ {2} / b <   \sigma^ {2} <   (n - 1) S ^ {2} / a) = 0. 9 5.
$$

(b) If $n = 9$ and $s^2 = 7.93$ , find a $95\%$ confidence interval for $\sigma^2$ .

(c) If $\mu$ is known, how would you modify the preceding procedure for finding a confidence interval for $\sigma^2$ ?

4.2.19. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a gamma distribution with known parameter $\alpha = 3$ and unknown $\beta > 0$ . In Exercise 4.2.14, we obtained an approximate confidence interval for $\beta$ based on the Central Limit Theorem. In this exercise, we obtain an exact confidence interval by first obtaining the distribution of $2\sum_{1}^{n}X_{i} / \beta$ .

Hint: Follow the procedure outlined in Exercise 4.2.18.

4.2.20. When 100 tacks were thrown on a table, 60 of them landed point up. Obtain a $95\%$ confidence interval for the probability that a tack of this type lands point up. Assume independence.

4.2.21. Let two independent random samples, each of size 10, from two normal distributions $N(\mu_1, \sigma^2)$ and $N(\mu_2, \sigma^2)$ yield $\overline{x} = 4.8$ , $s_1^2 = 8.64$ , $\overline{y} = 5.6$ , $s_2^2 = 7.88$ . Find a 95% confidence interval for $\mu_1 - \mu_2$ .

4.2.22. Let two independent random variables, $Y_{1}$ and $Y_{2}$ , with binomial distributions that have parameters $n_{1} = n_{2} = 100$ , $p_{1}$ , and $p_{2}$ , respectively, be observed to be equal to $y_{1} = 50$ and $y_{2} = 40$ . Determine an approximate 90% confidence interval for $p_{1} - p_{2}$ .

4.2.23. Discuss the problem of finding a confidence interval for the difference $\mu_1 - \mu_2$ between the two means of two normal distributions if the variances $\sigma_1^2$ and $\sigma_2^2$ are known but not necessarily equal.

4.2.24. Discuss Exercise 4.2.23 when it is assumed that the variances are unknown and unequal. This is a very difficult problem, and the discussion should point out exactly where the difficulty lies. If, however, the variances are unknown but their ratio $\sigma_1^2 / \sigma_2^2$ is a known constant $k$ , then a statistic that is a $T$ random variable can again be used. Why?

4.2.25. To illustrate Exercise 4.2.24, let $X_{1}, X_{2}, \ldots, X_{9}$ and $Y_{1}, Y_{2}, \ldots, Y_{12}$ represent two independent random samples from the respective normal distributions $N(\mu_{1}, \sigma_{1}^{2})$ and $N(\mu_{2}, \sigma_{2}^{2})$ . It is given that $\sigma_{1}^{2} = 3\sigma_{2}^{2}$ , but $\sigma_{2}^{2}$ is unknown. Define a random variable that has a $t$ -distribution that can be used to find a 95% confidence interval for $\mu_{1} - \mu_{2}$ .

4.2.26. Let $\overline{X}$ and $\overline{Y}$ be the means of two independent random samples, each of size $n$ , from the respective distributions $N(\mu_1, \sigma^2)$ and $N(\mu_2, \sigma^2)$ , where the common variance is known. Find $n$ such that

$$
P (\overline {{X}} - \overline {{Y}} - \sigma / 5 <   \mu_ {1} - \mu_ {2} <   \overline {{X}} - \overline {{Y}} + \sigma / 5) = 0. 9 0.
$$

4.2.27. Let $X_{1}, X_{2}, \ldots, X_{n}$ and $Y_{1}, Y_{2}, \ldots, Y_{m}$ be two independent random samples from the respective normal distributions $N(\mu_1, \sigma_1^2)$ and $N(\mu_2, \sigma_2^2)$ , where the four parameters are unknown. To construct a confidence interval for the ratio, $\sigma_1^2 / \sigma_2^2$ , of the variances, form the quotient of the two independent $\chi^2$ variables, each divided by its degrees of freedom, namely,

$$
F = \frac {\frac {(m - 1) S _ {2} ^ {2}}{\sigma_ {2} ^ {2}} / (m - 1)}{\frac {(n - 1) S _ {1} ^ {2}}{\sigma_ {1} ^ {2}} / (n - 1)} = \frac {S _ {2} ^ {2} / \sigma_ {2} ^ {2}}{S _ {1} ^ {2} / \sigma_ {1} ^ {2}},
$$

where $S_1^2$ and $S_2^2$ are the respective sample variances.

(a) What kind of distribution does $F$ have?   
(b) Critical values $a$ and $b$ can be found so that $P(F < b) = 0.975$ and $P(a < F < b) = 0.95$ . In R, $b = \mathrm{qf}(0.975, \mathrm{m - 1}, \mathrm{n - 1})$ , while $a = \mathrm{qf}(0.025, \mathrm{m - 1}, \mathrm{n - 1})$ .   
(c) Rewrite the second probability statement as

$$
P \left[ a \frac {S _ {1} ^ {2}}{S _ {2} ^ {2}} <   \frac {\sigma_ {1} ^ {2}}{\sigma_ {2} ^ {2}} <   b \frac {S _ {1} ^ {2}}{S _ {2} ^ {2}} \right] = 0. 9 5.
$$

The observed values, $s_1^2$ and $s_2^2$ , can be inserted in these inequalities to provide a 95% confidence interval for $\sigma_1^2 / \sigma_2^2$ .

We caution the reader on the use of this confidence interval. This interval does depend on the normality of the distributions. If the distributions of $X$ and $Y$ are not normal then the true confidence coefficient may be far from the nominal confidence coefficient; see, for example, page 142 of Hettmansperger and McKean (2011) for discussion.

# 4.3 *Confidence Intervals for Parameters of Discrete Distributions

In this section, we outline a procedure that can be used to obtain exact confidence intervals for the parameters of discrete random variables. Let $X_{1},X_{2},\ldots ,X_{n}$ be a

random sample on a discrete random variable $X$ with pmf $p(x;\theta)$ , $\theta \in \Omega$ , where $\Omega$ is an interval of real numbers. Let $T = T(X_1, X_2, \ldots, X_n)$ be an estimator of $\theta$ with cdf $F_T(t; \theta)$ . Assume that $F_T(t; \theta)$ is a nonincreasing and continuous function of $\theta$ for every $t$ in the support of $T$ . For a given realization of the sample, let $t$ be the realized value of the statistic $T$ . Let $\alpha_1 > 0$ and $\alpha_2 > 0$ be given such that $\alpha = \alpha_1 + \alpha_2 < 0.50$ . Let $\underline{\theta}$ and $\overline{\theta}$ be the solutions of the equations

$$
F _ {T} (t -; \underline {{\theta}}) = 1 - \alpha_ {2} \text {a n d} F _ {T} (t; \bar {\theta}) = \alpha_ {1}, \tag {4.3.1}
$$

where $T-$ is the statistic whose support lags by one value of $T$ 's support. For instance, if $t_i < t_{i+1}$ are consecutive support values of $T$ , then $T = t_{i+1}$ if and only if $T- = t_i$ . Under these conditions, the interval $(\underline{\theta}, \overline{\theta})$ is a confidence interval for $\theta$ with confidence coefficient of at least $1 - \alpha$ . We sketch a proof of this at the end of this section.

Before proceeding with discrete examples, we provide an example in the continuous case where the solution of equations (4.3.1) produces a familiar confidence interval.

Example 4.3.1. Assume $X_{1},\ldots ,X_{n}$ is a random sample from a $N(\theta ,\sigma^2)$ distribution, where $\sigma^2$ is known. Let $\overline{X}$ be the sample mean and let $\overline{x}$ be its value for a given realization of the sample. Recall, from expression (4.2.6), that $\overline{x}\pm z_{\alpha /2}(\sigma /\sqrt{n})$ is a $(1 - \alpha)100\%$ confidence interval for $\theta$ . Assuming $\theta$ is the true mean, the cdf of $\overline{X}$ is $F_{\overline{X};\theta}(t) = \Phi [(t - \theta) / (\sigma /\sqrt{n})]$ , where $\Phi (z)$ is the cdf of a standard normal distribution. Note for the continuous case that $\overline{X} -$ has the same distribution as $\overline{X}$ . Then the first equation of (4.3.1) yields

$$
\Phi [ (\overline {{x}} - \theta) / (\sigma / \sqrt {n}) ] = 1 - (\alpha / 2);
$$

i.e.,

$$
(\overline {{x}} - \theta) / (\sigma / \sqrt {n}) = \Phi^ {- 1} [ 1 - (\alpha / 2) ] = z _ {\alpha / 2}.
$$

Solving for $\theta$ , we obtain the lower bound of the confidence interval $\overline{x} - z_{\alpha/2}(\sigma/\sqrt{n})$ . Similarly, the solution of the second equation is the upper bound of the confidence interval.

For the discrete case, generally iterative algorithms are used to solve equations (4.3.1). In practice, the function $F_{T}(T;\overline{\theta})$ is often strictly decreasing and continuous in $\theta$ , so a simple algorithm often suffices. We illustrate the examples below by using the simple bisection algorithm, which we now briefly discuss.

Remark 4.3.1 (Bisection Algorithm). Suppose we want to solve the equation $g(x) = d$ , where $g(x)$ is strictly decreasing. Assume on a given step of the algorithm that $a < b$ bracket the solution; i.e., $g(a) > d > g(b)$ . Let $c = (a + b)/2$ . Then on the next step of the algorithm, the new bracket values $a$ and $b$ are determined by

$$
\text {i f} (g (c) > d) \quad \text {t h e n} \quad \{a \leftarrow c \text {a n d} b \leftarrow b \}
$$

$$
\text {i f} (g (c) <   d) \quad \text {t h e n} \quad \{a \leftarrow a \text {a n d} b \leftarrow c \}.
$$

The algorithm continues until $|a - b| < \epsilon$ , where $\epsilon > 0$ is a specified tolerance.

Example 4.3.2 (Confidence Interval for a Bernoulli Proportion). Let $X$ have a Bernoulli distribution with $\theta$ as the probability of success. Let $\Omega = (0,1)$ . Suppose $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample on $X$ . As our point estimator of $\theta$ , we consider $\overline{X}$ , which is the sample proportion of successes. The cdf of $n\overline{X}$ is binomial $(n,\theta)$ . Thus

$$
\begin{array}{l} F _ {\overline {{X}}} (\bar {x}; \theta) = P (n \bar {X} \leq n \bar {x}) \\ = \sum_ {j = 0} ^ {n \overline {{x}}} \binom {n} {j} \theta^ {j} (1 - \theta) ^ {n - j} \\ = \quad 1 - \sum_ {j = n \bar {x} + 1} ^ {n} \binom {n} {j} \theta^ {j} (1 - \theta) ^ {n - j} \\ = 1 - \int_ {0} ^ {\theta} \frac {n !}{(n \bar {x}) ! [ n - (n \bar {x} + 1) !} z ^ {n \bar {x}} (1 - z) ^ {n - (n \bar {x} + 1)} d z, \tag {4.3.2} \\ \end{array}
$$

where the last equality, involving the incomplete $\beta$ -function, follows from Exercise 4.3.6. By the fundamental theorem of calculus and expression (4.3.2),

$$
\frac {d}{d \theta} F _ {\overline {{X}}} (\overline {{x}}; \theta) = - \frac {n !}{(n \overline {{x}}) ! [ n - (n \overline {{x}} + 1 ] !} \theta^ {n \overline {{x}}} (1 - \theta) ^ {n - (n \overline {{x}} + 1)} <   0;
$$

hence, $F_{\overline{X}}(\overline{x}; \theta)$ is a strictly decreasing function of $\theta$ , for each $\overline{x}$ . Next, let $\alpha_1, \alpha_2 > 0$ be specified constants such that $\alpha_1 + \alpha_2 < 1/2$ and let $\underline{\theta}$ and $\overline{\theta}$ solve the equations

$$
F _ {\bar {X}} (\bar {x} -; \underline {{\theta}}) = 1 - \alpha_ {2} \text {a n d} F _ {\bar {x}} (\bar {X}; \bar {\theta}) = \alpha_ {1}. \tag {4.3.3}
$$

Then $(\underline{\theta},\overline{\theta})$ is a confidence interval for $\theta$ with confidence coefficient at least $1 - \alpha$ , where $\alpha = \alpha_{1} + \alpha_{2}$ . These equations can be solved iteratively, as discussed in the following numerical illustration.

Numerical Illustration. Suppose $n = 30$ and the realization of the sample mean is $\overline{x} = 0.60$ , i.e., the sample produced $n\overline{x} = 18$ successes. Take $\alpha_{1} = \alpha_{2} = 0.05$ . Because the support of the binomial consists of integers and $n\overline{x} = 18$ , we can write equations (4.3.3) as

$$
\sum_ {j = 0} ^ {1 7} \binom {n} {j} \underline {{\theta}} ^ {j} (1 - \underline {{\theta}}) ^ {n - j} = 0. 9 5 \text {a n d} \sum_ {j = 0} ^ {1 8} \binom {n} {j} \bar {\theta} ^ {j} (1 - \bar {\theta}) ^ {n - j} = 0. 0 5. \tag {4.3.4}
$$

Let $bin(n,p)$ denote a random variable with binomial distribution with parameters $n$ and $p$ . Because $P(bin(30,0.4) \leq 17) = \mathrm{pbinom}(17,30,.4) = 0.9787$ and because $P.bin(30,0.45) \leq 17) = \mathrm{pbinom}(17,30,.45) = 0.9286$ , the values 0.4 and 0.45 bracket the solution to the first equation. We use these bracket values as input to the R function<sup>1</sup> binomci.r which iteratively solves the equation. The call and its output are:

$$
> \text {b i n o m c i} (1 7, 3 0,.. 4,.. 4 5,.. 9 5); \quad \mathbb {s o l u t i o n} \quad 0. 4 3 3 9 4 1 7
$$

So the solution to the first equation is $\underline{\theta} = 0.434$ . In the same way, because $P(\text{bin}(30, 0.7) \leq 18) = 0.1593$ and $P(\text{bin}(30, 0.8) \leq 18) = 0.0094$ , the values 0.7 and 0.8 bracket the solution to the second equation. The R segment for the solution is:

$$
> \text {b i n o m c i} (1 8, 3 0,.. 7,. 8,. 0 5); \quad \$ \text {s o l u t i o n} \quad 0. 7 5 0 4 7
$$

Thus the confidence interval is (0.434, 0.750), with a confidence of at least $90\%$ . For comparison, the asymptotic $90\%$ confidence interval of expression (4.2.7) is (0.453, 0.747); see Exercise 4.3.2.

Example 4.3.3 (Confidence Interval for the Mean of a Poisson Distribution). Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample on a random variable $X$ that has a Poisson distribution with mean $\theta$ . Let $\overline{X} = n^{-1} \sum_{i=1}^{n} X_{i}$ be our point estimator of $\theta$ . As with the Bernoulli confidence interval in the last example, we can work with $n\overline{X}$ , which, in this case, has a Poisson distribution with mean $n\theta$ . The cdf of $\overline{X}$ is

$$
\begin{array}{l} F _ {\overline {{X}}} (\overline {{x}}; \theta) = \sum_ {j = 0} ^ {n \overline {{x}}} e ^ {- n \theta} \frac {(n \theta) ^ {j}}{j !} \\ = \frac {1}{\Gamma (n \overline {{x}} + 1)} \int_ {n \theta} ^ {\infty} x ^ {n \overline {{x}}} e ^ {- x} d x, \tag {4.3.5} \\ \end{array}
$$

where the integral equation is obtained in Exercise 4.3.7. From expression (4.3.5), we immediately have

$$
\frac {d}{d \theta} F _ {\overline {{X}}} (\overline {{x}}; \theta) = \frac {- n}{\Gamma (n \overline {{x}} + 1)} (n \theta) ^ {n \overline {{x}}} e ^ {- n \theta} <   0.
$$

Therefore, $F_{\overline{X}}(\overline{x}; \theta)$ is a strictly decreasing function of $\theta$ for every fixed $\overline{x}$ . For a given sample, let $\overline{x}$ be the realization of the statistic $\overline{X}$ . Hence, as discussed above, for $\alpha_1, \alpha_2 > 0$ such that $\alpha_1 + \alpha_2 < 1/2$ , the confidence interval is given by $(\underline{\theta}, \overline{\theta})$ , where

$$
\sum_ {j = 0} ^ {n \bar {x} - 1} e ^ {- n \underline {{\theta}}} \frac {(n \underline {{\theta}}) ^ {j}}{j !} = 1 - \alpha_ {2} \text {a n d} \sum_ {j = 0} ^ {n \bar {x}} e ^ {- n \bar {\theta}} \frac {(n \bar {\theta}) ^ {j}}{j !} = \alpha_ {1}. \tag {4.3.6}
$$

The confidence coefficient of the interval $(\underline{\theta},\overline{\theta})$ is at least $1 - \alpha = 1 - (\alpha_{1} + \alpha_{2})$ . As with the Bernoulli proportion, these equations can be solved iteratively.

Numerical Illustration. Suppose $n = 25$ and the realized value of $\overline{X}$ is $\overline{x} = 5$ ; hence, $n\overline{x} = 125$ events have occurred. We select $\alpha_{1} = \alpha_{2} = 0.05$ . Then, by (4.3.7), our confidence interval solves the equations

$$
\sum_ {j = 0} ^ {1 2 4} e ^ {- n \theta} \frac {(n \theta) ^ {j}}{j !} = 0. 9 5 \text {a n d} \sum_ {j = 0} ^ {1 2 5} e ^ {- n \overline {{\theta}}} \frac {(n \overline {{\theta}}) ^ {j}}{j !} = 0. 0 5. \tag {4.3.7}
$$

Our R function<sup>2</sup> poissonci.r uses the bisection algorithm to solve these equations. Since ppois(124, 25 * 4) = 0.9932 and ppois(124, 25 * 4.4) = 0.9145, for the first equation, 4.0 and 4.4 bracket the solution. Here is the call to poissonci.r along with the solution (the lower bound of the confidence interval):

> poissonci(124,25,4,4.4,.95); $solution 4.287836

Since $\text{ppois}(125, 25 * 5.5) = 0.1528$ and $\text{ppois}(125, 25 * 6.0) = 0.0204$ , for the second equation, 5.5 and 6.0 bracket the solution. Hence, the computation of the lower bound of the confidence interval is:

> poissonci(125,25,5.5,6,.05); $solution 5.800575

So the confidence interval is (4.287, 5.8), with confidence at least $90\%$ . Note that the confidence interval is right-skewed, similar to the Poisson distribution.

A brief sketch of the theory behind this confidence interval follows. Consider the general setup in the first paragraph of this section, where $T$ is an estimator of the unknown parameter $\theta$ and $F_{T}(t;\theta)$ is the cdf of $T$ . Define

$$
\bar {\theta} = \sup  \left\{\theta : F _ {T} (T; \theta) \geq \alpha_ {1} \right\} \tag {4.3.8}
$$

$$
\underline {{\theta}} = \inf  \left\{\theta : F _ {T} (T -; \theta) \leq 1 - \alpha_ {2} \right\}. \tag {4.3.9}
$$

Hence, we have

$$
\theta > \bar {\theta} \Rightarrow F _ {T} (T; \theta) \leq \alpha_ {1}
$$

$$
\theta <   \underline {{\theta}} \Rightarrow F _ {T} (T -; \theta) \geq 1 - \alpha_ {2}.
$$

These implications lead to

$$
\begin{array}{l} P [ \underline {{\theta}} <   \theta <   \overline {{\theta}} ] = 1 - P [ \{\theta <   \underline {{\theta}} \} \cup \{\theta > \overline {{\theta}} \} ] \\ = 1 - P [ \theta <   \underline {{\theta}} ] - P [ \theta > \overline {{\theta}} ] \\ \geq 1 - P \left[ F _ {T} (T -; \theta) \geq 1 - \alpha_ {2} \right] - P \left[ F _ {T} (T; \theta) \leq \alpha_ {1} \right] \\ \geq 1 - \alpha_ {1} - \alpha_ {2}, \\ \end{array}
$$

where the last inequality is evident from equations (4.3.8) and (4.3.9). A rigorous proof can be based on Exercise 4.8.13; see page 425 of Shao (1998) for details.

# EXERCISES

4.3.1. Recall For the baseball data (bb.rda), 15 out of 59 ballplayers are left-handed. Let $p$ be the probability that a professional baseball player is left-handed. Determine an exact $90\%$ confidence interval for $p$ . Show first that the equations to be solved are:

$$
\sum_ {j = 0} ^ {1 4} \binom {n} {j} \underline {{\theta}} ^ {j} (1 - \underline {{\theta}}) ^ {n - j} = 0. 9 5 \text {a n d} \sum_ {j = 0} ^ {1 5} \binom {n} {j} \overline {{\theta}} ^ {j} (1 - \overline {{\theta}}) ^ {n - j} = 0. 0 5  .
$$

Then do the following steps to obtain the confidence interval.

(a) Show that 0.10 and 0.17 bracket the solution to the first equation.   
(b) Show that 0.34 and 0.38 bracket the solution to the second equation.   
(c) Then use the R function binomci.r to solve the equations.

4.3.2. In Example 4.3.2, verify the result for the asymptotic confidence interval for $\theta$ .

4.3.3. In Exercise 4.2.20, the large sample confidence interval was obtained for the probability that a tack tossed on a table lands point up. Find the discrete exact confidence interval for this proportion.

4.3.4. Suppose $X_{1}, X_{2}, \ldots, X_{10}$ is a random sample on a random variable $X$ that has a Poisson distribution with mean $\theta$ . Suppose the realized value of the sample mean is 0.5; i.e., $n\overline{x} = 5$ events occurred. Suppose we want to compute the exact $90\%$ confidence interval for $\theta$ , as determined by equations (4.3.7).

(a) Show that 0.19 and 0.20 bracket the solution to the first equation.   
(b) Show that 1.0 and 1.1 bracket the solution to the second equation.   
(c) Then use the R function poissonci.r to solve the equations.

4.3.5. Consider the same setup as in Example 4.3.1 except now assume that $\sigma^2$ is unknown. Using the distribution of $(\overline{X} - \theta) / (S / \sqrt{n})$ , where $S$ is the sample standard deviation, set up the equations and derive the $t$ -interval, (4.2.3), for $\theta$ .

4.3.6. Using Exercise 3.3.22, show that

$$
\int_ {0} ^ {p} \frac {n !}{(k - 1) ! (n - k) !} z ^ {k - 1} (1 - z) ^ {n - k} d z = \sum_ {w = k} ^ {n} {\binom {n} {w}} p ^ {w} (1 - p) ^ {n - w},
$$

where $0 < p < 1$ , and $k$ and $n$ are positive integers such that $k \leq n$ .

Hint: Differentiate both sides with respect to $p$ . The derivative of the right side is a sum of differences. Show it simplifies to the derivative of the left side. Hence, the sides differ by a constant. Finally, show that the constant is 0.

4.3.7. This exercise obtains a useful identity for the cdf of a Poisson cdf.

(a) Use Exercise 3.3.5 to show that this identity is true:

$$
\frac {\lambda^ {n}}{\Gamma (n)} \int_ {1} ^ {\infty} x ^ {n - 1} e ^ {- x \lambda} d x = \sum_ {j = 0} ^ {n - 1} e ^ {- \lambda} \frac {\lambda^ {j}}{j !},
$$

for $\lambda > 0$ and $n$ a positive integer.

Hint: Just consider a Poisson process on the unit interval with mean $\lambda$ . Let $W_{n}$ be the waiting time until the nth event. Then the left side is $P(W_{n} > 1)$ . Why?

(b) Obtain the identity used in Example 4.3.3, by making the transformation $z = \lambda x$ in the above integral.

# 4.4 Order Statistics

In this section the notion of an order statistic is defined and some of its simple properties are investigated. These statistics have in recent times come to play an

important role in statistical inference partly because some of their properties do not depend upon the distribution from which the random sample is obtained.

Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution of the continuous type having a pdf $f(x)$ that has support $S = (a, b)$ , where $-\infty \leq a < b \leq \infty$ . Let $Y_{1}$ be the smallest of these $X_{i}$ , $Y_{2}$ the next $X_{i}$ in order of magnitude, ..., and $Y_{n}$ the largest of $X_{i}$ . That is, $Y_{1} < Y_{2} < \dots < Y_{n}$ represent $X_{1}, X_{2}, \ldots, X_{n}$ when the latter are arranged in ascending order of magnitude. We call $Y_{i}$ , $i = 1, 2, \ldots, n$ , the $i$ th order statistic of the random sample $X_{1}, X_{2}, \ldots, X_{n}$ . Then the joint pdf of $Y_{1}, Y_{2}, \ldots, Y_{n}$ is given in the following theorem.

Theorem 4.4.1. Using the above notation, let $Y_{1} < Y_{2} < \dots < Y_{n}$ denote the $n$ th order statistics based on the random sample $X_{1}, X_{2}, \ldots, X_{n}$ from a continuous distribution with pdf $f(x)$ and support $(a, b)$ . Then the joint pdf of $Y_{1}, Y_{2}, \ldots, Y_{n}$ is given by

$$
g \left(y _ {1}, y _ {2}, \dots , y _ {n}\right) = \left\{ \begin{array}{l l} n! f \left(y _ {1}\right) f \left(y _ {2}\right) \dots f \left(y _ {n}\right) & a <   y _ {1} <   y _ {2} <   \dots <   y _ {n} <   b \\ 0 & e l s e w h e r e. \end{array} \right. \tag {4.4.1}
$$

Proof: Note that the support of $X_{1}, X_{2}, \ldots, X_{n}$ can be partitioned into $n!$ mutually disjoint sets that map onto the support of $Y_{1}, Y_{2}, \ldots, Y_{n}$ , namely, $\{(y_{1}, y_{2}, \ldots, y_{n}) : a < y_{1} < y_{2} < \dots < y_{n} < b\}$ . One of these $n!$ sets is $a < x_{1} < x_{2} < \dots < x_{n} < b$ , and the others can be found by permuting the $n$ xs in all possible ways. The transformation associated with the one listed is $x_{1} = y_{1}, x_{2} = y_{2}, \ldots, x_{n} = y_{n}$ , which has a Jacobian equal to 1. However, the Jacobian of each of the other transformations is either $\pm 1$ . Thus

$$
\begin{array}{l} g \left(y _ {1}, y _ {2}, \dots , y _ {n}\right) = \sum_ {i = 1} ^ {n!} \left| J _ {i} \right| f \left(y _ {1}\right) f \left(y _ {2}\right) \dots f \left(y _ {n}\right) \\ = \left\{ \begin{array}{l l} n! f (y _ {1}) f (y _ {2}) \dots f (y _ {n}) & a <   y _ {1} <   y _ {2} <   \dots <   y _ {n} <   b \\ 0 & \text {e l s e w h e r e ,} \end{array} \right. \\ \end{array}
$$

as was to be proved.

Example 4.4.1. Let $X$ denote a random variable of the continuous type with a pdf $f(x)$ that is positive and continuous, with support $S = (a,b), -\infty \leq a < b \leq \infty$ . The distribution function $F(x)$ of $X$ may be written

$$
F (x) = \int_ {a} ^ {x} f (w) d w, \quad a <   x <   b.
$$

If $x \leq a$ , $F(x) = 0$ ; and if $b \leq x$ , $F(x) = 1$ . Thus there is a unique median $m$ of the distribution with $F(m) = \frac{1}{2}$ . Let $X_{1}, X_{2}, X_{3}$ denote a random sample from this distribution and let $Y_{1} < Y_{2} < Y_{3}$ denote the order statistics of the sample. Note that $Y_{2}$ is the sample median. We compute the probability that $Y_{2} \leq m$ . The joint pdf of the three order statistics is

$$
g (y _ {1}, y _ {2}, y _ {3}) = \left\{ \begin{array}{l l} 6 f (y _ {1}) f (y _ {2}) f (y _ {3}) & a <   y _ {1} <   y _ {2} <   y _ {3} <   b \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

The pdf of $Y_{2}$ is then

$$
\begin{array}{l} h \left(y _ {2}\right) = 6 f \left(y _ {2}\right) \int_ {y _ {2}} ^ {b} \int_ {a} ^ {y _ {2}} f \left(y _ {1}\right) f \left(y _ {3}\right) d y _ {1} d y _ {3} \\ = \left\{ \begin{array}{l l} 6 f (y _ {2}) F (y _ {2}) [ 1 - F (y _ {2}) ] & a <   y _ {2} <   b \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \\ \end{array}
$$

Accordingly,

$$
\begin{array}{l} P \left(Y _ {2} \leq m\right) = 6 \int_ {a} ^ {m} \left\{F \left(y _ {2}\right) f \left(y _ {2}\right) - \left[ F \left(y _ {2}\right) \right] ^ {2} f \left(y _ {2}\right) \right\} d y _ {2} \\ = 6 \left\{\frac {[ F (y _ {2}) ] ^ {2}}{2} - \frac {[ F (y _ {2}) ] ^ {3}}{3} \right\} _ {a} ^ {m} = \frac {1}{2}. \\ \end{array}
$$

Hence, for this situation, the median of the sample median $Y_{2}$ is the population median $m$ .

Once it is observed that

$$
\int_ {a} ^ {x} [ F (w) ] ^ {\alpha - 1} f (w) d w = \frac {[ F (x) ] ^ {\alpha}}{\alpha}, \quad \alpha > 0,
$$

and that

$$
\int_ {y} ^ {b} [ 1 - F (w) ] ^ {\beta - 1} f (w) d w = \frac {[ 1 - F (y) ] ^ {\beta}}{\beta}, \quad \beta > 0,
$$

it is easy to express the marginal pdf of any order statistic, say $Y_{k}$ , in terms of $F(x)$ and $f(x)$ . This is done by evaluating the integral

$$
g _ {k} (y _ {k}) = \int_ {a} ^ {y _ {k}} \dots \int_ {a} ^ {y _ {2}} \int_ {y _ {k}} ^ {b} \dots \int_ {y _ {n - 1}} ^ {b} n! f (y _ {1}) f (y _ {2}) \dots f (y _ {n}) d y _ {n} \dots d y _ {k + 1} d y _ {1} \dots d y _ {k - 1}.
$$

The result is

$$
g _ {k} \left(y _ {k}\right) = \left\{ \begin{array}{l l} \frac {n !}{(k - 1) ! (n - k) !} \left[ F \left(y _ {k}\right) \right] ^ {k - 1} \left[ 1 - F \left(y _ {k}\right) \right] ^ {n - k} f \left(y _ {k}\right) & a <   y _ {k} <   b \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {4.4.2}
$$

Example 4.4.2. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4}$ denote the order statistics of a random sample of size 4 from a distribution having pdf

$$
f (x) = \left\{ \begin{array}{l l} 2 x & 0 <   x <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

We express the pdf of $Y_{3}$ in terms of $f(x)$ and $F(x)$ and then compute $P\left(\frac{1}{2} < Y_{3}\right)$ . Here $F(x) = x^{2}$ , provided that $0 < x < 1$ , so that

$$
g _ {3} (y _ {3}) = \left\{ \begin{array}{l l} \frac {4 !}{2 !   1 !} (y _ {3} ^ {2}) ^ {2} (1 - y _ {3} ^ {2}) (2 y _ {3}) & 0 <   y _ {3} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Thus

$$
\begin{array}{l} P \left(\frac {1}{2} <   Y _ {3}\right) = \int_ {1 / 2} ^ {\infty} g _ {3} \left(y _ {3}\right) d y _ {3} \\ = \int_ {1 / 2} ^ {1} 2 4 \left(y _ {3} ^ {5} - y _ {3} ^ {7}\right) d y _ {3} = \frac {2 4 3}{2 5 6}. \\ \end{array}
$$

Finally, the joint pdf of any two order statistics, say $Y_{i} < Y_{j}$ , is easily expressed in terms of $F(x)$ and $f(x)$ . We have

$$
\begin{array}{l} g _ {i j} \left(y _ {i}, y _ {j}\right) = \int_ {a} ^ {y _ {i}} \dots \int_ {a} ^ {y _ {2}} \int_ {y _ {i}} ^ {y _ {j}} \dots \int_ {y _ {j - 2}} ^ {y _ {j}} \int_ {y _ {j}} ^ {b} \dots \int_ {y _ {n - 1}} ^ {b} n! f \left(y _ {1}\right) \times \dots \\ \times f (y _ {n}) d y _ {n} \dots d y _ {j + 1} d y _ {j - 1} \dots d y _ {i + 1} d y _ {1} \dots d y _ {i - 1}. \\ \end{array}
$$

Since, for $\gamma > 0$ ,

$$
\begin{array}{l} \int_ {x} ^ {y} [ F (y) - F (w) ] ^ {\gamma - 1} f (w) d w = - \frac {[ F (y) - F (w) ] ^ {\gamma}}{\gamma} \Big | _ {x} ^ {y} \\ = \frac {[ F (y) - F (x) ] ^ {\gamma}}{\gamma}, \\ \end{array}
$$

it is found that

$$
g _ {i j} \left(y _ {i}, y _ {j}\right) = \left\{ \begin{array}{l l} \frac {n !}{(i - 1) ! (j - i - 1) ! (n - j) !} \left[ F \left(y _ {i}\right) \right] ^ {i - 1} \left[ F \left(y _ {j}\right) - F \left(y _ {i}\right) \right] ^ {j - i - 1} \\ \times \left[ 1 - F \left(y _ {j}\right) \right] ^ {n - j} f \left(y _ {i}\right) f \left(y _ {j}\right) & a <   y _ {i} <   y _ {j} <   b \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {4.4.3}
$$

Remark 4.4.1 (Heuristic Derivation). There is an easy method of remembering the pdf of a vector of order statistics such as the one given in formula (4.4.3). The probability $P(y_{i} < Y_{i} < y_{i} + \Delta_{i}, y_{j} < Y_{j} < y_{j} + \Delta_{j})$ , where $\Delta_{i}$ and $\Delta_{j}$ are small, can be approximated by the following multinomial probability. In $n$ independent trials, $i - 1$ outcomes must be less than $y_{i}$ [an event that has probability $p_{1} = F(y_{i})$ on each trial]; $j - i - 1$ outcomes must be between $y_{i} + \Delta_{i}$ and $y_{j}$ [an event with approximate probability $p_{2} = F(y_{j}) - F(y_{i})$ on each trial]; $n - j$ outcomes must be greater than $y_{j} + \Delta_{j}$ [an event with approximate probability $p_{3} = 1 - F(y_{j})$ on each trial]; one outcome must be between $y_{i}$ and $y_{i} + \Delta_{i}$ [an event with approximate probability $p_{4} = f(y_{i})\Delta_{i}$ on each trial]; and, finally, one outcome must be between $y_{j}$ and $y_{j} + \Delta_{j}$ [an event with approximate probability $p_{5} = f(y_{j})\Delta_{j}$ on each trial]. This multinomial probability is

$$
\frac {n !}{(i - 1) ! (j - i - 1) ! (n - j) ! 1 ! 1 !} p _ {1} ^ {i - 1} p _ {2} ^ {j - i - 1} p _ {3} ^ {n - j} p _ {4} p _ {5},
$$

which is $g_{i,j}(y_i,y_j)\Delta_i\Delta_j$ , where $g_{i,j}(y_i,y_j)$ is given in expression (4.4.3).

Certain functions of the order statistics $Y_{1}, Y_{2}, \ldots, Y_{n}$ are important statistics themselves. The sample range of the random sample is given by $Y_{n} - Y_{1}$ and the sample midrange is given by $(Y_{1} + Y_{n}) / 2$ , which is called the midrange of the random sample. The sample median of the random sample is defined by

$$
Q _ {2} = \left\{ \begin{array}{l l} Y _ {(n + 1) / 2} & \text {i f n i s o d d} \\ \left(Y _ {n / 2} + Y _ {(n / 2) + 1}\right) / 2 & \text {i f n i s e v e n .} \end{array} \right. \tag {4.4.4}
$$

Example 4.4.3. Let $Y_{1}$ , $Y_{2}$ , $Y_{3}$ be the order statistics of a random sample of size 3 from a distribution having pdf

$$
f (x) = \left\{ \begin{array}{l l} 1 & 0 <   x <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

We seek the pdf of the sample range $Z_{1} = Y_{3} - Y_{1}$ . Since $F(x) = x$ , $0 < x < 1$ , the joint pdf of $Y_{1}$ and $Y_{3}$ is

$$
g _ {1 3} (y _ {1}, y _ {3}) = \left\{ \begin{array}{l l} 6 (y _ {3} - y _ {1}) & 0 <   y _ {1} <   y _ {3} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

In addition to $Z_{1} = Y_{3} - Y_{1}$ , let $Z_{2} = Y_{3}$ . The functions $z_{1} = y_{3} - y_{1}$ , $z_{2} = y_{3}$ have respective inverses $y_{1} = z_{2} - z_{1}$ , $y_{3} = z_{2}$ , so that the corresponding Jacobian of the one-to-one transformation is

$$
J = \left| \begin{array}{c c} \frac {\partial y _ {1}}{\partial z _ {1}} & \frac {\partial y _ {1}}{\partial z _ {2}} \\ \frac {\partial y _ {3}}{\partial z _ {1}} & \frac {\partial y _ {3}}{\partial z _ {2}} \end{array} \right| = \left| \begin{array}{c c} - 1 & 1 \\ 0 & 1 \end{array} \right| = - 1.
$$

Thus the joint pdf of $Z_{1}$ and $Z_{2}$ is

$$
h (z _ {1}, z _ {2}) = \left\{ \begin{array}{l l} | - 1 | 6 z _ {1} = 6 z _ {1} & 0 <   z _ {1} <   z _ {2} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Accordingly, the pdf of the range $Z_{1} = Y_{3} - Y_{1}$ of the random sample of size 3 is

$$
h _ {1} (z _ {1}) = \left\{ \begin{array}{l l} \int_ {z _ {1}} ^ {1} 6 z _ {1}   d z _ {2} = 6 z _ {1} (1 - z _ {1}) & 0 <   z _ {1} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

# 4.4.1 Quantiles

Let $X$ be a random variable with a continuous cdf $F(x)$ . For $0 < p < 1$ , define the $p$ th quantile of $X$ to be $\xi_p = F^{-1}(p)$ . For example, $\xi_{0.5}$ , the median of $X$ , is the 0.5 quantile. Let $X_1, X_2, \ldots, X_n$ be a random sample from the distribution of $X$ and let $Y_1 < Y_2 < \dots < Y_n$ be the corresponding order statistics. Let $k$ be the greatest integer less than or equal to $[p(n + 1)]$ . We next define an estimator of $\xi_p$ after making the following observation. The area under the pdf $f(x)$ to the left of $Y_k$ is $F(Y_k)$ . The expected value of this area is

$$
E (F (Y _ {k})) = \int_ {a} ^ {b} F (y _ {k}) g _ {k} (y _ {k}) d y _ {k},
$$

where $g_{k}(y_{k})$ is the pdf of $Y_{k}$ given in expression (4.4.2). If, in this integral, we make a change of variables through the transformation $z = F(y_{k})$ , we have

$$
E (F (Y _ {k})) = \int_ {0} ^ {1} \frac {n !}{(k - 1) ! (n - k) !} z ^ {k} (1 - z) ^ {n - k} d z.
$$

Comparing this to the integral of a beta pdf, we see that it is equal to

$$
E (F (Y _ {k})) = \frac {n ! k ! (n - k) !}{(k - 1) ! (n - k) ! (n + 1) !} = \frac {k}{n + 1}.
$$

On the average, there is $k / (n + 1)$ of the total area to the left of $Y_{k}$ . Because $p \doteq k / (n + 1)$ , it seems reasonable to take $Y_{k}$ as an estimator of the quantile $\xi_{p}$ . Hence, we call $Y_{k}$ the $p$ th sample quantile. It is also called the 100th percentile of the sample.

Remark 4.4.2. Some statisticians define sample quantiles slightly differently from what we have. For one modification with $1 / (n + 1) < p < n / (n + 1)$ , if $(n + 1) / p$ is not equal to an integer, then the $p$ th quantile of the sample may be defined as follows. Write $(n + 1)p = k + r$ , where $k = [(n + 1)p]$ and $r$ is a proper fraction, using the weighted average. Then the $p$ th quantile of the sample is the weighted average

$$
(1 - r) Y _ {k} + r Y _ {k + 1}, \tag {4.4.5}
$$

which is an estimator of the $p$ th quantile. As $n$ becomes large, however, all these modified definitions are essentially the same. For $\mathbf{R}$ code, let the $\mathbf{R}$ vector $\mathbf{x}$ contain the realization of the sample. Then the call quantile(x,p) computes a $p$ th quantile of form (4.4.5).

Sample quantiles are useful descriptive statistics. For instance, if $y_{k}$ is the $p$ th quantile of the realized sample, then we know that approximately $p100\%$ of the data are less than or equal to $y_{k}$ and approximately $(1 - p)100\%$ of the data are greater than or equal to $y_{k}$ . Next we discuss two statistical applications of quantiles.

A five-number summary of the data consists of the following five sample quantiles: the minimum $(Y_{1})$ , the first quartile $(Y_{25(n + 1)})$ , the median defined in expression (4.4.4), the third quartile $(Y_{75(n + 1)})$ , and the maximum $(Y_{n})$ . For this section, we use the notation $Q_{1}$ , $Q_{2}$ , and $Q_{3}$ to denote, respectively, the first quartile, median, and third quartile of the sample.

The five-number summary divides the data into their quartiles, offering a simple and easily interpretable description of the data. Five-number summaries were made popular by the work of the late Professor John Tukey [see Tukey (1977) and Mosteller and Tukey (1977)]. Tukey used the median of the lower half of the data (from minimum to median) and the median of the upper half of the data instead of the first and third quartiles. He referred to these quantities as the hinges of the data. The R function `fivenum(x)` returns the hinges along with the minimum, median, and maximum of the data.

Example 4.4.4. The following data are the ordered realizations of a random sample of size 15 on a random variable $X$ .

<table><tr><td>56</td><td>70</td><td>89</td><td>94</td><td>96</td><td>101</td><td>102</td><td>102</td></tr><tr><td>102</td><td>105</td><td>106</td><td>108</td><td>110</td><td>113</td><td>116</td><td></td></tr></table>

For these data, since $n + 1 = 16$ , the realizations of the five-number summary are $y_{1} = 56$ , $Q_{1} = y_{4} = 94$ , $Q_{2} = y_{8} = 102$ , $Q_{3} = y_{12} = 108$ , and $y_{15} = 116$ . Hence, based on the five-number summary, the data range from 56 to 116; the middle $50\%$ of the data range from 94 to 108; and the middle of the data occurred at 102. The data are in the file eg4.4.data.rda.

The five-number summary is the basis for a useful and quick plot of the data. This is called a boxplot of the data. The box encloses the middle $50\%$ of the data and a line segment is usually used to indicate the median. The extreme order statistics, however, are very sensitive to outlying points. So care must be used in placing these on the plot. We make use of the box and whisker plots defined by John Tukey. In order to define this plot, we need to define a potential outlier. Let $h = 1.5(Q_3 - Q_1)$ and define the lower fence $(LF)$ and the upper fence $(UF)$ by

$$
L F = Q _ {1} - h \text {a n d} U F = Q _ {3} + h. \tag {4.4.6}
$$

Points that lie outside the fences, i.e., outside the interval $(LF, UF)$ , are called potential outliers and they are denoted by the symbol "0" on the boxplot. The whiskers then protrude from the sides of the box to what are called the adjacent points, which are the points within the fences but closest to the fences. Exercise 4.4.2 shows that the probability of an observation from a normal distribution being a potential outlier is 0.006977.

Example 4.4.5 (Example 4.4.4, Continued). Consider the data given in Example 4.4.4. For these data, $h = 1.5(108 - 94) = 21$ , $LF = 73$ , and $UF = 129$ . Hence the observations 56 and 70 are potential outliers. There are no outliers on the high side of the data. The lower adjacent point is 89. The boxplot of the data set is given in Panel A of Figure 4.4.1, which was computed by the R segment boxplot(x) where the R vector x contains the data.

Note that the point 56 is over $2h$ from $Q_{1}$ . Some statisticians call such a point an "outlier" and label it with a symbol other than "O," but we do not make this distinction.

In practice, we often assume that the data follow a certain distribution. For example, we may assume that $X_{1},\ldots ,X_{n}$ are a random sample from a normal distribution with unknown mean and variance. Thus the form of the distribution of $X$ is known, but the specific parameters are not. Such an assumption needs to be checked and there are many statistical tests which do so; see D'Agostino and Stephens (1986) for a thorough discussion of such tests. As our second statistical application of quantiles, we discuss one such diagnostic plot in this regard.

We consider the location and scale family. Suppose $X$ is a random variable with cdf $F((x - a) / b)$ , where $F(x)$ is known but $a$ and $b > 0$ may not be. Let $Z = (X - a) / b$ ; then $Z$ has cdf $F(z)$ . Let $0 < p < 1$ and let $\xi_{X,p}$ be the $p$ th quantile of $X$ . Let $\xi_{Z,p}$ be the $p$ th quantile of $Z = (X - a) / b$ . Because $F(z)$ is known, $\xi_{Z,p}$ is known. But

$$
p = P [ X \leq \xi_ {X, p} ] = P \left[ Z \leq \frac {\xi_ {X , p} - a}{b} \right],
$$

![](images/ae6a7250d73b73d03e9ad4d5a4870ba44c3a385a9caf12b2fb4fe2096e7b9a60.jpg)  
Figure 4.4.1: Boxplot and quantile plots for the data of Example 4.4.4.

from which we have the linear relationship

$$
\xi_ {X, p} = b \xi_ {Z, p} + a. \tag {4.4.7}
$$

Thus, if $X$ has a cdf of the form of $F((x - a) / b)$ , then the quantiles of $X$ are linearly related to the quantiles of $Z$ . Of course, in practice, we do not know the quantiles of $X$ , but we can estimate them. Let $X_{1},\ldots ,X_{n}$ be a random sample from the distribution of $X$ and let $Y_{1} < \dots < Y_{n}$ be the order statistics. For $k = 1,\dots ,n$ , let $p_k = k / (n + 1)$ . Then $Y_{k}$ is an estimator of $\xi_{X,p_k}$ . Denote the corresponding quantiles of the cdf $F(z)$ by $\xi_{Z,p_k} = F^{-1}(p_k)$ . Let $y_{k}$ denote the realized value of $Y_{k}$ . The plot of $y_{k}$ versus $\xi_{Z,p_k}$ is called a $\mathbf{q} - \mathbf{q}$ plot, as it plots one set of quantiles from the sample against another set from the theoretical cdf $F(z)$ . Based on the above discussion, the linearity of such a plot indicates that the cdf of $X$ is of the form $F((x - a) / b)$ .

Example 4.4.6 (Example 4.4.5, Continued). Panels B, C, and D of Figure 4.4.1 contain $q - q$ plots of the data of Example 4.4.4 for three different distributions. The quantiles of a standard normal random variable are used for the plot in Panel B. Hence, as described above, this is the plot of $y_{k}$ versus $\Phi^{-1}(k / (n + 1))$ , for $k = 1,2,\ldots ,n$ . For Panel C, the population quantiles of the standard Laplace distribution are used; that is, the density of $Z$ is $f(z) = (1 / 2)e^{-|z|}$ , $-\infty < z < \infty$ . For Panel D, the quantiles were generated from an exponential distribution with density $f(z) = e^{-z}$ , $0 < z < \infty$ , zero elsewhere. The generation of these quantiles is discussed in Exercise 4.4.1.

The plot farthest from linearity is that of Panel D. Note that this plot gives an indication of a more correct distribution. For the points to lie on a line, the

lower quantiles of $Z$ must be spread out as are the higher quantiles; i.e., symmetric distributions may be more appropriate. The plots in Panels B and C are more linear than that of Panel D, but they still contain some curvature. Of the two, Panel C appears to be more linear. Actually, the data were generated from a Laplace distribution, so one would expect that Panel C would be the most linear of the three plots.

Many computer packages have commands to obtain the population quantiles used in this example. The R function qqplotc4s2.r, at the site listed in Chapter 1, obtains the normal, Laplace, and exponential quantiles used for Figure 4.4.1 and the plot. The call is qqplotc4s2(x) where the R vector $\mathbf{x}$ contains the data.

The $q - q$ plot using normal quantiles is often called a normal $q - q$ plot. If the data are in the R vector $\mathbf{x}$ , the plot is obtained by the call qqnorm(x).

# 4.4.2 Confidence Intervals for Quantiles

Let $X$ be a continuous random variable with cdf $F(x)$ . For $0 < p < 1$ , define the 100th distribution percentile to be $\xi_p$ , where $F(\xi_p) = p$ . For a sample of size $n$ on $X$ , let $Y_1 < Y_2 < \dots < Y_n$ be the order statistics. Let $k = [(n + 1)p]$ . Then the 100th sample percentile $Y_k$ is a point estimate of $\xi_p$ .

We now derive a distribution free confidence interval for $\xi_p$ , meaning it is a confidence interval for $\xi_p$ which is free of any assumptions about $F(x)$ other than it is of the continuous type. Let $i < [(n + 1)p] < j$ , and consider the order statistics $Y_i < Y_j$ and the event $Y_i < \xi_p < Y_j$ . For the $i$ th order statistic $Y_i$ to be less than $\xi_p$ , it must be true that at least $i$ of the $X$ values are less than $\xi_p$ . Moreover, for the $j$ th order statistic to be greater than $\xi_p$ , fewer than $j$ of the $X$ values are less than $\xi_p$ . To put this in the context of a binomial distribution, the probability of success is $P(X < \xi_p) = F(\xi_p) = p$ . Further, the event $Y_i < \xi_p < Y_j$ is equivalent to obtaining between $i$ (inclusive) and $j$ (exclusive) successes in $n$ independent trials. Thus, taking probabilities, we have

$$
P \left(Y _ {i} <   \xi_ {p} <   Y _ {j}\right) = \sum_ {w = i} ^ {j - 1} \binom {n} {w} p ^ {w} (1 - p) ^ {n - w}. \tag {4.4.8}
$$

When particular values of $n$ , $i$ , and $j$ are specified, this probability can be computed. By this procedure, suppose that it has been found that $\gamma = P(Y_i < \xi_p < Y_j)$ . Then the probability is $\gamma$ that the random interval $(Y_i, Y_j)$ includes the quantile of order $p$ . If the experimental values of $Y_i$ and $Y_j$ are, respectively, $y_i$ and $y_j$ , the interval $(y_i, y_j)$ serves as a $100\gamma \%$ confidence interval for $\xi_p$ , the quantile of order $p$ . We use this in the next example to find a confidence interval for the median.

Example 4.4.7 (Confidence Interval for the Median). Let $X$ be a continuous random variable with cdf $F(x)$ . Let $\xi_{1/2}$ denote the median of $F(x)$ ; i.e., $\xi_{1/2}$ solves $F(\xi_{1/2}) = 1/2$ . Suppose $X_1, X_2, \ldots, X_n$ is a random sample from the distribution of $X$ with corresponding order statistics $Y_1 < Y_2 < \dots < Y_n$ . As before, let $Q_2$ denote the sample median, which is a point estimator of $\xi_{1/2}$ . Select $\alpha$ , so that $0 < \alpha < 1$ . Take $c_{\alpha/2}$ to be the $\alpha/2$ th quantile of a binomial $b(n, 1/2)$ distribution;

that is, $P[S \leq c_{\alpha / 2}] = \alpha / 2$ , where $S$ is distributed $b(n, 1/2)$ . Then note also that $P[S \geq n - c_{\alpha / 2}] = \alpha / 2$ . (Because of the discreteness of the binomial distribution, either take a value of $\alpha$ for which these probabilities are correct or change the equalities to approximations.) Thus it follows from expression (4.4.8) that

$$
P \left[ Y _ {c _ {\alpha / 2} + 1} <   \xi_ {1 / 2} <   Y _ {n - c _ {\alpha / 2}} \right] = 1 - \alpha . \tag {4.4.9}
$$

Hence, when the sample is drawn, if $y_{c_{\alpha /2} + 1}$ and $y_{n - c_{\alpha /2}}$ are the realized values of the order statistics $Y_{c_{\alpha /2} + 1}$ and $Y_{n - c_{\alpha /2}}$ , then the interval

$$
\left(y _ {c _ {\alpha / 2} + 1}, y _ {n - c _ {\alpha / 2}}\right) \tag {4.4.10}
$$

is a $(1 - \alpha)100\%$ confidence interval for $\xi_{1 / 2}$ .

To illustrate this confidence interval, consider the data of Example 4.4.4. Suppose we want an $88\%$ confidence interval for $\xi_{1/2}$ . Then $\alpha / 2 = 0.060$ . Then $c_{\alpha / 2} = 4$ because $P[S \leq 4] = \mathrm{pbinom}(4, 15, .5) = 0.059$ , where the distribution of $S$ is binomial with $n = 15$ and $p = 0.5$ . Therefore, an $88\%$ confidence interval for $\xi_{1/2}$ is $(y_5, y_{11}) = (96, 106)$ .

The R function `onesampsgn(x)` computes a confidence interval for the median. For the data in Example 4.4.4, the code `onesampsgn(x, alpha=.12)` computes the confidence interval (96, 106) for the median.

Note that because of the discreteness of the binomial distribution, only certain confidence levels are possible for this confidence interval for the median. If we further assume that $f(x)$ is symmetric about $\xi$ , Chapter 10 presents other distribution free confidence intervals where this discreteness is much less of a problem.

# EXERCISES

4.4.1. Obtain closed-form expressions for the distribution quantiles based on the exponential and Laplace distributions as discussed in Example 4.4.6.

4.4.2. Suppose the pdf $f(x)$ is symmetric about 0 with cdf $F(x)$ . Show that the probability of a potential outlier from this distribution is $2F(4q_1)$ , where $F^{-1}(0.25) = q_1$ . Use this to obtain the probability that an observation is a potential outlier for the following distributions.

(a) The underlying distribution is normal. Use the $N(0,1)$ distribution.   
(b) The underlying distribution is logistic; that is, the pdf is given by

$$
f (x) = \frac {e ^ {- x}}{\left(1 + e ^ {- x}\right) ^ {2}}, - \infty <   x <   \infty . \tag {4.4.11}
$$

(c) The underlying distribution is Laplace, with the pdf

$$
f (x) = \frac {1}{2} e ^ {- | x |}, - \infty <   x <   \infty . \tag {4.4.12}
$$

4.4.3. Consider the sample of data (data are in the file ex4.4.3data.rda):

<table><tr><td>13</td><td>5</td><td>202</td><td>15</td><td>99</td><td>4</td><td>67</td><td>83</td><td>36</td><td>11</td><td>301</td></tr><tr><td>23</td><td>213</td><td>40</td><td>66</td><td>106</td><td>78</td><td>69</td><td>166</td><td>84</td><td>64</td><td></td></tr></table>

(a) Obtain the five-number summary of these data.   
(b) Determine if there are any outliers.   
(c) Boxplot the data. Comment on the plot.

4.4.4. Consider the data in Exercise 4.4.3. Obtain the normal $q - q$ plot for these data. Does the plot suggest that the underlying distribution is normal? If not, use the plot to determine a more appropriate distribution. Confirm your choice with a $q - q$ based on the quantiles using your chosen distribution.

4.4.5. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4}$ be the order statistics of a random sample of size 4 from the distribution having pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere. Find $P(Y_{4} \geq 3)$ .

4.4.6. Let $X_{1}, X_{2}, X_{3}$ be a random sample from a distribution of the continuous type having pdf $f(x) = 2x$ , $0 < x < 1$ , zero elsewhere.

(a) Compute the probability that the smallest of $X_{1}, X_{2}, X_{3}$ exceeds the median of the distribution.   
(b) If $Y_{1} < Y_{2} < Y_{3}$ are the order statistics, find the correlation between $Y_{2}$ and $Y_{3}$ .

4.4.7. Let $f(x) = \frac{1}{6}$ , $x = 1,2,3,4,5,6$ , zero elsewhere, be the pmf of a distribution of the discrete type. Show that the pmf of the smallest observation of a random sample of size 5 from this distribution is

$$
g _ {1} (y _ {1}) = \left(\frac {7 - y _ {1}}{6}\right) ^ {5} - \left(\frac {6 - y _ {1}}{6}\right) ^ {5}, y _ {1} = 1, 2, \ldots , 6,
$$

zero elsewhere. Note that in this exercise the random sample is from a distribution of the discrete type. All formulas in the text were derived under the assumption that the random sample is from a distribution of the continuous type and are not applicable. Why?

4.4.8. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4} < Y_{5}$ denote the order statistics of a random sample of size 5 from a distribution having pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere. Show that $Z_{1} = Y_{2}$ and $Z_{2} = Y_{4} - Y_{2}$ are independent.

Hint: First find the joint pdf of $Y_{2}$ and $Y_{4}$ .

4.4.9. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from a distribution with pdf $f(x) = 1$ , $0 < x < 1$ , zero elsewhere. Show that the $k$ th order statistic $Y_{k}$ has a beta pdf with parameters $\alpha = k$ and $\beta = n - k + 1$ .

4.4.10. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics from a Weibull distribution, Exercise 3.3.26. Find the distribution function and pdf of $Y_{1}$ .

4.4.11. Find the probability that the range of a random sample of size 4 from the uniform distribution having the pdf $f(x) = 1$ , $0 < x < 1$ , zero elsewhere, is less than $\frac{1}{2}$ .

4.4.12. Let $Y_{1} < Y_{2} < Y_{3}$ be the order statistics of a random sample of size 3 from a distribution having the pdf $f(x) = 2x$ , $0 < x < 1$ , zero elsewhere. Show that $Z_{1} = Y_{1} / Y_{2}$ , $Z_{2} = Y_{2} / Y_{3}$ , and $Z_{3} = Y_{3}$ are mutually independent.

4.4.13. Suppose a random sample of size 2 is obtained from a distribution that has pdf $f(x) = 2(1 - x)$ , $0 < x < 1$ , zero elsewhere. Compute the probability that one sample observation is at least twice as large as the other.

4.4.14. Let $Y_{1} < Y_{2} < Y_{3}$ denote the order statistics of a random sample of size 3 from a distribution with pdf $f(x) = 1$ , $0 < x < 1$ , zero elsewhere. Let $Z = (Y_{1} + Y_{3}) / 2$ be the midrange of the sample. Find the pdf of $Z$ .

4.4.15. Let $Y_{1} < Y_{2}$ denote the order statistics of a random sample of size 2 from $N(0, \sigma^2)$ .

(a) Show that $E(Y_{1}) = -\sigma / \sqrt{\pi}$ .

Hint: Evaluate $E(Y_{1})$ by using the joint pdf of $Y_{1}$ and $Y_{2}$ and first integrating on $y_{1}$ .

(b) Find the covariance of $Y_{1}$ and $Y_{2}$ .

4.4.16. Let $Y_{1} < Y_{2}$ be the order statistics of a random sample of size 2 from a distribution of the continuous type which has pdf $f(x)$ such that $f(x) > 0$ , provided that $x \geq 0$ , and $f(x) = 0$ elsewhere. Show that the independence of $Z_{1} = Y_{1}$ and $Z_{2} = Y_{2} - Y_{1}$ characterizes the gamma pdf $f(x)$ , which has parameters $\alpha = 1$ and $\beta > 0$ . That is, show that $Y_{1}$ and $Y_{2}$ are independent if and only if $f(x)$ is the pdf of a $\Gamma(1, \beta)$ distribution.

Hint: Use the change-of-variable technique to find the joint pdf of $Z_{1}$ and $Z_{2}$ from that of $Y_{1}$ and $Y_{2}$ . Accept the fact that the functional equation $h(0)h(x + y) \equiv h(x)h(y)$ has the solution $h(x) = c_{1}e^{c_{2}x}$ , where $c_{1}$ and $c_{2}$ are constants.

4.4.17. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4}$ be the order statistics of a random sample of size $n = 4$ from a distribution with pdf $f(x) = 2x$ , $0 < x < 1$ , zero elsewhere.

(a) Find the joint pdf of $Y_{3}$ and $Y_{4}$ .

(b) Find the conditional pdf of $Y_{3}$ , given $Y_{4} = y_{4}$ .

(c) Evaluate $E(Y_{3}|y_{4})$ .

4.4.18. Two numbers are selected at random from the interval $(0,1)$ . If these values are uniformly and independently distributed, by cutting the interval at these numbers, compute the probability that the three resulting line segments can form a triangle.

4.4.19. Let $X$ and $Y$ denote independent random variables with respective probability density functions $f(x) = 2x$ , $0 < x < 1$ , zero elsewhere, and $g(y) = 3y^2$ , $0 < y < 1$ , zero elsewhere. Let $U = \min(X, Y)$ and $V = \max(X, Y)$ . Find the joint pdf of $U$ and $V$ .

Hint: Here the two inverse transformations are given by $x = u$ , $y = v$ and $x = v$ , $y = u$ .

4.4.20. Let the joint pdf of $X$ and $Y$ be $f(x, y) = \frac{12}{7} x(x + y)$ , $0 < x < 1$ , $0 < y < 1$ , zero elsewhere. Let $U = \min(X, Y)$ and $V = \max(X, Y)$ . Find the joint pdf of $U$ and $V$ .

4.4.21. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a distribution of either type. A measure of spread is Gini's mean difference

$$
G = \sum_ {j = 2} ^ {n} \sum_ {i = 1} ^ {j - 1} | X _ {i} - X _ {j} | / \binom {n} {2}. \tag {4.4.13}
$$

(a) If $n = 10$ , find $a_1, a_2, \ldots, a_{10}$ so that $G = \sum_{i=1}^{10} a_i Y_i$ , where $Y_1, Y_2, \ldots, Y_{10}$ are the order statistics of the sample.   
(b) Show that $E(G) = 2\sigma / \sqrt{\pi}$ if the sample arises from the normal distribution $N(\mu, \sigma^2)$ .

4.4.22. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from the exponential distribution with pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere.

(a) Show that $Z_{1} = nY_{1}$ , $Z_{2} = (n - 1)(Y_{2} - Y_{1})$ , $Z_{3} = (n - 2)(Y_{3} - Y_{2})$ , ..., $Z_{n} = Y_{n} - Y_{n - 1}$ are independent and that each $Z_{i}$ has the exponential distribution.   
(b) Demonstrate that all linear functions of $Y_{1}, Y_{2}, \ldots, Y_{n}$ , such as $\sum_{1}^{n} a_{i} Y_{i}$ , can be expressed as linear functions of independent random variables.

4.4.23. In the Program Evaluation and Review Technique (PERT), we are interested in the total time to complete a project that is comprised of a large number of subprojects. For illustration, let $X_{1}$ , $X_{2}$ , $X_{3}$ be three independent random times for three subprojects. If these subprojects are in series (the first one must be completed before the second starts, etc.), then we are interested in the sum $Y = X_{1} + X_{2} + X_{3}$ . If these are in parallel (can be worked on simultaneously), then we are interested in $Z = \max(X_{1}, X_{2}, X_{3})$ . In the case each of these random variables has the uniform distribution with pdf $f(x) = 1$ , $0 < x < 1$ , zero elsewhere, find (a) the pdf of $Y$ and (b) the pdf of $Z$ .

4.4.24. Let $Y_{n}$ denote the $n$ th order statistic of a random sample of size $n$ from a distribution of the continuous type. Find the smallest value of $n$ for which the inequality $P(\xi_{0.9} < Y_n) \geq 0.75$ is true.

4.4.25. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4} < Y_{5}$ denote the order statistics of a random sample of size 5 from a distribution of the continuous type. Compute:

(a) $P(Y_{1} < \xi_{0.5} < Y_{5})$   
(b) $P(Y_{1} <   \xi_{0.25} <   Y_{3})$   
(c) $P(Y_{4} < \xi_{0.80} < Y_{5})$

4.4.26. Compute $P(Y_{3} < \xi_{0.5} < Y_{7})$ if $Y_{1} < \dots < Y_{9}$ are the order statistics of a random sample of size 9 from a distribution of the continuous type.

4.4.27. Find the smallest value of $n$ for which $P(Y_{1} < \xi_{0.5} < Y_{n}) \geq 0.99$ , where $Y_{1} < \dots < Y_{n}$ are the order statistics of a random sample of size $n$ from a distribution of the continuous type.

4.4.28. Let $Y_{1} < Y_{2}$ denote the order statistics of a random sample of size 2 from a distribution that is $N(\mu, \sigma^2)$ , where $\sigma^2$ is known.

(a) Show that $P(Y_{1} < \mu < Y_{2}) = \frac{1}{2}$ and compute the expected value of the random length $Y_{2} - Y_{1}$ .   
(b) If $\overline{X}$ is the mean of this sample, find the constant $c$ that solves the equation $P(\overline{X} - c\sigma < \mu < \overline{X} + c\sigma) = \frac{1}{2}$ , and compare the length of this random interval with the expected value of that of part (a).

4.4.29. Let $y_{1} < y_{2} < y_{3}$ be the observed values of the order statistics of a random sample of size $n = 3$ from a continuous type distribution. Without knowing these values, a statistician is given these values in a random order, and she wants to select the largest; but once she refuses an observation, she cannot go back. Clearly, if she selects the first one, her probability of getting the largest is $1/3$ . Instead, she decides to use the following algorithm: She looks at the first but refuses it and then takes the second if it is larger than the first, or else she takes the third. Show that this algorithm has probability of $1/2$ of selecting the largest.

4.4.30. Refer to Exercise 4.1.1. Using expression (4.4.10), obtain a confidence interval (with confidence close to $90\%$ ) for the median lifetime of a motor. What does the interval mean?

4.4.31. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ denote the order statistics of a random sample of size $n$ from a distribution that has pdf $f(x) = 3x^{2} / \theta^{3}$ , $0 < x < \theta$ , zero elsewhere.

(a) Show that $P(c < Y_n / \theta < 1) = 1 - c^{3n}$ , where $0 < c < 1$ .   
(b) If $n$ is 4 and if the observed value of $Y_{4}$ is 2.3, what is a $95\%$ confidence interval for $\theta$ ?

4.4.32. Reconsider the weight of professional baseball players in the data file bb.rda. Obtain comparison boxplots of the weights of the hitters and pitchers (use the R code boxplot(x,y) where x and y contain the weights of the hitters and pitchers, respectively). Then obtain $95\%$ confidence intervals for the median weights of the hitters and pitchers (use the R function onesampsgn). Comment.

# 4.5 Introduction to Hypothesis Testing

Point estimation and confidence intervals are useful statistical inference procedures. Another type of inference that is frequently used concerns tests of hypotheses. As in Sections 4.1 through 4.3, suppose our interest centers on a random variable $X$ that has density function $f(x; \theta)$ , where $\theta \in \Omega$ . Suppose we think, due to theory or a preliminary experiment, that $\theta \in \omega_0$ or $\theta \in \omega_1$ , where $\omega_0$ and $\omega_1$ are disjoint subsets of $\Omega$ and $\omega_0 \cup \omega_1 = \Omega$ . We label these hypotheses as

$$
H _ {0}: \theta \in \omega_ {0} \text {v e r s u s} H _ {1}: \theta \in \omega_ {1}. \tag {4.5.1}
$$

The hypothesis $H_0$ is referred to as the null hypothesis, while $H_1$ is referred to as the alternative hypothesis. Often the null hypothesis represents no change or no difference from the past, while the alternative represents change or difference. The alternative is often referred to as the research worker's hypothesis. The decision rule to take $H_0$ or $H_1$ is based on a sample $X_1, \ldots, X_n$ from the distribution of $X$ and, hence, the decision could be wrong. For instance, we could decide that $\theta \in \omega_1$ when really $\theta \in \omega_0$ or we could decide that $\theta \in \omega_0$ when, in fact, $\theta \in \omega_1$ . We label these errors Type I and Type II errors, respectively, later in this section. As we show in Chapter 8, a careful analysis of these errors can lead in certain situations to optimal decision rules. In this section, though, we simply want to introduce the elements of hypothesis testing. To set ideas, consider the following example.

Example 4.5.1 (Zea mays Data). In 1878 Charles Darwin recorded some data on the heights of Zea mays plants to determine what effect cross-fertilization or self-fertilization had on the height of Zea mays. The experiment was to select one cross-fertilized plant and one self-fertilized plant, grow them in the same pot, and then later measure their heights. An interesting hypothesis for this example would be that the cross-fertilized plants are generally taller than the self-fertilized plants. This is the alternative hypothesis, i.e., the research worker's hypothesis. The null hypothesis is that the plants generally grow to the same height regardless of whether they were self- or cross-fertilized. Data for 15 pots were recorded.

We represent the data as $(Y_{1},Z_{1}),\ldots ,(Y_{15},Z_{15})$ , where $Y_{i}$ and $Z_{i}$ are the heights of the cross-fertilized and self-fertilized plants, respectively, in the $i$ th pot. Let $X_{i} = Y_{i} - Z_{i}$ . Due to growing in the same pot, $Y_{i}$ and $Z_{i}$ may be dependent random variables, but it seems appropriate to assume independence between pots, i.e., independence between the paired random vectors. So we assume that $X_{1},\ldots ,X_{15}$ form a random sample. As a tentative model, consider the location model

$$
X _ {i} = \mu + e _ {i}, \quad i = 1, \ldots , 1 5,
$$

where the random variables $e_i$ are iid with continuous density $f(x)$ . For this model, there is no loss in generality in assuming that the mean of $e_i$ is 0, for, otherwise, we can simply redefine $\mu$ . Hence, $E(X_i) = \mu$ . Further, the density of $X_i$ is $f_X(x; \mu) = f(x - \mu)$ . In practice, the goodness of the model is always a concern and diagnostics based on the data would be run to confirm the quality of the model.

If $\mu = E(X_{i}) = 0$ , then $E(Y_{i}) = E(Z_{i})$ ; i.e., on average, the cross-fertilized plants grow to the same height as the self-fertilized plants. While, if $\mu > 0$ then

Table 4.5.1: $2 \times 2$ Decision Table for a Hypothesis Test   

<table><tr><td></td><td colspan="2">True State of Nature</td></tr><tr><td>Decision</td><td>H0 is True</td><td>H1 is True</td></tr><tr><td>Reject H0</td><td>Type I Error</td><td>Correct Decision</td></tr><tr><td>Accept H0</td><td>Correct Decision</td><td>Type II Error</td></tr></table>

$E(Y_{i}) > E(Z_{i})$ ; i.e., on average the cross-fertilized plants are taller than the self-fertilized plants. Under this model, our hypotheses are

$$
H _ {0}: \mu = 0 \text {v e r s u s} H _ {1}: \mu > 0. \tag {4.5.2}
$$

Hence, $\omega_0 = \{0\}$ represents no difference in the treatments, while $\omega_{1} = (0,\infty)$ represents that the mean height of cross-fertilized Zea mays exceeds the mean height of self-fertilized Zea mays.

To complete the testing structure for the general problem described at the beginning of this section, we need to discuss decision rules. Recall that $X_{1},\ldots ,X_{n}$ is a random sample from the distribution of a random variable $X$ that has density $f(x;\theta)$ , where $\theta \in \Omega$ . Consider testing the hypotheses $H_0:\theta \in \omega_0$ versus $H_{1}:\theta \in \omega_{1}$ , where $\omega_0\cup \omega_1 = \Omega$ . Denote the space of the sample by $\mathcal{D}$ ; that is, $\mathcal{D} = \text{space}\{(X_1,\dots,X_n)\}$ . A test of $H_0$ versus $H_{1}$ is based on a subset $C$ of $\mathcal{D}$ . This set $C$ is called the critical region and its corresponding decision rule (test) is

$$
\operatorname {R e j e c t} H _ {0} (\text {A c c e p t} H _ {1}) \quad \text {i f} (X _ {1}, \dots , X _ {n}) \in C \tag {4.5.3}
$$

$$
\text {R e t a i n} H _ {0} (\text {R e j e c t} H _ {1}) \quad \text {i f} (X _ {1}, \dots , X _ {n}) \in C ^ {c}.
$$

For a given critical region, the $2 \times 2$ decision table as shown in Table 4.5.1, summarizes the results of the hypothesis test in terms of the true state of nature. Besides the correct decisions, two errors can occur. A Type I error occurs if $H_0$ is rejected when it is true, while a Type II error occurs if $H_0$ is accepted when $H_1$ is true.

The goal, of course, is to select a critical region from all possible critical regions which minimizes the probabilities of these errors. In general, this is not possible. The probabilities of these errors often have a seesaw effect. This can be seen immediately in an extreme case. Simply let $C = \phi$ . With this critical region, we would never reject $H_0$ , so the probability of Type I error would be 0, but the probability of Type II error is 1. Often we consider Type I error to be the worse of the two errors. We then proceed by selecting critical regions that bound the probability of Type I error and then among these critical regions we try to select one that minimizes the probability of Type II error.

Definition 4.5.1. We say a critical region $C$ is of size $\alpha$ if

$$
\alpha = \max  _ {\theta \in \omega_ {0}} P _ {\theta} [ (X _ {1}, \dots , X _ {n}) \in C ]. \tag {4.5.4}
$$

Over all critical regions of size $\alpha$ , we want to consider critical regions that have lower probabilities of Type II error. We also can look at the complement of a Type II error, namely, rejecting $H_0$ when $H_{1}$ is true, which is a correct decision, as marked in Table 4.5.1. Since we desire to maximize the probability of this latter decision, we want the probability of it to be as large as possible. That is, for $\theta \in \omega_{1}$ , we want to maximize

$$
1 - P _ {\theta} [ \text {T y p e I I E r r o r} ] = P _ {\theta} [ (X _ {1}, \dots , X _ {n}) \in C ].
$$

The probability on the right side of this equation is called the power of the test at $\theta$ . It is the probability that the test detects the alternative $\theta$ when $\theta \in \omega_1$ is the true parameter. So minimizing the probability of Type II error is equivalent to maximizing power.

We define the power function of a critical region to be

$$
\gamma_ {C} (\theta) = P _ {\theta} \left[ \left(X _ {1}, \dots , X _ {n}\right) \in C \right]; \quad \theta \in \omega_ {1}. \tag {4.5.5}
$$

Hence, given two critical regions $C_1$ and $C_2$ , which are both of size $\alpha$ , $C_1$ is better than $C_2$ if $\gamma_{C_1}(\theta) \geq \gamma_{C_2}(\theta)$ for all $\theta \in \omega_1$ . In Chapter 8, we obtain optimal critical regions for specific situations. In this section, we want to illustrate these concepts of hypothesis testing with several examples.

Example 4.5.2 (Test for a Binomial Proportion of Success). Let $X$ be a Bernoulli random variable with probability of success $p$ . Suppose we want to test, at size $\alpha$ ,

$$
H _ {0}: p = p _ {0} \text {v e r s u s} H _ {1}: p <   p _ {0}, \tag {4.5.6}
$$

where $p_0$ is specified. As an illustration, suppose "success" is dying from a certain disease and $p_0$ is the probability of dying with some standard treatment. A new treatment is used on several (randomly chosen) patients, and it is hoped that the probability of dying under this new treatment is less than $p_0$ . Let $X_1, \ldots, X_n$ be a random sample from the distribution of $X$ and let $S = \sum_{i=1}^{n} X_i$ be the total number of successes in the sample. An intuitive decision rule (critical region) is

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} S \leq k, \tag {4.5.7}
$$

where $k$ is such that $\alpha = P_{H_0}[S \leq k]$ . Since $S$ has a $b(n, p_0)$ distribution under $H_0$ , $k$ is determined by $\alpha = P_{p_0}[S \leq k]$ . Because the binomial distribution is discrete, however, it is likely that there is no integer $k$ that solves this equation. For example, suppose $n = 20$ , $p_0 = 0.7$ , and $\alpha = 0.15$ . Then under $H_0$ , $S$ has a binomial $b(20, 0.7)$ distribution. Hence, computationally, $P_{H_0}[S \leq 11] = \mathsf{pbinom}(11, 20, 0.7) = 0.1133$ and $P_{H_0}[S \leq 12] = \mathsf{pbinom}(12, 20, 0.7) = 0.2277$ . Hence, erring on the conservative side, we would probably choose $k$ to be 11 and $\alpha = 0.1133$ . As $n$ increases, this is less of a problem; see, also, the later discussion on $p$ -values. In general, the power of the test for the hypotheses (4.5.6) is

$$
\gamma (p) = P _ {p} [ S \leq k ], \quad p <   p _ {0}. \tag {4.5.8}
$$

The curve labeled Test 1 in Figure 4.5.1 is the power function for the case $n = 20$ , $p_0 = 0.7$ , and $\alpha = 0.1133$ . Notice that the power function is decreasing. The

power is higher to detect the alternative $p = 0.2$ than $p = 0.6$ . In Section 8.2, we prove in general the monotonicity of the power function for binomial tests of these hypotheses. Using this monotonicity, we extend our test to the more general null hypothesis $H_0: p \geq p_0$ rather than simply $H_0: p = p_0$ . Using the same decision rule as we used for the hypotheses (4.5.6), the definition of the size of a test (4.5.4), and the monotonicity of the power curve, we have

$$
\max _ {p \geq p _ {0}} P _ {p} [ S \leq k ] = P _ {p _ {0}} [ S \leq k ] = \alpha ,
$$

i.e., the same size as for the original null hypothesis.

![](images/7bab4c367d32ea8d60f64a2ee0071b883feb234a939a4f0d7e491a80d70d7b00.jpg)  
Figure 4.5.1: Power curves for tests 1 and 2; see Example 4.5.2.

Denote by Test 1 the test for the situation with $n = 20$ , $p_0 = 0.70$ , and size $\alpha = 0.1133$ . Suppose we have a second test (Test 2) with an increased size. How does the power function of Test 2 compare to Test 1? As an example, suppose for Test 2, we select $\alpha = 0.2277$ . Hence, for Test 2, we reject $H_0$ if $S \leq 12$ . Figure 4.5.1 displays the resulting power function. Note that while Test 2 has a higher probability of committing a Type I error, it also has a higher power at each alternative $p < 0.7$ . Exercise 4.5.7 shows that this is true for these binomial tests. It is true in general; that is, if the size of the test increases, power does too. For this example, the R function binpower.r, found at the site listed in the Preface, produces a version of Figure 4.5.1.

Remark 4.5.1 (Nomenclature). Since in Example 4.5.2, the first null hypothesis $H_0: p = p_0$ completely specifies the underlying distribution, it is called a simple hypothesis. Most hypotheses, such as $H_1: p < p_0$ , are composite hypotheses, because they are composed of many simple hypotheses and, hence, do not completely specify the distribution.

As we study more and more statistics, we discover that often other names are used for the size, $\alpha$ , of the critical region. Frequently, $\alpha$ is also called the signifi-

cance level of the test associated with that critical region. Moreover, sometimes $\alpha$ is called the "maximum of probabilities of committing an error of Type I" and the "maximum of the power of the test when $H_0$ is true." It is disconcerting to the student to discover that there are so many names for the same thing. However, all of them are used in the statistical literature, and we feel obligated to point out this fact.

The test in the last example is based on the exact distribution of its test statistic, i.e., the binomial distribution. Often we cannot obtain the distribution of the test statistic in closed form. As with approximate confidence intervals, however, we can frequently appeal to the Central Limit Theorem to obtain an approximate test; see Theorem 4.2.1. Such is the case for the next example.

Example 4.5.3 (Large Sample Test for the Mean). Let $X$ be a random variable with mean $\mu$ and finite variance $\sigma^2$ . We want to test the hypotheses

$$
H _ {0}: \mu = \mu_ {0} \text {v e r s u s} H _ {1}: \mu > \mu_ {0}, \tag {4.5.9}
$$

where $\mu_0$ is specified. To illustrate, suppose $\mu_0$ is the mean level on a standardized test of students who have been taught a course by a standard method of teaching. Suppose it is hoped that a new method that incorporates computers has a mean level $\mu > \mu_0$ , where $\mu = E(X)$ and $X$ is the score of a student taught by the new method. This conjecture is tested by having $n$ students (randomly selected) taught under this new method.

Let $X_{1},\ldots ,X_{n}$ be a random sample from the distribution of $X$ and denote the sample mean and variance by $\overline{X}$ and $S^2$ , respectively. Because $\overline{X}$ is an unbiased estimate of $\mu$ , an intuitive decision rule is given by

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} \bar {X} \text {i s m u c h l a r g e r t h a n} \mu_ {0}. \tag {4.5.10}
$$

In general, the distribution of the sample mean cannot be obtained in closed form. In Example 4.5.4, under the strong assumption of normality for the distribution of $X$ , we obtain an exact test. For now, the Central Limit Theorem (Theorem 4.2.1) shows that the distribution of $(\overline{X} - \mu) / (S / \sqrt{n})$ is approximately $N(0,1)$ . Using this, we obtain a test with an approximate size $\alpha$ , with the decision rule

$$
\operatorname {R e j e c t} H _ {0} \text {i n f a v o r o f} H _ {1} \text {i f} \frac {\bar {X} - \mu_ {0}}{S / \sqrt {n}} \geq z _ {\alpha}. \tag {4.5.11}
$$

The test is intuitive. To reject $H_0$ , $\overline{X}$ must exceed $\mu_0$ by at least $z_{\alpha}S / \sqrt{n}$ . To approximate the power function of the test, we use the Central Limit Theorem. Upon substituting $\sigma$ for $S$ , it readily follows that the approximate power function is

$$
\begin{array}{l} \gamma (\mu) = P _ {\mu} (\bar {X} \geq \mu_ {0} + z _ {\alpha} \sigma / \sqrt {n}) \\ = P _ {\mu} \left(\frac {\bar {X} - \mu}{\sigma / \sqrt {n}} \geq \frac {\mu_ {0} - \mu}{\sigma / \sqrt {n}} + z _ {\alpha}\right) \\ \approx \quad 1 - \Phi \left(z _ {\alpha} + \frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma}\right) \\ = \Phi \left(- z _ {\alpha} - \frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma}\right). \tag {4.5.12} \\ \end{array}
$$

So if we have some reasonable idea of what $\sigma$ equals, we can compute the approximate power function. As Exercise 4.5.1 shows, this approximate power function is strictly increasing in $\mu$ , so as in the last example, we can change the null hypotheses to

$$
H _ {0}: \mu \leq \mu_ {0} \text {v e r s u s} H _ {1}: \mu > \mu_ {0}. \tag {4.5.13}
$$

Our asymptotic test has approximate size $\alpha$ for these hypotheses.

Example 4.5.4 (Test for $\mu$ Under Normality). Let $X$ have a $N(\mu, \sigma^2)$ distribution. As in Example 4.5.3, consider the hypotheses

$$
H _ {0}: \mu = \mu_ {0} \text {v e r s u s} H _ {1}: \mu > \mu_ {0}, \tag {4.5.14}
$$

where $\mu_0$ is specified. Assume that the desired size of the test is $\alpha$ , for $0 < \alpha < 1$ . Suppose $X_{1},\ldots ,X_{n}$ is a random sample from a $N(\mu ,\sigma^2)$ distribution. Let $\overline{X}$ and $S^2$ denote the sample mean and variance, respectively. Our intuitive rejection rule is to reject $H_{0}$ in favor of $H_{1}$ if $\overline{X}$ is much larger than $\mu_0$ . Unlike Example 4.5.3, we now know the distribution of the statistic $\overline{X}$ . In particular, by Part (d) of Theorem 3.6.1, under $H_{0}$ the statistic $T = (\overline{X} -\mu_0) / (S / \sqrt{n})$ has a $t$ -distribution with $n - 1$ degrees of freedom. Using the distribution of $T$ , it follows that this rejection rule has exact level $\alpha$ :

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} T = \frac {\bar {X} - \mu_ {0}}{S / \sqrt {n}} \geq t _ {\alpha , n - 1}, \tag {4.5.15}
$$

where $t_{\alpha, n-1}$ is the upper $\alpha$ critical point of a $t$ -distribution with $n-1$ degrees of freedom; i.e., $\alpha = P(T > t_{\alpha, n-1})$ . This is often called the $t$ -test of $H_0: \mu = \mu_0$ .

Note the differences between this rejection rule and the large sample rule, (4.5.11). The large sample rule has approximate level $\alpha$ , while this has exact level $\alpha$ . Of course, we now have to assume that $X$ has a normal distribution. In practice, we may not be willing to assume that the population is normal. Usually $t$ -critical values are larger than $z$ -critical values; hence, the $t$ -test is conservative relative to the large sample test. So, in practice, many statisticians often use the $t$ -test.

The R code t.test(x, mu=mu0, alt="greater") computes the $t$ -test for the hypotheses (4.5.14), where the R vector $\mathbf{x}$ contains the sample.

Example 4.5.5 (Example 4.5.1, Continued). The data for Darwin's experiment on Zea mays are recorded in Table 4.5.2 and are, also, in the file darwin.rda. A boxplot and a normal $q - q$ plot of the 15 differences, $x_{i} = y_{i} - z_{i}$ , are found in Figure 4.5.2. Based on these plots, we can see that there seem to be two outliers, Pots 2 and 15. In these two pots, the self-fertilized Zea mays are much taller than their cross-fertilized pairs. Except for these two outliers, the differences, $y_{i} - z_{i}$ , are positive, indicating that the cross-fertilization leads to taller plants. We proceed to conduct a test of hypotheses (4.5.2), as discussed in Example 4.5.4. We use the decision rule given by (4.5.15) with $\alpha = 0.05$ . As Exercise 4.5.2 shows, the values of the sample mean and standard deviation for the differences, $x_{i}$ , are $\overline{x} = 2.62$ and $s_{x} = 4.72$ . Hence the $t$ -test statistic is 2.15, which exceeds the $t$ -critical value, $t_{.05,14} = \mathrm{qt}(0.95,14) = 1.76$ . Thus we reject $H_{0}$ and conclude that cross-fertilized Zea mays are on the average taller than self-fertilized Zea mays. Because of the

Table 4.5.2: Plant Growth   

<table><tr><td>Pot</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td></tr><tr><td>Cross</td><td>23.500</td><td>12.000</td><td>21.000</td><td>22.000</td><td>19.125</td><td>21.500</td><td>22.125</td><td>20.375</td></tr><tr><td>Self</td><td>17.375</td><td>20.375</td><td>20.000</td><td>20.000</td><td>18.375</td><td>18.625</td><td>18.625</td><td>15.250</td></tr><tr><td>Pot</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td></td></tr><tr><td>Cross</td><td>18.250</td><td>21.625</td><td>23.250</td><td>21.000</td><td>22.125</td><td>23.000</td><td>12.000</td><td></td></tr><tr><td>Self</td><td>16.500</td><td>18.000</td><td>16.250</td><td>18.000</td><td>12.750</td><td>15.500</td><td>18.000</td><td></td></tr></table>

outliers, normality of the error distribution is somewhat dubious, and we use the test in a conservative manner, as discussed at the end of Example 4.5.4.

Assuming that the rda file darwin.rda has been loaded in R, the code for the above $t$ -test is t.test(cross-self, mu=0, alt="greater") which evaluates the $t$ -test statistic to be 2.1506.

![](images/55e0a685eb7b49db83fd1584e0e475c92d8847a8445d3d187bba35e786b58058.jpg)  
Figure 4.5.2: Boxplot and normal $q - q$ plot for the data of Example 4.5.5.

# EXERCISES

In many of these exercises, use R or another statistical package for computations and graphs of power functions.

4.5.1. Show that the approximate power function given in expression (4.5.12) of Example 4.5.3 is a strictly increasing function of $\mu$ . Show then that the test discussed in this example has approximate size $\alpha$ for testing

$$
H _ {0}: \mu \leq \mu_ {0} \text {v e r s u s} H _ {1}: \mu > \mu_ {0}.
$$

4.5.2. For the Darwin data tabled in Example 4.5.5, verify that the Student $t$ -test statistic is 2.15.

4.5.3. Let $X$ have a pdf of the form $f(x; \theta) = \theta x^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere, where $\theta \in \{\theta : \theta = 1, 2\}$ . To test the simple hypothesis $H_0: \theta = 1$ against the alternative simple hypothesis $H_1: \theta = 2$ , use a random sample $X_1, X_2$ of size $n = 2$

and define the critical region to be $C = \{(x_1, x_2) : \frac{3}{4} \leq x_1 x_2\}$ . Find the power function of the test.

4.5.4. Let $X$ have a binomial distribution with the number of trials $n = 10$ and with $p$ either $1/4$ or $1/2$ . The simple hypothesis $H_0: p = \frac{1}{2}$ is rejected, and the alternative simple hypothesis $H_1: p = \frac{1}{4}$ is accepted, if the observed value of $X_1$ , a random sample of size 1, is less than or equal to 3. Find the significance level and the power of the test.

4.5.5. Let $X_1, X_2$ be a random sample of size $n = 2$ from the distribution having pdf $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , zero elsewhere. We reject $H_0: \theta = 2$ and accept $H_1: \theta = 1$ if the observed values of $X_1, X_2$ , say $x_1, x_2$ , are such that

$$
\frac {f (x _ {1} ; 2) f (x _ {2} ; 2)}{f (x _ {1} ; 1) f (x _ {2} ; 1)} \leq \frac {1}{2}.
$$

Here $\Omega = \{\theta : \theta = 1,2\}$ . Find the significance level of the test and the power of the test when $H_0$ is false.

4.5.6. Consider the tests Test 1 and Test 2 for the situation discussed in Example 4.5.2. Consider the test that rejects $H_0$ if $S \leq 10$ . Find the level of significance for this test and sketch its power curve as in Figure 4.5.1.

4.5.7. Consider the situation described in Example 4.5.2. Suppose we have two tests A and B defined as follows. For Test A, $H_0$ is rejected if $S \leq k_A$ , while for Test B, $H_0$ is rejected if $S \leq k_B$ . If Test A has a higher level of significance than Test B, show that Test A has higher power than Test B at each alternative.

4.5.8. Let us say the life of a tire in miles, say $X$ , is normally distributed with mean $\theta$ and standard deviation 5000. Past experience indicates that $\theta = 30,000$ . The manufacturer claims that the tires made by a new process have mean $\theta > 30,000$ . It is possible that $\theta = 35,000$ . Check his claim by testing $H_0: \theta = 30,000$ against $H_1: \theta > 30,000$ . We observe $n$ independent values of $X$ , say $x_1, \ldots, x_n$ , and we reject $H_0$ (thus accept $H_1$ ) if and only if $\overline{x} \geq c$ . Determine $n$ and $c$ so that the power function $\gamma(\theta)$ of the test has the values $\gamma(30,000) = 0.01$ and $\gamma(35,000) = 0.98$ .

4.5.9. Let $X$ have a Poisson distribution with mean $\theta$ . Consider the simple hypothesis $H_0: \theta = \frac{1}{2}$ and the alternative composite hypothesis $H_1: \theta < \frac{1}{2}$ . Thus $\Omega = \{\theta : 0 < \theta \leq \frac{1}{2}\}$ . Let $X_1, \ldots, X_{12}$ denote a random sample of size 12 from this distribution. We reject $H_0$ if and only if the observed value of $Y = X_1 + \dots + X_{12} \leq 2$ . Show that the following R code graphs the power function of this test:

theta=seq(.1,.5,.05); gam=ppois(2,theta*12)

plot(gam~theta,pch=" ",xlabel=expression(theta),ylabel=expression(gamma)) lines(gam~theta)

Run the code. Determine the significance level from the plot.

4.5.10. Let $Y$ have a binomial distribution with parameters $n$ and $p$ . We reject $H_0: p = \frac{1}{2}$ and accept $H_1: p > \frac{1}{2}$ if $Y \geq c$ . Find $n$ and $c$ to give a power function $\gamma(p)$ which is such that $\gamma(\frac{1}{2}) = 0.10$ and $\gamma(\frac{2}{3}) = 0.95$ , approximately.

4.5.11. Let $Y_{1} < Y_{2} < Y_{3} < Y_{4}$ be the order statistics of a random sample of size $n = 4$ from a distribution with pdf $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , zero elsewhere, where $0 < \theta$ . The hypothesis $H_{0}: \theta = 1$ is rejected and $H_{1}: \theta > 1$ is accepted if the observed $Y_{4} \geq c$ .

(a) Find the constant $c$ so that the significance level is $\alpha = 0.05$ .   
(b) Determine the power function of the test.

4.5.12. Let $X_{1}, X_{2}, \ldots, X_{8}$ be a random sample of size $n = 8$ from a Poisson distribution with mean $\mu$ . Reject the simple null hypothesis $H_{0}: \mu = 0.5$ and accept $H_{1}: \mu > 0.5$ if the observed sum $\sum_{i=1}^{8} x_{i} \geq 8$ .

(a) Show that the significance level is 1-ppois(7,8*.5).   
(b) Use R to determine $\gamma (0.75)$ , $\gamma (1)$ , and $\gamma (1.25)$ .   
(c) Modify the code in Exercise 4.5.9 to obtain a plot of the power function.

4.5.13. Let $p$ denote the probability that, for a particular tennis player, the first serve is good. Since $p = 0.40$ , this player decided to take lessons in order to increase $p$ . When the lessons are completed, the hypothesis $H_0: p = 0.40$ is tested against $H_1: p > 0.40$ based on $n = 25$ trials. Let $Y$ equal the number of first serves that are good, and let the critical region be defined by $C = \{Y: Y \geq 13\}$ .

(a) Show that $\alpha$ is computed by $\alpha = 1$ -pbinom(12,25,.4).   
(b) Find $\beta = P(Y < 13)$ when $p = 0.60$ ; that is, $\beta = P(Y \leq 12; p = 0.60)$ so that $1 - \beta$ is the power at $p = 0.60$ .

4.5.14. Let $S$ denote the number of success in $n = 40$ Bernoulli trials with probability of success $p$ . Consider the hypotheses: $H_0: p \leq 0.3$ versus $H_1: p > 0.3$ . Consider the two tests: (1) Reject $H_0$ if $S \geq 16$ and (2) Reject $H_0$ if $S \geq 17$ . Determine the level of these tests. The R function binpower.r produces a version of Figure 4.5.1. For this exercise, write a similar R function that graphs the power functions of the above two tests.

# 4.6 Additional Comments About Statistical Tests

All of the alternative hypotheses considered in Section 4.5 were one-sided hypotheses. For illustration, in Exercise 4.5.8 we tested $H_0: \mu = 30,000$ against the one-sided alternative $H_1: \mu > 30,000$ , where $\mu$ is the mean of a normal distribution having standard deviation $\sigma = 5000$ . Perhaps in this situation, though, we think the manufacturer's process has changed but are unsure of the direction. That is, we are interested in the alternative $H_1: \mu \neq 30,000$ . In this section, we further explore hypotheses testing and we begin with the construction of a test for a two-sided alternative.

Example 4.6.1 (Large Sample Two-Sided Test for the Mean). In order to see how to construct a test for a two-sided alternative, reconsider Example 4.5.3, where we constructed a large sample one-sided test for the mean of a random variable. As in Example 4.5.3, let $X$ be a random variable with mean $\mu$ and finite variance $\sigma^2$ . Here, though, we want to test

$$
H _ {0}: \mu = \mu_ {0} \text {v e r s u s} H _ {1}: \mu \neq \mu_ {0}, \tag {4.6.1}
$$

where $\mu_0$ is specified. Let $X_{1},\ldots ,X_{n}$ be a random sample from the distribution of $X$ and denote the sample mean and variance by $\overline{X}$ and $S^2$ , respectively. For the one-sided test, we rejected $H_{0}$ if $\overline{X}$ was too large; hence, for the hypotheses (4.6.1), we use the decision rule

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} \bar {X} \leq h \text {o r} \bar {X} \geq k, \tag {4.6.2}
$$

where $h$ and $k$ are such that $\alpha = P_{H_0}[\overline{X} \leq h \text{ or } \overline{X} \geq k]$ . Clearly, $h < k$ ; hence, we have

$$
\alpha = P _ {H _ {0}} [ \bar {X} \leq h \text {o r} \bar {X} \geq k ] = P _ {H _ {0}} [ \bar {X} \leq h ] + P _ {H _ {0}} [ \bar {X} \geq k ].
$$

Since, at least for large samples, the distribution of $\overline{X}$ is symmetrically distributed about $\mu_0$ , under $H_0$ , an intuitive rule is to divide $\alpha$ equally between the two terms on the right side of the above expression; that is, $h$ and $k$ are chosen by

$$
P _ {H _ {0}} [ \bar {X} \leq h ] = \alpha / 2 \text {a n d} P _ {H _ {0}} [ \bar {X} \geq k ] = \alpha / 2. \tag {4.6.3}
$$

From Theorem 4.2.1, it follows that $(\overline{X} - \mu_0) / (S / \sqrt{n})$ is approximately $N(0,1)$ . This and (4.6.3) lead to the approximate decision rule

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} \left| \frac {\bar {X} - \mu_ {0}}{S / \sqrt {n}} \right| \geq z _ {\alpha / 2}. \tag {4.6.4}
$$

Upon substituting $\sigma$ for $S$ , it readily follows that the approximate power function is

$$
\begin{array}{l} \gamma (\mu) = P _ {\mu} \left(\bar {X} \leq \mu_ {0} - z _ {\alpha / 2} \sigma / \sqrt {n}\right) + P _ {\mu} \left(\bar {X} \geq \mu_ {0} + z _ {\alpha / 2} \sigma / \sqrt {n}\right) \\ = \Phi \left(\frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma} - z _ {\alpha / 2}\right) + 1 - \Phi \left(\frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma} + z _ {\alpha / 2}\right), \tag {4.6.5} \\ \end{array}
$$

where $\Phi(z)$ is the cdf of a standard normal random variable; see (3.4.9). So if we have some reasonable idea of what $\sigma$ equals, we can compute the approximate power function. Note that the derivative of the power function is

$$
\gamma^ {\prime} (\mu) = \frac {\sqrt {n}}{\sigma} \left[ \phi \left(\frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma} + z _ {\alpha / 2}\right) - \phi \left(\frac {\sqrt {n} (\mu_ {0} - \mu)}{\sigma} - z _ {\alpha / 2}\right) \right], \tag {4.6.6}
$$

where $\phi(z)$ is the pdf of a standard normal random variable. Then we can show that $\gamma(\mu)$ has a critical value at $\mu_0$ which is the minimum; see Exercise 4.6.2. Further, $\gamma(\mu)$ is strictly decreasing for $\mu < \mu_0$ and strictly increasing for $\mu > \mu_0$ .

Consider again the situation at the beginning of this section. Suppose we want to test

$$
H _ {0}: \mu = 3 0, 0 0 0 \text {v e r s u s} H _ {1}: \mu \neq 3 0, 0 0 0. \tag {4.6.7}
$$

Suppose $n = 20$ and $\alpha = 0.01$ . Then the rejection rule (4.6.4) becomes

$$
\operatorname {R e j e c t} H _ {0} \text {i n f a v o r o f} H _ {1} \text {i f} \left| \frac {\bar {X} - 3 0 , 0 0 0}{S / \sqrt {2 0}} \right| \geq 2. 5 7 5. \tag {4.6.8}
$$

Figure 4.6.1 displays the power curve for this test when $\sigma = 5000$ is substituted in for $S$ . For comparison, the power curve for the test with level $\alpha = 0.05$ is also shown. The R function zpower computes a version of this figure.

![](images/ae8aab19c785b4ed84037f7584a103996d066d40c283cd819dd12ad628360050.jpg)  
Figure 4.6.1: Power curves for the tests of the hypotheses (4.6.7).

This two-sided test for the mean is approximate. If we assume that $X$ has a normal distribution, then, as Exercise 4.6.3 shows, the following test has exact size $\alpha$ for testing $H_0: \mu = \mu_0$ versus $H_1: \mu \neq \mu_0$ :

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r o f} H _ {1} \text {i f} \left| \frac {\bar {X} - \mu_ {0}}{S / \sqrt {n}} \right| \geq t _ {\alpha / 2, n - 1}. \tag {4.6.9}
$$

It too has a bowl-shaped power curve similar to Figure 4.6.1, although it is not as easy to show; see Lehmann (1986).

For computation in R, the code t.test(x, mu=mu0) obtains the two-sided $t$ -test of hypotheses (4.6.1), when the R vector $\mathbf{x}$ contains the sample.

There exists a relationship between two-sided tests and confidence intervals. Consider the two-sided $t$ -test (4.6.9). Here, we use the rejection rule with "if and only if" replacing "if." Hence, in terms of acceptance, we have

$$
\text {A c c e p t} H _ {0} \text {i f a n d o n l y i f} \mu_ {0} - t _ {\alpha / 2, n - 1} S / \sqrt {n} <   \overline {{X}} <   \mu_ {0} + t _ {\alpha / 2, n - 1} S / \sqrt {n}.
$$

But this is easily shown to be

$$
\text {A c c e p t} H _ {0} \text {i f a n d o n l y i f} \mu_ {0} \in (\bar {X} - t _ {\alpha / 2, n - 1} S / \sqrt {n}, \bar {X} + t _ {\alpha / 2, n - 1} S / \sqrt {n}); \tag {4.6.10}
$$

that is, we accept $H_0$ at significance level $\alpha$ if and only if $\mu_0$ is in the $(1 - \alpha)100\%$ confidence interval for $\mu$ . Equivalently, we reject $H_0$ at significance level $\alpha$ if and only if $\mu_0$ is not in the $(1 - \alpha)100\%$ confidence interval for $\mu$ . This is true for all the two-sided tests and hypotheses discussed in this text. There is also a similar relationship between one-sided tests and one-sided confidence intervals.

Once we recognize this relationship between confidence intervals and tests of hypothesis, we can use all those statistics that we used to construct confidence intervals to test hypotheses, not only against two-sided alternatives but one-sided ones as well. Without listing all of these in a table, we present enough of them so that the principle can be understood.

Example 4.6.2. Let independent random samples be taken from $N(\mu_1, \sigma^2)$ and $N(\mu_2, \sigma^2)$ , respectively. Say these have the respective sample characteristics $n_1$ , $\overline{X}$ , $S_1^2$ and $n_2$ , $\overline{Y}$ , $S_2^2$ . Let $n = n_1 + n_2$ denote the combined sample size and let $S_p^2 = [(n_1 - 1)S_1^2 + (n_2 - 1)S_2^2] / (n - 2)$ , (4.2.11), be the pooled estimator of the common variance. At $\alpha = 0.05$ , reject $H_0: \mu_1 = \mu_2$ and accept the one-sided alternative $H_1: \mu_1 > \mu_2$ if

$$
T = \frac {\bar {X} - \bar {Y} - 0}{S _ {p} \sqrt {\frac {1}{n _ {1}} + \frac {1}{n _ {2}}}} \geq t _ {. 0 5, n - 2},
$$

because, under $H_0: \mu_1 = \mu_2$ , $T$ has a $t(n - 2)$ -distribution. A rigorous development of this test is given in Example 8.3.1.

Example 4.6.3. Say $X$ is $b(1, p)$ . Consider testing $H_0: p = p_0$ against $H_1: p < p_0$ . Let $X_1, \ldots, X_n$ be a random sample from the distribution of $X$ and let $\widehat{p} = \overline{X}$ . To test $H_0$ versus $H_1$ , we use either

$$
Z _ {1} = \frac {\widehat {p} - p _ {0}}{\sqrt {p _ {0} (1 - p _ {0}) / n}} \leq c \quad \mathrm {o r} \quad Z _ {2} = \frac {\widehat {p} - p _ {0}}{\sqrt {\widehat {p} (1 - \widehat {p}) / n}} \leq c.
$$

If $n$ is large, both $Z_{1}$ and $Z_{2}$ have approximate standard normal distributions provided that $H_{0}: p = p_{0}$ is true. Hence, if $c$ is set at $-1.645$ , then the approximate significance level is $\alpha = 0.05$ . Some statisticians use $Z_{1}$ and others $Z_{2}$ . We do not have strong preferences one way or the other because the two methods provide about the same numerical results. As one might suspect, using $Z_{1}$ provides better probabilities for power calculations if the true $p$ is close to $p_{0}$ , while $Z_{2}$ is better if $H_{0}$ is clearly false. However, with a two-sided alternative hypothesis, $Z_{2}$ does provide a better relationship with the confidence interval for $p$ . That is, $|Z_{2}| < z_{\alpha / 2}$ is equivalent to $p_{0}$ being in the interval from

$$
\widehat {p} - z _ {\alpha / 2} \sqrt {\frac {\widehat {p} (1 - \widehat {p})}{n}} \quad \mathrm {t o} \quad \widehat {p} + z _ {\alpha / 2} \sqrt {\frac {\widehat {p} (1 - \widehat {p})}{n}},
$$

which is the interval that provides a $(1 - \alpha)100\%$ approximate confidence interval for $p$ as considered in Section 4.2.

In closing this section, we introduce the concept of randomized tests.

Example 4.6.4. Let $X_{1}, X_{2}, \ldots, X_{10}$ be a random sample of size $n = 10$ from a Poisson distribution with mean $\theta$ . A critical region for testing $H_{0}: \theta = 0.1$ against $H_{1}: \theta > 0.1$ is given by $Y = \sum_{1}^{10} X_{i} \geq 3$ . The statistic $Y$ has a Poisson distribution with mean $10\theta$ . Thus, with $\theta = 0.1$ so that the mean of $Y$ is 1, the significance level of the test is

$$
P (Y \geq 3) = 1 - P (Y \leq 2) = 1 - \mathrm {p p o i s} (2, 1) = 1 - 0. 9 2 0 = 0. 0 8 0.
$$

If, on the other hand, the critical region defined by $\sum_{1}^{10}x_{i}\geq 4$ is used, the significance level is

$$
\alpha = P (Y \geq 4) = 1 - P (Y \leq 3) = 1 - \text {p p o i s} (3, 1) = 1 - 0. 9 8 1 = 0. 0 1 9.
$$

For instance, if a significance level of about $\alpha = 0.05$ , say, is desired, most statisticians would use one of these tests; that is, they would adjust the significance level to that of one of these convenient tests. However, a significance level of $\alpha = 0.05$ can be achieved in the following way. Let $W$ have a Bernoulli distribution with probability of success equal to

$$
P (W = 1) = \frac {0 . 0 5 0 - 0 . 0 1 9}{0 . 0 8 0 - 0 . 0 1 9} = \frac {3 1}{6 1}.
$$

Assume that $W$ is selected independently of the sample. Consider the rejection rule

$$
\text {R e j e c t} H _ {0} \text {i f} \sum_ {1} ^ {1 0} x _ {i} \geq 4 \text {o r i f} \sum_ {1} ^ {1 0} x _ {i} = 3 \text {a n d} W = 1.
$$

The significance level of this rule is

$$
\begin{array}{l} P _ {H _ {0}} (Y \geq 4) + P _ {H _ {0}} (\{Y = 3 \} \cap \{W = 1 \}) = P _ {H _ {0}} (Y \geq 4) \\ + P _ {H _ {0}} (Y = 3) P (W = 1) \\ = 0. 0 1 9 + 0. 0 6 1 \frac {3 1}{6 1} = 0. 0 5; \\ \end{array}
$$

hence, the decision rule has exactly level 0.05. The process of performing the auxiliary experiment to decide whether to reject or not when $Y = 3$ is sometimes referred to as a randomized test.

# 4.6.1 Observed Significance Level, $p$ -value

Not many statisticians like randomized tests in practice, because the use of them means that two statisticians could make the same assumptions, observe the same data, apply the same test, and yet make different decisions. Hence, they usually adjust their significance level so as not to randomize. As a matter of fact, many statisticians report what are commonly called observed significance levels or $p$ -values (for probability values).

A general example suffices to explain observed significance levels. Let $X_{1},\ldots ,X_{n}$ be a random sample from a $N(\mu ,\sigma^2)$ distribution, where both $\mu$ and $\sigma^2$ are unknown.

Consider, first, the one-sided hypotheses $H_0: \mu = \mu_0$ versus $H_1: \mu > \mu_0$ , where $\mu_0$ is specified. Write the rejection rule as

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1}, \text {i f} \bar {X} \geq k, \tag {4.6.11}
$$

where $\overline{X}$ is the sample mean. Previously we have specified a level and then solved for $k$ . In practice, though, the level is not specified. Instead, once the sample is observed, the realized value $\overline{x}$ of $\overline{X}$ is computed and we ask the question: Is $\overline{x}$ sufficiently large to reject $H_0$ in favor of $H_1$ ? To answer this we calculate the $p$ -value which is the probability,

$$
p \text {v a l u e} = P _ {H _ {0}} (\bar {X} \geq \bar {x}). \tag {4.6.12}
$$

Note that this is a data-based "significance level" and we call it the observed significance level or the $p$ -value. The hypothesis $H_0$ is rejected at all levels greater than or equal to the $p$ -value. For example, if the $p$ -value is 0.048, and the nominal $\alpha$ level is 0.05 then $H_0$ would be rejected; however, if the nominal $\alpha$ level is 0.01, then $H_0$ would not be rejected. In summary, the experimenter sets the hypotheses; the statistician selects the test statistic and rejection rule; the data are observed and the statistician reports the $p$ -value to the experimenter; and the experimenter decides whether the $p$ -value is sufficiently small to warrant rejection of $H_0$ in favor of $H_1$ . The following example provides a numerical illustration.

Example 4.6.5. Recall the Darwin data discussed in Example 4.5.5. It was a paired design on the heights of cross and self-fertilized Zea mays plants. In each of 15 pots, one cross-fertilized and one self-fertilized were grown. The data of interest are the 15 paired differences, (cross - self). As in Example 4.5.5, let $X_{i}$ denote the paired difference for the $i$ th pot. Let $\mu$ be the true mean difference. The hypotheses of interest are $H_{0}: \mu = 0$ versus $H_{1}: \mu > 0$ . The standardized rejection rule is

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1} \text {i f} T \geq k,
$$

where $T = \overline{X} / (S / \sqrt{15})$ , where $\overline{X}$ and $S$ are respectively the sample mean and standard deviation of the differences. The alternative hypothesis states that on the average cross-fertilized plants are taller than self-fertilized plants. From Example 4.5.5 the $t$ -test statistic has the value 2.15. Letting $t(14)$ denote a random variable with the $t$ -distribution with 14 degrees of freedom, and using R the $p$ -value for the experiment is

$$
P [ t (1 4) > 2. 1 5 ] = 1 - \operatorname {p t} (2. 1 5, 1 4) = 1 - 0. 9 7 5 2 = 0. 0 2 4 8. \tag {4.6.13}
$$

In practice, with this $p$ -value, $H_0$ would be rejected at all levels greater than or equal to 0.0248. This observed significance level is also part of the output from the R call t.test(cross-self, mu=0, alt="greater").

Returning to the discussion above, suppose the hypotheses are $H_0: \mu = \mu_0$ versus $H_1: \mu < \mu_0$ . Obviously, the observed significance level in this case is $p$ -value $= P_{H_0}(\overline{X} \leq \overline{x})$ . For the two-sided hypotheses $H_0: \mu = \mu_0$ versus $H_1: \mu \neq \mu_0$ , our "unspecified" rejection rule is

$$
\text {R e j e c t} H _ {0} \text {i n f a v o r} H _ {1}, \text {i f} \bar {X} \leq l \text {o r} \bar {X} \geq k. \tag {4.6.14}
$$

For the $p$ -value, compute each of the one-sided $p$ -values, take the smaller $p$ -value, and double it. For an illustration, in the Darwin example, suppose the hypotheses are $H_0: \mu = 0$ versus $H_1: \mu \neq 0$ . Then the $p$ -value is $2(0.0248) = 0.0496$ . As a final note on $p$ -values for two-sided hypotheses, suppose the test statistic can be expressed in terms of a $t$ -test statistic. In this case the $p$ -value can be found equivalently as follows. If $d$ is the realized value of the $t$ -test statistic then the $p$ -value is

$$
p \text {v a l u e} = P _ {H _ {0}} [ | t | \geq | d | ], \tag {4.6.15}
$$

where, under $H_0$ , $t$ has a $t$ -distribution with $n - 1$ degrees of freedom.

In this discussion on $p$ -values, keep in mind that good science dictates that the hypotheses should be known before the data are drawn.

# EXERCISES

4.6.1. The R function zpower, found at the site listed in the Preface, computes the plot in Figure 4.6.1. Consider the two-sided test for proportions discussed in Example 4.6.3 based on the test statistic $Z_{1}$ . Specifically consider the hypotheses $H_{0}: p = .0.6$ versus $H_{1}: p \neq 0.6$ . Using the sample size $n = 50$ and the level $\alpha = 0.05$ , write a R program, similar to zpower, which computes a plot of the power curve for this test on a proportion.

4.6.2. Consider the power function $\gamma (\mu)$ and its derivative $\gamma^\prime (\mu)$ given by (4.6.5) and (4.6.6). Show that $\gamma^{\prime}(\mu)$ is strictly negative for $\mu <  \mu_0$ and strictly positive for $\mu >\mu_0$

4.6.3. Show that the test defined by 4.6.9 has exact size $\alpha$ for testing $H_0: \mu = \mu_0$ versus $H_1: \mu \neq \mu_0$ .

4.6.4. Consider the one-sided $t$ -test for $H_0: \mu = \mu_0$ versus $H_{A1}: \mu > \mu_0$ constructed in Example 4.5.4 and the two-sided $t$ -test for $t$ -test for $H_0: \mu = \mu_0$ versus $H_1: \mu \neq \mu_0$ given in (4.6.9). Assume that both tests are of size $\alpha$ . Show that for $\mu > \mu_0$ , the power function of the one-sided test is larger than the power function of the two-sided test.

4.6.5. On page 373 Rasmussen (1992) discussed a paired design. A baseball coach paired 20 members of his team by their speed; i.e., each member of the pair has about the same speed. Then for each pair, he randomly chose one member of the pair and told him that if could beat his best time in circling the bases he would give him an award (call this response the time of the "self" member). For the other member of the pair the coach's instruction was an award if he could beat the time of the other member of the pair (call this response the time of the "rival" member). Each member of the pair knew who his rival was. The data are given below, but are also in the file selffrival.rda. Let $\mu_d$ be the true difference in times (rival minus self) for a pair. The hypotheses of interest are $H_0: \mu_d = 0$ versus $H_1: \mu_d < 0$ . The data are in order by pairs, so do not mix the order.

15.92 16.58 17.57 16.75 17.28 17.32 17.51 17.58 18.26 17.87

rival: 15.95 16.15 17.05 16.99 17.34 17.53 17.34 17.51 18.10 18.19

16.04 16.80 17.24 16.81 17.11 17.22 17.33 17.82 18.19 17.88

(a) Obtain comparison boxplots of the data. Comment on the comparison plots. Are there any outliers?   
(b) Compute the paired $t$ -test and obtain the $p$ -value. Are the data significant at the 5% level of significance?   
(c) Obtain a point estimate of $\mu_d$ and a $95\%$ confidence interval for it.   
(d) Conclude in terms of the problem.

4.6.6. Verzani (2014), page 323, presented a data set concerning the effect that different dosages of the drug AZT have on patients with HIV. The responses we consider are the p24 antigen levels of HIV patients after their treatment with AZT. Of the 20 HIV patients in the study, 10 were randomly assign the dosage of $300\mathrm{mg}$ of AZT while the other 10 were assigned $600\mathrm{mg}$ . The hypotheses of interest are $H_0:\Delta = 0$ versus $H_{1}:\Delta \neq 0$ where $\Delta = \mu_{600} - \mu_{300}$ and $\mu_{600}$ and $\mu_{300}$ are the true mean p24 antigen levels under dosages of $600\mathrm{mg}$ and $300\mathrm{mg}$ of AZT, respectively. The data are given below but are also available in the file aztdoses.rda.

<table><tr><td>300 mg</td><td>284</td><td>279</td><td>289</td><td>292</td><td>287</td><td>295</td><td>285</td><td>279</td><td>306</td><td>298</td></tr><tr><td>600 mg</td><td>298</td><td>307</td><td>297</td><td>279</td><td>291</td><td>335</td><td>299</td><td>300</td><td>306</td><td>291</td></tr></table>

(a) Obtain comparison boxplots of the data. Identify outliers by patient. Comment on the comparison plots.   
(b) Compute the two-sample $t$ -test and obtain the $p$ -value. Are the data significant at the 5% level of significance?   
(c) Obtain a point estimate of $\Delta$ and a $95\%$ confidence interval for it.   
(d) Conclude in terms of the problem.

4.6.7. Among the data collected for the World Health Organization air quality monitoring project is a measure of suspended particles in $\mu \mathrm{g} / \mathrm{m}^3$ . Let $X$ and $Y$ equal the concentration of suspended particles in $\mu \mathrm{g} / \mathrm{m}^3$ in the city center (commercial district) for Melbourne and Houston, respectively. Using $n = 13$ observations of $X$ and $m = 16$ observations of $Y$ , we test $H_0: \mu_X = \mu_Y$ against $H_1: \mu_X < \mu_Y$ .

(a) Define the test statistic and critical region, assuming that the unknown variances are equal. Let $\alpha = 0.05$ .   
(b) If $\overline{x} = 72.9$ , $s_x = 25.6$ , $\overline{y} = 81.7$ , and $s_y = 28.3$ , calculate the value of the test statistic and state your conclusion.

4.6.8. Let $p$ equal the proportion of drivers who use a seat belt in a country that does not have a mandatory seat belt law. It was claimed that $p = 0.14$ . An advertising campaign was conducted to increase this proportion. Two months after the campaign, $y = 104$ out of a random sample of $n = 590$ drivers were wearing their seat belts. Was the campaign successful?

(a) Define the null and alternative hypotheses.   
(b) Define a critical region with an $\alpha = 0.01$ significance level.   
(c) Determine the approximate $p$ -value and state your conclusion.

4.6.9. In Exercise 4.2.18 we found a confidence interval for the variance $\sigma^2$ using the variance $S^2$ of a random sample of size $n$ arising from $N(\mu, \sigma^2)$ , where the mean $\mu$ is unknown. In testing $H_0: \sigma^2 = \sigma_0^2$ against $H_1: \sigma^2 > \sigma_0^2$ , use the critical region defined by $(n - 1)S^2 / \sigma_0^2 \geq c$ . That is, reject $H_0$ and accept $H_1$ if $S^2 \geq c\sigma_0^2 / (n - 1)$ . If $n = 13$ and the significance level $\alpha = 0.025$ , determine $c$ .

4.6.10. In Exercise 4.2.27, in finding a confidence interval for the ratio of the variances of two normal distributions, we used a statistic $S_1^2 / S_2^2$ , which has an $F$ -distribution when those two variances are equal. If we denote that statistic by $F$ , we can test $H_0: \sigma_1^2 = \sigma_2^2$ against $H_1: \sigma_1^2 > \sigma_2^2$ using the critical region $F \geq c$ . If $n = 13$ , $m = 11$ , and $\alpha = 0.05$ , find $c$ .

# 4.7 Chi-Square Tests

In this section we introduce tests of statistical hypotheses called chi-square tests. A test of this sort was originally proposed by Karl Pearson in 1900, and it provided one of the earlier methods of statistical inference.

Let the random variable $X_{i}$ be $N(\mu_i,\sigma_i^2)$ , $i = 1,2,\ldots ,n$ , and let $X_{1},X_{2},\ldots ,X_{n}$ be mutually independent. Thus the joint pdf of these variables is

$$
\frac {1}{\sigma_ {1} \sigma_ {2} \cdots \sigma_ {n} (2 \pi) ^ {n / 2}} \exp \left[ - \frac {1}{2} \sum_ {1} ^ {n} \left(\frac {x _ {i} - \mu_ {i}}{\sigma_ {i}}\right) ^ {2} \right], - \infty <   x _ {i} <   \infty .
$$

The random variable that is defined by the exponent (apart from the coefficient $-\frac{1}{2}$ ) is $\sum_{1}^{n}[(X_i - \mu_i) / \sigma_i]^2$ , and this random variable has a $\chi^2(n)$ distribution. In Section 3.5 we generalized this joint normal distribution of probability to $n$ random variables that are dependent and we called the distribution a multivariate normal distribution. Theorem 3.5.1 shows a similar result holds for the exponent in the multivariate normal case, also.

Let us now discuss some random variables that have approximate chi-square distributions. Let $X_{1}$ be $b(n,p_{1})$ . Consider the random variable

$$
Y = \frac {X _ {1} - n p _ {1}}{\sqrt {n p _ {1} (1 - p _ {1})}},
$$

which has, as $n \to \infty$ , an approximate $N(0,1)$ distribution (see Theorem 4.2.1). Furthermore, as discussed in Example 5.3.6, the distribution of $Y^2$ is approximately $\chi^2(1)$ . Let $X_2 = n - X_1$ and let $p_2 = 1 - p_1$ . Let $Q_1 = Y^2$ . Then $Q_1$ may be written as

$$
\begin{array}{l} Q _ {1} = \frac {\left(X _ {1} - n p _ {1}\right) ^ {2}}{n p _ {1} \left(1 - p _ {1}\right)} = \frac {\left(X _ {1} - n p _ {1}\right) ^ {2}}{n p _ {1}} + \frac {\left(X _ {1} - n p _ {1}\right) ^ {2}}{n \left(1 - p _ {1}\right)} \\ = \frac {\left(X _ {1} - n p _ {1}\right) ^ {2}}{n p _ {1}} + \frac {\left(X _ {2} - n p _ {2}\right) ^ {2}}{n p _ {2}} \tag {4.7.1} \\ \end{array}
$$

because $(X_{1} - np_{1})^{2} = (n - X_{2} - n + np_{2})^{2} = (X_{2} - np_{2})^{2}$ . This result can be generalized as follows.

Let $X_{1}, X_{2}, \ldots, X_{k-1}$ have a multinomial distribution with the parameters $n$ and $p_{1}, \ldots, p_{k-1}$ , as in Section 3.1. Let $X_{k} = n - (X_{1} + \dots + X_{k-1})$ and let $p_{k} = 1 - (p_{1} + \dots + p_{k-1})$ . Define $Q_{k-1}$ by

$$
Q _ {k - 1} = \sum_ {i = 1} ^ {k} \frac {\left(X _ {i} - n p _ {i}\right) ^ {2}}{n p _ {i}}.
$$

It is proved in a more advanced course that, as $n \to \infty$ , $Q_{k-1}$ has an approximate $\chi^2(k-1)$ distribution. Some writers caution the user of this approximation to be certain that $n$ is large enough so that each $np_i$ , $i = 1, 2, \ldots, k$ , is at least equal to 5. In any case, it is important to realize that $Q_{k-1}$ does not have a chi-square distribution, only an approximate chi-square distribution.

The random variable $Q_{k-1}$ may serve as the basis of the tests of certain statistical hypotheses which we now discuss. Let the sample space $\mathcal{A}$ of a random experiment be the union of a finite number $k$ of mutually disjoint sets $A_1, A_2, \ldots, A_k$ . Furthermore, let $P(A_i) = p_i$ , $i = 1, 2, \ldots, k$ , where $p_k = 1 - p_1 - \dots - p_{k-1}$ , so that $p_i$ is the probability that the outcome of the random experiment is an element of the set $A_i$ . The random experiment is to be repeated $n$ independent times and $X_i$ represents the number of times the outcome is an element of set $A_i$ . That is, $X_1, X_2, \ldots, X_k = n - X_1 - \dots - X_{k-1}$ are the frequencies with which the outcome is, respectively, an element of $A_1, A_2, \ldots, A_k$ . Then the joint pmf of $X_1, X_2, \ldots, X_{k-1}$ is the multinomial pmf with the parameters $n, p_1, \ldots, p_{k-1}$ . Consider the simple hypothesis (concerning this multinomial pmf) $H_0: p_1 = p_{10}$ , $p_2 = p_{20}, \ldots, p_{k-1} = p_{k-1,0}$ ( $p_k = p_{k0} = 1 - p_{10} - \dots - p_{k-1,0}$ ), where $p_{10}, \ldots, p_{k-1,0}$ are specified numbers. It is desired to test $H_0$ against all alternatives.

If the hypothesis $H_0$ is true, the random variable

$$
Q _ {k - 1} = \sum_ {1} ^ {k} \frac {\left(X _ {i} - n p _ {i 0}\right) ^ {2}}{n p _ {i 0}}
$$

has an approximate chi-square distribution with $k - 1$ degrees of freedom. Since, when $H_0$ is true, $np_{i0}$ is the expected value of $X_i$ , one would feel intuitively that observed values of $Q_{k-1}$ should not be too large if $H_0$ is true. Our test is then

to reject $H_0$ if $Q_{k-1} \geq c$ . To determine a test with level of significance $\alpha$ , we can use tables of the $\chi^2$ -distribution or a computer package. Using R, we compute the critical value $c$ by qchisq(1 - $\alpha$ , k-1). If, then, the hypothesis $H_0$ is rejected when the observed value of $Q_{k-1}$ is at least as great as $c$ , the test of $H_0$ has a significance level that is approximately equal to $\alpha$ . Also if $q$ is the realized value of the test statistic $Q_{k-1}$ then the observed significance level of the test is computed in R by 1-pchisq(q, k-1). This is frequently called a goodness-of-fit test. Some illustrative examples follow.

Example 4.7.1. One of the first six positive integers is to be chosen by a random experiment (perhaps by the cast of a die). Let $A_{i} = \{x : x = i\}$ , $i = 1, 2, \ldots, 6$ . The hypothesis $H_{0}: P(A_{i}) = p_{i0} = \frac{1}{6}$ , $i = 1, 2, \ldots, 6$ , is tested, at the approximate $5\%$ significance level, against all alternatives. To make the test, the random experiment is repeated under the same conditions, 60 independent times. In this example, $k = 6$ and $np_{i0} = 60\left(\frac{1}{6}\right) = 10$ , $i = 1, 2, \ldots, 6$ . Let $X_{i}$ denote the frequency with which the random experiment terminates with the outcome in $A_{i}$ , $i = 1, 2, \ldots, 6$ , and let $Q_{5} = \sum_{1}^{6}(X_{i} - 10)^{2}/10$ . Since there are $6 - 1 = 5$ degrees of freedom, the critical value for a level $\alpha = 0.05$ test is qchisq(0.95,5) = 11.0705. Now suppose that the experimental frequencies of $A_{1}, A_{2}, \ldots, A_{6}$ are, respectively, 13, 19, 11, 8, 5, and 4. The observed value of $Q_{5}$ is

$$
\frac {(1 3 - 1 0) ^ {2}}{1 0} + \frac {(1 9 - 1 0) ^ {2}}{1 0} + \frac {(1 1 - 1 0) ^ {2}}{1 0} + \frac {(8 - 1 0) ^ {2}}{1 0} + \frac {(5 - 1 0) ^ {2}}{1 0} + \frac {(4 - 1 0) ^ {2}}{1 0} = 1 5. 6.
$$

Since $15.6 > 11.0705$ , the hypothesis $P(A_{i}) = \frac{1}{6}$ , $i = 1,2,\ldots,6$ , is rejected at the (approximate) $5\%$ significance level.

The following R segment computes this test, returning the test statistic and the $p$ -value as shown:

ps=rep(1/6,6); x=c(13,19,11,8,5,4); chisq.test(x,p=ps)

X-squared $= 15.6$ , df $= 5$ , p-value $= 0.008084$

Example 4.7.2. A point is to be selected from the unit interval $\{x:0 < x < 1\}$ by a random process. Let $A_{1} = \{x:0 < x\leq \frac{1}{4}\}$ , $A_{2} = \{x:\frac{1}{4} < x\leq \frac{1}{2}\}$ , $A_{3} = \{x:\frac{1}{2} < x\leq \frac{3}{4}\}$ , and $A_{4} = \{x:\frac{3}{4} < x < 1\}$ . Let the probabilities $p_i$ , $i = 1,2,3,4$ , assigned to these sets under the hypothesis be determined by the pdf $2x$ , $0 < x < 1$ , zero elsewhere. Then these probabilities are, respectively,

$$
p _ {1 0} = \int_ {0} ^ {1 / 4} 2 x d x = \frac {1}{1 6}, p _ {2 0} = \frac {3}{1 6}, p _ {3 0} = \frac {5}{1 6}, p _ {4 0} = \frac {7}{1 6}.
$$

Thus the hypothesis to be tested is that $p_1, p_2, p_3$ , and $p_4 = 1 - p_1 - p_2 - p_3$ have the preceding values in a multinomial distribution with $k = 4$ . This hypothesis is to be tested at an approximate 0.025 significance level by repeating the random experiment $n = 80$ independent times under the same conditions. Here the $np_{i0}$ for $i = 1, 2, 3, 4$ , are, respectively, 5, 15, 25, and 35. Suppose the observed frequencies of $A_1, A_2, A_3$ , and $A_4$ are 6, 18, 20, and 36, respectively. Then the observed value

of $Q_{3} = \sum_{1}^{4}(X_{i} - np_{i0})^{2} / (np_{i0})$ is

$$
\frac {(6 - 5) ^ {2}}{5} + \frac {(1 8 - 1 5) ^ {2}}{1 5} + \frac {(2 0 - 2 5) ^ {2}}{2 5} + \frac {(3 6 - 3 5) ^ {2}}{3 5} = \frac {6 4}{3 5} = 1. 8 3.
$$

The following R segment calculates the test and $p$ -value:

$$
x = c (6, 1 8, 2 0, 3 6); p s = c (1, 3, 5, 7) / 1 6; c h i s q. t e s t (x, p = p s)
$$

$$
X - \text {s q u a r e d} = 1. 8 2 8 6, \mathrm {d f} = 3, \text {p - v a l u e} = 0. 6 0 8 7
$$

Hence, we fail to reject $H_0$ at level 0.0250.

Thus far we have used the chi-square test when the hypothesis $H_0$ is a simple hypothesis. More often we encounter hypotheses $H_0$ in which the multinomial probabilities $p_1, p_2, \ldots, p_k$ are not completely specified by the hypothesis $H_0$ . That is, under $H_0$ , these probabilities are functions of unknown parameters. For an illustration, suppose that a certain random variable $Y$ can take on any real value. Let us partition the space $\{y: -\infty < y < \infty\}$ into $k$ mutually disjoint sets $A_1, A_2, \ldots, A_k$ so that the events $A_1, A_2, \ldots, A_k$ are mutually exclusive and exhaustive. Let $H_0$ be the hypothesis that $Y$ is $N(\mu, \sigma^2)$ with $\mu$ and $\sigma^2$ unspecified. Then each

$$
p _ {i} = \int_ {A _ {i}} \frac {1}{\sqrt {2 \pi} \sigma} \exp [ - (y - \mu) ^ {2} / 2 \sigma^ {2} ] d y, i = 1, 2, \ldots , k,
$$

is a function of the unknown parameters $\mu$ and $\sigma^2$ . Suppose that we take a random sample $Y_{1},\ldots ,Y_{n}$ of size $n$ from this distribution. If we let $X_{i}$ denote the frequency of $A_{i}$ , $i = 1,2,\dots ,k$ , so that $X_{1} + X_{2} + \dots +X_{k} = n$ , the random variable

$$
Q _ {k - 1} = \sum_ {i = 1} ^ {k} \frac {(X _ {i} - n p _ {i}) ^ {2}}{n p _ {i}}
$$

cannot be computed once $X_{1}, \ldots, X_{k}$ have been observed, since each $p_{i}$ , and hence $Q_{k-1}$ , is a function of $\mu$ and $\sigma^{2}$ . Accordingly, choose the values of $\mu$ and $\sigma^{2}$ that minimize $Q_{k-1}$ . These values depend upon the observed $X_{1} = x_{1}, \ldots, X_{k} = x_{k}$ and are called minimum chi-square estimates of $\mu$ and $\sigma^{2}$ . These point estimates of $\mu$ and $\sigma^{2}$ enable us to compute numerically the estimates of each $p_{i}$ . Accordingly, if these values are used, $Q_{k-1}$ can be computed once $Y_{1}, Y_{2}, \ldots, Y_{n}$ , and hence $X_{1}, X_{2}, \ldots, X_{k}$ , are observed. However, a very important aspect of the fact, which we accept without proof, is that now $Q_{k-1}$ is approximately $\chi^{2}(k-3)$ . That is, the number of degrees of freedom of the approximate chi-square distribution of $Q_{k-1}$ is reduced by one for each parameter estimated by the observed data. This statement applies not only to the problem at hand but also to more general situations. Two examples are now given. The first of these examples deals with the test of the hypothesis that two multinomial distributions are the same.

Remark 4.7.1. In many cases, such as that involving the mean $\mu$ and the variance $\sigma^2$ of a normal distribution, minimum chi-square estimates are difficult to compute. Other estimates, such as the maximum likelihood estimates of Example 4.1.3, $\hat{\mu} = \overline{Y}$ and $\hat{\sigma^2} = (n - 1)S^2 /n$ , are used to evaluate $p_i$ and $Q_{k - 1}$ . In general, $Q_{k - 1}$ is not minimized by maximum likelihood estimates, and thus its computed value

is somewhat greater than it would be if minimum chi-square estimates are used. Hence, when comparing it to a critical value listed in the chi-square table with $k - 3$ degrees of freedom, there is a greater chance of rejection than there would be if the actual minimum of $Q_{k-1}$ is used. Accordingly, the approximate significance level of such a test may be higher than the $p$ -value as calculated in the $\chi^2$ -analysis. This modification should be kept in mind and, if at all possible, each $p_i$ should be estimated using the frequencies $X_1, \ldots, X_k$ rather than directly using the observations $Y_1, Y_2, \ldots, Y_n$ of the random sample.

Example 4.7.3. In this example, we consider two multinomial distributions with parameters $n_j, p_{1j}, p_{2j}, \ldots, p_{kj}$ and $j = 1, 2$ , respectively. Let $X_{ij}$ , $i = 1, 2, \ldots, k$ , $j = 1, 2$ , represent the corresponding frequencies. If $n_1$ and $n_2$ are large and the observations from one distribution are independent of those from the other, the random variable

$$
\sum_ {j = 1} ^ {2} \sum_ {i = 1} ^ {k} \frac {(X _ {i j} - n _ {j} p _ {i j}) ^ {2}}{n _ {j} p _ {i j}}
$$

is the sum of two independent random variables each of which we treat as though it were $\chi^2 (k - 1)$ ; that is, the random variable is approximately $\chi^2 (2k - 2)$ . Consider the hypothesis

$$
H _ {0}: p _ {1 1} = p _ {1 2}, p _ {2 1} = p _ {2 2}, \dots , p _ {k 1} = p _ {k 2},
$$

where each $p_{i1} = p_{i2}$ , $i = 1,2,\ldots ,k$ , is unspecified. Thus we need point estimates of these parameters. The maximum likelihood estimator of $p_{i1} = p_{i2}$ , based upon the frequencies $X_{ij}$ , is $(X_{i1} + X_{i2}) / (n_1 + n_2)$ , $i = 1,2,\dots ,k$ . Note that we need only $k - 1$ point estimates, because we have a point estimate of $p_{k1} = p_{k2}$ once we have point estimates of the first $k - 1$ probabilities. In accordance with the fact that has been stated, the random variable

$$
Q _ {k - 1} = \sum_ {j = 1} ^ {2} \sum_ {i = 1} ^ {k} \frac {\left\{X _ {i j} - n _ {j} \left[ \left(X _ {i 1} + X _ {i 2}\right) / \left(n _ {1} + n _ {2}\right) \right] \right\} ^ {2}}{n _ {j} \left[ \left(X _ {i 1} + X _ {i 2}\right) / \left(n _ {1} + n _ {2}\right) \right]}
$$

has an approximate $\chi^2$ distribution with $2k - 2 - (k - 1) = k - 1$ degrees of freedom. Thus we are able to test the hypothesis that two multinomial distributions are the same. For a specified level $\alpha$ , the hypothesis $H_0$ is rejected when the computed value of $Q_{k - 1}$ exceeds the $1 - \alpha$ quantile of a $\chi^2$ -distribution with $k - 1$ degrees of freedom. This test is often called the chi-square test for homogeneity (the null is equivalent to homogeneous distributions).

The second example deals with the subject of contingency tables.

Example 4.7.4. Let the result of a random experiment be classified by two attributes (such as the color of the hair and the color of the eyes). That is, one attribute of the outcome is one and only one of certain mutually exclusive and exhaustive events, say $A_{1}, A_{2}, \ldots, A_{a}$ ; and the other attribute of the outcome is also one and only one of certain mutually exclusive and exhaustive events, say $B_{1}, B_{2}, \ldots, B_{b}$ . Let $p_{ij} = P(A_{i} \cap B_{j})$ , $i = 1, 2, \ldots, a$ ; $j = 1, 2, \ldots, b$ . The random

experiment is repeated $n$ independent times and $X_{ij}$ denotes the frequency of the event $A_i \cap B_j$ . Since there are $k = ab$ such events as $A_i \cap B_j$ , the random variable

$$
Q _ {a b - 1} = \sum_ {j = 1} ^ {b} \sum_ {i = 1} ^ {a} \frac {\left(X _ {i j} - n p _ {i j}\right) ^ {2}}{n p _ {i j}}
$$

has an approximate chi-square distribution with $ab - 1$ degrees of freedom, provided that $n$ is large. Suppose that we wish to test the independence of the $A$ and the $B$ attributes, i.e., the hypothesis $H_0: P(A_i \cap B_j) = P(A_i)P(B_j), i = 1, 2, \ldots, a; j = 1, 2, \ldots, b$ . Let us denote $P(A_i)$ by $p_i$ and $P(B_j)$ by $p_{j}$ . It follows that

$$
p _ {i.} = \sum_ {j = 1} ^ {b} p _ {i j}, \quad p _ {. j} = \sum_ {i = 1} ^ {a} p _ {i j}, \text {a n d} 1 = \sum_ {j = 1} ^ {b} \sum_ {i = 1} ^ {a} p _ {i j} = \sum_ {j = 1} ^ {b} p _ {. j} = \sum_ {i = 1} ^ {a} p _ {i}.
$$

Then the hypothesis can be formulated as $H_0: p_{ij} = p_{i.p.j}$ , $i = 1,2,\ldots,a$ ; $j = 1,2,\ldots,b$ . To test $H_0$ , we can use $Q_{ab-1}$ with $p_{ij}$ replaced by $p_{i.p.j}$ . But if $p_{i..}$ , $i = 1,2,\ldots,a$ , and $p_{.j}$ , $j = 1,2,\ldots,b$ , are unknown, as they frequently are in applications, we cannot compute $Q_{ab-1}$ once the frequencies are observed. In such a case, we estimate these unknown parameters by

$$
\hat {p} _ {i.} = \frac {X _ {i .}}{n}, \text {w h e r e} X _ {i.} = \sum_ {j = 1} ^ {b} X _ {i j}, \text {f o r} i = 1, 2, \dots , a,
$$

and

$$
\hat {p}. _ {j} = \frac {X _ {. j}}{n}, \text {w h e r e} X _ {. j} = \sum_ {i = 1} ^ {a} X _ {i j}, \text {f o r} j = 1, 2, \dots , b.
$$

Since $\sum_{i}p_{i.} = \sum_{j}p_{.j} = 1$ , we have estimated only $a - 1 + b - 1 = a + b - 2$ parameters. So if these estimates are used in $Q_{ab - 1}$ , with $p_{ij} = p_{i}.p_{.j}$ , then, according to the rule that has been stated in this section, the random variable

$$
\sum_ {j = 1} ^ {b} \sum_ {i = 1} ^ {a} \frac {\left[ X _ {i j} - n \left(X _ {i .} / n\right) \left(X _ {j} / n\right) \right] ^ {2}}{n \left(X _ {i .} / n\right) \left(X _ {j} / n\right)} \tag {4.7.2}
$$

has an approximate chi-square distribution with $ab - 1 - (a + b - 2) = (a - 1)(b - 1)$ degrees of freedom provided that $H_0$ is true. For a specified level $\alpha$ , the hypothesis $H_0$ is then rejected if the computed value of this statistic exceeds the $1 - \alpha$ quantile of a $\chi^2$ -distribution with $(a - 1)(b - 1)$ degrees of freedom. This is the $\chi^2$ -test for independence.

For an illustration, reconsider Example 4.1.5 in which we presented data on hair color of Scottish children. The eye colors of the children were also recorded. The complete data are in the following contingency table (with additionally the marginal sums). The contingency table is also in the file scotteyehair.rda.

<table><tr><td></td><td>Fair</td><td>Red</td><td>Medium</td><td>Dark</td><td>Black</td><td>Margin</td></tr><tr><td>Blue</td><td>1368</td><td>170</td><td>1041</td><td>398</td><td>1</td><td>2978</td></tr><tr><td>Light</td><td>2577</td><td>474</td><td>2703</td><td>932</td><td>11</td><td>6697</td></tr><tr><td>Medium</td><td>1390</td><td>420</td><td>3826</td><td>1842</td><td>33</td><td>7511</td></tr><tr><td>Dark</td><td>454</td><td>255</td><td>1848</td><td>2506</td><td>112</td><td>5175</td></tr><tr><td>Margin</td><td>5789</td><td>1319</td><td>9418</td><td>5678</td><td>157</td><td>22361</td></tr></table>

The table indicates that hair and eye color are dependent random variables. For example, the observed frequency of children with blue eyes and black hair is 1 while the expected frequency under independence is $2978 \times 157 / 22361 = 20.9$ . The contribution to the test statistic from this one cell is $(1 - 20.9)^{2} / 20.9 = 19.95$ that nearly exceeds the test statistic's $\chi^{2}$ critical value at level 0.05, which is qchisq(.95,12) = 21.026. The $\chi^{2}$ -test statistic for independence is tedious to compute and the reader is advised to use a statistical package. For R, assume that the contingency table without margin sums is in the matrix scotteyehair. Then the code chisq.test(scotteyehair) returns the $\chi^{2}$ test statistic and the $p$ -value as: X-squared = 3683.9, df = 12, p-value < 2.2e-16. Thus the result is highly significant. Based on this study, hair color and eye color of Scottish children are dependent on one another. To investigate where the dependence is the strongest in a contingency table, we recommend considering the table of expected frequencies and the table of Pearson residuals. The later are the square roots (with the sign of the numerators) of the summands in expression (4.7.2) defining the test statistic. The sum of the squared Pearson residuals equals the $\chi^{2}$ -test statistic. In R, the following code obtains both of these items:

fit = chisq.test(scotteyehair); fitexpected; fit\(residual Based on running this code, the largest residual is 32.8 for the cell dark hair and dark eyes. The observed frequency is 2506 while the expected frequency under independence is 1314.

In each of the four examples of this section, we have indicated that the statistic used to test the hypothesis $H_0$ has an approximate chi-square distribution, provided that $n$ is sufficiently large and $H_0$ is true. To compute the power of any of these tests for values of the parameters not described by $H_0$ , we need the distribution of the statistic when $H_0$ is not true. In each of these cases, the statistic has an approximate distribution called a noncentral chi-square distribution. The noncentral chi-square distribution is discussed later in Section 9.3.

# EXERCISES

4.7.1. Consider Example 4.7.2. Suppose the observed frequencies of $A_{1}, \ldots, A_{4}$ are 20, 30, 92, and 105, respectively. Modify the R code given in the example to calculate the test for these new frequencies. Report the $p$ -value.

4.7.2. A number is to be selected from the interval $\{x:0 < x < 2\}$ by a random process. Let $A_{i} = \{x:(i - 1) / 2 < x\leq i / 2\}$ , $i = 1,2,3$ , and let $A_4 = \{x:\frac{3}{2} < x < 2\}$ . For $i = 1,2,3,4$ , suppose a certain hypothesis assigns probabilities $p_{i0}$ to these sets in accordance with $p_{i0} = \int_{A_i}(\frac{1}{2})(2 - x)dx$ , $i = 1,2,3,4$ . This

hypothesis (concerning the multinomial pdf with $k = 4$ ) is to be tested at the $5\%$ level of significance by a chi-square test. If the observed frequencies of the sets $A_{i}$ , $i = 1,2,3,4$ , are respectively, 30, 30, 10, 10, would $H_0$ be accepted at the (approximate) $5\%$ level of significance? Use R code similar to that of Example 4.7.2 for the computation.

4.7.3. Define the sets $A_{1} = \{x: -\infty < x \leq 0\}$ , $A_{i} = \{x: i - 2 < x \leq i - 1\}$ , $i = 2, \ldots, 7$ , and $A_{8} = \{x: 6 < x < \infty\}$ . A certain hypothesis assigns probabilities $p_{i0}$ to these sets $A_{i}$ in accordance with

$$
p _ {i 0} = \int_ {A _ {i}} \frac {1}{2 \sqrt {2 \pi}} \exp \left[ - \frac {(x - 3) ^ {2}}{2 (4)} \right] d x, i = 1, 2, \ldots , 7, 8.
$$

This hypothesis (concerning the multinomial pdf with $k = 8$ ) is to be tested, at the $5\%$ level of significance, by a chi-square test. If the observed frequencies of the sets $A_{i}$ , $i = 1,2,\ldots ,8$ , are, respectively, 60, 96, 140, 210, 172, 160, 88, and 74, would $H_0$ be accepted at the (approximate) $5\%$ level of significance? Use R code similar to that discussed in Example 4.7.2. The probabilities are easily computed in R; for example, $p_{30} = \mathrm{pnorm}(2,3,2) - \mathrm{pnorm}(1,3,2)$ .

4.7.4. A die was cast $n = 120$ independent times and the following data resulted:

<table><tr><td>Spots Up</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr><tr><td>Frequency</td><td>b</td><td>20</td><td>20</td><td>20</td><td>20</td><td>40-b</td></tr></table>

If we use a chi-square test, for what values of $b$ would the hypothesis that the die is unbiased be rejected at the 0.025 significance level?

4.7.5. Consider the problem from genetics of crossing two types of peas. The Mendelian theory states that the probabilities of the classifications (a) round and yellow, (b) wrinkled and yellow, (c) round and green, and (d) wrinkled and green are $\frac{9}{16}$ , $\frac{3}{16}$ , $\frac{3}{16}$ , and $\frac{1}{16}$ , respectively. If, from 160 independent observations, the observed frequencies of these respective classifications are 86, 35, 26, and 13, are these data consistent with the Mendelian theory? That is, test, with $\alpha = 0.01$ , the hypothesis that the respective probabilities are $\frac{9}{16}$ , $\frac{3}{16}$ , $\frac{3}{16}$ , and $\frac{1}{16}$ .

4.7.6. Two different teaching procedures were used on two different groups of students. Each group contained 100 students of about the same ability. At the end of the term, an evaluating team assigned a letter grade to each student. The results were tabulated as follows.

<table><tr><td rowspan="2">Group</td><td colspan="5">Grade</td><td rowspan="2">Total</td></tr><tr><td>A</td><td>B</td><td>C</td><td>D</td><td>F</td></tr><tr><td>I</td><td>15</td><td>25</td><td>32</td><td>17</td><td>11</td><td>100</td></tr><tr><td>II</td><td>9</td><td>18</td><td>29</td><td>28</td><td>16</td><td>100</td></tr></table>

If we consider these data to be independent observations from two respective multinomial distributions with $k = 5$ , test at the $5\%$ significance level the hypothesis

Table 4.7.1: Contingency Table for Type of Crime and Alcoholic Status Data   

<table><tr><td>Crime</td><td>Alcoholic</td><td>Non-Alcoholic</td></tr><tr><td>Arson</td><td>50</td><td>43</td></tr><tr><td>Rape</td><td>88</td><td>62</td></tr><tr><td>Violence</td><td>155</td><td>110</td></tr><tr><td>Theft</td><td>379</td><td>300</td></tr><tr><td>Coining</td><td>18</td><td>14</td></tr><tr><td>Fraud</td><td>63</td><td>144</td></tr></table>

that the two distributions are the same (and hence the two teaching procedures are equally effective). For computation in R, use

r1=c(15,25,32,17,11);r2=c(9,18,29,28,16);mat=rbind(r1,r2)  
chisq.test(mat)

4.7.7. Kloke and McKean (2014) present a data set concerning crime and alcoholism. The data they discuss is in Table 4.7.1. It contains the frequencies of criminals who committed certain crimes and whether or not they are alcoholics. The data are also in the file crimealk.rda.

(a) Using code similar to that given in Exercise 4.7.6, compute the $\chi^2$ -test for independence between type of crime and alcoholic status. Conclude in terms of the problem, using the $p$ -value.   
(b) Use the Pearson residuals to determine which part of the table contains the strongest information concerning dependence.   
(c) Use a $\chi^2$ -test to confirm your suspicions in Part (b). This is a conditional test based on the data, but, in practice, such tests are used for planning future studies.

4.7.8. Let the result of a random experiment be classified as one of the mutually exclusive and exhaustive ways $A_{1}, A_{2}, A_{3}$ and also as one of the mutually exhaustive ways $B_{1}, B_{2}, B_{3}, B_{4}$ . Say that 180 independent trials of the experiment result in the following frequencies:

<table><tr><td></td><td>B1</td><td>B2</td><td>B3</td><td>B4</td></tr><tr><td>A1</td><td>15 - 3k</td><td>15 - k</td><td>15 + k</td><td>15 + 3k</td></tr><tr><td>A2</td><td>15</td><td>15</td><td>15</td><td>15</td></tr><tr><td>A3</td><td>15 + 3k</td><td>15 + k</td><td>15 - k</td><td>15 - 3k</td></tr></table>

where $k$ is one of the integers 0,1,2,3,4,5. What is the smallest value of $k$ that leads to the rejection of the independence of the $A$ attribute and the $B$ attribute at the $\alpha = 0.05$ significance level?

4.7.9. It is proposed to fit the Poisson distribution to the following data:

<table><tr><td>x</td><td>0</td><td>1</td><td>2</td><td>3</td><td>3 &lt; x</td></tr><tr><td>Frequency</td><td>20</td><td>40</td><td>16</td><td>18</td><td>6</td></tr></table>

(a) Compute the corresponding chi-square goodness-of-fit statistic.

Hint: In computing the mean, treat $3 < x$ as $x = 4$ .

(b) How many degrees of freedom are associated with this chi-square?

(c) Do these data result in the rejection of the Poisson model at the $\alpha = 0.05$ significance level?

# 4.8 The Method of Monte Carlo

In this section we introduce the concept of generating observations from a specified distribution or sample. This is often called Monte Carlo generation. This technique has been used for simulating complicated processes and investigating finite sample properties of statistical methodology for some time now. In the last 30 years, however, this has become a very important concept in modern statistics in the realm of inference based on the bootstrap (resampling) and modern Bayesian methods. We repeatedly make use of this concept throughout the book.

For the most part, a generator of random uniform observations is all that is needed. It is not easy to construct a device that generates random uniform observations. However, there has been considerable work done in this area, not only in the construction of such generators, but in the testing of their accuracy as well. Most statistical software packages, such as R, have reliable uniform generators.

Suppose then we have a device capable of generating a stream of independent and identically distributed observations from a uniform $(0,1)$ distribution. For example, the following command generates 10 such observations in the language R: runif(10). In this command the r stands for random, the unif stands for uniform, the 10 stands for the number of observations requested, and the lack of additional arguments means that the standard uniform $(0,1)$ generator is used.

For observations from a discrete distribution, often a uniform generator suffices. For a simple example, consider an experiment where a fair six-sided die is rolled and the random variable $X$ is 1 if the upface is a "low number," namely $\{1,2\}$ ; otherwise, $X = 0$ . Note that the mean of $X$ is $\mu = 1/3$ . If $U$ has a uniform $(0,1)$ distribution, then $X$ can be realized as

$$
X = \left\{ \begin{array}{l l} 1 & \text {i f} 0 <   U \leq 1 / 3 \\ 0 & \text {i f} 1 / 3 <   U <   1. \end{array} \right.
$$

Using the command above, we used the following R code to generate 10 observations from this experiment:

$$
n = 1 0; u = \operatorname {r u n i f} (n); x = \operatorname {r e p} (0, n); x [ u <   1 / 3 ] = 1; x
$$

The following table displays the results.

<table><tr><td>ui</td><td>0.4743</td><td>0.7891</td><td>0.5550</td><td>0.9693</td><td>0.0299</td></tr><tr><td>xi</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr><tr><td>ui</td><td>0.8425</td><td>0.6012</td><td>0.1009</td><td>0.0545</td><td>0.4677</td></tr><tr><td>xi</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></table>

Note that observations form a realization of a random sample $X_{1},\ldots ,X_{10}$ drawn from the distribution of $X$ . For these 10 observations, the realized value of the statistic $\overline{X}$ is $\overline{x} = 0.3$ .

Example 4.8.1 (Estimation of $\pi$ ). Consider the experiment where a pair of numbers $(U_1, U_2)$ is chosen at random in the unit square, as shown in Figure 4.8.1; that is, $U_1$ and $U_2$ are iid uniform $(0,1)$ random variables. Since the point is chosen at random, the probability of $(U_1, U_2)$ lying within the unit circle is $\pi/4$ . Let $X$ be the random variable,

$$
X = \left\{ \begin{array}{l l} 1 & \text {i f U _ {1} ^ {2} + U _ {2} ^ {2} <   1} \\ 0 & \text {o t h e r w i s e .} \end{array} \right.
$$

![](images/124bc100c6d495bc7cd132b7e4713b9e6c15cd5bb854e3d02359f1cdd94ebcc7.jpg)  
Figure 4.8.1: Unit square with the first quadrant of the unit circle, Example 4.8.1.

Hence the mean of $X$ is $\mu = \pi / 4$ . Now suppose $\pi$ is unknown. One way of estimating $\pi$ is to repeat the experiment $n$ independent times, hence, obtaining a random sample $X_{1}, \ldots, X_{n}$ on $X$ . The statistic $4\overline{X}$ is an unbiased estimator of $\pi$ . The R function piest repeats this experiment $n$ times, returning the estimate of $\pi$ . This function and other R functions discussed in this chapter are available at the site discussed in the Preface. Figure 4.8.1 shows 20 realizations of this experiment. Note that of the 20 points, 15 fall within the unit circle. Hence our estimate of $\pi$ is $4(15 / 20) = 3.00$ . We ran this code for various values of $n$ with the following results:

<table><tr><td>n</td><td>100</td><td>500</td><td>1000</td><td>10,000</td><td>100,000</td></tr><tr><td>4x</td><td>3.24</td><td>3.072</td><td>3.132</td><td>3.138</td><td>3.13828</td></tr><tr><td>1.96·4√x(1-x)/n</td><td>0.308</td><td>0.148</td><td>0.102</td><td>0.032</td><td>0.010</td></tr></table>

We can use the large sample confidence interval derived in Section 4.2 to estimate the error of estimation. The corresponding $95\%$ confidence interval for $\pi$ is

$$
\left(4 \bar {x} - 1. 9 6 \cdot 4 \sqrt {\bar {x} (1 - \bar {x}) / n}, 4 \bar {x} + 1. 9 6 \cdot 4 \sqrt {\bar {x} (1 - \bar {x}) / n}\right). \tag {4.8.1}
$$

The last row of the above table contains the error part of the confidence intervals. Notice that all five confidence intervals trapped the true value of $\pi$ .

What about continuous random variables? For these we have the following theorem:

Theorem 4.8.1. Suppose the random variable $U$ has a uniform $(0,1)$ distribution. Let $F$ be a continuous distribution function. Then the random variable $X = F^{-1}(U)$ has distribution function $F$ .

Proof: Recall from the definition of a uniform distribution that $U$ has the distribution function $F_U(u) = u$ for $u \in (0,1)$ . Using this, the distribution-function technique, and assuming that $F(x)$ is strictly monotone, the distribution function of $X$ is

$$
\begin{array}{l} P [ X \leq x ] = P [ F ^ {- 1} (U) \leq x ] \\ = P [ U \leq F (x) ] \\ = F (x), \\ \end{array}
$$

which proves the theorem.

In the proof, we assumed that $F(x)$ was strictly monotone. As Exercise 4.8.13 shows, we can weaken this.

We can use this theorem to generate realizations (observations) of many different random variables. For example, suppose $X$ has the $\Gamma(1, \beta)$ -distribution. Suppose we have a uniform generator and we want to generate a realization of $X$ . The distribution function of $X$ is

$$
F (x) = 1 - e ^ {- x / \beta}, \quad x > 0.
$$

Hence the inverse of the distribution function is given by

$$
F ^ {- 1} (u) = - \beta \log (1 - u), \quad 0 <   u <   1. \tag {4.8.2}
$$

So if $U$ has the uniform $(0,1)$ distribution, then $X = -\beta \log(1 - U)$ has the $\Gamma(1,\beta)$ -distribution. For instance, suppose $\beta = 1$ and our uniform generator generated the following stream of uniform observations:

$$
0. 4 7 3, 0. 8 5 8, 0. 5 0 1, 0. 6 7 6, 0. 2 4 0.
$$

Then the corresponding stream of exponential observations is

$$
0. 6 4 1, 1. 9 5, 0. 6 9 6, 1. 1 3, 0. 2 7 4.
$$

As the next example shows, we can generate Poisson realizations using this exponential generation.

Example 4.8.2 (Simulating Poisson Processes). Let $X$ be the number of occurrences of an event over a unit of time and assume that it has a Poisson distribution with mean $\lambda$ , (3.2.1). Let $T_{1}, T_{2}, T_{3}, \ldots$ be the interarrival times of the occurrences. Recall from Remark 3.3.1 that $T_{1}, T_{2}, T_{3}, \ldots$ are iid with the common $\Gamma(1,1/\lambda)$ -distribution. Note that $X = k$ if and only if $\sum_{j=1}^{k} T_{j} \leq 1$ and $\sum_{j=1}^{k+1} T_{j} > 1$ . Using this fact and the generation of $\Gamma(1,1/\lambda)$ variates discussed above, the following algorithm generates a realization of $X$ (assume that the uniforms generated are independent of one another).

1. Set $X = 0$ and $T = 0$ .   
2. Generate $U$ uniform $(0,1)$ and let $Y = -(1 / \lambda)\log (1 - U)$ .   
3. Set $T = T + Y$ .   
4. If $T > 1$ , output $X$ ;

else set $X = X + 1$ and go to step 2.

The R function poisrand provides an implementation of this algorithm, generating $n$ simulations of a Poisson distribution with parameter $\lambda$ . As an illustration, we obtained 1000 realizations from a Poisson distribution with $\lambda = 5$ by running R with the R code temp = poisrand(1000,5), which stores the realizations in the vector temp. The sample average of these realizations is computed by the command mean(temp). In the situation that we ran, the realized mean was 4.895.

Example 4.8.3 (Monte Carlo Integration). Suppose we want to obtain the integral $\int_{a}^{b} g(x) \, dx$ for a continuous function $g$ over the closed and bounded interval $[a, b]$ . If the antiderivative of $g$ does not exist, then numerical integration is in order. A simple numerical technique is the method of Monte Carlo. We can write the integral as

$$
\int_ {a} ^ {b} g (x) d x = (b - a) \int_ {a} ^ {b} g (x) \frac {1}{b - a} d x = (b - a) E [ g (X) ],
$$

where $X$ has the uniform $(a, b)$ distribution. The Monte Carlo technique is then to generate a random sample $X_1, \ldots, X_n$ of size $n$ from the uniform $(a, b)$ distribution and compute $Y_i = (b - a)g(X_i)$ . Then $\overline{Y}$ is an unbiased estimator of $\int_{a}^{b} g(x) dx$ .

Example 4.8.4 (Estimation of $\pi$ by Monte Carlo Integration). For a numerical example, reconsider the estimation of $\pi$ . Instead of the experiment described in Example 4.8.1, we use the method of Monte Carlo integration. Let $g(x) = 4\sqrt{1 - x^2}$ for $0 < x < 1$ . Then

$$
\pi = \int_ {0} ^ {1} g (x) d x = E [ g (X) ],
$$

where $X$ has the uniform $(0,1)$ distribution. Hence we need to generate a random sample $X_{1},\ldots ,X_{n}$ from the uniform $(0,1)$ distribution and form $Y_{i} = 4\sqrt{1 - X_{i}^{2}}$ .

Then $\overline{Y}$ is a unbiased estimator of $\pi$ . Note that $\overline{Y}$ is estimating a mean, so the large sample confidence interval (4.2.6) derived in Example 4.2.2 for means can be used to estimate the error of estimation. Recall that this $95\%$ confidence interval is given by

$$
(\bar {y} - 1. 9 6 s / \sqrt {n}, \bar {y} + 1. 9 6 s / \sqrt {n}),
$$

where $s$ is the value of the sample standard deviation. We coded this algorithm in the R function piest2. The table below gives the results for estimates of $\pi$ for various runs of different sample sizes along with the confidence intervals.

<table><tr><td>n</td><td>100</td><td>1000</td><td>10,000</td><td>100,000</td></tr><tr><td>\(\overline{y}\)</td><td>3.217849</td><td>3.103322</td><td>3.135465</td><td>3.142066</td></tr><tr><td>\(\overline{y}-1.96(s/\sqrt{n})\)</td><td>3.054664</td><td>3.046330</td><td>3.118080</td><td>3.136535</td></tr><tr><td>\(\overline{y}+1.96(s/\sqrt{n})\)</td><td>3.381034</td><td>3.160314</td><td>3.152850</td><td>3.147597</td></tr></table>

Note that for each experiment the confidence interval trapped $\pi$

Numerical integration techniques have made great strides over the last 30 years. But the simplicity of integration by Monte Carlo still makes it a powerful technique.

As Theorem 4.8.1 shows, if we can obtain $F_{X}^{-1}(u)$ in closed form, then we can easily generate observations with cdf $F_{X}$ . In many cases where this is not possible, techniques have been developed to generate observations. Note that the normal distribution serves as an example of such a case, and, in the next example, we show how to generate normal observations. In Section 4.8.1, we discuss an algorithm that can be adapted for many of these cases.

Example 4.8.5 (Generating Normal Observations). To simulate normal variables, Box and Muller (1958) suggested the following procedure. Let $Y_{1}$ , $Y_{2}$ be a random sample from the uniform distribution over $0 < y < 1$ . Define $X_{1}$ and $X_{2}$ by

$$
X _ {1} = (- 2 \log Y _ {1}) ^ {1 / 2} \cos (2 \pi Y _ {2}),
$$

$$
X _ {2} = (- 2 \log Y _ {1}) ^ {1 / 2} \sin (2 \pi Y _ {2}).
$$

This transformation is one-to-one and maps $\{(y_1, y_2) : 0 < y_1 < 1, 0 < y_2 < 1\}$ onto $\{(x_1, x_2) : -\infty < x_1 < \infty, -\infty < x_2 < \infty\}$ except for sets involving $x_1 = 0$ and $x_2 = 0$ , which have probability zero. The inverse transformation is given by

$$
y _ {1} = \exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right),
$$

$$
y _ {2} = \frac {1}{2 \pi} \arctan \frac {x _ {2}}{x _ {1}}.
$$

This has the Jacobian

$$
\begin{array}{l} J = \left| \begin{array}{c c} (- x _ {1}) \exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right) & (- x _ {2}) \exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right) \\ \frac {- x _ {2} / x _ {1} ^ {2}}{(2 \pi) (1 + x _ {2} ^ {2} / x _ {1} ^ {2})} & \frac {1 / x _ {1}}{(2 \pi) (1 + x _ {2} ^ {2} / x _ {1} ^ {2})} \end{array} \right| \\ = \frac {- (1 + x _ {2} ^ {2} / x _ {1} ^ {2}) \exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right)}{(2 \pi) (1 + x _ {2} ^ {2} / x _ {1} ^ {2})} = \frac {- \exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right)}{2 \pi}. \\ \end{array}
$$

Since the joint pdf of $Y_{1}$ and $Y_{2}$ is 1 on $0 < y_{1} < 1, 0 < y_{2} < 1$ , and zero elsewhere, the joint pdf of $X_{1}$ and $X_{2}$ is

$$
\begin{array}{l} \frac {\exp \left(- \frac {x _ {1} ^ {2} + x _ {2} ^ {2}}{2}\right)}{2 \pi}, - \infty <   x _ {1} <   \infty , - \infty <   x _ {2} <   \infty . \end{array}
$$

That is, $X_{1}$ and $X_{2}$ are independent, standard normal random variables. One of the most commonly used normal generators is a variant of the above procedure called the Marsaglia and Bray (1964) algorithm; see Exercise 4.8.21.

Observations from a contaminated normal distribution, discussed in Section 3.4.1, can easily be generated using a normal generator and a uniform generator. We close this section by estimating via Monte Carlo the significance level of a $t$ -test when the underlying distribution is a contaminated normal.

Example 4.8.6. Let $X$ be a random variable with mean $\mu$ and consider the hypotheses

$$
H _ {0}: \mu = 0 \text {v e r s u s} H _ {1}: \mu > 0. \tag {4.8.3}
$$

Suppose we decide to base this test on a sample of size $n = 20$ from the distribution of $X$ , using the $t$ -test with rejection rule

$$
\text {R e j e c t} H _ {0}: \mu = 0 \text {i n f a v o r} H _ {1}: \mu > 0 \text {i f} t > t _ {. 0 5, 1 9} = 1. 7 2 9, \tag {4.8.4}
$$

where $t = \overline{x} / (s / \sqrt{20})$ and $\overline{x}$ and $s$ are the sample mean and standard deviation, respectively. If $X$ has a normal distribution, then this test has level 0.05. But what if $X$ does not have a normal distribution? In particular, for this example, suppose $X$ has the contaminated normal distribution given by (3.4.17) with $\epsilon = 0.25$ and $\sigma_c = 25$ ; that is, $75\%$ of the time an observation is generated by a standard normal distribution, while $25\%$ of the time it is generated by a normal distribution with mean 0 and standard deviation 25. Hence the mean of $X$ is 0, so $H_0$ is true. To obtain the exact significance level of the test would be quite complicated. We would have to obtain the distribution of $t$ when $X$ has this contaminated normal distribution. As an alternative, we estimate the level (and the error of estimation) by simulation. Let $N$ be the number of simulations. The following algorithm gives the steps of our simulation:

1. Set $k = 1$ , $I = 0$ .   
2. Simulate a random sample of size 20 from the distribution of $X$ .   
3. Based on this sample, compute the test statistic $t$ .   
4. If $t > 1.729$ , increase $I$ by 1.   
5. If $k = N$ ; go to step 6; else increase $k$ by 1 and go to step 2.   
6. Compute $\widehat{\alpha} = I / N$ and the approximate error $= 1.96\sqrt{\widehat{\alpha}(1 - \widehat{\alpha}) / N}$ .

Then $\widehat{\alpha}$ is our simulated estimate of $\alpha$ and the half-width of a confidence interval for $\alpha$ serves as our estimate of the error of estimation.

The R function empalphacn implements this algorithm. We ran it for $N = 10,000$ obtaining the results:

<table><tr><td>No. Simulat.</td><td>Empirical α</td><td>Error</td><td>95% CI for α</td></tr><tr><td>10,000</td><td>0.0412</td><td>0.0039</td><td>(0.0373, 0.0451)</td></tr></table>

Based on these results, the $t$ -test appears to be conservative when the sample is drawn from this contaminated normal distribution.

# 4.8.1 Accept-Reject Generation Algorithm

In this section, we develop the accept-reject procedure that can often be used to simulate random variables whose inverse cdf cannot be obtained in closed form. Let $X$ be a continuous random variable with pdf $f(x)$ . For this discussion, we call this pdf the target pdf. Suppose it is relatively easy to generate an observation of the random variable $Y$ which has pdf $g(x)$ and that for some constant $M$ we have

$$
f (x) \leq M g (x), - \infty <   x <   \infty . \tag {4.8.5}
$$

We call $g(x)$ the instrumental pdf. For clarity, we write the accept-reject as an algorithm:

Algorithm 4.8.1 (Accept-Reject Algorithm). Let $f(x)$ be a pdf. Suppose that $Y$ is a random variable with pdf $g(y)$ , $U$ is a random variable with a uniform(0,1) distribution, $Y$ and $U$ are independent, and (4.8.5) holds. The following algorithm generates a random variable $X$ with pdf $f(x)$ .

1. Generate $Y$ and $U$ .   
2. If $U \leq \frac{f(Y)}{Mg(Y)}$ , then take $X = Y$ . Otherwise return to step 1.   
3. $X$ has pdf $f(x)$

Proof of the validity of the algorithm: Let $-\infty < x < \infty$ . Then

$$
\begin{array}{l} P [ X \leq x ] = P \left[ Y \leq x | U \leq \frac {f (Y)}{M g (Y)} \right] \\ = \frac {P [ Y \leq x , U \leq \frac {f (Y)}{M g (Y)} ]}{P [ U \leq \frac {f (Y)}{M g (Y)} ]} \\ = \frac {\int_ {- \infty} ^ {x} \left[ \int_ {0} ^ {f (y) / M g (y)} d u \right] g (y) d y}{\int_ {- \infty} ^ {\infty} \left[ \int_ {0} ^ {f (y) / M g (y)} d u \right] g (y) d y} \\ = \frac {\int_ {- \infty} ^ {x} \frac {f (y)}{M g (y)} g (y) d y}{\int_ {- \infty} ^ {\infty} \frac {f (y)}{M g (y)} g (y) d y} (4.8.6) \\ = \int_ {- \infty} ^ {x} f (y) d y. (4.8.7) \\ \end{array}
$$

Hence, by differentiating both sides, we find that the pdf of $X$ is $f(x)$ .

There are two facts worth noting. First, the probability of an acceptance in the algorithm is $1 / M$ . This can be seen in the derivation in the proof of the theorem. Just consider the denominators in the derivation which show that

$$
P \left[ U \leq \frac {f (Y)}{M g (Y)} \right] = \frac {1}{M}. \tag {4.8.8}
$$

Hence, for efficiency of the algorithm we want $M$ as small as possible. Secondly, normalizing constants of the two pdfs $f(x)$ and $g(x)$ can be ignored. For example, if $f(x) = kh(x)$ and $g(x) = ct(x)$ for constants $c$ and $k$ , then we can use the rule

$$
h (x) \leq M _ {2} t (x), - \infty <   x <   \infty , \tag {4.8.9}
$$

and change the ratio in step 2 of the algorithm to $U \leq h(Y) / [M_2t(Y)]$ . It follows directly that expression (4.8.5) holds if and only if expression (4.8.9) holds where $M_2 = cM / k$ . This often simplifies the use of the accept-reject algorithm.

We next present two examples of the accept-reject algorithm. The first example offers a normal generator where the instrumental random variable, $Y$ , has a Cauchy distribution. The second example shows how all gamma distributions can be generated.

Example 4.8.7. Suppose that $X$ is a normally distributed random variable with pdf $\phi(x) = (2\pi)^{-1/2} \exp\{-x^2/2\}$ and $Y$ has a Cauchy distribution with pdf $g(x) = \pi^{-1}(1 + x^2)^{-1}$ . As Exercise 4.8.9 shows, the Cauchy distribution is easy to simulate because its inverse cdf is a known function. Ignoring normalizing constants, the ratio to bound is

$$
\frac {f (x)}{g (x)} \propto (1 + x ^ {2}) \exp \{- x ^ {2} / 2 \}, \quad - \infty <   x <   \infty . \tag {4.8.10}
$$

As Exercise 4.8.17 shows, the derivative of this ratio is $-x\exp \{-x^2 /2\} (x^2 -1)$ which has critical values at $\pm 1$ . These values provide maxima to (4.8.10). Hence,

$$
(1 + x ^ {2}) \exp \{- x ^ {2} / 2 \} \leq 2 \exp \{- 1 / 2 \} = 1. 2 1 3,
$$

so $M_2 = 1.213$ . Hence, from the above discussion, $M = (\pi / \sqrt{2\pi}) 1.213 = 1.520$ . Hence, the acceptance rate of the algorithm is $1 / M = 0.6577$ .

Example 4.8.8. Suppose we want to generate observations from a $\Gamma(\alpha, \beta)$ . First, if $Y$ has a $\Gamma(\alpha, 1)$ -distribution then $\beta Y$ has a $\Gamma(\alpha, \beta)$ -distribution. Hence, we need only consider $\Gamma(\alpha, 1)$ distributions. So let $X$ have a $\Gamma(\alpha, 1)$ -distribution. If $\alpha$ is a positive integer then by Theorem 3.3.1 we can write $X$ as

$$
X = T _ {1} + T _ {2} + \dots + T _ {\alpha},
$$

where $T_{1}, T_{2}, \dots, T_{\alpha}$ are independent and identically distributed with the common $\Gamma(1,1)$ -distribution. In the discussion around expression (4.8.2), we have shown how to generate $T_{i}$ .

Assume then that $X$ has a $\Gamma(\alpha, 1)$ distribution, where $\alpha$ is not an integer. Assume first that $\alpha > 1$ . Let $Y$ have a $\Gamma([\alpha], 1/b)$ distribution, where $b < 1$ is chosen later and, as usual, $[\alpha]$ means the greatest integer less than or equal to $\alpha$ . To establish rule (4.8.9), consider the ratio, with $h(x)$ and $t(x)$ proportional to the pdfs of $x$ and $y$ , respectively, given by

$$
\frac {h (x)}{t (x)} = b ^ {- [ \alpha ]} x ^ {\alpha - [ \alpha ]} e ^ {- (1 - b) x}, \tag {4.8.11}
$$

where we have ignored some of the normalizing constants. We next determine the constant $b$ .

As Exercise 4.8.14 shows, the derivative of expression (4.8.11) is

$$
\frac {d}{d x} b ^ {- [ \alpha ]} x ^ {\alpha - [ \alpha ]} e ^ {- (1 - b) x} = b ^ {- [ \alpha ]} e ^ {- (1 - b) x} [ (\alpha - [ \alpha ]) - x (1 - b) ] x ^ {\alpha - [ \alpha ] - 1}, \tag {4.8.12}
$$

which has a maximum critical value at $x = (\alpha - [\alpha]) / (1 - b)$ . Hence, using the maximum of $h(x) / t(x)$ ,

$$
\frac {h (x)}{t (x)} \leq b ^ {- [ \alpha ]} \left[ \frac {\alpha - [ \alpha ]}{(1 - b) e} \right] ^ {\alpha - [ \alpha ]}. \tag {4.8.13}
$$

Now, we need to find our choice of $b$ . Differentiating the right side of this inequality with respect to $b$ , we get, as Exercise 4.8.15 shows,

$$
\frac {d}{d b} b ^ {- [ \alpha ]} (1 - b) ^ {[ \alpha ] - \alpha} = - b ^ {- [ \alpha ]} (1 - b) ^ {[ \alpha ] - \alpha} \left[ \frac {[ \alpha ] - \alpha b}{b (1 - b)} \right], \tag {4.8.14}
$$

which has a critical value at $b = [\alpha] / \alpha < 1$ . As shown in that exercise, this value of $b$ provides a minimum of the right side of expression (4.8.13). Thus, if we take $b = [\alpha] / \alpha < 1$ , then equality (4.8.13) holds and it is the tightest inequality possible and, hence, provides the highest acceptance rate. The final value of $M$ is the right side of expression (4.8.13) evaluated at $b = [\alpha] / \alpha < 1$ .

What if $0 < \alpha < 1$ ? Then the above argument does not work. In this case write $X = YU^{1 / \alpha}$ where $Y$ has a $\Gamma (\alpha +1,1)$ -distribution, $U$ has a uniform $(0,1)$ -distribution, and $Y$ and $U$ are independent. Then, as the derivation in Exercise 4.8.16 shows, $X$ has a $\Gamma (\alpha ,1)$ -distribution and we are finished.

For further discussion, see Kennedy and Gentle (1980) and Robert and Casella (1999).

# EXERCISES

4.8.1. Prove the converse of Theorem MCT. That is, let $X$ be a random variable with a continuous cdf $F(x)$ . Assume that $F(x)$ is strictly increasing on the space of $X$ . Consider the random variable $Z = F(X)$ . Show that $Z$ has a uniform distribution on the interval (0, 1).

4.8.2. Recall that $\log 2 = \int_0^1\frac{1}{x + 1} dx$ . Hence, by using a uniform(0,1) generator, approximate log 2. Obtain an error of estimation in terms of a large sample $95\%$ confidence interval. Write an R function for the estimate and the error of estimation. Obtain your estimate for 10,000 simulations and compare it to the true value.

4.8.3. Similar to Exercise 4.8.2 but now approximate $\int_0^{1.96} \frac{1}{\sqrt{2\pi}} \exp \left\{-\frac{1}{2} t^2\right\} dt$ .

4.8.4. Suppose $X$ is a random variable with the pdf $f_{X}(x) = b^{-1}f((x - a) / b)$ , where $b > 0$ . Suppose we can generate observations from $f(z)$ . Explain how we can generate observations from $f_{X}(x)$ .

4.8.5. Determine a method to generate random observations for the logistic pdf, (4.4.11). Write an R function that returns a random sample of observations from a logistic distribution. Use your function to generate 10,000 observations from this pdf. Then obtain a histogram (use hist(x, pr=T), where x contains the observations). On this histogram overlay a plot of the pdf.

4.8.6. Determine a method to generate random observations for the following pdf:

$$
f (x) = \left\{ \begin{array}{l l} 4 x ^ {3} & 0 <   x <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Write an R function that returns a random sample of observations from this pdf.

4.8.7. Obtain the inverse function of the cdf of the Laplace pdf, given by $f(x) = (1/2)e^{-|x|}$ , for $-\infty < x < \infty$ . Write an R function that returns a random sample of observations from this distribution.

4.8.8. Determine a method to generate random observations for the extreme-valued pdf that is given by

$$
f (x) = \exp \left\{x - e ^ {x} \right\}, \quad - \infty <   x <   \infty . \tag {4.8.15}
$$

Write an R function that returns a random sample of observations from an extreme-valued distribution. Use your function to generate 10,000 observations from this pdf. Then obtain a histogram (use hist(x, pr=T), where x contains the observations). On the histogram overlay a plot of the pdf.

4.8.9. Determine a method to generate random observations for the Cauchy distribution with pdf

$$
f (x) = \frac {1}{\pi \left(1 + x ^ {2}\right)}, \quad - \infty <   x <   \infty . \tag {4.8.16}
$$

Write an R function that returns a random sample of observations from this Cauchy distribution.

4.8.10. Suppose we are interested in a particular Weibull distribution with pdf

$$
f (x) = \left\{ \begin{array}{l l} \frac {1}{\theta^ {3}} 3 x ^ {2} e ^ {- x ^ {3} / \theta^ {3}} & 0 <   x <   \infty \\ 0 & \mathrm {e l s e w h e r e .} \end{array} \right.
$$

Determine a method to generate random observations from this Weibull distribution. Write an R function that returns such a sample.

Hint: Find $F^{-1}(u)$

4.8.11. Consider the situation in Example 4.8.6 with the hypotheses (4.8.3). Write an algorithm that simulates the power of the test (4.8.4) to detect the alternative $\mu = 0.5$ under the same contaminated normal distribution as in the example. Modify the $R$ function empalphacn(N) to simulate this power and to obtain an estimate of the error of estimation.   
4.8.12. For the last exercise, write an algorithm to simulate the significance level and power to detect the alternative $\mu = 0.5$ for the test (4.8.4) when the underlying distribution is the logistic distribution (4.4.11).   
4.8.13. For the proof of Theorem 4.8.1, we assumed that the cdf was strictly increasing over its support. Consider a random variable $X$ with cdf $F(x)$ that is not strictly increasing. Define as the inverse of $F(x)$ the function

$$
F ^ {- 1} (u) = \inf  \{x: F (x) \geq u \}, \quad 0 <   u <   1.
$$

Let $U$ have a uniform $(0,1)$ distribution. Prove that the random variable $F^{-1}(U)$ has cdf $F(x)$ .

4.8.14. Verify the derivative in expression (4.8.12) and show that the function (4.8.11) attains a maximum at the critical value $x = (\alpha - [\alpha]) / (1 - b)$ .

4.8.15. Derive expression (4.8.14) and show that the resulting critical value $b = [\alpha] / \alpha < 1$ gives a minimum of the function that is the right side of expression (4.8.13).

4.8.16. Assume that $Y_{1}$ has a $\Gamma(\alpha + 1, 1)$ -distribution, $Y_{2}$ has a uniform $(0, 1)$ distribution, and $Y_{1}$ and $Y_{2}$ are independent. Consider the transformation $X_{1} = Y_{1}Y_{2}^{1 / \alpha}$ and $X_{2} = Y_{2}$ .

(a) Show that the inverse transformation is: $y_{1} = x_{1} / x_{2}^{1 / \alpha}$ and $y_{2} = x_{2}$ with support $0 < x_{1} < \infty$ and $0 < x_{2} < 1$ .   
(b) Show that the Jacobian of the transformation is $1 / x_2^{1 / \alpha}$ and the pdf of $(X_{1},X_{2})$ is

$$
f (x _ {1}, x _ {2}) = \frac {1}{\Gamma (\alpha + 1)} \frac {x _ {1} ^ {\alpha}}{x _ {2}} \exp \left\{- \frac {x _ {1}}{x _ {2} ^ {1 / \alpha}} \right\} \frac {1}{x _ {2} ^ {1 / \alpha}}, 0 <   x _ {1} <   \infty \mathrm {a n d} 0 <   x _ {2} <   1.
$$

(c) Show that the marginal distribution of $X_{1}$ is $\Gamma (\alpha ,1)$

4.8.17. Show that the derivative of the ratio in expression (4.8.10) is given by the function $-x\exp \{-x^2 /2\} (x^2 -1)$ with critical values $\pm 1$ . Show that the critical values provide maxima for expression (4.8.10).

4.8.18. Consider the pdf

$$
f (x) = \left\{ \begin{array}{l l} \beta x ^ {\beta - 1} & 0 <   x <   1 \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

for $\beta > 1$ .

(a) Use Theorem 4.8.1 to generate an observation from this pdf.   
(b) Use the accept-reject algorithm to generate an observation from this pdf.

4.8.19. Proceeding similar to Example 4.8.7, use the accept-reject algorithm to generate an observation from a $t$ distribution with $r > 1$ degrees of freedom when $g(x)$ is the Cauchy pdf.

4.8.20. For $\alpha > 0$ and $\beta > 0$ , consider the following accept-reject algorithm:

1. Generate $U_{1}$ and $U_{2}$ iid uniform(0,1) random variables. Set $V_{1} = U_{1}^{1 / \alpha}$ and $V_{2} = U_{2}^{1 / \beta}$ .   
2. Set $W = V_{1} + V_{2}$ . If $W \leq 1$ , set $X = V_{1} / W$ ; else go to step 1.   
3. Deliver $X$

Show that $X$ has a beta distribution with parameters $\alpha$ and $\beta$ , (3.3.9). See Kennedy and Gentle (1980).

4.8.21. Consider the following algorithm:

1. Generate $U$ and $V$ independent uniform $(-1, 1)$ random variables.   
2. Set $W = U^{2} + V^{2}$ .   
3. If $W > 1$ go to step 1.   
4. Set $Z = \sqrt{(-2\log W) / W}$ and let $X_{1} = UZ$ and $X_{2} = VZ$ .

Show that the random variables $X_{1}$ and $X_{2}$ are iid with a common $N(0,1)$ distribution. This algorithm was proposed by Marsaglia and Bray (1964).

# 4.9 Bootstrap Procedures

In the last section, we introduced the method of Monte Carlo and discussed several of its applications. In the last few years, however, Monte Carlo procedures have become increasingly used in statistical inference. In this section, we present the bootstrap, one of these procedures. We concentrate on confidence intervals and tests for one- and two-sample problems in this section.

# 4.9.1 Percentile Bootstrap Confidence Intervals

Let $X$ be a random variable of the continuous type with pdf $f(x; \theta)$ , for $\theta \in \Omega$ . Suppose $\mathbf{X} = (X_1, X_2, \ldots, X_n)$ is a random sample on $X$ and $\widehat{\theta} = \widehat{\theta}(\mathbf{X})$ is a point estimator of $\theta$ . The vector notation, $\mathbf{X}$ , proves useful in this section. In Sections 4.2 and 4.3, we discussed the problem of obtaining confidence intervals for $\theta$ in certain situations. In this section, we discuss a general method called the percentile bootstrap procedure, which is a resampling procedure. It was proposed by Efron (1979).

Informative discussions of such procedures can be found in Efron and Tibshirani (1993) and Davison and Hinkley (1997).

To motivate the procedure, suppose for the moment that

$$
\widehat {\theta} \text {h a s a} N \left(\theta , \sigma_ {\widehat {\theta}} ^ {2}\right) \text {d i s t r i b u t i o n .} \tag {4.9.1}
$$

Then as in Section 4.2, a $(1 - \alpha)100\%$ confidence interval for $\theta$ is $(\widehat{\theta}_L,\widehat{\theta}_U)$ , where

$$
\widehat {\theta} _ {L} = \widehat {\theta} - z ^ {(1 - \alpha / 2)} \sigma_ {\widehat {\theta}} \quad \text {a n d} \quad \widehat {\theta} _ {U} = \widehat {\theta} - z ^ {(\alpha / 2)} \sigma_ {\widehat {\theta}}, \tag {4.9.2}
$$

and $z^{(\gamma)}$ denotes the $\gamma 100$ th percentile of a standard normal random variable; i.e., $z^{(\gamma)} = \Phi^{-1}(\gamma)$ , where $\Phi$ is the cdf of a $N(0,1)$ random variable (see also Exercise 4.9.5). We have gone to a superscript notation here to avoid confusion with the usual subscript notation on critical values.

Now suppose that $\widehat{\theta}$ and $\sigma_{\widehat{\theta}}$ are realizations from the sample and $\widehat{\theta}_L$ and $\widehat{\theta}_U$ are calculated as in (4.9.2). Next suppose that $\widehat{\theta}^*$ is a random variable with a $N(\widehat{\theta},\sigma_{\widehat{\theta}}^{2})$ distribution. Then, by (4.9.2),

$$
P \left(\widehat {\theta} ^ {*} \leq \widehat {\theta} _ {L}\right) = P \left(\frac {\widehat {\theta} ^ {*} - \widehat {\theta}}{\sigma_ {\widehat {\theta}}} \leq - z ^ {(1 - \alpha / 2)}\right) = \alpha / 2. \tag {4.9.3}
$$

Likewise, $P(\widehat{\theta}^* \leq \widehat{\theta}_U) = 1 - (\alpha / 2)$ . Therefore, $\widehat{\theta}_L$ and $\widehat{\theta}_U$ are the $\frac{\alpha}{2}$ th and $(1 - \frac{\alpha}{2})$ th percentiles of the distribution of $\widehat{\theta}^*$ . That is, the percentiles of the $N(\widehat{\theta}, \sigma_\widehat{\theta}^2)$ distribution form the $(1 - \alpha)$ th confidence interval for $\theta$ .

We want our final procedure to be quite general, so the normality assumption (4.9.1) is definitely not desired and, in Remark 4.9.1, we do show that this assumption is not necessary. So, in general, let $H(t)$ denote the cdf of $\widehat{\theta}$ .

In practice, though, we do not know the function $H(t)$ . Hence the above confidence interval defined by statement (4.9.3) cannot be obtained. But suppose we could take an infinite number of samples $\mathbf{X}_1, \mathbf{X}_2, \ldots$ ; obtain $\widehat{\theta}^* = \widehat{\theta}(\mathbf{X}^*)$ for each sample $\mathbf{X}^*$ ; and then form the histogram of these estimates $\widehat{\theta}^*$ . The percentiles of this histogram would be the confidence interval defined by expression (4.9.3). Since we only have one sample, this is impossible. It is, however, the idea behind bootstrap procedures.

Bootstrap procedures simply resample from the empirical distribution defined by the one sample. The sampling is done at random and with replacement and the resamples are all of size $n$ , the size of the original sample. That is, suppose $\mathbf{x}' = (x_1, x_2, \ldots, x_n)$ denotes the realization of the sample. Let $\widehat{F}_n$ denote the empirical distribution function of the sample. Recall that $\widehat{F}_n$ is a discrete cdf that puts mass $n^{-1}$ at each point $x_i$ and that $\widehat{F}_n(x)$ is an estimator of $F(x)$ . Then a bootstrap sample is a random sample, say $\mathbf{x}^{*'} = (x_1^*, x_2^*, \ldots, x_n^*)$ , drawn from $\widehat{F}_n$ . For example, it follows from the definition of expectation that

$$
E \left(x _ {i} ^ {*}\right) = \sum_ {i = 1} ^ {n} x _ {i} \frac {1}{n} = \frac {1}{n} \sum_ {i = 1} ^ {n} x _ {i} = \bar {x}. \tag {4.9.4}
$$

Likewise $V(x_{i}^{*}) = n^{-1}\sum_{i = 1}^{n}(x_{i} - \overline{x})^{2}$ ; see Exercise 4.9.2. At first glance, this resampling the sample seems like it would not work. But our only information on sampling variability is within the sample itself, and by resampling the sample we are simulating this variability.

We now give an algorithm that obtains a bootstrap confidence interval. For clarity, we present a formal algorithm, which can be readily coded into languages such as R. Let $\mathbf{x}' = (x_1, x_2, \ldots, x_n)$ be the realization of a random sample drawn from a cdf $F(x; \theta)$ , $\theta \in \Omega$ . Let $\widehat{\theta}$ be a point estimator of $\theta$ . Let $B$ , an integer, denote the number of bootstrap replications, i.e., the number of resamples. In practice, $B$ is often 3000 or more.

1. Set $j = 1$ .   
2. While $j \leq B$ , do steps 2-5.   
3. Let $\mathbf{x}_j^*$ be a random sample of size $n$ drawn from the sample $\mathbf{x}$ . That is, the observations $\mathbf{x}_j^*$ are drawn at random from $x_1, x_2, \ldots, x_n$ , with replacement.   
4. Let $\widehat{\theta}_j^* = \widehat{\theta} (\mathbf{x}_j^*)$   
5. Replace $j$ by $j + 1$ .   
6. Let $\widehat{\theta}_{(1)}^{*} \leq \widehat{\theta}_{(2)}^{*} \leq \dots \leq \widehat{\theta}_{(B)}^{*}$ denote the ordered values of $\widehat{\theta}_{1}^{*}, \widehat{\theta}_{2}^{*}, \ldots, \widehat{\theta}_{B}^{*}$ . Let $m = [(\alpha / 2)B]$ , where $[\cdot]$ denotes the greatest integer function. Form the interval

$$
\left(\widehat {\theta} _ {(m)} ^ {*}, \widehat {\theta} _ {(B + 1 - m)} ^ {*}\right); \tag {4.9.5}
$$

that is, obtain the $\frac{\alpha}{2} 100\%$ and $(1 - \frac{\alpha}{2}) 100\%$ percentiles of the sampling distribution of $\widehat{\theta}_1^*, \widehat{\theta}_2^*, \ldots, \widehat{\theta}_B^*$ .

The interval in (4.9.5) is called the percentile bootstrap confidence interval for $\theta$ . In step 6, the subscripted parenthetical notation is a common notation for order statistics (Section 4.4), which is handy in this section.

For the remainder of this subsection, we use as our estimator of $\theta$ the sample mean. For the sample mean, the following R function percentciboot is an R implementation of this algorithm (it can be downloaded at the site listed in Chapter 1):

```r
percentciboot <- function(x,b,alpha){
    theta = mean(x); thetastar = rep(0,b); n=length(x)
    for (i in 1:b){xstar = sample(x,n,replace=T)
        thetastar[i] = mean(xstar)}
    thetastar = sort(thetastar); pick = round((alpha/2)*(b+1))
    lower = thetastar[pick]; upper = thetastar[b-pick+1]
    list(theta = theta,lower=lower,upper=upper)
    #list(theta = theta,lower=lower,upper=upper, thetasta = thetastar) 
```

The input consists of the sample $\mathbf{x}$ , the number of bootstraps $\mathsf{b}$ , and the desired confidence coefficient $\alpha$ . The second line of code computes the mean and the

size of the sample and provides a vector to store the $\hat{\theta}^*\mathrm{s}$ . In the for loop, the $i$ th bootstrap sample is obtained by the single command sample(x,n,replace=T), which is followed by the computation of $\hat{\theta}_i^*$ . The remainder of the code forms the bootstrap confidence interval, while the list command returns the estimate and the bootstrap confidence interval. The optional second list command returns the $\hat{\theta}^*\mathrm{s}$ , also. Notice that it easy to change the code for an estimator other than the mean. For example, to obtain a bootstrap confidence interval for the median just replace the two occurrences of mean with median. We illustrate this discussion in the next example.

Example 4.9.1. In this example, we sample from a known distribution, but, in practice, the distribution is usually unknown. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a $\Gamma(1, \beta)$ distribution. Since the mean of this distribution is $\beta$ , the sample average $\overline{X}$ is an unbiased estimator of $\beta$ . In this example, the $\overline{X}$ serves as our point estimator of $\beta$ . The following 20 data points are the realizations (rounded) of a random sample of size $n = 20$ from a $\Gamma(1, 100)$ distribution:

<table><tr><td>131.7</td><td>182.7</td><td>73.3</td><td>10.7</td><td>150.4</td><td>42.3</td><td>22.2</td><td>17.9</td><td>264.0</td><td>154.4</td></tr><tr><td>4.3</td><td>265.6</td><td>61.9</td><td>10.8</td><td>48.8</td><td>22.5</td><td>8.8</td><td>150.6</td><td>103.0</td><td>85.9</td></tr></table>

The value of $\overline{X}$ for this sample is $\overline{x} = 90.59$ , which is our point estimate of $\beta$ . For illustration, we generated one bootstrap sample of these data. This ordered bootstrap sample is

<table><tr><td>4.3</td><td>4.3</td><td>4.3</td><td>10.8</td><td>10.8</td><td>10.8</td><td>10.8</td><td>17.9</td><td>22.5</td><td>42.3</td></tr><tr><td>48.8</td><td>48.8</td><td>85.9</td><td>131.7</td><td>131.7</td><td>150.4</td><td>154.4</td><td>154.4</td><td>264.0</td><td>265.6</td></tr></table>

The sample mean of this particular bootstrap sample is $\overline{x}^{*} = 78.725$ . To obtain our bootstrap confidence interval for $\beta$ , we need to compute many more resamples. For this computation, we used the R function percentcboot discussed above. Let $\mathbf{x}$ denote the R vector of the original sample of observations. We selected 3000 as the number of bootstraps and chose $\alpha = 0.10$ . We used the code percentcboot(x,3000,.10) to compute our bootstrap confidence interval. Figure 4.9.1 displays a histogram of the 3000 sample means $\overline{x}^{*}$ s computed by the code. The sample mean of these 3000 values is 90.13, close to $\overline{x} = 90.59$ . Our program also obtained a $90\%$ (bootstrap percentile) confidence interval given by (61.655, 120.48), which the reader can locate on the figure. It does trap the true value $\mu = 100$ . Exercise 4.9.3 shows that if we are sampling from a $\Gamma(1,\beta)$ distribution, then the interval $(2n\overline{x} / [\chi_{2n}^2]^{(1 - (\alpha/2))}, 2n\overline{x} / [\chi_{2n}^2]^{(\alpha/2)})$ is an exact $(1 - \alpha)100\%$ confidence interval for $\beta$ . Note that, in keeping with our superscript notation for critical values, $[\chi_{2n}^2]^{(\gamma)}$ denotes the $\gamma100\%$ percentile of a $\chi^2$ distribution with $2n$ degrees of freedom. This exact $90\%$ confidence interval for our sample is (64.99, 136.69).

What about the validity of a bootstrap confidence interval? Davison and Hinkley (1997) discuss the theory behind the bootstrap in Chapter 2 of their book. Under some general conditions, they show that the bootstrap confidence interval is asymptotically valid.

![](images/e63481f9cb936fdae48d9725716348ab189f24920217ad2116d7b75b1e9abc30.jpg)  
Figure 4.9.1: Histogram of the 3000 bootstrap $\overline{x}^*$ s. The $90\%$ bootstrap confidence interval is (61.655, 120.48).

One way of improving the bootstrap is to use a pivot random variable, a variable whose distribution is free of other parameters. For instance, in the last example, instead of using $\overline{X}$ , use $\overline{X} / \hat{\sigma}_{\overline{X}}$ , where $\hat{\sigma}_{\overline{X}} = S / \sqrt{n}$ and $S = [\sum (X_i - \overline{X})^2 /(n - 1)]^{1 / 2}$ ; that is, adjust $\overline{X}$ by its standard error. This is discussed in Exercise 4.9.6. Other improvements are discussed in the two books cited earlier.

Remark 4.9.1. *Briefly, we show that the normal assumption on the distribution of $\widehat{\theta}$ , (4.9.1), is transparent to the argument around expression (4.9.3); see Efron and Tibshirani (1993) for further discussion. Suppose $H$ is the cdf of $\widehat{\theta}$ and that $H$ depends on $\theta$ . Then, using Theorem 4.8.1, we can find an increasing transformation $\phi = m(\theta)$ such that the distribution of $\widehat{\phi} = m(\widehat{\theta})$ is $N(\phi, \sigma_c^2)$ , where $\phi = m(\theta)$ and $\sigma_c^2$ is some variance. For example, take the transformation to be $m(\theta) = F_c^{-1}(H(\theta))$ , where $F_c(x)$ is the cdf of a $N(\phi, \sigma_c^2)$ distribution. Then, as above, $(\widehat{\phi} - z^{(1 - \alpha / 2)}\sigma_c, \widehat{\phi} - z^{(\alpha / 2)}\sigma_c)$ is a $(1 - \alpha)$ $100\%$ confidence interval for $\phi$ . But note that

$$
\begin{array}{l} {1 - \alpha} = {P \left[ \widehat {\phi} - z ^ {(1 - \alpha / 2)} \sigma_ {c} <   \phi <   \widehat {\phi} - z ^ {(\alpha / 2)} \sigma_ {c}) \right]} \\ { = } { P \left[ m ^ { - 1 } ( \widehat { \phi } - z ^ { ( 1 - \alpha / 2 ) } \sigma _ { c } ) <   \theta <   m ^ { - 1 } ( \widehat { \phi } - z ^ { ( \alpha / 2 ) } \sigma _ { c } ) \right] . } { ( 4 . 9 . 6 ) } \\ \end{array}
$$

Hence, $(m^{-1}(\widehat{\phi} -z^{(1 - \alpha /2)}\sigma_c),m^{-1}(\widehat{\phi} -z^{(\alpha /2)}\sigma_c))$ is a $(1 - \alpha)100\%$ confidence interval for $\theta$ . Now suppose $\widehat{H}$ is the cdf $H$ with a realization $\widehat{\theta}$ substituted in for $\theta$ , i.e., analogous to the $N(\widehat{\theta},\sigma_{\widehat{\theta}}^2)$ distribution above. Suppose $\widehat{\theta}^*$ is a random variable with

cdf $\widehat{H}$ .Let $\widehat{\phi} = m(\widehat{\theta})$ and $\widehat{\phi}^{*} = m(\widehat{\theta}^{*})$ .We have

$$
\begin{array}{l} P \left[ \widehat {\theta} ^ {*} \leq m ^ {- 1} \left(\widehat {\phi} - z ^ {(1 - \alpha / 2)} \sigma_ {c}\right) \right] = P \left[ \widehat {\phi} ^ {*} \leq \widehat {\phi} - z ^ {(1 - \alpha / 2)} \sigma_ {c} \right] \\ = P \left[ \frac {\widehat {\phi} ^ {*} - \widehat {\phi}}{\sigma_ {c}} \leq - z ^ {(1 - \alpha / 2)} \right] = \alpha / 2, \\ \end{array}
$$

similar to (4.9.3). Therefore, $m^{-1}(\widehat{\phi} - z^{(1 - \alpha / 2)}\sigma_c)$ is the $\frac{\alpha}{2}$ 100th percentile of the cdf $\widehat{H}$ . Likewise, $m^{-1}(\widehat{\phi} - z^{(\alpha / 2)}\sigma_c)$ is the $(1 - \frac{\alpha}{2})$ 100th percentile of the cdf $\widehat{H}$ . Therefore, in the general case too, the percentiles of the distribution of $\widehat{H}$ form the confidence interval for $\theta$ .

# 4.9.2 Bootstrap Testing Procedures

Bootstrap procedures can also be used effectively in testing hypotheses. We begin by discussing these procedures for two-sample problems, which cover many of the nuances of the use of the bootstrap in testing.

Consider a two-sample location problem; that is, $\mathbf{X}' = (X_1, X_2, \ldots, X_{n_1})$ is a random sample from a distribution with cdf $F(x)$ and $\mathbf{Y}' = (Y_1, Y_2, \ldots, Y_{n_2})$ is a random sample from a distribution with the cdf $F(x - \Delta)$ , where $\Delta \in R$ . The parameter $\Delta$ is the shift in locations between the two samples. Hence $\Delta$ can be written as the difference in location parameters. In particular, assuming that the means $\mu_Y$ and $\mu_X$ exist, we have $\Delta = \mu_Y - \mu_X$ . We consider the one-sided hypotheses given by

$$
H _ {0}: \Delta = 0 \text {v e r s u s} H _ {1}: \Delta > 0. \tag {4.9.7}
$$

As our test statistic, we take the difference in sample means, i.e.,

$$
V = \bar {Y} - \bar {X}. \tag {4.9.8}
$$

Our decision rule is to reject $H_0$ if $V \geq c$ . As is often done in practice, we base our decision on the $p$ -value of the test. Recall if the samples result in the values $x_1, x_2, \ldots, x_{n_1}$ and $y_1, y_2, \ldots, y_{n_2}$ with realized sample means $\overline{x}$ and $\overline{y}$ , respectively, then the $p$ -value of the test is

$$
\widehat {p} = P _ {H _ {0}} [ V \geq \bar {y} - \bar {x} ]. \tag {4.9.9}
$$

Our goal is a bootstrap estimate of the $p$ -value. But, unlike the last section, the bootstraps here have to be performed when $H_0$ is true. An easy way to do this is to combine the samples into one large sample and then to resample at random and with replacement the combined sample into two samples, one of size $n_1$ (new xs) and one of size $n_2$ (new ys). Hence the resampling is performed under one distribution; i.e., $H_0$ is true. Let $B$ be a positive integer and let $v = \overline{y} - \overline{x}$ . Our bootstrap algorithm is

1. Combine the samples into one sample: $\mathbf{z}' = (\mathbf{x}',\mathbf{y}')$   
2. Set $j = 1$ .

3. While $j \leq B$ , do steps 3-6.   
4. Obtain a random sample with replacement of size $n_1$ from $\mathbf{z}$ . Call the sample $\mathbf{x}^{*'} = (x_1^*, x_2^*, \ldots, x_{n_1}^*)$ . Compute $\overline{x}_j^*$ .   
5. Obtain a random sample with replacement of size $n_2$ from $\mathbf{z}$ . Call the sample $\mathbf{y}^{*'} = (y_1^*, y_2^*, \ldots, y_{n_2}^*)$ . Compute $\overline{y}_j^*$ .   
6. Compute $v_{j}^{*} = \overline{y}_{j}^{*} - \overline{x}_{j}^{*}$ .   
7. The bootstrap estimated $p$ -value is given by

$$
\widehat {p} ^ {*} = \frac {\# _ {j = 1} ^ {B} \left\{v _ {j} ^ {*} \geq v \right\}}{B}. \tag {4.9.10}
$$

Note that the theory cited above for the bootstrap confidence intervals covers this testing situation also. Hence, this bootstrap $p$ -value is valid.

Example 4.9.2. For illustration, we generated data sets from a contaminated normal distribution, using the R function rcn. Let $W$ be a random variable with the contaminated normal distribution (3.4.17) with proportion of contamination $\epsilon = 0.20$ and $\sigma_c = 4$ . Thirty independent observations $W_1, W_2, \ldots, W_{30}$ were generated from this distribution. Then we let $X_i = 10W_i + 100$ for $1 \leq i \leq 15$ and $Y_i = 10W_{i+15} + 120$ for $1 \leq i \leq 15$ . Hence the true shift parameter is $\Delta = 20$ . The actual (rounded) data are

<table><tr><td colspan="8">X variates</td></tr><tr><td>94.2</td><td>111.3</td><td>90.0</td><td>99.7</td><td>116.8</td><td>92.2</td><td>166.0</td><td>95.7</td></tr><tr><td>109.3</td><td>106.0</td><td>111.7</td><td>111.9</td><td>111.6</td><td>146.4</td><td>103.9</td><td></td></tr><tr><td colspan="8">Y variates</td></tr><tr><td>125.5</td><td>107.1</td><td>67.9</td><td>98.2</td><td>128.6</td><td>123.5</td><td>116.5</td><td>143.2</td></tr><tr><td>120.3</td><td>118.6</td><td>105.0</td><td>111.8</td><td>129.3</td><td>130.8</td><td>139.8</td><td></td></tr></table>

Based on the comparison boxplots below, the scales of the two data sets appear to be the same, while the $y$ -variates (Sample 2) appear to be shifted to the right of $x$ -variates (Sample 1).

![](images/0794fa8d3a37a98d4b25aa9b6b51c6690fecc849be75bf140d84ca2a58f8915f.jpg)

There are three outliers in the data sets.

Our test statistic for these data is $v = \overline{y} - \overline{x} = 117.74 - 111.11 = 6.63$ . Computing with the R function boottesttwo, we performed the bootstrap algorithm given above for $B = 3000$ bootstrap replications. The bootstrap $p$ -value was $\widehat{p}^* = 0.169$ . This means that $(0.169)(3000) = 507$ of the bootstrap test statistics exceeded the value of the test statistic. Furthermore, these bootstrap values were generated under $H_0$ . In practice, $H_0$ would generally not be rejected for a $p$ -value this high. In Figure 4.9.2, we display a histogram of the 3000 values of the bootstrap test statistic that were obtained. The relative area to the right of the value of the test statistic, 6.63, is approximately equal to $\widehat{p}^*$ .

![](images/f7176f3fa125194e3505391e24c330cd50e8d341eac6e5b130abe46ea0d13739.jpg)  
Figure 4.9.2: Histogram of the 3000 bootstrap $v^*$ s. Locate the value of the test statistic $v = \overline{y} - \overline{x} = 6.63$ on the horizontal axis. The area (proportional to overall area) to the right is the $p$ -value of the bootstrap test.

For comparison purposes, we used the two-sample "pooled" $t$ -test discussed in Example 4.6.2 to test these hypotheses. As the reader can obtain in Exercise 4.9.8, for these data, $t = 0.93$ with a $p$ -value of 0.18, which is quite close to the bootstrap $p$ -value.

The above test uses the difference in sample means as the test statistic. Certainly other test statistics could be used. Exercise 4.9.7 asks the reader to obtain the bootstrap test based on the difference in sample medians. Often, as with confidence intervals, standardizing the test statistic by a scale estimator improves the bootstrap test.

The bootstrap test described above for the two-sample problem is analogous to permutation tests. In the permutation test, the test statistic is calculated for all possible samples of $x$ s and $y$ s drawn without replacement from the combined data. Often, it is approximated by Monte Carlo methods, in which case it is quite similar to the bootstrap test except, in the case of the bootstrap, the sampling is done with

replacement; see Exercise 4.9.10. Usually, the permutation tests and the bootstrap tests give very similar solutions; see Efron and Tibshirani (1993) for discussion.

As our second testing situation, consider a one-sample location problem. Suppose $X_{1},X_{2},\ldots ,X_{n}$ is a random sample from a continuous cdf $F(x)$ with finite mean $\mu$ . Suppose we want to test the hypotheses

$$
H _ {0}: \mu = \mu_ {0} \text {v e r s u s} H _ {1}: \mu > \mu_ {0},
$$

where $\mu_0$ is specified. As a test statistic we use $\overline{X}$ with the decision rule

Reject $H_0$ in favor of $H_{1}$ if $\overline{X}$ is too large.

Let $x_{1}, x_{2}, \ldots, x_{n}$ be the realization of the random sample. We base our decision on the $p$ -value of the test, namely,

$$
\widehat {p} = P _ {H _ {0}} [ \overline {{X}} \geq \overline {{x}} ],
$$

where $\overline{x}$ is the realized value of the sample average when the sample is drawn. Our bootstrap test is to obtain a bootstrap estimate of this $p$ -value. At first glance, one might proceed by bootstrapping the statistic $\overline{X}$ . But note that the $p$ -value must be estimated under $H_0$ . To assure that $H_0$ is true, bootstrap the values:

$$
z _ {i} = x _ {i} - \bar {x} + \mu_ {0}, \quad i = 1, 2, \dots , n. \tag {4.9.11}
$$

Our bootstrap procedure is to randomly sample with replacement from $z_{1}, z_{2}, \ldots, z_{n}$ . Let $(z_{j,1}^{*}, \ldots, z_{j,1}^{*})$ denote, say, the $j$ th bootstrap sample. As in expression (4.9.4), it follows that $E(z_{j,i}^{*}) = \mu_{0}$ . Hence, using the $z_{i}$ s, the bootstrap resampling is performed under $H_{0}$ . Denote the test statistic by the sample mean $\overline{z}_{j}^{*}$ . Then the bootstrap $p$ -value is

$$
\widehat {p} ^ {*} = \frac {\# _ {j = 1} ^ {B} \left\{\bar {z} _ {j} ^ {*} \geq \bar {x} \right\}}{B}. \tag {4.9.12}
$$

Example 4.9.3. To illustrate the bootstrap test just described, consider the following data set. We generated $n = 20$ observations $X_{i} = 10W_{i} + 100$ , where $W_{i}$ has a contaminated normal distribution with proportion of contamination $20\%$ and $\sigma_c = 4$ . Suppose we are interested in testing

$$
H _ {0}: \mu = 9 0 \text {v e r s u s} H _ {1}: \mu > 9 0.
$$

Because the true mean of $X_{i}$ is 100, the null hypothesis is false. The data generated are

<table><tr><td>119.7</td><td>104.1</td><td>92.8</td><td>85.4</td><td>108.6</td><td>93.4</td><td>67.1</td><td>88.4</td><td>101.0</td><td>97.2</td></tr><tr><td>95.4</td><td>77.2</td><td>100.0</td><td>114.2</td><td>150.3</td><td>102.3</td><td>105.8</td><td>107.5</td><td>0.9</td><td>94.1</td></tr></table>

The sample mean of these values is $\overline{x} = 95.27$ , which exceeds 90, but is it significantly over 90? As discussed above, we bootstrap the values $z_{i} = x_{i} - 95.27 + 90$ . The R function bootst三点mean performs this bootstrap test. For the run we did, it computed the 3000 values $\overline{z}_j^*$ , which are displayed in the histogram in Figure

![](images/ab07c92b589f6ed0e9f831cc924e47ffb0a6b2bb219250f1fde6de1f8db1277f.jpg)  
Figure 4.9.3: Histogram of the 3000 bootstrap $\overline{z}^*$ s discussed in Example 4.9.3. The bootstrap $p$ -value is the area (relative to the total area) under the histogram and to the right of the 95.27.

4.9.3. The mean of these 3000 values is 89.96, which is quite close to 90. Of these 3000 values, 563 exceeded $\overline{x} = 95.27$ ; hence, the $p$ -value of the bootstrap test is 0.188. The fraction of the total area that is to the right of 95.27 in Figure 4.9.3 is approximately equal to 0.188. Such a high $p$ -value is usually deemed nonsignificant; hence, the null hypothesis would not be rejected.

For comparison, the reader is asked to show in Exercise 4.9.12 that the value of the one-sample $t$ -test is $t = 0.84$ , which has a $p$ -value of 0.20. A test based on the median is discussed in Exercise 4.9.13.

# EXERCISES

4.9.1. Consider the sulfur dioxide concentrations data discussed in Example 4.1.3. Use the R function percentcboot to obtain a bootstrap $95\%$ confidence interval for the true mean concentration. Use 3000 bootstraps and compare it with the $t$ -confidence interval for the mean.

4.9.2. Let $x_{1}, x_{2}, \ldots, x_{n}$ be the values of a random sample. A bootstrap sample, $\mathbf{x}^{*'} = (x_{1}^{*}, x_{2}^{*}, \ldots, x_{n}^{*})$ , is a random sample of $x_{1}, x_{2}, \ldots, x_{n}$ drawn with replacement.

(a) Show that $x_1^*, x_2^*, \ldots, x_n^*$ are iid with common cdf $\widehat{F}_n$ , the empirical cdf of $x_1, x_2, \ldots, x_n$ .

(b) Show that $E(x_{i}^{*}) = \overline{x}$ .   
(c) If $n$ is odd, show that $\text{median} \{x_i^*\} = x_{((n + 1) / 2)}$ .   
(d) Show that $V(x_{i}^{*}) = n^{-1}\sum_{i = 1}^{n}(x_{i} - \overline{x})^{2}$ .

4.9.3. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a $\Gamma(1, \beta)$ distribution.

(a) Show that the confidence interval $(2n\overline{X} /(\chi_{2n}^2)^{(1 - (\alpha /2))},2n\overline{X} /(\chi_{2n}^2)^{(\alpha /2)})$ is an exact $(1 - \alpha)100\%$ confidence interval for $\beta$   
(b) Using part (a), show that the $90\%$ confidence interval for the data of Example 4.9.1 is (64.99, 136.69).

4.9.4. Consider the situation discussed in Example 4.9.1. Suppose we want to estimate the median of $X_{i}$ using the sample median.

(a) Determine the median for a $\Gamma (1,\beta)$ distribution.   
(b) The algorithm for the bootstrap percentile confidence intervals is general and hence can be used for the median. Rewrite the R code in the function percentciboot.s so that the median is the estimator. Using the sample given in the example, obtain a $90\%$ bootstrap percentile confidence interval for the median. Did it trap the true median in this case?

4.9.5. Suppose $X_{1},X_{2},\ldots ,X_{n}$ is a random sample drawn from a $N(\mu ,\sigma^2)$ distribution. As discussed in Example 4.2.1, the pivot random variable for a confidence interval is

$$
t = \frac {\bar {X} - \mu}{S / \sqrt {n}}, \tag {4.9.13}
$$

where $\overline{X}$ and $S$ are the sample mean and standard deviation, respectively. Recall by Theorem 3.6.1 that $t$ has a Student $t$ -distribution with $n - 1$ degrees of freedom; hence, its distribution is free of all parameters for this normal situation. In the notation of this section, $t_{n - 1}^{(\gamma)}$ denotes the $\gamma 100\%$ percentile of a $t$ -distribution with $n - 1$ degrees of freedom. Using this notation, show that a $(1 - \alpha)100\%$ confidence interval for $\mu$ is

$$
\left(\bar {x} - t ^ {(1 - \alpha / 2)} \frac {s}{\sqrt {n}}, \bar {x} - t ^ {(\alpha / 2)} \frac {s}{\sqrt {n}}\right). \tag {4.9.14}
$$

4.9.6. Frequently, the bootstrap percentile confidence interval can be improved if the estimator $\widehat{\theta}$ is standardized by an estimate of scale. To illustrate this, consider a bootstrap for a confidence interval for the mean. Let $x_{1}^{*}, x_{2}^{*}, \ldots, x_{n}^{*}$ be a bootstrap sample drawn from the sample $x_{1}, x_{2}, \ldots, x_{n}$ . Consider the bootstrap pivot [analog of (4.9.13)]:

$$
t ^ {*} = \frac {\bar {x} ^ {*} - \bar {x}}{s ^ {*} / \sqrt {n}}, \tag {4.9.15}
$$

where $\overline{x}^{*} = n^{-1}\sum_{i = 1}^{n}x_{i}^{*}$ and

$$
s ^ {* 2} = (n - 1) ^ {- 1} \sum_ {i = 1} ^ {n} (x _ {i} ^ {*} - \overline {{x}} ^ {*}) ^ {2}.
$$

(a) Rewrite the percentile bootstrap confidence interval algorithm using the mean and collecting $t_j^*$ for $j = 1,2,\ldots ,B$ . Form the interval

$$
\left(\bar {x} - t ^ {* (1 - \alpha / 2)} \frac {s}{\sqrt {n}}, \bar {x} - t ^ {* (\alpha / 2)} \frac {s}{\sqrt {n}}\right), \tag {4.9.16}
$$

where $t^{*(\gamma)} = t_{([\gamma *B])}^*$ ; that is, order the $t_j^*$ s and pick off the quantiles.

(b) Rewrite the R program percentcboot.s and then use it to find a $90\%$ confidence interval for $\mu$ for the data in Example 4.9.3. Use 3000 bootstraps.   
(c) Compare your confidence interval in the last part with the nonstandardized bootstrap confidence interval based on the program percentcboot.s.

4.9.7. Consider the algorithm for a two-sample bootstrap test given in Section 4.9.2.

(a) Rewrite the algorithm for the bootstrap test based on the difference in medians.   
(b) Consider the data in Example 4.9.2. By substituting the difference in medians for the difference in means in the R program boottesttwo.s, obtain the bootstrap test for the algorithm of part (a).   
(c) Obtain the estimated $p$ -value of your test for $B = 3000$ and compare it to the estimated $p$ -value of 0.063 that the authors obtained.

4.9.8. Consider the data of Example 4.9.2. The two-sample $t$ -test of Example 4.6.2 can be used to test these hypotheses. The test is not exact here (why?), but it is an approximate test. Show that the value of the test statistic is $t = 0.93$ , with an approximate $p$ -value of 0.18.

4.9.9. In Example 4.9.3, suppose we are testing the two-sided hypotheses,

$$
H _ {0}: \mu = 9 0 \text {v e r s u s} H _ {1}: \mu \neq 9 0.
$$

(a) Determine the bootstrap $p$ -value for this situation.   
(b) Rewrite the R program boottestonemean to obtain this $p$ -value.   
(c) Compute the $p$ -value based on 3000 bootstraps.

4.9.10. Consider the following permutation test for the two-sample problem with hypotheses (4.9.7). Let $\mathbf{x}' = (x_1, x_2, \ldots, x_{n_1})$ and $\mathbf{y}' = (y_1, y_2, \ldots, y_{n_2})$ be the realizations of the two random samples. The test statistic is the difference in sample means $\overline{y} - \overline{x}$ . The estimated $p$ -value of the test is calculated as follows:

1. Combine the data into one sample $\mathbf{z}' = (\mathbf{x}',\mathbf{y}')$   
2. Obtain all possible samples of size $n_1$ drawn without replacement from $\mathbf{z}$ . Each such sample automatically gives another sample of size $n_2$ , i.e., all elements of $\mathbf{z}$ not in the sample of size $n_1$ . There are $M = \binom{n_1+n_2}{n_1}$ such samples.

3. For each such sample $j$ :

(a) Label the sample of size $n_1$ by $\mathbf{x}^*$ and label the sample of size $n_2$ by $\mathbf{y}^*$ .   
(b) Calculate $v_{j}^{*} = \overline{y}^{*} - \overline{x}^{*}$ .

4. The estimated $p$ -value is $\widehat{p}^{*} = \# \{v_{j}^{*}\geq \overline{y} -\overline{x}\} /M$

(a) Suppose we have two samples each of size 3 which result in the realizations: $\mathbf{x}' = (10,15,21)$ and $\mathbf{y}' = (20,25,30)$ . Determine the test statistic and the permutation test described above along with the $p$ -value.   
(b) If we ignore distinct samples, then we can approximate the permutation test by using the bootstrap algorithm with resampling performed at random and without replacement. Modify the bootstrap program boottesttwo.s to do this and obtain this approximate permutation test based on 3000 resamples for the data of Example 4.9.2.   
(c) In general, what is the probability of having distinct samples in the approximate permutation test described in the last part? Assume that the original data are distinct values.

4.9.11. Let $z^*$ be drawn at random from the discrete distribution that has mass $n^{-1}$ at each point $z_i = x_i - \overline{x} + \mu_0$ , where $(x_1, x_2, \ldots, x_n)$ is the realization of a random sample. Determine $E(z^*)$ and $V(z^*)$ .   
4.9.12. For the situation described in Example 4.9.3, show that the value of the one-sample $t$ -test is $t = 0.84$ and its associated $p$ -value is 0.20.   
4.9.13. For the situation described in Example 4.9.3, obtain the bootstrap test based on medians. Use the same hypotheses; i.e.,

$$
H _ {0}: \mu = 9 0 \text {v e r s u s} H _ {1}: \mu > 9 0.
$$

4.9.14. Consider the Darwin's experiment on Zea mays discussed in Examples 4.5.1 and 4.5.5.

(a) Obtain a bootstrap test for this experimental data. Keep in mind that the data are recorded in pairs. Hence your resampling procedure must keep this dependence intact and still be under $H_0$ .   
(b) Write an R program that executes your bootstrap test and compare its $p$ -value with that found in Example 4.5.5.

# 4.10 *Tolerance Limits for Distributions

We propose now to investigate a problem that has something of the same flavor as that treated in Section 4.4. Specifically, can we compute the probability that a certain random interval includes (or covers) a preassigned percentage of the probability of the distribution under consideration? And, by appropriate selection of

the random interval, can we be led to an additional distribution-free method of statistical inference?

Let $X$ be a random variable with distribution function $F(x)$ of the continuous type. Let $Z = F(X)$ . Then, as shown in Exercise 4.8.1, $Z$ has a uniform(0,1) distribution. That is, $Z = F(X)$ has the pdf

$$
h (z) = \left\{ \begin{array}{l l} 1 & 0 <   z <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Then, if $0 < p < 1$ , we have

$$
P [ F (X) \leq p ] = \int_ {0} ^ {p} d z = p.
$$

Now $F(x) = P(X \leq x)$ . Since $P(X = x) = 0$ , then $F(x)$ is the fractional part of the probability for the distribution of $X$ that is between $-\infty$ and $x$ . If $F(x) \leq p$ , then no more than $100p\%$ of the probability for the distribution of $X$ is between $-\infty$ and $x$ . But recall $P[F(X) \leq p] = p$ . That is, the probability that the random variable $Z = F(X)$ is less than or equal to $p$ is precisely the probability that the random interval $(-\infty, X)$ contains no more than $100p\%$ of the probability for the distribution. For example, if $p = 0.70$ , the probability that the random interval $(-\infty, X)$ contains no more than $70\%$ of the probability for the distribution is 0.70; and the probability that the random interval $(-\infty, X)$ contains more than $70\%$ of the probability for the distribution is $1 - 0.70 = 0.30$ .

We now consider certain functions of the order statistics. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample of size $n$ from a distribution that has a positive and continuous pdf $f(x)$ if and only if $a < x < b$ , and let $F(x)$ denote the associated distribution function. Consider the random variables $F(X_{1}), F(X_{2}), \ldots, F(X_{n})$ . These random variables are independent and each, in accordance with Exercise 4.8.1, has a uniform distribution on the interval (0,1). Thus, $F(X_{1}), F(X_{2}), \ldots, F(X_{n})$ is a random sample of size $n$ from a uniform distribution on the interval (0,1). Consider the order statistics of this random sample $F(X_{1}), F(X_{2}), \ldots, F(X_{n})$ . Let $Z_{1}$ be the smallest of these $F(X_{i})$ , $Z_{2}$ the next $F(X_{i})$ in order of magnitude, ..., and $Z_{n}$ the largest of $F(X_{i})$ . If $Y_{1}, Y_{2}, \ldots, Y_{n}$ are the order statistics of the initial random sample $X_{1}, X_{2}, \ldots, X_{n}$ , the fact that $F(x)$ is a nondecreasing (here, strictly increasing) function of $x$ implies that $Z_{1} = F(Y_{1}), Z_{2} = F(Y_{2}), \ldots, Z_{n} = F(Y_{n})$ . Hence, it follows from (4.4.1) that the joint pdf of $Z_{1}, Z_{2}, \ldots, Z_{n}$ is given by

$$
h \left(z _ {1}, z _ {2}, \dots , z _ {n}\right) = \left\{ \begin{array}{l l} n! & 0 <   z _ {1} <   z _ {2} <   \dots <   z _ {n} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {4.10.1}
$$

This proves a special case of the following theorem.

Theorem 4.10.1. Let $Y_{1}, Y_{2}, \ldots, Y_{n}$ denote the order statistics of a random sample of size $n$ from a distribution of the continuous type that has pdf $f(x)$ and cdf $F(x)$ . The joint pdf of the random variables $Z_{i} = F(Y_{i})$ , $i = 1, 2, \ldots, n$ , is given by expression (4.10.1).

Because the distribution function of $Z = F(X)$ is given by $z$ , $0 < z < 1$ , it follows from (4.4.2) that the marginal pdf of $Z_{k} = F(Y_{k})$ is the following beta pdf:

$$
h _ {k} \left(z _ {k}\right) = \left\{ \begin{array}{l l} \frac {n !}{(k - 1) ! (n - k) !} z _ {k} ^ {k - 1} \left(1 - z _ {k}\right) ^ {n - k} & 0 <   z _ {k} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {4.10.2}
$$

Moreover, from (4.4.3), the joint pdf of $Z_{i} = F(Y_{i})$ and $Z_{j} = F(Y_{j})$ is, with $i < j$ , given by

$$
h \left(z _ {i}, z _ {j}\right) = \left\{ \begin{array}{l l} \frac {n ! z _ {i} ^ {i - 1} \left(z _ {j} - z _ {i}\right) ^ {j - i - 1} \left(1 - z _ {j}\right) ^ {n - j}}{(i - 1) ! (j - i - 1) ! (n - j) !} & 0 <   z _ {i} <   z _ {j} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {4.10.3}
$$

Consider the difference $Z_{j} - Z_{i} = F(Y_{j}) - F(Y_{i}), i < j$ . Now $F(y_{j}) = P(X \leq y_{j})$ and $F(y_{i}) = P(X \leq y_{i})$ . Since $P(X = y_{i}) = P(X = y_{j}) = 0$ , then the difference $F(y_{j}) - F(y_{i})$ is that fractional part of the probability for the distribution of $X$ that is between $y_{i}$ and $y_{j}$ . Let $p$ denote a positive proper fraction. If $F(y_{j}) - F(y_{i}) \geq p$ , then at least $100p\%$ of the probability for the distribution of $X$ is between $y_{i}$ and $y_{j}$ . Let it be given that $\gamma = P[F(Y_{j}) - F(Y_{i}) \geq p]$ . Then the random interval $(Y_{i}, Y_{j})$ has probability $\gamma$ of containing at least $100p\%$ of the probability for the distribution of $X$ . Now if $y_{i}$ and $y_{j}$ denote, respectively, observational values of $Y_{i}$ and $Y_{j}$ , the interval $(y_{i}, y_{j})$ either does or does not contain at least $100p\%$ of the probability for the distribution of $X$ . However, we refer to the interval $(y_{i}, y_{j})$ as a $100\gamma\%$ tolerance interval for $100p\%$ of the probability for the distribution of $X$ . In like vein, $y_{i}$ and $y_{j}$ are called the $100\gamma\%$ tolerance limits for $100p\%$ of the probability for the distribution of $X$ .

One way to compute the probability $\gamma = P[F(Y_j) - F(Y_i)\geq p]$ is to use equation (4.10.3), which gives the joint pdf of $Z_{i} = F(Y_{i})$ and $Z_{j} = F(Y_{j})$ . The required probability is then given by

$$
\gamma = P (Z _ {j} - Z _ {i} \geq p) = \int_ {0} ^ {1 - p} \left[ \int_ {p + z _ {i}} ^ {1} h _ {i j} (z _ {i}, z _ {j}) d z _ {j} \right] d z _ {i}.
$$

Sometimes, this is a rather tedious computation. For this reason and also for the reason that coverages are important in distribution-free statistical inference, we choose to introduce at this time the concept of coverage.

Consider the random variables $W_{1} = F(Y_{1}) = Z_{1}$ , $W_{2} = F(Y_{2}) - F(Y_{1}) = Z_{2} - Z_{1}$ , and $W_{3} = F(Y_{3}) - F(Y_{2}) = Z_{3} - Z_{2},\ldots ,W_{n} = F(Y_{n}) - F(Y_{n - 1}) = Z_{n} - Z_{n - 1}$ . The random variable $W_{1}$ is called a coverage of the random interval $\{x: - \infty < x < Y_1\}$ and the random variable $W_{i}$ , $i = 2,3,\dots,n$ , is called a coverage of the random interval $\{x:Y_{i - 1} < x < Y_i\}$ . We find that the joint pdf of the $n$ coverages $W_{1},W_{2},\ldots ,W_{n}$ . First we note that the inverse functions of the associated transformation are given by

$$
z _ {i} = \sum_ {j = 1} ^ {i} w _ {j}, \text {f o r} i = 1, 2, \dots , n.
$$

We also note that the Jacobian is equal to 1 and that the space of positive probability density is

$$
\left\{\left(w _ {1}, w _ {2}, \dots , w _ {n}\right): 0 <   w _ {i}, i = 1, 2, \dots , n, w _ {1} + \dots + w _ {n} <   1 \right\}.
$$

Since the joint pdf of $Z_{1}, Z_{2}, \ldots, Z_{n}$ is $n!$ , $0 < z_{1} < z_{2} < \dots < z_{n} < 1$ , zero elsewhere, the joint pdf of the $n$ coverages is

$$
k (w _ {1}, \ldots , w _ {n}) = \left\{ \begin{array}{l l} n! & 0 <   w _ {i}, i = 1, \ldots , n, w _ {1} + \dots w _ {n} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Because the pdf $k(w_{1},\ldots ,w_{n})$ is symmetric in $w_{1},w_{2},\ldots ,w_{n}$ , it is evident that the distribution of every sum of $r$ , $r < n$ , of these coverages $W_{1},\ldots ,W_{n}$ is exactly the same for each fixed value of $r$ . For instance, if $i < j$ and $r = j - i$ , the distribution of $Z_{j} - Z_{i} = F(Y_{j}) - F(Y_{i}) = W_{i + 1} + W_{i + 2} + \dots +W_{j}$ is exactly the same as that of $Z_{j - i} = F(Y_{j - i}) = W_1 + W_2 + \dots +W_{j - i}$ . But we know that the pdf of $Z_{j - i}$ is the beta pdf of the form

$$
h _ {j - i} (v) = \left\{ \begin{array}{l l} \frac {\Gamma (n + 1)}{\Gamma (j - i) \Gamma (n - j + i + 1)} v ^ {j - i - 1} (1 - v) ^ {n - j + i} & 0 <   v <   1 \\ 0 & \mathrm {e l s e w h e r e .} \end{array} \right.
$$

Consequently, $F(Y_{j}) - F(Y_{i})$ has this pdf and

$$
P \left[ F \left(Y _ {j}\right) - F \left(Y _ {i}\right) \geq p \right] = \int_ {p} ^ {1} h _ {j - i} (v) d v.
$$

Example 4.10.1. Let $Y_{1} < Y_{2} < \dots < Y_{6}$ be the order statistics of a random sample of size 6 from a distribution of the continuous type. We want to use the observed interval $(y_{1}, y_{6})$ as a tolerance interval for $80\%$ of the distribution. Then

$$
\begin{array}{l} \gamma = P \left[ F \left(Y _ {6}\right) - F \left(Y _ {1}\right) \geq 0. 8 \right] \\ = 1 - \int_ {0} ^ {0. 8} 3 0 v ^ {4} (1 - v) d v, \\ \end{array}
$$

because the integrand is the pdf of $F(Y_6) - F(Y_1)$ . Accordingly,

$$
\gamma = 1 - 6 (0. 8) ^ {5} + 5 (0. 8) ^ {6} = 0. 3 4,
$$

approximately. That is, the observed values of $Y_{1}$ and $Y_{6}$ define a $34\%$ tolerance interval for $80\%$ the probability for the distribution.

Remark 4.10.1. Tolerance intervals are extremely important and often they are more desirable than confidence intervals. For illustration, consider a "fill" problem in which a manufacturer says that each container has at least 12 ounces of the product. Let $X$ be the amount in a container. The company would be pleased to note that the interval (12.1, 12.3), for instance, is a $95\%$ tolerance interval for $99\%$ of the distribution of $X$ . This would be true in this case, because the FDA allows a very small fraction of the containers to be less than 12 ounces.

# EXERCISES

4.10.1. Let $Y_{1}$ and $Y_{n}$ be, respectively, the first and the $n$ th order statistic of a random sample of size $n$ from a distribution of the continuous type having cdf $F(x)$ . Find the smallest value of $n$ such that $P[F(Y_{n}) - F(Y_{1}) \geq 0.5]$ is at least 0.95.

4.10.2. Let $Y_{2}$ and $Y_{n - 1}$ denote the second and the $(n - 1)$ st order statistics of a random sample of size $n$ from a distribution of the continuous type having a distribution function $F(x)$ . Compute $P[F(Y_{n - 1}) - F(Y_2)\geq p]$ , where $0 < p < 1$ .

4.10.3. Let $Y_{1} < Y_{2} < \dots < Y_{48}$ be the order statistics of a random sample of size 48 from a distribution of the continuous type. We want to use the observed interval $(y_{4}, y_{45})$ as a $100\gamma \%$ tolerance interval for $75\%$ of the distribution.

(a) What is the value of $\gamma$ ?   
(b) Approximate the integral in part (a) by noting that it can be written as a partial sum of a binomial pdf, which in turn can be approximated by probabilities associated with a normal distribution (see Section 5.3).

4.10.4. Let $Y_{1} < Y_{2} < \dots < Y_{n}$ be the order statistics of a random sample of size $n$ from a distribution of the continuous type having distribution function $F(x)$ .

(a) What is the distribution of $U = 1 - F(Y_{j})$ ?   
(b) Determine the distribution of $V = F(Y_{n}) - F(Y_{j}) + F(Y_{i}) - F(Y_{1})$ , where $i < j$ .

4.10.5. Let $Y_{1} < Y_{2} < \dots < Y_{10}$ be the order statistics of a random sample from a continuous-type distribution with distribution function $F(x)$ . What is the joint distribution of $V_{1} = F(Y_{4}) - F(Y_{2})$ and $V_{2} = F(Y_{10}) - F(Y_{6})$ ?

This page intentionally left blank


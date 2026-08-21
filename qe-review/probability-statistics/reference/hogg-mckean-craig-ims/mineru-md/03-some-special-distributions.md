---
title: "Some Special Distributions"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: chapter
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Some Special Distributions

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 2 Multivariate Distributions](./02-multivariate-distributions.md) · [Ch. 4 Elementary Statistical Inferences →](./04-some-elementary-statistical-inferences.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Chapter 3

# Some Special Distributions

# 3.1 The Binomial and Related Distributions

In Chapter 1 we introduced the uniform distribution and the hypergeometric distribution. In this chapter we discuss some other important distributions of random variables frequently used in statistics. We begin with the binomial and related distributions.

A Bernoulli experiment is a random experiment, the outcome of which can be classified in but one of two mutually exclusive and exhaustive ways, for instance, success or failure (e.g., female or male, life or death, nondefective or defective). A sequence of Bernoulli trials occurs when a Bernoulli experiment is performed several independent times so that the probability of success, say $p$ , remains the same from trial to trial. That is, in such a sequence, we let $p$ denote the probability of success on each trial.

Let $X$ be a random variable associated with a Bernoulli trial by defining it as follows:

$$
X (\text {s u c c e s s}) = 1 \text {a n d} X (\text {f a i l u r e}) = 0.
$$

That is, the two outcomes, success and failure, are denoted by one and zero, respectively. The pmf of $X$ can be written as

$$
p (x) = p ^ {x} (1 - p) ^ {1 - x}, \quad x = 0, 1, \tag {3.1.1}
$$

and we say that $X$ has a Bernoulli distribution. The expected value of $X$ is

$$
\mu = E (X) = (0) (1 - p) + (1) (p) = p,
$$

and the variance of $X$ is

$$
\sigma^ {2} = \operatorname {v a r} (X) = p ^ {2} (1 - p) + (1 - p) ^ {2} p = p (1 - p).
$$

It follows that the standard deviation of $X$ is $\sigma = \sqrt{p(1 - p)}$ .

In a sequence of $n$ independent Bernoulli trials, where the probability of success remains constant, let $X_{i}$ denote the Bernoulli random variable associated with the

ith trial. An observed sequence of $n$ Bernoulli trials is then an $n$ -tuple of zeros and ones. In such a sequence of Bernoulli trials, we are often interested in the total number of successes and not in the order of their occurrence. If we let the random variable $X$ equal the number of observed successes in $n$ Bernoulli trials, the possible values of $X$ are $0, 1, 2, \ldots, n$ . If $x$ successes occur, where $x = 0, 1, 2, \ldots, n$ , then $n - x$ failures occur. The number of ways of selecting the $x$ positions for the $x$ successes in the $n$ trials is

$$
\left( \begin{array}{c} n \\ x \end{array} \right) = \frac {n !}{x ! (n - x) !}.
$$

Since the trials are independent and the probabilities of success and failure on each trial are, respectively, $p$ and $1 - p$ , the probability of each of these ways is $p^x (1 - p)^{n - x}$ . Thus the pmf of $X$ , say $p(x)$ , is the sum of the probabilities of these $\binom{n}{x}$ mutually exclusive events; that is,

$$
p (x) = \left\{ \begin{array}{l l} {\binom {n} {x}} p ^ {x} (1 - p) ^ {n - x} & x = 0, 1, 2, \dots , n \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.1.2}
$$

It is clear that $p(x) \geq 0$ . To verify that $p(x)$ sums to 1 over its range, recall the binomial series, expression (1.3.7) of Chapter 1, which is:

$$
(a + b) ^ {n} = \sum_ {x = 0} ^ {n} {\binom {n} {x}} b ^ {x} a ^ {n - x},
$$

for $n$ a positive integer. Thus,

$$
\begin{array}{l} \sum_ {x} p (x) = \sum_ {x = 0} ^ {n} \binom {n} {x} p ^ {x} (1 - p) ^ {n - x} \\ = \left[ (1 - p) + p \right] ^ {n} = 1. \\ \end{array}
$$

Therefore, $p(x)$ satisfies the conditions of being a pmf of a random variable $X$ of the discrete type. A random variable $X$ that has a pmf of the form of $p(x)$ is said to have a binomial distribution, and any such $p(x)$ is called a binomial pmf. A binomial distribution is denoted by the symbol $b(n,p)$ . The constants $n$ and $p$ are called the parameters of the binomial distribution.

Example 3.1.1 (Computation of Binomial Probabilities). Suppose we roll a fair six-sided die 3 times. What is the probability of getting exactly 2 sixes? For our notation, let $X$ be the number of sixes obtained in the 3 rolls. Then $X$ has a binomial distribution with $n = 3$ and $p = 1/6$ . Hence,

$$
P (X = 2) = p (2) = \binom {3} {2} \left(\frac {1}{6}\right) ^ {2} \left(\frac {5}{6}\right) ^ {1} = 0. 0 6 9 4 4.
$$

We can do this calculation with a hand calculator. Suppose, though, we want to determine the probability of at least 16 sixes in 60 rolls. Let $Y$ be the number of sixes in 60 rolls. Then our desired probability is given by the series

$$
P (Y \geq 1 6) = \sum_ {j = 1 6} ^ {6 0} \binom {6 0} {j} \left(\frac {1}{6}\right) ^ {j} \left(\frac {5}{6}\right) ^ {6 0 - j},
$$

which is not a simple calculation. Most statistical packages provide procedures to calculate binomial probabilities. In R, if $Y$ is $b(n,p)$ then the cdf of $Y$ is computed as $P(Y \leq y) = \text{pbinom}(y, n, p)$ . Hence, for our example, using R we compute the $P(Y \geq 16)$ as

$$
P (Y \geq 1 6) = 1 - P (Y \leq 1 5) = 1 - \operatorname {p b i n o m} (1 5, 6 0, 1 / 6) = 0. 0 3 3 8.
$$

The R function `dbinom` computes the pmf of a binomial distribution. For instance, to compute the probability that $Y = 11$ , we use the R code: `dbinom(11,60,1/6)`, which computes to 0.1246.

The mgf of a binomial distribution is easily obtained as follows:

$$
\begin{array}{l} M (t) = \sum_ {x} e ^ {t x} p (x) = \sum_ {x = 0} ^ {n} e ^ {t x} \binom {n} {x} p ^ {x} (1 - p) ^ {n - x} \\ = \sum_ {x = 0} ^ {n} \binom {n} {x} (p e ^ {t}) ^ {x} (1 - p) ^ {n - x} \\ = \left[ (1 - p) + p e ^ {t} \right] ^ {n} \\ \end{array}
$$

for all real values of $t$ . The mean $\mu$ and the variance $\sigma^2$ of $X$ may be computed from $M(t)$ . Since

$$
M ^ {\prime} (t) = n [ (1 - p) + p e ^ {t} ] ^ {n - 1} \left(p e ^ {t}\right)
$$

and

$$
M ^ {\prime \prime} (t) = n [ (1 - p) + p e ^ {t} ] ^ {n - 1} (p e ^ {t}) + n (n - 1) [ (1 - p) + p e ^ {t} ] ^ {n - 2} (p e ^ {t}) ^ {2},
$$

if follows that

$$
\mu = M ^ {\prime} (0) = n p
$$

and

$$
\sigma^ {2} = M ^ {\prime \prime} (0) - \mu^ {2} = n p + n (n - 1) p ^ {2} - (n p) ^ {2} = n p (1 - p).
$$

Suppose $Y$ has the $b(60,1/6)$ distribution as discussed in Example 3.1.1. Then $E(Y) = 60(1/6) = 10$ and $\operatorname{Var}(Y) = 60(1/6)(5/6) = 8.33$

Example 3.1.2. If the mgf of a random variable $X$ is

$$
M (t) = (\frac {2}{3} + \frac {1}{3} e ^ {t}) ^ {5},
$$

then $X$ has a binomial distribution with $n = 5$ and $p = \frac{1}{3}$ ; that is, the pmf of $X$ is

$$
p (x) = \left\{ \begin{array}{l l} {\binom {5} {x}}   \left(\frac {1}{3}\right) ^ {x}   \left(\frac {2}{3}\right) ^ {5 - x} & x = 0, 1, 2, \ldots , 5 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Here $\mu = np = \frac{5}{3}$ and $\sigma^2 = np(1 - p) = \frac{10}{9}$ .

Example 3.1.3. If $Y$ is $b(n, \frac{1}{3})$ , then $P(Y \geq 1) = 1 - P(Y = 0) = 1 - (\frac{2}{3})^n$ . Suppose that we wish to find the smallest value of $n$ that yields $P(Y \geq 1) > 0.80$ . We have $1 - (\frac{2}{3})^n > 0.80$ and $0.20 > (\frac{2}{3})^n$ . Either by inspection or by use of logarithms, we see that $n = 4$ is the solution. That is, the probability of at least one success throughout $n = 4$ independent repetitions of a random experiment with probability of success $p = \frac{1}{3}$ is greater than 0.80.

Example 3.1.4. Let the random variable $Y$ be equal to the number of successes throughout $n$ independent repetitions of a random experiment with probability $p$ of success. That is, $Y$ is $b(n,p)$ . The ratio $Y / n$ is called the relative frequency of success. Recall expression (1.10.3), the second version of Chebyshev's inequality (Theorem 1.10.3). Applying this result, we have for all $\epsilon > 0$ that

$$
P \left(\left| \frac {Y}{n} - p \right| \geq \epsilon\right) \leq \frac {\operatorname {V a r} (Y / n)}{\epsilon^ {2}} = \frac {p (1 - p)}{n \epsilon^ {2}}
$$

[Exercise 3.1.3 asks for the determination of $\operatorname{Var}(Y / n)$ ]. Now, for every fixed $\epsilon > 0$ , the right-hand member of the preceding inequality is close to zero for sufficiently large $n$ . That is,

$$
\lim _ {n \to \infty} P \left(\left| \frac {Y}{n} - p \right| \geq \epsilon\right) = 0
$$

and

$$
\lim  _ {n \rightarrow \infty} P \left(\left| \frac {Y}{n} - p \right| <   \epsilon\right) = 1.
$$

Since this is true for every fixed $\epsilon > 0$ , we see, in a certain sense, that the relative frequency of success is for large values of $n$ , close to the probability of $p$ of success. This result is one form of the Weak Law of Large Numbers. It was alluded to in the initial discussion of probability in Chapter 1 and is considered again, along with related concepts, in Chapter 5.

Example 3.1.5. Let the independent random variables $X_{1}, X_{2}, X_{3}$ have the same cdf $F(x)$ . Let $Y$ be the middle value of $X_{1}, X_{2}, X_{3}$ . To determine the cdf of $Y$ , say $F_{Y}(y) = P(Y \leq y)$ , we note that $Y \leq y$ if and only if at least two of the random variables $X_{1}, X_{2}, X_{3}$ are less than or equal to $y$ . Let us say that the $i$ th "trial" is a success if $X_{i} \leq y$ , $i = 1, 2, 3$ ; here each "trial" has the probability of success $F(y)$ . In this terminology, $F_{Y}(y) = P(Y \leq y)$ is then the probability of at least two successes in three independent trials. Thus

$$
F _ {Y} (y) = \left( \begin{array}{c} 3 \\ 2 \end{array} \right) [ F (y) ] ^ {2} [ 1 - F (y) ] + [ F (y) ] ^ {3}.
$$

If $F(x)$ is a continuous cdf so that the pdf of $X$ is $F'(x) = f(x)$ , then the pdf of $Y$ is

$$
f _ {Y} (y) = F _ {Y} ^ {\prime} (y) = 6 [ F (y) ] [ 1 - F (y) ] f (y).
$$

Suppose we have several independent binomial distributions with the same probability of success. Then it makes sense that the sum of these random variables is binomial, as shown in the following theorem.

Theorem 3.1.1. Let $X_{1}, X_{2}, \ldots, X_{m}$ be independent random variables such that $X_{i}$ has binomial $b(n_{i}, p)$ distribution, for $i = 1, 2, \ldots, m$ . Let $Y = \sum_{i=1}^{m} X_{i}$ . Then $Y$ has a binomial $b(\sum_{i=1}^{m} n_{i}, p)$ distribution.

Proof: The mgf of $X_{i}$ is $M_{X_i}(t) = (1 - p + pe^t)^{n_i}$ . By independence it follows from Theorem 2.6.1 that

$$
M _ {Y} (t) = \prod_ {i = 1} ^ {m} (1 - p + p e ^ {t}) ^ {n _ {i}} = (1 - p + p e ^ {t}) ^ {\sum_ {i = 1} ^ {m} n _ {i}}.
$$

Hence, $Y$ has a binomial $b(\sum_{i=1}^{m} n_i, p)$ distribution.

For the remainder of this section, we discuss some important distributions that are related to the binomial distribution.

# 3.1.1 Negative Binomial and Geometric Distributions

Consider a sequence of independent Bernoulli trials with constant probability $p$ of success. Let the random variable $Y$ denote the total number of failures in this sequence before the $r$ th success, that is, $Y + r$ is equal to the number of trials necessary to produce exactly $r$ successes with the last trial as a success. Here $r$ is a fixed positive integer. To determine the pmf of $Y$ , let $y$ be an element of $\{y : y = 0,1,2,\ldots\}$ . Then, since the trials are independent, $P(Y = y)$ is equal to the product of the probability of obtaining exactly $r - 1$ successes in the first $y + r - 1$ trials times the probability $p$ of a success on the $(y + r)$ th trial. Thus the pmf of $Y$ is

$$
p _ {Y} (y) = \left\{ \begin{array}{l l} {\binom {y + r - 1} {r - 1}} p ^ {r} (1 - p) ^ {y} & y = 0, 1, 2, \dots \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.1.3}
$$

A distribution with a pmf of the form $p_{Y}(y)$ is called a negative binomial distribution and any such $p_{Y}(y)$ is called a negative binomial pmf. The distribution derives its name from the fact that $p_{Y}(y)$ is a general term in the expansion of $p^r [1 - (1 - p)]^{-r}$ . It is left as an exercise to show that the mgf of this distribution is $M(t) = p^{r}[1 - (1 - p)e^{t}]^{-r}$ , for $t < -\log (1 - p)$ . The R call to compute $P(y \leq y)$ is $\mathsf{pnbinom}(y, r, p)$ .

Example 3.1.6. Suppose the probability that a person has blood type B is 0.12. In order to conduct a study concerning people with blood type B, patients are sampled independently of one another until 10 are obtained who have blood type B. Determine the probability that at most 30 patients have to have their blood type determined. Let $Y$ have a negative binomial distribution with $p = 0.12$ and $r = 10$ . Then, the desired probability is

$$
P (Y \leq 2 0) = \sum_ {j = 0} ^ {2 0} \binom {j + 9} {9} 0. 1 2 ^ {1 0} 0. 8 8 ^ {j}.
$$

Its computation in R is pnbinom(20,10,0.12) = 0.0019.

If $r = 1$ , then $Y$ has the pmf

$$
p _ {Y} (y) = p (1 - p) ^ {y}, \quad y = 0, 1, 2, \dots , \tag {3.1.4}
$$

zero elsewhere, and the mgf $M(t) = p[1 - (1 - p)e^{t}]^{-1}$ . In this special case, $r = 1$ , we say that $Y$ has a geometric distribution. In terms of Bernoulli trials, $Y$ is the number of failures until the first success. The geometric distribution was first discussed in Example 1.6.3 of Chapter 1. For the last example, the probability that exactly 11 patients have to have their blood type determined before the first patient with type B blood is found is given by $.88^{11}0.12$ . This is computed in R by dgeom(11,0.12) = 0.0294.

# 3.1.2 Multinomial Distribution

The binomial distribution is generalized to the multinomial distribution as follows. Let a random experiment be repeated $n$ independent times. On each repetition, there is one and only one outcome from one of $k$ categories. Call the categories $C_1, C_2, \ldots, C_k$ . For example, the upface of a roll of a six-sided die. Then the categories are $C_i = \{i\}$ , $i = 1, 2, \ldots, 6$ . For $i = 1, \ldots, k$ , let $p_i$ be the probability that the outcome is an element of $C_i$ and assume that $p_i$ remains constant throughout the $n$ independent repetitions. Define the random variable $X_i$ to be equal to the number of outcomes that are elements of $C_i$ , $i = 1, 2, \ldots, k - 1$ . Because $X_k = n - X_1 - \cdots - X_{k-1}$ , $X_k$ is determined by the other $X_i$ 's. Hence, for the joint distribution of interest we need only consider $X_1, X_2, \ldots, X_{k-1}$ .

The joint pmf of $(X_{1},X_{2},\ldots ,X_{k - 1})$ is

$$
P \left(X _ {1} = x, X _ {2} = x _ {2}, \dots , X _ {k - 1} = x _ {k - 1}\right) = \frac {n !}{x _ {1} ! \cdots x _ {k - 1} ! x _ {k} !} p _ {1} ^ {x _ {1}} \dots p _ {k - 1} ^ {x _ {k - 1}} p _ {k} ^ {x _ {k}}, \tag {3.1.5}
$$

for all $x_{1}, x_{2}, \ldots, x_{k-1}$ that are nonnegative integers and such that $x_{1} + x_{2} + \cdots + x_{k-1} \leq n$ , where $x_{k} = n - x_{1} - \cdots - x_{k-1}$ and $p_{k} = 1 - \sum_{j=1}^{k-1} p_{j}$ . We next show that expression (3.1.5) is correct. The number of distinguishable arrangements of $x_{1} C_{1}\mathrm{s}, x_{2} C_{2}\mathrm{s}, \ldots, x_{k} C_{k}\mathrm{s}$ is

$$
\left( \begin{array}{c} n \\ x _ {1} \end{array} \right) \left( \begin{array}{c} n - x _ {1} \\ x _ {2} \end{array} \right) \dots \left( \begin{array}{c} n - x _ {1} - \dots - x _ {k - 2} \\ x _ {k - 1} \end{array} \right) = \frac {n !}{x _ {1} ! x _ {2} ! \cdots x _ {k} !}
$$

and the probability of each of these distinguishable arrangements is

$$
p _ {1} ^ {x _ {1}} p _ {2} ^ {x _ {2}} \dots p _ {k} ^ {x _ {k}}.
$$

Hence the product of these two latter expressions gives the correct probability, which is in agreement with expression (3.1.5).

We say that $(X_{1},X_{2},\ldots ,X_{k - 1})$ has a multinomial distribution with parameters $n$ and $p_1,\dots ,p_{k - 1}$ . The joint mgf of $(X_{1},X_{2},\ldots ,X_{k - 1})$ is $M(t_{1},\ldots ,t_{k - 1}) = E(\exp \{\sum_{i = 1}^{k - 1}t_{i}X_{i}\})$ , i.e.,

$$
M (t _ {1}, \ldots , t _ {k - 1}) = \sum \dots \sum \frac {n !}{x _ {1} ! \cdots x _ {k - 1} ! x _ {k} !} (p _ {1} e ^ {t _ {1}}) ^ {x _ {1}} \dots (p _ {k - 1} e ^ {t _ {k - 1}}) ^ {x _ {k - 1}} p _ {k} ^ {x _ {k}},
$$

where the multiple sum is taken over all nonnegative integers and such that $x_{1} + x_{2} + \dots + x_{k - 1} \leq n$ . Let $m = \sum_{i = 1}^{k - 1} p_i e^{t_i} + p_{k - 1}$ . Recall that $x_{k} = n - \sum_{i = 1}^{k - 1} x_{i}$ . Then since $m > 0$ , we have

$$
\begin{array}{l} M \left(t _ {1}, \dots , t _ {k - 1}\right) = m ^ {n} \sum \dots \sum \frac {n !}{x _ {1} ! \cdots x _ {k - 1} ! x _ {k} !} \\ \times \left(\frac {p _ {1} e ^ {t _ {1}}}{m}\right) ^ {x _ {1}} \dots \left(\frac {p _ {k - 1} e ^ {t _ {k - 1}}}{m}\right) ^ {x _ {k - 1}} \left(\frac {p _ {k}}{m}\right) ^ {x _ {k}} \\ = m ^ {n} \times 1 = \left(\sum_ {i = 1} ^ {k - 1} p _ {i} e ^ {t _ {i}} + p _ {k - 1}\right) ^ {n}, \tag {3.1.6} \\ \end{array}
$$

where we have used the property that sum of a pmf over its support is 1.

We can use the joint mgf to determine marginal distributions. The mgf of $X_{i}$ is

$$
M (0, \dots , 0, t _ {i}, 0, \dots , 0) = \left(p _ {i} e ^ {t _ {i}} + (1 - p _ {i})\right) ^ {n};
$$

hence, $X_{i}$ is binomial with parameters $n$ and $p_i$ . The mgf of $(X_{i},X_{j})$ , $i < j$ , is

$$
M (0, \dots , 0, t _ {i}, 0, \dots , 0, t _ {j}, 0, \dots , 0) = \left(p _ {i} e ^ {t _ {i}} + p _ {j} e ^ {t _ {j}} + (1 - p _ {i} - p _ {j})\right) ^ {n};
$$

so that $(X_{i},X_{j})$ has a multinomial distribution with parameters $n$ , $p_i$ , and $p_j$ . At times, we say that $(X_{1},X_{2})$ has a trinomial distribution.

Another distribution of interest is the conditional distribution of $X_{i}$ given $X_{j}$ . For convenience, we select $i = 2$ and $j = 1$ . We know that $(X_{1}, X_{2})$ is multinomial with parameters $n$ and $p_{1}$ and $p_{2}$ and that $X_{1}$ is binomial with parameters $n$ and $p_{1}$ . Thus, the conditional pmf is,

$$
\begin{array}{l} p _ {X _ {2} | X _ {1}} \left(x _ {2} \mid x _ {1}\right) = \frac {p _ {X _ {1} , X _ {2}} \left(x _ {1} , x _ {2}\right)}{p _ {X _ {1}} \left(x _ {1}\right)} \\ = \frac {x _ {1} ! (n - x _ {1}) !}{n ! p _ {1} ^ {x _ {1}} [ 1 - p _ {1} ] ^ {n - x _ {1}}} \frac {n ! p _ {1} ^ {x _ {1}} p _ {2} ^ {x _ {2}} [ 1 - (p _ {1} + p _ {2}) ] ^ {n - (x _ {1} + x _ {2})}}{x _ {1} ! x _ {2} ! [ n - (x _ {1} + x _ {2}) ] !} \\ = \left( \begin{array}{c} n - x _ {1} \\ x _ {2} \end{array} \right) \frac {p _ {2} ^ {x _ {2}}}{(1 - p _ {1}) ^ {x _ {2}}} \frac {[ (1 - p _ {1}) - p _ {2} ] ^ {n - x _ {1} - x _ {2}}}{(1 - p _ {1}) ^ {n - x _ {1} - x _ {2}}} \\ = \left( \begin{array}{c} n - x _ {1} \\ x _ {2} \end{array} \right) \left(\frac {p _ {2}}{1 - p _ {1}}\right) ^ {x _ {2}} \left(1 - \frac {p _ {2}}{1 - p _ {1}}\right) ^ {n - x _ {1} - x _ {2}}, \\ \end{array}
$$

for $0 \leq x_{2} \leq n - x_{1}$ . Note that $p_{2} < 1 - p_{1}$ . Thus, the conditional distribution of $X_{2}$ given $X_{1} = x_{1}$ is binomial with parameters $n - x_{1}$ and $p_{2} / (1 - p_{1})$ .

Based on the conditional distribution of $X_{2}$ given $X_{1}$ , we have $E(X_{2}|X_{1}) = (n - X_{1})p_{2} / (1 - p_{1})$ . Let $\rho_{12}$ be the correlation coefficient between $X_{1}$ and $X_{2}$ . Since the conditional mean is linear with slope $-p_{2} / (1 - p_{1})$ , $\sigma_{2} = \sqrt{np_{2}(1 - p_{2})}$ and $\sigma_{1} = \sqrt{np_{1}(1 - p_{1})}$ , it follows from expression (2.5.4) that

$$
\rho_ {1 2} = - \frac {p _ {2}}{1 - p _ {1}} \frac {\sigma_ {1}}{\sigma_ {2}} = - \sqrt {\frac {p _ {1} p _ {2}}{(1 - p _ {1}) (1 - p _ {2})}}.
$$

Because the support of $X_{1}$ and $X_{2}$ has the constraint $x_{1} + x_{2} \leq n$ , the negative correlation is not surprising.

# 3.1.3 Hypergeometric Distribution

In Chapter 1, for a particular problem, we introduced the hypergeometric distribution; see expression (1.6.4). We now formally define it. Suppose we have a lot of $N$ items of which $D$ are defective. Let $X$ denote the number of defective items in a sample of size $n$ . If the sampling is done with replacement and the items are chosen at random, then $X$ has a binomial distribution with parameters $n$ and $D / N$ . In this case the mean and variance of $X$ are $n(D / N)$ and $n(D / N)[(N - D) / N]$ , respectively. Suppose, however, that the sampling is without replacement, which is often the case in practice. The pmf of $X$ follows by noting in this case that each of the $\binom{N}{n}$ samples are equilibrated and that there are $\binom{N-D}{n-x}\binom{D}{x}$ samples that have $x$ defective items. Hence, the pmf of $X$ is

$$
p (x) = \frac {\binom {N - D} {n - x} \binom {D} {x}}{\binom {N} {n}}, \quad x = 0, 1, \dots , n, \tag {3.1.7}
$$

where, as usual, a binomial coefficient is taken to be 0 when the top value is less than the bottom value. We say that $X$ has a hypergeometric distribution with parameters $(N, D, n)$ .

The mean of $X$ is

$$
\begin{array}{l} E (X) = \sum_ {x = 0} ^ {n} x p (x) = \sum_ {x = 1} ^ {n} x \frac {\binom {N - D} {n - x} [ D (D - 1) ! ] / [ x (x - 1) ! (D - x) ! ]}{[ N (N - 1) ! ] / [ (N - n) ! n (n - 1) ! ]} \\ = n \frac {D}{N} \sum_ {x = 1} ^ {n} \binom {(N - 1) - (D - 1)} {(n - 1) - (x - 1)} \binom {D - 1} {x - 1} \binom {N - 1} {n - 1} ^ {- 1} = n \frac {D}{N}. \\ \end{array}
$$

In the next-to-last step, we used the fact that the probabilities of a hypergeometric $(N - 1, D - 1, n - 1)$ distribution summed over its entire range is 1. So the means for both types of sampling (with and without replacement) are the same. The variances, though, differ. As Exercise 3.1.31 shows, the variance of a hypergeometric $(N, D, n)$ is

$$
\operatorname {V a r} (X) = n \frac {D}{N} \frac {N - D}{N} \frac {N - n}{N - 1}. \tag {3.1.8}
$$

The last term is often thought of as the correction term when sampling without replacement. Note that it is close to 1 if $N$ is much larger than $n$ .

The pmf (3.1.7) can be computed in R with the code dhyper(x, D, N-D, n). Suppose we draw 2 cards from a well shuffled standard deck of 52 cards and record the number of aces. The next R segment shows the probabilities over the range $\{0,1,2\}$ for sampling with and without replacement, respectively:

$$
\begin{array}{l} \operatorname {r n g} <   - 0: 2; \quad \operatorname {d b i n o m} (\operatorname {r n g}, 2, 1 / 1 3); \quad \operatorname {d h y p e r} (\operatorname {r n g}, 4, 4 8, 2) \\ [ 1 ] \quad 0. 8 5 2 0 7 1 0 1 \quad 0. 1 4 2 0 1 1 8 3 \quad 0. 0 0 5 9 1 7 1 6 \\ [ 1 ] \quad 0. 8 5 0 6 7 8 7 3 3 0. 1 4 4 7 9 6 3 8 0 0. 0 0 4 5 2 4 8 8 7 \\ \end{array}
$$

Notice how close the probabilities are.

# EXERCISES

3.1.1. If the mgf of a random variable $X$ is $\left(\frac{1}{3} + \frac{2}{3} e^t\right)^5$ , find $P(X = 2 \text{ or } 3)$ . Verify using the R function dbinom.

3.1.2. The mgf of a random variable $X$ is $(\frac{2}{3} + \frac{1}{3} e^t)^9$ .

(a) Show that

$$
P (\mu - 2 \sigma <   X <   \mu + 2 \sigma) = \sum_ {x = 1} ^ {5} \binom {9} {x} \left(\frac {1}{3}\right) ^ {x} \left(\frac {2}{3}\right) ^ {9 - x}.
$$

(b) Use R to compute the probability in Part (a).

3.1.3. If $X$ is $b(n,p)$ , show that

$$
E \left(\frac {X}{n}\right) = p \quad \mathrm {a n d} \quad E \left[ \left(\frac {X}{n} - p\right) ^ {2} \right] = \frac {p (1 - p)}{n}.
$$

3.1.4. Let the independent random variables $X_{1}, X_{2}, \ldots, X_{40}$ be iid with the common pdf $f(x) = 3x^{2}$ , $0 < x < 1$ , zero elsewhere. Find the probability that at least 35 of the $X_{i}$ 's exceed $\frac{1}{2}$ .

3.1.5. Over the years, the percentage of candidates passing an entrance exam to a prestigious law school is $20\%$ . At one of the testing centers, a group of 50 candidates take the exam and 20 pass. Is this odd? Answer on the basis that $X \geq 20$ where $X$ is the number that pass in a group of 50 when the probability of a pass is 0.2.

3.1.6. Let $Y$ be the number of successes throughout $n$ independent repetitions of a random experiment with probability of success $p = \frac{1}{4}$ . Determine the smallest value of $n$ so that $P(1 \leq Y) \geq 0.70$ .

3.1.7. Let the independent random variables $X_{1}$ and $X_{2}$ have binomial distribution with parameters $n_1 = 3$ , $p = \frac{2}{3}$ and $n_2 = 4$ , $p = \frac{1}{2}$ , respectively. Compute $P(X_{1} = X_{2})$ .

Hint: List the four mutually exclusive ways that $X_{1} = X_{2}$ and compute the probability of each.

3.1.8. For this exercise, the reader must have access to a statistical package that obtains the binomial distribution. Hints are given for R code, but other packages can be used too.

(a) Obtain the plot of the pmf for the $b(15,0.2)$ distribution. Using R, the following commands return the plot:

$$
x <   - 0: 1 5; \text {p l o t} (\text {d b i n o m} (x, 1 5,.. 2) ^ {\sim} x)
$$

(b) Repeat part (a) for the binomial distributions with $n = 15$ and with $p = 0.10, 0.20, \ldots, 0.90$ . Comment on the shapes of the pmf's as $p$ increases. Use the following R segment:

$\mathrm{x} <   - 0:15$ par(mfrow=c(3,3));p<-1:9/10 for(j in p){plot(dbinom(x,15,j)\~x);title(paste("p="，j))}

(c) Let $Y = \frac{X}{n}$ , where $X$ has a $b(n, 0.05)$ distribution. Obtain the plots of the pmfs of $Y$ for $n = 10, 20, 50, 200$ . Comment on the plots (what do the plots seem to be converging to as $n$ gets large?).

3.1.9. If $x = r$ is the unique mode of a distribution that is $b(n,p)$ , show that

$$
(n + 1) p - 1 <   r <   (n + 1) p.
$$

This substantiates the comments made in Part (b) of Exercise 3.1.8.

Hint: Determine the values of $x$ for which $p(x + 1) / p(x) > 1$ .

3.1.10. Suppose $X$ is $b(n,p)$ . Then by definition the pmf is symmetric if and only if $p(x) = p(n - x)$ , for $x = 0, \ldots, n$ . Show that the pmf is symmetric if and only if $p = 1/2$ .

3.1.11. Toss two nickels and three dimes at random. Make appropriate assumptions and compute the probability that there are more heads showing on the nickels than on the dimes.

3.1.12. Let $X_{1}, X_{2}, \ldots, X_{k-1}$ have a multinomial distribution.

(a) Find the mgf of $X_{2},X_{3},\ldots ,X_{k - 1}$   
(b) What is the pmf of $X_{2},X_{3},\ldots ,X_{k - 1}$   
(c) Determine the conditional pmf of $X_{1}$ given that $X_{2} = x_{2},\ldots ,X_{k - 1} = x_{k - 1}$   
(d) What is the conditional expectation $E(X_{1}|x_{2},\ldots ,x_{k - 1})$ ?

3.1.13. Let $X$ be $b(2,p)$ and let $Y$ be $b(4,p)$ . If $P(X \geq 1) = \frac{5}{9}$ , find $P(Y \geq 1)$ .

3.1.14. Let $X$ have a binomial distribution with parameters $n$ and $p = \frac{1}{3}$ . Determine the smallest integer $n$ can be such that $P(X \geq 1) \geq 0.85$ .   
3.1.15. Let $X$ have the pmf $p(x) = \left(\frac{1}{3}\right)\left(\frac{2}{3}\right)^x$ , $x = 0, 1, 2, 3, \ldots$ , zero elsewhere. Find the conditional pmf of $X$ given that $X \geq 3$ .   
3.1.16. One of the numbers $1,2,\ldots ,6$ is to be chosen by casting an unbiased die. Let this random experiment be repeated five independent times. Let the random variable $X_{1}$ be the number of terminations in the set $\{x:x = 1,2,3\}$ and let the random variable $X_{2}$ be the number of terminations in the set $\{x:x = 4,5\}$ . Compute $P(X_{1} = 2,X_{2} = 1)$ .   
3.1.17. Show that the moment generating function of the negative binomial distribution is $M(t) = p^{r}[1 - (1 - p)e^{t}]^{-r}$ . Find the mean and the variance of this distribution.

Hint: In the summation representing $M(t)$ , make use of the negative binomial series.

3.1.18. One way of estimating the number of fish in a lake is the following capture-recapture sampling scheme. Suppose there are $N$ fish in the lake where $N$ is unknown. A specified number of fish $T$ are captured, tagged, and released back to the lake. Then at a specified time and for a specified positive integer $r$ , fish are captured until the $r$ th tagged fish is caught. The random variable of interest is $Y$ the number of nontagged fish caught.

(a) What is the distribution of $Y$ ? Identify all parameters.   
(b) What is $E(Y)$ and the $\operatorname{Var}(Y)$ ?   
(c) The method of moment estimate of $N$ is to set $Y$ equal to the expression for $E(Y)$ and solve this equation for $N$ . Call the solution $\hat{N}$ . Determine $\hat{N}$ .   
(d) Determine the mean and variance of $\hat{N}$ .

3.1.19. Consider a multinomial trial with outcomes $1, 2, \ldots, k$ and respective probabilities $p_1, p_2, \ldots, p_k$ . Let $\mathbf{ps}$ denote the R vector for $(p_1, p_2, \ldots, p_k)$ . Then a single random trial of this multinomial is computed with the command multitrial(ps), where the required R functions are:

```r
psum <- function(v) {
    p <- 0; psum <- c()
    for(j in 1:length(v)) {p <- p + v[j]; psum <- c(psum, p)}
    return(psum)}
multitrial <- function(p) {
    pr <- c(0, psum(p))
    r <- runif(1); ic <- 0; j <- 1
    while(ic == 0) {if((r > pr[j]) && (r <= pr[j+1])) {multitrial <- j; ic <- 1; j <- j+1}
    return(multitrial)} 
```

(a) Compute 10 random trials if $\mathsf{ps} = \mathsf{c}(.3, .2, .2, .2, .1)$ .   
(b) Compute 10,000 random trials for ps as in (a). Check to see how close the estimates of $p_i$ are with $p_i$ .

3.1.20. Using the experiment in part (a) of Exercise 3.1.19, consider a game when a person pays $5 to play. If the trial results in a 1 or 2, she receives nothing; if a 3, she receives $1; if a 4, she receives $2; and if a 5, she receives $20. Let G be her gain.

(a) Determine $E(G)$   
(b) Write R code that simulates the gain. Then simulate it 10,000 times, collecting the gains. Compute the average of these 10,000 gains and compare it with $E(G)$ .

3.1.21. Let $X_{1}$ and $X_{2}$ have a trinomial distribution. Differentiate the moment-generating function to show that their covariance is $-np_{1}p_{2}$ .

3.1.22. If a fair coin is tossed at random five independent times, find the conditional probability of five heads given that there are at least four heads.

3.1.23. Let an unbiased die be cast at random seven independent times. Compute the conditional probability that each side appears at least once given that side 1 appears exactly twice.

3.1.24. Compute the measures of skewness and kurtosis of the binomial distribution $b(n,p)$ .

3.1.25. Let

$$
p (x _ {1}, x _ {2}) = \left( \begin{array}{c} x _ {1} \\ x _ {2} \end{array} \right) \left(\frac {1}{2}\right) ^ {x _ {1}} \left(\frac {x _ {1}}{1 5}\right), \quad \begin{array}{c} x _ {2} = 0, 1, \ldots , x _ {1} \\ x _ {1} = 1, 2, 3, 4, 5, \end{array}
$$

zero elsewhere, be the joint pmf of $X_{1}$ and $X_{2}$ . Determine

(a) $E(X_{2})$   
(b) $u(x_{1}) = E(X_{2}|x_{1}).$   
(c) $E[u(X_1)]$

Compare the answers of parts (a) and (c).

Hint: Note that $E(X_2) = \sum_{x_1=1}^{5} \sum_{x_2=0}^{x_1} x_2 p(x_1, x_2)$ .

3.1.26. Three fair dice are cast. In 10 independent casts, let $X$ be the number of times all three faces are alike and let $Y$ be the number of times only two faces are alike. Find the joint pmf of $X$ and $Y$ and compute $E(6XY)$ .

3.1.27. Let $X$ have a geometric distribution. Show that

$$
P (X \geq k + j \mid X \geq k) = P (X \geq j), \tag {3.1.9}
$$

where $k$ and $j$ are nonnegative integers. Note that we sometimes say in this situation that $X$ is memoryless.

3.1.28. Let $X$ equal the number of independent tosses of a fair coin that are required to observe heads on consecutive tosses. Let $u_{n}$ equal the $n$ th Fibonacci number, where $u_{1} = u_{2} = 1$ and $u_{n} = u_{n - 1} + u_{n - 2}$ , $n = 3, 4, 5, \ldots$ .

(a) Show that the pmf of $X$ is

$$
p (x) = \frac {u _ {x - 1}}{2 ^ {x}}, \quad x = 2, 3, 4, \dots .
$$

(b) Use the fact that

$$
u _ {n} = \frac {1}{\sqrt {5}} \left[ \left(\frac {1 + \sqrt {5}}{2}\right) ^ {n} - \left(\frac {1 - \sqrt {5}}{2}\right) ^ {n} \right]
$$

to show that $\sum_{x=2}^{\infty} p(x) = 1$ .

3.1.29. Let the independent random variables $X_{1}$ and $X_{2}$ have binomial distributions with parameters $n_1$ , $p_1 = \frac{1}{2}$ and $n_2$ , $p_2 = \frac{1}{2}$ , respectively. Show that $Y = X_{1} - X_{2} + n_{2}$ has a binomial distribution with parameters $n = n_1 + n_2$ , $p = \frac{1}{2}$ .

3.1.30. Consider a shipment of 1000 items into a factory. Suppose the factory can tolerate about $5\%$ defective items. Let $X$ be the number of defective items in a sample without replacement of size $n = 10$ . Suppose the factory returns the shipment if $X \geq 2$ .

(a) Obtain the probability that the factory returns a shipment of items that has $5\%$ defective items.   
(b) Suppose the shipment has $10\%$ defective items. Obtain the probability that the factory returns such a shipment.   
(c) Obtain approximations to the probabilities in parts (a) and (b) using appropriate binomial distributions.

Note: If you do not have access to a computer package with a hypergeometric command, obtain the answer to (c) only. This is what would have been done in practice 20 years ago. If you have access to R, then the command dhyper(x,D,N-D,n) returns the probability in expression (3.1.7).

3.1.31. Show that the variance of a hypergeometric $(N, D, n)$ distribution is given by expression (3.1.8).

Hint: First obtain $E[X(X - 1)]$ by proceeding in the same way as the derivation of the mean given in Section 3.1.3.

# 3.2 The Poisson Distribution

Recall that the following series expansion holds for all real numbers $z$ :

$$
1 + z + \frac {z ^ {2}}{2 !} + \frac {z ^ {3}}{3 !} + \dots = \sum_ {x = 0} ^ {\infty} \frac {z ^ {x}}{x !} = e ^ {z}.
$$

Consider the function $p(x)$ defined by

$$
p (x) = \left\{ \begin{array}{l l} \frac {\lambda^ {x} e ^ {- \lambda}}{x !} & x = 0, 1, 2, \dots \\ 0 & \text {e l s e w h e r e ,} \end{array} \right. \tag {3.2.1}
$$

where $\lambda > 0$ . Since $\lambda > 0$ , then $p(x) \geq 0$ and

$$
\sum_ {x = 0} ^ {\infty} p (x) = \sum_ {x = 0} ^ {\infty} \frac {\lambda^ {x} e ^ {- \lambda}}{x !} = e ^ {- \lambda} \sum_ {x = 0} ^ {\infty} \frac {\lambda^ {x}}{x !} = e ^ {- \lambda} e ^ {\lambda} = 1;
$$

that is, $p(x)$ satisfies the conditions of being a pmf of a discrete type of random variable. A random variable that has a pmf of the form $p(x)$ is said to have a Poisson distribution with parameter $\lambda$ , and any such $p(x)$ is called a Poisson pmf with parameter $\lambda$ .

As the following remark shows, Poisson distributions occur in many areas of applications.

Remark 3.2.1. Consider a process that counts the number of certain events occurring over an interval of time; for example, the number of tornados that touch down in Michigan per year, the number of cars entering a parking lot between 8:00 and 12:00 on a weekday, the number of car accidents at a busy intersection per week, the number of typographical errors per page of a manuscript, and the number of blemishes on a manufactured car door. As in the third and fourth examples, the occurrences need not be over time. It is convenient, though, to use the time representation in the following derivation. Let $X_{t}$ denote the number of occurrences of such a process over the interval $(0,t]$ . The range of $X_{t}$ is the set of nonnegative integers $\{0,1,2,\ldots\}$ . For a nonnegative integer $k$ and a real number $t > 0$ , denote the pmf of $X_{t}$ by $P(X_{t} = k) = g(k,t)$ . Under the following three axioms, we next show that $X_{t}$ has a Poisson distribution.

1. $g(1,h) = \lambda h + o(h)$ , for a constant $\lambda > 0$ .   
2. $\sum_{t = 2}^{\infty}g(t,h) = o(h)$   
3. The number of occurrences in nonoverlapping intervals are independent of one another.

Here the $o(h)$ notation means that $o(h) / h \to 0$ as $h \to 0$ . For instance, $h^2 = o(h)$ and $o(h) + o(h) = o(h)$ . Note that the first two axioms imply that in a small interval of time $h$ , either one or no events occur and that the probability of one event occurring is proportional to $h$ .

By the method of induction, we now show that the distribution of $X_{t}$ is Poisson with parameter $\lambda t$ . First, we obtain $g(k,t)$ for $k = 0$ . Note that the boundary condition $g(0,0) = 1$ is reasonable. No events occur in time $(0,t + h]$ if and only if no events occur in $(0,t]$ and no events occur in $(t,t + h]$ . By Axioms (1) and (2), the probability that no events occur in the interval $(0,h]$ is $1 - \lambda h + o(h)$ . Further, the intervals $(0,t]$ and $(t,t + h]$ do not overlap. Hence, by Axiom (3) we have

$$
g (0, t + h) = g (0, t) [ 1 - \lambda h + o (h) ]. \tag {3.2.2}
$$

That is,

$$
\frac {g (0 , t + h) - g (0 , t)}{h} = - \lambda g (0, t) + \frac {g (0 , t) o (h)}{h} \rightarrow - \lambda g (0, t), \mathrm {a s} h \rightarrow 0.
$$

Thus, $g(0,t)$ satisfies the differential equation

$$
\frac {d _ {t} g (0 , t)}{g (0 , t)} = - \lambda
$$

Integrating both side with respect to $t$ , we have for some constant $c$ that

$$
\log g (0, t) = - \lambda t + c \text {o r} g (0, t) = e ^ {- \lambda t} e ^ {c}.
$$

Finally, using the boundary condition $g(0,0) = 1$ , we have $e^c = 1$ . Hence,

$$
g (0, t) = e ^ {- \lambda t}. \tag {3.2.3}
$$

So the result holds for $k = 0$ .

For the remainder of the proof, assume that, for $k$ a nonnegative integer, $g(k,t) = e^{-\lambda t}(\lambda t)^k /k!$ . By induction, the proof follows if we can show that the result holds for $g(k + 1,t)$ . Another reasonable boundary condition is $g(k + 1,0) = 0$ . Consider $g(k + 1,t + h)$ . In order to have $k + 1$ occurrences in $(0,t + h]$ either there are $k + 1$ occurrences in $(0,t]$ and no occurrences in $(t,t + h]$ or there are $k$ occurrences in $(0,t]$ and one occurrence in $(t,t + h]$ . Because these events are disjoint we have by the independence of Axiom 3 that

$$
g (k + 1, t + h) = g (k + 1, t) [ 1 - \lambda h + o (h) ] + g (k, t) [ \lambda h + o (h) ],
$$

that is,

$$
\frac {g (k + 1 , t + h) - g (k + 1 , t)}{h} = - \lambda g (k + 1, t) + g (k, t) \lambda + [ g (k + 1, t) + g (k, t) ] \frac {o (h)}{h}.
$$

Letting $h \to 0$ and using the value of $g(k, t)$ , we obtain the differential equation

$$
\frac {d}{d t} g (k + 1, t) = - \lambda g (k + 1, t) + \lambda e ^ {- \lambda t} [ (\lambda t) ^ {k} / k! ].
$$

This is a linear differential equation of first order. Appealing to a theorem in differential equations, its solution is

$$
e ^ {\int \lambda d t} g (k + 1, t) = \int e ^ {\int \lambda d t} \lambda e ^ {- \lambda t} [ (\lambda t) ^ {k} / k! ] d t + c.
$$

Using the boundary condition $g(k + 1,0) = 0$ and carrying out the integration, we obtain

$$
g (k + 1, t) = e ^ {- \lambda t} [ (\lambda t) ^ {k + 1} / (k + 1)! ]
$$

Therefore, $X_{t}$ has a Poisson distribution with parameter $\lambda t$ .

Let $X$ have a Poisson distribution with parameter $\lambda$ . The mgf of $X$ is given by

$$
\begin{array}{l} M (t) = \sum_ {x = 0} ^ {\infty} e ^ {t x} p (x) = \sum_ {x = 0} ^ {\infty} e ^ {t x} \frac {\lambda^ {x} e ^ {- \lambda}}{x !} \\ = e ^ {- \lambda} \sum_ {x = 0} ^ {\infty} \frac {\left(\lambda e ^ {t}\right) ^ {x}}{x !} \\ = e ^ {- \lambda} e ^ {\lambda e ^ {t}} = e ^ {\lambda (e ^ {t} - 1)} \\ \end{array}
$$

for all real values of $t$ . Since

$$
M ^ {\prime} (t) = e ^ {\lambda \left(e ^ {t} - 1\right)} (\lambda e ^ {t})
$$

and

$$
M ^ {\prime \prime} (t) = e ^ {\lambda (e ^ {t} - 1)} \lambda e ^ {t} \lambda e ^ {t} + e ^ {\lambda (e ^ {t} - 1)} \lambda e ^ {t}
$$

then

$$
\mu = M ^ {\prime} (0) = \lambda
$$

and

$$
\sigma^ {2} = M ^ {\prime \prime} (0) - \mu^ {2} = \lambda^ {2} + \lambda - \lambda^ {2} = \lambda .
$$

That is, a Poisson distribution has $\mu = \sigma^2 = \lambda > 0$ .

If $X$ has a Poisson distribution with parameter $\lambda$ , then $P(X = k)$ is computed by the R command dpois(k, lambda) and the cumulative probability $P(X \leq k)$ is calculated by ppois(k, lambda).

Example 3.2.1. Let $X$ be the number of automobile accidents at a busy intersection per week. Suppose that $X$ has a Poisson distribution with $\lambda = 2$ . Then the expected number of accidents per week is 2 and the standard deviation of the number of accidents is $\sqrt{2}$ . The probability of at least one accident in a week is

$$
P (X \geq 1) = 1 - P (X = 0) = 1 - e ^ {- 2} = 1 - \mathrm {d p o i s} (0, 2) = 0. 8 6 4 7
$$

and the probability that there are between 3 and 8 (inclusive) accidents is

$$
P (3 \leq X \leq 8) = P (X \leq 8) - P (X \leq 2) = \text {p p o i s} (8, 2) - \text {p p o i s} (2, 2) = 0. 3 2 3 1.
$$

Suppose we want to determine the probability that there are exactly 16 accidents in a 4 week period. By Remark 3.2.1, the number of accidents over a 4 week period has a Poisson distribution with parameter $2 \times 4 = 8$ . So the desired probability is $\text{dpois}(16,8) = 0.0045$ . The following R code computes a spiked plot of the pmf of $X$ over $\{0,1,\ldots,7\}$ , a subset of the range of $X$ .

$$
\begin{array}{l} \text {r n g = 0 : 7 ; y = d p o i s (r n g , 2) ; p l o t (y ^ {\sim} r n g , t y p e = " h " , y l a b = " p m f " , x l a b = " R n g ")}; \\ \text {p o i n t s (y ^ {\sim} r n g , p c h = 1 6 , c e x = 2)} \end{array}
$$

Example 3.2.2. Let the probability of exactly one blemish in 1 foot of wire be about $\frac{1}{1000}$ and let the probability of two or more blemishes in that length be, for all practical purposes, zero. Let the random variable $X$ be the number of blemishes in 3000 feet of wire. If we assume the independence of the number of blemishes in nonoverlapping intervals, then by Remark 3.2.1 the postulates of the Poisson process are approximated, with $\lambda = \frac{1}{1000}$ and $t = 3000$ . Thus $X$ has an approximate Poisson distribution with mean $3000\left(\frac{1}{1000}\right) = 3$ . For example, the probability that there are five or more blemishes in 3000 feet of wire is

$$
P (X \geq 5) = \sum_ {k = 5} ^ {\infty} \frac {3 ^ {k} e ^ {- 3}}{k !} = 1 - \mathrm {p p o i s} (4, 3) = 0. 1 8 4 7.
$$

The Poisson distribution satisfies the following important additive property.

Theorem 3.2.1. Suppose $X_{1},\ldots ,X_{n}$ are independent random variables and suppose $X_{i}$ has a Poisson distribution with parameter $\lambda_{i}$ . Then $Y = \sum_{i = 1}^{n}X_{i}$ has a Poisson distribution with parameter $\sum_{i = 1}^{n}\lambda_{i}$ .

Proof: We obtain the result by determining the mgf of $Y$ , which by Theorem 2.6.1 is given by

$$
M _ {Y} (t) = E \left(e ^ {t Y}\right) = \prod_ {i = 1} ^ {n} e ^ {\lambda_ {i} (e ^ {t} - 1)} = e ^ {\sum_ {i = 1} ^ {n} \lambda_ {i} (e ^ {t} - 1)}.
$$

By the uniqueness of mgfs, we conclude that $Y$ has a Poisson distribution with parameter $\sum_{i=1}^{n} \lambda_i$ .

Example 3.2.3 (Example 3.2.2, Continued). Suppose, as in Example 3.2.2, that a bail of wire consists of 3000 feet. Based on the information in the example, we expect three blemishes in a bail of wire, and the probability of five or more blemishes is 0.1847. Suppose in a sampling plan, three tails of wire are selected at random and we compute the mean number of blemishes in the wire. Now suppose we want to determine the probability that the mean of the three observations has five or more blemishes. Let $X_{i}$ be the number of blemishes in the $i$ th bail of wire for $i = 1, 2, 3$ . Then $X_{i}$ has a Poisson distribution with parameter 3. The mean of $X_{1}, X_{2}$ , and $X_{3}$ is $\overline{X} = 3^{-1}\sum_{i=1}^{3}X_{i}$ , which can also be expressed as $Y/3$ , where $Y = \sum_{i=1}^{3}X_{i}$ . By the last theorem, because the tails are independent of one another, $Y$ has a Poisson distribution with parameter $\sum_{i=1}^{3}3 = 9$ . Hence, the desired probability is

$$
P (\bar {X} \geq 5) = P (Y \geq 1 5) = 1 - \text {p p o i s} (1 4, 9) = 0. 0 4 1 5.
$$

Hence, while it is not too odd that a bail has five or more blemishes (probability is 0.1847), it is unusual (probability is 0.0415) that three independent bails of wire average five or more blemishes.

# EXERCISES

3.2.1. If the random variable $X$ has a Poisson distribution such that $P(X = 1) = P(X = 2)$ , find $P(X = 4)$ .

3.2.2. The mgf of a random variable $X$ is $e^{4(e^t - 1)}$ . Show that $P(\mu - 2\sigma < X < \mu + 2\sigma) = 0.931$ .

3.2.3. In a lengthy manuscript, it is discovered that only 13.5 percent of the pages contain no typing errors. If we assume that the number of errors per page is a random variable with a Poisson distribution, find the percentage of pages that have exactly one error.

3.2.4. Let the pmf $p(x)$ be positive on and only on the nonnegative integers. Given that $p(x) = (4/x)p(x - 1)$ , $x = 1, 2, 3, \ldots$ , find the formula for $p(x)$ .

Hint: Note that $p(1) = 4p(0)$ , $p(2) = (4^2 / 2!)p(0)$ , and so on. That is, find each $p(x)$ in terms of $p(0)$ and then determine $p(0)$ from

$$
1 = p (0) + p (1) + p (2) + \dots .
$$

3.2.5. Let $X$ have a Poisson distribution with $\mu = 100$ . Use Chebyshev's inequality to determine a lower bound for $P(75 < X < 125)$ . Next, calculate the probability using R. Is the approximation by Chebyshev's inequality accurate?

3.2.6. The following R code segment computes a page of plots for Poisson pmfs with means 2, 4, 6, ..., 18. Run this code and comment on the the shapes and modes of the distributions.

par(mfrow=c(3,3)); x=0:35; lam=seq(2,18,2);

for(y in lam){plot(dpois(x,y)~x); title(paste("Mean is ",y))}

3.2.7. By Exercise 3.2.6 it seems that the Poisson pmf peaks at its mean $\lambda$ . Show that this is the case by solving the inequalities $[p(x + 1) / p(x)] > 1$ and $[p(x + 1) / p(x)] < 1$ , where $p(x)$ is the pmf of a Poisson distribution with parameter $\lambda$ .

3.2.8. Using the computer, obtain an overlay plot of the pmfs of the following two distributions:

(a) Poisson distribution with $\lambda = 2$   
(b) Binomial distribution with $n = 100$ and $p = 0.02$ .

Why would these distributions be approximately the same? Discuss.

3.2.9. Continuing with Exercise 3.2.8, make a page of four overlay plots for the following 4 Poisson and binomial combinations: $\lambda = 2, p = 0.02$ ; $\lambda = 10, p = 0.10$ ; $\lambda = 30, p = 0.30$ ; $\lambda = 50, p = 0.50$ . Use $n = 100$ in each situation. Plot the subset of the binomial range that is between $np \pm \sqrt{np(1 - p)}$ . For each situation, comment on the goodness of the Poisson approximation to the binomial.

3.2.10. The approximation discussed in Exercise 3.2.8 can be made precise in the following way. Suppose $X_{n}$ is binomial with the parameters $n$ and $p = \lambda / n$ , for a given $\lambda > 0$ . Let $Y$ be Poisson with mean $\lambda$ . Show that $P(X_{n} = k) \to P(Y = k)$ , as $n \to \infty$ , for an arbitrary but fixed value of $k$ .

Hint: First show that:

$$
P (X _ {n} = k) = \frac {\lambda^ {k}}{k !} \left[ \frac {n (n - 1) \cdots (n - k + 1)}{n ^ {k}} \left(1 - \frac {\lambda}{n}\right) ^ {- k} \right] \left(1 - \frac {\lambda}{n}\right) ^ {n}.
$$

3.2.11. Let the number of chocolate chips in a certain type of cookie have a Poisson distribution. We want the probability that a cookie of this type contains at least two chocolate chips to be greater than 0.99. Find the smallest value of the mean that the distribution can take.

3.2.12. Compute the measures of skewness and kurtosis of the Poisson distribution with mean $\mu$ .

3.2.13. On the average, a grocer sells three of a certain article per week. How many of these should he have in stock so that the chance of his running out within a week is less than 0.01? Assume a Poisson distribution.

3.2.14. Let $X$ have a Poisson distribution. If $P(X = 1) = P(X = 3)$ , find the mode of the distribution.

3.2.15. Let $X$ have a Poisson distribution with mean 1. Compute, if it exists, the expected value $E(X!)$ .

3.2.16. Let $X$ and $Y$ have the joint pmf $p(x, y) = e^{-2} / [x!(y - x)!]$ , $y = 0, 1, 2, \ldots, x = 0, 1, \ldots, y$ , zero elsewhere.

(a) Find the mgf $M(t_{1}, t_{2})$ of this joint distribution.   
(b) Compute the means, the variances, and the correlation coefficient of $X$ and $Y$ .   
(c) Determine the conditional mean $E(X|y)$ .

Hint: Note that

$$
\sum_ {x = 0} ^ {y} [ \exp (t _ {1} x) ] y! / [ x! (y - x)! ] = [ 1 + \exp (t _ {1}) ] ^ {y}.
$$

Why?

3.2.17. Let $X_{1}$ and $X_{2}$ be two independent random variables. Suppose that $X_{1}$ and $Y = X_{1} + X_{2}$ have Poisson distributions with means $\mu_{1}$ and $\mu > \mu_{1}$ , respectively. Find the distribution of $X_{2}$ .

# 3.3 The $\Gamma, \chi^2$ , and $\beta$ Distributions

In this section we introduce the continuous gamma $\Gamma$ -distribution and several associated distributions. The support for the $\Gamma$ -distribution is the set of positive real numbers. This distribution and its associated distributions are rich in applications in all areas of science and business. These applications include their use in modeling lifetimes, failure times, service times, and waiting times.

The definition of the $\Gamma$ -distribution requires the $\Gamma$ function from calculus. It is proved in calculus that the integral

$$
\int_ {0} ^ {\infty} y ^ {\alpha - 1} e ^ {- y} d y
$$

exists for $\alpha > 0$ and that the value of the integral is a positive number. The integral is called the gamma function of $\alpha$ , and we write

$$
\Gamma (\alpha) = \int_ {0} ^ {\infty} y ^ {\alpha - 1} e ^ {- y} d y.
$$

If $\alpha = 1$ , clearly

$$
\Gamma (1) = \int_ {0} ^ {\infty} e ^ {- y} d y = 1.
$$

If $\alpha > 1$ , an integration by parts shows that

$$
\Gamma (\alpha) = (\alpha - 1) \int_ {0} ^ {\infty} y ^ {\alpha - 2} e ^ {- y} d y = (\alpha - 1) \Gamma (\alpha - 1). \tag {3.3.1}
$$

Accordingly, if $\alpha$ is a positive integer greater than 1,

$$
\Gamma (\alpha) = (\alpha - 1) (\alpha - 2) \dots (3) (2) (1) \Gamma (1) = (\alpha - 1)!
$$

Since $\Gamma(1) = 1$ , this suggests we take $0! = 1$ , as we have done. The $\Gamma$ function is sometimes called the factorial function.

We say that the continuous random variable $X$ has a $\Gamma$ -distribution with parameters $\alpha > 0$ and $\beta > 0$ , if its pdf is

$$
f (x) = \left\{ \begin{array}{l l} \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} x ^ {\alpha - 1} e ^ {- x / \beta} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.2}
$$

In which case, we often write that $X$ has $\Gamma (\alpha ,\beta)$ distribution.

To verify that $f(x)$ is a pdf, note first that $f(x) > 0$ , for all $x > 0$ . To show that it integrates to 1 over its support, we use the change-of-variable $z = x / \beta$ , $dz = (1 / \beta) dx$ in the following derivation:

$$
\begin{array}{l} \int_ {0} ^ {\infty} \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} x ^ {\alpha - 1} e ^ {- x / \beta} d x = \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} \int_ {0} ^ {\infty} (\beta z) ^ {\alpha - 1} e ^ {- z} \beta d z \\ = \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} \beta^ {\alpha} \Gamma (\alpha) = 1; \\ \end{array}
$$

hence, $f(x)$ is a pdf. This change-of-variable used is worth remembering. We use a similar change-of-variable in the following derivation of $X$ 's mgf:

$$
\begin{array}{l} M (t) = \int_ {0} ^ {\infty} e ^ {t x} \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} x ^ {\alpha - 1} e ^ {- x / \beta} d x \\ { = } { \int _ { 0 } ^ { \infty } \frac { 1 } { \Gamma ( \alpha ) \beta ^ { \alpha } } x ^ { \alpha - 1 } e ^ { - x ( 1 - \beta t ) / \beta } d x . } \\ \end{array}
$$

Next, use the change-of-variable $y = x(1 - \beta t) / \beta$ , $t < 1 / \beta$ , or $x = \beta y / (1 - \beta t)$ , to obtain

$$
M (t) = \int_ {0} ^ {\infty} \frac {\beta / (1 - \beta t)}{\Gamma (\alpha) \beta^ {\alpha}} \left(\frac {\beta y}{1 - \beta t}\right) ^ {\alpha - 1} e ^ {- y} d y.
$$

That is,

$$
\begin{array}{l} { M ( t ) } { = } { \left( \frac { 1 } { 1 - \beta t } \right) ^ { \alpha } \int _ { 0 } ^ { \infty } \frac { 1 } { \Gamma ( \alpha ) } y ^ { \alpha - 1 } e ^ { - y } d y } \\ = \frac {1}{(1 - \beta t) ^ {\alpha}}, \quad t <   \frac {1}{\beta}. \\ \end{array}
$$

Now

$$
M ^ {\prime} (t) = (- \alpha) (1 - \beta t) ^ {- \alpha - 1} (- \beta)
$$

and

$$
M ^ {\prime \prime} (t) = (- \alpha) (- \alpha - 1) (1 - \beta t) ^ {- \alpha - 2} (- \beta) ^ {2}.
$$

Hence, for a gamma distribution, we have

$$
\mu = M ^ {\prime} (0) = \alpha \beta
$$

and

$$
\sigma^ {2} = M ^ {\prime \prime} (0) - \mu^ {2} = \alpha (\alpha + 1) \beta^ {2} - \alpha^ {2} \beta^ {2} = \alpha \beta^ {2}.
$$

Suppose $X$ has a $\Gamma(\alpha, \beta)$ distribution. To calculate probabilities for this distribution in $\mathbf{R}$ , let $a = \alpha$ and $b = \beta$ . Then the command pgamma(x, shape=a, scale=b) returns $P(X \leq x)$ , while the value of the pdf of $X$ at $x$ is returned by the command dgamma(x, shape=a, scale=b).

Example 3.3.1. Let $X$ be the lifetime in hours of a certain battery used under extremely cold conditions. Suppose $X$ has a $\Gamma(5,4)$ distribution. Then the mean lifetime of the battery is 20 hours with standard deviation $\sqrt{5 \times 16} = 8.94$ hours. The probability that battery lasts at least 50 hours is 1-pgamma(50, shape=5, scale=4) = 0.0053. The median lifetime of the battery is qgamma(.5, shape=5, scale=4) = 18.68 hours. The probability that the lifetime is within one standard deviation of its mean lifetime is

$$
p g a m m a (2 0 + 8. 9 4, s h a p e = 5, s c a l e = 4) - p g a m m a (2 0 - 8. 9 4, s h a p e = 5, s c a l e = 4) = . 7 0 0.
$$

Finally, this line of R code presents a plot of the pdf:

$$
x = \operatorname {s e q} (. 1, 5 0,.. 1); \text {p l o t} (\operatorname {d g a m m a} (x, \text {s h a p e} = 5, \text {s c a l e} = 4) \sim x).
$$

On this plot, the reader should locate the above probabilities and the mean and median lifetimes of the battery.

The main reason for the appeal of the $\Gamma$ -distribution in applications is the variety of shapes of the distribution for different values of $\alpha$ and $\beta$ . This is apparent in Figure 3.3.1 which depicts six $\Gamma$ -pdfs. $^4$

Suppose $X$ denotes the failure time of a device with pdf $f(x)$ and cdf $F(x)$ . In practice, the pdf of $X$ is often unknown. If a large sample of failure times of these devices is at hand then estimates of the pdf can be obtained as discussed in Chapter 4. Another function that helps in identifying the pdf of $X$ is the hazard function of $X$ . Let $x$ be in the support of $X$ . Suppose the device has not failed at time $x$ , i.e., $X > x$ . What is the probability that the device fails in the next instance? We answer this question in terms of the rate of failure at $x$ , which is:

$$
\begin{array}{l} r (x) = \lim  _ {\Delta \rightarrow 0} \frac {P (x \leq X <   x + \Delta \mid X \geq x)}{\Delta} = \frac {1}{1 - F (x)} \lim  _ {\Delta \rightarrow 0} \frac {P (x \leq X <   x + \Delta)}{\Delta} \\ = \frac {f (x)}{1 - F (x)}. \tag {3.3.3} \\ \end{array}
$$

The rate of failure at time $x$ , $r(x)$ , is defined as the hazard function of $X$ at $x$ .

![](images/4232523a2d2791f6ed7607ef4a73f4fd1843c9c5ab0af3936b84386d3ea8b958.jpg)

![](images/02591200493c69ce628e556f9201b0665d1af3740718a646e80d901ddabf59d6.jpg)  
Figure 3.3.1: Several gamma densities

Note that the hazard function $r(x)$ satisfies $-(d / dx)\log [1 - F(x)]$ ; that is,

$$
1 - F (x) = e ^ {- \int r (x) d x + c}, \tag {3.3.4}
$$

for a constant $c$ . When the support of $X$ is $(0, \infty)$ , $F(0) = 0$ serves as a boundary condition to solve for $c$ . In practice, often the scientist can describe the hazard rate and, hence, $F(x)$ can be determined from expression (3.3.4). For example, suppose the hazard rate of $X$ is constant; i.e., $r(x) = 1 / \beta$ for some $\beta > 0$ . Then

$$
1 - F (x) = e ^ {- \int (1 / \beta) d x + c} = e ^ {- x / \beta} e ^ {c}.
$$

Since $F(0) = 0$ , $e^c = 1$ . So the pdf of $X$ is

$$
f (x) = \left\{ \begin{array}{l l} \frac {1}{\beta} e ^ {- x / \beta} & x > 0 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.5}
$$

Of course, this is a $\Gamma(1,\beta)$ distribution, but it is also called the exponential distribution with parameter $1/\beta$ . An important property of this distribution is given in Exercise 3.3.25.

Using R, hazard functions can be quickly plotted. Here is the code for an overlay plot of the hazard functions of the exponential distribution with $\beta = 8$ and the $\Gamma(4,2)$ -distribution.

$$
x = \operatorname {s e q} (. 1, 1 5,.. 1); t = d g a m m a (x, s h a p e = 4, s c a l e = 2)
$$

$$
b = (1 - p g a m m a (x, s h a p e = 4, s c a l e = 2)); y 1 = t / b; p l o t (y 1 ^ {\sim} x); a b l i n e (h = 1 / 8)
$$

Note that the hazard function of this $\Gamma$ -distribution is an increasing function of $x$ ; i.e., the rate of failure increases as time progresses. Other examples of hazard functions are given in Exercise 3.3.26.

One of the most important properties of the gamma distribution is its additive property.

Theorem 3.3.1. Let $X_{1},\ldots ,X_{n}$ be independent random variables. Suppose, for $i = 1,\dots ,n$ , that $X_{i}$ has a $\Gamma (\alpha_i,\beta)$ distribution. Let $Y = \sum_{i = 1}^{n}X_{i}$ . Then $Y$ has a $\Gamma (\sum_{i = 1}^{n}\alpha_{i},\beta)$ distribution.

Proof: Using the assumed independence and the mgf of a gamma distribution, we have by Theorem 2.6.1 that for $t < 1 / \beta$ ,

$$
M _ {Y} (t) = \prod_ {i = 1} ^ {n} (1 - \beta t) ^ {- \alpha_ {i}} = (1 - \beta t) ^ {- \sum_ {i = 1} ^ {n} \alpha_ {i}},
$$

which is the mgf of a $\Gamma (\sum_{i = 1}^{n}\alpha_{i},\beta)$ distribution.

$\Gamma$ -distributions naturally occur in the Poisson process, also.

Remark 3.3.1 (Poisson Processes). For $t > 0$ , let $X_{t}$ denote the number of events of interest that occur in the interval $(0, t]$ . Assume $X_{t}$ satisfies the three assumptions of a Poisson process. Let $k$ be a fixed positive integer and define the continuous random variable $W_{k}$ to be the waiting time until the $k$ th event occurs. Then the range of $W_{k}$ is $(0, \infty)$ . Note that for $w > 0$ , $W_{k} > w$ if and only if $X_{w} \leq k - 1$ . Hence,

$$
P (W _ {k} > w) = P (X _ {w} \leq k - 1) = \sum_ {x = 0} ^ {k - 1} P (X _ {w} = x) = \sum_ {x = 0} ^ {k - 1} \frac {(\lambda w) ^ {x} e ^ {- \lambda w}}{x !}.
$$

In Exercise 3.3.5, the reader is asked to prove that

$$
\int_ {\lambda w} ^ {\infty} \frac {z ^ {k - 1} e ^ {- z}}{(k - 1) !} d z = \sum_ {x = 0} ^ {k - 1} \frac {(\lambda w) ^ {x} e ^ {- \lambda w}}{x !}.
$$

Accepting this result, we have, for $w > 0$ , that the cdf of $W_{k}$ satisfies

$$
F _ {W _ {k}} (w) = 1 - \int_ {\lambda w} ^ {\infty} \frac {z ^ {k - 1} e ^ {- z}}{\Gamma (k)} d z = \int_ {0} ^ {\lambda w} \frac {z ^ {k - 1} e ^ {- z}}{\Gamma (k)} d z,
$$

and for $w \leq 0$ , $F_{W_k}(w) = 0$ . If we change the variable of integration in the integral that defines $F_{W_k}(w)$ by writing $z = \lambda y$ , then

$$
F _ {W _ {k}} (w) = \int_ {0} ^ {w} \frac {\lambda^ {k} y ^ {k - 1} e ^ {- \lambda y}}{\Gamma (k)} d y, w > 0,
$$

and $F_{W_k}(w) = 0$ for $w \leq 0$ . Accordingly, the pdf of $W_k$ is

$$
f _ {W _ {k}} (w) = F _ {W} ^ {\prime} (w) = \left\{ \begin{array}{l l} \frac {\lambda^ {k} w ^ {k - 1} e ^ {- \lambda w}}{\Gamma (k)} & 0 <   w <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

That is, the waiting time until the $k$ th event, $W_{k}$ , has the gamma distribution with $\alpha = k$ and $\beta = 1 / \lambda$ . Let $T_{1}$ be the waiting time until the first event occurs, i.e., $k = 1$ . Then the pdf of $T_{1}$ is

$$
f _ {T _ {1}} (w) = \left\{ \begin{array}{l l} \lambda e ^ {- \lambda w} & 0 <   w <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.6}
$$

Hence, $T_{1}$ has the $\Gamma(1,1/\lambda)$ -distribution. The mean of $T_{1} = 1/\lambda$ , while the mean of $X_{1}$ is $\lambda$ . Thus, we expect $\lambda$ events to occur in a unit of time and we expect the first event to occur at time $1/\lambda$ .

Continuing in this way, for $i \geq 1$ , let $T_{i}$ denote the interarrival time of the $i$ th event; i.e., $T_{i}$ is the time between the occurrence of event $(i - 1)$ and event $i$ . As shown $T_{1}$ has the $\Gamma(1,1/\lambda)$ . Note that Axioms (1) and (2) of the Poisson process only depend on $\lambda$ and the length of the interval; in particular, they do not depend on the endpoints of the interval. Further, occurrences in nonoverlapping intervals are independent of one another. Hence, using the same reasoning as above, $T_{j}, j \geq 2$ , also has the $\Gamma(1,1/\lambda)$ -distribution. Furthermore, $T_{1}, T_{2}, T_{3}, \ldots$ are independent. Note the waiting time until the $k$ th event satisfies $W_{k} = T_{1} + \dots + T_{k}$ . Thus by Theorem 3.3.1, $W_{k}$ has a $\Gamma(k,1/\lambda)$ distribution, confirming the derivation above. Although this discussion has been intuitive, it can be made rigorous; see, for example, Parzen (1962).

# 3.3.1 The $\chi^2$ -Distribution

Let us now consider a special case of the gamma distribution in which $\alpha = r / 2$ , where $r$ is a positive integer, and $\beta = 2$ . A random variable $X$ of the continuous type that has the pdf

$$
f (x) = \left\{ \begin{array}{l l} \frac {1}{\Gamma \left(r / 2\right) 2 ^ {r / 2}} x ^ {r / 2 - 1} e ^ {- x / 2} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e ,} \end{array} \right. \tag {3.3.7}
$$

and the mgf

$$
M (t) = (1 - 2 t) ^ {- r / 2}, \quad t <   \frac {1}{2},
$$

is said to have a chi-square distribution ( $\chi^2$ -distribution), and any $f(x)$ of this form is called a chi-square pdf. The mean and the variance of a chi-square distribution are $\mu = \alpha \beta = (r/2)2 = r$ and $\sigma^2 = \alpha \beta^2 = (r/2)2^2 = 2r$ , respectively. We call the parameter $r$ the number of degrees of freedom of the chi-square distribution (or of the chi-square pdf). Because the chi-square distribution has an important role in statistics and occurs so frequently, we write, for brevity, that $X$ is $\chi^2(r)$ to mean that the random variable $X$ has a chi-square distribution with $r$ degrees of freedom. The R function pchisq(x,r) returns $P(X \leq x)$ and the command dchisq(x,r) returns the value of the pdf of $X$ at $x$ when $X$ has a chi-squared distribution with $r$ degrees of freedom.

Example 3.3.2. Suppose $X$ has a $\chi^2$ -distribution with 10 degrees of freedom. Then the mean of $X$ is 10 and its standard deviation is $\sqrt{20} = 4.47$ . Using R, its median and quartiles are qchisq(c(.25,.5,.75), 10) = (6.74, 9.34, 12.55). The following

command plots the density function over the interval $(0,24)$ :

$$
x = \operatorname {s e q} (0, 2 4,.. 1); \operatorname {p l o t} (\operatorname {d c h i s q} (x, 1 0) ^ {\sim} x).
$$

Compute this line of code and locate the mean, quartiles, and median of $X$ on the plot.

Example 3.3.3. The quantiles of the $\chi^2$ -distribution are frequently used in statistics. Before the advent of modern computation, tables of these quantiles were compiled. Table I in Appendix D offers a typical $\chi^2$ -table of the quantiles for the probabilities 0.01, 0.025, 0.05, 0.1, 0.9, 0.95, 0.975, 0.99 and degrees of freedom 1, 2, ..., 30. As discussed, the R function qchisq easily computes these quantiles. Actually, the following two lines of R code performs the computation of Table I.

$$
\begin{array}{l} \mathrm {r s} = 1: 3 0; \mathrm {p s} = \mathrm {c} (. 0 1,.. 0 2 5,.. 0 5,.. 1,.. 9,.. 9 5,.. 9 7 5,.. 9 9); \\ f o r (r \text {i n} r s) \{p r i n t (c (r, \text {r o u n d} (q c h i s q (p s, r), d i g i t s = 3))) \} \\ \end{array}
$$

Note that the code rounds the critical values to 3 places.

The following result is used several times in the sequel; hence, we record it as a theorem.

Theorem 3.3.2. Let $X$ have a $\chi^2(r)$ distribution. If $k > -r/2$ , then $E(X^k)$ exists and it is given by

$$
E \left(X ^ {k}\right) = \frac {2 ^ {k} \Gamma \left(\frac {r}{2} + k\right)}{\Gamma \left(\frac {r}{2}\right)}, \quad i f k > - r / 2. \tag {3.3.8}
$$

Proof: Note that

$$
E (X ^ {k}) = \int_ {0} ^ {\infty} \frac {1}{\Gamma \left(\frac {r}{2}\right) 2 ^ {r / 2}} x ^ {(r / 2) + k - 1} e ^ {- x / 2} d x.
$$

Make the change of variable $u = x / 2$ in the above integral. This results in

$$
E (X ^ {k}) = \int_ {0} ^ {\infty} \frac {1}{\Gamma \left(\frac {r}{2}\right) 2 ^ {(r / 2) - 1}} 2 ^ {(r / 2) + k - 1} u ^ {(r / 2) + k - 1} e ^ {- u} d u.
$$

This simplifies to the desired result provided that $k > -(r / 2)$ .

Notice that if $k$ is a nonnegative integer, then $k > -(r / 2)$ is always true. Hence, all moments of a $\chi^2$ distribution exist and the $k$ th moment is given by (3.3.8).

Example 3.3.4. Let $X$ have a gamma distribution with $\alpha = r / 2$ , where $r$ is a positive integer, and $\beta > 0$ . Define the random variable $Y = 2X / \beta$ . We seek the pdf of $Y$ . Now the mgf of $Y$ is

$$
\begin{array}{l} M _ {Y} (t) = E \left(e ^ {t Y}\right) = E \left[ e ^ {(2 t / \beta) X} \right] \\ = \left[ 1 - \frac {2 t}{\beta} \beta \right] ^ {- r / 2} = [ 1 - 2 t ] ^ {- r / 2}, \\ \end{array}
$$

which is the mgf of a $\chi^2$ -distribution with $r$ degrees of freedom. That is, $Y$ is $\chi^2(r)$ .

Because the $\chi^2$ -distributions are a subfamily of the $\Gamma$ -distributions, the additivity property for $\Gamma$ -distributions given by Theorem 3.3.1 holds for $\chi^2$ -distributions, also. Since we often make use of this property, we state it as a corollary for easy reference.

Corollary 3.3.1. Let $X_{1},\ldots ,X_{n}$ be independent random variables. Suppose, for $i = 1,\dots ,n$ , that $X_{i}$ has a $\chi^2 (r_i)$ distribution. Let $Y = \sum_{i = 1}^{n}X_{i}$ . Then $Y$ has a $\chi^2 (\sum_{i = 1}^{n}r_{i})$ distribution.

# 3.3.2 The $\beta$ -Distribution

As we have discussed, in terms of modeling, the $\Gamma$ -distributions offer a wide variety of shapes for skewed distributions with support $(0,\infty)$ . In the exercises and later chapters, we offer other such families of distributions. How about continuous distributions whose support is a bounded interval in $R$ ? For example suppose the support of $X$ is $(a,b)$ where $-\infty < a < b < \infty$ and $a$ and $b$ are known. Without loss of generality, for discussion, we can assume that $a = 0$ and $b = 1$ , since, if not, we could consider the random variable $Y = (X - a) / (b - a)$ . In this section, we discuss the $\beta$ -distribution whose family offers a wide variety of shapes for distributions with support on bounded intervals.

One way of defining the $\beta$ -family of distributions is to derive it from a pair of independent $\Gamma$ random variables. Let $X_{1}$ and $X_{2}$ be two independent random variables that have $\Gamma$ distributions and the joint pdf

$$
h (x _ {1}, x _ {2}) = \frac {1}{\Gamma (\alpha) \Gamma (\beta)} x _ {1} ^ {\alpha - 1} x _ {2} ^ {\beta - 1} e ^ {- x _ {1} - x _ {2}}, 0 <   x _ {1} <   \infty , 0 <   x _ {2} <   \infty ,
$$

zero elsewhere, where $\alpha > 0$ , $\beta > 0$ . Let $Y_{1} = X_{1} + X_{2}$ and $Y_{2} = X_{1} / (X_{1} + X_{2})$ . We next show that $Y_{1}$ and $Y_{2}$ are independent.

The space $\mathcal{S}$ is, exclusive of the points on the coordinate axes, the first quadrant of the $x_{1}, x_{2}$ -plane. Now

$$
y _ {1} = u _ {1} \left(x _ {1}, x _ {2}\right) = x _ {1} + x _ {2}
$$

$$
y _ {2} = u _ {2} (x _ {1}, x _ {2}) = \frac {x _ {1}}{x _ {1} + x _ {2}}
$$

may be written $x_{1} = y_{1}y_{2}$ , $x_{2} = y_{1}(1 - y_{2})$ , so

$$
J = \left| \begin{array}{c c} y _ {2} & y _ {1} \\ 1 - y _ {2} & - y _ {1} \end{array} \right| = - y _ {1} \not \equiv 0.
$$

The transformation is one-to-one, and it maps $S$ onto $\mathcal{T} = \{(y_1,y_2):0 < y_1 < \infty, 0 < y_2 < 1\}$ in the $y_{1}y_{2}$ -plane. The joint pdf of $Y_{1}$ and $Y_{2}$ on its support is

$$
\begin{array}{l} g (y _ {1}, y _ {2}) = (y _ {1}) \frac {1}{\Gamma (\alpha) \Gamma (\beta)} (y _ {1} y _ {2}) ^ {\alpha - 1} [ y _ {1} (1 - y _ {2}) ] ^ {\beta - 1} e ^ {- y _ {1}} \\ = \left\{ \begin{array}{l l} \frac {y _ {2} ^ {\alpha - 1} (1 - y _ {2}) ^ {\beta - 1}}{\Gamma (\alpha) \Gamma (\beta)} y _ {1} ^ {\alpha + \beta - 1} e ^ {- y _ {1}} & 0 <   y _ {1} <   \infty , \quad 0 <   y _ {2} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \\ \end{array}
$$

In accordance with Theorem 2.4.1 the random variables are independent. The marginal pdf of $Y_{2}$ is

$$
\begin{array}{l} {g _ {2} (y _ {2})} = {\frac {y _ {2} ^ {\alpha - 1} (1 - y _ {2}) ^ {\beta - 1}}{\Gamma (\alpha) \Gamma (\beta)} \int_ {0} ^ {\infty} y _ {1} ^ {\alpha + \beta - 1} e ^ {- y _ {1}} d y _ {1}} \\ = \left\{ \begin{array}{l l} \frac {\Gamma (\alpha + \beta)}{\Gamma (\alpha) \Gamma (\beta)} y _ {2} ^ {\alpha - 1} (1 - y _ {2}) ^ {\beta - 1} & 0 <   y _ {2} <   1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.9} \\ \end{array}
$$

This pdf is that of the beta distribution with parameters $\alpha$ and $\beta$ . Since $g(y_1, y_2) \equiv g_1(y_1)g_2(y_2)$ , it must be that the pdf of $Y_1$ is

$$
g _ {1} (y _ {1}) = \left\{ \begin{array}{l l} \frac {1}{\Gamma (\alpha + \beta)} y _ {1} ^ {\alpha + \beta - 1} e ^ {- y _ {1}} & 0 <   y _ {1} <   \infty \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

which is that of a gamma distribution with parameter values of $\alpha +\beta$ and 1.

It is an easy exercise to show that the mean and the variance of $Y_{2}$ , which has a beta distribution with parameters $\alpha$ and $\beta$ , are, respectively,

$$
\mu = \frac {\alpha}{\alpha + \beta}, \sigma^ {2} = \frac {\alpha \beta}{(\alpha + \beta + 1) (\alpha + \beta) ^ {2}}.
$$

The package R calculates probabilities for the beta distribution. If $X$ has a beta distribution with parameters $\alpha = a$ and $\beta = b$ , then the command pbeta(x,a,b) returns $P(X \leq x)$ and the command dbeta(x,a,b) returns the value of the pdf of $X$ at $x$ .

Example 3.3.5 (Shapes of $\beta$ -Distributions). The following 3 lines of R code<sup>5</sup>, will obtain a $4 \times 4$ page of plots of $\beta$ pdfs for all combinations of integer values of $\alpha$ and $\beta$ between 2 and 5. Those distributions on the main diagonal of the page of plots are symmetric, those below the main diagonal are left-skewed, and those above the main diagonal are right-skewed.

```javascript
par(mfrow=c(4,4));r1=2:5;r2=2:5;x=seq(.01,.99,.01) for(a in r1){for(b in r2){plot(dbeta(x,a,b)\~x); title(paste("alpha = ",a,"beta = ",b))}\} 
```

Note that if $\alpha = \beta = 1$ , then the $\beta$ -distribution is the uniform distribution with support $(0,1)$ .

We close this section with another example of a random variable whose distribution is derived from a transformation of gamma random variables.

Example 3.3.6 (Dirichlet Distribution). Let $X_{1}, X_{2}, \ldots, X_{k + 1}$ be independent random variables, each having a gamma distribution with $\beta = 1$ . The joint pdf of these variables may be written as

$$
h (x _ {1}, x _ {2}, \ldots , x _ {k + 1}) = \left\{ \begin{array}{l l} \prod_ {i = 1} ^ {k + 1} \frac {1}{\Gamma (\alpha_ {i})} x _ {i} ^ {\alpha_ {i} - 1} e ^ {- x _ {i}} & 0 <   x _ {i} <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Let

$$
Y _ {i} = \frac {X _ {i}}{X _ {1} + X _ {2} + \cdots + X _ {k + 1}}, \quad i = 1, 2, \ldots , k,
$$

and $Y_{k + 1} = X_1 + X_2 + \dots + X_{k + 1}$ denote $k + 1$ new random variables. The associated transformation maps $\mathcal{A} = \{(x_1, \ldots, x_{k + 1}) : 0 < x_i < \infty, i = 1, \ldots, k + 1\}$ onto the space:

$$
\mathcal {B} = \left\{\left(y _ {1}, \dots , y _ {k}, y _ {k + 1}\right): 0 <   y _ {i}, i = 1, \dots , k, y _ {1} + \dots + y _ {k} <   1, 0 <   y _ {k + 1} <   \infty \right\}.
$$

The single-valued inverse functions are $x_{1} = y_{1}y_{k + 1},\ldots ,x_{k} = y_{k}y_{k + 1},x_{k + 1} = y_{k + 1}(1 - y_1 - \dots -y_k)$ , so that the Jacobian is

$$
J = \left| \begin{array}{c c c c c} y _ {k + 1} & 0 & \dots & 0 & y _ {1} \\ 0 & y _ {k + 1} & \dots & 0 & y _ {2} \\ \vdots & \vdots & & \vdots & \vdots \\ 0 & 0 & \dots & y _ {k + 1} & y _ {k} \\ - y _ {k + 1} & - y _ {k + 1} & \dots & - y _ {k + 1} & (1 - y _ {1} - \dots - y _ {k}) \end{array} \right| = y _ {k + 1} ^ {k}.
$$

Hence the joint pdf of $Y_{1},\ldots ,Y_{k},Y_{k + 1}$ is given by

$$
\frac {y _ {k + 1} ^ {\alpha_ {1} + \cdots + \alpha_ {k + 1} - 1} y _ {1} ^ {\alpha_ {1} - 1} \cdots y _ {k} ^ {\alpha_ {k} - 1} (1 - y _ {1} - \cdots - y _ {k}) ^ {\alpha_ {k + 1} - 1} e ^ {- y _ {k + 1}}}{\Gamma (\alpha_ {1}) \cdots \Gamma (\alpha_ {k}) \Gamma (\alpha_ {k + 1})},
$$

provided that $(y_{1},\ldots ,y_{k},y_{k + 1})\in \mathcal{B}$ and is equal to zero elsewhere. By integrating out $y_{k + 1}$ , the joint pdf of $Y_{1},\ldots ,Y_{k}$ is seen to be

$$
g \left(y _ {1}, \dots , y _ {k}\right) = \frac {\Gamma \left(\alpha_ {1} + \cdots + \alpha_ {k + 1}\right)}{\Gamma \left(\alpha_ {1}\right) \cdots \Gamma \left(\alpha_ {k + 1}\right)} y _ {1} ^ {\alpha_ {1} - 1} \dots y _ {k} ^ {\alpha_ {k} - 1} \left(1 - y _ {1} - \dots - y _ {k}\right) ^ {\alpha_ {k + 1} - 1}, \tag {3.3.10}
$$

when $0 < y_{i}$ , $i = 1, \ldots, k$ , $y_{1} + \dots + y_{k} < 1$ , while the function $g$ is equal to zero elsewhere. Random variables $Y_{1}, \ldots, Y_{k}$ that have a joint pdf of this form are said to have a Dirichlet pdf. It is seen, in the special case of $k = 1$ , that the Dirichlet pdf becomes a beta pdf. Moreover, it is also clear from the joint pdf of $Y_{1}, \ldots, Y_{k}, Y_{k+1}$ that $Y_{k+1}$ has a gamma distribution with parameters $\alpha_{1} + \dots + \alpha_{k} + \alpha_{k+1}$ and $\beta = 1$ and that $Y_{k+1}$ is independent of $Y_{1}, Y_{2}, \ldots, Y_{k}$ .

# EXERCISES

3.3.1. Suppose $(1 - 2t)^{-6}$ , $t < \frac{1}{2}$ is the mgf of the random variable $X$ .

(a) Use R to compute $P(X < 5.23)$ .   
(b) Find the mean $\mu$ and variance $\sigma^2$ of $X$ . Use R to compute $P(|X - \mu| < 2\sigma)$ .

3.3.2. If $X$ is $\chi^2(5)$ , determine the constants $c$ and $d$ so that $P(c < X < d) = 0.95$ and $P(X < c) = 0.025$ .

3.3.3. Suppose the lifetime in months of an engine, working under hazardous conditions, has a $\Gamma$ distribution with a mean of 10 months and a variance of 20 months squared.

(a) Determine the median lifetime of an engine.   
(b) Suppose such an engine is termed successful if its lifetime exceeds 15 months. In a sample of 10 engines, determine the probability of at least 3 successful engines.

3.3.4. Let $X$ be a random variable such that $E(X^m) = (m + 1)!2^m$ , $m = 1, 2, 3, \ldots$ . Determine the mgf and the distribution of $X$ .

Hint: Write out the Taylor series of the mgf.

3.3.5. Show that

$$
\int_ {\mu} ^ {\infty} \frac {1}{\Gamma (k)} z ^ {k - 1} e ^ {- z} d z = \sum_ {x = 0} ^ {k - 1} \frac {\mu^ {x} e ^ {- \mu}}{x !}, k = 1, 2, 3, \dots .
$$

This demonstrates the relationship between the cdfs of the gamma and Poisson distributions.

Hint: Either integrate by parts $k - 1$ times or obtain the "antiderivative" by showing that

$$
\frac {d}{d z} \left[ - e ^ {- z} \sum_ {j = 0} ^ {k - 1} \frac {\Gamma (k)}{(k - j - 1) !} z ^ {k - j - 1} \right] = z ^ {k - 1} e ^ {- z}.
$$

3.3.6. Let $X_{1}$ , $X_{2}$ , and $X_{3}$ be iid random variables, each with pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere.

(a) Find the distribution of $Y = \mathrm{minimum}(X_1, X_2, X_3)$ .

$$
\text {H i n t :} P (Y \leq y) = 1 - P (Y > y) = 1 - P \left(X _ {i} > y, i = 1, 2, 3\right).
$$

(b) Find the distribution of $Y = \mathrm{maximum}(X_1, X_2, X_3)$ .

3.3.7. Let $X$ have a gamma distribution with pdf

$$
f (x) = \frac {1}{\beta^ {2}} x e ^ {- x / \beta}, 0 <   x <   \infty ,
$$

zero elsewhere. If $x = 2$ is the unique mode of the distribution, find the parameter $\beta$ and $P(X < 9.49)$ .

3.3.8. Compute the measures of skewness and kurtosis of a gamma distribution that has parameters $\alpha$ and $\beta$ .

3.3.9. Let $X$ have a gamma distribution with parameters $\alpha$ and $\beta$ . Show that $P(X \geq 2\alpha \beta) \leq (2 / e)^{\alpha}$ .

Hint: Use the result of Exercise 1.10.5.

3.3.10. Give a reasonable definition of a chi-square distribution with zero degrees of freedom.

Hint: Work with the mgf of a distribution that is $\chi^2 (r)$ and let $r = 0$

3.3.11. Using the computer, obtain plots of the pdfs of chi-squared distributions with degrees of freedom $r = 1,2,5,10,20$ . Comment on the plots.

3.3.12. Using the computer, plot the cdf of a $\Gamma(5,4)$ distribution and use it to guess the median. Confirm it with a computer command that returns the median [In R, use the command qgamma(.5, shape=5, scale=4)].

3.3.13. Using the computer, obtain plots of beta pdfs for $\alpha = 1,5,10$ and $\beta = 1,2,5,10,20$ .

3.3.14. In a warehouse of parts for a large mill, the average time between requests for parts is about 10 minutes.

(a) Find the probability that in an hour there will be at least 10 requests for parts.   
(b) Find the probability that the 10th request in the morning requires at least 2 hours of waiting time.

3.3.15. Let $X$ have a Poisson distribution with parameter $m$ . If $m$ is an experimental value of a random variable having a gamma distribution with $\alpha = 2$ and $\beta = 1$ , compute $P(X = 0, 1, 2)$ .   
Hint: Find an expression that represents the joint distribution of $X$ and $m$ . Then integrate out $m$ to find the marginal distribution of $X$ .   
3.3.16. Let $X$ have the uniform distribution with pdf $f(x) = 1$ , $0 < x < 1$ , zero elsewhere. Find the cdf of $Y = -2\log X$ . What is the pdf of $Y$ ?   
3.3.17. Find the uniform distribution of the continuous type on the interval $(b, c)$ that has the same mean and the same variance as those of a chi-square distribution with 8 degrees of freedom. That is, find $b$ and $c$ .   
3.3.18. Find the mean and variance of the $\beta$ distribution.

Hint: From the pdf, we know that

$$
\int_ {0} ^ {1} y ^ {\alpha - 1} (1 - y) ^ {\beta - 1} d y = \frac {\Gamma (\alpha) \Gamma (\beta)}{\Gamma (\alpha + \beta)}
$$

for all $\alpha > 0$ , $\beta > 0$ .

3.3.19. Determine the constant $c$ in each of the following so that each $f(x)$ is a $\beta$ pdf:

(a) $f(x) = cx(1 - x)^3$ $0 <   x <   1$ , zero elsewhere.   
(b) $f(x) = cx^4 (1 - x)^5$ , $0 < x < 1$ , zero elsewhere.   
(c) $f(x) = cx^{2}(1 - x)^{8}$ , $0 < x < 1$ , zero elsewhere.

3.3.20. Determine the constant $c$ so that $f(x) = cx(3 - x)^4$ , $0 < x < 3$ , zero elsewhere, is a pdf.

3.3.21. Show that the graph of the $\beta$ pdf is symmetric about the vertical line through $x = \frac{1}{2}$ if $\alpha = \beta$ .

3.3.22. Show, for $k = 1,2,\ldots ,n$ , that

$$
\int_ {p} ^ {1} \frac {n !}{(k - 1) ! (n - k) !} z ^ {k - 1} (1 - z) ^ {n - k} d z = \sum_ {x = 0} ^ {k - 1} {\binom {n} {x}} p ^ {x} (1 - p) ^ {n - x}.
$$

This demonstrates the relationship between the cdfs of the $\beta$ and binomial distributions.

3.3.23. Let $X_{1}$ and $X_{2}$ be independent random variables. Let $X_{1}$ and $Y = X_{1} + X_{2}$ have chi-square distributions with $r_{1}$ and $r$ degrees of freedom, respectively. Here $r_{1} < r$ . Show that $X_{2}$ has a chi-square distribution with $r - r_{1}$ degrees of freedom. Hint: Write $M(t) = E(e^{t(X_1 + X_2)})$ and make use of the independence of $X_{1}$ and $X_{2}$ .

3.3.24. Let $X_{1}, X_{2}$ be two independent random variables having gamma distributions with parameters $\alpha_{1} = 3$ , $\beta_{1} = 3$ and $\alpha_{2} = 5$ , $\beta_{2} = 1$ , respectively.

(a) Find the mgf of $Y = 2X_{1} + 6X_{2}$ .   
(b) What is the distribution of $Y$ ?

3.3.25. Let $X$ have an exponential distribution.

(a) For $x > 0$ and $y > 0$ , show that

$$
P (X > x + y \mid X > x) = P (X > y). \tag {3.3.11}
$$

Hence, the exponential distribution has the memoryless property. Recall from Exercise 3.1.9 that the discrete geometric distribution has a similar property.

(b) Let $F(x)$ be the cdf of a continuous random variable $Y$ . Assume that $F(0) = 0$ and $0 < F(y) < 1$ for $y > 0$ . Suppose property (3.3.11) holds for $Y$ . Show that $F_{Y}(y) = 1 - e^{-\lambda y}$ for $y > 0$ .

Hint: Show that $g(y) = 1 - F_{Y}(y)$ satisfies the equation

$$
g (y + z) = g (y) g (z),
$$

3.3.26. Let $X$ denote time until failure of a device and let $r(x)$ denote the hazard function of $X$ .

(a) If $r(x) = cx^b$ ; where $c$ and $b$ are positive constants, show that $X$ has a Weibull distribution; i.e.,

$$
f (x) = \left\{ \begin{array}{l l} c x ^ {b} \exp \left\{- \frac {c x ^ {b + 1}}{b + 1} \right\} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.12}
$$

(b) If $r(x) = ce^{bx}$ , where $c$ and $b$ are positive constants, show that $X$ has a Gompertz cdf given by

$$
F (x) = \left\{ \begin{array}{l l} 1 - \exp \left\{\frac {c}{b} \left(1 - e ^ {b x}\right) \right\} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.13}
$$

This is frequently used by actuaries as a distribution of the length of human life.

(c) If $r(x) = bx$ , linear hazard rate, show that the pdf of $X$ is

$$
f (x) = \left\{ \begin{array}{l l} b x e ^ {- b x ^ {2} / 2} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.3.14}
$$

This pdf is called the Rayleigh pdf.

3.3.27. Write an R function that returns the value $f(x)$ for a specified $x$ when $f(x)$ is the Weibull pdf given in expression (3.3.12). Next write an R function that returns the associated hazard function $r(x)$ . Obtain side-by-side plots of the pdf and hazard function for the three cases: $c = 5$ and $b = 0.5$ ; $c = 5$ and $b = 1.0$ ; and $c = 5$ and $b = 1.5$ .

3.3.28. In Example 3.3.5, a page of plots of $\beta$ pdfs was discussed. All of these pdfs are mound shaped. Obtain a page of plots for all combinations of $\alpha$ and $\beta$ drawn from the set $\{ .25, .75, 1, 1.25 \}$ . Comment on these shapes.

3.3.29. Let $Y_{1},\ldots ,Y_{k}$ have a Dirichlet distribution with parameters $\alpha_{1},\dots,\alpha_{k},\alpha_{k + 1}$ .

(a) Show that $Y_{1}$ has a beta distribution with parameters $\alpha = \alpha_{1}$ and $\beta = \alpha_{2} + \dots + \alpha_{k+1}$ .   
(b) Show that $Y_{1} + \dots + Y_{r}$ , $r \leq k$ , has a beta distribution with parameters $\alpha = \alpha_{1} + \dots + \alpha_{r}$ and $\beta = \alpha_{r+1} + \dots + \alpha_{k+1}$ .   
(c) Show that $Y_{1} + Y_{2}, Y_{3} + Y_{4}, Y_{5}, \ldots, Y_{k}, k \geq 5$ , have a Dirichlet distribution with parameters $\alpha_{1} + \alpha_{2}, \alpha_{3} + \alpha_{4}, \alpha_{5}, \ldots, \alpha_{k}, \alpha_{k+1}$ .

Hint: Recall the definition of $Y_{i}$ in Example 3.3.6 and use the fact that the sum of several independent gamma variables with $\beta = 1$ is a gamma variable.

# 3.4 The Normal Distribution

Motivation for the normal distribution is found in the Central Limit Theorem, which is presented in Section 5.3. This theorem shows that normal distributions provide an important family of distributions for applications and for statistical inference, in general. We proceed by first introducing the standard normal distribution and through it the general normal distribution.

Consider the integral

$$
I = \int_ {- \infty} ^ {\infty} \frac {1}{\sqrt {2 \pi}} \exp \left(\frac {- z ^ {2}}{2}\right) d z. \tag {3.4.1}
$$

This integral exists because the integrand is a positive continuous function that is bounded by an integrable function; that is,

$$
0 <   \exp \left(\frac {- z ^ {2}}{2}\right) <   \exp (- | z | + 1), - \infty <   z <   \infty ,
$$

and

$$
\int_ {- \infty} ^ {\infty} \exp (- | z | + 1) d z = 2 e.
$$

To evaluate the integral $I$ , we note that $I > 0$ and that $I^2$ may be written

$$
I ^ {2} = \frac {1}{2 \pi} \int_ {- \infty} ^ {\infty} \int_ {- \infty} ^ {\infty} \exp \left(- \frac {z ^ {2} + w ^ {2}}{2}\right) d z d w.
$$

This iterated integral can be evaluated by changing to polar coordinates. If we set $z = r\cos \theta$ and $w = r\sin \theta$ , we have

$$
\begin{array}{l} I ^ {2} = \frac {1}{2 \pi} \int_ {0} ^ {2 \pi} \int_ {0} ^ {\infty} e ^ {- r ^ {2} / 2} r d r d \theta \\ = \frac {1}{2 \pi} \int_ {0} ^ {2 \pi} d \theta = 1. \\ \end{array}
$$

Because the integrand of display (3.4.1) is positive on $R$ and integrates to 1 over $R$ , it is a pdf of a continuous random variable with support $R$ . We denote this random variable by $Z$ . In summary, $Z$ has the pdf

$$
f (z) = \frac {1}{\sqrt {2 \pi}} \exp \left(\frac {- z ^ {2}}{2}\right), - \infty <   z <   \infty . \tag {3.4.2}
$$

For $t \in R$ , the mgf of $Z$ can be derived by a completion of a square as follows:

$$
\begin{array}{l} E [ \exp \{t Z \} ] = \int_ {- \infty} ^ {\infty} \exp \{t z \} \frac {1}{\sqrt {2 \pi}} \exp \left\{- \frac {1}{2} z ^ {2} \right\} d z \\ = \exp \left\{\frac {1}{2} t ^ {2} \right\} \int_ {- \infty} ^ {\infty} \frac {1}{\sqrt {2 \pi}} \exp \left\{- \frac {1}{2} (z - t) ^ {2} \right\} d z \\ = \exp \left\{\frac {1}{2} t ^ {2} \right\} \int_ {- \infty} ^ {\infty} \frac {1}{\sqrt {2 \pi}} \exp \left\{- \frac {1}{2} w ^ {2} \right\} d w, \tag {3.4.3} \\ \end{array}
$$

where for the last integral we made the one-to-one change of variable $w = z - t$ . By the identity (3.4.2), the integral in expression (3.4.3) has value 1. Thus the mgf of $Z$ is

$$
M _ {Z} (t) = \exp \left\{\frac {1}{2} t ^ {2} \right\}, \quad \text {f o r} - \infty <   t <   \infty . \tag {3.4.4}
$$

The first two derivatives of $M_Z(t)$ are easily shown to be

$$
\begin{array}{l} M _ {Z} ^ {\prime} (t) = t \exp \left\{\frac {1}{2} t ^ {2} \right\} \\ M _ {Z} ^ {\prime \prime} (t) = \exp \left\{\frac {1}{2} t ^ {2} \right\} + t ^ {2} \exp \left\{\frac {1}{2} t ^ {2} \right\}. \\ \end{array}
$$

Upon evaluating these derivatives at $t = 0$ , the mean and variance of $Z$ are

$$
E (Z) = 0 \text {a n d} \operatorname {V a r} (Z) = 1. \tag {3.4.5}
$$

Next, define the continuous random variable $X$ by

$$
X = b Z + a,
$$

for $b > 0$ . This is a one-to-one transformation. To derive the pdf of $X$ , note that the inverse of the transformation and the Jacobian are $z = b^{-1}(x - a)$ and $J = b^{-1}$ , respectively. Because $b > 0$ , it follows from (3.4.2) that the pdf of $X$ is

$$
f _ {X} (x) = \frac {1}{\sqrt {2 \pi b}} \exp \left\{- \frac {1}{2} \left(\frac {x - a}{b}\right) ^ {2} \right\}, - \infty <   x <   \infty .
$$

By (3.4.5), we immediately have $E(X) = a$ and $\operatorname{Var}(X) = b^2$ . Hence, in the expression for the pdf of $X$ , we can replace $a$ by $\mu = E(X)$ and $b^2$ by $\sigma^2 = \operatorname{Var}(X)$ . We make this formal in the following:

Definition 3.4.1 (Normal Distribution). We say a random variable $X$ has a normal distribution if its pdf is

$$
f (x) = \frac {1}{\sqrt {2 \pi} \sigma} \exp \left\{- \frac {1}{2} \left(\frac {x - \mu}{\sigma}\right) ^ {2} \right\}, \quad f o r - \infty <   x <   \infty . \tag {3.4.6}
$$

The parameters $\mu$ and $\sigma^2$ are the mean and variance of $X$ , respectively. We often write that $X$ has a $N(\mu, \sigma^2)$ distribution.

In this notation, the random variable $Z$ with pdf (3.4.2) has a $N(0,1)$ distribution. We call $Z$ a standard normal random variable.

For the mgf of $X$ , use the relationship $X = \sigma Z + \mu$ and the mgf for $Z$ , (3.4.4), to obtain

$$
\begin{array}{l} E \left[ \exp \{t X \} \right] = E \left[ \exp \{t (\sigma Z + \mu) \} \right] = \exp \{\mu t \} E \left[ \exp \{t \sigma Z \} \right] \\ = \exp \left\{\mu t \right\} \exp \left\{\frac {1}{2} \sigma^ {2} t ^ {2} \right\} = \exp \left\{\mu t + \frac {1}{2} \sigma^ {2} t ^ {2} \right\}, \tag {3.4.7} \\ \end{array}
$$

for $-\infty <  t <   \infty$

We summarize the above discussion, by noting the relationship between $Z$ and $X$ :

$X$ has a $N(\mu, \sigma^2)$ distribution if and only if $Z = \frac{X - \mu}{\sigma}$ has a $N(0,1)$ distribution. (3.4.8)

Let $X$ have a $N(\mu, \sigma^2)$ distribution. The graph of the pdf of $X$ is seen in Figure 3.4.1 to have the following characteristics: (1) symmetry about a vertical axis through $x = \mu$ ; (2) having its maximum of $1 / (\sigma \sqrt{2\pi})$ at $x = \mu$ ; and (3) having the $x$ -axis as a horizontal asymptote. It should also be verified that (4) there are

![](images/2bde8b7a3271d2242f0cd72d1b05e6646f0756cf49622a891f7e2bbe77f63c7e.jpg)  
Figure 3.4.1: The normal density $f(x)$ , (3.4.6).

points of inflection at $x = \mu \pm \sigma$ ; see Exercise 3.4.7. By the symmetry about $\mu$ , it follows that the median of a normal distribution is equal to its mean.

If we want to determine $P(X \leq x)$ , then the following integration is required:

$$
P (X \leq x) = \int_ {- \infty} ^ {x} \frac {1}{\sqrt {2 \pi} \sigma} e ^ {- (t - \mu) ^ {2} / (2 \sigma^ {2})} d t.
$$

From calculus we know that the integrand does not have an antiderivative; hence, the integration must be carried out by numerical integration procedures. The R software uses such a procedure for its function $\mathsf{pnorm}$ . If $X$ has a $N(\mu, \sigma^2)$ distribution, then the R call $\mathsf{pnorm}(x, \mu, \sigma)$ computes $P(X \leq x)$ , while $\mathsf{q} = \mathsf{qnorm}(p, \mu, \sigma)$ gives the $p$ th quantile of $X$ ; i.e., $q$ solves the equation $P(X \leq q) = p$ . We illustrate this computation in the next example.

Example 3.4.1. Suppose the height in inches of an adult male is normally distributed with mean $\mu = 70$ inches and standard deviation $\sigma = 4$ inches. As a graph of the pdf of $X$ use Figure 3.4.1 replacing $\mu$ by 70 and $\sigma$ by 4. Suppose we want to compute the probability that a man exceeds six feet (72 inches) in height. Locate 72 on the figure. The desired probability is the area under the curve over the interval $(72, \infty)$ which is computed in R by 1-pnorm(72,70,4) = 0.3085; hence, $31\%$ of males exceed six feet in height. The 95th percentile in height is qnorm(0.95,70,4) = 76.6 inches. What percentage of males have heights within one standard deviation of the mean? Answer: pnorm(74,70,4) - pnorm(66,70,4) = 0.6827.

Before the age of modern computing tables of probabilities for normal distributions were formulated. Due to the fact (3.4.8), only tables for the standard normal distribution are required. Let $Z$ have the standard normal distribution. A graph of

its pdf is displayed in Figure 3.4.2. Common notation for the cdf of $Z$ is

$$
P (Z \leq z) = \Phi (z) = \mathrm {d f n} \int_ {0} ^ {z} \frac {1}{\sqrt {2 \pi}} e ^ {- t ^ {2} / 2} d t, - \infty <   z <   \infty . \tag {3.4.9}
$$

Table II of Appendix D displays a table for $\Phi(z)$ for specified values of $z > 0$ . To compute $\Phi(-z)$ , where $z > 0$ , use the identity

$$
\Phi (- z) = 1 - \Phi (z). \tag {3.4.10}
$$

This identity follows because the pdf of $Z$ is symmetric about 0. It is apparent in Figure 3.4.2 and the reader is asked to show it in Exercise 3.4.1.

![](images/718486305150e65d0d115cd3752b231ad23a363df586a88e7a6c6904d1a71900.jpg)  
Figure 3.4.2: The standard normal density: $p = \Phi(z_p)$ is the area under the curve to the left of $z_p$ .

As an illustration of the use of Table II, suppose in Example 3.4.1 that we want to determine the probability that the height of an adult male is between 67 and 71 inches. This is calculated as

$$
\begin{array}{l} P (6 7 <   X <   7 1) = P (X <   7 1) - P (X <   6 7) \\ = P \left(\frac {X - 7 0}{4} <   \frac {7 1 - 7 0}{4}\right) - P \left(\frac {X - 7 0}{4} <   \frac {6 7 - 7 0}{4}\right) \\ = P (Z <   0. 2 5) - P (Z <   - 0. 7 5) = \Phi (0. 2 5) - 1 + \Phi (0. 7 5) \\ = 0. 5 9 8 7 - 1 + 0. 7 7 3 4 = 0. 3 7 2 1 (3.4.11) \\ = \operatorname {p n o r m} (7 1, 7 0, 4) - \operatorname {p n o r m} (6 7, 7 0, 4) = 0. 3 7 2 0 7 9. (3.4.12) \\ \end{array}
$$

Expression (3.4.11) is the calculation by using Table II, while the last line is the calculation by using the R function pnorm. More examples are offered in the exercises. As a final note on Table II, it is generated by the R function:

```r
normtab <- function() { za <- seq(0.00, 3.59, .01); pz <- t(column(round(pnorm(za), digits=4), nrow=10)) colnames(pz) <- seq(0, .09, .01) rownames(pz) <- seq(0.0, 3.5, .1); return(pz)} 
```

The function normtab can be downloaded at the site mentioned in the Preface.

Example 3.4.2 (Empirical Rule). Let $X$ be $N(\mu, \sigma^2)$ . Then, by Table II or R,

$$
\begin{array}{l} P (\mu - 2 \sigma <   X <   \mu + 2 \sigma) = \Phi \left(\frac {\mu + 2 \sigma - \mu}{\sigma}\right) - \Phi \left(\frac {\mu - 2 \sigma - \mu}{\sigma}\right) \\ = \Phi (2) - \Phi (- 2) \\ = 0. 9 7 7 - (1 - 0. 9 7 7) = 0. 9 5 4. \\ \end{array}
$$

Similarly, $P(\mu - \sigma < X < \mu + \sigma) = 0.6827$ and $P(\mu - 3\sigma < X < \mu + 3\sigma) = 0.9973$ . Sometimes these three intervals and their corresponding probabilities are referred to as the empirical rule. Note that we can use Chebyshev's Theorem (Theorem 1.10.3), to obtain lower bounds for these probabilities. While the empirical rule is much more precise, it also requires the assumption of a normal distribution. On the other hand, Chebyshev's theorem requires only the assumption of a finite variance.

Example 3.4.3. Suppose that $10\%$ of the probability for a certain distribution that is $N(\mu, \sigma^2)$ is below 60 and that $5\%$ is above 90. What are the values of $\mu$ and $\sigma$ ? We are given that the random variable $X$ is $N(\mu, \sigma^2)$ and that $P(X \leq 60) = 0.10$ and $P(X \leq 90) = 0.95$ . Thus $\Phi[(60 - \mu) / \sigma] = 0.10$ and $\Phi[(90 - \mu) / \sigma] = 0.95$ . From Table II we have

$$
\frac {6 0 - \mu}{\sigma} = - 1. 2 8, \quad \frac {9 0 - \mu}{\sigma} = 1. 6 4.
$$

These conditions require that $\mu = 73.1$ and $\sigma = 10.2$ approximately.

Remark 3.4.1. In this chapter we have illustrated three types of parameters associated with distributions. The mean $\mu$ of $N(\mu, \sigma^2)$ is called a location parameter because changing its value simply changes the location of the middle of the normal pdf; that is, the graph of the pdf looks exactly the same except for a shift in location. The standard deviation $\sigma$ of $N(\mu, \sigma^2)$ is called a scale parameter because changing its value changes the spread of the distribution. That is, a small value of $\sigma$ requires the graph of the normal pdf to be tall and narrow, while a large value of $\sigma$ requires it to spread out and not be so tall. No matter what the values of $\mu$ and $\sigma$ , however, the graph of the normal pdf is that familiar "bell shape." Incidentally, the $\beta$ of the gamma distribution is also a scale parameter. On the other hand, the $\alpha$ of the gamma distribution is called a shape parameter, as changing its value modifies the shape of the graph of the pdf, as can be seen by referring to Figure 3.3.1. The parameters $p$ and $\mu$ of the binomial and Poisson distributions, respectively, are also shape parameters.

Continuing with the first part of Remark 3.4.1, if $X$ is $N(\mu, \sigma^2)$ then we say that $X$ follows the location model which we write as

$$
X = \mu + e, \tag {3.4.13}
$$

where $e$ is a random variable (often called random error) with a $N(0, \sigma^2)$ distribution. Conversely, it follows immediately that if $X$ satisfies expression (3.4.13) with $e$ distributed $N(0, \sigma^2)$ then $X$ has a $N(\mu, \sigma^2)$ distribution.

We close this part of the section with three important results.

Example 3.4.4 (All the Moments of a Normal Distribution). Recall that in Example 1.9.7, we derived all the moments of a standard normal random variable by using its moment generating function. We can use this to obtain all the moments of $X$ , where $X$ has a $N(\mu, \sigma^2)$ distribution. From expression (3.4.13), we can write $X = \sigma Z + \mu$ , where $Z$ has a $N(0,1)$ distribution. Hence, for all nonnegative integers $k$ a simple application of the binomial theorem yields

$$
E \left(X ^ {k}\right) = E \left[ (\sigma Z + \mu) ^ {k} \right] = \sum_ {j = 0} ^ {k} \binom {k} {j} \sigma^ {j} E \left(Z ^ {j}\right) \mu^ {k - j}. \tag {3.4.14}
$$

Recall from Example 1.9.7 that all the odd moments of $Z$ are 0, while all the even moments are given by expression (1.9.3). These can be substituted into expression (3.4.14) to derive the moments of $X$ .

Theorem 3.4.1. If the random variable $X$ is $N(\mu, \sigma^2)$ , $\sigma^2 > 0$ , then the random variable $V = (X - \mu)^2 / \sigma^2$ is $\chi^2(1)$ .

Proof. Because $V = W^2$ , where $W = (X - \mu) / \sigma$ is $N(0,1)$ , the cdf $G(v)$ for $V$ is, for $v \geq 0$ ,

$$
G (v) = P \left(W ^ {2} \leq v\right) = P (- \sqrt {v} \leq W \leq \sqrt {v}).
$$

That is,

$$
G (v) = 2 \int_ {0} ^ {\sqrt {v}} \frac {1}{\sqrt {2 \pi}} e ^ {- w ^ {2} / 2} d w, \quad 0 \leq v,
$$

and

$$
G (v) = 0, \quad v <   0.
$$

If we change the variable of integration by writing $w = \sqrt{y}$ , then

$$
G (v) = \int_ {0} ^ {v} \frac {1}{\sqrt {2 \pi} \sqrt {y}} e ^ {- y / 2} d y, \quad 0 \leq v.
$$

Hence the pdf $g(v) = G'(v)$ of the continuous-type random variable $V$ is

$$
g (v) = \left\{ \begin{array}{l l} \frac {1}{\sqrt {\pi \sqrt {2}}} v ^ {1 / 2 - 1} e ^ {- v / 2} & 0 <   v <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Since $g(v)$ is a pdf

$$
\int_ {0} ^ {\infty} g (v) d v = 1;
$$

hence, it must be that $\Gamma (\frac{1}{2}) = \sqrt{\pi}$ and thus $V$ is $\chi^2 (1)$ .

One of the most important properties of the normal distribution is its additivity under independence.

Theorem 3.4.2. Let $X_{1},\ldots ,X_{n}$ be independent random variables such that, for $i = 1,\dots ,n$ $X_{i}$ has a $N(\mu_i,\sigma_i^2)$ distribution. Let $Y = \sum_{i = 1}^{n}a_{i}X_{i}$ , where $a_1,\ldots ,a_n$ are constants. Then the distribution of $Y$ is $N(\sum_{i = 1}^{n}a_{i}\mu_{i},\sum_{i = 1}^{n}a_{i}^{2}\sigma_{i}^{2})$ .

Proof: By Theorem 2.6.1, for $t \in R$ , the mgf of $Y$ is

$$
\begin{array}{l} M _ {Y} (t) = \prod_ {i = 1} ^ {n} \exp \left\{t a _ {i} \mu_ {i} + (1 / 2) t ^ {2} a _ {i} ^ {2} \sigma_ {i} ^ {2} \right\} \\ = \exp \left\{t \sum_ {i = 1} ^ {n} a _ {i} \mu_ {i} + (1 / 2) t ^ {2} \sum_ {i = 1} ^ {n} a _ {i} ^ {2} \sigma_ {i} ^ {2} \right\}, \\ \end{array}
$$

which is the mgf of a $N(\sum_{i=1}^{n}a_{i}\mu_{i},\sum_{i=1}^{n}a_{i}^{2}\sigma_{i}^{2})$ distribution.

A simple corollary to this result gives the distribution of the sample mean $\overline{X} = n^{-1}\sum_{i=1}^{n} X_i$ when $X_1, X_2, \ldots, X_n$ represents a random sample from a $N(\mu, \sigma^2)$ .

Corollary 3.4.1. Let $X_{1},\ldots ,X_{n}$ be iid random variables with a common $N(\mu ,\sigma^2)$ distribution. Let $\overline{X} = n^{-1}\sum_{i = 1}^{n}X_{i}$ . Then $\overline{X}$ has a $N(\mu ,\sigma^2 /n)$ distribution.

To prove this corollary, simply take $a_i = (1/n)$ , $\mu_i = \mu$ , and $\sigma_i^2 = \sigma^2$ , for $i = 1, 2, \ldots, n$ , in Theorem 3.4.2.

# 3.4.1 *Contaminated Normals

We next discuss a random variable whose distribution is a mixture of normals. As with the normal, we begin with a standardized random variable.

Suppose we are observing a random variable that most of the time follows a standard normal distribution but occasionally follows a normal distribution with a larger variance. In applications, we might say that most of the data are "good" but that there are occasional outliers. To make this precise let $Z$ have a $N(0,1)$ distribution; let $I_{1 - \epsilon}$ be a discrete random variable defined by

$$
I _ {1 - \epsilon} = \left\{ \begin{array}{l l} 1 & \text {w i t h p r o b a b i l i t y} 1 - \epsilon \\ 0 & \text {w i t h p r o b a b i l i t y} \epsilon , \end{array} \right.
$$

and assume that $Z$ and $I_{1 - \epsilon}$ are independent. Let $W = ZI_{1 - \epsilon} + \sigma_cZ(1 - I_{1 - \epsilon})$ . Then $W$ is the random variable of interest.

The independence of $Z$ and $I_{1 - \epsilon}$ imply that the cdf of $W$ is

$$
\begin{array}{l} F _ {W} (w) = P [ W \leq w ] = P [ W \leq w, I _ {1 - \epsilon} = 1 ] + P [ W \leq w, I _ {1 - \epsilon} = 0 ] \\ = P [ W \leq w \mid I _ {1 - \epsilon} = 1 ] P [ I _ {1 - \epsilon} = 1 ] \\ + P \left[ W \leq w \mid I _ {1 - \epsilon} = 0 \right] P \left[ I _ {1 - \epsilon} = 0 \right] \\ = P [ Z \leq w ] (1 - \epsilon) + P [ Z \leq w / \sigma_ {c} ] \epsilon . \\ = \Phi (w) (1 - \epsilon) + \Phi (w / \sigma_ {c}) \epsilon \tag {3.4.15} \\ \end{array}
$$

Therefore, we have shown that the distribution of $W$ is a mixture of normals. Further, because $W = ZI_{1 - \epsilon} + \sigma_cZ(1 - I_{1 - \epsilon})$ , we have

$$
E (W) = 0 \text {a n d} \operatorname {V a r} (W) = 1 + \epsilon \left(\sigma_ {c} ^ {2} - 1\right); \tag {3.4.16}
$$

see Exercise 3.4.24. Upon differentiating (3.4.15), the pdf of $W$ is

$$
f _ {W} (w) = \phi (w) (1 - \epsilon) + \phi \left(w / \sigma_ {c}\right) \frac {\epsilon}{\sigma_ {c}}, \tag {3.4.17}
$$

where $\phi$ is the pdf of a standard normal.

Suppose, in general, that the random variable of interest is $X = a + bW$ , where $b > 0$ . Based on (3.4.16), the mean and variance of $X$ are

$$
E (X) = a \text {a n d} \operatorname {V a r} (X) = b ^ {2} \left(1 + \epsilon \left(\sigma_ {c} ^ {2} - 1\right)\right). \tag {3.4.18}
$$

From expression (3.4.15), the cdf of $X$ is

$$
F _ {X} (x) = \Phi \left(\frac {x - a}{b}\right) (1 - \epsilon) + \Phi \left(\frac {x - a}{b \sigma_ {c}}\right) \epsilon , \tag {3.4.19}
$$

which is a mixture of normal cdfs.

Based on expression (3.4.19) it is easy to obtain probabilities for contaminated normal distributions using R. For example, suppose, as above, $W$ has cdf (3.4.15). Then $P(W \leq w)$ is obtained by the R command $(1 - \mathrm{eps}) * \mathrm{pnorm}(\mathsf{w}) + \mathrm{eps} * \mathrm{pnorm}(\mathsf{w} / \mathrm{sigc})$ , where $\mathrm{eps}$ and $\mathrm{sigc}$ denote $\epsilon$ and $\sigma_c$ , respectively. Similarly, the pdf of $W$ at $w$ is returned by $(1 - \mathrm{eps}) * \mathrm{dnorm}(\mathsf{w}) + \mathrm{eps} * \mathrm{dnorm}(\mathsf{w} / \mathrm{sigc}) / \mathrm{sigc}$ . The functions $\mathrm{pcn}$ and $\mathrm{dcn}^7$ compute the cdf and pdf of the contaminated normal, respectively. In Section 3.7, we explore mixture distributions in general.

# EXERCISES

3.4.1. If

$$
\Phi (z) = \int_ {- \infty} ^ {z} \frac {1}{\sqrt {2 \pi}} e ^ {- w ^ {2} / 2} d w,
$$

show that $\Phi (-z) = 1 - \Phi (z)$

3.4.2. If $X$ is $N(75, 100)$ , find $P(X < 60)$ and $P(70 < X < 100)$ by using either Table II or the R command pnorm.

3.4.3. If $X$ is $N(\mu, \sigma^2)$ , find $b$ so that $P[-b < (X - \mu) / \sigma < b] = 0.90$ , by using either Table II of Appendix D or the R command qnorm.

3.4.4. Let $X$ be $N(\mu, \sigma^2)$ so that $P(X < 89) = 0.90$ and $P(X < 94) = 0.95$ . Find $\mu$ and $\sigma^2$ .

3.4.5. Show that the constant $c$ can be selected so that $f(x) = c2^{-x^2}$ , $-\infty < x < \infty$ , satisfies the conditions of a normal pdf.

Hint: Write $2 = e^{\log 2}$ .

3.4.6. If $X$ is $N(\mu, \sigma^2)$ , show that $E(|X - \mu|) = \sigma \sqrt{2/\pi}$ .

3.4.7. Show that the graph of a pdf $N(\mu, \sigma^2)$ has points of inflection at $x = \mu - \sigma$ and $x = \mu + \sigma$ .

3.4.8. Evaluate $\int_2^3\exp [-2(x - 3)^2 ]dx$

3.4.9. Determine the 90th percentile of the distribution, which is $N(65,25)$ .

3.4.10. If $e^{3t + 8t^2}$ is the mgf of the random variable $X$ , find $P(-1 < X < 9)$ .

3.4.11. Let the random variable $X$ have the pdf

$$
f (x) = \frac {2}{\sqrt {2 \pi}} e ^ {- x ^ {2} / 2}, \quad 0 <   x <   \infty , \quad \text {z e r o e l s e w h e r e}.
$$

(a) Find the mean and the variance of $X$   
(b) Find the cdf and hazard function of $X$

Hint for (a): Compute $E(X)$ directly and $E(X^2)$ by comparing the integral with the integral representing the variance of a random variable that is $N(0,1)$ .

3.4.12. Let $X$ be $N(5, 10)$ . Find $P[0.04 < (X - 5)^2 < 38.4]$ .   
3.4.13. If $X$ is $N(1, 4)$ , compute the probability $P(1 < X^2 < 9)$ .   
3.4.14. If $X$ is $N(75,25)$ , find the conditional probability that $X$ is greater than 80 given that $X$ is greater than 77. See Exercise 2.3.12.   
3.4.15. Let $X$ be a random variable such that $E(X^{2m}) = (2m)! / (2^m m!)$ , $m = 1, 2, 3, \ldots$ and $E(X^{2m-1}) = 0$ , $m = 1, 2, 3, \ldots$ . Find the mgf and the pdf of $X$ .   
3.4.16. Let the mutually independent random variables $X_{1}$ , $X_{2}$ , and $X_{3}$ be $N(0,1)$ , $N(2,4)$ , and $N(-1,1)$ , respectively. Compute the probability that exactly two of these three variables are less than zero.   
3.4.17. Compute the measures of skewness and kurtosis of a distribution which is $N(\mu, \sigma^2)$ . See Exercises 1.9.14 and 1.9.15 for the definitions of skewness and kurtosis, respectively.   
3.4.18. Let the random variable $X$ have a distribution that is $N(\mu, \sigma^2)$ .

(a) Does the random variable $Y = X^2$ also have a normal distribution?   
(b) Would the random variable $Y = aX + b$ , $a$ and $b$ nonzero constants have a normal distribution?

Hint: In each case, first determine $P(Y \leq y)$ .

3.4.19. Let the random variable $X$ be $N(\mu, \sigma^2)$ . What would this distribution be if $\sigma^2 = 0$ ?

Hint: Look at the mgf of $X$ for $\sigma^2 > 0$ and investigate its limit as $\sigma^2 \to 0$ .

3.4.20. Let $Y$ have a truncated distribution with pdf $g(y) = \phi(y) / [\Phi(b) - \Phi(a)]$ , for $a < y < b$ , zero elsewhere, where $\phi(x)$ and $\Phi(x)$ are, respectively, the pdf and distribution function of a standard normal distribution. Show then that $E(Y)$ is equal to $[\phi(a) - \phi(b)] / [\Phi(b) - \Phi(a)]$ .

3.4.21. Let $f(x)$ and $F(x)$ be the pdf and the cdf, respectively, of a distribution of the continuous type such that $f'(x)$ exists for all $x$ . Let the mean of the truncated distribution that has pdf $g(y) = f(y) / F(b)$ , $-\infty < y < b$ , zero elsewhere, be equal to $-f(b) / F(b)$ for all real $b$ . Prove that $f(x)$ is a pdf of a standard normal distribution.

3.4.22. Let $X$ and $Y$ be independent random variables, each with a distribution that is $N(0,1)$ . Let $Z = X + Y$ . Find the integral that represents the cdf $G(z) = P(X + Y \leq z)$ of $Z$ . Determine the pdf of $Z$ .

Hint: We have that $G(z) = \int_{-\infty}^{\infty} H(x, z) \, dx$ , where

$$
H (x, z) = \int_ {- \infty} ^ {z - x} \frac {1}{2 \pi} \exp [ - (x ^ {2} + y ^ {2}) / 2 ] d y.
$$

Find $G'(z)$ by evaluating $\int_{-\infty}^{\infty} [\partial H(x, z) / \partial z] dx$ .

3.4.23. Suppose $X$ is a random variable with the pdf $f(x)$ which is symmetric about 0; i.e., $f(-x) = f(x)$ . Show that $F(-x) = 1 - F(x)$ , for all $x$ in the support of $X$ .

3.4.24. Derive the mean and variance of a contaminated normal random variable. They are given in expression (3.4.16).

3.4.25. Investigate the probabilities of an "outlier" for a contaminated normal random variable and a normal random variable. Specifically, determine the probability of observing the event $\{|X| \geq 2\}$ for the following random variables (use the R function pcn for the contaminated normals):

(a) $X$ has a standard normal distribution.   
(b) $X$ has a contaminated normal distribution with cdf (3.4.15), where $\epsilon = 0.15$ and $\sigma_c = 10$ .   
(c) $X$ has a contaminated normal distribution with cdf (3.4.15), where $\epsilon = 0.15$ and $\sigma_c = 20$ .   
(d) $X$ has a contaminated normal distribution with cdf (3.4.15), where $\epsilon = 0.25$ and $\sigma_c = 20$ .

3.4.26. Plot the pdfs of the random variables defined in parts (a)-(d) of the last exercise. Obtain an overlay plot of all four pdfs also. In R the domain values of the pdfs can easily be obtained by using the seq command. For instance, the command $x <- \text{seq}(-6, 6, .1)$ returns a vector of values between -6 and 6 in jumps of 0.1. Then use the R function dcn for the contaminated normal pdfs.

3.4.27. Consider the family of pdfs indexed by the parameter $\alpha$ , $-\infty < \alpha < \infty$ , given by

$$
f (x; \alpha) = 2 \phi (x) \Phi (\alpha x), - \infty <   x <   \infty , \tag {3.4.20}
$$

where $\phi (x)$ and $\Phi (x)$ are respectively the pdf and cdf of a standard normal distribution.

(a) Clearly $f(x; \alpha) > 0$ for all $x$ . Show that the pdf integrates to 1 over $(-\infty, \infty)$ . Hint: Start with

$$
\int_ {- \infty} ^ {\infty} f (x; \alpha) d x = 2 \int_ {- \infty} ^ {\infty} \phi (x) \int_ {- \infty} ^ {\alpha x} \phi (t) d t.
$$

Next sketch the region of integration and then combine the integrands and use the polar coordinate transformation we used after expression (3.4.1).

(b) Note that $f(x; \alpha)$ is the $N(0,1)$ pdf for $\alpha = 0$ . The pdfs are left skewed for $\alpha < 0$ and right skewed for $\alpha > 0$ . Using R, verify this by plotting the pdfs for $\alpha = -3, -2, -1, 1, 2, 3$ . Here's the code for $\alpha = -3$ :

$$
x = \operatorname {s e q} (- 5, 5,. 0 1); a l p = - 3; y = 2 * d n o r m (x) * p n o r m (a l p * x); p l o t (y ^ {\sim} x)
$$

This family is called the skewed normal family; see Azzalini (1985).

3.4.28. For $Z$ distributed $N(0,1)$ , it can be shown that

$$
E [ \Phi (h Z + k) ] = \Phi [ k / \sqrt {1 + h ^ {2}} ];
$$

see Azzalini (1985). Use this fact to obtain the mgf of the pdf (3.4.20). Next obtain the mean of this pdf.

3.4.29. Let $X_{1}$ and $X_{2}$ be independent with normal distributions $N(6,1)$ and $N(7,1)$ , respectively. Find $P(X_{1} > X_{2})$ .

Hint: Write $P(X_{1} > X_{2}) = P(X_{1} - X_{2} > 0)$ and determine the distribution of $X_{1} - X_{2}$ .

3.4.30. Compute $P(X_{1} + 2X_{2} - 2X_{3} > 7)$ if $X_{1}, X_{2}, X_{3}$ are iid with common distribution $N(1,4)$ .

3.4.31. A certain job is completed in three steps in series. The means and standard deviations for the steps are (in minutes)

<table><tr><td>Step</td><td>Mean</td><td>Standard Deviation</td></tr><tr><td>1</td><td>17</td><td>2</td></tr><tr><td>2</td><td>13</td><td>1</td></tr><tr><td>3</td><td>13</td><td>2</td></tr></table>

Assuming independent steps and normal distributions, compute the probability that the job takes less than 40 minutes to complete.

3.4.32. Let $X$ be $N(0,1)$ . Use the moment generating function technique to show that $Y = X^2$ is $\chi^2(1)$ .

Hint: Evaluate the integral that represents $E(e^{tX^2})$ by writing $w = x\sqrt{1 - 2t}$ , $t < \frac{1}{2}$ .

3.4.33. Suppose $X_{1}$ , $X_{2}$ are iid with a common standard normal distribution. Find the joint pdf of $Y_{1} = X_{1}^{2} + X_{2}^{2}$ and $Y_{2} = X_{2}$ and the marginal pdf of $Y_{1}$ .

Hint: Note that the space of $Y_{1}$ and $Y_{2}$ is given by $-\sqrt{y_1} < y_2 < \sqrt{y_1}, 0 < y_1 < \infty$ .

# 3.5 The Multivariate Normal Distribution

In this section we present the multivariate normal distribution. In the first part of the section, we introduce the bivariate normal distribution, leaving most of the proofs to the later section, Section 3.5.2.

# 3.5.1 Bivariate Normal Distribution

We say that $(X,Y)$ follows a bivariate normal distribution if its pdf is given by

$$
f (x, y) = \frac {1}{2 \pi \sigma_ {1} \sigma_ {2} \sqrt {1 - \rho^ {2}}} e ^ {- q / 2}, \quad - \infty <   x <   \infty , \quad - \infty <   y <   \infty , \tag {3.5.1}
$$

where

$$
q = \frac {1}{1 - \rho^ {2}} \left[ \left(\frac {x - \mu_ {1}}{\sigma_ {1}}\right) ^ {2} - 2 \rho \left(\frac {x - \mu_ {1}}{\sigma_ {1}}\right) \left(\frac {y - \mu_ {2}}{\sigma_ {2}}\right) + \left(\frac {y - \mu_ {2}}{\sigma_ {2}}\right) ^ {2} \right], \tag {3.5.2}
$$

and $-\infty < \mu_i < \infty$ , $\sigma_i > 0$ , for $i = 1,2$ , and $\rho$ satisfies $\rho^2 < 1$ . Clearly, this function is positive everywhere in $R^2$ . As we show in Section 3.5.2, it is a pdf with the mgf given by:

$$
M _ {(X, Y)} \left(t _ {1}, t _ {2}\right) = \exp \left\{t _ {1} \mu_ {1} + t _ {2} \mu_ {2} + \frac {1}{2} \left(t _ {1} ^ {2} \sigma_ {1} ^ {2} + 2 t _ {1} t _ {2} \rho \sigma_ {1} \sigma_ {2} + t _ {2} ^ {2} \sigma_ {2} ^ {2}\right) \right\}. \tag {3.5.3}
$$

Thus, the mgf of $X$ is

$$
M _ {X} (t _ {1}) = M _ {(X, Y)} (t _ {1}, 0) = \exp \left\{t _ {1} \mu_ {1} + \frac {1}{2} t _ {1} ^ {2} \sigma_ {1} ^ {2} \right\};
$$

hence, $X$ has a $N(\mu_1, \sigma_1^2)$ distribution. In the same way, $Y$ has a $N(\mu_2, \sigma_2^2)$ distribution. Thus $\mu_1$ and $\mu_2$ are the respective means of $X$ and $Y$ and $\sigma_1^2$ and $\sigma_2^2$ are the respective variances of $X$ and $Y$ . For the parameter $\rho$ , Exercise 3.5.3 shows that

$$
E (X Y) = \frac {\partial^ {2} M _ {(X , Y)}}{\partial t _ {1} \partial t _ {2}} (0, 0) = \rho \sigma_ {1} \sigma_ {2} + \mu_ {1} \mu_ {2}. \tag {3.5.4}
$$

Hence, $\operatorname{cov}(X,Y) = \rho \sigma_1\sigma_2$ and thus, as the notation suggests, $\rho$ is the correlation coefficient between $X$ and $Y$ . We know by Theorem 2.5.2 that if $X$ and $Y$ are independent then $\rho = 0$ . Further, from expression (3.5.3), if $\rho = 0$ then the joint mgf of $(X,Y)$ factors into the product of the marginal mgfs and, hence, $X$ and $Y$ are independent random variables. Thus if $(X,Y)$ has a bivariate normal distribution, then $X$ and $Y$ are independent if and only if they are uncorrelated.

The bivariate normal pdf, (3.5.1), is a mound-shaped over $R^2$ and peaks at its mean $(\mu_1,\mu_2)$ ; see Exercise 3.5.4. For a given $c > 0$ , the points of equal probability (or density) are given by $\{(x,y):f(x,y) = c\}$ . It follows with some algebra that these sets are ellipses. In general for multivariate distributions, we call these sets contours of the pdfs. Hence, the contours of bivariate normal distributions are

elliptical. If $X$ and $Y$ are independent then these contours are circular. The interested reader can consult a book on multivariate statistics for discussions on the geometry of the ellipses. For example, if $\sigma_1 = \sigma_2$ and $\rho > 0$ , the main axis of the ellipse goes through the mean at a $45^{\mathrm{O}}$ angle; see Johnson and Wichern (2008) for discussion.

Figure 3.5.1 displays a three-dimensional plot of the bivariate normal pdf with $(\mu_1,\mu_2) = (0,0)$ , $\sigma_{1} = \sigma_{2} = 1$ , and $\rho = 0.5$ . For location, the peak is at $(\mu_1,\mu_2) = (0,0)$ . The elliptical contours are apparent. Locate the main axis. For a region $A$ in the plane, $P[(X,Y)\in A]$ is the volume under the surface over $A$ . In general such probabilities are calculated by numerical integration methods.

![](images/c038eda4e76e5cef0308f0508294e21c781123fdcda2f76b23a5eb0be9901d8f.jpg)  
Figure 3.5.1: A sketch of the surface of a bivariate normal distribution with mean $(0,0)$ , $\sigma_{1} = \sigma_{2} = 1$ , and $\rho = 0.5$ .

In the next section, we extend the discussion to the general multivariate case; however, Remark 3.5.1, below, returns to the bivariate case and can be read with minor knowledge of vector and matrices.

# 3.5.2 *Multivariate Normal Distribution, General Case

In this section we generalize the bivariate normal distribution to the $n$ -dimensional multivariate normal distribution. As with Section 3.4 on the normal distribution, the derivation of the distribution is simplified by first discussing the standardized variable case and then proceeding to the general case. Also, in this section, vector and matrix notation are used.

Consider the random vector $\mathbf{Z} = (Z_1, \ldots, Z_n)'$ , where $Z_1, \ldots, Z_n$ are iid $N(0, 1)$ random variables. Then the density of $\mathbf{Z}$ is

$$
\begin{array}{l} f _ {\mathbf {Z}} (\mathbf {z}) = \prod_ {i = 1} ^ {n} \frac {1}{\sqrt {2 \pi}} \exp \left\{- \frac {1}{2} z _ {i} ^ {2} \right\} = \left(\frac {1}{2 \pi}\right) ^ {n / 2} \exp \left\{- \frac {1}{2} \sum_ {i = 1} ^ {n} z _ {i} ^ {2} \right\} \\ = \left(\frac {1}{2 \pi}\right) ^ {n / 2} \exp \left\{- \frac {1}{2} \mathbf {z} ^ {\prime} \mathbf {z} \right\}, \tag {3.5.5} \\ \end{array}
$$

for $\mathbf{z} \in R^n$ . Because the $Z_i$ s have mean 0, have variance 1, and are uncorrelated, the mean and covariance matrix of $\mathbf{Z}$ are

$$
E [ \mathbf {Z} ] = \mathbf {0} \text {a n d} \operatorname {C o v} [ \mathbf {Z} ] = \mathbf {I} _ {n}, \tag {3.5.6}
$$

where $\mathbf{I}_n$ denotes the identity matrix of order $n$ . Recall that the mgf of $Z_{i}$ evaluated at $t_i$ is $\exp \{t_i^2 /2\}$ . Hence, because the $Z_{i}$ s are independent, the mgf of $\mathbf{Z}$ is

$$
\begin{array}{l} M _ {\mathbf {Z}} (\mathbf {t}) = E \left[ \exp \left\{\mathbf {t} ^ {\prime} \mathbf {Z} \right\} \right] = E \left[ \prod_ {i = 1} ^ {n} \exp \left\{t _ {i} Z _ {i} \right\} \right] = \prod_ {i = 1} ^ {n} E \left[ \exp \left\{t _ {i} Z _ {i} \right\} \right] \\ = \exp \left\{\frac {1}{2} \sum_ {i = 1} ^ {n} t _ {i} ^ {2} \right\} = \exp \left\{\frac {1}{2} \mathbf {t} ^ {\prime} \mathbf {t} \right\}, \tag {3.5.7} \\ \end{array}
$$

for all $\mathbf{t} \in R^n$ . We say that $\mathbf{Z}$ has a multivariate normal distribution with mean vector $\mathbf{0}$ and covariance matrix $\mathbf{I}_n$ . We abbreviate this by saying that $\mathbf{Z}$ has an $N_n(\mathbf{0}, \mathbf{I}_n)$ distribution.

For the general case, suppose $\pmb{\Sigma}$ is an $n\times n$ , symmetric, and positive semi-definite matrix. Then from linear algebra, we can always decompose $\pmb{\Sigma}$ as

$$
\Sigma = \Gamma^ {\prime} \Lambda \Gamma , \tag {3.5.8}
$$

where $\Lambda$ is the diagonal matrix $\Lambda = \mathrm{diag}(\lambda_1, \lambda_2, \dots, \lambda_n)$ , $\lambda_1 \geq \lambda_2 \geq \dots \geq \lambda_n \geq 0$ are the eigenvalues of $\pmb{\Sigma}$ , and the columns of $\Gamma'$ , $\mathbf{v}_1$ , $\mathbf{v}_2$ , ..., $\mathbf{v}_n$ , are the corresponding eigenvectors. This decomposition is called the spectral decomposition of $\pmb{\Sigma}$ . The matrix $\Gamma$ is orthogonal, i.e., $\Gamma^{-1} = \Gamma'$ , and, hence, $\Gamma\Gamma' = \mathbf{I}$ . As Exercise 3.5.19 shows, we can write the spectral decomposition in another way, as

$$
\boldsymbol {\Sigma} = \Gamma^ {\prime} \Lambda \boldsymbol {\Gamma} = \sum_ {i = 1} ^ {n} \lambda_ {i} \mathbf {v} _ {i} \mathbf {v} _ {i} ^ {\prime}. \tag {3.5.9}
$$

Because the $\lambda_{i}$ s are nonnegative, we can define the diagonal matrix $\Lambda^{1 / 2} =$ diag $\{\sqrt{\lambda_1},\ldots ,\sqrt{\lambda_n}\}$ . Then the orthogonality of $\Gamma$ implies

$$
\boldsymbol {\Sigma} = [ \Gamma^ {\prime} \boldsymbol {\Lambda} ^ {1 / 2} \boldsymbol {\Gamma} ] [ \Gamma^ {\prime} \boldsymbol {\Lambda} ^ {1 / 2} \boldsymbol {\Gamma} ].
$$

We define the matrix product in brackets as the square root of the positive semi-definite matrix $\pmb{\Sigma}$ and write it as

$$
\boldsymbol {\Sigma} ^ {1 / 2} = \Gamma^ {\prime} \boldsymbol {\Lambda} ^ {1 / 2} \boldsymbol {\Gamma}. \tag {3.5.10}
$$

Note that $\Sigma^{1/2}$ is symmetric and positive semi-definite. Suppose $\Sigma$ is positive definite; that is, all of its eigenvalues are strictly positive. Based on this, it is then easy to show that

$$
\left(\boldsymbol {\Sigma} ^ {1 / 2}\right) ^ {- 1} = \boldsymbol {\Gamma} ^ {\prime} \boldsymbol {\Lambda} ^ {- 1 / 2} \boldsymbol {\Gamma}; \tag {3.5.11}
$$

see Exercise 3.5.13. We write the left side of this equation as $\pmb{\Sigma}^{-1/2}$ . These matrices enjoy many additional properties of the law of exponents for numbers; see, for example, Arnold (1981). Here, though, all we need are the properties given above.

Suppose $\mathbf{Z}$ has a $N_{n}(\mathbf{0},\mathbf{I}_{n})$ distribution. Let $\pmb{\Sigma}$ be a positive semi-definite, symmetric matrix and let $\pmb{\mu}$ be an $n\times 1$ vector of constants. Define the random vector $\mathbf{X}$ by

$$
\mathbf {X} = \boldsymbol {\Sigma} ^ {1 / 2} \mathbf {Z} + \boldsymbol {\mu}. \tag {3.5.12}
$$

By (3.5.6) and Theorem 2.6.3, we immediately have

$$
E [ \mathbf {X} ] = \boldsymbol {\mu} \text {a n d} \operatorname {C o v} [ \mathbf {X} ] = \boldsymbol {\Sigma} ^ {1 / 2} \boldsymbol {\Sigma} ^ {1 / 2} = \boldsymbol {\Sigma}. \tag {3.5.13}
$$

Further, the mgf of $\mathbf{X}$ is given by

$$
\begin{array}{l} M _ {\mathbf {X}} (\mathbf {t}) = E \left[ \exp \left\{\mathbf {t} ^ {\prime} \mathbf {X} \right\} \right] = E \left[ \exp \left\{\mathbf {t} ^ {\prime} \boldsymbol {\Sigma} ^ {1 / 2} \mathbf {Z} + \mathbf {t} ^ {\prime} \boldsymbol {\mu} \right\} \right] \\ = \exp \left\{\mathbf {t} ^ {\prime} \boldsymbol {\mu} \right\} E \left[ \exp \left\{\left(\boldsymbol {\Sigma} ^ {1 / 2} \mathbf {t}\right) ^ {\prime} \mathbf {Z} \right\} \right] \\ = \exp \left\{\mathbf {t} ^ {\prime} \boldsymbol {\mu} \right\} \exp \left\{(1 / 2) \left(\boldsymbol {\Sigma} ^ {1 / 2} \mathbf {t}\right) ^ {\prime} \boldsymbol {\Sigma} ^ {1 / 2} \mathbf {t} \right\} \\ = \exp \left\{\mathbf {t} ^ {\prime} \boldsymbol {\mu} \right\} \exp \{(1 / 2) \mathbf {t} ^ {\prime} \boldsymbol {\Sigma} \mathbf {t} \}. \tag {3.5.14} \\ \end{array}
$$

This leads to the following definition:

Definition 3.5.1 (Multivariate Normal). We say an $n$ -dimensional random vector $\mathbf{X}$ has a multivariate normal distribution if its mgf is

$$
M _ {\mathbf {X}} (\mathbf {t}) = \exp \left\{\mathbf {t} ^ {\prime} \boldsymbol {\mu} + (1 / 2) \mathbf {t} ^ {\prime} \boldsymbol {\Sigma} \mathbf {t} \right\}, f o r a l l \mathbf {t} \in R ^ {n}. \tag {3.5.15}
$$

where $\pmb{\Sigma}$ is a symmetric, positive semi-definite matrix and $\pmb{\mu} \in R^n$ . We abbreviate this by saying that $\mathbf{X}$ has a $N_{n}(\pmb{\mu}, \pmb{\Sigma})$ distribution.

Note that our definition is for positive semi-definite matrices $\pmb{\Sigma}$ . Usually $\pmb{\Sigma}$ is positive definite, in which case we can further obtain the density of $\mathbf{X}$ . If $\pmb{\Sigma}$ is positive definite, then so is $\pmb{\Sigma}^{1/2}$ and, as discussed above, its inverse is given by expression (3.5.11). Thus the transformation between $\mathbf{X}$ and $\mathbf{Z}$ , (3.5.12), is one-to-one with the inverse transformation

$$
\mathbf {Z} = \boldsymbol {\Sigma} ^ {- 1 / 2} (\mathbf {X} - \boldsymbol {\mu})
$$

and the Jacobian $|\boldsymbol{\Sigma}^{-1/2}| = |\boldsymbol{\Sigma}|^{-1/2}$ . Hence, upon simplification, the pdf of $\mathbf{X}$ is given by

$$
f _ {\mathbf {X}} (\mathbf {x}) = \frac {1}{(2 \pi) ^ {n / 2} | \boldsymbol {\Sigma} | ^ {1 / 2}} \exp \left\{- \frac {1}{2} (\mathbf {x} - \boldsymbol {\mu}) ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} (\mathbf {x} - \boldsymbol {\mu}) \right\}, \quad \text {f o r} \mathbf {x} \in R ^ {n}. \tag {3.5.16}
$$

In Section 3.5.1, we discussed the contours of the bivariate normal distribution. We now extend that discussion to the general case, adding probabilities to the contours. Let $\mathbf{X}$ have a $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ distribution. In the $n$ -dimensional case, the contours of constant probability for the pdf of $\mathbf{X}$ , (3.5.16), are the ellipsoids

$$
\left(\mathbf {x} - \boldsymbol {\mu}\right) ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} \left(\mathbf {x} - \boldsymbol {\mu}\right) = c ^ {2},
$$

for $c > 0$ . Define the random variable $Y = (\mathbf{X} - \boldsymbol{\mu})'\boldsymbol{\Sigma}^{-1}(\mathbf{X} - \boldsymbol{\mu})$ . Then using expression (3.5.12), we have

$$
Y = \mathbf {Z} ^ {\prime} \boldsymbol {\Sigma} ^ {1 / 2} \boldsymbol {\Sigma} ^ {- 1} \boldsymbol {\Sigma} ^ {1 / 2} \mathbf {Z} = \mathbf {Z} ^ {\prime} \mathbf {Z} = \sum_ {i = 1} ^ {n} Z _ {i} ^ {2}.
$$

Since $Z_{1},\ldots ,Z_{n}$ are iid $N(0,1)$ , $Y$ has $\chi^2$ -distribution with $n$ degrees of freedom. Denote the cdf of $Y$ by $F_{\chi_n^2}$ . Then we have

$$
P \left[ \left(\mathbf {X} - \boldsymbol {\mu}\right) ^ {\prime} \boldsymbol {\Sigma} ^ {- 1} (\mathbf {X} - \boldsymbol {\mu}) \leq c ^ {2} \right] = P (Y \leq c ^ {2}) = F _ {\chi_ {n} ^ {2}} \left(c ^ {2}\right). \tag {3.5.17}
$$

These probabilities are often used to label the contour plots; see Exercise 3.5.5. For reference, we summarize the above proof in the following theorem. Note that this theorem is a generalization of the univariate result given in Theorem 3.4.1.

Theorem 3.5.1. Suppose $\mathbf{X}$ has a $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ distribution, where $\boldsymbol{\Sigma}$ is positive definite. Then the random variable $Y = (\mathbf{X} - \boldsymbol{\mu})^{\prime}\boldsymbol{\Sigma}^{-1}(\mathbf{X} - \boldsymbol{\mu})$ has a $\chi^{2}(n)$ distribution.

The following two theorems are very useful. The first says that a linear transformation of a multivariate normal random vector has a multivariate normal distribution.

Theorem 3.5.2. Suppose $\mathbf{X}$ has a $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ distribution. Let $\mathbf{Y} = \mathbf{A}\mathbf{X} + \mathbf{b}$ , where $\mathbf{A}$ is an $m\times n$ matrix and $\mathbf{b}\in R^{m}$ . Then $\mathbf{Y}$ has a $N_{m}(\mathbf{A}\boldsymbol{\mu} + \mathbf{b},\mathbf{A}\boldsymbol{\Sigma}\mathbf{A}^{\prime})$ distribution.

Proof: From (3.5.15), for $\mathbf{t} \in R^{m}$ , the mgf of $\mathbf{Y}$ is

$$
\begin{array}{l} M _ {\mathbf {Y}} (\mathbf {t}) = E \left[ \exp \left\{\mathbf {t} ^ {\prime} \mathbf {Y} \right\} \right] \\ = E \left[ \exp \left\{\mathbf {t} ^ {\prime} (\mathbf {A X} + \mathbf {b}) \right\} \right] \\ = \exp \left\{\mathbf {t} ^ {\prime} \mathbf {b} \right\} E \left[ \exp \left\{\left(\mathbf {A} ^ {\prime} \mathbf {t}\right) ^ {\prime} \mathbf {X} \right\} \right] \\ = \exp \left\{\mathbf {t} ^ {\prime} \mathbf {b} \right\} \exp \left\{\left(\mathbf {A} ^ {\prime} \mathbf {t}\right) ^ {\prime} \boldsymbol {\mu} + (1 / 2) \left(\mathbf {A} ^ {\prime} \mathbf {t}\right) ^ {\prime} \boldsymbol {\Sigma} \left(\mathbf {A} ^ {\prime} \mathbf {t}\right) \right\} \\ = \exp \left\{\mathbf {t} ^ {\prime} (\mathbf {A} \boldsymbol {\mu} + \mathbf {b}) + (1 / 2) \mathbf {t} ^ {\prime} \mathbf {A} \boldsymbol {\Sigma} \mathbf {A} ^ {\prime} \mathbf {t} \right\}, \\ \end{array}
$$

which is the mgf of an $N_{m}(\mathbf{A}\pmb {\mu} + \mathbf{b},\mathbf{A}\pmb{\Sigma}\mathbf{A}^{\prime})$ distribution.

A simple corollary to this theorem gives marginal distributions of a multivariate normal random variable. Let $\mathbf{X}_1$ be any subvector of $\mathbf{X}$ , say of dimension $m < n$ . Because we can always rearrange means and correlations, there is no loss in generality in writing $\mathbf{X}$ as

$$
\mathbf {X} = \left[ \begin{array}{l} \mathbf {X} _ {1} \\ \mathbf {X} _ {2} \end{array} \right], \tag {3.5.18}
$$

where $\mathbf{X}_2$ is of dimension $p = n - m$ . In the same way, partition the mean and covariance matrix of $\mathbf{X}$ ; that is,

$$
\boldsymbol {\mu} = \left[ \begin{array}{l} \boldsymbol {\mu} _ {1} \\ \boldsymbol {\mu} _ {2} \end{array} \right] \text {a n d} \boldsymbol {\Sigma} = \left[ \begin{array}{l l} \boldsymbol {\Sigma} _ {1 1} & \boldsymbol {\Sigma} _ {1 2} \\ \boldsymbol {\Sigma} _ {2 1} & \boldsymbol {\Sigma} _ {2 2} \end{array} \right] \tag {3.5.19}
$$

with the same dimensions as in expression (3.5.18). Note, for instance, that $\pmb{\Sigma}_{11}$ is the covariance matrix of $\mathbf{X}_1$ and $\pmb{\Sigma}_{12}$ contains all the covariances between the components of $\mathbf{X}_1$ and $\mathbf{X}_2$ . Now define $\mathbf{A}$ to be the matrix

$$
\mathbf {A} = [ \mathbf {I} _ {m} \stackrel {.} {:} \mathbf {O} _ {m p} ],
$$

where $\mathbf{O}_{mp}$ is an $m\times p$ matrix of zeroes. Then $\mathbf{X}_1 = \mathbf{A}\mathbf{X}$ . Hence, applying Theorem 3.5.2 to this transformation, along with some matrix algebra, we have the following corollary:

Corollary 3.5.1. Suppose $\mathbf{X}$ has a $N_{n}(\pmb{\mu},\pmb{\Sigma})$ distribution, partitioned as in expressions (3.5.18) and (3.5.19). Then $\mathbf{X}_1$ has a $N_{m}(\pmb{\mu}_{1},\pmb{\Sigma}_{11})$ distribution.

This is a useful result because it says that any marginal distribution of $\mathbf{X}$ is also normal and, further, its mean and covariance matrix are those associated with that partial vector.

Recall in Section 2.5, Theorem 2.5.2, that if two random variables are independent then their covariance is 0. In general, the converse is not true. However, as the following theorem shows, it is true for the multivariate normal distribution.

Theorem 3.5.3. Suppose $\mathbf{X}$ has a $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ distribution, partitioned as in the expressions (3.5.18) and (3.5.19). Then $\mathbf{X}_1$ and $\mathbf{X}_2$ are independent if and only if $\boldsymbol{\Sigma}_{12} = \mathbf{0}$ .

Proof: First note that $\pmb{\Sigma}_{21} = \pmb{\Sigma}_{12}^{\prime}$ . The joint mgf of $\mathbf{X}_1$ and $\mathbf{X}_2$ is given by

$$
M _ {\mathbf {X} _ {1}, \mathbf {X} _ {2}} \left(\mathbf {t} _ {1}, \mathbf {t} _ {2}\right) = \exp \left\{\mathbf {t} _ {1} ^ {\prime} \boldsymbol {\mu} _ {1} + \mathbf {t} _ {2} ^ {\prime} \boldsymbol {\mu} _ {2} + \frac {1}{2} \left(\mathbf {t} _ {1} ^ {\prime} \boldsymbol {\Sigma} _ {1 1} \mathbf {t} _ {1} + \mathbf {t} _ {2} ^ {\prime} \boldsymbol {\Sigma} _ {2 2} \mathbf {t} _ {2} + \mathbf {t} _ {2} ^ {\prime} \boldsymbol {\Sigma} _ {2 1} \mathbf {t} _ {1} + \mathbf {t} _ {1} ^ {\prime} \boldsymbol {\Sigma} _ {1 2} \mathbf {t} _ {2}\right) \right\} \tag {3.5.20}
$$

where $\mathbf{t}' = (\mathbf{t}_1',\mathbf{t}_2')$ is partitioned the same as $\pmb{\mu}$ . By Corollary 3.5.1, $\mathbf{X}_1$ has a $N_{m}(\pmb{\mu}_{1},\pmb{\Sigma}_{11})$ distribution and $\mathbf{X}_2$ has a $N_{p}(\pmb{\mu}_{2},\pmb{\Sigma}_{22})$ distribution. Hence, the product of their marginal mgfs is

$$
M _ {\mathbf {X} _ {1}} \left(\mathbf {t} _ {1}\right) M _ {\mathbf {X} _ {2}} \left(\mathbf {t} _ {2}\right) = \exp \left\{\mathbf {t} _ {1} ^ {\prime} \boldsymbol {\mu} _ {1} + \mathbf {t} _ {2} ^ {\prime} \boldsymbol {\mu} _ {2} + \frac {1}{2} \left(\mathbf {t} _ {1} ^ {\prime} \boldsymbol {\Sigma} _ {1 1} \mathbf {t} _ {1} + \mathbf {t} _ {2} ^ {\prime} \boldsymbol {\Sigma} _ {2 2} \mathbf {t} _ {2}\right) \right\}. \tag {3.5.21}
$$

By (2.6.6) of Section 2.6, $\mathbf{X}_1$ and $\mathbf{X}_2$ are independent if and only if the expressions (3.5.20) and (3.5.21) are the same. If $\boldsymbol{\Sigma}_{12} = \mathbf{O}'$ and, hence, $\boldsymbol{\Sigma}_{21} = \mathbf{O}$ , then the expressions are the same and $\mathbf{X}_1$ and $\mathbf{X}_2$ are independent. If $\mathbf{X}_1$ and $\mathbf{X}_2$ are independent, then the covariances between their components are all 0; i.e., $\boldsymbol{\Sigma}_{12} = \mathbf{O}'$ and $\boldsymbol{\Sigma}_{21} = \mathbf{O}$ .

Corollary 3.5.1 showed that the marginal distributions of a multivariate normal are themselves normal. This is true for conditional distributions, too. As the

following proof shows, we can combine the results of Theorems 3.5.2 and 3.5.3 to obtain the following theorem.

Theorem 3.5.4. Suppose $\mathbf{X}$ has a $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ distribution, which is partitioned as in expressions (3.5.18) and (3.5.19). Assume that $\boldsymbol{\Sigma}$ is positive definite. Then the conditional distribution of $\mathbf{X}_1\mid \mathbf{X}_2$ is

$$
N _ {m} \left(\boldsymbol {\mu} _ {1} + \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \left(\mathbf {X} _ {2} - \boldsymbol {\mu} _ {2}\right), \boldsymbol {\Sigma} _ {1 1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\Sigma} _ {2 1}\right). \tag {3.5.22}
$$

Proof: Consider first the joint distribution of the random vector $\mathbf{W} = \mathbf{X}_1 - \pmb{\Sigma}_{12}\pmb{\Sigma}_{22}^{-1}\mathbf{X}_2$ and $\mathbf{X}_2$ . This distribution is obtained from the transformation

$$
\left[ \begin{array}{c} \mathbf {W} \\ \mathbf {X} _ {2} \end{array} \right] = \left[ \begin{array}{c c} \mathbf {I} _ {m} & - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \\ \mathbf {O} & \mathbf {I} _ {p} \end{array} \right] \left[ \begin{array}{c} \mathbf {X} _ {1} \\ \mathbf {X} _ {2} \end{array} \right].
$$

Because this is a linear transformation, it follows from Theorem 3.5.2 that the joint distribution is multivariate normal, with $E[\mathbf{W}] = \pmb{\mu}_1 - \pmb{\Sigma}_{12}\pmb{\Sigma}_{22}^{-1}\pmb{\mu}_2$ , $E[\mathbf{X}_2] = \pmb{\mu}_2$ and covariance matrix

$$
\begin{array}{l} \left[ \begin{array}{c c} \mathbf {I} _ {m} & - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \\ \mathbf {O} & \mathbf {I} _ {p} \end{array} \right] \left[ \begin{array}{c c} \boldsymbol {\Sigma} _ {1 1} & \boldsymbol {\Sigma} _ {1 2} \\ \boldsymbol {\Sigma} _ {2 1} & \boldsymbol {\Sigma} _ {2 2} \end{array} \right] \left[ \begin{array}{c c} \mathbf {I} _ {m} & \mathbf {O} ^ {\prime} \\ - \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\Sigma} _ {2 1} & \mathbf {I} _ {p} \end{array} \right] = \\ \left[ \begin{array}{c c} \boldsymbol {\Sigma} _ {1 1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\Sigma} _ {2 1} & \boldsymbol {O} ^ {\prime} \\ \boldsymbol {O} & \boldsymbol {\Sigma} _ {2 2} \end{array} \right]. \\ \end{array}
$$

Hence, by Theorem 3.5.3 the random vectors $\mathbf{W}$ and $\mathbf{X}_2$ are independent. Thus the conditional distribution of $\mathbf{W}|\mathbf{X}_2$ is the same as the marginal distribution of $\mathbf{W}$ ; that is,

$$
\mathbf {W} \mid \mathbf {X} _ {2} \text {i s} N _ {m} \left(\boldsymbol {\mu} _ {1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\mu} _ {2}, \boldsymbol {\Sigma} _ {1 1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\Sigma} _ {2 1}\right).
$$

Further, because of this independence, $\mathbf{W} + \pmb{\Sigma}_{12}\pmb{\Sigma}_{22}^{-1}\mathbf{X}_2$ given $\mathbf{X}_2$ is distributed as

$$
N _ {m} \left(\boldsymbol {\mu} _ {1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\mu} _ {2} + \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \mathbf {X} _ {2}, \boldsymbol {\Sigma} _ {1 1} - \boldsymbol {\Sigma} _ {1 2} \boldsymbol {\Sigma} _ {2 2} ^ {- 1} \boldsymbol {\Sigma} _ {2 1}\right), \tag {3.5.23}
$$

which is the desired result.

In the following remark, we return to the bivariate normal using the above general notation.

Remark 3.5.1 (Continuation of the Bivariate Normal). Suppose $(X,Y)$ has a $N_{2}(\pmb{\mu},\pmb{\Sigma})$ distribution, where

$$
\boldsymbol {\mu} = \left[ \begin{array}{l} \mu_ {1} \\ \mu_ {2} \end{array} \right] \text {a n d} \boldsymbol {\Sigma} = \left[ \begin{array}{c c} \sigma_ {1} ^ {2} & \sigma_ {1 2} \\ \sigma_ {1 2} & \sigma_ {2} ^ {2} \end{array} \right]. \tag {3.5.24}
$$

Substituting $\rho \sigma_{1}\sigma_{2}$ for $\sigma_{12}$ in $\pmb{\Sigma}$ , it is easy to see that the determinant of $\pmb{\Sigma}$ is $\sigma_1^2\sigma_2^2 (1 - \rho^2)$ . Recall that $\rho^2\leq 1$ . For the remainder of this remark, assume that $\rho^2 < 1$ . In this case, $\pmb{\Sigma}$ is invertible (it is also positive definite). Further, since $\pmb{\Sigma}$ is a $2\times 2$ matrix, its inverse can easily be determined to be

$$
\boldsymbol {\Sigma} ^ {- 1} = \frac {1}{\sigma_ {1} ^ {2} \sigma_ {2} ^ {2} (1 - \rho^ {2})} \left[ \begin{array}{c c} \sigma_ {2} ^ {2} & - \rho \sigma_ {1} \sigma_ {2} \\ - \rho \sigma_ {1} \sigma_ {2} & \sigma_ {1} ^ {2} \end{array} \right]. \tag {3.5.25}
$$

This shows the equivalence of the bivariate normal pdf notation, (3.5.1), and the general multivariate normal distribution with $n = 2$ pdf notation, (3.5.16).

To simplify the conditional normal distribution (3.5.22) for the bivariate case, consider once more the bivariate normal distribution that was given in Section 3.5.1. For this case, reversing the roles so that $Y = X_{1}$ and $X = X_{2}$ , expression (3.5.22) shows that the conditional distribution of $Y$ given $X = x$ is

$$
N \left[ \mu_ {2} + \rho \frac {\sigma_ {2}}{\sigma_ {1}} \left(x - \mu_ {1}\right), \sigma_ {2} ^ {2} \left(1 - \rho^ {2}\right) \right]. \tag {3.5.26}
$$

Thus, with a bivariate normal distribution, the conditional mean of $Y$ , given that $X = x$ , is linear in $x$ and is given by

$$
E (Y | x) = \mu_ {2} + \rho \frac {\sigma_ {2}}{\sigma_ {1}} (x - \mu_ {1}).
$$

Although the mean of the conditional distribution of $Y$ , given $X = x$ , depends upon $x$ (unless $\rho = 0$ ), the variance $\sigma_2^2 (1 - \rho^2)$ is the same for all real values of $x$ . Thus, by way of example, given that $X = x$ , the conditional probability that $Y$ is within $(2.576)\sigma_2\sqrt{1 - \rho^2}$ units of the conditional mean is 0.99, whatever the value of $x$ may be. In this sense, most of the probability for the distribution of $X$ and $Y$ lies in the band

$$
\mu_ {2} + \rho \frac {\sigma_ {2}}{\sigma_ {1}} (x - \mu_ {1}) \pm 2. 5 7 6 \sigma_ {2} \sqrt {1 - \rho^ {2}}
$$

about the graph of the linear conditional mean. For every fixed positive $\sigma_{2}$ , the width of this band depends upon $\rho$ . Because the band is narrow when $\rho^2$ is nearly 1, we see that $\rho$ does measure the intensity of the concentration of the probability for $X$ and $Y$ about the linear conditional mean. We alluded to this fact in the remark of Section 2.5.

In a similar manner we can show that the conditional distribution of $X$ , given $Y = y$ , is the normal distribution

$$
N \left[ \mu_ {1} + \rho \frac {\sigma_ {1}}{\sigma_ {2}} (y - \mu_ {2}), \sigma_ {1} ^ {2} (1 - \rho^ {2}) \right].
$$

Example 3.5.1. Let us assume that in a certain population of married couples the height $X_{1}$ of the husband and the height $X_{2}$ of the wife have a bivariate normal distribution with parameters $\mu_{1} = 5.8$ feet, $\mu_{2} = 5.3$ feet, $\sigma_{1} = \sigma_{2} = 0.2$ foot, and $\rho = 0.6$ . The conditional pdf of $X_{2}$ , given $X_{1} = 6.3$ , is normal, with mean $5.3 + (0.6)(6.3 - 5.8) = 5.6$ and standard deviation $(0.2)\sqrt{(1 - 0.36)} = 0.16$ . Accordingly, given that the height of the husband is 6.3 feet, the probability that his wife has a height between 5.28 and 5.92 feet is

$$
P (5. 2 8 <   X _ {2} <   5. 9 2 | X _ {1} = 6. 3) = \Phi (2) - \Phi (- 2) = 0. 9 5 4.
$$

The interval (5.28, 5.92) could be thought of as a $95.4\%$ prediction interval for the wife's height, given $X_{1} = 6.3$ .

# 3.5.3 *Applications

In this section, we consider several applications of the multivariate normal distribution. These the reader may have already encountered in an applied course in statistics. The first is principal components, which results in a linear function of a multivariate normal random vector that has independent components and preserves the "total" variation in the problem.

Let the random vector $\mathbf{X}$ have the multivariate normal distribution $N_{n}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ where $\boldsymbol{\Sigma}$ is positive definite. As in (3.5.8), write the spectral decomposition of $\boldsymbol{\Sigma}$ as $\boldsymbol{\Sigma} = \boldsymbol{\Gamma}'\boldsymbol{\Lambda}\boldsymbol{\Gamma}$ . Recall that the columns, $\mathbf{v}_1,\mathbf{v}_2,\ldots ,\mathbf{v}_n$ , of $\boldsymbol{\Gamma}'$ are the eigenvectors corresponding to the eigenvalues $\lambda_1,\lambda_2,\dots,\lambda_n$ that form the main diagonal of the matrix $\boldsymbol{\Lambda}$ . Assume without loss of generality that the eigenvalues are decreasing; i.e., $\lambda_{1}\geq \lambda_{2}\geq \dots \geq \lambda_{n} > 0$ . Define the random vector $\mathbf{Y} = \mathbf{\Gamma}(\mathbf{X} - \boldsymbol {\mu})$ . Since $\boldsymbol{\Gamma}\boldsymbol{\Sigma}\boldsymbol{\Gamma}' = \boldsymbol{\Lambda}$ , by Theorem 3.5.2 $\mathbf{Y}$ has a $N_{n}(0,\boldsymbol{\Lambda})$ distribution. Hence the components $Y_{1},Y_{2},\ldots ,Y_{n}$ are independent random variables and, for $i = 1,2,\ldots ,n$ , $Y_{i}$ has a $N(0,\lambda_i)$ distribution. The random vector $\mathbf{Y}$ is called the vector of principal components.

We say the total variation, (TV), of a random vector is the sum of the variances of its components. For the random vector $\mathbf{X}$ , because $\Gamma$ is an orthogonal matrix

$$
\operatorname {T V} (\mathbf {X}) = \sum_ {i = 1} ^ {n} \sigma_ {i} ^ {2} = \operatorname {t r} \mathbf {\Sigma} = \operatorname {t r} \boldsymbol {\Gamma} ^ {\prime} \boldsymbol {\Lambda} \mathbf {\Gamma} = \operatorname {t r} \boldsymbol {\Lambda} \boldsymbol {\Gamma} \boldsymbol {\Gamma} ^ {\prime} = \sum_ {i = 1} ^ {n} \lambda_ {i} = \operatorname {T V} (\mathbf {Y}).
$$

Hence, $\mathbf{X}$ and $\mathbf{Y}$ have the same total variation.

Next, consider the first component of $\mathbf{Y}$ , which is given by $Y_{1} = \mathbf{v}_{1}^{\prime}(\mathbf{X} - \boldsymbol{\mu})$ . This is a linear combination of the components of $\mathbf{X} - \boldsymbol{\mu}$ with the property $\| \mathbf{v}_1\|^2 = \sum_{j=1}^{n} v_{1j}^2 = 1$ , because $\mathbf{I}'$ is orthogonal. Consider any other linear combination of $(\mathbf{X} - \boldsymbol{\mu})$ , say $\mathbf{a}'(\mathbf{X} - \boldsymbol{\mu})$ such that $\| \mathbf{a}\|^2 = 1$ . Because $\mathbf{a} \in R^n$ and $\{\mathbf{v}_1, \ldots, \mathbf{v}_n\}$ forms a basis for $R^n$ , we must have $\mathbf{a} = \sum_{j=1}^{n} a_j \mathbf{v}_j$ for some set of scalars $a_1, \ldots, a_n$ . Furthermore, because the basis $\{\mathbf{v}_1, \ldots, \mathbf{v}_n\}$ is orthonormal

$$
\mathbf {a} ^ {\prime} \mathbf {v} _ {i} = \left(\sum_ {j = 1} ^ {n} a _ {j} \mathbf {v} _ {j}\right) ^ {\prime} \mathbf {v} _ {i} = \sum_ {j = 1} ^ {n} a _ {j} \mathbf {v} _ {j} ^ {\prime} \mathbf {v} _ {i} = a _ {i}.
$$

Using (3.5.9) and the fact that $\lambda_{i} > 0$ , we have the inequality

$$
\begin{array}{l} \operatorname {V a r} (\mathbf {a} ^ {\prime} \mathbf {X}) = \mathbf {a} ^ {\prime} \boldsymbol {\Sigma} \mathbf {a} \\ = \sum_ {i = 1} ^ {n} \lambda_ {i} \left(\mathbf {a} ^ {\prime} \mathbf {v} _ {i}\right) ^ {2} \\ = \sum_ {i = 1} ^ {n} \lambda_ {i} a _ {i} ^ {2} \leq \lambda_ {1} \sum_ {i = 1} ^ {n} a _ {i} ^ {2} = \lambda_ {1} = \operatorname {V a r} \left(Y _ {1}\right). \tag {3.5.27} \\ \end{array}
$$

Hence, $Y_{1}$ has the maximum variance of any linear combination $\mathbf{a}'(\mathbf{X} - \boldsymbol{\mu})$ , such that $\| \mathbf{a} \| = 1$ . For this reason, $Y_{1}$ is called the first principal component of $\mathbf{X}$ .

What about the other components, $Y_{2}, \ldots, Y_{n}$ ? As the following theorem shows, they share a similar property relative to the order of their associated eigenvalue. For this reason, they are called the second, third, through the $n$ th principal components, respectively.

Theorem 3.5.5. Consider the situation described above. For $j = 2, \ldots, n$ and $i = 1, 2, \ldots, j - 1$ , $Var[\mathbf{a}'\mathbf{X}] \leq \lambda_j = Var(Y_j)$ , for all vectors $\mathbf{a}$ such that $\mathbf{a} \perp \mathbf{v}_i$ and $\| \mathbf{a} \| = 1$ .

The proof of this theorem is similar to that for the first principal component and is left as Exercise 3.5.20. A second application concerning linear regression is offered in Exercise 3.5.22.

# EXERCISES

3.5.1. Let $X$ and $Y$ have a bivariate normal distribution with respective parameters $\mu_{x} = 2.8$ , $\mu_{y} = 110$ , $\sigma_{x}^{2} = 0.16$ , $\sigma_{y}^{2} = 100$ , and $\rho = 0.6$ . Using R, compute:

(a) $P(106 < Y < 124)$ .   
(b) $P(106 < Y < 124|X = 3.2)$ .

3.5.2. Let $X$ and $Y$ have a bivariate normal distribution with parameters $\mu_1 = 3$ , $\mu_2 = 1$ , $\sigma_1^2 = 16$ , $\sigma_2^2 = 25$ , and $\rho = \frac{3}{5}$ . Using R, determine the following probabilities:

(a) $P(3 <   Y <   8)$   
(b) $P(3 < Y < 8|X = 7)$ .   
(c) $P(-3 < X < 3)$ .   
(d) $P(-3 < X < 3|Y = -4)$ .

3.5.3. Show that expression (3.5.4) is true.

3.5.4. Let $f(x,y)$ be the bivariate normal pdf in expression (3.5.1).

(a) Show that $f(x,y)$ has an unique maximum at $(\mu_1,\mu_2)$ .   
(b) For a given $c > 0$ , show that the points $\{(x,y):f(x,y) = c\}$ of equal probability form an ellipse.

3.5.5. Let $\mathbf{X}$ be $N_{2}(\pmb{\mu},\pmb{\Sigma})$ . Recall expression (3.5.17) which gives the probability of an elliptical contour region for $\mathbf{X}$ . The R function<sup>8</sup> ellipmake plots the elliptical contour regions. To graph the elliptical $95\%$ contour for a multivariate normal distribution with $\pmb{\mu} = (5,2)^{\prime}$ and $\pmb{\Sigma}$ with variances 1 and covariance 0.75, use the code

$$
e l l i p m a k e (p = . 9 5, b = \text {m a t r i x} (c (1,.. 7 5,.. 7 5, 1), n r o w = 2), \mathrm {m u} = c (5, 2)).
$$

This R function can be found at the site listed in the Preface.

(a) Run the above code.   
(b) Change the code so the probability is 0.50.   
(c) Change the code to obtain an overlay plot of the 0.50 and 0.95 regions.   
(d) Using a loop, obtain the overlay plot for a vector of probabilities.

3.5.6. Let $U$ and $V$ be independent random variables, each having a standard normal distribution. Show that the mgf $E(e^{t(UV)})$ of the random variable $UV$ is $(1 - t^2)^{-1/2}$ , $-1 < t < 1$ .

Hint: Compare $E(e^{tUV})$ with the integral of a bivariate normal pdf that has means equal to zero.

3.5.7. Let $X$ and $Y$ have a bivariate normal distribution with parameters $\mu_1 = 5$ , $\mu_2 = 10$ , $\sigma_1^2 = 1$ , $\sigma_2^2 = 25$ , and $\rho > 0$ . If $P(4 < Y < 16|X = 5) = 0.954$ , determine $\rho$ .

3.5.8. Let $X$ and $Y$ have a bivariate normal distribution with parameters $\mu_1 = 20$ , $\mu_2 = 40$ , $\sigma_1^2 = 9$ , $\sigma_2^2 = 4$ , and $\rho = 0.6$ . Find the shortest interval for which 0.90 is the conditional probability that $Y$ is in the interval, given that $X = 22$ .

3.5.9. Say the correlation coefficient between the heights of husbands and wives is 0.70 and the mean male height is 5 feet 10 inches with standard deviation 2 inches, and the mean female height is 5 feet 4 inches with standard deviation $1\frac{1}{2}$ inches. Assuming a bivariate normal distribution, what is the best guess of the height of a woman whose husband's height is 6 feet? Find a $95\%$ prediction interval for her height.

# 3.5.10. Let

$$
f (x, y) = (1 / 2 \pi) \exp \left[ - \frac {1}{2} (x ^ {2} + y ^ {2}) \right] \left\{1 + x y \exp \left[ - \frac {1}{2} (x ^ {2} + y ^ {2} - 2) \right] \right\},
$$

where $-\infty < x < \infty, -\infty < y < \infty$ . If $f(x,y)$ is a joint pdf, it is not a normal bivariate pdf. Show that $f(x,y)$ actually is a joint pdf and that each marginal pdf is normal. Thus the fact that each marginal pdf is normal does not imply that the joint pdf is bivariate normal.

3.5.11. Let $X, Y$ , and $Z$ have the joint pdf

$$
\left(\frac {1}{2 \pi}\right) ^ {3 / 2} \exp \left(- \frac {x ^ {2} + y ^ {2} + z ^ {2}}{2}\right) \left[ 1 + x y z \exp \left(- \frac {x ^ {2} + y ^ {2} + z ^ {2}}{2}\right) \right],
$$

where $-\infty < x < \infty$ , $-\infty < y < \infty$ , and $-\infty < z < \infty$ . While $X$ , $Y$ , and $Z$ are obviously dependent, show that $X$ , $Y$ , and $Z$ are pairwise independent and that each pair has a bivariate normal distribution.

3.5.12. Let $X$ and $Y$ have a bivariate normal distribution with parameters $\mu_1 = \mu_2 = 0$ , $\sigma_1^2 = \sigma_2^2 = 1$ , and correlation coefficient $\rho$ . Find the distribution of the random variable $Z = aX + bY$ in which $a$ and $b$ are nonzero constants.

3.5.13. Establish formula (3.5.11) by a direct multiplication.

3.5.14. Let $\mathbf{X} = (X_{1},X_{2},X_{3})$ have a multivariate normal distribution with mean vector $\mathbf{0}$ and variance-covariance matrix

$$
\boldsymbol {\Sigma} = \left[ \begin{array}{c c c} 1 & 0 & 0 \\ 0 & 2 & 1 \\ 0 & 1 & 2 \end{array} \right].
$$

Find $P(X_{1} > X_{2} + X_{3} + 2)$

Hint: Find the vector $\mathbf{a}$ so that $\mathbf{aX} = X_1 - X_2 - X_3$ and make use of Theorem 3.5.2.

3.5.15. Suppose $\mathbf{X}$ is distributed $N_{n}(\pmb {\mu},\pmb {\Sigma})$ . Let $\overline{X} = n^{-1}\sum_{i = 1}^{n}X_{i}$

(a) Write $\overline{X}$ as aX for an appropriate vector a and apply Theorem 3.5.2 to find the distribution of $\overline{X}$ .   
(b) Determine the distribution of $\overline{X}$ if all of its component random variables $X_{i}$ have the same mean $\mu$ .

3.5.16. Suppose $\mathbf{X}$ is distributed $N_{2}(\boldsymbol{\mu},\boldsymbol{\Sigma})$ . Determine the distribution of the random vector $(X_{1} + X_{2},X_{1} - X_{2})$ . Show that $X_{1} + X_{2}$ and $X_{1} - X_{2}$ are independent if $\operatorname{Var}(X_1) = \operatorname{Var}(X_2)$ .

3.5.17. Suppose $\mathbf{X}$ is distributed $N_{3}(\mathbf{0},\Sigma)$ , where

$$
\boldsymbol {\Sigma} = \left[ \begin{array}{c c c} 3 & 2 & 1 \\ 2 & 2 & 1 \\ 1 & 1 & 3 \end{array} \right].
$$

Find $P((X_1 - 2X_2 + X_3)^2 > 15.36)$ .

3.5.18. Let $X_{1}$ , $X_{2}$ , $X_{3}$ be iid random variables each having a standard normal distribution. Let the random variables $Y_{1}$ , $Y_{2}$ , $Y_{3}$ be defined by

$$
X _ {1} = Y _ {1} \cos Y _ {2} \sin Y _ {3}, \quad X _ {2} = Y _ {1} \sin Y _ {2} \sin Y _ {3}, \quad X _ {3} = Y _ {1} \cos Y _ {3},
$$

where $0 \leq Y_1 < \infty$ , $0 \leq Y_2 < 2\pi$ , $0 \leq Y_3 \leq \pi$ . Show that $Y_1, Y_2, Y_3$ are mutually independent.

3.5.19. Show that expression (3.5.9) is true.

3.5.20. Prove Theorem 3.5.5.

3.5.21. Suppose $\mathbf{X}$ has a multivariate normal distribution with mean 0 and covariance matrix

$$
\boldsymbol {\Sigma} = \left[ \begin{array}{c c c c} 2 8 3 & 2 1 5 & 2 7 7 & 2 0 8 \\ 2 1 5 & 2 1 3 & 2 1 7 & 1 5 3 \\ 2 7 7 & 2 1 7 & 3 3 6 & 2 3 6 \\ 2 0 8 & 1 5 3 & 2 3 6 & 1 9 4 \end{array} \right].
$$

(a) Find the total variation of $\mathbf{X}$ .   
(b) Find the principal component vector $\mathbf{Y}$ .   
(c) Show that the first principal component accounts for $90\%$ of the total variation.   
(d) Show that the first principal component $Y_{1}$ is essentially a rescaled $\overline{X}$ . Determine the variance of $(1/2)\overline{X}$ and compare it to that of $Y_{1}$ .

Note that the R command `\text{eigen}(\text{amat})\) obtains the spectral decomposition of the matrix `\text{amat}\).

3.5.22. Readers may have encountered the multiple regression model in a previous course in statistics. We can briefly write it as follows. Suppose we have a vector of $n$ observations $\mathbf{Y}$ which has the distribution $N_{n}(\mathbf{X}\boldsymbol{\beta},\sigma^{2}\mathbf{I})$ , where $\mathbf{X}$ is an $n \times p$ matrix of known values, which has full column rank $p$ , and $\boldsymbol{\beta}$ is a $p \times 1$ vector of unknown parameters. The least squares estimator of $\boldsymbol{\beta}$ is

$$
\widehat {\boldsymbol {\beta}} = (\mathbf {X} ^ {\prime} \mathbf {X}) ^ {- 1} \mathbf {X} ^ {\prime} \mathbf {Y}.
$$

(a) Determine the distribution of $\widehat{\beta}$ .   
(b) Let $\widehat{\mathbf{Y}} = \mathbf{X}\widehat{\boldsymbol{\beta}}$ . Determine the distribution of $\widehat{\mathbf{Y}}$ .   
(c) Let $\widehat{\mathbf{e}} = \mathbf{Y} - \widehat{\mathbf{Y}}$ . Determine the distribution of $\widehat{\mathbf{e}}$ .   
(d) By writing the random vector $(\widehat{\mathbf{Y}}', \widehat{\mathbf{e}}')'$ as a linear function of $\mathbf{Y}$ , show that the random vectors $\widehat{\mathbf{Y}}$ and $\widehat{\mathbf{e}}$ are independent.   
(e) Show that $\hat{\beta}$ solves the least squares problem; that is,

$$
\| \mathbf {Y} - \mathbf {X} \widehat {\boldsymbol {\beta}} \| ^ {2} = \min  _ {\mathbf {b} \in R ^ {p}} \| \mathbf {Y} - \mathbf {X b} \| ^ {2}.
$$

# 3.6 $t$ - and $F$ -Distributions

It is the purpose of this section to define two additional distributions that are quite useful in certain problems of statistical inference. These are called, respectively, the (Student's) $t$ -distribution and the $F$ -distribution.

# 3.6.1 The $t$ -distribution

Let $W$ denote a random variable that is $N(0,1)$ ; let $V$ denote a random variable that is $\chi^2(r)$ ; and let $W$ and $V$ be independent. Then the joint pdf of $W$ and $V$ , say $h(w,v)$ , is the product of the pdf of $W$ and that of $V$ or

$$
h (w, v) = \left\{ \begin{array}{l l} \frac {1}{\sqrt {2 \pi}} e ^ {- w ^ {2} / 2} \frac {1}{\Gamma (r / 2) 2 ^ {r / 2}} v ^ {r / 2 - 1} e ^ {- v / 2} & - \infty <   w <   \infty , 0 <   v <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

Define a new random variable $T$ by writing

$$
T = \frac {W}{\sqrt {V / r}}. \tag {3.6.1}
$$

The transformation technique is used to obtain the pdf $g_{1}(t)$ of $T$ . The equations

$$
t = \frac {w}{\sqrt {v / r}} \quad \text {a n d} \quad u = v
$$

define a transformation that maps $\mathcal{S} = \{(w,v): -\infty < w < \infty, 0 < v < \infty\}$ one-to-one and onto $\mathcal{T} = \{(t,u): -\infty < t < \infty, 0 < u < \infty\}$ . Since $w = t\sqrt{u} / \sqrt{r}$ , $v = u$ , the absolute value of the Jacobian of the transformation is $|J| = \sqrt{u} / \sqrt{r}$ . Accordingly, the joint pdf of $T$ and $U = V$ is given by

$$
\begin{array}{l} g (t, u) = h \left(\frac {t \sqrt {u}}{\sqrt {r}}, u\right) | J | \\ = \left\{ \begin{array}{l l} \frac {1}{\sqrt {2 \pi} \Gamma (r / 2) 2 ^ {r / 2}} u ^ {r / 2 - 1} \exp \left[ - \frac {u}{2} \left(1 + \frac {t ^ {2}}{r}\right) \right] \frac {\sqrt {u}}{\sqrt {r}} & | t | <   \infty , 0 <   u <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \\ \end{array}
$$

The marginal pdf of $T$ is then

$$
\begin{array}{l} g _ {1} (t) = \int_ {- \infty} ^ {\infty} g (t, u) d u \\ = \int_ {0} ^ {\infty} \frac {1}{\sqrt {2 \pi r} \Gamma (r / 2) 2 ^ {r / 2}} u ^ {(r + 1) / 2 - 1} \exp \left[ - \frac {u}{2} \left(1 + \frac {t ^ {2}}{r}\right) \right] d u. \\ \end{array}
$$

In this integral let $z = u[1 + (t^2 /r)] / 2$ , and it is seen that

$$
\begin{array}{l} g _ {1} (t) = \int_ {0} ^ {\infty} \frac {1}{\sqrt {2 \pi r} \Gamma (r / 2) 2 ^ {r / 2}} \left(\frac {2 z}{1 + t ^ {2} / r}\right) ^ {(r + 1) / 2 - 1} e ^ {- z} \left(\frac {2}{1 + t ^ {2} / r}\right) d z \\ = \frac {\Gamma [ (r + 1) / 2 ]}{\sqrt {\pi r} \Gamma (r / 2)} \frac {1}{(1 + t ^ {2} / r) ^ {(r + 1) / 2}}, - \infty <   t <   \infty . \tag {3.6.2} \\ \end{array}
$$

Thus, if $W$ is $N(0,1)$ , $V$ is $\chi^2(r)$ , and $W$ and $V$ are independent, then $T = W / \sqrt{V / r}$ has the pdf $g_1(t)$ , (3.6.2). The distribution of the random variable $T$ is usually called a $t$ -distribution. It should be observed that a $t$ -distribution is completely determined by the parameter $r$ , the number of degrees of freedom of the random variable that has the chi-square distribution.

The pdf $g_{1}(t)$ satisfies $g_{1}(-t) = g_{1}(t)$ ; hence, the pdf of $T$ is symmetric about 0. Thus, the median of $T$ is 0. Upon differentiating $g_{1}(t)$ , it follows that the unique maximum of the pdf occurs at 0 and that the derivative is continuous. So, the pdf is mound shaped. As the degrees of freedom approach $\infty$ , the $t$ -distribution converges to the $N(0,1)$ distribution; see Example 5.2.3 of Chapter 5.

The R command $\mathfrak{pt}(\mathfrak{t},\mathfrak{r})$ computes the probability $P(T\leq t)$ when $T$ has a $t$ -distribution with $r$ degrees of freedom. For instance, the probability that a $t$ -distributed random variable with 15 degrees of freedom is less than 2.0 is computed

as pt(2.0,15), while the command qt(.975,15) returns the 97.5th percentile of this distribution. The R code t=seq(-4,4,.01) followed by plot(dt(t,3)^t) yields a plot of the $t$ -pdf with 3 degrees of freedom.

Before the age of modern computing, tables of the distribution of $T$ were used. Because the pdf of $T$ does depend on its degrees of freedom $r$ , the usual $t$ -table gives selected quantiles versus degrees of freedom. Table III in Appendix D is such a table. The following three lines of R code, however, produce this table.

$$
p s = c (. 9,.. 9 2 5,.. 9 5 0,.. 9 7 5,.. 9 9,.. 9 9 5,.. 9 9 9); d f = 1: 3 0; t a b = c ()
$$

$$
f o r (r i n d f) \{t a b = r b i n d (t a b, q t (p s, r)) \}; d f = c (d f, I n f); n q = q n o r m (p s)
$$

$$
\text {t a b} = \text {r b i n d} (\text {t a b}, \text {n q}); \text {t a b} = \text {c b i n d} (\text {d f}, \text {t a b})
$$

This code is the body of the R function ttable found at the site listed in the Preface. Due to the fact that $t$ -distribution converges to the $N(0,1)$ distribution, only the degrees of freedom from 1 to 30 are used in such tables. This is, also, the reason that the last line in the table are the standard normal quantiles.

Remark 3.6.1. The $t$ -distribution was first discovered by W. S. Gosset when he was working for an Irish brewery. Gosset published under the pseudonym Student. Thus this distribution is often known as Student's $t$ -distribution.

Example 3.6.1 (Mean and Variance of the $t$ -Distribution). Let the random variable $T$ have a $t$ -distribution with $r$ degrees of freedom. Then, as in (3.6.1), we can write $T = W(V / r)^{-1 / 2}$ , where $W$ has a $N(0,1)$ distribution, $V$ has a $\chi^2(r)$ distribution, and $W$ and $V$ are independent random variables. Independence of $W$ and $V$ and expression (3.3.8), provided $(r / 2) - (k / 2) > 0$ (i.e., $k < r$ ), implies the following:

$$
\begin{array}{l} E \left(T ^ {k}\right) = E \left[ W ^ {k} \left(\frac {V}{r}\right) ^ {- k / 2} \right] = E \left(W ^ {k}\right) E \left[ \left(\frac {V}{r}\right) ^ {- k / 2} \right] (3.6.3) \\ = E \left(W ^ {k}\right) \frac {2 ^ {- k / 2} \Gamma \left(\frac {r}{2} - \frac {k}{2}\right)}{\Gamma \left(\frac {r}{2}\right) r ^ {- k / 2}} \text {i f} k <   r. (3.6.4) \\ \end{array}
$$

Because $E(W) = 0$ , the mean of $T$ is 0, as long as the degrees of freedom of $T$ exceed 1. For the variance, use $k = 2$ in expression (3.6.4). In this case the condition $r > k$ becomes $r > 2$ . Since $E(W^2) = 1$ , by expression (3.6.4), the variance of $T$ is given by

$$
\operatorname {V a r} (T) = E \left(T ^ {2}\right) = \frac {r}{r - 2}. \tag {3.6.5}
$$

Therefore, a $t$ -distribution with $r > 2$ degrees of freedom has a mean of 0 and a variance of $r / (r - 2)$ .

# 3.6.2 The $F$ -distribution

Next consider two independent chi-square random variables $U$ and $V$ having $r_1$ and $r_2$ degrees of freedom, respectively. The joint pdf $h(u,v)$ of $U$ and $V$ is then

$$
h (u, v) = \left\{ \begin{array}{l l} \frac {1}{\Gamma (r _ {1} / 2) \Gamma (r _ {2} / 2) 2 ^ {(r _ {1} + r _ {2}) / 2}} u ^ {r _ {1} / 2 - 1} v ^ {r _ {2} / 2 - 1} e ^ {- (u + v) / 2} & 0 <   u, v <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

We define the new random variable

$$
W = \frac {U / r _ {1}}{V / r _ {2}}
$$

and we propose finding the pdf $g_{1}(w)$ of $W$ . The equations

$$
w = \frac {u / r _ {1}}{v / r _ {2}}, z = v,
$$

define a one-to-one transformation that maps the set $\mathcal{S} = \{(u,v):0 < u < \infty, 0 < v < \infty\}$ onto the set $\mathcal{T} = \{(w,z):0 < w < \infty, 0 < z < \infty\}$ . Since $u = (r_1 / r_2)zw$ , $v = z$ , the absolute value of the Jacobian of the transformation is $|J| = (r_1 / r_2)z$ . The joint pdf $g(w,z)$ of the random variables $W$ and $Z = V$ is then

$$
g (w, z) = \frac {1}{\Gamma (r _ {1} / 2) \Gamma (r _ {2} / 2) 2 ^ {(r _ {1} + r _ {2}) / 2}} \left(\frac {r _ {1} z w}{r _ {2}}\right) ^ {\frac {r _ {1} - 2}{2}} z ^ {\frac {r _ {2} - 2}{2}} \exp \left[ - \frac {z}{2} \left(\frac {r _ {1} w}{r _ {2}} + 1\right) \right] \frac {r _ {1} z}{r _ {2}},
$$

provided that $(w,z)\in \mathcal{T}$ , and zero elsewhere. The marginal pdf $g_{1}(w)$ of $W$ is then

$$
\begin{array}{l} g _ {1} (w) = \int_ {- \infty} ^ {\infty} g (w, z) d z \\ = \int_ {0} ^ {\infty} \frac {(r _ {1} / r _ {2}) ^ {r _ {1} / 2} (w) ^ {r _ {1} / 2 - 1}}{\Gamma (r _ {1} / 2) \Gamma (r _ {2} / 2) 2 ^ {(r _ {1} + r _ {2}) / 2}} z ^ {(r _ {1} + r _ {2}) / 2 - 1} \exp \left[ - \frac {z}{2} \left(\frac {r _ {1} w}{r _ {2}} + 1\right) \right] d z. \\ \end{array}
$$

If we change the variable of integration by writing

$$
y = \frac {z}{2} \left(\frac {r _ {1} w}{r _ {2}} + 1\right),
$$

it can be seen that

$$
\begin{array}{l} g _ {1} (w) = \int_ {0} ^ {\infty} \frac {\left(r _ {1} / r _ {2}\right) ^ {r _ {1} / 2} (w) ^ {r _ {1} / 2 - 1}}{\Gamma \left(r _ {1} / 2\right) \Gamma \left(r _ {2} / 2\right) 2 ^ {\left(r _ {1} + r _ {2}\right) / 2}} \left(\frac {2 y}{r _ {1} w / r _ {2} + 1}\right) ^ {\left(r _ {1} + r _ {2}\right) / 2 - 1} e ^ {- y} \\ \times \left(\frac {2}{r _ {1} w / r _ {2} + 1}\right) d y \\ = \left\{ \begin{array}{l l} \frac {\Gamma [ (r _ {1} + r _ {2}) / 2 ] \left(r _ {1} / r _ {2}\right) ^ {r _ {1} / 2}}{\Gamma (r _ {1} / 2) \Gamma (r _ {2} / 2)} \frac {w ^ {r _ {1} / 2 - 1}}{(1 + r _ {1} w / r _ {2}) ^ {(r _ {1} + r _ {2}) / 2}} & 0 <   w <   \infty \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.6.6} \\ \end{array}
$$

Accordingly, if $U$ and $V$ are independent chi-square variables with $r_1$ and $r_2$ degrees of freedom, respectively, then $W = (U / r_1) / (V / r_2)$ has the pdf $g_1(w)$ , (3.6.6). The distribution of this random variable is usually called an $F$ -distribution; and we often call the ratio, which we have denoted by $W$ , $F$ . That is,

$$
F = \frac {U / r _ {1}}{V / r _ {2}}. \tag {3.6.7}
$$

It should be observed that an $F$ -distribution is completely determined by the two parameters $r_1$ and $r_2$ .

In terms of R computation, the command pf(2.50,3,8) computes to the value 0.8665 which is the probability $P(F \leq 2.50)$ when $F$ has the $F$ -distribution with 3 and 8 degrees of freedom. The 95th percentile of $F$ is qf(.95,3,8) = 4.066 and the code x=seq(.01,5,.01); plot(df(x,3,8)^x) draws a plot of the pdf of this $F$ random variable. Note that the pdf is right-skewed. Before the age of modern computation, tables of the quantiles of $F$ -distributions for selected probabilities and degrees of freedom were used. Table IV in Appendix D displays the 95th and 99th quantiles for selected degrees of freedom. Besides its use in statistics, the $F$ -distribution is used to model lifetime data; see Exercise 3.6.13.

Example 3.6.2 (Moments of $F$ -Distributions). Let $F$ have an $F$ -distribution with $r_1$ and $r_2$ degrees of freedom. Then, as in expression (3.6.7), we can write $F = (r_2 / r_1)(U / V)$ , where $U$ and $V$ are independent $\chi^2$ random variables with $r_1$ and $r_2$ degrees of freedom, respectively. Hence, for the $k$ th moment of $F$ , by independence we have

$$
E \left(F ^ {k}\right) = \left(\frac {r _ {2}}{r _ {1}}\right) ^ {k} E \left(U ^ {k}\right) E \left(V ^ {- k}\right),
$$

provided, of course, that both expectations on the right side exist. By Theorem 3.3.2, because $k > -(r_1 / 2)$ is always true, the first expectation always exists. The second expectation, however, exists if $r_2 > 2k$ ; i.e., the denominator degrees of freedom must exceed twice $k$ . Assuming this is true, it follows from (3.3.8) that the mean of $F$ is given by

$$
E (F) = \frac {r _ {2}}{r _ {1}} r _ {1} \frac {2 ^ {- 1} \Gamma \left(\frac {r _ {2}}{2} - 1\right)}{\Gamma \left(\frac {r _ {2}}{2}\right)} = \frac {r _ {2}}{r _ {2} - 2}. \tag {3.6.8}
$$

If $r_2$ is large, then $E(F)$ is about 1. In Exercise 3.6.7, a general expression for $E(F^k)$ is derived.

# 3.6.3 Student's Theorem

Our final note in this section concerns an important result for the later chapters on inference for normal random variables. It is a corollary to the $t$ -distribution derived above and is often referred to as Student's Theorem.

Theorem 3.6.1. Let $X_1, \ldots, X_n$ be iid random variables each having a normal distribution with mean $\mu$ and variance $\sigma^2$ . Define the random variables

$$
\overline {{X}} = \frac {1}{n} \sum_ {i = 1} ^ {n} X _ {i} a n d S ^ {2} = \frac {1}{n - 1} \sum_ {i = 1} ^ {n} (X _ {i} - \overline {{X}}) ^ {2}.
$$

Then

(a) $\overline{X}$ has a $N\left(\mu ,\frac{\sigma^2}{n}\right)$ distribution.   
(b) $\overline{X}$ and $S^2$ are independent.   
(c) $(n - 1)S^2 /\sigma^2$ has a $\chi^2 (n - 1)$ distribution.

(d) The random variable

$$
T = \frac {\bar {X} - \mu}{S / \sqrt {n}} \tag {3.6.9}
$$

has a Student $t$ -distribution with $n - 1$ degrees of freedom.

Proof: Note that we have proved part (a) in Corollary 3.4.1. Let $\mathbf{X} = (X_1, \ldots, X_n)'$ . Because $X_1, \ldots, X_n$ are iid $N(\mu, \sigma^2)$ random variables, $\mathbf{X}$ has a multivariate normal distribution $N(\mu \mathbf{1}, \sigma^2 \mathbf{I})$ , where $\mathbf{1}$ denotes a vector whose components are all 1. Let $\mathbf{v}' = (1/n, \ldots, 1/n) = (1/n) \mathbf{1}'$ . Note that $\overline{X} = \mathbf{v}' \mathbf{X}$ . Define the random vector $\mathbf{Y}$ by $\mathbf{Y} = (X_1 - \overline{X}, \ldots, X_n - \overline{X})'$ . Consider the following transformation:

$$
\mathbf {W} = \left[ \begin{array}{c} \overline {{X}} \\ \mathbf {Y} \end{array} \right] = \left[ \begin{array}{c} \mathbf {v} ^ {\prime} \\ \mathbf {I} - \mathbf {1 v} ^ {\prime} \end{array} \right] \mathbf {X}. \tag {3.6.10}
$$

Because $\mathbf{W}$ is a linear transformation of multivariate normal random vector, by Theorem 3.5.2 it has a multivariate normal distribution with mean

$$
E \left[ \mathbf {W} \right] = \left[ \begin{array}{c} \mathbf {v} ^ {\prime} \\ \mathbf {I} - \mathbf {1 v} ^ {\prime} \end{array} \right] \mu \mathbf {1} = \left[ \begin{array}{c} \mu \\ \mathbf {0} _ {n} \end{array} \right], \tag {3.6.11}
$$

where $\mathbf{0}_n$ denotes a vector whose components are all 0, and covariance matrix

$$
\begin{array}{l} \Sigma = \left[ \begin{array}{c} \mathbf {v} ^ {\prime} \\ \mathbf {I} - \mathbf {1 v} ^ {\prime} \end{array} \right] \sigma^ {2} \mathbf {I} \left[ \begin{array}{c} \mathbf {v} ^ {\prime} \\ \mathbf {I} - \mathbf {1 v} ^ {\prime} \end{array} \right] ^ {\prime} \\ = \sigma^ {2} \left[ \begin{array}{c c} \frac {1}{n} & \mathbf {0} _ {n} ^ {\prime} \\ \mathbf {0} _ {n} & \mathbf {I} - \mathbf {1 v} ^ {\prime} \end{array} \right]. \tag {3.6.12} \\ \end{array}
$$

Because $\overline{X}$ is the first component of $\mathbf{W}$ , we can also obtain part (a) by Theorem 3.5.1. Next, because the covariances are 0, $\overline{X}$ is independent of $\mathbf{Y}$ . But $S^2 = (n - 1)^{-1}\mathbf{Y}'\mathbf{Y}$ . Hence, $\overline{X}$ is independent of $S^2$ , also. Thus part (b) is true.

Consider the random variable

$$
V = \sum_ {i = 1} ^ {n} \left(\frac {X _ {i} - \mu}{\sigma}\right) ^ {2}.
$$

Each term in this sum is the square of a $N(0,1)$ random variable and, hence, has a $\chi^2 (1)$ distribution (Theorem 3.4.1). Because the summands are independent, it follows from Corollary 3.3.1 that $V$ is a $\chi^2 (n)$ random variable. Note the following identity:

$$
\begin{array}{l} V = \sum_ {i = 1} ^ {n} \left(\frac {\left(X _ {i} - \bar {X}\right) + (\bar {X} - \mu)}{\sigma}\right) ^ {2} \\ = \sum_ {i = 1} ^ {n} \left(\frac {X _ {i} - \bar {X}}{\sigma}\right) ^ {2} + \left(\frac {\bar {X} - \mu}{\sigma / \sqrt {n}}\right) ^ {2} \\ = \frac {(n - 1) S ^ {2}}{\sigma^ {2}} + \left(\frac {\bar {X} - \mu}{\sigma / \sqrt {n}}\right) ^ {2}. \tag {3.6.13} \\ \end{array}
$$

By part (b), the two terms on the right side of the last equation are independent. Further, the second term is the square of a standard normal random variable and, hence, has a $\chi^2(1)$ distribution. Taking mgfs of both sides, we have

$$
(1 - 2 t) ^ {- n / 2} = E \left[ \exp \{t (n - 1) S ^ {2} / \sigma^ {2} \} \right] (1 - 2 t) ^ {- 1 / 2}. \tag {3.6.14}
$$

Solving for the mgf of $(n - 1)S^2 /\sigma^2$ on the right side we obtain part (c). Finally, part (d) follows immediately from parts (a)-(c) upon writing $T$ , (3.6.9), as

$$
T = \frac {(\bar {X} - \mu) / (\sigma / \sqrt {n})}{\sqrt {(n - 1) S ^ {2} / (\sigma^ {2} (n - 1))}}.
$$

# EXERCISES

3.6.1. Let $T$ have a $t$ -distribution with 10 degrees of freedom. Find $P(|T| > 2.228)$ from either Table III or by using R.

3.6.2. Let $T$ have a $t$ -distribution with 14 degrees of freedom. Determine $b$ so that $P(-b < T < b) = 0.90$ . Use either Table III or by using R.

3.6.3. Let $T$ have a $t$ -distribution with $r > 4$ degrees of freedom. Use expression (3.6.4) to determine the kurtosis of $T$ . See Exercise 1.9.15 for the definition of kurtosis.

3.6.4. Using R, plot the pdfs of the random variables defined in parts (a)-(e) below. Obtain an overlay plot of all five pdfs, also.

(a) $X$ has a standard normal distribution. Use this code: $\mathbf{x} = \operatorname{seq}(-6, 6, .01)$ ; plot(dnorm(x)~x).   
(b) $X$ has a $t$ -distribution with 1 degree of freedom. Use the code: lines $(\mathrm{dt}(\mathbf{x},1)\sim \mathbf{x},1\mathrm{ty} = 2)$ .   
(c) $X$ has a $t$ -distribution with 3 degrees of freedom.   
(d) $X$ has a $t$ -distribution with 10 degrees of freedom.   
(e) $X$ has a $t$ -distribution with 30 degrees of freedom.

3.6.5. Using R, investigate the probabilities of an "outlier" for a $t$ -random variable and a normal random variable. Specifically, determine the probability of observing the event $\{|X| \geq 2\}$ for the following random variables:

(a) $X$ has a standard normal distribution.   
(b) $X$ has a $t$ -distribution with 1 degree of freedom.   
(c) $X$ has a $t$ -distribution with 3 degrees of freedom.   
(d) $X$ has a $t$ -distribution with 10 degrees of freedom.

(e) $X$ has a $t$ -distribution with 30 degrees of freedom.

3.6.6. In expression (3.4.13), the normal location model was presented. Often real data, though, have more outliers than the normal distribution allows. Based on Exercise 3.6.5, outliers are more probable for $t$ -distributions with small degrees of freedom. Consider a location model of the form

$$
X = \mu + e,
$$

where $e$ has a $t$ -distribution with 3 degrees of freedom. Determine the standard deviation $\sigma$ of $X$ and then find $P(|X - \mu| \geq \sigma)$ .

3.6.7. Let $F$ have an $F$ -distribution with parameters $r_1$ and $r_2$ . Assuming that $r_2 > 2k$ , continue with Example 3.6.2 and derive the $E(F^k)$ .   
3.6.8. Let $F$ have an $F$ -distribution with parameters $r_1$ and $r_2$ . Using the results of the last exercise, determine the kurtosis of $F$ , assuming that $r_2 > 8$ .   
3.6.9. Let $F$ have an $F$ -distribution with parameters $r_1$ and $r_2$ . Argue that $1 / F$ has an $F$ -distribution with parameters $r_2$ and $r_1$ .   
3.6.10. Suppose $F$ has an $F$ -distribution with parameters $r_1 = 5$ and $r_2 = 10$ . Using only 95th percentiles of $F$ -distributions, find $a$ and $b$ so that $P(F \leq a) = 0.05$ and $P(F \leq b) = 0.95$ , and, accordingly, $P(a < F < b) = 0.90$ .

Hint: Write $P(F \leq a) = P(1 / F \geq 1 / a) = 1 - P(1 / F \leq 1 / a)$ , and use the result of Exercise 3.6.9 and R.

3.6.11. Let $T = W / \sqrt{V / r}$ , where the independent variables $W$ and $V$ are, respectively, normal with mean zero and variance 1 and chi-square with $r$ degrees of freedom. Show that $T^2$ has an $F$ -distribution with parameters $r_1 = 1$ and $r_2 = r$ . Hint: What is the distribution of the numerator of $T^2$ ?

3.6.12. Show that the $t$ -distribution with $r = 1$ degree of freedom and the Cauchy distribution are the same.

3.6.13. Let $F$ have an $F$ -distribution with $2r$ and $2s$ degrees of freedom. Since the support of $F$ is $(0, \infty)$ , the $F$ -distribution is often used to model time until failure (lifetime). In this case, $Y = \log F$ is used to model the log of lifetime. The log $F$ family is a rich family of distributions consisting of left- and right-skewed distributions as well as symmetric distributions; see, for example, Chapter 4 of Hettmansperger and McKean (2011). In this exercise, consider the subfamily where $Y = \log F$ and $F$ has 2 and $2s$ degrees of freedom.

(a) Obtain the pdf and cdf of $Y$ .   
(b) Using R, obtain a page of plots of these distributions for $s = .4, .6, 1.0, 2.0, 4.0, 8$ . Comment on the shape of each pdf.   
(c) For $s = 1$ , this distribution is called the logistic distribution. Show that the pdf is symmetric about 0.

# 3.6.14. Show that

$$
Y = \frac {1}{1 + (r _ {1} / r _ {2}) W},
$$

where $W$ has an $F$ -distribution with parameters $r_1$ and $r_2$ , has a beta distribution.

3.6.15. Let $X_{1}$ , $X_{2}$ be iid with common distribution having the pdf $f(x) = e^{-x}$ , $0 < x < \infty$ , zero elsewhere. Show that $Z = X_{1} / X_{2}$ has an $F$ -distribution.

3.6.16. Let $X_{1}$ , $X_{2}$ , and $X_{3}$ be three independent chi-square variables with $r_{1}$ , $r_{2}$ , and $r_{3}$ degrees of freedom, respectively.

(a) Show that $Y_{1} = X_{1} / X_{2}$ and $Y_{2} = X_{1} + X_{2}$ are independent and that $Y_{2}$ is $\chi^2 (r_1 + r_2)$ .

(b) Deduce that

$$
\frac {X _ {1} / r _ {1}}{X _ {2} / r _ {2}} \quad \text {a n d} \quad \frac {X _ {3} / r _ {3}}{(X _ {1} + X _ {2}) / (r _ {1} + r _ {2})}
$$

are independent $F$ -variables.

# 3.7 *Mixture Distributions

Recall the discussion on the contaminated normal distribution given in Section 3.4.1. This was an example of a mixture of normal distributions. In this section, we extend this to mixtures of distributions in general. Generally, we use continuous-type notation for the discussion, but discrete pmfs can be handled the same way.

Suppose that we have $k$ distributions with respective pdfs $f_{1}(x), f_{2}(x), \ldots, f_{k}(x)$ with supports $\mathcal{S}_1, \mathcal{S}_2, \ldots, \mathcal{S}_k$ , means $\mu_1, \mu_2, \ldots, \mu_k$ , and variances $\sigma_1^2, \sigma_2^2, \ldots, \sigma_k^2$ , with positive mixing probabilities $p_1, p_2, \ldots, p_k$ , where $p_1 + p_2 + \dots + p_k = 1$ . Let $\mathcal{S} = \cup_{i=1}^{k} \mathcal{S}_i$ and consider the function

$$
f (x) = p _ {1} f _ {1} (x) + p _ {2} f _ {2} (x) + \dots + p _ {k} f _ {k} (x) = \sum_ {i = 1} ^ {k} p _ {i} f _ {i} (x), \quad x \in \mathcal {S}. \tag {3.7.1}
$$

Note that $f(x)$ is nonnegative and it is easy to see that it integrates to one over $(-\infty, \infty)$ ; hence, $f(x)$ is a pdf for some continuous-type random variable $X$ . Integrating term-by-term, it follows that the cdf of $X$ is:

$$
F (x) = \sum_ {i = 1} ^ {k} p _ {i} F _ {i} (x), \quad x \in \mathcal {S}, \tag {3.7.2}
$$

where $F_{i}(x)$ is the cdf corresponding to the pdf $f_{i}(x)$ . The mean of $X$ is given by

$$
E (X) = \sum_ {i = 1} ^ {k} p _ {i} \int_ {- \infty} ^ {\infty} x f _ {i} (x) d x = \sum_ {i = 1} ^ {k} p _ {i} \mu_ {i} = \bar {\mu}, \tag {3.7.3}
$$

a weighted average of $\mu_1, \mu_2, \ldots, \mu_k$ , and the variance equals

$$
\begin{array}{l} \operatorname {v a r} (X) = \sum_ {i = 1} ^ {k} p _ {i} \int_ {- \infty} ^ {\infty} (x - \bar {\mu}) ^ {2} f _ {i} (x) d x \\ = \sum_ {i = 1} ^ {k} p _ {i} \int_ {- \infty} ^ {\infty} [ (x - \mu_ {i}) + (\mu_ {i} - \bar {\mu}) ] ^ {2} f _ {i} (x) d x \\ = \sum_ {i = 1} ^ {k} p _ {i} \int_ {- \infty} ^ {\infty} (x - \mu_ {i}) ^ {2} f _ {i} (x) d x + \sum_ {i = 1} ^ {k} p _ {i} (\mu_ {i} - \bar {\mu}) ^ {2} \int_ {- \infty} ^ {\infty} f _ {i} (x) d x, \\ \end{array}
$$

because the cross-product terms integrate to zero. That is,

$$
\operatorname {v a r} (X) = \sum_ {i = 1} ^ {k} p _ {i} \sigma_ {i} ^ {2} + \sum_ {i = 1} ^ {k} p _ {i} \left(\mu_ {i} - \bar {\mu}\right) ^ {2}. \tag {3.7.4}
$$

Note that the variance is not simply the weighted average of the $k$ variances, but it also includes a positive term involving the weighted variance of the means.

Remark 3.7.1. It is extremely important to note these characteristics are associated with a mixture of $k$ distributions and have nothing to do with a linear combination, say $\sum a_{i}X_{i}$ , of $k$ random variables.

For the next example, we need the following distribution. We say that $X$ has a loggamma pdf with parameters $\alpha > 0$ and $\beta > 0$ if it has pdf

$$
f _ {1} (x) = \left\{ \begin{array}{l l} \frac {1}{\Gamma (\alpha) \beta^ {\alpha}} x ^ {- (1 + \beta) / \beta} (\log x) ^ {\alpha - 1} & x > 1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.7.5}
$$

The derivation of this pdf is given in Exercise 3.7.1, where its mean and variance are also derived. We denote this distribution of $X$ by $\log \Gamma (\alpha ,\beta)$

Example 3.7.1. Actuaries have found that a mixture of the loggamma and gamma distributions is an important model for claim distributions. Suppose, then, that $X_{1}$ is $\log \Gamma(\alpha_{1},\beta_{1})$ , $X_{2}$ is $\Gamma(\alpha_{2},\beta_{2})$ , and the mixing probabilities are $p$ and $(1 - p)$ . Then the pdf of the mixture distribution is

$$
f (x) = \left\{ \begin{array}{l l} \frac {1 - p}{\beta_ {2} ^ {\alpha_ {2}} \Gamma (\alpha_ {2})} x ^ {\alpha_ {2} - 1} e ^ {- x / \beta_ {2}} & 0 <   x \leq 1 \\ \frac {p}{\beta_ {1} ^ {\alpha_ {1}} \Gamma (\alpha_ {1})} (\log x) ^ {\alpha_ {1} - 1} x ^ {- (\beta_ {1} + 1) / \beta_ {1}} + \frac {1 - p}{\beta_ {2} ^ {\alpha_ {2}} \Gamma (\alpha_ {2})} x ^ {\alpha_ {2} - 1} e ^ {- x / \beta_ {2}} & 1 <   x \\ 0 & \text {e l s e w h e r e .} \end{array} \right. \tag {3.7.6}
$$

Provided $\beta_{1} < 2^{-1}$ , the mean and the variance of this mixture distribution are

$$
\mu = p \left(1 - \beta_ {1}\right) ^ {- \alpha_ {1}} + (1 - p) \alpha_ {2} \beta_ {2} \tag {3.7.7}
$$

$$
\begin{array}{l} \sigma^ {2} = p \left[ (1 - 2 \beta_ {1}) ^ {- \alpha_ {1}} - (1 - \beta_ {1}) ^ {- 2 \alpha_ {1}} \right] \\ + (1 - p) \alpha_ {2} \beta_ {2} ^ {2} + p (1 - p) \left[ \left(1 - \beta_ {1}\right) ^ {- \alpha_ {1}} - \alpha_ {2} \beta_ {2} \right] ^ {2}; \tag {3.7.8} \\ \end{array}
$$

see Exercise 3.7.3.

The mixture of distributions is sometimes called compounding. Moreover, it does not need to be restricted to a finite number of distributions. As demonstrated in the following example, a continuous weighting function, which is of course a pdf, can replace $p_1, p_2, \ldots, p_k$ ; i.e., integration replaces summation.

Example 3.7.2. Let $X_{\theta}$ be a Poisson random variable with parameter $\theta$ . We want to mix an infinite number of Poisson distributions, each with a different value of $\theta$ . We let the weighting function be a pdf of $\theta$ , namely, a gamma with parameters $\alpha$ and $\beta$ . For $x = 0,1,2,\ldots$ , the pmf of the compound distribution is

$$
\begin{array}{l} p (x) = \int_ {0} ^ {\infty} \left[ \frac {1}{\beta^ {\alpha} \Gamma (\alpha)} \theta^ {\alpha - 1} e ^ {- \theta / \beta} \right] \left[ \frac {\theta^ {x} e ^ {- \theta}}{x !} \right] d \theta \\ = \frac {1}{\Gamma (\alpha) \beta^ {\alpha} x !} \int_ {0} ^ {\infty} \theta^ {\alpha + x - 1} e ^ {- \theta (1 + \beta) / \beta} d \theta \\ = \frac {\Gamma (\alpha + x) \beta^ {x}}{\Gamma (\alpha) x ! (1 + \beta) ^ {\alpha + x}}, \\ \end{array}
$$

where the third line follows from the change of variable $t = \theta (1 + \beta) / \beta$ to solve the integral of the second line.

An interesting case of this compound occurs when $\alpha = r$ , a positive integer, and $\beta = (1 - p) / p$ , where $0 < p < 1$ . In this case the pmf becomes

$$
p (x) = \frac {(r + x - 1) !}{(r - 1) !} \frac {p ^ {r} (1 - p) ^ {x}}{x !}, \quad x = 0, 1, 2, \dots .
$$

That is, this compound distribution is the same as that of the number of excess trials needed to obtain $r$ successes in a sequence of independent trials, each with probability $p$ of success; this is one form of the negative binomial distribution. The negative binomial distribution has been used successfully as a model for the number of accidents (see Weber, 1971).

In compounding, we can think of the original distribution of $X$ as being a conditional distribution given $\theta$ , whose pdf is denoted by $f(x|\theta)$ . Then the weighting function is treated as a pdf for $\theta$ , say $g(\theta)$ . Accordingly, the joint pdf is $f(x|\theta)g(\theta)$ , and the compound pdf can be thought of as the marginal (unconditional) pdf of $X$ ,

$$
h (x) = \int_ {\theta} g (\theta) f (x | \theta) d \theta ,
$$

where a summation replaces integration in case $\theta$ has a discrete distribution. For illustration, suppose we know that the mean of the normal distribution is zero but the variance $\sigma^2$ equals $1 / \theta > 0$ , where $\theta$ has been selected from some random model. For convenience, say this latter is a gamma distribution with parameters $\alpha$ and $\beta$ . Thus, given that $\theta$ , $X$ is conditionally $N(0,1 / \theta)$ so that the joint distribution of $X$ and $\theta$ is

$$
f (x | \theta) g (\theta) = \left[ \frac {\sqrt {\theta}}{\sqrt {2 \pi}} \exp \left(\frac {- \theta x ^ {2}}{2}\right) \right] \left[ \frac {1}{\beta^ {\alpha} \Gamma (\alpha)} \theta^ {\alpha - 1} \exp (- \theta / \beta) \right],
$$

for $-\infty < x < \infty$ , $0 < \theta < \infty$ . Therefore, the marginal (unconditional) pdf $h(x)$ of $X$ is found by integrating out $\theta$ ; that is,

$$
h (x) = \int_ {0} ^ {\infty} \frac {\theta^ {\alpha + 1 / 2 - 1}}{\beta^ {\alpha} \sqrt {2 \pi} \Gamma (\alpha)} \exp \left[ - \theta \left(\frac {x ^ {2}}{2} + \frac {1}{\beta}\right) \right] d \theta .
$$

By comparing this integrand with a gamma pdf with parameters $\alpha +\frac{1}{2}$ and $[(1 / \beta) + (x^2 /2)]^{-1}$ , we see that the integral equals

$$
h (x) = \frac {\Gamma (\alpha + \frac {1}{2})}{\beta^ {\alpha} \sqrt {2 \pi} \Gamma (\alpha)} \left(\frac {2 \beta}{2 + \beta x ^ {2}}\right) ^ {\alpha + 1 / 2}, - \infty <   x <   \infty .
$$

It is interesting to note that if $\alpha = r / 2$ and $\beta = 2 / r$ , where $r$ is a positive integer, then $X$ has an unconditional distribution, which is Student's $t$ , with $r$ degrees of freedom. That is, we have developed a generalization of Student's distribution through this type of mixing or compounding. We note that the resulting distribution (a generalization of Student's $t$ ) has much thicker tails than those of the conditional normal with which we started.

The next two examples offer two additional illustrations of this type of compounding.

Example 3.7.3. Suppose that we have a binomial distribution, but we are not certain about the probability $p$ of success on a given trial. Suppose $p$ has been selected first by some random process that has a beta pdf with parameters $\alpha$ and $\beta$ . Thus $X$ , the number of successes on $n$ independent trials, has a conditional binomial distribution so that the joint pdf of $X$ and $p$ is

$$
p (x | p) g (p) = \frac {n !}{x ! (n - x) !} p ^ {x} (1 - p) ^ {n - x} \frac {\Gamma (\alpha + \beta)}{\Gamma (\alpha) \Gamma (\beta)} p ^ {\alpha - 1} (1 - p) ^ {\beta - 1},
$$

for $x = 0,1,\ldots ,n$ , $0 < p < 1$ . Therefore, the unconditional pmf of $X$ is given by the integral

$$
\begin{array}{l} h (x) = \int_ {0} ^ {1} \frac {n ! \Gamma (\alpha + \beta)}{x ! (n - x) ! \Gamma (\alpha) \Gamma (\beta)} p ^ {x + \alpha - 1} (1 - p) ^ {n - x + \beta - 1} d p \\ = \frac {n ! \Gamma (\alpha + \beta) \Gamma (x + \alpha) \Gamma (n - x + \beta)}{x ! (n - x) ! \Gamma (\alpha) \Gamma (\beta) \Gamma (n + \alpha + \beta)}, \quad x = 0, 1, 2, \dots , n. \\ \end{array}
$$

Now suppose $\alpha$ and $\beta$ are positive integers; since $\Gamma(k) = (k - 1)!$ , this unconditional (marginal or compound) pdf can be written

$$
h (x) = \frac {n ! (\alpha + \beta - 1) ! (x + \alpha - 1) ! (n - x + \beta - 1) !}{x ! (n - x) ! (\alpha - 1) ! (\beta - 1) ! (n + \alpha + \beta - 1) !}, \quad x = 0, 1, 2, \dots , n.
$$

Because the conditional mean $E(X|p) = np$ , the unconditional mean is $n\alpha / (\alpha + \beta)$ since $E(p)$ equals the mean $\alpha / (\alpha + \beta)$ of the beta distribution.

Example 3.7.4. In this example, we develop by compounding a heavy-tailed skewed distribution. Assume $X$ has a conditional gamma pdf with parameters $k$ and $\theta^{-1}$ . The weighting function for $\theta$ is a gamma pdf with parameters $\alpha$ and $\beta$ . Thus the unconditional (marginal or compounded) pdf of $X$ is

$$
\begin{array}{l} { h ( x ) } { = } { \int _ { 0 } ^ { \infty } \left[ \frac { \theta ^ { \alpha - 1 } e ^ { - \theta / \beta } } { \beta ^ { \alpha } \Gamma ( \alpha ) } \right] \left[ \frac { \theta ^ { k } x ^ { k - 1 } e ^ { - \theta x } } { \Gamma ( k ) } \right] d \theta } \\ = \int_ {0} ^ {\infty} \frac {x ^ {k - 1} \theta^ {\alpha + k - 1}}{\beta^ {\alpha} \Gamma (\alpha) \Gamma (k)} e ^ {- \theta (1 + \beta x) / \beta} d \theta . \\ \end{array}
$$

Comparing this integrand to the gamma pdf with parameters $\alpha + k$ and $\beta / (1 + \beta x)$ , we see that

$$
h (x) = \frac {\Gamma (\alpha + k) \beta^ {k} x ^ {k - 1}}{\Gamma (\alpha) \Gamma (k) (1 + \beta x) ^ {\alpha + k}}, 0 <   x <   \infty ,
$$

which is the pdf of the generalized Pareto distribution (and a generalization of the $F$ distribution). Of course, when $k = 1$ (so that $X$ has a conditional exponential distribution), the pdf is

$$
h (x) = \alpha \beta (1 + \beta x) ^ {- (\alpha + 1)}, \quad 0 <   x <   \infty ,
$$

which is the Pareto pdf. Both of these compound pdfs have thicker tails than the original (conditional) gamma distribution.

While the cdf of the generalized Pareto distribution cannot be expressed in a simple closed form, that of the Pareto distribution is

$$
H (x) = \int_ {0} ^ {x} \alpha \beta (1 + \beta t) ^ {- (\alpha + 1)} d t = 1 - (1 + \beta x) ^ {- \alpha}, 0 \leq x <   \infty .
$$

From this, we can create another useful long-tailed distribution by letting $X = Y^{\tau}$ , $0 < \tau$ . Thus $Y$ has the cdf

$$
G (y) = P (Y \leq y) = P \left[ X ^ {1 / \tau} \leq y \right] = P \left[ X \leq y ^ {\tau} \right].
$$

Hence, this probability is equal to

$$
G (y) = H \left(y ^ {\tau}\right) = 1 - \left(1 + \beta y ^ {\tau}\right) ^ {- \alpha}, \quad 0 <   y <   \infty ,
$$

with corresponding pdf

$$
G ^ {\prime} (y) = g (y) = \frac {\alpha \beta \tau y ^ {\tau - 1}}{(1 + \beta y ^ {\tau}) ^ {\alpha + 1}}, 0 <   y <   \infty .
$$

We call the associated distribution the transformed Pareto distribution or the Burr distribution (Burr, 1942), and it has proved to be a useful one in modeling thicker-tailed distributions.

# EXERCISES

3.7.1. Suppose $Y$ has a $\Gamma(\alpha, \beta)$ distribution. Let $X = e^{Y}$ . Show that the pdf of $X$ is given by expression (3.7.5). Determine the cdf of $X$ in terms of the cdf of a $\Gamma$ -distribution. Derive the mean and variance of $X$ .   
3.7.2. Write R functions for the pdf and cdf of the random variable in Exercise 3.7.1.   
3.7.3. In Example 3.7.1, derive the pdf of the mixture distribution given in expression (3.7.6), then obtain its mean and variance as given in expressions (3.7.7) and (3.7.8).   
3.7.4. Using the R function for the pdf in Exercise 3.7.2 and dgamma, write an R function for the mixture pdf (3.7.6). For $\alpha = \beta = 2$ , obtain a page of plots of this density for $p = 0.05, 0.10, 0.15$ and 0.20.   
3.7.5. Consider the mixture distribution $(9 / 10)N(0,1) + (1 / 10)N(0,9)$ . Show that its kurtosis is 8.34.   
3.7.6. Let $X$ have the conditional geometric pmf $\theta (1 - \theta)^{x - 1}$ , $x = 1,2,\ldots$ , where $\theta$ is a value of a random variable having a beta pdf with parameters $\alpha$ and $\beta$ . Show that the marginal (unconditional) pmf of $X$ is

$$
\frac {\Gamma (\alpha + \beta) \Gamma (\alpha + 1) \Gamma (\beta + x - 1)}{\Gamma (\alpha) \Gamma (\beta) \Gamma (\alpha + \beta + x)}, \quad x = 1, 2, \dots .
$$

If $\alpha = 1$ , we obtain

$$
\frac {\beta}{(\beta + x) (\beta + x - 1)}, \quad x = 1, 2, \ldots ,
$$

which is one form of Zipf's law.

3.7.7. Repeat Exercise 3.7.6, letting $X$ have a conditional negative binomial distribution instead of the geometric one.   
3.7.8. Let $X$ have a generalized Pareto distribution with parameters $k$ , $\alpha$ , and $\beta$ . Show, by change of variables, that $Y = \beta X / (1 + \beta X)$ has a beta distribution.   
3.7.9. Show that the failure rate (hazard function) of the Pareto distribution is

$$
\frac {h (x)}{1 - H (x)} = \frac {\alpha}{\beta^ {- 1} + x}.
$$

Find the failure rate (hazard function) of the Burr distribution with cdf

$$
G (y) = 1 - \left(\frac {1}{1 + \beta y ^ {\tau}}\right) ^ {\alpha}, \quad 0 \leq y <   \infty .
$$

In each of these two failure rates, note what happens as the value of the variable increases.

3.7.10. For the Burr distribution, show that

$$
E (X ^ {k}) = \frac {1}{\beta^ {k / \tau}} \left. \Gamma \left(\alpha - \frac {k}{\tau}\right) \Gamma \left(\frac {k}{\tau} + 1\right) \right/ \Gamma (\alpha),
$$

provided $k <   \alpha \tau$

3.7.11. Let the number $X$ of accidents have a Poisson distribution with mean $\lambda \theta$ . Suppose $\lambda$ , the liability to have an accident, has, given $\theta$ , a gamma pdf with parameters $\alpha = h$ and $\beta = h^{-1}$ ; and $\theta$ , an accident proneness factor, has a generalized Pareto pdf with parameters $\alpha$ , $\lambda = h$ , and $k$ . Show that the unconditional pdf of $X$ is

$$
\begin{array}{l} \frac {\Gamma (\alpha + k) \Gamma (\alpha + h) \Gamma (\alpha + h + k) \Gamma (h + k) \Gamma (k + x)}{\Gamma (\alpha) \Gamma (\alpha + k + h) \Gamma (h) \Gamma (k) \Gamma (\alpha + h + k + x) x !}, \quad x = 0, 1, 2, \dots , \end{array}
$$

sometimes called the generalized Waring pmf.

3.7.12. Let $X$ have a conditional Burr distribution with fixed parameters $\beta$ and $\tau$ , given parameter $\alpha$ .

(a) If $\alpha$ has the geometric pmf $p(1 - p)^{\alpha}$ , $\alpha = 0,1,2,\ldots$ , show that the unconditional distribution of $X$ is a Burr distribution.   
(b) If $\alpha$ has the exponential pdf $\beta^{-1}e^{-\alpha/\beta}$ , $\alpha > 0$ , find the unconditional pdf of $X$ .

3.7.13. Let $X$ have the conditional Weibull pdf

$$
f (x | \theta) = \theta \tau x ^ {\tau - 1} e ^ {- \theta x ^ {\tau}}, \quad 0 <   x <   \infty ,
$$

and let the pdf (weighting function) $g(\theta)$ be gamma with parameters $\alpha$ and $\beta$ . Show that the compound (marginal) pdf of $X$ is that of Burr.

3.7.14. If $X$ has a Pareto distribution with parameters $\alpha$ and $\beta$ and if $c$ is a positive constant, show that $Y = cX$ has a Pareto distribution with parameters $\alpha$ and $\beta / c$ .


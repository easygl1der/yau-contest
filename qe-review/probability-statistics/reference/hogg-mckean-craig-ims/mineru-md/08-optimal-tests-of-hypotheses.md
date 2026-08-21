---
title: "Optimal Tests of Hypotheses"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: chapter
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Optimal Tests of Hypotheses

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 7 Sufficiency](./07-sufficiency.md) · [Ch. 9 Normal Linear Models →](./09-inferences-about-normal-linear-models.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Chapter 8

# Optimal Tests of Hypotheses

# 8.1 Most Powerful Tests

In Section 4.5, we introduced the concept of hypotheses testing and followed it with the introduction of likelihood ratio tests in Chapter 6. In this chapter, we discuss certain best tests.

For convenience to the reader, in the next several paragraphs we quickly review concepts of testing that were presented in Section 4.5. We are interested in a random variable $X$ that has pdf or pmf $f(x; \theta)$ , where $\theta \in \Omega$ . We assume that $\theta \in \omega_0$ or $\theta \in \omega_1$ , where $\omega_0$ and $\omega_1$ are disjoint subsets of $\Omega$ and $\omega_0 \cup \omega_1 = \Omega$ . We label the hypotheses as

$$
H _ {0}: \theta \in \omega_ {0} \text {v e r s u s} H _ {1}: \theta \in \omega_ {1}. \tag {8.1.1}
$$

The hypothesis $H_0$ is referred to as the null hypothesis, while $H_1$ is referred to as the alternative hypothesis. The test of $H_0$ versus $H_1$ is based on a sample $X_1, \ldots, X_n$ from the distribution of $X$ . In this chapter, we often use the vector $\mathbf{X}' = (X_1, \ldots, X_n)$ to denote the random sample and $\mathbf{x}' = (x_1, \ldots, x_n)$ to denote the values of the sample. Let $S$ denote the support of the random sample $\mathbf{X}' = (X_1, \ldots, X_n)$ .

A test of $H_0$ versus $H_1$ is based on a subset $C$ of $\mathcal{S}$ . This set $C$ is called the critical region and its corresponding decision rule is

$$
\operatorname {R e j e c t} H _ {0} (\text {A c c e p t} H _ {1}) \quad \text {i f} \mathbf {X} \in C \tag {8.1.2}
$$

$$
\text {R e t a i n} H _ {0} (\text {R e j e c t} H _ {1}) \quad \text {i f} \mathbf {X} \in C ^ {c}.
$$

Note that a test is defined by its critical region. Conversely, a critical region defines a test.

Recall that the $2 \times 2$ decision table, Table 4.5.1, summarizes the results of the hypothesis test in terms of the true state of nature. Besides the correct decisions, two errors can occur. A Type I error occurs if $H_0$ is rejected when it is true, while a Type II error occurs if $H_0$ is accepted when $H_1$ is true. The size or significance

level of the test is the probability of a Type I error; i.e.,

$$
\alpha = \max  _ {\theta \in \omega_ {0}} P _ {\theta} (\mathbf {X} \in C). \tag {8.1.3}
$$

Note that $P_{\theta}(\mathbf{X} \in C)$ should be read as the probability that $\mathbf{X} \in C$ when $\theta$ is the true parameter. Subject to tests having size $\alpha$ , we select tests that minimize Type II error or equivalently maximize the probability of rejecting $H_0$ when $\theta \in \omega_1$ . Recall that the power function of a test is given by

$$
\gamma_ {C} (\theta) = P _ {\theta} (\mathbf {X} \in C); \quad \theta \in \omega_ {1}. \tag {8.1.4}
$$

In Chapter 4, we gave examples of tests of hypotheses, while in Sections 6.3 and 6.4, we discussed tests based on maximum likelihood theory. In this chapter, we want to construct best tests for certain situations.

We begin with testing a simple hypothesis $H_0$ against a simple alternative $H_1$ . Let $f(x; \theta)$ denote the pdf or pmf of a random variable $X$ , where $\theta \in \Omega = \{\theta', \theta''\}$ . Let $\omega_0 = \{\theta'\}$ and $\omega_1 = \{\theta''\}$ . Let $\mathbf{X}' = (X_1, \ldots, X_n)$ be a random sample from the distribution of $X$ . We now define a best critical region (and hence a best test) for testing the simple hypothesis $H_0$ against the alternative simple hypothesis $H_1$ .

Definition 8.1.1. Let $C$ denote a subset of the sample space. Then we say that $C$ is a best critical region of size $\alpha$ for testing the simple hypothesis $H_0: \theta = \theta'$ against the alternative simple hypothesis $H_1: \theta = \theta''$ if

(a) $P_{\theta^{\prime}}[\mathbf{X}\in C] = \alpha$

(b) And for every subset $A$ of the sample space,

$$
P _ {\theta^ {\prime}} [ \mathbf {X} \in A ] = \alpha \Rightarrow P _ {\theta^ {\prime \prime}} [ \mathbf {X} \in C ] \geq P _ {\theta^ {\prime \prime}} [ \mathbf {X} \in A ].
$$

This definition states, in effect, the following: In general, there is a multiplicity of subsets $A$ of the sample space such that $P_{\theta^{\prime}}[\mathbf{X} \in A] = \alpha$ . Suppose that there is one of these subsets, say $C$ , such that when $H_{1}$ is true, the power of the test associated with $C$ is at least as great as the power of the test associated with every other $A$ . Then $C$ is defined as a best critical region of size $\alpha$ for testing $H_{0}$ against $H_{1}$ .

As Theorem 8.1.1 shows, there is a best test for this simple versus simple case. But first, we offer a simple example examining this definition in some detail.

Example 8.1.1. Consider the one random variable $X$ that has a binomial distribution with $n = 5$ and $p = \theta$ . Let $f(x; \theta)$ denote the pmf of $X$ and let $H_0: \theta = \frac{1}{2}$ and $H_1: \theta = \frac{3}{4}$ . The following tabulation gives, at points of positive probability density, the values of $f(x; \frac{1}{2})$ , $f(x; \frac{3}{4})$ , and the ratio $f(x; \frac{1}{2}) / f(x; \frac{3}{4})$ .

<table><tr><td>x</td><td>0</td><td>1</td><td>2</td></tr><tr><td>f(x; 1/2)</td><td>1/32</td><td>5/32</td><td>10/32</td></tr><tr><td>f(x; 3/4)</td><td>1/1024</td><td>15/1024</td><td>90/1024</td></tr><tr><td>f(x; 1/2)/f(x; 3/4)</td><td>32/1</td><td>32/3</td><td>32/9</td></tr><tr><td>x</td><td>3</td><td>4</td><td>5</td></tr><tr><td>f(x; 1/2)</td><td>10/32</td><td>5/32</td><td>1/32</td></tr><tr><td>f(x; 3/4)</td><td>270/1024</td><td>405/1024</td><td>243/1024</td></tr><tr><td>f(x; 1/2)/f(x; 3/4)</td><td>32/27</td><td>32/81</td><td>32/243</td></tr></table>

We shall use one random value of $X$ to test the simple hypothesis $H_0: \theta = \frac{1}{2}$ against the alternative simple hypothesis $H_1: \theta = \frac{3}{4}$ , and we shall first assign the significance level of the test to be $\alpha = \frac{1}{32}$ . We seek a best critical region of size $\alpha = \frac{1}{32}$ . If $A_1 = \{x : x = 0\}$ or $A_2 = \{x : x = 5\}$ , then $P_{\{\theta = 1/2\}}(X \in A_1) = P_{\{\theta = 1/2\}}(X \in A_2) = \frac{1}{32}$ and there is no other subset $A_3$ of the space $\{x : x = 0, 1, 2, 3, 4, 5\}$ such that $P_{\{\theta = 1/2\}}(X \in A_3) = \frac{1}{32}$ . Then either $A_1$ or $A_2$ is the best critical region $C$ of size $\alpha = \frac{1}{32}$ for testing $H_0$ against $H_1$ . We note that $P_{\{\theta = 1/2\}}(X \in A_1) = \frac{1}{32}$ and $P_{\{\theta = 3/4\}}(X \in A_1) = \frac{1}{1024}$ . Thus, if the set $A_1$ is used as a critical region of size $\alpha = \frac{1}{32}$ , we have the intolerable situation that the probability of rejecting $H_0$ when $H_1$ is true ( $H_0$ is false) is much less than the probability of rejecting $H_0$ when $H_0$ is true.

On the other hand, if the set $A_{2}$ is used as a critical region, then $P_{\{\theta = 1 / 2\}}(X \in A_2) = \frac{1}{32}$ and $P_{\{\theta = 3 / 4\}}(X \in A_2) = \frac{243}{1024}$ . That is, the probability of rejecting $H_{0}$ when $H_{1}$ is true is much greater than the probability of rejecting $H_{0}$ when $H_{0}$ is true. Certainly, this is a more desirable state of affairs, and actually $A_{2}$ is the best critical region of size $\alpha = \frac{1}{32}$ . The latter statement follows from the fact that when $H_{0}$ is true, there are but two subsets, $A_{1}$ and $A_{2}$ , of the sample space, each of whose probability measure is $\frac{1}{32}$ and the fact that

$$
\frac {2 4 3}{1 0 2 4} = P _ {\{\theta = 3 / 4 \}} (X \in A _ {2}) > P _ {\{\theta = 3 / 4 \}} (X \in A _ {1}) = \frac {1}{1 0 2 4}.
$$

It should be noted in this problem that the best critical region $C = A_{2}$ of size $\alpha = \frac{1}{32}$ is found by including in $C$ the point (or points) at which $f(x; \frac{1}{2})$ is small in comparison with $f(x; \frac{3}{4})$ . This is seen to be true once it is observed that the ratio $f(x; \frac{1}{2}) / f(x; \frac{3}{4})$ is a minimum at $x = 5$ . Accordingly, the ratio $f(x; \frac{1}{2}) / f(x; \frac{3}{4})$ , that is given in the last line of the above tabulation, provides us with a precise tool by which to find a best critical region $C$ for certain given values of $\alpha$ . To illustrate this, take $\alpha = \frac{6}{32}$ . When $H_{0}$ is true, each of the subsets $\{x : x = 0, 1\}$ , $\{x : x = 0, 4\}$ , $\{x : x = 1, 5\}$ , $\{x : x = 4, 5\}$ has probability measure $\frac{6}{32}$ . By direct computation it is found that the best critical region of this size is $\{x : x = 4, 5\}$ . This reflects the fact that the ratio $f(x; \frac{1}{2}) / f(x; \frac{3}{4})$ has its two smallest values for $x = 4$ and $x = 5$ . The power of this test, which has $\alpha = \frac{6}{32}$ , is

$$
P _ {\{\theta = 3 / 4 \}} (X = 4, 5) = \frac {4 0 5}{1 0 2 4} + \frac {2 4 3}{1 0 2 4} = \frac {6 4 8}{1 0 2 4}.
$$

The preceding example should make the following theorem, due to Neyman and Pearson, easier to understand. It is an important theorem because it provides a systematic method of determining a best critical region.

Theorem 8.1.1. Neyman-Pearson Theorem. Let $X_{1}, X_{2}, \ldots, X_{n}$ , where $n$ is a fixed positive integer, denote a random sample from a distribution that has pdf or pmf $f(x; \theta)$ . Then the likelihood of $X_{1}, X_{2}, \ldots, X_{n}$ is

$$
L (\theta ; \mathbf {x}) = \prod_ {i = 1} ^ {n} f (x _ {i}; \theta), \quad f o r \mathbf {x} ^ {\prime} = (x _ {1}, \dots , x _ {n}).
$$

Let $\theta'$ and $\theta''$ be distinct fixed values of $\theta$ so that $\Omega = \{\theta : \theta = \theta', \theta''\}$ , and let $k$ be a positive number. Let $C$ be a subset of the sample space such that

(a) $\frac{L(\theta';\mathbf{x})}{L(\theta'';\mathbf{x})}\leq k$ , for each point $\mathbf{x}\in C$   
(b) $\frac{L(\theta';\mathbf{x})}{L(\theta'';\mathbf{x})}\geq k,$ for each point $\mathbf{x}\in C^c$   
(c) $\alpha = P_{H_0}[\mathbf{X}\in C]$

Then $C$ is a best critical region of size $\alpha$ for testing the simple hypothesis $H_0: \theta = \theta'$ against the alternative simple hypothesis $H_1: \theta = \theta''$ .

Proof: We shall give the proof when the random variables are of the continuous type. If $C$ is the only critical region of size $\alpha$ , the theorem is proved. If there is another critical region of size $\alpha$ , denote it by $A$ . For convenience, we shall let $\int_{R} \dots \int_{R} L(\theta; x_1, \ldots, x_n) dx_1 \dots dx_n$ be denoted by $\int_{R} L(\theta)$ . In this notation we wish to show that

$$
\int_ {C} L (\theta^ {\prime \prime}) - \int_ {A} L (\theta^ {\prime \prime}) \geq 0.
$$

Since $C$ is the union of the disjoint sets $C \cap A$ and $C \cap A^c$ and $A$ is the union of the disjoint sets $A \cap C$ and $A \cap C^c$ , we have

$$
\begin{array}{l} \int_ {C} L \left(\theta^ {\prime \prime}\right) - \int_ {A} L \left(\theta^ {\prime \prime}\right) = \int_ {C \cap A} L \left(\theta^ {\prime \prime}\right) + \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime \prime}\right) - \int_ {A \cap C} L \left(\theta^ {\prime \prime}\right) - \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime \prime}\right) \\ = \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime \prime}\right) - \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime \prime}\right). \tag {8.1.5} \\ \end{array}
$$

However, by the hypothesis of the theorem, $L(\theta^{\prime \prime}) \geq (1 / k)L(\theta^{\prime})$ at each point of $C$ , and hence at each point of $C \cap A^{c}$ ; thus,

$$
\int_ {C \cap A ^ {c}} L \left(\theta^ {\prime \prime}\right) \geq \frac {1}{k} \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime}\right).
$$

But $L(\theta'') \leq (1/k)L(\theta')$ at each point of $C^c$ , and hence at each point of $A \cap C^c$ ; accordingly,

$$
\int_ {A \cap C ^ {c}} L \left(\theta^ {\prime \prime}\right) \leq \frac {1}{k} \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime}\right).
$$

These inequalities imply that

$$
\int_ {C \cap A ^ {c}} L (\theta^ {\prime \prime}) - \int_ {A \cap C ^ {c}} L (\theta^ {\prime \prime}) \geq \frac {1}{k} \int_ {C \cap A ^ {c}} L (\theta^ {\prime}) - \frac {1}{k} \int_ {A \cap C ^ {c}} L (\theta^ {\prime});
$$

and, from Equation (8.1.5), we obtain

$$
\int_ {C} L \left(\theta^ {\prime \prime}\right) - \int_ {A} L \left(\theta^ {\prime \prime}\right) \geq \frac {1}{k} \left[ \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime}\right) - \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime}\right) \right]. \tag {8.1.6}
$$

However,

$$
\begin{array}{l} \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime}\right) - \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime}\right) = \int_ {C \cap A ^ {c}} L \left(\theta^ {\prime}\right) + \int_ {C \cap A} L \left(\theta^ {\prime}\right) \\ - \int_ {A \cap C} L \left(\theta^ {\prime}\right) - \int_ {A \cap C ^ {c}} L \left(\theta^ {\prime}\right) \\ = \int_ {C} L \left(\theta^ {\prime}\right) - \int_ {A} L \left(\theta^ {\prime}\right) = \alpha - \alpha = 0. \\ \end{array}
$$

If this result is substituted in inequality (8.1.6), we obtain the desired result,

$$
\int_ {C} L \left(\theta^ {\prime \prime}\right) - \int_ {A} L \left(\theta^ {\prime \prime}\right) \geq 0.
$$

If the random variables are of the discrete type, the proof is the same with integration replaced by summation.

Remark 8.1.1. As stated in the theorem, conditions (a), (b), and (c) are sufficient ones for region $C$ to be a best critical region of size $\alpha$ . However, they are also necessary. We discuss this briefly. Suppose there is a region $A$ of size $\alpha$ that does not satisfy (a) and (b) and that is as powerful at $\theta = \theta''$ as $C$ , which satisfies (a), (b), and (c). Then expression (8.1.5) would be zero, since the power at $\theta''$ using $A$ is equal to that using $C$ . It can be proved that to have expression (8.1.5) equal zero, $A$ must be of the same form as $C$ . As a matter of fact, in the continuous case, $A$ and $C$ would essentially be the same region; that is, they could differ only by a set having probability zero. However, in the discrete case, if $P_{H_0}[L(\theta') = kL(\theta'')]$ is positive, $A$ and $C$ could be different sets, but each would necessarily enjoy conditions (a), (b), and (c) to be a best critical region of size $\alpha$ .

It would seem that a test should have the property that its power should never fall below its significance level; otherwise, the probability of falsely rejecting $H_0$ (level) is higher than the probability of correctly rejecting $H_0$ (power). We say a test having this property is unbiased, which we now formally define:

Definition 8.1.2. Let $X$ be a random variable which has pdf or pmf $f(x; \theta)$ , where $\theta \in \Omega$ . Consider the hypotheses given in expression (8.1.1). Let $\mathbf{X}' = (X_1, \ldots, X_n)$ denote a random sample on $X$ . Consider a test with critical region $C$ and level $\alpha$ . We say that this test is unbiased if

$$
P _ {\theta} (\mathbf {X} \in C) \geq \alpha ,
$$

for all $\theta \in \omega_1$ .

As the next corollary shows, the best test given in Theorem 8.1.1 is an unbiased test.

Corollary 8.1.1. As in Theorem 8.1.1, let $C$ be the critical region of the best test of $H_0: \theta = \theta'$ versus $H_1: \theta = \theta''$ . Suppose the significance level of the test is $\alpha$ . Let $\gamma_C(\theta'') = P_{\theta''}[\mathbf{X} \in C]$ denote the power of the test. Then $\alpha \leq \gamma_C(\theta'')$ .

Proof: Consider the "unreasonable" test in which the data are ignored, but a Bernoulli trial is performed which has probability $\alpha$ of success. If the trial ends in success, we reject $H_0$ . The level of this test is $\alpha$ . Because the power of a test is the probability of rejecting $H_0$ when $H_1$ is true, the power of this unreasonable test is $\alpha$ also. But $C$ is the best critical region of size $\alpha$ and thus has power greater than or equal to the power of the unreasonable test. That is, $\gamma_C(\theta'') \geq \alpha$ , which is the desired result.

Another aspect of Theorem 8.1.1 to be emphasized is that if we take $C$ to be the set of all points $\mathbf{x}$ which satisfy

$$
\frac {L \left(\theta^ {\prime} ; \mathbf {x}\right)}{L \left(\theta^ {\prime \prime} ; \mathbf {x}\right)} \leq k, \quad k > 0,
$$

then, in accordance with the theorem, $C$ is a best critical region. This inequality can frequently be expressed in one of the forms (where $c_{1}$ and $c_{2}$ are constants)

$$
u _ {1} (\mathbf {x}; \theta^ {\prime}, \theta^ {\prime \prime}) \leq c _ {1}
$$

or

$$
u _ {2} (\mathbf {x}; \theta^ {\prime}, \theta^ {\prime \prime}) \geq c _ {2}.
$$

Suppose that it is the first form, $u_{1} \leq c_{1}$ . Since $\theta'$ and $\theta''$ are given constants, $u_{1}(\mathbf{X};\theta',\theta'')$ is a statistic; and if the pdf or pmf of this statistic can be found when $H_{0}$ is true, then the significance level of the test of $H_{0}$ against $H_{1}$ can be determined from this distribution. That is,

$$
\alpha = P _ {H _ {0}} \left[ u _ {1} (\mathbf {X}; \theta^ {\prime}, \theta^ {\prime \prime}) \leq c _ {1} \right].
$$

Moreover, the test may be based on this statistic; for if the observed vector value of $\mathbf{X}$ is $\mathbf{x}$ , we reject $H_0$ (accept $H_1$ ) if $u_1(\mathbf{x}) \leq c_1$ .

A positive number $k$ determines a best critical region $C$ whose size is $\alpha = P_{H_0}[\mathbf{X} \in C]$ for that particular $k$ . It may be that this value of $\alpha$ is unsuitable for the purpose at hand; that is, it is too large or too small. However, if there is a statistic $u_1(\mathbf{X})$ as in the preceding paragraph, whose pdf or pmf can be determined when $H_0$ is true, we need not experiment with various values of $k$ to obtain a desirable significance level. For if the distribution of the statistic is known, or can be found, we may determine $c_1$ such that $P_{H_0}[u_1(\mathbf{X}) \leq c_1]$ is a desirable significance level.

An illustrative example follows.

Example 8.1.2. Let $\mathbf{X}' = (X_1, \ldots, X_n)$ denote a random sample from the distribution that has the pdf

$$
f (x; \theta) = \frac {1}{\sqrt {2 \pi}} \exp \left(- \frac {(x - \theta) ^ {2}}{2}\right), \quad - \infty <   x <   \infty .
$$

It is desired to test the simple hypothesis $H_0: \theta = \theta' = 0$ against the alternative simple hypothesis $H_1: \theta = \theta'' = 1$ . Now

$$
\begin{array}{l} \frac {L (\theta^ {\prime} ; \mathbf {x})}{L (\theta^ {\prime \prime} ; \mathbf {x})} = \frac {(1 / \sqrt {2 \pi}) ^ {n} \exp \left[ - \sum_ {1} ^ {n} x _ {i} ^ {2} / 2 \right]}{(1 / \sqrt {2 \pi}) ^ {n} \exp \left[ - \sum_ {1} ^ {n} (x _ {i} - 1) ^ {2} / 2 \right]} \\ = \exp \left(- \sum_ {1} ^ {n} x _ {i} + \frac {n}{2}\right). \\ \end{array}
$$

If $k > 0$ , the set of all points $(x_{1}, x_{2}, \ldots, x_{n})$ such that

$$
\exp \left(- \sum_ {1} ^ {n} x _ {i} + \frac {n}{2}\right) \leq k
$$

is a best critical region. This inequality holds if and only if

$$
- \sum_ {1} ^ {n} x _ {i} + \frac {n}{2} \leq \log k
$$

or, equivalently,

$$
\sum_ {1} ^ {n} x _ {i} \geq \frac {n}{2} - \log k = c.
$$

In this case, a best critical region is the set $C = \{(x_1, x_2, \ldots, x_n) : \sum_{1}^{n} x_i \geq c\}$ , where $c$ is a constant that can be determined so that the size of the critical region is a desired number $\alpha$ . The event $\sum_{1}^{n} X_i \geq c$ is equivalent to the event $\overline{X} \geq c / n = c_1$ , for example, so the test may be based upon the statistic $\overline{X}$ . If $H_0$ is true, that is, $\theta = \theta' = 0$ , then $\overline{X}$ has a distribution that is $N(0, 1 / n)$ . Given the significance level $\alpha$ , the number $c_1$ is computed in $R$ as $c_1 = \mathbf{qnorm}(1 - \alpha, 0, 1 / \sqrt{n})$ ; hence, $P_{H_0}(\overline{X} \geq c_1) = \alpha$ . So, if the experimental values of $X_1, X_2, \ldots, X_n$ were, respectively, $x_1, x_2, \ldots, x_n$ , we would compute $\overline{x} = \sum_{1}^{n} x_i / n$ . If $\overline{x} \geq c_1$ , the simple hypothesis $H_0: \theta = \theta' = 0$ would be rejected at the significance level $\alpha$ ; if $\overline{x} < c_1$ , the hypothesis $H_0$ would be accepted. The probability of rejecting $H_0$ when $H_0$ is true is $\alpha$ the level of significance. The probability of rejecting $H_0$ , when $H_0$ is false, is the value of the power of the test at $\theta = \theta'' = 1$ , which is,

$$
P _ {H _ {1}} (\bar {X} \geq c _ {1}) = \int_ {c _ {1}} ^ {\infty} \frac {1}{\sqrt {2 \pi} \sqrt {1 / n}} \exp \left[ - \frac {(\bar {x} - 1) ^ {2}}{2 (1 / n)} \right] d \bar {x}. \tag {8.1.7}
$$

For example, if $n = 25$ and $\alpha$ is $0.05$ , $c_{1} = \mathrm{qnorm}(0.95, 0, 1/5) = 0.329$ , using R. Hence, the power of the test to detect $\theta = 1$ , given in expression (8.1.7), is computed by $1 - \mathrm{pnorm}(0.329, 1, 1/5) = 0.9996$ .

There is another aspect of this theorem that warrants special mention. It has to do with the number of parameters that appear in the pdf. Our notation suggests that there is but one parameter. However, a careful review of the proof reveals that nowhere was this needed or assumed. The pdf or pmf may depend upon any finite number of parameters. What is essential is that the hypothesis $H_0$ and the alternative hypothesis $H_1$ be simple, namely, that they completely specify the distributions. With this in mind, we see that the simple hypotheses $H_0$ and $H_1$ do not need to be hypotheses about the parameters of a distribution, nor, as a matter of fact, do the random variables $X_1, X_2, \ldots, X_n$ need to be independent. That is, if $H_0$ is the simple hypothesis that the joint pdf or pmf is $g(x_1, x_2, \ldots, x_n)$ , and if $H_1$ is the alternative simple hypothesis that the joint pdf or pmf is $h(x_1, x_2, \ldots, x_n)$ , then $C$ is a best critical region of size $\alpha$ for testing $H_0$ against $H_1$ if, for $k > 0$ ,

1. $\frac{g(x_1, x_2, \ldots, x_n)}{h(x_1, x_2, \ldots, x_n)} \leq k$ for $(x_1, x_2, \ldots, x_n) \in C$ .   
2. $\frac{g(x_1, x_2, \ldots, x_n)}{h(x_1, x_2, \ldots, x_n)} \geq k$ for $(x_1, x_2, \ldots, x_n) \in C^c$ .   
3. $\alpha = P_{H_0}[(X_1, X_2, \ldots, X_n) \in C]$ .

Consider the following example.

Example 8.1.3. Let $X_1, \ldots, X_n$ denote a random sample on $X$ that has pmf $f(x)$ with support $\{0, 1, 2, \ldots\}$ . It is desired to test the simple hypothesis

$$
H _ {0}: f (x) = \left\{ \begin{array}{l l} \frac {e ^ {- 1}}{x !} & x = 0, 1, 2, \ldots \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

against the alternative simple hypothesis

$$
H _ {1}: f (x) = \left\{ \begin{array}{l l} (\frac {1}{2}) ^ {x + 1} & x = 0, 1, 2, \ldots \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

That is, we want to test whether $X$ has a Poisson distribution with mean $\lambda = 1$ versus $X$ has a geometric distribution with $p = 1/2$ . Here

$$
\begin{array}{l} \frac {g \left(x _ {1} , \dots , x _ {n}\right)}{h \left(x _ {1} , \dots , x _ {n}\right)} = \frac {e ^ {- n} / \left(x _ {1} ! x _ {2} ! \cdots x _ {n}!\right)}{\left(\frac {1}{2}\right) ^ {n} \left(\frac {1}{2}\right) ^ {x _ {1} + x _ {2} + \cdots + x _ {n}}} \\ = \frac {(2 e ^ {- 1}) ^ {n} 2 ^ {\sum x _ {i}}}{\prod_ {1} ^ {n} (x _ {i} !)}. \\ \end{array}
$$

If $k > 0$ , the set of points $(x_{1}, x_{2}, \ldots, x_{n})$ such that

$$
\left(\sum_ {1} ^ {n} x _ {i}\right) \log 2 - \log \left[ \prod_ {1} ^ {n} (x _ {i}!) \right] \leq \log k - n \log (2 e ^ {- 1}) = c
$$

is a best critical region $C$ . Consider the case of $k = 1$ and $n = 1$ . The preceding inequality may be written $2^{x_1} / x_1! \leq e / 2$ . This inequality is satisfied by all points in the set $C = \{x_1 : x_1 = 0, 3, 4, 5, \ldots\}$ . Using R, the level of significance is

$$
P _ {H _ {0}} \left(X _ {1} \in C\right) = 1 - P _ {H _ {0}} \left(X _ {1} = 1, 2\right) = 1 - \mathbf {d p o i s} (1, 1) - \mathbf {d p o i s} (2, 1) = 0. 4 4 8 2.
$$

The power of the test to detect $H_{1}$ is computed as

$$
P _ {H _ {1}} (X _ {1} \in C) = 1 - P _ {H _ {1}} (X _ {1} = 1, 2) = 1 - (\frac {1}{4} + \frac {1}{8}) = 0. 6 2 5.
$$

Note that these results are consistent with Corollary 8.1.1.

Remark 8.1.2. In the notation of this section, say $C$ is a critical region such that

$$
\alpha = \int_ {C} L (\theta^ {\prime}) \quad \mathrm {a n d} \quad \beta = \int_ {C ^ {c}} L (\theta^ {\prime \prime}),
$$

where $\alpha$ and $\beta$ equal the respective probabilities of the Type I and Type II errors associated with $C$ . Let $d_{1}$ and $d_{2}$ be two given positive constants. Consider a certain linear function of $\alpha$ and $\beta$ , namely,

$$
\begin{array}{l} d _ {1} \int_ {C} L \left(\theta^ {\prime}\right) + d _ {2} \int_ {C ^ {c}} L \left(\theta^ {\prime \prime}\right) = d _ {1} \int_ {C} L \left(\theta^ {\prime}\right) + d _ {2} \left[ 1 - \int_ {C} L \left(\theta^ {\prime \prime}\right) \right] \\ = d _ {2} + \int_ {C} \left[ d _ {1} L \left(\theta^ {\prime}\right) - d _ {2} L \left(\theta^ {\prime \prime}\right) \right]. \\ \end{array}
$$

If we wished to minimize this expression, we would select $C$ to be the set of all $(x_{1}, x_{2}, \ldots, x_{n})$ such that

$$
d _ {1} L \left(\theta^ {\prime}\right) - d _ {2} L \left(\theta^ {\prime \prime}\right) <   0
$$

or, equivalently,

$$
\frac {L \left(\theta^ {\prime}\right)}{L \left(\theta^ {\prime \prime}\right)} <   \frac {d _ {2}}{d _ {1}}, \quad \text {f o r a l l} (x _ {1}, x _ {2}, \ldots , x _ {n}) \in C,
$$

which according to the Neyman-Pearson theorem provides a best critical region with $k = d_2 / d_1$ . That is, this critical region $C$ is one that minimizes $d_1\alpha + d_2\beta$ . There could be others, including points on which $L(\theta') / L(\theta'') = d_2 / d_1$ , but these would still be best critical regions according to the Neyman-Pearson theorem.

# EXERCISES

8.1.1. In Example 8.1.2 of this section, let the simple hypotheses read $H_0: \theta = \theta' = 0$ and $H_1: \theta = \theta'' = -1$ . Show that the best test of $H_0$ against $H_1$ may be carried out by use of the statistic $\overline{X}$ , and that if $n = 25$ and $\alpha = 0.05$ , the power of the test is 0.9996 when $H_1$ is true.

8.1.2. Let the random variable $X$ have the pdf $f(x; \theta) = (1 / \theta)e^{-x / \theta}$ , $0 < x < \infty$ , zero elsewhere. Consider the simple hypothesis $H_0: \theta = \theta' = 2$ and the alternative hypothesis $H_1: \theta = \theta'' = 4$ . Let $X_1, X_2$ denote a random sample of size 2 from this distribution. Show that the best test of $H_0$ against $H_1$ may be carried out by use of the statistic $X_1 + X_2$ .

8.1.3. Repeat Exercise 8.1.2 when $H_{1}:\theta = \theta^{\prime \prime} = 6$ . Generalize this for every $\theta^{\prime \prime} > 2$ .

8.1.4. Let $X_{1}, X_{2}, \ldots, X_{10}$ be a random sample of size 10 from a normal distribution $N(0, \sigma^2)$ . Find a best critical region of size $\alpha = 0.05$ for testing $H_0: \sigma^2 = 1$ against $H_{1}: \sigma^{2} = 2$ . Is this a best critical region of size 0.05 for testing $H_0: \sigma^2 = 1$ against $H_{1}: \sigma^{2} = 4$ ? Against $H_{1}: \sigma^{2} = \sigma_{1}^{2} > 1$ ?

8.1.5. If $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a distribution having pdf of the form $f(x; \theta) = \theta x^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere, show that a best critical region for testing $H_{0}: \theta = 1$ against $H_{1}: \theta = 2$ is $C = \{(x_{1}, x_{2}, \ldots, x_{n}) : c \leq \prod_{i=1}^{n} x_{i}\}$ .

8.1.6. Let $X_{1}, X_{2}, \ldots, X_{10}$ be a random sample from a distribution that is $N(\theta_{1}, \theta_{2})$ . Find a best test of the simple hypothesis $H_{0}: \theta_{1} = \theta_{1}' = 0$ , $\theta_{2} = \theta_{2}' = 1$ against the alternative simple hypothesis $H_{1}: \theta_{1} = \theta_{1}' = 1$ , $\theta_{2} = \theta_{2}' = 4$ .

8.1.7. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a normal distribution $N(\theta, 100)$ . Show that $C = \{(x_{1}, x_{2}, \ldots, x_{n}) : c \leq \overline{x} = \sum_{1}^{n} x_{i} / n\}$ is a best critical region for testing $H_{0} : \theta = 75$ against $H_{1} : \theta = 78$ . Find $n$ and $c$ so that

$$
P _ {H _ {0}} \left[ \left(X _ {1}, X _ {2}, \dots , X _ {n}\right) \in C \right] = P _ {H _ {0}} (\bar {X} \geq c) = 0. 0 5
$$

and

$$
P _ {H _ {1}} \left[ \left(X _ {1}, X _ {2}, \dots , X _ {n}\right) \in C \right] = P _ {H _ {1}} (\bar {X} \geq c) = 0. 9 0,
$$

approximately.

8.1.8. If $X_{1}, X_{2}, \ldots, X_{n}$ is a random sample from a beta distribution with parameters $\alpha = \beta = \theta > 0$ , find a best critical region for testing $H_{0}: \theta = 1$ against $H_{1}: \theta = 2$ .

8.1.9. Let $X_{1}, X_{2}, \ldots, X_{n}$ be iid with pmf $f(x; p) = p^{x}(1 - p)^{1 - x}$ , $x = 0, 1$ , zero elsewhere. Show that $C = \{(x_{1}, \ldots, x_{n}) : \sum_{1}^{n} x_{i} \leq c\}$ is a best critical region for testing $H_{0} : p = \frac{1}{2}$ against $H_{1} : p = \frac{1}{3}$ . Use the Central Limit Theorem to find $n$ and $c$ so that approximately $P_{H_{0}}(\sum_{1}^{n} X_{i} \leq c) = 0.10$ and $P_{H_{1}}(\sum_{1}^{n} X_{i} \leq c) = 0.80$ .

8.1.10. Let $X_{1}, X_{2}, \ldots, X_{10}$ denote a random sample of size 10 from a Poisson distribution with mean $\theta$ . Show that the critical region $C$ defined by $\sum_{1}^{10} x_{i} \geq 3$ is a best critical region for testing $H_{0}: \theta = 0.1$ against $H_{1}: \theta = 0.5$ . Determine, for this test, the significance level $\alpha$ and the power at $\theta = 0.5$ . Use the R function ppois.

# 8.2 Uniformly Most Powerful Tests

This section takes up the problem of a test of a simple hypothesis $H_0$ against an alternative composite hypothesis $H_1$ . We begin with an example.

Example 8.2.1. Consider the pdf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \frac {1}{\theta} e ^ {- x / \theta} & 0 <   x <   \infty \\ 0 & \text {e l s e w h e r e} \end{array} \right.
$$

of Exercises 8.1.2 and 8.1.3. It is desired to test the simple hypothesis $H_0: \theta = 2$ against the alternative composite hypothesis $H_1: \theta > 2$ . Thus $\Omega = \{\theta : \theta \geq 2\}$ . A random sample, $X_1, X_2$ , of size $n = 2$ is used, and the critical region is $C = \{(x_1, x_2): 9.5 \leq x_1 + x_2 < \infty\}$ . It was shown in the exercises cited that the significance level of the test is approximately 0.05 and the power of the test when $\theta = 4$ is approximately 0.31. The power function $\gamma(\theta)$ of the test for all $\theta \geq 2$ is

$$
\begin{array}{l} \gamma (\theta) = 1 - \int_ {0} ^ {9. 5} \int_ {0} ^ {9. 5 - x _ {2}} \frac {1}{\theta^ {2}} \exp \left(- \frac {x _ {1} + x _ {2}}{\theta}\right) d x _ {1} d x _ {2} \\ = \left(\frac {\theta + 9 . 5}{\theta}\right) e ^ {- 9. 5 / \theta}, 2 \leq \theta . \\ \end{array}
$$

For example, $\gamma(2) = 0.05$ , $\gamma(4) = 0.31$ , and $\gamma(9.5) = 2/e \approx 0.74$ . It is shown (Exercise 8.1.3) that the set $C = \{(x_1, x_2) : 9.5 \leq x_1 + x_2 < \infty\}$ is a best critical region of size 0.05 for testing the simple hypothesis $H_0: \theta = 2$ against each simple hypothesis in the composite hypothesis $H_1: \theta > 2$ .

The preceding example affords an illustration of a test of a simple hypothesis $H_0$ that is a best test of $H_0$ against every simple hypothesis in the alternative composite hypothesis $H_1$ . We now define a critical region, when it exists, which is a best critical region for testing a simple hypothesis $H_0$ against an alternative composite hypothesis $H_1$ . It seems desirable that this critical region should be a best critical region for testing $H_0$ against each simple hypothesis in $H_1$ . That is, the power function of the test that corresponds to this critical region should be at least as great as the power function of any other test with the same significance level for every simple hypothesis in $H_1$ .

Definition 8.2.1. The critical region $C$ is a uniformly most powerful (UMP) critical region of size $\alpha$ for testing the simple hypothesis $H_0$ against an alternative composite hypothesis $H_1$ if the set $C$ is a best critical region of size $\alpha$ for testing $H_0$ against each simple hypothesis in $H_1$ . A test defined by this critical region $C$ is called a uniformly most powerful (UMP) test, with significance level $\alpha$ , for testing the simple hypothesis $H_0$ against the alternative composite hypothesis $H_1$ .

As will be seen presently, uniformly most powerful tests do not always exist. However, when they do exist, the Neyman-Pearson theorem provides a technique for finding them. Some illustrative examples are given here.

Example 8.2.2. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(0, \theta)$ , where the variance $\theta$ is an unknown positive number. It will be shown that there exists a uniformly most powerful test with significance level $\alpha$ for testing the simple hypothesis $H_{0}: \theta = \theta'$ , where $\theta'$ is a fixed positive number, against the alternative composite hypothesis $H_{1}: \theta > \theta'$ . Thus $\Omega = \{\theta: \theta \geq \theta'\}$ . The joint pdf of $X_{1}, X_{2}, \ldots, X_{n}$ is

$$
L (\theta ; x _ {1}, x _ {2}, \dots , x _ {n}) = \left(\frac {1}{2 \pi \theta}\right) ^ {n / 2} \exp \left\{- \frac {1}{2 \theta} \sum_ {i = 1} ^ {n} x _ {i} ^ {2} \right\}.
$$

Let $\theta''$ represent a number greater than $\theta'$ , and let $k$ denote a positive number. Let $C$ be the set of points where

$$
\frac {L \left(\theta^ {\prime} ; x _ {1} , x _ {2} , \ldots , x _ {n}\right)}{L \left(\theta^ {\prime \prime} ; x _ {1} , x _ {2} , \ldots , x _ {n}\right)} \leq k,
$$

that is, the set of points where

$$
\left(\frac {\theta^ {\prime \prime}}{\theta^ {\prime}}\right) ^ {n / 2} \exp \left[ - \left(\frac {\theta^ {\prime \prime} - \theta^ {\prime}}{2 \theta^ {\prime} \theta^ {\prime \prime}}\right) \sum_ {1} ^ {n} x _ {i} ^ {2} \right] \leq k
$$

or, equivalently,

$$
\sum_ {1} ^ {n} x _ {i} ^ {2} \geq \frac {2 \theta^ {\prime} \theta^ {\prime \prime}}{\theta^ {\prime \prime} - \theta^ {\prime}} \left[ \frac {n}{2} \log \left(\frac {\theta^ {\prime \prime}}{\theta^ {\prime}}\right) - \log k \right] = c.
$$

The set $C = \{(x_1, x_2, \ldots, x_n) : \sum_{i=1}^{n} x_i^2 \geq c\}$ is then a best critical region for testing the simple hypothesis $H_0 : \theta = \theta'$ against the simple hypothesis $\theta = \theta''$ . It remains to determine $c$ , so that this critical region has the desired size $\alpha$ . If $H_0$ is true, the random variable $\sum_{i=1}^{n} X_i^2 / \theta'$ has a chi-square distribution with $n$ degrees of freedom. Since $\alpha = P_{\theta'}(\sum_{i=1}^{n} X_i^2 / \theta' \geq c / \theta')$ , $c / \theta'$ may be computed, for example, by the R code qchisq(1 - $\alpha, n$ ). Then $C = \{(x_1, x_2, \ldots, x_n) : \sum_{i=1}^{n} x_i^2 \geq c\}$ is a best critical region of size $\alpha$ for testing $H_0 : \theta = \theta'$ against the hypothesis $\theta = \theta''$ . Moreover, for each number $\theta''$ greater than $\theta'$ , the foregoing argument holds. That is, $C = \{(x_1, \ldots, x_n) : \sum_{i=1}^{n} x_i^2 \geq c\}$ is a uniformly most powerful critical region of size $\alpha$ for testing $H_0 : \theta = \theta'$ against $H_1 : \theta > \theta'$ . If $x_1, x_2, \ldots, x_n$ denote the experimental values of $X_1, X_2, \ldots, X_n$ , then $H_0 : \theta = \theta'$ is rejected at the significance level $\alpha$ , and $H_1 : \theta > \theta'$ is accepted if $\sum_{i=1}^{n} x_i^2 \geq c$ ; otherwise, $H_0 : \theta = \theta'$ is accepted.

If, in the preceding discussion, we take $n = 15$ , $\alpha = 0.05$ , and $\theta' = 3$ , then the two hypotheses are $H_0: \theta = 3$ and $H_1: \theta > 3$ . Using R, $c/3$ is computed by qchisq(0.95,15) = 24.996. Hence, $c = 74.988$ .

Example 8.2.3. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that is $N(\theta, 1)$ , where $\theta$ is unknown. It will be shown that there is no uniformly most powerful test of the simple hypothesis $H_{0}: \theta = \theta'$ , where $\theta'$ is a fixed number against the alternative composite hypothesis $H_{1}: \theta \neq \theta'$ . Thus $\Omega = \{\theta: -\infty < \theta < \infty\}$ . Let $\theta''$ be a number not equal to $\theta'$ . Let $k$ be a positive number and consider

$$
\frac {(1 / 2 \pi) ^ {n / 2} \exp \left[ - \sum_ {1} ^ {n} (x _ {i} - \theta^ {\prime}) ^ {2} / 2 \right]}{(1 / 2 \pi) ^ {n / 2} \exp \left[ - \sum_ {1} ^ {n} (x _ {i} - \theta^ {\prime \prime}) ^ {2} / 2 \right]} \leq k.
$$

The preceding inequality may be written as

$$
\exp \left\{- (\theta^ {\prime \prime} - \theta^ {\prime}) \sum_ {1} ^ {n} x _ {i} + \frac {n}{2} [ (\theta^ {\prime \prime}) ^ {2} - (\theta^ {\prime}) ^ {2} ] \right\} \leq k
$$

or

$$
\left(\theta^ {\prime \prime} - \theta^ {\prime}\right) \sum_ {1} ^ {n} x _ {i} \geq \frac {n}{2} \left[ \left(\theta^ {\prime \prime}\right) ^ {2} - \left(\theta^ {\prime}\right) ^ {2} \right] - \log k.
$$

This last inequality is equivalent to

$$
\sum_ {1} ^ {n} x _ {i} \geq \frac {n}{2} \left(\theta^ {\prime \prime} + \theta^ {\prime}\right) - \frac {\log k}{\theta^ {\prime \prime} - \theta^ {\prime}},
$$

provided that $\theta'' > \theta'$ , and it is equivalent to

$$
\sum_ {1} ^ {n} x _ {i} \leq \frac {n}{2} \left(\theta^ {\prime \prime} + \theta^ {\prime}\right) - \frac {\log k}{\theta^ {\prime \prime} - \theta^ {\prime}}
$$

if $\theta'' < \theta'$ . The first of these two expressions defines a best critical region for testing $H_0: \theta = \theta'$ against the hypothesis $\theta = \theta''$ provided that $\theta'' > \theta'$ , while the second expression defines a best critical region for testing $H_0: \theta = \theta'$ against the hypothesis $\theta = \theta''$ provided that $\theta'' < \theta'$ . That is, a best critical region for testing the simple hypothesis against an alternative simple hypothesis, say $\theta = \theta' + 1$ , does not serve as a best critical region for testing $H_0: \theta = \theta'$ against the alternative simple hypothesis $\theta = \theta' - 1$ . By definition, then, there is no uniformly most powerful test in the case under consideration.

It should be noted that had the alternative composite hypothesis been one-sided, either $H_{1}:\theta >\theta^{\prime}$ or $H_{1}:\theta < \theta^{\prime}$ , a uniformly most powerful test would exist in each instance.

Example 8.2.4. In Exercise 8.1.10, the reader was asked to show that if a random sample of size $n = 10$ is taken from a Poisson distribution with mean $\theta$ , the critical region defined by $\sum_{1}^{n} x_{i} \geq 3$ is a best critical region for testing $H_{0}: \theta = 0.1$ against

$H_{1}:\theta = 0.5$ . This critical region is also a uniformly most powerful one for testing $H_0:\theta = 0.1$ against $H_{1}:\theta >0.1$ because, with $\theta '' > 0.1$

$$
\frac {(0 . 1) ^ {\sum x _ {i}} e ^ {- 1 0 (0 . 1)} / (x _ {1} ! x _ {2} ! \cdots x _ {n} !)}{(\theta^ {\prime \prime}) ^ {\sum x _ {i}} e ^ {- 1 0 (\theta^ {\prime \prime})} / (x _ {1} ! x _ {2} ! \cdots x _ {n} !)} \leq k
$$

is equivalent to

$$
\left(\frac {0 . 1}{\theta^ {\prime \prime}}\right) ^ {\sum x _ {i}} e ^ {- 1 0 (0. 1 - \theta^ {\prime \prime})} \leq k.
$$

The preceding inequality may be written as

$$
\left(\sum_ {1} ^ {n} x _ {i}\right) \left(\log 0. 1 - \log \theta^ {\prime \prime}\right) \leq \log k + 1 0 \left(1 - \theta^ {\prime \prime}\right)
$$

or, since $\theta'' > 0.1$ , equivalently as

$$
\sum_ {1} ^ {n} x _ {i} \geq \frac {\log k + 1 0 - 1 0 \theta^ {\prime \prime}}{\log 0 . 1 - \log \theta^ {\prime \prime}}.
$$

Of course, $\sum_{1}^{n}x_{i}\geq 3$ is of the latter form.

Let us make an important observation, although obvious when pointed out. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a distribution that has pdf $f(x; \theta)$ , $\theta \in \Omega$ . Suppose that $Y = u(X_{1}, X_{2}, \ldots, X_{n})$ is a sufficient statistic for $\theta$ . In accordance with the factorization theorem, the joint pdf of $X_{1}, X_{2}, \ldots, X_{n}$ may be written

$$
L (\theta ; x _ {1}, x _ {2}, \dots , x _ {n}) = k _ {1} [ u (x _ {1}, x _ {2}, \dots , x _ {n}); \theta ] k _ {2} (x _ {1}, x _ {2}, \dots , x _ {n}),
$$

where $k_{2}(x_{1},x_{2},\ldots ,x_{n})$ does not depend upon $\theta$ . Consequently, the ratio

$$
\frac {L (\theta^ {\prime} ; x _ {1} , x _ {2} , \ldots , x _ {n})}{L (\theta^ {\prime \prime} ; x _ {1} , x _ {2} , \ldots , x _ {n})} = \frac {k _ {1} [ u (x _ {1} , x _ {2} , \ldots , x _ {n}) ; \theta^ {\prime} ]}{k _ {1} [ u (x _ {1} , x _ {2} , \ldots , x _ {n}) ; \theta^ {\prime \prime} ]}
$$

depends upon $x_{1}, x_{2}, \ldots, x_{n}$ only through $u(x_{1}, x_{2}, \ldots, x_{n})$ . Accordingly, if there is a sufficient statistic $Y = u(X_{1}, X_{2}, \ldots, X_{n})$ for $\theta$ and if a best test or a uniformly most powerful test is desired, there is no need to consider tests that are based upon any statistic other than the sufficient statistic. This result supports the importance of sufficiency.

In the above examples, we have presented uniformly most powerful tests. For some families of pdfs and hypotheses, we can obtain general forms of such tests. We sketch these results for the general one-sided hypotheses of the form

$$
H _ {0}: \theta \leq \theta^ {\prime} \text {v e r s u s} H _ {1}: \theta > \theta^ {\prime}. \tag {8.2.1}
$$

The other one-sided hypotheses with the null hypothesis $H_0: \theta \geq \theta'$ , is completely analogous. Note that the null hypothesis of (8.2.1) is a composite hypothesis. Recall from Chapter 4 that the level of a test for the hypotheses (8.2.1) is defined by

$\max_{\theta \leq \theta'} \gamma(\theta)$ , where $\gamma(\theta)$ is the power function of the test. That is, the significance level is the maximum probability of Type I error.

Let $\mathbf{X}' = (X_1, \ldots, X_n)$ be a random sample with common pdf (or pmf) $f(x; \theta)$ , $\theta \in \Omega$ , and, hence with the likelihood function

$$
L (\theta , \mathbf {x}) = \prod_ {i = 1} ^ {n} f (x _ {i}; \theta), \quad \mathbf {x} ^ {\prime} = \left(x _ {1}, \dots , x _ {n}\right).
$$

We consider the family of pdfs that has monotone likelihood ratio as defined next.

Definition 8.2.2. We say that the likelihood $L(\theta, \mathbf{x})$ has monotone likelihood ratio (mlr) in the statistic $y = u(\mathbf{x})$ if, for $\theta_1 < \theta_2$ , the ratio

$$
\frac {L \left(\theta_ {1} , \mathbf {x}\right)}{L \left(\theta_ {2} , \mathbf {x}\right)} \tag {8.2.2}
$$

is a monotone function of $y = u(\mathbf{x})$

Assume then that our likelihood function $L(\theta, \mathbf{x})$ has a monotone decreasing likelihood ratio in the statistic $y = u(\mathbf{x})$ . Then the ratio in (8.2.2) is equal to $g(y)$ , where $g$ is a decreasing function. The case where the likelihood function has a monotone increasing likelihood ratio (i.e., $g$ is an increasing function) follows similarly by changing the sense of the inequalities below. Let $\alpha$ denote the significance level. Then we claim that the following test is UMP level $\alpha$ for the hypotheses (8.2.1):

$$
\text {R e j e c t} H _ {0} \text {i f} Y \geq c _ {Y}, \tag {8.2.3}
$$

where $c_{Y}$ is determined by $\alpha = P_{\theta^{\prime}}[Y \geq c_{Y}]$ . To show this claim, first consider the simple null hypothesis $H_0': \theta = \theta'$ . Let $\theta'' > \theta'$ be arbitrary but fixed. Let $C$ denote the most powerful critical region for $\theta'$ versus $\theta''$ . By the Neyman-Pearson Theorem, $C$ is defined by

$$
\frac {L \left(\theta^ {\prime} , \mathbf {X}\right)}{L \left(\theta^ {\prime \prime} , \mathbf {X}\right)} \leq k \text {i f a n d o n l y i f} \mathbf {X} \in C,
$$

where $k$ is determined by $\alpha = P_{\theta'}[\mathbf{X} \in C]$ . But by Definition 8.2.2, because $\theta'' > \theta'$ ,

$$
\frac {L \left(\theta^ {\prime} , \mathbf {X}\right)}{L \left(\theta^ {\prime \prime} , \mathbf {X}\right)} = g (Y) \leq k \Leftrightarrow Y \geq g ^ {- 1} (k),
$$

where $g^{-1}(k)$ satisfies $\alpha = P_{\theta'}[Y \geq g^{-1}(k)]$ ; i.e., $c_{Y} = g^{-1}(k)$ . Hence the Neyman-Pearson test is equivalent to the test defined by (8.2.3). Furthermore, the test is UMP for $\theta'$ versus $\theta'' > \theta'$ because the test only depends on $\theta'' > \theta'$ and $g^{-1}(k)$ is uniquely determined under $\theta'$ .

Let $\gamma_{Y}(\theta)$ denote the power function of the test (8.2.3). To finish, we need to show that $\max_{\theta \leq \theta'} \gamma_{Y}(\theta) = \alpha$ . But this follows immediately if we can show that $\gamma_{Y}(\theta)$ is a nondecreasing function. To see this, let $\theta_1 < \theta_2$ . Note that since $\theta_1 < \theta_2$ , the test (8.2.3) is the most powerful test for testing $\theta_1$ versus $\theta_2$ with the level $\gamma_{Y}(\theta_{1})$ . By Corollary 8.1.1, the power of the test at $\theta_{2}$ must not be below the level; i.e., $\gamma_{Y}(\theta_{2}) \geq \gamma_{Y}(\theta_{1})$ . Hence $\gamma_{Y}(\theta)$ is a nondecreasing function. Since the power function is nondecreasing, it follows from Definition 8.1.2 that the mlr tests are unbiased tests for the hypotheses (8.2.1); see Exercise 8.2.14.

Example 8.2.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a Bernoulli distribution with parameter $p = \theta$ , where $0 < \theta < 1$ . Let $\theta' < \theta''$ . Consider the ratio of likelihoods

$$
\frac {L (\theta^ {\prime} ; x _ {1} , x _ {2} , \ldots , x _ {n})}{L (\theta^ {\prime \prime} ; x _ {1} , x _ {2} , \ldots , x _ {n})} = \frac {(\theta^ {\prime}) ^ {\sum x _ {i}} (1 - \theta^ {\prime}) ^ {n - \sum x _ {i}}}{(\theta^ {\prime \prime}) ^ {\sum x _ {i}} (1 - \theta^ {\prime \prime}) ^ {n - \sum x _ {i}}} = \left[ \frac {\theta^ {\prime} (1 - \theta^ {\prime \prime})}{\theta^ {\prime \prime} (1 - \theta^ {\prime})} \right] ^ {\sum x _ {i}} \left(\frac {1 - \theta^ {\prime}}{1 - \theta^ {\prime \prime}}\right) ^ {n}.
$$

Since $\theta' / \theta'' < 1$ and $(1 - \theta'') / (1 - \theta') < 1$ , so that $\theta'(1 - \theta'') / \theta''(1 - \theta') < 1$ , the ratio is a decreasing function of $y = \sum x_i$ . Thus we have a monotone likelihood ratio in the statistic $Y = \sum X_i$ .

Consider the hypotheses

$$
H _ {0}: \theta \leq \theta^ {\prime} \text {v e r s u s} H _ {1}: \theta > \theta^ {\prime}. \tag {8.2.4}
$$

By our discussion above, the UMP level $\alpha$ decision rule for testing $H_0$ versus $H_{1}$ is given by

$$
\operatorname {R e j e c t} H _ {0} \text {i f} Y = \sum_ {i = 1} ^ {n} X _ {i} \geq c,
$$

where $c$ is such that $\alpha = P_{\theta^{\prime}}[Y\geq c]$

In the last example concerning a Bernoulli pmf, we obtained a UMP test by showing that its likelihood possesses mlr. The Bernoulli distribution is a regular case of the exponential family and our argument, under the one assumption below, can be generalized to the entire regular exponential family. To show this, suppose that the random sample $X_{1}, X_{2}, \ldots, X_{n}$ arises from a pdf or pmf representing a regular case of the exponential class, namely,

$$
f (x; \theta) = \left\{ \begin{array}{l l} \exp [ p (\theta) K (x) + H (x) + q (\theta) ] & x \in \mathcal {S} \\ 0 & \text {e l s e w h e r e ,} \end{array} \right.
$$

where the support of $X$ , $S$ , is free of $\theta$ . Further assume that $p(\theta)$ is an increasing function of $\theta$ . Then

$$
\begin{array}{l} \frac {L \left(\theta^ {\prime}\right)}{L \left(\theta^ {\prime \prime}\right)} = \frac {\exp \left[ p \left(\theta^ {\prime}\right) \sum_ {1} ^ {n} K \left(x _ {i}\right) + \sum_ {1} ^ {n} H \left(x _ {i}\right) + n q \left(\theta^ {\prime}\right) \right]}{\exp \left[ p \left(\theta^ {\prime \prime}\right) \sum_ {1} ^ {n} K \left(x _ {i}\right) + \sum_ {1} ^ {n} H \left(x _ {i}\right) + n q \left(\theta^ {\prime \prime}\right) \right]} \\ = \exp \left\{\left[ p \left(\theta^ {\prime}\right) - p \left(\theta^ {\prime \prime}\right) \right] \sum_ {1} ^ {n} K \left(x _ {i}\right) + n \left[ q \left(\theta^ {\prime}\right) - q \left(\theta^ {\prime \prime}\right) \right] \right\}. \\ \end{array}
$$

If $\theta' < \theta''$ , $p(\theta)$ being an increasing function, requires this ratio to be a decreasing function of $y = \sum_{1}^{n} K(x_i)$ . Thus, we have a monotone likelihood ratio in the statistic $Y = \sum_{1}^{n} K(X_i)$ . Hence consider the hypotheses

$$
H _ {0}: \theta \leq \theta^ {\prime} \text {v e r s u s} H _ {1}: \theta > \theta^ {\prime}. \tag {8.2.5}
$$

By our discussion above concerning mlr, the UMP level $\alpha$ decision rule for testing $H_0$ versus $H_1$ is given by

$$
\operatorname {R e j e c t} H _ {0} \text {i f} Y = \sum_ {i = 1} ^ {n} K (X _ {i}) \geq c,
$$

where $c$ is such that $\alpha = P_{\theta'}[Y \geq c]$ . Furthermore, the power function of this test is an increasing function in $\theta$ .

For the record, consider the other one-sided alternative hypotheses,

$$
H _ {0}: \theta \geq \theta^ {\prime} \text {v e r s u s} H _ {1}: \theta <   \theta^ {\prime}. \tag {8.2.6}
$$

The UMP level $\alpha$ decision rule is, for $p(\theta)$ an increasing function,

$$
\operatorname {R e j e c t} H _ {0} \text {i f} Y = \sum_ {i = 1} ^ {n} K (X _ {i}) \leq c,
$$

where $c$ is such that $\alpha = P_{\theta'}[Y \leq c]$ .

If in the preceding situation with monotone likelihood ratio we test $H_0: \theta = \theta'$ against $H_1: \theta > \theta'$ , then $\sum K(x_i) \geq c$ would be a uniformly most powerful critical region. From the likelihood ratios displayed in Examples 8.2.2-8.2.5, we see immediately that the respective critical regions

$$
\sum_ {i = 1} ^ {n} x _ {i} ^ {2} \geq c, \quad \sum_ {i = 1} ^ {n} x _ {i} \geq c, \quad \sum_ {i = 1} ^ {n} x _ {i} \geq c, \quad \sum_ {i = 1} ^ {n} x _ {i} \geq c
$$

are uniformly most powerful for testing $H_0: \theta = \theta'$ against $H_1: \theta > \theta'$ .

There is a final remark that should be made about uniformly most powerful tests. Of course, in Definition 8.2.1, the word uniformly is associated with $\theta$ ; that is, $C$ is a best critical region of size $\alpha$ for testing $H_0: \theta = \theta_0$ against all $\theta$ values given by the composite alternative $H_1$ . However, suppose that the form of such a region is

$$
u (x _ {1}, x _ {2}, \dots , x _ {n}) \leq c.
$$

Then this form provides uniformly most powerful critical regions for all attainable $\alpha$ values by, of course, appropriately changing the value of $c$ . That is, there is a certain uniformity property, also associated with $\alpha$ , that is not always noted in statistics texts.

# EXERCISES

8.2.1. Let $X$ have the pmf $f(x; \theta) = \theta^x (1 - \theta)^{1 - x}$ , $x = 0, 1$ , zero elsewhere. We test the simple hypothesis $H_0: \theta = \frac{1}{4}$ against the alternative composite hypothesis $H_1: \theta < \frac{1}{4}$ by taking a random sample of size 10 and rejecting $H_0: \theta = \frac{1}{4}$ if and only if the observed values $x_1, x_2, \ldots, x_{10}$ of the sample observations are such that $\sum_{1}^{10} x_i \leq 1$ . Find the power function $\gamma(\theta)$ , $0 < \theta \leq \frac{1}{4}$ , of this test.

8.2.2. Let $X$ have a pdf of the form $f(x; \theta) = 1 / \theta$ , $0 < x < \theta$ , zero elsewhere. Let $Y_1 < Y_2 < Y_3 < Y_4$ denote the order statistics of a random sample of size 4 from this distribution. Let the observed value of $Y_4$ be $y_4$ . We reject $H_0: \theta = 1$ and accept $H_1: \theta \neq 1$ if either $y_4 \leq \frac{1}{2}$ or $y_4 > 1$ . Find the power function $\gamma(\theta)$ , $0 < \theta$ , of the test.

8.2.3. Consider a normal distribution of the form $N(\theta, 4)$ . The simple hypothesis $H_0: \theta = 0$ is rejected, and the alternative composite hypothesis $H_1: \theta > 0$ is accepted if and only if the observed mean $\overline{x}$ of a random sample of size 25 is greater than or equal to $\frac{3}{5}$ . Find the power function $\gamma(\theta)$ , $0 \leq \theta$ , of this test.

8.2.4. Consider the distributions $N(\mu_1, 400)$ and $N(\mu_2, 225)$ . Let $\theta = \mu_1 - \mu_2$ . Let $\overline{x}$ and $\overline{y}$ denote the observed means of two independent random samples, each of size $n$ , from these two distributions. We reject $H_0: \theta = 0$ and accept $H_1: \theta > 0$ if and only if $\overline{x} - \overline{y} \geq c$ . If $\gamma(\theta)$ is the power function of this test, find $n$ and $c$ so that $\gamma(0) = 0.05$ and $\gamma(10) = 0.90$ , approximately.

8.2.5. Consider Example 8.2.2. Show that $L(\theta)$ has a monotone likelihood ratio in the statistic $\sum_{i=1}^{n} X_i^2$ . Use this to determine the UMP test for $H_0: \theta = \theta'$ , where $\theta'$ is a fixed positive number, versus $H_1: \theta < \theta'$ .

8.2.6. If, in Example 8.2.2 of this section, $H_0: \theta = \theta'$ , where $\theta'$ is a fixed positive number, and $H_1: \theta \neq \theta'$ , show that there is no uniformly most powerful test for testing $H_0$ against $H_1$ .

8.2.7. Let $X_{1}, X_{2}, \ldots, X_{25}$ denote a random sample of size 25 from a normal distribution $N(\theta, 100)$ . Find a uniformly most powerful critical region of size $\alpha = 0.10$ for testing $H_{0}: \theta = 75$ against $H_{1}: \theta > 75$ .

8.2.8. Let $X_{1}, X_{2}, \ldots, X_{n}$ denote a random sample from a normal distribution $N(\theta, 16)$ . Find the sample size $n$ and a uniformly most powerful test of $H_{0}: \theta = 25$ against $H_{1}: \theta < 25$ with power function $\gamma(\theta)$ so that approximately $\gamma(25) = 0.10$ and $\gamma(23) = 0.90$ .

8.2.9. Consider a distribution having a pmf of the form $f(x; \theta) = \theta^x (1 - \theta)^{1 - x}$ , $x = 0, 1$ , zero elsewhere. Let $H_0: \theta = \frac{1}{20}$ and $H_1: \theta > \frac{1}{20}$ . Use the Central Limit Theorem to determine the sample size $n$ of a random sample so that a uniformly most powerful test of $H_0$ against $H_1$ has a power function $\gamma(\theta)$ , with approximately $\gamma\left(\frac{1}{20}\right) = 0.05$ and $\gamma\left(\frac{1}{10}\right) = 0.90$ .

8.2.10. Illustrative Example 8.2.1 of this section dealt with a random sample of size $n = 2$ from a gamma distribution with $\alpha = 1$ , $\beta = \theta$ . Thus the mgf of the distribution is $(1 - \theta t)^{-1}$ , $t < 1 / \theta$ , $\theta \geq 2$ . Let $Z = X_{1} + X_{2}$ . Show that $Z$ has a gamma distribution with $\alpha = 2$ , $\beta = \theta$ . Express the power function $\gamma(\theta)$ of Example 8.2.1 in terms of a single integral. Generalize this for a random sample of size $n$ .

8.2.11. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a distribution with pdf $f(x; \theta) = \theta x^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere, where $\theta > 0$ . Show the likelihood has mlr in the statistic $\prod_{i=1}^{n} X_{i}$ . Use this to determine the UMP test for $H_{0}: \theta = \theta'$ against $H_{1}: \theta < \theta'$ , for fixed $\theta' > 0$ .

8.2.12. Let $X$ have the pdf $f(x; \theta) = \theta^x (1 - \theta)^{1 - x}$ , $x = 0, 1$ , zero elsewhere. We test $H_0: \theta = \frac{1}{2}$ against $H_1: \theta < \frac{1}{2}$ by taking a random sample $X_1, X_2, \ldots, X_5$ of size $n = 5$ and rejecting $H_0$ if $Y = \sum_{i=1}^{n} X_i$ is observed to be less than or equal to a constant $c$ .

(a) Show that this is a uniformly most powerful test.   
(b) Find the significance level when $c = 1$ .   
(c) Find the significance level when $c = 0$ .   
(d) By using a randomized test, as discussed in Example 4.6.4, modify the tests given in parts (b) and (c) to find a test with significance level $\alpha = \frac{2}{32}$ .

8.2.13. Let $X_{1}, \ldots, X_{n}$ denote a random sample from a gamma-type distribution with $\alpha = 2$ and $\beta = \theta$ . Let $H_{0}: \theta = 1$ and $H_{1}: \theta > 1$ .

(a) Show that there exists a uniformly most powerful test for $H_0$ against $H_1$ , determine the statistic $Y$ upon which the test may be based, and indicate the nature of the best critical region.   
(b) Find the pdf of the statistic $Y$ in part (a). If we want a significance level of 0.05, write an equation that can be used to determine the critical region. Let $\gamma(\theta)$ , $\theta \geq 1$ , be the power function of the test. Express the power function as an integral.

8.2.14. Show that the mlr test defined by expression (8.2.3) is an unbiased test for the hypotheses (8.2.1).

# 8.3 Likelihood Ratio Tests

In the first section of this chapter, we presented the most powerful tests for simple versus simple hypotheses. In the second section, we extended this theory to uniformly most powerful tests for essentially one-sided alternative hypotheses and families of distributions that have a monotone likelihood ratio. What about the general case? That is, suppose the random variable $X$ has pdf or pmf $f(x; \pmb{\theta})$ , where $\pmb{\theta}$ is a vector of parameters in $\Omega$ . Let $\omega \subset \Omega$ and consider the hypotheses

$$
H _ {0}: \boldsymbol {\theta} \in \omega \text {v e r s u s} H _ {1}: \boldsymbol {\theta} \in \Omega \cap \omega^ {c}. \tag {8.3.1}
$$

There are complications in extending the optimal theory to this general situation, which are addressed in more advanced books; see, in particular, Lehmann (1986). We illustrate some of these complications with an example. Suppose $X$ has a $N(\theta_1, \theta_2)$ distribution and that we want to test $\theta_1 = \theta_1'$ , where $\theta_1'$ is specified. In the notation of (8.3.1), $\pmb{\theta} = (\theta_1, \theta_2)$ , $\Omega = \{\pmb{\theta}: -\infty < \theta_1 < \infty, \theta_2 > 0\}$ , and $\omega = \{\pmb{\theta}: \theta_1 = \theta_1', \theta_2 > 0\}$ . Notice that $H_0: \pmb{\theta} \in \omega$ is a composite null hypothesis. Let $X_1, \ldots, X_n$ be a random sample on $X$ .

Assume for the moment that $\theta_{2}$ is known. Then $H_{0}$ becomes the simple hypothesis $\theta_{1} = \theta_{1}^{\prime}$ . This is essentially the situation discussed in Example 8.2.3. There

it was shown that no UMP test exists for this situation. If we restrict attention to the class of unbiased tests (Definition 8.1.2), then a theory of best tests can be constructed; see Lehmann (1986). For our illustrative example, as Exercise 8.3.21 shows, the test based on the critical region

$$
C _ {2} = \left\{| \overline {{X}} - \theta_ {1} ^ {\prime} | > \sqrt {\frac {\theta_ {2}}{n}} z _ {\alpha / 2} \right\}
$$

is unbiased. Then it follows from Lehmann that it is an UMP unbiased level $\alpha$ test.

In practice, though, the variance $\theta_{2}$ is unknown. In this case, theory for optimal tests can be constructed using the concept of what are called conditional tests. We do not pursue this any further in this text, but refer the interested reader to Lehmann (1986).

Recall from Chapter 6 that the likelihood ratio tests (6.3.3) can be used to test general hypotheses such as (8.3.1). While in general the exact null distribution of the test statistic cannot be determined, under regularity conditions the likelihood ratio test statistic is asymptotically $\chi^2$ under $H_0$ . Hence we can obtain an approximate test in most situations. Although, there is no guarantee that likelihood ratio tests are optimal, similar to tests based on the Neyman-Pearson Theorem, they are based on a ratio of likelihood functions and, in many situations, are asymptotically optimal.

In the example above on testing for the mean of a normal distribution, with known variance, the likelihood ratio test is the same as the UMP unbiased test. When the variance is unknown, the likelihood ratio test results in the one-sample $t$ -test as shown in Example 6.5.1 of Chapter 6. This is the same as the conditional test discussed in Lehmann (1986).

In the remainder of this section, we present likelihood ratio tests for situations when sampling from normal distributions.

# 8.3.1 Likelihood Ratio Tests for Testing Means of Normal Distributions

In Example 6.5.1 of Chapter 6, we derived the likelihood ratio test for the one-sample $t$ -test to test for the mean of a normal distribution with unknown variance. In the next example, we derive the likelihood ratio test for comparing the means of two independent normal distributions. We then discuss the power functions for both of these tests.

Example 8.3.1. Let the independent random variables $X$ and $Y$ have distributions that are $N(\theta_1, \theta_3)$ and $N(\theta_2, \theta_3)$ , where the means $\theta_1$ and $\theta_2$ and common variance $\theta_3$ are unknown. Then $\Omega = \{ (\theta_1, \theta_2, \theta_3) : -\infty < \theta_1 < \infty, -\infty < \theta_2 < \infty, 0 < \theta_3 < \infty \}$ . Let $X_1, X_2, \ldots, X_n$ and $Y_1, Y_2, \ldots, Y_m$ denote independent random samples from these distributions. The hypothesis $H_0 : \theta_1 = \theta_2$ , unspecified, and $\theta_3$ unspecified, is to be tested against all alternatives. Then $\omega = \{ (\theta_1, \theta_2, \theta_3) : -\infty < \theta_1 = \theta_2 < \infty, 0 < \theta_3 < \infty \}$ . Here $X_1, X_2, \ldots, X_n, Y_1, Y_2, \ldots, Y_m$ are $n + m > 2$ mutually

independent random variables having the likelihood functions

$$
L (\omega) = \left(\frac {1}{2 \pi \theta_ {3}}\right) ^ {(n + m) / 2} \exp \left\{- \frac {1}{2 \theta_ {3}} \left[ \sum_ {1} ^ {n} (x _ {i} - \theta_ {1}) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - \theta_ {1}) ^ {2} \right] \right\}
$$

and

$$
L (\Omega) = \left(\frac {1}{2 \pi \theta_ {3}}\right) ^ {(n + m) / 2} \exp \left\{- \frac {1}{2 \theta_ {3}} \left[ \sum_ {1} ^ {n} (x _ {i} - \theta_ {1}) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - \theta_ {2}) ^ {2} \right] \right\}.
$$

If $\partial \log L(\omega) / \partial \theta_{1}$ and $\partial \log L(\omega) / \partial \theta_{3}$ are equated to zero, then (Exercise 8.3.2)

$$
\begin{array}{l} \sum_ {1} ^ {n} \left(x _ {i} - \theta_ {1}\right) + \sum_ {1} ^ {m} \left(y _ {i} - \theta_ {1}\right) = 0 \\ \frac {1}{\theta_ {3}} \left[ \sum_ {1} ^ {n} \left(x _ {i} - \theta_ {1}\right) ^ {2} + \sum_ {1} ^ {m} \left(y _ {i} - \theta_ {1}\right) ^ {2} \right] = n + m. \tag {8.3.2} \\ \end{array}
$$

The solutions for $\theta_{1}$ and $\theta_{3}$ are, respectively,

$$
\begin{array}{l} u = (n + m) ^ {- 1} \left\{\sum_ {1} ^ {n} x _ {i} + \sum_ {1} ^ {m} y _ {i} \right\} \\ w = (n + m) ^ {- 1} \left\{\sum_ {1} ^ {n} (x _ {i} - u) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - u) ^ {2} \right\}. \\ \end{array}
$$

Further, $u$ and $w$ maximize $L(\omega)$ . The maximum is

$$
L (\hat {\omega}) = \left(\frac {e ^ {- 1}}{2 \pi w}\right) ^ {(n + m) / 2}.
$$

In a like manner, if

$$
\frac {\partial \log L (\Omega)}{\partial \theta_ {1}}, \quad \frac {\partial \log L (\Omega)}{\partial \theta_ {2}}, \quad \frac {\partial \log L (\Omega)}{\partial \theta_ {3}}
$$

are equated to zero, then (Exercise 8.3.3)

$$
\begin{array}{l} \sum_ {1} ^ {n} (x _ {i} - \theta_ {1}) = 0 \\ \sum_ {1} ^ {m} \left(y _ {i} - \theta_ {2}\right) = 0 \tag {8.3.3} \\ - (n + m) + \frac {1}{\theta_ {3}} \left[ \sum_ {1} ^ {n} (x _ {i} - \theta_ {1}) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - \theta_ {2}) ^ {2} \right] = 0. \\ \end{array}
$$

The solutions for $\theta_{1}$ , $\theta_{2}$ , and $\theta_{3}$ are, respectively,

$$
u _ {1} = n ^ {- 1} \sum_ {1} ^ {n} x _ {i}
$$

$$
u _ {2} = m ^ {- 1} \sum_ {1} ^ {m} y _ {i}
$$

$$
w ^ {\prime} = (n + m) ^ {- 1} \left[ \sum_ {1} ^ {n} (x _ {i} - u _ {1}) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - u _ {2}) ^ {2} \right],
$$

and, further, $u_{1}$ , $u_{2}$ , and $w'$ maximize $L(\Omega)$ . The maximum is

$$
L (\hat {\Omega}) = \left(\frac {e ^ {- 1}}{2 \pi w ^ {\prime}}\right) ^ {(n + m) / 2},
$$

so that

$$
\Lambda (x _ {1}, \ldots , x _ {n}, y _ {1}, \ldots , y _ {m}) = \Lambda = \frac {L (\hat {\omega})}{L (\hat {\Omega})} = \left(\frac {w ^ {\prime}}{w}\right) ^ {(n + m) / 2}.
$$

The random variable defined by $\Lambda^{2 / (n + m)}$ is

$$
\frac {\sum_ {1} ^ {n} \left(X _ {i} - \overline {{X}}\right) ^ {2} + \sum_ {1} ^ {m} \left(Y _ {i} - \overline {{Y}}\right) ^ {2}}{\sum_ {1} ^ {n} \left\{X _ {i} - \left[ (n \overline {{X}} + m \overline {{Y}}) / (n + m) \right] \right\} ^ {2} + \sum_ {1} ^ {n} \left\{Y _ {i} - \left[ (n \overline {{X}} + m \overline {{Y}}) / (n + m) \right] \right\} ^ {2}}.
$$

Now

$$
\begin{array}{l} \sum_ {1} ^ {n} \left(X _ {i} - \frac {n \overline {{X}} + m \overline {{Y}}}{n + m}\right) ^ {2} = \sum_ {1} ^ {n} \left[ (X _ {i} - \overline {{X}}) + \left(\overline {{X}} - \frac {n \overline {{X}} + m \overline {{Y}}}{n + m}\right) \right] ^ {2} \\ = \sum_ {1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} + n \left(\bar {X} - \frac {n \bar {X} + m \bar {Y}}{n + m}\right) ^ {2} \\ \end{array}
$$

and

$$
\begin{array}{l} \sum_ {1} ^ {m} \left(Y _ {i} - \frac {n \bar {X} + m \bar {Y}}{n + m}\right) ^ {2} = \sum_ {1} ^ {m} \left[ \left(Y _ {i} - \bar {Y}\right) + \left(\bar {Y} - \frac {n \bar {X} + m \bar {Y}}{n + m}\right) \right] ^ {2} \\ = \sum_ {1} ^ {m} (Y _ {i} - \overline {{Y}}) ^ {2} + m \left(\overline {{Y}} - \frac {n \overline {{X}} + m \overline {{Y}}}{n + m}\right) ^ {2}. \\ \end{array}
$$

But

$$
n \left(\overline {{X}} - \frac {n \overline {{X}} + m \overline {{Y}}}{n + m}\right) ^ {2} = \frac {m ^ {2} n}{(n + m) ^ {2}} (\overline {{X}} - \overline {{Y}}) ^ {2}
$$

and

$$
m \left(\overline {{Y}} - \frac {n \overline {{X}} + m \overline {{Y}}}{n + m}\right) ^ {2} = \frac {n ^ {2} m}{(n + m) ^ {2}} (\overline {{X}} - \overline {{Y}}) ^ {2}.
$$

Hence the random variable defined by $\Lambda^{2 / (n + m)}$ may be written

$$
\begin{array}{l} \frac {\sum_ {1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} + \sum_ {1} ^ {m} \left(Y _ {i} - \bar {Y}\right) ^ {2}}{\sum_ {1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} + \sum_ {1} ^ {m} \left(Y _ {i} - \bar {Y}\right) ^ {2} + [ n m / (n + m) ] (\bar {X} - \bar {Y}) ^ {2}} \\ = \frac {1}{1 + \frac {[ n m / (n + m) ] (\overline {{X}} - \overline {{Y}}) ^ {2}}{\sum_ {1} ^ {n} (X _ {i} - \overline {{X}}) ^ {2} + \sum_ {1} ^ {m} (Y _ {i} - \overline {{Y}}) ^ {2}}}. \\ \end{array}
$$

If the hypothesis $H_0:\theta_1 = \theta_2$ is true, the random variable

$$
T = \sqrt {\frac {n m}{n + m}} (\bar {X} - \bar {Y}) \left\{(n + m - 2) ^ {- 1} \left[ \sum_ {1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} + \sum_ {1} ^ {m} \left(Y _ {i} - \bar {Y}\right) ^ {2} \right] \right\} ^ {- 1 / 2} \tag {8.3.4}
$$

has, in accordance with Section 3.6, a $t$ -distribution with $n + m - 2$ degrees of freedom. Thus the random variable defined by $\Lambda^{2 / (n + m)}$ is

$$
\frac {n + m - 2}{(n + m - 2) + T ^ {2}}.
$$

The test of $H_0$ against all alternatives may then be based on a $t$ -distribution with $n + m - 2$ degrees of freedom.

The likelihood ratio principle calls for the rejection of $H_0$ if and only if $\Lambda \leq \lambda_0 < 1$ . Thus the significance level of the test is

$$
\alpha = P _ {H _ {0}} [ \Lambda (X _ {1}, \dots , X _ {n}, Y _ {1}, \dots , Y _ {m}) \leq \lambda_ {0} ].
$$

However, $\Lambda(X_1, \ldots, X_n, Y_1, \ldots, Y_m) \leq \lambda_0$ is equivalent to $|T| \geq c$ , and so

$$
\alpha = P (| T | \geq c; H _ {0}).
$$

For given values of $n$ and $m$ , the number $c$ is easily computed. In R, $c = \mathbf{q}\mathbf{t}(1 - \alpha / 2, n + m - 2)$ . Then $H_0$ is rejected at a significance level $\alpha$ if and only if $|t| \geq c$ , where $t$ is the observed value of $T$ . If, for instance, $n = 10$ , $m = 6$ , and $\alpha = 0.05$ , then $c = \mathbf{q}\mathbf{t}(0.975, 14) = 2.1448$ .

For this last example as well as the one-sample $t$ -test derived in Example 6.5.1, it was found that the likelihood ratio test could be based on a statistic that, when the hypothesis $H_0$ is true, has a $t$ -distribution. To help us compute the power functions of these tests at parameter points other than those described by the hypothesis $H_0$ , we turn to the following definition.

Definition 8.3.1. Let the random variable $W$ be $N(\delta, 1)$ ; let the random variable $V$ be $\chi^2(r)$ , and let $W$ and $V$ be independent. The quotient

$$
T = \frac {W}{\sqrt {V / r}}
$$

is said to have a noncentral $t$ -distribution with $r$ degrees of freedom and noncentrality parameter $\delta$ . If $\delta = 0$ , we say that $T$ has a central $t$ -distribution.

In the light of this definition, let us reexamine the $t$ -statistics of Examples 6.5.1 and 8.3.1.

Example 8.3.2 (Power of the One Sample $t$ -Test). For Example 6.5.1, consider a more general situation. Assume that $X_{1},\ldots ,X_{n}$ is a random sample on $X$ that has a $N(\mu ,\sigma^2)$ distribution. We are interested in testing $H_0:\mu = \mu_0$ versus $H_{1}:\mu \neq \mu_{0}$ , where $\mu_0$ is specified. Then from Example 6.5.1, the likelihood ratio test statistic is

$$
\begin{array}{l} t (X _ {1}, \dots , X _ {n}) = \frac {\sqrt {n} (\bar {X} - \mu_ {0})}{\sqrt {\sum_ {1} ^ {n} (X _ {i} - \bar {X}) ^ {2} / (n - 1)}} \\ = \frac {\sqrt {n} (\bar {X} - \mu_ {0}) / \sigma}{\sqrt {\sum_ {1} ^ {n} (X _ {i} - \bar {X}) ^ {2} / [ \sigma^ {2} (n - 1) ]}}. \\ \end{array}
$$

The hypothesis $H_0$ is rejected at level $\alpha$ if $|t| \geq t_{\alpha / 2, n - 1}$ . Suppose $\mu_1 \neq \mu_0$ is an alternative of interest. Because $E_{\mu_1}[\sqrt{nX} / \sigma \sqrt{nX} / \sigma] = \sqrt{n} (\mu_1 - \mu_0) / \sigma$ , the power of the test to detect $\mu_1$ is

$$
\gamma (\mu_ {1}) = P (| t | \geq t _ {\alpha / 2, n - 1}) = 1 - P (t \leq t _ {\alpha / 2, n - 1}) + P (t \leq - t _ {\alpha / 2, n - 1}), \tag {8.3.5}
$$

where $t$ has a noncentral $t$ -distribution with noncentrality parameter $\delta = \sqrt{n} (\mu_1 - \mu_0) / \sigma$ and $n - 1$ degrees of freedom. This is computed in $\mathbb{R}$ by the call

1 - pt(tc,n-1,ncp=delta) + pt(-tc,n-1,ncp=delta)

where $\mathsf{tc}$ is $t_{\alpha /2,n - 1}$ and delta is the noncentrality parameter $\delta$ .

The following R code computes a graph of the power curve of this test. Notice that the horizontal range of the plot is the interval $\left[\mu_0 - 4\sigma /\sqrt{n},\mu_0 + 4\sigma /\sqrt{n}\right]$ . As indicated the parameters need to be set.

## Input mu0, sig, n, alpha.
fse = 4*sig/sqrt(n); maxmu = mu0 + fse; tc = qt(1-(alpha/2),n-1)
minmu = mu0 -fse; mu1 = seq(minmu,maxmu,.1)
delta = (mu1-mu0)/(sig/sqrt(n))
gs = 1 - pt(tc,n-1,ncp=delta) + pt(-tc,n-1,ncp=delta)
plot(gs~mu1,pch=" ",xlab=expression(mu[1]),ylab=expression(gamma))
lines(gs~mu1)

This code is the body of the function tpowerg.R. Exercise 8.3.5 discusses its use.

Example 8.3.3 (Power of the Two Sample $t$ -Test). In Example 8.3.1 we had

$$
T = \frac {W _ {2}}{\sqrt {V _ {2} / (n + m - 2)}},
$$

where

$$
W _ {2} = \sqrt {\frac {n m}{n + m}} (\overline {{X}} - \overline {{Y}}) \Bigg / \sigma
$$

and

$$
V _ {2} = \frac {\sum_ {1} ^ {n} (X _ {i} - \bar {X}) ^ {2} + \sum_ {1} ^ {m} (Y _ {i} - \bar {Y}) ^ {2}}{\sigma^ {2}}.
$$

Here $W_{2}$ is $N[\sqrt{nm / (n + m)} (\theta_{1} - \theta_{2}) / \sigma, 1]$ , $V_{2}$ is $\chi^2 (n + m - 2)$ , and $W_{2}$ and $V_{2}$ are independent. Accordingly, if $\theta_{1} \neq \theta_{2}$ , $T$ has a noncentral $t$ -distribution with $n + m - 2$ degrees of freedom and noncentrality parameter $\delta_{2} = \sqrt{nm / (n + m)} (\theta_{1} - \theta_{2}) / \sigma$ . It is interesting to note that $\delta_{1} = \sqrt{n}\theta_{1} / \sigma$ measures the deviation of $\theta_{1}$ from $\theta_{1} = 0$ in units of the standard deviation $\sigma / \sqrt{n}$ of $\overline{X}$ . The noncentrality parameter $\delta_{2} = \sqrt{nm / (n + m)} (\theta_{1} - \theta_{2}) / \sigma$ is equal to the deviation of $\theta_{1} - \theta_{2}$ from $\theta_{1} - \theta_{2} = 0$ in units of the standard deviation $\sigma / \sqrt{(n + m) / mn}$ of $\overline{X} - \overline{Y}$ .

As in the last example, it is easy to write R code that evaluates power for this test. For a numerical illustration, assume that the common variance is $\theta_{3} = 100$ , $n = 20$ , and $m = 15$ . Suppose $\alpha = 0.05$ and we want to determine the power of the test to detect $\Delta = 5$ , where $\Delta = \theta_{1} - \theta_{2}$ . In this case the critical value is $t_{0.25,33} = \mathrm{qt}(975,33) = 2.0345$ and the noncentrality parameter is $\delta_{2} = 1.4639$ . The power is computed as

1- pt(2.0345,33,ncp=1.4639) + pt(-2.0345,33,ncp=1.4639) = 0.2954 Hence, the test has a $29.4\%$ chance of detecting a difference in means of 5.

Remark 8.3.1. The one- and two-sample tests for normal means, presented in Examples 6.5.1 and 8.3.1, are the tests for normal means presented in most elementary statistics books. They are based on the assumption of normality. What if the underlying distributions are not normal? In that case, with finite variances, the $t$ -test statistics for these situations are asymptotically correct. For example, consider the one-sample $t$ -test. Suppose $X_{1}, \ldots, X_{n}$ are iid with a common nonnormal pdf that has mean $\theta_{1}$ and finite variance $\sigma^{2}$ . The hypotheses remain the same, i.e., $H_{0}: \theta_{1} = \theta_{1}^{\prime}$ versus $H_{1}: \theta_{1} \neq \theta_{1}^{\prime}$ . The $t$ -test statistic, $T_{n}$ , is given by

$$
T _ {n} = \frac {\sqrt {n} \left(\bar {X} - \theta_ {1} ^ {\prime}\right)}{S _ {n}}, \tag {8.3.6}
$$

where $S_{n}$ is the sample standard deviation. Our critical region is $C_1 = \{|T_n| \geq t_{\alpha / 2, n - 1}\}$ . Recall that $S_{n} \to \sigma$ in probability. Hence, by the Central Limit Theorem, under $H_{0}$ ,

$$
T _ {n} = \frac {\sigma}{S _ {n}} \frac {\sqrt {n} \left(\bar {X} - \theta_ {1} ^ {\prime}\right)}{\sigma} \stackrel {D} {\rightarrow} Z, \tag {8.3.7}
$$

where $Z$ has a standard normal distribution. Hence the asymptotic test would use the critical region $C_2 = \{|T_n| \geq z_{\alpha/2}\}$ . By (8.3.7) the critical region $C_2$ would have approximate size $\alpha$ . In practice, we would use $C_1$ , because $t$ critical values are generally larger than $z$ critical values and, hence, the use of $C_1$ would be conservative; i.e., the size of $C_1$ would be slightly smaller than that of $C_2$ . As Exercise 8.3.4 shows, the two-sample $t$ -test is also asymptotically correct, provided the underlying distributions have the same variance.

For nonnormal situations where the distribution is "close" to the normal distribution, the $t$ -test is essentially valid; i.e., the true level of significance is close to the nominal $\alpha$ . In terms of robustness, we would say that for these situations the $t$ -test possesses robustness of validity. But the $t$ -test may not possess robustness of power. For nonnormal situations, there are more powerful tests than the $t$ -test; see Chapter 10 for discussion.

For finite sample sizes and for distributions that are decidedly not normal, very skewed for instance, the validity of the $t$ -test may also be questionable, as we illustrate in the following simulation study.

Example 8.3.4 (Skewed Contaminated Normal Family of Distributions). Consider the random variable $X$ given by

$$
X = \left(1 - I _ {\epsilon}\right) Z + I _ {\epsilon} Y, \tag {8.3.8}
$$

where $Z$ has a $N(0,1)$ distribution, $Y$ has a $N(\mu_c, \sigma_c^2)$ distribution, $I_{\epsilon}$ has a $bin(1, \epsilon)$ distribution, and $Z, Y, I_{\epsilon}$ are mutually independent. Assume that $\epsilon < 0.5$ and $\sigma_c > 1$ , so that $Y$ is the contaminating random variable in the mixture. If $\mu_c = 0$ , then $X$ has the contaminated normal distribution discussed in Section 3.4.1, which is symmetrically distributed about 0. For $\mu_c \neq 0$ , the distribution of $X$ , (8.3.8), is skewed and we call it the skewed contaminated normal distribution, $SCN(\epsilon, \sigma_c, \mu_C)$ . Note that $E(X) = \epsilon \mu_c$ and in Exercise 8.3.18 the cdf and pdf of $X$ are derived. The R function rscn generates random variates from this distribution.

In this example, we show the results of a small simulation study on the validity of the $t$ -test for random samples from the distribution of $X$ . Consider the one-sided hypotheses

$$
H _ {0}: \mu = \mu_ {X} \text {v e r s u s} H _ {0}: \mu <   \mu_ {X}.
$$

Let $X_{1},X_{2},\ldots ,X_{n}$ be a random sample from the distribution of $X$ . As a test statistic we consider the $t$ -test discussed in Example 4.5.4, which is also given in expression (8.3.6); that is, the test statistic is $T_{n} = (\overline{X} -\mu_{X}) / (S_{n} / \sqrt{n})$ , where $\overline{X}$ and $S_{n}$ are the sample mean and standard deviation of $X_{1},X_{2},\ldots ,X_{n}$ , respectively. We set the level of significance at $\alpha = 0.05$ and used the decision rule: Reject $H_{0}$ if $T_{n}\leq t_{0.05,n - 1}$ . For the study, we set $n = 30$ , $\epsilon = 0.20$ , and $\sigma_c = 25$ . For $\mu_c$ , we selected the five values of 0, 5, 10, 15, and 20, as shown in Table 8.3.1. For each of these five situations, we ran 10,000 simulations and recorded $\widehat{\alpha}$ , which is the number of rejections of $H_{0}$ divided by the number of simulations, i.e., the empirical $\alpha$ level.

For the test to be valid, $\widehat{\alpha}$ should be close to the nominal value of 0.05. As Table 8.3.1 shows, though, for all cases other than $\mu_c = 0$ , the $t$ -test is quite liberal; that is, its empirical significance level far exceeds the nominal 0.05 level (as Exercise

Table 8.3.1: Empirical $\alpha$ Levels for the Nominal $0.05t$ -Test of Example 8.3.4.   

<table><tr><td></td><td colspan="5">Empirical α</td></tr><tr><td>μc</td><td>0</td><td>5</td><td>10</td><td>15</td><td>20</td></tr><tr><td>α</td><td>0.0458</td><td>0.0961</td><td>0.1238</td><td>0.1294</td><td>0.1301</td></tr></table>

8.3.19 shows, the sampling error in the table is about 0.004). Note that when $\mu_c = 0$ the distribution of $X$ is symmetric about 0 and in this case the empirical level is close to the nominal value of 0.05.

# 8.3.2 Likelihood Ratio Tests for Testing Variances of Normal Distributions

In this section, we discuss likelihood ratio tests for variances of normal distributions. In the next example, we begin with the two sample problem.

Example 8.3.5. In Example 8.3.1, in testing the equality of the means of two normal distributions, it was assumed that the unknown variances of the distributions were equal. Let us now consider the problem of testing the equality of these two unknown variances. We are given the independent random samples $X_{1},\ldots ,X_{n}$ and $Y_{1},\ldots ,Y_{m}$ from the distributions, which are $N(\theta_1,\theta_3)$ and $N(\theta_2,\theta_4)$ , respectively. We have

$$
\Omega = \left\{\left(\theta_ {1}, \theta_ {2}, \theta_ {3}, \theta_ {4}\right): - \infty <   \theta_ {1}, \theta_ {2} <   \infty , 0 <   \theta_ {3}, \theta_ {4} <   \infty \right\}.
$$

The hypothesis $H_0: \theta_3 = \theta_4$ , unspecified, with $\theta_1$ and $\theta_2$ also unspecified, is to be tested against all alternatives. Then

$$
\omega = \left\{\left(\theta_ {1}, \theta_ {2}, \theta_ {3}, \theta_ {4}\right): - \infty <   \theta_ {1}, \theta_ {2} <   \infty , 0 <   \theta_ {3} = \theta_ {4} <   \infty \right\}.
$$

It is easy to show (see Exercise 8.3.11) that the statistic defined by $\Lambda = L(\hat{\omega}) / L(\hat{\Omega})$ is a function of the statistic

$$
F = \frac {\sum_ {1} ^ {n} \left(X _ {i} - \bar {X}\right) ^ {2} / (n - 1)}{\sum_ {1} ^ {m} \left(Y _ {i} - \bar {Y}\right) ^ {2} / (m - 1)}. \tag {8.3.9}
$$

If $\theta_{3} = \theta_{4}$ , this statistic $F$ has an $F$ -distribution with $n - 1$ and $m - 1$ degrees of freedom. The hypothesis that $(\theta_{1},\theta_{2},\theta_{3},\theta_{4}) \in \omega$ is rejected if the computed $F \leq c_{1}$ or if the computed $F \geq c_{2}$ . The constants $c_{1}$ and $c_{2}$ are usually selected so that, if $\theta_{3} = \theta_{4}$ ,

$$
P (F \leq c _ {1}) = P (F \geq c _ {2}) = \frac {\alpha_ {1}}{2},
$$

where $\alpha_{1}$ is the desired significance level of this test. The power function of this test is derived in Exercise 8.3.10.

Remark 8.3.2. We caution the reader on this last test for the equality of two variances. In Remark 8.3.1, we discussed that the one- and two-sample $t$ -tests for means are asymptotically correct. The two-sample variance test of the last example is not, however; see, for example, page 143 of Hettmansperger and McKean (2011). If the underlying distributions are not normal, then the $F$ -critical values may be far from valid critical values (unlike the $t$ -critical values for the means tests as discussed in Remark 8.3.1). In a large simulation study, Conover, Johnson, and Johnson (1981) showed that instead of having the nominal size of $\alpha = 0.05$ , the $F$ -test for variances using the $F$ -critical values could have significance levels as high as 0.80, in certain nonnormal situations. Thus the two-sample $F$ -test for variances does not possess robustness of validity. It should only be used in situations where the assumption of normality can be justified. See Exercise 8.3.17 for an illustrative data set.

The corresponding likelihood ratio test for the variance of a normal distribution based on one sample is discussed in Exercise 8.3.9. The cautions raised in Remark 8.3.1, hold for this test also.

Example 8.3.6. Let the independent random variables $X$ and $Y$ have distributions that are $N(\theta_1, \theta_3)$ and $N(\theta_2, \theta_4)$ . In Example 8.3.1, we derived the likelihood ratio test statistic $T$ of the hypothesis $\theta_1 = \theta_2$ when $\theta_3 = \theta_4$ , while in Example 8.3.5 we obtained the likelihood ratio test statistic $F$ of the hypothesis $\theta_3 = \theta_4$ . The hypothesis that $\theta_1 = \theta_2$ is rejected if the computed $|T| \geq c$ , where the constant $c$ is selected so that $\alpha_2 = P(|T| \geq c; \theta_1 = \theta_2, \theta_3 = \theta_4)$ is the assigned significance level of the test. We shall show that, if $\theta_3 = \theta_4$ , the likelihood ratio test statistics for equality of variances and equality of means, respectively $F$ and $T$ , are independent. Among other things, this means that if these two tests based on $F$ and $T$ , respectively, are performed sequentially with significance levels $\alpha_1$ and $\alpha_2$ , the probability of accepting both these hypotheses, when they are true, is $(1 - \alpha_1)(1 - \alpha_2)$ . Thus the significance level of this joint test is $\alpha = 1 - (1 - \alpha_1)(1 - \alpha_2)$ .

Independence of $F$ and $T$ , when $\theta_3 = \theta_4$ , can be established using sufficiency and completeness. The statistics $\overline{X}$ , $\overline{Y}$ , and $\sum_{1}^{n}(X_i - \overline{X})^2 + \sum_{1}^{n}(Y_i - \overline{Y})^2$ are joint complete sufficient statistics for the three parameters $\theta_1, \theta_2$ , and $\theta_3 = \theta_4$ . Obviously, the distribution of $F$ does not depend upon $\theta_1, \theta_2$ , or $\theta_3 = \theta_4$ , and hence $F$ is independent of the three joint complete sufficient statistics. However, $T$ is a function of these three joint complete sufficient statistics alone, and, accordingly, $T$ is independent of $F$ . It is important to note that these two statistics are independent whether $\theta_1 = \theta_2$ or $\theta_1 \neq \theta_2$ . This permits us to calculate probabilities other than the significance level of the test. For example, if $\theta_3 = \theta_4$ and $\theta_1 \neq \theta_2$ , then

$$
P (c _ {1} <   F <   c _ {2}, | T | \geq c) = P (c _ {1} <   F <   c _ {2}) P (| T | \geq c).
$$

The second factor in the right-hand member is evaluated by using the probabilities of a noncentral $t$ -distribution. Of course, if $\theta_3 = \theta_4$ and the difference $\theta_1 - \theta_2$ is large, we would want the preceding probability to be close to 1 because the event $\{c_1 < F < c_2, |T| \geq c\}$ leads to a correct decision, namely, accept $\theta_3 = \theta_4$ and reject $\theta_1 = \theta_2$ .

# EXERCISES

8.3.1. Verzani (2014) discusses a data set on healthy individuals, including their temperatures by gender. The data are in the file tempbygender.rda and the variables of interest are maletemp and femaletemp. Download this file from the site listed in the Preface.

(a) Obtain comparison boxplots. Comment on the plots. Which, if any, gender seems to have lower temperatures? Based on the width of the boxplots, comment on the assumption of equal variances.   
(b) As discussed in Example 8.3.3, compute the two-sample, two-sided $t$ -test that there is no difference in the true mean temperatures between genders. Obtain the $p$ -value of the test and conclude in terms of the problem at the nominal $\alpha$ -level of 0.05.   
(c) Obtain a $95\%$ confidence interval for the difference in means. What does it mean in terms of the problem?

8.3.2. Verify Equations (8.3.2) of Example 8.3.1 of this section.   
8.3.3. Verify Equations (8.3.3) of Example 8.3.1 of this section.   
8.3.4. Let $X_{1},\ldots ,X_{n}$ and $Y_{1},\ldots ,Y_{m}$ follow the location model

$$
\begin{array}{l} X _ {i} = \theta_ {1} + Z _ {i}, i = 1, \dots , n \\ Y _ {i} = \theta_ {2} + Z _ {n + i}, i = 1, \dots , m, \\ \end{array}
$$

where $Z_{1},\ldots ,Z_{n + m}$ are iid random variables with common pdf $f(z)$ . Assume that $E(Z_{i}) = 0$ and $\operatorname{Var}(Z_i) = \theta_3 < \infty$ .

(a) Show that $E(X_{i}) = \theta_{1}$ , $E(Y_{i}) = \theta_{2}$ , and $\operatorname{Var}(X_i) = \operatorname{Var}(Y_i) = \theta_3$ .   
(b) Consider the hypotheses of Example 8.3.1, i.e.,

$$
H _ {0}: \theta_ {1} = \theta_ {2} \text {v e r s u s} H _ {1}: \theta_ {1} \neq \theta_ {2}.
$$

Show that under $H_0$ , the test statistic $T$ given in expression (8.3.4) has a limiting $N(0,1)$ distribution.

(c) Using part (b), determine the corresponding large sample test (decision rule) of $H_0$ versus $H_1$ . (This shows that the test in Example 8.3.1 is asymptotically correct.)

8.3.5. In Example 8.3.2, the power function for the one-sample $t$ -test is discussed.

(a) Plot the power function for the following setup: $X$ has a $N(\mu, \sigma^2)$ distribution; $H_0: \mu = 50$ versus $H_1: \mu \neq 50$ ; $\alpha = 0.05$ ; $n = 25$ ; and $\sigma = 10$ .   
(b) Overlay the power curve in (a) with that for $\alpha = 0.01$ . Comment.   
(c) Overlay the power curve in (a) with that for $n = 35$ . Comment.

(d) Determine the smallest value of $n$ so the power exceeds 0.80 to detect $\mu = 53$ . Hint: Modify the R function tpowerg.R so it returns the power for a specified alternative.

8.3.6. The effect that a certain drug (Drug A) has on increasing blood pressure is a major concern. It is thought that a modification of the drug (Drug B) will lessen the increase in blood pressure. Let $\mu_{A}$ and $\mu_{B}$ be the true mean increases in blood pressure due to Drug A and B, respectively. The hypotheses of interest are $H_{0}:\mu_{A} = \mu_{B} = 0$ versus $H_{1}:\mu_{A} > \mu_{B} = 0$ . The two-sample $t$ -test statistic discussed in Example 8.3.3 is to be used to conduct the analysis. The nominal level is set at $\alpha = 0.05$ For the experimental design assume that the sample sizes are the same; i.e., $m = n$ . Also, based on data from Drug A, $\sigma = 30$ seems to be a reasonable selection for the common standard deviation. Determine the common sample size, so that the difference in means $\mu_{A} - \mu_{B} = 12$ has an $80\%$ detection rate. Suppose when the experiment is over, due to patients dropping out, the sample sizes for Drugs A and B are respectively $n = 72$ and $m = 68$ . What was the actual power of the experiment to detect the difference of 12?

8.3.7. Show that the likelihood ratio principle leads to the same test when testing a simple hypothesis $H_0$ against an alternative simple hypothesis $H_1$ , as that given by the Neyman-Pearson theorem. Note that there are only two points in $\Omega$ .

8.3.8. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from the normal distribution $N(\theta, 1)$ . Show that the likelihood ratio principle for testing $H_{0}: \theta = \theta'$ , where $\theta'$ is specified, against $H_{1}: \theta \neq \theta'$ leads to the inequality $|\overline{x} - \theta'| \geq c$ .

(a) Is this a uniformly most powerful test of $H_0$ against $H_1$ ?   
(b) Is this a uniformly most powerful unbiased test of $H_0$ against $H_1$ ?

8.3.9. Let $X_{1}, X_{2}, \ldots, X_{n}$ be iid $N(\theta_{1}, \theta_{2})$ . Show that the likelihood ratio principle for testing $H_{0} : \theta_{2} = \theta_{2}'$ specified, and $\theta_{1}$ unspecified, against $H_{1} : \theta_{2} \neq \theta_{2}'$ , $\theta_{1}$ unspecified, leads to a test that rejects when $\sum_{1}^{n}(x_{i} - \overline{x})^{2} \leq c_{1}$ or $\sum_{1}^{n}(x_{i} - \overline{x})^{2} \geq c_{2}$ , where $c_{1} < c_{2}$ are selected appropriately.

8.3.10. For the situation discussed in Example 8.3.5, derive the power function for the likelihood ratio test statistic given in expression (8.3.9).

8.3.11. Let $X_{1},\ldots ,X_{n}$ and $Y_{1},\ldots ,Y_{m}$ be independent random samples from the distributions $N(\theta_1,\theta_3)$ and $N(\theta_{2},\theta_{4})$ , respectively.

(a) Show that the likelihood ratio for testing $H_0: \theta_1 = \theta_2$ , $\theta_3 = \theta_4$ against all alternatives is given by

$$
\frac {\left[ \sum_ {1} ^ {n} (x _ {i} - \overline {{x}}) ^ {2} / n \right] ^ {n / 2} \left[ \sum_ {1} ^ {m} (y _ {i} - \overline {{y}}) ^ {2} / m \right] ^ {m / 2}}{\left\{\left[ \sum_ {1} ^ {n} (x _ {i} - u) ^ {2} + \sum_ {1} ^ {m} (y _ {i} - u) ^ {2} \right] \Bigg / (m + n) \right\} ^ {(n + m) / 2}},
$$

where $u = (n\overline{x} + m\overline{y}) / (n + m)$ .

(b) Show that the likelihood ratio for testing $H_0: \theta_3 = \theta_4$ with $\theta_1$ and $\theta_2$ unspecified can be based on the test statistic $F$ given in expression (8.3.9).

8.3.12. Let $Y_{1} < Y_{2} < \dots < Y_{5}$ be the order statistics of a random sample of size $n = 5$ from a distribution with pdf $f(x; \theta) = \frac{1}{2} e^{-|x - \theta|}$ , $-\infty < x < \infty$ , for all real $\theta$ . Find the likelihood ratio test $\Lambda$ for testing $H_{0}: \theta = \theta_{0}$ against $H_{1}: \theta \neq \theta_{0}$ .

8.3.13. A random sample $X_{1}, X_{2}, \ldots, X_{n}$ arises from a distribution given by

$$
H _ {0}: f (x; \theta) = \frac {1}{\theta}, 0 <   x <   \theta , \mathrm {z e r o e l s e w h e r e},
$$

or

$$
H _ {1}: f (x; \theta) = \frac {1}{\theta} e ^ {- x / \theta}, \quad 0 <   x <   \infty , \quad \text {z e r o e l s e w h e r e}.
$$

Determine the likelihood ratio $(\Lambda)$ test associated with the test of $H_0$ against $H_{1}$

8.3.14. Consider a random sample $X_{1}, X_{2}, \ldots, X_{n}$ from a distribution with pdf $f(x; \theta) = \theta (1 - x)^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere, where $\theta > 0$ .

(a) Find the form of the uniformly most powerful test of $H_0: \theta = 1$ against $H_1: \theta > 1$ .   
(b) What is the likelihood ratio $\Lambda$ for testing $H_0: \theta = 1$ against $H_1: \theta \neq 1$ ?

8.3.15. Let $X_{1}, X_{2}, \ldots, X_{n}$ and $Y_{1}, Y_{2}, \ldots, Y_{n}$ be independent random samples from two normal distributions $N(\mu_{1}, \sigma^{2})$ and $N(\mu_{2}, \sigma^{2})$ , respectively, where $\sigma^{2}$ is the common but unknown variance.

(a) Find the likelihood ratio $\Lambda$ for testing $H_0: \mu_1 = \mu_2 = 0$ against all alternatives.   
(b) Rewrite $\Lambda$ so that it is a function of a statistic $Z$ which has a well-known distribution.   
(c) Give the distribution of $Z$ under both null and alternative hypotheses.

8.3.16. Let $(X_{1},Y_{1}),(X_{2},Y_{2}),\ldots ,(X_{n},Y_{n})$ be a random sample from a bivariate normal distribution with $\mu_1,\mu_2,\sigma_1^2 = \sigma_2^2 = \sigma^2,\rho = \frac{1}{2}$ , where $\mu_1,\mu_2$ , and $\sigma^2 >0$ are unknown real numbers. Find the likelihood ratio $\Lambda$ for testing $H_0:\mu_1 = \mu_2 = 0$ , $\sigma^2$ unknown against all alternatives. The likelihood ratio $\Lambda$ is a function of what statistic that has a well-known distribution?

8.3.17. Let $X$ be a random variable with pdf $f_{X}(x) = (2b_{X})^{-1}\exp \{-|x| / b_{X}\}$ , for $-\infty < x < \infty$ and $b_{X} > 0$ . First, show that the variance of $X$ is $\sigma_X^2 = 2b_X^2$ . Next, let $Y$ , independent of $X$ , have pdf $f_{Y}(y) = (2b_{Y})^{-1}\exp \{-|y| / b_{Y}\}$ , for $-\infty < x < \infty$ and $b_{Y} > 0$ . Consider the hypotheses

$$
H _ {0}: \sigma_ {X} ^ {2} = \sigma_ {Y} ^ {2} \text {v e r s u s} H _ {1}: \sigma_ {X} ^ {2} > \sigma_ {Y} ^ {2}.
$$

To illustrate Remark 8.3.2 for testing these hypotheses, consider the following data set (data are also in the file exercise8316.rda). Sample 1 represents the values of a sample drawn on $X$ with $b_{X} = 1$ , while Sample 2 represents the values of a sample drawn on $Y$ with $b_{Y} = 1$ . Hence, in this case $H_{0}$ is true.

<table><tr><td>Sample 1</td><td>-0.389 -0.110</td><td>-2.177 -0.709</td><td>0.813 0.456</td><td>-0.001 0.135</td></tr><tr><td>Sample 1</td><td>0.763 0.403</td><td>-0.570 0.778</td><td>-2.565 -0.115</td><td>-1.733</td></tr><tr><td>Sample 2</td><td>-1.067 -0.634</td><td>-0.577 -0.996</td><td>0.361 -0.181</td><td>-0.680 0.239</td></tr><tr><td>Sample 2</td><td>-0.775 0.213</td><td>-1.421 1.425</td><td>-0.818 -0.165</td><td>0.328</td></tr></table>

(a) Obtain comparison boxplots of these two samples. Comparison boxplots consist of boxplots of both samples drawn on the same scale. Based on these plots, in particular the interquartile ranges, what do you conclude about $H_0$ ?   
(b) Obtain the $F$ -test (for a one-sided hypothesis) as discussed in Remark 8.3.2 at level $\alpha = 0.10$ . What is your conclusion?   
(c) The test in part (b) is not exact. Why?

8.3.18. For the skewed contaminated normal random variable $X$ of Example 8.3.4, derive the cdf, pdf, mean, and variance of $X$ .   
8.3.19. For Table 8.3.1 of Example 8.3.4, show that the half-width of the $95\%$ confidence interval for a binomial proportion as given in Chapter 4 is 0.004 at the nominal value of 0.05.   
8.3.20. If computational facilities are available, perform a Monte Carlo study of the two-sided $t$ -test for the skewed contaminated normal situation of Example 8.3.4. The R function `rscn.R` generates variates from the distribution of $X$ .   
8.3.21. Suppose $X_{1},\ldots ,X_{n}$ is a random sample on $X$ which has a $N(\mu ,\sigma_0^2)$ distribution, where $\sigma_0^2$ is known. Consider the two-sided hypotheses

$$
H _ {0}: \mu = 0 \text {v e r s u s} H _ {1}: \mu \neq 0.
$$

Show that the test based on the critical region $C = \{|\overline{X}| > \sqrt{\sigma_0^2 / n} z_{\alpha / 2}\}$ is an unbiased level $\alpha$ test.

8.3.22. Assume the same situation as in the last exercise but consider the test with critical region $C^* = \{\overline{X} > \sqrt{\sigma_0^2 / n} z_\alpha\}$ . Show that the test based on $C^*$ has significance level $\alpha$ but that it is not an unbiased test.

# 8.4 *The Sequential Probability Ratio Test

Theorem 8.1.1 provides us with a method for determining a best critical region for testing a simple hypothesis against an alternative simple hypothesis. Recall its statement: Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample with fixed sample size $n$ from a distribution that has pdf or pmf $f(x; \theta)$ , where $\theta = \{\theta : \theta = \theta', \theta''\}$ and $\theta'$ and $\theta''$ .

are known numbers. For this section, we denote the likelihood of $X_{1},X_{2},\ldots ,X_{n}$ by

$$
L (\theta ; n) = f (x _ {1}; \theta) f (x _ {2}; \theta) \dots f (x _ {n}; \theta),
$$

a notation that reveals both the parameter $\theta$ and the sample size $n$ . If we reject $H_0: \theta = \theta'$ and accept $H_1: \theta = \theta''$ when and only when

$$
\frac {L \left(\theta^ {\prime} ; n\right)}{L \left(\theta^ {\prime \prime} ; n\right)} \leq k,
$$

where $k > 0$ , then by Theorem 8.1.1 this is a best test of $H_0$ against $H_1$ .

Let us now suppose that the sample size $n$ is not fixed in advance. In fact, let the sample size be a random variable $N$ with sample space $\{1,2,\dots,3,\ldots\}$ . An interesting procedure for testing the simple hypothesis $H_0: \theta = \theta'$ against the simple hypothesis $H_1: \theta = \theta''$ is the following: Let $k_0$ and $k_1$ be two positive constants with $k_0 < k_1$ . Observe the independent outcomes $X_1, X_2, X_3, \ldots$ in a sequence, for example, $x_1, x_2, x_3, \ldots$ , and compute

$$
\frac {L \left(\theta^ {\prime} ; 1\right)}{L \left(\theta^ {\prime \prime} ; 1\right)}, \frac {L \left(\theta^ {\prime} ; 2\right)}{L \left(\theta^ {\prime \prime} ; 2\right)}, \frac {L \left(\theta^ {\prime} ; 3\right)}{L \left(\theta^ {\prime \prime} ; 3\right)}, \dots .
$$

The hypothesis $H_0: \theta = \theta'$ is rejected (and $H_1: \theta = \theta''$ is accepted) if and only if there exists a positive integer $n$ so that $\mathbf{x}_n = (x_1, x_2, \ldots, x_n)$ belongs to the set

$$
C _ {n} = \left\{\mathbf {x} _ {n}: k _ {0} <   \frac {L \left(\theta^ {\prime} , j\right)}{L \left(\theta^ {\prime \prime} , j\right)} <   k _ {1}, j = 1, \dots , n - 1, \text {a n d} \frac {L \left(\theta^ {\prime} , n\right)}{L \left(\theta^ {\prime \prime} , n\right)} \leq k _ {0} \right\}. \tag {8.4.1}
$$

On the other hand, the hypothesis $H_0: \theta = \theta'$ is accepted (and $H_1: \theta = \theta''$ is rejected) if and only if there exists a positive integer $n$ so that $(x_1, x_2, \ldots, x_n)$ belongs to the set

$$
B _ {n} = \left\{\mathbf {x} _ {n}: k _ {0} <   \frac {L \left(\theta^ {\prime} , j\right)}{L \left(\theta^ {\prime \prime} , j\right)} <   k _ {1}, j = 1, \dots , n - 1, \text {a n d} \frac {L \left(\theta^ {\prime} , n\right)}{L \left(\theta^ {\prime \prime} , n\right)} \geq k _ {1} \right\}. \tag {8.4.2}
$$

That is, we continue to observe sample observations as long as

$$
k _ {0} <   \frac {L \left(\theta^ {\prime} , n\right)}{L \left(\theta^ {\prime \prime} , n\right)} <   k _ {1}. \tag {8.4.3}
$$

We stop these observations in one of two ways:

1. With rejection of $H_0: \theta = \theta'$ as soon as

$$
\frac {L (\theta^ {\prime} , n)}{L (\theta^ {\prime \prime} , n)} \leq k _ {0}
$$

or

2. With acceptance of $H_0: \theta = \theta'$ as soon as

$$
\frac {L \left(\theta^ {\prime} , n\right)}{L \left(\theta^ {\prime \prime} , n\right)} \geq k _ {1},
$$

A test of this kind is called Wald's sequential probability ratio test. Frequently, inequality (8.4.3) can be conveniently expressed in an equivalent form:

$$
c _ {0} (n) <   u \left(x _ {1}, x _ {2}, \dots , x _ {n}\right) <   c _ {1} (n), \tag {8.4.4}
$$

where $u(X_1, X_2, \ldots, X_n)$ is a statistic and $c_0(n)$ and $c_1(n)$ depend on the constants $k_0, k_1, \theta', \theta''$ , and on $n$ . Then the observations are stopped and a decision is reached as soon as

$$
u \left(x _ {1}, x _ {2}, \dots , x _ {n}\right) \leq c _ {0} (n) \quad \text {o r} \quad u \left(x _ {1}, x _ {2}, \dots , x _ {n}\right) \geq c _ {1} (n).
$$

We now give an illustrative example.

Example 8.4.1. Let $X$ have a pmf

$$
f (x; \theta) = \left\{ \begin{array}{l l} \theta^ {x} (1 - \theta) ^ {1 - x} & x = 0, 1 \\ 0 & \text {e l s e w h e r e .} \end{array} \right.
$$

In the preceding discussion of a sequential probability ratio test, let $H_0: \theta = \frac{1}{3}$ and $H_1: \theta = \frac{2}{3}$ ; then, with $\sum x_i = \sum_{i=1}^{n} x_i$ ,

$$
\frac {L (\frac {1}{3} , n)}{L (\frac {2}{3} , n)} = \frac {(\frac {1}{3}) ^ {\sum x _ {i}} (\frac {2}{3}) ^ {n - \sum x _ {i}}}{(\frac {2}{3}) ^ {\sum x _ {i}} (\frac {1}{3}) ^ {n - \sum x _ {i}}} = 2 ^ {n - 2} \sum x _ {i}.
$$

If we take logarithms to the base 2, the inequality

$$
k _ {0} <   \frac {L (\frac {1}{3} , n)}{L (\frac {2}{3} , n)} <   k _ {1},
$$

with $0 < k_{0} < k_{1}$ , becomes

$$
\log_ {2} k _ {0} <   n - 2 \sum_ {1} ^ {n} x _ {i} <   \log_ {2} k _ {1},
$$

or, equivalently, in the notation of expression (8.4.4),

$$
c _ {0} (n) = \frac {n}{2} - \frac {1}{2} \log_ {2} k _ {1} <   \sum_ {1} ^ {n} x _ {i} <   \frac {n}{2} - \frac {1}{2} \log_ {2} k _ {0} = c _ {1} (n).
$$

Note that $L(\frac{1}{3}, n) / L(\frac{2}{3}, n) \leq k_0$ if and only if $c_1(n) \leq \sum_{1}^{n} x_i$ ; and $L(\frac{1}{3}, n) / L(\frac{2}{3}, n) \geq k_1$ if and only if $c_0(n) \geq \sum_{1}^{n} x_i$ . Thus we continue to observe outcomes as long as $c_0(n) < \sum_{1}^{n} x_i < c_1(n)$ . The observation of outcomes is discontinued with the first value of $n$ of $N$ for which either $c_1(n) \leq \sum_{1}^{n} x_i$ or $c_0(n) \geq \sum_{1}^{n} x_i$ . The inequality $c_1(n) \leq \sum_{1}^{n} x_i$ leads to rejection of $H_0: \theta = \frac{1}{3}$ (the acceptance of $H_1$ ), and the inequality $c_0(n) \geq \sum_{1}^{n} x_i$ leads to the acceptance of $H_0: \theta = \frac{1}{3}$ (the rejection of $H_1$ ).

Remark 8.4.1. At this point, the reader undoubtedly sees that there are many questions that should be raised in connection with the sequential probability ratio test. Some of these questions are possibly among the following:

1. What is the probability of the procedure continuing indefinitely?   
2. What is the value of the power function of this test at each of the points $\theta = \theta^{\prime}$ and $\theta = \theta^{\prime \prime}$ ?   
3. If $\theta''$ is one of several values of $\theta$ specified by an alternative composite hypothesis, say $H_1: \theta > \theta'$ , what is the power function at each point $\theta \geq \theta'$ ?   
4. Since the sample size $N$ is a random variable, what are some of the properties of the distribution of $N$ ? In particular, what is the expected value $E(N)$ of $N$ ?   
5. How does this test compare with tests that have a fixed sample size $n$ ?

A course in sequential analysis would investigate these and many other problems. However, in this book our objective is largely that of acquainting the reader with this kind of test procedure. Accordingly, we assert that the answer to question 1 is zero. Moreover, it can be proved that if $\theta = \theta^{\prime}$ or if $\theta = \theta^{\prime \prime}$ , $E(N)$ is smaller for this sequential procedure than the sample size of a fixed-sample-size test that has the same values of the power function at those points. We now consider question 2 in some detail.

In this section we shall denote the power of the test when $H_0$ is true by the symbol $\alpha$ and the power of the test when $H_1$ is true by the symbol $1 - \beta$ . Thus $\alpha$ is the probability of committing a Type I error (the rejection of $H_0$ when $H_0$ is true), and $\beta$ is the probability of committing a Type II error (the acceptance of $H_0$ when $H_0$ is false). With the sets $C_n$ and $B_n$ as previously defined, and with random variables of the continuous type, we then have

$$
\alpha = \sum_ {n = 1} ^ {\infty} \int_ {C _ {n}} L \left(\theta^ {\prime}, n\right), \quad 1 - \beta = \sum_ {n = 1} ^ {\infty} \int_ {C _ {n}} L \left(\theta^ {\prime \prime}, n\right).
$$

Since the probability is 1 that the procedure terminates, we also have

$$
1 - \alpha = \sum_ {n = 1} ^ {\infty} \int_ {B _ {n}} L \left(\theta^ {\prime}, n\right), \quad \beta = \sum_ {n = 1} ^ {\infty} \int_ {B _ {n}} L \left(\theta^ {\prime \prime}, n\right).
$$

If $(x_{1},x_{2},\ldots ,x_{n})\in C_{n}$ , we have $L(\theta^{\prime},n)\leq k_{0}L(\theta^{\prime \prime},n)$ ; hence, it is clear that

$$
\alpha = \sum_ {n = 1} ^ {\infty} \int_ {C _ {n}} L \left(\theta^ {\prime}, n\right) \leq \sum_ {n = 1} ^ {\infty} \int_ {C _ {n}} k _ {0} L \left(\theta^ {\prime \prime}, n\right) = k _ {0} (1 - \beta).
$$

Because $L(\theta', n) \geq k_1 L(\theta'', n)$ at each point of the set $B_n$ , we have

$$
1 - \alpha = \sum_ {n = 1} ^ {\infty} \int_ {B _ {n}} L \left(\theta^ {\prime}, n\right) \geq \sum_ {n = 1} ^ {\infty} \int_ {B _ {n}} k _ {1} L \left(\theta^ {\prime \prime}, n\right) = k _ {1} \beta .
$$

Accordingly, it follows that

$$
\frac {\alpha}{1 - \beta} \leq k _ {0}, \quad k _ {1} \leq \frac {1 - \alpha}{\beta}, \tag {8.4.5}
$$

provided that $\beta$ is not equal to 0 or 1.

Now let $\alpha_{a}$ and $\beta_{a}$ be preassigned proper fractions; some typical values in the applications are 0.01, 0.05, and 0.10. If we take

$$
k _ {0} = \frac {\alpha_ {a}}{1 - \beta_ {a}}, k _ {1} = \frac {1 - \alpha_ {a}}{\beta_ {a}},
$$

then inequalities (8.4.5) become

$$
\frac {\alpha}{1 - \beta} \leq \frac {\alpha_ {a}}{1 - \beta_ {a}}, \quad \frac {1 - \alpha_ {a}}{\beta_ {a}} \leq \frac {1 - \alpha}{\beta}; \tag {8.4.6}
$$

or, equivalently,

$$
\alpha (1 - \beta_ {a}) \leq (1 - \beta) \alpha_ {a}, \quad \beta (1 - \alpha_ {a}) \leq (1 - \alpha) \beta_ {a}.
$$

If we add corresponding members of the immediately preceding inequalities, we find that

$$
\alpha + \beta - \alpha \beta_ {a} - \beta \alpha_ {a} \leq \alpha_ {a} + \beta_ {a} - \beta \alpha_ {a} - \alpha \beta_ {a}
$$

and hence

$$
\alpha + \beta \leq \alpha_ {a} + \beta_ {a};
$$

that is, the sum $\alpha + \beta$ of the probabilities of the two kinds of errors is bounded above by the sum $\alpha_{a} + \beta_{a}$ of the preassigned numbers. Moreover, since $\alpha$ and $\beta$ are positive proper fractions, inequalities (8.4.6) imply that

$$
\alpha \leq \frac {\alpha_ {a}}{1 - \beta_ {a}}, \quad \beta \leq \frac {\beta_ {a}}{1 - \alpha_ {a}};
$$

consequently, we have an upper bound on each of $\alpha$ and $\beta$ . Various investigations of the sequential probability ratio test seem to indicate that in most practical cases, the values of $\alpha$ and $\beta$ are quite close to $\alpha_{a}$ and $\beta_{a}$ . This prompts us to approximate the power function at the points $\theta = \theta^{\prime}$ and $\theta = \theta^{\prime \prime}$ by $\alpha_{a}$ and $1 - \beta_{a}$ , respectively.

Example 8.4.2. Let $X$ be $N(\theta, 100)$ . To find the sequential probability ratio test for testing $H_0: \theta = 75$ against $H_1: \theta = 78$ such that each of $\alpha$ and $\beta$ is approximately equal to 0.10, take

$$
k _ {0} = \frac {0 . 1 0}{1 - 0 . 1 0} = \frac {1}{9}, \quad k _ {1} = \frac {1 - 0 . 1 0}{0 . 1 0} = 9.
$$

Since

$$
\frac {L (7 5 , n)}{L (7 8 , n)} = \frac {\exp \left[ - \sum (x _ {i} - 7 5) ^ {2} / 2 (1 0 0) \right]}{\exp \left[ - \sum (x _ {i} - 7 8) ^ {2} / 2 (1 0 0) \right]} = \exp \left(- \frac {6 \sum x _ {i} - 4 5 9 n}{2 0 0}\right),
$$

the inequality

$$
k _ {0} = \frac {1}{9} <   \frac {L (7 5 , n)}{L (7 8 , n)} <   9 = k _ {1}
$$

can be rewritten, by taking logarithms, as

$$
- \log 9 <   \frac {6 \sum x _ {i} - 4 5 9 n}{2 0 0} <   \log 9.
$$

This inequality is equivalent to the inequality

$$
c _ {0} (n) = \frac {1 5 3}{2} n - \frac {1 0 0}{3} \log 9 <   \sum_ {1} ^ {n} x _ {i} <   \frac {1 5 3}{2} n + \frac {1 0 0}{3} \log 9 = c _ {1} (n).
$$

Moreover, $L(75,n) / L(78,n) \leq k_0$ and $L(75,n) / L(78,n) \geq k_1$ are equivalent to the inequalities $\sum_{1}^{n} x_i \geq c_1(n)$ and $\sum_{1}^{n} x_i \leq c_0(n)$ , respectively. Thus the observation of outcomes is discontinued with the first value of $n$ of $N$ for which either $\sum_{1}^{n} x_i \geq c_1(n)$ or $\sum_{1}^{n} x_i \leq c_0(n)$ . The inequality $\sum_{1}^{n} x_i \geq c_1(n)$ leads to the rejection of $H_0: \theta = 75$ , and the inequality $\sum_{1}^{n} x_i \leq c_0(n)$ leads to the acceptance of $H_0: \theta = 75$ . The power of the test is approximately 0.10 when $H_0$ is true, and approximately 0.90 when $H_1$ is true.

Remark 8.4.2. It is interesting to note that a sequential probability ratio test can be thought of as a random-walk procedure. To illustrate, the final inequalities of Examples 8.4.1 and 8.4.2 can be written as

$$
- \log_ {2} k _ {1} <   \sum_ {1} ^ {n} 2 (x _ {i} - 0. 5) <   - \log_ {2} k _ {0}
$$

and

$$
- \frac {1 0 0}{3} \log 9 <   \sum_ {1} ^ {n} (x _ {i} - 7 6. 5) <   \frac {1 0 0}{3} \log 9,
$$

respectively. In each instance, think of starting at the point zero and taking random steps until one of the boundaries is reached. In the first situation the random steps are $2(X_{1} - 0.5), 2(X_{2} - 0.5), 2(X_{3} - 0.5), \ldots$ , which have the same length, 1, but with random directions. In the second instance, both the length and the direction of the steps are random variables, $X_{1} - 76.5, X_{2} - 76.5, X_{3} - 76.5, \ldots$ .

In recent years, there has been much attention devoted to improving quality of products using statistical methods. One such simple method was developed by Walter Shewhart in which a sample of size $n$ of the items being produced is taken and they are measured, resulting in $n$ values. The mean $\overline{X}$ of these $n$ measurements has an approximate normal distribution with mean $\mu$ and variance $\sigma^2 / n$ . In practice, $\mu$ and $\sigma^2$ must be estimated, but in this discussion, we assume that they are known. From theory we know that the probability is 0.997 that $\overline{x}$ is between

$$
\mathrm {L C L} = \mu - \frac {3 \sigma}{\sqrt {n}} \quad \mathrm {a n d} \quad \mathrm {U C L} = \mu + \frac {3 \sigma}{\sqrt {n}}.
$$

These two values are called the lower (LCL) and upper (UCL) control limits, respectively. Samples like these are taken periodically, resulting in a sequence of means,

say $\overline{x}_1, \overline{x}_2, \overline{x}_3, \ldots$ . These are usually plotted; and if they are between the LCL and UCL, we say that the process is in control. If one falls outside the limits, this would suggest that the mean $\mu$ has shifted, and the process would be investigated.

It was recognized by some that there could be a shift in the mean, say from $\mu$ to $\mu + (\sigma / \sqrt{n})$ ; and it would still be difficult to detect that shift with a single sample mean, for now the probability of a single $\overline{x}$ exceeding UCL is only about 0.023. This means that we would need about $1/0.023 \approx 43$ samples, each of size $n$ , on the average before detecting such a shift. This seems too long; so statisticians recognized that they should be cumulating experience as the sequence $\overline{X}_1, \overline{X}_2, \overline{X}_3, \ldots$ is observed in order to help them detect the shift sooner. It is the practice to compute the standardized variable $Z = (\overline{X} - \mu) / (\sigma / \sqrt{n})$ ; thus, we state the problem in these terms and provide the solution given by a sequential probability ratio test.

Here $Z$ is $N(\theta, 1)$ , and we wish to test $H_0: \theta = 0$ against $H_1: \theta = 1$ using the sequence of iid random variables $Z_1, Z_2, \ldots, Z_m, \ldots$ . We use $m$ rather than $n$ , as the latter is the size of the samples taken periodically. We have

$$
\frac {L (0 , m)}{L (1 , m)} = \frac {\exp \left[ - \sum z _ {i} ^ {2} / 2 \right]}{\exp \left[ - \sum \left(z _ {i} - 1\right) ^ {2} / 2 \right]} = \exp \left[ - \sum_ {i = 1} ^ {m} \left(z _ {i} - 0. 5\right) \right].
$$

Thus

$$
k _ {0} <   \exp \left[ - \sum_ {i = 1} ^ {m} (z _ {i} - 0. 5) \right] <   k _ {1}
$$

can be written as

$$
h = - \log k _ {0} > \sum_ {i = 1} ^ {m} (z _ {i} - 0. 5) > - \log k _ {1} = - h.
$$

It is true that $-\log k_{0} = \log k_{1}$ when $\alpha_{a} = \beta_{a}$ . Often, $h = -\log k_{0}$ is taken to be about 4 or 5, suggesting that $\alpha_{a} = \beta_{a}$ is small, like 0.01. As $\sum (z_{i} - 0.5)$ is cumulating the sum of $z_{i} - 0.5$ , $i = 1,2,3,\ldots$ , these procedures are often called CUSUMS. If the CUSUM = $\sum (z_{i} - 0.5)$ exceeds $h$ , we would investigate the process, as it seems that the mean has shifted upward. If this shift is to $\theta = 1$ , the theory associated with these procedures shows that we need only eight or nine samples on the average, rather than 43, to detect this shift. For more information about these methods, the reader is referred to one of the many books on quality improvement through statistical methods. What we would like to emphasize here is that through sequential methods (not only the sequential probability ratio test), we should take advantage of all past experience that we can gather in making inferences.

# EXERCISES

8.4.1. Let $X$ be $N(0, \theta)$ and, in the notation of this section, let $\theta' = 4$ , $\theta'' = 9$ , $\alpha_{a} = 0.05$ , and $\beta_{a} = 0.10$ . Show that the sequential probability ratio test can be based upon the statistic $\sum_{1}^{n} X_{i}^{2}$ . Determine $c_{0}(n)$ and $c_{1}(n)$ .

8.4.2. Let $X$ have a Poisson distribution with mean $\theta$ . Find the sequential probability ratio test for testing $H_0: \theta = 0.02$ against $H_1: \theta = 0.07$ . Show that this test can be based upon the statistic $\sum_{1}^{n} X_i$ . If $\alpha_a = 0.20$ and $\beta_a = 0.10$ , find $c_0(n)$ and $c_1(n)$ .

8.4.3. Let the independent random variables $Y$ and $Z$ be $N(\mu_1, 1)$ and $N(\mu_2, 1)$ , respectively. Let $\theta = \mu_1 - \mu_2$ . Let us observe independent observations from each distribution, say $Y_1, Y_2, \ldots$ and $Z_1, Z_2, \ldots$ . To test sequentially the hypothesis $H_0: \theta = 0$ against $H_1: \theta = \frac{1}{2}$ , use the sequence $X_i = Y_i - Z_i$ , $i = 1, 2, \ldots$ . If $\alpha_a = \beta_a = 0.05$ , show that the test can be based upon $\overline{X} = \overline{Y} - \overline{Z}$ . Find $c_0(n)$ and $c_1(n)$ .

8.4.4. Suppose that a manufacturing process makes about $3\%$ defective items, which is considered satisfactory for this particular product. The managers would like to decrease this to about $1\%$ and clearly want to guard against a substantial increase, say to $5\%$ . To monitor the process, periodically $n = 100$ items are taken and the number $X$ of defectives counted. Assume that $X$ is $b(n = 100, p = \theta)$ . Based on a sequence $X_1, X_2, \ldots, X_m, \ldots$ , determine a sequential probability ratio test that tests $H_0: \theta = 0.01$ against $H_1: \theta = 0.05$ . (Note that $\theta = 0.03$ , the present level, is in between these two values.) Write this test in the form

$$
h _ {0} > \sum_ {i = 1} ^ {m} \left(x _ {i} - n d\right) > h _ {1}
$$

and determine $d$ , $h_0$ , and $h_1$ if $\alpha_{a} = \beta_{a} = 0.02$ .

8.4.5. Let $X_{1}, X_{2}, \ldots, X_{n}$ be a random sample from a distribution with pdf $f(x; \theta) = \theta x^{\theta - 1}$ , $0 < x < 1$ , zero elsewhere.

(a) Find a complete sufficient statistic for $\theta$   
(b) If $\alpha_{a} = \beta_{a} = \frac{1}{10}$ , find the sequential probability ratio test of $H_0: \theta = 2$ against $H_1: \theta = 3$ .

# 8.5 *Minimax and Classification Procedures

We have considered several procedures that may be used in problems of point estimation. Among these were decision function procedures (in particular, minimax decisions). In this section, we apply minimax procedures to the problem of testing a simple hypothesis $H_0$ against an alternative simple hypothesis $H_1$ . It is important to observe that these procedures yield, in accordance with the Neyman-Pearson theorem, a best test of $H_0$ against $H_1$ . We end this section with a discussion on an application of these procedures to a classification problem.

# 8.5.1 Minimax Procedures

We first investigate the decision function approach to the problem of testing a simple null hypothesis against a simple alternative hypothesis. Let the joint pdf of the $n$

random variables $X_{1}, X_{2}, \ldots, X_{n}$ depend upon the parameter $\theta$ . Here $n$ is a fixed positive integer. This pdf is denoted by $L(\theta; x_{1}, x_{2}, \ldots, x_{n})$ or, for brevity, by $L(\theta)$ . Let $\theta'$ and $\theta''$ be distinct and fixed values of $\theta$ . We wish to test the simple hypothesis $H_{0}: \theta = \theta'$ against the simple hypothesis $H_{1}: \theta = \theta''$ . Thus the parameter space is $\Omega = \{\theta: \theta = \theta', \theta''\}$ . In accordance with the decision function procedure, we need a function $\delta$ of the observed values of $X_{1}, \ldots, X_{n}$ (or, of the observed value of a statistic $Y$ ) that decides which of the two values of $\theta$ , $\theta'$ or $\theta''$ , to accept. That is, the function $\delta$ selects either $H_{0}: \theta = \theta'$ or $H_{1}: \theta = \theta''$ . We denote these decisions by $\delta = \theta'$ and $\delta = \theta''$ , respectively. Let $\mathcal{L}(\theta, \delta)$ represent the loss function associated with this decision problem. Because the pairs $(\theta = \theta', \delta = \theta')$ and $(\theta = \theta'', \delta = \theta'')$ represent correct decisions, we shall always take $\mathcal{L}(\theta', \theta') = \mathcal{L}(\theta'', \theta'') = 0$ . On the other hand, if either $\delta = \theta''$ when $\theta = \theta'$ or $\delta = \theta'$ when $\theta = \theta''$ , then a positive value should be assigned to the loss function; that is, $\mathcal{L}(\theta', \theta'') > 0$ and $\mathcal{L}(\theta'', \theta') > 0$ .

It has previously been emphasized that a test of $H_0: \theta = \theta'$ against $H_1: \theta = \theta''$ can be described in terms of a critical region in the sample space. We can do the same kind of thing with the decision function. That is, we can choose a subset of $C$ of the sample space and if $(x_1, x_2, \ldots, x_n) \in C$ , we can make the decision $\delta = \theta''$ ; whereas if $(x_1, x_2, \ldots, x_n) \in C^c$ , the complement of $C$ , we make the decision $\delta = \theta'$ . Thus a given critical region $C$ determines the decision function. In this sense, we may denote the risk function by $R(\theta, C)$ instead of $R(\theta, \delta)$ . That is, in a notation used in Section 7.1,

$$
R (\theta , C) = R (\theta , \delta) = \int_ {C \cup C ^ {c}} \mathcal {L} (\theta , \delta) L (\theta).
$$

Since $\delta = \theta''$ if $(x_1, \ldots, x_n) \in C$ and $\delta = \theta'$ if $(x_1, \ldots, x_n) \in C^c$ , we have

$$
R (\theta , C) = \int_ {C} \mathcal {L} \left(\theta , \theta^ {\prime \prime}\right) L (\theta) + \int_ {C ^ {c}} \mathcal {L} \left(\theta , \theta^ {\prime}\right) L (\theta). \tag {8.5.1}
$$

If, in Equation (8.5.1), we take $\theta = \theta^{\prime}$ , then $\mathcal{L}(\theta ',\theta ') = 0$ and hence

$$
R (\theta^ {\prime}, C) = \int_ {C} \mathcal {L} (\theta^ {\prime}, \theta^ {\prime \prime}) L (\theta^ {\prime}) = \mathcal {L} (\theta^ {\prime}, \theta^ {\prime \prime}) \int_ {C} L (\theta^ {\prime}).
$$

On the other hand, if in Equation (8.5.1) we let $\theta = \theta''$ , then $\mathcal{L}(\theta'', \theta'') = 0$ and, accordingly,

$$
R (\theta^ {\prime \prime}, C) = \int_ {C ^ {c}} \mathcal {L} (\theta^ {\prime \prime}, \theta^ {\prime}) L (\theta^ {\prime \prime}) = \mathcal {L} (\theta^ {\prime \prime}, \theta^ {\prime}) \int_ {C ^ {c}} L (\theta^ {\prime \prime}).
$$

It is enlightening to note that if $\gamma (\theta)$ is the power function of the test associated with the critical region $C$ , then

$$
R \left(\theta^ {\prime}, C\right) = \mathcal {L} \left(\theta^ {\prime}, \theta^ {\prime \prime}\right) \gamma \left(\theta^ {\prime}\right) = \mathcal {L} \left(\theta^ {\prime}, \theta^ {\prime \prime}\right) \alpha ,
$$

where $\alpha = \gamma (\theta^{\prime})$ is the significance level; and

$$
R (\theta^ {\prime \prime}, C) = \mathcal {L} (\theta^ {\prime \prime}, \theta^ {\prime}) [ 1 - \gamma (\theta^ {\prime \prime}) ] = \mathcal {L} (\theta^ {\prime \prime}, \theta^ {\prime}) \beta ,
$$

where $\beta = 1 - \gamma (\theta^{\prime \prime})$ is the probability of the type II error.

Let us now see if we can find a minimax solution to our problem. That is, we want to find a critical region $C$ so that

$$
\max [ R (\theta^ {\prime}, C), R (\theta^ {\prime \prime}, C) ]
$$

is minimized. We shall show that the solution is the region

$$
C = \left\{\left(x _ {1}, \dots , x _ {n}\right): \frac {L \left(\theta^ {\prime} ; x _ {1} , \dots , x _ {n}\right)}{L \left(\theta^ {\prime \prime} ; x _ {1} , \dots , x _ {n}\right)} \leq k \right\},
$$

provided the positive constant $k$ is selected so that $R(\theta', C) = R(\theta'', C)$ . That is, if $k$ is chosen so that

$$
\mathcal {L} \left(\theta^ {\prime}, \theta^ {\prime \prime}\right) \int_ {C} L \left(\theta^ {\prime}\right) = \mathcal {L} \left(\theta^ {\prime \prime}, \theta^ {\prime}\right) \int_ {C ^ {c}} L \left(\theta^ {\prime \prime}\right),
$$

then the critical region $C$ provides a minimax solution. In the case of random variables of the continuous type, $k$ can always be selected so that $R(\theta', C) = R(\theta'', C)$ . However, with random variables of the discrete type, we may need to consider an auxiliary random experiment when $L(\theta') / L(\theta'') = k$ in order to achieve the exact equality $R(\theta', C) = R(\theta'', C)$ .

To see that $C$ is the minimax solution, consider every other region $A$ for which $R(\theta', C) \geq R(\theta', A)$ . A region $A$ for which $R(\theta', C) < R(\theta', A)$ is not a candidate for a minimax solution, for then $R(\theta', C) = R(\theta'', C) < \max[R(\theta', A), R(\theta'', A)]$ . Since $R(\theta', C) \geq R(\theta', A)$ means that

$$
\mathcal {L} \left(\theta^ {\prime}, \theta^ {\prime \prime}\right) \int_ {C} L \left(\theta^ {\prime}\right) \geq \mathcal {L} \left(\theta^ {\prime}, \theta^ {\prime \prime}\right) \int_ {A} L \left(\theta^ {\prime}\right),
$$

we have

$$
\alpha = \int_ {C} L (\theta^ {\prime}) \geq \int_ {A} L (\theta^ {\prime});
$$

that is, the significance level of the test associated with the critical region $A$ is less than or equal to $\alpha$ . But $C$ , in accordance with the Neyman-Pearson theorem, is a best critical region of size $\alpha$ . Thus

$$
\int_ {C} L \left(\theta^ {\prime \prime}\right) \geq \int_ {A} L \left(\theta^ {\prime \prime}\right)
$$

and

$$
\int_ {C ^ {c}} L \left(\theta^ {\prime \prime}\right) \leq \int_ {A ^ {c}} L \left(\theta^ {\prime \prime}\right).
$$

Accordingly,

$$
\mathcal {L} \left(\theta^ {\prime \prime}, \theta^ {\prime}\right) \int_ {C ^ {c}} L \left(\theta^ {\prime \prime}\right) \leq \mathcal {L} \left(\theta^ {\prime \prime}, \theta^ {\prime}\right) \int_ {A ^ {c}} L \left(\theta^ {\prime \prime}\right),
$$

or, equivalently,

$$
R \left(\theta^ {\prime \prime}, C\right) \leq R \left(\theta^ {\prime \prime}, A\right).
$$

That is,

$$
R (\theta^ {\prime}, C) = R (\theta^ {\prime \prime}, C) \leq R (\theta^ {\prime \prime}, A).
$$

This means that

$$
\max  [ R (\theta^ {\prime}, C), R (\theta^ {\prime \prime}, C) ] \leq R (\theta^ {\prime \prime}, A).
$$

Then certainly,

$$
\max [ R (\theta^ {\prime}, C), R (\theta^ {\prime \prime}, C) ] \leq \max [ R (\theta^ {\prime}, A), R (\theta^ {\prime \prime}, A) ],
$$

and the critical region $C$ provides a minimax solution, as we wanted to show.

Example 8.5.1. Let $X_{1}, X_{2}, \ldots, X_{100}$ denote a random sample of size 100 from a distribution that is $N(\theta, 100)$ . We again consider the problem of testing $H_{0} : \theta = 75$ against $H_{1} : \theta = 78$ . We seek a minimax solution with $\mathcal{L}(75, 78) = 3$ and $\mathcal{L}(78, 75) = 1$ . Since $L(75) / L(78) \leq k$ is equivalent to $\overline{x} \geq c$ , we want to determine $c$ , and thus $k$ , so that

$$
3 P (\bar {X} \geq c; \theta = 7 5) = P (\bar {X} <   c; \theta = 7 8). \tag {8.5.2}
$$

Because $\overline{X}$ is $N(\theta, 1)$ , the preceding equation can be rewritten as

$$
3 [ 1 - \Phi (c - 7 5) ] = \Phi (c - 7 8).
$$

As requested in Exercise 8.5.4, the reader can show by using Newton's algorithm that the solution to one place is $c = 76.8$ . The significance level of the test is $1 - \Phi(1.8) = 0.036$ , approximately, and the power of the test when $H_{1}$ is true is $1 - \Phi(-1.2) = 0.885$ , approximately.

# 8.5.2 Classification

The summary above has an interesting application to the problem of classification, which can be described as follows. An investigator makes a number of measurements on an item and wants to place it into one of several categories (or classify it). For convenience in our discussion, we assume that only two measurements, say $X$ and $Y$ , are made on the item to be classified. Moreover, let $X$ and $Y$ have a joint pdf $f(x,y;\theta)$ , where the parameter $\theta$ represents one or more parameters. In our simplification, suppose that there are only two possible joint distributions (categories) for $X$ and $Y$ , which are indexed by the parameter values $\theta'$ and $\theta''$ , respectively. In this case, the problem then reduces to one of observing $X = x$ and $Y = y$ and then testing the hypothesis $\theta = \theta'$ against the hypothesis $\theta = \theta''$ , with the classification of $X$ and $Y$ being in accord with which hypothesis is accepted. From the Neyman-Pearson theorem, we know that a best decision of this sort is of the following form: If

$$
\frac {f (x , y ; \theta^ {\prime})}{f (x , y ; \theta^ {\prime \prime})} \leq k,
$$

choose the distribution indexed by $\theta''$ ; that is, we classify $(x,y)$ as coming from the distribution indexed by $\theta''$ . Otherwise, choose the distribution indexed by $\theta'$ ; that is, we classify $(x,y)$ as coming from the distribution indexed by $\theta'$ . Some discussion on the choice of $k$ follows in the next remark.

Remark 8.5.1 (On the Choice of $k$ ). Consider the following probabilities:

$$
\pi^ {\prime} = P \left[ (X, Y) \text {i s d r a w n f r o m t h e d i s t r i b u t i o n w i t h p d f} f (x, y; \theta^ {\prime}) \right]
$$

$$
\pi^ {\prime \prime} = P [ (X, Y) \text {i s d r a w n f r o m t h e d i s t r i b u t i o n w i t h p d f} f (x, y; \theta^ {\prime \prime}) ].
$$

Note that $\pi' + \pi'' = 1$ . Then it can be shown that the optimal classification rule is determined by taking $k = \pi'' / \pi'$ ; see, for instance, Seber (1984). Hence, if we have prior information on how likely the item is drawn from the distribution with parameter $\theta'$ , then we can obtain the classification rule. In practice, it is common for each distribution to be equilikely, in which case, $\pi' = \pi'' = 1/2$ and, hence, $k = 1$ .

Example 8.5.2. Let $(x,y)$ be an observation of the random pair $(X,Y)$ , which has a bivariate normal distribution with parameters $\mu_1, \mu_2, \sigma_1^2, \sigma_2^2$ , and $\rho$ . In Section 3.5 that joint pdf is given by

$$
f (x, y; \mu_ {1}, \mu_ {2}, \sigma_ {1} ^ {2}, \sigma_ {2} ^ {2}) = \frac {1}{2 \pi \sigma_ {1} \sigma_ {2} \sqrt {1 - \rho^ {2}}} e ^ {- q (x, y; \mu_ {1}, \mu_ {2}) / 2},
$$

for $-\infty < x < \infty$ and $-\infty < y < \infty$ , where $\sigma_1 > 0$ , $\sigma_2 > 0$ , $-1 < \rho < 1$ , and

$$
q (x, y; \mu_ {1}, \mu_ {2}) = \frac {1}{1 - \rho^ {2}} \left[ \left(\frac {x - \mu_ {1}}{\sigma_ {1}}\right) ^ {2} - 2 \rho \left(\frac {x - \mu_ {1}}{\sigma_ {1}}\right) \left(\frac {y - \mu_ {2}}{\sigma_ {2}}\right) + \left(\frac {y - \mu_ {2}}{\sigma_ {2}}\right) ^ {2} \right].
$$

Assume that $\sigma_1^2, \sigma_2^2$ , and $\rho$ are known but that we do not know whether the respective means of $(X,Y)$ are $(\mu_1', \mu_2')$ or $(\mu_1'', \mu_2'')$ . The inequality

$$
\frac {f (x , y ; \mu_ {1} ^ {\prime} , \mu_ {2} ^ {\prime} , \sigma_ {1} ^ {2} , \sigma_ {2} ^ {2} , \rho)}{f (x , y ; \mu_ {1} ^ {\prime \prime} , \mu_ {2} ^ {\prime \prime} , \sigma_ {1} ^ {2} , \sigma_ {2} ^ {2} , \rho)} \leq k
$$

is equivalent to

$$
\frac {1}{2} [ q (x, y; \mu_ {1} ^ {\prime \prime}, \mu_ {2} ^ {\prime \prime}) - q (x, y; \mu_ {1} ^ {\prime}, \mu_ {2} ^ {\prime}) ] \leq \log k.
$$

Moreover, it is clear that the difference in the left-hand member of this inequality does not contain terms involving $x^{2}$ , $xy$ , and $y^{2}$ . In particular, this inequality is the same as

$$
\begin{array}{l} \frac {1}{1 - \rho^ {2}} \left\{\left[ \frac {\mu_ {1} ^ {\prime} - \mu_ {1} ^ {\prime \prime}}{\sigma_ {1} ^ {2}} - \frac {\rho (\mu_ {2} ^ {\prime} - \mu_ {2} ^ {\prime \prime})}{\sigma_ {1} \sigma_ {2}} \right] x + \left[ \frac {\mu_ {2} ^ {\prime} - \mu_ {2} ^ {\prime \prime}}{\sigma_ {2} ^ {2}} - \frac {\rho (\mu_ {1} ^ {\prime} - \mu_ {1} ^ {\prime \prime})}{\sigma_ {1} \sigma_ {2}} \right] y \right\} \\ \leq \log k + \frac {1}{2} [ q (0, 0; \mu_ {1} ^ {\prime}, \mu_ {2} ^ {\prime}) - q (0, 0; \mu_ {1} ^ {\prime \prime}, \mu_ {2} ^ {\prime \prime}) ], \\ \end{array}
$$

or, for brevity,

$$
a x + b y \leq c. \tag {8.5.3}
$$

That is, if this linear function of $x$ and $y$ in the left-hand member of inequality (8.5.3) is less than or equal to a constant, we classify $(x,y)$ as coming from the bivariate normal distribution with means $\mu_1''$ and $\mu_2''$ . Otherwise, we classify $(x,y)$ as arising from the bivariate normal distribution with means $\mu_1'$ and $\mu_2'$ . Of course, if the prior probabilities can be assigned as discussed in Remark 8.5.1 then $k$ and thus $c$ can be found easily; see Exercise 8.5.3.

Once the rule for classification is established, the statistician might be interested in the two probabilities of misclassifications using that rule. The first of these two is associated with the classification of $(x,y)$ as arising from the distribution indexed by $\theta''$ if, in fact, it comes from that index by $\theta'$ . The second misclassification is similar, but with the interchange of $\theta'$ and $\theta''$ . In the preceding example, the probabilities of these respective misclassifications are

$$
P (a X + b Y \leq c; \mu_ {1} ^ {\prime}, \mu_ {2} ^ {\prime}) \quad \text {a n d} \quad P (a X + b Y > c; \mu_ {1} ^ {\prime \prime}, \mu_ {2} ^ {\prime \prime}).
$$

The distribution of $Z = aX + bY$ is obtained from Theorem 3.5.2. It follows that the distribution of $Z = aX + bY$ is given by

$$
N \left(a \mu_ {1} + b \mu_ {2}, a ^ {2} \sigma_ {1} ^ {2} + 2 a b \rho \sigma_ {1} \sigma_ {2} + b ^ {2} \sigma_ {2} ^ {2}\right).
$$

With this information, it is easy to compute the probabilities of misclassifications; see Exercise 8.5.3.

One final remark must be made with respect to the use of the important classification rule established in Example 8.5.2. In most instances the parameter values $\mu_1', \mu_2'$ and $\mu_1'', \mu_2''$ as well as $\sigma_1^2, \sigma_2^2$ , and $\rho$ are unknown. In such cases the statistician has usually observed a random sample (frequently called a training sample) from each of the two distributions. Let us say the samples have sizes $n'$ and $n''$ , respectively, with sample characteristics

$$
\overrightarrow {x} ^ {\prime}, \overrightarrow {y} ^ {\prime}, (s _ {x} ^ {\prime}) ^ {2}, (s _ {y} ^ {\prime}) ^ {2}, r ^ {\prime} \quad \mathrm {a n d} \quad \overrightarrow {x} ^ {\prime \prime}, \overrightarrow {y} ^ {\prime \prime}, (s _ {x} ^ {\prime \prime}) ^ {2}, (s _ {y} ^ {\prime \prime}) ^ {2}, r ^ {\prime \prime}.
$$

The statistics $r'$ and $r''$ are the sample correlation coefficients, as defined in expression (9.7.1) of Section 9.7. The sample correlation coefficient is the mle for the correlation parameter $\rho$ of a bivariate normal distribution; see Section 9.7. If in inequality (8.5.3) the parameters $\mu_1', \mu_2', \mu_1'', \mu_2'', \sigma_1^2, \sigma_2^2$ , and $\rho \sigma_1 \sigma_2$ are replaced by the unbiased estimates

$$
\begin{array}{l} \overline {{x}} ^ {\prime}, \overline {{y}} ^ {\prime}, \overline {{x}} ^ {\prime \prime}, \overline {{y}} ^ {\prime \prime}, \frac {(n ^ {\prime} - 1) (s _ {x} ^ {\prime}) ^ {2} + (n ^ {\prime \prime} - 1) (s _ {x} ^ {\prime \prime}) ^ {2}}{n ^ {\prime} + n ^ {\prime \prime} - 2}, \frac {(n ^ {\prime} - 1) (s _ {y} ^ {\prime}) ^ {2} + (n ^ {\prime \prime} - 1) (s _ {y} ^ {\prime \prime}) ^ {2}}{n ^ {\prime} + n ^ {\prime \prime} - 2}, \\ \frac {(n ^ {\prime} - 1) r ^ {\prime} s _ {x} ^ {\prime} s _ {y} ^ {\prime} + (n ^ {\prime \prime} - 1) r ^ {\prime \prime} s _ {x} ^ {\prime \prime} s _ {y} ^ {\prime \prime}}{n ^ {\prime} + n ^ {\prime \prime} - 2}, \\ \end{array}
$$

the resulting expression in the left-hand member is frequently called Fisher's linear discriminant function. Since those parameters have been estimated, the distribution theory associated with $aX + bY$ does provide an approximation.

Although we have considered only bivariate distributions in this section, the results can easily be extended to multivariate normal distributions using the results of Section 3.5; see also Chapter 6 of Seber (1984).

# EXERCISES

8.5.1. Let $X_1, X_2, \ldots, X_{20}$ be a random sample of size 20 from a distribution that is $N(\theta, 5)$ . Let $L(\theta)$ represent the joint pdf of $X_1, X_2, \ldots, X_{20}$ . The problem is to test $H_0: \theta = 1$ against $H_1: \theta = 0$ . Thus $\Omega = \{\theta : \theta = 0, 1\}$ .

(a) Show that $L(1) / L(0) \leq k$ is equivalent to $\overline{x} \leq c$ .   
(b) Find $c$ so that the significance level is $\alpha = 0.05$ . Compute the power of this test if $H_{1}$ is true.   
(c) If the loss function is such that $\mathcal{L}(1,1) = \mathcal{L}(0,0) = 0$ and $\mathcal{L}(1,0) = \mathcal{L}(0,1) > 0$ , find the minimax test. Evaluate the power function of this test at the points $\theta = 1$ and $\theta = 0$ .

8.5.2. Let $X_1, X_2, \ldots, X_{10}$ be a random sample of size 10 from a Poisson distribution with parameter $\theta$ . Let $L(\theta)$ be the joint pdf of $X_1, X_2, \ldots, X_{10}$ . The problem is to test $H_0: \theta = \frac{1}{2}$ against $H_1: \theta = 1$ .

(a) Show that $L\left(\frac{1}{2}\right) / L(1) \leq k$ is equivalent to $y = \sum_{1}^{n} x_{i} \geq c$ .   
(b) In order to make $\alpha = 0.05$ , show that $H_0$ is rejected if $y > 9$ and, if $y = 9$ , reject $H_0$ with probability $\frac{1}{2}$ (using some auxiliary random experiment).   
(c) If the loss function is such that $\mathcal{L}(\frac{1}{2},\frac{1}{2}) = \mathcal{L}(1,1) = 0$ and $\mathcal{L}(\frac{1}{2},1) = 1$ and $\mathcal{L}(1,\frac{1}{2}) = 2$ , show that the minimax procedure is to reject $H_{0}$ if $y > 6$ and, if $y = 6$ , reject $H_{0}$ with probability 0.08 (using some auxiliary random experiment).

8.5.3. In Example 8.5.2 let $\mu_1' = \mu_2' = 0$ , $\mu_1'' = \mu_2'' = 1$ , $\sigma_1^2 = 1$ , $\sigma_2^2 = 1$ , and $\rho = \frac{1}{2}$ .

(a) Find the distribution of the linear function $aX + bY$   
(b) With $k = 1$ , compute $P(aX + bY \leq c; \mu_1' = \mu_2' = 0)$ and $P(aX + bY > c; \mu_1'' = \mu_2'' = 1)$ .

8.5.4. Determine Newton's algorithm to find the solution of Equation (8.5.2). If software is available, write a program that performs your algorithm and then show that the solution is $c = 76.8$ . If software is not available, solve (8.5.2) by "trial and error."

8.5.5. Let $X$ and $Y$ have the joint pdf

$$
f (x, y; \theta_ {1}, \theta_ {2}) = \frac {1}{\theta_ {1} \theta_ {2}} \exp \left(- \frac {x}{\theta_ {1}} - \frac {y}{\theta_ {2}}\right), 0 <   x <   \infty , 0 <   y <   \infty ,
$$

zero elsewhere, where $0 < \theta_{1}$ , $0 < \theta_{2}$ . An observation $(x,y)$ arises from the joint distribution with parameters equal to either $(\theta_1' = 1,\theta_2' = 5)$ or $(\theta_1'' = 3,\theta_2'' = 2)$ . Determine the form of the classification rule.

8.5.6. Let $X$ and $Y$ have a joint bivariate normal distribution. An observation $(x, y)$ arises from the joint distribution with parameters equal to either

$$
\mu_ {1} ^ {\prime} = \mu_ {2} ^ {\prime} = 0, (\sigma_ {1} ^ {2}) ^ {\prime} = (\sigma_ {2} ^ {2}) ^ {\prime} = 1, \rho^ {\prime} = \frac {1}{2}
$$

or

$$
\mu_ {1} ^ {\prime \prime} = \mu_ {2} ^ {\prime \prime} = 1, (\sigma_ {1} ^ {2}) ^ {\prime \prime} = 4, (\sigma_ {2} ^ {2}) ^ {\prime \prime} = 9, \rho^ {\prime \prime} = \frac {1}{2}.
$$

Show that the classification rule involves a second-degree polynomial in $x$ and $y$ .

8.5.7. Let $\pmb{W}^{\prime} = (W_{1}, W_{2})$ be an observation from one of two bivariate normal distributions, I and II, each with $\mu_{1} = \mu_{2} = 0$ but with the respective variance-covariance matrices

$$
\boldsymbol {V} _ {1} = \left( \begin{array}{c c} 1 & 0 \\ 0 & 4 \end{array} \right) \quad \text {a n d} \quad \boldsymbol {V} _ {2} = \left( \begin{array}{c c} 3 & 0 \\ 0 & 1 2 \end{array} \right).
$$

How would you classify $\pmb{W}$ into I or II?


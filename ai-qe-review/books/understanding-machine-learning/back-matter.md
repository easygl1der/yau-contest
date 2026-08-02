# 后置内容

> [!cite] 此文件保留最后一个自动识别章节之后的附录、书目、索引或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 11148–12251。


As in the MDL paradigm, we define a hierarchy over hypotheses in our class $\mathcal{H}.$ Now, the hierarchy takes the form of a prior distribution over $\mathcal{H}.$ . That ${\mathrm{is}},$ we assign a probability (or density if $\mathcal{H}$ is continuous) $P(h) \ge 0$ for each $h \in \mathcal H$ and refer to $P(h)$ as the prior score of $h.$ . Following the Bayesian reasoning approach, the output of the learning algorithm is not necessarily a single hypothesis. Instead, the learning process defines a posterior probability over $\mathcal{H},$ which we denote by $Q.$ . In the context of a supervised learning problem, where $\mathcal{H}$ contains functions from $\mathcal{X}$ to ${\mathcal{V}},$ , one can think of $Q$ as defining a randomized prediction rule as follows. Whenever we get a new instance $\mathbf{x},$ we randomly pick a hypothesis $h \in \mathcal H$ according to $Q$ and predict $h(\mathbf{x})$ . We define the loss of $Q$ on an example $z$ to be

$$
\ell(Q, z) \stackrel{\mathrm{def}}{=} \underset{h \sim Q}{\mathbb{E}}[\ell(h, z)].
$$

$\mathrm{By}$ the linearity of expectation, the generalization loss and training loss of $Q$ can be written as

$$
L_{\mathcal{D}}(Q) \stackrel{\mathrm{def}}{=} \underset{h \sim Q}{\mathbb{E}}[L_{\mathcal{D}}(h)] \quad \text{and} \quad L_{S}(Q) \stackrel{\mathrm{def}}{=} \underset{h \sim Q}{\mathbb{E}}[L_{S}(h)].
$$

The following theorem tells us that the diference between the generalization loss and the empirical loss of a posterior $Q$ is bounded by an expression that depends on the Kullback-Leibler divergence between $Q$ and the prior distribution $P.$ . The Kullback-Leibler is a natural measure of the distance between two distributions. The theorem suggests that if we would like to minimize the generalization loss of $Q,$ we should jointly minimize both the empirical loss of $Q$ and the Kullback-Leibler distance between $Q$ and the prior distribution. We will later show how in some cases this idea leads to the regularized risk minimization principle.

<sup>theorem</sup> 31.1 Let D be an arbitrary distribution over an example domain $Z.$ Let H be a hypothesis class and let $\ell : \mathcal{H} \times Z[0, 1]$ be a loss function. Let $P$ be a prior distribution over $\mathcal{H}$ and let $\delta \in(0, 1)$ . Then, with probability of at least $1 - \delta$ over the choice of an i.i.d. training set $S = \{z_{1}, \ldots, z_{m}\}$ sampled according to $\mathcal{D}_{\mathrm{:}}$ , for all distributions $Q$ over H (even such that depend on $S)$ , we have

$$
L_{\mathcal{D}}(Q) \leq L_{S}(Q) + \sqrt{\frac{D(Q | | P) + \ln m / \delta}{2(m - 1)}},
$$

where

$$
D(Q | | P) \stackrel{\mathrm{def}}{=} \underset{h \sim Q}{\mathbb{E}}[\ln(Q(h) / P(h))]
$$

is the Kullback-Leibler divergence.

Proof For any function $f(S)$ , using Markov’s inequality:

$$
\mathbb{P}_{S}[f(S) \geq \epsilon] = \mathbb{P}_{S}[e^{f(S)} \geq e^{\epsilon}] \leq \frac{\mathbb{E}_{S}[e^{f(S)}]}{e^{\epsilon}}.\tag{31.1}
$$

Let $\Delta(h) = L_{\mathcal{D}}(h) - L_{S}(h)$ . We will apply Equation (31.1) with the function

$$
f(S) = \sup_{Q} \left(2(m - 1) \underset{h \sim Q}{\mathbb{E}}(\Delta(h))^{2} - D(Q | | P)\right).
$$

We now turn to bound $\mathbb{E}_{S}[e^{f(S)}]$ . The main trick is to upper bound $f(S)$ by using an expression that does not depend on $Q$ but rather depends on the prior probability $P$ . To do so, fix some $S$ and note that from the definition of $D(Q | | P)$ we get that for all $Q.$

$$
\begin{array}{rl} & 2(m - 1) \underset{h \sim Q}{\mathbb{E}}(\Delta(h))^{2} - D(Q | | P) = \underset{h \sim Q}{\mathbb{E}}[\ln(e^{2(m - 1) \Delta(h)^{2}} P(h) / Q(h))] \\ & \qquad \leq \ln \underset{h \sim Q}{\mathbb{E}}[e^{2(m - 1) \Delta(h)^{2}} P(h) / Q(h)] \\ & \qquad = \ln \underset{h \sim P}{\mathbb{E}}[e^{2(m - 1) \Delta(h)^{2}}], \end{array}\tag{31.2}
$$

where the inequality follows from Jensen’s inequality and the concavity of the log function. Therefore,

$$
\underset{S}{\mathbb{E}}[e^{f(S)}] \leq \underset{S}{\mathbb{E}} \underset{h \sim P}{\mathbb{E}}[e^{2(m - 1) \Delta(h)^{2}}].\tag{31.3}
$$

The advantage of the expression on the right-hand side stems from the fact that we can switch the order of expectations (because $P$ is a prior that does not depend on S), which yields

$$
\underset{S}{\mathbb{E}}[e^{f(S)}] \leq \underset{h \sim P}{\mathbb{E}} \underset{S}{\mathbb{E}}[e^{2(m - 1) \Delta(h)^{2}}].\tag{31.4}
$$

Next, we claim that for all h we have $\mathbb{E}_{S}[e^{2(m - 1) \Delta(h)^{2}}] \le m$ . To do so, recall that Hoefding’s inequality tells us that

$$
\mathbb{P}_{S}[\Delta(h) \geq \epsilon] \leq e^{- 2m \epsilon^{2}}.
$$

This implies that $\mathbb{E}_{S}[e^{2(m - 1) \Delta(h)^{2}}] \le m$ (see Exercise 1). Combining this with Equation (31.4) and plugging into Equation (31.1) we get

$$
\mathbb{P}_{S}[f(S) \geq \epsilon] \leq \frac{m}{e^{\epsilon}}.\tag{31.5}
$$

Denote the right-hand side of the above $\delta,$ thus $\epsilon = \ln(m / \delta)$ , and we therefore obtain that with probability of at least $1 - \delta$ we have that for all $Q$

$$
2(m - 1) \underset{h \sim Q}{\mathbb{E}}(\Delta(h))^{2} - D(Q | | P) \leq \epsilon = \ln(m / \delta).
$$

Rearranging the inequality and using Jensen’s inequality again (the function $x^{2}$ is convex) we conclude that

$$
\left(\underset{h \sim Q}{\mathbb{E}} \Delta(h)\right)^{2} \leq \underset{h \sim Q}{\mathbb{E}}(\Delta(h))^{2} \leq \frac{\ln(m / \delta) + D(Q | | P)}{2(m - 1)}.\tag{31.6}
$$

□

Remark 31.1 (Regularization) The PAC-Bayes bound leads to the following learning rule:

Given a prior $P,$ return a posterior Q that minimizes the function

$$
L_{S}(Q) + \sqrt{\frac{D(Q | | P) + \ln m / \delta}{2(m - 1)}}.\tag{31.7}
$$

This rule is similar to the regularized risk minimization principle. That is, we jointly minimize the empirical loss of $Q$ on the sample and the Kullback-Leibler “distance” between $Q$ and $P.$

## 31.2 Bibliographic Remarks

PAC-Bayes bounds were first introduced by McAllester (1998). See also (McAllester 1999, McAllester 2003, Seeger 2003, Langford & Shawe-Taylor 2003, Langford 2006).

## 31.3 Exercises

1. Let X be a random variable that satisfies $\mathbb{P}[X \ge \epsilon] \le e^{- 2m \epsilon^{2}}$ . Prove that $\mathbb{E}[e^{2(m - 1) X^{2}}] \leq m$

2. • Suppose that H is a finite hypothesis class, set the prior to be uniform over H, and set the posterior to be $Q(h_{S}) = 1$ for some $h_{S}$ and $Q(h) = 0$ for all other $h \in \mathcal H$ . Show that

$$
L_{\mathcal{D}}(h_{S}) \leq L_{S}(h) + \sqrt{\frac{\ln(| \mathcal{H} |) + \ln(m / \delta)}{2(m - 1)}}.
$$

Compare to the bounds we derived using uniform convergence.

- Derive a bound similar to the Occam bound given in Chapter 7 using the PAC-Bayes bound

# Appendix A Technical Lemmas

<sup>lemma</sup> A.1 Let $a > 0$ . Then: $x \geq 2a \log(a) \ \Rightarrow \x \geq a \log(x)$ . It follows that a necessary condition for the inequality $x < a \log(x)$ to hold is that $x < 2a \log(a)$

Proof First note that for $a \in(0,{\sqrt{e}}]$ the inequality $x \geq a \log(x)$ holds unconditionally and therefore the claim is trivial. From now on, assume that $a >{\sqrt{e}}.$ Consider the function $f(x) = x - a \log(x)$ . The derivative is $f^{\prime}(x) = 1 - a / x \quad$ Thus, for $x > a$ the derivative is positive and the function increases. In addition,

$$
\begin{array}{rl} & f(2a \log(a)) = 2a \log(a) - a \log(2a \log(a)) \\ & \qquad = 2a \log(a) - a \log(a) - a \log(2 \log(a)) \\ & \qquad = a \log(a) - a \log(2 \log(a)).\end{array}
$$

Since $a - 2 \log(a) > 0$ for all $a > 0$ , the proof follows.

<sup>lemma</sup> A.2 Let $a \ge 1$ and $b > 0$ . Then: $x \geq 4a \log(2a) + 2b \Rightarrow x \geq a \log(x) + b.$

Proof It sufices to prove that $x \geq$ 4a $\log(2a) +$ 2b implies that both $x \ge$ $2a \log(x)$ and $x \geq 2b.$ . Since we assume $a \ge 1$ we clearly have that $x \geq 2b$ In addition, since $b > 0$ we have that $x \geq 4a \log(2a)$ which using Lemma A.1 implies that $x \geq 2a \log(x)$ . This concludes our proof. □

<sup>lemma</sup> A.3 Let X be a random variable and $x^{\prime} \in \mathbb{R}$ be a scalar and assume that there exists $a > 0$ such that for all $t \geq 0$ we have $\mathbb{P}[| X - x^{\prime} | > t] \le 2e^{- t^{2} / a^{2}}$ Then, $\mathbb{E}[| X - x^{\prime} |] ~ \leq ~ 4a$

Proof For all $i = 0, 1, 2,...$ . denote $t_{i} = ai$ . Since $t_{i}$ is monotonically increasing we have that $\mathbb{E}[| X - x^{\prime} |]$ is at most $\textstyle \sum_{i = 1}^{\infty} t_{i} \mathbb{P}[| X - x^{\prime} | > t_{i - 1}]$ . Combining this with the assumption in the lemma we get that $\begin{array}{r}{\mathbb{E}[| X - x^{\prime} |] \leq 2 \bar{a} \sum_{i = 1}^{\infty} ie^{-(\bar{i} - 1)^{2}}} \end{array}$ The proof now follows from the inequalities

$$
\sum_{i = 1}^{\infty} ie^{-(i - 1)^{2}} \leq \sum_{i = 1}^{5} ie^{-(i - 1)^{2}} + \int_{5}^{\infty} xe^{-(x - 1)^{2}} dx < 1.8 + 10^{- 7} < 2.
$$

<sup>lemma</sup> A.4 Let X be a random variable and $x^{\prime} \in \mathbb{R}$ be a scalar and assume that there exists $a > 0$ and $b \geq e$ such that for all $t \geq 0$ we have $\mathbb{P}[| X - x^{\prime} | >$ $t] \leq 2be^{- t^{2} / a^{2}}.\Then, \mathbb{E}[| X - x^{\prime} |] \ \leq \a(2 + \sqrt{\log(b)})$

Proof For all $i = 0, 1, 2,...$ . denote $t_{i} = a \left(i + \sqrt{\log(b)} \right)$ . Since $t_{i}$ is monotonically increasing we have that

$$
\mathbb{E}[| X - x^{\prime} |] \leq a \sqrt{\log(b)} + \sum_{i = 1}^{\infty} t_{i} \mathbb{P}[| X - x^{\prime} | > t_{i - 1}].
$$

Using the assumption in the lemma we have

$$
\begin{array}{l} \sum_{i = 1}^{\infty} t_{i} \mathbb{P}[| X - x^{\prime} | > t_{i - 1}] \leq 2ab \sum_{i = 1}^{\infty}(i + \sqrt{\log(b)}) e^{-(i - 1 + \sqrt{\log(b)})^{2}} \\ \quad \leq 2ab \int_{1 + \sqrt{\log(b)}}^{\infty} xe^{-(x - 1)^{2}} dx \\ \quad = 2ab \int_{\sqrt{\log(b)}}^{\infty}(y + 1) e^{- y^{2}} dy \\ \quad \leq 4ab \int_{\sqrt{\log(b)}}^{\infty} ye^{- y^{2}} dy \\ \quad = 2ab \left[- e^{- y^{2}} \right]_{\sqrt{\log(b)}}^{\infty} \\ \quad = 2ab / b = 2a.\end{array}
$$

Combining the preceding inequalities we conclude our proof.

<sup>lemma</sup> A.5 Let m, d be two positive integers such that $d \leq m - 2$ . Then,

$$
\sum_{k = 0}^{d} \binom{m}{k} \leq \left(\frac{em}{d}\right)^{d}.
$$

Proof We prove the claim by induction. For d = 1 the left-hand side equals 1 + m while the right-hand side equals em; hence the claim is true. Assume that the claim holds for d and let us prove it for d + 1. By the induction assumption we have

$$
\begin{array}{l} \sum_{k = 0}^{d + 1} \binom{m}{k} \leq \left(\frac{em}{d}\right)^{d} + \binom{m}{d + 1} \\ \qquad = \left(\frac{em}{d}\right)^{d} \left(1 + \left(\frac{d}{em}\right)^{d} \frac{m(m - 1)(m - 2) \cdots(m - d)}{(d + 1) d !}\right) \\ \qquad \leq \left(\frac{em}{d}\right)^{d} \left(1 + \left(\frac{d}{e}\right)^{d} \frac{(m - d)}{(d + 1) d !}\right).\end{array}
$$

Using Stirling’s approximation we further have that

$$
\begin{array}{l} \leq \left(\frac{em}{d}\right)^{d} \left(1 + \left(\frac{d}{e}\right)^{d} \frac{(m - d)}{(d + 1) \sqrt{2 \pi d}(d / e)^{d}}\right) \\ = \left(\frac{em}{d}\right)^{d} \left(1 + \frac{m - d}{\sqrt{2 \pi d}(d + 1)}\right) \\ = \left(\frac{em}{d}\right)^{d} \cdot \frac{d + 1 +(m - d) / \sqrt{2 \pi d}}{d + 1} \\ \leq \left(\frac{em}{d}\right)^{d} \cdot \frac{d + 1 +(m - d) / 2}{d + 1} \\ = \left(\frac{em}{d}\right)^{d} \cdot \frac{d / 2 + 1 + m / 2}{d + 1} \\ \leq \left(\frac{em}{d}\right)^{d} \cdot \frac{m}{d + 1}, \end{array}
$$

where in the last inequality we used the assumption that $d \leq m - 2.$ . On the other hand,

$$
\begin{array}{rl} \left(\frac{em}{d + 1}\right)^{d + 1} & = \left(\frac{em}{d}\right)^{d} \cdot \frac{em}{d + 1} \cdot \left(\frac{d}{d + 1}\right)^{d} \\ & = \left(\frac{em}{d}\right)^{d} \cdot \frac{em}{d + 1} \cdot \frac{1}{(1 + 1 / d)^{d}} \\ & \geq \left(\frac{em}{d}\right)^{d} \cdot \frac{em}{d + 1} \cdot \frac{1}{e} \\ & = \left(\frac{em}{d}\right)^{d} \cdot \frac{m}{d + 1}, \end{array}
$$

which proves our inductive argument.

□

<sup>lemma</sup> A.6 For all $a \in \mathbb{R}$ we have

$$
\frac{e^{a} + e^{- a}}{2} \leq e^{a^{2} / 2}.
$$

Proof Observe that

$$
e^{a} = \sum_{n = 0}^{\infty} \frac{a^{n}}{n !}.
$$

Therefore,

$$
{\frac{e^{a} + e^{- a}}{2}} = \sum_{n = 0}^{\infty}{\frac{a^{2n}}{(2n) !}},
$$

and

$$
e^{a^{2} / 2} = \sum_{n = 0}^{\infty} \frac{a^{2n}}{2^{n} n !}.
$$

Observing that $(2n) ! \geq 2^{n}$ n! for every n $\geq 0$ we conclude our proof. □

# Appendix B Measure Concentration

Let $Z_{1}, \ldots, Z_{m}$ be an i.i.d. sequence of random variables and let $\mu$ be their mean. The strong law of large numbers states that when $m$ tends to infinity, the empirical average, $\begin{array}{r}{\frac{1}{m} \sum_{i = 1}^{m} Z_{i},} \end{array}$ , converges to the expected value $\mu,$ with probability 1. Measure concentration inequalities quantify the deviation of the empirical average from the expectation when m is finite.

## B.1 Markov’s Inequality

We start with an inequality which is called Markov’s inequality. Let $Z$ be a nonnegative random variable. The expectation of $Z$ can be written as follows:

$$
\mathbb{E}[Z] = \int_{x = 0}^{\infty} \mathbb{P}[Z \geq x] dx.\tag{B.1}
$$

Since $\mathbb{P}[Z \geq x]$ is monotonically nonincreasing we obtain

$$
\forall a \geq 0, \mathbb{E}[Z] \geq \int_{x = 0}^{a} \mathbb{P}[Z \geq x] dx \geq \int_{x = 0}^{a} \mathbb{P}[Z \geq a] dx = a \mathbb{P}[Z \geq a].\tag{B.2}
$$

Rearranging the inequality yields Markov’s inequality:

$$
\forall a \geq 0, \mathbb{P}[Z \geq a] \leq \frac{\mathbb{E}[Z]}{a}.\tag{B.3}
$$

For random variables that take value in $[0, 1]$ , we can derive from Markov’s inequality the following.

<sup>lemma</sup> B.1 Let $Z$ be a random variable that takes values in $[0, 1]$ . Assume that $\mathbb{E}[Z] = \mu$ . Then, for any $a \in(0, 1)$ ,

$$
\mathbb{P}[Z > 1 - a] \geq \frac{\mu -(1 - a)}{a}.
$$

This also implies that for every $a \in(0, 1)$ ),

$$
\mathbb{P}[Z > a] \geq \frac{\mu - a}{1 - a} \geq \mu - a.
$$

Proof Let $Y = 1 - Z$ . Then $Y$ is a nonnegative random variable with $\mathbb{E}[Y] =$ $1 - \mathbb{E}[Z] = 1 - \mu.\ \mathrm{Apply}$ ing Markov’s inequality on $Y$ we obtain

$$
\mathbb{P}[Z \leq 1 - a] = \mathbb{P}[1 - Z \geq a] = \mathbb{P}[Y \geq a] \leq \frac{\mathbb{E}[Y]}{a} = \frac{1 - \mu}{a}.
$$

Therefore,

$$
\mathbb{P}[Z > 1 - a] \geq 1 - \frac{1 - \mu}{a} = \frac{a + \mu - 1}{a}.
$$

## B.2 Chebyshev’s Inequality

Applying Markov’s inequality on the random variable $(Z - \mathbb{E}[Z])^{2}$ we obtain Chebyshev’s inequality:

$$
\forall a > 0, \quad \mathbb{P}[| Z - \mathbb{E}[Z] | \geq a] = \mathbb{P}[(Z - \mathbb{E}[Z])^{2} \geq a^{2}] \leq \frac{\operatorname{Var}[Z]}{a^{2}},\tag{B.4}
$$

where $\operatorname{Var}[Z] = \mathbb{E}[(Z - \mathbb{E}[Z])^{2}]$ is the variance of $Z.$

Consider the random variable $\begin{array}{r}{\frac{1}{m} \sum_{i = 1}^{m} Z_{i}} \end{array}$ . Since $Z_{1}, \ldots, Z_{m}$ are i.i.d. it is easy to verify that

$$
\operatorname{Var} \left[\frac{1}{m} \sum_{i = 1}^{m} Z_{i} \right] = \frac{\operatorname{Var}[Z_{1}]}{m}.
$$

Applying Chebyshev’s inequality, we obtain the following:

<sup>lemma</sup> B.2 Let $Z_{1}, \ldots, Z_{m}$ be a sequence of i.i.d. random variables and assume that $\mathbb{E}[Z_{1}] = \mu$ and $\operatorname{Var}[Z_{1}] \le 1$ . Then, for any $\delta \in(0, 1)$ , with probability of at least $1 - \delta$ we have

$$
\left| \frac{1}{m} \sum_{i = 1}^{m} Z_{i} - \mu \right| \leq \sqrt{\frac{1}{\delta m}}.
$$

Proof Applying Chebyshev’s inequality we obtain that for all $a > 0$

$$
\mathbb{P} \left[\left| \frac{1}{m} \sum_{i = 1}^{m} Z_{i} - \mu \right| > a \right] \leq \frac{\operatorname{Var}[Z_{1}]}{ma^{2}} \leq \frac{1}{ma^{2}}.
$$

The proof follows by denoting the right-hand side δ and solving for a. □

The deviation between the empirical average and the mean given previously decreases polynomially with $m$ . It is possible to obtain a significantly faster decrease. In the sections that follow we derive bounds that decrease exponentially fast.

## B.3 Chernof’s Bounds

Let $Z_{1}, \ldots, Z_{m}$ be independent Bernoulli variables where for every $i, \mathbb{P}[Z_{i} = 1]$ = $p_{i}$ and $\mathbb{P}[Z_{i} = 0] = 1 - p_{i}$ . Let $\textstyle p = \sum_{i = 1}^{m} p_{i}$ and let $\begin{array}{r}{Z = \sum_{i = 1}^{m} Z_{i}} \end{array}$ . Using the monotonicity of the exponent function and Markov’s inequality, we have that for every $t > 0$

$$
\mathbb{P}[Z >(1 + \delta) p] = \mathbb{P}[e^{tZ} > e^{t(1 + \delta) p}] \leq \frac{\mathbb{E}[e^{tZ}]}{e^{(1 + \delta) tp}}.\tag{B.5}
$$

Next,

$$
\begin{array}{ll} \mathbb{E}[e^{tZ}] = \mathbb{E}[e^{t \sum_{i} Z_{i}}] = \mathbb{E}[\prod_{i} e^{tZ_{i}}] \\ \qquad = \prod_{i} \mathbb{E}[e^{tZ_{i}}] & \text{by independence} \\ \qquad = \prod_{i} \left(p_{i} e^{t} +(1 - p_{i}) e^{0}\right) \\ \qquad = \prod_{i} \left(1 + p_{i}(e^{t} - 1)\right) \\ \qquad \leq \prod_{i} e^{p_{i}(e^{t} - 1)} & \text{using} 1 + x \leq e^{x} \\ \qquad = e^{\sum_{i} p_{i}(e^{t} - 1)} \\ \qquad = e^{(e^{t} - 1) p}.\end{array}
$$

Combining the above with Equation (B.5) and choosing $t = \log(1 + \delta)$ we obtain

<sup>lemma</sup> B.3 Let $Z_{1}, \ldots, Z_{m}$ be independent Bernoulli variables where for every $i, \mathbb{P}[Z_{i} = 1] = p_{i}$ and $\mathbb{P}[Z_{i} = 0] = 1 - p_{i}$ . Let $\textstyle p = \sum_{i = 1}^{m} p_{i}$ and let $\begin{array}{r}{Z = \sum_{i = 1}^{m} Z_{i}} \end{array}$ Then, for any $\delta > 0$ ),

$$
\mathbb{P}[Z >(1 + \delta) p] \leq e^{- h(\delta) p},
$$

where

$$
h(\delta) =(1 + \delta) \log(1 + \delta) - \delta.
$$

Using the inequality $h(a) \geq a^{2} /(2 + 2a / 3)$ we obtain

<sup>lemma</sup> B.4 Using the notation of Lemma B.3 we also have

$$
\mathbb{P}[Z >(1 + \delta) p] \leq e^{- p \frac{\delta^{2}}{2 + 2 \delta / 3}}.
$$

For the other direction, we apply similar calculations:

$$
\mathbb{P}[Z <(1 - \delta) p] = \mathbb{P}[- Z > -(1 - \delta) p] = \mathbb{P}[e^{- tZ} > e^{- t(1 - \delta) p}] \leq \frac{\mathbb{E}[e^{- tZ}]}{e^{-(1 - \delta) tp}},\tag{B.6}
$$

and,

$$
\begin{array}{ll} \mathbb{E}[e^{- tZ}] = \mathbb{E}[e^{- t \sum_{i} Z_{i}}] = \mathbb{E}[\prod_{i} e^{- tZ_{i}}] \\ \qquad = \prod_{i} \mathbb{E}[e^{- tZ_{i}}] & \text{by independence} \\ \qquad = \prod_{i} \left(1 + p_{i}(e^{- t} - 1)\right) \\ \qquad \leq \prod_{i} e^{p_{i}(e^{- t} - 1)} & \text{using1 + x\leq e^{x}} \\ \qquad = e^{(e^{- t} - 1) p}.\end{array}
$$

Setting $t = - \log(1 - \delta)$ yields

$$
\mathbb{P}[Z <(1 - \delta) p] \leq \frac{e^{- \delta p}}{e^{(1 - \delta) \log(1 - \delta)} p} = e^{- ph(- \delta)}.
$$

It is easy to verify that $h(- \delta) \geq h(\delta)$ and hence

<sup>lemma</sup> B.5 Using the notation of Lemma B.3 we also have

$$
\mathbb{P}[Z <(1 - \delta) p] \leq e^{- ph(- \delta)} \leq e^{- ph(\delta)} \leq e^{- p \frac{\delta^{2}}{2 + 2 \delta / 3}}.
$$

## B.4 Hoefding’s Inequality

<sup>lemma</sup> B.6 (Hoefding’s inequality) Let $Z_{1}, \ldots, Z_{m}$ be a sequence of i.i.d. random variables and let $\begin{array}{r}{\bar{Z} = \frac{1}{m} \sum_{i = 1}^{m} Z_{i}} \end{array}$ . Assume that $\mathbb{E}[\bar{Z}] = \mu$ and $\mathbb{P}[a \leq$ $Z_{i} \leq b] = 1$ for every i. Then, for any $\epsilon > 0$

$$
\mathbb{P} \left[\left| \frac{1}{m} \sum_{i = 1}^{m} Z_{i} - \mu \right| > \epsilon \right] \leq 2 \exp \left(- 2m \epsilon^{2} /(b - a)^{2}\right).
$$

Proof Denote $X_{i} = Z_{i} - \mathbb{E}[Z_{i}]$ and $\begin{array}{r}{\bar{X} = \frac{1}{m} \sum_{i} X_{i}} \end{array}$ . Using the monotonicity of the exponent function and Markov’s inequality, we have that for every $\lambda > 0$ and $\epsilon > 0$ ,

$$
\mathbb{P}[\bar{X} \geq \epsilon] = \mathbb{P}[e^{\lambda \bar{X}} \geq e^{\lambda \epsilon}] \leq e^{- \lambda \epsilon} \mathbb{E}[e^{\lambda \bar{X}}].
$$

Using the independence assumption we also have

$$
\mathbb{E}[e^{\lambda \bar{X}}] = \mathbb{E} \left[\prod_{i} e^{\lambda X_{i} / m} \right] = \prod_{i} \mathbb{E}[e^{\lambda X_{i} / m}].
$$

$\mathrm{By}$ Hoefding’s lemma (Lemma B.7 later), for every i we have

$$
\mathbb{E}[e^{\lambda X_{i} / m}] \leq e^{\frac{\lambda^{2}(b - a)^{2}}{8m^{2}}}.
$$

Therefore,

$$
\mathbb{P}[\bar{X} \geq \epsilon] \leq e^{- \lambda \epsilon} \prod_{i} e^{\frac{\lambda^{2}(b - a)^{2}}{8m^{2}}} = e^{- \lambda \epsilon + \frac{\lambda^{2}(b - a)^{2}}{8m}}.
$$

Setting $\lambda = 4m \epsilon /(b - a)^{2}$ we obtain

$$
\mathbb{P}[\bar{X} \geq \epsilon] \leq e^{- \frac{2m \epsilon^{2}}{(b - a)^{2}}}.
$$

Applying the same arguments on the variable −X<sup>¯</sup> we obtain that $\mathbb{P}[\bar{X} \leq - \epsilon] \leq$ $e^{- \frac{2m \epsilon^{2}}{(b - a)^{2}}}$ . The theorem follows by applying the union bound on the two cases.

<sup>lemma</sup> B.7 (Hoefding’s lemma) Let X be a random variable that takes values in the interval $[a, b]$ and such that $\mathbb{E}[X] = 0$ . Then, for every $\lambda > 0$ 2

$$
\mathbb{E}[e^{\lambda X}] \leq e^{\frac{\lambda^{2}(b - a)^{2}}{8}}.
$$

Proof Since $f(x) = e^{\lambda x}$ is a convex function, we have that for every $\alpha \in(0, 1)$ and $x \in[a, b]$ ,

$$
f(x) \leq \alpha f(a) +(1 - \alpha) f(b).
$$

Setting $\begin{array}{r}{\alpha = \frac{b - x}{b - a} \in[0, 1]} \end{array}$ yields

$$
e^{\lambda x} \leq \frac{b - x}{b - a} e^{\lambda a} + \frac{x - a}{b - a} e^{\lambda b}.
$$

Taking the expectation, we obtain that

$$
\mathbb{E}[e^{\lambda X}] \leq \frac{b - \mathbb{E}[X]}{b - a} e^{\lambda a} + \frac{\mathbb{E}[x] - a}{b - a} e^{\lambda b} = \frac{b}{b - a} e^{\lambda a} - \frac{a}{b - a} e^{\lambda b},
$$

where we used the fact that $\mathbb{E}[X] = 0$ . Denote $\begin{array}{r}{h = \lambda(b - a), p = \frac{- a}{b - a}} \end{array}$ , and $L(h) = - hp + \log(1 - p + pe^{h})$ . Then, the expression on the right-hand side of the above can be rewritten as $e^{L(h)}$ . Therefore, to conclude our proof it sufices to show that $\begin{array}{r}{L(h) \ \leq \ \frac{h^{2}}{8}} \end{array}$ . This follows from Taylor’s theorem using the facts: $L(0) = L^{\prime}(0) = 0$ and $L^{\prime \prime}(h) \leq 1 / 4$ for all h. □

## B.5 Bennet’s and Bernstein’s Inequalities

Bennet’s and Bernsein’s inequalities are similar to Chernof’s bounds, but they hold for any sequence of independent random variables. We state the inequalities without proof, which can be found, for example, in Cesa-Bianchi & Lugosi (2006).

<sup>lemma</sup> B.8 (Bennet’s inequality) Let $Z_{1}, \ldots, Z_{m}$ be independent random variables with zero mean, and assume that $Z_{i} \leq 1$ with probability 1. Let

$$
\sigma^{2} \geq \frac{1}{m} \sum_{i = 1}^{m} \mathbb{E}[Z_{i}^{2}].
$$

Then for all $\epsilon > 0$

$$
\mathbb{P} \left[\sum_{i = 1}^{m} Z_{i} > \epsilon \right] \leq e^{- m \sigma^{2} h \left(\frac{\epsilon}{m \sigma^{2}}\right)}.
$$

where

$$
h(a) =(1 + a) \log(1 + a) - a.
$$

By using the inequality $h(a) \geq a^{2} /(2 + 2a / 3)$ it is possible to derive the following:

<sup>lemma</sup> B.9 (Bernstein’s inequality) Let $Z_{1}, \ldots, Z_{m}$ be $i.i.d.$ random variables with a zero mean. If for all $i, \mathbb{P}(| Z_{i} | < M) = 1$ , then for all $t > 0$ :

$$
\mathbb{P} \left[\sum_{i = 1}^{m} Z_{i} > t \right] \leq \exp \left(- \frac{t^{2} / 2}{\sum \mathbb{E} Z_{j}^{2} + Mt / 3}\right).
$$

## B.5.1 Application

Bernstein’s inequality can be used to interpolate between the rate $1 / \epsilon$ we derived for PAC learning in the realizable case (in Chapter 2) and the rate $1 / \epsilon^{2}$ we derived for the unrealizable case (in Chapter 4).

<sup>lemma</sup> B.10 Let $\ell : \mathcal{H} \times Z[0, 1]$ be a loss function. Let D be an arbitrary distribution over $Z$ . Fix some h. Then, for any $\delta \in(0, 1)$ we have

$$
\begin{array}{ll} 1.& \mathbb{P}_{S \sim \mathcal{D}^{m}} \left[L_{S}(h) \geq L_{D}(h) + \sqrt{\frac{2L_{D}(h) \log(1 / \delta)}{3m}} + \frac{2 \log(1 / \delta)}{m} \right] \leq \delta \\ 2.& \mathbb{P}_{S \sim \mathcal{D}^{m}} \left[L_{D}(h) \geq L_{S}(h) + \sqrt{\frac{2L_{S}(h) \log(1 / \delta)}{m}} + \frac{4 \log(1 / \delta)}{m} \right] \leq \delta \end{array}
$$

Proof Define random variables $\alpha _ { 1 } , \ldots , \alpha _ { m } { \mathrm { ~ s . t . ~ } } \alpha _ { i } = \ell ( h , z _ { i } ) - L _ { D } ( h ) $ . Note that $\mathbb{E}[\alpha_{i}] = 0$ and that

$$
\begin{array}{rl} &{\mathbb{E}[\alpha_{i}^{2}] = \mathbb{E}[\ell(h, z_{i})^{2}] - 2L_{\mathcal{D}}(h) \mathbb{E}[\ell(h, z_{i})] + L_{\mathcal{D}}(h)^{2}} \\ &{\qquad = \mathbb{E}[\ell(h, z_{i})^{2}] - L_{\mathcal{D}}(h)^{2}} \\ &{\qquad \leq \mathbb{E}[\ell(h, z_{i})^{2}]} \\ &{\qquad \leq \mathbb{E}[\ell(h, z_{i})] = L_{\mathcal{D}}(h),} \end{array}
$$

where in the last inequality we used the fact that $\ell(h, z_{i}) ~ \in ~[0, 1]$ and thus $\ell(h, z_{i})^{2} \leq \ell(h, z_{i})$ . Applying Bernsein’s inequality over the $\alpha_{i}{'} s$ yields

$$
\begin{array}{rl} \mathbb{P} \left[\sum_{i = 1}^{m} \alpha_{i} > t \right] & \leq \exp \left(- \frac{t^{2} / 2}{\sum \mathbb{E} \alpha_{j}^{2} + t / 3}\right) \\ & \leq \exp \left(- \frac{t^{2} / 2}{mL_{\mathcal{D}}(h) + t / 3}\right) \stackrel{{\mathrm{def}}}{{=}} \delta.\end{array}
$$

Solving for t yields

$$
\begin{array}{l} \frac{t^{2} / 2}{mL_{\mathcal{D}}(h) + t / 3} = \log(1 / \delta) \\ \Rightarrow t^{2} / 2 - \frac{\log(1 / \delta)}{3} t - \log(1 / \delta) mL_{\mathcal{D}}(h) = 0 \\ \Rightarrow t = \frac{\log(1 / \delta)}{3} + \sqrt{\frac{\log^{2}(1 / \delta)}{3^{2}} + 2 \log(1 / \delta) mL_{\mathcal{D}}(h)} \\ \leq 2 \frac{\log(1 / \delta)}{3} + \sqrt{2 \log(1 / \delta) mL_{\mathcal{D}}(h)} \end{array}
$$

Since $\begin{array}{r}{\frac{1}{m} \sum_{i} \alpha_{i} = L_{S}(h) - L_{\mathcal{D}}(h)} \end{array}$ , it follows that with probability of at least $1 - \delta.$

$$
L_{S}(h) - L_{\mathcal{D}}(h) \leq 2 \frac{\log(1 / \delta)}{3m} + \sqrt{\frac{2 \log(1 / \delta) L_{\mathcal{D}}(h)}{m}},
$$

which proves the first inequality. The second part of the lemma follows in a similar way. □

## B.6 Slud’s Inequality

Let X be a $(m, p)$ binomial variable. That is, $\begin{array}{r}{X = \sum_{i = 1}^{m} Z_{i}} \end{array}$ , where each $Z_{i}$ is 1 with probability p and 0 with probability $1 - p$ . Assume that $p =(1 - \epsilon) / 2$ . Slud’s inequality (Slud 1977) tells us that $\mathbb{P}[X \geq m / 2]$ is lower bounded by the probability that a normal variable will be greater than or equal to $\sqrt{m \epsilon^{2} /(1 - \epsilon^{2})}$ . The following lemma follows by standard tail bounds for the normal distribution.

<sup>lemma</sup> B.11 Let X be $a \left(m, p \right)$ binomial variable and assume that $p =(1{-} \epsilon) / 2$ Then,

$$
\mathbb{P}[X \geq m / 2] \geq \frac{1}{2} \left(1 - \sqrt{1 - \exp(- m \epsilon^{2} /(1 - \epsilon^{2}))}\right).
$$

## B.7 Concentration of $\chi^{2}$ Variables

Let $X_{1}, \ldots, X_{k}$ be k independent normally distributed random variables. That is, for all $i, X_{i} \sim N(0, 1)$ . The distribution of the random variable $X_{i}^{2}$ is called $\chi^{2}$ (chi square) and the distribution of the random variable $Z = X_{1}^{2} + \cdot \cdot \cdot + X_{k}^{2}$ is called $\chi_{k}^{2}$ (chi square with k degrees of freedom). Clearly, $\mathbb{E}[X_{i}^{2}] = 1$ and $\mathbb{E}[Z] = k$ . The following lemma states that $X_{k}^{2}$ is concentrated around its mean.

<sup>lemma</sup> B.12 Let $Z \sim \chi_{k}^{2}$ . Then, for all $\epsilon > 0$ we have

$$
\mathbb{P}[Z \leq(1 - \epsilon) k] \leq e^{- \epsilon^{2} k / 6},
$$

and for all $\epsilon \in(0, 3)$ we have

$$
\mathbb{P}[Z \geq(1 + \epsilon) k] \leq e^{- \epsilon^{2} k / 6}.
$$

Finally, for all $\epsilon \in(0, 3)$ ,

$$
\mathbb{P} \left[(1 - \epsilon) k \leq Z \leq(1 + \epsilon) k \right] \geq 1 - 2e^{- \epsilon^{2} k / 6}.
$$

Proof Let us write $\textstyle Z = \sum_{i = 1}^{k} X_{i}^{2}$ where $X_{i} \sim N(0, 1)$ . To prove both bounds we use Chernof’s bounding method. For the first inequality, we first bound $\mathbb{E}[e^{- \lambda X_{1}^{2}}]$ , where $\lambda > 0$ will be specified later. Since $\textstyle e^{- a} \leq 1 - a +{\frac{a^{2}}{2}}$ for all $a \geq 0$ we have that

$$
\mathbb{E}[e^{- \lambda X_{1}^{2}}] \leq 1 - \lambda \mathbb{E}[X_{1}^{2}] + \frac{\lambda^{2}}{2} \mathbb{E}[X_{1}^{4}].
$$

Using the well known equalities, $\mathbb{E}[X_{1}^{2}] = 1$ and $\mathbb{E}[X_{1}^{4}] ~ = ~ 3$ , and the fact that $1 - a \leq e^{- a}$ we obtain that

$$
\mathbb{E} \left[e^{- \lambda X_{1}^{2}} \right] \leq 1 - \lambda + \frac{3}{2} \lambda^{2} \leq e^{- \lambda + \frac{3}{2} \lambda^{2}}.
$$

Now, applying Chernof’s bounding method we get that

$$
\begin{array}{rl} &{\mathbb{P}[- Z \geq -(1 - \epsilon) k] = \mathbb{P} \left[e^{- \lambda Z} \geq e^{-(1 - \epsilon) k \lambda} \right]} \\ &{\qquad \leq e^{(1 - \epsilon) k \lambda} \mathbb{E} \left[e^{- \lambda Z} \right]} \\ &{\qquad = e^{(1 - \epsilon) k \lambda} \left(\mathbb{E} \left[e^{- \lambda X_{1}^{2}} \right]\right)^{k}} \\ &{\qquad \leq e^{(1 - \epsilon) k \lambda} e^{- \lambda k + \frac{3}{2} \lambda^{2} k}} \\ &{\qquad = e^{- \epsilon k \lambda + \frac{3}{2} k \lambda^{2}}.} \end{array}
$$

Choose $\lambda = \epsilon / 3$ we obtain the first inequality stated in the lemma.

For the second inequality, we use a known closed form expression for the moment generating function of a $\chi_{k}^{2}$ distributed random variable:

$$
\forall \lambda < \frac{1}{2}, \mathbb{E} \left[e^{\lambda Z^{2}} \right] =(1 - 2 \lambda)^{- k / 2}.\tag{B.7}
$$

On the basis of the equation and using Chernof’s bounding method we have

$$
\begin{array}{rl} &{\mathbb{P}[Z \geq(1 + \epsilon) k)] = \mathbb{P} \left[e^{\lambda Z} \geq e^{(1 + \epsilon) k \lambda} \right]} \\ &{\qquad \leq e^{-(1 + \epsilon) k \lambda} \mathbb{E} \left[e^{\lambda Z} \right]} \\ &{\qquad = e^{-(1 + \epsilon) k \lambda}(1 - 2 \lambda)^{- k / 2}} \\ &{\qquad \leq e^{-(1 + \epsilon) k \lambda} e^{k \lambda} = e^{- \epsilon k \lambda},} \end{array}
$$

where the last inequality occurs because $(1 - a) \leq e^{- a}$ . Setting $\lambda = \epsilon / 6$ (which is in $(0, 1 / 2)$ by our assumption) we obtain the second inequality stated in the lemma.

Finally, the last inequality follows from the first two inequalities and the union bound. □

## C.1 Basic Definitions

In this chapter we only deal with linear algebra over finite dimensional Euclidean spaces. We refer to vectors as column vectors.

Given two d dimensional vectors $\mathbf{u}, \mathbf{v} \in \mathbb{R}^{d}$ , their inner product is

$$
\langle \mathbf{u}, \mathbf{v} \rangle = \sum_{i = 1}^{d} u_{i} v_{i}.
$$

The Euclidean norm (a.k.a. the $\ell_{2}$ norm) is $\| \mathbf{u} \| = \sqrt{\langle \mathbf{u}, \mathbf{u} \rangle}$ . We also use the $\ell_{1}$ norm, $\begin{array}{r}{\| \mathbf{u} \|_{1} = \sum_{i = 1}^{d} \left| u_{i} \right|} \end{array}$ and the $\ell_{\infty}$ norm $\| \mathbf{u} \|_{\infty} = \operatorname{max}_{i} \left| u_{i} \right|$

A subspace of $\mathbb{R}^{d}$ is a subset of <sup>Rd</sup> which is closed under addition and scalar multiplication. The span of a set of vectors $\mathbf{u}_{1}, \ldots, \mathbf{u}_{k}$ is the subspace containing all vectors of the form

$$
\sum_{i = 1}^{k} \alpha_{i} \mathbf{u}_{i}
$$

where for all $i, \alpha_{i} \in \mathbb{R}$

A set of vectors $U = \{\mathbf{u}_{1}, \dots, \mathbf{u}_{k}\}$ is independent if for every $i, \mathbf{u}_{i}$ is not in the span of ${\bf u}_{1}, \ldots,{\bf u}_{i - 1},{\bf u}_{i + 1}, \ldots,{\bf u}_{k}$ . We say that U spans a subspace V if V is the span of the vectors in U. We say that U is a basis of V if it is both independent and spans V. The dimension of V is the size of a basis of V (and it can be verified that all bases of V have the same size). We say that U is an orthogonal set if for all $i \neq j, \langle{\bf u}_{i},{\bf u}_{j} \rangle = 0$ . We say that U is an orthonormal set if it is orthogonal and if for every $i, \left\| \mathbf{u}_{i} \right\| = 1$

Given a matrix $A \in \mathbb{R}^{n, d}$ , the range of A is the span of its columns and the null space of A is the subspace of all vectors that satisfy Au = 0. The rank of A is the dimension of its range.

The transpose of a matrix A, denoted $A^{\top}$ , is the matrix whose $(i, j)$ entry equals the (j, i) entry of A. We say that A is symmetric if $A = A^{\top}$

## C.2 Eigenvalues and Eigenvectors

Let $A \in \mathbb{R}^{d, d}$ be a matrix. A non-zero vector u is an eigenvector of A with a corresponding eigenvalue λ if

$$
A \mathbf{u} = \lambda \mathbf{u}.
$$

<sup>theorem</sup> C.1 (Spectral Decomposition) If $A \in \mathbb{R}^{d, d}$ is a symmetric matrix of rank $k,$ , then there exists an orthonormal basis $of \mathbb{R}^{d}, \mathbf{u}_{1}, \dots, \mathbf{u}_{d}$ , such that each u is an eigenvector of A. Furthermore, A can be written as $\begin{array}{r}{A = \sum_{i = 1}^{d} \lambda_{i} \mathbf{u}_{i} \mathbf{u}_{i}^{\top}} \end{array}$ ， where each $\lambda_{i}$ is the eigenvalue corresponding to the eigenvector $\mathbf{u}_{i}$ . This can be written equivalently as $A = UDU^{\top}$ , where the columns of U are the vectors $\mathbf { u } _ { 1 } , \ldots , \mathbf { u } _ { d } $ , and D is a diagonal matrix with $D_{i, i} = \lambda_{i}$ and for $i \neq j, D_{i, j} =$ 0. Finally, the number of $\lambda_{i}$ which are nonzero is the rank of the matrix, the eigenvectors which correspond to the nonzero eigenvalues span the range of A, and the eigenvectors which correspond to zero eigenvalues span the null space of $A.$

## C.3 Positive definite matrices

A symmetric matrix $A \in \mathbb{R}^{d, d}$ is positive definite if all its eigenvalues are positive. A is positive semidefinite if all its eigenvalues are nonnegative.

theorem <sub>C.2 Let</sub> $A \in \mathbb{R}^{d, d}$ be a symmetric matrix. Then, the following are equivalent definitions of positive semidefiniteness of A:

- All the eigenvalues of A are nonnegative.

- For every vector u, $\langle{\bf u}, A{\bf u} \rangle \geq 0$

- There exists a matrix B such that $A = BB^{\intercal}$

## C.4 Singular Value Decomposition (SVD)

Let $A \in \mathbb{R}^{m, n}$ be a matrix of rank r. When m $\neq n,$ , the eigenvalue decomposition given in Theorem C.1 cannot be applied. We will describe another decomposition of A, which is called Singular Value Decomposition, or SVD for short.

Unit vectors $\mathbf{v} \in \mathbb{R}^{n}$ and $\mathbf{u} \in \mathbb{R}^{m}$ are called right and left singular vectors of A with corresponding singular value $\sigma > 0$ if

$$
A \mathbf{v} = \sigma \mathbf{u} \quad \mathrm{and} \quad A^{\top} \mathbf{u} = \sigma \mathbf{v}.
$$

We first show that if we can find r orthonormal singular vectors with positive singular values, then we can decompose $A = UDV^{\top}$ , with the columns of U and V containing the left and right singular vectors, and D being a diagonal $r \times r$ matrix with the singular values on its diagonal.

<sup>lemma</sup> C.3 Let $A \in \mathbb{R}^{m, n}$ be a matrix of rank r. Assume that $\mathbf{v}_{1}, \ldots, \mathbf{v}_{r}$ is an orthonormal set of right singular vectors of A, $\mathbf{u}_{1}, \ldots, \mathbf{u}_{r}$ is an orthonormal set of corresponding left singular vectors of A, and $\sigma_{1}, \ldots, \sigma_{r}$ are the corresponding singular values. Then,

$$
A = \sum_{i = 1}^{r} \sigma_{i} \mathbf{u}_{i} \mathbf{v}_{i}^{\top}.
$$

It follows that if U is a matrix whose columns are the $\mathbf{u}_{i} \mathit{s}, \mathit{V}$ is a matrix whose columns are the $\mathbf{v}_{i} \mathbf{\omega}_{s,}$ and D is a diagonal matrix with $D_{i, i} = \sigma_{i},$ then

$$
A = UDV^{\top}.
$$

Proof Any right singular vector of A must be in the range of $A^{\top}$ (otherwise, the singular value will have to be zero). Therefore, $\mathbf{v}_{1}, \ldots, \mathbf{v}_{r}$ is an orthonormal basis of the range of A. Let us complete it to an orthonormal basis of $\mathbb{R}^{n}$ by adding the vectors $\mathbf{v}_{r + 1}, \ldots, \mathbf{v}_{n}$ . Define $\begin{array}{r}{B = \sum_{i = 1}^{r} \sigma_{i} \mathbf{u}_{i} \mathbf{v}_{i}^{\top}} \end{array}$ . It sufices to prove that for all $i, A \mathbf{v}_{i} = B \mathbf{v}_{i}$ . Clearly, if $i > r$ then $A{\bf v}_{i} = 0$ and $B{\mathbf{v}}_{i} = 0$ as well. For $i \leq r$ we have

$$
B \mathbf{v}_{i} = \sum_{j = 1}^{r} \sigma_{j} \mathbf{u}_{j} \mathbf{v}_{j}^{\top} \mathbf{v}_{i} = \sigma_{i} \mathbf{u}_{i} = A \mathbf{v}_{i},
$$

where the last equality follows from the definition.

The next lemma relates the singular values of A to the eigenvalues of $A^{\top} A$ and $AA^{\top}$

<sup>lemma</sup> C.4 v, u are right and left singular vectors of A with singular value σ $if \mathbf{v}$ is an eigenvector of $A^{\top} A$ with corresponding eigenvalue $\sigma^{2}$ and $\mathbf{u} = \sigma^{- 1} A \mathbf{\bar{v}}$ is an eigenvector of $AA^{\top}$ with corresponding eigenvalue $\sigma^{2}$

Proof Suppose that σ is a singular value of A with $\mathbf{v} \in \mathbb{R}^{n}$ being the corresponding right singular vector. Then,

$$
A^{\top} A \mathbf{v} = \sigma A^{\top} \mathbf{u} = \sigma^{2} \mathbf{v}.
$$

Similarly,

$$
AA^{\top} u = \sigma A \mathbf{v} = \sigma^{2} \mathbf{u}.
$$

For the other direction, if $\lambda \neq 0$ is an eigenvalue of $A^{\top} A$ , with v being the corresponding eigenvector, then $\lambda > 0$ because $A^{\top} A$ is positive semidefinite. Let $\sigma = \sqrt{\lambda}, \mathbf{u} = \sigma^{- 1} A \mathbf{v}$ . Then,

$$
\sigma \mathbf{u} = \sqrt{\lambda} \frac{A \mathbf{v}}{\sqrt{\lambda}} = A \mathbf{v},
$$

and

$$
A^{\top} \mathbf{u} = \frac{1}{\sigma} A^{\top} A \mathbf{v} = \frac{\lambda}{\sigma} \mathbf{v} = \sigma \mathbf{v}.
$$

Finally, we show that if A has rank r then it has $r$ orthonormal singular vectors.

<sup>lemma</sup> C.5 Let $A \in \mathbb{R}^{m, n}$ with rank r. Define the following vectors:

$$
\mathbf{v}_{1} = \underset{\mathbf{v} \in \mathbb{R}^{n}: \| \mathbf{v} \| = 1}{\operatorname{argmax}} \| A \mathbf{v} \|
$$

$$
\mathbf{v}_{2} = \operatorname{argmax}_{\substack{\mathbf{v}\in \mathbb{R}^{n}:\| \mathbf{v}\| = 1\\ \langle \mathbf{v},\mathbf{v}_{1}\rangle = 0}}\| A\mathbf{v}\|
$$

$$
\mathbf{v}_{r} = \operatorname{argmax}_{\substack{\mathbf{v}\in \mathbb{R}^{n}:\| \mathbf{v}\| = 1\\ \forall i < r, \langle \mathbf{v},\mathbf{v}_{i}\rangle = 0}} \| A\mathbf{v}\|
$$

Then, $\mathbf{v}_{1}, \ldots, \mathbf{v}_{r}$ is an orthonormal set of right singular vectors of A.

Proof First note that since the rank of A is $r,$ the range of A is a subspace of dimension $r,$ and therefore it is easy to verify that for all $i = 1, \dots, r, \| A \mathbf{v}_{i} \| > 0$ Let $W \in \mathbb{R}^{n, n}$ be an orthonormal matrix obtained by the eigenvalue decomposition of $A^{\top} A$ , namely, $A^{\top} A = WDW^{\top}$ , with D being a diagonal matrix with $D_{1, 1} \geq D_{2, 2} \geq \cdots \geq 0$ . We will show that $\mathbf{v}_{1}, \ldots, \mathbf{v}_{r}$ are eigenvectors of $A^{\top} A$ that correspond to nonzero eigenvalues, and, hence, using Lemma C.4 it follows that these are also right singular vectors of A. The proof is by induction. For the basis of the induction, note that any unit vector v can be written as $\mathbf{v} = W \mathbf{x}$ for $\mathbf{x} = W^{\top} \mathbf{v}.$ , and note that $\| \mathbf{x} \| = 1$ . Therefore,

$$
\| A \mathbf{v} \|^{2} = \| AW \mathbf{x} \|^{2} = \| WDW^{\top} W \mathbf{x} \|^{2} = \| WD \mathbf{x} \|^{2} = \| D \mathbf{x} \|^{2} = \sum_{i = 1}^{n} D_{i, i}^{2} x_{i}^{2}.
$$

Therefore,

$$
\max_{\mathbf{v}: \| \mathbf{v} \| = 1} \| A \mathbf{v} \|^{2} = \max_{\mathbf{x}: \| \mathbf{x} \| = 1} \sum_{i = 1}^{n} D_{i, i}^{2} x_{i}^{2}.
$$

The solution of the right-hand side is to set $\mathbf{x} =(1, 0, \ldots, 0)$ , which implies that $\mathbf{v}_{1}$ is the first eigenvector of $A^{\top} A$ . Since $\| A \mathbf{v}_{1} \| > 0$ it follows that $D_{1, 1} > 0$ as required. For the induction step, assume that the claim holds for some $1 \leq t \leq$ $r - 1$ . Then, any v which is orthogonal to $\mathbf{v}_{1}, \ldots, \mathbf{v}_{t}$ can be written as $\mathbf{v} = W \mathbf{x}$ with all the first t elements of x being zero. It follows that

$$
\max_{\mathbf{v}: \| \mathbf{v} \| = 1, \forall i \leq t, \mathbf{v}^{\top} \mathbf{v}_{i} = 0} \| A \mathbf{v} \|^{2} = \max_{\mathbf{x}: \| \mathbf{x} \| = 1} \sum_{i = t + 1}^{n} D_{i, i}^{2} x_{i}^{2}.
$$

The solution of the right-hand side is the all zeros vector except $x_{t + 1} = 1$ . This implies that $\mathbf{v}_{t + 1}$ is the $(t + 1) \mathrm{th}$ column of W . Finally, since $\| A \mathbf{v}_{t + 1} \| > 0$ it follows that $D_{t + 1, t + 1} > 0$ as required. This concludes our proof. □ <sup>corollary</sup> C.6 (The SVD theorem) Let $A \in \mathbb{R}^{m, n}$ with rank $r.$ Then $A =$ $UDV^{\top}$ where D is an $r \times r$ matrix with nonzero singular values of A and the columns of $U, V$ are orthonormal left and right singular vectors of A. Furthermore, for all i, $D_{i, i}^{2}$ is an eigenvalue of $A^{\top} A$ , the ith column of V is the corresponding eigenvector of $A^{\top} A$ and the ith column of U is the corresponding eigenvector of $AA^{\top}$

Abernethy, J., Bartlett, P. L., Rakhlin, A. & Tewari, A. (2008), Optimal strategies and minimax lower bounds for online convex games, in ‘Proceedings of the Nineteenth Annual Conference on Computational Learning Theory’.

Ackerman, M. & Ben-David, S. (2008), Measures of clustering quality: A working set of axioms for clustering, in ‘Proceedings of Neural Information Processing Systems (NIPS)’, pp. 121–128.

Agarwal, S. & Roth, D. (2005), Learnability of bipartite ranking functions, in ‘Proceedings of the 18th Annual Conference on Learning Theory’, pp. 16–31.

Agmon, S. (1954), ‘The relaxation method for linear inequalities’, Canadian Journal of Mathematics 6(3), 382–392.

Aizerman, M. A., Braverman, E. M. & Rozonoer, L. I. (1964), ‘Theoretical foundations of the potential function method in pattern recognition learning’, Automation and Remote Control 25, 821–837.

Allwein, E. L., Schapire, R. & Singer, Y. (2000), ‘Reducing multiclass to binary: A unifying approach for margin classifiers’, Journal of Machine Learning Research 1, 113– 141.

Alon, N., Ben-David, S., Cesa-Bianchi, N. & Haussler, D. (1997), ‘Scale-sensitive dimensions, uniform convergence, and learnability’, Journal of the ACM 44(4), 615–631.

Anthony, M. & Bartlet, P. (1999), Neural Network Learning: Theoretical Foundations, Cambridge University Press.

Baraniuk, R., Davenport, M., DeVore, R. & Wakin, M. (2008), ‘A simple proof of the restricted isometry property for random matrices’, Constructive Approximation 28(3), 253–263.

Barber, D. (2012), Bayesian reasoning and machine learning, Cambridge University Press.

Bartlett, P., Bousquet, O. & Mendelson, S. (2005), ‘Local rademacher complexities’, Annals of Statistics 33(4), 1497–1537.

Bartlett, P. L. & Ben-David, S. (2002), ‘Hardness results for neural network approximation problems’, Theor. Comput. Sci. 284(1), 53–66.

Bartlett, P. L., Long, P. M. & Williamson, R. C. (1994), Fat-shattering and the learnability of real-valued functions, in ‘Proceedings of the seventh annual conference on Computational learning theory’, ACM, pp. 299–310.

Bartlett, P. L. & Mendelson, S. (2001), Rademacher and Gaussian complexities: Risk bounds and structural results, in ‘14th Annual Conference on Computational Learning Theory, COLT 2001’, Vol. 2111, Springer, Berlin, pp. 224–240.

Bartlett, P. L. & Mendelson, S. (2002), ‘Rademacher and Gaussian complexities: Risk bounds and structural results’, Journal of Machine Learning Research 3, 463–482.

Ben-David, S., Cesa-Bianchi, N., Haussler, D. & Long, P. (1995), ‘Characterizations of learnability for classes of {0, . . . , n}-valued functions’, Journal of Computer and System Sciences 50, 74–86.

Ben-David, S., Eiron, N. & Long, P. (2003), ‘On the dificulty of approximately maximizing agreements’, Journal of Computer and System Sciences 66(3), 496–514.

Ben-David, S. & Litman, A. (1998), ‘Combinatorial variability of vapnik-chervonenkis classes with applications to sample compression schemes’, Discrete Applied Mathematics 86(1), 3–25.

Ben-David, S., Pal, D., & Shalev-Shwartz, S. (2009), Agnostic online learning, in ‘Conference on Learning Theory (COLT)’.

Ben-David, S. & Simon, H. (2001), ‘efficient learning of linear perceptrons’, Advances in Neural Information Processing Systems pp. 189–195.

Bengio, Y. (2009), ‘Learning deep architectures for AI’, Foundations and Trends in Machine Learning 2(1), 1–127.

Bengio, Y. & LeCun, Y. (2007), ‘Scaling learning algorithms towards ai’, Large-Scale Kernel Machines 34.

Bertsekas, D. (1999), Nonlinear Programming, Athena Scientific.

Beygelzimer, A., Langford, J. & Ravikumar, P. (2007), ‘Multiclass classification with filter trees’, Preprint, June .

Birkhof, G. (1946), ‘Three observations on linear algebra’, Revi. Univ. Nac. Tucuman, ser A 5, 147–151.

Bishop, C. M. (2006), Pattern recognition and machine learning, Vol. 1, springer New York.

Blum, L., Shub, M. & Smale, S. (1989), ‘On a theory of computation and complexity over the real numbers: Np-completeness, recursive functions and universal machines’, Am. Math. Soc 21(1), 1–46.

Blumer, A., Ehrenfeucht, A., Haussler, D. & Warmuth, M. K. (1987), ‘Occam’s razor’, Information Processing Letters 24(6), 377–380.

Blumer, A., Ehrenfeucht, A., Haussler, D. & Warmuth, M. K. (1989), ‘Learnability and the Vapnik-Chervonenkis dimension’, Journal of the Association for Computing Machinery 36(4), 929–965.

Borwein, J. & Lewis, A. (2006), Convex Analysis and Nonlinear Optimization, Springer.

Boser, B. E., Guyon, I. M. & Vapnik, V. N. (1992), A training algorithm for optimal margin classifiers, in ‘Conference on Learning Theory (COLT)’, pp. 144–152.

Bottou, L. & Bousquet, O. (2008), The tradeofs of large scale learning, in ‘NIPS’, pp. 161–168.

Boucheron, S., Bousquet, O. & Lugosi, G. (2005), ‘Theory of classification: a survey of recent advances’, ESAIM: Probability and Statistics 9, 323–375.

Bousquet, O. (2002), Concentration Inequalities and Empirical Processes Theory Applied to the Analysis of Learning Algorithms, PhD thesis, Ecole Polytechnique.

Bousquet, O. & Elisseef, A. (2002), ‘Stability and generalization’, Journal of Machine Learning Research 2, 499–526.

Boyd, S. & Vandenberghe, L. (2004), Convex Optimization, Cambridge University Press.

Breiman, L. (1996), Bias, variance, and arcing classifiers, Technical Report 460, Statistics Department, University of California at Berkeley.

Breiman, L. (2001), ‘Random forests’, Machine learning 45(1), 5–32.

Breiman, L., Friedman, J. H., Olshen, R. A. & Stone, C. J. (1984), Classification and Regression Trees, Wadsworth & Brooks.

Cand\`es, E. (2008), ‘The restricted isometry property and its implications for compressed sensing’, Comptes Rendus Mathematique 346(9), 589–592.

Candes, E. J. (2006), Compressive sampling, in ‘Proc. of the Int. Congress of Math., Madrid, Spain’.

Candes, E. & Tao, T. (2005), ‘Decoding by linear programming’, IEEE Trans. on Information Theory 51, 4203–4215.

Cesa-Bianchi, N. & Lugosi, G. (2006), Prediction, learning, and games, Cambridge University Press.

Chang, H. S., Weiss, Y. & Freeman, W. T. (2009), ‘Informative sensing’, arXiv preprint arXiv:0901.4275 .

Chapelle, O., Le, Q. & Smola, A. (2007), Large margin optimization of ranking measures, in ‘NIPS Workshop: Machine Learning for Web Search’.

Collins, M. (2000), Discriminative reranking for natural language parsing, in ‘Machine Learning’.

Collins, M. (2002), Discriminative training methods for hidden Markov models: Theory and experiments with perceptron algorithms, in ‘Conference on Empirical Methods in Natural Language Processing’.

Collobert, R. & Weston, J. (2008), A unified architecture for natural language processing: deep neural networks with multitask learning, in ‘International Conference on Machine Learning (ICML)’.

Cortes, C. & Vapnik, V. (1995), ‘Support-vector networks’, Machine Learning 20(3), 273–297.

Cover, T. (1965), ‘Behavior of sequential predictors of binary sequences’, Trans. 4th Prague Conf. Information Theory Statistical Decision Functions, Random Processes pp. 263–272.

Cover, T. & Hart, P. (1967), ‘Nearest neighbor pattern classification’, Information Theory, IEEE Transactions on 13(1), 21–27.

Crammer, K. & Singer, Y. (2001), ‘On the algorithmic implementation of multiclass kernel-based vector machines’, Journal of Machine Learning Research 2, 265–292.

Cristianini, N. & Shawe-Taylor, J. (2000), An Introduction to Support Vector Machines, Cambridge University Press.

Daniely, A., Sabato, S., Ben-David, S. & Shalev-Shwartz, S. (2011), Multiclass learnability and the erm principle, in ‘Conference on Learning Theory (COLT)’.

Daniely, A., Sabato, S. & Shwartz, S. S. (2012), Multiclass learning approaches: A theoretical comparison with implications, in ‘NIPS’.

Davis, G., Mallat, S. & Avellaneda, M. (1997), ‘Greedy adaptive approximation’, Journal of Constructive Approximation 13, 57–98.

Devroye, L. & Gy¨orfi, L. (1985), Nonparametric Density Estimation: The L B1 S View, Wiley.

Devroye, L., Gy¨orfi, L. & Lugosi, G. (1996), A Probabilistic Theory of Pattern Recognition, Springer.

Dietterich, T. G. & Bakiri, G. (1995), ‘Solving multiclass learning problems via errorcorrecting output codes’, Journal of Artificial Intelligence Research 2, 263–286.

Donoho, D. L. (2006), ‘Compressed sensing’, Information Theory, IEEE Transactions on 52(4), 1289–1306.

Dudley, R., Gine, E. & Zinn, J. (1991), ‘Uniform and universal glivenko-cantelli classes’, Journal of Theoretical Probability 4(3), 485–510.

Dudley, R. M. (1987), ‘Universal Donsker classes and metric entropy’, Annals of Probability 15(4), 1306–1326.

Fisher, R. A. (1922), ‘On the mathematical foundations of theoretical statistics’, Philosophical Transactions of the Royal Society of London. Series A, Containing Papers of a Mathematical or Physical Character 222, 309–368.

Floyd, S. (1989), Space-bounded learning and the Vapnik-Chervonenkis dimension, in ‘Conference on Learning Theory (COLT)’, pp. 349–364.

Floyd, S. & Warmuth, M. (1995), ‘Sample compression, learnability, and the Vapnik-Chervonenkis dimension’, Machine Learning 21(3), 269–304.

Frank, M. & Wolfe, P. (1956), ‘An algorithm for quadratic programming’, Naval Res. Logist. Quart. 3, 95–110.

Freund, Y. & Schapire, R. (1995), A decision-theoretic generalization of on-line learning and an application to boosting, in ‘European Conference on Computational Learning Theory (EuroCOLT)’, Springer-Verlag, pp. 23–37.

Freund, Y. & Schapire, R. E. (1999), ‘Large margin classification using the perceptron algorithm’, Machine Learning 37(3), 277–296.

Garcia, J. & Koelling, R. (1996), ‘Relation of cue to consequence in avoidance learning’, Foundations of animal behavior: classic papers with commentaries 4, 374.

Gentile, C. (2003), ‘The robustness of the p-norm algorithms’, Machine Learning 53(3), 265–299.

Georghiades, A., Belhumeur, P. & Kriegman, D. (2001), ‘From few to many: Illumination cone models for face recognition under variable lighting and pose’, IEEE Trans. Pattern Anal. Mach. Intelligence 23(6), 643–660.

Gordon, G. (1999), Regret bounds for prediction problems, in ‘Conference on Learning Theory (COLT)’.

Gottlieb, L.-A., Kontorovich, L. & Krauthgamer, R. (2010), efficient classification for metric data, in ‘23rd Conference on Learning Theory’, pp. 433–440.

Guyon, I. & Elisseef, A. (2003), ‘An introduction to variable and feature selection’, Journal of Machine Learning Research, Special Issue on Variable and Feature Selection 3, 1157–1182.

Hadamard, J. (1902), ‘Sur les probl\`emes aux d´eriv´ees partielles et leur signification physique’, Princeton University Bulletin 13, 49–52.

Hastie, T., Tibshirani, R. & Friedman, J. (2001), The Elements of Statistical Learning, Springer.

Haussler, D. (1992), ‘Decision theoretic generalizations of the PAC model for neural net and other learning applications’, Information and Computation 100(1), 78–150.

Haussler, D. & Long, P. M. (1995), ‘A generalization of sauer’s lemma’, Journal of Combinatorial Theory, Series A 71(2), 219–240.

Hazan, E., Agarwal, A. & Kale, S. (2007), ‘Logarithmic regret algorithms for online convex optimization’, Machine Learning 69(2–3), 169–192.

Hinton, G. E., Osindero, S. & Teh, Y.-W. (2006), ‘A fast learning algorithm for deep belief nets’, Neural Computation 18(7), 1527–1554.

Hiriart-Urruty, J.-B. & Lemar´echal, C. (1996), Convex Analysis and Minimization Algorithms: Part 1: Fundamentals, Vol. 1, Springer.

Hsu, C.-W., Chang, C.-C. & Lin, C.-J. (2003), ‘A practical guide to support vector classification’.

Hyafil, L. & Rivest, R. L. (1976), ‘Constructing optimal binary decision trees is NPcomplete’, Information Processing Letters 5(1), 15–17.

Joachims, T. (2005), A support vector method for multivariate performance measures, in ‘Proceedings of the International Conference on Machine Learning (ICML)’.

Kakade, S., Sridharan, K. & Tewari, A. (2008), On the complexity of linear prediction: Risk bounds, margin bounds, and regularization, in ‘NIPS’.

Karp, R. M. (1972), Reducibility among combinatorial problems, Springer.

Kearns, M. J., Schapire, R. E. & Sellie, L. M. (1994), ‘Toward efficient agnostic learning’, Machine Learning 17, 115–141.

Kearns, M. & Mansour, Y. (1996), On the boosting ability of top-down decision tree learning algorithms, in ‘ACM Symposium on the Theory of Computing (STOC)’.

Kearns, M. & Ron, D. (1999), ‘Algorithmic stability and sanity-check bounds for leaveone-out cross-validation’, Neural Computation 11(6), 1427–1453.

Kearns, M. & Valiant, L. G. (1988), Learning Boolean formulae or finite automata is as hard as factoring, Technical Report TR-14-88, Harvard University Aiken Computation Laboratory.

Kearns, M. & Vazirani, U. (1994), An Introduction to Computational Learning Theory, MIT Press.

Kleinberg, J. (2003), ‘An impossibility theorem for clustering’, Advances in Neural Information Processing Systems pp. 463–470.

Klivans, A. R. & Sherstov, A. A. (2006), Cryptographic hardness for learning intersections of halfspaces, in ‘FOCS’.

Koller, D. & Friedman, N. (2009), Probabilistic Graphical Models: Principles and Techniques, MIT Press.

Koltchinskii, V. & Panchenko, D. (2000), Rademacher processes and bounding the risk of function learning, in ‘High Dimensional Probability II’, Springer, pp. 443–457.

Kuhn, H. W. (1955), ‘The hungarian method for the assignment problem’, Naval research logistics quarterly 2(1-2), 83–97.

Kutin, S. & Niyogi, P. (2002), Almost-everywhere algorithmic stability and generalization error, in ‘Proceedings of the 18th Conference in Uncertainty in Artificia Intelligence’, pp. 275–282.

Laferty, J., McCallum, A. & Pereira, F. (2001), Conditional random fields: Probabilistic models for segmenting and labeling sequence data, in ‘International Conference on Machine Learning’, pp. 282–289.

Langford, J. (2006), ‘Tutorial on practical prediction theory for classification’, Journal of machine learning research 6(1), 273.

Langford, J. & Shawe-Taylor, J. (2003), PAC-Bayes & margins, in ‘NIPS’, pp. 423–430.

Le Cun, L. (2004), Large scale online learning., in ‘Advances in Neural Information Processing Systems 16: Proceedings of the 2003 Conference’, Vol. 16, MIT Press, p. 217.

Le, Q. V., Ranzato, M.-A., Monga, R., Devin, M., Corrado, G., Chen, K., Dean, J. & Ng, A. Y. (2012), Building high-level features using large scale unsupervised learning, in ‘International Conference on Machine Learning (ICML)’.

Lecun, Y. & Bengio, Y. (1995), Convolutional Networks for Images, Speech and Time Series, The MIT Press, pp. 255–258.

Lee, H., Grosse, R., Ranganath, R. & Ng, A. (2009), Convolutional deep belief networks for scalable unsupervised learning of hierarchical representations, in ‘International Conference on Machine Learning (ICML)’.

Littlestone, N. (1988), ‘Learning quickly when irrelevant attributes abound: A new linear-threshold algorithm’, Machine Learning 2, 285–318.

Littlestone, N. & Warmuth, M. (1986), Relating data compression and learnability. Unpublished manuscript.

Littlestone, N. & Warmuth, M. K. (1994), ‘The weighted majority algorithm’, Information and Computation 108, 212–261.

Livni, R., Shalev-Shwartz, S. & Shamir, O. (2013), ‘A provably efficient algorithm for training deep networks’, arXiv preprint arXiv:1304.7045 .

Livni, R. & Simon, P. (2013), Honest compressions and their application to compression schemes, in ‘Conference on Learning Theory (COLT)’.

MacKay, D. J. (2003), Information theory, inference and learning algorithms, Cambridge university press.

Mallat, S. & Zhang, Z. (1993), ‘Matching pursuits with time-frequency dictionaries’, IEEE Transactions on Signal Processing 41, 3397–3415.

McAllester, D. A. (1998), Some PAC-Bayesian theorems, in ‘Conference on Learning Theory (COLT)’.

McAllester, D. A. (1999), PAC-Bayesian model averaging, in ‘Conference on Learning Theory (COLT)’, pp. 164–170.

McAllester, D. A. (2003), Simplified PAC-Bayesian margin bounds., in ‘Conference on Learning Theory (COLT)’, pp. 203–215.

Minsky, M. & Papert, S. (1969), Perceptrons: An Introduction to Computational Geometry, The MIT Press.

Mukherjee, S., Niyogi, P., Poggio, T. & Rifkin, R. (2006), ‘Learning theory: stability is sufficient for generalization and necessary and sufficient for consistency of empirical risk minimization’, Advances in Computational Mathematics 25(1-3), 161–193.

Murata, N. (1998), ‘A statistical study of on-line learning’, Online Learning and Neural Networks. Cambridge University Press, Cambridge, UK .

Murphy, K. P. (2012), Machine learning: a probabilistic perspective, The MIT Press.

Natarajan, B. (1995), ‘Sparse approximate solutions to linear systems’, SIAM J. Computing 25(2), 227–234.

Natarajan, B. K. (1989), ‘On learning sets and functions’, Mach. Learn. 4, 67–97.

Nemirovski, A., Juditsky, A., Lan, G. & Shapiro, A. (2009), ‘Robust stochastic approximation approach to stochastic programming’, SIAM Journal on Optimization 19(4), 1574–1609.

Nemirovski, A. & Yudin, D. (1978), Problem complexity and method eficiency in optimization, Nauka Publishers, Moscow.

Nesterov, Y. (2005), Primal-dual subgradient methods for convex problems, Technical report, Center for Operations Research and Econometrics (CORE), Catholic University of Louvain (UCL).

Nesterov, Y. & Nesterov, I. (2004), Introductory lectures on convex optimization: A basic course, Vol. 87, Springer Netherlands.

Novikof, A. B. J. (1962), On convergence proofs on perceptrons, in ‘Proceedings of the Symposium on the Mathematical Theory of Automata’, Vol. XII, pp. 615–622.

Parberry, I. (1994), Circuit complexity and neural networks, The MIT press.

Pearson, K. (1901), ‘On lines and planes of closest fit to systems of points in space’, The London, Edinburgh, and Dublin Philosophical Magazine and Journal of Science 2(11), 559–572.

Phillips, D. L. (1962), ‘A technique for the numerical solution of certain integral equations of the first kind’, Journal of the ACM 9(1), 84–97.

Pisier, G. (1980-1981), ‘Remarques sur un r´esultat non publi´e de B. maurey’.

Pitt, L. & Valiant, L. (1988), ‘Computational limitations on learning from examples’, Journal of the Association for Computing Machinery 35(4), 965–984.

Poon, H. & Domingos, P. (2011), Sum-product networks: A new deep architecture, in ‘Conference on Uncertainty in Artificial Intelligence (UAI)’.

Quinlan, J. R. (1986), ‘Induction of decision trees’, Machine Learning 1, 81–106.

Quinlan, J. R. (1993), C4.5: Programs for Machine Learning, Morgan Kaufmann.

Rabiner, L. & Juang, B. (1986), ‘An introduction to hidden markov models’, IEEE ASSP Magazine 3(1), 4–16.

Rakhlin, A., Shamir, O. & Sridharan, K. (2012), Making gradient descent optimal for strongly convex stochastic optimization, in ‘International Conference on Machine Learning (ICML)’.

Rakhlin, A., Sridharan, K. & Tewari, A. (2010), Online learning: Random averages, combinatorial parameters, and learnability, in ‘NIPS’.

Rakhlin, S., Mukherjee, S. & Poggio, T. (2005), ‘Stability results in learning theory’, Analysis and Applications 3(4), 397–419.

Ranzato, M., Huang, F., Boureau, Y. & Lecun, Y. (2007), Unsupervised learning of invariant feature hierarchies with applications to object recognition, in ‘Computer Vision and Pattern Recognition, 2007. CVPR’07. IEEE Conference on’, IEEE, pp. 1– 8.

Rissanen, J. (1978), ‘Modeling by shortest data description’, Automatica 14, 465–471.

Rissanen, J. (1983), ‘A universal prior for integers and estimation by minimum description length’, The Annals of Statistics 11(2), 416–431.

Robbins, H. & Monro, S. (1951), ‘A stochastic approximation method’, The Annals of Mathematical Statistics pp. 400–407.

Rogers, W. & Wagner, T. (1978), ‘A finite sample distribution-free performance bound for local discrimination rules’, The Annals of Statistics 6(3), 506–514.

Rokach, L. (2007), Data mining with decision trees: theory and applications, Vol. 69, World scientific.

Rosenblatt, F. (1958), ‘The perceptron: A probabilistic model for information storage and organization in the brain’, Psychological Review 65, 386–407. (Reprinted in Neurocomputing (MIT Press, 1988).).

Rumelhart, D. E., Hinton, G. E. & Williams, R. J. (1986), Learning internal representations by error propagation, in D. E. Rumelhart & J. L. McClelland, eds, ‘Parallel Distributed Processing – Explorations in the Microstructure of Cognition’, MIT Press, chapter 8, pp. 318–362.

Sankaran, J. K. (1993), ‘A note on resolving infeasibility in linear programs by constraint relaxation’, Operations Research Letters 13(1), 19–20.

Sauer, N. (1972), ‘On the density of families of sets’, Journal of Combinatorial Theory Series A 13, 145–147.

Schapire, R. (1990), ‘The strength of weak learnability’, Machine Learning 5(2), 197– 227.

Schapire, R. E. & Freund, Y. (2012), Boosting: Foundations and Algorithms, MIT press.

Sch¨olkopf, B., Herbrich, R. & Smola, A. (2001), A generalized representer theorem, in ‘Computational learning theory’, pp. 416–426.

Sch¨olkopf, B., Herbrich, R., Smola, A. & Williamson, R. (2000), A generalized representer theorem, in ‘NeuroCOLT’.

Sch¨olkopf, B. & Smola, A. J. (2002), Learning with Kernels: Support Vector Machines, Regularization, Optimization and Beyond, MIT Press.

Sch¨olkopf, B., Smola, A. & M¨uller, K.-R. (1998), ‘Nonlinear component analysis as a kernel eigenvalue problem’, Neural computation 10(5), 1299–1319.

Seeger, M. (2003), ‘Pac-bayesian generalisation error bounds for gaussian process classification’, The Journal of Machine Learning Research 3, 233–269.

Shakhnarovich, G., Darrell, T. & Indyk, P. (2006), Nearest-neighbor methods in learning and vision: theory and practice, MIT Press.

Shalev-Shwartz, S. (2007), Online Learning: Theory, Algorithms, and Applications, PhD thesis, The Hebrew University.

Shalev-Shwartz, S. (2011), ‘Online learning and online convex optimization’, Foundations and Trends R in Machine Learning 4(2), 107–194.

Shalev-Shwartz, S., Shamir, O., Srebro, N. & Sridharan, K. (2010), ‘Learnability, stability and uniform convergence’, The Journal of Machine Learning Research 9999, 2635–2670.

Shalev-Shwartz, S., Shamir, O. & Sridharan, K. (2010), Learning kernel-based halfspaces with the zero-one loss, in ‘Conference on Learning Theory (COLT)’.

Shalev-Shwartz, S., Shamir, O., Sridharan, K. & Srebro, N. (2009), Stochastic convex optimization, in ‘Conference on Learning Theory (COLT)’.

Shalev-Shwartz, S. & Singer, Y. (2008), On the equivalence of weak learnability and linear separability: New relaxations and efficient boosting algorithms, in ‘Proceedings of the Nineteenth Annual Conference on Computational Learning Theory’.

Shalev-Shwartz, S., Singer, Y. & Srebro, N. (2007), Pegasos: Primal Estimated sub-GrAdient SOlver for SVM, in ‘International Conference on Machine Learning’, pp. 807–814.

Shalev-Shwartz, S. & Srebro, N. (2008), SVM optimization: Inverse dependence on training set size, in ‘International Conference on Machine Learning’, pp. 928–935.

Shalev-Shwartz, S., Zhang, T. & Srebro, N. (2010), ‘Trading accuracy for sparsity in optimization problems with sparsity constraints’, Siam Journal on Optimization 20, 2807–2832.

Shamir, O. & Zhang, T. (2013), Stochastic gradient descent for non-smooth optimization: Convergence results and optimal averaging schemes, in ‘International Conference on Machine Learning (ICML)’.

Shapiro, A., Dentcheva, D. & Ruszczy´nski, A. (2009), Lectures on stochastic programming: modeling and theory, Vol. 9, Society for Industrial and Applied Mathematics.

Shelah, S. (1972), ‘A combinatorial problem; stability and order for models and theories in infinitary languages’, Pac. J. Math 4, 247–261.

Sipser, M. (2006), Introduction to the Theory of Computation, Thomson Course Technology.

Slud, E. V. (1977), ‘Distribution inequalities for the binomial law’, The Annals of Probability 5(3), 404–412.

Steinwart, I. & Christmann, A. (2008), Support vector machines, Springerverlag New York.

Stone, C. (1977), ‘Consistent nonparametric regression’, The annals of statistics 5(4), 595–620.

Taskar, B., Guestrin, C. & Koller, D. (2003), Max-margin markov networks, in ‘NIPS’.

Tibshirani, R. (1996), ‘Regression shrinkage and selection via the lasso’, J. Royal. Statist. Soc B. 58(1), 267–288.

Tikhonov, A. N. (1943), ‘On the stability of inverse problems’, Dolk. Akad. Nauk SSSR 39(5), 195–198.

Tishby, N., Pereira, F. & Bialek, W. (1999), The information bottleneck method, in ‘The 37’th Allerton Conference on Communication, Control, and Computing’.

Tsochantaridis, I., Hofmann, T., Joachims, T. & Altun, Y. (2004), Support vector machine learning for interdependent and structured output spaces, in ‘Proceedings of the Twenty-First International Conference on Machine Learning’.

Valiant, L. G. (1984), ‘A theory of the learnable’, Communications of the ACM 27(11), 1134–1142.

Vapnik, V. (1992), Principles of risk minimization for learning theory, in J. E. Moody, S. J. Hanson & R. P. Lippmann, eds, ‘Advances in Neural Information Processing Systems 4’, Morgan Kaufmann, pp. 831–838.

Vapnik, V. (1995), The Nature of Statistical Learning Theory, Springer.

Vapnik, V. N. (1982), Estimation of Dependences Based on Empirical Data, Springer-Verlag.

Vapnik, V. N. (1998), Statistical Learning Theory, Wiley.

Vapnik, V. N. & Chervonenkis, A. Y. (1971), ‘On the uniform convergence of relative frequencies of events to their probabilities’, Theory of Probability and its applications XVI(2), 264–280.

Vapnik, V. N. & Chervonenkis, A. Y. (1974), Theory of pattern recognition, Nauka, Moscow. (In Russian).

Von Luxburg, U. (2007), ‘A tutorial on spectral clustering’, Statistics and computing 17(4), 395–416.

von Neumann, J. (1928), ‘Zur theorie der gesellschaftsspiele (on the theory of parlor games)’, Math. Ann. 100, 295—320.

Von Neumann, J. (1953), ‘A certain zero-sum two-person game equivalent to the optimal assignment problem’, Contributions to the Theory of Games 2, 5–12.

Vovk, V. G. (1990), Aggregating strategies, in ‘Conference on Learning Theory (COLT)’, pp. 371–383.

Warmuth, M., Glocer, K. & Vishwanathan, S. (2008), Entropy regularized lpboost, in ‘Algorithmic Learning Theory (ALT)’.

Warmuth, M., Liao, J. & Ratsch, G. (2006), Totally corrective boosting algorithms that maximize the margin, in ‘Proceedings of the 23rd international conference on Machine learning’.

Weston, J., Chapelle, O., Vapnik, V., Elisseef, A. & Sch¨olkopf, B. (2002), Kernel dependency estimation, in ‘Advances in neural information processing systems’, pp. 873– 880.

Weston, J. & Watkins, C. (1999), Support vector machines for multi-class pattern recognition, in ‘Proceedings of the Seventh European Symposium on Artificial Neural Networks’.

Wolpert, D. H. & Macready, W. G. (1997), ‘No free lunch theorems for optimization’, Evolutionary Computation, IEEE Transactions on 1(1), 67–82.

Zhang, T. (2004), Solving large scale linear prediction problems using stochastic gradient descent algorithms, in ‘Proceedings of the Twenty-First International Conference on Machine Learning’.

Zhao, P. & Yu, B. (2006), ‘On model selection consistency of Lasso’, Journal of Machine Learning Research 7, 2541–2567.

Zinkevich, M. (2003), Online convex programming and generalized infinitesimal gradient ascent, in ‘International Conference on Machine Learning’.

## Index

3-term DNF, 107 F -score, 244 \` norm, 183, 332, 363, 386 accuracy, 38, 43 activation function, 269 AdaBoost, 130, 134, 362 all-pairs, 228, 404 approximation error, 61, 64 auto-encoders, 368 backpropagation, 278 backward elimination, 363 bag-of-words, 209 base hypothesis, 137 Bayes optimal, 46, 52, 260 Bayes rule, 354 Bayesian reasoning, 353 Bennet’s inequality, 426 Bernstein’s inequality, 426 bias, 37, 61, 64 bias-complexity tradeof, 65 boolean conjunctions, 51, 79, 106 boosting, 130 boosting the confidence, 142 boundedness, 165 C4.5, 254 CART, 254 chaining, 389 Chebyshev’s inequality, 423 Chernof bounds, 423 class-sensitive feature mapping, 230 classifier, 34 clustering, 307 spectral, 315 compressed sensing, 330 compression bounds, 410 compression scheme, 411 computational complexity, 100 confidence, 38, 43 consistency, 92 Consistent, 289 contraction lemma, 381 convex, 156 function, 157

set, 156 strongly convex, 174, 195 convex-Lipschitz-bounded learning, 166 convex-smooth-bounded learning, 166 covering numbers, 388 curse of dimensionality, 263 decision stumps, 132, 133 decision trees, 250 dendrogram, 309, 310 dictionary learning, 368 diferential set, 188 dimensionality reduction, 323 discretization trick, 57 discriminative, 342 distribution free, 342 domain, 33 domain of examples, 48 doubly stochastic matrix, 242 duality, 211 strong duality, 211 weak duality, 211 Dudley classes, 81 efficient computable, 100 EM, 348 empirical error, 35 empirical risk, 35, 48 Empirical Risk Minimization, see ERM entropy, 345 relative entropy, 345 epigraph, 157 ERM, 35 error decomposition, 64, 168 estimation error, 61, 64 Expectation-Maximization, see EM face recognition, see Viola-Jones feasible, 100 feature, 33 feature learning, 368 feature normalization, 365 feature selection, 357, 358 feature space, 215 feature transformations, 367 filters, 359

Understanding Machine Learning, c 2014 by Shai Shalev-Shwartz and Shai Ben-David Published 2014 by Cambridge University Press. Personal use only. Not for distribution. Do not post. Please link to http://www.cs.huji.ac.il/ shais/UnderstandingMachineLearning

forward greedy selection, 360 frequentist, 353 gain, 253 GD, see gradient descent generalization error, 35 generative models, 342 Gini index, 254 Glivenko-Cantelli, 58 gradient, 158 gradient descent, 185 Gram matrix, 219 growth function, 73 halfspace, 118 homogenous, 118, 205 non-separable, 119 separable, 118 Halving, 289 hidden layers, 270 Hilbert space, 217 Hoefding’s inequality, 56, 425 hold out, 146 hypothesis, 34 hypothesis class, 36 i.i.d., 38 ID3, 252 improper, see representation independent inductive bias, see bias information bottleneck, 317 information gain, 254 instance, 33 instance space, 33 integral image, 143 Johnson-Lindenstrauss lemma, 329 k-means, 311, 313 soft k-means, 352 k-median, 312 k-medoids, 312 Kendall tau, 239 kernel PCA, 326 kernels, 215 Gaussian kernel, 220 kernel trick, 217 polynomial kernel, 220 RBF kernel, 220 label, 33 Lasso, 365, 386 generalization bounds, 386 latent variables, 348 LDA, 347 Ldim, 290, 291 learning curves, 153 least squares, 124 likelihood ratio, 348 linear discriminant analysis, see LDA linear predictor, 117

homogenous, 118 linear programming, 119 linear regression, 122 linkage, 310 Lipschitzness, 160, 176, 191 sub-gradient, 190 Littlestone dimension, see Ldim local minimum, 158 logistic regression, 126 loss, 35 loss function, 48 0-1 loss, 48, 167 absolute value loss, 124, 128, 166 convex loss, 163 generalized hinge-loss, 233 hinge loss, 167 Lipschitz loss, 166 log-loss, 345 logistic loss, 127 ramp loss, 209 smooth loss, 166 square loss, 48 surrogate loss, 167, 302 margin, 203 Markov’s inequality, 422 Massart lemma, 380 max linkage, 310 maximum a-posteriori, 355 maximum likelihood, 343 McDiarmid’s inequality, 378 MDL, 89, 90, 251 measure concentration, 55, 422 Minimum Description Length, see MDL mistake bound, 288 mixture of Gaussians, 348 model selection, 144, 147 multiclass, 47, 227, 402 cost-sensitive, 232 linear predictors, 230, 405 multi-vector, 231, 406 Perceptron, 248 reductions, 227, 405 SGD, 235 SVM, 234 multivariate performance measures, 243 Naive Bayes, 347 Natarajan dimension, 402 NDCG, 239 Nearest Neighbor, 258 k-NN, 258 neural networks, 268 feedforward networks, 269 layered networks, 269 SGD, 277 no-free-lunch, 61 non-uniform learning, 84

Normalized Discounted Cumulative Gain, see NDCG Occam’s razor, 91 OMP, 360 one-vs-all, 227 one-vs-rest, see one-vs-all one-vs.-all, 404 online convex optimization, 300 online gradient descent, 300 online learning, 287 optimization error, 168 oracle inequality, 179 orthogonal matching pursuit, see OMP overfitting, 35, 65, 152 PAC, 43 agnostic PAC, 45, 46 agnostic PAC for general loss, 49 PAC-Bayes, 415 parametric density estimation, 342 PCA, 324 Pearson’s correlation coeficient, 359 Perceptron, 120 kernelized Perceptron, 225 multiclass, 248 online, 301 permutation matrix, 242 polynomial regression, 125 precision, 244 predictor, 34 prefix free language, 89 Principal Component Analysis, see PCA prior knowledge, 63 Probably Approximately Correct, see PAC projection, 193 projection lemma, 193 proper, 49 pruning, 254 Rademacher complexity, 375 random forests, 255 random projections, 329 ranking, 238 bipartite, 243 realizability, 37 recall, 244 regression, 47, 122, 172 regularization, 171 Tikhonov, 172, 174 regularized loss minimization, see RLM representation independent, 49, 107 representative sample, 54, 375 representer theorem, 218 ridge regression, 172 kernel ridge regression, 225 RIP, 331 risk, 35, 45, 48 RLM, 171, 199

sample complexity, 44 Sauer’s lemma, 73 self-boundedness, 162 sensitivity, 244 SGD, 190 shattering, 69, 403 single linkage, 310 Singular Value Decomposition, see SVD Slud’s inequality, 428 smoothness, 162, 177, 198 SOA, 292 sparsity-inducing norms, 363 specificity, 244 spectral clustering, 315 SRM, 85, 145 stability, 173 Stochastic Gradient Descent, see SGD strong learning, 132 Structural Risk Minimization, see SRM structured output prediction, 236 sub-gradient, 188 Support Vector Machines, see SVM SVD, 431 SVM, 202, 383 duality, 211 generalization bounds, 208, 383 hard-SVM, 203, 204 homogenous, 205 kernel trick, 217 soft-SVM, 206 support vectors, 210 target set, 47 term-frequency, 231 TF-IDF, 231 training error, 35 training set, 33 true error, 35, 45 underfitting, 65, 152 uniform convergence, 54, 55 union bound, 39 unsupervised learning, 308 validation, 144, 146 cross validation, 149 train-validation-test split, 150 Vapnik-Chervonenkis dimension, see VC dimension VC dimension, 67, 70 version space, 289 Viola-Jones, 139 weak learning, 130, 131 Weighted-Majority, 295

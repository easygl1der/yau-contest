---
title: "Appendix A — Mathematical Comments"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: appendix
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Appendix A — Mathematical Comments

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← Ch. 11 Bayesian Statistics](./11-bayesian-statistics.md) · [App. B R Primer →](./b-r-primer.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Appendix A

# Mathematical Comments

# A.1 Regularity Conditions

These are the regularity conditions referred to in Sections 6.4 and 6.5 of the text. A discussion of these conditions can be found in Chapter 6 of Lehmann and Casella (1998).

Let $X$ have pdf $f(x; \pmb{\theta})$ , where $\pmb{\theta} \in \Omega \subset R^{p}$ . For these assumptions, $X$ can be either a scalar random variable or a random vector in $R^{k}$ . As in Section 6.4, let $\mathbf{I}(\pmb{\theta}) = [I_{jk}]$ denote the $p \times p$ information matrix given by expression (6.4.4). Also, we will denote the true parameter $\pmb{\theta}$ by $\pmb{\theta}_{0}$ .

Assumptions A.1.1. Additional regularity conditions for Sections 6.4 and 6.5.

(R6): There exists an open subset $\Omega_0\subset \Omega$ such that $\pmb{\theta}_0\in \Omega_0$ and all third partial derivatives of $f(x;\pmb {\theta})$ exist for all $\pmb {\theta}\in \Omega_0$

(R7) The following equations are true (essentially, we can interchange expectation and differentiation):

$$
E _ {\boldsymbol {\theta}} \left[ \frac {\partial}{\partial \theta_ {j}} \log f (x; \boldsymbol {\theta}) \right] = 0, \quad \text {f o r} j = 1, \dots , p
$$

$$
I _ {j k} (\boldsymbol {\theta}) = E _ {\boldsymbol {\theta}} \left[ - \frac {\partial^ {2}}{\partial \theta_ {j} \partial \theta_ {k}} \log f (x; \boldsymbol {\theta}) \right], \text {f o r} j, k = 1, \dots , p.
$$

(R8) For all $\pmb{\theta} \in \Omega_0$ , $\mathbf{I}(\pmb{\theta})$ is positive definite.   
(R9) There exist functions $M_{jkl}(x)$ such that

$$
\left| \frac {\partial^ {3}}{\partial \theta_ {j} \partial \theta_ {k} \theta_ {l}} \log f (x; \boldsymbol {\theta}) \right| \leq M _ {j k l} (x), \quad \text {f o r a l l} \boldsymbol {\theta} \in \Omega_ {0},
$$

and

$$
E _ {\boldsymbol {\theta} _ {0}} \left[ M _ {j k l} \right] <   \infty , \quad f o r a l l j, k, l \in 1, \dots , p.
$$

# A.2 Sequences

The following is a short review of sequences of real numbers. In particular the liminf and limsup of sequences are discussed. As a supplement to this text, the authors offer a mathematical primer which can be downloaded at the site listed in the Preface. In addition to the following review of sequences, it contains a brief review of infinite series, and differentiable and integrable calculus including double integration. Students that need a review of these concepts can freely download this supplement.

Let $\{a_n\}$ be a sequence of real numbers. Recall from calculus that $a_{n} \to a$ ( $\lim_{n \to \infty} a_{n} = a$ ) if and only if

for every $\epsilon >0$ , there exists an $N_0$ such that $n\geq N_0\Rightarrow |a_n - a| < \epsilon$ . (A.2.1)

Let $A$ be a set of real numbers that is bounded from above; that is, there exists an $M \in R$ such that $x \leq M$ for all $x \in A$ . Recall that $a$ is the supremum of $A$ if $a$ is the least of all upper bounds of $A$ . From calculus, we know that the supremum of a set bounded from above exists. Furthermore, we know that $a$ is the supremum of $A$ if and only if, for all $\epsilon > 0$ , there exists an $x \in A$ such that $a - \epsilon < x \leq a$ . Similarly, we can define the infimum of $A$ .

We need three additional facts from calculus. The first is the Sandwich Theorem.

Theorem A.2.1 (Sandwich Theorem). Suppose for sequences $\{a_n\}$ , $\{b_n\}$ , and $\{c_n\}$ that $c_n \leq a_n \leq b_n$ , for all $n$ , and that $\lim_{n \to \infty} b_n = \lim_{n \to \infty} c_n = a$ . Then $\lim_{n \to \infty} a_n = a$ .

Proof: Let $\epsilon > 0$ be given. Because both $\{b_n\}$ and $\{c_n\}$ converge, we can choose $N_0$ so large that $|c_n - a| < \epsilon$ and $|b_n - a| < \epsilon$ , for $n \geq N_0$ . Because $c_n \leq a_n \leq b_n$ , it is easy to see that

$$
\left| a _ {n} - a \right| \leq \max  \left\{\left| c _ {n} - a \right|, \left| b _ {n} - a \right| \right\},
$$

for all $n$ . Hence, if $n \geq N_0$ , then $|a_n - a| < \epsilon$ .

The second fact concerns subsequences. Recall that $\{a_{n_k}\}$ is a subsequence of $\{a_n\}$ if the sequence $n_1 \leq n_2 \leq \dots$ is an infinite subset of the positive integers. Note that $n_k \geq k$ .

Theorem A.2.2. The sequence $\{a_{n}\}$ converges to $a$ if and only if every subsequence $\{a_{n_k}\}$ converges to $a$ .

Proof: Suppose the sequence $\{a_{n}\}$ converges to $a$ . Let $\{a_{n_k}\}$ be any subsequence. Let $\epsilon > 0$ be given. Then there exists an $N_0$ such that $|a_{n} - a| < \epsilon$ , for $n \geq N_0$ . For the subsequence, take $k'$ to be the first index of the subsequence beyond $N_0$ . Because for all $k$ , $n_k \geq k$ , we have that $n_k \geq n_{k'} \geq k' \geq N_0$ , which implies that $|a_{n_k} - a| < \epsilon$ . Thus, $\{a_{n_k}\}$ converges to $a$ . The converse is immediate because a sequence is also a subsequence of itself.

Finally, the third theorem concerns monotonic sequences.

Theorem A.2.3. Let $\{a_{n}\}$ be a nondecreasing sequence of real numbers; i.e., for all $n$ , $a_{n} \leq a_{n+1}$ . Suppose $\{a_{n}\}$ is bounded from above; i.e., for some $M \in R$ , $a_{n} \leq M$ for all $n$ . Then the limit of $a_{n}$ exists.

Proof: Let $a$ be the supremum of $\{a_n\}$ . Let $\epsilon > 0$ be given. Then there exists an $N_0$ such that $a - \epsilon < a_{N_0} \leq a$ . Because the sequence is nondecreasing, this implies that $a - \epsilon < a_n \leq a$ , for all $n \geq N_0$ . Hence, by definition, $a_n \to a$ .

Let $\{a_{n}\}$ be a sequence of real numbers and define the two subsequences

$$
b _ {n} = \sup  \left\{a _ {n}, a _ {n + 1}, \dots \right\}, \quad n = 1, 2, 3 \dots \tag {A.2.2}
$$

$$
c _ {n} = \inf  \left\{a _ {n}, a _ {n + 1}, \dots \right\}, \quad n = 1, 2, 3 \dots . \tag {A.2.3}
$$

It is obvious that $\{b_n\}$ is a nonincreasing sequence. Hence, if $\{a_n\}$ is bounded from below, then the limit of $b_{n}$ exists. In this case, we call the limit of $\{b_n\}$ the limit supremum (limsup) of the sequence $\{a_n\}$ and write it as

$$
\varlimsup_ {n \rightarrow \infty} a _ {n} = \lim  _ {n \rightarrow \infty} b _ {n}. \tag {A.2.4}
$$

Note that if $\{a_n\}$ is not bounded from below, then $\overline{\lim}_{n\to \infty}a_n = -\infty$ . Also, if $\{a_n\}$ is not bounded from above, we define $\overline{\lim}_{n\to \infty}a_n = \infty$ . Hence, the $\overline{\lim}$ of any sequence always exists. Also, from the definition of the subsequence $\{b_n\}$ , we have

$$
a _ {n} \leq b _ {n}, \quad n = 1, 2, 3, \dots . \tag {A.2.5}
$$

On the other hand, $\{c_n\}$ is a nondecreasing sequence. Hence, if $\{a_{n}\}$ is bounded from above, then the limit of $c_{n}$ exists. We call the limit of $\{c_n\}$ the limit infimum (liminf) of the sequence $\{a_{n}\}$ and write it as

$$
\varlimsup_ {n \rightarrow \infty} a _ {n} = \lim  _ {n \rightarrow \infty} c _ {n}. \tag {A.2.6}
$$

Note that if $\{a_n\}$ is not bounded from above, then $\underline{\lim}_{n\to \infty}a_n = \infty$ . Also, if $\{a_n\}$ is not bounded from below, $\underline{\lim}_{n\to \infty}a_n = -\infty$ . Hence, the $\underline{\lim}$ of any sequence always exists. Also, from the definition of the subsequences $\{c_n\}$ and $\{b_n\}$ , we have

$$
c _ {n} \leq a _ {n} \leq b _ {n}, \quad n = 1, 2, 3, \dots . \tag {A.2.7}
$$

Also, because $c_{n} \leq b_{n}$ for all $n$ , we have

$$
\varlimsup_ {n \rightarrow \infty} a _ {n} \leq \varliminf_ {n \rightarrow \infty} a _ {n}. \quad \blacksquare \tag {A.2.8}
$$

Example A.2.1. Here are two examples. More are given in the exercises.

1. Suppose $a_n = -n$ for all $n = 1, 2, \ldots$ . Then $b_n = \sup \{-n, -n - 1, \ldots\} = -n \to -\infty$ and $c_n = \inf \{-n, -n - 1, \ldots\} = -\infty \to -\infty$ . So, $\varlimsup_{n \to \infty} a_n = \varlimsup_{n \to \infty} a_n = -\infty$ .

2. Suppose $\{a_n\}$ is defined by

$$
a _ {n} = \left\{ \begin{array}{l l} 1 + \frac {1}{n} & \text {i f n i s e v e n} \\ 2 + \frac {1}{n} & \text {i f n i s o d d}. \end{array} \right.
$$

Then $\{b_n\}$ is the sequence $\{3,2 + (1 / 3),2 + (1 / 3),2 + (1 / 5),2 + (1 / 5),\ldots \}$ , which converges to 2, while $\{c_{n}\} \equiv 1$ , which converges to 1. Thus, $\varlimsup_{n\to \infty}a_n = 1$ and $\varlimsup_{n\to \infty}a_n = 2$ .

It is useful that the $\varlimsup_{n\to \infty}$ and $\varlimsup_{n\to \infty}$ of every sequence exists. Also, the sandwich effects of expressions (A.2.7) and (A.2.8) lead to the following theorem.

Theorem A.2.4. Let $\{a_n\}$ be a sequence of real numbers. Then the limit of $\{a_n\}$ exists if and only if $\underline{\lim}_{n\to \infty}a_n = \overline{\lim}_{n\to \infty}a_n$ , in which case, $\lim_{n\to \infty}a_n = \underline{\lim}_{n\to \infty}a_n = \overline{\lim}_{n\to \infty}a_n$ .

Proof: Suppose first that $\lim_{n\to \infty}a_n = a$ . Because the sequences $\{c_n\}$ and $\{b_n\}$ are subsequences of $\{a_n\}$ , Theorem A.2.2 implies that they converge to $a$ also. Conversely, if $\underline{\lim}_{n\to \infty}a_n = \overline{\lim}_{n\to \infty}a_n$ , then expression (A.2.7) and the Sandwich Theorem, A.2.1, imply the result.

Based on this last theorem, we have two interesting applications that are frequently used in statistics and probability. Let $\{p_n\}$ be a sequence of probabilities and let $b_{n} = \sup \{p_{n},p_{n + 1},\ldots \}$ and $c_{n} = \inf \{p_{n},p_{n + 1},\ldots \}$ . For the first application, suppose we can show that $\varlimsup_{n\to \infty}p_n = 0$ . Then, because $0\leq p_{n}\leq b_{n}$ , the Sandwich Theorem implies that $\lim_{n\to \infty}p_n = 0$ . For the second application, suppose we can show that $\varlimsup_{n\to \infty}p_n = 1$ . Then, because $c_{n}\leq p_{n}\leq 1$ , the Sandwich Theorem implies that $\lim_{n\to \infty}p_n = 1$ .

We list some other properties in a theorem and ask the reader to provide the proofs in Exercise A.2.2:

Theorem A.2.5. Let $\{a_n\}$ and $\{d_n\}$ be sequences of real numbers. Then

$$
\varlimsup_ {n \rightarrow \infty} (a _ {n} + d _ {n}) \leq \varliminf_ {n \rightarrow \infty} a _ {n} + \varliminf_ {n \rightarrow \infty} d _ {n} \tag {A.2.9}
$$

$$
\lim  _ {n \rightarrow \infty} a _ {n} = - \overline {{\lim  _ {n \rightarrow \infty}}} (- a _ {n}). \tag {A.2.10}
$$

# EXERCISES

A.2.1. Calculate the $\varlimsup$ and $\varliminf$ of each of the following sequences:

(a) For $n = 1,2,\ldots ,a_{n} = (-1)^{n}\left(2 - \frac{4}{2^{n}}\right)$   
(b) For $n = 1,2,\ldots$ , $a_{n} = n^{\cos(\pi n / 2)}$ .   
(c) For $n = 1,2,\ldots$ , $a_{n} = \frac{1}{n} +\cos \frac{\pi n}{2} +(-1)^{n}$ .

A.2.2. Prove properties (A.2.9) and (A.2.10).

A.2.3. Let $\{a_{n}\}$ and $\{d_n\}$ be sequences of real numbers. Show that

$$
\varliminf_ {n \to \infty} (a _ {n} + d _ {n}) \geq \varliminf_ {n \to \infty} a _ {n} + \varliminf_ {n \to \infty} d _ {n}.
$$

A.2.4. Let $\{a_n\}$ be a sequence of real numbers. Suppose $\{a_{n_k}\}$ is a subsequence of $\{a_n\}$ . If $\{a_{n_k}\} \to a_0$ as $k \to \infty$ , show that $\underline{\lim}_{n \to \infty} a_n \leq a_0 \leq \varlimsup_{n \to \infty} a_n$ .

This page intentionally left blank


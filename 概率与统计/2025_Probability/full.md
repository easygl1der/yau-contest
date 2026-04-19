# S.-T. Yau College Student Mathematics Contests 2025

# Probability and Statistics

# (4 problems)

# Problem 1.

Consider a single observation $X \sim N ( \mu , \sigma ^ { 2 } )$ with both $\mu$ and $\sigma ^ { 2 }$ unknown. We are interested in constructing confidence interval (CI) for $\mu$ .

1. Consider the following CI:

$$
\operatorname {C I} (X; c _ {1}, c _ {2}) = \left\{ \begin{array}{l l} c _ {1} X \leq \mu \leq c _ {2} X & \text {i f} X > 0 \\ c _ {2} X \leq \mu \leq c _ {1} X & \text {i f} X <   0 \end{array} \right..
$$

What is the coverage probability of this CI?

2. Let $F ( x ; b _ { 1 } , b _ { 2 } )$ be a function that is measurable in $x$ and is a distribution function on $b _ { 1 } < b _ { 2 }$ , and which generates a randomized confidence interval whose lower and upper endpoints are random variables $b _ { 1 } < b _ { 2 }$ with distribution function $F ( x ; b _ { 1 } , b _ { 2 } )$ . Then, there is a randomized confidence interval given by a distribution function $G ( c _ { 1 } , c _ { 2 } )$ randomly choosing a interval of the form $\operatorname { C I } ( x ; c _ { 1 } , c _ { 2 } )$ with $( C _ { 1 } , C _ { 2 } ) \sim G$ and satisfying the following “minimax” property:

$$
\inf  _ {\mu , \sigma} E _ {\mu , \sigma} P _ {G} \{\mu \in \operatorname {C I} (X; c _ {1}, c _ {2}) \} \geq \sup  _ {F} \inf  _ {\mu , \sigma} E _ {\mu , \sigma} P _ {F (X; \cdot)} \{\mu \in (b _ {1}, b _ {2}) \}
$$

$$
E _ {\mu , \sigma} E _ {G} \left[ (c _ {2} - c _ {1}) | X | \right] = E _ {\mu , \sigma} E _ {F (X; \cdot)} \left[ (b _ {2} - b _ {1}) \right].
$$

# Problem 2.

Consider a joint distribution of the random variable pair $\{ X , Y \}$ , and let $P _ { 1 }$ and $P _ { 2 }$ be the two marginal distributions on the real line (that is, for $X$ and $Y$ , respectively). Let $p _ { 1 } ( x )$ and $p _ { 2 } ( y )$ be the respective densities for $P _ { 1 }$ and $P _ { 2 }$ with respect to a dominating measure $\mu$ . Let $\nu ( \cdot )$ be any function such that $\nu ( X )$ and $\nu ( Y )$ are not bounded and their expectations $E _ { 1 } ( \nu ( X ) )$ and $E _ { 2 } ( \nu ( Y ) )$ are both finite under $P _ { 1 }$ and $P _ { 2 }$ , respectively. Suppose a single observation $r$ comes from population 1 with probability 1/2 and from population 2 with probability $1 / 2$ . The problem is to choose the population, $i$ , for which the expectation is greater, based on the single observation $r$ .

Consider a randomized decision rule (or selection rule) to be given by a function

$$
\phi : \mathcal {R} \to [ 0, 1 ]
$$

such that $\phi ( r )$ is the probability of choosing population 1 based on the observation $r$ . Assume $\phi ( r )$ is a one-to-one function.

For any given decision function $\phi ( r )$ , for any two densities $p _ { 1 } ( x )$ and $p _ { 2 } ( y )$ (with respect to the Lebesgue measure) such that $E _ { 1 } ( \nu ( X ) ) > E _ { 2 } ( \nu ( Y ) )$ , is the probability of correctly selecting population 1 always greater than or equal to 1/2? If so, prove it. If not, for any given decision function $\phi ( r )$ , construct a $p _ { 1 } ( x )$ and a $p _ { 2 } ( y )$ such that $E _ { 1 } ( \nu ( X ) ) > E _ { 2 } ( \nu ( Y ) )$ but the probability of correctly selecting population 1 is less than $1 / 2$ .

# Problem 3.

Let $n \geq 2$ be a natural number. Prove that there exist independent random variables $X _ { 1 } , X _ { 2 } , \ldots , X _ { n } =$ $X _ { 0 }$ such that

$$
P \left(X _ {k - 1} <   X _ {k}\right) = 1 - \frac {1}{4 \cos^ {2} \left(\frac {\pi}{n + 2}\right)}, \quad \text {f o r a l l} 1 \leq k \leq n.
$$

# Problem 4.

Consider a one-way ANOVA with $p$ cells and $n / p$ observations per cell:

$$
Y _ {i j} = \beta_ {j} + R _ {i j}, \quad i = 1, \dots , n / p, \quad j = 1, \dots , p,
$$

where $\{ R _ { i j } \}$ are i.i.d. Assume the true values $\beta _ { j } = 0$ .

Let $\psi$ be a given function and let $\hat { \beta } _ { j }$ denote the solution of the equation

$$
0 = \sum_ {i = 1} ^ {n / p} \psi \left(Y _ {i j} - \hat {\beta} _ {j}\right).
$$

Let $\psi$ be a bounded function such that $\psi ^ { \prime }$ is bounded and continuous near zero. Suppose $E \psi ( R ) = 0$ and $E \psi ^ { \prime } ( R ) = d \neq 0$ . Assume $p ( \log p ) / n \to 0$ . Prove that there are solutions $\{ \hat { \beta } _ { j } \}$ of the equation and a constant $B > 0$ such that

$$
P \left\{\max _ {j} | \hat {\beta} _ {j} | \geq \left(\frac {1}{B} \frac {p \log n}{n}\right) ^ {1 / 2} \right\} \leq \frac {2 p}{n} \to 0.
$$
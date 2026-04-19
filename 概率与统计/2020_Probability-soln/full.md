# Probability and Statistics

Solve every problem.

# Part I: Probability

Problem 1. Let $X$ be an essentially bounded random variable with mean zero. Show that

$$
\mathbb {E} e ^ {X} \leq \cosh \| X \| _ {\infty},
$$

where cosh $\begin{array} { r } { x = \frac { e ^ { x } + e ^ { - x } } { 2 } } \end{array}$ is the hyperbolic cosine function.

Solution: The equation of the straight line connecting the two points $( - M , e ^ { - M } )$ and $( M , e ^ { M } )$ on the curve $y = e ^ { x }$ is

$$
y = \frac {e ^ {M} + e ^ {- M}}{x} + \left(\frac {e ^ {M} - e ^ {- M}}{2 M}\right) x = \cosh M + \left(\frac {\sinh M}{M}\right) x
$$

where sinh M = eM −e−M $\begin{array} { r } { M = \frac { e ^ { M } - e ^ { - M } } { 2 } } \end{array}$ is the hyperbolic sine function. Since the function $y = e ^ { x }$ is a convex function, it lies under the the straight line on the interval $[ - M , M ]$ , hence

$$
e ^ {x} \leq \cosh M \left(\frac {\sinh M}{M}\right) x. \tag {1}
$$

The above inequality can also be proved as follows. We write $x \in [ - M , M ]$ as a convex combination of $M$ and $- M$ as follows:

$$
x = \frac {1}{2} \left(1 + \frac {x}{M}\right) \cdot M + \frac {1}{2} \left(1 - \frac {x}{M}\right) \cdot (- M).
$$

From the convexity of the function $e ^ { x }$ we have

$$
e ^ {x} \leq \frac {1}{2} \left(1 - \frac {x}{M}\right) e ^ {M} + \frac {1}{2} \left(1 - \frac {x}{M}\right) e ^ {- M} = \cosh M + \left(\frac {\sinh M}{M}\right) x.
$$

Now let $M = \| X \| _ { \infty }$ . Because $| X | \leq M$ almost surely from (1) we have

$$
e ^ {X} \leq \cosh M + \left(\frac {\sinh M}{M}\right) X
$$

almost surely. Taking the expectation and using the assumption that $\mathbb { E } X = 0$ we obtain $\mathbb { E } e ^ { X } \leq \cosh M$ .

Problem 2. Let $\lambda$ be a positive number. Suppose that $X$ is a random variable with $\mathbb { E } | X | < \infty$ . Suppose that

$$
\lambda \mathbb {E} f (X + 1) = \mathbb {E} \{X f (X) \}
$$

for all bounded smooth functions. Show that $X$ has the Poisson distribution Poisson( ).

Solution: We will apply the identity in the problem to the bounded smooth function $f ( x ) = e ^ { i t x }$ (for a fixed $t \in \mathbb { R }$ ). The left-hand side is equal to $\lambda e ^ { i t } \phi ( t )$ , where $\phi ( t ) = \mathbb { E } e ^ { i t X }$ is the characteristic function of $X$ . The right-hand side is $\mathbb { E } [ X e ^ { i t X } ] = - i \phi ^ { \prime } ( t )$ φ φ. Note that under the assumption $\mathbb { E } | X | < \infty$ the function $\phi ( t )$ φ <is continuously differentiable and the differentiation under the expectation is justified by the dominated φconvergence theorem. Therefore $\phi ^ { \prime } ( t ) = i \lambda e ^ { i t } \phi ( t )$ .

Let $g ( t ) = \phi ( t ) e ^ { - \lambda ( e ^ { i t } - 1 ) }$ . We have

$$
g ^ {\prime} (t) = \left\{\phi^ {\prime} (t) - i \lambda e ^ {i t} \phi (t) \right\} e ^ {- \lambda (e ^ {i t} - 1)} = 0.
$$

Hence $g ( t )$ is a constant, i.e., $g ( t ) = g ( 0 ) = 1$ . It follows that the characteristic function of the random variable $X$ is $\phi ( t ) = e ^ { \lambda ( e ^ { i t } - 1 ) }$ . This is the characteristic function of the distribution Poisson( ). By the uniqueness theorem for characteristic functions the distribution of $X$ must be Poisson( ).

# Problem 3. Consider the random walk

$$
S _ {n} = a + X _ {1} + X _ {2} + \dots + X _ {n},
$$

where $a$ is a positive integer and $\{ X _ { i } \}$ are independent and identically distributed random variables with a common distribution

$$
\mathbb {P} \left\{X _ {i} = 1 \right\} = p, \quad \mathbb {P} \left\{X _ {i} = - 1 \right\} = 1 - p.
$$

Let $\tau _ { 0 } = \operatorname* { i n f } \{ n : S _ { n } = 0 \}$ be the first time the random walk reaches the state $x = 0$ . For all $p \in [ 0 , 1 ]$ τfind the probability $\mathbb { P } _ { a } \{ \tau _ { 0 } < \infty \}$ that the random walk will eventually hit the state $x = 0$ .

Solution: It is clear that $\mathbb { P } _ { a } \{ \tau _ { 0 } < \infty \} = 1$ and 0 for $p = 0$ and $p = 1$ , respectively. We assume that $0 < p < 1$ . Let $q = 1 - p$ τ < for simplicity. Consider the function

$$
f (x) = \left(\frac {q}{p}\right) ^ {x}.
$$

It is easy to verify that $f ( S _ { n } )$ is a martingale. For each integer $b > a$ let $\tau _ { b } = \operatorname* { i n f } \left\{ n : S _ { n } = b \right\}$ and $\tau = \tau _ { 0 } \wedge \tau _ { b }$ . Then the stopped martingale $f ( S _ { n \wedge \tau } )$ > τ τ τ τ is bounded. By the martingale convergence theorem, it must converge almost surely. Since $\mathbb { P } _ { a } \left\{ \tau < \infty \right\} = 1$ , the walk $S _ { n \wedge \tau }$ stops at either $a$ or $^ b$ and we have

$$
f (a) = \mathbb {P} \left\{\tau_ {0} <   \tau_ {b} \right\} + f (b) \mathbb {P} \left\{\tau_ {0} > \tau_ {b} \right\}.
$$

Note that $f ( 0 ) = 1$ . If $0 ~ \le ~ p ~ > ~ 1 / 2$ , then letting $b  \infty$ we have $\tau _ { b } \ \to \ \infty$ and $f ( b ) \to 0$ , hence $\mathbb { P } \left\{ \tau _ { 0 } < \infty \right\} = f ( a )$ . If $p < 1 / 2$ >, then $f ( b ) \to \infty$ as $b \to \infty$ τ and we must have $\mathbb { P } \{ \tau _ { 0 } > \tau _ { b } \}  0$ . This means that $\mathbb { P } \left\{ \tau _ { 0 } < \infty \right\} = 1$ .

For the case $p = 1 / 2$ , we can use the same argument with the function $f ( x ) = x$ . We have $a = b \mathbb { P } \left\{ \tau _ { 0 } > \tau _ { b } \right\}$ or $\mathbb { P } \left\{ \tau _ { 0 } > \tau _ { b } \right\} = a / b$ . Letting $b \to \infty$ we have again $\mathbb { P } \left\{ \tau _ { 0 } < \infty \right\} = 1$ . We have

$$
\mathbb {P} \left\{\tau_ {0} <   \infty \right\} = \left\{ \begin{array}{l l} 1 & 0 \leq p \leq 1 / 2, \\ \left(\frac {1 - p}{p}\right) ^ {a} & 1 / 2 <   p \leq 1. \end{array} \right.
$$

Problem 4. Let $Z = ( X , Y )$ be an $\mathbb { R } ^ { 2 }$ -valued random variable such that (1) $X$ and Y are independent; (2) both $X$ ,and Y have mean zero and finite (nonvanishing) second moments; (3) the distribution of $Z$ is invariant under the rotation counter-clockwise around the origin by an angle $\theta$ not a multiple of 90 degrees. Show that $X$ θand Y must be normal random variables with the same variance.

Solution: We first show that $X$ and Y have the same variance $\sigma ^ { 2 } = \mathbb { E } | X | ^ { 2 } = \mathbb { E } | Y | ^ { 2 }$ . By hypothesis, we have

$$
\begin{array}{l} \mathbb {E} | X | ^ {2} = \cos^ {2} \theta \mathbb {E} | X | ^ {2} + \sin^ {2} \theta \mathbb {E} | Y | ^ {2}, \\ \mathbb {E} | Y | ^ {2} = \sin^ {2} \theta \mathbb {E} | X | ^ {2} + \cos^ {2} \theta \mathbb {E} | Y | ^ {2}. \\ \end{array}
$$

Subtracting the two equations we have

$$
(1 - \cos 2 \theta) \left(\mathbb {E} | X | ^ {2} - \mathbb {E} | Y | ^ {2}\right) = 0.
$$

If cos $2 \theta \neq 1$ we have $\mathbb { E } | X | ^ { 2 } = \mathbb { E } | Y | ^ { 2 }$ ; otherwise $\cos ^ { \theta } = \sin ^ { 2 } \theta = 1 / 2$ and the equality obviously holds.

From (2) by induction we can show that

$$
X \sim \sum i = 1 ^ {2 ^ {n}} a _ {n i} Z _ {i}
$$

where $\left\{ Z _ { i } \right\}$ are independent and have the same distribution as either $X$ or $Y$ , say $X _ { i } \sim X$ for $i \in I$ and $Z _ { i } \sim Y$ for $i \in J$ . Each coefficient has the form $a _ { n i } = \pm \cos ^ { k } \theta \sin ^ { n - k } \theta$ for some $k$ . Since $\theta$ is not a multiple of 90 degrees, there is a constant $0 < \lambda < 1$ such that $| a _ { n i } | \leq \lambda ^ { n }$ θ. Furthermore, since $X$ θand $Y$ have the same variance we have

$$
\sum_ {i = 1} ^ {2 ^ {n}} \left| a _ {n i} \right| ^ {2} = 1.
$$

We show that Lindeberg’s condition is satisfied for the sum $\textstyle \sum _ { i = 1 } ^ { 2 ^ { n } } a _ { n i } Z _ { i }$ . Indeed, by Chebyshev’s inequality

$$
\begin{array}{l} \sum_ {i = 1} ^ {2 ^ {n}} \mathbb {E} \left\{| a _ {n i} z _ {i} | ^ {2}; | a _ {n i} Z _ {i} | \geq \epsilon \right\} \leq \left(\sum_ {i \in I} | a _ {n i} | ^ {2}\right) \mathbb {E} \left\{| X | ^ {2}; | X | \geq \frac {\epsilon}{\lambda^ {n}} \right\} + \left(\sum_ {i \in J} | a _ {n i} | ^ {2}\right) \mathbb {E} \left\{| Y | ^ {2}; | Y | \geq \frac {\epsilon}{\lambda^ {n}} \right\} \\ \leq \frac {\lambda^ {n}}{\epsilon} \left\{\left(\sum_ {i \in I} | a _ {n i} | ^ {2}\right) \mathbb {E} | X | ^ {2} + \left(\sum_ {i \in J} | a _ {n i} | ^ {2}\right) \mathbb {E} | Y | ^ {2} \right\} \\ = \frac {\lambda^ {n}}{\epsilon} \mathbb {E} | X | ^ {2} \rightarrow 0. \\ \end{array}
$$

Now by the Lindeberg central limit theorem, the above sum converges in distribution to a normal distribution, hence $X$ (and also Y by the same argument) are normal random variables.

We can also work with characteristic functions without using the Lindeberg central limit theorem. We have

$$
\phi_ {X} (t) = \prod_ {i \in I} \phi_ {X} (a _ {n i} t) \prod_ {i \in J} \phi_ {Y} (a _ {n i} t).
$$

Since $X$ and $Y$ have mean zero and the same variance $\sigma ^ { 2 }$

$$
\phi_ {X} (t) = 1 - \frac {\sigma^ {2}}{2} t ^ {2} + o (t ^ {2}) = e ^ {- \sigma^ {2} t ^ {2} / 2 + o (t ^ {2})}.
$$

The same equality holds for $\begin{array} { r } { \sum _ { i = 1 } ^ { 2 ^ { n } } | a _ { n i } | ^ { 2 } = 1 } \end{array}$ that $\phi _ { Y } ( t )$ . It follows from the fact that $a _ { n i }$ ’s tend to zero uniformly as $n \to \infty$ and

$$
\phi_ {X} (t) = \prod_ {i = 1} ^ {2 ^ {n}} e ^ {- | a _ {n i} | ^ {2} \sigma^ {2} / 2 + o \left(| a _ {n i} | ^ {2} t ^ {2}\right)} = e ^ {- \sigma^ {2} t ^ {2} + o (t ^ {2})} \rightarrow e ^ {- \sigma^ {2} t ^ {2} / 2}.
$$

# Part II: Statistics

The following collection of questions concerns the design of a randomized experiment where the $N$ units to be randomized to drug A or drug B are people, for whom we have a large number of background covariates, collectively labelled $X$ (e.g., age, sex, blood pressure, height, weight, occupational status, history of heart disease, family history of heart disease). The objective is to assign approximately half to drug A and half to drug B where the means of each of the $X$ variables (and means of non-linear functions of them, such as squares or products) are close to equal in the two groups. Instead of using classical methods of design, such as blocking or stratification, the plan is to use modern computers to try many random allocations and discard those allocations that are considered unacceptable according to a pre-determined criterion for balanced $X$ means, in particular an affinely invariant measure such as the Mahalanobis distance between the means of $X$ in the two groups. After an acceptable allocation is found, outcome variables will be measured, and their means will be compared in group A and group B to estimate a treatment effect.

Problem 5. Prove that if the two groups are of the same size (i.e., $N / 2$ for even $N$ ), this plan will result in unbiased estimates of the A versus B casual effect based on the sample means of $Y$ in groups A and B, where Y is any linear function of $X$ .

Solution: Let $X _ { i }$ denote the covariate vector of unit $i$ , and $\pmb { X } = ( X _ { 1 } , \ldots , X _ { N } ) ^ { \top }$ denote the covariate matrix for all $N$ units. Let $z _ { i }$ denote the treatment allocation for unit $i$ , . . . ,, which equals 1 if the unit is assinged to drug $A$ and 0 otherwise, and $z \in \{ 0 , 1 \} ^ { N }$ denote the treatment allocation for all $N$ units.

Let $\phi ( \pmb { X } , z )$ denote the pre-determined criterion for balanced covariate means, which equals 1 if the allocation φ ,z is acceptable and 0 otherwise. By construction, the criterion is invariant when we switch treatment and control groups, i.e., $\phi ( X , z ) = \phi ( X , 1 - z ) ~$ . Note that under a completely randomized experiment (CRE) with φ , φ ,half of the units assinged to each treatment group, $\mathbf { Z }$ and ${ \bf 1 } - { \bf Z }$ follows the same distribution. This implies that, under the randomization (i.e, the CRE with balance criterion $\phi$ ),

$$
\mathbf {Z} \mid \phi (X, Z) = 1 \sim \mathbf {1} - Z \mid \phi (X, 1 - Z) = 1 \sim \mathbf {1} - Z \mid \phi (X, Z) = 1.
$$

Therefore, under re-randomization, $\mathbf { Z }$ and ${ \bf 1 } - { \bf Z }$ must have the same distribution. Consequently, for any $1 \leq i \leq N$ ,

$$
\mathbb {E} \left(Z _ {i} \mid X, \phi (X, Z) = 1\right) = \mathbb {E} \left(1 - Z _ {i} \mid X, \phi (X, Z) = 1\right) = 1 - \mathbb {E} \left(Z _ {i} \mid X, \phi (X, Z) = 1\right),
$$

which immediately implies that $\mathbb { E } \left( Z _ { i } \mid X , \phi ( X , Z ) = 1 \right) = 0 . 5 .$

We consider potential outcomes $Y _ { i } ( 1 ) = Y _ { i } ( 0 ) = \alpha + \beta ^ { \top } X _ { i }$ that are some linear function of the covariate. α βObviously, the treatment effect of drug A versus B on outcome $Y$ is zero. Let $Y _ { i } = Z _ { i } Y _ { i } ( 1 ) + ( 1 - Z _ { i } ) Y _ { i } ( 0 )$ be the observed outcome for unit $i$ . The estimator of this causal effect based on the samples means of $Y$ in groups A and B is

$$
\hat {\tau} = \frac {1}{N / 2} \sum_ {i = 1} ^ {N} Z _ {i} Y _ {i} - \frac {1}{N / 2} \sum_ {i = 1} ^ {N} (1 - Z _ {i}) Y _ {i} = \frac {1}{N / 2} \sum_ {i = 1} ^ {N} Z _ {i} Y _ {i} (1) - \frac {1}{N / 2} \sum_ {i = 1} ^ {N} (1 - Z _ {i}) Y _ {i} (0).
$$

Under re-randomization, $\hat { \tau }$ has expectation

$$
\begin{array}{l} \mathbb {E} (\hat {\tau} \mid X, \phi (X, Z) = 1) = \frac {2}{N} \sum_ {i = 1} ^ {N} \mathbb {E} \left(Z _ {i} \mid X, \phi (X, Z) = 1\right) \cdot Y _ {i} (1) - \frac {2}{N} \sum_ {i = 1} ^ {N} \left\{1 - \mathbb {E} \left(Z _ {i} \mid X, \phi (X, Z) = 1\right) \right\} \cdot Y _ {i} (0) \\ = \frac {2}{N} \sum_ {i = 1} ^ {N} \frac {1}{2} \cdot Y _ {i} (1) - \frac {2}{N} \sum_ {i = 1} ^ {N} \left(1 - \frac {1}{2}\right) \cdot Y _ {i} (0) \\ = \frac {1}{N} \sum_ {i = 1} ^ {N} Y _ {i} (1) - \frac {1}{N} \sum_ {i = 1} ^ {N} Y _ {i} (0) \\ = 0. \\ \end{array}
$$

Therefore, $\hat { \tau }$ is an unbiased estimator for the A versus B causal effect on the outcome Y.

Problem 6. Provide a counter-example to the assertion that Problem 5 is true in small samples with odd $N$ .

Solution: We consider an experiment with three units, among which two will be assigned to drug A and the remaining one to drub B. Suppose each unit has a scalar covariate with covariate values $( X _ { 1 } , X _ { 2 } , X _ { 3 } ) = ( 0 , 0 , 1 0 )$ and the potential outcomes $Y _ { i } ( 1 ) = Y _ { i } ( 0 ) = X _ { i }$ for $1 \leq i \leq 3$ .

We consider re-randomization with the following balance criterion:

$$
\phi (X, z) = 1 \left\{\left| \frac {1}{2} \sum_ {i = 1} ^ {N} z _ {i} X _ {i} - \sum_ {i = 1} ^ {N} (1 - z _ {i}) X _ {i} \right| \leq 8 \right\},
$$

i.e., a treatment allocation is acceptable if and only if the absolute value of the difference between covariate means in groups $A$ and $B$ are less than or equal to 8. Consequently, for all $\left( \begin{array} { l } { 3 } \\ { 2 } \end{array} \right) = 3$ treatment allocations, only 2 are acceptable:

<table><tr><td>z = (z1, z2, z3)T</td><td>τX ≈ 1/2 ∑i=1N ziXi - ∑i=1N (1 - zi)Xi</td><td>φ(X, z)</td></tr><tr><td>(1,1,0)</td><td>-10</td><td>0; Not acceptable</td></tr><tr><td>(1,0,1)</td><td>5</td><td>1; Acceptable</td></tr><tr><td>(0,1,1)</td><td>5</td><td>1; Acceptable</td></tr></table>

By the definition of potential outcomes, $\hat { \tau }$ is the same as $\hat { \tau } _ { X }$ in the above table. From the above table, under re-randomization with the balance criterion $\phi$ , ˆ has probability 1 to be 5. Note that the true casual effect of A versus B on outcome Y is zero. Therefore, in this example, $\hat { \tau }$ is not unbiased for the casual effect.
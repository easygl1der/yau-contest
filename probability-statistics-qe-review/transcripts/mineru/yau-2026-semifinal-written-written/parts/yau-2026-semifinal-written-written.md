# S.-T. Yau College Student Mathematics Contests 2026 Probability and Statistics (6 problems)

Problem 1. A copula is a multivariate cumulative distribution function with uniform marginals on [0, 1]. By Sklar’s Theorem, any joint distribution can be decomposed into its marginal distributions and a copula that captures the dependence structure between variables. That is, for random variables U and V with marginal CDFs $F _ { U }$ and $F _ { V }$ , their joint CDF can be written as $H ( u , v ) = C \{ F _ { U } ( u ) , F _ { V } ( v ) \}$ for some copula C. The copula parameter $\rho$ indexes the strength and shape of dependence, independently of the marginals.

Let $Y _ { a } \in \{ 0 , 1 , \ldots , L - 1 \}$ be an ordinal outcome observed in treatment group $a \in \{ 0 , 1 \}$

(1). Define $\psi = \mathrm { P r } ( Y _ { 1 } > Y _ { 0 } )$ as the probability that the outcome in the treatment group exceeds that in the control group. Suppose the joint CDF satisfies $\operatorname* { P r } ( Y _ { 1 } \leq k , Y _ { 0 } \leq j ) = C \{ F _ { 1 } ( k ) , F _ { 0 } ( j ) \}$ with the convention $F _ { a } ( - 1 ) = 0 \mathrm { { } } $ , where $C$ is a pre-specified copula. Derive a closed-form expression for $\psi$ in terms of $C , F _ { 1 }$ , and $F _ { 0 }$

(2). Suppose $Y _ { a }$ arises from a latent continuous variable $Y _ { a } ^ { * }$ through the threshold model

$$
Y _ {a} ^ {*} = \mu_ {a} + \varepsilon_ {a}, \quad Y _ {a} = \ell \iff \tau_ {\ell - 1} <   Y _ {a} ^ {*} \leq \tau_ {\ell},
$$

with shared thresholds $- \infty = \tau _ { - 1 } < \tau _ { 0 } < \cdot \cdot \cdot < \tau _ { L - 2 } < \tau _ { L - 1 } = + \infty$ and $\mu _ { a }$ a constant for group a. Also, suppose the joint distribution of the latent residuals satisfies

$$
\operatorname * {P r} (\varepsilon_ {1} \leq e _ {1}, \varepsilon_ {0} \leq e _ {0}) = C \{F _ {\varepsilon_ {1}} (e _ {1}), F _ {\varepsilon_ {0}} (e _ {0}) \},
$$

where $C$ is a pre-specified copula and $F _ { \varepsilon _ { a } } ( e ) = \operatorname* { P r } ( \varepsilon _ { a } \leq e )$ . Prove that this implies

$$
\operatorname * {P r} (Y _ {1} \leq k, Y _ {0} \leq j) = C \{F _ {1} (k), F _ {0} (j) \}.
$$

Problem 2. Consider the partitioned linear regression model

$$
Y = X _ {1} \beta_ {1} + X _ {2} \beta_ {2} + \varepsilon ,
$$

where $Y \in \mathbb { R } ^ { n } , X _ { 1 } \in \mathbb { R } ^ { n \times k _ { 1 } } , X _ { 2 } \in \mathbb { R } ^ { n \times k _ { 2 } } , k _ { 1 } , k _ { 2 } \geq 1$ , and $[ X _ { 1 } \ X _ { 2 } ]$ have full column rank. Define the annihilator matrix

$$
M _ {1} = I _ {n} - X _ {1} (X _ {1} ^ {\top} X _ {1}) ^ {- 1} X _ {1} ^ {\top},
$$

which projects onto the orthogonal complement of the column space of $X _ { 1 }$ . Recall that for a generic regression of a response $\tilde { Y }$ on a predictor matrix $\tilde { X }$ with full column rank, the OLS estimator is

$$
\hat {\beta} = (\tilde {X} ^ {\top} \tilde {X}) ^ {- 1} \tilde {X} ^ {\top} \tilde {Y}.
$$

Prove: the OLS estimator ${ \hat { \beta } } _ { 2 }$ obtained from the full regression of Y on $[ X _ { 1 } \ X _ { 2 } ]$ is identical to the OLS estimator obtained from regressing $M _ { 1 } Y$ on $M _ { 1 } X _ { 2 }$

Problem 3. Let $\phi$ and Φ be the density and distribution functions of the standard normal, and $a > 0$ is a constant.

(a) Show that $f ( x ) = 2 \phi ( x ) \Phi ( a x )$ is the density of some random variable (denoted by Y ).

(b) Calculate <sup>E</sup>(Y ).

Problem 4. Let $\{ B _ { t } , t \ge 0 \}$ be a standard Brownian motion. For $a > 0$ , define the first exit time from the interval $( - a , a )$ :

$$
\tau_ {a} = \inf \{t \geq 0: | B _ {t} | = a \}.
$$

Compute $\mathbb { E } [ \tau _ { a } ^ { 2 } ]$

Problem 5. Let $X _ { 1 } , X _ { 2 } , . . .$ . be i.i.d. random variables. Suppose that for some integer $n \geq 2$ , there exist constants $a > 0$ and $b \in \mathbb { R }$ such that

$$
X _ {1} + \dots + X _ {n} \stackrel {d} {=} a X _ {1} + b.\tag{U1}
$$

Let $\begin{array} { r } { \alpha = \frac { \ln n } { \ln a } } \end{array}$

(a). Prove: In the case $\alpha = 1$ and $b = 0$ , the characteristic function of $X _ { k }$ is

$$
\phi (t) = \exp \{i \mu t - \gamma | t | \}.
$$

(b). Prove: If we additionally assume $\mathbb { E } | X _ { 1 } | < \infty$ , prove that excluding the degenerate case, it is impossible to satisfy (U1) and $\alpha \leq 1$

Problem 6. Let $\xi$ and $\eta$ be independent random variables. If the sum $S = \xi + \eta$ and the diference $D = \xi - \eta$ are also independent, then $\xi$ and $\eta$ must follow normal distributions.
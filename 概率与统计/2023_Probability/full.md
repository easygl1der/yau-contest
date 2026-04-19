# S.-T. Yau College Student Mathematics Contests 2023

# Probability and Statistics

Solve every problem.

1. The sequence $( X _ { 1 } , X _ { 2 } , \ldots , X _ { n } , \ldots )$ is a Dirichlet process with base distribution $G _ { 0 }$ and concentration parameter $\alpha _ { 0 } > 0$ if $G _ { 0 }$ is a probability distribution on $R$ and satisfies:

• $X _ { 1 } \sim G _ { 0 }$   
• Conditional on $X _ { 1 } , X _ { 2 } , \ldots , X _ { n }$ , the distribution of $X _ { n + 1 }$ is $\textstyle \alpha _ { 0 } G _ { 0 } + \sum _ { i = 1 } ^ { n } \delta _ { X _ { i } }$ , appropriately normalized, where $\delta _ { x }$ is the Dirac measure with probability 1 on singleton $\{ x \}$ .

Assume that $G _ { 0 }$ has finite first and second moments.

(a) Derive the distribution of $X _ { n } , n \geq 1$   
(b) Let $Y _ { n } = I ( X _ { n } > 0 )$ . Prove or disprove $( Y _ { n } ) _ { n \geq 1 }$ forms a Dirichlet Process. If $( Y _ { n } ) _ { n \geq 1 }$ forms a Dirichlet Process, determine its concentration parameter and its base distribution.

2. Suppose $X$ and $Y$ are non-negative random variables on a probability space $( \Omega , { \mathcal { F } } , P )$ . Let $H ( x , y )$ be a function on $[ 0 , \infty ) ^ { 2 }$ such that $E ( | H ( X , Y ) | ) < \infty$ . Define function $\phi ( u ) = u / ( 1 + u )$ for $u \geq 0$ . For integer $n = 0 , 1 , 2 , \ldots$ , let

$$
U _ {n} = \sum_ {j = 1} ^ {2 ^ {n}} \frac {j - 1}{2 ^ {n}} I \left(\frac {j - 1}{2 ^ {n}} \leq \phi (X) <   \frac {j}{2 ^ {n}}\right), V _ {n} = E (H (X, Y) | U _ {n}).
$$

Prove or disprove that there exists a random variable $Z$ such that as $\textit { n } \to \infty$ , $V _ { n }$ converges to $Z$ almost surely. If there exists such a $Z$ , show the expression of $Z$ (in the sense of almost surely).

3. Let $X _ { 1 } , X _ { 2 } , \ldots , X _ { n }$ be a sequence of i.i.d. random variables with a uniform distribution on $( 0 , 1 )$ . Define the events $A _ { 1 } , A _ { 2 } , \ldots$ by

$$
A _ {n} = \{X _ {n} = \max  (X _ {1}, \ldots , X _ {n}) \}.
$$

Define $\begin{array} { r } { R _ { n } \ = \ \sum _ { k = 1 } ^ { n } I ( A _ { k } ) } \end{array}$ . Let $( m _ { n } )$ be a sequence of positive numbers such that $\scriptstyle \operatorname* { l l m } _ { n \to \infty } m _ { n } = \infty$ . Compute the following limit

$$
\lim _ {n \to \infty} P \Big (| R _ {n} - \log n | > m _ {n} \sqrt {\log n} \Big)
$$

4. Denote by $\boldsymbol { B }$ the Borel sigma field on the real line $R$ , and let $( \Omega , { \mathcal { F } } )$ be a measurable space. Define a mapping $Q ( t , A )$ for $t \in R$ and $A \in { \mathcal { F } }$ such that $Q ( t , \cdot )$ is a probability measure on $( \Omega , { \mathcal { F } } )$ for each $t \in R$ , and $Q ( \cdot , A )$ is a Borel function for each $A \in { \mathcal { F } }$ .

Denote by $\Pi$ a probability measure on $( R , B )$ , $P$ a probability measure on $( \Omega , { \mathcal { F } } )$ , and $T$ a random variable on $( \Omega , { \mathcal { F } } , P )$ . Assume that $\Pi$ , $P$ and $T$ satisfy $\Pi = P \circ T ^ { - 1 }$ , and for $A \in F$ ,

$$
P (A) = \int_ {R} Q (t, A) \Pi (d t),
$$

where $P \circ T ^ { - 1 }$ denotes the induced probability measure by $T$ . Prove or disprove the following statement:

$$
\mathrm {F o r a n y} A \in \mathcal {F}, P (A | T) = Q (T, A) \mathrm {a l m o s t s u r e l y}.
$$

5. Four statisticians I, II, III and IV play a sequence of games. For each game, the winning probabilities of I, II, III and IV are $( 1 - \theta ) / 2$ , $( 1 - \theta ) / 2$ , $\theta / 2$ and $\theta / 2$ , respectively, where $0 < \theta < 1$ . There is only one winner in each game and no tie is allowed. Assume that outcomes of games are independent of each other. For a fixed integer $r \geq 2$ , the stopping rule is to terminate as soon as one of the following conditions hold: (1) I and II together win $r$ games; (2) III and IV together win $r + 1$ games. At the time of termination, let $X _ { 1 }$ , $X _ { 2 }$ , $X _ { 3 }$ and $X _ { 4 }$ denote the numbers of games won by I, II, III and IV, respectively.

(a) Prove or disprove the statistic $T = \left( X _ { 1 } + X _ { 2 } , X _ { 3 } + X _ { 4 } \right)$ is complete.   
(b) Find a uniformly minimum variance unbiased estimator of $\theta$ .

6. A system of interest involves three random variables, $X$ , $Y$ , and $S$ , where $S$ has a Poisson distribution with mean $2 \lambda$ , for a parameter $\lambda > 0$ , and where $X$ and $Y$ are conditionally independent Bernoulli variables, given $S = s$ , with

$$
P (X = 1 | S = s) = \frac {1}{2 ^ {s + 1}} \mathrm {a n d} P (Y = 1 | S = s) = \frac {\theta}{2 ^ {s}},
$$

where $\theta \in ( 0 , 1 )$ is a second parameter. The random variable $S$ is unobservable.

We have $n$ i.i.d. copies $( X _ { i } , Y _ { i } )$ of $( X , Y )$ .

(a) An intuitive estimator for $\theta$ is ${ \hat { \theta } } _ { n } = { \bar { Y } } _ { n } / ( 2 { \bar { X } } _ { n } )$ , where $\begin{array} { r } { \bar { X } _ { n } = \frac { 1 } { n } \sum _ { i = 1 } ^ { n } X _ { i } } \end{array}$ and $\bar { Y } _ { n } =$ $\textstyle { \frac { 1 } { n } } \sum _ { i = 1 } ^ { n } Y _ { i }$ . Derive its asymptotic distribution.   
(b) Consider the hypothesis testing problem

$$
H _ {0}: \theta = 1 / 2 \quad \text {v e r s u s} \quad H _ {1}: \theta \neq 1 / 2.
$$

Construct an exact test statistic. As $\theta$ moves away from $1 / 2$ , describe all sources of increasing power that you can think of.
## All-around: Probability and statistics

Problem 1. Suppose that a study has N subjects, divided into two groups. For subject $i ( i = 1 , . . . , N )$ , let $Z _ { i }$ be the group assignment, with $Z _ { i } = 1$ being the treatment group and $Z _ { i } = 0$ being the control group, and $X _ { i }$ be the covariates. The propensity score of subject i is the probability of that subject being in the treatment group: $e ( X _ { i } ) = P ( Z _ { i } = 1 \mid X _ { i } )$ ). A metric for the similarity of the covariates distribution between the groups is the Bhattacharyya coefficient:

$$
\phi \equiv \int_ {0} ^ {1} \sqrt {f _ {1} (u) f _ {0} (u)} \mathrm{d} u,
$$

where $f _ { z } ( u )$ is the density of the propensity score in $\mathrm { g r o u p } z ( \mathrm { f o r } z = 0 , 1 )$ . Assume $e ( X ) \sim { \mathsf { B e t a } } ( a , b )$ , derive the Bhattacharyya coefficient ϕ as a function of $( a , b )$ . (Note: The pdf of Beta distribution: $\frac { \Gamma ( a + b ) } { \Gamma ( a ) \Gamma ( b ) } \dot { x ^ { a - 1 } ( 1 - x ) ^ { b - 1 } }$ where $\textstyle \Gamma ( z ) = \int _ { 0 } ^ { \infty } t ^ { z - 1 } e ^ { - t } d t$ is the Gamma function).

Problem 2. Let $X _ { t } : = e ^ { B _ { t } - \frac { t } { 2 } }$ , where $( B _ { t } ) _ { t \geq 0 }$ is a standard Brownian motion with $B _ { 0 } = 0$ . Find the distribution of $M : = \operatorname* { s u p } _ { t \geq 0 } X _ { t }$
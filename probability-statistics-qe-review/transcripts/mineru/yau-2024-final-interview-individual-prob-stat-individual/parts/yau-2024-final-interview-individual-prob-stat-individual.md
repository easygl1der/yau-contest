# Yau College Math Competition 2024 Final Probability and Statistics Individual Exam Problems (June 8-9, 2024)

Choose at least 3 from the following 4 problems.

Problem 1. Let $\{ X _ { i } \} _ { i \ge 0 }$ be iid with density function f and distribution function F . Define $N = \operatorname* { m i n } \{ n \geq 1 : X _ { n } > X _ { 0 } \}$

(1) Find the distribution function of $X _ { N }$

(2) If $\mathbb { E } | X _ { 0 } | < \infty$ , is it always true that $\mathbb { E } | X _ { N } | < \infty ?$ If yes, prove it; if not, give a counterexample.

Problem 2. A fair coin is tossed repeatedly and independently, and the outcome is denoted as $X _ { 1 } X _ { 2 } \cdots$ with $X _ { i } = H$ (head) or T (tail).

(1) Describe an idea about how to find the expected number of tosses required until a particular pattern of heads/tails appears.

(2) Evaluate the expected number of tosses to get the special pattern HT HH, i.e., evaluate <sup>E</sup>(N ), where $N = \operatorname* { m i n } \{ n \geq 4 : X _ { n - 3 } X _ { n - 2 } X _ { n - 1 } X _ { n } = H T H H \}$

Problem 3. Given a filtration $\{ { \mathcal F } _ { n } \}$ , i.e., ${ \mathcal { F } } _ { 1 } \subseteq { \mathcal { F } } _ { 2 } \subseteq \cdot \cdot \cdot \subseteq { \mathcal { F } }$ , we define ${ \mathcal { F } } _ { \infty } =$ $\sigma ( \cup _ { n = 1 } ^ { \infty } \mathcal { F } _ { n } )$

(1) Is it correct that $\textstyle { \mathcal { F } } _ { \infty } = \cup _ { n = 1 } ^ { \infty } { \mathcal { F } } _ { n } ?$ If not, please give a counterexample.

(2) Let X be a random variable which is F-measurable and integrable. Prove $\{ \mathbb { E } ( X | \mathcal { F } _ { n } ) \} _ { n \geq 1 }$ is uniformly integrable.

(3) Prove $\mathbb { E } ( X | { \mathcal F } _ { n } ) \to \mathbb { E } ( X | { \mathcal F } _ { \infty } )$ in $L ^ { 1 }$ , as n goes to infinity.

Problem 4. Consider the least squares problem. Assume Y is the n-dimensional outcome vector and X is the $n \times p$ covariate/design matrix. Assume X is full rank. We can run least squares of Y on X to obtain the usual estimator ${ \hat { \boldsymbol { \beta } } } .$ the residual vector ˆε, and the hat matrix $H = X ( X ^ { \mathrm { { T } } } X ) ^ { - 1 } X ^ { \mathrm { { T } } }$

Now we want to compute the least square coeficient $\hat { \beta } _ { [ i ] }$ by dropping the ith observation, $i = 1 , \ldots , n$ . Instead of running the least squares n times, can we obtain $\{ \hat { \beta } _ { [ i ] } , i = 1 , . . . , n \}$ from $\hat { \beta } , \hat { \varepsilon } , ( X ^ { \mathrm { T } } X ) ^ { - 1 }$ , and H, so that we only need to run the least squares only once?
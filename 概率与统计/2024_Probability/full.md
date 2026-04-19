# Probability and Statistics

1. There are $r$ players, with player $_ i$ initially having $n _ { i }$ units, $n _ { i } > 0$ , $i =$ $1 , \ldots , r$ . At each stage, two of the players are chosen to play a game, with the winner of the game receiving 1 unit from the loser. Any player whose fortune drops to 0 is eliminated, and this continues until a single player has all $\textstyle n = \sum _ { i = 1 } ^ { r } n _ { i }$ units, with that player designated as the winner. Note that the mechanism to choose two players at each stage is unknown. It can be either deterministic or random. Assume that the results of successive games are independent and that each game is equally likely to be won by either of its two players.

For any set of players $S \subseteq \{ 1 , \dots , r \}$ , let $X ( S )$ denote the number of games involving only members of $S$ . Does $E ( X ( S ) )$ depend on the player selection mechanism? If you think it doesn’t depend, calculate the expectation. If you think it depends, give two mechanisms leading to different expectations.

2. Let $X _ { 1 } , X _ { 2 } , \ldots$ be independent Bernoulli random variables satisfying $P ( X _ { i } =$ $1 ) \ : = \ : p$ and $P ( X _ { i } = - 1 ) = q = 1 - p$ for some $p \in \mathsf { \Gamma } ( 0 , 1 )$ . Let $S _ { n } ~ =$ $X _ { 1 } + \ldots + X _ { n }$ and $M = \operatorname* { s u p } _ { n \geq 1 } ( S _ { n } / n )$ .

(a) Calculate $P ( M = 0 )$ .   
(b) Show that $P ( p - q < M \leq 1 ) = 1$ . For any rational number $x \in$ $( p - q , 1 ]$ , is $P ( M = x ) > 0 ^ { * }$ ? If so, prove it. If not, find a point with zero probability.

3. Let $X$ have a uniform distribution on the interval [0,1] and let $N _ { m , k }$ be the digit in the $m$ th place to the right of the decimal point in $X ^ { k }$ .

(a) Find $\begin{array} { r } { \operatorname* { l i m } _ { m  \infty } P ( N _ { m , m } = i ) } \end{array}$ for $i = 0 , 1 , 2 , \ldots , 9$   
(b) Let $k ( m )$ be a function of $m$ , taking values greater than 1. Find a necessary and sufficient condition on $k ( m )$ such that $\begin{array} { r } { \operatorname* { l i m } _ { m  \infty } P ( N _ { m , k ( m ) } = } \end{array}$ $\begin{array} { r } { i ) = \frac { 1 } { 1 0 } } \end{array}$ for $i = 0 , 1 , 2 , \ldots , 9$ .

4. Assume we have $n$ observations: $( Y _ { i } , \pmb { x } _ { i } ) , ~ i = 1 , . ~ . ~ . , n$ , where $Y _ { i }$ is the random response and $\pmb { x } _ { i } = ( x _ { i 1 } , \cdots , x _ { i p } ) ^ { T }$ is a vector of $p$ fixed covariates for the $i$ th observation. Denote $\beta = ( \beta _ { 1 } , \cdots , \beta _ { p } )$ be a unknown $p$ -length vector of regression coefficients. Let $\begin{array} { r } { \theta _ { i } = \sum _ { j = 1 } ^ { p } x _ { i j } \beta _ { j } , \mu _ { i } = E ( Y _ { i } ) } \end{array}$ and $\sigma _ { i } ^ { 2 } =$ $V a r ( Y _ { i } )$ . Assume the density of $Y _ { i }$ belongs to the following exponential family:

$$
f \left(y _ {i}; \theta_ {i}\right) = \exp \left\{\theta_ {i} y _ {i} - b \left(\theta_ {i}\right) \right\}, \tag {1}
$$

where $b ^ { \prime } ( \theta _ { i } ) = \mu _ { i } , \ b ^ { ' \prime } ( \theta _ { i } ) = \sigma _ { i } ^ { 2 }$ . Suppose that all $\theta _ { i }$ ’s are contained in a compact subset of a space $\Theta$ . Let $\ell _ { n } ( \beta )$ be the log-likelihood function of the data, and let $\begin{array} { r } { H _ { n } ( \beta ) = - \frac { \partial ^ { 2 } \ell _ { n } ( \beta ) } { \partial \beta \partial \beta ^ { T } } } \end{array}$ ∂2`n(β)

Let $\mathcal { X }$ be the set of all $p$ covariates under consideration. Let $\alpha _ { 0 } \subset { \mathcal { X } }$ be the subset that contains and only contains all the important covariates affecting Y (the corresponding $\beta _ { j }$ ’s are nonzero). Let $\alpha$ be any subset of $\mathcal { X }$ , and let $\beta ( \alpha )$ be the vector of the components in $\beta$ that correspond to the covariates in $\alpha$ . Let $A = \{ \alpha : \alpha _ { 0 } \subset \alpha \}$ be the collection of models that including all important covariates. We assume:

(I) There exist positive constants $C _ { 1 } , C _ { 2 }$ such that for all sufficiently large $n$ ,

$$
C _ {1} <   \lambda_ {\min } \left\{\frac {1}{n} H _ {n} (\beta) \right\} <   \lambda_ {\max } \left\{\frac {1}{n} H _ {n} (\beta) \right\} <   C _ {2},
$$

where $\lambda _ { \mathrm { m i n } } \Big \{ { \textstyle \frac { 1 } { n } } H _ { n } ( \beta ) \Big \}$ and $\lambda _ { \mathrm { m a x } } \bigg \{ \frac { 1 } { n } H _ { n } ( \beta ) \bigg \}$ are the smallest and largest eigenvalues of $\scriptstyle { \frac { 1 } { n } } H _ { n } ( \beta )$ .

(II) For any given $\epsilon > 0$ , there exists a constant $\delta > 0$ such that, when $n$ is sufficiently large,

$$
(1 - \epsilon) H _ {n} (\boldsymbol {\beta} (\alpha)) \leq H _ {n} (\tilde {\boldsymbol {\beta}}) \leq (1 + \epsilon) H _ {n} (\boldsymbol {\beta} (\alpha))
$$

for all $\alpha \in A$ and $\tilde { \beta }$ satisfying $\| { \tilde { \beta } } - \beta ( \alpha ) \| \leq \delta$ .

For any model $\alpha$ , let $\hat { \beta } _ { \alpha }$ be the MLE of $\beta ( \alpha )$ based on this model. Show that

$$
\max _ {\alpha \in A} \| \hat {\boldsymbol {\beta}} _ {\alpha} - \boldsymbol {\beta} (\alpha) \| = O _ {p} (n ^ {- 1 / 3}).
$$

5. Consider a random sample of size $n$ , and write the data as an $\boldsymbol { r } = \boldsymbol { r } _ { n }$ by $c = c _ { n }$ matrix, $\{ X _ { i j } : i = 1 , \ldots , r _ { n } ; j = 1 , \ldots , c _ { n } \}$ with $\boldsymbol { \mathscr { n } } = \boldsymbol { \mathscr { r } } _ { n } \boldsymbol { c } _ { n }$ . To specify notation, $\{ X _ { i j } \}$ are i.i.d. with c.d.f. $F ( x )$ and continuous density $f ( x )$ . Let $\beta$ denote the median, i.e., $F ( \beta ) = 0 . 5$ . Define an estimator by

$$
\hat {\beta} _ {n} = \min  _ {j} \left\{\max  _ {i} \{X _ {i j} \} \right\}.
$$

(a) What is the condition on $r _ { n }$ when $n \to \infty$ for median-unbiasedness, i.e., $\beta$ is also the median for the distribution of ${ \hat { \beta } } _ { n }$ ?

(b) We further assume $F$ is differentiable in an open neighborhood of $\beta$ and has a positive derivative at $\beta$ . For $r _ { n }$ in (a), show that $r _ { n } ( { \hat { \beta } } _ { n } - \beta )$ converges in distribution, and find the limiting distribution function.
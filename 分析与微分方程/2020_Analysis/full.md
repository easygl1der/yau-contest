# Analysis and Differential Equations

Solve every problem.

Problem 1. Let $\chi$ be a real valued smooth function with compact support on $\mathbb { R }$ . We assume that

$$
\int_ {\mathbb {R} ^ {1}} \chi (x) d x = 1.
$$

For all $\varepsilon > 0$ , we define

$$
\chi_ {\varepsilon} (x) = \frac {1}{\varepsilon} \chi \left(\frac {x}{\varepsilon}\right).
$$

Prove that for any given $f \in L ^ { 1 } ( \mathbb { R } )$ , for almost every $x \in \mathbb { R }$ , we have

$$
\lim  _ {\varepsilon \rightarrow 0} (\chi_ {\varepsilon} * f) (x) = f (x).
$$

Problem 2. In last year’s Yau College Student Mathematics Contests, four students Tintin, Haddock, Dupont and Dupond made it to the last round of the oral exam in analysis. Professor Yau asked them to compute the Fourier coefficients of the $2 \pi$ -periodic function $F$ (defined on $\mathbb { R }$ ):

$$
\begin{array}{l} F: (0, 2 \pi) \to R, \\ x \mapsto F (x) = \arctan \left(\frac {x}{2 \pi} e ^ {\sin (x)} + x ^ {2 0 1 9} (x - 2 \pi) + 2 0 1 9 \sin (x)\right). \\ \end{array}
$$

Here were their solutions: for $k \neq 0$ ,

$$
\operatorname {T i n t i n}: \widehat {F} (k) = \frac {\cos (k \pi)}{| k | ^ {\frac {1}{2}}} + \frac {a}{| k |} + \frac {b}{| k | ^ {3}},
$$

Dupont : Fb(k ) = 1k + 1k 2 + fk 3 +

where $a , b , c , d , e , f , g , h _ { k } ( k \in \mathbb { Z } )$ were constants and $\sum _ { k \in \mathbb { Z } } | h _ { k } | ^ { 2 } < \infty .$

Whose solutions were correct?

Problem 3. Let $B _ { 1 }$ be the unit ball centered at the origin in $\mathbb { R } ^ { 4 }$ and $u \in W ^ { 1 , 2 } ( B _ { 1 } ) \cap C ^ { \infty } ( \mathbb { R } ^ { 4 } )$ be a nonnegative real valued function so that

$$
- \triangle u \leq u ^ {2},
$$

where $\triangle = \sum _ { i = 1 } ^ { 4 } \frac { \partial ^ { 2 } } { \partial x _ { i } ^ { 2 } }$ . Prove that, there exists a constant $\varepsilon > 0$ , so that if $\| u \| _ { L ^ { 2 } ( B _ { 1 } ) } \leq \varepsilon$ , we have

$$
\| \nabla u \| _ {L ^ {2} \left(B _ {\frac {1}{2}}\right)} \leq 1 0 0 0 0 \| u \| _ {L ^ {2} \left(B _ {1}\right)},
$$

where $B _ { \frac { 1 } { 2 } }$ is the ball of radius $\frac { 1 } { 2 }$ centered at the origin.

Problem 4. Let $f$ and $g$ be two holomorphic functions defined on the entire complex plane $\mathbb { C }$ so that for all $z \in \mathbb { C }$ , we have

$$
f (z) ^ {2 0 2 0} + g (z) ^ {2 0 2 0} = 1.
$$

Prove that $f$ and $g$ are constants.

Problem 5. We consider the following ordinary differential equation:

$$
\left\{ \begin{array}{l} x ^ {\prime \prime} (t) + x (t) + x (t) ^ {3} = 0, \\ (x (0), x ^ {\prime} (0)) = (x _ {0}, 0), \end{array} \right.
$$

where $x ( t )$ takes values in $\mathbb { R }$ . Prove that for all $x _ { 0 } \in \mathbb { R }$ , the solution of the above system is periodic.

Problem 6. Let $\alpha \in \mathbb { R }$ and $a _ { k } \in \mathbb { C }$ with $\left| a _ { k } \right| < 1$ , where $k = 1 , 2 , \ldots , n$ . We consider the following αholomorphic map

$$
\begin{array}{l} f: \mathbb {C} - \left\{\left(\overline {{a _ {1}}}\right) ^ {- 1}, \dots , \left(\overline {{a _ {n}}}\right) ^ {- 1} \right\}\rightarrow \mathbb {C}, \\ z \mapsto f (z) = e ^ {2 \sqrt {- 1} \pi \alpha} z \cdot \frac {z - a _ {1}}{1 - \overline {{a _ {1}}} z} \dots \frac {z - a _ {n}}{1 - \overline {{a _ {n}}} z}. \\ \end{array}
$$

Let $\mathbf { S } ^ { 1 }$ be the unit circle in $\mathbb { C }$ , i.e.,

$$
\mathbf {S} ^ {1} = \left\{z \in \mathbb {C} \mid | z | = 1 \right\}.
$$

Prove that $f$ maps $\mathbf { S } ^ { 1 }$ to itself and $f$ preserves the surface measure (i.e., d in terms of standard polar coordiantes of $\mathbb { R } ^ { 2 }$ ) of $\mathbf { S } ^ { 1 }$ .
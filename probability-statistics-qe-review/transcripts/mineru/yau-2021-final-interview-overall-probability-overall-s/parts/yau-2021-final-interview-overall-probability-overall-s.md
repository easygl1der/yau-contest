# Yau College Math Competition 2021 Final Probability and Statistics Individual Overall Exam Problems (May 30, 2021)

Problem 1. Let $X _ { 1 } , X _ { 2 } , \cdots , X _ { n }$ be independent exponential random variables with parameter 1, and $X _ { ( 1 ) } , X _ { ( 2 ) } , \cdots , X _ { ( n ) }$ be their order statistics. Let $X _ { ( 0 ) } = 0$

(1) Find the joint density function of

$$
Y _ {k} = (n + 1 - k) \left(X _ {(k)} - X _ {(k - 1)}\right), \quad k = 1, 2, \dots , n.
$$

(2) Find the limit

$$
\lim _ {n \to \infty} \mathbb {P} \left(X _ {(n)} - \ln n \leq x\right).
$$

(3) Find the limit

$$
\lim _ {n \to \infty} \int_ {0} ^ {\infty} \mathbb {P} \left(X _ {(n)} - \ln n > x\right) \mathrm{d} x.
$$

Solution

(1) Notice that the joint density function of $X _ { ( 1 ) } , X _ { ( 2 ) } , \cdots , X _ { ( n ) }$ is

$$
h (x _ {1}, \dots , x _ {n}) = \left\{ \begin{array}{l l} n! e ^ {- \sum_ {i = 1} ^ {n} x _ {i}}, & \text { if } \quad x _ {1} \leq x _ {2} \leq \dots \leq x _ {n}, \\ 0, & \text { otherwise }. \end{array} \right.
$$

Let $x _ { 0 } = 0$ and define

$$
y _ {k} = (n + 1 - k) \left(x _ {k} - x _ {k - 1}\right), \quad k = 1, 2, \dots , n,
$$

then

$$
x _ {k} = \sum_ {i = 1} ^ {k} \frac {y _ {i}}{n - i + 1}, \qquad k = 1, 2, \dots , n,
$$

and the Jacobian is $1 / n !$ . So the density function of $Y _ { 1 } , \cdots , Y _ { n }$ is $e ^ { - \sum _ { i = 1 } ^ { n } y _ { i } }$

(2) Since

$$
\mathbb {P} (X _ {(n)} \leq x) = (1 - e ^ {- x}) ^ {n},
$$

we have

$$
\mathbb {P} (X _ {(n)} \leq x + \ln n) = \left(1 - \frac {e ^ {- x}}{n}\right) ^ {n} \stackrel {{n \to \infty}} {{\longrightarrow}} e ^ {- e ^ {- x}}.
$$

(3) According to the above two steps and the lack-of-memory property, we have

$$
\mathbb {E} (X _ {(n)}) = 1 + \frac {1}{2} + \dots + \frac {1}{n}.
$$

Consequently,

$$
\lim _ {n \rightarrow \infty} \int_ {0} ^ {\infty} \mathbb {P} (X _ {(n)} - \ln n > x) d x = \lim _ {n \rightarrow \infty} \mathbb {E} (X _ {(n)} - \ln n) = \lim _ {n \rightarrow \infty} \left(1 + \frac {1}{2} + \dots + \frac {1}{n} - \ln n\right) = \gamma .
$$

Problem 2. Let $\{ X _ { n } \} _ { n \geq 1 }$ be i.i.d. random variables such that $\mathbb { P } ( X _ { 1 } ~ = ~ 1 ) ~ = ~ 1 -$ $\mathbb { P } ( X _ { 1 } = - 1 ) = p > \frac { 1 } { 2 }$ . Let $S _ { 0 } = 0 , S _ { n } = \textstyle \sum _ { i = 1 } ^ { n } X _ { i }$ . Define the range of $\{ S _ { n } \} _ { n \ge 0 }$ by ${ R _ { n } } = \# \{ S _ { 0 } , S _ { 1 } , S _ { 2 } , \cdot \cdot \cdot , S _ { n } \}$ , which is the number of distinct points visited by the random walk $\{ S _ { n } \} _ { n \ge 0 }$ up to time n.

(1) Prove $\mathbb { E } ( R _ { n } ) = \mathbb { E } ( R _ { n - 1 } ) + P ( S _ { 1 } S _ { 2 } \cdot \cdot \cdot S _ { n } \neq 0 ) , \quad n = 1 , 2 , \cdot \cdot \cdot$

(2) Find $\begin{array} { r } { \operatorname* { l i m } _ { n \to \infty } \frac { 1 } { n } \mathbb { E } ( R _ { n } ) } \end{array}$

Solutions

(1)

$$
\begin{array}{l} P (R _ {n} = R _ {n - 1} + 1) = P (S _ {n} \notin \{S _ {0}, S _ {1}, \dots S _ {n - 1} \}) \\ \qquad = P (S _ {n} \neq S _ {0}, S _ {n} \neq S _ {1}, \dots , S _ {n} \neq S _ {n - 1}) \\ \qquad = P (X _ {1} + X _ {2} + \dots + X _ {n} \neq 0, X _ {2} + X _ {3} + \dots + X _ {n} \neq 0, \dots , X _ {n} \neq 0) \\ \qquad = P (X _ {1} \neq 0, X _ {1} + X _ {2} \neq 0, \dots , X _ {1} + X _ {2} + \dots + X _ {n} \neq 0) \quad (\text {by i.i.d}) \\ \qquad = P (S _ {1} S _ {2} \dots S _ {n} \neq 0). \end{array}
$$

Thus

$$
\mathbb {E} (R _ {n}) = \mathbb {E} (R _ {n - 1}) + P (S _ {1} S _ {2} \dots S _ {n} \neq 0).
$$

(2) Using the above relation recursively, one has

$$
\frac {1}{n} \mathbb {E} (R _ {n}) = \frac {1}{n} + \frac {1}{n} \sum_ {k = 1} ^ {n} P (S _ {1} S _ {2} \dots S _ {k} \neq 0) \stackrel {{n \rightarrow \infty}} {{\longrightarrow}} P (S _ {k} \neq 0, \forall k \geq 1).
$$

On the other hand, according to law of large numbers,

$$
\lim _ {n \to \infty} \frac {S _ {n}}{n} = 2 p - 1 > 0, \quad \mathrm{a.s.}
$$

Thus

$$
\begin{array}{c} P (S _ {k} \neq 0, \forall k \geq 1) = P (S _ {k} > 0, \forall k \geq 1) \\ = \lim _ {n \to \infty} P (S _ {k} > 0, k = 1, 2, \dots , n) \end{array}
$$

By the reflection principle,

$$
P (S _ {k} > 0, k = 1, 2, \dots , n) = \frac {1}{n} \mathbb {E} (S _ {n} \vee 0) \stackrel {n \to \infty} {\longrightarrow} 2 p - 1.
$$

Thus $\begin{array} { r } { \operatorname* { l i m } _ { n \to \infty } \frac { 1 } { n } \mathbb { E } ( R _ { n } ) = 2 p - 1 } \end{array}$
# Applied Math. and Computational Math. Team

Please solve as many problems as you can!

1. (15 pts)

Given a finite positive (Borel) measure $d \mu$ on [0, 1], define its sequence of moments as follows

$$
c _ {j} = \int_ {0} ^ {1} x ^ {j} d \mu (x), \quad j = 0, 1, \dots .
$$

Show that the sequence is completely monotone in the sense that that

$$
(I - S) ^ {k} c _ {j} \geq 0 \quad \mathrm {f o r a l l} j, k \geq 0,
$$

where $S$ denotes the backshift operator given by $S c _ { j } = c _ { j + 1 }$ for $j \geq 0$ .

2. (20 pts)

We recall that a polynomial

$$
f (X) = a _ {d} X ^ {d} + a _ {d - 1} X ^ {d - 1} + \dots + a _ {1} X + a _ {0} \in \mathbb {Z} [ X ]
$$

is called an Eisenstein polynomial if for some prime p we have

(i) $p \mid a _ { i }$ for $i = 0 , \ldots , d - 1$ ,   
(ii) $p ^ { 2 } \nmid a _ { 0 }$   
(iii) $p \nmid a _ { d }$

Eisenstein polynomials are well-know to be irreducible over Z, so they can be used to construct explicit examples of irreducible polynomials.

# Questions:

(i) Prove that a composition $f ( g ( X ) )$ of two Eisenstein polynomials $f$ and $g$ is an Eisenstein polynomial again.   
(ii) Suggest a multivariate generalisation of the Eisenstein polynomials. That is, describe a class polynomials $F ( X _ { 1 } , \ldots , X _ { m } )$ in terms of the divisibility properties of their coefficients that are guaranteed to be irreducible.

3. (20 pts) For solving the following partial differential equation

$$
u _ {t} + f (u) _ {x} = 0, \quad 0 \leq x \leq 1 \tag {1}
$$

where $f ^ { \prime } ( u ) \geq 0$ , with periodic boundary condition, we can use the following semi-discrete discontinuous Galerkin method: Find $u _ { h } ( \cdot , t ) \in$ $V _ { h }$ such that, for all $v \in V _ { h }$ and $j = 1 , 2 , \cdots , N$ ,

$$
\int_ {I _ {j}} \left(u _ {h}\right) _ {t} v d x - \int_ {I _ {j}} f \left(u _ {h}\right) v _ {x} d x + f \left(\left(u _ {h}\right) _ {j + 1 / 2} ^ {-}\right) v _ {j + 1 / 2} ^ {-} - f \left(\left(u _ {h}\right) _ {j - 1 / 2} ^ {-}\right) v _ {j - 1 / 2} ^ {+} = 0, \tag {2}
$$

with periodic boundary condition

$$
(u _ {h}) _ {1 / 2} ^ {-} = (u _ {h}) _ {N + 1 / 2} ^ {-}; \quad (u _ {h}) _ {N + 1 / 2} ^ {+} = (u _ {h}) _ {1 / 2} ^ {+}, \tag {3}
$$

where $h = \operatorname* { m a x } _ { j } ( x _ { j + 1 / 2 } - x _ { j - 1 / 2 } )$ ${ \cal I } _ { j } \ : = \ : ( x _ { j - 1 / 2 } , x _ { j + 1 / 2 } )$ , $v _ { j + 1 / 2 } ^ { \pm } = v ( x _ { j + 1 / 2 } ^ { \pm } , t )$ , $0 = x _ { 1 / 2 } < x _ { 3 / 2 } < \dots < x _ { N + 1 / 2 } = 1$ , and ,

$V _ { h } = \{ v : v | _ { I _ { j } }$ is a polynomial of degree at most $k$ for $1 \leq j \leq N \}$ .

Prove the following $L ^ { 2 }$ stability of the scheme

$$
\frac {d}{d t} E (t) \leq 0 \tag {4}
$$

where $\begin{array} { r } { E ( t ) = \int _ { 0 } ^ { 1 } ( u _ { h } ( x , t ) ) ^ { 2 } d x } \end{array}$

4. Consider the linear system $A x = b$ . The GMRES method is a projection method which obtains a solution in the $m$ -th Krylov subspace $K _ { m }$ so that the residual is orthogonal to $A K _ { m }$ . Let $r _ { 0 }$ be the initial residual and let $v _ { 0 } = r _ { 0 }$ . The Arnoldi process is applied to build an orthonormal system $v _ { 1 } , v _ { 2 } , \cdots , v _ { m - 1 }$ with $v _ { 1 } = A v _ { 0 } / \| A v _ { 0 } \|$ . The approximate solution is obtained from the following space

$$
K _ {m} = \operatorname {s p a n} \left\{v _ {0}, v _ {1}, \dots , v _ {m - 1} \right\}.
$$

(i) (5 points) Show that the approximate solution is obtained as the solution of a least-square problem, and that this problem is triangular.

(ii) (5 points) Prove that the residual $r _ { k }$ is orthogonal to $\{ v _ { 1 } , v _ { 2 } , \cdots , v _ { k - 1 } \}$   
(iii) (5 points) Find a formula for the residual norm.   
(iv) (5 points) Derive the complete algorithm.

5. (10 pts)

(i) Set $x _ { 0 } = 0$ . Write the recurrence

$$
x _ {k} = 2 x _ {k - 1} + b _ {k}, \quad k = 1, 2, \dots , n,
$$

in a matrix form $A { \overrightarrow { x } } = { \overrightarrow { b } }$ . For $b _ { 1 } = - 1 / 3$ , $b _ { k } = ( - 1 ) ^ { k } , k =$ $2 , 3 , \cdots , n$ , verify that $x _ { k } \ = \ ( - 1 ) ^ { k } / 3 , k \ = \ 1 , 2 , \cdot \cdot \cdot , n$ is the exact solution.

(ii) Find $A ^ { - 1 }$ and compute condition number of $A$ in $L ^ { 1 }$ norm.
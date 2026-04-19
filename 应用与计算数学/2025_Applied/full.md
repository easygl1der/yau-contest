# S.-T. Yau College Student Mathematics Contests 2025

# Computational and Applied Mathematics (6 problems)

Problem 1 We consider the multipoint iteration method

$$
x _ {k + 1} = x _ {k} - \alpha \frac {f (x _ {k})}{f ^ {\prime} \left(x _ {k} - \beta f (x _ {k}) / f ^ {\prime} (x _ {k})\right)},
$$

where $\alpha$ and $\beta$ are arbitrary parameters, for solving the equation $f ( x ) = 0$ . Determine the values $\alpha$ and $\beta$ such that the multipoint method achieves the highest possible order of convergence for finding $\xi$ , a simple root of $f ( x ) = 0$ .

Problem 2 Compute the spectral radius of the matrix $\mathbf { A } ^ { - 1 }$ , where

$$
\mathbf {A} = \left[ \begin{array}{c c c c c c c c} 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\ 1 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\ 0 & 1 & 0 & 1 & 0 & 0 & 0 & 0 \\ 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0 \\ 0 & 0 & 0 & 1 & 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 0 & 1 & 0 & 1 & 0 \\ 0 & 0 & 0 & 0 & 0 & 1 & 0 & 1 \\ 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 \end{array} \right].
$$

Problem 3 Let the ordinary Legendre polynomial of degree $k$ be denoted $P _ { k } ( x )$ for $k \geq 0$ . The associated Legendre functions are defined as

$$
P _ {k} ^ {m} = (- 1) ^ {m} (1 - x ^ {2}) ^ {m / 2} \frac {d ^ {m}}{d x ^ {m}} P _ {k} (x), \quad m > 0, \quad k \geq m.
$$

(Note that despite the name, for odd $m$ they are not actually polynomials.)

(a) Consider the interpolation problem of finding coefficients $a _ { k }$ such that

$$
\sum_ {k = 1} ^ {N} a _ {k} P _ {k} ^ {1} (x _ {i}) = y _ {i}, \quad i = 1, \dots , N.
$$

Prove that this linear system of equations for the unknown coefficients $a _ { k }$ is nonsingular provided that the interpolation points $\{ x _ { i } \}$ exclude $\pm 1$ and are distinct.

(b) Consider the approximation problem of finding coefficients $a _ { k }$ to minimize the squared approximation error

$$
\left| \left| f (x) - \sum_ {k = 1} ^ {N} a _ {k} P _ {k} ^ {1} (x) \right| \right| _ {2} ^ {2},
$$

where the $L ^ { 2 }$ norm is taken over $x \in [ - 1 , 1 ]$ . Derive the linear system for the coefficients $a _ { k }$ and explain why it is nonsingular.

(c) Let $\mathbf { M }$ be the coefficient matrix from part (b). Prove that $\mathbf { M } _ { k , j } = 0$ when $k + j$ is odd.

Problem 4 Given a set of column vectors $y _ { 1 } , \ldots , y _ { n } \in \mathbb { R } ^ { m }$ , let $\mathcal { V } = \operatorname { s p a n } \{ y _ { 1 } , . . . , y _ { n } \} \subset \mathbb { R } ^ { m }$ . How can we find $\ell \leq \dim \nu$ orthonormal vectors $\{ \psi _ { i } \} _ { i = 1 } ^ { \ell }$ in $\mathbb { R } ^ { m }$ that minimize

$$
J (\psi_ {1}, \ldots , \psi_ {\ell}) = \sum_ {j = 1} ^ {n} \left\| y _ {j} - \sum_ {i = 1} ^ {\ell} (y _ {j} ^ {\top} \psi_ {i}) \psi_ {i} \right\| ^ {2},
$$

where $\| y \| = \sqrt { y ^ { \top } y }$ is the Euclidean norm?

Problem 5 Consider the initial-value problem

$$
\begin{array}{l} \frac {\partial u}{\partial t} + u = \frac {\partial^ {2} u}{\partial x ^ {2}}, \quad - \infty <   x <   \infty , \quad 0 <   t \leq T, \\ u (x, 0) = u _ {0} (x), \quad - \infty <   x <   \infty \\ \end{array}
$$

where $T$ is a fixed positive real number, and $u _ { 0 }$ is a real-valued continuous function on $\mathbb { R }$ . Consider the $\theta$ -scheme

$$
\begin{array}{l} \frac {U _ {j} ^ {m + 1} - U _ {j} ^ {m}}{\Delta t} + [ \theta U _ {j} ^ {m + 1} + (1 - \theta) U _ {j} ^ {m} ] \\ = \theta \frac {U _ {j + 1} ^ {m + 1} - 2 U _ {j} ^ {m + 1} + U _ {j - 1} ^ {m + 1}}{(\Delta x) ^ {2}} + (1 - \theta) \frac {U _ {j + 1} ^ {m} - 2 U _ {j} ^ {m} + U _ {j - 1} ^ {m}}{(\Delta x) ^ {2}} \\ \end{array}
$$

for $j \in \mathbb Z$ , $m = 0 , . . . , M - 1$ , where $\Delta x > 0$ and $\Delta t = T / M$ , $M \geq 1$ , and $U _ { j } ^ { 0 } = u _ { 0 } ( j \Delta t )$ , $j \in \mathbb Z$ .

(a) Define the $\ell _ { \infty }$ -norm as $\vert \vert U ^ { m } \vert \vert _ { \ell _ { \infty } } : = \operatorname* { m a x } _ { j \in \mathbb { Z } } \vert U _ { j } ^ { m } \vert$ , and assume that $| | U ^ { 0 } | | _ { \ell _ { \infty } }$ is finite. Prove that for $\theta \in [ 0 , 1 ]$ ,

$$
| | U ^ {m} | | _ {\ell_ {\infty}} \leq \left(\frac {1 - (1 - \theta) \Delta t}{1 + \theta \Delta t}\right) ^ {m} | | U ^ {0} | | _ {\ell_ {\infty}},
$$

holds for all $1 \leq m \leq M$ , provided that $\begin{array} { r } { A ( \theta ) \Delta t \leq \frac { ( \Delta x ) ^ { 2 } } { 2 + ( \Delta x ) ^ { 2 } } } \end{array}$ , where $A ( \theta )$ is a constant, depending on the choice of $\theta$ , which you should determine.

(b) Define the $\ell _ { 2 }$ -norm as $\begin{array} { r } { \vert \vert U ^ { m } \vert \vert _ { \ell _ { 2 } } : = \left( \Delta x \sum _ { j \in \mathbb { Z } } | U _ { j } ^ { m } | ^ { 2 } \right) ^ { 1 / 2 } } \end{array}$ and suppose that $| | U ^ { m } | | _ { \ell _ { 2 } }$ is finite.

• For $\theta \in [ \frac { 1 } { 2 } , 1 ]$ , show that $\| U ^ { m } \| _ { \ell _ { 2 } } \leq \| U ^ { 0 } \| _ { \ell _ { 2 } }$ holds for any $\Delta t , \Delta x > 0$ and all $1 \leq m \leq$ $M$ .   
• For $\theta \in [ 0 , \frac { 1 } { 2 } )$ ), prove that $\| U ^ { m } \| _ { \ell _ { 2 } } \leq \| U ^ { 0 } \| _ { \ell _ { 2 } }$ under the condition $\begin{array} { r } { B ( \theta ) \Delta t \leq \frac { 2 ( \Delta x ) ^ { 2 } } { 4 + ( \Delta x ) ^ { 2 } } } \end{array}$ , where $B ( \theta )$ is a constant, depending on the choice of $\theta$ , which you should determine.

Problem 6 Consider the stiff system of ordinary differential equations:

$$
\frac {d \mathbf {y}}{d t} = \mathbf {f} (t, \mathbf {y}), \quad \mathbf {y} (0) = \mathbf {y} _ {0}
$$

where $\mathbf { y } = { \binom { y _ { 1 } } { y _ { 2 } } }$ , $\mathbf { y } _ { 0 } = { \binom { 2 } { 1 } }$ , and

$$
\mathbf {f} (t, \mathbf {y}) = \left( \begin{array}{c} - 1 0 0 0 y _ {1} + 9 9 9 y _ {2} \\ - y _ {2} \end{array} \right)
$$

(a) Find the exact solution $\mathbf { y } ( t ) = { \binom { y _ { 1 } ( t ) } { y _ { 2 } ( t ) } }$ .

(b) For the explicit Euler method:

$$
\mathbf {y} _ {n + 1} = \mathbf {y} _ {n} + h \mathbf {f} \left(t _ {n}, \mathbf {y} _ {n}\right)
$$

determine the absolute stability region and prove divergence when $h > 0 . 0 0 2$ .

(c) For the implicit Euler method:

$$
\mathbf {y} _ {n + 1} = \mathbf {y} _ {n} + h \mathbf {f} \left(t _ {n + 1}, \mathbf {y} _ {n + 1}\right)
$$

prove unconditional stability for any $h > 0$ .

(d) For the trapezoidal rule:

$$
\mathbf {y} _ {n + 1} = \mathbf {y} _ {n} + \frac {h}{2} [ \mathbf {f} (t _ {n}, \mathbf {y} _ {n}) + \mathbf {f} (t _ {n + 1}, \mathbf {y} _ {n + 1}) ]
$$

analyze its stability.
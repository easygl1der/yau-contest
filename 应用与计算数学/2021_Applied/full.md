# Computational and Applied Mathematics

Solve every problem.

# Problem 1.

(a) Show that

$$
T _ {n} (x) = \cos (n \arccos x), \quad x \in [ - 1, 1 ],
$$

is a polynomial of degree $n$ with extrema at

$$
x _ {k} = \cos \left(k \frac {\pi}{n}\right), \quad k = 0, 1, \dots , n
$$

and leading coefficient $2 ^ { n - 1 }$ .

(b) Show that if $f \in C ^ { n + 1 } [ - 1 , 1 ]$ and if $P ( x )$ is the polynomial with degree at most $n$ that interpolates $f$ at $x _ { k }$ , $k = 0 , 1 , \ldots , n$ then

$$
\left\| f (x) - P (x) \right\| _ {\infty} \leq \frac {1}{2 ^ {n - 1} (n + 1) !} \left\| f ^ {n + 1} \right\| _ {\infty}.
$$

Problem 2. Let $S ( x )$ be a cubic spline with knots $\{ t _ { i } \} _ { i = 0 } ^ { n }$ . If it is determined that $S ( x )$ is linear over $[ t _ { 1 } , t _ { 2 } ]$ and $[ t _ { 3 } , t _ { 4 } ]$ . Prove that $S ( x )$ is also linear over $\left[ t _ { 2 } , t _ { 3 } \right]$ .

Problem 3. Let $f : \mathbf { R }  \mathbf { R }$ be defined by $f ( x ) = 2 x - \cos x$ .

(a) Prove that the equation $f ( x ) = 0$ has a unique solution $x ^ { * } \in \mathbb { R }$ that lies in the interval $\textstyle { \bigl ( } { \frac { 1 } { 4 } } , { \frac { 1 } { 2 } } { \bigr ) }$   
(b) Prove that the sequence defined by the fixed point iteration

$$
x _ {0},
$$

$$
x _ {n} = \frac {1}{2} \cos x _ {n - 1}, \quad n = 1, 2, \dots .
$$

converges to $x ^ { * }$ with any initial guess $x _ { 0 }$

(c) For the fixed point iteration in (b) with $\begin{array} { r } { x _ { 0 } = \frac { \pi } { 6 } } \end{array}$ , determine an $n$ that guarantees $\textstyle | x _ { n } - x ^ { * } | < { \frac { 1 } { 2 } } \times 1 0 ^ { - 8 }$ For the fixed point iteration in (b) with $x _ { 0 } = 2 0$ , determine an $n$ that guarantees $\begin{array} { r } { | x _ { n } - x ^ { * } | < \frac { 1 } { 4 } } \end{array}$ .

Problem 4. Let matrix $\mathbf { A } \in \mathbf { R } ^ { \mathbf { m } \times \mathbf { n } }$ with $m \geq n$ and $r = \mathrm { r a n k } ( \mathbf { A } ) < n$ , and assume $A$ has the following SVD decomposition

$$
\mathbf {A} = [ \mathbf {U _ {1}}, \mathbf {U _ {2}} ] \left[ \begin{array}{c c} \Sigma_ {\mathbf {1}} & \mathbf {0} \\ \mathbf {0} & \mathbf {0} \end{array} \right] [ \mathbf {V} _ {1}, \mathbf {V} _ {2} ] ^ {T} = \mathbf {U} _ {1} \Sigma_ {\mathbf {1}} \mathbf {V} _ {1} ^ {T},
$$

where $\Sigma _ { 1 }$ is $r \times r$ nonsingular and $\mathbf { U } _ { 1 }$ and $\mathbf { V } _ { 1 }$ have $r$ columns. Let $\sigma = \sigma _ { \mathrm { m i n } } ( \Sigma _ { 1 } )$ the smallest nonzero σsingular value of A. Consider the following least square problem, for some $ { \mathbf { b } } \in  { \mathbf { R } } ^ {  { \mathbf { m } } }$ ,

$$
\min  _ {\mathbf {x} \in \mathbf {R} ^ {n}} \| \mathbf {A x} - \mathbf {b} \| _ {2}.
$$

(a) Show that all solutions x can be written as

$$
\mathbf {x} = \mathbf {V} _ {1} \boldsymbol {\Sigma} _ {1} ^ {- 1} \mathbf {U} _ {1} ^ {\mathrm {T}} \mathbf {b} + \mathbf {V} _ {2} \mathbf {z} _ {2},
$$

with $\mathbf { z } _ { 2 }$ an arbitrary vector.

(b) Show that the solution x has minimal norm $\left\| \mathbf { x } \right\| _ { 2 }$ precisely when $\mathbf { z } _ { 2 } = \mathbf { 0 }$ , and in which case,

$$
\| \mathbf {x} \| _ {2} \leq \frac {\| \mathbf {b} \| _ {2}}{\sigma}.
$$

Problem 5. Consider the family of semi-implicit Runge-Kutta methods

$$
\begin{array}{l} k _ {1} = f \left(y _ {n} + \beta h k _ {1}\right), \quad k _ {2} = f \left(y _ {n} + h k _ {1} + \beta h k _ {2}\right), \\ y _ {n + 1} = y _ {n} + h \left(\left(\frac {1}{2} + \beta\right) k _ {1} + \left(\frac {1}{2} - \beta\right) k _ {2}\right). \\ \end{array}
$$

(a) Determine the order and the principal part of the local truncation error.   
(b) Show that if $\beta > \frac { 1 } { 2 }$ , then the negative real axis $\{ z : \mathbf { R e } ( z ) < 0 , \mathbf { I m } ( z ) = 0 \}$ is contained in the region of β >absolute stability of the method.

Problem 6. Consider the Beam equation from mechanics with boundary conditions that model a cantilever beam:

$$
\begin{array}{l} u ^ {(4)} = f (x), \quad x \in (0, 1), \\ u (0) = u ^ {\prime} (0) = u ^ {\prime \prime} (1) = u ^ {\prime \prime \prime} (1) = 0. \tag {1} \\ \end{array}
$$

(a) Recast this equation into a variational problem, stating the trial and test function spaces.   
(b) Interpret the variational problem as an energy minimization problem, clearly stating the energy functional. Prove that the variational problem and the energy minimization problems are equivalent.   
(c) Develop a CG(3) (cubic continuous Galerkin method) finite element method for this problem.   
(d) Prove an a priori error estimate for this method in the energy norm:

$$
\left\| e \right\| _ {E} = \left(\int_ {0} ^ {1} \left(e ^ {\prime \prime}\right) ^ {2} d x\right) ^ {\frac {1}{2}},
$$

Where $e = u ( x ) - U ( x )$ , in which, $u ( x )$ is the exact solution to VP (variational problem), $U ( x )$ is the FEM (finite element method) solution.

(e) Prove an a priori error estimate for this method in the $L _ { 2 }$ norm:

$$
\| e \| _ {L _ {2}} =: \| e \| = \left(\int_ {0} ^ {1} e ^ {2} d x\right) ^ {\frac {1}{2}}.
$$
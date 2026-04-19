# S.-T. Yau College Student Mathematics Contests 2022

# Computational and Applied Mathematics

Solve every problem.

Problem 1. Consider $\left\{ p _ { i } ( x ) \right\} _ { i = 0 } ^ { \infty }$ , a family of orthogonal polynomials associated with the inner product

$$
\langle f, g \rangle = \int_ {- 1} ^ {1} f (x) g (x) w (x) d x, \quad w (x) > 0 \quad \mathrm {f o r} x \in (- 1, 1),
$$

where $p _ { i } ( x )$ is a polynomial of degree ??. Let $x _ { 0 } , x _ { 1 } , \ldots , x _ { n }$ be the roots of $p _ { n + 1 } ( x )$ . Construct an orthonormal basis in the subspace of the polynomials of degree no more than $n$ such that, for any polynomial in this subspace, the coefficients of its expansion into the basis are equal to the scaled values of this polynomial at the nodes $x _ { 0 } , x _ { 1 } , \ldots , x _ { n }$ .

Problem 2. Consider a 2D fixed point iteration of the form

$$
x _ {k + 1} = f \left(x _ {k}, y _ {k}\right), y _ {k + 1} = g \left(x _ {k}, y _ {k}\right). \tag {1}
$$

Assume that the vector-valued function $\vec { H } ( x , y ) = ( f ( x , y ) , g ( x , y ) ) ^ { T }$ is continuously-differentiable, and the infinity norm of the Jacobian matrix is less than 1 at a unique fixed point $( x _ { \infty } , y _ { \infty } )$ .

Now consider a new iteration:

$$
x _ {k + 1} = f \left(x _ {k}, y _ {k}\right), \quad y _ {k + 1} = g \left(x _ {k + 1}, y _ {k}\right). \tag {2}
$$

Prove that iteration (2) is convergent, to the same fixed point as iteration (1), for the initial conditions sufficiently close to the fixed point.

Problem 3. Let $A \in \mathbf { R } ^ { \mathbf { m } \times \mathbf { m } }$ be a matrix with entries $a _ { i j }$ which satisfy

$$
a _ {i i} \geq \sum_ {j \neq i} | a _ {i j} | + 2, \quad a _ {i i} \leq 7.
$$

(a) Prove that $A ^ { - 1 }$ exists.   
(b) Prove that $\| A \| _ { \infty }$ is the max row sum (of absolute values) of $A$ .   
(c) Find both a lower and upper bound for $\| A \| _ { \infty }$   
(d) Now assume $A = A ^ { T }$ . Find bounds for $\| A \| _ { 2 }$ and $\| A ^ { - 1 } \| _ { 2 }$ .

Problem 4. Consider a system of ODE initial value problems of the form:

$$
\frac {d}{d t} u = f (u), \quad u (0) = u _ {0}.
$$

Assume that $f ( u )$ has the property that the forward Euler (FE) method:

$$
U ^ {n + 1} = U ^ {n} + k f (U ^ {n}),
$$

satisfies

$$
\| U ^ {n + 1} \| \leq \| U ^ {n} \|
$$

for some norm $\| \cdot \|$ and for all time-steps $k$ , $0 < k \leq k _ { F E }$ . Now consider the 2-stage Runge-Kutta method:

$$
\begin{array}{l} U ^ {(1)} = U ^ {n} + k \beta_ {1 0} f (U ^ {n}), \\ U ^ {n + 1} = \left\{\alpha_ {2 0} U ^ {n} + k \beta_ {2 0} f (U ^ {n}) \right\} + \left\{\alpha_ {2 1} U ^ {(1)} + k \beta_ {2 1} f (U ^ {(1)}) \right\} \\ \end{array}
$$

where

$$
\beta_ {1 0} \geq 0, \quad \beta_ {2 0} \geq 0, \quad \beta_ {2 1} \geq 0, \quad \alpha_ {2 0} \geq 0, \quad \alpha_ {2 1} \geq 0, \quad \alpha_ {2 0} + \alpha_ {2 1} = 1.
$$

(a) Prove that the above 2-stage Runge-Kutta method also satisfies the inequality:

$$
\| U ^ {n + 1} \| \leq \| U ^ {n} \|
$$

under some appropriate time-step restriction: $0 \leq k \leq k ^ { * }$ , where you need to explicitly determine $k ^ { * }$ in terms of $k _ { F E }$ .

(b) Explicitly determine the coefficients:

$$
\beta_ {1 0}, \quad \beta_ {2 0}, \quad \beta_ {2 1}, \quad \alpha_ {2 0}, \quad \alpha_ {2 1},
$$

so that

(i) The method is second-order accurate; and   
(ii) The maximum allowed time-step, $k ^ { * }$ , is as large as possible.

Problem 5. Construct a third-order accurate Lax-Wendroff-type method for $u _ { t } + a u _ { x } = 0$ $[ a > 0$ is a constant) in the following way:

(a) • Expand $u ( t + k , x )$ in a Taylor series and keep the first four terms. Replace all time derivatives by spatial derivatives using the equation.   
• Construct a cubic polynomial passing through the points $U _ { j - 2 } ^ { n } , U _ { j - 1 } ^ { n } , U _ { j } ^ { n } , U _ { j + 1 } ^ { n } .$   
• Approximate the spatial derivatives in the Taylor series by the exact derivatives of the above constructed cubic polynomial.

(b) Verify that the truncation error is $O ( k ^ { 3 } )$ if $h = O ( k )$ .

Problem 6. Suppose you have $\$ 60 K$ to invest and there are 3 investment options available. You must invest in multiples of $\$ 10K$ . If $d _ { i }$ dollars are invested in investment ?? then you receive a net value (as the profit) of $r _ { i } ( d _ { i } )$ dollars. For $d _ { i } > 0$ we have

$$
\begin{array}{l} r _ {1} (d _ {1}) = (7 d _ {1} + 2) \times 1 0, \\ r _ {2} (d _ {2}) = (3 d _ {2} + 7) \times 1 0, \\ r _ {3} (d _ {3}) = (4 d _ {3} + 5) \times 1 0, \\ \end{array}
$$

and $d _ { 1 } ( 0 ) = d _ { 2 } ( 0 ) = d _ { 3 } ( 0 )$ . All are measured in $\$ 10K$ dollars. The objective is to maximize the net value of your

investments. This can be formulated as a linear programming problem:

$$
\max _ {d _ {1}, d _ {2}, d _ {3}} r _ {1} (d _ {1}) + r _ {2} (d _ {2}) + r _ {3} (d _ {3}),
$$

$$
\text {s u c h t h a t} \quad d _ {1} + d _ {2} + d _ {3} \leq 6,
$$

$$
d _ {i} \geq 0 \quad i = 1, 2, 3 \quad \text {a r e i n t e g e r s}.
$$
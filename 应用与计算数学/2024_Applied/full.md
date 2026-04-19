# S.-T. Yau College Student Mathematics Contests 2024

# Computational and Applied Mathematics

1. Let $A \in \mathbb { R } ^ { n \times n }$ be a non-singular matrix. Let $u$ , $v \in \mathbb { R } ^ { n }$ be column vectors. Define the rank 1 perturbation $\stackrel { \triangledown } { \boldsymbol { A } } = \boldsymbol { A } + u \boldsymbol { v } ^ { T }$ .

(a) Derive a necessary and sufficient condition for $\widehat { A }$ to be invertible.   
(b) Let $x$ , $z$ and $b$ be column vectors in $\mathbb { R } ^ { n }$ . Suppose one can solve $A z = b$ with ${ \mathcal { O } } ( n )$ floating-point operations (flops). Under the conditions derived in(a), design an algorithm to solve ${ \widehat { A } } x = b$ with ${ \mathcal { O } } ( n )$ flops, and provide justification for your answer.

2. Consider the integral

$$
\int_ {0} ^ {\infty} f (x) d x
$$

where $f$ is continuous, $f ^ { \prime } ( 0 ) \neq 0$ , and $f ( x )$ decays like $x ^ { - 1 - \alpha }$ with $\alpha > 0$ in the limit $x \to \infty$ .

(a) Suppose you apply the equispaced composite trapezoid rule with $n$ subintervals to approximate

$$
\int_ {0} ^ {L} f (x) d x.
$$

What is the asymptotic error formula for the error in the limit $n  \infty$ with $L$ fixed?

(b) Suppose you consider the quadrature from (a) to be an approximation to the full integral from 0 to $\infty$ . How should $L$ increase with $n$ to optimize the asymptotic rate of total error decay? What is the rate of error decrease with this choice of L? 5

(c) Make the following change of variable $x = { \frac { L ( 1 + y ) } { 1 - y } }$ L(1 + y) , $y = { \frac { x - L } { x + L } }$ x − L in the original integral to obtain

$$
\int_ {- 1} ^ {1} F _ {L} (y) d y.
$$

Suppose you apply the equispaced composite trapezoid rule; what is the asymptotic error formula for fixed $L$ ?

(d) Depending on $\alpha$ , which method - domain truncation or change-of-variable - is preferable?

3. Consider the Chebyshev polynomial of the first kind

$$
T _ {n} (x) = \cos (n \theta), \quad x = \cos (\theta), \quad x \in [ - 1, 1 ].
$$

The Chebyshev polynomials of the second kind are defined as

$$
U _ {n} (x) = \frac {1}{n + 1} T ^ {\prime} (x), \quad n \geq 0.
$$

(a) Derive a recursive formula for computing $U _ { n } ( x )$ for all $n \geq 0$ .   
(b) Show that the Chebyshev polynomials of the second kind are orthogonal with respect to the inner product

$$
\langle f, g \rangle = \int_ {- 1} ^ {1} f (x) g (x) \sqrt {1 - x ^ {2}} d x
$$

(c) Derive the 2-point Gaussian Quadrature rule for the integral

$$
\int_ {- 1} ^ {1} f (x) \sqrt {1 - x ^ {2}} d x = \sum_ {j = 1} ^ {2} w _ {j} f (x _ {j})
$$

4. Consider the boundary value problem

$$
- \frac {d}{d x} \left(a (x) \frac {d u}{d x}\right) = f (x), \quad u (0) = u (1) = 0
$$

where $a ( x ) > \delta \geq 0$ is a bounded differentiable function in $[ 0 , 1 ]$ . We assume that, although $a ( x )$ is available, an expression for its derivative, $\frac { d a } { d x }$ is not available.

(a) Using finite differences and an equally spaced grid in $\lfloor 0 , 1 \rfloor$ , $x _ { l } = h l , l = 0 , \ldots , n$ and $h = 1 / n$ , we discretize the ODE to obtain a linear system of equations, yielding an $O ( h ^ { 2 } )$ approximation of the ODE. After the application of the boundary conditions, the resulting coefficient matrix of the linear system is an $( n - 1 ) \times ( n - 1 )$ tridiagonal matrix.

Provide a derivation and write down the resulting linear system (by giving the expressions of the elements).

(b) Utilizing all the information provided, find a disc in $\mathbb { C }$ , the smaller the better, that is guaranteed to contain all the eigenvalues of the linear system constructed in part (a).

5. (a) Verify that the PDE

$$
u _ {t} = u _ {x x x}
$$

is well posed as an initial value problem.

(b) Consider solving it numerically using the scheme

$$
\frac {u (t + k , x) - u (t - k , x)}{2 k} = \frac {- \frac {1}{2} u (x - 2 h , t) + u (x - h , t) - u (x + h , t) + \frac {1}{2} u (x + 2 h , t)}{h}.
$$

Determine this scheme’s stability condition.

6. Consider the diffusion equation

$$
\frac {\partial v}{\partial t} = \mu \frac {\partial^ {2} v}{\partial x ^ {2}}, \quad v (x, 0) = \phi (x), \quad \int_ {a} ^ {b} v (x, t) d x = 0
$$

with $x \in [ a , b ]$ and periodic boundary conditions. The solution is to be approximated using the central difference operator $L$ for the 1D Laplacian.

$$
L v _ {m} = \frac {v _ {m + 1} - 2 v _ {m} + v _ {m - 1}}{h ^ {2}},
$$

and the following two finite different approximations, (i) Forward-Euler

$$
v _ {n + 1} = v _ {n} + \mu k L v _ {n}, \tag {1}
$$

and (ii) Crank-Nicolson

$$
v _ {n + 1} = v _ {n} + \mu k \left(L v _ {n} + L v _ {n + 1}\right). \tag {2}
$$

Throughout, consider $[ a , b ] = [ 0 , 2 \pi ]$ and the finite difference stencil to have periodic boundary conditions on the spatial lattice $[ 0 , h , 2 h , \ldots , ( N - 1 ) h ]$ where $h = { \frac { 2 \pi } { N } }$ and $N$ is even.

(a) Determine the order of accuracy of the central difference operator $\mathit { L v }$ in approximating the second derivative $v _ { x x }$ .   
(b) Using $v _ { m } ^ { n } = \sum _ { l = 0 } ^ { N - 1 } \hat { v } _ { l } ^ { n } \exp \left( - i \frac { 2 \pi l m } { N } \right)$ vˆ give the updates $\hat { v } _ { l } ^ { n + 1 }$ in terms of $\hat { v } _ { l } ^ { n }$ for each of the methods, including the case $l = 0$ .   
(c) Give the solution for $v _ { m } ^ { \pi }$ for each method when the initial condition is $\phi ( m \Delta x ) =$ $( - 1 ) ^ { m }$ .   
(d) What are the stability constraints on the time step $k$ for each of the methods, if any, in equations (1) and (2)? Show there are either no constraints or express them in the form $k \leq F ( h , \mu )$ .
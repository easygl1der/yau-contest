# QUALIFY EXAM FOR APPLIED MATHEMATICS

(1) (20 points) The n-th Chebyshev polynomial is defined by: $T _ { n } ( x ) = \cos ( n { \cdot } \operatorname { a r c c o s } ( x ) )$ Answer the following questions related to $T _ { n } ( x )$

(i) (6 points) Prove that $T _ { n } ( x )$ is a polynomial of degree n.

(ii) (6 points) For any x with $0 < x < 1$ , show that $T _ { n } ( 2 x - 1 ) = T _ { 2 n } ( { \sqrt { x } } )$

(iii) (8 points) Prove that the system of Chebyshev polynomials $\{ T _ { k } : 0 \leq k < n \}$ } is orthogonal with respect to the discrete inner product $\begin{array} { r } { ( u , v ) = \sum _ { k = 1 } ^ { n } u ( x _ { k } ) v ( x _ { k } ) } \end{array}$ where $\{ x _ { k } \}$ are the Chebyshev points $\begin{array} { r } { x _ { k } = \cos ( \frac { 2 k - 1 } { 2 n } \pi ) } \end{array}$

(2) (15 points) Let A be a symmetric positive definite matrix. Assume that the conjuage gradient method is applied to solve the linear system $A x = b$ , where $x ^ { * }$ is the exact solution.

(i) (10 points) Prove the following error estimate:

$$
| | x _ {k} - x ^ {*} | | _ {A} \leq \left(\frac {\sqrt {\kappa_ {2} (A)} - 1}{\sqrt {\kappa_ {2} (A)} + 1}\right) ^ {k} | | x _ {0} - x ^ {*} | | _ {A},
$$

where $x _ { k }$ is the solution obtained by the k-th iteration, $| | \cdot | | _ { A }$ denotes the Anorm defined by $\| x \| _ { A } = { \sqrt { x ^ { * } A x } }$ , and $\begin{array} { r } { \kappa _ { 2 } ( A ) = \frac { \operatorname* { m a x } \lambda ( A ) } { \operatorname* { m i n } \lambda ( A ) } } \end{array}$ denotes the condition number of A under the $l _ { 2 }$ norm. (If you apply any theorem from approximation theory, please state the theorem clearly. No need to prove that theorem.)

(ii) (5 points) Describe one Krylov subspace method for non-Hermitian matrices $( A \neq A ^ { * } )$ . (You can use pseudo-code or words/formulas as long as the steps are clear.)

(3) (15 points) Consider Kepler’s equation

$$
f (x) = x - \epsilon \sin x - \eta , (0 <   | \epsilon | <   1), \eta \in \mathbb {R}.
$$

(i) (5 points) Show that for each $\epsilon , \eta ,$ there is exactly one real root $\alpha = \alpha ( \epsilon , \eta )$ Furthermore, $\eta - | \epsilon | \leq \alpha \leq \eta + | \epsilon | ,$

(ii) (5 points) Writing the equation in fixed point form:

$$
x = \varphi (x), \varphi (x) = \epsilon \sin x + \eta ,
$$

show that the fixed point iteration $x _ { n + 1 } = \varphi ( x _ { n } )$ converges for arbitrary staring value $x _ { 0 }$

(iii) (5 points) Let m be an integer such that $m \pi < \eta < ( m + 1 ) \pi$ . Show that Newton’s method with starting value

$$
x _ {0} = \left\{ \begin{array}{l l} (m + 1) \pi & \text {if} (- 1) ^ {m} \epsilon > 0, \\ m \pi & \text {otherwise}, \end{array} \right.
$$

is guaranteed to converge (monotonically) to $\alpha ( \epsilon , \eta )$

(4) (15 points) For the system

$$
u _ {t} = v _ {x}, \quad v _ {t} = u _ {x},
$$

analyze the truncation error and stability of the scheme

$$
\frac {1}{\tau} \left(u _ {j} ^ {n + 1} - \frac {1}{2} (u _ {j + 1} ^ {n} + u _ {j - 1} ^ {n})\right) = \frac {1}{2 h} (v _ {j + 1} ^ {n} - v _ {j - 1} ^ {n}),
$$

$$
\frac {1}{\tau} \left(v _ {j} ^ {n + 1} - \frac {1}{2} (v _ {j + 1} ^ {n} + v _ {j - 1} ^ {n})\right) = \frac {1}{2 h} (u _ {j + 1} ^ {n} - u _ {j - 1} ^ {n}).
$$

(5) (15 points) Write and prove the maximum principle of the centered finite diference scheme for discretizing the equation

$$
u _ {x x} + u _ {y y} + d (x, y) u _ {x} + e (x, y) u _ {y} + f (x, y) u = 0, \quad f <   0,
$$

under some suitable assumptions.

Remark: You can choose either (6) or (7). The points will be decided as max((6), (7)).

(6) (20 points) Consider the following boundary value problem for $y = y ( x )$ on $[ 0 , 1 ]$ as $0 < \epsilon \ll 1$ 2

$$
\epsilon y ^ {\prime \prime} + \epsilon (1 + x) ^ {2} y ^ {\prime} - y = x - 1, y (0) = \alpha , y (1) = - 1.
$$

(i) (10 points) Suppose $\alpha = 1$ . Construct a composite expansion of the above problem and sketch the solution.

(ii) (5 points) Construct a composite expansion of the above problem for $\alpha = 0 .$

(iii) (5 points) What is the accuracy of your solution in $\epsilon ?$ Formally explain your conclusion. Consider the first case only.

(7) (20 points) Let $f : \mathbb { R } ^ { n }  \mathbb { R }$ be convex and define $\partial f ( x )$ to be the subgradient set of f at x.

(i) (10 points) If $x \in$ int dom $\cdot f ,$ prove that $\partial f ( x )$ is nonempty and bounded.

(ii) (5 points) Assume $f = \| x \| _ { 1 } = \sum _ { i = 1 } ^ { n } | x _ { i } |$ , write down the $\partial f ( x )$

(iii) (5 points) Given $y \in \mathbb { R } ^ { n }$ and $\lambda > 0$ , calculate the closed form solution of the problem:

$$
\min _ {x} \frac {1}{2} \| x - y \| _ {2} ^ {2} + \lambda \| x \| _ {1}.
$$
# S.-T. Yau College Student Mathematics Contests 2016

# Applied Math. and Computational Math. Individual (5 problems)

Problem 1. Consider the implicit leapfrog scheme

$$
\frac {u _ {m} ^ {n + 1} - u _ {m} ^ {n - 1}}{2 k} + a \left(1 + \frac {h ^ {2}}{6} \delta^ {2}\right) ^ {- 1} \delta_ {0} u _ {m} ^ {n} = f _ {m} ^ {n}
$$

for the one-way wave equation

$$
u _ {t} + a u _ {x} = f.
$$

Here $\delta ^ { 2 }$ is the central second difference operator, and $\delta _ { 0 }$ is the central first difference operator.

(1) show that the scheme is of order $( 2 , 4 )$ .   
(2) show that the scheme is stable if and only if $\vert \frac { a k } { h } \vert < \frac { 1 } { \sqrt { 3 } }$

Problem 2. A simple version of an enzyme-mediate chemical reaction process is given by

$$
\mathrm {S} + \mathrm {E} \xrightarrow [ k _ {2} ]{k _ {1}} \mathrm {C} \xrightarrow [ k _ {3} ]{k _ {3}} \mathrm {P} + \mathrm {E}
$$

where $S$ is the substrate reactant and $P$ is the concentration of the desired product. An enzyme (or catalyst) $E$ is a compound whose special property is that it allows for intermediate reaction steps that lead to a the overall reaction,

$$
\mathrm {S} \longrightarrow \mathrm {P}.
$$

Assume the initial conditions

$$
S (0) = S _ {0}, \quad E (0) = E _ {0}, \quad C (0) = 0, \quad P (0) = 0;
$$

$\boldsymbol { k } _ { 1 } , \boldsymbol { k } _ { 2 } , \boldsymbol { k } _ { 3 }$ are reaction rate constants.

(a) Convert the chemical reaction equation into a system of rate equations (ODEs) for $S ( T )$ , $E ( T )$ , $C ( T )$ , and $P ( T )$ where $T$ is the dimensional time. Nondimensionalize the equations using the scalings

$$
T = t / (k _ {1} E _ {0}), \quad S (T) = S _ {0} s (t), \quad P (T) = S _ {0} p (t), \quad E (T) = E _ {0} s (t), \quad C (T) = E _ {0} c (t),
$$

$$
\epsilon = \frac {E _ {0}}{S _ {0}} \ll 1, \quad \lambda = \frac {k _ {2}}{k _ {1} S _ {0}}, \quad \mu = \frac {k _ {2} + k _ {3}}{k _ {1} S _ {0}}.
$$

(b) Use the expansions $s ( t ) = s _ { 0 } ( t ) + \epsilon s _ { 1 } ( t ) + O ( \epsilon ^ { 2 } )$ , $c ( t ) = c _ { 0 } ( t ) + \epsilon c _ { 1 } ( t ) + O ( \epsilon ^ { 2 } )$ , etc to determine the equations for the leading order slow solution. Show that $s _ { 0 } ( t )$ and $p _ { 0 } ( t )$ satisfies the following Michaelis-Menten equations

$$
\dot {s} _ {0} (t) = - (\mu - \lambda) \frac {s _ {0}}{\mu + s _ {0}}, \quad \dot {p} _ {0} (t) = (\mu - \lambda) \frac {s _ {0}}{\mu + s _ {0}}.
$$

Problem 3. We say that a vector $\mathbf { u } = ( u _ { 1 } , \ldots , u _ { n } ) \in \mathbb { N } ^ { n }$ is multiplicatively dependent if there is a non-zero vector $\mathbf { k } = ( k _ { 1 } , \ldots , k _ { n } ) \in \mathbb { Z } ^ { n }$ for which

$$
u _ {1} ^ {k _ {1}} \dots u _ {n} ^ {k _ {n}} = 1. \tag {1}
$$

This notion plays a very important role in many number theoretic algorithms, such as factorisation and primality testing. It also (in a more general form) appears in some questions in algebraic dynamics. However the algorithm to decide whether $\mathbf { u }$ is multiplicatively dependent is not immediately obvious. The following statement informally means that if $\mathbf { u }$ is multiplicatively dependent the exponents $k _ { 1 } , \ldots , k _ { n }$ can be chosen to be reasonably small. Prove that if $\mathbf { u } = ( u _ { 1 } , \ldots , u _ { n } ) \in \mathbb { N } ^ { n }$ is multiplicatively dependent with $\| \mathbf { u } \| _ { \infty } \leq H$ where $\left\| \mathbf { u } \right\| _ { \infty } = \operatorname* { m a x } _ { 1 \leq i \leq n } \left| u _ { i } \right|$ , then there is a non-zero vector $\mathbf { k } = ( k _ { 1 } , \ldots , k _ { n } ) \in \mathbb { Z } ^ { n }$ with

$$
\| \mathbf {k} \| _ {\infty} \leq \left(\frac {2 n \log H}{\log 2}\right) ^ {n - 1}
$$

(and hence for a fixed $n$ it can be found in polynomial time of order $( \log H ) ^ { n ( n - 1 ) } )$

Comment: To solve this problem, you can use the following statement (without proof) which informally means that if a system of homogeneous equations with integer coefficients has a nontrivial solution then it has an integer solutions with reasonably small components. It is required in many applications.

Let A = (aij )i,j=1 $A = ( a _ { i j } ) _ { i , j = 1 } ^ { m , n }$ m,n be an $m \times n$ matrix of rank $r \leq n - 1$ with integer entries of size at most $H$ , that is,

$$
| a _ {i j} | \leq H, 1 \leq i \leq m, 1 \leq j \leq n.
$$

Then there is an integer non-zero vector $\mathbf { x } = ( x _ { 1 } , \ldots , x _ { n } ) \in \mathbb { Z } ^ { n }$ such that $A \mathbf { x } = \mathbf { 0 }$ and

$$
\| \mathbf {x} \| _ {\infty} \leq (2 n H) ^ {n - 1}
$$

where $\left\| \mathbf { x } \right\| _ { \infty } = \operatorname* { m a x } _ { 1 \leq i \leq n } \left| x _ { i } \right|$ .

Problem 4. Consider a symmetric matrix $A _ { n \times n }$ , and let $\lambda _ { i }$ be a simple eigenvalue of $A$ with

$$
| \lambda_ {j} - \lambda_ {i} | = O (1), \quad j \neq i.
$$

In inverse iteration of compute eigenvalue and eigenvector, one needs to solve the following linear system

$$
(A - \mu I) y _ {k + 1} = x _ {k},
$$

where $\mu$ is an approximation of eigenvalue $\lambda _ { i }$ , $\| x _ { k } \| = 1$ and obtain

$$
x _ {k + 1} = \frac {y _ {k + 1}}{\| y _ {k + 1} \|}.
$$

However, for $\mu$ close to $\lambda _ { i }$ , $A - \mu I$ has a very small eigenvalue and the linear system will be ill-conditioned. So there may be large error in the numerical solution to the linear system, denoted by $\tilde { y } _ { k + 1 }$ . Even though we may get large error in $\tilde { y } _ { k + 1 }$ , the $\tilde { { x } } _ { k + 1 }$ we get from $\begin{array} { r } { \tilde { x } _ { k + 1 } = \frac { \tilde { y } _ { k + 1 } } { \| \tilde { y } _ { k + 1 } \| } } \end{array}$ is accurate.

(1) $\tilde { y } _ { k + 1 }$ satisfies

$$
(A - \mu I + \delta A) \tilde {y} _ {k + 1} = x _ {k},
$$

where $\| \delta A \| = O ( \epsilon )$ and $\epsilon$ is the machine precision. Show that

$$
\left(A - \lambda_ {i}\right) \frac {\tilde {y} _ {k + 1}}{\| \tilde {y} _ {k + 1} \|} \| \leq | \mu - \lambda_ {i} | + \| \delta A \| + \frac {1}{\| \tilde {y} _ {k + 1} \|}.
$$

(2) Let $\alpha _ { i } = x _ { k } ^ { t } q _ { i }$ , where $q _ { i }$ is the normalized eigenvector corresponding to $\lambda _ { i }$ . Show that

$$
\left\| \tilde {y} _ {k + 1} \right\| \geq \frac {\left| \alpha_ {i} \right|}{\left| \mu - \lambda_ {i} \right| + \left\| \delta A \right\|}.
$$

(3) Conclude that

$$
\left\| x _ {k + 1} - (\pm) q _ {i} \right\| = O \big (| \lambda_ {i} - \mu | + \epsilon \big).
$$

Problem 5. A function $f : \mathbb { R } ^ { n } \to \mathbb { R }$ in $C ^ { 2 }$ is called strongly convex if its Hessian matrix satisfies $\nabla ^ { 2 } f \succeq m I$ for some $m > 0$ . Show that the following statements are equivalent:

(a) $f$ is strongly convex, i.e. $\nabla ^ { 2 } f ( x ) \succeq m I$ for all $x \in \mathbb { R } ^ { n }$   
(b) For any $t \in [ 0 , 1 ]$ , any $x , y \in \mathbb { R }$

$$
f (t x + (1 - t) y) \leq t f (x) + (1 - t) f (y) - \frac {m}{2} t (1 - t) \| x - y \| ^ {2};
$$

(c) $\begin{array} { r } { \langle \nabla f ( x ) - \nabla f ( y ) , x - y \rangle \geq m \| x - y \| ^ { 2 } \mathrm { ~ f o r ~ a n y ~ } x , y \in \mathbb { R } ^ { n } . } \end{array}$ $\langle \nabla f ( x ) - \nabla f ( y ) , x - y \rangle \geq m \| x - y \| ^ { 2 }$
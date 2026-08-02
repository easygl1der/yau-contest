# PROBLEMS FOR TEAM CONTEST

## ANSWER ALL QUESTIONS

Problem 1. The following statement informally means that if a system of homogeneous equations with integer coeficients has a nontrivial solution then it has an integer solutions with reasonably small components. It is required in many applications.

Let $A = ( a _ { i j } ) _ { i , j = 1 } ^ { m , n }$ be an $m \times n$ matrix of rank $r \leq n - 1$ with integer entries of size at most $H$ , that is,

$$
\left| a _ {i j} \right| \leq H, \quad 1 \leq i \leq m, 1 \leq j \leq n.
$$

(i) Show that for $K \geq 0$ there are at most $( 2 K + 1 ) ^ { n }$ vectors $\mathbf { x } \in \mathbb { Z } ^ { n }$ with

$$
\| \mathbf {x} \| _ {\infty} \leq K,
$$

where $\left\| \mathbf { x } \right\| _ { \infty } = \operatorname* { m a x } _ { 1 \leq i \leq n } \left| x _ { i } \right| .$

(ii) $\mathrm { A p p l y \ ( i ) }$ and Dirichlet’s pigeon hole principle to prove that there is an integer non-zero vector $\mathbf { x } = ( x _ { 1 } , \ldots , x _ { n } ) \in \mathbb { Z } ^ { n }$ such that $A \mathbf { x } = \mathbf { 0 }$ and

$$
\| \mathbf {x} \| _ {\infty} \leq (2 n H) ^ {n - 1}.
$$

Problem 2. Let $u ( x ) , a ( x )$ and $f ( x )$ be smooth functions on $[ 0 , 1 ]$ (i) Determine the order of accuracy of the following approximation

$$
\frac {d}{d x} \left[ a (x) \frac {d u}{d x} \right] \Bigg | _ {x = x _ {i}} \simeq \frac {(a _ {i + 1} + a _ {i}) (u _ {i + 1} - u _ {i}) - (a _ {i} + a _ {i - 1}) (u _ {i} - u _ {i - 1})}{2 h ^ {2}}
$$

where $\textstyle h = { \frac { 1 } { m + 1 } }$ is the mesh size, $x _ { i } = i h , a _ { i } = a ( x _ { i } )$ , and $u _ { i } = u ( x _ { i } )$ for $i = 1 , \cdots , m$ such that $x _ { m + 1 } = 1$

(ii) For given functions $a ( x ) > 0$ and $f ( x )$ , one determines the function u that solves the following second order ordinary diferential equation

$$
u - \frac {d}{d x} \left[ a (x) \frac {d u}{d x} \right] = f (x)
$$

with boundary conditions $u ( 0 ) = 0$ and $u ( 1 ) = 0$ . Apply the discretization given in (i) and let $f _ { i } = f ( x _ { i } )$ . Denote the linear system that one has to solve by $A \mathbf { u } = \mathbf { f }$ where $A \in \mathbb { R } ^ { m \times m }$ and u, $\mathbf { f } \in \mathbb { R } ^ { m }$ . If Gauss-Seidel method is used to solve this linear system, show that the iterative method converges for any initial guess.

Problem 3. Maximal entropy principle. Consider probability distributions on a discrete random variable X taking on possible values of $x _ { 1 } , x _ { 2 } , \ldots , x _ { n }$ . Denote the probability $\operatorname* { P r } ( X = x _ { i } ) = p _ { i } , i = 1 , \dots , n$ and recall that its Shannon entropy S is

$$
S = - \sum_ {i = 1} ^ {n} p _ {i} \log p _ {i}
$$

Now suppose we have some knowledge of $p _ { 1 } , \ldots , p _ { n } .$ , specified in terms of its expectation values $E _ { j }$ with respects to k known functions $f _ { j } ( \cdot )$ of the random variable X

$$
\sum_ {i = 1} ^ {n} p _ {i} f _ {j} (x _ {i}) = E _ {j}, \qquad j = 1, 2, \dots , k <   n.
$$

(i) Show that the probability distribution $p = [ p _ { 1 } , \dotsc , p _ { n } ]$ that maximized the entropy S has the form of an exponential family:

$$
p _ {i} = \frac {e ^ {\sum_ {j = 1} ^ {k} \lambda_ {j} f _ {j} (x _ {i})}}{Z}
$$

where $\lambda _ { j }$ are all constants, and $Z$ is the normalization constant given by

$$
Z = \sum_ {i = 1} ^ {n} e ^ {\sum_ {j = 1} ^ {k} \lambda_ {j} f _ {j} (x _ {i})}
$$

(ii) Show that the constants $\lambda _ { j }$ are related to $E _ { j }$ by

$$
E _ {j} = \frac {\partial \log Z}{\partial \lambda_ {j}}.
$$
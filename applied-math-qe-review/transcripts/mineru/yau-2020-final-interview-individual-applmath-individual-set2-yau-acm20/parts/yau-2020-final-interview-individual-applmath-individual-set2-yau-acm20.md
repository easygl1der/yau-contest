## Question I

Let $A \in \mathbb { R } ^ { n \times n }$ be a symmetric matrix and let $q _ { 1 } \in \mathbb { R } ^ { n }$ satisfy $\| q _ { 1 } \| _ { 2 } = 1$ . Consider the following iteration:

$$
\begin{array} { r l } & { r _ { 0 } = q _ { 1 } , \quad \beta _ { 0 } = 1 , \quad q _ { 0 } = 0 , \quad k : = 0 } \\ & { \mathrm { w h i l e } \quad \beta _ { k } \neq 0 } \\ & { \quad q _ { k + 1 } : = r _ { k } / \beta _ { k } } \\ & { \quad k : = k + 1 } \\ & { \quad \alpha _ { k } : = q _ { k } ^ { T } A q _ { k } } \\ & { \quad r _ { k } : = \left( A - \alpha _ { k } I \right) q _ { k } - \beta _ { k - 1 } q _ { k - 1 } } \\ & { \quad \beta _ { k } : = \| r _ { k } \| _ { 2 } } \\ & { \mathrm { e n d } } \end{array}
$$

Let $K _ { k } = \operatorname { s p a n } \{ q _ { 1 } , A q _ { 1 } , \cdot \cdot \cdot , A ^ { k - 1 } q _ { 1 } \}$ and $Q _ { k } = [ q _ { 1 } \cdots q _ { k } ]$ be a matrix whose columns are $\{ q _ { i } \} _ { i = 1 } ^ { k }$ obtained from the above iteration.

1. Assume that the iteration does not terminate. Show that $Q _ { k }$ has orthonormal columns, and that they span $K _ { k }$

2. What is the purpose of this algorithm? Justify your answer.

## Question II

Consider the oscillatory second order ordinary diferential equation (ODE)

$$
y ^ { \prime \prime } ( t ) + \lambda ^ { 2 } y ( t ) + g ( y ( t ) ) = 0 , \qquad 0 < t \leq T ,
$$

with the initial data

$$
y ( 0 ) = \alpha , \qquad y ^ { \prime } ( 0 ) = \beta ,
$$

where $\lambda > > 1$ , α and $\beta$ are given constants, and $g ( y )$ is a given Lipschitz continuous function.

Choose a time step $\tau > 0$ and denote $t _ { n } = n \tau$ for $n \geq 0$ . Let $y ^ { n }$ be the numerical approximation of $y ( t _ { n } )$ for $n \geq 0$

1. Re-write the above ODE into its equivalent integral formulation near $t = t _ { n }$ with $t = t _ { n } + s$ for $s \in \mathbb { R }$ via the variation-of-constant formula.

2. Based on the integral formulation, design the following time integrator via proper numerical quadratures

$$
y ^ { n + 1 } = 2 \cos ( \lambda \tau ) y ^ { n } - y ^ { n - 1 } - { \frac { \sin ( \lambda \tau ) } { \lambda } } g ( y ^ { n } ) , \qquad n \geq 1 ,
$$

with

$$
y ^ { 0 } = \alpha , \qquad y ^ { 1 } = \alpha \cos ( \lambda \tau ) + { \frac { \beta } { \lambda } } \sin ( \lambda \tau ) - { \frac { \sin ( \lambda \tau ) } { 2 \lambda } } g ( \alpha ) .
$$

Under proper stability assumption, prove the following error bound

$$
| y ( t _ { n } ) - y ^ { n } | \leq C \tau ^ { 2 } , \qquad 0 \leq n \leq \frac { T } { \tau } ,
$$

where $C > 0$ is a constant independent of $\tau .$

## Question III

Consider an energy functional for $\rho \in { \mathcal { P } } ( \mathbb { R } )$ (probability distribution on the real line), given by

$$
F [ \rho ] = \int _ { \mathbb { R } \times \mathbb { R } } \rho ( x ) K ( x - y ) \rho ( y ) { \mathrm { d } } x { \mathrm { d } } y + \int _ { \mathbb { R } } \rho ( x ) ( 1 - \rho ( x ) ) { \mathrm { d } } x + \int _ { \mathbb { R } } \rho ( x ) \ln \rho ( x ) { \mathrm { d } } x ,
$$

where $K : \mathbb { R }  \mathbb { R } _ { + }$ is a given kernel.

1. Write down explicitly the Euler-Lagrange equation corresponding to $F$

2. Consider the dynamics

$$
\frac { \mathrm { d } } { \mathrm { d } t } \rho ( x , t ) = \nabla \cdot \Big ( \rho ( x , t ) \nabla \frac { \delta F } { \delta \rho } \big [ \rho ( x , t ) \big ] \Big ) .
$$

Show that $F [ \rho ( x , t ) ]$ is decreasing in $t .$
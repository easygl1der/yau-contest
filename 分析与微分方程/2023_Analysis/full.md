# S.-T. Yau College Student Mathematics Contests 2023

# Analysis and Differential Equations

Solve every problem.

1. Let $( M _ { n } , \parallel \cdot \parallel )$ be the Banach space formed by $n \times n$ real matrices, equipped with Hilbert-Schmidt norm. Prove:

(1). If $\gamma : \mathbb { R }  M _ { n }$ is a $C ^ { 1 }$ -function with $\gamma ( 0 ) = \mathbb { I }$ (the identity matrix) and ${ \dot { \gamma } } ( 0 ) =$ $A \in M _ { n }$ , then for $\forall t \in \mathbb { R }$ , the sequence $\{ \gamma ^ { n } ( t / n ) \} _ { n = 1 } ^ { \infty }$ converges to $\exp ( t A )$ ; In particular, for $\forall A , B \in M _ { n }$ , $e ^ { t ( A + B ) } = \mathrm { l i m } _ { n  \infty } ( e ^ { \frac { t } { n } A } e ^ { \frac { t } { n } B } ) ^ { n }$ ;   
(2). For $\forall A , B \in M _ { n }$ , if $e ^ { t ( A + B ) } = e ^ { t A } e ^ { t B }$ , $\forall t \in \mathbb { R }$ , then $[ A , B ] : = A B - B A = 0$ .

2. Let rdinary where $f ( t , x , y )$ fferential equation are given real num be a $C ^ { 1 }$ function on $\begin{array} { r } { ( * ) \frac { d ^ { 2 } x } { d t ^ { 2 } } = f ( t , x , \frac { d } { d t } x ) } \end{array}$ $[ 0 , 1 ] \times \mathbb { R } ^ { 2 }$ . Let $\varphi$ $t \in [ 0 , 1 ]$ be a solution of the second-order such t for all $\varphi ( 0 ) = a$ $\varphi ( 1 ) =$ $b$ $a , b$ $\begin{array} { r } { \frac { \partial f } { \partial x } ( t , x , y ) > 0 } \end{array}$ $( t , x , y ) \in [ 0 , 1 ] \times \mathbb { R } ^ { 2 }$ Prove: if $| \beta - b |$ , $\beta \in \mathbb { R }$ , is sufficiently small, then there exists a solution $\psi$ of $( * )$ such that $\psi ( 0 ) = a$ , $\psi ( 1 ) = \beta$ .

3. A function $\varphi : \mathbb { R } ^ { n } \to \mathbb { C }$ is called positive definite if for all $k \in \mathbb N$ , $y _ { j } \in \mathbb { R } ^ { n }$ , $c _ { j } \in \mathbb { C }$ , $j = 1 , \dots , k$ , one have $\begin{array} { r } { \sum _ { i , j = 1 } ^ { k } c _ { i } \bar { c } _ { j } \varphi ( y _ { i } - y _ { j } ) \geqslant 0 } \end{array}$ . If $\varphi$ is a measurable positive definite function on $\mathbb { R } ^ { n }$ . Prove:

(1) $\varphi ( - y ) = { \overline { { \varphi ( y ) } } }$ and $| \varphi ( y ) | \leqslant \varphi ( 0 )$ .   
(2) For every Lebesgue integrable nonnegative function $f$ on $\mathbb { R } ^ { n }$ , one have

$$
\int_ {\mathbb {R} ^ {n}} \varphi (x - y) f (x) f (y) d x d y \geqslant 0.
$$

(3) If the function $f$ is also even, then

$$
\int_ {\mathbb {R} ^ {n}} \varphi (x) f * f (x) d x \geqslant 0,
$$

where $^ *$ stands for convolution.

(4) For all $\alpha > 0$ , we have

$$
\int_ {\mathbb {R} ^ {n}} \varphi (x) \exp (- \alpha | x | ^ {2}) d x \geqslant 0.
$$

4. For a $2 \pi$ -periodic function $x \in L ^ { 2 } ( [ 0 , 2 \pi ] )$ , let $x _ { n } ( t ) = x ( n t )$ , $n = 1 , 2 , \ldots .$

Prove that $\{ x _ { n } \}$ converges weakly in $L ^ { 2 } ( [ 0 , 2 \pi ] )$ and find the limit.

5. Let $f$ be an entire function on $\mathbb { C }$ and there exists a constant $C > 0$ such that $f ( z ) | \leqslant$ $C \sqrt { | z | } | \cos ( z ) |$ for all $z \in \mathbb { C }$ . Prove that $f$ is identically zero.   
6. Let $u ( t , x )$ satisfy the following equation,

$$
u _ {t} + \sum_ {i = 1} ^ {n} \psi_ {i} (t, x, u) u _ {x _ {i}} = \mu \Delta u; u (0, x) = u _ {0},
$$

where $u _ { 0 } \in C ^ { 2 } ( \mathbb { R } ^ { n } )$ , $\psi _ { i }$ , $i = 1 , \ldots , n$ are of bounded $C ^ { 2 }$ -norm, $\begin{array} { r } { \Delta = \sum _ { i = 1 } ^ { n } \partial _ { x _ { i } } ^ { 2 } } \end{array}$ is the Laplacian in $\mathbb { R } ^ { n }$ and $\mu > 0$ . Assume $| u _ { 0 } | \leqslant e ^ { \Phi / \mu }$ where $\Phi$ is bounded above and has Lipschitz constant 1. Assume that $\begin{array} { r } { ( \sum _ { i = 1 } ^ { n } | \Psi _ { i } ( t , x , u ) | ^ { 2 } ) ^ { 1 / 2 } \leqslant A } \end{array}$ , where $A$ is a postive constant.

Prove that there exists a constant $C$ depending only on $n$ that

$$
| u (t, x) | \leqslant e ^ {C t} e ^ {((A + 1) t + \Phi (x) + 2) / \mu}, \quad \forall t \geqslant 0.
$$
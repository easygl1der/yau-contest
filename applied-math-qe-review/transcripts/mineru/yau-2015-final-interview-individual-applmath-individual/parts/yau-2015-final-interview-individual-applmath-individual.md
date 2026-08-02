Applied and Computational Mathematics 2015 ( Individual )

1. Suppose an n by n matrix A is given by

$$
A = \left( \begin{array}{c c c c c c c} 1 & r & & & & \\ & 1 & r & & & \\ & & 1 & r & & \\ & & \ddots & \ddots & \ddots & \\ & & & & 1 & r \\ r & & & & & 1 \end{array} \right) _ {n \times n}
$$

$A \mathbf { x } = \mathbf { b }$ , prove that

$$
\| \mathbf {x} \| \leq C \| \mathbf {b} \|,
$$

where the constant C is independent of the dimension $n .$

2. For an interval $[ a , b ]$ , we divide it into $N + 1$ equally spaced subintervals by using the nodal points:

$$
a = x _ {0} <   x _ {1} <   \dots <   x _ {N + 1} = b,
$$

with

$$
x _ {i} = a + i h, \quad h = (b - a) / (N + 1).
$$

For any continuous function w on $[ 0 , \pi ]$ , we define $\Pi _ { h } w$ to be the piecewise linear interpolation of $w ,$ namely $\Pi _ { h } w$ is linear on each subinterval $( x _ { i } , x _ { i + 1 } )$ for $i = 0 , 1 , \cdots , N$ , and it takes the same values as $w$ at all nodal points $x _ { i } ,$ $i = 0 , 1 , \cdots , N + 1$ . For any function $w .$ , we define

$$
\| w \| = \left(\int_ {0} ^ {\pi} w ^ {2} (x) d x\right) ^ {1 / 2}.
$$

Prove the following estimates for any function $u \in C ^ { 2 } [ 0 , \pi ]$

$$
\| u - \Pi_ {h} u \| \leq \frac {1}{\pi^ {2}} h ^ {2} \| u ^ {\prime \prime} \|, \quad \| u ^ {\prime} - (\Pi_ {h} u) ^ {\prime} \| \leq \frac {1}{\pi} h \| u ^ {\prime \prime} \|.
$$

3. Newton iteration for computing the kth root $\left( k \geq 2 \right)$ of $C > 0$ is

$$
x _ {n + 1} = x _ {n} - \frac {x _ {n} ^ {k} - C}{k x _ {n} ^ {k - 1}}.
$$

Show that the iteration converges for any initial value $x _ { 0 } > 0$
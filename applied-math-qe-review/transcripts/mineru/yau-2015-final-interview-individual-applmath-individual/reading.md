Applied and Computational Mathematics 2015 ( Individual )

1. Suppose an n by n matrix A is given by

$$
A = \left(\begin{array}{ccccccc} 1 & r & & & & \\ & 1 & r & & & \\ & & 1 & r & & \\ & & \ddots & \ddots & \ddots & \\ & & & & 1 & r \\ r & & & & & 1 \end{array} \right)_{n \times n}
$$

$A \mathbf{x} = \mathbf{b}$ , prove that

$$
\| \mathbf{x} \| \leq C \| \mathbf{b} \|,
$$

where the constant C is independent of the dimension $n.$

2. For an interval $[a, b]$ , we divide it into $N + 1$ equally spaced subintervals by using the nodal points:

$$
a = x_{0} < x_{1} < \dots < x_{N + 1} = b,
$$

with

$$
x_{i} = a + ih, \quad h =(b - a) /(N + 1).
$$

For any continuous function w on $[0, \pi]$ , we define $\Pi_{h} w$ to be the piecewise linear interpolation of $w,$ namely $\Pi_{h} w$ is linear on each subinterval $(x_{i}, x_{i + 1})$ for $i = 0, 1, \cdots, N$ , and it takes the same values as $w$ at all nodal points $x_{i},$ $i = 0, 1, \cdots, N + 1$ . For any function $w.$ , we define

$$
\| w \| = \left(\int_{0}^{\pi} w^{2}(x) dx\right)^{1 / 2}.
$$

Prove the following estimates for any function $u \in C^{2}[0, \pi]$

$$
\| u - \Pi_{h} u \| \leq \frac{1}{\pi^{2}} h^{2} \| u^{\prime \prime} \|, \quad \| u^{\prime} -(\Pi_{h} u)^{\prime} \| \leq \frac{1}{\pi} h \| u^{\prime \prime} \|.
$$

3. Newton iteration for computing the kth root $\left(k \geq 2 \right)$ of $C > 0$ is

$$
x_{n + 1} = x_{n} - \frac{x_{n}^{k} - C}{kx_{n}^{k - 1}}.
$$

Show that the iteration converges for any initial value $x_{0} > 0$
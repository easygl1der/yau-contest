# S.-T. Yau College Student Mathematics Contests 2018

# Applied Math. and Computational Math. Individual (5 problems)

1. We consider the following convection-diffusion equation

$$
u _ {t} + a u _ {x} = b u _ {x x}, \quad 0 \leq x <   1 \tag {1}
$$

with an initial condition $u ( x , 0 ) = f ( x )$ and periodic boundary condition, where $a$ and $b > 0$ are constants. The first order IMEX (implicit-explicit) time discretization and second order central spatial discretization are used to give the following scheme:

$$
\frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\Delta t} + a \frac {u _ {j + 1} ^ {n} - u _ {j - 1} ^ {n}}{2 \Delta x} = b \frac {u _ {j + 1} ^ {n + 1} - 2 u _ {j} ^ {n + 1} + u _ {j - 1} ^ {n + 1}}{\Delta x ^ {2}} \tag {2}
$$

with a uniform mesh $x _ { j } = j \Delta x$ with spatial mesh size $\Delta x$ and time step $\Delta t$ . Here $u _ { j } ^ { n }$ is the numerical solution approximating the exact solution of (1) at $\boldsymbol { x } = \boldsymbol { x } _ { j }$ and $t = n \Delta t$ . Prove that the scheme is $L ^ { 2 }$ stable under the very mild time step restriction

$$
\Delta t \leq c \tag {3}
$$

with a constant $c$ which is independent of $\Delta x$ . Can you determine the dependency of $c$ on the two constants $a$ and $b$ in (1)?

# 2. Velocity-Verlet method.

(a) Recast the following Newtonian formula for the acceleration and potential force

$$
q ^ {\prime \prime} (t) = - \nabla V (q),
$$

into a Hamiltonian system and show that the corresponding map on the phase space is symplectic.

(b) Show that the velocity-Verlet (recovered many times: Delambre 1791, Størmer in 1907, Cowell & Crommelin 1909, Verlet 1960s) method

$$
p _ {n + 1 / 2} = p _ {n} - \frac {\Delta t}{2} \nabla V (q _ {n});
$$

$$
q _ {n + 1} = q _ {n} + \Delta t p _ {n + 1 / 2};
$$

$$
p _ {n + 1} = p _ {n + 1 / 2} - \frac {\Delta t}{2} \nabla V (q _ {n + 1})
$$

is symplectic and is second order accurate.

Hint: Let $\boldsymbol { u } ( t ) = ( p ( t ) , q ( t ) )$ be a solution of the Hamiltonian system with initial data $u _ { 0 } = ( p _ { 0 } , q _ { 0 } )$ and we view the solution $u ( t )$ as a map map on the phase space ϕt : $\mathbb { R } ^ { d } \times \mathbb { R } ^ { d }  \mathbb { R } ^ { d } \times \mathbb { R } ^ { d } \varphi _ { t } ( u _ { 0 } ) = u ( t )$ . We call the flow map is symplectic if its Jacobian

$$
\Phi_ {t} (u _ {0}) = \frac {\partial \varphi_ {t} (u _ {0})}{\partial u _ {0}} = \left( \begin{array}{c c} \frac {\partial p (t)}{\partial p _ {0}} & \frac {\partial p (t)}{\partial q _ {0}} \\ \frac {\partial q (t)}{\partial p _ {0}} & \frac {\partial q (t)}{\partial q _ {0}} \end{array} \right)
$$

satisfies $\Phi _ { t } ( u _ { 0 } ) ^ { \mathrm { T } } J \Phi _ { t } ( u _ { 0 } ) = J$ for any $u _ { 0 } \in \mathbb { R } ^ { d } \times \mathbb { R } ^ { d }$ . Here $J = \left( \begin{array} { c c } { { 0 } } & { { I } } \\ { { - I } } & { { 0 } } \end{array} \right)$

A scheme $\varphi _ { n } ( u _ { 0 } ) , n = 1 , 2 \ldots$ , is symplectic if the map $\varphi _ { n } ( u _ { 0 } )$ is symplectic.

3. We begin with some definitions.

(1) A graph $G$ is a pair $G = ( V , E )$ where $V$ is a finite set, called the vertices of $G$ , and $E$ is a subset of $P _ { 2 } ( V )$ (i.e., a set $E$ of (unordered) two-element subsets of $V$ ), called the edges of $G$ . A simple graph $G$ is a graph without loops (edge that connects a vertex to itself) or multiple edges between any pair of vertices. The order of the graph is $\vert V \vert$ . We often put $V = \{ v _ { 1 } , v _ { 2 } , \cdots , v _ { n } \}$ and $E = \{ v _ { i } v _ { j } | \ v _ { i }$ and $v _ { j }$ are adjacent}.   
(2) Two vertices $x$ and $y$ are adjacent if $x y \in E$ . The neighborhood of a vertex $x$ , denoted by $N _ { G } ( x )$ or $N ( x )$ , is the set of vertices that is adjacent to $x$ . The degree of a vertex $x$ , denoted by $d _ { G } ( x )$ or $d ( x )$ , is $| N ( x ) |$ (i.e. the number of vertices that is adjacent to $x$ ).   
(3) A path is a collection of distinct vertices $v _ { i _ { 1 } } v _ { i _ { 2 } } \cdots v _ { i _ { k } }$ such that $v _ { i _ { j } } v _ { i _ { j + 1 } } \in E$ for all $j$ , $1 \leq j < k$ . $v _ { i _ { 1 } }$ and $v _ { i _ { k } }$ are the ends of the path. A Hamiltonian path $P$ is a path containing all vertices of the graph. A cycle is a closed path with $v _ { i _ { 1 } } = v _ { i _ { k } }$ . A Hamiltonian cycle is a cycle containing all vertices of the graph. A graph is called Hamiltonian if it has a Hamiltonian cycle.   
(4) A graph $G$ is (Hamilton) connected, if for every pair of vertices there is a (Hamiltonian) path between them.

An example of a simple graph: $V = \{ v _ { 1 } , v _ { 2 } , v _ { 3 } , v _ { 4 } \}$ and $E = \{ v _ { 1 } v _ { 2 } , v _ { 2 } v _ { 3 }$ , $v _ { 3 } v _ { 4 } , v _ { 2 } v _ { 4 } \}$ . In this graph, the order of the graph is 4, $N ( v _ { 1 } ) = \{ v _ { 2 } \}$ , $N ( v _ { 4 } ) = \{ v _ { 2 } , v _ { 3 } \}$ , $d ( v _ { 3 } ) = 2$ , $d ( v _ { 2 } ) = 3$ and $v _ { 1 } v _ { 2 } v _ { 4 } v _ { 3 }$ is a Hamiltonian path with ends $v _ { 1 }$ and $v _ { 3 }$ .

Let $G$ be a simple graph of order $n$ . Suppose that the degree sum of any pair of nonadjacent vertices is at least $n + 1$ . Show that $G$ is Hamilton-connected (i.e. between any pair of vertices $x$ and $y$ , there is a Hamiltonian path in which $x$ and $y$ are the ends).

4. Define the Hermite polynomials as

$$
(4) \quad H _ {n} (x) = (- 1) ^ {n} \exp (\frac {x ^ {2}}{2}) \frac {d ^ {n}}{d x ^ {n}} [ \exp (- \frac {x ^ {2}}{2}) ], \quad x \in (- \infty , + \infty), n = 0, 1, 2, \dots .
$$

(a) Prove the weighted orthogonality of the Hermite polynomials:

$$
\langle H _ {n} (x), H _ {m} (x) \rangle_ {\rho} \triangleq \int_ {- \infty} ^ {+ \infty} \rho (x) H _ {n} (x) H _ {m} (x) d x = n! \sqrt {2 \pi} \delta_ {n, m}, \tag {5}
$$

where $\begin{array} { r } { \rho ( x ) = \exp ( - \frac { x ^ { 2 } } { 2 } ) } \end{array}$ .

(b) Prove the three recurrence formula:

$$
H _ {n + 1} (x) = x H _ {n} (x) - n H _ {n - 1} (x), \quad n \geq 1, \tag {6}
$$

and then show that for all $n \geq 1$ , $H _ { n } ( x )$ and $H _ { n - 1 } ( x )$ share no common roots.

(c) Use the recurrence formula and induction to prove the differential relation:

$$
\frac {d}{d x} H _ {n} (x) = n H _ {n - 1} (x), \quad n \geq 1, \tag {7}
$$

and then prove that $H _ { n }$ is an eigenfunction of the following eigenvalue problem

$$
x u ^ {\prime} (x) - u ^ {\prime \prime} (x) = \lambda u. \tag {8}
$$

You need to find the eigenvalue $\lambda _ { n }$ corresponding to $H _ { n } ( x )$

5. Take $\sigma _ { i } ( A )$ to be the $i$ -th singular value of the square matrix $A \in \mathbb { R } ^ { n \times n }$ . Define the nuclear norm of $A$ to be

$$
\| A \| _ {*} \equiv \sum_ {i = 1} ^ {n} \sigma_ {i} (A).
$$

(1) Show that $\| A \| _ { * } = \mathrm { t r } ( \sqrt { A ^ { T } A } )$ .   
(2) Show that kAk∗ = max tr(AX). $\| A \| _ { * } = \operatorname* { m a x } _ { X ^ { T } X = I } \operatorname { t r } ( A X )$   
(3) Show that $\| A + B \| _ { * } \leq \| A \| _ { * } + \| B \| _ { * }$   
(4) Explain informally why minimizing $\lVert A - A _ { 0 } \rVert _ { \mathrm { F } } ^ { 2 } + \lVert A \rVert _ { * }$ over $A$ for a fixed $A _ { 0 } \in$ $\mathbb { R } ^ { n \times n }$ might yield a low-rank approximation of $A _ { 0 }$ .

Notation: The trace of a matrix $\operatorname { t r } ( A )$ is the sum $\textstyle \sum _ { i } a _ { i i }$ of its diagonal elements. We define the square root of a symmetric positive semidefinite matrix $M$ to be $\sqrt { M } \equiv$ $U D ^ { 1 / 2 } U ^ { T }$ , where $D ^ { 1 / 2 }$ is the diagonal matrix containing (nonnegative) square roots of the eigenvalues of $M$ and $U$ contains the eigenvectors of $M = U D U ^ { T }$ .
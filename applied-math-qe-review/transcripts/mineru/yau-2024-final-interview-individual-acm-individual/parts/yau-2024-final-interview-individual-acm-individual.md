# S.-T. Yau College Student Mathematics Contest Applied and Computational Math (Individual Contest)

June 8, 2024

1. Find an algorithm of $O ( n ^ { 2 } )$ operations for solving the following linear system

$$
(\boldsymbol {S T} - \lambda \boldsymbol {I}) \boldsymbol {x} = \boldsymbol {b},
$$

where S, $\pmb { T } \in \mathbb { R } ^ { n \times n }$ are given upper triangular matrices, $\lambda \in \mathbb { R }$ is given such that $S T - \lambda I$ is nonsingular, $\ b { b } \in \mathbb { R } ^ { n }$ is given, and $\pmb { x } \in \mathbb { R } ^ { n }$ is the unknown vector.

2. Let $d ^ { n } , g ^ { n }$ and $h ^ { n }$ be three non-negative series satisfying

$$
\frac {d ^ {n + 1} - d ^ {n}}{k} \leq g ^ {n} d ^ {n} + h ^ {n}, \forall n \geq n _ {0},
$$

and

$$
\left\{ \begin{array}{l} k \sum_ {n = k _ {0}} ^ {N + k _ {0}} g ^ {n} \leq a _ {1} \\ k \sum_ {n = k _ {0}} ^ {N + k _ {0}} h ^ {n} \leq a _ {2} \quad , \forall k _ {0} \geq n _ {0} \\ k \sum_ {n = k _ {0}} ^ {N + k _ {0}} d ^ {n} \leq a _ {3} \end{array} \right.
$$

with $k N = r$ . Show that

$$
d ^ {n} \leq (a _ {2} + \frac {a _ {3}}{r}) \exp (a _ {1}), \forall n \geq n _ {0} + N.
$$

3. Consider the heat distribution in a rod of length $L > 0$ made of two materials with diferent heat conductivities, denoted as $a \in \mathbb { R } _ { + }$ and $b \in$ $\mathbb { R } _ { + } ,$ and distributed alternatively along the rod with a periodicity of $\varepsilon : =$ $L / N , N \in \mathbb { N }$ . The problem can be modelled by the following system

$$
\left\{ \begin{array}{l} - \frac {d}{d x} \left(A _ {\varepsilon} (x) \frac {d}{d x} u _ {\varepsilon} (x)\right) = f (x), \quad x \in (0, L) \\ u _ {\varepsilon} (0) = u _ {\varepsilon} (L) = 0, \end{array} \right.\tag{1}
$$

where

$$
A _ {\varepsilon} (x) = \left\{ \begin{array}{l l} a & \text { if } x \in \left(0, \frac {\varepsilon}{2}\right) \cup \left(\varepsilon , \frac {3}{2} \varepsilon\right) \cup \ldots .. \cup \left((N - 1) \varepsilon , \frac {2 N - 1}{2} \varepsilon\right), \\ b & \text { otherwise }, \end{array} \right.
$$

and $f ( x ) \in L ^ { 2 } ( ( 0 , L ) )$ signifies a source.

(1) Show that equation (1) has a unique weak solution in $H _ { 0 } ^ { 1 } ( ( 0 , L ) )$

(2) Show that there is a constant A such that $u _ { \varepsilon } \to u$ weakly in $H _ { 0 } ^ { 1 } ( ( 0 , L ) )$ ), and u is the solution of the following system:

$$
\left\{ \begin{array}{l} - \frac {d}{d x} \left(A \frac {d}{d x} u (x)\right) = f (x), \quad x \in (0, L), \\ u (0) = u (L) = 0. \end{array} \right.\tag{2}
$$

Find the value of A.

4. Let u be the solution to the reaction-difusion equation

$$
u _ {t} = \beta u _ {x x} + f (u), \quad \mathrm{in} [ 0, L ] \times (0, T ]
$$

with the homogeneous Neumann boundary condition. We assume that

A1. The reaction function f satisfies that $f \in C ^ { 2 } ( \mathbb { R } )$ and $f ( 0 ) = 0$

A2. $\exists K > 0$ such that $| f ^ { \prime } ( u ) | \leq K _ { \mathrm { \Lambda } }$ $\forall u \in \mathbb { R }$

We assume further that the problem is well-posed for a given initial condition $u ( x , 0 )$ .

(a) Consider the following standard forward-in-time and central-in-space discretization

$$
v _ {j} ^ {n + 1} = v _ {j} ^ {n} + \beta \frac {\Delta t}{(\Delta x) ^ {2}} (v _ {j - 1} ^ {n} - 2 v _ {j} ^ {n} + v _ {j + 1} ^ {n}) + \Delta t f (v _ {j} ^ {n})
$$

on a uniform space-time mesh $t _ { n } = n \Delta t$ and $x _ { j } = j \Delta x$ . Assume that $K$ is small enough. Derive a suficient condition on $\Delta t ,$ , assuming everything else is fixed, for the numerical stability, in an appropriate sense, of the scheme.

(b) Let $e _ { j } ^ { n } : = u _ { j } ^ { n } - v _ { j } ^ { n }$ be the numerical error (where $u _ { i } ^ { n } = u ( x _ { j } , t _ { n } ) )$ Show that the scheme is convergent by showing that $\| e ^ { n } \| \to 0$ , in appropriate norm, as $\Delta t , \Delta x  0$
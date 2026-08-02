Consider the nonlinear Klein-Gordon equation

$$
\begin{array}{l} \varepsilon^ {2} \partial_ {t t} u (x, t) - \partial_ {x x} u (x, t) + \frac {1}{\varepsilon^ {2}} u (x, t) + f (u (x, t)) = 0, \quad 0 <   x <   1, 0 <   t <   T, \\ u (x, 0) = g _ {0} (x), \qquad \partial_ {t} u (x, 0) = \frac {1}{\varepsilon^ {2}} g _ {1} (x), \qquad 0 \leq x \leq 1, \\ u (0, t) = u (1, t) = 0, \qquad 0 \leq t \leq T, \end{array}
$$

where $0 < \varepsilon \le 1$ is a given dimensionless constant, $f ( u )$ is a function of u and $g _ { 0 } ( x )$ and $g _ { 1 } ( x )$ are given functions, which are all independent of ε.

1. Define the Hamiltonian (or energy) as

$$
E (t) := \int_ {0} ^ {1} \left[ \varepsilon^ {2} | \partial_ {t} u | ^ {2} + | \partial_ {x} u | ^ {2} + \frac {1}{\varepsilon^ {2}} u ^ {2} + F (u) \right] d x, \qquad t \geq 0,
$$

where

$$
F (u) = 2 \int_ {0} ^ {u} f (s) d s.
$$

Show that the Hamiltonian is conserved, i.e.

$$
E (t) \equiv E (0), \qquad t \geq 0.
$$

2. Construct an explicit second-order (in space and time) finite diference (EXFD) method for the problem and find its linear stability.

3. Construct a second-order (in space and time) finite diference method for the problem such that the the Hamiltonian (or energy) is conserved in the discretized level and prove it.
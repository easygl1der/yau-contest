# Applied Math. and Computational Math. Individual

Please solve as many problems as you can!

1. We consider the wave equation $u _ { t t } = \Delta u$ in $\mathbb { R } ^ { 3 } \times \mathbb { R } _ { + }$ .

(a): (5 pts) A right going pulse with speed 1

$$
u (x, y, z, t) = 1 \text {f o r} t <   x <   t + 1; u (x, y, z, t) = 0 \text {e l s e}
$$

is clearly a solution to the wave equation. However, it is a discontinuous solution, explain in which sense it is a solution to the equation.

(b): (5 pts) Surprisingly, one can construct smooth progressive wave solutions with speed larger than 1. In astronomy this kind of wave known as superluminal wave. Try a solution of the form

$$
u (x, y, z, t) = v \left(\frac {x - c t}{\sqrt {c ^ {2} - 1}}, y, z\right), \quad c \in \mathbb {R} ^ {3}, \quad | c | > 1.
$$

Derive an equation for $\boldsymbol { v }$ and show that there is a nontrivial solution with compact support in $( y , z )$ for any fixed $x , t$ .

(c): (5 pts) For any $R > 0$ , $0 < t < R$ , show that energy

$$
E (t) := \int_ {| \vec {x} | \leq R - t} \left(| u _ {t} (\cdot , t) | ^ {2} + | \nabla u (\cdot , t) | ^ {2}\right) d \vec {x}
$$

is a decreasing function.

(c): (10 pts) Show that smooth superluminal progressive wave solutions of the form

$$
u (\vec {x}, t) = v (\vec {x} - \vec {c t}), \vec {c} \in \mathbb {R} ^ {3}, \quad | \vec {c} | > 1.
$$

cannot have a finite energy.

Hint: Using (c) and look at the energy of the solution in various balls.

2. Finite time extinction and hyper-contractiveity are important properties in modeling of some physical and biology systems. The essence of estimates is given by the following problem for ODE.

Assume $y ( t ) \geq 0$ is a $C ^ { 1 }$ function for $t > 0$ satisfying $y ^ { \prime } ( t ) \leq \alpha -$ $\beta y ( t ) ^ { a }$ for $\alpha > 0 , \beta > 0$ , then

(a) (10 points) For $a > 1$ , $y ( t )$ has the following hyper-contractive property

$$
y (t) \leq (\alpha / \beta) ^ {1 / a} + \left[ \frac {1}{\beta (a - 1) t} \right] ^ {\frac {1}{a - 1}}, \quad \mathrm {f o r} t > 0.
$$

(b) (2 points) For $a = 1$ , $y ( t )$ decays exponentially

$$
y (t) \leq \alpha / \beta + y (0) e ^ {- \beta t}.
$$

(c) (10 points) For $a < 1 , \alpha = 0$ , $y ( t )$ has finite time extinction, which means that there exists $T _ { e x t }$ such that $\begin{array} { r } { 0 < T _ { e x t } \leq \frac { y ^ { 1 - a } ( 0 ) } { \beta ( 1 - a ) } } \end{array}$ and that $y ( t ) = 0$ for all $t > T _ { e x t }$ .

3. Consider the speed $\boldsymbol { v }$ of a ball (density $\rho$ , radius $R$ ) falling through a viscous fluid (density $\rho _ { f }$ , viscosity $\mu$ ) with drag coefficient given by Stokes’ law $\zeta = 6 \pi R \mu$ :

$$
\frac {4}{3} \pi R ^ {3} \rho \frac {d v}{d t} = \frac {4}{3} \pi R ^ {3} (\rho - \rho_ {f}) g - \zeta v, \quad v (0) = v _ {0}
$$

(a): (5 points) Nondimensionalize the equation by writing, $v ( t ) =$ $V \tilde { v } ( \tilde { t } )$ with $t = T \hat { t }$ . Select $V$ , $T$ (characteristic scales known as terminal velocity and settling time respectively) so that all coefficients in the ODE but one are equal to 1. Your equation will have a single dimensionless parameter given by the ratio of the initial speed $v _ { 0 }$ to the characteristic speed $V$ .

(b): (2 points) Solve the nondimensional problem for $\tilde { v } ( \tilde { t } )$ .   
(c): (8 points) Describe the behavior of the solution if the initial speed $v _ { 0 }$ is (i) faster than and (ii) slower than the characteristic speed $V$ . Compute the time to reach $( v _ { 0 } + V ) / 2$ .

4. Let

$$
V _ {h} = \{v: v | _ {I _ {j}} \in P ^ {k} (I _ {j}) \qquad 1 \le j \le N \}
$$

where

$$
I _ {j} = (x _ {j - 1}, x _ {j}), \qquad \qquad 1 \leq j \leq N
$$

with

$$
x _ {j} = j h, \qquad h = \frac {1}{N}.
$$

Here $P ^ { k } ( I _ { j } )$ denotes the set of polynomials of degree at most $k$ in the interval $I _ { j }$ .

Recall the $L ^ { 2 }$ projection of a function $u ( x )$ into the space $V _ { h }$ is defined by the unique function $u _ { h } \in V _ { h }$ which satisfies

$$
\left| \left| u - u _ {h} \right| \right| \leq \left| \left| u - v \right| \right| \quad \forall v \in V _ {h}
$$

where the norm is the usual $L ^ { 2 }$ norm. We assume $u ( x )$ has at least $k + 2$ continuous derivatives.

(1) (5 points) Prove the error estimate

$$
\left| \left| u - u _ {h} \right| \right| \leq C h ^ {k + 1}
$$

Explain how the constant $C$ depends on the derivatives of $u ( x )$ .

(2) (10 points) If another function $\varphi ( x )$ also has at least $k + 2$ continuous derivatives, prove

$$
| \int_ {0} ^ {1} (u (x) - u _ {h} (x)) \varphi (x) d x | \leq C h ^ {2 k + 2}
$$

Explain how the constant $C$ depends on the derivatives of $u ( x )$ and $\varphi ( x )$ .

5. (15 points) Let $G ( V , E )$ be a simple graph of order $n$ and $\delta$ the minimum degree of vertices. Suppose that the degree sum of any pair of nonadjacent vertices is at least $n$ and $F \subset E$ with $\begin{array} { r } { | F | \le \left\lfloor \frac { \delta - 2 } { 2 } \right\rfloor } \end{array}$ . Let $G - F$ be the graph obtained from $G$ by deleting the edges in $F$ . Prove that

(1) $G - F$ is connected and   
(2) $G - F$ is Hamiltonian.

6. (15 points) Let $( F _ { n } ) _ { n }$ be the Fibonacci sequence. Namely, $F _ { 0 } =$ $0 , F _ { 1 } = 1 , \ldots , F _ { n + 2 } = F _ { n + 1 } + F _ { n }$ .

Establish a relation between ${ \binom { 0 } { 1 } } ^ { n }$ and $F _ { n }$ and use it to design an efficient algorithm that for a given $n$ computes the $n$ -th Fibonacci number $F _ { n }$ . In particular, it must be more efficient than computing $F _ { n }$ in $n$ consecutive steps.

Give an estimate on the number of steps of your algorithm.

Hint: Not that if $m$ is even then

$$
\left( \begin{array}{c c} 0 & 1 \\ 1 & 1 \end{array} \right) ^ {m} = \left(\left( \begin{array}{c c} 0 & 1 \\ 1 & 1 \end{array} \right) ^ {m / 2}\right) ^ {2}
$$

and if $m$ is odd then

$$
\left( \begin{array}{c c} 0 & 1 \\ 1 & 1 \end{array} \right) ^ {m} = \left( \begin{array}{c c} 0 & 1 \\ 1 & 1 \end{array} \right) ^ {m - 1} \cdot \left( \begin{array}{c c} 0 & 1 \\ 1 & 1 \end{array} \right)
$$

and $m - 1$ is even.
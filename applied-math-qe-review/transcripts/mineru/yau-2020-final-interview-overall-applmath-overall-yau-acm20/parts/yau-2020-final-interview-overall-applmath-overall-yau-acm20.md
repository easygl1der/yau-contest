Question I

Consider the following gradient flow with discrete normalization (GFDN)

$$
\begin{array} { r l } & { \partial _ { t } u ( x , t ) = \left[ \partial _ { x x } - V ( x ) - \beta | u | ^ { 2 } \right] u , \quad 0 < x < 1 , \ t _ { n } \leq t < t _ { n + 1 } , \ n \geq 0 , } \\ & { u ( x , t _ { n + 1 } ) = u ( x , t _ { n + 1 } ^ { + } ) : = \frac { u ( x , t _ { n + 1 } ^ { - } ) } { \| u ( \cdot , t _ { n + 1 } ^ { - } ) \| _ { L ^ { 2 } } } , \qquad 0 \leq x \leq 1 , \quad n \geq 0 , } \\ & { u ( x , 0 ) = g _ { 0 } ( x ) , \qquad 0 \leq x \leq 1 , } \\ & { u ( 0 , t ) = u ( 1 , t ) = 0 , \qquad t \geq 0 , } \end{array}
$$

where $u \ : = \ : u ( x , t )$ is a real-valued function, $V ( x ) \geq 0$ for $0 \leq x \leq 1$ is a given function, $\beta \geq 0$ is a given constant, $t _ { n } = n \tau$ for $n = 0 , 1 , 2 , . . .$ . with $\tau > 0$ being the time step, $\begin{array} { r } { u ( x , t _ { n } ^ { \pm } ) : = \operatorname* { l i m } _ { t \to t _ { n } ^ { \pm } } u ( x , t ) , \| u \| _ { L ^ { 2 } } ^ { 2 } = \int _ { 0 } ^ { 1 } | u ( x ) | ^ { 2 } } \end{array}$ dx and $g _ { 0 } ( x )$ is a given function satisfying $\| g _ { 0 } \| _ { L ^ { 2 } } = 1$ . Define the mass and energy as

$$
\begin{array} { l } { \displaystyle { M ( t ) : = M ( u ( \cdot , t ) ) = \int _ { 0 } ^ { 1 } \left| u ( x , t ) \right| ^ { 2 } d x , \qquad t \geq 0 , } } \\ { \displaystyle { E ( t ) : = E ( u ( \cdot , t ) ) = \int _ { 0 } ^ { 1 } \left[ | \partial _ { x } u ( x , t ) | ^ { 2 } + V ( x ) | u ( x , t ) | ^ { 2 } + \frac { \beta } { 2 } | u ( x , t ) | ^ { 4 } \right] d x . } } \end{array}
$$

1. Show that the mass and energy are diminishing in each time interval $[ t _ { n } , t _ { n + 1 } )$ 2 i.e.

$$
M ( t _ { 2 } ) \leq M ( t _ { 1 } ) , \qquad E ( t _ { 2 } ) \leq E ( t _ { 1 } ) , \qquad t _ { n } \leq t _ { 1 } \leq t _ { 2 } < t _ { n + 1 } , \quad n \geq 0 .
$$

2. When $\beta = 0$ , show that

$$
E ( g _ { 0 } ) = E ( u ( x , t _ { 0 } ) ) \geq E ( u ( x , t _ { 1 } ) ) \geq \cdots \geq E ( u ( x , t _ { n } ) ) \geq \cdots , \qquad n \geq 0 ,
$$

for any given time step $\tau > 0$ and initial data $g _ { 0 } ( x )$

3. Let $\tau \to 0 ^ { + }$ in the problem GFDN, what partial diferential equations can you get? Show that the limiting equation is mass conservative and energy diminishing.

Question II

Define a dynamical system

$$
\frac { d y _ { t } } { d t } = - A ^ { T } ( A x _ { t } - b ) ,\tag{1a}
$$

$$
y _ { t } \in \partial { \psi } ( x _ { t } ) ,\tag{1b}
$$

where $A \in \mathbb { R } ^ { n \times k }$ satisfies that $A ^ { T } A$ has smallest eigenvalue $\gamma > 0 , b = A x ^ { * }$ , and $\begin{array} { r } { \psi ( { x } ) = \| { x } \| _ { 1 } + \frac { \| { x } \| _ { 2 } ^ { 2 } } { 2 \alpha } } \end{array}$ has its subgradient set $\partial \psi ( x )$ at $\boldsymbol { x } \in \mathbb { R } ^ { k }$ , where $\alpha > 0$ is a given constant. For a convex function $\psi : \mathbb { R } ^ { k }  \mathbb { R }$ , define the Bregman divergence function associated with ψ, $D _ { \psi } : \mathbb { R } ^ { k } \times \mathbb { R } ^ { k }  \mathbb { R }$ , by

$$
D _ { \psi } ( x ^ { \prime } , x ) : = \psi ( x ^ { \prime } ) - \psi ( x ) - \langle \partial \psi ( x ) , x ^ { \prime } - x \rangle .\tag{2}
$$

1. Show that (1) leads to the following ODE

$$
\frac { d D _ { \psi } ( x ^ { * } , x _ { t } ) } { d t } = - \| A ( x _ { t } - x ^ { * } ) \| _ { 2 } ^ { 2 } .\tag{3}
$$

2. For $x _ { t }$ in (1), define

$$
\tau : = \operatorname* { i n f } \{ t > 0 : \operatorname { s i g n } ( x _ { t } ) = \operatorname { s i g n } ( x ^ { * } ) \} .\tag{4}
$$

Denote by $x ^ { * }$ the smallest nonzero magnitude of $| x _ { i } | \ ( i = 1 , \ldots , k )$ . Find an upper bound of $\tau _ { : }$ as tight as possible.
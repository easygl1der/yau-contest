# S.-T. Yau College Student Mathematics Contests 2019

# Applied and Computational Math Individual (4 problems)

1) (20 points)

Given a set $\mathcal { X }$ , $m \in \mathbb { N }$ and a hypothesis space $\mathcal { H }$ , define

$$
\Pi_ {\mathcal {H}} (m) = \max  _ {\left\{x _ {1}, x _ {2}, \dots , x _ {m} \right\} \subseteq \mathcal {X}} | \{(h (x _ {1}), h (x _ {2}), \dots , h (x _ {m})) | h \in \mathcal {H} \} |
$$

where $| { \cal S } |$ denotes the cardinality of the set $\boldsymbol { S }$ . The VC dimension of $\mathcal { H }$ is

$$
\operatorname {V C} (\mathcal {H}) = \max  \{m: \Pi_ {\mathcal {H}} (m) = 2 ^ {m} \}.
$$

$( i )$ Let $\mathcal { X } = \mathbf { R }$ . If $a \leqslant b$ , define $h ( x ; a , b ) = 1$ if $x \in [ a , b ]$ and $h ( x ) = - 1$ if $x \notin [ a , b ]$ . Find the VC dimension of the hypothesis space ${ \mathcal { H } } = \{ h ( x ; a , b ) | a , b \in \mathbf { R } , a \leqslant b \}$ .   
$( i i )$ Let $\mathcal { X } = \mathbf { R } ^ { d }$ , $\mathcal { H }$ to be the set of linear classifiers, i.e. $\mathcal { H } = \{ f ( x ) | f ( x ) = \mathrm { s i g n } ( w ^ { \top } x + b ) , w \in \mathbf { R } ^ { d } , b \in$ $\mathbf { R } \}$ where $\mathrm { s i g n } ( x ) = 1$ if $x > 0$ , $\ \mathrm { s i g n } ( x ) = - 1$ if $x < 0$ and $\mathrm { s i g n } ( x ) = 0$ if $x = 0$ . Show that the VC dimension of $\mathcal { H }$ is $d + 1$ .

2) (25 points)

Consider Richardson’s difference scheme for the heat equation $u _ { t } = u _ { x x }$ :

$$
\frac {1}{2 k} \left(u (x, t + k) - u (x, t - k)\right) = \frac {1}{h ^ {2}} \left(u (x - h, t) - 2 u (x, t) + u (x + h, t)\right).
$$

$( i )$ Show that this scheme has second-order truncation error.   
$( i i )$ Use either ODE principles or von Neumann analysis to show that this scheme is unconditionally unstable.   
$( i i i )$ Demonstrate a minor modification of the left-side of Richardson’s scheme that yields a familiar unconditionally stable scheme and prove it.

3) (25 points)

Let $\varnothing \neq K$ be a closed convex set in $\mathbf { R } ^ { n }$ , i.e., $K$ is a closed set and for any $x , y \in K$ and $\lambda \in ( 0 , 1 )$ , $\lambda x + ( 1 - \lambda ) y \in K$ . For any $z \in \mathbf { R } ^ { n }$ , let $\Pi _ { K } ( z )$ denote the metric projection of $z$ onto $K$ , which is the unique optimal solution of following problem:

$$
\min  \frac {1}{2} \| y - z \| _ {2} ^ {2}, \quad \text {s . t .} \quad y \in K. \tag {1}
$$

Show that

$( i )$ the point $y \in K$ solves (1) if and only if

$$
\left(z - y\right) ^ {T} (d - y) \leqslant 0, \quad \forall d \in K;
$$

$( i i )$ for any $y , z \in \mathbf { R } ^ { n }$

$$
\| \Pi_ {K} (y) - \Pi_ {K} (z) \| _ {2} \leq \| y - z \| _ {2};
$$

(iii) $\Theta ( \cdot )$ is continuously differentiable with its gradient given by

$$
\nabla \Theta (z) = z - \Pi_ {K} (z),
$$

where for any $z \in \mathbf { R } ^ { n }$ , $\begin{array} { r } { \Theta ( z ) : = \frac { 1 } { 2 } \| z - \Pi _ { K } ( z ) \| _ { 2 } ^ { 2 } } \end{array}$ .

4) (25 points) The scientists FitzHugh (1961) and Nagumo, Arimoto, Yoshizawa (1962) derived a mathematical model to characterize the behavior of a neuron under the externally injected current $I$ :

$$
\left\{ \begin{array}{l l} \frac {d V}{d t} & = V - \frac {1}{3} V ^ {3} - W + I, \\ \frac {d W}{d t} & = \frac {1}{\tau} \big (V + a - b W \big), \end{array} \right.
$$

where the variable $V$ describes the membrane potential of the neuron, the variable $W$ describes the current arising from opening and closing of ion channels on the neurons membrane. The variables $\tau$ , $a$ and $b$ are parameters with typical values: a = 0.7, $b = 0 . 8$ and $\tau = 1 3$ .

$( i )$ For a small positive constant current $I$ , how the neuron behaves.   
$( i i )$ For a large positive constant current $I$ , how the neuron behaves.   
$( i i i )$ Suppose one injects a pulse current with different magnitude at some time $t _ { 0 }$ , i.e., $I = I _ { 0 } \delta ( t - t _ { 0 } )$ , where $I _ { 0 }$ describes the magnitude of the pulse, analyze the dynamical behavior of the neuron when $I _ { 0 }$ ， is small or large.
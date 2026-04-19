# S.-T. Yau College Student Mathematics Contests 2019

# Geometry and Topology Individual (5 problems)

1) Let Conf be the following submanifold of $\mathbb { C } ^ { n }$ : $^ { - n }$

$$
\operatorname {C o n f} _ {n} = \left\{\left(z _ {1}, z _ {2}, \dots , z _ {n}\right) \in \mathbb {C} ^ {n} \mid z _ {i} \neq z _ {j} \text {f o r a n y} i \neq j \right\}.
$$

For every pair $( i , j )$ with $i \neq j$ , we define the complex valued 1-form

$$
\omega_ {i j} := \frac {d z _ {i} - d z _ {j}}{z _ {i} - z _ {j}}.
$$

(a) Show that for any $i \neq j$ , $\omega _ { i j }$ represents a non-zero de Rham cohomology class in $H ^ { 1 } ( \mathrm { C o n f } _ { n } , \mathbb { C } )$ .   
(b) Show that for any pair-wise distinct indices $i , j , k$ ,

$$
\omega_ {i j} \wedge \omega_ {j k} + \omega_ {j k} \wedge \omega_ {k i} + \omega_ {k i} \wedge \omega_ {i j} = 0.
$$

2) Let $M$ be a compact oriented manifold of (real) dimension 4. Consider the following symmetric bilinear form on $H ^ { 2 } ( M )$

$$
H ^ {2} (M) \times H ^ {2} (M) \to \mathbb {R}, \quad ([ \alpha ], [ \beta ]) \mapsto \int_ {M} \alpha \wedge \beta .
$$

Let $\tau ( M )$ be the signature of this bilinear form, i.e. the number of positive eigenvalues minus the number of negative eigenvalues. Compute $\tau ( M )$ for $M = S ^ { 4 } , \mathbb { C P } ^ { 2 }$ and $S ^ { 2 } \times S ^ { 2 }$ .

3) Let $X = \mathbb { R } ^ { 4 } / \sim$ , where

$$
\begin{array}{l} \left(x _ {1}, x _ {2}, x _ {3}, x _ {4}\right) \sim \left(x _ {1}, x _ {2} + 1, x _ {3}, x _ {4}\right) \\ \left(x _ {1}, x _ {2}, x _ {3}, x _ {4}\right) \sim \left(x _ {1}, x _ {2}, x _ {3}, x _ {4} + 1\right) \\ \left(x _ {1}, x _ {2}, x _ {3}, x _ {4}\right) \sim \left(x _ {1} + 1, x _ {2}, x _ {3}, x _ {4}\right) \\ (x _ {1}, x _ {2}, x _ {3}, x _ {4}) \sim (x _ {1}, x _ {2} + x _ {4}, x _ {3} + 1, x _ {4}) \\ \end{array}
$$

Compute $H _ { 1 } ( X , \mathbb { Z } )$

4) Let $E$ be a vector bundle over a smooth manifold $M$ . Let $\nabla ^ { E }$ be a connection $E$ and $R ^ { E } \in$ $\Omega ^ { 2 } ( M , { \mathrm { E n d } } ( E ) )$ be its curvature tensor. For any polynomial $f ( x ) = a _ { 0 } + a _ { 1 } x + a _ { 2 } x ^ { 2 } + \cdot \cdot \cdot + a _ { n } x ^ { n }$ , we denote

$$
f \left(R ^ {E}\right) = a _ {0} + a _ {1} R ^ {E} + a _ {2} \left(R ^ {E}\right) ^ {2} \dots + a _ {n} \left(R ^ {E}\right) ^ {n} \in \Omega^ {*} (M, \operatorname {E n d} (E)).
$$

Here $( R ^ { E } ) ^ { k } \in \Omega ^ { 2 k } ( M , { \mathrm { E n d } } ( E ) )$ is the $k$ -th wedge product on forms combined with matrix multiplications on $\operatorname { E n d } ( E )$ .

(a) Show that the differential form $\operatorname { t r } \left\lfloor f ( R ^ { E } ) \right\rfloor \in \Omega ^ { * } ( M )$ is closed

$$
d \operatorname {t r} \left[ f \left(R ^ {E}\right) \right] = 0.
$$

Here tr is the trace on $\operatorname { E n d } ( E )$ .

(b) Let $\nabla ^ { E }$ , $\widetilde { \nabla } ^ { E }$ be two connections on $E$ and $R ^ { E }$ , $\widetilde { R } ^ { E }$ be the corresponding curvature tensors. Show that there exists a differential form $\omega \in \Omega ^ { * } ( M )$ such that

$$
\operatorname {t r} \left[ f (R ^ {E}) \right] - \operatorname {t r} \left[ f (\tilde {R} ^ {E}) \right] = d \omega .
$$

5) (a) Let $u$ be a smooth function over a Riemannian manifold $( M , g )$ . Prove the following Bochner’s formula

$$
\frac {1}{2} \Delta | \nabla u | ^ {2} = | \nabla \nabla u | ^ {2} + \operatorname {R i c} (\nabla u, \nabla u) + g (\nabla \Delta u, \nabla u)
$$

where $\Delta$ is the Laplacian and $| \bullet | ^ { 2 } = g ( \bullet , \bullet )$ .

(b) Let $( S ^ { 2 } , g )$ be the standard unit sphere and $E$ be a constant. Show that the only smooth positive solution to

$$
\Delta \ln f + E f ^ {2} = 1
$$

$\textstyle f = { \frac { 1 } { A + \phi } }$ where $A$ is a constant and $\phi$ is some first eigenfunction of $S ^ { 2 }$
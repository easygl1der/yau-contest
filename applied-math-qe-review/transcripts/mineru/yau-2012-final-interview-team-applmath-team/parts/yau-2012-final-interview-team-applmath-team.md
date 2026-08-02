## Applied and Computational Mathematics

1. We would like to solve the following PDE

$$
u _ {t} + u _ {x} = u\tag{1}
$$

by a finite diference scheme

$$
u _ {j} ^ {n + 1} = \sum_ {k = - p} ^ {q} a _ {k} u _ {j + k} ^ {n}\tag{2}
$$

where $a _ { k }$ are constants depending on the mesh sizes $\Delta x$ and $\Delta t$ , and $u _ { j } ^ { n }$ are approximations to the exact solution $u ( x _ { j } , t ^ { n } )$ with $x _ { j } = j \Delta x$ and $t ^ { n } = n \Delta t$ . A student defines stability of the scheme by

$$
\| u ^ {n + 1} \| \leq \| u ^ {n} \|\tag{3}
$$

where k · k is the usual discrete $L ^ { 2 } \mathrm { - n o r m }$ . Do you believe this definition is reasonable, namely do you believe there are consistent and accurate schemes (2) approximating the PDE (1) which will be stable under the definition (3)? If yes, give your reasons. If not, modify the definition (3).

2. Let $T$ be a rooted tree with the root r. Show that there is an injection f from the set of vertices of degree at least 3 to the set of leaves (not the root) such that for each vertex v of degree at least 3, v lies in the path from r to f (v).
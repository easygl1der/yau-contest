# S.-T. Yau College Student Mathematics Contests 2013

# Algebra and Number Theory Individual

This exam of 160 points is designed to test how much you know rather than how much you don’t know. You are not expected to finish all problems but do as much as you can.

1. (20pt)

1.1 (15 pt) Classify finite groups of order 26 up to isomorphisms.   
1.2 (5 pt) For each finite group $G$ of order 26, describe the group $A u t ( G )$ of automorphisms of $G$ .

2. (20 pt) Consider $f \in \mathbb { Z } _ { > 0 }$ and nonzero vector spaces $V _ { i }$ indexed by $i \in$ $\mathbb { Z } / f \mathbb { Z }$ . Suppose that there are linear maps $\phi _ { i } : V _ { i } \to V _ { i + 1 }$ and $\psi _ { i } : V _ { i } \to V _ { i - 1 }$ such that

$$
\phi_ {i - 1} \circ \psi_ {i} = 0, \quad \psi_ {i + 1} \circ \phi_ {i} = 0.
$$

(We may think of a circular graph with oriented edges such that the “Orpheus condition” holds: Whenever you turn back while traveling through the graph you are killed.)

Prove that there exists lines $\ell _ { i } \subset V _ { i }$ for every $i \in \mathbb { Z } / f \mathbb { Z }$ such that

$$
\phi_ {i} (\ell_ {i}) \subset \ell_ {i + 1}, \quad \psi_ {i} (\ell_ {i}) \subset \ell_ {i - 1}
$$

under one of the following two conditions:

2.1 (10 pt) all $\psi _ { i } = 0$ , or   
2.2 (10 pt) $\mathrm { d i m } V _ { i }$ are equal to each other.

3. (20pt) For a parameter $t = ( t _ { 0 } , t _ { 1 } , \cdot \cdot \cdot t _ { 5 } ) \in \mathbb { F } _ { 5 } ^ { 6 }$ with $t _ { 0 } \neq 0$ and $\{ t _ { i } , i > 0 \}$ an ordering of elements in $\mathbb { F } _ { 5 }$ , define a polynomial

$$
P _ {t} (x) = (x - t _ {1}) (x - t _ {2}) (x - t _ {3}) + t _ {0} (x - t _ {4}) (x - t _ {5}).
$$

3.1 (7 pt) Show that $P _ { t } ( x )$ is irreducible in $\mathbb { F } _ { 5 } [ x ]$ ;

3.2 (6 pt) Show that two parameters $t , t ^ { \prime }$ give the same polynomial if and only if $t _ { 0 } = t _ { 0 } ^ { \prime }$ and $\{ t _ { 4 } , t _ { 5 } \} = \{ t _ { 4 } ^ { \prime } , t _ { 5 } ^ { \prime } \}$ .

3.3 (7 pt) Show that every irreducible cubic monic polynomial over $\mathbb { F } _ { 5 }$ is obtained by this way.

4. (40 pt) For $k$ non-negative integer, let $V _ { k } : = \mathbb { R } [ x ] _ { \leq k }$ be the vector space of real polynomials of degree at most $k$ with an action by $\operatorname { S L _ { 2 } } ( \mathbb { R } )$ by

$$
\gamma \cdot P (x) = (c x + d) ^ {k} P \left(\frac {a x + b}{c x + d}\right), \qquad \gamma = \left( \begin{array}{c c} a & b \\ c & d \end{array} \right) \in \mathrm {S L} _ {2} (\mathbb {R}).
$$

4.1 (20 pt) Show that $V _ { k }$ is an irreducible representation of $\operatorname { S L _ { 2 } } ( \mathbb { R } )$ ;

4.2 (15 pt) For non-negative integers $m , n$ , consider $V _ { m , n } : = V _ { m } \otimes V _ { n }$ as a subspace of $\mathbb { C } [ x , y ]$ of polynomials with both $x , y$ -degrees at most $k$ , with diagonal action of $\operatorname { S L _ { 2 } } ( \mathbb { R } )$ . Assume $m \ge n \ge 1$ . Show that following exact sequence is exact and split as representations of $\operatorname { S L _ { 2 } } ( \mathbb { R } )$ .

$$
0 \longrightarrow V _ {m - 1, n - 1} \stackrel {\cdot (y - x)} {\longrightarrow} V _ {m, n} \stackrel {y = x} {\longrightarrow} V _ {m + n} \longrightarrow 0.
$$

This implies the following decomposition of representations:

$$
V _ {m} \otimes V _ {n} = \oplus_ {i = 0} ^ {n} V _ {m + n - 2 i}.
$$

4.3 (5 pt) For non-negative integers $\ell \ \geq \ m \ \geq \ n$ consider the space of invariants $( V _ { \ell } \otimes V _ { m } \otimes V _ { n } ) ^ { \mathrm { S L } _ { 2 } ( \mathbb { R } ) }$ . Show that this space is either trivial or one-dimensional; it is non-trivial if and only if

$$
\ell + m + n \equiv 0 \mod 2, \qquad \ell + m \geq n.
$$

5. (60 pt)

5.1 (20pt) Find a polynomial $f ( x )$ with integer coefficients which has a root over $\mathbb { F } _ { p }$ for each prime $p$ but has not root over $\mathbb { Q }$ .   
5.2 (20pt) Can you find $f$ irreducible?   
5.3 (20pt) What is the smallest possible degree of $f$ ?
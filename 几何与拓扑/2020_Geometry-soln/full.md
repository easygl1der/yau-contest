# Geometry and Topology

Solve every problem.

Problem 1. Let $S ^ { n }$ be the unit sphere in $\mathbb { R } ^ { n + 1 }$ .

(a) Find a 6-form $\alpha$ on $\mathbb { R } ^ { 7 } \setminus \{ 0 \}$ such that

$$
d \alpha = 0, \quad \text {a n d} \quad \int_ {S ^ {6}} \alpha = 1.
$$

(b) For any smooth map $f : S ^ { 1 1 } \to S ^ { 6 }$ , show that there exists a 5-form $\varphi$ on $S ^ { 1 1 }$ such that

$$
f ^ {*} \alpha = d \varphi . \tag {1}
$$

(c) Let

$$
H (f) = \int_ {S ^ {1 1}} \varphi \wedge d \varphi .
$$

Show that $H ( f )$ is independent of the choice of $\varphi$ satisfying (1).

(d) Show that $H ( f )$ is an even integer, for any smooth map $f : S ^ { 1 1 } \to S ^ { 6 }$

Solution: Problem 1 is essentially taken from [BT82, p. 227ff] (originally due to Hopf and J. H. C. Whitehead) and [Hat02, $\ S 4 . \mathrm { B } ]$ (originally due to Steenrod). It covers differential forms, exterior product, de Rham cohomology, behavior under pull-back, integration on manifolds in geometry; one approach to Part (d) uses singular cohomology and cohomology operations in topology.

For Part (a), the 6-form can be given by

$$
\alpha = \frac {\sum_ {j = 1} ^ {7} (- 1) ^ {j - 1} x ^ {j} d x ^ {1} \wedge \cdots \wedge \widehat {d x ^ {j}} \wedge \cdots \wedge d x ^ {7}}{\operatorname {V o l} (S ^ {6}) \cdot [ (x ^ {1}) ^ {2} + \dots + (x ^ {7}) ^ {2} ] ^ {7 / 2}} \quad \text {i n} \mathbb {R} ^ {7} \setminus \{0 \},
$$

Part (b) follows from the fact that $H ^ { 6 } ( S ^ { 1 1 } ) = 0$ .

Part (c) follows from Stokes’ theorem. Note that $H ( f )$ is also independent of the choice of generator $\alpha$ of $H _ { \mathrm { d e R } } ^ { 6 } ( S ^ { 6 } )$ .

To see Part (d), one way is to consider the CW complex $K = B \cup _ { f } S ^ { 6 }$ obtained by attaching a closed 12-cell $B$ to $S ^ { 6 }$ via $f : S ^ { 1 1 } = \partial B \to S ^ { 6 }$ . Then, the cohomology $H ^ { q } ( K ; \mathbb { Z } )$ is equal to $\mathbb { Z }$ for $q = 0 , 6 , 1 2$ and 0 else. Let $\alpha$ and $\beta$ ∂be the generators of $H ^ { q } ( K ; \mathbb { Z } )$ for $q = 6$ , , and 12, respectively. We claim the cup-product $\alpha ^ { 2 } = H ( f ) \beta$ αin $H ^ { 1 2 } ( K ; \mathbb { Z } )$ . Indeed, in our previous formulation $H ( f ) = \int _ { \partial B } \varphi \wedge \dot { f } ^ { * } ( \alpha ) = \int _ { K } ( f ^ { * } \alpha ) \wedge \bar { ( } \dot { f } ^ { * } \alpha )$ α βwhich is the same as taking the cap product $[ K ] \frown \alpha ^ { 2 } = H ( f ) [ K ] \frown \beta .$ ∂. This shows $H ( f ) \in \mathbb { Z }$ . Suppose $H ( f )$ is an odd number for some $f : S ^ { 1 1 } \to S ^ { 6 }$ _. Then $\mathrm { S q } ^ { 6 } ( \sigma ) = \sigma ^ { 2 } = \tau$ βin $H ^ { 1 2 } ( K ; \mathbb { Z } _ { 2 } )$ , where $\operatorname { S q } ^ { i } : H ^ { q } ( K ; \mathbb { Z } _ { 2 } ) \to H ^ { q + i } ( K ; \mathbb { Z } _ { 2 } )$ is the Steenrod square and $\sigma$ and $\tau$ σ σ τare generators of $H ^ { q } ( K ; \mathbb { Z } _ { 2 } )$ for $q = 6 , 1 2$ . But $\mathrm { S q ^ { 6 } } = \mathrm { S q ^ { 2 } S q ^ { 4 } } + \mathrm { S q ^ { 5 } S q ^ { 1 } }$ σby the Adem relation [Hat02, $\ S 4 . \mathrm { L } \mathrm { ] }$ . Note that $\mathrm { S q } ^ { i } ( \sigma ) = 0$ for $1 \leq i \leq 5$ for dimension reasons. Hence, $\tau = \mathrm { S q } ^ { 6 } ( \sigma ) = 0$ σ, a contradiction. An alternate way to see $H ( f ) \in \mathbb { Z }$ is to use the intersection-theoretic linking number as in [BT82] or [Whi57, §33].

Problem 1 counts 30 points in total. Part (a)–(c) counts 5 points each, and Part (d) counts 15 points, for instance, $H ( f ) \in \mathbb { Z } \left( 7 \mathrm { p t s } \right)$ , and $H ( f )$ is even (8pts).

Problem 2. For any $h \in C ^ { \infty } (  { \mathbb { R } } ^ { 2 } )$ and $h > 0$ on $\mathbb { R } ^ { 2 }$ , define the Ricci curvature $\operatorname { R i c } ( h )$ associated with $h$ by

$$
\operatorname {R i c} (h) = \frac {1}{h} \left(\frac {\partial^ {2}}{\partial x ^ {2}} + \frac {\partial^ {2}}{\partial y ^ {2}}\right) \log h,
$$

where $( x , y )$ are the standard Cartesian coordinates in $\mathbb { R } ^ { 2 }$ . Either construct a positive smooth function $h _ { 1 }$ ,such that $\operatorname { R i c } ( h _ { 1 } ) = 1$ , or show that there is no such function $h _ { 1 }$ exists.

Solution: Problem 2 covers manifolds of nonpositive curvature, Riemannian metrics, curvatures. It can be viewed as a Schwarz type lemma, or a baby version of the generalized maximum principle of Yau [Yau75], and Cheng-Yau [CY75].

The problem counts 20 points. The first part has negative answer (10 points, which rewards those students with good intuition or right sense). The second part, proof of the assertion, counts 10 points.

One way is to show $f$ has an upper bound and apply the generalized maximum principle. Alternatively one can also apply integration method. Since we have equality here, there will be more interesting solutions.

Problem 3. Let $M$ be an $n$ -dimensional Riemannian manifold, and $p \in M$ . Let $\{ e _ { 1 } , . . . , e _ { n } \}$ be an orthonormal basis of the tangent space $T _ { p } M$ , and let $\{ x ^ { 1 } , \ldots , x ^ { n } \}$ , . . . ,be a coordinate system of $M$ centered at $p$ such that

$$
\exp_ {p} ^ {- 1} (q) = \sum_ {j = 1} ^ {n} x ^ {j} (q) e _ {j},
$$

where $\exp _ { p }$ denotes the exponential map. Let $\gamma ( t ) = \exp _ { p } ( t e _ { 1 } )$ , $0 \leq t \leq \delta$ , where $\delta$ is a positive constant less than 1.

(a) For $2 \leq \alpha \leq n$ , which one of the following,

$$
t \frac {\partial}{\partial x ^ {\alpha}} \bigg | _ {\gamma (t)} \quad \text {o r} \quad \frac {\partial}{\partial x ^ {\alpha}} \bigg | _ {\gamma (t)},
$$

is a Jacobi field along $\gamma ( t ) ?$ Prove your assertion.

(b) Denote

$$
g _ {i j} = \left\langle \frac {\partial}{\partial x ^ {i}}, \frac {\partial}{\partial x ^ {j}} \right\rangle , \quad 1 \leq i, j \leq n.
$$

Compute

$$
\begin{array}{l} \frac {\partial^ {2} g _ {2 2}}{\partial x ^ {1} \partial x ^ {1}} \quad \text {a t t h e p o i n t} p. \end{array}
$$

(c) Show that

$$
\max _ {0 \leq t \leq \delta} \left| \frac {\partial g _ {2 2}}{\partial x ^ {1}} (\gamma (t)) \right| \leq C \delta A,
$$

where $C > 0$ is a constant depending only on $n$ , and $A$ is the $C ^ { 0 }$ -bound of the curvature tensor of $M$ >along $\gamma ( t )$ , for $0 \leq t \leq \delta$ .

Solution: Problem 3 covers Jacobi fields, Riemannian metrics, curvature, the exponential map, and geodesic.

For Part (a), only $t \partial / \partial x ^ { \alpha }$ is a Jacobi field along $\gamma ( t )$ . For Part (b), one way is to let

$$
g _ {2 2} = \frac {1}{t ^ {2}} \langle J, J \rangle , \quad J \equiv t \frac {\partial}{\partial x ^ {2}},
$$

and use the Jacobi equation to obtain $| J | ^ { 2 } = 1 + t ^ { 2 } R _ { 1 2 1 2 } / 3 + O ( t ^ { 3 } )$ ; hence,

$$
\frac {\partial^ {2} g _ {2 2}}{\partial x ^ {1} \partial x ^ {1}} (0) = \frac {2}{3} R _ {1 2 1 2}.
$$

For Part (c), one way is to write

$$
\frac {\partial g _ {2 2}}{\partial x ^ {1}} = \frac {1}{t ^ {3}} (t \langle J, J \rangle^ {\prime} - 2 \langle J, J \rangle)
$$

and apply the calculus identity

$$
t h ^ {\prime} (t) - 2 h (t) = - 2 h (0) - h ^ {\prime} (0) t + t ^ {2} \int_ {0} ^ {1} (2 \tau - 1) h ^ {\prime \prime} (\tau t) d \tau
$$

to $h ( t ) = | J | ^ { 2 } ( t )$ . Note that $h ^ { \prime \prime } = 2 R ( \gamma ^ { \prime } , J , \gamma ^ { \prime } , J ) + 2 \langle J ^ { \prime } , J ^ { \prime } \rangle$ . One still needs to express $\langle J ^ { \prime } , J ^ { \prime } \rangle$ in terms of integration of curvature; thus,

$$
\begin{array}{l} \frac {\partial g _ {2 2}}{\partial x ^ {1}} = \frac {2}{t} \int_ {0} ^ {1} (2 \tau - 1) R \left(\gamma^ {\prime}, J, \gamma^ {\prime}, J\right) (\tau t) d \tau \\ + \int_ {0} ^ {1} (2 \tau - 1) \tau \int_ {0} ^ {1} \left[ R \left(\gamma^ {\prime}, J, \gamma^ {\prime}, J\right) + R \left(\gamma^ {\prime}, J, \gamma^ {\prime}, J ^ {\prime}\right) \right] (\tau t \rho) d \rho d \tau . \\ \end{array}
$$

The estimate follows from the comparison theorem $\vert R ( \gamma ^ { \prime } , J , \gamma ^ { \prime } , J ) \vert ( \tau t ) \le C A t ^ { 2 } \tau ^ { 2 }$ and $\begin{array} { r } { | R ( \gamma ^ { \prime } , J , \gamma ^ { \prime } , J ^ { \prime } ) | \left( \tau \rho t \right) \leq } \end{array}$ C A t.

Part (b) is taken from [LP87, p. 60] and [SY94, p. 210, Lemma 3.4].

The point of Part (c) is that the constant A does not depend on the bounds of derivatives of curvature; a version of (c) is used in [WY20, (2.24)].

This problem counts 30 points, with Part (a) 5 points, Part (b) 10 points, and Part (c) 15 points.

Problem 4. Let ${ \mathrm { S O } } ( n )$ be the set of $n \times n$ orthogonal real matrices with determinant equal to 1. Endow ${ \mathrm { S O } } ( n )$ the relative topology as a subspace of Euclidean space $\mathbb { R } ^ { n ^ { 2 } }$ .

(a) Show that ${ \mathrm { S O } } ( n )$ is compact.   
(b) Is SO(3) homeomorphic to the real projective space $\mathbb { R } \mathbb { P } ^ { 3 } ?$ Prove your assertion.   
(c) Compute the fundamental group of SO(2020).

Solution: Problem 4 covers basics of matrix Lie group ${ \mathrm { S O } } ( n )$ in geometry, and fundamental groups, covering spaces, fibrations and the long exact sequence of fibration in topology.

Part (a) follows from the closedness and boundedness of ${ \mathrm { S O } } ( n )$ .

For Part (b), note that $S O ( 3 )$ consists of all rotations in $\mathbb { R } ^ { 3 }$ about the origin. Each such rotation, except the identity, is fixed by its axis and an angle $- \pi \leq \theta \leq \pi$ . Defines a map $\psi$ from the closed unit ball $B \subset \mathbb { R } ^ { 3 }$ to SO(3), by sending $x \in B \backslash \{ 0 \}$ π θ πto the rotation of angle $| x | \pi$ ψaround axis $x / | x |$ , and sending $x = 0$ to the identity. Then, $\psi$ is continuous. Note that a rotation of angle $\pi$ is the same as a rotation of angle $- \pi$ . Thus, $\psi ( x ) = \psi ( - x )$ ψ for $x \in \partial B = S ^ { 2 }$ . This means $\psi$ induces a map $B / { \sim } _ { \partial B } { \longrightarrow } \mathrm { S O } ( 3 )$ , where $x _ { 1 } \sim x _ { 2 }$ , $x _ { 1 } , x _ { 2 } \in \partial B$ if ψ ψand only if $x _ { 1 } = - x _ { 2 }$ ∂. Observe that $B / { \sim } _ { \partial B }$ ψ ∂ , is homeomorphic to the quotient of the upper hemi-sphere $S _ { + } ^ { 3 } / { \sim } _ { S ^ { 2 } }$ ∂by identifying the antipodal points on its equator $S ^ { 2 }$ ; the latter is precisely $\mathbb { R } \mathbb { P } ^ { 3 }$ . One can show the induced maps from $\mathbb { R } \mathbb { P } ^ { 3 }$ to SO(3) is continuous and bijective, and hence, it is an homeomorphism.

For Part (c), one way is to apply the exact sequence of homotopy groups to fibration

$$
\begin{array}{c} \mathrm {S O} (n) \longrightarrow \mathrm {S O} (n + 1) \\ \downarrow \\ S ^ {n} \end{array} \tag {2}
$$

to obtain $\pi _ { 1 } ( { \mathrm { S O } } ( n ) ) = \pi _ { 1 } ( { \mathrm { S O } } ( n + 1 ) )$ for $n \geq 3$ . On the other hand, by Part (b) we obtain $\pi _ { 1 } ( \mathrm { S O } ( 3 ) ) = \mathbb { Z } _ { 2 }$ , πby the fact that $S ^ { 3 }$ πis a double cover of $\mathbb { R } \mathbb { P } ^ { 3 }$ . Combining these yields $\pi _ { 1 } ( \mathrm { S O } ( n ) ) = \mathbb { Z } _ { 2 }$ πfor all $n \geq 3$ ; this in particular holds for $n = 2 0 2 0$ . Part (b) is taken from [Hat02, $\ S 3 0 ]$ π, the fibration 2 or the fact of homogeneous space $\mathrm { S O } ( n + 1 ) / \mathrm { S O } ( n )$ can be found in [Hat02, 4D.3] and [War83, p. 126], respectively.

This problem counts 30 points, with Part (a) 5 points, Part (b) 10 points, and Part (c) 15 points.

Problem 5. Let $X$ be a topological space and $\pi : \mathbb { R } ^ { 2 } \to X$ a covering map. Let $K$ be a compact subset of $X$ and $B$ πthe closed unit ball centered at the origin in $\mathbb { R } ^ { 2 }$ .

(a) Suppose $\pi : \mathbb { R } ^ { 2 } \setminus B \to X \setminus K$ is a homeomorphism. Show that $\pi : \mathbb { R } ^ { 2 } \to X$ is a homeomor-  
(b) Suppose $\mathbb { R } ^ { 2 } \setminus B$ is homeomorphic to $X \backslash K$ , where the homeomorphism may not be $\pi$ . Is $X$ necessarily homeomorphic to $\mathbb { R } ^ { 2 } ?$ Prove your assertion.

Solution: Problem 5 is taken from a problem that I made for the PhD Preliminary Topology Exam at the University of Connecticut, August 2018. It covers the covering spaces, which was motivated by a conversation with L. H. Huang on general relativity.

For Part (a), it suffices to show $\# \pi ^ { - 1 } ( y ) = 1$ , $y \in X$ . Pick a sequence $\{ x _ { k } \}$ in $\mathbb { R } ^ { 2 } \setminus B$ that tends to infinity; say $x _ { k }$ has coordinates $( 2 k , 0 )$ π for $k \geq 1$ . Then, $\pi ( \boldsymbol { x } _ { k } )$ has no limit in $X$ , in view of the homeomorphism $\pi : \mathbb { R } ^ { 2 } \setminus B \to X \setminus K$ ,. Suppose $\pi ^ { - 1 } ( \pi ( x _ { k } ) )$ πcontains more than one point; say $x _ { k } ^ { \prime } \neq x _ { k }$ . Then, $x _ { k } ^ { \prime }$ has to lie in πB. By compactness of $B$ π π, a subsequence $\{ x _ { k _ { l } } ^ { \prime } \}$ converges to a point $x _ { * } \in B$ . This implies $\pi ( \boldsymbol { x } _ { k _ { l } } )$ converges to a point $p ( x _ { * } )$ in $X$ , a contradiction.

The answer to (b) is “no.” For example, let $X$ be the torus $S ^ { 1 } \times S ^ { 1 }$ and $K = ( \{ a \} \times S ^ { 1 } ) \cup ( S ^ { 1 } \times \{ b \} ) \cup D$ where $D$ is a small disk away from the two circles. Then, $X \backslash K$ is homeomorphic to $\mathbb { R } ^ { 2 } \setminus B$ , but $\mathbb { R } ^ { 2 }$ is not homeomorphic to $X$ .

This problem counts 20 points, with 10 points each part.

Problem 6. Let $F _ { n }$ be the free group of rank $n$ ,

(a) Give an example of a finite connected graph such that its fundamental group is $F _ { 2 }$   
(b) Does $F _ { 2 }$ contain a proper subgroup isomorphic to $F _ { 2 }$ ?   
(c) Does $F _ { 2 }$ contain a proper finite index subgroup isomorphic to $F _ { 2 }$

Solution: Let $\pi _ { 1 } ( X )$ and $\chi ( X )$ be the fundamental group and Euler characteristic of a finite connected graph $X$ π χrespectively. Recall several facts:

(1) $\pi _ { 1 } ( X )$ is a free group of rank $1 - \chi ( X )$   
(2) The correspondence between the subgroups of $\pi ( X )$ and the covering spaces of $X$ , and coverings of graphs are still graphs.   
(3) $\chi ( \tilde { X } ) = d \chi ( X )$ for a finite covering $\tilde { X }$ of degree $d$ of $X$ .

Now we have the answer as below:

Part (b), Yes: pick any graph $X$ of $\chi ( X ) = - 1$ , say the figure eight, let $\tilde { X }$ be the double covering of $X$ . Then we have $\chi ( \tilde { X } ) = - 2$ by (3), $\chi ( X ) = F _ { 2 }$ , $\chi ( \tilde { X } ) = F _ { 3 }$ by (1), so $F _ { 2 }$ has a subgroup $F _ { 3 }$ by (2). Clearly $F _ { 3 }$ has a χ χproper subgroup isomorphic to $F _ { 2 }$ . So $F _ { 2 }$ χ contains a proper subgroup isomorphic to $F _ { 2 }$ .

Part (c), No: Pick $X$ as in Part (a). If $F _ { 2 }$ contains a subgroup $G$ of index $d$ isomorphic to $F _ { 2 }$ , $d > 1$ , then there is a degree $d$ covering $\tilde { X }$ of $X$ with $\pi _ { ( } \tilde { X } ) = G$ by (2), and $\chi ( \tilde { X } ) = - d$ , so the rank of $\pi _ { 1 } ( { \tilde { X } } ) = 1 + d > 2$ by (1), which contradicts that $G = F _ { 2 }$ .

# References

[BT82] Raoul Bott and Loring W. Tu. Differential forms in algebraic topology, volume 82 of Graduate Texts in Mathematics. Springer-Verlag, New York-Berlin, 1982.   
[CY75] Shiu-Yuen Cheng and Shing-Tung Yau. Differential equations on Riemannian manifolds and their geometric applications. Comm. Pure Appl. Math., 28(3):333–354, 1975.   
[Hat02] Allen Hatcher. Algebraic topology. Cambridge University Press, Cambridge, 2002.   
[LP87] John M. Lee and Thomas H. Parker. The Yamabe problem. Bull. Amer. Math. Soc. (N.S.), 17(1):37–91, 1987.   
[SY94] R. Schoen and S. T. Yau. Lectures on differential geometry. Conference Proceedings and Lecture Notes in Geometry and Topology, I. International Press, Cambridge, MA, 1994. Lecture notes prepared by Wei Yue Ding, Kung Ching Chang [Gong Qing Zhang], Jia Qing Zhong and Yi Chao Xu, Translated from the Chinese by Ding and S. Y. Cheng, Preface translated from the Chinese by Kaising Tso.   
[War83] Frank W. Warner. Foundations of differentiable manifolds and Lie groups, volume 94 of Graduate Texts in Mathematics. Springer-Verlag, New York-Berlin, 1983. Corrected reprint of the 1971 edition.   
[Whi57] Hassler Whitney. Geometric integration theory. Princeton University Press, Princeton, N. J., 1957.   
[WY20] Damin Wu and Shing-Tung Yau. Invariant metrics on negatively pinched complete Kähler manifolds. J. Amer. Math. Soc., 33(1):103–133, 2020.   
[Yau75] Shing Tung Yau. Harmonic functions on complete Riemannian manifolds. Comm. Pure Appl. Math., 28:201–228, 1975.
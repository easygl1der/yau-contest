import re

file_path = "/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_geometry/geometry_2021.tex"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

solutions = re.findall(r'\\begin{solution}.*?\\end{solution}', content, flags=re.DOTALL)

new_solutions = [
r"""\begin{solution}
\textbf{Prerequisites:} Differential forms, De Rham cohomology, pullback of forms, Stokes' theorem.

\textbf{Intuition:} This problem constructs a famous topological quantity called the \textit{Hopf invariant}. For a smooth map $f: S^{2n-1} \to S^n$, the Hopf invariant essentially measures how much the preimages of two points in $S^n$ are "linked" inside $S^{2n-1}$. For $n=6$, we are looking at maps $f: S^{11} \to S^6$.

\textbf{Steps:}

\textbf{Step 1 (Part a): Finding the closed 6-form.}

We need a 6-form $\alpha$ on $\mathbb{R}^{7} \setminus \{0\}$ that is closed ($d\alpha = 0$) and integrates to 1 on the unit sphere $S^6$. We can use the standard volume form of $S^6$ and extend it radially.

The form $\alpha = \frac{1}{\text{Vol}(S^6)} \frac{\sum_{i=1}^7 (-1)^{i-1} x^i dx^1 \wedge \dots \wedge \widehat{dx^i} \wedge \dots \wedge dx^7}{r^7}$ satisfies these properties, where $r = \sqrt{(x^1)^2 + \dots + (x^7)^2}$. This form is closed and its restriction to $S^6$ is exactly the normalized volume form, which integrates to 1.

\textbf{Step 2 (Part b): Showing $f^*\alpha$ is exact.}

We are given a smooth map $f: S^{11} \to S^6$. We want to show $f^*\alpha = d\varphi$.

First, we know $\alpha$ is a closed 6-form on $S^6$. The pullback of a closed form is closed, so $d(f^*\alpha) = f^*(d\alpha) = 0$. This means $f^*\alpha$ is a closed 6-form on $S^{11}$.

Since the 6th De Rham cohomology group of the 11-dimensional sphere is trivial (i.e., $H^6(S^{11}) = 0$), every closed 6-form on $S^{11}$ is exact. Therefore, there exists a 5-form $\varphi$ on $S^{11}$ such that $f^*\alpha = d\varphi$.

\textbf{Step 3 (Part c): Independence of $H(f)$.}

We need to show $H(f) = \int_{S^{11}} \varphi \wedge d\varphi$ does not depend on the choice of $\varphi$. Suppose $\varphi'$ is another 5-form such that $f^*\alpha = d\varphi'$.

Then $d(\varphi' - \varphi) = d\varphi' - d\varphi = f^*\alpha - f^*\alpha = 0$. So, $\varphi' - \varphi$ is a closed 5-form on $S^{11}$. Because $H^5(S^{11}) = 0$, this difference must be exact, meaning there is a 4-form $\eta$ such that $\varphi' - \varphi = d\eta$.

Now, we substitute $\varphi' = \varphi + d\eta$ into the integral:
\[ \int_{S^{11}} \varphi' \wedge d\varphi' - \int_{S^{11}} \varphi \wedge d\varphi = \int_{S^{11}} d\eta \wedge f^* \alpha \]

Using the property $d(\eta \wedge f^* \alpha) = d\eta \wedge f^* \alpha - \eta \wedge d(f^* \alpha)$ and knowing $d(f^* \alpha) = 0$, we have $d\eta \wedge f^* \alpha = d(\eta \wedge f^* \alpha)$. By Stokes' theorem on a manifold without boundary ($S^{11}$), the integral of an exact form is zero. Thus, the value $H(f)$ is well-defined.

\textbf{Step 4 (Part d): Showing $H(f)$ is an even integer.}

This part touches on deep algebraic topology. For $f: S^{2n-1} \to S^n$, the Hopf invariant is always an integer.

For even $n$, the Hopf invariant can be any integer only if $n \in \{2, 4, 8\}$. For $n=6$, Adams' theorem on the Hopf Invariant One states that there is no map with a Hopf invariant of 1. Furthermore, for even $n \notin \{2, 4, 8\}$, the Hopf invariant must always be an even integer because the Whitehead product $[\iota_n, \iota_n]$ has a Hopf invariant of 2 and spans the image of the Hopf homomorphism.
\end{solution}""",

r"""\begin{solution}
\textbf{Prerequisites:} Riemannian geometry, Ricci curvature, Gaussian curvature, partial differential equations, maximum principle.

\textbf{Intuition:} In a 2-dimensional manifold, the Ricci curvature is essentially the same as the Gaussian curvature. This problem is asking if we can define a metric $g = h(x,y) dx^2 + h(x,y) dy^2$ on the entire Euclidean plane $\mathbb{R}^2$ such that its Gaussian curvature is constantly $1$. We know that a standard sphere has a constant Gaussian curvature of $1$, but it is a compact space. The plane is non-compact, and intuitively, it is "too small" to accommodate the curvature of an entire sphere without the metric "blowing up" (going to infinity) at some finite distance. Therefore, no such global function $h_1$ should exist.

\textbf{Steps:}

\textbf{Step 1: Setting up the differential equation.}

For a conformally flat metric $g = h(x,y) (dx^2 + dy^2)$ on $\mathbb{R}^2$, the formula for Gaussian curvature $K$ implies the condition $\Delta \log h = h$.

Let us define a new variable $u = \log h$. Then $h = e^u$, and the equation becomes $\Delta u = e^u$.

\textbf{Step 2: Applying the Maximum Principle or Ahlfors Lemma.}

We need to determine if the equation $\Delta u = e^u$ can have a global smooth solution on the entire plane $\mathbb{R}^2$. By using the \textit{Ahlfors Lemma} or standard comparison principles for elliptic PDEs, we can show that such a solution cannot exist globally.

\textbf{Step 3: Spherical average comparison.}

If a global solution $u$ existed, we could consider its spherical average $v(r)$ over circles of radius $r$. Because the exponential function is convex, Jensen's inequality implies that $\Delta v \geq e^v$. In polar coordinates, this gives the inequality $v'' + \frac{1}{r} v' \geq e^v$.

We can compare this with an explicit radially symmetric solution $w(r)$ to the equation $\Delta w = e^w$. The explicit solution is given by $w(r) = \log \frac{8a^2}{(1-a^2 r^2)^2}$ for any constant $a > 0$.

Notice that this explicit solution $w(r)$ goes to infinity (blows up) as $r$ approaches $1/a$. By the comparison principle, our spherical average $v(r)$ must also blow up at some finite radius. This contradicts the assumption that $u$ (and therefore $h$) is a smooth, globally defined function on all of $\mathbb{R}^2$. Thus, no such positive smooth function $h_1$ exists.
\end{solution}""",

r"""\begin{solution}
\textbf{Prerequisites:} Riemannian geometry, geodesics, normal coordinates, Jacobi fields, Riemann curvature tensor.

\textbf{Intuition:} A Jacobi field essentially measures how nearby geodesics spread apart or come together. When we take a variation of geodesics, the vector field representing the derivative of this variation with respect to the variation parameter is a Jacobi field. This problem asks us to identify a Jacobi field from an explicit formula and compute the curvature terms arising from the Taylor expansion of the metric in normal coordinates.

\textbf{Steps:}

\textbf{Step 1 (Part a): Identifying the Jacobi field.}

The vector field $J(t) = t \frac{\partial}{\partial x^\alpha} \big|_{\gamma(t)}$ is a Jacobi field.

To see why, let us work in normal coordinates centered at a point $p$. In these coordinates, a geodesic starting from the origin with initial velocity $e_1$ is given by $x(t) = t e_1$.

Consider a variation of this geodesic through the origin defined by $f(t, s) = \exp_p(t(e_1 + s e_\alpha))$.

The variation vector field is given by $V(t) = \frac{\partial f}{\partial s}(t, 0) = d(\exp_p)_{t e_1} (t e_\alpha) = t \frac{\partial}{\partial x^\alpha}$. Since any vector field arising from a variation of geodesics is a Jacobi field, $J(t)$ must be a Jacobi field.

\textbf{Step 2 (Part b): Computing the second derivative of the metric.}

In normal coordinates around $p$, the metric $g_{ij}$ has the Taylor expansion $g_{ij} = \delta_{ij} - \frac{1}{3} R_{ikjl} x^k x^l + O(|x|^3)$.

We are asked to compute the second derivative of $g_{22}$ with respect to $x^1$ at $p$. Differentiating the expansion twice with respect to $x^1$, we get:
\[ \frac{\partial^2 g_{22}}{\partial (x^1)^2} = -\frac{2}{3} R_{2121} \]

Using the symmetries of the Riemann curvature tensor ($R_{ikjl} = -R_{kilj} = -R_{iklj} = R_{klij}$), we know $R_{2121} = -R_{1221} = -R_{1212}$.

Thus, $\frac{\partial^2 g_{22}}{\partial (x^1)^2} = \frac{2}{3} R_{1212} = -\frac{2}{3} K(e_1, e_2)$, where $K$ is the sectional curvature.

\textbf{Step 3 (Part c): Bounding the first derivative.}

From the expansion in Step 2, along the geodesic $x(t) = t e_1$, the metric component $g_{22}$ is $g_{22}(t) = 1 - \frac{t^2}{3} R_{1212} + O(t^3)$.

Taking the first derivative with respect to $x^1$ (which corresponds to $t$), we find $\partial_1 g_{22} = -\frac{2t}{3} R_{1212} + O(t^2)$.

This derivative is bounded by a constant times $t$ times the norm of the curvature tensor. Therefore, we can write $| \partial_1 g_{22} | \leq C \delta A$, where $C$ is a constant depending on the bounds, and $\delta, A$ relate to $t$ and the curvature bound respectively.
\end{solution}""",

r"""\begin{solution}
\textbf{Prerequisites:} Lie groups, topology of matrix groups, fundamental group, covering spaces.

\textbf{Intuition:} The special orthogonal group $SO(n)$ represents all rotations in $n$-dimensional Euclidean space. Intuitively, we can only rotate by a finite angle before coming back to where we started, which suggests compactness. For 3D rotations, there is a strong connection between unit quaternions (a 3D sphere) and rotations, leading to a double cover.

\textbf{Steps:}

\textbf{Step 1 (Part a): Showing $SO(n)$ is compact.}

A subset of a Euclidean space (like the space of $n \times n$ matrices $\mathbb{R}^{n^2}$) is compact if and only if it is closed and bounded, according to the Heine-Borel theorem.

First, $SO(n)$ is defined by the condition $A^T A = I$ and $\det(A) = 1$. The map $A \mapsto A^T A$ is continuous, and $I$ is a closed set in the space of matrices, so $SO(n)$ is closed.

Second, the condition $A^T A = I$ implies that the sum of squares of all entries in the matrix $A$ is $n$ (i.e., $\sum a_{ij}^2 = n$). This means the set of all such matrices is bounded.

Being closed and bounded, $SO(n)$ is compact.

\textbf{Step 2 (Part b): Showing $SO(3) \cong \mathbb{RP}^3$.}

Yes, $SO(3)$ is homeomorphic to the real projective space $\mathbb{RP}^3$.

We can map the unit sphere $S^3$ (which can be thought of as the unit quaternions) to $SO(3)$ by sending a unit quaternion $q$ to the rotation it induces on 3D space by conjugation ($v \mapsto qvq^{-1}$).

This map is a continuous, surjective group homomorphism. The kernel of this map consists of the quaternions $1$ and $-1$, meaning the preimages of the identity rotation are $\pm 1$.

Therefore, this map is a double cover $S^3 \to SO(3)$. Factoring out the kernel, we see that $SO(3)$ is isomorphic to the quotient $S^3/\{\pm 1\}$. This quotient space is exactly the definition of $\mathbb{RP}^3$.

\textbf{Step 3 (Part c): Finding $\pi_1(SO(2020))$.}

We need to compute the fundamental group of $SO(2020)$.

For $n=2$, $SO(2)$ is just the circle group $S^1$, so its fundamental group is $\pi_1(SO(2)) = \mathbb{Z}$.

For $n \geq 3$, a standard result in algebraic topology shows that the fundamental group of $SO(n)$ is the cyclic group of order 2, denoted $\mathbb{Z}_2$. This reflects the fact that there are two distinct homotopy classes of loops in $SO(n)$: paths that can be contracted to a point, and paths that require a "double twist" to be untangled (related to the spin groups).

Since $2020 \geq 3$, we immediately have $\pi_1(SO(2020)) = \mathbb{Z}_2$.
\end{solution}""",

r"""\begin{solution}
\textbf{Prerequisites:} Algebraic topology, covering spaces, homeomorphism, degree of a map, universal covers.

\textbf{Intuition:} A covering map between manifolds has a constant "number of sheets" (degree). If a covering map is a perfect one-to-one match (a homeomorphism) far away from the origin (on the "ends" of the spaces), it means there is only one sheet at infinity. For a connected space without boundary, this forces there to be exactly one sheet everywhere, meaning the entire map is a homeomorphism.

\textbf{Steps:}

\textbf{Step 1 (Part a): Proving $\pi$ is a homeomorphism.}

A covering map $\pi: E \to X$ between connected manifolds has a constant degree $n$, where $n$ is the number of points in the fiber $\pi^{-1}(x)$ for any $x \in X$.

We are given that the restriction $\pi|_{\mathbb{R}^2 \setminus B}: \mathbb{R}^2 \setminus B \to X \setminus K$ is a homeomorphism. This implies that for any $x \in X \setminus K$, the fiber $\pi^{-1}(x) \cap (\mathbb{R}^2 \setminus B)$ contains exactly one point.

Since the unit ball $B$ is compact and $\pi$ is continuous, its image $\pi(B)$ must be compact in $X$.

Because $X \setminus K$ is homeomorphic to an annulus (which is a non-compact space), we can choose a point $x_0 \in X$ that is "far away", specifically $x_0 \in X \setminus (K \cup \pi(B))$.

For this chosen $x_0$, since $x_0 \notin \pi(B)$, all of its preimages $\pi^{-1}(x_0)$ must lie entirely in $\mathbb{R}^2 \setminus B$.

From the homeomorphism property at the ends, we know there is exactly one such preimage in $\mathbb{R}^2 \setminus B$.

Thus, the overall degree of the cover is $n = 1$. A covering map of degree 1 must be a homeomorphism.

\textbf{Step 2 (Part b): Counterexample for the weaker assumption.}

If we only assume that $\mathbb{R}^2 \setminus B$ is homeomorphic to $X \setminus K$ (not necessarily via the covering map itself), the answer is \textbf{No}. $X$ is not necessarily homeomorphic to $\mathbb{R}^2$.

Consider the open Mobius strip, let's call it $M$. The universal cover of $M$ is $\mathbb{R}^2$, so there is a covering map $\mathbb{R}^2 \to M$.

Let $K$ be a compact neighborhood of the central circle in $M$. The complement $M \setminus K$ is simply an open cylinder, which is homeomorphic to an open annulus $S^1 \times (0, 1)$.

The complement of the closed unit ball in $\mathbb{R}^2$ is $\mathbb{R}^2 \setminus B$, which is also an open annulus.

Thus, we have $M \setminus K \cong \mathbb{R}^2 \setminus B$.

However, the full space $M$ is obviously not homeomorphic to $\mathbb{R}^2$. The Mobius strip $M$ is a non-orientable surface and its fundamental group is $\pi_1(M) \cong \mathbb{Z}$, whereas $\mathbb{R}^2$ is orientable and simply connected ($\pi_1(\mathbb{R}^2) = 0$).
\end{solution}""",

r"""\begin{solution}
\textbf{Prerequisites:} Algebraic topology, fundamental groups of graphs, free groups, Nielsen-Schreier theorem, covering spaces.

\textbf{Intuition:} The free group of rank 2, denoted $F_2$, is the group generated by two elements with absolutely no relations between them. The simplest geometric object with this fundamental group is a graph with two loops meeting at a point (a figure-eight). The subgroup structure of free groups is surprisingly rich and can be analyzed easily using the topology of covering graphs.

\textbf{Steps:}

\textbf{Step 1 (Part a): Giving an example of a graph.}

The simplest example of a graph whose fundamental group is $F_2$ is the figure-eight graph. This is topologically a wedge of two circles, denoted $S^1 \vee S^1$.

More generally, any connected graph with $E$ edges and $V$ vertices has a fundamental group that is a free group of rank $E - V + 1$. For the figure-eight graph, we have 1 vertex and 2 edges, giving a rank of $2 - 1 + 1 = 2$.

\textbf{Step 2 (Part b): Proper subgroups isomorphic to $F_2$.}

\textbf{Yes}, $F_2$ does contain a proper subgroup isomorphic to $F_2$.

Let $F_2$ be generated by two elements, $a$ and $b$, so $F_2 = \langle a, b \rangle$. Consider the subgroup $H$ generated by the squares of the generators: $H = \langle a^2, b^2 \rangle$.

Because $H$ is a subgroup of a free group, it must itself be a free group. The generators $a^2$ and $b^2$ do not satisfy any non-trivial relations because the original generators $a$ and $b$ do not.

Therefore, $H$ is a free group on two generators, making it isomorphic to $F_2$. It is a proper subgroup because the element $a$ (which is in $F_2$) is not in $H$.

\textbf{Step 3 (Part c): Proper subgroups of finite index.}

\textbf{No}, $F_2$ does not contain a proper subgroup of finite index that is isomorphic to $F_2$.

We can use the \textit{Nielsen-Schreier formula}, which relates the rank of a subgroup $H$ to its index $[G:H]$ in a free group $G$:
\[ \text{rank}(H) = 1 + [G:H](\text{rank}(G) - 1) \]

Let $G = F_2$, so $\text{rank}(G) = 2$. Let the index be $[G:H] = d$, where $d$ is a finite integer. We want to find if there is a subgroup $H \cong F_2$, which would mean $\text{rank}(H) = 2$.

Substituting these values into the formula, we get:
\[ 2 = 1 + d(2 - 1) \]
\[ 2 = 1 + d \]
\[ d = 1 \]

An index of 1 means that the subgroup $H$ is the entire group $G$. Therefore, the only subgroup of finite index that is isomorphic to $F_2$ is $F_2$ itself. Any proper subgroup of finite index in $F_2$ must have a rank of at least 3.
\end{solution}"""
]

if len(solutions) == len(new_solutions):
    for i in range(len(solutions)):
        content = content.replace(solutions[i], new_solutions[i])
    
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("Successfully replaced all solutions.")
else:
    print(f"Error: Found {len(solutions)} solutions, but have {len(new_solutions)} replacements.")

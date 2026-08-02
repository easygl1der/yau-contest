# Yau 2025 Applied Math – Individual Contest

1. Consider the following boundary value problem for the stationary Schr¨odinger equation:

$$
- \Delta u (\mathbf {x}) + V (\mathbf {x}) u (\mathbf {x}) = 0 \quad \text { in } \Omega ; \quad \partial_ {\nu} u (\mathbf {x}) = \psi (\mathbf {x}) \quad \text { on } \partial \Omega ,\tag{1}
$$

where $V \in L ^ { 2 } ( \Omega )$ , ν denotes the exterior unit normal vector to $\partial \Omega .$ , and $\psi \in H ^ { - 1 / 2 } ( \partial \Omega )$ . It is assumed that 0 is not a Neumann eigenvalue of the operator $- \Delta + V$ in $\Omega ,$ ensuring the boundary value problem (1) is well-posed with a unique solution $u \in H ^ { 1 } ( \Omega )$ for any ψ. For fixed $\psi ,$ define the boundary dataset:

$$
\mathcal {M} _ {\psi} := u | _ {\partial \Omega} \in H ^ {1 / 2} (\partial \Omega),\tag{2}
$$

where u solves (1). The inverse problem is to recover $V$ from $\mathcal { M } _ { \psi }$ with a given $\psi ,$ formulated as the operator equation:

$$
F (V) = \mathcal {M} _ {\psi},\tag{3}
$$

where F is defined via (1).

(a) Prove that $F$ in (3) is Fr´echet diferentiable and derive its derivative.

(b) Suppose V ∈ Span $\{ V _ { 1 } ( \mathbf { x } ) , \ldots , V _ { N } ( \mathbf { x } ) \}$ for given functions $V _ { j }$ . Sketch a Newton-type method for solving (3) using (a).

2. Consider the linear transport equation with variable coeficients:

$$
u _ {t} + a (x) u _ {x} + a ^ {\prime} (x) u = 0, \quad x \in [ 0, 1 ], t > 0,
$$

with periodic boundary conditions and initial data $u ( x , 0 ) = u _ { 0 } ( x )$ . Assume $a ( x ) \in C ^ { 2 } ( [ 0 , 1 ] )$ , and $a ( x ) > 0$ for all x.

(a) Rewrite the PDE in conservation form and explain the meaning of conservation in this context.

(b) Construct a second-order central diference scheme using numerical fluxes $F _ { j + 1 / 2 } ^ { n }$ . Ensure that your scheme is at least conditionally stable.

(c) Derive a CFL condition for the case $a ( x ) \equiv a _ { 0 }$ (constant) by applying von Neumann stability analysis.

3. Consider a smooth simple closed curve C with a bounded interior region Ω in $\mathbb { R } ^ { 2 }$ . Formulate a variational problem to show that, among all such curves with a fixed enclosed area A, the circle minimizes the perimeter $L .$

4. In $\mathbb { R } ^ { 3 }$ , prove that the shape of the intersection of

• the unit 4-norm ball $x ^ { 4 } + y ^ { 4 } + z ^ { 4 } \leq 1$ , and

• the plane $x + y + z = 0$

is a disk. (This is a simplified problem that arises in conic mathematical optimization.)
# Yau 2025 Applied Math – Individual Overall Contest

1. Given a convex function $f : \mathbb { R } ^ { n }  \cdot$ <sup>R</sup> and a scalar $\alpha > 0$ , the proximal operator $\mathbf { p r o x } _ { \alpha , f }$ of $f$ is defined as the mapping from a point $x \in \mathbb { R } ^ { n }$ to the unique solution of the minimization problem:

$$
\min _ {y \in \mathbb {R} ^ {n}} f (y) + \frac {1}{2 \alpha} \| y - x \| _ {2} ^ {2}.
$$

(For the solution to always exist, we technically assume $f$ is closed and proper, but these conditions are not crucial for this problem.)

Many functions, such as $\lVert x \rVert _ { 1 }$ and $\| x \| _ { 2 }$ , have explicit forms for their proximal operators. For a fixed $\alpha > 0$ and $n \in \mathbb { N }$ , perform the following:

(a) Derive the explicit formula for $\mathbf { p r o x } _ { \alpha , f }$ when $f ( x ) = \| x \| _ { 1 }$

(b) Derive the explicit formula for $\mathbf { p r o x } _ { \alpha , g }$ when $g ( x ) = \| x \| _ { 2 }$

(c) Prove that prox $\mathbf { \Lambda } _ { f + g } = \mathbf { p r o x } _ { g } \circ \mathbf { p r o x } _ { f }$ holds for $f ( x ) = \| x \|$ <sub>1</sub> and $g ( x ) = \| x \| _ { 2 }$

2. Consider the boundary value problem:

$$
\left\{ \begin{array}{l} \varepsilon y ^ {\prime \prime} + (1 + \varepsilon) y ^ {\prime} + y = 0, x \in (0, 1), \varepsilon > 0 \\ y (0) = 0, y (1) = 1. \end{array} \right.
$$

Derive the leading-order uniform approximation of the solution as $\varepsilon \to 0$
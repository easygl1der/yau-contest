## Question I

Suppose $A \in M_{n \times n}(\mathbb{C})$ is normal, i.e., $A = QDQ^{*}$ for some unitary $Q.$ . Also, we suppose there are k dominant eigenvalues of A, i.e.,

$$
| \lambda_{1} | \geq \dots \geq | \lambda_{k} | > | \lambda_{k + 1} | \geq \dots \geq | \lambda_{n} |
$$

Consider the power iteration:

$$
\mathbf{x}^{m + 1} = A \mathbf{x}^{m}.
$$

Define the angle between a non-zero vector x and a non-trivial subspace $W$

$$
\cos \angle(\mathbf{x}, W) := \max \big \{\cos \angle(\mathbf{x}, \mathbf{y}): \mathbf{y} \in W \setminus \{0\} \big\},
$$

$$
\sin \angle(\mathbf{x}, W) := \min \big \{\sin \angle(\mathbf{x}, \mathbf{y}): \mathbf{y} \in W \setminus \{0\} \big\},
$$

$$
\tan \angle(\mathbf{x}, W) := \frac{\sin \angle(\mathbf{x}, W)}{\cos \angle(\mathbf{x}, W)}.
$$

Using the given definitions, prove that:

1. Let W be a nontrivial subspace of $\mathbb{C}^{n}$ and P be the orthogonal projection onto $W$ Then, for $\mathbf{x} \neq \mathbf{0}$ and $\mathbf{x} \notin W$ 2

$$
\cos \angle(\mathbf{x}, W) = \frac{\| P \mathbf{x} \|}{\| \mathbf{x} \|}, \sin \angle(\mathbf{x}, W) = \frac{\| \mathbf{x} - P \mathbf{x} \|}{\| \mathbf{x} \|}, \tan \angle(\mathbf{x}, W) = \frac{\| \mathbf{x} - P \mathbf{x} \|}{\| P \mathbf{x} \|}
$$

Here, $| | \cdot | |$ is the usual Euclidean norm in $\mathbb{C}^{n}$

2. Let $\{\delta_{i} : i = 1, \cdots, n\}$ be the standard ordered basis for $\mathbb{C}^{n}$ . Let $W_{k} : = \operatorname{span} \{Q \delta_{j}$ : $j = 1, \cdots, k\}$ and let cos $\angle(\mathbf{x}^{0}, W_{k}) \neq 0$ . Then,

$$
\tan \angle(\mathbf{x}^{m + 1}, W_{k}) \leq \frac{| \lambda_{k + 1} |}{| \lambda_{k} |} \tan \angle(\mathbf{x}^{m}, W_{k}).
$$

## Question II

Consider the linear system $A x = b $ . The (Generalized minimal residual method) GMRES method is a projection method which obtains a solution in the $m \cdot$ -th Krylov subspace $K_{m}$ so that the residual is orthogonal to $AK_{m}$ . Let $r_{0}$ be the initial residual and let $v_{0} = r_{0}$ . The Arnoldi process (see the hint below) is applied to build an orthonormal system $v_{1}, v_{2}, \ldots, v_{m - 1}$ with $v_{1} = Av_{0} / \lVert Av_{0} \rVert_{2} \(\lVert \cdot \rVert_{2^{-}}$ the $l^{2}$ norm). The approximate solution is obtained from the following space

$$
K_{m} = \operatorname{span} \left\{v_{0}, v_{1}, \dots, v_{m - 1} \right\}.
$$

1. Show that the approximate solution is obtained as the solution of a least-square problem, and that this problem is triangular.

2. Prove that the residual $r_{k}$ is orthogonal to $\{v_{1}, v_{2}, \ldots, v_{k - 1}\}$

3. Find a formula for the residual norm.

4. Derive the complete GMRES algorithm.

Hint: The Arnoldi process uses the stabilized Gram-Schmidt process to produce a sequence of orthonormal vectors $v_{1}, v_{2}, v_{3}, \ldots$ . Explicitly, the algorithm is as follows:

(1.) Start with an arbitrary vector $v_{1}$ with norm 1.

(2.) Repeat for $k = 2, 3, \ldots$

i. $v_{k} Av_{k}$ −1

ii. for j from 1 to $k - 1$

A. $h_{j, k - 1} v_{j}^{*} v_{k}$

B. $v_{k} v_{k} - h_{j, k - 1} v_{j}$

iii. $h_{k, k - 1} \| v_{k} \|_{2}$

iv. $\begin{array}{r}{v_{k} \frac{v_{k}}{h_{k, k - 1}}} \end{array}$
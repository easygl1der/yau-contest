# S.-T. Yau College Student Mathematics Contests 2015 Applied Math. and Computational Math. Individual (5 problems)

Problem 1. Let r and s be relatively prime positive integers. Prove that the number of lattice paths from $(0, 0)$ to $(r, s)$ , which consists of steps $(1, 0)$ and $(0, 1)$ and never go above the line $ry = sx$ is given by

$$
\frac{1}{r + s} \binom{r + s}{s}.
$$

Problem 2. The following $2 \times 2$ block matrix

$$
C(\alpha) = \left[\begin{array}{ll} \alpha I & A \\ A^{T} & 0 \end{array} \right]
$$

plays a key role in an augmented system method to solve linear least squares problem, a fundamental numerical linear algebra problem for fitting a linear model to observations subject to errors in science, where $A \in \mathbb{R}^{m \times n}$ is of full rank $n \leq m$ , I is a $m \times m$ identity matrix, and $\alpha \geq 0$ . Prove the following results which address the question of optimal choice of scaling α for stabiltiy of the augmented system method.

(a) The eigenvalues of $C(\alpha)$ are

$$
\frac{\alpha}{2} \pm \left(\frac{\alpha^{2}}{4} + \sigma_{i}^{2}\right)^{1 / 2} \quad \text{for} i = 1, 2, \dots, n, \quad \text{and} \quad \alpha \quad(m - n \text{times}),
$$

where $\sigma_{i}$ for $i = 1, 2, \dots, n$ are the singular values of $A_{i}$ , arranged in the decreasing order, i.e., $\sigma_{1} \geq \sigma_{2} \geq \cdot \cdot \cdot \geq \sigma_{n}$

(b) The condition number $\kappa_{2}(C(\alpha)) = \| C(\alpha) \|_{2} \|[C(\alpha)]^{- 1} \|_{2}$ has the following bounds:

$$
\sqrt{2} \kappa_{2}(A) \leq \min_{\alpha} \kappa_{2}(C(\alpha)) \leq 2 \kappa_{2}(A),
$$

with min $\iota_{\alpha} \kappa_{2}(C(\alpha))$ being achieved for $\alpha = \sigma_{n} / \sqrt{2}$ , and

$$
\max_{\alpha} \kappa_{2}(C(\alpha)) > \kappa_{2}(A)^{2},
$$

where $\| \cdot \|$ is the spectral norm of a matrix.

Recall that any matrix $A \in \mathbb{R}^{m \times n}$ has a singular value decomposition (SVD):

$$
A = U \Sigma V^{T}, \quad \Sigma = \operatorname{diag}(\sigma_{1}, \sigma_{2}, \dots, \sigma_{p}) \in \mathbb{R}^{m \times n}, \quad p = \min(m, n),
$$

where $\sigma_{1} \geq \sigma_{2} \geq \cdot \cdot \cdot \geq \sigma_{p} \geq 0$ , and $U \in \mathbb{R}^{m \times m}$ $V \in \mathbb{R}^{n \times n}$ are both orthogonal. The $\sigma_{i}$ are the singular values of A and the columns of $U$ and $V$ are the left and right singular vectors of $A.$ , respectively.

Problem 3. Solve the following linear hyperbolic partial diferential equation

$$
u_{t} + au_{x} = 0, \quad t \geq 0,\tag{1}
$$

where a is a constant. Using the finite diference approximation, we can obtain the forward-time central-space scheme as follows,

$$
\frac{u_{m}^{n + 1} - u_{m}^{n}}{k} + a \frac{u_{m + 1}^{n} - u_{m - 1}^{n}}{2h} = 0,\tag{2}
$$

where k and h are temporal and spatial mesh sizes.

(a) Show that when we fix $\lambda = k / h$ as a positive constant, the forward-time centralspace scheme (2) is consistent with equation (1).

(b) Analyze the stability of this method. Is the method stable with $\lambda = k / h$ being fixed as a constant?

(c) How would the answer change if you are allowed to make $\lambda = k / h$ small?

(d) Would this is a good scheme to use even if you can make it stable by making λ small? If not, please provide a simple modification to make this scheme stable by keeping λ fixed.

Problem 4. Let A, $H, Q \in \mathbb{C}^{n \times n}$ and Q is non-singular. Assume that $H = Q^{- 1} AQ$ and H is properly upper Hessenberg. Show that

$$
\operatorname{span} \left\{q_{1}, q_{2}, \dots, q_{j} \right\} = \mathcal{K}_{j}(A, q_{1}), \quad j = 1, 2, \dots, n
$$

where $q_{j}$ is the j-th column of $Q{\mathrm{.}}$ , and $\mathcal{K}_{j}(A, q_{1}) = \operatorname{span} \{q_{1}, Aq_{1}, \dotsc, A^{j - 1} q_{1}\}$

Problem 5. Minkowski Problem.

![](parts/images/8aa7dbaa139cd44216ec19adf97d7e311fb6d9fd4f2010b23df95e48f9e42d33.jpg)

Assume $P$ is a convex polyhedron embedded in $\mathbb{R}^{3}$ , the faces are $\{F_{1}, F_{2}, \cdots, F_{k}\}$ the unit normal vector to the face $F_{i}$ is $\mathbf{n}_{i},$ the area of $F_{i}$ is $A_{i}, 1 \leq i \leq k$

• Show that

$$
A_{1} \mathbf{n}_{1} + A_{2} \mathbf{n}_{2} + \dots A_{k} \mathbf{n}_{k} = \mathbf{0},\tag{3}
$$

• Given k unit vectors $\{\mathbf{n}_{1}, \mathbf{n}_{2}, \cdots, \mathbf{n}_{k}\}$ which can not be contained in any half space, and k real positive numbers $\{A_{1}, A_{2}, \cdot \cdot \cdot, A_{k}\}, A_{i} > 0$ , and satisfying the condition (3), show that there exists a convex polyhedron $P,$ , whose face normals are $\mathbf{n}_{i}{\mathrm{' s.}}$ , face areas are $A_{i}^{\prime} s$
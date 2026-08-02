# Applied Math., Computational Math., Probability and Statistics

Individual (Please select 5 problems to solve)

1. Let $Z_{1}, \cdots, Z_{n}$ be i.i.d. random variables with $Z_{i} \sim N(\mu, \sigma^{2})$ . Find

$$
E(\sum_{i = 1}^{n} Z_{i} | Z_{1} - Z_{2} + Z_{3}).
$$

2. Let $X_{1}, \cdots, X_{n}$ be pairwise independent. Further, assume that $EX_{i} \ = \1 + \i^{- 1}$ and that $\operatorname{max}_{1 \leq i \leq n} E | X_{i} |^{1 + \epsilon} < \infty$ for some $\epsilon > 0$ Show that

$$
\frac{1}{n} \sum_{i = 1}^{n} X_{i} \xrightarrow{P} 1.
$$

3. Let $Z_{1}, \cdots, Z_{6}$ be i.i.d. random variables with $Z_{i} \sim N(0, 1)$ . Set

$$
U^{2} = \frac{(Z_{1} Z_{2} + Z_{3} Z_{4} + Z_{5} Z_{6})^{2}}{Z_{2}^{2} + Z_{4}^{2} + Z_{6}^{2}}, V^{2} = \frac{U^{2}(Z_{2}^{2} + Z_{4}^{2})}{U^{2} + Z_{6}^{2}}.
$$

Find and identify the densities of $U^{2}$ and $V^{2}$ .

4. Suppose that three characteristics in a large propulation can be observed according to the following frequencies

$$
p_{1} = \theta^{3}, \quad p_{2} = 3 \theta(1 - \theta), \quad p_{3} =(1 - \theta)^{3},
$$

where $\theta \in(0, 1)$ . Let $N_{j}, ~ j = 1, 2, 3$ be the observed frequencies of characteristic $j$ in a random sample of size n.

(a) Construct the approximate level $(1 - \alpha)$ maximum likelihood confidence set for θ.

(b) Derive the asymptotic distribution for the frequency substitution estimator $\hat{\theta}_{2} = 1 -(N_{3} / n)^{1 / 3}$

5. (1) Suppose

$$
S = \left[\begin{array}{cc} \sigma & \mathbf{u}^{T} \\ 0 & S_{c} \end{array} \right], \quad T = \left[\begin{array}{cc} \tau & \mathbf{v}^{T} \\ 0 & T_{c} \end{array} \right], \quad \mathbf{b} = \left[\begin{array}{c} \beta \\ \mathbf{b}_{c} \end{array} \right],
$$

where $\sigma, \tau$ and $\beta$ are scalars, $S_{c}$ and $T_{c}$ are n-by-n matrices, and ${\bf b}_{c}$ is an n-vector. Show that if there exists a vector $\mathbf{x}_{c}$ such that

$$
(S_{c} T_{c} - \lambda I) \mathbf{x}_{c} = \mathbf{b}_{c}
$$

and $\mathbf{w}_{c} = T_{c} \mathbf{x}_{c}$ is available, then

$$
\mathbf{x} = \left[\begin{array}{c} \gamma \\ \mathbf{x}_{c} \end{array} \right], \quad \gamma = \frac{\beta - \sigma \mathbf{v}^{T} \mathbf{x}_{c} - \mathbf{u}^{T} \mathbf{w}_{c}}{\sigma \tau - \lambda}
$$

solves $(ST - \lambda I) \mathbf{x} = \mathbf{b}$

(2) Hence or otherwise, derive an $O(n^{2})$ algorithm for solving the linear system $(U_{1} U_{2} - \lambda I) \mathbf{x} =$ b where $U_{1}$ and $U_{2}$ are $n{\mathrm{-}} \mathrm{by -}$ n upper triangular matrices, and $\left(U_{1} U_{2} - \lambda I \right)$ is nonsingular. Please write down your algorithm and prove that it is indeed of $O(n^{2})$ complexity.

(3) Hence or otherwise, derive an $O(pn^{2})$ algorithm for solving the linear system $(U_{1} U_{2} \cdot \cdot \cdot U_{p} - \lambda I) \mathbf{x} =$ b where $\{U_{i}\}_{i = 1}^{p}$ are all $n -$ by-n upper triangular matrices, and $(U_{1} U_{2} \cdot \cdot \cdot U_{p} - \lambda I)$ is nonsingular. Please write down your algorithm and prove that it is indeed of $O(pn^{2})$ ) complexity.

6. (1) Let $A \in \mathbb{R}^{m \times n}$ , i.e. A is an m-by-n real matrix. Show that there exists an m-by-m orthogonal matrix $U$ and an $n{\mathrm{-}} \mathrm{by}{\mathrm{-}} n$ orthogonal matrix $\check{V}$ such that

$$
U^{T} AV = \operatorname{diag} \left(\sigma_{1}, \sigma_{2}, \dots, \sigma_{p}\right),
$$

where p = min $\{m, n\}$ and

$$
\sigma_{1} \geq \sigma_{2} \geq \ldots \geq \sigma_{p} \geq 0.
$$

(2) Let $\operatorname{rank}(A) = r$ . Show that for any positive integer $k < r.$ •

$$
\min_{\operatorname{rank}(B) = k} \| A - B \|_{2} = \sigma_{k + 1}.
$$

(Hint: Consider the matrix $A_{k} = \sum_{i = 1}^{k} \sigma_{i} \mathbf{u}_{i} \mathbf{v}_{i}^{T}$ , where $\mathbf{u}_{i}$ and $\mathbf{v}_{i}$ are columns of U and V respectively.)
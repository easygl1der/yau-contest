# GROUP TEST S.-T YAU COLLEGE MATH CONTESTS 2012

## Applied Math. and Computational Math.

Please solve 4 out of the following 5 problems.

1. If the function $u(x)$ is in $C^{k + 1}$ (has continuous $(k + 1)$ -th derivative) on the interval [0, 2], and a sequence of polynomials $p_{n}(x) \(n =$ $1, 2, 3, \ldots)$ of degree at most k satisfies

$$
| u(x) - p_{n}(x) | \leq \frac{C}{n^{k + 1}} \quad \forall 0 \leq x \leq \frac{1}{n},\tag{1}
$$

where the constant C is independent of $n_{\mathrm{:}}$ , prove

$$
| u(x) - p_{n}(x) | \leq \frac{\tilde{C}}{n^{k + 1}} \quad \forall \frac{1}{n} \leq x \leq \frac{2}{n},
$$

with another constant $\tilde{C}$ which is also independent of $n.$ .

2. Consider the one-dimensional elliptic equation

$$
- \frac{d^{2}}{dx^{2}} u(x) = f(x), \quad 0 < x < 1,
$$

with homogeneous boundary condition, $u(0) = 0$ and $u(1) = 0, f \in$ $L^{2}(0, 1)$

(i) Describe the standard piecewise linear finite element method for this boundary value problem.

(ii) Is this method stable and convergent? If so, what is the order of convergence?

(iii). In this case, the linear finite element method has a super convergence property at the nodal point $x_{j} ~(j = 1, 2,..., N)$ , i.e. $u_{h}(x_{j}) =$ $u(x_{j})$ , here $u_{h}$ is the finite element solution and u is the exact solution. Could you explain why?

3. Let $A =(a_{ij}) \in M_{N \times N}(\mathbb{C})$ be strictly diagonally dominant, that is,

$$
\left| a_{ii} \right| > \sum_{j = 1, j \neq i}^{N} \left| a_{ij} \right| \text{for all} 1 \leq i \leq N,
$$

Assume that $A = I + L + U$ where I is the identity matrix, L and U are the lower and upper triangular matrices with zero diagonal entries.

Now, we consider solving the linear system $Ax = b$ by the following iterative scheme:

$$
x^{k + 1} =(I + \alpha \Omega L)^{- 1}[(I - \Omega) -(1 - \alpha) \Omega L - \Omega U)] x^{k} +(I + \alpha \Omega L)^{- 1} b
$$

where $\begin{array}{r}{\Omega : = \operatorname{diag}(\omega_{1},...\omega_{N})} \end{array}$ and $0 \leq \alpha \leq 1$ . (When $\alpha = 1$ , it gives the SOR method.)

(1) Prove that the linear system $Ax = b$ has a unique solution.

(2) Prove that the necessary condition for the convergence of $(^{*})$ is

$$
\prod_{i = 1}^{N} \left| 1 - \omega_{i} \right| < 1
$$

(3) Let $M =(I + \alpha \Omega L)^{- 1}[(I - \Omega) -(1 - \alpha) \Omega L - \Omega U)]$ . Prove that the spectral radius $\rho(M)$ of M is bounded by:

$$
\rho(M) \leq \max_{i} \frac{| 1 - \omega_{i} | + | \omega_{i} |(| 1 - \alpha | l_{i} + u_{i})}{1 - | \omega_{i} \alpha | l_{i}}
$$

whenever $| \omega_{i} \alpha | l_{i} < 1$ for all $1 \leq i \leq N$ where $\begin{array}{r}{l_{i} = \sum_{j < i} | a_{ij} |} \end{array}$ and $\begin{array}{r}{u_{i} = \sum_{j > i} | a_{ij} |} \end{array}$

(4) Using (c), prove that the suficient condition for the convergence of $(^{*})$ is

$$
0 < \omega_{i} < \frac{2}{1 + l_{i} + u_{i}} \text{for all} 1 \leq i \leq N
$$

4. The famous RSA cryptosystem is based on the assumed dificulty of factoring integers $N = pq$ (called RSA integers) which are products of two large primes $p$ and $q$ which should be kept secret. Currently $p$ and q are chosen to be about 500 bits long, that is,

$$
p, q \approx 2^{500}.
$$

Assume someone uses the following algorithm to find secret n-bit primes $p$ and $q$ to form an RSA integer $N = pq \mathrm{:}$

• Choose a random odd 500-bit integer s.

• Test the odd numbers $s, s + 2, s + 4$ , etc. for primality until the first prime $p$ is found (note the primality testing is very easy nowdays).

• Continue testing $p + 2, p + 4, p + 6$ , etc. for primality until the second prime $q$ is found.

• Compute and publish $N = pq$ , but keep p and $q$ secret.

How secure is this procedure? Can you suggest an algorithm to factor an RSA integer $N = pq$ generated this way?

Note that there are about $x /$ log x primes up to x, where log x is the natural logarithm. This means that the expected gap between two consecutive n-bit primes is

$$
\log 2^{n} = n \log 2 \approx 0.69 \cdot n.
$$

5. The solution $h(r, t)$ of the following Boussinesq equation describes the hight of a circular drop of fluid spreading on a dry surface $h = 0$

$$
\frac{\partial h}{\partial t} = \Delta_{r}(h^{2}) = \frac{1}{r} \frac{\partial}{\partial r} \left(r \frac{\partial(h^{2})}{\partial r}\right), \quad r > 0, \quad t > 1
$$

with

$$
\left.\frac{\partial h}{\partial r} \right|_{r = 0} = 0, \quad \int_{0}^{\infty} h(r, t) rdr \equiv \frac{1}{64}
$$

The solution is positive on a finite range $0 \leq r \leq r_{*}(t)$ with $h(r_{*}(t), t) =$ 0 defining a moving “edge” position with no fluid outside of the droplet. For $r > r_{*}(t)$ truncate the solution beyond the edge to be zero $(\h \equiv 0$ for $r > r_{*}(t))$ ).

(a): Show that this problem is scale invariant by finding relations $h(r, t) = H(T) \tilde{h}(\tilde{r}, \tilde{t}), r = R(T) \tilde{r}, t = T \tilde{t}$ so that the problem for $\tilde{h}(\tilde{r}, \tilde{t})$ is identical to the original problem.

(b): Determine the ODE for the similarity function $\Phi(\eta)$ with $h(r, t) = t^{\alpha} \Phi(\eta), r = \eta t^{\beta}.$

(c): Determine the explicit solution for $\Phi(\eta)$ and then use $h(r, t) =$ $t^{\alpha} \Phi(\eta)$ to find $r_{*}(t)$ for $t \geq 1$

Hint $\begin{array}{r}{\int_{0}^{\infty} hrdr = \int_{0}^{\dot{r}_{*}} hrdr} \end{array}$
# Applied Math., Computational Math., Probability and Statistics

Team (Please select 5 problems to solve)

1. Let $X_{1}, \cdots, X_{n}$ be independent and identically distributed random variables with continuous distribution functions $F(x_{1}), \cdot \cdot \cdot, F(x_{n})$ , respectively. Let $Y_{1} < \cdots < Y_{n}$ be the order statistics of $X_{1}, \cdots, X_{n}$ Prove that $Z_{j} = F(Y_{j})$ has the beta $(j, n - j + 1)$ distribution $(j =$ $1, \cdots, n)$

2. Let $X_{1}, \cdots, X_{n}$ be i.i.d. random variable with a continuous density $f$ at point 0. Let

$$
Y_{n, i} = \frac{3}{4b_{n}}(1 - X_{i}^{2} / b_{n}^{2}) I(| X_{i} | \leq b_{n}).
$$

Show that

$$
\frac{\sum_{i = 1}^{n}(Y_{n, i} - EY_{n, i})}{(b_{n} \sum_{i = 1}^{n} Y_{n, i})^{1 / 2}} \xrightarrow{L} N(0, 3 / 5),
$$

provided $b_{n} \to 0$ and $nb_{n} \to \infty$

3. Let $X_{1}, \cdots, X_{n}$ be independently and indentically distributed random variables with $X_{i} \sim N(\theta, 1)$ . Suppose that it is known that $| \theta | \leq \tau,$ where τ is given. Show

$$
\min_{a_{1}, \dots, a_{n + 1}} \sup_{| \theta | \leq \tau} E(\sum_{i = 1}^{n} a_{i} X_{i} + a_{n + 1} - \theta)^{2} = \frac{\tau^{2} n^{- 1}}{\tau^{2} + n^{- 1}}.
$$

Hint: Carefully use the suficiency principle.

4. The rules for “1 and $1^{\mathfrak{s}}$ foul shooting in basketball are as follows. The shooter gets to try to make a basket from the foul line. If he succeeds, he gets another try. More precisely, he make 0 baskets by missing the first time, 1 basket by making the first shot and xsmissing the second one, or 2 baskets by making both shots.

Let n be a fixed integer, and suppose a player gets n tries at “ 1 and $1^{\mathfrak{s}}$ shooting. Let $N_{0}, \N_{1}$ , and $N_{2}$ be the random variables recording the number of times he makes $0, ~ 1$ , or 2 baskets, respectively. Note that $N_{0} + N_{1} + N_{2} = n$ . Suppose that shots are independent Bernoulli trails with probability p for making a basket.

(a) Write down the likelihood for $(N_{0}, N_{1}, N_{2})$

(b) Show that the maximum likelihood estimator of $p$ is

$$
\hat{p} = \frac{N_{1} + 2N_{2}}{N_{0} + 2N_{1} + 2N_{2}}.
$$

(c) Is $\hat{p}$ an unbiased estimator for $p ?$ Prove or disprove. (Hint: $E \hat{p}$ is a polynomial in $p,$ whose order is higher than 1 for $p \in(0, 1).\dj$ (d) Find the asymptotic distribution of $\hat{p}$ as n tends to $\infty$ .

5. When considering finite diference schemes approximating partial diferential equations (PDEs), for example, the scheme

$$
u_{j}^{n + 1} = u_{j}^{n} - \lambda(u_{j}^{n} - u_{j - 1}^{n})\tag{1}
$$

where $\lambda = \frac{\Delta t}{\Delta x}$ , approximating the PDE

$$
u_{t} + u_{x} = 0,\tag{2}
$$

we are often interested in stability, namely

$$
| | u^{n} | | \leq C | | u^{0} | |, \quad n \Delta t \leq T\tag{3}
$$

for a constant $C = C(T)$ independent of the time step $\Delta t$ and the spatial mesh size $\Delta x$ . Here ||·|| is a given norm, for example the $L^{2}$ norm or the $L^{\infty}$ norm, of the numerical solution vector $u^{n} =(u_{1}^{n}, u_{2}^{n}, \cdot \cdot \cdot, u_{N}^{n})$ The mesh points are $x_{j} = j \Delta x, t^{n} = n \Delta t.$ , and the numerical solution $u_{j}^{n}$ approximates the exact solution $u(x_{j}, t^{n})$ of the PDE (2) with a periodic boundary condition.

(i) Prove that the scheme (1) is stable in the sense of (3) for both the $L^{2}$ norm and the $L^{\infty}$ norm under the time step restriction $\lambda \leq 1$

(ii) Since the numerical solution $u^{n}$ is in a finite dimensional space, Student A argues that the stability (3), once proved for a specific norm $| | \cdot | |_{a},$ would also automatically hold for any other norm $| | \cdot | |_{b}.$ . His argument is based on the equivalency of all norms in a finite dimensional space, namely for any two norms $| | \cdot | |_{a}$ and $| | \cdot | |_{b}$ on a finite dimensional space $W$ , there exists a constant $\delta > 0$ such that

$$
\delta | | u | |_{b} \leq | | u | |_{a} \leq \frac{1}{\delta} | | u | |_{b}.
$$

Do you agree with his argument? If yes, please give a detailed proof of the following theorem: If a scheme is stable, namely (3) holds for one particular norm (e.g. the $L^{2}$ norm), then it is also stable for any other norm. If not, please explain the mistake made by Student A.

6. We have the following 3 PDEs

(4)

$$
u_{t} + Au_{x} = 0,\tag{5}
$$

$$
u_{t} + Bu_{x} = 0,
$$

$$
u_{t} + Cu_{x} = 0, \qquad C = A + B.\tag{6}
$$

Here u is a vector of size m and A and B are $m \times m$ real matrices. We assume $m \geq 2$ and both A and B are diagonalizable with only real eigenvalues. We also assume periodic initial condition for these PDEs.

(i) Prove that (4) and (5) are both well-posed in the $L^{2} \mathrm{- norm}$ Recall that a PDE is well-posed if its solution satisfies

$$
| | u(\cdot, t) | | \leq C(T) | | u(\cdot, 0) | |, \quad 0 \leq t \leq T
$$

for a constant $C(T)$ which depends only on T .

(ii) Is (6) guaranteed to be well-posed as well? If yes, give a proof; if not, give a counter example.

(iii) Suppose we have a finite diference scheme

$$
u^{n + 1} = A_{h} u^{n}
$$

for approximating (4) and another scheme

$$
u^{n + 1} = B_{h} u^{n}
$$

for approximating (5). Suppose both schemes are stable in the $L^{2}.$ -norm, namely (3) holds for both schemes. If we now form the splitting scheme

$$
u^{n + 1} = B_{h} A_{h} u^{n}
$$

which is a consistent scheme for solving (6), is this scheme guaranteed to be $L^{2}$ stable as well? If yes, give a proof; if not, give a counter example.
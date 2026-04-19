# Computational and Applied Mathematics

Solve every problem.

Problem 1. Let $f \in C^{k+1}[-1,1]$ and $[-1,1]$ be partitioned into subintervals $I_j = [(j-1)h,jh]$ of width $h$ . Assume $p$ is a polynomial of degree $k$ which approximates $f$ in $I_j$ with

$$
\max  _ {x \in I _ {j}} \left| p _ {j} (x) - f (x) \right| \leq C _ {0} h ^ {k + 1},
$$

where $C_0$ is a constant independent of $j$ . Show that there exists an another constant $C$ , independent of $j$ , such that

$$
\max  _ {x \in I _ {j \pm 1}} \left| p _ {j} (x) - f (x) \right| \leq C h ^ {k + 1}.
$$

(as long as $I_{j\pm 1}\subset [-1,1]$ , of course).

Solution: Pick points $0 \leq x_0 < x_1 < \dots < x_k \leq 1$ , and let

$$
L _ {i} (x) = \prod_ {l \neq i} \frac {x - x _ {l}}{x _ {i} - x _ {l}}
$$

be the $l$ -th Lagrange polynomial. Let

$$
\Lambda = \sum_ {i = 0} ^ {k} \max  _ {x \in [ - 1, 2 ]} | L _ {i} (x) |.
$$

On $I_{j}$ we use rescaled versions with $x_{ji} = (j - 1)h + hx_{i}$ , and

$$
L _ {j i} (x) = \prod_ {l \neq i} \frac {x - x _ {j l}}{x _ {j i} - x _ {j l}}.
$$

Note that $\Lambda$ is unchanged with

$$
\Lambda = \sum_ {i} \max  _ {x \in L _ {j \pm 1}} \left| L _ {j i} (x) \right|.
$$

Let $f_{j}$ be the interpolating polynomial on $I_{j}$

$$
f _ {j} (x) = \sum_ {i = 0} ^ {k} f \left(x _ {j i}\right) L _ {j i} (x),
$$

and note that also

$$
p _ {j} (x) = \sum_ {i} p (x _ {j i}) L _ {j i} (x).
$$

Then for $x\in I_{j\pm 1}$

$$
\begin{array}{l} \left| p _ {j} (x) - f (x) \right| \leq \left| p _ {j} (x) - f _ {j} (x) \right| + \left| f _ {j} (x) - f (x) \right| \\ = \left| \sum_ {i = 0} ^ {k} \left(f \left(x _ {j i}\right) - p _ {j} \left(x _ {j i}\right) L _ {j i} (x) \right. \right\rvert + \left| R _ {k} f (x) \right| \\ \leq \max  _ {x \in I _ {j}} | f (x) - p _ {j} (x) | \Lambda + \frac {\| f ^ {(k + 1)} \|}{(k + 1) !} \max  _ {x \in I _ {j \pm 1}} \left| \prod_ {i = 0} ^ {k} (x - x _ {j i}) \right| \\ \leq C _ {0} \Lambda h ^ {k + 1} + \frac {\| f ^ {(k + 1)} \|}{(k + 1) !} \max  _ {x} | (2 h) ^ {k + 1} | \\ = C h ^ {k + 1}, \\ \end{array}
$$

$$
C = C _ {0} \Lambda + \frac {2 ^ {k + 1} \| f ^ {(k + 1)} \|}{(k + 1) !}.
$$

# Problem 2. Consider the iteration

$$
x _ {n + 1} = x _ {n} - \left(\frac {x _ {n} - x _ {0}}{f (x _ {n}) - f (x _ {0})}\right) f (x _ {n})
$$

for finding the roots of a two times continuous differentiable function $f(x)$ . Assuming the method converges to a simple root $x^*$ , what is the rate of convergence? Justify your answer.

Solution: The iteration may be rewritten as

$$
x _ {n + 1} = \frac {[ x _ {n} f (x _ {n}) - x _ {n} f (x _ {0}) ] - [ x _ {n} f (x _ {n}) - x _ {0} f (x _ {n}) ]}{f (x _ {n}) - f (x _ {0})} = \frac {x _ {0} f (x _ {n}) - x _ {n} f (x _ {0})}{f (x _ {n}) - f (x _ {0})}.
$$

Thus

$$
x _ {n + 1} - x ^ {*} = \frac {x _ {0} f (x _ {n}) - x _ {n} f (x _ {0})}{f (x _ {n}) - f (x _ {0})} - x ^ {*} = \frac {(x _ {0} - x ^ {*}) f (x _ {n}) - (x _ {n} - x ^ {*}) f (x _ {0})}{f (x _ {n}) - f (x _ {0})}.
$$

Taylor's Theorem asserts that there is $\xi_{n}$ between $x_{n}$ and $x^{*}$ such that

$$
0 = f \left(x ^ {*}\right) = f \left(x _ {n}\right) + f ^ {\prime} \left(\xi_ {n}\right) \left(x ^ {*} - x _ {n}\right) \quad \Rightarrow \quad f \left(x _ {n}\right) = f ^ {\prime} \left(\xi_ {n}\right) \left(x _ {n} - x ^ {*}\right).
$$

This implies

$$
x _ {n + 1} - x ^ {*} = \frac {(x _ {0} - x ^ {*}) f ^ {\prime} (\xi_ {n}) - f (x _ {0})}{f (x _ {n}) - f (x _ {0})} (x _ {n} - x ^ {*}).
$$

Evaluating the limit as $n\to \infty$ $\xi_{n}\rightarrow x^{*}$ and

$$
\lim _ {n \to \infty} \left| \frac {x _ {n + 1} - x ^ {*}}{x _ {n} - x ^ {*}} \right| = \lim _ {n \to \infty} \left| \frac {(x _ {0} - x ^ {*}) f ^ {\prime} (\xi_ {n}) - f (x _ {0})}{f (x ^ {*}) - f (x _ {0})} \right| = \left| \frac {(x _ {0} - x ^ {*}) \lim _ {n \to \infty} f ^ {\prime} (\xi_ {n}) - f (x _ {0})}{0 - f (x _ {0})} \right|.
$$

Applying Taylor's expression one more time, we know there is $\eta$ between $x^{*}$ and $x_0$ such that

$$
f (x _ {0}) = f (x ^ {*}) + f ^ {\prime} (x ^ {*}) (x _ {0} - x ^ {*}) + \frac {f ^ {\prime \prime} (\eta)}{2} (x _ {0} - x ^ {*}) ^ {2},
$$

So

$$
f ^ {\prime} \left(x ^ {*}\right) \left(x _ {0} - x ^ {*}\right) - f \left(x _ {0}\right) = - \frac {f ^ {\prime \prime} (\eta)}{2} \left(x _ {0} - x ^ {*}\right) ^ {2}.
$$

Therefore

$$
\lim  _ {n \rightarrow \infty} \left| \frac {x _ {n + 1} - x ^ {*}}{x _ {n} - x ^ {*}} \right| = \left| \frac {f ^ {\prime \prime} (\eta)}{2 f (x _ {0})} \right| (x _ {0} - x ^ {*}) ^ {2}.
$$

Note the right hand side is dependent only upon $x^{*}$ and $x_0$ . Since we know $x_{n}\to x^{*}$ , this shows the rate of convergence is linear.

Problem 3. Suppose $\mathbf{A}$ is an $m \times m$ matrix with a complete set of orthonormal eigenvectors $\mathbf{q}_1, \ldots, \mathbf{q}_m$ and corresponding eigenvalues $\lambda_1, \ldots, \lambda_m$ . Assume that $|\lambda_1| > |\lambda_2| > |\lambda_3|$ and $\lambda_j \geq \lambda_{j+1}$ for $j = 3, \ldots, m$ . Consider the power method $\mathbf{v}^{(k)} = \mathbf{A}\mathbf{v}^{(k-1)} / \lambda_1$ , with $\mathbf{v}^{(0)} = \alpha_1\mathbf{q}_1 + \dots + \alpha_m\mathbf{q}_m$ where $\alpha_1$ and $\alpha_2$ are both nonzero. Show that the sequence $\{\mathbf{v}^{(k)}\}_{k=0}^{\infty}$ converges linearly to $\alpha_1\mathbf{q}_1$ with asymptotic constant $C = |\lambda_2 / \lambda_1|$ .

Solution: Matrix A has following eigen-decomposition

$$
\mathbf {A} = \left[ \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \right] \left[ \begin{array}{c c c c} \lambda_ {1} & & & \\ & \lambda_ {2} & & \\ & & \ddots & \\ & & & \lambda_ {m} \end{array} \right] \left[ \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \right] ^ {- 1},
$$

thus

$$
\mathbf {A} ^ {k} = \left[ \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \right] \left[ \begin{array}{c c c c} \lambda_ {1} ^ {k} & & & \\ & \lambda_ {2} ^ {k} & & \\ & & \ddots & \\ & & & \lambda_ {m} ^ {k} \end{array} \right] \left[ \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \right] ^ {- 1}.
$$

The power method reduces to

$$
\begin{array}{l} \mathbf {v} ^ {(k)} = \mathbf {A} ^ {k} \frac {\mathbf {v} ^ {(0)}}{\lambda_ {1} ^ {k}} \\ = \left[ \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \right] \left[ \begin{array}{c c c c} \lambda_ {1} ^ {k} & & & \\ & \lambda_ {2} ^ {k} & & \\ & & \ddots & \\ & & & \lambda_ {m} ^ {k} \end{array} \right] \left[ \begin{array}{c} \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \end{array} \right] ^ {- 1} \left[ \begin{array}{c} \mathbf {q} _ {1}, \mathbf {q} _ {2}, \dots , \mathbf {q} _ {m} \end{array} \right] \left[ \begin{array}{c} \frac {\alpha_ {1}}{\lambda_ {1} ^ {k}} \\ \frac {\alpha_ {2}}{\lambda_ {1} ^ {k}} \\ \vdots \\ \frac {\alpha_ {m}}{\lambda_ {1} ^ {k}}, \end{array} \right] \\ = \alpha_ {1} \mathbf {q} _ {1} + \sum_ {j = 2} ^ {m} \left(\frac {\lambda_ {j}}{\lambda_ {1}}\right) ^ {k} \alpha_ {j} \mathbf {q} _ {j}, \\ \end{array}
$$

from this we deduce $\mathbf{v}^{(k)}\to \alpha_{1}\mathbf{q}_{1}$ as $k\rightarrow \infty$ , since $|\lambda_j / \lambda_1| < 1$ for $j = 2,\ldots ,m$

To show the convergence is linear with asymptotic constant $C = |\lambda_2 / \lambda_1|$ we need to verify the limit

$$
\lim  _ {k \rightarrow \infty} \frac {\left|\left| e ^ {(k + 1)} \right|\right|}{\left|\left| e ^ {(k)} \right|\right|} = \lim  _ {k \rightarrow \infty} \frac {\left|\left| \mathbf {v} ^ {(k + 1)} - \alpha_ {1} \mathbf {q} _ {1} \right|\right|}{\left|\left| \mathbf {v} ^ {(k)} - \alpha_ {1} \mathbf {q} _ {1} \right|\right|} = \left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| \quad (\text {h e r e} | | \cdot | | d e n o t e s t h e L _ {2} - n o r m).
$$

Note that $e^{(k)} = \sum_{j=2}^{m} \left( \frac{\lambda_j}{\lambda_1} \right)^k \alpha_j \mathbf{q}_j$ , using the orthonormality of the eigenvectors we have

$$
| | e ^ {(k)} | | ^ {2} = \sum_ {j = 2} ^ {m} \left| \frac {\lambda_ {j}}{\lambda_ {1}} \right| ^ {2 k} | \alpha_ {j} | ^ {2} = \left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| ^ {2 k} \left(| \alpha_ {2} | ^ {2} + \sum_ {j = 3} ^ {m} \left| \frac {\lambda_ {j}}{\lambda_ {2}} \right| ^ {2 k} | \alpha_ {j} | ^ {2}\right),
$$

similarly

$$
\left| \left| e ^ {(k + 1)} \right| \right| ^ {2} = \left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| ^ {2 (k + 1)} \left(\left| \alpha_ {2} \right| ^ {2} + \sum_ {j = 3} ^ {m} \left| \frac {\lambda_ {j}}{\lambda_ {2}} \right| ^ {2 (k + 1)} \left| \alpha_ {j} \right| ^ {2}\right).
$$

Thus

$$
\begin{array}{l} \lim  _ {k \rightarrow \infty} \frac {\left|\left| e ^ {(k + 1)} \right|\right|}{\left|\left| e ^ {(k)} \right|\right|} = \lim  _ {k \rightarrow \infty} \left(\frac {\left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| ^ {2 (k + 1)} \left(| \alpha_ {2} | ^ {2} + \sum_ {j = 3} ^ {m} \left| \frac {\lambda_ {j}}{\lambda_ {2}} \right| ^ {2 (k + 1)} | \alpha_ {j} | ^ {2}\right)}{\left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| ^ {2 k} \left(| \alpha_ {2} | ^ {2} + \sum_ {j = 3} ^ {m} \left| \frac {\lambda_ {j}}{\lambda_ {2}} \right| ^ {2 k} | \alpha_ {j} | ^ {2}\right)}\right) ^ {\frac {1}{2}} \\ = \left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| \frac {| \alpha_ {2} |}{| \alpha_ {2} |} \quad (\text {w e h a v e u s e d} | \lambda_ {2} | > | \lambda_ {3} | \geq | \lambda_ {j} | \text {f o r} j > 3) \\ = \left| \frac {\lambda_ {2}}{\lambda_ {1}} \right| \quad (\text {s i n c e} \alpha_ {2} \neq 0). \\ \end{array}
$$

Problem 4. For the initial value problem $y' = f(t, y)$ , $y(0) = y_0$ on the interval $[0, T]$ , consider the implicit two-step method

$$
y _ {n + 1} = \frac {4}{3} y _ {n} - \frac {1}{3} y _ {n - 1} + \frac {2 h}{3} f \left(t _ {n + 1}, y _ {n + 1}\right),
$$

$$
y _ {1} = y _ {0} + h f (t _ {1}, y _ {0}),
$$

where $h$ is the step size and $t_n = nh$ .

(a) What is the order of the accuracy of the scheme?   
(b) Check the stability of the scheme by analyzing the stability polynomial?   
(c) Find the stability region of the scheme.

Solution: (a) Let $y(t)$ be the exact solution, then the truncation error of form

$$
h \tau_ {n + 1} := y (t _ {n + 1}) - \left(\frac {4}{3} y (t _ {n}) - \frac {1}{3} y (t _ {n - 1}) + \frac {2 h}{3} f (t _ {n + 1}, y (t _ {n + 1}))\right)
$$

can be estimated by using Taylor expansion to every term involved:

$$
\begin{array}{l} y \left(t _ {n + 1}\right) = y _ {n} + h y _ {n} ^ {\prime} + \frac {1}{2} h ^ {2} y _ {n} ^ {\prime \prime} + \frac {1}{6} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O \left(h ^ {4}\right), \\ - \frac {1}{3} y _ {n - 1} = - \frac {1}{3} y _ {n} + \frac {1}{3} h y _ {n} ^ {\prime} - \frac {1}{6} h ^ {2} y _ {n} ^ {\prime \prime} + \frac {1}{1 8} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O \left(h ^ {4}\right), \\ \frac {2 h}{3} f \left(t _ {n + 1}, y _ {n + 1}\right) = \frac {2 h}{3} y _ {n + 1} ^ {\prime} = \frac {2}{3} h y _ {n} ^ {\prime} + \frac {2}{3} h ^ {2} y _ {n} ^ {\prime \prime} + \frac {1}{3} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O \left(h ^ {4}\right). \\ \end{array}
$$

Hence

$$
\begin{array}{l} h \tau_ {n + 1} = \left[ y _ {n} + h y _ {n} ^ {\prime} + \frac {1}{2} h ^ {2} y _ {n} ^ {\prime \prime} + \frac {1}{6} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O (h ^ {4}) \right] - \left[ y _ {n} + h y _ {n} ^ {\prime} + \frac {1}{2} h ^ {2} y _ {n} ^ {\prime \prime} + \frac {7}{1 8} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O (h ^ {4}) \right] \\ = - \frac {2}{9} h ^ {3} y _ {n} ^ {\prime \prime \prime} + O \left(h ^ {4}\right). \\ \end{array}
$$

The method has order of accuracy 2.

(b) Apply the method to the case $f = 0$ , then

$$
y _ {n + 1} - \frac {4}{3} y _ {n} + \frac {1}{3} y _ {n - 1} = 0,
$$

when for ansatz of form $y_{n} = \gamma^{n}$ gives the stability polynomial

$$
\gamma^ {2} - \frac {4}{3} \gamma + \frac {1}{3} = 0,
$$

which has nonzero roots $\gamma = 1, \frac{1}{3}$ . Since $|\gamma| \leq 1$ and $\gamma = 1$ as a single root, the method is stable.

(c) Consider the stiff problem $y' = \lambda y$ . The method becomes

$$
y _ {n + 1} = \frac {4}{3} y _ {n} - \frac {1}{3} y _ {n - 1} + \frac {2}{3} h \lambda y _ {n + 1},
$$

which has stability polynomial

$$
(3 - 2 h \lambda) \gamma^ {2} - 4 \gamma + 1 = 0.
$$

So the stability region is given by

$$
\left| \frac {4 \pm \sqrt {1 6 - 4 (3 - 2 h \lambda)}}{2 (3 - 2 h \lambda)} \right| <   1,
$$

i.e.,

$$
R = \left\{h \lambda \in C: \left| \frac {2 \pm \sqrt {1 - 2 h \lambda}}{3 - 2 h \lambda} \right| <   1 \right\}.
$$

Problem 5. Suppose the difference scheme $u^{n + 1} = Bu^n$ is stable, and $C(\Delta t)$ is a bounded family of operators. Show that the scheme

$$
u ^ {n + 1} = (B + \Delta t C (\Delta t)) u ^ {n}
$$

is stable.

Solution: Suppose $\| B^k \| \leq K_1$ for $0 \leq k \leq n$ and $\| C(\Delta t) \| \leq K_2$ . It suffices to show $(B + \Delta t C(\Delta t))^n$ is bounded for $n\Delta t \leq T$ . This will consist of $2^n$ terms, of which $\binom{n}{j}$ terms involve $j$ factors $\Delta t C$ interspersed in $n - j$ factors $B$ ; the latter can occur in at most $j + 1$ sequences of consecutive factors, the norm of each sequence being bounded by $K_1$ , and hence the norm of each such term by $K_2^j K_1^{j+1}$ . Thus overall we obtain the bound

$$
\begin{array}{l} \| \bigl(B + \Delta tC(\Delta t)\bigr)^{n}\| \leq \sum_{j = 0}^{n}\left( \begin{array}{c}n\\ j \end{array} \right)K_{1}^{j + 1}(\Delta tK_{2})^{j} \\ = K _ {1} \left(1 + \Delta t K _ {1} K _ {2}\right) ^ {n} \\ \leq K _ {1} e ^ {n \Delta t K _ {1} K _ {2}} \\ \end{array}
$$

which is bounded for $n\Delta t \leq T$ .

Problem 6. Let $A$ be an $m \times m$ nonsingular matrix. Suppose $\inf_{p_n \in P^n} ||p_n(A)|| = ||p^*(A)|| > 0$ where $P^n$ denotes the set of all degree- $n$ monic polynomials:

$$
P ^ {n} = \left\{p: p \text {i s a p o l y n o m i a l o f d e g r e e} n, p (z) = z ^ {n} + \dots \right\}.
$$

Prove that $p^*$ is unique.

Solution: We prove by contradiction. Assuming there are two $p_i$ for $i = 1,2$ as minimizers, then $p = (p_1 + p_2) / 2$ shares the same 2-norm,

$$
\left\| p _ {1} \right\| = \left\| p _ {2} \right\| = \left\| p \right\| = \sigma_ {1},
$$

where $\sigma_{1}$ is the largest singular value. Let the SVD of $p$ be

$$
p (A) = U \operatorname {d i a g} \left(\sigma_ {1}, \dots , \sigma_ {n}\right) V ^ {*}.
$$

Suppose $\sigma_{1}$ is $J$ -fold, with left and right singular vectors $u_{1},\ldots ,u_{J}$ and $\nu_{1},\ldots ,\nu_{J}$ , respectively.

By convexity of the 2-norm, we have

$$
\sigma_ {1} = \| p (A) v _ {j} \| \leq \frac {1}{2} \left(\| p _ {1} (A) v _ {j} \| + \| p _ {2} (A) v _ {j} \|\right) \leq \sigma_ {1},
$$

which implies that

$$
\left\| p _ {1} (A) v _ {j} \right\| = \left\| p _ {2} (A) v _ {j} \right\| = \sigma_ {1}
$$

and

$$
(p _ {1} - p _ {2}) v _ {j} = 0, 1 \leq j \leq J.
$$

Similarly we can show that $(p_1^* - p_2^*)u_j = 0$ .

Construct $q \in P^n$ using $p_1 - p_2$ so that $q\nu_j = 0$ and $q^* u_j = 0$ . For a fixed $\epsilon \in (0,1)$ , define

$$
p _ {\epsilon} = (1 - \epsilon) p + \epsilon q \in P ^ {n}.
$$

Hence

$$
p _ {\epsilon} ^ {*} p _ {\epsilon} v _ {j} = (1 - \epsilon) p _ {\epsilon} ^ {*} p (A) v _ {j} = (1 - \epsilon) \sigma_ {1} p _ {\epsilon} ^ {*} u _ {j} = (1 - \epsilon) ^ {2} \sigma_ {1} ^ {2} v _ {j}.
$$

This says that $p_{\epsilon}$ has right singular vector $\nu_{1},\ldots ,\nu_{J}$ corresponding to the singular value $(1 - \epsilon)\sigma_{1}$ .

There are two cases to consider:

(1) $\| p_{\epsilon}\| = (1 - \epsilon)\sigma_{1} < \sigma_{1}$ is not the largest singular value, we see a contradiction.   
(2) None of $\nu_{1},\ldots ,\nu_{J}$ correspond to the largest singular value of $p_\epsilon$ . Using this fact and

$$
p (A) = U \Sigma V ^ {*},
$$

we have

$$
\begin{array}{l} \| p _ {\epsilon} (A) \| = \| p _ {\epsilon} (A) V \| = \| p _ {\epsilon} (A) \left[ v _ {J + 1}, \dots , v _ {n} \right] \| \\ = \| (1 - \epsilon) p (A) [ v _ {J + 1}, \dots v _ {n} ] + \epsilon q (A) [ v _ {J + 1}, \dots , v _ {n} ] \| \\ \leq (1 - \epsilon) \| [ u _ {J + 1}, \dots u _ {n} ] \mathrm {d i a g} (\sigma_ {J + 1}, \dots , \sigma_ {n}) \| + \epsilon \| q (A) [ v _ {J + 1}, \dots , v _ {n} ] \| \\ \leq (1 - \epsilon) \sigma_ {J + 1} + \epsilon \| q (A) [ v _ {J + 1}, \dots , v _ {n} ] \| \rightarrow \sigma_ {J + 1} <   \sigma_ {J} = \sigma_ {1} \\ \end{array}
$$

for $\epsilon$ small. This again leads to a contradiction. The uniqueness proof is complete.
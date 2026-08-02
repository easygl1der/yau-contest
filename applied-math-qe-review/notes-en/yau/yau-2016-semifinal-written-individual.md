# 2016 Yau Mathematical Contest Semifinal Written Examination individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2016-semifinal-written-individual.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2016-semifinal-written-individual/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.


## Problem 1

^yau-2016-semifinal-written-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s1).

Consider the implicit leapfrog scheme

$$
\frac{u_{m}^{n + 1} - u_{m}^{n - 1}}{2k} + a \left(1 + \frac{h^{2}}{6} \delta^{2}\right)^{- 1} \delta_{0} u_{m}^{n} = f_{m}^{n}
$$

for the one-way wave equation

$$
u_{t} + au_{x} = f.
$$

Here $\delta^{2}$ is the central second diference operator, and $\delta_{0}$ is the central first diference operator.

(1) show that the scheme is of order (2, 4).

(2) show that the scheme is stable if and only if $\vert \frac{ak}{h} \vert < \frac{1}{\sqrt{3}}$

## Problem 2

^yau-2016-semifinal-written-individual-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s2).

A simple version of an enzyme-mediate chemical reaction process is given by

$$
\mathrm{S} + \mathbb{E} \xrightarrow[k_{2}]{k_{1}} \mathrm{C} \xrightarrow{k_{3}} \mathbb{P} + \mathbb{E}
$$

where $S$ is the substrate reactant and $P$ is the concentration of the desired product. An enzyme (or catalyst) E is a compound whose special property is that it allows for intermediate reaction steps that lead to a the overall reaction,

$$
\mathrm{S} \longrightarrow \mathbb{P}.
$$

Assume the initial conditions

$$
S(0) = S_{0}, \quad E(0) = E_{0}, \quad C(0) = 0, \quad P(0) = 0;
$$

$\boldsymbol{k}_{1}, \boldsymbol{k}_{2}, \boldsymbol{k}_{3}$ are reaction rate constants.

(a) Convert the chemical reaction equation into a system of rate equations (ODEs) for $S(T), E(T), C(T)$ , and $P(T)$ where T is the dimensional time. Nondimensionalize the equations using the scalings

$$
T = t /(k_{1} E_{0}), \quad S(T) = S_{0} s(t), \quad P(T) = S_{0} p(t), \quad E(T) = E_{0} s(t), \quad C(T) = E_{0} c(t),
$$

$$
\epsilon = \frac{E_{0}}{S_{0}} \ll 1, \quad \lambda = \frac{k_{2}}{k_{1} S_{0}}, \quad \mu = \frac{k_{2} + k_{3}}{k_{1} S_{0}}.
$$

(b) Use the expansions $s(t) = s_{0}(t) + \epsilon s_{1}(t) + O(\epsilon^{2}), c(t) = c_{0}(t) + \epsilon c_{1}(t) + O(\epsilon^{2})$ , etc to determine the equations for the leading order slow solution. Show that $s_{0}(t)$ and $p_{0}(t)$ satisfies the following Michaelis-Menten equations

$$
\dot{s}_{0}(t) = -(\mu - \lambda) \frac{s_{0}}{\mu + s_{0}}, \quad \dot{p}_{0}(t) =(\mu - \lambda) \frac{s_{0}}{\mu + s_{0}}.
$$

## Problem 3

^yau-2016-semifinal-written-individual-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s3).

We say that a vector $\mathbf{u} =(u_{1}, \ldots, u_{n}) \in \mathbb{N}^{n}$ is multiplicatively dependent if there is a non-zero vector $\mathbf{k} =(k_{1}, \ldots, k_{n}) \in \mathbb{Z}^{n}$ for which

$$
u_{1}^{k_{1}} \dots u_{n}^{k_{n}} = 1.\tag{1}
$$

This notion plays a very important role in many number theoretic algorithms, such as factorisation and primality testing. It also (in a more general form) appears in some questions in algebraic dynamics. However the algorithm to decide whether u is multiplicatively dependent is not immediately obvious. The following statement informally means that if u is multiplicatively dependent the exponents $k_{1}, \ldots, k_{n}$ can be chosen to be reasonably small. Prove that if $\mathbf{u} =(u_{1}, \ldots, u_{n}) \in \mathbb{N}^{n}$ is multiplicatively dependent with $\| \mathbf{u} \|_{\infty} \leq H$ where $\left\| \mathbf{u} \right\|_{\infty} = \operatorname{max}_{1 \leq i \leq n} \left| u_{i} \right|$ , then there is a non-zero vector $\mathbf{k} =(k_{1}, \ldots, k_{n}) \in \mathbb{Z}^{n}$ with

$$
\| \mathbf{k} \|_{\infty} \leq \left(\frac{2n \log H}{\log 2}\right)^{n - 1}
$$

(and hence for a fixed n it can be found in polynomial time of order $(\log H)^{n(n - 1)})$ Comment: To solve this problem, you can use the following statement (without proof) which informally means that if a system of homogeneous equations with integer coeficients has a nontrivial solution then it has an integer solutions with reasonably small components. It is required in many applications.

Let $A =(a_{ij})_{i, j = 1}^{m, n}$ be an $m \times n$ matrix of rank $r \leq n - 1$ with integer entries of size at most H, that is,

$$
\left| a_{ij} \right| \leq H, \quad 1 \leq i \leq m, 1 \leq j \leq n.
$$

Then there is an integer non-zero vector $\mathbf{x} =(x_{1}, \ldots, x_{n}) \in \mathbb{Z}^{n}$ such that $A \mathbf{x} = \mathbf{0}$ and

$$
\| \mathbf{x} \|_{\infty} \leq(2nH)^{n - 1}
$$

where $\left\| \mathbf{x} \right\|_{\infty} = \operatorname{max}_{1 \leq i \leq n} \left| x_{i} \right|$

## Problem 4

^yau-2016-semifinal-written-individual-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s4).

Consider a symmetric matrix $A_{n \times n}$ , and let $\lambda_{i}$ be a simple eigenvalue of A with

$$
| \lambda_{j} - \lambda_{i} | = O(1), \quad j \neq i.
$$

In inverse iteration of compute eigenvalue and eigenvector, one needs to solve the following linear system

$$
(A - \mu I) y_{k + 1} = x_{k},
$$

where $\mu$ is an approximation of eigenvalue $\lambda_{i}, \| x_{k} \| =$ 1and obtain

$$
x_{k + 1} = \frac{y_{k + 1}}{\| y_{k + 1} \|}.
$$

However, for $\mu$ close to $\lambda_{i}, A - \mu I$ has a very small eigenvalue and the linear system will be ill-conditioned. So there may be large error in the numerical solution to the linear system, denoted by $\tilde{y}_{k + 1}$ . Even though we may get large error in $\tilde{y}_{k + 1}$ , the $\tilde{{x}}_{k + 1}$ we get from $\begin{array}{r}{\tilde{x}_{k + 1} = \frac{\tilde{y}_{k + 1}}{\| \tilde{y}_{k + 1} \|}} \end{array}$ is accurate.

(1) $\tilde{y}_{k + 1}$ satisfies

$$
(A - \mu I + \delta A) \tilde{y}_{k + 1} = x_{k},
$$

where $\| \delta A \| = O(\epsilon)$ and ² is the machine precision. Show that

$$
(A - \lambda_{i}) \frac{\tilde{y}_{k + 1}}{\| \tilde{y}_{k + 1} \|} \| \leq | \mu - \lambda_{i} | + \| \delta A \| + \frac{1}{\| \tilde{y}_{k + 1} \|}.
$$

(2) Let $\alpha_{i} = x_{k}^{t} q_{i}$ , where $q_{i}$ is the normalized eigenvector corresponding to $\lambda_{i}$ . Show that

$$
\| \tilde{y}_{k + 1} \| \geq \frac{| \alpha_{i} |}{| \mu - \lambda_{i} | + \| \delta A \|}.
$$

(3) Conclude that

$$
\left\| x_{k + 1} -(\pm) q_{i} \right\| = O \left(\left| \lambda_{i} - \mu \right| + \epsilon\right).
$$

## Problem 5

^yau-2016-semifinal-written-individual-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2016-semifinal-written-individual-solutions.md#^yau-2016-semifinal-written-individual-s5).

A function $f : \mathbb{R}^{n} \to \mathbb{R}$ in $C^{2}$ is called strongly convex if its Hessian matrix satisfies $\nabla^{2} f \succeq mI$ for some $m > 0$ . Show that the following statements are equivalent:

(a) f is strongly convex, i.e. $\nabla^{2} f(x) \succeq mI$ for all $x \in \mathbb{R}^{n}$ ;

(b) For any $t \in[0, 1]$ , any $x, y \in \mathbb{R}$ •

$$
f(tx +(1 - t) y) \leq tf(x) +(1 - t) f(y) - \frac{m}{2} t(1 - t) \| x - y \|^{2};
$$

(c) $\langle \nabla f(x) - \nabla f(y), x - y \rangle \geq m \| x - y \|^{2}$ for any x, $y \in \mathbb{R}^{n}$

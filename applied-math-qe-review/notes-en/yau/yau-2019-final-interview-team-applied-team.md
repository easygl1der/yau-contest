# 2019 Yau Mathematical Contest Final Interview team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2019-final-interview-team-applied-team.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2019-final-interview-team-applied-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2019-final-interview-team-applied-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## ANSWER ALL QUESTIONS

## Problem 1

^yau-2019-final-interview-team-applied-team-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2019-final-interview-team-applied-team-solutions.md#^yau-2019-final-interview-team-applied-team-s1).

The following statement informally means that if a system of homogeneous equations with integer coeficients has a nontrivial solution then it has an integer solutions with reasonably small components. It is required in many applications.

Let $A =(a_{ij})_{i, j = 1}^{m, n}$ be an $m \times n$ matrix of rank $r \leq n - 1$ with integer entries of size at most $H$ , that is,

$$
\left| a_{ij} \right| \leq H, \quad 1 \leq i \leq m, 1 \leq j \leq n.
$$

(i) Show that for $K \geq 0$ there are at most $(2K + 1)^{n}$ vectors $\mathbf{x} \in \mathbb{Z}^{n}$ with

$$
\| \mathbf{x} \|_{\infty} \leq K,
$$

where $\left\| \mathbf{x} \right\|_{\infty} = \operatorname{max}_{1 \leq i \leq n} \left| x_{i} \right|.$

(ii) $\mathrm{Apply \(i)}$ and Dirichlet’s pigeon hole principle to prove that there is an integer non-zero vector $\mathbf{x} =(x_{1}, \ldots, x_{n}) \in \mathbb{Z}^{n}$ such that $A \mathbf{x} = \mathbf{0}$ and

$$
\| \mathbf{x} \|_{\infty} \leq(2nH)^{n - 1}.
$$

## Problem 2

^yau-2019-final-interview-team-applied-team-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2019-final-interview-team-applied-team-solutions.md#^yau-2019-final-interview-team-applied-team-s2).

Let $u(x), a(x)$ and $f(x)$ be smooth functions on $[0, 1]$ (i) Determine the order of accuracy of the following approximation

$$
\frac{d}{dx} \left[a(x) \frac{du}{dx} \right] \Bigg |_{x = x_{i}} \simeq \frac{(a_{i + 1} + a_{i})(u_{i + 1} - u_{i}) -(a_{i} + a_{i - 1})(u_{i} - u_{i - 1})}{2h^{2}}
$$

where $\textstyle h ={\frac{1}{m + 1}}$ is the mesh size, $x_{i} = ih, a_{i} = a(x_{i})$ , and $u_{i} = u(x_{i})$ for $i = 1, \cdots, m$ such that $x_{m + 1} = 1$

(ii) For given functions $a(x) > 0$ and $f(x)$ , one determines the function u that solves the following second order ordinary diferential equation

$$
u - \frac{d}{dx} \left[a(x) \frac{du}{dx} \right] = f(x)
$$

with boundary conditions $u(0) = 0$ and $u(1) = 0$ . Apply the discretization given in (i) and let $f_{i} = f(x_{i})$ . Denote the linear system that one has to solve by $A \mathbf{u} = \mathbf{f}$ where $A \in \mathbb{R}^{m \times m}$ and u, $\mathbf{f} \in \mathbb{R}^{m}$ . If Gauss-Seidel method is used to solve this linear system, show that the iterative method converges for any initial guess.

## Problem 3

^yau-2019-final-interview-team-applied-team-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2019-final-interview-team-applied-team-solutions.md#^yau-2019-final-interview-team-applied-team-s3).

Maximal entropy principle. Consider probability distributions on a discrete random variable X taking on possible values of $x_{1}, x_{2}, \ldots, x_{n}$ . Denote the probability $\operatorname{Pr}(X = x_{i}) = p_{i}, i = 1, \dots, n$ and recall that its Shannon entropy S is

$$
S = - \sum_{i = 1}^{n} p_{i} \log p_{i}
$$

Now suppose we have some knowledge of $p_{1}, \ldots, p_{n}.$ , specified in terms of its expectation values $E_{j}$ with respects to k known functions $f_{j}(\cdot)$ of the random variable X

$$
\sum_{i = 1}^{n} p_{i} f_{j}(x_{i}) = E_{j}, \qquad j = 1, 2, \dots, k < n.
$$

(i) Show that the probability distribution $p =[p_{1}, \dotsc, p_{n}]$ that maximized the entropy S has the form of an exponential family:

$$
p_{i} = \frac{e^{\sum_{j = 1}^{k} \lambda_{j} f_{j}(x_{i})}}{Z}
$$

where $\lambda_{j}$ are all constants, and $Z$ is the normalization constant given by

$$
Z = \sum_{i = 1}^{n} e^{\sum_{j = 1}^{k} \lambda_{j} f_{j}(x_{i})}
$$

(ii) Show that the constants $\lambda_{j}$ are related to $E_{j}$ by

$$
E_{j} = \frac{\partial \log Z}{\partial \lambda_{j}}.
$$

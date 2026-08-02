# 2014 Yau Mathematical Contest Final Interview individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2014-final-interview-individual-applmath-individual-and-overall.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2014-final-interview-individual-applmath-individual-and-overall/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## S.-T. Yau College Student Mathematics Contest

Applied Mathematics, Individual, 2014

Find the eigenvalues and eigenvectors of the following $N \times N$ tridiagonal matrix

$$
A = \left(\begin{array}{cccccc} b & c & & & & \\ a & b & c & & & \\ & a & b & c & & \\ & & \ddots & \ddots & \ddots & \\ & & & a & b & c \\ & & & & a & b \end{array} \right)
$$

where $a, b$ and $c$ are $3$ constants, and $ac > 0$

## Definition:

\* A propre k-edge-coloring of a graph $G(V, E)$ is a mapping f: $E \to \{1, 2, 3, \cdots, k\}$ such that $f(e) \neq f(e^{\prime})$ for any pair of edges $\boldsymbol{e}, \boldsymbol{e}^{\prime}$ that have a common end vertex.

\*\* Suppose that f is a propre k-edge-coloring of a graph $G(V, E)$ . f is called a uniform propre k-edge-coloring of $G(V, E)$ if for any $i, j \in \{1, 2, 3, \cdots, k\}, \| f^{- 1}(i) | -$ $| f^{- 1}(j) | | \leq 1$

## Problem:

Prove that if a graph $G(V, E)$ has a propre k-edge-coloring, then $G(V, E)$ has a uniform propre k-edge-coloring.

Consider the following equation over an one-dimensional (1-D) domain $\Omega =(0, 1)$ :

$$
\partial_{t} \phi = - \phi^{3} + \phi + \epsilon^{2} \phi_{xx}, \quad \mathrm{in} \Omega,\tag{1}
$$

$$
\phi_{x} = 0, \quad \text{at} x = 0, x = 1,\tag{2}
$$

with $\epsilon > 0$ a given constant.

The following semi-implicit, semi-discrete numerical scheme is formulated:

$$
\frac{\phi^{n + 1} - \phi^{n}}{\Delta t} = - \left(\phi^{n + 1}\right)^{3} + \phi^{n} + \epsilon^{2} \phi_{xx}^{n + 1}, \quad \mathrm{in} \Omega,\tag{3}
$$

$$
\phi_{x}^{n + 1} = 0, \quad \mathrm{at} x = 0, x = 1.\tag{4}
$$

in which $\phi^{k}$ denotes the numerical solution at $t^{k}$ , with $t^{k} = k \Delta t$ , ∆t being the time step size.

Prove the following energy stability for the numerical solution (3)-(4):

$$
E(\phi^{n + 1}) \leq E(\phi^{n}), \quad \mathrm{forany} \Delta t > 0,\tag{5}
$$

with the energy functional given by

$$
E(\phi) = \int_{\Omega} \left(\frac{1}{4} \phi^{4} - \frac{1}{2} \phi^{2} + \frac{\epsilon^{2}}{2} | \phi_{x} |^{2}\right) dx = \frac{1}{4} \| \phi \|_{L^{4}}^{4} - \frac{1}{2} \| \phi \|_{L^{2}}^{2} + \frac{\epsilon^{2}}{2} \| \phi_{x} \|_{L^{2}}^{2}.\tag{6}
$$

Hint. Take an $L^{2}$ inner product with (3) by $\tilde{\mu}^{n + 1} = \left(\phi^{n + 1} \right)^{3} - \phi^{n} - \epsilon^{2} \phi_{xx}^{n + 1}$

# Oral exam, applied and computational mathematics, individual, 2014

## 1 Problem 1. Discrete Optimal Mass Transportation

Suppose $\Omega \subset \mathbb{R}^{2}$ is a convex planar domain, $P = \{p_{1}, p_{2}, \cdots, p_{n}\}$ are discrete points on $\mathbb{R}^{2}$ , each point has a Dirac measure $\{A_{i} \delta(p - p_{i})\}$ }, such that

$$
Area(\Omega) = \sum_{i = 1}^{n} A_{i}.
$$

A mapping $f : \Omega P$ is called measure preserving, if the area of the pre-image of $p_{i}$ equals to $A_{i}$

$$
Area(f^{- 1}(p_{i})) = A_{i}.
$$

The transportation cost of a mapping is given by

$$
E(f) := \int_{\Omega} | p - f(p) |^{2} dp.
$$

Among all the measure preserving mappings, the one which minimizes the transportation cost is called the optimal mass transportation map.

We want to show that: if $f$ is the optimal mass transportation map, then there exists a convex function $u : \Omega \to \mathbb{R}$ , such that $f$ is the gradient map of $u, f = \nabla u$

## Problem 1

^yau-2014-final-interview-individual-applmath-individual-and-overall-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s1).

Let $H = \{h_{1}, h_{2}, \cdot \cdot \cdot, h_{n}\}$ be weights. The power voronoi diagram induced by $(P, H)$ is a cell decomposition of $\mathbb{R}^{2}$

$$
\mathbb{R}^{2} = \bigcup_{i = 1}^{n} W_{i},
$$

where

$$
W_{i} = \{q \in \mathbb{R}^{2} | | q - p_{i} |^{2} + h_{i} \leq | q - p_{j} |^{2} + h_{j}, \forall 1 \leq j \leq n\}.
$$

Define a map: $\varphi : W_{i} \to p_{i}$ . Show that there is a piecewise linear convex function $u : \Omega \to \mathbb{R}$ , such that

$$
W_{i} = \{q \in \mathbb{R}^{2} | \nabla u(q) = p_{i}\},
$$

namely $\varphi$ is the gradient map of $u.$

## Problem 2

^yau-2014-final-interview-individual-applmath-individual-and-overall-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s2).

Suppose there is another cell decomposition

$$
\mathbb{R}^{2} = \bigcup_{i = 1}^{n} \overline{{W}}_{i},
$$

such that

$$
\operatorname{Area} \left(W_{i} \cap \Omega\right) = \operatorname{Area} \left(\overline{{W}}_{i} \cap \Omega\right),
$$

The map induced by this cell decomposition is $\bar{\varphi} : \overline{{W}}_{i} p_{i}$ . prove the transportation cost of $\varphi$ is no greater than that of $\bar{\varphi},$

$$
\int_{\Omega} | q - \varphi(q) |^{2} dq \leq \int_{\Omega} | q - \bar{\varphi}(q) |^{2} dq.
$$

Namely, the discrete optimal mass transportation map must be induced by a power voronoi diagram.

## Problem 3

^yau-2014-final-interview-individual-applmath-individual-and-overall-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s3).

Suppose given any $A = \left\{A_{1}, A_{2}, \cdot \cdot \cdot, A_{n} \right\}$ , such that $A_{i} > 0$ and $\begin{array}{r}{\sum_{i = 1}^{n} A_{i} = Area(\Omega)} \end{array}$ , we can always find ??, such that the power voronoi diagram induced by ?? satisfies the condition $Area(W_{i}) = A_{i}.$ , then show that the discrete optimal mass transportation is given by the gradient map of a convex function.

## 2 Problem 2. Circle Packing

A discrete surface is represented as a simplicial complex, such that each face is a Euclidean triangle, which is also called a triangle mesh. Suppose $M =(V, E, F)$ is a triangle mesh, where $V, E, F$ represents the set of vertices, edges and faces respectively. The Euler number of the mesh is $\chi(M) = | V | + | F | - | E |$ Furthermore, a circle packing defined on the mesh. Each vertex $v_{i}$ is associated with a circle $(v_{i}, r_{i})$ , two circles on an edge are tangent to each other.

![](parts/images/7db7e2b7694203760f07e7615f78252721f7eb9296ff5a84d54d4e428e0deff1.jpg)  
Figure 1: A discrete surface is represented as a triangle mesh.

Suppose $v_{i} \in V$ is an interior vertex on ?? , $[v_{i}, v_{j}, v_{k}] \in F$ is a face on ??. $\theta_{i}^{jk}$ is the corner angle on the face $[v_{i}, v_{j}, v_{k}]$ with apex $v_{i}$ . The discrete curvature at $v_{i}$ is defined as

$$
K_{i} = 2 \pi - \sum_{[v_{i}, v_{j}, v_{k}] \in F} \theta_{i}^{jk}
$$

The the total curvature satisfies the Gauss-Bonnet theorem $\begin{array}{r}{\sum_{i} K_{i} = 2 \pi \chi(M)} \end{array}$ . Let $u_{i} = \log r_{i}.$ , which is called the discrete conformal factor. We want to show the mapping from the discrete conformal factor to the discrete curvature

$$
\varphi :(u_{1}, u_{2}, \dots, u_{n}) \mapsto(K_{1}, K_{2}, \dots, K_{n}),
$$

where $\textstyle \sum_{i} u_{i} = 0$ , is deffeomorphic.

## Problem 1

^yau-2014-final-interview-individual-applmath-individual-and-overall-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s1).

Derivative Cosine Law

![](parts/images/e9f3bf2bbea96d8d3be7ba9d69932313f4259823a35284b63f4a7fef4d9b3218.jpg)  
Figure 2: A Euclidean triangle.

Consider one triangle $[v_{i}, v_{j}, v_{k}]$ , the corner angles are the functions of edge lengths, $\theta_{i}(l_{i}, l_{j}, l_{k})$ , prove

$$
\frac{\partial \theta_{i}}{\partial l_{i}} = \frac{l_{i}}{2A}, \frac{\partial \theta_{i}}{\partial l_{j}} = - \frac{l_{i}}{2A} \cos \theta_{k},
$$

where ?? is the triangle area.

![](parts/images/535e86b053699429185f9b8e2a2286739d69acc82d507eaf3473f3f5df7bd280.jpg)  
Figure 3: A Euclidean triangle with a circle packing.

## Problem 2

^yau-2014-final-interview-individual-applmath-individual-and-overall-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s2).

Circle Packing on one Triangle. Suppose we associate each vertex $v_{i}$ with a circle $c_{i}(v_{i}, r_{i})$ centered at $v_{i}$ with radius $r_{i}$ . All three circles are tangent to each other, the inner circle has radius $r,$ let $u_{i} = \log r_{i}.$ , prove

$$
\frac{\partial \theta_{i}}{\partial u_{j}} = \frac{\partial \theta_{j}}{\partial u_{i}} = \frac{r}{l_{k}}
$$

and

$$
\frac{\partial \theta_{i}}{\partial u_{i}} = - \frac{\partial \theta_{i}}{\partial u_{j}} - \frac{\partial \theta_{i}}{\partial u_{k}}.
$$

Prove that the mapping

$$
\varphi : \{(u_{i}, u_{j}, u_{k}) | u_{i} + u_{j} + u_{k} = 0\} \rightarrow \{(\theta_{i}, \theta_{j}, \theta_{k}) | \theta_{i} + \theta_{j} + \theta_{k} = \pi\}
$$

is a diffeomorphism.

## Problem 3

^yau-2014-final-interview-individual-applmath-individual-and-overall-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2014-final-interview-individual-applmath-individual-and-overall-solutions.md#^yau-2014-final-interview-individual-applmath-individual-and-overall-s3).

Consider the whole triangle mesh, prove the mapping

$$
\varphi :(u_{1}, u_{2}, \dots, u_{n}) \mapsto(K_{1}, K_{2}, \dots, K_{n}),
$$

where $\textstyle \sum_{i} u_{i} = 0$ , is deffeomorphic.

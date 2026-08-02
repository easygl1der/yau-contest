# 2013 Yau Mathematical Contest Final Interview individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2013-final-interview-individual-applmath-individual.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2013-final-interview-individual-applmath-individual/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2013-final-interview-individual-applmath-individual-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.


## Problem 1

^yau-2013-final-interview-individual-applmath-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2013-final-interview-individual-applmath-individual-solutions.md#^yau-2013-final-interview-individual-applmath-individual-s1).

Suppose $A \in R^{n \times n}$ is nonsingular, u and v are two vectors.

(a) Find condition such that $A + uv^{\top}$ is invertible, in that case find $(\boldsymbol{A} + \boldsymbol{u} \boldsymbol{v}^{\top})^{- 1}$

(b) Change the first column of A: $\left(\begin{array}{c}{a_{11}} \\{a_{21}} \\{\vdots} \\{a_{n1}} \end{array} \right) \mathsf{by} \left(\begin{array}{c}{b_{1}} \\{b_{2}} \\{\vdots} \\{b_{n}} \end{array} \right)$ resulting in a new matrix ${\bar{A}}.$ Find $(\bar{A})^{- 1}$

## Problem 2

^yau-2013-final-interview-individual-applmath-individual-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2013-final-interview-individual-applmath-individual-solutions.md#^yau-2013-final-interview-individual-applmath-individual-s2).

A discrete surface is represented as a simplicial complex, such that each face is a Euclidean triangle, which is also called a triangle mesh. Suppose $M =(V, E, F)$ is a triangle mesh, where $V, E, F$ represents the set of vertices, edges and faces respectively. The Euler number of M is defined as

$$
\chi(M) := | V | + | F | - | E |.
$$

An edge is called an interior edge if it is adjacent to two faces; an edge is called a boundary edge if it is adjacent to only one face. A vertex is called an interior vertex, if all the edges adjacent to it are interior; a vertex is called a boundary vertex, if it attaches to at least one boundary edge. A triangle mesh is called a closed mesh, if it has no boundary edges.

![](parts/images/de098e1be16b684280287b666817bd4c2e2be0716cdc2b268bc715c079e036de.jpg)  
Figure 1: A discrete surface is represented as a triangle mesh.

Suppose $v_{i} \in V$ is an interior vertex on M , $[v_{i}, v_{j}, v_{k}] \in F$ is a face on M . $\theta_{i}^{jk}$ is the corner angle on the face $[v_{i}, v_{j}, v_{k}]$ with apex $v_{i}$ . Then the discrete Gaussian curvature at $v_{i}$ is defined as

$$
K(v_{i}) := 2 \pi - \sum_{[v_{i}, v_{j}, v_{k}] \in F} \theta_{i}^{jk}.
$$

If $v_{i}$ is an boundary vertex, then the discrete Gaussian curvature at $v_{i}$ is defined as

$$
K(v_{i}) := \pi - \sum_{[v_{i}, v_{j}, v_{k}] \in F} \theta_{i}^{jk}.
$$

## Problem 1

^yau-2013-final-interview-individual-applmath-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2013-final-interview-individual-applmath-individual-solutions.md#^yau-2013-final-interview-individual-applmath-individual-s1).

Suppose M is a closed triangle mesh, prove the Discrete Gauss-Bonnet theorem:

$$
\sum_{v_{i} \in V} K(v_{i}) = 2 \pi \chi(M).
$$

![](parts/images/77d0b66cfa35f27aaffbc1ad5793395f6dbe1e4d45335b9deddd3398e172e3b0.jpg)  
Figure 2: Discrete Gaussian curvature for an interior vertex.

2. (optional) Suppose the faces of M are not only triangles, but also general planar polygons, prove the discrete Gauss-Bonnet theorem.

3. (Optional) Suppose M is a triangle mesh with boundaries, different boundary connect components have no intersection, prove the discrete Gauss-Bonnet theorem.

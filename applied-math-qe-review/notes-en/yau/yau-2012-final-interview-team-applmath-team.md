# 2012 Yau Mathematical Contest Final Interview team

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2012-final-interview-team-applmath-team.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2012-final-interview-team-applmath-team/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2012-final-interview-team-applmath-team-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## Applied and Computational Mathematics

## Problem 1

^yau-2012-final-interview-team-applmath-team-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2012-final-interview-team-applmath-team-solutions.md#^yau-2012-final-interview-team-applmath-team-s1).

We would like to solve the following PDE

$$
u_{t} + u_{x} = u\tag{1}
$$

by a finite diference scheme

$$
u_{j}^{n + 1} = \sum_{k = - p}^{q} a_{k} u_{j + k}^{n}\tag{2}
$$

where $a_{k}$ are constants depending on the mesh sizes $\Delta x$ and $\Delta t$ , and $u_{j}^{n}$ are approximations to the exact solution $u(x_{j}, t^{n})$ with $x_{j} = j \Delta x$ and $t^{n} = n \Delta t$ . A student defines stability of the scheme by

$$
\| u^{n + 1} \| \leq \| u^{n} \|\tag{3}
$$

where k · k is the usual discrete $L^{2} \mathrm{- norm}$ . Do you believe this definition is reasonable, namely do you believe there are consistent and accurate schemes (2) approximating the PDE (1) which will be stable under the definition (3)? If yes, give your reasons. If not, modify the definition (3).

## Problem 2

^yau-2012-final-interview-team-applmath-team-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2012-final-interview-team-applmath-team-solutions.md#^yau-2012-final-interview-team-applmath-team-s2).

Let $T$ be a rooted tree with the root r. Show that there is an injection f from the set of vertices of degree at least 3 to the set of leaves (not the root) such that for each vertex v of degree at least 3, v lies in the path from r to f (v).

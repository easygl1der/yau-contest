# 前置内容

> [!cite] 此文件保留第一章之前的封面、目录、前言或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/lectures-modern-convex-optimization/reading.md)，源行 1–672。

# Lectures on Modern Convex Optimization


<!-- MinerU source pages 1-200 -->

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/13eb22f0e59e5dd4de879535eabd5302b8e56e5a253a4364a6d356171669a3a9.jpg)

Georgia Institute of Technology H. Milton Stewart School of Industrial & Systems Engineering Atlanta Georgia USA

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/df6af62c4a96a3f60904d8673df1aa52d30d89caef9bd9e2db4f3a5739b60708.jpg)

LECTURES ON MODERN CONVEX OPTIMIZATION – 2020/2021/2022/2023 ANALYSIS, ALGORITHMS, ENGINEERING APPLICATIONS

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/001-200/images/2567f06b35e46f6f6d1c35f7fb80a0bbd68fb71223a52cf928d1e65cd61652b6.jpg)

Aharon Ben-Tal<sup>†</sup> and Arkadi Nemirovski<sup>∗</sup>

<sup>†</sup>The William Davidson Faculty of Industrial Engineering & Management, Technion – Israel Institute of Technology, abental@ie.technion.ac.il https://web.iem.technion.ac.il/site/academicstaff/aharon-ben-tal/ <sup>∗</sup>H. Milton Stewart School of Industrial & Systems Engineering, Georgia Institute of Technology, nemirovs@isye.gatech.edu https://www.isye.gatech.edu/users/arkadi-nemirovski

Transparencies: https://www.isye.gatech.edu/<sub>\~</sub>nemirovs/LMCOTR2021.pdf

## Preface

Mathematical Programming deals with optimization programs of the form

minimize

subject to

$$
\begin{array}{c}{g_{i}(x) \leq 0, i = 1, \dots, m,} \\{[x \subset{\bf R}^{n}]} \end{array}\tag{P}
$$

and includes the following general areas:

1. Modelling: methodologies for posing various applied problems as optimization programs;

2. Optimization Theory, focusing on existence, uniqueness and on characterization of optimal solutions to optimization programs;

3. Optimization Methods: development and analysis of computational algorithms for various classes of optimization programs;

4. Implementation, testing and application of modelling methodologies and computational algorithms.

Essentially, Mathematical Programming was born in 1948, when George Dantzig has invented Linear Programming – the class of optimization programs (P) with linear objective f(·) and constraints g<sub>i</sub>(·). This breakthrough discovery included

- the methodological idea that a natural desire of a human being to look for the best possible decisions can be posed in the form of an optimization program (P) and thus subject to mathematical and computational treatment;

- the theory of LP programs, primarily the LP duality (this is in part due to the great mathematician John von Neumann);

- the first computational method for LP – the Simplex method, which over the years turned out to be an extremely powerful computational tool.

As it often happens with first-rate discoveries (and to some extent is characteristic for such discoveries), today the above ideas and constructions look quite traditional and simple. Well, the same is with the wheel.

In 50 plus years since its birth, Mathematical Programming was rapidly progressing along all outlined avenues, “in width” as well as “in depth”. We have no intention (and time) to trace the history of the subject decade by decade; instead, let us outline the major achievements in Optimization during the last 20 years or so, those which, we believe, allow to speak about modern optimization as opposed to the “classical” one as it existed circa 1980. The reader should be aware that the summary to follow is highly subjective and reflects the personal preferences of the authors. Thus, in our opinion the major achievements in Mathematical Programming during last 15-20 years can be outlined as follows:

♠ Realizing what are the generic optimization programs one can solve well (“eficiently solvable” programs) and when such a possibility is, mildly speaking, problematic (“computationally intractable” programs). At this point, we do not intend to explain what does it mean exactly that “a generic optimization program is eficiently solvable”; we will arrive at this issue further in the course. However, we intend to answer the question (right now, not well posed!) “what are generic optimization programs we can solve well”:

(!) As far as numerical processing of programs (P) is concerned, there exists a “solvable case” – the one of convex optimization programs, where the objective $f$ and the constraints $g_{i}$ are convex functions.

Under minimal additional “computability assumptions” (which are satisfied in basically all applications), a convex optimization program is “computationally tractable” – the computational efort required to solve the problem to a given accuracy “grows moderately” with the dimensions of the problem and the required number of accuracy digits.

In contrast to this, a general-type non-convex problems are too dificult for numerical solution – the computational efort required to solve such a problem by the best known so far numerical methods grows prohibitively fast with the dimensions of the problem and the number of accuracy digits, and there are serious theoretical reasons to guess that this is an intrinsic feature of non-convex problems rather than a drawback of the existing optimization techniques.

Just to give an example, consider a pair of optimization problems. The first is

$$
\begin{array}{rcl} \text{minimize} & - \sum_{i = 1}^{n} x_{i} \\ \text{subject to} & \\ & x_{i}^{2} - x_{i} & = 0, i = 1,..., n; \\ & x_{i} x_{j} & = 0 \quad \forall(i, j) \in \Gamma, \end{array}\tag{A}
$$

Γ being a given set of pairs $(i, j)$ of indices $i, j$ . This is a fundamental combinatorial problem of computing the stability number of a graph; the corresponding “covering story” is as follows:

Assume that we are given n letters which can be sent through a telecommunication channel, say, $n = 256$ usual bytes. When passing trough the channel, an input letter can be corrupted by errors; as a result, two distinct input letters can produce the same output and thus not necessarily can be distinguished at the receiving end. Let Γ be the set of “dangerous pairs of letters” – pairs $(i, j)$ of distinct letters $i, j$ which can be converted by the channel into the same output. If we are interested in error-free transmission, we should restrict the set S of letters we actually use to be independent – such that no pair $(i, j)$ with $i, j \in S$ belongs to Γ. And in order to utilize best of all the capacity of the channel, we are interested to use a maximal – with maximum possible number of letters – independent sub-alphabet. It turns out that the minus optimal value in (A) is exactly the cardinality of such a maximal independent sub-alphabet.

Our second problem is

minimize

subject to

$$
\begin{array}{rlr} & \text{imize} & - 2 \sum_{i = 1}^{k} \sum_{j = 1}^{m} c_{ij} x_{ij} + x_{00} \\ & \text{project to} & \\ & \lambda_{\min} \left(\left[\begin{array}{cccc} x_{1} & & & \sum_{j = 1}^{m} b_{pj} x_{1j} \\ & \ddots & & \dots \\ & & x_{k} & \sum_{j = 1}^{m} b_{pj} x_{kj} \\ \sum_{j = 1}^{m} b_{pj} x_{1j} & \dots & \sum_{j = 1}^{m} b_{pj} x_{kj} & x_{00} \end{array} \right]\right) & \geq & 0, \\ & & p = 1,..., N, \\ & & \sum_{i = 1}^{k} x_{i} = 1, \end{array}\tag{B}
$$

where $\lambda_{\mathrm{min}}(A)$ denotes the minimum eigenvalue of a symmetric matrix A. This problem is responsible for the design of a truss (a mechanical construction comprised of linked with each other thin elastic bars, like an electric mast, a bridge or the Eifel Tower) capable to withstand best of all to k given loads.

When looking at the analytical forms of (A) and (B), it seems that the first problem is easier than the second: the constraints in (A) are simple explicit quadratic equations, while the constraints in (B) involve much more complicated functions of the design variables – the eigenvalues of certain matrices depending on the design vector. The truth, however, is that the first problem is, in a sense, “as dificult as an optimization problem can $\mathrm{be}^{\mathfrak{N}}$ , and the worst-case computational efort to solve this problem within absolute inaccuracy 0.5 by all known optimization methods is about $2^{n}$ operations; for $n = 256$ (just 256 design variables corresponding to the “alphabet of bytes”), the quantity $2^{n} \approx 10^{77}$ , for all practical purposes, is the same as +∞. In contrast to this, the second problem is quite “computationally tractable”. $\mathrm{E.g.}$ , for $k = 6$ (6 loads of interest) and m = 100 (100 degrees of freedom of the construction) the problem has about 600 variables (twice the one of the “byte” version of (A)); however, it can be reliably solved within 6 accuracy digits in a couple of minutes. The dramatic diference in computational efort required to solve (A) and (B) finally comes from the fact that (A) is a non-convex optimization problem, while (B) is convex.

Note that realizing what is easy and what is dificult in Optimization is, aside of theoretical importance, extremely important methodologically. Indeed, mathematical models of real world situations in any case are incomplete and therefore are flexible to some extent. When you know in advance what you can process eficiently, you perhaps can use this flexibility to build a tractable (in our context – a convex) model. The “traditional” Optimization did not pay much attention to complexity and focused on easy-to-analyze purely asymptotical “rate of convergence” results. From this viewpoint, the most desirable property of $f$ and $g_{i}$ is smoothness (plus, perhaps, certain “nondegeneracy” at the optimal solution), and not their convexity; choosing between the above problems $\mathrm{(A)}$ and (B), a “traditional” optimizer would, perhaps, prefer the first of them. We suspect that a non-negligible part of “applied failures” of Mathematical Programming came from the traditional (we would say, heavily misleading) “order of preferences” in model building. Surprisingly, some advanced users (primarily in Control) have realized the crucial role of convexity much earlier than some members of the Optimization community. Here is a real story. About 7 years ago, we were working on certain Convex Optimization method, and one of us sent an e-mail to people maintaining CUTE (a benchmark of test problems for constrained continuous optimization) requesting for the list of convex programs from their collection. The answer was: “We do not care which of our problems are convex, and this be a lesson for those developing Convex Optimization techniques.” In their opinion, the question is stupid; in our opinion, they are obsolete. Who is right, this we do not know...

♠ Discovery of interior-point polynomial time methods for “well-structured” generic convex programs and throughout investigation of these programs.

By itself, the “efficient solvability” of generic convex programs is a theoretical rather than a practical phenomenon. Indeed, assume that all we know about (P) is that the program is convex, its objective is called $f,$ the constraints are called $g_{j}$ and that we can compute $f$ and ${\mathit{g}}_{i},$ along with their derivatives, at any given point at the cost of M arithmetic operations. In this case the computational efort for finding an $\epsilon$-solution turns out to be at least $O(1) nM \ln(\frac{1}{\epsilon})$ Note that this is a lower complexity bound, and the best known so far upper bound is much worse: $O(1) n(n^{3} + M) \ln(\frac{1}{\epsilon})$ . Although the bounds grow “moderately” – polynomially – with the design dimension n of the program and the required number ln $\left(\textstyle{\frac{1}{\epsilon}} \right)$ of accuracy digits, from the practical viewpoint the upper bound becomes prohibitively large already for $n$ like 1000. This is in striking contrast with Linear Programming, where one can solve routinely problems with tens and hundreds of thousands of variables and constraints. The reasons for this huge diference come from the fact that

When solving an LP program, our a priory knowledge is far beyond the fact that the objective is called $f,$ the constraints are called $g_{i}$ , that they are convex and we can compute their values and derivatives at any given point. In $LP,$ we know in advance what is the analytical structure of $f$ and $g_{i}$ , and we heavily exploit this knowledge when processing the problem. In fact, all successful LP methods never never compute the values and the derivatives of $f$ and $g_{i} -$ they do something completely different.

One of the most important recent developments in Optimization is realizing the simple fact that a jump from linear f and g<sub>i</sub>’s to “completely structureless” convex f and g<sub>i</sub>’s is too long: inbetween these two extremes, there are many interesting and important generic convex programs. These “in-between” programs, although non-linear, still possess nice analytical structure, and one can use this structure to develop dedicated optimization methods, the methods which turn out to be incomparably more efficient than those exploiting solely the convexity of the program.

The aforementioned “dedicated methods” are Interior Point polynomial time algorithms, and the most important “well-structured” generic convex optimization programs are those of Linear, Conic Quadratic and Semidefinite Programming; the last two entities merely did not exist as established research subjects just 15 years ago. In our opinion, the discovery of Interior Point methods and of non-linear “well-structured” generic convex programs, along with the subsequent progress in these novel research areas, is one of the most impressive achievements in Mathematical Programming.

♠ We have outlined the most revolutionary, in our appreciation, changes in the theoretical core of Mathematical Programming in the last 15-20 years. During this period, we have witnessed perhaps less dramatic, but still quite important progress in the methodological and applicationrelated areas as well. The major novelty here is certain shift from the traditional for Operations Research applications in Industrial Engineering (production planning, etc.) to applications in “genuine” Engineering. We believe it is completely fair to say that the theory and methods of Convex Optimization, especially those of Semidefinite Programming, have become a kind of new paradigm in Control and are becoming more and more frequently used in Mechanical Engineering, Design of Structures, Medical Imaging, etc.

The aim of the course is to outline some of the novel research areas which have arisen in Optimization during the past decade or so. We intend to focus solely on Convex Programming, specifically, on

- Conic Programming, with emphasis on the most important particular cases – those of Linear, Conic Quadratic and Semidefinite Programming (LP, CQP and SDP, respectively). Here the focus will be on

– basic Duality Theory for conic programs;

– investigation of “expressive abilities” of CQP and SDP;

– overview of the theory of Interior Point polynomial time methods for LP, CQP and SDP.

- “efficient (polynomial time) solvability” of generic convex programs.

- “Low cost” optimization methods for extremely large-scale optimization programs.

Acknowledgements. The first four lectures of the five comprising the core of the course are based upon the book

Ben-Tal, A., Nemirovski, A., Lectures on Modern Convex Optimization: Analysis, Algorithms, Engineering Applications, MPS-SIAM Series on Optimization, SIAM, Philadelphia, 2001.

We are greatly indebted to our colleagues, primarily to Yuri Nesterov, Stephen Boyd, Claude Lemarechal and Cornelis Roos, who over the years have influenced significantly our understanding of the subject expressed in this course. Needless to say, we are the only persons responsible for the drawbacks in what follows.

Aharon Ben-Tal, Arkadi Nemirovski,

August 2000, Haifa, Israel.

♣ Lecture Notes were “renovated” in Fall 2011, Summer 2013, and Summer 2015. As a result, some lectures were merged, and a new lecture (Lecture 5) on first Order algorithms was added. Correspondence between the original and the updated Lectures is as follows:

<table><tr><td>LMCO 2000 Lectures ##</td><td>1 &amp; 2</td><td>3</td><td>4</td><td>5 &amp; 6</td><td></td></tr><tr><td>LMCO 2015 Lectures ##</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr></table>

Besides this, some material was added in Sections 1.3 (applications of LP in Compressive Sensing and for synthesis of linear controllers in linear dynamic systems), 3.6 (Lagrangian approximation of chance constraints). I have also added four “operational exercises” (Exercises 1.5.1, 1.5.2, 2.6.1, 5.3.1); in contrast to “regular exercises,” where the task usually is to prove something, an operational exercise requires creating software and numerical experimentation to implement a broadly outlined approach and as such ofers much room for reader’s initiative. The operational exercises are typed in blue.

Arkadi Nemirovski,

August 2015, Atlanta, Georgia, USA.

♣ LMCO 2019 difers from LMCO 2015 by some modifications in Lecture 5 aimed at streamlining the exposition. Besides this, I have extended significantly the list of exercises.

Arkadi Nemirovski,

August 2019, Atlanta, Georgia, USA.

♣ LMCO 2020/21 difers from LMCO 2019 by streamlining some proofs and adding a bit of new material, e.g., Sections 2.3.7, 3.4.2, 5.6, and 5.7.

I am greatly indebted to Prof. Anatoly Juditsky from University Grenoble-Alpes, France, with whom I have the privilege and the honor to collaborate for over 20 years; this collaboration, in particular, influenced significantly modifications of these Notes made on the span of the last decade.

Arkadi Nemirovski, December 2020, May 2021, October 2022, March 2023 Atlanta, Georgia, USA.

## Contents

Main Notational Conventions 18
1 From Linear to Conic Programming 19
1.1 Linear programming: basic notions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
1.2 Duality in Linear Programming . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
1.2.1 Certificates for solvability and insolvability . . . . . . . . . . . . . . . . . . . . 20
1.2.2 Dual to an LP program: the origin . . . . . . . . . . . . . . 25
1.2.3 The LP Duality Theorem . . . . . . . . . . 27
1.3 Selected Engineering Applications of LP 29
1.3.1 Sparsity-oriented Signal Processing and $\ell_1$ minimization 29
1.3.1.1 Sparse recovery from deficient observations 30
1.3.1.2 s-goodness and nullspace property 32
1.3.1.3 From nullspace property to error bounds for imperfect $\ell_1$ recovery 33
1.3.1.4 Compressed Sensing: Limits of performance 35
1.3.1.5 Verifiable sufficient conditions for s-goodness 36
1.3.2 Supervised Binary Machine Learning via LP Support Vector Machines 39
1.3.3 Synthesis of linear controllers 42
1.3.3.1 Discrete time linear dynamical systems 42
1.3.3.2 Affine control 43
1.3.3.3 Design specifications and the Analysis problem 43
1.3.3.4 Synthesis problem 44
1.3.3.5 Purified outputs and purified-output-based control laws 45
1.3.3.6 Tractability of the Synthesis problem 47
1.3.3.7 Clearing debts: justification of (\*) 48
1.4 From Linear to Conic Programming 50
1.4.1 Orderings of $\mathbb{R}^m$ and cones 50
1.4.2 "Conic programming" - what is it? 53
1.4.3 Conic Duality 54
1.4.4 Geometry of the primal and the dual problems 57
1.4.5 Conic Duality Theorem 59
1.4.5.1 Refinement 64
1.4.6 Is something wrong with conic duality? 66
1.4.7 Consequences of the Conic Duality Theorem 67
1.4.7.1 Sufficient condition for infeasibility 67
1.4.7.2 When is a scalar linear inequality a consequence of a given linear vector inequality? 70

1.4.7.3 “Robust solvability status” 71
1.5 Exercises for Lecture 1 74
1.5.1 Around General Theorem on Alternative 74
1.5.2 Around cones 76
1.5.2.1 Calculus of cones 76
1.5.2.2 Primal-dual pairs of cones and orthogonal pairs of subspaces 77
1.5.2.3 Several interesting cones 77
1.5.3 Around conic problems: Several primal-dual pairs 78
1.5.4 Feasible and level sets of conic problems 79
1.5.5 Operational exercises on engineering applications of LP 80

Conic Quadratic Programming 89
2.1 Conic Quadratic problems: preliminaries 89
2.2 Examples of conic quadratic problems 91
2.2.1 Contact problems with static friction [35] 91
2.3 What can be expressed via conic quadratic constraints? 93
2.3.1 Elementary CQ-representable functions/sets 95
2.3.2 Operations preserving CQ-representability of sets 96
2.3.3 Operations preserving CQ-representability of functions 98
2.3.4 More operations preserving CQ-representability 99
2.3.5 More examples of CQ-representable functions/sets 109
2.3.6 Fast CQr approximations of exponent and logarithm 113
2.3.7 From CQR’s to K-representations of functions and sets 115
2.3.7.1 Conic representability of convex-concave function—definition 116
2.3.7.2 Main observation 117
2.3.7.3 Symmetry 118
2.3.7.4 Calculus of conic representations of convex-concave functions 118
2.3.7.5 Illustrations 125
2.4 More applications: Robust Linear Programming 127
2.4.1 Robust Linear Programming: the paradigm 127
2.4.2 Robust Linear Programming: examples 129
2.4.3 Robust counterpart of uncertain LP with a CQr uncertainty set 138
2.4.4 CQ-representability of the optimal value in a CQ program as a function of the data 142
2.4.5 Affinely Adjustable Robust Counterpart 143
2.4.5.1 Affinely Adjustable Robust Counterpart of LP 144
2.4.5.2 Example: Uncertain Inventory Management Problem 145
2.5 Does Conic Quadratic Programming exist? 151
2.5.1 Proof of Theorem 2.5.1 153
2.6 Exercises for Lecture 2 156
2.6.1 Optimal control in discrete time linear dynamic system 156
2.6.2 Around stable grasp 157
2.6.3 Around randomly perturbed linear constraints 157
2.6.4 Around Robust Antenna Design 159

Semidefinite Programming 163
3.1 Semidefinite cone and Semidefinite programs 163
3.1.1 Preliminaries 163
3.1.1.1 Dual to a semidefinite program (SDP) 165
3.1.1.2 Conic Duality in the case of Semidefinite Programming 166
3.1.2 Comments. 166
3.2 What can be expressed via LMI's? 167
3.2.1 SD-representability of functions of eigenvalues of symmetric matrices 169
3.2.1.1 SD-representability of functions of singular values 175
3.3 Applications of Semidefinite Programming in Engineering 182
3.3.1 Dynamic Stability in Mechanics 182
3.3.2 Truss Topology Design 185
3.3.3 Design of chips and Boyd's time constant 187
3.3.4 Lyapunov stability analysis/synthesis 189
3.3.4.1 Uncertain dynamical systems 189
3.3.4.2 Stability and stability certificates 190
3.3.4.3 Lyapunov Stability Synthesis 195
3.4 Semidefinite relaxations of intractable problems 197
3.4.1 Semidefinite relaxations of combinatorial problems 198
3.4.1.1 Combinatorial problems and their relaxations 198
3.4.1.2 Shor's Semidefinite Relaxation scheme 199
3.4.1.3 When the semidefinite relaxation is exact? 201
3.4.1.4 Stability number, Shannon and Lovasz capacities of a graph 202
3.4.1.5 The MAXCUT problem and maximizing quadratic form over a box 206
3.4.1.6 Nesterov's $\frac{\pi}{2}$ Theorem 208
3.4.1.7 Shor's semidefinite relaxation revisited 211
3.4.2 Semidefinite relaxation on ellitopes and its applications 211
3.4.2.1 Ellitopes 212
3.4.2.2 Construction and main result 212
3.4.2.3 Application: Near-optimal linear estimation 216
3.4.2.4 Application: Tight bounding of operator norms 218
3.4.3 Matrix Cube Theorem and interval stability analysis/synthesis 222
3.4.3.1 The Matrix Cube Theorem 223
3.4.3.2 Application: Lyapunov Stability Analysis for an interval matrix 227
3.4.3.3 Application: Nesterov's $\frac{\pi}{2}$ Theorem revisited 229
3.4.3.4 Application: Bounding robust ellitopic norms of uncertain matrix with box uncertainty 230
3.5 S-Lemma and Approximate S-Lemma 237
3.5.1 S-Lemma 237
3.5.2 Inhomogeneous S-Lemma 239
3.5.3 Approximate S-Lemma 240
3.5.3.1 Application: Approximating Affinely Adjustable Robust Counterpart of Uncertain Linear Programming problem with ellitopic uncertainty 243
3.5.3.2 Application: Robust Conic Quadratic Programming with ellitopic uncertainty 245

3.6 Semidefinite Relaxation and Chance Constraints 249
3.6.1 Chance constraints 249
3.6.2 Safe tractable approximations of chance constraints 251
3.6.3 Situation and goal 251
3.6.4 Approximating chance constraints via Lagrangian relaxation 251
3.6.4.1 Illustration I 253
3.6.5 Modification 254
3.6.5.1 Illustration II 256
3.7 Extremal ellipsoids 256
3.7.1 Preliminaries on ellipsoids 257
3.7.2 Outer and inner ellipsoidal approximations 258
3.7.2.1 Inner ellipsoidal approximation of a polytope 259
3.7.2.2 Outer ellipsoidal approximation of a finite set 260
3.7.3 Ellipsoidal approximations of unions/intersections of ellipsoids 261
3.7.3.1 Inner ellipsoidal approximation of the intersection of full-dimensional ellipsoids 262
3.7.3.2 Outer ellipsoidal approximation of the union of ellipsoids 263
3.7.4 Approximating sums of ellipsoids 264
3.7.4.1 Problem (O) 265
3.7.4.2 Problem (I) 270
3.8 Exercises for Lecture 3 274
3.8.1 Around positive semidefiniteness, eigenvalues and $\succeq$ -ordering 274
3.8.1.1 Criteria for positive semidefiniteness 274
3.8.1.2 Variational characterization of eigenvalues 275
3.8.1.3 Birkhoff's Theorem 278
3.8.1.4 Semidefinite representations of functions of eigenvalues 282
3.8.1.5 Cauchy's inequality for matrices 283
3.8.1.6 $\succeq$ -convexity of some matrix-valued functions 284
3.8.2 SD representations of epigraphs of convex polynomials 285
3.8.3 Around the Lovasz capacity number and semidefinite relaxations of combinatorial problems 288
3.8.4 Around operator norms 293
3.8.5 Around Lyapunov Stability Analysis 294
3.8.6 Around ellipsoidal approximations 295
3.8.6.1 More on ellipsoidal approximations of sums of ellipsoids 296
3.8.6.2 "Simple" ellipsoidal approximations of sums of ellipsoids 297
3.8.6.3 Invariant ellipsoids 298
3.8.6.4 Greedy infinitesimal ellipsoidal approximations 299
3.8.7 Around S-Lemma 301
3.8.7.1 A straightforward proof of the standard S-Lemma 302
3.8.7.2 S-Lemma with a multi-inequality premise 303
3.8.7.3 Relaxed versions of S-Lemma 309
3.8.8 Around Chance constraints 311

Polynomial Time Interior Point algorithms for LP, CQP and SDP 315
4.1 Complexity of Convex Programming . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
4.1.1 Combinatorial Complexity Theory . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
4.1.2 Complexity in Continuous Optimization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
4.1.3 Computational tractability of convex optimization problems 319
4.1.3.1 What is inside Theorem 4.1.1: Black-box represented convex programs and the Ellipsoid method 321
4.1.3.2 Proof of Theorem 4.1.2: the Ellipsoid method 322
4.1.4 Difficult continuous optimization problems 331
4.2 Interior Point Polynomial Time Methods for LP, CQP and SDP 332
4.2.1 Motivation 332
4.2.2 Interior Point methods 333
4.2.2.1 The Newton method and the Interior penalty scheme 333
4.2.3 But... 336
4.3 Interior point methods for LP, CQP, and SDP: building blocks 338
4.3.1 Canonical cones and canonical barriers 338
4.3.2 Elementary properties of canonical barriers 340
4.4 Primal-dual pair of problems and primal-dual central path 342
4.4.1 The problem(s) 342
4.4.2 The central path(s) 343
4.4.2.1 On the central path 345
4.4.2.2 Near the central path 347
4.5 Tracing the central path 349
4.5.1 The path-following scheme 349
4.5.2 Speed of path-tracing 351
4.5.3 The primal and the dual path-following methods 352
4.5.4 The SDP case 355
4.5.4.1 The path-following scheme in SDP 355
4.5.4.2 Complexity analysis 357
4.6 Complexity bounds for LP, CQP, SDP 368
4.6.1 Complexity of $\mathcal{LP}_b$ 368
4.6.2 Complexity of $\mathcal{CQP}_b$ 369
4.6.3 Complexity of $\mathcal{SDP}_b$ 369
4.7 Concluding remarks 370
4.8 Exercises for Lecture 372
4.8.1 Around canonical barriers 372
4.8.2 Scalings of canonical cones 373
4.8.3 The Dikin ellipsoid 375
4.8.4 More on canonical barriers 377
4.8.5 Around the primal path-following method 378
4.8.6 Infeasible start path-following method 380
Simple methods for large-scale problems 389
5.1 Motivation: Why simple methods? 389
5.1.1 Black-box-oriented methods and Information-based complexity 391
5.1.2 Main results on Information-based complexity of Convex Programming 392
5.2 The Simplest: Subgradient Descent and Euclidean Bundle Level 395

5.2.1 Subgradient Descent . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 395   
5.2.2 Incorporating memory: Euclidean Bundle Level Algorithm . . . . . . . . . . . . . . . . . . . . . . . 398   
5.3 Mirror Descent algorithm . . . . . . . . . . . . . . . . . . . . . . . . . . . 402   
5.3.1 Problem and assumptions . . . . . . . . . . . . . . . . . . . . . . 402   
5.3.2 Proximal setup . . . . . . . . . . . . . . . 403   
5.3.3 Standard proximal setups 404   
5.3.3.1 Ball setup 405   
5.3.3.2 Entropy setup 405   
5.3.3.3 $\ell_1 / \ell_2$ and Simplex setups 406   
5.3.3.4 Nuclear norm and Spectahedron setups 407   
5.3.4 Mirror Descent algorithm 409   
5.3.4.1 Basic Fact 409   
5.3.4.2 Standing Assumption 410   
5.3.4.3 MD: Description 410   
5.3.4.4 MD: Complexity analysis 411   
5.3.4.5 Refinement 412   
5.3.4.6 MD: Optimality 414   
5.3.5 Mirror Descent and Online Regret Minimization 416   
5.3.5.1 Online regret minimization: what is it? 416   
5.3.5.2 Online regret minimization via Mirror Descent, deterministic case 418   
5.3.6 Mirror Descent for Saddle Point problems 420   
5.3.6.1 Convex-Concave Saddle Point problem 420   
5.3.6.2 Saddle point MD algorithm 421   
5.3.6.3 Refinement 423   
5.3.7 Mirror Descent for Stochastic Minimization/Saddle Point problems 424   
5.3.7.1 Stochastic Minimization/Saddle Point problems 424   
5.3.7.2 Stochastic Saddle Point Mirror Descent algorithm 424   
5.3.7.3 Refinement 427   
5.3.7.4 Solving (5.3.75) via Stochastic Saddle Point Mirror Descent.. 432   
5.3.8 Mirror Descent and Stochastic Online Regret Minimization 438   
5.3.8.1 Stochastic online regret minimization: problem's formulation 438   
5.3.8.2 Minimizing stochastic regret by MD 439   
5.3.8.3 Illustration: predicting sequences 440   
5.4 Bundle Mirror and Truncated Bundle Mirror algorithms 444   
5.4.1 Bundle Mirror algorithm 444   
5.4.1.1 BM: Description 444   
5.4.1.2 Convergence analysis 445   
5.4.2 Truncated Bundle Mirror 446   
5.4.2.1 TBM: motivation 446   
5.4.2.2 TBM: construction 446   
5.4.2.3 Convergence Analysis 449   
5.4.2.4 Implementation issues 451   
5.4.2.5 Illustration: PET Image Reconstruction by MD and TBM 453   
5.4.2.6 Alternative: PET via Krylov subspace minimization 460   
5.5 Saddle Point representations and Mirror Prox algorithm 463   
5.5.1 Motivation 463   
5.5.1.1 Examples of saddle point representations 466

5.5.2 The Mirror Prox algorithm . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 468
5.5.2.1 Refinement . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 470
5.5.2.2 Typical implementation . . . . . . . . . . . . . . . . . . . . . . . . . . 471
5.6 Summary on Mirror Descent and Mirror Prox Algorithms ..... 474
5.6.1 Situation ..... 474
5.6.2 Mirror Descent and Mirror Prox algorithms ..... 475
5.6.2.1 First Order oracles and oracle-based algorithms ..... 475
5.6.2.2 Mirror Descent Algorithm ..... 475
5.6.3 Mirror Prox algorithm ..... 479
5.6.4 Processing problems with convex structure by Mirror Descent and Mirror
Prox algorithms ..... 481
5.6.4.1 Problems with convex structure ..... 481
5.6.4.2 Problems with convex structure: basic descriptive results ..... 487
5.6.4.3 Problems with convex structure: basic operational results ..... 490
5.7 Well-structured monotone vector fields ..... 495
5.7.1 Conic representability of monotone vector fields and monotone VI's in
conic form ..... 495
5.7.1.1 Conic representation of a monotone vector field ..... 495
5.7.1.2 Conic form of conic-representable monotone VI ..... 496
5.7.2 Calculus of conic representations of monotone vector fields ..... 497
5.7.2.1 Raw materials ..... 497
5.7.2.2 Calculus rules ..... 499
5.7.3 Illustrations ..... 500
5.7.3.1 "Academic" illustration ..... 500
5.7.3.2 Nash Equilibrium ..... 501
5.7.4 Derivations for Section 5.7.2 ..... 504
5.7.4.1 Verification of "raw materials" ..... 504
5.7.4.2 Verification of calculus rules ..... 508
5.7.4.3 Verifying (5.7.30) and (5.7.31) ..... 509
5.8 Fast First Order algorithms for Smooth Convex Minimization ..... 510
5.8.1 Fast Gradient Methods for Smooth Composite minimization ..... 510
5.8.1.1 Problem formulation ..... 510
5.8.1.2 Composite prox-mapping ..... 511
5.8.1.3 Fast Composite Gradient minimization: Algorithm and Main
Result ..... 513
5.8.1.4 Proof of Theorem 5.8.1 ..... 514
5.8.2 "Universal" Fast Gradient Methods ..... 516
5.8.2.1 Problem formulation ..... 517
5.8.2.2 Algorithm and Main Result ..... 517
5.8.2.3 Proof of Theorem 5.8.2 ..... 521
5.8.3 From Fast Gradient Minimization to Conditional Gradient ..... 524
5.8.3.1 Proximal and Linear Minimization Oracle based First Order al-
gorithms ..... 524
5.8.3.2 Conditional Gradient algorithm ..... 525
5.8.3.3 Bridging Fast and Conditional Gradient algorithms ..... 527
5.8.3.4 LMO-based implementation of Fast Universal Gradient Method ..... 529
5.9 Appendix: Some proofs ..... 530

5.9.1 A useful technical lemma 530
5.9.2 Justifying Ball setup 531
5.9.3 Justifying Entropy setup 531
5.9.4 Justifying $\ell_1 / \ell_2$ setup 532
5.9.4.1 Proof of Theorem 5.9.1 532
5.9.4.2 Proof of Corollary 5.9.1 533
5.9.5 Justifying Nuclear norm setup 534
5.9.5.1 Proof of Theorem 5.9.2 535
5.9.5.2 Proof of Corollary 5.9.2 538

Bibliography 539

Solutions to selected exercises 543
6.1 Exercises for Lecture 1 543
6.1.1 Around Theorem on Alternative 543
6.1.2 Around cones 543
6.1.3 Feasible and level sets of conic problems 545
6.2 Exercises for Lecture 2 547
6.2.1 Optimal control in discrete time linear dynamic system 547
6.2.2 Around stable grasp 548
6.3 Exercises for Lecture 3 550
6.3.1 Around positive semidefiniteness, eigenvalues and $\succeq$ -ordering 550
6.3.1.1 Criteria for positive semidefiniteness 550
6.3.1.2 Variational description of eigenvalues 550
6.3.1.3 Cauchy's inequality for matrices 553
6.3.2 $\succeq$ -convexity of some matrix-valued functions 557
6.3.3 Around Lovasz capacity number 558
6.3.4 Around operator norms 559
6.3.5 Around $S$ -Lemma 561
6.3.5.1 A straightforward proof of the standard $S$ -Lemma 562
6.3.5.2 $S$ -Lemma with a multi-inequality premise 563
6.4 Exercises for Lecture 4 567
6.4.1 Around canonical barriers 567
6.4.2 Scalings of canonical cones 567
6.4.3 Dikin ellipsoid 568
6.4.4 More on canonical barriers 570
6.4.5 Around the primal path-following method 571
6.4.6 An infeasible start path-following method 571

A Prerequisites from Linear Algebra and Analysis 575
A.1 Space $\mathbb{R}^n$ : algebraic structure 575
A.1.1 A point in $\mathbb{R}^n$ 575
A.1.2 Linear operations 575
A.1.3 Linear subspaces 576
A.1.4 Linear independence, bases, dimensions 577
A.1.5 Linear mappings and matrices 579
A.1.6 Determinant and rank 580

A.1.6.1 Determinant 580
A.1.6.2 Rank 581
A.2 Space $\mathbb{R}^n$ : Euclidean structure 581
A.2.1 Euclidean structure 581
A.2.2 Inner product representation of linear forms on $\mathbb{R}^n$ 582
A.2.3 Orthogonal complement 583
A.2.4 Orthonormal bases 583
A.3 Affine subspaces in $\mathbb{R}^n$ 586
A.3.1 Affine subspaces and affine hulls 586
A.3.2 Intersections of affine subspaces, affine combinations and affine hulls 587
A.3.3 Affinely spanning sets, affinely independent sets, affine dimension 588
A.3.4 Dual description of linear subspaces and affine subspaces 590
A.3.4.1 Affine subspaces and systems of linear equations 590
A.3.5 Structure of the simplest affine subspaces 592
A.4 Space $\mathbb{R}^n$ : metric structure and topology 592
A.4.1 Euclidean norm and distances 592
A.4.2 Convergence 594
A.4.3 Closed and open sets 594
A.4.4 Local compactness of $\mathbb{R}^n$ 595
A.5 Continuous functions on $\mathbb{R}^n$ 596
A.5.1 Continuity of a function 596
A.5.2 Elementary continuity-preserving operations 597
A.5.3 Basic properties of continuous functions on $\mathbb{R}^n$ 597
A.6 Differentiable functions on $\mathbb{R}^n$ 598
A.6.1 The derivative 598
A.6.2 Derivative and directional derivatives 600
A.6.3 Representations of the derivative 601
A.6.4 Existence of the derivative 602
A.6.5 Calculus of derivatives 602
A.6.6 Computing the derivative 603
A.6.7 Higher order derivatives 604
A.6.8 Calculus of $C^k$ mappings 607
A.6.9 Examples of higher-order derivatives 608
A.6.10 Taylor expansion 609
A.7 Symmetric matrices 610
A.7.1 Main facts on symmetric matrices 611
A.7.1.1 Eigenvectors and eigenvalues 611
A.7.1.2 Eigenvalue decomposition of a symmetric matrix 611
A.7.1.3 Vector of eigenvalues 612
A.7.1.4 Freedom in eigenvalue decomposition 612
A.7.1.5 “Simultaneous” decomposition of commuting symmetric matrices 613
A.7.2 Variational characterization of eigenvalues 613
A.7.3 Corollaries of the VCE 615
A.7.3.1 Eigenvalue characterization of positive (semi)definite matrices 615
A.7.3.2 $\succeq$ -Monotonicity of the vector of eigenvalues 616
A.7.3.3 Eigenvalue Interlacement Theorem 616
A.7.4 Spectral norm and Lipschitz continuity of vector of eigenvalues 616

A.7.4.1 Spectral and induced norms of matrices . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 616
A.7.4.2 Lipschitz continuity of the vector of eigenvalues . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . A.7.5 Functions of symmetric matrices . . .
A.8 Positive semidefinite matrices and positive semidefinite cone. 620
A.8.1 Positive semidefinite matrices. 620
A.8.2 The positive semidefinite cone. 621
A.8.2.1 Schur Complement Lemma 624

3 Convex sets in R^n 625
B.1 Definition and basic properties 625
B.1.1 A convex set 625
B.1.2 Examples of convex sets 625
B.1.3 Inner description of convex sets: Convex combinations and convex hull 628
B.1.4 Cones 629
B.1.5 Calculus of convex sets 630
B.1.6 Topological properties of convex sets 631
B.2 Main theorems on convex sets 635
B.2.1 Caratheodory Theorem 635
B.2.2 Radon Theorem 636
B.2.3 Helley Theorem 636
B.2.4 Polyhedral representations and Fourier-Motzkin Elimination 637
B.2.5 General Theorem on Alternative and Linear Programming Duality 642
B.2.6 Separation Theorem 651
B.2.7 Polar of a convex set and Milutin-Dubovitski Lemma 658
B.2.8 Extreme points and Krein-Milman Theorem 661
B.2.9 Structure of polyhedral sets 666

C Convex functions 673
C.1 Convex functions: first acquaintance 673
C.1.1 Definition and Examples 673
C.1.2 Elementary properties of convex functions 674
C.1.2.1 Jensen's inequality 674
C.1.2.2 Convexity of level sets of a convex function 675
C.1.3 What is the value of a convex function outside its domain? 675
C.2 How to detect convexity 676
C.2.1 Operations preserving convexity of functions 676
C.2.2 Differential criteria of convexity 678
C.3 Gradient inequality 681
C.4 Boundedness and Lipschitz continuity of a convex function 683
C.5 Maxima and minima of convex functions 685
C.6 Subgradients and Legendre transformation 690
C.6.1 Proper functions and their representation 690
C.6.2 Subgradients 696
C.6.3 Legendre transformation 697

D Convex Programming, Lagrange Duality, Saddle Points 701
D.1 Mathematical Programming Program . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
D.2 Convex Programming program and Lagrange Duality Theorem 702
D.2.1 Convex Theorem on Alternative 702
D.2.1.1 Cone constrained case 704
D.2.2 Lagrange Function and Lagrange Duality 710
D.2.2.1 Lagrange function 710
D.2.2.2 Convex Programming Duality Theorem 710
D.2.2.3 Dual program 711
D.2.2.4 Cone constrained forms of Lagrange Function, Lagrange Duality,
and Convex Programming Duality Theorem 711
D.2.2.5 Conic Programming and Conic Duality Theorem 712
D.2.3 Optimality Conditions in Convex Programming 713
D.2.3.1 Saddle point form of optimality conditions 714
D.2.3.2 Karush-Kuhn-Tucker form of optimality conditions 715
D.2.3.3 Optimality conditions in Conic Programming 716
D.3 Duality in Linear and Convex Quadratic Programming 717
D.3.1 Linear Programming Duality 717
D.3.2 Quadratic Programming Duality 718
D.4 Saddle Points 720
D.4.1 Definition and Game Theory interpretation 720
D.4.2 Existence of Saddle Points 722

## Main Notational Conventions

Vectors and matrices. By default, all vectors are column vectors.

- The space of all n-dimensional vectors is denoted $\mathbb{R}^{n}$ , the set of all $m \times n$ matrices is denoted $\mathbb{R}^{m \times n} \mathrm{or} \mathbf{M}^{m \times n}$ , and the set of symmetric $n \times n$ matrices is denoted $\mathbf{S}^{n}$ . By default, all vectors and matrices are real.

- Sometimes, “MATLAB notation” is used: a vector with coordinates $x_{1},..., x_{n}$ is written down as

$$
x =[x_{1}; \dots; x_{n}]
$$

(pay attention to semicolon $^{66, 99})$ . For example, $\left[\begin{array}{l}{1} \\{2} \\{3} \end{array} \right]$ is written as $[1; 2; 3]$

More generally,

$\_{\mathrm{if} \A_{1}, \dots, A_{m}}$ are matrices with the same number of columns, we write $[A_{1};...; A_{m}]$ to denote the matrix which is obtained when writing $A_{2}$ beneath $A_{1}, A_{3}$ beneath $A_{2},$ and so on.

$\_{\mathrm{if} \A_{1}, \dots, A_{m}}$ are matrices with the same number of rows, then $[A_{1},..., A_{m}]$ stands for the matrix which is obtained when writing $A_{2}$ to the right of $A_{1}, A_{3}$ to the right of $A_{2}$ and so on.

Examples:

$$
\bullet A_{1} = \left[\begin{array}{lll} 1 & 2 & 3 \\ 4 & 5 & 6 \end{array} \right], A_{2} = \left[\begin{array}{lll} 7 & 8 & 9 \end{array} \right] \Rightarrow[A_{1}; A_{2}] = \left[\begin{array}{lll} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{array} \right]
$$

$$
\bullet A_{1} = \left[\begin{array}{ll} 1 & 2 \\ 3 & 4 \end{array} \right], A_{2} = \left[\begin{array}{l} 7 \\ 8 \end{array} \right] \Rightarrow[A_{1}, A_{2}] = \left[\begin{array}{lll} 1 & 2 & 7 \\ 4 & 5 & 8 \end{array} \right]
$$

$[1, 2, 3, 4] =[1; 2; 3; 4]^{T}$

$$
\begin{array}{rcl} \bullet &[[1, 2; 3, 4],[5, 6; 7, 8]] & = \\ & = & \left[\left[\begin{array}{cc} 1 & 2 \\ 3 & 4 \end{array} \right], \left[\begin{array}{cc} 5 & 6 \\ 7 & 8 \end{array} \right] \right] = \left[\begin{array}{cccc} 1 & 2 & 5 & 6 \\ 3 & 4 & 7 & 8 \end{array} \right] \\ & = &[1, 2, 5, 6; 3, 4, 7, 8] \end{array}
$$

$\mathbf{O}(\mathbf{1}) \mathbf{\bar{s}}$ . Below ${\cal O}(1)^{\prime}$ s denote properly selected positive absolute constants. We write $f \ \leq$ $O(1) g$ , where $f$ and g are nonnegative functions of some parameters, to express the fact that for properly selected positive absolute constant C the inequality $f \leq Cg$ holds true in the entire range of the parameters, and we write $f = O(1) g$ when both $f \leq O(1) g$ and $g \leq O(1) f$

Color encoding in the text:

- Plain text

- Theorems, Propositions, Lemmas,...

- Proofs

- Pen and Pencil Exercises

Exercises with solutions

- Operational Exercises

## Lecture 1


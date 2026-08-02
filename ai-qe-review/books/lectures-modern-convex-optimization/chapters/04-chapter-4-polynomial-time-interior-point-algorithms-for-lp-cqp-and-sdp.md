---
title: "Chapter 4 \u2014 Polynomial Time Interior Point algorithms for LP, CQP and SDP"
book: "Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications"
book_slug: lectures-modern-convex-optimization
course: optimization
chapter_number: 4
citekey: null
official_syllabus: false
source_pdf: "sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-modern-convex-optimization/reading.md"
source_line_start: 13669
source_line_end: 16727
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 2
caption_derived_image_alt: 4
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 34
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
---

# Chapter 4 — Polynomial Time Interior Point algorithms for LP, CQP and SDP

> [[../README|本书目录]] · [[03-chapter-3-convex-sets-in-r-n|上一章]] · [[05-chapter-5-simple-methods-for-large-scale-problems|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Modern Convex Optimization: 2020/2021/2022/2023 Analysis, Algorithms, Engineering Applications
> - 权威原件：[source.pdf](../../../sources/textbooks/supplementary/optimization/lectures-modern-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-modern-convex-optimization/reading.md)，源行 13669–16727。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 34；Affine × 11；different × 6；efficient × 1；sufficient × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Polynomial Time Interior Point algorithms for LP, CQP and SDP

## 4.1 Complexity of Convex Programming

When we attempt to solve any problem, we would like to know whether it is possible to find a correct solution in a “reasonable time”. Had we known that the solution will not be reached in the next 30 years, we would think (at least) twice before starting to solve it. Of course, this in an extreme case, but undoubtedly, it is highly desirable to distinguish between “computationally tractable” problems – those that can be solved eficiently – and problems which are “computationally intractable”. The corresponding complexity theory was first developed in Computer Science for combinatorial (discrete) problems, and later somehow extended onto the case of continuous computational problems, including those of Continuous Optimization. In this Section, we outline the main concepts of the CT – Combinatorial Complexity Theory – along with their adaptations to Continuous Optimization.

## 4.1.1 Combinatorial Complexity Theory

A generic combinatorial problem is a family P of problem instances of a “given structure”, each instance $(p) \in{\mathcal{P}}$ being identified by a finite-dimensional data vector Data(p), specifying the particular values of the coeficients of “generic” analytic expressions. The data vectors are assumed to be Boolean vectors – with entries taking values 0, 1 only, so that the data vectors are, actually, finite binary words.

The model of computations in CT: an idealized computer capable to store only integers (i.e., finite binary words), and its operations are bitwise: we are allowed to multiply, add and compare integers. To add and to compare two \`-bit integers, it takes $O(\ell)$ “bitwise” elementary operations, and to multiply a pair of \`-bit integers it costs $O(\ell^{2})$ elementary operations (the cost of multiplication can be reduced to $O(\ell \ln(\ell))$ , but it does not matter) .

In CT, a solution to an instance $(p)$ of a generic problem $\mathcal{P}$ is a finite binary word $y$ such that the pair $(\mathrm{Data}(p), y)$ satisfies certain “verifiable condition” $\boldsymbol{\mathcal{A}}(\cdot, \cdot)$ . Namely, it is assumed that there exists a code M for the above “Integer Arithmetic computer” such that executing the code on every input pair $x, y$ of finite binary words, the computer after finitely many elementary operations terminates and outputs either “yes”, if $ { \mathcal Ḋ A Ḍ } ( x , y )$ is satisfied, or $^{66} \mathrm{no}^{99}$ , if $ { \mathcal Ḋ A Ḍ } ( x , y )$ is not satisfied. Thus, P is the problem

Given x, find y such that

$$
\mathcal{A}(x, y) = \text{true},\tag{4.1.1}
$$

or detect that no such y exists.

For example, the problem Stones:

Given n positive integers $a_{1},..., a_{n}$ , find a vector $\boldsymbol{x} =(x_{1},..., x_{n})^{T}$ with coordinates ±1 such that $\sum_{i} x_{i} a_{i} = 0$ , or detect that no such vector exists

is a generic combinatorial problem. Indeed, the data of the instance of the problem, same as candidate solutions to the instance, can be naturally encoded by finite sequences of integers. In turn, finite sequences of integers can be easily encoded by finite binary words. And, of course, for this problem you can easily point out a code for the “Integer Arithmetic computer” which, given on input two binary words $x = \operatorname{Data}(p)$ , y encoding the data vector of an instance (p) of the problem and a candidate solution, respectively, verifies in finitely many “bit” operations whether y represents or does not represent a solution to (p).

A solution algorithm for a generic problem P is a code S for the Integer Arithmetic computer which, given on input the data vector Data(p) of an instance $(p) \in{\mathcal{P}},$ , after finitely many operations either returns a solution to the instance, or a (correct!) claim that no solution exists. The running time $T_{S}(\boldsymbol{p})$ of the solution algorithm on instance (p) is exactly the number of elementary (i.e., bit) operations performed in course of executing S on Data(p).

A solvability test for a generic problem P is defined similarly to a solution algorithm, but now all we want of the code is to say (correctly!) whether the input instance is or is not solvable, just “yes” or “no”, without constructing a solution in the case of the “yes” answer.

The complexity of a solution algorithm/solvability test S is defined as

$$
\operatorname{Compl}_{\mathcal{S}}(\ell) = \max \left\{T_{\mathcal{S}}(p) \mid(p) \in \mathcal{P}, \text{length}(\mathrm{Data}(p)) \leq \ell \right\},
$$

where length(x) is the bit length (i.e., number of bits) of a finite binary word x. The algorithm/test is called polynomial time, if its complexity is bounded from above by a polynomial of \`.

Finally, a generic problem P is called to be polynomially solvable, if it admits a polynomial time solution algorithm. If P admits a polynomial time solvability test, we say that P is polynomially verifiable.

Classes P and NP. A generic problem P is said to belong to the class NP, if the corresponding condition A, see (4.1.1), possesses the following two properties:

I. A is polynomially computable, i.e., the running time $T(x, y)$ (measured, of course, in elementary “bit” operations) of the associated code M is bounded from above by a polynomial of the bit length length $\mathbf{\tau}_{1}(x) + \mathrm{length}(y)$ of the input:

$$
T(x, y) \leq \chi(\mathrm{length}(x) + \mathrm{length}(y))^{\chi} \quad \forall(x, y)^{1)}
$$

Thus, the first property of an NP problem states that given the data $Data(p)$ of a problem instance p and a candidate solution y, it is easy to check whether y is an actual solution of $(p) \textrm{-}$ to verify this fact, it sufices to compute $A(\operatorname{Data}(p), y)$ , and this computation requires polynomial in leng $\operatorname{th}(\operatorname{Data}(p)) + \operatorname{length}(y)$ time. The second property of an NP problem makes its instances even more easier:

II. A solution to an instance $(p)$ of a problem cannot be “too long” as compared to the data of the instance: there exists $\chi$ such that

$$
\mathrm{length}(y) > \chi \mathrm{length}^{\chi}(x) \Rightarrow \mathcal{A}(x, y) = ” \mathbf{no} ”.
$$

A generic problem $\mathcal{P}$ is said to belong to the class P, if it belongs to the class NP and is polynomially solvable.

## NP-completeness is defined as follows:

Definition 4.1.1 (i) Let P, Q be two problems from NP. Problem Q is called to be polynomially reducible to ${\mathcal P},$ if there exists a polynomial time algorithm M (i.e., a code for the Integer Arithmetic computer with the running time bounded by a polynomial of the length of the input) with the following property. Given on input the data vector Data(q) of an instance $(q) \in \mathcal{Q}, \mathcal{M}$ converts this data vector to the data vector Data $(p[q])$ of an instance of $\mathcal{P}$ such that $(p[q])$ is solvable if and only if $(q)$ is solvable.

(ii) A generic problem $\mathcal{P}$ from NP is called NP-complete, if every other problem Q from NP is polynomially reducible to $\mathcal{P}_{\cdot}$

The importance of the notion of an NP-complete problem comes from the following fact:

If a particular NP-complete problem is polynomially verifiable $( i . \mathrm { e . } _ { } $ , admits a polynomial time solvability test), then every problem from NP is polynomially solvable: $\mathbb{P} = \mathrm{NP}.$

The question whether P=NP – whether NP-complete problems are or are not polynomially solvable, is qualified as “the most important open problem in Theoretical Computer Science” and remains open for about 30 years. One of the most basic results of Theoretical Computer Science is that NP-complete problems do exist (the Stones problem is an example). Many of these problems are of huge practical importance, and are therefore subject, over decades, of intensive studies of thousands excellent researchers. However, no polynomial time algorithm for any of these problems was found. Given the huge total efort invested in this research, we should conclude that it is “highly improbable” that NP-complete problems are polynomially solvable. Thus, at the “practical level” the fact that certain problem is NP-complete is sufficient to qualify the problem as “computationally intractable”, at least at our present level of knowledge.

## 4.1.2 Complexity in Continuous Optimization

It is convenient to represent continuous optimization problems as Mathematical Programming problems, i.e. programs of the following form:

$$
\min_{x} \left\{p_{0}(x): x \in X(p) \subset \mathbb{R}^{n(p)} \right\}\tag{p}
$$

where

$n(p)$ is the design dimension of program $(p){\mathrm{;}}$

$X(p) \subset \mathbb{R}^{n}$ is the feasible domain of the program;

$p_{0}(x) : \mathbb{R}^{n} \mathbb{R}$ is the objective of $(p)$

Families of optimization programs. We want to speak about methods for solving optimization programs $(p) ~^{6} \mathrm{of}$ a given structure” (for example, Linear Programming ones). All programs $(p)$ “of a given structure”, like in the combinatorial case, form certain family $\mathcal{P}_{\cdot}$ , and we assume that every particular program in this family – every instance $(p)$ of $\mathcal{P} -$ is specified by its particular data ${\mathrm{Data}}(p)$ . However, now the data is a finite-dimensional real vector; one may think about the entries of this data vector as about particular values of coeficients of “generic” (specific for $\mathcal{P})$ analytic expressions for $p_{0}(x)$ and $X(p)$ . The maximum of the design dimension $n(p)$ of an instance $p$ and the dimension of the vector ${\mathrm{Data}}(p)$ will be called the size of the instance $(p)$

$$
\operatorname{Size}(p) = \max[n(p), \dim \operatorname{Data}(p)].
$$

The model of computations. This is what is known as “Real Arithmetic Model of Computations”, as opposed to ”Integer Arithmetic Model” in the CT. We assume that the computations are carried out by an idealized version of the usual computer which is capable to store countably many reals and can perform with them the standard exact real arithmetic operations – the four basic arithmetic operations, evaluating elementary functions, like cos and exp, and making comparisons.

Accuracy of approximate solutions. We assume that a generic optimization problem $\mathcal{P}$ is equipped with an “infeasibility measure” $\mathrm{Infeas}_{\mathcal{P}}(x, p) \mathrm{~ - ~ a ~}$ real-valued function of $p \in \mathcal P$ and $x \in \mathbb{R}^{n(p)}$ which quantifies the infeasibility of vector x as a candidate solution to $(p)$ . In our general considerations, all we require from this measure is that

- Infeas<sub>P</sub> $\rho(x, p) \geq 0$ , and $\mathrm{Infeas}_{\mathcal{P}}(x, p) = 0$ when x is feasible for $\left(p \right) \left(\mathrm{i.e.} \right.$ , when $x \in X(p))$

Given an infeasibility measure, we can proceed to define the notion of an $\epsilon$-solution to an instance $(p) \in{\mathcal{P}}$ , namely, as follows. Let

$$
\operatorname{Opt}(p) \in \{- \infty\} \cup \mathbb{R} \cup \{+ \infty\}
$$

be the optimal value of the instance $(\mathrm{i.e.}$ , the infimum of the values of the objective on the feasible set, if the instance is feasible, and $+ \infty$ otherwise). A point $x \in \mathbb{R}^{n(p)}$ is called an $\epsilon$-solution to $(p)$ , if

$$
\operatorname{Infeas}_{\mathcal{P}}(x, p) \leq \epsilon \text{and} p_{0}(x) - \operatorname{Opt}(p) \leq \epsilon,
$$

i.e., if x is both “$\epsilon$-feasible” and “$\epsilon$-optimal” for the instance.

It is convenient to define the number of accuracy digits in an $\epsilon$-solution to $(p)$ as the quantity

$$
\operatorname{Digits}(p, \epsilon) = \ln \left(\frac{\operatorname{Size}(p) + \| \operatorname{Data}(p) \|_{1} + \epsilon^{2}}{\epsilon}\right).
$$

Solution methods. A solution method M for a given family $\mathcal{P}$ of optimization programs is a code for the idealized Real Arithmetic computer. When solving an instance $(p) \in{\mathcal{P}}$ , the computer first inputs the data vector ${\mathrm{Data}}(p)$ of the instance and a real $\epsilon > 0 -$ the accuracy to which the instance should be solved, and then executes the code $\mathcal{M}$ on this input. We assume that the execution, on every input $(\mathrm{Data}(p), \epsilon > 0)$ with $(p) \in{\mathcal{P}}$ , takes finitely many elementary operations of the computer, let this number be denoted by $\mathrm{Compl}_{\mathcal{M}}(p, \epsilon)$ , and results in one of the following three possible outputs:

– an $n(p)$ -dimensional vector Res $\mathcal{M}(p, \epsilon)$ which is an $\epsilon$-solution to $(p)$ ,

– a correct message $^{66}(p)$ is infeasible”,

– a correct message $^{66}(p)$ is unbounded below”.

We measure the eficiency of a method by its running time $\mathrm{Compl}_{\mathcal{M}}(p, \epsilon) \ -$ the number of elementary operations performed by the method when solving instance $(p)$ within accuracy $\epsilon$. By definition, the fact that $\mathcal{M}$ is “efficient” (polynomial time) on $\mathcal{P}_{\cdot}$ , means that there exists a polynomial $\pi(s, \tau)$ such that

$$
\begin{array}{c} \operatorname{Compl}_{\mathcal{M}}(p, \epsilon) \leq \pi(\operatorname{Size}(p), \operatorname{Digits}(p, \epsilon)) \\ \forall(p) \in \mathcal{P} \forall \epsilon > 0.\end{array}\tag{4.1.2}
$$

Informally speaking, polynomially of M means that when we increase the size of an instance and the required number of accuracy digits by absolute constant factors, the running time increases by no more than another absolute constant factor.

We call a family $\mathcal{P}$ of optimization problems polynomially solvable (or, which is the same, computationally tractable), if it admits a polynomial time solution method.

## 4.1.3 Computational tractability of convex optimization problems

A generic optimization problem P is called convex, if, for every instance $(p) \in{\mathcal{P}}$ , both the objective $p_{0}(x)$ of the instance and the infeasibility measure Infeas<sub>P</sub>(x, p) are convex functions of $x \in \mathbb{R}^{n(p)}$ . One of the major complexity results in Continuous Optimization is that a generic convex optimization problem, under mild computability and regularity assumptions, is polyno mially solvable (and thus “computationally tractable”). To formulate the precise result, we start with specifying the aforementioned “mild assumptions”.

Polynomial computability. Let P be a generic convex program, and let Infea $\operatorname{s}_{\mathcal{P}}(x, p)$ be the corresponding measure of infeasibility of candidate solutions. We say that our family is polynomially computable, if there exist two codes $\mathcal{C}_{\mathrm{obj}}, \mathcal{C}_{\mathrm{cons}}$ for the Real Arithmetic computer such that

1. For every instance $(p) \in{\mathcal{P}}$ , the computer, when given on input the data vector of the instance $(p)$ and a point $x \in \mathbb{R}^{n(p)}$ and executing the code $\mathcal{C}_{\mathrm{obj}}$ , outputs the value $p_{0}(x)$ and a subgradient $e(x) \in \partial p_{0}(x)$ of the objective $p_{0}$ of the instance at the point $x,$ and the running time $(\mathrm{i.e.}$ , total number of operations) of this computation $T_{\mathrm{obj}}(x, p)$ is bounded from above by a polynomial of the size of the instance:

$$
\forall \left((p) \in \mathcal{P}, x \in \mathbb{R}^{n(p)}\right): \quad T_{\mathrm{obj}}(x, p) \leq \chi \text{Size}^{\chi}(p) \quad[\text{Size}(p) = \max[n(p), \dim \text{Data}(p)]].\tag{4.1.3}
$$

(recall that in our notation, χ is a common name of characteristic constants associated with P). 2. For every instance $(p) \in{\mathcal{P}}$ , the computer, when given on input the data vector of the instance $(p)$ , a point $x \in \mathbb{R}^{n(p)}$ and an $\epsilon > 0$ and executing the code $\mathcal{C}_{\mathrm{cons}}.$ , reports on output whether Infeas $\begin{array}{r}{p(x, p) \le \epsilon,} \end{array}$ and if it is not the case, outputs a linear form a which separates the point x from all those points y where Infeas $\mathcal{P}(y, p) \leq \epsilon \mathrm{:}$

$$
\forall(y, \operatorname{Infeas}_{\mathcal{P}}(y, p) \leq \epsilon): \quad a^{T} x > a^{T} y,\tag{4.1.4}
$$

the running time $T_{\mathrm{cons}}(x, \epsilon, p)$ of the computation being bounded by a polynomial of the size of the instance and of the “number of accuracy digits”:

$$
\forall \left((p) \in \mathcal{P}, x \in \mathbb{R}^{n(p)}, \epsilon > 0\right): T_{\text{cons}}(x, \epsilon, p) \leq \chi(\text{Size}(p) + \text{Digits}(p, \epsilon))^{\chi}.\tag{4.1.5}
$$

Note that the vector a in (4.1.4) is not supposed to be nonzero; when it is 0, (4.1.4) simply says that there are no points y with Infeas $\mathcal{P}(y, p) \leq \epsilon$

Polynomial growth. We say that a generic convex program $\mathcal{P}$ is with polynomial growth, if the objectives and the infeasibility measures, as functions of $x,$ grow polynomially with $\lVert x \rVert_{1}$ 9 the degree of the polynomial being a power of $\operatorname{Size}(p)$

$$
\begin{array}{l} \forall \left((p) \in \mathcal{P}, x \in \mathbb{R}^{n(p)}\right): \\ | p_{0}(x) | + \text{Infeas}_{\mathcal{P}}(x, p) \leq(\chi \left[\text{Size}(p) + \| x \|_{1} + \| \text{Data}(p) \|_{1} \right])^{\left(\chi \text{Size}^{\chi}(p)\right)}.\end{array}\tag{4.1.6}
$$

Polynomial boundedness of feasible sets. We say that a generic convex program $\mathcal{P}$ has polynomially bounded feasible sets, if the feasible set $X(p)$ of every instance $(p) \in{\mathcal{P}}$ is bounded, and is contained in the Euclidean ball, centered at the origin, of “not too large” radius:

$$
\begin{array}{l} \forall(p) \in \mathcal{P}: \\ X(p) \subset \left\{x \in \mathbb{R}^{n(p)}: \| x \|_{2} \leq(\chi[\text{Size}(p) + \| \text{Data}(p) \|_{1}])^{\chi \text{Size}^{\chi}(p)} \right\}.\end{array}\tag{4.1.7}
$$

Example. Consider generic optimization problems $\mathcal{LP}_{b}, \mathcal{CQP}_{b}, \mathcal{SDP}_{b}$ with instances in the conic form

$$
\min_{x \in{\bf R}^{n(p)}} \left\{p_{0}(x) \equiv c_{(p)}^{T} x: x \in X(p) \equiv \{x: A_{(p)} x - b_{(p)} \in{\bf K}(p), \| x \|_{2} \leq R\} \right\};\tag{4.1.8}
$$

where K is a cone belonging to a characteristic for the generic program family K of cones, specifically,

- the family of nonnegative orthants for $\mathcal{LP}_{b}$ 2

- the family of direct products of Lorentz cones for $\mathcal{CQP}_{b}$

- the family of semidefinite cones for $SD \mathcal{P}_{b}$

The data of and instance $(p)$ of the type (4.1.8) is the collection

$$
\mathrm{Data}(p) =(n(p), c_{(p)}, A_{(p)}, b_{(p)}, R, \langle \mathrm{size(s)of} \mathbf{K}_{(p)} \rangle),
$$

with naturally defined size(s) of a cone K from the family K associated with the generic program under consideration: the sizes of $\mathbb{R}_{+}^{n}$ and of $\mathbf{S}_{+}^{n}$ equal $n,$ and the size of a direct product of Lorentz cones is the sequence of the dimensions of the factors.

The generic conic programs in question are equipped with the infeasibility measure

$$
\operatorname{Infeas}(x, p) = \min \left\{t \geq 0: t \mathbf{e}[\mathbf{K}_{(p)}] + A_{(p)} x - b_{(p)} \in \mathbf{K}_{(p)} \right\},\tag{4.1.9}
$$

where e[K] is a naturally defined “central point” of $\mathbf{K} \in{\mathcal{K}}.$ , specifically,

- the n-dimensional vector of ones when ${\bf K} ={\bf R}_{+}^{n}$

- the vector $\mathbf{e}_{m} =(0,..., 0, 1)^{T} \in \mathbb{R}^{m}$ when $\mathbf{K}_{(p)}$ is the Lorentz cone ${\bf L}^{m}$ , and the direct sum of these vectors, when K is a direct product of Lorentz cones,

- the unit matrix of appropriate size when K is a semidefinite cone.

In the sequel, we refer to the three generic problems we have just defined as to Linear, Conic Quadratic and Semidefinite Programming problems with ball constraints, respectively. It is immediately seen that the generic programs $\mathcal{LP}_{b}, \mathcal{CQP}_{b}$ and $SD \mathcal{P}_{b}$ are convex and possess the properties of polynomial computability, polynomial growth and polynomially bounded feasible sets (the latter property is ensured by making the ball constraint $\| x \|_{2} \leq R \mathrm{~ a ~}$ part of program’s formulation).

Computational Tractability of Convex Programming. The role of the properties we have introduced becomes clear from the following result:

Theorem 4.1.1 Let $\mathcal{P}$ be a family of convex optimization programs equipped with infeasibility measure Infeas<sub>P</sub>(·, ·). Assume that the family is polynomially computable, with polynomial growth and with polynomially bounded feasible sets. Then P is polynomially solvable.

In particular, the generic Linear, Conic Quadratic and Semidefinite programs with ball constraints $\mathcal{LP}_{b}, \mathcal{CQP}_{b}, \mathcal{SDP}_{b}$ are polynomially solvable.

## 4.1.3.1 What is inside Theorem 4.1.1: Black-box represented convex programs and the Ellipsoid method

Theorem 4.1.1 is a more or less straightforward corollary of a result related to the so called Information-Based complexity of black-box represented convex programs. This result is interesting by its own right, this is why we reproduce it here:

Consider a Convex Programming program

$$
\min_{x} \left\{f(x): x \in X \right\}\tag{4.1.10}
$$

where

$X$ is a convex compact set in $\mathbb{R}^{n}$ with a nonempty interior

- $f$ is a continuous convex function on $X$

Assume that our “environment” when solving (4.1.10) is as follows:

1. We have access to a Separation Oracle Sep(X) for $X - a$ routine which, given on input a point $\boldsymbol{x} \in \mathbb{R}^{n}$ , reports on output whether or not $x \in$ int $X$ , and in the case of $x \not \in$ int $X$ , returns a separator – a nonzero vector e such that

$$
e^{T} x \geq \max_{y \in X} e^{T} y\tag{4.1.11}
$$

(the existence of such a separator is guaranteed by the Separation Theorem for convex sets);

2. We have access to a First Order oracle which, given on input a point $x \in$ int X, returns the value $f(x)$ and a subgradient $f^{\prime}(x)$ of $f$ at x (Recall that a subgradient $f^{\prime}(x)$ of $f$ at x is a vector such that

$$
f(y) \geq f(x) +(y - x)^{T} f^{\prime}(x)\tag{4.1.12}
$$

for all $y;$ convex function possesses subgradients at every relative interior point of its domain, see Section C.6.2.);

3. We are given two positive reals $R \geq r$ such that X is contained in the Euclidean ball, centered at the origin, of the radius R and contains a Euclidean ball of the radius r (not necessarily centered at the origin).

The result we are interested in is as follows:

Theorem 4.1.2 In the outlined “working environment”, for every given $\epsilon > 0$ it is possible to find an $\epsilon$-solution to (4.1.10), i.e., a point $x_{\epsilon} \in X$ with

$$
f(x_{\epsilon}) \leq \min_{x \in X} f(x) + \epsilon
$$

in no more than $N(\epsilon)$ subsequent calls to the Separation and the First Order oracles plus no more than $O(1) n^{2} N(\epsilon)$ arithmetic operations to process the answers of the oracles, with

$$
N(\epsilon) = O(1) n^{2} \ln \left(2 + \frac{\operatorname{Var}_{X}(f) R}{\epsilon \cdot r}\right).\tag{4.1.13}
$$

Here

$$
\operatorname{Var}_{X}(f) = \max_{X} f - \min_{X} f.
$$

## 4.1.3.2 Proof of Theorem 4.1.2: the Ellipsoid method

Assume that we are interested to solve the convex program (4.1.10) and we have an access to a separation oracle $\operatorname{Sep}(X)$ for the feasible domain of (4.1.10) and to a first order oracle $\mathcal{O}(f)$ for the objective of (4.1.10). How could we solve the problem via these “tools”? An extremely transparent way is given by the Ellipsoid method which can be viewed as a multi-dimensional extension of the usual bisection.

Ellipsoid method: the idea. Assume that we have already found an n-dimensional ellipsoid

$$
E = \{x = c + Bu \mid u^{T} u \leq 1\}[B \in \mathbf{M}^{n, n}, \mathrm{Det} B \neq 0]
$$

which contains the optimal set $X_{*}$ of (4.1.10) (note that $X_{*} \neq \varnothing.$ , since the feasible set X of (4.1.10) is assumed to be compact, and the objective $f \mathrm{~ - ~} \mathrm{to}$ be convex on the entire $\mathbb{R}^{n}$ and therefore continuous, see Theorem C.4.1). How could we construct a smaller ellipsoid containing X<sub>∗</sub> ?

The answer is immediate.

1) Let us call the separation oracle Sep(X), the center c of the current ellipsoid being the input. There are two possible cases:

1.a) $\operatorname{Sep}(X)$ reports that $c \not \in X$ and returns a separator a:

$$
a \neq 0, a^{T} c \geq \sup_{y \in X} a^{T} y.\tag{4.1.14}
$$

In this case we can replace our current “localizer” E of the optimal set $X_{*}$ by a smaller one – namely, by the “half-ellipsoid”

$$
\widehat{E} = \{x \in E | a^{T} x \leq a^{T} c\}.
$$

Indeed, by assumption $X_{*} \subset E;$ ; when passing from $E$ to ${\widehat{E}}_{:}$ we cut of all points x of E where $a^{T} x > a^{T} c,$ and by (4.1.14) all these points are outside of X and therefore outside of $X_{*} \subset X$ Thus, $X_{*} \subset \widehat{E}$

1.b) Sep(X) reports that $c \in X$ . In this case we call the first order oracle $\mathcal{O}(f)$ , c being the input; the oracle returns the value $f(c)$ and a subgradient $a = f^{\prime}(c)$ of $f$ at c. Again, two cases are possible:

1.b.1) $a = 0$ . In this case we are done – c is a minimizer of $f$ on $X$ . Indeed, $c \in X$ , and (4.1.12) reads

$$
f(y) \geq f(c) + 0^{T}(y - c) = f(c) \quad \forall y \in \mathbb{R}^{n}.
$$

Thus, c is a minimizer of $f$ on $\mathbb{R}^{n}$ , and since $c \in X$ , c minimizes $f$ on X as well.

1.b.2) $a \neq 0$ . In this case (4.1.12) reads

$$
a^{T}(x - c) > 0 \Rightarrow f(x) > f(c),
$$

so that replacing the ellipsoid E with the half-ellipsoid

$$
\widehat{E} = \{x \in E \mid a^{T} x \leq a^{T} c\}
$$

we ensure the inclusion $X_{*} ~ \subset ~{\widehat{E}}$ . Indeed, $X_{*} ~ \subset ~ E$ by assumption, and when passing from $E$ to ${\widehat{E}}_{:}$ we cut of all points of E where $a^{T} x > a^{T} c$ and, consequently, where $f(x) > f(c)$ ; since $c \in X$ , no one of these points can belong to the set $X_{*}$ of minimizers of $f$ on X.

2) We have seen that as a result of operations described in 1.a-b) we either terminate with an exact minimizer of $f$ on $X,$ , or obtain a “half-ellipsoid”

$$
\widehat{E} = \{x \in E \mid a^{T} x \leq a^{T} c\}\tag{\([a \neq 0]\}
$$

containing $X_{*}$ . It remains to use the following simple geometric fact:

(\*) Let $E = \{x = c + Bu \mid u^{T} u \leq 1\}$ (Det $B \neq 0)$ be an n-dimensional ellipsoid and ${\widehat{E}} \ = \ \{x \in E \mid a^{T} x \leq a^{T} c\} \(a \neq 0)$ be a $\mathbf{\ddot{\Pi}} h \mathbf{a} lf^{\prime \prime}$ of $E.$ $Hn > 1$ , then $\widehat{E}$ is contained in the ellipsoid

$$
\begin{array}{c} E^{+} = \{x = c^{+} + B^{+} u \mid u^{T} u \leq 1\}, \\ c^{+} = c - \frac{1}{n + 1} Bp, \\ B^{+} = B \left(\frac{n}{\sqrt{n^{2} - 1}}(I_{n} - pp^{T}) + \frac{n}{n + 1} pp^{T}\right) = \frac{n}{\sqrt{n^{2} - 1}} B + \left(\frac{n}{n + 1} - \frac{n}{\sqrt{n^{2} - 1}}\right)(Bp) p^{T}, \\ p = \frac{B^{T} a}{\sqrt{a^{T} BB^{T} a}} \end{array}\tag{4.1.15}
$$

and $ifn = 1$ , then the set E is contained in the ellipsoid (which now is just a segment) $\widehat{E}$

$$
\begin{array}{c} E^{+} = \{x \mid c^{+} B^{+} u \mid | u | \leq 1\}, \\ c^{+} = c - \frac{1}{2} \frac{Ba}{| Ba |}, \\ B_{+} = \frac{1}{2} B.\end{array}
$$

In all cases, the n-dimensional volume $\mathrm{Vol}(E^{+})$ of the ellipsoid $E^{+}$ is less than the one of $E$ :

$$
\operatorname{Vol}(E^{+}) = \left(\frac{n}{\sqrt{n^{2} - 1}}\right)^{n - 1} \frac{n}{n + 1} \operatorname{Vol}(E) \leq \exp \{- 1 /(2n)\} \operatorname{Vol}(E)\tag{4.1.16}
$$

$$
(inthecaseofn = 1, \left(\frac{n}{\sqrt{n^{2} - 1}}\right)^{n - 1} = 1).
$$

(\*) says that there exists (and can be explicitly specified) an ellipsoid $E^{+} \supset \widehat{E}$ with the volume constant times less than the one of E. Since $E^{+}$ covers ${\widehat{E}},$ and the latter set, as we have seen, covers $X_{*}, \E^{+}$ covers $X_{*}$ . Now we can iterate the above construction, thus obtaining a sequence of ellipsoids $E, E^{+},(E^{+})^{+}, \ldots$ . with volumes going to 0 at a linear rate (depending on the dimension n only) which “collapses” to the set $X_{*}$ of optimal solutions of our problem – exactly as in the usual bisection!

Note that $(^{*})$ is just an exercise in elementary calculus. Indeed, the ellipsoid E is given as an image of the unit Euclidean ball $W = \{\stackrel{\cdot}{u} \mid u^{T} u \leq 1\}$ under the one-to-one Affine mapping $u \mapsto c + Bu;$ the half-ellipsoid $\widehat{E}$ is then the image, under the same mapping, of the half-ball

$$
\widehat{W} = \{u \in W | p^{T} u \leq 0\}
$$

p being the unit vector from (4.1.15); indeed, if $x = c + Bu$ , then $a^{T} x \leq a^{T} c$ if and only if $a^{T} Bu \leq 0.$ , or, which is the same, if and only if $p^{T} u \leq 0$ . Now, instead of covering $\widehat{E}$ by a small in volume ellipsoid $E^{+}$ , we may cover by a small ellipsoid $W^{+}$ the half-ball $\widehat{W}$ and then take $E^{+}$ to be the image of $W^{+}$ under our Affine mapping:

$$
E^{+} = \{x = c + Bu \mid u \in W^{+}\}.\tag{4.1.17}
$$

Indeed, if $W^{+}$ contains $\widehat{W}$ , then the image of $W^{+}$ under our Affine mapping $u \mapsto c + Bu$ contains the image of $\widehat{W}, \mathrm{i.e.}$ ., contains $\widetilde{E}.$ . And since the ratio of volumes of two bodies remain invariant under Affine mapping (passing from a body to its image under an Affine mapping u $\mapsto c + Bu$ , we just multiply the volume by $| \mathrm{Det} B |)$ , we have

$$
\frac{\operatorname{Vol}(E^{+})}{\operatorname{Vol}(E)} = \frac{\operatorname{Vol}(W^{+})}{\operatorname{Vol}(W)}.
$$

![Figure 4.1](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/d0756c1a96286817f35fba88edd666525bfb6318a561cbe231f7f7ba53f2d987.jpg)  
Figure 4.1: Finding minimum volume ellipsoid containing half-ellipsoid

Thus, the problem of finding a “small” ellipsoid $E^{+}$ containing the half-ellipsoid $\widehat{E}$ can be reduced to the one of finding a “small” ellipsoid $W^{+}$ containing the half-ball ${\widehat{W}}_{:}$ as shown on Fig. 4.1. Now, the problem of finding a small ellipsoid containing $\widehat{W}$ is very simple: our “geometric data” are invariant with respect to rotations around the $p{\mathrm{- axis}},$ so that we may look for $W^{+}$ possessing the same rotational symmetry. Such an ellipsoid $W^{+}$ is given by just 3 parameters: its center should belong to our symmetry axis, $\mathrm{i.e.,}$ should be $- hp$ for certain $h,$ one of the half-axes of the ellipsoid (let its length be $\mu)$ should be directed along $p,$ and the remaining $n - 1$ half-axes should be of the same length $\lambda$ and be orthogonal to $p.$ For our 3 parameters $h, \mu, \lambda$ we have $2$ equations expressing the fact that the boundary of $W^{+}$ should pass through the “South $\mathrm{pole}^{\prime \prime} - p$ of $W$ and trough the “equator” $\{u \ | \u^{T} \dot{u} = 1, p^{T} u = 0\}$ ; indeed, $W^{+}$ should contain $\widehat{W}$ and thus – both the pole and the equator, and since we are looking for $W^{+}$ with the smallest possible volume, both the pole and the equator should be on the boundary of $W^{+}$ . Using our 2 equations to express $\mu$ and $\lambda$ via $h$ , we end up with a single $\mathrm{\cdots} \mathrm{free}^{\mathrm{\prime \mathrm{\prime}}}$ parameter $h,$ and the volume of $W^{+} ~(\mathrm{i.e., ~ const}(n) \mu \lambda^{n - 1})$ becomes an explicit function of $h;$ minimizing this function in $h,$ we find the $\mathrm{\hbar^{6} optimal^{5}}$ ellipsoid $W^{+}$ check that it indeed contains ${\widehat{W}} ~({\mathrm{i.e.}}$ , that our geometric intuition was correct) and then convert $W^{+}$ into $E^{+}$ according to (4.1.17), thus coming to the explicit formulas (4.1.15) – (4.1.16); implementation of the outlined scheme takes from 10 to 30 minutes, depending on how many miscalculations are made...

It should be mentioned that although the indicated scheme is quite straightforward and elementary, the fact that it works is not evident a priori: it might happen that the smallest volume ellipsoid containing a half-ball is just the original ball! This would be the death of our idea – instead of a sequence of ellipsoids collapsing to the solution set $X_{*}$ , we would get a “stationary” sequence $E, E, E.$ .. Fortunately, it is not happening, and this is a great favour Nature does to Convex Optimization...

Ellipsoid method: the construction. There is a small problem with implementing our idea of “trapping” the optimal set $X_{*}$ of (4.1.10) by a “collapsing” sequence of ellipsoids. The only thing we can ensure is that all our ellipsoids contain $X_{*}$ and that their volumes rapidly (at a linear rate) converge to 0. However, the linear sizes of the ellipsoids should not necessarily go to 0 – it may happen that the ellipsoids are shrinking in some directions and are not shrinking (or even become larger) in other directions (look what happens $\mathrm{if}$ we apply the construction to minimizing a function of 2 variables which in fact depends only on the first coordinate). Thus, to the moment it is unclear how to build a sequence of points converging to $X_{*}$ . This dificulty, however, can be easily resolved: as we shall see, we can form this sequence from the best feasible solutions generated so far. Another issue which remains open to the moment is when to terminate the method; as we shall see in a while, this issue also can be settled satisfactory.

The precise description of the Ellipsoid method as applied to (4.1.10) is as follows (in this description, we assume that $n \geq 2$ , which of course does not restrict generality):

## The Ellipsoid Method.

Initialization. Recall that when formulating (4.1.10) it was assumed that the feasible set X of the problem is contained in the ball $E_{0} = \{x \mid \| x \|_{2} \leq R\}$ of a given radius R and contains an (unknown) Euclidean ball of a known radius $r > 0$ . The ball $E_{0}$ will be our initial ellipsoid; thus, we set

$$
c_{0} = 0, B_{0} = RI, E_{0} = \{x = c_{0} + B_{0} u | u^{T} u \leq 1\};
$$

note that $E_{0} \supset X$

We also set

$$
\rho_{0} = R, L_{0} = 0.
$$

The quantities $\rho_{t}$ will be the “radii” of the ellipsoids $E_{t}$ to be built, i.e., the radii of the Euclidean balls of the same volumes as $E_{t}{'} s$ . The quantities $L_{t}$ will be our guesses for the variation

$$
\operatorname{Var}_{R}(f) = \max_{x \in E_{0}} f(x) - \min_{x \in E_{0}} f(x)
$$

of the objective on the initial ellipsoid $E_{0}$ . We shall use these guesses in the termination test.

Finally, we input the accuracy $\epsilon > 0$ to which we want to solve the problem. Step $t, t = 1, 2, \ldots \mathrm{At}$ the beginning of step t, we have the previous ellipsoid

$$
E_{t - 1} = \{x = c_{t - 1} + B_{t - 1} u \mid u^{T} u \leq 1\} \quad[c_{t - 1} \in \mathbb{R}^{n}, B_{t - 1} \in \mathbf{M}^{n, n}, \mathrm{Det} B_{t - 1} \neq 0]
$$

(i.e., have $c_{t - 1}, B_{t - 1})$ along with the quantities $L_{t - 1} \geq 0$ and

$$
\rho_{t - 1} = | \mathrm{Det} B_{t - 1} |^{1 / n}.
$$

At step t, we act as follows (cf. the preliminary description of the method):

1) We call the separation oracle $\operatorname{Sep}(X), c_{t - 1}$ being the input. It is possible that the oracle reports that $c_{t - 1} \notin X$ and provides us with a separator

$$
a \neq 0: \quad a^{T} c_{t - 1} \geq \sup_{y \in X} a^{T} y.
$$

In this case we call step t non-productive, set

$$
a_{t} = a, L_{t} = L_{t - 1}
$$

and go to rule 3) below. Otherwise – i.e., when $c_{t - 1} \in X \mathrm{~ - ~}$ we call step t productive and go to rule 2).

2) We call the first order oracle $\mathcal{O}(f), c_{t - 1}$ being the input, and get the value $f(c_{t - 1})$ and a subgradient $a \equiv f^{\prime}(c_{t - 1})$ of $f$ at the point $c_{t - 1}$ . It is possible that $a = 0;$ in this case we terminate and claim that $c_{t - 1}$ is an optimal solution to (4.1.10). In the case of $a \neq 0$ we set

$$
a_{t} = a,
$$

compute the quantity

$$
\ell_{t} = \max_{y \in E_{0}}[a_{t}^{T} y - a_{t}^{T} c_{t - 1}] = R \| a_{t} \|_{2} - a_{t}^{T} c_{t - 1},
$$

update L by setting

$$
L_{t} = \max \{L_{t - 1}, \ell_{t}\}
$$

and $_\mathrm{go}$ to rule 3).

3) We set

$$
\hat{E}_{t} = \{x \in E_{t - 1} | a_{t}^{T} x \leq a_{t}^{T} c_{t - 1}\}
$$

(cf. the definition of $\widehat{E}$ in our preliminary description of the method) and define the new ellipsoid

$$
E_{t} = \{x = c_{t} + B_{t} u | u^{T} u \leq 1\}
$$

by setting (see (4.1.15))

$$
\begin{array}{rcl}{p_{t}} & = &{\frac{B_{t - 1}^{T} a_{t}}{\sqrt{a_{t}^{T} B_{t - 1} B_{t - 1}^{T} a_{t}}}} \\{c_{t}} & = &{c_{t - 1} - \frac{1}{n + 1} B_{t - 1} p_{t},} \\{B_{t}} & = &{\frac{n}{\sqrt{n^{2} - 1}} B_{t - 1} + \left(\frac{n}{n + 1} - \frac{n}{\sqrt{n^{2} - 1}}\right)(B_{t - 1} p_{t}) p_{t}^{T}.} \end{array}\tag{4.1.18}
$$

We also set

$$
\rho_{t} = | \mathrm{Det} B_{t} |^{1 / n} = \left(\frac{n}{\sqrt{n^{2} - 1}}\right)^{(n - 1) / n} \left(\frac{n}{n + 1}\right)^{1 / n} \rho_{t - 1}
$$

(see (4.1.16)) and go to rule 4).

4) [Termination test]. We check whether the inequality

$$
\frac{\rho_{t}}{r} < \frac{\epsilon}{L_{t} + \epsilon}\tag{4.1.19}
$$

is satisfied. If it is the case, we terminate and output, as the result of the solution process, the best (i.e., with the smallest value of $f)$ of the “search points” $c_{\tau - 1}$ associated with productive steps $\tau \leq t$ (we shall see that these productive steps indeed exist, so that the result of the solution process is well-defined). If (4.1.19) is not satisfied, we go to step $t + 1$

Just to get some feeling how the method works, here is a 2D illustration. The problem is

$$
\begin{array}{rcl} & & \min_{- 1 \leq x_{1}, x_{2} \leq 1} f(x), \\ f(x) & = & \frac{1}{2}(1.443508244x_{1} + 0.623233851x_{2} - 7.957418455)^{2} \\ & & + 5(- 0.350974738x_{1} + 0.799048618x_{2} + 2.877831823)^{4}, \end{array}
$$

the optimal solution is $x_{1}^{*} = 1, x_{2}^{*} = - 1$ , and the exact optimal value is 70.030152768...

The values of $f$ at the best $(\mathrm{i.e.}$ , with the smallest value of the objective) feasible solutions found in course of first t steps of the method, $t = 1, 2,..., 256$ , are shown in the following table:

Ellipses $E_{t - 1}$ and search points $c_{t - 1}, t = 1, 2, 3, 4, 16$ Arrows: gradients of the objective f(x) Unmarked segments: tangents to the level lines of $f(x)$  
![Figure 4.2](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/383fbf6e078be3a7256feba9d7286c55cd72654437627e64fb6a8b55da20fb94.jpg)

Figure 4.2: Trajectory of Ellipsoid method

<table><tr><td>t</td><td>best value</td><td>t</td><td>best value</td></tr><tr><td>1</td><td>374.61091739</td><td>16</td><td>76.838253451</td></tr><tr><td>2</td><td>216.53084103</td><td>...</td><td>...</td></tr><tr><td>3</td><td>146.74723394</td><td>32</td><td>70.901344815</td></tr><tr><td>4</td><td>112.42945457</td><td>...</td><td>...</td></tr><tr><td>5</td><td>93.84206347</td><td>64</td><td>70.031633483</td></tr><tr><td>6</td><td>82.90928589</td><td>...</td><td>...</td></tr><tr><td>7</td><td>82.90928589</td><td>128</td><td>70.030154192</td></tr><tr><td>8</td><td>82.90928589</td><td>...</td><td>...</td></tr><tr><td>...</td><td>...</td><td>256</td><td>70.030152768</td></tr></table>

The initial phase of the process looks as shown on Fig. 4.2.

Ellipsoid method: complexity analysis. We are about to establish our key result (which, in particular, immediately implies Theorem 4.1.2):

Theorem 4.1.3 Let the Ellipsoid method be applied to convex program (4.1.10) of dimension $n \geq 2$ such that the feasible set X of the problem contains a Euclidean ball of a given radius $r > 0$ and is contained in the ball $E_{0} = \{\| x \|_{2} \leq R\}$ of a given radius R. For every input accuracy $\epsilon > 0$ , the Ellipsoid method terminates after no more than

$$
N(\epsilon) = \operatorname{Ceil} \left(2n^{2} \left[\ln \left(\frac{R}{r}\right) + \ln \left(\frac{\epsilon + \operatorname{Var}_{R}(f)}{\epsilon}\right) \right]\right) + 1\tag{4.1.20}
$$

steps, where

$$
\operatorname{Var}_{R}(f) = \max_{E_{0}} f - \min_{E_{0}} f,
$$

and $\operatorname{Ceil}(a)$ is the smallest integer $\geq a$ . Moreover, the result x generated by the method is a feasible $\epsilon$-solution to (4.1.10):

$$
\widehat{x} \in Xandf(x) - \min_{X} f \leq \epsilon.\tag{4.1.21}
$$

Proof. We should prove the following pair of statements:

(i) The method terminates in course of the first $N(\epsilon)$ steps

(ii) The result $\widehat{x}$ is a feasible $\epsilon$-solution to the problem.

1<sup>0</sup>. Comparing the preliminary and the final description of the Ellipsoid method and taking into account the initialization rule, we see that if the method does not terminate before step t or terminates at this step according to rule 4), then

(a)

$$
\begin{array}{rcl} E_{0} & \supset & X; \\ E_{\tau} & \supset & \widehat{E}_{\tau} = \left\{x \in E_{\tau - 1} \mid a_{\tau}^{T} x \leq a_{\tau}^{T} c_{\tau - 1} \right\}, \tau = 1,..., t; \end{array}\tag{b}
$$

(c)

$$
\begin{array}{rcl} \mathrm{Vol}(E_{\tau}) & = & \rho_{\tau}^{n} \mathrm{Vol}(E_{0}) = \left(\frac{n}{\sqrt{n^{2} - 1}}\right)^{n - 1} \frac{n}{n + 1} \mathrm{Vol}(E_{\tau - 1}) \\ & \leq & \exp \{- 1 /(2n)\} \mathrm{vol}(E_{\tau - 1}), \tau = 1, \dots, t.\end{array}\tag{4.1.22}
$$

Note that from (c) it follows that

$$
\rho_{\tau} \leq \exp \{- \tau /(2n^{2})\} R, \tau = 1, \dots, t.\tag{4.1.23}
$$

$2^{0}$ . We claim that

If the Ellipsoids method terminates at certain step t, then the result $\widehat{x}$ is welldefined and is a feasible $\epsilon$-solution to (4.1.10).

Indeed, there are only two possible reasons for termination. First, it may happen that $c_{t - 1} \in X$ and $f^{\prime}(c_{t - 1}) = 0 ~(\mathrm{see ~ rule ~ 2}))$ ). From our preliminary considerations we know that in this case $c_{t - 1}$ is an optimal solution to (4.1.10), which is even more than what we have claimed. Second, it may happen that at step t relation (4.1.19) is satisfied. Let us prove that the claim of $2^{0}$ takes place in this case as well.

$2^{0}{\cdot} a)$ Let us set

$$
\nu = \frac{\epsilon}{\epsilon + L_{t}} \in(0, 1].
$$

By (4.1.19), we have $\rho_{t} / r < \nu,$ so that there exists $\nu^{\prime}$ such that

$$
\frac{\rho_{t}}{r} < \nu^{\prime} < \nu[\leq 1].\tag{4.1.24}
$$

Let $x_{*}$ be an optimal solution to (4.1.10), and $X^{+}$ be the $^{66} \nu^{\prime}.$ -shrinkage” of $X$ to $x_{*}$ :

$$
X^{+} = x_{*} + \nu^{\prime}(X - x_{*}) = \{x =(1 - \nu^{\prime}) x_{*} + \nu^{\prime} z \mid z \in X\}.\tag{4.1.25}
$$

We have

$$
\operatorname{Vol} \left(X^{+}\right) = \left(\nu^{\prime}\right)^{n} \operatorname{Vol}(X) \geq \left(\frac{r \nu^{\prime}}{R}\right)^{n} \operatorname{Vol} \left(E_{0}\right)\tag{4.1.26}
$$

(the last inequality is given by the fact that X contains a Euclidean ball of the radius $r)$ , while

$$
\operatorname{Vol}(E_{t}) = \left(\frac{\rho_{t}}{R}\right)^{n} \operatorname{Vol}(E_{0})\tag{4.1.27}
$$

by definition of $\rho_{t}$ . Comparing (4.1.26), (4.1.27) and taking into account that $\rho_{t} ~ < ~ r \nu^{\prime}$ by (4.1.24), we conclude that Vol $(E_{t}) < \mathrm{Vol}(X^{+})$ and, consequently, $X^{+}$ cannot be contained in $E_{t}$ . Thus, there exists a point y which belongs to $X^{+}$

$$
y =(1 - \nu^{\prime}) x_{*} + \nu^{\prime} z \qquad[z \in X],\tag{4.1.28}
$$

and does not belong to $E_{t}$

$2^{0}.b)$ Since y does not belong to $E_{t}$ and at the same time belongs to $X \subset E_{0}$ along with $x_{*}$ and $z ~ \left(X \right)$ is convex!), we see that there exists a $\tau \leq t$ such that $y \in E_{\tau - 1}$ and $y \notin E_{\tau}$ . By (4.1.22.b), every point x from the complement of $E_{\tau}$ in $E_{\tau - 1}$ satisfies the relation $a_{\tau}^{T} x > a_{\tau}^{T} c_{\tau - 1}$ Thus, we have

$$
a_{\tau}^{T} y > a_{\tau}^{T} c_{\tau - 1}\tag{4.1.29}
$$

$2^{0}.c)$ Observe that the step $\tau$ is surely productive. Indeed, otherwise, by construction of the method, $a_{t}$ would separate $X$ from $c_{\tau - 1}$ , and (4.1.29) would be impossible (we know that $y \in X \ !)$ . Notice that in particular we have just proved that if the method terminates at a step $t,$ then at least one of the steps $1,..., t$ is productive, so that the result is well-defined.

Since step $\tau$ is productive, $a_{\tau}$ is a subgradient of $f$ at $c_{\tau - 1}$ (description of the method!), so that

$$
f(u) \geq f(c_{\tau - 1}) + a_{\tau}^{T}(u - c_{\tau - 1})
$$

for all $u \in X$ , and in particular for $u = x_{*}$ . On the other hand, $z \in X \subset E_{0}$ , so that by the definition of $\ell_{\tau}$ and $L_{\tau}$ we have

$$
a_{\tau}^{T}(z - c_{\tau - 1}) \leq \ell_{\tau} \leq L_{\tau}.
$$

Thus,

$$
\begin{array}{l} f(x_{*}) \geq f(c_{\tau - 1}) + a_{\tau}^{T}(x_{*} - c_{\tau - 1}) \\ L_{\tau} \geq a_{\tau}^{T}(z - c_{\tau - 1}) \end{array}
$$

Multiplying the first inequality by $(1 - \nu^{\prime})$ , the second – by $\nu^{\prime}$ and adding the results, we get

$$
\begin{array}{rcl}(1 - \nu^{\prime}) f(x_{*}) + \nu^{\prime} L_{\tau} & \geq &(1 - \nu^{\prime}) f(c_{\tau - 1}) + a_{\tau}^{T}([(1 - \nu^{\prime}) x_{*} + \nu^{\prime} z] - c_{\tau - 1}) \\ & = &(1 - \nu^{\prime}) f(c_{\tau - 1}) + a_{\tau}^{T}(y - c_{\tau - 1}) \\ & &[\text{see (4.1.28)}] \\ & \geq &(1 - \nu^{\prime}) f(c_{\tau - 1}) \\ & &[\text{see (4.1.29)}] \end{array}
$$

and we come to

$$
\begin{array}{rcl} f(c_{\tau - 1}) & \leq & f(x_{*}) + \frac{\nu^{\prime} L_{\tau}}{1 - \nu^{\prime}} \\ & \leq & f(x_{*}) + \frac{\nu^{\prime} L_{t}}{1 - \nu^{\prime}} \\ & &[\text{since} L_{\tau} \leq L_{t} \text{in view of} \tau \leq t] \\ & \leq & f(x_{*}) + \epsilon \\ & &[\text{by definition of} \nu \text{and since} \nu^{\prime} < \nu] \\ & = & \operatorname{Opt}(\mathrm{C}) + \epsilon.\end{array}
$$

We see that there exists a productive $({\boldsymbol{\mathrm{i.e.}}}$ , with feasible $c_{\tau - 1})$ step $\tau \leq t$ such that the corresponding search point $c_{T - 1}$ is $\epsilon$-optimal. Since we are in the situation where the result x is the best of the feasible search points generated in course of the first t steps, $\widehat{x}$ is also feasible and $\epsilon$-optimal, as claimed in $2^{0}$

$3^{0}$ It remains to verify that the method does terminate in course of the first $N = N(\epsilon)$ steps. Assume, on the contra ${\mathrm{^{y}}},$ that it is not the case, and let us lead this assumption to a contradiction.

First, observe that for every productive step t we have

$$
c_{t - 1} \in X \text{and} a_{t} = f^{\prime}(c_{t - 1}),
$$

whence, by the definition of a subgradient and the variation $\operatorname{Var}_{R}(f)$ ，

$$
u \in E_{0} \Rightarrow \operatorname{Var}_{R}(f) \geq f(u) - f(c_{t - 1}) \geq a_{t}^{T}(u - c_{t - 1}),
$$

whence

$$
\ell_{t} \equiv \max_{u \in E_{0}} a_{t}^{T}(u - c_{t - 1}) \leq \operatorname{Var}_{R}(f).
$$

Looking at the description of the method, we conclude that

$$
L_{t} \leq \operatorname{Var}_{R}(f) \quad \forall t.\tag{4.1.30}
$$

Since we have assumed that the method does not terminate in course of the first N steps, we have

$$
\frac{\rho_{N}}{r} \geq \frac{\epsilon}{\epsilon + L_{N}}.\tag{4.1.31}
$$

The right hand side in this inequality is $\ge \epsilon /(\epsilon + \operatorname{Var}_{R}(f))$ by (4.1.30), while the left hand side is $\leq \exp \{- N /(2n^{2})\} R$ by (4.1.23). We get

$$
\exp \{- N /(2n^{2})\} R / r \geq \frac{\epsilon}{\epsilon + \operatorname{Var}_{R}(f)} \Rightarrow N \leq 2n^{2} \left[\ln \left(\frac{R}{r}\right) + \ln \left(\frac{\epsilon + \operatorname{Var}_{R}(f)}{\epsilon}\right) \right],
$$

which is the desired contradiction (see the definition of $N = N(\epsilon)$ in (4.1.20)).

## 4.1.4 Dificult continuous optimization problems

Real Arithmetic Complexity Theory can borrow from the Combinatorial Complexity Theory techniques for detecting “computationally intractable” problems. Consider the situation as follows: we are given a family $\mathcal{P}$ of optimization programs and want to understand whether the family is computationally tractable. An afirmative answer can be obtained from Theorem 4.1.1; but how could we justify that the family is intractable? A natural course of action here is to demonstrate that certain dificult (NP-complete) combinatorial problem $\mathcal{Q}$ can be reduced to $\mathcal{P}$ in such a way that the possibility to solve $\mathcal{P}$ in polynomial time would imply similar possibility for $\mathcal{Q}.$ Assume that the objectives of the instances of $\mathcal{P}$ are polynomially computable, and that we can point out a generic combinatorial problem $\mathcal{Q}$ known to be NP-complete which can be reduced to $\mathcal{P}$ in the following sense:

There exists a CT-polynomial time algorithm M which, given on input the data vector $\operatorname{Data}(q)$ of an instance $(q) \in \mathcal{Q}$ , converts it into a triple $\mathrm{Data}(p[q]), \epsilon(q), \mu(q)$ comprised of the data vector of an instance $(p[q]) \in \mathcal{P}$ , positive rational $\epsilon(q)$ and rational $\mu(q)$ such that $(p[q])$ is solvable and

$- if \left(q \right)$ is unsolvable, then the value of the objective of $(p[q])$ at every $\epsilon(q)$ -solution to this problem is $\leq \mu(q) - \epsilon(q)$ ;

$- if \left(q \right)$ is solvable, then the value of the objective of $(p[q])$ at every $\epsilon(q)$ -solution to this problem is $\geq \mu(q) + \epsilon(q)$

We claim that in the case in question we have all reasons to qualify $\mathcal{P}$ as a “computationally intractable” problem. Assume, on contrary, that $\mathcal{P}$ admits a polynomial time solution method $s,$ and let us look what happens if we apply this algorithm to solve $(p[q])$ within accuracy $\epsilon(q)$ Since $(p[q])$ is solvable, the method must produce an $\epsilon(q)$ -solution $\widehat{x}$ to $(p[q])$ . With additional “polynomial time efort” we may compute the value of the objective of $(p[q])$ at x (recall that the objectives of instances from $\mathcal{P}$ are assumed to be polynomially computable). Now we can compare the resulting value of the objective with $\mu(q)$ ; by definition of reducibility, if this value is $\leq \mu(q)$ , q is unsolvable, otherwise $q$ is solvable. Thus, we get a correct “Real Arithmetic” solvability test for Q. By definition of a Real Arithmetic polynomial time algorithm, the running time of the test is bounded by a polynomial of $s(q) = \mathrm{Size}(p[q])$ and of the quantity

$$
d(q) = \operatorname{Digits}((p[q]), \epsilon(q)) = \ln \left(\frac{\operatorname{Size}(p[q]) + \| \operatorname{Data}(p[q]) \|_{1} + \epsilon^{2}(q)}{\epsilon(q)}\right).
$$

Now note that if $\ell = \mathrm{length}(\operatorname{Data}(q))$ , then the total number of bits in $\mathrm{Data}(p[q])$ and in $\epsilon(q)$ is bounded by a polynomial of \` (since the transformation Data $(q) \mapsto(\operatorname{Data}(p[q]), \epsilon(q), \mu(q))$ takes CT-polynomial time). It follows that both $s(q)$ and $d(q)$ are bounded by polynomials in $\ell,$ so that our “Real Arithmetic” solvability test for Q takes polynomial in length(Data(q)) number of arithmetic operations.

Recall that $\mathcal{Q}$ was assumed to be an NP-complete generic problem, so that it would be “highly improbable” to find a polynomial time solvability test for this problem, while we have managed to build such a test. We conclude that the polynomial solvability of $\mathcal{P}$ is highly improbable as well.

## 4.2 Interior Point Polynomial Time Methods for LP, CQP and SDP

## 4.2.1 Motivation

Theorem 4.1.1 states that generic convex programs, under mild computability and boundedness assumptions, are polynomially solvable. This result is extremely important theoretically; however, from the practical viewpoint it is, essentially, no more than “an existence theorem”. Indeed, the “universal” complexity bounds coming from Theorem 4.1.2, although polynomial, are not that attractive: by Theorem 4.1.1, when solving problem (4.1.10) with n design variables, the “price” of an accuracy digit (what it costs to reduce current inaccuracy $\epsilon$ by factor 2) is $O(n^{2})$ calls to the first order and the separation oracles plus $O(n^{4})$ arithmetic operations to process the answers of the oracles. Thus, even for simplest objectives to be minimized over simplest feasible sets, the arithmetic price of an accuracy digit is $O(n^{4})$ ; think how long will it take to solve a problem with, say, 1,000 variables (which is still a “small” size for many applications). The good news about the methods underlying Theorem 4.1.2 is their universality: all they need is a Separation oracle for the feasible set and the possibility to compute the objective and its subgradient at a given point, which is not that much. The bad news about these methods has the same source as the good news: the methods are “oracle-oriented” and capable to use only local information on the program they are solving, in contrast to the fact that when solving instances of well-structured programs, like $\mathrm{LP},$ we from the very beginning have in our disposal complete global description of the instance. And of course it is ridiculous to use a complete global knowledge of the instance just to mimic the local in their nature first order and separation oracles. What we would like to have is an optimization technique capable to “utilize eficiently” our global knowledge of the instance and thus allowing to get a solution much faster than it is possible for “nearly blind” oracle-oriented algorithms. The major event in the “recent history” of Convex Optimization, called sometimes “Interior Point revolution”, was the invention of these “smart” techniques.

## 4.2.2 Interior Point methods

The Interior Point revolution was started by the seminal work of N. Karmarkar (1984) where the first interior point method for LP was proposed; in 18 years since then, interior point (IP) polynomial time methods have become an extremely deep and rich theoretically and highly promising computationally area of Convex Optimization. A somehow detailed overview of the history and the recent state of this area is beyond the scope of this course; an interested reader is referred to [52, 55, 42] and references therein. All we intend to do is to give an idea of what are the IP methods, skipping nearly all (sometimes highly instructive and nontrivial) technicalities.

The simplest way to get a proper impression of the (most of) IP methods is to start with a quite traditional interior penalty scheme for solving optimization problems.

## 4.2.2.1 The Newton method and the Interior penalty scheme

Unconstrained minimization and the Newton method. Seemingly the simplest convex optimization problem is the one of unconstrained minimization of a smooth strongly convex objective:

$$
\min_{x} \left\{f(x): x \in \mathbb{R}^{n} \right\};\tag{UC}
$$

a “smooth strongly convex” in this context means a 3 times continuously diferentiable convex function f such that $f(x) \infty, \| x \|_{2} \infty$ , and such that the Hessian matrix $\begin{array}{r}{f^{\prime \prime}(x) = \left\lceil \frac{\partial^{2} f(x)}{\partial{x_{i}} \partial{x_{j}}} \right\rceil} \end{array}$ of f is positive definite at every point x. Among numerous techniques for solving (UC), the most remarkable one is the Newton method. In its pure form, the Newton method is extremely transparent and natural: given a current iterate $x,$ we approximate our objective f by its second-order Taylor expansion at the iterate – by the quadratic function

$$
f_{x}(y) = f(x) +(y - x)^{T} f^{\prime}(x) + \frac{1}{2}(y - x)^{T} f^{\prime \prime}(x)(y - x)
$$

– and choose as the next iterate $x_{+}$ the minimizer of this quadratic approximation. Thus, the Newton method merely iterates the updating

$$
x \mapsto x_{+} = x -[f^{\prime \prime}(x)]^{- 1} f^{\prime}(x).\tag{Nwt}
$$

In the case of a (strongly convex) quadratic objective, the approximation coincides with the objective itself, so that the method reaches the exact solution in one step. It is natural to guess (and indeed is true) that in the case when the objective is smooth and strongly convex (although not necessary quadratic) and the current iterate x is close enough to the minimizer $x_{*}$ of $f,$ , the next iterate $x_{+}$ , although not being x<sub>∗</sub> exactly, will be “much closer” to the exact minimizer than x. The precise (and easy) result is that the Newton method converges locally quadratically, i.e., that

$$
\| x_{+} - x_{*} \|_{2} \leq C \| x - x_{*} \|_{2}^{2},
$$

provided that $\| x - x_{*} \|_{2} \leq r$ with small enough value of $r > 0$ (both this value and C depend on $f)$ . Quadratic convergence means essentially that eventually every new step of the process increases by a constant factor the number of accuracy digits in the approximate solution.

When started not “close enough” to the minimizer, the “pure” Newton method (Nwt) can demonstrate weird behaviour (look, $\mathrm{e.g.}$ , what happens when the method is applied to the univariate function $f(x) ={\sqrt{1 + x^{2}}})$ . The simplest way to overcome this drawback is to pass from the pure Newton method to its damped version

$$
x \mapsto x_{+} = x - \gamma(x)[f^{\prime \prime}(x)]^{- 1} f^{\prime}(x),\tag{NwtD}
$$

where the stepsize $\gamma(\boldsymbol{x}) > 0$ is chosen in a way which, on one hand, ensures global convergence of the method and, on the other hand, enforces $\gamma(\boldsymbol{x}) 1$ as $x \to x_{*}$ , thus ensuring fast (essentially the same as for the pure Newton method) asymptotic convergence of the $\mathrm{process^{2}})$

Practitioners thought the (properly modified) Newton method to be the fastest, in terms of the iteration count, routine for smooth (not necessarily convex) unconstrained minimization, although sometimes “too heavy” for practical use: the practical drawbacks of the method are both the necessity to invert the Hessian matrix at each step, which is computationally costly in the large-scale case, and especially the necessity to compute this matrix (think how dificult it is to write a code computing 5,050 second order derivatives of a messy function of 100 variables).

Classical interior penalty scheme: the construction. Now consider a constrained convex optimization program. As we remember, one can w.l.o.g. make its objective linear, moving, if necessary, the actual objective to the list of constraints. Thus, let the problem be

$$
\min_{x} \left\{c^{T} x: x \in \mathcal{X} \subset \mathbb{R}^{n} \right\},\tag{C}
$$

where X is a closed convex set, which we assume to possess a nonempty interior. How could we solve the problem?

Traditionally it was thought that the problems of smooth convex unconstrained minimization are “easy”; thus, a quite natural desire was to reduce the constrained problem (C) to a series of smooth unconstrained optimization programs. To this end, let us choose somehow a barrier (another name – “an interior penalty function”) $F(x)$ for the feasible set $\mathcal{X} - a$ function which is well-defined (and is smooth and strongly convex) on the interior of X and “blows up” as a point from int X approaches a boundary point of X :

$$
x_{i} \in \mathrm{int} \mathcal{X}, x \equiv \lim_{i \to \infty} x_{i} \in \partial \mathcal{X} \Rightarrow F(x_{i}) \to \infty, i \to \infty,
$$

and let us look at the one-parametric family of functions generated by our objective and the barrier:

$$
F_{t}(x) = tc^{T} x + F(x): \mathrm{int} \mathcal{X} \to \mathbb{R}.
$$

Here the penalty parameter t is assumed to be nonnegative.

It is easily seen that under mild regularity assumptions $\left(\mathrm{e.g.} \right.$ , in the case of bounded $\mathcal{X}_{:}$ which we assume from now on)

$$
\gamma(x) = \underset{t}{\operatorname{argmin}} f(x + te(x)).
$$

- Every function $F_{t}(\cdot)$ attains its minimum over the interior of $x,$ the minimizer $x_{*}(t)$ being unique;

- The central path $x_{*}(t)$ is a smooth curve, and all its limiting, $t \to \infty$ , points belong to the set of optimal solutions of (C).

This fact is quite clear intuitively. To minimize $F_{t}(\cdot)$ for large t is the same as to minimize the function $f_{\rho}(x) = c^{T} x + \rho F(x)$ for small $\textstyle \rho ={\frac{1}{t}}$ . When $\rho$ is small, the function $f_{\rho}$ is very close to $c^{T} x$ everywhere in $x,$ , except a narrow stripe along the boundary of $\mathcal{X}.$ , the stripe becoming thinner and thinner as $\rho \to 0.$ . Therefore we have all reasons to believe that the minimizer of $F_{t}$ for large t $({\mathrm{i.e.}}$ , the minimizer of $f_{\rho}$ for small $\rho)$ must be close to the set of minimizers of $c^{T} x$ on $\mathcal{X}.$

We see that the central path $x_{*}(t)$ is a kind of Ariadne’s thread which leads to the solution set of (C). On the other hand, to reach, given a value $t \geq 0$ of the penalty parameter, the point $x_{*}(t)$ on this path is the same as to minimize a smooth strongly convex function $F_{t}(\cdot)$ which attains its minimum at an interior point of $\mathcal{X}.$ The latter problem is “nearly unconstrained $\mathrm{one}^{\mathfrak{P}}$ , up to the fact that its objective is not everywhere defined. However, we can easily adapt the methods of unconstrained minimization, including the Newton one, to handle “nearly unconstrained” problems. We see that constrained convex optimization in a sense can be reduced to the “easy” unconstrained one. The conceptually simplest way to make use of this observation would be to choose a “very large” value t<sup>¯</sup> of the penalty parameter, like $\bar{t} = 10^{6} ~ \mathrm{or} ~ \bar{t} = 10^{10}$ , and to run an unconstrained minimization routine, say, the Newton method, on the function $F_{\bar{t}}$ , thus getting a good approximate solution to $\mathrm{(C)}$ “in one shot”. This policy, however, is impractical: since we have no idea where $x_{*}(\bar{t})$ is, we normally will start our process of minimizing $F_{\bar{t}}$ very far from the minimizer of this function, and thus for a long time will be unable to exploit fast local convergence of the method for unconstrained minimization we have chosen. A smarter way to use our Ariadne’s thread is exactly the one used by Theseus: to follow the thread. Assume, $\mathrm{e.g.}$ that we know in advance the minimizer of $F_{0} \equiv F$ , i.e., the point $x_{*}(0)^{3)}$ . Thus, we know where the central path starts. Now let us follow this path: at i-th step, standing at a point $x_{i}$ “close enough” to some point $x_{*}(t_{i})$ of the path, we

- first, increase a bit the current value $t_{i}$ of the penalty parameter, thus getting a new “target point” $x_{*}(t_{i + 1})$ on the path, and

- second, approach our new target point $x_{*}(t_{i + 1})$ by running, say, the Newton method, started at our current iterate $x_{i},$ on the function $F_{t_{i + 1}}$ , until a new iterate $x_{i + 1}$ “close enough” to $x_{*}(t_{i + 1})$ is generated.

As a result of such a step, we restore the initial situation – we again stand at a point which is close to a point on the central path, but this latter point has been moved along the central path towards the optimal set of (C). Iterating this updating and strengthening appropriately our “close enough” requirements as the process goes on, we, same as the central path, approach the optimal set. A conceptual advantage of this “path-following” policy as compared to the “brute force” attempt to reach a target point $x_{*}(\bar{t})$ with large t<sup>¯</sup> is that now we have a hope to exploit all the time the strongest feature of our “working horse” (the Newton method) – its fast local convergence. Indeed, assuming that $x_{i}$ is close to $x_{*}(t_{i})$ and that we do not increase the penalty parameter too rapidly, so that $x_{*}(t_{i + 1})$ is close to $x_{*}(t_{i})$ (recall that the central path is smooth!), we conclude that $x_{i}$ is close to our new target point $x_{*}(t_{i + 1})$ . If all our “close enough” and “not too rapidly” are properly controlled, we may ensure $x_{i}$ to be in the domain of the quadratic convergence of the Newton method as applied to $F_{t_{i + 1}}$ , and then it will take a quite small number of steps of the method to recover closeness to our new target point.

Classical interior penalty scheme: the drawbacks. At a qualitative “common sense” level, the interior penalty scheme looks quite attractive and extremely flexible: for the majority of optimization problems treated by the classical optimization, there is a plenty of ways to build a relatively simple barrier meeting all the requirements imposed by the scheme, there is a huge room to play with the policies for increasing the penalty parameter and controlling closeness to the central path, etc. And the theory says that under quite mild and general assumptions on the choice of the numerous “free parameters” of our construction, it still is guaranteed to converge to the optimal set of the problem we have to solve. All looks wonderful, until we realize that the convergence ensured by the theory is completely “unqualified”, it is a purely asymptotical phenomenon: we are promised to reach eventually a solution of a whatever accuracy we wish, but how long it will take for a given accuracy – this is the question the “classical” optimization theory, with its “convergence” – “asymptotic linear/superlinear/quadratic convergence” neither posed nor answered. And since our life in this world is finite (moreover, usually more finite than we would like it to be), “asymptotical promises” are perhaps better than nothing, but definitely are not all we would like to know. What is vitally important for us in theory (and to some extent – also in practice) is the issue of complexity: given an instance of such and such generic optimization problem and a desired accuracy $\epsilon$, how large is the computational efort (# of arithmetic operations) needed to get an $\epsilon$-solution of the instance? And we would like the answer to be a kind of a polynomial time complexity bound, and not a quantity depending on “unobservable and uncontrollable” properties of the instance, like the “level of regularity” of the boundary of X at the (unknown!) optimal solution of the instance.

It turns out that the intuitively nice classical theory we have outlined is unable to say a single word on the complexity issues (it is how it should be: a reasoning in purely qualitative terms like “smooth”, “strongly convex”, etc., definitely cannot yield a quantitative result...) Moreover, from the complexity viewpoint just the very philosophy of the classical convex optimization turns out to be wrong:

- As far as the complexity is concerned, for nearly all “black box represented” classes of unconstrained convex optimization problems (those where all we know is that the objective is called f(x), is (strongly) convex and 2 (3,4,5...) times continuously diferentiable, and can be computed, along with its derivatives up to order ... at every given point), there is no such phenomenon as “local quadratic convergence”, the Newton method (which uses the second derivatives) has no advantages as compared to the methods which use only the first order derivatives, etc.;

- The very idea to reduce “black-box-represented” constrained convex problems to unconstrained ones – from the complexity viewpoint, the unconstrained problems are not easier than the constrained ones...

## 4.2.3 But...

Luckily, the pessimistic analysis of the classical interior penalty scheme is not the “final truth”. It turned out that what prevents this scheme to yield a polynomial time method is not the structure of the scheme, but the huge amount of freedom it allows for its elements (too much freedom is another word for anarchy...). After some order is added, the scheme becomes a polynomial time one! Specifically, it was understood that

1. There is a (completely non-traditional) class of “good” (self-concordant<sup>4)</sup>) barriers. Every barrier F of this type is associated with a “self-concordance parameter” θ(F ), which is a real $\geq 1;$

2. Whenever a barrier F underlying the interior penalty scheme is self-concordant, one can specify the notion of “closeness to the central path” and the policy for updating the penalty parameter in such a way that a single Newton step

$$
x_{i} \mapsto x_{i + 1} = x_{i} -[\nabla^{2} F_{t_{i + 1}}(x_{i})]^{- 1} \nabla F_{t_{i + 1}}(x_{i})\tag{4.2.1}
$$

sufices to update a “close to $x_{*}(t_{i})^{\dag}$ iterate $x_{i}$ into a new iterate $x_{i + 1}$ which is close, in the same sense, to $x_{*}(t_{i + 1})$ . All “close to the central path” points belong to int $\mathcal{X},$ , so that the scheme keeps all the iterates strictly feasible.

3. The penalty updating policy mentioned in the previous item is quite simple:

$$
t_{i} \mapsto t_{i + 1} = \left(1 + \frac{0.1}{\sqrt{\theta(F)}}\right) t_{i};
$$

in particular, it does not “slow down” as $t_{i}$ grows and ensures linear, with the ratio $\begin{array}{r}{\left(1 + \frac{0.1}{\sqrt{\theta(F)}} \right)} \end{array}$ , growth of the penalty. This is vitally important due to the following fact:

4. The inaccuracy of a point x, which is close to some point $x_{*}(t)$ of the central path, as an approximate solution to (C) is inverse proportional to t:

$$
c^{T} x - \min_{y \in \mathcal{X}} c^{T} y \leq \frac{2 \theta(F)}{t}.
$$

It follows that

(!) After we have managed once to get close to the central path – have built a point $x_{0}$ which is close to a point $x(t_{0}), t_{0} > 0$ , on the path, every $O({\sqrt{\theta(F)}})$ steps of the scheme improve the quality of approximate solutions generated by the scheme by an absolute constant factor. In particular, it takes no more than

$$
O(1) \sqrt{\theta(F)} \ln \left(2 + \frac{\theta(F)}{t_{0} \epsilon}\right)
$$

steps to generate a strictly feasible $\epsilon$-solution to (C).

Note that with our simple penalty updating policy all needed to perform a step of the interior penalty scheme is to compute the gradient and the Hessian of the underlying barrier at a single point and to invert the resulting Hessian.

Items 3, 4 say that essentially all we need to derive from the just listed general results a polynomial time method for a generic convex optimization problem is to be able to equip every instance of the problem with a “good” barrier in such a way that both the parameter of self-concordance of the barrier $\theta(F)$ and the arithmetic cost at which we can compute the gradient and the Hessian of this barrier at a given point are polynomial in the size of the instance<sup>5)</sup>. And it turns out that we can meet the latter requirement for all interesting “well-structured” generic convex programs, in particular, for Linear, Conic Quadratic, and Semidefinite Programming. Moreover, “the heroes” of our course – LP, CQP and SDP – are especially nice application fields of the general theory of interior point polynomial time methods; in these particular applications, the theory can be simplified, on one hand, and strengthened, on another.

## 4.3 Interior point methods for LP, CQP, and SDP: building blocks

We are about to explain what the interior point methods for LP, CQP, SDP look like.

## 4.3.1 Canonical cones and canonical barriers

We will be interested in a generic conic problem

$$
\min_{x} \left\{c^{T} x: \mathcal{A} x - B \in \mathbf{K} \right\}\tag{CP}
$$

associated with a cone K given as a direct product of m “basic” cones, each of them being either a second-order, or a semidefinite cone:

$$
\mathbf{K} = \mathbf{S}_{+}^{k_{1}} \times \ldots \times \mathbf{S}_{+}^{k_{p}} \times \mathbf{L}^{k_{p + 1}} \times \ldots \times \mathbf{L}^{k_{m}} \subset E = \mathbf{S}^{k_{1}} \times \ldots \times \mathbf{S}^{k_{p}} \times \mathbb{R}^{k_{p + 1}} \times \ldots \times \mathbb{R}^{k_{m}}.\tag{Cone}
$$

Of course, the generic problem in question covers LP (no Lorentz factors, all semidefinite factors are of dimension 1), CQP (no semidefinite factors) and SDP (no Lorentz factors).

Now, we shall equip the semidefinite and the Lorentz cones with “canonical barriers”:

- The canonical barrier for a semidefinite cone $\mathbf{S}_{+}^{n}$ is

$$
S_{k}(X) = - \ln \mathrm{Det}(X): \mathrm{int} \mathbf{S}_{+}^{k} \to \mathbb{R};
$$

the parameter of this barrier, by definition, is $\theta(S_{k}) = k^{\6)}$

- the canonical barrier for a Lorentz cone $\mathbf{L}^{k} = \{x \in \mathbb{R}^{k} \mid x_{k} \geq \sqrt{x_{1}^{2} +...+ x_{k - 1}^{2}}\}$ is

$$
L_{k}(x) = - \ln(x_{k}^{2} - x_{1}^{2} - \ldots - x_{k - 1}^{2}) = - \ln(x^{T} J_{k} x), \quad J_{k} = \left(\begin{array}{cc} - I_{k - 1} & \\ & 1 \end{array} \right);
$$

the parameter of this barrier is $\theta(L_{k}) = 2$

- The canonical barrier K for the cone K given by (Cone), by definition, is the direct sum of the canonical barriers of the factors:

$$
K(X) = S_{k_{1}}(X_{1}) + \ldots + S_{k_{p}}(X_{p}) + L_{k_{p + 1}}(X_{p + 1}) + \ldots + L_{k_{m}}(X_{m}), \quad X_{i} \in \left\{\begin{array}{ll} \operatorname{int} \mathbf{S}_{+}^{k_{i}}, & i \leq p \\ \operatorname{int} \mathbf{L}^{k_{i}}, & p < i \leq m \end{array}; \right.
$$

from now on, we use upper case Latin letters, like X, Y, Z, to denote elements of the space $E;$ for such an element $X, X_{i}$ denotes the projection of X onto i-th factor in the direct product representation of E as shown in (Cone).

The parameter of the barrier K, again by definition, is the sum of parameters of the basic barriers involved:

$$
\theta(K) = \theta(S_{k_{1}}) + \ldots + \theta(S_{k_{p}}) + \theta(L_{k_{p + 1}}) + \ldots + \theta(L_{k_{m}}) = \sum_{i = 1}^{p} k_{i} + 2(m - p).
$$

Recall that all direct factors in the direct product representation (Cone) of our “universe” $E$ are Euclidean spaces; the matrix factors $\mathbf{S}^{k_{i}}$ are endowed with the Frobenius inner product

$$
\langle X_{i}, Y_{i} \rangle_{\mathbf{S}^{k_{i}}} = \mathrm{Tr}(X_{i} Y_{i}),
$$

while the “arithmetic factors” $\mathbb{R}^{k_{i}}$ are endowed with the usual inner product

$$
\langle X_{i}, Y_{i} \rangle_{\mathbb{R}^{k_{i}}} = X_{i}^{T} Y_{i};
$$

E itself will be regarded as a Euclidean space endowed with the direct sum of inner products on the factors:

$$
\langle X, Y \rangle_{E} = \sum_{i = 1}^{p} \mathrm{Tr}(X_{i} Y_{i}) + \sum_{i = p + 1}^{m} X_{i}^{T} Y_{i}.
$$

It is clearly seen that our basic barriers, same as their direct sum $K,$ indeed are barriers for the corresponding cones: they are $\mathrm{C}^{\infty}$ -smooth on the interiors of their domains, blow up to ∞ along every sequence of points from these interiors converging to a boundary point of the corresponding domain and are strongly convex. To verify the latter property, it makes sense to compute explicitly the first and the second directional derivatives of these barriers (we need the corresponding formulae in any case); to simplify notation, we write down the derivatives of the basic functions $S_{k}, L_{k}$ at a point x from their domain along a direction h (you should remember that in the case of $S_{k}$ both the point and the direction, in spite of their lower-case denotation,

are $k \times k$ symmetric matrices):

$$
\begin{array}{cccc} DS_{k}(x)[h] \equiv \frac{d}{dt} \bigg |_{t = 0} S_{k}(x + th) & = & - \mathrm{Tr}(x^{- 1} h) = - \langle x^{- 1}, h \rangle_{\mathbf{S}^{k}}, \\ \text{i.e.} & & \\ \nabla S_{k}(x) & = & - x^{- 1}; \\ D^{2} S_{k}(x)[h, h] \equiv \frac{d^{2}}{dt^{2}} \bigg |_{t = 0} S_{k}(x + th) & = & \mathrm{Tr}(x^{- 1} hx^{- 1} h) = \langle x^{- 1} hx^{- 1}, h \rangle_{\mathbf{S}^{k}}, \\ \text{i.e.} & & \\[\nabla^{2} S_{k}(x)] h & = & x^{- 1} hx^{- 1}; \\ \hline DL_{k}(x)[h] \equiv \frac{d}{dt} \bigg |_{t = 0} L_{k}(x + th) & = & - 2 \frac{h^{T} J_{k} x}{x^{T} J_{k} x}, \\ \text{i.e.} & & \\ \nabla L_{k}(x) & = & - \frac{2}{x^{T} J_{k} x} J_{k} x; \\ D^{2} L_{k}(x)[h, h] \equiv \frac{d^{2}}{dt^{2}} \bigg |_{t = 0} L_{k}(x + th) & = & 4 \frac{[h^{T} J_{k} x]^{2}}{[x^{T} J_{k} x]^{2}} - 2 \frac{h^{T} J_{k} h}{x^{T} Jx}, \\ \text{i.e.} & & \\ \nabla^{2} L_{k}(x) & = & \frac{4}{[x^{T} J_{k} x]^{2}} J_{k} xx^{T} J_{k} - \frac{2}{x^{T} J_{k} x} J_{k}.\end{array}\tag{4.3.1}
$$

From the expression for $D^{2} S_{k}(x)[h, h]$ we see that

$$
D^{2} S_{k}(x)[h, h] = \mathrm{Tr}(x^{- 1} hx^{- 1} h) = \mathrm{Tr}([x^{- 1 / 2} hx^{- 1 / 2}]^{2}),
$$

so that $D^{2} S_{k}(x)[h, h]$ is positive whenever $h \neq 0$ . It is not dificult to prove that the same is true for $D^{2} L_{k}(x)[h, h]$ . Thus, the canonical barriers for semidefinite and Lorentz cones are strongly convex, and so is their direct sum $K(\cdot)$

It makes sense to illustrate relatively general concepts and results to follow by how they look in a particular case when K is the semidefinite cone $\mathbf{S}_{+}^{k}$ ; we shall refer to this situation as to the “SDP case”. The essence of the matter in our general case is exactly the same as in this particular one, but “straightforward computations” which are easy in the SDP case become nearly impossible in the general case; and we have no possibility to explain here how it is possible (it is!) to get the desired results with minimum amount of computations.

Due to the role played by the SDP case in our exposition, we use for this case special notation, along with the just introduced “general” one. Specifically, we denote the standard – the Frobenius – inner product on $E = \mathbf{S}^{k} \mathrm{~ as ~} \langle \cdot, \cdot \rangle_{F}$ , although feel free, if necessary, to use our “general” notation $\langle \cdot, \cdot \rangle_{E}$ as well; the associated norm is denoted by $\| \cdot \|_{2}$ , so that $\| X \|_{2} =$ $\sqrt{\mathrm{Tr}(X^{2})}$ , X being a symmetric matrix.

## 4.3.2 Elementary properties of canonical barriers

Let us establish a number of simple and useful properties of canonical barriers.

Proposition 4.3.1 A canonical barrier, let it be denoted F (F can be either $S_{k}$ , or $L_{k}$ , or the direct sum K of several copies of these “elementary” barriers), possesses the following properties:

(i) F is logarithmically homogeneous, the parameter of logarithmic homogeneity being $- \theta(F)$ $i.e.$ , the following identity holds:

$$
t > 0, x \in \operatorname{Dom} F \Rightarrow F(tx) = F(x) - \theta(F) \ln t.
$$

- In the SDP case, i.e., when $F = S_{k} = - \ln \mathrm{Det}(x)$ and x is $k \times k$ positive definite matrix, (i) claims that

$$
- \ln \operatorname{Det}(tx) = - \ln \operatorname{Det}(x) - k \ln t,
$$

which of course is true.

(ii) Consequently, the following two equalities hold identically in $x \in$ Dom $F.$

$$
\begin{array}{ll}(a) & \langle \nabla F(x), x \rangle = - \theta(F); \\(b) &[\nabla^{2} F(x)] x = - \nabla F(x).\end{array}
$$

- In the SDP case, $\nabla F(x) = \nabla S_{k}(x) = - x^{- 1}$ and $[\nabla^{2} F(x)] h \ = \ \nabla^{2} S_{k}(x) h \ =$ ${x^{- 1}} h{x^{- 1}}$ (see (4.3.1)). Here (a) becomes the identity $\langle x ^ { - 1 } , x \rangle _ { F } \equiv \mathrm { T r } ( x ^ { - 1 } x ) = k $ and (b) kindly informs us that $x^{- 1} xx^{- 1} = x^{- 1}$

(iii) Consequently, k-th diferential $D^{k} F(x)$ of $F, k \geq 1$ , is homogeneous, of degree −k, in $x \in \operatorname{Dom} F.$

$$
\begin{array}{l} \forall(x \in \operatorname{Dom} F, t > 0, h_{1},..., h_{k}): \\ D^{k} F(tx)[h_{1},..., h_{k}] \equiv \frac{\partial^{k} F(tx + s_{1} h_{1} +...+ s_{k} h_{k})}{\partial s_{1} \partial s_{2}...\partial s_{k}} \bigg |_{s_{1} =..= s_{k} = 0} = t^{- k} D^{k} F(x)[h_{1},..., h_{k}].\end{array}\tag{4.3.2}
$$

Proof. (i): it is immediately seen that $S_{k}$ and $L_{k}$ are logarithmically homogeneous with parameters of logarithmic homogeneity $- \theta(S_{k}), - \theta(L_{k})$ , respectively; and of course the property of logarithmic homogeneity is stable with respect to taking direct sums of functions: if Dom $\Phi(u)$ and Dom $\Psi(v)$ are closed w.r.t. the operation of multiplying a vector by a positive scalar, and both Φ and Ψ are logarithmically homogeneous with parameters $\alpha, \beta,$ respectively, then the function $\Phi(u) + \Psi(v)$ is logarithmically homogeneous with the parameter $\alpha + \beta$

(ii): To get (ii.a), it sufices to diferentiate the identity

$$
F(tx) = F(x) - \theta(F) \ln t
$$

in t at $t = 1{i}$

$$
F(tx) = F(x) - \theta(F) \ln t \Rightarrow \langle \nabla F(tx), x \rangle = \frac{d}{dt} F(tx) = - \theta(F) t^{- 2},
$$

and it remains to set $t = 1$ in the concluding identity.

Similarly, to get (ii.b), it sufices to diferentiate the identity

$$
\langle \nabla F(x + th), x + th \rangle = - \theta(F)
$$

(which is just (ii.a)) in t at $t = 0$ , thus arriving at

$$
\langle[\nabla^{2} F(x)] h, x \rangle + \langle \nabla F(x), h \rangle = 0;
$$

since $\langle[\nabla^{2} F(x)] h, x \rangle = \langle[\nabla^{2} F(x)] x, h \rangle$ (symmetry of partial derivatives!) and since the resulting equality

$$
\langle[\nabla^{2} F(x)] x, h \rangle + \langle \nabla F(x), h \rangle = 0
$$

holds true identically in $h,$ we come to $[\nabla^{2} F(x)] x = - \nabla F(x)$

(iii): Diferentiating k times the identity

$$
F(tx) = F(x) - \theta \ln t
$$

in x, we get

$$
t^{k} D^{k} F(tx)[h_{1}, \dots, h_{k}] = D^{k} F(x)[h_{1}, \dots, h_{k}].
$$

An especially nice specific feature of the barriers $S_{k}, L_{k}$ and K is their self-duality:

Proposition 4.3.2 A canonical barrier, let it be denoted F (F can be either $S_{k}$ , or $L_{k}$ , or the direct sum K of several copies of these “elementary” barriers), possesses the following property: for every $x \in$ Dom $F, \ - \nabla F(x)$ belongs to Dom $F$ as well, and the mapping $x \mapsto - \nabla F(x)$ Dom $F $ Dom F is self-inverse:

$$
- \nabla F(- \nabla F(x)) = x \quad \forall x \in \operatorname{Dom} F.\tag{4.3.3}
$$

Besides this, the mapping $x \mapsto - \nabla F(x)$ is homogeneous of degree -1:

$$
t > 0, x \in \operatorname{int} \operatorname{dom} F \Rightarrow - \nabla F(tx) = - t^{- 1} \nabla F(x).\tag{4.3.4}
$$

- In the SDP case, i.e., when $\begin{array}{rlr}{F} &{{} =} &{S_{k}} \end{array}$ and x is $k \times k$ semidefinite matrix, $\nabla F(x) = \nabla S_{k}(x) = - x^{- 1}$ , see (4.3.1), so that the above statements merely say that the mapping $x \mapsto x^{- 1}$ is a self-inverse one-to-one mapping of the interior of the semidefinite cone onto itself, and that $-(tx)^{- 1} = - t^{- 1} x^{- 1}$ , both claims being trivially true.

## 4.4 Primal-dual pair of problems and primal-dual central path

## 4.4.1 The problem(s)

It makes sense to consider simultaneously the “problem of interest” (CP) and its conic dual; since K is a direct product of self-dual cones, this dual is a conic problem on the same cone K. As we remember from Lecture 1, the primal-dual pair associated with (CP) is

$$
\begin{array}{c} \min_{x} \left\{c^{T} x: \mathcal{A} x - B \in \mathbf{K} \right\} \\ \max_{S} \left\{\langle B, S \rangle_{E}: \mathcal{A}^{*} S = c, S \in \mathbf{K} \right\} \end{array}\tag{CP}
$$

(CD)

Assume from now on that $\operatorname{Ker} A = \{0\}$ , so that we can write down our primal-dual pair in a symmetric geometric form (Lecture 1, Section 1.4.4):

$$
\begin{array}{c} \min_{X} \left\{\langle C, X \rangle_{E}: X \in(\mathcal{L} - B) \cap \mathbf{K} \right\} \\ \max_{S} \left\{\langle B, S \rangle_{E}: S \in(\mathcal{L}^{\perp} + C) \cap \mathbf{K} \right\} \end{array}\tag{P}
$$

(D)

where $\mathcal{L}$ is a linear subspace in E (the image space of the linear mapping $x \mapsto \Ax), \C^{\bot}$ is the orthogonal complement to $\mathcal{L}$ in $E,$ and $C \in E$ satisfies $A^{*} C = c.$ , i.e., $\langle C, \mathcal{A} x \rangle_{E} \equiv c^{T} x$

To simplify things, from now on we assume that both problems (CP) and (CD) are strictly feasible. In terms of (P) and (D) this assumption means that both the primal feasible plane $\mathcal{L} - B$ and the dual feasible plane $\mathcal{L}^{\bot} + C$ intersect the interior of the cone K.

Remark 4.4.1 By Conic Duality Theorem (Theorem 1.4.2), both (CP) and (D) are solvable with equal optimal values:

$$
\operatorname{Opt}(\mathrm{CP}) = \operatorname{Opt}(\mathrm{D})
$$

(recall that we have assumed strict primal-dual feasibility). Since (P) is equivalent to $\mathrm{(CP), \(P)}$ is solvable as well, and the optimal value of (P) difers from the one of (P) by $\langle C, B \rangle_{E} \^{7)}$ . It follows that the optimal values of (P) and (D) are linked by the relation

$$
\operatorname{Opt}(\mathbb{P}) - \operatorname{Opt}(\mathrm{D}) + \langle C, B \rangle_{E} = 0.\tag{4.4.1}
$$

## 4.4.2 The central path(s)

The canonical barrier K of K induces a barrier for the feasible set ${\mathcal{X}} = \{x \mid Ax - B \in \mathbf{K}\}$ of the problem (CP) written down in the form of (C), i.e., as

$$
\min_{x} \left\{c^{T} x: x \in \mathcal{X} \right\};
$$

this barrier is

$$
\widehat{K}(x) = K(\mathcal{A} x - B): \mathrm{int} X \to \mathbb{R}\tag{4.4.2}
$$

and is indeed a barrier. Now we can apply the interior penalty scheme to trace the central path $x_{*}(t)$ associated with the resulting barrier; with some efort it can be derived from the primal-dual strict feasibility that this central path is well-defined (i.e., that the minimizer of

$$
\widehat{K}_{t}(x) = tc^{T} x + \widehat{K}(x)
$$

on int $X$ exists for every $t \geq 0$ and is $\mathrm{unique})^{8)}$ . What is important for us for the moment, is the central path itself, not how to trace it. Moreover, it is highly instructive to pass from the central path $x_{*}(t)$ in the space of design variables to its image

$$
X_{*}(t) = \mathcal{A} x_{*}(t) - B
$$

in E. The resulting curve has a name – it is called the primal central path of the primal-dual pair (P), (D); by its origin, it is a curve comprised of strictly feasible solutions of (P) (since it is the same – to say that x belongs to the (interior of) the set $\mathcal{X}$ and to say that $X = \mathcal { A } { x } - \mathcal { B } $ is a (strictly) feasible solution of $\left(\mathbb{P} \right))$ . A simple and very useful observation is that the primal central path can be defined solely in terms of (P), (D) and thus is a “geometric entity” – it is independent of a particular parameterization of the primal feasible plane ${\mathcal{L}} - B$ by the design vector x:

(\*) A point $X_{\ast}(t)$ of the primal central path is the minimizer of the aggregate

$$
P_{t}(X) = t \langle C, X \rangle_{E} + K(X)
$$

on the set $({\mathcal{L}} - B)$ ∩ int K of strictly feasible solutions of $(\mathbb{P})$

This observation is just a tautology: $x_{*}(t)$ is the minimizer on int X of the aggregate

$$
\widehat{K}_{t}(x) \equiv tc^{T} x + \widehat{K}(x) = t \langle C, \mathcal{A} x \rangle_{E} + K(\mathcal{A} x - B) = P_{t}(\mathcal{A} x - B) + t \langle C, B \rangle_{E};
$$

we see that the function $\widehat{P}_{t}(x) = P_{t}(Ax - B)$ of $x \in$ int X difers from the function $\widehat{K}_{t}(x)$ by a constant (depending on t) and has therefore the same minimizer $x_{*}(t)$ as the function $\widehat{K}_{t}(x)$ . Now, when x runs through int $\mathcal{X},$ the point $X = \mathcal{A} x - B$ runs exactly through the set of strictly feasible solutions of (P), so that the minimizer X of $P_{t}$ on the latter set and the minimizer $x_{*}(t)$ of the function $\widehat{P}_{t}(x) = P_{t}(Ax - B)$ on int X are linked by the relation $X_{\ast} = \mathcal{A} x_{\ast}(t) - B.$

feasible solutions x of (CP) and $X = \mathcal{A} x - B$ of (P) difer from each other by exactly $\langle C, B \rangle_{E} \colon$

$$
c^{T} x - \langle C, X \rangle_{E} = c^{T} x - \langle C, \mathcal{A} x - B \rangle_{E} = \underbrace{c^{T} x - \langle \mathcal{A}^{*} C, x \rangle_{E}}_{= 0 \text{due to} \mathcal{A}^{*} C = c} + \langle C, B \rangle_{E}.
$$

The “analytic translation” of the above observation is as follows:

(\*<sup>0</sup>) A point $X_{\ast}(t)$ of the primal central path is exactly the strictly feasible solution X to (P) such that the vector $tC + \nabla K(X) \in E$ is orthogonal to $\mathcal{L} \(i.e.$ , belongs to $\mathcal{L}^{\bot})$

Indeed, we know that $X_{\ast}(t)$ is the unique minimizer of the smooth convex function $P_{t}(X) =$ $t \langle C, X \rangle_{E} + K(X)$ on the intersection of the primal feasible plane $\mathcal{L} - B$ and the interior of the cone $\mathbf{K};$ a necessary and sufficient condition for a point X of this intersection to minimize $P_{t}$ over the intersection is that $\nabla P_{t}$ must be orthogonal to $\mathcal{L}.$

- In the SDP case, a point $X_{*}(t), t > 0$ , of the primal central path is uniquely defined by the following two requirements: $(1) \X_{*}(t) \succ 0$ should be feasible for (P), and (2) the $k \times k$ matrix

$$
tC - X_{*}^{- 1}(t) = tC + \nabla S_{k}(X_{*}(t))
$$

(see (4.3.1)) should belong to $\mathcal{L}^{\perp}$ , i.e., should be orthogonal, w.r.t. the Frobenius inner product, to every matrix of the form Ax.

The dual problem (D) is in no sense “worse” than the primal problem (P) and thus also possesses the central path, now called the dual central path $S_{*}(t), t \geq 0$ , of the primal-dual pair (P), (D). Similarly to $(^{*}),(^{*}{}^{\prime})$ , the dual central path can be characterized as follows:

(\*\*<sup>0</sup>) A point $S_{*}(t), t \geq 0$ , of the dual central path is the unique minimizer of the aggregate

$$
D_{t}(S) = - t \langle B, S \rangle_{E} + K(S)
$$

on the set of strictly feasible solutions of $\mathrm{(D)} ~^{9)}.~ S_{*}(t)$ is exactly the strictly feasible solution S to (D) such that the vector $- tB + \nabla F(S)$ is orthogonal to $\mathcal{L}^{\perp} \(i.e.$ , belongs to $\mathcal{L})$

- In the SDP case, a point $S_{*}(t), t > 0$ , of the dual central path is uniquely defined by the following two requirements: $(1) \S_{*}(t) \succ 0$ should be feasible for (D), and (2) the $k \times k$ matrix

$$
- tB - S_{*}^{- 1}(t) = - tB + \nabla S_{k}(S_{*}(t))
$$

(see (4.3.1)) should belong to ${\mathcal{L}},{\mathrm{i.e.}}$ , should be representable in the form $\boldsymbol{Ax}$ for some x.

From Proposition 4.3.2 we can derive a wonderful connection between the primal and the dual central paths:

Theorem 4.4.1 For $t > 0$ , the primal and the dual central paths $X_{*}(t), \S_{*}(t)$ of a (strictly feasible) primal-dual pair (P), (D) are linked by the relations

$$
\begin{array}{l} S_{*}(t) = - t^{- 1} \nabla K(X_{*}(t)) \\ X_{*}(t) = - t^{- 1} \nabla K(S_{*}(t)) \end{array}\tag{4.4.3}
$$

Proof. $\mathrm{By \(^{*}}{}^{\prime} \)$ , the vector $tC + \nabla K(X_{*}(t))$ belongs to $\mathcal{L}^{\perp}$ , so that the vector $S = - t^{- 1} \nabla K(X_{*}(t))$ belongs to the dual feasible plane $\mathcal{L}^{\bot}{+} C$ . On the other hand, by Proposition 4.4.3 the vector $- \nabla K(X_{*}(t))$ belongs to Dom K, i.e., to the interior of K; since K is a cone and $t > 0,$ the vector $S = - t^{- 1} \nabla F(X_{*}(t))$ ) belongs to the interior of K as well. Thus, S is a strictly feasible solution of (D). Now let us compute the gradient of the aggregate $D_{t}$ at the point S:

$$
\begin{array}{rcl} \nabla D_{t}(S) & = & - tB + \nabla K(- t^{- 1} \nabla K(X_{*}(t))) \\ & = & - tB + t \nabla K(- \nabla K(X_{*}(t))) \\ & &[\text{we have used (4.3.4)}] \\ & = & - tB - tX_{*}(t) \\ & &[\text{we have used (4.3.3)}] \\ & = & - t(B + X_{*}(t)) \\ & \in & \mathcal{L} \\ & &[\text{sinceX_{*}}(t) \text{is primal feasible}] \end{array}
$$

Thus, S is strictly feasible for (D) and $\nabla D_{t}(S) \in{\mathcal{L}}$ . But by $(^{* * \prime})$ these properties characterize $S_{*}(t){:}$ thus, $S_{*}(t) = S \equiv - t^{- 1} \nabla K(X_{*}(t))$ . This relation, in view of Proposition $4.3.2$ , implies that $X_{*}(t) =$ $- t^{- 1} \nabla K(S_{*}(t))$ . Another way to get the latter relation from the one $S_{*}(t) = - t^{- 1} \nabla K(X_{*}(t))$ is just to refer to the primal-dual symmetry. ✷

In fact, the connection between the primal and the dual central paths stated by Theorem 4.4.1 can be used to characterize both the paths:

Theorem 4.4.2 Let $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ be a strictly feasible primal-dual pair.

For every $t > 0$ , there exists a unique strictly feasible solution X of (P) such $that - t^{- 1} \nabla K(X)$ is a feasible solution to (D), and this solution X is exactly $X_{\ast}(t)$

Similarly, for every $t > 0,$ , there exists a unique strictly feasible solution $S \of \(\mathrm{D})$ such that $- t^{- 1} \nabla K(S)$ is a feasible solution of (P), and this solution S is exactly $S_{*}(t)$

Proof. By primal-dual symmetry, it sufices to prove the first claim. We already know (Theorem 4.4.1) that $X = X_{*}(t)$ is a strictly feasible solution of (P) such that $- t^{- 1} \nabla K(X)$ is feasible for (D); all we need to prove is that $X_{\ast}(t)$ is the only point with these properties, which is immediate: if X is a strictly feasible solution of (P) such that $- t^{- 1} \nabla K(X)$ is dual feasible, then $- t^{- 1} \nabla K(X) \in \mathcal L^{\perp} + C, \mathrm{or}$ , which is the same, $\nabla K(X) \in{\mathcal{L}}^{\perp} - tC$ , or, which again is the same, $\nabla P_{t}(X) = tC + \nabla K(X) \in \mathcal{L}^{\bot}$ . And we already know from $(^{*}{}^{\prime})$ that the latter property, taken together with the strict primal feasibility, is characteristic for $X_{\ast}(t)$ ✷

## 4.4.2.1 On the central path

As we have seen, the primal and the dual central paths are intrinsically linked one to another, and it makes sense to think of them as of a unique entity – the primal-dual central path of the primal-dual pair (P), (D). The primal-dual central path is just a curve $(X_{*}(t), S_{*}(t))$ in $E \times E$ such that the projection of the curve on the primal space is the primal central path, and the projection of it on the dual space is the dual central path.

To save words, from now on we refer to the primal-dual central path simply as to the central path.

The central path possesses a number of extremely nice properties; let us list some of them.

Characterization of the central path. By Theorem 4.4.2, the points $(X_{*}(t), S_{*}(t))$ of the central path possess the following properties:

(CentralPath):

1. [Primal feasibility] The point $X_{\ast}(t)$ is strictly primal feasible.

2. [Dual feasibility] The point $S_{*}(t)$ is dual feasible.

3. [“Augmented complementary slackness”] The points $X_{\ast}(t)$ and $S_{*}(t)$ are linked by the relation

$$
S_{*}(t) = - t^{- 1} \nabla K(X_{*}(t))[\Leftrightarrow X_{*}(t) = - t^{- 1} \nabla K(S_{*}(t))].
$$

- In the $\mathrm{SDP}$ case, $\nabla K(U) = \nabla S_{k}(U) = - U^{- 1}$ (see (4.3.1)), and the augmented complementary slackness relation takes the nice form

$$
X_{*}(t) S_{*}(t) = t^{- 1} I,\tag{4.4.4}
$$

where I, as usual, is the unit matrix.

In fact, the indicated properties fully characterize the central path: whenever two points X, S possess the properties 1) - 3) with respect to some $t > 0$ , X is nothing but $X_{*}(t)$ , and S is nothing but S<sub>∗</sub>(t) (this again is said by Theorem 4.4.2).

Duality gap along the central path. Recall that for an arbitrary primal-dual feasible pair (X, S) of the (strictly feasible!) primal-dual pair of problems (P), (D), the duality gap

$$
\mathrm{DualityGap}(X, S) \equiv[\langle C, X \rangle_{E} - \mathrm{Opt}(\mathbb{P})] +[\mathrm{Opt}(\mathrm{D}) - \langle B, S \rangle_{E}] = \langle C, X \rangle_{E} - \langle B, S \rangle_{E} + \langle C, B \rangle_{E}
$$

(see (4.4.1)) which measures the “total inaccuracy” of X, S as approximate solutions of the respective problems, can be written down equivalently as $\langle S, X \rangle_{E}$ (see statement (!) in Section 1.4.5). Now, what is the duality gap along the central path? The answer is immediate:

$$
\begin{array}{rcl} \mathrm{DualityGap}(X_{*}(t), S_{*}(t)) & = & \langle S_{*}(t), X_{*}(t) \rangle_{E} \\ & = & \langle - t^{- 1} \nabla K(X_{*}(t)), X_{*}(t) \rangle_{E} \\ & &[\mathrm{see(4.4.3)}] \\ & = & t^{- 1} \theta(K) \\ & &[\mathrm{seeproposition4.3.1.(ii)}] \end{array}
$$

We have arrived at a wonderful result<sup>10)</sup>:

Proposition 4.4.1 Under assumption of primal-dual strict feasibility, the duality gap along the central path is inverse proportional to the penalty parameter, the proportionality coeficient being the parameter of the canonical barrier K:

$$
\mathrm{DualityGap}(X_{*}(t), S_{*}(t)) = \frac{\theta(K)}{t}.
$$

In particular, both $X_{*}(t)$ and $S_{*}(t)$ are strictly feasible $\left({\frac{\theta(K)}{t}} \right)$ -approximate solutions to their respective problems:

$$
\begin{array}{rcl}{\langle C, X_{*}(t) \rangle_{E} - \mathrm{Opt}(P)} & \leq &{\frac{\theta(K)}{t},} \\{\mathrm{Opt}(D) - \langle B, S_{*}(t) \rangle_{E}} & \leq &{\frac{\theta(K)}{t}.} \end{array}
$$

- In the SDP case, $\mathbf{K} = \mathbf{S}_{+}^{k}$ and $\theta(K) = \theta(S_{k}) = k$

We see that

All we need in order to get “quickly” good primal and dual approximate solutions, is to trace fast the central path; if we were interested to solve only one of the problems (P), (D), it would be sufficient to trace fast the associated – primal or dual – component of this path. The quality guarantees we get in such a process depend – in a completely universal fashion! – solely on the value t of the penalty parameter we have managed to achieve and on the value of the parameter of the canonical barrier K and are completely independent of other elements of the data.

## 4.4.2.2 Near the central path

The conclusion we have just made is a bit too optimistic: well, our life when moving along the central path would be just fine (at the very least, we would know how good are the solutions we already have), but how could we move exactly along the path? Among the relations (CentralPath.1-3) defining the path the first two are “simple” – just linear, but the third is in fact a system of nonlinear equations, and we have no hope to satisfy these equations exactly. Thus, we arrive at the crucial question which, a bit informally, sounds as follows:

How close (and in what sense close) should we be to the path in order for our life to be essentially as nice as if we were exactly on the path?

There are several ways to answer this question; we will present the simplest one.

A distance to the central path. Our canonical barrier $K(\cdot)$ is a strongly convex smooth function on int K; in particular, its Hessian matrix $\nabla^{2} K(Y)$ , taken at a point $Y \in \operatorname{int} \mathbf{K}$ , is positive definite. We can use the inverse of this matrix to measure the distances between points of E, thus arriving at the norm

$$
\| H \|_{Y} = \sqrt{\langle[\nabla^{2} K(Y)]^{- 1} H, H \rangle_{E}}.
$$

It turns out that

A good measure of proximity of a strictly feasible primal-dual pair $Z =(X, S)$ to a point $Z_{*}(t) =(X_{*}(t), S_{*}(t))$ from the primal-dual central path is the quantity

$$
\mathrm{dist}(Z, Z_{*}(t)) \equiv \| tS + \nabla K(X) \|_{X} \equiv \sqrt{\langle[\nabla^{2} K(X)]^{- 1}(tS + \nabla K(X)), tS + \nabla K(X) \rangle_{E}}
$$

Although written in a non-symmetric w.r.t. X, S form, this quantity is in fact symmetric in X, S: it turns out that

$$
\| tS + \nabla K(X) \|_{X} = \| tX + \nabla K(S) \|_{S}\tag{4.4.5}
$$

for all $t > 0$ and S, X ∈ int K.

Observe that dist $(Z, Z_{*}(t)) \ge 0$ , and dist $(Z, Z_{*}(t)) = 0$ if and only if $\boldsymbol{S} = - t^{- 1} \boldsymbol{\nabla} \boldsymbol{K}(\boldsymbol{X})$ , which, for a strictly primal-dual feasible pair $Z =(X, S)$ , means that $Z = Z_{*}(t)$ (see the characterization of the primal-dual central path); thus, dis $(Z, Z_{*}(t))$ indeed can be viewed as a kind of distance from $Z$ to $Z_{*}(t)$

In the SDP case $X, S$ are $k \times k$ symmetric matrices, and

$$
\begin{array}{rcl} \mathrm{dist}^{2}(Z, Z_{*}(t)) & = & \| tS + \nabla S_{k}(X) \|_{X}^{2} = \langle[\nabla^{2} S_{k}(X)]^{- 1}(tS + \nabla S_{k}(X)), tS + \nabla S_{k}(X) \rangle_{F} \\ & = & \mathrm{Tr} \left(X(tS - X^{- 1}) X(tS - X^{- 1})\right) \\ & & \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \qquad \text{[ see (4.3.1)]} \\ & = & \mathrm{Tr}([tX^{1 / 2} SX^{1 / 2} - I]^{2}), \end{array}
$$

so that

$$
\mathrm{dist}^{2}(Z, Z_{*}(t)) = \mathrm{Tr} \left(X(tS - X^{- 1}) X(tS - X^{- 1})\right) = \| tX^{1 / 2} SX^{1 / 2} - I \|_{2}^{2}.\tag{4.4.6}
$$

Besides this,

$$
\begin{array}{rcl} \| tX^{1 / 2} SX^{1 / 2} - I \|_{2}^{2} & = & \mathrm{Tr} \left([tX^{1 / 2} SX^{1 / 2} - I]^{2}\right) \\ & = & \mathrm{Tr} \left(t^{2} X^{1 / 2} SX^{1 / 2} X^{1 / 2} SX^{1 / 2} - 2tX^{1 / 2} SX^{1 / 2} + I\right) \\ & = & \mathrm{Tr}(t^{2} X^{1 / 2} SXSX^{1 / 2}) - 2t \mathrm{Tr}(X^{1 / 2} SX^{1 / 2}) + \mathrm{Tr}(I) \\ & = & \mathrm{Tr}(t^{2} XSXS - 2tXS + I) \\ & = & \mathrm{Tr}(t^{2} SXSX - 2tSX + I) \\ & = & \mathrm{Tr}(t^{2} S^{1 / 2} XS^{1 / 2} S^{1 / 2} XS^{1 / 2} - 2tS^{1 / 2} XS^{1 / 2} + I) \\ & = & \mathrm{Tr}([tS^{1 / 2} XS^{1 / 2} - I]^{2}), \end{array}
$$

i.e., (4.4.5) indeed is true.

In a moderate dist $(\cdot, Z_{*}(\cdot)),$ )-neighbourhood of the central path. It turns out that in such a neighbourhood all is essentially as fine as at the central path itself:

A. Whenever $Z =(X, S)$ is a pair of primal-dual strictly feasible solutions to $(\mathbb{P})$ 2 (D) such that

$$
\operatorname{dist}(Z, Z_{*}(t)) \leq 1,\tag{Close}
$$

$Z$ is “essentially as good as $Z_{*}(t)^{*}$ , namely, the duality gap at $(X, S)$ is essentially as small as at the point $Z_{*}(t)$

$$
\operatorname{DualityGap}(X, S) = \langle S, X \rangle_{E} \leq 2 \operatorname{DualityGap}(Z_{*}(t)) = \frac{2 \theta(K)}{t}.\tag{4.4.7}
$$

Let us check A in the $\operatorname{SDP}$ case. Let $(t, X, S)$ satisfy the premise of A. The duality gap at the pair $(X, S)$ of strictly primal-dual feasible solutions is

$$
\text{DualityGap}(X, S) = \langle X, S \rangle_{F} = \text{Tr}(XS),
$$

while by (4.4.6) the relation dist $((S, X), Z_{*}(t)) \leq 1$ means that

$$
\| tX^{1 / 2} SX^{1 / 2} - I \|_{2} \leq 1,
$$

whence

$$
\| X^{1 / 2} SX^{1 / 2} - t^{- 1} I \|_{2} \leq \frac{1}{t}.
$$

Denoting by δ the vector of eigenvalues of the symmetric matrix $X^{1 / 2} SX^{1 / 2}$ , we conclude

that $\sum_{i = 1}^{k}(\delta_{i} - t^{- 1})^{2} \leq t^{- 2}$ , whence

$$
\begin{array}{rcl} \text{DualityGap}(X, S) & = & \text{Tr}(XS) = \text{Tr}(X^{1 / 2} SX^{1 / 2}) = \sum_{i = 1}^{k} \delta_{i} \\ & \leq & kt^{- 1} + \sum_{i = 1}^{k} | \delta_{i} - t^{- 1} | \leq kt^{- 1} + \sqrt{k} \sqrt{\sum_{i = 1}^{k}(\delta_{i} - t^{- 1})^{2}} \\ & \leq & kt^{- 1} + \sqrt{k} t^{- 1}, \end{array}
$$

and (4.4.7) follows.

It follows from A that

For our purposes, it is essentially the same – to move along the primal-dual central path, or to trace this path, staying in its “time-space” neighbourhood

$$
\mathcal{N}_{\kappa} = \{(t, X, S) \mid X \in \mathcal{L} - B, S \in \mathcal{L}^{\perp} + C, t > 0, \mathrm{dist}((X, S),(X_{*}(t), S_{*}(t))) \leq \kappa\}\tag{4.4.8}
$$

with certain $\kappa \leq 1$

Most of the interior point methods for LP, CQP, and SDP, including those most powerful in practice, solve the primal-dual pair (P), (D) by tracing the central $\mathrm{{path}^{\mathrm{{11}}}})$ , although not all of them keep the iterates in $\mathcal{N}_{O(1)};$ some of the methods work in much wider neighbourhoods of the central path, in order to avoid slowing down when passing “highly curved” segments of the path. At the level of ideas, these “long step path following methods” essentially do not difer from the “short step” ones – those keeping the iterates in $\mathcal{N}_{O(1)};$ this is why in the analysis part of our forthcoming presentation we restrict ourselves with the short-step methods. It should be added that as far as the theoretical eficiency estimates are concerned, the short-step methods yield the best known so far complexity bounds for LP, CQP and SDP, and are essentially better than the long-step methods (although in practice the long-step methods usually outperform their short-step counterparts).

## 4.5 Tracing the central path

## 4.5.1 The path-following scheme

Assume we are solving a strictly feasible primal-dual pair of problems (P), (D) and intend to trace the associated central path. Essentially all we need is a mechanism for updating a current iterate $(\bar{t}, \bar{X}, \bar{S})$ such that $\bar{t} > 0$ , X<sup>¯</sup> is strictly primal feasible, S<sup>¯</sup> is strictly dual feasible, and (X, <sup>¯</sup> S<sup>¯</sup>) is $\mathrm{\Delta^{66} good^{5}}$ , in certain precise sense, approximation of the point $Z_{*}(\bar{t}) =(X_{*}(\bar{t}), S_{*}(\bar{t}))$ on the central path, into a new iterate $(t_{+}, X_{+}, S_{+})$ with similar properties and a larger value $t_{+} > \bar{t}$ of the penalty parameter. Given such an updating and iterating it, we indeed shall trace the central path, with all the benefits (see above) coming from the latter fact<sup>12)</sup> How could we construct the required updating? Recalling the description of the central path, we see that our question is:

Given a triple (t,<sup>¯</sup> X,<sup>¯</sup> S<sup>¯</sup>) which satisfies the relations

$$
\begin{array}{rcl} X & \in & \mathcal{L} - B, \\ S & \in & \mathcal{L}^{\perp} + C \end{array}\tag{4.5.1}
$$

(which is in fact a system of linear equations) and approximately satisfies the system of nonlinear equations

$$
G_{t}(X, S) \equiv S + t^{- 1} \nabla K(X) = 0,\tag{4.5.2}
$$

update it into a new triple $(t_{+}, X_{+}, S_{+})$ with the same properties and $t_{+} > \bar{t}.$

Since the left hand side $G(\cdot)$ in our system of nonlinear equations is smooth around $(\bar{t}, \bar{X}, \bar{S})$ (recall that X<sup>¯</sup> was assumed to be strictly primal feasible), the most natural, from the viewpoint of Computational Mathematics, way to achieve our target is as follows:

1. We choose somehow a desired new value $t_{+} > \bar{t}$ of the penalty parameter;

2. We linearize the left hand side $G_{t_{+}}(X, S)$ of the system of nonlinear equations (4.5.2) at the point (X,<sup>¯</sup> S<sup>¯</sup>), and replace (4.5.2) with the linearized system of equations

$$
G_{t_{+}}(\bar{X}, \bar{S}) + \frac{\partial G_{t_{+}}(\bar{X}, \bar{S})}{\partial X}(X - \bar{X}) + \frac{\partial G_{t_{+}}(\bar{X}, \bar{S})}{\partial S}(S - \bar{S}) = 0\tag{4.5.3}
$$

3. We define the corrections $\Delta X$ , ∆S from the requirement that the updated pair $X_{+} =$ $\bar{X} + \Delta X, S_{+} = \bar{S} + \Delta S$ must satisfy (4.5.1) and the linearized version (4.5.3) of (4.5.2). In other words, the corrections should solve the system

$$
\begin{array}{c} \Delta X \in \mathcal{L}, \\ \Delta S \in \mathcal{L}^{\perp}, \\ G_{t_{+}}(\bar{X}, \bar{S}) + \frac{\partial G_{t_{+}}(\bar{X}, \bar{S})}{\partial X} \Delta X + \frac{\partial G_{t_{+}}(\bar{X}, \bar{S})}{\partial S} \Delta S = 0 \end{array}\tag{4.5.4}
$$

4. Finally, we define $X_{+}$ and $S_{+}$ as

$$
\begin{array}{rcl}{X_{+}} & = &{\bar{X} + \Delta X,} \\{S_{+}} & = &{\bar{S} + \Delta S.} \end{array}\tag{4.5.5}
$$

The primal-dual IP methods we are describing basically fit the outlined scheme, up to the following two important points:

- If the current iterate $({\bar{X}},{\bar{S}})$ is not enough close to $Z_{*}(\bar{t})$ , and $\cdot / \mathrm{or}$ if the desired improvement $t_{+} - \bar{t}$ is too large, the corrections given by the outlined scheme may be too large; as a result, the updating (4.5.5) as it is may be inappropriate, e.g., $X_{+},$ , or $S_{+}$ , or both, may be kicked out of the cone K. (Why not: linearized system (4.5.3) approximates well the “true” system (4.5.2) only locally, and we have no reasons to trust in corrections coming from the linearized system, when these corrections are large.)

There is a standard way to overcome the outlined dificulty – to use the corrections in a damped fashion, namely, to replace the updating (4.5.5) with

$$
\begin{array}{rcl}{X_{+}} & = &{\bar{X} + \alpha \Delta X,} \\{S_{+}} & = &{\bar{S} + \beta \Delta S,} \end{array}\tag{4.5.6}
$$

and to choose the stepsizes $\alpha > 0, \beta > 0$ from additional “safety” considerations, like ensuring the updated pair $(X_{+}, S_{+})$ to reside in the interior of K, or enforcing it to stay in a desired neighbourhood of the central path, or whatever else. In IP methods, the solution $(\Delta X, \Delta S)$ of (4.5.4) plays the role of search direction (and this is how it is called), and the actual corrections are proportional to the search ones rather than to be exactly the same. In this sense the situation is completely similar to the one with the Newton method from Section 4.2.2 (which is natural: the latter method is exactly the linearization method for solving the Fermat equation $\nabla f(x) = 0)$

- The “augmented complementary slackness” system (4.5.2) can be written down in many different forms which are equivalent to each other in the sense that they share a common solution set. $\mathrm{E.g.}$ , we have the same reasons to express the augmented complementary slackness requirement by the nonlinear system (4.5.2) as to express it by the system

$$
\widehat{G}_{t}(X, S) \equiv X + t^{- 1} \nabla K(S) = 0,
$$

not speaking about other possibilities. And although all systems of nonlinear equations

$$
H_{t}(X, S) = 0
$$

expressing the augmented complementary slackness are “equivalent” in the sense that they share a common solution set, their linearizations are different and thus – lead to different search directions and finally to different path-following methods. Choosing appropriate (in general even varying from iteration to iteration) analytic representation of the augmented complementary slackness requirement, one can gain a lot in the performance of the resulting path-following method, and the IP machinery facilitates this flexibility (see “SDP case examples” below).

## 4.5.2 Speed of path-tracing

In the LP-CQP-SDP situation, the speed at which the best, from the theoretical viewpoint, pathfollowing methods manage to trace the path, is inverse proportional to the square root of the parameter $\theta(K)$ of the underlying canonical barrier. It means the following. Started at a point $(t^{0}, X^{0}, S^{0})$ from the neighbourhood $\mathcal{N}_{0.1}$ of the central path, the method after $O(1){\sqrt{\theta(K)}}$ steps reaches the point $(t^{1} = \bar{2} t^{0}, X^{1}, S^{1})$ from the same neighbourhood, after the same $O(1){\sqrt{\theta(K)}}$ steps more reaches the point $(t^{2} = 2^{2} t^{0}, X^{2}, S^{2})$ from the neighbourhood, and so on – it takes the method a fixed number $O(1){\sqrt{\theta(K)}}$ steps to increase by factor 2 the current value of the penalty parameter, staying all the time in $\mathcal{N}_{0.1}$ . By (4.4.7) it means that every $O(1){\sqrt{\theta(K)}}$ steps of the method reduce the (upper bound on the) inaccuracy of current approximate solutions by factor 2, or, which is the same, add a fixed number of accuracy digits to these solutions. Thus, “the cost of an accuracy digit” for the (best) path-following methods is $O(1){\sqrt{\theta(K)}}$ steps. To realize what this indeed mean, we should, of course, know how “heavy” a step is – what is its arithmetic cost. Well, the arithmetic cost of a step for the “cheapest among the fastest” IP methods as applied to (CP) is as if all operations carried out at a step were those required by

1. Assembling, given a point $X \in \operatorname{int} \mathbf{K}$ , the symmetric $n \times n$ matrix $(n = \dim x)$

$$
\mathcal{H} = \mathcal{A}^{*}[\nabla^{2} K(X)] \mathcal{A};
$$

2. Subsequent Choleski factorization of the matrix H (which, due to its origin, is symmetric positive definite and thus admits Choleski decomposition $\mathcal{H} = DD^{T}$ with lower triangular D).

Looking at (Cone), (CP) and (4.3.1), we immediately conclude that the arithmetic cost of assembling and factorizing H is polynomial in the size dim Data(·) of the data defining (CP), and that the parameter $\theta(K)$ also is polynomial in this size. Thus, the cost of an accuracy digit for the methods in question is polynomial in the size of the data, as is required from polynomial time methods<sup>13)</sup>. Explicit complexity bounds for $\mathcal{LP}_{b}, \mathcal{CQP}_{b}, \mathcal{SDP}_{b}$ are given in Sections 4.6.1, 4.6.2, 4.6.3, respectively.

## 4.5.3 The primal and the dual path-following methods

The simplest way to implement the path-following scheme from Section 4.5.1 is to linearize the augmented complementary slackness equations (4.5.2) as they are, ignoring the option to rewrite these equations equivalently before linearization. Let us look at the resulting method in more details. Linearizing (4.5.2) at a current iterate X<sup>¯</sup> , S<sup>¯</sup>, we get the vector equation

$$
t_{+}(\bar{S} + \Delta S) + \nabla K(\bar{X}) +[\nabla^{2} K(\bar{X})] \Delta X = 0,
$$

where $t_{+}$ is the target value of the penalty parameter. The system (4.5.4) now becomes

(a)

$$
\Delta X \in \mathcal{L}\tag{\((a')\}
$$

$$
\Delta X = \mathcal{A} \Delta x \quad[\Delta x \in \mathbb{R}^{n}]\tag{b}
$$

$$
\Delta S \in \mathcal{L}^{\perp}\tag{4.5.7}
$$

(b<sup>0</sup>)

$$
\mathcal{A}^{*} \Delta S = 0\tag{c}
$$

$$
t_{+}[\bar{S} + \Delta S] + \nabla K(\bar{X}) +[\nabla^{2} K(\bar{X})] \Delta X = 0;
$$

the unknowns here are $\Delta X, \Delta S$ and $\Delta x$ . To process the system, we eliminate $\Delta X$ via $(a^{\prime})$ and multiply both sides of (c) by $\b{A}^{*}$ , thus getting the equation

$$
\underbrace{\mathcal{A}^{*}[\nabla^{2} K(\bar{X})] \mathcal{A}}_{\mathcal{H}} \Delta x +[t_{+} \mathcal{A}^{*}[\bar{S} + \Delta S] + \mathcal{A}^{*} \nabla K(\bar{X})] = 0.\tag{4.5.8}
$$

Note that $\mathcal{A}^{*} \lceil \bar{S} + \Delta S \rceil = c$ is the objective of (CP) (indeed, $\bar{S} \in \mathcal{L}^{\perp} + C, \mathrm{i.e.,} \mathcal{A}^{*} \bar{S} = c,$ while $\mathcal{A}^{\ast} \Delta \boldsymbol{S} = 0$ by (b<sup>0</sup>)). Consequently, (4.5.8) becomes the primal Newton system

$$
\mathcal{H} \Delta x = -[t_{+} c + \mathcal{A}^{*} \nabla K(\bar{X})].\tag{4.5.9}
$$

Solving this system (which is possible – it is easily seen that the $n \times n$ matrix H is positive definite), we get $\Delta x$ and then set

$$
\begin{array}{rcl} \Delta X & = & \mathcal{A} \Delta x, \\ \Delta S & = & - t_{+}^{- 1}[\nabla K(\bar{X}) +[\nabla^{2} K(\bar{X}) \Delta X] - \bar{S}, \end{array}\tag{4.5.10}
$$

<sup>13)</sup> Strictly speaking, the outlined complexity considerations are applicable to the “highway” phase of the solution process, after we once have reached the neighbourhood $\mathcal{N}_{0.1}$ of the central path. However, the results of our considerations remain unchanged after the initialization expenses are taken into account, see Section 4.6.

thus getting a solution to (4.5.7). Restricting ourselves with the stepsizes $\alpha = \beta = 1$ (see (4.5.6)), we come to the “closed form” description of the method:

(a)

(b)

$$
\begin{array}{c} t \mapsto t_{+} > t \\ x \mapsto x_{+} = x + \underbrace{\Bigl(-[\mathcal{A}^{*}(\nabla^{2} K(X)) \mathcal{A}]^{- 1}[t_{+} c + \mathcal{A}^{*} \nabla K(X)] \Bigr)}_{\Delta x}, \\ S \mapsto S_{+} = - t_{+}^{- 1}[\nabla K(X) +[\nabla^{2} K(X)] \mathcal{A} \Delta x], \end{array}\tag{4.5.11}
$$

(c)

where x is the current iterate in the space $\mathbb{R}^{n}$ of design variables and $X = \mathcal { A } { x } - \mathcal { B } $ is its image in the space $E.$

The resulting scheme admits a quite natural explanation. Consider the function

$$
F(x) = K(\mathcal{A} x - B);
$$

you can immediately verify that this function is a barrier for the feasible set of (CP). Let also

$$
F_{t}(x) = tc^{T} x + F(x)
$$

be the associated barrier-generated family of penalized objectives. Relation (4.5.11.b) says that the iterates in the space of design variables are updated according to

$$
x \mapsto x_{+} = x -[\nabla^{2} F_{t_{+}}(x)]^{- 1} \nabla F_{t_{+}}(x),
$$

i.e., the process in the space of design variables is exactly the process (4.2.1) from Section 4.2.3.

Note that (4.5.11) is, essentially, a purely primal process (this is where the name of the method comes from). Indeed, the dual iterates $S, S_{+}$ just do not appear in formulas for $x_{+}, X_{+},$ and in fact the dual solutions are no more than “shadows” of the primal ones.

Remark 4.5.1 When constructing the primal path-following method, we have started with the augmented slackness equations in form (4.5.2). Needless to say, we could start our developments with the same conditions written down in the “swapped” form

$$
X + t^{- 1} \nabla K(S) = 0
$$

as well, thus coming to what is called “dual path-following method”. Of course, as applied to a given pair (P), (D), the dual path-following method difers from the primal one. However, the constructions and results related to the dual path-following method require no special care – they can be obtained from their “primal counterparts” just by swapping “primal” and “dual” entities.

The complexity analysis of the primal path-following method can be summarized in the following

Theorem 4.5.1 Let $0 < \chi \leq \kappa \leq 0.1$ . Assume that we are given a starting point $(t_{0}, x_{0}, S_{0})$ such that $t_{0} > 0$ and the point

$$
(X_{0} = \mathcal{A} x_{0} - B, S_{0})
$$

is κ-close to $Z_{*}(t_{0})$

$$
\mathrm{dist}((X_{0}, S_{0}), Z_{*}(t_{0})) \leq \kappa.
$$

Starting with $(t_{0}, x_{0}, X_{0}, S_{0})$ , let us iterate process (4.5.11) equipped with the penalty updating policy

$$
t_{+} = \left(1 + \frac{\chi}{\sqrt{\theta(K)}}\right) t\tag{4.5.12}
$$

i.e., let us build the iterates $(t_{i}, x_{i}, X_{i}, S_{i})$ according to

$$
\begin{array}{c} t_{i} = \left(1 + \frac{\chi}{\sqrt{\theta(K)}}\right) t_{i - 1}, \\ x_{i} = x_{i - 1} - \underbrace{[\mathcal{A}^{*}(\nabla^{2} K(X_{i - 1})) \mathcal{A}]^{- 1}[t_{i} c + \mathcal{A}^{*} \nabla K(X_{i - 1})]}_{\Delta x_{i}}, \\ X_{i} = \mathcal{A} x_{i} - B, \\ S_{i} = - t_{i}^{- 1}[\nabla K(X_{i - 1}) +[\nabla^{2} K(X_{i - 1})] \mathcal{A} \Delta x_{i}] \end{array}
$$

The resulting process is well-defined and generates strictly primal-dual feasible pairs $(X_{i}, S_{i})$ such that $(t_{i}, X_{i}, S_{i})$ stay in the neighbourhood $\mathcal{N}_{\kappa}$ of the primal-dual central path.

The theorem says that with properly chosen $\kappa, \chi \left(\mathrm{e.g.}, \kappa = \chi = 0.1 \right)$ we can, getting once close to the primal-dual central path, trace it by the primal path-following method, keeping the iterates in $\mathcal{N}_{\kappa}.$ -neighbourhood of the path and increasing the penalty parameter by an absolute constant factor every $O({\sqrt{\theta(K)}})$ steps – exactly as it was claimed in Sections 4.2.3, 4.5.2. This fact is extremely important theoretically; in particular, it underlies the polynomial time complexity bounds for LP, CQP and SDP from Section 4.6 below. As a practical tool, the primal and the dual path-following methods, at least in their short-step form presented above, are not that attractive. The computational power of the methods can be improved by passing to appropriate large-step versions of the algorithms, but even these versions are thought of to be inferior as compared to “true” primal-dual path-following methods (those which “indeed work with both (P) and $(\mathrm{D})^{\dag}$ , see below). There are, however, cases when the primal or the dual path-following scheme seems to be unavoidable; these are, essentially, the situations where the pair (P), (D) is “highly asymmetric”, e.g., (P) and (D) have different by order of magnitudes design dimensions dim ${\mathcal{L}},$ dim $\mathcal{L}^{\perp}$ . Here it becomes too expensive computationally to treat (P), (D) in a “nearly symmetric way”, and it is better to focus solely on the problem with smaller design dimension.

To get an impression of how the primal path-following method works, here is a picture:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/d1cdc68ec67112eb3d5fb0ee7d000010dda652f3c76b60ac4791df1710aff3dc.jpg)  
What you see is the 2D feasible set of a toy $\mathrm{SDP \(K = S_{+}^{3})}$ . “Continuous curve” is the primal central path; dots are iterates $x_{i}$ of the algorithm. We cannot draw the dual solutions, since they “live” in 4- dimensional space (dim $\mathcal{L}^{\perp} = \mathrm{dim}{\bf S}^{3} - \mathrm{dim} \mathcal{L} = 6 - 2 = 4) \quad$

Here are the corresponding numbers:

<table><tr><td>Itr#</td><td>Objective</td><td>Duality Gap</td><td>Itr#</td><td>Objective</td><td>Duality Gap</td></tr><tr><td>1</td><td>-0.100000</td><td>2.96</td><td>7</td><td>-1.359870</td><td>8.4e-4</td></tr><tr><td>2</td><td>-0.906963</td><td>0.51</td><td>8</td><td>-1.360259</td><td>2.1e-4</td></tr><tr><td>3</td><td>-1.212689</td><td>0.19</td><td>9</td><td>-1.360374</td><td>5.3e-5</td></tr><tr><td>4</td><td>-1.301082</td><td>6.9e-2</td><td>10</td><td>-1.360397</td><td>1.4e-5</td></tr><tr><td>5</td><td>-1.349584</td><td>2.1e-2</td><td>11</td><td>-1.360404</td><td>3.8e-6</td></tr><tr><td>6</td><td>-1.356463</td><td>4.7e-3</td><td>12</td><td>-1.360406</td><td>9.5e-7</td></tr></table>

## 4.5.4 The SDP case

In what follows, we specialize the primal-dual path-following scheme in the SDP case and carry out its complexity analysis.

## 4.5.4.1 The path-following scheme in SDP

Let us look at the outlined scheme in the SDP case. Here the system of nonlinear equations (4.5.2) becomes (see (4.3.1))

$$
G_{t}(X, S) \equiv S - t^{- 1} X^{- 1} = 0,\tag{4.5.13}
$$

X, S being positive definite $k \times k$ symmetric matrices.

Recall that our generic scheme of a path-following IP method suggests, given a current triple $(\bar{t}, \bar{X}, \bar{S})$ with positive t<sup>¯</sup> and strictly primal, respectively, dual feasible $\bar{X}$ and ${\bar{S}},$ to update the this triple into a new triple $(t_{+}, X_{+}, S_{+})$ of the same type as follows:

(i) First, we somehow rewrite the system (4.5.13) as an equivalent system

$$
\bar{G}_{t}(X, S) = 0;\tag{4.5.14}
$$

(ii) Second, we choose somehow a new value $t_{+} > \bar{t}$ of the penalty parameter and linearize system (4.5.14) (with t set to $t_{+})$ at the point (X,<sup>¯</sup> S<sup>¯</sup>), thus coming to the system of linear equations

$$
\frac{\partial \bar{G}_{t_{+}}(\bar{X}, \bar{S})}{\partial X} \Delta X + \frac{\partial \bar{G}_{t_{+}}(\bar{X}, \bar{S})}{\partial S} \Delta S = - \bar{G}_{t_{+}}(\bar{X}, \bar{S}),\tag{4.5.15}
$$

for the “corrections” $(\Delta X, \Delta S)$ ;

We add to (4.5.15) the system of linear equations on ∆X, ∆S expressing the requirement that a shift of (X,<sup>¯</sup> S<sup>¯</sup>) in the direction $(\Delta X, \Delta S)$ should preserve the validity of the linear constraints in (P), (D), i.e., the equations saying that $\Delta X \in{\mathcal{L}}, \Delta S \in{\mathcal{L}}^{\bot}$ . These linear equations can be written down as

$$
\begin{array}{rcll} \Delta X & = & \mathcal{A} \Delta x &[\Leftrightarrow \Delta X \in \mathcal{L}] \\ \mathcal{A}^{*} \Delta S & = & 0 &[\Leftrightarrow \Delta S \in \mathcal{L}^{\perp}] \end{array}\tag{4.5.16}
$$

(iii) We solve the system of linear equations (4.5.15), (4.5.16), thus obtaining a primal-dual search direction (∆X, ∆S), and update current iterates according to

$$
X_{+} = \bar{X} + \alpha \Delta x, S_{+} = \bar{S} + \beta \Delta S
$$

where the primal and the dual stepsizes $\alpha, \beta$ are given by certain “side requirements”.

The major “degree of freedom” of the construction comes from (i) – from how we construct the system (4.5.14). A very popular way to handle (i), the way which indeed leads to primal-dual methods, starts from rewriting (4.5.13) in a form symmetric w.r.t. X and S. To this end we first observe that (4.5.13) is equivalent to every one of the following two matrix equations:

$$
XS = t^{- 1} I; \quad SX = t^{- 1} I.
$$

Adding these equations, we get a “symmetric” w.r.t. $X, S$ matrix equation

$$
XS + SX = 2t^{- 1} I,\tag{4.5.17}
$$

which, by its origin, is a consequence of (4.5.13). On a closest inspection, it turns out that (4.5.17), regarded as a matrix equation with positive definite symmetric matrices, is equivalent to (4.5.13). It is possible to use in the role of (4.5.14) the matrix equation (4.5.17) as it is; this policy leads to the so called AHO (Alizadeh-Overton-Haeberly) search direction and the $^{\ast} XS + SX^{\ast}$ primal-dual path-following method.

It is also possible to use a “scaled” version of (4.5.17). Namely, let us choose somehow a positive definite scaling matrix $Q$ and observe that our original matrix equation (4.5.13) says that $S = t^{- 1} X^{- 1}$ , which is exactly the same as to say that $Q^{- 1} SQ^{- 1} = t^{- 1}(QXQ)^{- 1}$ ; the latter, in turn, is equivalent to every one of the matrix equations

$$
QXSQ^{- 1} = t^{- 1} I; \quad Q^{- 1} SXQ = t^{- 1} I;
$$

Adding these equations, we get the scaled version of (4.5.17):

$$
QXSQ^{- 1} + Q^{- 1} SXQ = 2t^{- 1} I,\tag{4.5.18}
$$

which, same as (4.5.17) itself, is equivalent to (4.5.13).

With (4.5.18) playing the role of (4.5.14), we get a quite flexible scheme with a huge freedom for choosing the scaling matrix $Q,$ which in particular can be varied from iteration to iteration. As we shall see in a while, this freedom reflects the intrinsic (and extremely important in the interior-point context) symmetries of the semidefinite cone.

Analysis of the path-following methods based on search directions coming from (4.5.18) (“Zhang’s family of search directions”) simplifies a lot when at every iteration we choose its own scaling matrix and ensure that the matrices

$$
\widetilde{S} = Q^{- 1} \bar{S} Q^{- 1}, \widehat{X} = Q \bar{X} Q
$$

commute $({\bar{X}},{\bar{S}}$ are the iterates to be updated); we call such a policy a “commutative scaling” (another name: Monteiro-Zhang scalings). Popular commutative scalings are:

1. Q = S<sup>¯1/2</sup> (S = I, X = S<sup>¯1/2</sup>X<sup>¯</sup> S<sup>¯1/2</sup>) (the $^{66} XS^{9}$ method);

2. $Q = { \bar { X } } ^ { - 1 / 2 } \ ( { \widetilde { S } } = { \bar { X } } ^ { 1 / 2 } { \bar { S } } { \bar { X } } ^ { 1 / 2 } , { \widehat { X } } = I ) \ ( \mathrm { t h e } \ ^ { \ast } S X ^ { \ast } ) $ method);

3. Q is such that ${\widetilde{S}} ={\widehat{X}}$ (the NT (Nesterov-Todd) method, extremely attractive and deep)

If $\bar{X}$ and S<sup>¯</sup> were just positive reals, the formula for $Q$ would be simple: $\begin{array}{r}{Q = \left(\frac{\bar{S}}{X} \right)^{1 / 4}} \end{array}$ In the matrix case this simple formula becomes a bit more complicated (to make our life easier, below we write X instead of X<sup>¯</sup> and S instead of $\bar{S})$ :

$$
Q = P^{1 / 2}, \quad P = X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S.
$$

We should verify that (a) P is symmetric positive definite, so that $Q$ is well-defined, and that (b) $Q^{- 1} SQ^{- 1} = QXQ$

(a): Let us first verify that $P$ is symmetric:

$$
\begin{array}{c} P \text{? = ?} P^{T} \\ \Updownarrow \\ X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S \text{? = ?} SX^{1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{- 1 / 2} \\ \Updownarrow \\ \left(X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S\right) \left(X^{1 / 2}(X^{1 / 2} SX^{1 / 2})^{1 / 2} X^{- 1 / 2} S^{- 1}\right) \text{? = ?} I \\ \Updownarrow \\ X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})(X^{1 / 2} SX^{1 / 2})^{1 / 2} X^{- 1 / 2} S^{- 1} \text{? = ?} I \\ \Updownarrow \\ X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2}) X^{- 1 / 2} S^{- 1} \text{? = ?} I \end{array}
$$

and the concluding $? = ?$ indeed is =.

Now let us verify that P is positive definite. Recall that the spectrum of the product of two square matrices, symmetric or not, remains unchanged when swapping the factors. Therefore, denoting $\sigma(A)$ the spectrum of A, we have

$$
\begin{array}{rcl} \sigma(P) & = & \sigma \left(X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S\right) \\ & = & \sigma \left((X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} SX^{- 1 / 2}\right) \\ & = & \sigma \left((X^{1 / 2} SX^{1 / 2})^{- 1 / 2}(X^{1 / 2} SX^{1 / 2}) X^{- 1}\right) \\ & = & \sigma \left((X^{1 / 2} SX^{1 / 2})^{1 / 2} X^{- 1}\right) \\ & = & \sigma \left(X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{1 / 2} X^{- 1 / 2}\right), \end{array}
$$

and the argument of the concluding $\sigma(\cdot)$ clearly is a positive definite symmetric matrix. Thus, the spectrum of symmetric matrix $P$ is positive, $\mathrm{i.e.,} P$ is positive definite.

(b): To verify that $QXQ = Q^{- 1} SQ^{- 1}$ , i.e., that $P^{1 / 2} XP^{1 / 2} = P^{- 1 / 2} SP^{- 1 / 2}$ , is the same as to verify that $PXP = S$ . The latter equality is given by the following computation:

$$
\begin{array}{rcl} PXP & = & \left(X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S\right) X \left(X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S\right) \\ & = & X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})^{- 1 / 2}(X^{1 / 2} SX^{1 / 2})(X^{1 / 2} SX^{1 / 2})^{- 1 / 2} X^{1 / 2} S \\ & = & X^{- 1 / 2} X^{1 / 2} S \\ & = & S.\end{array}
$$

You should not think that Nesterov and Todd guessed the formula for this scaling matrix. They did much more: they have developed an extremely deep theory (covering the general LP-CQP-SDP case, not just the SDP one!) which, among other things, guarantees that the desired scaling matrix exists (and even is unique). After the existence is established, it becomes much easier (although still not that easy) to find an explicit formula for $Q.$

## 4.5.4.2 Complexity analysis

We are about to carry out the complexity analysis of the primal-dual path-following methods based on commutative scalings. This analysis, although not that dificult, is more technical than whatever else in our course, and a non-interested reader may skip it without any harm.

Scalings. We already have mentioned what a scaling of $\mathbf{S}_{+}^{k}$ is: this is the linear one-to-one transformation of $\mathbf{S}^{k}$ given by the formula

$$
H \mapsto QHQ^{T},\tag{Scl}
$$

where $Q$ is a nonsingular scaling matrix. It is immediately seen that (Scl) is a symmetry of the semidefinite cone $\mathbf{S}_{+}^{k} \mathrm{~ - ~}$ it maps the cone onto itself. This family of symmetries is quite rich: for every pair of points $A, B$ from the interior of the cone, there exists a scaling which maps $A$ onto $B, \mathrm{e.g.}$ , the scaling

$$
H \mapsto(\underbrace{B^{1 / 2} A^{- 1 / 2}}_{Q}) H(\underbrace{A^{- 1 / 2} B^{1 / 2}}_{Q^{T}}).
$$

Essentially, this is exactly the existence of that rich family of symmetries of the underlying cones which makes $\mathrm{SDP}$ (same as $\mathrm{LP}$ and CQP, where the cones also are “perfectly symmetric”) especially well suited for IP methods.

In what follows we will be interested in scalings associated with positive definite scaling matrices. The scaling given by such a matrix $\textit{Q}(X, S, \ldots)$ will be denoted by $\mathcal{Q} \(\mathrm{resp.}, \chi, S, \ldots);$ :

$$
\mathcal{Q}[H] = QHQ.
$$

Given a problem of interest (CP) (where $\mathbf{K} = \mathbf{S}_{+}^{k})$ and a scaling matrix $Q \succ 0$ , we can scale the problem, i.e., pass from it to the problem

$$
\min_{x} \left\{c^{T} x: \mathcal{Q}[\mathcal{A} x - B] \succeq 0 \right\}\tag{\(\mathcal{Q}(\mathrm{CP})\}
$$

which, of course, is equivalent to (CP) (since $\mathcal{Q}[H]$ is positive semidefinite if H is $_\mathrm{so)}$ . In terms of “geometric reformulation” (P) of (CP), this transformation is nothing but the substitution of variables

$$
QXQ = Y \Leftrightarrow X = Q^{- 1} YQ^{- 1};
$$

with respect to Y -variables, (P) is the problem

$$
\min_{Y} \left\{\operatorname{Tr}(C[Q^{- 1} YQ^{- 1}]): Y \in \mathcal{Q}(\mathcal{L}) - \mathcal{Q}[B], Y \succeq 0 \right\},
$$

i.e., the problem

$$
\begin{array}{c} \min_{Y} \left\{\operatorname{Tr}(\widetilde{C} Y): Y \in \widehat{\mathcal{L}} - \widehat{B}, Y \succeq 0 \right\} \\ \left[\widetilde{C} = Q^{- 1} CQ^{- 1}, \widehat{B} = QBQ, \widehat{\mathcal{L}} = \operatorname{Im}(\mathcal{QA}) = \mathcal{Q}(\mathcal{L}) \right] \end{array}\tag{\((\widehat{\mathbb{P}})\}
$$

The problem dual to $(\widehat{\mathbb{P}})$ is

$$
\max_{Z} \left\{\operatorname{Tr}(\widehat{B} Z): Z \in \widehat{\mathcal{L}}^{\perp} + \widehat{C}, Z \succeq 0 \right\}.\tag{D}
$$

It is immediate to realize what is ${\widehat{\mathcal{L}}}^{\bot}$ :

$$
\langle Z, QXQ \rangle_{F} = \mathrm{Tr}(ZQXQ) = \mathrm{Tr}(QZQX) = \langle QZQ, X \rangle_{F};
$$

thus, $Z$ is orthogonal to every matrix from ${\widehat{\mathcal{L}}},$ i.e., to every matrix of the form $QXQ$ with $X \in{\mathcal{L}}$ if the matrix $QZQ$ is orthogonal to every matrix from ${\mathcal{L}},{\mathrm{i.e.}}$ , if $QZQ \in{\mathcal{L}}^{\perp}$ . It follows that

$$
\widehat{\mathcal{L}}^{\perp} = \mathcal{Q}^{- 1}(\mathcal{L}^{\perp}).
$$

Thus, when acting on the primal-dual pair (P), (D) of $\mathrm{SDPs}$ , a scaling, given by a matrix $Q \succ 0$ , converts it into another primal-dual pair of problems, and this new pair is as follows:

- The “primal” geometric data – the subspace $\mathcal{L}$ and the primal shift B (which has a part-time job to be the dual objective as well) – are replaced with their images under the mapping $\mathcal{Q};$

- The “dual” geometric data – the subspace $\mathcal{L}^{\perp}$ and the dual shift C (it is the primal objective as well) – are replaced with their images under the mapping ${\mathcal{Q}}^{- 1}$ inverse to $\mathcal{Q};$ this inverse mapping again is a scaling, the scaling matrix being $Q^{- 1}$

We see that it makes sense to speak about primal-dual scaling which acts on both the primal and the dual variables and maps a primal variable X onto $QXQ$ , and a dual variable $S$ onto $Q^{- 1} SQ^{- 1}$ Formally speaking, the primal-dual scaling associated with a matrix $Q \succ 0$ is the linear transformation $(X, S) \mapsto(QXQ, Q^{- 1} SQ^{- 1})$ of the direct product of two copies of $\mathbf{S}^{k}$ (the “primal” and the “dual” ones). A primal-dual scaling acts naturally on different entities associated with a primal-dual pair (P), (S), in particular, at:

- the pair $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ itself – it is converted into another primal-dual pair of problems $(\widehat{\mathbb{P}}),(\widetilde{\mathrm{D}})$ ;

- a primal-dual feasible pair $(X, S)$ of solutions to $(\mathbb{P}), \(\mathrm{D}) \mathrm{~ - ~} \mathrm{it}$ is converted to the pair $({\widehat{X}} =$ $QXQ, \widetilde{S} = Q^{- 1} SQ^{- 1})$ , which, as it is immediately seen, is a pair of feasible solutions to $(\widehat{\mathbb{P}}),(\widetilde{\mathrm{D}})$ Note that the primal-dual scaling preserves strict feasibility and the duality gap:

$$
\mathrm{DualityGap}_{\mathrm{P,D}}(X, S) = \mathrm{Tr}(XS) = \mathrm{Tr}(QXSQ^{- 1}) = \mathrm{Tr}(\widehat{X} \widetilde{S}) = \mathrm{DualityGap}_{\widehat{\mathrm{P,D}}}(\widehat{X}, \widetilde{S});
$$

- the primal-dual central path $(X_{*}(\cdot), S_{*}(\cdot))$ of $({\mathbb{P}}),({\mathrm{D}});$ it is converted into the curve $(\widehat{X}_{*}(t) =$ $QX_{*}(t) Q, \widetilde{S}_{*}(t) = Q^{- 1} S_{*}(t) Q^{- 1})$ , which is nothing but the primal-dual central path $\overline{{Z}}(t)$ of the primal-dual pair $(\widehat{\mathbb{P}}),(\widetilde{\mathrm{D}})$

The latter fact can be easily derived from the characterization of the primal-dual central path; a more instructive derivation is based on the fact that our “hero” – the barrier $S_{k}(\cdot) ~ -$ is “semiinvariant” w.r.t. scaling:

$$
S_{k}(\mathcal{Q}(X)) = - \ln \operatorname{Det}(QXQ) = - \ln \operatorname{Det}(X) - 2 \ln \operatorname{Det}(Q) = S_{k}(X) + \operatorname{const}(Q).
$$

Now, a point on the primal central path of the problem $(\widehat{\mathbb{P}})$ associated with penalty parameter $t,$ let this point be temporarily denoted by $Y(t)$ , is the unique minimizer of the aggregate

$$
S_{k}^{t}(Y) = t \langle Q^{- 1} CQ^{- 1}, Y \rangle_{F} + S_{k}(Y) \equiv t \mathrm{Tr}(Q^{- 1} CQ^{- 1} Y) + S_{k}(Y)
$$

over the set of strictly feasible solutions of $(\widehat{\mathbb{P}})$ . The latter set is exactly the image of the set of strictly feasible solutions of $(\mathbb{P})$ under the transformation $\mathcal{Q},$ so that $Y(t)$ is the image, under the same transformation, of the point, let it be called $X(t)$ , which minimizes the aggregate

$$
S_{k}^{t}(QXQ) = t \mathrm{Tr}((Q^{- 1} CQ^{- 1})(QXQ)) + S_{k}(QXQ) = t \mathrm{Tr}(CX) + S_{k}(X) + \mathrm{const}(Q)
$$

over the set of strictly feasible solutions to (P). We see that $X(t)$ is exactly the point $X_{\ast}(t)$ on the primal central path associated with problem (P). Thus, the point $Y(t)$ of the primal central path associated with $(\widehat{\mathbb{P}})$ is nothing but $\widehat{X}_{*}(t) = QX_{*}(t) Q$ . Similarly, the point of the central path associated with the problem $(\widetilde{\mathrm{D}})$ is exactly $\widetilde{S}_{*}(t) = Q^{- 1} S_{*}(t) Q^{- 1}$

- the neighbourhood $\mathcal{N}_{\kappa}$ of the primal-dual central path $Z(\cdot)$ associated with the pair of problems (P), (D) (see (4.4.8)). As you can guess, the image of $\mathcal{N}_{\kappa}$ is exactly the neighbourhood $\overline{{\mathcal{N}}}_{\kappa}.$ , given by (4.4.8), of the primal-dual central path $\overline{{Z}}(\cdot)$ of $(\widehat{\mathbb{P}}),(\widetilde{\mathrm{D}})$

The latter fact is immediate: for a pair $(X, S)$ of strictly feasible primal and dual solutions to (P), (D) and a $t > 0$ we have (see (4.4.6)):

$$
\begin{array}{rcl} \mathrm{dist}^{2}((\widehat{X}, \widetilde{S}), \overline{{Z}}_{*}(t)) & = & \mathrm{Tr} \left([QXQ](tQ^{- 1} SQ^{- 1} -[QXQ]^{- 1})[QXQ](tQ^{- 1} SQ^{- 1} -[QXQ]^{- 1})\right) \\ & = & \mathrm{Tr} \left(QX(tS - X^{- 1}) X(tS - X^{- 1}) Q^{- 1}\right) \\ & = & \mathrm{Tr} \left(X(tS - X^{- 1}) X(tS - X^{- 1})\right) \\ & = & \mathrm{dist}^{2}((X, S), Z_{*}(t)).\end{array}
$$

Primal-dual short-step path-following methods based on Monteiro-Zhang scalings. Path-following methods we are about to consider trace the primal-dual central path of $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ , staying in $\mathcal{N}_{\kappa}$ -neighbourhood of the path; here $\kappa \leq 0.1$ is fixed. The path is traced by iterating the following updating:

(U): Given a current pair of strictly feasible primal and dual solutions $({\bar{X}},{\bar{S}})$ such that the triple

$$
\left(\bar{t} = \frac{k}{\operatorname{Tr}(\bar{X} \bar{S})}, \bar{X}, \bar{S}\right)\tag{4.5.19}
$$

belongs to $\mathcal{N}_{\kappa}$ , i.e. (see (4.4.6))

$$
\| \bar{t} \bar{X}^{1 / 2} \bar{S} \bar{X}^{1 / 2} - I \|_{2} \leq \kappa,\tag{4.5.20}
$$

we

1. Choose the new value $t_{+}$ of the penalty parameter according to

$$
t_{+} = \left(1 - \frac{\chi}{\sqrt{k}}\right)^{- 1} \bar{t},\tag{4.5.21}
$$

where $\chi \in(0, 1)$ is a parameter of the method;

2. Choose somehow the scaling matrix $Q \succ 0$ such that the matrices $\widehat{X} = Q \bar{X} Q$ and $\widetilde{S} = Q^{- 1} \bar{S} Q^{- 1}$ commute with each other;

3. Linearize the equation

$$
QXSQ^{- 1} + Q^{- 1} SXQ = \frac{2}{t_{+}} I
$$

at the point $({\bar{X}},{\bar{S}})$ , thus coming to the equation

$$
Q[\Delta XS + X \Delta S] Q^{- 1} + Q^{- 1}[\Delta SX + S \Delta X] Q = \frac{2}{t_{+}} I -[Q \bar{X} \bar{S} Q^{- 1} + Q^{- 1} \bar{S} \bar{X} Q];\tag{4.5.22}
$$

4. Add to (4.5.22) the linear equations

$$
\begin{array}{rcl} \Delta X & \in & \mathcal{L}, \\ \Delta S & \in & \mathcal{L}^{\perp}; \end{array}\tag{4.5.23}
$$

5. Solve system (4.5.22), (4.5.23), thus getting “primal-dual search direction” $(\Delta X, \Delta S)$ ;

6. Update current primal-dual solutions $({\bar{X}},{\bar{S}})$ into a new pair $(X_{+}, S_{+})$ according to

$$
X_{+} = \bar{X} + \Delta X, S_{+} = \bar{S} + \Delta S.
$$

We already have explained the ideas underlying (U), up to the fact that in our previous explanations we dealt with three “independent” entities t<sup>¯</sup> (current value of the penalty parameter), X<sup>¯</sup> , S<sup>¯</sup> (current primal and dual solutions), while in (U) t<sup>¯</sup> is a function of X,<sup>¯</sup> S<sup>¯</sup>:

$$
\bar{t} = \frac{k}{\mathrm{Tr}(\bar{X} \bar{S})}.\tag{4.5.24}
$$

The reason for establishing this dependence is very simple: if $(t, X, S)$ were on the primal-dual central path: $XS = t^{- 1} I.$ , then, taking traces, we indeed would get $\begin{array}{r}{t = \frac{k}{\operatorname{Tr}(XS)}} \end{array}$ . Thus, (4.5.24) is a reasonable way to reduce the number of “independent entities” we deal with.

Note also that (U) is a “pure Newton scheme” – here the primal and the dual stepsizes are equal to 1 (cf. (4.5.6)).

The major element of the complexity analysis of path-following polynomial time methods for SDP is as follows:

Theorem 4.5.2 Let the parameters $\kappa, \chi$ of (U) satisfy the relations

$$
0 < \chi \leq \kappa \leq 0.1.\tag{4.5.25}
$$

Let, further, $({\bar{X}},{\bar{S}})$ be a pair of strictly feasible primal and dual solutions to $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ such that the triple (4.5.19) satisfies (4.5.20). Then the updated pair $(X_{+}, S_{+})$ is well-defined (i.e., system (4.5.22), (4.5.23) is solvable with a unique solution), $X_{+}, S_{+}$ are strictly feasible solutions to (P), (D), respectively,

$$
t_{+} = \frac{k}{\mathrm{Tr}(X_{+} S_{+})}
$$

and the triple $(t_{+}, X_{+}, S_{+})$ belongs to $\mathcal{N}_{\kappa}$

The theorem says that with properly chosen $\kappa, \chi \(\mathrm{say}, \kappa = \chi = 0.1)$ , updating (U) converts a close to the primal-dual central path, in the sense of (4.5.20), strictly primal-dual feasible iterate $({\bar{X}},{\bar{S}})$ into a new strictly primal-dual feasible iterate with the same closeness-to-the-path property and larger, by factor $(1 + \bar{O}(\bar{1}) k^{- 1 / 2})$ , value of the penalty parameter. Thus, after we get close to the path – reach its 0.1-neighbourhood $\mathcal{N}_{0.1} \mathrm{~ - ~} \mathrm{we}$ are able to trace this path, staying in <sub>√</sub> $\mathcal{N}_{0.1}$ and increasing the penalty parameter by absolute constant factor in $O({\sqrt{k}}) = O{\hat{(}}{\sqrt{\theta(K)}})$ steps, exactly as announced in Section 4.5.2.

Proof of Theorem 4.5.2. 1<sup>0</sup>. Observe, first (this observation is crucial!) that it sufices to prove our Theorem in the particular case when ${\bar{X}},{\bar{S}}$ commute with each other and $Q = I.$ . Indeed, it is immediately seen that the updating (U) can be represented as follows:

1. We first scale by Q the “input data” of (U) – the primal-dual pair of problems (P), (D) and the strictly feasible pair ${\bar{X}},{\bar{S}}$ of primal and dual solutions to these problems, as explained in sect. “Scaling”. Note that the resulting entities – a pair of primal-dual problems and a strictly feasible pair of primal-dual solutions to these problems – are linked with each other exactly in the same fashion as the original entities, due to scaling invariance of the duality gap and the neighbourhood $\mathcal{N}_{\kappa}$ . In addition, the scaled primal and dual solutions commute;

2. We apply to the “scaled input data” yielded by the previous step the updating (U) completely similar to (U), but using the unit matrix in the role of $Q;$

3. We “scale back” the result of the previous step, i.e., subject this result to the scaling associated with $Q^{- 1}$ , thus obtaining the updated iterate $(X^{+}, S^{+})$

Given that the second step of this procedure preserves primal-dual strict feasibility, w.r.t. the scaled primal-dual pair of problems, of the iterate and keeps the iterate in the κ-neighbourhood $\mathcal{N}_{\kappa}$ of the corresponding central path, we could use once again the “scaling invariance” reasoning to assert that the result $(X^{+}, S^{+})$ of (U) is well-defined, is strictly feasible for (P), (D) and is close to the original central path, as claimed in the Theorem. Thus, all we need is to justify the above “Given”, and this is exactly the same as to prove the theorem in the particular case of $Q = I$ and commuting X<sup>¯</sup>, S<sup>¯</sup>. In the rest of the proof we assume that $Q = I$ and that the matrices X,<sup>¯</sup> S<sup>¯</sup> commute with each other. Due to the latter property, X, <sup>¯</sup> S<sup>¯</sup> are diagonal in a properly chosen orthonormal basis; representing all matrices from $\mathbf{S}^{k}$ in this basis, we can reduce the situation to the case when X<sup>¯</sup> and S<sup>¯</sup> are diagonal. Thus, we may (and do) assume in the sequel that X<sup>¯</sup> and S<sup>¯</sup> are diagonal, with diagonal entries $x_{i}, s_{i}, i = 1,..., k$ , respectively, and that $Q = I.$ . Finally, to simplify notation, we write $t, X$ , S instead of $\bar{t}, \bar{X}, \bar{S}.$ respectively.

2<sup>0</sup>. Our situation and goals now are as follows. We are given orthogonal to each other Affine planes $\mathcal{L} - B, \mathcal{L}^{\perp} + C$ in $\mathbf{S}^{k}$ and two positive definite diagonal matrices $X = \mathrm{Diag}(\{x_{i}\}) \in \mathcal{L} - B, \S =$ Diag $\{s_{i}\}) \in{\mathcal{L}}^{\perp} + C$ . We set

$$
\mu = \frac{1}{t} = \frac{\mathrm{Tr}(XS)}{k}
$$

and know that

$$
\| tX^{1 / 2} SX^{1 / 2} - I \|_{2} \leq \kappa.
$$

We further set

$$
\mu_{+} = \frac{1}{t_{+}} =(1 - \chi k^{- 1 / 2}) \mu\tag{4.5.26}
$$

and consider the system of equations w.r.t. unknown symmetric matrices $\Delta X, \Delta S$

$$
\begin{array}{cc}(a) & \Delta X \in \mathcal{L} \\(b) & \Delta S \in \mathcal{L}^{\perp} \\(c) & \Delta XS + X \Delta S + \Delta SX + S \Delta X = 2 \mu_{+} I - 2XS \end{array}\tag{4.5.27}
$$

We should prove that the system has a unique solution such that the matrices

$$
X_{+} = X + \Delta X, S_{+} = S + \Delta S
$$

are

(i) positive definite,

(ii) belong, respectively, to ${\mathcal{L}} - B,{\mathcal{L}}^{\perp} + C$ and satisfy the relation

$$
\operatorname{Tr}(X_{+} S_{+}) = \mu_{+} k;\tag{4.5.28}
$$

(iii) satisfy the relation

$$
\Omega \equiv \| \mu_{+}^{- 1} X_{+}^{1 / 2} S_{+} X_{+}^{1 / 2} - I \|_{2} \leq \kappa.\tag{4.5.29}
$$

Observe that the situation can be reduced to the one with $\mu = 1$ . Indeed, let us pass from the matrices $X, S, \Delta X, \Delta S, X_{+}, S_{+}$ to $X, S^{\prime} = \mu^{- 1} S, \Delta X, \Delta S^{\prime} = \mu^{- 1} \Delta S, X_{+}, S_{+}^{\prime} = \mu^{- 1} S_{+}$ . Now the “we are given” part of our situation becomes as follows: we are given two diagonal positive definite matrices $X, S^{\prime}$ such that $X \in \mathcal{L} - B, S^{\prime} \in \mathcal{L}^{\perp} + C^{\prime}, C^{\prime} = \mu^{- 1} C.$

$$
\operatorname{Tr}(XS^{\prime}) = k \times 1
$$

and

$$
\left\| X^{1 / 2} S^{\prime} X^{1 / 2} - I \right\|_{2} = \left\| \mu^{- 1} X^{1 / 2} SX^{1 / 2} - I \right\|_{2} \leq \kappa.
$$

The “we should prove” part becomes: to verify that the system of equations

$$
\begin{array}{cc}(a) & \Delta X \in \mathcal{L} \\(b) & \Delta S^{\prime} \in \mathcal{L}^{\perp} \\(c) & \Delta XS^{\prime} + X \Delta S^{\prime} + \Delta S^{\prime} X + S^{\prime} \Delta X = 2(1 - \chi k^{- 1 / 2}) I - 2XS^{\prime} \end{array}
$$

has a unique solution and that the matrices $X_{+} = X + \Delta X, S_{+}^{\prime} = S^{\prime} + \Delta S_{+}^{\prime}$ are positive definite, are contained in ${\mathcal{L}} - B$ , respectively, $\mathcal{L}^{\perp} + C^{\prime}$ and satisfy the relations

$$
\mathrm{Tr}(X_{+} S_{+}^{\prime}) = \frac{\mu_{+}}{\mu} = 1 - \chi k^{- 1 / 2}
$$

and

$$
\left\| \left(1 - \chi k^{- 1 / 2}\right)^{- 1} X_{+}^{1 / 2} S_{+}^{\prime} X_{+}^{1 / 2} - I \right\|_{2} \leq \kappa.
$$

Thus, the general situation indeed can be reduced to the one with $\mu = 1, \mu_{+} = 1 - \chi k^{- 1 / 2}$ , and we loose nothing assuming, in addition to what was already postulated, that

$$
\mu \equiv t^{- 1} \equiv \frac{\mathrm{Tr}(XS)}{k} = 1, \quad \mu_{+} = 1 - \chi k^{- 1 / 2},
$$

whence

$$
[\mathrm{Tr}(XS) =] \sum_{i = 1}^{k} x_{i} s_{i} = k\tag{4.5.30}
$$

and

$$
[\| tX^{1 / 2} SX^{1 / 2} - I \|_{2}^{2} \equiv] \quad \sum_{i = 1}^{n}(x_{i} s_{i} - 1)^{2} \leq \kappa^{2}.\tag{4.5.31}
$$

$3^{0}$ . We start with proving that (4.5.27) indeed has a unique solution. It is convenient to pass in (4.5.27) from the unknowns $\Delta X, \Delta S$ to the unknowns

$$
\begin{array}{rcl} \delta X = X^{- 1 / 2} \Delta XX^{- 1 / 2} & \Leftrightarrow & \Delta X = X^{1 / 2} \delta XX^{1 / 2}, \\ \delta S = X^{1 / 2} \Delta SX^{1 / 2} & \Leftrightarrow & \Delta S = X^{- 1 / 2} \delta SX^{- 1 / 2}.\end{array}\tag{4.5.32}
$$

With respect to the new unknowns, (4.5.27) becomes

$$
\begin{array}{ll}(a) & X^{1 / 2} \delta XX^{1 / 2} \in \mathcal{L}, \\(b) & X^{- 1 / 2} \delta SX^{- 1 / 2} \in \mathcal{L}^{\perp}, \\(c) & X^{1 / 2} \delta XX^{1 / 2} S + X^{1 / 2} \delta SX^{- 1 / 2} + X^{- 1 / 2} \delta SX^{1 / 2} + SX^{1 / 2} \delta XX^{1 / 2} = 2 \mu_{+} I - 2XS \\ \Updownarrow \end{array}
$$

$$
\begin{array}{ll}(d) & L(\delta X, \delta S) \equiv \Big[\underbrace{\sqrt{x_{i} x_{j}}(s_{i} + s_{j})}_{\phi_{ij}}(\delta X)_{ij} + \Big(\underbrace{\sqrt{\frac{x_{i}}{x_{j}}} + \sqrt{\frac{x_{j}}{x_{i}}}}_{\psi_{ij}} \Big)(\delta S)_{ij} \Big]_{1 \leq i \leq j \leq k} \\ & = 2 \left[(\mu_{+} - x_{i} s_{i}) \delta_{ij} \right]_{1 < i < j < k} \end{array}\tag{4.5.33}
$$

where $\delta_{ij} ={\left\{\begin{array}{ll}{0,} &{i \neq j} \\{1,} &{i = j} \end{array} \right.}$ are the Kronecker symbols.

## 4.5. TRACING THE CENTRAL PATH

We first claim that (4.5.33), regarded as a system with unknown symmetric matrices δX, δS has a unique solution. Observe that (4.5.33) is a system with 2dim $\mathbf{S}^{k} \equiv 2N$ scalar unknowns and 2N scalar linear equations. Indeed, (4.5.33.a) is a system of $N^{\prime} \equiv N -$ dim L linear equations, (4.5.33.b) is a system of $N^{\prime \prime} = N - \dim{\mathcal{L}}^{\perp}$ = dim L linear equations, and (4.5.33.c) has N equations, so that the total $\#$ of linear equations in our system is $N^{\prime} + N^{\prime \prime} + N =(N - \dim{\mathcal{L}}) +$ dim $\angle + N = 2N$ . Now, to verify that the square system of linear equations (4.5.33) has exactly one solution, it sufices to prove that the homogeneous system

$$
X^{1 / 2} \delta XX^{1 / 2} \in \mathcal{L}, X^{- 1 / 2} \delta SX^{- 1 / 2} \in \mathcal{L}^{\perp}, L(\delta X, \delta S) = 0
$$

has only trivial solution. Let (δX, δS) be a solution to the homogeneous system. Relation $L(\delta X, \Delta S) = 0$ means that

$$
(\delta X)_{ij} = - \frac{\psi_{ij}}{\phi_{ij}}(\delta S)_{ij},\tag{4.5.34}
$$

whence

$$
\operatorname{Tr}(\delta X \delta S) = - \sum_{i, j} \frac{\psi_{ij}}{\phi_{ij}}(\Delta S)_{ij}^{2}.\tag{4.5.35}
$$

Representing δX, δS via $\Delta X, \Delta S$ according to (4.5.32), we get

$$
\operatorname{Tr}(\delta X \delta S) = \operatorname{Tr}(X^{- 1 / 2} \Delta XX^{- 1 / 2} X^{1 / 2} \Delta SX^{1 / 2}) = \operatorname{Tr}(X^{- 1 / 2} \Delta X \Delta SX^{1 / 2}) = \operatorname{Tr}(\Delta X \Delta S),
$$

and the latter quantity is 0 due to $\Delta X = X^{1 / 2} \delta XX^{1 / 2} \in \mathcal{L}$ and $\Delta S = X^{- 1 / 2} \delta SX^{- 1 / 2} \in \mathcal{L}^{\perp}$ . Thus, the left hand side in (4.5.35) is $0;$ since $\phi_{ij} > 0, \psi_{ij} > 0$ , (4.5.35) implies that $\delta S = 0$ . But then $\delta X = 0$ in view of (4.5.34). Thus, the homogeneous version of (4.5.33) has the trivial solution only, so that (4.5.33) is solvable with a unique solution.

$4^{0}$ . Let δX, δS be the unique solution to (4.5.33), and let $\Delta X, \Delta S$ be linked to δX, δS according to (4.5.32). Our local goal is to bound from above the Frobenius norms of $\delta X$ and δS.

From (4.5.33.c) it follows (cf. derivation of (4.5.35)) that

$$
\begin{array}{rcl}(a) &(\delta X)_{ij} & = - \frac{\psi_{ij}}{\phi_{ij}}(\delta S)_{ij} + 2 \frac{\mu_{+} - x_{i} s_{i}}{\phi_{ii}} \delta_{ij}, i, j = 1,..., k; \\(b) &(\delta S)_{ij} & = - \frac{\phi_{ij}}{\psi_{ij}}(\delta X)_{ij} + 2 \frac{\mu_{+} - x_{i} s_{i}}{\psi_{ii}} \delta_{ij}, i, j = 1,..., k.\end{array}\tag{4.5.36}
$$

Same as in the concluding part of $3^{0}$ , relations (4.5.33.a − b) imply that

$$
\mathrm{Tr}(\Delta X \Delta S) = \mathrm{Tr}(\delta X \delta S) = \sum_{i, j}(\delta X)_{ij}(\delta S)_{ij} = 0.\tag{4.5.37}
$$

Multiplying (4.5.36.a) by $(\delta S)_{ij}$ and taking sum over $i, j$ , we get, in view of (4.5.37), the relation

$$
\sum_{i, j} \frac{\psi_{ij}}{\phi_{ij}}(\delta S)_{ij}^{2} = 2 \sum_{i} \frac{\mu_{+} - x_{i} s_{i}}{\phi_{ii}}(\delta S)_{ii};\tag{4.5.38}
$$

by “symmetric” reasoning, we get

$$
\sum_{i, j} \frac{\phi_{ij}}{\psi_{ij}}(\delta X)_{ij}^{2} = 2 \sum_{i} \frac{\mu_{+} - x_{i} s_{i}}{\psi_{ii}}(\delta X)_{ii}.\tag{4.5.39}
$$

Now let

$$
\theta_{i} = x_{i} s_{i},\tag{4.5.40}
$$

so that in view of (4.5.30) and (4.5.31) one has

$$
\begin{array}{cc}(a) & \sum_{i} \theta_{i} = k, \\(b) & \sum_{i}(\theta_{i} - 1)^{2} \leq \kappa^{2}.\end{array}\tag{4.5.41}
$$

Observe that

$$
\phi_{ij} = \sqrt{x_{i} x_{j}}(s_{i} + s_{j}) = \sqrt{x_{i} x_{j}} \left(\frac{\theta_{i}}{x_{i}} + \frac{\theta_{j}}{x_{j}}\right) = \theta_{j} \sqrt{\frac{x_{i}}{x_{j}}} + \theta_{i} \sqrt{\frac{x_{j}}{x_{i}}}.
$$

Thus,

$$
\begin{array}{rcl} \phi_{ij} & = & \theta_{j} \sqrt{\frac{x_{i}}{x_{j}}} + \theta_{i} \sqrt{\frac{x_{j}}{x_{i}}}, \\ \psi_{ij} & = & \sqrt{\frac{x_{i}}{x_{j}}} + \sqrt{\frac{x_{j}}{x_{i}}}; \end{array}\tag{4.5.42}
$$

since $1 - \kappa \leq \theta_{i} \leq 1 + \kappa$ by (4.5.41.b), we get

$$
1 - \kappa \leq \frac{\phi_{ij}}{\psi_{ij}} \leq 1 + \kappa.\tag{4.5.43}
$$

By the geometric-arithmetic mean inequality we have $\psi_{ij} \geq 2$ , whence in view of (4.5.43)

$$
\phi_{ij} \geq(1 - \kappa) \psi_{ij} \geq 2(1 - \kappa) \quad \forall i, j.\tag{4.5.44}
$$

We now have

$$
\begin{array}{rcl}(1 - \kappa) \sum_{i, j}(\delta X)_{ij}^{2} & \leq & \sum_{i, j} \frac{\phi_{ij}}{\psi_{ij}}(\delta X)_{ij}^{2} \\ & \leq & 2 \sum_{i} \frac{\mu_{+} - x_{i} s_{i}}{\psi_{ii}}(\delta X)_{ii} \\ & \leq & 2 \sqrt{\sum_{i}(\mu_{+} - x_{i} s_{i})^{2}} \sqrt{\sum_{i} \psi_{ii}^{- 2}(\delta X)_{ii}^{2}} \\ & \leq & \sqrt{\sum_{i}((1 - \theta_{i})^{2} - 2 \chi k^{- 1 / 2}(1 - \theta_{i}) + \chi^{2} k^{- 1})} \sqrt{\sum_{i, j}(\delta X)_{ij}^{2}} \\ & \leq & \sqrt{\chi^{2} + \sum_{i}(1 - \theta_{i})^{2}} \sqrt{\sum_{i, j}(\delta X)_{ij}^{2}} \\ & &[\text{since} \sum_{i}(1 - \theta_{i}) = 0 \text{by}(4.5.41.a)] \\ & \leq & \sqrt{\chi^{2} + \kappa^{2}} \sqrt{\sum_{i, j}(\delta X)_{ij}^{2}} \end{array}\tag{[see(4.5.41.b)]}
$$

and from the resulting inequality it follows that

$$
\| \delta X \|_{2} \leq \rho \equiv \frac{\sqrt{\chi^{2} + \kappa^{2}}}{1 - \kappa}.\tag{4.5.45}
$$

Similarly,

$$
\begin{array}{rcl}(1 + \kappa)^{- 1} \sum_{i, j}(\delta S)_{ij}^{2} & \leq & \sum_{i, j} \frac{\psi_{ij}}{\phi_{ij}}(\delta S)_{ij}^{2} \\ & &[\text{see (4.5.43)}] \\ & \leq & 2 \sum_{i} \frac{\mu_{+} - x_{i} s_{i}}{\phi_{ii}}(\delta S)_{ii} \\ & &[\text{see (4.5.38)}] \\ & \leq & 2 \sqrt{\sum_{i}(\mu_{+} - x_{i} s_{i})^{2}} \sqrt{\sum_{i} \phi_{ij}^{- 2}(\delta S)_{ii}^{2}} \\ & \leq &(1 - \kappa)^{- 1} \sqrt{\sum_{i}(\mu_{+} - \theta_{i})^{2}} \sqrt{\sum_{i, j}(\delta S)_{ij}^{2}} \\ & \leq &[\text{see (4.5.44)}] \\ & &[\text{same as above}] \end{array}
$$

## 4.5. TRACING THE CENTRAL PATH

and from the resulting inequality it follows that

$$
\| \delta S \|_{2} \leq \frac{(1 + \kappa) \sqrt{\chi^{2} + \kappa^{2}}}{1 - \kappa} =(1 + \kappa) \rho.\tag{4.5.46}
$$

$5^{0}$ . We are ready to prove $2^{0}.(i \mathrm{-} i i)$ . We have

$$
X_{+} = X + \Delta X = X^{1 / 2}(I + \delta X) X^{1 / 2},
$$

and the matrix $I + \delta X$ is positive definite due to (4.5.45) (indeed, the right hand side in (4.5.45) is $\rho \leq 1$ whence the Frobenius norm (and therefore - the maximum of moduli of eigenvalues) of $\delta X$ is less than 1). Note that by the just indicated reasons $I + \delta X \preceq(1 + \rho) I.$ , whence

$$
X_{+} \preceq(1 + \rho) X.\tag{4.5.47}
$$

Similarly, the matrix

$$
S_{+} = S + \Delta S = X^{- 1 / 2}(X^{1 / 2} SX^{1 / 2} + \delta S) X^{- 1 / 2}
$$

is positive definite. Indeed, the eigenvalues of the matrix $X^{1 / 2} SX^{1 / 2}$ are $\ge \operatorname{min}_{i} \theta_{i} \ge 1 - \kappa$ , while the moduli of eigenvalues of δS, by (4.5.46), do not exceed $\frac{(1 + \kappa) \sqrt{\chi^{2} + \kappa^{2}}}{1 - \kappa} < 1 - \kappa$ . Thus, the matrix $X^{1 / 2} SX^{1 / 2} + \delta S$ is positive definite, whence $S_{+}$ also is so. We have proved $2^{0}.(i)$

2<sup>0</sup>.(ii) is easy to verify. First, by (4.5.33), we have $\Delta X \in{\mathcal{L}}, \Delta S \in{\mathcal{L}}^{\bot}$ , and since $X \in \mathcal{L} - B$ $S \in{\mathcal{L}}^{\bot} + C$ , we have $X_{+} \in \mathcal{L} - B, S_{+} \in \mathcal{L}^{\perp} + C$ . Second, we have

$$
\begin{array}{rcl} \operatorname{Tr}(X_{+} S_{+}) & = & \operatorname{Tr}(XS + X \Delta S + \Delta XS + \Delta X \Delta S) \\ & = & \operatorname{Tr}(XS + X \Delta S + \Delta XS) \\ &[\text{since} & \operatorname{Tr}(\Delta X \Delta S) = 0 \text{due to} \Delta X \in \mathcal{L}, \Delta S \in \mathcal{L}^{\perp}] \\ & = & \mu_{+} k \\ &[\text{take the trace of both sides in (4.5.27.c)}] \end{array}
$$

$2^{0}.(\mathrm{ii})$ is proved.

$6^{0}$ . It remains to verify $2^{0}.(\mathrm{iii})$ . We should bound from above the quantity

$$
\Omega = \| \mu_{+}^{- 1} X_{+}^{1 / 2} S_{+} X_{+}^{1 / 2} - I \|_{2} = \| X_{+}^{1 / 2}(\mu_{+}^{- 1} S_{+} - X_{+}^{- 1}) X_{+}^{1 / 2} \|_{2},
$$

and our plan is first to bound from above the “close” quantity

$$
\begin{array}{rcl} \widehat{\Omega} = \| X^{1 / 2}(\mu_{+}^{- 1} S_{+} - X_{+}^{- 1}) X^{1 / 2} \|_{2} & = & \mu_{+}^{- 1} \| Z \|_{2}, \\ Z & = & X^{1 / 2}(S_{+} - \mu_{+} X_{+}^{- 1}) X^{1 / 2}, \end{array}\tag{4.5.48}
$$

and then to bound Ω in terms of $\widehat{\Omega}$

$6^{0}.1$ . Bounding Ω. We have

$$
\begin{array}{rcl} Z & = & X^{1 / 2}(S_{+} - \mu_{+} X_{+}^{- 1}) X^{1 / 2} \\ & = & X^{1 / 2}(S + \Delta S) X^{1 / 2} - \mu_{+} X^{1 / 2}[X + \Delta X]^{- 1} X^{1 / 2} \\ & = & XS + \delta S - \mu_{+} X^{1 / 2}[X^{1 / 2}(I + \delta X) X^{1 / 2}]^{- 1} X^{1 / 2} \\ & &[\text{see (4.5.32)}] \\ & = & XS + \delta S - \mu_{+}(I + \delta X)^{- 1} \\ & = & XS + \delta S - \mu_{+}(I - \delta X) - \mu_{+}[(I + \delta X)^{- 1} - I + \delta X] \\ & = & \underbrace{XS + \delta S + \delta X - \mu_{+} I}_{Z^{1}} + \underbrace{(\mu_{+} - 1) \delta X}_{Z^{2}} + \underbrace{\mu_{+}[I - \delta X -(I + \delta X)^{- 1}]}_{Z^{3}}, \end{array}
$$

so that

$$
\| Z \|_{2} \leq \| Z^{1} \|_{2} + \| Z^{2} \|_{2} + \| Z^{3} \|_{2}.\tag{4.5.49}
$$

We are about to bound separately all 3 terms in the right hand side of the latter inequality.

Bounding $\| Z^{2} \|_{2}$ : We have

$$
\| Z^{2} \|_{2} = | \mu_{+} - 1 | \| \delta X \|_{2} \leq \chi k^{- 1 / 2} \rho\tag{4.5.50}
$$

(see (4.5.45) and take into account that $\mu_{+} - 1 = - \chi k^{- 1 / 2})$

Bounding $\| Z^{3} \|_{2}{\mathrm{:}}$ Let $\lambda_{i}$ be the eigenvalues of $\delta X$ . We have

$$
\begin{array}{rcl} \| Z^{3} \|_{2} & = & \| \mu_{+}[(I + \delta X)^{- 1} - I + \delta X] \|_{2} \\ & \leq & \|(I + \delta X)^{- 1} - I + \delta X \|_{2} \\ & &[\text{since} | \mu_{+} | \leq 1] \\ & = & \sqrt{\sum_{i} \left(\frac{1}{1 + \lambda_{i}} - 1 + \lambda_{i}\right)^{2}} \\ & &[\text{pass to the orthonormal eigenbasis of} \delta X] \\ & = & \sqrt{\sum_{i} \frac{\lambda_{i}^{4}}{(1 + \lambda_{i})^{2}}} \\ & \leq & \sqrt{\sum_{i} \frac{\rho^{2} \lambda_{i}^{2}}{(1 - \rho)^{2}}} \\ &[\text{see(4.5.45)and note that} \sum_{i} \lambda_{i}^{2} = \| \delta X \|_{2}^{2} \leq \rho^{2}] \\ & \leq & \frac{\rho^{2}}{1 - \rho} \end{array}\tag{4.5.51}
$$

Bounding $\| Z^{1} \|_{2}{\mathrm{:}}$ : This is a bit more involving. We have

$$
\begin{array}{rcl} Z_{ij}^{1} & = &(XS)_{ij} +(\delta S)_{ij} +(\delta X)_{ij} - \mu_{+} \delta_{ij} \\ & = &(\delta X)_{ij} +(\delta S)_{ij} +(x_{i} s_{i} - \mu_{+}) \delta_{ij} \\ & = &(\delta X)_{ij} \left[1 - \frac{\phi_{ij}}{\psi_{ij}} \right] + \left[2 \frac{\mu_{+} - x_{i} s_{i}}{\psi_{ii}} + x_{i} s_{i} - \mu_{+} \right] \delta_{ij} \\ & &[\text{we have used (4.5.36.b)}] \\ & = &(\delta X)_{ij} \left[1 - \frac{\phi_{ij}}{\psi_{ij}} \right] \\ & &[\text{since \psi_{ii} = 2, see(4.5.42)}] \end{array}
$$

whence, in view of (4.5.43),

$$
| Z_{ij}^{1} | \leq \kappa |(\delta X)_{ij} |,
$$

so that

$$
\| Z^{1} \|_{2} \leq \kappa \| \delta X \|_{2} \leq \kappa \rho\tag{4.5.52}
$$

(the concluding inequality is given by (4.5.45)).

Assembling (4.5.50), (4.5.51), (4.5.52) and (4.5.49), we come to

$$
\| Z \|_{2} \leq \rho \left[\frac{\chi}{\sqrt{k}} + \frac{\rho}{1 - \rho} + \kappa \right],
$$

whence, by (4.5.48),

$$
\widehat{\Omega} \leq \frac{\rho}{1 - \chi k^{- 1 / 2}} \left[\frac{\chi}{\sqrt{k}} + \frac{\rho}{1 - \rho} + \kappa \right].\tag{4.5.53}
$$

## 6<sup>0</sup>.2. Bounding Ω. We have

$$
\begin{array}{rcl} \Omega^{2} & = & \| \mu_{+}^{- 1} X_{+}^{1 / 2} S_{+} X_{+}^{1 / 2} - I \|_{2}^{2} \\ & = & \| X_{+}^{1 / 2} \underbrace{[\mu_{+}^{- 1} S_{+} - X_{+}^{- 1}]}_{\Theta = \Theta^{T}} X_{+}^{1 / 2} \|_{2}^{2} \\ & = & \mathrm{Tr} \left(X_{+}^{1 / 2} \Theta X_{+} \Theta X_{+}^{1 / 2}\right) \\ & \leq &(1 + \rho) \mathrm{Tr} \left(X_{+}^{1 / 2} \Theta X \Theta X_{+}^{1 / 2}\right) \\ & &[\mathrm{see(4.5.47)}] \\ & = &(1 + \rho) \mathrm{Tr} \left(X_{+}^{1 / 2} \Theta X^{1 / 2} X^{1 / 2} \Theta X_{+}^{1 / 2}\right) \\ & = &(1 + \rho) \mathrm{Tr} \left(X^{1 / 2} \Theta X_{+}^{1 / 2} X_{+}^{1 / 2} \Theta X^{1 / 2}\right) \\ & = &(1 + \rho) \mathrm{Tr} \left(X^{1 / 2} \Theta X_{+} \Theta X^{1 / 2}\right) \\ & \leq &(1 + \rho)^{2} \mathrm{Tr} \left(X^{1 / 2} \Theta X \Theta X^{1 / 2}\right) \\ & &[\mathrm{thesame(4.5.47)}] \\ & = &(1 + \rho)^{2} \| X^{1 / 2} \Theta X^{1 / 2} \|_{2}^{2} \\ & = &(1 + \rho)^{2} \| X^{1 / 2}[\mu_{+}^{- 1} S_{+} - X_{+}^{- 1}] X^{1 / 2} \|_{2}^{2} \\ & = &(1 + \rho)^{2} \widehat{\Omega}^{2} \end{array}
$$

so that

$$
\begin{array}{c} \Omega \leq(1 + \rho) \widehat{\Omega} = \frac{\rho(1 + \rho)}{1 - \chi k^{- 1 / 2}} \left[\frac{\chi}{\sqrt{k}} + \frac{\rho}{1 - \rho} + \kappa \right], \\ \rho = \frac{\sqrt{\chi^{2} + \kappa^{2}}}{1 - \kappa}.\end{array}\tag{4.5.54}
$$

(see (4.5.53) and (4.5.45)).

It is immediately seen that if $0 < \chi \leq \kappa \leq 0.1$ , the right hand side in the resulting bound for Ω is $\leq \kappa,$ as required in $2^{0}.(\mathrm{iii})$ ✷

Remark 4.5.2 We have carried out the complexity analysis for a large group of primal-dual path-following methods for SDP (i.e., for the case of ${\bf K} ={\bf S}_{+}^{k})$ . In fact, the constructions and the analysis we have presented can be word by word extended to the case when K is a direct product of semidefinite cones – you just should bear in mind that all symmetric matrices we deal with, like the primal and the dual solutions X, S, the scaling matrices $Q,$ the primal-dual search directions $\Delta X, \Delta S,{\mathrm{etc.}}$ , are block-diagonal with common block-diagonal structure. In particular, our constructions and analysis work for the case of LP – this is the case when K is a direct product of one-dimensional semidefinite cones. Note that in the case of LP Zhang’s family of primal-dual search directions reduces to a single direction: since now X, S, $Q$ are diagonal matrices, the scaling (4.5.17) 7→ (4.5.18) does not vary the equations of augmented complementary slackness.

The recipe to translate all we have presented for the case of SDP to the case of LP is very simple: in the above text, you should assume all matrices like $X, S, \ldots$ to be diagonal and look what the operations with these matrices required by the description of the method do with their diagonals. By the way, one of the very first approaches to the design and the analysis of IP methods for SDP was exactly opposite: you take an IP scheme for $\mathrm{LP},$ replace in its description the words “nonnegative vectors” with “positive semidefinite diagonal matrices” and then erase the adjective “diagonal”.

## 4.6 Complexity bounds for LP, CQP, SDP

In what follows we list the best known so far complexity bounds for LP, CQP and SDP. These bounds are yielded by IP methods and, essentially, say that the Newton complexity of finding $\epsilon$-solution to an instance – the total $\#$ of steps of a “good” IP algorithm before an $\epsilon$-solution is found – is $\begin{array}{r}{O(1) \sqrt{\theta(K)} \ln \frac{1}{\epsilon}} \end{array}$ . This is what should be expected in view of discussion in Section 4.5.2; note, however, that the complexity bounds to follow take into account the necessity to “reach the highway” – to come close to the central path before tracing it, while in Section 4.5.2 we were focusing on how fast could we reduce the duality gap after the central path (“the highway”) is reached.

Along with complexity bounds expressed in terms of the Newton complexity, we present the bounds on the number of operations of Real Arithmetic required to build an $\epsilon$-solution. Note that these latter bounds typically are conservative – when deriving them, we assume the data of an instance “completely unstructured”, which is usually not the case (cf. Warning in Section 4.5.2); exploiting structure of the data, one usually can reduce significantly computational efort per step of an IP method and consequently – the arithmetic cost of $\epsilon$-solution.

## 4.6.1 Complexity of $\mathcal{LP}_{b}$

Family of problems:

Problem instance: a program

$$
\min_{x} \left\{c^{T} x: a_{i}^{T} x \leq b_{i}, i = 1, \dots, m; \| x \|_{2} \leq R \right\}[x \in \mathbb{R}^{n}];\tag{p}
$$

Data:

$$
\begin{array}{l} \operatorname{Data}(p) =[m; n; c; a_{1}, b_{1}; \dots; a_{m}, b_{m}; R], \\ \operatorname{Size}(p) = \dim \operatorname{Data}(p) =(m + 1)(n + 1) + 2.\end{array}
$$

$\epsilon$-solution: an $\boldsymbol{x} \in \mathbb{R}^{n}$ such that

$$
\begin{array}{rcl} \| x \|_{\infty} & \leq & R, \\ a_{i}^{T} x & \leq & b_{i} + \epsilon, i = 1, \dots, m, \\ c^{T} x & \leq & \operatorname{Opt}(p) + \epsilon \end{array}
$$

(as always, the optimal value of an infeasible problem is +∞).

Newton complexity of $\epsilon$-solution: <sup>14)</sup>

$$
\mathrm{Compl}^{\mathrm{Nwt}}(p, \epsilon) = O(1) \sqrt{m + n} \mathrm{Digits}(p, \epsilon),
$$

where

$$
\operatorname{Digits}(p, \epsilon) = \ln \left(\frac{\operatorname{Size}(p) + \| \operatorname{Data}(p) \|_{1} + \epsilon^{2}}{\epsilon}\right)
$$

is the number of accuracy digits in $\epsilon$-solution, see Section 4.1.2.

Arithmetic complexity of $\epsilon$-solution:

$$
\operatorname{Compl}(p, \epsilon) = O(1)(m + n)^{3 / 2} n^{2} \text{Digits}(p, \epsilon).
$$

## 4.6.2 Complexity of $\mathcal{CQP}_{b}$

Family of problems:

Problem instance: a program

$$
\min_{x} \left\{c^{T} x: \| A_{i} x + b_{i} \|_{2} \leq c_{i}^{T} x + d_{i}, i = 1,..., m; \| x \|_{2} \leq R \right\} \quad \left[\begin{array}{l} x \in \mathbb{R}^{n} \\ b_{i} \in \mathbb{R}^{k_{i}} \end{array} \right]\tag{p}
$$

Data:

$$
\begin{array}{l} \operatorname{Data}(P) =[m; n; k_{1}, \dots, k_{m}; c; A_{1}, b_{1}, c_{1}, d_{1}; \dots; A_{m}, b_{m}, c_{m}, d_{m}; R], \\ \operatorname{Size}(p) = \dim \operatorname{Data}(p) =(m + \sum_{i = 1}^{m} k_{i})(n + 1) + m + n + 3.\end{array}
$$

$\epsilon$-solution: an $\boldsymbol{x} \in \mathbb{R}^{n}$ such that

$$
\begin{array}{rcl} \| x \|_{2} & \leq & R, \\ \| A_{i} x + b_{i} \|_{2} & \leq & c_{i}^{T} x + d_{i} + \epsilon, i = 1,..., m, \\ c^{T} x & \leq & \mathrm{Opt}(p) + \epsilon.\end{array}
$$

Newton complexity of $\epsilon$-solution:

$$
\mathrm{Compl}^{\mathrm{Nwt}}(p, \epsilon) = O(1) \sqrt{m + 1} \mathrm{Digits}(p, \epsilon).
$$

Arithmetic complexity of $\epsilon$-solution:

$$
\operatorname{Compl}(p, \epsilon) = O(1)(m + 1)^{1 / 2} n(n^{2} + m + \sum_{i = 0}^{m} k_{i}^{2}) \text{Digits}(p, \epsilon).
$$

## 4.6.3 Complexity of $SDP_{b}$

Family of problems:

Problem instance: a program

$$
\min_{x} \left\{c^{T} x: A_{0} + \sum_{j = 1}^{n} x_{j} A_{j} \succeq 0, \| x \|_{2} \leq R \right\}[x \in \mathbb{R}^{n}],\tag{p}
$$

where $A_{j}, j = 0, 1,..., n$ , are symmetric block-diagonal matrices with m diagonal blocks $A_{j}^{(i)}$ of sizes $k_{i} \times k_{i}, i = 1,..., m$

Data:

$$
\mathrm{Data}(p) =[m; n; k_{1}, \dots k_{m}; c; A_{0}^{(1)}, \dots, A_{0}^{(m)}; \dots; A_{n}^{(1)}, \dots, A_{n}^{(m)}; R],
$$

$$
\mathrm{Size}(p) = \dim \mathrm{Data}(P) = \left(\sum_{i = 1}^{m} \frac{k_{i}(k_{i} + 1)}{2}\right)(n + 1) + m + n + 3.
$$

$\epsilon$-solution: an x such that

$$
\begin{array}{rcl} \| x \|_{2} & \leq & R, \\ A_{0} + \sum_{j = 1}^{n} x_{j} A_{j} & \succeq & - \epsilon I, \\ c^{T} x & \leq & \mathrm{Opt}(p) + \epsilon.\end{array}
$$

Newton complexity of $\epsilon$-solution:

$$
\mathrm{Compl}^{\mathrm{Nwt}}(p, \epsilon) = O(1)(1 + \sum_{i = 1}^{m} k_{i})^{1 / 2} \mathrm{Digits}(p, \epsilon).
$$

Arithmetic complexity of $\epsilon$-solution:

$$
\operatorname{Compl}(p, \epsilon) = O(1)(1 + \sum_{i = 1}^{m} k_{i})^{1 / 2} n(n^{2} + n \sum_{i = 1}^{m} k_{i}^{2} + \sum_{i = 1}^{m} k_{i}^{3}) \mathrm{Digits}(p, \epsilon).
$$

## 4.7 Concluding remarks

We have discussed IP methods for LP, CQP and SDP as “mathematical animals”, with emphasis on the ideas underlying the algorithms and on the theoretical complexity bounds ensured by the methods. Now it is time to say a couple of words on software implementations of IP algorithms and on practical performance of the resulting codes.

As far as the performance of recent IP software is concerned, the situation heavily depends on whether we are speaking about codes for LP, or those for CQP and SDP.

- There exists extremely powerful commercial IP software for LP, capable to handle reliably really large-scale LP’s and quite competitive with the best Simplex-type codes for Linear Programming. E.g., one of the best modern LP solvers – CPLEX – allows user to choose between a Simplex-type and IP modes of execution, and in many cases the second option reduces the running time by orders of magnitudes. With a state-of-the-art computer, CPLEX is capable to solve routinely real-world LP’s with tens and hundreds thousands of variables and constraints; in the case of favourable structured constraint matrices, the numbers of variables and constraints can become as large as few millions.

- There already exists a very powerful commercial software for CQP – MOSEK (Erling Andersen, http://www.mosek.com). I would say that as far as LP (and even mixed integer programming) are concerned, MOSEK compares favourable to CPLEX, and it allows to solve really large CQP’s of favourable structure.

- For the time being, IP software for SDP’s is not as well-polished, reliable and powerful as the LP one. I would say that the codes available for the moment are capable to solve SDP’s with no more than 1,000 – 1,500 design variables.

There are two groups of reasons making the power of SDP software available for the moment that inferior as compared to the capabilities of interior point LP and CQP solvers – the “historical” and the “intrinsic” ones. The “historical” aspect is simple: the development of IP software for LP, on one hand, and for SDP, on the other, has started, respectively, in the mid-eighties and the mid-nineties; for the time being (2002), this is definitely a diference. Well, being too young is the only shortcoming which for sure passes away... Unfortunately, there are intrinsic problems with IP algorithms for large-scale (many thousands of variables) SDP’s. Recall that the influence of the size of an SDP/CQP program on the complexity of its solving by an IP method is twofold:

– first, the size afects the Newton complexity of the process. Theoretically, the number of steps required to reduce the duality gap by a constant factor, say, factor 2, is proportional to $\sqrt{\theta(K)} \(\theta(K)$ is twice the total $\#$ of conic quadratic inequalities for $\mathrm{CQP}$ and the total row size of LMI’s for SDP). Thus, we could expect an unpleasant growth of the iteration count with $\theta(K)$ . Fortunately, the iteration count for good IP methods usually is much less than the one given by the worst-case complexity analysis and is typically about few tens, independently of $\theta(K)$

– second, the larger is the instance, the larger is the system of linear equations one should solve to generate new primal (or primal-dual) search direction, and, consequently, the larger is the computational efort per step (this efort is dominated by the necessity to assemble and to solve the linear system). Now, the system to be solved depends, of course, on what is the IP method we are speaking about, but it newer is simpler (and for most of the methods, is not more complicated as well) than the system (4.5.8) arising in the primal path-following method:

$$
\underbrace{\mathcal{A}^{*}[\nabla^{2} K(\bar{X})] \mathcal{A}}_{\mathcal{H}} \Delta x = \underbrace{-[t_{+} c + \mathcal{A}^{*} \nabla K(\bar{X})]}_{h}.\tag{Nwt}
$$

The size n of this system is exactly the design dimension of problem (CP).

In order to process (Nwt), one should assemble the system (compute H and h) and then solve it. Whatever is the cost of assembling (Nwt), you should be able to store the resulting matrix H in memory and to factorize the matrix in order to get the solution. Both these problems – storing and factorizing H – become prohibitively expensive when H is a large $\mathrm{{\underline{{dense}}}^{15)}}$ matrix. (Think how happy you will be with the necessity to store $\textstyle \frac{5000 \times 5001}{2} = 12, 502, 500$ reals representing a dense $5000 \times 5000$ symmetric matrix H and with the necessity to perform $\textstyle \approx{\frac{5000^{3}}{6}} \approx 2.08 \times 10^{10}$ arithmetic operations to find its Choleski factor).

The necessity to assemble and to solve large-scale systems of linear equations is intrinsic for IP methods as applied to large-scale optimization programs, and in this respect there is no diference between $\mathrm{LP}$ and CQP, on one hand, and SDP, on the other hand. The diference is in how dificult is to handle these large-scale linear systems. In real life $\mathrm{LP "_{s -} CQP "_{s -} SDP "_{s}}$ , the structure of the data allows to assemble (Nwt) at a cost negligibly small as compared to the cost of factorizing H, which is a good news. Another good news is that in typical real world $\mathrm{LP}{\mathrm{{s}}},$ and to some extent for real-world $\mathrm{CQPs}.$ , H turns out to be “very well-structured”, which reduces dramatically the expenses required by factorizing the matrix and storing the Cholesk factor. All practical IP solvers for LP and CQP utilize these favourable properties of real life problems, and this is where their ability to solve problems with tens/hundreds thousands of variables and constraints comes from. Spoil the structure of the problem – and an IP method will be unable to solve an LP with just few thousands of variables. Now, in contrast to real life $\mathrm{LP}{\mathrm{{s}}}$ and $\mathrm{CQP^{\bullet} s}$ , real life $\mathrm{SDPs}$ typically result in dense matrices H, and this is where severe limitations on the sizes of “tractable in practice” SDP’s come from. In this respect, real life $\mathrm{CQP^{\bullet} s}$ are somewhere in-between $\mathrm{LP}{\mathrm{{s}}}$ and $\mathrm{SDPs}$ , so that the sizes of “tractable in practice” $\mathrm{CQP^{\bullet} s}$ could be significantly larger than in the case of $\mathrm{SDPs}$

It should be mentioned that assembling matrices of the linear systems we are interested in and solving these systems by the standard Linear Algebra techniques is not the only possible way to implement an IP method. Another option is to solve these linear systems by iterative methods. With this approach, all we need to solve a system like (Nwt) is a possibility to multiply a given vector by the matrix of the system, and this does not require assembling and storing in memory the matrix itself. $\mathrm{E.g.}$ , to multiply a vector $\Delta x$ by H, we can use the multiplicative representation of $\mathcal{H}$ as presented in (Nwt). Theoretically, the outlined iterative schemes, as applied to real life $\mathrm{SDP^{\prime} s},$ allow to reduce by orders of magnitudes the arithmetic cost of building search directions and to avoid the necessity to assemble and store huge dense matrices, which is an extremely attractive opportunity. The dificulty, however, is that the iterative schemes are much more afected by rounding errors that the usual Linear Algebra techniques; as a result, for the time being “iterative-Linear-Algebra-based” implementation of IP methods is no more than a challenging goal.

Although the sizes of $\mathrm{SDPs}$ which can be solved with the existing codes are not that impressive as those of $\mathrm{LP}{s},$ the possibilities ofered to a practitioner by SDP IP methods could hardly be overestimated. Just ten years ago we could not even dream of solving an SDP with more than few tens of variables, while today we can solve routinely 20-25 times larger $\mathrm{SDP}{\mathrm{{s}}}$ and we have all reasons to believe in further significant progress in this direction.

## 4.8 Exercises for Lecture 4

Solutions to exercises/parts of exercises colored in cyan can be found in section 6.4.

## 4.8.1 Around canonical barriers

Exercise 4.1 Prove that the canonical barrier for the Lorentz cone is strongly convex.

Hint: Rewrite the barrier equivalently as

$$
L_{k}(x) = - \ln \left(t - \frac{x^{T} x}{t}\right) - \ln t
$$

and use the fact that the function $\begin{array}{r}{t \mathrm{~ - ~} \frac{x^{T} x}{t}} \end{array}$ is concave in (x, t).

## Exercise 4.2 Prove Proposition $4.3.2.$

Hint: Note that the property to be proved is “stable w.r.t. taking direct products”, so that it sufices to verify it in the cases of $\mathbf{K} = \mathbf{S}_{+}^{k}$ ; to end, you can use (4.3.1).

Exercise 4.3 Let K be a direct product of Lorentz and semidefinite cones, and let $K(\cdot)$ be the canonical barrier for K. Prove that whenever $X \in$ int K and $S = - \nabla K(X)$ , the matrices $\nabla^{2} K(X)$ and $\nabla^{2} K(S)$ are inverses of each other.

Hint: Diferentiate the identity

$$
- \nabla K(- \nabla K(X)) = X
$$

given by Proposition 4.3.2.

## 4.8.2 Scalings of canonical cones

We already know that the semidefinite cone $\mathbf{S}_{+}^{k}$ is “highly symmetric”: given two interior points $X, X^{\prime}$ of the cone, there exists a symmetry of $\mathbf{S}_{+}^{k} - \mathrm{an}$ Affine transformation of the space where the cone lives – which maps the cone onto itself and maps X onto $X^{\prime}$ . The Lorentz cone possesses the same properties, and its symmetries are Lorentz transformations. Writing vectors from $\mathbb{R}^{k}$ as $x ={\binom{u}{t}}$ with $u \in \mathbb{R}^{k - 1}, \t \in \mathbb{R}$ , we can write down a Lorentz transformation as

$$
\binom{u}{t} \mapsto \alpha \binom{U \left[u -[\mu t -(\sqrt{1 + \mu^{2}} - 1) e^{T} u] e \right]}{\sqrt{1 + \mu^{2}} t - \mu e^{T} u}\tag{LT}
$$

Here $\alpha > 0, \mu \in{\bf R}, e \in{\bf R}^{k - 1}, e^{T} e = 1$ , and an orthogonal $k \times k$ matrix $U$ are the parameters of the transformation.

The first question is whether (LT) is indeed a symmetry of ${\bf L}^{k}$ . Note that (LT) is the product of three linear mappings: we first act on vector $x ={\binom{u}{t}}$ by the special Lorentz transformation

$$
L_{\mu, e}: \quad \binom{u}{t} \mapsto \binom{u -[\mu t -(\sqrt{1 + \mu^{2}} - 1) e^{T} u] e}{\sqrt{1 + \mu^{2}} t - \mu e^{T} u}\tag{*}
$$

then $\mathrm{^{66} rotate^{99}}$ the result by U around the t-axis, and finally multiply the result by $\alpha > 0$ . The second and the third transformations clearly map the Lorentz cone onto itself. Thus, in order to verify that the transformation (LT) maps $\mathbf{L}^{\dot{k}}$ onto itself, it sufices to establish the same property for the transformation (∗).

## Exercise 4.4 Prove that

1) Whenever $e \in \mathbb{R}^{k - 1}$ is a unit vector and $\mu \in \mathbb{R}$ , the linear transformation $(*)$ maps the cone ${\bf L}^{k}$ onto itself. Moreover, transformation (∗) preserves the “space-time interval $v_{~ x} T_{J_{k} x} \equiv$ $- x_{1}^{2} -...- x_{k - 1}^{2} + x_{k}^{2}$ :

$$
[L_{\mu, e} x]^{T} J_{k}[L_{\mu, e} x] = x^{T} J_{k} x \quad \forall x \in \mathbb{R}^{k}
$$

$$
[\Leftrightarrow L_{\mu, e}^{T} J_{k} L_{\mu, e} = J_{k}]
$$

and $L_{\mu, e}^{- 1} = L_{\mu, - e}.$

2) Given a point ${\bar{x}} \equiv{\binom{\bar{u}}{\bar{t}}} \in \operatorname{int} \mathbf{L}^{k}$ and specifying a unit vector e and a real $\mu$ according to

$$
\begin{array}{r} \bar{u} = \| \bar{u} \|_{2} e, \\ \mu = \frac{\| \bar{u} \|_{2}}{\sqrt{\bar{t}^{2} - \bar{u}^{T} \bar{u}}}, \end{array}
$$

the resulting special Lorentz transformation $\scriptstyle L_{\mu, e}$ maps x¯ onto the point $\left(\begin{array}{c}{{0_{k - 1}}} \\{{\sqrt{t^{2} -{\bar{u}}^{T}{\bar{u}}}}} \end{array} \right)$ on the “axis” $\mathrm{~ ~ \xi ~}_{\mathrm{{f}}} x = \left(\begin{array}{c}{{0_{k - 1}}} \\{{\tau}} \end{array} \right) \mathrm{~ ~ \lvert ~ \tau ~}_{\geq} 0\}$ of the cone ${\bf L}^{k}$ . Consequently, the transformation $\sqrt{\frac{2}{\bar{t}^{2} - \bar{u}^{T} \bar{u}}} L_{\mu, e}$ maps x¯ onto the “central point” $e({\bf L}^{k}) = \left(\begin{array}{c}{{0_{k - 1}}} \\{{\sqrt{2}}} \end{array} \right)$ of the axis – the point where $\nabla^{2} L_{k}(\cdot)$ is the unit matrix.

By Exercise 4.4, given two points $x^{\prime}, x^{\prime \prime} \in \operatorname{int} \mathbf{L}^{k}$ , we can find two symmetries L<sup>0</sup>, $L^{\prime \prime}$ of ${\bf L}^{k}$ such that $L^{\prime} x^{\prime} = e(\mathbf{L}^{k}), L^{\prime \prime} x^{\prime \prime} = e(\mathbf{L}^{k})$ , so that the linear mapping $(L^{\prime \prime})^{- 1} L^{\prime}$ which is a symmetry of L since both $L^{\prime}, L^{\prime \prime}$ are, maps $x^{\prime}$ onto $x^{\prime \prime}$ . In fact the product $(L^{\prime \prime})^{- 1} L^{\prime}$ is again a Lorentz transformation – these transformations form a subgroup in the group of all linear transformations of $\mathbb{R}^{k}$

The importance of Lorentz transformations for us comes from the following fact:

Proposition 4.8.1 The canonical barrier $L_{k}(x) = - \ln(x^{T} J_{k} x)$ of the Lorentz cone is semi-invariant w.r.t. Lorentz transformations: if L is such a transformation, then

$$
L_{k}(Lx) = L_{k}(x) + \operatorname{const}(L).
$$

## Exercise 4.5 Prove Proposition 4.8.1.

As it was explained, the semidefinite cone $\mathbf{S}_{+}^{k}$ also possesses a rich group of symmetries (which here are of the form $X \mapsto HXH^{T}$ , DetH $\neq 0)$ ; as in the case of the Lorentz cone, “richness” means that there are enough symmetries to map any interior point of $\mathbf{S}_{+}^{k}$ onto any other interior point of the cone. Recall also that the canonical barrier for the semidefinite cone is semi-invariant w.r.t. these symmetries.

Since our “basic components” ${\bf L}^{k}$ and $\mathbf{S}_{+}^{k}$ possess rich groups of symmetries, so are all canonical cones – those which are direct products of the Lorentz and the semidefinite ones. Given such a cone

$$
\mathbf{K} = \mathbf{S}_{+}^{k_{1}} \times \dots \times \mathbf{S}_{+}^{k_{p}} \times \mathbf{L}^{k_{p + 1}} \times \dots \times \mathbf{L}^{k_{m}} \subset E = \mathbf{S}^{k_{1}} \times \dots \times \mathbf{S}^{k_{p}} \times \mathbb{R}^{k_{p + 1}} \times \dots \times \mathbb{R}^{k_{m}}.\tag{Cone}
$$

let us call a scaling of K a linear transformation $\mathcal{Q}$ of E such that

$$
\mathcal{Q} \left(\begin{array}{c} X_{1} \\...\\ X_{m} \end{array} \right) = \left(\begin{array}{c} \mathcal{Q}_{1} X_{1} \\...\\ \mathcal{Q}_{m} X_{m} \end{array} \right)
$$

and every $\mathcal{Q}_{i}$ is either a Lorentz transformation, if the corresponding direct factor of K is a Lorentz cone (in our notation this is the case when $i > p)$ , or a “semidefinite scaling” $\mathcal{Q}_{i} X_{i} =$ $H_{i} X_{i} H_{i}^{T}$ , Det $H_{i} \neq 0$ , if the corresponding direct factor of K is the semidefinite cone (i.e., if $i \leq p)$

## Exercise 4.6 Prove that

1) $If \ \mathcal{Q}$ is a scaling of the cone K, then $\mathcal{Q}$ is a symmetry of K, i.e., it maps K onto itself, and the canonical barrier $K(\cdot)$ of K is semi-invariant w.r.t. Q:

$$
K(\mathcal{Q} X) = K(X) + \operatorname{const}(\mathcal{Q}).
$$

2) For every pair $X^{\prime}, X^{\prime \prime}$ of interior point of K, there exists a scaling $\mathcal{Q}$ of K which maps $X^{\prime}$ onto $X^{\prime \prime}$ . In particular, for every point $X \in$ int K there exists a scaling $\mathcal{Q}$ which maps X onto the “central point” e(K) of K defined as

$$
e(\mathbf{K}) = \left(\begin{array}{c} I_{k_{1}} \\ \dots \\ I_{k_{p}} \\ \binom{0_{k_{p + 1} - 1}}{\sqrt{2}} \\ \dots \\ \binom{0_{k_{m} - 1}}{\sqrt{2}} \end{array} \right)
$$

where the Hessian of $K(\cdot)$ is the unit matrix:

$$
\langle[\nabla^{2} K(e(\mathbf{K}))] X, Y \rangle_{E} = \langle X, Y \rangle_{E}.
$$

Those readers who passed through Section 4.5.4 may guess that scalings play a key role in the LP-CQP-SDP interior point constructions and proofs. The reason is simple: in order to realize what happens with canonical barriers and related entities, like central paths, etc., at certain interior point X of the cone K in question, we apply an appropriate scaling to convert our point into a “simple” one, such as the central point $e(\mathbf{K})$ of the cone K, and look what happens at this simple-to-analyze point. We then use the semi-invariance of canonical barriers w.r.t. scalings to ”transfer” our conclusions to the original case of interest. Let us look at a couple of instructive examples.

## 4.8.3 The Dikin ellipsoid

Let K be a canonical cone, i.e., a direct product of the Lorentz and the semidefinite cones, E be the space where K lives (see (Cone)), and $K(\cdot)$ be the canonical barrier for K. Given $X \in$ int K, we can define a “local Euclidean norm”

$$
\| H \|_{X} = \sqrt{\langle[\nabla^{2} K(X)] H, H \rangle_{E}}
$$

on $E.$

Exercise 4.7 Prove that $\| \cdot \|_{X}$ “conforms” with scalings: $ifX$ is an interior point of K and Q is a scaling of K, then

$$
\| \mathcal{Q} H \|_{\mathcal{Q} X} = \| H \|_{X} \quad \forall H \in E \forall X \in \operatorname{int} \mathbf{K}.
$$

In other words, if $X \in$ int K and $Y \in E$ , then the $\| \cdot \|_{X}$ -distance between X and Y equals to the $\| \cdot \|_{\mathcal{Q} X}$ -distance between QX and QY .

Hint: Use the semi-invariance of $K(\cdot)$ w.r.t. Q to show that

$$
D^{k} K(\mathcal{Q} X)[\mathcal{Q} H_{1}, \dots, \mathcal{Q} H_{k}] = D^{k} K(X)[H_{1}, \dots, H_{k}].
$$

and then set $k = 2, H_{1} = H_{2} = H$

Exercise 4.8 For $X \in$ int K, the Dikin ellipsoid of the point X is defined as the set

$$
W_{X} = \left\{Y \mid \| Y - X \|_{X} \leq 1 \right\}
$$

Prove that $W_{X} \subset \mathbf{K}$

Hint: Note that the property to be proved is “stable w.r.t. taking direct products”, so that it sufices to verify it in the cases of ${\bf K} ={\bf L}^{k}$ and $\mathbf{K} = \mathbf{S}_{+}^{k}$ . Further, use the result of Exercise $4.7$ to verify that the Dikin ellipsoid “conforms with scalings”: the image of $W_{X}$ under a scaling Q is exactly $W_{\Omega X}$ . Use this observation to reduce the general case to the one where $X = e(\mathbf{K})$ is the central point of the cone in question, and verify straightforwardly that $W_{e(\mathbf{K})} \subset \mathbf{K}$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/df7cdd8348e2a48a3192e1b1efda7e4ae299ef5e45774ed24846a2c03d66dc70.jpg)  
A 2D cross-section of S<sup>3</sup> and cross-sections of 3 Dikin ellipsoids  
Figure 4.3: Dikin ellipsoids

According to Exercise 4.8, the Dikin ellipsoid of a point X ∈ int K is contained in K; in other words, the distance from X to the boundary of K, measured in the $\| \cdot \|_{X^{-}} norm,$ , is not too small (it is at least 1). Can this distance be too large? The answer is $^{66} \mathrm{no}^{99} \mathrm{~ - ~}$ the $\theta(K)$ -enlargement of the Dikin ellipsoid contains a “significant” part of the boundary of K. Specifically, given $X \in \operatorname{int} \mathbf{K}$ , let us look at the vector $- \nabla K(X)$ . By Proposition 4.3.2, this vector belongs to the interior of K, and since K is self-dual, it means that the vector has positive inner products with all nonzero vectors from K. It follows that the set (called a “conic cap”)

$$
\mathbf{K}_{X} = \left\{Y \in \mathbf{K} \mid \langle - \nabla K(X), X - Y \rangle_{E} \geq 0 \right\}
$$

– the part of K “below” the Affine hyperplane which is tangent to the level surface of $K(\cdot)$ passing through X – is a convex compact subset of K which contains an intersection of K and a small ball centered at the origin, see Fig. 4.4.

Exercise 4.9 Let X ∈ int K. Prove that

1) The conic cap $\mathbf{K}_{X}$ “conforms with scalings”: if Q is a scaling of K, then ${\mathcal{Q}}(\mathbf{K}_{X}) = \mathbf{K}_{{\mathcal{Q}} X}$

Hint: From the semi-invariance of the canonical barrier w.r.t. scalings it is clear that the image, under a scaling, of the hyperplane tangent to a level surface of K is again a hyperplane tangent to (perhaps, another) level surface of K.

2) Whenever $Y \in \mathbf{K}$ , one has

$$
\langle \nabla K(X), Y - X \rangle_{E} \leq \theta(K).
$$

3) X is orthogonal to the hyperplane $\{H \mid \langle \nabla K(X), H \rangle_{E} = 0\}$ in the local Euclidean structure associated with X, i.e.,

$$
\langle \nabla K(X), H \rangle_{E} = 0 \Leftrightarrow \langle[\nabla^{2} K(X)] X, H \rangle_{E} = 0.
$$

![Figure 4.4](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/43c67a94d99c86510d19f46ebfbeb555aab736df2653f23f23601bfe43c6f522.jpg)  
Figure 4.4: Conic cap of ${\bf L}^{3}$ associated with $X =[0.3; 0; 1]$

4) The conic cap $\mathbf{K}_{X}$ is contained in the $\| \cdot \|_{X} - ball$ centered at $X$ , with the radius $\theta(K)$ :

$$
Y \in \mathbf{K}_{X} \Rightarrow \| Y - X \|_{X} \leq \theta(K).
$$

Hint to 2-4): Use 1) to reduce the situation to the one where X is the central point of K.

## 4.8.4 More on canonical barriers

Equipped with scalings, we can establish two additional useful properties of canonical barriers. Let K be a canonical cone, and $K(\cdot)$ be the associated canonical barrier.

Exercise 4.10 Prove that if $X \in$ int K, then

$$
\max \{\langle \nabla K(X), H \rangle_{E} \mid \| H \|_{X} \leq 1\} \leq \sqrt{\theta(K)}.
$$

Hint: Verify that the statement to be proved is “scaling invariant”, so that it sufices to prove it in the particular case when X is the central point $e(\mathbf{K})$ of the canonical cone K. To verify the statement in this particular case, use Proposition 4.3.1.

Exercise 4.11 Prove that $ifX \in$ int K and ${\cal H} \in{\bf K},{\cal H} \ne 0$ , then

$$
\langle \nabla K(X), H \rangle_{E} < 0
$$

and

$$
\inf_{t \geq 0} K(X + tH) = - \infty.
$$

Derive from the second statement that

Proposition 4.8.2 If N is an Affine plane which intersects the interior of K, then K is bounded below on the intersection N ∩ K if and only if the intersection is bounded.

Hint: The first statement is an immediate corollary of Proposition 4.3.2. To prove the second fact, observe first that it is “scaling invariant”, so that it sufices to verify it in the case when X is the central point of K, and then carry out the required verification.

## 4.8.5 Around the primal path-following method

We have seen that the primal path-following method (Section 4.5.3) is a “strange” entity: it is a purely primal process for solving conic problem

$$
\min_{x} \left\{c^{T} x: X \equiv \mathcal{A} x - B \in \mathbf{K} \right\},\tag{CP}
$$

where K is a canonical cone, which iterates the updating

$$
X \mapsto X_{+} = X - \mathcal{A} \underbrace{[\mathcal{A}^{*}[\nabla^{2} K(X)] \mathcal{A}]^{- 1}[t_{+} c + \mathcal{A}^{*} \nabla K(X)]}_{\delta x}\tag{U).}
$$

In spite of its “primal nature”, the method is capable to produce dual approximate solutions; the corresponding formula is

$$
S_{+} = - t_{+}^{- 1}[\nabla K(X) -[\nabla^{2} K(X)] \mathcal{A} \delta x].\tag{S}
$$

What is the “geometric meaning” of (S)?

The answer is simple. Given a strictly feasible primal solution $Y = \mathcal{A} y - B$ and a value $\tau > 0$ of the penalty parameter, let us think how we could extend $(\tau, Y)$ by a strictly feasible dual solution S to a triple $(\tau, Y, S)$ which is as close as possible, w.r.t. the distance dist $(\cdot, \cdot)$ , to the point $Z_{*}(\tau)$ of the primal-dual central path. Recall that the distance in question is

$$
\mathrm{dist}((Y, S), Z_{*}(\tau)) = \sqrt{\langle[\nabla^{2} K(Y)]^{- 1}(\tau S + \nabla K(Y)), \tau S + \nabla K(Y) \rangle_{E}}.\tag{dist}
$$

The simplest way to resolve our question is to choose in the dual feasible plane

$$
\mathcal{L}^{\perp} + C = \{S \mid \mathcal{A}^{*}(C - S) = 0\}\tag{\([C:\mathcal{A}^{*}C = c]\}
$$

the point $S$ which minimizes the right hand side of (dist). If we are lucky to get the resulting point in the interior of K, we get the best possible completion of $(\tau, Y)$ to an “admissible” triple $(\tau, Y, S)$ – the one where $S$ is strictly dual feasible, and the triple is “as close as possible” to $Z_{*}(\tau)$

Now, there is no dificulty in finding the above S – this is just a Least Squares problem

$$
\min_{S} \left\{\langle[\nabla^{2} K(Y)]^{- 1}(\tau S + \nabla K(Y)), \tau S + \nabla K(Y) \rangle_{E}: \mathcal{A}^{*} S = c \quad[\equiv \mathcal{A}^{*} C] \right\}
$$

Exercise 4.12 1) Let $\tau > 0$ and $Y = \mathcal{A} y - B \in$ int K. Prove that the solution to the above Least Squares problem is

$$
\begin{array}{c} S_{*} = - \tau^{- 1} \left[\nabla K(Y) -[\nabla^{2} K(Y)] \mathcal{A} \delta \right], \\ \delta =[\mathcal{A}^{*}[\nabla^{2} K(Y)] \mathcal{A}]^{- 1}[\tau c + \mathcal{A}^{*} \nabla K(Y)], \end{array}\tag{*}
$$

and that the squared optimal value in the problem is

$$
\begin{array}{rcl} \lambda^{2}(\tau, y) & \equiv &[\nabla K(Y)]^{T} \mathcal{A} \left[\mathcal{A}^{*}[\nabla^{2} K(Y)] \mathcal{A} \right]^{- 1} \mathcal{A}^{*} \nabla K(Y) \\ & = & \left(\| S_{*} + \tau^{- 1} \nabla K(Y) \|_{- \tau^{- 1} \nabla K(Y)}\right)^{2} \\ & = & \left(\| \tau S_{*} + \nabla K(Y) \|_{- \nabla K(Y)}\right)^{2}.\end{array}\tag{4.8.1}
$$

2) Derive from 1) and the result of Exercise $4.8$ that if the Newton decrement $\lambda(\tau, y) ~ of \left(\tau, y \right)$ $is < 1$ , then we are lucky $- \S_{z}$ <sub>∗</sub> is in the interior of K.

3) Derive from 1-2) the following

Corollary 4.8.1 Let (CP) and its dual be strictly feasible, let $Z_{*}(\cdot)$ be the primal-dual central path associated with (CP), and let $(\tau, Y, S)$ be a triple comprised of $\tau \ > \0$ , a strictly feasible primal solution $Y = \mathcal{A} y - B$ , and a strictly feasible dual solution S. Assume that dist $((Y, S), Z_{*}(\tau)) < 1$ . Then

$$
\lambda(\tau, y) = \operatorname{dist}((Y, S_{*}), Z_{*}(\tau)) \leq \operatorname{dist}((Y, S), Z_{*}(\tau)),
$$

where $S_{*}$ is the strictly feasible dual solution given by ${\mathrm{~ 1 ~ - ~ 2 ~}}$

Hint: When proving the second equality in (4.8.1), use the result of Exercise 4.3.

The result stated in Exercise 4.12 is very instructive. First, we see that $S_{+}$ in the primal pathfollowing method is exactly the “best possible completion” of $(t_{+}, X)$ to an admissible triple $\left(t_{+}, X, S \right)$ . Second, we see that

Proposition 4.8.3 If (CP) is strictly feasible and there exists $\tau > 0$ and a strictly feasible solution y of (CP) such that $\lambda(\tau, y) < 1$ , then the problem is strictly dual feasible.

Indeed, the above scheme, as applied to $(\tau, y)$ , produces a strictly feasible dual solution!

In fact, given that (CP) is strictly feasible, the existence of $\tau > 0$ and a strictly feasible solution y to (CP) such that $\lambda(\tau, y) < 1$ is a necessary and sufficient condition for (CP) to be strictly primal-dual feasible.

Indeed, the suficiency of the condition was already established. To prove its necessity, note that if (CP) is primal-dual strictly feasible, then the primal central path is well-defined<sup>16)</sup>; and if $(\tau, Y_{*}(\tau) = \mathcal{A} y(\tau) - B)$ is on the primal central path, then, of course, $\lambda(\tau, y(\tau)) = 0$

Note that the Newton decrement admits a nice and instructive geometric interpretation:

Let K be a canonical cone, K be the associated canonical barrier, $Y = \mathcal{A} y - B$ be a strictly feasible solution to (CP) and $\tau > 0$ . Consider the barrier-generated family

$$
B_{t}(x) = tc^{T} x + B(x), \quad B(x) = K(\mathcal{A} x - B).
$$

Then

$$
\begin{array}{rcl} \lambda(\tau, y) & = & \max \{h^{T} \nabla B_{\tau}(y) \mid h^{T}[\nabla^{2} B_{\tau}(y)] h \leq 1\} \\ & = & \max \{\langle \tau C + \nabla K(Y), H \rangle_{E} \mid \| H \|_{Y} \leq 1, H \in \mathrm{Im} \mathcal{A}\}[Y = \mathcal{A} y - B].\end{array}\tag{4.8.2}
$$

Exercise 4.13 Prove (4.8.2).

Exercise 4.14 Let K be a canonical cone, K be the associated canonical barrier, and let N be an Affine plane intersecting int K such that the intersection U = N ∩ int K is unbounded. Prove that for every $X \in U$ one has

$$
\max \{\langle \nabla K(X), Y - X \rangle_{E} \mid \| Y - X \|_{X} \leq 1, Y \in \mathcal{N}\} \geq 1.
$$

Hint: Assume that the opposite inequality holds true for some $X \in U$ and use (4.8.2) and Proposition 4.8.3 to conclude that the problem with trivial objective

$$
\min_{X} \left\{\langle 0, X \rangle_{E}: X \in \mathcal{N} \cap \mathbf{K} \right\}
$$

and its conic dual are strictly feasible. Then use the result of Exercise 1.16 to get a contradiction.

The concluding exercise in this series deals with the “toy example” of application of the primal path-following method described at the end of Section 4.5.3:

Exercise 4.15 Looking at the data in the table at the end of Section 4.5.3, do you believe that the corresponding method is exactly the short-step primal path-following method from Theorem 4.5.1 with the stepsize policy (4.5.12)?

In fact the data at the end of Section 4.5.3 are given by a simple modification of the short step path-following method: instead of the penalty updating policy (4.5.12), we increase at each step the value of the penalty in the largest ratio satisfying the requirement $\lambda(t_{i + 1}, x_{i}) \leq 0.95$

## 4.8.6 Infeasible start path-following method

In our presentation of the interior point path-following methods, we have ignored completely the initialization issue – how to come close to the path in order to start its tracing. There are several techniques for accomplishing this task; we are about to outline one of these techniques the infeasible start path-following scheme (originating from C.Roos & T. Terlaky and from Yu. Nesterov). Among other attractive properties, a good “pedagogical” feature of this technique is that its analysis heavily relies on the results of exercises in Sections 4.8.3, 4.8.4, 4.8.5, thus illustrating the extreme importance of the facts which at a first glance look a bit esoteric.

Situation and goals. Consider the following situation. We are interested to solve a conic problem

$$
\min_{x} \left\{c^{T} x: X \equiv \mathcal{A} x - B \in \mathbf{K} \right\},\tag{CP}
$$

where K is a canonical cone. The corresponding primal-dual pair, in its geometric form, is

$$
\begin{array}{c} \min_{X} \left\{\langle C, X \rangle_{E}: X \in(\mathcal{L} - B) \cap \mathbf{K} \right\} \\ \max_{S} \left\{\langle B, S \rangle_{E}: S \in(\mathcal{L}^{\perp} + C) \cap \mathbf{K} \right\} \\ \left[\mathcal{L} = \operatorname{Im} \mathcal{A}, \mathcal{L}^{\perp} = \operatorname{Ker} \mathcal{A}^{*}, \mathcal{A}^{*} C = c \right] \end{array}\tag{P}
$$

(D)

From now on we assume the primal-dual pair (P), (D) to be strictly primal-dual feasible.

To proceed, it is convenient to “normalize” the data as follows: when we shift B along the subspace L, (P) remains unchanged, while (D) is replaced with an equivalent problem (since when shifting B along ${\mathcal{L}},$ the dual objective, restricted to the dual feasible set, gets a constant additive term). Similarly, when we shift $C$ along $\mathcal{L}^{\perp}$ , the dual problem (D) remains unchanged, and the primal (P) is replaced with an equivalent problem. Thus, we can shift B along L and C along $\mathcal{L}^{\perp}$ , while not varying the primal-dual pair (P), (D) (or, better to say, converting it to an equivalent primal-dual pair). With appropriate shift of B along $\mathcal{L}$ we can enforce $B \in{\mathcal{L}}^{\perp}$ , and with appropriate shift of $C$ along $\mathcal{L}^{\perp}$ we can enforce $C \in{\mathcal{L}}.$ . Thus, we can assume that from the very beginning the data are normalized by the requirements

$$
B \in \mathcal{L}^{\perp}, \quad C \in \mathcal{L},\tag{Nrm}
$$

which, in particular, implies that $\langle C, B \rangle_{E} = 0$ , so that the duality gap at a pair (X, S) of primal-dual feasible solutions becomes

$$
\text{DualityGap}(X, S) = \langle X, S \rangle_{E} = \langle C, X \rangle_{E} - \langle B, S \rangle_{E} \quad[= \langle C, X \rangle_{E} - \langle B, S \rangle_{E} + \langle C, B \rangle_{E}].
$$

Our goal is rather ambitious: to develop an interior point method for solving (P), (D) which requires neither a priori knowledge of a primal-dual strictly feasible pair of solutions, nor a specific initialization phase.

The scheme. The construction we are about to present achieves the announced goal as follows.

1. We write down the following system of conic constraints in variables X, S and additional scalar variables τ , σ:

(a)

$$
X + \tau B - P \in \mathcal{L};\tag{b}
$$

$$
S - \tau C - D \in \mathcal{L}^{\perp};\tag{c}
$$

$$
\langle C, X \rangle_{E} - \langle B, S \rangle_{E} + \sigma - d = 0;\tag{e}
$$

$$
(f) \quad S \in \mathbf{K};\tag{C}
$$

$$
(g) \quad \sigma \geq 0;
$$

$$
(h) \quad \tau \geq 0.
$$

Here $P, D,$ , d are certain fixed entities which we choose in such a way that

(i) We can easily point out a strictly feasible solution $\widehat{Y} =(\widehat{X}, \widehat{S}, \widehat{\sigma}, \widehat{\tau} = 1)$ to the system;

(ii) The solution set $\mathcal{V}$ of (C) is unbounded; moreover, whenever $Y_{i} =(X_{i}, S_{i}, \sigma_{i}, \tau_{i}) \in \mathcal{V}$ is an unbounded sequence, we have $\tau_{i} \to \infty$

2. Imagine that we have a mechanism which allows us to “run away to ∞ along $\mathcal{V}^{\ast}$ $\mathrm{i.e.,}$ to generate a sequence of points $Y_{i} ~ = ~(X_{i}, S_{i}, \sigma_{i}, \tau_{i}) ~ \in ~ \mathcal{V}$ such that $\| Y_{i} \| \quad \equiv$ $\sqrt{\| X_{i} \|_{E}^{2} + \| S_{i} \|_{E}^{2} + \sigma_{i}^{2} + \tau_{i}^{2}} \infty$ . In this case, by (ii) $\tau_{i} \to \infty, i \to \infty$ . Let us define the normalizations

$$
\widetilde{X}_{i} = \tau_{i}^{- 1} X_{i}, \quad \widetilde{S}_{i} = \tau_{i}^{- 1} S_{i}.
$$

of $X_{i}, S_{i}$ . Since $(X_{i}, S_{i}, \sigma_{i}, \tau_{i})$ is a solution to (C), these normalizations satisfy the relations

$$
\begin{array}{rlr}(a) & \widetilde{X}_{i} & \in(\mathcal{L} - B + \tau_{i}^{- 1} P) \cap \mathbf{K}; \\(b) & \widetilde{S}_{i} & \in(\mathcal{L}^{\perp} + C + \tau_{i}^{- 1} D) \cap \mathbf{K}; \\(c) & \langle C, \widetilde{X}_{i} \rangle_{E} - \langle B, \widetilde{S}_{i} \rangle_{E} & \leq \tau_{i}^{- 1} d.\end{array}\tag{\((C')\}
$$

Since $\tau_{i} \to \infty$ , relations $\mathrm{(C^{\prime})}$ say that as $i \to \infty$ , the normalizations $\widetilde{X}_{i}, \widetilde{S}_{i}$ simultaneously approach primal-dual feasibility for (P), (D) (see $\left(\mathrm{C}^{\prime}.a - b \right))$ and primal-dual optimality (see $\left(\mathrm{C}^{\prime}.c \right)$ and recall that the duality gap, with our normalization $\langle C, B \rangle_{E} = 0$ , is $\langle C, X \rangle_{E} -$ $\langle B, S \rangle_{E})$

3. The issue, of course, is how to build a mechanism which allows to run away to ∞ along Y. The mechanism we intend to use is as follows. (C) can be rewritten in the generic form

$$
Y \equiv \left(\begin{array}{c} X \\ S \\ \sigma \\ \tau \end{array} \right) \in(\mathcal{M} + R) \cap \widetilde{\mathbf{K}}\tag{G}
$$

where

$$
\widetilde{\mathbf{K}} = \mathbf{K} \times \mathbf{K} \times \underbrace{\mathbf{S}_{+}^{1}}_{= \mathbb{R}_{+}} \times \underbrace{\mathbf{S}_{+}^{1}}_{= \mathbb{R}_{+}},
$$

$$
\mathcal{M} = \left\{\left(\begin{array}{c} U \\ V \\ s \\ r \end{array} \right) \Big | \begin{array}{c} U + rB \in \mathcal{L}, \\ V - rC \in \mathcal{L}^{\perp}, \\ \langle C, U \rangle_{E} - \langle B, V \rangle_{E} + s = 0 \end{array} \right\}
$$

is a linear subspace in the space $\widetilde{E}$ where the cone $\tilde{\bf K}$ lives,

$$
R = \left(\begin{array}{c} P \\ D \\ d - \langle C, P \rangle_{E} + \langle B, D \rangle_{E} \\ 0 \end{array} \right) \in \widetilde{E}.
$$

The cone $\tilde{\bf K}$ is a canonical cone along with $\mathbf{K};$ as such, it is equipped with the corresponding canonical barrier $\widetilde{K}(\cdot)$ . Let $\widehat{Y} = \left(\begin{array}{c}{{\dot{X}}} \\{{\widehat{S}}} \\{{\widehat{\sigma}}} \\{{\widehat{\tau} = 1}} \end{array} \right)$ be the strictly feasible solution to (G) given by 1.(i), and let

$$
\widetilde{C} = - \nabla \widetilde{K}(\widehat{Y}).
$$

Consider the auxiliary problem

$$
\min_{Y} \left\{\langle \widetilde{C}, Y \rangle_{\widetilde{E}}: Y \in(\mathcal{M} + R) \cap \widetilde{\mathbf{K}} \right\}.\tag{Aux}
$$

By the origin of ${\tilde{C}},$ the point $\widehat{Y}$ lies on the primal central path $\widetilde{Y}_{*}(t)$ of this auxiliary problem:

$$
\hat{Y} = \tilde{Y}_{*}(1).
$$

Let us trace the primal central path $\widetilde{Y}_{*}(\cdot)$ , but decreasing the value of the penalty instead of increasing it, thus enforcing the penalty to approach 0. What will happen in this process? Recall that the point $\widetilde{Y}_{*}(t)$ of the primal central path of (Aux) minimizes the aggregate

$$
t \langle \widetilde{C}, Y \rangle_{\widetilde{E}} + \widetilde{K}(Y)
$$

over $Y \in \mathcal{D}$ When t is small, we, essentially, are trying to minimize just $\widetilde{K}(Y)$ . But the canonical barrier, restricted to an unbounded intersection of an Affine plane and the associated canonical cone, is not bounded below on this intersection (see Proposition 4.8.2). Therefore, if we were minimizing the barrier $\widetilde{K}$ over ${\mathcal{V}},$ the minimum “would be achieved at infinity”; it is natural to guess (and this is indeed true) that when minimizing a slightly perturbed barrier, the minimum will run away to infinity as the level of perturbations goes to 0. Thus, we may expect (and again it is indeed true) that $\| \widetilde{Y}_{*}(t) \| \to \infty \mathrm{as} t \to + 0.$ so that when tracing the path $\widetilde{Y}(t)$ as $t0$ , we are achieving our goal of running away to infinity along Y.

Now let us implement the outlined approach.

Specifying $P, D, d.$ Given the data of (CP), let us choose somehow $P >_{\bf K} B, D >_{\bf K} - C$ $\hat{\sigma} > 0$ and set

$$
d = \langle C, P - B \rangle_{E} - \langle B, D + C \rangle_{E} + \widehat{\sigma}.
$$

Exercise 4.16 Prove that with the above setup, the point

$$
\hat{Y} = \left(\begin{array}{c} \hat{X} = P - B \\ \hat{S} = C + D \\ \hat{\sigma} \\ \hat{\tau} = 1 \end{array} \right)
$$

is a strictly feasible solution to (Aux). Thus, our setup ensures 1.(i).

Verifying 1.(ii). This step is crucial:

Exercise 4.17 Let $(\mathrm{Aux}^{\prime})$ be the problem dual to (Aux). Prove that $\left(\mathrm{Aux} \right), \left(\mathrm{Aux}^{\prime} \right)$ is a strictly primal-dual feasible pair of problems.

Hint: By construction, (Aux) is strictly feasible; to prove that $(\mathrm{Aux^{\prime}})$ is also strictly feasible, use Proposition 4.8.3.

Exercise 4.18 Prove that with the outlined setup the feasible set $\mathcal{V}$ of (Aux) is unbounded.

Hint: Use the criterion of boundedness of the feasible set of a feasible conic problem (Exercise 1.15) which as applied to (Aux) reads as follows: the feasible set of (Aux) is bounded if and only if $\mathcal{M}^{\perp}$ intersects the interior of the cone dual to $\widetilde{\mathbf{K}}$ (since $\widetilde{\mathbf{K}}$ is a canonical cone, the cone dual to it is $\widetilde{\mathbf{K}}$ itself).

The result of Exercise 4.18 establishes the major part of 1.(ii). The remaining part of the latter property is given by

Exercise 4.19 Let X<sup>¯</sup> , S<sup>¯</sup> be a strictly feasible pair of primal-dual solutions to (P), (D) (recall that the latter pair of problems was assumed to be strictly primal-dual feasible), so that there exists $\gamma \in(0, 1]$ such that

$$
\begin{array}{rcll} \gamma \| X \|_{E} & \leq & \langle \bar{S}, X \rangle_{E} & \forall X \in \mathbf{K}, \\ \gamma \| S \|_{E} & \leq & \langle \bar{X}, S \rangle_{E} & \forall S \in \mathbf{K}.\end{array}
$$

Prove that $ifY ={\left(\begin{array}{l}{X} \\{S} \\{\sigma} \\{\tau} \end{array} \right)}$ is feasible for (Aux), then

$$
\begin{array}{rcl} \| Y \|_{\widetilde{E}} & \leq & \alpha \tau + \beta, \\ & & \alpha = \gamma^{- 1} \left[\langle \bar{X}, C \rangle_{E} - \langle \bar{S}, B \rangle_{E} \right] + 1, \\ & & \beta = \gamma^{- 1} \left[\langle \bar{X} + B, D \rangle_{E} + \langle \bar{S} - C, P \rangle_{E} + d \right].\end{array}\tag{4.8.3}
$$

Use this result to complete the verification of 1.(ii).

Tracing the path $\widetilde{Y}_{*}(t)$ as $t ~ ~ 0.$ The path $\widetilde{Y}_{*}(t)$ is the primal central path of certain strictly primal-dual feasible primal-dual pair of conic problems associated with a canonical cone (see Exercise 4.17). The only diference with the situation already discussed in this Lecture is that now we are interested to trace the path as $t + 0$ , starting the process from the point $\widehat{Y} = \widetilde{Y}_{*}(1)$ given by 1.(i), rather than to trace the path as $t \to \infty$ . It turns out that we have exactly the same possibilities to trace the path $\widetilde{Y}_{*}(t)$ as the penalty parameter approaches 0 as when tracing the path as $t \to \infty;$ in particular, we can use short-step primal and primal-dual path-following methods with stepsize policies “opposite” to those mentioned, respectively, in Theorem 4.5.1 and Theorem 4.5.2 (“opposite” means that instead of increasing the penalty at each iteration in certain ratio, we decrease it in exactly the same ratio). It can be verified (take it for granted!) that the results of Theorems 4.5.1, 4.5.2 remain valid in this new situation as well. Thus, in order to generate a triple (t, Y, U ) such that $t \in(0, 1)$ , Y is strictly feasible for (Aux), U is strictly feasible for the problem $(\mathrm{Aux}^{\prime})$ dual to (Aux), and dist $((Y, U), \widetilde{Z}_{*}(t)) \le \kappa \le 0.1$ , it sufices to carry out

$$
\mathcal{N}(t) = O(1) \sqrt{\theta(\widetilde{K})} \ln \frac{1}{t} = O(1) \sqrt{\theta(K)} \ln \frac{1}{t}
$$

steps of the path-following method; here $\widetilde{Z}_{*}(\cdot)$ is the primal-dual central path of the primal-dual pair of problems $(\mathrm{Aux}),(\mathrm{Aux}^{\prime})$ , and dist from now on is the distance to this path, as defined in Section 4.4.2.2. Thus, we understand what is the cost of arriving at a close-to-the-path triple $(t, Y, U)$ with a desired value $t \in(0, 1)$ of the penalty. Further, our original scheme explains how to convert the Y -component of such a triple into a pair $X_{t}, ~ S_{t}$ of approximate solutions to (P), (D):

$$
X_{t} = \frac{1}{\tau[Y]} X[Y]; S_{t} = \frac{1}{\tau[Y]} S[Y],
$$

where

$$
Y = \left(\begin{array}{c} X[Y] \\ S[Y] \\ \sigma[Y] \\ \tau[Y] \end{array} \right).
$$

What we do not know for the moment is

(?) What is the quality of the resulting pair $(X_{t}, S_{t})$ of approximate solutions to (P),

(D) as a function of t?

Looking at $\mathrm{(C^{\prime})}$ , we see that $(?)$ is, essentially, the question of how rapidly the component $\tau[Y]$ of our “close-to-the-path triple $(t, Y, U)^{\prime}$ blows up when t approaches 0. In view of the bound (4.8.3), the latter question, in turn, becomes “how large is $\| Y \|_{\widetilde{E}}$ when t is small”. The answers to all these questions are given in the following two exercises:

Exercise 4.20 Let $(t, Y, U)$ be a “close-to-the-path” triple, so that $t > 0, Y$ is strictly feasible for (Aux), U is strictly feasible for the dual to (Aux) problem $(\mathrm{Aux}^{\prime})$ and

$$
\mathrm{dist}((Y, U), \widetilde{Z}_{*}(t)) \leq \kappa \leq 0.1.
$$

Verify that

$$
\begin{array}{rl}(a) \qquad \max \{\langle - \nabla \widetilde{K}(Y), H \rangle_{E}: H \in \mathcal{M}, \| H \|_{Y} \leq 1\} & \geq 1.\\(b) \quad \max \{\left| \langle t \widetilde{C} + \nabla \widetilde{K}(Y), H \rangle_{E} \right|: H \in \mathcal{M}, \| H \|_{Y} \leq 1\} & \leq \kappa \leq 0.1.\end{array}\tag{4.8.4}
$$

Conclude from these relations that

$$
\max \{\langle - t \widetilde{C}, H \rangle_{E}: H \in \mathcal{M}, \| H \|_{Y} \leq 1\} \geq 0.9.\tag{4.8.5}
$$

Hint: To verify (4.8.4.a), use the result of Exercise 4.14. To verify (4.8.4.b), use Corollary 4.8.1 (with (Aux) playing the role of (CP), t playing the role of $\tau$ and U playing the role of

S) and the result of Exercise 4.13.

Now consider the following geometric construction. Given a triple $(t, Y, U)$ satisfying the premise of Exercise 4.20, let us denote by $W^{1}$ the intersection of the Dikin ellipsoid of $\widehat{Y}$ with the feasible plane of (Aux), and by $W^{t}$ the intersection of the Dikin ellipsoid of $Y$ with the same feasible plane. Let us also extend the line segment $[\widehat{Y}, Y]$ to the left of $\widehat{Y}$ until it crosses the boundary of $W^{1}$ at certain point $Q.$ Further, let us choose $H \in \mathcal{M}$ such that $\| H \|_{Y} = 1$ and

$$
\langle - t \widetilde{C}, H \rangle_{\widetilde{E}} \geq 0.9
$$

(such an H exists in view of (4.8.5)) and set

$$
M = Y + H; \quad N = \widehat{Y} + \omega H, \quad \omega = \frac{\| \widehat{Y} - P \|_{2}}{\| Y - P \|_{2}}.
$$

The cross-section of the entities involved by the 2D plane passing through $Q, Y, M$ looks as shown on Fig. 4.5.

Exercise 4.21 1) Prove that the points Q, M, N belong to the feasible set $of \left(\mathrm{Aux} \right)$

![Figure 4.5](../../../transcripts/mineru/lectures-modern-convex-optimization/parts/201-400/images/dce39848e45e594f3fc6ac2a2718b07929b505e30c7d61f46208aeb427b87a28.jpg)  
Figure 4.5: Illustration for considerations on p. 385

Hint: Use Exercise 4.8 to prove that Q, M are feasible for $({\mathrm{Aux}});$ note that N is a convex combination of Q, M.

2) Prove that

$$
\langle \nabla \widetilde{K}(\widehat{Y}), N - \widehat{Y} \rangle_{E} = \frac{\omega}{t} \langle - t \widetilde{C}, H \rangle_{\widetilde{E}} \geq \frac{0.9 \omega}{t}
$$

Hint: Recall that by definition $\widetilde{C} = - \nabla \widetilde{K}(\widehat{Y})$

3) Derive from 1-2) that

$$
\omega \leq \frac{\theta(\widetilde{K}) t}{0.9}.
$$

Conclude from the resulting bound on ω that

$$
\begin{array}{r} \| Y \|_{\widetilde{E}} \geq \frac{\Omega}{t} - \Omega^{\prime}, \\ \Omega = \frac{0.9 \min_{D}[\| D \|_{\widetilde{E}} | \| D \|_{\widehat{Y}} = 1]}{\theta(\widetilde{K})}, \quad \Omega^{\prime} = \max_{D}[\| D \|_{\widetilde{E}} | \| D \|_{\widehat{Y}} = 1] \end{array}\tag{4.8.6}
$$

Note that $\Omega$ and $\Omega^{\prime}$ are positive quantities depending on our “starting point $^{,,} \widehat{Y}$ and completely independent of t!

Hint: To derive the bound on ω, use the result of Exercise 4.9.2.

Exercise 4.22 Derive from the results of Exercises 4.21, 4.19 that there exists a positive constant Θ (depending on the data of (Aux)) such that

(#) Whenever a triple (t, Y, U ) is “close-to-the-path” (see Exercise 4.20) and $Y =$

$\begin{array}{r}{\left(\begin{array}{c}{X} \\{S} \\{\sigma} \\{\tau} \end{array} \right)} \end{array}$ , one has

$$
\tau \geq \frac{1}{\Theta t} - \Theta.
$$

Consequently, when $\begin{array}{r}{t \leq \frac{1}{2 \Theta^{2}}} \end{array}$ , the pair $(X_{\tau} = \tau^{- 1} X, S_{\tau} = \tau^{- 1} S)$ satisfies the relations $(cf.~(\mathrm{C}^{\prime}))$

$$
\begin{array}{ll} X_{\tau} \in \mathbf{K} \cap(\mathcal{L} - B + 2t \Theta P) &[\text{``primal} O(t) \text{-feasibility"}] \\ S_{\tau} \in \mathbf{K} \cap(\mathcal{L}^{\perp} + C + 2t \Theta D) &[\text{``dual} O(t) \text{-feasibility"}] \\ \langle C, X_{\tau} \rangle_{E} - \langle B, S_{\tau} \rangle_{E} \leq 2t \Theta d &[\text{``O(t)-duality gap"}] \end{array}\tag{+}
$$

$(\#)$ says that in order to get an “$\epsilon$-primal-dual feasible $\epsilon$-optimal” solution to $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ , it suffices to trace the primal central path of (Aux), starting at the point $\widehat{Y}$ (penalty parameter equals 1) until a close-to-the-path point with penalty parameter $O(\epsilon)$ is reached, which requires $\begin{array}{r}{O(\sqrt{\theta(K)} \ln \frac{1}{O(\epsilon)})} \end{array}$ iterations. Thus, we arrive at a process with the same complexity characteristics as for the path-following methods discussed in this Lecture; note, however, that now we have absolutely no troubles with how to start tracing the path.

At this point, a careful reader should protest: relations $(+)$ do say that when t is small, $X_{\tau}$ is nearly feasible for (P) and $S_{\tau}$ is nearly feasible for (D); but why do we know that $X_{\tau}, S_{\tau}$ are nearly optimal for the respective problems? What pretends to ensure the latter property, is the “O(t)-duality gap” relation in (+), and indeed, the left hand side of this inequality looks as the duality gap, while the right hand side is $O(t)$ . But in fact the relation

$$
\mathrm{DualityGap}(X, S) \equiv[\langle C, X \rangle_{E} - \mathrm{Opt}(\mathbb{P})] +[\mathrm{Opt}(\mathrm{D}) - \langle B, S \rangle_{E}] = \langle C, X \rangle_{E} - \langle B, S \rangle_{E}^{17)}
$$

is valid only for primal-dual feasible pairs $(X, S)$ , while our $X_{\tau}, ~ S_{\tau}$ are only $O(t) \mathrm{- feasible}$

Here is the missing element:

Exercise 4.23 Let the primal-dual pair of problems $\left(\mathbb{P} \right), \left(\mathrm{D} \right)$ be strictly primal-dual feasible and be normalized by $\langle C, B \rangle_{E} = 0$ , let $(X_{*}, S_{*})$ be a primal-dual optimal solution to the pair, and let $X, S$ “$\epsilon$-satisfy” the feasibility and optimality conditions for (P), (D), i.e.,

$$
(a) \quad X \in \mathbf{K} \cap(\mathcal{L} - B + \Delta X), \| \Delta X \|_{E} \leq \epsilon,
$$

$$
(b) \quad S \in \mathbf{K} \cap(\mathcal{L}^{\perp} + C + \Delta S), \| \Delta S \|_{E} \leq \epsilon,
$$

$$
(c) \qquad \langle C, X \rangle_{E} - \langle B, S \rangle_{E} \leq \epsilon.
$$

Prove that

$$
\langle C, X \rangle_{E} - \operatorname{Opt}(\mathbb{P}) \leq \epsilon(1 + \| X_{*} + B \|_{E}),
$$

$$
\mathrm{Opt}(\mathrm{D}) - \langle B, S \rangle_{E} \leq \epsilon(1 + \| S_{*} - C \|_{E}).
$$

Exercise 4.24 Implement the infeasible-start path-following method.


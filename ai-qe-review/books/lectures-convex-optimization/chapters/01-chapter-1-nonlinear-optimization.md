---
title: "Chapter 1 \u2014 Nonlinear Optimization . ."
book: "Lectures on Convex Optimization"
book_slug: lectures-convex-optimization
course: optimization
chapter_number: 1
citekey: nesterov2018convex
official_syllabus: true
source_pdf: "sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf"
source_transcript: "transcripts/mineru/lectures-convex-optimization/reading.md"
source_line_start: 356
source_line_end: 2537
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
caption_derived_image_alt: 0
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 10
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - optimization
  - official-syllabus
---

# Chapter 1 — Nonlinear Optimization . .

> [[../README|本书目录]] · [[02-chapter-2-smooth-convex-optimization|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Lectures on Convex Optimization（nesterov2018convex）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/optimization/lectures-convex-optimization/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/lectures-convex-optimization/reading.md)，源行 356–2537。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 10。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Chapter 1 Nonlinear Optimization

In this chapter, we introduce the main notations and concepts used in Continuous Optimization. The first theoretical results are related to Complexity Analysis of the problems of Global Optimization. For these problems, we start with a very pessimistic lower performance guarantee. It implies that for any method there exists an optimization problem in $\mathbb{R}^{n}$ which needs at least $\begin{array}{rlr}{\mathrm{~}} &{{}} &{O \left(\frac{1}{\epsilon^{n}} \right)} \end{array}$ computations of the function values in order to approximate its global solution up to accuracy $\epsilon$. Therefore, in the next section we pass to local optimization, and consider two main methods, the Gradient Method and the Newton Method. For both of them, we establish some local rates of convergence. In the last section, we present some standard methods in General Nonlinear Optimization: the conjugate gradient methods, quasi-Newton methods, theory of Lagrangian relaxation, barrier methods and penalty function methods. For some of them, we prove global convergence results.

## 1.1 The World of Nonlinear Optimization

(General formulation of the problem; Important examples; Black box and iterative methods; Analytical and arithmetical complexity; The Uniform Grid Method; Lower complexity bounds; Lower bounds for global optimization; Identity cards of the fields.)

## 1.1.1 General Formulation of the Problem

Let us start by fixing the mathematical form of our main problem and the standard terminology. Let x be an n-dimensional real vector:

$$
x =(x^{(1)}, \ldots, x^{(n)})^{T} \in \mathbb{R}^{n},
$$

and $f_{0}(\cdot), \ldots, f_{m}(\cdot)$ be some real-valued functions defined on a set $Q \subseteq \mathbb{R}^{n}$ . In this book, we consider different variants of the following general minimization problem:

$$
\operatorname{min} \f_{0}(x),
$$

$$
\mathrm{s.t.} \f_{j}(x) \ \& \0, j = 1 \ldots m,\tag{1.1.1}
$$

$$
x \in Q,
$$

where the sign $\&$ can be $\leq, \geq, \mathrm{or} =.$

We call $f_{0}(\cdot)$ the objective function of our problem, the vector function

$$
f(x) =(f_{1}(x), \ldots, f_{m}(x))^{T}
$$

is called the vector of functional constraints, the set $Q$ is called the basic feasible set, and the set

$$
{\mathcal{F}} = \{x \in Q \mid f_{j}(x) \leq 0, j = 1 \ldots m\}
$$

is called the (entire) feasible set of problem (1.1.1). It is just a convention to consider minimization problems. Instead, we could consider maximization problems with the objective function $- f_{0}(\cdot)$

There exists a natural classification of the types of minimization problems.

- Constrained problems: $\mathcal{F} \subsetneq \mathbb{R}^{n}$

- Unconstrained problems: $\mathcal{F} = \mathbb{R}^{n}.$ 1

- Smooth problems: all $f_{j}(\cdot)$ are differentiable.

- Nonsmooth problems: there are several nondifferentiable components $f_{k}(\cdot)$

- Linearly constrained problems: the functional constraints are affine:

$$
f_{j}(x) = \sum_{i = 1}^{n} a_{j}^{(i)} x^{(i)} + b_{j} \equiv \langle a_{j}, x \rangle + b_{j}, \j = 1 \dots m,
$$

(here $\langle \cdot, \cdot \rangle$ stands for the inner (or scalar) product in $\mathbb{R}^{n} \colon \langle a, x \rangle = a^{T} x)$ , and $Q$ is a polyhedron. If $f_{0}(\cdot)$ is also affine, then (1.1.1) is a linear optimization problem. $\mathrm{If ~} f_{0}(\cdot)$ is quadratic, then (1.1.1) is a quadratic optimization problem. If all the functions $f_{0}(\cdot), \cdot, f_{m}(\cdot)$ are quadratic, then this is a quadratically constrained quadratic problem.

There is also a classification based on properties of the feasible set.

- Problem (1.1.1) is called feasible if ${\mathcal{F}} \neq \emptyset.$

- Problem (1.1.1) is called strictly feasible if there exists an $x \in \Q$ such that $f_{j}(x) < 0(\mathrm{or} > 0)$ for all inequality constraints and $f_{j}(x) = 0$ for all equality constraints. (Slater condition.)

Finally, we distinguish different types of solutions to (1.1.1):

- A point $x^{*} \in{\mathcal{F}}$ is called the optimal global solution to (1.1.1) if $f_{0}(x^{*}) \leq f_{0}(x)$ for all $x \in \mathcal{F}$ (global minimum). In this case, $f_{0}(x^{*})$ is called the (global) optimal value of the problem.

- A point $x^{*} \in{\mathcal{F}}$ is called a local solution to (1.1.1) if there exists a set $\hat{\mathcal{F}} \subseteq \mathcal{F}$ such that $x^{*} \in$ int $\hat{\mathcal F}$ and $f_{0}(x^{*}) \ \leq \f_{0}(x)$ for all $x \in \hat{\mathcal F}$ (local minimum). If $f_{0}(x^{*}) < f_{0}(x)$ for all $x \in{\hat{\mathcal{F}}} \setminus \{x^{*}\}$ , then $x^{*}$ is called strict (or isolated) local minimum.

Let us consider now several examples representing the main sources of optimization problems.

Example 1.1.1 Let $x^{(1)}, \ldots, x^{(n)}$ be our design variables. Then we can fix some functional characteristics of our decision vector x: $f_{0}(x), \ldots, f_{m}(x)$ . For example, we can consider a price of the project, amount of required resources, reliability of the system, etc. We fix the most important characteristic, $f_{0}(x)$ , as our objective. For all others, we impose some bounds: $a_{j} \leq f_{j}(x) \leq b_{j}$ . Thus, we come to the problem

$$
\begin{array}{l}{\underset{x \in Q}{\operatorname{min}} \f_{0}(x),} \\{\mathrm{s.t.} \a_{j} \leq f_{j}(x) \leq b_{j}, \j = 1 \ldots m,} \end{array}
$$

where $Q$ stands for the structural constraints like nonnegativity, boundedness of some variables, etc.

Example 1.1.2 Let our initial problem be as follows:

$$
{\mathrm{Find ~}} x \in \mathbb{R}^{n}{\mathrm{~ such ~ that ~}} f_{j}(x) = a_{j}, \j = 1 \ldots{m},\tag{1.1.2}
$$

where $a_{j} \in \mathbb{R}, j = 1, \dots, m$ . Then we can consider the problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \sum_{j = 1}^{m}(f_{j}(x) - a_{j})^{2},
$$

perhaps even with some additional constraints on x. If the optimal value of the latter problem is zero, we conclude that our initial problem (1.1.2) has a solution.

Note that in Nonlinear Analysis the problem (1.1.2) is almost universal. It covers ordinary differential equations, partial differential equations, problems arising in Game Theory, and many others.

Example 1.1.3 Sometimes our decision variables $x^{(1)}, \ldots, x^{(n)}$ must be integer. This can be described by the following constraint:

$$
\sin(\pi x^{(i)}) = 0, \quad i = 1 \dots n.
$$

Thus, we can also treat integer optimization problems:

$$
\operatorname{min}_{x \in Q} f_{0}(x),
$$

$$
\mathrm{s.t.} a_{j} \leq f_{j}(x) \leq b_{j}, j = 1 \ldots m,
$$

$$
\sin(\pi x^{(i)}) = 0, i = 1 \ldots n.\qquad \mathtt{U}
$$

Looking at these examples, we can easily understand the optimism of the pioneers of Nonlinear Optimization, which can be easily seen in the papers of the 1950s and 1960s. Our first impression should be, of course, as follows:

Nonlinear Optimization is a very important and promising application theory. It covers almost ALL needs of Operations Research and Numerical Analysis.

However, by looking at the same list of examples, especially at Examples 1.1.2 and 1.1.3, a more experienced (or suspicious) reader could come to the following conjecture.

In general, optimization problems should be UNSOLVABLE (?)

Indeed, from our real-life experience, it is difficult to believe in the existence of a universal tool which is able to solve all problems in the world.

However, suspicions are not the legal instruments of science. It is a question of personal taste how much we can trust them. Therefore, it was definitely one of the most important events in Optimization Theory when, in the middle of 1970s, this conjecture was proved in a strict mathematical sense. This proof is so important and simple that we cannot avoid it in our course. But first of all, we should introduce a special language which is required for speaking about such things.

## 1.1.2 Performance of Numerical Methods

Let us imagine the following situation. We are going to solve a problem P , and we know that there exist many different numerical methods for doing so. Of course, we want to find a scheme which is the best for our P . However, it appears that we are looking for something which does not exist. In fact, maybe it does, but it is definitely not recommended to ask the winner for help. Indeed, consider a method for solving problem (1.1.1), which does nothing except report that $x^{*} = 0$ . Of course, this method does not work properly for any problems except those which have the optimal solution exactly at the origin, in which case the “performance” of this method is unbeatable.

Hence, we cannot speak about the best method for a particular problem P , but we can do so for a class of problems $\mathcal{P} \ni P$ . Indeed, numerical methods are usually developed to solve many different problems with similar characteristics. Thus, the performance of a method $\mathcal{M}$ on the whole class $\mathcal{P}$ can be a natural measure of its efficiency.

Since we are going to speak about the performance of $\mathcal{M}$ on a class $\mathcal{P}$ , we should assume that the method $\mathcal{M}$ does not have complete information about a particular problem P .

The known (to a numerical scheme) “part” of problem P is called the model of the problem.

We denote the model by Σ. Usually the model consists of the formulation of the problem, description of classes of functional components, etc.

In order to recognize the problem P (and solve it), the method should be able to collect specific information about P . It is convenient to describe the process of collecting this data via the notion of an oracle. An oracle $\mathcal{O}$ is just a unit which answers the successive questions of the methods. The method $\mathcal{M}$ is trying to solve the problem P by collecting and handling the answers.

In general, each problem can be described by different models. Moreover, for each problem we can develop different types of oracles. But let us fix Σ and $\mathcal{O}$ . In this case, it is natural to define the performance of $\mathcal{M}$ on $(\Sigma, \mathcal{O})$ as its performance on the worst $P_{\mathrm{{w}}}$ from $(\Sigma, \emptyset)$ . Note that this $P_{\mathrm{{w}}}$ can be bad only for $\mathcal{M}$

Further, what is the performance of $\mathcal{M}$ on P ? Let us start from an intuitive definition.

The performance of <sup>M</sup> on P is the total amount of computational effort required by method <sup>M</sup> to solve the problem P .

In this definition, there are two additional notions to be specified. First of all, what does “to solve the problem” mean? In some situations it could mean finding an exact solution. However, in many areas of Numerical Analysis this is impossible (and in Optimization this is definitely the case). Therefore, we accept a relaxed goal.

Solving the problem means finding an approximate solution to $\mathcal{P}$ with some accuracy $\epsilon > 0$

Again, the meaning of the expession “with some accuracy $\epsilon > 0^{\circ}$ is very important for our definitions. However, it is too early to speak about this now. We just introduce the notation $\mathcal{T}_{\epsilon}$ for a stopping criterion. Its meaning will always be clear for particular problem classes. Now we have a formal description of the problem class:

$$
{\mathcal{P}} \equiv(Sigma, \emptyset,{\mathcal{T}}_{\epsilon}).
$$

In order to solve a problem P from $\mathcal{P}.$ , we apply to it an iterative process, which is a natural form of any method which works with an oracle.

## General Iterative Scheme

Input: Starting point x<sub>0</sub> and accuracy $\epsilon > 0.$

Initialization. Set $k = 0, \mathcal{S}_{- 1} = \emptyset.$ Here k is the iteration counter and $\mathcal{I}_{k}$ is the accumulated informational set.

## Main loop:

1. Call oracle $\mathcal{O}$ at point x<sub>k</sub>.

2. Update the informational set: $\begin{array}{r}{\mathcal{S}_{k} = \mathcal{I}_{k - 1} \bigcup(x_{k}, \mathcal{O}(x_{k})).} \end{array}$

3. Apply the rules of method $\mathcal{M}$ to $\mathcal{I}_{k}$ and generate a new point x<sub>k 1</sub>.

4. Check criterion $\mathcal{T}_{\epsilon}$ . If yes then form an output x. Otherwise set $k : = k + 1$ and go to Step 1.

(1.1.3)

Now we can specify the meaning of computational effort in our definition of performance. In the scheme (1.1.3), we can see two potentially expensive steps. The first one is Step 1, where we call the oracle. The second one is Step 3, where we form the new test point. Thus, we can introduce two measures of complexity of problem P for method <sup>M</sup> :

Analytical complexity: The number of calls of the oracle which is necessary to solve problem P up to accuracy $\epsilon$.

Arithmetical complexity: The total number of arithmetic operations (including the work of oracle and work of method), which is necessary for solving problem P up to accuracy $\epsilon$.

Comparing the notions of analytical and arithmetical complexity, we can see that the second one is more realistic. However usually, for a particular method <sup>M</sup> as applied to problem P , arithmetical complexity can be easily obtained from the analytical complexity and complexity of the oracle. Therefore, in Part I of this course we speak mainly about bounds on the analytical complexity for some problem classes. Arithmetical complexity will be treated in Part II, where we consider methods of Structural Optimization.

There is one standard assumption on the oracle which allows us to obtain the majority of results on analytical complexity for optimization schemes. This assumption, called the Local Black Box Concept, is as follows.

## Local Black Box

1. The only information available for the numerical scheme is the answer of the oracle.

2. The oracle is local: A small variation of the problem far enough from the test point x, which is compatible with the description of the problem class, does not change the answer at x.

This concept is very useful in the complexity analysis. Of course, its first part looks like an artificial wall between the method and the oracle. It seems natural to give methods full access to the internal structure of the problem. However, we will see that for problems with a complicated or implicit structure this access is almost useless. For more simple problems it could help. We will see this in the second part of this book.

To conclude the section, let us mention that the standard formulation (1.1.1) is called a functional model of optimization problems. Usually, for such models the standard assumptions are related to the level of smoothness of functional components. According to the degree of smoothness we can apply different types of oracle:

- Zero-order oracle: returns the function value $f(x)$

- First-order oracle: returns the function value $f(x)$ and the gradient $\nabla f(x)$

- Second-order oracle: returns $f(x), \nabla f(x)$ , and the Hessian $\nabla^{2} f(x)$

## 1.1.3 Complexity Bounds for Global Optimization

Let us try to apply the formal language of the previous section to a particular problem class. Consider the following problem:

$$
\operatorname{min}_{x \in B_{n}} ~ f(x).\tag{1.1.4}
$$

In our terminology, this is a constrained minimization problem with no functional constraints. The basic feasible set of this problem is $B_{n}$ , an n-dimensional box in $\mathbb{R}^{n}$

$$
B_{n} = \{x \in \mathbb{R}^{n} \mid 0 \leq x^{(i)} \leq 1, i = 1 \ldots n\}.
$$

Let us measure distances in $\mathbb{R}^{n}$ by the $\ell_{\infty}{-} \mathrm{norm}$

$$
\| x \|_{(\infty)} = \max_{1 \leq i \leq n} | x^{(i)} |.
$$

Assume that, with respect to this norm,

the objective function $f(\cdot) : \mathbb{R}^{n} \to \mathbb{R}$ is Lipschitz continuous on $B_{n}$ :

$$
\mid f(x) - f(y) \mid \leq L \parallel x - y \parallel_{(\infty)} \quad \forall x, y \in B_{n},
$$

with some constant L (Lipschitz constant).

(1.1.5)

Let us consider a very simple method for solving (1.1.4), which is called the Uniform Grid Method. This method $\mathcal{G}(\boldsymbol{p})$ has one integer input parameter $p \geq 1$

Method $\mathcal{G}(\boldsymbol{p})$   
1. Form $p^{n}$ points   
$\begin{array}{r}{x_{\alpha} = \left(\frac{2i_{1} - 1}{2p}, \frac{2i_{2} - 1}{2p},..., \frac{2i_{n} - 1}{2p} \right)^{T},} \end{array}$   
where $\alpha \equiv(i_{1}, \ldots, i_{n}) \in \{1, \ldots, p\}^{n}.$   
2. Among all points $x_{\alpha}$ , find the point $\bar{x}$ with the minimal value of   
the objective function.   
3. The pair $({\bar{x}}, f({\bar{x}}))$ is the output of the method.

(1.1.6)

Thus, this method forms a uniform grid of the test points inside the box $B_{n}$ computes the best value of the objective over this grid, and returns this value as an approximate solution to problem (1.1.4). In our terminology, this is a zero-order iterative method without any influence from the accumulated information on the sequence of test points. Let us find its efficiency estimate.

Theorem 1.1.1 Let $f^{*}$ be a global optimal value of problem (1.1.4). Then

$$
\begin{array}{r}{f(\bar{x}) - f^{*} \leq \frac{L}{2p}.} \end{array}
$$

Proof For a multi-index $\alpha =(i_{1}, \ldots, i_{n})$ , define

$$
X_{\alpha} = \{x \in \mathbb{R}^{n} : \| x - x_{\alpha} \|_{(\infty)} \leq{\frac{1}{2p}}\}.
$$

Clearly, $\begin{array}{rl}{\bigcup} &{{} \X_{\alpha} = B_{n}} \end{array}$ $\alpha{\in} \{1,{\ldots}, p\}^{n}$

Let $x_{*}$ be a global solution of our problem. Then there exists a multi-index $\alpha^{*}$ such that $x^{*} \in X_{\alpha^{*}}$ . Note that $\begin{array}{r}{\| x^{*} - \dot{x_{\alpha^{*}}} \|_{(\infty)} \leq \frac{1}{2p}} \end{array}$ . Therefore,

$$
f(\bar{x}) - f(x^{*}) \leq f(x_{\alpha^{*}}) - f(x^{*}) \overset{(1.1.5)}{\leq} \frac{L}{2p}.
$$

Let us conclude with the definition of our problem class. We fix our goal as follows:

$$
{\mathrm{Find ~}}{\bar{x}} \in B_{n} : \quad f({\bar{x}}) - f^{*} \leq \epsilon.\tag{1.1.7}
$$

Then we immediately get the following result.

Corollary 1.1.1 The analytical complexity of problem class (1.1.4), (1.1.5), (1.1.7) for method <sup>G</sup> is at most

$$
\begin{array}{r}{\mathcal{A}(\mathcal{G}) = \left(\left\lfloor \frac{L}{2 \epsilon} \right\rfloor + 1 \right)^{n},} \end{array}
$$

(here and in the sequel, a is the integer part of $a \in \mathbb{R})$

Proof Take $\begin{array}{r}{p = \left\lfloor \frac{L}{2 \epsilon} \right\rfloor + 1} \end{array}$ . Then $\begin{array}{r}{p \ge \frac{L}{2 \epsilon}} \end{array}$ , and, in view of Theorem 1.1.1, we have $\begin{array}{r}{f(\bar{x}) - f^{*} \le \frac{L}{2p} \le \epsilon} \end{array}$ . Note that we need to call the oracle at $p^{n}$ points.

Thus, ${\mathcal{A}}({\mathcal{G}})$ justifies an upper complexity bound for our problem class.

This result is quite informative. However, we still have some questions. Firstly, it may happen that our proof is too rough and the real performance of method $\mathcal{G}(\boldsymbol{p})$ is much better. Secondly, we still cannot be sure that $\mathcal{G}(\boldsymbol{p})$ is a reasonable method for solving (1.1.4). There could exist other schemes with much higher performance.

In order to answer these questions, we need to derive lower complexity bounds for the problem class (1.1.4), (1.1.5), (1.1.7). The main features of such bounds are as follows.

- They are based on the Black Box Concept.

- These bounds are valid for all reasonable iterative schemes. Thus, they provide us with a lower estimate for the analytical complexity of the problem class.

- Very often such bounds employ the idea of a resisting oracle.

For us, only the concept of a resisting oracle is new. Therefore, let us present it in more detail.

A resisting oracle tries to create the worst possible problem for each particular method. It starts from an “empty” function and it tries to answer each call of the method in the worst possible way. However, the answers must be compatible with the previous answers and with description of the problem class. Then, after termination of the method it is possible to reconstruct a problem which perfectly fits the final informational set accumulated by the algorithm. Moreover, if we run the method on this newborn problem, it will reproduce the same sequence of test points since it will have the same sequence of answers from the oracle.

Let us show how this works for problem (1.1.4). Consider the class of problems $\mathcal{P}_{\infty}$ defined as follows.

<table><tr><td rowspan=1 colspan=1>Model :</td><td rowspan=1 colspan=1> $\operatorname{min}_{x \in B_{n}} ~ f(x)$    where f (·) is $\ell_{\infty}{\mathrm{- Lipschitz}}$ continuous on $B_{n}$ </td></tr><tr><td rowspan=1 colspan=1>Oracle :</td><td rowspan=1 colspan=1>Zero-order Local Black Box.</td></tr><tr><td rowspan=1 colspan=1>Approximate solution :</td><td rowspan=1 colspan=1>Find $\bar{x} \in B_{n} : f(\bar{x}) - f^{*} < \epsilon.$ </td></tr></table>

Theorem 1.1.2 For $\epsilon < \frac{1}{2} L$ , the analytical complexity of problem class $\mathcal{P}_{\infty}$ is at least $\left\lfloor{\frac{L}{2 \epsilon}} \right\rfloor^{n}$ calls of the oracle.

Proof Let $\begin{array}{r}{p = \left\lfloor \frac{L}{2 \epsilon} \right\rfloor(\geq 1)} \end{array}$ . Assume that there exists a method which needs $N <$ $p^{n}$ calls of oracle to solve any problem from $\mathcal{P}$ . Let us apply this method to the following resisting strategy:

$$
\mathrm{Return} ~ f(x) = 0 \mathrm{atanytestpoint} x.
$$

Therefore this method can find only $\bar{x} \in B_{n}$ with $f({\bar{x}}) = 0$

However, since $N ~ < ~ p^{n}$ , there exists a multi-index α such that there were no test points in the box $X_{\hat{\alpha}}$ (see the notation of Theorem 1.1.1). Define $x_{*} = x_{\hat{\alpha}}$ , and consider the function

$$
\bar{f}(x) = \operatorname{min} \{0, L \| x - x_{*} \|_{(\infty)} - \epsilon\}.
$$

Clearly, this function is $\ell_{\infty}{\mathrm{- Lipschitz}}$ continuous with constant L, and its global optimal value is $\epsilon$. Moreover, $\bar{f}(\cdot)$ differs from zero only inside the box $X_{\hat{\alpha}}$ . Thus, $\bar{f}(\cdot)$ is equal to zero at all test points of our method.

Since the accuracy of the output of our method is $\epsilon$, we come to the following conclusion:

If the number of calls of the oracle is less than $p^{n}$ ,then the accuracy of the result cannot be better than $\epsilon$.

Thus, the desired statement is proved.

Now we can say much more about the performance of the Uniform Grid Method. Let us compare its efficiency estimate with the lower bound:

$$
\mathcal{G} : \left(\left\lfloor \frac{L}{2 \epsilon} \right\rfloor + 1 \right)^{n} \quad \Leftrightarrow \quad \mathrm{Lower ~ bound :} \ : \ : \left\lfloor \frac{L}{2 \epsilon} \right\rfloor^{n}.
$$

If $\epsilon \leq O(\frac{L}{n})$ , then the lower and upper bounds coincide up to an absolute constant multiplicative factor. This means that, for such level of accuracy, $\mathcal{G}(\cdot)$ is optimal for the problem class $\mathcal{P}_{\infty}$

At the same time, Theorem 1.1.2 supports our initial claim that the general optimization problems are unsolvable. Let us look at the following illustrative example.

Example 1.1.4 Consider the problem class $\mathcal{P}_{\infty}$ defined by the following parameters:

$$
L = 2, \quad n = 10, \quad \epsilon = 0.01.
$$

Note that the size of these problems is very small and we ask only for a moderate 1% accuracy.

The lower complexity bound for this class is $\left\lfloor{\frac{L}{2 \epsilon}} \right\rfloor^{n}$ calls of the oracle. Let us compute this value for our example.

<table><tr><td>Lower bound : Oracle complexity : Total complexity : Processor performance : Total time : One year :</td><td> $10^{20}$  calls of the oracle at least n arithmetic operations (a.o.)  $10^{21}{\mathrm{a.o.}}$   $10^{6}{\bf a.o.}$  per second  $10^{15} s$  less than 3.2 .  $10^{7} s$ </td></tr><tr><td>We need :</td><td>31,250,000 years</td></tr></table>

This estimate is so disappointing that we cannot maintain any hope that such problems may become solvable in the future. Let us just play with the parameters of the problem class.

- If we change n to $n + 1$ , then the estimate is multiplied by one hundred. Thus, for $n = 11$ our lower bound is valid for a much more powerful computer.

- On the contrary, if we multiply $\epsilon$ by two, we reduce the complexity by a factor of a thousand. For example, if $\epsilon = 8 \%$ , then we need only two weeks.<sup>2</sup>

We should note that the lower complexity bounds for problems with smooth functions, or for high-order methods, are not much better than the bound of Theorem 1.1.2. This can be proved using the same arguments and we leave the proof as an exercise for the reader. Comparison of the above results with the upper bounds for NP-hard problems, which are considered as classical examples of very difficult problems in Combinatorial Optimization, is also quite disappointing. To find the exact solution, the hardest combinatorial problems need only $2^{n}$ a.o. !

To conclude this section, let us compare our observations with some other fields of Numerical Analysis. It is well known that the uniform grid approach is a standard tool in many domains. For example, if we need to compute numerically the value of the integral of a univariate function

$$
\mathcal{S} = \int_{0}^{1} f(x) dx,
$$

the standard way to proceed is to form a discrete sum

$$
S_{N} = \textstyle{\frac{1}{N}} \sum_{i = 1}^{n} f(x_{i}), \quad x_{i} = \textstyle{\frac{i}{N}}, i = 1 \ldots N.
$$

If $f(\cdot)$ is Lipschitz continuous, then this value is a good approximation to $\mathcal{I}$

$$
N = L / \epsilon \quad \Rightarrow \quad | \mathcal{S} - S_{N} | \leq \epsilon.
$$

Note that in our terminology this is exactly a uniform grid approach. Moreover, this is a standard way for approximating integrals. The reason why it works here is related to the dimension of the problem. For integration, the standard dimensions are very small (up to three). However, in Optimization, sometimes we need to solve problems with several million variables.

## 1.1.4 Identity Cards of the Fields

After the pessimistic results of the previous section, we should try to find a reasonable target in the theoretical analysis of optimization schemes. It seems that everything is clear with general Global Optimization. However, maybe the goals of this field are too ambitious? In some practical problems could we be satisfied by much less “optimal” solutions? Or, are there some interesting problem classes which are not as dangerous as the class of general continuous functions?

In fact, each of these questions can be answered in different ways, each of which define the style of research (or rules of the game) in different fields of Nonlinear

Optimization. If we try to classify these fields, we can easily see that they differ one from another in the following aspects:

- Goals of the methods.

- Classes of functional components.

- Description of the oracle.

These aspects naturally define the list of desired properties of the optimization methods. Let us present the “identity cards” of the fields which we are going to consider in this book.

## 1. General Global Optimization (Sect. 1.1)

- Goals: Find a global minimum.

- Functional class: Continuous functions.

- Oracle: 0–1–2 order Black Box.

- Desired properties: Convergence to a global minimum.

- Features: From theoretical point of view, this game is too short.

- Problem sizes: Sometimes, we can solve problems with many variables. No guarantee of success even for small problems.

- History Starts from 1955. Several local peaks of interest related to new heuristic ideas (simulated annealing, genetic algorithms).

## 2. General Nonlinear Optimization (Sects. 1.2, 1.3)

- Goals: Find a local minimum.

- Functional class: Differentiable functions.

- Oracle: First- and second-order Black Box.

- Desired properties: Fast convergence to a local minimum.

- Features: Variability of approaches. Most widespread software.

The goals are not always acceptable and reachable.

- Problem sizes: Up to several thousand variables.

- History: Starts from 1955. Peak period: 1965 – 1985. Theoretical activity now is rather low.

## 3. Black Box Convex Optimization (Chaps. 2, 3, and 4)

- Goals: Find a global minimum.

- Functional class: Convex sets and functions.

- Oracle: First- and second-order Black Box.

- Desired properties: Convergence to a global minimum. The rate of convergence may depend on dimension.

- Features: Very interesting and rich complexity theory. Efficient practical methods. The problem class is sometimes restrictive.

- Problem sizes: Several thousand variables for the second-order methods, and several million for the first-order schemes.

- History: Starts from 1970. Peak period: 1975–1985. Theoretical activity now is high due to the interest to Structural Optimization and global complexity analysis of second-order methods (2006).

## 4. Structural Optimization (Part II)

- Goals: Find a global minimum.

- Functional class: Simple convex sets and functions with explicit minimax structure.

- Oracle: Second-order Black Box for special barrier functions (Chap. 5), and modified first-order Black Box (Chaps. 6, 7).

- Desired properties: Fast convergence to a global minimum. The rate of convergence depends on the structure of the problem.

- Features: Very new and perspective theory rejecting the Black Box Concept. The problem class is practically the same as in Convex Optimization.

- Problem sizes: Sometimes up to several million variables.

- History: Starts from 1984. Peak period: 1990–2000 for Interior-Point Methods. The first accelerated first-order method for problems with explicit structure was developed in 2005. Very high theoretical activity right now.

## 1.2 Local Methods in Unconstrained Minimization

(Relaxation and approximation; Necessary optimality conditions; Sufficient optimality conditions; The class of differentiable functions; The class of twice differentiable functions; The Gradient Method; Rate of convergence; Newton’s Method.)

## 1.2.1 Relaxation and Approximation

The simplest goal in general Nonlinear Optimization consists in finding a local minimum of a differentiable function. However, even to reach such a restricted goal, it is necessary to follow some special principles which guarantee convergence of the minimization process.

The majority of methods in general Nonlinear Optimization are based on the idea of relaxation.

A sequence of real numbers $\{a_{k}\}_{k = 0}^{\infty}$ is called a relaxation sequence if

$$
a_{k + 1} \leq a_{k} \quad \forall k \geq 0.
$$

In this section we consider several methods for solving the following unconstrained minimization problem:

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x),\tag{1.2.1}
$$

where $f(\cdot)$ is a smooth function. In order to do so, these methods generate a relaxation sequence of function values $\{f(x_{k})\}_{k = 0}^{\infty}$

$$
f(x_{k + 1}) \leq f(x_{k}), \quad k = 0, 1, \ldots \quad.
$$

This rule has the following important advantages.

1. If $f(\cdot)$ is bounded below on $\mathbb{R}^{n}$ , then the sequence $\{f(x_{k})\}_{k = 0}^{\infty}$ converges.

2. In any case, we improve the initial value of the objective function.

However, it is impossible to implement the idea of relaxation without employing another fundamental element of Numerical Analysis, approximation. In general,

To approximate means to replace an initial complex object by a simpler one which is close to the original in terms of its properties.

In Nonlinear Optimization, we usually apply local approximations based on derivatives of nonlinear functions. These are the first- and second-order approximations (or, the linear and quadratic approximations).

Let the function $f(\cdot)$ be differentiable at ${\bar{x}} \in \mathbb{R}^{n}$ . Then, for any $\boldsymbol{y} \in \mathbb{R}^{n}$ we have

$$
f(y) = f({\bar{x}}) + \langle \nabla f({\bar{x}}), y -{\bar{x}} \rangle + o(\| y -{\bar{x}} \|),
$$

where $o(\cdot) :[0, \infty) \to \mathbb{R}$ is a function of $r \geq 0$ satisfying the conditions

$$
\operatorname{lim}_{r \downarrow \r{0}} \frac{1}{r} o(r) = 0, \quad o(0) = 0.
$$

In the remaining part of this chapter, unless stated otherwise, we use the notation $\| \cdot \|$ for the standard Euclidean norm in $\mathbb{R}^{n}$ :

$$
\| x \| = \left[\sum_{i = 1}^{n} \left(x^{(i)} \right)^{2} \right]^{1 / 2} =(x^{T} x)^{1 / 2} = \langle x, x \rangle,
$$

where $\langle \cdot, \cdot \rangle$ is the standard inner product in the corresponding coordinate space. Note that for any $x \in \mathbb{R}^{n}, y \in \mathbb{R}^{m}$ , and matrix $A \in \mathbb{R}^{m \times n}$ we have

$$
\langle Ax, y \rangle \equiv \langle x, A^{T} y \rangle.\tag{1.2.2}
$$

The linear function $f(\bar{x}) + \langle \nabla f(\bar{x}), y - \bar{x} \rangle$ is called the linear approximation of $f$ at ${\bar{x}}.$ . Recall that the vector $\nabla f({\bar{x}})$ is called the gradient of function $f$ at $\bar{x}$ Considering the points $y_{i} = \bar{x} + \epsilon e_{i}$ , where $e_{i}$ is the ith coordinate vector in $\mathbb{R}^{n}$ and taking the limit as $\epsilon 0$ , we obtain the following coordinate representation of the gradient:

$$
\begin{array}{r}{\nabla f(\bar{x}) = \left(\frac{\partial f(\bar{x})}{\partial x^{(1)}}, \dots, \frac{\partial f(\bar{x})}{\partial x^{(n)}} \right)^{T}.} \end{array}\tag{1.2.3}
$$

Let us mention two important properties of the gradient. Denote by $\mathcal{L}_{f}(\alpha)$ the (sub)level set of $f(\cdot)$ :

$$
\mathcal{L}_{f}(\alpha) = \{x \in \mathbb{R}^{n} \mid f(x) \leq \alpha\}.
$$

Consider the set of directions that are tangent to $\mathcal{L}_{f}(f(\bar{x}))$ at x:

$$
\begin{array}{r}{S_{f}(\bar{x}) = \left\{s \in \mathbb{R}^{n} \ | \s = \operatorname{lim}_{k \to \infty} \frac{y_{k} - \bar{x}}{\Vert y_{k} - \bar{x} \Vert}, \ \mathrm{for ~ some} \ \{y_{k}\} \to \bar{x} \ \mathrm{with} \f(y_{k}) = f(\bar{x}) \ \forall k \right\}.} \end{array}
$$

Lemma 1.2.1 $Ifs \in S_{f}(\bar{x})$ , then $\langle \nabla f({\bar{x}}), s \rangle = 0.$

Proof Since $f(y_{k}) = f({\bar{x}})$ , we have

$$
f(y_{k}) = f({\bar{x}}) + \langle \nabla f({\bar{x}}), y_{k} -{\bar{x}} \rangle + o(\| y_{k} -{\bar{x}} \|) = f({\bar{x}}).
$$

Therefore $\langle \nabla f({\bar{x}}), y_{k} -{\bar{x}} \rangle + o(\parallel y_{k} -{\bar{x}} \parallel) = 0$ . Dividing this equation by $y_{k} - \bar{x}$ II and taking the limit as $y_{k} \to \bar{x}$ , we obtain the result.

Let s be a direction in $\mathbb{R}^{n}, \parallel s \parallel = 1$ . Consider the local decrease of the function $f(\cdot)$ along direction s:

$$
\begin{array}{r}{\varDelta(s) = \underset{\alpha \downarrow 0}{\operatorname{lim}} \frac{1}{\alpha}[f(\bar{x} + \alpha s) - f(\bar{x})].} \end{array}
$$

Note that $f({\bar{x}} + \alpha s) - f({\bar{x}}) = \alpha \langle \nabla f({\bar{x}}), s \rangle + o(\alpha)$ . Therefore

$$
\Delta(s) = \langle \nabla f({\bar{x}}), s \rangle.
$$

Using the Cauchy–Schwarz inequality,

$$
- \parallel x \parallel \cdot \parallel y \parallel \leq \langle x, y \rangle \leq \parallel x \parallel \cdot \parallel y \parallel,
$$

we obtain $\Delta(s) = \langle \nabla f({\bar{x}}), s \rangle \geq - \parallel \nabla f({\bar{x}})$ . Let us take

$$
\bar{s} = - \nabla f(\bar{x}) / \parallel \nabla f(\bar{x}) \parallel.
$$

Then

$$
\Delta(\bar{s}) = - \langle \nabla f(\bar{x}), \nabla f(\bar{x}) \rangle / \parallel \nabla f(\bar{x}) \parallel = - \parallel \nabla f(\bar{x}) \parallel.
$$

Thus, the direction $- \nabla f({\bar{x}})$ (the antigradient) is the direction of the fastest local decrease of the function $f(\cdot)$ at point x.

The next statement is probably the most fundamental fact in Optimization Theory.

Theorem 1.2.1 (First-Order Optimality Condition) Let $x^{*}$ be a local minimum $ofa$ differentiable function $f(\cdot)$ . Then

$$
\nabla f(x^{*}) = 0.\tag{1.2.4}
$$

Proof Since $x^{*}$ is a local minimum of $f(\cdot)$ , there exists an $r > 0$ such that for all $y \in \mathbb{R}^{n}, \| y - x^{*} \| \leq r$ , we have $f(y) \geq f(x^{*})$ . Since f is differentiable, this implies that

$$
f(y) = f(x^{*}) + \langle \nabla f(x^{*}), y - x^{*} \rangle + o(\| \y - x^{*} \|) \ge f(x^{*}).
$$

Thus, for all $s \in \mathbb{R}^{n}$ , we have $\langle \nabla f(x^{*}), s \rangle \geq 0$ . By taking $s = - \nabla f(x^{*})$ , we get $- \| \nabla f(x^{*}) \|^{2} \geq 0$ . Hence, $\nabla f(x^{*}) = 0$ .

In what follows the notation $B \succeq 0$ , where B is a symmetric $(n \times n) – \mathrm{matrix}$ means that B is positive semidefinite:

$$
\langle Bx, x \rangle \geq 0 \quad \forall x \in \mathbb{R}^{n}.
$$

The notation $B \succ 0$ means that B is positive definite (in this case, the inequality above must be strict for all $x \neq 0)$ .

Corollary 1.2.1 Let $x^{*}$ be a local minimum of a differentiable function $f(\cdot)$ subject to the linear equality constraints

$$
x \in{\mathcal{L}} \equiv \{x \in \mathbb{R}^{n} | ~ Ax = b\} \neq \emptyset,
$$

where A is an m n-matrix with full row rank, and $b \in \mathbb{R}^{m}, m < n$ . Then there exists a vector of multipliers $\lambda^{*} \in \mathbb{R}^{m}$ such that

$$
\nabla f(x^{*}) = A^{T} \lambda^{*}.\tag{1.2.5}
$$

Proof Let us assume that $\nabla f(x^{*}) ~ \neq ~ 0$ . Consider the following optimization problem:

$$
\begin{array}{r}{g^{*} = \underset{\lambda \in \mathbb{R}^{m}}{\operatorname{min}} \left\{g(\lambda) = \frac{1}{2} \Vert \nabla f(x^{*}) - A^{T} \lambda \Vert^{2} \right\}.} \end{array}\tag{1.2.6}
$$

Assume that $g^{*} > 0$ . Note that

$$
\begin{array}{r}{g(\lambda) = \frac{1}{2} \| \nabla f(x^{*}) \|^{2} - \langle \nabla f(x^{*}), A^{T} \lambda \rangle + \frac{1}{2} \langle B \lambda, \lambda \rangle,} \end{array}
$$

where $B = AA^{T} \succeq \lambda_{\operatorname{min}}(B) I_{n}$ and $\lambda_{\operatorname{min}}(B) > 0$ denotes the smallest eigenvalue of matrix B. Hence, the level sets of this function are bounded, and therefore the problem (1.2.6) has a solution $\lambda^{*}$ satisfying the first-order optimality condition:

$$
0 \stackrel{(1.2.4)}{=} \nabla g(\lambda^{*}) = B \lambda^{*} - A \nabla f(x^{*}).
$$

Thus, $\lambda^{*} = B^{- 1} A \nabla f(x^{*})$ . Let $\boldsymbol{s}^{*} =(I_{n} - A^{T} B^{- 1} A) \nabla f(\boldsymbol{x}^{*})$ . Note that $As^{*} = 0$ Then,

$$
\langle \nabla f(x^{*}), s^{*} \rangle = \| \nabla f(x^{*}) \|^{2} - \langle B^{- 1} A \nabla f(x^{*}), A \nabla f(x^{*}) \rangle = 2g^{*} \ > \0.
$$

Therefore, the optimal value of the function g can be reduced along the ray $\{x^{*} -$ $\alpha s^{*} : \alpha \geq 0\}$ . This contradiction proves that $g^{*} = 0$ □

Note that we have proved only a necessary condition for a local minimum. The points satisfying this condition are called the stationary points of the function $f$ . In order to see that such points are not always local minima, it is enough to look at the function $f(x) = x^{3}, x \in \mathbb{R}$ , at the point $x = 0$

Now let us introduce second-order approximation. Let the function $f(\cdot)$ be twice differentiable at x. Then

$$
f(y) = f(\bar{x}) + \langle \nabla f(\bar{x}), y - \bar{x} \rangle + \frac{1}{2} \langle \nabla^{2} f(\bar{x})(y - \bar{x}), y - \bar{x} \rangle + o(\| y - \bar{x} \|^{2}).
$$

The quadratic function

$$
f(\bar{x}) + \langle \nabla f(\bar{x}), y - \bar{x} \rangle + \frac{1}{2} \langle \nabla^{2} f(\bar{x})(y - \bar{x}), y - \bar{x} \rangle
$$

is called the quadratic (or second-order) approximation of the function f at ${\bar{x}}.$ Recall that $\nabla^{2} f({\bar{x}})$ is an $(n \times n)$ )-matrix with the following entries:

$$
\begin{array}{r}{(\nabla^{2} f(\bar{x}))^{(i, j)} = \frac{\partial^{2} f(\bar{x})}{\partial x^{(i)} \partial x^{(j)}}, \quad i, j = 1, \ldots, n.} \end{array}
$$

It is called the Hessian of function f at x. Note that the Hessian is a symmetric matrix:

$$
\nabla^{2} f(\bar{x}) = \left[\nabla^{2} f(\bar{x}) \right]^{T}.
$$

The Hessian can be regarded as a derivative of the vector function $\nabla f(\cdot)$

$$
\nabla f(y) = \nabla f({\bar{x}}) + \nabla^{2} f({\bar{x}})(y -{\bar{x}}) + \mathbf{0}(\| y -{\bar{x}} \|) \in \mathbb{R}^{n},\tag{1.2.7}
$$

where $\mathbf{igma} \mathbf{0}(\cdot) :[0, \infty) \mathbb{R}^{n}$ is a continuous vector function satisfying the condition

$$
\operatorname{lim}_{r \downarrow 0}{\frac{1}{r}} \parallel \mathbf{o}(r) \parallel = 0.
$$

Using the second-order approximation, we can write down the second-order optimality conditions.

Theorem 1.2.2 (Second-Order Optimality Condition) Let $x^{*}$ be a local minimum of a twice differentiable function $f(\cdot)$ . Then

$$
\nabla f(x^{*}) = 0, \quad \nabla^{2} f(x^{*}) \succeq 0.
$$

Proof Since $x^{*}$ is a local minimum of the function $f(\cdot)$ , there exists an $r > 0$ such that for all y, $\| y - x^{*} \| \leq r$ , we have

$$
f(y) \geq f(x^{*}).
$$

In view of Theorem 1.2.1, $\nabla f(x^{*}) = 0$ . Therefore, for any such $y_{:}$

$$
f(y) = f(x^{*}) + \langle \nabla^{2} f(x^{*})(y - x^{*}), y - x^{*} \rangle + o(\Vert y - x^{*} \Vert^{2}) \geq f(x^{*}).
$$

Thus, $\langle \nabla^{2} f(x^{*}) s, s \rangle \geq 0$ , for all $s, \parallel s \parallel = 1$ .

Again, the above theorem is a necessary (second-order) characteristic of a local minimum. Let us prove now a sufficient condition.

Theorem 1.2.3 Let a function $f(\cdot)$ be twice differentiable on $\mathbb{R}^{n}$ and let $x^{*} \in \mathbb{R}^{n}$ satisfy the following conditions:

$$
\nabla f(x^{*}) = 0, \quad \nabla^{2} f(x^{*}) \succ 0.
$$

Then $x^{*}$ is a strict local minimum of $f(\cdot)$

Proof Note that in a small neighborhood of a point $x^{*}$ the function $f(\cdot)$ can be represented as

$$
f(y) = f(x^{*}) +{\frac{1}{2}} \langle \nabla^{2} f(x^{*})(y - x^{*}), y - x^{*} \rangle + o(\| y - x^{*} \|^{2}).
$$

Since $\textstyle{\frac{o(r^{2})}{r^{2}}} \to 0$ as $r \downarrow 0$ , there exists a value $\bar{r} > 0$ such that for all $r \in[0, \bar{r}]$ we have

$$
\begin{array}{r}{\mid o(r^{2}) \mid \le \frac{r^{2}}{4} \lambda_{\operatorname{min}}(\nabla^{2} f(x^{*})).} \end{array}
$$

In view of our assumption, this eigenvalue is positive. Therefore, for any $\boldsymbol{y} \in \mathbb{R}^{n}$ $0 < \parallel y - x^{*} \parallel \leq \bar{r}$ , we have

$$
\begin{array}{rl} &{f(y) \geq f(x^{*}) + \frac{1}{2} \lambda_{\operatorname{min}}(\nabla^{2} f(x^{*})) \parallel y - x^{*} \parallel^{2} + o(\parallel y - x^{*} \parallel^{2})} \\ &{} \\ &{\qquad \geq f(x^{*}) + \frac{1}{4} \lambda_{\operatorname{min}}(\nabla^{2} f(x^{*})) \parallel y - x^{*} \parallel^{2} > f(x^{*}).\quad \sqcap} \end{array}
$$

## 1.2.2 Classes of Differentiable Functions

It is well known that any continuous function can be approximated by a smooth function with arbitrarily small accuracy. Therefore, assuming only differentiability of the objective function, we cannot ensure any reasonable properties of minimization processes. For that, we need to impose some additional assumptions on the magnitude of some derivatives. Traditionally, in Optimization such assumptions are presented in the form of a Lipschitz condition for a derivative of certain degree.

Let $Q$ be a subset of $\mathbb{R}^{n}$ . We denote by $C_{L}^{k, p}(\boldsymbol{Q})$ the class of functions with the following properties:

- any $f \in C_{L}^{k, p}(\mathcal{Q})$ is k times continuously differentiable on $Q$

- Its pth derivative is Lipschitz continuous on $Q$ with constant $L^{\prime}$

$$
\| \nabla^{p} f(x) - \nabla^{p} f(y) \| \leq L \| x - y \|
$$

for all $x, y \in Q$ . In this book, we usually work with $p = 1$ and $p = 2$

Clearly, we always have $p \leq k$ . If $q \geq k$ , then $C_{L}^{q, p}(Q) \subseteq C_{L}^{k, p}(Q)$ . For example, $C_{L}^{2, 1}(Q) \subseteq C_{L}^{1, 1}(Q)$ . Note also that these classes possess the following property:

If $f_{1} \in C_{L_{1}}^{k, p}(Q), f_{2} \in C_{L_{2}}^{k, p}(Q)$ and $\alpha_{1}, \alpha_{2} \in \mathbb{R}$ , then for

$$
L_{3} = \mid \alpha_{1} \mid L_{1} + \mid \alpha_{2} \mid L_{2}
$$

we have $\alpha_{1} f_{1} + \alpha_{2} f_{2} \in C_{L_{3}}^{k, p}(Q)$

We use the notation $f \in C^{k}(Q)$ for function f which is k times continuously differentiable on Q.

One of the most important classes of differentiable functions is $C_{L}^{1, 1}(\mathbb{R}^{n})$ , the class of functions with Lipschitz continuous gradient. By definition the inclusion $f \in C_{L}^{1, 1}(\mathbb{R}^{n})$ means that

$$
\parallel \nabla f(x) - \nabla f(y) \parallel \leq L \parallel x - y \parallel\tag{1.2.8}
$$

for all $x, y \in \mathbb{R}^{n}$ . Let us give a sufficient condition for this inclusion.

Lemma 1.2.2 A function f ( ) belongs to the class $C_{L}^{2, 1}(\mathbb{R}^{n}) \subset C_{L}^{1, 1}(\mathbb{R}^{n})$ if and only if for all $x \in \mathbb{R}^{n}$ we have

$$
\parallel \nabla^{2} f(x) \parallel \leq L.\tag{1.2.9}
$$

Proof Indeed, for any $x, y \in \mathbb{R}^{n}$ we have

$$
\begin{array}{rl} &{\nabla f(y) = \nabla f(x) + \overset{1}{\underset{0}{\int}} \nabla^{2} f(x + \tau(y - x))(y - x) d \tau} \\ &{\qquad = \nabla f(x) + \left(\overset{1}{\underset{0}{\int}} \nabla^{2} f(x + \tau(y - x)) d \tau \right) \cdot(y - x).} \end{array}
$$

Therefore, if condition (1.2.9) is satisfied, then

$$
\begin{array}{rl}{\| \nabla f(y) - \nabla f(x) \| = \bigg \| \bigg(\displaystyle \int_{0}^{1} \nabla^{2} f(x + \tau(y - x)) d \tau \bigg) \cdot(y - x) \bigg \|} &{} \\ &{\leq \bigg \| \displaystyle \int_{0}^{1} \nabla^{2} f(x + \tau(y - x)) d \tau \bigg \| \cdot \| y - x \|} \\ &{\leq \displaystyle \int_{0}^{1} \| \nabla^{2} f(x + \tau(y - x)) \| d \tau \cdot \| y - x \|} \\ &{\leq L \| y - x \|.} \end{array}
$$

On the other hand, if $f \in C_{L}^{2, 1}(\mathbb{R}^{n})$ , then for any $s \in \mathbb{R}^{n}$ and $\alpha > 0$ , we have

$$
\begin{array}{r}{\left\| \left(\int_{0}^{\alpha} \nabla^{2} f(x + \tau s) d \tau \right) \cdot s \right\| = \| \nabla f(x + \alpha s) - \nabla f(x) \| \leq \alpha L \| s \|.} \end{array}
$$

Dividing this inequality by α and taking $\alpha \downarrow 0,$ , we obtain (1.2.9).

Note that the condition (1.2.9) can be written in the form of a matrix inequality:

$$
- LI_{n} \preceq \nabla^{2} f(x) \ \preceq \LI_{n}, \quad \forall x \in \mathbb{R}^{n}.\tag{1.2.10}
$$

Lemma 1.2.2 provides us with many examples of functions with Lipschitz continuous gradient.

## Example 1.2.1

1. The linear function $f(x) = \alpha + \langle a, x \rangle \in C_{0}^{1, 1}(\mathbb{R}^{n})$ since

$$
\nabla f(x) = a, \quad \nabla^{2} f(x) = 0.
$$

2. For a quadratic function $\begin{array}{r}{f(x) = \alpha + \langle a, x \rangle + \frac{1}{2} \langle Ax, x \rangle} \end{array}$ with $A = A^{T}$ , we have

$$
\nabla f(x) = a + Ax, \quad \nabla^{2} f(x) = A.
$$

Therefore $f(\cdot) \in C_{L}^{1, 1}(\mathbb{R}^{n})$ with $L = \parallel{} A \parallel$

3. Consider the function of one variable $f(x) = \sqrt{1 + x^{2}}, x \in \mathbb{R}$ . We have

$$
\begin{array}{r}{\nabla f(x) = \frac{x}{\sqrt{1 + x^{2}}}, \nabla^{2} f(x) = \frac{1}{(1 + x^{2})^{3 / 2}} \leq 1.} \end{array}
$$

Therefore, $f(\cdot) \in C_{1}^{1, 1}(\mathbb{R})$ □

The next statement is important for the geometric interpretation of functions in $C_{L}^{1, 1}(\mathbb{R}^{n})$

Lemma 1.2.3 Let $f \in C_{L}^{1, 1}(\mathbb{R}^{n})$ . Then, for any x, y from $\mathbb{R}^{n}$ , we have

$$
\begin{array}{r}{\mid f(y) - f(x) - \langle \nabla f(x), y - x \rangle \mid \leq \frac{L}{2} \parallel y - x \parallel^{2}.} \end{array}\tag{1.2.11}
$$

Proof For all x, $\boldsymbol{y} \in \mathbb{R}^{n}$ , we have

$$
\begin{array}{l}{f(y) = f(x) + \displaystyle \int_{0}^{1} \langle \nabla f(x + \tau(y - x)), y - x \rangle d \tau} \\{\displaystyle} \\{= f(x) + \langle \nabla f(x), y - x \rangle + \displaystyle \int_{0}^{1} \langle \nabla f(x + \tau(y - x)) - \nabla f(x), y - x \rangle d \tau.} \end{array}
$$

Therefore,

$$
\begin{array}{rl} &{\quad | \int(y) - f(x) - \{\nabla f(x), y - x\} |} \\ &{= | \int_{0}^{1} \langle yf(x + \tau(y - x)) - \nabla f(x), y - x \rangle d \tau |} \\ &{= | \int_{0}^{1} \langle yf(x + \tau(y - x)) - \nabla f(x), y - x \rangle | d \tau} \\ &{\le \frac{1}{0} | \left.\nabla f(x + \tau(y - x)) - \nabla f(x), y - x \right.| d \tau} \\ &{\le \frac{1}{0} | \| \nabla f(x + \tau(y - x)) - \nabla f(x) \| \cdot \| y - x \| d \tau} \\ &{\le \frac{1}{0} | \tau \| \gamma - x \|^{2} d \tau = \frac{L}{2} \| y - x \|^{2}.\eqno{(1)}} \end{array}
$$

Geometrically, we have the following picture. Consider a function $f \in C_{L}^{1, 1}(\mathbb{R}^{n})$ Let us fix a point $x_{0} \in \mathbb{R}^{n}$ , and define two quadratic functions

$$
\begin{array}{r}{\phi_{1}(x) = f(x_{0}) + \langle \nabla f(x_{0}), x - x_{0} \rangle - \frac{L}{2} \parallel x - x_{0} \parallel^{2},} \end{array}
$$

$$
\begin{array}{r}{\phi_{2}(x) = f(x_{0}) + \langle \nabla f(x_{0}), x - x_{0} \rangle + \frac{L}{2} \parallel x - x_{0} \parallel^{2}.} \end{array}
$$

Then the graph of the function f lies between the graphs of $\phi_{1}$ and $\phi_{2}$ :

$$
\begin{array}{r}{\phi_{1}(x) \leq f(x) \leq \phi_{2}(x), \quad \forall x \in \mathbb{R}^{n}.} \end{array}
$$

Let us prove similar results for the class of twice differentiable functions. The main class of functions of this type is $C_{M}^{2, 2}(\mathbb{R}^{n})$ , the class of twice differentiable functions with Lipschitz continuous Hessian. Recall that for $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$ , we have

$$
\parallel \nabla^{2} f(x) - \nabla^{2} f(y) \parallel \leq M \parallel x - y \parallel, \quad \forall x, y \in \mathbb{R}^{n}.\tag{1.2.12}
$$

Lemma 1.2.4 Let $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$ . Then for all x, $y \in \mathbb{R}^{n}$ we have

$$
\begin{array}{r}{\parallel \nabla f(y) - \nabla f(x) - \nabla^{2} f(x)(y - x) \parallel \le \frac{M}{2} \parallel y - x \parallel^{2},} \end{array}\tag{1.2.13}
$$

$$
\begin{array}{rl} &{| f(y) - f(x) - \langle \nabla f(x), y - x \rangle - \frac{1}{2} \langle \nabla^{2} f(x)(y - x), y - x \rangle |} \\ &{} \\ &{\qquad \leq \frac{M}{6} \parallel y - x \parallel^{3}.} \end{array}\tag{1.2.14}
$$

Proof Let us fix some x, $y \in \mathbb{R}^{n}$ . Then

$$
\begin{array}{c}{{\nabla f(y) = \nabla f(x) + \displaystyle \int_{0}^{1} \nabla^{2} f(x + \tau(y - x))(y - x) d \tau}} \\{{\nonumber}} \\{{= \nabla f(x) + \nabla^{2} f(x)(y - x) + \displaystyle \int_{0}^{1} f(\nabla^{2} f(x + \tau(y - x)) - \nabla^{2} f(x))(y - x) d \tau.}} \end{array}
$$

Therefore,

$$
\begin{array}{rl} &{\quad \| \nabla f(y) - \nabla f(x) - \nabla^{2} f(x)(y - x) \|} \\ &{= \| \ \frac{1}{\beta}(\nabla^{2} f(x + \tau(y - x)) - \nabla^{2} f(x))(y - x) d \tau \ \|} \\ &{= \| \ \frac{1}{\beta}(\nabla^{2} f(x + \tau(y - x)) - \nabla^{2} f(x))(y - x) \| \d \tau} \\ &{\le \frac{1}{\beta} \| \(\nabla^{2} f(x + \tau(y - x)) - \nabla^{2} f(x))(y - x) \| \d \tau} \\ &{\le \frac{1}{\beta} \| \ \nabla^{2} f(x + \tau(y - x)) - \nabla^{2} f(x) \| \cdot \| \y - x \| \d \tau} \\ &{\le \frac{1}{\beta} \tau M \ \| y - x \|^{2} d \tau = \frac{M}{2} \| y - x \|^{2}.} \end{array}
$$

Inequality (1.2.14) can be proved in a similar way.

Corollary 1.2.2 Let $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$ and x, $\boldsymbol{y} \in \mathbb{R}^{n}$ with $\| \textbf{\}} y - x{\textbf{\|}} = r$ . Then

$$
\nabla^{2} f(x) - MrI_{n} \preceq \nabla^{2} f(y) \preceq \nabla^{2} f(x) + MrI_{n}.
$$

(Recall that for matrices A and B we write $A \succeq B$ if $A - B \succeq 0.)$

Proof Let $G = \nabla^{2} f(y) - \nabla^{2} f(x)$ . Since $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$ , we have $\|{\textbf{\em G}} \| \leq Mr$ . This means that the eigenvalues of the symmetric matrix $G, \lambda_{i}(G)$ , satisfy the following inequality:

$$
\mid \lambda_{i}(G) \mid \leq Mr, \quad i = 1 \ldots n.
$$

Hence, $- MrI_{n} \preceq G \equiv \nabla^{2} f(y) - \nabla^{2} f(x) \preceq MrI_{n}$ .

## 1.2.3 The Gradient Method

Now we are ready to sudy the rate of convergence of unconstrained minimization schemes. Let us start with the simplest method. As we have already seen, the antigradient is the direction of locally steepest descent of a differentiable function. Since we are going to find a local minimum, the following strategy is the first to be tried.

## Gradient Method

(1.2.15)

Choose $x_{0} \in \mathbb{R}^{n}$

$$
x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k}), k = 0, 1, \ldots.
$$

We will refer to this scheme as the Gradient Method. The scalar factors for the gradients, $h_{k}$ , are called the step sizes. Of course, they must be positive.

There are many variants of this method, which differ one from another by the step-size strategy. Let us consider the most important examples.

1. The sequence $\{h_{k}\}_{k = 0}^{\infty}$ is chosen in advance. For example,

$$
h_{k} = h > 0,(\mathrm{constantstep})
$$

$$
\begin{array}{r}{h_{k} = \frac{h}{\sqrt{k + 1}}.} \end{array}
$$

2. Full relaxation:

$$
h_{k} = \arg \operatorname{min}_{h \geq 0} \f(x_{k} - h \nabla f(x_{k})).
$$

3. The Armijo rule: Find $x_{k + 1} = x_{k} - h \nabla f(x_{k})$ with $h > 0$ such that

$$
\alpha \langle \nabla f(x_{k}), x_{k} - x_{k + 1} \rangle \leq f(x_{k}) - f(x_{k + 1}),\tag{1.2.16}
$$

$$
\begin{array}{r}{\beta \langle \nabla f(x_{k}), x_{k} - x_{k + 1} \rangle \geq f(x_{k}) - f(x_{k + 1}),} \end{array}\tag{1.2.17}
$$

where $0 < \alpha < \beta < 1$ are some fixed parameters.

Comparing these strategies, we see that the first strategy is the simplest one. It is often used in the context of Convex Optimization. In this framework, the behavior of functions is much more predictable than in the general nonlinear case.

The second strategy is completely theoretical. It is never used in practice since even in one-dimensional case we cannot find the exact minimum in finite time.

The third strategy is used in the majority of practical algorithms. It has the following geometric interpretation. Let us fix $x \in \mathbb{R}^{n}$ assuming that $\nabla f(x) \neq 0$ Consider the following function of one variable:

$$
\phi(h) = f(x - h \nabla f(x)), \quad h \geq 0.
$$

Then the step-size values acceptable for this strategy belong to the part of the graph of $\phi$ which is located between two linear functions:

$$
\phi_{1}(h) = f(x) - \alpha h \parallel \nabla f(x) \parallel^{2}, \quad \phi_{2}(h) = f(x) - \beta h \parallel \nabla f(x) \parallel^{2}.
$$

Note that $\phi(0) = \phi_{1}(0) = \phi_{2}(0)$ and $\phi^{\prime}(0) < \phi_{2}^{\prime}(0) < \phi_{1}^{\prime}(0) < 0$ . Therefore, the acceptable values exist unless $\phi(\cdot)$ is not bounded below. There are several very fast one-dimensional procedures for finding a point satisfying the Armijo conditions. However, their detailed description is not important for us now.

Let us estimate the performance of the Gradient Method. Consider the problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x),\tag{1.2.18}
$$

with $f \in C_{L}^{1, 1}(\mathbb{R}^{n})$ , and assume that $f(\cdot)$ is bounded below on $\mathbb{R}^{n}$

Let us evaluate the result of one gradient step. Consider $y = x - h \nabla f(x)$ . Then, in view of (1.2.11), we have

$$
\begin{array}{rl} &{f(y) \leq f(x) + \langle \nabla f(x), y - x \rangle + \frac{L}{2} \parallel y - x \parallel^{2}} \\ &{} \\ &{\qquad = f(x) - h \parallel \nabla f(x) \parallel^{2} + \frac{h^{2}}{2} L \parallel \nabla f(x) \parallel^{2}} \\ &{} \\ &{\qquad = f(x) - h(1 - \frac{h}{2} L) \parallel \nabla f(x) \parallel^{2}.} \end{array}\tag{1.2.19}
$$

Thus, in order to get the best upper bound for the possible decrease of the objective function, we have to solve the following one-dimensional problem:

$$
\begin{array}{r}{\Delta(h) = - h(1 - \frac{h}{2} L) \operatorname{min}.} \end{array}
$$

Computing the derivative of this function, we conclude that the optimal step size must satisfy the equation $\varDelta^{\prime}(h) = hL - 1 = 0$ . Thus, $\begin{array}{r}{h^{*} = \frac{1}{L}} \end{array}$ , which is a minimum of $\varDelta(h)$ since $\varDelta^{\prime \prime}(h) = L > 0$

Thus, our considerations prove that one step of the Gradient Method decreases the value of the objective function at least as follows:

$$
\begin{array}{r}{f(y) \leq f(x) - \frac{1}{2L} \parallel \nabla f(x) \parallel^{2}.} \end{array}
$$

Let us check what is going on with the other step-size strategies.

Let $x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k})$ . Then for the constant step strategy, $h_{k} = h$ , we have

$$
f(x_{k}) - f(x_{k + 1}) \geq h(1 -{\frac{1}{2}} Lh) \parallel \nabla f(x_{k}) \parallel^{2}.
$$

Therefore, if we choose $\begin{array}{r}{h_{k} = \frac{2 \alpha}{L}} \end{array}$ with $\alpha \in(0, 1)$ , then

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{2}{L} \alpha(1 - \alpha) \parallel \nabla f(x_{k}) \parallel^{2}.} \end{array}
$$

Of course, the optimal choice is $\begin{array}{r}{h_{k} = \frac{1}{L}} \end{array}$

For the full relaxation strategy we have

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{1}{2L} \parallel \nabla f(x_{k}) \parallel^{2}} \end{array}
$$

since the maximal decrease is not worse than the decrease attained by $\begin{array}{r}{h_{k} = \frac{1}{L}} \end{array}$

Finally, for the Armijo rule, in view of (1.2.17), we have

$$
f(x_{k}) - f(x_{k + 1}) \leq \beta \langle \nabla f(x_{k}), x_{k} - x_{k + 1} \rangle = \beta h_{k} \parallel \nabla f(x_{k}) \parallel^{2}.
$$

From (1.2.19), we obtain

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq h_{k} \left(1 - \frac{h_{k}}{2} L \right) \parallel \nabla f(x_{k}) \parallel^{2}.} \end{array}
$$

Therefore, $\begin{array}{r}{h_{k} \ge \frac{2}{L}(1 - \beta)} \end{array}$ . Further, using (1.2.16), we have

$$
f(x_{k}) - f(x_{k + 1}) \geq \alpha \langle \nabla f(x_{k}), x_{k} - x_{k + 1} \rangle = \alpha h_{k} \parallel \nabla f(x_{k}) \parallel^{2}.
$$

Combining this inequality with the previous one, we conclude that

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{2}{L} \alpha(1 - \beta) \parallel \nabla f(x_{k}) \parallel^{2}.} \end{array}
$$

Thus, we have proved that in all cases we have

$$
\begin{array}{r}{f(x_{k}) - f(x_{k + 1}) \geq \frac{\omega}{L} \parallel \nabla f(x_{k}) \parallel^{2},} \end{array}\tag{1.2.20}
$$

where $\omega$ is some positive constant.

Now we are ready to estimate the performance of Gradient Method. Summing up the inequalities (1.2.20) for $k = 0 \ldots N$ , we obtain

$$
\frac{\omega}{L} \sum_{k = 0}^{N} \parallel \nabla f(x_{k}) \parallel^{2} \leq f(x_{0}) - f(x_{N + 1}) \leq f(x_{0}) - f^{*},\tag{1.2.21}
$$

where $f^{*}$ is a lower bounds for the values of objective function in the problem (1.2.1). As a simple consequence of the bound (1.2.21), we have

$$
\parallel \nabla f(x_{k}) \parallel 0 \quad \mathrm{as} \quad k \infty.
$$

However, we can also say something about the rate of convergence. Indeed, define

$$
g_{N}^{*} = \operatorname{min}_{0 \leq k \leq N} \parallel \nabla f(x_{k}) \parallel.
$$

Then, in view of (1.2.21), we come to the following inequality:

$$
\begin{array}{r}{g_{N}^{*} \leq \frac{1}{\sqrt{N + 1}} \left[\frac{1}{\omega} L(f(x_{0}) - f^{*}) \right]^{1 / 2}.} \end{array}\tag{1.2.22}
$$

The right-hand side of this inequality describes the rate of convergence of the sequence $\{g_{N}^{*}\}$ to zero. Note that we cannot say anything about the rate of convergence of the sequences $\{f(x_{k})\}$ and $\{x_{k}\}$

Recall that in general Nonlinear Optimization, our current goal is quite modest: we only want to approach a local minimum of the optimization problem (1.2.18). Nevertheless, in general, even this goal is unreachable for the Gradient Method. Let us consider the following example.

Example 1.2.2 Consider the following function of two variables:

$$
\begin{array}{r}{f(x) \equiv f(x^{(1)}, x^{(2)}) = \frac{1}{2}(x^{(1)})^{2} + \frac{1}{4}(x^{(2)})^{4} - \frac{1}{2}(x^{(2)})^{2}.} \end{array}
$$

The gradient of this function is $\nabla f(x) =(x^{(1)},(x^{(2)})^{3} - x^{(2)})^{T}$ . Therefore, there are only three points which can pretend to be a local minimum of this function:

$$
x_{1}^{*} =(0, 0), \quad x_{2}^{*} =(0, - 1), \quad x_{3}^{*} =(0, 1).
$$

Computing the Hessian of this function,

$$
\nabla^{2} f(x) ={\binom{1}{0}}(1 \qquad 0
$$

we conclude that $x_{2}^{*}$ and $x_{3}^{*}$ are isolated local minima,<sup>3</sup> but $x_{1}^{*}$ is only a stationary point of our function. Indeed, $f(x_{1}^{*}) = 0$ and $\begin{array}{r}{f(x_{1}^{*} + \epsilon e_{2}) = \frac{\epsilon^{4}}{4} - \frac{\epsilon^{2}}{2} < 0} \end{array}$ for $\epsilon$ small enough.

Let us consider now the trajectory of the Gradient Method which starts at $x_{0} =$ $(1, 0)$ . Note that the second coordinate of this point is zero. Therefore, the second coordinate of $\nabla f(x_{0})$ is also zero. Consequently, the second coordinate of $x_{1}$ is zero, etc. Thus, the entire sequence of points generated by the Gradient Method will have the second coordinate equal to zero. This means that this sequence converges to $x_{1}^{*}$

To conclude our example, note that this situation is typical for all first-order unconstrained minimization methods. Without additional rather restrictive assumptions, it is impossible to guarantee their global convergence to a local minimum. Only a stationary point can be approached by these schemes.

Note that inequality (1.2.22) provides us with an example of a new notion, that is, the rate $of$ convergence of a minimization process. How can we use this information in the complexity analysis? The rate of convergence delivers an upper complexity bound for the corresponding problem class. Such a bound is always justified by some numerical method. A method for which the upper complexity bound is proportional to the lower complexity bound of the problem class is said to be optimal. Recall that in Sect. 1.1.3 we have already seen an optimal method for the problem class $\mathcal{P}_{\infty}$

Let us now present a formal description of our result. Consider the following problem class $\mathcal{G}_{*}$

<table><tr><td rowspan=1 colspan=1>Model :</td><td rowspan=1 colspan=1>1. Unconstrained minimization.2. $f \in C_{L}^{1, 1}(\mathbb{R}^{n})$ 3. f (·) is bounded below by the value $f^{*}$ </td></tr><tr><td rowspan=1 colspan=1>Oracle :</td><td rowspan=1 colspan=1>First-order Black Box.</td></tr><tr><td rowspan=1 colspan=1>ε-solution :</td><td rowspan=1 colspan=1> $f({\bar{x}}) \leq f(x_{0}), \ \| \ \nabla f({\bar{x}}) \ \| \leq \epsilon.$ </td></tr></table>

(1.2.23)

Note that inequality (1.2.22) can be used in order to obtain an upper bound for the number of steps (= calls of the oracle), which is necessary to find a point where the norm of the gradient is small. For that, let us write down the following inequality:

$$
\begin{array}{r}{g_{N}^{*} \leq \frac{1}{\sqrt{N + 1}} \left[\frac{1}{\omega} L(f(x_{0}) - f^{*}) \right]^{1 / 2} \leq \epsilon.} \end{array}\tag{1.2.24}
$$

Therefore, if $\begin{array}{r}{N + 1 \ge \frac{L}{\omega \epsilon^{2}}(f(x_{0}) - f^{*})} \end{array}$ , then we necessarily have $g_{N}^{*} \leq \epsilon$

Thus, we can use the value $\begin{array}{r}{\frac{L}{\omega \epsilon^{2}}(f(x_{0}) - f^{*})} \end{array}$ as an upper complexity bound for our problem class. Comparing this estimate with the result of Theorem 1.1.2, we can see that it is much better. At least it does not depend on n. The lower complexity bound for the class $\mathcal{G}_{*}$ is unknown.

Let us see, what can be said about the local convergence of the Gradient Method. Consider the unconstrained minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x)
$$

under the following assumptions.

1. $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$

2. There exists a local minimum $x^{*} \in \mathbb{R}^{n}$ of function f at which the Hessian is positive definite.

3. We know some bounds $0 < \mu \le L < \infty$ for the Hessian at $x^{*}$

$$
\mu I_{n} \preceq \nabla^{2} f(x^{*}) \preceq LI_{n}.\tag{1.2.25}
$$

4. Our starting point $x_{0}$ is close enough to $x^{*}$

Consider the process: $x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k})$ . Note that $\nabla f(x^{*}) = 0$ . Hence,

$$
\begin{array}{l}{\nabla f(x_{k}) = \nabla f(x_{k}) - \nabla f(x^{*}) = \displaystyle \int_{0}^{1} \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*}))(x_{k} - x^{*}) d \tau} \\{\quad \quad} \\{= G_{k}(x_{k} - x^{*}),} \end{array}
$$

where $\begin{array}{r}{G_{k} = \int \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*})) d \tau} \\{0} \end{array}$ . Therefore,

$$
x_{k + 1} - x^{*} = x_{k} - x^{*} - h_{k} G_{k}(x_{k} - x^{*}) =(I_{n} - h_{k} G_{k})(x_{k} - x^{*}).
$$

There is a standard technique for analyzing processes of this type, which is based on contraction mappings. Let the sequence $\{a_{k}\}$ be defined as follows:

$$
a_{0} \in \mathbb{R}^{n}, \quad a_{k + 1} = A_{k} a_{k},
$$

where $A_{k}$ are $(n \times n)$ -matrices such that $\parallel A_{k} \parallel \leq 1 - q$ for all $k \geq 0$ with $q \in(0, 1)$ Then we can estimate the rate of convergence of the sequence $\{a_{k}\}$ to zero:

$$
\begin{array}{r}{\parallel a_{k + 1} \parallel \leq(1 - q) \parallel a_{k} \parallel \leq(1 - q)^{k + 1} \parallel a_{0} \parallel \to 0.} \end{array}
$$

In our case, we need to estimate $I_{n} - h_{k} G_{k} \parallel$ . Let $r_{k} = \parallel x_{k} - x^{*}$ . In view of Corollary 1.2.2, we have

$$
\nabla^{2} f(x^{*}) - \tau Mr_{k} I_{n} \preceq \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*})) \preceq \nabla^{2} f(x^{*}) + \tau Mr_{k} I_{n}.
$$

Therefore, using assumption (1.2.25), we obtain

$$
\begin{array}{r}{(\mu - \frac{r_{k}}{2} M) I_{n} \preceq G_{k} \preceq(L + \frac{r_{k}}{2} M) I_{n}.} \end{array}
$$

Hence, $\begin{array}{r}{(1 - h_{k}(L + \frac{r_{k}}{2} M)) I_{n} \preceq I_{n} - h_{k} G_{k} \preceq(1 - h_{k}(\mu - \frac{r_{k}}{2} M)) I_{n}} \end{array}$ , and we conclude that

$$
\parallel I_{n} - h_{k} G_{k} \parallel \leq \operatorname{max} \{a_{k}(h_{k}), b_{k}(h_{k})\},\tag{1.2.26}
$$

where $\begin{array}{r}{a_{k}(h) = 1 - h(\mu - \frac{r_{k}}{2} M)} \end{array}$ and $\begin{array}{r}{b_{k}(h) = h(L + \frac{r_{k}}{\gamma} M) - 1} \end{array}$

Note that $a_{k}(0) = 1$ and $b_{k}(0) = - 1$ . Therefore, if $\begin{array}{r}{0 < r_{k} < \bar{r} \equiv \frac{2 \mu}{M}} \end{array}$ , then $a_{k}(\cdot)$ is a strictly decreasing function and we can ensure

$$
\parallel I_{n} - h_{k} G_{k} \parallel < 1
$$

for $h_{k}$ small enough. In this case, we will have $r_{k + 1} < r_{k}$

As usual, many step-size strategies are available. For example, we can choose $\begin{array}{r}{h_{k} = \frac{1}{L}} \end{array}$ . Let us consider the “optimal” strategy consisting in minimizing the righthand side of (1.2.26):

$$
\operatorname{max} \{a_{k}(h), b_{k}(h)\} \to \operatorname{min}_{h}.
$$

Assume that $r_{0} < \bar{r}$ . Then, if we form the sequence $\{x_{k}\}$ using the optimal strategy, we can be sure that $r_{k + 1} < r_{k} < \bar{r}$ . Further, the optimal step size $h_{k}^{*}$ can be found from the equation

$$
\begin{array}{r}{a_{k}(h) = b_{k}(h) \quad \Leftrightarrow \quad 1 - h(\mu - \frac{r_{k}}{2} M) = h(L + \frac{r_{k}}{2} M) - 1.} \end{array}
$$

Hence

$$
\begin{array}{r}{h_{k}^{*} = \frac{2}{L + \mu}.} \end{array}\tag{1.2.27}
$$

(Surprisingly enough, the optimal step size does not depend on M.) Under this choice, we obtain

$$
\begin{array}{r}{r_{k + 1} \le \frac{(L - \mu) r_{k}}{L + \mu} + \frac{Mr_{k}^{2}}{L + \mu}.} \end{array}
$$

Let us estimate the rate of convergence of the process. Let $\begin{array}{r}{q \ = \ \frac{2 \mu}{L + \mu}} \end{array}$ and $a_{k} =$ $\begin{array}{r}{\frac{M}{L + \mu} r_{k} \left(< q \right)\} \end{array}$ . Then

$$
\begin{array}{r}{a_{k + 1} \leq(1 - q) a_{k} + a_{k}^{2} = a_{k}(1 +(a_{k} - q)) = \frac{a_{k}(1 -(a_{k} - q)^{2})}{1 -(a_{k} - q)} \leq \frac{a_{k}}{1 + q - a_{k}}.} \end{array}
$$

Therefore $\begin{array}{r}{\frac{1}{a_{k + 1}} \geq \frac{1 + q}{a_{k}} - 1} \end{array}$ , or

$$
\begin{array}{r}{\frac{q}{a_{k + 1}} - 1 \geq \frac{q(1 + q)}{a_{k}} - q - 1 =(1 + q) \left(\frac{q}{a_{k}} - 1 \right).} \end{array}
$$

Hence,

$$
\begin{array}{rl} &{\frac{q}{a_{k}} - 1 \geq(1 + q)^{k} \left(\frac{q}{a_{0}} - 1 \right) =(1 + q)^{k} \left(\frac{2 \mu}{L + \mu} \cdot \frac{L + \mu}{r_{0} M} - 1 \right)} \\ &{} \\ &{\qquad =(1 + q)^{k} \left(\frac{\bar{r}}{r_{0}} - 1 \right).} \end{array}
$$

Thus,

$$
\begin{array}{r}{a_{k} \leq \frac{qr_{0}}{r_{0} +(1 + q)^{k}(\bar{r} - r_{0})} \leq \frac{qr_{0}}{\bar{r} - r_{0}} \left(\frac{1}{1 + q} \right)^{k}.} \end{array}
$$

This proves the following theorem.

Theorem 1.2.4 Let the function $f(\cdot)$ satisfy our assumptions and let the starting point $x_{0}$ be close enough to a strict local minimum $x^{*}$ :

$$
\begin{array}{r}{r_{0} = \parallel{x}_{0} -{x}^{*} \parallel < \bar{r} = \frac{2 \mu}{M}.} \end{array}
$$

Then the Gradient Method with step size (1.2.27) converges as follows:

$$
\begin{array}{r}{\parallel{} x_{k} - x^{*} \parallel \leq \frac{\bar{r} r_{0}}{\bar{r} - r_{0}} \left(1 - \frac{2 \mu}{L + 3 \mu} \right)^{k}.} \end{array}
$$

This type of rate of convergence is called linear.

## 1.2.4 Newton’s Method

Newton’s Method is widely known as a technique for finding a root of a univariate function. Let $\phi(\cdot) : \mathbb{R} \to \mathbb{R}$ . Consider the equation

$$
\phi(t^{*}) = 0.
$$

Newton’s rule can be obtained by linear approximation. Assume that we know some $t \in \mathbb{R}$ which is close enough to $t^{*}$ . Note that

$$
\phi(t + \Delta t) = \phi(t) + \phi^{\prime}(t) \Delta t + o(\mid \Delta t \mid).
$$

Therefore, the solution of the equation φ $(t + \varDelta t) = 0$ can be approximated by the solution of the following linear equation:

$$
\phi(t) + \phi^{\prime}(t) \varDelta t = 0.
$$

Under some conditions, we can expect the displacement Δt to be a good approximation to the optimal displacement $\varDelta t^{*} = t^{*} - t$ . Converting this idea into an algorithm, we get the process

$$
\begin{array}{r}{t_{k + 1} = t_{k} - \frac{\phi(t_{k})}{\phi^{\prime}(t_{k})}.} \end{array}
$$

This scheme can be naturally extended to the problem of finding a solution to a system of nonlinear equations,

$$
F(x) = 0,
$$

where $x \in \mathbb{R}^{n}$ and $F(\cdot) : \mathbb{R}^{n} \to \mathbb{R}^{n}$ . In this case, we need to define the displacement Δx as a solution to the following system of linear equations:

$$
F(x) + F^{\prime}(x) \varDelta x = 0
$$

(called the Newton system). If the Jacobian $F^{\prime}(x)$ is nondegenerate, we can compute the displacement $\varDelta x = -[F^{\prime}(x)]^{- 1} F(x)$ . The corresponding iterative scheme is as follows:

$$
x_{k + 1} = x_{k} -[F^{\prime}(x_{k})]^{- 1} F(x_{k}).
$$

Finally, in view of Theorem 1.2.1, we can replace the unconstrained minimization problem (1.2.1) by the problem of finding a root of the nonlinear system

$$
\nabla f(x) = 0.\tag{1.2.28}
$$

(This replacement is not completely equivalent, but it works in nondegenerate situations.) Further, to solve (1.2.28) we can apply the standard Newton Method for the system of nonlinear equations. In this case, the Newton system is as follows:

$$
\nabla f(x) + \nabla^{2} f(x) \varDelta x = 0.
$$

Hence, the Newton’s Method for optimization problems can be written in the following form:

$$
x_{k + 1} = x_{k} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}).\tag{1.2.29}
$$

Note that we can obtain the process (1.2.29) using the idea of quadratic approximation. Consider this approximation, computed with respect to the point $x_{k} \mathrm{:}$

$$
\phi(x) = f(x_{k}) + \langle \nabla f(x_{k}), x - x_{k} \rangle + \frac{1}{2} \langle \nabla^{2} f(x_{k})(x - x_{k}), x - x_{k} \rangle.
$$

Assume that $\nabla^{2} f(x_{k}) \ \succ \0$ . Then we can choose $x_{k + 1}$ as the minimizer of the quadratic function $\phi(\cdot)$ . This means that

$$
\nabla \phi(x_{k + 1}) = \nabla f(x_{k}) + \nabla^{2} f(x_{k})(x_{k + 1} - x_{k}) = 0,
$$

and we come again to Newton’s process (1.2.29).

We will see that the convergence of the Newton’s Method in a neighborhood of a strict local minimum is very fast. However, this method has two serious drawbacks. Firstly, it can break down if $\nabla^{2} f(x_{k})$ is degenerate. Secondly, Newton’s process can diverge. Let us look at the following example.

Example 1.2.3 Let us apply the Newton’s Method for finding a root of the following univariate function:

$$
\begin{array}{r}{\phi(t) = \frac{t}{\sqrt{1 + t^{2}}}.} \end{array}
$$

Clearly, $t^{*} = 0$ . Note that

$$
\begin{array}{r}{\phi^{\prime}(t) = \frac{1}{[1 + t^{2}]^{3 / 2}}.} \end{array}
$$

Therefore Newton’s process is as follows:

$$
\begin{array}{r}{t_{k + 1} = t_{k} - \frac{\phi(t_{k})}{\phi^{\prime}(t_{k})} = t_{k} - \frac{t_{k}}{\sqrt{1 + t_{k}^{2}}} \cdot[1 + t_{k}^{2}]^{3 / 2} = - t_{k}^{3}.} \end{array}
$$

Thus, if $\mid t_{0} \mid < 1$ , then this method converges and the convergence is extremely fast. The points 1 are oscillation points of this scheme. $\mathrm{~ If ~} | \t_{0} \ | > \1$ , then the method diverges.

In order to avoid a possible divergence, in practice we can apply the damped Newton’s method:

$$
x_{k + 1} = x_{k} - h_{k}[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k}),
$$

where $h_{k} \ > \0$ is a step size parameter. At the initial stage of the method we can use the same step size strategies as for the gradient scheme. At the final stage, it is reasonable to choose $h_{k} \ = \1$ . Another possibility for ensuring the global

convergence of this scheme consists in using Cubic Regularization. This approach will be studied in detail in Chap. 4.

Let us derive the local rate of convergence of the Newton’s Method. Consider the problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} ~ f(x)
$$

under the following assumptions:

1. $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$

2. There exists a local minimum of the function f with positive definite Hessian:

$$
\nabla^{2} f(x^{*}) \succeq \mu I_{n}, \quad \mu > 0.\tag{1.2.30}
$$

3. Our starting point $x_{0}$ is close enough to $x^{*}$

Consider the process $x_{k + 1} = x_{k} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k})$ . Then, using the same reasoning as for the Gradient Method, we obtain the following representation:

$$
\begin{array}{rl} &{x_{k + 1} - x^{*} = x_{k} - x^{*} -[\nabla^{2} f(x_{k})]^{- 1} \nabla f(x_{k})} \\ &{} \\ &{\qquad = x_{k} - x^{*} -[\nabla^{2} f(x_{k})]^{- 1} \int \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*}))(x_{k} - x^{*}) d \tau} \\ &{\qquad \quad 0} \\ &{} \\ &{\qquad =[\nabla^{2} f(x_{k})]^{- 1} G_{k}(x_{k} - x^{*}),} \end{array}
$$

where $\begin{array}{r}{G_{k} = \underset{0}{\overset{1}{\int}}[\nabla^{2} f(x_{k}) - \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*}))] d \tau.} \end{array}$

Let $r_{k} = \parallel x_{k} - x^{*}$ . Then

$$
\begin{array}{rl} &{\| \G_{k} \| = \| \int_{0}^{1}[\nabla^{2} f(x_{k}) - \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*}))] d \tau \|} \\ &{\qquad \quad \overset{\quad}{\underset{0}{\leq}} \int \| \nabla^{2} f(x_{k}) - \nabla^{2} f(x^{*} + \tau(x_{k} - x^{*})) \| d \tau} \\ &{\qquad \quad \overset{\quad}{\underset{0}{\leq}} \int M(1 - \tau) r_{k} d \tau = \frac{r_{k}}{2} M.} \end{array}
$$

In view of Corollary 1.2.2, and relation (1.2.30), we have

$$
\nabla^{2} f(x_{k}) \succeq \nabla^{2} f(x^{*}) - Mr_{k} I_{n} \succeq(\mu - Mr_{k}) I_{n}.
$$

Therefore, if $\begin{array}{r}{r_{k} < \frac{\mu}{M}} \end{array}$ , then $\nabla^{2} f(x_{k})$ is positive definite and

$$
\parallel[\nabla^{2} f(x_{k})]^{- 1} \parallel \leq(\mu - Mr_{k})^{- 1}.
$$

Hence, for $r_{k}$ small enough $\begin{array}{r}{(r_{k} \le \frac{2 \mu}{3M})} \end{array}$ , we have

$$
\begin{array}{r}{r_{k + 1} \leq \frac{Mr_{k}^{2}}{2(\mu - Mr_{k})} \quad(\leq r_{k}).} \end{array}
$$

The rate of convergence of this type is called quadratic.

Thus, we have proved the following theorem.

Theorem 1.2.5 Let the function $f(\cdot)$ satisfy our assumptions. Suppose that the initial starting point x is close enough to $x^{*}.$

$$
\begin{array}{r}{\parallel \boldsymbol{x}_{0} - \boldsymbol{x}^{*} \parallel \le \bar{r} = \frac{2 \mu}{3M}.} \end{array}
$$

Then $\parallel x_{k} - x^{*} \parallel \leq \bar{r}$ for all k and the Newton’s Method converges quadratically:

$$
\begin{array}{r}{\|{\boldsymbol x}_{k + 1} -{\boldsymbol x}^{*} \| \leq \frac{M \|{\boldsymbol x}_{k} -{\boldsymbol x}^{*} \|^{2}}{2(\mu - M \|{\boldsymbol x}_{k} -{\boldsymbol x}^{*} \|)}.} \end{array}
$$

Comparing this result with the local rate of convergence of the Gradient Method, we see that the Newton’s Method is much faster. Surprisingly enough, the region of quadratic convergence of the Newton’s Method is almost the same as the region of linear convergence of the Gradient Method. This justifies the standard recommendation to use the Gradient Method only at the initial stage of the minimization process in order to get close to a local minimum. The final job should be performed by Newton’s scheme. However, we will come back to a detailed comparison of the performance of these two methods in Chap. 4.

In this section, we have seen several examples of convergence rate. Let us find a correspondence between these rates and the complexity bounds. As we have already seen (for example, in the case of the problem class $\mathcal{G}_{*}$ (1.2.23)), the upper bound for the analytical complexity of a problem class is an inverse function of the rate of convergence.

1. Sublinear rate. This rate is described in terms of a power function of the iteration counter. For example, suppose that for some method we can prove the rate of convergence $\begin{array}{r}{r_{k} \le \frac{c}{\sqrt{k}}} \end{array}$ . In this case, the upper complexity bound justified by this scheme for the corresponding problem class is $\textstyle \left({\frac{c}{\epsilon}} \right)^{2}$

The sublinear rate is rather slow. In terms of complexity, each new right digit of the answer takes a number of iterations comparable with the total amount of the previous work. Note also, that the constant c plays a significant role in the corresponding complexity bound.

2. Linear rate. This rate is given in terms of an exponential function of the iteration counter. For example,

$$
r_{k} \leq c(1 - q)^{k} \leq ce^{- qk}, \quad 0 < q \leq 1.
$$

Note that the corresponding complexity bound is $\frac{1}{q}(\ln c + \ln \frac{1}{\epsilon})$

This rate is fast: Each new right digit of the answer takes a constant number of iterations. Moreover, the dependence of the complexity estimate on the constant c is very weak.

3. Quadratic rate. This rate has a double exponential dependence in the iteration counter. For example,

$$
r_{k + 1} \leq cr_{k}^{2}.
$$

The corresponding complexity estimate depends on the double logarithm of the desired accuracy: ln ln $\frac{1}{\epsilon}$

This rate is extremely fast: Each iteration doubles the number of right digits in the answer. The constant c is important only for the starting moment of the quadratic convergence $(cr_{k} < 1)$ . For example, after the moment $\begin{array}{r}{cr_{k} \le \frac 12} \end{array}$ , we can guarantee a fast convergence rate $\begin{array}{r}{r_{k + 1} \le \frac{1}{2} r_{k}} \end{array}$ , which does not depend on c at all.

## 1.3 First-Order Methods in Nonlinear Optimization

(The Gradient Method and Newton’s Method: What is different? The idea of a variable metric; Variable metric methods; Conjugate gradient methods; Constrained minimization; Lagrangian relaxation; A sufficient condition for zero duality gap; Penalty functions and penalty function methods; Barrier functions and barrier function methods.)

## 1.3.1 The Gradient Method and Newton’s Method: What Is Different?

In the previous section, we considered two local methods for finding a local minimum of the simplest minimization problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x),
$$

with $f \in C_{M}^{2, 2}(\mathbb{R}^{n})$ . Namely, the Gradient Method

$$
x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k}), \quad h_{k} > 0.
$$

and the Newton’s Method:

$$
\boldsymbol{x}_{k + 1} = \boldsymbol{x}_{k} -[\nabla^{2} f(\boldsymbol{x}_{k})]^{- 1} \nabla f(\boldsymbol{x}_{k}).
$$

Recall that the local rate of convergence of these methods is different. We have seen that the Gradient Method has a linear rate and the Newton’s method converges quadratically. What is the reason for this difference?

If we look at the analytical form of these methods, we can see at least the following formal difference: In the Gradient Method, the search direction is the antigradient, while in the Newton’s method we multiply the antigradient by some matrix, the inverse Hessian. Let us try to derive these directions using some “universal” reasoning.

Let us fix a point $\bar{x} \in \mathbb{R}^{n}$ . Consider the following approximation of the function $f(\cdot)$ :

$$
\begin{array}{r}{\phi_{1}(x) = f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle + \frac{1}{2h} \parallel x - \bar{x} \parallel^{2},} \end{array}
$$

where the parameter h is positive. The first-order optimality condition provides us with the following equation for $x_{1}^{*}$ , the unconstrained minimum of this function:

$$
\begin{array}{r}{\nabla \phi_{1}(x_{1}^{*}) = \nabla f(\bar{x}) + \frac{1}{h}(x_{1}^{*} - \bar{x}) = 0.} \end{array}
$$

Thus, $x_{1}^{*} = \bar{x} - h \nabla f(\bar{x})$ . This is exactly the iterate of the Gradient Method. Note that if $h \in(0, \frac{1}{L}]$ , then the function $\phi_{1}(\cdot)$ is a global upper approximation of $f(\cdot)$

$$
f(x) \leq \phi_{1}(x), \quad \forall x \in \mathbb{R}^{n},
$$

(see Lemma 1.2.3). This fact is responsible for the global convergence of the Gradient Method.

Further, consider a quadratic approximation of the function $f(\cdot)$ :

$$
\begin{array}{r}{\phi_{2}(x) = f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle + \frac{1}{2} \langle \nabla^{2} f(\bar{x})(x - \bar{x}), x - \bar{x} \rangle.} \end{array}
$$

We have already seen that the minimum of this function is

$$
x_{2}^{*} = \bar{x} -[\nabla^{2} f(\bar{x})]^{- 1} \nabla f(\bar{x}),
$$

and this is exactly the iterate of the Newton’s Method.

Thus, we can try to use some quadratic approximations of the function $f(\cdot)$ which are better than $\phi_{1}(\cdot)$ and which are less expensive than $\phi_{2}(\cdot)$

Let G be a symmetric positive definite $n \times n{\mathrm{- matrix}}$ . Define

$$
\phi_{G}(x) = f(\bar{x}) + \langle \nabla f(\bar{x}), x - \bar{x} \rangle + \frac{1}{2} \langle G(x - \bar{x}), x - \bar{x} \rangle.
$$

Computing the minimizer of $\phi_{G}(\cdot)$ from the equation

$$
\nabla \phi_{G}(x_{G}^{*}) = \nabla f({\bar{x}}) + G(x_{G}^{*} -{\bar{x}}) = 0,
$$

we obtain

$$
\begin{array}{r}{x_{G}^{*} = \bar{x} - G^{- 1} \nabla f(\bar{x}).} \end{array}\tag{1.3.1}
$$

The first-order methods, which form a sequence of matrices

$$
\{G_{k}\} : G_{k} \to \nabla^{2} f(x^{*})
$$

(or $\{H_{k}\} : \quad H_{k} \equiv G_{k}^{- 1} \to[\nabla^{2} f(x^{*})]^{- 1})$ , are called variable metric methods. (Sometimes the name quasi-Newton methods is used.) In these methods, only the gradients are involved in the process of generating the sequences $\{G_{k}\}$ or $\{H_{k}\}$

The updating rule (1.3.1) is very common in Optimization. Let us provide it with one more interpretation.

Note that the gradient and Hessian of a nonlinear function $f(\cdot)$ are defined with respect to the standard Euclidean inner product on $\mathbb{R}^{n}$

$$
\langle x, y \rangle = x^{T} y = \sum_{i = 1}^{n} x^{(i)} y^{(i)}, \x, y \in \mathbb{R}^{n}, \quad \parallel x \parallel = \langle x, x \rangle^{1 / 2}.
$$

Indeed, the definition of the gradient is as follows:

$$
f(x + h) = f(x) + \langle \nabla f(x), h \rangle + o(\parallel h \parallel).
$$

From this equation, we derive its coordinate representation:

$$
\begin{array}{r}{\nabla f(x) = \left(\frac{\partial f(x)}{\partial x^{(1)}}, \dots, \frac{\partial f(x)}{\partial x^{(n)}} \right)^{T}.} \end{array}
$$

Let us now introduce a new inner product. Consider a symmetric positive definite $(n \times n)$ -matrix A. For x, $\boldsymbol{y} \in \mathbb{R}^{n}$ define

$$
\langle x, y \rangle_{A} = \langle Ax, y \rangle, \quad \parallel x \parallel_{A} = \langle Ax, x \rangle^{1 / 2}.
$$

The function $\| \cdot \|_{A}$ is treated as a new norm on $\mathbb{R}^{n}$ . Note that topologically this new norm is equivalent to the old one:

$$
\lambda_{\operatorname{min}}(A)^{1 / 2} \parallel x \parallel \leq \parallel x \parallel_{A} \leq \lambda_{\operatorname{max}}(A)^{1 / 2} \parallel x \parallel,
$$

where $\lambda_{\mathrm{min}}(A)$ and $\lambda_{\operatorname{max}}(A)$ are the smallest and the largest eigenvalues of the matrix A. However, the gradient and the Hessian, computed with respect to the new inner product, are different:

$$
\begin{array}{rl} &{f(x + h) = f(x) + \langle \nabla f(x), h \rangle + \frac{1}{2} \langle \nabla^{2} f(x) h, h \rangle + o(\| h \|)} \\ &{} \\ &{\qquad = f(x) + \langle A^{- 1} \nabla f(x), h \rangle_{A} + \frac{1}{2} \langle A^{- 1} \nabla^{2} f(x) h, h \rangle_{A} + o(\| h \|_{A}).} \end{array}
$$

Hence, $\nabla f_{A}(x) = A^{- 1} \nabla f(x)$ is the new gradient and $\nabla^{2} f_{A}(x) = A^{- 1} \nabla^{2} f(x)$ is the new Hessian.

Thus, the direction used in the Newton’s method can be seen as a gradient direction computed with respect to the inner product defined by $A = \nabla^{2} f(x) \succ 0$ Note that the Hessian of $f(\cdot)$ at x computed with respect to $A = \nabla^{2} f(x)$ is $I_{n}$

Example 1.3.1 Consider the quadratic function

$$
f(x) = \alpha + \langle a, x \rangle +{\frac{1}{2}} \langle Ax, x \rangle,
$$

where $A = A^{T} \succ 0$ . Note that $\nabla f(x) = Ax + a, \nabla^{2} f(x) = A$ and

$$
\nabla f(x^{*}) = Ax^{*} + a = 0
$$

for $x^{*} = - A^{- 1} a$ . Let us compute the Newton’s direction at some $x \in \mathbb{R}^{n}$

$$
d_{N}(x) =[\nabla^{2} f(x)]^{- 1} \nabla f(x) = \boldsymbol{A}^{- 1}(\boldsymbol{A} \boldsymbol{x} + \boldsymbol{a}) = \boldsymbol{x} + \boldsymbol{A}^{- 1} \boldsymbol{a}.
$$

Therefore for any $x \in \mathbb{R}^{n}$ we have $x - d_{N}(x) = - A^{- 1} a = x^{*}$ . Thus, for a quadratic function, Newton’s method converges in one step. Note also that

$$
\begin{array}{r}{f(x) = \alpha + \langle A^{- 1} a, x \rangle_{A} + \frac{1}{2} \parallel x \parallel_{A}^{2},} \end{array}
$$

$$
\nabla f_{A}(x) = A^{- 1} \nabla f(x) = d_{N}(x),
$$

$$
\nabla^{2} f_{A}(x) = A^{- 1} \nabla^{2} f(x) = I_{n}.\qquad \nabla
$$

Let us look at the general scheme of the variable metric methods.

```perl
Variable metric method
0. Choose $x_{0} \in \mathbb{R}^{n}$ . Set $H_{0} = I_{n}$ . Compute $f(x_{0})$ and $\nabla f(x_{0})$
1. kth iteration $(k \geq 0)$
(a) Set $p_{k} = H_{k} \nabla f(x_{k}).$
(b) Find $x_{k + 1} = x_{k} - h_{k} p_{k}$
(see Section 1.2.3 for step size rules).
(c) Compute $f(x_{k + 1})$ and $\nabla f(x_{k + 1})$
(d) Update the matrix $H_{k}$ to $H_{k + 1}$
```

The variable metric schemes differ from one to another only in the implementation of Step 1(d), which updates the matrix $H_{k}$ . For that, they use new information, accumulated at Step 1(c), namely the gradient $\nabla f(x_{k + 1})$ . This update is justified by the following property of quadratic functions. Let

$$
f(x) = \alpha + \langle a, x \rangle +{\frac{1}{2}} \langle Ax, x \rangle, \quad \nabla f(x) = Ax + a.
$$

Then, for any x, $y \in \mathbb{R}^{n}$ we have $\nabla f(x) - \nabla f(y) = A(x - y)$ . This identity explains the origin of the so-called quasi-Newton rule.

## Quasi-Newton rule

Choose $H_{k + 1} = H_{k + 1}^{T} \succ 0$ such that

$$
H_{k + 1}(\nabla f(x_{k + 1}) - \nabla f(x_{k})) = x_{k + 1} - x_{k}.
$$

Actually, there are many ways to satisfy this relation. Below, we present several examples of schemes which are usually recommended as the most efficient.

Define

$$
\Delta H_{k} = H_{k + 1} - H_{k}, \quad \gamma_{k} = \nabla f(x_{k + 1}) - \nabla f(x_{k}), \quad \delta_{k} = x_{k + 1} - x_{k}.
$$

Then the quasi-Newton relation is satisfied by the following updating rules.

1. Rank-one correction scheme: $\begin{array}{r}{\varDelta H_{k} = \frac{(\delta_{k} - H_{k} \gamma_{k})(\delta_{k} - H_{k} \gamma_{k})^{T}}{\langle \delta_{k} - H_{k} \gamma_{k}, \gamma_{k} \rangle}} \end{array}$

2. Davidon–Fletcher–Powell scheme (DFP): $\begin{array}{r}{\varDelta H_{k} = \frac{\delta_{k} \delta_{k}^{T}}{\left.\gamma_{k}, \delta_{k} \right.} - \frac{H_{k} \gamma_{k} \gamma_{k}^{T} H_{k}}{\left.H_{k} \gamma_{k}, \gamma_{k} \right.}} \end{array}$

3. Broyden–Fletcher–Goldfarb–Shanno scheme $(BFG{\ddot{S}}){\mathrm{:}}$

$$
\begin{array}{r}{\varDelta H_{k} = \beta_{k} \frac{\delta_{k} \delta_{k}^{T}}{\left.\gamma_{k}, \delta_{k} \right.} - \frac{H_{k} \gamma_{k} \delta_{k}^{T} + \delta_{k} \gamma_{k}^{T} H_{k}}{\left.\gamma_{k}, \delta_{k} \right.},} \end{array}
$$

where $\beta_{k} = 1 + \langle H_{k} \gamma_{k}, \gamma_{k} \rangle / \langle \gamma_{k}, \delta_{k} \rangle$

Clearly, there are many other possibilities. From the computational point of view, BFGS is considered to be the most stable scheme.

Note that for quadratic functions, the variable metric methods usually terminate in at most n iterations. In a neighborhood of a strict local minimum $x^{*}$ they demonstrate a superlinear rate of convergence: for any $x_{0} \in \mathbb{R}^{n}$ close enough to $x^{*}$ there exists a number N such that for all $k \geq N$ we have

$$
\parallel x_{k + 1} - x^{*} \parallel \leq \mathrm{const}.\parallel x_{k} - x^{*} \parallel \cdot \parallel x_{k - n} - x^{*} \parallel
$$

(the proofs are very long and technical). As far as the worst-case global convergence is concerned, these methods are not better than the Gradient Method.

In the variable metric schemes it is necessary to store and update a symmetric $(n \times n)$ -matrix. Thus, each iteration needs $O(n^{2})$ auxiliary arithmetic operations. This feature is considered as one of the main drawbacks of the variable metric methods. It stimulated the interest in conjugate gradient schemes which have a much lower complexity of each iteration. We discuss these schemes in Sect. 1.3.2.

## 1.3.2 Conjugate Gradients

Conjugate gradient methods were initially proposed for minimizing quadratic functions. Consider the problem

$$
\operatorname{min}_{x \in \mathbb{R}^{n}} \f(x)\tag{1.3.2}
$$

with $\begin{array}{r}{f(x) = \alpha + \langle a, x \rangle + \frac{1}{2} \langle Ax, x \rangle} \end{array}$ and $A = A^{T} \succ 0$ . We have already seen that the solution of this problem is $x^{*} = - A^{- 1} a$ . Therefore, our objective function can be written in the following form:

$$
\begin{array}{c}{{f(x) = \alpha + \langle a, x \rangle + \frac 12 \langle Ax, x \rangle = \alpha - \langle Ax^{*}, x \rangle + \frac 12 \langle Ax, x \rangle}} \\{{{}}} \\{{= \alpha - \frac 12 \langle Ax^{*}, x^{*} \rangle + \frac 12 \langle A(x - x^{*}), x - x^{*} \rangle.}} \end{array}
$$

Thus, $\begin{array}{r}{f^{*} = \alpha - \frac{1}{\gamma} \langle{Ax^{*}},{x^{*}} \rangle} \end{array}$ and $\nabla f(x) = A(x - x^{*})$

Suppose we are given a starting point $x_{0} ~ \in ~ \mathbb{R}^{n}$ . Consider the linear Krylov subspaces

$$
\mathcal{L}_{k} = \mathrm{Lin} \{A(x_{0} - x^{*}), \ldots, A^{k}(x_{0} - x^{*})\}, \quad k \geq 1,
$$

where $A^{k}$ is the kth power of matrix A. A sequence of points $\{x_{k}\}$ is generated by the Conjugate Gradient Method in accordance with the following rule.

$$
\begin{array}{r}{\boxed{x_{k} = \arg \operatorname{min} \{f(x) \mid x \in x_{0} + \mathcal{L}_{k}\}, k \geq 1.}} \end{array}\tag{1.3.3}
$$

This definition looks quite artificial. However, later we will see that this method can be written in a pure “algorithmic” form. We need representation (1.3.3) only for theoretical analysis.

Lemma 1.3.1 For any $k \geq 1$ we have $\mathcal{L}_{k} = \mathrm{Lin} \{\nabla f(x_{0}), \ldots, \nabla f(x_{k - 1})\}$

Proof For $k = 1$ , the statement is true since $\nabla f(x_{0}) = A(x_{0} - x^{*})$ . Suppose that it is valid for some $k \geq 1$ . Consider a point

$$
x_{k} = x_{0} + \sum_{i = 1}^{k} \lambda^{(i)} A^{i}(x_{0} - x^{*}) \in x_{0} +{\mathcal{L}}_{k}
$$

with some $\lambda \in \mathbb{R}^{k}$ . Then

$$
\nabla f(x_{k}) = A(x_{0} - x^{*}) + \sum_{i = 1}^{k} \lambda^{(i)} A^{i + 1}(x_{0} - x^{*}) = y + \lambda^{(k)} A^{k + 1}(x_{0} - x^{*}),
$$

for a certain y from $\mathcal{L}_{k}$ . Thus,

$$
\begin{array}{rl} &{\mathcal{L}_{k + 1} \equiv \mathrm{Lin} \{\mathcal{L}_{k} \bigcup A^{k + 1}(x_{0} - x^{*})\} = \mathrm{Lin} \{\mathcal{L}_{k} \bigcup \nabla f(x_{k})\}} \\ &{\qquad = \mathrm{Lin} \{\nabla f(x_{0}), \ldots, \nabla f(x_{k})\}.} \end{array}
$$

The next result helps us to understand the behavior of the sequence $\{x_{k}\}$

Lemma 1.3.2 For any $k, i \geq 0, k \neq i$ we have $\langle \nabla f(x_{k}), \nabla f(x_{i}) \rangle = 0$

Proof Let $k > i$ . Consider the function

$$
\phi(\lambda) = f \left(x_{0} + \sum_{j = 1}^{k} \lambda^{(j)} \nabla f(x_{j - 1}) \right), \quad \lambda \in \mathbb{R}^{k}.
$$

In view of Lemma 1.3.1, for some $\lambda_{*} \in \mathbb{R}^{k}$ we have $x_{k} = x_{0} + \sum_{j = 1}^{k} \lambda_{*}^{(j)} \nabla f(x_{j - 1})$ However, by definition, $x_{k}$ is the minimum point of $f(\cdot)$ on $x_{0} + \mathcal{L}_{k}$ . Therefore $\nabla \phi(\lambda_{*}) = 0$ . It remains to compute the components of the gradient:

$$
\begin{array}{r}{0 = \frac{\partial \phi(\lambda_{*})}{\partial \lambda^{(j)}} = \langle \nabla f(x_{k}), \nabla f(x_{j - 1}) \rangle, \quad j = 1, \dots, k.\quad \Pi} \end{array}
$$

This lemma has two evident consequences.

Corollary 1.3.1 The sequence generated by the Conjugate Gradient Method for problem (1.3.2) is finite.

Proof Indeed, the number of nonzero orthogonal directions in $\mathbb{R}^{n}$ cannot exceed n. □

Corollary 1.3.2 For any $p \in \mathcal{L}_{k}, k \geq 1$ , we have $\langle \nabla f(x_{k}), p \rangle = 0.$ □

The last auxiliary result explains the name of the method. Let $\delta_{i} = x_{i + 1} - x_{i}$ . It is clear that $\mathcal{L}_{k} = \mathtt{Lin} \{\delta_{0}, \dots, \delta_{k - 1}\}$

Lemma 1.3.3 For any k, $i \geq 0, k \neq i$ , we have $\langle A \delta_{k}, \delta_{i} \rangle = 0$

(Such directions are called conjugate with respect to A.)

Proof Without loss of generality, we can assume that $k > i$ . Then

$$
\langle A \delta_{k}, \delta_{i} \rangle = \langle A(x_{k + 1} - x_{k}), \delta_{i} \rangle = \langle \nabla f(x_{k + 1}) - \nabla f(x_{k}), \delta_{i} \rangle = 0
$$

since $\delta_{i} = x_{i + 1} - x_{i} \in \mathcal{L}_{i + 1} \subseteq \mathcal{L}_{k} \subseteq \mathcal{L}_{k + 1}$ .

Let us show how we can write down the Conjugate Gradient Method in a more algorithmic form. Since $\mathcal{L}_{k} = \mathtt{Lin} \{\delta_{0}, \dots, \delta_{k - 1}\}$ , we can represent $x_{k + 1}$ as follows:

$$
x_{k + 1} = x_{k} - h_{k} \nabla f(x_{k}) + \sum_{j = 0}^{k - 1} \lambda^{(j)} \delta_{j}.
$$

In our notation, this is

$$
\delta_{k} = - h_{k} \nabla f(x_{k}) + \sum_{j = 0}^{k - 1} \lambda^{(j)} \delta_{j}.\tag{1.3.4}
$$

Let us compute the coefficients in this representation. Multiplying (1.3.4) by A and $\delta_{i}, 0 \leq i \leq k - 1$ , and using Lemma 1.3.3, we obtain

$$
\begin{array}{l}{\displaystyle 0 = \langle A \delta_{k}, \delta_{i} \rangle = - h_{k} \langle A \nabla f(x_{k}), \delta_{i} \rangle + \displaystyle \sum_{j = 0}^{k - 1} \lambda^{(j)} \langle A \delta_{j}, \delta_{i} \rangle} \\{\displaystyle} \\{\displaystyle = - h_{k} \langle A \nabla f(x_{k}), \delta_{i} \rangle + \lambda^{(i)} \langle A \delta_{i}, \delta_{i} \rangle} \\{\displaystyle = - h_{k} \langle \nabla f(x_{k}), A \delta_{i} \rangle + \lambda^{(i)} \langle A \delta_{i}, \delta_{i} \rangle} \\{\displaystyle = - h_{k} \langle \nabla f(x_{k}), \nabla f(x_{i + 1}) - \nabla f(x_{i}) \rangle + \lambda^{(i)} \langle A \delta_{i}, \delta_{i} \rangle.} \end{array}
$$

Hence, in view of Lemma 1.3.2, $\lambda_{i} = 0$ for $i < k - 1$ . For $i = k - 1$ , we have

$$
\begin{array}{r}{\lambda^{(k - 1)} = \frac{h_{k} \| \nabla f(x_{k}) \|^{2}}{\langle A \delta_{k - 1}, \delta_{k - 1} \rangle} = \frac{h_{k} \| \nabla f(x_{k}) \|^{2}}{\langle \nabla f(x_{k}) - \nabla f(x_{k - 1}), \delta_{k - 1} \rangle}.} \end{array}
$$

Thus, $x_{k + 1} = x_{k} - h_{k} p_{k}$ , where

$$
\begin{array}{r}{p_{k} = \nabla f(x_{k}) - \frac{\| \nabla f(x_{k}) \|^{2} \delta_{k - 1}}{\langle \nabla f(x_{k}) - \nabla f(x_{k - 1}), \delta_{k - 1} \rangle} = \nabla f(x_{k}) - \frac{\| \nabla f(x_{k}) \|^{2} p_{k - 1}}{\langle \nabla f(x_{k}) - \nabla f(x_{k - 1}), p_{k - 1} \rangle}} \end{array}
$$

since $\delta_{k - 1} = - h_{k - 1} p_{k - 1}$ by definition of the directions $\{p_{k}\}$

Note that we managed to write down the Conjugate Gradient Method in terms of the gradients of the objective function $f(\cdot)$ . This provides us with the possibility of formally applying this scheme to minimize a general nonlinear function. Of course, such an extension destroys all properties of the process which are specific for quadratic functions. However, in a neighborhood of a strict local minimum, the objective function is close to quadratic. Therefore, asymptotically this method should be fast.

Let us present a general scheme of the Conjugate Gradient Method for minimizing a general nonlinear function.

Conjugate Gradient Method   
0. Let $x_{0} \in \mathbb{R}^{n}$ . Compute $f(x_{0}), \nabla f(x_{0}).\operatorname{Set} p_{0} = \nabla f(x_{0}).$   
1. kth iteration $(k \geq 0).$   
(a) Find $x_{k + 1} = x_{k} - h_{k} p_{k}$ (by “exact” line search).   
(b) Compute $f(x_{k + 1})$ and $\nabla f(x_{k + 1})$   
(c) Compute the coefficient $\beta_{k}$   
(d) Define $p_{k + 1} = \nabla f(x_{k + 1}) - \beta_{k} p_{k}.$

In this scheme, we have not yet specified the coefficient $\beta_{k}$ . In fact, there exist many different formulas for this coefficient. All of them give the same results on quadratic functions. However, in the general nonlinear case, they generate different sequences. Let us present the three most popular expressions.

1. : $\begin{array}{r}{\beta_{k} = \frac{\| \nabla f(x_{k + 1}) \|^{2}}{\langle \nabla f(x_{k + 1}) - \nabla f(x_{k}), p_{k} \rangle}} \end{array}$

2. Fletcher-Rieves: $\begin{array}{r}{\beta_{k} = - \frac{\| \nabla f(x_{k + 1}) \|^{2}}{\| \nabla f(x_{k}) \|^{2}}.} \end{array}$

3. Polak-Ribbiere: $\begin{array}{r}{\beta_{k} = - \frac{\langle \tilde{\nabla} f(x_{k + 1}), \nabla f(x_{k + 1}) - \nabla f(x_{k}) \rangle}{\| \nabla f(x_{k}) \|^{2}}.} \end{array}$

Recall that in the quadratic case, the Conjugate Gradient Method terminates in n iterations (or less). Algorithmically, this means that $p_{n} \ = \0$ . In the general nonlinear case, this is not true. However, after n iterations, this direction loses its interpretation. Therefore, in all practical schemes, there exists a restarting strategy, which at some moment sets $\beta_{k} = 0$ (usually after every n iterations). This ensures the global convergence of the process (since we have the usual gradient step just after the restart, and all other iterations decrease the value of the objective function). In a neighborhood of a strict minimum, the conjugate gradient schemes demonstrate a local n-step quadratic convergence:

$$
\left\|{\textbf{\em x}}_{n} - x^{*} \right\| \leq \mathrm{const} \cdot \left\|{\textbf{\em x}}_{0} - x^{*} \right\|^{2}.
$$

Note that this local convergence is slower than that of the variable metric methods. However, the conjugate gradient methods have the advantage of cheap iteration. As far as the global convergence is concerned, these schemes, in general, are not better than the simplest Gradient Method.

## 1.3.3 Constrained Minimization

Let us discuss now the main ideas underlying the methods of optimization with functional constraints. The problem we consider here is as follows:

$$
f_{0}(x) \to \operatorname{min}_{x \in Q},\tag{1.3.5}
$$

$$
f_{j}(x) \leq 0, \j = 1 \ldots m,
$$

where $Q$ is a simple closed set in $\mathbb{R}^{n}$ , and the functional components $f_{0}(\cdot), \ldots, f_{m}(\cdot)$ are continuous functions. Since these components are general nonlinear functions, we cannot expect this problem to be easier than an unconstrained minimization problem. Indeed, even the standard difficulties with stationary points, which we have in Unconstrained Minimization, appear in (1.3.5) in a much stronger form. Note that a stationary point of this problem (whatever its definition is) can be infeasible for the system of functional constraints. Hence, any minimization scheme attracted by such a point fails even to find a feasible solution of (1.3.5).

Therefore, the following reasoning looks quite convincing.

1. We have efficient methods for unconstrained minimization.<sup>4</sup>

2. Unconstrained minimization is simpler than constrained minimization.<sup>5</sup>

3. Therefore, let us try to approximate a solution of problem (1.3.5) by a sequence of solutions to some auxiliary unconstrained minimization problems.

This philosophy is implemented by the schemes of Sequential Unconstrained Minimization. There are three main groups of such methods.

- Lagrangian relaxation methods.

- Penalty function methods.

- Barrier methods.

Let us describe the main ideas of these approaches.

## 1.3.3.1 Lagrangian Relaxation

This approach is based on the following fundamental Minimax Principle.

Theorem 1.3.1 Let the function $F(x, \lambda)$ be defined for $x \in \mathcal{Q}_{1} \subseteq \mathbb{R}^{n}$ and $\lambda \in$ $Q_{2} \subseteq \mathbb{R}^{m}$ , where both $Q_{1}$ and $Q_{2}$ are nonempty. Then,

$$
\operatorname{sup}_{\lambda \in Q_{2}} \operatorname{inf}_{x \in Q_{1}} F(x, \lambda) \leq \operatorname{inf}_{x \in Q_{1}} \operatorname{sup}_{\lambda \in Q_{2}} F(x, \lambda).\tag{1.3.6}
$$

Proof Indeed, for arbitrary $x \in Q_{1}$ and $\lambda \in Q_{2}$ , we have

$$
F(x, \lambda) \leq \operatorname{sup}_{\xi \in Q_{2}} F(x, \xi).
$$

Since this inequality is valid for all $x \in Q_{1}$ , we conclude that

$$
\operatorname{inf}_{x \in Q_{1}} F(x, \lambda) \leq \operatorname{inf}_{x \in Q_{1}} \operatorname{sup}_{\xi \in Q_{2}} F(x, \xi).
$$

It remains to note that this inequality is valid for all $\lambda \in Q_{2}$ □

Let us apply this principle to problem (1.3.5). Note that

$$
\begin{array}{rl} &{f^{*} = \underset{x \in Q}{\operatorname{inf}} \left.f_{0}(x) : \f_{j}(x) \leq 0, \j = 1, \dots, m \right.} \\ &{} \\ &{= \underset{x \in Q}{\operatorname{inf}} \ \underset{\lambda \in \mathbb{R}_{+}^{m}}{\operatorname{sup}} \left.\mathcal{L}(x, \lambda) \overset{\mathrm{def}}{=} f_{0}(x) + \left.\lambda, f(x) \right.\right.,} \end{array}
$$

where $f(x) =(f_{1}(x), \ldots, f_{m}(x))^{T}, \mathbb{R}_{+}^{m} = \{\lambda \in \mathbb{R}^{m} : \ \lambda^{(j)} \geq 0, \j = 1, \ldots, m\}$ is a positive orthant, and $\mathcal{L}(x, \lambda)$ is the Lagrange function, or Lagrangian, of problem (1.3.5). Let

$$
\psi(\lambda) = \operatorname{inf}_{x \in Q}{\mathcal{L}}(x, \lambda),
$$

$$
\mathrm{dom} \psi = \{\lambda \in \mathbb{R}^{m} : \ \psi(\lambda) > - \infty\} \mathrm{,}\tag{1.3.7}
$$

$$
X^{*}(\lambda) = \operatorname{Arg}_{x \in Q}{\mathcal{L}}(x, \lambda),
$$

where $X^{*}(\lambda)$ is the set of global solutions of the corresponding minimization problem. Note that at some $\lambda \in \mathbb{R}^{m}$ the value of function $\psi$ can be . For us, it is important to have domψ $\cap \mathbb{R}_{+}^{m} \neq \emptyset$ . For simplicity, we assume that, for all λ from this set, $X^{*}(\lambda) \neq \varnothing$

Thus, we come to the following Lagrange dual problem:

$$
f_{*} \stackrel{\mathrm{def}}{=} \operatorname{sup}_{\lambda} \left\{\psi(\lambda) : \lambda \in \mathrm{dom} \psi \bigcap \mathbb{R}_{+}^{m} \right\} \stackrel{(1.3.6)}{\leq} f^{*}.\tag{1.3.8}
$$

Note that the objective function of the dual problem is very special. Indeed, for any two vectors $\lambda_{1}, \lambda_{2}$ from domψ, and any $x_{1} \in X^{*}(\lambda_{1}), x_{2} \in X^{*}(\lambda_{2})$ we have

$$
\begin{array}{l}{{\psi(\lambda_{2}) = f_{0}(x_{2}) + \displaystyle \sum_{j = 1}^{m} \lambda_{2}^{(j)} f_{j}(x_{2}) \ \le \f_{0}(x_{1}) + \displaystyle \sum_{j = 1}^{m} \lambda_{2}^{(j)} f_{j}(x_{1})}} \\{{\}} \\{{\qquad = \psi(\lambda_{1}) + \langle f(x_{1}), \lambda_{2} - \lambda_{1} \rangle.}} \end{array}\tag{1.3.9}
$$

This means that the function $\psi$ is concave, and (1.3.8) is a convex optimization problem. Such problems can be efficiently solved by numerical schemes (see Chap. 3), provided that for any $\lambda ~ \in ~ \mathsf{dom} \psi$ we are able to compute the vector $f(x(\lambda))$ , where $x(\lambda)$ is one of the global solutions of problem (1.3.7).

Note that the dual problem (1.3.8) is not completely equivalent to the primal problem (1.3.5). Very often, we can observe the situation $f_{*} ~ < ~ f^{*}$ (the so-called nonzero duality gap). This is the reason why the problem (1.3.8) is often called the Lagrangian relaxation of problem (1.3.5).

Conditions for a zero duality gap, $f_{*} ~ = ~ f^{*}$ , are usually quite restrictive and require convexity of all elements of problem (1.3.5). We will see many instances of such problems in Part II of this book. Here, we give a sufficient condition, which is sometimes useful.

Theorem 1.3.2 (Certificate of Global Optimality) Let $\lambda_{*}$ be an optimal solution to problem (1.3.8). Assume that for some positive $\epsilon$ we have

$$
\Delta_{\epsilon}^{+}(\lambda^{*}) \{\stackrel{\mathrm{def}}{=}} \ \{\lambda \in \mathbb{R}_{+}^{m} : \ \| \lambda - \lambda_{*} \| \leq \epsilon\} \subseteq{\mathrm{dom}} \psi.
$$

Let the vector $x(\lambda) \in X^{\ast}(\lambda), \lambda \neq \lambda_{\ast}$ , be uniquely defined and the following limit exist

$$
x^{*} = \operatorname{lim}_{\lambda \lambda *}, x(\lambda).
$$

$Hfx^{*} \in X^{*}(\lambda_{*})$ , then it is an optimal global solution to problem (1.3.5).

Proof Let $g(\lambda) = f(x(\lambda))$ . Let $I^{*} = \{j : \ \lambda_{*}^{(j)} > 0\}$ . Choosing $j \in I^{*}$ and $\epsilon > 0$ ensuring $\lambda_{*} \pm \epsilon e_{j} \in \mathrm{dom} \psi \bigcap \mathbb{R}_{+}^{m}$ , we get

$$
\begin{array}{rl}{\psi(\lambda_{*})} &{\overset{(1.3.9)}{\leq} \psi(\lambda_{*} + \epsilon e_{j}) + \langle g(\lambda_{*} + \epsilon e_{j}), - \epsilon e_{j} \rangle \ \leq \ \psi(\lambda_{*}) + \langle g(\lambda_{*} + \epsilon e_{j}), - \epsilon e_{j} \rangle,} \end{array}
$$

$$
\begin{array}{r}{\psi(\lambda_{*}) \overset{(1.3.9)}{\leq} \psi(\lambda_{*} - \epsilon e_{j}) + \langle g(\lambda_{*} - \epsilon e_{j}), \epsilon e_{j} \rangle \leq \psi(\lambda_{*}) + \langle g(\lambda_{*} - \epsilon e_{j}), \epsilon e_{j} \rangle,} \end{array}
$$

Thus, we have

$$
\langle g(\lambda_{*} + \epsilon e_{j}), e_{j} \rangle \leq 0 \leq \langle g(\lambda_{*} - \epsilon e_{j}), e_{j} \rangle.
$$

Taking the limit in both inequalities as $\epsilon 0$ , we obtain $f_{j}(x^{*}) = 0$

Similarly, if $j \notin I^{*}$ , we can take $\epsilon$ small enough to have $\lambda_{*} + \epsilon e_{j} \in \mathrm{dom} \psi$ Then,

$$
\begin{array}{rlr}{{\psi(\lambda_{*}) \overset{(1.3.9)}{\leq} \psi(\lambda_{*} + \epsilon e_{j}) + \langle g(\lambda_{*} + \epsilon e_{j}), - \epsilon e_{j} \rangle}} \\ &{\leq \psi(\lambda_{*}) + \langle g(\lambda_{*} + \epsilon e_{j}), - \epsilon e_{j} \rangle.} \end{array}
$$

Hence, $\langle g(\lambda_{*} + \epsilon e_{j}), e_{j} \rangle \le 0$ . Taking in this inequality the limit as $\epsilon 0$ , we get $f_{j}(x^{*}) \leq 0$

Thus, the point $x^{*}$ is feasible for the problem (1.3.5), and

$$
\lambda_{*}^{(j)} f_{j}(x^{*}) = 0, \quad j = 1, \dots, m.\tag{1.3.10}
$$

Therefore, we obtain

$$
f_{0}(x^{*}) \stackrel{(1.3.10)}{=} f_{0}(x^{*}) + \sum_{j = 1}^{m} \lambda_{*}^{(j)} f_{j}(x^{*}) = \psi(\lambda_{*}) \stackrel{(1.3.8)}{\leq} f^{*}.
$$

□

Remark 1.3.1 The equality constraints in problem (1.3.5) can be treated in a similar way. The only difference is that in the dual problem (1.3.8), the corresponding Lagrange multipliers do not have sign restrictions. At the same time, the statement of Theorem 1.3.2 remains valid.

Let us show how this condition works in some simple situations.

Example 1.3.2 Let us choose in the problem (1.3.5) $Q = \mathbb{R}^{2}$ , and

$$
\begin{array}{r}{f_{0}(x) = \frac 12 \| x - \bar{e}_{2} \|^{2}, \quad f_{1}(x) = x^{(1)} - \frac{1}{2}(x^{(2)})^{2},} \end{array}
$$

where $\bar{e}_{2} =(1, 1)^{T}$ . Then, we can form the Lagrangian

$$
\begin{array}{r}{\mathcal{L}(x, \lambda) = \frac{1}{2} \| x - \bar{e}_{2} \|^{2} + \lambda \left[x^{(1)} - \frac{1}{2}(x^{(2)})^{2} \right],} \end{array}
$$

and define $\psi(\lambda) = \operatorname{inf}_{x \in \mathbb{R}^{2}} \mathcal{L}(x, \lambda)$ . It is clear that domψ $\mathbf{\Sigma}) = \left(- \infty, 1 \right)$ , and for any feasible λ, the point $x(\lambda)$ can be found from the following equations:

$$
x^{(1)}(\lambda) - 1 + \lambda = 0,
$$

$$
x^{(2)}(\lambda) - 1 - \lambda x^{(2)}(\lambda) = 0.
$$

Thus, $x^{(1)}(\lambda) ~ = ~ 1 - \lambda$ , and $\begin{array}{l}{{x^{(2)}(\lambda) ~ = ~ \frac{1}{1 - \lambda}}} \end{array}$ . Substituting this point into the Lagrangian, we obtain

$$
\begin{array}{r}{\psi(\lambda) = \lambda - \frac{1}{2} \lambda^{2} - \frac{1}{2(1 - \lambda)} + \frac{1}{2}.} \end{array}
$$

The maximum of $\psi$ is attained at $\begin{array}{r}{\lambda_{*} = 1 - \left(\frac{1}{2} \right)^{1 / 3}} \end{array}$ . Since the trajectory $x(\lambda)$ is uniquely defined and continuous on the domain dom $\psi$ , by Theorem 1.3.2 we conclude that the point $x(\lambda_{*}) = \bigl(2^{- 1 / 3}, 2^{1 / 3} \bigr)$ is the global optimal solution of our problem.

We consider another example of application of Theorem 1.3.2 in Sect. 4.1.4.

## 1.3.3.2 Penalty Functions

Definition 1.3.1 A continuous function $\varPhi(\cdot)$ is called a penalty function for a closed set $\mathcal{F} \subset \mathbb{R}^{n}$ if

$\phi(x) = 0$ for any $x \in \mathcal{F}$

$\phi(x) > 0$ for any $x \notin \mathcal{F}$

Sometimes, a penalty function is called just a penalty for the set $\mathcal{F}$ . The main property of penalty functions is as follows.

If $\varPhi_{1}(\cdot)$ is a penalty for $\mathcal{F}_{1}$ and $\varPhi_{2}(\cdot)$ is a penalty for $\mathcal{F}_{2}$ , then $\Phi_{1}(\cdot) + \Phi_{2}(\cdot)$ is a penalty for the intersection $\mathcal{F}_{1} \cap \mathcal{F}_{2}$

Let us give several examples of such functions.

Example 1.3.3 Define $(a)_{+} = \mathrm{max} \{a, 0\}, a \in \mathbb{R}$ . Let $f_{1}(\cdot), \ldots, f_{m}(\cdot)$ be continuous functions, and

$$
{\mathcal{F}} = \{x \in \mathbb{R}^{n} \mid f_{j}(x) \leq 0, j = 1 \ldots m\}.
$$

Then, the following functions are penalties for $\mathcal{F}$

1. : $\varPhi(x) = \sum_{j = 1}^{m}(f_{j}(x))_{+}^{2}$

2. Nonsmooth penalty: $\phi(x) = \sum_{j = 1}^{m}(f_{j}(x))_{+}$

The reader can easily continue the list.

Let us present the general scheme of the Penalty Function Method as applied to problem (1.3.5).

Penalty Function Method   
0. Choose $x_{0} \in{Q}$ . Choose a sequence of penalty coefficients:   
$0 < t_{k} < t_{k + 1}$ and $t_{k} \to \infty.$   
1. kth iteration $(k \geq 0).$   
Find $x_{k + 1} = \arg \operatorname{min}_{x \in Q} \{f_{0}(x) + t_{k} \phi(x)\}$ using $x_{k}$ as starting point.

It is easy to prove the convergence of this scheme assuming that $x_{k + 1}$ is a global minimum of the auxiliary function.<sup>6</sup> Define

$$
\psi_{k}(x) = f_{0}(x) + t_{k} \varPhi(x), \quad \psi_{k}^{*} = \operatorname{min}_{x \in \mathcal{Q}} \psi_{k}(x) = \psi_{k}(x_{k + 1}).
$$

$(\psi_{k}^{*}$ is the global optimal value of $\psi_{k}(\cdot))$ . Let $x^{*}$ be a global solution to (1.3.5).

Theorem 1.3.3 Let there exist a value $\bar{t} > 0$ such that the set

$$
S = \{x \in \mathbb{R}^{n} \mid f_{0}(x) +{\bar{t}} \phi(x) \leq f_{0}(x^{*})\}
$$

is bounded. Then

$$
\operatorname{lim}_{k \infty} f_{0}(x_{k}) = f_{0}(x^{*}), \ : \ : \ : \ : \ : \operatorname{lim}_{k \infty} \phi(x_{k}) = 0.
$$

Proof Note that $\psi_{k}^{*} \le \psi_{k}(x^{*}) = f_{0}(x^{*})$ . At the same time, for any $x \in Q$ we have $\psi_{k + 1}(x) \geq \psi_{k}(x)$ . Therefore $\psi_{k + 1}^{*} \geq \psi_{k}^{*}$ . Thus, there exists a limit

$$
\operatorname{lim}_{k \to \infty} \psi_{k}^{*} \equiv \psi^{*} \ \leq \f_{0}(x^{*}).
$$

If $t_{k} > \bar{t}$ then

$$
\begin{array}{r}{f_{0}(x_{k + 1}) + \bar{t} \phi(x_{k + 1}) \le f_{0}(x_{k + 1}) + t_{k} \phi(x_{k + 1}) = \psi_{k}^{*} \le f_{0}(x^{*}).} \end{array}
$$

Therefore, $x_{k} \in \S$ for k large enough. Hence, the sequence $\{x_{k}\}$ has limit points.   
Since lim $t_{k} = + \infty$ , for any such point $x_{*}$ we have $\phi(x_{*}) = 0$ . Thus, $x_{*} \in \mathcal{F}$ and k→∞   
$f_{0}(x_{*}) \le f_{0}(x^{*})$ . Consequently, $f_{0}(x_{*}) = f_{0}(x^{*})$ .

Note that this result is very general, but not too informative. There are still many questions which should be answered. For example, we do not know what kind of penalty functions we should use. What should be the rules for choosing the penalty coefficients? What should be the accuracy for solving the auxiliary problems? In fact, all these questions are difficult to address in the framework of general Nonlinear Optimization. Traditionally, they are redirected to computational practice.

## 1.3.3.3 Barrier Functions

Let us look at Barrier Methods.

Definition 1.3.2 Let $\mathcal{F}$ be a closed set in $\mathbb{R}^{n}$ with nonempty interior. A continuous function $F(\cdot)$ is called a barrier function for $\mathcal{F}$ if $F(x) \to \infty \operatorname{as} x$ approaches the boundary of this set.

Sometimes a barrier function is called a barrier for short. Similarly to penalty functions, the barriers possess the following property.

If $F_{1}(\cdot)$ is a barrier for $\mathcal{F}_{1}$ and $F_{2}(\cdot)$ is a barrier for $\mathcal{F}_{2}$ , then $F_{1}(\cdot) + F_{2}(\cdot)$ is a barrier for the intersection $\mathcal{F}_{1} \cap \mathcal{F}_{2}$ provided that its interior is nonexpty.

In order to apply the barrier approach, problem (1.3.5) must satisfy the Slater condition:

$$
\exists \bar{x} \in \mathbb{R}^{n} : \quad f_{j}(\bar{x}) < 0, \quad j = 1 \dots m.\tag{1.3.11}
$$

Let us look at some examples of barrier functions.

Example 1.3.4 Let $f_{1}(\cdot), \ldots, f_{m}(\cdot)$ be continuous functions and $\mathcal{F} = \{x \in \mathbb{R}^{n} \mid$ $f_{j}(x) \leq 0, \j = 1 \ldots m\}$ . Then all the functions below are barriers for $\mathcal{F}$

1. barrier: $F(x) = \sum_{j = 1}^{m} \frac{1}{(- f_{j}(x))^{p}}, p \geq 1.$

2. barrier: $F(x) = - \sum_{j = 1}^{m} \ln(- f_{j}(x)).$

3. barrier: $F(x) = \sum_{j = 1}^{m} \exp \left(\frac{1}{- f_{j}(x)} \right)$

The reader can easily extend this list.

Let $\mathcal{F}_{0} = Q \cap \mathrm{int} \mathcal{F}$ and let $F$ be a barrier for $\mathcal{F}$ . The general scheme of the Barrier Method is as follows.

```latex
Barrier Function Method
0. Choose $\boldsymbol x_{0} \in \mathcal{F}_{0}$ and a sequence of penalty coefficients:
$0 < t_{k} < t_{k + 1} \mathrm{~ and ~} t_{k} \to \infty.$
1. kth iteration $(k \geq 0).$
Find $\begin{array}{r}{x_{k + 1} = \arg \underset{x \in \mathcal{F}_{0}}{\operatorname{min}} \left\{f_{0}(x) + \frac{1}{t_{k}} F(x) \right\}} \end{array}$ using $x_{k}$ as the starting
point.
```

Let us prove the convergence of this method assuming that $x_{k + 1}$ is a global minimum of the auxiliary function. Define

$$
\psi_{k}(x) = f_{0}(x) + \textstyle{\frac{1}{t_{k}}} F(x), \quad \psi_{k}^{*} = \operatorname{min}_{x \in{\mathcal{F}}_{0}} \psi_{k}(x),
$$

$(\psi_{k}^{*}$ is the global optimal value of $\psi_{k}(\cdot))$ and let $f^{*}$ be the optimal value of the problem (1.3.5).

Theorem 1.3.4 Let the barrier F ( ) be bounded below on $\mathcal{F}_{0}$ . Then

$$
\operatorname{lim}_{k \to \infty} \psi_{k}^{*} = f^{*}.
$$

Proof Let $F(x) \ge F^{*}$ for all $x \in \mathcal{F}_{0}$ . For arbitrary $\bar{x} \in \mathcal{F}_{0}$ we have

$$
\begin{array}{r}{\operatorname{lim}_{k \to \infty} \Psi_{k}^{*} \le \underset{k \to \infty}{\operatorname{lim}} \left[f_{0}(\bar{x}) + \frac{1}{t_{k}} F(\bar{x}) \right] = f_{0}(\bar{x}).} \end{array}
$$

Therefore lim sup $\psi_{k}^{*} \leq f^{*}$ . On the other hand, k→∞

$$
\begin{array}{r}{\varPsi_{k}^{*} = \underset{x \in \mathcal{F}_{0}}{\operatorname{min}} \left.⨏_{0}(x) + \frac{1}{t_{k}} F(x) \right.\geq \underset{x \in \mathcal{F}_{0}}{\operatorname{inf}} \left.⨏_{0}(x) + \frac{1}{t_{k}} F^{*} \right.= f^{*} + \frac{1}{t_{k}} F^{*}.} \end{array}
$$

Thus, lim $\psi_{k}^{*} = f^{*}$ . □ k→∞

As with Penalty Function Methods, many questions need to be answered. We do not know how to find the starting point $x_{0}$ and how to choose the best barrier function. We do not know theoretically justified rules for updating the penalty coefficients and the acceptable accuracy of the solution for the auxiliary problems. Finally, we have no ideas about the efficiency estimates of this process. And the reason is not in the lack of theory. Our problem (1.3.5) is still too complicated. We will see that all the questions above get precise answers in the framework of Convex Optimization (see Chap. 5).

We have finished our brief presentation of general Nonlinear Optimization. It was very short indeed, and there are many interesting theoretical topics that we did not mention. The reason is that the main goal of this book is to describe the areas of Optimization where we can obtain clear and comprehensive results on the performance of numerical methods. Unfortunately, general Nonlinear Optimization is just too complicated to fit the goal. However, it was impossible to skip this field since a lot of basic ideas underlying Convex Optimization have their origin in the general theory of Nonlinear Optimization. The Gradient Method and Newton’s Method, Sequential Unconstrained Minimization and Barrier Functions were originally developed and used for general optimization problems. But only the framework of Convex Optimization allows these ideas to get their real power. In the following chapters of this book, we will see many examples of the second birth of these old ideas.


---
title: "Chapter 5 \u2014 Support Vector Machines"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 5
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 2209
source_line_end: 2894
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 0
caption_derived_image_alt: 6
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 5
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 5 — Support Vector Machines

> [[../README|本书目录]] · [[04-chapter-4-model-selection|上一章]] · [[06-chapter-6-kernel-methods|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 2209–2894。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5；Affine × 9；different × 4；efficient × 1；sufficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 5.1 Linear classification

Consider an input space X that is a subset of $\mathbb{R}^{N}$ with $N \geq 1$ , and the output or target space $\mathcal{Y} = \{- 1, + 1\}$ , and let $f \colon \mathcal{X} \mathcal{Y}$ be the target function. Given a hypothesis set H of functions mapping X to Y, the binary classification task is formulated as follows. The learner receives a training sample S of size m drawn i.i.d. from X according to some unknown distribution D, $S =((x_{1}, y_{1}), \dots,(x_{m}, y_{m})) \in$ $({\mathfrak{X}} \times \Y)^{m}$ , with $y_{i} = f(x_{i})$ for all $i \in[m]$ . The problem consists of determining a hypothesis $h \in{\mathcal{H}}$ , a binary classifier , with small generalization error:

$$
R_{\mathcal{D}}(h) = \underset{x \sim \mathcal{D}}{\mathbb{P}}[h(x) \neq f(x)].\tag{5.1}
$$

different hypothesis sets H can be selected for this task. In view of the results presented in chapter 3, which formalized Occam’s razor principle, hypothesis sets with smaller complexity $- \ \mathrm{e.g.}$ , smaller VC-dimension or Rademacher complexity — provide better learning guarantees, everything else being equal. A natural hypothesis set with relatively small complexity is that of linear classifiers, or hyperplanes, which can be defined as follows:

$$
\mathcal{H} = \{\mathbf{x} \mapsto \mathrm{sign}(\mathbf{w} \cdot \mathbf{x} + b) \colon \mathbf{w} \in \mathbb{R}^{N}, b \in \mathbb{R}\}.\tag{5.2}
$$

The learning problem is then referred to as a linear classification problem. The general equation of a hyperplane in $\mathbb{R}^{N}$ is ${\bf w} \cdot{\bf x} + b = 0$ , where $\textbf{w} \in \mathbb{R}^{N}$ is a non-zero vector normal to the hyperplane and $b \in \mathbb{R}{\mathrm{~ a ~}}$ scalar. A hypothesis of the form $\mathbf{x} \mapsto \mathrm{sign}(\mathbf{w} \cdot \mathbf{x} + b)$ thus labels positively all points falling on one side of the hyperplane $\mathbf{w} \cdot \mathbf{x} + b = 0$ and negatively all others.

![Figure 5.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/82ffc4cc925a23545cafd60401e8df3962b0b06eee9242962034969a38377f69.jpg)  
Figure 5.1  
Two possible separating hyperplanes. The right-hand side figure shows a hyperplane that maximizes the margin.

## 5.2 Separable case

In this section, we assume that the training sample S can be linearly separated, that is, we assume the existence of a hyperplane that perfectly separates the training sample into two populations of positively and negatively labeled points, as illustrated by the left panel of figure 5.1. This is equivalent to the existence of $(\mathbf{w}, b) \in(\mathbb{R}^{N} - \{\mathbf{0}\}) \times \mathbb{R}$ such that

$$
\forall i \in[m], \quad y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 0.\tag{5.3}
$$

But, as can be seen from figure 5.1, there are then infinitely many such separating hyperplanes. Which hyperplane should a learning algorithm select? The definition of the SVM solution is based on the notion of geometric margin.

Definition 5.1 (Geometric margin) The geometric margin $\rho_{h}({\bf x})$ of a linear classifier $h \colon \mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} + b$ at a point x is its Euclidean distance to the hyperplane $\mathbf{w} \cdot \mathbf{x} + b = 0.$ :

$$
\rho_{h}(x) = \frac{| \mathbf{w} \cdot \mathbf{x} + b |}{\| \mathbf{w} \|_{2}}.\tag{5.4}
$$

The geometric margin $\rho_{h}$ of a linear classifier h for a sample $S =(\mathbf{x}_{1}, \ldots, \mathbf{x}_{m})$ is the minimum geometric margin over the points in the sample, $\textstyle \rho_{h} = \operatorname{min}_{i \in[m]} \rho_{h}(x_{i})$ that is the distance of the hyperplane defining h to the closest sample points.

The SVM solution is the separating hyperplane with the maximum geometric margin and is thus known as the maximum-margin hyperplane. The right panel of figure 5.1 illustrates the maximum-margin hyperplane returned by the SVM algorithm in the separable case. We will present later in this chapter a theory that provides a strong justification for this solution. We can observe already, however, that the SVM solution can also be viewed as the “safest” choice in the following sense: a test point is classified correctly by a separating hyperplane with geometric margin $\rho$ even when it falls within a distance $\rho$ of the training samples sharing the same label; for the SVM solution, $\rho$ is the maximum geometric margin and thus the “safest” value.

![Figure 5.2](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/7c475a53e82dccad5b42843e40e4e13ac3474411d86f9ab62dc165e061202192.jpg)  
Figure 5.2  
An illustration of the geometric margin of a point x in the case $\mathbf{w} \cdot \mathbf{x} > 0$ and $b > 0,$

## 5.2.1 Primal optimization problem

We now derive the equations and optimization problem that define the SVM solution. By definition of the geometric margin (see also figure 5.2), the maximum margin $\rho$ of a separating hyperplane is given by

$$
\rho = \max_{\mathbf{w}, b: y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 0} \min_{i \in[m]} \frac{| \mathbf{w} \cdot \mathbf{x}_{i} + b |}{\| \mathbf{w} \|} = \max_{\mathbf{w}, b} \min_{i \in[m]} \frac{y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b)}{\| \mathbf{w} \|}.\tag{5.5}
$$

The second equality follows from the fact that, since the sample is linearly separable, for the maximizing pair $(\mathbf{w}, b), y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b)$ must be non-negative for all $i \in[m]$ Now, observe that the last expression is invariant to multiplication of $({\bf w}, b)$ by a positive scalar. Thus, we can restrict ourselves to pairs $({\bf w}, b)$ scaled such that $\begin{array}{r}{\operatorname{min}_{i \in[m]} y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1} \end{array}$

$$
\rho = \max_{\substack{\mathbf{w},b:\\ \min_{i\in[m]}y_{i}(\mathbf{w}\cdot \mathbf{x}_{i} + b) = 1}}\frac{1}{\|\mathbf{w}\|} = \max_{\substack{\mathbf{w},b:\\ \forall i\in[m],y_{i}(\mathbf{w}\cdot \mathbf{x}_{i} + b)\geq 1}}\frac{1}{\|\mathbf{w}\|}.\tag{5.6}
$$

The second equality results from the fact that for the maximizing pair $\big(\mathbf{w}, b \big)$ , the minimum of $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b)$ is 1.

Figure 5.3 illustrates the solution $({\bf w}, b)$ of the maximization (5.6). In addition to the maximum-margin hyperplane, it also shows the marginal hyperplanes, which are the hyperplanes parallel to the separating hyperplane and passing through the closest points on the negative or positive sides. Since they are parallel to the separating hyperplane, they admit the same normal vector w. Furthermore, since $| \mathbf{w} \cdot \mathbf{x} + b | = 1$ for the closest points, the equations of the marginal hyperplanes are $\mathbf{w} \cdot \mathbf{x} + b = \pm 1$

![Figure 5.3](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/9a09afcab1deefa1521a56dd3a316f4eec783027611d68d653f086dccdbd342e.jpg)  
Figure 5.3  
Maximum-margin hyperplane solution of (5.6). The marginal hyperplanes are represented by dashed lines on the figure.

Since maximizing $1 / \| \mathbf{w} \|$ is equivalent to minimizing $\frac{1}{2} \| \mathbf{w} \|^{2}$ , in view of (5.6), the pair $({\bf w}, b)$ returned by SVM in the separable case is the solution of the following convex optimization problem:

$$
\begin{array}{c} \min_{\mathbf{w}, b} \frac{1}{2} \| \mathbf{w} \|^{2} \\ \text{subject to:} y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 1, \forall i \in[m].\end{array}\tag{5.7}
$$

The objective function $F \colon \mathbf{w} \mapsto{\frac{1}{2}} \| \mathbf{w} \|^{2}$ is infinitely diferentiable. Its gradient is $\nabla F(\mathbf{w}) = \mathbf{w}$ and its Hessian is the identity matrix $\nabla^{2} F(\mathbf{w}) = \mathbf{I}$ , whose eigenvalues are strictly positive. Therefore, $\nabla^{2} F(\mathbf{w}) \succ \mathbf{0}$ and F is strictly convex. The constraints are all defined by Affine functions $g_{i} \colon(\mathbf{w}, b) \mapsto 1 - y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b)$ and are therefore qualified. Thus, in view of the results known for convex optimization (see appendix B for details), the optimization problem of (5.7) admits a unique solution, an important and favorable property that does not hold for all learning algorithms.

Moreover, since the objective function is quadratic and the constraints are Affine, the optimization problem of (5.7) is in fact a specific instance of quadratic programming (QP), a family of problems extensively studied in optimization. A variety of commercial and open-source solvers are available for solving convex QP problems. Additionally, motivated by the empirical success of SVMs along with its rich theoretical underpinnings, specialized methods have been developed to more eficiently solve this particular convex QP problem, notably the block coordinate descent algorithms with blocks of just two coordinates.

## 5.2.2 Support vectors

Returning to the optimization problem (5.7), we note that the constraints are Affine and thus qualified. The objective function as well as the Affine constraints are convex and diferentiable. Thus, the requirements of theorem B.30 hold and the KKT conditions apply at the optimum. We shall use these conditions to both analyze the algorithm and demonstrate several of its crucial properties, and subsequently derive the dual optimization problem associated to SVMs in section 5.2.3.

We introduce Lagrange variables $\alpha_{i} \geq 0, i \in[m]$ , associated to the m constraints and denote by α the vector $(\alpha_{1}, \ldots, \alpha_{m})^{\top}$ . The Lagrangian can then be defined for all $\mathbf{w} \in \mathbb{R}^{N}, b \in \mathbb{R}$ , and $\pmb{\alpha} \in \mathbb{R}_{+}^{m}$ , by

$$
\mathcal{L}(\mathbf{w}, b, \boldsymbol{\alpha}) = \frac{1}{2} \| \mathbf{w} \|^{2} - \sum_{i = 1}^{m} \alpha_{i}[y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) - 1].\tag{5.8}
$$

The KKT conditions are obtained by setting the gradient of the Lagrangian with respect to the primal variables w and b to zero and by writing the complementarity conditions:

$$
\nabla_{\mathbf{w}} \mathcal{L} = \mathbf{w} - \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i} = 0 \quad \Longrightarrow \quad \mathbf{w} = \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i}\tag{5.9}
$$

$$
\nabla_{b} \mathcal{L} = - \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0 \quad \Longrightarrow \quad \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0\tag{5.10}
$$

$$
\forall i, \alpha_{i}[y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) - 1] = 0 \quad \Longrightarrow \quad \alpha_{i} = 0 \vee y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1.\tag{5.11}
$$

By equation (5.9), the weight vector w at the solution of the SVM problem is a linear combination of the training set vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ . A vector $\mathbf{x}_{i}$ appears in that expansion if $\alpha_{i} \ \neq \0$ . Such vectors are called support vectors. By the complementarity conditions (5.11), if $\alpha_{i} \neq 0$ , then $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1$ . Thus, support vectors lie on the marginal hyperplanes $\mathbf{w} \cdot \mathbf{x}_{i} + b = \pm 1$

Support vectors fully define the maximum-margin hyperplane or SVM solution, which justifies the name of the algorithm. By definition, vectors not lying on the marginal hyperplanes do not afect the definition of these hyperplanes — in their absence, the solution to the SVM problem remains unchanged. Note that while the solution w of the SVM problem is unique, the support vectors are not. In dimension N, N + 1 points are sufficient to define a hyperplane. Thus, when more than N + 1 points lie on a marginal hyperplane, different choices are possible for the N + 1 support vectors.

## 5.2.3 Dual optimization problem

To derive the dual form of the constrained optimization problem (5.7), we plug into the Lagrangian the definition of w in terms of the dual variables as expressed in (5.9) and apply the constraint (5.10). This yields

$$
\mathcal{L} = \underbrace{\frac{1}{2} \| \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i} \|^{2} - \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j})}_{- \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j})} - \underbrace{\sum_{i = 1}^{m} \alpha_{i} y_{i} b}_{0} + \sum_{i = 1}^{m} \alpha_{i},\tag{5.12}
$$

which simplifies to

$$
\mathcal{L} = \sum_{i = 1}^{m} \alpha_{i} - \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}).\tag{5.13}
$$

This leads to the following dual optimization problem for SVMs in the separable case:

$$
\begin{array}{c} \max_{\boldsymbol{\alpha}} \sum_{i = 1}^{m} \alpha_{i} - \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}) \\ \text{subject to:} \alpha_{i} \geq 0 \land \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0, \forall i \in[m].\end{array}\tag{5.14}
$$

The objective function $\begin{array}{r}{G \colon \alpha \mapsto \sum_{i = 1}^{m} \alpha_{i} - \frac 12 \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf x_{i} \cdot \mathbf x_{j})} \end{array}$ is infinitely diferentiable. Its Hessian is given by $\nabla^{2} G = - \mathbf{A}$ , with $\mathbf{A} = \left(y_{i} \mathbf{x}_{i} \cdot y_{j} \mathbf{x}_{j} \right)_{ij}$ . A is the Gram matrix associated to the vectors $y_{1} \mathbf{x}_{1}, \ldots, y_{m} \mathbf{x}_{m}$ and is therefore positive semidefinite (see section A.2.3), which shows that $\nabla^{2} G \preceq \mathbf{0}$ and that G is a concave function. Since the constraints are Affine and convex, the maximization problem (5.14) is a convex optimization problem. Since G is a quadratic function of $\alpha,$ this dual optimization problem is also a QP problem, as in the case of the primal optimization and once again both general-purpose and specialized QP solvers can be used to obtain the solution (see exercise 5.4 for details on the SMO algorithm, which is often used to solve the dual form of the SVM problem in the more general non-separable setting).

Moreover, since the constraints are Affine, they are qualified and strong duality holds (see appendix B). Thus, the primal and dual problems are equivalent, i.e., the solution α of the dual problem (5.14) can be used directly to determine the hypothesis returned by SVMs, using equation (5.9):

$$
h(\mathbf{x}) = \operatorname{sgn}(\mathbf{w} \cdot \mathbf{x} + b) = \operatorname{sgn} \Bigl(\sum_{i = 1}^{m} \alpha_{i} y_{i}(\mathbf{x}_{i} \cdot \mathbf{x}) + b \Bigr).\tag{5.15}
$$

Since support vectors lie on the marginal hyperplanes, for any support vector $\mathbf{x}_{i},$ $\mathbf{w} \cdot \mathbf{x}_{i} + b = y_{i}$ , and thus b can be obtained via

$$
b = y_{i} - \sum_{j = 1}^{m} \alpha_{j} y_{j}(\mathbf{x}_{j} \cdot \mathbf{x}_{i}).\tag{5.16}
$$

The dual optimization problem (5.14) and the expressions (5.15) and (5.16) reveal an important property of SVMs: the hypothesis solution depends only on inner products between vectors and not directly on the vectors themselves. This observation is key and its importance will become clear in Chapter 6 where we introduce kernel methods.

Equation (5.16) can now be used to derive a simple expression of the geometric margin $\rho$ in terms of $\alpha.$ . Since (5.16) holds for all i with $\alpha_{i} \neq 0$ , multiplying both sides by $\alpha_{i} y_{i}$ and taking the sum leads to

$$
\sum_{i = 1}^{m} \alpha_{i} y_{i} b = \sum_{i = 1}^{m} \alpha_{i} y_{i}^{2} - \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}).\tag{5.17}
$$

Using the fact that $y_{i}^{2} = 1$ along with equation (5.9) then yields

$$
0 = \sum_{i = 1}^{m} \alpha_{i} - \| \mathbf{w} \|^{2}.\tag{5.18}
$$

Noting that $\alpha_{i} \geq 0$ , we obtain the following expression of the margin $\rho$ in terms of the $L_{1}$ norm of α:

$$
\rho^{2} = \frac{1}{\| \mathbf{w} \|_{2}^{2}} = \frac{1}{\sum_{i = 1}^{m} \alpha_{i}} = \frac{1}{\| \pmb{\alpha} \|_{1}}.\tag{5.19}
$$

## 5.2.4 Leave-one-out analysis

We now use the notion of leave-one-out error to derive a first learning guarantee for SVMs based on the fraction of support vectors in the training set.

Definition 5.2 (Leave-one-out error) Let $h_{S}$ denote the hypothesis returned by a learning algorithm ${\mathcal{A}},$ , when trained on a fixed sample $S_{☉}$ . Then, the leave-one-out error of on a sample S of size m is defined by

$$
\widehat{R}_{\mathrm{LOO}}(\mathcal{A}) = \frac{1}{m} \sum_{i = 1}^{m} 1_{h_{S - \{x_{i}\}}(x_{i}) \neq y_{i}}.
$$

Thus, for each $i \in[m]$ , is trained on all the points in $S$ except for $x_{i},{\mathrm{i.e., ~}} S - \{x_{i}\}$ and its error is then computed using $x_{i}$ . The leave-one-out error is the average of these errors. We will use an important property of the leave-one-out error stated in the following lemma.

Lemma 5.3 The average leave-one-out error for samples of size $m \geq 2$ is an unbiased estimate of the average generalization error for samples of size $m - 1$

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\widehat{R}_{\mathrm{LOO}}(\mathcal{A})] = \underset{S^{\prime} \sim \mathcal{D}^{m - 1}}{\mathbb{E}}[R(h_{S^{\prime}})],\tag{5.20}
$$

where D denotes the distribution according to which points are drawn.

Proof: By the linearity of expectation, we can write

$$
\begin{array}{rl} \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[\widehat{R}_{\mathrm{LOO}}(\mathcal{A})] & = \frac{1}{m} \sum_{i = 1}^{m} \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[1_{h_{S - \{x_{i}\}}(x_{i}) \neq y_{i}}] \\ & = \underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[1_{h_{S - \{x_{1}\}}(x_{1}) \neq y_{1}}] \\ & = \underset{S^{\prime} \sim \mathcal{D}^{m - 1}, x_{1} \sim \mathcal{D}}{\mathbb{E}}[1_{h_{S^{\prime}}(x_{1}) \neq y_{1}}] \\ & = \underset{S^{\prime} \sim \mathcal{D}^{m - 1}}{\mathbb{E}}[\underset{x_{1} \sim \mathcal{D}}{\mathbb{E}}[1_{h_{S^{\prime}}(x_{1}) \neq y_{1}}]] \\ & = \underset{S^{\prime} \sim \mathcal{D}^{m - 1}}{\mathbb{E}}[R(h_{S^{\prime}})].\end{array}
$$

For the second equality, we used the fact that, since the points of S are drawn in an i.i.d. fashion, the expectation $\mathbb{E}_{S \sim \mathcal{D}^{m}} \big[1_{h_{S - \{x_{i}\}}(x_{i}) \neq y_{i}} \big]$ does not depend on the choice of $i \in[m]$ and is thus equal to $\mathbb{E}_{S \sim \mathcal{D}^{m}} \big[\mathbf{l}_{h_{S - \{x_{1}\}}}(x_{1}) \neq y_{1} \big]$ $\square$

In general, computing the leave-one-out error may be costly since it requires training m times on samples of size $m - 1$ . In some situations however, it is possible to derive the expression of $\widehat{R}_{\mathrm{LOO}}(A)$ much more eficiently (see exercise 11.9).

Theorem 5.4 Let $h_{S}$ be the hypothesis returned by SVMs for a sample S, and let $N_{SV}(S)$ be the number of support vectors that define $h_{S}$ . Then,

$$
\underset{S \sim \mathcal{D}^{m}}{\mathbb{E}}[R(h_{S})] \leq \underset{S \sim \mathcal{D}^{m + 1}}{\mathbb{E}} \left[\frac{N_{\mathrm{SV}}(S)}{m + 1} \right].
$$

Proof: Let S be a linearly separable sample of $m + 1$ . If x is not a support vector for $h_{S}$ , removing it does not change the SVM solution. Thus, $h_{S - \{x\}} = h_{S}$ and $h_{S - \{x\}}$ correctly classifies x. By contraposition, if $h_{S - \{x\}}$ misclassifies x, x must be a support vector, which implies

$$
\widehat{R}_{\mathrm{LOO}}(\mathrm{SVM}) \leq \frac{N_{\mathrm{SV}}(S)}{m + 1}.\tag{5.21}
$$

Taking the expectation of both sides and using lemma 5.3 yields the result. $\square$

Theorem 5.4 gives a sparsity argument in favor of SVMs: the average error of the algorithm is upper bounded by the average fraction of support vectors. One may hope that for many distributions seen in practice, a relatively small number of the training points will lie on the marginal hyperplanes. The solution will then be sparse in the sense that a small fraction of the dual variables $\alpha_{i}$ will be nonzero. Note, however, that this bound is relatively weak since it applies only to the average generalization error of the algorithm over all samples of size m. It provides no information about the variance of the generalization error. In section 5.4, we present stronger high-probability bounds using a different argument based on the notion of margin.

![Figure 5.4](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/e79d4a105f6d7365a4e69fc0df739f3de1f8fd5fac5f5becc88b947daeaf041a.jpg)  
Figure 5.4  
A separating hyperplane with point $\mathbf{x}_{i}$ classified incorrectly and point $\mathbf{x}_{j}$ correctly classified, but with margin less than 1.

## 5.3 Non-separable case

In most practical settings, the training data is not linearly separable, which implies that for any hyperplane ${\mathbf{w}} \cdot{\mathbf{x}} + b = 0$ , there exists $\mathbf{x}_{i} \in S$ such that

$$
y_{i} \left[\mathbf{w} \cdot \mathbf{x}_{i} + b \right] \ngeq 1.\tag{5.22}
$$

Thus, the constraints imposed in the linearly separable case discussed in section 5.2 cannot all hold simultaneously. However, a relaxed version of these constraints can indeed hold, that is, for each $i \in[m]$ , there exist $\xi_{i} \geq 0$ such that

$$
y_{i} \left[\mathbf{w} \cdot \mathbf{x}_{i} + b \right] \geq 1 - \xi_{i}.\tag{5.23}
$$

The variables $\xi_{i}$ are known as slack variables and are commonly used in optimization to define relaxed versions of constraints. Here, a slack variable $\xi_{i}$ measures the distance by which vector $\mathbf{x}_{i}$ violates the desired inequality, $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 1$ Figure 5.4 illustrates the situation. For a hyperplane ${\bf w} \cdot{\bf x} + b = 0$ , a vector $\mathbf{x}_{i}$ with $\xi_{i} > 0$ can be viewed as an outlier. Each $\mathbf{x}_{i}$ must be positioned on the correct side of the appropriate marginal hyperplane to not be considered an outlier. As a consequence, a vector $\mathbf{x}_{i}$ with $0 < y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) < 1$ is correctly classified by the hyperplane ${\mathbf{w}} \cdot{\mathbf{x}} + b = 0$ but is nonetheless considered to be an outlier, that is, $\xi_{i} > 0$ . If we omit the outliers, the training data is correctly separated by ${\mathbf{w}} \cdot{\mathbf{x}} + b = 0$ with a margin $\rho = 1 / \| \mathbf{w} \|$ that we refer to as the soft margin, as opposed to the hard margin in the separable case.

How should we select the hyperplane in the non-separable case? One idea consists of selecting the hyperplane that minimizes the empirical error. But, that solution will not benefit from the large-margin guarantees we will present in section 5.4. Furthermore, the problem of determining a hyperplane with the smallest zero-one loss, that is the smallest number of misclassifications, is NP-hard as a function of the dimension N of the space.

Here, there are two conflicting objectives: on one hand, we wish to limit the total amount of slack due to outliers, which can be measured by $\textstyle \sum_{i = 1}^{m} \xi_{i}$ , or, more generally by $\sum_{i = 1}^{m} \xi_{i}^{p}$ for some $p \geq 1 $ ; on the other hand, we seek a hyperplane with a large margin, though a larger margin can lead to more outliers and thus larger amounts of slack.

## 5.3.1 Primal optimization problem

This leads to the following general optimization problem defining SVMs in the non-separable case where the parameter $C \geq 0$ determines the trade-of between margin-maximization (or minimization of $\| \mathbf{w} \|^{2})$ and the minimization of the slack penalty $\textstyle \sum_{i = 1}^{m} \xi_{i}^{p};$ :

$$
\begin{array}{ll} \min_{\mathbf{w}, b, \boldsymbol{\xi}} & \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \xi_{i}^{p} \\ \text{subject to} & y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 1 - \xi_{i} \land \xi_{i} \geq 0, i \in[m], \end{array}\tag{5.24}
$$

where $\pmb{\xi} =(\xi_{1}, \ldots, \xi_{m})^{\top}$ . The parameter C is typically determined via n-fold crossvalidation (see section 4.5).

As in the separable case, (5.24) is a convex optimization problem since the constraints are Affine and thus convex and since the objective function is convex for any $p \geq 1$ . In particular, $\begin{array}{r}{\pmb{\xi} \mapsto \sum_{i = 1}^{m} \xi_{i}^{p} = \| \pmb{\xi} \|_{p}^{p}} \end{array}$ is convex in view of the convexity of the norm $\| \cdot \|_{p}.$

There are many possible choices for p leading to more or less aggressive penalizations of the slack terms (see exercise 5.1). The choices $p = 1$ and $p = 2$ lead to the most straightforward solutions and analyses. The loss functions associated with $p = 1$ and $p = 2$ are called the hinge loss and the quadratic hinge loss, respectively. Figure 5.5 shows the plots of these loss functions as well as that of the standard zero-one loss function. Both hinge losses are convex upper bounds on the zero-one loss, thus making them well suited for optimization. In what follows, the analysis is presented in the case of the hinge loss $(p = 1)$ , which is the most widely used loss function for SVMs.

![Figure 5.5](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/b6ed4a8aadc173381c0d46dc94d45a02b6d4517739f6152b8526008d4b5273af.jpg)  
Figure 5.5  
Both the hinge loss and the quadratic hinge loss provide convex upper bounds on the binary zero-one loss.

## 5.3.2 Support vectors

As in the separable case, the constraints are Affine and thus qualified. The objective function as well as the Affine constraints are convex and diferentiable. Thus, the hypotheses of theorem B.30 hold and the KKT conditions apply at the optimum. We use these conditions to both analyze the algorithm and demonstrate several of its crucial properties, and subsequently derive the dual optimization problem associated to SVMs in section 5.3.3.

We introduce Lagrange variables $\alpha_{i} \ \ge \0, \i \ \in \[m]$ , associated to the first m constraints and $\beta_{i} \ge 0, i \in[m]$ associated to the non-negativity constraints of the slack variables. We denote by α the vector $(\alpha_{1}, \ldots, \alpha_{m})^{\top}$ and by $\beta$ the vector $(\beta_{1}, \ldots, \beta_{m})^{\top}$ . The Lagrangian can then be defined for all $\mathbf{w} \in \mathbb{R}^{N}, \b \in \mathbb{R}$ , and $\pmb{\xi}, \pmb{\alpha}, \pmb{\beta} \in \mathbb{R}_{+}^{m}$ , by

$$
\mathcal{L}(\mathbf{w}, b, \boldsymbol{\xi}, \boldsymbol{\alpha}, \boldsymbol{\beta}) = \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{i = 1}^{m} \xi_{i} - \sum_{i = 1}^{m} \alpha_{i}[y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) - 1 + \xi_{i}] - \sum_{i = 1}^{m} \beta_{i} \xi_{i}.\tag{5.25}
$$

The KKT conditions are obtained by setting the gradient of the Lagrangian with respect to the primal variables $\mathbf{w}, b,$ and $\xi_{i} s$ to zero and by writing the complemen-

tarity conditions:

$$
\nabla_{\mathbf{w}} \mathcal{L} = \mathbf{w} - \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i} = 0 \quad \Longrightarrow \quad \mathbf{w} = \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i}\tag{5.26}
$$

$$
\nabla_{b} \mathcal{L} = - \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0 \quad \Longrightarrow \quad \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0\tag{5.27}
$$

$$
\nabla_{\xi_{i}} \mathcal{L} = C - \alpha_{i} - \beta_{i} = 0 \quad \Longrightarrow \quad \alpha_{i} + \beta_{i} = C\tag{5.28}
$$

$$
\forall i, \alpha_{i}[y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) - 1 + \xi_{i}] = 0 \quad \Longrightarrow \quad \alpha_{i} = 0 \vee y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1 - \xi_{i}\tag{5.29}
$$

$$
\forall i, \beta_{i} \xi_{i} = 0 \quad \Longrightarrow \quad \beta_{i} = 0 \vee \xi_{i} = 0.\tag{5.30}
$$

By equation (5.26), as in the separable case, the weight vector w at the solution of the SVM problem is a linear combination of the training set vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ A vector $\mathbf{x}_{i}$ appears in that expansion if $\alpha_{i} \neq 0$ . Such vectors are called support vectors. Here, there are two types of support vectors. By the complementarity condition (5.29), if $\alpha_{i} \neq 0$ , then $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1 - \xi_{i}$ . If $\xi_{i} = 0$ , then $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) = 1$ and $\mathbf{x}_{i}$ lies on a marginal hyperplane, as in the separable case. Otherwise, $\xi_{i} \neq 0$ and $\mathbf{x}_{i}$ is an outlier. In this case, (5.30) implies $\beta_{i} = 0$ and (5.28) then requires $\alpha_{i} = C$ . Thus, support vectors $\mathbf{x}_{i}$ are either outliers, in which case $\alpha_{i} = C$ , or vectors lying on the marginal hyperplanes. As in the separable case, note that while the weight vector w solution is unique, the support vectors are not.

## 5.3.3 Dual optimization problem

To derive the dual form of the constrained optimization problem (5.24), we plug into the Lagrangian the definition of w in terms of the dual variables (5.26) and apply the constraint (5.27). This yields

$$
\mathcal{L} = \underbrace{\frac{1}{2} \| \sum_{i = 1}^{m} \alpha_{i} y_{i} \mathbf{x}_{i} \|^{2} - \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j})}_{- \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j})} - \underbrace{\sum_{i = 1}^{m} \alpha_{i} y_{i} b}_{0} + \sum_{i = 1}^{m} \alpha_{i}.\tag{5.31}
$$

Remarkably, we find that the objective function is no different than in the separable case: m m

$$
\mathcal{L} = \sum_{i = 1}^{m} \alpha_{i} - \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}).\tag{5.32}
$$

However, here, in addition to $\alpha_{i} \geq 0$ , we must impose the constraint on the Lagrange variables $\beta_{i} \geq 0$ . In view of (5.28), this is equivalent to $\alpha_{i} \leq C$ . This leads to the following dual optimization problem for SVMs in the non-separable case, which only difers from that of the separable case (5.14) by the constraints $\alpha_{i} \leq C$

$$
\begin{array}{c} \max_{\boldsymbol{\alpha}} \sum_{i = 1}^{m} \alpha_{i} - \frac{1}{2} \sum_{i, j = 1}^{m} \alpha_{i} \alpha_{j} y_{i} y_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}) \\ \text{subject to:} 0 \leq \alpha_{i} \leq C \wedge \sum_{i = 1}^{m} \alpha_{i} y_{i} = 0, i \in[m].\end{array}\tag{5.33}
$$

Thus, our previous comments about the optimization problem (5.14) apply to (5.33) as well. In particular, the objective function is concave and infinitely diferentiable and (5.33) is equivalent to a convex QP. The problem is equivalent to the primal problem (5.24).

The solution α of the dual problem (5.33) can be used directly to determine the hypothesis returned by SVMs, using equation (5.26):

$$
h(\mathbf{x}) = \mathrm{sgn}(\mathbf{w} \cdot \mathbf{x} + b) = \mathrm{sgn} \Big(\sum_{i = 1}^{m} \alpha_{i} y_{i}(\mathbf{x}_{i} \cdot \mathbf{x}) + b \Big).\tag{5.34}
$$

Moreover, b can be obtained from any support vector $\mathbf{x}_{i}$ lying on a marginal hyperplane, that is any vector $\mathbf{x}_{i}$ with $0 < \alpha_{i} < C$ . For such support vectors, $\mathbf{w} \cdot \mathbf{x}_{i} + b = y_{i}$ and thus m

$$
b = y_{i} - \sum_{j = 1}^{m} \alpha_{j} y_{j}(\mathbf{x}_{j} \cdot \mathbf{x}_{i}).\tag{5.35}
$$

As in the separable case, the dual optimization problem (5.33) and the expressions (5.34) and (5.35) show an important property of SVMs: the hypothesis solution depends only on inner products between vectors and not directly on the vectors themselves. This fact can be used to extend SVMs to define non-linear decision boundaries, as we shall see in chapter 6.

## 5.4 Margin theory

This section presents generalization bounds which provide a strong theoretical justification for the SVM algorithm.

Recall that the VC-dimension of the family of hyperplanes or linear hypotheses in <sup>RN</sup> is $N + 1$ . Thus, the application of the VC-dimension bound (3.29) of corollary 3.19 to this hypothesis set yields the following: for any $\delta > 0$ , with probability at least $1 - \delta.$ for any $h \in{\mathcal{H}}$ ,

$$
R(h) \leq \widehat{R}_{S}(h) + \sqrt{\frac{2(N + 1) \log \frac{em}{N + 1}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{5.36}
$$

When the dimension of the feature space N is large compared to the sample size m, this bound is uninformative. Remarkably, the learning guarantees presented in this section are independent of the dimension N and thus hold regardless of its value.

The guarantees we will present hold for real-valued functions such as the function $\mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} + b$ returned by SVMs, as opposed to classification functions returning $+ 1 \ \mathrm{or \ - 1}$ , such as $\mathbf{x} \mapsto \operatorname{sgn}(\mathbf{w} \cdot \mathbf{x} + b)$ . They are based on the notion of confidence margin. The confidence margin of a real-valued function h at a point x labeled with y is the quantity $yh(x)$ . Thus, when $yh(x) > 0.$ , h classifies x correctly but we interpret the magnitude of $| h(x) |$ as the confidence of the prediction made by h. The notion of confidence margin is distinct from that of geometric margin and does not require a linear separability assumption. But, the two notions are related as follows in the separable case: for $h \colon \mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} + b$ with geometric margin ρ<sub>geom</sub>, the confidence margin at any point x of the training sample with label y is at least $\rho_{\mathrm{geom}} \lVert \mathbf{w} \rVert$ , i.e. $| yh(\mathbf{x}) | \geq \rho_{\mathrm{geom}} \| \mathbf{w} \|$

In view of the definition of the confidence margin, for any parameter $\rho > 0.$ , we will define a ρ-margin loss function that, as with the zero-one loss, penalizes h with the cost of 1 when it misclassifies point x $(yh(x) \leq 0)$ , but also penalizes h (linearly) when it correctly classifies x with confidence less than or equal to $\rho \(yh(x) \leq \rho)$ The main margin-based generalization bounds of this section are presented in terms of this loss function, which is formally defined as follows.

Definition 5.5 (Margin loss function) For any $\rho > 0$ , the ρ-margin loss is the function $L_{\rho} \colon \mathbb{R} \times \mathbb{R} \to \mathbb{R}_{+}$ defined for all $y, y^{\prime} \in \mathbb{R}$ by $L_{\rho}(y, y^{\prime}) = \Phi_{\rho}(yy^{\prime})$ with,

$$
\Phi_{\rho}(x) = \min \left(1, \max \left(0, 1 - \frac{x}{\rho}\right)\right) = \left\{\begin{array}{ll} 1 & \text{if} x \leq 0 \\ 1 - \frac{x}{\rho} & \text{if} 0 \leq x \leq \rho \\ 0 & \text{if} \rho \leq x.\end{array} \right.
$$

This loss function is illustrated by figure 5.6. The parameter $\rho > 0$ can be interpreted as the confidence margin demanded from a hypothesis h. The empirical margin loss is similarly defined as the margin loss over the training sample.

Definition 5.6 (Empirical margin loss) Given a sample $S =(x_{1}, \dots, x_{m})$ and a hypothesis h, the empirical margin loss is defined by

$$
\widehat{R}_{S, \rho}(h) = \frac{1}{m} \sum_{i = 1}^{m} \Phi_{\rho}(y_{i} h(x_{i})).\tag{5.37}
$$

Note that, for any $i \in[m], \Phi_{\rho}(y_{i} h(x_{i})) \leq 1_{y_{i} h(x_{i}) \leq \rho}$ . Thus, the empirical margin loss can be upper-bounded as follows:

$$
\widehat{R}_{S, \rho}(h) \leq \frac{1}{m} \sum_{i = 1}^{m} 1_{y_{i} h(x_{i}) \leq \rho}.\tag{5.38}
$$

![Figure 5.6](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p001-200/images/b6811f7845a96c64dbff8d29409abd67a69970863d22c25e64aaf3057bacea4e.jpg)  
Figure 5.6  
The margin loss illustrated in red, defined with respect to margin parameter $\rho = 0.7$

In all the results that follow, the empirical margin loss can be replaced by this upper bound, which admits a simple interpretation: it is the fraction of the points in the training sample S that have been misclassified or classified with confidence less than $\rho.$ In other words, the upper bound is then the fraction of the points in the training data with margin less than $\rho.$ This corresponds to the loss function indicated by the blue dotted line in figure 5.6.

A key benefit of using a loss function based on $\Phi_{\rho}$ as opposed to the zero-one loss or the loss defined by the blue dotted line of figure 5.6 is that $\Phi_{\rho}$ is $1 / \rho \mathrm{- Lipschitz},$ since the absolute value of the slope of the function is at most $1 / \rho.$ . The following lemma bounds the empirical Rademacher complexity of a hypothesis set H after composition with such a Lipschitz function in terms of the empirical Rademacher complexity of H. It will be needed for the proof of the margin-based generalization bound.

Lemma 5.7 (Talagrand’s lemma) Let $\Phi_{1}, \ldots, \Phi_{m}$ be l-Lipschitz functions from <sup>R</sup> to <sup>R</sup> and $\sigma_{1}, \ldots, \sigma_{m}$ be Rademacher random variables. Then, for any hypothesis set H of real-valued functions, the following inequality holds:

$$
\frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i}(\Phi_{i} \circ h)(x_{i})) \right] \leq \frac{l}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \right] = l \widehat{\mathfrak{R}}_{S}(\mathcal{H}).
$$

In particular, if $\Phi_{i} = \Phi$ for all $i \in[m]$ , then the following holds:

$$
\widehat{\mathfrak{R}}_{S}(\Phi \circ \mathcal{H}) \leq l \widehat{\mathfrak{R}}_{S}(\mathcal{H}).
$$

Proof: First we fix a sample $S =(x_{1}, \dots, x_{m})$ , then, by definition,

$$
\frac{1}{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i}(\Phi_{m} \circ h)(x_{i}) \right] = \frac{1}{m} \underset{\sigma_{1}, \dots, \sigma_{m - 1}}{\mathbb{E}} \left[\underset{\sigma_{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m}(\Phi_{m} \circ h)(x_{m}) \right] \right],
$$

where $\begin{array}{r}{u_{m - 1}(h) = \sum_{i = 1}^{m - 1} \sigma_{i}(\Phi_{i} \circ h)(x_{i})} \end{array}$ . By definition of the supremum, for any $\epsilon > 0$ , there exist $h_{1}, h_{2} \in \mathcal{H}$ such that

$$
\begin{array}{rl} & u_{m - 1}(h_{1}) +(\Phi_{m} \circ h_{1})(x_{m}) \geq(1 - \epsilon) \Big[\sup_{h \in \mathcal{H}} u_{m - 1}(h) +(\Phi_{m} \circ h)(x_{m}) \Big] \\ \text{and} & u_{m - 1}(h_{2}) -(\Phi_{m} \circ h_{2})(x_{m}) \geq(1 - \epsilon) \Big[\sup_{h \in \mathcal{H}} u_{m - 1}(h) -(\Phi_{m} \circ h)(x_{m}) \Big].\end{array}
$$

Thus, for any $\epsilon > 0$ , by definition of $\mathbb{E}_{\sigma_{m}}$

$$
\begin{array}{l}(1 - \epsilon) \underset{\sigma_{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m}(\Phi_{m} \circ h)(x_{m}) \right] \\ =(1 - \epsilon) \bigg[\frac{1}{2} \sup_{h \in \mathcal{H}} \Big[u_{m - 1}(h) +(\Phi_{m} \circ h)(x_{m}) \Big] + \frac{1}{2} \Big[\sup_{h \in \mathcal{H}} u_{m - 1}(h) -(\Phi_{m} \circ h)(x_{m}) \Big] \bigg] \\ \leq \frac{1}{2}[u_{m - 1}(h_{1}) +(\Phi_{m} \circ h_{1})(x_{m})] + \frac{1}{2}[u_{m - 1}(h_{2}) -(\Phi_{m} \circ h_{2})(x_{m})].\end{array}
$$

Let $s = \mathrm{sgn}(h_{1}(x_{m}) - h_{2}(x_{m}))$ . Then, the previous inequality implies

$$
\begin{array}{ll}(1 - \epsilon) \underset{\sigma_{m}}{\mathbb{E}} \Big[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m}(\Phi_{m} \circ h)(x_{m}) \Big] \\ \leq \frac{1}{2}[u_{m - 1}(h_{1}) + u_{m - 1}(h_{2}) + sl(h_{1}(x_{m}) - h_{2}(x_{m}))] & \text{(Lipschitz property)} \\ = \frac{1}{2}[u_{m - 1}(h_{1}) + slh_{1}(x_{m})] + \frac{1}{2}[u_{m - 1}(h_{2}) - slh_{2}(x_{m})] & \text{(rearranging)} \\ \leq \frac{1}{2} \sup_{h \in \mathcal{H}}[u_{m - 1}(h) + slh(x_{m})] + \frac{1}{2} \sup_{h \in \mathcal{H}}[u_{m - 1}(h) - slh(x_{m})] & \text{(definition of sup)} \\ = \underset{\sigma_{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m} lh(x_{m}) \right].& \text{(definition of} \underset{\sigma_{m}}{\mathbb{E}}) \end{array}
$$

Since the inequality holds for all $\epsilon > 0$ , we have

$$
\underset{\sigma_{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m}(\Phi_{m} \circ h)(x_{m}) \right] \leq \underset{\sigma_{m}}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} u_{m - 1}(h) + \sigma_{m} lh(x_{m}) \right].
$$

Proceeding in the same way for all other $\sigma_{i} \(i \neq m)$ proves the lemma.

The following is a general margin-based generalization bound that will be used in the analysis of several algorithms.

Theorem 5.8 (Margin bound for binary classification) Let H be a set of real-valued functions. Fix $\rho > 0$ , then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following holds for all $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \mathfrak{R}_{m}(\mathcal{H}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}\tag{5.39}
$$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2}{\rho} \widehat{\mathfrak{R}}_{S}(\mathcal{H}) + 3 \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{5.40}
$$

Proof: Let $\widetilde{\mathcal{H}} = \{z =(x, y) \mapsto yh(x) \colon h \in \mathcal{H}\}$ . Consider the family of functions taking values in [0, 1]:

$$
\widetilde{\mathcal{H}} = \left\{\Phi_{\rho} \circ f \colon f \in \widetilde{\mathcal{H}} \right\}.
$$

By theorem 3.3, with probability at least $1 - \delta.$ , for all $g \in \widetilde{\mathcal{H}}$ ,

$$
\mathbb{E}[g(z)] \leq \frac{1}{m} \sum_{i = 1}^{m} g(z_{i}) + 2 \Re_{m}(\widetilde{\mathcal{H}}) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}},
$$

and thus, for all $h \in{\mathcal{H}}$

$$
\mathbb{E} \left[\Phi_{\rho}(yh(x)) \right] \leq \widehat{R}_{S, \rho}(h) + 2 \Re_{m} \left(\Phi_{\rho} \circ \widetilde{\mathcal{H}}\right) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Since $1_{u \leq 0} \leq \Phi_{\rho}(u)$ for all $u \in \mathbb{R}$ , we have $R(h) = \mathbb{E}[1_{yh(x) \leq 0}] \leq \mathbb{E}[\Phi_{\rho}(yh(x))]$ , thus

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + 2 \Re_{m} \big(\Phi_{\rho} \circ \widetilde{\mathcal{H}} \big) + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.
$$

Since $\Phi_{\rho}$ is $1 / \rho \mathrm{- Lipschitz}$ , by lemma 5.7, we have $\Re_{m} \big(\Phi_{\rho} \circ \widetilde{\mathcal{H}} \big) \ : \leq \ : \frac{1}{\rho} \Re_{m}(\widetilde{\mathcal{H}})$ and $\mathfrak{R}_{m}(\widetilde{\mathcal{H}})$ can be rewritten as follows:

$$
\mathfrak{R}_{m}(\widetilde{\mathcal{H}}) = \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} y_{i} h(x_{i}) \right] = \frac{1}{m} \underset{S, \sigma}{\mathbb{E}} \left[\sup_{h \in \mathcal{H}} \sum_{i = 1}^{m} \sigma_{i} h(x_{i}) \right] = \mathfrak{R}_{m}(\mathcal{H}).
$$

This proves (5.39). The second inequality, (5.40), can be derived in the same way by using the second inequality of theorem 3.3, (3.4), instead of (3.3). $\square$

The generalization bounds of theorem 5.8 suggest a trade-of: a larger value of $\rho$ decreases the complexity term (second term), but tends to increase the empirical margin-loss $\widehat{R}_{S, \rho}(h)$ (first term) by requiring from a hypothesis h a higher confidence margin. Thus, if for a relatively large value of $\rho$ the empirical margin loss of h remains relatively small, then $h$ benefits from a very favorable guarantee on its generalization error. For theorem 5.8, the margin parameter $\rho$ must be selected beforehand. But, the bounds of the theorem can be generalized to hold uniformly for all $\rho \in(0, 1]$ at the cost of a modest additional term $\sqrt{\frac{\log \log_{2}{\frac{2}{\rho}}}{m}}$ , as shown in the following theorem (a version of this theorem with better constants can be derived, see exercise 5.2).

Theorem 5.9 Let H be a set of real-valued functions. Fix $r > 0$ . Then, for any $\delta > 0$ , with probability at least $1 - \delta$ , each of the following holds for all $h \in{\mathcal{H}}$ and $\rho \in(0, r]$ :

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{4}{\rho} \Re_{m}(\mathcal{H}) + \sqrt{\frac{\log \log_{2} \frac{2r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}\tag{5.41}
$$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{4}{\rho} \widehat{\mathfrak{R}}_{S}(\mathcal{H}) + \sqrt{\frac{\log \log_{2} \frac{2r}{\rho}}{m}} + 3 \sqrt{\frac{\log \frac{4}{\delta}}{2m}}.\tag{5.42}
$$

Proof: Consider two sequences $(\rho_{k})_{k \geq 1}$ and $\left(\epsilon_{k} \right)_{k \geq 1}$ , with $\epsilon_{k} \in(0, 1]$ . By theorem 5.8, for any fixed $k \geq 1$ ,

$$
\mathbb{P} \left[\sup_{h \in H} R(h) - \widehat{R}_{S, \rho_{k}}(h) > \frac{2}{\rho_{k}} \Re_{m}(\mathcal{H}) + \epsilon_{k} \right] \leq \exp(- 2m \epsilon_{k}^{2}).\tag{5.43}
$$

Choose $\epsilon_{k} = \epsilon + \sqrt{\frac{\log k}{m}}$ , then, by the union bound, the following holds:

$$
\begin{array}{l}\mathbb{P}\left[\sup_{\substack{h\in H\\ k\geq 1}}R(h) - \widehat{R}_{S,\rho_{k}}(h) - \frac{2}{\rho_{k}}\mathfrak{R}_{m}(\mathcal{H}) - \epsilon_{k} > 0\right]\\ \leq \sum_{k\geq 1}\exp(-2m\epsilon_{k}^{2})\\ = \sum_{k\geq 1}\exp \big[-2m(\epsilon +\sqrt{(\log k) / m})^{2}\big]\\ \leq \sum_{k\geq 1}\exp(-2m\epsilon^{2})\exp(-2\log k)\\ = \big(\sum_{k\geq 1}1 / k^{2}\big)\exp(-2m\epsilon^{2})\\ = \frac{\pi^{2}}{6}\exp(-2m\epsilon^{2})\leq 2\exp(-2m\epsilon^{2}).\end{array}
$$

We can choose $\rho_{k} = r / 2^{k}$ . For any $\rho \in(0, r]$ , there exists $k \geq 1$ such that $\rho \in$ $(\rho_{k}, \rho_{k - 1}]$ , with $\rho_{0} = r$ . For that k, $\rho \le \rho_{k - 1} = 2 \rho_{k}$ , thus $1 / \rho_{k} \le 2 / \rho$ and ${\sqrt{\log k}} =$ $\sqrt{\log \log_{2}(r / \rho_{k})} \ \leq \ \sqrt{\log \log_{2}(2r / \rho)}$ . Furthermore, for any $h \in \mathcal{H}, \widehat{R}_{S, \rho_{k}}(h) \leq$ $\widehat{R}_{S, \rho}(h)$ . Thus, the following inequality holds:

$$
\mathbb{P}\left[\sup_{\substack{h\in H\\ \rho \in(0,r]}}R(h) - \widehat{R}_{S,\rho}(h) - \frac{4}{\rho}\mathfrak{R}_{m}(\mathcal{H}) - \sqrt{\frac{\log\log_{2}(2r / \rho)}{m}} -\epsilon >0\right]\leq 2\exp(-2m\epsilon^{2}),
$$

which proves the first statement. The second statement can be proven in a similar way. $\square$

## 5.4 Margin theory

The Rademacher complexity of linear hypotheses with bounded weight vector can be bounded as follows.

Theorem 5.10 Let $S \subseteq \{\mathbf{x} \colon \| \mathbf{x} \| \leq r\}$ be a sample of size m and let $\mathcal { H } = \{ \mathbf { x } \mapsto $ $\mathbf{w} \cdot \mathbf{x} \colon \| \mathbf{w} \| \leq \Lambda\}$ . Then, the empirical Rademacher complexity of H can be bounded as follows:

$$
\widehat{\mathfrak{R}}_{S}(\mathcal{H}) \leq \sqrt{\frac{r^{2} \Lambda^{2}}{m}}.
$$

Proof: The proof follows through a series of inequalities:

$$
\begin{array}{l} \widehat{\mathfrak{R}}_{S}(\mathcal{H}) = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{\| \mathbf{w} \| \leq \Lambda} \sum_{i = 1}^{m} \sigma_{i} \mathbf{w} \cdot \mathbf{x}_{i} \right] = \frac{1}{m} \underset{\sigma}{\mathbb{E}} \left[\sup_{\| \mathbf{w} \| \leq \Lambda} \mathbf{w} \cdot \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right] \\ \quad \leq \frac{\Lambda}{m} \underset{\sigma}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\| \right] \leq \frac{\Lambda}{m} \left[\underset{\sigma}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|^{2} \right] \right]^{\frac{1}{2}} \\ = \frac{\Lambda}{m} \left[\underset{\sigma}{\mathbb{E}} \left[\sum_{i, j = 1}^{m} \sigma_{i} \sigma_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}) \right] \right]^{\frac{1}{2}} \leq \frac{\Lambda}{m} \left[\sum_{i = 1}^{m} \| \mathbf{x}_{i} \|^{2} \right]^{\frac{1}{2}} \leq \frac{\Lambda \sqrt{mr^{2}}}{m} = \sqrt{\frac{r^{2} \Lambda^{2}}{m}}, \end{array}
$$

The first inequality makes use of the Cauchy-Schwarz inequality and the bound on $\| \mathbf{w} \|$ , the second follows by Jensen’s inequality, the third by $\mathbb{E}[\sigma_{i} \sigma_{j}] = \mathbb{E}[\sigma_{i}] \mathbb{E}[\sigma_{j}] =$ 0 for $i \neq j$ , and the last one by $\| \mathbf{x}_{i} \| \leq r$ $\square$

Combining theorem 5.10 and theorem 5.8 gives directly the following general margin bound for linear hypotheses with bounded weight vectors, presented in corollary 5.11.

Corollary 5.11 Let $\mathcal{H} = \left\{\mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} \colon \lVert \mathbf{w} \rVert \leq \Lambda \right\}$ and assume that $\mathcal{X} \subseteq \{\mathbf{x} \colon \| \mathbf{x} \| \leq r\}$ Fix $\rho > 0$ , then, for any $\delta > 0$ , with probability at least $1 - \delta$ over the choice of a sample S of size m, the following holds for any $h \in{\mathcal{H}}$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + 2 \sqrt{\frac{r^{2} \Lambda^{2} / \rho^{2}}{m}} + \sqrt{\frac{\log \frac{1}{\delta}}{2m}}.\tag{5.44}
$$

As with theorem 5.8, the bound of this corollary can be generalized to hold uniformly for all $\rho \in(0, 1]$ at the cost of an additional term $\sqrt{\frac{\log \log_{2}{\frac{2}{\rho}}}{m}}$ by combining theorems 5.10 and 5.9.

This generalization bound for linear hypotheses is remarkable, since it does not depend directly on the dimension of the feature space, but only on the margin. It suggests that a small generalization error can be achieved when $\rho /(r \Lambda)$ is large (small second term) while the empirical margin loss is relatively small (first term). The latter occurs when few points are either classified incorrectly or correctly, but with margin less than $\rho.$ When the training sample is linearly separable, for a linear hypothesis with geometric margin $\rho_{\mathrm{geom}}$ and the choice of the confidence margin parameter $\rho = \rho_{\mathrm{geom}}$ , the empirical margin loss term is zero. Thus, if $\rho_{\mathrm{geom}}$ is relatively large, this provides a strong guarantee for the generalization error of the corresponding linear hypothesis.

The fact that the guarantee does not explicitly depend on the dimension of the feature space may seem surprising and appears to contradict the VC-dimension lower bounds of theorems 3.20 and 3.23. Those lower bounds show that for any learning algorithm there exists a bad distribution for which the error of the hypothesis returned by the algorithm is $\Omega(\sqrt{d / m})$ with a non-zero probability. The bound of the corollary does not rule out such bad cases, however: for such bad distributions, the empirical margin loss would be large even for a relatively small margin $\rho,$ and thus the bound of the corollary would be loose in that case.

Thus, in some sense, the learning guarantee of the corollary hinges upon the hope of a good margin value $\rho \colon$ if there exists a relatively large margin value $\rho > 0$ for which the empirical margin loss is small, then a small generalization error is guaranteed by the corollary. This favorable margin situation depends on the distribution: while the learning bound is distribution-independent, the existence of a good margin is in fact distribution-dependent. A favorable margin seems to appear relatively often in applications.

The bound of the corollary gives a strong justification for margin-maximization algorithms such as SVMs. Choosing $\Lambda = 1$ , by the generalization of corollary 5.11 to a uniform bound over $\rho \in(0, r]$ , for any $\delta > 0$ , with probability at least $1 - \delta$ the following holds for all $h \in \left.\mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} \colon \left\| \mathbf{w} \right\| \leq 1 \right.$ and $\rho \in(0, r]$

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + 4 \sqrt{\frac{r^{2} / \rho^{2}}{m}} + \sqrt{\frac{\log \log_{2} \frac{2r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

The inequality also trivially holds for $\rho$ larger than r since in that case, by the Cauchy-Schwarz inequality, for any w with $\| \mathbf{w} \| \leq 1$ , we have $y_{i}(\mathbf{w} \cdot \mathbf{x}_{i}) \leq r \leq \rho$ and $\widehat{R}_{S, \rho}(h)$ is equal to one for all $h.$

Now, for any $\rho > 0$ , the ρ-margin loss function is upper bounded by the ρ-hinge loss:

$$
\forall u \in \mathbb{R}, \Phi_{\rho}(u) = \min \left(1, \max \left(0, 1 - \frac{u}{\rho}\right)\right) \leq \max \left(0, 1 - \frac{u}{\rho}\right).\tag{5.45}
$$

Thus, with probability at least $1 - \delta$ , the following holds for all $h \in \{{\bf x} \mapsto{\bf w}$ $\mathbf{x} \colon \| \mathbf{w} \| \leq 1 \big\}$ and all $\rho > 0$

$$
R(h) \leq \frac{1}{m} \sum_{i = 1}^{m} \max \left(0, 1 - \frac{y_{i}(\mathbf{w} \cdot \mathbf{x}_{i})}{\rho}\right) + 4 \sqrt{\frac{r^{2} / \rho^{2}}{m}} + \sqrt{\frac{\log \log_{2} \frac{2r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.
$$

Since for any $\rho > 0, h / \rho$ admits the same generalization error as $h,$ with probability at least $1 - \delta$ , the following holds for all $h \in \left.\mathbf{x} \mapsto \mathbf{w} \cdot \mathbf{x} \colon \| \mathbf{w} \| \leq 1 / \rho \right.$ and all $\rho > 0 \colon$

$$
R(h) \leq \frac{1}{m} \sum_{i = 1}^{m} \max \left(0, 1 - y_{i}(\mathbf{w} \cdot \mathbf{x}_{i})\right) + 4 \sqrt{\frac{r^{2} / \rho^{2}}{m}} + \sqrt{\frac{\log \log_{2} \frac{2r}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}.\tag{5.46}
$$

This inequality can be used to derive an algorithm that selects w and $\rho > 0$ to minimize the right-hand side. The minimization with respect to $\rho$ does not lead to a convex optimization and depends on theoretical constant factors afecting the second and third terms, which may not be optimal. Thus, instead, $\rho$ is left as a free parameter of the algorithm, typically determined via cross-validation.

Now, since only the first term of the right-hand side depends on w, for any $\rho > 0$ , the bound suggests selecting w as the solution of the following optimization problem:

$$
\min_{\| \mathbf{w} \|^{2} \leq \frac{1}{\rho^{2}}} \frac{1}{m} \sum_{i = 1}^{m} \max \left(0, 1 - y_{i}(\mathbf{w} \cdot \mathbf{x}_{i})\right).\tag{5.47}
$$

Introducing a Lagrange variable $\lambda \geq 0$ , the optimization problem can be written equivalently as

$$
\min_{\mathbf{w}} \lambda \| \mathbf{w} \|^{2} + \frac{1}{m} \sum_{i = 1}^{m} \max \left(0, 1 - y_{i}(\mathbf{w} \cdot \mathbf{x}_{i})\right).\tag{5.48}
$$

Since for any choice of $\rho$ in the constraint of (5.47) there exists an equivalent dual variable λ in the formulation of (5.48) that achieves the same optimal w, λ can be freely selected via cross-validation.<sup>5</sup> The resulting algorithm precisely coincides with SVMs. Note that an alternative objective function and thus algorithm would be based on the empirical margin loss instead of the hinge loss. However, the advantage of the hinge loss is that it is convex, while the margin loss is not.

As already pointed out, the bounds just discussed do not directly depend on the dimension of the feature space but guarantee good generalization when given a favorable margin. Thus, they suggest seeking large-margin separating hyperplanes in a very high-dimensional space. In view of the form of the dual optimization problems for SVMs, determining the solution of the optimization and using it for prediction both require computing many inner products in that space. For very high-dimensional spaces, the computation of these inner products could become very costly. The next chapter provides a solution to this problem which further provides a generalization of SVMs to non-vectorial input spaces.

## 5.5 Chapter notes

The maximum-margin or optimal hyperplane solution described in section 5.2 was introduced by Vapnik and Chervonenkis [1964]. The algorithm had limited applications since in most tasks in practice the data is not linearly separable. In contrast, the SVM algorithm of section 5.3 for the general non-separable case, introduced by Cortes and Vapnik [1995] under the name support-vector networks, has been widely adopted and been shown to be efective in practice. The algorithm and its theory have had a profound impact on theoretical and applied machine learning and inspired research on a variety of topics. Several specialized algorithms have been suggested for solving the specific QP that arises when solving the SVM problem, for example the SMO algorithm of Platt [1999] (see exercise 5.4) and a variety of other decomposition methods such as those used in the LibLinear software library [Hsieh et al., 2008], and [Allauzen et al., 2010] for solving the problem when using rational kernels (see chapter 6).

Much of the theory supporting the SVM algorithm ([Cortes and Vapnik, 1995, Vapnik, 1998]), in particular the margin theory presented in section 5.4, has been adopted in the learning theory and statistics communities and applied to a variety of other problems. The margin bound on the VC-dimension of canonical hyperplanes (exercise 5.7) is by Vapnik [1998], the proof is very similar to Novikof’s margin bound on the number of updates made by the Perceptron algorithm in the separable case. Our presentation of margin guarantees based on the Rademacher complexity follows the elegant analysis of Koltchinskii and Panchenko [2002] (see also Bartlett and Mendelson [2002], Shawe-Taylor et al. [1998]). Our proof of Talagrand’s lemma 5.7 is a simpler and more concise version of a more general result given by Ledoux and Talagrand [1991, pp. 112–114]. See H¨ofgen et al. [1995] for hardness results related to the problem of finding a hyperplane with the minimal number of errors on a training sample.

## 5.6 Exercises

5.1 Soft margin hyperplanes. The function of the slack variables used in the optimization problem for soft margin hyperplanes has the form: $\xi \mapsto \textstyle \sum_{i = 1}^{m} \xi_{i}$ Instead, we could use $\xi \mapsto \textstyle \sum_{i = 1}^{m} \xi_{i}^{p}$ , with $p > 1$

(a) Give the dual formulation of the problem in this general case.

(b) How does this more general formulation $(p > 1)$ compare to the standard setting $(p = 1) ?$ In the case $p = 2$ is the optimization still convex?

5.2 Tighter Rademacher Bound. Derive the following tighter version of the bound of theorem 5.9: for any $\delta > 0$ , with probability at least $1 - \delta.$ , for all $h \in{\mathcal{H}}$ and $\rho \in(0, 1]$ the following holds:

$$
R(h) \leq \widehat{R}_{S, \rho}(h) + \frac{2 \gamma}{\rho} \Re_{m}(\mathcal{H}) + \sqrt{\frac{\log \log_{\gamma} \frac{\gamma}{\rho}}{m}} + \sqrt{\frac{\log \frac{2}{\delta}}{2m}}\tag{5.49}
$$

for any $\gamma > 1$

5.3 Importance weighted SVM. Suppose you wish to use SVMs to solve a learning problem where some training data points are more important than others. More formally, assume that each training point consists of a triplet $(x_{i}, y_{i}, p_{i})$ , where $0 \leq p_{i} \leq 1$ is the importance of the ith point. Rewrite the primal SVM constrained optimization problem so that the penalty for mis-labeling a point $x_{i}$ is scaled by the priority $p_{i}$ . Then carry this modification through the derivation of the dual solution.

5.4 Sequential minimal optimization (SMO). The SMO algorithm is an optimization algorithm introduced to speed up the training of SVMs. SMO reduces a (potentially) large quadratic programming (QP) optimization problem into a series of small optimizations involving only two Lagrange multipliers. SMO reduces memory requirements, bypasses the need for numerical QP optimization and is easy to implement. In this question, we will derive the update rule for the SMO algorithm in the context of the dual formulation of the SVM problem.

(a) Assume that we want to optimize equation (5.33) only over $\alpha_{1}$ and $\alpha_{2}$ . Show that the optimization problem reduces to

$$
\max_{\alpha_{1}, \alpha_{2}} \underbrace{\alpha_{1} + \alpha_{2} - \frac{1}{2} K_{11} \alpha_{1}^{2} - \frac{1}{2} K_{22} \alpha_{2}^{2} - sK_{12} \alpha_{1} \alpha_{2} - y_{1} \alpha_{1} v_{1} - y_{2} \alpha_{2} v_{2}}_{\Psi_{1}(\alpha_{1}, \alpha_{2})}
$$

subject to: $0 \leq \alpha_{1}, \alpha_{2} \leq C \land \alpha_{1} + s \alpha_{2} = \gamma$ 2

where $\begin{array}{r}{\gamma = y_{1} \sum_{i = 3}^{m} y_{i} \alpha_{i}, s = y_{1} y_{2} \in \{- 1, + 1\}, K_{ij} =(\mathbf{x}_{i} \cdot \mathbf{x}_{j})} \end{array}$ and $v_{i} =$ $\textstyle \sum_{j = 3}^{m} \alpha_{j} y_{j} K_{ij}$ for $i = 1, 2$

(b) Substitute the linear constraint $\alpha_{1} = \gamma - s \alpha_{2}$ into $\Psi_{1}$ to obtain a new objective function $\Psi_{2}$ that depends only on $\alpha_{2}$ . Show that the $\alpha_{2}$ that maximizes $\Psi_{2}$ (without the constraints $0 \leq \alpha_{1}, \alpha_{2} \leq C)$ can be expressed as

$$
\alpha_{2} = \frac{s(K_{11} - K_{12}) \gamma + y_{2}(v_{1} - v_{2}) - s + 1}{\eta},
$$

where $\eta = K_{11} + K_{22} - 2K_{12}$

(c) Show that

$$
v_{1} - v_{2} = f(\mathbf{x}_{1}) - f(\mathbf{x}_{2}) + \alpha_{2}^{*} y_{2} \eta - sy_{2} \gamma(K_{11} - K_{12})
$$

where $\begin{array}{r}{f(\mathbf{x}) = \sum_{i = 1}^{m} \alpha_{i}^{*} y_{i}(\mathbf{x}_{i} \cdot \mathbf{x}) + b^{*}} \end{array}$ and $\alpha_{i}^{*}$ are values for the Lagrange multipliers prior to optimization over $\alpha_{1}$ and $\alpha_{2}$ (similarly, $b^{*}$ is the previous value for the ofset).

(d) Show that

$$
\alpha_{2} = \alpha_{2}^{*} + y_{2} \frac{(y_{2} - f(\mathbf{x}_{2})) -(y_{1} - f(\mathbf{x}_{1}))}{\eta}.
$$

(e) For $s = + 1$ , define $L = \operatorname{max} \{0, \gamma - C\}$ and $H = \operatorname{min} \{C, \gamma\}$ as the lower and upper bounds on $\alpha_{2}$ . Similarly, for $s = - 1$ , define $L = \operatorname{max} \{0, - \gamma\}$ and $H = \operatorname{min} \{C, C - \gamma\}$ . The update rule for SMO involves “clipping” the value of $\alpha_{2}$ , i.e.,

$$
\alpha_{2}^{clip} = \left\{\begin{array}{ll} \alpha_{2} & \text{ifL < \alpha_{2} < H} \\ L & \text{if \alpha_{2} \leq L} \\ H & \text{if \alpha_{2} \geq H} \end{array} \right.
$$

We subsequently solve for $\alpha_{1}$ such that we satisfy the equality constraint, resulting in $\alpha_{1} = \alpha_{1}^{*} + s(\alpha_{2}^{*} - \alpha_{2}^{clip})$ . Why is “clipping” is required? How are $L$ and H derived for the case $s = + 1 ?$

5.5 SVMs hands-on.

(a) Download and install the libsvm software library from:

$$
\text{http: / / www.csie.ntu.edu.tw/} \sim \text{cjlin / libsvm /}.
$$

(b) Download the satimage data set found at:

$$
\text{http://www.csie.ntu.edu.tw/} \sim \text{cjlin / libsvmtools / datasets / .}
$$

Merge the training and validation sets into one. We will refer to the resulting set as the training set from now on. Normalize both the training and test vectors.

(c) Consider the binary classification that consists of distinguishing class 6 from the rest of the data points. Use SVMs combined with polynomial kernels (see chapter 6) to solve this classification problem. To do so, randomly split the training data into ten equal-sized disjoint sets. For each value of the polynomial degree, $d = 1, 2, 3, 4$ , plot the average cross-validation error plus or minus one standard deviation as a function of $C$ (let the other parameters of polynomial kernels in libsvm, $\gamma$ and $c,$ be equal to their default values 1).

Report the best value of the trade-of constant C measured on the validation set.

(d) Let $(C^{*}, d^{*})$ be the best pair found previously. Fix $C$ to be $C^{*}$ . Plot the ten-fold cross-validation training and test errors for the hypotheses obtained as a function of d. Plot the average number of support vectors obtained as a function of $d.$

(e) How many of the support vectors lie on the margin hyperplanes?

(f) In the standard two-group classification, errors on positive or negative points are treated in the same manner. Suppose, however, that we wish to penalize an error on a negative point (false positive error) $k > 0$ times more than an error on a positive point. Give the dual optimization problem corresponding to SVMs modified in this way.

(g) Assume that k is an integer. Show how you can use libsvm without writing any additional code to find the solution of the modified SVMs just described.

(h) Apply the modified SVMs to the classification task previously examined and compare with your previous SVMs results for $k = 2, 4, 8, 16$

5.6 Sparse SVM. One can give two types of arguments in favor of the SVM algorithm: one based on the sparsity of the support vectors, another based on the notion of margin. Suppose that instead of maximizing the margin, we choose instead to maximize sparsity by minimizing the $L_{p}$ norm of the vector α that defines the weight vector $\mathbf{w},$ for some $p \geq 1$ . First, consider the case $p = 2$ This gives the following optimization problem:

$$
\begin{array}{c} \min_{\boldsymbol{\alpha}, b} \frac{1}{2} \sum_{i = 1}^{m} \alpha_{i}^{2} + C \sum_{i = 1}^{m} \xi_{i} \\ \text{subject to} y_{i} \Big(\sum_{j = 1}^{m} \alpha_{j} y_{j} \mathbf{x}_{i} \cdot \mathbf{x}_{j} + b \Big) \geq 1 - \xi_{i}, i \in[m] \\ \xi_{i}, \alpha_{i} \geq 0, i \in[m].\end{array}\tag{5.50}
$$

(a) Show that modulo the non-negativity constraint on $\alpha,$ the problem coincides with an instance of the primal optimization problem of SVM.

(b) Derive the dual optimization of problem of (5.50).

(c) Setting $p = 1$ will induce a more sparse α. Derive the dual optimization in this case.

5.7 VC-dimension of canonical hyperplanes. The objective of this problem is derive a bound on the VC-dimension of canonical hyperplanes that does not depend on the dimension of feature space. Let $S \subseteq \{\mathbf{x} \colon \| \mathbf{x} \| \leq r\}$ . We will show that the VC-dimension d of the set of canonical hyperplanes $\begin{array}{r}{\{x \mapsto \operatorname{sgn}(\mathbf{w} \cdot \mathbf{x}) \colon \operatorname{min}_{x \in S} | \mathbf{w}} \end{array}$ $\mathbf{x} | = 1 \land \| \mathbf{w} \| \leq \Lambda\}$ verifies

$$
d \leq r^{2} \Lambda^{2}.\tag{5.51}
$$

(a) Let $\{\mathbf{x}_{1}, \ldots, \mathbf{x}_{d}\}$ be a set that can be shattered. Show that for all ${\textbf{y}} =$ $\begin{array}{r}{(y_{1}, \ldots, y_{d}) \in \{- 1, + 1\}^{d}, d \leq \Lambda \| \sum_{i = 1}^{d} y_{i}{\bf x}_{i} \|.} \end{array}$

(b) Use randomization over the labels $\mathbf{y}$ and Jensen’s inequality to show that $d \leq \Lambda \sqrt{\sum_{i = 1}^{d} \| \mathbf{x}_{i} \|^{2}}$

(c) Conclude that $d \leq r^{2} \Lambda^{2}$

Kernel methods are widely used in machine learning. They are flexible techniques that can be used to extend algorithms such as SVMs to define non-linear decision boundaries. Other algorithms that only depend on inner products between sample points can be extended similarly, many of which will be studied in future chapters.

The main idea behind these methods is based on so-called kernels or kernel functions, which, under some technical conditions of symmetry and positive-definiteness, implicitly define an inner product in a high-dimensional space. Replacing the original inner product in the input space with positive definite kernels immediately extends algorithms such as SVMs to a linear separation in that high-dimensional space, or, equivalently, to a non-linear separation in the input space.

In this chapter, we present the main definitions and key properties of positive definite symmetric kernels, including the proof of the fact that they define an inner product in a Hilbert space, as well as their closure properties. We then extend the SVM algorithm using these kernels and present several theoretical results including general margin-based learning guarantees for hypothesis sets based on kernels. We also introduce negative definite symmetric kernels and point out their relevance to the construction of positive definite kernels, in particular from distances or metrics. Finally, we illustrate the design of kernels for non-vectorial discrete structures by introducing a general family of kernels for sequences, rational kernels. We describe an efficient algorithm for the computation of these kernels and illustrate them with several examples.


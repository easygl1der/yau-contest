---
title: "Chapter 9 \u2014 Linear Predictors"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 9
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 2501
source_line_end: 2896
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 4
source_empty_image_alt: 4
non_semantic_image_alt: 3
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 9 — Linear Predictors

> [[../README|本书目录]] · [[08-chapter-8-the-runtime-of-learning|上一章]] · [[10-chapter-10-boosting|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 2501–2896。
> - 本章保留 4 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 1；efficient × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 9.1 Halfspaces

The first hypothesis class we consider is the class of halfspaces, designed for binary classification problems, namely, $\mathcal{X} = \mathbb{R}^{d}$ and $\mathcal{V} = \{- 1, + 1\}$ . The class of halfspaces is defined as follows:

$$
HS_{d} = \mathrm{sign} \circ L_{d} = \{\mathbf{x} \mapsto \mathrm{sign}(h_{\mathbf{w}, b}(\mathbf{x})): h_{\mathbf{w}, b} \in L_{d}\}.
$$

In other words, each halfspace hypothesis in $HS_{d}$ is parameterized by ${\textbf{w}} \in$ $\mathbb{R}^{d}$ and $b \in \mathbb{R}$ and upon receiving a vector x the hypothesis returns the label $\mathrm{sign}(\langle \mathbf{w}, \mathbf{x} \rangle + b)$

To illustrate this hypothesis class geometrically, it is instructive to consider the case $d = 2$ . Each hypothesis forms a hyperplane that is perpendicular to the vector w and intersects the vertical axis at the point $(0, - b / w_{2})$ . The instances that are “above” the hyperplane, that is, share an acute angle with $\mathbf{w}.$ , are labeled positively. Instances that are “below” the hyperplane, that ${\mathrm{is}},$ share an obtuse angle with $\mathbf{w},$ are labeled negatively.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/dc4be23823db83b3e45b54fffa3590e1f2905ee919318e45de8f3857bf251a37.jpg)

In Section 9.1.3 we will show that $\mathrm{VCdim}(HS_{d}) = d + 1$ . It follows that we can learn halfspaces using the ERM paradigm, as long as the sample size is $\Omega \left(\frac{d + \log(1 / \delta)}{\epsilon} \right)$ . Therefore, we now discuss how to implement an ERM procedure for halfspaces.

We introduce below two solutions to finding an ERM halfspace in the realizable case. In the context of halfspaces, the realizable case is often referred to as the “separable” case, since it is possible to separate with a hyperplane all the positive examples from all the negative examples. Implementing the ERM rule in the nonseparable case (i.e., the agnostic case) is known to be computationally hard (Ben-David & Simon 2001). There are several approaches to learning nonseparable data. The most popular one is to use surrogate loss functions, namely, to learn a halfspace that does not necessarily minimize the empirical risk with the 0 − 1 loss, but rather with respect to a different loss function. For example, in Section 9.3 we will describe the logistic regression approach, which can be implemented eficiently even in the nonseparable case. We will study surrogate loss functions in more detail later on in Chapter 12.

## 9.1.1 Linear Programming for the Class of Halfspaces

Linear programs (LP) are problems that can be expressed as maximizing a linear function subject to linear inequalities. That is,

$$
\begin{array}{l} \max_{\mathbf{w} \in \mathbb{R}^{d}} \quad \langle \mathbf{u}, \mathbf{w} \rangle \\ \text{subject to} \quad A \mathbf{w} \geq \mathbf{v} \end{array}
$$

where $\textbf{w} \in \mathbb{R}^{d}$ is the vector of variables we wish to determine, A is an m × d matrix, and $\mathbf{v} \in \mathbb{R}^{m}, \mathbf{u} \in \mathbb{R}^{d}$ are vectors. Linear programs can be solved eficiently,<sup>1</sup> and furthermore, there are publicly available implementations of LP solvers.

We will show that the ERM problem for halfspaces in the realizable case can be expressed as a linear program. For simplicity, we assume the homogenous case. Let $S = \{(\mathbf{x}_{i}, y_{i})\}_{i = 1}^{m}$ be a training set of size m. Since we assume the realizable case, an ERM predictor should have zero errors on the training set. That is, we are looking for some vector $\mathbf{w} \in \mathbb{R}^{d}$ for which

$$
\mathrm{sign}(\langle \mathbf{w}, \mathbf{x}_{i} \rangle) = y_{i}, \quad \forall i = 1, \ldots, m.
$$

Equivalently, we are looking for some vector w for which

$$
y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle > 0, \quad \forall i = 1, \dots, m.
$$

Let $\mathbf{w}^{*}$ be a vector that satisfies this condition (it must exist since we assume realizability). Define $\begin{array}{r}{\gamma = \operatorname{min}_{i}(y_{i} \langle \mathbf{w}^{*}, \mathbf{x}_{i} \rangle)} \end{array}$ ) and let $\begin{array}{r}{\bar{\bf w} = \frac{{\bf w}^{*}}{\gamma}} \end{array}$ . Therefore, for all i we have

$$
y_{i} \langle \bar{\mathbf{w}}, x_{i} \rangle = \frac{1}{\gamma} y_{i} \langle \mathbf{w}^{*}, \mathbf{x}_{i} \rangle \geq 1.
$$

We have thus shown that there exists a vector that satisfies

$$
y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle \geq 1, \quad \forall i = 1, \dots, m.\tag{9.1}
$$

And clearly, such a vector is an ERM predictor.

To find a vector that satisfies Equation (9.1) we can rely on an LP solver as follows. Set A to be the $m \times d$ matrix whose rows are the instances multiplied by $y_{i}$ . That is, $A_{i, j} = y_{i} x_{i, j}$ , where $x_{i, j}$ is the $j^{\prime}$ th element of the vector $\mathbf{x}_{i}.$ . Let v be the vector $(1, \ldots, 1) \in \mathbb{R}^{m}$ . Then, Equation (9.1) can be rewritten as

$$
A \mathbf{w} \geq \mathbf{v}.
$$

The LP form requires a maximization objective, yet all the w that satisfy the constraints are equal candidates as output hypotheses. Thus, we set a “dummy” objective, $\mathbf{u} =(0, \dots, 0) \in \mathbb{R}^{d}$

## 9.1.2 Perceptron for Halfspaces

A different implementation of the ERM rule is the Perceptron algorithm of Rosenblatt (Rosenblatt 1958). The Perceptron is an iterative algorithm that constructs a sequence of vectors $\mathbf { w } ^ { ( 1 ) } , \mathbf { w } ^ { ( 2 ) } , \ldots $ Initially, $\mathbf{w}^{(1)}$ is set to be the all-zeros vector. At iteration t, the Perceptron finds an example i that is mislabeled by $\mathbf{w}^{(t)}$ , namely, an example for which sign $(\left.\mathbf{w}^{(t)}, \mathbf{x}_{i} \right.) \neq y_{i}$ . Then, the Perceptron updates $\mathbf{w}^{(t)}$ by adding to it the instance $\mathbf{x}_{i}$ scaled by the label $y_{i}$ That is, $\mathbf{w}^{(t + 1)} = \mathbf{w}^{(t)} + y_{i} \mathbf{x}_{i}$ . Recall that our goal is to have $y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle > 0$ for all i and note that

$$
y_{i} \langle \mathbf{w}^{(t + 1)}, \mathbf{x}_{i} \rangle = y_{i} \langle \mathbf{w}^{(t)} + y_{i} \mathbf{x}_{i}, \mathbf{x}_{i} \rangle = y_{i} \langle \mathbf{w}^{(t)}, \mathbf{x}_{i} \rangle + \| \mathbf{x}_{i} \|^{2}.
$$

Hence, the update of the Perceptron guides the solution to be “more correct” on the i’th example.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Batch Perceptron
input: A training set  $(\mathbf{x}_{1}, y_{1}), \ldots,(\mathbf{x}_{m}, y_{m})$ 
initialize:  $\mathbf{w}^{(1)} =(0, \ldots, 0)$ 
for  $t = 1, 2, \ldots$ 
    if  $(\exists i \text{s.t.} y_{i} \langle \mathbf{w}^{(t)}, \mathbf{x}_{i} \rangle \leq 0)$  then
    $\mathbf{w}^{(t+1)} = \mathbf{w}^{(t)} + y_{i} \mathbf{x}_{i}$ 
    else
    output  $\mathbf{w}^{(t)}$
</div>

The following theorem guarantees that in the realizable case, the algorithm stops with all sample points correctly classified.

<sup>theorem</sup> 9.1 Assume that $(\mathbf{x}_{1}, y_{1}), \dotsc,(\mathbf{x}_{m}, y_{m})$ is separable, let $B = \operatorname{min} \{\| \mathbf{w} \|$ $\forall i \in[m], \quad y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle \geq 1\}$ , and let $R = \operatorname{max}_{i} \left\| \mathbf{x}_{i} \right\|$ . Then, the Perceptron algorithm stops after at most $(RB)^{2}$ iterations, and when it stops it holds that $\forall i \in[m], \quad y_{i} \langle \mathbf{w}^{(t)}, \mathbf{x}_{i} \rangle > 0$

Proof By the definition of the stopping condition, if the Perceptron stops it must have separated all the examples. We will show that if the Perceptron runs for T iterations, then we must have $T \leq(RB)^{2}$ , which implies the Perceptron must stop after at most $(RB)^{2}$ iterations.

Let $\mathbf{w}^{\star}$ be a vector that achieves the minimum in the definition of B. That is, $y_{i} \langle \mathbf{w}^{\star}, x_{i} \rangle \geq 1$ for all $i,$ and among all vectors that satisfy these constraints, $\mathbf{w}^{\star}$ is of minimal norm.

The idea of the proof is to show that after performing $T$ iterations, the cosine of the angle between $\mathbf{w}^{\star}$ and $\mathbf{w}^{(T + 1)}$ is at least $\frac{\sqrt{T}}{RB}$ . That is, we will show that

$$
\frac{\langle \mathbf{w}^{\star}, \mathbf{w}^{(T + 1)} \rangle}{\| \mathbf{w}^{\star} \| \| \mathbf{w}^{(T + 1)} \|} \geq \frac{\sqrt{T}}{RB}.\tag{9.2}
$$

By the Cauchy-Schwartz inequality, the left-hand side of Equation (9.2) is at most 1. Therefore, Equation (9.2) would imply that

$$
1 \geq \frac{\sqrt{T}}{RB} \Rightarrow T \leq(RB)^{2},
$$

which will conclude our proof.

To show that Equation (9.2) holds, we first show that $\langle \mathbf{w}^{\star}, \mathbf{w}^{(T + 1)} \rangle \geq T$ Indeed, at the first iteration, $\mathbf{w}^{(1)} =(0, \ldots, 0)$ and therefore $\langle \mathbf{w}^{\star}, \mathbf{w}^{(1)} \rangle = 0$ , while on iteration $t,$ if we update using example $\left(\mathbf{x}_{i}, y_{i} \right)$ we have that

$$
\begin{array}{rl} &{\langle \mathbf{w}^{\star}, \mathbf{w}^{(t + 1)} \rangle - \langle \mathbf{w}^{\star}, \mathbf{w}^{(t)} \rangle = \langle \mathbf{w}^{\star}, \mathbf{w}^{(t + 1)} - \mathbf{w}^{(t)} \rangle} \\ &{\qquad = \langle \mathbf{w}^{\star}, y_{i} \mathbf{x}_{i} \rangle = y_{i} \langle \mathbf{w}^{\star}, \mathbf{x}_{i} \rangle} \\ &{\qquad \geq 1.} \end{array}
$$

Therefore, after performing T iterations, we get:

$$
\langle \mathbf{w}^{\star}, \mathbf{w}^{(T + 1)} \rangle = \sum_{t = 1}^{T} \left(\langle \mathbf{w}^{\star}, \mathbf{w}^{(t + 1)} \rangle - \langle \mathbf{w}^{\star}, \mathbf{w}^{(t)} \rangle\right) \geq T,\tag{9.3}
$$

as required.

Next, we upper bound $\| \mathbf{w}^{(T + 1)} \|$ . For each iteration t we have that

$$
\begin{array}{rl} &{\| \mathbf{w}^{(t + 1)} \|^{2} = \| \mathbf{w}^{(t)} + y_{i} \mathbf{x}_{i} \|^{2}} \\ &{\qquad = \| \mathbf{w}^{(t)} \|^{2} + 2y_{i} \langle \mathbf{w}^{(t)}, \mathbf{x}_{i} \rangle + y_{i}^{2} \| \mathbf{x}_{i} \|^{2}} \\ &{\qquad \leq \| \mathbf{w}^{(t)} \|^{2} + \mathbb{R}^{2}} \end{array}\tag{9.4}
$$

where the last inequality is due to the fact that example i is necessarily such that $y_{i} \langle \mathbf{w}^{(t)}, \mathbf{x}_{i} \rangle \leq 0$ , and the norm of $\mathbf{x}_{i}$ is at most R. Now, since $\| \mathbf{w}^{(1)} \|^{2} = 0$ if we use Equation (9.4) recursively for $T$ iterations, we obtain that

$$
\| \mathbf{w}^{(T + 1)} \|^{2} \leq TR^{2} \Rightarrow \| \mathbf{w}^{(T + 1)} \| \leq \sqrt{T} R.\tag{9.5}
$$

Combining Equation (9.3) with Equation (9.5), and using the fact that $\| \mathbf{w}^{\star} \| =$ $B,$ , we obtain that

$$
\frac{\langle \mathbf{w}^{(T + 1)}, \mathbf{w}^{\star} \rangle}{\| \mathbf{w}^{\star} \| \| \mathbf{w}^{(T + 1)} \|} \geq \frac{T}{B \sqrt{T} R} = \frac{\sqrt{T}}{BR}.
$$

We have thus shown that Equation (9.2) holds, and this concludes our proof.

Remark 9.1 The Perceptron is simple to implement and is guaranteed to converge. However, the convergence rate depends on the parameter B, which in some situations might be exponentially large in d. In such cases, it would be better to implement the ERM problem by solving a linear program, as described in the previous section. Nevertheless, for many natural data sets, the size of B is not too large, and the Perceptron converges quite fast.

## 9.1.3 The VC Dimension of Halfspaces

To compute the VC dimension of halfspaces, we start with the homogenous case.

<sup>theorem</sup> 9.2 The VC dimension of the class of homogenous halfspaces in $\mathbb{R}^{d}$ is d.

Proof First, consider the set of vectors $\mathbf{e}_{1}, \ldots, \mathbf{e}_{d}$ , where for every i the vector $\mathbf{e}_{i}$ is the all zeros vector except 1 in the i’th coordinate. This set is shattered by the class of homogenous halfspaces. Indeed, for every labeling $y_{1}, \ldots, y_{d}$ , set $\mathbf{w} =(y_{1}, \ldots, y_{d})$ , and then $\langle \mathbf{w}, \mathbf{e}_{i} \rangle = y_{i}$ for all i.

Next, let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{d + 1}$ be a set of $d + 1$ vectors in $\mathbb{R}^{d}$ . Then, there must exist real numbers $a_{1}, \dotsc, a_{d + 1}$ , not all of them are zero, such that $\begin{array}{r}{\sum_{i = 1}^{d + 1} a_{i} \mathbf{x}_{i} = \mathbf{0}} \end{array}$ Let $I = \{i : a_{i} > 0\}$ and $J = \{j : a_{j} < 0\}$ . Either I or J is nonempty. Let us first assume that both of them are nonempty. Then,

$$
\sum_{i \in I} a_{i} \mathbf{x}_{i} = \sum_{j \in J} | a_{j} | \mathbf{x}_{j}.
$$

Now, suppose that $\mathbf{x}_{1}, \ldots, \mathbf{x}_{d + 1}$ are shattered by the class of homogenous classes. Then, there must exist a vector w such that $\langle{\bf w},{\bf x}_{i} \rangle > 0$ for all $i \in I$ while $\langle \mathbf{w}, \mathbf{x}_{j} \rangle < 0$ for every $j \in J$ . It follows that

$$
0 < \sum_{i \in I} a_{i} \langle \mathbf{x}_{i}, \mathbf{w} \rangle = \left\langle \sum_{i \in I} a_{i} \mathbf{x}_{i}, \mathbf{w} \right\rangle = \left\langle \sum_{j \in J} | a_{j} | \mathbf{x}_{j}, \mathbf{w} \right\rangle = \sum_{j \in J} | a_{j} | \langle \mathbf{x}_{j}, \mathbf{w} \rangle < 0,
$$

which leads to a contradiction. Finally, if J (respectively, I) is empty then the right-most (respectively, left-most) inequality should be replaced by an equality, which still leads to a contradiction. □

<sup>theorem</sup> 9.3 The VC dimension of the class of nonhomogenous halfspaces in $\mathbb{R}^{d}$ is $d + 1$

Proof First, as in the proof of Theorem 9.2, it is easy to verify that the set of vectors $\mathbf{0}, \mathbf{e}_{1}, \ldots, \mathbf{e}_{d}$ is shattered by the class of nonhomogenous halfspaces. Second, suppose that the vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{d + 2}$ are shattered by the class of nonhomogenous halfspaces. But, using the reduction we have shown in the beginning of this chapter, it follows that there are $d + 2$ vectors in $\mathbb{R}^{d + 1}$ that are shattered by the class of homogenous halfspaces. But this contradicts Theorem 9.2. □

![Figure 9.1](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/0f7c852d1bba5b9256384ec1892bbca67340eddedd8acb671b1e5acaf0517fcf.jpg)  
Figure 9.1 Linear regression for $d = 1$ . For instance, the x-axis may denote the age of the baby, and the y-axis her weight.

## 9.2 Linear Regression

Linear regression is a common statistical tool for modeling the relationship between some “explanatory” variables and some real valued outcome. Cast as a learning problem, the domain set $\mathcal{X}$ is a subset of $\mathbb{R}^{d}$ , for some $d,$ and the label set $\mathcal{V}$ is the set of real numbers. We would like to learn a linear function $h : \mathbb { R } ^ { d } $ <sup>R</sup> that best approximates the relationship between our variables (say, for example, predicting the weight of a baby as a function of her age and weight at birth). Figure 9.1 shows an example of a linear regression predictor for $d = 1$

The hypothesis class of linear regression predictors is simply the set of linear functions,

$$
\mathcal{H}_{reg} = L_{d} = \{\mathbf{x} \mapsto \langle \mathbf{w}, \mathbf{x} \rangle + b: \mathbf{w} \in \mathbb{R}^{d}, b \in \mathbb{R}\}.
$$

Next we need to define a loss function for regression. While in classification the definition of the loss is straightforward, as $\ell(h,({\mathbf x}, y))$ simply indicates whether $h(\mathbf{x})$ correctly predicts $y$ or not, in regression, if the baby’s weight is 3 kg, both the predictions 3.00001 kg and 4 kg are “wrong,” but we would clearly prefer the former over the latter. We therefore need to define how much we shall be “penalized” for the discrepancy between $h(\mathbf{x})$ and $y.$ One common way is to use the squared-loss function, namely,

$$
\ell(h,(\mathbf{x}, y)) =(h(\mathbf{x}) - y)^{2}.
$$

For this loss function, the empirical risk function is called the Mean Squared Error, namely,

$$
L_{S}(h) = \frac{1}{m} \sum_{i = 1}^{m}(h(\mathbf{x}_{i}) - y_{i})^{2}.
$$

In the next subsection, we will see how to implement the ERM rule for linear regression with respect to the squared loss. Of course, there are a variety of other loss functions that one can use, for example, the absolute value loss function, $\ell(h,({\mathbf x}, y)) = | h({\mathbf x}) - y |$ . The ERM rule for the absolute value loss function can be implemented using linear programming (see Exercise 1.)

Note that since linear regression is not a binary prediction task, we cannot analyze its sample complexity using the VC-dimension. One possible analysis of the sample complexity of linear regression is by relying on the “discretization trick” (see Remark 4.1 in Chapter 4); namely, if we are happy with a representation of each element of the vector w and the bias b using a finite number of bits (say a 64 bits floating point representation), then the hypothesis class becomes finite and its size is at most $2^{64(d + 1)}$ . We can now rely on sample complexity bounds for finite hypothesis classes as described in Chapter 4. Note, however, that to apply the sample complexity bounds from Chapter 4 we also need that the loss function will be bounded. Later in the book we will describe more rigorous means to analyze the sample complexity of regression problems.

## 9.2.1 Least Squares

Least squares is the algorithm that solves the ERM problem for the hypothesis class of linear regression predictors with respect to the squared loss. The ERM problem with respect to this class, given a training set $S,$ and using the homogenous version of $L_{d}.$ , is to find

$$
\underset{\mathbf{w}}{\operatorname{argmin}} L_{S}(h_{\mathbf{w}}) = \underset{\mathbf{w}}{\operatorname{argmin}} \frac{1}{m} \sum_{i = 1}^{m}(\langle \mathbf{w}, \mathbf{x}_{i} \rangle - y_{i})^{2}.
$$

To solve the problem we calculate the gradient of the objective function and compare it to zero. That is, we need to solve

$$
\frac{2}{m} \sum_{i = 1}^{m}(\langle \mathbf{w}, \mathbf{x}_{i} \rangle - y_{i}) \mathbf{x}_{i} = 0.
$$

We can rewrite the problem as the problem Aw = b where

$$
A = \left(\sum_{i = 1}^{m} \mathbf{x}_{i} \mathbf{x}_{i}^{\top}\right) \quad \text{and} \quad \mathbf{b} = \sum_{i = 1}^{m} y_{i} \mathbf{x}_{i}.\tag{9.6}
$$

Or, in matrix form:

$$
\begin{array}{l} A = \left(\begin{array}{ccc} \vdots & & \vdots \\ \mathbf{x}_{1} & \ldots & \mathbf{x}_{m} \\ \vdots & & \vdots \end{array} \right) \left(\begin{array}{ccc} \vdots & & \vdots \\ \mathbf{x}_{1} & \ldots & \mathbf{x}_{m} \\ \vdots & & \vdots \end{array} \right)^{\top}, \\ \mathbf{b} = \left(\begin{array}{ccc} \vdots & & \vdots \\ \mathbf{x}_{1} & \ldots & \mathbf{x}_{m} \\ \vdots & & \vdots \end{array} \right) \left(\begin{array}{c} y_{1} \\ \vdots \\ y_{m} \end{array} \right).\end{array}\tag{9.7}
$$

(9.8)

If A is invertible then the solution to the ERM problem is

$$
\mathbf{w} = A^{- 1} \mathbf{b}.
$$

The case in which A is not invertible requires a few standard tools from linear algebra, which are available in Appendix C. It can be easily shown that if the training instances do not span the entire space of $\mathbb{R}^{d}$ then A is not invertible. Nevertheless, we can always find a solution to the system $A \mathbf{w} = \mathbf{b}$ because b is in the range of A. Indeed, since A is symmetric we can write it using its eigenvalue decomposition as $A = VDV^{\top}$ , where D is a diagonal matrix and V is an orthonormal matrix (that is, $V^{\top} V$ is the identity $d \times d$ matrix). Define $D^{+}$ to be the diagonal matrix such that $D_{i, i}^{+} = 0 \mathrm{~ if ~} D_{i, i} = 0$ and otherwise $D_{i, i}^{+} = 1 / D_{i, i}$ . Now, define

$$
A^{+} = VD^{+} V^{\top} \quad \mathrm{and} \quad \hat{\mathbf{w}} = A^{+} \mathbf{b}.
$$

Let $\mathbf{v}_{i}$ denote the i’th column of $V.$ . Then, we have

$$
A \hat{\mathbf{w}} = AA^{+} \mathbf{b} = VDV^{\top} VD^{+} V^{\top} \mathbf{b} = VDD^{+} V^{\top} \mathbf{b} = \sum_{i: D_{i, i} \neq 0} \mathbf{v}_{i} \mathbf{v}_{i}^{\top} \mathbf{b}.
$$

That is, Awˆ is the projection of b onto the span of those vectors $\mathbf{v}_{i}$ for which $D_{i, i} \neq 0$ . Since the linear span of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ is the same as the linear span of those $\mathbf{v}_{i},$ , and b is in the linear span of the $\mathbf{x}_{i},$ , we obtain that $A \hat{\mathbf{w}} = \mathbf{b}$ , which concludes our argument.

## 9.2.2 Linear Regression for Polynomial Regression Tasks

Some learning tasks call for nonlinear predictors, such as polynomial predictors. Take, for instance, a one dimensional polynomial function of degree $n,$ that is,

$$
p(x) = a_{0} + a_{1} x + a_{2} x^{2} + \dots + a_{n} x^{n}
$$

where $(a_{0}, \ldots, a_{n})$ is a vector of coeficients of size $n + 1$ . In the following we depict a training set that is better fitted using a 3rd degree polynomial predictor than using a linear predictor.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/0c9e7ee53c709637ebeae83e6a20015d18e036db59f0fe8e4169d1ac6cee2c21.jpg)

We will focus here on the class of one dimensional, n-degree, polynomial regression predictors, namely,

$$
\mathcal{H}_{poly}^{n} = \{x \mapsto p(x)\},
$$

where $p$ is a one dimensional polynomial of degree $n,$ parameterized by a vector of coeficients $(a_{0}, \ldots, a_{n})$ . Note that $\chi = \mathbb{R}$ , since this is a one dimensional polynomial, and $\mathcal{V} = \mathbb{R}$ , as this is a regression problem.

One way to learn this class is by reduction to the problem of linear regression, which we have already shown how to solve. To translate a polynomial regression problem to a linear regression problem, we define the mapping $\psi : \mathbb{R} \to \mathbb{R}^{n + 1}$ such that $\psi(x) = \left(1, x, x^{2}, \ldots, x^{n} \right)$ ). Then we have that

$$
p(\psi(x)) = a_{0} + a_{1} x + a_{2} x^{2} + \dots + a_{n} x^{n} = \langle{\bf a}, \psi(x) \rangle
$$

and we can find the optimal vector of coeficients a by using the Least Squares algorithm as shown earlier.

## 9.3 Logistic Regression

In logistic regression we learn a family of functions h from $\mathbb{R}^{d}$ to the interval $[0, 1]$ However, logistic regression is used for classification tasks: We can interpret $h(\mathbf{x})$ as the probability that the label of $\mathbf{x}$ is 1. The hypothesis class associated with logistic regression is the composition of a sigmoid function $\phi_{\mathrm{sig}} : \mathbb{R} \to[0, 1]$ over the class of linear functions $L_{d}$ . In particular, the sigmoid function used in logistic regression is the logistic function, defined as

$$
\phi_{\mathrm{sig}}(z) = \frac{1}{1 + \exp(- z)}.\tag{9.9}
$$

The name “sigmoid” means “S-shaped,” referring to the plot of this function, shown in the figure:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-001-200/images/0fecd17113a3828d712d171113b4b086c9190880f829e0406c5452824bc91b66.jpg)

The hypothesis class is therefore (where for simplicity we are using homogenous linear functions):

$$
H_{\mathrm{sig}} = \phi_{\mathrm{sig}} \circ L_{d} = \{\mathbf{x} \mapsto \phi_{\mathrm{sig}}(\langle \mathbf{w}, \mathbf{x} \rangle): \mathbf{w} \in \mathbb{R}^{d}\}.
$$

Note that when $\langle \mathbf{w}, \mathbf{x} \rangle$ is very large then $\phi_{\mathrm{sig}} \big(\langle{\bf w},{\bf x} \rangle \big)$ is close to 1, whereas if $\langle \mathbf{w}, \mathbf{x} \rangle$ is very small then $\phi_{\mathrm{sig}}(\langle \mathbf{w}, \mathbf{x} \rangle)$ is close to 0. Recall that the prediction of the halfspace corresponding to a vector w is $\mathrm{sign}(\langle \mathbf{w}, \mathbf{x} \rangle)$ . Therefore, the predictions of the halfspace hypothesis and the logistic hypothesis are very similar whenever $| \langle \mathbf{w}, \mathbf{x} \rangle |$ is large. However, when $| \langle \mathbf{w}, \mathbf{x} \rangle |$ is close to 0 we have that $\phi_{\mathrm{sig}}(\langle \mathbf{w}, \mathbf{x} \rangle)$ ≈ $\frac{1}{2}$ . Intuitively, the logistic hypothesis is not sure about the value of the label so it guesses that the label is $\mathrm{sign}(\langle \mathbf{w}, \mathbf{x} \rangle,$ ) with probability slightly larger than 50%. In contrast, the halfspace hypothesis always outputs a deterministic prediction of either $1 \ \mathrm{or \mathrm{-} 1}$ , even if $| \langle \mathbf{w}, \mathbf{x} \rangle |$ is very close to 0.

Next, we need to specify a loss function. That is, we should define how bad it is to predict some $h_{\mathbf{w}}(\mathbf{x}) \in[0, 1]$ given that the true label is $y \in \{\pm 1\}$ . Clearly, we would like that $h_{\mathbf{w}}(\mathbf{x})$ would be large if $y = 1$ and that $1 - h_{\mathbf{w}}(\mathbf{x})$ (i.e., the probability of predicting −1) would be large if $y = - 1$ . Note that

$$
1 - h_{\mathbf{w}}(\mathbf{x}) = 1 - \frac{1}{1 + \exp(- \langle \mathbf{w}, \mathbf{x} \rangle)} = \frac{\exp(- \langle \mathbf{w}, \mathbf{x} \rangle)}{1 + \exp(- \langle \mathbf{w}, \mathbf{x} \rangle)} = \frac{1}{1 + \exp(\langle \mathbf{w}, \mathbf{x} \rangle)}.
$$

Therefore, any reasonable loss function would increase monotonically with $\frac{1}{1 + \exp(y \langle \mathbf{w}, \mathbf{x} \rangle)}$ or equivalently, would increase monotonically with $1 + \exp(- y \langle \mathbf{w}, \mathbf{x} \rangle)$ . The logistic loss function used in logistic regression penalizes $h_{\mathbf{w}}$ based on the log of $1 + \exp(- y \langle \mathbf{w}, \mathbf{x} \rangle)$ (recall that log is a monotonic function). That is,

$$
\ell(h_{\mathbf{w}},(\mathbf{x}, y)) = \log \left(1 + \exp(- y \langle \mathbf{w}, \mathbf{x} \rangle)\right).
$$

Therefore, given a training set $S =(\mathbf{x}_{1}, y_{1}), \dotsc,(\mathbf{x}_{m}, y_{m})$ , the ERM problem associated with logistic regression is

$$
\underset{\mathbf{w} \in \mathbb{R}^{d}}{\operatorname{argmin}} \frac{1}{m} \sum_{i = 1}^{m} \log \left(1 + \exp(- y_{i} \langle \mathbf{w}, \mathbf{x}_{i} \rangle)\right).\tag{9.10}
$$

The advantage of the logistic loss function is that it is a convex function with respect to w; hence the ERM problem can be solved eficiently using standard methods. We will study how to learn with convex functions, and in particular specify a simple algorithm for minimizing convex functions, in later chapters.

The ERM problem associated with logistic regression (Equation (9.10)) is identical to the problem of finding a Maximum Likelihood Estimator, a well-known statistical approach for finding the parameters that maximize the joint probability of a given data set assuming a specific parametric probability function. We will study the Maximum Likelihood approach in Chapter 24.

## 9.4 Summary

The family of linear predictors is one of the most useful families of hypothesis classes, and many learning algorithms that are being widely used in practice rely on linear predictors. We have shown efficient algorithms for learning linear predictors with respect to the zero-one loss in the separable case and with respect to the squared and logistic losses in the unrealizable case. In later chapters we will present the properties of the loss function that enable efficient learning.

Naturally, linear predictors are efective whenever we assume, as prior knowledge, that some linear predictor attains low risk with respect to the underlying distribution. In the next chapter we show how to construct nonlinear predictors by composing linear predictors on top of simple classes. This will enable us to employ linear predictors for a variety of prior knowledge assumptions.

## 9.5 Bibliographic Remarks

The Perceptron algorithm dates back to Rosenblatt (1958). The proof of its convergence rate is due to (Agmon 1954, Novikof 1962). Least Squares regression goes back to Gauss (1795), Legendre (1805), and Adrain (1808).

## 9.6 Exercises

1. Show how to cast the ERM problem of linear regression with respect to the absolute value loss function, $\ell(h,({\bf x}, y)) = | h({\bf x}) - y |$ , as a linear program; namely, show how to write the problem

$$
\min_{\mathbf{w}} \sum_{i = 1}^{m} | \langle \mathbf{w}, \mathbf{x}_{i} \rangle - y_{i} |
$$

as a linear program.

Hint: Start with proving that for any $c \in \mathbb{R}$

$$
| c | = \min_{a \geq 0} a \text{s.t.} c \leq a \text{and} c \geq - a.
$$

2. Show that the matrix A defined in Equation (9.6) is invertible if and only if $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ span $\mathbb{R}^{d}$

3. Show that Theorem 9.1 is tight in the following sense: For any positive integer m, there exist a vector $\mathbf{w}^{*} \in \mathbb{R}^{d}$ (for some appropriate d) and a sequence of examples $\left\{(\mathbf{x}_{1}, y_{1}), \dotsc,(\mathbf{x}_{m}, y_{m}) \right\}$ } such that the following hold:

$R = \operatorname{max}_{i} \|{\bf x}_{i} \| \leq 1$

$\| \mathbf{w}^{*} \|^{2} = m$ , and for all $i \leq m, y_{i} \langle \mathbf{x}_{i}, \mathbf{w}^{*} \rangle \geq 1$ . Note that, using the notation in Theorem 9.1, we therefore get

$$
B = \min \{\| \mathbf{w} \|: \forall i \in[m], y_{i} \langle \mathbf{w}, x_{i} \rangle \geq 1\} \leq \sqrt{m}.
$$

Thus, $(BR)^{2} \leq m$

- When running the Perceptron on this sequence of examples it makes m updates before converging.

Hint: Choose $d = m$ and for every i choose $\mathbf{x}_{i} = \mathbf{e}_{i}$

4. (\*) Given any number m, find an example of a sequence of labeled examples $((\mathbf{x}_{1}, y_{1}), \hdots,(\mathbf{x}_{m}, y_{m})) \in(\mathbb{R}^{3} \times \{- 1, + 1\})^{m}$ on which the upper bound of Theorem 9.1 equals m and the perceptron algorithm is bound to make m mistakes.

Hint: Set each $\mathbf{x}_{i}$ to be a third dimensional vector of the form $(a, b, y_{i})$ , where $a^{2} + b^{2} = \mathbb{R}^{2} - 1$ . Let $\mathbf{w}^{*}$ be the vector $(0, 0, 1)$ . Now, go over the proof of the Perceptron’s upper bound (Theorem 9.1), see where we used inequalities $(\leq)$ rather than equalities $(=)$ , and figure out scenarios where the inequality actually holds with equality.

5. Suppose we modify the Perceptron algorithm as follows: In the update step, instead of performing $\mathbf{w}^{(t + 1)} = \mathbf{w}^{(t)} + y_{i} \mathbf{x}_{i}$ whenever we make a mistake, we perform $\mathbf{w}^{(t + 1)} = \mathbf{w}^{(t)} + \eta y_{i} \mathbf{x}_{i}$ for some $\eta > 0$ . Prove that the modified Perceptron will perform the same number of iterations as the vanilla Perceptron and will converge to a vector that points to the same direction as the output of the vanilla Perceptron.

6. In this problem, we will get bounds on the VC-dimension of the class of (closed) balls in $\mathbb{R}^{d}$ , that is,

$$
\mathcal{B}_{d} = \{B_{\mathbf{v}, r}: \mathbf{v} \in \mathbb{R}^{d}, r > 0\},
$$

where

$$
B_{\mathbf{v}, r}(\mathbf{x}) = \left\{\begin{array}{ll} 1 & \text{if} \| \mathbf{x} - \mathbf{v} \| \leq r \\ 0 & \text{otherwise} \end{array} \right..
$$

1. Consider the mapping $\phi : \mathbb{R}^{d} \mathbb{R}^{d + 1}$ defined by $\phi(\mathbf{x}) =(\mathbf{x}, \| \mathbf{x} \|^{2})$ . Show that if $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ are shattered by $\textstyle B_{d}$ then $\phi(\mathbf{x}_{1}), \hdots, \phi(\mathbf{x}_{m})$ are shattered by the class of halfspaces in $\mathbb{R}^{d + 1}$ (in this question we assume that sign $.(0) =$ 1). What does this tell us about $\mathrm{VCdim}(B_{d}) ?$

$$
d + 1 \leq \operatorname{VCdim}(\mathcal{B}_{d}) \leq d + 2.
$$

2. (\*) Find a set of $d + 1$ points in $\mathbb{R}^{d}$ that is shattered by $B_{d}$ . Conclude that

Boosting is an algorithmic paradigm that grew out of a theoretical question and became a very practical machine learning tool. The boosting approach uses a generalization of linear predictors to address two major issues that have been raised earlier in the book. The first is the bias-complexity tradeof. We have seen (in Chapter 5) that the error of an ERM learner can be decomposed into a sum of approximation error and estimation error. The more expressive the hypothesis class the learner is searching over, the smaller the approximation error is, but the larger the estimation error becomes. A learner is thus faced with the problem of picking a good tradeof between these two considerations. The boosting paradigm allows the learner to have smooth control over this tradeof. The learning starts with a basic class (that might have a large approximation error), and as it progresses the class that the predictor may belong to grows richer.

The second issue that boosting addresses is the computational complexity of learning. As seen in Chapter 8, for many interesting concept classes the task of finding an ERM hypothesis may be computationally infeasible. A boosting algorithm amplifies the accuracy of weak learners. Intuitively, one can think of a weak learner as an algorithm that uses a simple “rule of thumb” to output a hypothesis that comes from an easy-to-learn hypothesis class and performs just slightly better than a random guess. When a weak learner can be implemented eficiently, boosting provides a tool for aggregating such weak hypotheses to approximate gradually good predictors for larger, and harder to learn, classes.

In this chapter we will describe and analyze a practically useful boosting algorithm, AdaBoost (a shorthand for Adaptive Boosting). The AdaBoost algorithm outputs a hypothesis that is a linear combination of simple hypotheses. In other words, AdaBoost relies on the family of hypothesis classes obtained by composing a linear predictor on top of simple classes. We will show that AdaBoost enables us to control the tradeof between the approximation and estimation errors by varying a single parameter.

AdaBoost demonstrates a general theme, that will recur later in the book, of expanding the expressiveness of linear predictors by composing them on top of other functions. This will be elaborated in Section 10.3.

AdaBoost stemmed from the theoretical question of whether an efficient weak learner can be “boosted” into an efficient strong learner. This question was raised by Kearns and Valiant in 1988 and solved in 1990 by Robert Schapire, then a graduate student at MIT. However, the proposed mechanism was not very practical. In 1995, Robert Schapire and Yoav Freund proposed the AdaBoost algorithm, which was the first truly practical implementation of boosting. This simple and elegant algorithm became hugely popular, and Freund and Schapire’s work has been recognized by numerous awards.

Furthermore, boosting is a great example for the practical impact of learning theory. While boosting originated as a purely theoretical problem, it has led to popular and widely used algorithms. Indeed, as we shall demonstrate later in this chapter, AdaBoost has been successfully used for learning to detect faces in images.


---
title: "Chapter 7 \u2014 Sparse Kernel Machines"
book: "Pattern Recognition and Machine Learning"
book_slug: pattern-recognition-machine-learning
course: deep-learning
chapter_number: 7
citekey: bishop2006prml
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/pattern-recognition-machine-learning/reading.md"
source_line_start: 9664
source_line_end: 10681
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 16
source_empty_image_alt: 16
non_semantic_image_alt: 13
caption_derived_image_alt: 3
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 50
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 7 — Sparse Kernel Machines

> [[../README|本书目录]] · [[06-chapter-6-kernel-methods|上一章]] · [[08-chapter-8-graphical-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Pattern Recognition and Machine Learning（bishop2006prml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/pattern-recognition-machine-learning/reading.md)，源行 9664–10681。
> - 本章保留 16 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed PRML exercise difficulty marker pattern × 31；PDF-confirmed control-symbol repair (PDF p.356) × 1；PDF-confirmed control-symbol repair (PDF p.357) × 1；PDF-confirmed control-symbol repair (PDF p.360) × 1；PDF-confirmed book-specific control-codepoint pattern × 14。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Sparse Kernel Machines

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/a15a1065cbefc68b71935630e6771390dabb4f099cfdc4e6ea5708b781266175.jpg)

In the previous chapter, we explored a variety of learning algorithms based on nonlinear kernels. One of the significant limitations of many such algorithms is that the kernel function $k(\mathbf{x}_{n}, \mathbf{x}_{m})$ must be evaluated for all possible pairs ${\bf x}_{n}$ and $\mathbf{x}_{m}$ of training points, which can be computationally infeasible during training and can lead to excessive computation times when making predictions for new data points. In this chapter we shall look at kernel-based algorithms that have sparse solutions, so that predictions for new inputs depend only on the kernel function evaluated at a subset of the training data points.

We begin by looking in some detail at the support vector machine (SVM), which became popular in some years ago for solving problems in classification, regression, and novelty detection. An important property of support vector machines is that the determination of the model parameters corresponds to a convex optimization problem, and so any local solution is also a global optimum. Because the discussion of support vector machines makes extensive use of Lagrange multipliers, the reader is encouraged to review the key concepts covered in Appendix E. Additional information on support vector machines can be found in Vapnik (1995), Burges (1998), Cristianini and Shawe-Taylor (2000), Muller ¨ et al. (2001), Scholkopf and Smola ¨ (2002), and Herbrich (2002).

The SVM is a decision machine and so does not provide posterior probabilities. We have already discussed some of the benefits of determining probabilities in Section 1.5.4. An alternative sparse kernel technique, known as the relevance vector machine (RVM), is based on a Bayesian formulation and provides posterior probabilistic outputs, as well as having typically much sparser solutions than the SVM.

## 7.1. Maximum Margin Classifiers

We begin our discussion of support vector machines by returning to the two-class classification problem using linear models of the form

$$
y(\mathbf{x}) = \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}) + b\tag{7.1}
$$

where $\phi(\mathbf{x})$ denotes a fixed feature-space transformation, and we have made the bias parameter b explicit. Note that we shall shortly introduce a dual representation expressed in terms of kernel functions, which avoids having to work explicitly in feature space. The training data set comprises N input vectors $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ , with corresponding target values $t_{1}, \ldots, t_{N}$ where $t_{n} \in \{- 1, 1\}$ , and new data points are classified according to the sign of $y(\mathbf x)$

<sup>x</sup>We shall assume for the moment that the training data set is linearly separable in feature space, so that by definition there exists at least one choice of the parameters and b such that a function of the form (7.1) satisfies $y(\mathbf{x}_{n}) > 0$ for points having $t_{n} = + 1$ and $y(\mathbf{x}_{n}) < 0$ for points having $t_{n} = - 1$ <sup>x</sup>, so that $t_{n} y(\mathbf{x}_{n}) > 0$ for all training data points.

There may of course exist many such solutions that separate the classes exactly. In Section 4.1.7, we described the perceptron algorithm that is guaranteed to find a solution in a finite number of steps. The solution that it finds, however, will be dependent on the (arbitrary) initial values chosen for and $b$ as well as on the order in which the data points are presented. If there are multiple solutions all of which classify the training data set exactly, then we should try to find the one that will give the smallest generalization error. The support vector machine approaches this problem through the concept of the margin, which is defined to be the smallest distance between the decision boundary and any of the samples, as illustrated in Figure 7.1.

In support vector machines the decision boundary is chosen to be the one for which the margin is maximized. The maximum margin solution can be motivated using computational learning theory, also known as statistical learning theory. However, a simple insight into the origins of maximum margin has been given by Tong and Koller (2000) who consider a framework for classification based on a hybrid of generative and discriminative approaches. They first model the distribution over input vectors  for each class using a Parzen density estimator with Gaussian kernels having a common parameter $\sigma^{2}$ . Together with the class priors, this defines an optimal misclassification-rate decision boundary. However, instead of using this optimal boundary, they determine the best hyperplane by minimizing the probability of error relative to the learned density model. In the limit $\sigma^{2} \to 0$ , the optimal hyperplane is shown to be the one having maximum margin. The intuition behind this result is that as $\sigma^{2}$ is reduced, the hyperplane is increasingly dominated by nearby data points relative to more distant ones. In the limit, the hyperplane becomes independent of data points that are not support vectors.

![Figure 7.1](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/78668ef5bffcd88c190102bcf8d388175e48814b6dd571cddfc429d6620aa87d.jpg)  
Figure 7.1 The margin is defined as the perpendicular distance between the decision boundary and the closest of the data points, as shown on the left figure. Maximizing the margin leads to a particular choice of decision boundary, as shown on the right. The location of this boundary is determined by a subset of the data points, known as support vectors, which are indicated by the circles.

We shall see in Figure 10.13 that marginalization with respect to the prior distribution of the parameters in a Bayesian approach for a simple linearly separable data set leads to a decision boundary that lies in the middle of the region separating the data points. The large margin solution has similar behaviour.

Recall from Figure 4.1 that the perpendicular distance of a point  from a hyperplane defined by $y(\mathbf{x}) = 0$ where $y(\mathbf x)$ <sup>x</sup>takes the form (7.1) is given by $| y(\mathbf{x}) | / \| \mathbf{w} \|$ <sup>x x x w</sup>Furthermore, we are only interested in solutions for which all data points are correctly classified, so that $t_{n} y(\mathbf{x}_{n}) > 0$ for all n. Thus the distance of a point ${\bf x}_{n}$ to the decision surface is given by

$$
\frac{t_{n} y(\mathbf{x}_{n})}{\| \mathbf{w} \|} = \frac{t_{n}(\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) + b)}{\| \mathbf{w} \|}.\tag{7.2}
$$

The margin is given by the perpendicular distance to the closest point ${\bf x}_{n}$ from the <sup>x</sup>data set, and we wish to optimize the parameters and b in order to maximize this <sup>w</sup>distance. Thus the maximum margin solution is found by solving

$$
\arg \max_{\mathbf{w}, b} \left\{\frac{1}{\| \mathbf{w} \|} \min_{n} \left[t_{n} \left(\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x}_{n}) + b\right) \right] \right\}\tag{7.3}
$$

where we have taken the factor $1 / \| \mathbf{w} \|$ outside the optimization over n because does not depend on n. Direct solution of this optimization problem would be very complex, and so we shall convert it into an equivalent problem that is much easier to solve. To do this we note that if we make the rescaling $\mathbf{w} \to \kappa \mathbf{w}$ and $b \to \kappa b.$ then the distance from any point ${\bf x}_{n}$ <sup>w</sup>to the decision surface, given by $t_{n} y(\mathbf{x}_{n}) / \| \mathbf{w} \|$ is unchanged. We can use this freedom to set

$$
t_{n} \left(\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x}_{n}) + b\right) = 1\tag{7.4}
$$

for the point that is closest to the surface. In this case, all data points will satisfy the constraints

$$
t_{n} \left(\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) + b\right) \geqslant 1, \quad n = 1, \dots, N.\tag{7.5}
$$

This is known as the canonical representation of the decision hyperplane. In the case of data points for which the equality holds, the constraints are said to be active, whereas for the remainder they are said to be inactive. By definition, there will always be at least one active constraint, because there will always be a closest point, and once the margin has been maximized there will be at least two active constraints. The optimization problem then simply requires that we maximize $\lVert \mathbf{w} \rVert^{- 1}$ , which is equivalent to minimizing $\| \mathbf{w} \|^{2}$ , and so we have to solve the optimization problem

$$
\underset{\mathbf{w}, b}{\arg \min} \frac{1}{2} \| \mathbf{w} \|^{2}\tag{7.6}
$$

subject to the constraints given by (7.5). The factor of $1 / 2$ in (7.6) is included for later convenience. This is an example of a quadratic programming problem in which we are trying to minimize a quadratic function subject to a set of linear inequality constraints. It appears that the bias parameter b has disappeared from the optimization. However, it is determined implicitly via the constraints, because these require that changes to $\left\| \mathbf{w} \right\|$ be compensated by changes to b. We shall see how this works shortly.

In order to solve this constrained optimization problem, we introduce Lagrange multipliers $a_{n} \geqslant 0$ , with one multiplier $a_{n}$ for each of the constraints in (7.5), giving the Lagrangian function

$$
L(\mathbf{w}, b, \mathbf{a}) = \frac{1}{2} \| \mathbf{w} \|^{2} - \sum_{n = 1}^{N} a_{n} \left\{t_{n} \left(\mathbf{w}^{\mathrm{T}} \phi \left(\mathbf{x}_{n}\right) + b\right) - 1 \right\}\tag{7.7}
$$

where $\mathbf{a} =(a_{1}, \ldots, a_{N})^{\mathrm{T}}$ . Note the minus sign in front of the Lagrange multiplier term, because we are minimizing with respect to  and $b,$ and maximizing with respect to . Setting the derivatives of $L({\bf w}, b,{\bf a})$ <sup>w</sup>with respect to  and b equal to zero, we obtain the following two conditions

$$
\mathbf{w} = \sum_{n = 1}^{N} a_{n} t_{n} \phi(\mathbf{x}_{n})\tag{7.8}
$$

$$
0 = \sum_{n = 1}^{N} a_{n} t_{n}.\tag{7.9}
$$

Eliminating and b from $L({\bf w}, b,{\bf a})$ using these conditions then gives the dual representation of the maximum margin problem in which we maximize

$$
\widetilde{L}(\mathbf{a}) = \sum_{n = 1}^{N} a_{n} - \frac{1}{2} \sum_{n = 1}^{N} \sum_{m = 1}^{N} a_{n} a_{m} t_{n} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m})\tag{7.10}
$$

with respect to subject to the constraints

$$
a_{n} \geqslant 0, \quad n = 1, \dots, N,\tag{7.11}
$$

$$
\sum_{n = 1}^{N} a_{n} t_{n} = 0.\tag{7.12}
$$

Here the kernel function is defined by $k({\bf x},{\bf x}^{\prime}) = \phi({\bf x})^{\mathrm{T}} \phi({\bf x}^{\prime})$ . Again, this takes the form of a quadratic programming problem in which we optimize a quadratic function of  subject to a set of inequality constraints. We shall discuss techniques for solving <sup>a</sup>such quadratic programming problems in Section 7.1.1.

The solution to a quadratic programming problem in M variables in general has computational complexity that is $\mathcal{O}(M^{3})$ . In going to the dual formulation we have turned the original optimization problem, which involved minimizing (7.6) over M variables, into the dual problem (7.10), which has N variables. For a fixed set of basis functions whose number M is smaller than the number N of data points, the move to the dual problem appears disadvantageous. However, it allows the model to be reformulated using kernels, and so the maximum margin classifier can be applied efficiently to feature spaces whose dimensionality exceeds the number of data points, including infinite feature spaces. The kernel formulation also makes clear the role of the constraint that the kernel function $k(\mathbf{x}, \mathbf{x}^{\prime})$ be positive definite, because this ensures that the Lagrangian function $\widetilde L(\mathbf{a})$ is bounded below, giving rise to a welldefined optimization problem.

In order to classify new data points using the trained model, we evaluate the sign of $y(\mathbf x)$ defined by (7.1). This can be expressed in terms of the parameters $\left\{a_{n} \right\}$ and the kernel function by substituting for  using (7.8) to give

$$
y(\mathbf{x}) = \sum_{n = 1}^{N} a_{n} t_{n} k(\mathbf{x}, \mathbf{x}_{n}) + b.\tag{7.13}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/4d1afc460d33723c15e70a29e5a62dacd9b8d9472cc0bf987524766f1a11ebc5.jpg)

## Joseph-Louis Lagrange 1736–1813

Although widely considered to be a French mathematician, Lagrange was born in Turin in Italy. By the age of nineteen, he had already made important contributions mathematics and had been appointed as Pro-

fessor at the Royal Artillery School in Turin. For many years, Euler worked hard to persuade Lagrange to move to Berlin, which he eventually did in 1766 where he succeeded Euler as Director of Mathematics at the Berlin Academy. Later he moved to Paris, narrowly escaping with his life during the French revolution thanks to the personal intervention of Lavoisier (the French chemist who discovered oxygen) who himself was later executed at the guillotine. Lagrange made key contributions to the calculus of variations and the foundations of dynamics.

In Appendix E, we show that a constrained optimization of this form satisfies the Karush-Kuhn-Tucker (KKT) conditions, which in this case require that the following three properties hold

$$
a_{n} \geqslant 0\tag{7.14}
$$

$$
t_{n} y(\mathbf{x}_{n}) - 1 \geqslant 0\tag{7.15}
$$

$$
a_{n} \left\{t_{n} y(\mathbf{x}_{n}) - 1 \right\} = 0.\tag{7.16}
$$

Thus for every data point, either $a_{n} ~ = ~ 0$ or $t_{n} y(\mathbf{x}_{n}) ~ = ~ 1$ . Any data point for which $a_{n} = 0$ will not appear in the sum in (7.13) and hence plays no role in making predictions for new data points. The remaining data points are called support vectors, and because they satisfy $t_{n} y(\mathbf{x}_{n}) ~ = ~ 1$ , they correspond to points that lie on the maximum margin hyperplanes in feature space, as illustrated in Figure 7.1. This property is central to the practical applicability of support vector machines. Once the model is trained, a significant proportion of the data points can be discarded and only the support vectors retained.

Having solved the quadratic programming problem and found a value for , we <sup>a</sup>can then determine the value of the threshold parameter b by noting that any support vector ${\bf x}_{n}$ satisfies $t_{n} y(\mathbf x_{n}) = 1$ . Using (7.13) this gives

$$
t_{n} \left(\sum_{m \in \mathcal{S}} a_{m} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m}) + b\right) = 1\tag{7.17}
$$

where $s$ denotes the set of indices of the support vectors. Although we can solve this equation for b using an arbitrarily chosen support vector ${\bf x}_{n}$ , a numerically more stable solution is obtained by first multiplying through by $t_{n}$ , making use of $\dot{t}_{n}^{2} = 1$ and then averaging these equations over all support vectors and solving for b to give

$$
b = \frac{1}{N_{\mathcal{S}}} \sum_{n \in \mathcal{S}} \left(t_{n} - \sum_{m \in \mathcal{S}} a_{m} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m})\right)\tag{7.18}
$$

where $N_{S}$ is the total number of support vectors.

For later comparison with alternative models, we can express the maximummargin classifier in terms of the minimization of an error function, with a simple quadratic regularizer, in the form

$$
\sum_{n = 1}^{N} E_{\infty}(y(\mathbf{x}_{n}) t_{n} - 1) + \lambda \| \mathbf{w} \|^{2}\tag{7.19}
$$

where $E_{\infty}(z)$ is a function that is zero $\mathrm{if} \z \geqslant 0$ and $\infty$ otherwise and ensures that the constraints (7.5) are satisfied. Note that as long as the regularization parameter satisfies $\lambda > 0$ , its precise value plays no role.

Figure 7.2 shows an example of the classification resulting from training a support vector machine on a simple synthetic data set using a Gaussian kernel of the form (6.23). Although the data set is not linearly separable in the two-dimensional data space , it is linearly separable in the nonlinear feature space defined implicitly by the nonlinear kernel function. Thus the training data points are perfectly separated in the original data space.

Example of synthetic data from two classes in two dimensions showing contours of constant $y(\mathbf x)$ obtained from a support vector machine having a Gaussian kernel function. Also shown are the decision boundary, the margin boundaries, and the support vectors.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/86450acbda4b092fdefac9f219375854748944363b29f6acf20db87c8fe59eb5.jpg)

This example also provides a geometrical insight into the origin of sparsity in the SVM. The maximum margin hyperplane is defined by the location of the support vectors. Other data points can be moved around freely (so long as they remain outside the margin region) without changing the decision boundary, and so the solution will be independent of such data points.

## 7.1.1 Overlapping class distributions

So far, we have assumed that the training data points are linearly separable in the feature space $\phi(\mathbf{x})$ . The resulting support vector machine will give exact separation of the training data in the original input space , although the corresponding decision boundary will be nonlinear. In practice, however, the class-conditional distributions may overlap, in which case exact separation of the training data can lead to poor generalization.

We therefore need a way to modify the support vector machine so as to allow some of the training points to be misclassified. From (7.19) we see that in the case of separable classes, we implicitly used an error function that gave infinite error if a data point was misclassified and zero error if it was classified correctly, and then optimized the model parameters to maximize the margin. We now modify this approach so that data points are allowed to be on the ‘wrong side’ of the margin boundary, but with a penalty that increases with the distance from that boundary. For the subsequent optimization problem, it is convenient to make this penalty a linear function of this distance. To do this, we introduce slack variables, $\xi_{n} \geqslant 0$ where $n = 1, \ldots, N$ , with one slack variable for each training data point (Bennett, 1992; Cortes and Vapnik, 1995). These are defined by $\xi_{n} = 0$ for data points that are on or inside the correct margin boundary and $\xi_{n} = | t_{n} - y(\mathbf{x}_{n})$ for other points. Thus a data point that is on the decision boundary $y(\mathbf{x}_{n}) = 0$ will have $\xi_{n} = 1$ , and points

Figure 7.3 Illustration of the slack variables $\xi_{n} \geqslant 0$ Data points with circles around them are support vectors.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/bed1cbe36bcfcfb7d35373d3f979874d847247b3091602ff504823eace2574ab.jpg)

with $\xi_{n} > 1$ will be misclassified. The exact classification constraints (7.5) are then replaced with

$$
t_{n} y(\mathbf{x}_{n}) \geqslant 1 - \xi_{n}, \qquad n = 1, \ldots, N\tag{7.20}
$$

in which the slack variables are constrained to satisfy $\xi_{n} \geqslant 0$ . Data points for which $\xi_{n} = 0$ are correctly classified and are either on the margin or on the correct side of the margin. Points for which $0 < \xi_{n} \leqslant 1$ lie inside the margin, but on the correct side of the decision boundary, and those data points for which $\xi_{n} > 1$ lie on the wrong side of the decision boundary and are misclassified, as illustrated in Figure 7.3. This is sometimes described as relaxing the hard margin constraint to give a soft margin and allows some of the training set data points to be misclassified. Note that while slack variables allow for overlapping class distributions, this framework is still sensitive to outliers because the penalty for misclassification increases linearly with ξ.

Our goal is now to maximize the margin while softly penalizing points that lie on the wrong side of the margin boundary. We therefore minimize

$$
C \sum_{n = 1}^{N} \xi_{n} + \frac{1}{2} \| \mathbf{w} \|^{2}\tag{7.21}
$$

where the parameter $C > 0$ controls the trade-off between the slack variable penalty and the margin. Because any point that is misclassified has $\xi_{n} > 1$ , it follows that $\sum_{n} \xi_{n}$ is an upper bound on the number of misclassified points. The parameter C is therefore analogous to (the inverse of) a regularization coefficient because it controls the trade-off between minimizing training errors and controlling model complexity. In the limit $C \infty$ , we will recover the earlier support vector machine for separable data.

We now wish to minimize (7.21) subject to the constraints (7.20) together with $\xi_{n} \geqslant 0$ . The corresponding Lagrangian is given by

$$
L(\mathbf{w}, b, \mathbf{a}) = \frac{1}{2} \| \mathbf{w} \|^{2} + C \sum_{n = 1}^{N} \xi_{n} - \sum_{n = 1}^{N} a_{n} \left\{t_{n} y(\mathbf{x}_{n}) - 1 + \xi_{n} \right\} - \sum_{n = 1}^{N} \mu_{n} \xi_{n}\tag{7.22}
$$

Appendix E

where $\{a_{n} \geqslant 0\}$ and $\{\mu_{n} \geqslant 0\}$ are Lagrange multipliers. The corresponding set of KKT conditions are given by

$$
a_{n} \geqslant 0\tag{7.23}
$$

$$
t_{n} y(\mathbf{x}_{n}) - 1 + \xi_{n} \geqslant 0\tag{7.24}
$$

$$
a_{n}(t_{n} y(\mathbf{x}_{n}) - 1 + \xi_{n}) = 0\tag{7.25}
$$

$$
\mu_{n} \geqslant 0\tag{7.26}
$$

$$
\xi_{n} \geqslant 0\tag{7.27}
$$

$$
\mu_{n} \xi_{n} = 0\tag{7.28}
$$

where $n = 1, \ldots, N$

We now optimize out , b, and $\{\xi_{n}\}$ making use of the definition (7.1) of $y(\mathbf x)$ to give

$$
\frac{\partial L}{\partial \mathbf{w}} = 0 \Rightarrow \mathbf{w} = \sum_{n = 1}^{N} a_{n} t_{n} \phi(\mathbf{x}_{n})\tag{7.29}
$$

$$
{\frac{\partial L}{\partial b}} = 0 \Rightarrow \sum_{n = 1}^{N} a_{n} t_{n} = 0\tag{7.30}
$$

$$
\frac{\partial L}{\partial \xi_{n}} = 0 \Rightarrow a_{n} = C - \mu_{n}.\tag{7.31}
$$

Using these results to eliminate , b, and $\{\xi_{n}\}$ from the Lagrangian, we obtain the dual Lagrangian in the form

$$
\widetilde{L}(\mathbf{a}) = \sum_{n = 1}^{N} a_{n} - \frac{1}{2} \sum_{n = 1}^{N} \sum_{m = 1}^{N} a_{n} a_{m} t_{n} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m})\tag{7.32}
$$

which is identical to the separable case, except that the constraints are somewhat different. To see what these constraints are, we note that $a_{n} \geqslant 0$ is required because these are Lagrange multipliers. Furthermore, (7.31) together with $\mu_{n} \geqslant 0$ implies $a_{n} \leqslant C$ . We therefore have to minimize (7.32) with respect to the dual variables $\left\{a_{n} \right\}$ subject to

$$
0 \leqslant a_{n} \leqslant C
$$

$$
\sum_{n = 1}^{N} a_{n} t_{n} = 0\tag{7.33}
$$

(7.34)

for $n = 1, \ldots, N$ , where (7.33) are known as box constraints. This again represents a quadratic programming problem. If we substitute (7.29) into (7.1), we see that predictions for new data points are again made by using (7.13).

We can now interpret the resulting solution. As before, a subset of the data points may have $a_{n} ~ = ~ 0$ , in which case they do not contribute to the predictive model (7.13). The remaining data points constitute the support vectors. These have $a_{n} > 0$ and hence from (7.25) must satisfy

$$
t_{n} y(\mathbf{x}_{n}) = 1 - \xi_{n}.\tag{7.35}
$$

If $a_{n} < C$ , then (7.31) implies that $\mu_{n} > 0$ , which from (7.28) requires $\xi_{n} = 0$ and hence such points lie on the margin. Points with $a_{n} = C$ can lie inside the margin and can either be correctly classified if $\xi_{n} \leqslant 1$ or misclassified if $\xi_{n} > 1$

To determine the parameter $b$ in (7.1), we note that those support vectors for which $0 < a_{n} < C$ have $\xi_{n} = 0$ so that $t_{n} y(\mathbf x_{n}) = 1$ and hence will satisfy

$$
t_{n} \left(\sum_{m \in \mathcal{S}} a_{m} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m}) + b\right) = 1.\tag{7.36}
$$

Again, a numerically stable solution is obtained by averaging to give

$$
b = \frac{1}{N_{\mathcal{M}}} \sum_{n \in \mathcal{M}} \left(t_{n} - \sum_{m \in \mathcal{S}} a_{m} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m})\right)\tag{7.37}
$$

where denotes the set of indices of data points having $0 < a_{n} < C$

An alternative, equivalent formulation of the support vector machine, known as the $\nu{-} SVM,$ has been proposed by Scholkopf ¨ et al. (2000). This involves maximizing

$$
\widetilde{L}(\mathbf{a}) = - \frac{1}{2} \sum_{n = 1}^{N} \sum_{m = 1}^{N} a_{n} a_{m} t_{n} t_{m} k(\mathbf{x}_{n}, \mathbf{x}_{m})\tag{7.38}
$$

subject to the constraints

$$
0 \leqslant a_{n} \leqslant 1 / N\tag{7.39}
$$

$$
\sum_{n = 1}^{N} a_{n} t_{n} = 0\tag{7.40}
$$

$$
\sum_{n = 1}^{N} a_{n} \geqslant \nu.\tag{7.41}
$$

This approach has the advantage that the parameter $\nu,$ which replaces $C,$ can be interpreted as both an upper bound on the fraction of margin errors (points for which $\xi_{n} > 0$ and hence which lie on the wrong side of the margin boundary and which may or may not be misclassified) and a lower bound on the fraction of support vectors. An example of the ν-SVM applied to a synthetic data set is shown in Figure 7.4. Here Gaussian kernels of the form exp $(- \gamma \Vert \mathbf{x} - \mathbf{x}^{\prime} \Vert^{2})$ have been used, with $\gamma = 0.45$

Although predictions for new inputs are made using only the support vectors, the training phase (i.e., the determination of the parameters and b) makes use of <sup>a</sup>the whole data set, and so it is important to have efficient algorithms for solving the quadratic programming problem. We first note that the objective function $\widetilde L(\mathbf{a})$ given by (7.10) or (7.32) is quadratic and so any local optimum will also be a global optimum provided the constraints define a convex region (which they do as a consequence of being linear). Direct solution of the quadratic programming problem using traditional techniques is often infeasible due to the demanding computation and memory requirements, and so more practical approaches need to be found. The technique of chunking (Vapnik, 1982) exploits the fact that the value of the Lagrangian is unchanged if we remove the rows and columns of the kernel matrix corresponding to Lagrange multipliers that have value zero. This allows the full quadratic programming problem to be broken down into a series of smaller ones, whose goal is eventually to identify all of the nonzero Lagrange multipliers and discard the others. Chunking can be implemented using protected conjugate gradients (Burges, 1998). Although chunking reduces the size of the matrix in the quadratic function from the number of data points squared to approximately the number of nonzero Lagrange multipliers squared, even this may be too big to fit in memory for large-scale applications. Decomposition methods (Osuna et al., 1996) also solve a series of smaller quadratic programming problems but are designed so that each of these is of a fixed size, and so the technique can be applied to arbitrarily large data sets. However, it still involves numerical solution of quadratic programming subproblems and these can be problematic and expensive. One of the most popular approaches to training support vector machines is called sequential minimal optimization, or SMO (Platt, 1999). It takes the concept of chunking to the extreme limit and considers just two Lagrange multipliers at a time. In this case, the subproblem can be solved analytically, thereby avoiding numerical quadratic programming altogether. Heuristics are given for choosing the pair of Lagrange multipliers to be considered at each step. In practice, SMO is found to have a scaling with the number of data points that is somewhere between linear and quadratic depending on the particular application.

Figure 7.4 Illustration of the ν-SVM applied to a nonseparable data set in two dimensions. The support vectors are indicated by circles.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/bf94af3868fcaddb428dff045dfb3c82f6ea1a2de1ce2d3ec7c5c6dea1aaf4ad.jpg)

We have seen that kernel functions correspond to inner products in feature spaces that can have high, or even infinite, dimensionality. By working directly in terms of the kernel function, without introducing the feature space explicitly, it might therefore seem that support vector machines somehow manage to avoid the curse of dimensionality. This is not the case, however, because there are constraints amongst the feature values that restrict the effective dimensionality of feature space. To see this consider a simple second-order polynomial kernel that we can expand in terms of its components

$$
\begin{array}{rcl} k(\mathbf{x}, \mathbf{z}) & = & \left(1 + \mathbf{x}^{\mathrm{T}} \mathbf{z}\right)^{2} =(1 + x_{1} z_{1} + x_{2} z_{2})^{2} \\ & = & 1 + 2x_{1} z_{1} + 2x_{2} z_{2} + x_{1}^{2} z_{1}^{2} + 2x_{1} z_{1} x_{2} z_{2} + x_{2}^{2} z_{2}^{2} \\ & = &(1, \sqrt{2} x_{1}, \sqrt{2} x_{2}, x_{1}^{2}, \sqrt{2} x_{1} x_{2}, x_{2}^{2})(1, \sqrt{2} z_{1}, \sqrt{2} z_{2}, z_{1}^{2}, \sqrt{2} z_{1} z_{2}, z_{2}^{2})^{\mathrm{T}} \\ & = & \phi(\mathbf{x})^{\mathrm{T}} \phi(\mathbf{z}).\end{array} \tag{7.42}
$$

This kernel function therefore represents an inner product in a feature space having six dimensions, in which the mapping from input space to feature space is described by the vector function $\phi(\mathbf{x})$ . However, the coefficients weighting these different features are constrained to have specific forms. Thus any set of points in the original two-dimensional space would be constrained to lie exactly on a two-dimensional nonlinear manifold embedded in the six-dimensional feature space.

We have already highlighted the fact that the support vector machine does not provide probabilistic outputs but instead makes classification decisions for new input vectors. Veropoulos et al. (1999) discuss modifications to the SVM to allow the trade-off between false positive and false negative errors to be controlled. However, if we wish to use the SVM as a module in a larger probabilistic system, then probabilistic predictions of the class label t for new inputs are required.

<sup>x</sup>To address this issue, Platt (2000) has proposed fitting a logistic sigmoid to the outputs of a previously trained support vector machine. Specifically, the required conditional probability is assumed to be of the form

$$
p(t = 1 | \mathbf{x}) = \sigma \left(Ay(\mathbf{x}) + B\right)\tag{7.43}
$$

where $y(\mathbf x)$ is defined by (7.1). Values for the parameters A and B are found by minimizing the cross-entropy error function defined by a training set consisting of pairs of values $y(\mathbf{x}_{n})$ and $t_{n}$ . The data used to fit the sigmoid needs to be independent of that used to train the original SVM in order to avoid severe over-fitting. This twostage approach is equivalent to assuming that the output $y(\mathbf x)$ of the support vector machine represents the log-odds of  belonging to class $t = 1$ . Because the SVM training procedure is not specifically intended to encourage this, the SVM can give a poor approximation to the posterior probabilities (Tipping, 2001).

## 7.1.2 Relation to logistic regression

As with the separable case, we can re-cast the SVM for nonseparable distributions in terms of the minimization of a regularized error function. This will also allow us to highlight similarities, and differences, compared to the logistic regression model.

We have seen that for data points that are on the correct side of the margin boundary, and which therefore satisfy $y_{n} t_{n} \geqslant 1$ , we have $\xi_{n} ~ = ~ 0$ , and for the

5 Plot of the ‘hinge’ error function used in support vector machines, shown in blue, along with the error function for logistic regression, rescaled by a factor of $1 / \bar{\ln(2)}$ so that it passes through the point (0, 1), shown in red. Also shown are the misclassification error in black and the squared error in green.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/6aa961bcbbf5f23f4079b9f2c9aa28c6e9fdc23799a0ace0da7f8219e008d2ef.jpg)

remaining points we have $\xi_{n} = 1 - y_{n} t_{n}$ . Thus the objective function (7.21) can be written (up to an overall multiplicative constant) in the form

$$
\sum_{n = 1}^{N} E_{\mathrm{SV}}(y_{n} t_{n}) + \lambda \| \mathbf{w} \|^{2}\tag{7.44}
$$

where $\lambda =(2C)^{- 1}$ , and $E_{\mathrm{SV}}(\cdot)$ is the hinge error function defined by

$$
E_{\mathrm{SV}}(y_{n} t_{n}) =[1 - y_{n} t_{n}]_{+}\tag{7.45}
$$

where [  ]+ denotes the positive part. The hinge error function, so-called because of its shape, is plotted in Figure 7.5. It can be viewed as an approximation to the misclassification error, i.e., the error function that ideally we would like to minimize, which is also shown in Figure 7.5.

When we considered the logistic regression model in Section 4.3.2, we found it convenient to work with target variable $t \in \{0, 1\}$ . For comparison with the support vector machine, we first reformulate maximum likelihood logistic regression using the target variable $t \in \{- 1, 1\}$ . To do this, we note that $p(t = 1 | y) = \sigma(y)$ where $y(\mathbf x)$ is given by (7.1), and $\sigma(y)$ is the logistic sigmoid function defined by (4.59). It follows that $p(t = - 1 | y) = 1 - \sigma(y) = \sigma(- y)$ , where we have used the properties of the logistic sigmoid function, and so we can write

$$
p(t | y) = \sigma(yt).\tag{7.46}
$$

From this we can construct an error function by taking the negative logarithm of the likelihood function that, with a quadratic regularizer, takes the form

Exercise 7.6

$$
\sum_{n = 1}^{N} E_{\mathrm{LR}}(y_{n} t_{n}) + \lambda \| \mathbf{w} \|^{2}.\tag{7.47}
$$

where

$$
E_{\mathrm{LR}}(yt) = \ln \left(1 + \exp(- yt)\right).\tag{7.48}
$$

For comparison with other error functions, we can divide by ln(2) so that the error function passes through the point (0, 1). This rescaled error function is also plotted in Figure 7.5 and we see that it has a similar form to the support vector error function. The key difference is that the flat region in $E_{\mathrm{SV}}(yt)$ leads to sparse solutions.

Both the logistic error and the hinge loss can be viewed as continuous approximations to the misclassification error. Another continuous error function that has sometimes been used to solve classification problems is the squared error, which is again plotted in Figure 7.5. It has the property, however, of placing increasing emphasis on data points that are correctly classified but that are a long way from the decision boundary on the correct side. Such points will be strongly weighted at the expense of misclassified points, and so if the objective is to minimize the misclassification rate, then a monotonically decreasing error function would be a better choice.

## 7.1.3 Multiclass SVMs

The support vector machine is fundamentally a two-class classifier. In practice, however, we often have to tackle problems involving $K > 2$ classes. Various methods have therefore been proposed for combining multiple two-class SVMs in order to build a multiclass classifier.

One commonly used approach (Vapnik, 1998) is to construct K separate SVMs, in which the $k^{\mathrm{th}}$ model $y_{k}(\mathbf{x})$ is trained using the data from class $\mathcal{C}_{k}$ as the positive examples and the data from the remaining $K - 1$ classes as the negative examples. This is known as the one-versus-the-rest approach. However, in Figure 4.2 we saw that using the decisions of the individual classifiers can lead to inconsistent results in which an input is assigned to multiple classes simultaneously. This problem is sometimes addressed by making predictions for new inputs  using

$$
y(\mathbf{x}) = \max_{k} y_{k}(\mathbf{x}).\tag{7.49}
$$

Unfortunately, this heuristic approach suffers from the problem that the different classifiers were trained on different tasks, and there is no guarantee that the realvalued quantities $y_{k}({\bf x})$ for different classifiers will have appropriate scales.

<sup>x</sup>Another problem with the one-versus-the-rest approach is that the training sets are imbalanced. For instance, if we have ten classes each with equal numbers of training data points, then the individual classifiers are trained on data sets comprising 90% negative examples and only 10% positive examples, and the symmetry of the original problem is lost. A variant of the one-versus-the-rest scheme was proposed by Lee et al. (2001) who modify the target values so that the positive class has target +1 and the negative class has target $- 1 /(K - 1)$

Weston and Watkins (1999) define a single objective function for training all K SVMs simultaneously, based on maximizing the margin from each to remaining classes. However, this can result in much slower training because, instead of solving K separate optimization problems each over N data points with an overall cost of $O(K{\bar{N}}^{2})$ , a single optimization problem of size $(K - \bar{1}) N$ must be solved giving an overall cost of ${\bar{O}}(K^{\bar{2}} N^{2})$ .

Another approach is to train $K(K - 1) / 2$ different 2-class SVMs on all possible pairs of classes, and then to classify test points according to which class has the highest number of ‘votes’, an approach that is sometimes called one-versus-one. Again, we saw in Figure 4.2 that this can lead to ambiguities in the resulting classification. Also, for large K this approach requires significantly more training time than the one-versus-the-rest approach. Similarly, to evaluate test points, significantly more computation is required.

The latter problem can be alleviated by organizing the pairwise classifiers into a directed acyclic graph (not to be confused with a probabilistic graphical model) leading to the DAGSVM (Platt et al., 2000). For K classes, the DAGSVM has a total of $K(K - 1) / 2$ classifiers, and to classify a new test point only $K - 1$ pairwise classifiers need to be evaluated, with the particular classifiers used depending on which path through the graph is traversed.

A different approach to multiclass classification, based on error-correcting output codes, was developed by Dietterich and Bakiri (1995) and applied to support vector machines by Allwein et al. (2000). This can be viewed as a generalization of the voting scheme of the one-versus-one approach in which more general partitions of the classes are used to train the individual classifiers. The K classes themselves are represented as particular sets of responses from the two-class classifiers chosen, and together with a suitable decoding scheme, this gives robustness to errors and to ambiguity in the outputs of the individual classifiers. Although the application of SVMs to multiclass classification problems remains an open issue, in practice the one-versus-the-rest approach is the most widely used in spite of its ad-hoc formulation and its practical limitations.

There are also single-class support vector machines, which solve an unsupervised learning problem related to probability density estimation. Instead of modelling the density of data, however, these methods aim to find a smooth boundary enclosing a region of high density. The boundary is chosen to represent a quantile of the density, that is, the probability that a data point drawn from the distribution will land inside that region is given by a fixed number between 0 and 1 that is specified in advance. This is a more restricted problem than estimating the full density but may be sufficient in specific applications. Two approaches to this problem using support vector machines have been proposed. The algorithm of Scholkopf¨ et al. (2001) tries to find a hyperplane that separates all but a fixed fraction ν of the training data from the origin while at the same time maximizing the distance (margin) of the hyperplane from the origin, while Tax and Duin (1999) look for the smallest sphere in feature space that contains all but a fraction ν of the data points. For kernels $k(\mathbf{x}, \mathbf{x}^{\prime})$ that are functions only of $\mathbf{x} - \mathbf{x}^{\prime}$ , the two algorithms are equivalent.

## 7.1.4 SVMs for regression

We now extend support vector machines to regression problems while at the same time preserving the property of sparseness. In simple linear regression, we

Figure 7.6

Plot of an $\epsilon$-insensitive error function (in red) in which the error increases linearly with distance beyond the insensitive region. Also shown for comparison is the quadratic error function (in green).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/f018a66ccffc4b37e20520c6c1df38920c1186e67ffcb5169b230f0a6cf69c1a.jpg)

minimize a regularized error function given by

$$
\frac{1}{2} \sum_{n = 1}^{N} \left\{y_{n} - t_{n} \right\}^{2} + \frac{\lambda}{2} \| \mathbf{w} \|^{2}.\tag{7.50}
$$

To obtain sparse solutions, the quadratic error function is replaced by an $\epsilon$-insensitive error function (Vapnik, 1995), which gives zero error if the absolute difference between the prediction $y(\mathbf x)$ and the target t is less than $\epsilon$ where $\epsilon > 0$ . A simple example of an $\epsilon$-insensitive error function, having a linear cost associated with errors outside the insensitive region, is given by

$$
E_{\epsilon}(y(\mathbf{x}) - t) = \left\{\begin{array}{ll} 0, & \text{if} | y(\mathbf{x}) - t | < \epsilon; \\ | y(\mathbf{x}) - t | - \epsilon, & \text{otherwise} \end{array} \right.\tag{7.51}
$$

and is illustrated in Figure 7.6.

We therefore minimize a regularized error function given by

$$
C \sum_{n = 1}^{N} E_{\epsilon}(y(\mathbf{x}_{n}) - t_{n}) + \frac{1}{2} \| \mathbf{w} \|^{2}\tag{7.52}
$$

where $y(\mathbf x)$ is given by (7.1). By convention the (inverse) regularization parameter, <sup>x</sup>denoted C, appears in front of the error term.

As before, we can re-express the optimization problem by introducing slack variables. For each data point ${\bf x}_{n}$ , we now need two slack variables $\xi_{n} \geqslant 0$ and $\widehat{\xi}_{n} \geqslant 0$ , where $\xi_{n} > 0$ corresponds to a point for which $t_{n} > y(\mathbf x_{n}) + \epsilon.$ , and $\widehat{\xi}_{n} > 0$ corresponds to a point for which $t_{n} < y(\mathbf x_{n}) - \epsilon.$ , as illustrated in Figure 7.7.

<sup>x</sup>The condition for a target point to lie inside the $\epsilon$-tube is that $y_{n} - \epsilon \leqslant t_{n} \leqslant$ $y_{n} + \epsilon$ , where $y_{n} = y(\mathbf{x}_{n})$ . Introducing the slack variables allows points to lie outside <sup>x</sup>the tube provided the slack variables are nonzero, and the corresponding conditions are

$$
{t_{n}} \leqslant{y(\mathbf{x}_{n}) + \epsilon + \xi_{n}}\tag{7.53}
$$

$$
{t_{n}} \geqslant{y(\mathbf{x}_{n}) - \epsilon - \widehat{\xi}_{n}.}\tag{7.54}
$$

igure 7.7 Illustration of SVM regression, showing the regression curve together with the $\epsilon \cdot$ insensitive ‘tube’. Also shown are examples of the slack variables $\xi$ and ${\widehat{\xi}}.$ Points above the $\epsilon$-tube have $\xi > 0$ and ${\widehat{\xi}} = 0,$ points below the $\epsilon$-tube have $\xi ~ = ~ 0$ and $\widehat{\xi} > 0$ , and points inside the $\epsilon$-tube have $\xi = \widehat{\xi} = 0$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/6299fc20ed163508cf045fd69027e7c08a8a93ae9ee85ac84e540b9fc9f43778.jpg)

The error function for support vector regression can then be written as

$$
C \sum_{n = 1}^{N}(\xi_{n} + \widehat{\xi}_{n}) + \frac{1}{2} \| \mathbf{w} \|^{2}\tag{7.55}
$$

which must be minimized subject to the constraints $\xi_{n} \geqslant 0$ and $\widehat{\xi}_{n} \geqslant 0$ as well as (7.53) and (7.54). This can be achieved by introducing Lagrange multipliers $a_{n} \geqslant 0$ $\widehat{a}_{n} \geqslant 0, \mu_{n} \geqslant 0$ , and $\widehat{\mu}_{n} \geqslant 0$ and optimizing the Lagrangian

$$
\begin{array}{rcl} L & = & C \sum_{n = 1}^{N}(\xi_{n} + \widehat{\xi}_{n}) + \frac{1}{2} \| \mathbf{w} \|^{2} - \sum_{n = 1}^{N}(\mu_{n} \xi_{n} + \widehat{\mu}_{n} \widehat{\xi}_{n}) \\ & & - \sum_{n = 1}^{N} a_{n}(\epsilon + \xi_{n} + y_{n} - t_{n}) - \sum_{n = 1}^{N} \widehat{a}_{n}(\epsilon + \widehat{\xi}_{n} - y_{n} + t_{n}).\end{array}\tag{7.56}
$$

We now substitute for $y(\mathbf x)$ using (7.1) and then set the derivatives of the Lagrangian with respect to $\mathbf{w}, b, \xi_{n}$ , and $\widehat{\xi}_{n}$ to zero, giving

$$
\frac{\partial L}{\partial \mathbf{w}} = 0 \Rightarrow \mathbf{w} = \sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) \phi(\mathbf{x}_{n})\tag{7.57}
$$

$$
\frac{\partial L}{\partial b} = 0 \Rightarrow \sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) = 0\tag{7.58}
$$

$$
\frac{\partial L}{\partial \xi_{n}} = 0 \Rightarrow a_{n} + \mu_{n} = C\tag{7.59}
$$

$$
\frac{\partial L}{\partial \widehat{\xi}_{n}} = 0 \Rightarrow \widehat{a}_{n} + \widehat{\mu}_{n} = C.\tag{7.60}
$$

Exercise 7.7

Using these results to eliminate the corresponding variables from the Lagrangian, we see that the dual problem involves maximizing

$$
\begin{array}{rcl} \widetilde{L}(\mathbf{a}, \widehat{\mathbf{a}}) & = & - \frac{1}{2} \sum_{n = 1}^{N} \sum_{m = 1}^{N}(a_{n} - \widehat{a}_{n})(a_{m} - \widehat{a}_{m}) k(\mathbf{x}_{n}, \mathbf{x}_{m}) \\ & & - \epsilon \sum_{n = 1}^{N}(a_{n} + \widehat{a}_{n}) + \sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) t_{n} \end{array}\tag{7.61}
$$

with respect to $\left\{a_{n} \right\}$ and $\{\widehat{a}_{n}\}$ , where we have introduced the kernel $k(\mathbf{x}, \mathbf{x}^{\prime}) =$ $\phi(\mathbf{x})^{\mathrm{T}} \phi(\mathbf{x}^{\prime})$ <sup>x x</sup>. Again, this is a constrained maximization, and to find the constraints <sup>x x</sup>we note that $a_{n} \geqslant 0$ and $\widehat{a}_{n} \geqslant 0$ are both required because these are Lagrange multipliers. Also $\mu_{n} \geqslant 0$ and $\widehat{\mu}_{n} \geqslant 0$ together with (7.59) and (7.60), require $a_{n} \leqslant C$ and $\widehat{a}_{n} \leqslant C$ , and so again we have the box constraints

$$
0 \leqslant a_{n} \leqslant C\tag{7.62}
$$

$$
0 \leqslant \widehat{a}_{n} \leqslant C\tag{7.63}
$$

together with the condition (7.58).

Substituting (7.57) into (7.1), we see that predictions for new inputs can be made using

$$
y(\mathbf{x}) = \sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) k(\mathbf{x}, \mathbf{x}_{n}) + b\tag{7.64}
$$

which is again expressed in terms of the kernel function.

The corresponding Karush-Kuhn-Tucker (KKT) conditions, which state that at the solution the product of the dual variables and the constraints must vanish, are given by

$$
a_{n}(\epsilon + \xi_{n} + y_{n} - t_{n}) = 0\tag{7.65}
$$

$$
\widehat{a}_{n}(\epsilon + \widehat{\xi}_{n} - y_{n} + t_{n}) = 0\tag{7.66}
$$

$$
(C - a_{n}) \xi_{n} = 0\tag{7.67}
$$

$$
(C - \widehat{a}_{n}) \widehat{\xi}_{n} = 0.\tag{7.68}
$$

From these we can obtain several useful results. First of all, we note that a coefficient $a_{n}$ can only be nonzero if $\epsilon + \xi_{n} + y_{n} - t_{n} = 0$ , which implies that the data point either lies on the upper boundary of the $\epsilon$-tube $(\xi_{n} ~ = ~ 0)$ or lies above the upper boundary $(\xi_{n} > 0)$ . Similarly, a nonzero value for $\widehat{a}_{n}$ implies $\epsilon + \widehat{\xi}_{n} - y_{n} + t_{n} = 0$ and such points must lie either on or below the lower boundary of the $\epsilon$-tube.

Furthermore, the two constraints $\epsilon + \xi_{n} + y_{n} - t_{n} = 0$ and $\epsilon + \widehat{\xi}_{n} - y_{n} + t_{n} = 0$ are incompatible, as is easily seen by adding them together and noting that $\xi_{n}$ and $\widehat{\xi}_{n}$ are nonnegative while $\epsilon$ is strictly positive, and so for every data point $\mathbf{x}_{n}.$ , either $a_{n}$ or $\widehat{a}_{n}$ (or both) must be zero.

The support vectors are those data points that contribute to predictions given by (7.64), in other words those for which either $a_{n} \neq 0$ or $\widehat{a}_{n} \neq 0$ . These are points that lie on the boundary of the $\epsilon$-tube or outside the tube. All points within the tube have $a_{n} ={\widehat{a}}_{n} = 0$ . We again have a sparse solution, and the only terms that have to be evaluated in the predictive model (7.64) are those that involve the support vectors.

The parameter b can be found by considering a data point for which $0 < a_{n} <$ C, which from (7.67) must have $\xi_{n} ~ = ~ 0$ , and from (7.65) must therefore satisfy $\epsilon + y_{n} - t_{n} = 0$ . Using (7.1) and solving for $b,$ we obtain

$$
\begin{array}{rcl}{b} &{=} &{t_{n} - \epsilon -{\bf w}^{\mathrm{T}} \phi({\bf x}_{n})} \\ &{=} &{t_{n} - \epsilon - \sum_{m = 1}^{N}(a_{m} - \widehat{a}_{m}) k({\bf x}_{n},{\bf x}_{m})} \end{array}\tag{7.69}
$$

where we have used (7.57). We can obtain an analogous result by considering a point for which $0 < \widehat{a}_{n} < C$ . In practice, it is better to average over all such estimates of b.

As with the classification case, there is an alternative formulation of the SVM for regression in which the parameter governing complexity has a more intuitive interpretation (Scholkopf¨ et al., 2000). In particular, instead of fixing the width $\epsilon$ of the insensitive region, we fix instead a parameter ν that bounds the fraction of points lying outside the tube. This involves maximizing

$$
\begin{array}{rcl} \widetilde{L}(\mathbf{a}, \widehat{\mathbf{a}}) & = & - \frac{1}{2} \sum_{n = 1}^{N} \sum_{m = 1}^{N}(a_{n} - \widehat{a}_{n})(a_{m} - \widehat{a}_{m}) k(\mathbf{x}_{n}, \mathbf{x}_{m}) \\ & & + \sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) t_{n} \end{array}\tag{7.70}
$$

subject to the constraints

$$
0 \leqslant a_{n} \leqslant C / N\tag{7.71}
$$

$$
0 \leqslant \widehat{a}_{n} \leqslant C / N
$$

$$
\sum_{n = 1}^{N}(a_{n} - \widehat{a}_{n}) = 0\tag{7.72}
$$

(7.73)

$$
\sum_{n = 1}^{N}(a_{n} + \widehat{a}_{n}) \leqslant \nu C.\tag{7.74}
$$

It can be shown that there are at most $\nu N$ data points falling outside the insensitive tube, while at least $\nu N$ data points are support vectors and so lie either on the tube or outside it.

The use of a support vector machine to solve a regression problem is illustrated using the sinusoidal data set in Figure 7.8. Here the parameters ν and C have been chosen by hand. In practice, their values would typically be determined by crossvalidation.

Figure 7.8 Illustration of the $\nu{\mathrm{-}} \mathsf{SVM}$ for regression applied to the sinusoidal synthetic data set using Gaussian kernels. The predicted regression curve is shown by the red line, and the $\epsilon$-insensitive tube corresponds to the shaded region. Also, the data points are shown in green, and those with support vectors are indicated by blue circles.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/5163e79532254838bfc84455ea10f27020ec619f741cd968d55047d140c9cf91.jpg)

## 7.1.5 Computational learning theory

Historically, support vector machines have largely been motivated and analysed using a theoretical framework known as computational learning theory, also sometimes called statistical learning theory (Anthony and Biggs, 1992; Kearns and Vazirani, 1994; Vapnik, 1995; Vapnik, 1998). This has its origins with Valiant (1984) who formulated the probably approximately correct, or PAC, learning framework. The goal of the PAC framework is to understand how large a data set needs to be in order to give good generalization. It also gives bounds for the computational cost of learning, although we do not consider these here.

Suppose that a data set of size N is drawn from some joint distribution $p(\mathbf{x}, \mathbf{t})$ <sup>x t</sup>where is the input variable and represents the class label, and that we restrict attention to ‘noise free’ situations in which the class labels are determined by some (unknown) deterministic function $\mathbf{t} = \mathbf{g}(\mathbf{x})$ . In PAC learning we say that a function $\mathbf{f} \left(\mathbf{x}; \mathcal{D} \right)$ , drawn from a space $\mathcal{F}$ <sup>t g x</sup>of such functions on the basis of the training set $\mathcal{D}$ , has good generalization if its expected error rate is below some pre-specified threshold $\epsilon$, so that

$$
\mathbb{E}_{\mathbf{x}, \mathbf{t}} \left[I \left(\mathbf{f}(\mathbf{x}; \mathcal{D}) \neq \mathbf{t}\right) \right] < \epsilon\tag{7.75}
$$

where $I(\cdot)$ is the indicator function, and the expectation is with respect to the distribution $p(\mathbf{x}, \mathbf{t})$ . The quantity on the left-hand side is a random variable, because <sup>x t</sup>it depends on the training set , and the PAC framework requires that (7.75) holds, with probability greater than $1 - \delta$ , for a data set drawn randomly from $p(\mathbf{x}, \mathbf{t})$ Here $\delta$ <sup>x t</sup>is another pre-specified parameter, and the terminology ‘probably approximately correct’ comes from the requirement that with high probability (greater than $1 - \delta)$ , the error rate be small (less than $\epsilon$). For a given choice of model space $\mathcal{F}$ , and for given parameters $\epsilon$ and δ, PAC learning aims to provide bounds on the minimum size N of data set needed to meet this criterion. A key quantity in PAC learning is the Vapnik-Chervonenkis dimension, or VC dimension, which provides a measure of the complexity of a space of functions, and which allows the PAC framework to be extended to spaces containing an infinite number of functions.

The bounds derived within the PAC framework are often described as worstcase, because they apply to any choice for the distribution $p(\mathbf{x}, \mathbf{t})$ , so long as both the training and the test examples are drawn (independently) from the same distribution, and for $any$ choice for the function $\mathbf{f} \left(\mathbf{x} \right)$ so long as it belongs to $\mathcal{F}$ . In real-world <sup>f x</sup>applications of machine learning, we deal with distributions that have significant regularity, for example in which large regions of input space carry the same class label. As a consequence of the lack of any assumptions about the form of the distribution, the PAC bounds are very conservative, in other words they strongly over-estimate the size of data sets required to achieve a given generalization performance. For this reason, PAC bounds have found few, if any, practical applications.

One attempt to improve the tightness of the PAC bounds is the PAC-Bayesian framework (McAllester, 2003), which considers a distribution over the space $\mathcal{F}$ of functions, somewhat analogous to the prior in a Bayesian treatment. This still considers any possible choice for $p(\mathbf{x}, \mathbf{t})$ , and so although the bounds are tighter, they are still very conservative.

## 7.2. Relevance Vector Machines

Support vector machines have been used in a variety of classification and regression applications. Nevertheless, they suffer from a number of limitations, several of which have been highlighted already in this chapter. In particular, the outputs of an SVM represent decisions rather than posterior probabilities. Also, the SVM was originally formulated for two classes, and the extension to $K > 2$ classes is problematic. There is a complexity parameter $C,$ or ν (as well as a parameter $\epsilon$ in the case of regression), that must be found using a hold-out method such as cross-validation. Finally, predictions are expressed as linear combinations of kernel functions that are centred on training data points and that are required to be positive definite.

The relevance vector machine or RVM (Tipping, 2001) is a Bayesian sparse kernel technique for regression and classification that shares many of the characteristics of the SVM whilst avoiding its principal limitations. Additionally, it typically leads to much sparser models resulting in correspondingly faster performance on test data whilst maintaining comparable generalization error.

In contrast to the SVM we shall find it more convenient to introduce the regression form of the RVM first and then consider the extension to classification tasks.

## 7.2.1 RVM for regression

The relevance vector machine for regression is a linear model of the form studied in Chapter 3 but with a modified prior that results in sparse solutions. The model defines a conditional distribution for a real-valued target variable t, given an input vector , which takes the form

$$
p(t | \mathbf{x}, \mathbf{w}, \beta) = \mathcal{N}(t | y(\mathbf{x}), \beta^{- 1})\tag{7.76}
$$

where $\beta = \sigma^{- 2}$ is the noise precision (inverse noise variance), and the mean is given by a linear model of the form

$$
y(\mathbf{x}) = \sum_{i = 1}^{M} w_{i} \phi_{i}(\mathbf{x}) = \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x})\tag{7.77}
$$

with fixed nonlinear basis functions $\phi_{i}(\mathbf{x})$ , which will typically include a constant term so that the corresponding weight parameter represents a ‘bias’.

The relevance vector machine is a specific instance of this model, which is intended to mirror the structure of the support vector machine. In particular, the basis functions are given by kernels, with one kernel associated with each of the data points from the training set. The general expression (7.77) then takes the SVM-like form

$$
y(\mathbf{x}) = \sum_{n = 1}^{N} w_{n} k(\mathbf{x}, \mathbf{x}_{n}) + b\tag{7.78}
$$

where b is a bias parameter. The number of parameters in this case is $M = N + 1$ and $y(\mathbf x)$ has the same form as the predictive model (7.64) for the SVM, except that <sup>x</sup>the coefficients $a_{n}$ are here denoted $w_{n}$ . It should be emphasized that the subsequent analysis is valid for arbitrary choices of basis function, and for generality we shall work with the form (7.77). In contrast to the SVM, there is no restriction to positivedefinite kernels, nor are the basis functions tied in either number or location to the training data points.

Suppose we are given a set of N observations of the input vector , which we denote collectively by a data matrix whose $n^{\mathrm{th}}$ row is ${\bf x}_{n}^{\mathrm{T}}$ with $n = 1, \ldots, N$ . The <sup>X</sup>corresponding target values are given by ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ . Thus, the likelihood function is given by

$$
p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \beta) = \prod_{n = 1}^{N} p(t_{n} | \mathbf{x}_{n}, \mathbf{w}, \beta^{- 1}).\tag{7.79}
$$

Next we introduce a prior distribution over the parameter vector and as in <sup>w</sup>Chapter 3, we shall consider a zero-mean Gaussian prior. However, the key difference in the RVM is that we introduce a separate hyperparameter $\alpha_{i}$ for each of the weight parameters $w_{i}$ instead of a single shared hyperparameter. Thus the weight prior takes the form

$$
p(\mathbf{w} | \boldsymbol{\alpha}) = \prod_{i = 1}^{M} \mathcal{N}(w_{i} | 0, \alpha_{i}^{- 1})\tag{7.80}
$$

where $\alpha_{i}$ represents the precision of the corresponding parameter $w_{i}$ , and α denotes $(\alpha_{1}, \ldots, \bar{\alpha_{M}})^{\mathrm{T}}$ . We shall see that, when we maximize the evidence with respect to these hyperparameters, a significant proportion of them go to infinity, and the corresponding weight parameters have posterior distributions that are concentrated at zero. The basis functions associated with these parameters therefore play no role in the predictions made by the model and so are effectively pruned out, resulting in a sparse model.

Using the result (3.49) for linear regression models, we see that the posterior distribution for the weights is again Gaussian and takes the form

$$
p(\mathbf{w} | \mathbf{t}, \mathbf{X}, \boldsymbol{\alpha}, \beta) = \mathcal{N}(\mathbf{w} | \mathbf{m}, \boldsymbol{\Sigma})\tag{7.81}
$$

where the mean and covariance are given by

$$
\mathbf{m} = \beta \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t}\tag{7.82}
$$

$$
\boldsymbol{\Sigma} = \left(\mathbf{A} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\right)^{- 1}\tag{7.83}
$$

where is the $N \times M$ design matrix with elements $\Phi_{ni} ~ = ~ \phi_{i}(\mathbf{x}_{n})$ , and ${\textbf{A}} =$ $\operatorname{diag}(\alpha_{i})$ <sup>x</sup>. Note that in the specific case of the model (7.78), we have ${\mathbf{\Gamma}} ={\mathbf{K}}$ <sup>A</sup>, where is the symmetric $(N + 1) \times(N + 1)$ kernel matrix with elements $k(\mathbf{x}_{n}, \mathbf{x}_{m})$

The values of $\alpha$ and $\beta$ <sup>x x</sup>are determined using type-2 maximum likelihood, also known as the evidence approximation, in which we maximize the marginal likelihood function obtained by integrating out the weight parameters

$$
p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) = \int p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \beta) p(\mathbf{w} | \boldsymbol{\alpha}) d \mathbf{w}.\tag{7.84}
$$

Because this represents the convolution of two Gaussians, it is readily evaluated to give the log marginal likelihood in the form

$$
\begin{array}{rcl} \ln p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) & = & \ln \mathcal{N}(\mathbf{t} | \mathbf{0}, \mathbf{C}) \\ & = & - \frac{1}{2} \left\{N \ln(2 \pi) + \ln | \mathbf{C} | + \mathbf{t}^{\mathrm{T}} \mathbf{C}^{- 1} \mathbf{t} \right\} \end{array}\tag{7.85}
$$

where ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ , and we have defined the $N \times N$ matrix  given by

$$
\mathbf{C} = \beta^{- 1} \mathbf{I} + \boldsymbol{\Phi} \mathbf{A}^{- 1} \boldsymbol{\Phi}^{\mathrm{T}}.\tag{7.86}
$$

Our goal is now to maximize (7.85) with respect to the hyperparameters α and $\beta.$ This requires only a small modification to the results obtained in Section 3.5 for the evidence approximation in the linear regression model. Again, we can identify two approaches. In the first, we simply set the required derivatives of the marginal likelihood to zero and obtain the following re-estimation equations

$$
\alpha_{i}^{\mathrm{new}} = \frac{\gamma_{i}}{m_{i}^{2}}\tag{7.87}
$$

$$
(\beta^{\mathrm{new}})^{- 1} = \frac{\| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m} \|^{2}}{N - \sum_{i} \gamma_{i}}\tag{7.88}
$$

where $m_{i}$ is the $i^{\mathrm{th}}$ component of the posterior mean  defined by (7.82). The quantity $\gamma_{i}$ measures how well the corresponding parameter $w_{i}$ is determined by the data and is defined by

$$
\gamma_{i} = 1 - \alpha_{i} \Sigma_{ii}\tag{7.89}
$$

in which $\Sigma_{ii}$ is the $i^{\mathrm{th}}$ diagonal component of the posterior covariance given by <sup>Σ</sup>(7.83). Learning therefore proceeds by choosing initial values for α and $\beta,$ evaluating the mean and covariance of the posterior using (7.82) and (7.83), respectively, and then alternately re-estimating the hyperparameters, using (7.87) and (7.88), and re-estimating the posterior mean and covariance, using (7.82) and (7.83), until a suitable convergence criterion is satisfied.

The second approach is to use the EM algorithm, and is discussed in Section 9.3.4. These two approaches to finding the values of the hyperparameters that maximize the evidence are formally equivalent. Numerically, however, it is found that the direct optimization approach corresponding to (7.87) and (7.88) gives somewhat faster convergence (Tipping, 2001).

As a result of the optimization, we find that a proportion of the hyperparameters $\left\{\alpha_{i} \right\}$ are driven to large (in principle infinite) values, and so the weight parameters $w_{i}$ corresponding to these hyperparameters have posterior distributions with mean and variance both zero. Thus those parameters, and the corresponding basis functions $\phi_{i}(\mathbf{x})$ , are removed from the model and play no role in making predictions for <sup>x</sup>new inputs. In the case of models of the form (7.78), the inputs ${\bf x}_{n}$ corresponding to the remaining nonzero weights are called relevance vectors, because they are identified through the mechanism of automatic relevance determination, and are analogous to the support vectors of an SVM. It is worth emphasizing, however, that this mechanism for achieving sparsity in probabilistic models through automatic relevance determination is quite general and can be applied to any model expressed as an adaptive linear combination of basis functions.

Having found values $\alpha^{\star}$ and $\beta^{\star}$ for the hyperparameters that maximize the marginal likelihood, we can evaluate the predictive distribution over t for a new input . Using (7.76) and (7.81), this is given by

$$
\begin{array}{rcl} p(t | \mathbf{x}, \mathbf{X}, \mathbf{t}, \boldsymbol{\alpha}^{\star}, \beta^{\star}) & = & \int p(t | \mathbf{x}, \mathbf{w}, \beta^{\star}) p(\mathbf{w} | \mathbf{X}, \mathbf{t}, \boldsymbol{\alpha}^{\star}, \beta^{\star}) d \mathbf{w} \\ & = & \mathcal{N} \left(t | \mathbf{m}^{\mathrm{T}} \phi(\mathbf{x}), \sigma^{2}(\mathbf{x})\right).\end{array}\tag{7.90}
$$

Thus the predictive mean is given by (7.76) with  set equal to the posterior mean <sup>w</sup>, and the variance of the predictive distribution is given by

$$
\sigma^{2}(\mathbf{x}) =(\beta^{\star})^{- 1} + \phi(\mathbf{x})^{\mathrm{T}} \pmb{\Sigma} \phi(\mathbf{x})\tag{7.91}
$$

where is given by (7.83) in which α and $\beta$ are set to their optimized values $\alpha^{\star}$ and $\beta^{\star}$ . This is just the familiar result (3.59) obtained in the context of linear regression. Recall that for localized basis functions, the predictive variance for linear regression models becomes small in regions of input space where there are no basis functions. In the case of an RVM with the basis functions centred on data points, the model will therefore become increasingly certain of its predictions when extrapolating outside the domain of the data (Rasmussen and Quinonero-Candela, 2005), which of course˜ is undesirable. The predictive distribution in Gaussian process regression does not

Illustration of RVM regression using the same data set, and the same Gaussian kernel functions, as used in Figure 7.8 for the $\nu{\mathrm{-}}{\mathsf{SVM}}$ regression model. The mean of the predictive distribution for the RVM is shown by the red line, and the one standarddeviation predictive distribution is shown by the shaded region. Also, the data points are shown in green, and the relevance vectors are indicated by blue circles. Note that there are only 3 relevance vectors compared to 7 support vectors for the ν-SVM in Figure 7.8.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/407fe7e57a22b2a9aafd41cfc4effed27a16050dc2eb2106d22d4dd48a823da0.jpg)

suffer from this problem. However, the computational cost of making predictions with a Gaussian processes is typically much higher than with an RVM.

Figure 7.9 shows an example of the RVM applied to the sinusoidal regression data set. Here the noise precision parameter $\beta$ is also determined through evidence maximization. We see that the number of relevance vectors in the RVM is significantly smaller than the number of support vectors used by the SVM. For a wide range of regression and classification tasks, the RVM is found to give models that are typically an order of magnitude more compact than the corresponding support vector machine, resulting in a significant improvement in the speed of processing on test data. Remarkably, this greater sparsity is achieved with little or no reduction in generalization error compared with the corresponding SVM.

The principal disadvantage of the RVM compared to the SVM is that training involves optimizing a nonconvex function, and training times can be longer than for a comparable SVM. For a model with M basis functions, the RVM requires inversion of a matrix of size $M \times M$ , which in general requires $O(M^{3})$ computation. In the specific case of the SVM-like model (7.78), we have $M = N + 1$ . As we have noted, there are techniques for training SVMs whose cost is roughly quadratic in N. Of course, in the case of the RVM we always have the option of starting with a smaller number of basis functions than $N + 1$ . More significantly, in the relevance vector machine the parameters governing complexity and noise variance are determined automatically from a single training run, whereas in the support vector machine the parameters $C$ and $\epsilon$ (or ν) are generally found using cross-validation, which involves multiple training runs. Furthermore, in the next section we shall derive an alternative procedure for training the relevance vector machine that improves training speed significantly.

## 7.2.2 Analysis of sparsity

We have noted earlier that the mechanism of automatic relevance determination causes a subset of parameters to be driven to zero. We now examine in more detail the mechanism of sparsity in the context of the relevance vector machine. In the process, we will arrive at a significantly faster procedure for optimizing the hyperparameters compared to the direct techniques given above.

![Figure 7.10](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/e56013f06aad4e14d54c399dde343403ebf9c17d625d77d227e04041ae20e3da.jpg)  
Figure 7.10 Illustration of the mechanism for sparsity in a Bayesian linear regression model, showing a training set vector of target values given by ${\bf t} =(t_{1}, t_{2})^{\mathrm{T}}$ , indicated by the cross, for a model with one basis vector $\varphi = \left(\phi(\mathbf{x}_{1}), \phi(\mathbf{x}_{2}) \right)^{\mathrm{T}}$ , which is poorly aligned with the target data vector t. On the left we see a model having only isotropic noise, so that $\mathbf{C} = \beta^{\mathbf{\bar{-}} 1} \mathbf{I}$ , corresponding to $\alpha = \infty,$ , with $\beta$ set to its most probable value. On the right we see the same model but with a finite value of $\alpha.$ . In each case the red ellipse corresponds to unit Mahalanobis distance, with $| \mathbf{C} |$ taking the same value for both plots, while the dashed green circle shows the contrition arising from the noise term $\beta^{- 1}$ . We see that any finite value of $\alpha$ reduces the probability of the observed data, and so for the most probable solution the basis vector is removed.

Before proceeding with a mathematical analysis, we first give some informal insight into the origin of sparsity in Bayesian linear models. Consider a data set comprising $N = 2$ observations $t_{1}$ and $t_{2}$ , together with a model having a single basis function $\phi(\mathbf{x})$ , with hyperparameter α, along with isotropic noise having precision $\beta.$ <sup>x</sup>. From (7.85), the marginal likelihood is given by $p(\mathbf{t} | \bar{\alpha}, \beta) = \mathcal{N}(\mathbf{t} | \mathbf{0}, \mathbf{C})$ in which the covariance matrix takes the form

$$
\mathbf{C} = \frac{1}{\beta} \mathbf{I} + \frac{1}{\alpha} \boldsymbol{\varphi} \boldsymbol{\varphi}^{\mathrm{T}}\tag{7.92}
$$

where $\varphi$ denotes the N-dimensional vector $(\phi(\mathbf{x}_{1}), \phi(\mathbf{x}_{2}))^{\mathrm{T}}$ , and similarly ${\textbf{t}} =$ $(t_{1}, t_{2})^{\dot{\mathrm{T}}}$ . Notice that this is just a zero-mean Gaussian process model over with covariance . Given a particular observation for , our goal is to find $\alpha^{\star}$ and $\beta^{\star}$ by maximizing the marginal likelihood. We see from Figure 7.10 that, if there is a poor alignment between the direction of $\varphi$ and that of the training data vector , then the corresponding hyperparameter $\alpha$ will be driven to $\infty.$ , and the basis vector will be pruned from the model. This arises because any finite value for α will always assign a lower probability to the data, thereby decreasing the value of the density at t, provided that $\beta$ is set to its optimal value. We see that any finite value for α would cause the distribution to be elongated in a direction away from the data, thereby increasing the probability mass in regions away from the observed data and hence reducing the value of the density at the target data vector itself. For the more general case of M basis vectors $\varphi_{1}, \ldots, \varphi_{M}$ a similar intuition holds, namely that if a particular basis vector is poorly aligned with the data vector , then it is likely to be pruned from the model.

We now investigate the mechanism for sparsity from a more mathematical perspective, for a general case involving M basis functions. To motivate this analysis we first note that, in the result (7.87) for re-estimating the parameter $\alpha_{i}$ , the terms on the right-hand side are themselves also functions of $\alpha_{i}$ . These results therefore represent implicit solutions, and iteration would be required even to determine a single $\alpha_{i}$ with all other $\alpha_{j}$ for $j \neq i$ fixed.

This suggests a different approach to solving the optimization problem for the RVM, in which we make explicit all of the dependence of the marginal likelihood (7.85) on a particular $\alpha_{i}$ and then determine its stationary points explicitly (Faul and Tipping, 2002; Tipping and Faul, 2003). To do this, we first pull out the contribution from $\alpha_{i}$ in the matrix  defined by (7.86) to give

$$
\begin{array}{rcl} \mathbf{C} & = & \beta^{- 1} \mathbf{I} + \sum_{j \neq i} \alpha_{j}^{- 1} \boldsymbol{\varphi}_{j} \boldsymbol{\varphi}_{j}^{\mathrm{T}} + \alpha_{i}^{- 1} \boldsymbol{\varphi}_{i} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \\ & = & \mathbf{C}_{- i} + \alpha_{i}^{- 1} \boldsymbol{\varphi}_{i} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \end{array}\tag{7.93}
$$

where $\varphi_{i}$ denotes the $i^{\mathrm{th}}$ column of $\Phi$ , in other words the N-dimensional vector with elements $(\phi_{i}(\mathbf{x}_{1}), \ldots, \phi_{i}(\mathbf{x}_{N}))$ <sup>Φ</sup>, in contrast to $\phi_{n}$ , which denotes the $n^{\mathrm{th}}$ row of $\Phi$ The matrix $\mathbf{C}_{- i}$ represents the matrix with the contribution from basis function i removed. Using the matrix identities (C.7) and (C.15), the determinant and inverse of can then be written

$$
{| \mathbf{C} |} ={| \mathbf{C}_{- i} | | 1 + \alpha_{i}^{- 1} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} |}\tag{7.94}
$$

$$
\mathbf{C}^{- 1} = \mathbf{C}_{- i}^{- 1} - \frac{\mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1}}{\alpha_{i} + \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i}}.\tag{7.95}
$$

Exercise 7.15

Using these results, we can then write the log marginal likelihood function (7.85) in the form

$$
L(\boldsymbol{\alpha}) = L \left(\boldsymbol{\alpha}_{- i}\right) + \lambda \left(\alpha_{i}\right)\tag{7.96}
$$

where $L({\alpha}_{- i})$ is simply the log marginal likelihood with basis function $\varphi_{i}$ omitted, and the quantity $\lambda(\alpha_{i})$ is defined by

$$
\lambda(\alpha_{i}) = \frac{1}{2} \left[\ln \alpha_{i} - \ln(\alpha_{i} + s_{i}) + \frac{q_{i}^{2}}{\alpha_{i} + s_{i}} \right]\tag{7.97}
$$

and contains all of the dependence on $\alpha_{i}$ . Here we have introduced the two quantities

$$
{s_{i}} ={\varphi_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \varphi_{i}}\tag{7.98}
$$

$$
{q_{i}} ={\varphi_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \mathbf{t}.}\tag{7.99}
$$

Here $s_{i}$ is called the sparsity and $q_{i}$ is known as the quality of $\varphi_{i}$ , and as we shall see, a large value of $s_{i}$ relative to the value of $q_{i}$ means that the basis function $\varphi_{i}$ is more likely to be pruned from the model. The ‘sparsity’ measures the extent to which basis function $\varphi_{i}$ overlaps with the other basis vectors in the model, and the ‘quality’ represents a measure of the alignment of the basis vector $\varphi_{n}$ with the error between the training set values $\mathbf{t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ and the vector ${\pmb y}_{- i}$ of predictions that would result from the model with the vector $\varphi_{i}$ excluded (Tipping and Faul, 2003).

Figure 7.11 Plots of the log marginal likelihood $\lambda(\alpha_{i})$ versus ln $\alpha_{i}$ showing on the left, the single maximum at a finite $\alpha_{i}$ for $q_{i}^{2} \ = \4$ and $s_{i} = 1$ (so that $q_{i}^{2} > s_{i})$ and on the right, the maximum at $\alpha_{i} = \infty$ for $q_{i}^{2} ~ = ~ 1$ and $s_{i} ~ = ~ 2$ (so that $q_{i}^{2} < s_{i})$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/f9113de6bd407a860c564e60922bec480db2696b28cdc3076a338540f6102265.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/a4cc8f5e97abdeaa18a7c3fa22e22b836a002b6ac16bfc7cfaea41abd8cfc1ce.jpg)

The stationary points of the marginal likelihood with respect to $\alpha_{i}$ occur when the derivative

$$
\frac{d \lambda(\alpha_{i})}{d \alpha_{i}} = \frac{\alpha_{i}^{- 1} s_{i}^{2} -(q_{i}^{2} - s_{i})}{2(\alpha_{i} + s_{i})^{2}}\tag{7.100}
$$

is equal to zero. There are two possible forms for the solution. Recalling that $\alpha_{i} \geqslant 0$ we see that if $q_{i}^{2} < s_{i}$ , then $\alpha_{i} \to \infty$ provides a solution. Conversely, if $q_{i}^{2} > s_{i}$ , we can solve for $\alpha_{i}$ to obtain

$$
\alpha_{i} = \frac{s_{i}^{2}}{q_{i}^{2} - s_{i}}.\tag{7.101}
$$

These two solutions are illustrated in Figure 7.11. We see that the relative size of the quality and sparsity terms determines whether a particular basis vector will be pruned from the model or not. A more complete analysis (Faul and Tipping, 2002), based on the second derivatives of the marginal likelihood, confirms these solutions are indeed the unique maxima of $\lambda(\alpha_{i})$

Note that this approach has yielded a closed-form solution for $\alpha_{i}$ , for given values of the other hyperparameters. As well as providing insight into the origin of sparsity in the RVM, this analysis also leads to a practical algorithm for optimizing the hyperparameters that has significant speed advantages. This uses a fixed set of candidate basis vectors, and then cycles through them in turn to decide whether each vector should be included in the model or not. The resulting sequential sparse Bayesian learning algorithm is described below.

## Sequential Sparse Bayesian Learning Algorithm

1. If solving a regression problem, initialize $\beta.$

2. Initialize using one basis function $\varphi_{1}$ , with hyperparameter $\alpha_{1}$ set using (7.101), with the remaining hyperparameters $\alpha_{j}$ for $j \neq i$ initialized to infinity, so that only $\varphi_{1}$ is included in the model.

3. Evaluate $\pmb{\Sigma}$ and , along with $q_{i}$ and $s_{i}$ for all basis functions.

4. Select a candidate basis function $\varphi_{i}$

5. If $q_{i}^{2} > s_{i}$ , and $\alpha_{i} < \infty$ , so that the basis vector $\varphi_{i}$ is already included in the model, then update $\alpha_{i}$ using (7.101).

6. If $q_{i}^{2} > s_{i}$ , and $\alpha_{i} = \infty$ , then add $\varphi_{i}$ to the model, and evaluate hyperparameter $\alpha_{i}$ using (7.101).

7. If $q_{i}^{2} \leqslant s_{i}.$ , and $\alpha_{i} < \infty$ then remove basis function $\varphi_{i}$ from the model, and set $\alpha_{i} = \infty$

8. If solving a regression problem, update $\beta$

9. If converged terminate, otherwise go to 3.

Note that if $q_{i}^{2} \leqslant s_{i}$ and $\alpha_{i} = \infty$ , then the basis function $\varphi_{i}$ is already excluded from the model and no action is required.

In practice, it is convenient to evaluate the quantities

$$
Q_{i} = \varphi_{i}^{\mathrm{T}} \mathbf{C}^{- 1} \mathbf{t}\tag{7.102}
$$

$$
{S_{i}} ={\varphi_{i}^{\mathrm{T}} \mathbf{C}^{- 1} \varphi_{i}.}\tag{7.103}
$$

The quality and sparseness variables can then be expressed in the form

$$
{q_{i}} ={\frac{\alpha_{i} Q_{i}}{\alpha_{i} - S_{i}}}\tag{7.104}
$$

$$
s_{i} = \frac{\alpha_{i} S_{i}}{\alpha_{i} - S_{i}}.\tag{7.105}
$$

Exercise 7.17

Note that when $\alpha_{i} = \infty$ , we have $q_{i} = Q_{i}$ and $s_{i} = S_{i}$ . Using (C.7), we can write

$$
{Q_{i}} ={\beta \varphi_{i}^{\mathrm{T}} \mathbf{t} - \beta^{2} \varphi_{i}^{\mathrm{T}} \boldsymbol{\Phi} \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t}}\tag{7.106}
$$

$$
{S_{i}} ={\beta \pmb{\varphi}_{i}^{\mathrm{T}} \pmb{\varphi}_{i} - \beta^{2} \pmb{\varphi}_{i}^{\mathrm{T}} \pmb{\Phi} \pmb{\Sigma} \pmb{\Phi}^{\mathrm{T}} \pmb{\varphi}_{i}}\tag{7.107}
$$

where $\Phi$ and involve only those basis vectors that correspond to finite hyperpa-<sup>Φ</sup>rameters $\alpha_{i}$ <sup>Σ</sup>. At each stage the required computations therefore scale like $\bar{O(M^{3})}$ , where M is the number of active basis vectors in the model and is typically much smaller than the number $N$ of training patterns.

## 7.2.3 RVM for classification

We can extend the relevance vector machine framework to classification problems by applying the ARD prior over weights to a probabilistic linear classification model of the kind studied in Chapter 4. To start with, we consider two-class problems with a binary target variable $t \in \{0, 1\}$ . The model now takes the form of a linear combination of basis functions transformed by a logistic sigmoid function

$$
y(\mathbf{x}, \mathbf{w}) = \sigma \left(\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x})\right)\tag{7.108}
$$

where $\sigma(\cdot)$ is the logistic sigmoid function defined by (4.59). If we introduce a Gaussian prior over the weight vector , then we obtain the model that has been <sup>w</sup>considered already in Chapter 4. The difference here is that in the RVM, this model uses the ARD prior (7.80) in which there is a separate precision hyperparameter associated with each weight parameter.

In contrast to the regression model, we can no longer integrate analytically over the parameter vector . Here we follow Tipping (2001) and use the Laplace ap-<sup>w</sup>proximation, which was applied to the closely related problem of Bayesian logistic regression in Section 4.5.1.

We begin by initializing the hyperparameter vector α. For this given value of α, we then build a Gaussian approximation to the posterior distribution and thereby obtain an approximation to the marginal likelihood. Maximization of this approximate marginal likelihood then leads to a re-estimated value for $_{\alpha, \beta}$ and the process is repeated until convergence.

Let us consider the Laplace approximation for this model in more detail. For a fixed value of α, the mode of the posterior distribution over  is obtained by maximizing

$$
\begin{array}{l} \ln p(\mathbf{w} | \mathbf{t}, \boldsymbol{\alpha}) = \ln \left\{p(\mathbf{t} | \mathbf{w}) p(\mathbf{w} | \boldsymbol{\alpha}) \right\} - \ln p(\mathbf{t} | \boldsymbol{\alpha}) \\ = \sum_{n = 1}^{N} \left\{t_{n} \ln y_{n} +(1 - t_{n}) \ln(1 - y_{n}) \right\} - \frac{1}{2} \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} + \text{const} \end{array}\tag{7.109}
$$

where $\mathbf{A} = \operatorname{diag}(\alpha_{i})$ . This can be done using iterative reweighted least squares <sup>A</sup>(IRLS) as discussed in Section 4.3.3. For this, we need the gradient vector and Hessian matrix of the log posterior distribution, which from (7.109) are given by

$$
\nabla \ln p(\mathbf{w} | \mathbf{t}, \boldsymbol{\alpha}) = \boldsymbol{\Phi}^{\mathrm{T}}(\mathbf{t} - \mathbf{y}) - \mathbf{Aw}\tag{7.110}
$$

$$
\nabla \nabla \ln p(\mathbf{w} | \mathbf{t}, \boldsymbol{\alpha}) = - \left(\boldsymbol{\Phi}^{\mathrm{T}} \mathbf{B} \boldsymbol{\Phi} + \mathbf{A}\right)\tag{7.111}
$$

where is an $N \times N$ diagonal matrix with elements $b_{n} = y_{n}(1 - y_{n})$ , the vector $\pmb{\y} =(y_{1}, \dots, y_{N})^{\mathrm{T}}$ , and $\Phi$ is the design matrix with elements $\Phi_{ni} = \phi_{i}(\mathbf{x}_{n})$ . Here we have used the property (4.88) for the derivative of the logistic sigmoid function. At convergence of the IRLS algorithm, the negative Hessian represents the inverse covariance matrix for the Gaussian approximation to the posterior distribution.

The mode of the resulting approximation to the posterior distribution, corresponding to the mean of the Gaussian approximation, is obtained setting (7.110) to zero, giving the mean and covariance of the Laplace approximation in the form

$$
\mathbf{w}^{\star} = \mathbf{A}^{- 1} \boldsymbol{\Phi}^{\mathrm{T}}(\mathbf{t} - \mathbf{y})\tag{7.112}
$$

$$
\boldsymbol{\Sigma} = \left(\boldsymbol{\Phi}^{T} \mathbf{B} \boldsymbol{\Phi} + \mathbf{A}\right)^{- 1}.\tag{7.113}
$$

We can now use this Laplace approximation to evaluate the marginal likelihood. Using the general result (4.135) for an integral evaluated using the Laplace approxi-

mation, we have

$$
\begin{array}{rcl} p(\mathbf{t} | \boldsymbol{\alpha}) & = & \int p(\mathbf{t} | \mathbf{w}) p(\mathbf{w} | \boldsymbol{\alpha}) d \mathbf{w} \\ & \simeq & p(\mathbf{t} | \mathbf{w}^{\star}) p(\mathbf{w}^{\star} | \boldsymbol{\alpha})(2 \pi)^{M / 2} | \boldsymbol{\Sigma} |^{1 / 2}.\end{array}\tag{7.114}
$$

If we substitute for $p(\mathbf{t} | \mathbf{w}^{\star})$ and $p(\mathbf{w}^{\star} | \alpha)$ and then set the derivative of the marginal <sup>w</sup>likelihood with respect to $\alpha_{i}$ <sup>w</sup>equal to zero, we obtain

$$
- \frac{1}{2}(w_{i}^{\star})^{2} + \frac{1}{2 \alpha_{i}} - \frac{1}{2} \Sigma_{ii} = 0.\tag{7.115}
$$

Defining $\gamma_{i} = 1 - \alpha_{i} \Sigma_{ii}$ and rearranging then gives

$$
\alpha_{i}^{\mathrm{new}} = \frac{\gamma_{i}}{(w_{i}^{\star})^{2}}\tag{7.116}
$$

which is identical to the re-estimation formula (7.87) obtained for the regression RVM.

If we define

$$
\widehat{\mathbf{t}} = \boldsymbol{\Phi} \mathbf{w}^{\star} + \mathbf{B}^{- 1}(\mathbf{t} - \mathbf{y})\tag{7.117}
$$

we can write the approximate log marginal likelihood in the form

$$
\ln p(\mathbf{t} | \boldsymbol{\alpha}, \beta) = - \frac{1}{2} \left\{N \ln(2 \pi) + \ln | \mathbf{C} | +(\widehat{\mathbf{t}})^{\mathrm{T}} \mathbf{C}^{- 1} \widehat{\mathbf{t}} \right\}\tag{7.118}
$$

where

$$
\mathbf{C} = \mathbf{B} + \boldsymbol{\Phi} \mathbf{A} \boldsymbol{\Phi}^{\mathrm{T}}.\tag{7.119}
$$

This takes the same form as (7.85) in the regression case, and so we can apply the same analysis of sparsity and obtain the same fast learning algorithm in which we fully optimize a single hyperparameter $\alpha_{i}$ at each step.

Figure 7.12 shows the relevance vector machine applied to a synthetic classification data set. We see that the relevance vectors tend not to lie in the region of the decision boundary, in contrast to the support vector machine. This is consistent with our earlier discussion of sparsity in the RVM, because a basis function $\phi_{i}(\mathbf{x})$ centred on a data point near the boundary will have a vector $\varphi_{i}$ <sup>x</sup>that is poorly aligned with the training data vector t.

One of the potential advantages of the relevance vector machine compared with the SVM is that it makes probabilistic predictions. For example, this allows the RVM to be used to help construct an emission density in a nonlinear extension of the linear dynamical system for tracking faces in video sequences (Williams et al., 2005).

So far, we have considered the RVM for binary classification problems. For $K > 2$ classes, we again make use of the probabilistic approach in Section 4.3.4 in which there are K linear models of the form

$$
a_{k} = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x}\tag{7.120}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/cf0926dc7866fab91a60ef03128f7a43ac445cb0395ae0222189cfe4652d7326.jpg)

![Figure 7.12](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/cb5bae3956faf06aeac90078ac10e0fac5959e7c5b9d5544564061af49878a24.jpg)  
Figure 7.12 Example of the relevance vector machine applied to a synthetic data set, in which the left-hand plot shows the decision boundary and the data points, with the relevance vectors indicated by circles. Comparison with the results shown in Figure 7.4 for the corresponding support vector machine shows that the RVM gives a much sparser model. The right-hand plot shows the posterior probability given by the RVM output in which the proportion of red (blue) ink indicates the probability of that point belonging to the red (blue) class.

which are combined using a softmax function to give outputs

$$
y_{k}(\mathbf{x}) = \frac{\exp(a_{k})}{\sum_{j} \exp(a_{j})}.\tag{7.121}
$$

The log likelihood function is then given by

$$
\ln p(\mathbf{T} | \mathbf{w}_{1}, \dots, \mathbf{w}_{K}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} y_{nk}^{t_{nk}}\tag{7.122}
$$

where the target values $t_{nk}$ have a 1-of-K coding for each data point n, and is a matrix with elements $t_{nk}$ . Again, the Laplace approximation can be used to optimize the hyperparameters (Tipping, 2001), in which the model and its Hessian are found using IRLS. This gives a more principled approach to multiclass classification than the pairwise method used in the support vector machine and also provides probabilistic predictions for new data points. The principal disadvantage is that the Hessian matrix has size $MK \times MK$ , where M is the number of active basis functions, which gives an additional factor of $K^{3}$ in the computational cost of training compared with the two-class RVM.

The principal disadvantage of the relevance vector machine is the relatively long training times compared with the SVM. This is offset, however, by the avoidance of cross-validation runs to set the model complexity parameters. Furthermore, because it yields sparser models, the computation time on test points, which is usually the more important consideration in practice, is typically much less.

## Exercises

7.1 (★★) www Suppose we have a data set of input vectors $\left\{{\bf x}_{n} \right\}$ with corresponding target values $t_{n} ~ \in ~ \{- 1, 1\}$ , and suppose that we model the density of input vectors within each class separately using a Parzen kernel density estimator (see Section 2.5.1) with a kernel $\bar{k}(\mathbf{x}, \mathbf{x}^{\prime})$ . Write down the minimum misclassification-rate decision rule assuming the two classes have equal prior probability. Show also that, if the kernel is chosen to be $k(\mathbf{x}, \mathbf{x}^{\prime}) = \mathbf{x}^{\mathrm{{T}}} \mathbf{x}^{\prime}$ , then the classification rule reduces to <sup>x x x x</sup>simply assigning a new input vector to the class having the closest mean. Finally, show that, if the kernel takes the form $k({\bf x},{\bf x}^{\prime}) = \phi({\bf x})^{\top} \phi({\bf x}^{\prime})$ , that the classification <sup>x x</sup>is based on the closest mean in the feature space $\phi(\mathbf{x})$

7.2 (★) Show that, if the 1 on the right-hand side of the constraint (7.5) is replaced by some arbitrary constant $\gamma > 0$ , the solution for the maximum margin hyperplane is unchanged.

7.3 (★★) Show that, irrespective of the dimensionality of the data space, a data set consisting of just two data points, one from each class, is sufficient to determine the location of the maximum-margin hyperplane.

7.4 (★★) www Show that the value $\rho$ of the margin for the maximum-margin hyperplane is given by

$$
{\frac{1}{\rho^{2}}} = \sum_{n = 1}^{N} a_{n}\tag{7.123}
$$

where $\left\{a_{n} \right\}$ are given by maximizing (7.10) subject to the constraints (7.11) and (7.12).

7.5 (★★) Show that the values of $\rho$ and $\{a_{n}\}$ in the previous exercise also satisfy

$$
\frac{1}{\rho^{2}} = 2 \widetilde{L}(\mathbf{a})\tag{7.124}
$$

where $\widetilde L(\mathbf{a})$ is defined by (7.10). Similarly, show that

$$
\frac{1}{\rho^{2}} = \left\| \mathbf{w} \right\|^{2}.\tag{7.125}
$$

7.6 (★) Consider the logistic regression model with a target variable $t \in \{- 1, 1\}$ . If we define $p(t = 1 | y) = \sigma(y)$ where $y(\mathbf x)$ is given by (7.1), show that the negative <sup>x</sup>log likelihood, with the addition of a quadratic regularization term, takes the form (7.47).

7.7 (★) Consider the Lagrangian (7.56) for the regression support vector machine. By setting the derivatives of the Lagrangian with respect to , b, $\xi_{n}$ , and $\widehat{\xi}_{n}$ to zero and <sup>w</sup>then back substituting to eliminate the corresponding variables, show that the dual Lagrangian is given by (7.61).

7.8 (★) www For the regression support vector machine considered in Section 7.1.4, show that all training data points for which $\xi_{n} > 0$ will have $a_{n} = C$ , and similarly all points for which $\widehat{\xi}_{n} > 0$ will have $\widehat{a}_{n} = C$

7.9 (★) Verify the results (7.82) and (7.83) for the mean and covariance of the posterior distribution over weights in the regression RVM.

7.10 (★★) www Derive the result (7.85) for the marginal likelihood function in the regression RVM, by performing the Gaussian integral over  in (7.84) using the technique of completing the square in the exponential.

7.11 (★★) Repeat the above exercise, but this time make use of the general result (2.115).

7.12 (★★) www Show that direct maximization of the log marginal likelihood (7.85) for the regression relevance vector machine leads to the re-estimation equations (7.87) and (7.88) where $\gamma_{i}$ is defined by (7.89).

7.13 (★★) In the evidence framework for RVM regression, we obtained the re-estimation formulae (7.87) and (7.88) by maximizing the marginal likelihood given by (7.85). Extend this approach by inclusion of hyperpriors given by gamma distributions of the form (B.26) and obtain the corresponding re-estimation formulae for α and $\beta$ by maximizing the corresponding posterior probability $p(\mathbf{t}, \alpha, \beta | \mathbf{X})$ with respect to α and $\beta.$ .

7.14 (★★) Derive the result (7.90) for the predictive distribution in the relevance vector machine for regression. Show that the predictive variance is given by (7.91).

7.15 (★★) www Using the results (7.94) and (7.95), show that the marginal likelihood (7.85) can be written in the form (7.96), where $\lambda(\alpha_{n})$ is defined by (7.97) and the sparsity and quality factors are defined by (7.98) and (7.99), respectively.

7.16 (★) By taking the second derivative of the log marginal likelihood (7.97) for the regression RVM with respect to the hyperparameter $\alpha_{i},$ show that the stationary point given by (7.101) is a maximum of the marginal likelihood.

7.17 (★★) Using (7.83) and (7.86), together with the matrix identity (C.7), show that the quantities $S_{n}$ and $Q_{n}$ defined by (7.102) and (7.103) can be written in the form (7.106) and (7.107).

7.18 (★) www Show that the gradient vector and Hessian matrix of the log posterior distribution (7.109) for the classification relevance vector machine are given by (7.110) and (7.111).

7.19 (★★) Verify that maximization of the approximate log marginal likelihood function (7.114) for the classification relevance vector machine leads to the result (7.116) for re-estimation of the hyperparameters.

## 8


---
title: "Chapter 4 \u2014 Linear Models for Classification"
book: "Pattern Recognition and Machine Learning"
book_slug: pattern-recognition-machine-learning
course: deep-learning
chapter_number: 4
citekey: bishop2006prml
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/pattern-recognition-machine-learning/reading.md"
source_line_start: 5478
source_line_end: 6860
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 26
source_empty_image_alt: 26
non_semantic_image_alt: 16
caption_derived_image_alt: 10
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 39
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 4 — Linear Models for Classification

> [[../README|本书目录]] · [[03-chapter-3-linear-models-for-regression|上一章]] · [[05-chapter-5-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Pattern Recognition and Machine Learning（bishop2006prml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/pattern-recognition-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/pattern-recognition-machine-learning/reading.md)，源行 5478–6860。
> - 本章保留 26 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed PRML exercise difficulty marker pattern × 37；PDF-confirmed book-specific control-codepoint pattern × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# 4 Linear Models for Classification

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p001-200/images/e00e483e157df5bd2cc5e0712711fcba22e55dfdff8bd527957e54fe15c711b4.jpg)

In the previous chapter, we explored a class of regression models having particularly simple analytical and computational properties. We now discuss an analogous class of models for solving classification problems. The goal in classification is to take an input vector and to assign it to one of K discrete classes $\mathcal{C}_{k}$ where $k = 1, \ldots, K$ In the most common scenario, the classes are taken to be disjoint, so that each input is assigned to one and only one class. The input space is thereby divided into decision regions whose boundaries are called decision boundaries or decision surfaces. In this chapter, we consider linear models for classification, by which we mean that the decision surfaces are linear functions of the input vector and hence are defined by (D 1)-dimensional hyperplanes within the D-dimensional input space. Data sets whose classes can be separated exactly by linear decision surfaces are said to be linearly separable.

For regression problems, the target variable was simply the vector of real numbers whose values we wish to predict. In the case of classification, there are various ways of using target values to represent class labels. For probabilistic models, the most convenient, in the case of two-class problems, is the binary representation in which there is a single target variable $t \in \{0, 1\}$ such that $t = 1$ represents class $\mathcal{C}_{1}$ and $t = 0$ represents class $\mathcal{C}_{2}$ . We can interpret the value of t as the probability that the class is $\mathcal{C}_{1}$ , with the values of probability taking only the extreme values of 0 and 1. For $K > 2$ classes, it is convenient to use a 1-of-K coding scheme in which is a vector of length K such that if the class is $\mathcal{C}_{j}$ , then all elements $t_{k}$ of are zero except element $t_{j}$ , which takes the value 1. For instance, if we have $K = 5$ classes, then a pattern from class 2 would be given the target vector

$$
\mathbf{t} =(0, 1, 0, 0, 0)^{\mathrm{T}}.\tag{4.1}
$$

Again, we can interpret the value of $t_{k}$ as the probability that the class is $\mathcal{C}_{k}$ . For nonprobabilistic models, alternative choices of target variable representation will sometimes prove convenient.

In Chapter 1, we identified three distinct approaches to the classification problem. The simplest involves constructing a discriminant function that directly assigns each vector  to a specific class. A more powerful approach, however, models the conditional probability distribution $p(\mathcal{C}_{k} | \mathbf{x})$ in an inference stage, and then subsequently uses this distribution to make optimal decisions. By separating inference and decision, we gain numerous benefits, as discussed in Section 1.5.4. There are two different approaches to determining the conditional probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ . One technique is to model them directly, for example by representing them as parametric models and then optimizing the parameters using a training set. Alternatively, we can adopt a generative approach in which we model the class-conditional densities given by $p(\mathbf{x} | \mathcal{C}_{k})$ , together with the prior probabilities $p(\mathcal{C}_{k})$ for the classes, and then <sup>x</sup>we compute the required posterior probabilities using Bayes’ theorem

$$
p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{p(\mathbf{x})}.\tag{4.2}
$$

We shall discuss examples of all three approaches in this chapter.

In the linear regression models considered in Chapter 3, the model prediction $y(\mathbf{x}, \mathbf{w})$ was given by a linear function of the parameters . In the simplest case, <sup>x w w</sup>the model is also linear in the input variables and therefore takes the form $y(\mathbf{x}) =$ $\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}$ , so that $y$ <sup>x</sup>is a real number. For classification problems, however, we wish to predict discrete class labels, or more generally posterior probabilities that lie in the range (0, 1). To achieve this, we consider a generalization of this model in which we transform the linear function of using a nonlinear function $f(\cdot)$ so that

$$
y(\mathbf{x}) = f \left(\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}\right).\tag{4.3}
$$

In the machine learning literature $f(\cdot)$ is known as an activation function, whereas its inverse is called a link function in the statistics literature. The decision surfaces correspond to $y(\mathbf{x}) = \mathrm{constant}$ , so that $\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0} =$ constant and hence the decision surfaces are linear functions of , even if the function $f(\cdot)$ is nonlinear. For this reason, the class of models described by (4.3) are called generalized linear models (McCullagh and Nelder, 1989). Note, however, that in contrast to the models used for regression, they are no longer linear in the parameters due to the presence of the nonlinear function $f(\cdot)$ . This will lead to more complex analytical and computational properties than for linear regression models. Nevertheless, these models are still relatively simple compared to the more general nonlinear models that will be studied in subsequent chapters.

The algorithms discussed in this chapter will be equally applicable if we first make a fixed nonlinear transformation of the input variables using a vector of basis functions $\phi(\mathbf{x})$ as we did for regression models in Chapter 3. We begin by considering classification directly in the original input space , while in Section 4.3 we shall find it convenient to switch to a notation involving basis functions for consistency with later chapters.

## 4.1. Discriminant Functions

A discriminant is a function that takes an input vector  and assigns it to one of K classes, denoted $\mathcal{C}_{k}$ . In this chapter, we shall restrict attention to linear discriminants, namely those for which the decision surfaces are hyperplanes. To simplify the discussion, we consider first the case of two classes and then investigate the extension to $K > 2$ classes.

## 4.1.1 Two classes

The simplest representation of a linear discriminant function is obtained by taking a linear function of the input vector so that

$$
y(\mathbf{x}) = \mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}\tag{4.4}
$$

where is called a weight vector, and $w_{0}$ is a bias (not to be confused with bias in the statistical sense). The negative of the bias is sometimes called a threshold. An input vector is assigned to class $\mathcal{C}_{1} \mathrm{if} y(\mathbf{x}) \geqslant 0$ and to class $\mathcal{C}_{2}$ otherwise. The cor-<sup>x x</sup>responding decision boundary is therefore defined by the relation $y(\mathbf{x}) = 0$ , which corresponds to a $(D - 1)$ -dimensional hyperplane within the D-dimensional input space. Consider two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x_{\mathrm{B}}}$ both of which lie on the decision surface. Because $y(\mathbf{x}_{\mathrm{A}}) = y(\mathbf{x}_{\mathrm{B}}) = 0$ , we have ${\bf w}^{\mathrm{T}}({\bf x}_{\mathrm{A}} -{\bf x}_{\mathrm{B}}) = 0$ and hence the vector is orthogonal to every vector lying within the decision surface, and so determines the orientation of the decision surface. Similarly, if is a point on the decision surface, then $y(\mathbf{x}) = 0$ , and so the normal distance from the origin to the decision surface is given by

$$
\frac{\mathbf{w}^{\mathrm{T}} \mathbf{x}}{\| \mathbf{w} \|} = - \frac{w_{0}}{\| \mathbf{w} \|}.\tag{4.5}
$$

We therefore see that the bias parameter $w_{0}$ determines the location of the decision surface. These properties are illustrated for the case of $D = 2$ in Figure 4.1.

Furthermore, we note that the value of $y(\mathbf x)$ gives a signed measure of the perpendicular distance r of the point  from the decision surface. To see this, consider

Figure 4.1 Illustration of the geometry of a linear discriminant function in two dimensions. The decision surface, shown in red, is perpendicular to $\mathbf{w},$ and its displacement from the origin is controlled by the bias parameter $w_{0}.$ Also, the signed orthogonal distance of a general point x from the decision surface is given by $y(\mathbf{x}) / \| \mathbf{w} \|$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p001-200/images/a9b4d5741d77599e4adc5617aa278371721789037f07ac87cfec3e132cddc93d.jpg)

an arbitrary point  and let $\mathbf{x}_{\perp}$ be its orthogonal projection onto the decision surface, so that W

$$
\mathbf{x} = \mathbf{x}_{\perp} + r \frac{\mathbf{w}}{\| \mathbf{w} \|}.\tag{4.6}
$$

Multiplying both sides of this result by $\mathbf{w}^{\mathrm{T}}$ and adding $w_{0}$ , and making use of $y(\mathbf{x}) =$ $\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}$ and $y(\mathbf{x}_{\perp}) = \mathbf{w}^{\mathrm{T}} \mathbf{x}_{\perp} + w_{0} = 0$ , we have

$$
r = \frac{y(\mathbf{x})}{\| \mathbf{w} \|}.\tag{4.7}
$$

This result is illustrated in Figure 4.1.

As with the linear regression models in Chapter 3, it is sometimes convenient to use a more compact notation in which we introduce an additional dummy ‘input value $x_{0} = 1$ and then define $\widetilde{\mathbf{w}} =(w_{0}, \mathbf{w})$ and $\widetilde{\mathbf{x}} = \left(x_{0}, \mathbf{x} \right)$ so that

$$
y(\mathbf{x}) = \widetilde{\mathbf{w}}^{\mathrm{T}} \widetilde{\mathbf{x}}.\tag{4.8}
$$

In this case, the decision surfaces are D-dimensional hyperplanes passing through the origin of the $D + 1$ -dimensional expanded input space.

## 4.1.2 Multiple classes

Now consider the extension of linear discriminants to $K > 2$ classes. We might be tempted be to build a K-class discriminant by combining a number of two-class discriminant functions. However, this leads to some serious difficulties (Duda and Hart, 1973) as we now show.

Consider the use of $K - 1$ classifiers each of which solves a two-class problem of separating points in a particular class $\mathcal{C}_{k}$ from points not in that class. This is known as a one-versus-the-rest classifier. The left-hand example in Figure 4.2 shows an example involving three classes where this approach leads to regions of input space that are ambiguously classified.

![Figure 4.2](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p001-200/images/df4c09cb1a1ed34bf1ee2e66de506eaca33f92a5a06fab67dfafcb74659cbfc1.jpg)  
Figure 4.2 Attempting to construct a K class discriminant from a set of two class discriminants leads to ambiguous regions, shown in green. On the left is an example involving the use of two discriminants designed to distinguish points in class $\mathcal{C}_{k}$ from points not in class $\mathcal{C}_{k}$ . On the right is an example involving three discriminant functions each of which is used to separate a pair of classes $\mathcal{C}_{k}$ and $\mathcal{C}_{j}$

An alternative is to introduce $K(K - 1) / 2$ binary discriminant functions, one for every possible pair of classes. This is known as a one-versus-one classifier. Each point is then classified according to a majority vote amongst the discriminant functions. However, this too runs into the problem of ambiguous regions, as illustrated in the right-hand diagram of Figure 4.2.

We can avoid these difficulties by considering a single K-class discriminant comprising K linear functions of the form

$$
y_{k}(\mathbf{x}) = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x} + w_{k0}\tag{4.9}
$$

and then assigning a point  to class $\mathcal{C}_{k}$ if $y_{k}(\mathbf x) > y_{j}(\mathbf x)$ for all $j \neq k$ . The decision boundary between class $\mathcal{C}_{k}$ and class $\mathcal{C}_{j}$ <sup>x x</sup>is therefore given by $y_{k}(\mathbf x) = y_{j}(\mathbf x)$ and hence corresponds to a $(D - 1)$ -dimensional hyperplane defined by

$$
\left(\mathbf{w}_{k} - \mathbf{w}_{j}\right)^{\mathrm{T}} \mathbf{x} + \left(w_{k0} - w_{j0}\right) = 0.\tag{4.10}
$$

This has the same form as the decision boundary for the two-class case discussed in Section 4.1.1, and so analogous geometrical properties apply.

The decision regions of such a discriminant are always singly connected and convex. To see this, consider two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x_{\mathrm{B}}}$ both of which lie inside decision region $\mathcal{R}_{k}$ <sup>x x</sup>, as illustrated in Figure 4.3. Any point that lies on the line connecting $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ can be expressed in the form

$$
\widehat{\mathbf{x}} = \lambda \mathbf{x}_{\mathrm{A}} +(1 - \lambda) \mathbf{x}_{\mathrm{B}}\tag{4.11}
$$

Figure 4.3 Illustration of the decision regions for a multiclass linear discriminant, with the decision boundaries shown in red. If two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ both lie inside the same decision region $\mathcal{R}_{k},$ then any point x that lies on the line connecting these two points must also lie in $\mathcal{R}_{k}$ , and hence the decision region must be singly connected and convex.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/33de7dedb4e521c709c303a646354c8dda20273e24f822a89ecce11a4714f54c.jpg)

where $0 \leqslant \lambda \leqslant 1$ . From the linearity of the discriminant functions, it follows that

$$
y_{k}(\widehat{\mathbf{x}}) = \lambda y_{k}(\mathbf{x}_{\mathrm{A}}) +(1 - \lambda) y_{k}(\mathbf{x}_{\mathrm{B}}).\tag{4.12}
$$

Because both $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x_{\mathrm{B}}}$ lie inside $\mathcal{R}_{k},$ it follows that $y_{k}(\mathbf{x}_{\mathrm{A}}) \ > \y_{j}(\mathbf{x}_{\mathrm{A}})$ , and $y_{k}(\mathbf{x}_{\mathrm{B}}) \ > \y_{j}(\mathbf{x}_{\mathrm{B}})$ <sup>x</sup>, for all $j \neq k$ , and hence $y_{k}(\widehat{\mathbf x}) > y_{j}(\widehat{\mathbf x})$ <sup>x</sup>, and so also lies <sup>x</sup>inside $\mathcal{R}_{k}$ <sup>x</sup>. Thus $\mathcal{R}_{k}$ <sup>x</sup>is singly connected and convex.

Note that for two classes, we can either employ the formalism discussed here, based on two discriminant functions $y_{1}(\mathbf x)$ and $y_{2}(\mathbf x)$ , or else use the simpler but <sup>x x</sup>equivalent formulation described in Section 4.1.1 based on a single discriminant function $y(\mathbf x)$

We now explore three approaches to learning the parameters of linear discrimi nant functions, based on least squares, Fisher’s linear discriminant, and the perceptron algorithm.

## 4.1.3 Least squares for classification

In Chapter 3, we considered models that were linear functions of the parameters, and we saw that the minimization of a sum-of-squares error function led to a simple closed-form solution for the parameter values. It is therefore tempting to see if we can apply the same formalism to classification problems. Consider a general classification problem with K classes, with a 1-of-K binary coding scheme for the target vector . One justification for using least squares in such a context is that it approximates the conditional expectation $\mathbb{E}[\mathbf{t} | \mathbf{x}]$ of the target values given the input <sup>t x</sup>vector. For the binary coding scheme, this conditional expectation is given by the vector of posterior class probabilities. Unfortunately, however, these probabilities are typically approximated rather poorly, indeed the approximations can have values outside the range (0, 1), due to the limited flexibility of a linear model as we shall see shortly.

Each class $\mathcal{C}_{k}$ is described by its own linear model so that

$$
y_{k}(\mathbf{x}) = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x} + w_{k0}\tag{4.13}
$$

where $k = 1, \ldots, K$ . We can conveniently group these together using vector notation so that

$$
\mathbf{y}(\mathbf{x}) = \widetilde{\mathbf{W}}^{\mathrm{T}} \widetilde{\mathbf{x}}\tag{4.14}
$$

where $\widetilde{\bf W}$ is a matrix whose $k^{\mathrm{th}}$ column comprises the $D + 1$ -dimensional vector $\widetilde{\mathbf{w}}_{k} =(w_{k0}, \mathbf{w}_{k}^{\mathrm{T}})^{\mathrm{T}}$ and $\widetilde{\mathbf{x}}$ is the corresponding augmented input vector $(1, \mathbf{x}^{\mathrm{T}})^{\mathrm{T}}$ with a dummy input $x_{0} = 1$ . This representation was discussed in detail in Section 3.1. A new input is then assigned to the class for which the output $y_{k} = \widetilde{\mathbf{w}}_{k}^{\mathrm{T}} \widetilde{\mathbf{x}}$ is largest.

We now determine the parameter matrix $\widetilde{\bf W}$ by minimizing a sum-of-squares <sup>W</sup>error function, as we did for regression in Chapter 3. Consider a training data set $\{\mathbf{x}_{n}, \mathbf{t}_{n}\}$ where $n = 1, \ldots, N$ , and define a matrix whose $n^{\mathrm{th}}$ row is the vector $\mathbf{t}_{n}^{\mathrm{T}}$ together with a matrix $\widetilde{\mathbf{X}}$ whose $n^{\mathrm{th}}$ row is $\widetilde{\mathbf{x}}_{n}^{\mathrm{{T}}}$ . The sum-of-squares error function can then be written as

$$
E_{D}(\widetilde{\mathbf{W}}) = \frac{1}{2} \mathrm{Tr} \left\{(\widetilde{\mathbf{X}} \widetilde{\mathbf{W}} - \mathbf{T})^{\mathrm{T}}(\widetilde{\mathbf{X}} \widetilde{\mathbf{W}} - \mathbf{T}) \right\}.\tag{4.15}
$$

Setting the derivative with respect to $\widetilde{\bf W}$ to zero, and rearranging, we then obtain the solution for $\widetilde{\mathbf{W}}$ in the form

$$
\widetilde{\mathbf{W}} =(\widetilde{\mathbf{X}}^{\mathrm{T}} \widetilde{\mathbf{X}})^{- 1} \widetilde{\mathbf{X}}^{\mathrm{T}} \mathbf{T} = \widetilde{\mathbf{X}}^{\dagger} \mathbf{T}\tag{4.16}
$$

where $\widetilde{\mathbf{X}}^{\dagger}$ is the pseudo-inverse of the matrix $\widetilde{\mathbf{X}},$ , as discussed in Section 3.1.1. We then obtain the discriminant function in the form

$$
\mathbf{y}(\mathbf{x}) = \widetilde{\mathbf{W}}^{\mathrm{T}} \widetilde{\mathbf{x}} = \mathbf{T}^{\mathrm{T}} \left(\widetilde{\mathbf{X}}^{\dagger}\right)^{\mathrm{T}} \widetilde{\mathbf{x}}.\tag{4.17}
$$

An interesting property of least-squares solutions with multiple target variables is that if every target vector in the training set satisfies some linear constraint

$$
\mathbf{a}^{\mathrm{T}} \mathbf{t}_{n} + b = 0\tag{4.18}
$$

for some constants and b, then the model prediction for any value of will satisfy the same constraint so that

$$
\mathbf{a}^{\mathrm{T}} \mathbf{y}(\mathbf{x}) + b = 0.\tag{4.19}
$$

Thus if we use a 1-of-K coding scheme for K classes, then the predictions made by the model will have the property that the elements of $\mathbf{y}(\mathbf{x})$ will sum to 1 for any value of . However, this summation constraint alone is not sufficient to allow the model outputs to be interpreted as probabilities because they are not constrained to lie within the interval (0, 1).

The least-squares approach gives an exact closed-form solution for the discriminant function parameters. However, even as a discriminant function (where we use it to make decisions directly and dispense with any probabilistic interpretation) it suffers from some severe problems. We have already seen that least-squares solutions lack robustness to outliers, and this applies equally to the classification application, as illustrated in Figure 4.4. Here we see that the additional data points in the righthand figure produce a significant change in the location of the decision boundary, even though these point would be correctly classified by the original decision boundary in the left-hand figure. The sum-of-squares error function penalizes predictions that are ‘too correct’ in that they lie a long way on the correct side of the decision boundary. In Section 7.1.2, we shall consider several alternative error functions for classification and we shall see that they do not suffer from this difficulty.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/c763c94c64a57924299ab0167dee23ab6a480e44c2de031e38a4b99fc018e126.jpg)

![Figure 4.4](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/dd597add9067c01eab136354ae2eee349a74bc2e4a432867a50fce14612f6760.jpg)  
Figure 4.4 The left plot shows data from two classes, denoted by red crosses and blue circles, together with the decision boundary found by least squares (magenta curve) and also by the logistic regression model (green curve), which is discussed later in Section 4.3.2. The right-hand plot shows the corresponding results obtained when extra data points are added at the bottom left of the diagram, showing that least squares is highly sensitive to outliers, unlike logistic regression.

However, problems with least squares can be more severe than simply lack of robustness, as illustrated in Figure 4.5. This shows a synthetic data set drawn from three classes in a two-dimensional input space $(x_{1}, x_{2})$ , having the property that lin ear decision boundaries can give excellent separation between the classes. Indeed, the technique of logistic regression, described later in this chapter, gives a satisfactory solution as seen in the right-hand plot. However, the least-squares solution gives poor results, with only a small region of the input space assigned to the green class.

The failure of least squares should not surprise us when we recall that it corresponds to maximum likelihood under the assumption of a Gaussian conditional distribution, whereas binary target vectors clearly have a distribution that is far from Gaussian. By adopting more appropriate probabilistic models, we shall obtain classification techniques with much better properties than least squares. For the moment, however, we continue to explore alternative nonprobabilistic methods for setting the parameters in the linear classification models.

## 4.1.4 Fisher’s linear discriminant

One way to view a linear classification model is in terms of dimensionality reduction. Consider first the case of two classes, and suppose we take the Ddimensional input vector  and project it down to one dimension using

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/5c91d235d08a6dce995aee4c8dfb9744051160965b659fdee1312ac8c767451d.jpg)

![Figure 4.5](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/70897f19cc9e8abdba5740d1f41bbde990bf0e10823d90d16f59bc08d11481ed.jpg)  
Figure 4.5 Example of a synthetic data set comprising three classes, with training data points denoted in red ( ), green (+), and blue ( ). Lines denote the decision boundaries, and the background colours denote the respective classes of the decision regions. On the left is the result of using a least-squares discriminant. We see that the region of input space assigned to the green class is too small and so most of the points from this class are misclassified. On the right is the result of using logistic regressions as described in Section 4.3.2 showing correct classification of the training data.

$$
y = \mathbf{w}^{\mathrm{T}} \mathbf{x}.\tag{4.20}
$$

If we place a threshold on y and classify $y \geqslant - w_{0}$ as class $\mathcal{C}_{1}$ , and otherwise class $\mathcal{C}_{2}$ , then we obtain our standard linear classifier discussed in the previous section. In general, the projection onto one dimension leads to a considerable loss of information, and classes that are well separated in the original D-dimensional space may become strongly overlapping in one dimension. However, by adjusting the components of the weight vector , we can select a projection that maximizes the class <sup>w</sup>separation. To begin with, consider a two-class problem in which there are $N_{1}$ points of class $\mathcal{C}_{1}$ and ${\dot{N_{2}}}$ points of class $\mathcal{C}_{2}$ , so that the mean vectors of the two classes are given by

$$
\mathbf{m}_{1} = \frac{1}{N_{1}} \sum_{n \in \mathcal{C}_{1}} \mathbf{x}_{n}, \quad \mathbf{m}_{2} = \frac{1}{N_{2}} \sum_{n \in \mathcal{C}_{2}} \mathbf{x}_{n}.\tag{4.21}
$$

The simplest measure of the separation of the classes, when projected onto , is the separation of the projected class means. This suggests that we might choose  so as to maximize

$$
m_{2} - m_{1} = \mathbf{w}^{\mathrm{T}}(\mathbf{m}_{2} - \mathbf{m}_{1})\tag{4.22}
$$

where

$$
m_{k} = \mathbf{w}^{\mathrm{T}} \mathbf{m}_{k}\tag{4.23}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/21d643a8f0940bb1a699b87b44746b5fa646ea8ae12adf68b4fcfb3ce549f4c8.jpg)

![Figure 4.6](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/17549fcb9114e1501401e2b8c70a7823074a13d0d817dfb1ccb47b2d13913e95.jpg)  
Figure 4.6 The left plot shows samples from two classes (depicted in red and blue) along with the histograms resulting from projection onto the line joining the class means. Note that there is considerable class overlap in the projected space. The right plot shows the corresponding projection based on the Fisher linear discriminant, showing the greatly improved class separation.

is the mean of the projected data from class $\mathcal{C}_{k}$ . However, this expression can be made arbitrarily large simply by increasing the magnitude of . To solve this problem, we could constrain to have unit length, so that $\textstyle \sum_{i} w_{i}^{2} \ = \1$ Using a Lagrange multiplier to perform the constrained maximization, we then find that $\mathbf{w} \propto \left(\mathbf{m}_{2} - \mathbf{m}_{1} \right)$ . There is still a problem with this approach, however, as illustrated in Figure 4.6. This shows two classes that are well separated in the original twodimensional space $(x_{1}, x_{2})$ but that have considerable overlap when projected onto the line joining their means. This difficulty arises from the strongly nondiagonal covariances of the class distributions. The idea proposed by Fisher is to maximize a function that will give a large separation between the projected class means while also giving a small variance within each class, thereby minimizing the class overlap.

The projection formula (4.20) transforms the set of labelled data points in <sup>x</sup>into a labelled set in the one-dimensional space y. The within-class variance of the transformed data from class $\mathcal{C}_{k}$ is therefore given by

$$
s_{k}^{2} = \sum_{n \in \mathcal{C}_{k}}(y_{n} - m_{k})^{2}\tag{4.24}
$$

where $y_{n} = \mathbf{w}^{\mathrm{T}} \mathbf{x}_{n}$ . We can define the total within-class variance for the whole <sup>w x</sup>data set to be simply $s_{1}^{2} + s_{2}^{2}$ . The Fisher criterion is defined to be the ratio of the between-class variance to the within-class variance and is given by

$$
J(\mathbf{w}) = \frac{(m_{2} - m_{1})^{2}}{s_{1}^{2} + s_{2}^{2}}.\tag{4.25}
$$

We can make the dependence on  explicit by using (4.20), (4.23), and (4.24) to <sup>w</sup>rewrite the Fisher criterion in the form

$$
J(\mathbf{w}) = \frac{\mathbf{w}^{\mathrm{T}} \mathbf{S}_{\mathrm{B}} \mathbf{w}}{\mathbf{w}^{\mathrm{T}} \mathbf{S}_{\mathrm{W}} \mathbf{w}}\tag{4.26}
$$

where $\mathbf{S}_{\mathrm{B}}$ is the between-class covariance matrix and is given by

$$
\mathbf{S}_{\mathrm{B}} =(\mathbf{m}_{2} - \mathbf{m}_{1})(\mathbf{m}_{2} - \mathbf{m}_{1})^{\mathrm{T}}\tag{4.27}
$$

and $\mathbf{S}_{\mathrm{W}}$ is the total within-class covariance matrix, given by

$$
\mathbf{S}_{\mathrm{W}} = \sum_{n \in \mathcal{C}_{1}}(\mathbf{x}_{n} - \mathbf{m}_{1})(\mathbf{x}_{n} - \mathbf{m}_{1})^{\mathrm{T}} + \sum_{n \in \mathcal{C}_{2}}(\mathbf{x}_{n} - \mathbf{m}_{2})(\mathbf{x}_{n} - \mathbf{m}_{2})^{\mathrm{T}}.\tag{4.28}
$$

Differentiating (4.26) with respect to , we find that $J(\mathbf{w})$ is maximized when

$$
(\mathbf{w}^{\mathrm{T}} \mathbf{S}_{\mathrm{B}} \mathbf{w}) \mathbf{S}_{\mathrm{W}} \mathbf{w} =(\mathbf{w}^{\mathrm{T}} \mathbf{S}_{\mathrm{W}} \mathbf{w}) \mathbf{S}_{\mathrm{B}} \mathbf{w}.\tag{4.29}
$$

From (4.27), we see that $\mathbf{S}_{\mathrm{B}} \mathbf{w}$ is always in the direction of $\left(\mathbf{m}_{2} - \mathbf{m}_{1} \right)$ . Furthermore, we do not care about the magnitude of , only its direction, and so we can drop the scalar factors $\left({\bf w}^{\mathrm{T}}{\bf S}_{\mathrm{B}}{\bf w} \right)$ and $\big(\mathbf{w}^{\mathrm{T}} \mathbf{S}_{\mathrm{W}} \mathbf{w} \big)$ . Multiplying both sides of (4.29) by $\mathbf{S}_{\mathrm{W}}^{- 1}$ we then obtain

$$
\mathbf{w} \propto \mathbf{S}_{\mathrm{W}}^{- 1}(\mathbf{m}_{2} - \mathbf{m}_{1}).\tag{4.30}
$$

Note that if the within-class covariance is isotropic, so that $\mathbf{S}_{\mathrm{W}}$ is proportional to the unit matrix, we find that  is proportional to the difference of the class means, as discussed above.

The result (4.30) is known as Fisher’s linear discriminant, although strictly it is not a discriminant but rather a specific choice of direction for projection of the data down to one dimension. However, the projected data can subsequently be used to construct a discriminant, by choosing a threshold $y_{0}$ so that we classify a new point as belonging to $\mathcal{C}_{1}$ if $y(\mathbf{x}) \geqslant y_{0}$ and classify it as belonging to $\mathcal{C}_{2}$ otherwise. For example, we can model the class-conditional densities $p(\boldsymbol{y} | \mathcal{C}_{k})$ using Gaussian distributions and then use the techniques of Section 1.2.4 to find the parameters of the Gaussian distributions by maximum likelihood. Having found Gaussian approximations to the projected classes, the formalism of Section 1.5.1 then gives an expression for the optimal threshold. Some justification for the Gaussian assumption comes from the central limit theorem by noting that $y = \mathbf{w}^{\mathrm{T}} \mathbf{x}$ is the sum of a set of random variables.

## 4.1.5 Relation to least squares

The least-squares approach to the determination of a linear discriminant was based on the goal of making the model predictions as close as possible to a set of target values. By contrast, the Fisher criterion was derived by requiring maximum class separation in the output space. It is interesting to see the relationship between these two approaches. In particular, we shall show that, for the two-class problem, the Fisher criterion can be obtained as a special case of least squares.

So far we have considered $1{\mathrm{- of}}{\mathrm{-}} K$ coding for the target values. If, however, we adopt a slightly different target coding scheme, then the least-squares solution for the weights becomes equivalent to the Fisher solution (Duda and Hart, 1973). In particular, we shall take the targets for class $\mathcal{C}_{1}$ to be $N / N_{1}$ , where $N_{1}$ is the number of patterns in class $\mathcal{C}_{1}$ , and $\dot{N}$ is the total number of patterns. This target value approximates the reciprocal of the prior probability for class $\mathcal{C}_{1}$ . For class $\mathcal{C}_{2}$ , we shall take the targets to be $- N / N_{2}$ , where $N_{2}$ is the number of patterns in class $\mathcal{C}_{2}$

The sum-of-squares error function can be written

$$
E = \frac{1}{2} \sum_{n = 1}^{N} \left(\mathbf{w}^{\mathrm{T}} \mathbf{x}_{n} + w_{0} - t_{n}\right)^{2}.\tag{4.31}
$$

Setting the derivatives of $E$ with respect to $w_{0}$ and  to zero, we obtain respectively

$$
\sum_{n = 1}^{N} \left(\mathbf{w}^{\mathrm{T}} \mathbf{x}_{n} + w_{0} - t_{n}\right) = 0\tag{4.32}
$$

$$
\sum_{n = 1}^{N} \left(\mathbf{w}^{\mathrm{T}} \mathbf{x}_{n} + w_{0} - t_{n}\right) \mathbf{x}_{n} = 0.\tag{4.33}
$$

From (4.32), and making use of our choice of target coding scheme for the $t_{n}$ , we obtain an expression for the bias in the form

$$
w_{0} = - \mathbf{w}^{\mathrm{T}} \mathbf{m}\tag{4.34}
$$

where we have used

$$
\sum_{n = 1}^{N} t_{n} = N_{1} \frac{N}{N_{1}} - N_{2} \frac{N}{N_{2}} = 0\tag{4.35}
$$

and where  is the mean of the total data set and is given by

$$
\mathbf{m} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n} = \frac{1}{N}(N_{1} \mathbf{m}_{1} + N_{2} \mathbf{m}_{2}).\tag{4.36}
$$

Exercise 4.6

After some straightforward algebra, and again making use of the choice of $t_{n}$ , the second equation (4.33) becomes

$$
\left(\mathbf{S}_{\mathrm{W}} + \frac{N_{1} N_{2}}{N} \mathbf{S}_{\mathrm{B}}\right) \mathbf{w} = N(\mathbf{m}_{1} - \mathbf{m}_{2})\tag{4.37}
$$

where $\mathbf{S}_{\mathrm{W}}$ is defined by (4.28), $\mathbf{S}_{\mathrm{B}}$ is defined by (4.27), and we have substituted for the bias using (4.34). Using (4.27), we note that $\mathbf{S}_{\mathrm{B}} \mathbf{w}$ is always in the direction of $\left(\mathbf{m}_{2} - \mathbf{m}_{1} \right)$ . Thus we can write

$$
\mathbf{w} \propto \mathbf{S}_{\mathrm{W}}^{- 1}(\mathbf{m}_{2} - \mathbf{m}_{1})\tag{4.38}
$$

where we have ignored irrelevant scale factors. Thus the weight vector coincides with that found from the Fisher criterion. In addition, we have also found an expression for the bias value $w_{0}$ given by (4.34). This tells us that a new vector  should be classified as belonging to class $\mathcal{C}_{1} \mathrm{if} y(\mathbf{x}) = \mathbf{w}^{\mathrm{T}}(\mathbf{x} - \mathbf{m}) > 0$ and class $\mathcal{C}_{2}$ <sup>x</sup>otherwise.

## 4.1.6 Fisher’s discriminant for multiple classes

We now consider the generalization of the Fisher discriminant to $K > 2$ classes, and we shall assume that the dimensionality D of the input space is greater than the number K of classes. Next, we introduce $D^{\prime} > 1$ linear ‘features’ $y_{k} = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x}.$ , where $k = 1, \ldots, D^{\prime}$ <sup>w x</sup>. These feature values can conveniently be grouped together to form a vector . Similarly, the weight vectors $\left\{\mathbf{w}_{k} \right\}$ can be considered to be the columns of a matrix , so that

$$
\mathbf{y} = \mathbf{W}^{\mathrm{T}} \mathbf{x}.\tag{4.39}
$$

Note that again we are not including any bias parameters in the definition of $\mathbf{y}.$ . The generalization of the within-class covariance matrix to the case of K classes follows from (4.28) to give

$$
\mathbf{S}_{\mathrm{W}} = \sum_{k = 1}^{K} \mathbf{S}_{k}\tag{4.40}
$$

where

$$
\mathbf{S}_{k} = \sum_{n \in \mathcal{C}_{k}}(\mathbf{x}_{n} - \mathbf{m}_{k})(\mathbf{x}_{n} - \mathbf{m}_{k})^{\mathrm{T}}\tag{4.41}
$$

$$
{\bf m}_{k} = \frac{1}{N_{k}} \sum_{n \in \mathcal{C}_{k}}{\bf x}_{n}\tag{4.42}
$$

and $N_{k}$ is the number of patterns in class $\mathcal{C}_{k}$ . In order to find a generalization of the between-class covariance matrix, we follow Duda and Hart (1973) and consider first the total covariance matrix

$$
\mathbf{S}_{\mathrm{T}} = \sum_{n = 1}^{N}(\mathbf{x}_{n} - \mathbf{m})(\mathbf{x}_{n} - \mathbf{m})^{\mathrm{T}}\tag{4.43}
$$

where is the mean of the total data set

$$
\mathbf{m} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n} = \frac{1}{N} \sum_{k = 1}^{K} N_{k} \mathbf{m}_{k}\tag{4.44}
$$

and $\begin{array}{r}{N = \sum_{k} N_{k}} \end{array}$ is the total number of data points. The total covariance matrix can be decomposed into the sum of the within-class covariance matrix, given by (4.40) and (4.41), plus an additional matrix $\mathbf{S}_{\mathrm{B}}$ , which we identify as a measure of the between-class covariance

$$
\mathbf{S}_{\mathrm{T}} = \mathbf{S}_{\mathrm{W}} + \mathbf{S}_{\mathrm{B}}\tag{4.45}
$$

where

$$
\mathbf{S}_{\mathrm{B}} = \sum_{k = 1}^{K} N_{k}(\mathbf{m}_{k} - \mathbf{m})(\mathbf{m}_{k} - \mathbf{m})^{\mathrm{T}}.\tag{4.46}
$$

These covariance matrices have been defined in the original -space. We can now define similar matrices in the projected $D^{\prime}$ <sup>x</sup>-dimensional -space

$$
\mathbf{s}_{\mathrm{W}} = \sum_{k = 1}^{K} \sum_{n \in \mathcal{C}_{k}}(\mathbf{y}_{n} - \boldsymbol{\mu}_{k})(\mathbf{y}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}}\tag{4.47}
$$

and

$$
\mathbf{s}_{\mathrm{B}} = \sum_{k = 1}^{K} N_{k}(\boldsymbol{\mu}_{k} - \boldsymbol{\mu})(\boldsymbol{\mu}_{k} - \boldsymbol{\mu})^{\mathrm{T}}\tag{4.48}
$$

where

$$
\boldsymbol{\mu}_{k} = \frac{1}{N_{k}} \sum_{n \in \mathcal{C}_{k}} \mathbf{y}_{n}, \quad \boldsymbol{\mu} = \frac{1}{N} \sum_{k = 1}^{K} N_{k} \boldsymbol{\mu}_{k}.\tag{4.49}
$$

Again we wish to construct a scalar that is large when the between-class covariance is large and when the within-class covariance is small. There are now many possible choices of criterion (Fukunaga, 1990). One example is given by

$$
J(\mathbf{W}) = \mathrm{Tr} \left\{\mathbf{s}_{\mathrm{W}}^{- 1} \mathbf{s}_{\mathrm{B}} \right\}.\tag{4.50}
$$

This criterion can then be rewritten as an explicit function of the projection matrix in the form

$$
J(\mathbf{w}) = \operatorname{Tr} \left\{\left(\mathbf{WS}_{\mathrm{W}} \mathbf{W}^{\mathrm{T}}\right)^{- 1} \left(\mathbf{WS}_{\mathrm{B}} \mathbf{W}^{\mathrm{T}}\right) \right\}.\tag{4.51}
$$

Maximization of such criteria is straightforward, though somewhat involved, and is discussed at length in Fukunaga (1990). The weight values are determined by those eigenvectors of $\bar{\bf S}_{\mathrm{W}}^{- 1}{\bf S}_{\mathrm{B}}$ that correspond to the $D^{\prime}$ largest eigenvalues.

<sup>S S</sup>There is one important result that is common to all such criteria, which is worth emphasizing. We first note from (4.46) that $\mathbf{S}_{\mathrm{B}}$ is composed of the sum of K ma-<sup>S</sup>trices, each of which is an outer product of two vectors and therefore of rank 1. In addition, only $(K - 1)$ of these matrices are independent as a result of the constraint (4.44). Thus, $\mathbf{S}_{\mathrm{B}}$ has rank at most equal to $(K - \bar{1})$ and so there are at most $(K - 1)$ nonzero eigenvalues. This shows that the projection onto the $(K - 1)$ -dimensional subspace spanned by the eigenvectors of $\mathbf{S}_{\mathrm{B}}$ does not alter the value of $J(\mathbf{w})$ , and <sup>S</sup>so we are therefore unable to find more than $(K - 1)$ <sup>w</sup>linear ‘features’ by this means (Fukunaga, 1990).

## 4.1.7 The perceptron algorithm

Another example of a linear discriminant model is the perceptron of Rosenblatt (1962), which occupies an important place in the history of pattern recognition algorithms. It corresponds to a two-class model in which the input vector is first <sup>x</sup>transformed using a fixed nonlinear transformation to give a feature vector $\phi(\mathbf{x})$ , and this is then used to construct a generalized linear model of the form

$$
y(\mathbf{x}) = f \left(\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x})\right)\tag{4.52}
$$

where the nonlinear activation function $f(\cdot)$ is given by a step function of the form

$$
f(a) = \left\{\begin{array}{ll} + 1, & a \geqslant 0 \\ - 1, & a < 0.\end{array} \right.\tag{4.53}
$$

The vector $\phi(\mathbf{x})$ will typically include a bias component $\phi_{0}(\mathbf{x}) = 1$ . In earlier <sup>x x</sup>discussions of two-class classification problems, we have focussed on a target coding scheme in which $t \in \{0, 1\}$ , which is appropriate in the context of probabilistic models. For the perceptron, however, it is more convenient to use target values $t = + 1$ for class $\mathcal{C}_{1}$ and $t = - 1$ for class $\mathcal{C}_{2}$ , which matches the choice of activation function.

The algorithm used to determine the parameters  of the perceptron can most <sup>w</sup>easily be motivated by error function minimization. A natural choice of error function would be the total number of misclassified patterns. However, this does not lead to a simple learning algorithm because the error is a piecewise constant function of , with discontinuities wherever a change in causes the decision boundary to <sup>w w</sup>move across one of the data points. Methods based on changing using the gradi-<sup>w</sup>ent of the error function cannot then be applied, because the gradient is zero almost everywhere.

We therefore consider an alternative error function known as the perceptron criterion. To derive this, we note that we are seeking a weight vector such that patterns ${\bf x}_{n}$ in class $\mathcal{C}_{1}$ will have $\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) > 0$ , whereas patterns ${\bf x}_{n}$ <sup>w</sup>in class $\mathcal{C}_{2}$ have ${\bf w}^{\mathrm{T}} \phi({\bf x}_{n}) < 0$ . Using the $t \in \{- 1, + 1\}$ <sup>x</sup>target coding scheme it follows that <sup>w x</sup>we would like all patterns to satisfy $\mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) t_{n} \ > \0$ The perceptron criterion <sup>w x</sup>associates zero error with any pattern that is correctly classified, whereas for a misclassified pattern ${\bf x}_{n}$ it tries to minimize the quantity $- \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) t_{n}$ . The perceptron <sup>x</sup>criterion is therefore given by

$$
E_{\mathbb{P}}(\mathbf{w}) = - \sum_{n \in \mathcal{M}} \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n} t_{n}\tag{4.54}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/be460e43f64aa27cb93c4e45a8c07aed630e1081ada11c1504d40bacddc6e788.jpg)

## Frank Rosenblatt 1928–1969

Rosenblatt’s perceptron played an important role in the history of machine learning. Initially, Rosenblatt simulated the perceptron on an IBM 704 computer at Cornell in 1957, but by the early 1960s he had built special-purpose hardware that provided a direct, parallel implementation of perceptron learning. Many of his ideas were encapsulated in “Principles of Neurodynamics: Perceptrons and the Theory of Brain Mechanisms” published in 1962. Rosenblatt’s work was criticized by Marvin Minksy, whose objections were published in the book “Perceptrons”, co-authored with

Seymour Papert. This book was widely misinterpreted at the time as showing that neural networks were fatally flawed and could only learn solutions for linearly separable problems. In fact, it only proved such limitations in the case of single-layer networks such as the perceptron and merely conjectured (incorrectly) that they applied to more general network models. Unfortunately, however, this book contributed to the substantial decline in research funding for neural computing, a situation that was not reversed until the mid-1980s. Today, there are many hundreds, if not thousands, of applications of neural networks in widespread use, with examples in areas such as handwriting recognition and information retrieval being used routinely by millions of people.

where denotes the set of all misclassified patterns. The contribution to the error associated with a particular misclassified pattern is a linear function of in regions <sup>w</sup>of  space where the pattern is misclassified and zero in regions where it is correctly <sup>w</sup>classified. The total error function is therefore piecewise linear.

We now apply the stochastic gradient descent algorithm to this error function. The change in the weight vector  is then given by

$$
\mathbf{w}^{(\tau + 1)} = \mathbf{w}^{(\tau)} - \eta \nabla E_{\mathbb{P}}(\mathbf{w}) = \mathbf{w}^{(\tau)} + \eta \phi_{n} t_{n}\tag{4.55}
$$

where $\eta$ is the learning rate parameter and $\tau$ is an integer that indexes the steps of the algorithm. Because the perceptron function $y(\mathbf{x}, \mathbf{w})$ is unchanged if we multiply by a constant, we can set the learning rate parameter $\eta$ equal to 1 without of generality. Note that, as the weight vector evolves during training, the set of patterns that are misclassified will change.

The perceptron learning algorithm has a simple interpretation, as follows. We cycle through the training patterns in turn, and for each pattern ${\bf x}_{n}$ we evaluate the perceptron function (4.52). If the pattern is correctly classified, then the weight vector remains unchanged, whereas if it is incorrectly classified, then for class $\mathcal{C}_{1}$ we add the vector $\phi({\mathbf{x}}_{n})$ onto the current estimate of weight vector while for class $\mathcal{C}_{2}$ <sup>x</sup>we subtract the vector $\phi({\mathbf{x}}_{n})$ from $\mathbf{w}.$ . The perceptron learning algorithm is illustrated in Figure 4.7.

If we consider the effect of a single update in the perceptron learning algorithm, we see that the contribution to the error from a misclassified pattern will be reduced because from (4.55) we have

$$
- \mathbf{w}^{(\tau + 1) \mathrm{T}} \boldsymbol{\phi}_{n} t_{n} = - \mathbf{w}^{(\tau) \mathrm{T}} \boldsymbol{\phi}_{n} t_{n} -(\boldsymbol{\phi}_{n} t_{n})^{\mathrm{T}} \boldsymbol{\phi}_{n} t_{n} < - \mathbf{w}^{(\tau) \mathrm{T}} \boldsymbol{\phi}_{n} t_{n}\tag{4.56}
$$

where we have set $\eta = 1$ , and made use of $\| \phi_{n} t_{n} \|^{2} > 0$ . Of course, this does not imply that the contribution to the error function from the other misclassified patterns will have been reduced. Furthermore, the change in weight vector may have caused some previously correctly classified patterns to become misclassified. Thus the perceptron learning rule is not guaranteed to reduce the total error function at each stage.

However, the perceptron convergence theorem states that if there exists an exact solution (in other words, if the training data set is linearly separable), then the perceptron learning algorithm is guaranteed to find an exact solution in a finite number of steps. Proofs of this theorem can be found for example in Rosenblatt (1962), Block (1962), Nilsson (1965), Minsky and Papert (1969), Hertz et al. (1991), and Bishop (1995a). Note, however, that the number of steps required to achieve convergence could still be substantial, and in practice, until convergence is achieved, we will not be able to distinguish between a nonseparable problem and one that is simply slow to converge.

Even when the data set is linearly separable, there may be many solutions, and which one is found will depend on the initialization of the parameters and on the order of presentation of the data points. Furthermore, for data sets that are not linearly separable, the perceptron learning algorithm will never converge.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/96accc28ee2857742466c0cd8ac0e954aea3c67fa3378ad47c5941ffedeb5add.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/cf17d07801542f73827dd61ebfc419e002c95ac624a0314905b6877f31ea4ab2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/f47dd73a99bbb3ab025cd2506b9867a542c906d76286b4b2ab3e9845945f5a66.jpg)

![Figure 4.7](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/b9a8e9482802cbb885002a4cad08cb827cb3b5d70a4d1eebbedf04a1f0910f7b.jpg)  
Figure 4.7 Illustration of the convergence of the perceptron learning algorithm, showing data points from two classes (red and blue) in a two-dimensional feature space $(\phi_{1}, \phi_{2})$ . The top left plot shows the initial parameter vector w shown as a black arrow together with the corresponding decision boundary (black line), in which the arrow points towards the decision region which classified as belonging to the red class. The data point circled in green is misclassified and so its feature vector is added to the current weight vector, giving the new decision boundary shown in the top right plot. The bottom left plot shows the next misclassified point to be considered, indicated by the green circle, and its feature vector is again added to the weight vector giving the decision boundary shown in the bottom right plot for which all data points are correctly classified.

![Figure 4.8](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/1633220d177ccd39e95aabf82f2588ec447d6b34456d5be000c964fe17e3d650.jpg)  
Figure 4.8 Illustration of the Mark 1 perceptron hardware. The photograph on the left shows how the inputs were obtained using a simple camera system in which an input scene, in this case a printed character, was illuminated by powerful lights, and an image focussed onto a 20 20 array of cadmium sulphide photocells, giving a primitive 400 pixel image. The perceptron also had a patch board, shown in the middle photograph, which allowed different configurations of input features to be tried. Often these were wired up at random to demonstrate the ability of the perceptron to learn without the need for precise wiring, in contrast to a modern digital computer. The photograph on the right shows one of the racks of adaptive weights. Each weight was implemented using a rotary variable resistor, also called a potentiometer, driven by an electric motor thereby allowing the value of the weight to be adjusted automatically by the learning algorithm.

Aside from difficulties with the learning algorithm, the perceptron does not provide probabilistic outputs, nor does it generalize readily to K > 2 classes. The most important limitation, however, arises from the fact that (in common with all of the models discussed in this chapter and the previous one) it is based on linear combinations of fixed basis functions. More detailed discussions of the limitations of perceptrons can be found in Minsky and Papert (1969) and Bishop (1995a).

Analogue hardware implementations of the perceptron were built by Rosenblatt, based on motor-driven variable resistors to implement the adaptive parameters $w_{j}$ These are illustrated in Figure 4.8. The inputs were obtained from a simple camera system based on an array of photo-sensors, while the basis functions φ could be chosen in a variety of ways, for example based on simple fixed functions of randomly chosen subsets of pixels from the input image. Typical applications involved learning to discriminate simple shapes or characters.

At the same time that the perceptron was being developed, a closely related system called the adaline, which is short for ‘adaptive linear element’, was being explored by Widrow and co-workers. The functional form of the model was the same as for the perceptron, but a different approach to training was adopted (Widrow and Hoff, 1960; Widrow and Lehr, 1990).

## 4.2. Probabilistic Generative Models

We turn next to a probabilistic view of classification and show how models with linear decision boundaries arise from simple assumptions about the distribution of the data. In Section 1.5.4, we discussed the distinction between the discriminative and the generative approaches to classification. Here we shall adopt a generative

Plot of the logistic sigmoid function $\sigma(a)$ defined by (4.59), shown in red, together with the scaled probit function $\Phi(\lambda a)$ , for $\lambda^{2} \ = \ \dot{\pi} / 8,$ shown in dashed blue, where Φ(a) is defined by (4.114). The scaling factor $\pi / 8$ is chosen so that the derivatives of the two curves are equal for $a = 0$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/595c538fe15fa4b369567341eb6550389cc9602727b4ff8ff192c828875c2f84.jpg)

approach in which we model the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , as well as the class priors $p(\mathcal{C}_{k})$ , and then use these to compute posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ through Bayes’ theorem.

Consider first of all the case of two classes. The posterior probability for class $\mathcal{C}_{1}$ can be written as

$$
\begin{array}{rcl} p(\mathcal{C}_{1} | \mathbf{x}) & = & \frac{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1})}{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1}) + p(\mathbf{x} | \mathcal{C}_{2}) p(\mathcal{C}_{2})} \\ & = & \frac{1}{1 + \exp(- a)} = \sigma(a) \end{array}\tag{4.57}
$$

where we have defined

$$
a = \ln{\frac{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1})}{p(\mathbf{x} | \mathcal{C}_{2}) p(\mathcal{C}_{2})}}\tag{4.58}
$$

and $\sigma(a)$ is the logistic sigmoid function defined by

$$
\sigma(a) = \frac{1}{1 + \exp(- a)}\tag{4.59}
$$

which is plotted in Figure 4.9. The term ‘sigmoid’ means S-shaped. This type of function is sometimes also called a ‘squashing function’ because it maps the whole real axis into a finite interval. The logistic sigmoid has been encountered already in earlier chapters and plays an important role in many classification algorithms. It satisfies the following symmetry property

$$
\sigma(- a) = 1 - \sigma(a)\tag{4.60}
$$

as is easily verified. The inverse of the logistic sigmoid is given by

$$
a = \ln \left(\frac{\sigma}{1 - \sigma}\right)\tag{4.61}
$$

and is known as the logit function. It represents the log of the ratio of probabilities ln $[p(\mathcal{C}_{1} | \mathbf{x}) / p(\mathcal{C}_{2} | \mathbf{x})]$ for the two classes, also known as the log odds.

Note that in (4.57) we have simply rewritten the posterior probabilities in an equivalent form, and so the appearance of the logistic sigmoid may seem rather vacuous. However, it will have significance provided $a(\mathbf{x})$ takes a simple functional form. We shall shortly consider situations in which $a(\mathbf{x})$ is a linear function of $\mathbf{x},$ in <sup>x</sup>which case the posterior probability is governed by a generalized linear model.

For the case of $K > 2$ classes, we have

$$
\begin{array}{rcl} p(\mathcal{C}_{k} | \mathbf{x}) & = & \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{\sum_{j} p(\mathbf{x} | \mathcal{C}_{j}) p(\mathcal{C}_{j})} \\ & = & \frac{\exp(a_{k})}{\sum_{j} \exp(a_{j})} \end{array}\tag{4.62}
$$

which is known as the normalized exponential and can be regarded as a multiclass generalization of the logistic sigmoid. Here the quantities $a_{k}$ are defined by

$$
a_{k} = \ln p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k}).\tag{4.63}
$$

The normalized exponential is also known as the softmax function, as it represents a smoothed version of the ‘max’ function because, if $a_{k} \gg a_{j}$ for all $j \neq k$ , then $p(\mathcal{C}_{k} | \mathbf{x}) \simeq 1$ , and $p(\mathcal{C}_{j} | \mathbf{x}) \simeq 0$

<sup>x x</sup>We now investigate the consequences of choosing specific forms for the classconditional densities, looking first at continuous input variables  and then discussing briefly the case of discrete inputs.

## 4.2.1 Continuous inputs

Let us assume that the class-conditional densities are Gaussian and then explore the resulting form for the posterior probabilities. To start with, we shall assume that all classes share the same covariance matrix. Thus the density for class $\mathcal{C}_{k}$ is given by

$$
p(\mathbf{x} | \mathcal{C}_{k}) = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{| \boldsymbol{\Sigma} |^{1 / 2}} \exp \left\{- \frac{1}{2}(\mathbf{x} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x} - \boldsymbol{\mu}_{k}) \right\}.\tag{4.64}
$$

Consider first the case of two classes. From (4.57) and (4.58), we have

$$
p(\mathcal{C}_{1} | \mathbf{x}) = \sigma(\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0})\tag{4.65}
$$

where we have defined

$$
\mathbf{w} = \boldsymbol{\Sigma}^{- 1}(\boldsymbol{\mu}_{1} - \boldsymbol{\mu}_{2})\tag{4.66}
$$

$$
w_{0} = - \frac{1}{2} \boldsymbol{\mu}_{1}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \boldsymbol{\mu}_{1} + \frac{1}{2} \boldsymbol{\mu}_{2}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \boldsymbol{\mu}_{2} + \ln \frac{p(\mathcal{C}_{1})}{p(\mathcal{C}_{2})}.\tag{4.67}
$$

We see that the quadratic terms in  from the exponents of the Gaussian densities <sup>x</sup>have cancelled (due to the assumption of common covariance matrices) leading to a linear function of  in the argument of the logistic sigmoid. This result is illustrated for the case of a two-dimensional input space  in Figure 4.10. The resulting decision boundaries correspond to surfaces along which the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ are constant and so will be given by linear functions of $\mathbf{x},$ and therefore the decision boundaries are linear in input space. The prior probabilities $p(\mathcal{C}_{k})$ enter only through the bias parameter $w_{0}$ so that changes in the priors have the effect of making parallel shifts of the decision boundary and more generally of the parallel contours of constant posterior probability.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/98b7b95c18125d3834b5bdb18e80496763e307da1c73bda726e932b5b7166ee1.jpg)

![Figure 4.10](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/3d27c251aeefc20ec6ad3f903943235aee5d1d0448d8f4cd1b79d6406c8fad86.jpg)  
Figure 4.10 The left-hand plot shows the class-conditional densities for two classes, denoted red and blue. On the right is the corresponding posterior probability $p(\mathcal{C}_{1} | \mathbf{x})$ , which is given by a logistic sigmoid of a linear function of x. The surface in the right-hand plot is coloured using a proportion of red ink given by $p(\mathcal{C}_{1} | \mathbf{x})$ and a proportion of blue ink given by $p(\mathcal{C}_{2} \vert \mathbf{x}) = 1 - p(\mathcal{C}_{1} \vert \mathbf{x})$

For the general case of K classes we have, from (4.62) and (4.63),

$$
a_{k}(\mathbf{x}) = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x} + w_{k0}\tag{4.68}
$$

where we have defined

$$
{\bf w}_{k} ={\bf \Sigma}^{- 1}{\pmb \mu}_{k}\tag{4.69}
$$

$$
{w_{k0}} ={- \frac{1}{2} \pmb{\mu}_{k}^{\mathrm{T}} \pmb{\Sigma}^{- 1} \pmb{\mu}_{k} + \ln p(\mathcal{C}_{k}).}\tag{4.70}
$$

We see that the $a_{k}({\bf x})$ are again linear functions of  as a consequence of the cancellation of the quadratic terms due to the shared covariances. The resulting decision boundaries, corresponding to the minimum misclassification rate, will occur when two of the posterior probabilities (the two largest) are equal, and so will be defined by linear functions of , and so again we have a generalized linear model.

<sup>x</sup>If we relax the assumption of a shared covariance matrix and allow each classconditional density $p(\mathbf{x} | \mathcal{C}_{k})$ to have its own covariance matrix $\Sigma_{k}$ , then the earlier <sup>x Σ</sup>cancellations will no longer occur, and we will obtain quadratic functions of , giv-<sup>x</sup>ing rise to a quadratic discriminant. The linear and quadratic decision boundaries are illustrated in Figure 4.11.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/cbca20f96a5eb8bb0e7862c10664ab8ab8f817b0b0fb105c4bd2fda1fe4a4514.jpg)

![Figure 4.11](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/b49749ddac5ee260d70f71179a4782e48a27b65de571e7f935f8df5be0f0a25f.jpg)  
Figure 4.11 The left-hand plot shows the class-conditional densities for three classes each having a Gaussian distribution, coloured red, green, and blue, in which the red and green classes have the same covariance matrix. The right-hand plot shows the corresponding posterior probabilities, in which the RGB colour vector represents the posterior probabilities for the respective three classes. The decision boundaries are also shown. Notice that the boundary between the red and green classes, which have the same covariance matrix, is linear, whereas those between the other pairs of classes are quadratic.

## 4.2.2 Maximum likelihood solution

Once we have specified a parametric functional form for the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , we can then determine the values of the parameters, together with <sup>x</sup>the prior class probabilities $p(\mathcal{C}_{k})$ , using maximum likelihood. This requires a data set comprising observations of along with their corresponding class labels.

<sup>x</sup>Consider first the case of two classes, each having a Gaussian class-conditional density with a shared covariance matrix, and suppose we have a data set $\{\mathbf{x}_{n}, t_{n}\}$ where $n = 1, \ldots, N$ . Here $t_{n} = 1$ denotes class $\mathcal{C}_{1}$ and $t_{n} = 0$ denotes class $\mathcal{C}_{2}$ . We denote the prior class probability $p(\mathcal{C}_{1}) = \pi$ , so that $p(\mathcal{C}_{2}) = 1 - \pi$ . For a data point ${\bf x}_{n}$ from class $\mathcal{C}_{1}$ , we have $t_{n} = 1$ and hence

$$
p(\mathbf{x}_{n}, \mathcal{C}_{1}) = p(\mathcal{C}_{1}) p(\mathbf{x}_{n} | \mathcal{C}_{1}) = \pi \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{1}, \boldsymbol{\Sigma}).
$$

Similarly for class $\mathcal{C}_{2}$ , we have $t_{n} = 0$ and hence

$$
p(\mathbf{x}_{n}, \mathcal{C}_{2}) = p(\mathcal{C}_{2}) p(\mathbf{x}_{n} | \mathcal{C}_{2}) =(1 - \pi) \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{2}, \boldsymbol{\Sigma}).
$$

Thus the likelihood function is given by

$$
p(\mathbf{t} | \pi, \boldsymbol{\mu}_{1}, \boldsymbol{\mu}_{2}, \boldsymbol{\Sigma}) = \prod_{n = 1}^{N} \left[\pi \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{1}, \boldsymbol{\Sigma}) \right]^{t_{n}} \left[(1 - \pi) \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{2}, \boldsymbol{\Sigma}) \right]^{1 - t_{n}}\tag{4.71}
$$

where ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ . As usual, it is convenient to maximize the log of the likelihood function. Consider first the maximization with respect to $\pi.$ . The terms in the log likelihood function that depend on $\pi$ are

$$
\sum_{n = 1}^{N} \left\{t_{n} \ln \pi +(1 - t_{n}) \ln(1 - \pi) \right\}.\tag{4.72}
$$

Setting the derivative with respect to $\pi$ equal to zero and rearranging, we obtain

$$
\pi = \frac{1}{N} \sum_{n = 1}^{N} t_{n} = \frac{N_{1}}{N} = \frac{N_{1}}{N_{1} + N_{2}}\tag{4.73}
$$

where $N_{1}$ denotes the total number of data points in class $\mathcal{C}_{1}$ , and $N_{2}$ denotes the total number of data points in class $\mathcal{C}_{2}$ . Thus the maximum likelihood estimate for $\pi$ is simply the fraction of points in class $\mathcal{C}_{1}$ as expected. This result is easily generalized to the multiclass case where again the maximum likelihood estimate of the prior probability associated with class $\mathcal{C}_{k}$ is given by the fraction of the training set points assigned to that class.

Now consider the maximization with respect to $\pmb{\mu}_{1}$ . Again we can pick out of the log likelihood function those terms that depend on $\pmb{\mu}_{1}$ giving

$$
\sum_{n = 1}^{N} t_{n} \ln \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{1}, \boldsymbol{\Sigma}) = - \frac{1}{2} \sum_{n = 1}^{N} t_{n}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1}) + \text{const}.\tag{4.74}
$$

Setting the derivative with respect to $\pmb{\mu}_{1}$ to zero and rearranging, we obtain

$$
\pmb{\mu}_{1} = \frac{1}{N_{1}} \sum_{n = 1}^{N} t_{n} \mathbf{x}_{n}\tag{4.75}
$$

which is simply the mean of all the input vectors ${\bf x}_{n}$ assigned to class $\mathcal{C}_{1}$ . By a similar argument, the corresponding result for $\pmb{\mu}_{2}$ <sup>x</sup>is given by

$$
\boldsymbol{\mu}_{2} = \frac{1}{N_{2}} \sum_{n = 1}^{N}(1 - t_{n}) \mathbf{x}_{n}\tag{4.76}
$$

which again is the mean of all the input vectors ${\bf x}_{n}$ assigned to class $\mathcal{C}_{2}$ .

Finally, consider the maximum likelihood solution for the shared covariance matrix . Picking out the terms in the log likelihood function that depend on $\Sigma.$ , we have

$$
\begin{array}{l} - \frac{1}{2} \sum_{n = 1}^{N} t_{n} \ln | \boldsymbol{\Sigma} | - \frac{1}{2} \sum_{n = 1}^{N} t_{n}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1}) \\ - \frac{1}{2} \sum_{n = 1}^{N}(1 - t_{n}) \ln | \boldsymbol{\Sigma} | - \frac{1}{2} \sum_{n = 1}^{N}(1 - t_{n})(\mathbf{x}_{n} - \boldsymbol{\mu}_{2})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{2}) \\ = - \frac{N}{2} \ln | \boldsymbol{\Sigma} | - \frac{N}{2} \operatorname{Tr} \left\{\boldsymbol{\Sigma}^{- 1} \mathbf{S} \right\} \end{array}\tag{4.77}
$$

where we have defined

$$
\mathbf{S} = \frac{N_{1}}{N} \mathbf{S}_{1} + \frac{N_{2}}{N} \mathbf{S}_{2}\tag{4.78}
$$

$$
\mathbf{S}_{1} = \frac{1}{N_{1}} \sum_{n \in \mathcal{C}_{1}}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})^{\mathrm{T}}\tag{4.79}
$$

$$
\mathbf{S}_{2} = \frac{1}{N_{2}} \sum_{n \in \mathcal{C}_{2}}(\mathbf{x}_{n} - \boldsymbol{\mu}_{2})(\mathbf{x}_{n} - \boldsymbol{\mu}_{2})^{\mathrm{T}}.\tag{4.80}
$$

Using the standard result for the maximum likelihood solution for a Gaussian distribution, we see that $\mathbf{\Delta} \Sigma = \mathbf{S}$ , which represents a weighted average of the covariance <sup>Σ S</sup>matrices associated with each of the two classes separately.

This result is easily extended to the $K$ class problem to obtain the corresponding maximum likelihood solutions for the parameters in which each class-conditional density is Gaussian with a shared covariance matrix. Note that the approach of fitting Gaussian distributions to the classes is not robust to outliers, because the maximum likelihood estimation of a Gaussian is not robust.

## 4.2.3 Discrete features

Let us now consider the case of discrete feature values $x_{i}$ . For simplicity, we begin by looking at binary feature values $x_{i} \in \{0, 1\}$ and discuss the extension to more general discrete features shortly. If there are D inputs, then a general distribution would correspond to a table of $\mathrm{\dot{2}}^{D}$ numbers for each class, containing $2^{D} - 1$ independent variables (due to the summation constraint). Because this grows exponentially with the number of features, we might seek a more restricted representation. Here we will make the naive Bayes assumption in which the feature values are treated as independent, conditioned on the class $\mathcal{C}_{k}$ . Thus we have class-conditional distributions of the form

$$
p(\mathbf{x} | \mathcal{C}_{k}) = \prod_{i = 1}^{D} \mu_{ki}^{x_{i}}(1 - \mu_{ki})^{1 - x_{i}}\tag{4.81}
$$

which contain D independent parameters for each class. Substituting into (4.63) then gives

$$
a_{k}(\mathbf{x}) = \sum_{i = 1}^{D} \left\{x_{i} \ln \mu_{ki} +(1 - x_{i}) \ln(1 - \mu_{ki}) \right\} + \ln p(\mathcal{C}_{k})\tag{4.82}
$$

which again are linear functions of the input values $x_{i}$ . For the case of $K = 2$ classes, we can alternatively consider the logistic sigmoid formulation given by (4.57). Analogous results are obtained for discrete variables each of which can take $M \ > \2$ states.

## 4.2.4 Exponential family

As we have seen, for both Gaussian distributed and discrete inputs, the posterior class probabilities are given by generalized linear models with logistic sigmoid $(K =$

2 classes) or softmax $(K \geqslant 2$ classes) activation functions. These are particular cases of a more general result obtained by assuming that the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ are members of the exponential family of distributions.

Using the form (2.194) for members of the exponential family, we see that the distribution of can be written in the form

$$
p(\mathbf{x} | \boldsymbol{\lambda}_{k}) = h(\mathbf{x}) g(\boldsymbol{\lambda}_{k}) \exp \left\{\boldsymbol{\lambda}_{k}^{\mathrm{T}} \mathbf{u}(\mathbf{x}) \right\}.\tag{4.83}
$$

We now restrict attention to the subclass of such distributions for which $\mathbf{u}(\mathbf{x}) = \mathbf{x}$ <sup>u x x</sup>Then we make use of (2.236) to introduce a scaling parameter s, so that we obtain the restricted set of exponential family class-conditional densities of the form

$$
p(\mathbf{x} | \boldsymbol{\lambda}_{k}, s) = \frac{1}{s} h \left(\frac{1}{s} \mathbf{x}\right) g(\boldsymbol{\lambda}_{k}) \exp \left\{\frac{1}{s} \boldsymbol{\lambda}_{k}^{\mathrm{T}} \mathbf{x} \right\}.\tag{4.84}
$$

Note that we are allowing each class to have its own parameter vector $\lambda_{k}$ but we are assuming that the classes share the same scale parameter s.

For the two-class problem, we substitute this expression for the class-conditional densities into (4.58) and we see that the posterior class probability is again given by a logistic sigmoid acting on a linear function $a(\mathbf{x})$ which is given by

$$
a(\mathbf{x}) = \left(\boldsymbol{\lambda}_{1} - \boldsymbol{\lambda}_{2}\right)^{\mathrm{T}} \mathbf{x} + \ln g \left(\boldsymbol{\lambda}_{1}\right) - \ln g \left(\boldsymbol{\lambda}_{2}\right) + \ln p \left(\mathcal{C}_{1}\right) - \ln p \left(\mathcal{C}_{2}\right).\tag{4.85}
$$

Similarly, for the K-class problem, we substitute the class-conditional density expression into (4.63) to give

$$
a_{k}(\mathbf{x}) = \boldsymbol{\lambda}_{k}^{\mathrm{T}} \mathbf{x} + \ln g(\boldsymbol{\lambda}_{k}) + \ln p(\mathcal{C}_{k})\tag{4.86}
$$

and so again is a linear function of .

## 4.3. Probabilistic Discriminative Models

For the two-class classification problem, we have seen that the posterior probability of class $\mathcal{C}_{1}$ can be written as a logistic sigmoid acting on a linear function of , for a wide choice of class-conditional distributions $p(\mathbf{x} | \mathcal{C}_{k})$ <sup>x</sup>. Similarly, for the multiclass case, the posterior probability of class $\mathcal{C}_{k}$ is given by a softmax transformation of a linear function of . For specific choices of the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , we have used maximum likelihood to determine the parameters of the densities as well as the class priors $p(\mathcal{C}_{k})$ and then used Bayes’ theorem to find the posterior class probabilities.

However, an alternative approach is to use the functional form of the generalized linear model explicitly and to determine its parameters directly by using maximum likelihood. We shall see that there is an efficient algorithm finding such solutions known as iterative reweighted least squares, or IRLS.

The indirect approach to finding the parameters of a generalized linear model, by fitting class-conditional densities and class priors separately and then applying

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/c467612a58b2594fa1453ef1cdc2e16597f87c2bf24f064e9f34a9eee1f8eee4.jpg)

![Figure 4.12](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/cf517a66c73366e7bc7bd1ac179c8d614ce66d3392352cd7d0ae400f14b54b3f.jpg)  
Figure 4.12 Illustration of the role of nonlinear basis functions in linear classification models. The left plot shows the original input space $(x_{1}, x_{2})$ together with data points from two classes labelled red and blue. Two ‘Gaussian’ basis functions φ1(x) and $\phi_{2}(\mathbf{x})$ are defined in this space with centres shown by the green crosses and with contours shown by the green circles. The right-hand plot shows the corresponding feature space $\left(\phi_{1}, \phi_{2} \right)$ together with the linear decision boundary obtained given by a logistic regression model of the form discussed in Section 4.3.2. This corresponds to a nonlinear decision boundary in the original input space, shown by the black curve in the left-hand plot.

Bayes’ theorem, represents an example of generative modelling, because we could take such a model and generate synthetic data by drawing values of from the marginal distribution $p(\mathbf{x})$ <sup>x</sup>. In the direct approach, we are maximizing a likelihood <sup>x</sup>function defined through the conditional distribution $p(\mathcal{C}_{k} \vert \mathbf{x})$ , which represents a form of discriminative training. One advantage of the discriminative approach is that there will typically be fewer adaptive parameters to be determined, as we shall see shortly. It may also lead to improved predictive performance, particularly when the class-conditional density assumptions give a poor approximation to the true distributions.

## 4.3.1 Fixed basis functions

So far in this chapter, we have considered classification models that work directly with the original input vector . However, all of the algorithms are equally applicable if we first make a fixed nonlinear transformation of the inputs using a vector of basis functions $\phi(\mathbf{x})$ . The resulting decision boundaries will be linear in the feature space $\phi,$ and these correspond to nonlinear decision boundaries in the original space, as illustrated in Figure 4.12. Classes that are linearly separable <sup>x</sup>in the feature space $\phi(\mathbf{x})$ need not be linearly separable in the original observation space . Note that as in our discussion of linear models for regression, one of the basis functions is typically set to a constant, say $\phi_{0}(\mathbf{x}) = 1$ , so that the corresponding parameter $w_{0}$ <sup>x</sup>plays the role of a bias. For the remainder of this chapter, we shall include a fixed basis function transformation $\phi(\mathbf{x})$ , as this will highlight some useful <sup>x</sup>similarities to the regression models discussed in Chapter 3.

For many problems of practical interest, there is significant overlap between the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ . This corresponds to posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ <sup>x</sup>, which, for at least some values of $\mathbf{x},$ are not 0 or 1. In such cases, the optimal solution is obtained by modelling the posterior probabilities accurately and then applying standard decision theory, as discussed in Chapter 1. Note that nonlinear transformations $\phi(\mathbf{x})$ cannot remove such class overlap. Indeed, they can increase the level of overlap, or create overlap where none existed in the original observation space. However, suitable choices of nonlinearity can make the process of modelling the posterior probabilities easier.

Such fixed basis function models have important limitations, and these will be resolved in later chapters by allowing the basis functions themselves to adapt to the data. Notwithstanding these limitations, models with fixed nonlinear basis functions play an important role in applications, and a discussion of such models will introduce many of the key concepts needed for an understanding of their more complex counterparts.

## 4.3.2 Logistic regression

We begin our treatment of generalized linear models by considering the problem of two-class classification. In our discussion of generative approaches in Section 4.2, we saw that under rather general assumptions, the posterior probability of class $\mathcal{C}_{1}$ can be written as a logistic sigmoid acting on a linear function of the feature vector $\phi$ so that

$$
p(\mathcal{C}_{1} | \phi) = y(\phi) = \sigma \left(\mathbf{w}^{\mathrm{T}} \phi\right)\tag{4.87}
$$

with $p(\mathcal{C}_{2} | \phi) = 1 - p(\mathcal{C}_{1} | \phi)$ . Here $\sigma(\cdot)$ is the logistic sigmoid function defined by (4.59). In the terminology of statistics, this model is known as logistic regression, although it should be emphasized that this is a model for classification rather than regression.

For an M-dimensional feature space $\phi,$ , this model has M adjustable parameters. By contrast, if we had fitted Gaussian class conditional densities using maximum likelihood, we would have used 2M parameters for the means and $M(M + 1) / 2$ parameters for the (shared) covariance matrix. Together with the class prior $p(\mathcal{C}_{1})$ , this gives a total of $M(M + 5) / 2 + 1$ parameters, which grows quadratically with $M$ in contrast to the linear dependence on M of the number of parameters in logistic regression. For large values of $M$ , there is a clear advantage in working with the logistic regression model directly.

We now use maximum likelihood to determine the parameters of the logistic regression model. To do this, we shall make use of the derivative of the logistic sigmoid function, which can conveniently be expressed in terms of the sigmoid function itself

$$
\frac{d \sigma}{da} = \sigma(1 - \sigma).\tag{4.88}
$$

For a data set $\{\phi_{n}, t_{n}\}$ , where $t_{n} ~ \in ~ \{0, 1\}$ and $\phi_{n} ~ = ~ \phi(\mathbf{x}_{n})$ , with $n =$ $1, \ldots, N$ , the likelihood function can be written

$$
p(\mathbf{t} | \mathbf{w}) = \prod_{n = 1}^{N} y_{n}^{t_{n}} \left\{1 - y_{n} \right\}^{1 - t_{n}}\tag{4.89}
$$

where ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ and $y_{n} ~ = ~ p(\mathcal{C}_{1} | \phi_{n})$ . As usual, we can define an error function by taking the negative logarithm of the likelihood, which gives the crossentropy error function in the form

$$
E(\mathbf{w}) = - \ln p(\mathbf{t} | \mathbf{w}) = - \sum_{n = 1}^{N} \left\{t_{n} \ln y_{n} +(1 - t_{n}) \ln(1 - y_{n}) \right\}\tag{4.90}
$$

where $y_{n} = \sigma(a_{n})$ and $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ . Taking the gradient of the error function with respect to , we obtain

$$
\nabla E(\mathbf{w}) = \sum_{n = 1}^{N}(y_{n} - t_{n}) \phi_{n}\tag{4.91}
$$

where we have made use of (4.88). We see that the factor involving the derivative of the logistic sigmoid has cancelled, leading to a simplified form for the gradient of the log likelihood. In particular, the contribution to the gradient from data point n is given by the ‘error $y_{n} - t_{n}$ between the target value and the prediction of the model, times the basis function vector $\phi_{n}$ . Furthermore, comparison with (3.13) shows that this takes precisely the same form as the gradient of the sum-of-squares error function for the linear regression model.

If desired, we could make use of the result (4.91) to give a sequential algorithm in which patterns are presented one at a time, in which each of the weight vectors is updated using (3.22) in which $\nabla E_{n}$ is the $n^{\mathrm{th}}$ term in (4.91).

It is worth noting that maximum likelihood can exhibit severe over-fitting for data sets that are linearly separable. This arises because the maximum likelihood solution occurs when the hyperplane corresponding to $\sigma = 0.5$ , equivalent to ${\bf w}^{\mathrm{T}} \phi ={}$ 0, separates the two classes and the magnitude of goes to infinity. In this case, the logistic sigmoid function becomes infinitely steep in feature space, corresponding to a Heaviside step function, so that every training point from each class k is assigned a posterior probability $p(\mathcal{C}_{k} | \mathbf{x}) = 1$ . Furthermore, there is typically a continuum <sup>x</sup>of such solutions because any separating hyperplane will give rise to the same posterior probabilities at the training data points, as will be seen later in Figure 10.13. Maximum likelihood provides no way to favour one such solution over another, and which solution is found in practice will depend on the choice of optimization algorithm and on the parameter initialization. Note that the problem will arise even if the number of data points is large compared with the number of parameters in the model, so long as the training data set is linearly separable. The singularity can be avoided by inclusion of a prior and finding a MAP solution for , or equivalently by adding a regularization term to the error function.

## 4.3.3 Iterative reweighted least squares

In the case of the linear regression models discussed in Chapter 3, the maximum likelihood solution, on the assumption of a Gaussian noise model, leads to a closed-form solution. This was a consequence of the quadratic dependence of the log likelihood function on the parameter vector . For logistic regression, there is no longer a closed-form solution, due to the nonlinearity of the logistic sigmoid function. However, the departure from a quadratic form is not substantial. To be precise, the error function is concave, as we shall see shortly, and hence has a unique minimum. Furthermore, the error function can be minimized by an efficient iterative technique based on the Newton-Raphson iterative optimization scheme, which uses a local quadratic approximation to the log likelihood function. The Newton-Raphson update, for minimizing a function $E(\mathbf{w})$ , takes the form (Fletcher, 1987; Bishop and Nabney, 2008)

$$
\mathbf{w}^{\mathrm{(new)}} = \mathbf{w}^{\mathrm{(old)}} - \mathbf{H}^{- 1} \nabla E(\mathbf{w}).\tag{4.92}
$$

where is the Hessian matrix whose elements comprise the second derivatives of $E(\mathbf{w})$ with respect to the components of .

<sup>w w</sup>Let us first of all apply the Newton-Raphson method to the linear regression model (3.3) with the sum-of-squares error function (3.12). The gradient and Hessian of this error function are given by

$$
\nabla E(\mathbf{w}) = \sum_{n = 1}^{N}(\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{n} - t_{n}) \boldsymbol{\phi}_{n} = \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{w} - \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t}\tag{4.93}
$$

$$
\mathbf{H} = \nabla \nabla E(\mathbf{w}) = \sum_{n = 1}^{N} \phi_{n} \phi_{n}^{\mathrm{T}} = \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\tag{4.94}
$$

Section 3.1.1

where $\Phi$ is the $N \times M$ design matrix, whose $n^{\mathrm{th}}$ row is given by $\boldsymbol{\phi}_{n}^{\mathrm{T}}$ . The Newton-<sup>Φ</sup>Raphson update then takes the form

$$
\begin{array}{rcl} \mathbf{w}^{\text{(new)}} & = & \mathbf{w}^{\text{(old)}} -(\boldsymbol{\Phi}^{\text{T}} \boldsymbol{\Phi})^{- 1} \left\{\boldsymbol{\Phi}^{\text{T}} \boldsymbol{\Phi} \mathbf{w}^{\text{(old)}} - \boldsymbol{\Phi}^{\text{T}} \mathbf{t} \right\} \\ & = &(\boldsymbol{\Phi}^{\text{T}} \boldsymbol{\Phi})^{- 1} \boldsymbol{\Phi}^{\text{T}} \mathbf{t} \end{array}\tag{4.95}
$$

which we recognize as the standard least-squares solution. Note that the error function in this case is quadratic and hence the Newton-Raphson formula gives the exact solution in one step.

Now let us apply the Newton-Raphson update to the cross-entropy error function (4.90) for the logistic regression model. From (4.91) we see that the gradient and Hessian of this error function are given by

$$
\nabla E(\mathbf{w}) = \sum_{n = 1}^{N}(y_{n} - t_{n}) \phi_{n} = \boldsymbol{\Phi}^{\mathrm{T}}(\mathbf{y} - \mathbf{t})\tag{4.96}
$$

$$
\mathbf{H} = \nabla \nabla E(\mathbf{w}) = \sum_{n = 1}^{N} y_{n}(1 - y_{n}) \phi_{n} \phi_{n}^{\mathrm{T}} = \mathbf{\Phi}^{\mathrm{T}} \mathbb{R} \mathbf{\Phi}\tag{4.97}
$$

where we have made use of (4.88). Also, we have introduced the $N \times N$ diagonal matrix with elements

$$
R_{nn} = y_{n}(1 - y_{n}).\tag{4.98}
$$

We see that the Hessian is no longer constant but depends on through the weight-<sup>w</sup>ing matrix , corresponding to the fact that the error function is no longer quadratic. <sup>R</sup>Using the property $0 < y_{n} < 1$ , which follows from the form of the logistic sigmoid function, we see that $\mathbf{u}^{\mathrm{T}} \mathbf{H} \mathbf{u} > 0$ for an arbitrary vector , and so the Hessian matrix <sup>u Hu u</sup>is positive definite. It follows that the error function is a concave function of and hence has a unique minimum.

The Newton-Raphson update formula for the logistic regression model then becomes

$$
\begin{array}{rcl} \mathbf{w}^{\text{(new)}} & = & \mathbf{w}^{\text{(old)}} -(\boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R} \boldsymbol{\Phi})^{- 1} \boldsymbol{\Phi}^{\mathrm{T}}(\mathbf{y} - \mathbf{t}) \\ & = &(\boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R} \boldsymbol{\Phi})^{- 1} \left\{\boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R} \boldsymbol{\Phi} \mathbf{w}^{\text{(old)}} - \boldsymbol{\Phi}^{\mathrm{T}}(\mathbf{y} - \mathbf{t}) \right\} \\ & = &(\boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R} \boldsymbol{\Phi})^{- 1} \boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R} \mathbf{z} \end{array}\tag{4.99}
$$

where z is an N-dimensional vector with elements

$$
\mathbf{z} = \boldsymbol{\Phi} \mathbf{w}^{(\mathrm{old})} - \mathbb{R}^{- 1}(\mathbf{y} - \mathbf{t}).\tag{4.100}
$$

We see that the update formula (4.99) takes the form of a set of normal equations for a weighted least-squares problem. Because the weighing matrix is not constant but depends on the parameter vector , we must apply the normal equations iteratively, each time using the new weight vector  to compute a revised weighing matrix <sup>w</sup>. For this reason, the algorithm is known as iterative reweighted least squares, or <sup>R</sup>IRLS (Rubin, 1983). As in the weighted least-squares problem, the elements of the diagonal weighting matrix can be interpreted as variances because the mean and <sup>R</sup>variance of t in the logistic regression model are given by

$$
{\mathbb{E}[t]} ={\sigma(\mathbf{x}) = y}\tag{4.101}
$$

$$
\operatorname{var}[t] = \mathbb{E}[t^{2}] - \mathbb{E}[t]^{2} = \sigma(\mathbf{x}) - \sigma(\mathbf{x})^{2} = y(1 - y)\tag{4.102}
$$

where we have used the property $t^{2} = t$ for $t \in \{0, 1\}$ . In fact, we can interpret IRLS as the solution to a linearized problem in the space of the variable $a = \mathbf{w}^{\mathrm{T}} \phi$ . The quantity $z_{n}$ , which corresponds to the $n^{\mathrm{th}}$ element of z, can then be given a simple interpretation as an effective target value in this space obtained by making a local linear approximation to the logistic sigmoid function around the current operating point $\mathbf{w} \mathbf{(\bar{o} ld)}$

$$
\begin{array}{rcl}{a_{n}(\mathbf{w})} & \simeq &{a_{n}(\mathbf{w}^{(\mathrm{old})}) + \left.\frac{d a_{n}}{d y_{n}} \right|_{\mathbf{w}^{(\mathrm{old})}}(t_{n} - y_{n})} \\ & = &{\phi_{n}^{\mathrm{T}} \mathbf{w}^{(\mathrm{old})} - \frac{(y_{n} - t_{n})}{y_{n}(1 - y_{n})} = z_{n}.} \end{array}\tag{4.103}
$$

## 4.3.4 Multiclass logistic regression

In our discussion of generative models for multiclass classification, we have seen that for a large class of distributions, the posterior probabilities are given by a softmax transformation of linear functions of the feature variables, so that

$$
p(\mathcal{C}_{k} | \phi) = y_{k}(\phi) = \frac{\exp(a_{k})}{\sum_{j} \exp(a_{j})}\tag{4.104}
$$

where the ‘activations’ $a_{k}$ are given by

$$
a_{k} = \mathbf{w}_{k}^{\mathrm{T}} \phi.\tag{4.105}
$$

There we used maximum likelihood to determine separately the class-conditional densities and the class priors and then found the corresponding posterior probabilities using Bayes’ theorem, thereby implicitly determining the parameters $\left\{\mathbf{w}_{k} \right\}$ . Here we consider the use of maximum likelihood to determine the parameters $\left\{\mathbf{w}_{k} \right\}$ of this model directly. To do this, we will require the derivatives of $y_{k}$ <sup>w</sup>with respect to all of the activations $a_{j}$ . These are given by

$$
\frac{\partial y_{k}}{\partial a_{j}} = y_{k}(I_{kj} - y_{j})\tag{4.106}
$$

where $I_{kj}$ are the elements of the identity matrix.

Next we write down the likelihood function. This is most easily done using the 1-of-K coding scheme in which the target vector $\mathbf{t}_{n}$ for a feature vector $\phi_{n}$ belonging to class $\mathcal{C}_{k}$ <sup>t</sup>is a binary vector with all elements zero except for element $k,$ , which equals one. The likelihood function is then given by

$$
p(\mathbf{T} | \mathbf{w}_{1}, \dots, \mathbf{w}_{K}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} p(\mathcal{C}_{k} | \phi_{n})^{t_{nk}} = \prod_{n = 1}^{N} \prod_{k = 1}^{K} y_{nk}^{t_{nk}}\tag{4.107}
$$

where $y_{nk} = y_{k}(\phi_{n})$ , and is an $N \times K$ matrix of target variables with elements $t_{nk}$ . Taking the negative logarithm then gives

$$
E(\mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = - \ln p(\mathbf{T} | \mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = - \sum_{n = 1}^{N} \sum_{k = 1}^{K} t_{nk} \ln y_{nk}\tag{4.108}
$$

which is known as the cross-entropy error function for the multiclass classification problem.

We now take the gradient of the error function with respect to one of the parameter vectors ${\bf w}_{j}$ . Making use of the result (4.106) for the derivatives of the softmax <sup>w</sup>function, we obtain

$$
\nabla_{\mathbf{w}_{j}} E(\mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = \sum_{n = 1}^{N}(y_{nj} - t_{nj}) \phi_{n}\tag{4.109}
$$

Exercise 4.20

where we have made use of $\textstyle \sum_{k} t_{nk} = 1$ . Once again, we see the same form arising for the gradient as was found for the sum-of-squares error function with the linear model and the cross-entropy error for the logistic regression model, namely the product of the error $(y_{nj} - t_{nj})$ times the basis function $\phi_{n}$ . Again, we could use this to formulate a sequential algorithm in which patterns are presented one at a time, in which each of the weight vectors is updated using (3.22).

We have seen that the derivative of the log likelihood function for a linear regression model with respect to the parameter vector for a data point n took the form of the ‘error’ $y_{n} - t_{n}$ times the feature vector $\phi_{n}$ . Similarly, for the combination of logistic sigmoid activation function and cross-entropy error function (4.90), and for the softmax activation function with the multiclass cross-entropy error function (4.108), we again obtain this same simple form. This is an example of a more general result, as we shall see in Section 4.3.6.

To find a batch algorithm, we again appeal to the Newton-Raphson update to obtain the corresponding IRLS algorithm for the multiclass problem. This requires evaluation of the Hessian matrix that comprises blocks of size $M \times M$ in which block $j,$ k is given by

$$
\nabla_{\mathbf{w}_{k}} \nabla_{\mathbf{w}_{j}} E(\mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = - \sum_{n = 1}^{N} y_{nk}(I_{kj} - y_{nj}) \phi_{n} \phi_{n}^{\mathrm{T}}.\tag{4.110}
$$

As with the two-class problem, the Hessian matrix for the multiclass logistic regression model is positive definite and so the error function again has a unique minimum. Practical details of IRLS for the multiclass case can be found in Bishop and Nabney (2008).

## 4.3.5 Probit regression

We have seen that, for a broad range of class-conditional distributions, described by the exponential family, the resulting posterior class probabilities are given by a logistic (or softmax) transformation acting on a linear function of the feature variables. However, not all choices of class-conditional density give rise to such a simple form for the posterior probabilities (for instance, if the class-conditional densities are modelled using Gaussian mixtures). This suggests that it might be worth exploring other types of discriminative probabilistic model. For the purposes of this chapter, however, we shall return to the two-class case, and again remain within the framework of generalized linear models so that

$$
p(t = 1 | a) = f(a)\tag{4.111}
$$

where $a = \mathbf{w}^{\mathrm{T}} \phi$ , and $f(\cdot)$ is the activation function.

One way to motivate an alternative choice for the link function is to consider a noisy threshold model, as follows. For each input $\phi_{n}$ , we evaluate $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ and then we set the target value according to

$$
\left\{\begin{array}{ll} t_{n} = 1 & \text{if} a_{n} \geqslant \theta \\ t_{n} = 0 & \text{otherwise.} \end{array} \right.\tag{4.112}
$$

Figure 4.13 Schematic example of a probability density $p(\theta)$ shown by the blue curve, given in this example by a mixture of two Gaussians, along with its cumulative distribution function $f(a)$ , shown by the red curve. Note that the value of the blue curve at any point, such as that indicated by the vertical green line, corresponds to the slope of the red curve at the same point. Conversely, the value of the red curve at this point corresponds to the area under the blue curve indicated by the shaded green region. In the stochastic threshold model, the class label takes the value $t = 1$ if the value of $a = \mathbf{w}^{\mathrm{T}}$ φ exceeds a threshold, otherwise it takes the value $t = 0$ . This is equivalent to an activation function given by the cumulative distribution function $f(a)$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/562c8d8fcfa6fbbce03c86e4b4faef5e2da4c2f38fd7800f444dafe972b31272.jpg)

If the value of $\theta$ is drawn from a probability density $p(\theta)$ , then the corresponding activation function will be given by the cumulative distribution function

$$
f(a) = \int_{- \infty}^{a} p(\theta) d \theta\tag{4.113}
$$

as illustrated in Figure 4.13.

As a specific example, suppose that the density $p(\theta)$ is given by a zero mean, unit variance Gaussian. The corresponding cumulative distribution function is given by

$$
\Phi(a) = \int_{- \infty}^{a} \mathcal{N}(\theta | 0, 1) d \theta\tag{4.114}
$$

which is known as the probit function. It has a sigmoidal shape and is compared with the logistic sigmoid function in Figure 4.9. Note that the use of a more general Gaussian distribution does not change the model because this is equivalent to a re-scaling of the linear coefficients . Many numerical packages provide for the <sup>w</sup>evaluation of a closely related function defined by

$$
\operatorname{erf}(a) = \frac{2}{\sqrt{\pi}} \int_{0}^{a} \exp(- \theta^{2} / 2) d \theta\tag{4.115}
$$

and known as the erf function or error function (not to be confused with the error function of a machine learning model). It is related to the probit function by

$$
\Phi(a) = \frac{1}{2} \left\{1 + \frac{1}{\sqrt{2}} \mathrm{erf}(a) \right\}.\tag{4.116}
$$

The generalized linear model based on a probit activation function is known as probit regression.

We can determine the parameters of this model using maximum likelihood, by a straightforward extension of the ideas discussed earlier. In practice, the results found using probit regression tend to be similar to those of logistic regression. We shall, however, find another use for the probit model when we discuss Bayesian treatments of logistic regression in Section 4.5.

One issue that can occur in practical applications is that of outliers, which can arise for instance through errors in measuring the input vector or through misla-<sup>x</sup>belling of the target value t. Because such points can lie a long way to the wrong side of the ideal decision boundary, they can seriously distort the classifier. Note that the logistic and probit regression models behave differently in this respect because the tails of the logistic sigmoid decay asymptotically like $\exp(- x)$ for $x \to \infty$ , whereas for the probit activation function they decay like $\exp(- x^{2})$ , and so the probit model can be significantly more sensitive to outliers.

However, both the logistic and the probit models assume the data is correctly labelled. The effect of mislabelling is easily incorporated into a probabilistic model by introducing a probability $\epsilon$ that the target value t has been flipped to the wrong value (Opper and Winther, 2000a), leading to a target value distribution for data point of the form

$$
\begin{array}{rcl} p(t | \mathbf{x}) & = &(1 - \epsilon) \sigma(\mathbf{x}) + \epsilon(1 - \sigma(\mathbf{x})) \\ & = & \epsilon +(1 - 2 \epsilon) \sigma(\mathbf{x}) \end{array}\tag{4.117}
$$

where $\sigma(\mathbf{x})$ is the activation function with input vector . Here $\epsilon$ may be set in <sup>x x</sup>advance, or it may be treated as a hyperparameter whose value is inferred from the data.

## 4.3.6 Canonical link functions

For the linear regression model with a Gaussian noise distribution, the error function, corresponding to the negative log likelihood, is given by (3.12). If we take the derivative with respect to the parameter vector of the contribution to the error <sup>w</sup>function from a data point n, this takes the form of the ‘error’ $y_{n} - t_{n}$ times the feature vector $\phi_{n}$ , where $y_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ . Similarly, for the combination of the logistic sigmoid activation function and the cross-entropy error function (4.90), and for the softmax activation function with the multiclass cross-entropy error function (4.108), we again obtain this same simple form. We now show that this is a general result of assuming a conditional distribution for the target variable from the exponential family, along with a corresponding choice for the activation function known as the canonical link function.

We again make use of the restricted form (4.84) of exponential family distributions. Note that here we are applying the assumption of exponential family distribution to the target variable t, in contrast to Section 4.2.4 where we applied it to the input vector . We therefore consider conditional distributions of the target variable of the form

$$
p(t | \eta, s) = \frac{1}{s} h \left(\frac{t}{s}\right) g(\eta) \exp \left\{\frac{\eta t}{s} \right\}.\tag{4.118}
$$

Using the same line of argument as led to the derivation of the result (2.226), we see that the conditional mean of t, which we denote by $y,$ is given by

$$
y \equiv \mathbb{E}[t | \eta] = - s \frac{d}{d \eta} \ln g(\eta).\tag{4.119}
$$

Thus y and η must related, and we denote this relation through $\eta = \psi(y)$

Following Nelder and Wedderburn (1972), we define a generalized linear model to be one for which $y$ is a nonlinear function of a linear combination of the input (or feature) variables so that

$$
y = f(\mathbf{w}^{\mathrm{T}} \phi)\tag{4.120}
$$

where $f(\cdot)$ is known as the activation function in the machine learning literature, and $f^{- 1}(\cdot)$ is known as the link function in statistics.

Now consider the log likelihood function for this model, which, as a function of η, is given by

$$
\ln p(\mathbf{t} | \eta, s) = \sum_{n = 1}^{N} \ln p(t_{n} | \eta, s) = \sum_{n = 1}^{N} \left\{\ln g(\eta_{n}) + \frac{\eta_{n} t_{n}}{s} \right\} + \text{const}\tag{4.121}
$$

where we are assuming that all observations share a common scale parameter (which corresponds to the noise variance for a Gaussian distribution for instance) and so s is independent of $n.$ . The derivative of the log likelihood with respect to the model parameters  is then given by

$$
\begin{array}{rcl} \nabla_{\mathbf{w}} \ln p(\mathbf{t} | \eta, s) & = & \sum_{n = 1}^{N} \left\{\frac{d}{d \eta_{n}} \ln g(\eta_{n}) + \frac{t_{n}}{s} \right\} \frac{d \eta_{n}}{dy_{n}} \frac{dy_{n}}{da_{n}} \nabla a_{n} \\ & = & \sum_{n = 1}^{N} \frac{1}{s} \left\{t_{n} - y_{n} \right\} \psi^{\prime}(y_{n}) f^{\prime}(a_{n}) \phi_{n} \end{array}\tag{4.122}
$$

where $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ , and we have used $y_{n} = f(a_{n})$ together with the result (4.119) for $\mathbb{E}[t | \eta]$ <sup>w</sup>. We now see that there is a considerable simplification if we choose a particular form for the link function $f^{- 1}(y)$ given by

$$
f^{- 1}(y) = \psi(y)\tag{4.123}
$$

which gives $f(\psi(y)) = y$ and hence $f^{\prime}(\psi) \psi^{\prime}(y) = 1$ . Also, because $a = f^{- 1}(y)$ we have $a = \psi$ and hence $f^{\prime}(a) \psi^{\prime}(y) \stackrel{\cdot}{=} 1$ . In this case, the gradient of the error function reduces to

$$
\nabla \ln E(\mathbf{w}) = \frac{1}{s} \sum_{n = 1}^{N} \{y_{n} - t_{n}\} \phi_{n}.\tag{4.124}
$$

For the Gaussian $s = \beta^{- 1}$ , whereas for the logistic model $s = 1$

## 4.4. The Laplace Approximation

In Section 4.5 we shall discuss the Bayesian treatment of logistic regression. As we shall see, this is more complex than the Bayesian treatment of linear regression models, discussed in Sections 3.3 and 3.5. In particular, we cannot integrate exactly over the parameter vector since the posterior distribution is no longer Gaussian. It is therefore necessary to introduce some form of approximation. Later in the book we shall consider a range of techniques based on analytical approximations and numerical sampling.

Here we introduce a simple, but widely used, framework called the Laplace approximation, that aims to find a Gaussian approximation to a probability density defined over a set of continuous variables. Consider first the case of a single continuous variable z, and suppose the distribution $p(z)$ is defined by

$$
p(z) = \frac{1}{Z} f(z)\tag{4.125}
$$

where $\begin{array}{r}{Z = \int f(z) d z} \end{array}$ is the normalization coefficient. We shall suppose that the value of Z is unknown. In the Laplace method the goal is to find a Gaussian approximation $q(z)$ which is centred on a mode of the distribution $p(z)$ . The first step is to find a mode of $p(z)$ , in other words a point $z_{\mathrm{0}}$ such that $p^{\prime}(z_{0}) = 0$ , or equivalently

$$
\left.\frac{df(z)}{dz} \right|_{z = z_{0}} = 0.\tag{4.126}
$$

A Gaussian distribution has the property that its logarithm is a quadratic function of the variables. We therefore consider a Taylor expansion of ln $f(z)$ centred on the mode $z_{\mathrm{0}}$ so that

$$
\ln f(z) \simeq \ln f(z_{0}) - \frac{1}{2} A(z - z_{0})^{2}\tag{4.127}
$$

where

$$
A = - \left.\frac{d^{2}}{dz^{2}} \ln f(z) \right|_{z = z_{0}}.\tag{4.128}
$$

Note that the first-order term in the Taylor expansion does not appear since $z_{0}$ is a local maximum of the distribution. Taking the exponential we obtain

$$
f(z) \simeq f(z_{0}) \exp \left\{- \frac{A}{2}(z - z_{0})^{2} \right\}.\tag{4.129}
$$

We can then obtain a normalized distribution $q(z)$ by making use of the standard result for the normalization of a Gaussian, so that

$$
q(z) = \left(\frac{A}{2 \pi}\right)^{1 / 2} \exp \left\{- \frac{A}{2}(z - z_{0})^{2} \right\}.\tag{4.130}
$$

The Laplace approximation is illustrated in Figure 4.14. Note that the Gaussian approximation will only be well defined if its precision $A > 0$ , in other words the stationary point $z_{0}$ must be a local maximum, so that the second derivative of $f(z)$ at the point $z_{0}$ is negative.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/19a3198ba8b2d21be5f13862c48309b11edaac0dd01d14a534fa918d4260a066.jpg)

![Figure 4.14](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p201-400/images/d6091b97b381d68931f6bae3524972040bb8425e9d6bab9ee1b26ca817cd3245.jpg)  
Figure 4.14 Illustration of the Laplace approximation applied to the distribution $p(z) \propto \exp(- z^{2} / 2) \sigma(20z + 4)$ where $\sigma(z)$ is the logistic sigmoid function defined by $\sigma \dot{(} z \dot{)} =(1 + e^{- z})^{- 1}$ . The left plot shows the normalized distribution $p(z)$ in yellow, together with the Laplace approximation centred on the mode $z_{\mathrm{0}}$ of $p(z)$ in red. The right plot shows the negative logarithms of the corresponding curves.

We can extend the Laplace method to approximate a distribution $p(\mathbf{z}) = f(\mathbf{z}) / Z$ defined over an M-dimensional space . At a stationary point $\mathbf{z}_{0}$ the gradient $\nabla f(\mathbf{z})$ will vanish. Expanding around this stationary point we have

$$
\ln f(\mathbf{z}) \simeq \ln f(\mathbf{z}_{0}) - \frac{1}{2}(\mathbf{z} - \mathbf{z}_{0})^{\mathrm{T}} \mathbf{A}(\mathbf{z} - \mathbf{z}_{0})\tag{4.131}
$$

where the $M \times M$ Hessian matrix  is defined by

$$
\mathbf{A} = - \left.\nabla \nabla \ln f(\mathbf{z}) \right|_{\mathbf{z} = \mathbf{z}_{0}}\tag{4.132}
$$

and $\nabla$ is the gradient operator. Taking the exponential of both sides we obtain

$$
f(\mathbf{z}) \simeq f(\mathbf{z}_{0}) \exp \left\{- \frac{1}{2}(\mathbf{z} - \mathbf{z}_{0})^{\mathrm{T}} \mathbf{A}(\mathbf{z} - \mathbf{z}_{0}) \right\}.\tag{4.133}
$$

The distribution $q(\mathbf{z})$ is proportional to $f(\mathbf{z})$ and the appropriate normalization coefficient can be found by inspection, using the standard result (2.43) for a normalized multivariate Gaussian, giving

$$
q(\mathbf{z}) = \frac{| \mathbf{A} |^{1 / 2}}{(2 \pi)^{M / 2}} \exp \left\{- \frac{1}{2}(\mathbf{z} - \mathbf{z}_{0})^{\mathrm{T}} \mathbf{A}(\mathbf{z} - \mathbf{z}_{0}) \right\} = \mathcal{N}(\mathbf{z} | \mathbf{z}_{0}, \mathbf{A}^{- 1})\tag{4.134}
$$

where $| \mathbf{A} |$ denotes the determinant of . This Gaussian distribution will be well defined provided its precision matrix, given by , is positive definite, which implies that the stationary point $\mathbf{z}_{0}$ must be a local maximum, not a minimum or a saddle point.

In order to apply the Laplace approximation we first need to find the mode $\mathbf{z}_{0}$ and then evaluate the Hessian matrix at that mode. In practice a mode will typically be found by running some form of numerical optimization algorithm (Bishop and Nabney, 2008). Many of the distributions encountered in practice will be multimodal and so there will be different Laplace approximations according to which mode is being considered. Note that the normalization constant $Z$ of the true distribution does not need to be known in order to apply the Laplace method. As a result of the central limit theorem, the posterior distribution for a model is expected to become increasingly better approximated by a Gaussian as the number of observed data points is increased, and so we would expect the Laplace approximation to be most useful in situations where the number of data points is relatively large.

One major weakness of the Laplace approximation is that, since it is based on a Gaussian distribution, it is only directly applicable to real variables. In other cases it may be possible to apply the Laplace approximation to a transformation of the variable. For instance if $0 \leqslant \tau < \infty$ then we can consider a Laplace approximation of ln $\tau.$ . The most serious limitation of the Laplace framework, however, is that it is based purely on the aspects of the true distribution at a specific value of the variable, and so can fail to capture important global properties. In Chapter 10 we shall consider alternative approaches which adopt a more global perspective.

## 4.4.1 Model comparison and BIC

As well as approximating the distribution $p(\mathbf{z})$ we can also obtain an approxi mation to the normalization constant Z. Using the approximation (4.133) we have

$$
\begin{array}{rcl}{Z} &{=} &{\int f(\mathbf{z}) d \mathbf{z}} \\ &{\simeq} &{f(\mathbf{z}_{0}) \int \exp \left\{- \frac{1}{2}(\mathbf{z} - \mathbf{z}_{0})^{\mathrm{T}} \mathbf{A}(\mathbf{z} - \mathbf{z}_{0}) \right\} d \mathbf{z}} \\ &{=} &{f(\mathbf{z}_{0}) \frac{(2 \pi)^{M / 2}}{| \mathbf{A} |^{1 / 2}}} \end{array}\tag{4.135}
$$

where we have noted that the integrand is Gaussian and made use of the standard result (2.43) for a normalized Gaussian distribution. We can use the result (4.135) to obtain an approximation to the model evidence which, as discussed in Section 3.4, plays a central role in Bayesian model comparison.

Consider a data set $\mathcal{D}$ and a set of models $\{\mathcal{M}_{i}\}$ having parameters $\{\pmb \theta_{i}\}$ . For each model we define a likelihood function $p(\mathcal{D} | \pmb{\theta}_{i}, \mathcal{M}_{i})$ . If we introduce a prior $p(\pmb \theta_{i} | \mathcal{M}_{i})$ over the parameters, then we are interested in computing the model evidence $p(\mathcal{D} | \mathcal{M}_{i})$ for the various models. From now on we omit the conditioning on $\mathcal{M}_{i}$ to keep the notation uncluttered. From Bayes’ theorem the model evidence is given by

$$
p(\mathcal{D}) = \int p(\mathcal{D} | \boldsymbol{\theta}) p(\boldsymbol{\theta}) d \boldsymbol{\theta}.\tag{4.136}
$$

Identifying $f(\pmb \theta) = p(\mathcal{D} | \pmb \theta) p(\pmb \theta)$ and $Z = p({\mathcal{D}})$ , and applying the result (4.135), we obtain

$$
\ln p(\mathcal{D}) \simeq \ln p(\mathcal{D} | \boldsymbol{\theta}_{\mathrm{MAP}}) + \underbrace{\ln p(\boldsymbol{\theta}_{\mathrm{MAP}}) + \frac{M}{2} \ln(2 \pi) - \frac{1}{2} \ln | \mathbf{A} |}\tag{4.137}
$$

Occam factor

where $\theta_{\mathrm{MAP}}$ is the value of θ at the mode of the posterior distribution, and is the Hessian matrix of second derivatives of the negative log posterior

$$
\mathbf{A} = - \nabla \nabla \ln p(\mathcal{D} | \boldsymbol{\theta}_{\mathrm{MAP}}) p(\boldsymbol{\theta}_{\mathrm{MAP}}) = - \nabla \nabla \ln p(\boldsymbol{\theta}_{\mathrm{MAP}} | \mathcal{D}).\tag{4.138}
$$

The first term on the right hand side of (4.137) represents the log likelihood evaluated using the optimized parameters, while the remaining three terms comprise the ‘Occam factor’ which penalizes model complexity.

If we assume that the Gaussian prior distribution over parameters is broad, and that the Hessian has full rank, then we can approximate (4.137) very roughly using

$$
\ln p(\mathcal{D}) \simeq \ln p(\mathcal{D} | \pmb{\theta}_{\mathrm{MAP}}) - \frac{1}{2} M \ln N\tag{4.139}
$$

where N is the number of data points, M is the number of parameters in θ and we have omitted additive constants. This is known as the Bayesian Information Criterion (BIC) or the Schwarz criterion (Schwarz, 1978). Note that, compared to AIC given by (1.73), this penalizes model complexity more heavily.

Complexity measures such as AIC and BIC have the virtue of being easy to evaluate, but can also give misleading results. In particular, the assumption that the Hessian matrix has full rank is often not valid since many of the parameters are not ‘well-determined’. We can use the result (4.137) to obtain a more accurate estimate of the model evidence starting from the Laplace approximation, as we illustrate in the context of neural networks in Section 5.7.

## 4.5. Bayesian Logistic Regression

We now turn to a Bayesian treatment of logistic regression. Exact Bayesian inference for logistic regression is intractable. In particular, evaluation of the posterior distribution would require normalization of the product of a prior distribution and a likelihood function that itself comprises a product of logistic sigmoid functions, one for every data point. Evaluation of the predictive distribution is similarly intractable. Here we consider the application of the Laplace approximation to the problem of Bayesian logistic regression (Spiegelhalter and Lauritzen, 1990; MacKay, 1992b).

## 4.5.1 Laplace approximation

Recall from Section 4.4 that the Laplace approximation is obtained by finding the mode of the posterior distribution and then fitting a Gaussian centred at that mode. This requires evaluation of the second derivatives of the log posterior, which is equivalent to finding the Hessian matrix.

Because we seek a Gaussian representation for the posterior distribution, it is natural to begin with a Gaussian prior, which we write in the general form

$$
p(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{0}, \mathbf{S}_{0})\tag{4.140}
$$

where $\mathbf{m}_{0}$ and $\mathbf{S}_{0}$ are fixed hyperparameters. The posterior distribution over  is given by

$$
p(\mathbf{w} | \mathbf{t}) \propto p(\mathbf{w}) p(\mathbf{t} | \mathbf{w})\tag{4.141}
$$

where $\mathbf{t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ . Taking the log of both sides, and substituting for the prior distribution using (4.140), and for the likelihood function using (4.89), we obtain

$$
\begin{array}{rcl} \ln p(\mathbf{w} | \mathbf{t}) & = & - \frac{1}{2}(\mathbf{w} - \mathbf{m}_{0})^{\mathrm{T}} \mathbf{S}_{0}^{- 1}(\mathbf{w} - \mathbf{m}_{0}) \\ & & + \sum_{n = 1}^{N} \left\{t_{n} \ln y_{n} +(1 - t_{n}) \ln(1 - y_{n}) \right\} + \text{const} \end{array}\tag{4.142}
$$

where $y_{n} = \sigma(\mathbf{w}^{\mathrm{T}} \phi_{n})$ . To obtain a Gaussian approximation to the posterior distribution, we first maximize the posterior distribution to give the MAP (maximum posterior) solution ${\bf w}_{\mathrm{MAP}}$ , which defines the mean of the Gaussian. The covariance is then given by the inverse of the matrix of second derivatives of the negative log likelihood, which takes the form

$$
\mathbf{S}_{N} = - \nabla \nabla \ln p(\mathbf{w} | \mathbf{t}) = \mathbf{S}_{0}^{- 1} + \sum_{n = 1}^{N} y_{n}(1 - y_{n}) \boldsymbol{\phi}_{n} \boldsymbol{\phi}_{n}^{\mathrm{T}}.\tag{4.143}
$$

The Gaussian approximation to the posterior distribution therefore takes the form

$$
q(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{w}_{\mathrm{MAP}}, \mathbf{S}_{N}).\tag{4.144}
$$

Having obtained a Gaussian approximation to the posterior distribution, there remains the task of marginalizing with respect to this distribution in order to make predictions.

## 4.5.2 Predictive distribution

The predictive distribution for class $\mathcal{C}_{1}$ , given a new feature vector $\phi(\mathbf{x})$ , is obtained by marginalizing with respect to the posterior distribution $p(\mathbf{w} | \mathbf{t})$ , which is itself approximated by a Gaussian distribution $q(\mathbf{w})$ so that

$$
p(\mathcal{C}_{1} | \boldsymbol{\phi}, \mathbf{t}) = \int p(\mathcal{C}_{1} | \boldsymbol{\phi}, \mathbf{w}) p(\mathbf{w} | \mathbf{t}) d \mathbf{w} \simeq \int \sigma(\mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}) q(\mathbf{w}) d \mathbf{w}\tag{4.145}
$$

with the corresponding probability for class $\mathcal{C}_{2}$ given by $p(\mathcal{C}_{2} | \phi, \mathbf{t}) = 1 - p(\mathcal{C}_{1} | \phi, \mathbf{t})$ To evaluate the predictive distribution, we first note that the function $\sigma(\mathbf{w}^{\mathrm{T}} \phi)$ depends on  only through its projection onto $\phi$ . Denoting $a = \mathbf{w}^{\mathrm{T}} \phi$ <sup>w</sup>, we have

$$
\sigma(\mathbf{w}^{\mathrm{T}} \phi) = \int \delta(a - \mathbf{w}^{\mathrm{T}} \phi) \sigma(a) d a\tag{4.146}
$$

where $\delta(\cdot)$ is the Dirac delta function. From this we obtain

$$
\int \sigma(\mathbf{w}^{\mathrm{T}} \phi) q(\mathbf{w}) d \mathbf{w} = \int \sigma(a) p(a) d a\tag{4.147}
$$

where

$$
p(a) = \int \delta(a - \mathbf{w}^{\mathrm{T}} \phi) q(\mathbf{w}) d \mathbf{w}.\tag{4.148}
$$

We can evaluate $p(a)$ by noting that the delta function imposes a linear constraint on and so forms a marginal distribution from the joint distribution $q(\mathbf{w})$ by integrating out all directions orthogonal to $\phi.$ . Because $q(\mathbf{w})$ <sup>w</sup>is Gaussian, we know from Section 2.3.2 that the marginal distribution will also be Gaussian. We can evaluate the mean and covariance of this distribution by taking moments, and interchanging the order of integration over a and , so that

$$
\mu_{a} = \mathbb{E}[a] = \int p(a) a d a = \int q(\mathbf{w}) \mathbf{w}^{\mathrm{T}} \phi d \mathbf{w} = \mathbf{w}_{\mathrm{MAP}}^{\mathrm{T}} \phi\tag{4.149}
$$

where we have used the result (4.144) for the variational posterior distribution $q(\mathbf{w})$ Similarly

$$
\begin{array}{rcl} \sigma_{a}^{2} & = & \mathrm{var}[a] = \int p(a) \left\{a^{2} - \mathbb{E}[a]^{2} \right\} d a \\ & = & \int q(\mathbf{w}) \left\{(\mathbf{w}^{\mathrm{T}} \phi)^{2} -(\mathbf{m}_{N}^{\mathrm{T}} \phi)^{2} \right\} d \mathbf{w} = \phi^{\mathrm{T}} \mathbf{S}_{N} \phi.\end{array}\tag{4.150}
$$

Note that the distribution of a takes the same form as the predictive distribution (3.58) for the linear regression model, with the noise variance set to zero. Thus our variational approximation to the predictive distribution becomes

$$
p(\mathcal{C}_{1} | \mathbf{t}) = \int \sigma(a) p(a) d a = \int \sigma(a) \mathcal{N}(a | \mu_{a}, \sigma_{a}^{2}) d a.\tag{4.151}
$$

This result can also be derived directly by making use of the results for the marginal of a Gaussian distribution given in Section 2.3.2.

The integral over a represents the convolution of a Gaussian with a logistic sigmoid, and cannot be evaluated analytically. We can, however, obtain a good approximation (Spiegelhalter and Lauritzen, 1990; MacKay, 1992b; Barber and Bishop, 1998a) by making use of the close similarity between the logistic sigmoid function $\sigma(a)$ defined by (4.59) and the probit function $\Phi(a)$ defined by (4.114). In order to obtain the best approximation to the logistic function we need to re-scale the horizontal axis, so that we approximate $\sigma(a)$ by $\Phi(\lambda a)$ . We can find a suitable value of λ by requiring that the two functions have the same slope at the origin, which gives $\lambda^{2} = \pi / 8$ The similarity of the logistic sigmoid and the probit function, for this choice of λ, is illustrated in Figure 4.9.

The advantage of using a probit function is that its convolution with a Gaussian can be expressed analytically in terms of another probit function. Specifically we can show that

$$
\int \Phi(\lambda a) \mathcal{N}(a | \mu, \sigma^{2}) d a = \Phi \left(\frac{\mu}{(\lambda^{- 2} + \sigma^{2})^{1 / 2}}\right).\tag{4.152}
$$

We now apply the approximation $\sigma(a) \simeq \Phi(\lambda a)$ to the probit functions appearing on both sides of this equation, leading to the following approximation for the convolution of a logistic sigmoid with a Gaussian

$$
\int \sigma(a) \mathcal{N}(a | \mu, \sigma^{2}) d a \simeq \sigma(\kappa(\sigma^{2}) \mu)\tag{4.153}
$$

where we have defined

$$
\kappa(\sigma^{2}) =(1 + \pi \sigma^{2} / 8)^{- 1 / 2}.\tag{4.154}
$$

Applying this result to (4.151) we obtain the approximate predictive distribution in the form

$$
p(\mathcal{C}_{1} | \boldsymbol{\phi}, \mathbf{t}) = \sigma \left(\kappa(\sigma_{a}^{2}) \mu_{a}\right)\tag{4.155}
$$

where $\mu_{a}$ and $\sigma_{a}^{2}$ are defined by (4.149) and (4.150), respectively, and $\kappa(\sigma_{a}^{2})$ is defined by (4.154).

Note that the decision boundary corresponding to $p(\mathcal{C}_{1} | \phi, \mathbf{t}) = 0.5$ is given by $\mu_{a} = 0$ , which is the same as the decision boundary obtained by using the MAP value for . Thus if the decision criterion is based on minimizing misclassification rate, with equal prior probabilities, then the marginalization over has no ef-<sup>w</sup>fect. However, for more complex decision criteria it will play an important role. Marginalization of the logistic sigmoid model under a Gaussian approximation to the posterior distribution will be illustrated in the context of variational inference in Figure 10.13.

## Exercises

4.1 (★★) Given a set of data points $\left\{\mathbf{x}_{n} \right\}$ , we can define the convex hull to be the set of all points  given by

$$
\mathbf{x} = \sum_{n} \alpha_{n} \mathbf{x}_{n}\tag{4.156}
$$

where $\alpha_{n} \geqslant 0$ and $\textstyle \sum_{n} \alpha_{n} = 1$ . Consider a second set of points $\left\{\mathbf{y}_{n} \right\}$ together with their corresponding convex hull. By definition, the two sets of points will be linearly separable if there exists a vector  and a scalar $w_{0}$ such that $ { \hat { \mathbf { w } } } ^ { \mathrm { T } } \mathbf { x } _ { n } + w _ { 0 } > 0$ for all ${\bf x}_{n}$ , and $\widehat{\mathbf{w}}^{\mathrm{T}} \mathbf{y}_{n} + w_{0} < 0$ for all ${\bf y}_{n}$ <sup>w x</sup>. Show that if their convex hulls intersect, the two sets of points cannot be linearly separable, and conversely that if they are linearly separable, their convex hulls do not intersect.

4.2 (★★) www Consider the minimization of a sum-of-squares error function (4.15), and suppose that all of the target vectors in the training set satisfy a linear constraint

$$
\mathbf{a}^{\mathrm{T}} \mathbf{t}_{n} + b = 0\tag{4.157}
$$

where $\mathbf{t}_{n}$ corresponds to the $n^{\mathrm{th}}$ row of the matrix  in (4.15). Show that as a <sup>t T</sup>consequence of this constraint, the elements of the model prediction $\mathbf{y}(\mathbf{x})$ given by the least-squares solution (4.17) also satisfy this constraint, so that

$$
\mathbf{a}^{\mathrm{T}} \mathbf{y}(\mathbf{x}) + b = 0.\tag{4.158}
$$

To do so, assume that one of the basis functions $\phi_{0}(\mathbf{x}) = 1$ so that the corresponding parameter $w_{0}$ plays the role of a bias.

4.3 (★★) Extend the result of Exercise 4.2 to show that if multiple linear constraints are satisfied simultaneously by the target vectors, then the same constraints will also be satisfied by the least-squares prediction of a linear model.

4.4 (★) www Show that maximization of the class separation criterion given by (4.23) with respect to , using a Lagrange multiplier to enforce the constraint $\mathbf{w}^{\mathrm{T}} \mathbf{w} = 1$ <sup>w</sup>leads to the result that $\mathbf{w} \propto \left(\mathbf{m}_{2} - \mathbf{m}_{1} \right)$

4.5 (★) By making use of (4.20), (4.23), and (4.24), show that the Fisher criterion (4.25) can be written in the form (4.26).

4.6 (★) Using the definitions of the between-class and within-class covariance matrices given by (4.27) and (4.28), respectively, together with (4.34) and (4.36) and the choice of target values described in Section 4.1.5, show that the expression (4.33) that minimizes the sum-of-squares error function can be written in the form (4.37).

4.7 (★) www Show that the logistic sigmoid function (4.59) satisfies the property σ $\cdot(-{\overline{{a) = 1}}} - \sigma(a)$ and that its inverse is given by $\sigma^{- 1}(y) = \ln{\{y /(1 - y)\}}$

4.8 (★) Using (4.57) and (4.58), derive the result (4.65) for the posterior class probability in the two-class generative model with Gaussian densities, and verify the results (4.66) and (4.67) for the parameters and $w_{0}$

4.9 (★) www Consider a generative classification model for K classes defined by prior class probabilities $p(\mathcal{C}_{k}) = \pi_{k}$ and general class-conditional densities $p(\phi |{\mathcal C}_{k})$ where φ is the input feature vector. Suppose we are given a training data set $\{\phi_{n}, \mathbf{t}_{n}\}$ where $n = 1, \ldots, N$ , and $\mathbf{t}_{n}$ <sup>t</sup>is a binary target vector of length K that uses the 1-of-<sup>t</sup>K coding scheme, so that it has components $t_{nj} = I_{jk}$ if pattern n is from class $\mathcal{C}_{k}$ Assuming that the data points are drawn independently from this model, show that the maximum-likelihood solution for the prior probabilities is given by

$$
\pi_{k} = \frac{N_{k}}{N}\tag{4.159}
$$

where $N_{k}$ is the number of data points assigned to class $\mathcal{C}_{k}$

4.10 (★★) Consider the classification model of Exercise 4.9 and now suppose that the class-conditional densities are given by Gaussian distributions with a shared covariance matrix, so that

$$
p(\phi | \mathcal{C}_{k}) = \mathcal{N}(\phi | \boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}).\tag{4.160}
$$

Show that the maximum likelihood solution for the mean of the Gaussian distribution for class $\mathcal{C}_{k}$ is given by

$$
\pmb{\mu}_{k} = \frac{1}{N_{k}} \sum_{n = 1}^{N} t_{nk} \phi_{n}\tag{4.161}
$$

which represents the mean of those feature vectors assigned to class $\mathcal{C}_{k}$ . Similarly, show that the maximum likelihood solution for the shared covariance matrix is given by

$$
\pmb{\Sigma} = \sum_{k = 1}^{K} \frac{N_{k}}{N} \mathbf{S}_{k}\tag{4.162}
$$

where

$$
\mathbf{S}_{k} = \frac{1}{N_{k}} \sum_{n = 1}^{N} t_{nk}(\boldsymbol{\phi}_{n} - \boldsymbol{\mu}_{k})(\boldsymbol{\phi}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}}.\tag{4.163}
$$

Thus is given by a weighted average of the covariances of the data associated with <sup>Σ</sup>each class, in which the weighting coefficients are given by the prior probabilities of the classes.

4.11 (★★) Consider a classification problem with K classes for which the feature vector $\phi$ has M components each of which can take L discrete states. Let the values of the components be represented by a $1{-} 0 \mathrm{f -} L$ binary coding scheme. Further suppose that, conditioned on the class $\mathcal{C}_{k}$ , the M components of $\phi$ are independent, so that the class-conditional density factorizes with respect to the feature vector components. Show that the quantities $a_{k}$ given by (4.63), which appear in the argument to the softmax function describing the posterior class probabilities, are linear functions of the components of $\phi.$ Note that this represents an example of the naive Bayes model which is discussed in Section 8.2.2.

4.12 (★) www Verify the relation (4.88) for the derivative of the logistic sigmoid function defined by (4.59).

4.13 (★) www By making use of the result (4.88) for the derivative of the logistic sigmoid, show that the derivative of the error function (4.90) for the logistic regression model is given by (4.91).

4.14 (★) Show that for a linearly separable data set, the maximum likelihood solution for the logistic regression model is obtained by finding a vector whose decision boundary $\mathbf{\bar{w}}^{\mathrm{T}} \phi(\mathbf{x}) = 0$ separates the classes and then taking the magnitude of  to infinity.

4.15 (★★) Show that the Hessian matrix  for the logistic regression model, given by <sup>H</sup>(4.97), is positive definite. Here  is a diagonal matrix with elements $y_{n}(1 - y_{n})$ and $y_{n}$ <sup>R</sup>is the output of the logistic regression model for input vector ${\bf x}_{n}$ . Hence show <sup>x</sup>that the error function is a concave function of and that it has a unique minimum.

4.16 (★) Consider a binary classification problem in which each observation ${\bf x}_{n}$ is known to belong to one of two classes, corresponding to $t = 0$ and $t = 1$ , and suppose that the procedure for collecting training data is imperfect, so that training points are sometimes mislabelled. For every data point ${\bf x}_{n}$ , instead of having a value t for the class label, we have instead a value $\pi_{n}$ representing the probability that $t_{n} = 1$ Given a probabilistic model $p(t = 1 | \phi)$ , write down the log likelihood function appropriate to such a data set.

4.17 (★) www Show that the derivatives of the softmax activation function (4.104), where the $a_{k}$ are defined by (4.105), are given by (4.106).

4.18 (★) Using the result (4.91) for the derivatives of the softmax activation function, show that the gradients of the cross-entropy error (4.108) are given by (4.109).

4.19 (★) www Write down expressions for the gradient of the log likelihood, as well as the corresponding Hessian matrix, for the probit regression model defined in Section 4.3.5. These are the quantities that would be required to train such a model using IRLS.

4.20 (★★) Show that the Hessian matrix for the multiclass logistic regression problem, defined by (4.110), is positive semidefinite. Note that the full Hessian matrix for this problem is of size $MK \times MK$ , where M is the number of parameters and K is the number of classes. To prove the positive semidefinite property, consider the product $\mathbf{u}^{\mathrm{T}} \mathbf{H} \mathbf{u}$ where is an arbitrary vector of length MK, and then apply Jensen’s inequality.

4.21 (★) Show that the probit function (4.114) and the erf function (4.115) are related by (4.116).

4.22 (★) Using the result (4.135), derive the expression (4.137) for the log model evidence under the Laplace approximation.

4.23 (★★) www In this exercise, we derive the BIC result (4.139) starting from the Laplace approximation to the model evidence given by (4.137). Show that if the prior over parameters is Gaussian of the form $p(\pmb \theta) = \mathcal{N}(\pmb \theta | \mathbf{m}, \mathbf{V}_{0})$ , the log model evidence under the Laplace approximation takes the form

$$
\ln p(\mathcal{D}) \simeq \ln p(\mathcal{D} | \boldsymbol{\theta}_{\mathrm{MAP}}) - \frac{1}{2}(\boldsymbol{\theta}_{\mathrm{MAP}} - \mathbf{m})^{\mathrm{T}} \mathbf{V}_{0}^{- 1}(\boldsymbol{\theta}_{\mathrm{MAP}} - \mathbf{m}) - \frac{1}{2} \ln | \mathbf{H} | + \text{const}
$$

where is the matrix of second derivatives of the log likelihood ln $p(\mathcal{D} | \mathbf{\theta})$ evaluated at $\theta_{\mathrm{MAP}}$ . Now assume that the prior is broad so that $\mathbf{V}_{0}^{- 1}$ is small and the second <sup>V</sup>term on the right-hand side above can be neglected. Furthermore, consider the case of independent, identically distributed data so that is the sum of terms one for each <sup>H</sup>data point. Show that the log model evidence can then be written approximately in the form of the BIC expression (4.139).

4.24 (★★) Use the results from Section 2.3.2 to derive the result (4.151) for the marginalization of the logistic regression model with respect to a Gaussian posterior distribution over the parameters .

4.25 (★★) Suppose we wish to approximate the logistic sigmoid $\sigma(a)$ defined by (4.59) by a scaled probit function $\Phi(\lambda a)$ , where $\Phi(a)$ is defined by (4.114). Show that if λ is chosen so that the derivatives of the two functions are equal at $a = 0$ , then $\lambda^{2} = \pi / 8$

## 4. LINEAR MODELS FOR CLASSIFICATION

4.26 (★★) In this exercise, we prove the relation (4.152) for the convolution of a probit function with a Gaussian distribution. To do this, show that the derivative of the left hand side with respect to $\mu$ is equal to the derivative of the right-hand side, and then integrate both sides with respect to $\mu$ and then show that the constant of integration vanishes. Note that before differentiating the left-hand side, it is convenient first to introduce a change of variable given by $a = \mu + \sigma z$ so that the integral over a is replaced by an integral over $z.$ When we differentiate the left-hand side of the relation (4.152), we will then obtain a Gaussian integral over z that can be evaluated analytically.


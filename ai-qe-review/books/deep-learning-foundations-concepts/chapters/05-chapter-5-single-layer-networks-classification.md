---
title: "Chapter 5 \u2014 Single-layer Networks: Classification"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 5
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 4302
source_line_end: 5296
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 21
source_empty_image_alt: 21
non_semantic_image_alt: 15
caption_derived_image_alt: 6
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
  - deep-learning
  - official-syllabus
---

# Chapter 5 — Single-layer Networks: Classification

> [[../README|本书目录]] · [[04-chapter-4-single-layer-networks-regression|上一章]] · [[06-chapter-6-deep-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 4302–5296。
> - 本章保留 21 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 5.1. Discriminant Functions

A discriminant is a function that takes an input vector x and assigns it to one of K classes, denoted $\mathcal{C}_{k}$ . In this chapter, we will restrict attention to linear discriminants, namely those for which the decision surfaces are hyperplanes. To simplify the discussion, we consider first two classes and then investigate the extension to $K > 2$ classes.

## 5.1.1 Two classes

The simplest representation of a linear discriminant function is obtained by taking a linear function of the input vector so that

$$
y(\mathbf{x}) = \mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}\tag{5.2}
$$

where w is called a weight vector, and $w_{0}$ is a bias (not to be confused with bias in the statistical sense). An input vector x is assigned to class $\mathcal{C}_{1}$ if $y(\mathbf{x}) \geqslant 0$ and to class $\mathcal{C}_{2}$ otherwise. The corresponding decision boundary is therefore defined by the relation $y(\mathbf{x}) = 0$ , which corresponds to a $(D - 1)$ -dimensional hyperplane within the D-dimensional input space. Consider two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ both of which lie on the decision surface. Because $y(\mathbf{x}_{\mathrm{A}}) = y(\mathbf{x}_{\mathrm{B}}) = 0$ , we have $\mathbf{w}^{\mathrm{T}}(\mathbf{x}_{\mathrm{A}} - \mathbf{x}_{\mathrm{B}}) = 0$ and hence the vector w is orthogonal to every vector lying within the decision surface, and so w determines the orientation of the decision surface. Similarly, if x is a point on the decision surface, then $y(\mathbf{x}) = 0$ , and so the normal distance from the origin to the decision surface is given by

Figure 5.1 Illustration of the geometry of a linear discriminant function in two dimensions. The decision surface, shown in red, is perpendicular to <sup>w</sup>, and its displacement from the origin is controlled by the bias parameter $w_{0}$ . Also, the signed orthogonal distance of a general point <sup>x</sup> from the decision surface is given by $y(\mathbf{x}) / \| \mathbf{w} \|$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/52d85b32ec17f4b99871248cef15bfdfc815a6d188fe496addf2a4c6a97b6118.jpg)

$$
{\frac{\mathbf{w}^{\mathrm{T}} \mathbf{x}}{\| \mathbf{w} \|}} = -{\frac{w_{0}}{\| \mathbf{w} \|}}.\tag{5.3}
$$

We therefore see that the bias parameter $w_{0}$ determines the location of the decision surface. These properties are illustrated for the case of $D = 2$ in Figure 5.1.

Furthermore, note that the value of $y(\mathbf x)$ gives a signed measure of the perpendicular distance r of the point x from the decision surface. To see this, consider an arbitrary point x and let $\mathbf{x}_{\bot}$ be its orthogonal projection onto the decision surface, so that

$$
\mathbf{x} = \mathbf{x}_{\perp} + r \frac{\mathbf{w}}{\| \mathbf{w} \|}.\tag{5.4}
$$

Multiplying both sides of this result by ${\mathbf w}^{\mathrm{T}}$ and adding $w_{0}$ , and making use of $y(\mathbf{x}) =$ $\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0}$ and $y(\mathbf{x}_{\perp}) = \mathbf{w}^{\mathrm{T}} \mathbf{x}_{\perp} + w_{0} = 0$ , we have

$$
r = \frac{y(\mathbf{x})}{\| \mathbf{w} \|}.\tag{5.5}
$$

This result is illustrated in Figure 5.1.

As with linear regression models, it is sometimes convenient to use a more compact notation in which we introduce an additional dummy ‘input’ value $x_{0} = 1$ and then define $\widetilde{\mathbf{w}} =(w_{0}, \mathbf{w})$ and $\widetilde{\mathbf{x}} = \left(x_{0}, \mathbf{x} \right)$ so that

$$
y(\mathbf{x}) = \widetilde{\mathbf{w}}^{\mathrm{T}} \widetilde{\mathbf{x}}.\tag{5.6}
$$

![Figure 5.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/43f9d0a16da258cb8b7ef9a0ea400195c717d08501f756aa8dcf8b37b0958f12.jpg)  
Figure 5.2 Attempting to construct a K-class discriminant from a set of two-class discriminant functions leads to ambiguous regions, as shown in green. On the left is an example with two discriminant functions designed to distinguish points in class $\mathcal{C}_{k}$ from points not in class $\mathcal{C}_{k}$ . On the right is an example involving three discriminant functions each of which is used to separate a pair of classes $\mathcal{C}_{k}$ and $\mathcal{C}_{j}$

In this case, the decision surfaces are D-dimensional hyperplanes passing through the origin of the (D + 1)-dimensional expanded input space.

## 5.1.2 Multiple classes

Now consider the extension of linear discriminant functions to $K > 2$ classes. We might be tempted to build a K-class discriminant by combining a number of two-class discriminant functions. However, this leads to some serious difficulties (Duda and Hart, 1973), as we now show.

Consider a model with $K - 1$ classifiers, each of which solves a two-class problem of separating points in a particular class $\mathcal{C}_{k}$ from points not in that class. This is known as a one-versus-the-rest classifier. The left-hand example in Figure 5.2 shows an example involving three classes where this approach leads to regions of input space that are ambiguously classified.

An alternative is to introduce $K(K - 1) / 2$ binary discriminant functions, one for every possible pair of classes. This is known as a one-versus-one classifier. Each point is then classified according to a majority vote amongst the discriminant functions. However, this too runs into the problem of ambiguous regions, as illustrated in the right-hand diagram of Figure 5.2.

We can avoid these difficulties by considering a single K-class discriminant comprising K linear functions of the form

$$
y_{k}(\mathbf{x}) = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x} + w_{k0}\tag{5.7}
$$

and then assigning a point x to class $\mathcal{C}_{k}$ if $y_{k}(\mathbf x) > y_{j}(\mathbf x)$ for all $j \neq k$ . The decision boundary between class $\mathcal{C}_{k}$ and class $\mathcal{C}_{j}$ is therefore given by $y_{k}(\mathbf x) = y_{j}(\mathbf x)$ and

Figure 5.3 Illustration of the decision regions for a multi-class linear discriminant, with the decision boundaries shown in red. If two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ both lie inside the same decision region $\mathcal{R}_{k}$ , then any point $\widehat{\mathbf{x}}$ that lies on the line connecting these two points must also lie in $\mathcal{R}_{k}$ , and hence, the decision region must be singly connected and convex.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/6b51baf893175bfac5d6c63e1586fa0d007ca0774f28b730599494220823418a.jpg)

hence corresponds to a (D  1)-dimensional hyperplane defined by

$$
(\mathbf{w}_{k} - \mathbf{w}_{j})^{\mathrm{T}} \mathbf{x} +(w_{k0} - w_{j0}) = 0.\tag{5.8}
$$

This has the same form as the decision boundary for the two-class case discussed in Section 5.1.1, and so analogous geometrical properties apply.

The decision regions of such a discriminant are always singly connected and convex. To see this, consider two points $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ both of which lie inside decision region $\mathcal{R}_{k}$ , as illustrated in Figure 5.3. Any point $\widehat{\mathbf{x}}$ that lies on the line connecting $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ can be expressed in the form

$$
\widehat{\mathbf{x}} = \lambda \mathbf{x}_{\mathrm{A}} +(1 - \lambda) \mathbf{x}_{\mathrm{B}}\tag{5.9}
$$

where $0 \leqslant \lambda \leqslant 1$ . From the linearity of the discriminant functions, it follows that

$$
y_{k}(\widehat \mathbf{x}) = \lambda y_{k}(\mathbf{x}_{\mathrm{A}}) +(1 - \lambda) y_{k}(\mathbf{x}_{\mathrm{B}}).\tag{5.10}
$$

Because both $\mathbf{x}_{\mathrm{A}}$ and $\mathbf{x}_{\mathrm{B}}$ lie inside $\mathcal{R}_{k}$ , it follows that $y_{k}(\mathbf{x}_{\mathrm{A}}) > y_{j}(\mathbf{x}_{\mathrm{A}})$ and that $y_{k}(\mathbf x_{\mathrm{B}}) > y_{j}(\mathbf x_{\mathrm{B}})$ , for all $j \neq k$ , and hence $y_{k}(\widehat{\mathbf x}) > y_{j}(\widehat{\mathbf x})$ , and $\mathbf{s} \mathbf{o} \widehat{\mathbf{x}}$ also lies inside $\mathcal{R}_{k}$ . Thus, $\mathcal{R}_{k}$ is singly connected and convex.

Note that for two classes, we can either employ the formalism discussed here, based on two discriminant functions $y_{1}(\mathbf x)$ and $y_{2}(\mathbf x)$ , or else use the simpler but essentially equivalent formulation based on a single discriminant function $y(\mathbf x)$

## 5.1.3 1-of-K coding

For regression problems, the target variable t was simply the vector of real numbers whose values we wish to predict. In classification, there are various ways of using target values to represent class labels. For two-class problems, the most convenient is the binary representation in which there is a single target variable $t \in \{0, 1\}$ such that $t = 1$ represents class $\mathcal{C}_{1}$ and $t = 0$ represents class $\mathcal{C}_{2}$ . We can interpret the value of t as the probability that the class is $\mathcal{C}_{1}$ , with the probability values taking only the extreme values of 0 and 1. For $K > 2$ classes, it is convenient to use a 1-of-K coding scheme, also known as the one-hot encoding scheme, in which t is a vector of length K such that if the class is $\mathcal{C}_{j}$ , then all elements $t_{k}$ of t are zero except element $t_{j}$ , which takes the value 1. For instance, if we have $K = 5$ classes, then a data point from class 2 would be given the target vector

$$
{\bf t} =(0, 1, 0, 0, 0)^{\mathrm{T}}.\tag{5.11}
$$

Again, we can interpret the value of $t_{k}$ as the probability that the class is $\mathcal{C}_{k}$ in which the probabilities take only the values 0 and 1.

## 5.1.4 Least squares for classification

With linear regression models, the minimization of a sum-of-squares error function leads to a simple closed-form solution for the parameter values. It is therefore tempting to see if we can apply the same least-squares formalism to classification problems. Consider a general classification problem with K classes and a 1-of-K binary coding scheme for the target vector t. One justification for using least squares in such a context is that it approximates the conditional expectation $\mathbb{E}[\mathbf{t} | \mathbf{x}]$ of the target values given the input vector. For a binary coding scheme, this conditional expectation is given by the vector of posterior class probabilities. Unfortunately, these probabilities are typically approximated rather poorly, and indeed the approximations can have values outside the range (0, 1). However, it is instructional to explore these simple models and to understand how these limitations arise.

Each class $\mathcal{C}_{k}$ is described by its own linear model so that

$$
y_{k}(\mathbf{x}) = \mathbf{w}_{k}^{\mathrm{T}} \mathbf{x} + w_{k0}\tag{5.12}
$$

where $k = 1, \ldots, K$ . We can conveniently group these together using vector notation so that

$$
\mathbf{y}(\mathbf{x}) = \widetilde{\mathbf{W}}^{\mathrm{T}} \widetilde{\mathbf{x}}\tag{5.13}
$$

where $\widetilde{\mathbf{W}}$ is a matrix whose kth column comprises the $(D + 1)$ -dimensional vector $\widetilde{\mathbf{w}}_{k} =(w_{k0}, \mathbf{w}_{k}^{\mathrm{T}})^{\mathrm{T}}$ and x is the corresponding augmented input vector $(1, \mathbf{x}^{\mathrm{T}})^{\mathrm{T}}$ with a dummy input $x_{0} = 1$ . A new input x is then assigned to the class for which the output $y_{k} = \widetilde{\mathbf{w}}_{k}^{\mathrm{T}} \widetilde{\mathbf{x}}$ is largest.

We now determine the parameter matrix $\widetilde{\mathbf{W}}$ by minimizing a sum-of-squares error function. Consider a training data set $\{\mathbf{x}_{n}, \mathbf{t}_{n}\}$ where $n = 1, \ldots, N$ , and define a matrix T whose nth row is the vector $\mathbf{t}_{n}^{\mathrm{T}}$ , together with a matrix $\widetilde{\mathbf{X}}$ whose nth row is $\widetilde{\mathbf{x}}_{n}^{\mathrm{{T}}}$ . The sum-of-squares error function can then be written as

$$
E_{D}(\widetilde{\mathbf{W}}) = \frac{1}{2} \mathrm{Tr} \left\{(\widetilde{\mathbf{X}} \widetilde{\mathbf{W}} - \mathbf{T})^{\mathrm{T}}(\widetilde{\mathbf{X}} \widetilde{\mathbf{W}} - \mathbf{T}) \right\}.\tag{5.14}
$$

Setting the derivative with respect to $\widetilde{\mathbf{W}}$ to zero and rearranging, we obtain the solution for $\widetilde{\mathbf{W}}$ in the form

$$
\widetilde{\bf W} =(\widetilde{\bf X}^{\mathrm{T}} \widetilde{\bf X})^{- 1} \widetilde{\bf X}^{\mathrm{T}}{\bf T} = \widetilde{\bf X}^{\dagger}{\bf T}\tag{5.15}
$$

where $\widetilde{\mathbf{X}}^{\dagger}$ is the pseudo-inverse of the matrix $\widetilde{\mathbf{X}}$ . We then obtain the discriminant

function in the form

$$
\begin{array}{r}{\mathbf{y}(\mathbf{x}) = \widetilde{\mathbf{W}}^{\mathrm{T}} \widetilde{\mathbf{x}} = \mathbf{T}^{\mathrm{T}} \left(\widetilde{\mathbf{X}}^{\dagger} \right)^{\mathrm{T}} \widetilde{\mathbf{x}}.} \end{array}\tag{5.16}
$$

An interesting property of least-squares solutions with multiple target variables is that if every target vector in the training set satisfies some linear constraint

$$
\mathbf{a}^{\mathrm{T}} \mathbf{t}_{n} + b = 0\tag{5.17}
$$

for some constants a and b, then the model prediction for any value of x will satisfy the same constraint so that

$$
\mathbf{a}^{\mathrm{T}} \mathbf{y}(\mathbf{x}) + b = 0.\tag{5.18}
$$

Thus, if we use a 1-of-K coding scheme for K classes, then the predictions made by the model will have the property that the elements of $\mathbf{y}(\mathbf{x})$ will sum to 1 for any value of x. However, this summation constraint alone is not sufficient to allow the model outputs to be interpreted as probabilities because they are not constrained to lie within the interval (0, 1).

The least-squares approach gives an exact closed-form solution for the discriminant function parameters. However, even as a discriminant function (where we use it to make decisions directly and dispense with any probabilistic interpretation), it suffers from some severe problems. We have seen that the sum-of-squares error function can be viewed as the negative log likelihood under the assumption of a Gaussian noise distribution. If the true distribution of the data is markedly different from being Gaussian, then least squares can give poor results. In particular, least squares is very sensitive to the presence of outliers, which are data points located a long way from the bulk of the data. This is illustrated in Figure 5.4. Here we see that the additional data points in the right-hand figure produce a significant change in the location of the decision boundary, even though these points would be correctly classified by the original decision boundary in the left-hand figure. The sum-of-squares error function gives too much weight to data points that are a long way from the decision boundary, even though they are correctly classified. Outliers can arise due to rare events or may simply be due to mistakes in the data set. Techniques that are sensitive to a very few data points are said to lack robustness. For comparison, Figure 5.4 also shows results from a technique called logistic regression, which is more robust to outliers.

The failure of least squares should not surprise us when we recall that it corresponds to maximum likelihood under the assumption of a Gaussian conditional distribution, whereas binary target vectors clearly have a distribution that is far from Gaussian. By adopting more appropriate probabilistic models, we can obtain classification techniques with much better properties than least squares, and which can also be generalized to give flexible nonlinear neural network models, as we will see in later chapters.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/da7cf2f517f4e28c592f1aebf2d1a15347901b8df117df823f30aa0500e32988.jpg)

![Figure 5.4](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1a83ad400d5cbf079291e9834cc2322678c9d17d2354ec374835d0fc2bd2f056.jpg)  
Figure 5.4 The left-hand plot shows data from two classes, denoted by red crosses and blue circles, together with the decision boundaries found by least squares (magenta curve) and by a logistic regression model (green curve). The right-hand plot shows the corresponding results obtained when extra data points are added at the bottom right of the diagram, showing that least squares is highly sensitive to outliers, unlike logistic regression.

## 5.2. Decision Theory

When we discussed linear regression we saw how the process of making predictions in machine learning can be broken down into the two stages of inference and decision. We now explore this perspective in much greater depth specifically in the context of classifiers.

Suppose we have an input vector x together with a corresponding vector t of target variables, and our goal is to predict t given a new value for x. For regression problems, t will comprise continuous variables and in general will be a vector as we may wish to predict several related quantities. For classification problems, t will represent class labels. Again, t will in general be a vector if we have more than two classes. The joint probability distribution $p(\mathbf{x}, \mathbf{t})$ provides a complete summary of the uncertainty associated with these variables. Determining $p(\mathbf{x}, \mathbf{t})$ from a set of training data is an example of inference and is typically a very difficult problem whose solution forms the subject of much of this book. In a practical application, however, we must often make a specific prediction for the value of t or more generally take a specific action based on our understanding of the values t is likely to take, and this aspect is the subject of decision theory.

Consider, for example, our earlier medical diagnosis problem in which we have taken an image of a skin lesion on a patient, and we wish to determine whether the patient has cancer. In this case, the input vector x is the set of pixel intensities in the image, and the output variable t will represent the absence of cancer, which we denote by the class $\mathcal{C}_{1}$ , or the presence of cancer, which we denote by the class $\mathcal{C}_{2}$ We might, for instance, choose t to be a binary variable such that $t = 0$ corresponds to class $\mathcal{C}_{1}$ and $t = 1$ corresponds to class $\mathcal{C}_{2}$ . We will see later that this choice of label values is particularly convenient when working with probabilities. The general inference problem then involves determining the joint distribution $p(\mathbf{x}, \mathcal{C}_{k})$ , or equivalently $\boldsymbol{p}(\mathbf{x}, t)$ , which gives us the most complete probabilistic description of the variables. Although this can be a very useful and informative quantity, ultimately, we must decide either to give treatment to the patient or not, and we would like this choice to be optimal according to some appropriate criterion (Duda and Hart, 1973). This is the decision step, and the aim of decision theory is that it should tell us how to make optimal decisions given the appropriate probabilities. We will see that the decision stage is generally very simple, even trivial, once we have solved the inference problem. Here we give an introduction to the key ideas of decision theory as required for the rest of the book. Further background, as well as more detailed accounts, can be found in Berger (1985) and Bather (2000).

Before giving a more detailed analysis, let us first consider informally how we might expect probabilities to play a role in making decisions. When we obtain the skin image x for a new patient, our goal is to decide which of the two classes to assign the image to. We are therefore interested in the probabilities of the two classes, given the image, which are given by $p(\mathcal{C}_{k} \vert \mathbf{x})$ . Using Bayes’ theorem, these probabilities can be expressed in the form

$$
p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{p(\mathbf{x})}.\tag{5.19}
$$

Note that any of the quantities appearing in Bayes’ theorem can be obtained from the joint distribution $p(\mathbf{x}, \mathcal{C}_{k})$ by either marginalizing or conditioning with respect to the appropriate variables. We can now interpret $p(\mathcal{C}_{k})$ as the prior probability for the class $\mathcal{C}_{k}$ and $p(\mathcal{C}_{k} \vert \mathbf{x})$ as the corresponding posterior probability. Thus, $p(\mathcal{C}_{1})$ represents the probability that a person has cancer, before the image is taken. Similarly, $p(\mathcal{C}_{1} | \mathbf{x})$ is the posterior probability, revised using Bayes’ theorem in light of the information contained in the image. If our aim is to minimize the chance of assigning x to the wrong class, then intuitively we would choose the class having the higher posterior probability. We now show that this intuition is correct, and we also discuss more general criteria for making decisions.

## 5.2.1 Misclassification rate

Suppose that our goal is simply to make as few misclassifications as possible. We need a rule that assigns each value of x to one of the available classes. Such a rule will divide the input space into regions $\mathcal{R}_{k}$ called decision regions, one for each class, such that all points in $\mathcal{R}_{k}$ are assigned to class $\mathcal{C}_{k}$ . The boundaries between decision regions are called decision boundaries or decision surfaces. Note that each decision region need not be contiguous but could comprise some number of disjoint regions. To find the optimal decision rule, consider first the case of two classes, as in the cancer problem, for instance. A mistake occurs when an input vector belonging to class $\mathcal{C}_{1}$ is assigned to class $\mathcal{C}_{2}$ or vice versa. The probability of this occurring is given by

$$
\begin{array}{rcl}{p \mathrm{(mistake)}} &{=} &{p \mathrm(\mathbf x \in \mathcal{R}_{1}, \mathcal{C}_{2} \mathrm) + p \mathrm(\mathbf x \in \mathcal{R}_{2}, \mathcal{C}_{1} \mathrm)} \\ &{=} &{\displaystyle \int_{\mathcal{R}_{1}} p(\mathbf x, \mathcal{C}_{2}) d \mathbf x + \int_{\mathcal{R}_{2}} p(\mathbf x, \mathcal{C}_{1}) d \mathbf x.} \end{array}\tag{5.20}
$$

We are free to choose the decision rule that assigns each point x to one of the two classes. Clearly, to minimize $p(\mathrm{mistake})$ we should arrange that each x is assigned to whichever class has the smaller value of the integrand in (5.20). Thus, if $p(\mathbf{x}, \mathcal{C}_{1}) > p(\mathbf{x}, \mathcal{C}_{2})$ for a given value of x, then we should assign that x to class $\mathcal{C}_{1}$ . From the product rule of probability, we have $p(\mathbf{x}, \mathcal{C}_{k}) = p(\mathcal{C}_{k} | \mathbf{x}) p(\mathbf{x})$ . Because the factor $p(\mathbf{x})$ is common to both terms, we can restate this result as saying that the minimum probability of making a mistake is obtained if each value of x is assigned to the class for which the posterior probability $p(\mathcal{C}_{k} \vert \mathbf{x})$ is largest. This result is illustrated for two classes and a single input variable x in Figure 5.5.

For the more general case of $K$ classes, it is slightly easier to maximize the probability of being correct, which is given by

$$
\begin{array}{lll}{p(\mathrm{correct})} &{=} &{\displaystyle \sum_{k = 1}^{K} p(\mathbf x \in{\mathcal R}_{k},{\mathcal C}_{k})} \\ &{=} &{\displaystyle \sum_{k = 1}^{K} \int_{\mathcal R_{k}} p(\mathbf x,{\mathcal C}_{k}) \mathrm d \mathbf x,} \end{array}\tag{5.21}
$$

which is maximized when the regions $\mathcal{R}_{k}$ are chosen such that each x is assigned to the class for which $p(\mathbf{x}, \mathcal{C}_{k})$ is largest. Again, using the product rule $p(\mathbf{x}, \mathcal{C}_{k}) =$ $p(\mathcal{C}_{k} | \mathbf{x}) p(\mathbf{x})$ , and noting that the factor of $p(\mathbf{x})$ is common to all terms, we see that each x should be assigned to the class having the largest posterior probability $p(\mathcal{C}_{k} | \mathbf{x})$

## 5.2.2 Expected loss

For many applications, our objective will be more complex than simply minimizing the number of misclassifications. Let us consider again the medical diagnosis problem. We note that, if a patient who does not have cancer is incorrectly diagnosed as having cancer, the consequences may be that they experience some distress plus there is the need for further investigations. Conversely, if a patient with cancer is diagnosed as healthy, the result may be premature death due to lack of treatment. Thus, the consequences of these two types of mistake can be dramatically different. It would clearly be better to make fewer mistakes of the second kind, even if this was at the expense of making more mistakes of the first kind.

We can formalize such issues through the introduction of a loss function, also called a cost function, which is a single, overall measure of loss incurred in taking any of the available decisions or actions. Our goal is then to minimize the total loss incurred. Note that some authors consider instead a utility function, whose value

R2  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/f3a343bee0a5a4e7a85102ae33827aa83e217d983bf66040ac503068d8963edf.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d87eccc579a597cbc9c28c1de4e6579cfdbf59c8e95aa94adeac64ea9ae039d6.jpg)  
(b)  
Figure 5.5 Schematic illustration of the joint probabilities $p(x, \mathcal{C}_{k})$ for each of two classes plotted against $x,$ together with the decision boundary $x ={\widehat{x}}$ . Values of x $\geqslant \dot{\widehat{x}}$ are classified as class $\mathcal{C}_{2}$ and hence belong to decision region $\mathcal{R}_{2}$ , whereas points $x <{\widehat{x}}$ are classified as $\mathcal{C}_{1}$ and belong to $\mathcal{R}_{1}$ . Errors arise from the blue, green, and red regions, so that for $x <{\widehat{x}}$ , the errors are due to points from class $\mathcal{C}_{2}$ being misclassified as $\mathcal{C}_{1}$ (represented by the sum of the red and green regions). Conversely for points in the region ${\widehat{\boldsymbol{x}}} \geqslant{\widehat{\boldsymbol{x}}},$ the errors are due to points from class $\mathcal{C}_{1}$ being misclassified as $\mathcal{C}_{2}$ (represented by the blue region). By varying the location x<sup>b</sup> of the decision boundary, as indicated by the red double-headed arrow in (a), the combined areas of the blue and green regions remains constant, whereas the size of the red region varies. The optimal choice for $\widehat{x}$ is where the curves for $p(x, \mathcal{C}_{1})$ and $p(x, \mathcal{C}_{2})$ cross, as shown in (b) and corresponding to $\widehat{\boldsymbol{x}} = \boldsymbol{x}_{0}$ , because in this case the red region disappears. This is equivalent to the minimum misclassification rate decision rule, which assigns each value of x to the class having the higher posterior probability $p(\mathcal{C}_{k} | x)$

Figure 5.6 An example of a loss matrix with elements normal cancer $L_{kj}$ for the cancer treatment problem. The rows cor  
respond to the true class, whereas the columns corre- normal 0 1 spond to the assignment of class made by our decision cancer 100 0 criterion.

they aim to maximize. These are equivalent concepts if we take the utility to be simply the negative of the loss. Throughout this text we will use the loss function convention. Suppose that, for a new value of x, the true class is $\mathcal{C}_{k}$ and that we assign x to class $\mathcal{C}_{j}$ (where $j$ may or may not be equal to k). In so doing, we incur some level of loss that we denote by $L_{kj}$ , which we can view as the $k, j$ element of a loss matrix. For instance, in our cancer example, we might have a loss matrix of the form shown in Figure 5.6. This particular loss matrix says that there is no loss incurred if the correct decision is made, there is a loss of 1 if a healthy patient is diagnosed as having cancer, whereas there is a loss of 100 if a patient having cancer is diagnosed as healthy.

The optimal solution is the one that minimizes the loss function. However, the loss function depends on the true class, which is unknown. For a given input vector x, our uncertainty in the true class is expressed through the joint probability distribution $p(\mathbf{x}, \mathcal{C}_{k})$ , and so we seek instead to minimize the average loss, where the average is computed with respect to this distribution and is given by

$$
\mathbb{E}[L] = \sum_{k} \sum_{j} \int_{\mathcal{R}_{j}} L_{kj} p(\mathbf{x}, \mathcal{C}_{k}) d \mathbf{x}.\tag{5.22}
$$

Each x can be assigned independently to one of the decision regions $\mathcal{R}_{j}$ . Our goal is to choose the regions $\mathcal{R}_{j}$ to minimize the expected loss (5.22), which implies that for each x, we should minimize $\begin{array}{r}{\sum_{k} L_{kj} p(\mathbf x, \bar{\mathcal{C}}_{k})} \end{array}$ . As before, we can use the product rule $p(\mathbf{x}, \mathcal{C}_{k}) = p(\mathcal{C}_{k} | \mathbf{x}) p(\mathbf{x})$ to eliminate the common factor of $p(\mathbf{x})$ . Thus, the decision rule that minimizes the expected loss assigns each new x to the class j for which the quantity

$$
\sum_{k} L_{kj} p(\mathcal{C}_{k} | \mathbf{x})\tag{5.23}
$$

is a minimum. Once we have chosen values for the loss matrix elements $L_{kj}$ , this is clearly trivial to do.

## 5.2.3 The reject option

We have seen that classification errors arise from the regions of input space where the largest of the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ is significantly less than unity or equivalently where the joint distributions $p(\mathbf{x}, \mathcal{C}_{k})$ have comparable values. These are the regions where we are relatively uncertain about class membership. In some applications, it will be appropriate to avoid making decisions on the difficult cases in anticipation of obtaining a lower error rate on those examples for which a classification decision is made. This is known as the reject option. For example, in our hypothetical cancer screening example, it may be appropriate to use an automatic system to classify those images for which there is little doubt as to the correct class, while requesting a biopsy to classify the more ambiguous cases. We can achieve this by introducing a threshold θ and rejecting those inputs x for which the largest of the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ is less than or equal to θ. This is illustrated for two classes and a single continuous input variable x in Figure 5.7. Note that setting $\theta = 1$ will ensure that all examples are rejected, whereas if there are K classes, then setting $\theta < 1 / K$ will ensure that no examples are rejected. Thus, the fraction of examples that are rejected is controlled by the value of θ.

Figure 5.7 Illustration of the reject option. Inputs x such that the larger of the two posterior probabilities is less than or equal to some threshold θ will be rejected.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d26ee37b8cc45e2b0bd5258fc1df05cacce7b18c38afdbd0d303e44b727c2137.jpg)

We can easily extend the reject criterion to minimize the expected loss, when a loss matrix is given, by taking account of the loss incurred when a reject decision is made.

## 5.2.4 Inference and decision

We have broken the classification problem down into two separate stages, the inference stage in which we use training data to learn a model for $p(\mathcal{C}_{k} \vert \mathbf{x})$ and the subsequent decision stage in which we use these posterior probabilities to make optimal class assignments. An alternative possibility would be to solve both problems together and simply learn a function that maps inputs x directly into decisions. Such a function is called a discriminant function.

In fact, we can identify three distinct approaches to solving decision problems, all of which have been used in practical applications. These are, in decreasing order of complexity, as follows:

(a) First, solve the inference problem of determining the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ for each class $\mathcal{C}_{k}$ individually. Separately infer the prior class probabilities $p(\mathcal{C}_{k})$ . Then use Bayes’ theorem in the form

$$
p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{p(\mathbf{x})}\tag{5.24}
$$

to find the posterior class probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ . As usual, the denominator in

Bayes’ theorem can be found in terms of the quantities in the numerator, using

$$
p(\mathbf{x}) = \sum_{k} p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k}).\tag{5.25}
$$

Equivalently, we can model the joint distribution $p(\mathbf{x}, \mathcal{C}_{k})$ directly and then normalize to obtain the posterior probabilities. Having found the posterior probabilities, we use decision theory to determine the class membership for each new input x. Approaches that explicitly or implicitly model the distribution of inputs as well as outputs are known as generative models, because by sampling from them, it is possible to generate synthetic data points in the input space.

(b) First, solve the inference problem of determining the posterior class probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ , and then subsequently use decision theory to assign each new x to one of the classes. Approaches that model the posterior probabilities directly are called discriminative models.

(c) Find a function $f(\mathbf{x})$ , called a discriminant function, that maps each input x directly onto a class label. For instance, for two-class problems, $f(\cdot)$ might be binary valued and such that $f = 0$ represents class $\mathcal{C}_{1}$ and $f = 1$ represents class $\mathcal{C}_{2}$ . In this case, probabilities play no role.

Let us consider the relative merits of these three alternatives. Approach (a) is the most demanding because it involves finding the joint distribution over both x and $\mathcal{C}_{k}$ . For many applications, x will have high dimensionality, and consequently, we may need a large training set to be able to determine the class-conditional densities to reasonable accuracy. Note that the class priors $p(\mathcal{C}_{k})$ can often be estimated simply from the fractions of the training set data points in each of the classes. One advantage of approach (a), however, is that it also allows the marginal density of data $p(\mathbf{x})$ to be determined from (5.25). This can be useful for detecting new data points that have low probability under the model and for which the predictions may be of low accuracy, which is known as outlier detection or novelty detection (Bishop, 1994; Tarassenko, 1995).

However, if we wish only to make classification decisions, then it can be wasteful of computational resources and excessively demanding of data to find the joint distribution $p(\mathbf{x}, \mathcal{C}_{k})$ when in fact we really need only the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ , which can be obtained directly through approach (b). Indeed, the classconditional densities may contain a significant amount of structure that has little effect on the posterior probabilities, as illustrated in Figure 5.8. There has been much interest in exploring the relative merits of generative and discriminative approaches to machine learning and in finding ways to combine them (Jebara, 2004; Lasserre, Bishop, and Minka, 2006).

An even simpler approach is (c) in which we use the training data to find a discriminant function $f(\mathbf{x})$ that maps each x directly onto a class label, thereby combining the inference and decision stages into a single learning problem. In the example of Figure 5.8, this would correspond to finding the value of x shown by the vertical green line, because this is the decision boundary giving the minimum probability of misclassification.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/dec08ecde476e5608bafc32499be09c8199057f56294f6f4d2691bacdf8c656f.jpg)

![Figure 5.8](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/5ed30991242f966c4b7479376a008085cdb28d00b8ddbcc5f46fb101ec49ecec.jpg)  
Figure 5.8 Example of the class-conditional densities for two classes having a single input variable $x$ (left plot) together with the corresponding posterior probabilities (right plot). Note that the left-hand mode of the class-conditional density $p(\mathbf{x} | \dot{\mathcal{C}}_{1})$ , shown in blue on the left plot, has no effect on the posterior probabilities. The vertical green line in the right plot shows the decision boundary in x that gives the minimum misclassification rate, assuming the prior class probabilities, $p(\mathcal{C}_{1})$ and $p(\mathcal{C}_{2})$ , are equal.

With option (c), however, we no longer have access to the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ . There are many powerful reasons for wanting to compute the posterior probabilities, even if we subsequently use them to make decisions. These include:

Minimizing risk. Consider a problem in which the elements of the loss matrix are subjected to revision from time to time (such as might occur in a financial application). If we know the posterior probabilities, we can trivially revise the minimum risk decision criterion by modifying (5.23) appropriately. If we have only a discriminant function, then any change to the loss matrix would require that we return to the training data and solve the inference problem afresh.

Reject option. Posterior probabilities allow us to determine a rejection criterion that will minimize the misclassification rate, or more generally the expected loss, for a given fraction of rejected data points.

Compensating for class priors. Consider our cancer screening example again, and suppose that we have collected a large number of images from the general population for use as training data, which we use to build an automated screening system. Because cancer is rare amongst the general population, we might find that, say, only 1 in every 1,000 examples corresponds to the presence of cancer.

If we used such a data set to train an adaptive model, we could run into severe difficulties due to the small proportion of those in the cancer class. For instance, a classifier that assigned every point to the normal class would achieve 99.9% accuracy, and it may be difficult to avoid this trivial solution. Also, even a large data set will contain very few examples of skin images corresponding to cancer, and so the learning algorithm will not be exposed to a broad range of examples of such images and hence is not likely to generalize well. A balanced data set with equal numbers of examples from each of the classes would allow us to find a more accurate model. However, we then have to compensate for the effects of our modifications to the training data. Suppose we have used such a modified data set and found models for the posterior probabilities. From Bayes’ theorem (5.24), we see that the posterior probabilities are proportional to the prior probabilities, which we can interpret as the fractions of points in each class. We can therefore simply take the posterior probabilities obtained from our artificially balanced data set, divide by the class fractions in that data set, and then multiply by the class fractions in the population to which we wish to apply the model. Finally, we need to normalize to ensure that the new posterior probabilities sum to one. Note that this procedure cannot be applied if we have learned a discriminant function directly instead of determining posterior probabilities.

Combining models. For complex applications, we may wish to break the problem into a number of smaller sub-problems each of which can be tackled by a separate module. For example, in our hypothetical medical diagnosis problem, we may have information available from, say, blood tests as well as skin images. Rather than combine all of this heterogeneous information into one huge input space, it may be more effective to build one system to interpret the images and a different one to interpret the blood data. If each of the two models gives posterior probabilities for the classes, then we can combine the outputs systematically using the rules of probability. One simple way to do this is to assume that, for each class separately, the distributions of inputs for the images, denoted by $\mathbf{x}_{\mathrm{I}}$ , and the blood data, denoted by $\mathbf{x}_{\mathrm{B}}$ , are independent, so that

$$
\begin{array}{r}{p(\mathbf{x}_{\mathrm{I}}, \mathbf{x}_{\mathrm{B}} | \mathcal{C}_{k}) = p(\mathbf{x}_{\mathrm{I}} | \mathcal{C}_{k}) p(\mathbf{x}_{\mathrm{B}} | \mathcal{C}_{k}).} \end{array}\tag{5.26}
$$

This is an example of a conditional independence property, because the independence holds when the distribution is conditioned on the class $\mathcal{C}_{k}$ . The posterior probability, given both the image and blood data, is then given by

$$
\begin{array}{rcl}{p(\mathcal{C}_{k} | \mathbf{x}_{\mathrm{I}}, \mathbf{x}_{\mathrm{B}})} &{\propto} &{p(\mathbf{x}_{\mathrm{I}}, \mathbf{x}_{\mathrm{B}} | \mathcal{C}_{k}) p(\mathcal{C}_{k})} \\ &{\propto} &{p(\mathbf{x}_{\mathrm{I}} | \mathcal{C}_{k}) p(\mathbf{x}_{\mathrm{B}} | \mathcal{C}_{k}) p(\mathcal{C}_{k})} \\ &{\propto} &{\frac{p(\mathcal{C}_{k} | \mathbf{x}_{\mathrm{I}}) p(\mathcal{C}_{k} | \mathbf{x}_{\mathrm{B}})}{p(\mathcal{C}_{k})}.} \end{array}\tag{5.27}
$$

Thus, we need the class prior probabilities $p(\mathcal{C}_{k})$ , which we can easily estimate from the fractions of data points in each class, and then we need to normalize

Figure 5.9 The confusion matrix for the cancer treatment problem, in which the rows correspond to the true class and the columns correspond to the assignment of class made by our decision criterion. The elements of the matrix show the numbers of true negatives, false positives, false negatives, and true positives.

$$
\begin{array}{rl} &{\mathrm{normal \mathrm{\quad} cancer}} \\ &{\mathrm{normal}} \\ &{\mathrm{cancer}} \end{array} \left(\begin{array}{cc}{N_{\mathrm{TN}}} &{N_{\mathrm{FP}}} \\{N_{\mathrm{FN}}} &{N_{\mathrm{TP}}} \end{array} \right)
$$

the resulting posterior probabilities so they sum to one. The particular conditional independence assumption (5.26) is an example of a naive Bayes model. Note that the joint marginal distribution $p(\mathbf{x}_{\mathrm{I}}, \mathbf{x}_{\mathrm{B}})$ will typically not factorize under this model. We will see in later chapters how to construct models for combining data that do not require the conditional independence assumption (5.26). A further advantage of using models that output probabilities rather than decisions is that they can easily be made differentiable with respect to any adjustable parameters (such as the weight coefficients in the polynomial regression example), which allows them to be composed and trained jointly using gradient-based optimization methods.

## 5.2.5 Classifier accuracy

The simplest measure of performance for a classifier is the fraction of test set points that are correctly classified. However, we have seen that different types of error can have different consequences, as expressed through the loss matrix, and often we therefore do not simply wish to minimize the number of misclassifications. By changing the location of the decision boundary, we can make trade-offs between different kinds of error, for example with the goal of minimizing an expected loss. Because this is such an important concept, we will introduce some definitions and terminology so that the performance of a classifier can be better characterized.

We will consider again our cancer screening example. For each person tested, there is a ‘true label’ of whether they have cancer or not, and there is also the prediction made by the classifier. If, for a particular person, the classifier predicts cancer and this is in fact the true label, then the prediction is called a true positive. However, if the person does not have cancer it is a false positive. Likewise, if the classifier predicts that a person does not have cancer and this is correct, then the prediction is called a true negative, otherwise it is a false negative. The false positives are also known as type 1 errors whereas the false negatives are called type 2 errors. If N is the total number of people taking the test, then $N_{\mathrm{TP}}$ is the number of true positives, $N_{\mathrm{FP}}$ is the number of false positives, $N_{\mathrm{TN}}$ is the number of true negatives, and $N_{\mathrm{FN}}$ is the number of false negatives, where

$$
N = N_{\mathrm{TP}} + N_{\mathrm{FP}} + N_{\mathrm{TN}} + N_{\mathrm{FN}}.\tag{5.28}
$$

This can be represented as a confusion matrix as shown in Figure 5.9. Accuracy, measured by the fraction of correct classifications, is then given by

$$
\mathrm{Accuracy} ={\frac{N_{\mathrm{TP}} + N_{\mathrm{TN}}}{N_{\mathrm{TP}} + N_{\mathrm{FP}} + N_{\mathrm{TN}} + N_{\mathrm{FN}}}}.\tag{5.29}
$$

We can see that accuracy can be misleading if there are strongly imbalanced classes. In our cancer screening example, for instance, where only 1 person in 1,000 has cancer, a naive classifier that simply decides that nobody has cancer will achieve 99.9% accuracy and yet is completely useless.

Several other quantities can be defined in terms of these numbers, of which the most commonly encountered are

$$
\mathrm{Precision} = \frac{N_{\mathrm{TP}}}{N_{\mathrm{TP}} + N_{\mathrm{FP}}}\tag{5.30}
$$

$$
\mathrm{Recall} = \frac{N_{\mathrm{TP}}}{N_{\mathrm{TP}} + N_{\mathrm{FN}}}\tag{5.31}
$$

$$
\mathrm{Falsepositive} \mathrm{rate} = \frac{N_{\mathrm{FP}}}{N_{\mathrm{FP}} + N_{\mathrm{TN}}}\tag{5.32}
$$

$$
{\mathrm{False ~ discovery ~ rate}} ={\frac{N_{\mathrm{FP}}}{N_{\mathrm{FP}} + N_{\mathrm{TP}}}}\tag{5.33}
$$

In our cancer screening example, precision represents an estimate of the probability that a person who has a positive test does indeed have cancer, whereas recall is an estimate of the probability that a person who has cancer is correctly detected by the test. The false positive rate is an estimate of the probability that a person who is normal will be classified as having cancer, whereas the false discovery rate represents the fraction of those testing positive who do not in fact have cancer.

By altering the location of the decision boundary, we can change the trade-offs between the two kinds of errors. To understand this trade-off, we revisit Figure 5.5, but now we label the various regions as shown in Figure 5.10. We can relate the labelled regions to the various true and false rates as follows:

$$
N_{\mathrm{FP}} / N = E\tag{5.34}
$$

$$
N_{\mathrm{TP}} / N = D + E\tag{5.35}
$$

$$
N_{\mathrm{FN}} / N = B + C\tag{5.36}
$$

$$
N_{\mathrm{TN}} / N = A + C\tag{5.37}
$$

where we are implicitly considering the limit $N \to \infty$ so that we can relate number of observations to probabilities.

## 5.2.6 ROC curve

A probabilistic classifier will output a posterior probability, which can be converted to a decision by setting a threshold. As the value of the threshold is varied, we can reduce type 1 errors at the expense of increasing type 2 errors, or vice versa. To better understand this trade-off, it is useful to plot the receiver operating characteristic or ROC curve (Fawcett, 2006), a name that originates from procedures to measure the performance of radar receivers. This is a graph of true positive rate versus false positive rate, as shown in Figure 5.11.

As the decision boundary in Figure 5.10 is moved from to , the ROC curve is traced out and can then be generated by plotting the cumulative fraction of correct detection of cancer on the y-axis versus the cumulative fraction of incorrect detection on the x-axis. Note that a specific confusion matrix represents one point along the ROC curve. The best possible classifier would be represented by a point at the top left corner of the ROC diagram. The bottom left corner represents a simple classifier that assigns every point to the normal class and therefore has no true positives but also no false positives. Similarly, the top right corner represents a classifier that assigns everything to the cancer class and therefore has no false negatives but also no true negatives. In Figure 5.11, the classifiers represented by the blue curve are better than those of the red curve for any choice of, say, false positive rate. It is also possible, however, for such curves to cross over, in which case the choice of which is better will depend on the choice of operating point.

![Figure 5.10](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d06d48b3f769f9e06d24c6af0a2e623884fac29b27155bcc0bf8e6e4b09f1ce6.jpg)  
Figure 5.10 As in Figure 5.5, with the various regions labelled. In the cancer classification problem, region $\mathcal{R}_{1}$ is assigned to the normal class whereas region $\mathcal{R}_{2}$ is assigned to the cancer class.

As a baseline, we can consider a random classifier that simply assigns each data point to cancer with probability $\rho$ and to normal with probability $1 - \rho.$ As we vary the value of $\rho$ it will trace out an ROC curve given by a diagonal straight line, as shown in Figure 5.11. Any classifier below the diagonal line performs worse than random guessing.

Sometimes it is useful to have a single number that characterises the whole ROC curve. One approach is to measure the area under the curve (AUC). A value of 0.5 for the AUC represents random guessing whereas a value of 1.0 represents a perfect classifier.

Another measure is the F-score, which is the geometric mean of precision and

The receiver operator characteristic (ROC) curve is a plot of true positive rate against false positive rate, and it characterizes the trade-off between type 1 and type 2 errors in a classification problem. The upper blue curve represents a better classifier than the lower red curve. Here the dashed curve represents the performance of a simple random classifier.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/4ca60939d151c33f8b78fe4ec1e7a0939b1c2d5627129e64e2e8f4efb605bc99.jpg)

recall, and is therefore defined by

$$
\begin{array}{c}{{F = \displaystyle \frac{2 \times \mathrm{precision \times recall}}{\mathrm{precision + recall}}}} \\{{= \displaystyle \frac{2N_{\mathrm{TP}}}{2N_{\mathrm{TP}} + N_{\mathrm{FP}} + N_{\mathrm{FN}}}.}} \end{array}\tag{5.38}
$$

(5.39)

Of course, we can also combine the confusion matrix in Figure 5.9 with the loss matrix in Figure 5.6 to compute the expected loss by multiplying the elements pointwise and summing the resulting products.

Although the ROC curve can be extended to more than two classes, it rapidly becomes cumbersome as the number of classes increases.

## 5.3. Generative Classifiers

We turn next to a probabilistic view of classification and show how models with linear decision boundaries arise from simple assumptions about the distribution of the data. We have already discussed the distinction between the discriminative and the generative approaches to classification. Here we will adopt a generative approach in which we model the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ as well as the class priors $p(\mathcal{C}_{k})$ and then use these to compute posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ through Bayes theorem.

First, consider problems having two classes. The posterior probability for class

Figure 5.12

Plot of the logistic sigmoid function $\sigma(a)$ defined by (5.42), shown in red, together with the scaled probit function $\Phi(\lambda a)$ , for $\lambda^{2} \overset{\cdot}{=} \pi / 8$ , shown in dashed blue, where Φ(a) is defined by (5.86). The scaling factor $\pi / 8$ is chosen so that the derivatives of the two curves are equal for $a = 0$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1c2736ee42f573b4ba4605d3ff1ebcde1650e976173111ac53e2853782dab4ea.jpg)

$\mathcal{C}_{1}$ can be written as

$$
\begin{array}{lll}{p(\mathcal{C}_{1} | \mathbf{x})} &{=} &{\displaystyle \frac{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1})}{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1}) + p(\mathbf{x} | \mathcal{C}_{2}) p(\mathcal{C}_{2})}} \\ &{=} &{\displaystyle \frac{1}{1 + \exp(- a)} = \sigma(a)} \end{array}\tag{5.40}
$$

where we have defined

$$
a = \ln \frac{p(\mathbf{x} | \mathcal{C}_{1}) p(\mathcal{C}_{1})}{p(\mathbf{x} | \mathcal{C}_{2}) p(\mathcal{C}_{2})}\tag{5.41}
$$

and $\sigma(a)$ is the logistic sigmoid function defined by

$$
\sigma(a) = \frac{1}{1 + \exp(- a)},\tag{5.42}
$$

which is plotted in Figure 5.12. The term ‘sigmoid’ means S-shaped. This type of function is sometimes also called a ‘squashing function’ because it maps the whole real axis into a finite interval. The logistic sigmoid has been encountered already in earlier chapters and plays an important role in many classification algorithms. It satisfies the following symmetry property:

$$
\sigma(- a) = 1 - \sigma(a)\tag{5.43}
$$

as is easily verified. The inverse of the logistic sigmoid is given by

$$
a = \ln \left({\frac{\sigma}{1 - \sigma}} \right)\tag{5.44}
$$

and is known as the logit function. It represents the log of the ratio of probabilities ln $[p(\mathcal{C}_{1} | \mathbf{x}) / p(\mathcal{C}_{2} | \mathbf{x})]$ for the two classes, also known as the log odds.

Note that in (5.40), we have simply rewritten the posterior probabilities in an equivalent form, and so the appearance of the logistic sigmoid may seem artificial.

However, it will have significance provided $a(\mathbf{x})$ has a constrained functional form. We will shortly consider situations in which a(x) is a linear function of x, in which case the posterior probability is governed by a generalized linear model.

If there are $K > 2$ classes, we have

$$
\begin{array}{rcl}{{p(\mathcal{C}_{k} | \mathbf{x})}} &{{=}} &{{\displaystyle \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{\sum_{j} p(\mathbf{x} | \mathcal{C}_{j}) p(\mathcal{C}_{j})}}} \\{{}} &{{=}} &{{\displaystyle \frac{\exp(a_{k})}{\sum_{j} \exp(a_{j})},}} \end{array}\tag{5.45}
$$

which is known as the normalized exponential and can be regarded as a multi-class generalization of the logistic sigmoid. Here the quantities $a_{k}$ are defined by

$$
a_{k} = \ln \left(p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k}) \right).\tag{5.46}
$$

The normalized exponential is also known as the softmax function, as it represents a smoothed version of the ‘max’ function because, if $a_{k} \gg a_{j}$ for all $j \neq k$ , then $p(\mathcal{C}_{k} | \mathbf{x}) \simeq 1$ , and $p(\mathcal{C}_{j} | \mathbf{x}) \simeq 0$

We now investigate the consequences of choosing specific forms for the classconditional densities, looking first at continuous input variables x and then discussing briefly discrete inputs.

## 5.3.1 Continuous inputs

Let us assume that the class-conditional densities are Gaussian. We will then explore the resulting form for the posterior probabilities. To start with, we will assume that all classes share the same covariance matrix Σ. Thus, the density for class $\mathcal{C}_{k}$ is given by

$$
p({\bf x} |{\mathcal C}_{k}) = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{|{\bf \Sigma} |^{1 / 2}} \exp \left\{- \frac{1}{2}({\bf x} -{\pmb \mu}_{k})^{\mathrm{T}}{\bf \Sigma}^{- 1}({\bf x} -{\pmb \mu}_{k}) \right\}.\tag{5.47}
$$

First, suppose that we have two classes. From (5.40) and (5.41), we have

$$
p(\mathcal{C}_{1} | \mathbf{x}) = \sigma(\mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0})\tag{5.48}
$$

where we have defined

$$
\begin{array}{rcl}{\mathbf{w}} &{=} &{\pmb{\Sigma}^{- 1}(\pmb{\mu}_{1} - \pmb{\mu}_{2})} \end{array}\tag{5.49}
$$

$$
w_{0} ~ = ~ - \frac{1}{2} \pmb{\mu}_{1}^{\mathrm{T}} \pmb{\Sigma}^{- 1} \pmb{\mu}_{1} + \frac{1}{2} \pmb{\mu}_{2}^{\mathrm{T}} \pmb{\Sigma}^{- 1} \pmb{\mu}_{2} + \ln \frac{p(\mathcal{C}_{1})}{p(\mathcal{C}_{2})}.\tag{5.50}
$$

We see that the quadratic terms in x from the exponents of the Gaussian densities have cancelled (due to the assumption of common covariance matrices), leading to a linear function of x in the argument of the logistic sigmoid. This result is illustrated for a two-dimensional input space x in Figure 5.13. The resulting decision boundaries correspond to surfaces along which the posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$

![Figure 5.13](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1e1efd04f5486d93ac6d343e24e5b507ba5b4c2424d1ed7e3b62720c1dc9c2df.jpg)  
Figure 5.13 The left-hand plot shows the class-conditional densities for two classes, denoted red and blue. On the right is the corresponding posterior probability $p(\mathcal{C}_{1} | \mathbf{x})$ , which is given by a logistic sigmoid of a linear function of $\mathbf{x}.$ The surface in the right-hand plot is coloured using a proportion of red ink given by $p(\mathcal{C}_{1} | \mathbf{x})$ and a proportion of blue ink given by $p(\mathcal{C}_{2} | \mathbf{x}) = 1 - p(\mathcal{C}_{1} | \mathbf{x})$

are constant and so will be given by linear functions of $\mathbf{x},$ and therefore the decision boundaries are linear in input space. The prior probabilities $p(\mathcal{C}_{k})$ enter only through the bias parameter $w_{0}$ , so that changes in the priors have the effect of making parallel shifts of the decision boundary and more generally of the parallel contours of constant posterior probability.

For the general case of $K$ classes, the posterior probabilities are given by (5.45) where, from (5.46) and (5.47), we have

$$
a_{k}({\bf x}) ={\bf w}_{k}^{\mathrm{T}}{\bf x} + w_{k0}\tag{5.51}
$$

in which we have defined

$$
\begin{array}{rcl}{\mathbf{w}_{k}} &{=} &{\pmb{\Sigma}^{- 1} \pmb{\mu}_{k}} \end{array}\tag{5.52}
$$

$$
\begin{array}{rcl}{w_{k0}} &{=} &{\displaystyle - \frac{1}{2} \pmb{\mu}_{k}^{\mathrm{T}} \pmb{\Sigma}^{- 1} \pmb{\mu}_{k} + \ln p(\mathcal{C}_{k}).} \end{array}\tag{5.53}
$$

We see that the $a_{k}({\bf x})$ are again linear functions of x as a consequence of the cancellation of the quadratic terms due to the shared covariances. The resulting decision boundaries, corresponding to the minimum misclassification rate, will occur when two of the posterior probabilities (the two largest) are equal, and so will be defined by linear functions of x. Thus, we again have a generalized linear model.

If we relax the assumption of a shared covariance matrix and allow each classconditional density $p(\mathbf{x} | \mathcal{C}_{k})$ to have its own covariance matrix $\Sigma_{k}$ , then the earlier cancellations will no longer occur, and we will obtain quadratic functions of x, giving rise to a quadratic discriminant. The linear and quadratic decision boundaries are illustrated in Figure 5.14.

## 5.3.2 Maximum likelihood solution

Once we have specified a parametric functional form for the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , we can then determine the values of the parameters, together with the prior class probabilities $p(\mathcal{C}_{k})$ , using maximum likelihood. This requires a data set comprising observations of x along with their corresponding class labels.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d56acfa82d72cbae91941250cbdf168e14e8965f5403ccef34e81ce6294feb7d.jpg)  
x1

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/592585314c43d711bfee5b738338d97cb222fff93985dd7387b2ed0b3a1ddab0.jpg)  
x1  
Figure 5.14 The left-hand plot shows the class-conditional densities for three classes each having a Gaussian distribution, coloured red, green, and blue, in which the red and blue classes have the same covariance matrix. The right-hand plot shows the corresponding posterior probabilities, in which each point on the image is coloured using proportions of red, blue, and green ink corresponding to the posterior probabilities for the respective three classes. The decision boundaries are also shown. Notice that the boundary between the red and blue classes, which have the same covariance matrix, is linear, whereas those between the other pairs of classes are quadratic.

First, suppose we have two classes, each having a Gaussian class-conditional density with a shared covariance matrix, and suppose we have a data set $\{\mathbf{x}_{n}, t_{n}\}$ where $n = 1, \ldots, N$ . Here $t_{n} = 1$ denotes class $\mathcal{C}_{1}$ and $t_{n} = 0$ denotes class $\mathcal{C}_{2}$ . We denote the prior class probability $p(\mathcal{C}_{1}) = \pi$ , so that $p(\mathcal{C}_{2}) = 1 - \pi$ . For a data point ${\bf x}_{n}$ from class $\mathcal{C}_{1}$ , we have $t_{n} = 1$ and hence

$$
p(\mathbf{x}_{n}, \mathcal{C}_{1}) = p(\mathcal{C}_{1}) p(\mathbf{x}_{n} | \mathcal{C}_{1}) = \pi \mathcal{N}(\mathbf{x}_{n} | \mu_{1}, \boldsymbol{\Sigma}).
$$

Similarly for class $\mathcal{C}_{2}$ , we have $t_{n} = 0$ and hence

$$
\begin{array}{r}{p(\mathbf{x}_{n}, \mathcal{C}_{2}) = p(\mathcal{C}_{2}) p(\mathbf{x}_{n} | \mathcal{C}_{2}) =(1 - \pi) \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{2}, \Sigma).} \end{array}
$$

Thus, the likelihood function is given by

$$
p(\mathbf{t}, \mathbf{X} | \pi, \mu_{1}, \mu_{2}, \Sigma) = \prod_{n = 1}^{N} \left[\pi \mathcal{N}(\mathbf{x}_{n} | \mu_{1}, \Sigma) \right]^{t_{n}} \left[(1 - \pi) \mathcal{N}(\mathbf{x}_{n} | \mu_{2}, \Sigma) \right]^{1 - t_{n}}\tag{5.54}
$$

where $\mathbf{t} ~ = ~(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ . As usual, it is convenient to maximize the log of the likelihood function. Consider first the maximization with respect to $\pi$ . The terms in

the log likelihood function that depend on $\pi$ are

$$
\sum_{n = 1}^{N} \left\{t_{n} \ln \pi +(1 - t_{n}) \ln(1 - \pi) \right\}.\tag{5.55}
$$

Setting the derivative with respect to $\pi$ equal to zero and rearranging, we obtain

$$
\pi ={\frac{1}{N}} \sum_{n = 1}^{N} t_{n} ={\frac{N_{1}}{N}} ={\frac{N_{1}}{N_{1} + N_{2}}}\tag{5.56}
$$

where $N_{1}$ denotes the total number of data points in class $\mathcal{C}_{1}$ , and $N_{2}$ denotes the total number of data points in class $\mathcal{C}_{2}$ . Thus, the maximum likelihood estimate for $\pi$ is simply the fraction of points in class $\mathcal{C}_{1}$ as expected. This result is easily generalized to the multi-class case where again the maximum likelihood estimate of the prior probability associated with class $\mathcal{C}_{k}$ is given by the fraction of the training set points assigned to that class.

Now consider the maximization with respect to $\pmb{\mu}_{1}$ . Again, we can pick out of the log likelihood function those terms that depend on $\pmb{\mu}_{1}$ :

$$
\sum_{n = 1}^{N} t_{n} \ln \mathcal{N}({\mathbf x}_{n} |{\boldsymbol \mu}_{1},{\boldsymbol \Sigma}) = -{\frac{1}{2}} \sum_{n = 1}^{N} t_{n}({\mathbf x}_{n} -{\boldsymbol \mu}_{1})^{{\mathrm T}}{\boldsymbol \Sigma}^{- 1}({\mathbf x}_{n} -{\boldsymbol \mu}_{1}) +{\mathrm{const.}}\tag{5.57}
$$

Setting the derivative with respect to $\pmb{\mu}_{1}$ to zero and rearranging, we obtain

$$
\pmb{\mu}_{1} = \frac{1}{N_{1}} \sum_{n = 1}^{N} t_{n} \mathbf{x}_{n},\tag{5.58}
$$

which is simply the mean of all the input vectors ${\bf x}_{n}$ assigned to class $\mathcal{C}_{1}$ . By a similar argument, the corresponding result for $\pmb{\mu}_{2}$ is given by

$$
\pmb{\mu}_{2} = \frac{1}{N_{2}} \sum_{n = 1}^{N}(1 - t_{n}) \mathbf{x}_{n},\tag{5.59}
$$

which again is the mean of all the input vectors ${\bf x}_{n}$ assigned to class $\mathcal{C}_{2}$

Finally, consider the maximum likelihood solution for the shared covariance matrix Σ. Picking out the terms in the log likelihood function that depend on $\Sigma,$ , we have

$$
\begin{array}{rl} &{\displaystyle - \frac{1}{2} \sum_{n = 1}^{N} t_{n} \ln | \boldsymbol{\Sigma} | - \frac{1}{2} \sum_{n = 1}^{N} t_{n}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{1})} \\ &{\displaystyle - \frac{1}{2} \sum_{n = 1}^{N}(1 - t_{n}) \ln | \boldsymbol{\Sigma} | - \frac{1}{2} \sum_{n = 1}^{N}(1 - t_{n})(\mathbf{x}_{n} - \boldsymbol{\mu}_{2})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{2})} \\ &{\displaystyle = - \frac{N}{2} \ln | \boldsymbol{\Sigma} | - \frac{N}{2} \mathrm{Tr} \left\{\boldsymbol{\Sigma}^{- 1} \mathbf{S} \right\}} \end{array}\tag{5.60}
$$

where we have defined

$$
\begin{array}{rcl}{{\bf S}} &{{=}} &{{\displaystyle \frac{N_{1}}{N}{\bf S}_{1} + \frac{N_{2}}{N}{\bf S}_{2}}} \end{array}\tag{5.61}
$$

$$
\begin{array}{rcl}{\mathbf{S}_{1}} &{=} &{\displaystyle \frac{1}{N_{1}} \sum_{n \in \mathcal{C}_{1}}(\mathbf{x}_{n} - \pmb{\mu}_{1})(\mathbf{x}_{n} - \pmb{\mu}_{1})^{\mathrm{T}}} \end{array}\tag{5.62}
$$

$$
\begin{array}{rcl}{\mathbf{S}_{2}} &{=} &{\displaystyle \frac{1}{N_{2}} \sum_{n \in \mathcal{C}_{2}}(\mathbf{x}_{n} - \pmb{\mu}_{2})(\mathbf{x}_{n} - \pmb{\mu}_{2})^{\mathrm{T}}.} \end{array}\tag{5.63}
$$

Using the standard result for the maximum likelihood solution for a Gaussian distribution, we see that $\mathbf{\Delta} \Sigma = \mathbf{S}$ , which represents a weighted average of the covariance matrices associated with each of the two classes separately.

This result is easily extended to the K-class problem to obtain the corresponding maximum likelihood solutions for the parameters in which each class-conditional density is Gaussian with a shared covariance matrix. Note that the approach of fitting Gaussian distributions to the classes is not robust to outliers, because the maximum likelihood estimation of a Gaussian is not robust.

## 5.3.3 Discrete features

Let us now consider discrete feature values $x_{i}$ . For simplicity, we begin by looking at binary feature values $x_{i} \in \{0, 1\}$ and discuss the extension to more general discrete features shortly. If there are D inputs, then a general distribution would correspond to a table of $2^{D}$ numbers for each class and have $2^{D} - 1$ independent variables (due to the summation constraint). Because this grows exponentially with the number of features, we can seek a more restricted representation. Here we will make the naive Bayes assumption in which the feature values are treated as independent and conditioned on the class $\mathcal{C}_{k}$ . Thus, we have class-conditional distributions of the form

$$
p(\mathbf{x} | \mathcal{C}_{k}) = \prod_{i = 1}^{D} \mu_{ki}^{x_{i}}(1 - \mu_{ki})^{1 - x_{i}},\tag{5.64}
$$

which contain D independent parameters for each class. Substituting into (5.46) then gives

$$
a_{k}({\bf x}) = \sum_{i = 1}^{D} \{x_{i} \ln \mu_{ki} +(1 - x_{i}) \ln(1 - \mu_{ki})\} + \ln p(\mathcal{C}_{k}),\tag{5.65}
$$

which again are linear functions of the input values $x_{i}$ . For $K = 2$ classes, we can alternatively consider the logistic sigmoid formulation given by (5.40). Analogous results are obtained for discrete variables that take $L > 2$ states.

## 5.3.4 Exponential family

As we have seen, for both Gaussian distributed and discrete inputs, the posterior class probabilities are given by generalized linear models with logistic sigmoid $(K =$

2 classes) or softmax $(K \geqslant 2$ classes) activation functions. These are particular cases of a more general result obtained by assuming that the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ are members of the subset of the exponential family of distributions given by

$$
p(\mathbf{x} | \mathbf{\lambda}_{k}, s) = \frac{1}{s} h \left(\frac{1}{s} \mathbf{x} \right) g(\lambda_{k}) \exp \left\{\frac{1}{s} \mathbf{\lambda}_{k}^{\mathrm{T}} \mathbf{x} \right\}.\tag{5.66}
$$

Here the scaling parameter s is shared across all the classes.

For the two-class problem, we substitute this expression for the class-conditional densities into (5.41) and we see that the posterior class probability is again given by a logistic sigmoid acting on a linear function $a(\mathbf{x})$ , which is given by

$$
a(\mathbf{x}) =(\lambda_{1} - \lambda_{2})^{\mathrm{T}} \mathbf{x} + \ln g(\lambda_{1}) - \ln g(\lambda_{2}) + \ln p(\mathcal{C}_{1}) - \ln p(\mathcal{C}_{2}).\tag{5.67}
$$

Similarly, for the K-class problem, we substitute the class-conditional density expression into (5.46) to give

$$
a_{k}(\mathbf{x}) = \lambda_{k}^{\mathrm{{T}}} \mathbf{x} + \ln g(\lambda_{k}) + \ln p(\mathcal{C}_{k})\tag{5.68}
$$

and so again is a linear function of x.

## 5.4. Discriminative Classifiers

For the two-class classification problem, we have seen that the posterior probability of class $\mathcal{C}_{1}$ can be written as a logistic sigmoid acting on a linear function of x, for a wide choice of class-conditional distributions $p(\mathbf{x} | \mathcal{C}_{k})$ from the exponential family. Similarly, for the multi-class case, the posterior probability of class $\mathcal{C}_{k}$ is given by a softmax transformation of linear functions of x. For specific choices of the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ , we have used maximum likelihood to determine the parameters of the densities as well as the class priors $p(\mathcal{C}_{k})$ and then used Bayes’ theorem to find the posterior class probabilities. This represents an example of generative modelling, because we could take such a model and generate synthetic data by drawing values of x from the marginal distribution $p(\mathbf{x})$ or from any of the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$

However, an alternative approach is to use the functional form of the generalized linear model explicitly and to determine its parameters directly by using maximum likelihood. In this direct approach, we maximize a likelihood function defined through the conditional distribution $p(\mathcal{C}_{k} \vert \mathbf{x})$ , which represents a form of discriminative probabilistic modelling. One advantage of the discriminative approach is that there will typically be fewer learnable parameters to be determined, as we will see shortly. It may also lead to improved predictive performance, particularly when the assumed forms for the class-conditional densities represent a poor approximation to the true distributions.

## 5.4.1 Activation functions

In linear regression, the model prediction $y(\mathbf{x}, \mathbf{w})$ is given by a linear function of the parameters

$$
y(\mathbf{x}, \mathbf{w}) = \mathbf{w}^{\mathrm{T}} \mathbf{x} + w_{0},\tag{5.69}
$$

which gives a continuous-valued output in the range $(- \infty, \infty)$ . For classification problems, however, we wish to predict discrete class labels, or more generally posterior probabilities that lie in the range (0, 1). To achieve this, we consider a generalization of this model in which we transform the linear function of w and $w_{0}$ using a nonlinear function $f(\cdot)$ so that

$$
y(\mathbf{x}, \mathbf{w}) = f \left(\mathbf{w}^{\mathrm{T}} \mathbf{w} + w + 0 \right).\tag{5.70}
$$

In the machine learning literature, $f(\cdot)$ is known as an activation function, whereas its inverse is called a link function in the statistics literature. The decision surfaces correspond to $y(\mathbf{x}) = \mathrm{constant}$ , so that $\mathbf{w}^{\mathrm{T}} \mathbf{x} ={\mathrm{constant}}.$ , and hence the decision surfaces are linear functions of x, even if the function $f(\cdot)$ is nonlinear. For this reason, the class of models described by (5.70) are called generalized linear models (McCullagh and Nelder, 1989). However, in contrast to the models used for regression, they are no longer linear in the parameters due to the nonlinear function $f(\cdot)$ This will lead to more complex analytical and computational properties than for linear regression models. Nevertheless, these models are still relatively simple compared to the much more flexible nonlinear models that will be studied in subsequent chapters.

## 5.4.2 Fixed basis functions

So far in this chapter, we have considered classification models that work directly with the original input vector x. However, all the algorithms are equally applicable if we first make a fixed nonlinear transformation of the inputs using a vector of basis functions $\phi(\mathbf{x})$ . The resulting decision boundaries will be linear in the feature space $\phi,$ and these correspond to nonlinear decision boundaries in the original x space, as illustrated in Figure 5.15. Classes that are linearly separable in the feature space $\phi(\mathbf{x})$ need not be linearly separable in the original observation space x.

Note that as in our discussion of linear models for regression, one of the basis functions is typically set to a constant, say $\phi_{0}(\mathbf{x}) = 1$ , so that the corresponding parameter $w_{0}$ plays the role of a bias.

For many problems of practical interest, there is significant overlap in x-space between the class-conditional densities $p(\mathbf{x} | \mathcal{C}_{k})$ . This corresponds to posterior probabilities $p(\mathcal{C}_{k} \vert \mathbf{x})$ , which, for at least some values of $\mathbf{x},$ , are not 0 or 1. In such cases, the optimal solution is obtained by modelling the posterior probabilities accurately and then applying standard decision theory. Note that nonlinear transformations $\phi(\mathbf{x})$ cannot remove such a class overlap, although they can increase the level of overlap or create an overlap where none existed in the original observation space. However, suitable choices of nonlinearity can make the process of modelling the posterior probabilities easier. However, such fixed basis function models have important limitations, and these will be resolved in later chapters by allowing the basis functions themselves to adapt to the data.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/dc06b1c98b2b703f4002f1814472ea3b4d5e5901f3873471a233ee27ad10a1fe.jpg)

![Figure 5.15](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d539cc2a81a9b664287e4b8b34cd0bc0df2a59c644975b67dcd18878fb260055.jpg)  
Figure 5.15 Illustration of the role of nonlinear basis functions in linear classification models. The left-hand plot shows the original input space $(x_{1}, x_{2})$ together with data points from two classes labelled red and blue. Two ‘Gaussian’ basis functions $\phi_{1}(\mathbf{x})$ and $\phi_{2}(\mathbf{x})$ are defined in this space with centres shown by the green crosses and with contours shown by the green circles. The right-hand plot shows the corresponding feature space $(\phi_{1}, \phi_{2})$ together with the linear decision boundary obtained given by a logistic regression model of the form discussed in Section 5.4.3. This corresponds to a nonlinear decision boundary in the original input space, shown by the black curve in the left-hand plot.

## 5.4.3 Logistic regression

We first consider the problem of two-class classification. In our discussion of generative approaches in Section 5.3, we saw that under rather general assumptions, the posterior probability of class $\mathcal{C}_{1}$ can be written as a logistic sigmoid acting on a linear function of the feature vector $\phi$ so that

$$
p(\mathcal{C}_{1} | \phi) = y(\phi) = \sigma \left(\mathbf{w}^{\mathrm{T}} \phi \right)\tag{5.71}
$$

with $p(\mathcal{C}_{2} | \phi) = 1 - p(\mathcal{C}_{1} | \phi)$ . Here $\sigma(\cdot)$ is the logistic sigmoid function defined by (5.42). In the terminology of statistics, this model is known as logistic regression, although it should be emphasized that this is a model for classification rather than for continuous variable.

For an M-dimensional feature space $\phi,$ this model has M adjustable parameters. By contrast, if we had fitted Gaussian class-conditional densities using maximum likelihood, we would have used 2M parameters for the means and $\bar{M(M + 1) / 2}$ parameters for the (shared) covariance matrix. Together with the class prior $p(\mathcal{C}_{1})$ this gives a total of $M(M + 5) / 2 + 1$ parameters, which grows quadratically with $M$ in contrast to the linear dependence on M of the number of parameters in logistic regression. For large values of $M$ , there is a clear advantage in working with the logistic regression model directly.

We now use maximum likelihood to determine the parameters of the logistic regression model. To do this, we will make use of the derivative of the logistic sigmoid function, which can conveniently be expressed in terms of the sigmoid function itself:

$$
\frac{d \sigma}{d a} = \sigma(1 - \sigma).\tag{5.72}
$$

For a data set $\{\phi_{n}, t_{n}\}$ , where $\phi_{n} = \phi(\mathbf{x}_{n})$ and $t_{n} \in \{0, 1\}$ , with $n = 1, \ldots, N.$ the likelihood function can be written

$$
p(\mathbf{t} | \mathbf{w}) = \prod_{n = 1}^{N} y_{n}^{t_{n}} \left\{1 - y_{n} \right\}^{1 - t_{n}}\tag{5.73}
$$

where ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ and $y_{n} = p(\mathcal{C}_{1} | \phi_{n})$ . As usual, we can define an error function by taking the negative logarithm of the likelihood, which gives the crossentropy error function:

$$
E(\mathbf{w}) = - \ln p(\mathbf{t} | \mathbf{w}) = - \sum_{n = 1}^{N} \left\{t_{n} \ln y_{n} +(1 - t_{n}) \ln(1 - y_{n}) \right\}\tag{5.74}
$$

where $y_{n} = \sigma(a_{n})$ and $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ . Taking the gradient of the error function with respect to w, we obtain

$$
\nabla E(\mathbf{w}) = \sum_{n = 1}^{N}(y_{n} - t_{n}) \phi_{n}\tag{5.75}
$$

where we have made use of (5.72). We see that the factor involving the derivative of the logistic sigmoid has cancelled, leading to a simplified form for the gradient of the log likelihood. In particular, the contribution to the gradient from data point n is given by the ‘error $y_{n} \mathrm{~ - ~} t_{n}$ between the target value and the prediction of the model times the basis function vector $\phi_{n}$ . Furthermore, comparison with (4.12) shows that this takes precisely the same form as the gradient of the sum-of-squares error function for the linear regression model.

The maximum likelihood solution corresponds to $\nabla E(\mathbf{w}) = 0$ . However, from (5.75) we see that this no longer corresponds to a set of linear equations, due to the nonlinearity in $y(\cdot)$ , and so this equation does not have a closed-form solution. One approach to finding a maximum likelihood solution would be to use stochastic gradient descent, in which $\nabla E_{n}$ is the nth term on the right-hand side of (5.75). Stochastic gradient descent will be the principal approach to training the highly nonlinear neural networks discussed in later chapters. However, the maximum likelihood equation is only ‘slightly’ nonlinear, and in fact the error function (5.74), in which the model is defined by (5.71), is a convex function of the parameters, which allows the error function to be minimized using a simple algorithm called iterative reweighted least squares or IRLS (Bishop, 2006). However, this does not easily generalize to more complex models such as deep neural networks.

Note that maximum likelihood can exhibit severe over-fitting for data sets that are linearly separable. This arises because the maximum likelihood solution occurs when the hyperplane corresponding to $\sigma = 0.5$ , equivalent to $\mathbf{w^{\mathrm{T}}} \phi = 0$ , separates the two classes and the magnitude of w goes to infinity. In this case, the logistic sigmoid function becomes infinitely steep in feature space, corresponding to a Heaviside step function, so that every training point from each class k is assigned a posterior probability $p(\mathcal{C}_{k} | \mathbf{x}) = 1$ Furthermore, there is typically a continuum of such solutions because any separating hyperplane will give rise to the same posterior probabilities at the training data points. Maximum likelihood provides no way to favour one such solution over another, and which solution is found in practice will depend on the choice of optimization algorithm and on the parameter initialization. Note that the problem will arise even if the number of data points is large compared with the number of parameters in the model, so long as the training data set is linearly separable. The singularity can be avoided by adding a regularization term to the error function.

## 5.4.4 Multi-class logistic regression

In our discussion of generative models for multi-class classification, we have seen that, for a large class of distributions from the exponential family, the posterior probabilities are given by a softmax transformation of linear functions of the feature variables, so that

$$
p(\mathcal{C}_{k} | \phi) = y_{k}(\phi) = \frac{\exp(a_{k})}{\sum_{j} \exp(a_{j})}\tag{5.76}
$$

where the pre-activations $a_{k}$ are given by

$$
a_{k} = \mathbf{w}_{k}^{\mathrm{T}} \phi.\tag{5.77}
$$

There we used maximum likelihood to determine separately the class-conditional densities and the class priors and then found the corresponding posterior probabilities using Bayes’ theorem, thereby implicitly determining the parameters $\left\{\mathbf{w}_{k} \right\}$ . Here we consider the use of maximum likelihood to determine the parameters $\left\{\mathbf{w}_{k} \right\}$ of this model directly. To do this, we will require the derivatives of $y_{k}$ with respect to all the pre-activations $a_{j}$ . These are given by

$$
{\frac{\partial y_{k}}{\partial a_{j}}} = y_{k}{\big(} I_{kj} - y_{j}{\big)}\tag{5.78}
$$

where $I_{kj}$ are the elements of the identity matrix.

Next we write down the likelihood function. This is most easily done using the 1-of-K coding scheme in which the target vector $\mathbf{t}_{n}$ for a feature vector $\phi_{n}$ belonging to class $\mathcal{C}_{k}$ is a binary vector with all elements zero except for element k, which equals one. The likelihood function is then given by

$$
p(\mathbf{T} | \mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} p(\mathcal{C}_{k} | \phi_{n})^{t_{nk}} = \prod_{n = 1}^{N} \prod_{k = 1}^{K} y_{nk}^{t_{nk}}\tag{5.79}
$$

Representation of a multi-class linear classification model as a neural network having a single layer of connections. Each basis function is represented by a node, with the solid node representing the ‘bias’ basis function $\phi_{0}$ whereas each output $y_{1}, \ldots, y_{N}$ is also represented by a node. The links between the nodes represent the corresponding weight and bias parameters.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/f440f30160d97a8daedac6bc183914761b8c50a8cafe236de33371aede8fa26f.jpg)

where $y_{nk} = y_{k}(\phi_{n})$ , and T is an $N \times K$ matrix of target variables with elements $t_{nk}$ . Taking the negative logarithm then gives

$$
E(\mathbf{w}_{1}, \ldots, \mathbf{w}_{K}) = - \ln{p(\mathbf{T} | \mathbf{w}_{1}, \ldots, \mathbf{w}_{K})} = - \sum_{n = 1}^{N} \sum_{k = 1}^{K} t_{nk} \ln{y_{nk}},\tag{5.80}
$$

which is known as the cross-entropy error function for the multi-class classification problem.

We now take the gradient of the error function with respect to one of the parameter vectors ${\bf w}_{j}$ . Making use of the result (5.78) for the derivatives of the softmax function, we obtain

$$
\nabla_{\mathbf{w}_{j}} E(\mathbf{w}_{1}, \dots, \mathbf{w}_{K}) = \sum_{n = 1}^{N} \left(y_{nj} - t_{nj} \right) \phi_{n}\tag{5.81}
$$

where we have made use of $\textstyle \sum_{k} t_{nk} = 1$ . Again, we could optimize the parameters through stochastic gradient descent.

Once again, we see the same form arising for the gradient as was found for the sum-of-squares error function with the linear model and for the cross-entropy error with the logistic regression model, namely the product of the error $(y_{nj} - t_{nj})$ times the basis function activation $\phi_{n}$ . These are examples of a more general result that we will explore later.

Linear classification models can be represented as single-layer neural networks as shown in Figure 5.16. If we consider the derivative of the error function with respect to a weight $w_{ik}$ , which links basis function $\phi_{i}(\mathbf{x})$ to output unit $t_{k}$ , we have from (5.81)

$$
\frac{\partial E(\mathbf w_{1}, \ldots, \mathbf w_{K})}{\partial w_{ij}} = \sum_{n = 1}^{N} \left(y_{nk} - t_{nk} \right) \phi_{i}(\mathbf x_{n}).\tag{5.82}
$$

Comparing this with Figure 5.16, we see that, for each data point n this gradient takes the form of the output of the basis function at the input end of the weight link with the ‘error $\left(y_{nk} - t_{nk} \right)$ at the output end.

Figure 5.17 Schematic example of a probability density $p(\theta)$ shown by the blue curve, given in this example by a mixture of two Gaussians, along with its cumulative distribution function $f(a)$ , shown by the red curve. Note that the value of the blue curve at any point, such as that indicated by the vertical green line, corresponds to the slope of the red curve at the same point. Conversely, the value of the red curve at this point corresponds to the area under the blue curve indicated by the shaded green region. In the stochastic threshold model, the class label takes the value $t = 1$ if the value of $a = \mathbf{w}^{\mathrm{T}} \phi$ exceeds a threshold, otherwise it takes the value $t = 0$ This is equivalent to an activation function given by the cumulative distribution function $f(a)$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/3cc0d5a940d92accfcec4b92464b0d5102568011a019769fdcffea7a218c0e13.jpg)

## 5.4.5 Probit regression

We have seen that, for a broad range of class-conditional distributions described by the exponential family, the resulting posterior class probabilities are given by a logistic (or softmax) transformation acting on a linear function of the feature variables. However, not all choices of class-conditional density give rise to such a simple form for the posterior probabilities, which suggests that it might be worth exploring other types of discriminative probabilistic model. Consider the two-class case, again remaining within the framework of generalized linear models, so that

$$
p(t = 1 | a) = f(a)\tag{5.83}
$$

where $a = \mathbf{w}^{\mathrm{T}} \phi$ , and $f(\cdot)$ is the activation function.

One way to motivate an alternative choice for the link function is to consider a noisy threshold model, as follows. For each input $\phi_{n}$ , we evaluate $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ and then we set the target value according to

$$
\left\{{\begin{array}{ll}{t_{n} = 1,} &{{\mathrm{if ~}} a_{n} \geqslant \theta,} \\{t_{n} = 0,} &{{\mathrm{otherwise}}.} \end{array}} \right.\tag{5.84}
$$

If the value of $\theta$ is drawn from a probability density $p(\theta)$ , then the corresponding activation function will be given by the cumulative distribution function

$$
f(a) = \int_{- \infty}^{a} p(\theta) d \theta\tag{5.85}
$$

as illustrated in Figure 5.17.

As a specific example, suppose that the density $p(\theta)$ is given by a zero-mean, unit-variance Gaussian. The corresponding cumulative distribution function is given by

$$
\Phi(a) = \int_{- \infty}^{a} \mathcal{N}(\theta | 0, 1) d \theta,\tag{5.86}
$$

which is known as the probit function. It has a sigmoidal shape and is compared with the logistic sigmoid function in Figure 5.12. Note that the use of a Gaussian distribution with general mean and variances does not change the model because this is equivalent to a re-scaling of the linear coefficients w. Many numerical packages can evaluate a closely related function defined by

$$
\operatorname{erf}(a) = \frac{2}{\sqrt{\pi}} \int_{0}^{a} \exp(- \theta^{2} / 2) d \theta\tag{5.87}
$$

and known as the erf function or error function (not to be confused with the error function of a machine learning model). It is related to the probit function by

$$
\Phi(a) = \frac{1}{2} \left\{1 + \frac{1}{\sqrt{2}} \mathrm{erf}(a) \right\}.\tag{5.88}
$$

The generalized linear model based on a probit activation function is known as probit regression. We can determine the parameters of this model using maximum likelihood by a straightforward extension of the ideas discussed earlier. In practice, the results found using probit regression tend to be like those of logistic regression.

One issue that can occur in practical applications is that of outliers, which can arise for instance through errors in measuring the input vector x or through mislabelling of the target value t. Because such points can lie a long way to the wrong side of the ideal decision boundary, they can seriously distort the classifier. The logistic and probit regression models behave differently in this respect because the tails of the logistic sigmoid decay asymptotically like $\exp(- x)$ for $| x | \to \infty$ , whereas for the probit activation function, they decay like $\exp(- x^{2})$ , and so the probit model can be significantly more sensitive to outliers.

## 5.4.6 Canonical link functions

For the linear regression model with a Gaussian noise distribution, the error function, corresponding to the negative log likelihood, is given by (4.11). If we take the derivative with respect to the parameter vector w of the contribution to the error function from a data point $n,$ this takes the form of the ‘error $y_{n} - t_{n}$ times the feature vector $\phi_{n}$ , where $y_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ . Similarly, for the combination of the logisticsigmoid activation function and the cross-entropy error function (5.74) and for the softmax activation function with the multi-class cross-entropy error function (5.80), we again obtain this same simple form. We now show that this is a general result of assuming a conditional distribution for the target variable from the exponential family along with a corresponding choice for the activation function known as the canonical link function.

We again make use of the restricted form (3.169) of exponential family distributions. Note that here we are applying the assumption of exponential family distribution to the target variable t, in contrast to Section 5.3.4 where we applied it to the input vector x. We therefore consider conditional distributions of the target variable of the form

$$
p(t | \eta, s) = \frac{1}{s} h \left(\frac{t}{s} \right) g(\eta) \exp \left\{\frac{\eta t}{s} \right\}.\tag{5.89}
$$

Using the same line of argument as led to the derivation of the result (3.172), we see that the conditional mean of t, which we denote by $y,$ is given by

$$
y \equiv \mathbb{E}[t | \eta] = - s \frac{d}{d \eta} \ln g(\eta).\tag{5.90}
$$

Thus, $y$ and $\eta$ must related, and we denote this relation through $\eta = \psi(y)$

Following Nelder and Wedderburn (1972), we define a generalized linear model to be one for which $y$ is a nonlinear function of a linear combination of the input (or feature) variables so that

$$
y = f(\mathbf{w}^{\mathrm{T}} \phi)\tag{5.91}
$$

where $f(\cdot)$ is known as the activation function in the machine learning literature, and $f^{- 1}(\cdot)$ is known as the link function in statistics.

Now consider the log likelihood function for this model, which, as a function of $\eta,$ is given by

$$
\ln p(\mathbf{t} | \eta, s) = \sum_{n = 1}^{N} \ln p(t_{n} | \eta, s) = \sum_{n = 1}^{N} \left\{\ln g(\eta_{n}) + \frac{\eta_{n} t_{n}}{s} \right\} + \mathrm{const}\tag{5.92}
$$

where we are assuming that all observations share a common scale parameter (which corresponds to the noise variance for a Gaussian distribution, for instance) and so s is independent of $n.$ . The derivative of the log likelihood with respect to the model parameters w is then given by

$$
\begin{array}{lll}{\displaystyle \nabla_{\mathbf{w}} \ln p(\mathbf{t} | \boldsymbol{\eta}, s)} &{=} &{\displaystyle \sum_{n = 1}^{N} \left\{\frac{d}{d \eta_{n}} \ln g(\eta_{n}) + \frac{t_{n}}{s} \right\} \frac{d \eta_{n}}{d y_{n}} \frac{d y_{n}}{d a_{n}} \nabla_{\mathbf{w}} a_{n}} \\{\displaystyle} &{=} &{\displaystyle \sum_{n = 1}^{N} \frac{1}{s} \left\{t_{n} - y_{n} \right\} \psi^{\prime}(y_{n}) f^{\prime}(a_{n}) \phi_{n}} \end{array}\tag{5.93}
$$

where $a_{n} = \mathbf{w}^{\mathrm{T}} \phi_{n}$ , and we have used $y_{n} = f(a_{n})$ together with the result (5.90) for $\mathbb{E}[t | \eta]$ . We now see that there is a considerable simplification if we choose a particular form for the link function $f^{- 1}(y)$ given by

$$
f^{- 1}(y) = \psi(y),\tag{5.94}
$$

which gives $f(\psi(y)) = y$ and hence $f^{\prime}(\psi) \psi^{\prime}(y) = 1$ . Also, because $a = f^{- 1}(y)$ we have $a = \psi$ and hence $f^{\prime}(a) \psi^{\prime}(y) = 1$ . In this case, the gradient of the error function reduces to

$$
\nabla \ln E(\mathbf{w}) = \frac{1}{s} \sum_{n = 1}^{N} \{y_{n} - t_{n}\} \phi_{n}.\tag{5.95}
$$

We have seen that there is a natural pairing between the choice of error function and the choice of output-unit activation function. Although we have derived this result in the context of single-layer network models, the same considerations apply to deep neural networks discussed in later chapters.

Exercises

5.1 (?) Consider a classification problem with K classes and a target vector t that uses a 1-of-K binary coding scheme. Show that the conditional expectation $\mathbb{E}[\mathbf{t} | \mathbf{x}]$ is given by the posterior probability $p(\mathcal{C}_{k} \vert \mathbf{x})$

5.2 (? ?) Given a set of data points $\left\{\mathbf{x}_{n} \right\}$ , we can define the convex hull to be the set of all points x given by

$$
\mathbf{x} = \sum_{n} \alpha_{n} \mathbf{x}_{n}\tag{5.96}
$$

where $\alpha_{n} \geqslant 0$ and $\textstyle \sum_{n} \alpha_{n} = 1$ . Consider a second set of points $\left\{\mathbf{y}_{n} \right\}$ together with their corresponding convex hull. By definition, the two sets of points will be linearly separable if there exists a vector w and a scalar $w_{0}$ such that $ { \hat { \mathbf { w } } } ^ { \mathrm { T } } \mathbf { x } _ { n } + w _ { 0 } > 0$ for all ${\bf x}_{n}$ and $\widehat{\mathbf{w}}^{\mathrm{T}} \mathbf{y}_{n} + w_{0} < 0$ for all ${\bf y}_{n}$ . Show that if their convex hulls intersect, the two sets of points cannot be linearly separable, and conversely that if they are linearly separable, their convex hulls do not intersect.

5.3 (? ?) Consider the minimization of a sum-of-squares error function (5.14), and suppose that all the target vectors in the training set satisfy a linear constraint

$$
\mathbf{a}^{\mathrm{T}} \mathbf{t}_{n} + b = 0\tag{5.97}
$$

where $\mathbf{t}_{n}$ corresponds to the nth row of the matrix T in (5.14). Show that as a consequence of this constraint, the elements of the model prediction $\mathbf{y}(\mathbf{x})$ given by the least-squares solution (5.16) also satisfy this constraint, so that

$$
\mathbf{a}^{\mathrm{T}} \mathbf{y}(\mathbf{x}) + b = 0.\tag{5.98}
$$

To do so, assume that one of the basis functions $\phi_{0}(\mathbf{x}) = 1$ so that the corresponding parameter $w_{0}$ plays the role of a bias.

5.4 (? ?) Extend the result of Exercise 5.3 to show that if multiple linear constraints are satisfied simultaneously by the target vectors, then the same constraints will also be satisfied by the least-squares prediction of a linear model.

5.5 (?) Use the definition (5.38), along with (5.30) and (5.31) to derive the result (5.39) for the F-score.

5.6 (? ?) Consider two non-negative numbers a and b, and show that, if $a \leqslant b,$ then $a \leqslant(ab)^{1 / 2}$ . Use this result to show that, if the decision regions of a two-class classification problem are chosen to minimize the probability of misclassification, this probability will satisfy

$$
p(\mathrm{mistake}) \leqslant \int \left\{p(\mathbf{x}, \mathcal{C}_{1}) p(\mathbf{x}, \mathcal{C}_{2}) \right\}^{1 / 2} d \mathbf{x}.\tag{5.99}
$$

5.7 (?) Given a loss matrix with elements $L_{kj}$ , the expected risk is minimized if, for each x, we choose the class that minimizes (5.23). Verify that, when the loss matrix

is given by $L_{kj} = 1 - I_{kj}$ , where $I_{kj}$ are the elements of the identity matrix, this reduces to the criterion of choosing the class having the largest posterior probability. What is the interpretation of this form of loss matrix?

5.8 (?) Derive the criterion for minimizing the expected loss when there is a general loss matrix and general prior probabilities for the classes.

5.9 (?) Consider the average of the posterior probabilities over a set of N data points in the form

$$
\frac{1}{N} \sum_{N = 1}^{N} p(\mathcal{C}_{k} | \mathbf{x}_{n}).\tag{5.100}
$$

By taking the limit $N \infty$ , show that this quantity approaches the prior class probability $p(\mathcal{C}_{k})$

5.10 $(\star \star)$ Consider a classification problem in which the loss incurred when an input vector from class $\mathcal{C}_{k}$ is classified as belonging to class $\mathcal{C}_{j}$ is given by the loss matrix $L_{kj}$ and for which the loss incurred in selecting the reject option is λ. Find the decision criterion that will give the minimum expected loss. Verify that this reduces to the reject criterion discussed in Section 5.2.3 when the loss matrix is given by $L_{kj} = 1 - I_{kj}$ . What is the relationship between λ and the rejection threshold θ?

5.11 (?) Show that the logistic sigmoid function (5.42) satisfies the property $\sigma(- a) =$ $1 - \sigma(a)$ and that its inverse is given by $\sigma^{- 1}(y) = \ln{\{y /(1 - y)\}}$

5.12 (?) Using (5.40) and (5.41), derive the result (5.48) for the posterior class probability in the two-class generative model with Gaussian densities, and verify the results (5.49) and (5.50) for the parameters w and $w_{0}$

5.13 (?) Consider a generative classification model for K classes defined by prior class probabilities $p(\mathcal{C}_{k}) = \pi_{k}$ and general class-conditional densities $p(\phi | \mathcal{C}_{k})$ where $\phi$ is the input feature vector. Suppose we are given a training data set $\{\phi_{n}, \mathbf{t}_{n}\}$ where $n = 1, \ldots, N$ , and $\mathbf{t}_{n}$ is a binary target vector of length $K$ that uses the $1{\mathrm{- of}}{\mathrm{-}} K$ coding scheme, so that it has components $t_{nj} = I_{jk}$ if data point n is from class $\mathcal{C}_{k}$ Assuming that the data points are drawn independently from this model, show that the maximum-likelihood solution for the prior probabilities is given by

$$
\pi_{k} ={\frac{N_{k}}{N}}\tag{5.101}
$$

where $N_{k}$ is the number of data points assigned to class $\mathcal{C}_{k}$

5.14 (? ?) Consider the classification model of Exercise 5.13 and now suppose that the class-conditional densities are given by Gaussian distributions with a shared covariance matrix, so that

$$
p(\phi | \mathcal{C}_{k}) = \mathcal{N}(\phi | \mu_{k}, \Sigma).\tag{5.102}
$$

Show that the maximum likelihood solution for the mean of the Gaussian distribution for class $\mathcal{C}_{k}$ is given by

$$
\mu_{k} = \frac{1}{N_{k}} \sum_{n = 1}^{N} t_{nk} \phi_{n},\tag{5.103}
$$

which represents the mean of those feature vectors assigned to class $\mathcal{C}_{k}$ . Similarly, show that the maximum likelihood solution for the shared covariance matrix is given by

$$
\Sigma = \sum_{k = 1}^{K} \frac{N_{k}}{N} \mathbf{S}_{k}\tag{5.104}
$$

where

$$
\mathbf{S}_{k} = \frac{1}{N_{k}} \sum_{n = 1}^{N} t_{nk}(\phi_{n} - \pmb{\mu}_{k})(\phi_{n} - \pmb{\mu}_{k})^{\mathrm{T}}.\tag{5.105}
$$

Thus, Σ is given by a weighted average of the covariances of the data associated with each class, in which the weighting coefficients are given by the prior probabilities of the classes.

$(\star \star)$ Derive the maximum likelihood solution for the parameters $\{\mu_{ki}\}$ of the probabilistic naive Bayes classifier with discrete binary features described in Section 5.3.3.

5.16 (? ?) Consider a classification problem with $K$ classes for which the feature vector φ has M components each of which can take L discrete states. Let the values of the components be represented by a 1-of-L binary coding scheme. Further suppose that, conditioned on the class $\mathcal{C}_{k}$ , the M components of $\phi$ are independent, so that the class-conditional density factorizes with respect to the feature vector components. Show that the quantities $a_{k}$ given by (5.46), which appear in the argument to the softmax function describing the posterior class probabilities, are linear functions of the components of $\phi$ . Note that this represents an example of a naive Bayes model.

5.17 (? ?) Derive the maximum likelihood solution for the parameters of the probabilistic naive Bayes classifier described in Exercise 5.16.

5.18 (?) Verify the relation (5.72) for the derivative of the logistic sigmoid function defined by (5.42).

5.19 (?) By making use of the result (5.72) for the derivative of the logistic sigmoid, show that the derivative of the error function (5.74) for the logistic regression model is given by (5.75).

5.20 (?) Show that for a linearly separable data set, the maximum likelihood solution for the logistic regression model is obtained by finding a vector w whose decision boundary $\mathbf{\bar{w}}^{\mathrm{T}} \phi(\mathbf{x}) = 0$ separates the classes and then taking the magnitude of w to infinity.

5.21 (?) Show that the derivatives of the softmax activation function (5.76), where the $a_{k}$ are defined by (5.77), are given by (5.78).

5.22 (?) Using the result (5.78) for the derivatives of the softmax activation function, show that the gradients of the cross-entropy error (5.80) are given by (5.81).

5.23 (?) Show that the probit function (5.86) and the erf function (5.87) are related by (5.88).

5.24 (? ?) Suppose we wish to approximate the logistic sigmoid $\sigma(a)$ defined by (5.42) by a scaled probit function $\bar{\Phi(\lambda a)}$ , where $\Phi(a)$ is defined by (5.86). Show that if λ is chosen so that the derivatives of the two functions are equal at $a = 0$ , then $\lambda^{2} = \pi / 8$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b90af482440caab8a05ef0915b9f79bad7cbf6a5d2dc3c57f631b1eeccf4a5a6.jpg)

In recent years, neural networks have emerged as, by far, the most important machine learning technology for practical applications, and we therefore devote a large fraction of this book to studying them. Previous chapters have already laid many of the foundations we will need. In particular, we have seen that linear regression models that comprise linear combinations of fixed nonlinear basis functions can be expressed as neural networks having a single layer of weight and bias parameters. Likewise, classification models based on linear combinations of basis functions can also be viewed as single-layer neural networks. These allowed us to introduce several important concepts before we embark on a discussion of more complex multilayered networks in this chapter.

Given a sufficient number of suitably chosen basis functions, such linear models can approximate any given nonlinear transformation from inputs to outputs to any desired accuracy and might therefore appear to be sufficient to tackle any practical application. However, these models have some severe limitations, and so we will begin our discussion of neural networks by exploring these limitations and understanding why it is necessary to use basis functions that are themselves learned from data. This leads naturally to a discussion of neural networks having more than one layer of learnable parameters. These are known as feed-forward networks or multilayer perceptrons. We will also discuss the benefits of having many such layers of processing, leading to the key concept of deep neural networks that now dominate the field of machine learning.


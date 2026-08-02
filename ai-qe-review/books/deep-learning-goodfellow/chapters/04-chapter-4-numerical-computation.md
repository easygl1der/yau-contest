---
title: "Chapter 4 \u2014 Numerical Computation"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 4
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 1952
source_line_end: 2270
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 8
source_empty_image_alt: 8
non_semantic_image_alt: 2
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

# Chapter 4 — Numerical Computation

> [[../README|本书目录]] · [[03-chapter-3-probability-and-information-theory|上一章]] · [[05-chapter-5-machine-learning-basics|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 1952–2270。
> - 本章保留 8 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Numerical Computation

Machine learning algorithms usually require a high amount of numerical computation. This typically refers to algorithms that solve mathematical problems by methods that update estimates of the solution via an iterative process, rather than analytically deriving a formula to provide a symbolic expression for the correct solution. Common operations include optimization (finding the value of an argument that minimizes or maximizes a function) and solving systems of linear equations. Even just evaluating a mathematical function on a digital computer can be difficult when the function involves real numbers, which cannot be represented precisely using a finite amount of memory.

## 4.1 Overflow and Underflow

The fundamental difficulty in performing continuous math on a digital computer is that we need to represent infinitely many real numbers with a finite number of bit patterns. This means that for almost all real numbers, we incur some approximation error when we represent the number in the computer. In many cases, this is just rounding error. Rounding error is problematic, especially when it compounds across many operations, and can cause algorithms that work in theory to fail in practice if they are not designed to minimize the accumulation of rounding error.

One form of rounding error that is particularly devastating is underflow. Underflow occurs when numbers near zero are rounded to zero. Many functions behave qualitatively differently when their argument is zero rather than a small positive number. For example, we usually want to avoid division by zero (some software environments will raise exceptions when this occurs, others will return a result with a placeholder not-a-number value) or taking the logarithm of zero (this is usually treated as $-\infty$ , which then becomes not-a-number if it is used for many further arithmetic operations).

Another highly damaging form of numerical error is overflow. Overflow occurs when numbers with large magnitude are approximated as $\infty$ or $-\infty$ . Further arithmetic will usually change these infinite values into not-a-number values.

One example of a function that must be stabilized against underflow and overflow is the softmax function. The softmax function is often used to predict the probabilities associated with a multinoulli distribution. The softmax function is defined to be

$$
\operatorname{softmax}(\boldsymbol{x})_{i} = \frac{\exp(x_{i})}{\sum_{j = 1}^{n} \exp(x_{j})}.\tag{4.1}
$$

Consider what happens when all the $x_{i}$ are equal to some constant c. Analytically, we can see that all the outputs should be equal to $\frac{1}{n}$ . Numerically, this may not occur when c has large magnitude. If c is very negative, then $\exp(c)$ will underflow. This means the denominator of the softmax will become 0, so the final result is undefined. When c is very large and positive, $\exp(c)$ will overflow, again resulting in the expression as a whole being undefined. Both of these difficulties can be resolved by instead evaluating $\operatorname{softmax}(z)$ where $z = x - \max_{i} x_{i}$ . Simple algebra shows that the value of the softmax function is not changed analytically by adding or subtracting a scalar from the input vector. Subtracting $\max_{i} x_{i}$ results in the largest argument to exp being 0, which rules out the possibility of overflow. Likewise, at least one term in the denominator has a value of 1, which rules out the possibility of underflow in the denominator leading to a division by zero.

There is still one small problem. Underflow in the numerator can still cause the expression as a whole to evaluate to zero. This means that if we implement $\log\text{softmax}(\boldsymbol{x})$ by first running the softmax subroutine then passing the result to the log function, we could erroneously obtain $-\infty$ . Instead, we must implement a separate function that calculates $\log\text{softmax}$ in a numerically stable way. The log softmax function can be stabilized using the same trick as we used to stabilize the softmax function.

For the most part, we do not explicitly detail all the numerical considerations involved in implementing the various algorithms described in this book. Developers of low-level libraries should keep numerical issues in mind when implementing deep learning algorithms. Most readers of this book can simply rely on low-level libraries that provide stable implementations. In some cases, it is possible to implement a new algorithm and have the new implementation automatically stabilized. Theano (Bergstra et al., 2010; Bastien et al., 2012) is an example of a software package that automatically detects and stabilizes many common numerically unstable expressions that arise in the context of deep learning.

## 4.2 Poor Conditioning

Conditioning refers to how rapidly a function changes with respect to small changes in its inputs. Functions that change rapidly when their inputs are perturbed slightly can be problematic for scientific computation because rounding errors in the inputs can result in large changes in the output.

Consider the function $f(x) = A^{-1}x$ . When $A \in R^{n \times n}$ has an eigenvalue decomposition, its condition number is

$$
\max_{i, j} \left| \frac{\lambda_{i}}{\lambda_{j}} \right|.\tag{4.2}
$$

This is the ratio of the magnitude of the largest and smallest eigenvalue. When this number is large matrix inversion is particularly sensitive to error in the input.

This sensitivity is an intrinsic property of the matrix itself, not the result of rounding error during matrix inversion. Poorly conditioned matrices amplify pre-existing errors when we multiply by the true matrix inverse. In practice, the error will be compounded further by numerical errors in the inversion process itself.

## 4.3 Gradient-Based Optimization

Most deep learning algorithms involve optimization of some sort. Optimization refers to the task of either minimizing or maximizing some function $f(\boldsymbol{x})$ by altering x. We usually phrase most optimization problems in terms of minimizing $f(\boldsymbol{x})$ . Maximization may be accomplished via a minimization algorithm by minimizing $-f(\boldsymbol{x})$ .

The function we want to minimize or maximize is called the objective function, or criterion. When we are minimizing it, we may also call it the cost function, loss function, or error function. In this book, we use these terms interchangeably, though some machine learning publications assign special meaning to some of these terms.

We often denote the value that minimizes or maximizes a function with a superscript \*. For example, we might say $x^{*} = \arg\min f(x)$ .

We assume the reader is already familiar with calculus but provide a brief review of how calculus concepts relate to optimization here.

Suppose we have a function $y = f(x)$ , where both x and y are real numbers. The derivative of this function is denoted as $f'(x)$ or as $\frac{dy}{dx}$ . The derivative $f'(x)$ gives the slope of $f(x)$ at the point x. In other words, it specifies how to scale a small change in the input to obtain the corresponding change in the output: $f(x + \epsilon) \approx f(x) + \epsilon f'(x)$ .

The derivative is therefore useful for minimizing a function because it tells us how to change x in order to make a small improvement in y. For example, we know that $f(x - \epsilon \text{sign}(f'(x)))$ is less than $f(x)$ for small enough $\epsilon$ . We can thus reduce $f(x)$ by moving x in small steps with the opposite sign of the derivative. This technique is called gradient descent (Cauchy, 1847). See figure 4.1 for an example of this technique.

When $f'(x) = 0$ , the derivative provides no information about which direction to move. Points where $f'(x) = 0$ are known as critical points, or stationary points. A local minimum is a point where $f(x)$ is lower than at all neighboring points, so it is no longer possible to decrease $f(x)$ by making infinitesimal steps. A local maximum is a point where $f(x)$ is higher than at all neighboring points, so it is not possible to increase $f(x)$ by making infinitesimal steps. Some critical points are neither maxima nor minima. These are known as saddle points. See figure 4.2 for examples of each type of critical point.

![Figure 4.1](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/ef393075eb1600a95cbafe494a6390e52c237fbc71e26b4914768f531d564cbb.jpg)  
Figure 4.1: Gradient descent. An illustration of how the gradient descent algorithm uses the derivatives of a function can be used to follow the function downhill to a minimum.

![Figure 4.2](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/7f258ee8ae78d05d3d4d6ca3b85b40966a6453968f79d66c6a8cfa8ecb1c0492.jpg)  
Figure 4.2: Types of critical points. Examples of the three types of critical points in one dimension. A critical point is a point with zero slope. Such a point can either be a local minimum, which is lower than the neighboring points; a local maximum, which is higher than the neighboring points; or a saddle point, which has neighbors that are both higher and lower than the point itself.

![Figure 4.3](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/87032d89af59d70b1ca31c5ae48fe3cec1f5c439e461047efd7bf08ebc151159.jpg)  
Figure 4.3: Approximate minimization. Optimization algorithms may fail to find a global minimum when there are multiple local minima or plateaus present. In the context of deep learning, we generally accept such solutions even though they are not truly minimal, so long as they correspond to significantly low values of the cost function.

A point that obtains the absolute lowest value of $f(x)$ is a global minimum. There can be only one global minimum or multiple global minima of the function. It is also possible for there to be local minima that are not globally optimal. In the context of deep learning, we optimize functions that may have many local minima that are not optimal and many saddle points surrounded by very flat regions. All of this makes optimization difficult, especially when the input to the function is multidimensional. We therefore usually settle for finding a value of f that is very low but not necessarily minimal in any formal sense. See figure 4.3 for an example.

We often minimize functions that have multiple inputs: $f : \mathbb{R}^{n} \to R$ . For the concept of “minimization” to make sense, there must still be only one (scalar) output.

For functions with multiple inputs, we must make use of the concept of partial derivatives. The partial derivative $\frac{\partial}{\partial x_{i}}f(\boldsymbol{x})$ measures how f changes as only the variable $x_{i}$ increases at point x. The gradient generalizes the notion of derivative to the case where the derivative is with respect to a vector: the gradient of f is the vector containing all the partial derivatives, denoted $\nabla_{\boldsymbol{x}}f(\boldsymbol{x})$ . Element i of the gradient is the partial derivative of f with respect to $x_{i}$ . In multiple dimensions, critical points are points where every element of the gradient is equal to zero.

The directional derivative in direction $\boldsymbol{u}$ (a unit vector) is the slope of the function $f$ in direction $u$ . In other words, the directional derivative is the derivative of the function $f(\boldsymbol{x} + \alpha \boldsymbol{u})$ with respect to $\alpha$ , evaluated at $\alpha = 0$ . Using the chain rule, we can see that $\frac{\partial}{\partial\alpha} f(\boldsymbol{x} + \alpha \boldsymbol{u})$ evaluates to $\boldsymbol{u}^{\top} \nabla_{\boldsymbol{x}} f(\boldsymbol{x})$ when $\alpha = 0$ .

To minimize f, we would like to find the direction in which f decreases the fastest. We can do this using the directional derivative:

$$
\min_{\boldsymbol{u}, \boldsymbol{u}^{\top} \boldsymbol{u} = 1} \boldsymbol{u}^{\top} \nabla_{\boldsymbol{x}} f(\boldsymbol{x})\tag{4.3}
$$

$$
= \min_{\boldsymbol{u}, \boldsymbol{u}^{\top} \boldsymbol{u} = 1} | | \boldsymbol{u} | |_{2} | | \nabla_{\boldsymbol{x}} f(\boldsymbol{x}) | |_{2} \cos \theta\tag{4.4}
$$

where $\theta$ is the angle between u and the gradient. Substituting in $\|u\|_{2}=1$ and ignoring factors that do not depend on u, this simplifies to $\min_{u}\cos\theta$ . This is minimized when u points in the opposite direction as the gradient. In other words, the gradient points directly uphill, and the negative gradient points directly downhill. We can decrease f by moving in the direction of the negative gradient. This is known as the method of steepest descent, or gradient descent.

Steepest descent proposes a new point

$$
\boldsymbol{x}^{\prime} = \boldsymbol{x} - \epsilon \nabla_{\boldsymbol{x}} f(\boldsymbol{x})\tag{4.5}
$$

where $\epsilon$ is the learning rate, a positive scalar determining the size of the step. We can choose $\epsilon$ in several different ways. A popular approach is to set $\epsilon$ to a small constant. Sometimes, we can solve for the step size that makes the directional derivative vanish. Another approach is to evaluate $f(\boldsymbol{x}-\epsilon\nabla_{\boldsymbol{x}}f(\boldsymbol{x}))$ for several values of $\epsilon$ and choose the one that results in the smallest objective function value. This last strategy is called a line search.

Steepest descent converges when every element of the gradient is zero (or, in practice, very close to zero). In some cases, we may be able to avoid running this iterative algorithm and just jump directly to the critical point by solving the equation $\nabla_{\boldsymbol{x}}f(\boldsymbol{x})=0$ for x.

Although gradient descent is limited to optimization in continuous spaces, the general concept of repeatedly making a small move (that is approximately the best small move) toward better configurations can be generalized to discrete spaces. Ascending an objective function of discrete parameters is called hill climbing (Russel and Norvig, 2003).

## 4.3.1 Beyond the Gradient: Jacobian and Hessian Matrices

Sometimes we need to find all the partial derivatives of a function whose input and output are both vectors. The matrix containing all such partial derivatives is known as a Jacobian matrix. Specifically, if we have a function $f : \mathbb{R}^{m} \to \mathbb{R}^{n}$ , then the Jacobian matrix $J \in R^{n \times m}$ of f is defined such that $J_{i,j} = \frac{\partial}{\partial x_{j}} f(x)_{i}$ .

We are also sometimes interested in a derivative of a derivative. This is known as a second derivative. For example, for a function $f : \mathbb{R}^{n} \to R$ , the derivative with respect to $x_{i}$ of the derivative of f with respect to $x_{j}$ is denoted as $\frac{\partial^{2}}{\partial x_{i}\partial x_{j}}f$ . In a single dimension, we can denote $\frac{d^{2}}{dx^{2}}f$ by $f''(x)$ . The second derivative tells us how the first derivative will change as we vary the input. This is important because it tells us whether a gradient step will cause as much of an improvement as we would expect based on the gradient alone. We can think of the second derivative as measuring curvature. Suppose we have a quadratic function (many functions that arise in practice are not quadratic but can be approximated well as quadratic, at least locally). If such a function has a second derivative of zero, then there is no curvature. It is a perfectly flat line, and its value can be predicted using only the gradient. If the gradient is 1, then we can make a step of size $\epsilon$ along the negative gradient, and the cost function will decrease by $\epsilon$ . If the second derivative is negative, the function curves downward, so the cost function will actually decrease by more than $\epsilon$ . Finally, if the second derivative is positive, the function curves upward, so the cost function can decrease by less than $\epsilon$ . See figure 4.4 to see how different forms of curvature affect the relationship between the value of the cost function predicted by the gradient and the true value.

When our function has multiple input dimensions, there are many second derivatives. These derivatives can be collected together into a matrix called the Hessian matrix. The Hessian matrix $H(f)(x)$ is defined such that

$$
\boldsymbol{H}(f)(\boldsymbol{x})_{i, j} = \frac{\partial^{2}}{\partial x_{i} \partial x_{j}} f(\boldsymbol{x}).\tag{4.6}
$$

Equivalently, the Hessian is the Jacobian of the gradient.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/3f6f4b8ac2344a07c9e9259bbe3378c77972cca5c71b141e7f64472991f44827.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/8926e7f16fe4f7216e7f9f02ed5218bbe007568f08e3184eb6e0c9c2a90c1274.jpg)

![Figure 4.4](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/813658f9f425fe76a5c6a7d6c0931856d67237ed69b228a893fe52b8851f5140.jpg)  
Figure 4.4: The second derivative determines the curvature of a function. Here we show quadratic functions with various curvature. The dashed line indicates the value of the cost function we would expect based on the gradient information alone as we make a gradient step downhill. With negative curvature, the cost function actually decreases faster than the gradient predicts. With no curvature, the gradient predicts the decrease correctly. With positive curvature, the function decreases more slowly than expected and eventually begins to increase, so steps that are too large can actually increase the function inadvertently.

Anywhere that the second partial derivatives are continuous, the differential operators are commutative; that is, their order can be swapped:

$$
\frac{\partial^{2}}{\partial x_{i} \partial x_{j}} f(\boldsymbol{x}) = \frac{\partial^{2}}{\partial x_{j} \partial x_{i}} f(\boldsymbol{x}).\tag{4.7}
$$

This implies that $H_{i,j} = H_{j,i}$ , so the Hessian matrix is symmetric at such points. Most of the functions we encounter in the context of deep learning have a symmetric Hessian almost everywhere. Because the Hessian matrix is real and symmetric, we can decompose it into a set of real eigenvalues and an orthogonal basis of eigenvectors. The second derivative in a specific direction represented by a unit vector d is given by $d^{\top}Hd$ . When d is an eigenvector of H, the second derivative in that direction is given by the corresponding eigenvalue. For other directions of d, the directional second derivative is a weighted average of all the eigenvalues, with weights between 0 and 1, and eigenvectors that have a smaller angle with d receiving more weight. The maximum eigenvalue determines the maximum second derivative, and the minimum eigenvalue determines the minimum second derivative.

The (directional) second derivative tells us how well we can expect a gradient descent step to perform. We can make a second-order Taylor series approximation to the function $f(\pmb{x})$ around the current point $\pmb{x}^{(0)}$ :

$$
f(\boldsymbol{x}) \approx f(\boldsymbol{x}^{(0)}) +(\boldsymbol{x} - \boldsymbol{x}^{(0)})^{\top} \boldsymbol{g} + \frac{1}{2}(\boldsymbol{x} - \boldsymbol{x}^{(0)})^{\top} \boldsymbol{H}(\boldsymbol{x} - \boldsymbol{x}^{(0)}),\tag{4.8}
$$

where g is the gradient and H is the Hessian at $\boldsymbol{x}^{(0)}$ . If we use a learning rate of $\epsilon$ , then the new point x will be given by $\boldsymbol{x}^{(0)} - \epsilon\boldsymbol{g}$ . Substituting this into our approximation, we obtain

$$
f(\boldsymbol{x}^{(0)} - \epsilon \boldsymbol{g}) \approx f(\boldsymbol{x}^{(0)}) - \epsilon \boldsymbol{g}^{\top} \boldsymbol{g} + \frac{1}{2} \epsilon^{2} \boldsymbol{g}^{\top} \boldsymbol{H} \boldsymbol{g}.\tag{4.9}
$$

There are three terms here: the original value of the function, the expected improvement due to the slope of the function, and the correction we must apply to account for the curvature of the function. When this last term is too large, the gradient descent step can actually move uphill. When $g^{\top}Hg$ is zero or negative, the Taylor series approximation predicts that increasing $\epsilon$ forever will decrease f forever. In practice, the Taylor series is unlikely to remain accurate for large $\epsilon$ , so one must resort to more heuristic choices of $\epsilon$ in this case. When $g^{\top}Hg$ is positive, solving for the optimal step size that decreases the Taylor series approximation of the function the most yields

$$
\epsilon^{*} = \frac{\boldsymbol{g}^{\top} \boldsymbol{g}}{\boldsymbol{g}^{\top} \boldsymbol{H} \boldsymbol{g}}.\tag{4.10}
$$

In the worst case, when g aligns with the eigenvector of H corresponding to the maximal eigenvalue $\lambda_{max}$ , then this optimal step size is given by $\frac{1}{\lambda_{max}}$ . To the extent that the function we minimize can be approximated well by a quadratic function, the eigenvalues of the Hessian thus determine the scale of the learning rate.

The second derivative can be used to determine whether a critical point is a local maximum, a local minimum, or a saddle point. Recall that on a critical point, $f'(x) = 0$ . When the second derivative $f''(x) > 0$ , the first derivative $f'(x)$ increases as we move to the right and decreases as we move to the left. This means $f'(x - \epsilon) < 0$ and $f'(x + \epsilon) > 0$ for small enough $\epsilon$ . In other words, as we move right, the slope begins to point uphill to the right, and as we move left, the slope begins to point uphill to the left. Thus, when $f'(x) = 0$ and $f''(x) > 0$ , we can conclude that x is a local minimum. Similarly, when $f'(x) = 0$ and $f''(x) < 0$ , we can conclude that x is a local maximum. This is known as the second derivative test. Unfortunately, when $f''(x) = 0$ , the test is inconclusive. In this case x may be a saddle point or a part of a flat region.

In multiple dimensions, we need to examine all the second derivatives of the function. Using the eigendecomposition of the Hessian matrix, we can generalize the second derivative test to multiple dimensions. At a critical point, where $\nabla_{\boldsymbol{x}}f(\boldsymbol{x})=0$ , we can examine the eigenvalues of the Hessian to determine whether the critical point is a local maximum, local minimum, or saddle point. When the Hessian is positive definite (all its eigenvalues are positive), the point is a local minimum. This can be seen by observing that the directional second derivative in any direction must be positive, and making reference to the univariate second derivative test. Likewise, when the Hessian is negative definite (all its eigenvalues are negative), the point is a local maximum. In multiple dimensions, it is actually possible to find positive evidence of saddle points in some cases. When at least one eigenvalue is positive and at least one eigenvalue is negative, we know that x is a local maximum on one cross section of f but a local minimum on another cross section. See figure 4.5 for an example. Finally, the multidimensional second derivative test can be inconclusive, just as the univariate version can. The test is inconclusive whenever all the nonzero eigenvalues have the same sign but at least one eigenvalue is zero. This is because the univariate second derivative test is inconclusive in the cross section corresponding to the zero eigenvalue.

In multiple dimensions, there is a different second derivative for each direction at a single point. The condition number of the Hessian at this point measures how much the second derivatives differ from each other. When the Hessian has a poor condition number, gradient descent performs poorly. This is because in one direction, the derivative increases rapidly, while in another direction, it increases slowly. Gradient descent is unaware of this change in the derivative, so it does not know that it needs to explore preferentially in the direction where the derivative remains negative for longer. Poor condition number also makes choosing a good step size difficult. The step size must be small enough to avoid overshooting the minimum and going uphill in directions with strong positive curvature. This usually means that the step size is too small to make significant progress in other directions with less curvature. See figure 4.6 for an example.

![Figure 4.5](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/ff078d247a7f603564158b678838655281f576ee2666f9a009df0ee1cc0e9db6.jpg)  
Figure 4.5: A saddle point containing both positive and negative curvature. The function in this example is $f(\boldsymbol{x}) = x_{1}^{2} - x_{2}^{2}$ . Along the axis corresponding to $x_{1}$ , the function curves upward. This axis is an eigenvector of the Hessian and has a positive eigenvalue. Along the axis corresponding to $x_{2}$ , the function curves downward. This direction is an eigenvector of the Hessian with negative eigenvalue. The name “saddle point” derives from the saddle-like shape of this function. This is the quintessential example of a function with a saddle point. In more than one dimension, it is not necessary to have an eigenvalue of 0 to get a saddle point: it is only necessary to have both positive and negative eigenvalues. We can think of a saddle point with both signs of eigenvalues as being a local maximum within one cross section and a local minimum within another cross section.

This issue can be resolved by using information from the Hessian matrix to guide the search. The simplest method for doing so is known as Newton's method. Newton's method is based on using a second-order Taylor series expansion to approximate $f(\boldsymbol{x})$ near some point $\boldsymbol{x}^{(0)}$ :

$$
f(\boldsymbol{x}) \approx f(\boldsymbol{x}^{(0)}) +(\boldsymbol{x} - \boldsymbol{x}^{(0)})^{\top} \nabla_{\boldsymbol{x}} f(\boldsymbol{x}^{(0)}) + \frac{1}{2}(\boldsymbol{x} - \boldsymbol{x}^{(0)})^{\top} \boldsymbol{H}(f)(\boldsymbol{x}^{(0)})(\boldsymbol{x} - \boldsymbol{x}^{(0)}).\tag{4.11}
$$

![Figure 4.6](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/2154ca5c0d9eb15c761c86ac8c625fb36e7f9e7c0774e2caca1d59208dcb4c8d.jpg)  
Figure 4.6: Gradient descent fails to exploit the curvature information contained in the Hessian matrix. Here we use gradient descent to minimize a quadratic function $f(\pmb{x})$ whose Hessian matrix has condition number 5. This means that the direction of most curvature has five times more curvature than the direction of least curvature. In this case, the most curvature is in the direction $[1,1]^{\top}$ , and the least curvature is in the direction $[1, -1]^{\top}$ . The red lines indicate the path followed by gradient descent. This very elongated quadratic function resembles a long canyon. Gradient descent wastes time repeatedly descending canyon walls because they are the steepest feature. Since the step size is somewhat too large, it has a tendency to overshoot the bottom of the function and thus needs to descend the opposite canyon wall on the next iteration. The large positive eigenvalue of the Hessian corresponding to the eigenvector pointed in this direction indicates that this directional derivative is rapidly increasing, so an optimization algorithm based on the Hessian could predict that the steepest direction is not actually a promising search direction in this context.

If we then solve for the critical point of this function, we obtain

$$
\boldsymbol{x}^{*} = \boldsymbol{x}^{(0)} - \boldsymbol{H}(f)(\boldsymbol{x}^{(0)})^{- 1} \nabla_{\boldsymbol{x}} f(\boldsymbol{x}^{(0)}).\tag{4.12}
$$

When $f$ is a positive definite quadratic function, Newton's method consists of applying equation 4.12 once to jump to the minimum of the function directly. When $f$ is not truly quadratic but can be locally approximated as a positive definite quadratic. Newton's method consists of applying equation 4.12 multiple times. Iteratively updating the approximation and jumping to the minimum of the approximation can reach the critical point much faster than gradient descent would. This is a useful property near a local minimum, but it can be a harmful property near a saddle point. As discussed in section 8.2.3, Newton's method is only appropriate when the nearby critical point is a minimum (all the eigenvalues of the Hessian are positive), whereas gradient descent is not attracted to saddle points unless the gradient points toward them.

Optimization algorithms that use only the gradient, such as gradient descent, are called first-order optimization algorithms. Optimization algorithms that also use the Hessian matrix, such as Newton's method, are called second-order optimization algorithms (Nocedal and Wright, 2006).

The optimization algorithms employed in most contexts in this book are applicable to a wide variety of functions but come with almost no guarantees. Deep learning algorithms tend to lack guarantees because the family of functions used in deep learning is quite complicated. In many other fields, the dominant approach to optimization is to design optimization algorithms for a limited family of functions.

In the context of deep learning, we sometimes gain some guarantees by restricting ourselves to functions that are either Lipschitz continuous or have Lipschitz continuous derivatives. A Lipschitz continuous function is a function f whose rate of change is bounded by a Lipschitz constant L:

$$
\forall \boldsymbol{x}, \forall \boldsymbol{y}, | f(\boldsymbol{x}) - f(\boldsymbol{y}) | \leq \mathcal{L} \| \boldsymbol{x} - \boldsymbol{y} \|_{2}.\tag{4.13}
$$

This property is useful because it enables us to quantify our assumption that a small change in the input made by an algorithm such as gradient descent will have a small change in the output. Lipschitz continuity is also a fairly weak constraint, and many optimization problems in deep learning can be made Lipschitz continuous with relatively minor modifications.

Perhaps the most successful field of specialized optimization is convex optimization. Convex optimization algorithms are able to provide many more guarantees by making stronger restrictions. These algorithms are applicable only to convex functions—functions for which the Hessian is positive semidefinite everywhere. Such functions are well-behaved because they lack saddle points, and all their local minima are necessarily global minima. However, most problems in deep learning are difficult to express in terms of convex optimization. Convex optimization is used only as a subroutine of some deep learning algorithms. Ideas from the analysis of convex optimization algorithms can be useful for proving the convergence of deep learning algorithms, but in general, the importance of convex optimization is greatly diminished in the context of deep learning. For more information about convex optimization, see Boyd and Vandenberghe (2004) or Rockafellar (1997).

## 4.4 Constrained Optimization

Sometimes we wish not only to maximize or minimize a function $f(\pmb{x})$ over all possible values of $\mathbb{S}$ . Instead we may wish to find the maximal or minimal value of $f(\pmb{x})$ for values of $\pmb{x}$ in some set $\mathbb{S}$ . This is known as constrained optimization. Points $\pmb{x}$ that lie within the set $\mathbb{S}$ are called feasible points in constrained optimization terminology.

We often wish to find a solution that is small in some sense. A common approach in such situations is to impose a norm constraint, such as $\|x\|\leq1$ .

One simple approach to constrained optimization is simply to modify gradient descent taking the constraint into account. If we use a small constant step size $\epsilon$ , we can make gradient descent steps, then project the result back into S. If we use a line search, we can search only over step sizes $\epsilon$ that yield new x points that are feasible, or we can project each point on the line back into the constraint region. When possible, this method can be made more efficient by projecting the gradient into the tangent space of the feasible region before taking the step or beginning the line search (Rosen, 1960).

A more sophisticated approach is to design a different, unconstrained optimization problem whose solution can be converted into a solution to the original, constrained optimization problem. For example, if we want to minimize $f(\boldsymbol{x})$ for $x \in \mathbb{R}^{2}$ with x constrained to have exactly unit $L^{2}$ norm, we can instead minimize $g(\theta) = f([\cos\theta, \sin\theta]^{\top})$ with respect to $\theta$ , then return $[\cos\theta, \sin\theta]$ as the solution to the original problem. This approach requires creativity; the transformation between optimization problems must be designed specifically for each case we encounter.

The Karush-Kuhn-Tucker (KKT) approach $^{1}$ provides a very general solution to constrained optimization. With the KKT approach, we introduce a new function called the generalized Lagrangian or generalized Lagrange function.

To define the Lagrangian, we first need to describe S in terms of equations and inequalities. We want a description of S in terms of m functions $g^{(i)}$ and n functions $h^{(j)}$ so that $S = \{x \mid \forall i, g^{(i)}(x) = 0 \text{and} \forall j, h^{(j)}(x) \leq 0\}$ . The equations involving $g^{(i)}$ are called the equality constraints, and the inequalities involving $h^{(j)}$ are called inequality constraints.

We introduce new variables $\lambda_{i}$ and $\alpha_{j}$ for each constraint, these are called the KKT multipliers. The generalized Lagrangian is then defined as

$$
L(\boldsymbol{x}, \boldsymbol{\lambda}, \boldsymbol{\alpha}) = f(\boldsymbol{x}) + \sum_{i} \lambda_{i} g^{(i)}(\boldsymbol{x}) + \sum_{j} \alpha_{j} h^{(j)}(\boldsymbol{x}).\tag{4.14}
$$

We can now solve a constrained minimization problem using unconstrained optimization of the generalized Lagrangian. As long as at least one feasible point exists and $f(\boldsymbol{x})$ is not permitted to have value $\infty$ , then

$$
\min_{\boldsymbol{x}} \max_{\boldsymbol{\lambda}} \max_{\boldsymbol{\alpha}, \boldsymbol{\alpha} \geq 0} L(\boldsymbol{x}, \boldsymbol{\lambda}, \boldsymbol{\alpha})\tag{4.15}
$$

has the same optimal objective function value and set of optimal points x as

$$
\min_{\boldsymbol{x} \in \mathbb{S}} f(\boldsymbol{x}).\tag{4.16}
$$

This follows because any time the constraints are satisfied,

$$
\max_{\boldsymbol{\lambda}} \max_{\boldsymbol{\alpha}, \boldsymbol{\alpha} \geq 0} L(\boldsymbol{x}, \boldsymbol{\lambda}, \boldsymbol{\alpha}) = f(\boldsymbol{x}),\tag{4.17}
$$

while any time a constraint is violated,

$$
\max_{\boldsymbol{\lambda}} \max_{\boldsymbol{\alpha}, \boldsymbol{\alpha} \geq 0} L(\boldsymbol{x}, \boldsymbol{\lambda}, \boldsymbol{\alpha}) = \infty.\tag{4.18}
$$

These properties guarantee that no infeasible point can be optimal, and that the optimum within the feasible points is unchanged.

To perform constrained maximization, we can construct the generalized Lagrange function of $-f(\boldsymbol{x})$ , which leads to this optimization problem:

$$
\min_{\boldsymbol{x}} \max_{\boldsymbol{\lambda}} \max_{\boldsymbol{\alpha}, \boldsymbol{\alpha} \geq 0} - f(\boldsymbol{x}) + \sum_{i} \lambda_{i} g^{(i)}(\boldsymbol{x}) + \sum_{j} \alpha_{j} h^{(j)}(\boldsymbol{x}).\tag{4.19}
$$

We may also convert this to a problem with maximization in the outer loop:

$$
\max_{\boldsymbol{x}} \min_{\boldsymbol{\lambda}} \min_{\alpha, \alpha \geq 0} f(\boldsymbol{x}) + \sum_{i} \lambda_{i} g^{(i)}(\boldsymbol{x}) - \sum_{j} \alpha_{j} h^{(j)}(\boldsymbol{x}).\tag{4.20}
$$

The sign of the term for the equality constraints does not matter; we may define it with addition or subtraction as we wish, because the optimization is free to choose any sign for each $\lambda_{i}$ .

The inequality constraints are particularly interesting. We say that a constraint $h^{(i)}(\boldsymbol{x})$ is active if $h^{(i)}(\boldsymbol{x}^{*}) = 0$ . If a constraint is not active, then the solution to the problem found using that constraint would remain at least a local solution if that constraint were removed. It is possible that an inactive constraint excludes other solutions. For example, a convex problem with an entire region of globally optimal points (a wide, flat region of equal cost) could have a subset of this region eliminated by constraints, or a nonconvex problem could have better local stationary points excluded by a constraint that is inactive at convergence. Yet the point found at convergence remains a stationary point whether or not the inactive constraints are included. Because an inactive $h^{(i)}$ has negative value, then the solution to $\min_{\boldsymbol{x}} \max_{\boldsymbol{\lambda}} \max_{\boldsymbol{\alpha}, \boldsymbol{\alpha} \geq 0} L(\boldsymbol{x}, \boldsymbol{\lambda}, \boldsymbol{\alpha})$ will have $\alpha_{i} = 0$ . We can thus observe that at the solution, $\boldsymbol{\alpha} \odot \boldsymbol{h}(\boldsymbol{x}) = \boldsymbol{0}$ . In other words, for all i, we know that at least one of the constraints $\alpha_{i} \geq 0$ or $h^{(i)}(\boldsymbol{x}) \leq 0$ must be active at the solution. To gain some intuition for this idea, we can say that either the solution is on the boundary imposed by the inequality and we must use its KKT multiplier to influence the solution to x, or the inequality has no influence on the solution and we represent this by zeroing out its KKT multiplier.

A simple set of properties describe the optimal points of constrained optimization problems. These properties are called the Karush-Kuhn-Tucker (KKT) conditions (Karush, 1939; Kuhn and Tucker, 1951). They are necessary conditions, but not always sufficient conditions, for a point to be optimal. The conditions are:

\- The gradient of the generalized Lagrangian is zero.

\- All constraints on both $\pmb{x}$ and the KKT multipliers are satisfied.

\- The inequality constraints exhibit “complementary slackness”: $\alpha \cdot h(x) = 0$ .

For more information about the KKT approach, see Nocedal and Wright (2006).

## 4.5 Example: Linear Least Squares

Suppose we want to find the value of x that minimizes

$$
f(\boldsymbol{x}) = \frac{1}{2} | | \boldsymbol{Ax} - \boldsymbol{b} | |_{2}^{2}.\tag{4.21}
$$

Specialized linear algebra algorithms can solve this problem efficiently; however, we can also explore how to solve it using gradient-based optimization as a simple example of how these techniques work.

First, we need to obtain the gradient:

$$
\nabla_{\boldsymbol{x}} f(\boldsymbol{x}) = \boldsymbol{A}^{\top}(\boldsymbol{A} \boldsymbol{x} - \boldsymbol{b}) = \boldsymbol{A}^{\top} \boldsymbol{A} \boldsymbol{x} - \boldsymbol{A}^{\top} \boldsymbol{b}.\tag{4.22}
$$

We can then follow this gradient downhill, taking small steps. See algorithm 4.1 for details.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 4.1 An algorithm to minimize $f(x) = \frac{1}{2} ||Ax - b||_2^2$ with respect to $x$ using gradient descent, starting from an arbitrary value of $x$.

Set the step size ($\epsilon$) and tolerance ($\delta$) to small, positive numbers.
while $||A^\top Ax - A^\top b||_2 &gt; \delta$ do
$x \leftarrow x - \epsilon(A^\top Ax - A^\top b)$
end while
</div>

One can also solve this problem using Newton's method. In this case, because the true function is quadratic, the quadratic approximation employed by Newton's method is exact, and the algorithm converges to the global minimum in a single step.

Now suppose we wish to minimize the same function, but subject to the constraint $x^{\top}x \leq 1$ . To do so, we introduce the Lagrangian

$$
L(\boldsymbol{x}, \lambda) = f(\boldsymbol{x}) + \lambda \left(\boldsymbol{x}^{\top} \boldsymbol{x} - 1\right).\tag{4.23}
$$

We can now solve the problem

$$
\min_{\boldsymbol{x}} \max_{\lambda, \lambda \geq 0} L(\boldsymbol{x}, \lambda).\tag{4.24}
$$

The smallest-norm solution to the unconstrained least-squares problem may be found using the Moore-Penrose pseudoinverse: $x = A^{+}b$ . If this point is feasible, then it is the solution to the constrained problem. Otherwise, we must find a solution where the constraint is active. By differentiating the Lagrangian with respect to x, we obtain the equation

$$
\boldsymbol{A}^{\top} \boldsymbol{A} \boldsymbol{x} - \boldsymbol{A}^{\top} \boldsymbol{b} + 2 \lambda \boldsymbol{x} = 0.\tag{4.25}
$$

This tells us that the solution will take the form

$$
\boldsymbol{x} = \left(\boldsymbol{A}^{\top} \boldsymbol{A} + 2 \lambda \boldsymbol{I}\right)^{- 1} \boldsymbol{A}^{\top} \boldsymbol{b}.\tag{4.26}
$$

The magnitude of $\lambda$ must be chosen such that the result obeys the constraint. We can find this value by performing gradient ascent on $\lambda$ . To do so, observe

$$
\frac{\partial}{\partial \lambda} L(\boldsymbol{x}, \lambda) = \boldsymbol{x}^{\top} \boldsymbol{x} - 1.\tag{4.27}
$$

When the norm of x exceeds 1, this derivative is positive, so to follow the derivative uphill and increase the Lagrangian with respect to $\lambda$ , we increase $\lambda$ . Because the coefficient on the $x^{\top}x$ penalty has increased, solving the linear equation for x will now yield a solution with a smaller norm. The process of solving the linear equation and adjusting $\lambda$ continues until x has the correct norm and the derivative on $\lambda$ is 0.

This concludes the mathematical preliminaries that we use to develop machine learning algorithms. We are now ready to build and analyze some full-fledged learning systems.


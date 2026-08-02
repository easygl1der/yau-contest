---
title: "Chapter 7 \u2014 Regularization for Deep Learning"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 7
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 4451
source_line_end: 5224
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 9
source_empty_image_alt: 9
non_semantic_image_alt: 0
caption_derived_image_alt: 9
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

# Chapter 7 — Regularization for Deep Learning

> [[../README|本书目录]] · [[06-chapter-6-deep-feedforward-networks|上一章]] · [[08-chapter-8-optimization-for-training-deep-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 4451–5224。
> - 本章保留 9 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Regularization for Deep Learning

A central problem in machine learning is how to make an algorithm that will perform well not just on the training data, but also on new inputs. Many strategies used in machine learning are explicitly designed to reduce the test error, possibly at the expense of increased training error. These strategies are known collectively as regularization. A great many forms of regularization are available to the deep learning practitioner. In fact, developing more effective regularization strategies has been one of the major research efforts in the field.

Chapter 5 introduced the basic concepts of generalization, underfitting, overfitting, bias, variance and regularization. If you are not already familiar with these notions, please refer to that chapter before continuing with this one.

In this chapter, we describe regularization in more detail, focusing on regularization strategies for deep models or models that may be used as building blocks to form deep models.

Some sections of this chapter deal with standard concepts in machine learning. If you are already familiar with these concepts, feel free to skip the relevant sections. However, most of this chapter is concerned with the extension of these basic concepts to the particular case of neural networks.

In section 5.2.2, we defined regularization as “any modification we make to a learning algorithm that is intended to reduce its generalization error but not its training error.” There are many regularization strategies. Some put extra constraints on a machine learning model, such as adding restrictions on the parameter values. Some add extra terms in the objective function that can be thought of as corresponding to a soft constraint on the parameter values. If chosen carefully, these extra constraints and penalties can lead to improved performance on the test set. Sometimes these constraints and penalties are designed to encode specific kinds of prior knowledge. Other times, these constraints and penalties are designed to express a generic preference for a simpler model class in order to promote generalization. Sometimes penalties and constraints are necessary to make an underdetermined problem determined. Other forms of regularization, known as ensemble methods, combine multiple hypotheses that explain the training data.

In the context of deep learning, most regularization strategies are based on regularizing estimators. Regularization of an estimator works by trading increased bias for reduced variance. An effective regularizer is one that makes a profitable trade, reducing variance significantly while not overly increasing the bias. When we discussed generalization and overfitting in chapter 5, we focused on three situations, where the model family being trained either (1) excluded the true data-generating process—corresponding to underfitting and inducing bias, or (2) matched the true data-generating process, or (3) included the generating process but also many other possible generating processes—the overfitting regime where variance rather than bias dominates the estimation error. The goal of regularization is to take a model from the third regime into the second regime.

In practice, an overly complex model family does not necessarily include the target function or the true data-generating process, or even a close approximation of either. We almost never have access to the true data-generating process so we can never know for sure if the model family being estimated includes the generating process or not. Most applications of deep learning algorithms, however, are to domains where the true data-generating process is almost certainly outside the model family. Deep learning algorithms are typically applied to extremely complicated domains such as images, audio sequences and text, for which the true generation process essentially involves simulating the entire universe. To some extent, we are always trying to fit a square peg (the data-generating process) into a round hole (our model family).

What this means is that controlling the complexity of the model is not a simple matter of finding the model of the right size, with the right number of parameters. Instead, we might find -and indeed in practical deep learning scenarios, we almost always do find that the best fitting model (in the sense of minimizing generalization error) is a large model that has been regularized appropriately.

We now review several strategies for how to create such a large, deep regularized model.

## 7.1 Parameter Norm Penalties

Regularization has been used for decades prior to the advent of deep learning. Linear models such as linear regression and logistic regression allow simple, straightforward, and effective regularization strategies.

Many regularization approaches are based on limiting the capacity of models, such as neural networks, linear regression, or logistic regression, by adding a parameter norm penalty $\Omega(\boldsymbol{\theta})$ to the objective function J. We denote the regularized objective function by $\tilde{J}$ :

$$
\tilde{J}(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) = J(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) + \alpha \Omega(\boldsymbol{\theta}),\tag{7.1}
$$

where $\alpha\in[0,\infty)$ is a hyperparameter that weights the relative contribution of the norm penalty term, $\Omega$ , relative to the standard objective function J. Setting $\alpha$ to 0 results in no regularization. Larger values of $\alpha$ correspond to more regularization.

When our training algorithm minimizes the regularized objective function $\tilde{J}$ it will decrease both the original objective J on the training data and some measure of the size of the parameters $\theta$ (or some subset of the parameters). Different choices for the parameter norm $\Omega$ can result in different solutions being preferred. In this section, we discuss the effects of the various norms when used as penalties on the model parameters.

Before delving into the regularization behavior of different norms, we note that for neural networks, we typically choose to use a parameter norm penalty $\Omega$ that penalizes only the weights of the affine transformation at each layer and leaves the biases unregularized. The biases typically require less data than the weights to fit accurately. Each weight specifies how two variables interact. Fitting the weight well requires observing both variables in a variety of conditions. Each bias controls only a single variable. This means that we do not induce too much variance by leaving the biases unregularized. Also, regularizing the bias parameters can introduce a significant amount of underfitting. We therefore use the vector w to indicate all the weights that should be affected by a norm penalty, while the vector $\theta$ denotes all the parameters, including both w and the unregularized parameters.

In the context of neural networks, it is sometimes desirable to use a separate penalty with a different $\alpha$ coefficient for each layer of the network. Because it can be expensive to search for the correct value of multiple hyperparameters, it is still reasonable to use the same weight decay at all layers just to reduce the size of search space.

## 7.1.1 $L^{2}$ Parameter Regularization

We have already seen, in section 5.2.2, one of the simplest and most common kinds of parameter norm penalty: the $L^2$ parameter norm penalty commonly known as weight decay. This regularization strategy drives the weights closer to the origin $^1$ by adding a regularization term $\Omega(\boldsymbol{\theta}) = \frac{1}{2} \| \boldsymbol{w} \|_2^2$ to the objective function. In other academic communities, $L^2$ regularization is also known as ridge regression or Tikhonov regularization.

We can gain some insight into the behavior of weight decay regularization by studying the gradient of the regularized objective function. To simplify the presentation, we assume no bias parameter, so $\theta$ is just w. Such a model has the following total objective function:

$$
\tilde{J}(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}) = \frac{\alpha}{2} \boldsymbol{w}^{\top} \boldsymbol{w} + J(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}),\tag{7.2}
$$

with the corresponding parameter gradient

$$
\nabla_{\boldsymbol{w}} \tilde{J}(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}) = \alpha \boldsymbol{w} + \nabla_{\boldsymbol{w}} J(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}).\tag{7.3}
$$

To take a single gradient step to update the weights, we perform this update:

$$
\boldsymbol{w} \leftarrow \boldsymbol{w} - \epsilon(\alpha \boldsymbol{w} + \nabla_{\boldsymbol{w}} J(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y})).\tag{7.4}
$$

Written another way, the update is

$$
\boldsymbol{w} \leftarrow(1 - \epsilon \alpha) \boldsymbol{w} - \epsilon \nabla_{\boldsymbol{w}} J(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}).\tag{7.5}
$$

We can see that the addition of the weight decay term has modified the learning rule to multiplicatively shrink the weight vector by a constant factor on each step, just before performing the usual gradient update. This describes what happens in a single step. But what happens over the entire course of training?

We will further simplify the analysis by making a quadratic approximation to the objective function in the neighborhood of the value of the weights that obtains minimal unregularized training cost, $\boldsymbol{w}^{*} = \arg\min_{\boldsymbol{w}} J(\boldsymbol{w})$ . If the objective function is truly quadratic, as in the case of fitting a linear regression model with mean squared error, then the approximation is perfect. The approximation $\hat{J}$ is given by

$$
\hat{J}(\pmb{\theta}) = J(\pmb{w}^{*}) + \frac{1}{2}(\pmb{w} - \pmb{w}^{*})^{\top} \pmb{H}(\pmb{w} - \pmb{w}^{*}),\tag{7.6}
$$

where H is the Hessian matrix of J with respect to w evaluated at $w^{*}$ . There is no first-order term in this quadratic approximation, because $w^{*}$ is defined to be a minimum, where the gradient vanishes. Likewise, because $w^{*}$ is the location of a minimum of J, we can conclude that H is positive semidefinite.

The minimum of $\hat{J}$ occurs where its gradient

$$
\nabla_{\boldsymbol{w}} \hat{J}(\boldsymbol{w}) = \boldsymbol{H}(\boldsymbol{w} - \boldsymbol{w}^{*})\tag{7.7}
$$

is equal to 0.

To study the effect of weight decay, we modify equation 7.7 by adding the weight decay gradient. We can now solve for the minimum of the regularized version of $\hat{J}$ . We use the variable $\tilde{\boldsymbol{w}}$ to represent the location of the minimum.

$$
\alpha \tilde{\boldsymbol{w}} + \boldsymbol{H}(\tilde{\boldsymbol{w}} - \boldsymbol{w}^{*}) = 0\tag{7.8}
$$

$$
(\boldsymbol{H} + \alpha \boldsymbol{I}) \tilde{\boldsymbol{w}} = \boldsymbol{H} \boldsymbol{w}^{*}\tag{7.9}
$$

$$
\tilde{\boldsymbol{w}} =(\boldsymbol{H} + \alpha \boldsymbol{I})^{- 1} \boldsymbol{H} \boldsymbol{w}^{*}\tag{7.10}
$$

As $\alpha$ approaches 0, the regularized solution $\tilde{w}$ approaches $w^{*}$ . But what happens as $\alpha$ grows? Because H is real and symmetric, we can decompose it into a diagonal matrix $\Lambda$ and an orthonormal basis of eigenvectors. Q, such that $H = Q\Lambda Q^{\top}$ . Applying the decomposition to equation 7.10, we obtain

$$
\tilde{\boldsymbol{w}} =(\boldsymbol{Q} \boldsymbol{\Lambda} \boldsymbol{Q}^{\top} + \alpha \boldsymbol{I})^{- 1} \boldsymbol{Q} \boldsymbol{\Lambda} \boldsymbol{Q}^{\top} \boldsymbol{w}^{*}\tag{7.11}
$$

$$
= \left[Q(\Lambda + \alpha I) Q^{\top} \right]^{- 1} Q \Lambda Q^{\top} w^{*}\tag{7.12}
$$

$$
= Q(\Lambda + \alpha I)^{- 1} \Lambda Q^{\top} w^{*}.\tag{7.13}
$$

We see that the effect of weight decay is to rescale $w^{*}$ along the axes defined by the eigenvectors of H. Specifically, the component of $w^{*}$ that is aligned with the i-th eigenvector of H is rescaled by a factor of $\frac{\lambda_{i}}{\lambda_{i}+\alpha}$ . (You may wish to review how this kind of scaling works, first explained in figure 2.3).

Along the directions where the eigenvalues of H are relatively large, for example, where $\lambda_{i} \gg \alpha$ , the effect of regularization is relatively small. Yet components with $\lambda_{i} \ll \alpha$ will be shrunk to have nearly zero magnitude. This effect is illustrated in figure 7.1.

![Figure 7.1](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/f65ed108d087632fa7a49d448a5ceccee0ba05faa9164a83e295af0aeb195aef.jpg)  
Figure 7.1: An illustration of the effect of $L^{2}$ (or weight decay) regularization on the value of the optimal w. The solid ellipses represent contours of equal value of the unregularized objective. The dotted circles represent contours of equal value of the $L^{2}$ regularizer. At the point $\tilde{w}$ , these competing objectives reach an equilibrium. In the first dimension, the eigenvalue of the Hessian of J is small. The objective function does not increase much when moving horizontally away from $w^{*}$ . Because the objective function does not express a strong preference along this direction, the regularizer has a strong effect on this axis. The regularizer pulls $w_{1}$ close to zero. In the second dimension, the objective function is very sensitive to movements away from $w^{*}$ . The corresponding eigenvalue is large, indicating high curvature. As a result, weight decay affects the position of $w_{2}$ relatively little.

Only directions along which the parameters contribute significantly to reducing the objective function are preserved relatively intact. In directions that do not contribute to reducing the objective function, a small eigenvalue of the Hessian tells us that movement in this direction will not significantly increase the gradient. Components of the weight vector corresponding to such unimportant directions are decayed away through the use of the regularization throughout training.

So far we have discussed weight decay in terms of its effect on the optimization of an abstract, general quadratic cost function. How do these effects relate to machine learning in particular? We can find out by studying linear regression, a model for which the true cost function is quadratic and therefore amenable to the same kind of analysis we have used so far. Applying the analysis again, we will be able to obtain a special case of the same results, but with the solution now phrased in terms of the training data. For linear regression, the cost function is the sum of squared errors:

$$
\left(\boldsymbol{X} \boldsymbol{w} - \boldsymbol{y}\right)^{\top}(\boldsymbol{X} \boldsymbol{w} - \boldsymbol{y}).\tag{7.14}
$$

When we add $L^2$ regularization, the objective function changes to

$$
\left(\boldsymbol{X} \boldsymbol{w} - \boldsymbol{y}\right)^{\top} \left(\boldsymbol{X} \boldsymbol{w} - \boldsymbol{y}\right) + \frac{1}{2} \alpha \boldsymbol{w}^{\top} \boldsymbol{w}.\tag{7.15}
$$

This changes the normal equations for the solution from

$$
\boldsymbol{w} =(\boldsymbol{X}^{\top} \boldsymbol{X})^{- 1} \boldsymbol{X}^{\top} \boldsymbol{y}\tag{7.16}
$$

to

$$
\boldsymbol{w} = \left(\boldsymbol{X}^{\top} \boldsymbol{X} + \alpha \boldsymbol{I}\right)^{- 1} \boldsymbol{X}^{\top} \boldsymbol{y}.\tag{7.17}
$$

The matrix $X^{\top}X$ in equation 7.16 is proportional to the covariance matrix $\frac{1}{m}X^{\top}X$ . Using $L^{2}$ regularization replaces this matrix with $(X^{\top}X + \alpha I)^{-1}$ in equation 7.17. The new matrix is the same as the original one, but with the addition of $\alpha$ to the diagonal. The diagonal entries of this matrix correspond to the variance of each input feature. We can see that $L^{2}$ regularization causes the learning algorithm to “perceive” the input X as having higher variance, which makes it shrink the weights on features whose covariance with the output target is low compared to this added variance.

## 7.1.2 $L^1$ Regularization

While $L^{2}$ weight decay is the most common form of weight decay, there are other ways to penalize the size of the model parameters. Another option is to use $L^{1}$ regularization.

Formally, $L^1$ regularization on the model parameter $\pmb{w}$ is defined as

$$
\Omega(\boldsymbol{\theta}) = | | \boldsymbol{w} | |_{1} = \sum_{i} | w_{i} |,\tag{7.18}
$$

that is, as the sum of absolute values of the individual parameters. $^{2}$ We will now discuss the effect of $L^{1}$ regularization on the simple linear regression model, with no bias parameter, that we studied in our analysis of $L^{2}$ regularization. In particular, we are interested in delineating the differences between $L^{1}$ and $L^{2}$ forms of regularization. As with $L^{2}$ weight decay, $L^{1}$ weight decay controls the strength of the regularization by scaling the penalty $\Omega$ using a positive hyperparameter $\alpha$ . Thus, the regularized objective function $\tilde{J}(\boldsymbol{w};\boldsymbol{X},\boldsymbol{y})$ is given by

$$
\tilde{J}(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}) = \alpha | | \boldsymbol{w} | |_{1} + J(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}),\tag{7.19}
$$

with the corresponding gradient (actually, sub gradient)

$$
\nabla_{\boldsymbol{w}} \tilde{J}(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}) = \alpha \mathrm{sign}(\boldsymbol{w}) + \nabla_{\boldsymbol{w}} J(\boldsymbol{X}, \boldsymbol{y}; \boldsymbol{w}),\tag{7.20}
$$

where $\text{sign}(\boldsymbol{w})$ is simply the sign of w applied element-wise.

By inspecting equation 7.20, we can see immediately that the effect of $L^1$ regularization is quite different from that of $L^2$ regularization. Specifically, we can see that the regularization contribution to the gradient no longer scales linearly with each $w_i$ : instead it is a constant factor with a sign equal to $\text{sign}(w_i)$ . One consequence of this form of the gradient is that we will not necessarily see clean algebraic solutions to quadratic approximations of $J(X, y; w)$ as we did for $L^2$ regularization.

Our simple linear model has a quadratic cost function that we can represent via its Taylor series. Alternately, we could imagine that this is a truncated Taylor series approximating the cost function of a more sophisticated model. The gradient in this setting is given by

$$
\nabla_{\boldsymbol{w}} \hat{J}(\boldsymbol{w}) = \boldsymbol{H}(\boldsymbol{w} - \boldsymbol{w}^{*}),\tag{7.21}
$$

where, again. H is the Hessian matrix of J with respect to w evaluated at $w^{*}$ .

Because the $L^{1}$ penalty does not admit clean algebraic expressions in the case of a fully general Hessian, we will also make the further simplifying assumption that the Hessian is diagonal. $\boldsymbol{H} = \text{diag}([H_{1,1}, \ldots, H_{n,n}])$ , where each $H_{i,i} > 0$ . This assumption holds if the data for the linear regression problem has been preprocessed to remove all correlation between the input features, which may be accomplished using PCA.

Our quadratic approximation of the $L^{1}$ regularized objective function decomposes into a sum over the parameters:

$$
\hat{J}(\boldsymbol{w}; \boldsymbol{X}, \boldsymbol{y}) = J(\boldsymbol{w}^{*}; \boldsymbol{X}, \boldsymbol{y}) + \sum_{i} \left[\frac{1}{2} H_{i, i}(\boldsymbol{w}_{i} - \boldsymbol{w}_{i}^{*})^{2} + \alpha | w_{i} | \right].\tag{7.22}
$$

The problem of minimizing this approximate cost function has an analytical solution (for each dimension i), with the following form:

$$
w_{i} = \operatorname{sign}(w_{i}^{*}) \max \left\{| w_{i}^{*} | - \frac{\alpha}{H_{i, i}}, 0 \right\}.\tag{7.23}
$$

Consider the situation where $w_{i}^{*} > 0$ for all i. There are two possible outcomes:

1. The case where $w_{i}^{*} \leq \frac{\alpha}{H_{i,i}}$ . Here the optimal value of $w_{i}$ under the regularized objective is simply $w_{i} = 0$ . This occurs because the contribution of $J(\boldsymbol{w};\boldsymbol{X},\boldsymbol{y})$ to the regularized objective $\tilde{J}(\boldsymbol{w};\boldsymbol{X},\boldsymbol{y})$ is overwhelmed—in direction $i$ —by the $L^1$ regularization, which pushes the value of $w_{i}$ to zero.

2. The case where $w_{i}^{*} > \frac{\alpha}{H_{i,i}}$ . In this case, the regularization does not move the optimal value of $w_{i}$ to zero but instead just shifts it in that direction by a distance equal to $\frac{\alpha}{H_{i,i}}$ .

A similar process happens when $w_{i}^{*} < 0$ , but with the $L^1$ penalty making $w_{i}$ less negative by $\frac{\alpha}{H_{i,i}}$ , or 0.

In comparison to $L^{2}$ regularization, $L^{1}$ regularization results in a solution that is more sparse. Sparsity in this context refers to the fact that some parameters have an optimal value of zero. The sparsity of $L^{1}$ regularization is a qualitatively different behavior than arises with $L^{2}$ regularization. Equation 7.13 gave the solution $\tilde{w}$ for $L^{2}$ regularization. If we revisit that equation using the assumption of a diagonal and positive definite Hessian H that we introduced for our analysis of $L^{1}$ regularization, we find that $\tilde{w}_{i} = \frac{H_{i,i}}{H_{i,i} + \alpha} w_{i}^{*}$ . If $w_{i}^{*}$ was nonzero, then $\tilde{w}_{i}$ remains nonzero. This demonstrates that $L^{2}$ regularization does not cause the parameters to become sparse, while $L^{1}$ regularization may do so for large enough $\alpha$ .

The sparsity property induced by $L^{1}$ regularization has been used extensively as a feature selection mechanism. Feature selection simplifies a machine learning problem by choosing which subset of the available features should be used. In particular, the well known LASSO (Tibshirani, 1995) (least absolute shrinkage and selection operator) model integrates an $L^{1}$ penalty with a linear model and a least-squares cost function. The $L^{1}$ penalty causes a subset of the weights to become zero, suggesting that the corresponding features may safely be discarded.

In section 5.6.1, we saw that many regularization strategies can be interpreted as MAP Bayesian inference, and that in particular, $L^{2}$ regularization is equivalent to MAP Bayesian inference with a Gaussian prior on the weights. For $L^{1}$ regularization, the penalty $\alpha\Omega(\boldsymbol{w}) = \alpha \sum_{i} |w_{i}|$ used to regularize a cost function is equivalent to the log-prior term that is maximized by MAP Bayesian inference when the prior is an isotropic Laplace distribution (equation 3.26) over $w \in \mathbb{R}^{n}$ :

$$
\log p(\boldsymbol{w}) = \sum_{i} \log \operatorname{Laplace}(w_{i}; 0, \frac{1}{\alpha}) = - \alpha | | \boldsymbol{w} | |_{1} + n \log \alpha - n \log 2.\tag{7.24}
$$

From the point of view of learning via maximization with respect to w, we can ignore the $\log \alpha - \log 2$ terms because they do not depend on w.

## 7.2 Norm Penalties as Constrained Optimization

Consider the cost function regularized by a parameter norm penalty:

$$
\tilde{J}(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) = J(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) + \alpha \Omega(\boldsymbol{\theta}).\tag{7.25}
$$

Recall from section 4.4 that we can minimize a function subject to constraints by constructing a generalized Lagrange function, consisting of the original objective function plus a set of penalties. Each penalty is a product between a coefficient, called a Karush Kuhn-Tucker (KKT) multiplier, and a function representing whether the constraint is satisfied. If we wanted to constrain $\Omega(\boldsymbol{\theta})$ to be less than some constant $k$ , we could construct a generalized Lagrange function

$$
\mathcal{L}(\boldsymbol{\theta}, \alpha; \boldsymbol{X}, \boldsymbol{y}) = J(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) + \alpha(\Omega(\boldsymbol{\theta}) - k).\tag{7.26}
$$

The solution to the constrained problem is given by

$$
\boldsymbol{\theta}^{*} = \underset{\boldsymbol{\theta}}{\arg \min} \underset{\alpha, \alpha \geq 0}{\max} \mathcal{L}(\boldsymbol{\theta}, \alpha).\tag{7.27}
$$

As described in section 4.4, solving this problem requires modifying both $\pmb{\theta}$ and $\alpha$ . Section 4.5 provides a worked example of linear regression with an $L^2$ constraint. Many different procedures are possible—some may use gradient descent, while others may use analytical solutions for where the gradient is zero—but in all procedures $\alpha$ must increase whenever $\Omega(\pmb{\theta}) > k$ and decrease whenever $\Omega(\pmb{\theta}) < k$ . All positive $\alpha$ encourage $\Omega(\pmb{\theta})$ to shrink. The optimal value $\alpha^*$ will encourage $\Omega(\pmb{\theta})$ to shrink, but not so strongly to make $\Omega(\pmb{\theta})$ become less than $k$ .

To gain some insight into the effect of the constraint, we can fix $\alpha^{*}$ and view the problem as just a function of $\theta$ :

$$
\boldsymbol{\theta}^{*} = \underset{\boldsymbol{\theta}}{\arg \min} \mathcal{L}(\boldsymbol{\theta}, \alpha^{*}) = \underset{\boldsymbol{\theta}}{\arg \min} J(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) + \alpha^{*} \Omega(\boldsymbol{\theta}).\tag{7.28}
$$

This is exactly the same as the regularized training problem of minimizing $\tilde{J}$ . We can thus think of a parameter norm penalty as imposing a constraint on the weights. If $\Omega$ is the $L^{2}$ norm, then the weights are constrained to lie in an $L^{2}$ ball. If $\Omega$ is the $L^{1}$ norm, then the weights are constrained to lie in a region of limited

$L^{1}$ norm. Usually we do not know the size of the constraint region that we impose by using weight decay with coefficient $\alpha^{*}$ because the value of $\alpha^{*}$ does not directly tell us the value of k. In principle, one can solve for k, but the relationship between k and $\alpha^{*}$ depends on the form of J. While we do not know the exact size of the constraint region, we can control it roughly by increasing or decreasing $\alpha$ in order to grow or shrink the constraint region. Larger $\alpha$ will result in a smaller constraint region. Smaller $\alpha$ will result in a larger constraint region.

Sometimes we may wish to use explicit constraints rather than penalties. As described in section 4.4, we can modify algorithms such as stochastic gradient descent to take a step downhill on $J(\boldsymbol{\theta})$ and then project $\theta$ back to the nearest point that satisfies $\Omega(\boldsymbol{\theta}) < k$ . This can be useful if we have an idea of what value of k is appropriate and do not want to spend time searching for the value of $\alpha$ that corresponds to this k.

Another reason to use explicit constraints and reprojection rather than enforcing constraints with penalties is that penalties can cause nonconvex optimization procedures to get stuck in local minima corresponding to small $\theta$ . When training neural networks, this usually manifests as neural networks that train with several “dead units.” These are units that do not contribute much to the behavior of the function learned by the network because the weights going into or out of them are all very small. When training with a penalty on the norm of the weights, these configurations can be locally optimal, even if it is possible to significantly reduce J by making the weights larger. Explicit constraints implemented by reprojection can work much better in these cases because they do not encourage the weights to approach the origin. Explicit constraints implemented by reprojection have an effect only when the weights become large and attempt to leave the constraint region.

Finally, explicit constraints with reprojection can be useful because they impose some stability on the optimization procedure. When using high learning rates, it is possible to encounter a positive feedback loop in which large weights induce large gradients, which then induce a large update to the weights. If these updates consistently increase the size of the weights, then $\theta$ rapidly moves away from the origin until numerical overflow occurs. Explicit constraints with reprojection prevent this feedback loop from continuing to increase the magnitude of the weights without bound. Hinton et al. (2012c) recommend using constraints combined with a high learning rate to enable rapid exploration of parameter space while maintaining some stability.

In particular, Hinton et al. (2012c) recommend a strategy introduced by Srebro and Shraibman (2005): constraining the norm of each column of the weight matrix of a neural net layer, rather than constraining the Frobenius norm of the entire weight matrix. Constraining the norm of each column separately prevents any one hidden unit from having very large weights. If we converted this constraint into a penalty in a Lagrange function, it would be similar to $L^{2}$ weight decay but with a separate KKT multiplier for the weights of each hidden unit. Each of these KKT multipliers would be dynamically updated separately to make each hidden unit obey the constraint. In practice, column norm limitation is always implemented as an explicit constraint with reprojection.

## 7.3 Regularization and Under-Constrained Problems

In some cases, regularization is necessary for machine learning problems to be properly defined. Many linear models in machine learning, including linear regression and PCA, depend on inverting the matrix $X^{\top}X$ . This is not possible when $X^{\top}X$ is singular. This matrix can be singular whenever the data-generating distribution truly has no variance in some direction, or when no variance is observed in some direction because there are fewer examples (rows of X) than input features (columns of X). In this case, many forms of regularization correspond to inverting $X^{\top}X + \alpha I$ instead. This regularized matrix is guaranteed to be invertible.

These linear problems have closed form solutions when the relevant matrix is invertible. It is also possible for a problem with no closed form solution to be underdetermined. An example is logistic regression applied to a problem where the classes are linearly separable. If a weight vector w is able to achieve perfect classification, then 2w will also achieve perfect classification and higher likelihood. An iterative optimization procedure like stochastic gradient descent will continually increase the magnitude of w and, in theory, will never halt. In practice, a numerical implementation of gradient descent will eventually reach sufficiently large weights to cause numerical overflow, at which point its behavior will depend on how the programmer has decided to handle values that are not real numbers.

Most forms of regularization are able to guarantee the convergence of iterative methods applied to underdetermined problems. For example, weight decay will cause gradient descent to quit increasing the magnitude of the weights when the slope of the likelihood is equal to the weight decay coefficient.

The idea of using regularization to solve underdetermined problems extends beyond machine learning. The same idea is useful for several basic linear algebra problems.

As we saw in section 2.9, we can solve underdetermined linear equations using the Moore-Penrose pseudoinverse. Recall that one definition of the pseudoinverse $\pmb{X}^{+}$ of a matrix $\pmb{X}$ is

$$
\boldsymbol{X}^{+} = \lim_{\alpha \searrow 0}(\boldsymbol{X}^{\top} \boldsymbol{X} + \alpha \boldsymbol{I})^{- 1} \boldsymbol{X}^{\top}.\tag{7.29}
$$

We can now recognize equation 7.29 as performing linear regression with weight decay. Specifically, equation 7.29 is the limit of equation 7.17 as the regularization coefficient shrinks to zero. We can thus interpret the pseudoinverse as stabilizing underdetermined problems using regularization.

## 7.4 Dataset Augmentation

The best way to make a machine learning model generalize better is to train it on more data. Of course, in practice, the amount of data we have is limited. One way to get around this problem is to create fake data and add it to the training set. For some machine learning tasks, it is reasonably straightforward to create new fake data.

This approach is easiest for classification. A classifier needs to take a complicated, high-dimensional input x and summarize it with a single category identity y. This means that the main task facing a classifier is to be invariant to a wide variety of transformations. We can generate new $(x,y)$ pairs easily just by transforming the x inputs in our training set.

This approach is not as readily applicable to many other tasks. For example, it is difficult to generate new fake data for a density estimation task unless we have already solved the density estimation problem.

Dataset augmentation has been a particularly effective technique for a specific classification problem: object recognition. Images are high dimensional and include an enormous range of factors of variation, many of which can be easily simulated. Operations like translating the training images a few pixels in each direction can often greatly improve generalization, even if the model has already been designed to be partially translation invariant by using the convolution and pooling techniques described in chapter 9. Many other operations, such as rotating the image or scaling the image, have also proved quite effective.

One must be careful not to apply transformations that would change the correct class. For example, optical character recognition tasks require recognizing the difference between “b” and “d” and the difference between “6” and “9”, so horizontal flips and $180^{\circ}$ rotations are not appropriate ways of augmenting datasets for these tasks.

There are also transformations that we would like our classifiers to be invariant to but that are not easy to perform. For example, out-of-plane rotation cannot be implemented as a simple geometric operation on the input pixels.

Dataset augmentation is effective for speech recognition tasks as well (Jaitly and Hinton, 2013).

Injecting noise in the input to a neural network (Sietsma and Dow, 1991) can also be seen as a form of data augmentation. For many classification and even some regression tasks, the task should still be possible to solve even if small random noise is added to the input. Neural networks prove not to be very robust to noise, however (Tang and Eliasmith, 2010). One way to improve the robustness of neural networks is simply to train them with random noise applied to their inputs. Input noise injection is part of some unsupervised learning algorithms, such as the denoising autoencoder (Vincent et al., 2008). Noise injection also works when the noise is applied to the hidden units, which can be seen as doing dataset augmentation at multiple levels of abstraction. Poole et al. (2014) recently showed that this approach can be highly effective provided that the magnitude of the noise is carefully tuned. Dropout, a powerful regularization strategy that will be described in section 7.12, can be seen as a process of constructing new inputs by multiplying by noise.

When comparing machine learning benchmark results, taking the effect of dataset augmentation into account is important. Often, hand-designed dataset augmentation schemes can dramatically reduce the generalization error of a machine learning technique. To compare the performance of one machine learning algorithm to another, it is necessary to perform controlled experiments. When comparing machine learning algorithm A and machine learning algorithm B, make sure that both algorithms are evaluated using the same hand-designed dataset augmentation schemes. Suppose that algorithm A performs poorly with no dataset augmentation, and algorithm B performs well when combined with numerous synthetic transformations of the input. In such a case the synthetic transformations likely caused the improved performance, rather than the use of machine learning algorithm B. Sometimes deciding whether an experiment has been properly controlled requires subjective judgment. For example, machine learning algorithms that inject noise into the input are performing a form of dataset augmentation. Usually, operations that are generally applicable (such as adding Gaussian noise to the input) are considered part of the machine learning algorithm, while operations that are specific to one application domain (such as randomly cropping an image) are considered to be separate preprocessing steps.

## 7.5 Noise Robustness

Section 7.4 has motivated the use of noise applied to the inputs as a dataset augmentation strategy. For some models, the addition of noise with infinitesimal variance at the input of the model is equivalent to imposing a penalty on the norm of the weights (Bishop, 1995a,b). In the general case, it is important to remember that noise injection can be much more powerful than simply shrinking the parameters, especially when the noise is added to the hidden units. Noise applied to the hidden units is such an important topic that it merits its own separate discussion; the dropout algorithm described in section 7.12 is the main development of that approach.

Another way that noise has been used in the service of regularizing models is by adding it to the weights. This technique has been used primarily in the context of recurrent neural networks (Jim et al., 1996; Graves, 2011). This can be interpreted as a stochastic implementation of Bayesian inference over the weights. The Bayesian treatment of learning would consider the model weights to be uncertain and representable via a probability distribution that reflects this uncertainty. Adding noise to the weights is a practical, stochastic way to reflect this uncertainty.

Noise applied to the weights can also be interpreted as equivalent (under some assumptions) to a more traditional form of regularization, encouraging stability of the function to be learned. Consider the regression setting, where we wish to train a function $\hat{y}(\boldsymbol{x})$ that maps a set of features x to a scalar using the least-squares cost function between the model predictions $\hat{y}(\boldsymbol{x})$ and the true values y:

$$
J = \mathbb{E}_{p(x, y)} \left[(\hat{y}(\boldsymbol{x}) - y)^{2} \right].\tag{7.30}
$$

The training set consists of $m$ labeled examples $\{(x^{(1)},y^{(1)}),\ldots,(x^{(m)},y^{(m)})\}$ .

We now assume that with each input presentation we also include a random perturbation $\epsilon_{W} \sim \mathcal{N}(\epsilon; \mathbf{0}, \eta I)$ of the network weights. Let us imagine that we have a standard l-layer MLP. We denote the perturbed model as $\hat{y}_{\epsilon_{W}}(\boldsymbol{x})$ . Despite the injection of noise, we are still interested in minimizing the squared error of the output of the network. The objective function thus becomes

$$
\tilde{J}_{\pmb{W}} = \mathbb{E}_{p(\pmb{x}, y, \epsilon_{\pmb{W}})} \left[\left(\hat{y}_{\epsilon_{\pmb{W}}}(\pmb{x}) - y\right)^{2} \right]\tag{7.31}
$$

$$
= \mathbb{E}_{p(\boldsymbol{x}, y, \epsilon_{\boldsymbol{W}})} \left[\hat{y}_{\epsilon_{\boldsymbol{W}}}^{2}(\boldsymbol{x}) - 2y \hat{y}_{\epsilon_{\boldsymbol{W}}}(\boldsymbol{x}) + y^{2} \right].\tag{7.32}
$$

For small $\eta$ , the minimization of $J$ with added weight noise (with covariance $\eta I$ ) is equivalent to minimization of $J$ with an additional regularization term: $\eta \mathbb{E}_{p(x,y)}\left[\| \nabla_{W}\hat{y}(\pmb{x})\|^{2}\right]$ . This form of regularization encourages the parameters to go to regions of parameter space where small perturbations of the weights have a relatively small influence on the output. In other words, it pushes the model into regions where the model is relatively insensitive to small variations in the weights, finding points that are not merely minima, but minima surrounded by flat regions (Hochreiter and Schmidhuber, 1995). In the simplified case of linear regression (where, for instance, $\hat{y}(\pmb{x}) = \pmb{w}^{\top}\pmb{x} + b$ ), this regularization term collapses into $\eta \mathbb{E}_{p(\pmb{x})}\left[\| \pmb{x}\|^2\right]$ , which is not a function of parameters and therefore does not contribute to the gradient of $\tilde{J}_{\pmb{W}}$ with respect to the model parameters.

## 7.5.1 Injecting Noise at the Output Targets

Most datasets have some number of mistakes in the y labels. It can be harmful to maximize $\log p(y \mid x)$ when y is a mistake. One way to prevent this is to explicitly model the noise on the labels. For example, we can assume that for some small constant $\epsilon$ , the training set label y is correct with probability $1 - \epsilon$ , and otherwise any of the other possible labels might be correct. This assumption is easy to incorporate into the cost function analytically, rather than by explicitly drawing noise samples. For example, label smoothing regularizes a model based on a softmax with k output values by replacing the hard 0 and 1 classification targets with targets of $\frac{\epsilon}{k-1}$ and $1 - \epsilon$ , respectively. The standard cross-entropy loss may then be used with these soft targets. Maximum likelihood learning with a softmax classifier and hard targets may actually never converge—the softmax can never predict a probability of exactly 0 or exactly 1, so it will continue to learn larger and larger weights, making more extreme predictions forever. It is possible to prevent this scenario using other regularization strategies like weight decay. Label smoothing has the advantage of preventing the pursuit of hard probabilities without discouraging correct classification. This strategy has been used since the 1980s and continues to be featured prominently in modern neural networks (Szegedy et al., 2015).

## 7.6 Semi-Supervised Learning

In the paradigm of semi-supervised learning, both unlabeled examples from $P(\mathbf{x})$ and labeled examples from $P(\mathbf{x},\mathbf{y})$ are used to estimate $P(\mathbf{y}|\mathbf{x})$ or predict $\mathbf{y}$ from $\mathbf{x}$ .

In the context of deep learning, semi-supervised learning usually refers to learning a representation $\boldsymbol{h} = f(\boldsymbol{x})$ . The goal is to learn a representation so that examples from the same class have similar representations. Unsupervised learning can provide useful clues for how to group examples in representation space. Examples that cluster tightly in the input space should be mapped to similar representations. A linear classifier in the new space may achieve better generalization in many cases (Belkin and Niyogi, 2002; Chapelle et al., 2003). A long-standing variant of this approach is the application of principal components analysis as a preprocessing step before applying a classifier (on the projected data).

Instead of having separate unsupervised and supervised components in the model, one can construct models in which a generative model of either $P(\mathbf{x})$ or $P(\mathbf{x},\mathbf{y})$ shares parameters with a discriminative model of $P(\mathbf{y} \mid \mathbf{x})$ . One can then trade off the supervised criterion $-\log P(\mathbf{y} \mid \mathbf{x})$ with the unsupervised or generative one (such as $-\log P(\mathbf{x})$ or $-\log P(\mathbf{x},\mathbf{y})$ ). The generative criterion then expresses a particular form of prior belief about the solution to the supervised learning problem (Lasserre et al., 2006), namely that the structure of $P(\mathbf{x})$ is connected to the structure of $P(\mathbf{y} \mid \mathbf{x})$ in a way that is captured by the shared parametrization. By controlling how much of the generative criterion is included in the total criterion, one can find a better trade-off than with a purely generative or a purely discriminative training criterion (Lasserre et al., 2006; Larochelle and Bengio, 2008).

Salakhutdinov and Hinton (2008) describe a method for learning the kernel function of a kernel machine used for regression, in which the usage of unlabeled examples for modeling $P(\mathbf{x})$ improves $P(\mathbf{y} \mid \mathbf{x})$ quite significantly.

See Chapelle et al. (2006) for more information about semi-supervised learning.

## 7.7 Multitask Learning

Multitask learning (Caruana, 1993) is a way to improve generalization by pooling the examples (which can be seen as soft constraints imposed on the parameters) arising out of several tasks. In the same way that additional training examples put more pressure on the parameters of the model toward values that generalize well, when part of a model is shared across tasks, that part of the model is more constrained toward good values (assuming the sharing is justified), often yielding better generalization.

Figure 7.2 illustrates a very common form of multitask learning, in which different supervised tasks (predicting $\mathbf{y}^{(i)}$ given x) share the same input x, as well as some intermediate-level representation $\boldsymbol{h}^{(\text{shared})}$ , capturing a common pool of factors. The model can generally be divided into two kinds of parts and associated parameters:

![Figure 7.2](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/2fc2b71374ed202bf1936405731acf82217c6f9d52f4514bc49ae18a84f741db.jpg)  
Figure 7.2: Multitask learning can be cast in several ways in deep learning frameworks, and this figure illustrates the common situation where the tasks share a common input but involve different target random variables. The lower layers of a deep network (whether it is supervised and feedforward or includes a generative component with downward arrows) can be shared across such tasks, while task-specific parameters (associated respectively with the weights into and from $\boldsymbol{h}^{(1)}$ and $\boldsymbol{h}^{(2)}$ ) can be learned on top of those yielding a shared representation $\boldsymbol{h}^{(\text{shared})}$ . The underlying assumption is that there exists a common pool of factors that explain the variations in the input x, while each task is associated with a subset of these factors. In this example, it is additionally assumed that top-level hidden units $\boldsymbol{h}^{(1)}$ and $\boldsymbol{h}^{(2)}$ are specialized to each task (respectively predicting $\mathbf{y}^{(1)}$ and $\mathbf{y}^{(2)}$ ), while some intermediate-level representation $\boldsymbol{h}^{(\text{shared})}$ is shared across all tasks. In the unsupervised learning context, it makes sense for some of the top-level factors to be associated with none of the output tasks ( $\boldsymbol{h}^{(3)}$ ): these are the factors that explain some of the input variations but are not relevant for predicting $\mathbf{y}^{(1)}$ or $\mathbf{y}^{(2)}$ .

1. Task-specific parameters (which only benefit from the examples of their task to achieve good generalization). These are the upper layers of the neural network in figure 7.2.

2. Generic parameters, shared across all the tasks (which benefit from the pooled data of all the tasks). These are the lower layers of the neural network in figure 7.2.

Improved generalization and generalization error bounds (Baxter, 1995) can be achieved because of the shared parameters, for which statistical strength can be greatly improved (in proportion with the increased number of examples for the shared parameters, compared to the scenario of single-task models). Of course this will happen only if some assumptions about the statistical relationship between the different tasks are valid, meaning that there is something shared across some of the tasks.

From the point of view of deep learning, the underlying prior belief is the following: among the factors that explain the variations observed in the data associated with the different tasks, some are shared across two or more tasks.

## 7.8 Early Stopping

When training large models with sufficient representational capacity to overfit the task, we often observe that training error decreases steadily over time, but validation set error begins to rise again. See figure 7.3 for an example of this behavior, which occurs reliably.

This means we can obtain a model with better validation set error (and thus, hopefully better test set error) by returning to the parameter setting at the point in time with the lowest validation set error. Every time the error on the validation set improves, we store a copy of the model parameters. When the training algorithm terminates, we return these parameters, rather than the latest parameters. The algorithm terminates when no parameters have improved over the best recorded validation error for some pre-specified number of iterations. This procedure is specified more formally in algorithm 7.1.

![Figure 7.3](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/e085a549b03a8dbce75e0f390c634147926bb13a14cbcf1be64b8a11b90ffd35.jpg)  
Figure 7.3: Learning curves showing how the negative log-likelihood loss changes over time (indicated as number of training iterations over the dataset, or epochs). In this example, we train a maxout network on MNIST. Observe that the training objective decreases consistently over time, but the validation set average loss eventually begins to increase again, forming an asymmetric U-shaped curve.

This strategy is known as early stopping. It is probably the most commonly used form of regularization in deep learning. Its popularity is due to both its effectiveness and its simplicity.

One way to think of early stopping is as a very efficient hyperparameter selection algorithm. In this view, the number of training steps is just another hyperparameter. We can see in figure 7.3 that this hyperparameter has a U-shaped validation set performance curve. Most hyperparameters that control model capacity have such a

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 7.1 The early stopping meta-algorithm for determining the best amount of time to train. This meta-algorithm is a general strategy that works well with a variety of training algorithms and ways of quantifying error on the validation set.

Let n be the number of steps between evaluations.
Let p be the “patience,” the number of times to observe worsening validation set error before giving up.
Let  $\theta_{o}$  be the initial parameters.
 $\theta \leftarrow \theta_{o}$ $i \leftarrow 0$ $j \leftarrow 0$ $v \leftarrow \infty$ $\theta^{*} \leftarrow \theta$ $i^{*} \leftarrow i$ 
while j &lt; p do
    Update  $\theta$  by running the training algorithm for n steps.
    $i \leftarrow i + n$ $v' \leftarrow ValidationSetError(\theta)$ 
    if  $v' &lt; v$  then
    $j \leftarrow 0$ $\theta^{*} \leftarrow \theta$ $i^{*} \leftarrow i$ $v \leftarrow v'$ 
    else
    $j \leftarrow j + 1$ 
    end if
end while
Best parameters are  $\theta^{*}$ , best number of training steps is  $i^{*}$ .
</div>

U-shaped validation set performance curve, as illustrated in figure 5.3. In the case of early stopping, we are controlling the effective capacity of the model by determining how many steps it can take to fit the training set. Most hyperparameters must be chosen using an expensive guess and check process, where we set a hyperparameter at the start of training, then run training for several steps to see its effect. The “training time” hyperparameter is unique in that by definition, a single run of training tries out many values of the hyperparameter. The only significant cost to choosing this hyperparameter automatically via early stopping is running the validation set evaluation periodically during training. Ideally, this is done in parallel to the training process on a separate machine, separate CPU, or separate GPU from the main training process. If such resources are not available, then the cost of these periodic evaluations may be reduced by using a validation set that is small compared to the training set or by evaluating the validation set error less frequently and obtaining a lower-resolution estimate of the optimal training time.

An additional cost to early stopping is the need to maintain a copy of the best parameters. This cost is generally negligible, because it is acceptable to store these parameters in a slower and larger form of memory (for example, training in GPU memory, but storing the optimal parameters in host memory or on a disk drive). Since the best parameters are written to infrequently and never read during training, these occasional slow writes have little effect on the total training time.

Early stopping is an unobtrusive form of regularization, in that it requires almost no change in the underlying training procedure, the objective function, or the set of allowable parameter values. This means that it is easy to use early stopping without damaging the learning dynamics. This is in contrast to weight decay, where one must be careful not to use too much weight decay and trap the network in a bad local minimum corresponding to a solution with pathologically small weights.

Early stopping may be used either alone or in conjunction with other regularization strategies. Even when using regularization strategies that modify the objective function to encourage better generalization, it is rare for the best generalization to occur at a local minimum of the training objective.

Early stopping requires a validation set, which means some training data is not fed to the model. To best exploit this extra data, one can perform extra training after the initial training with early stopping has completed. In the second, extra training step, all the training data is included. There are two basic strategies one can use for this second training procedure.

One strategy (algorithm 7.2) is to initialize the model again and retrain on all the data. In this second training pass, we train for the same number of steps as the early stopping procedure determined was optimal in the first pass. There are some subtleties associated with this procedure. For example, there is not a good way of knowing whether to retrain for the same number of parameter updates or the same number of passes through the dataset. On the second round of training, each pass through the dataset will require more parameter updates because the training set is bigger.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 7.2 A meta-algorithm for using early stopping to determine how long to train, then retraining on all the data.

Let $X^{(\text{train})}$ and $y^{(\text{train})}$ be the training set.
Split $X^{(\text{train})}$ and $y^{(\text{train})}$ into $(X^{(\text{subtrain})}, X^{(\text{valid})})$ and $(y^{(\text{subtrain})}, y^{(\text{valid})})$ respectively.
Run early stopping (algorithm 7.1) starting from random $\theta$ using $X^{(\text{subtrain})}$ and $y^{(\text{subtrain})}$ for training data and $X^{(\text{valid})}$ and $y^{(\text{valid})}$ for validation data. This returns $i^*$, the optimal number of steps.
Set $\theta$ to random values again.
Train on $X^{(\text{train})}$ and $y^{(\text{train})}$ for $i^*$ steps.
</div>

Another strategy for using all the data is to keep the parameters obtained from the first round of training and then continue training, but now using all the data. At this stage, we now no longer have a guide for when to stop in terms of a number of steps. Instead, we can monitor the average loss function on the validation set and continue training until it falls below the value of the training set objective at which the early stopping procedure halted. This strategy avoids the high cost of retraining the model from scratch but is not as well behaved. For example, the objective on the validation set may not ever reach the target value, so this strategy is not even guaranteed to terminate. This procedure is presented more formally in algorithm 7.3.

Early stopping is also useful because it reduces the computational cost of the training procedure. Besides the obvious reduction in cost due to limiting the number of training iterations, it also has the benefit of providing regularization without requiring the addition of penalty terms to the cost function or the computation of the gradients of such additional terms.

How early stopping acts as a regularizer: So far we have stated that early stopping is a regularization strategy, but we have supported this claim only by showing learning curves where the validation set error has a U-shaped curve. What is the actual mechanism by which early stopping regularizes the model?

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 7.3 Meta-algorithm using early stopping to determine at what objective value we start to overfit, then continue training until that value is reached.

Let $X^{(\text{train})}$ and $y^{(\text{train})}$ be the training set.
Split $X^{(\text{train})}$ and $y^{(\text{train})}$ into $(X^{(\text{subtrain})}, X^{(\text{valid})})$ and $(y^{(\text{subtrain})}, y^{(\text{valid})})$ respectively.
Run early stopping (algorithm 7.1) starting from random $\theta$ using $X^{(\text{subtrain})}$ and $y^{(\text{subtrain})}$ for training data and $X^{(\text{valid})}$ and $y^{(\text{valid})}$ for validation data. This updates $\theta$.
$\epsilon \leftarrow J(\theta, X^{(\text{subtrain})}, y^{(\text{subtrain})})$
while $J(\theta, X^{(\text{valid})}, y^{(\text{valid})}) &gt; \epsilon$ do
Train on $X^{(\text{train})}$ and $y^{(\text{train})}$ for n steps.
end while
</div>

Bishop (1995a) and Sjöberg and Ljung (1995) argued that early stopping has the effect of restricting the optimization procedure to a relatively small volume of parameter space in the neighborhood of the initial parameter value $\theta_{o}$ , as illustrated in figure 7.4. More specifically, imagine taking $\tau$ optimization steps (corresponding to $\tau$ training iterations) and with learning rate $\epsilon$ . We can view the product $\epsilon\tau$ as a measure of effective capacity. Assuming the gradient is bounded, restricting both the number of iterations and the learning rate limits the volume of parameter space reachable from $\theta_{o}$ . In this sense, $\epsilon\tau$ behaves as if it were the reciprocal of the coefficient used for weight decay.

Indeed, we can show how in the case of a simple linear model with a quadratic error function and simple gradient descent early stopping is equivalent to $L^{2}$ regularization.

To compare with classical $L^{2}$ regularization, we examine a simple setting where the only parameters are linear weights ( $\theta = w$ ). We can model the cost function J with a quadratic approximation in the neighborhood of the empirically optimal value of the weights $w^{*}$ :

$$
\hat{J}(\boldsymbol{\theta}) = J \left(\boldsymbol{w}^{*}\right) + \frac{1}{2} \left(\boldsymbol{w} - \boldsymbol{w}^{*}\right)^{\top} \boldsymbol{H} \left(\boldsymbol{w} - \boldsymbol{w}^{*}\right),\tag{7.33}
$$

where H is the Hessian matrix of J with respect to w evaluated at $w^{*}$ . Given the assumption that $w^{*}$ is a minimum of $J(\boldsymbol{w})$ , we know that H is positive semidefinite. Under a local Taylor series approximation, the gradient is given by

$$
\nabla_{\boldsymbol{w}} \hat{J}(\boldsymbol{w}) = \boldsymbol{H}(\boldsymbol{w} - \boldsymbol{w}^{*}).\tag{7.34}
$$

![Figure 7.4](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/9ae3bf7102fd94817f6d2c09657188a6b4c783d92c0703b8b0694818276c5563.jpg)  
Figure 7.4: An illustration of the effect of early stopping. (Left)The solid contour lines indicate the contours of the negative log-likelihood. The dashed line indicates the trajectory taken by SGD beginning from the origin. Rather than stopping at the point $\pmb{w}^*$ that minimizes the cost, early stopping results in the trajectory stopping at an earlier point $\tilde{\pmb{w}}$ . (Right)An illustration of the effect of $L^2$ regularization for comparison. The dashed circles indicate the contours of the $L^2$ penalty, which causes the minimum of the total cost to lie nearer the origin than the minimum of the unregularized cost.

We are going to study the trajectory followed by the parameter vector during training. For simplicity, let us set the initial parameter vector to the origin, $^{3}$ $w^{(0)} = 0$ . Let us study the approximate behavior of gradient descent on J by analyzing gradient descent on $\hat{J}$ :

$$
\pmb{w}^{(\tau)} = \pmb{w}^{(\tau - 1)} - \epsilon \nabla_{\pmb{w}} \hat{J}(\pmb{w}^{(\tau - 1)})\tag{7.35}
$$

$$
= \boldsymbol{w}^{(\tau - 1)} - \epsilon \boldsymbol{H}(\boldsymbol{w}^{(\tau - 1)} - \boldsymbol{w}^{*}),\tag{7.36}
$$

$$
\boldsymbol{w}^{(\tau)} - \boldsymbol{w}^{*} =(\boldsymbol{I} - \epsilon \boldsymbol{H})(\boldsymbol{w}^{(\tau - 1)} - \boldsymbol{w}^{*}).\tag{7.37}
$$

Let us now rewrite this expression in the space of the eigenvectors of H, exploiting the eigendecomposition of $H: H = Q \Lambda Q^{\top}$ , where $\Lambda$ is a diagonal matrix and Q is an orthonormal basis of eigenvectors.

$$
\boldsymbol{w}^{(\tau)} - \boldsymbol{w}^{*} =(\boldsymbol{I} - \epsilon \boldsymbol{Q} \boldsymbol{\Lambda} \boldsymbol{Q}^{\top})(\boldsymbol{w}^{(\tau - 1)} - \boldsymbol{w}^{*})\tag{7.38}
$$

$$
\boldsymbol{Q}^{\top} \left(\boldsymbol{w}^{(\tau)} - \boldsymbol{w}^{*}\right) =(\boldsymbol{I} - \epsilon \boldsymbol{\Lambda}) \boldsymbol{Q}^{\top} \left(\boldsymbol{w}^{(\tau - 1)} - \boldsymbol{w}^{*}\right)\tag{7.39}
$$

Assuming that $\boldsymbol{w}^{(0)} = 0$ and that $\epsilon$ is chosen to be small enough to guarantee $|1 - \epsilon\lambda_{i}| < 1$ , the parameter trajectory during training after $\tau$ parameter updates is as follows:

$$
\boldsymbol{Q}^{\top} \boldsymbol{w}^{(\tau)} =[\boldsymbol{I} -(\boldsymbol{I} - \epsilon \boldsymbol{\Lambda})^{\tau}] \boldsymbol{Q}^{\top} \boldsymbol{w}^{*}.\tag{7.40}
$$

Now, the expression for $Q^{\top}\tilde{w}$ in equation 7.13 for $L^{2}$ regularization can be rearranged as

$$
\boldsymbol{Q}^{\top} \tilde{\boldsymbol{w}} =(\boldsymbol{\Lambda} + \alpha \boldsymbol{I})^{- 1} \boldsymbol{\Lambda} \boldsymbol{Q}^{\top} \boldsymbol{w}^{*},\tag{7.41}
$$

$$
\boldsymbol{Q}^{\top} \tilde{\boldsymbol{w}} =[\boldsymbol{I} -(\boldsymbol{\Lambda} + \alpha \boldsymbol{I})^{- 1} \alpha] \boldsymbol{Q}^{\top} \boldsymbol{w}^{*}.\tag{7.42}
$$

Comparing equation 7.40 and equation 7.42, we see that if the hyperparameters $\epsilon$ , $\alpha$ , and $\tau$ are chosen such that

$$
\left(\boldsymbol{I} - \epsilon \boldsymbol{\Lambda}\right)^{\tau} = \left(\boldsymbol{\Lambda} + \alpha \boldsymbol{I}\right)^{- 1} \alpha,\tag{7.43}
$$

then $L^{2}$ regularization and early stopping can be seen as equivalent (at least under the quadratic approximation of the objective function). Going even further, by taking logarithms and using the series expansion for $\log(1+x)$ , we can conclude that if all $\lambda_{i}$ are small (that is, $\epsilon\lambda_{i}\ll1$ and $\lambda_{i}/\alpha\ll1$ ) then

$$
\tau \approx \frac{1}{\epsilon \alpha},\tag{7.44}
$$

$$
\alpha \approx \frac{1}{\tau \epsilon}.\tag{7.45}
$$

That is, under these assumptions, the number of training iterations $\tau$ plays a role inversely proportional to the $L^2$ regularization parameter, and the inverse of $\tau \epsilon$ plays the role of the weight decay coefficient.

Parameter values corresponding to directions of significant curvature (of the objective function) are regularized less than directions of less curvature. Of course, in the context of early stopping, this really means that parameters that correspond to directions of significant curvature tend to learn early relative to parameters corresponding to directions of less curvature.

The derivations in this section have shown that a trajectory of length $\tau$ ends at a point that corresponds to a minimum of the $L^{2}$ -regularized objective. Early stopping is of course more than the mere restriction of the trajectory length; instead, early stopping typically involves monitoring the validation set error in order to stop the trajectory at a particularly good point in space. Early stopping therefore has the advantage over weight decay in that it automatically determines the correct amount of regularization while weight decay requires many training experiments with different values of its hyperparameter.

## 7.9 Parameter Tying and Parameter Sharing

Thus far, in this chapter, when we have discussed adding constraints or penalties to the parameters, we have always done so with respect to a fixed region or point. For example, $L^{2}$ regularization (or weight decay) penalizes model parameters for deviating from the fixed value of zero. Sometimes, however, we may need other ways to express our prior knowledge about suitable values of the model parameters. Sometimes we might not know precisely what values the parameters should take, but we know, from knowledge of the domain and model architecture, that there should be some dependencies between the model parameters.

A common type of dependency that we often want to express is that certain parameters should be close to one another. Consider the following scenario: we have two models performing the same classification task (with the same set of classes) but with somewhat different input distributions. Formally, we have model A with parameters $\boldsymbol{w}^{(A)}$ and model B with parameters $\boldsymbol{w}^{(B)}$ . The two models map the input to two different but related outputs: $\hat{y}^{(A)} = f(\boldsymbol{w}^{(A)}, \boldsymbol{x})$ and $\hat{y}^{(B)} = g(\boldsymbol{w}^{(B)}, \boldsymbol{x})$ .

Let us imagine that the tasks are similar enough (perhaps with similar input and output distributions) that we believe the model parameters should be close to each other: $\forall i, w_{i}^{(A)}$ should be close to $w_{i}^{(B)}$ . We can leverage this information through regularization. Specifically, we can use a parameter norm penalty of the form $\Omega(\boldsymbol{w}^{(A)}, \boldsymbol{w}^{(B)}) = \| \boldsymbol{w}^{(A)} - \boldsymbol{w}^{(B)} \|_{2}^{2}$ . Here we used an $L^{2}$ penalty, but other choices are also possible.

This kind of approach was proposed by Lasserre et al. (2006), who regularized the parameters of one model, trained as a classifier in a supervised paradigm, to be close to the parameters of another model, trained in an unsupervised paradigm (to capture the distribution of the observed input data). The architectures were constructed such that many of the parameters in the classifier model could be paired to corresponding parameters in the unsupervised model.

While a parameter norm penalty is one way to regularize parameters to be close to one another, the more popular way is to use constraints: to force sets of parameters to be equal. This method of regularization is often referred to as parameter sharing, because we interpret the various models or model components as sharing a unique set of parameters. A significant advantage of parameter sharing over regularizing the parameters to be close (via a norm penalty) is that only a subset of the parameters (the unique set) needs to be stored in memory. In certain models—such as the convolutional neural network—this can lead to significant reduction in the memory footprint of the model.

## 7.9.1 Convolutional Neural Networks

By far the most popular and extensive use of parameter sharing occurs in convolutional neural networks (CNNs) applied to computer vision.

Natural images have many statistical properties that are invariant to translation. For example, a photo of a cat remains a photo of a cat if it is translated one pixel to the right. CNNs take this property into account by sharing parameters across multiple image locations. The same feature (a hidden unit with the same weights) is computed over different locations in the input. This means that we can find a cat with the same cat detector whether the cat appears at column i or column $i + 1$ in the image.

Parameter sharing has enabled CNNs to dramatically lower the number of unique model parameters and to significantly increase network sizes without requiring a corresponding increase in training data. It remains one of the best examples of how to effectively incorporate domain knowledge into the network architecture.

CNNs are discussed in more detail in chapter 9.

## 7.10 Sparse Representations

Weight decay acts by placing a penalty directly on the model parameters. Another strategy is to place a penalty on the activations of the units in a neural network, encouraging their activations to be sparse. This indirectly imposes a complicated penalty on the model parameters.

We have already discussed (in section 7.1.2) how $L^1$ penalization induces a sparse parametrization—meaning that many of the parameters become zero (or close to zero). Representational sparsity, on the other hand, describes a representation where many of the elements of the representation are zero (or close to zero). A simplified view of this distinction can be illustrated in the context of linear regression:

$$
\begin{array}{l} \left[\begin{array}{c} 18 \\ 5 \\ 15 \\ - 9 \\ - 3 \end{array} \right] = \left[\begin{array}{cccccc} 4 & 0 & 0 & - 2 & 0 & 0 \\ 0 & 0 & - 1 & 0 & 3 & 0 \\ 0 & 5 & 0 & 0 & 0 & 0 \\ 1 & 0 & 0 & - 1 & 0 & - 4 \\ 1 & 0 & 0 & 0 & - 5 & 0 \end{array} \right] \\ \boldsymbol{y} \in \mathbb{R}^{m} \qquad \qquad \qquad \qquad \boldsymbol{A} \in \mathbb{R}^{m \times n} \qquad \qquad \qquad \boldsymbol{x} \in \mathbb{R}^{n} \end{array}\tag{7.46}
$$

$$
\begin{array}{l} \left[\begin{array}{c} - 14 \\ 1 \\ 19 \\ 2 \\ 23 \end{array} \right] = \left[\begin{array}{cccccc} 3 & - 1 & 2 & - 5 & 4 & 1 \\ 4 & 2 & - 3 & - 1 & 1 & 3 \\ - 1 & 5 & 4 & 2 & - 3 & - 2 \\ 3 & 1 & 2 & - 3 & 0 & - 3 \\ - 5 & 4 & - 2 & 2 & - 5 & - 1 \end{array} \right] \\ \boldsymbol{y} \in \mathbb{R}^{m} \quad \boldsymbol{B} \in \mathbb{R}^{m \times n} \quad \boldsymbol{h} \in \mathbb{R}^{n} \end{array}\tag{7.47}
$$

In the first expression, we have an example of a sparsely parametrized linear regression model. In the second, we have linear regression with a sparse representation h of the data x. That is, h is a function of x that, in some sense, represents the information present in x, but does so with a sparse vector.

Representational regularization is accomplished by the same sorts of mechanisms that we have used in parameter regularization.

Norm penalty regularization of representations is performed by adding to the loss function J a norm penalty on the representation. This penalty is denoted $\Omega(\boldsymbol{h})$ . As before, we denote the regularized loss function by $\tilde{J}$ :

$$
\tilde{J}(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) = J(\boldsymbol{\theta}; \boldsymbol{X}, \boldsymbol{y}) + \alpha \Omega(\boldsymbol{h}),\tag{7.48}
$$

where $\alpha\in[0,\infty)$ weights the relative contribution of the norm penalty term, with larger values of $\alpha$ corresponding to more regularization.

Just as an $L^{1}$ penalty on the parameters induces parameter sparsity, an $L^{1}$ penalty on the elements of the representation induces representational sparsity: $\Omega(\boldsymbol{h}) = ||\boldsymbol{h}||_{1} = \sum_{i} |h_{i}|$ . Of course, the $L^{1}$ penalty is only one choice of penalty that can result in a sparse representation. Others include the penalty derived from a Student t prior on the representation (Olshausen and Field, 1996; Bergstra, 2011) and KL divergence penalties (Larochelle and Bengio, 2008), which are especially useful for representations with elements constrained to lie on the unit interval. Lee et al. (2008) and Goodfellow et al. (2009) both provide examples of strategies based on regularizing the average activation across several examples, $\frac{1}{m}\sum_{i}\boldsymbol{h}^{(i)}$ , to be near some target value, such as a vector with .01 for each entry.

Other approaches obtain representational sparsity with a hard constraint on the activation values. For example, orthogonal matching pursuit (Pati et al., 1993) encodes an input x with the representation h that solves the constrained optimization problem

$$
\operatorname{argmin}_{\substack{\boldsymbol{h},\| \boldsymbol{h}\|_{0} < k}}\| \boldsymbol{x} - \boldsymbol{W}\boldsymbol{h}\|^{2},\tag{7.49}
$$

where $\|h\|_{0}$ is the number of nonzero entries of h. This problem can be solved efficiently when W is constrained to be orthogonal. This method is often called

OMP-k, with the value of k specified to indicate the number of nonzero features allowed. Coates and Ng (2011) demonstrated that OMP-1 can be a very effective feature extractor for deep architectures.

Essentially any model that has hidden units can be made sparse. Throughout this book, we see many examples of sparsity regularization used in various contexts.

## 7.11 Bagging and Other Ensemble Methods

Bagging (short for bootstrap aggregating) is a technique for reducing generalization error by combining several models (Breiman, 1994). The idea is to train several different models separately, then have all the models vote on the output for test examples. This is an example of a general strategy in machine learning called model averaging. Techniques employing this strategy are known as ensemble methods.

The reason that model averaging works is that different models will usually not make all the same errors on the test set.

Consider for example a set of k regression models. Suppose that each model makes an error $\epsilon_{i}$ on each example, with the errors drawn from a zero-mean multivariate normal distribution with variances $E[\epsilon_{i}^{2}] = v$ and covariances $E[\epsilon_{i}\epsilon_{j}] = c$ . Then the error made by the average prediction of all the ensemble models is $\frac{1}{k}\sum_{i}\epsilon_{i}$ . The expected squared error of the ensemble predictor is

$$
\begin{array}{c} \mathbb{E} \left[\left(\frac{1}{k} \sum_{i} \epsilon_{i}\right)^{2} \right] = \frac{1}{k^{2}} \mathbb{E} \left[\sum_{i} \left(\epsilon_{i}^{2} + \sum_{j \neq i} \epsilon_{i} \epsilon_{j}\right) \right], \\ = \frac{1}{k} v + \frac{k - 1}{k} c.\end{array}\tag{7.50}
$$

(7.51)

In the case where the errors are perfectly correlated and c = v, the mean squared error reduces to v, so the model averaging does not help at all. In the case where the errors are perfectly uncorrelated and c = 0, the expected squared error of the ensemble is only $\frac{1}{k}v$ . This means that the expected squared error of the ensemble decreases linearly with the ensemble size. In other words, on average, the ensemble will perform at least as well as any of its members, and if the members make independent errors, the ensemble will perform significantly better than its members.

Different ensemble methods construct the ensemble of models in different ways. For example, each member of the ensemble could be formed by training a completely different kind of model using a different algorithm or objective function. Bagging is a method that allows the same kind of model, training algorithm and objective function to be reused several times.

Specifically, bagging involves constructing k different datasets. Each dataset has the same number of examples as the original dataset, but each dataset is constructed by sampling with replacement from the original dataset. This means that, with high probability, each dataset is missing some of the examples from the original dataset and contains several duplicate examples (on average around two-thirds of the examples from the original dataset are found in the resulting training set, if it has the same size as the original). Model i is then trained on dataset i. The differences between which examples are included in each dataset result in differences between the trained models. See figure 7.5 for an example.

Neural networks reach a wide enough variety of solution points that they can often benefit from model averaging even if all the models are trained on the same dataset. Differences in random initialization, in random selection of minibatches, in hyperparameters, or in outcomes of nondeterministic implementations of neural networks are often enough to cause different members of the ensemble to make partially independent errors.

![Figure 7.5](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/364425e64feb93f8dd774cdb76758ed2defcfe7b25e052ce80fb2b98cfb2ddfd.jpg)  
Figure 7.5: A cartoon depiction of how bagging works. Suppose we train an 8 detector on the dataset depicted above, containing an 8, a 6 and a 9. Suppose we make two different resampled datasets. The bagging training procedure is to construct each of these datasets by sampling with replacement. The first dataset omits the 9 and repeats the 8. On this dataset, the detector learns that a loop on top of the digit corresponds to an 8. On the second dataset, we repeat the 9 and omit the 6. In this case, the detector learns that a loop on the bottom of the digit corresponds to an 8. Each of these individual classification rules is brittle, but if we average their output, then the detector is robust, achieving maximal confidence only when both loops of the 8 are present.

Model averaging is an extremely powerful and reliable method for reducing generalization error. Its use is usually discouraged when benchmarking algorithms for scientific papers, because any machine learning algorithm can benefit substantially from model averaging at the price of increased computation and memory. For this reason, benchmark comparisons are usually made using a single model.

Machine learning contests are usually won by methods using model averaging over dozens of models. A recent prominent example is the Netflix Grand Prize (Koren, 2009).

Not all techniques for constructing ensembles are designed to make the ensemble more regularized than the individual models. For example, a technique called boosting (Freund and Schapire, 1996b,a) constructs an ensemble with higher capacity than the individual models. Boosting has been applied to build ensembles of neural networks (Schwenk and Bengio, 1998) by incrementally adding neural networks to the ensemble. Boosting has also been applied interpreting an individual neural network as an ensemble (Bengio et al., 2006a), incrementally adding hidden units to the network.

## 7.12 Dropout

Dropout (Srivastava et al., 2014) provides a computationally inexpensive but powerful method of regularizing a broad family of models. To a first approximation, dropout can be thought of as a method of making bagging practical for ensembles of very many large neural networks. Bagging involves training multiple models and evaluating multiple models on each test example. This seems impractical when each model is a large neural network, since training and evaluating such networks is costly in terms of runtime and memory. It is common to use ensembles of five to ten neural networks Szegedy et al. (2014a) used six to win the ILSVRC—but more than this rapidly becomes unwieldy. Dropout provides an inexpensive approximation to training and evaluating a bagged ensemble of exponentially many neural networks.

Specifically, dropout trains the ensemble consisting of all subnetworks that can be formed by removing nonoutput units from an underlying base network. as illustrated in figure 7.6. In most modern neural networks, based on a series of affine transformations and nonlinearities, we can effectively remove a unit from a network by multiplying its output value by zero. This procedure requires some slight modification for models such as radial basis function networks, which take the difference between the unit's state and some reference value. Here, we present the dropout algorithm in terms of multiplication by zero for simplicity, but it can be trivially modified to work with other operations that remove a unit from the network.

![Figure 7.6](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/65a33d53f8c35088eeb3e723edbefe52a20103b026d52ab33714b18aa564e40b.jpg)  
Figure 7.6: Dropout trains an ensemble consisting of all subnetworks that can be constructed by removing nonoutput units from an underlying base network. Here, we begin with a base network with two visible units and two hidden units. There are sixteen possible subsets of these four units. We show all sixteen subnetworks that may be formed by dropping out different subsets of units from the original network. In this small example, a large proportion of the resulting networks have no input units or no path connecting the input to the output. This problem becomes insignificant for networks with wider layers, where the probability of dropping all possible paths from inputs to outputs becomes smaller.

Recall that to learn with bagging, we define k different models, construct k different datasets by sampling from the training set with replacement, and then train model i on dataset i. Dropout aims to approximate this process, but with an exponentially large number of neural networks. Specifically, to train with dropout, we use a minibatch-based learning algorithm that makes small steps, such as stochastic gradient descent. Each time we load an example into a minibatch, we randomly sample a different binary mask to apply to all the input and hidden units in the network. The mask for each unit is sampled independently from all the others. The probability of sampling a mask value of one (causing a unit to be included) is a hyperparameter fixed before training begins. It is not a function of the current value of the model parameters or the input example. Typically, an input unit is included with probability 0.8, and a hidden unit is included with probability 0.5. We then run forward propagation, back-propagation, and the learning update as usual. Figure 7.7 illustrates how to run forward propagation with dropout.

More formally, suppose that a mask vector $\mu$ specifies which units to include, and $J(\theta,\mu)$ defines the cost of the model defined by parameters $\theta$ and mask $\mu$ . Then dropout training consists of minimizing $\mathbb{E}_{\mu}J(\theta,\mu)$ . The expectation contains exponentially many terms, but we can obtain an unbiased estimate of its gradient by sampling values of $\mu$ .

Dropout training is not quite the same as bagging training. In the case of bagging, the models are all independent. In the case of dropout, the models share parameters, with each model inheriting a different subset of parameters from the parent neural network. This parameter sharing makes it possible to represent an exponential number of models with a tractable amount of memory. In the case of bagging, each model is trained to convergence on its respective training set. In the case of dropout, typically most models are not explicitly trained at all—usually, the model is large enough that it would be infeasible to sample all possible subnetworks within the lifetime of the universe. Instead, a tiny fraction of the possible subnetworks are each trained for a single step, and the parameter sharing causes the remaining subnetworks to arrive at good settings of the parameters. These are the only differences. Beyond these, dropout follows the bagging algorithm. For example, the training set encountered by each subnetwork is indeed a subset of the original training set sampled with replacement.

To make a prediction, a bagged ensemble must accumulate votes from all its members. We refer to this process as inference in this context. So far, our description of bagging and dropout has not required that the model be explicitly probabilistic. Now, we assume that the model's role is to output a probability distribution. In the case of bagging, each model i produces a probability distribution $p^{(i)}(y \mid x)$ . The prediction of the ensemble is given by the arithmetic mean of all these distributions,

$$
\frac{1}{k} \sum_{i = 1}^{k} p^{(i)}(y \mid \boldsymbol{x}).\tag{7.52}
$$

![Figure 7.7](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/65a6a09f0796bc335c5d990e02d4e74a429aeb28b466dadfaba612b1067615b0.jpg)  
Figure 7.7: An example of forward propagation through a feedforward network using dropout. (Top)In this example, we use a feedforward network with two input units, one hidden layer with two hidden units, and one output unit. (Bottom)To perform forward propagation with dropout, we randomly sample a vector $\mu$ with one entry for each input or hidden unit in the network. The entries of $\mu$ are binary and are sampled independently from each other. The probability of each entry being 1 is a hyperparameter, usually 0.5 for the hidden layers and 0.8 for the input. Each unit in the network is multiplied by the corresponding mask, and then forward propagation continues through the rest of the network as usual. This is equivalent to randomly selecting one of the sub-networks from figure 7.6 and running forward propagation through it.

In the case of dropout, each submodel defined by mask vector $\mu$ defines a probability distribution $p(y \mid x, \mu)$ . The arithmetic mean over all masks is given by

$$
\sum_{\boldsymbol{\mu}} p(\boldsymbol{\mu}) p(y \mid \boldsymbol{x}, \boldsymbol{\mu}),\tag{7.53}
$$

where $p(\boldsymbol{\mu})$ is the probability distribution that was used to sample $\mu$ at training time.

Because this sum includes an exponential number of terms, it is intractable to evaluate except when the structure of the model permits some form of simplification. So far, deep neural nets are not known to permit any tractable simplification. Instead, we can approximate the inference with sampling, by averaging together the output from many masks. Even 10–20 masks are often sufficient to obtain good performance.

An even better approach, however, allows us to obtain a good approximation to the predictions of the entire ensemble, at the cost of only one forward propagation. To do so, we change to using the geometric mean rather than the arithmetic mean of the ensemble members' predicted distributions. Warde-Farley et al. (2014) present arguments and empirical evidence that the geometric mean performs comparably to the arithmetic mean in this context.

The geometric mean of multiple probability distributions is not guaranteed to be a probability distribution. To guarantee that the result is a probability distribution, we impose the requirement that none of the submodels assigns probability 0 to any event, and we renormalize the resulting distribution. The unnormalized probability distribution defined directly by the geometric mean is given by

$$
\tilde{p}_{\text{ensemble}}(y \mid \boldsymbol{x}) = \sqrt[2^{d}]{\prod_{\boldsymbol{\mu}} p(y \mid \boldsymbol{x}, \boldsymbol{\mu})},\tag{7.54}
$$

where d is the number of units that may be dropped. Here we use a uniform distribution over $\mu$ to simplify the presentation, but nonuniform distributions are also possible. To make predictions we must renormalize the ensemble:

$$
p_{\text{ensemble}}(y \mid \boldsymbol{x}) = \frac{\tilde{p}_{\text{ensemble}}(y \mid \boldsymbol{x})}{\sum_{y^{\prime}} \tilde{p}_{\text{ensemble}}(y^{\prime} \mid \boldsymbol{x})}.\tag{7.55}
$$

A key insight (Hinton et al., 2012c) involved in dropout is that we can approximate $p_{\text{ensemble}}$ by evaluating $p(y \mid x)$ in one model: the model with all units, but with the weights going out of unit $i$ multiplied by the probability of including unit $i$ . The motivation for this modification is to capture the right expected value of the output from that unit. We call this approach the weight scaling inference rule. There is not yet any theoretical argument for the accuracy of this approximate inference rule in deep nonlinear networks, but empirically it performs very well.

Because we usually use an inclusion probability of $\frac{1}{2}$ , the weight scaling rule usually amounts to dividing the weights by 2 at the end of training, and then using the model as usual. Another way to achieve the same result is to multiply the states of the units by 2 during training. Either way, the goal is to make sure that the expected total input to a unit at test time is roughly the same as the expected total input to that unit at train time, even though half the units at train time are missing on average.

For many classes of models that do not have nonlinear hidden units, the weight scaling inference rule is exact. For a simple example, consider a softmax regression classifier with n input variables represented by the vector v:

$$
P_{*}(y = y \mid \mathbf{v}) = \operatorname{softmax} \left(\boldsymbol{W}^{\top} \mathbf{v} + \boldsymbol{b}\right)_{y}.\tag{7.56}
$$

We can index into the family of submodels by element-wise multiplication of the input with a binary vector d:

$$
P(y = y \mid \mathbf{v}; \boldsymbol{d}) = \operatorname{softmax} \left(\boldsymbol{W}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + \boldsymbol{b}\right)_{y}.\tag{7.57}
$$

The ensemble predictor is defined by renormalizing the geometric mean over all ensemble members' predictions:

$$
P_{\mathrm{ensemble}}(y = y \mid \mathbf{v}) = \frac{\tilde{P}_{\mathrm{ensemble}}(y = y \mid \mathbf{v})}{\sum_{y^{\prime}} \tilde{P}_{\mathrm{ensemble}}(y = y^{\prime} \mid \mathbf{v})},\tag{7.58}
$$

where

$$
\tilde{P}_{\text{ensemble}}(y = y \mid \mathbf{v}) = \sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} P(y = y \mid \mathbf{v}; \boldsymbol{d})}.\tag{7.59}
$$

To see that the weight scaling rule is exact, we can simplify $\tilde{P}_{\mathrm{ensemble}}$ :

$$
\tilde{P}_{\text{ensemble}}(y = y \mid \mathbf{v}) = \sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} P(y = y \mid \mathbf{v}; \boldsymbol{d})}\tag{7.60}
$$

$$
= \sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} \operatorname{softmax} \left(\boldsymbol{W}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + \boldsymbol{b}\right)_{y}}\tag{7.61}
$$

$$
\begin{array}{l} = \sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} \frac{\exp \left(\boldsymbol{W}_{y, :}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y}\right)}{\sum_{y^{\prime}} \exp \left(\boldsymbol{W}_{y^{\prime}, :}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y^{\prime}}\right)}} \\ = \frac{\sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} \exp \left(\boldsymbol{W}_{y, :}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y}\right)}}{\sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} \sum_{y^{\prime}} \exp \left(\boldsymbol{W}_{y^{\prime}, :}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y^{\prime}}\right)}} \end{array}\tag{7.62}
$$

(7.63)

Because $\tilde{P}$ will be normalized, we can safely ignore multiplication by factors that are constant with respect to y:

$$
\tilde{P}_{\text{ensemble}}(y = y \mid \mathbf{v}) \propto \sqrt[2^{n}]{\prod_{\boldsymbol{d} \in \{0, 1\}^{n}} \exp \left(\boldsymbol{W}_{y, :}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y}\right)}\tag{7.64}
$$

$$
\begin{array}{l} = \exp \left(\frac{1}{2^{n}} \sum_{\boldsymbol{d} \in \{0, 1\}^{n}} \boldsymbol{W}_{y,:}^{\top}(\boldsymbol{d} \odot \mathbf{v}) + b_{y}\right) \\ = \exp \left(\frac{1}{2} \boldsymbol{W}_{y,:}^{\top} \mathbf{v} + b_{y}\right).\end{array}\tag{7.65}
$$

(7.66)

Substituting this back into equation 7.58, we obtain a softmax classifier with weights $\frac{1}{2}\mathbf{W}$ .

The weight scaling rule is also exact in other settings, including regression networks with conditionally normal outputs as well as deep networks that have hidden layers without nonlinearities. However, the weight scaling rule is only an approximation for deep models that have nonlinearities. Though the approximation has not been theoretically characterized, it often works well, empirically. Goodfellow et al. (2013a) found experimentally that the weight scaling approximation can work better (in terms of classification accuracy) than Monte Carlo approximations to the ensemble predictor. This held true even when the Monte Carlo approximation was allowed to sample up to 1,000 subnetworks. Gal and Ghahramani (2015) found that some models obtain better classification accuracy using twenty samples and the Monte Carlo approximation. It appears that the optimal choice of inference approximation is problem dependent.

Srivastava et al. (2014) showed that dropout is more effective than other standard computationally inexpensive regularizers, such as weight decay, filter norm constraints, and sparse activity regularization. Dropout may also be combined with other forms of regularization to yield a further improvement.

One advantage of dropout is that it is very computationally cheap. Using dropout during training requires only $O(n)$ computation per example per update, to generate n random binary numbers and multiply them by the state. Depending on the implementation, it may also require $O(n)$ memory to store these binary numbers until the back-propagation stage. Running inference in the trained model has the same cost per example as if dropout were not used, though we must pay the cost of dividing the weights by 2 once before beginning to run inference on examples.

Another significant advantage of dropout is that it does not significantly limit the type of model or training procedure that can be used. It works well with nearly any model that uses a distributed representation and can be trained with stochastic gradient descent. This includes feedforward neural networks, probabilistic models such as restricted Boltzmann machines (Srivastava et al., 2014), and recurrent neural networks (Bayer and Osendorfer, 2014; Pascanu et al., 2014a). Many other regularization strategies of comparable power impose more severe restrictions on the architecture of the model.

Though the cost per step of applying dropout to a specific model is negligible, the cost of using dropout in a complete system can be significant. Because dropout is a regularization technique, it reduces the effective capacity of a model. To offset this effect, we must increase the size of the model. Typically the optimal validation set error is much lower when using dropout, but this comes at the cost of a much larger model and many more iterations of the training algorithm. For very large datasets, regularization confers little reduction in generalization error. In these cases, the computational cost of using dropout and larger models may outweigh the benefit of regularization.

When extremely few labeled training examples are available, dropout is less effective. Bayesian neural networks (Neal, 1996) outperform dropout on the Alternative Splicing Dataset (Xiong et al., 2011), where fewer than 5,000 examples are available (Srivastava et al., 2014). When additional unlabeled data is available, unsupervised feature learning can gain an advantage over dropout.

Wager et al. (2013) showed that, when applied to linear regression, dropout is equivalent to $L^2$ weight decay, with a different weight decay coefficient for each input feature. The magnitude of each feature's weight decay coefficient is determined by its variance. Similar results hold for other linear models. For deep models, dropout is not equivalent to weight decay.

The stochasticity used while training with dropout is not necessary for the approach's success. It is just a means of approximating the sum over all submodels. Wang and Manning (2013) derived analytical approximations to this marginalization. Their approximation, known as fast dropout, resulted in faster convergence time due to the reduced stochasticity in the computation of the gradient. This method can also be applied at test time, as a more principled (but also more computationally expensive) approximation to the average over all sub-networks than the weight scaling approximation. Fast dropout has been used to nearly match the performance of standard dropout on small neural network problems, but has not yet yielded a significant improvement or been applied to a large problem.

Just as stochasticity is not necessary to achieve the regularizing effect of dropout, it is also not sufficient. To demonstrate this, Warde-Farley et al. (2014) designed control experiments using a method called dropout boosting, which they designed to use exactly the same mask noise as traditional dropout but lack its regularizing effect. Dropout boosting trains the entire ensemble to jointly maximize the log-likelihood on the training set. In the same sense that traditional dropout is analogous to bagging, this approach is analogous to boosting. As intended, experiments with dropout boosting show almost no regularization effect compared to training the entire network as a single model. This demonstrates that the interpretation of dropout as bagging has value beyond the interpretation of dropout as robustness to noise. The regularization effect of the bagged ensemble is only achieved when the stochastically sampled ensemble members are trained to perform well independently of each other.

Dropout has inspired other stochastic approaches to training exponentially large ensembles of models that share weights. DropConnect is a special case of dropout where each product between a single scalar weight and a single hidden unit state is considered a unit that can be dropped (Wan et al., 2013). Stochastic pooling is a form of randomized pooling (see section 9.3) for building ensembles of convolutional networks, with each convolutional network attending to different spatial locations of each feature map. So far, dropout remains the most widely used implicit ensemble method.

One of the key insights of dropout is that training a network with stochastic behavior and making predictions by averaging over multiple stochastic decisions implements a form of bagging with parameter sharing. Earlier, we described dropout as bagging an ensemble of models formed by including or excluding units. Yet this model averaging strategy does not need to be based on inclusion and exclusion. In principle, any kind of random modification is admissible. In practice, we must choose modification families that neural networks are able to learn to resist. Ideally, we should also use model families that allow a fast approximate inference rule. We can think of any form of modification parametrized by a vector $\mu$ as training an ensemble consisting of $p(y \mid x, \mu)$ for all possible values of $\mu$ . There is no requirement that $\mu$ have a finite number of values. For example, $\mu$ can be real valued. Srivastava et al. (2014) showed that multiplying the weights by $\boldsymbol{\mu} \sim \mathcal{N}(\mathbf{1}, I)$ can outperform dropout based on binary masks. Because $E[\boldsymbol{\mu}] = \mathbf{1}$ , the standard network automatically implements approximate inference in the ensemble, without needing any weight scaling.

So far we have described dropout purely as a means of performing efficient, approximate bagging. Another view of dropout goes further than this. Dropout trains not just a bagged ensemble of models, but an ensemble of models that share hidden units. This means each hidden unit must be able to perform well regardless of which other hidden units are in the model. Hidden units must be prepared to be swapped and interchanged between models. Hinton et al. (2012c) were inspired by an idea from biology: sexual reproduction, which involves swapping genes between two different organisms, creates evolutionary pressure for genes to become not just good but readily swapped between different organisms. Such genes and such features are robust to changes in their environment because they are not able to incorrectly adapt to unusual features of any one organism or model. Dropout thus regularizes each hidden unit to be not merely a good feature but a feature that is good in many contexts. Warde-Farley et al. (2014) compared dropout training to training of large ensembles and concluded that dropout offers additional improvements to generalization error beyond those obtained by ensembles of independent models.

It is important to understand that a large portion of the power of dropout arises from the fact that the masking noise is applied to the hidden units. This can be seen as a form of highly intelligent, adaptive destruction of the information content of the input rather than destruction of the raw values of the input. For example, if the model learns a hidden unit $h_{i}$ that detects a face by finding the nose, then dropping $h_{i}$ corresponds to erasing the information that there is a nose in the image. The model must learn another $h_{i}$ , that either redundantly encodes the presence of a nose or detects the face by another feature, such as the mouth. Traditional noise injection techniques that add unstructured noise at the input are not able to randomly erase the information about a nose from an image of a face unless the magnitude of the noise is so great that nearly all the information in the image is removed. Destroying extracted features rather than original values allows the destruction process to make use of all the knowledge about the input distribution that the model has acquired so far.

Another important aspect of dropout is that the noise is multiplicative. If the noise were additive with fixed scale, then a rectified linear hidden unit $h_{i}$ with added noise $\epsilon$ could simply learn to have $h_{i}$ become very large in order to make the added noise $\epsilon$ insignificant by comparison. Multiplicative noise does not allow such a pathological solution to the noise robustness problem.

Another deep learning algorithm, batch normalization, reparametrizes the model in a way that introduces both additive and multiplicative noise on the hidden units at training time. The primary purpose of batch normalization is to improve optimization, but the noise can have a regularizing effect, and sometimes makes dropout unnecessary. Batch normalization is described further in section 8.7.1.

## 7.13 Adversarial Training

In many cases, neural networks have begun to reach human performance when evaluated on an i.i.d. test set. It is natural therefore to wonder whether these models have obtained a true human-level understanding of these tasks. To probe the level of understanding a network has of the underlying task, we can search for examples that the model misclassifies. Szegedy et al. (2014b) found that even neural networks that perform at human level accuracy have a nearly 100 percent error rate on examples that are intentionally constructed by using an optimization procedure to search for an input $\pmb{x}'$ near a data point $\pmb{x}$ such that the model output is very different at $\pmb{x}'$ . In many cases, $\pmb{x}'$ can be so similar to $\pmb{x}$ that a human observer cannot tell the difference between the original example and the adversarial example, but the network can make highly different predictions. See figure 7.8 for an example.

![Figure 7.8](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/2dd7a34e25d8fdf992eb5dac189bbbd194dbf78ef0ea751ac715f38add2503df.jpg)  
Figure 7.8: A demonstration of adversarial example generation applied to GoogLeNet (Szegedy et al., 2014a) on ImageNet. By adding an imperceptibly small vector whose elements are equal to the sign of the elements of the gradient of the cost function with respect to the input, we can change GoogLeNet's classification of the image. Reproduced with permission from Goodfellow et al. (2014b).

Adversarial examples have many implications, for example, in computer security, that are beyond the scope of this chapter. They are interesting in the context of regularization, however, because one can reduce the error rate on the original i.i.d. test set via adversarial training—training on adversarially perturbed examples from the training set (Szegedy et al., 2014b; Goodfellow et al., 2014b).

Goodfellow et al. (2014b) showed that one of the primary causes of these adversarial examples is excessive linearity. Neural networks are built out of primarily linear building blocks. In some experiments the overall function they implement proves to be highly linear as a result. These linear functions are easy to optimize. Unfortunately, the value of a linear function can change very rapidly if it has numerous inputs. If we change each input by $\epsilon$ , then a linear function with weights w can change by as much as $\epsilon||w||_{1}$ , which can be a very large amount if w is highdimensional. Adversarial training discourages this highly sensitive locally linear behavior by encouraging the network to be locally constant in the neighborhood of the training data. This can be seen as a way of explicitly introducing a local constancy prior into supervised neural nets.

Adversarial training helps to illustrate the power of using a large function family in combination with aggressive regularization. Purely linear models, like logistic regression, are not able to resist adversarial examples because they are forced to be linear. Neural networks are able to represent functions that can range from nearly linear to nearly locally constant and thus have the flexibility to capture linear trends in the training data while still learning to resist local perturbation.

Adversarial examples also provide a means of accomplishing semi-supervised learning. At a point x that is not associated with a label in the dataset, the model itself assigns some label $\hat{y}$ . The model's label $\hat{y}$ may not be the true label, but if the model is high quality, then $\hat{y}$ has a high probability of providing the true label. We can seek an adversarial example $x'$ that causes the classifier to output a label $y'$ with $y' \neq \hat{y}$ . Adversarial examples generated using not the true label but a label provided by a trained model are called virtual adversarial examples (Miyato et al., 2015). The classifier may then be trained to assign the same label to x and $x'$ . This encourages the classifier to learn a function that is robust to small changes anywhere along the manifold where the unlabeled data lie. The assumption motivating this approach is that different classes usually lie on disconnected manifolds, and a small perturbation should not be able to jump from one class manifold to another class manifold.

## 7.14 Tangent Distance, Tangent Prop and Manifold Tangent Classifier

Many machine learning algorithms aim to overcome the curse of dimensionality by assuming that the data lies near a low-dimensional manifold, as described in section 5.11.3.

One of the early attempts to take advantage of the manifold hypothesis is the tangent distance algorithm (Simard et al., 1993, 1998). It is a non-parametric nearest neighbor algorithm in which the metric used is not the generic Euclidean distance but one that is derived from knowledge of the manifolds near which probability concentrates. It is assumed that we are trying to classify examples, and that examples on the same manifold share the same category. Since the classifier should be invariant to the local factors of variation that correspond to movement on the manifold, it would make sense to use as nearest neighbor distance between points $x_{1}$ and $x_{2}$ the distance between the manifolds $M_{1}$ and $M_{2}$ to which they respectively belong. Although that may be computationally difficult (it would require solving an optimization problem, to find the nearest pair of points on $M_{1}$ and $M_{2}$ ), a cheap alternative that makes sense locally is to approximate $M_{i}$ by its tangent plane at $x_{i}$ and measure the distance between the two tangents, or between a tangent plane and a point. That can be achieved by solving a low-dimensional linear system (in the dimension of the manifolds). Of course, this algorithm requires one to specify the tangent vectors.

In a related spirit, the tangent prop algorithm (Simard et al., 1992) (figure 7.9) trains a neural net classifier with an extra penalty to make each output $f(\pmb{x})$ of the neural net locally invariant to known factors of variation. These factors of variation correspond to movement along the manifold near which examples of the same class concentrate. Local invariance is achieved by requiring $\nabla_{\pmb{x}}f(\pmb{x})$ to be orthogonal to the known manifold tangent vectors $\pmb{v}^{(i)}$ at $\pmb{x}$ , or equivalently that the directional derivative of $f$ at $\pmb{x}$ in the directions $\pmb{v}^{(i)}$ be small by adding a regularization penalty $\Omega$ :

$$
\Omega(f) = \sum_{i} \left(\left(\nabla_{\boldsymbol{x}} f(\boldsymbol{x})\right)^{\top} \boldsymbol{v}^{(i)}\right)^{2}.\tag{7.67}
$$

This regularizer can of course be scaled by an appropriate hyperparameter, and for most neural networks, we would need to sum over many outputs rather than the lone output $f(\boldsymbol{x})$ described here for simplicity. As with the tangent distance algorithm, the tangent vectors are derived a priori, usually from the formal knowledge of the effect of transformations, such as translation, rotation, and scaling in images. Tangent prop has been used not just for supervised learning (Simard et al., 1992) but also in the context of reinforcement learning (Thrun, 1995).

![Figure 7.9](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-002-pages-201-400/images/15eefe495173956709c9cdac89892da5bc069d920c2eb07da53dc690a5064cd6.jpg)  
Figure 7.9: Illustration of the main idea of the tangent prop algorithm (Simard et al., 1992) and manifold tangent classifier (Rifai et al., 2011c), which both regularize the classifier output function $f(\boldsymbol{x})$ . Each curve represents the manifold for a different class, illustrated here as a one-dimensional manifold embedded in a two-dimensional space. On one curve, we have chosen a single point and drawn a vector that is tangent to the class manifold (parallel to and touching the manifold) and a vector that is normal to the class manifold (orthogonal to the manifold). In multiple dimensions there may be many tangent directions and many normal directions. We expect the classification function to change rapidly as it moves in the direction normal to the manifold, and not to change as it moves along the class manifold. Both tangent propagation and the manifold tangent classifier regularize $f(\boldsymbol{x})$ to not change very much as x moves along the manifold. Tangent propagation requires the user to manually specify functions that compute the tangent directions (such as specifying that small translations of images remain in the same class manifold), while the manifold tangent classifier estimates the manifold tangent directions by training an autoencoder to fit the training data. The use of autoencoders to estimate manifolds is described in chapter 14.

Tangent propagation is closely related to dataset augmentation. In both cases, the user of the algorithm encodes his or her prior knowledge of the task by specifying a set of transformations that should not alter the output of the network. The difference is that in the case of dataset augmentation, the network is explicitly trained to correctly classify distinct inputs that were created by applying more than an infinitesimal amount of these transformations. Tangent propagation does not require explicitly visiting a new input point. Instead, it analytically regularizes the model to resist perturbation in the directions corresponding to the specified transformation. While this analytical approach is intellectually elegant, it has two major drawbacks. First, it only regularizes the model to resist infinitesimal perturbation. Explicit dataset augmentation confers resistance to larger perturbations. Second, the infinitesimal approach poses difficulties for models based on rectified linear units. These models can only shrink their derivatives by turning units off or shrinking their weights. They are not able to shrink their derivatives by saturating at a high value with large weights, as sigmoid or tanh units can. Dataset augmentation works well with rectified linear units because different subsets of rectified units can activate for different transformed versions of each original input.

Tangent propagation is also related to double backprop (Drucker and LeCun, 1992) and adversarial training (Szegedy et al., 2014b; Goodfellow et al., 2014b). Double backprop regularizes the Jacobian to be small, while adversarial training finds inputs near the original inputs and trains the model to produce the same output on these as on the original inputs. Tangent propagation and dataset augmentation using manually specified transformations both require that the model be invariant to certain specified directions of change in the input. Double backprop and adversarial training both require that the model should be invariant to all directions of change in the input as long as the change is small. Just as dataset augmentation is the non-infinitesimal version of tangent propagation, adversarial training is the non-infinitesimal version of double backprop.

The manifold tangent classifier (Rifai et al., 2011c), eliminates the need to know the tangent vectors a priori. As we will see in chapter 14, autoencoders can estimate the manifold tangent vectors. The manifold tangent classifier makes use of this technique to avoid needing user-specified tangent vectors. As illustrated in figure 14.10, these estimated tangent vectors go beyond the classical invariants that arise out of the geometry of images (such as translation, rotation, and scaling) and include factors that must be learned because they are object-specific (such as moving body parts). The algorithm proposed with the manifold tangent classifier is therefore simple: (1) use an autoencoder to learn the manifold structure by unsupervised learning, and (2) use these tangents to regularize a neural net classifier as in tangent prop (equation 7.67).

In this chapter, we have described most of the general strategies used to regularize neural networks. Regularization is a central theme of machine learning and as such will be revisited periodically in most of the remaining chapters. Another central theme of machine learning is optimization, described next.

